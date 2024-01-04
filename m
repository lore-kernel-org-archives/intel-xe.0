Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45808C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 21:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C6C10E544;
	Thu,  4 Jan 2024 21:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0F410E544
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 21:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704405353; x=1735941353;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3nALlufEm0EwzVrmfGaih25t3JM3r/GLeFfiL+6gLSY=;
 b=TmR3sLNpkY/7cpcWsgEYzLBnE2kroxLEHT6xXRKdJ7qMBKg5aP6PblSw
 AF1PVgHBHbhYeXOZ61DY+1qCx3iZhCSoZwoAjBQQWFMmStOLOXn/hOfFX
 FhaFlF3yPKq8pJWt9Gy/KbIRRRyhRDZfR/LnnygsLz8lnVe6Q1ErqRLS4
 EXShDeDgWZMji4vu3rRefVieEASzmf9yN6t2FF7UVVhbEJnHCNIfWEnRK
 QT6rdmGi0Q2hRkdSGvAAWo4fJvbHlQLFTJ5bLUQkUcknFxvNeas4pjwbt
 hJeXKed0ZjTUT53t7P2NFu4uw1IdL6Mft3Yp3rpx2mJYMTG8PF1FPXeJI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="396255139"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="396255139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 13:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="22636798"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 13:55:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 13:55:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 13:55:51 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 13:55:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmtYeoc/9pJLxvvK7bHe8t1O/Kqy8sef11t9AoJf/4xCqpyuyM+keICeLzbSQCjIbJ6vvjcdfr5srGtrHGbF6kMFsjZzoEe3rLusGP/EQWKzEGE7hyTU1Fy/S2fZWDA1yRzCOi5YDFZ172ykoH82iSdaseIeWyUqz2cpEuGHzRCP5IEiMI1AETaFHpL6tfgJD3OmkyTIO01I2zqHZxYontntP8R2YNPySh5teCPMQaUzX7qiO9wmUu0edkUF4+R1xII8dLRx0JW2lxgvb/cNEnUQwJOyJRy3YYU2F5tqvbh/fFCQr4Bj/lSrg2Xz4bezeSzcVdDqu97eX0LWYQSn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4mctIwrxexpY/ctv/htkjdJMOZm957VocBNotA51lo=;
 b=kLWvcYHTID4RCT03q8tItlwqGCNAKyMaOr13uBLhTR3HkPUQr0M3MNZUuyIj9rpH31PhpH+cXk/cNeElr1UIs+bd3GMneCjYiudgE/z8WJoU+EUbtLqq9hRfkD+kM7EudlV8TvxQIF7cEPsvdDHsl6oMtR0GA7ojl8KZBsk6fxIIepyo0jGUDVvsKZ27XCjUC25fujIeh3Vjay6XjAV6+Xkw2JueqAX23kQANtO1/O291S/yfeUcAcdKXJ14tnTf0fthhNuR4t53pjN47YNZOxaDOn5kZUsbdjHKUL9iPYmqsnaBS4lrdLJ4pgYTuvXu/eYUQtB4da29wkZruZXzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 21:55:50 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 21:55:50 +0000
Message-ID: <69ff1c8d-d844-44b2-af42-cbccc035ebfc@intel.com>
Date: Thu, 4 Jan 2024 13:55:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix exec IOCTL long running exec queue ring full
 condition
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240104080909.1271480-1-matthew.brost@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240104080909.1271480-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::22) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|PH7PR11MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c9d57c-3d6d-4603-50d0-08dc0d6fea08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9V7ZShapdk6MbNblDhV1xT/DrDmAjfkx4Ukal//ffNggAyoJbjcqmuZhOEkM+Uu58pekjw3MVw6bGY7OX8SHJHYz7qSgS2v2pjK6S9tVfYSM0tzGK0yCdqiLSz/dwAVxBSBIAi6AeAKB2nUMeonNfET2zYy6Q4WKFt5ZiXaSaQqynorRzLh6G6gZ2WWLRivyBB+3JAjzuoBIspShT+Y9M4ReT1tiOks+wqCl6ZkFz62D+lhxWAjjP/AGIR3uRu2lcfyh2HlwHgBeEWIijCdvpUkIqWWaU0MhGpEqJmiVVbOB/w9cdBEc1NnGMChFALCBDbUYGyBOJmMjrTjBGbaVvSAQriFmYO+Bes+iREfgTTUh0ThJF6bWGmpeOus1JgmNYkMXakUB9Oi38c1D8Gwxex5AzQ2NiVoi383af3Yyt90K/tIxip0kK3uWpvhwyiZKBWLDeELLlL0UHuUB4aiPh5vWix3F09rBeLgnyHjy8lU++SZIwGhs8c4XoDtoCYNT+jzVMJnHU13eS+WXmt3yvxiTGIoJMpmZt/Y5R2wUZND3Lik9YdlOOl4JrIBKxBKGSggoNbnjOMtQ6mMPGLG++vFv3IPsLIsO1EddEhFe5fvBlLv+whqerVG4+iCQOhynsYVUgiXsOyKxrnlG1tDZ1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(38100700002)(66476007)(53546011)(6512007)(86362001)(31696002)(36756003)(66946007)(6506007)(82960400001)(6486002)(2616005)(83380400001)(26005)(41300700001)(107886003)(4326008)(5660300002)(66556008)(316002)(2906002)(8676002)(8936002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmFhMzF0WDdHU1RwdlBwbWVPdGg5eEZzYWpPaWFMOUx4dXZZL1ZIbFJsaU9O?=
 =?utf-8?B?Q1VON0s1enA2aDlvL3BDd2x2QUF2M2U0Z2YrS3pxbGgvWWt5RmFDWWFwYzNq?=
 =?utf-8?B?Ynp6VVlRODdnV255VTc1d2RKS1FCYnBUWmh3TnA2MzZBcVpiZVdLUlQ0QTBF?=
 =?utf-8?B?UWxrT0xCdU02eUZ1dFdocUJnNzFERUErckdYNTBlZVRRaXpOQ0toR1d4WkY5?=
 =?utf-8?B?Zi9rTkUwNFdCRHd5c1ZCUzIyMi83TUVTTmdDSnR4NDM4NXNpOVVoMWI3eTk3?=
 =?utf-8?B?T2NqVTZjakY2ZDlleDR3YzFlcWZxWkMyaXpBWFRKOVNVRFFWZEhzWC8wRmRE?=
 =?utf-8?B?VFJZc1ZNRVRVcTVscy9SdHl0MWRpVUdpa0FuNlBzVXlFWmI3VW9mU2RGbm1G?=
 =?utf-8?B?djhaN2RIdE9KNG1KY0pJV1JqUWpNNFc0U2FtRi9SdkVpaDZnTXREejd6T2hz?=
 =?utf-8?B?aGZiYS9iam1KejdNK00xbGRsM1ZmWU94eFY4djQxMHpHeUE3ckI0dnJtUmRr?=
 =?utf-8?B?eHRVbDJtb2Q1TG9UcUp4S00vSEhlbDRTSmZhNVVyalFVZXMwOU9BNlA5aFM4?=
 =?utf-8?B?OWJObEhvQlJCbHYrbDhpK0g0SnhMY0xEUGZUamE2R0pGamtpU2ljZnFCV21J?=
 =?utf-8?B?QThCcnBBYkhYSkkrQ0hEY0x5eklBVHpaT1N6YUZzQ25SVWhnT0ZhM0xzY2Ew?=
 =?utf-8?B?L045T3BJODVOcUlUSEZNcUpjSkZ6L3NaaWVlWWVqTXhSWlZFSmZNU2tWU3Uv?=
 =?utf-8?B?ZjFkdVExWVRaS2k1dWxON1lSRjFJbUNJTCtqVHV6RktzS0RvOWdKTldpT1Av?=
 =?utf-8?B?bnVvaE9Palg2ZkhqanRCNVFjTndiemEweGRNNjZXWnNzNHd0QVNCWnB1YVFl?=
 =?utf-8?B?UVdtUlVGeXVvQ2FEMnpET2JTVU9CRVJ2RS9XT0Z1UmxEMEFDRkFIVVIvZ1I5?=
 =?utf-8?B?dDZqZ3NNcG85b1gwVDBXS3J3Qk0yUDhvQnNvWWpXa1lwQXZSWjczRWpHUmNz?=
 =?utf-8?B?VjlCVk9oZGtPa0dQbWdjYW1ZU1Y1WkZINHpGbXVYdzUxSFJLcGFaUlphUGt4?=
 =?utf-8?B?eG5qVDN5UjUrdGxaVi90VVJrb3VVTlZiMjg0UzdOOTgwYkcxS2VxZjNGaVI0?=
 =?utf-8?B?Y0ozbkJHL0J4MU1iYnlaVG9JUll3RTZSNGs5dUJiekJWTWg2elRySU9QQ3NG?=
 =?utf-8?B?MWd1anJmZHNld3JFQkgyTUpSVDgzdUVEUkMrQnlzU0dDRVh1NHZmQ0ZpTHlX?=
 =?utf-8?B?cVJ5SGFua3BidkFjTExJRXFiZzRRY1czWllZUVkxeXlCS05hRjY5UFdsclFl?=
 =?utf-8?B?R3I5YTIyOWdjcmFyeGp0eGQwWnRHcVdqVE82dHpUVFl4MkgrRTJ2TCtGUEls?=
 =?utf-8?B?bGtPNUF0TWFXL2V0NERLL0Z0T2RmNUZadmlaWW9MckNobTYxSGxaTUlhOFND?=
 =?utf-8?B?dEdMY0lSdGh3Mmh4bGwxVnlabkRrdzNlWjhvR2JNTWtRcmJEYW9kR21rMXRl?=
 =?utf-8?B?Z0F2OWM5cDBQTFFwUG1NS3RzUnFOODhSOTFqK3VMMms5WVlBNExEb2V4a2lG?=
 =?utf-8?B?YkxSR2Mydnd5TjdQNENrYlN4aHdOUGdhTFdvUnpINmZPRVh3N0c2ZThmNjNU?=
 =?utf-8?B?aU9lTmFBWHk3N1llbmUyQnJNSXhITVRBTFhvbkRvRmFabkJIb1U4MFoxNjND?=
 =?utf-8?B?NWFuSVJ6b25ianR4NGlFVmpCRUl3ZzFqMExKcGdUNEhwVUVEZlhnZkQ1T3Fk?=
 =?utf-8?B?R0pVSEhwQkxYWDF5blcwdk11U0NTS2VMUWJYU0hPNEtmazRKa3E4cGJQUWUx?=
 =?utf-8?B?QTA2cit4OUhBekFhMGhnNW4rTGd0a1BTbEw4QWIxVXNwYytWMTkzYjlad09j?=
 =?utf-8?B?Sk8rT25IUnI3T0xlRU9naHhhQVIzL01EVEV4c2I2UFRST0hoR2FoZ3pJaHJz?=
 =?utf-8?B?M2doMXFRT3NpU1g5ZVcvUFk0MjJRMmw5ZFRVbWdTSWZCYlZUbFlKZ3VGMllP?=
 =?utf-8?B?NllLN2lxR3p4TXJCMEdaZDZjQUlsbGlJR1k4VTZwNkZIL2lIOXZvVVBkU2ZZ?=
 =?utf-8?B?eDVMVVJTNjVwZTJlM0JzS3ZtTStKYS8yb1k5cm9aVExFUGNPN25BSXZ2WDFK?=
 =?utf-8?Q?De9YUdr6tbIZZ8ptci/BHRzXi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c9d57c-3d6d-4603-50d0-08dc0d6fea08
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 21:55:49.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd7P4kmyGhJEiumFUaTvsqgDcst0fRIy6iJOI5O42zEKfaK0soJ34ic9Rm5NJ95SbXX3O1HbC+gYjdxUEMM4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
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
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/4/2024 12:09 AM, Matthew Brost wrote:
> The intent is to return -EWOULDBLOCK to the user if a long running exec
> queue is full during the exec IOCTL. -EWOULDBLOCK aliases to -EAGAIN
> which results in the exec IOCTL doing a retry loop. Fix this by ensuring
> the retry loop is broken when returning -EWOULDBLOCK.
> 
> Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> Reported-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index d30c0d0689bc..c68e1bd15e6a 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -115,7 +115,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct xe_sched_job *job;
>   	struct dma_fence *rebind_fence;
>   	struct xe_vm *vm;
> -	bool write_locked;
> +	bool write_locked, skip_eagain = false;
>   	ktime_t end = 0;
>   	int err = 0;
>   
> @@ -227,7 +227,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	}
>   
>   	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> -		err = -EWOULDBLOCK;
> +		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
> +		skip_eagain = true;

Would using another error code be more clean and avoid confusion in 
user-space as well?   Such as -EBUSY here?

But if you feel strongly about using EWOULDBLOCK, fix looks good to me.
Reviewed-by: Brian Welty <brian.welty@intel.com>

>   		goto err_exec;
>   	}
>   
> @@ -337,7 +338,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		up_write(&vm->lock);
>   	else
>   		up_read(&vm->lock);
> -	if (err == -EAGAIN)
> +	if (err == -EAGAIN && !skip_eagain)
>   		goto retry;
>   err_syncs:
>   	for (i = 0; i < num_syncs; i++)
