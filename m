Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E8EC27C52
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 11:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AE510E362;
	Mon,  3 Jun 2024 11:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlmDDVNR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCD810E362
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717414501; x=1748950501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JtzwpgooIwrD7cwhW9PlarsoQ2QkcgXGlGjtA5eMoHU=;
 b=nlmDDVNR7caEYovR2icL12p+16Iz0Tl8HJ7mEwicCjrfGhfpWqzIL3KF
 WNRWFe6FD1O2FwJlkdl+ruGwILdtA6Qy39Qu0+CWGqyVrigzcjmHZgC0T
 WSQDR0rquRjX4Kiw4SUvshw7hFQcS0Zh9K5fq/WOuFFMw4Wsylnvi1ql7
 NvM3Fz3GRCg2YxwLnRzYULieAksCV3iJ2f/SxLf3aJORZ13tEYjcwjN7l
 WFq6s5cFilxinTaotf02kz4gV3pRFQddh9IZ3y3FX0cimt0PjDT7CeAT5
 l3yETasusrmTg13yRMSVf7IBS9Y4z+P1Y890tvezAlSwguER5aZz/E1Mo w==;
X-CSE-ConnectionGUID: Xztgc3z+QJG4X8b84ITCDQ==
X-CSE-MsgGUID: LbpFHg2QRP+qmZCdPL/y4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13741889"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13741889"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 04:35:01 -0700
X-CSE-ConnectionGUID: n7hs2togQj2wRp0pW7gMjg==
X-CSE-MsgGUID: DYoEj25vRUSdVbDSC79Vfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37472256"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 04:35:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 04:35:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 04:35:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 04:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNjZzv6H9aj8zCIga9YcJUq0Od85PWXTHKcYo8/c5Cej/Pkn6GZsJJ49fM8EO2De/QmVlS++CLy2a7cvjMMh2CAXiIF35b0UCYUKkxuuALv3UJjzq/Eh2XNv6pzqc0kws+3sH/g9My7C0ppAClw87pt9A4Rcy4qMozPfJL+hAtvZ5GzoUi7CkXc6gh+psMnJhIDg/pkkXbsoiN1lnNtywhrQ0yTOHhVEy01JZmwFw6pLaQ87c9usenkIoRIav5ZBJnVSK2E4wWABl29geqM4AxyZSAqkyJjg5eH54CHDuc4/iH3orxXlyvuKkNsK83gYT/XOAVrM/J+iOWkEdDYmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2HwBhjP3tOM8mmE931PFtA7vaoJnl4tSvlXp/VUBFs=;
 b=bSVU2PrJoBlfZEYVKqvPRnY49wkqQGNDGnPIaACpooSUbP6ExC13t/N6U2r71sY1vPbfL5+mazFxxIbQFTBSkPbJQCYtc2084JyE6E1f7Twa9+owTmdV63h70QTTwqRjXZZlGGvDwk6LQVzY411oOuFRy+Huqpd2M/W/nhDo6ZyncnrnVMsVPWd5CZcVrh8jNqavOXPHa2KJ15Rfngs0xR5joZV/ujFmQ+KyGTS3e2A3E+J/Qbh/sgClopcwP6XmwOhc188hng5EL0SpwBd2qQSuF0gr9yibis+Xxnq+b8kTKSiJJIZ27sxZzj0YAaVpKO72Lvmy79lHLPy6mFf/Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Mon, 3 Jun 2024 11:34:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 11:34:58 +0000
Message-ID: <f60336f4-eb91-435e-abaf-454c384ae4e9@intel.com>
Date: Mon, 3 Jun 2024 17:04:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240603083108.32346-1-nirmoy.das@intel.com>
 <bc097deb-d1d1-4f81-a90e-403414ca3e11@intel.com>
 <02afae56-3ce4-49a2-a9bf-f67e679f6ffb@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <02afae56-3ce4-49a2-a9bf-f67e679f6ffb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1d3bc8-8ea4-44fd-df78-08dc83c13262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3RTZVVQTkFkSXllM3FnKzl6enRZTEloeFRYU010bEVwcHFUVExQMDRDbXVa?=
 =?utf-8?B?YzJEOEtPYjdCd2ZYdU5uNTBreUlROFlxd3JJNUxnUW1XVFdJZ090VTBlL1c0?=
 =?utf-8?B?MlpscDJuQURHMmQzY1N1elpTWWFleFFGbVRwMzI3U2lTZGdqL3piajJGTGFs?=
 =?utf-8?B?blNTSDhGRmlRaU5sYXJubndqT0RFVWdRbkl3ZmRveG5RZzB6ejl4RHZSaFdp?=
 =?utf-8?B?b2RKbTd0R1QyTlBaOHZUMlNwNldQUmhlQUpqYkFhSVZXNkM2RGVDNzdnNWw4?=
 =?utf-8?B?UitHZEw4QUY3K1kvU1dpeFIwVk4wUFJHWWNSOVdvK21CYnJ3MUxHMElxeVNj?=
 =?utf-8?B?SlBCaG5wYTgyanUvdk02ZWRTalRiQlJGTEttbm15R0xraHc5cUYzRmhMbkQ0?=
 =?utf-8?B?bVBtSmpaR29MTHl3RHBkUkV0QXVhRGRMck1xNGl2K3pMQldTbFNTQnl6OWpu?=
 =?utf-8?B?NGxWZDNyRXRvRnpBcEN2djhKYi91czIwR1QzZWVBWXhSbFdyQjRtdEp3c0xi?=
 =?utf-8?B?QmNlQlo4QmFtd2tVTjNCdzVmdHlNVGhiS1NOWmFvNVFaZ3QrRFdJeGN2ZjVW?=
 =?utf-8?B?T2VqcmlUYzVudTZyVmRzbnZEMkN1RHdyV0h0dnJNSUE3TWllTFYxZzJTd29X?=
 =?utf-8?B?b0dwcHc2ajFpYjFWa2R3VDc2dWM2ZU94NFNPNEJSRmdBWHp2WWxFRE4xS2tq?=
 =?utf-8?B?V0VCakVIZDNWUjZqVnduazhCTkt2NHlSVmxRdk9jeTMwa3hOdGg0dHZBdzV6?=
 =?utf-8?B?bHBBZzU3RG8rTE85LzRzR29FZlJNM2x0bzk5M1pLcDFJSHlSTCsyMFBXY1dQ?=
 =?utf-8?B?YmlOaWkrbUhKNDQzOTUycklUT1Bhci9YNDNEQkxmQTV3UERmdDIzTTVmL3A1?=
 =?utf-8?B?eXR1V2Y4cFIwR1JIS2hsQ1Q3clZzUTYzeGgyT01CL3lXSmF6aXBUNnZpV25F?=
 =?utf-8?B?d1VzZ0EwdTJpMFREVmJvcC9ZUHZuUEZYeVZaSExTc0NsbXBKRTVQNW90K0d5?=
 =?utf-8?B?bCtseTVVVGFKM2lHMkpzUS9yTFdYTmszU0kzWlc4RG1FdnY2OXQ4WVc2ekIw?=
 =?utf-8?B?WmhKZTVIVXVmY3RKb2c4bzVwM2pqbFpFZ1Q2UVVFamNtd0R4YkI4SW8xR0w5?=
 =?utf-8?B?dncwTWpYNTlkS2FGRTBobU5TOEIxT1U0N2lWeVh2NFV5SFZ0eGNNZXJ6c3k1?=
 =?utf-8?B?ckZNM1JKajJka2VNZlpORm5LVGFUSmNxWndZdWU2VU1HWFZhVzFyVk1mZklv?=
 =?utf-8?B?K0cxMTdFaFJJR1ZPUkJhRzIwZ3VyNTFoQm1KdjhjeTdpRTA0Nmp5Y1piT2p6?=
 =?utf-8?B?UzY1eHRtVVRmdG1JNHZrOUJKckFNbFJuZTZFakg2UkIxT1hWTHhDbklPTWdy?=
 =?utf-8?B?RFk2TDA3MGVIUjBNd2xRUUpCSmpoaUZqS0ZUNFRCQjlTaURkVmJ2U0U2TzZm?=
 =?utf-8?B?eXlTS1k4cnBQblNWNVdYVEQ2UlliKzNBVE5rZUZTdlNWOTZ1bzZXaWppb0F6?=
 =?utf-8?B?K25YZjFsVEJxK1dWMkZoRDd2TCtoTzlkU01jR2VpSWI1S2lKaGRlRXFyWEYz?=
 =?utf-8?B?NnBuVEZ2S1A5dDB4cFk4QUVqUkJkSDhKQTVmWkxPdnNqbDZDMkRic2JwaHox?=
 =?utf-8?B?RFpGb2c2VkNVVnJ4WG9mcDRwY2hseEw2QU5RTWhOQ1pmNGJkWVU0UE1QTGtw?=
 =?utf-8?B?QWJjWDZnZGRMU0F5NlVYQ3lEb2pJM2c2OUYySVZvVXd1WWlzK2FPT25RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alM0SFo1NkxwZmNRNDZYcGRQdUdFN3NkZ2xtYS9VS2lyVWZZUWdrcFBPcUVM?=
 =?utf-8?B?NnAwSjQyNkVtZlhkUk5zUUU3Z3o4N1VFcWk4ZWNsbjRUb1h2MW1DM3I4WmNy?=
 =?utf-8?B?bzZSbzVIbkl1ZFNxNTJRSy9UYWd6ak1pQW5pLzV6dDM2b1ZyNTF5ZkRGL2lq?=
 =?utf-8?B?Y255emh1cndLSlBINTZOQ2c1Y0JnMUEvaktCMXlqbFhpYUhmYmpROGFZdlNG?=
 =?utf-8?B?QTQ1eWVnSURnVitISHE3QWRDTkYvRVBYY1BXeE5ENmFCSjRGenVqMEdCU0ta?=
 =?utf-8?B?NHpsSGRDMHE4WDhkWCtoMSt2TXRRYndRT2ROeFBYOUZId0RIR0w4blgrTDZ0?=
 =?utf-8?B?bDlnbzBrNmttYkUrUnZBbWZtSTBldHlaREtuanJ3a1d2Qi9MNHF0UzY3V3V2?=
 =?utf-8?B?MFA4MkpZV082VmFDandxaW9GVTZMeXV6djBrY05LY3IrbTcrNnI5Vmx1Ri9W?=
 =?utf-8?B?ellaejk0RmJWU2JDWGpsSll4ZnNMUWlBWmNQZ2pNTnRhaEFiWmNiSThYbzZy?=
 =?utf-8?B?eE9BNkxqbWNycFUzV0ZtSzVCTDdhTmFhR2s2dnpFTEtoSEY3NzhlT1o4TjR1?=
 =?utf-8?B?YTZCNldmVkxxWFpWUnVUT1JJTENqVE1PQ1Y5Tm5rRWFCdjNZdHZtdU5yYzVB?=
 =?utf-8?B?cjJWYmhCMTh6cGpTYnl4bURsUzRIZHVlRXV0NVhlWWdqc2t2UGZiR1hEaE5X?=
 =?utf-8?B?c1BCV212YnZRZUdyb2IwYnJ6ek11bUJicWx6Tk8zN1l0dkZLdXYvUTlmSURL?=
 =?utf-8?B?dzdJbzZjNklQdjVFVDQ4ZTVrbzlIYU9odjNtQ2ErbzNFNW03RkdQbFJwL2NO?=
 =?utf-8?B?cURqMU1jVUdxMVlxR3FEelVDa050STA2U0hOOGJrTkQ3WWNiNVo4eGNZYmh2?=
 =?utf-8?B?SmVsMWFQYWRIRXdialVGNzB5NktUcllsb24vTlNRc2U5Sjcwdk91eXdPQnpG?=
 =?utf-8?B?MC9WYVhKQ1FZbWt0akYrMSt2NlI5Q3VsdTM3N2txa1p5RnhibXdGKzlyUHkw?=
 =?utf-8?B?M1Zxays4aC9EbU9OY0ZoRG9vb3Z1enUrSy93RjdNVWcyOXVtaGpCYWlhTS8z?=
 =?utf-8?B?VVZCVkRtYldkRk5SZ0tscFRtbHFPcHNqMHBjamZmUWd1NElEalJnVzd0TTU5?=
 =?utf-8?B?QlpRT1VVWFV3YitmOFo1c0h2SzJ3TEdIcFhsd3pib3dWenJlNzQxeUlhWTRp?=
 =?utf-8?B?cjM0cFhnUlgwTlpuWllMNVlYRE4vOGR0bWlNUytteGtaeGl0WWd3NHhUOHUx?=
 =?utf-8?B?eFkvOGNsemRLNEFERUxwbGlMUitSdkwrd0VySzNCTHF0TXJDVVY0N0RZT3pP?=
 =?utf-8?B?TnJwTVhvaFMvTVBLdzBPa0tOeVFXVVVPTkQ3VUkyRmdGeTU3ZzNQbnZScHZr?=
 =?utf-8?B?KysrSnlSUmZUd3R6aUFLMjhpOWMzNUJUZXd4YXdVUlk1Z0NPUkQ3YnFQNkVx?=
 =?utf-8?B?cTU2SDR0S2FDZnZPNGFoSlRSY1p5U2NkSHRSTUwwS1krTHFIMXZGaUloM1hW?=
 =?utf-8?B?ZmN2RTFwRERDNVRNRy9SWnZqWXNoUUJxMVQzdkpLeWZzU0FtSXAwOWdydmk4?=
 =?utf-8?B?U3ZlZng2UCtDcVdCU0tCVVZqK1pMSm9BazIwOG01MTN3ZnNHMk94akZGSEc0?=
 =?utf-8?B?VE1nK0hKT2x6ODNqY0xTUDIyb2hRdEpyZWhzWUg0cER2a0hBU0puVnpwMndY?=
 =?utf-8?B?SHh3bmN2YVFuQndSc000SFJhMERnZENaVXZxTy9WNDI1cWZmS0FNM1JhK3ZD?=
 =?utf-8?B?cm9kMTJnQWtHbzA4QnN1WEdYcmZpZy9PSU04aFB6L1R4b2dnOFlDNUp4SGZO?=
 =?utf-8?B?VW0vOWVUR3MzMWNybjBKQmFYT09jb0dHdFZEZmxnSnV2Vm5MSzJqTXhsc21p?=
 =?utf-8?B?UnczU3JzKzhlWlhOcDBhbFQwNVlUTnJGZlVIMFB1TUlnUlFxWjVmaTNHaGVH?=
 =?utf-8?B?dktMd3oyejYwZmRBOVROV3BPa2tkRFZ6NXQ4THNrYXpMZStsYTZyL1hYR2NF?=
 =?utf-8?B?TWFycmdqSkQzT2hEVGRYVHJqUmxhQmZqN2xJeGRRdTlTcGdweFRBTUhUM3JQ?=
 =?utf-8?B?UjlnRGFrS2NLZHU5Yzl1aC84aG5Zc2psSTVncEV5cy9UNGF5Um1ib28xYU9n?=
 =?utf-8?B?dEdEZ1FObVgwR3FpTVdQYkRsU1lQdG5IcWY3NWdFVW9rLzNIdjk5VDJrZWlT?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1d3bc8-8ea4-44fd-df78-08dc83c13262
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 11:34:57.9892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Orf5JvZyLCNHsmS8CpEvuRGyHuA+wFdbWhqOqeh69HwBlQ46hjT9wSxWjefdpsxNXT4V26qNAWaTXZLecAft1p3lYJVazJl+6v5s4xztt4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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



On 03-06-2024 16:28, Nirmoy Das wrote:
> 
> On 6/3/2024 11:07 AM, Ghimiray, Himal Prasad wrote:
>>
>> On 03-06-2024 14:01, Nirmoy Das wrote:
>>> xe_force_wake_get() can return error so check it's return value
>>> before reading gpu_timestamp value.
>>>
>>> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>>>      Add a warn on for xe_force_wake_put(Himal)
>>>
>>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c 
>>> b/drivers/gpu/drm/xe/xe_drm_client.c
>>> index 4a19b771e3a0..4bdb909eabfc 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>> @@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer 
>>> *p, struct drm_file *file)
>>>           if (!hwe)
>>>               continue;
>>>   -        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +        if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
>>
>> Since xe_force_wake_get will increase the ref count irrespective of 
>> acknowledgment from forcewake ack register fails or succeeds.
> 
> General pattern is to skip xe_force_wake_put() though at some places we 
> do call xe_force_wake_put() when the caller is unabortable.
> 
> I don't know the exact reason but I  guess failure to wake a domain is 
> serious enough so we want to  keep already woken domains  in wake state 
> for system stability.

If you break without xe_force_Wake_put, subsequent force_wake_get will 
assume domain is awake(which might not be true, because there was no 
acknowledgment)

Please consider below scenario:

function a:
xe_force_wake_get ---> increased domain ref from 0 to 1 -----> wake 
domain ---> timedout the acknowledgment -> failed and returned without 
decreasing the ref count

read/write operations  -> not called
xe_force_wake_put -> not called

function b : called after function a
xe_force_wake_get -----> domain ref increased to 2 ----> exit success
read/write operations -> executed but domain was not awake
xe_force_wake_put ----> domain ref decreased to 1 again.

BR
Himal


> 
> 
> Regards,
> 
> Nirmoy
> 
> 
>>
>> It is required to decrement the ref count taken by xe_force_wake_get 
>> by calling xe_force_wake_put before break.
>>
>> something like :
>>
>> if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>>
>> hwe = NULL;
>>
>> else
>>
>> gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>
>> XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>
>>
>>> +            hwe = NULL;
>>> +            break;
>>> +        }
>>> +
>>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>> -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>           break;
>>>       }
