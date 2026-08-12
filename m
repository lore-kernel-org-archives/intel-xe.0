Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C99C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF4610E3BC;
	Wed, 12 Aug 2026 12:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVQnUrOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55DA10E3BC
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786536902; x=1818072902;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n/dZn6b/y0V9LTJf6ZNCijs04MCRvvVZwkHaKTqPCvg=;
 b=nVQnUrOfTlN9XcsHGf3sLI9ULdT6oFI42gUYQSIGAhmZbKVjoJrABSq8
 hjFDdNRwEx1EJWmr8SoucfORcBV7QLlX59RoUdfGxs0Ta6cQ18bUoecKY
 Gxz1JuwWpjplUnxPi6zq++1YMQnrtN886pxlmVmV11+ucJmCe7fSU90kQ
 MHte16Vst7H1ACk7B+rLipRNdPhPfN00lNqZTNQ+c+C4MVs+PxiVNccZY
 eRrASjUBsPvc47Urwm6VbSxSkwuVZe0JwQNnSYBkLa6i4FzddVZF0OouA
 WNil2sDgd6JiZFcCxhfAWaSolLtsDmXEo6llZRJ1E5kLnfaNFri5XStuF w==;
X-CSE-ConnectionGUID: IKh85DkFSj+P5dyd6qZpsA==
X-CSE-MsgGUID: UBwIyCkoQ92AbB4jw/W6pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104469681"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104469681"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:15:02 -0700
X-CSE-ConnectionGUID: /rBRPvUARE6UJhDjw82H6w==
X-CSE-MsgGUID: RVexpGYVRW+YC4LD+fgZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="265626216"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:15:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:15:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:15:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTbuwq0Yk6I73+omjCmgKvjObq4iJRghuu6f6I41KyjQnqBri/gkR3rdmt0n4QaUE93FMPcUx09/vKQ9npPxbZ5g7npkT8Mi4DsFolx+qyBHcllyGK09qa7Y3mgkjdVizgNITMhiX44vMQ0xB0n+uqGtPX9Ofw6nR65l3DJsR01GnhTLPLFeJsi5f/ZjmnfN62tHK1ClaVfYK7uVCTyYv/HTpDTHSx8LviUDYoAYTA9+DBYCqbyF6XpwVGz+arjAmCY0LI4iH+G1ozEpTapHpgMD1feLy01ea6It/d69LgkPBKHHfQ2d41Nwyiin5Pw9aTHSIOmgsyLuVbAd6fgbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bE1KYm5kOHYaaqBBznG1BGL/PRh9gnQ+suj1kQMPLY=;
 b=kMHrwif5mvkzmqKqkDc46rnWOCaSOruGrloGlDpBz8u5Mgv+QxvuTykBsgVhn2mr67QH5SHZbVZw2TIuADmrh5TcJlvfeCZHlU0+nEIjVXe4aYvNuXoG9LQ8OsAudiRAREcG/UwtFjkka7/st6nQapn3jh9GikQljXTGiVQXpJ4pVpak83SggBSQkgXkSRglF1wkQlxD1UXzYsqVc4UYBQmJtRM0G3UAH4CssmEZMW9vQ09547tkOLsrGzC4nVZrE4afdt8OYaBYqkAJloV4k7V0m7IKhg6X0FcbNDHC+rrdIHQrAvFLKK9cxhWb7/d9RacOP2IRu91s4pjy87Fu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB7872.namprd11.prod.outlook.com
 (2603:10b6:208:3fe::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:14:56 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 12:14:56 +0000
Message-ID: <e768c091-fa7a-4ce5-b8d1-4f9d45ac2916@intel.com>
Date: Wed, 12 Aug 2026 17:44:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 11/14] drm/xe/vram: Use RCU for lock-free sysfs reads
 of bad page lists
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-27-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-27-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 344ada3f-2f6d-45eb-88a4-08def86b5237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: 8/SJplWKNRA4SKPyf8ibtREqeRLR/shnyU81jngYSEyYEQE0wgTycrKck50TR7DxwRg7DrMK4B6OUiwKduPpOh3xEiJ6Z7hiMvC8y0qvOeCnjE2OLJRiVrR0Nxl5vtCnn9ZcQwIvLNCyBU2e0l7CK1eW3+M3pJIQSXaJkx7e/2NEeyG0xDfMidY2melFbK6CSIeM8dnFAO4+jLudes7iv+NRSJDR+Qaz4zXzEc/izFIg8if1DxycbnUSjVD2PzKh2V9yIqguR7asthjXjh4NHH2iJJc4phCgrmoqF7x7IO9CCgQIOVP3i7j35g5Ryr9IvI+lcjS0+dp+o6Rhig/fs0Ss2hsccYzL466q2dj0vioRyjiRzBWnt6MlQCIxboFAM5qojtt/wxEcjTfGzVvdICpY4f3xCo/mN8yqhnGhqBssPUM1hFayo3E3kYHnscNVEyauVLUuS6UcDwP1QGoGZc8ShljW7fUIoZnTYR3vy6DxqCSm9iJlFB9J8Z+4yly1qr43ypae7/NOpS+VYqh81VfSfDXP1FBbZCsxbHeYSMIwMOMz/FoPMIeBcZdbHhhoieEb3l5l/iRVBizAwIFjfvzQ4gpWeuMGI4EzsFe5hT5xWmZ6x5A2q7hVJV+U3f7tRa43MzLj10yx1GWaYSAOxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVXbXpMU2w1TlVJaC8vbmx2K2duQzJTU0ZrSXluWURodkYrNXF5U1pTbG5j?=
 =?utf-8?B?aE40a1VkenJjUmdxQm95MWhxY2p2cWJhbnlSUDhzSmJjbWJwNnBuSXlHK0hs?=
 =?utf-8?B?RFE1U0ZkSkU4cEwzYTgza1VPL1pMb1M1c0E3N2pqajN1SDlwSDUvWGdVa2hu?=
 =?utf-8?B?ZG9nczNPZUVRWnpCVzhkaW12ZVNqclpFSk4xekgyRFNENWw1MHg2MXhOcUFF?=
 =?utf-8?B?RlVrTjJHTS94ZlpLTHZIaUNwNmMxcEdTQ1F1dDVGb1psTVBPME1aOFVpdFBq?=
 =?utf-8?B?Q25NNDllcVZ2YW5wQXpXZi8xWSs1WWtTYldURlpyeUpINFpGUTFxMVBEZm5W?=
 =?utf-8?B?c1FTeUlJem1xYm53bVZkKzdFUW5VRS9NWjYvL3BUc2txMWVVdmg1d0pvRHZP?=
 =?utf-8?B?cVo3R0RkdDRtSkFrdGkzVkt6Yy8zN0d5K0YvLzBqOFNvWDM2bUtZSjN6UUtZ?=
 =?utf-8?B?Vlg5ZldyWU5vM2d2cmNyVnNHSXZNNTYwN3RhQ0xiYUNRNUEybVJ4Smd4ZzRk?=
 =?utf-8?B?Um1DWEJ3RUwweTlYaDJWeXVvdmJCWjhNajdYa2M4TnRlcFFXTUNMNElOVkU0?=
 =?utf-8?B?SVdxTmYrL2pKVmZGdzQ4NlptcSs2OEZOd3Vob3gvK2ZVM3FJejZvMHplamdu?=
 =?utf-8?B?OFV2b3dEdW5FYkNWcGR4am5RK05vY0gzb0hVQ3RVTWJEVlU3V01TZW8yNUVB?=
 =?utf-8?B?VDN6Rm9iWHBsUDRIeCtSMlVTUHI3U1ZxM0lLMHJMTXNRNSs4WFdlaU9wRVBT?=
 =?utf-8?B?bmFzUGdDODBmQUxLRXN6eUhZd096M001Mmc3d3NmUVlwYkQvY3BDcGdURktB?=
 =?utf-8?B?TjZKaWt0ZHQrYXNhbUdtc01ka0xuSFRxaTJrVnREaGdNU1Q1RHZnd0Z6bkx6?=
 =?utf-8?B?L1ZMeXRJQ3pjM3MvQVNob2lrNGN4dDVvS3l1UVJYN0lhclpWQVpxZzJQWlRB?=
 =?utf-8?B?K2pGTHhoNlcxWEloUytrRWEzM2NDZGN4SHd4M2hKeFdCazk1MlpFNGhoTGE1?=
 =?utf-8?B?djJ3R0lDSThFYVB0QjNndTRaTWtwUGp2N3BYcGM5ek5zUU5LTTZpbUs5K21a?=
 =?utf-8?B?ejJRcUVGbEdISzVtT2tCbnZLeFNieTJ5NFc3d0NRdmtDWEMzeXpZRUFJREhk?=
 =?utf-8?B?RFE0ckczSlR0ZWZ3Y3VJRFZIUHg3NmZDS09YUDJxNEVIUVlPdEFPQnhKdFhM?=
 =?utf-8?B?RnZDemJXRUJvYlVHYmdYV1N5S0l6aEhXclg2dWVZRFFWNWhlbFhrdUZ2TmlT?=
 =?utf-8?B?WVF3NjF4ZldNZDhhekI0RWIxdHdUczZudTBObFdWY1BkZExtWmwwS1IvWk5j?=
 =?utf-8?B?OHkrcUoxN2FFNGcxZjV3akd6Z1VpL3dTdmFlRTBtVkJFd2Q4YTBYWnh6MURQ?=
 =?utf-8?B?Z08ySkNiYUk2QTIxRkxrUXpxSXpQZ2t6QTlRR0lrR1VHRHpjN1pvRWZLb2Yr?=
 =?utf-8?B?MGhraVNHZVpuSk9TQnVHTllJOFF5RHBWQTc0MWNteERteCttSFZUMEI5U2Rh?=
 =?utf-8?B?WGx2alUyNCtneVVnU3piYVJDK0krck1LMXRSL1FuaDZ2alRMRTMvZFFRd1E0?=
 =?utf-8?B?a242VjFVamtjbnkvWEJ4a3RyQUQzSzlVaXJTVWtqbmZlZnMyN2JMOEVnejJQ?=
 =?utf-8?B?SVJ1OFR3TjhQSTJWT3dENys4YlNYb0xKYmFjYW14WlQ3SlFrZEY1U1JOWTVr?=
 =?utf-8?B?Zm02L1FET1Z4anJuRjdQUGplMDBES2xtdGlNYTBsVmRiVy9NNno2R3BJVlg4?=
 =?utf-8?B?NEt6RGRpak1qWmx3b2haU3hIZFZZSlUyeUV1c2k1SWVtWVpxL0lUaFB6Mmpp?=
 =?utf-8?B?SDBhcWQrSlRZTTRuSWFZN2cyZDFJcXVMbGFNMTlMc0o3QmlJNlBlNlJTZ0Mw?=
 =?utf-8?B?Z0dVbmpadzdmN3JLTlUyZ0p4M2tRQzVwbzVNMXB0V3pVZTMzcm1VQTRTZ1A0?=
 =?utf-8?B?R2N3SjBaSWFjanNxK1h4Um5IbjFybittNVlrSnpOcldnQkhXbG9SSGhiVlNY?=
 =?utf-8?B?Y29MeXErbXpOWGNFUzZhdCtzY2lyWm02Q0ZWNm5rSktYOWJIVmFkdkZnYWhX?=
 =?utf-8?B?c0xuYUlGY3V1eEdQYVJ1Tm9mSUN4bEZ1U3pHNlNQdTl0N2NCOHRmZlAxN05D?=
 =?utf-8?B?MHRGQWlnL1Qza3VYcHdZaE95M2ZDN0FNMVFrR1lhSjA3b09QTXgvVTZ5SlBz?=
 =?utf-8?B?dk1NeVJ2c3F6cFprc1hQZFZlMUVDVkpsNXNMMTNKZ2x2NFE5WWh6L1RON1FS?=
 =?utf-8?B?dUV4amtsbEt0bTVsOHg2TkJKcDdSWm1MSytzdCtiTzFGbXkrVTVuVm1pcGFx?=
 =?utf-8?B?NDEyR2s1dS9HOTNUMHpqcFBPY05ONE1kLzB4cHZFUkY2TXpOVjNydmQ0Z3hv?=
 =?utf-8?Q?w5jXmFkCq8Uk/vyQ=3D?=
X-Exchange-RoutingPolicyChecked: ec22DuAIJIIKGg4lab50DbvVffZRRj+oYX7N3EQ8BRI53xBp8asICPsP4oeXaG6gukdRqE35BlHE/6tkCHvp1JAnhRgojtdtWXTIeCKVO9bJFvHmPW/O+Znjz/g8Dr9hLp3sweo4ZzEq6jdGFB9vz52OaaqLGx9OIQVnTkH5lvMw+VAoNcfEw7r/Y3XApzsj33SDdabaeaPBDSQBKDXsLaLSxBaTHly4+r6QL6QGOAoDW9Hp6XsHdIx5hn2ibXzesP8qTT5aCNyKuSYMbHRLn/5pzg0me2AaH4FQm2Z/a6YWqDI0ASEoNyTkAVbvMaBNJKHYbcwQfCDs7ximJ31ezQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 344ada3f-2f6d-45eb-88a4-08def86b5237
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:14:56.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wLHCYXPHQj7gRMPAxfWBI0kHfXrfPp7Poy8Ld5JVGf4zXLO0/5E9aGZ0IkKP6cVaBYd+Ja+m/xwQLM6Khr6yNlJiMDB6o2st6hMJCEdHdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> The sysfs vram_bad_pages reader previously held mgr->lock while
> formatting the entire output, blocking normal VRAM alloc/free
> operations for the duration of the read.
> 
> Switch to RCU-protected list traversal for the sysfs read path:
> 
> Writer side (page offline, under mgr->lock):
>    - list_add()  -> list_add_rcu()
>    - list_del()  -> list_del_rcu()
>    - kfree()     -> kfree_rcu()
> 
> Reader side (sysfs serialize_bad_pages):
>    - Drop mgr->lock entirely
>    - Use rcu_read_lock() + list_for_each_entry_rcu()
>    - Use READ_ONCE() for entry counters
> 
> The writer-side xe_ttm_vram_page_already_processed() keeps
> lockdep_assert_held(&mgr->lock) since it requires serialization
> against concurrent page offline operations.

The patch is doing much more than its meant to do.

Better handle >    - list_add()  -> list_add_rcu()
 >    - list_del()  -> list_del_rcu()
 >    - kfree()     -> kfree_rcu()

in original patch [8]

Sysfs handling should move to next patch.

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 161 +++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   4 +
>   2 files changed, 155 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 6280886e2ebb..c22669955147 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -312,15 +312,15 @@ static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vra
>   
>   	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
>   		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> -		list_del(&pos->offlined_link);
> +		list_del_rcu(&pos->offlined_link);
>   		--mgr->n_offlined_pages;
> -		kfree(pos);
> +		kfree_rcu(pos, rcu);
>   	}
>   	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
>   		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
> -		list_del(&pos->queued_link);
> +		list_del_rcu(&pos->queued_link);
>   		--mgr->n_queued_pages;
> -		kfree(pos);
> +		kfree_rcu(pos, rcu);
>   	}
>   }
>   
> @@ -657,7 +657,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   				break;
>   			}
>   			++vram_mgr->n_queued_pages;
> -			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
>   		}
>   	}
>   
> @@ -702,11 +702,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
>   				if (pos->addr == nentry->addr) {
>   					--vram_mgr->n_queued_pages;
> -					list_del(&pos->queued_link);
> +					list_del_rcu(&pos->queued_link);
>   					break;
>   				}
>   			}
> -			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
>   			/* RAS will send command to FW for offlining page based on ret value */
>   			++vram_mgr->n_offlined_pages;
>   			return ret;
> @@ -716,7 +716,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   
>   		scoped_guard(mutex, &vram_mgr->lock) {
>   			++vram_mgr->n_queued_pages;
> -			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
>   			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
>   						      size, size, &nentry->blocks,
>   						      GPU_BUDDY_RANGE_ALLOCATION,
> @@ -732,12 +732,12 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
>   				if (pos->addr == nentry->addr) {
>   					--vram_mgr->n_queued_pages;
> -					list_del(&pos->queued_link);
> +					list_del_rcu(&pos->queued_link);
>   					break;
>   				}
>   			}
>   			++vram_mgr->n_offlined_pages;
> -			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
>   			/* RAS will send command to FW for offlining page based on ret value */
>   		}
>   	}
> @@ -825,3 +825,144 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
>   }
>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char *buf, size_t max_len)
> +{
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct gpu_buddy_block *block;
> +	size_t s = 0;
> +	int printed;
> +	int count = 0;
> +
> +	rcu_read_lock();
> +
> +	printed = scnprintf(buf + s, max_len - s, "max_pages: %d\n", mgr->max_pages);
> +	s += printed;
> +
> +	list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +		if (count >= 10000 || s >= max_len)
> +			break;
> +
> +		block = list_first_entry_or_null(&pos->blocks, struct gpu_buddy_block, link);
> +		if (!block)
> +			continue;
> +
> +		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %c\n",
> +				    gpu_buddy_block_offset(block) >> PAGE_SHIFT,
> +				    gpu_buddy_block_size(&mgr->mm, block), 'R');
> +		s += printed;
> +		count++;
> +	}
> +	list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +		u64 pfn, blk_size;
> +
> +		if (count >= 10000 || s >= max_len)
> +			break;
> +
> +		block = list_first_entry_or_null(&pos->blocks, struct gpu_buddy_block, link);
> +		if (block) {
> +			pfn = gpu_buddy_block_offset(block) >> PAGE_SHIFT;
> +			blk_size = gpu_buddy_block_size(&mgr->mm, block);
> +		} else {
> +			pfn = pos->addr >> PAGE_SHIFT;
> +			blk_size = PAGE_SIZE;
> +		}
> +
> +		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %c\n",
> +				    pfn, blk_size, pos->status ? 'F' : 'P');
> +		s += printed;
> +		count++;
> +	}
> +
> +	rcu_read_unlock();
> +	return s;
> +}
> +
> +static ssize_t vram_bad_pages_bin_read(struct file *filp, struct kobject *kobj,
> +				       const struct bin_attribute *attr, char *buf,
> +				       loff_t off, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct ttm_resource_manager *man;
> +	struct xe_ttm_vram_mgr *mgr;
> +	size_t allocation_size;
> +	struct xe_device *xe;
> +	size_t full_data_len;
> +	int active_entries;
> +	char *temp_buf;
> +
> +	xe = pdev_to_xe_device(pdev);
> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (!man)
> +		return -ENODEV;
> +	mgr = to_xe_ttm_vram_mgr(man);
> +
> +	active_entries = READ_ONCE(mgr->n_offlined_pages) + READ_ONCE(mgr->n_queued_pages);
> +
> +	if (active_entries > 10000)
> +		active_entries = 10000;
> +
> +	allocation_size = 64 + (active_entries * 48);
> +
> +	temp_buf = kvmalloc(allocation_size, GFP_KERNEL);
> +	if (!temp_buf)
> +		return -ENOMEM;
> +
> +	/* serialize_bad_pages uses rcu_read_lock internally */
> +	full_data_len = serialize_bad_pages(mgr, temp_buf, allocation_size);
> +
> +	if (off >= full_data_len) {
> +		kvfree(temp_buf);
> +		return 0;
> +	}
> +
> +	if (off + count > full_data_len)
> +		count = full_data_len - off;
> +
> +	memcpy(buf, temp_buf + off, count);
> +
> +	kvfree(temp_buf);
> +	return count;
> +}
> +
> +static const struct bin_attribute bin_attr_vram_bad_pages = {
> +	.attr = { .name = "vram_bad_pages", .mode = 0444 },
> +	.read = vram_bad_pages_bin_read,
> +	.size = 0,
> +};
> +
> +static void xe_ttm_vram_sysfs_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	sysfs_remove_bin_file(&pdev->dev.kobj, &bin_attr_vram_bad_pages);
> +}
> +
> +/**
> + * xe_ttm_vram_sysfs_init - Initialize vram bad pages sysfs binary file
> + * @xe: Xe Device object
> + *
> + * Creates a binary sysfs file under the PCI device for reading
> + * offlined and queued VRAM pages. Supports large entry counts
> + * via offset/count pagination.
> + *
> + * Returns: 0 on success, negative error code on error.
> + */
> +int xe_ttm_vram_sysfs_init(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int err;
> +
> +	err = sysfs_create_bin_file(&pdev->dev.kobj, &bin_attr_vram_bad_pages);
> +	if (err) {
> +		dev_err(&pdev->dev,
> +			"Failed to create vram_bad_pages sysfs: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	return devm_add_action_or_reset(&pdev->dev, xe_ttm_vram_sysfs_fini, xe);
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index bdfdf6ec1218..003d3a7cb1dd 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>   	struct mutex lock;
>   	/** @mem_type: The TTM memory type */
>   	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> +	u16 max_pages;
>   };
>   
>   /**
> @@ -69,6 +71,8 @@ struct xe_ttm_vram_offline_resource {
>   	u64 addr;
>   	/** @status: Reservation status (0=pending, 1=fail) */
>   	bool status;
> +	/** @rcu: RCU head for deferred freeing */
> +	struct rcu_head rcu;
>   };
>   
>   #endif

