Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3398C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 11:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A5A10F7B0;
	Fri,  3 Jul 2026 11:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YurrQhPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476910F7B0
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783077343; x=1814613343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=io6OxUDHzHvZwmxA1cL60JYRGqduW1bC5uyY7uIyvko=;
 b=YurrQhPRn+OLPBs4turKykMAt22Hn3foa1YPmaw02DRXOnCARfXGlAif
 dg2c/WTg4agOe2rdSKNOsbydaF7GcFxuyyUtCXLT7puA/E7TbxI/+Xdf/
 c6xMzrUL9JmqcJB3KerzTmdudzFsnMxXxEdwYdv13na8kfaYSZNVVRQKo
 GbejDTwmuN8ZdGGwrnow87Wec6nL8gAd6KWUKNjAU9fussDujL2DyTDuA
 FTnFhfW5BDuVG5XI0mym1hG1fl2b+MKIF6baEecAwKLZSC7LkQTtRM6vu
 cqf0VgVUnXZwys9HsL6dHenlOPzb4LAL8MKToPx+AGpSZBPd089o7xJi2 w==;
X-CSE-ConnectionGUID: 8L4AqnT7RLCojsVvbPr6GA==
X-CSE-MsgGUID: 7Q3IESP+Qy6icQVQEWXOrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83813125"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83813125"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:15:43 -0700
X-CSE-ConnectionGUID: EAjJhtygQdmGTB5+zZIFEg==
X-CSE-MsgGUID: tqoKze2kS9m9LQ12wGw+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252033629"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:15:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:15:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 04:15:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIAJEn6o+SI3i59fXylAMALg+K/eefoZAjQJ/mqT2kTQeHoZj5C9+wwdF9H9Wp3BB1hR84cHJsWT1gFhnZVW5QtVRbMnLMXpnwK7jNp0omtxdwXdxSwrqwkO3sWRvVOg9HSbqao87z8ku76BDdWzfIMM+Pr4J35kamWtrcOV/fOy8c5W4rh7iWznxL5z0a3ZibWeNtuqTnwHp4EiSPL1+ZECAPoRCho2GUoviTsDwT4HGgzpmnCqf4cyHSMVH+J3jYr9iUo+dNKxhr1eI1oPL2eAmF5PhUneRMymg0AU4/NrcTZVLLe0yHqpDZRPGZVsGjny1R8FZV/wWSvKf/6hLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnRmt9TE1GuKntU6/U81e8Viq1IQI3yFhAgoGIlHuVE=;
 b=yf5xO/TnUzeqKSF+baR+jaklhvJLS2fdN91eAn6/Eb9Pp+vCTbfWkpkIWmdLn3l9aEvPkztarGE3jptAIpK50EgTOlZCdJdVMGKLJWq4mtwxSAejUHMLTV0/w8t9P0dFYuCW+pCeBm+FYgNl2TlZiK5jwE5+rAIkJ5hksPY4hmJpuLM563gMeXSMrVWt+QijozYIcCTjDvYnt2z4L8LMXwsSgLZR7SW+Y9LRKYjGkdBRYYi5Pv9ftASQXrqDm85Mf7krYlUJU4zu0vnr5zjHqprTUxYlCArgZP4s7wJuIitwGhgHachqWl0COPxmzgiYOfPiEhAgM704ecwZTv+PrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Fri, 3 Jul 2026 11:15:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 11:15:38 +0000
Message-ID: <6b6e6259-a4bb-4d79-a87f-a8b21e22e923@intel.com>
Date: Fri, 3 Jul 2026 16:45:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 2/5] drm/xe: Add RAS logging helpers
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-9-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260630115503.407158-9-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd47d24-abce-434f-0d44-08ded8f468fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vuHbegNIQOh0uF2djfo9vliS21XwUwWHK96DBXJs+Eb2UnzW+zQKX4bpDUtO40WJ09Sa18ZWV9uMagqVZVEXXiOpLPckP2DBJG5Z9JNhoxHFq7DGxxRj433TkgIFjnuhZYZeJfdeiEZTXRszAkzWYNZdEyjIB/Fcbw01YrWifRX0ef7Y0mXKT1LripwABtsD+mA+8IDU2jX1ok9XHICa/TS09hhtaCmdNmwhMWjKd7JFEzvsRoa2pwXRVNR456sDEYEDAkGf65m2oXq5ANLo/asdyXkGCUuG5BZL1CkeWB92f5VkLYu6MNTTEhtWdY2tdOAMeo3lhkz7j2mCLMTHVeHAelxyP7CAPI9p551alNewSJsE+kcut1bZQboo0XTU1q8uua68Ozz16xdY2oQoFrE/p/Qzy5DcSVyPk5fH+POjej7CWI1q/6ITLZjwDyFVLTbwhvswPGe+d9Jsp7jd+pQt8+FqX5IQE3zKLnYCFPLrSpSzH4KTYfHMfq331GzzvMLJN+REi4FGt+EjASosvCZGufDtN3CRED9veTdjXfexA+Uy3oPcTGPMBgehLf8HyXthT5XypcmItLOgYGSG7a4wZAOapBChk1lSzGZHISomeCCv1McKGUkVGmDt0BXm08QooEYaDIyyDjp5r1KZcBcCKXdfDtx8/JocNFq97cI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVAzMmg1Tzl1UkJRWEhsZThSRG9CRi93WEoyTVMzY1dmbjlqT3pHclUyK0s2?=
 =?utf-8?B?Rmg5b0NqZU1JcGx0YURLUUhhZXh2aVVqSWJXMjQrOGhmUHorTGprR1hseE0z?=
 =?utf-8?B?NERMUDd3WjNaS2ZqUmJNRVhpMlV2aUZkR1N0dndRTlUxTmk4N29JRDFYZTdh?=
 =?utf-8?B?K2tuWTl6OUxMbkF3UnZTSXBvZEV2aitSQWdyWFlnckdMTVNUMkFvOW0wdWor?=
 =?utf-8?B?M1hOc3VqUmdkL281TFdYNFlQanhScTZBSDlPd2NLU0pQOFFnNFNDdkJHUGFL?=
 =?utf-8?B?M0s3d1lscUlweEd4ZzFzYkhXMmZtVWNHVjZLd2Jpc2R1OXNhbXlvQzNOVzU2?=
 =?utf-8?B?T2lnQmpUKzRWR0Y0QlZyUVQ3OUE4VDJOU1c1bHc3dURVWm5RMm5ublhnYUMr?=
 =?utf-8?B?c0xJZWNydjdiUmdicXQ5T0dVZ1JnN3h6NVdsT000ejZ2LzJUOTArbFh6aDh6?=
 =?utf-8?B?OWUxdVZuVUtTQ2pFOE5mY2RHeUtrVnp2RWhobXBZS1Bja254ckZUZCtPZVZN?=
 =?utf-8?B?SVBCTEpzbUZrYWl3WlFQdVUrUWp3YlVjQWVhZlhUR1R5VWxncy82K3F5MkxK?=
 =?utf-8?B?Qi9ncDAyKzhhSzNkQmtqdENqQmdvdStzUDVzY05KdWhmcTB6UUdsQkVqRFo3?=
 =?utf-8?B?c295ZXMrVDZMZThjcU1teUR4VkFnbitxUS9FZXRabVM0N3hRRW5Ud1ZlakVL?=
 =?utf-8?B?NmxkU0Fna1crajVENnE5SVpVM1Q5cU9uZXZNVEVaQjV4VUhzRms2ckFNVHd3?=
 =?utf-8?B?Tk14Y1Q1aGcwVXRIMWtHQldTdG5MK282bUJpM1kyWlFoSjg3QUlydmZhRmN2?=
 =?utf-8?B?VW1QeFJnb0paVGJIYjNhaGRuNmpoWkprMFhsQWFpSnQ5aTFQYUlDY0pheDBF?=
 =?utf-8?B?TmVuV2R1L0VTS1RpSS92Nm1lZXdnWFZUZzNwdVJNVzdSNDRydWJqeHpMV2lX?=
 =?utf-8?B?NFdMVmNxakczdnB5Q0Fvbm40R05VaHVtYU4vQ0ZJUnNGMzBuSDZ6aWc0UGtB?=
 =?utf-8?B?d0pScUxiVnpHS0FnekhuajVwS2JNUzVJSkUrWnRUdUxsS3YzdDVjemh5WG9a?=
 =?utf-8?B?Snc0a2UwSWU1bWpXbmE0T0l5Z2RZQkVTNGwwOVRvYjJtdnhBMDF3T2NpSlhD?=
 =?utf-8?B?Rkh4SG8vcjI3NXZTNXFrdVJWTHRuQ2p1bENVc1FNc1R4V3VGdng0bGdRZlVT?=
 =?utf-8?B?WUdGSEpQSTVKMDNMUzVHUFRaR0F0NzZoUmRwcE15cXY4Z3FpajFrTjREcnBt?=
 =?utf-8?B?MytJeVdHTTA3TU9MekxQbHE3QkUxUDhETENoNUhjUjg2UldVSm9aNnB2QVdW?=
 =?utf-8?B?OEFCb1I5aDZtdFExSTk1NTJ3R0Nwc3FCTDhxWnQySmxhK2xVeE44YmpPcEZZ?=
 =?utf-8?B?Nm1HWFB4Q0JGK0VHNHJ6MW1idVpUSDd4VVRwME0yUERrYjdoMnFyZmJ6dk1a?=
 =?utf-8?B?UVBsTFB0RWlaS3ppUFI2bWViaGlRZUtoWE5HVlY3b2d2OG5tbEtJTkRwK0hU?=
 =?utf-8?B?aEplVnkwUDdEdzJjNlJVU1VaNk9tMTBXS2xyVG1PVVczb2JSZzM2UjZoVlhI?=
 =?utf-8?B?QUlsTis0a1lYdkFBcGVzM3I2b1dLS0tBbDZBbmQ3dmdDUnZvU3QyMUNmL3d0?=
 =?utf-8?B?eVpuUUM4cUw3WXBTMlQrWFlBTUg4M0VuNUdld1lnRmt1YXhQNHVRT2lZSkpN?=
 =?utf-8?B?djRMU2EzazlQZWxOeGQ2NEs4MWFxa2JPMXI5UXBxMTNqZmszL2xxL1d4YjB5?=
 =?utf-8?B?U2tMcklLUXdvR2x5aEhranl3S1dIN0dMcWRZN1BoMXZjWW92ZXZIZkt0MTl4?=
 =?utf-8?B?c1RDbUNzR0dVUjlFNmVuemdMcjZybitmcFRnM3FrakpxL2RQb0xPekZwcjJy?=
 =?utf-8?B?SU15SElITCtQRjVLOXZ1L3JsRitNRVZ2VGNWZEk5cGtmMlNHYm5wNFBhOHJm?=
 =?utf-8?B?cXN1R3dtNFJkNGhtM2VsQ2dLU3l1YlNvY29udFdpUm1EUlhmaGFCVnpxSk5I?=
 =?utf-8?B?cVlmWVMwN1dqeXRwanc0cncyZnV2YkRJeExGTUZFb0kveWI1cjlCZlFFZjdK?=
 =?utf-8?B?Y0lSdjBpVGJvMjR2ZVJEWTNCdysyUDg4TjlTTGZpcmJEVUVOemNVTlUyYlJj?=
 =?utf-8?B?M1pUV0FMQ1dZOEVLK0tBNWR4Wk9kaTlzcXBoME1HRnhrZXdDeG5udXByUlNo?=
 =?utf-8?B?Q0pYV25aT2VLRG5ueG5sbkdFeTFxZTZLTTd6WnUzRHVnTnpmd2JUR2FIbFhw?=
 =?utf-8?B?bFpsaGtEckVUZkxIZ1JHTUJ1RnBBaFJkMjJLVDNiTm1SeWlkeU5CcXY3eVhk?=
 =?utf-8?B?akZoRldtcUlkRDBOVEloSTlFNG9wTERRekM3M2pJa3JwWFNzd1p3UT09?=
X-Exchange-RoutingPolicyChecked: dWP3Me2hHsBbKGRm+rV99ovnvr4XLcodOTTlipMloHuUabGA0g23jw6GiB/CORt6Mq/YyWGPFARzq6+XkQjhz5IK5j3FeLW/NHMcFJHWQhoy4tabMDH67sAyORKH0KvIZJqFyyuBbybBuLUAUFX4yXmaaS0WByH0+VrhV6aiOZiiifviics2HTCPKNhK+f55MoLsO9AO3/Hnm0JgMcrmJgYrOzPfaObDw2D75gek7UQbRmS5bDgqL2VUrWeEFmVANVoNoEz4lsP9syWUEKQp8sOXUGJP2LgD5OdhMi37xUjg2EXE7JyEkCfrVTgUDBLJO84gWQuCvthbVldctQR1eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd47d24-abce-434f-0d44-08ded8f468fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:15:38.2331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSnVGRk8fPoHiAUgbU/5sjgtuK1av3ZwEK8hlwCxkEDPe0cr8xfVhteqNs11TcotoD4pomXWVe08T61SgR9WTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
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


On 30-06-2026 17:25, Mallesh Koujalagi wrote:
> Add xe_ras_log_(*) macros to report Xe driver errors in a
> consistent, structured format.
>
> Exposes one macro per error category (probe, wedged,
> survivability, firmware, GT TDR, memory fault, IO bus). Each macro
> hard-codes the correct SIG_ID and severity for that category, so
> callers only need to pass the device or GT handle, errno, and message.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
> - Declare __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
> - Make macro function properly.
> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
> - Add sig id documents. (Riana)
> - Change macro function same prefix as the file.
> - Handle __xe_ras_log() function with variable format.
>
> v4:
> - Handle CONFIG_UEFI_CPER properly.
> - Add CPER_SEV_RECOVERABLE in __xe_ras_log().
> - Add xe_ras_log_runtime_fw() and xe_ras_log_device_fw() macros.
> - Update commit message.
> - Remove document. (Riana)
> ---
>   drivers/gpu/drm/xe/Makefile     |  1 +
>   drivers/gpu/drm/xe/xe_ras_log.c | 65 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_log.h | 62 +++++++++++++++++++++++++++++++
>   3 files changed, 128 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e5a04253e73b..cac19c21be08 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_ras.o \
> +	xe_ras_log.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
> new file mode 100644
> index 000000000000..928fa4f45cdc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_ras_log.h"
> +
> +/**
> + * __xe_ras_log - Emit a structured RAS log entry
> + * @xe: xe device instance
> + * @gt: GT instance where the error occurred, or NULL if device-wide
> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
> + * @errno_val: negative errno describing the error condition
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Formats the message and emits a kernel log line via drm_err() for fatal
> + * events or drm_warn() for all others. CPER record generation and hex dump
> + * are planned as follow-ups.
> + *
> + * Format:
> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"
> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...)
> +{
> +	char loc[32];
> +	struct va_format vaf;
> +	va_list ap;
> +
> +	if (gt)
> +		snprintf(loc, sizeof(loc), "tile%u/gt%u",
> +			 gt->tile->id, gt->info.id);
> +	else
> +		snprintf(loc, sizeof(loc), "device");
> +
> +	va_start(ap, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &ap;
> +
> +	if (cper_sev == CPER_SEV_FATAL || cper_sev == CPER_SEV_RECOVERABLE)
> +		drm_err(&xe->drm,
> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
> +			sig_id,
> +			IS_ENABLED(CONFIG_UEFI_CPER) ? cper_severity_str(cper_sev) : "unknown",
> +			loc, errno_val, &vaf);
> +	else
> +		drm_warn(&xe->drm,
> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
> +			 sig_id,
> +			 IS_ENABLED(CONFIG_UEFI_CPER) ? cper_severity_str(cper_sev) : "unknown",
> +			 loc, errno_val, &vaf);


There were few comments regarding this from both me and Michal from 
previous rev that were agreed by you but not fixed.
Also let's close comments from previous rev before sending new revisions.

Thanks
Riana

> +
> +	va_end(ap);
> +
> +	/* TODO: Add CPER record driver handler */
> +	/* TODO: Add RAS dump cper hex handler */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
> new file mode 100644
> index 000000000000..3f94e6747e86
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_LOG_H_
> +#define _XE_RAS_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "xe_sig_ids.h"
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +/*
> + * Common backend helper
> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...);
> +
> +/*
> + * Driver error reporting macros
> + */
> +
> +/* FATAL */
> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +/* RECOVERABLE */
> +#define xe_ras_log_runtime_fw(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_RUNTIME_FW, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_device_fw(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_DEVICE_FW, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#endif /* _XE_RAS_LOG_H_ */
