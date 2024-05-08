Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67FC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 12:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639BB10E0D2;
	Wed,  8 May 2024 12:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OC2OSyRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8D10E0D2
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715170368; x=1746706368;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nDFzNCvQSlhM5azyI4+NJPtnavIARIM6bMyL20FS8mo=;
 b=OC2OSyREJfaLVEhnHoOAiG9vDMMwC2NnSjuMtpi/k1c3sT6cgRUkDOR2
 Ii8ihNvYfTohXClBs7NSagLYx3a6kFPjLYtOMvPc582h1q0JZK8Bi+8xT
 Va2EqzIg0YZz1TGBw/KN0OKd0f7if5NcNVDAKBWN+wMzK3wCfrqQCKw7H
 hze914dRbtyp2PZAaP5JePifuoFRAhIQtSIWBx6ZfldwvAMJRG8lfyDJA
 C7cN2VLz3DSlTQ+/OEMfvZeq6kHbZhar0///RvRLIr7wufpKx6h9z+fbI
 e5On6aeOW/KY3V+UuCT91T58b82YDXIWG0sgy1QJWYo8lBlW3be4BnLm/ g==;
X-CSE-ConnectionGUID: mF56RBJWQuOPpEN48QgdcQ==
X-CSE-MsgGUID: HW85SLMSRoi9JT7KyELOYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22178718"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22178718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:12:47 -0700
X-CSE-ConnectionGUID: c20R/eTsSzO68/dA8M7MgQ==
X-CSE-MsgGUID: 9iL6hZq1TMSu6IDRMVrg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33412496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 05:12:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 05:12:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 05:12:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 05:12:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEOaaMe5gDFhNwtxMiGT4vqajIuCHVRqrjPMgnl6lELAm1cQ8MSUiOa+6kyGtFEr4PpgEXu1ArxFBTsrBhP3Blsp4BgimDeR60zT5RAX0z2sWGocKSvylmX1Rvtd811vSKxmCVJCbdPlCMk2uQag5MQRez7Re4hNIX/PyWrYf7cx5IoEITMLta1MBGmJoPVZH+vJIBiV3WEP0fE22l0RRO6j9Zh5h+bIhwHjLmSBcmpVXN41thKPAO67F4hcC0rSBo2I0gy0rmalcdET1hgng0dsRiP+IHoyo1aWct8D6JRmnQHFoil/Zx8YBQpMakxALsXnVe6O8MTmK9F5+Itxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gyz6TFt1CHOrCaEkHO8w2/FO883dS8P8shhR2EOCobg=;
 b=hx5VVf0L1UhUQI/qLYMwHarTzugIvQU3itx9+LztmXnyya5ThXBR+L4HA6FZkp9UlK4dvTNakwIbUkEdz7yYedQs+EiHa8b8Qp62QP2LePMct7UZLLd5Ii6cRT5roCUekWt7/jyZJw1yAy8bs1fQ4/2HfnXE2F7cHL3SUGB76a7t2tlVtPK6hYbjpkEhww/YF8lpGyBT1WXuGCx3PJWsVEoYdV/8Y22BrcfbX0SwsglPECSQMGzy0a6PQMQ4GeVJxBSBZnPQw04MDyHPKTbJC2/ESSOxYxx6fqzXkDMKESE7yVJCZfjkj691WCaoh5u3o8ZvsFETzoEoPcJAWCVS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 12:12:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 12:12:44 +0000
Date: Wed, 8 May 2024 08:12:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Change pcode timeout to 50msec while polling
 again
Message-ID: <ZjtsOMS-9_N0qUDG@intel.com>
References: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: 736bef7d-08d8-458e-3a17-08dc6f582a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+5IzaPcB4zMdsZ+1pg7ghabIoTUfWk4XY+awLF7UH7HC5rfiPyiR2RIY0vmc?=
 =?us-ascii?Q?Z2tglExzHerq71BFfhVILYTXQ3ykB56645TYtpTNNDD0+PTYNPjk0WEBL4bS?=
 =?us-ascii?Q?WL8V4CBf6/Zr5833reSiBGKR/QuiCN++G2joFJh72UC7rS2D9AeLAAkZisqB?=
 =?us-ascii?Q?qwUXCFHfP07ZeOuqR7WoVa1Y6X0REIjpJNszqSYGU6Yq1HWz7+XBxFE6zFqA?=
 =?us-ascii?Q?whf0tdkDzKepuFIw18Xajmg+iISDeYwq3InUKVGvpaxUa100y1Un9gLOVEz4?=
 =?us-ascii?Q?LAnoRkIsTQjFiEtzAygKyqwxlwAMhJ829ffgklMgRShxErmWLjraM258w0HT?=
 =?us-ascii?Q?mMfHbmEKwWYo/g0+j4MaAE1vLomOi2VUF7x6aQbH3onRzGRdKni3t6/23AFl?=
 =?us-ascii?Q?fvcEp++lu/TlFy16/khNwZ4dqAdzRZARi0H4Z2Ghcm7F/ANfYU99noKOx3sk?=
 =?us-ascii?Q?UJVu1Osaq3J6isan41eiljjAs9yaoo+NPEsU0anXM81ZC4vVJ48vbSqfgsHU?=
 =?us-ascii?Q?IwIQomiwxglaDIfNjHojK/8a/E9RJcYOKwCrtH2nhVGLe8PnPdSzeTgH2I2+?=
 =?us-ascii?Q?PkibYORAH9vCjuhycx8CtF9pED/Uejp1j0upHsUMZbpcs2QSGbTWm75VCXpU?=
 =?us-ascii?Q?drGYQ5BrYYzNdteBHviHyrP0jshx/DeDBtcVcSNx0NhS8WEl4MyZQwe5HpL+?=
 =?us-ascii?Q?gKq9AOcUnb3Mz1TGq6gYFu74ZUB5bNiRIPM9+TukbrPXpJ+OMM8lyTe/Xs1b?=
 =?us-ascii?Q?GTojbGy4q1z3BOrI65iMfvvU3CDARQwjV/jhaC6SZCN/yBJj1sQd1NkrDaIE?=
 =?us-ascii?Q?KZxZaiv5wOXPygLy8MRJAMZHxsGqQ4AuQhCDGk25CMTf/QPs2OK4GEnoGdsj?=
 =?us-ascii?Q?aVrLoQ8WbgPXsd1vcNmrhpEv7I1bRJksfVdeRt37d0Ni9zo6av+dAA0SnbO9?=
 =?us-ascii?Q?rTYPT6wmaDzv/nA9UAqUlWIyB3OUzOZ25BOtGEi05GwCpFyu2WBNeE/fHbBR?=
 =?us-ascii?Q?GqDL6i3PybfPwlc4MRo1FQ6Bx3PHQdGvIMBwt3mutzWmuacQN6olvqZjTX0x?=
 =?us-ascii?Q?mmQh+6PprzoqaBQWeFlXOPJeqvKucRurQoYtfkk+OtAB+HBIEk/RHRCJ0YGM?=
 =?us-ascii?Q?hZT6Pm3Bqj7JtjsxUNZrfWf30TgaGSwchR2KWCAecTPSaRDZtObNHLod4Y8b?=
 =?us-ascii?Q?vmKl3G27jzo1lPKN13hgXtNDpIVGylAAyVNU4gxZ+TGFIpjHWS43HkmOTgdW?=
 =?us-ascii?Q?oo33Yi85XQH2AA1QAL4lhujfxulHeBVls37K08I54g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0R7kbTNnnQZHgypPvg3J7tzjnEU0BXLCFx1eidWNkWF/rcrzMiWdCUmsVMV?=
 =?us-ascii?Q?7zVXZvxqnzOJvEanG+VshuLXygXGeahudpUU6cJPgMtL+VJVU8q0eGs53SBS?=
 =?us-ascii?Q?yyW1XE//JhMUSKdYeyKsS4QRh34+vOxhJEc6lm1i/ScsrSZqqJerSctBdZLi?=
 =?us-ascii?Q?TACcWnpufRTJVSU9aau8ajfuUwwKgN0sRc/0PPVvk4Y1Az1ulLyfpocRwjHc?=
 =?us-ascii?Q?Y6wNUjHOZKi2xi6sot2hHgOB5Bt4FkXDNy9CSfBXBO/A/ukVRnH3AuBD5hRd?=
 =?us-ascii?Q?9IxQcQ5xJnxpD/5Lkq0i2r8YVR2NljIlv2w1g6tJ93IPYJiqrZfm4RFBqhQx?=
 =?us-ascii?Q?IEuUrK3SjIMvQMqL4YvxhpySe+P8JAivcbf4sCLiir5v0GVJ1yrd8n0jvOKV?=
 =?us-ascii?Q?171JcaaOCsjZBZv0FtoHQofFrYjD+t6A41mmCzpFS8xnCFxu5VtxDfJKFRlt?=
 =?us-ascii?Q?JirdyzeMHoOSxXVz3AlZmUZpMPMaUTEQEY/P5itvEfgpceK01gSRTnE2iIMm?=
 =?us-ascii?Q?OateZeuWcj1HMbBXodDhohINUghqROA8al46647xiHEE7YNa5xSA6pbQyzsF?=
 =?us-ascii?Q?x2GziDy+AvbcF/FMNS4xtkf1JY1y816OExgSMhw8DLv+Cwegdcb2nmwRA7QO?=
 =?us-ascii?Q?eLDnelJirCR0NgPWVcC+H1IUOwe+ZGf3p6sVp0p4jRSn9mJP4KukTTFZ/4X8?=
 =?us-ascii?Q?vDbVbuA2wmgNqhs5c2k/cfxZKe64HQmv3Byt90sbiZI0Tk4StoIfRqeJdz6U?=
 =?us-ascii?Q?aZyvwTN6GVJPbzQ0eCX2sMvD652gzzvlynUMvNkr13CTbn/ThkVTQLuRG7JG?=
 =?us-ascii?Q?g/KfVmvi6sIIefNLH+yyVQ04oAsPC4Q3Dek2QI4I6h9dowFYpc4x/J8RdJvQ?=
 =?us-ascii?Q?qF/8jRenr5tp0yzmJOAYeN2IAACS7RVp94IGNBjTdLMq8kpXXnQaFoHmXMbu?=
 =?us-ascii?Q?EOm5djgSQeK26ZgVpZBuURLfI3guzJzPGnuagMDWLgMI3ndOTqvOxvSTyo6F?=
 =?us-ascii?Q?TPk5bo+gF3TlSccZKJrT7452qBOElKvwChzM+fEUK6tUi7xuhD+S2bSIEPiu?=
 =?us-ascii?Q?VHYQjEI8NF415cw/HdjIirg0EHVkXhYLx/9dhcSlNEOEYloiC10jqPnPNXeu?=
 =?us-ascii?Q?rJ2ZcyQcdkjB6HZ1KtG+10RV+tTb+Jxa1M5qLq03Tnt68Vp42PUaPbHqh73y?=
 =?us-ascii?Q?yH8hRFD3p7ANJqRQNWEPcJrsdVsjqW7BbjEh5Nsk2gQA0x7y4pa890Ghuql9?=
 =?us-ascii?Q?XKOBjhGwPjfAN0D8Hr4Zh85Rw+k2Z8lVYjTQ0RuCQ/DIcw2uqsDe7EGbukOf?=
 =?us-ascii?Q?c9F7CM/a+0s0QiIXkfZOXWQc8cThxqbVs9Y3sUDRO86mXllLdRMGTROib1m1?=
 =?us-ascii?Q?EjCLh+3uwRM4KsimICfpOVCspncn+EmKgj7FhWc3kcMmm03mtTkWxGInt9tm?=
 =?us-ascii?Q?KkNN3CDjXfvHU39WAfegjXYCw+9WFd1qlDq92s9+yeoakTOYLVc8gfXOfGR1?=
 =?us-ascii?Q?ZqtjSkAqMxS85Aw1Y9LIXRwcH3JInLsDTqtqWJuICRnW47kABX28KYSptwjm?=
 =?us-ascii?Q?CSW3vxJCDaJJxS7vIpMQzjlpt/8ULrKb6u/EzfiN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 736bef7d-08d8-458e-3a17-08dc6f582a65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 12:12:44.2166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8b026o+1NVOnJYB22HZJlXaKUReoG7SnGmZ6PxJHwO3NHxbxf15Bna+TOBAN6VtfMmJ8/EAjldqQR9mEbu/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
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

On Wed, May 08, 2024 at 09:13:28AM +0530, Himal Prasad Ghimiray wrote:
> Polling is initially attempted with timeout_base_ms enabled for
> preemption, and if it exceeds this timeframe, another attempt is made
> without preemption, allowing an additional 50 ms before timing out.
> 
> Display driver can request for timeout of 3 msec, hence modify the
> warning condition.
> 
> v2
> - Rebase
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index c010ef16fbf5..2771eed1e45f 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
> @@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
>  {
>  	int slept, wait = 10;
>  
> +	xe_gt_assert(gt, timeout_us > 0);
> +
>  	for (slept = 0; slept < timeout_us; slept += wait) {
>  		if (locked)
>  			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> @@ -166,7 +169,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
>  int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  		      u32 reply_mask, u32 reply, int timeout_base_ms)
>  {
> -	u32 status;
> +	u32 status = 0;
>  	int ret;
>  
>  	mutex_lock(&gt->pcode.lock);
> @@ -188,10 +191,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  	 */
>  	drm_err(&gt_to_xe(gt)->drm,
>  		"PCODE timeout, retrying with preemption disabled\n");
> -	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
> +	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 3);
>  	preempt_disable();
>  	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> -				true, timeout_base_ms * 1000, true);
> +				true, 50 * 1000, true);
>  	preempt_enable();
>  
>  out:
> -- 
> 2.25.1
> 
