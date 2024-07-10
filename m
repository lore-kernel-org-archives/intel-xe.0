Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F0CC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 06:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442A110E174;
	Wed, 10 Jul 2024 06:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dn/cG/1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710510E174
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720592179; x=1752128179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HzHXEpINLftMxErbs70gmZlnSLfZHY3qPHPozC5vqAA=;
 b=Dn/cG/1ImRiAbIMrZDybztm5r0hW+wDbiHx9RLkZTyzAXsxC2664yYXB
 D294FOcULUbStbijStOsteJM0yM8FAYBIYcSlpTHG/ooCGPL4GfpkmRvW
 U6ifLQPY4UpUVn9F8oR6MzKZSTuiah27f1JuGTz1j2Ui9aezY/emfilBJ
 66yVUzx583Hq1k31VSQqnrnQOc4WZ3nKgiZlMc0c3Kt6m2a3iakiaDmMq
 C4AzS60tmdFlJDtM7LhhM0zHR3ar6n6zm3PUKGLBbRnseIBMx2fvAsddx
 WuTLltVvt/dYKMDUDZuB64jVeOMOj5sMRLeAMmLWOi+pZJZ/ROB4gkXA3 w==;
X-CSE-ConnectionGUID: NkhcojymTkSJ/aCqLWNFMA==
X-CSE-MsgGUID: Vx8HTrFjRoWYBTJK4TCwlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28482703"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="28482703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 23:16:19 -0700
X-CSE-ConnectionGUID: 45HXbnj+TJeUe92xF/kz4A==
X-CSE-MsgGUID: 6+1GtqwUT3GDofzrz8NTPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48765352"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 23:16:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:16:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:16:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 23:16:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 23:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSy9GSeqdcqo9S3jF1m7Vz7KcSj/JYoMOWnTBwRsuSMGv/EhpZxWrftb8oN+Dsak4KQo+/ahd8UxQnC8h3QovTkG7SllbnU/Y57SZ6u7Zic/d6rAAHY2PQtm9Bx0FFMwTi7PQqH3OhXtLDpyZyP7JwAu0l3NGQBDdsjpn8l7HlphESCVX5y80SIF3/xpzsAZgNrCyauvApuXA9ibGt45RXmcAEcOQ82V/ddqFfGVqRuI3rv+iBi+2PQvMxXN7EItvssCFkAMnxgRORCE1X83+tuiSUEvM/CmqKtYG2RAPS7Z6n/NevEXRvdoxvtVKI+K3/uRst/OCO37RpLRZS0O1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AciYm0qnmHC4W9XjhAnJglGOioGB3pCxdT/PaiIZaTw=;
 b=NYysVcQ0V3BJnotQS+0VN51xpK9y3oGi51dn+2ASeo/m2IM+j0WrkzvfrhnYbyZLa1XEH5msa6qF7JEM7v+uNhdzDLy7DgjAVWyeB4yBSJUsbw5ADQcdtcySC6sBCQYIGkTyyMo3jyKSGcLiJbhCr2kAU1oVF+kT/KkxBsR0nqFl8SMqziGfbndHjbcpth7amzgUynGDzlWeJ6D9ka8jFWTQOQ6nQvQTlf5HzPzwsOvNhthrJTGLV4lDcoyYFAeBnacx1JvUgPx9IIqtZa6f/w7EVDKMnQ+P2ohcrXxrIyaxGwVKbmkamIVRTktKr3ZZr/kjn52gF6r23iYTiL8W+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:16:12 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 06:16:12 +0000
Date: Tue, 9 Jul 2024 23:16:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 3/8] drm/xe/irq: add hw engine irq handler
Message-ID: <Zo4nKltQ6e39laRz@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-4-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-4-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 70acc4e7-b300-4100-d558-08dca0a7cc0e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PgLATYv4HA5vAT8PIHD3/eMLSCqlR82I7Zg8bbGZWRN0IcyqqokVXzshS2ld?=
 =?us-ascii?Q?hAMbSXw1c9Pb4GPGeOPd+GLrj0b0YERrHQBUz/z0LP4aap09ggKWqk6AHwan?=
 =?us-ascii?Q?+Ur+2RRtRQwMHVUXbFhtNQG9f9tV6h/zYWkYv7rpNiczKFCrPD6UhUGn2e5k?=
 =?us-ascii?Q?E0FWt/WtapEF0xKswB6gHhzjIXAlT7NmH4LDgRGvb3RQ2xGDRgHJXLH0NXbE?=
 =?us-ascii?Q?cDXomHrjGyGrcUuhV8TMU9fC14k+tB/7ot3Ajju8nu+uQ/HDH7izkqYRAzVl?=
 =?us-ascii?Q?JnPBGpejUVxKhkOUAl/C1hiGvwJAv7253zj4W+43iGvjfT5NwGMzwbIh85fL?=
 =?us-ascii?Q?jRgKTh8XpSTUHFQ6EgT7KFOiilBwQE0lPQy7rzNBtoWP/HRacr3VqVc8VpPT?=
 =?us-ascii?Q?cl5tiFforrEwaQEu39hI8+T4hoX4nOz4o7uQyEDijNWmJOVmzaU3zKrMZYZe?=
 =?us-ascii?Q?DdnnkyONEDTYUyhMz/jO3VChmxe2ejWtqNKuqyURk73eqpYVO9HlypRiCh5W?=
 =?us-ascii?Q?ZoYN9QjqRdiXe1zvkB31hFOC7+gTwytXR+2HEIIv8NjjOY5ctGubS+z57VeP?=
 =?us-ascii?Q?apmP+i8ves6tG2jrV2dv5/dydNhYaihgQ7EFuBWlXJSLZp9aR3A/MgewhmVg?=
 =?us-ascii?Q?gAq/spag06LtDWF/CQ+ek4qVVCAaCB1CUJSWyFP9Rsr8Tc5kUJV8Z17pg0Iu?=
 =?us-ascii?Q?zsYeXu7JENHJIAOWFJNeLwk5MmyYgTKMvQCvzOWC49jd1jDFRrRNj3UpOSXj?=
 =?us-ascii?Q?1fwgSNguHfaBqK0V+xVpsJDPeJDg3mOEPpKk5aRixPzD/tG55wmFLo1OJdwB?=
 =?us-ascii?Q?CaxhW9ZqdlFgZvoc7hDqMMYevTD3KXbwuX1DUMfkdsmcRLxog+u9aXKWrSeL?=
 =?us-ascii?Q?FJmkw+LHOzH3K/F1eIhaB2v4iGCNvJ1Hzvmjvv+VuRTLrUm3KJuFRUxnk9wz?=
 =?us-ascii?Q?5IRCOZzrJudyJcNRXVGaw3C0rzqFmPviLH7TZg+6JNA9Huv7BG7Wxtyg+7g7?=
 =?us-ascii?Q?QBRZCDnOGzZXXcocTw5cJT/iDF4uesPhUJLwgJAUdN9RvaxyTYyTEiPkzfzC?=
 =?us-ascii?Q?u27uxNS+hAd5jSK2IgWLgb3j1MfX33q+3Gnv7dJPQcEvvVcba2NLjU6ndFVk?=
 =?us-ascii?Q?Ea399js8Tlk4G7cQB9L7XGYg0+/xM4V8YNgy2ojOkkZdkyXnYD38F2G+8xrF?=
 =?us-ascii?Q?q3HxiG98CcebgSZTWQst9DNDoPjCUW8AsilnvYxEEaGpZFz8yUvFjYmN8k7f?=
 =?us-ascii?Q?fS2+nKevZ0wFJVNxlp6cKjAeRTyPl/9YxZ5RBDtlP9asl0D6JLS2D/1iTu9t?=
 =?us-ascii?Q?rEtcJrr6MWz7IUTmdviNWwqWhGzvPfQ2fypsTFAdMcOrIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wz2jiKr0uZ/ZT7oaUSr/a+i+I8DoscpoBroCjNt/lkPoe+vznxYVv6NsLDAb?=
 =?us-ascii?Q?68SEdUKz1OGlqouT0NkPcw4uN1KFBETUjdQg5GW0gYtNIv7hsbOtfDsBEq1D?=
 =?us-ascii?Q?EAWrm9Rqj5Zsmf5PoP+li/iixU+cBxuXvO2JXCUfEcWz0UlRnbD9HVitrJem?=
 =?us-ascii?Q?6SvBWzSmGMXciKp0m7DYOBBadgUJNqWYxG8QcYMoPUxvIuXZtPMOs5zpOCmF?=
 =?us-ascii?Q?S/+vUlgVvyjDkelThr6GzOx1LWv5ct5nT1pzL3JAxKhCNKyVtWYR7WxX/+U3?=
 =?us-ascii?Q?Lk+GxI4htG6ArxVYfzheTS0NAPEBwKTh/DXkK+9m4zFfFJhuYV4cofJ19hGl?=
 =?us-ascii?Q?Oru8GuVVwTQzgoVkNrrdQbp2tMBodQvFULVvIU2GWKhLolYykuV7Dc+lr9Ir?=
 =?us-ascii?Q?0jpk1fOAdm5thIQhtD34HDOkVSiuqSPioTxBlvrTQ5gi7Gj0KKtHHp5Wc8kX?=
 =?us-ascii?Q?/PdNpBz0IjdcWN9dfs8gui76tHhIjXlSrxeDu+YWyJHJS9uq09bRDWFZKTQr?=
 =?us-ascii?Q?mnn67jl7KNTo9i00yufxLbn/2KElAjcdLsRQAG4dRBTeLk31cpKrRWkNMAHz?=
 =?us-ascii?Q?GrTsT5iGEECmUwc6K3SOw5Intm8FTnaVsrCubaR4f15cMLQtGl1MfORdBSUw?=
 =?us-ascii?Q?rCPkRp8T5ZBOlXjn0khokYL5ccA/kHDVtC0v3+W/DFABGYlLSSyZMXuvp//o?=
 =?us-ascii?Q?rj4v0k4u64F9aV9w2GB8yf4IHw2QEHfOobyzApA7rSyUYDo/YsgdsnIgN4BB?=
 =?us-ascii?Q?1lSRDOgCUg08Ba0CVP3UZk0DOdNfhGOOCYjMWgYNceVHDwM9+4W/2GbpZ75r?=
 =?us-ascii?Q?9c4c0E4HSbeulDJfg8ERvlbP/k/7o48LhckikxCwJ990KnlAgCkpXMa9AY6M?=
 =?us-ascii?Q?R43sCIlGaYoiO9e70BOsythau8BjEaENcoOql/Jw/eUOD9bHIAUae3+ZvA45?=
 =?us-ascii?Q?OFRgz7qbjQnoEIOPBTIv4NDupw9x85zh5syAcjkTf2RY6mBUSrVlycMGaAEi?=
 =?us-ascii?Q?HvSZCHen6vOQbDo8IHYXBp4o9BXJgXtLUM4GybH0dV3swFf0ZbSYCP6nVlk8?=
 =?us-ascii?Q?NcX70nsrWlReQOCiCU1dyCEcgqGf0zd0OLy8JJNYHkmGTJHWFDhqa9TcTcOT?=
 =?us-ascii?Q?3JZvtHuXSxm1muRVDd37UTf9BF7+NDvVcFBwLM/S6L+03z/CTjY9H6mXTUQI?=
 =?us-ascii?Q?yvbfh7oTnd8E+s0BiKwH1yhGdi6TAx0gJXKhGlT5CE5CkkXnFIRaTRLLulBB?=
 =?us-ascii?Q?/A7TuATgn2VDljYhPYDAex5IvtKahSa5QwXthMmbVIbXarwf4PU0uBlFpHWj?=
 =?us-ascii?Q?oNvf2ET/ameRW1eBKEueQg3QsetuDl5Sz+B+tzyhPWhELMOqSGhvuapMmk7j?=
 =?us-ascii?Q?LpKu/439KV67mmsyoFaR3Yw8yhQnFmZjads2dicELI6DUQGCAqq0V/QAnDca?=
 =?us-ascii?Q?jOtEep/bSLzEQaY/9pxq3+LcsHgX1kO3VskreEu9GrCRZwkjA5wAuiizZxXs?=
 =?us-ascii?Q?kseTk7BPgZzNt9XjBmYpQw8xP3rtG2hjiLHiYWutg3TSUOza8q9kMQobu0tL?=
 =?us-ascii?Q?IbNpFnv88fmxboX2JyTIlAHnhrfzLYaz956iB4N6ktZKGVZN2ysOK0HAe3rc?=
 =?us-ascii?Q?iB4xdpf3EM6y1fc+cXlIcdo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70acc4e7-b300-4100-d558-08dca0a7cc0e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:16:12.4629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eempi3v7zLUwu3mWU+D4gnsRaSbzg6YxerWQgME7/KGHyZyau/ulZjQyyftE46O98jiubopR82Z46oThE681tO78Nl6UicZyiFKERmGR2XGZyZ/ZD9GvqQCiP07UZzNW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 27, 2024 at 03:40:38PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>Introduce a simplified MSIX IRQ handler for HW engines.
>
>Rather than having a single handler for all kinds of interrupts, we
>will allocate different MSIX IRQs which will map directly to the HW
>engine that generated the interrupt.
>
>This patch provides only the handler itself - its usage will be introduced
>later.
>
>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_irq.c | 18 +++++++++++++++++-
> drivers/gpu/drm/xe/xe_irq.h |  1 +
> 2 files changed, 18 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index b552af53db2f..28173e946e77 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -821,7 +821,23 @@ void xe_irq_resume(struct xe_device *xe)
> 		xe_irq_enable_hwe(gt);
> }
>
>-static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u32 *msix)
>+/*
>+ * This handles MI_USER_INTERRUPT.
>+ * In MSI-X mode command streamers raise an interrupt only as a result of
>+ * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
>+ * Currently, there is no use-case for MI_FLUSH_DW_NOTIFY.
>+ */

Not a proper kernel-doc. Needs kernel-doc formatting.

Niranjana

>+irqreturn_t xe_irq_hwe_handler(int irq, void *arg)
>+{
>+	struct xe_hw_engine *hwe = arg;
>+
>+	xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
>+
>+	return IRQ_HANDLED;
>+}
>+
>+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf,
>+			     bool dynamic_msix, u32 *msix)
> {
> 	struct xa_limit limit;
> 	int ret = 0;
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 6529dff90f76..4ab63e61a062 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -19,5 +19,6 @@ void xe_irq_enable_hwe(struct xe_gt *gt);
> int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
> 		   bool dynamic_msix, u32 *msix);
> void xe_free_irq(struct xe_device *xe, u32 msix);
>+irqreturn_t xe_irq_hwe_handler(int irq, void *arg);
>
> #endif
>-- 
>2.34.1
>
