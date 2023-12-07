Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A116C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 18:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E63210E94A;
	Thu,  7 Dec 2023 18:24:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB67E10E94F
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 18:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701973457; x=1733509457;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QwZglVbgo6er4D09BAqfOv0+zrwEaiixJJee2+xZ1z0=;
 b=akolBQjU1DfOKrRRaBBJEOI4V2HafNqD9K24lhoFEtjZCFAhwQKXGalb
 AuZu9PrJHsljBm+J0D6y6ImkcfUbw0blW1NzjmVFM+17gzUE5qSjH37Is
 jOjPcnVD7xzLa4RAAB6YYae8FDw63kZkqYv6sAQ17uEWa69csJhsY+D+i
 BtmocUlLcXqBuG0IHyX++D5LMqwQ3j0RbqOEhWvSizev2NDLfirxs9RJ5
 0P7tx0+UgL+bmqkfbJTkP5Ju30NdtglP01Nv3m8XnngH7fRnb4aVj75rA
 Bm6rppGOr5uVrm+ujaQu9zXj/CruqjOjvIPt4M4/cygjqvqBuHbsoN+lq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391452093"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="391452093"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 10:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103287654"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="1103287654"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 10:24:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 10:24:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 10:24:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 10:24:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFOEiRZKyLUA+YmsGUFDFoH7xBSW7AoDd/BEQQUzpWGv96CcdEEywogpTRnwh8zIrmuK1NVFsDwJhncgOJaSL2W9i/qb4pSa+8pLobI7lhSu0cZuRV1TBtJV2dCeTMgO9zevYd53+U8bAQ5CtON/KsflcDWngeDJGdWQwCOkgUWeYtE+hBkQD2MP7wUB50fLQgaprYIrRwKMUeQOUugviy18FK/UFTW6PyIsKRHvtV4nmFfUX8ltXbzcvQuZx1LFw7l5g81OKWOGtQJl4tcQzGD3hEufJIw9hk/jawp78ioBJoZhqkcF4XHDNP5qH/ye9+MLabGukZv2Pi06wD+q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=105PjsGSV2b1xzNqys/qsuzbp7kENL2YabmXNbPrJRM=;
 b=QWE527Y6mRQOIU/dxV54tAREb0pe62YMnNqUk6W5fdAgI+c6bgxlmGZuusPnMjgfy8HKV6Drvv9TxWwHl9rOjfR4Mg0md4TX4gG23qj2BUXZ3tHVFpd4fZU/nnY6O/yXE+O12t9RJFOxUjFIJ/MZ5zO/CStNAqEOVSFJIln1sUcjy9RzKU4PADfdOKja3c5eVZhtIaLRq5FJXo7cRbq+CNi2Y2JqFe8bP4cYZsdIqVvBkWp/hbkVRu7ylN68D2MbrEt8xUmg+6pwmCnkbaM3A5TZmCeQOFezHfMy74XHjrG1cgRpe7JA9g1CTc4HkShy8bq5SS/6fVdqjvw+6DWJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6331.namprd11.prod.outlook.com (2603:10b6:510:1fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 18:23:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 18:23:58 +0000
Date: Thu, 7 Dec 2023 10:23:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 16020183090
Message-ID: <20231207182355.GA5757@mdroper-desk1.amr.corp.intel.com>
References: <20231207175117.2334022-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207175117.2334022-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: e13f6a30-7f90-46bc-9e2c-08dbf751ada8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 91q4esxqejY2xT7a+4C78Sm4GZA91JmKMTzstmuTRaRhPdug5GURKrXDO9PfpS9ffTUVrf7YZX/7x0rRTMUpnXvn4j1bG8jZ0zV65Rmh59qyr1AELgFGgbCjST+d5Gzde4EeRwHAhVhtReowxYoYfgYTOWhGcPpFE9GOe50smO1kGMvXtPAR+M1YJyIzY4gjssxIBxeDvg+cb3cEVdRZ05HvhDfrepdcey2kisl/+zMnCIB0GcP48fYsD9+GSN8hHoQHc/fSs2p3kRpGRfD4DGIAwoIHFhoi0xGWbCbQhcZukND/hpQaF02QH7s8wkw4eAnVEdnppsyetyd7zs+OZHGio6yPtHZiaqCOzCzqplOBtPDT2izL+hvk8mh9wpfODWvc65qaot1dwD2CEUrBu0KuqQHWVIruJQz43RsgQ8MzLRp+7D7GmWELKBfwa/wIFyfGZCHML23e4R+PVkCyPMt2LHlODztj+vrm1lBIwG2IHS0vrLB3pw3tRucb2De7eIFujpL//SWQrqid2fGtb1DrMd+PUPDoUfI4orO7VIms34FclxpqaKn6qpqG4C/b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(41300700001)(5660300002)(2906002)(6636002)(33656002)(8676002)(316002)(4326008)(6862004)(478600001)(1076003)(6666004)(6512007)(6506007)(66476007)(82960400001)(86362001)(66556008)(26005)(107886003)(66946007)(8936002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mh8l8jr8t0YGRmXyJbk73GtrOxl5ybl9Zh3Iu/8ZVZFs6YmVqAfXZaTRCv7u?=
 =?us-ascii?Q?mgNbpEQEd850FeVrOkXqPxJU9fPxdM2qoEjAjJlARdEtmO1UpwvVk5zDwEJk?=
 =?us-ascii?Q?UOctHS6rxSl+D9vNCZfytpu4welmtrGFKAEa4x6ZTKf1XSqKVkTZSUgRk+Wv?=
 =?us-ascii?Q?2aFJdlRgIruyGxiBPLn6cPhf2ZueIhaaksd73Aq58tGUQ9hL4pdS6W5wuG+v?=
 =?us-ascii?Q?rwbUn2sa3uICQL3M0Yz/BK7vqVK6AeppNCO4tPaMRfX0fSD88EWLfzMlsVVS?=
 =?us-ascii?Q?x6IiSVbkQIEABTKwAjeXaiRrpAkIKSt0UfkmHKU4AGTWGbnopB0QrhBtEW+S?=
 =?us-ascii?Q?mkJEOa9QuLK4RgN2DjJwUO7LnmjJtRHIC5y+DrxRq1nrWRrHDInbiGYJ/ye8?=
 =?us-ascii?Q?9hRu9naKxaHmTVJ1vsB+ZNNgKCGVcPsGPqyfZV5VGe/5FMnIASs+pe8Y9B7e?=
 =?us-ascii?Q?W5DSfyj1lS/C7kOdA7Xs8Zl73sszyemo/uA1w4EOJINU67CDWtTNzhcu42+w?=
 =?us-ascii?Q?C/lDO5jLdWg8ad+Zz766PBYrjdgs+4XBHDDesob7Hm1KKtCT/uZM0GY/9TKU?=
 =?us-ascii?Q?RH2i6kOu11letit2KvD/VRTGYDXD0hWmqeEk7IyqhTk0B+gfykrgptZUZG7E?=
 =?us-ascii?Q?nvmzIKupaYEKwIHhBzxQslkLhCK6XjIWN32M1gcmRshrEdRMR6IMbCGRSXcu?=
 =?us-ascii?Q?PYWojkQaYzeG8W/yN9NGUE73l8o3qjbt/NIFORLZSin06sBtxSSpPotgMXI4?=
 =?us-ascii?Q?1g4j/41SSWhdHO1uiCBOmPabGTmJb6Qihz5spSoWHAFs+WOrYMASrtM6+9ed?=
 =?us-ascii?Q?umrB5m7EcFbN2kwXnRTxofXF8W0841rQVqs8wVlEwHjd7Q5gsUqVE6xgdp+M?=
 =?us-ascii?Q?XzOeIVO76YsfAwQy/HON6RUBxlDzDGirKpLD/PVbCqxIIeV2sxNRCZzW6eMD?=
 =?us-ascii?Q?xylRHJqotvc+fzRCnYp1auIRiu+sf9MxqWQMTKHaiVns9Xwj/Nkpbmf5nWq0?=
 =?us-ascii?Q?SWQwnaviW/Q1cGN+czjmNeFgmtiA4BRak0CC0ttx/UxypssdtpjAGaenKaY7?=
 =?us-ascii?Q?Nz2APQ9C1Nto/DHnTU5c7+5inJqi7ok2JPymvV31TWtAD2BuvGU3KVI51sQU?=
 =?us-ascii?Q?b505dLM23Nt8u8bP4hlFBZAWx+0eVRJc6Q7i+MylyROQNAMIAdB/xvJgbC+6?=
 =?us-ascii?Q?0q/sNjT6oLB5sQcNMgTLJPMIIFNIwydrkZ5KHYY5OCnb6RvL3HdaJvh1hUtK?=
 =?us-ascii?Q?AAeIVuqNeKDqVWQdwIGL45rswhXj1xJLLOvpeWbFB33uI3qTfmwZYtP4oiFY?=
 =?us-ascii?Q?QadYnic8aByum1SLJ4HcGNVvzY6F9J+jhsaJ6yZnne+QyVhy/9qhb5o5DSBK?=
 =?us-ascii?Q?FVKIYPtpxl/kkXL1aeo92ld0kBUm8cOtyvlffAF7riEKql7+fEeiNlzTmU5w?=
 =?us-ascii?Q?Ys/tH1dgDZG2/brLP0lkLeG6levHOQAmR6+9dv5Z8kbgN6Q4QfEYKynrulLG?=
 =?us-ascii?Q?8iWxCNGdPUr8tLFgmKwoWYS6LFkm+n2LTAGtdUnu0gPl7K2h5UxjezSydQ9o?=
 =?us-ascii?Q?GvsMgoWEGy/9MgHk2pB5Ovf/kFYAtryXDjsC2GyRschQ0tEzUv4m9iSdiLLZ?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e13f6a30-7f90-46bc-9e2c-08dbf751ada8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:23:58.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yG8vp4txQpprdFdYhWIZi8+mtZzDLClkMgtQ8WeY2y6KjwuSoCsYdw3g/XZkFHtRqtN1eKaDcGf9ekVFfT33Ri1eyYlm39+kbYdrdlFK16o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6331
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

On Thu, Dec 07, 2023 at 09:51:17AM -0800, Lucas De Marchi wrote:
> Graphics version 20.04, used in Lunar Lake, needs WA 16020183090 for
> steppings A*. Set ENABLE_SEMAPHORE_POLL_BIT in INSTPM(RENDER_RING_BASE)
> and whitelist CSBE_DEBUG_STATUS for userspace to be able to use it
> and complement the workaround.
> 
> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++++
>  drivers/gpu/drm/xe/xe_reg_whitelist.c    | 8 ++++++++
>  drivers/gpu/drm/xe/xe_wa.c               | 5 +++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 3942db268b01..93d83ceba873 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -46,6 +46,9 @@
>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>  
> +#define INSTPM(base)				XE_REG((base) + 0xc0, XE_REG_OPTION_MASKED)
> +#define   ENABLE_SEMAPHORE_POLL_BIT		REG_BIT(13)
> +
>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
>  
>  #define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> @@ -92,6 +95,7 @@
>  #define   TAIL_ADDR				0x001FFFF8
>  
>  #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
> +#define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>  
>  #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index e66ae1bdaf9c..3fa2ece7d228 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -7,9 +7,11 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
> +#include "xe_step.h"
>  
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
> @@ -56,6 +58,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_DENY,
>  				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
> +	{ XE_RTP_NAME("16020183090"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))

For the userspace steps of this workaround, it sounds like they only
really need RO access to this register rather than RW.  Should we use
RING_FORCE_TO_NONPRIV_ACCESS_RD?  I guess it doesn't really matter too
much since the register itself is RO so even if userspace tries to write
to it nothing should happen.

Up to you whether it's worth explicitly flagging it RO here or not;
either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	},
> +
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 23f1285135b8..f3326825bef5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -737,6 +737,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
>  	},
> +	{ XE_RTP_NAME("16020183090"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
> +	},
>  
>  	{}
>  };
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
