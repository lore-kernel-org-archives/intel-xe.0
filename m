Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F610E9D83B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 05:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88110E0A9;
	Mon,  6 Apr 2026 05:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQ1hmuHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B5910E0A9
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775453170; x=1806989170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7sNysHx57l62qWe0vw/P2hFeMQYOvW77nXHbk98MO6I=;
 b=WQ1hmuHToZhFRlOmkPT63NGZOgrayzuGy/qEfe/NrWpIsmuL/jkMbvjU
 Y0HpemKj3L3IaE4hbEDBsonXJ1ExI3LZiWPkSIVxRMXQyHGIq8H03+PDe
 KTMCJEsJo/lygtxN4SdrrlYkvby2TCO3XvueOFK09gPVVY7bYxS72smjf
 mWs5HhEr317ydbsbnRj85SZW4R+bxjbEHz5jTZQM4xnMJ6eajJVL9vMi8
 Xitg2U5dXCdVk/SGkfHpT6nAOMby2r3pcT+qmDX8+asqYHy0NY6UDzHeV
 wzFLDIPSuzcQU9sIYNxtWVFoKkKlc5MW4ZbaV0IJFlKwrJ3Bqr1hJYruR A==;
X-CSE-ConnectionGUID: l5mm794JRbyIHzRuqj7WzQ==
X-CSE-MsgGUID: oDnivkQKTYeefrhSrl3ukw==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76303875"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76303875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:26:10 -0700
X-CSE-ConnectionGUID: lyrC6x/MQwiEBLwjn96cRA==
X-CSE-MsgGUID: 4TtpARnrQeSNrbwI/48MiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="250910158"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:26:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:26:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 22:26:10 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFsDMb7XP+i0Qb8UzwtcDDW7VzQYbvucBKcAUYDoDSaX+58KKr+mszFamCbLa/JPk9FXqIT1VATBs1fHxsxnEoNETEDKEbwiIYXcxluNDypwBGXzzmWCCXYPMaDTec54NOzHeqcB/C6Avz27iAsQ9hgAw3jI1YtlvSRRDpZapFXf5YgyudgRuPfNpAUamrV/6Rew4wsfero3whzEvp9OAbsPm5fhgRZWcseplxj4/dSkMamBhrzrkiR+ZxzQnnMgCi1gOAsicVY4jbOT+2OVR94as8jAHVB1cQ6kWkd8viiCEV/JT20pFy2m0KnJsKymvin/kIvr50evttzGK/U4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4XWfNCZUhNPLyA2APXVMbZYlTq9k0QV7eAQ4IIjwqs=;
 b=ISuctDaJhAHhCzflHwP2P0kCS9EwuefPOA686n7oZKnwuTDtaTRziwRRkB4fwE61hq4xozBYpnOgmQ2VXLY+K5FNPEp3T/VXEMRNeUULma2HuJu6lhZ65Drb+70Ev606OpF08GgxYS7e6MyYenLU3v4DXnuYIQEOfB7dm2rRo7bZmAjFZEJsfilraAY3ffl6wK7VVpAlCL2n5yuDMOCRsWUge3Dqpp98TEzTs0QRM4jaguxDoIN5v0PafKawbv36vhdPUw/Rq1JbX5NPyLpZYxEV4BPaKgetKVOVMCafHjCtMeNRL4WV5Nk8D023SLy3Ncq8CTCbj4+G2upwLtSxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Mon, 6 Apr 2026 05:26:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 05:26:02 +0000
Message-ID: <2a471a88-510f-47b0-9875-9b3372b934a6@intel.com>
Date: Mon, 6 Apr 2026 10:55:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/ras: Add flag for Xe RAS
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-4-riana.tauro@intel.com>
 <aczPDEvv1w4HGqFH@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aczPDEvv1w4HGqFH@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 13bfa342-d803-4772-6965-08de939cfe48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: wsR8gAi+FkJvaG+5HN/thnmnokDlzmrRRgWaNRN/mIiEyD1RlkU9BQZQfdI4+KuMmmUH64M5J8DkPpknFt98OcZIxdWSboZktCoG8cK96qJo+qcVh1l3kGyMotjutoe10iE9IwzNElCBW/+bLBHQC/e+CDwnTH87+iZg+qm7PNsBlrUBtF6vIDlKKreLsG6LR/MQPvs520e0Pml7CRxCa3s2inmGnXa2scuErVlZv03PkdLqdHbu/rU7jdE0D/Ld4fNtbd0jEKbDgU57MMj5nKoBA0QKbUoU3dXUPl6jjUC4fakHml2GeLT+4C25UgDR/Pi4AtkKOOHJHDs3cpEUeAnDeZ4zD3HeuFp+7TaeWXP2TpGfOFXoL+amWD2tGMc/B89qhD/u6EdWjq4Xr3v80Cx4ipUFjGOwQ7zUEcEyGTwhocTW0+FZBPbR3Jhwi7nEkSI9NhAaPkr8ups+k/Rq7GFYf6NhLMywF4Vnu7U+HLrPRum1thhkHNNa+y1NonhArAOC6Je33+0G7jypgSGLTcvN8xoUnGhG5s7eWbWbODaDp/CTNltLooYta/tpYwMEuuG1ARXw9qkwWbZMkPi8NVfZoBMcPSF2AjGKZvQ0H4JX6xgjlVc/j7GbfCyQOLhcxYLtR7Dr6PmY6mRD088mGxCA41VsL5p7uauEZ0Te9PnP8htyOQEpAvVxYiTP+AQpDnlnLuXxHXZ1mFngnqWZfu7wJZb76vL7AFb0xcJRqmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHNsK0FWV0pXcndoeFc2aGpYdVRqRm5mT3VwMFRvcFdsRERYaTR2VVhwTTFn?=
 =?utf-8?B?azhrTlpHUEo2VkxNTVFyM2JmeloxWVJhZVhwZWFFb00xdzNhelhFQmV4aEkx?=
 =?utf-8?B?cjhKdUxaN3prMDBNN09xNkdvOGRmMVZNNjI1Z1I1NC9xMXVYMG9CRC9VcFBZ?=
 =?utf-8?B?ZTlrZ1FPdDdTUEpVdERneWo2T2szK3VlVHJjKzdoMFFKVklzUE5VTXBmbXZ0?=
 =?utf-8?B?Ly8vRXZUQ3kzSlArU2l4TXpIY2RQQWFOYWx3akNQOXh2c2Z2azFOMEtQU0tS?=
 =?utf-8?B?THVSakFtaHRWcWNHSW5xN3BkeEVIMSsvK1RKLzRvc2VLekMzeTNkczIrNUxZ?=
 =?utf-8?B?ZFNuSElWaVVrZG9xdFN6U09BYXBBQ2xiUFZFUkRJOFQ2Mm9xaVZoeG1BSnZl?=
 =?utf-8?B?eTR3MHRreklhVWppOWdxZkZpWFBvWVB4NDNaTjN5T0YrRDlkNFRwNFV3d1pt?=
 =?utf-8?B?MHJhSmlML0QwR1cyYVZzNkU2Qm0wN3dFYXdJMGpFM2t5bnVoK2grNUE5NERa?=
 =?utf-8?B?Tlk0QkNONmVIeTB4ODRZZDM4T0haMjUzSE51cXprVkdzL2lNSU8xcDAyczZ5?=
 =?utf-8?B?UURwNXFlVEdTMEF2eElkS0pWMXFRL3lpNzBJdUdmUzYxblJiZzBlTkYwOHdr?=
 =?utf-8?B?NDU4WmNOcTg2WmVTN0RYSUxpNFBjRldkRnhaTkxSSk81TnE1OWpkd1hXMDhP?=
 =?utf-8?B?TkFUY0JwOWRuNjlMWkpuNGxEUkplWEVYN3hHcUpBYjlSUDlqcEQ1blU2T2VK?=
 =?utf-8?B?Z09LTHNrOHVaQWVKUkxlaWtYN0NvMlpNckdmbDE4UTltdDU1Znc3WUxNNVVE?=
 =?utf-8?B?ejdMQ2tKRUlKc2JZc2RnUFROZk12SmxoTGV4bWJRRTlaSUtZMW40aVJSOXhJ?=
 =?utf-8?B?TGNBWFdCM3hzTlIyQkFtQXhzYVMzS1JsMzBHYmhCbmZnZ3E3MzZ5L20vOExj?=
 =?utf-8?B?MEFMeGhGM3BnVm9PdUgvY2lqb2xFWWRTSmJ1N1haaW5PU0xBUmVZNG9qOVgx?=
 =?utf-8?B?cnkrcmtaMXJ3SEVKREIwK2xuVE1KcmpKYVNEdy9CQkZTZ28wT3ErbU56OXdE?=
 =?utf-8?B?TENFWWhNZ0JFWGo5amhYMHFqK0wxMy9RSUdYc2ZKVU8wTjVWRmRRaDJXSWNK?=
 =?utf-8?B?M1hBNGhuS01VbGxHWWdBRkpuWFJ1cnMza3VNc0lzUVRJSTFOdjBVSmthSUNy?=
 =?utf-8?B?MUJWekk1NFpkempVZFhhS1Z0VzVwRFgyWkE4K2RLY3dWZ2FEd2VKUGpUYkVH?=
 =?utf-8?B?MU1iWHJFUmpKVUMwdCtRVHhOL0JkTUZKcE9CYTF3RS9nL3pVMzQwSHYrZm83?=
 =?utf-8?B?b3puUENySFJTcXBXYmh2WG5aKzUwWnkrUFNXNEc2aGRNd3lpMXVKRnh1TXBl?=
 =?utf-8?B?Ri9ucUp3QlFDU0NBdnNFK0kwTGFqNEV4WnMxSVdiMVpVanRyRVNaMlArN0lV?=
 =?utf-8?B?Q0NrWHZvU21ic3lnMTFnUW9zcHhnM0p0a2xNbEtER09YMzNBMGhtSk12bW5s?=
 =?utf-8?B?ZkZKUGNoZERFd3cwRURPL0dFYWh0NWMrZ3pzVzB0MHhrZXhTUzVha3VqZ3M1?=
 =?utf-8?B?MFdBSFVOYUFZalVkT1lwdlNlM0lQN05kcXBXNkQ5QUNXSGFmVThUQnZFcS9I?=
 =?utf-8?B?c2pNVG1PbFJzNkoxMkN4Y1YwTTlJbFRIMjBZeitJMnZibFhjNWhvOGJBV05a?=
 =?utf-8?B?anNNN2VHYWxNVVUzVyttdnB3a29pdkd4N2NVc3FjWXBFZVpyckdiRE1JZERZ?=
 =?utf-8?B?RUJLaUlHZVlQZURJdXd2M2xsU3M2UGJCeG1ET2VrWE1aNG0wQ1d6Z2RKV05I?=
 =?utf-8?B?cDkwRDR6c2syQXZPVUxrWmdjWGJCRGdOUzA4Vjc4UWJ6aXI1WWxjbWhzZmNn?=
 =?utf-8?B?cXlERkRzb0RJejEwWEFyTGpxTHI3N2RvbDQvTG5pUm1abGhZa2FCRE1BN09u?=
 =?utf-8?B?cVhGV3ZlSFhzOEtKVnZyQndkQm95NVpxYVFkenlxWVJPZHdSQ0ZCWXBzbHdj?=
 =?utf-8?B?ZGhyQ1Z5bFJTc0REaDRVVDlScmlGVUQ1V1FZU1lMSk5DMlVTN24wdHVxcHdT?=
 =?utf-8?B?WFVSVHNiYkYrZkJ6NlYxSG5Hc21ac0NVOHhybUp1ZGlrb3RHTUV0a0F2Nlo1?=
 =?utf-8?B?bDZ6bXVkMnE4OENaM0JDQlAza3F6YnZjaG9LQUxkYzE5RnF3UnZsbU1BM0pv?=
 =?utf-8?B?UnlGOFM2WFkyUkZ4dzY1U0NTSHRoZm1ua0w1dE5HVHBFUkhCbzE3OEV4elIv?=
 =?utf-8?B?cFB0TGJ2OHlVZGVYcmMyNE05VFNQRXdVRGdiUXQyODkxYTJSeE9iWTFJb0tm?=
 =?utf-8?B?b3FNNHk4aFhnVWttalpybHZnc29FN3o0bThYa2t0Z3lDLytTWm5PQT09?=
X-Exchange-RoutingPolicyChecked: ft1/mT8lSRkzlCmV73EVQXTfu13m4gB8zeiplzD+jYL44iMLOtTjQbudTKZVQI2q7ul9bVySRuRk4xMbgFlSNHOuEiutPoJMfw5L2L2Wf9aSMynVEBe5muhnvXg9Q2tH7PmxPy0eVB4o65wv4R9bPCk4OIXk4qEgd1EYRHBCoQqUZHaLsxji822FR6SSsmm2Y7zK8MyGPKsmwl9D13qSg5O21mQxnlvcQFL9qS4eA/YSGMX0GtZTvr4tK4OmuxXwykVTOBVlt5F924/O86zghJT1qSpUUU+vg6R9E5YRF1n/btXcR9VkfnhxW8i7U7saPAU+rkyVbCjVveJNmfuDYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bfa342-d803-4772-6965-08de939cfe48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:26:02.7029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIBd/tRorawv3wQhZymXpbee4+dYjgxo9HEkAbhIC0PCQP6M4QzvHNGu0habauUEcqMU7Xz9UZE00FrXoy2S+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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


On 4/1/2026 1:23 PM, Raag Jadav wrote:
> On Fri, Mar 20, 2026 at 03:55:58PM +0530, Riana Tauro wrote:
>> Add a flag for RAS. If enabled, XE driver registers with
>> DRM RAS and exposes supported counters.
>>
>> Currently this is enabled for PVC and CRI.
> This looks like it should be the last patch in the series.

yeah no other usage. I can move it to the end

Thanks
Riana

>
> Raag
>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>>   drivers/gpu/drm/xe/xe_hw_error.c     | 2 +-
>>   drivers/gpu/drm/xe/xe_pci.c          | 3 +++
>>   drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>>   4 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 150c76b2acaf..bfb23d6c0511 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -191,6 +191,8 @@ struct xe_device {
>>   		u8 has_ctx_tlb_inval:1;
>>   		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
>>   		u8 has_range_tlb_inval:1;
>> +		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */
>> +		u8 has_ras:1;
>>   		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
>>   		u8 has_soc_remapper_sysctrl:1;
>>   		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 2a31b430570e..3ab0fceb151f 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -520,7 +520,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>   
>>   static int hw_error_info_init(struct xe_device *xe)
>>   {
>> -	if (xe->info.platform != XE_PVC)
>> +	if (!xe->info.has_ras)
>>   		return 0;
>>   
>>   	return xe_drm_ras_init(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index f5dd77b6680f..e44003b5aee3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -364,6 +364,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>>   	.vm_max_level = 4,
>>   	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>>   	.has_mbx_power_limits = false,
>> +	.has_ras = true,
>>   };
>>   
>>   static const struct xe_device_desc mtl_desc = {
>> @@ -471,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.require_force_probe = true,
>>   	.va_bits = 57,
>>   	.vm_max_level = 4,
>> +	.has_ras = true,
>>   };
>>   
>>   static const struct xe_device_desc nvlp_desc = {
>> @@ -761,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>>   	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
>>   	xe->info.has_pxp = desc->has_pxp;
>> +	xe->info.has_ras = desc->has_ras;
>>   	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
>>   	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>>   	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 08386c5eca27..cb7d79f51753 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -54,6 +54,7 @@ struct xe_device_desc {
>>   	u8 has_pre_prod_wa:1;
>>   	u8 has_page_reclaim_hw_assist:1;
>>   	u8 has_pxp:1;
>> +	u8 has_ras:1;
>>   	u8 has_soc_remapper_sysctrl:1;
>>   	u8 has_soc_remapper_telem:1;
>>   	u8 has_sriov:1;
>> -- 
>> 2.47.1
>>
