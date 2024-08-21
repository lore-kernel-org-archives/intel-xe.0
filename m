Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB96FC52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 06:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AA610E582;
	Wed, 21 Aug 2024 06:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnneKLiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7437C10E582
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724221357; x=1755757357;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2r4OXwqHe/jivZ0v+08rqx++sQTx5/2lH3hLKeKjJGY=;
 b=AnneKLiIE+B4QPdpfG7KT2WKmw2chSkcb7A1bgSaML6+/OloVyBzlsds
 bJTYCs8Qx93mfovDUia78jhMHjiO73ZQqHL/+8na6TnZHjaVCdudHvLGj
 K9vJBSNMa7Y89B/tSGkVmD289Uij8HYbzHwYLYeGV+jJnl3xcSoB7WX66
 h1KAGm+ciEkRxQ0xOH2hqihhWCvjkye/zk89vuXqhufGFlF/8WO2dWOhl
 /xzMXcG7m+8I+BMpqlhE2fmfeIGKkPs+gYMtdgD7Kn0eyfU8REsdvY3Ko
 d1HhuSn5fx9FtIO1BUUjsBd6FuimXYji/uSMZp9npMERRbpn7PtRQ0m/d Q==;
X-CSE-ConnectionGUID: 0tckCCNiSk2U7R3dqcvz6A==
X-CSE-MsgGUID: LzXU4+mVR62w8Hq9s04yyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33222488"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33222488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 23:22:36 -0700
X-CSE-ConnectionGUID: 7z2acBPzQyWQ6jNn/XhN1A==
X-CSE-MsgGUID: p+6qfmsuTdyp5sQxb+jBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65189025"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 23:22:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 23:22:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 23:22:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 23:22:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 23:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INH3DCWdQjMnJcI8CoEkaZ3k0b+X5ut8/BUkdB811UaQP5RkfHK3zyd06/S8pQGnMUprW7jFqz3siYhRaZWSLQhq4keKZO2EMxo9pvJ+lC/Se7KwpsrfhKKSx4UoNKbm6FYQEpvfebfFRaBz+6ceT8zolq6MQK2xkLzlqKmrMHV8YOp1fT1gH1Mb2tCVyi/2XCoz8yl2iwl3EAxi3yIN6xxJrtowbI+9lPAbr7gaVk8NHBoW1aMRRkFYvsi5K5jF45qNb+lKsuH+3n3x2/sQAz/vj3xz/a8W9Ys4Cu+opNuwOtBHzaf+Pb1FK3974rxXNY/RUk4jFxy/RF2ehxVRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxR414VM50lnjAeHnzqqDSoZREOgzAkoL2qpiW/q2JU=;
 b=wTG3E3Xex91t/9NrB9K/vAzUQj4O8fDAKGcPD9lXp7I2uAys9rK7eaEXDrVQ0lim6kDrp/Azvt7Rk2AeDUL44TZELKoxHHFGvrai1F6i8FgfJBLw2o5bCnz0TaaR335TpX/LNkY5p5APQ5csuo4MilR3FaXCZkCneJMaNj+TiYM4K2c2pJC9ZHZVxU4I40xGQxgSSo2B8ICHRPcCQYPK3QTRW4wbnY3eMSrP+9XZeBnO/7HPb7OTIDZVuCXEueS6BdAOc372mZrEyo8uc1l3GbkAz86DE+23ErHDyYO7doj2nmgC48PuX6NtFzy3PUCeLrD+4de5Nhz6ctKm/HpqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 21 Aug
 2024 06:22:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 06:22:32 +0000
Message-ID: <2279a661-6dab-44e6-beac-55ab47e1e5c4@intel.com>
Date: Wed, 21 Aug 2024 11:52:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Free job before xe_exec_queue_put
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240820202309.1260755-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240820202309.1260755-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b3968f-1ff3-4abb-cbd0-08dcc1a9a3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHNRdVRoazRCWDg3aXNrVlFXTEN4aVlNdFJzVFArOWN3dkNYelcyeHFCd201?=
 =?utf-8?B?N0UvSXZOT2JlS3JGVWdGeTRYOHpEaVduVE1weFhsNXBsYTJaNnZ2ZDNzZHJF?=
 =?utf-8?B?aVRxTzEwb05YcFFmOVgxUEw2VzArajhlRFFMVWYvTExFclBuaUlncWl6SGtD?=
 =?utf-8?B?OWpYbERITldHS1M3djZIcWxtWEY1TDZ1bUw0Sk9ZMmhnQjZNMDhWVWxzRGk2?=
 =?utf-8?B?SFUwaWJ1eVZOZ1ZzOGdBSHU3R3hmdTJ3bTdPUmc0TVhHUGorT1BuR1NZazVo?=
 =?utf-8?B?ZFJVV2ZyZmo2d1JQUVZ5Ky9GSnRHWStrd3NtY3doUE94OWpvMmNiUnZkMXRB?=
 =?utf-8?B?Y3FvdzJRWVFOL3hMTis4dEtQNU9iWVpnZGlOcm8xNWI0VlRUS2NPR0IyZ1hu?=
 =?utf-8?B?ejVSazkxeWYyc3hOWkNLY1BEVHpjQm9xdmpsWjZPRVptK3E0a0g1L0ZlNy9J?=
 =?utf-8?B?eWpFZHNGMFdzb2RCRGlVMGNMWmRMbjBIem5qc1hXdkg5c1R1dWlsUFdwdzYw?=
 =?utf-8?B?UDgvZzdTZVNFLzM2WkY5SG5QbU16Snk0UEh1S1ZVNXNNZEVXU1piYkp3MTFZ?=
 =?utf-8?B?Z0twL014TlpKajRselFoL3ExU3o2QXlkcDZIM3BxNXdYSDVKMXFoUUdsWTVL?=
 =?utf-8?B?Y2pZQVQ4RWlHR1VpQktHejNxWEVUVE01RDRmYXBKbmRvdHFVTUZqREIyQ2l0?=
 =?utf-8?B?eUtEY0RnY0JqdlZ0R3hUVk9qeW4vemFEUW1DQlNoNEc2Q0VES0xxcndWM0kz?=
 =?utf-8?B?Vi9HMTh2MjlOd3VZRUhPRk1vQ3MvWCtQcUMweUl4OXZpV2NRZzFzdHl5WVNQ?=
 =?utf-8?B?WHFveVo5VnNEWWhJTzBLcnkrZU1VODBBMHdPdTFsUHErYWRGRElXV3M4TEVh?=
 =?utf-8?B?Q3l4YXVnS3lUTFpkZExtUW5iOUFLTWpKZHUxNERHVTN0bGJNRmZhTmlvaFBq?=
 =?utf-8?B?N1Nwc1ljUDAwZmlIRjN3SHkrTGFCaWxWZjROS2J4V1NCdmVNMklvYVg4dWNq?=
 =?utf-8?B?NVFtTFE5TVpQRXM1VWRCRXNrRmZ4MHlvLys3c0Rwc0s3N01sZmNnSW1wbGZ0?=
 =?utf-8?B?T0c4dzcwNnE1TTBLN05pRTdYUG9rVzBxbWhsT0w5T0V2SWJURmgwSmNTUWEz?=
 =?utf-8?B?aFhCMkFVbjVlVHljSXU3UUlxeVNRbXNIa21aOEk3SnRSVUdFbVl1S09DU3E5?=
 =?utf-8?B?RUE0RlJUT3IvbnMzcXlGenM3Um1XWU0xZEl4aHk0RVgybGtWS3QrUFN4dEhs?=
 =?utf-8?B?SW9vSVdROXpHTHdWemJ3ZVBaMFhlNlB2SklvenV3ZGpLZkFXMEx4cXEwbHE3?=
 =?utf-8?B?dWI1V3YyR1RrZEhPb3ZaT2MxSmp2SS9ycllIQThPTUNhQmxYeVhjMWVVN1d2?=
 =?utf-8?B?bC9FSjgvUWhBWmdDQk5mbm9PYm5naXBwZElSNXVQZU1DRnEyRXFpZ2J6SFNK?=
 =?utf-8?B?aGg4NkZrTm4yNmY4RzRtc3psdUlXTDZ5Z2IvRVJHejVuYjJNTjlLQUJVdEpp?=
 =?utf-8?B?Q3BPU09WOVg2VlJGRzhRazUxaFN4QUU5UFVQU2VCNXowTE9lS2lwQW5pQ0Mx?=
 =?utf-8?B?UjFuazI2dlczQlp3WDVncVQwNjUwTHplWDc1dkl3MTNhM2JwU3lhNGhFL092?=
 =?utf-8?B?QThoZ241YzBnbHBHcy93cGp3eHg4TUZFcXpBbW4vMEZNbzJKY096dGhocGdM?=
 =?utf-8?B?b0s2L3BnWFNJSjNRK0F5L2phRnNZdlhYS05qUjlJWGxuYnA1bDVJbHN2c0gy?=
 =?utf-8?B?c2ZQTWdxU3RZZ1FDSmxEb0hJTlhqbzgxNm9ndXNVN0p2MjFlWlhHdmFadVNU?=
 =?utf-8?B?Z2VDYnJid3Z5dmFXK1lFUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXRERTJtNW5kKzVZTEtZa1JlcDJubG5DMjBFVDhYQlFEekptYm5idDA0Y25I?=
 =?utf-8?B?N05wMUpscjNONUNyN0dXNVBLL1g2TmVmallZTk16OGFrSUNTMnB5cmtyYkVO?=
 =?utf-8?B?ZGcyYkp4b0RyNVkwRk40ZjJHWmRkY2JwVzJYSStHUStxRUpxbUpzRWV3bUo5?=
 =?utf-8?B?TE1BOWIzUkIxVU42QkdmbzRMV3lmdVdUQ0t6S0ROL2QwQllBVFdzMkRIR1k4?=
 =?utf-8?B?WXRkNU1QbVQ4MCtkc3VZZ3FYTkhEWWRqYWZjRXQrRlVZT01RZzlWZG4rRXRM?=
 =?utf-8?B?bVVQSzFLcklybGJBTmo3ZENoRXN2TmtKYVlLaC8rZzh3SVQ2Zm9qejYxMzcz?=
 =?utf-8?B?MkQ1Q3Jja29TanlKTTd6OVRaUGMycjc1TkdueHdReVVzVEh3YkpiaEQ2dVVN?=
 =?utf-8?B?NTBCVC9iL0M3MkFwNXZmaDgybDMxcm54OEtoZEh5dGZyK3BzaXQveTBpaHVI?=
 =?utf-8?B?T0NIMlViUWRSWE1Od3pMNWpsdWU1cHZtSHBPZFZPejhVbXdjUHRkb0hHSkRx?=
 =?utf-8?B?ay9MQzhDYVdmUmp2aXd0S3NBYitDQXE5c2wyTzVsdnAxQXE3Q2ZCbmM2NGxo?=
 =?utf-8?B?VHJLVEpvQjhBb0dOY0d6ZjVSUVo0LzdIeXZldjduRTdvMTNheit4NDBSVkJV?=
 =?utf-8?B?d3l2RDE5LzZpdFZMb1UzRGU0RVJ4alRVSWhIVGpqMnhXT2xENnRqV2R5Rmpu?=
 =?utf-8?B?S0FKRG00SDNJb3BJWDRNaGhZOCttaEVOMFE4U3E1TjVtNVgwbzJQRTdCVHht?=
 =?utf-8?B?Umt4dU1tbUR2aXB0dTJ6NGE0NC9Vc0NXSk1ocENuYmw3ZmN1L0NNQU1nL0Fs?=
 =?utf-8?B?cW5NaytOZjJqYmFLUjJzSHBCVi9WYjVuNTNBZWpUOWgwTXZNQm9TR2l5d1JW?=
 =?utf-8?B?MHJRbEZRSTBheXJaS2ZST2xLMDZXNkRQRllsVzU4clorY3ZEdjNyc094YlV4?=
 =?utf-8?B?aENqclZNc3hjS0VHL0d0c0ovdHRrWHJQWldEUFFvcENHV1pWcXAyZld6cyt0?=
 =?utf-8?B?eEFORkNUVXQ2YzBRaGo2czRnbEJDSUdZY3NRWHp1ZDJmWFh2YUxrL20zeUN1?=
 =?utf-8?B?em9qVmVwRUZOeWFmaFRrK1hsRHkvVzZ0OHBrcFRKdUdXMG9QekV0OG1jMVFM?=
 =?utf-8?B?a2Z1T2IyN2dtS1p3MVNRcUkvclRKdzVUT2JyZ2ZKSDhuTEdta1VqeXRIRCtO?=
 =?utf-8?B?aGMvTk9LRUdtVnRIZEduVitORnphTTlVTWJTektjMy9kcjg4YkpqeEFVRVc5?=
 =?utf-8?B?VUdRYXIzcnhib2pLSmxJZEJWYmFtY2tETzg3UVpnWXh5N2wxWkJOYzJRb2x2?=
 =?utf-8?B?L05mZW5xZVQ5dkJRRGdRaTZGZ3l2REtoT0hGWGxTYzd0ZVZ4aG1GMURyOENl?=
 =?utf-8?B?MXJHNk5SRE42RUJ0eG9pYVBQazBpNE9rdDVuVG1VaUJ3YkE3QUNUNTl0UU1a?=
 =?utf-8?B?SGV5cXF2STh3eVZiKy9WSFN1WGpiSjlZQXRWVHRiNmV5cEJvQlNXemdCQzlQ?=
 =?utf-8?B?aEVVdWdQMDZoNEtlK3RWem9qK1Fib0tvL0tvZFcxTEFlT0tnQjIzaXhHclp5?=
 =?utf-8?B?d2d1TWNKN0paazYzRGYzQVJqbysvNFdrRWRvV2lZcXUyczROYWx2V2p4a1Jz?=
 =?utf-8?B?NklQWm81ZXh1YjNYWnZObWpHWDNlTEpZaXVnS3RuV3RBdEJTVDY5MjZyRVd5?=
 =?utf-8?B?R0ZjRlZvd2d3L1VPSTVyRFNzK0xYemt5MGh2L1d5YXIzRGs5WmEyU3g5TVRU?=
 =?utf-8?B?NW1DSzVkZzgwdC9vaHZjc0ZYazBtYStiSEo2NW1rcWtieHJtY2Z6Vk1UWVNm?=
 =?utf-8?B?b1R2ZjBNRWkwNitRMk1LQVpxUVdsUGxKSnlzbGN6OTg4UXJpRUxqU0VvNFA5?=
 =?utf-8?B?NENxbEdYbVVvSnNxWm1nMTBTWG5FY2laOG9nVUQ4Q2VxcU9pbEIydWlMOHlK?=
 =?utf-8?B?T3k3SEhtVWhXVzVzR3Z6ZThiZmpCM1YxWTJ0SytTem54Y1llWFR6OHZsRytj?=
 =?utf-8?B?MklQbWZtT3ErL09TV0Z1dmRHTEV3Y2N2THNqQ3FzRzJORnN4N2VqVzRsaU1t?=
 =?utf-8?B?WGh0ZWthWENYOGNEVGU2N0ZFbHhwVWM4SnJMRXlRQy9zSm9xdGpxVkJrSVBV?=
 =?utf-8?B?TmM4MDBhNmJBQWszQmU2N0ZsNHN1TFN2Ynh3aHlQbkxwRjlGNjAyUmVTYjFP?=
 =?utf-8?Q?tCc1t8Qahc9KaTx5XbQu/HY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b3968f-1ff3-4abb-cbd0-08dcc1a9a3e7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 06:22:32.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmD9LUWhn7IPYWXJdE/2kMiUhu9wldso30Ea8wJVCfCbHbv90sIODVkead59bPF1KHKjNq9T2eS3+sBmt/nGovdrnB5M7zjhwffvL1+GEC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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



On 21-08-2024 01:53, Matthew Brost wrote:
> Free job depends on job->vm being valid, the last xe_exec_queue_put can
> destroy the VM. Prevent UAF by freeing job before xe_exec_queue_put.


Seems this order needs to be fixed also in error handling/cleanup of 
xe_sched_job_create.


> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 44d534e362cd..9628f9deb3c0 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -171,12 +171,13 @@ void xe_sched_job_destroy(struct kref *ref)
>   	struct xe_sched_job *job =
>   		container_of(ref, struct xe_sched_job, refcount);
>   	struct xe_device *xe = job_to_xe(job);
> +	struct xe_exec_queue *q = job->q;
>   
>   	xe_sched_job_free_fences(job);
> -	xe_exec_queue_put(job->q);
>   	dma_fence_put(job->fence);
>   	drm_sched_job_cleanup(&job->drm);
>   	job_free(job);
> +	xe_exec_queue_put(q);
>   	xe_pm_runtime_put(xe);
>   }
>   
