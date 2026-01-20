Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2222AD2629E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846D10E097;
	Tue, 20 Jan 2026 20:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvH4qtP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC4510E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768941626; x=1800477626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WdG80s695fVb9lrjTQ18X70eiunqaq3gBoIqMVbfwIs=;
 b=KvH4qtP7xs76sMVbTyUIml/LwedDADlToz4nuTOzGOUPn2tI1Z5uHgkX
 1V8XAWuiQRg0a/xI4JELMqmGRm2TQR6wOTG4WiwqDt6XQqlvqNTZsD5QH
 wvRH8gE+JsV21KEgBWjKnrifFQ4d8N/28F8dJkCei9ybOxBOEVS0WG7Yt
 5z6savVA5nT7Mf1JxnqtGqt5QNjUkWyMRu8RYv/og42xZEB5Zw1ZTnIC2
 tXZfpo3mjOt+7VGX8Qu1dIgSVgVDvLCb2koBLtPbDWpdGRp8PI10nagvO
 HBHhy3h2K597EhcQ8EuI1mr8CrUGsLvYYKpF//2+VusVBQJ7C2fEtupKt w==;
X-CSE-ConnectionGUID: RS6gPlwiQI+yJHMsbKmh0w==
X-CSE-MsgGUID: juz98WhuQm6k1YdDtAlCoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92828876"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="92828876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:40:26 -0800
X-CSE-ConnectionGUID: UlX56jTSQay7AYztXC9jRA==
X-CSE-MsgGUID: 38nYXJfBTk6XdqtYuxCqDA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:40:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:40:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:40:24 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:40:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNuNSnb2kEtsk7FN+xbWp+OkdT+GLfHQJ2MyvRBG1XrzHD3Dp6c+8+XRO6wU4t0Z/P5zHWC1u0ftoAIVEKXPwcy7gzGp1kmVOnpGXmfCU8q34h8pCUF3/y5dSR+stR92xGlzktsb63Smji1NQYQhlaror6CB8LmblR5sKNcsL5iPlGAcMrEb5+1nM/q6VH2MCzETcVfM7AP3HjhR9rZpc2+Q8TfYdpDoe7p9VXLvkk7yrE8j6H/jmwwCqmT1qlRZsyreK35fKnV5Hdil/qUcke9tQVHIsQb/js+KHcU/lN2991BbkwjzwzKRzEKi38ffNWi4evQ/rmwhQmgF7NnIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNiKtrzzPD+/NSB5cMcKYunTEnZ4/AUMF3LHe92aOJo=;
 b=gUo0ZIhWSogOJo3xdN1mCNmrevt7oaV3ogUDlqvUYABlpdVTBqa9SUKbR/eXBEv+T15coRa5EuYfNF8L7UyaYjKV3K63JYHXr6lWb4EE1W7M2Gf9NyExeLS0xg3c91m6XHDq6imsvvAN+g92BJHP8D0yeM97NEKW5nv2E0T4bzxoBJkwFwcmLB8sB+fbcG+LU1hNf2pE+7OonUryjaRskaHiq7ODpyuicjSNgZWPGBDLepIlShGBZjh5SGPuPbhPIRfk4ZUvxzF50WU08/IcxT/lAbBeef32/LdZVAGqNc4vJZRvrdr+jJCuF+DZORSLK+i891kTVjRJodd/ZQv/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 20:40:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 20:40:22 +0000
Date: Tue, 20 Jan 2026 12:40:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/6] drm/xe/uc: Drop xe_guc_sanitize in favor of
 managed cleanup
Message-ID: <aW/oM41D+qnw65wh@lstrano-desk.jf.intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
 <20260120201621.2442803-6-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120201621.2442803-6-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dde8c09-e545-4ff9-2488-08de586421cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uyJkiC6FN4H+J4mzDnGer9wkxhXIYzmvVKBSMlGLKTFMxJvKKloZyD5KmYbb?=
 =?us-ascii?Q?yJk9962tefuN5ep1Bn2hXeBwA1OagxTd8xV2ghJ2cOgt1o4j97nXPn416sCL?=
 =?us-ascii?Q?+KC0CvxwgjQBgxRk0BawqS2QfSMllK1SQJPI5X6OeE7QclybvDp8MU+K3tYN?=
 =?us-ascii?Q?u4rE3vUsdBqX3T5HGzVKQgIOMFWJU+eMzDfEbk9irmOaCTidqTv/XwnOT4QO?=
 =?us-ascii?Q?HMmGLXV7AbYaff9jQHfzwC8DHZHnhE24NXxn9yffQwEMja7cNhngw6QNk6W1?=
 =?us-ascii?Q?UI7NOhDl2SstyePt8WOYHqfC40MlTTRg93cPUtPWC9YGWXzZz4XM3NdJlrqQ?=
 =?us-ascii?Q?DZnx8a6Ad1wiZzt+m11L7XIb6nW9vfVubKXVqm26e/TDiauuKT6kNEmQ2Z+e?=
 =?us-ascii?Q?BznD66QMe/znKfHIhTD4pJJEplRZBScmCHOPYRV8GY/1Qjj0ckX0ofi8mSBA?=
 =?us-ascii?Q?PP8dPluyR5NDI64c8mdBnuFfwPD/z8u06sKlFNEflI4KnihRI40VqmgXoqGL?=
 =?us-ascii?Q?mm9H/BWqczyShJysKoBcnDOrRZ9W6NhcMOTv58ujyL/T4fc30fqtScnVyYJ3?=
 =?us-ascii?Q?MooExY9HMBY1jmI0TjiYAma4zk7vk2T6XEpOzTTElqasjESzsMbd5EYVD5DN?=
 =?us-ascii?Q?9yr9HKPIyfvyDXHf3Ms3UHQxcb+qIyQCCliWzO/ecU6VWDEj+CfZXZLbq4lO?=
 =?us-ascii?Q?xTimel2owNZOhNAb2NXnkndRwUbVkgm1OocVYVKFmHldPGobe4bufLWX+6pI?=
 =?us-ascii?Q?ponfjmVkhZR15US3rga5IiV7ySuXIgwM92oStlAo5Vqg10xtrl9P/7b3oxl3?=
 =?us-ascii?Q?KllQzlHkqFd+Dy7Q3whCvCoc53EHzCova46oJgkqAGWcMche1fbYnuei5XBq?=
 =?us-ascii?Q?F1pNNN4w2F9wCclJoEyoUP0h4nMiI0nb65qYVveg2CIzT0C1CojzMWcvJq2N?=
 =?us-ascii?Q?dhmuZWLMiLFiyntK7Ev64DQ79UX0Z5iBs8eUjl90gwDUR2WfyEpi4qIGh6eT?=
 =?us-ascii?Q?rcQjSP/eSz4TG4FTjSod4mkuACByVR1INOWsSgNBDNNIvtQwaoWup3uKNoOK?=
 =?us-ascii?Q?y3Lj0skWpub9OLcr+yLob6XrkautTTFGuSkJ0lQo73LXZVzPULNNlS7a4wRg?=
 =?us-ascii?Q?7BkB2wIXQpeY3rp2YUkQxOTh9dHDHOmwbEZS93opgjkLZOZuT7CkZ/cnGPtS?=
 =?us-ascii?Q?pAOtu0BW7hq1Caf5IHZ5E1GQ4aW6Ll/WbvPHDduDIUb4VqQhPLNnBniJGRn1?=
 =?us-ascii?Q?1bFoeSnzj8aoeIeT0n4ZxPeeuyzjElVNyAfA7y1FzaljIYSinlJUteQwQ0ix?=
 =?us-ascii?Q?IS6jwiVMdjtNEFfwzJ5gJ1qrNtsC3/DYn77IDuwStdembwdcVpyUxAm9a2e9?=
 =?us-ascii?Q?EDt6++cm8NP2xkW3Fj7J3ipv8l7/x3YU0Gjrq29Ocl5yCzrg+fsi7v0akvKB?=
 =?us-ascii?Q?vJzLVb3kiXA5s6WARxCB61C+v9NqrLKYphculkY09vAgFAARCWNcAvytruai?=
 =?us-ascii?Q?d1YNGr9hz2sFtrBuLFu2Wrhj08sKVK3wVkHRlkrhG8JiJ7A3AwfDQ6zkAGEw?=
 =?us-ascii?Q?KjUAu7BAAZ0j/uoCa0s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+3ykGQ7PsVenJDKbT6WMOWqb4LjPTUi2pN77TnN7Z16F6sRQk9UHSgBEgVnF?=
 =?us-ascii?Q?YJJPUwAGLBb9SYfLFrIUVdZoCX8sky1LllhC4r6EL4R4to2iiFwqmqZWYqaz?=
 =?us-ascii?Q?jHjbqbeKCZJcE+VYIy2EQkHsrPVdc9ABiETOhxdCpSKuvtdjP6wNib3Xeli3?=
 =?us-ascii?Q?n4NjrvL1TTnUwwmYFqZuZSiKe8zDTS15pB/97386etnj9Z8QCPDhL1ItM+LM?=
 =?us-ascii?Q?Mox/BY4judbGDYM6Vv4/3Lcm89bgvj3gA7i7NDtRsRRW+QY2bLpYIiGJJZ3S?=
 =?us-ascii?Q?qIKa/qP2T7Iw76IFQqInoCzqeN/lwy5HmvdcJaOLGTrlrMAz8eA5SIvOocBo?=
 =?us-ascii?Q?lN3XuS3SH3OEfOWeYVhuJE6n0J/QR/zPhnyhx0NiVss5ly6e+6DOGTFEnQGq?=
 =?us-ascii?Q?54qBbza52rv5JVMWiTQx+gwJnQPKWve5bjcgwuvCnfhMm31c8Dp8k4kafsTI?=
 =?us-ascii?Q?5DFe6zFoD/TGQL2SBJb9lRZQnCBU2cY/8e2FRoosimUWqz0g5dviLOHhA1j7?=
 =?us-ascii?Q?LDjKiv+epzIm2GU+filQAHwrtGwj+OX8+7yg6xb2xMvtt0cSpy0wJtq1JNNZ?=
 =?us-ascii?Q?B+57XgWQLI8BJASuUmBAthK/BtHhCKMg1OR9DsLeyKab2LtyBeReSbWUrfqE?=
 =?us-ascii?Q?QP1KW1kQI88bEivaRjooO/nJP4J0H54UomjTFN6D6Xg6OjSYBTTdhY5UWEbm?=
 =?us-ascii?Q?j3Va6bah8S5+p0lg941PZZkFSKWu6KuPq+1ju5tahj+jDRD65GBmEHzysOki?=
 =?us-ascii?Q?laBAtinIA2GLUNasCS5F6gQwZyCL4sqTUWVjNSAXyHvF87ZdpM4O2VfRy/Vo?=
 =?us-ascii?Q?VZHrOaud+q2NZU/+eQuG6HS7c/QVe7kiVD57cMmbYtGDNk6FJEGKwatjt5me?=
 =?us-ascii?Q?ThFZpP6DNvRU2HhUsDL1In8AZA5ewX5dIK0zSiX0hdymIQjXxChdhbAUNHff?=
 =?us-ascii?Q?L80z0PFp5TKEwlRonnGBuQhOTYqiA9qtlBUxpmkjt78/MO5yXBsQJpf3v55S?=
 =?us-ascii?Q?aD8Vi3CgHKIncX6Z9uBTApPMSRL4VUb7L3+ibSo61ODY3uaMliczOLGZ66oh?=
 =?us-ascii?Q?smw3kE94+avYOUw7UVpDrI7xcs/cUouLzaLlkW+EoPPqvfqtER+c+unQ0PfQ?=
 =?us-ascii?Q?7wsqTv06PjX42bLHPPGujs05nwATL6DDZnmaIwS7ZnVaXp0EwNTYjfJo43kA?=
 =?us-ascii?Q?9Xl9i9rIGTSVZJAQTqHnGwCtMb8bVLfF50c4b4dd9TRhM2Y3CS2Vl1Msw9Uz?=
 =?us-ascii?Q?JzbBaPY2EGHcT0jKX+6jPOvKO3slqNBBxNggv0TfB6gxZCrxO/AK97aDv6X+?=
 =?us-ascii?Q?XvUZ2IRBOKdgdixWyQ4k24LQEUOxTb1eP6VuDzd5DQraLs0pxMmDUfnlEo13?=
 =?us-ascii?Q?V7J/TBAz7HndGrApO6f6ykfvwtTUeruY6JhWX0P89tEWuYQPpQ/2BTsvHrdP?=
 =?us-ascii?Q?SJybOG+WvE+iBCi49q/Sz9fy/EAy05iat34CrWxwqyjgZzgdjhh810ROz2QF?=
 =?us-ascii?Q?NqlQAmfXwMrp6q+49Z8Q4u9rkcHMkHDSTeJQQOi334SnQkppdmq1HdPtN+Vc?=
 =?us-ascii?Q?zbJcBdpHUYtsAUNGrQVG9Y8vfa58ccg+Vs3m7tv5b3yCaP+r/vZfthk/YtA0?=
 =?us-ascii?Q?9d1ybI/KGqA3AhRFE9vA5iOSjod5G33O93kyLomXgIV6/OSwCDLwMszFalMB?=
 =?us-ascii?Q?ZMULt1O9K1Biy4GajRbvBQxSFnys1f4cmnudfzqk9iDjQ6r8F2vae6GHtef8?=
 =?us-ascii?Q?e35VXaDfLvmYIr3sOZpPz60jKM038YA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dde8c09-e545-4ff9-2488-08de586421cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:40:22.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFCE29l+koJgwZag04h5QscR+puGLjuws8mD+31cvy0VRE9SjzeV5VRzNiy6eHfmX7tkb6vyOPPufw9EAoHtog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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

On Tue, Jan 20, 2026 at 03:16:20PM -0500, Zhanjun Dong wrote:
> Manual sanitization is redundant as the driver has transitioned to using
> device-managed actions for GuC state cleanup.

or if the firmware fails to load in GT resets the device is wedged also
initiating a GuC state cleanup.

With an adjusted comment:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3f63c2a7e86d..39101120d43a 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -171,7 +171,6 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);
>  	return err;
>  }
>  
> @@ -229,7 +228,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);
>  	return ret;
>  }
>  
> -- 
> 2.34.1
> 
