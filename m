Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F71CD343F
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 19:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4217210E2BA;
	Tue, 12 May 2026 19:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeXq7eBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135CE10E2BA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778614004; x=1810150004;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=S+Nu/1Zn+WPl3QL7qhCRKBBj/u6FQD/Z6LBq6UroYQA=;
 b=YeXq7eBRIVpJ4kK3IEiJTyojH0tkAfdNUJfVHAfBAKBQW2khKW4p6Xkv
 27N5ktIIlULLOUKw9NV24M2OUfDJPfHFAD0gsSTsBg02VrrXzN2ZCoVnV
 vDYtFxfTF0jHhj18clAj0m5OoUoqWIuorNjIG4NGQGITt9RMVX2lLC8hC
 JNqJ/m7cWL5aJKaYQyED2FSgwnWZJN3AnQEtan8gIB//Dqy2+vS2jeMD2
 CRzMLoJmBSfPqAlV9Sox2FGN4HD/6bPEoQx3kCK0AqptPbAIJKKGV5/dB
 zvMGEPeVDCTnxv4yg3tSgltFyXoOYWbb9K+FR6iM0VK5e4KZatizh3abN w==;
X-CSE-ConnectionGUID: bcgfD4XGR6ec6AsMPrFsGw==
X-CSE-MsgGUID: yesNGiPjQJWAL6porpGhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89836031"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="89836031"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:26:44 -0700
X-CSE-ConnectionGUID: mU4xmu7QQb+jc++Q4PW59A==
X-CSE-MsgGUID: WNndfpObTm2or2hlZROwKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="237948198"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:26:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 12:26:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 12:26:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 12:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxNjUr5H8i9xjgiTvZ4m5cdnWzK864LZpQexGh1dOIxVKZr9WruyG29Q1LplqUmWEyazbFdX23ryOIcNx/KdstJljqDrVwCJH4CVgMDv/dVdZ8LxbKjDyao6Y5w53QwTsUOAB7wXi01k8PF8ScHFmX5L+7l0NIc/I+RLfD+so8Y3wux9DvWTtpPGWvsFDdiF8lEUwxrdAsPSyemQG9wdUTUSAH63dJKGY/Hwo7w7PVXGbfcVQ3eYJRftNBYqlki6RQfRA864G+URp9ZXXkbSeKChSY45XzVKercJA5jWz6OTSsduNTzvT+tkydtqLiKxodoOGhe5FtNMTAwekGPtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAZlorqXAZjH96cu2BmuYWEJMc1EedlNZeeUFp5OdxE=;
 b=cCRYf8UKvmo3rn4KUet7efU4hNtuq4heDzjCru60Z8unjkkeF8hUykCuVV2k4raxSN0rYvdxe0eNs6ISnJMyXMIfiM4OHnKncdsdDShk8K+mgpj6/Ep2G5sRlxZw1RxWrCCHEermsWTC2JUaqHNO9qCbG2guv+vgvpw4Dp/T/zBlmHed1OyI965wsTo8pvnNyAmB+QMYeozIuJJ8ltdTqRYLdiyy5zTWzKXt3a7VeJL2wYdoPVYPgggD4NXxR0WZgN6wU56Cs4MXKbrX3y1CPKPyxO4hV8P7p4r7hABXpof/1cK+SLeepiMKK+dWK5ZK+X/RxOEy7z17pjI35+zBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 19:26:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9891.020; Tue, 12 May 2026
 19:26:40 +0000
Message-ID: <2360fb36-1304-4b8b-9586-df962c2de299@intel.com>
Date: Tue, 12 May 2026 21:26:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: d56eb8a0-8e2e-449d-493c-08deb05c643f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: bgb5rRMqYDtCX3E4bSBTFLKZBS8qrNj5+CgTsulFWlxxf9MJlYQX/pw8zepvfTeFeNGS52+EMePJEEEw9x8c9Ujlze2hECDCpPFZ2/a25MOIJQDwZmnJAexrc7G/K+gF+nsAPeU7pKN7f86biK49Ho0T7nSiCKK+SlbtrDPoo9IX3E7ZJ8+kBcdrBmGgImmuRRNN0Wuag8D1rGA/vM4b2TfliRd8uz3l3gWAOoZyplEkbc89E5jPmAXzY3BJLFOcHLNAnL7Fll9/iEKwd2mp+rfLzka+WnZP4AbNJkcvCXvRAnScHClhPCU4qVbcGjOSsUgjnSbIqbc7zSfI2ZEWQqWP9UhfnGvnQAYIyxdhdaxzwzNKFZkL1hHw/NMR/ILmoTlk0smTBSQOhoDGdYuCNp/O9mbbfDY3qfdhaDInN2ZKhMe52OqXq+4+44NsNewK9X0fvJzoe8O5f7OwtAJjp+jykleWBqhp5+u2lxq21gsrmqHqlBcSoYHt74FmlPmkSwoOI1ZjYsBDxDmaIoIUwHpMlqagYseH2769P0Xqgfx1kHBvnZzU2SZ4jFz9s0CQHm0mHy6trGeu+CXkISeCa/PiWH1+g1yqSZfa7T0hZ49DZcujI8z9yrBecjmElFu+sVcDFf/BPHft/paW4p160HUovQlRyuHvlqbJ5SD1W6pFYHQRYtLjrgmPN2ytJ9MT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk9wQnUrcis3SnB5dlJaNlBCcVQvUjJMdWdEVnd5T1BKTXVPeURBVi9vWXlz?=
 =?utf-8?B?YWtqWGZqV1JlZi91K3RjQXpCYldFTDhnblBOMUdTdFBMWjI5WTZWVmJ6MTJ4?=
 =?utf-8?B?Sld3aWNFdE5JM1ZNMWVpbzk2Z21zcUIwaTJaQ1ppTXRPclhvcE1DaHpWc3Aw?=
 =?utf-8?B?blQ0S2RNWG9NNENaWUlhRWY4Y2orLzl5K0M4U082VDZ3VXdDZGluVnY5ZWlN?=
 =?utf-8?B?dk5NK2dTbmlkZFgvVFl3RUFVcEpKMTFMVVh5anZUNHNaeUgrYjZBbVZzMitV?=
 =?utf-8?B?UjBLbUx4TGJ2Ymh1SHd3WFpsTXFrSmxUS29yb0RQTHJXaC9EdWZYVWlBZzVt?=
 =?utf-8?B?QUhWMVZyYXNQcloxcjhOejVkeU9OL3ppTWJybWR5Rk9DZ2VYdWY5eDl5VlRo?=
 =?utf-8?B?V1hONTBFb0RRcDUycUhkN1Y4S1MrSmhGczFZMTI2QVZhRHlCNDR0MEpnOHl2?=
 =?utf-8?B?ZjdQcjRXZ2FheU5LN0xick83emlDSGdFN2NtV3RvclZCSkdhSkNWTUprOFNU?=
 =?utf-8?B?djlzVnZhWVN3ckpta1ZpTUw0d2FDMURBYnBLUCtzR0l1VWZZd0NBQ0xZV1lI?=
 =?utf-8?B?akx4a2ZLS2RuSEI1UDdiMTZNaW1Va3Vza3R5TkxJR3hhT1lzOVlBSW1hRXox?=
 =?utf-8?B?L3lsRWpYb1V5ZXBVcU9rdUFzYUo4STRJNmo5VGM5TUY1QWtyS1VHb0dnR1N5?=
 =?utf-8?B?YmFMV3gyWkxPc2Vkc0F3S0hIV25SYzJEaFBlUUF6S1lTQTIvN3NOOEdpa0tT?=
 =?utf-8?B?cmMyQWpPak4wOWI4SU1LSXprZTlMUVUwdlNQWU5IRXhablpsb044cGwzdjEz?=
 =?utf-8?B?RFE2KzhyVjR5aHZiZDJCaTZ6NUVaMUtNSnZjeW9uU1pGNUk2ZFE3UlBzRmRT?=
 =?utf-8?B?QUdsMDk3UXQ1ajhKbFJWcE8wYUhBZUpnVDdvL016VXEvU2RSYVJUVXlJZXlq?=
 =?utf-8?B?YkwwaFkyUDlCUVpVZEFHYU9Dajl6WHZ6T2dyL1dpeGhHNHBBQ1NNdHhpelZh?=
 =?utf-8?B?Ym5TQm0vUkU4U3g2ZjdIWmp1OXJ3clhpeWdWMXhsRlNwckZlV3dzdzlWWHpW?=
 =?utf-8?B?eWg0SUNOL3BqT0VMaEFtU013OGxMU0JhUzdDVktuQkRKK0VLc2xubGJmU0Qy?=
 =?utf-8?B?U3NvR1JpN3hxei93TVZYQWZjL3pscmNxODR0eUpHajhPWXRIV3BjNzhBVFBQ?=
 =?utf-8?B?cW1lRG55NmFiTXh3d0F2Y2V5aVZNMTVNamdMQ1RqYlNkT1piUlpiWDBRWTlL?=
 =?utf-8?B?d1lQdXF5Mmk4VGFsYWIyaDdpb2prcDNUR2hia3FMeGVCeVFoT0h2M0tyUjQr?=
 =?utf-8?B?VHVaWjJnY2crV0NLeTBmSFpGaDhUbWEwUENnS3N0dzVSTEc3bnkvV2VoZmI4?=
 =?utf-8?B?V0xQY2o1R1ZSeVFEWlE4WExGN2xqTlU2ci9WY3l1d0dORkt0aFBPNmp0Lzl3?=
 =?utf-8?B?My9FNUVTbFVlNGxMWXdobTVrMklJRWt2bzgrbjFZa0JidHdyclpDNXIrUkdr?=
 =?utf-8?B?bndsV0d2WGlkMmNsUFVRZzUvMjVpNXAzVnlwdTNaL0RHMmR3Y05RVTBublJh?=
 =?utf-8?B?VWU2SUU5QzVCL2ZNcFdEODhnOEtPLzN0WUw0OFI0T3Y1eE5URTdJQ3BFYXhR?=
 =?utf-8?B?SlNjNTFmdnlhVFAxQVB4UVZTQUJPL2N6cW1xNFY5NkRoRDJhM1F4b3JLaGtm?=
 =?utf-8?B?Qlh5Z2FDQWZ1b3FjTlp0cStvMHQ3TGIzUFNKdGx4WjNzY2VZRG9lV3kya3VO?=
 =?utf-8?B?ZytyK0s3M0FYbWpiN1Q1Sk1UNE1rMklRV3FudlFIajcyZTBhbjVZaXZOcDVL?=
 =?utf-8?B?T3piZVBnQWk3aXdneUI2Tmo3eTBvU3hGOFhOSlBQV3lNa3hDa3k2b3RvQlor?=
 =?utf-8?B?Z1ZKdUdyc3JNaE5nanpid083RXJUa0Rwb1lQSzJmL0dvMGthem83b0pLVUVu?=
 =?utf-8?B?Y3BFRm8zencyMVRhWmdUL1VVVlUzQnV0Wk81LzRzRzU4T2RnZ3ZzVTBDRFNL?=
 =?utf-8?B?U1BkYWRvbmNnZisxZzlseEFZS3RoMkwwTkZXa3pGNGlzSGYvczl0WmVkVlNp?=
 =?utf-8?B?aVhKbFhLczUwSEN3M3p1MWptd1pBbWpWVFlQZGFvL3NtZ2w4SjZXVkduN2p1?=
 =?utf-8?B?RTJQZFVtbm9hMlkzTzJGcFJLNnRqZFQ4b1U3KzI0ZXYxd1laUzQvNXFNdUJz?=
 =?utf-8?B?dEhFVjVKb1BBQkpUV0NSLzhhZnpYeGw0MEZ3VUlBY3FUTE5XSXA4NStWeEI3?=
 =?utf-8?B?K1FSdVhQcnlycU5EWGQ4aDlUdEh1dFJKeGJtR1ZheGdZdkFtMGFYZGFGRHhz?=
 =?utf-8?B?STh3UUpkZUhZemxRWTdyVjhpbFdoR2VsZ3FwQTErK3lTS0ZxQmVZS004OUx5?=
 =?utf-8?Q?CexXCB9nM/Fy5l2Y=3D?=
X-Exchange-RoutingPolicyChecked: CzjGXj4EWiBcAHQA5Z+bNinGHcYQZkjnhm5BXYJdoszcSZfcWhYN7F8zVXIegusnOHcd5QtioUOaMHxUqXt+/M2v/sdroWUMwlcpnOix7brlSqh9zh5wEzN8PLQiYFgeYlDxhiSTpOw1+PuJFjeN02X76u2KmX1nWpnuKtC5/jLTmu8eh8d72WpSUJ/BGNMEi9IDiM4Qb66h7B3j40TYIxOhdMlfFaJor0efn66T9SQIR31v0Dr25ziAQrRsa2AnJx6fdnoH0P0aEbRH6mhEq3dlnfR8zZCzjpaPaHVZe8Ftk4ftK9OK3LyGA7R7osHLqHM5c8Xj0lm8sOTWb3gJwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d56eb8a0-8e2e-449d-493c-08deb05c643f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:26:39.9614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lt9x1d4nje2pr9pFHJn6T0gEMlvo6WGoaa7PZAbfG9V2J0clEf6vIZmCLZysGLhtJuxiM5mFgu926Uc7SOV57dlT+NMJbpD9sQb1BG1pQ8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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



On 5/8/2026 11:42 PM, Gustavo Sousa wrote:
> In upcoming changes we will need to differentiate between regular and
> live KUnit tests.  Add the function xe_kunit_helper_is_live_test() for
> that purpose.
> 
> Note that this is implemented in a rather hackish way, by leveraging
> KUnit's static stubbing functionality.  A better approach would be to
> store a boolean somewhere in test->priv that would tell if a test is a
> live one, however that's not quite feasible today given the inconsistent
> usage of test->priv (there is not a single uniform type of data assigned
> to it across existing test).
> 
> v2:
>   - s/xe_kunit_helper_is_live_test/xe_kunit_helper_is_live_test/
>     (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> index bc5156966ce9..d2f654f53cc7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -16,6 +16,18 @@
>  #include "xe_device_types.h"
>  #include "xe_pm.h"
>  
> +/**
> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
> + * @test: the &kunit test
> + *
> + * Return: True for a live test and false otherwise.
> + */
> +bool xe_kunit_helper_is_live_test(struct kunit *test)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
> +	return false;
> +}

or maybe we only need something like this in xe_device.h:

+static inline bool xe_device_is_real(const struct xe_device *xe)
+{
+       return xe->drm.dev->bus == &pci_bus_type;
+}

as all fake kunit xe devices will have kunit_bus_type instead

already tested ;)

> +
>  /**
>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>   * @test: the &kunit where this &xe_device will be used
> @@ -93,6 +105,11 @@ EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>  
>  KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
>  
> +static bool xe_kunit_is_live_test_indeed(struct kunit *test)
> +{
> +	return true;
> +}
> +
>  /**
>   * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>   *                                            use in a live KUnit test.
> @@ -116,6 +133,15 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>  {
>  	struct xe_device *xe = xe_device_const_cast(test->param_value);
>  
> +	/*
> +	 * FIXME: This is a hack and a better solution is to have the "priv"
> +	 * member of tests have a boolean to tell if a test is a live one.
> +	 * Unfortunately that can't be done today because "priv" does not point
> +	 * to a single unified type across existing tests.
> +	 */
> +	kunit_activate_static_stub(test, xe_kunit_helper_is_live_test,
> +				   xe_kunit_is_live_test_indeed);
> +
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> index 83665f7b1254..71cfeb2d4efb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> @@ -6,10 +6,14 @@
>  #ifndef _XE_KUNIT_HELPERS_H_
>  #define _XE_KUNIT_HELPERS_H_
>  
> +#include <linux/types.h>
> +
>  struct device;
>  struct kunit;
>  struct xe_device;
>  
> +bool xe_kunit_helper_is_live_test(struct kunit *test);
> +
>  struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>  						  struct device *dev);
>  int xe_kunit_helper_xe_device_test_init(struct kunit *test);
> 

