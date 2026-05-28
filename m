Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C82CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 13:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3088110F186;
	Thu, 28 May 2026 13:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyEDshhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24A10F186
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779974735; x=1811510735;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=KCXdv9Vquy8Pcfy/MWE/Hwc0mnOXThVaE3uSWFujtWk=;
 b=YyEDshhExnvQjS1tbM3WkeXQCaThhysmktlxAY2ZLRiVhnG+zr1pYh0x
 K07hYXwLAOIXQoDoEy2KmLQFfCv6xQvUYPHOjv3x/BC/wfLvV9NaaytbO
 xsJEXsYuyCsdnqcMfrBkF6B9qQVaOKXjkj0ccGa4EC2O4k1LD/VOO0+gF
 EkYVq0ZbkRktK2ZNRi3zqfXUTxEwYYfH4xGyrLGqGyJn7jbcJXgOrL2tw
 cYM9PsXbJRB851JqYA5F70zF59RiGJVN1rnC7lhrZtXPT7UFD48XjcA4m
 a4SPUrWSOOuPSYGu5Zw//Erhh+q+boA+oxOdmBrQ2f13CjMzfwGOBsdmv A==;
X-CSE-ConnectionGUID: cIvm+sWvTRuvw3z3CRiRvw==
X-CSE-MsgGUID: PP3uB+hsT1qPn6HgiZ+jCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79964179"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="79964179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 06:25:28 -0700
X-CSE-ConnectionGUID: Xnf/zaqMSwiDtHthPsh4xg==
X-CSE-MsgGUID: QphRdSC7RXmXgfQv3D+hnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="238361886"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 06:25:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 06:25:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 06:25:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 06:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7OdWwbA+JC/Mzm7+D2A6CCvkyRgp5GBM2vU+GnGsb6PwkroZC+KXotdK6N0QfBJQIEaefMHPC7Kgn3IKsmaJ32Hya8TMA/BAO3QeAwDM7/tLSpFXgMJUibd5wfBgs33r728OxRvgbqSvjEDZpuAgEizdOpBddA9MJ0EQOGaiGHEUWzFWDdgfOaEeDJ/Dk/cZ+EY1x9bvkFv8kJynhyXMwxDPR5NItsrrZqxU7ZUooMleBdr83u+GVpSQmrXK2dBBFZm1+DO7AJtvvAt9yd44FWKd4iFf6csRxYldWS4ZDNM8SVvuqmg3BBTb5K2XdryQiO+d8242l9Qw786EvMquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDqu8fFMrxtDa1d09261iQ2TlLpiRKND0ahpsAIvD0Y=;
 b=XapqPIeYNWqaJqh/6FMnvmZmCNIUI91+bOxFalMJdjveglRE4O7ErjV8wJckFdER5Kjf62cnzYZKukCOxmHEzX8ICrY1P+wA3YEhKerIRpSDZcWOOzVjFRq1uTXUHhKSzzi37DjfzBI5WEN0+czzmlw3eOC0I+ZpYVdOpHROet9mTgwUT8WVhRch2/0QCD8l2dvev3w7CFxSvbyDhhYwIHYHr4gykjrAgF8rHyJ4GC7R+Hx85/yDfQs10xJLiLtSeeXcoiRvCfBASZPmBzAjNcpT1wBY924ZnrgYiwPlBYu7Wq28BbGLYJ0+N5+TMPzkDpeF/1vZKsVq4CFQATq/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 13:25:21 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 13:25:20 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH v4 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules
 with engine types
In-Reply-To: <20260526173056.967215-8-violet.monti@intel.com>
References: <20260526173056.967215-6-violet.monti@intel.com>
 <20260526173056.967215-8-violet.monti@intel.com>
Date: Thu, 28 May 2026 10:25:16 -0300
Message-ID: <875x47br9f.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB4843:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d54f7ca-27c7-4610-dbad-08debcbc9102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|4143699003|5023799004|56012099006|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: AcG5hMbcL3anewT2OLDUHVaRkV+ZPHfdaLgg2RMYLlS4DrsQ9gRF3V6XcaRfEFb6hSzALntwiIP6RMCW1cipXODGDmtc8SJWv4cpRZ5gtstAeI7W5S50P1fAjPfrR3XbDW+Qp1NF3SjUJI1X0eq5ABAlonX2wp3WngYM0vXLu2wf9i2M633Latqc5sg7/mTlLoSiS1kF5311Lsko+a8lcPKa8pMcBT6VjII50mVN/zXc0J6+t7IKuwMpwS3NXpXIBXnR8ZekFnE0GZwry9eKsqo3m0+jBtF81IiPKt1XncKUv/FA67NN7Q5uOEhY43XgACLMov9Cz5Sd548TgOcthHmgMgsr0zybNbIIC5RHEMQ9qI5D+2FqmFpp9UlClVWTgIhQS3K0g6Sw2cUiRfE0cKD6G8ETCFRjRq2G59qfNVzIn9th78ZvP9ym8VZBh1S7loTQYE5/nClT5hhD4SbKm/uGTWRdHGhXiXJG7pkNLTCMZxHN0PcXgCS/j7+rSGH8PabSnZkF8EA+LJy3WznFmEJqtWIo04nsMBkkVcgR8A+e8jZIQU7u2rV7J2M1VXxkn8i5E79NrZ7c5na1bL0/XsPVzrWpn88nbramEfxCAIEYIudhwvVn3saFLdIcWXITNWAUaEWjV3Pt5FRTCPUr0hgMkaxwAP6KTNMPD3/uEdGCl/FdhC4gyUUmk2VmvRqu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(3023799007)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFaTk1VM2NNbHlBV1lRaG1UMkFRakJjYWZpN3l6Z1Y3MnphcmVoY3YxWTRT?=
 =?utf-8?B?Sm5xSGJ1cEhGcXFsOUNRQW9BelJZTDFmblZNaXhZQlRtdXhZQ3doMUNPMUlK?=
 =?utf-8?B?Mk83VUlOYUdzbWxuNGsrdFZLaStmL2JrY2s3M29VR2VmNkNlWTBXRXZDaU9F?=
 =?utf-8?B?Mkg1bitOY0I1c3BvRFQ1aENCMkVIWlZjVWRPK2dQdkIwODQ2VitmenA2WEZT?=
 =?utf-8?B?UVVyR0dDUXhQNk5rNEI5NjdCWXU3ejFERVc4UEtsMkppak9uNHhlOFZINFdO?=
 =?utf-8?B?c3VCczdlTktrWTRSbVI3SFBBK3oxQjd1VWlWRXVzT1ZEdEtjUDBHYU15SDQ2?=
 =?utf-8?B?QndSVCswdDN6UmtYL3g3SlpPMjFVbkxuV0daNVVBWkhNbDd2M2wwOWtRZ0VU?=
 =?utf-8?B?bnBDRktZYlNsK2tUNStLd0JjQmVMdHdKMzV2THVkbjdKdGNiRWV3N3FDWXE5?=
 =?utf-8?B?dU1OczNCcWlPUEdYM1NPdkpZQjFFNUJtazJrT1ZjbUx1c2todGc5dU5VU2ph?=
 =?utf-8?B?NXl6L0IyWkt0NUNMZGRXVk1tTXJjQXBFSm1FMDcvZ0xlZUtuZ2FERldtc1ZM?=
 =?utf-8?B?dm4raW0xWUQyd2ZvQnp1a3NOTE8yemhxRFpoc2ZicElGTHo4RGoyL08vSDlm?=
 =?utf-8?B?dnhWR1hHV3djaW5XSWpLSHZtVjRVTlE1dFM0TFJscHpsYzBiSzdHbEtQT1FN?=
 =?utf-8?B?MlQ1UXQ5NU5McDB1TE9XMWhCK1AzNG8xaWVGd1NYNG5GbGF5dWJVZkJSSSsr?=
 =?utf-8?B?MHdqN0VuVTBLRENoazY4TUtWSTBGWFIydDRsbWRrNXNUVjVYOFdKTm9kdUov?=
 =?utf-8?B?VzVIa3BPY0QzbEdwY2dmQzRWb0MzUlBuRHIzcUI0REdDOUd2L2JQUUJlOEh1?=
 =?utf-8?B?RXVxZE91Mm1zdzNuSG9nN09ScFNQRFBWU1BtTGRiR3YwMjhQWFNjUE15SWc3?=
 =?utf-8?B?aW9NUlJrQlBDYVlPUGZxOHpGZTRuODJIY2V5ZjN5RmkyWWQwZEZMMDVIeSth?=
 =?utf-8?B?d0pHL25TelAxeXZDLzZOL0FCaHZteUE0UG9GcHRUanNBOUs3bTZaZW5DZjBu?=
 =?utf-8?B?WkUvUHVNU1dEYzdic2dWUHpKMytJNjUyeWhQOEpJUTMyci83QWU2bG5jaDJm?=
 =?utf-8?B?alh4eXdLVkhvem83R0FUTFc5YmdsWXUvYUpoa2VaUUNqZkhOQkx0YmtuV3VB?=
 =?utf-8?B?SUZXQXhjUE1jOU1TU2dpSTBySWx3ODhpNFRkKzd0SnJraWJ1UGR4NVFSKzZS?=
 =?utf-8?B?OTQzWlpVbU5vNEVpYy95SlY1d0JmQTJCUjNGVWN6ZDgrcUZLSy83QU8wWU0v?=
 =?utf-8?B?ekhLcFAzRCttTUhlZDlrYm4vT3c2NXkyUG5weERlc3lySlJUUzBDbW04UDFJ?=
 =?utf-8?B?SXMxS0ZLM0lhN0dLcWl4WEI2SllCd25taVFkTjkxV0VJSFRBNXZ0SVlxN25t?=
 =?utf-8?B?R3QveUMzNnpuaGdMdmwzdDYxQkNFbmFTR2lyNVNPMWhnN2U0NmJVeXV2b0xu?=
 =?utf-8?B?TUZzdnBvdG1aTFExQkVWUjNOaVpSdktLd29zTDZSMzhOUkNvVDhrbTNaMGhv?=
 =?utf-8?B?ZStNNTZ5eXZQSXZIb0JNQzBDc3RCdlBGV2VVbjJlYWtnRG43OWk5WVp1eUtR?=
 =?utf-8?B?Qy9Sdi9xUTVoaGxWV3VRYkIrc08wT2c3cEhubzBXdzZpU3Zmd253eW5MR3dh?=
 =?utf-8?B?dWo5UmRjcFFJK2NreWgrYzZFOFhLUHJNSlpOOHhxOUNmV0dmbVpmakpMSjlQ?=
 =?utf-8?B?RGZjckYvS084Q3psR01qQzNCM1RITWpOOWo0a2tvcVA2TjNjRnZOMnRCa3Zj?=
 =?utf-8?B?bkVPMitVbHhDRjRzVGgyTUM1aExGU2N0TWhyYkdXZ2p2akxlMmJFNzUrQVVY?=
 =?utf-8?B?Y1RFakJ5L1hOUi9uVHczWGtWQjhRK1lpSW5JZzFpb1RCZG4wU1ZWS2xyckJ6?=
 =?utf-8?B?NDJPbzFFK0pRUHNmb0JVQzFLNnpOQjlvS2FoeFRSUVZxckxTZWRGWjJKaHVQ?=
 =?utf-8?B?cTZ4a1psaHFtcXFBOURCak9teVMyeXcvUUtTRmI5cmk5T2NhWDArK3Bvd2Jt?=
 =?utf-8?B?LzRxcFIxZk9kUWM0WTFnbGtxbm80VnV1VzBVSzdoL3B1Q2p3NWhVSjRlZXdw?=
 =?utf-8?B?MnR0TjRBS1FoSlVTdGw1MTB2YWtHaFg2WHFJNWJyZW1CZWNlZlBWcVQwQktz?=
 =?utf-8?B?TnVLMnRvb0hFSEZTZk94ZDZ3bHpMOWRzV214VjZoU012RjdsWGgvaXFMTU1W?=
 =?utf-8?B?czk3Y3BvdHRGWGxDR0tZOVEzYnpqL0QvVlQxU1UweGRWdHE0NkdCZGpVTHJi?=
 =?utf-8?B?REdFWDN6TS9YMWk4MEEvSTdzLzJSUk1SR1ZmbjZrMDJud2thMG9DQT09?=
X-Exchange-RoutingPolicyChecked: GlFG3WWnYo4ryjNj8lGzVsypkK5T5+MN9xH3VTmxLlUcHfbjMrdEiDlWdPCdluAT6Za1OWDVrKitwov6/IszY4uvQuM1JkTzfensN9BrisfkBo5HOPrgUxX8JG/yTkbf+qB231Wf/I3d5TG6hhjFpBaQHELsP16UJlH8pW4DwwA37CIM9d7ZkJ2/CX8Kc7+DnFxpxJEBTlTRXz578iNnJSPTUnGOfp92QbIEjZ/k+KFo5lsDtNfx/eOFE1vT/Hb9Ld0rNkKeEUKzr+GdSjqvF1RIoBbm4O0OLK4roLRxNjnccrAHE81kzrjK6TWJyj3E7r384dpIoFkrcbdiACyGQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d54f7ca-27c7-4610-dbad-08debcbc9102
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:25:20.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICo9SPYLQXe1nMfxpeY3HSu13X6SagiV3uZy1FJ03dE+bMt0y3AhbvB6kc1tAIMTw7dn4GhVjhVOjk28uS39Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
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
> ---
>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 55 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.c                |  3 +-
>  drivers/gpu/drm/xe/xe_tuning.h                |  6 ++
>  drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
>  6 files changed, 71 insertions(+), 2 deletions(-)
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
> index 000000000000..fc707d972249
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_kunit_helpers.h>

We are using KUNIT_* macros, but those come from <kunit/test.h> and not
directly from <drm/drm_kunit_helpers.h>.  As such, the above include
should be replaced to include the former.

> +
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"

We don't use stuff from any of those two headers, those include
directives can be dropped.

> +#include "xe_rtp.h"

We are not really using xe_rtp.h directly, but rather the types defined
by xe_rtp_types.h, so this should be replaced to rather include the
latter.

The rest looks good to me.

--
Gustavo Sousa

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
