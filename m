Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16485C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 23:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9FB10E906;
	Tue,  7 May 2024 23:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kktREpa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360F211301A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 23:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715126379; x=1746662379;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QEYG1UivmUa0/OBi8vHtecsC9yXQGmfeh0cljVJfTRg=;
 b=kktREpa8xGoGs24oL57U4aHOtCKZqKpDWdzh02mVrc0JRVUY6Waun+Yc
 miOSp3KDJ2L3LL3aw2s9D9tac5oqvuv9zlpRxkRILHTGrWS9ibZtb6vuN
 RFri7W/ZauW0X0f8Laut3bOeHZX4kCIFyPBJsHfc+VCk6ZbbU9TWILRok
 Bng0b58rpNCk9nhOAP5eWR/j/NRCcXaxHpkIm6M4V4A3HnV6tXghfyfkO
 I4fFpPaNL579c9CuyVVuwjWASNmb/I+zte9DQ7Jksdn9fky/fcfvz2yzP
 +crCdpZKaZLudieAuW+K4T7Jw6i7uH3OMoL7KoQYOzAHq9xzW7pXqI4bN g==;
X-CSE-ConnectionGUID: PDAudmI9TiqmBWsDgyB/Dw==
X-CSE-MsgGUID: TBK1szi3RHOjtCtVnoslZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10814806"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="10814806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 16:59:38 -0700
X-CSE-ConnectionGUID: YJ3DF6ZbSRaIpzb1p1iU/w==
X-CSE-MsgGUID: Xj4yX5KiRy2/yxPszE71PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="66119553"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 16:59:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 16:59:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 16:59:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 16:59:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 16:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiLualHYBIvG7rf5JLpwSlwme+FAgsi3poYlKAihxADU0NgCzGdmYLkapDjpsGE309/E7fl4JEx0BiYA19HkeqUrQLrSgdOtNEnNFVISpNRuxbx5xY7KhLU0GQ/+C6I2MS1xKZE8asaBxwV2fNm/GOsph/kiVEsC9JbUtvi3H2WbbvvQosy0PuKRvIwRVFcieprgrhzm0APrYdqhTlTSLaE7XlgNsLK3If6UuiC0/yTM9eFf5Be5WNA0ujGhab1OYb5n78ml7H0COTKNPHRkqBi6wSzUVVH5jCYqLBVwMK81vn+6vKClK2DAxJLMn3V3aiPXbrxhu5oAV+zfHx4NdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnNP5Vvtetd6eUsv73cUqmg0Fx5GgRXN7LNbCJgnS4Y=;
 b=fW2pnnr5ikFDfS9QObLFVMaCfjoIHhpFn35qGmqDQAarwGBkAKijym8my6Mu1PX+81OPdTXpxZRSLP5w8lO2gQna+1SjavaLTAAef+BXmHMNI4gIqnN0iU4a+HOaECo7YaYtYq4c8mmipVSyCF3jsAbO7k6/do8S2NGlUqOIxJ/gKRJvI2vyXog8l3aYwEsnvwBWrnXP8AV7gtg00nw30UkSgxLWBR3aAMe0qiNHa35D5q4YxKOGJLmPezdYj+0VXZpfuY4yyTk/DjvCtIC54YbqAGQMyBmydINsxFa8ONCaZ6Q9Y67tFCBAc3y92RHtMSx8JAbTQfKR9g3ZbEgq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 23:59:28 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 23:59:28 +0000
Message-ID: <faaa56a0-8579-4294-ba57-fe63c1f429fc@intel.com>
Date: Tue, 7 May 2024 16:59:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Only use reserved BCS instances for usm
 migrate exec queue
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
References: <20240415190453.696553-1-matthew.brost@intel.com>
 <20240415190453.696553-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240415190453.696553-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: b1deb265-99a3-4446-84ea-08dc6ef1baa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk4wQzlXcUN0bElsUStFRlRJVGNFNldTZFh1NFJOTUEyWWdsdkVTcnFDUVRN?=
 =?utf-8?B?UmtGdVM3MC9HSis2Nld6dVdHYmhLT3lFQk0yaDE1Z3ViaHRUTFY1R2VDTi9F?=
 =?utf-8?B?MXQ1RlZvcnp5ZU90NHk0TmRoRitrUEdxZS9FVG1wTFJXR01tRHQ0L2F2TkZX?=
 =?utf-8?B?MWR5M0RCN1RlWmdnUXBRODNCenpyYzFIQ3FLWTNhV2plQk5JNytWL240cVY1?=
 =?utf-8?B?QkpXWEpiemRMbjlxTXJkK09Za3NnSFVZT3ZHdDFLU1RIUFVKUmFiTzBVaVFF?=
 =?utf-8?B?RHQvWStONDY0TkFzT3JPNGZHTmJwWGVEeUF5R1AwZVduWmw2aHJGSyt6bGNi?=
 =?utf-8?B?NzUvd3dWRFh2MjU5L1B3dUJPbWdxZGR6ZFo3YmhRZS9va3VQdERMNmZwNy9q?=
 =?utf-8?B?MzJzeE0rSjdnd3FoRDFBOW9MUnlZR1AycDk0bE5kQjBwandmMTZuWStKT20y?=
 =?utf-8?B?dEdRcXpXRjkvaHhNUXg0YVpCbERPUHF0dmN0aEtHUjU0UEtlMklHeVl1dnlX?=
 =?utf-8?B?eFdLVjFia0NvSVZ0QTFJZENhdlFXMjJwcGtpK3JFNkM4dHlCeE1xb3hDRUxM?=
 =?utf-8?B?ak93dFdBeGlUNk8xM1BhdnNNSFlsZ0ZzbE9UejBLaUMrTk43U0ZtV0NzOFBx?=
 =?utf-8?B?ODZWWXg5TW9EUzc1YnZiQTZOMmlKTlJPQkZDZnhOZTZGQ0MxN3lyMjV1UGxu?=
 =?utf-8?B?bXB4TVdmcE8wRnVDaG9jMGZhZVJ4N2c0RVZ3S25SVk01aThLeFVUdHFya0xB?=
 =?utf-8?B?YzNUV2JncmpaVldVeCtWeUdSTTN4Z08xN2dRRkhhWVZteWxZemdmcSthK2lY?=
 =?utf-8?B?WGN5SUhzZ2l4RmFVZUk1ZDVBMVFOdG91UmhaODltS282cURrMi8vTjhLVzVK?=
 =?utf-8?B?cC9KL1p2cTViZ0FHSkR0ZU5acXNpN0JoR0lDYlhuT1ZRWnRwMVd6NDFRRjE4?=
 =?utf-8?B?T1o3cXlMNjcwMk1YTkFyY2xoaFhacEZTZTltbEQ4aEdZbnRCZTRHbzZKL0Vx?=
 =?utf-8?B?ZjVhQjJWYU1FTERsWUJVdUtIMURnWk9oTWZtWkFwRkNSOUlBMVNheW4wT01k?=
 =?utf-8?B?WVFOVFpEYWpWY1QzeW5IZVozUkNzMEpkb0xnMzhHYktyM0hrM2psQVZnZVhU?=
 =?utf-8?B?R0IxNEU1bzVMMERIRHpXTVM4NGpzMDgreEUrd3Y1bzZaUXdLd1JjNStUREhp?=
 =?utf-8?B?MDBzRUZoNkNKRWZ5THZ1QTU5bWE5TUJsRG9FRTZ4dzBYbFdGdXd6TkhFdDJh?=
 =?utf-8?B?WU1GZ3RNK2Y3R2IyNWZkaUZGZ0RUL3B3ZnFPdkkzUGkrVWlZY0JrZ092WHN2?=
 =?utf-8?B?QkRQOGZMdCtBSFJGNGVVUzNmdElRdE9NdzFqYS9RTHQxQTN6ZFRFRHYveFdJ?=
 =?utf-8?B?ZUJXTG93T0J0T21EVU5keW5uTEFndWxtZTZGaThjMDZJSllLbjErVWNwbTJZ?=
 =?utf-8?B?dFk4SjdpeklSc25NWmdtVDBoUEZ3ejhkeFA5RGdmT3FIV0tUY3JKRU1kZndV?=
 =?utf-8?B?MTJ3eHdjVFlUaityWU8vL1lraVlaZmtDZDlIb2Zkb2FkcndhMnBMdWNRblFk?=
 =?utf-8?B?Ymc2V1ZpbXhxdEZ3Zkp3NVNLZzdUNkdXZE5Wc3NLeEM4eWluWFNsa01tSkVV?=
 =?utf-8?B?VXZjQVI0QmVKRjAwZG5kT2lGNE5wM3ZsV2hldHhScEsyVWhBWXNONi8rSVY0?=
 =?utf-8?B?SE5XU3pWMFg5a0JzY24ydmR0YXdCZklUd2FrWDl1c0tnTjZhaDRvaEFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVRXNzY3MXdPS3pwQ2dPcVNWa2lId2c5ZEhzVlA3RmtJcCtuTXBpb2E3UHk5?=
 =?utf-8?B?YzcwMFdacDc4YWNTR0NOQlE5UE1aaHgzRnZsSWdvR3o0KzhFd1JGN3ozKzdH?=
 =?utf-8?B?U2RTMVZKTTZkekxqYnlrWnZqK1phVFBCaFhyUms5K1U0YSs3RnNCUGI0Rjda?=
 =?utf-8?B?b3VPbEgrR1dFSTg4dU1VSDUrZkNPNWh4Z3NveWo5ekdwWllsaFBtdW1iYVRX?=
 =?utf-8?B?Rm9IZndxVTNqU0hPMlhXNms4bTdZdyttb1MzTFh3c1dRbEw1ano2N0lQZjZZ?=
 =?utf-8?B?ZW9vWFgvclMwd0NuSEhDR1BQcVczYXhOaE14OVJyOEVhTEwzY0VRYlJYb240?=
 =?utf-8?B?Rkhmb0hnQUFjSm5EaVBmTStTN2x0MXU4c3oydlZrTUtNUXNvWklEcUd0TUNj?=
 =?utf-8?B?QmFOZTVIM2V2QVZiWGxubVIwRjA0UDNMYzdHNDhaY21KNHhFZTg2OW5oRjFs?=
 =?utf-8?B?TWkvSFBwMDA0SmhodXlwN0JjbHAwZm05WFpiUFdreHR1UEs2NE9SbTVlUUJM?=
 =?utf-8?B?OFhQMFpSS1lmUkVCRlJSMDlXd3dWSC8yV21ENi93UE5IazVsS1UvWitqcllL?=
 =?utf-8?B?QUZMelZ2cFg2TTlDMVNZS0pPdXl1MldWQTU1ZGFkNHZXQkRZM1RVRlBiRUk3?=
 =?utf-8?B?WjMxeHFSVXNOWWxSVko5Rm5qWFpIa1R0di9RdXZvV1M0NFFJYlFjQkZYME5q?=
 =?utf-8?B?Vk56enhDNEE2ODNlZEZhREc0ZUpPWDNrVS9qc2s5U3cwMExTbWF1NEtSb0p5?=
 =?utf-8?B?dkN5T3Z6NTdaanY3ZkJJTm1iaTk1QXJVVlg2d0RTWVpIbjIvQ1VJb1luM0tw?=
 =?utf-8?B?QUc4RkhJRUFYbmNoaStSVnRUbjQyTU1ZTUtlclVMMnNqcUpLd1U1Sk0vZzBt?=
 =?utf-8?B?RGJxeENVci9Qbk1FVXg1LzFTU1lNdWJhYkdlSGlURldwbVhjalRXeDZtWVlv?=
 =?utf-8?B?bzBtYkROWGdJTWNEYnc1TjBLL21RQTJxT3JRbG5KaUVBcWROMng4MHIwRUVP?=
 =?utf-8?B?VzZ0bTVWekdaS0I2blRsNDFkeHg2aVZjVUc1TGNXMnZIREdaakNERG1sMTZu?=
 =?utf-8?B?WTBVRFptdGpyU0cvNnAwU0d0WFJNclhLZnFLZEdYZXNDRXVLdXBJbVBRUHgz?=
 =?utf-8?B?NGduTnljQnBpMmZtck9DcFVUNHU0QVp3OTdPb3pkRVBDN2ZlazliL3RJTTE0?=
 =?utf-8?B?dUFrTnlFYTVpU0JRQ1RlbmZVNWgrSVlwUGRjRU5EU2l4ZTFvUUE3Z3ZKVDcy?=
 =?utf-8?B?dktpRVVwTjQ2NGwvR2VGV0FjVDA4MUhvM01aWmQ2U0JuTU4rMHh6VVZkMExS?=
 =?utf-8?B?TWZkZjlqSFdFTGdKcHhoSUhZa0owYngzZmRRZHpsaVh3SVdkT1pDYnJRNlFh?=
 =?utf-8?B?aGhZNC9wYzZySnBVamVMaGtJRk9GYm5wT0VCWGhZZE15a2dIQzA1WlYwYStL?=
 =?utf-8?B?cENST2JiWWVZd295cnN2ZXhtQ0RjeXpXN3lKTkxTcytDaFNySlJDaFZZM3RI?=
 =?utf-8?B?a1RjZXR1aVIzb2ZWbmpsNkNlUlBPZHhBc0wxNjd3Z1VhcVVWVk9tTDhJenhv?=
 =?utf-8?B?L2dBK2RmcFE4TzBjU0J1TkJXRmhLUjlaME9WRkoyZHpIT1VJUWlYSzd4NTkz?=
 =?utf-8?B?QWZFS0NXYWF4TnV4YW5TTWRyaDlTNENjYmZJUy9VVmd5U3YvR0NGM0d4M3lQ?=
 =?utf-8?B?QVFSQ05hTEtVNGVnYTlEbGNud2Z6Y1NUbjdndU45SzZTZlp3eVdkMkZkSm5z?=
 =?utf-8?B?U1NuNHFIM2JSMGtPWnFueTlBK0NtSXhOV3Y4SUhaQTdvUTd3dDBkSTRncHNJ?=
 =?utf-8?B?YmJXTUhnMHVRQlpBeWNSY3lEZ0RZb0h1T2puc2tBUDRlbS9jbGVnemM1ZmZN?=
 =?utf-8?B?R1hOMmdMODNZZzRvYXRLakxKeDJoU2dNd1JId0FwMFNnT2xZcEJrRzJMMk9t?=
 =?utf-8?B?M1BxWVdOSVFnaTNhaHZJbGhjckxCRXJxeVkrZ1dWWnk0ZFdMMmdKRHRvbnVS?=
 =?utf-8?B?c3pyOTVrV01pM0lMaUpJNkJUbUc3ZXRqZStQQXR2SHBCWHVkQ2luOXNLSGRU?=
 =?utf-8?B?SlVDSUx6bFdCdSs0eXlTbnFoMmppbk5GeFJqY2pjczZBMUh6VHVhbFNPWGI1?=
 =?utf-8?Q?n9uDBNil18Cr/xsvSTlo6fxgJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1deb265-99a3-4446-84ea-08dc6ef1baa8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 23:59:27.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j87RdYuCxEk0N9Px5NHLbIpV01f8snTjS2JQuDa3fdeHKt/CGWeiGxXUMOm4CzPtKznP9g44HQt0O+ucmm8nJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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



On 4/15/2024 12:04 PM, Matthew Brost wrote:
> The GuC context scheduling queue is 2 entires deep, thus it is possible
> for a migration job to be stuck behind a fault if migration exec queue
> shares engines with user jobs. This can deadlock as the migrate exec
> queue is required to service page faults. Avoid deadlock by only using
> reserved BCS instances for usm migrate exec queue.

So the underlying concept was always broken here?

With the mask of more than one engine, the virtual engine still won't 
always pick an idle engine?  HW may end up picking an engine and
confusing it to have been idle?   Because the extra 2-depth thing is not 
being considered?


> 
> Fixes: a043fbab7af5 ("drm/xe/pvc: Use fast copy engines as migrate engine on PVC")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9f6e9b7f11c8..c37bb7dfcf1f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -12,8 +12,6 @@
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/xe_drm.h>
>   
> -#include <generated/xe_wa_oob.h>
> -
>   #include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gpu_commands.h"
>   #include "regs/xe_gtt_defs.h"
> @@ -34,7 +32,6 @@
>   #include "xe_sync.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
> -#include "xe_wa.h"
>   
>   /**
>    * struct xe_migrate - migrate context.
> @@ -300,10 +297,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   }
>   
>   /*
> - * Due to workaround 16017236439, odd instance hardware copy engines are
> - * faster than even instance ones.
> - * This function returns the mask involving all fast copy engines and the
> - * reserved copy engine to be used as logical mask for migrate engine.
>    * Including the reserved copy engine is required to avoid deadlocks due to
>    * migrate jobs servicing the faults gets stuck behind the job that faulted.
>    */
> @@ -317,8 +310,7 @@ static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
>   		if (hwe->class != XE_ENGINE_CLASS_COPY)
>   			continue;
>   
> -		if (!XE_WA(gt, 16017236439) ||
> -		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
> +		if (xe_gt_is_usm_hwe(gt, hwe))
>   			logical_mask |= BIT(hwe->logical_instance);
>   	}
>   
> @@ -369,6 +361,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>   		if (!hwe || !logical_mask)
>   			return ERR_PTR(-EINVAL);
>   
> +		/*
> +		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> +		 * PVC, may want to revisit if performance is needed.
> +		 */
>   		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>   					    EXEC_QUEUE_FLAG_KERNEL |
>   					    EXEC_QUEUE_FLAG_PERMANENT |
