Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6FFC79FB7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 04:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7421710EEE5;
	Thu, 10 Sep 2026 04:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OM/OFsnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486F210E8C2
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 04:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789016372; x=1820552372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4BTTLN94dcxpsvyo9inJ+2JmMLIkx0USiWgKqUs9dx8=;
 b=OM/OFsnhZgeptxQtQaoLTA/pqo/j6BQM/MskIT6ounMXahx01OOgLbbN
 K06YLwTxT/VHAOV9lZQUwt9+PbD/QiR+Y3PY/vkFiMjfhmCIPT3ESCNUL
 VEPID9E6f42H5sIEE+Br7ILR87YZYdR0t0uSu75yQfUzYiK2YUJT3piG1
 97tygD97RgsfeHHrcaGAeYLfedT7v6wgVtNyQ5l4i8q0KX/X+TAoKXHAF
 qPeCxebC7IQr9BbpNgiPa5TQhafN3fIDLlpzA+yaD+iRJ36KyaTKsdUR4
 FKecJgxp1MxUWnfcSfbG4gCDNlVs/LxNImy/VkL3ReG3R6Gzu0rTTSira w==;
X-CSE-ConnectionGUID: QXwnhhcaTFOaC2NU+x98Zg==
X-CSE-MsgGUID: yjneUfOTTgKEKCrBMzNCvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100621702"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="100621702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:59:31 -0700
X-CSE-ConnectionGUID: gQk45Z5MTk2AwVblidMuPA==
X-CSE-MsgGUID: AYKplt/EQI+581R/egqkOg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:59:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:59:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 21:59:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceehYGRQThNTgaPScSoc8Jib19lz5ANjApaO3SasiftZL/9cBrnyBjgvPiU0cZvinRGf9Dhv2q97fFMjgUzxPDNuaqV6eKqJnJ2bmc2VuSij0vQF+khLXxwTbE9t4r+IRkYPa1kOr/HBR3NwRd8gd3f1UNTwbwXrJZcUVBrZreu9mgAxNXoR6GPPjI9Q80PPtBMTGcyDlY0x2xff9iiQgWCSdK76t7RyjiVHW52O3V1RXiwqf4AHOpp1jjEFeAMQxI6L0yCHc/H6SBDv0jOvbLkBwm266QGGeTh378ZcI+2CvxjyhnlMu/CBjWBEariMPwAz3KHN+TSKa5MDq0JLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7rRPs76zpLNTgOy+UR3BIJMEGq2bOl8MhfdtClDIJQ=;
 b=P5a8pMXcntYAp1j+YAw0pc6SRXiIfl8XRaCczrSe4Yqfo6pO5EXbvNISCQKA9SH5xVfxH66J+C5d4qsAAwYseY91AjSAJWHRUqSwKadZ4UmyhZ9oUsfVJTvd6udk2NVZ+wuKB+8S/nYmsl9Ce8nGKvTgGO9i7rYeB6ldLe+mM34FesvJJ7Fd2gxtZGKdTg5BuufKn/eaJumQWWuWcy7IXuo+wcVjWBmkdHjQiiVtVmo3GJUIHIu36G5JpM+WYsQ6yCJsSoVGcE84DKzIjVsHzMGdNtDxDGZuUcnvvia0pxADLzw/Mqbs8nEe/HIVUO5l8jLU1iMYHKspqDxde7EYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 04:59:27 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:59:27 +0000
Message-ID: <ca5ace65-13a6-4394-bfa6-d6513670d3df@intel.com>
Date: Thu, 10 Sep 2026 10:29:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/debugfs: Expose per-engine idle status
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260908060103.999079-2-sk.anirban@intel.com>
 <a85a2c63-8153-4924-8a0e-8db327021b15@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <a85a2c63-8153-4924-8a0e-8db327021b15@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0dcfc5-519e-45ed-b994-08df0ef84a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|22082099003|18002099003|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2jKxozAcy3wf8ue1fPClt1Xu1px8VWxpZK9q1P/XX2S7iTesb1KoLKF5C3KdpblEmrJSidNNw4X5/fD8usK1HLZrChi5hrVx0x0rHzL2nFZbsVG+kLRSm0VDRybUjcvJTvycV959btSG0tZyoXl+OrCEmAjR7rsOQD+UDh+EEMGYl5VVm8aYYdvFLpjBAgARsay6nH6E3WsuiMdzgTfLrfIRf4etzamudYQqLeF2tyuQnPzgPgolcXab+n6va/aQahDnN17RsqHQOglclknt11SlZ6oVZq5/PcTndkBVs7UEcUGJpJPKIWOZIR6aaO/rE8HSrSWG/1QKlf1YGycqmGe1RdKY4YMQ658AQUkHXnkxJBpG9QTf+kiqZsUoDryN6hGy110gxuTrHgN0fJnEyHx37belzV7wq5kXzON9Cg3U2OlXm8pyrp66hob07GH0nHVl3HPhz7E+RavL5cFVhlu8WzgsNdbSY24caLK8/ADrTA1PHiaUgtFZQEseyhNapu9XAMF7Ltw/4npveLrFhD+fPxRkORUzkBnotjzu23+lgKJLd7M9tG//cs4WhIfMMxLUqrPTpnTKiltIivuQcc6OPj7ymd4XFz5OuBtYyp6aEre4hFQ8rrwSg570gJeq67AHTCd8GQYWE34QwmeHVBv9VcGrGGKNRPPlIHH8wXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVRqNmNYRGduSzFsd0FLK1h5aThQejlpN1ROMkJycVdvUDFScHRnbDVQN05Y?=
 =?utf-8?B?c1ZMbGpSeFp4bEpTbnNocWJFdk02U2NhTWxZa1UwOC9MUGRiOGdUVllpRUlv?=
 =?utf-8?B?T0ZxZXVKVGVWVDFQOUlhWmltMUNlY29JVHpld3IvVUcrWUc0TndTVzdVMGMx?=
 =?utf-8?B?S1hId3RHbmttSHBkM2xMUFVGWXJyaTJJZHJua243aXZvQ0tVWFV3NkQ1VjVB?=
 =?utf-8?B?Y2dUaTBlVDc2aklnL0JFRkMwR3YrNFFyNXJaUmZHYUJZRXplWG9HVnVqYXlD?=
 =?utf-8?B?dWU0YmpOZDZaRmNyYXhjcTgrSFlRYWt0RzY4SFZITXJJa2V0WFhDYzhwY1lo?=
 =?utf-8?B?am0xVTB2czJyRjF6UGVqaE9wcTVoWVFyUnFCOGpLYzlrdUVrQXVqOTlMdEt1?=
 =?utf-8?B?RjB6K0hiSWdqQllPV1VPVTdhRUhxaWx6QVFyVmVQYTk0MEhSakphNjhieU1l?=
 =?utf-8?B?dUgyUFczMlIwNk5DVWlIRE5vVUdHVTRwMjNSR1Q3YWpIekV2UzZiSWg3bjhn?=
 =?utf-8?B?djV2Tit1amNoZkRzK0JNY1lZbGtoMnBTMlBUZjkrYzlQRWhFWUhHM2RvWHU1?=
 =?utf-8?B?ZUE5dFhVTUo3MlNya2R5MEtVcXFodWdEb1pXc2JwSzg3Q3AwTFkwVUsydWtH?=
 =?utf-8?B?R0NNbVdKTnBtQ2xIYkFxV0lWRTl4ZmxwNHNIUlJrdFRiVTlMeWhtc2ZrWitn?=
 =?utf-8?B?ZGk4UW5kVnlqa0NsNkZIMUFJWCtlZmN2WGJRUU1iN3Y0M0Y3WTk5YWVtWHd0?=
 =?utf-8?B?QW91bmtUNW9wbWgzQlhLeTFzaWM0VGl0eDl5a3g2OVUwd3RYQXZkYWhPRTht?=
 =?utf-8?B?NmZtT0gyMkdTVTgzc0FHaTFlb1VYWlBpbDRxU3RYM3Q0MVRYZFNEL3hNeHg0?=
 =?utf-8?B?OWFlbUJFZ0dNMk4rVDJwcE5TV3NUMjk3Q1graXFkdHN3Qkl4NVdhUXo2SXEw?=
 =?utf-8?B?a0ZSVitHL2trT0dZZUZuY1hnKy9yWk1GU2U0eXFLdFhobFJtditVRjMvRDlX?=
 =?utf-8?B?UE5lWHFEcDB5cm5ibFZybXdRMmtNbEc2WTNoaFNteUc4aW04MEkxcWVreEor?=
 =?utf-8?B?bHU1ZU5MQXlCdmt1T1YrbHFVR1Bmb3VLRUFRd0RzN2FBQ3NUWkZwNGRRRkdt?=
 =?utf-8?B?L2phaVNCNDg4RzExRFJjRjhnVng3STJnMy83bUVSYlI2b2dNTWNWV1FjZ3pl?=
 =?utf-8?B?K1JVZHF2Ri9uaDhDOTRITWpRRWk4STI0M0FSMVZnb0FZdUdIemJtdTZUdHQ3?=
 =?utf-8?B?T2tLdXhCdmhocDNmbDFrN2JOeXppSFczUTVTcTAxTFJXM2ZuMXR1YjVPZlNi?=
 =?utf-8?B?NW1naFFpOGpIM3M2VmRCSGl5bVFRSnI2emRLS2x3blY1S2pVa3ZXdmhLclBZ?=
 =?utf-8?B?MGQ0SDRUUFAwdWthNTRKTk9ZUjFERkU0NWYxclhJOUNEZzNPUWkxS2dqdTYz?=
 =?utf-8?B?a0d6bG1IbU9UQjhZSXZwNWFkOVVSdmdsVHpZQ0dpMHRSZTFvQzE1SGNEUGx0?=
 =?utf-8?B?Z2xJZGxuSzhIbWxBQlU0R2g5aGFSNFE5cEE2TmZUTUlvZnZPRS9Bb0NZSEpS?=
 =?utf-8?B?UHhlWlNGUWtCaG82ckdEWTlZYWdDanZvOXZQbStuSmJZN1AwOGtacEV6WDQz?=
 =?utf-8?B?ZFgvQ3VUcWJBeWRmbzl1d1FNRklaSWNLbWF6OThvdyt1Y0szUW84SktwZUJS?=
 =?utf-8?B?YVFwSHl1cGY5Q1NnZ2VYMkVjV3kyVm1Edy9nbnZyMGJFZnM5NVF5UnFHdnkz?=
 =?utf-8?B?V2MvbXRGVUo4Mkg1dUVnRTBVSXNMVG9Ba3BJNVF2d005TUZyQVdVZER1R2M5?=
 =?utf-8?B?c05aekgxbC9heVVHMnpuMlRQS2N4ZHBTUkRVcTFzUTc0VjVXNGpZaHpFMkhX?=
 =?utf-8?B?V1lZRlFkSDk4VTJtRzZrSVljRWYwVVhmU2tZMUNMMS84ZlgzZGJSOUtXLzBZ?=
 =?utf-8?B?cFc3TmxwaC9YbGloOEU0WTl5dFN0Q2xLbjFtMENQYUhzWFRxSUtxNGl5bDdM?=
 =?utf-8?B?VlNjZ2hMZGV5cnI2VHFnWGRpMUErZ2NuWGxXcDYzRXlGVWtjR0xaajVFZnRS?=
 =?utf-8?B?UzBlS0NtYmN6TkduNHhBallpbXJoS2NQR0FyUGhISytzcG9FTTlZTTdYVFND?=
 =?utf-8?B?Ui80anZUalVPYndhOGtNeWppTWZJeTBKNFFZTk5RZzVORzdhd1dyc0VIM1ZT?=
 =?utf-8?B?TXJ4ZXlOdDdpSFkveDh4SU52TFE2UXJDa05GN3E5RmZpRXREdHdtdW9WY215?=
 =?utf-8?B?d0YvZWczYVB5N21ZOFRyb2JlNXJSNVV3UUU3aXZ2UC80SzM1Y1RTbS9iU21C?=
 =?utf-8?B?c1NGdkZEY2VlczNQRlpCZm9qRllLVVh4VUhQQlNwSU1JUTV4NXRHQT09?=
X-Exchange-RoutingPolicyChecked: Zc47qJ2CzEgzU5cHVaptBH+aChdnBap0wff2VJjwkuQOKdNvCfsMOW+RLZm5X+vg5o4BND8H2tgWicvedLP570+1d1yi9xuP3VpOcoV6uEiu5mgT6A80z8YEVRhydoAmsIo7EDwcml3V0NMlLiLETODcZ56nJ9hLh7Syyu9crMNsoZfdJqGDTaPvOGuztk8ZktVxbykGHGzV4hfJ0wyLfJuZmrD1hih+lfRlH0XSMn95KgsgQqan93Xl7uwXZ1pJcszmQ7ILUmcO/zSUO5tzhiI2AZxCiyYzkvRFVEPBuTtFUnAixv5ixwafNu8NnMLge0rWYrPiWR5hT/SY2r4row==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0dcfc5-519e-45ed-b994-08df0ef84a09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:59:26.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PfxfkyezHyRUZjy/8NfIbsEHuuTt1t0mQoyy+D5O62zlH7rSa7BaPSFFhJwO7WF+qsniGkM5Znas80nPRsbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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

Hi,

On 10-09-2026 06:38 am, Belgaumkar, Vinay wrote:
>
> On 9/7/2026 11:01 PM, Sk Anirban wrote:
>> Extend the existing "hw_engines" debugfs to iterate over all hardware
>> engines and dump their idle state: whether the engine pipe is idle or
>> busy, whether C6 entry is allowed, and (where available) the forcewake
>> request status.
>>
>> v2: Use existing debugfs (Matt Brost)
>> v3: Rename macro (Vinay)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 +++++++++++++++
>>   drivers/gpu/drm/xe/xe_devcoredump.c  |  4 ++-
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 52 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_capture.c  |  2 --
>>   4 files changed, 81 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 48c515d91882..933fb880f09c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -196,6 +196,33 @@
>>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE    REG_BIT(14)
>>   #define   FAST_CLEAR_VALIGN_FIX            REG_BIT(13)
>>   +#define MSG_IDLE_CS                XE_REG(0x8000)
>> +#define MSG_IDLE_VCS0                XE_REG(0x8004)
>> +#define MSG_IDLE_VCS1                XE_REG(0x8008)
>> +#define MSG_IDLE_VCS2                XE_REG(0x80C0)
>> +#define MSG_IDLE_VCS3                XE_REG(0x80C4)
>> +#define MSG_IDLE_VCS4                XE_REG(0x80C8)
>> +#define MSG_IDLE_VCS5                XE_REG(0x80CC)
>> +#define MSG_IDLE_VCS6                XE_REG(0x80D0)
>> +#define MSG_IDLE_VCS7                XE_REG(0x80D4)
>> +#define MSG_IDLE_VECS0                XE_REG(0x8010)
>> +#define MSG_IDLE_VECS1                XE_REG(0x80D8)
>> +#define MSG_IDLE_VECS2                XE_REG(0x80DC)
>> +#define MSG_IDLE_VECS3                XE_REG(0x80E0)
>> +#define MSG_IDLE_BCS0                XE_REG(0x800C)
>> +#define MSG_IDLE_BCS1                XE_REG(0x8680)
>> +#define MSG_IDLE_BCS2                XE_REG(0x8684)
>> +#define MSG_IDLE_BCS3                XE_REG(0x8688)
>> +#define MSG_IDLE_BCS4                XE_REG(0x868C)
>> +#define MSG_IDLE_BCS5                XE_REG(0x8690)
>> +#define MSG_IDLE_BCS6                XE_REG(0x8694)
>> +#define MSG_IDLE_BCS7                XE_REG(0x8698)
>> +#define MSG_IDLE_BCS8                XE_REG(0x869C)
>> +#define MSG_IDLE_GSCCS0                XE_REG(0xA62C)
>> +#define   MSG_IDLE_INDICATION            REG_BIT(0)
>> +#define   MSG_IDLE_C6_ALLOWED            REG_BIT(1)
>> +#define   MSG_IDLE_FW_STATUS            REG_GENMASK(13, 9)
>
> Is this the old version? Still not updated to MSG_IDLE_FW_REQ as 
> discussed (here and below)?
>
> With that nit fixed, this is
>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> Thanks,
>
> Vinay.

My bad, it looks like the changes weren't applied correctly. I'll share 
a new revision that includes the changes.

Thanks,
Anirban

>
>> +
>>   #define XE2LPM_CCCHKNREG1            XE_REG(0x82a8)
>>     #define VF_PREEMPTION                XE_REG(0x83a4, 
>> XE_REG_OPTION_MASKED)
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 5f2b90b18f97..b918f046ae15 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -127,8 +127,10 @@ static ssize_t __xe_devcoredump_read(char 
>> *buffer, ssize_t count,
>>         drm_puts(&p, "\n**** HW Engines ****\n");
>>       for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>> -        if (ss->hwe[i])
>> +        if (ss->hwe[i]) {
>>               xe_engine_snapshot_print(ss->hwe[i], &p);
>> +            drm_puts(&p, "\n");
>> +        }
>>         drm_puts(&p, "\n**** VM state ****\n");
>>       xe_vm_snapshot_print(ss->vm, &p);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 361a70234d1f..27ee20b03d4a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -117,6 +117,38 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file 
>> *m, void *data)
>>     static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   {
>> +    static const struct {
>> +        struct xe_reg reg;
>> +        bool has_fw;
>> +    } msg_idle_reg[XE_NUM_HW_ENGINES] = {
>> +        [XE_HW_ENGINE_RCS0] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_BCS0] = { MSG_IDLE_BCS0, true },
>> +        [XE_HW_ENGINE_BCS1] = { MSG_IDLE_BCS1, false },
>> +        [XE_HW_ENGINE_BCS2] = { MSG_IDLE_BCS2, false },
>> +        [XE_HW_ENGINE_BCS3] = { MSG_IDLE_BCS3, false },
>> +        [XE_HW_ENGINE_BCS4] = { MSG_IDLE_BCS4, false },
>> +        [XE_HW_ENGINE_BCS5] = { MSG_IDLE_BCS5, false },
>> +        [XE_HW_ENGINE_BCS6] = { MSG_IDLE_BCS6, false },
>> +        [XE_HW_ENGINE_BCS7] = { MSG_IDLE_BCS7, false },
>> +        [XE_HW_ENGINE_BCS8] = { MSG_IDLE_BCS8, false },
>> +        [XE_HW_ENGINE_VCS0] = { MSG_IDLE_VCS0, true },
>> +        [XE_HW_ENGINE_VCS1] = { MSG_IDLE_VCS1, true },
>> +        [XE_HW_ENGINE_VCS2] = { MSG_IDLE_VCS2, true },
>> +        [XE_HW_ENGINE_VCS3] = { MSG_IDLE_VCS3, true },
>> +        [XE_HW_ENGINE_VCS4] = { MSG_IDLE_VCS4, true },
>> +        [XE_HW_ENGINE_VCS5] = { MSG_IDLE_VCS5, true },
>> +        [XE_HW_ENGINE_VCS6] = { MSG_IDLE_VCS6, true },
>> +        [XE_HW_ENGINE_VCS7] = { MSG_IDLE_VCS7, true },
>> +        [XE_HW_ENGINE_VECS0] = { MSG_IDLE_VECS0, true },
>> +        [XE_HW_ENGINE_VECS1] = { MSG_IDLE_VECS1, true },
>> +        [XE_HW_ENGINE_VECS2] = { MSG_IDLE_VECS2, true },
>> +        [XE_HW_ENGINE_VECS3] = { MSG_IDLE_VECS3, true },
>> +        [XE_HW_ENGINE_CCS0] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_CCS1] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_CCS2] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_CCS3] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_GSCCS0] = { MSG_IDLE_GSCCS0, false },
>> +    };
>>       struct xe_hw_engine *hwe;
>>       enum xe_hw_engine_id id;
>>   @@ -124,9 +156,27 @@ static int hw_engines(struct xe_gt *gt, struct 
>> drm_printer *p)
>>       if (!xe_force_wake_ref_has_domain(fw_ref.domains, 
>> XE_FORCEWAKE_ALL))
>>           return -ETIMEDOUT;
>>   -    for_each_hw_engine(hwe, gt, id)
>> +    for_each_hw_engine(hwe, gt, id) {
>> +        struct xe_reg reg = msg_idle_reg[id].reg;
>> +        u32 val;
>> +
>>           xe_hw_engine_print(hwe, p);
>>   +        val = xe_mmio_read32(&gt->mmio, reg);
>> +
>> +        if (msg_idle_reg[id].has_fw)
>> +            drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
>> +                   val & MSG_IDLE_INDICATION ? "idle" : "busy",
>> +                   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not 
>> allowed",
>> +                   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));
>> +        else
>> +            drm_printf(p, "\tpipe %s, C6 %s\n",
>> +                   val & MSG_IDLE_INDICATION ? "idle" : "busy",
>> +                   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not 
>> allowed");
>> +
>> +        drm_puts(p, "\n");
>> +    }
>> +
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c 
>> b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 82df19b304e1..5a4d085660a2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1868,8 +1868,6 @@ void xe_engine_snapshot_print(struct 
>> xe_hw_engine_snapshot *snapshot, struct drm
>>           snapshot_print_by_list_order(snapshot, p, 
>> GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>>                            list);
>>       }
>> -
>> -    drm_puts(p, "\n");
>>   }
>>     /**
