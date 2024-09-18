Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAF9CDD54F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 17:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C66310E28B;
	Wed, 18 Sep 2024 17:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCdWArFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961010E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726680260; x=1758216260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fBxDCy5cbTdFU1WX2ht2m/tZjJpx6ojYFxyuZg6Bc6E=;
 b=MCdWArFn0Ky7WCPJKidKHbgjg4j9R3KN4GYiU/+IGtXOS+RQfHhLzOjf
 mP37CVrlbYzRI5fCbPCPuQuL1BcS1inE3q2o5y7XFWSF0+97etb9P4jST
 /WveG7JtNEfd/ks1JRmmsxcQgE1GUH81Zi9QpKfzANlXNY/JDaHXYA1Ea
 WJBHCnTWWU6qJB4jmYOOoQxqPZY8M2js40LcoCNlwA26pRJ6bT3fC6pEs
 H3MzKZ20e4LeWbhIrzfe9LKSaAIQ6LbCkuoS4NCVRR7Gbsewk7/WDSJ0S
 bHaIuRMxvvZbsE+IteDk9L3Eb7T4BBHRJT/S79yOBYSZklsV3xz4/Xd4X w==;
X-CSE-ConnectionGUID: mZ7K0oYsRsGruLpnPFmhtg==
X-CSE-MsgGUID: 2bLKNxFzTgqkufqEx8rBvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25756171"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25756171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 10:24:20 -0700
X-CSE-ConnectionGUID: nzhfOdRMSlWUpC4nknSpZg==
X-CSE-MsgGUID: dsn0oPeXTQ2b9tlT88vRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74011630"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 10:24:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 10:24:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 10:24:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 10:24:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 10:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkHZJhw0SGM3VwtWqgx9WQc4kG+QHW8CKZ3WvfQ25zITu7R0wf5Jw3Aoz0qR4eANhPRkRRCGX18Ln26WwMih3iSBHiJe6HFs/kVlkoLqKjvC3hKzPh1ky7qHitH037fLiFnwHhp3xw5PYLFfUsn4t9UjB3ySN0dG63FteTrnyfNlYRVKRhwI1VJM/cP/y8JB20xPQlkxrTUwCnUPa8q5bcrIPCKBmeqspwT5RkDOH0dYGsKcRDyhTbxZczz3b4G2bwNcUPzmJprOsCxm9VNT2y37ZoSBm2wRgAqcHZY+uQgv5ezTvwUOi8AbGWB8/NpI2jyaQ6nsDOMkOGAmdI9Png==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0B5lQzDRAIE8UnDStOE2c2rhQIgM2H0DE5FOxGAjH8=;
 b=hg+MIl6KVnBkl/zDR9Lki2kGoajZVD71SRR4jAlp/U2q4rLPdKyppx3PehVT07NSvK1aoVk9WRRT40hN/nzQkeYfPaxFy+A6yGbhQoYhAZYRV4DW/EJ0IsqRxxJqaQbFC+3h3bv//tQTAUeJ7s53QyUjTnR6N7OO8stX/X8kuCQe2EhkXywUc+bKEcbj2rSzlU7Z1BmnejESfrrcHHpFykoiyOx9YGd8SWnfoMNPaplj9UWopCqImFCPSdyacd1QFSqOcbP6+e3lqjPorBTw1TKBhsEM5rFbF8LgLeQ2dAjDtvrqTaeAleZVL80siQIdP21B5FHBHGtbxpAUW1WoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 17:24:15 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 17:24:15 +0000
Message-ID: <d1a3f23c-a0c8-4f45-a1f4-c7443314b8ba@intel.com>
Date: Wed, 18 Sep 2024 22:54:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Defer gt->mmio initialization until after
 multi-tile setup
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>, <sai.teja.pottumuttu@intel.com>
References: <20240917221615.875962-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240917221615.875962-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: c33fd3c2-8996-41ed-699b-08dcd806b7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjlnTU5KMEtyMW9NeEZHZ0xmUlZrbi9XU1VoUThWY2pDYXBXcHN4M21FNTl2?=
 =?utf-8?B?U1E3RzR3UjUvQTVqa0hobytqYVd3dlBuQ1VWYTFtM1pBQjFIbGRYU3g3dEE5?=
 =?utf-8?B?Vzd2clJka3ZjTUp1ZzFzeGxVeVhVMDhkQXFJVFV4S0o4bnJpSEgzZDJpQVlG?=
 =?utf-8?B?V2cwY3gvTytncENVNVd3SytkVkt2RDNXK3dZaG5PUW9EcDRoSHNoZUJUbFhk?=
 =?utf-8?B?bEFTZ0F5SER0NlhwUk1tb3I5ejFUaHlrNEJlVkczaTcxR25VUmJ4YVlneFdZ?=
 =?utf-8?B?clB2aG91aVZTN1gzMXBxbzdUSmRHc2lOTHFhRjlnNXdBSHY2V0dRUlNIcTcy?=
 =?utf-8?B?QXV2bDc0dktoYnhPRlNSR2VxelYyM2VWaEd5WGtleENVdkF1UTEzaTA2OVB6?=
 =?utf-8?B?SkhpTTlPejZCOHZxYytib1J4MkNxZkVJbTFkUmNGQzFWdWJxcXl2V21aY1VL?=
 =?utf-8?B?RTVpS25OMjM1NlVkeFZEdC9WSkM5YmpESThCOW82VnRwOGt2SHBoU252QTVp?=
 =?utf-8?B?TnprVUpRczJsMHBwWTd4Ump2Vk9FMG53bmdtdDVzRU5FaFpOcWgvZWZYQlRF?=
 =?utf-8?B?MWx2Z3lkR1NndndYWlUyMnVRZUhGM28rRXdVeEsyY3A3dFpsd3hHaTZMR1BY?=
 =?utf-8?B?UUpMa3lzMDR5SWpFRE5nanl5aEZUS3paaVZ3b2ovMXRCbXVPSmQ4QTVpeFdI?=
 =?utf-8?B?MXdtbU9vaHVwOFJRdzJzaUJkaU95SU80OEpiKzRFNi9hUnhUaXplTUNjSytL?=
 =?utf-8?B?Sk1sV1U2cGNtbHRjd3ZPOXd6azJiSTlYMmx0ZldnSSt3c2oxOW1xUDFRMTh6?=
 =?utf-8?B?RjRyczR0amZncm5OK1NRSmNlYVNFVjdia3VPOGlaQVlIRmZIanFCd3FkVDBr?=
 =?utf-8?B?VzBwUXpoQ2NKYnZlWnRzM0h2amhGQk1kUTBGMVpVMGhoZk0xQnBGckwvS21P?=
 =?utf-8?B?bk9qWDBjU3dESXJrWkU1ZzVxSXZkZWJkalpkWmE5R2tOUDVqY0NBeE41OUFt?=
 =?utf-8?B?NldvUGNYbThhV0UyWUxDc2xYSHFKS0FFblN0a2lhdjdTTXVBV1U1UWlQeDFI?=
 =?utf-8?B?SHF6WUpkWXpIZjVYanUrYXIyc3docTF5MkZTY0RUU2FSaE9SQVFCRGFKb3I0?=
 =?utf-8?B?Z2E0UitBcnpVOFRRaWJsYlVFT1R3ak9KTzQyY0RBQm5yVURZcU5YQ0JPejZR?=
 =?utf-8?B?MXBGZFU0cjUybHhJZ05Jd014ZHAzVmdjVHRZWHo5R1VGYW50bnVML05vK2pq?=
 =?utf-8?B?Vi9GYnE0eTgrTmZ6MEpBV1E1dkpvMG9LYklWU1p0M0VvdWpXQ2NKaEhZTzV5?=
 =?utf-8?B?azhTcVBUcjFNQkRiQVI2ZHhrbUtCNjZvd2tZRXVXczVXdlpVTFhXS2Y1VmRN?=
 =?utf-8?B?WHN1OGpDb2NXVUxWQXR4aHQxQ1NOMCtjTk4xOHRpMzB6c2M5VlQyWGdBaWlI?=
 =?utf-8?B?TTVzYmxHZCtMdmpvc0IrQjR0UWduMlI0cUtzT2tqYlM5MHczaGJzNXF2R0Z4?=
 =?utf-8?B?VEc4MUNES0E1UFN6WjBRZ1doY1dGbTJCSm11RUptY0VuYVhPMVZkeTBkaUU4?=
 =?utf-8?B?UmhoRjc1WVdibVV4MzU0MFA3bUF5S1YzcmF2NVQ3RzlPVFE0OFVHUVRrbVZH?=
 =?utf-8?B?eE1IN2t0bmlDd1l6MFMwUmR0bHFGQS9GdE9ncnBkNnFVZVFOSGY3TkFHQlU2?=
 =?utf-8?B?aWNzUmdMOUhSUlA2UEs0bFJYNXdCV0JVTExHTitDWHpGRVZiOTNFZVYvS24x?=
 =?utf-8?B?RGpPSkZ4T0FSQm4zT3JNaWs1bm42RGVPNWFQOTg2S1daRHhWOTcvWnJFZElY?=
 =?utf-8?B?aFhsSU9sK05TYlJtTEFNdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ukhna1lPL1RVOSs3M29PdE92NFZGcG5yUlRITXNnL1pNRFBTUXNQS3Y1cnEw?=
 =?utf-8?B?TWN6azY3RmdsdGdzTlN0UVU2VE95a09TL2c0WDR4WkoweFBFeVZhYlgvSHRx?=
 =?utf-8?B?WUZFT1NueHFkcHBIT1NPS0RZRmtjSjQzQXFOT2thaEhGSThuQjFIRFIwWVgx?=
 =?utf-8?B?VkN5cVRqb3hqVXkrTjJRSno5Zko2bWpTR3pVK1NEUkI5MXNMMDBJRzZxT3dT?=
 =?utf-8?B?YURodWMxK1BxQWFBUzZ2YXM2c3VrMTRvNkE1TURZQW9YZFVRazhFWmxuQlBz?=
 =?utf-8?B?ZkovWnpqOG80eUdacDFvdEx3RTFnYU5mbzBtYTVBa0s0bEd4SERXM0RCSzlr?=
 =?utf-8?B?MUd5TXhmbVhMZWxNZXYxMkFRaVhBTDR6dWpjT3BEMzl0ZytVY3FUaGZxdDV1?=
 =?utf-8?B?Qnl2UEhTVW8xY1JxdnFta2pnbTBRWVBaN0pHMktRYURZbnZXdlVZbllHYk9v?=
 =?utf-8?B?Q3hNTE1DKzZtU253UG40NzFRcWkzZVMrUUs1WEVqbDBaQy8rTURXY0xqajBJ?=
 =?utf-8?B?azFKQ3VrN28vTHFFZUlZZXpUR09zbFY5Qmt3T2kvVGVIdXI1K1VNT3FjZDVB?=
 =?utf-8?B?TTJFVFVMUnlaVkI5RjJKU2FObUFnZjR0QXJvaTFOelo0ZjNkalBVc0FpbjJk?=
 =?utf-8?B?em5qLzBZamRWOFI4eE45VCs5T1llYmNTaUlBbFplaW41Rno0WFlxK2ZESjFm?=
 =?utf-8?B?cm0yVHhIV1BhYmsxaXQ4SHNwTThvVlJJOVhZdmdSckQ3UER3d3JBQWhsYlZj?=
 =?utf-8?B?Q0NCKzFmYVR4Y3VXV3ZGaWNJYnZGRVZWNWVTMmE5RGxqQ3E0THFmdW9BRUh5?=
 =?utf-8?B?ZHJlR3FGU0RIUjhxWnFLOTQxanNkcWN6V3J2SGczUUkwL0NsR0JwSE44U1Vs?=
 =?utf-8?B?dGF1dkJOU2JxRlQraHVmTFBHakZ3aHN4VGZPdnorZnY4eE5UdTZzZXNxLzdD?=
 =?utf-8?B?RDRtd2hxMjNNRUVxSkJZeFVsbkxFMSswWDBueU05a2xlN0lDNzg1Q0YyWUpY?=
 =?utf-8?B?d1RJSkM1UFpjOUs2OFNldXZ6M016RWxNUnU3VXhGbGJ6cllGVk1rQThkSWJG?=
 =?utf-8?B?b2VXKzZPSGZTZEdna2pSblVsZGphRHg2MWVLN3U0VkljRXpIRHlSY2doNk1G?=
 =?utf-8?B?K3JrZ2YyaWZzSjE0RzBId0x4ZzJqRWZtbThseGF2REJib1A4dlJEMFh3MVZq?=
 =?utf-8?B?UTJNaU02UVljanlrcnE1c2xQS2NXeWFENlhPZW01TjZLSDNYODdpNUJ5VVNk?=
 =?utf-8?B?RGMvM1paeElvS1pCQXlobW40cDBWVXNUYzVscjBTSDlTTStTMjdKUER2Uy9j?=
 =?utf-8?B?V2x1OXM2NlNIZzZIZWNQanJ2N0c4UUR2TnBLVTdZMVJhQzJQT1VpYmxXcXI1?=
 =?utf-8?B?c1loS0JzUm5IcC9GcTQyY2QrVWdKT2pKWGppMnlzTndrMko3L3VvUUdOMVRP?=
 =?utf-8?B?VW0veXBxRGlRdVQwRGJnNlExQjRhRUJ0RVpKNzNjNkZZTTl1Y0xBWE0vbGVJ?=
 =?utf-8?B?R3lsREh5a1YwMHVhNVJrT0V1YXVYTEZlaGtiL1NQSy8yaFVJYVF3eE43YW1N?=
 =?utf-8?B?TVZwNXcvQUgvZTBNSVJ3TnlvemNtMWFLRlJ6amg0QnFWbC9EczZsY2UyREtE?=
 =?utf-8?B?d2tuSW85MTJBSjdZSVMvU1oxOTgxbXUvSWtIU3NnSG9SYUtnWTBmVEc1cUxr?=
 =?utf-8?B?WWJHTFAvVG8vZURTVTlLTU15ZXB6QW9nSHdVUUIxMzBnTVBpcXdCbVFFNjly?=
 =?utf-8?B?RHhFdkJvL2tDTzRoVExhM0k5bzhiTW9iSnVqUzBNZlhyQURGYzlTeVFVVHZp?=
 =?utf-8?B?UHBzZHE0MjhZUjBmL012ejlRNmYwMnN0RTFPbHpqR0dQdVU0Sm9yRUhVS2U1?=
 =?utf-8?B?WHZjTnpha0JxK096T0hUbVhYTko5aVR2MXBjZzZEU3RhVW1kK0ZFL0F2RWJI?=
 =?utf-8?B?OW4rekFGbTFIbXhhWWx6dlpRbFVkdDlndWRMcnYyY3hibktXZ2lkbWpoWkpO?=
 =?utf-8?B?TTl0aHZ2cXM5MzI3WlV3WWtrU3htUXJsZjFNWDZqR3VoOGd3RU1TQUp6OXdF?=
 =?utf-8?B?b1o3SWdiSGJVemxtUEhNWjV2bzhxV242OHdXVGN5amFWdG5Hb2o1N2RYU0JU?=
 =?utf-8?B?RWRPMjZqVnFkZVZzd3ZOQ3FKQWFQUlpLZWREaVVQVWZqMzJjQzhMUUFRU0N4?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c33fd3c2-8996-41ed-699b-08dcd806b7e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:24:15.0377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WegOdfdMEJbXHoNWuELlENwpYkBjOKqByTsj/ZXqLZPHvSs3DOgiHIVEuzQ4YagR9q9W95zzFJh+yKFqjJKk7gm0/wyouhP089hjb1WSSHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
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


On 18-09-2024 03:46, Matt Roper wrote:
> With the recent xe_mmio redesign, tiles and GTs each have their own MMIO
> accessor, with the GT inheriting some of the information (such as the
> iomap pointer) from their containing tile.  Given that non-root tiles
> get initialized later than the root tile (and currently after the point
> at which GT MMIO is initialized for _all_ GTs), we wind up incorrectly
> inheriting uninitialized pointers for the initialization of GT MMIO for
> GTs that reside on non-root tiles.  This causes a driver crash on
> multi-tile PVC platforms.
>
> With the general xe_mmio redesign, it's now only necessary to do the
> GT-level MMIO setup before the point we start reading/writing GT
> registers.  Move initialization of gt->mmio out of xe_info_init (which
> runs before non-root tiles are initialized) and to the beginning of
> where we start actually accessing the GTs themselves.
>
> The high-level initialization flow now boils down to:
>   - General device init, software-only setup
>   - (no register access possible yet)
>   - Root tile initialization
>   - (access to device/tile0 registers possible via xe_root_tile_mmio())
>   - Initialization of non-root tiles
>   - (access to any tile's registers possible via tile->mmio)
>   - GT MMIO initialization, inheriting iomap from each GT's tile
>   - (access to any GT's registers possible via gt->mmio)
>
> Fixes: fa599b8c95a7 ("drm/xe: Populate GT's mmio iomap from tile during init")
> Reported-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Looks good to me,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device.c |  7 +++++++
>   drivers/gpu/drm/xe/xe_gt.c     | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h     |  1 +
>   drivers/gpu/drm/xe/xe_pci.c    | 12 ------------
>   4 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..998165962cad 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -656,6 +656,13 @@ int xe_device_probe(struct xe_device *xe)
>   		err = xe_gt_init_early(gt);
>   		if (err)
>   			return err;
> +
> +		/*
> +		 * Only after this point can GT-specific MMIO operations
> +		 * (including things like communication with the GuC)
> +		 * be performed.
> +		 */
> +		xe_gt_mmio_init(gt);
>   	}
>   
>   	for_each_tile(tile, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b32fb3fdf80d..9b0218109647 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -624,6 +624,30 @@ int xe_gt_init(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +/**
> + * xe_gt_mmio_init() - Initialize GT's MMIO access
> + * @gt: the GT object
> + *
> + * Initialize GT's MMIO accessor, which will be used to access registers inside
> + * this GT.
> + */
> +void xe_gt_mmio_init(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	gt->mmio.regs = tile->mmio.regs;
> +	gt->mmio.regs_size = tile->mmio.regs_size;
> +	gt->mmio.tile = tile;
> +
> +	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> +		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> +		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> +	}
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		gt->mmio.sriov_vf_gt = gt;
> +}
> +
>   void xe_gt_record_user_engines(struct xe_gt *gt)
>   {
>   	struct xe_hw_engine *hwe;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 97def44afa4c..05c8351d0f39 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -37,6 +37,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_hwconfig(struct xe_gt *gt);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> +void xe_gt_mmio_init(struct xe_gt *gt);
>   void xe_gt_declare_wedged(struct xe_gt *gt);
>   int xe_gt_record_default_lrcs(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5ba4ec229494..2afa05799b8d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -721,11 +721,6 @@ static int xe_info_init(struct xe_device *xe,
>   		gt->info.type = XE_GT_TYPE_MAIN;
>   		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>   		gt->info.engine_mask = graphics_desc->hw_engine_mask;
> -		gt->mmio.regs = tile->mmio.regs;
> -		gt->mmio.regs_size = tile->mmio.regs_size;
> -		gt->mmio.tile = tile;
> -		if (IS_SRIOV_VF(xe))
> -			gt->mmio.sriov_vf_gt = gt;
>   
>   		if (MEDIA_VER(xe) < 13 && media_desc)
>   			gt->info.engine_mask |= media_desc->hw_engine_mask;
> @@ -745,13 +740,6 @@ static int xe_info_init(struct xe_device *xe,
>   		gt->info.type = XE_GT_TYPE_MEDIA;
>   		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>   		gt->info.engine_mask = media_desc->hw_engine_mask;
> -		gt->mmio.regs = tile->mmio.regs;
> -		gt->mmio.regs_size = tile->mmio.regs_size;
> -		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> -		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> -		gt->mmio.tile = tile;
> -		if (IS_SRIOV_VF(xe))
> -			gt->mmio.sriov_vf_gt = gt;
>   
>   		/*
>   		 * FIXME: At the moment multi-tile and standalone media are
