Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB91D64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A5010E027;
	Fri,  8 Nov 2024 22:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPCol+1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EF210E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731105861; x=1762641861;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j68N8RPtiZYCAehqSaCuoP2kbVQl8ntCyU88LmJqA/s=;
 b=LPCol+1wtfSMA+MWcwTSmXvpqxW7QSlXu+vtt+18puD19qkqV3VVmztU
 5kytmyfNOfO2LkgNBD2nM6lOyMMNCzzGM1v01Tn4btKsjMm2KTTBVr8H2
 vQFDO/VCkSWESMWinUNA3XTomWXVSKFtRprmDHk4QMAuDT4nQlru+fMaW
 EYNeGGR4Q9lue5p58+KUdu8hXmisH8tyJIzxjmyDTy21ZodrWLIimiPif
 8ReJpIUE0QGfsqdt6kNJAMFTlJHcDNL9Z75hPvZtYaOayejLsi5vu4F4Z
 dLPw3RAwTjUy7kuIrUTnVQE2r8rlU7ijkKBoVLeza8rnynq1Mfe0Dxq23 w==;
X-CSE-ConnectionGUID: l6i9qiDZT9CnE79B3CFRGw==
X-CSE-MsgGUID: +7EyheTpRKuhzTFhBGZIyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41628168"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="41628168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:44:21 -0800
X-CSE-ConnectionGUID: i15BMo3tQfSHVuXU69Ec2Q==
X-CSE-MsgGUID: WN3kGMJMTnOv1QHabZtYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90320729"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:44:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:44:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:44:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:44:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZ7lXTLBI9V7tjyXltHQNaUi9NUdFm7XTjn7e0D73Ge6YnDTzwoA9hBsEH1A31kRGKGncONkVWdiy0C5y0ychuaNPv7F4j7+y8BTA8PagQeE2UchTqPRHa8dmRW6XCzE9pR88PzKj8X+XxHLiXSMjPhmtvZMNt9lFROQZGl3BIhu+HRFnw/I5SG8/M5Z44nstp5QuRueu1x2IWiArtr5zZnny6KlT7WH08k86mN7XD0VarMIdiN8brMozWSyw5dn7OEOyPRwmfTQk+90c8af4DGH56Hxgy4hMXLleU84H/174I9eCHUKmD/1S6S2aBXXUZIVvciMhtDDpsSGjEVHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9++ZVGDqejR6QmAkVInx0yzrli3J+VDkp3q84c45VA=;
 b=TUe3EsULks0OepB7EBuXrEek9+aIAurLKnvPRh3QMGnJ8InWqoqq04dwEnxmKW+dIBoPuJyV+AF5toNu9LJlFBTAm/4AprAaD2PWeCJJRZei+cVArIk4n0ALxDsITuwz6CmdNJ9MHckh3aZBO0J8wDDStxvCY+8ysJXZuMhptrYdG983GFWejPUBHUJFqzLrXndwSCP05o87jyE4BMy+hicTvPstquy/iDDPgbbmcjmgedBk78alo54E/Ws/A3WGuLtxAMe4i1YM6o0lZokMGjC7tpi15NsXlbTm0UEi5oWo/2Uvif5qacEroFEFvx+PQlzUZmz2jXVXRVOGnT92ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 22:44:16 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%7]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 22:44:15 +0000
Message-ID: <afa1bb1b-b76f-4d04-8198-4cca721fcb16@intel.com>
Date: Fri, 8 Nov 2024 17:44:13 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fi?=
 =?UTF-8?Q?x_missing_init_value_and_add_register_order_check_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241106191805.300268-1-zhanjun.dong@intel.com>
 <173104443122.1425725.8075362833990863019@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173104443122.1425725.8075362833990863019@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: dce5e866-6ac7-48a0-3f8c-08dd0046df78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHVDQ2NPdkFCSE0xVENHU2ZaRFhBV3dsMCs2MTBCTm9CNi9JVVJCZkwrUWI0?=
 =?utf-8?B?QkdGSEsyUTVtd2MxWjhQa1M4amRFRUgwVUZlSkpNZzl4TGJNSHZSbGtOT2pv?=
 =?utf-8?B?TFhnanhqa3NhZE5OclExd0lRYnM5OEdKdjZqdEIyMklzWVFUSjlUSzJnSjNO?=
 =?utf-8?B?cEVDVEpnSVU5Si9kd0FhNEMvbit3YjZCMm9jOVZtdmE1Vm4zZkZjQVA1emJQ?=
 =?utf-8?B?dlJaem82d3V3Nm1yTmhISTVYc21jTXZPNU5sSGNQVnhWMCtNN2hlNkdGY0hT?=
 =?utf-8?B?V1hnMnNDNkIvQVdNdDJxQzdzT3lnSFIwVElTOHZNd3lFZGpWcFNsTlB6L1FK?=
 =?utf-8?B?djJ6S0xiQnV5dk5vTmlVYVBrc2hjRUFlMUFFMzluWmNUVmF5YjEydlFvNHlQ?=
 =?utf-8?B?eGtxb0Y5a3BKK3NzWnJlcWdSZzZEQlp6dTVzMzJydG1LME9wQWUxRXEyS2hK?=
 =?utf-8?B?V3NVTlJHL05RK3VteExOOXhXbEtsbkdla01Rd0Rld1B5em1hbkM0RkxZM0d0?=
 =?utf-8?B?WU1HanlhMEJqcFNQMkZ6VytMckxVbVlDaDZtdjUwSFdiU2VJTXBNZGhoT0pl?=
 =?utf-8?B?NlJ6ejRjUGNnV083VlJsdENvNElib3pDQ0tDbkUyTG9HbDE5cFJoNlRZTnB0?=
 =?utf-8?B?czlSclhjd3dMNzV6Um1CZFExbFZ6WFBjRGJhUXl3NE9KWlZjWGV4MG5Pbk1L?=
 =?utf-8?B?K1lWenFEd3YvMy91VDNjaVArR01XNG03dVJXdkJjK0ZGRkI4a1JVdW1ITEV3?=
 =?utf-8?B?NW02VmdaK05jYjM1ZTQ1V1FKZ0VWeGJmTWJYeUpBRGNuZXlUVG05NFVxVUQ1?=
 =?utf-8?B?ckx4ZWREbm9KOUVvc3l3dzZUZXlGUHUrQzM2L0dFaFMramVVcVpxSXRxV3Qy?=
 =?utf-8?B?TkRBbDNmK2UycHZoS1h1SERMd1NqdXEzWkgyVHJVQWhrLzRsOTZPV1A0NnhG?=
 =?utf-8?B?NXFqYnlaeU1jNXBHbklSMldQNDZlQ3BjdmEzZW1wMHpSTVdlTUZaL2Z3eG9p?=
 =?utf-8?B?VjA5SEw2eGZEZnhudk4zemU0TjNCVko2TU9jVFArUnZmd09aQ2Y0R1hicnpT?=
 =?utf-8?B?eENYM0NNQUx5NkZxNlA1NnZwQlB2Q1J6OFJKUHZOSWZGL0QxeitFbnExK3Bp?=
 =?utf-8?B?Y3dBQmR4RHFORHhtOHFiM0RHaXZ4L3NrV2dnMDBPY3djU0F2U2tia0xpcmp2?=
 =?utf-8?B?ZWZ5RmZZYk9rOTNMb0d0eHh5K054SEFzbTczV3dLeDdsUXF2dFlYbHoxQlZ2?=
 =?utf-8?B?aWRjaWN3UkYwR1BRRng3T21QMWp3OTV5WXpvRTBmQkNHVlh5dUFrS2RRUU1s?=
 =?utf-8?B?dkxPeENLaEk4cHA3aXVmY0pLdFBnTnpJRVJRQ24rdFZaZjB0T1hOeUdkZmcy?=
 =?utf-8?B?cW5PcWpkMm1NTE1LaG40aXo2QjhVM1lUSHNQcXV6dGd0MFNkTmZ1a3RKakJI?=
 =?utf-8?B?YjEzcXQ2SGIvZGI1aVhlNjhmYndhazd0RG5YamdUL2xWNmFualR4c1FpNVpn?=
 =?utf-8?B?WW1vRjI4SG52Z0xqak1wN1pJcWlqZlUycllIbW5KSjBXcTlsRW9Vci95d09t?=
 =?utf-8?B?UGNEbU81RzhWcVp6WG5IejM1ZkN4SldCZWVwTWtmNlEvMjdSMWdLVndtQnpy?=
 =?utf-8?B?L0hSRUlyZ1JoQlpTY3Fvdkx5UGl6ZkU3NjAyTlUwT3NUM3lzSDlvMmgwenVz?=
 =?utf-8?B?Nll4MzVzZHVPSytaM1U4d3pHR3g5UlJtbkp2TVhKK2Y4d0hVVzJiSDRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlVJTmNFTnVmVzBab1ozWDdoL2NHNnN3R1Q4cEJaNjNjZGl0R1VhNElaejVI?=
 =?utf-8?B?UjdPMkxLZ3o4aG43YzZ4QW9BaWxOWDFaekV2NUpHNHRVZ1VQRTYwbkp5VkZE?=
 =?utf-8?B?aE1zYkRQQ1FmUzhLbHF4STd5UnNDOGdOZ0F0dTNnRkxrdURaQ29GM2tWVzRK?=
 =?utf-8?B?SUR6VDdyOGdwWDdldklUWGtvY2xKMTUzNTI0YXpYRGdMODRYRlNSTlNtUlFH?=
 =?utf-8?B?R3VoQUx3SVJYOFN0SjE0SGc4d2FUcHlPTGZQNHVFeXlwSkVqU21zc2dzTS9j?=
 =?utf-8?B?anpQaHhTYlgveDBtb1pIbENFbXNEcExHdmZLZ0JJTFhVYWtrZ0xmSnFEcFNJ?=
 =?utf-8?B?SWNIN0JmbVZ6cHZZNHhJMWMveTdqMzBDMHc1bldHamNaREVMRlZyNExDalJU?=
 =?utf-8?B?aW5yTk1iRUo3UzhJbmo5OUdVRWZqR0VoZ01jTDUvYVJwRjIxZUppU2lYRC9D?=
 =?utf-8?B?MVo4cllsWTFwcDB3RzdEZ29tRVVmR2lSOENTb0J2T09JNDVIQWFna2hJb2ND?=
 =?utf-8?B?dndCUWlMNDQ2Tm5GUlBweEgzTUFMZHFtM0doV1Fia0hVZEZxUVJGcEtqbEZH?=
 =?utf-8?B?U05BL0JpMTNiLzByNXNKK3Z2a3BFUTM0cWQ1SjU3WHV1OU1VaGd3Y3k3VjFR?=
 =?utf-8?B?ajMwSVlwSks4NytCWGJ0NWE4dy9oMDlmY2RMV3BNRzFGWElqYXZEbGhCSUdz?=
 =?utf-8?B?d2lRay9GODlLbCt4b2RxaXhPYkRaYmsxcExWK3RnM1NvMmZ6c1lwcDN2MnR1?=
 =?utf-8?B?OUpOZlRTNE9ySkV5cmhRbSt5Z3o2dnJkazdHOXlpbXFDQTY3V0NLckRuU3E2?=
 =?utf-8?B?MGpjV1RWdVFCdWdTcTNiQWFGK2wzMjBONWJ2bWViMG5JQTlzemd5dXdkNkY2?=
 =?utf-8?B?NTVNRFlhRU8zRnIxaTJPekNKWDdZZXFkbEdmZ3VVREJiY2F2TGx1NElIMDlr?=
 =?utf-8?B?bzY2QWVLa3MwOURXdnZscWVkWUhWUHo3U1IveEkzUzRQUnIrVUNvYlJOV1Rz?=
 =?utf-8?B?a3hiSy9VU1ovTGxDM2YrZlVsdG1tVHBQWlV0VHBrdFB5WlZmRERXdmkvajZU?=
 =?utf-8?B?S2JNTHB2b2ZzN3VhR204WkZJRUFrKzZPSFpnWkxIL214U3B6dk5XWEF1YVY4?=
 =?utf-8?B?MXFsb0FnVW1nZGJoOGFaSk9KSUdEMVlqTFdzWk1BNTVwYWE4amg0UGEzbkZW?=
 =?utf-8?B?cFNvVDFOd1orYkF5clVISzB4TDFHL0o3MSszUnZWS2FWQStwU0J1Sng5VVB4?=
 =?utf-8?B?bTRKLzgzRXFacm1PZ0laT1FwSnNmZW96ZXpsbjliRHdhOS9LVG5yVlkzMUxM?=
 =?utf-8?B?WWRVOVB0N3RYWXJ4NkUrR09QR3RFSjVVdVhON0dzZWJLcmpjVTFZRHFnUE1h?=
 =?utf-8?B?ZEFuTXQ4ZDAxd1kxODl6ajdjZVgwRGl3NTloSng4cUJGeWltZDRRdkJBY05Y?=
 =?utf-8?B?U28zb3c1b0ZpQzZkQXlwWkh4Y05mRlQ2bjAxNGZjVWZxSDZNK2RnYnVDcDhR?=
 =?utf-8?B?OEVvUGpReXl0R3k4dytMaS9wYVJ1QTZOZzBEOTBTTUo3UkEwbDBnVk1xZXo3?=
 =?utf-8?B?bGRySTh5ZmtlQ2tUNDlBcWpJaHdReGp2NGh6Nk1SbDd2SDczM20veEg4TkMw?=
 =?utf-8?B?a092K2JqRm55bTROcnZXUUtpc3ROWjAwR0lGVkV3ZWh3NTFoUVVvZUFLQjFK?=
 =?utf-8?B?NlRqWE51anlvQURHam1YL2EvTnArWWtzblZRMFFUcStVS096NDdZanVYS1Zi?=
 =?utf-8?B?SG1TUStseUUyUXhkZGxDSkhGSkRvT2Y2UGhMd0NDTzZoSTNVQ3VpcmNsb0Nu?=
 =?utf-8?B?OHBJcklQOSt0a3dMc3ZWODNEY2MxL0VxUzNBQzlOY1phYlVtRm02OHFHQnk3?=
 =?utf-8?B?REt6OExrenhHdytIV29YSm1EbitwbFhuSjk4MTlvb05BVHh5a2JsT29sVzJu?=
 =?utf-8?B?UXdZK01QZXBXTys2eGRJSTRIK3ZiR2MwZ0FucU5NMTdnamlJeTJmaDdXZCs0?=
 =?utf-8?B?NERJM2xJOHhsa3Yvc0d3aHBXZFY3SEROZGNmZVdxQ1FOU1J4eWY5ekVLVG1z?=
 =?utf-8?B?QmZ6cmRwVnRvdVhCampRbG9iYkd2SHNVeDcvcjFvaGYxN1pOQTdOWUM4WUpY?=
 =?utf-8?B?T3V2WUt1V0Y2OXo5Qm1xaFo0UHFNRmQ3UWdDa2UxQVoydzc1a3pvSExBU2tB?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dce5e866-6ac7-48a0-3f8c-08dd0046df78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:44:15.7382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuKqOvnP2WpYLz8pAy1drqVBz2WNFcgku/b48figlfQKcEWpIPpRjW2Wc6826IwS23/rgwcJTJrPm6aUSr6Spg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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



On 2024-11-08 12:40 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Fix missing init value and add register order 
> check (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/140889/ <https:// 
> patchwork.freedesktop.org/series/140889/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3_full -> xe-
>   pw-140889v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-140889v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140889v2_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-140889v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/
>         igt@kms_cursor_legacy@torture-move@pipe-a.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html>
>   *
This failure is an known issue and not related to this patch
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/
>         igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-a3.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-
>         a3.html>
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-4:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/
>         igt@kms_plane@plane-position-covered@pipe-a-plane-4.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-adlp-4/igt@kms_plane@plane-position-covered@pipe-a-
>         plane-4.html> +2 other tests fail
>   *
Above 2 display failure is not related to this patch
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> +1 other
>         test skip
>   *
This failure shows on multiple other patchs as well, the failure is not 
related to this patch.

> 
>     igt@kms_vblank@query-forked-hang@pipe-d-dp-2:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-bmg-5/igt@kms_vblank@query-
>         forked-hang@pipe-d-dp-2.html> +1 other test incomplete
> 
This failure is not related to this patch

Overall, all failures is not related to this patch.

Regards,
Zhanjun Dong
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * {igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5}:
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-466/igt@kms_flip@2x-flip-
>         vs-expired-vblank@bc-hdmi-a6-dp5.html> +4 other tests fail
> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3_full and xe- 
> pw-140889v2_full:
> 
> 
>       New IGT tests (7)
> 
>   *
> 
>     igt@kms_color@ctm-signed@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.89] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.39] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.37] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.34] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.34] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.33] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.36] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-140889v2_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@intel_hwmon@hwmon-read:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@intel_hwmon@hwmon-
>         read.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1125>)
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/
>         igt@kms_atomic_transition@modeset-transition-nonblocking.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v2/shard-lnl-5/igt@kms_atomic_transition@modeset-
>         transition-nonblocking.html> (Intel XE#1701 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1 other test
>         fail
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_big_fb@y-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_big_fb@y-tiled-max-
>         hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@kms_big_fb@y-
>         tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@kms_bw@connected-linear-
>         tiling-2-displays-1920x1080p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_bw@connected-
>         linear-tiling-3-displays-3840x2160p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-
>         displays-2560x1440p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@kms_ccs@bad-
>         rotation-90-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-bmg-5/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_ccs@crc-primary-
>         rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-466/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +3 other tests fail
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html>
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-mc-ccs@pipe-b-dp-4.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
>         (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-
>         a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-435/igt@kms_ccs@random-
>         ccs-data-yf-tiled-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +43 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-435/igt@kms_ccs@random-
>         ccs-data-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-435/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@ctm-negative:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_chamelium_color@ctm-
>         negative.html> (Intel XE#306 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_chamelium_frames@dp-
>         crc-single.html> (Intel XE#373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/373>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_chamelium_hpd@dp-
>         hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/
>         igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@kms_content_protection@lic-type-1.html> (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-max-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_cursor_crc@cursor-
>         random-max-size.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_cursor_legacy@2x-
>         long-cursor-vs-flip-atomic.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@torture-bo:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-433/
>         igt@kms_cursor_legacy@torture-bo.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-435/
>         igt@kms_cursor_legacy@torture-bo.html> (Intel XE#3184 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@torture-move:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/
>         igt@kms_cursor_legacy@torture-move.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-434/
>         igt@kms_cursor_legacy@torture-move.html> (Intel XE#2932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@kms_flip@2x-flip-vs-
>         absolute-wf_vblank.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-
>         hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2
>         other tests fail
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/
>         igt@kms_flip@2x-modeset-vs-vblank-race.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-bmg-4/
>         igt@kms_flip@2x-modeset-vs-vblank-race.html> (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098>)
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-1/igt@kms_flip@2x-wf_vblank-
>         ts-check-interruptible.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +2 other tests
>         skip
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/
>         igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html>
>         (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend@d-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-433/
>         igt@kms_flip@flip-vs-suspend@d-dp4.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-432/
>         igt@kms_flip@flip-vs-suspend@d-dp4.html> (Intel XE#2625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) +1
>         other test abort
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>         upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1401> / Intel XE#1745 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (Intel
>         XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1401>) +2 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@force-edid:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@kms_force_connector_basic@force-edid.html> (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/656>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +2 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@kms_hdr@static-
>         toggle.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@kms_joiner@basic-force-
>         ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_joiner@invalid-
>         modeset-ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/
>         igt@kms_panel_fitting@legacy.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6 other tests
>         skip
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/
>         igt@kms_plane@plane-position-covered@pipe-a-plane-1.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v2/shard-adlp-4/igt@kms_plane@plane-position-
>         covered@pipe-a-plane-1.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_plane_scaling@planes-unity-scaling-downscale-
>         factor-0-25@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_plane_scaling@planes-unity-scaling-downscale-
>         factor-0-25@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>     factor-0-5@pipe-c:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>         factor-0-5@pipe-c.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-bmg-5/igt@kms_pm_backlight@bad-
>         brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_pm_dc@deep-
>         pkgc.html> (Intel XE#2007 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2007>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/
>         igt@kms_pm_rpm@universal-planes.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-lnl-6/
>         igt@kms_pm_rpm@universal-planes.html> (Intel XE#2042 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes@plane-50:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/
>         igt@kms_pm_rpm@universal-planes@plane-50.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         lnl-6/igt@kms_pm_rpm@universal-planes@plane-50.html> (Intel
>         XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes@plane-68:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/
>         igt@kms_pm_rpm@universal-planes@plane-68.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         lnl-6/igt@kms_pm_rpm@universal-planes@plane-68.html> (Intel
>         XE#2932 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@kms_psr2_sf@fbc-
>         pr-overlay-plane-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1
>         other test skip
>   *
> 
>     igt@kms_psr@pr-cursor-plane-move:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_psr@pr-cursor-plane-
>         move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +2 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@kms_psr@pr-sprite-
>         plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>   *
> 
>     igt@kms_psr@psr2-cursor-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@kms_psr@psr2-
>         cursor-blt.html> (Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests
>         skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-lnl-3/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test
>         fail
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@kms_writeback@writeback-
>         check-output.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_ccs@block-multicopy-compressed:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_ccs@block-multicopy-
>         compressed.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455> / Intel XE#488 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>   *
> 
>     igt@xe_eudebug@discovery-race-vmbind:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_eudebug@discovery-
>         race-vmbind.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug@sysfs-toggle:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@xe_eudebug@sysfs-
>         toggle.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug_online@resume-dss:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/
>         igt@xe_eudebug_online@resume-dss.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +3 other
>         tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v2/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-
>         threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-434/
>         igt@xe_evict@evict-mixed-many-threads-large.html> -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_evict@evict-threads-
>         large.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/261> / Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2 other tests
>         skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@xe_evict_ccs@evict-
>         overcommit-standalone-instantfree-samefd.html> (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr-invalidate-race:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1392>) +2 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-userptr-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-1/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +6 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-7/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-
>         race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v2/shard-lnl-6/igt@xe_exec_fault_mode@many-
>         execqueues-userptr-invalidate-race.html> (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         imm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-invalidate-race-imm.html> (Intel XE#3320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3320>)
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-3/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         imm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-invalidate-race-imm.html> (Intel XE#3320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3320>)
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/
>         igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-
>         race.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1630>) +3 other tests fail
>   *
> 
>     igt@xe_exec_reset@cat-error:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_exec_reset@cat-
>         error.html> (Intel XE#358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/358>)
>   *
> 
>     igt@xe_noexec_ping_pong:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/
>         igt@xe_noexec_ping_pong.html> (Intel XE#379 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>   *
> 
>     igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@xe_oa@oa-unit-
>         concurrent-oa-buffer-read.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test
>         skip
>   *
> 
>     igt@xe_oa@syncs-syncobj-cfg:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_oa@syncs-syncobj-
>         cfg.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2541>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-5/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/
>         igt@xe_pm@s2idle-basic.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-432/
>         igt@xe_pm@s2idle-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-lnl-7/igt@xe_pm@s3-basic-
>         exec.html> (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/584>)
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/
>         igt@xe_pm@s4-basic.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-lnl-2/igt@xe_pm@s4-
>         basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1358> / Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_pm@s4-exec-after:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/
>         igt@xe_pm@s4-exec-after.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-432/
>         igt@xe_pm@s4-exec-after.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-8/
>         igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-adlp-9/
>         igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-432/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@xe_pm@vram-
>         d3cold-threshold.html> (Intel XE#579 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-3/igt@xe_query@multigpu-
>         query-invalid-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-
>         hdmi-a-1.html> (Intel XE#3194 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-adlp-4/
>         igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-2/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> (Intel XE#1426 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-bmg-8/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-
>     a-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing@pipe-a-hdmi-a-6.html> (Intel XE#1426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing@pipe-a-hdmi-a-6.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         a-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-464/igt@kms_ccs@random-
>         ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         a-hdmi-a-6.html> (Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-
>         a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-6/
>         igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>   *
> 
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-
>     varying-size:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/
>         igt@kms_cursor_legacy@short-flip-after-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#1541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1541>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-
>         transitions-varying-size.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ac-dp2-hdmi-a3.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/
>         igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> (Intel
>         XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v2/shard-lnl-6/igt@kms_flip@flip-vs-absolute-
>         wf_vblank@a-edp1.html> +8 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-
>         vblank-interruptible@a-dp4.html> +15 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-edp1:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/
>         igt@kms_flip@flip-vs-suspend@c-edp1.html> (Intel XE#2932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-lnl-7/igt@kms_flip@flip-vs-suspend@c-edp1.html> +3 other
>         tests pass
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-4/
>         igt@kms_flip@plain-flip-ts-check.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         bmg-3/igt@kms_flip@plain-flip-ts-check.html> +2 other tests pass
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/
>         igt@kms_flip@plain-flip-ts-check.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         adlp-4/igt@kms_flip@plain-flip-ts-check.html> +2 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>         upscaling@pipe-a-default-mode.html> -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-lnl-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>         upscaling@pipe-a-default-mode.html> +2 other tests pass
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-
>         x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-8/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-c-hdmi-a-1-x-to-x.html> +2 other tests pass
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html> +2 other
>         tests pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/402>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-dg2-434/igt@xe_evict@evict-
>         beng-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/
>         igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html>
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/
>         igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2472>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v2/shard-bmg-8/igt@xe_evict@evict-mixed-threads-
>         large.html>
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-6/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1630>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v2/shard-bmg-5/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race.html> +2 other tests pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-3/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race.html> (Intel XE#1630 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         userptr-invalidate-race.html> +2 other tests pass
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         adlp-3/igt@xe_pm@s2idle-basic.html> (Intel XE#3086 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         adlp-1/igt@xe_pm@s2idle-basic.html>
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-432/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-dg2-464/igt@xe_pm@s2idle-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/
>         igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v2/shard-adlp-3/igt@xe_pm@s4-basic.html>
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-2/
>         igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v2/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/
>         igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-adlp-1/
>         igt@xe_pm@s4-multiple-execs.html>
>   *
> 
>     igt@xe_pm_residency@cpg-basic:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-432/igt@xe_pm_residency@cpg-basic.html> (Intel XE#3363
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3363>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-dg2-466/igt@xe_pm_residency@cpg-basic.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-4/
>         igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         adlp-3/igt@xe_pm_residency@toggle-gt-c6.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3194>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-4/
>         igt@kms_async_flips@alternate-sync-async-flip.html> (Intel
>         XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel
>         XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1874>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-0.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/402>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-adlp-1/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231> / Intel XE#1242 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1242> / Intel
>         XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#3194 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-
>         adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#1231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel
>         XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1242>) +1 other test fail
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v2/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#2692 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2692>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v2/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-434/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v2/
>         shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/362>)
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-
>         dg2-464/igt@xe_live_ktest@xe_bo.html> (Intel XE#2961 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2961> / Intel
>         XE#3191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3191>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v2/shard-dg2-466/
>         igt@xe_live_ktest@xe_bo.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test
>         incomplete
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 -> xe-
>     pw-140889v2
> 
> IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3: 
> 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3
> xe-pw-140889v2: 140889v2
> 

