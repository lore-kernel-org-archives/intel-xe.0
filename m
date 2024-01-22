Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81313C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2131A10EB84;
	Mon, 22 Jan 2024 17:06:21 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 17:06:19 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3010E083
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943179; x=1737479179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qtIOQAjmtyXI8Ph0FmvLG2pfD/NjJxO6gpOp4XoKTWE=;
 b=DoElya3i3osWGryXjRVjfk2X41kBPFIw1V8j9eq/gYdgn8n0FygTrw7h
 LKboz38lQlw0vnAhqHedwHI3ZzvGNhpMKMAdIM8kWZUNWf1/EBd0Xyll2
 obvuMY5auctKSlCJdYz1j01XcS00VaiDgyCRx6VNXXxnX6fPp5PUEJMvJ
 Q38/N+2HbSnVkXDJ/2/w9QTye0pDjbTgoeQsa9aNlfHlRUiwMehOK1/Xu
 ztgN3ebmS1YyhoSv304XVwuyJfLPGeevOydKBDYsueCECkHG7eb73/HbP
 M5j/RdVxeulm5FiTOqj9By+24alGk+Hx7AZOvdPf6dHRA5iEL4a7RHF91 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="154243"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="154243"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:59:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="819780398"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="819780398"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 08:59:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:59:10 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:59:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 08:59:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 08:59:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awmEXcU9LrdJww61raaP+aC3vOU0JW4hlsovTz59GrXgyCNTUhtg2pcd/lTDiPdbpW3AvR4qlQIO+suFinlrluHKQuZPaZhl/7A2yH3JbxV9hJ+XFA9NMM+3u8WsJ6oTeAFqhPZ/DITMkKbPGCi9vm2OdgmB5amK/5COBIw3ovyukvPcvv6fu41KXekDG8aplAYaJk7FNY3qD+h4Q0nT/qg3CJyVRV8HMPcm0EITh6MI5qaa27FNmO60soANPxsxPUjqoLws1sgDAniDXoEk6sNnEQIiOjo7gHW7L1CwRlSX0utWx3SavGuSAu+hBI7AL0mmJdGV0fX5qdmhwT0e6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrULlig8MUGEcJwVBfwZuCxYeiQ87Zk0HCUfhdhaN50=;
 b=AeQaeImOJ7ndr1P5vOLKP4UAb6euYx0PnzfmackVBPHHyomxB08397TMTThuo31fEO8N+gtTDHcQ4g4SYypDWueTAGQHNtRt6WFGBpXa0K8m1xgWIEoIkRkdGAhDw9jeLzKdDVHmpa8Ty5J/Gkp4oXxJkRztzvhpnoFOMzZDNej9BWeLRRwDCkdevj8f3a75WsyoTx7Dxn5fo6I/DNKXR06X8FIBq8jQRiPTT/glGDJPuWGtzZC7LiefjXObmvzi8WkxOcabGdqc6+yFNcm3rVgZa//yFQD8Z7vk6eFZ51OTbaKtIMI0f2qGQWbWisEudWJ9fUkJOeNPq5brG1UlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Mon, 22 Jan
 2024 16:59:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 16:59:05 +0000
Date: Mon, 22 Jan 2024 11:59:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: move xe_display.[ch] under display/
Message-ID: <Za6e1j9lA_Uz7Vlq@intel.com>
References: <20240122101428.2683468-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122101428.2683468-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c2a4b0-0c78-47f5-c017-08dc1b6b7159
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRzZM6FId10q5gQYjTFqIWpJV/VlzpXQ6ou2xSvVrIiYGRWTNP7jufkmQfa4r75N3SqA+f32yCs+5O+XGac/nRZ/CWeidaHG/KgBaJjK7OxvaSv3SqcZyeQ1hUoHTbnphp9Z0JgxCfMvQcrIbLj3fX2TKZ6WrkRxUc9hdmpmayh3p8a2LRl1ucnCZB9Q/dosEITEcvXmKYvIg166ZgVs1l4fYkrShpYG+9REt9yRxVbeNb02csVRdvuS4BLZeBpHhf5x8CUkBDCfXTFDeS0HV35Aj5xro2PPMy1RlVET4WEWlF5lYr3gtqaus0BtTOyrftekXEdizelzcRE+m9Ctq/xuJ9EnD2+4eV4NqGpvvd+MD6EgqXJ1sGrBfLUwh9ut0tNNThkk664mjY3zfpET63s6qSjLJ58AKF8b6efa32HuzmJGDIH+9XrZ8l0CSGH2uPcWRCSqz/jw1S39385mxzr/vUoUEcq6e1zpMEwpf18fqB3JtxNGBhY8uYauOKu/t1Uqq9rEEQvkG+Z+A9ylL/VuPTebuO6VVarBW0Q8qYDETCbBNnKJqLEhB9snTnzhNiopmNRCJSwGY4MlhQuK/BUJDWaveSmZdP7i4Qn5O7bKdgR3HNF8IDzVSgCaWMzw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(38100700002)(83380400001)(86362001)(44832011)(8936002)(36756003)(82960400001)(6636002)(2906002)(66556008)(4326008)(66476007)(6862004)(37006003)(5660300002)(316002)(26005)(2616005)(66946007)(6486002)(8676002)(478600001)(6666004)(6512007)(6506007)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9T2uMLVNjFzsue4puL5oXc2KYYpsuAzuO+zC3RyiuE7nuOGY8TUY2Ww0LVDK?=
 =?us-ascii?Q?0/jnUycLDD21++Q8Y+Qu/fhYN4gIIWoI98sbWCIkiZgtcYkUVVqdUOvcjUCy?=
 =?us-ascii?Q?fo3bLc20muOXNWzGYAyiYl8zpxTf/3ozZbL2HqPB1GW7AThJBFHtbnE0AlTY?=
 =?us-ascii?Q?eD1mb+G22+n4QCFMD9xU1KQZQ21Gs3+Su9s2gE6x0EIABlDK4exRuQ3yK+Tl?=
 =?us-ascii?Q?DbimKbn+7DDyUYvl7Lls3JBZzOBcloWoL76dh0bUbPewlwYbrd+6dq+vtxCZ?=
 =?us-ascii?Q?+rrgGtcRdHwH0i7wQKH1vDO1D7hYQI/EgNznYJJLgnFb8+VoYC39k+PybnXq?=
 =?us-ascii?Q?084vODa6pGAfbJRc2k+ub/Rf2HJiJLYfX6jVKNHwzjoobGZ8zYz5m+maM6ip?=
 =?us-ascii?Q?ID4lS4EUcSSDUVsPtGwgi3tKQqLv3W1laSCdZP6Kc5L0iR+zLYssPDQ1Bj5+?=
 =?us-ascii?Q?NpQrAB6Hus91+PUypwS8qy3CSHBGoCIth2mfFXmL4OvPirK981Kk8TwDxLI+?=
 =?us-ascii?Q?4XcV5xEbw8NFdoSFCQn9pkFCC9TkDAjZg1OrL6C1asExJoVry+AIGentx5CI?=
 =?us-ascii?Q?jJJxXOUePQ5UWIb+sJJ0ZGhQomtQQnCXw/pYO6t/Nm5gMU7SuNHWDElYNhLj?=
 =?us-ascii?Q?3b9GNmc4SYp15OV+T/G9H31nNxrEyr1AvmR2R5p1/y3nHz2sQ1nNLunhegAw?=
 =?us-ascii?Q?QsyfmfNTGb3viO5DEYpCHXAU5S980UrN4vWs0gAxRpFWqNfiVSdKsc+ixtD9?=
 =?us-ascii?Q?PYnzyUoD00x0JnMvh+Jq0mIt2xrPRkTrrTy1rdeXD2DR22ggRGKslOTEY+wF?=
 =?us-ascii?Q?XLYh67nz4UA/OK0yzvSj2lLmQ9CyaQjtWURp/Pkirx4wNJ5Hu0g4Y25I8vBf?=
 =?us-ascii?Q?/kLb1Bznyxg7qc8ZlrPUmGaRk4xe8oF0lV54xIQtN8OZV2rQyiDjV1DRKY9C?=
 =?us-ascii?Q?x5PKbsuOMdKE92yO93vMW5NXw2qzzAS0n4Yfde1I+iDgvKaS3MYmacLzIwbc?=
 =?us-ascii?Q?/jCR0F65rKt6l8uQPz1lTpNgerKV/V2NGDvXEsSm8rqXo/G76jHCLjUUdfkn?=
 =?us-ascii?Q?cMn74PID5REw11mAllev+z3n+BMQ1eCtdtPMza+b9VAsHi5LN6ROqUHDBBxn?=
 =?us-ascii?Q?ra2mnMixfU7wLQLruxqJ1Z5BsTRkbnx7wLhXE6a2hzMEgsqC+yZDnPyF/oMr?=
 =?us-ascii?Q?hOTr0HIX+mEwFvxLsk8IaQl4U4xtVtkFfA0ZrGeDKV92m1PaBKwvTrC+J4LY?=
 =?us-ascii?Q?yMSm292vj/URlKaNuqEkTNDJUfGkdssIppYvDWAit0TlgcQE+A7xBSDnvFAi?=
 =?us-ascii?Q?vi9aoO6RfOyMlsEal2e0lngmFiDeIWItqqIFjtDQrjjGZzMy/2pfNMscqb0H?=
 =?us-ascii?Q?EDY7BrjdVD9W8921JK7HGmR+12o4dfcpeWe6xabvAunFlBnlW8V1sjIV5aWE?=
 =?us-ascii?Q?T6po6h4goUcOSDdKB7gYjVZDXDImgWCvAbozswSOELhX9kD3h3O7ocuvMc0F?=
 =?us-ascii?Q?RPRxT+lNaaAPzmpiL2ata2/tkywlTs3Q29STQDzUll5lcRhPRFv9aIF8ad1+?=
 =?us-ascii?Q?GqOHivcC8l+C2SckT9AOVzbMlPhWRg+KJ0PDKZ/k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c2a4b0-0c78-47f5-c017-08dc1b6b7159
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 16:59:05.9123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT2Ksq5RIb1FW72yB7eEk4Cb/Big9adAY/yc+VAebVc5el6dwM+UMG9aV313r7srLKUnwprB1n1vJIXLVWqiKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 12:14:27PM +0200, Jani Nikula wrote:
> All the other display related files are under display/ subdirectory,
> also move xe_display.[ch] there.
> 
> Sort the build list while at it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile                   | 18 +++++++++---------
>  drivers/gpu/drm/xe/{ => display}/xe_display.c |  0
>  drivers/gpu/drm/xe/{ => display}/xe_display.h |  0
>  3 files changed, 9 insertions(+), 9 deletions(-)
>  rename drivers/gpu/drm/xe/{ => display}/xe_display.c (100%)
>  rename drivers/gpu/drm/xe/{ => display}/xe_display.h (100%)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index fe8b266a9819..e06f99def559 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -185,17 +185,17 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>  
>  # Display code specific to xe
>  xe-$(CONFIG_DRM_XE_DISPLAY) += \
> -	xe_display.o \
> -	display/xe_fb_pin.o \
> -	display/xe_hdcp_gsc.o \
> -	display/xe_plane_initial.o \
> -	display/xe_display_rps.o \
> +	display/ext/i915_irq.o \
> +	display/ext/i915_utils.o \
> +	display/intel_fb_bo.o \
> +	display/intel_fbdev_fb.o \
> +	display/xe_display.o \
>  	display/xe_display_misc.o \
> +	display/xe_display_rps.o \
>  	display/xe_dsb_buffer.o \
> -	display/intel_fbdev_fb.o \
> -	display/intel_fb_bo.o \
> -	display/ext/i915_irq.o \
> -	display/ext/i915_utils.o
> +	display/xe_fb_pin.o \
> +	display/xe_hdcp_gsc.o \
> +	display/xe_plane_initial.o
>  
>  # SOC code shared with i915
>  xe-$(CONFIG_DRM_XE_DISPLAY) += \
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> similarity index 100%
> rename from drivers/gpu/drm/xe/xe_display.c
> rename to drivers/gpu/drm/xe/display/xe_display.c
> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> similarity index 100%
> rename from drivers/gpu/drm/xe/xe_display.h
> rename to drivers/gpu/drm/xe/display/xe_display.h
> -- 
> 2.39.2
> 
