Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DF9D0BB43
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C7210E139;
	Wed, 23 Oct 2024 22:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2Qtevea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9DC10E139
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729723182; x=1761259182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vj8ZA088dEH9M6+edU+v8+26Q3tNWalmsh1wq3EEE4Q=;
 b=A2QteveaWNI0YZPvRwQCn8e9Cfjz/cwFVR98Bi/HWdHlvZ+ToZmvZeMx
 pHuYdQSRCvTGzxtjilz7+QlcVhZDboPndj2sY/ISSGpFjJXdMl+Zr8uEd
 IEVIS7hTfO5WGGJCUUFFfJU1P6uhb19HkzwfpY+zbAHOfIue6FzD46DRT
 IIQjUzJ8OLl3o864kNSpW6oT1gGu3J1JNOkL0s4p6Ol3Lql29R036mLQS
 FPdNPDmkWE7feuAbitBcVLuhfpuZH+Szeyh8pxBDHdUvstkwqgu6ksJCQ
 kZ9B79wqyjHVcNRZ1vbAmlDKcLPYrTyadmT6XiJek74xUjjDKU6YOCz9Z A==;
X-CSE-ConnectionGUID: dNMyR71lSICRqdWWzb04vw==
X-CSE-MsgGUID: pByNhS79T5uGUYtzmU+2xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29267057"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29267057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:39:41 -0700
X-CSE-ConnectionGUID: UH3ylKj9Svumn7Sgbw3d7Q==
X-CSE-MsgGUID: lkH2MKFyRsKI2jGyN1ygWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111210310"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:39:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:39:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:39:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1ZwVI8H23nJdse9Qecrd5fcwvRg2NZ1GiS4hmpmJB9GolyArwvtuTDoauN0eRivYin96LlR+BglHiecaEYO8AinpIMrXJdWM8jhvJbDtAmL4mduIfRuKtNLR4AYcBFLMAGzQHXjnETOI+wOuR/LUweDLtlAxyz8u24Jh3WmmWnt5TkgJfNQI4Nruc9jtc2gK1B/9dvsNYMy46mSPrlnAR6G0oL3OeKemKNOUxPeJX2RQ5IZ/07SF3a/4GfQLt9B2ojYyqoyI33mc5Sgi0UHi5PFrKfPlMznJ0GMu3nCLebsos8yC1P9L2OFxLK/a3MAckBPq9buXcAKBOCNCfxqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYjGb/XturxvHn2J/JtzZg1gGzQA8X7VIhgYS8WH6yI=;
 b=RZxSTVy7d4Jk/B8pMHJhgKC5No74DAw4oXFC1lRcBRmsyoNjWpdsC8/i7qlwD/UeptdGi1T+tR/SQCX7AkKWPOGywUApUxSdrnErCX4yvpMvgYDfTXcNf/kL7Mi1Jbekdk/yhNf7l95SscSn8knAgpvfLgOYO6qZRgTX7a2YaSOufDZaoNWGThBPAUI2DcGBQwBbUMGja17XSn+YBIHF5Y1IcncXXTRRg2gTBviCTikDeY7sEQ1gJLgur1GyCYyLpC69y7n8miJmAlP65NXqOFv7Cd5g2U6a5UkWSAFYzpdwq47YRSRk6Gy7XahMtTxJd4LtH7Bxa56pBpzGZGSl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 22:39:37 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:39:36 +0000
Date: Wed, 23 Oct 2024 22:39:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
Message-ID: <Zxl7FTC+E7g3uNwp@DUT025-TGLU.fm.intel.com>
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023155817.3618388-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a8bf3c-6de9-45ea-5699-08dcf3b392c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZvILTL45E8OUrXjrAwWoa1QUxryw1bZmqW/2gta7DH3hFirAOXhdGr8qZrpn?=
 =?us-ascii?Q?FMhXodLJGOhVxhKGfOB2OCasKLkt/aETj6ybzOzyJL3dRMyDCsS08BCyLyt9?=
 =?us-ascii?Q?zNu7rjGDhEjFLiuLVMzy02k+3vLXx7CHkEnKC12F4RsRqAeJcu8iwmNWt7cb?=
 =?us-ascii?Q?PssLjjg9O1jxJ3wfgBwce9a3gg8NTbNEl2GwmlpMTOv/r2RVlLWkRidfcxJL?=
 =?us-ascii?Q?f9GWRHTT24Lzx4p0RNOES1G0JuoDzeIWFK0Uf7y2bFTIW3a6a/5b4L/0WkXG?=
 =?us-ascii?Q?GbHYl9u/CecWrom8hS58aZj5ZA0sPP86/f2l57bT1UWK/V5wVvBBZA992Ju4?=
 =?us-ascii?Q?uymBpIsuUCwbaFYs/ViFroA6G8TCiToeXKmCvdu2gOoNxQh7ATMFxFjmiw4u?=
 =?us-ascii?Q?9EzG/KtbnKiLS+iveAsHdfuCPvOMODOx7sudcurfesZ674tQbHJWMBT4q8tv?=
 =?us-ascii?Q?9n9ocMnZCWr/qZeOVYMqo5VZrBtFPVPAE+yJuwaacmrisRqGgYH7KOrZiPTn?=
 =?us-ascii?Q?/M8qhEcotvrBhpOKTFDED9h5VPZ+P2gP6wjmswzq1eRjQ+mliUeLzz/nWI4k?=
 =?us-ascii?Q?qaPl4B5bM2paRgBhHKtwU2KH/wMTsorCry83fisX+/7VMgwR5d4YhmHRiq35?=
 =?us-ascii?Q?9P6g1ThTLybkPSnImc2y215A/f4FH97HL3okp668xTOMgUYzM3iYOPP3j4z9?=
 =?us-ascii?Q?CGiT9pqKhFi6E0DvYVYnHJ1t5GCx2CBk7SM8Aa3+cv1+DTWyibj1bDqLK9O0?=
 =?us-ascii?Q?fVGEbVPn5D1AodBpF/qSHcPcSFbQ9v5JZiTMi7L3W0lbPGoMi4LVlrAZuxlF?=
 =?us-ascii?Q?YMclb6KSheP3XjLgJRA6kKvnInKsCl7s3beiTUgBBzHltwGVNffkFGECSVkU?=
 =?us-ascii?Q?EH6EKOzTw3rovt3wtPdIPGg2ylADTZzCW8egqapy9alfC8U3zpERQa7531LG?=
 =?us-ascii?Q?et5HqWfsGaV1kpVAsQmq43GUk26jNVoLcsYPoQfOXfdqFas2SJTbe0BEIz6M?=
 =?us-ascii?Q?E3owwQ+4xjWbovcNEIJd2lfMobQTJbGWCM+QX92sy7K21l+VhZzpDOhu1VUy?=
 =?us-ascii?Q?sz9xWAeK8obHw77gMRPKxmS8IDxMh3tgOEJhVUj0QqoZH25+eBqizmOPC7oF?=
 =?us-ascii?Q?vroXJa6UOtwb/yqU5NZkg5MeqhCOTFGmGD8JQto8Ym6CBx6GW8gMtoy/5mNl?=
 =?us-ascii?Q?DMWbtJpcQIlgVWnofPpXdQ/GOKp/37VaEo+ha5es1+Je3Rj87HzZjGwyAAkp?=
 =?us-ascii?Q?04CEoZAZH5fPgIJWw0fc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1H25pqDKBqTc/9IJBgpw4Mogjg9MAMOEjGAVGwQ+k4lOHkxDwx3lL8frTtfb?=
 =?us-ascii?Q?3Se7Lpn8T4poaJwHVqilV9YhoAcuI7C84Kts5cRspFHDslkp5tFRXLQj6O48?=
 =?us-ascii?Q?vMpRzaHpyEt+IylIC6R1/VTTcZJ29mRSGf1KcGLP+rhLxpwsAqGDtymk8w/o?=
 =?us-ascii?Q?k3svBNSevsAQJcyYZ9D2XCcVmx6WcVDp7JdKm0NS+Sqx74+AxAQBU/0Zdh/x?=
 =?us-ascii?Q?4vUWCwnKjDb4Lk2OoUKjpMkxHpGY5NkhyasFEE14txliGNJuZswZpdG9aY7I?=
 =?us-ascii?Q?kGLpW6iyf/mguGdfwtHgrMg4ocZpKKiT5O9Ln61NpIBqW1UEwW0Wd71YwcxY?=
 =?us-ascii?Q?K4hMU9m2+jQLSIWIUovwOK8WCePrXpSSEoK6gYPAPkrNIepmpJSGT+3r0LiJ?=
 =?us-ascii?Q?7pAFt6ZIdILIPXzEOhoi2WuA/jgs3eSuJd1mAGzB7BuUZL12sHFXiDMXldS+?=
 =?us-ascii?Q?q41pwzhfe09yW5aOr8465huym8APnp8+2h172NRykV5j+be/7nwqjEq+ZXa2?=
 =?us-ascii?Q?ksAMV4GZ6hsHhQGKVXRNZjJX7dCT0EcNZyApxhObEi5XPf5uhzmFgUl3vXpQ?=
 =?us-ascii?Q?SynbaXFMjfDMTacvm8gSQ+DA6EQPSjx9RL6UNApL2ri3co94rj0YeiMbO3Os?=
 =?us-ascii?Q?n8xAI638lAEjj7MShgvzAxi5S8oXUlHeXmp6I4gXB6oIhIDF1ovqZGPSBC7J?=
 =?us-ascii?Q?TV9B9QOsHYzG/+jIf6wrR2Djx63Ii+dvJ5LMCkLSzKqUcTfAJAx0Aa9AOrXW?=
 =?us-ascii?Q?NlG7TtTOxdLPrU26pC453LFb3ar9RxVm6bkiRjkyG+sIDuWc20IHDLueo9R0?=
 =?us-ascii?Q?f62nU4/skyQLPnwm+W302kEE+s4JdjJvALsL/ouo+eskUr/qXo1RcVAd3kbm?=
 =?us-ascii?Q?Qqpe/ZF4wLohTwv78h/Lp7Oc1mgc6qyh015RhaaNjNutEX7pH2Q3Pr1OqKTx?=
 =?us-ascii?Q?czgcrN68kLV0MVouGNhaSJkJ/dO6LIJIkYdq0ojlTBT977tdPzHgBuHq90ig?=
 =?us-ascii?Q?XXhKMYtIHwyFEQx+spdrT8sz9VIR4gAkHWxZNdLGaPssir+kUtX64Hpcr+SO?=
 =?us-ascii?Q?AzYWMJXnjZDcRPF7cUHZCWOEteYBrwUM+V4EvNio+KrbiZkeXFZDgZlUL2V6?=
 =?us-ascii?Q?aeG0uxomMMsAgh1gVXRkwQqb+i1TcV9udtyYcVNg99Osl8hf/IDrCrQXyxyT?=
 =?us-ascii?Q?zgOT7Z2NOmOn+GImSbCiJEV5ivphcPuxGG94NKhCaZsE7FX9qMN5spTq6eD2?=
 =?us-ascii?Q?HLlOuhnxwFLgr+42LMamU2LnEihxTdgVfSr2i3vslZJ2tddWXj/XC8Lf6yZh?=
 =?us-ascii?Q?tskhsSL9WK/ku2PwwalelzCUn0sVmW+XvPKkkXIMrCW/JxFO7IGU2NXQvX/9?=
 =?us-ascii?Q?wXgnxdJC64CpHMOzyAcjlCKvHUZHt35SF6wllmc3GzZB5qXy93TFgan9nhSm?=
 =?us-ascii?Q?Y7SWX7U/xVvJ2cYn85Hzq+PJmbuT345VG1L+UuJw6pUOpLfRF/495nwkPK5O?=
 =?us-ascii?Q?5+F9FPMhqRoTo9cbtn/ju2wqTlyYzcE9XtGTZ5orFU/Td8PxdrOYCE9SjOWs?=
 =?us-ascii?Q?NMAvjaEiozszTXJyfBeFZvSfm6evlqjl0OzFApSPyRmNRir6IjlC6xCTwxzl?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a8bf3c-6de9-45ea-5699-08dcf3b392c4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:39:36.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ou2bDaOamkvL/RoWSmI/+Q+jSoIkuCps0530OqG+fjWF/QxTC11E763zMcwAX2HTiOgXLgP2UDZWAg132zDYCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

On Wed, Oct 23, 2024 at 05:58:17PM +0200, Nirmoy Das wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points recent scheduling issue with E-cores.
> 
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Seems like a reasonable W/A for now which I think we want in 6.12 too.
I'd follow up with the maintainer who is doing our 6.12 PR to make sure
this gets in.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f5deb81eba01..7f034871345b 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		if (!timeout) {
> +			/*
> +			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +			 * in case of g2h response timeout")
> +			 *
> +			 * TODO: Drop this change once workqueue scheduling delay issue is
> +			 * fixed on LNL Hybrid CPU.
> +			 */
> +			__flush_workqueue(xe->ordered_wq);
> +			err = do_compare(addr, args->value, args->mask, args->op);
> +			if (err <= 0)
> +				break;
>  			err = -ETIME;
>  			break;
>  		}
> -- 
> 2.46.0
> 
