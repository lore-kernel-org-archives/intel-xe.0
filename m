Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E5CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7233010E0EE;
	Wed,  8 Oct 2025 11:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b24eo8br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B4410E0EE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759923776; x=1791459776;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XUyb6GNkGYKrz45jT9VvTy1i47wd5RYNgL1Wz6hFuJs=;
 b=b24eo8brYS1pIqOAmhAD5Kpp1/cHqJ/0klmAx3A4IxxU9FfKutCtzA0e
 0vhjvMYeNq1XLcV90zpMZ5axWee/H23wl1I+me//AX2nhLBTEI8ok/Kh+
 cGBgaOXMsr40ab6yBeTKEBiiJiruq8Ycg+G2uVQb36LpMoj9eXZZXGyy2
 vkKVIejOzLK/dCEQazCF4wVBr3Y7afLdPgwvNpxnziLh7oiX5W0VWI3vy
 8H6okcfA8uuIB24vvJTfgwcSJnfYbPFf/8Z5VKdEZ0UoGH1vBG64okAJm
 J5f0XVlWisOPeMUpww//aLSBX3TdVVldZqvke/8VeCPGImaPQmxmo5SRs g==;
X-CSE-ConnectionGUID: aVXNUlfRTTSfA2LezRpL9A==
X-CSE-MsgGUID: 4gP17njASzWnQyhoVfrqWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49669953"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="49669953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:42:56 -0700
X-CSE-ConnectionGUID: 2pGB60+KRn24fmwaCE56hQ==
X-CSE-MsgGUID: q1P4Up63RmuMsWV2M7JbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180448649"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:42:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 04:42:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 04:42:54 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 04:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSbkpZlmgqHA2BiGEvhRMVfJBljerQlmCErEltdVC9P0WIU+lHlRqhaLr5Lbk/PcDxRz1AjwjiRAEN/1DrFlsuL7Qu/1H+FDMRjjtFAY1abSo/7g3TzaBLEjOPzXF5MAfLjvqJW1HEumTcjpjv3QbVXrSAXDZLWwbt6t+K0YP7UZOnveXAgCicTeJpi5FxZ7hms5Ab5sEWW1Coa7GVPLTlLHXJnKq2Rxx7XQ8rEPf20eJGJp8CtDZa1uWz5c2DBVTkZ8e4zi52Abmav5RZv09PmXIqcZq0EdRQWxjcCr5Id2u3gQ/goCyn6a1hxmpLv7vu2Cjb2ZgXni0srT9hKZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R+23G1QlWxWN6ICAALFeUulngSA4p+aXSDv9CsZy0w=;
 b=mmfb1SHSP1yKV7wweddQRiGtgS/LbafnD9RYUlEtEKzflCVdeAzAokMyHsVw4g5ynaJvU36ZVMAdUsJli8WAY62MYOLTUceFUlsuWl7NFW9HI8knWxS4gBrsmzpskHIFbPYug/A4zh1HOO3Um9jZ31etD81T3oqh1nkwL3jN38EyXMX66oxufvmA8mQTs7YsQcRDRyEBFsDE4h3fKPOymCpCHzf/EHwOOtcETymvSzz0OE7zszIV2qars7ItoeexYTsaiQSUX/1ghAEL8r4zYKsm8PjCQPfHoJK/G2LjCI0uBD5uOSNI/ks7go+4NUkliyy2Pmi/mhG67wEL35kkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 11:42:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 11:42:44 +0000
Date: Wed, 8 Oct 2025 04:42:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/svm: Ensure data will be migrated to system
 if indicated by madvise.
Message-ID: <aOZOMRbYFsJlaSSP@lstrano-desk.jf.intel.com>
References: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
 <20251008111050.293151-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008111050.293151-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a967f67-c6ea-4e92-d723-08de065fcbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xPpE0WOJu4gQmD2prp3+y3vbTiizmylxbSO9hgPusoIMeaMaOh2PUcQghh?=
 =?iso-8859-1?Q?dzDvthURkZNjQSasF6t79OXaluXlVAZzEXUq1+eOwi7vEEzl8PsTM7jzKF?=
 =?iso-8859-1?Q?jx8cyuqmrAZBWvRgFGa7nbyUlyjmRlyH6GUFRSs8W+FB+SPSS8vAItUNql?=
 =?iso-8859-1?Q?Si46gsY8TRsmW5Y4KGqa06O+wy6IQPBVMW5Sb0KLG5/Zpg8Ic86/Jf6ULy?=
 =?iso-8859-1?Q?6Bsa0ZR+uwV7l1LNyZ4vlR1yq8xDwHszfLbwrr6qp8RLAAYGQdUv/cQ3UB?=
 =?iso-8859-1?Q?kZ/YsnB7DmRFtc3R0nbIExAHq9QtMHzEtXNEbwrZUtc/LcwJgGp9H6bqrE?=
 =?iso-8859-1?Q?rGQp2ML1Q6BHyi+n99t48YoQuiUoXXPZDIAIQURZeJiGz+znj6wi43+GLg?=
 =?iso-8859-1?Q?popgdR+jGluLviJYLg9PVOOIEAh+psJ4rek/Xr1N4mxIkiEpBcgR6d/jyf?=
 =?iso-8859-1?Q?+kPboFw1pxXHDh+3HXDNkZktyIaqthZ1aH1td2jLZEJ6VY0IZi4LB5C0jU?=
 =?iso-8859-1?Q?RKFoUy3w3sFvF5Si1BQ6zW5jXrAIX+s9veMQB1uJoaF51zCXw49LUpaksj?=
 =?iso-8859-1?Q?LKyIydBM/DDK7YEnPJCT2LawaTF3GIciVfRCxUjq1s8nEcNUsMQS67O9ZJ?=
 =?iso-8859-1?Q?jPCmTd7PeO/63AjtritVaqm2yqhrxN8vuduK3a+P9y5lWrYq8/0wcICgnD?=
 =?iso-8859-1?Q?qrRPUmdtM5TsenXis8mJB8QBEAl1iORtFtSp9MrCJ5jp4BkLzvpqA091t4?=
 =?iso-8859-1?Q?BeOI5hXlpbtMAh4DT4XSFThiV3MOT43uzbU/hCzLucP85FSkVYm90AzZ/b?=
 =?iso-8859-1?Q?YPj8xFDgwOJu5MaAw+vzldUWdkm3ZFHZPBa5vRs9Ds71JsysEmiD9Bi8jK?=
 =?iso-8859-1?Q?vp3NNGE33fCGwS5L3g3nrU+NuGikoi7wIpn0qkzq4RJKn9lnGTDBgSJxuH?=
 =?iso-8859-1?Q?3ikH1dbERw9U5aHAoeBpCDr0iNFkV/9Z5eAjHyIqHXVar52RrGxGPrdMYv?=
 =?iso-8859-1?Q?SB7fuiXdT/Z8XFDFgayAKyzAFGP2LktGoTo0XgGmv3aGdq+DGB7uCv8Ys/?=
 =?iso-8859-1?Q?BmsQLg0vrI4hRePJyczle8u9IzfiCgRwM38i5Ut7IWyLc9hmpbBi38ne9J?=
 =?iso-8859-1?Q?M/Q6H0IEMEKl+uyXjrjhGp19dmAjdpsYfjqrVeh4eZQUNql7uaZqTxp0sG?=
 =?iso-8859-1?Q?QQDZybj1ZmmU1/03kfOwCT76nfi4SxtsAc+GPtwuPNfRq8jE0I3T/DiukX?=
 =?iso-8859-1?Q?KbV9X4+CF1qsv0yJ1N4rsKMbvGGCt//hMse+dL23JmsR+UjvqzfalztHfZ?=
 =?iso-8859-1?Q?jwnWjPoDcAyyS/yMdBWJ4JHVkv569P/SukSSkX/5hZL6gOKMcpApdHstn5?=
 =?iso-8859-1?Q?eEE9VGOTMCyeJ6PRZgpCfP4ZRi6x+c9Sgi+dsOVZtPkJMEAG/kgbw6HBN/?=
 =?iso-8859-1?Q?YcaQw00Wt7h/Hy8N3kzGq4IuUN9xQwgUIYr5i+eotypBpfF13YNHafTZdv?=
 =?iso-8859-1?Q?ptSkP5d5M6xl7e6b2zK8eq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+oUiy280MAn50Fco4VPoDw8O1Rux7dhNty4+hiSavjOazie8kGTbgWitCJ?=
 =?iso-8859-1?Q?WXWrWG8fpDTycEV7hSjv29EGV2RLsEVGbztV+qmTigmWx9UiAGApqLFhmK?=
 =?iso-8859-1?Q?f/SEaivVini6EWmpgJGnQ8/EOn/oc/iblFBBVvpvun/p3M4FvK88vdedy5?=
 =?iso-8859-1?Q?QpOgUzmAUjAo9PK8cdF5afN19HHTxtoyC6J2/Nu/rkgiacAt1YB7uQyjlh?=
 =?iso-8859-1?Q?ZgshiHkaNbhZOJtoqXRBl63KPy9EckNlcFEm9z/tv7GOPeMSpNZQR0dytO?=
 =?iso-8859-1?Q?RMIlRtGcnBT3JJx5BoKDXZH9lcUAkEoWrKPll/ZY870LMD+mmGo73SH0sQ?=
 =?iso-8859-1?Q?lmfVxPUljv9D7nZumwUCA3mIlSXO8nbxugrbjIgHzxbVfuYI+JsIEQEtXL?=
 =?iso-8859-1?Q?SGd7khuuerVOtYDEd8p0z+RuTBlJx3CUF1h13H/lifvdsqPEGIQOddOJV4?=
 =?iso-8859-1?Q?ppCU8n76INl1iWpXBPvhd9py0f6GngIxYb8L2AMlzZ7lFHQZRqVTxmRZ2n?=
 =?iso-8859-1?Q?8TBwHJ2lwfJG07gQoXvEXa0p0XuALm10razQ0MhZ7dx2URnOov/e3vGdmV?=
 =?iso-8859-1?Q?q4lEAzsiHvu6Q8u+CX36ttmzzqliuDDaHOnqqAMtHkyabbLOfHk3lkH997?=
 =?iso-8859-1?Q?Zi+fFLz7Ilu3okD+bru914/OcDAAAZs3rj2WLLCjnm6qtjBpt88P6XWaDL?=
 =?iso-8859-1?Q?SeykNgzsa9A5NOJhylxPFrMFR2Ogit51lhuUoBvym8sh041TgdVXfth3lx?=
 =?iso-8859-1?Q?jCsF1qVUHWMxMRxz3LZtmpt2pdVytGBUsMD0K7V68R/qvlBUVeuQWrdwoG?=
 =?iso-8859-1?Q?GykQYb8B4e657r3lkulDGvGOdRH/NYbKYo+aw2ZTJpee/uRAGAYkDNfNpE?=
 =?iso-8859-1?Q?ChQ9veA+rMC1CkcBDlE31CU3hNT1xTYoK8U/WXJAVewqlPjd2gLCBBNDTe?=
 =?iso-8859-1?Q?QToAj4tDBl5PE7IBgslJB6IlFYbojhjGC22mTbqWO/GSMBdG6HxL8gmQVv?=
 =?iso-8859-1?Q?JIi4HWc9qJDT1J8x7uUAkBidiHBRUY6kM4hBPsAQVc2KeOeNWHQ/0+sbKp?=
 =?iso-8859-1?Q?GGIshTHHis8799sa6u22CwK3LOdeIoelshiItIOKwU6/ZAUe9VfSEPybJw?=
 =?iso-8859-1?Q?OKLMKuxD8fEuMJSHNh9r2j1kwgBCbFun8U6KACVNATjoiAr4zmSrh9iXjy?=
 =?iso-8859-1?Q?nzsqSwfufb5EWXh0WwA+UyS6y8OoGUsIiCX2Gagts3VSDfZp/1dNJe140Q?=
 =?iso-8859-1?Q?QUowHZyBOUN9OOr4FGV5I+UivQ6L0dMRQZneo1qPrSa8YVCwm9eWcerRfn?=
 =?iso-8859-1?Q?kHZ9Lz9JVK+YdHaxCyWli8NhqHgd1zxpGfxXf3jFw81rAfwKQ9UdN2/W51?=
 =?iso-8859-1?Q?6GVb4S1PUy9RkhUh7lSyjmsCyyBkyuz7bioTgDKVINaTWzRxT2vbYyv5xT?=
 =?iso-8859-1?Q?VxjaaiY9qAxdUfGePM0eZtDFDdJwm8BNbc1AkwGPQ+nyEFC70OpQZnXLxG?=
 =?iso-8859-1?Q?kX1AGg/mTSxybS8hPPP15ITf2W1vWFGBGNr+SRhSbAJA5Gy08eTnMc8sNV?=
 =?iso-8859-1?Q?9Lxzn4bjQ9snCaF20Jra4tlVsqVIja2oBVFJB2YWKPho3w5/PGHN0UEzFn?=
 =?iso-8859-1?Q?ohKPfDKplB/9F4nwJ01sDHDopfvs70bNfShXAH9PwmlNczOSwwGRMEkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a967f67-c6ea-4e92-d723-08de065fcbed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 11:42:44.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9r75Q0Ya0P6sW2Snh7zVjs2ftryTZlNqAkOldnj75qG/4SYbMwSoRe0exopLhAi60CYUEf/cL4z2T4b3zwPj5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
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

On Wed, Oct 08, 2025 at 01:10:49PM +0200, Thomas Hellström wrote:
> If the location madvise() is set to
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, the drm_pagemap in the
> SVM gpu fault handler will be set to NULL. However there is nothing
> that explicitly migrates the data to system if it is already present
> in device memory.
> 
> In that case, set the device memory owner to NULL to ensure
> data gets properly migrated to system on page-fault.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7e2db71ff34e..fd906eb03d71 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1034,6 +1034,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> +	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> +	if (!dpagemap && !ctx.devmem_only)
> +		ctx.device_private_page_owner = NULL;

I think xe_svm_range_is_valid below can still make the page fault
handler bail out if the memory is in valid in VRAM. That a really odd
case but maybe it needs to be handled?

What certainly needs to be handled in xe_svm_range_is_valid is if system
is the preferred placement, the range has mappings, and is in system. If
we get page fault storms on system memory address every fault will issue
a rebind.

Matt

>  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>  
>  	if (IS_ERR(range))
> -- 
> 2.51.0
> 
