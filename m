Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613CCEE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03BF10EA8D;
	Wed, 11 Sep 2024 20:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oi4E1sXQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75BD10EA8D
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726085636; x=1757621636;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3A6WmBoynJXCltsQC17eFQLNzA2bguY109/yWUbXoJQ=;
 b=Oi4E1sXQCgssNzX9jhCdggKfPg0epIBn0eDtaRJ1EmVkv1TshgXLGJD2
 bUjbbpzuNPCwOPtnV2LN11Prb1edjAluZSXHupkg8eufJmwMo67V5z37k
 wRMbaNs6m2K1xFdAkqAQKQiMJm0Rif5UwF5HoJSpMrULikVgfG78D4fEg
 IRr+5xfY3oK9gTR1Cq1jj+f6jf9VhO5qFdk4aCZB5dWsfEmamX9oQddQl
 WV5IN4zSoGrR/024UZA6elNs2A49wMNcRpAxPND3xG7VaDVg/rBEE+Lx6
 ZCDEt3O5qLHUrIkMMQbNskgKfWgtkzIkPSIR1hkPtu8imRz+TQ4jV2SZ2 g==;
X-CSE-ConnectionGUID: YT52KJqrQ3ecTHy6FZ0oFw==
X-CSE-MsgGUID: ElrZshLORmCzvy+4rVWwtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24449299"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="24449299"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:13:55 -0700
X-CSE-ConnectionGUID: xoJvoCUaSK6TbqSEiWfUFQ==
X-CSE-MsgGUID: 55NOq3hJS2KU4qmrR8o+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67783965"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:13:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:13:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:13:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAEeGlDOpFb4SQI7PmE1WKyehrD0btHDsQg/8duq2AvA3kc2vEpQeCojm0o25BQYIQ/AdEF02lK9bQOPlm3PucXDiH90+MXKo/ddpMZCBqtVjkAmNrAMRwPw/lplYau9wQjGoEcl7ewNJU2DPn92xdeGbljobW1xa1OkMZ1UEkyAVtIOuIKRJpKV3l0+GRNO9roTqifoVEDAADn1l5mU4o1PRS+TfC1mtXV738Mnpga8UQ1KLtIw9awDS4AEPr/CptUGVCf/edeDtzHGgh49GtoCQrGjeWdiJirhP8/r6KiWPCOqLmJaSY1AStbPct0TUi4zsPfz/yBAjowxpghB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/G+VOZrG7sMIs58YqFdyu0Lpk/dagmNm7D9aIBKt6M=;
 b=ViiGt33QKvrAbzGvfPOEamPtMVsIK4idywAMCnZtHQCq/RK8Jk4cBkp8aXqPcPAMPeH+hLH39CO6w/cMuuJ1MpxdHlUZ3q3tCO/9xhvdRjuzpvspk39CdjGG30psLhMFsHWaSRKeXSax2Xk99X+niCmuanxvLmKehAhkEnnKV/IJ+SMj2Cb5QzeIvKlsW8su4c4bq6qA2JwdfmvxyKLbDoRIN35E1hohTOy3kTithZpX5h28h1uIZ5vmJb9aDbWoGMwgFM/NYoLcAOmYnHFMw9ITjDYyJJXrxb57BSMMCzh8Xx1VMaWv9eV+MeelYSwQVh9BzBeYUXV5Tl25uZc6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA3PR11MB8117.namprd11.prod.outlook.com (2603:10b6:806:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 20:13:52 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 20:13:52 +0000
Message-ID: <b56b7826-55e7-4459-a5e5-8472975cbb3e@intel.com>
Date: Wed, 11 Sep 2024 13:13:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] drm/xe/guc: Dead CT helper
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-8-John.C.Harrison@Intel.com>
 <45901fbc-56bf-4f9e-8044-eb83e24f02f4@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <45901fbc-56bf-4f9e-8044-eb83e24f02f4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA3PR11MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 8979b1ee-05dd-4607-11dd-08dcd29e415b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SytDTDJ3QnowME5SeXl3SGx3eEgwVjlhS1gwRUQ2SmNSVE00ZXJqMkcxaita?=
 =?utf-8?B?cXhyNG1WcnZ5dklhYjBOM2psRjdtMnVBN0ljb3ZZcjRIb2hPRndYOERxclhG?=
 =?utf-8?B?Vm9hQW5sZ1VBV1g1blVraXhmZFNTNUNmL24rY1JxK2V3cVRCdWpDMml6Umll?=
 =?utf-8?B?OFpHdTNteFJSVDRwZEpUYS9Gc0VCckllWDhSSzA4aWF6bjNIbDFoSDdrRmZh?=
 =?utf-8?B?eUhQR0RkUE54bk5vRHdzQzZ0bHpMazVDS3d2VnRMektDcWZ5Tzg2a3o3dlZC?=
 =?utf-8?B?dzVsanA2VnNHZ1laNll4VFh2VE92K1pkRExQUGhPTTNQSElPRnE0cTJBNHZM?=
 =?utf-8?B?TGZURWdoQTREZEdyTk5IUjlqZzBLem1ZaGduNFRvNkV1bkhWNUpYZzFnQ1Rj?=
 =?utf-8?B?NWVGUHpVRk5Hck9qRVFlZmRabmFhcmlab1RmWmRObEJmazhuT2pVdGlya0Q0?=
 =?utf-8?B?SDFlR0RKVkVubVpZMFNhNGxvdUpxU2lKZmo3aVc0NkRMNjI0d3ZSSnYvUTZW?=
 =?utf-8?B?cjlRUXZMZE12NDliN00wYU5ZMjRHV3BsSlN4Vi9kKzZna2xYS2RNdGkwdEY3?=
 =?utf-8?B?bG1ONFFBNnEyVmNiUTZtTVlLMk1lQ2c1YlpjMmVLODhET3NXVmlwTUNmRVRD?=
 =?utf-8?B?MTZ1UEhwYUFpTDZ1MnhRNnpES041aGF1YStyTzB4SmFQY3VFM2xybjdZT21C?=
 =?utf-8?B?OFhmcnhoVG1jNFNmeHFoaXpZa0ZmaVlWVGx6eUlmcU5CZCtWVjBzVTZvS0VK?=
 =?utf-8?B?dm1zQ3NCTTBtcDhReDY5TXNUOGhJODdqdWN4UGZ0R0JQK0p4L1NUNzhDbnVz?=
 =?utf-8?B?aWZXVFZZS21TK0dlR1c0SllJMkxHaTV6OEhsVnhodDhhMUVFNGhiL0pmcXZZ?=
 =?utf-8?B?WW92cjBHM2UvQ2JiSHMyaC8xTks3bWFNYkY5bE95TUtRMktoVTIvdHNBRW1W?=
 =?utf-8?B?WlVLbkdqZTFEeFNSSm1WRG1kT1NUMUIyTEtOdSs0ODJ1NzY4WlVNc01nYmd2?=
 =?utf-8?B?NlgzbDkrUzZNTTk2ZFdsVENKdEhPZW1hMkJPN3dFSU5Qbzd4VGtMeFJoTUU4?=
 =?utf-8?B?Tk5hWXdQSkZrTVB0dk9LcWZsVC9rZzQ2WWczb1FDc0Jhc3ZaTlZKWjBYeHIv?=
 =?utf-8?B?cXdwUnpUK0VBbTB5Tit1Z3EvSmN5bnovYngreXBGZlFMcGN6dzdHUDJucGlR?=
 =?utf-8?B?T1plZDU1UnN1dURPaDJmdzhNYitPYnNWQ0RUYnR3SVNuZWhQbWZoWmdYa2FZ?=
 =?utf-8?B?QndoMXByd0RHTkhRUTh2RGtQcUtiM0FocUE1Q2loazViZEhZWmpaWE1EM3Q0?=
 =?utf-8?B?bDJEa2Vta2RMSTZJRC9ScVNxVWt5ZVJ1RE4zd2VXNno1Z3paUFkwcnZ2VEhE?=
 =?utf-8?B?RUtZMm5NQ1ZHU2tzdnozQVlpVHlCZ2t4N3hiZW1vcHQ2ckZjN3BRRjhQK1p6?=
 =?utf-8?B?WmFUV1V2SG5PVEtIdkdpbkVaeTlwaDFjbVdpTkRFZEpXNlNMcGRRdTR4S2px?=
 =?utf-8?B?anl4ZkIrcTQ3WG9Eb2tKalpJQ3J4YVZuRXNCVDdnV1hDc0FjUDVsS3BDWUo0?=
 =?utf-8?B?TlBCTGovejF6ZXZsd1A4SWNOMVQrZFBCVGZtV0l4Qzh2NzFheU1NOUJRdHkx?=
 =?utf-8?B?dEhyTWZualloaDMzR1BQSEN4cS82SnFNZTlwaE03NEgvUDlmOW1jRm1jWmIx?=
 =?utf-8?B?aXlxS3Ivc1BGZjd2b2hjTWZxWVM3aE16ZjFudkorZUNnM3JyOUFJUG9EZ3Rz?=
 =?utf-8?B?OGtmQzZNTTRqOGVHOTNrWWVlV2txS0t1YkpJZ0crdWVWRGtvYnBNTDhPYkl4?=
 =?utf-8?B?RnA5YXhKMEN6WExqSm5IUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVlGMUxOa3huY3QwbHdqeXFGbFhJZGRiZHprSGNqb0dXSU1jWWZuUk1jcitu?=
 =?utf-8?B?YUxFQUltMnRqNW52akVoWlozQjFyL0k0ejB2clFaWklzV3F0QnBtWmdrNEFw?=
 =?utf-8?B?bklQTlVrOXE0Y0xmYTFTdDAwaGhES0RlaVVpdGx0RXg2S1dNSkgrWG13Ykdq?=
 =?utf-8?B?NmtBYmpPRSsyWFVTbGZjWmpEazZLN1VReTdVbjVFQzJOVVR3WnRPQTVoUEYy?=
 =?utf-8?B?eUxjbDFhMVNtSWJ0RWs2cnhhc0sraFhBdnlBZ2xucVlrdER1ejNHRjJmRlJn?=
 =?utf-8?B?VlV6MjBKUjl6N1BxcVcwM0JidjVLUEhlMkhibDczamZBc1RCalBJMjYvcGUv?=
 =?utf-8?B?dS9qZ2RmYTV2TzBORVNFa0c2VlgwbzIvaWFRaVpoMThhRi9QVDVld3dOM29E?=
 =?utf-8?B?NEdVb0RQMWNKbGtHaEtyd1RNZWpJVTl1VWJQZVhRK0ZtS1ZEWURwQzFDblk2?=
 =?utf-8?B?bUV3V1lRZ1JuQUJGM0hMckJFKzJqdDk5Y1JTWHpyRVFpb2NENkIvRnl2UlJS?=
 =?utf-8?B?UTZsUTVueUI4aTA1djl0QjJ2VElWUUUzamxzbWV4QmJnMXhpK2xaeWdjc08y?=
 =?utf-8?B?WEZPWldCcmtJdVUzZ2FtWnFKTHpHRHZDZUxiZmVZL3dubVNaVE9LTE5KM05W?=
 =?utf-8?B?T25TQXJtcmZxRkpUM0c4bEtRajBoQjd4dkcyeGVBaENjMXFtQi9YeDV2aXgr?=
 =?utf-8?B?MlFCRUV2S2h6bU13V3BWc3dTMlhOVVdVK2ZHZ1E4TjNoSEJSNElSRHZtMUFF?=
 =?utf-8?B?MG5vdEhRUHhadzVadGUvNmFPNG5EN0RwQTlsY1hsMnl6RXNWbnBzdDl0WGZV?=
 =?utf-8?B?Y2VEamRqemFUTWE2S2F0bEdtODBON0FTM3plNCsrdDVvR1BSSzRFaHJMWmNH?=
 =?utf-8?B?MW1ib0ZjZnNsZHpuVU5rZzZteFR5bU9FbFdLRE9pcVRFTW0rTU5Rc21CQ3ZT?=
 =?utf-8?B?V1pkUVpwYXhQNzh4ZjRTc0dibHF1SHVWVkRIZU91SUc0Z0pndjRqTk0rMTdv?=
 =?utf-8?B?UFRYUFJQK1RETnR4MGVKUnY5S3huQ2FUcGwzUG9aeStvdkh4N2tPUTRRY3FR?=
 =?utf-8?B?TFFtMVJIcUFMQW4vSVE0OGhmbnhlTnhjNUhvZHk0eSt2N2p3anNob3ZoZHpT?=
 =?utf-8?B?WmE0Snh3end2WHllN2g5OEdVVEVzMjdJcWF1RE9jTGFUTkwvZXZVbnVLYVlZ?=
 =?utf-8?B?YkVLOXF6dkJGS1NjVlErWVRYVnhqTXQ1RitPUVhTM1NRa3QzeTFtL1BTbTla?=
 =?utf-8?B?dEE3eTIvUGpiTm9FU3orKys3QXJXSzVnQStBVmF0QTY0cUpwUFNaZDFHa3A4?=
 =?utf-8?B?VWZtczA3ZVNTN1ZIbGZZOG5ZTmVaVUFqRFhxOE4rbmIvd2hVL3QrM3E1NVVL?=
 =?utf-8?B?Q0tRaEsxdmp2eXpvaXp3dVVQclFteEJUOG1IRThzKzY2SGMvWDUyakZSWjhM?=
 =?utf-8?B?TlR4amMybElVTlVDekxOSEtMZmhYNzExMmJQckwyWkZ6eVNzQkhGNzJ4QzVo?=
 =?utf-8?B?Q09ZcXpJM0wrZFI0UHR1U2hFRCttT2RDWExkNnBFblRpQi8wa1o2UkNhK1l6?=
 =?utf-8?B?alZkYloyNUtrZ2lVV2RjM0dFcEtad0loRE5qMDBCZzRaaGpRYUx1VURjRWk0?=
 =?utf-8?B?K0xnWkI2djBOYkE1MzhvckJNQkRFMHI2Wm1MM1AvL24ybkRzaDhNdDZadVNM?=
 =?utf-8?B?eEZ5ZTJwTVdrRDhVeUY1ck9uRTh4bU5VVVZ5RXVnaXBhNkNuaXJYbWl2bWoy?=
 =?utf-8?B?RE1vOElSazNBS043WFVueVBJQjJCUTM4Z3JkUGdoWXVHcXZCMnRodWxwSDEx?=
 =?utf-8?B?cXZFSjlVcjBhTjU3eGdGM3B1alAydGl2dm1VVGErM1dKSzN2MDV3Z3Q3bDdI?=
 =?utf-8?B?R2xDbU1vTEhIL0RoKysxSkovcG9kTTk2cjJiMEsyY1VwUlR2QWk3Y2d6c1RL?=
 =?utf-8?B?b0NxVHNhWElqT2Q1MmpibEUxMnpDWmlNZlRuaGt0RFFNaHlVcG5RU0ZlcWxJ?=
 =?utf-8?B?NDQxdjhmTVp6c2tqWituQ2IraXM3UFVWcklucEtYbm5jd2VqVzIzbE50b2Rz?=
 =?utf-8?B?Qi9ZdFh2T2VxMEV5d0lBWlZqVVZEREhEbVhFLy9lRDlIcEFxY2J0QWZDeUMx?=
 =?utf-8?B?ZEprZi9FSC9Nemp5TE1zUlNWd0M2THlqMTBWNDA3RG1xRnRXcjlxZ3E0RVVH?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8979b1ee-05dd-4607-11dd-08dcd29e415b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:13:52.4343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wm6PZLZJ4NsxceKto4RlYDT/PXt/J6QNfXqgiei2U4tEoqNt4xKYndeWts02FuMyKgk0bixehamVwkP59CiP0u6fLYZK/doPQeirbknizAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8117
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

On 9/11/2024 12:55, Julia Filipchuk wrote:
> On 9/5/2024 1:51 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Add a worker function helper for asynchronously dumping state when an
>> internal/fatal error is detected in CT processing. Being asynchronous
>> is required to avoid deadlocks and scheduling-while-atomic or
>> process-stalled-for-too-long issues. Also check for a bunch more error
>> conditions and improve the handling of some existing checks.
>>
>> v2: Use compile time CONFIG check for new (but not directly CT_DEAD
>> related) checks and use unsigned int for a bitmask, rename
>> CT_DEAD_RESET to CT_DEAD_REARM and add some explaining comments,
>> rename 'hxg' macro parameter to 'ctb' - review feedback from Michal W.
>> Drop CT_DEAD_ALIVE as no need for a bitfield define to just set the
>> entire mask to zero.
>> v3: Fix kerneldoc
>> v4: Nullify some floating pointers after free.
>> v5: Add section headings and device info to make the state dump look
>> more like a devcoredump to allow parsing by the same tools (eventual
>> aim is to just call the devcoredump code itself, but that currently
>> requires an xe_sched_job, which is not available in the CT code).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>>   drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c                | 280 ++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_ct.h                |   2 +-
>>   drivers/gpu/drm/xe/xe_guc_ct_types.h          |  23 ++
>>   5 files changed, 280 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>> index 8f86a16dc577..f58198cf2cf6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>> @@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
>>   #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
>>   #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
>>   #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
>> +#define GUC_CTB_STATUS_DISABLED				(1 << 3)
>>   	u32 reserved[13];
>>   } __packed;
>>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 34cdb08b6e27..3fef24c965c4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1176,7 +1176,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>>   
>>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   
>> -	xe_guc_ct_print(&guc->ct, p, false);
>> +	xe_guc_ct_print(&guc->ct, p);
>>   	xe_guc_submit_print(guc, p);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index a63fe0a9077a..e31b1f0b855f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -25,12 +25,57 @@
>>   #include "xe_gt_sriov_pf_monitor.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_log.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_map.h"
>>   #include "xe_pm.h"
>>   #include "xe_trace_guc.h"
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +enum {
>> +	CT_DEAD_REARM,				/* 0x0001 - not an error condition */
>> +	CT_DEAD_SETUP,				/* 0x0002 */
>> +	CT_DEAD_H2G_WRITE,			/* 0x0004 */
>> +	CT_DEAD_H2G_HAS_ROOM,			/* 0x0008 */
>> +	CT_DEAD_G2H_READ,			/* 0x0010 */
>> +	CT_DEAD_G2H_RECV,			/* 0x0020 */
>> +	CT_DEAD_G2H_RELEASE,			/* 0x0040 */
>> +	CT_DEAD_DEADLOCK,			/* 0x0080 */
>> +	CT_DEAD_PROCESS_FAILED,			/* 0x0100 */
>> +	CT_DEAD_FAST_G2H,			/* 0x0200 */
>> +	CT_DEAD_PARSE_G2H_RESPONSE,		/* 0x0400 */
>> +	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x0800 */
>> +	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x1000 */
>> +	CT_DEAD_PARSE_G2H_TYPE,			/* 0x2000 */
>> +};
>> +
>> +static void ct_dead_worker_func(struct work_struct *w);
>> +
>> +#define CT_DEAD(ct, ctb, reason_code)								\
>> +	do {											\
>> +		struct guc_ctb *_ctb = (ctb);							\
>> +		if (_ctb)									\
>> +			_ctb->info.broken = true;						\
>> +		if (!(ct)->dead.reported) {							\
> Do we need to worry about a second dead ct causing conflict with quick
> back-to-back CT_DEAD? Suggest to set reported here and to clear it only
> from worker thread. Snapshot can be used instead of reported to
> determine if it has been printed (in worker_func).
No. We are only really interested in the intial cause of a problem. 
Subsequent failures are likely to be caused by the first. So once a 
report has been printed, we just ignore any further failures until a 
reset has happened.

> Should the snapshot be taken in the "CT_DEAD_REARM" case?
No. That is the reset that turns the reporting system back on. I.e. it 
re-arms the reporting trigger.
>> +			struct xe_guc *guc = ct_to_guc(ct);					\
>> +			spin_lock_irq(&ct->dead.lock);						\
>> +			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code;			\
> Does this field need to be cleared or does this accumulate reasons CT died?
This is to accumulate in the case of multiple errors in rapid succession 
(i.e. before it has managed to do the dump) to account for the 
possibility that the errors might not be noticed in the order they 
really happened. So it accumulates everything up to the first dump and 
then goes quite.

>
>> +			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);	\
>> +			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);	\
>> +			spin_unlock_irq(&ct->dead.lock);					\
>> +			queue_work(system_unbound_wq, &(ct)->dead.worker);			\
>> +		}										\
>> +	} while (0)
>> +#else
>> +#define CT_DEAD(ct, ctb, reason)			\
>> +	do {						\
>> +		struct guc_ctb *_ctb = (ctb);		\
>> +		if (_ctb)				\
>> +			_ctb->info.broken = true;	\
>> +	} while (0)
>> +#endif
>> +
>>   /* Used when a CT send wants to block and / or receive data */
>>   struct g2h_fence {
>>   	u32 *response_buffer;
>> @@ -183,6 +228,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>   	xa_init(&ct->fence_lookup);
>>   	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>>   	INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	spin_lock_init(&ct->dead.lock);
>> +	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
>> +#endif
>>   	init_waitqueue_head(&ct->wq);
>>   	init_waitqueue_head(&ct->g2h_fence_wq);
>>   
>> @@ -419,10 +468,22 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>   	if (ct_needs_safe_mode(ct))
>>   		ct_enter_safe_mode(ct);
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	/*
>> +	 * The CT has now been reset so the dumper can be re-armed
>> +	 * after any existing dead state has been dumped.
>> +	 */
>> +	spin_lock_irq(&ct->dead.lock);
>> +	if (ct->dead.reason)
>> +		ct->dead.reason |= CT_DEAD_REARM;
>> +	spin_unlock_irq(&ct->dead.lock);
>> +#endif
>> +
>>   	return 0;
>>   
>>   err_out:
>>   	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>> +	CT_DEAD(ct, NULL, SETUP);
>>   
>>   	return err;
>>   }
>> @@ -773,8 +895,13 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   			goto broken;
>>   #undef g2h_avail
>>   
>> -		if (dequeue_one_g2h(ct) < 0)
>> +		ret = dequeue_one_g2h(ct);
>> +		if (ret < 0) {
>> +			if (ret != -ECANCELED)
>> +				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
>> +					  ERR_PTR(ret));
> Is it correct there is no success condition here? Would canceled case
> need to route to try_again?
Not sure what you mean. This whole block is inside an EBUSY error path. 
As part of the retry, it is trying to make space by clearing out G2H 
entries. The ECANCELED error is because a reset or something known 
happened, therefore there is no need to re-report it. If the dequeue was 
successful then it continues with the retry by hitting the "goto try_again".

>>   			goto broken;
>> +		}
>>   
>>   		goto try_again;
>>   	}
>
>
>
>
>> +
>> +static void ct_dead_worker_func(struct work_struct *w)
>> +{
>> +	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
>> +
>> +	if (!ct->dead.reported) {
>> +		ct->dead.reported = true;> +		ct_dead_print(&ct->dead);
>> +	}
> Would this guard work against quick back-to-back CT_DEAD calls? This may
> not happen? Suggest to move 'ct->dead.reported = true;' into the CT_DEAD
> macro. Relates to CT_DEAD macro above.
As above, there is no concern about wanting to do back to back dumps. 
Once a dump has happened, there is no point printing anything further 
until a GT reset has happened. At which point everything is re-enabled.

>
>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>
Again, you should not give an r-b when there are many concerns being 
raised. An r-b says you approve of the code as it is and are happy for 
it to be merged.

John.


