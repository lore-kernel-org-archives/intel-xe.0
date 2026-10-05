Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766E6CA5FE2
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 06:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A34310E0FB;
	Mon,  5 Oct 2026 06:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoymhuDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C63110E0FB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791181421; x=1822717421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bFHbSyJiICnkU7RALNWc6bKl4fkkmZzSXk5VyJ5Jra8=;
 b=aoymhuDjsEMjU+XzebZgh5A8NuVsXPTeTOfM/qxlqFWd0B/+LNjhaxD0
 igjw+XXp1MtjkeJUZgVXXJZsDZMz6HYau9UWs2GPF1SQldwG+raCLsR0h
 SEcKFztNXGS9yknN+biWYnSrkRm/hvCHyUEU7Yo3krJ4aDC8a7odLfxWJ
 vM6OyqzkavWvggteUhx5yz1qtlXkyXTIws+sU3RhC8eJ9dZn5dDy8Pqif
 BNwImVlZ6pXH8vyDyY1NvGhPAzxgHQh2ntUu0Yz9TLyODSlRl9iyE2PoH
 lZAVdrhkmEP7xG72sPdIoMQS+8KryKr4p5vyg0C4Urb1jeBqOvOk/skb/ Q==;
X-CSE-ConnectionGUID: vhrPO45QQ9S/QLOwuf1P9A==
X-CSE-MsgGUID: lGN1Ff5PR8mVmSvJr7E2Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90876698"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90876698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:23:41 -0700
X-CSE-ConnectionGUID: u5G5jNPZTsWq21cMLAideQ==
X-CSE-MsgGUID: XiujfG14TSWPmYHllrtPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="275842775"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:23:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:23:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:23:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Kz9HBzlhBC1H6SnxQPrq/kA2pmfGP9k4eu4li4wOCVx06j/FeawXJZLOMiK4ZreME/MwtaAcuEV36rk7Jgikly949UIoSb4xrqQP2fms5SjHmimJrXLIhNiZulZYJ51NEi64xewIL8Ow7EF1qnQNLXUK4HT4N3MUqMTdxIsPtifDmItUf3f2f8WC4PYeHx8Ht04WTZG73yEFmahEoeAP8Dz5LqJhZ0mUUkXgGy/OBicCZOAGXl86odJe7eY4QEmn8240CDsmn977iko+6+bIAqt1bLTzAUS2hL4jzAro2NFOu5rpyX+bH3A6GQPifXvwLYCdAL3TVqjZZhNNK4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9GRnrDMsSxH+K6AvJHAN+P1DY1a8i8AqtQZGJqVx4Q=;
 b=pi9450HYTQSCP6NpjIR81O1ZBUUgg2YV4Kv19lzSx2VgkREwdzCswTlmGwOuUGAjEo/UY5TKm1eEmk+MlyQChwDj8m5T5TLzTnLx0x4xIqmV3igGXO7swIIT62reQt5cSqxtUSOWqzT4TJdWWNhBp+QC6YabInjdha8+v/Y3EbfNtGvGqtlWZywpYANnzsQoj/31PAbKR3d1xQo1EiomZC9oKNd5TweYoK0k6n9CUvjz6wIjH1rHCZYpHybctATF9LoY98Qeu4vfk2cTWryOyRq8GN7FIjQVWLZ5mTnoB/PMwB5MVhc7U7asps+waMGE+r8E2x3WxAVnsT6SX2m5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH3PPFA061B3868.namprd11.prod.outlook.com
 (2603:10b6:518:1::d3d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 06:23:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 06:23:37 +0000
Message-ID: <c6fa4ed7-a873-4c5e-927a-64537b58f725@intel.com>
Date: Mon, 5 Oct 2026 11:53:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/oa: Zero OA buffer at allocation
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20261005054011.2542699-1-krishnaiah.bommu@intel.com>
 <20261005054011.2542699-2-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261005054011.2542699-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0278.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH3PPFA061B3868:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb719f6-dac3-48c0-e2db-08df22a9304d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rwXCIIucceX+RIIptrkvdODm7vj1CgkEA9Y0lQTR0MB32lP3aruwULTSe3XtvNuSyr7qb6kyMDFEtIPhLxKoFfp9/UfiaENV2gAH0utTZjSd3BPi9LrsYWMFDowiSlz6liJTDeXfOtr+DDzBADv4qyb51kR1Uxw9tEKONRO4BzLzpDJe78j5Ii/tverHFXUVZZjcFN5Clb+dmIrfXFjKEhuFMvkuXm3O1dUi91lOPq0b09EN3cu1Q79NLjN2aOBQsxcl0/dI/EOutivk0cHabrrrK2nzgW5391yp7KRZW9lqDTgnF8PAog+ENgz/ndD+cjAJgpFY119Av9BngYCDX5hFzwzQD8oWM5FGFgxXuwVIM6C5iOgvwCHatHmdE72EokCHgpG0R9kuKE4nXOp8NgE3Hqf3H+W810kLvpuKtqKxqMkhiLV/HYE4US2FWHYgUvqsld9RlTi5k2nV9HPrvlYsegwVGdNHQV1UlF4A2aC5THHDPUILWmDHQ9zmwTpkTNG13luTf0ASN1yrvTUUxOs2kq+WPvm52z84cHXCvQM9mRdCfech1io28LEULNtwCQRmaKnm8TYZo6ieJxyyiIeEF+zOpNbjbws1FBN6MA0kH+DW1aV+JdYu2zV95oENt8OU/z1XoP1dtDe8HYCdLuonOW97gRUOnZF4E3xSZME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHBVUEx0ZUFpVld1ckRUbFFvVHJsRmpjMmlzRFBPM0ZKL2Y0Y3cwS0NhWTZn?=
 =?utf-8?B?THlPWEh6bnZNTit0UW5rWTEyZ2g4VEtCTkVIZWhObWc4bEgzb0t4QnNUVmRH?=
 =?utf-8?B?WWhhMmJpbmMyaUxIMUFKSkx4OFVxcU56WnlycGpIQm1DSDlqZ2dIaDhiTFAy?=
 =?utf-8?B?a2RTSmhPMGtQMFpUbEhjd001SmNrTFcxbkxyTXdGRUpuNm1lV282YXlqT0U3?=
 =?utf-8?B?U0JtWTFXVE5VRzJWUGNGSWNRbk9FRFU4VUhlcHUwZHZXOHZ1WUlqVjNxNmlp?=
 =?utf-8?B?WWsvdkttYVA2WHk4YjJVRDlZb2N1TWttNUFQb09ndTNQYWg0QVRsZ2FBODJP?=
 =?utf-8?B?VXdkaGJjeWx2TlpMelZsZHdXRkx1aWw5VEdHOU9WVWxvb296UHFEWHQzTWMw?=
 =?utf-8?B?K1VTcFp4UWpxOXRsdTJJMmhjWUFwL3BmSEduSXd1Y1BmNVVoUTJyVzVlNkx2?=
 =?utf-8?B?a3AwalhGWkV1QzFTVVVYNFZKamVNQlhmRUVrc3BGQmhWQXFUZCtPNjFmN0Jn?=
 =?utf-8?B?ck9rNWtzR1d4N3FVZjZwcUpUUysrdEIrR0R6eFVJYU5ZQU1xMnNycVB5Rm56?=
 =?utf-8?B?aDZHSkhYQWRKclRlRFJrcnJqV0dGNThLWGFPQUh2eGJpUWNVVi94SjRlR0R6?=
 =?utf-8?B?cmNKaEl1dlREa0lrWW5ZZDFrcU4xSWg3cXJQQWpETVpMK2xXcDFVaGIxOVo2?=
 =?utf-8?B?Qm42QXFtT2FRRnFwSDY5RWdOSjAzRldIYUFoOHpvUlBPbTJIL3FDMkpEMmUv?=
 =?utf-8?B?WTl5aGlqcDgraW5aQXZVUm5YYS9ueERMWDZzNmY4UzZ4OHVTaTY4b0NDSFBJ?=
 =?utf-8?B?L25KRUp1OHlMQ0p3ZnVuQmd1b3JKeVk3ZGVqbzY1QmxBa2RMaHZ4NEE3MTh0?=
 =?utf-8?B?MUJLeEsySFJtNHJoN3ZiTnVvK2FEeUVUMjJnd1ZsZWl1bkNvVVJuTitlWjZr?=
 =?utf-8?B?a3lUOXl1NG5mSDB1T3l2cUdUVE5aSzA3eDVDWVZGbGdTUktwNDJ0Z0RUV0ZZ?=
 =?utf-8?B?aFk4NFZqd012TU5Wa2pmd2pqWlNNZit2VzVMRjYvMzR1em0vaGc3L0l5U2l4?=
 =?utf-8?B?anp5UTVBV2RITGVXdEVHMmdSdU5aZU1MWW9ndVRxK0hoVEZzeU5KYVdyd1Vv?=
 =?utf-8?B?U0gwUEYza2VCNmRYdUltK3ZZQ25VTTl4RjlYRlFjUXNmcW85SjFHK3F3QnRT?=
 =?utf-8?B?YmI1QUVoTWdsOWh3RHFFVGlESjlDZ0FlQUhzM2NzVlJTU3A0Y0hvcUN1bW1E?=
 =?utf-8?B?aDkvdFRYS01KNWZia0twOVRkT3FoMUJFVHAzOTIxU1lDNXg2QzRmVU1CL1Ew?=
 =?utf-8?B?T3JTa1RjU09oaWg0dUtvOVJZZHA4R0RuMDJaRUo0cE4wY1ZKelVWS2NGZElP?=
 =?utf-8?B?S2ZLcEIvS2JOSEVieGRQTFhxMXBFVVpYMFN3azJHSHkxdVl2aklwS1JKQ3F1?=
 =?utf-8?B?bUU2dXRqc3ZrWFpzeGwvQnM2VnZmSHQxa3pMTGhlcUNlNjB5enNXWDFpWTJi?=
 =?utf-8?B?RURubkRRWWlPMG1rMGg4ODVXNzYyOWpKN01DWTZrTllOMWJTclE1dXdLTmpZ?=
 =?utf-8?B?VURCWUY5N0s2VjVXcENoTmY0QWtIeU9GcnRxQ0xldVlKa3VBS1NJNzZ3MDZF?=
 =?utf-8?B?RTE4bGRGWnhDSEFWaStTQW1YRE1RN1cxL0drbG1LWU94T1ZrNFQ0T0hMaUFo?=
 =?utf-8?B?RitIeVJWRERxSTg1ai9VVnNZUE5WeVhzNEIrV1hia2kybFF6R2FQL0xOYlQ2?=
 =?utf-8?B?NE93WHlrOWx3NVlBNmhpVVlHeXVObDJIWXJVOHpObGxBWktsVnBIUUwzU1hJ?=
 =?utf-8?B?ZTJ4MGIwWWM0SHJWdWFXTENIT1dlckJmVzBlclBJclFPckppVUVIRm8rOTNQ?=
 =?utf-8?B?d21rb1BIMHRpWXoydGllMzFHM2tzbmlWOFVYbkFGK0ViV1BzT2pBaEZmd0ZV?=
 =?utf-8?B?RHpOTThia2d5aEdWQXdQVzRtVDJLQStBL2lPN3NYS2p3V25MUUMvN2N3TEdS?=
 =?utf-8?B?TmRyQ1ZvVWN0NXVUR25hblR3Qll5QXdSMENyNnNOL3NPMUw2QTNROFhnenBm?=
 =?utf-8?B?bnJlejZQTWlybmNsNU5KcjlySnlma0tXK3NsaEdYVnpJUnJTbGF5S25jTFY4?=
 =?utf-8?B?WDRSOXk0NVJQK21yMmxpWFRIYXl1MHN1bmZ0YkROWEtxVUlMKzhKSjdGWCtv?=
 =?utf-8?B?Ty9nNisvM3N0MzVKaFU1N2U1c0l3T1ZYMWJMTEd0aXpKRHE5MkdyRWw2alI5?=
 =?utf-8?B?VFFObXppd2U2cnZoMVR4YjdrV09hSnlvMkVja2NYaGZEbng2TzVFanJmaU5Z?=
 =?utf-8?B?NGdqZmVwaFo0TEJyUW1CYzRublNQZGJMeEJ5L0h1K2g1Z29KaXRlc1V5ejk4?=
 =?utf-8?Q?38GhkCgEbjNATn+U=3D?=
X-Exchange-RoutingPolicyChecked: A8kz1Wa+LmZIY40si1ymqwVULDosToYwQ1MCwdmwbxv9382sTwXFNS6if4A1mNrO2k4q5VUyFtWUo/8BABo47XPvD0mz2JvKtSZKN03Ojm9MykgCgXMvrSNoPpgMh+hO11zupTbqnqer8KaOIgtsjsDoAYoqBz+6hvO4UJLqfbiPmah1N12r5v86DoLTfbZqEVcWmyCGbO3o1oFUUqKYL4Q1bQCJFdG0QFWD0H+7nBiYIwr1d14ie2nc1urRRId/7zn1Qas/h4c2XrZt46YBBOs9eb2LH6If0miJcFyStO6WWQTLNbt4mJTyDjXO0mlN50Xzp7aC4cGRAK6oHo2xbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb719f6-dac3-48c0-e2db-08df22a9304d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 06:23:36.9906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6d/cbAO/J/j81WkMT71jvNlSv/yhxIbFKroZ1A92VRcapY281RnftOi7NFr6ijRJ7MbOzjacmDzjB0t6IL0n/J3rNjQfYDqbkzklDWRXBjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA061B3868
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



On 05-10-2026 11:10, Bommu Krishnaiah wrote:
> Zero the OA buffer immediately after allocation because kernel BO pages
> are not guaranteed to be initialized. This prevents stale data exposure
> through mmap and fixes the xe_oa tail-address-wrap test.
> 

It looks a  real leak: a stream opened with 
DRM_XE_OA_PROPERTY_OA_DISABLED skips xe_oa_enable() (hence 
xe_oa_init_oa_buffer()'s zero) but the fd is still created and 
mmap-able, exposing stale kernel-BO pages. Fix is correct — please note 
in the commit message why the alloc-time zero is still needed alongside 
the existing one (xe_oa_init_oa_buffer() only runs on enable and must 
re-zero each (re)enable for the HW's zero report-id/timestamp detection, 
so they cover different cases). Since it's a userspace-triggerable 
kernel-memory disclosure.

Add Cc: stable@vger.kernel.org.

> Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
> Assisted-by: GitHub Copilot

Assisted-by: LLM is sufficient

> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a3484e943c55..3bb8bbef4c37 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> +	/*
> +	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
> +	 * hold stale data from previously freed pages. Since the OA buffer is
> +	 * mmap'able by userspace, clear it here to avoid leaking kernel memory.
> +	 */
> +	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
> +
>   	stream->oa_buffer.bo = bo;
>   
>   	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);

