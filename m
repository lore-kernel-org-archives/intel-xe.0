Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F25C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 18:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1D11253E;
	Tue,  9 Apr 2024 18:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbAX8kk7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19E811253E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712685679; x=1744221679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=33vuNHauWw+gUPb+V/v6j48fUFTvqPbxnZMcgU/QNXg=;
 b=nbAX8kk7MwUIEOMLQEqSweHgVy7HirThO12p4G5fplm9wCxIiGMOTPb9
 58CiEqIC2cH9Zj6tj+QMAbJL4/K0+M4FGfrpLz+4AU6XzDJ9InoMQoa1F
 IB783v9e5WWJBnmygxFHbPcYu9qT+lI4etn8a7NLzBRZQe7h8AMViBTlf
 l0nLt3ai9INdHa0nEuBuEzs+d+JuatW+omoU6U0xK1iTtozHOcLtqdO3S
 jIkeHnvJo2B/qfhAG4ZGBhkyOTpfdaVJYb/IufKkReIX8KurkRlW+Vyi2
 zpnFIeJI3MxCvjtdNmRjCg350VCQUN9/a4sURUz+vI6vy3qvk6af3tQtY w==;
X-CSE-ConnectionGUID: J1n/Z/B6SXWTqkx3aDkJ6Q==
X-CSE-MsgGUID: aiFW4cL/TxeIIjjNhnerbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25459857"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25459857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 11:01:19 -0700
X-CSE-ConnectionGUID: WoD41FPESF+ZMw5CuGt+2g==
X-CSE-MsgGUID: naw8+6mzSymZnyT/071bPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24970858"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 11:01:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 11:01:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 11:01:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 11:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAGBjkqAbKNEevrs6jh8J1ZGf++mJVkuDRM6M9tcccOmyiOKqcdLNRwXGSutLueXmzrNzNNsUBn5pow0rjgk2pGcQz7ZnVWEm44wlts59wRpsV+4ZM8Tmg3ZxMp3FcLNs4Tb1D1jNLCeaHqAmz2ZNF0lQ7TTZSl7LD0+pQSTYmdiea5+cwBwyUlYMu4wbfl8PQW7hBwXohh76ECQiTQB18JjMU4emYG9pLUMfhijWIsbxe4bPwkSFF9ouRgtATZJEoNVmQ/7NAwA+ZY16IAc3TLWRicSeUlaJJ6ICadfT5zt87hItwNZFIvRGHTBO4onmyqmeSXIeFxYRPUKUu78jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XOXxCGxU2PUyOE7TnobS57teJ/A1waXJ6rX0C8ZT2s=;
 b=hhn0mLdR18GB/EiZoupqSpNM9uW+kSBgWZAF5x+av1Re2Q27pS6LafomEflq5H0DCXMtBmcyKaVvvMB6BrMjOAr4s4rIytxY/69lNjz4ZO+vWGphQSqZveYSSDpfWs6aCr3RDzzGuIZhf/eoM2/Q3jfi34vJu2yjtcOZ4Qi2pgZ+WJAP/CF9rSGuxm9INzcteg+fKjSKsX532YE93FZBGBBfcbQwD7sGIuuIMPg0yuL97BRoKOfhj+RTmMaCNc2QhqIJPx7zCef2paR6wAUNnoFRj3nkU5wfeX5pPuxGcO/54x3DiORv5JW7ujf7Eq7BlY8MrqEPJwSGIqhCU5XLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5274.namprd11.prod.outlook.com (2603:10b6:408:133::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 18:01:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 18:01:15 +0000
Date: Tue, 9 Apr 2024 13:01:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Check result of drmm_mutex_init()
Message-ID: <yzab3rps47j7t5o7cbi22yek7xzfmne2c6fa7bhgmsnedtpt5u@b2aje4vank6e>
References: <20240409153132.1111-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240409153132.1111-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5274:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0DfH0WLif3V0ykrI2VBfUVTHt/7XMIJsUi98n8YeaBDDcOPwt/NVF+fbbVcxNaGZI0M7rep0GjC99c87LSmJMpBl/VHEfMUIq1/Qf10H14ZjYElt7KUGbrD3d4be+JiS6ufGVORVVy13krQ+aI0P4GRWuUKjaV5Bjwnij7XS1o3xFESvCexlyH+d6OaO47g4vCImZH0IWtIT6WwdCIz5b1+v1zb+yW1E0c+OUC/UceXBq6Xw/vmV5spGyJcmv8hVgxOrCHfXJQwWlHpKFlbCLHsxWZrxF/IPpuORPYUTsPHN58xVTSP33/xkewu1hi7FXcjKY+5bwlBFUEUrviU6ab+eSzzv6e3Af0UPWywoWkdsmSN99SBpfGYlSdpuri9OxfvmW8AT5cCaKVN0CMJgW8TukqUgFLQfLtJoFr+oQyeUBMbBrOGG3b2XP/IS1kvyu5XYC2j5dg+aAU1JlPC0yhOHM/p/oeOincWiNhBZ+sqkxxHVYT+iZ9OnTrmVdaQs7L7B2uezel9C6TMsnSniUwTOgJ6+Etc/j8E3pIv8UesLwbkHyvbgXKW5qhuAKgFipHO9FaHhTnPflGcGgb2Gw4a3F7I5xqwFzGv7VdYYEQG1Ozzis3bbbTFYe7awh/nWzObMcOKWL6Uob+IR0AE28zMN3kqlCGJOwhFzJv4USOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ry7RTWaF0MsszdD4zRlQxKjL3stIVyXtbiHk1kSyAcyYfjN1hdd+63PueFBk?=
 =?us-ascii?Q?0RCse9apNqROgot4lJ5nJB/MhnN3IYe5bT0rg8XxkURElzRO0HmDfKg87DNT?=
 =?us-ascii?Q?9xqFB/9fqn/xsyPJ1Fq+G61Y3qOfUseN+jtPRISi34KIrf5lRhbS0e3i0050?=
 =?us-ascii?Q?Qu6vMA5kCMTkAawVmDYLhGVktBhhlFjxxbmHRLWiNx5LHwsZfHW133md9Bow?=
 =?us-ascii?Q?K6yppPb0YsHQRrebLDP1cEkMPDjTVTrAUdRVdsi0iAeEmsRUGpzZFXuWmQVc?=
 =?us-ascii?Q?Hv39+k7GEHubYLXN18dfSxUV227U4m0fm+mBXE2ZrnT1epiQFovlyCTYV7b3?=
 =?us-ascii?Q?3gP8vRXAisecZ7bSdEBpRAC4YCAM1fhswx9eKv0grgBfse9yppsWvMd9SueQ?=
 =?us-ascii?Q?bXicTsSVXwscW0WN8rVVIUpvX1uuPg4ms+2EyNhPfqcU10dcx6KrOA7UFioH?=
 =?us-ascii?Q?1wa8/2YG6Q/FCDQlffY2+fw/WJ2qX/WB8enesxZW1rJr2McPrzzf3uXK7T7a?=
 =?us-ascii?Q?4rkjLrqnRNNv/0ZH8/2Lq5GDWekQJilIExXBey9/UV3XWyjTgnFWk92Yd7O7?=
 =?us-ascii?Q?A2KuzEKXei3VdFIbmuVW4Cjo5ZB5Vr9mAswx6xihebuD64nKxlF2XCKcz8DE?=
 =?us-ascii?Q?t8+4zlMaF7N9bQfqVdDBBsvGRr+BTPIrZBG/lKBPiYYoIJdiwkJx87GDsHON?=
 =?us-ascii?Q?cbAZIfJeKLYu+UHIiZqAw0Otrgv7umIbnPAaoV1FMtHsLC/X1M8jSy77z4GS?=
 =?us-ascii?Q?v3lxobFnqRk1bGzVxIew6yr2Vji0kCf9npyWpiCQRlYc07BCLho8jPqiTDyS?=
 =?us-ascii?Q?mCgz+TBqzNSIqHAW43BP0/7ZABWkosWrTv2MYYXi/txLkyg1JAy0eQNEDZ7z?=
 =?us-ascii?Q?v6H04e7BP9A2BdAE45jwbYvbsqXB2Rhx02wbvSoZQSGbNiadBM+3gRxenfj7?=
 =?us-ascii?Q?DozMoxKD7yOLhLo5UWyULrkeftvAzRQ1RKrKbcdvhgEcDtZ9LFK6wW42THhx?=
 =?us-ascii?Q?THmCkwlEqk7tffLpZZmXkvl4+U+VmLL6HyMb8jTvvKZ7zPdfrrGU5P1BAxT0?=
 =?us-ascii?Q?lx1hDnX73xrJQbE1cMjyVqqlwJuz1W6cWwn62wiFe3iuW2k53cEgYnGNwocT?=
 =?us-ascii?Q?r2luNLHPKb1dNxBQQplBqmIjLtlkGaTTgITy3vxFOqOqIN9F3lwDlPVxcnYS?=
 =?us-ascii?Q?ooDgibNLBX+lHOo39pkfj1ECy6D6H5hjovTvxRtcyRdly0VCXlybbJmg7mte?=
 =?us-ascii?Q?zFSM0spyOr+41nI3Kj2KAurWhgUr3SAyP5LmkNNPD3NIvJ08JAiUzRZBk311?=
 =?us-ascii?Q?F8CKUgtuH+tNQMYJPToRnu2YPJt9K7Dgb1gpwZUx2OAME9PYS8dEUbpxNQsP?=
 =?us-ascii?Q?i1pRoC6YpqervJDNJgfb1iufhi3TYzjCFuGsvheqBuBt/3sDnJNul+ltJrwx?=
 =?us-ascii?Q?D7m3w8PZLAJPtCl04LL+dj0i8BVv9M09HLZHnj2iKpXSWx4by9aguOGwW99d?=
 =?us-ascii?Q?Wk4HUl3EYXuxkSxjjtdPiy614Zidjz6VMlEGfE3abwVO8dJqOF/A6JmF1/cf?=
 =?us-ascii?Q?P4pjR/9gcd7c7Lt+5B8FqLq8eYb8JG7LnPdmFiGDfm5m0DjVYLkPTqaj1e8g?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c313fb7-64d9-40fd-a550-08dc58bf0c68
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 18:01:15.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI8c6nVMoqPvOlbua7TXXlZugklJ2S9AJq0du1ychrr1Z8bVHo10u0+tRN1LARgL67eK8yDRVTimPde4RwpT4cxjqVcsXz+lLaQlh/lf8Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5274
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

On Tue, Apr 09, 2024 at 05:31:32PM +0200, Michal Wajdeczko wrote:
>Although it's unlikely that drmm_mutex_init() will fail during
>driver initialization, however we shouldn't ignore this case.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

there was already a patch pending for this, but got stuck because it was
trying to do something similar for all the display mutexes, that
shouldn't be there in the first place. Not sure if we take that one with
conflict resolved or this.

>---
> drivers/gpu/drm/xe/xe_device.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 9083f5e02dd9..ba3643906d9e 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -273,7 +273,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>
> 	init_waitqueue_head(&xe->ufence_wq);
>
>-	drmm_mutex_init(&xe->drm, &xe->usm.lock);
>+	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
>+	if (err)
>+		goto err;

blank line missing

Lucas De Marchi

> 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>
> 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>-- 
>2.43.0
>
