Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E0D0BB43
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1248B10E86F;
	Wed, 23 Oct 2024 22:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSdzyPoF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681210E86F
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729723269; x=1761259269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bilAcUMCuLYIZKqvqbCgwkt1siGPF+/kdNjPtPPxmYk=;
 b=TSdzyPoFpe4mQj9kp2nOQujXCxw8GBmF9/k9zwEtKXnwYKqAUUvobRQv
 jirN9Sjl+dtJX4WQpAsKSg1kNQV5oAQsRK6jfYloBG+rHRfLmE9NGCMrB
 FzkWxHjcuOjDClRcX39qBUYyGYlwSp9qZJNXzOTIcRRvoTezlLqC9wBA5
 2gwyVCG33wFW5EUbwp7nH9vtmCbugsUIog9Y0St+QX5d2YQk6/h0vP/LG
 KoQ9VhMh3Nl8iYHDKlKgOkY/fQM0x1QZY27ZWCfFUV+iNfh654AHDLT3d
 4ojbePkRtjcHpyiCf3oQ4+KwAOjnD50tfnLwbmJtfS2pqsE5r3KbQM+Wj A==;
X-CSE-ConnectionGUID: VRD0XhJjSFCyY0KlojiioA==
X-CSE-MsgGUID: Y4dWqd2hQ46b3LSD472W4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46801067"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46801067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:41:02 -0700
X-CSE-ConnectionGUID: /bE4S6xeRGGqY0U21+lnOQ==
X-CSE-MsgGUID: DIx7Ub1ITFGqs8Vlnj1SeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="79975433"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:41:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:41:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:41:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CN61gGm/rdOQN9wf+G7iSnYfXec3/EYaIbWLHkQUNk8rK+YwyQXc+DE4HLuUPcsPuGCIKaIj8b7GgK4pbTwXXf8iqfW9DJ0OVntESOH+cMfADavGl7Ki3LtNdYZsZ/R2sTGl7kjhEytGLk/CypOMKAHt/CUS/Fzrgsrl5fR3ro2X+Dlu4FlsoAjDs6VWhfzK/+wHoejnSri4APN4H3bD+swtuK3jL35k7XX+4fOW9+2jC7cWoViwCbZjCFvsAtEUs4w1l3xYUv0PbAr9CB7A1PLH5Se5GdIbj59K+JYT11dhs4mf88C03mxhqIIVmf9WVFvplhlCrxbg2VOFotvIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HYRw7PsvjJB2x52V0hTW0VEMeB8C23AiL2IOMyvRP4=;
 b=Cj4xMrcdZuVvw3obVpD8aapVHuxxMyfw6uk+LmgFzThI9MTasoXcA8brOypYucvl1GoUxze+bQL2XatK1QNEN6X/AHW/nYnxv7tvuutKMYeUJ9HOcnqNgj1NvkhFtbcdeGdS1RVrhEk3IPHlTbdJgSNJCiDtvIqvoBa1QWUtvsh2a/un1JYqfGjdZaZW+KoD+OWNM4kADy9PuGJ1Hm/m9H+79G5Sm4XsPa8jFhRY4Py3iLZOD5wrumxK+T5jmYwZtb5tmLG4vfVE05wNlh7cP6/HpDHR3Ehec7R8sgPR3Uo4AEIMR3z2ZYqvrx9lug7bnzjvtrnVh/4Kzz0A4aX1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Wed, 23 Oct
 2024 22:40:59 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.017; Wed, 23 Oct 2024
 22:40:59 +0000
Message-ID: <4ea41241-bc63-4a97-ab79-5d4334cf8a55@intel.com>
Date: Wed, 23 Oct 2024 15:40:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Separate full CTB content from guc_info
 debugfs
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
 <20241023001736.1766523-3-John.C.Harrison@Intel.com>
 <Zxl2Bj56VnzU4S2n@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zxl2Bj56VnzU4S2n@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0332.namprd04.prod.outlook.com
 (2603:10b6:303:8a::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 687c9385-7127-493c-b744-08dcf3b3c3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG1JOCsyNFFIN0dSS1licmpvcUxFSjBvdFFpSXJwem1YN2tvd0FjN0xDTkR2?=
 =?utf-8?B?eDJFNFZSYWpmaXBhR3h1bUlCcnN0bUloTTNibVIxc1Y5MFNySGl3TTBLYXBu?=
 =?utf-8?B?dWVlanY2Vm9LNFdYaFRxTEp2dWRjNm5XaytzTVNSTllLU2hvMm9sQWMybnlK?=
 =?utf-8?B?aUlVc0p0cFc1enh3blhSNGtqekQ4bmJQUEJ3akRyaVZUM0F3U3hydDFrcmRL?=
 =?utf-8?B?eElpYkNKZGJmcEFpbmJEeEtLZkFQWlU0SkJXSmR3cEgwbHowZmhjQ1JwZHVN?=
 =?utf-8?B?VThxQVd4eFRBZ0tmbmZtTitDUndLL3pEOFcvQTRJcGFRc1ZjN2ExTEdnSjVx?=
 =?utf-8?B?Y0pXNHFEMUx4ckJucVRkZmhaaHZLUURJU25XbmYweXpSejlDVENQMG5xZEVG?=
 =?utf-8?B?clBPeHlTOFJuQjcrbXNBbnpiZ0x0Q1JUdGR2YURnSkhWMUF1NGR6eEtSTE1v?=
 =?utf-8?B?cDA1eGNmWDkxclZwWm82V2ZSU2JPN3JLLzJweEtqcXBmOFlYTHBmOTBwb0NJ?=
 =?utf-8?B?LzFrbUJrS2FWaUp2TWo0SiswVTE3Q0RNWEp3bE1MRjFnSk9CTTJwMkkzb2p5?=
 =?utf-8?B?UFlYVm92UTNRZEdwcEg4V2hhczdUUHlnejZGWjNqSkhrY29TYVJmeWhIcU5x?=
 =?utf-8?B?RVFZWXZtdTdoYkRmczdIcUxXQnRKQ2dLUzN3MEk4S2JxVWVyaW8rSFFJQmdO?=
 =?utf-8?B?RlJzTStIMWdFMlFNTldCWSt1amY5dFhFbzI4b0xIcEhoaWxQWUpaWSt2d1RI?=
 =?utf-8?B?blUwSWRmYUJscENhd0d5SkRtSWNla1pyMmdHeUxjelUwTTB6REJUclI0ekMr?=
 =?utf-8?B?anYvL3dvZEJGQUt0SUdxdG5HTmlyczZSK3d2Zmp3S1Z4bEVPdEZLYWV2T3pk?=
 =?utf-8?B?MVFxV2l1OXZpY1RaUThDWDlxbVVDR0tJWGd1bHhlRjZ4Qk5yS2MrcFJWTW9M?=
 =?utf-8?B?QVFFVnhGMkdRa1dlM0QrUk1Nc0oxb3RGWkxaSm5FSWRwTWJpNy9TVjFNZFhn?=
 =?utf-8?B?S0Z2bXU0U1JPT3duTU9tZVIyenhrY0lFWmFURXVueWRVNDdac2g3SVF5OStt?=
 =?utf-8?B?bml4UVhmZmdTcXRxc1VvMFJlWFZVZU5KVnJWdU5RUzBsbUFUaUtnRnljV3hv?=
 =?utf-8?B?Ynpib1B5MTRncGM0emwyUFlvOWJoeVJldlMzSHZJTGFhSjlYWUNJdzVsemR0?=
 =?utf-8?B?STMyM0dDQkhNcTV1U25oaklvSEp4ZGJGY2JjTGkyOHBiMjVMU0lnbGJhaWs4?=
 =?utf-8?B?RG96L1MvMlRpaTZiTGMxVG1IMkF3WGJoNTltK2ZoZjRMMzM4MjE5MVd1eEsr?=
 =?utf-8?B?MkpIdllzcVV4SytxK2J3YTMvQXVlbmxaMW9UcTJ5a0habXErR1RBTEI5dTYx?=
 =?utf-8?B?L1hkdmdjR2Z6d2tPZllTWE40bm9qdHIwd0t2Y2JVdzdZNkdSK2gzRE54ekVI?=
 =?utf-8?B?cFRUc0lYYitmNTZMRDNQT2hZYWFJcW9qUmxhcnpMN0MvT2w2Q1VCSGVHRXdR?=
 =?utf-8?B?ZzJuMTVLemNnbW1YbVdDeUhjU1BDbUtFNFNjUy90NHVGSXJEQmFLRlpOVUdv?=
 =?utf-8?B?MWZPUTJEVmlhaDIxWlVTSTJxWTQ1VXpMdm1yVTEzUCtGVjdPazFyblE3YXVt?=
 =?utf-8?B?eFpCc3BaL1I0YjZyZTlsT0JkVVZlcVVOR3hqa0RtMVN6TTEvNE13Sit4UGNi?=
 =?utf-8?B?K1RnOVZzRVp1WUhiSnYycWp4WTlxTHVQMUttNnhXQlpVMnJXWjdGa0p4WTRl?=
 =?utf-8?Q?lIAstZn9CcQBcAURxN0AYGdgdvqe1lfOYMTqhP9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFVxT2Jyb2pWMVl5dmFNM20rbUV4TFBqY3NuODhJNjFwZ0JMak52Y2x0Q2hk?=
 =?utf-8?B?aEFEUXRzRktlNlh1T2JqVzZLVHkrK0hRai9CR1hMNjZuQkJPQXBicDNiUXMy?=
 =?utf-8?B?R3QvbnF0ZmdTam5OU3ltb1RwTFlPQXR0K2ZVaHR3dGwyMzdxUTZ4Q0pWMG5n?=
 =?utf-8?B?cE03a0FndXdnMVpqQ0dLMkZzcHB2bDYxRkVBYUJXREN6Q0tZWFFMTUQ4VFY5?=
 =?utf-8?B?SXh3TFZNTU9kZGVjVzJRb3U0L0JEb3dLUWtIOTRROFg3L0kvUDl3azdYWXFh?=
 =?utf-8?B?Y2YzSWphcWUwd1hha21lZWRzSG5heWRLTzNVNXg2a25JYldtVjUzR1RsQTkw?=
 =?utf-8?B?YURCMGZhNjdFTG1uYlZseEU5YVNyTXd1ajRkNlJnVml3THlqbElSYmtveUVS?=
 =?utf-8?B?TUZ5RnRaUks4bUc1WlhveEtrQUFJYld3UWpTYWZKc3M2RTVVak9GQWFETnBB?=
 =?utf-8?B?b0tqRkdQNjVMWlp2YktRUW1lVWJOb2orWU1NL3BhRnhhVkNidFBaeWlYNmNp?=
 =?utf-8?B?bDFsR01NbStuekVlTzZWV3p5a25teXJ0SmcxN1N3QzB4eXdhSlpuMEw3ZFdE?=
 =?utf-8?B?S09LL3hYOGMvWjlLVUNEQm94WjBEQy83V1VkcVJTWEhwTWp6emcxU1gzdUky?=
 =?utf-8?B?d3YwZDRJNzl3VTcyNTYxOEN6MlM3dHMwUXhLRTJpYXR5T2ZSSEdhQVVHT3dj?=
 =?utf-8?B?dTQwSTRqbEd4NHpudmN1QzkvNFpwaC8waEcxQ09sMHh4U3NRWldKclV6UkJk?=
 =?utf-8?B?dDZtNGNsVE5namhXOVNjNTZ4cVNMSmtLYUdJcW5JaFcraS9yaTRjN1FoYnFP?=
 =?utf-8?B?Ty92R29iazhHd25ibUtlSnVZR2JZRndPRGpwU0luSHA4Y0RQLzRobjV1Rmhv?=
 =?utf-8?B?LzVFZmhJbjcvSW9IVXlhbkppOWkwd2tOcHUxTng2c2FwT1VSZm1pUEs5dUlw?=
 =?utf-8?B?ZEtORFNkKytNQU8rM1hNRkZjQURVZDk0d2U1LzZOdU13M1JVQS9GbURMaDR6?=
 =?utf-8?B?NitzUWRZVG5vdDdLU0JsMVRlK0VLS3RWcEpsMjltS21hMS9Ua09vMlNRaHhJ?=
 =?utf-8?B?UEdVNHZUV2tVTUd4T1FieFdaT2dsUmxrbFMwU1VqbnBEYmVwY1puVHFyUFpv?=
 =?utf-8?B?MVhSeGp5VytzNFB2dFBnRndHNXgyZE1pUTAyaXcvclFBOFhWSjN2SC9CNnRB?=
 =?utf-8?B?dnIzTTlrRXphb3hwZkYxM3poYnFhM09yQy93QzIzbEs5MUlmOGpiV1FDcE4v?=
 =?utf-8?B?clZJbkhQY2YxejhMVTVhSG9OTE51UkdFdTl5enVCRzh6NUcxSXhYOFozQUtP?=
 =?utf-8?B?ZllPZXBwOFFHbFI1MnN5cEx0RjVDaUhHMGg5Tm9lS3FZNEd4TjJJNUZrbDBk?=
 =?utf-8?B?VkVwTDJZTTlCUmd0T2lYditnOVJYZHR2Y21LeDVBeGZ3QkxzR0pqSXVrelA5?=
 =?utf-8?B?ZkFXanBJd0dDTzdXdlR3OUpFQVV6OGtaZEhTTXRMZzI5NDNaT1RPZzNaQnBn?=
 =?utf-8?B?VGZxZEFWTCs0bUJuK1J0L3B4cU1jOEE2SXo1S1ZBa0ZyclljQUNtMVNBS3ds?=
 =?utf-8?B?ODdIUVE5blFYTFJTSGcwOUFIWVQ5THJvck5zVmNqM2Y4N3NmeGJJcmhoV21L?=
 =?utf-8?B?bFU2QmI4empHd3hQUERMay9oWVdnZWgwYXZBV0lwaDlVNmlaWFRiREY1SWZW?=
 =?utf-8?B?V1NweVUybXF2c3BNQ09IcXF2V0UwbStuS0hkWmc5dlZyT0M3K24xKzlBVjFB?=
 =?utf-8?B?bDNJS2p0MzRCV1pwams5cEd5QUFaQWRLdzlwZUYvc2M5K3Z4WXR4WkN1ZkdB?=
 =?utf-8?B?RGcyT1pISjdkc3ZNSU8wYkE1clU1dEJ0WEQ2OUxiZWZseXlFcEdjbWFXeXpK?=
 =?utf-8?B?L1IrV1VDeUd1VWtlL3AyOXAwaDcxYW1DZVFYbkFqMGpOUUdlZWI2dmRkc2Jo?=
 =?utf-8?B?WjhBbUxYeWtQajI1ZGdmODNLbDBBZzlRZ3hYS0hTRitkaXphZDNJcTBqc0ta?=
 =?utf-8?B?bFdNTmpSMmlqMDFLbk9ObUtoOHd5Nk5PdUkwdWJvaHZobk8vVG9qMGVvZXVj?=
 =?utf-8?B?emFLNUFvOEFVeW5vTkFIMDB5TkdGQUtsQXlTWXBnc3BFSndjRXhrMlBCQkJh?=
 =?utf-8?B?bC9PYzB0bUQ4MnNBWXl5VEFKV0psUzhHaXpIRnlZN0doSlhabXA5YkdQQkkv?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 687c9385-7127-493c-b744-08dcf3b3c3ba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:40:58.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QtCykFmFF1Rxyy4LbmOSRBsQgddnj6246+y4ajZhnAHwTtA5kLCfH9Q6zq370RcDzUQGM5hFFlxloJ1yvt1xeVW9/knXDD70B3eZjQ128o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On 10/23/2024 15:17, Matthew Brost wrote:
> On Tue, Oct 22, 2024 at 05:17:35PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The guc_info debugfs file is meant to be a quick view of the current
>> software state of the GuC interface. Including the full CTN contents
>> makes the file as a whole much less human readable and is not
>> partiular useful in the general case. So don't pollute the info dump
>> with the full buffers. Instead, move those into a separate debugfs
>> entry that can be read when that information is actually required.
>>
> I did notice this when using the debugfs entry and yea a bunch of asic
> isn't all that helpful in the common case. So change LGTM but one nit.
>
>> Also, improve the human readability by adding a few extra blank lines
>> to delimt the sections.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>>   drivers/gpu/drm/xe/xe_guc.c         |  5 ++++-
>>   drivers/gpu/drm/xe/xe_guc_ct.c      | 25 ++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_ct.h      |  8 +++++---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++++
>>   5 files changed, 36 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 8b0ea77661b2..5d7d8192d6f3 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -267,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>   	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>>   
>>   	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>> -	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>> +	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true, true);
> One bool, not great. Two bools, yuck. Anyway to refactor this without
> bools all over the place?
It seemed excessive to create a whole set of flags. But given that this 
is the only instance outside of the GuC internals, it would be simple to 
create a wrapper that hides all of the internal only params.

John.

>
> Matt
>
>>   	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>>   	ss->job = xe_sched_job_snapshot_capture(job);
>>   	ss->vm = xe_vm_snapshot_capture(q->vm);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index b065bb9973e9..fcb540003e53 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1187,7 +1187,10 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>>   
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>> -	xe_guc_ct_print(&guc->ct, p);
>> +	drm_puts(p, "\n");
>> +	xe_guc_ct_print(&guc->ct, p, false);
>> +
>> +	drm_puts(p, "\n");
>>   	xe_guc_submit_print(guc, p);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c260d8840990..352673b6974a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1607,7 +1607,8 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
>> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>> +						    bool want_ctb)
>>   {
>>   	struct xe_guc_ct_snapshot *snapshot;
>>   
>> @@ -1615,7 +1616,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool a
>>   	if (!snapshot)
>>   		return NULL;
>>   
>> -	if (ct->bo) {
>> +	if (ct->bo && want_ctb) {
>>   		snapshot->ctb_size = ct->bo->size;
>>   		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>>   	}
>> @@ -1650,6 +1651,7 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>>    * @ct: GuC CT object.
>>    * @atomic: Boolean to indicate if this is called from atomic context like
>>    * reset or CTB handler or from some regular path like debugfs.
>> + * @want_ctb: Should the full CTB content be captured (vs just the headers)
>>    *
>>    * This can be printed out in a later stage like during dev_coredump
>>    * analysis.
>> @@ -1658,12 +1660,12 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>>    * by using `xe_guc_ct_snapshot_free`.
>>    */
>>   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>> -						      bool atomic)
>> +						      bool atomic, bool want_ctb)
>>   {
>>   	struct xe_device *xe = ct_to_xe(ct);
>>   	struct xe_guc_ct_snapshot *snapshot;
>>   
>> -	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
>> +	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic, want_ctb);
>>   	if (!snapshot) {
>>   		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
>>   		return NULL;
>> @@ -1704,12 +1706,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>   		drm_printf(p, "\tg2h outstanding: %d\n",
>>   			   snapshot->g2h_outstanding);
>>   
>> -		if (snapshot->ctb) {
>> +		if (snapshot->ctb)
>>   			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
>> -		} else {
>> -			drm_printf(p, "CTB snapshot missing!\n");
>> -			return;
>> -		}
>>   	} else {
>>   		drm_puts(p, "CT disabled\n");
>>   	}
>> @@ -1736,13 +1734,14 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>>    * @ct: GuC CT.
>>    * @p: drm_printer where it will be printed out.
>>    *
>> - * This function quickly capture a snapshot and immediately print it out.
>> + * This function will quickly capture a snapshot of the CT state
>> + * and immediately print it out.
>>    */
>> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
>> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>>   {
>>   	struct xe_guc_ct_snapshot *snapshot;
>>   
>> -	snapshot = xe_guc_ct_snapshot_capture(ct, false);
>> +	snapshot = xe_guc_ct_snapshot_capture(ct, false, want_ctb);
>>   	xe_guc_ct_snapshot_print(snapshot, p);
>>   	xe_guc_ct_snapshot_free(snapshot);
>>   }
>> @@ -1776,7 +1775,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>>   		return;
>>   
>>   	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
>> -	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
>> +	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true, true);
>>   
>>   	spin_lock_irqsave(&ct->dead.lock, flags);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 338f0b75d29f..01d3b0183bf0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -17,11 +17,13 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>   
>> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
>> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>> +						    bool want_ctb);
>> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic,
>> +						      bool want_ctb);
>>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
>> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index d3822cbea273..995b306aced7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -47,9 +47,23 @@ static int guc_log(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int guc_ctb(struct seq_file *m, void *data)
>> +{
>> +	struct xe_guc *guc = node_to_guc(m->private);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pm_runtime_get(xe);
>> +	xe_guc_ct_print(&guc->ct, &p, true);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"guc_info", guc_info, 0},
>>   	{"guc_log", guc_log, 0},
>> +	{"guc_ctb", guc_ctb, 0},
>>   };
>>   
>>   void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>> -- 
>> 2.47.0
>>

