Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA840C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8363C10E667;
	Tue, 29 Jul 2025 18:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRqbOUw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3027010E667
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753814090; x=1785350090;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kc/+w3si3uBgWF4hWyPIHQ0zvsjO8GQwFLsuim40+Y4=;
 b=jRqbOUw1L36zbapkrCKIWg20BcNu9zBiRfsaPvAhnYyqKirxPyLd3CDU
 6m52YvyvB5efVb+VR7e7gRZMbRh63Qw4RgXRzKORV3W386upW6WCfo1AE
 IAhdiuZkYDuquu63thxBCD+03upTEeuQbDVNNBO86jdMOxI77LINv1ZzS
 TTqpuUgNc4g7amZ0uOEpVOZlm+slxkICO4gpbP35RQUbyccfs7Ikqvgaa
 nFRM2WDeINmAIjddSllPl/lIm1nHGUEicPSHXBKpvpZufjacaVexoPvTY
 hR49wW/9lBJ85c65hiULfH+H/v2xksi8BDIgebixMws/lu8+iR4g0H8bj Q==;
X-CSE-ConnectionGUID: fXcWJbbxQ5eAAy8iaLr4Xw==
X-CSE-MsgGUID: dRXzzHYBR8eQUVzq4tG3rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55963553"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55963553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:34:49 -0700
X-CSE-ConnectionGUID: j9hhvcS9SHaY0CYmSziT2w==
X-CSE-MsgGUID: wCVNlnCZRcSuO9GxWVrNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193772860"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:34:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:34:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 11:34:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:34:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCT/EJ8t1UizAZdc1qwqqM7uESvyNCrPWOULrgT5TeOE7sjN5+IPPCwDfecRax4L8CD5XRYD5anUKh0Fr2kO0Rfy6ELsVysMcEIH6EptyfUcLRs69HpCRwcvuM7rDb3UoGPf+KUOSFD9GDSIhtoxMaKPNle7x2hYLSB/T1Mdi70/xHVwrwoFkQ4pL8hmm6TH/kMx7gN4iA2sTnlSmke9z0qmphwlPRRsLggArJUXvje0qFIghbDnW7eBuDRiFfsfq7lBd3TTF3dMMSdwbkhP8UTo4146HBgIODensLgfC6TAeBKYWyn9EqUD9UQbfB5CuhRewZFiXP28HKPfUlEFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSEK3rBKJQG29UdL1x8sOSBVtImrz4fWG83GeEh32tw=;
 b=TAuW6vLtlErIs553uYn8A5cqHyCtvfWRPe+lyhpSrr8JNMHUsJ/5IaJhdS4FgnWxX9DU2rcyFYhGyU5F/xsujMgnDzKuMBn9bdppDJwuGJq3R9pAqhOQU6QrYJ1aByu+H1ljhfiNXGtFxasWvZ4NvPkFea66D12hic/5KRqwJUJ4w+r+FACsivcQSBF5CXnnEgr7jB5bWcL6u6H7h0nh2vw9SHRFDvAXXAoBKwI4B7XTWuRPcd3IqPV3SThfARXMp508eNqwACCGHtGE9ODsvga+dQ6bx1U7lla6nFVIB6i1Kd7VxXnnKV4r03i2XqTAK2wQv7dK/dKtKSLDtTXy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 18:34:46 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 18:34:46 +0000
Message-ID: <63752d27-52fc-4c8e-a7ea-3609c077a70f@intel.com>
Date: Tue, 29 Jul 2025 11:34:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Add log init config abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250722013553.1266218-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1a3838-2044-4255-602b-08ddcece97b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEpSU3FyMGo4Z0RsQ3V3RlVGckNoQm9HMXRDYTF5a3lGQXhHU3k1N0grTWpC?=
 =?utf-8?B?bmRoN3NtelAvRVN4c0pOQnN6d2NoUGVrZkZEWTV6SEtQSnJiQlJxc0FqeGdZ?=
 =?utf-8?B?c01GZXZjbEpoNVYzNmxuS0UxME5YUEhTbnQxcU4vSEhCRnEyNVpCRGVISGdl?=
 =?utf-8?B?Z2tCeWRMMUM3UGN5RnZXeERvN2tudytpSUJNQW1LMlhmSHNHZXNXOXo4RWVV?=
 =?utf-8?B?a2twZjlKSFJ3WTdtbFFiOG8wT1ZqaVJDQlphUVEwbDhqZmhhQlJwUFM5VjVG?=
 =?utf-8?B?WC9vcWROanF4L0l5dGo5UmMvTlVFNmQwUGsrVGxXaXJFN0tSSVY0VXJFSkNH?=
 =?utf-8?B?bVVKTkVNdkVTK1pQZ3BnY2s2am1PMWNhMWgvQTViMmNqS3A0TUxqbDRscUU2?=
 =?utf-8?B?UmNXTDNvQUNPN0FNNk1hRHpwMWE1TXFtNHpXR0hoN2hTemIwOW1BZ2FVY1Vn?=
 =?utf-8?B?TVIvZWhpYWxQWlExSC90Q1BWblRGWXVWNzN4MlJkdmJhK2pnS0dwMjlBQmI3?=
 =?utf-8?B?dXNIS3pXZ1RncnlwQWREUDA0aXlTMEE2cnFnWjN4RHM3K1I4aEtxa09YRE9T?=
 =?utf-8?B?QmVMUmRCWHBzNXhURjZLc09TUkNWTzdLOHRWcmFDdjdjUkJuZHJDR1hJWmND?=
 =?utf-8?B?bVlZejlzeVVTRHpwdTFtMzlEVGZzc3BEZjdGalIxbVhLR3pMV0xnUEkyUXIx?=
 =?utf-8?B?Vk1lMmNnclhybWpYYW55dDQraitxcWZDaklIQWpFWGVYcnIremhhcTM5TjIw?=
 =?utf-8?B?RFA5T3Q3SW1CZVZmTndtN0M2VnJySVYrSklGUHVwdkV3WEZnOGoyWDdpSjY0?=
 =?utf-8?B?d3NKMy94ZVhqcTNTL0tUc0JWQnphVjRhQXY5ajlnb2I5cHhWU1dnd3JvbldC?=
 =?utf-8?B?ZHdqVmREVC80N1F3QnlKTTlaL0lwemM5dnA4cDlzek5QVHk3dVU1WldqZi9S?=
 =?utf-8?B?amdxMmhLRiszemlnVEVXT2NBNzB6d0ZDb24ya0lHQVRtTjQvNnB1QUEyaVB4?=
 =?utf-8?B?SXBmcmZlczBVTko2NWozcGVINDdGZ25nK2pXOTg0cE82UDZZMURzc0Y0T1Zo?=
 =?utf-8?B?WVExdHNxVWpLSnZLVTdwUmo4SmE2OU84NktBbUlrVWticU8xNTVRWXpQR3RK?=
 =?utf-8?B?bmVDNUpjMDAzbW5wUTNlWUZtM2g0NVZRUytiZmpmTG5hTmVqbUlDaE8xNkgx?=
 =?utf-8?B?Y3FncEhObE5nTlhCbG45bVVVcDMvOXNHOVpWTFdJWk1mVXZBUDFYZ3RBenRo?=
 =?utf-8?B?d2pTdVNrbHBVM2hFZDNZa3hTdFFKN01JdS9Bb1lnZDBOa21XK3ZUMDFyUWE3?=
 =?utf-8?B?N2tHMWRFa0JrZ2c3SytxSDdqWmZ2RUhka0plTUhhQ1crRTdSd0tReHVZdlk5?=
 =?utf-8?B?UzdMTXZJSFFsQmFGNHBVT2t3MDZKeVFodzBFRVk3ZFBoOUtlOGJCWWxuVlV5?=
 =?utf-8?B?ak03dlp0NzA0Yi9CQTd6dytWdTNpNjQ5cFA4dVMvOTlmMk5xeS8yeTNrcXo2?=
 =?utf-8?B?UjFWb1k0ZjNNeEIrV1FucXdmN29sQTBZWU9ESUhCTkQ1Ym0wZ2lwazc4Sytl?=
 =?utf-8?B?NkVlZTZHTndzcTJnczB6cmxIZC9OK3JXbjVPVTF0bFpHaG43NytmeGhKOEE3?=
 =?utf-8?B?QVNMWGdadXk5K0JiZlM2TjR6SU90NmIrYlBldnBlQ0FnZ2ZHSi80NmlUdDVX?=
 =?utf-8?B?YUFrdU1lb2pydjRxdWdCYnBXOUQ4ZHIyNEtvNWQ2NGtGWFhmYTJheHlJdDhs?=
 =?utf-8?B?bmRUaXUxb1gyVGR5cVdFQWxIcDFiSmhQc3FNbjk1K3ZSeDVzWDRoaGljT0dH?=
 =?utf-8?B?dEFxV1RUMUhBTGI3MEVMVUNzdjhHSFRNbld0Qk9zcThkVHNEUTNDYzRacURM?=
 =?utf-8?B?VjJWbERmREgwbm1DMVZwbkcrbm9WV1E0Z1dtUCtIY0liVjllbVNkMXo0ejF6?=
 =?utf-8?Q?iMRWL5CWF40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXZoZnR3YWVMUDI3SzNNR3I4ZERKdUZlSTY0eWRKTHViRFNMRUdOKzY3NFY5?=
 =?utf-8?B?dzFSM1pIajFKUVRteEtsRVZxVFAreWg1S2orSGpEelFkOFZuMDZ5OTVvT2hF?=
 =?utf-8?B?MzJXcG5FU1QrTmZVelNZVDhoTE5HaU52RTBtREl5WkRPZlg2c1hybEN5ZmZv?=
 =?utf-8?B?NmM4OXQ3aWx5TjBuTTQ3d2hheUxmaENqRjhYY2oybWdzaXVzcHd2bFhUVHYv?=
 =?utf-8?B?cVdsMVNMMzVvL09tdHdENnNscksxTEQ1YmxvZ2ZSdHpYNzBvWU5FU3haa3NW?=
 =?utf-8?B?Y3pZcHJWQmZ6cEc1bWcvamhHa0dIWHFuYzFLQ1FFQ1lTTGtuUVc0M3BCOVE0?=
 =?utf-8?B?Q3RnczgydldNV3JOUjc0YU9Sc2NBVlF2dVdFNHgxMHZWWmJhc2NhNmhrUUl3?=
 =?utf-8?B?bVFDcEthd3hqSXZGVmZiTkdId21SUDhkc3dXTjNrMWFIWlJvbHRINmI3ZC9w?=
 =?utf-8?B?SnhrcFdaSnRyOU5WVyt6RHBZS1B4YXRweE81SkFRZGY3WUg5RmFmcEhqbzBL?=
 =?utf-8?B?dTdQNVdZUU9Ra2NOSzhWSENVNGl2TUFMVEcwNjVRU1hTWW1ybEtBQ1BmVnhX?=
 =?utf-8?B?eENnVXNCaUZVVjY1STFDcWptcGlIY2VtQW9IN2ZGWWpBZkNnajlKaWdnbmZ3?=
 =?utf-8?B?QnI5UFQxMUN5YlhZNXA0bW14UnJZVG8zS0xGaHY3RTlTTEZjUk0rNjNOMVpC?=
 =?utf-8?B?M0JYNm5PSUxJNDBOcytoWC8wL3J3NVY5ajRoVUprOWVLNS9iZjZSQml6aGp6?=
 =?utf-8?B?U0hsa3pBZWQ0UWZpS0h1c0hBOUExT3g1QWFpVkpZYW9rbzZJMU1COGQ5K2U5?=
 =?utf-8?B?SHRzd05uQVNvaGd4cUpyaTlKYmN2aGhtVWJISGExWkdwdVpiVGp6ZnB3R3R5?=
 =?utf-8?B?Qk1ld2d0WFE1L2p0b3hWYlhqL0NMQjdtQjhXRzZjUHQySG0wVzE1VFNVVEds?=
 =?utf-8?B?K3BkYi90Q0NXSUxjUkt4MjNEclNsZEJwcmhDVG1peEovdTRCWXZIOVZsbnpu?=
 =?utf-8?B?azhnZGJBRFFGQjdCVE1RdVplSWhrSFdJM056SGJ1b2ViZUVYTzg2eTZTNW9s?=
 =?utf-8?B?b3F0aUFISjl5VEZBNXZnaEg4N3h3VE40VUhmMGhvSm5xWkNJdzFaWVNwRUpj?=
 =?utf-8?B?M0NQdHRYdmEvdVhiblNSM1diWGhRMTQ4aDRKTkFMS2drbTRHU24yLzU1eVQ5?=
 =?utf-8?B?cWI1c3dXSTJSMzBDNzQ3ekl1dUc4SjA4KzJpaEpXRU00OENyQjZYbVAvbDZZ?=
 =?utf-8?B?NWtzbjBMODFOUXhFbmhpdC96eUIrenNGTXU2SXZhdkdQY2RxTit5QmkxVnkw?=
 =?utf-8?B?Z1pzdExTcmthNjRKSjh4TE00bkY4U3RLYTNBUXFCSnZpTDhVU0M5eHc4T2d1?=
 =?utf-8?B?L2pTODhRRjhhUzN5Rzh6NFdrYkwyYWpDL1p5cGd2VGVJcEVJeFRPS1FETVY4?=
 =?utf-8?B?NzlWMmNaMGNxUGQ0TnhRUmpTWWVEUWFRWHZlY2dsY0F0NDhQK2dNNU9Ja3pi?=
 =?utf-8?B?TDNKOVJSaUN5SDI5cVB0VVdJdUVjZmx5QWZEWUc4anJqMWVwSkI3R0ZIVGFm?=
 =?utf-8?B?NXBWdG1od3BwSDFRKzk1bXdmbnhuUTJXQkd1UUNRWk9XTjZGenNIY3ZxSEtH?=
 =?utf-8?B?aXE4ckNCRmJqSHdtY1NmUXY3T25DN3FvU3BQVG52WFFlckt2SnRYNlBmaG9N?=
 =?utf-8?B?M2oxUEh4WTJvUVg2T3dQYmJLQnhNVzBheVYzakd4eXJxY3BGdW5IWmoxNVVF?=
 =?utf-8?B?c1hBUTJ3RC9RT0NRdThsNDdmMU8vYnN3dGNnbGJhdkNUUHdqWTNPZVo1dzNn?=
 =?utf-8?B?NUQ3MG1qNWNGWmN0emZ4RkI3ejhwSS96VzNSU1F2QWU1TXNQSm10aTFjL3FH?=
 =?utf-8?B?K1hTQnYyUUlpUjVUL29jUWRob0UwN3VZeDh3MzVkbXFFeUhrREt6V0NpMjJJ?=
 =?utf-8?B?RjBWSTVyaDlTUDhraXV3Skw1OFR4TGlvK0dUOXIxSUFMdXFhMXZYR3J5VlIw?=
 =?utf-8?B?aEJKRnpMWldZdHFCc01mUi9hWksyQVhRL2NjTGZVdkQ2WnJLWW5FbzNudFRa?=
 =?utf-8?B?RVRrZTF4Z3RjNDZEa1FQeTNFTGdEbjYxRXlTaHZNSDdkakt2YXJLUHJaK1M5?=
 =?utf-8?B?eE5KVkJZS3N6K3IxalpXdDBZdG44enp6V1E5VEpKdE9ZRzc1OTJvT0ladUkz?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1a3838-2044-4255-602b-08ddcece97b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 18:34:46.1815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kq6cp4er4T4uEp4wQenD5ROSkisFwXmGRZxpwhqZlyUWsiC0VuF47Txj3Jkr2NjbzUB5Ujjrr9sNAWMxfQ0y3cDJ2lInA+qZ6OHcsewbnMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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

On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
> Add GuC log init config (LIC) ABI definitions.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_lic_abi.h | 107 +++++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
> new file mode 100644
> index 000000000000..a4e27da304cd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LIC_ABI_H_
> +#define _ABI_GUC_LIC_ABI_H_
> +
> +#include <linux/types.h>
> +
> +/** enum guc_lic_type - Log Init Config TLV IDs. */
We use KLV in the Xe driver not TLV.

> +enum guc_lic_type {
> +	/**
> +	 * @GUC_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
> +	 * is a 32 bit number represented by guc_sw_version.
> +	 */
> +	GUC_LIC_TYPE_GUC_SW_VERSION = 0x1,
> +	/**
> +	 * @GUC_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
> +	 * bit.
> +	 */
> +	GUC_LIC_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * @GUC_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
> +	 * frequency. Value is a 32 bit number representing frequency in
> +	 * kHz. This timestamp is utilized in log entries, timer and
> +	 * for engine utilization tracking.
> +	 */
> +	GUC_LIC_TYPE_TSC_FREQUENCY = 0x3,
> +	/**
> +	 * @GUC_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
> +	 * representing graphics, media and display HW architecture IDs.
> +	 */
> +	GUC_LIC_TYPE_GMD_ID = 0x4,
> +	/**
> +	 * @GUC_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
> +	 * Value is 32 bits.
> +	 */
> +	GUC_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
> +};
> +
> +/**
> + * struct guc_sw_version - This structure describes the full version of a
> + * software component.
> + */
> +struct guc_sw_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
> +#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
> +#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
> +#define GUC_SW_VERSION_BRANCH_ID		GENMASK(31, 24)
> +} __packed;
Is there any point in having this defined as a structure? Elsewhere we 
just have a u32 in the parent structure and the bitmask definitions for 
access. Given that this doesn't even have a parent structure, it is just 
the data field of a KLV, it makes even less sense to have a structure 
defined for it.

> +
> +/**
> + * struct guc_lic_format_version - Log Init Config Structure Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lic_format_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*
> +	 *  Log-Init-Config structure minor version. Must be
> +	 * GUC_LIC_FORMAT_VERSION_MASK_MINOR
> +	 */
> +#define GUC_LIC_FORMAT_VERSION_MASK_MINOR		GENMASK(15, 0)
> +	/*
> +	 *  Log-Init-Config structure major version. Must be
> +	 * GUC_LIC_FORMAT_VERSION_MASK_MAJOR
> +	 */
> +#define GUC_LIC_FORMAT_VERSION_MASK_MAJOR		GENMASK(31, 16)
> +} __packed;
Again, why bother with a structure containing a single dword. Just use a 
u32 in the parent structure.

> +
> +/**
> + * struct guc_lic - GuC lic (Log-Init-Config) structure.
> + * This is populated by the GUC at log init time and is located in the log
> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
> + * buffer states plus this structure must not exceed 4KB
The last sentence is an instruction for the GuC firmware implementation 
people. And the 'as per ...' is a reference to another section in the 
spec that you do not have access to in this header file. I would just 
stop with 'is located in the log buffer memory allocation'.

John.

> + */
> +struct guc_lic {
> +	/**
> +	 * @magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: magic = GUC_LIC_MAGIC.
> +	 * Used to verify the information in this structure is valid.
> +	 */
> +	u32 magic;
> +#define GUC_LIC_MAGIC			0x8086900D
> +
> +	/**
> +	 * @version: The version of the this structure. Represented by
> +	 * guc_lic_format_version
> +	 */
> +	struct guc_lic_format_version version;
> +#define GUC_LIC_FORMAT_VERSION_MAJOR	1u
> +#define GUC_LIC_FORMAT_VERSION_MINOR	0u
> +
> +	/** @dw_size: Number of Dws the `data` array contains. */
> +	u32 dw_size;
> +	/**
> +	 * @data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic with keys represented by guc_lic_type
> +	 */
> +	u32 data[] __counted_by(dw_size);
> +} __packed;
> +
> +#endif

