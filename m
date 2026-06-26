Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47017C43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 16:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA05310E3CA;
	Fri, 26 Jun 2026 16:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHAo/EvO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026610E3CA
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782491970; x=1814027970;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JjDSvK2IH+OhE6fw0IFWZ0o+AyTARoNAyQ1K70+AGSI=;
 b=bHAo/EvO6q+xloPlgD6CmJr1NfnvoY8kI+3j7wBXd4AOOCW7vjGRIqZ0
 g2EefGrvvz3NjHbkzo9QG7JBvFHvpnwDO1QdDgYHVo7mTm2OUQ3jPkXKU
 lK8k3CCcIGoJmm4ZIpxvXnD+QYdUGEFtW7VprA/Az66lcL3u4F2xNar5G
 BshLhNYsm5DxTJ8xvPW1AfBtyoJlffFJ3VKWLlxzp9vgUxbngIrYMeGWM
 WmPEOFmOzlUOw8+VW9ZzHeGNAuXl2ADmfsUDu4Dkf4EFwO0cHYgS8FDQ6
 lFB5ZQHQLMhgFIARwP/oNzZz3qFMuxA/59baFnzq0dFUKVOqbjKpjn5lZ w==;
X-CSE-ConnectionGUID: SdXw1j3WSxKlBLumt0IJ0w==
X-CSE-MsgGUID: DZIGugLEQACDQNoaUB2EkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="106079752"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="106079752"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 09:36:46 -0700
X-CSE-ConnectionGUID: TwOtv8rZTNCFWMexLXk78Q==
X-CSE-MsgGUID: RVxG33NPRomf8RU5xGuazg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="244969224"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 09:36:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:36:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 09:36:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSWWCrn8aHx+TqgX3TJ2N5Bz8T9NhDX0TpKjq5R3EeF9TW994Yrp7+JdPpNjyBRpCeIGddEWfYZEO5HHOfAvw4mFjw2lmvOrLnN0GDBgEpzjXaFSoyc+umnxplUB6B2rOkSL+aXRKROSyVHYxtxW+dFNgGUBmhWvTd/XAa9Boceoz432PJBCd4MNjM6c5ySXDf/1tgIH/DLx++ceMktGzkYDetxhoFNTsWJ/5JeZF/Vg3AsPZMEfoLHUZvZ0B2sMwHUNjUBqJnto3KQKQtUAwDbA/tv7kb5ehJNbinwXowh5qhawwKdIyA8LZ9iUMbvWurAJfcnpXdOrOfe2DlY7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q77GAonSeEUXVnovOahH2fvaf5jarvI4HTzXU3PVniQ=;
 b=Qky1yM8U+lIU6ej5C1ip30KWcPhGM0mWiKDQazMeTCd18lQVRLktheEJppgj44l6MGD33vJXY/mWh2LcDblMT7RG03viXcswjDLxp42iDDELEmavRjRfi2JdDl4aGOw7eRhhJFYvSGMmRl0feLIzbZWaDg5aSe9LUpb1n7+bu/SkTQWWFM+v6BZVxkycAoajtsry/Ryd6t8jYodgM1hsiElwRSlPBI80G9pDAnTppojiwbhZbI2jyjm1plJCtntCFgyPQ+mIIA5+Ff4+SHfh0Ja63g12+AdyzXW7qlBL1Oo172pzYKTam5D5/I/x6+dxkRiyC4diPGrU2swaKNNytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by BL4PR11MB8824.namprd11.prod.outlook.com (2603:10b6:208:5a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 16:36:25 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 16:36:25 +0000
Message-ID: <ba327b38-3082-44f5-8f30-41a462ce1adf@intel.com>
Date: Fri, 26 Jun 2026 09:36:22 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IFVz?=
 =?UTF-8?Q?e_GuC_fw_70=2E70=2E0_for_pre-release_platforms=2E?=
To: <intel-xe@lists.freedesktop.org>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
 <178184697743.95114.14190693574122170221@6beec6c84f66>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <178184697743.95114.14190693574122170221@6beec6c84f66>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:303:6a::27) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|BL4PR11MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: ea897cef-6def-427a-13e4-08ded3a1105a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: MPraa3pAE+g5kqEbZjfVd5fXWkLxwMGReP54VbRO6T6gqsph+ZrE7Fc3pFuNc2d1In3qTsNjVpNB+Iz9nt8vZ4evRZTasyKo2J4sr9OSf9xK+/U2ZmqRn56XILjaYL76rUZHlN49Kv3KyZEjDZfESxYKiFEG+UWRllvrb07BS7K4gjKq+64bpxy0w9HMDpgWgjD+VWt1loaZRtjrlz8g+OAKSvfyuCQ0J64Dxqku//eSZk6jPk+KKz7agybmuoa1G1y+kIE/WLIQa2aD5L7oQC4HEr/LksrGeMPwV/nhiPuHpmN2jMC6BZBCAA4E4QttxVscetY0J1GaBg1EzwhcWzCE3sUURFXDNNHOlsFlvMcbCcuDMci1scAnV7DI1mmNcEzPENOJNtsijGndCMsIFiBciipukxtqTlL9e8DYwnJ+DrEvSbrgnnqnusfCnCVnTv5ps4g3yYUORT0QI8wwCqB1sEu++Lgcy7lE2mDqk37olS44732RZacMI/kzCapV9DUR4aSDSG+F8LeKU+4vtMVSVqE47otjqieZved4c/i1lJrcpYH+kP1tdqla7Fph0B/pQaszTwTxlf230w+4ss+48+7FgqBvU/3jbzdQKvETyVGNkotr0vJiKC4ZVGqtJ9dsYQQE8EscS/SeXzRmsDNzywcLX65g5zK2LUYudv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFuMlJFQ0tTSFFUMGttL0tVRno0V2JheDRDMnNFbCtXY3VnZzZpWmpVemVj?=
 =?utf-8?B?MzVLV2JBZnFydUVuZFhZT2puU3Y0dk5vSEV1bGVzQlBFR1VSMTZNVTRNMEpT?=
 =?utf-8?B?UWtGcTcvQ1FQb3RaMFVrMnpLQnUyc0FaNjlZS3p5ajNhZzRVQVpXYU5kcm0z?=
 =?utf-8?B?K0pnWnBYMXpzc3JFZUNya3VHaHR4citFUXFPK1doM2RuclduNnJWTHllaW5i?=
 =?utf-8?B?N2tUNlNKMGNoNEluTWI3SHhIRndMU0NHby9CbURicHlDbjlQRjAxM1BVdUFr?=
 =?utf-8?B?WkZQZnNScStDZktmUTZIQkQraEhINGQ2SVE0RjBXYXlZd29sZ24xZ0hkVnZk?=
 =?utf-8?B?ZWtaS1RuWjdiaEcvR2FEZTV0dFRjdElzaVA0R0dLWFZ6SkQ0SWZkZDJLRVU0?=
 =?utf-8?B?WDZ0R1J2OGNIaXlTU0VxalN2K2M2VXp3T1laenBhYUZpdE1EZ3hrSmdSMXcx?=
 =?utf-8?B?bHJoYUw5eVZENm01TElxSlB5MTExbE1LWkYwS05LdHlCRnE4bjFTWXZWdUhw?=
 =?utf-8?B?OU12TFNpMXBlbjJuenNVT2krWUp4aGlQeURTTWNQckVHNERxRDZMZzZJaUFH?=
 =?utf-8?B?d3B5TGJBL0pWVkpKNFAyYjB0SVJsbGQ2RGE4L1VxUlBldDg5bzJWVEcrWTcw?=
 =?utf-8?B?ZEhpejVzSW5PRUd4dU9FUWFqd1ZLVFcrS29oeVlEUTgzbU1FazNEczU2Nkx6?=
 =?utf-8?B?S1pmejRGRk1FeHR5VXVTQTdaLzdIdkdNSm1PTitCaFpLQ3NUOVVJZW8xZlBr?=
 =?utf-8?B?OXBMUXBER3piL0lFNmhDblNYdDh1bEVXSWVVTm5HRDNNSjlBeWd3OCtGSHp2?=
 =?utf-8?B?R25jT0ZYMXY4ay9nbzU4YWxDdnhsbGRWcFJQdXpGYU1BRTJ0U05nSklIazRs?=
 =?utf-8?B?STlZYnZWZFlSakdJbDk2cWhVc21uVHFvd1ZCQ2JZdHBjbjcxbkVaYlVlb2VO?=
 =?utf-8?B?Mll5eHhyMXVnMEtsNVhvUDMxdmtQaXJudnBIdUxnTlp4UXVQMnJRZTR0VThR?=
 =?utf-8?B?eThCZ2h2bkJnc2plL0ZwMkFOSDl0eDFNdit4WlJqeEQxWWYvcXo1RlhMU010?=
 =?utf-8?B?MVVnUGJVa0VZRVhCVUxLVmpDVXgzUmJCYUVyZXFiemRiaGNoRXdpc3pjdkd4?=
 =?utf-8?B?SFNYM3plSUwxMTZyYWJQWlN4SmFzc3c2N3B0RkNWT1NnSnZZNmc0cFEvUTN5?=
 =?utf-8?B?Wm9LazB2Q1RWOFBGOFZ4aTlHSzQyaDB5SmNkNmZaVHFEN09XNXMvYzVuTTJt?=
 =?utf-8?B?Qk5kQVlDRVQ4bFhGV3NTbGlYd2JhamQxY1NWWk9nS201STRtUG1wZ2FWOEtF?=
 =?utf-8?B?NzFQbXRJNDlFcE5tZkcyTXFtT1hUek5CQlAraVh6OFowT2x2ZXkrU2xCN1NI?=
 =?utf-8?B?ZVBkMTY0SkQwVmZnSm10K3M0RGhodkxaTUQ0RHBnUCs5OFQzdzRFTEp2RDlF?=
 =?utf-8?B?Z1lqQXg2WGFTU1pEVU15d2MzU1pIR3lpTGhBT0NBbWhxWGJITDFHdGhzR1ZV?=
 =?utf-8?B?WEV5aGJvYmlWWFh3Lys5UHBGNnMzblJnbjIycTlWYVpBM0RETzFDSmR6ZkhT?=
 =?utf-8?B?WHBUeEtwOFhBWUh1d3VWV01BS0NLWC9xaUFwZU5aRWtZZzdGRys1czgxcThN?=
 =?utf-8?B?WDlQaXhRL1pmcjgrYitiM2ZPUnI3TjM2U1FXSjh6b3hURzVHbmJVMGRjdmxv?=
 =?utf-8?B?VkdGRkRueU5UWW14WHkvRmJoZFVNbGdEOEZPZmFQSGpyTTgyd2pXdFVBZGJN?=
 =?utf-8?B?WTRoV1JSREJTSDE0TEYwR3YyeTBhaEduVWxGcDBnK2J6bHdBeU8rcCtUNVQ0?=
 =?utf-8?B?NkV2NDBYb2Q1UmdJc1JxOHdYNTM5bXB0UVZFc1N3ZU1HTC9pS1h4Q0h6NnlQ?=
 =?utf-8?B?Z0UwUEg0bGk0VWtrUktsMDd3RnZBck5sRlRUOVRGdHhsQjlYV29qNHJzdnhT?=
 =?utf-8?B?Z3BzL091RnlBcnZ5UmZRN3ZiRWZZbWloOU5xUnNVZW56SWZBdHQxRFRuK0ZD?=
 =?utf-8?B?ZWtSYjRqNkNKVzhLdVJaMmtkRkRPa2NjUG1jNnd6TStVMzdDVi8vUTJoYTJ2?=
 =?utf-8?B?Nlg2aGxRZUhmTUxQd3dzUWR3Qm5Uck1CT1pjblN3UEk2N0VoYVJkdnpEUGgr?=
 =?utf-8?B?UmJad29JNkc4SlhsR3MwSERMQ054RjlsUzl2Szh5dmxxVnFxZVRjVlpMSzdV?=
 =?utf-8?B?VDR2REVCTmNwK2QwZnh1K1FFcWNKcVlEc212T3k3RHdWQktpUGxwcGNaWkh5?=
 =?utf-8?B?RVBwTmZLa1R4N3g5RmgxSml4cFRBMFhlQjRod2tnM3dhS1ZtelhyRG5Saks4?=
 =?utf-8?B?NUFJbU1FQkFUS3NKaHlGdEs0OUZNanZueEc0NEErNTF1M2ZEamhaWkR5eFpj?=
 =?utf-8?Q?MrU4S0x5gLuDj/WI=3D?=
X-Exchange-RoutingPolicyChecked: mtR0y9AGKuzeRHxNmEWqTQr/IYsWHaQGbLz6quUrVz6HOMPOJPs1Oh4hbFouU+Crw4BoE93Wj4ys429mCO34A5c3EGOte/l5OjjdYWMnqHC3pb3PfBOuhH0Taz/Nqy/YrFSDB9DZD7xT5kSChdS9f48houuy2RZ4oSlX+rgKKsdmGBf6ItCpjtZzE/6RArwaFU7KcGS9BfcwjwwT10LE2kU4hbp/I8vAb/SDtWmQU19F+HzzvVMaAWKk4+/niL/LwswmJtdTWULxVcWFian2QfvEQ0ZnQMOm7PwD1IzN3isOLDo6SLf5mKpj1qsPBny87gnP1oYyzMAJ7tsmBV97xA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea897cef-6def-427a-13e4-08ded3a1105a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:36:25.3473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7dl99ODVHEcuNAkxWHJwjnbIwo+X1Gprcc1YHd4p1ZT25j8EuseIiu56UtMPQsIbztYOW899Iv8FeJLLCbMRP0N0dc9gt0n9/l27K8DkJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8824
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

Failure unrelated to patch.

On 6/18/2026 10:29 PM, Patchwork wrote:
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
>     - shard-lnl:          NOTRUN -> [SKIP][1] +8 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168820v1/shard-lnl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][2] +8 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168820v1/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
