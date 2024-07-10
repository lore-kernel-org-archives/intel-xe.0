Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C44DC3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 16:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2889B10E28E;
	Wed, 10 Jul 2024 16:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1Tarpy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271410E296
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720629292; x=1752165292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/q6+oAzlVwFoevTS+UW4Sda9LAgZGlo4dbzCvN50sSI=;
 b=D1Tarpy+YxqRz/RFkFyO5j7Qz3L5tcfkdfCWOCo/yhEap6w7INCEloc6
 YcLyb9QjOD3PMQDrchBPqoK1foTHeerm1Qxi3TA5AUd5Z/4dDa85Jev6J
 byIPTQQvPfsRSWPIIg6ygnIYKw3rOEudKwVT0RKNLsjEiXxotQGM2FEMF
 oeThOWwSa9YCHZfSVcks8mQbqYZNUyKk/8vpBTMKDJKaDGc7eFRJRs/Tj
 Pqs8oRrQEHPTG7P07PVwzH5pSUhKXBl2Ie9hoWS9lrg0gyROZQJiUG7q+
 c9kAQHm+GIiMOBet9UJPY3d9DMiYZQVQ8qDfBzmFWkOqmjS4vU1D4tfcC Q==;
X-CSE-ConnectionGUID: voipKZV0QbWaqEhdpEvVLw==
X-CSE-MsgGUID: 2RWtlnpHTbei0ultuk69Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18107135"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18107135"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 09:34:52 -0700
X-CSE-ConnectionGUID: X4HtZLzhTF6Pd4Y/wKY4ag==
X-CSE-MsgGUID: 2TAi3h0+Q7yBWpuGesh76w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="52869024"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 09:34:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:34:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 09:34:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 09:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA5B/N72vcBQ7HdEagmzsIAXHVnqFNwDH3qXk0Qs4VmqYig+JSh88/9By/B2H4Fa3+w97/3TmipY6V5zsL+GCj9C0W6Vp7Pl9KULOVqcUKAEzLiYNq3z3GBNLM9FJNyG/N2py5ugMggChIfmvRd5RqY5pKlq87VW/a2gqvxldAnn5CCDuYj4TBmilBESk/G/kwvhiZD960JW3KypEyUVxJvlbZcSbuQRBphVWradXiY8eLc+XbeiNlo8MTxwAQKElrqLWs1ouxTLQlAwoa8tMH8TYH1RDnMPcomvVknzj1avrHcQ4RvH4zQJ8H928Pxu4m7jyiFZtZjCHAh84m+sVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KClaba+yCbNCR/lDPpBhjmyEh6nYQtgf6i/Y2asXazs=;
 b=iH512vmznPBJZ8pcx14wfD2hzlqKm8InqgzJLPTN8cYYw0Zwccnay0KehUfywhJ/XEjvx6ZYjO0Oo58a92jZzgJ4G9+Qc7r/sr2EeLg/2bamSGNBN8v0QSLIPDJ3m2ChRSnjyflYDdwJL8iG9G+tHfLfQ9HR6LW58GZpQ99f3x1L9C9hvm6AZhDVi7OM+EMYJSbPkXdVdFk9CIgLmBTgyOKqUV0vzv1xFlzLJElWjtp/V0hQg1ssaH+NHR3qrjYLoOLUIn97fXgsda98lPm/QVF29sOkVquxsg7z57kKwN9DxXwQdprOVx+H8H/8jAu8gGYvvJU6gaTwj1mzncKoMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 16:34:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 16:34:47 +0000
Date: Wed, 10 Jul 2024 09:34:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 3/8] drm/xe/irq: add hw engine irq handler
Message-ID: <Zo64JQ8s7E2tjBPN@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-4-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-4-dliberman@habana.ai>
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: e6832ddb-f668-4041-b863-08dca0fe3671
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZPhSEypUV4D0y8LH5Q/3x+dspMq9HCcwN15fVNsdWGeLJ6A5Bv8xdy2UNl4Y?=
 =?us-ascii?Q?b+mdKqk+SyuJbvu1goVluqzsQM7Hu+KINmTsP4TOifF/ZK3vCp9NdJ/1A8wZ?=
 =?us-ascii?Q?JlfFQ+YFFeeUcM7H30/fNuxs8mWJAFhmQYsSiJg/PBM/KvSyTNzcQfug8mkR?=
 =?us-ascii?Q?Amp4fS/cPdSu54gFbzeUCiO1Ejzhc860ssdxmBshtfTWRjDOKde0XrZqBgkH?=
 =?us-ascii?Q?LuLIuuNTEUc63ZDWG/SsSgdCAtrwfY0CSP7wOkeZP85uzvMZe1autRjgxZy8?=
 =?us-ascii?Q?rNt99jPzwXlkR5O9yFmPBqS1ykdcEjItl9+7IMdKKCWYSSN5ZlK9469cryIa?=
 =?us-ascii?Q?4eq5d5PRz2IS1gDN6ftcVDcPJPtgrMWdDZEFwQ038alax0bCZsA41eWSqKtd?=
 =?us-ascii?Q?b68EGxeZmhprZyKvsZqNRXZSGSOBzjGBd3DflRVIstgzi7N8GHtnc8CA8K0y?=
 =?us-ascii?Q?8AP01Sdq/3A1JwD39Wwshw//JuRpH5EkIWqHq2VV5Evkp4TdKKOyZEYK6rA+?=
 =?us-ascii?Q?V3dOCJvDT0Hg65fmmzstLjT1Yh+wj1A77YJVQVTS9x2r/lo2k43Xxh8n1nVv?=
 =?us-ascii?Q?p3Ul1Ru69bO5NlKfNQ0ZE/rJD4QjZ/C8PcC708F6LJnLPhukgbd7ga+Xg5HU?=
 =?us-ascii?Q?s7M1+mYBzb2GH52+S7LFLycr9+bQYJiXA6zxxuEQvhod6kznOWghkKmbO+Yp?=
 =?us-ascii?Q?IUH6rxfS5Dp/VubQ9+a6MUapv0HmkTeIaAsVP4uHDaix1Q/CRBZ6Slw4IO2W?=
 =?us-ascii?Q?crtMzEfFL/S/vLQjNw8KFQGHoiRZXJWy0uAyfneC/vy1bfgvzaFAuyz4gIqN?=
 =?us-ascii?Q?Z8f+NiXutxULPHUP0M3PL6i/lx2kff/mSmRttlj3zEDZ70WzskUQGFtYl1C7?=
 =?us-ascii?Q?PT+v+HlKMnI+OIb5pKb0ICGlKBS+iy5+cqG1rOrDJ+RCGjRmX7dxyBQHFVfQ?=
 =?us-ascii?Q?OT05Ujij4FhECnvV9o/0Ey0RMMehxuQiEoEunveDR7HDVNu+acNoXE2Y9TKM?=
 =?us-ascii?Q?UL382X6ypsE4B3rDEi6zj9oHEmhUeb/qNujftVwM5NNiMvK0TquSYTDL1cHj?=
 =?us-ascii?Q?an41nFPo42qDxVAO9eNxvwJldOxuqBNaqH11TyBvLv8OwO4pJ140kjdtA+dA?=
 =?us-ascii?Q?9nzfwgwYExGuuBDpq8EnlmdR7Tq5HAuTgZ+19+LzKCHVyleNC4qO2Ntgxu7I?=
 =?us-ascii?Q?2lklblf/lQrUbWRSfW8vh9r5DV1HR2852DeE7MUSXIlwJx+pvWooIHhpDV1j?=
 =?us-ascii?Q?s/GqAndju3G00pwuzzcIFGpJG7KyDmcl8cnbgGv5Qz9VJqnAiOms2E9UC+d0?=
 =?us-ascii?Q?hv0bVIs61HYbDyIQ/iTJoYxXlVSL5W2vwWvXmQZsFy/N/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rkp2if8udRtcg5j3D3PMEYDHt6DlVBxLNjm48LyjOArziK2BPGPPj6Ez+9YO?=
 =?us-ascii?Q?V+lP+QGxGE2B7Q0a7O5rBxMChT+oDRxNVRnLfuqm8o/ySyh5rjlLWFlq32LA?=
 =?us-ascii?Q?K6Cxk6r8TGKEOhp5udp5mZvyKDSjkrQuHSASt0eckYOxaQlQwiOBY8QggNbG?=
 =?us-ascii?Q?5weDyYD44lwf+wB4oe1VtP0XPdtLlLnIvNBZ2F0jSfqCSCKAkyDPr+1ThrQ7?=
 =?us-ascii?Q?Z67ob/wbFIuygFdcK6P7HxFhBJyNuV5m/eLUy135poWCMJt4lU4U4d45GXeG?=
 =?us-ascii?Q?GEU43ON+MPAi9KY3wA0/SbpUftUNApJJNyD3BbOgpN2AjrjGdQAfBEsty1S8?=
 =?us-ascii?Q?LRlE2pgDmbZq68i0o74++nIyFnmpcDU5v5wBXtSVb2YhBdqlt/TGyqbOM7Vc?=
 =?us-ascii?Q?Oh2umjSQG4a5KabPdL2Q3qVOWbr/oP/Nl7XSwdbiAVHQaKoaUw3j/vzVv6oy?=
 =?us-ascii?Q?LwxgnFLaOgQPSwFSWZJCM78kj/OVt5nS0X5r2x5who/bhEUpdMhlfF7DbBgD?=
 =?us-ascii?Q?zkznyeRfkoSL4piAs1k5fizgFdJ7SKAPCKbJqs3catb6UXnXZPQocJ8yPQij?=
 =?us-ascii?Q?MynPyy9gDMM3yJc/puNhEbawFDvsNs7hZr/7VLV74shmUIHtaw1pW/S+i6Hs?=
 =?us-ascii?Q?/XG8bgi0deVCzgMQ/q/9r8qlQ7/fxaVR2cdUyUPFUYdylOo6PeriJoiiD6QG?=
 =?us-ascii?Q?mTal1+3XmczEwAsh25B50uJXYWvqmz6Oyw27+BHXVnRahuepR9W+65m8cfZ6?=
 =?us-ascii?Q?tptr/Kce7XO9MLS1CNRZb6ArTQH1kc2RMqQAyPIerJ36FiG+74DTOvjHaS+E?=
 =?us-ascii?Q?P4AhwDhl8/Z9YAomRmGKwjNSJhhtnQStOTackNWsZvKSCVyP6xQoVOVRFfQo?=
 =?us-ascii?Q?/xfJ0CmGSIFigeOqQR4gNtaANNM39EUlLdC9tYpSjbukjrLkeUaYiDwGEP/b?=
 =?us-ascii?Q?6AoD0hcf8DyahI5yMu3qzbBGEhIb2KkEnvBqi7yLKX6jHmQNhZ3txcgTAZDr?=
 =?us-ascii?Q?KG+t4Tga7ADglqEgOOAWZIfT8mLTwUPVY47I/ia5r78thmbIMICQmrI1PPIh?=
 =?us-ascii?Q?psIm9p3vO0iue4bqo4fDLMzm7Ty32hGKwafQ5Q0U84Dc0TKFFjQ4GPu1+UqG?=
 =?us-ascii?Q?L1HyqSXi0CHHykSpyDbRnid2OoOK7BY6MwVSPOgMZNTRCAR7mMMO2HT7UDxu?=
 =?us-ascii?Q?FTSaGDf1/lmCSYK2ryZ57DUhvcoSAF/imuQS0uDzL8bUI8z6VEmXOFHBA0BX?=
 =?us-ascii?Q?q2RXAPjM4qS0c0YdlfLsfPSaGV7hOe/WQ7rfCwXjlam4O9jLuW3Ip2+5yoU4?=
 =?us-ascii?Q?eU02C+6cfolxh3ppHz+GAYXBsAzmGV/LCPzSFGRp5UikOHIfwywa2F3XhZkO?=
 =?us-ascii?Q?0/gMZg4cQsvHN1p8/9UMJbU0sd7lhlDLIifPIy3BI+TrafvRu9vVicsgj+mp?=
 =?us-ascii?Q?O+d++fRBi6NgH/Q0j7bdxphhpHhz5/eWBokHmuS2xMFSurvRbAH/1ExdlZre?=
 =?us-ascii?Q?Vfqbx85YDqEMyhCkjuAR5zAaOXXC7WzcjD0Of8sS1zE24XP2/uN3MIR/gL0D?=
 =?us-ascii?Q?oxYK7+FJo9mu2sJWewpMHtPRkAYOm7YPUKF75CtK186J4iGusi/hJxZH/9Xh?=
 =?us-ascii?Q?cbvk724KCnK/wohu2CpsVR8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6832ddb-f668-4041-b863-08dca0fe3671
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 16:34:47.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ry+FEhkbFq+lcbSl2yfe1SHy5O012zclO0miatHcbXY2EPfBf+GTNBJyHh+KskwJ/Ip6EqkUVZ8FQzHFGWIbwmzf8lgzoHvjf0Lq08Q7VRH53Dvjfd1cEAyMc4Zqx2wp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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
>+irqreturn_t xe_irq_hwe_handler(int irq, void *arg)

As this is MSIX only, may be rename it to xe_irq_msix_hwe_handler()?

Niranjana

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
