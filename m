Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBFEC369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 13:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669BE10E20B;
	Fri, 18 Apr 2025 13:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETGXGXu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDFD10E041
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744982950; x=1776518950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TactywA+ImvkGRRhg40WxK7qhkwzkIxYN6pRG57na2E=;
 b=ETGXGXu3N7AOAHW2emGEaYAbp+0MhU8QyCns5FSebkVzh2znohgIVF7m
 /7C1MOSdBDEhFKtj5MOtgRg2znDs4tk9QKYFEkw+lyMihL0Vr4khPfe7Z
 ZZbLYVaQHYJ//ZqU/+GzUFI3F4rkavQ7soVUo+AYaonxlmjnmrz5q6XTH
 imtrdSJJpHytAr/gQfAyknFfKRVS85rdJQl3YPQ3oDCUPpnfa+h4lZ6HI
 MpnuRSnyb9MXduYXRMC34LKgAvi1photi6v8uQDwA80x/1JwTgiqy7mMd
 Sr21n/5T8IdZaRAky95Y+a0cKrenDcuwaeI77VwmiBj1Bv16eXIuPArYG g==;
X-CSE-ConnectionGUID: uo/sWJ7JTSqQNiXJJhkYtA==
X-CSE-MsgGUID: nkuO8E3TSQC2gImUpYLB5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57975185"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="57975185"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 06:29:06 -0700
X-CSE-ConnectionGUID: YTtKPaXFS6qqCImZMlUFmg==
X-CSE-MsgGUID: ilZXol2fRIuz56CyBNxOug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="154287760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 06:29:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 06:29:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 06:29:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 06:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLUrBR+ry90XaMPlU1eD5jVMGORC5XLJl/qHmqigKQFxnmsQyqb1Wzk7E9iHCxKgUreRUQFsmQYu/jyrzMR0ljBvwqXUQ525Q4nF5hZqC2NRFJiPSag+rGNqChwAUM7b9aXhLKbLGwaMdKB6VWk/2Ka2Jxr0Ya86ICFJSNi+Rwv1135Nzmnn4k/+9BJcH8yDFAdvu8oRKnOMEr+Z2uE/8I5nEczmdHBf+IJ6IekREAtpYiOl6BBtrKsqGdQcb8KOTNXZfeiXIWYr7komH3DJAcpI+3qJqbwapVg+P6+zEOo9YZKPSDSeEO9ca0Nazo6vRGWGL6lB5KI2MFgEHdqXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG+vmFdu9iuCJR/dBs2YnsLq4UfVLVxpX6SZc5Eazl4=;
 b=nELCWYPZ4LQNDXZ2d39zUEM4o1B+c++tfWTrF8TOry7dsGUVIdBFKw8WGUYzxppjnMfGzy15YGgO8kOyBdvS0DRQEzPzZCQ1OJk84WhGAQV+1wmN5m/hQaPYyxRHsPhOZgWaKbX9kY+DVOWRXvOuLtbOXEnkT+3slWN2UKISOAfnokqTPZE5buY5VMbety3hDCO05is4GdwwztKDPKhVtWIAq3uGA93ApoqGl26dNPYlPyJ95+Z2CL4iO+Ty8lKTPMFfscOMLL4JHHq74hH+7pCUDLMchKVCL3JS+C1PeI0Qt7PTpV4xdsNJcmy0ShjXt1nz8sYqg+GYaxd9SWHXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.41; Fri, 18 Apr
 2025 13:29:03 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%5]) with mapi id 15.20.8655.025; Fri, 18 Apr 2025
 13:29:02 +0000
Message-ID: <44d822ae-5019-4d7a-a889-ff1258831a3a@intel.com>
Date: Fri, 18 Apr 2025 15:28:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250417234239.3786508-1-tomasz.lis@intel.com>
 <20250417234239.3786508-5-tomasz.lis@intel.com>
 <09653333-094b-4f1e-91f2-ff738b278d5c@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <09653333-094b-4f1e-91f2-ff738b278d5c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::14) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: e738738e-5817-42a8-9bc1-08dd7e7cfbf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlRZT3FsWjVHYkMwU2tlT1pRbmpOMTQ3Y0ZNK1czb09UNnF0b2N4VkMrb3dp?=
 =?utf-8?B?QWFYVStXaE5pbVdtS0VVa1c5bXR4YzcyWUxkVzZRS0lMZGlBVmNnZXpBOXlK?=
 =?utf-8?B?YnIzbDVTb0tIcC9XdHFPM1BONGp6dFZCb2REVFAwNmdmZUg0ODI3ZFVEdWVn?=
 =?utf-8?B?Q1ZuTi9rb1BZWko3bjNoeWFsT1NXNWtBaU0zNGRUdU9neUcvSDFCaU1GY1FR?=
 =?utf-8?B?OGk1aENJYXc0eEhMOEltOER5Wm10YkdZSGh4TjJEMXc5NHVrNDM4amFQZHJk?=
 =?utf-8?B?SkhVNjRlMmFMM2ZUdys3eENtSEw0UHFmL2NSWWI3L2htNis4NU9rekJlOURJ?=
 =?utf-8?B?a1pLZFJmV0ludmxUQmhvSWdTb0pFZTMra1d1TEp3eWUyc0NiRXlwZW5HVW4r?=
 =?utf-8?B?Y1h5Z0V2Ly92QXh5ZEpGWWd4MlhaQWR1b0tWQjJ3eGwzaDVtdHFKU20zd3Vx?=
 =?utf-8?B?WWYvYm4zdDVyaEZIdzhkVmZNYTFFdlBNcW9VbHprWm1XZFUwWjVUbndDQTMw?=
 =?utf-8?B?UFppWWRmTXUwbzBKQUNWbFdvS1ZGTVFhV2g5TGFoZllMTHUzd1FGRHZiSHg0?=
 =?utf-8?B?TSt2Lyt4cERwcFVkWXcvdlRNNDBoQXAza05rVmFZbTAvcmh1WlZxY3dWMFNH?=
 =?utf-8?B?ci9iejJHYkxwR0ZKVFdEK2lEbjZ1UFlIM1NWUU4velJoQ3p2QjlzMkVjVG1J?=
 =?utf-8?B?bURtQlkwQ3NWd2VMMVAzUXpEd3pxSksxdnpPek1jeTBrNWdIaTZuNWN3ODI1?=
 =?utf-8?B?QnV3RzdYZC9FQW45NFFsWmV2WHZ5bWtmbkYweGNKMXZ3R25ROVY2Z3dxTGc2?=
 =?utf-8?B?amQvUGFnOEl1OFcvbW9NZ2ZCZjMyODFlRUlrMktkMHhBNVZBTFROZ2N2LzU2?=
 =?utf-8?B?OGVSTHZSVUFyT1Q3bVMwbDVROC9JaGpnaEZnbzRGRk11TWdxcGMraWNyclJW?=
 =?utf-8?B?bmthSXJXcTJOdnIzTUtwVE5vTVRXN0doZUErNnpZSEt0RytCM25yN3dMV3FP?=
 =?utf-8?B?aEhUVUt5Mk9TbytKd0VBa2NNaXphYTJ5bC82NCs1Uk5remJjRkRLdXFvbklM?=
 =?utf-8?B?aTZ1T2IrUDIwREoyQTJYMldkOXNiMnBCbld1U1RjSG9XL214bUFtWGdWVnhz?=
 =?utf-8?B?eE1rYTlHMnRMK2xIVlBQTlEwYzgzdms4eFZiRkxFNXVKZGoxazlvc1BwL2h4?=
 =?utf-8?B?VlEzK0hZQU50K3RCZEZsZFh6UCt3RDVkSUxVbTJ5R2ZGWjZRYk85enAzL1la?=
 =?utf-8?B?Y2JhcGtna3FwTmhRREEwbktvUkN3WEFzUC9Sa3k4eDgrU0FJUWVwT3pLR0RN?=
 =?utf-8?B?SkI5bWJ2TVk4c0JYa09oSHdQL2hFbzl2MXlLMU1rMStmVWtnZ3czWkJGN2xw?=
 =?utf-8?B?WjkrVEpmSDNJV05zeGVIWnY2dUhEY3NpVG1ZOUxHWURwWmtUNmF2MkFyVXFD?=
 =?utf-8?B?VVVyb1FQU3U1V1hDcS9tSUZoOEJtaHlSQlV5amNxcUtVMGozV1poWW1FWkN2?=
 =?utf-8?B?Y0g3MjloazlwUnkycGpod2lYa01DZ3dXUVVPSVpCWmp0OXBqcWdLNXl4N2dh?=
 =?utf-8?B?ZVMzNElEb1ZWVHFxeHVGOGJ0TldFRUtOU1lObjNlbGV4NFdMaUZTRDllWndn?=
 =?utf-8?B?Qy9pREIxaUVGK1BlaEdqMG42Y0JaZkxMbk1zcUhvZkZiSnIrQjJ4aVNEN085?=
 =?utf-8?B?NFBUS2FjR3RHUDdSTkhmRHd2NisyODJZaGJMeWNIaGlseGRyczQreGNOSDM3?=
 =?utf-8?B?Y3M4SXpUK2thSjhGWms5UjlKZjVFS0d1V0JGUGlZQlgrRndSYWp6dU9nZFFq?=
 =?utf-8?B?aTNBYmZXUjJ1eDJVQ3ZMSkZsZG1qVUZnemRPditQUFVwbGxlMHQ3V0VCbUlv?=
 =?utf-8?B?YlFlTk1iMGpaOGxQalFSeCthd1N1STd6TFBwZm4zekRXaUo2Tk9LUU4xVXBt?=
 =?utf-8?Q?/MrSZVp6Kqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlVMlRSd3I4YlpZVVltVDkrVldFN3R3dm1mQVFPR25uR0J4UUFoNGdhWG1P?=
 =?utf-8?B?dFlIbDIveitKMjdiMjNWTGJwdnRUNGkrc0I4TnBsMjJGMklwdHNkay9YRngr?=
 =?utf-8?B?bVhPN3RRQ2VXaWpvdU41RFRBd3FEalBpVHkrN3Jua1BaTDU5OGNGcytQcFpR?=
 =?utf-8?B?OHdmVTM4NHFDQzUrY291Snh4MUQ1NkprWnpvREhySFUrbEllZVhUQ2tqK1pH?=
 =?utf-8?B?MHFRMlc2WlRUbFJDZ1ZtZkZTY0xCOGpSZnl2NXV2U2E3MEJPQ0dEZ0ZXcHd1?=
 =?utf-8?B?dm10cDM4VDFXRkwvdlFCOTYvN3E0N0JEUUIxaTN3dC9RRG5SVHQ4eEttT0F0?=
 =?utf-8?B?OVFJeU5UMGcrcTVsS21RQzFqWlFEVkFWaDR2aXVDRVpubHBpamp6Q0pMNDdh?=
 =?utf-8?B?Um43YzdFMTg5VWVRMWZnMFNPTDcyN2lrK2dKQUpoeTl2RnhJVHVkaWtDMlB4?=
 =?utf-8?B?ZG96R1BSYnBjb2Z3ck50bDdSTTYvaWpSeTRjNWtYcGpxUU5XQnh6OFg5QXlw?=
 =?utf-8?B?NzZaaGhtajMxcWc2UkpZVGlIQmlOMzBlSzBDLzkzc0l1OFJKYXJ3Z0pFS280?=
 =?utf-8?B?bDVsOGF4QnZST1p4cGNzTXh3bUs3dWFCVW4rbnVxcTBON2xsSUVhNjFJUkVN?=
 =?utf-8?B?d292OXhUZ0dGaHQyb0FUbTI3WUJnMEJDRlZSc3VGRHIzeHA0RjZsYklicjZn?=
 =?utf-8?B?bmo0R2tJaVJSU2Z1NFc2aWhJeSt3VTMwZU1oRkdaVTF4NkdaS2MzMVlpVExz?=
 =?utf-8?B?VEo1blFTT0NoMUNncWhWaGZ4NW1idTI3N2I2M29HeWFJT1psTENKMThMaER1?=
 =?utf-8?B?c3BidUlsRjlTTkpsaU1NajF2dHBlTys2Z3lscHlsU3cyL1dXaE5ORUs5WXpl?=
 =?utf-8?B?SS9mbXpkSVVabzA0UE44aU9XR1ZZYm1JNmhSZ3hReVJabE5XLzJVb3hpTDh4?=
 =?utf-8?B?RGRkaUJnU1VOMTVnSGgyaEE2eGlzVk9WeGFZeDNuT3dhTVgrQWhBbVJQZXNs?=
 =?utf-8?B?aWVIYTVieEVVYkZuQXFFNFlBSFdWTTdmQVRzNkxRNFNIbXJRMFcraEYxckpn?=
 =?utf-8?B?VmMybm9LRlZZckZoWGVTZEZKVzN4aVVnTU5uakhScGpKWkprYTNqbzk2RlYx?=
 =?utf-8?B?eFhjVHVGeXhrVU5yT3ppVHVKOFlqaTVaZCtVQ3E4eTZCY3U5bHhQSk90aVdr?=
 =?utf-8?B?SUpQNXg3RkN3Y2pzTlY1ZkoySFpRZ0lvdFZaMW9DdUJ0NHZFTnlGZSs3THp4?=
 =?utf-8?B?Y1FNeHc0T0ZLTUZPQkJhTHdHTHpYSWFKVkk2QVNlQzZ6RFJlTnBaQmJWTjd5?=
 =?utf-8?B?d05SYlcvKzNEOVlhSG04eTZJWEJtYk5XUlVwcDg2NE1oRTBpa2NsaUQ1eHgw?=
 =?utf-8?B?bStSdnVNem1vRXJCcmN1cEZBQkRIdFg0cFg2ZE9sbVZWNDFZMVU3Mml4eWhP?=
 =?utf-8?B?cVdubzgrK0tOaVBOUlRZK0NSZHR0QWpETXJ5RVJvZFZka1hUSXFRZzJDYkh3?=
 =?utf-8?B?R25PUGZlK0hEV25KbCtHeEhBVzJOV1ZwaHk1dGRzVFhkWEJaRGJNNlVQUXVs?=
 =?utf-8?B?eTNQSzVTdGRrdWxLTExVbXl2TFJmdGd2QkdvNkF4OG1xS2wxYU9lendmZjht?=
 =?utf-8?B?WWcyazBQODVsUjd2ZlZ5YlhmSmx0WldSYk5tYUp4QjZ4NnlBdkl5WEVaNlFy?=
 =?utf-8?B?cURQdGRTUFZacGdMNlF0VlNxcXhNcEZVa2l0UzRFbHdaWnR5cHVNSVo1Tyt0?=
 =?utf-8?B?MHFQNy84K2tUeGkyZHh4VE9Udk53MVlUYVRrMGNhL1JLemVEcjl6VkRHRlJD?=
 =?utf-8?B?bVNnNnV6SWFQRUNiS3JUSFFuSGo4NnBqMEx2bk5FbkxpV2VsRXgyZkdpcEhO?=
 =?utf-8?B?NEZCbCtLa2RLOEREQWJ1SCtxTFJNc1ZZY2dTYmxtOE1HWTcyVFB6QnY5UERS?=
 =?utf-8?B?Wkk1NmVDdUYwZnR0cDhlWlZIRHdENkhnbHVYRVN5QUxWSFhOaFJCMG9Ba3Vk?=
 =?utf-8?B?L0dMVUNwM2EwNnhtMW1jOFVndjV1cFJJeDkvWXVNM29DaExYQjBERTQreDR5?=
 =?utf-8?B?WjFrU3dTL0R4Ny9aZUltT3F4QUZvcWZoeituMjRXRzlhbmR4VFJoelZyWVZY?=
 =?utf-8?Q?X/Eud6t+eInA20n8xzDYHoxe6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e738738e-5817-42a8-9bc1-08dd7e7cfbf5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 13:29:02.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvP5WWzZbgoOmpP8DGnKI6TSzWbgMgZE/l0lxHNRVS2VFtLe6pX6uT0Du4AQt4RlouOb0mGdMRUImap/DuGncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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


On 18.04.2025 14:58, Michal Wajdeczko wrote:
>
> On 18.04.2025 01:42, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: removed inline keywords, enums for offsets in CTB messages,
>>    less error messages, if return unused then made functs void (Michal)
>> v4: update the cached head before starting fixups
>> v5: removed/updated comments, wrapped lines, converted assert into
>>    error, enums for offsets to separate patch, reused xe_map_rd
>> v6: define xe_map_*_array() macros, support CTB wrap which divides
>>    a message, updated comments, moved one function to an earlier patch
>> v7: renamed few functions, wider use on previously introduced helper,
>>    separate cases in parsing messges, documented a static funct
>> v8: Introduced more helpers, fixed coding style mistakes
>> v9: Move xe_map*() functs to macros, add asserts, add debug print
>> v10: Errors in place of some asserts, style fixes
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 181 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_map.h      |  18 +++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  18 +++
>>   4 files changed, 219 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 2447de0ebedf..32a6001c3d25 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -25,6 +25,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sriov_pf_control.h"
>>   #include "xe_gt_sriov_pf_monitor.h"
>> +#include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_log.h"
>> @@ -84,6 +85,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1624,6 +1627,184 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static void xe_fixup_u64_in_cmds(struct xe_device *xe, struct iosys_map *cmds,
>> +				 u32 size, u32 idx, s64 shift)
>> +{
>> +	u32 hi, lo;
>> +	u64 offset;
>> +
>> +	lo = xe_map_rd_ring_u32(xe, cmds, idx, size);
>> +	hi = xe_map_rd_ring_u32(xe, cmds, idx + 1, size);
>> +	offset = make_u64(hi, lo);
>> +	offset += shift;
>> +	lo = lower_32_bits(offset);
>> +	hi = upper_32_bits(offset);
>> +	xe_map_wr_ring_u32(xe, cmds, idx, size, lo);
>> +	xe_map_wr_ring_u32(xe, cmds, idx + 1, size, hi);
>> +}
>> +
>> +/*
>> + * Shift any GGTT addresses within a single message left within CTB from
>> + * before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + * Return: true if the message was fixed or needed no fixups, false on failure
>> + */
>> +static bool ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
>> +				     struct iosys_map *cmds, u32 head,
>> +				     u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 action, i, n;
>> +
>> +	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
>> +
>> +	msg[0] = xe_map_rd_ring_u32(xe, cmds, head, size);
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +
>> +	xe_gt_sriov_dbg_verbose(gt, "fixing H2G %#x\n", action);
>> +
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +		if (len >= XE_GUC_REGISTER_CONTEXT_MSG_LEN)
> hmm, was this code tested?
>
> IMO this should be:
>
> 	len != XE_GUC_REGISTER_CONTEXT_MSG_LEN
right, will fix the conditions.
>> +			goto err_len;
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
>> +		break;
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		if (len >= XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN)
> and this should be:
>
> 	len < XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN
>
>> +			goto err_len;
>> +		n = xe_map_rd_ring_u32(xe, cmds, head +
>> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS, size);
>> +		if (len >= XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN + 2 * n)
> and this should be:
>
> 	len != XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN + 2*n
>
>> +			goto err_len;
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +				     shift);
>> +		for (i = 0; i < n; i++)
>> +			xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +					     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
>> +					     + 2 * i, shift);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +	return true;
> nit: add empty line here
ok
>
>> +err_len:
>> +	xe_gt_err(gt, "Skipped G2G %#x message fixups, length (%u) too small\n", action, len);
>> +	return false;
>> +}
>> +
>> +/*
>> + * Apply fixups to the next outgoing CT message within given CTB
>> + * @ct: the &xe_guc_ct struct instance representing the target GuC
>> + * @h2g: the &guc_ctb struct instance of the target buffer
>> + * @shift: shift to be added to all GGTT addresses within the CTB
>> + * @mhead: pointer to an integer storing message start position; the
>> + *   position is changed to next message before this function return
>> + * @avail: size of the area available for parsing, that is length
>> + *   of all remaining messages stored within the CTB
>> + * Return: size of the area available for parsing after one message
>> + *   has been parsed, that is length remaining from the updated mhead
>> + */
>> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
>> +				   s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
> to avoid 2x ct_to_gt() maybe add *gt here ?

ok, can do that.

-Tomasz

>
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 size = h2g->info.size;
>> +	u32 head = *mhead;
>> +	u32 len;
>> +
>> +	xe_gt_assert(ct_to_gt(ct), avail >= (s32)GUC_CTB_MSG_MIN_LEN);
>> +
>> +	/* Read header */
>> +	msg[0] = xe_map_rd_ring_u32(xe, &h2g->cmds, head, size);
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
>> +	if (!ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift))
>> +		return 0;
>> +	*mhead = (head + msg_len_to_hxg_len(len)) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + *
>> + * Messages in GuC to Host CTB are owned by GuC and any fixups in them
>> + * are made by GuC. But content of the Host to GuC CTB is owned by the
>> + * KMD, so fixups to GGTT references in any pending messages need to be
>> + * applied here.
>> + * This function updates GGTT offsets in payloads of pending H2G CTB
>> + * messages (messages which were not consumed by GuC before the VF got
>> + * paused).
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	u32 head, tail, size;
>> +	s32 avail;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	if (unlikely(head > size))
>> +		goto corrupted;
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
>> +		  head, tail, size);
>> +	h2g->info.broken = true;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>> index f62e0c8b67ab..8d67f6ba2d95 100644
>> --- a/drivers/gpu/drm/xe/xe_map.h
>> +++ b/drivers/gpu/drm/xe/xe_map.h
>> @@ -78,6 +78,24 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>>   	iosys_map_wr(map__, offset__, type__, val__);			\
>>   })
>>   
>> +#define xe_map_rd_array(xe__, map__, index__, type__) \
>> +	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
>> +
>> +#define xe_map_wr_array(xe__, map__, index__, type__, val__) \
>> +	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
>> +
>> +#define xe_map_rd_array_u32(xe__, map__, index__) \
>> +	xe_map_rd_array(xe__, map__, index__, u32)
>> +
>> +#define xe_map_wr_array_u32(xe__, map__, index__, val__) \
>> +	xe_map_wr_array(xe__, map__, index__, u32, val__)
>> +
>> +#define xe_map_rd_ring_u32(xe__, map__, index__, size__) \
>> +	xe_map_rd_array_u32(xe__, map__, (index__) % (size__))
>> +
>> +#define xe_map_wr_ring_u32(xe__, map__, index__, size__, val__) \
>> +	xe_map_wr_array_u32(xe__, map__, (index__) % (size__), val__)
>> +
>>   #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>>   	struct xe_device *__xe = xe__;					\
>>   	xe_device_assert_mem_access(__xe);				\
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index e70f1ceabbb3..2674fa948fda 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (need_fixups)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
