Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EEBC369DC
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 03:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ADB10E059;
	Wed,  7 May 2025 03:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sj/M9+Wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1048410E059
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 03:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746589785; x=1778125785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A4Kd1dH5P8JpMt0x1dpyheVyut7tJ+glA22DB2wH9WQ=;
 b=Sj/M9+WkkuBKBzD1hfFWrAYdEM3WQY2GzRY4QjcSRX4E1zVtwk5v0iRx
 PXZZI5kuUBXPzJt/6YW7OIKP9mvc9vYfE4CJXfmkSWZExvo9JPqAGVepo
 bq449qcThtfzWH9cHPMqXYNDGp9ovCjCb7ZXZCSVdxuH5ddgpZb8B6oQw
 cyZQlET1E8ANDEIslhHkkm8bmrx2aiJw+AJBb+lIODT/p+zq8I5ppM2/X
 A2OgLn/Bo0HIQx6oyID1AzLJoGXBIYUiI64EwCcayL4bJCEqhZ91zEAiJ
 XdxdqLoS9KI8CjaXg5If03vyezfqDePS7AUZjVdBnEx0TOPllAMYzEvff w==;
X-CSE-ConnectionGUID: yg738KOWT8u28iO7aKHlIQ==
X-CSE-MsgGUID: OA7tpsC3QU+S06GOq5A7Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48302232"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="48302232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 20:49:42 -0700
X-CSE-ConnectionGUID: fu3LYg6XRpuq+HFlK4wHTQ==
X-CSE-MsgGUID: 5vnF5+NqTp+SwCgZp48EVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="136342134"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 20:49:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 20:49:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 20:49:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 20:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgUq41x60fgGIqqcuYthWxJsOoO3OuMv3CJ28TyJpuGrTIdAcfowLuxLW1Xv4gIqRBgs1kc26660HZyfzVLGzu8+eC2J1pdJk0QgB7BN1tdHCSGE9/wbXFSpLf/VVkI1TTQNJr/Au1BbQYf0ayR3lwSrmSBxjbP4QhOtslaFpR4NxQ0gG5gDd/eE/+UiXVjzsV+7VGY36KtvR7vV60SQTopmAPDbw+APCoBZq1wecqrP6qXgZgNWSG4Pas5gLb0YfCY2sukCFjaVy/enPGM5jOztMhpeTAug4h72/pRhot8EUQftwIRaCAdOU4WlbEpIxC1J6YHUPtyqbu9IDZ9tHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMpICDXugnpFaI4rit50rMYu/J6C5q4arRfVgwKo7Yo=;
 b=mHOoSq9hzwNBZuf1Inf1WponPpgSfxx3Ut9J2JlZ4nWLdmxeaOTUbTaT2C3Lg+WW+lHCxEEDCzugeeMWnIcck2zZ64Bpa35Vvy9KPAzBABjWTZI/8hMaL5YjzpPmRCEqYDYxlpBqFybZ79PCHFva2v7Ki25+Ip49XFk5BU1udNk/T1g3hfwfBAFozY4KskAn4L8nAwwMi4FLNu+oCPaIDURODpzBJnVYvskiracMIvMiuezSmEaX3rmi9b156NtpIFzgJZtugo/fIPhDFTdDVdHtZ5zKIpGExGeUplK9b/dX41MkFl5bzDYO9a7CDYiOyB6dSW0/wyab/aZONYlROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 03:49:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 03:49:37 +0000
Message-ID: <91469b5e-170a-4f18-a694-61e26acd1ea8@intel.com>
Date: Wed, 7 May 2025 09:19:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Release force wake first then runtime power
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250507022302.2187527-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250507022302.2187527-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 948c3549-7432-4e9e-b33a-08dd8d1a304b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTVrQmV2R1ltNitZUnlpcU1ndE5vR0lqQmw5MHpJcGpqekZkTUdiNjdxaU0w?=
 =?utf-8?B?blVZbFlERENxQlRUVmtWWU1XRTRiREpaZHNsVktqY294clpKYTFqaGlZNVp5?=
 =?utf-8?B?cEF2bnJOalozTlZVRUpzYTU0Qld2Q3F6Z1N1SWhjZlFYQXhLanI4N2RrK3hh?=
 =?utf-8?B?S3AvOENGcVVyUWRnMG5yWDR1MmpYWU9oRlM3TENpZjNhZGs5bzlTTkQ0S3Ev?=
 =?utf-8?B?UFpSWnBSUFZTSXZhajdFcFNFM3B5Q0JubUVwOUVpaXoyekNqdUZvUUhpK2Fa?=
 =?utf-8?B?S25UVk96dGE0OHZhYmh5WVd5aG9pbWRkTGc4TGV0UXR1eW5ZSi9XSkF1Sktr?=
 =?utf-8?B?c1QwOWc3ZkxHOVl3RUxydkFHeC9GK21mUGZocmVYdnhpMFlaMWNqSFVsTVJK?=
 =?utf-8?B?WWNKSlpXWkJ0MUt5aEdUMHdYZW1aQU9pNCtCWHhxSlJpekgxMlJCOGRRT3o1?=
 =?utf-8?B?aHFGNTVETEVDZlpHdkZhVTRsb1NmV1FWSERTOWtPSnNxOXR4dDJqTXQzOUty?=
 =?utf-8?B?MFRjYTRSbDhtekFRNkkzaldxbmE1L1pwWFhISldkZlc1Z0ErUFpST3pjQUQr?=
 =?utf-8?B?WXB5bnBjeVF5MVhTZk5DUDRiRU10VGtEbkxvVVJVaGFxVnFXVGVtODRuck1F?=
 =?utf-8?B?ZkppQngxcFd0dEpxRXNidTdmbk9ZN2h3QUkrWldYekYvWFNqMlVyV21XQmd6?=
 =?utf-8?B?QVFiL3k4ZEU3M0ZSOU1pRGNsNlVSdnpCamYrM0doWEQ1U05IS3BTaFk4cG9O?=
 =?utf-8?B?M1A1RzVkK3hBSGtwWisyYksvYlRMaXR1Y05lMDZSMDBsRUk4NVNSVUpTUW9i?=
 =?utf-8?B?SGdtWEZzZjBKY2Zxa3lkL2JBZGVPRlRFa205WXBXWnU0bTFpOTFUNllaSGZs?=
 =?utf-8?B?RTJjeWIyV3R5aFhVMmVGQkxqQnFQcEFlSXRPSlJTTmdSM0Vrem1SVGRmaTJB?=
 =?utf-8?B?NkR6d1prMTV4UDY1dGdqZ0FEYzV0Vzhna0NzUFFraHdjaURweUw1MHVPWHI2?=
 =?utf-8?B?a21mb0FjWFdzeVQybkQ0amJxM1NSVjhlRmJQMU9DR0pwQ2dsV1pMRVBBZlFr?=
 =?utf-8?B?Vi9JaWRLTStsOFlrTTdNcHRrQVpVWUdvVFlVYkUydkJCVndabm15RkV0U1pl?=
 =?utf-8?B?MGtJN1NRRWcvYUlSZUdxN1VTVmRUQjg0cGc5TG1mMkxtczZvMXN1WkpCTmNz?=
 =?utf-8?B?b2Z6ZEt3dG5DQUYxay9iUnkwU05nMll3aU5xRjNsbW8wbWgxaUZKMUpBYmZn?=
 =?utf-8?B?ekNQTTFzL0YvY2VSbHJ3MWczRW1rMjlrUm9SQWJYK3dKTXo2MVlJbnR4dzJm?=
 =?utf-8?B?bjZFQnV5ckJ4K2dzbTkwc0F0LzdEaXNFTFgwVldMaDVpbDZRSFFqU3h2cVZH?=
 =?utf-8?B?WW9qdytnMkt1ZGQ4dHp6VHB4SWdjUHI3TmZYOWJ4NitzU0FkRGFnSnJEcmN5?=
 =?utf-8?B?dkdnNmRuZnZwakVTdDlZdHVpbFgrQmYzNDhQQ0lCb04xanZIbnZ6eWhvYTVy?=
 =?utf-8?B?dStsS2pnR1RFUm5OSlR0WDI1YVNUT1d5bFRaZmRiQkhYYkYyTStIU0QzWVZ6?=
 =?utf-8?B?aE9uUTl2d09SUTBRa2tucWwrTzFBd3NRV3U4SlU3TExNOWlxZE5HMnV3cjds?=
 =?utf-8?B?QndrT1F1aWFvV3BXRmVjNXRrbzRkaWNFZ2NSRGk2RjVPVzYwek1Xc0JTWTlr?=
 =?utf-8?B?ZkJBV0NTcUw1UjBPcU9vQkdjVWR6UjgvaDRUek5XdUY1dDYrQzQybFRlWWQ3?=
 =?utf-8?B?ZkI1MElCeHhxZC9pRHB0RnB5ZU9ycXU2SEZmUURudUtrNFh1VzlsMkVpd0Zl?=
 =?utf-8?B?d1FCcW9VUjIxSGMzMnJCTzdqeVF3Y1pldC9zRkxwRklCNjdhVTB0bnY1VU9M?=
 =?utf-8?B?UUx0a1NPa0tESEpVLzFqSkFLaU8yUWVTVkFTWEFIb1ZDL3lJQ09zaFYrK00w?=
 =?utf-8?Q?wq86j1TQ0Fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0VraWxNbmdhWThqN1E0N2lxdloyOEZGNTV0QStjU2pIa3RqNEpzbGtxME83?=
 =?utf-8?B?Rnlnb2I2RzdjSVlQMnhKeTFockVkMStuSXhLeXJuREVpLzNFVGRiTG9zdlQy?=
 =?utf-8?B?OFkrVStLWmk2YWxnYk0yVjk1TnhMOCt2Nzd4TlFaeFJRU2lMS3U2d1ZhVWVx?=
 =?utf-8?B?MEJrNlhuUWRhTThzYW14eVowb3RMMHhpV3hkb05iUzRxenM1T3hRYjdYSUR4?=
 =?utf-8?B?N0l6bHVWYmszdGFrOTc4OWQxeVBPQkFDTWZSbjlSSzU0NU5sVEY5NVliUjFC?=
 =?utf-8?B?YmZrRkZEWjNVQTl0a0tRNVhqK1NQeGpGcW9xdmVXU05KV0gwZmxZMXdGQURR?=
 =?utf-8?B?SDA3Z2xxQXEzM3ZnV1FIaVl6WGlvYVNZQmlIL1pTblZGYVVVOUtqYWtianpG?=
 =?utf-8?B?dHM2VVBqZXVzU2ovNmVMWUoydWcvMzQ4TWdocGlPaTBxZVZIcEUxY00waTNY?=
 =?utf-8?B?VGlUcjUxYUt3dHhUWXRvVElxSjFJdFFub2ZNN3VKTDJYUDY1R0FEK2hQT3V4?=
 =?utf-8?B?NVF0WDVLUHV2eUhpN3ZiajA0WG0zNFUzL25YdVRITVdmdHEvcFF3WVRzNlcx?=
 =?utf-8?B?aFdCS05mZC94RWtrNVB0eldWaDE1RUpaQ2VWazNMQzNqUGdJZ2VKcEQvWXhp?=
 =?utf-8?B?Q2xacEtITXNQYWNvZ2VTeGZPN211c243NWV0Mjh1d2NmYlc3WHlwZmhFZUNM?=
 =?utf-8?B?c3ZOOGJXSS9sb3l4VzNMYm1DbjlQMWd3NjJnYm8wSGFkSk9iK1Q1VTVRZWVk?=
 =?utf-8?B?RGM5S1dZenUrek9BWks2ZURPWDJTTkl4VE9KL2M3QUlHWExVVDFpQWN5SkpS?=
 =?utf-8?B?ZUxvaURDL1ZnWUZZdEtwclZrYkM3RTZmWUFZemdTNlJmZlVJZGo5cDE1aGZn?=
 =?utf-8?B?M2lzdkdEa0dWcGszbXQrK05BSVYyem1ta3R1eEVCRzFlVWF1TzEwcWkxVThJ?=
 =?utf-8?B?Q3ZNRzZSa2N0UUYxQyt5R2xDb2VQSFFxRGxldE0zN0ZSQnRoWnMyOWh2dUVk?=
 =?utf-8?B?Z2FnNkNLOXBpb2tPY3pWclFCbGtBRGpuc0Z0ZjlUR3YrdjlYK2JTZW1Pbzdk?=
 =?utf-8?B?bVlyS0cxV20xeGJ0ZXNZNTN2cE8wM1FUNExxQnVXV2hDSldlZWRCWjlrOFZ5?=
 =?utf-8?B?YkVFSTMzbXU0b3llaFI1SWx5WHJRSGdCRmxoNGZEK2NESWNLMm5xeVFlWktN?=
 =?utf-8?B?YkJCN0dKOFFHRFhuS29uWUY5TmZWRjB4OHNDbFRWT1l1bll1eDFSbUdINHNz?=
 =?utf-8?B?Zk1rVlRXbzJhMkFDd1REUzAxWlFBem9hOU1IaUpra0RRODg3MEUxZ0IydXdr?=
 =?utf-8?B?czhxTjBXVkpIRFFrZEllS3lIK0JnVUxYYkdZRDZXVndRcGNQY1dzbUlsU2d0?=
 =?utf-8?B?VzBBY2NkdTQ4a0VMbllYc3B1QVJNdjhsVTFjanBEWHU2WWdMRDgrR3puQzZ6?=
 =?utf-8?B?UXJsYStodUJhRm53Yy9Kb3dteFRUV1JaMGJXdStYcHlFWE14OXdkY3ZhU0pB?=
 =?utf-8?B?blVrSjgzaVJobWZGSTBvNVVSN21sRWVpRTVBaHl5aTNqYXZQcmQ0UXp0bWxK?=
 =?utf-8?B?SjJBREFXR011c1JxblVGbW43Zmc3aXQrTnNVbjBIQkhPK2RyZEJiaks5NnRS?=
 =?utf-8?B?Y3hBeTdIaHNTQVliamhBZFQxSnBKb0JaVG5iUnRJNXlsRGRWWjI5dEh2dC9a?=
 =?utf-8?B?Q2kyMTNzVFk2MEFGZmc4M0tncHJ6MUV1bWxZVDBZdlJqcDhoVUdRVTNGSk10?=
 =?utf-8?B?bUdxQVpNSWl0V1AzTGJuSzMzSXlyUjFDNGVtVTUyR0NTVHlVbjRBTFNRb1N2?=
 =?utf-8?B?WEVYRVB3cTNNVmdtS0lNT3prbDI5cGE1RDlhMDd2MmtzcWQ3dURCQjZHYmRk?=
 =?utf-8?B?NFBWYVNpM29RS3BzSzNZR1U4bFoxNTZ1NkVuS2JrSGpXc0Noc0JDRGs3Y3NK?=
 =?utf-8?B?UEhQTnRnR3djaFJ1SWhLSDJBSDMwMWZWUnBZajV1MUt5MEZPQUxNdWs0Z3Jj?=
 =?utf-8?B?MGJ0Yk9YZ01PUHNRZjlaaVZKL2pwb2htbWh0U2JUeHQ4cFQxVmxtR0JjSEFh?=
 =?utf-8?B?V0xQWm1VZEtCUXhjbVZLQ0dORTcrVWxwQkY0bVE2WTVwSjdDMkpUV2JpTHVN?=
 =?utf-8?B?QWsyZHFoN2FiNTVJaTVKTGsrZk5kRm5XZEQ4Tkc0R1hGWG9mZGFjRnJGRE5z?=
 =?utf-8?Q?7uN0+B2GvT4gdU6rwxQv6qo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 948c3549-7432-4e9e-b33a-08dd8d1a304b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 03:49:37.8686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ9x7Qh5wgeArT/f5iVXY2NhCdY/zlqD+7y4NDC07ezpX+iWOKTih+XWl+8GCFZAYtNkha5R6ZQcePCf1/A+01ubj8ALsszFONRvkj3odG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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



On 07-05-2025 07:53, Shuicheng Lin wrote:
> xe_force_wake_get() is dependent on xe_pm_runtime_get(), so for
> the release path, xe_force_wake_put() should be called first then
> xe_pm_runtime_put().
> Combine the error path and normal path together with goto.
> 
> Fixes: 85d547608ef5 ("drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return")
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index a88076e9cc7d..119a55bb7580 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -92,22 +92,23 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   	unsigned int fw_ref;
> +	int ret = 0;
>   
>   	xe_pm_runtime_get(xe);
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		xe_pm_runtime_put(xe);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		return -ETIMEDOUT;
> +		ret = -ETIMEDOUT;
> +		goto fw_put;
>   	}
>   
>   	for_each_hw_engine(hwe, gt, id)
>   		xe_hw_engine_print(hwe, p);
>   
> +fw_put:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(xe);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int powergate_info(struct xe_gt *gt, struct drm_printer *p)

