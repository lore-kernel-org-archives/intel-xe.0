Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB831C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AD011A0AA;
	Wed, 29 May 2024 18:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtRgLqOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E6411A0A3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717006908; x=1748542908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N6pyYu6P06mr6rgkwTuYYkGYEXxgCG2XgqaDdHwLJec=;
 b=JtRgLqODYpe2Uz+wgYgnn5hVxDzgFfIxxtJyM+0O6MQR+zG+QKi2JJPv
 iF1gQU9esECR7o9js/npk1uJCxNNedjDZ5kj5X3gKdDZCcGaUs7ySw/KP
 kwAcSfTifPSxmFAnalNLjI9+rARZxsbUMiJVc0M6x5uP6rVzpqeKuRqUm
 sx8r+5JnE3NLGoTdmv20QrVFHjKPV76haswdI9mcyvhqBTwJE8mPuNEEZ
 E0DRYKDmw6DKWzciLSYJx75Y0wjcj4CJJmwfRjwaZuKJMkjKI/+c4jCxC
 j0Zlcm98fAH8LdwEXBPRzpEVDR36KfMYKt53sK5+NJYGwm9Vt/NEppWe6 A==;
X-CSE-ConnectionGUID: GCNSsbMWSkOHTPtJetd9/w==
X-CSE-MsgGUID: wMpSoE9tTC2UjFxaGUXgYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13279117"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13279117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:21:47 -0700
X-CSE-ConnectionGUID: xuwrHCxPQBy4CHWmPjVp7g==
X-CSE-MsgGUID: hh8TdVV+QIqvuaEj1MLzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40384968"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 11:21:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 11:21:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 11:21:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 11:21:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 11:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRF9eY/LVPH253FP3tbBeZlHeZbs9HZ7UGT3wNHXmJy248vYU3rj08lR6S1OmaVmYA1hI+57WNf4dShnyEBTAg4i2cFwsCC6PVLB2uSZH5ikjZ0KBHfWCgfQdUs6ZJpGswbgWomVJo/LWClUFw37VdAvwWjhsf3E5ALZHEBPHmm3+Im5ASyX88NmAuR3xhfNHDCNOjqXTZb3DyXPfuQUvpV433/tfDmSFw0c+6eGbc32nIDV86Vja1rH9qo04OLctlKLo26ENXvtoVkMM2aDjyRjRb0XUIhcVAIRCRg8z7J3g4WctMUKAT3AT9YyPD9p+1beKl3c7R+lQXbfN1QwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9XL+2/8nfpGNwu/tupzAupEuYaA5/Ufgr685q9OpTI=;
 b=msQLBfaEUvheEWz0J2RqA1tInihF+g3JHYnhJDwb612vCq0hyn9cF6Q/i8ftWSQVUMbXp/MbgvRyfTxpOG2YAnZ8Bn/1OKpS62CucCr2VFGMPBRWn1NaMNyc/c9M+Wy+8wFU952NATqj8j+kp7n2Qkp/WTYQtZ7zVdoYOKiFGHKpPrKcuR83KtXrHpCSyAzsExF4qY9Oha2v5FY3L4Sxq4+KPYoLgzXlr3ox8dTLXtI0d5oP9gbAwsI2OB2IFol8KgYR7tss/O6L9iunMrJ0I1ngAwhTE1b3KyIulwmrX2/CD667Ya9yXL4UF/doKWVPe7EX6cGq5gUAEuP+Gnw7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 18:21:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 18:21:45 +0000
Date: Wed, 29 May 2024 18:20:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove unwanted mutex locking
Message-ID: <ZldyCKMYBSzrOtMv@DUT025-TGLU.fm.intel.com>
References: <20240529180851.10871-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240529180851.10871-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8a24e2-fad9-4cae-451a-08dc800c3222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ELgiqbGfGHxEmJa5ZtqCEoV4LlV3GTR9n+a6LGqsc+SUWCi8GM4l7iMBVYp6?=
 =?us-ascii?Q?np7UwAidxfFWYJ0tz8KMEfBKj62iQvZI0v0pXENsUKqFo/45OFZFF/JYnwro?=
 =?us-ascii?Q?esxOX4CkuBxQTzKq5tdqPfIKOumGl2cgPxY4b7rqyI9KPLVIiunmvo/Sx15l?=
 =?us-ascii?Q?nuAQWp19EDwXNQr2jQ/NdOdnqESK3RN2Hp0XnekUaZYS1fmGxZS8uqC7UuVG?=
 =?us-ascii?Q?2pmVVr/j8xnz8qnxteW7Uv4c4+BimR2grghZb3T4EiRGZY3a+qFLzSTjcciv?=
 =?us-ascii?Q?YrC/sUPIWNvF8vEsZ8OU0nmWZKiJETRzEYny98lxuBPOwdbejp/jUCexCEKE?=
 =?us-ascii?Q?vcCeUlqPmaN7j+UZDOIVJ/WRE729pXmNYF+UqK4cWWYS+U/CpLF37f6L52eH?=
 =?us-ascii?Q?NwUlnEPXDuDSvAWUpUh6aDXa1VmxTvCcK9qTvVt8M+wJaL4BRYTQKsXJ9XlG?=
 =?us-ascii?Q?8d282cQhFBGJp0d1yQjlA03iU+MwADPtJBehyOxZpibU506Ji0k3JTaM8etT?=
 =?us-ascii?Q?yWhkQpJAE7qlDzGYcn6kHOBsK8a6ZOSWNs6+wLZ0XkfYojBOIB8uD4HkBbOE?=
 =?us-ascii?Q?QwPVwaZrMjqlikk95kllISspw00om5oPm3OvspznE6vUG49RMICI1W+RExRw?=
 =?us-ascii?Q?x+CqmkkTpRyx09WjVL0l21MpL3gul4S9nJeDKr5NK2KkZUDx3dpQPMI1GyfX?=
 =?us-ascii?Q?SEG/NZmwD3atRSq8y4RE2Dq47SAPnjRmLyQ6IMB2vR9nmBVSgN4+hmgt4khQ?=
 =?us-ascii?Q?iaDc+RjoUw1PgM7c6TWEthqLtuAPvLsgg2ormDvQVK7jYo8Lg8Tc4YEUunC1?=
 =?us-ascii?Q?dOC/eEHwKvShmDwE50UJeH5/arKG6rh4xd/s9rSF879n9IlXBDnvDTQoLlrD?=
 =?us-ascii?Q?IoRyFo80CxlBRpQ7nLIGS9xBRDdgsBi6Y5aVDN51OI8Dx9P/DbT7QMYu39Bi?=
 =?us-ascii?Q?P0niEe2pO8HDPUQZRV3nhvMiHWuxrjlC1yWRVJZlNM6WTEEjbbKxTqmWmCSD?=
 =?us-ascii?Q?Li/BRR7yuu82kNOtPeNOi2oKE0owylTkW6iHItpoM8D+rTtLtc1i/sGvnlpU?=
 =?us-ascii?Q?xQH092zLwo5mu2nRkD59ojYXGK//5i5EVjxhTTZuUc+sAaF/poDI/YTMMT5b?=
 =?us-ascii?Q?yY3sgxd8g3ZaZgYAB53sFXEPUfF3IplsT3rxeuqBdODicln7DUL7h9f9QtQ/?=
 =?us-ascii?Q?Cvs+rN2sSxL+jmFAIePEohcXcWAaxfmvBH8zMhW1BBZ9qfT/0z06tbHsgLyM?=
 =?us-ascii?Q?xT8T0IoaPHjx56toCDGQKGbZAEy30ILBdG+uEZjvYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oJRGXVMxZ0DxY5+HEGQsKan6j2T/9VBYygc5HKvdG2WQ5/RHlpvCFZr4SDNB?=
 =?us-ascii?Q?7KidZXcwvIsOKa6ynG1PME3v1wfg/i9gn5empmVgYessCOpAoW7+OPtNGKgo?=
 =?us-ascii?Q?9wibso+gIcA8bGo+wHVQaFhz7PMcJUoO4Abup6M/sTMTOFr/kbK1FzHEwM3o?=
 =?us-ascii?Q?cq4F69bNDTF+BUJRTDJNDTWOd21eHOZLGGjW+tgeH+TGMgZVnwnfk546NwpH?=
 =?us-ascii?Q?HiDpyFwcPVVdfd7jPmxXEqU1sG3wWijoh9rTKAeQ4jryoEhvewdlNCFNfvoj?=
 =?us-ascii?Q?wRY/94psbUyejpzAHOlM17vXgT6RrBC86zpYrqQjhejEFCQsb3unLg8VXjjW?=
 =?us-ascii?Q?7xPqYrBh31ZPxzS4MG2iXEiDvNWP4jMkEM2hQPISVEgeTRY4/0rVXrtEFdEm?=
 =?us-ascii?Q?p128Lgzwaj9a91J0PrKLXuhbYLWidUAkVz14HqYWUGKH56BPqxVXwOJyrbtT?=
 =?us-ascii?Q?WsoJvjb0HB2Nhsez9y9OcHUPJwJpwXv4211XtwHXZZoYrRrfndzblKlzfwWe?=
 =?us-ascii?Q?QkgidmZDxV1xvAyLvg3HThDCjkTLuo2dv14gpUqVWE7E6ymodrRt2l2OXDM5?=
 =?us-ascii?Q?O48vIf8NWBOo8B+NBAg9MR4oDxdk5M7C2MZpwhHqaMIt7JB6A+1YnE7aKPwi?=
 =?us-ascii?Q?rfhxDzN4P49W9qNLGmy9NVW2bPUixp/GQMUyPM7HC5tAmCB7093JcvWtoNYa?=
 =?us-ascii?Q?NQFJmBpbJLRzB9eSk42qm5XJdoxQ6geJF7XvSZQ4Q91m3QNIHcqjnXfTHcJf?=
 =?us-ascii?Q?+N0SaO0sZ78hMFoxFyPSdgx+exxusNIMeM0+vNGq+0OJvU6Aua6SEp1JSNuE?=
 =?us-ascii?Q?nvVaTgchvBhtBGJX//CUOukVhnih9Utg8Ml4pR7eno3qsb8hmQJMBbvIoCOp?=
 =?us-ascii?Q?zM2KU+dIKNvKj88mO0fvgWQ/006AxWH1h0VGdp6YIQChvPgaR1EcYQFUdlYd?=
 =?us-ascii?Q?U/o60YsOyKVe19Ty4AOGZW4s8B0abEBTUutcrSfNNtii2HuCi64DLAsD1Ri/?=
 =?us-ascii?Q?Btf7+/NhEsqohrS+Tz5rdGWPBoBL1oc7O6k1/bOC/Qql2Qh0GCTmC5ud6SrC?=
 =?us-ascii?Q?a5197QXoMlPyEEPjNyefnQnr6Pcih4Tpy3sm9mrzF3nFt1wZyod+RB9A07ss?=
 =?us-ascii?Q?TljoJqsuNESEtTLiiQm0ZgsN6K3wgLDqf2WWQduA9/C8uoyesrbGbUNs4vVu?=
 =?us-ascii?Q?WsDnPITyJ9WTn2UaHxSa7Odj6+FbdxEEXoAQieYaHh79dqxb2eBYAEi6aNTV?=
 =?us-ascii?Q?Ukt3iH4xlVJbT5+u5k4vHnPWC3155Jm/LCXTaWD9vWPBMySMniJaO77Bt7dU?=
 =?us-ascii?Q?dpl6/+AznPTvQOr1vYpythGsr6mFCmZPRu3RlqFNMOyAdRGusJIZnTdq2/30?=
 =?us-ascii?Q?mlxLno+OKCsZcaxtXGEQuYasCmUPJ9sgQK6c+cMGiVOXaPIzze5MEjUCrpRj?=
 =?us-ascii?Q?6+WjxQKXwAExnLdItctz9lE07zg3+qK9fIm6IzFOvrSFMTVdMdphDA0PIABa?=
 =?us-ascii?Q?Fnf1totAQYHF9dS3mYFsB8DUgJ9qG1Bo5VncdCdgz94BolsMgdqdc0uZ/Cxk?=
 =?us-ascii?Q?WpT391sZIYuPTVqLPX4K3xxdR9MedoLicSAgAMuOnFXohsvShLR20LIqu72n?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8a24e2-fad9-4cae-451a-08dc800c3222
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 18:21:45.0037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPTBebyxDmbf2cc43fYY5mKdjQjWjAxDj2dMuO349XoctZYqD6dcWlMb21jcQ8GEXWCAbueZAiDOmK7/BBr/Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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

On Wed, May 29, 2024 at 11:08:51AM -0700, Niranjana Vishwanathapura wrote:
> Do not hold xef->exec_queue.lock mutex while parsing the xarray
> xef->exec_queue.xa in xe_file_close() as it is not needed and
> will cause an unwanted dependency between this lock and the vm->lock.
> 

To be uniform, we should also drop the xef->vm.lock in this function
too. Can be done in a follow up.

Also mention that this lock protects the lookup plus taking a reference
which doesn't apply to this code path. Maybe also say if FD is closing,
IOCTLs presumably can't be modifying the xarray.

With an updated commit message:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f04b11e45c2d..4cca16f2d4ed 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	unsigned long idx;
>  
> -	mutex_lock(&xef->exec_queue.lock);
> +	/* No locking needed here */
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> -	mutex_unlock(&xef->exec_queue.lock);
>  	xa_destroy(&xef->exec_queue.xa);
>  	mutex_destroy(&xef->exec_queue.lock);
>  	mutex_lock(&xef->vm.lock);
> -- 
> 2.43.0
> 
