Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97F5E7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 08:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FE410E238;
	Mon, 23 Dec 2024 08:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAo60Sfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B639110E238
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734941932; x=1766477932;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/LEhqzyblUSvl0jGOUOoG/UlFY/vsd5JuzpPJUa9Ioo=;
 b=dAo60SfnrfB7uvRby5nEN3EFt68/x43V4T3moaJhCOozjFtE3ny7ol7m
 lYkhheZcL25zhZbKLNseFgh9HGc3zKFfb0Lb63EldJaM1a4lqfb6s9719
 ToCHEV4yeWuGZ9Uv5aqeFakG7AUGKM+ckd9g5Pb+zwMVr787ME7Yl6m/r
 lsHjewZ6bVHlbDRCSu83zy52W/oYAu1VKD17esOUctUYpXXRP66TqhoSQ
 gBC5gbwr2raTUqgmxs6Kid/YvN0PD9LYVLCM0cXIQwuoVK2ai25EmhGM4
 rVa4Ll+EiM8SzQQF4th3tB6OiaNNxDXv1LD/fiw6q9p+u7ubWhkVQHtqp Q==;
X-CSE-ConnectionGUID: liVTlni3SuywB5oOcgPv+w==
X-CSE-MsgGUID: kHbQAq7iRHuwFDvgNhOkJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="34676337"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="34676337"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 00:18:49 -0800
X-CSE-ConnectionGUID: LoMGF0qYQAqY/mEH5rD8xw==
X-CSE-MsgGUID: deJC4LhaRRqu0G8CnVDF3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="104213701"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 00:18:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 00:18:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 00:18:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 00:18:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4FFt0bpOnVDCUZBAaL908rdRpSdI8uFalBr84vjHrER+YRpMlZ+vkp6zT3gyYrOmbLM/xkWJv6HpVimQQecU+j8rITtRTgCokkUvrngdA/zgP5omL7QTDEHuLF3GGaMLmsHldP8q2vso9+J1jeQMu8Gn/DmzPdksdjUGLUwGcqWenPF1mja6bAlnH8OzEgflChvYKJRakQkgr9ty7s8glVL8MN9t3me2qHCkc3PE2jW6NKns/JI+PmwpEvM7Pm4TEBl49A9NrxTOkOuE5L0DI5YPQ6lPViCs3feH32Whtf7qbPYtVeV0gmGFrl39K2C9k487ED5dU1e1cAr6Unhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaWRXFnqtsZv5e5RN0Mi/0m53yj0U7SAKiViF5kLFCw=;
 b=ucppiTHrXasJcaivCRmPF39rWbMXeqDq0n99znM1kA14SMHD+4t27ullSyX0xD0LfjqMcSNdrGANXh4I6DjGD1fm8MBdjlthdHgnzA2hbgc+3lddZ/NdCL4S21863hxAam2Lti1CPrw5v5gNKY7w447aTek01aTzs9L5Cd29r/BYZtIyl7KpaZaJE5VZ/+cyzim30P4awfHp0vDrkhkqV/Wv6/gV9NpeHLXBbupzKt3hm42JZKzBfnHc1ty5YUcIf+Tb4nrOGOYjzOtlqyUcnJEd0+btEEVoFHM6q7TOOJuhXqgjbGbviBmYioPUavRAB0JWf9XkHWESyZQUHsGkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Mon, 23 Dec
 2024 08:18:40 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 08:18:40 +0000
Message-ID: <39b856a5-f9a4-4b07-960b-a732d7ed12a8@intel.com>
Date: Mon, 23 Dec 2024 00:18:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] drm/xe/pmu: Add GT frequency events
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-5-vinay.belgaumkar@intel.com>
 <Z2XfA0u32v3tvKiC@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z2XfA0u32v3tvKiC@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0c4759-7d8f-4687-bd86-08dd232a6828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTA3UkJLSHBNb2hsSEE3VTl6YXpuUVczb3kwQmhNdWdlSi9vUHY4ZndLUFBr?=
 =?utf-8?B?MmpObE5aOWx0MkFjVlY3L1VYWHhzMXBCem5LeGFFREs2Z2o5QjdNTW82RUlB?=
 =?utf-8?B?REViT3J0b05VbzA5ZDFHN0tURHhDNXFzY3MzQ1B1c2swOUd6Tks2cDBkaXFa?=
 =?utf-8?B?a21jdUJzSzN2d3FQM21zNktnQlJROUxEZkw5VUh1eDBqSWk3OWd3V3dvakZI?=
 =?utf-8?B?eGQ4TFZtU2w5eW1BVWZEdEVxbkZuTUdSWmM5ODBjcHhpS2NEM2NpQkJXNjFi?=
 =?utf-8?B?aDNGS2Jtb3JWOWhjMktzVTRUNFVBeThUbnJCMGlNQmxoWnRyNkNCOVFpdkRr?=
 =?utf-8?B?cHJidFdFU1VOMDNUSWNjSTRMSm9POWVqMUNFMkxpRlc0dXhkbG9lc3JzalYw?=
 =?utf-8?B?MzUvMTBUdncxdVp0U1V6M05qM3ZrTFVCRmNQMGhZYjRheWI1L3pRdEJYbGdL?=
 =?utf-8?B?STI2WE1KWnBLWUY0NVRoSXRhTmZ2eWZyOTBsOFlQbU15c1ZxYkRjeU1YdVBG?=
 =?utf-8?B?ODdWZVdTcm1IeUJwSXNUZFFxYlVrTzBzT3YvVGVqUy8xT3Q3cGRFYTFuOHF6?=
 =?utf-8?B?NEZ2QVJXb1dURC9oSDdxWUtDWG8zMTFOSWQ0WVJ1MWsxalBpbVRRR1F0Q3NR?=
 =?utf-8?B?ZFY0Sml4WDZyQm51Wm4rMCtSS3NXWk5jWmkvRnljL08vcCs5VWdpWDZCYWc4?=
 =?utf-8?B?Rm5RZk1vbDFRdzgybG5RN0gwNllONE1yL2w5b3U1cG5kNnR1ZGJSaWNOcGQ1?=
 =?utf-8?B?TnB6KzBQTFVlZlVFRlNXV3NTSWNTL1p4dVEzcExsbm5PQTgzQ2RmT1h3cHRM?=
 =?utf-8?B?T2hNNFBHUjVHbk1LNFpyejJnVGxNOGFnd3UrOEw1dWxTNzZEcnhvb0wwL2Vn?=
 =?utf-8?B?b3dyQU5oTVVnV3V4VWlhUTdOTmgrMGpEQ2V4RWw3ZXpqbXBpZk1FSUg1a2Nm?=
 =?utf-8?B?WFBPRncybHJSSEIvaFR2OEsreFBtY2o4c0E3Y1ZhUG5lZ0lGQm9qKzdodVBX?=
 =?utf-8?B?cmxWWEF2S05YQ3E5QTRWNlNrZHF4UTl3L0h6ekVYeUZEcjdrZUs4VCsvQ0R1?=
 =?utf-8?B?ajF5TndCZytqcm5lVWRWQ2dxUVMwR3V6bkZlY2tucmE4bUJBRUsxd2NpNkdN?=
 =?utf-8?B?OGdYMG1KRElGb1ZrZms4RnpNVVVCbGJTd25ucDZaMVAxcXJSMm1INm9zQzYr?=
 =?utf-8?B?SUVLc1RnNHVCMld4SGR1czl3WHYvT08wNldoYkQzY0ZOckF1N0FHSnZtM1JS?=
 =?utf-8?B?cVFkOE5mTGxES1lKTmh4VjZPNFEvN1N0YkdOUzZudWlneFJRSDlYbEd0T2FZ?=
 =?utf-8?B?OGR5Wi9TV2JlZXNWZGJCL212VHkvNExqeGZqT2tPZUZpNWFSRmNBNWZjUTFK?=
 =?utf-8?B?Y2tGWGU1TGEycmh0UFRNUUZnd3dCVDlNL1Rac1BFZnh2alRjaWFMeEpWcG5a?=
 =?utf-8?B?T0oyTjROVGhmeDYzZEdXTUcwN095TmwwZDZTRXRibkF4VFF4TVJ6VGU2STlw?=
 =?utf-8?B?YTNibnh3SWh1M3N2YnFmZW4wV2l6bmdaNXlzc3dhT0t3elpHNlIzU0gzOVBJ?=
 =?utf-8?B?TUcvc2tzSk94ZE1xcGRFa1NRdmswbFJWb0UxU1ZTMEpYcTBGVkhHY2M2dk5v?=
 =?utf-8?B?Uko3Ukc2ZlRNbzI2amcvYWg0RDBpdUljVExERGUzZVNrd2d0eElOVlNIb2Jo?=
 =?utf-8?B?S0pBUUU5NXVLVUNYbWhFUkpLMXJpWTlNUWYvcVJXWlMvKyt1blJObStyeU82?=
 =?utf-8?B?c1FZdjJRYVpLSXVkNGR6Mm1JZndnRmFuZlNoeUZZbElNTll3M3VBRnZ6S3VW?=
 =?utf-8?B?L2Z3c2tDTUpyOFh0c0dwQi9kbmNJSzAvQzNjdWpDVkt1YU5FNERnUXdBRExN?=
 =?utf-8?Q?IYy8eqUJ9Dfyg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjM3UjhZRk1scFlJYnA2a3ovWUNhZXA1NVFjem1BcmNpbkpGQWFtRWJQNkJE?=
 =?utf-8?B?dERhUW5vT2psWTV1TGRqN2t0TEQ5Tlo2K0dMT2tka1ZkTUhPZHJRTGNheWhh?=
 =?utf-8?B?OXZka2IyWUYvRktIQUZmV3FhSExRZ0ZSRlhSYjdoZWJrMUtuUWlWT1JVbVAr?=
 =?utf-8?B?bmNWcWNKNzBxdW93dmxkbGFZK1RKZkpId3hNU0NUendCaDRkUUp2R2hBWjVt?=
 =?utf-8?B?N0REZllrTE1UT2kwWW9jSU1iM3E1dTNCKzNlTkl5ZDFmVlpDWmlpT3Y5VXlh?=
 =?utf-8?B?SXZyeklsOGYyWndYNzBqRjE4NTkyZXF5T1hSQm9BSS9XMjh4ZkhyV0tacFNQ?=
 =?utf-8?B?ZHMxMjM2NW14YWl6TUM5cURwR2VRZ0htY1hHUEZXZlRSNEdLellrUS80KzlM?=
 =?utf-8?B?Q2lQYVVxZGd6bzdVaVBLSG1OdDgyYUZURllQN3lsWURKYmlyVkptYXZ3Q0VX?=
 =?utf-8?B?SFB2SmcvRnNYUm5uWTJ5dTAwUHlFVFZCbHc2Y1Rwcm50WFRmckM2Q1hqbUZl?=
 =?utf-8?B?TFhONHRvcTRsK0xlZmIxRE9rWTZJM3Q4OGYxNENxcXJDaWRIR0JCL2pMazJD?=
 =?utf-8?B?dUplMVpKREs5Yy9uc1dKcEZCVlMzZ25ieEkxaVQ0YlNKUHgvdGN0a25RWHBC?=
 =?utf-8?B?NHp2VmNxMUZpVFREN052RU9IL3BXbXNBOVdLTi9lMTFPdTF3RzE3MCtXT1hs?=
 =?utf-8?B?ejFETUZPdlRsci9oMG80Ym9nK0tZQktlUFJ3YUZ6NzRmUkVKdHdFZ3krUWNv?=
 =?utf-8?B?SXFLUlNFUVpTS2ordGNQVzZDU3dBSUwvMDhsWkRYZHlwVmFFeTNtaGlQMDM5?=
 =?utf-8?B?S2tidURsWldNSDFZME9MTkwzbGowVGFlRXU2dGVoTDU2Tis5d2d2RFpiK3dj?=
 =?utf-8?B?aTZXZVMxamlSRHZ4emhlQkhEaE1aWUFPa2l1R0MydkRVZGpBTjJvKzRiNkxB?=
 =?utf-8?B?ZHJWZ2pVZS8wUkdDOXdwZnVZTEtCaDdQNmNBbFJablg1eHdFRHk4bGYrL0dk?=
 =?utf-8?B?UmE1cDJLTW1sazlhTkQxTmljY01aQzdrSlJnQVZrMjdxRnRWOW9LNk10M1Vv?=
 =?utf-8?B?TFJ4YUtJWVkzT2p0MVJaYmEzTnUzcjNoREI2TWZRRlVRTCtScm9FYjRoYTBm?=
 =?utf-8?B?ZStkN1hJS2M2aDdHV3k3TkJzNEZVY1BaRXdtbnM5b0dySEw3ckJ6T2lNMUVi?=
 =?utf-8?B?Q3E2UE1XZXgvcHUxVU02RHVPU01LMnlKMWdKNjdjUTNITlFreGloVHFMdHVZ?=
 =?utf-8?B?c3hJMXM0bjZjY2hSYkRNN0gwSi9ZOEY4U0hUYTBXclBrcmFrK2VpMTE3c2Uw?=
 =?utf-8?B?NUtENmJxTnlVaVltOGp1MjJDYXVXVW9iSkxNRlVhM2orMnNJNklnekZBTWVt?=
 =?utf-8?B?NnJnN3hQY0xOUWRWSGx3bDVaZDM5VGFYYVdzNjd0aGR4UXFyUzZvSXZ6N3FW?=
 =?utf-8?B?RGNVWHk0VGZqdmZKS2J0R2k1UEVnWkRQeEJPLzNPdkhKdTBzMmJmcmRDSThE?=
 =?utf-8?B?aWxxclM3cW0zWUxQSFFqQ2NmaDdCb1dDZkdHZzJtcUYxZWZmVysrNUhoSCsv?=
 =?utf-8?B?SmtMekQwNlBkZUFKbVE3RzdmTHNiYTlJeEpvZkJMQWlWM3ZwMkxjamN5OFFn?=
 =?utf-8?B?ZlkxRTJ2aml1cmxxMjZ5c2lZdFpYcU1vdDNkalNJcW5PVmFkVHpmTmtQSFlO?=
 =?utf-8?B?Z1dzN25tRnMvbGQrdnlKMWJ3aWVvbjkya1NsU0ZyREQvb05aWC9GdlMxVVpz?=
 =?utf-8?B?UmRUOVBUc1MwWnd4U2wyMlVoMzVqazdIcC8xY1hFdExiV1IyVHlnT1RDTU9Z?=
 =?utf-8?B?VGZpVmdwRG9rcEtQTzNWTURKZVdKL2ZRaE1uUC9sejNTd3d4cWk3WGhrekJQ?=
 =?utf-8?B?YXF6RVVPYWljYnJZZE1aQnloQjlNbmFvK0pGNXlJc1krT05IbFBzaGRhT2ha?=
 =?utf-8?B?MGVTU0xFQTBkZER1RzNkUm4xQUZsblNJbk5EZHF1WWc0MGJJRE15TU1uT1Zj?=
 =?utf-8?B?QytFT0ZPY1E4b0ZUTXJCZXJMMmxCYjFXaDBmc3UvWEhjdXAxOUNXNmtaaFVI?=
 =?utf-8?B?OUw3cm9QMkRDaThTVWdTbDhRR1ZZWkpCallwc3diREovMGNjMG50aDF1Y3d3?=
 =?utf-8?B?RVRUbklXMnRuVG9wSndXMWszRDBic2RtNDJCbFg5MGZCRDk0VXkrQldHbzIx?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0c4759-7d8f-4687-bd86-08dd232a6828
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 08:18:40.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqSlse/JYbxXiW8Cz6/aUFM5NkBci3kkfzp3wDSt5l3OBhYN1XiarEntKGH+0wViyeZMCJrqwJN6WVBYoO7dPLQ9EBZ64hjoIF5tUoPQL3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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


On 12/20/2024 1:17 PM, Rodrigo Vivi wrote:
> On Thu, Dec 19, 2024 at 05:19:10PM -0800, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>>
>>    xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
>>    xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>    $ perf stat -e xe_0000_00_02.0/requested-frequency,gt_id=0/ -I1000
>>
>>       1.001175175                700 M    xe/requested-frequency,gt_id=0/
>>       2.005891881                703 M    xe/requested-frequency,gt_id=0/
>>       3.007318169                700 M    xe/requested-frequency,gt_id=0/
>>
>> Actual/requested frequencies will be 0 when GT is suspended.
>>
>> v2: Checkpatch fix, moved timer code to this patch
>> v3: Fix kunit issue
>> v4: Checkpatch warning fixes
>> v5: Make PMU events per device (Lucas)
>> v6: Reuse bits from config mask for gt_id (Lucas)
>> v7: Fix bug in pmu_enable (Riana)
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 259 +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++
>>   4 files changed, 288 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 64e60bcf131a..88ce52c63018 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -939,6 +939,8 @@ int xe_gt_resume(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> +	xe_pmu_resume(gt);
>> +
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_dbg(gt, "resumed\n");
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 1115724a580d..7b0921ef8a1b 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -26,6 +26,8 @@
>>   static cpumask_t xe_pmu_cpumask;
>>   static unsigned int xe_pmu_target_cpu = -1;
>>   
>> +#define FREQUENCY 200
> this is too generic... please add a better name to represent what this is for...
> specially in a case that is adding gt frequency stuff this can get very confusing...
ok, will use sampling_freq or something similar.
>
>> +
>>   /**
>>    * DOC: Xe PMU (Performance Monitoring Unit)
>>    *
>> @@ -65,6 +67,29 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    *      2352945
>>    *
>>    * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>> + *
>> + * PMU frequency events use a software timer to aggregate GT freq values over the time of capture.
>> + * This allows us to calculate a rough average over the timespan. This is why sysfs is the best way
>> + * to obtain instantaneous frequency if accuracy is intended. Advantage of using PMU is that it
>> + * results in lesser CPU utilization as compared to dumping sysfs entries repeatedly.
>> + *
>> + * To list GT frequency events, use the following-
>> + *
>> + * $ perf list | grep frequency
>> + *   xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
>> + *   xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
>> + *
>> + * $ perf stat -e xe_0000_00_02.0/requested-frequency,xe_gt_id=0/ -I1000
>> + *             time             counts unit events
>> + *      1.001189056               1950 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
>> + *      2.006388494               1960 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
>> + *      3.007930311               1959 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
>> + *
>> + * Dumping requested freq from sysfs-
>> + * $  while true; do cat /sys/class/drm/card0/device/tile0/gt0/freq0/cur_freq ; sleep 1; done
>> + *    1950
>> + *    1950
>> + *    1950
>>    */
>>   
>>   static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> @@ -90,6 +115,12 @@ static unsigned int pm_bit(const u64 config)
>>   	case XE_PMU_C6_RESIDENCY:
>>   		val = __XE_PMU_C6_RESIDENCY_ENABLED;
>>   		break;
>> +	case XE_PMU_ACTUAL_FREQUENCY:
>> +		val =  __XE_PMU_ACTUAL_FREQUENCY_ENABLED;
>> +		break;
>> +	case XE_PMU_REQUESTED_FREQUENCY:
>> +		val = __XE_PMU_REQUESTED_FREQUENCY_ENABLED;
>> +		break;
>>   	default:
>>   		/*
>>   		 * Events that do not require sampling, or tracking state
>> @@ -106,6 +137,22 @@ static unsigned int config_bit(const u64 config)
>>   	return pm_bit(config);
>>   }
>>   
>> +static u32 config_mask(const u64 config)
>> +{
>> +	unsigned int bit = config_bit(config);
>> +
>> +	if (__builtin_constant_p(config))
>> +		BUILD_BUG_ON(bit >
>> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
>> +							 enable)) - 1);
>> +	else
>> +		WARN_ON_ONCE(bit >
>> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
>> +							 enable)) - 1);
>> +
>> +	return BIT(config_bit(config));
>> +}
>> +
>>   static unsigned int event_bit(struct perf_event *event)
>>   {
>>   	return config_bit(event->attr.config);
>> @@ -134,6 +181,10 @@ config_status(struct xe_device *xe, u64 config)
>>   		if (xe->info.skip_guc_pc)
>>   			return -ENODEV;
>>   		break;
>> +	case XE_PMU_ACTUAL_FREQUENCY:
>> +		fallthrough;
>> +	case XE_PMU_REQUESTED_FREQUENCY:
>> +		break;
>>   	default:
>>   		return -ENOENT;
>>   	}
>> @@ -198,6 +249,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>>   	pmu->event_sample[gt_id][sample].cur = val;
>>   }
>>   
>> +static void
>> +add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
>> +{
>> +	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
>> +}
>> +
>>   static u64 get_c6(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -243,6 +300,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>>   		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>>   	const u64 config = event->attr.config;
>>   	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
>>   	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> @@ -252,6 +310,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	case XE_PMU_C6_RESIDENCY:
>>   		val = get_c6(gt);
>>   		break;
>> +	case XE_PMU_ACTUAL_FREQUENCY:
>> +		val =
>> +		   div_u64(read_sample(pmu, gt_id,
>> +				       __XE_SAMPLE_FREQ_ACT),
>> +			   USEC_PER_SEC /* to MHz */);
>> +		break;
>> +	case XE_PMU_REQUESTED_FREQUENCY:
>> +		val =
>> +		   div_u64(read_sample(pmu, gt_id,
>> +				       __XE_SAMPLE_FREQ_REQ),
>> +			   USEC_PER_SEC /* to MHz */);
>> +		break;
>>   	default:
>>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>   	}
>> @@ -280,11 +350,153 @@ static void xe_pmu_event_read(struct perf_event *event)
>>   	local64_add(new - prev, &event->count);
>>   }
>>   
>> +static u32 frequency_enabled_mask(void)
>> +{
>> +	unsigned int i;
>> +	u32 mask = 0;
>> +
>> +	for (i = 0; i < XE_PMU_MAX_GT; i++)
>> +		mask |= config_mask(__XE_PMU_ACTUAL_FREQUENCY(i)) |
>> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(i));
>> +
>> +	return mask;
>> +}
>> +
>> +static bool
>> +frequency_sampling_enabled(struct xe_pmu *pmu, unsigned int gt)
>> +{
>> +	return pmu->enable &
>> +	       (config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt)) |
>> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt)));
>> +}
>> +
>> +static void
>> +frequency_sample(struct xe_gt *gt, unsigned int period_ns)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	int ret;
>> +	u32 cur_freq;
>> +
>> +	if (!frequency_sampling_enabled(pmu, gt_id))
>> +		return;
>> +
>> +	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
>> +	if (!device_awake)
>> +		return;
>> +
>> +	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
>> +		u32 val;
>> +
>> +		/*
>> +		 * We take a quick peek here without using forcewake
>> +		 * so that we don't perturb the system under observation
>> +		 * (forcewake => !rc6 => increased power use). We expect
>> +		 * that if the read fails because it is outside of the
>> +		 * mmio power well, then it will return 0 -- in which
>> +		 * case we assume the system is running at the intended
>> +		 * frequency. Fortunately, the read should rarely fail!
>> +		 */
> I'm just wondering here if we could/should use the latest know valid freq
> when we read 0...?!

When the system is idle, we want the actual freq to be 0. If we use the 
last read non-zero value, it will depict incorrect act_freq.

Thanks,

Vinay.

>
>> +		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +
>> +		add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_ACT,
>> +				val, period_ns / 1000);
>> +	}
>> +
>> +	if (pmu->enable & config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt_id))) {
>> +		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +		if (!ret)
>> +			add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_REQ,
>> +					cur_freq,
>> +					period_ns / 1000);
>> +	}
>> +
>> +	xe_pm_runtime_put(xe);
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
>> +	unsigned int period_ns;
>> +	struct xe_gt *gt;
>> +	unsigned int i;
>> +	ktime_t now;
>> +
>> +	if (!READ_ONCE(pmu->timer_enabled))
>> +		return HRTIMER_NORESTART;
>> +
>> +	now = ktime_get();
>> +	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +	pmu->timer_last = now;
>> +
>> +	/*
>> +	 * Strictly speaking the passed in period may not be 100% accurate for
>> +	 * all internal calculation, since some amount of time can be spent on
>> +	 * grabbing the forcewake. However the potential error from timer call-
>> +	 * back delay greatly dominates this so we keep it simple.
>> +	 */
>> +
>> +	for_each_gt(gt, xe, i) {
>> +		if (!(pmu->active_gts & BIT(i)))
>> +			continue;
>> +		frequency_sample(gt, period_ns);
>> +	}
>> +
>> +	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
>> +
>> +	return HRTIMER_RESTART;
>> +}
>> +
>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>> +{
>> +	u32 enable;
>> +
>> +	/*
>> +	 * Only some counters need the sampling timer.
>> +	 *
>> +	 * We start with a bitmask of all currently enabled events.
>> +	 */
>> +	enable = pmu->enable;
>> +
>> +	/*
>> +	 * Mask out all the ones which do not need the timer, or in
>> +	 * other words keep all the ones that could need the timer.
>> +	 */
>> +	enable &= frequency_enabled_mask();
>> +
>> +	/*
>> +	 * If some bits remain it means we need the sampling timer running.
>> +	 */
>> +	return enable;
>> +}
>> +
>> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
>> +{
>> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
>> +
>> +	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>> +		pmu->timer_enabled = true;
>> +		pmu->timer_last = ktime_get();
>> +		hrtimer_start_range_ns(&pmu->timer,
>> +				       ns_to_ktime(period), 0,
>> +				       HRTIMER_MODE_REL_PINNED);
>> +	}
>> +}
>> +
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>>   	struct xe_pmu *pmu = event_to_pmu(event);
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>>   	const unsigned int bit = event_bit(event);
>>   	unsigned long flags;
>> +	bool device_awake;
>> +	unsigned int i;
>>   
>>   	if (bit == -1)
>>   		goto update;
>> @@ -302,6 +514,18 @@ static void xe_pmu_enable(struct perf_event *event)
>>   	pmu->enable |= BIT(bit);
>>   	pmu->enable_count[bit]++;
>>   
>> +	/*
>> +	 * Start the sampling timer if needed and not already enabled.
>> +	 */
>> +	__xe_pmu_maybe_start_timer(pmu);
>> +
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
>> +	if (device_awake) {
>> +		for_each_gt(gt, xe, i)
>> +			pmu->active_gts |= BIT(gt->info.id);
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +
>>   	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>   update:
>>   	/*
>> @@ -331,8 +555,10 @@ static void xe_pmu_disable(struct perf_event *event)
>>   	 * Decrement the reference count and clear the enabled
>>   	 * bitmask when the last listener on an event goes away.
>>   	 */
>> -	if (--pmu->enable_count[bit] == 0)
>> +	if (--pmu->enable_count[bit] == 0) {
>>   		pmu->enable &= ~BIT(bit);
>> +		pmu->timer_enabled &= pmu_needs_timer(pmu);
>> +	}
>>   
>>   	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>   }
>> @@ -497,6 +723,8 @@ create_event_attributes(struct xe_pmu *pmu)
>>   		const char *unit;
>>   	} events[] = {
>>   		__event(0, "c6-residency", "ms"),
>> +		__event(1, "actual-frequency", "M"),
>> +		__event(2, "requested-frequency", "M"),
>>   	};
>>   
>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -705,6 +933,31 @@ void xe_pmu_suspend(struct xe_gt *gt)
>>   	raw_spin_unlock_irq(&pmu->lock);
>>   }
>>   
>> +/**
>> + * xe_pmu_resume() - Restart the timer if needed
>> + * @gt: GT object
>> + */
>> +void xe_pmu_resume(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	raw_spin_lock_irq(&pmu->lock);
>> +
>> +	/*
>> +	 * Re-enable sampling timer when GPU goes active.
>> +	 */
>> +	if (pmu->active_gts == 0)
>> +		__xe_pmu_maybe_start_timer(pmu);
>> +
>> +	pmu->active_gts |= BIT(gt->info.id);
>> +
>> +	raw_spin_unlock_irq(&pmu->lock);
>> +}
>> +
>>   /**
>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>    * @arg: Ptr to pmu
>> @@ -722,6 +975,8 @@ void xe_pmu_unregister(void *arg)
>>   
>>   	pmu->registered = false;
>>   
>> +	hrtimer_cancel(&pmu->timer);
>> +
>>   	xe_pmu_unregister_cpuhp_state(pmu);
>>   
>>   	perf_pmu_unregister(&pmu->base);
>> @@ -769,6 +1024,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>   		return;
>>   
>>   	raw_spin_lock_init(&pmu->lock);
>> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +	pmu->timer.function = xe_sample;
>>   	pmu->cpuhp.cpu = -1;
>>   
>>   	pmu->name = kasprintf(GFP_KERNEL,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index 17f5a8d7d45c..fb6e3819d7bc 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -16,12 +16,14 @@ void xe_pmu_exit(void);
>>   void xe_pmu_register(struct xe_pmu *pmu);
>>   void xe_pmu_unregister(void *arg);
>>   void xe_pmu_suspend(struct xe_gt *gt);
>> +void xe_pmu_resume(struct xe_gt *gt);
>>   #else
>>   static inline int xe_pmu_init(void) { return 0; }
>>   static inline void xe_pmu_exit(void) {}
>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>   static inline void xe_pmu_unregister(void *arg) {}
>>   static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
>>   #endif
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f47a6e1b109c..5d873bae4a0d 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -12,6 +12,8 @@
>>   enum {
>>   	__XE_SAMPLE_C6,
>>   	__XE_SAMPLE_C6_LAST_REPORTED,
>> +	__XE_SAMPLE_FREQ_ACT,
>> +	__XE_SAMPLE_FREQ_REQ,
>>   	__XE_NUM_PMU_SAMPLERS
>>   };
>>   
>> @@ -28,7 +30,11 @@ enum {
>>   #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>>   
>>   #define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
>> +#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_PM(1)
>> +#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_PM(2)
>>   #define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
>> +#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_PM(gt, 1)
>> +#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_PM(gt, 2)
>>   
>>   /*
>>    * Non-engine events that we need to track enabled-disabled transition and
>> @@ -36,6 +42,8 @@ enum {
>>    */
>>   enum xe_pmu_tracked_events {
>>   	__XE_PMU_C6_RESIDENCY_ENABLED,
>> +	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
>> +	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
>>   	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>>   };
>>   
>> @@ -116,6 +124,24 @@ struct xe_pmu {
>>   	 * @sleep_last: Last time GT parked for C6 estimation.
>>   	 */
>>   	ktime_t sleep_last[XE_PMU_MAX_GT];
>> +	/**
>> +	 * @timer: Timer for internal Xe PMU sampling.
>> +	 */
>> +	struct hrtimer timer;
>> +	/**
>> +	 * @timer_last:
>> +	 *
>> +	 * Timestmap of the previous timer invocation.
>> +	 */
>> +	ktime_t timer_last;
>> +	/**
>> +	 * @timer_enabled: Should the internal sampling timer be running.
>> +	 */
>> +	bool timer_enabled;
>> +	/**
>> +	 * @active_gts: GT active mask.
>> +	 */
>> +	unsigned int active_gts;
>>   };
>>   
>>   #endif
>> -- 
>> 2.38.1
>>
