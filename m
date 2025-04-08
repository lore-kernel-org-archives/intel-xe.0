Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D96C369A5
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 22:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B311C10E785;
	Tue,  8 Apr 2025 22:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUBmn7wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D626610E785
 for <Intel-Xe@lists.freedesktop.org>; Tue,  8 Apr 2025 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744150553; x=1775686553;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=afSYSNfmERHbabrup7c+1MJjTrNn+c797GNnev9NjL4=;
 b=PUBmn7wxVTuonUbrWhihN2KzoObBqkeZOV4PgsC5hTKfHCHqP2K205jf
 6JJnLh/a7teYPrQOMdKwk68Pads5RDq1zjCfcrJlCHnYPvvy8QlNJ1zBm
 LjraDA67Pc8kq8QiN80TvbsS2xJjepBww0ITlovMioueDKy/O7dej/e/y
 qBVzUblUsotWHfNU3Q3enKQ5gvzpEwy74hlYjzjhPyMuVaYjMsF0OBpRT
 CGpCTW0Q2ba+1IegDi78yv2p6szSkOFk+L5CU1acIrkmWvCJBeICVhupw
 X8dyRNJCERfLCPKgXvKiKGiv91C2IQbtY3wnQpLWvZJzo9ykBSWXS9IIE w==;
X-CSE-ConnectionGUID: 41FLWTrkSMWA+enMUdntww==
X-CSE-MsgGUID: wg2H/+OjS2eV1It5NBug+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44748977"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="44748977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 15:15:53 -0700
X-CSE-ConnectionGUID: g17MKfevQKevGc79hjNWlQ==
X-CSE-MsgGUID: XAjka3K6ReWk/uXnkoFkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133266408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 15:15:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 15:15:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 15:15:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 15:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHmPKSLyuCN9+5AxZtqUitk67s6jyXo0EEl+hNzDJYyhYXUmQc6hm7lwx7otlsiQXKvHDGGZuS8hFZCHgMPq0k4sVGqaWGgyLii6KSe9euIGFuG8UzET7Cqve4T23gMyFt0viPRMcBwGiMdN8n0DJDi7dWj4h47FnXM0fX0QdsfiMgktq4QaBY8QOt3CXPdEaylbNq9Jp2nF56FQ5nnB+LBz4xekmnz5QyEgaPrcF5TmXBk8f3t0feifNzAjnLqI6PenHGpUOalKQ3MFxwoBUlTNNHFsATWsQ2QODMUj70JgnGXuUiVSU+VI1OUwE/mfDjy7CndIhnV7ASB55LW95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CXbirTIpGGuo/5x/H9z/7v2iXx/5Z1H7KGOEaqZ+ms=;
 b=EBzpO8K3AkSpu2VlJFi1Oga0gA+bVrF6n4uzgJgL4Najr8y8ihInVO0S3NlDTaAn8YEeWdB8xZN+k0KxwfSMao8dzVUpKVCrawaphUvOiNEUnBUU3MLu2KxqCLn+c4icZFC++jqkmamxWEE587tP8LxnE+8aUv/07NX6LggrTbmgixPBhrIt1dcAv7dibHZjkx1BmTBbX2xxWx3Ura2RHJ9izrp8ldUdGfTTRfBj9Evl2wqJdOugBSQ96aUo1PIhl6bJneqpaevWzyHwVgQgTHOf6/8GW6rlElXSqjpKFkf5yGRVJxaAmeKDBg8/ciWVdn/SKbKYRYuisPZMm0CvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB7251.namprd11.prod.outlook.com (2603:10b6:610:147::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 22:15:49 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 22:15:49 +0000
Message-ID: <c7b270fc-42f7-4b2f-a0ec-f5c1cc58da28@intel.com>
Date: Tue, 8 Apr 2025 15:15:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/guc: Bump the recommended GuC version to
 70.44.1
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
 <20250403185619.1555853-6-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250403185619.1555853-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7618c3-bfd7-42ab-1806-08dd76eaeaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVRZczRrSFJ2MmVjZ29xS1N4WWN4WEJENllQL1F0YWtBL1h6L2ZWMTl1V2ho?=
 =?utf-8?B?V0lpUE1IcVpKYjVPVVNURjMrV0prTHpSU21vTHhtZ09LY2w5UmpoTUdCU0Rv?=
 =?utf-8?B?cWhZVUt3R0FiSzQwMHRBMTJRQmI2QWloTGRUZUJ1TkhjWXdNdFJZZkFyVVdO?=
 =?utf-8?B?R21rdmh0M3RFMzhWRE92UGprYnlYQy94ZE5iM3FxV1dkRUJQL3FYMnFYcXdI?=
 =?utf-8?B?QVY0Rk0rYm1RZVFodVpCY0tFZFZPZXdjOGtxZmMyb3FnQUxGUXg3MXlZRXZX?=
 =?utf-8?B?dUtDalEySDlodkFQRUgxZTcxK29sQlFpM05OenViZ1RHZ0tVcU56S3RONjVG?=
 =?utf-8?B?YTNqYjI1ajE3YzFiMmZXRzhMd0ljcktNcmdCZHYvS0xTdUhLQkJXa3cyOXBa?=
 =?utf-8?B?L1V6SWpHTVpVZGx4anRIREZJcWRtcDN3NzZWRC9JVjNHSEV6ZXYyanN1VzVw?=
 =?utf-8?B?L0JsOVNmOHpFRnUyZ1BCRUdYbS8yLzhhc0FDUFIzaGxLdjFlN2ZwRGRRUGp5?=
 =?utf-8?B?VzZDWGMwNmxPNU5OeDdiRkVWMXpkTFFnQ3krNVR5RGVmWTB2aEo3YkVDVjNQ?=
 =?utf-8?B?c281SGNkOVRIUThicjhUSWpyVWhBYUp0OG1jT2JwcHYxbnltbFUvK3BEV21S?=
 =?utf-8?B?VGtEbCt1N0IwY004Z1l2VzFVNWIxM2loSFl0U3dXei9LTFB6NzREbnFUS2l5?=
 =?utf-8?B?TmtselNtZENvbnVzc1Nlc1NPRXduN0dWMjhNbTNSMjhTNVJKRjdLZUNwSzRs?=
 =?utf-8?B?SW5ONUQ0RldtOXY5SGxIaEtQYmIyNW9JZCtNWHEzTEpGMjdjNC9EV3hqYkRP?=
 =?utf-8?B?SEhqMmxWL3ZiM3J0T0FDbVNDRU9lV2Fsb3VROGRJd3VqVXRQemYxa0tDd3ZL?=
 =?utf-8?B?RFlpWEl5STIxUTB1NmtZaGs0Y3VnbGJSZVpaWC80VFhXNTNraklTaTMxRTdp?=
 =?utf-8?B?UTlJK1krc2I1TXgwOVNPVUxaNUkrRmxGeWJoZzFzRWQySDRSd1pKWVYvQ0pr?=
 =?utf-8?B?eENNaHl1dnVWc0ltMFg2aElzdkJ0akc1a0pkRzkzejJOaWF4ZStPK3JDSW1L?=
 =?utf-8?B?VlQ0NVgwTmovTDd4ZlZab043REFKK0lFb3cyZEM0UWZLL2ZPc3hZNS9IUm54?=
 =?utf-8?B?SFdhdDhqbmdPSVV4S0wwOElEOHNlNVl6SmNMM3NobVpuYkFKVlo4em9vS0Vm?=
 =?utf-8?B?VUNyV2NjdXVacjVPV3ZKRzBwOVNuSUQrT1RPMDFWY2J3Nk1tQ0R2dTMzYVUz?=
 =?utf-8?B?bEJ3UTJCNy9QdGJMRmkzOEpCVEdtK0NVQlVuZ3JMWEVFcWtmNlVHRjJiSFdm?=
 =?utf-8?B?TlVmSWNpZ2lEZC9IalAySDB1VmI4MC9HWnZWdHg5VUVaaWRTVk9nTnhZVjNM?=
 =?utf-8?B?WXhFZGxrbXJZMjhkdlBKa1A4NHRPcHo1cmt2YVNRMXBFWVZRbVB5THNsbTdO?=
 =?utf-8?B?NzB3ZWwvWFBiZ1N5L3kvUVFZVCtNYUcwaXNIcDg4ajN6azhpQXFRQUhyenAz?=
 =?utf-8?B?MkY1OXg3TE1tdURDQ29NQjJIS2JlMFFjcmlTM3hlMFdCcGNMTDlJYlR4Unlv?=
 =?utf-8?B?NEZDRlp4MUtyUldpUkEwaXRqdEw1SUlSaEc5ZVJMZ3gvMXg5SHJjaVVZWGhv?=
 =?utf-8?B?OS9ITSt0VzI3TXIyZzd6Z2dubm41NWFJaTVhUU5FbUNOd3hpalRNYzVUaFhx?=
 =?utf-8?B?UGo0WkZscXhONkhNTTFuWGE0RVRQajE3NHBDQk9PL09IRTBNclMvcHdQUjls?=
 =?utf-8?B?dVJHSzVWa0ZnaXkvR1RlTWlyeHFWbGo2NlFIalNKWjY2bzREeDF6VmsrUThJ?=
 =?utf-8?B?WUpiN1pNQmIzcjhUS0pzaDA5RFpBL2hLdVh3Zm5Fc3ZRNVpYN0JoTGlpUGUx?=
 =?utf-8?Q?jmcSn2+LbDaSc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzhPZDZLZkNjSU1NekhhVE1uckV3RVFOQks0TmZudkdiMFUrYmFNd0xPZEVT?=
 =?utf-8?B?RXBnZlpFRTI2NDZrL3VkM0NoSjBmRWVheWo0OWZMaG9uT3lHaFo4R3l1dm5u?=
 =?utf-8?B?dmd6VHVxc0NMSHVQTE4ySXBUeXE1NHFPZGlqRmpOY0svelVtUDVIbEltRkNw?=
 =?utf-8?B?RDRITlZYQ2ZySXhQUGNUMHlKUHpmT0VNU0NGbWp5WVBzNXZGZjZ5Q3luZzNP?=
 =?utf-8?B?T1gyL1daQ1RTQU03Y0JYNi8yc25BcDErcUluVkxhbXZNNmFiQ1VoY20xdTZn?=
 =?utf-8?B?QkNuNmsxbExKeVUyNFdwaHVvQlppdVdkK2lxb0tiNEFmVXFkamlOUkpCTFlj?=
 =?utf-8?B?TXFvdmNMdWxWd0VMSEtPSkpnd3FGMDh1blEwVE9mazFjZFpPSFloamNhekNv?=
 =?utf-8?B?RUpzLzc4czNRamxXSjk4YVNhQVZrVy9kOHUxYzhqMmRCWnNlbjdGUkxuZCto?=
 =?utf-8?B?a3psWDZRT2ZKRGJjQmUwVFpva3VNc3dVQjBkRCtPTlNVM29NWno5UW9LUnVt?=
 =?utf-8?B?dGYrWDA3TVV4WUtSdGdUMWRKZ1d0NEFxYjJ2R1JOSHRQbStDSHFzenNRYUtS?=
 =?utf-8?B?NW9tNWtJaEd3OGppdDl3ckxRUGNoRzJra20zRzBwNDVXRVhmOHorSHBjMitr?=
 =?utf-8?B?VmRPRkIwaDd1Z2xDN28rRUFEcWNwa0lmZXZlVGwwQ3ZFYyszbkVaS0lyNDlt?=
 =?utf-8?B?d2pMOEk4L2NBOElKczJwRnd0c0JIRFFoZTluSTNyODByL09kSXZLWTkxNVJ3?=
 =?utf-8?B?enJXNUtIZldvRDYxZ2k2NzgwMTdNditFSkEzTnVHNVdBRVlPci85RlBXS0Iz?=
 =?utf-8?B?c3BZTTRMMEhwWUpYU3djcmhUOFp1MFFvbVVxMnNPRWZKOWZBUUFYRFczbGww?=
 =?utf-8?B?UGlZbER6Q0k0L3ltY2x0ZklzSGVHa2N2ZTZYdGZ1QU91TzlWd000Sk45clds?=
 =?utf-8?B?YUtyR1dxemZhTDNZbDEwR0E4SWRnWmdYblIzUHlzbmdxckoySStmbWRpS1A4?=
 =?utf-8?B?VnBVamVsNjk5bEw4VjFxUWhic2lFWkpmUldXL2lQZ2lXcG1XcmxHL3V6WHVH?=
 =?utf-8?B?Y0FCN2ZtRGNJM0JiR3d5aXBtdkh3Ym1jVEVkOFRuV2FtK0JjcFhpZmt4cE9H?=
 =?utf-8?B?MzBtL2Rxb2FiSUM0OGduMitHemtURXk4cDVabW1OZ0hPcFNXbERDQzNoOVYy?=
 =?utf-8?B?T01ETnUxSHdHZ3V4bjcvN1hRTUVyWW8vOEE0bTJ3aDVmQzZyMXBpUlBJeThC?=
 =?utf-8?B?dWR1RFg3d0hSa2l4VjF6K0dDNm16WlF3cTRZVWdKeGpKRzY4aFI1eVVGdW1o?=
 =?utf-8?B?WFpHeUYzMUFib1o5c083ckN3M0laYm1mSFhLWXJKTHd6RFpNZE8yR3BqTDZQ?=
 =?utf-8?B?SXpGMEJYS2YwVDNJQ2h0ZFA3UThHMi8rcjg2V1ZpTVdtb01yUXlmOVRqM01q?=
 =?utf-8?B?d1Y1bnZ4bWJJcElvZFBDTkdUenpFZGF4U0JQQWw1N05XVlM4MVB5N3NsMlFm?=
 =?utf-8?B?aitscnlRNkdDMnhXN1BONkd4L2RIbG1DNW9JNU5sWFh0bjNpSTZ6SVdnczRC?=
 =?utf-8?B?Y3lJbUxjWTNBcWFZbVNOTlhxamthbXdGMjFxWExya09kUnNzbFhyWk5wdVJ2?=
 =?utf-8?B?ZkwxY2pzR0tXd1UzM1ZVUVAzTEdyNW05WWNZY3phL2IxeW8vWi9pd3pqQVRY?=
 =?utf-8?B?dEJicWVHT0t2WjY0Zk9uWDgzTXFSbENyWENsdGFDVWxQRFZwTytxTnFLSFJ5?=
 =?utf-8?B?MHVaNjFnc1JkYXVwMDh1REZISjNjY1dXUWFvN2dQV2RWOVlqU2tvNW5RQ1p2?=
 =?utf-8?B?dEFqbjlkZm1VMGF4SEZHbjRObHE5RW0vR0NQTWFtUm9FYUxuYS9jWGFicVo3?=
 =?utf-8?B?NFNkdEg1bTJxeFFHK1dqOHlRVmgvdHlLbmsxbmdrK053ZXI1aWo3TXkxeWFz?=
 =?utf-8?B?RUVBanlXODVBOEo0MTVZTURFYldSU2xjSVBYdkNIWW0vTnhtZWZ0YnVmRVps?=
 =?utf-8?B?cHEyaDVJcHk5MDhoMmFReWxNMmdMNGcxWURBOFZjb2RlZkltSkxPOGFydndP?=
 =?utf-8?B?TktaWGRWSmxDVXRQUUlpRnRLM2czMHphN24xRVRCdUVlY2kvc2lOOW5YRzBF?=
 =?utf-8?B?eVIxMDJuQkcvdTM3UnBKdEZnTUNzU3JJOEF0M0ZraUxjQnQ1YzNMTnJaR3hy?=
 =?utf-8?Q?iFOk+442raaLDFPJCv8JXdk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7618c3-bfd7-42ab-1806-08dd76eaeaea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 22:15:49.3213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imlKUQbVDMFHhqt8MRfzm47kN89xrL1Mn2jKz4zMZLcqbBWdud3+wWg7gaTN1Zi9OIhl73u4rflTRiugrrIIk6mKn2HSqmNfd+HKcRx73aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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



On 4/3/2025 11:56 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A new workaround requires a newer GuC version. So, recommend that
> users install it.

The feature the WA is for is only officially supported for PTL+ though, 
so users aren't really impacted on anything else; I'm not sure if we 
should recommend the update everywhere.

Daniele

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 4a16d3c40ea9..2741849bbf4d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -114,16 +114,16 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> -	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> -	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> -	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> -	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> -	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
> +	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
> +	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 44, 1))	\
> +	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
> +	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
> +	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\
> +	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
> +	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
> +	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\

