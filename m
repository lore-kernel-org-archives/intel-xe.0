Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D053CC6B3E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 15:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48B210E3D9;
	Thu,  2 Apr 2026 15:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPunwwYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0E410E3C9
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775143084; x=1806679084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/bNYPglCslm6z/3BIJ6zvHDeIOJw2rfEdw3vAbDgMpM=;
 b=cPunwwYfd61jwyU3dE7Xc+jCx69+f3PaEhlscdhhzYtKOFdoCFm44tTh
 Xp5qNf+2fx5+TRd1w6bXrTfZSGQoV8YgONzVoGXAY/Kd4S0W/x/JUU1Qa
 tOVA8TpgbkGk7nqZFZ/gsGP5iTMS63a5BE6FqudpEqTcnYCfYsczJdnbq
 pQS+7Y9I9Vruw8IycV/E+2KixY3Vc4P1DQ9+koO65Olje1gFce7CcMn+6
 r/PiwaV6HYt0mLLydab7h5P/b75z++1LLkS2JSLqot7rThneLjhrGOB/U
 e37MUiZDgVRWsNmfoMo+4QZyzJmHpaBEykEm10S7IHXXVM99qbmiejhnK w==;
X-CSE-ConnectionGUID: ebU1uTZ3Sf6ehPMCHhH5mw==
X-CSE-MsgGUID: 4g+XF9k0QsWqi93l/Oie2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86506610"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86506610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:18:04 -0700
X-CSE-ConnectionGUID: 6+33Pq4+S2mfdNeslUVvCQ==
X-CSE-MsgGUID: ljlt+CuyTzC7GHP94iZffg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226867868"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:18:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:18:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 08:18:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWUS5vna/koyBsgmfTyFQeN9gIf4YEnW5inpAgxHIE576ZpgDjLoxyMhtAojkEu4S1AvGRZI0TXYLeWAIk8m4Ub4jWWCxRxDbrGXmN/iYGnaolAtCp6oHFKbmm7nsy5rASPuPSiHZJzB+AU1e2a9zy5QToSxJKneIuDuPUQz8HeedAN8BKDN5j3P/wVWr2U8UaX0K6ABL3H2RdoktwQ5gZSf1cuvl5Ogd84xUxKAyL3Vy6m3Tcc66JC7k85feg9pHzFMTfHyiU/2Hx8V+y+CWAlcS/0xk80Cz27quBjV/kjYpKb9nfPBnRk1TP1FSpy/PJJ4El5pXWmk/udERAAqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJXEFVQgTh6E6a5t8bIs3NXbnJ/XAxyxcJaMNfCya9U=;
 b=P3NltZHQG9fki8yzxrltWOeeVtu/S1CtKwry03015oukAW9LXnrBAANqBM92W3jblwZAEGLGEksUUe6djRD/k4sUZ9zgLmjsRvWpyp2tWmEG4q82zkatihwQOIM/jgWI0ChedquS3NSf2AP1LyeUvBvEgo1TsY60Lng4dQyaIMM4/rpItM/+y27k3fTH6tWtwBVK2hXRrwmpYMew6rOLwW6AjqkS63IoBXXX0e1xbMmIKaOk5v3T7YYcvzWX9Xq+sxBQ/yAaMGxaDZNwant9BPFSTO3y99F4YEe9FEPikGT9eiB9H2Cs5OrZxmD5ZAp2Utg8uTUL9rnaznl/Wg3IfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 15:17:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 15:17:58 +0000
Message-ID: <38164aab-e838-4a10-b16b-0eafc6c858a4@intel.com>
Date: Thu, 2 Apr 2026 17:17:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe/mm: add XE MEM POOL manager with shadow
 support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI5PEPF0000091C.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::92c) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4bd29b-28af-4833-0914-08de90cb056c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: EO4XNTAr9/9vTDaYPkCA2I/Dy4hK5jVQ59g1O1shXOhJEDBaKCPj8PCT82hg0JD6fDLqT3L/IEDeswgkeD4J+Os4YYz2UfqoUDuqOFP/PxFyB8HMGALftjQQDU7wCfnn5LA6RVbwSiyzltw9B33+LdxARyVFCDGr7EOKlEiLHRNimiWeBz0s9ur/X5k1Tm1/JgX7+rnQZ8OZ9UwkhJ3g0mwcqS02UYdxQlOok0GJYA9qz4Ygkkglfes614EHpTSzpchlcV15Re75wOnGspgYFzPg99kpju2/afnR9BJ7cdjQkHIlR+WotFhX8B/LL1BJkJqTIAMwLNNw+Oml578cOSGBe70KMe4/aJpyyStam0cQ113YjY12nnyzpgh/VKAreRUQiqg6jgiy5INGAguXqHzsXdSA0XPzBfvtZioSSqDaVk5xYLhcerr3Nid4PTGOA/ZSszEJssORu0ZIR7YFGvVs8f4LsIskwMCqL7/v2LrsBesjY7rqW6jh/5gGJfIr4Je+JyWvocCpbSvJ5jlVRrA40QUatgcYEdv2jS4noXdsFRiAv4vgEsJ4foPpK7dXNPaMx2BNqDuwDXTadp6SEnX94IW//20uKnCtlsxDuRkvQO17qiVFZpHixLgQMqmHgG5qVOVr8gS/tHMWo6uMLsQxZX3tbUm4RmRZJ66uRzkgleMua9fNmrYNzK3TGA9G1h/ciJpGir0k/1pF1V7Z+GysAjZfJw/KpVmcI8bhBlw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFlQYzJtZmVXOHdmREFlZUtQWkQ3VXVna1BuWGg4ZDhUd1FTTFBKR3ZodDBi?=
 =?utf-8?B?dGhwYzY0LytjdTV3aXpWWkVpN1BkZTYrUkY0YzZ4dnR4OUhiZ1k3U1NCSUVU?=
 =?utf-8?B?ZEpGMTQ5dERlOXdtM3pQeEpJa3JTcWdIM0FDUFpaR1E0ZnRZVVcrVFl2WVdP?=
 =?utf-8?B?VytoRi9LNFV4cTVKeGNjNTNuZUF0YjVLcVMzcHA2VTF0eC9XSnRKa29mWUJ0?=
 =?utf-8?B?S2g4MjZjR2FHMEE0QkRUdnpobHIrK2dBS2czL1JmQ3ZkK0pJZWhmMk1Qa0FN?=
 =?utf-8?B?aDVIRTV6NVZkcUZGUGhpbTQwb2dWV1hIbjNtdzRpUXF4UGRzRnNkaDdITnB0?=
 =?utf-8?B?cDh5ZVo4bE05MXRRUjNFSlRLOGVERXZxZW9XcDNSR2dzbXdtejYrQ3BhT3Jy?=
 =?utf-8?B?UmR4aGZOZHkrL3dqWk5IVm1iTXJscHcrTW9VY1YvVzRHclhuK2psQ0xVWVlr?=
 =?utf-8?B?a0FQM3pJdE9RZmNOVGI0Z09NczhDbHI2Y3FYRmxnNW1wUjhRd2dmanF5cHVI?=
 =?utf-8?B?c1VHUENXc1RtZVk4ZU16Ym1RY2JaZkFld2lpU2hWdGpueVVjSUhmNnZYM0Ft?=
 =?utf-8?B?ZUlFb2JwWExOM0JNNnZpc3htM1ovZnAxcTZIWFZFQlRZREpwSk15MXk0K0xU?=
 =?utf-8?B?OXAzTWNpaDdJOGZLZGNMOUtSTDBKb2c0OGlOTEFSb3V3QmdVNExUS1ZXT3BI?=
 =?utf-8?B?NFdvdkN1MXdja1YxdHpvSXY1SjQvYUdZQnZ3Y1lBNmpNUzFJWll6eURMOUlL?=
 =?utf-8?B?NkFDd1hyY09iVDVaajNWcXMvc2pja1hvVTV0OHJFOVl2RTZwUjVCS0FhQjdF?=
 =?utf-8?B?ZmZ4MTVIRkFRSU5BTjJDZEFOeUlKTnJLRWVIck9GQ2Vqc0FqNGtHSVhTNFRH?=
 =?utf-8?B?ZTJGdkJpOGtXcXJtY1RKS0hhVHozWmRSUjd5Y2VGdVZMTDliLzJEbHBXeEFm?=
 =?utf-8?B?bEk3Vm9hd2VjTUhLMGFQWThsb3RmeXovRWh4QzJMSXhTTlFGS2lES2J3ZGsr?=
 =?utf-8?B?RkFWNUluUzhOWnlRS1J6Wmx4MXhJcGt3S3NOdEwxUEs1dk0vL0JiZG8vMDBu?=
 =?utf-8?B?TVpLSytsMWM2ZUNHSDVMamNQc1pVQmw2NnVMdHFTN0Q3SjFHeElnYjFNTmF1?=
 =?utf-8?B?M2gxU2RvclpiekNUdlRFRlRyMXNzWDM5dlpiZERvamFRdEZZNnkrdVlFOWx4?=
 =?utf-8?B?NFZzUXBsdDF2Zm1acWl2VnJjVTRUalZHWnlLazhTdW9pblE0dWR6UlRXVWk5?=
 =?utf-8?B?UDF4TkxtMTEwNnlSU2ROWEFNank4ODJpb3Q2SjVlU2p1b1pINEVMNThhRnpE?=
 =?utf-8?B?WHJFUys5VHFyMlZzS1N0dUFhc3RUdG5seHBJckx0M2ladjgyTlZBUG5DWmxJ?=
 =?utf-8?B?RUZjbHJJclIvTHE1ZnFnME13clljaHBheVQ3a216OWRvakdvRUZHY1VCOUEw?=
 =?utf-8?B?QkJhbWFBSi9oWHFNU21nNTNUdXlDNitJdXJCVTczb1ZCNjhaeHFxWnpWWkhN?=
 =?utf-8?B?aSszaGViL1p2L2hkK2hwQXdBVVp4VEQybEE3YWxRblJITkR6THFNbm1BWUVR?=
 =?utf-8?B?YWJlSXl1ZC9hcUR3SmxwNzlVL3BMeFlXb1pmeElkbXdJbURUSndwRXJ1QnZQ?=
 =?utf-8?B?WE01aElNQ3I4NW41di9XNFBZbWNPTmVIdjJERHE1RXdjMktsT3B2VWgzYTE0?=
 =?utf-8?B?NnpHcDFIdW9sNnUrek5VY0txUXQzcTFJWmkwNXdoVmtLMkl1QUs5MTByVmZp?=
 =?utf-8?B?ZDZLaHB3R0ZMZnBXeWFIdkozSHZic0tac2VXeStMaVBYTTEyV09wc0hiR29a?=
 =?utf-8?B?bk1LNnhiZk5Rb0sxMkt3R1VhY1BiS3BaNC9OVmduZEFHYnllUjg2TnRSdHIv?=
 =?utf-8?B?NkRhQ1B5NkJzdEFwbE1MTFZtSFQ3eHZudkNXbmo3TjlNNGRVVEYrSVhNRno3?=
 =?utf-8?B?NCtQejhsU0R1ejlvc3EvYlMwTTkzZ2w5elhSSWtRLzhremgvT3JhQ2Z2UzI4?=
 =?utf-8?B?S3JwWHdHeTZacm01OXFxY2tVUzYrLzFJVHM3YXJqc1AyZG5Ubk9pdFJaS01P?=
 =?utf-8?B?WkkxcE1tYkFHbDN0aW1BOG5XanFnOHowYk0ra290dXRrRWRvZm9QU1pNbUVJ?=
 =?utf-8?B?R3VCMURZNktZcHJ2SDhacFJRKzM5U1U2akFqcnlpQk5STEwwaHg5L1gvMDlL?=
 =?utf-8?B?NW1LUXpRRm5KNlA2dzFQS3NRSlJtQnNEeHhlQUM4bk11dVJmaU15RTNVS2JS?=
 =?utf-8?B?elZHa1lsQ0RiLzJUdm1EcVc1VEI4RXNObUkzcXhPVXlaanE3TmVBVTZlcStu?=
 =?utf-8?B?UG85UXJHNmsrMXRKOFBQVmZWMVQvTkRpNVhoamhUUENEbkJ1SWtxS2FlUTZz?=
 =?utf-8?Q?dvBC+V+zUD2pjgkE=3D?=
X-Exchange-RoutingPolicyChecked: UYJ4J3q4D3iK0xQ06FFa72ZcZH/JZUbSzVjwbBzx1Z9EgtnVzV5lZjIznFFPBJc/maRjBVdZi9IbRiS1MJsGnJ+3puQtlyQ6e1/QVRMeLCi4wWLIhA7+TMhw4vnCgXLvRMVQchY22BMrGMc8TwaueZ7X6NEd6CR/1CWlHF4CnyL+xqT5OPPhRhTERQiPuKiQ3oRhG/ooT7+eVIUJWbQG+WoRrb79z6DNoXJr3YQEAlRw2fYejdVOe3HWv6y3PsnT84KUn1T22hpQJ6z5//L5oYs00BGOzRSA+pMFP7TZWdk95plomGX8iLuWM3bhe4MozoP3qYIfOdGRAiFvumiTAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4bd29b-28af-4833-0914-08de90cb056c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:17:57.8682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z7c1e9c544cY197dcSbVCzUJueiwNwd1nCXIvRk+nHRGfexVqSZCq+1PVz8tCo948BOh/3uJR32X8wqlwi4Qiw+tvR36sOzniEhlkYoe9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
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

nit: title

	drm/xe: Add memory pool with shadow support

On 4/1/2026 6:15 PM, Satyanarayana K V P wrote:
> Add a xe_mem_pool manager to allocate sub-ranges from a BO-backed pool
> using drm_mm.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool_manager.
> - Splitted xe_mm_suballoc_manager_init() into xe_mem_pool_init() and
> xe_mem_pool_shadow_init() (Michal)

well, my point was that we could have two separate components:

 1. xe_pool - that provides simple sub-allocations, similar to xe_sa but without use of fences
 2. xe_shadow_pool - that is built on top of xe_pool and provides "shadow bo" feature (as needed by CCS)

but that all of this could wait as any refactoring (and reuse in xe_guc_buf) can be later, after fixing hot CCS issue

> - Made xe_mm_sa_manager structure private. (Matt)
> - Introduced init flags to initialize allocated pools.
> 
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset during manager init and insert (Matt)
> ---
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_mem_pool.c       | 379 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mem_pool.h       |  33 +++
>  drivers/gpu/drm/xe/xe_mem_pool_types.h |  30 ++
>  4 files changed, 443 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.h
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9dacb0579a7d..8e31b14239ec 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -88,6 +88,7 @@ xe-y += xe_bb.o \
>  	xe_irq.o \
>  	xe_late_bind_fw.o \
>  	xe_lrc.o \
> +	xe_mem_pool.o \
>  	xe_migrate.o \
>  	xe_mmio.o \
>  	xe_mmio_gem.o \
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.c b/drivers/gpu/drm/xe/xe_mem_pool.c
> new file mode 100644
> index 000000000000..335a70876bf1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool.c
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device_types.h"
> +#include "xe_map.h"
> +#include "xe_mem_pool.h"
> +#include "xe_mem_pool_types.h"
> +
> +/**
> + * struct xe_mem_pool_manager - Memory Suballoc manager.

we can drop _manager suffix - there is just a "pool" instance we care of

> + */
> +

extra line

> +struct xe_mem_pool_manager {
> +	/** @base: Range allocator over [0, @size) in bytes */
> +	struct drm_mm base;
> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> +	struct xe_bo *bo;
> +	/** @shadow: Shadow BO for atomic command updates. */
> +	struct xe_bo *shadow;

hmm, this "atomic command updates" seems to be a quite big extension of
the original goal: "allocate sub-ranges from a BO-backed pool"

> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
> +	/** @cpu_addr: CPU virtual address of the active BO. */
> +	void *cpu_addr;
> +	/** @resv_alloc: Reserved allocation. */
> +	struct drm_mm_node *resv_alloc;

do we need this to be dynamically allocated?

> +	/** @size: Total size of the managed address space. */
> +	u64 size;

do we need this field? there is xe_bo_size() we can use

> +};
> +
> +static void xe_mem_pool_fini(struct drm_device *drm, void *arg)

no need to use xe_ prefix in static functions, this could be:

	void fini_pool_action(...

> +{
> +	struct xe_mem_pool_manager *pool_manager = arg;
> +
> +	drm_mm_takedown(&pool_manager->base);

this should be a last step (and CI already complained)

> +
> +	if (pool_manager->resv_alloc) {
> +		drm_mm_remove_node(pool_manager->resv_alloc);
> +		kfree(pool_manager->resv_alloc);
> +	}
> +
> +	if (pool_manager->bo->vmap.is_iomem)
> +		kvfree(pool_manager->cpu_addr);
> +
> +	pool_manager->bo = NULL;
> +	pool_manager->shadow = NULL;

not sure if this is needed, pool was also allocated as managed object
and it will be released in the very next drmm action

> +}
> +
> +static int xe_mem_pool_init_flags(struct xe_mem_pool_manager *mm_pool, u32 size, int flags)
> +{
> +	struct xe_bo *bo = mm_pool->bo;
> +	struct drm_mm_node *node;
> +	struct xe_device *xe;
> +	u32 initializer;
> +	int err;
> +
> +	if (!flags)
> +		return 0;
> +
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_ZERO_FILL)
> +		initializer = 0;
> +	else if (flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_NOOP ||
> +		 flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST)
> +		initializer = MI_NOOP;

this seems to be CCS usecase specific
not sure if this should be part of the generic pool
besides, isn't MI_NOOP == 0x0 anyway?

> +	else
> +		return -EINVAL;

it would be our programming fault, so assert should be sufficient

> +
> +	xe = tile_to_xe(bo->tile);
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY) {

this flag is N/A to plain pool init
and there is no clear separation between supported features (plain vs shadow)

you must decide whether this is generic vs CCS-specific component

> +		bo = mm_pool->shadow;
> +		xe_map_memset(xe, &bo->vmap, 0, initializer, size);
> +
> +		node = mm_pool->resv_alloc;
> +		xe_map_memcpy_to(xe, &mm_pool->shadow->vmap,
> +				 node->start,
> +				 mm_pool->cpu_addr + node->start,
> +				 node->size);
> +		return 0;
> +	}
> +
> +	xe_map_memset(xe, &bo->vmap, 0, initializer, size);
> +
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST) {
> +		node = kzalloc_obj(*node);
> +		if (!node)
> +			return -ENOMEM;
> +
> +		err = drm_mm_insert_node_in_range(&mm_pool->base, node, SZ_4,
> +						  0, 0, 0, size, DRM_MM_INSERT_HIGHEST);

this SZ_4 seems to be very specific to the CCS usecase,
and IMO it does not fit as part of the generic "sub-ranges from a BO-backed pool"

> +		if (err) {
> +			kfree(node);
> +			return err;
> +		}
> +		xe_map_wr(xe, &mm_pool->bo->vmap, node->start, u32, MI_BATCH_BUFFER_END);
> +		mm_pool->resv_alloc = node;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_init() - Initialize a DRM MM pool.

... Initialize memory pool

> + * @tile: the &xe_tile where allocate.
> + * @size: number of bytes to allocate.
> + * @flags: flags to use for BO creation.
> + *
> + * Initializes a DRM MM manager for managing memory allocations on a specific
> + * XE tile. The function allocates a buffer object to back the memory region
> + * managed by the DRM MM manager.
> + *
> + * Return: a pointer to the &xe_mem_pool_manager, or an error pointer on failure.
> + */

maybe we should have two functions:

	int xe_mem_pool_init(struct xe_mem_pool *p, ...)
	struct xe_mem_pool *xe_mem_pool_create(...)


> +struct xe_mem_pool_manager *xe_mem_pool_init(struct xe_tile *tile, u32 size, int flags)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mem_pool_manager *pool_manager;
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	pool_manager = drmm_kzalloc(&xe->drm, sizeof(*pool_manager), GFP_KERNEL);
> +	if (!pool_manager)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for DRM MM manager (%pe)\n",

we have a tile here, so:

	xe_tile_err(tile, ...

and this is not about "DRM MM manager"

> +			size / SZ_1K, bo);
> +		return ERR_CAST(bo);
> +	}
> +	pool_manager->bo = bo;
> +	pool_manager->size = size;
> +
> +	if (bo->vmap.is_iomem) {
> +		pool_manager->cpu_addr = kvzalloc(size, GFP_KERNEL);
> +		if (!pool_manager->cpu_addr)
> +			return ERR_PTR(-ENOMEM);
> +	} else {
> +		pool_manager->cpu_addr = bo->vmap.vaddr;
> +	}
> +
> +	drm_mm_init(&pool_manager->base, 0, size);
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_mem_pool_fini, pool_manager);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = xe_mem_pool_init_flags(pool_manager, size, flags);

I'm not sure this helper really helps here...

> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return pool_manager;
> +}
> +
> +/**
> + * xe_mem_pool_shadow_init() - Initialize the shadow BO for a DRM MM manager.

hmm, since you don't have a separate

	struct xe_mem_pool_shadow

then this init() function is little confusing
note that xe_mem_pool_manager is already polluted with 'shadow' logic

> + * @pool_manager: the DRM MM manager to initialize the shadow BO for.
> + * @flags: flags to use for BO creation.
> + *
> + * Initializes the shadow buffer object for the specified DRM MM manager. The

hmm, DRM MM is just our implementation detail
what we init here is "sub-range allocator"
please revisit all comments/descriptions

> + * shadow BO is used for atomic command updates and is created with the same
> + * size and properties as the primary BO.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_mem_pool_shadow_init(struct xe_mem_pool_manager *pool_manager, int flags)
> +{
> +	struct xe_tile *tile = pool_manager->bo->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_bo *shadow;
> +	int ret;
> +
> +	xe_assert(xe, !pool_manager->shadow);
> +
> +	ret = drmm_mutex_init(&xe->drm, &pool_manager->swap_guard);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&pool_manager->swap_guard);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +	shadow = xe_managed_bo_create_pin_map(xe, tile, pool_manager->size,
> +					      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					      XE_BO_FLAG_GGTT |
> +					      XE_BO_FLAG_GGTT_INVALIDATE |
> +					      XE_BO_FLAG_PINNED_NORESTORE);

nit: btw, maybe for the 'shadow' we don't need a separate BO
but just allocate primary BO twice big? and the just adjust offset?

> +	if (IS_ERR(shadow))
> +		return PTR_ERR(shadow);
> +
> +	pool_manager->shadow = shadow;
> +
> +	ret = xe_mem_pool_init_flags(pool_manager, pool_manager->size,
> +				     flags | XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_swap_shadow_locked() - Swap the primary BO with the shadow BO.
> + * @pool_manager: the DRM MM manager containing the primary and shadow BOs.
> + *
> + * Swaps the primary buffer object with the shadow buffer object in the DRM MM
> + * manager. This function must be called with the swap_guard mutex held to
> + * ensure synchronization with any concurrent operations that may be accessing
> + * the BOs.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool_manager *pool_manager)
> +{
> +	struct xe_tile *tile = pool_manager->bo->tile;
> +
> +	xe_tile_assert(tile, pool_manager->shadow);
> +	lockdep_assert_held(&pool_manager->swap_guard);
> +
> +	swap(pool_manager->bo, pool_manager->shadow);
> +	if (!pool_manager->bo->vmap.is_iomem)
> +		pool_manager->cpu_addr = pool_manager->bo->vmap.vaddr;
> +}
> +
> +/**
> + * xe_mem_pool_sync_shadow_locked() - Synchronize the shadow BO with the primary BO.
> + * @pool_manager: the DRM MM manager containing the primary and shadow BOs.
> + * @node: the DRM MM node representing the region to synchronize.
> + *
> + * Copies the contents of the specified region from the primary buffer object to
> + * the shadow buffer object in the DRM MM manager.
> + * Swap_guard must be held to ensure synchronization with any concurrent swap
> + * operations.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_manager *pool_manager,
> +				    struct drm_mm_node *node)

we shouldn't expose/use pure drm_mm_node in our API

> +{
> +	struct xe_tile *tile = pool_manager->bo->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +
> +	xe_tile_assert(tile, pool_manager->shadow);
> +	lockdep_assert_held(&pool_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &pool_manager->shadow->vmap,
> +			 node->start,
> +			 pool_manager->cpu_addr + node->start,
> +			 node->size);
> +}
> +
> +/**
> + * xe_mem_pool_insert_node() - Insert a node into the DRM MM manager.
> + * @pool_manager: the DRM MM manager to insert the node into.
> + * @node: the DRM MM node to insert.
> + * @size: the size of the node to insert.
> + *
> + * Inserts a node into the DRM MM manager and clears the corresponding memory region
> + * in both the primary and shadow buffer objects.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_mem_pool_insert_node(struct xe_mem_pool_manager *pool_manager,
> +			    struct drm_mm_node *node, u32 size)
> +{
> +	struct drm_mm *mm = &pool_manager->base;
> +	int ret;
> +
> +	ret = drm_mm_insert_node(mm, node, size);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_remove_node() - Remove a node from the DRM MM manager.
> + * @node: the DRM MM node to remove.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_remove_node(struct drm_mm_node *node)
> +{
> +	return drm_mm_remove_node(node);
> +}
> +
> +/**
> + * xe_mem_pool_manager_gpu_addr() - Retrieve GPU address of BO within a memory manager.
> + * @pool_manager: The DRM MM memory manager.
> + *
> + * Returns: GGTT address of the back storage BO
> + */
> +u64 xe_mem_pool_manager_gpu_addr(struct xe_mem_pool_manager *pool_manager)
> +{
> +	return xe_bo_ggtt_addr(pool_manager->bo);
> +}
> +
> +/**
> + * xe_mem_pool_manager_cpu_addr() - Retrieve CPU address of BO within a memory manager.
> + * @pool_manager: The DRM MM memory manager.
> + *
> + * Returns: CPU virtual address of BO.
> + */
> +void *xe_mem_pool_manager_cpu_addr(struct xe_mem_pool_manager *pool_manager)

shouldn't this be per node?

> +{
> +	return pool_manager->cpu_addr;
> +}
> +
> +/**
> + * xe_mem_pool_bo_swap_guard() - Retrieve the mutex used to guard swap operations
> + * on a memory manager.
> + * @pool_manager: The DRM MM memory manager.
> + *
> + * Returns: Swap guard mutex.
> + */
> +struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool_manager *pool_manager)
> +{
> +	return &pool_manager->swap_guard;
> +}
> +
> +/**
> + * xe_mem_pool_dump() - Dump the state of the DRM MM manager for debugging.
> + * @pool_manager: The DRM MM manager to dump.
> + * @p: The DRM printer to use for output.
> + *
> + * Returns: None.
> + */
> +void xe_mem_pool_dump(struct xe_mem_pool_manager *pool_manager, struct drm_printer *p)
> +{
> +	drm_mm_print(&pool_manager->base, p);

maybe also print info about the BO and shadow BO (like their GGTT)

> +}
> +
> +static inline struct xe_mem_pool_manager *to_xe_mem_pool_manager(struct drm_mm *mng)

please, no "inline" in .c

> +{
> +	return container_of(mng, struct xe_mem_pool_manager, base);
> +}
> +
> +/**
> + * xe_mem_pool_bo_flush_write() - Copy the data from the sub-allocation
> + * to the GPU memory.
> + * @node: the &drm_mm_node to flush
> + */
> +void xe_mem_pool_bo_flush_write(struct drm_mm_node *node)
> +{
> +	struct xe_mem_pool_manager *pool_manager = to_xe_mem_pool_manager(node->mm);
> +	struct xe_device *xe = tile_to_xe(pool_manager->bo->tile);
> +
> +	if (!pool_manager->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_to(xe, &pool_manager->bo->vmap, node->start,
> +			 pool_manager->cpu_addr + node->start,
> +			 node->size);
> +}
> +
> +/**
> + * xe_mem_pool_bo_sync_read() - Copy the data from GPU memory to the
> + * sub-allocation.
> + * @node: the &&drm_mm_node to sync
> + */
> +void xe_mem_pool_bo_sync_read(struct drm_mm_node *node)
> +{
> +	struct xe_mem_pool_manager *pool_manager = to_xe_mem_pool_manager(node->mm);
> +	struct xe_device *xe = tile_to_xe(pool_manager->bo->tile);
> +
> +	if (!pool_manager->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_from(xe, pool_manager->cpu_addr + node->start,
> +			   &pool_manager->bo->vmap, node->start, node->size);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.h b/drivers/gpu/drm/xe/xe_mem_pool.h
> new file mode 100644
> index 000000000000..f9c5d1e56dd9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_MEM_POOL_H_
> +#define _XE_MEM_POOL_H_
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include "drm/drm_mm.h"

use <>

> +#include "xe_mem_pool_types.h"
> +
> +struct drm_printer;
> +struct xe_mem_pool_manager;
> +struct xe_tile;
> +
> +struct xe_mem_pool_manager *xe_mem_pool_init(struct xe_tile *tile, u32 size, int flags);
> +int xe_mem_pool_shadow_init(struct xe_mem_pool_manager *drm_mm_manager, int flags);

"drm_mm_manager" - seems to be a wrong name, just "pool" ?

> +void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool_manager *drm_mm_manager);
> +void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_manager *drm_mm_manager,
> +				    struct drm_mm_node *node);
> +int xe_mem_pool_insert_node(struct xe_mem_pool_manager *drm_mm_manager,
> +			    struct drm_mm_node *node, u32 size);
> +void xe_mem_pool_remove_node(struct drm_mm_node *node);
> +u64 xe_mem_pool_manager_gpu_addr(struct xe_mem_pool_manager *drm_mm_manager);
> +void *xe_mem_pool_manager_cpu_addr(struct xe_mem_pool_manager *mm_manager);
> +struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool_manager *drm_mm_manager);
> +void xe_mem_pool_dump(struct xe_mem_pool_manager *mm_manager, struct drm_printer *p);
> +void xe_mem_pool_bo_flush_write(struct drm_mm_node *node);
> +void xe_mem_pool_bo_sync_read(struct drm_mm_node *node);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool_types.h b/drivers/gpu/drm/xe/xe_mem_pool_types.h
> new file mode 100644
> index 000000000000..bae7706aa8d2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool_types.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_MEM_POOL_TYPES_H_
> +#define _XE_MEM_POOL_TYPES_H_
> +
> +#include <drm/drm_mm.h>
> +
> +struct xe_mem_pool_manager;

unused here?

> +
> +#define XE_MEM_POOL_BO_FLAG_INIT_ZERO_FILL			BIT(0)
> +#define XE_MEM_POOL_BO_FLAG_INIT_CMD_NOOP			BIT(1)
> +#define XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST		BIT(2)
> +#define XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY			BIT(3)
> +
> +/**
> + * struct xe_mem_pool_bb - Sub allocated batch buffer from mem pool.

hmm, suddenly from "sub-range allocations" we jumped to "batch-buffer" specifics

> + */
> +struct xe_mem_pool_bb {

maybe:
	xe_mem_pool_node ?

and it looks little strange that

  * we hide xe_mem_pool_manager details
  * then in functions accept drm_mm_node
  * but expose xe_mem_pool_bb here instead

> +	/** @node: Range node for this batch buffer. */
> +	struct drm_mm_node node;
> +	/** @cs: Command stream for this batch buffer. */
> +	u32 *cs;

maybe we should just have a function to return CPU pointer of the xe_pool_node?

	return pool->cpu_addr + node->start;

> +	/** @len: Length of the CS in dwords. */
> +	u32 len;

do we need this? there is:

	node->size

> +};
> +
> +#endif


