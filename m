Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD82AC6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 22:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD9810E4BE;
	Thu, 23 Mar 2023 22:53:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8034610E4A2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 22:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679612012; x=1711148012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Gnu4bWSc0GdZtoDIAumHCwynXBOnOAGp1SKqSwU0/k=;
 b=EHtQgAqtadt1T5n4MNxs8n1N5tD0VcmOQvTa+CY5wzSiOyfQQUubReYU
 XWvtjAKLdYaS6S9dKfmJm3/8qvNqy1b86CqucF+0xvCCT8VaTdMOkwpQ6
 6FzNx54UniS3pwxmed8rA7yHNkD22NXANpk2awEsHzdQV7Yqo7QR94jse
 t5x8g9NnvzkTfEWtMkb8QzUhVo2uzBmv2Ar7d2gmZiibUS/CKm4F6CvqS
 JrNkgVHKdGAH8UQh7x7Bm9P/48O9afyM1FCplz842kI5G1G5x9gI4BDR6
 nrb7xPj4nMCdFVFTyjURZSvJMtW1LqaxCySS+7bRlWcMADTmHj3Vm/jHg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338366371"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="338366371"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 15:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826010331"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="826010331"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 15:53:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 15:53:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 15:53:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 15:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl2SO4HL4ApwEP80RVLaBHO+lcnCrSOH8wCRygI6wYI56i7RxajhD4ztamyRcyUPSMT1EtGZFxe86AP8uDXYD112Wz7UUc1iTZYfSIIenUmJg+9JtUE5abyOVCw12F6XlsbLA8fn2n0odGvvpyPxq45dTKoSqCQ8oXh4a0az2hCRO/x2NPpyz5SByEuiSu6t5s+mjgoEynMFpdynCBwvTZ8UmjjEjRLYc4PVMsL9Ajq2M2mp3ORLx5agCS42NdKlQCHVh6wDWIeBv/U5fQtAYoM7QaD1NqZXKj9lDQjoq3OkoQaKBR0qkQ3/m6DVNpTKElxSpplAqIFLrkV0e8inNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nbykuLLfY8TcQ1zlg+4RbCa7fu28nKSqWySHbKqY2s=;
 b=Vj+q0NcD+3Kr63/qT7C9CXej5PK5d7ZHZFywUO4oyW97K2KAPg+KuuHFRT2tdDeBa0tUpczo5DEfr3JJslN2ZTkUGw4lq8onXI+4lBO1ErwFRWIpbnBIZxdACha/RLnkLANu6UNpSD08jkXuLX65nmY68LD+KSmO7kdriMoshvvfbsl/W99vqKgyHCs9IDBJNc3sem4CWWu4ZVIEDZlQZjAAviH409F9ZMlQwpylrVYeW18pVkzo6dM4iwIZt27r2SCm1m/2uscXG7FOFwxtO2sh0vj67bpeR/UmN1iz77Lzn5ARsq2MhAvpASHgTqAaWwlG9dkFLEiyVCAlsS88Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:53:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 22:53:29 +0000
Date: Thu, 23 Mar 2023 22:52:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230323202313.3523-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: e398946d-3b86-479a-c826-08db2bf16b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XqmwDCtgKbPJlj+PI9FGIQe/DbNkwJps8y+3Mf8YfJiI2U9P5iAOKlkzC/ZdhTqQSiuzi7vcZnQXn6W+aCyE8TBCczS1UgtZ/TUMVa3p71K5WsMqb7IYU0xAQHo/LE6unKvxcIOTaKJnUga3E+lH5cnUbs2LnT6BWYlk58QdKtlQmJsY3AZ3mEy7xC8Vo5iapogGQsO1dZ6pw4KziDj/zWMjnK2kw5hRxxujHKH5QyH5Z6RWxHkybC+LJSSEWZzLc7V9uZDEnQiXHtrBsQbCwVMmfiXbzjdUXD2rC/ClNuuLvMiwdJoyyp6VND/HI3w5Ro7P2QLqakqPCF2asOLcwiLZLgh4kmTofpwhhEZEUwtFKr5jhd8ZHQydFj+SeScXX4sIVKAabp+OPylbCk9VYp4E84J0epKRaIpZi5hmRdl5ajBD6tv5XXDys4Z4Ia4sOYFjrVQ8wkR96RDfjbSFqCIlKxT/jBjaSzrbz3mAvG42KXCwC2iid6fBMjsXMa1W7Ize8nKBxtGAqakloDzxPPY72ELTEAMSuC56on+PE8lD3MGDO3g1sm/sanT6kPs9j5MT7gMQcsBAslNCZywqzntdROVf/fl4s208YcK+RiaNqg5iXnWR/6p3+mxL1O2HuV33WfBnMoDdYKHlCx3a8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199018)(478600001)(66476007)(66556008)(8676002)(4326008)(66946007)(6636002)(41300700001)(5660300002)(44832011)(82960400001)(8936002)(26005)(6666004)(6512007)(6506007)(6862004)(316002)(186003)(83380400001)(6486002)(86362001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TR5tQqCBrUMdjcFqnUj5xbfLGxuOsVQ/nHDH4l/RC1MkDVHQeciaZJ3zQ5ev?=
 =?us-ascii?Q?r4pIQ/ueTL1hxgHmSgJe07Hom1ZzzAD3yN6bPKMdiLGoqfsneh7kdUY8lMsk?=
 =?us-ascii?Q?9alXNP5QDGT03tt1WIQoukLDuFpDQLPbZp9ZsDDzl30FrX8vJ6sTrk/a14nR?=
 =?us-ascii?Q?Q+0DyeU7O/KDG2yVrVEnPPFqA7EQyfxXn9ixGZtQ1yWdrT212dZ6K9xQ4GN/?=
 =?us-ascii?Q?uWiCUw0lOH37WNeVDUTM3tHa/N3mmQa2M8sxaCq70n5/0GfHjfMmGIesba9G?=
 =?us-ascii?Q?2rkUbEIp0v10O93FtFaVSLidbYU5j1yY0czYKFCRB5t7EHstGmn2fVixx4mI?=
 =?us-ascii?Q?gXKn9pMzWfq+e3Dodyp8BW0xuEbA5Xy5xRj4bLyaTBx08RGMz3Fd8G9tKmjY?=
 =?us-ascii?Q?Wtqmqash9ddi1kOMxznnTzQMcQfxWRDiDcTyFp4Wd/BlKbnixfEazs72iJ0d?=
 =?us-ascii?Q?6mVTtXdKMhPklGtM4SAaenXDJvOwAW6thPjSV7YSZYQ8IJs+4eLLMWh54Uc1?=
 =?us-ascii?Q?s7YGiYIn21xEvAqX/DaGrRO92yKR7qzFpIxn7+VsbWy5UcBCba6lkCTAk7ZG?=
 =?us-ascii?Q?UElxFV6s7EaYd9oilB+BWMpbAY73FDnFNKIom0JZ+TiRb63j0ZisROSHW3sc?=
 =?us-ascii?Q?Xx35pEi1rtyJDmWwzzbqGDe4QV8bTGo0BkoNNBfFAtbcV9K1pyc9Tf1RJFDr?=
 =?us-ascii?Q?wzIVDrKEaFpbBNLzrM+JbYuagkA1Ku5+J4H1wqL0EJETeLHnzStpFeNgrX96?=
 =?us-ascii?Q?4JIXBE9t/ylaF4uItOmYtihv39GiO2zZu+1zDuCazJ3P381nGTj+KixpL//B?=
 =?us-ascii?Q?hC4zBMnEZQI+UZxPTAJVHQ3oeGdhCn0+IymcTVdxUnKH6/sPd1BTvgJUOwfi?=
 =?us-ascii?Q?uq/Xs1TDGvxP/o51VmlYtOEuLECe8QJZ7PNGuRci+DZiX9qIJXB1w6yi3Nse?=
 =?us-ascii?Q?jTeYdRQKUUk+nwM2MaUZuyJDrXYMc5aW1AmHrI3QnkQ+lkDxzXB71fxY0Osx?=
 =?us-ascii?Q?e0d/y/uFi0E3MPrHsUIF+2lYYErR8l9ZBzLsUw81BTr/Sfzt+kIQXF19ByXD?=
 =?us-ascii?Q?S0/yjDFAVAYN9SS4I3dig+uwkhaYR9Kf9I7XQWwUkTvvMj3jqKAlSgIOksON?=
 =?us-ascii?Q?JDeXAfB0FRXBSxj5CresLCUUmQawcd6qz9LH68v0MZXP5+o27h25YP/Etbul?=
 =?us-ascii?Q?zOgUclG2+yaURcsQCYDmEK6cWb2dPyx7QWhlzS3S1HaPL2F2oMBPUNbDn2Yg?=
 =?us-ascii?Q?v0YmrGxTrOeK2kD0PzV257gEUOMjU7HtzpHkYvf0sd9emeAiMs/MhFi2givR?=
 =?us-ascii?Q?Dl627fLJtBN9avsr8fx/fqmiKwvFIQHaVP0WxmNj8JeG8cKki4Ec7xYM+CF4?=
 =?us-ascii?Q?47K/t+dEVjpj3+v4Y9Tj3S2DTBO5l8zhHDepNwJtJiyXdihTZmIwARozInxf?=
 =?us-ascii?Q?oNMiQrBPy7zwKybOkFGjO6jOJTH2TZLcIyf055BvckSw2yx+mIqgUxFyOi/T?=
 =?us-ascii?Q?kJcCQ00ljTR8zfJwDVBCBIyIejQEcvCSAE8SmoBJSmRclLsQ5WeJvY2o5Skp?=
 =?us-ascii?Q?FelF6/islF4v66q3qkGsx8rbI1YOdXRaL+Qk/7+pgkSir2WANjbyxOLThukX?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e398946d-3b86-479a-c826-08db2bf16b69
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:53:29.4452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACgxouLQpBrDejinCt6sOVVH8yaDQXfZdTD4lT4t2mqeTg6Kn0wCOy4H8gqxiUTZ/EfzP5hsNEm5ZHe3J8jbhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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

On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> In general, this is due to FW load failure, should just report
> error and fail the probe so that user can easily retry again.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>

I have not tested this but assuming you did:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>  drivers/gpu/drm/xe/xe_uc.c | 3 ---
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index daa433d0f2f5..8a436c95591e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  			goto err_force_wake;
>  	}
>  
> -	/* Allow driver to load if uC init fails (likely missing firmware) */
>  	err = xe_uc_init(&gt->uc);
> -	XE_WARN_ON(err);
> +	if (err)
> +		goto err_force_wake;
>  
>  	err = xe_uc_init_hwconfig(&gt->uc);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 4ccf2b3435e1..70eabf567156 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
>  	return 0;
>  
>  err:
> -	/* If any uC firmwares not found, fall back to execlists */
> -	xe_device_guc_submission_disable(uc_to_xe(uc));
> -
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 
