Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81B7E7B61E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BFE10E126;
	Wed,  4 Oct 2023 14:10:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FC010E126
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428619; x=1727964619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=46cU7COhyokJ8lnvspujV79lDylEsnMhbNF9qmk3dd8=;
 b=hE9SLzWUcj717QK3GL+Pqn08g4qllxc7f2XZk08x8KqwzyUxxTw0qYUu
 LBZHGfGtytNElQ5TYq/h9EeD+YH7PVAPsx4hZ5KGYtTMRWA1nzMQyCEzZ
 dEsvHTgL4xbfqiIwB1E3ru4qsxNHqaHirzx3IMGqSBxTBYI+Zq9JpEWkv
 inJMH4b/fBnll35OLFHhtIVyG3qXtrqG6KIYKsb+11ZPL3g6KKp9iqPco
 X81Kfu53v5xZp3uXQNAShqtSMKAvWBSHh6vL/Ql44AASAB5q1YPv+1lNL
 5bZxPhf2PGOsQz69v3KZOzVMhjIC7OFuY+Vgd0zPoMPv+yBDpXWd3erl1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380455634"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380455634"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998469550"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="998469550"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:10:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:10:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:10:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuDrfSsbPfqGOC80MXpqckzYV8MMmGng6TUJdgjX0zMaUtQurHcBeMm2l/RVkvdy1EMjh2Aox/fNrCMgQxqOsvxUSEYbeSXt5bxtQdlMSqTtPZ0LZZH04W9K1fbtgSolaQDtUWwCxVdW7vDKZ5VVU1Uv1oKh0mDYAV4/XkHmlQcR2mYG/rqxWXl6yGzRNyEBo3RcZkC8catEwwQ0hFHepRZl9yhcM2ot8Mhh/wx8h6Ep6GpYGVTThJIOOYGOEnI0c8tFm0vag+1cT+jTx4CuBTdK69kdS/UJiq9iUd7LvVvOYQP0x4BEBqytfVKpAbHxHFNRPsFhhzLLM3zhWnRkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npDaW67XEOGqYx8RFf1O9kLgnRKoUC456RLTROn6K+A=;
 b=B03i42QRw9DHIsjb0rkCozyvaxLhRLkhGPgXKAJOUJj1K6s2Y13YR5n8BJTwKvVDPvbo85TibQuoewjtQvpnqlW0XBQ+IZUbKzMG3z3z2Ga9Lw2avRfGxK/9RXLgHHAfVVCWS7nTjH5NRK3wexngajsvMztXVhzN+4bcroFRvJViY4vrs6qmK9s7CpYE0uLEC/x81A7NIMIqHCTZM3MAlZlMcGbht7kA5gXWMckxiP3HBPdIqdhpDvzDLn3jmK7AqF1vgviHXgQNn60phk2sp89Wc6SDIFhX3o0ff3hQVPOOtIZ+OSDmJGFUQmAkSDyWYaa68gbU/+05Wsr9aC6L+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 4 Oct
 2023 14:10:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:10:02 +0000
Date: Wed, 4 Oct 2023 10:09:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1yNVwesqJJDyvD@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <a96154bff006a4bc7d498347c8b6602b7524482d.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a96154bff006a4bc7d498347c8b6602b7524482d.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: d60a9f91-b2a5-4bdb-ea5e-08dbc4e399b1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A08cXN3np9Bc1Yx+lpns0FS6JOo+7VGvGG8eFs/aJhB16vL5OngNxDxqPyB5QkojMLVzohEU/smLZDfYgsHftAlHsxENqtd9bKBRQbsuAF7MamWMLJJl92RzR80qIEI0gabcm4L+6wfPzzgLh/VPNNoUvaKzMkMgymu5A+wYIpO7dd804JgeKFdCwOjblF6d/IIgD/mEbz4hNFYjRZMsvL4LPXBRhN2gKyvGWO4Voom2OM20Bpd6MO8F/+niQi9P2qo9G/4iJPgyzXa8atHrQniaY0hmWm+/T/DtZ5oMrtJDjr5uBCjyXu9ZdmvDHZXHx+3aiA843QvchLTWhC725aff6IYscZQBjuaS0ROlCW6AaPXqaVVg1KBZRV4PjeCe+qgtaaEio3ZK00yg79xfTD7vcKvX9PgeQJQwr6Hcge5Rs42r68NzjUplLhnCEMh38L3CgqwjrTKxuTsl1RE7fU+z0sEJBty88ZwyMnUhWAnD6zYeemlAHwZG9NagpP+72KVPBHNkg+Y5d6rCTB/6FERfgM5fW2AC1my7Dfm1hmjaEofYSj3saS/cMsviXh10
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(83380400001)(26005)(38100700002)(6666004)(478600001)(86362001)(2616005)(36756003)(6512007)(6506007)(6486002)(44832011)(6862004)(41300700001)(316002)(4326008)(8676002)(37006003)(66556008)(6636002)(66946007)(8936002)(5660300002)(66476007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Ygi7v4RtAu333io74g9T+/q7npfqevBaaDlEolL+drprMuKqEwnNXNX3ogb?=
 =?us-ascii?Q?1SLZf9g2lXdVUzIKWKLgL2BLBMl0d+xMPzpyziB4FdYuGzmaT39yqlapvptu?=
 =?us-ascii?Q?RNKxhhoM6TKkokHULMO5NCXkLLRE+eD4ZAEmW8Ba1zytWGPEOV8xq6DBRhRh?=
 =?us-ascii?Q?YOq4Ry9wfAzTlboo3K3baGFHaZO+3QhEgF8W/LhPwq6FJQy2WskpZ21vMdX9?=
 =?us-ascii?Q?RPXxkCRzqrWm8qHhoXixA5Ik6Df986ZxYqgynlxpWlMWw8aGy2hGkblAINgq?=
 =?us-ascii?Q?TipGF7VOgJ3qMkttPlluAdxr5OwxL/nesF0QMf41uWYqpkqmEbMYWv7AqoF8?=
 =?us-ascii?Q?ajK8U4B/l8MM4BEXz7loNoFKQlzUA15FTHRh0uydGtQvFDoqF/pMTXxHpLYY?=
 =?us-ascii?Q?Bp3ePHnxnfLc/KGxQRKg9i5Kg1eMRYMnlnv8t2ohoDnxNsN8y00Jat5Ki6TH?=
 =?us-ascii?Q?BIIg+2UaIUbc0/oM0PR+bGcMISSdiNRm90/vRPQuH3fL0lBgy7CLEAmDGl/Y?=
 =?us-ascii?Q?oJXqDqGS0evpmY0hxeaUHWZuBheWAjvqxCc/Xa8l8Vrc47Hrt5DKLf+6qtA2?=
 =?us-ascii?Q?RZSq46pNDCnYr4s1jcPZiOoqKQTSecuSLA+86zPmus4ivB8hb56y+DtiUBxU?=
 =?us-ascii?Q?U0hCUVvWvXywkTizoCEECHn5IngBifCDQe6qa0yPKIsNILfMQd782r4gN1Hn?=
 =?us-ascii?Q?QhRXT3hZawPA4u9tB+JFqK+0PEK+G+dUo9KKn8kGR/tEY5W33QcJitRf/uKP?=
 =?us-ascii?Q?8YabAAJV2j8rvN1UZ0hfn8J/eiYyf5e/o2/NHjd4OVCay8FiFM05I8PddOng?=
 =?us-ascii?Q?E9dM2WXAG3vT65wRS14w0hIDRz5QW6RS/gVF3Op50M1wKZirFtiTSfCimnCW?=
 =?us-ascii?Q?r0VMslkycU3yJJsEm4KXvFt+vYY9Vm4qmTogOCvb3de2c8qfDudPCpqP2y2+?=
 =?us-ascii?Q?pMg6GoMpM09vsRQjfREb1ZcKrdUPGZ1zMHrSMOfZzWlIRttpP/Eus+v/PU63?=
 =?us-ascii?Q?NYiv9jUJ+YLruC1y5oCVcg2NIUyg+iOwS58V03VPJQXIVSm+6ihN6Pwc3LFQ?=
 =?us-ascii?Q?atI4P0TDVvGn8LwrHPT2bXqT9Bv68+kXGN4VYdR/doQmQmmlQhrvvw343oWR?=
 =?us-ascii?Q?5B3AWGgyN0yQfl+mEpKxum0jP0LvVY5Z14h8dmj0E+WurBKRFLOvWp8Jxbhc?=
 =?us-ascii?Q?CT6Ovo4ogVmOtosfMXnxEW32r6AK5Wz6f/r6bs30eG01vIW8laFsmMgCNElA?=
 =?us-ascii?Q?W8iXDx1GmTQcQILm5RNshxIYZb2N5AmLp11wxRQ6fErkPe1YUgvDQV3tmkR2?=
 =?us-ascii?Q?7ZlQhfAyKpmK3mYjJ6dCiTWuBmIa0H1be+lvzibPUeEPRb0xQHoaqdZlIvUJ?=
 =?us-ascii?Q?N7BevLI45JrDUCdrqabOGWfoLyGve4tAtQfACpq+2STLGglnkqNvxPrG1mzC?=
 =?us-ascii?Q?gesC2DJue8pjtMSy6AwP96su9Bc4tJYhS9cCWjajvdDD4p10Wjqc44tt5IJ3?=
 =?us-ascii?Q?uUPqtXadYbTDxIqieprWdN6ueQwRXgGrrXX8ZeMHJBqZr6V9Zq0frbM7Fgl5?=
 =?us-ascii?Q?NCJHP4/w/JH/BTBWZtGCCQ5B364fy2jnSp4IAH7AOqG6R9T6zzoXYxEnBxtC?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d60a9f91-b2a5-4bdb-ea5e-08dbc4e399b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:10:02.6179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGYIvlElmYn4p96rpZKwtXTCFp8GydpIhul7vA0y7f6fC6abZBKzRIVqBQ4WGSpdnXHlhHa40bC0+JdCyXvqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:57PM +0300, Jani Nikula wrote:
> These checks no longer make sense, as has_display() has already been
> checked.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I haven't carefully checked the code path, but it makes sense to me

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_display.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 70e7afc0a890..f8ca8ad65ef7 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -349,8 +349,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> -	if (has_display(xe))
> -		drm_kms_helper_poll_disable(&xe->drm);
> +	drm_kms_helper_poll_disable(&xe->drm);
>  
>  	intel_display_driver_suspend(xe);
>  
> @@ -395,8 +394,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>  
>  	intel_dmc_resume(xe);
>  
> -	if (has_display(xe))
> -		drm_mode_config_reset(&xe->drm);
> +	drm_mode_config_reset(&xe->drm);
>  
>  	intel_display_driver_init_hw(xe);
>  	intel_hpd_init(xe);
> @@ -406,8 +404,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>  	intel_display_driver_resume(xe);
>  
>  	intel_hpd_poll_disable(xe);
> -	if (has_display(xe))
> -		drm_kms_helper_poll_enable(&xe->drm);
> +	drm_kms_helper_poll_enable(&xe->drm);
>  
>  	intel_opregion_resume(xe);
>  
> -- 
> 2.39.2
> 
