Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046F4C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 10:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FC010E159;
	Fri,  4 Sep 2026 10:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyKXghpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E1710E159
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788517127; x=1820053127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=snOKZgc+1ZsEPpn35azs7F6dFzsD8TpkKtUJZ5Drn30=;
 b=nyKXghpGCef8aKZO4cKx80NJ+RJaZU0L0uVBReW4piGE5C+PtAwQaUPm
 E3ndnmzMhWyHA4wBJZ4Y6Q+bm9u0Sza4DTn2g5l9JAtW/hX5Mm/aNRfYq
 1do0bhoawjW99HtlrYWP40bhVA9BZDh3sPRGb1OjCGmPA5KeysYUx6zMB
 znLA2VsY3bUBpgwj6PvFyBCPLIlOTSrd0e2rWAHmkrfPZQYJIx+kCp2vl
 SMMNNb94u7UgGafIAr0/xJjUbku1dvl3hf0Own/0fPHEtDC/kMXRVUwBo
 X/4T5r0HvNRL+xr1pIWLsw2P0qNST/ry3bFOcWnaokXAlck4dhG2G57Rb g==;
X-CSE-ConnectionGUID: ntqBNObLRse/Hq2AXEoF1w==
X-CSE-MsgGUID: up81Xc+qT1WNATkBtNNRHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100534037"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100534037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:18:46 -0700
X-CSE-ConnectionGUID: diDf7oBMSd+h8/JLD1pj7A==
X-CSE-MsgGUID: fy5M8Si5RPin0tra3o325g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268270962"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:18:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:18:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 03:18:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clu23ogczWTh/0h6FR+U+dEKxkcjpflvyO+0RLr0Jky9Xij08WkQ8UOPiH+HF0vUfyiaAyRAScahYIsM+qEgaG4tNKOP0fejc1/GKmesLBv72df5P1+tKg0kLU5fsbNc+yOHg4baek6z0k9kNXSYzpg3iOJiHAIZ9qLryOnSkZkTk65jeXtb/fmun5nTn0Ls1/zBWjx9UyZmHwDx4o7zuryAk4L+4ERmiAvhZqhXO8K8OHFX6FmQ1dW14H23MDhypCpdPosDgLYc00Pz8XGzrOMMgJTVcm7EOhIlgey1I+Z8+77DrybaQfvybGscBbaX6XwIS/ir0JJOrkB/H8+9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cw9XPix6N4wPWqZOoJNV9VlAIyQa+K41js8MJpuBuw=;
 b=OBPjBxVR23eFAW4swu4vzY2snS/16moAgxRtQfv32d5acqNE0cJYzJzvFBKxdWL+YXUdLVaQvYGLyOeLWAaQ7EE4rnj9z3tYf0IDIlDijSnDeRcDFj/gSFnQ3B6wQwTps2alMLpG/ROSg7N7Gtx/6hFYlwqYD8skJAFf0wGj036JQxHF9ekmOt/mMF+g2Wkd/bJ/fpY8gHR72yNhVe51McdeAAVI9YrK6ADMPjeBhJnmHIWj1u2fIpx9hUGwjsqHhQO6T9eCrvep4N8n/bAxSqzJZlhay8mq679NyrxQj3PSsIQIu6T7+b7XpBu9LF6GsJGPPZdPVzXtsMB7A+JArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 10:18:38 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:18:38 +0000
Message-ID: <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
Date: Fri, 4 Sep 2026 15:48:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Tauro, Riana" <riana.tauro@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
 <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c15258-ce56-4ccc-1cbe-08df0a6de2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|3023799007|6133799003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: QArRg+ve73DlYfIKbmP9R74/gQz50qrTH1x2kc4XAyvcmFE77oybJI3BYa7gFlK84UnkErTFkgG6fqr6g9x1h7sf/LmQV2ilNVaSOPy8X8dhsSwDgFQ5D/f3qfQ4xaU/84Ev5OMPmGAHDzX8yKkxvG0cjMTN9kkXFAS5dpqOX+jcZp+wn4VztPOhF67un7gb2PkXk8cGfilAlpiZuqzhlsBOL1jRgcfJea2C6RQKeIqvjjnzJMAl238rRnUJKzhO49+4k18kRUNp7Gw0UYgkhQjSt+1OjAI+m7liT9rze3QMOkPDy4naH6Ey/kRAG6vqJw4csviRhsXunUwH9tP2MN+13FOn44nAZIFmjCGS0Y6IRclImlS50k5FiIcrBzCUGsCSJtEdr/Vu89xtUPzgxLJU52kAqXYU8lUWkxt7h0kWbPVxMp22pX5Up/Jkc13PU1DkGA8SgJVaJRF4YsOBBxlRqtrwqufaS+59vSCHaaI9KVBJW3ChKczPBQdBiR2WciUFRDMHwrlVt1VpOVEg2aBsjzfJD1ph8QDQISB7mZYi0i364NgbpUMMAdI42Df1L+ravebyyYDG2IRFmpQG2MeIuoQQumaHmMHCDwtIo3s/sYvt1v5K8cuWSnVaP48KbRXhCud2HQj6orK8xW2xkeK2qOvimYx+Sh8m7yT6AGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXltOUtoUmxERWFRSFQvdEF4N29hNU1nM25ZL09zYkl1QnUxNmNoaGx1blNs?=
 =?utf-8?B?MnhsWjdaSWI0ZGoxN2VmclZPeHZwMkRZcHJMOFRzWlQxdi9EbTQ1VjJ4WmJN?=
 =?utf-8?B?WG52YUtNUXFlZklzOEZ3d0x5VlkwKzJGcDFiQXhMUTJTU1J1di9oMmxQTDRD?=
 =?utf-8?B?MUU4RGZSZWZtcmg1RXRZTjBGZDdWT29YUnFIVXplMkJiM2RIaTNQa1h2ZTBj?=
 =?utf-8?B?R0dXQzZ0a2s5TXlvaU1TZ2JYbGJzblBKelZFYzAweitsQWxZZnJvajZpbklh?=
 =?utf-8?B?UitLTHpwWEJBVkdXcGduV1VQS1hVRXpDeVQrNmc5MzlMeFFrT0tEak9EYUZm?=
 =?utf-8?B?dmVjMjY3WnhlbzMyOW8wTjIwTFY2NzcvaktQbFh2TTRIK081TDNJdGtnektN?=
 =?utf-8?B?T3RjL2pFMlBFK3E3S3pLREd4Q2JNMVQzSjloK1BKbHA5S2RXU0VtaXpQOWhD?=
 =?utf-8?B?ZzgxNGxMNm5BRm1nakJmSGcrSGhCN2FrVytITDZ4dktYOUFYZzJQM1lRQlpk?=
 =?utf-8?B?bThpMWR0bFk1N01FYnFTL3lJQ0VVdUtHdll3RXJQN3FpczcxSlZNZ3dIM3Br?=
 =?utf-8?B?QVlwVTgvZmxIUnQrNXYrcWdsdklYNHdBYTZsc05LMU9HY29SbjVYQmdFbHF5?=
 =?utf-8?B?UTRUb2RKK3R6QVovRjFDeStrZDZPc0ZnY2d2NzNhbWtTRENHUnZMWnk4bm1a?=
 =?utf-8?B?R1JTY3RTeUNCOC83R1Q2aFVpK2EzWUREeExkY3pYQWpOakR3T0grUElFMUo2?=
 =?utf-8?B?WlRFZ0RXWG5yemZaMkFmNWlBZXVTUDh5Mk5Jd29OcjFxWHFMMU5kSnRNclpB?=
 =?utf-8?B?bng3T1FUV3U0YS9YZXBGWHg5bVdLQzUxWlBBUHNVZDJhcWpMZ1Y3Q2hGcUlr?=
 =?utf-8?B?OUhyQVR5eEdSb2FZMmZtbU9WSkZlV0RJSWhQY29TdTl0alNSemdZU0MxNW82?=
 =?utf-8?B?TENOQnc5UnZIRS9NS2hCZjRMMjRDUlJDZnFMMFBZc3lXMm1lQmkvbVdxZHFI?=
 =?utf-8?B?T2VIREJISGhSVVlOc01yM2RlUUZqbjd0UzJZdVM0eHNzVGN5d2d4Z1hLeCs3?=
 =?utf-8?B?UXpVSElOd1BEbytoOTRGUW04MHI5Z0p6R1ViMDgvaHJTcEpyY014M0pVQXZQ?=
 =?utf-8?B?TW4yRVZKRlhyQ1RaaFZWdmJSWXU2L2xCdG0vUjhibmNNaVd5RHovM0hkdGdl?=
 =?utf-8?B?eEhSSXNIRnBCY2xkRG1sTkJPOVVnMWsrY2tGb29QS3RnS0x1bkRJc2x5WDNy?=
 =?utf-8?B?R1NMejhzZ0lZRjhZaURnQjN2bHJSd3RLRUc4L0kwZmtyT014Ulg5Zy9IMGZ2?=
 =?utf-8?B?K0pPamo4QndJYUdoaW9sTFhjQ3FnTDFjMmtDczRGYTMwQS94aVhqcXNEMlNw?=
 =?utf-8?B?VEluZzVBM0wxK3ZPL1Y0V3FKdlNpellVelI0V0F6YU0vR1hmSmRQbVBVVzRQ?=
 =?utf-8?B?QUFkdWp3cFhoV2Y4V3VZOWdieWxHOEllLzlCSnNyWHNidy94OHlUeDVTcDFt?=
 =?utf-8?B?ZytNd25lOWluUUIyd1lQREN4MWp4bVNFT1pmMHVoMFY5aXBWZ3d1RWRBR3RI?=
 =?utf-8?B?NkFCUFVUbkRZSC8xVGRSK0pBTkNudERrNElWK0VpVEpSeHpiMW45eEZ6UTgw?=
 =?utf-8?B?bHh0aWgwampHVVVEeGpRakVkZ0RPaUxjeFB1ZEExZE5sOE1UMVJJcmJkNmtr?=
 =?utf-8?B?ZWtRUy9vOC9ib0lLaXZlRnJ1Q0tJczNkUHA2WTl4V3VMdkpoSmNBcGNsWjZL?=
 =?utf-8?B?ZWNWWkZFK3VmNWtBZGFXbGVOSmxybWpZSTBzdGxpK2hGNlE1YURBVFMxZ2RK?=
 =?utf-8?B?azA2dExwanlVT3JieTNFS2pydWdiUS93bW9rWjJYQXVQMUlTUHYvWmZVRW8z?=
 =?utf-8?B?ckNCcUNJd2FFUm1jdEpHWTVzcmpTNmFjajdDaEIydUVvZUxBMUg5aEtDTTd0?=
 =?utf-8?B?M05OWWZtUFRJRVhjSWZRUmpka0tjZndyWUhpSG10cEpGWHRFNGh0d0tvR2My?=
 =?utf-8?B?RGZveWJVZkd5dXQ3MG5wanVTUWJId2p2dGV3aEdtOEttQlgrV2dzUGFFNnhG?=
 =?utf-8?B?b2ZBcXpYdjFDZWtoMVJndTVQNFpoazJqTUl3emJ2L1IwYm1jdDJ3ZTM1V0d0?=
 =?utf-8?B?YUFvNE1PNUhpWW80Z1JqOUVhdGVHTTBBc09leEI0RFZMWVA2Yi8rUDRUSUNl?=
 =?utf-8?B?SjR3b0QvQjBRbkYvUTBLODdmbjlTeE52VnRyZU5Ld0hpVlBVUFQ4c3d0TUJY?=
 =?utf-8?B?WUlQRHFXMmR5ajU2K3JURDVIUVMvZXJMNFRBTCtjQ1FXZEVlS1ZadUhsYUZN?=
 =?utf-8?B?dXpiaVNHbmhzeWpBZWdhNHJqUHlpWUZaOGVZSHA0TmpScHd0UGNYL3dtSmpo?=
 =?utf-8?Q?LKJDwQtjJR9Pq8ME=3D?=
X-Exchange-RoutingPolicyChecked: UIZWDxpG1mVa6n3k3gYCWXONPmU8rogpTGQeVpakyyZuhdS/MWBG6G5z0U+PqUQQRVzaqTabF6j3zkw7RS0Q6D1Sw9gwqWVVfMyywknPMyC7C7hSaG9MTu6qI7t32tuzHnmKvqBE8w6/PlUyzXu8LcPoaZgJpYG3+uFab0VQdWZlwefnfTKvjP+L40IeeKqB9cq1xGdIbsGJV2CkQZkmLbvt/2puyEE51vwEA9GKxkf4kuG0RsA4wwJwsTeE/oA7RCAOiuGTAefR1W/d+rPC7Syi3cI6mLMYdXA5cMoWy1JnskC7p7ch+PTX+dVwvd0qqZovJJkjm4J+lmam2wjL9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c15258-ce56-4ccc-1cbe-08df0a6de2d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:18:38.4611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KG9BK5S9u8yJUyIzbJj75eWFESMMN15L2lNEWyJLuPtAr+ZNvdDyOKWy4yTlbuXdcY6PYnzszUdhJTt4HRdqMhVnqulLoSiDe6VI4VRUklY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
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


On 04-09-2026 02:36 pm, Tauro, Riana wrote:
>
> On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>>
>> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>>
>>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>>
>>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>>> Hi Mallesh/Michal
>>>>>
>>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a 
>>>>>> bool.
>>>>>> and update callers to use xe_log_err() with the propagated error 
>>>>>> code.
>>>>> Bit confused here on the usage of SIGID. My assumption based on 
>>>>> documentation and discussion was
>>>>> that SIG ID is only needed for error logs based on severity and 
>>>>> requires a resolution which can be documented.
>>>>> Am i missing something?
>>>> from "How to pick a SIGID (the uniqueness rule)"
>>>>
>>>>   * A single underlying failure therefore legitimately produces a
>>>>   * *chain* of reports from different layers, each with its own 
>>>> SIGID -- e.g. a
>>>>   * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW 
>>>> by the firmware
>>>>   * path, the failed recovery as %XE_SIGID_GT_TDR by the reset 
>>>> path, and an
>>>>   * aborted bind as %XE_SIGID_PROBE by the probe path. That chain 
>>>> lets triage
>>>>   * follow a fault from origin to final effect; it is not a duplicate.
>>>>
>>>> so in this case, some sysctrl timeout may eventually lead to a 
>>>> reset and/or
>>>> wedge and/or runtime-survivability-mode, and this intermediate FW 
>>>> SIGID may
>>>> help in any postmortem triage, and if we don't reach that final 
>>>> state then
>>>> we can still provide some generic resolution based on site and 
>>>> errno (COLLECT)
>>>
>>> What if the paths are also used in non-critical scenarios for ex: 
>>> sysctrl commands are used for
>>> general counter telemetry, gpu health querying and firmware status.
>>> Wouldn't this be lead to a lot of sigids in dmesg in case of some 
>>> unrelated failure ..
>>> Why not only add sigid for critical paths when we are sure it will 
>>> cause a chain of failure
>>> instead of these prints on every trivial command failure.
>>
>> Ops I miss this.
>>
>> I agree that we should not add SIGID for every minor or noisy 
>> failure. The intent is not to log every non-critical cases,
>>
>> but to capture important intermediate failures that can help explain 
>> the real root cause. If we log only the final critical
>>
>> failure, we may miss the earlier cases that actually caused the 
>> issue. That makes triage and postmortem harder, since
>>
>> we lose visibility into how the failure occurred. The idea is to use 
>> SIGID only for meaningful failure in key execution paths.
>>
>> Even when these failure are not fatal, they can provide valuable 
>> context, make debugging easier and reduce
>>
>> mean-time-to triage (MTTT).
>
>
> Suppose a user uses invalid entries for gpu health or counter 
> management, won't we be polluting the dmesg
> logs with sig id and cper logs unnecessarily since these are not fatal.

No, we should not emit SIGID/CPER for bad user input  or invalid query 
parameters in gpu health/counter management path.

These are usage errors, not real device or firmware failures.


Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>
>>
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>
>>> Thanks
>>> Riana
>>>
>>>>
>>>>> How do these errors indicate the need for a resolution.
>>>>> Do we need it for all kmd logs with components or for errors that 
>>>>> need a recovery or can be recoverable?
>>>>>
>>>>> Thanks
>>>>> Riana
>>>>>
>>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 
>>>>>> ++++++++++++-------------
>>>>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>> @@ -11,6 +11,7 @@
>>>>>>      #include "regs/xe_sysctrl_regs.h"
>>>>>>    #include "xe_device.h"
>>>>>> +#include "xe_log.h"
>>>>>>    #include "xe_mmio.h"
>>>>>>    #include "xe_pm.h"
>>>>>>    #include "xe_printk.h"
>>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>>    #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>>        FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>>    -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>>>> bit_mask,
>>>>>> -                   unsigned int timeout_ms)
>>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>>>> bit_mask,
>>>>>> +                  unsigned int timeout_ms)
>>>>>>    {
>>>>>> -    int ret;
>>>>>> -
>>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, 
>>>>>> bit_mask, bit_mask,
>>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, 
>>>>>> bit_mask, bit_mask,
>>>>>>                     timeout_ms * 1000, NULL, false);
>>>>>> -
>>>>>> -    return ret == 0;
>>>>>>    }
>>>>>>      static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 
>>>>>> bit_mask,
>>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct 
>>>>>> xe_sysctrl *sc,
>>>>>>        struct xe_device *xe = sc_to_xe(sc);
>>>>>>        u32 ctrl_reg, total_frames, frame;
>>>>>>        size_t bytes_sent, frame_size;
>>>>>> +    int ret;
>>>>>>          total_frames = DIV_ROUND_UP(cmd_size, 
>>>>>> XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>>    -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>>>> timeout_ms)) {
>>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>>> -        return -EBUSY;
>>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>>>> timeout_ms);
>>>>>> +    if (ret) {
>>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>>> +        return ret;
>>>>>>        }
>>>>>>          sc->phase_bit ^= 1;
>>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct 
>>>>>> xe_sysctrl *sc,
>>>>>>              xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>>    -        if (!sysctrl_wait_bit_clear(sc, 
>>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment 
>>>>>> timeout\n", frame);
>>>>>> +        ret = sysctrl_wait_bit_clear(sc, 
>>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>> +        if (ret) {
>>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u 
>>>>>> acknowledgment timeout\n", frame);
>>>>>>                sc->phase_bit = 0;
>>>>>> -            return -ETIMEDOUT;
>>>>>> +            return ret;
>>>>>>            }
>>>>>>              bytes_sent += frame_size;
