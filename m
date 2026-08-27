Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120C8C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 18:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9842510E1F5;
	Thu, 27 Aug 2026 18:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfZJQV3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B5B10E1F5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787857152; x=1819393152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zyU5pvlnsUKkppEi9K/N1FYXnaoA+/emLfSNTgG8h14=;
 b=PfZJQV3PzSfRcr21CJsqz0ZutaNghobpENDr0qfmJ469m/i/Jufrdslp
 LbSOOktH1h9wxJ2Ypt5DHze6B5wXDDYa3UULfamldPkknsMxVyR0J9EVi
 WFlkj6JDaQIpCv5o9fJVv6X8PwXBGutNDh1aQ2WOwKVTLgGBDt1A7Ujq/
 f61rccX4aBQQg05hDyplH7YRF1hGGIntY4CssTkIp7foqm0F3esZG7XLq
 kjjNUP/ieTSMRNEsQOBpu3iTzV97FUZtKD0qe2/iOW13uuyXDgkaeot6I
 9gzPtGuGREUgNBG9Ue04Jbyg+6JQVdPJMUQuwLgSUjNoloGmt0Amn1m6Q A==;
X-CSE-ConnectionGUID: 5yf9yVo5QLa/Yfj/YwKwnQ==
X-CSE-MsgGUID: xh1PMr2WT4O6Vaq1Kwn3Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99527773"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="99527773"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 11:59:11 -0700
X-CSE-ConnectionGUID: SGMQ489GQfiDx+e4T9BcZg==
X-CSE-MsgGUID: fMygr24HRxKec5thV6OrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="266148636"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 11:59:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 11:59:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 11:59:10 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 11:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPyiKJFSjvWmxFZNw6KFbND3Ufbed1Bs9UvmCQkfmFYIyCwPEGKI+2FwpIF3fbyBaDo+atkUcBBzkomDbg4rZac1tfANV/NgbUs/+A+s/w+mWZNEOUICfbL8R1MJCt33bgmkFT/Qrj7BzHMHawx/WfvO/BdY/ANmsXa1VMHJeYGNgEXK70+Q5UBRQifZsEs1rxqFk0QZRBuS1pkfsLCTfNg7aLPrO5NJ9fSAdcwWP03xjDJ629fI9R14TzHm8TXaffurhi7OTjiuW9T6izroN0amFnJf8B+ShuqDq9UwLmo9TUWRFZAkIJZdB04JYG01yrAbvN9tre2rcfOrk4+YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm3ViDpP5M1MqasKJNf2KI6KNyWHKubJRh1ep1/TeGY=;
 b=GUK4flnPemFsGE57JZyICE8/b/mO+mwR/mYfbwACDmUTdsDs95acyO4v0NJvGvs1VRDUbWbtpdjJaglKFFrOONmVZXMPNmun7Yr9FyVsCvjD/gYpIGhJT0xrdWsqn7dvOFjdZosexwUVF1ToKwpTxLwdhhFrhEpSIosXajX7sEqx/I/jaJZv+sNp23Qna87P69jZhuIfAuBxzbDsIaJmtPzkIhk756K1eyNvvVpzC+LyxtYFURzf3KZ/5SlNahJ3VCWKSbXSHDy7lhmHncjuaBEtKG82aJ8IM9fllnyOGEvzgVX8kBbE9p3/Bu1bzdbnifYHGxN2YRs17cQAzrfy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 18:59:02 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 18:59:02 +0000
Message-ID: <903a1e9a-353d-4d8b-902d-b7dd9db146fd@intel.com>
Date: Thu, 27 Aug 2026 11:59:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com> <aoTqUiIq8DMoT1dK@nvishwa1-desk>
 <aoUAYKkua2E065zU@gsse-cloud1.jf.intel.com> <aoUoOdNmsUHLt1p9@nvishwa1-desk>
 <aoYFjxHK4fcQ52Xf@gsse-cloud1.jf.intel.com> <aoZ-6-TnzfLo5Vt7@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <aoZ-6-TnzfLo5Vt7@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS0PR11MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e88db9-590b-4222-72b7-08df046d4250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|5023799004|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: wFnYYPo19IhQdvySUPco+kW/8R5k0hYu9DgrL5zjbMhgFTpmsnyuo+Z4BPGUKQEGtDAZEL725/XHHwV6M//Ghu/wVfC+AVBLoyy7WLhoYIFPwvx2LQX8N9WahrknYnv12w8WZ/AcBUnc+sNJ5IN/zeYdHLI2XHioq1wvzgbERpQC2YC8FpZ5BtHtKzJ30DpN/Ipud3WVBPh4i/juZEq26G/Wj1bXE7h7E7NepDl5tz6DHLPb2m5xMxGQ2oA6gMoRUsDhtwcUbpt12/PFmwbPiHaNTdJJeAXkOagGvPLPsBfGhsQGwwK6ol/x/UNjxBCjXcr72zTZH4lcUWUi4h7bP6s63rtHHnTy+HA2b6K9fjGlg0HZb9kdQhXGqMxqKNmf3k7SCDnQg2uLtd4fEEZB/WBedn90PCJgAvWns3Pve5ycHoJhR5nXGSi5OXMxLDrShvrb0dVMLSoQ6FIH40lUCqm683zxKltbtpcOmjLxp7hmqGxaYIzHwdZ2gm0isJyGTQ7yccHtRhAGDLmMaLjbcT4LjbDH7Z/XrcsxeR5MxUX4WOiLEqfgX4HNwJScVmRCWL2GvncCaaQEi9s6QH+ja1BT5OQJ4YT+RQqh6i9dq2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkpZNXdCZ0ZhY2VkakRJWjYyc3JmNXJFdi80S0RPRmdxdkNhakV1dmpCLzc0?=
 =?utf-8?B?amxodzRPOEw0Y0d3MG80azJkQVN1SEZvcHZUQTB3SW9BZkJhWnppbHJRUWhJ?=
 =?utf-8?B?MitjMldNVlJSUFBiRzhnTTliMXpWL01CVnhMSmZVVjltTjVjVC9UR0gwdFFO?=
 =?utf-8?B?dFBvZkhUNDRjMk83cVpKSU9EdXdmRG5YYlhyYmVjRFd3S1lVQVhmajdsMnpu?=
 =?utf-8?B?ZzNhMDk4eWpRUnV6akZuaW9BNmo3OWNLU09WMkNoSmZXSnBRQUZiaExzRDB3?=
 =?utf-8?B?REpTbVhJazh4K1B0L3l0SnNMc2d4VURtcWlaOHprNHpxRHlQNUZaRjI2UjFV?=
 =?utf-8?B?Y0Zxd2pSRUhVSmhDd0JUNFIvTVBUdlFXcjloRkhucEpLTzcwRE8zMTQ2THVt?=
 =?utf-8?B?UDV6UWFPZVROcEcySlVLazBqZlNoenhoTzZ1REQ1WW5Wb3NpdWFhNWVaOHNW?=
 =?utf-8?B?Q2tSMU1FSy9sU1doazFDN01YMWswc0ttVlQrdlNKMkQ3UXZNYXA1NmM3OWVQ?=
 =?utf-8?B?cGdXc0dZTXBkQkFkTldnRTF3dk5kVHE4eU80dThKMnhWVHBtcyt3S0UxRjQy?=
 =?utf-8?B?YlNaYTF0eE5tTFpNNXdlR1doNEYwcS85MmVSdjFuVHdTalQvd3JTWkhHTmlN?=
 =?utf-8?B?d0dKdVErQXhxLzIraWZyTEZkZUhzNS9lSmlUbHFlcWhEV2IvTTJFajNvOWxR?=
 =?utf-8?B?aFNyRFN3UXJrOVRtTGk2ekhITk1nRHZyd3lLYzRLaVNJNmtwWXljRDQ1c2gx?=
 =?utf-8?B?L1FiQ0dxd1VGMmUzdzlDdDFNMVhKc2VUQjVzL0IyS2VhbWJBL0hhTDF2TTJt?=
 =?utf-8?B?NGFPcUE1ZE5SYVJCUzl3aGJzUDhrV2I2ZkJlQmZlUndoSDhaN3M0bnFwUW41?=
 =?utf-8?B?bkNyd1lodW4yajBzcWZYNTNKM1N1ZXQxR2NUczRvZW5Uby9hUXdVeU11cFQx?=
 =?utf-8?B?YUNBaTJoRkp2YUtGUU0weVAxMENCMHhGdS9zQ0tNVk52SDJJc2FIdmduRVgz?=
 =?utf-8?B?UzlNK3JQTUFlOWVNOWE3UnRKUm9SQVc5QTFaVkdPV1p2MHJ4MzBWNi9IMWVQ?=
 =?utf-8?B?QmY4NjA0bXFXT0hQNUdleFlXaml4SXN4YitRYUdpZHB6NDBFV2hBdmFJOTQz?=
 =?utf-8?B?dkVZa2g1YWJXMHhXeHNGeVJ2UW0wSktHN2tBZFEvQUNwWUFIVHBtQlZvSngy?=
 =?utf-8?B?RnU2ZU5Ud0NERERWZkFPUjNNa09kMk1VRVlhcmowSy9ZNktRczJpZFRDdkdx?=
 =?utf-8?B?ZnlIS2hUTExGaWt2MTNqK2VwMjdlM244VW04OHRmdDBFRWsrdE5XZVlmZzNo?=
 =?utf-8?B?TjJxQUYzWTFqTzJSd0wvamYrY1ZDRjFRUm53VGVXbWJ6RVA3dGxBQUxxVWd6?=
 =?utf-8?B?cS9TdTcyMVpNVzhTMnlQMUE5aVlXajJacW54U0c5Q2l5c1B2b1FYS210Vm0z?=
 =?utf-8?B?anJzVUZSdHNVWnE0dEllbjNvd1MxTmhuNWdOSFU3OWw1Z2FwMTBXeDQ1Y20z?=
 =?utf-8?B?Ni8yVnhIaGRqR2ErYi9KbDduZ0RXTEltQjgzaG9hZ3h0ei9mbzNYY3VkbzZs?=
 =?utf-8?B?NVkwTzdkZHdLQklZQjhXQTRCU21hakp0eGg0K3FDQzBIL2RtSC9TRGlYRnlE?=
 =?utf-8?B?Tk8xL2lzSENucFpNcWFSNFl0RkhZKzdhYlhtRCtFYkcrY2l5Vjl0UmhubFJO?=
 =?utf-8?B?L21rWXhXa1JTWi94cGFPazRKbFlseTFMYjhRM1BrMXFyMTQzOU5NTDhubHIv?=
 =?utf-8?B?elBtc1JSaWZpSDNVb0VSUVh6R0FvdFhXYU1lS1pWa3B3QWtnSE9oaklWOUJZ?=
 =?utf-8?B?TUxYUk5MZHBXUkt0Q3RZenFXZVVwOTlxOGh4MS9PVjBEWHVmR1VINktwUnlY?=
 =?utf-8?B?SXNEclgwZ3d5OEhnQ1ZPN0NkU3pTSHJmNjBLNjJ5c2FqWWhwck05NWF4aUhO?=
 =?utf-8?B?ZVJlWC9LRUFpcStVM1dqbkVpQ1YzTHduNDltL2dqRXpvTzZIUDd3N1UvekRq?=
 =?utf-8?B?TG5Tdk9FRmpFRGJKd3Mwc0dUWHZPdTZEVGRnVVlUTjVzeExSL3U5ZmV0c3Rv?=
 =?utf-8?B?cEF3YnBuWXBEVlE0bFJkSXpJZXZTVmJlcWF2QXFZWnQ2V2NBM3Axb1dyemlu?=
 =?utf-8?B?MGVYNDdLZERzRkdvZDYyM2FWS3FyOU4vT285bWFtaHRuWlJ1Zlh0VWlsQ0pR?=
 =?utf-8?B?VmppMWNEeGUvTlZwOWZ6eVZCMlhTOFZTRTJYRWxLZFp1ZTRxMW5qNWFzOEM4?=
 =?utf-8?B?TmF5QVZmRW5ST1ZyWUxScDhIZ2Z2dmNXdWVkT0tLaStkZ3JmRzFpODZnK01n?=
 =?utf-8?B?RWlneStnWHZGcWN4eGVtL09kZWY0WHd6WWxRVHZNYWxjZk1Wb1RJUFFtT09i?=
 =?utf-8?Q?GIUDjhnNTZS5NS3A=3D?=
X-Exchange-RoutingPolicyChecked: J9sTK2mneG1jn5LAa9yq0wqhqTEXNfcX2UFa2CpzBGeFvWxiAbjuF7xj1TYthhg8CQTXyWgKGmCxTqdG5eWCgxuNvXVc4MhkynpHhxi5J6n9u6CsKl73RKNJeeS9fMcnqR97SmnNqaEp5fIq8HgAR8zMNbL2i2k2cBwlAcF9E5UZbePOuz9Z/6gsD4ggS4c7o+yb3RMw1GYDyf61CyYuA4O1IuhvpAPyVh8epdR+jSaYyeKwAr8JjPSnAAg5g53Tj3gNozWNXZm7l0N1r61x1vb98WUSXxDG1cENzLu0cvwR0pfw8S9RGtc/O4gp0wGDBCtpeTIUUD7CSPxbyCnmGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e88db9-590b-4222-72b7-08df046d4250
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:59:02.2621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ERqeOtF+W4bl9gYTlyxzFZVHTELRBZHwEerjHWzP0uXEdJH4r3kLdMlPzPiBDsfEaNxK1ywQpxEf+chcWnbBgY3Fpj+3DYKpD3naje7Q7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
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


On 8/19/2026 9:13 PM, Niranjana Vishwanathapura wrote:
> On Wed, Aug 19, 2026 at 12:35:43PM -0700, Matthew Brost wrote:
>> On Tue, Aug 18, 2026 at 08:51:21PM -0700, Niranjana Vishwanathapura 
>> wrote:
>>> On Tue, Aug 18, 2026 at 06:01:20PM -0700, Matthew Brost wrote:
>>> > On Tue, Aug 18, 2026 at 04:27:14PM -0700, Niranjana 
>>> Vishwanathapura wrote:
>>> > > On Tue, Aug 18, 2026 at 02:05:10PM -0700, Matthew Brost wrote:
>>> > > > On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
>>> > > >
>>> > > > This is designed to be lockless.
>>> > > >
>>> > > > > q->guc->suspend_pending is accessed without any common lock.
>>> > > > > __suspend_fence_signal(), called from guc_exec_queue_kill() 
>>> and the
>>> > > >
>>> > > > This is actually the problem. __suspend_fence_signal shouldn't 
>>> be called
>>> > > > from guc_exec_queue_kill(). This can prematurely signal a 
>>> suspend fence
>>> > > > while the hardware is still executing.
>>> > > >
>>> > > > __suspend_fence_signal should be called in two possible places:
>>> > > >
>>> > > > - Naturally in G2H handler (handle_sched_done)
>>> > > > - Or in global event that takes down the GuC firmware
>>> > > >  (guc_exec_queue_stop)
>>> > > >
>>> > > > With that, a lock isn't need because the state machine / firmware
>>> > > > interaction ensures everything is race free.
>>> > > >
>>> > > > So I think the solution is ensure __suspend_fence_signal is 
>>> called in
>>> > > > the correct places rather than adding protection via a lock.
>>> > > >
>>> > >
>>> > > Matt,
>>> > >
>>> > > I think it is probably not as trivial as dropping 
>>> __suspend_fence_signal()
>>> > > from guc_exec_queue_kill() for following reasons.
>>> >
>>> > Let's take a step back, has existing code been linked to any bugs?
>>> >
>>>
>>> Below Sashiko report brought it up as a pre-existing issue.
>>> https://sashiko.dev/#/patchset/20260713202317.2187787-8-niranjana.vishwanathapura%40intel.com 
>>>
>>>
>>
>> Ok.
>>
>>> > >
>>> > > 1. __suspend_fence_signal() is also called from
>>> > >    guc_exec_queue_suspend_timeout_ban() if suspend_wait times out.
>>> > >
>>> >
>>> > Yes, this is another example of where this should not be called.
>>> >
>>>
>>> If we do not call it, then it will leave queue as suspended forever, 
>>> which
>>> can result in some other asserts down the line. Clearing it is part 
>>> of the
>>> error handling recovery it looks like. As I mentioned, it will 
>>> likely hit
>>> the !suspend_pending assert in guc_exec_queue_resume() under current 
>>> code.
>>>
>>
>> But the upper layers shouldn't call resume if suspend_wait fails, hence
>> we shouldn't hit that assert.
>
> Looks like there are cases where it does get called but
> __guc_exec_queue_process_msg_resume() handles it by checking the
> guc_exec_queue_allowed_to_change_state().
>
> I think it should be fine. We can drop the __suspend_fence_signal() here
> and avoid the !suspend_pending assert by adding additonal condition that
> the queue must not be in a killed/banned/wedged state.
>
>>
>>> > > 2. Calling __suspend_fence_signal() wakes up any suspend_wait(),
>>> > >    which otherwise will have to wait 5 seconds before timing out.
>>> > >    If in guc_exec_queue_kill(), if we just try to wake up 
>>> suspend_wait,
>>> > >    without clearing suspend_pending, then a resume() might run 
>>> before
>>> > >    TDR kicks in and hits the !suspend_pending assert.
>>> > >
>>> >
>>> > Don't do a wake here.
>>> >
>>>
>>> If we do not wake here, then every kill happended during a suspend can
>>> leave the suspend_wait() wait for 5 seconds to see the queue has 
>>> been killed.
>>>
>>
>> The suspend message should either issue a H2G that will result the
>> suspend fence signaling in the G2H or signal it directly *after* the
>> queue is off the hardware.
>>
>> But I do see a potenial race. The kill really needs to be ordered behind
>> any suspends too.
>>
>> We probably want a version of this patch which only sets the kill bit
>> inside the KILL message:
>>
>> https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4
>>
>
> I think we should be fine to drop __suspend_fence_pending() here. We can
> just do the wakeup part here for now to ensure suspend_wait() gets woken
> up properly as we are setting the state to 'killed'.
>
>>> > > 3. Even if we drop __suspend_pending_signal() from 
>>> guc_exec_queue_kill()
>>> > >    and guc_exec_queue_suspend_timeout_ban(), we still have
>>> > >    handle_sched_done() and guc_exec_queue_stop() which can race 
>>> against
>>> > >    each other in accessing suspend_pending and clearing it.
>>> >
>>> > I don't think this part can race.
>>> >
>>> > - __guc_exec_queue_process_msg_suspend, this is only there for GT
>>> >   resets racing (I think). This should be executed before or after
>>> >   guc_exec_queue_stop() but not in parallel.
>>> > - guc_exec_queue_wait_suspend_done(), this on wait queue and we don't
>>> >   have lock upon reading, at least in this patch. So if justification
>>> >   is all readers need a lock, then this is missing in this patch.
>>>
>>> The locking in this patch is more of a write side serialization lock
>>> (where supend_pending is written and where test-and-clear cases). So,
>>> I don't think we need locking here for reading suspend_pending.
>>>
>>> > - guc_exec_queue_stop() touch this but this code is only reachable
>>> >   when GuC exec queue is stopped and CTs are down. I guess a new
>>> >   suspend could come in and race, so maybe in a lock is needed here.
>>> >
>>> > >
>>> > > So, probably this locking extention patch here might be simpler and
>>> > > effective.
>>> >
>>> > I'm thinking this need a bit more rework and would like to get this
>>> > right in single patch. I'm fine with a lock, but let's at least make
>>> > guc_exec_queue_wait_suspend_done() consistent in using a lock and 
>>> remove
>>> > the two places we should not be calling __suspend_pending_signal().
>>> >
>>>
>>> Dropping __suspend_fence_signal() in those places will lead to above
>>> mentioned issues with current state of the driver. I am worried that
>>> fixing those might be beyond the scope of this patch. What do you 
>>> suggest?
>>>
>>
>> My opinion is that this patch is trying to work around broken code in
>> the state machine, which we have to fix anyway. I'd rather audit
>> everything related to kill and suspend fences and get it right, rather
>> than adding locking on top that we'd have to unwind later anyway. If
>> this were a band-aid for a reported crash, then maybe. However, this is
>> a Sashiko report suggesting a fix for what I see as already broken code.
>>
>
> I agree, but by not calling __suspend_signal_fence() we would leave the
> suspend_pending to true in those cases until the queue is teared down.
> Perhaps it should be ok.
>
> So, does dropping __suspend_fence_signal() from guc_exec_queue_kill() and
> guc_exec_queue_suspend_timeout_ban() (with above adjustments) and keeping
> the other 2 places under the lock looks ok?
>
> Niranjana

Gentle ping on this one.

What would you like me to do here - respin along the lines of Niranjana's
suggestion above, or take a different route?

Thanks,
Jagmeet
>
>> Matt
>>
>>> Niranjana
>>>
>>> > Matt
>>> >
>>> > >
>>> > > Niranjana
>>> > >
>>> > > > Matt
>>> > > >
>>> > > > > suspend-timeout ban path, clears the flag asynchronously. 
>>> Meanwhile
>>> > > > > handle_sched_done(), guc_exec_queue_stop() and
>>> > > > > __guc_exec_queue_process_msg_suspend() check the flag and 
>>> then call
>>> > > > > suspend_fence_signal(), which asserts that it is still set.
>>> > > > >
>>> > > > > As the check and suspend_fence_signal() are not atomic, the 
>>> clear can
>>> > > > > land in between and trip the 
>>> xe_gt_assert(q->guc->suspend_pending).
>>> > > > >
>>> > > > > The flag is already set and read under the per-queue msg_lock
>>> > > > > (xe_sched_msg_lock()) on the suspend and resume paths. 
>>> Extend that same
>>> > > > > lock to the clear paths (kill and ban) and to the three 
>>> check-then-act
>>> > > > > sites so the check and the signal are atomic with respect to 
>>> the clear.
>>> > > > > In __guc_exec_queue_process_msg_suspend() only the 
>>> non-sleeping branch is
>>> > > > > wrapped, since the other branch waits. In 
>>> handle_sched_done() the flag is
>>> > > > > snapshotted under the lock and deregister_exec_queue() is 
>>> kept outside it.
>>> > > > >
>>> > > > > v2: Document that sched->msg_lock also protects
>>> > > > >     guc->suspend_pending, which indicates a suspend message 
>>> is in
>>> > > > >     flight, in addition to the sched->msgs list (Niranjana)
>>> > > > >
>>> > > > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>>> > > > > ---
>>> > > > > drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
>>> > > > > drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
>>> > > > > drivers/gpu/drm/xe/xe_guc_submit.c           | 29 
>>> ++++++++++++++++----
>>> > > > >  3 files changed, 32 insertions(+), 7 deletions(-)
>>> > > > >
>>> > > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h 
>>> b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>>> > > > > index 63d9bf92583c..78ef2e8ded4f 100644
>>> > > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>>> > > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>>> > > > > @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
>>> > > > >      const struct xe_sched_backend_ops *ops;
>>> > > > >      /** @msgs: list of messages to be processed in 
>>> @work_process_msg */
>>> > > > >      struct list_head            msgs;
>>> > > > > -    /** @msg_lock: Message lock */
>>> > > > > +    /**
>>> > > > > +     * @msg_lock: Protects @msgs and guc->suspend_pending 
>>> (indicates a
>>> > > > > +     * suspend message is in flight) of exec queues on this 
>>> scheduler.
>>> > > > > +     */
>>> > > > >      spinlock_t                msg_lock;
>>> > > > >      /** @work_process_msg: processes messages */
>>> > > > >      struct work_struct work_process_msg;
>>> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h 
>>> b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> > > > > index d27826b36649..74b711abe257 100644
>>> > > > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> > > > > @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
>>> > > > >      u16 id;
>>> > > > >      /** @suspend_wait: wait queue used to wait on pending 
>>> suspends */
>>> > > > >      wait_queue_head_t suspend_wait;
>>> > > > > -    /** @suspend_pending: a suspend of the exec_queue is 
>>> pending */
>>> > > > > +    /**
>>> > > > > +     * @suspend_pending: a suspend of the exec_queue is 
>>> pending.
>>> > > > > +     * Protected by @sched.msg_lock.
>>> > > > > +     */
>>> > > > >      bool suspend_pending;
>>> > > > >      /**
>>> > > > >       * @suspend_count: Reference count of active suspend 
>>> requests. The
>>> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> > > > > index 9036f89dff7d..c565c1d32d3a 100644
>>> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> > > > > @@ -1928,9 +1928,13 @@ static void 
>>> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>>> > > > >              set_exec_queue_suspended(q);
>>> > > > >              disable_scheduling(q, false);
>>> > > > >          }
>>> > > > > -    } else if (q->guc->suspend_pending) {
>>> > > > > -        set_exec_queue_suspended(q);
>>> > > > > -        suspend_fence_signal(q);
>>> > > > > +    } else {
>>> > > > > + xe_sched_msg_lock(&q->guc->sched);
>>> > > > > +        if (q->guc->suspend_pending) {
>>> > > > > +            set_exec_queue_suspended(q);
>>> > > > > +            suspend_fence_signal(q);
>>> > > > > +        }
>>> > > > > + xe_sched_msg_unlock(&q->guc->sched);
>>> > > > >      }
>>> > > > >  }
>>> > > > >
>>> > > > > @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct 
>>> xe_exec_queue *q)
>>> > > > >  {
>>> > > > >      trace_xe_exec_queue_kill(q);
>>> > > > >      set_exec_queue_killed(q);
>>> > > > > + xe_sched_msg_lock(&q->guc->sched);
>>> > > > >      __suspend_fence_signal(q);
>>> > > > > + xe_sched_msg_unlock(&q->guc->sched);
>>> > > > >      xe_guc_exec_queue_trigger_cleanup(q);
>>> > > > >  }
>>> > > > >
>>> > > > > @@ -2392,11 +2398,15 @@ static void 
>>> guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>>> > > > >       */
>>> > > > >      if (xe_exec_queue_is_multi_queue(q)) {
>>> > > > >          set_exec_queue_group_banned(q);
>>> > > > > + xe_sched_msg_lock(&q->guc->sched);
>>> > > > >          __suspend_fence_signal(q);
>>> > > > > + xe_sched_msg_unlock(&q->guc->sched);
>>> > > > > xe_guc_exec_queue_group_trigger_cleanup(q);
>>> > > > >      } else {
>>> > > > >          set_exec_queue_banned(q);
>>> > > > > + xe_sched_msg_lock(&q->guc->sched);
>>> > > > >          __suspend_fence_signal(q);
>>> > > > > + xe_sched_msg_unlock(&q->guc->sched);
>>> > > > > xe_guc_exec_queue_trigger_cleanup(q);
>>> > > > >      }
>>> > > > >  }
>>> > > > > @@ -2614,10 +2624,12 @@ static void 
>>> guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>>> > > > >          if (exec_queue_destroyed(q))
>>> > > > >              do_destroy = true;
>>> > > > >      }
>>> > > > > +    xe_sched_msg_lock(sched);
>>> > > > >      if (q->guc->suspend_pending) {
>>> > > > >          set_exec_queue_suspended(q);
>>> > > > >          suspend_fence_signal(q);
>>> > > > >      }
>>> > > > > +    xe_sched_msg_unlock(sched);
>>> > > > >      atomic_and(EXEC_QUEUE_STATE_WEDGED | 
>>> EXEC_QUEUE_STATE_BANNED |
>>> > > > >             EXEC_QUEUE_STATE_KILLED | 
>>> EXEC_QUEUE_STATE_DESTROYED |
>>> > > > >             EXEC_QUEUE_STATE_SUSPENDED,
>>> > > > > @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct 
>>> xe_guc *guc, struct xe_exec_queue *q,
>>> > > > >          smp_wmb();
>>> > > > >          wake_up_all(&guc->ct.wq);
>>> > > > >      } else {
>>> > > > > +        bool was_pending;
>>> > > > > +
>>> > > > >          xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>> > > > >          xe_gt_assert(guc_to_gt(guc), 
>>> exec_queue_pending_disable(q));
>>> > > > >
>>> > > > > -        if (q->guc->suspend_pending) {
>>> > > > > + xe_sched_msg_lock(&q->guc->sched);
>>> > > > > +        was_pending = q->guc->suspend_pending;
>>> > > > > +        if (was_pending) {
>>> > > > > clear_exec_queue_pending_disable(q);
>>> > > > >              suspend_fence_signal(q);
>>> > > > > -        } else {
>>> > > > > +        }
>>> > > > > + xe_sched_msg_unlock(&q->guc->sched);
>>> > > > > +
>>> > > > > +        if (!was_pending) {
>>> > > > >              if (exec_queue_banned(q)) {
>>> > > > >                  smp_wmb();
>>> > > > > wake_up_all(&guc->ct.wq);
>>> > > > > --
>>> > > > > 2.53.0
>>> > > > >
