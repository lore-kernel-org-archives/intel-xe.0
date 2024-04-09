Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F95ECD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 19:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B08410E424;
	Tue,  9 Apr 2024 19:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzYn38v4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACC410E424
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712692112; x=1744228112;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aqZ3iTUX2q6tX0E7QV7E3qIUyfOHnS/q8jEXlSwRO2Y=;
 b=HzYn38v4omsQ4ir2JdoeTujNYQH6ft32WVUbkH8+l2PddHdzIohjzSEe
 kxh7wYcFjPKquzt9sZoyulPw5bdHh30WQRKirwtbZY3diAgtR8o9KiMcf
 ZDaiQu/Lem2CRH+3GxcsGIrCSFHjTTi+yVjG1e5Al8fOGapT+8et/pCjT
 9PpRHnjXgCorKU1+9P86NoV4s9067Jf57INjQovs5ExExCOf+FN5zu72W
 j+3zuMKwgTIfBoULCb7f7UwG3TyvnhWObYene8xYiKWSXRhukn12X9eck
 Cq4bqYEsLrHRkSkd8RXh30TBtA9ygxdsTVD5sMcoeY5H0meBn/LQXd1a1 w==;
X-CSE-ConnectionGUID: ziUIkp+gQySZ8JTD0T/q2A==
X-CSE-MsgGUID: xrqEeGuzTkqvlEd9ed0eSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33433432"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="33433432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 12:48:32 -0700
X-CSE-ConnectionGUID: Umd+OIfjQAaUof9DdLdv2Q==
X-CSE-MsgGUID: 8UrN+dcNSYmNpYpvPt4L4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20436210"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 12:48:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 12:48:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 12:48:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 12:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1Yn0IBafa6GmN2AJ9Hv23Y3z/QTMZmbQIAg9KX5Gw+kTtYvdWGw4fFGD47DjySx9BRP2iY5GEXuAkKcWauoteIECvBuEL6ls8oBVKZ2tlyJPOP2nEEQ/sVTszNIIxeA0CktT0cxeyWdFA+hQfApzC0LFYkeP/KXl30n+59zZATfbKpH9mm9/i2AzdWksB7ll1KHy+V7jriYDiUhHx6qvVbpdyAECkvu8C7jpM0CHfS1xp/z2RfNrgXVeBYF6DtUYa0Ql+W6qP1X4trnxLtu8xXgyIHsonQB9vLXXmu3Ec7Pi/fQ4HD2eVRRuMR8GoD3jEOuJHUUInbQ+KPKpzZUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJQj9NEwbeJ6SO2W1Oy7QomxGt4OyPwedyNZ3tnehHM=;
 b=FHMVBgpLrRsArmqcEB19r9a4DIVuHxrW7vjIodMxDD9G0YoHxMeDRg/VjkuPE4WQgcTmZeCD3Vf0mmEVlfRHEQRG+6OlY7ePzTyilZmoVgygj8vH2+WtwF2IbTdTGpesoX6XXXK7m2lKtAASpZj8P9vuUlaeEvTQBxAoUf+kvxoY23IKdWO5BmEMan4dv0dZkPPKMDPvLyZoGEbl0Qk/Uo54NquppWob/XNAUfxgRiwUtrBbYZ5ovmP8sKEILpTlX/+dQe0SYdEYEltGRWuXMZUMB2mdW0lCmhOkaIlZUVYAVebLk5WH/ca6uTBMQ+DxVnzS/6ufFQR/gjVVhhSZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 19:48:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 19:48:29 +0000
Date: Tue, 9 Apr 2024 14:48:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe: Simplify function return using
 drmm_add_action_or_reset()
Message-ID: <i7t2ohnhl6dbhb4oyvxdlnbgki72c7yjxneaqner36npu6hcwx@65qtyhupns5u>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
 <20240408144944.604448-2-himal.prasad.ghimiray@intel.com>
 <87edbfao4l.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87edbfao4l.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpFycIdHsuT5fQa7/3yAfA6/loItKHR+/5kk3E293wJbNRvAh7ax1t/mbsEUeaZokGTCoBszCAAtsLnTElA8TCdBbCl0MJ2B/RmLfO8C1yI5uAYnJufDqrfON/q92FPkAQQXf9PNdfgyx1OXxuF4yRYsQVvZXDr552RBDQo85TlUl+j8aUU9DQxO0YnuTAgpX3xilvgBFOamHIdkbhv31XqNWnIEKtvX4jElG/K1j8iON+OUDqX/g9sieHLuXD8J5Kwf2KFNtqG78Bgoz7PjbWjfpSE/+gydJ6V+SDNkvPf75aey7hGOB3P3+G5dTzP/OIt/S+eBb2H9zMzlwdetPm/q6GEnySSDIevCZtyD6qs1WK8L4ExoiWIXsA+E8ibzApHlciqnq1nXokdk5w02g+j4d6bKUQ52mXFFpdETuFNENWlQOBltEYq8e2d70PuNtq0Wt77y9vzvJYoeVA+LeDjFcDP/9cfR5/PfshyTwkFQYh1nbGNvAPvmHBYjYCDrxnpLY9kt/8cDg1U1o2gWZIxy+zSxwEhhXXdH23v1Rk0IyeQFWIVWmPMDLRVsp7d3mQVRrI5DkP/Z8P5UY0vq97Ntl0YD1pRbKw+/cKYbW2/VEmC2o2o8PWnF1m3gZ8EGvHNajySHNyTcti32cQPJOsJaXlW98oeDM4OI1Dyq/xE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YzWu0+tzfJVnrAa419gEwPLqOkVlfXx9E0NrT5rGYRlwlLrACZDlFWY4kuIP?=
 =?us-ascii?Q?X+dzMMiHtJ+4xgloueW3zTG7i3l5/EDFLep8To75L4OC3pCDDizF5C3qGKCL?=
 =?us-ascii?Q?OBm82HMySYNTSOpzPC/kt1/Yqa/B9etSLGyMaaTMJGUgn1We4deGbbxv71/H?=
 =?us-ascii?Q?MlRg1D+D3eXjEu5p4iI4SLvzhZWCnzYq6bEv7xAGe0w50IkB1JRAi+b7DTEn?=
 =?us-ascii?Q?yv99un2LjSVUSPU8q93hLMmQ3/sUoyGJW1lpDf5q1cGtD6Of7tFEF9L+/7zL?=
 =?us-ascii?Q?WI8RiWuHDnn2YKwKIEQjQDfMFnj5WQFp7XWUA3w3byMOINfoNyXWMYv7Rgws?=
 =?us-ascii?Q?DwJkA9Z0brYbc1s6rrneciQ1B0rUtfYYM7eQ252ElEJ9P9i+OfBlqioxdiuR?=
 =?us-ascii?Q?VgMcu2SxbXUkzbuH9CE4Q6VJ5SeW4VeOpwfF8rESLuD/PjBe71BLm6dXjll2?=
 =?us-ascii?Q?FRQMKCqyBAjhff5zf/0PhzBjyq5NPqPGyT3JjKBvFD4Ynk2EJc+9xJkjfiix?=
 =?us-ascii?Q?Hl5D2Oslw0mOcFE8SBaq6w1pZpJOcZTuwF86qWOorFN8T4LEOpFUY/JhuVwr?=
 =?us-ascii?Q?bgcji8LaLBC+O1Y+La1tjK10+KJti1O92A/fk5b2n6LsA9QqKmK9UEqPSf/u?=
 =?us-ascii?Q?RMlEuZH7ZZl42QRAGXHiRRk/0+oRbvxlJgX8CKIAN5FgZ3q3kDNUU7qCcVeH?=
 =?us-ascii?Q?Bt0blrA8hQO7ePIeJtpX8upn07GDmi3czAoSoNdZd9oKGLBoNKfiHW1l61Cs?=
 =?us-ascii?Q?ctRgORgci3ec1rdVh8It5RMo4HRiTL7auyhJBhyLyJxxUvLtBNVUXuey8G7i?=
 =?us-ascii?Q?9IlP4/z5AWqc1SGVr3VEWb1d8qwLCr8czdIQtJ8hbjrLKFcR/dV7o2MZANH8?=
 =?us-ascii?Q?Y1YuqaLlFKRW9OzxTk1YsNYuM6Vc3k3/jQqtpdg+V2xz4VfduL83KJrDw3CW?=
 =?us-ascii?Q?GZHExd/NT0n+c6h6Uwixb8iU5EV6hNgEygEZJs4nYTFr5uC6H/IfZo+nU4T4?=
 =?us-ascii?Q?SLU/AAqQL9HrSoIrEaLE2Xa0pNUJaOEzNlTE9trFqtGKxZJ65GEKKbcqQZ9g?=
 =?us-ascii?Q?yH5/4G5ym1bSoKNbJ1Z3UyWwFZuhf0t8B5G1cNA9olhCrOydjj92YWB4sHXa?=
 =?us-ascii?Q?msDyrxln7Ko33vCs9M4y2KtSch22aDWt9/D5ZHowx2Q6/D4TOZzaPHcyHSSQ?=
 =?us-ascii?Q?72cAQbQzxwqFMhmkKXDyWzkJLT2JddViF9P+ngKIoD7kiupN6XdBaIFMBzFU?=
 =?us-ascii?Q?uvU/wwftPE+QEz70ZPgmsY312dqH4tbhxnQv72+/Ynj8L570SyumgKwhyEAa?=
 =?us-ascii?Q?Np4mJJcLfAq0d0Fb+gXlTGOS7G+x4WvpyMrsSKmTm1AvldmiqLOn55eMD45o?=
 =?us-ascii?Q?F+wSkuXJ78fzYfsCOMBy+xfWitu66ePumHL/9IM5fxb3goMYphS3WW25qz5q?=
 =?us-ascii?Q?SdrBmcEfKw/AiDDTy3m0YZXTKJZWB0JiPXmt0d8nreWOZWPrbva2mdJs/v44?=
 =?us-ascii?Q?uZ34nPPk9NZb9lIXzcUjx8z4n3gbx/wO0q+zmVxr4yKjTBM6MPwgdv5/V7Sj?=
 =?us-ascii?Q?mAgegP1+2+nW92CpExk07LrzHJiR3l9wC8ID5iiKdobRFWPbBYxCvKjJGy4I?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 864b2d4a-1173-470d-1458-08dc58ce076a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 19:48:29.2775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxLsbx7GtMAJg0x2ysJUrjfIzvUcIapM7MFZEKRsHkrqX8h9P7IzTupg9yPNPT7n2WrT2UYSKtGF42z9EkfuUx41ZI5YrYz5n5onCDKJnAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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

On Mon, Apr 08, 2024 at 06:08:10PM +0300, Jani Nikula wrote:
>On Mon, 08 Apr 2024, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
>> Instead of assigning the value of drmm_add_action_or_reset() to err and
>> returning err in case of failure and 0 in case of success, simply return
>> the result of drmm_add_action_or_reset().
>>
>> -v2:
>> cleanup in xe_display too.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 8 +-------
>>  drivers/gpu/drm/xe/xe_device.c          | 6 +-----
>>  drivers/gpu/drm/xe/xe_gsc_proxy.c       | 7 +------
>>  drivers/gpu/drm/xe/xe_gt.c              | 6 +-----
>>  drivers/gpu/drm/xe/xe_guc_pc.c          | 6 +-----
>>  drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +-----
>>  6 files changed, 6 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 6ec375c1c4b6..63b27fbcdaca 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -101,8 +101,6 @@ static void display_destroy(struct drm_device *dev, void *dummy)
>>   */
>>  int xe_display_create(struct xe_device *xe)
>>  {
>> -	int err;
>> -
>>  	spin_lock_init(&xe->display.fb_tracking.lock);
>>
>>  	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
>> @@ -110,11 +108,7 @@ int xe_display_create(struct xe_device *xe)
>>  	drmm_mutex_init(&xe->drm, &xe->sb_lock);
>>  	xe->enabled_irq_mask = ~0;
>>
>> -	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
>> -	if (err)
>> -		return err;
>> -
>> -	return 0;
>> +	return drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
>
>Up to the xe maintainers, but personally I prefer these as they were,
>throughout the series.
>
>The thing is, these functions will be maintained for a long time, and
>there'll inevitably be a need to add more initializations and error
>returns and cleanups. All of these "return foo()" style things make
>future changes harder.

I'd prefer to keep the code tidy rather than these hypothetical
additions.

But even if we extend, drmm_add_action_or_reset() will always end up
being the last thing we do and other things will be added before that.
 From that POV the `return drmm_add_action_or_reset` will always remain
as is.

Lucas De Marchi
