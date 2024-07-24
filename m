Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDF5C3DA7E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 15:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963D10E743;
	Wed, 24 Jul 2024 15:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHvnIMI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6A210E75B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721836413; x=1753372413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=80vGu3NyPIm71MXsj1HiOn6vmaLgxlSopYuOFStzOSY=;
 b=FHvnIMI2oqS2IY/NR2Rh3wcZFBbtnA06+oDYJ2KPUHOv12T2/qxdU5dv
 mCd9NLCORMryyUPdztnGJDTjOdXF2AmaSuID3tZodPcwYo4cYsbBgk8bZ
 sd5IG/QO/0yrFX+m2ePeNVhzGTJZ7Elew+pIQcQ46lxbhSdCv/UCf/GYk
 FcmJaAIyXdEpM3KhSkzfBGOM2pUCfs1h64PlRreyeBTpvb8RU3zjVKtd1
 3LzH7QtFg5dz90wqpjUNvzvPOqZhUE4sejbIM2cIKy35+iuggZR2sBzkn
 A0+3sx/RxqRPGh/9q/5DpvN0AfPRDbPRws2q3q+zgoxqY4G0F6lPLFU+/ Q==;
X-CSE-ConnectionGUID: K6UsIN/RTeeLvDAx4DHR7g==
X-CSE-MsgGUID: 753/SzmERKqAxac0hGKo7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19662188"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19662188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:53:12 -0700
X-CSE-ConnectionGUID: jXmIHaoIQwmTy4gFhf0G1g==
X-CSE-MsgGUID: bgEqRe0WSXye+s2Xj8t13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83234868"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 08:53:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:53:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:53:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 08:53:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 08:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdDj3l8kRRRw2LKQZ6C0n+jxfXmdqHrz14DFu5xqqCKtR/NUXRnfCs+wpxzTQ27kjA0fm0GtaQmLnVfu5FoXVFv5GATIx1NOwTm6toyxndlZU3EfYkVqr46QwSb1HZpwiuOGftFsQ3lmJ/cdj5WeaGQXvhoxwlY36EOg+OiuUzFoCqODP3nHkTzbIjnOXgNvnmVmus1AnlxcBOSW8uQluQY5Thx766DEnwx56FaQox3Tt7Cw4SDlnyMCvErsqa1LY7X8p/17YXWA1jCQshtFX+U2R64sgafPhyLfHo171ioBex6mM9f8Blpm16JfsTPNmGYmwcfjNoMNZpqXVChD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO6imf6XLUKI5HZFff9UX21+KkkplUbqocQzP/71nTE=;
 b=XMZGlKkEKtUiIi5kVJQjOxHDuyNZZpUDhI9JuApzIgW/nwRH87nS/+t3HBhpEi/6jXT8zMIt7etqNaz9J/uaXfrp6QP06kTwuuoluBwGJDFYEM1RleCpdPFBQrapKpLKFC/VzbbeiKU+S3R3KHWNTKmqMbXOJ9182YYG9EIRX0EEcO76m7qDyA6lh1ogiD/rf1YVmlvIxPnp5yDrkp2KFLadnhBkgifzUJQNskOhs9X0AIVWm2htO7WHsPZXlSlUbOIBaPaL8sesIB3KGlcLSy9BEpkdIVMfeE2kl6p4tuCbeCzE5HnAEKd4MtQ3gx4yzKVocGNEPX91yrk1x3yHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Wed, 24 Jul
 2024 15:53:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Wed, 24 Jul 2024
 15:53:08 +0000
Message-ID: <2b54cffb-002c-4d87-bffc-feaf9ff69fba@intel.com>
Date: Wed, 24 Jul 2024 21:23:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
References: <20240723191903.1753729-1-matthew.brost@intel.com>
 <SJ1PR11MB620491E5A7575114CD082E2281AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <SJ1PR11MB620491E5A7575114CD082E2281AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0217.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 98722dce-9f73-4293-f3cb-08dcabf8b685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjVMY3YwTHFJa1hlYnJaOExucEJKZytZMVBodHpxWVJYSm9HdGtuMk1aV0Yv?=
 =?utf-8?B?YzhzQjJrcy80aEZWWGJPWmtNSXdiOU1QMFEzeHpEUC9Pa09YdkVsaUJvZEth?=
 =?utf-8?B?RXQyc3g2cnFEaDhYMVhJRHI3VTJ0dHRSWW4xTkdPbkN3L240YmlucHJmZExh?=
 =?utf-8?B?SC85MFZoelpIaytkWnEzRU5YalpmM2JNUDVGMHJLNFdmYXJQUUtrRTMycElu?=
 =?utf-8?B?NVhsR1BlQjhFbXJ4TC9VbWhlV0t3eDdTUmhUOU92OG9zdVlidzVHNjNwVVdi?=
 =?utf-8?B?Rm9HQURFTUlhQUhKTm9WT0lubTNyMEFIdHU1M2F3SWVYOWIvUCtmSldnQ3dw?=
 =?utf-8?B?NGN1SlJ5UmJkdnMrZXg4UGYyQ3YxZmpZSG5pLzdNQUhWNkhLcVBWMVVxcDlM?=
 =?utf-8?B?dUdjMGh2R01CNFMwM0tjZ2VtYlcvUnYyd3diWmlxV2gzQVNCR1U2Uk1vb1JC?=
 =?utf-8?B?Z2dIZFJBeHNERDRoK1J3WmlQUFJqc1RYN3ZSQjlPR0F6Z1cvR1Q2cGpqUTJK?=
 =?utf-8?B?NkF6dWlBT2tqZUVuZzFZbStNK0dxZHpMRkg4ZVQ2VVUxelJveEFzSG9Xc041?=
 =?utf-8?B?UEdJR1B1NGNyRTd3T2NsMnM4Z0hzTkk5cnpZemo3SVUyNzdSY1pSWmdOZDd2?=
 =?utf-8?B?dkdaMXY3QWMvejBiYTlURTYvZmIrckw4ZFV4YU5CSjhVNWZ5Q0Z1SlNnM1BF?=
 =?utf-8?B?ODdlNmpkeFFxTjJja082ekxlUlRWcUtDVmZSY0lxMWJzZXRBczkyY3RqZ2FK?=
 =?utf-8?B?bUY2aVdEMUpDaVVQNTJVdmhxY1YwWEUxNXlmN3l1VmVwdndqUXJpd0trZDFT?=
 =?utf-8?B?RVJlMzgrUTQ0c3BpeXA5ZmpYSjJNL0RqeUNIMHVqUjhtY2Q3Zk5ITEtjdkMy?=
 =?utf-8?B?M0Jwa0xlakFEcng1NnhKWFJRM0Z6WXo5V1RPMG40R1FvYThzR0lCdmk5K3Va?=
 =?utf-8?B?SDZweFh3WXFOTDJUeENJUlovclJITXk1N3Erb2l1d05UclhBamR5REQ3MlZx?=
 =?utf-8?B?RDh6YTRBRmoxWUNBd1VmNGxSVnlJaEpMQy9nMXY3S0VyQkpDWW8vUlArNXpK?=
 =?utf-8?B?NHZJMTNUT1EwWHhTL0pXUGxYMVRCODVRczM3WlF3aXVBV2FwVHZ3VktrK3Nn?=
 =?utf-8?B?REJlZEd5Q0tmVWZST0NXT05YRklZeitrL0Z5TDlFV25nRENhS2QzeDkyYm9K?=
 =?utf-8?B?dHJwVm9IdmZJZStRUUlRVzYwMHBVNWlLMzRoOVhRZHRWV2dYOUxhN1BnV1E3?=
 =?utf-8?B?YVV4SVBKVTBESzhUY3h2a3BJbWM3aWlFMU5FSE1KVGlzaU9YL2dmQXJKR3Ar?=
 =?utf-8?B?K1luUzdoQmFNblZjVGovTXBtaVJDUVFFR0ZiU1BKRG9HSU1sY0RiZm95RkVi?=
 =?utf-8?B?ajBXaXkzMEs3Tjc4MjhQUFpQbi9sN0l2K0NMT0RxbTVsRDdvZENtV3VnZTFs?=
 =?utf-8?B?dk9CWTYwZm8zeGFIUzg1Vk5wRTVNdklxVExsVklXOVZJNEsrK0NQMFdZT3BU?=
 =?utf-8?B?OWg4eUpVMGt3ZkUvZEYvVmFlL1BsMU14SEpGc2VSUlMvZlRlaVdiSnpoSFBa?=
 =?utf-8?B?ckEyaUp6cEw2VERGYkJrc2R3MlBibXJTUVBLY3NyN2NiYmcraUNrc3RQQys5?=
 =?utf-8?B?azBFM3hmcVRYWHdvL1pXeUJMb3hZUFBYSzdDR3NqVVoxeUtyNUhYck9HRlZw?=
 =?utf-8?B?M3MrNnF3Um9LM1N3MWxzRDRWcENnTmE2bmtIZzJrMEtjOWhkWXlPb3lTazBI?=
 =?utf-8?Q?sREdK1a9SPDgYKBQYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWI5YVd4bHJlRWFGOXFTV1RXcmR6aU9tNjNlODIzVVZxUWpnWlVyc1JJUlB2?=
 =?utf-8?B?THB1WFo5L1VVTEJPZm9qaTJXcjJQSjNIWVhsSWtYckVxb25CR0pMdnJFSXFC?=
 =?utf-8?B?YmFtbTdoaU42OE5uK1NaMHc3K1VtaWR6bVloQTRXcUZlYXUwT2cxb2YvZE16?=
 =?utf-8?B?N0JxYWcrb3ZyeEdsbS9zU0VGWlBIUWRnY2VsSHdEeWdDQjNsVmkreE9DTnBX?=
 =?utf-8?B?bFFFOU9wLzB6QUo5ejZROW4vclgxVlRsNDNZSjc0RlBXenRJTjBVV0ZqRnJL?=
 =?utf-8?B?Z2szajQwK2g0VHpldUFLd0hwWXFIZXArWUhKdzl0MGtZby9hanUxVldZdlhC?=
 =?utf-8?B?NDlmR2dFazlCVW9qdGZGenU2TnFYb2cxNTVlVGNNUlJtMEJ3RVdLa2RPdmR5?=
 =?utf-8?B?TTBLc3kvamVDNnpabnErVDVaNzV4UXBlQVF0R2FXejlYbDNUb2p2aWIvU2pn?=
 =?utf-8?B?bkUxNklJalY0SWZKRWR0QWFYK0xoNFlrSHlyYjE3TUIrb25kb2xHL2hzeHZm?=
 =?utf-8?B?RHpjVFA2bmZ2dnhQZDhJdGlTdGVtYkdEeGhZazFPUUdUYTdaMzc0SUpsOXl1?=
 =?utf-8?B?KzRnbmp1SEl2bjhuaGxaMVl5cG0yZzFCekJoM3FLbjUvaWYrQlBqaVJDN0tx?=
 =?utf-8?B?RmIvVW9HZ2lTSnY3UjJpOWFZb1NjbjEyZlBBMHlKYXEvOHVnOVFnOGhMc1pU?=
 =?utf-8?B?ZTJHb2Q3NFYzSzVSUVd5akIxSzJmbEE0WkJaMnVaQyswR3BRdWprNE1zZG5x?=
 =?utf-8?B?Y0hQYm9pV2JxSXZyRmx2Z1YwSTFVS3pjYlF5UHZ1RFJTOXNZL0lQcDNsVUV4?=
 =?utf-8?B?WHhxVTNRQm9wTld0am92blRDQVBkMXE0dk1ObEVzRVlNOHpSdGkrZEptaVo1?=
 =?utf-8?B?RHh1YWcrWTJxY3dQaWlBcXlQWVFzWHMzcWJBV1p4WCsrZVJqclZPZXBCZmdD?=
 =?utf-8?B?bUZlWW9aNmRKT3BvY1NNazRhSlU3UkZWYTVhWlR2dHFBUURiQVNlYnkrY3lx?=
 =?utf-8?B?VEtFYnAycUllVkJvWVpXYTh4RFBXc2g5WGc2aFFjbklwQjZ2a0MzbktGSStP?=
 =?utf-8?B?ME9CZThLazlQYjRBMGo3OHlHL2I4RG1rVWMveVl6L0Y0U3VHemU2VGIzR3BG?=
 =?utf-8?B?eUVzMzhKN2RhekdqZExqbmtXQUpNSHorQmhhNTlkWG5qaUUxTStXaHVpYVk5?=
 =?utf-8?B?MXpzMXJqNUlhRkFManByd2x2TnhvcnpFeGhlZi9xdk1xMWxFZ0JIMGZSbjky?=
 =?utf-8?B?dW9pdHRZNTBEVjZjQ0RpTUFkc2lyTENyVFdQaGczcStyOG82dzRvQVZ1VzRP?=
 =?utf-8?B?cklLSjRkQU1keVNwUnl3RHNrZWFaSFNFNlhYeDVLV1hSRlhSM2lUbmYrT0pP?=
 =?utf-8?B?Zm9UdTlvQXlrZ2J5L01uUmNYVExRL1h1a0dvZ1hMbFM2UnBxWGxwN3VkZ1Qx?=
 =?utf-8?B?akVXNC9XYnQ4RHJlU1E4MTN5bkZEd1FQdTJaQ2paeEVNaTlyZWxpQ0FFNXpF?=
 =?utf-8?B?cjZRb2FWMmphVWxjSWZDMW5kZWFDZWRqS0RUZXJ2L0RLbmFubCtTSlU4QUFF?=
 =?utf-8?B?Z0xBWjBuZUFyMW1nditKQUIzcGVZQ3ZwVkhRRFlLMUd5aFVJb05YQm9LeUhZ?=
 =?utf-8?B?QmpENFVhYkp6TDZCNithdnF5YkR5WHRxajlCNHhNQVl6dStvMjllQS9BcUo5?=
 =?utf-8?B?bm5udkNodk95anE4WTA0a2lEb0FKZm8zSGpHMStiQ281T0R2SitDMXpaRk84?=
 =?utf-8?B?TkVoYldvdGNuSGxwYnpDaWJMczJMNWhpb2NCQitCdGsxbzJ0M2J2ajhzVG1y?=
 =?utf-8?B?V1VoZTdYcHJzN0dDaktNMnI0dlI5OXh1TVdaaTFld3Y1ZEY1N3pnVVJ6enJu?=
 =?utf-8?B?TDFZUGF3ZVVFZG1LLysrUWtpSGc5OHdZelhnbzZHOTdNNUsraVlCYkU4Rm5D?=
 =?utf-8?B?cGlpTUZWZVhCNXMzcGlCZFpnbkJhcElMUCtEWUV5anpDUFNFZ3pjMFZ2QzVa?=
 =?utf-8?B?NWlBWUpDajlRN3NYQ0ozNit3bjdwM2NVaXNmdmVjTDZtOTJJa3MySHJhR01P?=
 =?utf-8?B?U1lRVUdESmFURzBUbHRoZmZvV3Nqb3dneThJTGcyakhiMTAzTk9XUGN6Uk5E?=
 =?utf-8?B?UzNyUXNWendqOXVsK3FXbFFNNlU5ZDF3TzBLc1k1OVNCL3ArR0RsL3c0Zzhh?=
 =?utf-8?Q?hUvrRzAj7lKv/gBejC5PPvI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98722dce-9f73-4293-f3cb-08dcabf8b685
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:53:08.5495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzzLZhw/CW7Q/OqEWVUaMEKI/HqkeeMuIJQcg3c5rO9Efv0enKdC2wmIdJWlCjOcBiyd14/hU3roe5IWHRwnoe1O7vDphO8ff/NX/XRnkv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8686
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



On 24-07-2024 21:12, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Matthew Brost
>> Sent: Wednesday, July 24, 2024 12:49 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: dan.carpenter@linaro.org
>> Subject: [PATCH v2] drm/xe: Fix possible UAF in
>> guc_exec_queue_process_msg
>>
>> Store xe_device ahead of processing message as message can be free'd in
>> some cases.
>>
>> v2:
>>   - Including missing local changes
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
>> Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index da2ead86b9ae..b8f938539a90 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1395,6 +1395,8 @@ static void
>> __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>>
>>   static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
>> +	struct xe_device *xe =
>> +guc_to_xe(exec_queue_to_guc(msg->private_data));
> 
> If msg freed at this point, don't you need to protect against NULL, just in case?
> 
> Thanks,
> Tejas

xe_sched_process_msg_work the caller of the ops ensures the routine is 
called only if msg is valid.

Below msg->opcode for eg like CLEANUP can clean it uo.

>> +
>>   	trace_xe_sched_msg_recv(msg);
>>
>>   	switch (msg->opcode) {
>> @@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct
>> xe_sched_msg *msg)
>>   		XE_WARN_ON("Unknown message type");
>>   	}
>>
>> -	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg-
>>> private_data)));
>> +	xe_pm_runtime_put(xe);
>>   }
>>
>>   static const struct drm_sched_backend_ops drm_sched_ops = {
>> --
>> 2.34.1
> 
