Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5EDC71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 23:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADAB10E740;
	Wed, 11 Jun 2025 23:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3G5eX2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5343610E74A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 23:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749683028; x=1781219028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LKvuqpILJWRjSza2dL1/ckQUGUfh+eeI9h24b8p9nd4=;
 b=D3G5eX2HGFIrAA+teEvn0T3KBP0BgT9GH4QOR55dJ1eTVaC6xKjEqWKh
 ftk8Ia9fzifoMP4+PCWYpsQfILxYRpYo1//KKBRhHJu1TZvJMe6QOK/Iw
 e59aGxwBYY45C5/7eFzSffabxbP+ERtf8T7k7/7KY2qMUVP7ULoY4K+Pt
 dLTgGYSc1aKODEe7TrRAmskzzAHzSrYxJqyTVsxb8r05c2dr9oL6qMK3L
 skbLqGy/6A2guWrW3fgnNJjuD0gJKywTvvzRkJlbvS8FA5ZnbwheT/B90
 tc1ynNrZwjl4ULFygE43MrEMxwIYlaFwkRYXoXcDuzccx+WLO/qIuAvSi A==;
X-CSE-ConnectionGUID: iVoYXFuwSH66sGvWH+ZIfw==
X-CSE-MsgGUID: QsWnT2FyQ3Cv3kS5Zlq+fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51988222"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51988222"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:03:40 -0700
X-CSE-ConnectionGUID: bjNyGf8iSnGb5niII7hmqg==
X-CSE-MsgGUID: VeLvx3oGT2GtzXolvg+1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147233965"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:03:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:03:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 16:03:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWKOFQLMCpFSf8mCffoI2jopBrMaj8vvnn3i0UCpitcCU9p8WANZI+6IBBuT+cp/yefUbXBC0xCv8IgWvhYoie/UAYY7MS9V5Q5BhUUUDAZGX+0rogdWR0vLfFIW+JnPZqdoF4SKeKnzhsZQ/7YNdNm8h+iWU0rjxEhLuVh4mCF1jsyM87ujzlTAJ2Lvzvy6SZ/FpaJY/sOwIaI0FIX4XbIbFgwkG8sug6ksrSJSMe+VU+3Nx1EiDW3QqwxDJKYz4KwAks2UnEIv+JBTLGV+hUWsHxTtLD7O2bTburPAKmldDoCIiQENmZyjCR5/12y2b6zQXcQpxGvwASB662do8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3cHWahpl8EDRxdkQ3XUzlu1OWDEOkPbVhavS532NME=;
 b=IQ7kfQQvBg8T5Fl+Mx1Tnwa/lYnR4SlOymE7RbnQMcYsKvN3RitIwoO6cuxyXxNiXhhJcnRxv6k4+wCt5qIldUa+rTH1puDx8QRCAX26fL3y+ld38S55sSGDn7lEf2nMPLf+UXT5Wm3qMu7Zw/EgJXKPerKN5oM05ZujnI1UyCZqoy+SaqPKnhNl27sRAXlL7NcD0o2Ln1hAlBUdwJK3pItefJjNzF2iLyYhs+Y23eF6mVt4Udc1N0uVoObFwgDGqDOb2dcKRE+gqZxOTcKTHkFqqzohv+c0sf3mOlFttIfwunWjYEB07axGZnbI0nuTzrUZV+rLFZP0anwvSzbpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Wed, 11 Jun
 2025 23:03:08 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 23:03:08 +0000
Message-ID: <d37d5031-67cd-4811-962a-c490806a6f17@intel.com>
Date: Wed, 11 Jun 2025 16:03:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xe: Recommend GUC v70.45.2 for BMG, LNL, DG2
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250604212420.557712-2-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250604212420.557712-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee7881c-7cb1-4eae-1ccf-08dda93c217d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkp0TG5MN204aytHUFUrNFZRNUxOR1BBWUJYWW9rMGRRVjI3ZnRoeHBlamtE?=
 =?utf-8?B?bzhaVXpsY3FGcFdERFRoSzVVb0hDc0FlMXZ3Rlo1M0YycGRBQXZRdXhlaSt5?=
 =?utf-8?B?blE2QThCZUF2cFJjYUp6UUVtMHJZNU5GK0FWSE5NMGFtb2VtcVVpNjNzV0lK?=
 =?utf-8?B?a091WitpQ0t1cENrNFhzYi9zK2VUZ3hNbFFXRURHZnhueWFzVTdwaWJjaWFQ?=
 =?utf-8?B?VjdNNlArdmpERmkyZlBpTFJpTGNTMmU4OEhkZTBrUGdlREJjSUtneHBydkJ2?=
 =?utf-8?B?enhBK2w5NVNJL01zUjVWLzVaWm5mWTZZTjVnUW93clNZRFg1RmZCQnA2U3lG?=
 =?utf-8?B?NUErL3h4eXZxZlVBVmlVNVlzNW9YMXdlYkpkcUtucVRBZEU5Yyt1UUkwOW5P?=
 =?utf-8?B?anhIZU5QUzVDV1RvcTZqVm55K3phVVRXN2h0N0RuSTY0bGlPVUNwL2VCY1Rm?=
 =?utf-8?B?dGZtQzdCVW5sTmhESHZoZDFGTVZ2WDZ3TitFVnlHa3VRZ3pXNHB5ZjdnQVNr?=
 =?utf-8?B?UHpkbXFHVTNtUnliR1JyUG1VN1dGRkdyV2ptcEg3ZWhmMEc2YUd1VDhBRTJB?=
 =?utf-8?B?Y1lKSFFEYnJzMU5UaHlQaUhqK3h5eXhYVEYyd0Vjdmk5Y3Nncm1xRWRsVjUx?=
 =?utf-8?B?bVN0dlg0RVAyS2hpWDEzZnk5eGt6OG55elpSeGhEVnZuQlRPdUs4cDBxWVYr?=
 =?utf-8?B?V0t1OUEvQTdWbmR2SGhycFJ4OHA1Ui9VSjdQRVFqemRpQnJjaSt6UEZqZWJx?=
 =?utf-8?B?bERWL081NTV4ZXBQdWRZNitudVBwalNDUDdPWnh5bkZwaUpaL2JvNVM3UUtI?=
 =?utf-8?B?NTE5R3BLV0JOendxS1YySmsxdDlTaW9WNlQwOThOYmhKdkJNd25XYkVPK2NT?=
 =?utf-8?B?Mi9FNDZUL1k4QjFBNHc4Nk1FLzUxOS9Tb3JJZG5jazNHTE9vbHA4c0kvdUh6?=
 =?utf-8?B?Y2ZseDVDRmMyTjJWMVVKa3ZnMWdSSStyck9LbzNuc0FWWkNDc1pvYUI5UlRH?=
 =?utf-8?B?aEU4bE0yVVBrdlJJbG1yLzJEVVRNWEZwLy8yd1Z1VDZMM09lL0haRmtmQS8v?=
 =?utf-8?B?V3Z0RXQ1clphVk5OMDFtSnVvZzJWcG9lOE9jbG1QMVRxUWtDUHRuZHhKNGlC?=
 =?utf-8?B?dXBCQmsxT3MrR3RkaEdxRUtEZkFCZ3F2K0lIM3U5a0hPTFJQRURTeWhhTWFU?=
 =?utf-8?B?V0ticVlycUtwQUxZNm9rSUdpSEtUZjg0NlZKanlheTgxYVFYRGdncUNEL2k1?=
 =?utf-8?B?Q3ByWk1UdXdqT21ybkpBMjIzYmZhYzBoNVRtRDRTUGMrTmlwb0RsSG5nNnVi?=
 =?utf-8?B?dTlhNU9jVEk1Z0o4N2VacnJWWjRtajg3MFlNNVBrMzRHaHBzUTlpU1p5M1Y2?=
 =?utf-8?B?dlRtL0ZGd21HWXdKMWdMb2JrR0pEejVxYVBzVnI0b2pVWVRITHpPMHhsWWhn?=
 =?utf-8?B?ME9yK3FxV25aTFdiMHNmV0c2ZHJ5UnJhSEJOdDJTQXg1U3VmOE1Jck53NTlS?=
 =?utf-8?B?dnptZFJ5QTg3WDFpYWsvRWVHblNWbkhCNG82ODdjV05xYUl3WXRnSEl2dUti?=
 =?utf-8?B?d1pSdVZIbEdBb1VSbnJuM0cxVTE4bVlBNWFzTFk1NS9BUGJITHNBTjVBMkx4?=
 =?utf-8?B?c0ptcllLSnQ5TzdBRXVBRlNjNVdxUGR2M1M0UjR0blMwTS9iTi9SMFZXRnlT?=
 =?utf-8?B?RXFxZjJZbFpFYjRUMzJyOGhmS21rL3JrOE9TMWd3ZWpVc0VtQjQrMWw5S0xw?=
 =?utf-8?B?Q0pDZUhUQllSYSt3aEtwTWFCcFdUejNLS21xczJucFltM3Y1UUhXUkUzelR0?=
 =?utf-8?Q?m6oUIQtBp/ZGSMvqEMXFaIKdIa1h+amu5N0fA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnpPRHd2ZzBCMXdmaTByNk44aEVueVNhUEFPejB0T2FYb0dvcFN6S2tVQTdv?=
 =?utf-8?B?aVlSNDR1MFJhKysySDNmMWU3UTFSMzFsSjRvekhwc1RYN25tMklXZGlRdzBT?=
 =?utf-8?B?bXBCM3Y5SmlJT1BseVg0UWR4TW1mRDYrOXQ5QTNGMCttT3lpaFJxWEVjNXI2?=
 =?utf-8?B?bEllbVhPNm05ZTNVaTRKQWFWcjNtYVByTE11NEdOVklDR3V4U3FjbXRJd1RC?=
 =?utf-8?B?anhoTDIvRFQvb0RNUEtKR0tyQ241TGlFZk5GMjhXWmlWeVNVb3BBOExURGwr?=
 =?utf-8?B?Ung0OGwwa3dHNTlpM1FRQThKRHZ1aUFsMFJGcWllbEFReTlqaExpRVlnTmIz?=
 =?utf-8?B?bThRWmJ0Rms0V0VPNUVnbk82ckZVeUFtQ3dsUDF6TjJ4SUVwdTljaUNpR2I0?=
 =?utf-8?B?R2JhdWxNNW1aYUdUS0ZFV1NDODBDc3AvQ2xaU05DeDdGM25nNm4vaFVtTGFj?=
 =?utf-8?B?OSt4bFlYZkVUbFdhbFdRQlZZN0UwVmdxUllldm1pSWoxVXltOXlGNUkwZFNH?=
 =?utf-8?B?YittUUhRMElMMUViNkJVaWJjSDU0NmJNNjBKSnJsbmFxT05Ya0hvcWdKRTNJ?=
 =?utf-8?B?ZWFLZGdPd3k2VksrVitpT01jUkZuUnF4QmtRTGY0MjJhMGNmSTNwOTBUeDlZ?=
 =?utf-8?B?MTFMejhVMnVFOUJ5TEo5OWlrN3VHd0JDdkRaYStuREtMSmozWW9Za2ZLenB4?=
 =?utf-8?B?NU9xaitLb1RJcFZvR0NKTzIvNmRoZkNuWjFjdkY3RndaUUJXZUxtVzVVYXR2?=
 =?utf-8?B?Mys3UUFHZ3dKR25tZHp5cElMT3Y4RTJwQW96djRoSGhoajdwT0RYUlc3R283?=
 =?utf-8?B?bHVYNVZuNU1YeWFoUnpOSnFnclBIS280UHgwUVZLWDJXUVRHS28yVWRzY04y?=
 =?utf-8?B?dGEvTkhjRzJKZFU3cHF3emZSS0VPMHUzQWpEc2RYbEtsT2g0SXlKS21keVVp?=
 =?utf-8?B?ekt1NXoxOW5zYkF0ZHZ3SVRBa1ozR0c1d3gvN0dDU2s0ckxCbkgrK3NCUWRT?=
 =?utf-8?B?aW9LUDJuMWRBWHNQRjV6SFM5MW04SEhaN1R0d0pMbXFHWjdKMytkOXBGOWFl?=
 =?utf-8?B?QkZUWVZGQUl5TCtnMjNyMkgyb0lURjIrYldKSTg0bEtla21EdzJlaHlKNkdI?=
 =?utf-8?B?UUM2alZHY3BscHY1V3JuZzB5aFB4YktZZTFjYmIreVpZK0ViRHVPVUJ2Uzkw?=
 =?utf-8?B?cHBnVkpjdEdISkxrR0JUeThWZFdLbUsvK3VqOE83UWlZOTUwMkdIWG5uenQ5?=
 =?utf-8?B?eTVhUGhoaDRZeC8rYUhrVVhIS1VQdll0aXdwRTQxYW9kcmxFcjNVTmxKK05x?=
 =?utf-8?B?a0ZEV0VxdENxY0N6SzIvN3lYUDluV0tJeTBrR2dLenA5dnBwMmwrVk5kZG40?=
 =?utf-8?B?cEorcnMwU1VwbGE5SUU0Q3ZPK1hlVzdmMUJNYmY5Q3IrT0M3V2FkZTk5K3Zs?=
 =?utf-8?B?NjAvUUVpNUluOVFURTV6YXFyVWxRVU92dGpkNXZ6VEJWN2RqbGJBUTlVSXg4?=
 =?utf-8?B?OXZETGJvSUZCTDFuWFpxdi9MaHVqNWJRUkEwUjRWZ0wxT1RmQnRlM0xqbzUr?=
 =?utf-8?B?TVdhaEdubDN3K2dYUVg1VlZ0V3oraXdpaWs2eWZlbVZ1b1czQXFqSXRWdUw2?=
 =?utf-8?B?dmlSVnRPTmEwaXNuVGFJTDJBV1prQ3RGbnJ4WXNobDNHOVBxOHZSS1A3MUhF?=
 =?utf-8?B?di80eDEyTmFaZzdOUmd5UEFGdnBDRDVTcWRMR2o3RjRtSCtIWDFKVTIzOS9Z?=
 =?utf-8?B?TjlTRklqWDlqTTY5cEZQRlU3b1U2RzU0U1l5bmcrUWlTSXUrNzJRM0ZXWFVi?=
 =?utf-8?B?WkdlVHZzekVXZkNHbzdiUXFQTlBkUVJqcDFOU09rRnczOGxDbWpOWldiRmRK?=
 =?utf-8?B?UExjS3pMamRXQ2VQVFp0elNuT1dRbG0vSGxxZXVpMmZNMStsUStVdjd5aFhO?=
 =?utf-8?B?bS9va25qMjIyaGhqL1hTSFpFbkhISHNBaGJRU3haQ1EraVRqa084a2RpOUtt?=
 =?utf-8?B?cXJ6bjV3Umh6MXJIUWF4cmlaMXpkVkc4M1lwUFFGSFpZZllGbUtWR1JTNkFy?=
 =?utf-8?B?Zi95cmhsYWwxY2FKbE9jUk5IMDhyQWxQR1NwY1Z2ZSt3bzRyMVZPWEJFQW9u?=
 =?utf-8?B?NC8vMFVyUVI0UDVsU2hzSFNKZFY4R0FOMHc4YXg0SzNoOUdNRWx6VE13THN4?=
 =?utf-8?Q?zaW7f2MkrCC8RtaKaMm9LbU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee7881c-7cb1-4eae-1ccf-08dda93c217d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:03:08.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvrcqKeX30yTxVKAxmKGFQlfQp00NuT2thFC4mR5cUhPyAzyi5Li3HKK5jK5xhsPt+PGV4/KHgs2Q/4k3rpE6oBqwCpERMzVVr6G4xortmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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

The change LGTM, but we can't merge it as-is given that the PTL def 
comes from a different branch.
I think what we did the other times is post a series that did the following:

1 - revert the patches from topic/xe_for_ci
2 - update the recommended FW version
3 - re-apply the patches from topic/xe_for_ci updated to apply on top of #2

e.g. https://patchwork.freedesktop.org/series/147235/

On the merging side we can then sort each patch to the right branch.

Daniele

On 6/4/2025 2:24 PM, Julia Filipchuk wrote:
> UAPI compatibility version 1.21.2
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 7b2d01d39b86..bf52844c4d83 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,11 +115,11 @@ struct fw_blobs_by_type {
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 44, 1))	\
> -	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
> -	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
>   	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
> -	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 44, 1))	\
> +	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
>   	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
>   	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
>   	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\

