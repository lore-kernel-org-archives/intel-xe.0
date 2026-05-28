Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C8CD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 20:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9D10E681;
	Thu, 28 May 2026 20:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSSVb6hq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5682810E681
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 20:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780001539; x=1811537539;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=JPLdZl2vGMtNA/067/P/z6abcFnSmsyM1ZiOBoBOUNY=;
 b=fSSVb6hqxDOGEuJF1aBBDtr+RhW9c+gGMT92B9lqgpSxyUM4ixLranSq
 KVTYoo1gIh1FF2l2+Wt4YJ4BrvwgselEwcBb44RV6NYAzgrgz9HEC9uD6
 BGeh9hm/6XFazNGGBnQlvlXa6ckzlh3E0HHbVxIBMkWz+2qWhJaXrnYtG
 CE+MN1o1c6gA8GQ4bvwtc6OgsC0OdtFUhLC682Q7p8Dx1z/CbxAz7EQ9i
 SyxwImaRt7mhSBLh13eunnBMgSPm2j3Vp/1t3Xk1XTE8/kXyemqpSaRD/
 plFr2sertHYe/lzpW9iAfEOqrgXdvajL/fpiPBh7TxTq9uDbxBEwguX5c w==;
X-CSE-ConnectionGUID: aQ9LMJNSTWuvDSlo8MoEuQ==
X-CSE-MsgGUID: 9eIfgz+DSHKwRJ5GzO2OAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="79887716"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="79887716"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 13:52:19 -0700
X-CSE-ConnectionGUID: 8G69uOxZSwms+msi1+I6Gw==
X-CSE-MsgGUID: UCmr9S5BRBGHWAt89IG0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="236299078"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 13:52:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 13:52:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 13:52:17 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 13:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcUDaGc4UjEhqIEs3a5yEDPCj0V3U1J2YtRq1PC57+W3D2611D0FyUBoRgp8GSUu53FHKTlWF2hG5ONZe54J7dYQ69yUQlLvkS2Voidu0HjnvP+Mcb/3j2BX4q21xh6xps5W/F763h/Xwyn+vI2Zt3e/7VD2YwHyJfyC+v8wx9D390DqEdUHF704Dj2svb+OyYsMj2LwYblpEZodzaRDGlQisxQB4eZZfy2UPfBru1GIIvGtOK/L4uIQ0zyUM2ROdO/Uu4tHvwGO5j1EnAIb9vXihbtJyr3o+JIWWO+ArpIDNXzFp4eF69UuEFgGwGCdLl12OVV9vkbPKpXG9jCdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuW7x6wOzSogzxpe5tTOcx556sNmavYoKMwBR7Ghles=;
 b=aFZsp+f6EYe3vVLL/k9WJZSMgqehHJwga6H8TAUqaDdbLyZ+iA+8BxENxlqrinMIyXTCKXK93p+qrNd8v31Gqu1d8mB0H/zbZ8xt+gP0Qzd2WDxVfpuYXhXfxfRJZtbot2RcbmjUL63uhZK6easzKN0UByUzAoxT+DzFLbqwumFGD00EGqb4SDllRWSpMUGnVSrluNr0gUIUtenU4Yey2ZhCwrDmo4tXXBePD6iPtXpirK8f8vtIAmlAQ/1NNjSqOuT01FF4LIgMNZXBZfEGP0yi5DigYVp6QsRzc/nDpWEMv21MIgSIxo53cmiAdAJIU7S65dgA6B/4k+MILSBYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Thu, 28 May
 2026 20:52:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 20:52:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH v5 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules
 with engine types
In-Reply-To: <20260528163531.834721-8-violet.monti@intel.com>
References: <20260528163531.834721-6-violet.monti@intel.com>
 <20260528163531.834721-8-violet.monti@intel.com>
Date: Thu, 28 May 2026 17:52:03 -0300
Message-ID: <87pl2f5kb0.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: c74ed45a-e0ab-47fd-eb3f-08debcfafb36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: uke4HXh2PKG1sWAVswP6hOXNAdA0kvYxT2trYuaBo2IvtqZ0w0h/O+50PTs7LF5Tp/Gd9OweANvnyhsIf+FBqv9s0DEQKtozIWKe9K2Y9ppghlUUgKJU/4vLIeJqshLJZOgyyjuh/45ZFeoFpgxjUoV93xyMkhO4R8BDFa78oWIxXJt7L2kqQgnxk28meZ/TDXLFwkUT8y16LfEVnyRRlxIaA83MTecd5VPCYcGZlc8a2pfAFnCGSPlN7q9UTff1EqcaWxDcUBX0IsLZFNmNTK0LAcjXr1x7GPg9DcfOuAlf+hS21hjEBbhUeik3wqYEVS72CV8jU/aht/UMaX2l3jZ5do8gNHm6xkrTaOTp0k4HqNkXTHIvVNkUhzDejdgqMzOzoFaHp114Sjd2RfzWwL0XMwwzG5Dnhw9AC7shWPoU3aZGiyT1E10rl1AK5VcTSHAHZxTFSItqQwSk5Z9+aaBNWzUsWi+oOpWSdruUxnQ2VgWmqRfN0YPA/QZIpPwNbDhQrExAJ6jRycovPYoZszP8IbS4myYh4JTOGs6mMEz3Y1CNAssZcswjMyzPfFpQeLCnQPjRHb+i/HajI3oTW69qAbilHvfIbE6y2ljZuF29M5df5NoLWTpwtZQhsFnLMkuh378wI+LPqouRClFbVk9bMf35yB2fpp5sHSIZDm2TkbUag4+F5qADye5J/t/C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVJ3TDVFaVpsUlhUWHhXWkpCazZwMUMzRG5hUWlRK2Nwd0VobmsvVDlCbDJG?=
 =?utf-8?B?VkZ0eFV3bnVIaWtFMnd4UDZZbHdLcjgzQzVXVDJCWUttQWIyeHhocmFnbGgw?=
 =?utf-8?B?TnFFWStoK3ErR21LT00xcVk2dFlPUWFVNFlRdnF5ODk0ZFNQRjlHTDRkL1Jn?=
 =?utf-8?B?UU1DMmlYNHdsQnNSeHRWYXJaVnpBbFFlaFc2R0hNc294OGp2VElCVkliemx4?=
 =?utf-8?B?emNnMHdHNWVEUWRWUXBSV2szOHJwcWpFUUFNRXJnYmVFYXFQZzlOQURUVUlV?=
 =?utf-8?B?SlV3TzF4SjE3QWJvMzdhbldtZUFsRmU3VDkwaWQyKzR2T0QzMGgvQ2R6ZUh2?=
 =?utf-8?B?T3BWUzdXK0M1aUY2d1Y3ZC9KMjJhaG81OUtqd2NEbmhoNWJNOHIvZUl5clJN?=
 =?utf-8?B?RE51TENQUWFWU1p4RGRnWGtUcDIxTUZCd3B4NUtadjRZNStHQk0vaDJBYk5O?=
 =?utf-8?B?TTB2ZFI1VFROUThQK3ljTSsrRHF3REwyM3Q4UW5tN2pkcWcwMkdSRnVNVkgr?=
 =?utf-8?B?VEtWRFZsOFg5MHZsaFFZNWpQYUlSRWlyNXhNRjYxcjA4Zk5xdTZuRjA2aVBK?=
 =?utf-8?B?cG42T0hHU2lreXBkVHlHQ1pjVDBLL2xGdFJkWWJlZDNaby9CQlB5dENaL2pk?=
 =?utf-8?B?NXc3djJYbnBEVTR2bmJCMm9SMHYyOTRrSHpoVFBQV2ltcXNKUEFyQk1pL010?=
 =?utf-8?B?MzFjSG1kWUtHUnRnV2toQzRmRk94RGF6VlBPbksrdG9EczhOTW9OVXdOOHl6?=
 =?utf-8?B?R21Icm1Rb1RjZk55SXRJYy8xUEJVTmtmR1o3Z1FTazZXVDlOK0h0NnVSS0p1?=
 =?utf-8?B?K1VHMmJEQVJJMmErbW8zRFptR3Z1dmZMWFJXOHpvVkU3N3pBNHBnbjhuOCs5?=
 =?utf-8?B?RWdhYkxZVXFaMG9QdnVacUhnWFlrRERGT3dka0p1Njltb0xCTXZibmtFN3pW?=
 =?utf-8?B?RnZlcEc3MmFmSWZXUXY0SXRsaldicG1BS3FkOEcwdHF6Z3p5MmN1RmJBbnV1?=
 =?utf-8?B?dWtFRmNYTkU2YVpnN0ppRDNVOTdEbVU5M1hnQlRMNjFVcE9GR3RreHIwLzJG?=
 =?utf-8?B?MGQralp5R3FCMzRXUUJDdis0b0xQVE5yOXVrcitQWXUveWVteVh6Z25vWmtl?=
 =?utf-8?B?cnhKeXhGRytQWEtxQm5qcTJWa09KNWdzNWRRSUhpbWtwUGtkcmJtSUMzSzVs?=
 =?utf-8?B?OXVySkhjc0VUQzMwMU56WEhnUmRWOGk5SVhqR3Ywa1RHeXR5WkNqRjhjazdN?=
 =?utf-8?B?TW1jUzg3am1xejZyYXVkUTJKa1YzYW1JRnZvbXE4L3IrODY3QVpDaEhHU1hl?=
 =?utf-8?B?aUlNaHRFU0x0SGVuSXFEcC9PTEg1RlY5amhlTCtSRkpGQjU5dTA3V3V6clB4?=
 =?utf-8?B?SVVKZEhXdHFYdHpOVkFFTEJWWTBzUi85RzM0SzJueUN5empnYjExOTVLZ2tR?=
 =?utf-8?B?bFM5WmpxMWJ3SGJ6SEZ6Wk9jYno3ZFQ3S0tQZzc3alYweDhONTdPenUza29w?=
 =?utf-8?B?dW9mSFNHZytSWGEwUFhscUVEMFptb1hld00yNjdvKzlEdzBUQndSb1Z2Vjc4?=
 =?utf-8?B?L2dPbmhZMUZpemFJczRmd1hhTldzZ3M2eFJWVkh6NFJPUHhVVWV6MWpVaGhZ?=
 =?utf-8?B?NEtZajAzdFo0T0pQbDNFQjhkbXpxeUxQdUFXSDRjQnBSOFZpelc4RFUvMDdP?=
 =?utf-8?B?SE93NFpZM0s2bUlIV2JLNlY1WkI5aFhkdlBsYXNmb0ZIa1RkK2Q3ZVJ5dFFD?=
 =?utf-8?B?YktKTDV0aHJrb1l4UTRsYWlDdEwza3NFZUtRZStYeVpPRGxSdG9OMm04cnM4?=
 =?utf-8?B?c05ZbWVEbEFUd1ZMMHI1VTNiTHZWUG15TnFmTnlvYU9UbWg1emRRTlEwVDlw?=
 =?utf-8?B?SkhZYmtnakM0Zk82eXJ5cUxXcURGOGhKQ2dGMW5hNGdBMEdPK05qcHJZclp0?=
 =?utf-8?B?Ylp3bWlOL3RjcktNa044UjN3aWd6MkRGTWlVNHh1ZndNcFNkZmF1SXFKeHly?=
 =?utf-8?B?RGN2elEyY3NPcXVva1A3RWh6NERxblZVMFV6d0R1dTVCQlFwdWZORW9JM1Uv?=
 =?utf-8?B?TUtxWnZvbGZ6QlZDL0lXTVphREtMbEJ3bUNpWEFoVGhKazVqRC93eWk0dXBX?=
 =?utf-8?B?WDFhRlRTcHNMb1NCR09kUUhXS04zcGU1T1FXNW1nUW9Tc21sdmtkeXlPSUJK?=
 =?utf-8?B?clVsdDZVS1BaaS9jNHNuMmdPUUFMNzlhcTh5RlFQWnBuS1lRM29qcTRyQjNj?=
 =?utf-8?B?YnlaUlFxZHZCbk1Jeml6YzEybFhNTlFEZkZFMzBzU0pXYitTamdueGkwVzBX?=
 =?utf-8?B?VWJPZmQ1MDU5ZEZHRDRtM1AxL05qdUprakduZTB6TnFMTk9JTyszZz09?=
X-Exchange-RoutingPolicyChecked: DqVELmFO6keEBxElRdKCBJBfqmqPGpikFTnLuYKjvfTwl50j1Sc5B8kQigB/Hf8Wd/t5A2eA8RibUSpb2xR/ZfXhEtwoveYlKTlW7qZbQ7aI4MaorACSUTkLdN6CnDKaisQYXBYhrQ8ZjIBzMuH6p2+mMeE9n18zJ3fUsGRGkUOZbj2544zV+XdNEqeZPRIiB+hVFYtRJhJIgTtiVtzAWaKKRs5eicwda8An2YOoAXqiXvfiPEar9XA2hqIxpk8x2DD66GugPH9IWv78Ca7k5RZj4uJKJpUw3vCRMqjAdtmC5VSSxH2WqwisH/wDiOFpt8RtKM5p/XLd4ZArYYgZvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c74ed45a-e0ab-47fd-eb3f-08debcfafb36
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 20:52:07.7990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejoqX49vhhgB/PJQ8NcXoujYGNNgtQu7BLuyF0Q6BANn3t7bhA/x4VuzQ/JPqCdvaskX6OKqNco17urWvomhgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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

Violet Monti <violet.monti@intel.com> writes:

> It is currently possible for a RTP rule, and subsequently a workaround,
> to expect contexts that may not be present when the workaround is
> applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa=
.c
> expect an engine entity to be active. Conversely, the gt_was[] is not
> depending on an engine entity to implement its workarounds. This kunit
> test addition checks the gt_was[] workaround list for any workarounds
> with XEP_RTP_ENGINE_CLASS() rules. If a workaround does have one of
> these rules, the workaround is then checked for the "FOREACH_ENGINE" flag=
,
> which ensures the workaround is implemented properly.
>
> The result of this test is an expectation failure if a workaround has an
> improper XE_RTP_ENGINE_CLASS() rule setup, and aims to prevent future
> issues of gt_was workarounds being applied without proper contexts.
>
> The gt_tunings[] RTP table has the same functional layout and
> requirements as gt_was[], so it shares the same kunit test function,
> minimizing excessive code.
>
> v5:
>     - Remove unnecessary headers from xe_rtp_table_test.c
>
> v4:
>     - No change
>
> v3:
>     - Removed "VISIBLE_IF_KUNIT" keyword from xe_wa.h
>     - Added gt_tunings[] for testing
>     - Reworked KUNIT_EXPECT_TRUE() for easier parsing of errors
>
> v2:
>     - Moved contents of xe_rtp_tables_test.h to .c and removed file
>     - Renamed macro RTP_KUNIT_ARRAY_PARAM to RTP_TABLE_PARAM
>     - Removed unnecessary functions and iterative components from
>       generated _gen_params functions and implemented usage of table
>       name and WA number as entry name
>     - Condensed xe_rtp_table_gt_test() to use KUNIT_EXPECT_TRUE with no
>       message statement
>     - Removed xe_rtp_table_test_init() and xe_rtp_table_test_exit() as
>       fake device initialization is not necessary
>
> Signed-off-by: Violet Monti <violet.monti@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 53 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.c                |  3 +-
>  drivers/gpu/drm/xe/xe_tuning.h                |  6 +++
>  drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
>  6 files changed, 69 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests=
/Makefile
> index 0e3408f4952c..f7aa47f11a36 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
>  xe_test-y =3D xe_test_mod.o \
>  	xe_args_test.o \
>  	xe_pci_test.o \
> +	xe_rtp_tables_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/=
drm/xe/tests/xe_rtp_tables_test.c
> new file mode 100644
> index 000000000000..7dd77133bc42
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_rtp_types.h"
> +#include "xe_tuning.h"
> +#include "xe_wa.h"
> +
> +#define RTP_TABLE_PARAM(table)									\
> +	static const void *table##_gen_params(struct kunit *test,				\
> +					     const void *prev, char *desc)			\
> +	{											\
> +		typeof((table.entries)[0]) *__next =3D prev ?					\
> +			((typeof(__next))prev) + 1 : (table.entries);				\
> +		if (__next - table.entries < table.n_entries) {					\
> +			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	\
> +			return __next;								\
> +		}										\
> +		return NULL;									\
> +	}
> +
> +static void xe_rtp_table_gt_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry_sr *entry =3D test->param_value;
> +
> +	for (int i =3D 0; i < entry->n_rules; i++) {
> +		KUNIT_EXPECT_TRUE(test,
> +				  entry->rules[i].match_type !=3D XE_RTP_MATCH_ENGINE_CLASS ||
> +				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
> +		KUNIT_EXPECT_TRUE(test,
> +				  entry->rules[i].match_type !=3D XE_RTP_MATCH_NOT_ENGINE_CLASS ||
> +				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
> +	}
> +}
> +
> +RTP_TABLE_PARAM(gt_was);
> +RTP_TABLE_PARAM(gt_tunings);
> +
> +static struct kunit_case xe_rtp_table_tests[] =3D {
> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_tunings_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite xe_rtp_tables_test_suite =3D {
> +	.name =3D "xe_rtp_tables_test",
> +	.test_cases =3D xe_rtp_table_tests,
> +};
> +
> +kunit_test_suite(xe_rtp_tables_test_suite);
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index bf3fad9cdbef..bcec40ca2d35 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -20,7 +20,7 @@
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
> =20
> -static const struct xe_rtp_table_sr gt_tunings =3D XE_RTP_TABLE_SR(
> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings =3D XE_RTP_TABL=
E_SR(
>  	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
> @@ -101,6 +101,7 @@ static const struct xe_rtp_table_sr gt_tunings =3D XE=
_RTP_TABLE_SR(
>  				   BANK_HASH_4KB_MODE))
>  	},
>  );
> +EXPORT_SYMBOL_IF_KUNIT(gt_tunings);
> =20
>  static const struct xe_rtp_table_sr engine_tunings =3D XE_RTP_TABLE_SR(
>  	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
> diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tunin=
g.h
> index d18e187debf6..869564e3e992 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.h
> +++ b/drivers/gpu/drm/xe/xe_tuning.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_TUNING_H_
>  #define _XE_TUNING_H_
> =20
> +#include <kunit/visibility.h>
> +
>  struct drm_printer;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -16,4 +18,8 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)=
;
>  void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
>  int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +extern const struct xe_rtp_table_sr gt_tunings;
> +#endif
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b9d9fe0801aa..1a1e04215f21 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -130,7 +130,7 @@
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> =20
> -static const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR=
(
>  	/* Workarounds applying over a range of IPs */
> =20
>  	{ XE_RTP_NAME("14011060649"),
> @@ -307,6 +307,7 @@ static const struct xe_rtp_table_sr gt_was =3D XE_RTP=
_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
>  );
> +EXPORT_SYMBOL_IF_KUNIT(gt_was);
> =20
>  static const struct xe_rtp_table_sr engine_was =3D XE_RTP_TABLE_SR(
>  	/* Workarounds applying over a range of IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index a5f7d33c1b32..8784b491dde7 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_WA_H_
>  #define _XE_WA_H_
> =20
> +#include <kunit/visibility.h>
>  #include "xe_assert.h"
> =20
>  struct drm_printer;
> @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile=
);
>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +extern const struct xe_rtp_table_sr gt_was;
> +#endif
> +
>  /**
>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as ne=
eded.
>   * @gt__: gt instance
> --=20
> 2.43.0
