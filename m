Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A48C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4A10E7DA;
	Thu,  7 Dec 2023 05:34:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435710E104
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701927255; x=1733463255;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z6gxp8ULaoUm+hReVvyqdqjl8Pw+9Yvr5Y8VbKFdMEk=;
 b=IPyvKo4lPaWGkIQLLGqba41wTdGlaM40Ps6urXb3I7I2qK4x/9OEnpHa
 CAToerMRDccKL+cN5947OlLUhAGkvOJ+2oTn/Jd29SEDuq6+WlhpttqpO
 4odPZEV3V+XlMuY596goFnLbclsFXjjsOOWX3bxzBcMQ4CMm/rHj+PgQo
 pFS73Y194Iwx7+m29Zs87Egz2SwxkHt4APKTVSTri8dpRCubtd+3Tvqoz
 btMcd+APIWag8lYxKG667BP0v2FVVIJAoW37DcsFATTLAqAV0OKgvHguM
 /l+YeK6SJXFcIo8WIyTE+UrQJ11qYuvqBn4PeDz+fMNhw1zsi5WFiMwPe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7482865"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7482865"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842087267"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842087267"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:34:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:34:14 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:34:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:34:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:34:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNw6sMKJjVp+QxoETWdL1ncDKPX5bcYvTs/Wn11lrFNl42p58epEreC9bi4Lfqy9KR98uzliW/ydnP3ifQtho3feqBuv6H/OxUZ4vcOWa1NmJxUck9ZzPezTYDXfmuPoJDlPxbV0z43TutqrrJ8xqtacEgFhn1bni8rgsF63/7lcFN0jFP4JTtROCGVfue9ukRmrdtTJjUOwpPZEafhiqZdKPj4bpOwqeoPp/9S79iSrSXOacMHVQ6DhsAgO+LHw0xIryp0qc9fEnSUjGLfiBd7nhftuZldkU26uFz9A+cYrbKVGBypZHsywIVz/KCbCR8N9N/v6cJq5XGhI3RTNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWZpxfc2vHM0Agcl079gcyNVvIsTisKcjhwoLs8QHnc=;
 b=D7SvBVY/VUI0Ej5OwpSCYhw5zKDTvq/VIXvXPAH17ZNIQ+dzVxvw8joyoxyBgyJBGzBkry/JPmstpXslPdCWKtLeunOp8bKCbf4Aj/MXXBX5fazuzVzuyz6l6iFWk8KVMgzsM6PJRSAbdLhQMUwK5d0HiQi06JQESDOn2H73sZa4HkYgrwWzVlfA7PDl1hL1y7hnCo/O4NC9YShzC613FX6vn9xSAOS128Ie7agsAL6z1OBnayTEUbF+XjmAocw3vi6GGcgLrZDGn4axhL2xMaUQspVB0hrTI1Y+vPXtboSYC0sjkJ64ZOzB6za9pgH5F6mnX/bgU31Ian612IkTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Thu, 7 Dec 2023 05:34:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 05:34:11 +0000
Message-ID: <046df246-d29f-4551-9df0-fcf8aa4502a9@intel.com>
Date: Thu, 7 Dec 2023 11:04:04 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231205213659.179813-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: d409914b-da1f-4193-9b6f-08dbf6e6242c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9vrDs4fQSHXNvJlDDCa4vXeuMJW8L/BHnXEYPnfLB4Gvh6kAgtdtQycyyLcZSXrCUMgf93sHdbCVobD1cxFmEloqZUCpWyd/zrenRZ0HbesmD7cyLprztm6DBQJyYDkWzAyctQLRQpABv8O6kEUmkC9Xl881Sd6e8jTlo6UvczaHVyie6i/GnGCh8+WJkU+6o1iYtvPbeUenR+66dUfFpcgsPQ+gi7byC6NQOEwnzdJDCSPcQtbNt4gcRaei1kS8zu0MmRXnyJPM4mcw4GLNNG6QVA6o2b1426GJDVgytWJgYU1jg+eMDjmAeWWFdvAiNizjtvZANyQj3dID/+urkKqD+tPvtZbojDxvzGDJJya3wjPcxRIc0IfuF1vzG0eypi00ncrhKNLr5nawS4yhqr+kyWWrPa/sozMRaCHfCqS+6r6KDS2As7Fv5VU/NfmYpmhCAUTq6xdK/wyCLrct/wv+zcZPIqXebVVDC9l8fRXrgS/lG7fxrCPxRw3M7pTU5qgWArZdaBm8XA60TbFEF3sJsR2lec9Z9DFgeSGHjwo78/HCGUjNGSsMR4lCtnsawg1NGORMUQenonW0pwnuRS32PHmwY1tFCQ1hHI0DSuADs/VCCrMV+tWFxAyMKbFyN5jgKXpCocZ1W3M/GNgxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(2906002)(5660300002)(41300700001)(44832011)(31686004)(86362001)(31696002)(4326008)(8676002)(8936002)(36756003)(66946007)(66476007)(66556008)(316002)(6486002)(478600001)(6666004)(83380400001)(82960400001)(53546011)(6506007)(26005)(107886003)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTZZUGxJY3dJOUZwZk9UaE9mbFBFZnFBVVRyRXhVcHgyZTlOa0hpR3NMTDdW?=
 =?utf-8?B?Y05IRTROR3ZhbGxGb09nUkdLY3k3WXJ5cnV6TnhKWE1CQXdIcS80UzhpZ21j?=
 =?utf-8?B?U3J3Y0dESWZlR0NsRk1rcmZzcUV0dXkvREczUytnSzJQYUQrVEZ1ZlZqNTRv?=
 =?utf-8?B?UzZ2L29GL0JvWVp0TklaSVgrSlZtTVB6WHkyKy9TaitiOG5YdFR2Z3JMcXRi?=
 =?utf-8?B?L2haNFVSYWJIcWFzWDVCRTF4NjUwclk4RWhyZllmZkpkUVRCV1JoTVI3RlM5?=
 =?utf-8?B?c0V4eTBhR0p6aEIxSmNmejMvREtqcDNOUXIvaDZKVk5GTEYxRjlZbnJacjBv?=
 =?utf-8?B?eHJ6amNMZ3NIWlhSTjFCaFZ5c0NKMFdyOVVVKzgzTXpDSnlSZG5kYVRIbG54?=
 =?utf-8?B?bE9EMFlUdU1XdGthVmJ2M1RIWFVBOVAyWTNyTTRxSkk1eWlzcUNTY1JWZEky?=
 =?utf-8?B?SkpUS0VaeDhRY0pDblAvV1ZtaVlsQXYrdzA2S3YwaWRKaVliVjZHT3p4T09W?=
 =?utf-8?B?RlY0Uml6M25zMEFQcnViM0NGWHkzRjNoNE5QWkdOcmUzLzJWS01yOFQweDJE?=
 =?utf-8?B?a2RTb0UzS21tV2dKRFFWV213RGZFSUkxeXplS2lZc3ovNFZqeVFiM1BhNkVY?=
 =?utf-8?B?K1dWSjdtQlVhaFJSSU5PcVJabU0xUnF4Nit5amNpOWQwMDJuOE45b1VOZmdE?=
 =?utf-8?B?T0FyaFJndDNFOXdZc1FtUU5KaGRmVWtRL2ZUMlRIQ2RzVzVVZ3RiQlUxL2ZS?=
 =?utf-8?B?WkFQK3haVXlPdWlWNjBOUi9lLzd3WDRsZG9SRitqRUJYQzd5RkM3bE8vbThZ?=
 =?utf-8?B?MDU0Z0ZqQ21KN2dQVkhlcmxqMzVEcnRCSEs0UXNsMDh4elJLanJjanQra3hX?=
 =?utf-8?B?M0tySzlSbTV3SXRzb1V0M1RwRk9JMDdOYS9KY3JnYVZIVzgyb2FpTTlISE9h?=
 =?utf-8?B?UnlJaURzaEFkY0VDY0M4TkY5QVhYckk5dmI3ZkpaWENpTFVoay9Pb1REdllX?=
 =?utf-8?B?TDR4c0xWMXJ5ZE8ySm9jNndXYks1UExPYWpyamRaMnJvaWIrQUlXNjFLMEZy?=
 =?utf-8?B?MGpFWVhqS3dZa3dsSmF0d0FlUkJOaXBWN1FTTGY5UFFHQTJndWRmaUdLd3RE?=
 =?utf-8?B?S05TbExUbjhqRG9nR3Z2Y3k0ZHdIYnJmazRmKzFBOHJ4NEUyNmJkeUM5Q2Iz?=
 =?utf-8?B?VTN3VVI4TCtmOGZMUkVWVWIwTHpFSFdFeDlIaklJYmVvbllRTUx5Sk9TNitw?=
 =?utf-8?B?WUtWT0EwNGs1dlJDQW9tSHBBamk5d0VITlJVdEJKMGpxcmdRd3JLQVc4eExh?=
 =?utf-8?B?OWhOTGFqS2t2NXQwTTBrMklxbHhzem5yQWRiSXBjbDdURnJJQ2VOTmkrZWh0?=
 =?utf-8?B?c3QvREIwRlBxL2M1cHpPVkg3QSsxUFNJd0V4dmgzU3gwckJOdXhCU3dSd0ZG?=
 =?utf-8?B?aU90cm50VmZQR0htN0dtVmIyZjlubjcvYXVoMEhoRE44S2ZITVMwbXdOem9H?=
 =?utf-8?B?M0VhbnQxZllDQUNQTi9Way9aMGxXMUhOVVFFb3Q3dWxxWisxSVoxSDIvUFhi?=
 =?utf-8?B?QWdBWVN4SGUwNG1rMEVJeVdtMHF2VFA0MmpjeFNiY3NIOThTOUVjb0oybFlQ?=
 =?utf-8?B?L0FTZGQreENiSElzOFlJVWQ4WXNmeXRiR1FoNnJwc1E5QVgxNDVBNzdRWGZq?=
 =?utf-8?B?STYvL3RZeDk2U0JtVmVmRytwTjIzVXduN0NSeFk0VEFMQ2RkNG5XcjUzVm1q?=
 =?utf-8?B?Vlg5OFc3QlpubkZGTnhhRWlVUlQyajVrNW5Oa2xRWmE1THIxVVMwWkwxMGxC?=
 =?utf-8?B?Nit3Z2g3SE9FNEF0dXA4L1pQREo4RGFWN0Qzc3YzeXFqY0UrUUlVaTYvYTZL?=
 =?utf-8?B?bE8zdzBEcG5lUVl3SXBzamc1S1A2dlViZEgydnd0VHBNSEI4MjNJWk9mMHky?=
 =?utf-8?B?ZVNHWUprcmttdU9hQTEwQXMrakxXN2U1Zmp3RmFtNVZRNmJ0dzkyY0RRT2l6?=
 =?utf-8?B?SG1YTzdpcXJHaCtBUDZsYXRKcGIzT2FqcWkwcm9LbEQxQ29VbEpIUEVLTmtK?=
 =?utf-8?B?TEk0L0JUejlPOGRBZjIwZzRZb3RIbXhkNndWWEtxbWlmNHQyN3JGdWJ3NUJ6?=
 =?utf-8?Q?QhUExuUmNBpYPYs4tfW4lx7v+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d409914b-da1f-4193-9b6f-08dbf6e6242c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:34:11.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8X/myEF5Wswt8Cs5wW+JoeQ4g3V2lO5yajRQmtA8dZiYMvVXlIOy7/xGJQgSeQCu30IfaTpkrB+geVXMsh7Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Change the name of frequency
 sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo/Suja

These changes are removed again in the second patch.
Is this patch required?

Thanks
Riana

On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> Switching the names of frequency sysfs attrbutes to align with
> required devfreq changes. The name changes are as below;
> 
> -freq_act -> act_freq
> -freq_cur -> cur_freq
> -freq_rpn -> rpn_freq
> -freq_rpe -> rpe_freq
> -freq_rp0 -> rp0_freq
> -freq_min -> min_freq
> -freq_max -> max_freq
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d2605a684b1c..b1876fbea669 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -60,15 +60,15 @@
>    * Xe's GuC PC provides a sysfs API for frequency management:
>    *
>    * device/gt#/freq_* *read-only* files:
> - * - freq_act: The actual resolved frequency decided by PCODE.
> - * - freq_cur: The current one requested by GuC PC to the Hardware.
> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the Hardware.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>    *
>    * device/gt#/freq_* *read-write* files:
> - * - freq_min: GuC PC min request.
> - * - freq_max: GuC PC max request.
> + * - min_freq: GuC PC min request.
> + * - max_freq: GuC PC max request.
>    *             If max <= min, then freq_min becomes a fixed frequency request.
>    *
>    * Render-C States:
> @@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>   }
>   
> -static ssize_t freq_act_show(struct device *dev,
> +static ssize_t act_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct kobject *kobj = &dev->kobj;
> @@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(freq_act);
> +static DEVICE_ATTR_RO(act_freq);
>   
> -static ssize_t freq_cur_show(struct device *dev,
> +static ssize_t cur_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct kobject *kobj = &dev->kobj;
> @@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(freq_cur);
> +static DEVICE_ATTR_RO(cur_freq);
>   
> -static ssize_t freq_rp0_show(struct device *dev,
> +static ssize_t rp0_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   
>   	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rp0);
> +static DEVICE_ATTR_RO(rp0_freq);
>   
> -static ssize_t freq_rpe_show(struct device *dev,
> +static ssize_t rpe_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>   	xe_device_mem_access_put(xe);
>   	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rpe);
> +static DEVICE_ATTR_RO(rpe_freq);
>   
> -static ssize_t freq_rpn_show(struct device *dev,
> +static ssize_t rpn_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   
>   	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rpn);
> +static DEVICE_ATTR_RO(rpn_freq);
>   
> -static ssize_t freq_min_show(struct device *dev,
> +static ssize_t min_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>   			      const char *buff, size_t count)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>   	xe_device_mem_access_put(pc_to_xe(pc));
>   	return ret ?: count;
>   }
> -static DEVICE_ATTR_RW(freq_min);
> +static DEVICE_ATTR_RW(min_freq);
>   
> -static ssize_t freq_max_show(struct device *dev,
> +static ssize_t max_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>   			      const char *buff, size_t count)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>   	xe_device_mem_access_put(pc_to_xe(pc));
>   	return ret ?: count;
>   }
> -static DEVICE_ATTR_RW(freq_max);
> +static DEVICE_ATTR_RW(max_freq);
>   
>   /**
>    * xe_guc_pc_c_status - get the current GT C state
> @@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>   }
>   
>   static const struct attribute *pc_attrs[] = {
> -	&dev_attr_freq_act.attr,
> -	&dev_attr_freq_cur.attr,
> -	&dev_attr_freq_rp0.attr,
> -	&dev_attr_freq_rpe.attr,
> -	&dev_attr_freq_rpn.attr,
> -	&dev_attr_freq_min.attr,
> -	&dev_attr_freq_max.attr,
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
>   	NULL
>   };
>   
