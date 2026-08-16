Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41494C5DF6D
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 15:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D7F10E31C;
	Sun, 16 Aug 2026 15:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e20bOw0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680F310E31C
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Aug 2026 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786893276; x=1818429276;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sbLFfid2pheHxE2F+as1BtmNBaplvb1tBPmLOmEomqU=;
 b=e20bOw0jA92q6GppIa1SzZJ6MjBvZzSvwl5K7hNCCnYME0Imsb7TpEeA
 cIH37SooFcB4i2Zd6HkZOC1qZrS/qeHggO9bTmeauDa7+RZ7pl86KaFqG
 k8xIC06G6TbqzkH5v4ElD5cwdJkU/iYwhi4b5x6MfNCv+geYpgq3EymOW
 EJBAXYSuzGTt6eb6r88J9KzZrxMEOWVZwgWjHoOdmXwzzGgc/mZeUb3QM
 iQPaxLsZI6aAI8cJc0rBFrg1uKLXJUMgh0itvg4MVvUPJ1N9P/E/7gbvl
 MTzGHjr4wHGAFnJUuJFopwxj8e+7ENpmoCFM0/s9CQxW9ZeL+Pvp8gXfo w==;
X-CSE-ConnectionGUID: IDPu0cK7TQqZ934GW4EM2w==
X-CSE-MsgGUID: y5e/arclToqtTTOfDhDtxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87408089"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="87408089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 08:14:36 -0700
X-CSE-ConnectionGUID: mCs9Arc0RY2Mma3XW+CVtw==
X-CSE-MsgGUID: EDQO5YCCRbmHcWcdA9AJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="260470365"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 08:14:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 16 Aug 2026 08:14:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 16 Aug 2026 08:14:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 16 Aug 2026 08:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twkETAlo0KpXTHUfrqF/nnoAGCiGFsFAr/VDsYaJyhzalm3c8FFmMfeEd8WbopoNIBnE/e0S9+njWkCFOjazUNnX6GmqcHZdswSN2BYtS2jCz1IzbomK2SPp/QvDdY3GYplPsHf43ZdLSEisYBGRfMOUSAnJuKrQAk7XB3DzVWcYskgSEmc7zGWnIJI4vVH0uElN5JLCPomoEC6hyZUnPuddNzzKYCerEsjsPjS1nfZSak6c9UPFOIuUsjxhOsnrU65XEjKGSii585f5+05P2Jbz5/uJUhEBjNqWOICUkagmmWRsDkrxB5kGVnZp9i5rbP+i+i536yHUTEnSW8Za0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpZr+/5U8vj66Z5XP0jcrwwvS+8NzoA72p6aLfHEw1U=;
 b=FqnHmmiJMbPzGSSEJ5licSzn12OeWxFcbZCW/w3ZosPtoJRCDL+NthDtdVRGVjCsEiiKefv09oxv3wp3aQlaMT/imLxAqOVh1SPeKqWFs54SR/ggrAEkAAmsi92g27Wul1+seDlk5yravBYVFs3roYcFylykCM3r9D3jVYs5TDWNFSckat0xU3S37BWQGEd6ljz2u0AK2INTfB32lDl6Vl5ye87a8xZWY8DERFB6YLh3SMe/jF0w0xThjlw4V1H3bIriclLFXPGNWLQ29VfOScN3MwEaITwPElxJlMIOpaAKErEPqroFrwk3u9WGCXFUwwtbo9T92El0Yl0ESr1BPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB403477.namprd11.prod.outlook.com
 (2603:10b6:610:366::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 15:14:27 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 15:14:27 +0000
Message-ID: <bc7357ee-e7f2-442b-a367-b3be2be6559e@intel.com>
Date: Sun, 16 Aug 2026 20:44:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/pagemap: Add fault injection for higher-order
 RAM folio allocation
To: <intel-xe@lists.freedesktop.org>
References: <20260805231041.3791771-1-matthew.brost@intel.com>
 <20260805231041.3791771-7-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260805231041.3791771-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0238.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB403477:EE_
X-MS-Office365-Filtering-Correlation-Id: 285916f5-fac9-44bf-0d11-08defba91035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cbd+f0Xq6oDyOObb9zT61EFNsLp8QBFTQ1eFB8ZIxHPbasiQQGGAhMGJWUuyb9xkcUmDCU3EAgx2kYNs3ROaBv2YvE6ipsJrXNyxV4cyLG3P14THDBKRggNsXpnUCgOeTQoqUSfqPmD9XAB8Yh764Zo7eOe/MEmVNfLvXrKD1vUzjQiJl+prGdMtIBhd+X4xS0+3U0YyIIgY9LAIZ4Kmd+7c+jTN1cDe8uKsMngGD32iEH0wE5IBWUQ8nLKcCS42Qw36Jo0csDf+wTbGeu4DCQLoU0QA5UgZLJlBHGgYCI7MwWvYT7MyGWM7NLSUFA/WjWgCv8wqnqG8TfHplGm/jFyiRztYmVojHZ8SoYgSIJ9cHAHmcSJjbyjsIpFFqnCMbZfDAZMzy711w/8ytN0CCkLYtCXydSH7GbfW0TP8WzXrPi0PhhlN5w7uph/kK/JM+/krkh8yGaPYdxRKbvN+j/ytTenxsn1dVHHxDdMjBpwNMV4bTtfc8LNAHiyW86wM2Go0lAbH62L91nS2wKuwDz7BhJ20cFUkWcSWDGRSvQwxV/lhJGws4rQAE9H3kb0lvjXUBTtze9p/DemdAndx7yEcsuL9celRw/aOYX5HR8gnB2G5Wqlo4N0t8vcoD6yQjsbkMVnKYPqCz7z4M8nIWDV2MWcZr4oQPFpPEI4yWCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZFSEZuY28vUGhBMFk5NWZXQm84U0wraTd2NWpBbUMyay9IUGJwcEY3ckRH?=
 =?utf-8?B?OEtqUHdpOU1NNjJjczRya3dxZFZXWW1yUW43ejlvVDY5TWFkdWNvNGpXVGRt?=
 =?utf-8?B?bklkMmgzMGZyNzdFM2pESVZRWHUvT3dnQTl0V3JPaFN1MENJNlptVktldUhH?=
 =?utf-8?B?MkFPSDF6Qkl0TDR3QzU5dzQ0cHRjMGo4dTVaVUNtaGVOMW1hc2FrZG1OcFJq?=
 =?utf-8?B?MWowclhqQWI5SkoyMmdUUlE2MmpRZm1XdzNQQXZLV1QwS0V5QUQ1RzBlaG9s?=
 =?utf-8?B?T05nZWFFSjJwcWtFaTdqajhtcFIzbGw1UlNad2FBRFJsNnpyQjNIVnFTVlpH?=
 =?utf-8?B?YUtJSENjdWgvVnJ6cThjb0JETmwyc3V2SGJPYjRUL3o0UnI5QUQ2d3F3czd4?=
 =?utf-8?B?NjQwc3lqMUwrcDRyKzRJcmlOWmpjN1VCZ21lRHRnZTN6VzA2ZXVMWFhxUjJn?=
 =?utf-8?B?dHBmbThMNjB4MXZvRGQvb3RhTUFTYjhhekZzZEZob3RxUmhzWm5wSlFvTE1Q?=
 =?utf-8?B?VUVmU1VUVFpwMTQ5MndyNjhlcTNGKzdWdWtIVzdyL2N3dlRKMVlPYmM1ZUF2?=
 =?utf-8?B?c2xVdWdOcUhHbXZHNkkwcTBYQUs4Ukxsd0dOSmllK1pId3oxMXVVMnlYaFlP?=
 =?utf-8?B?VGZoa3ZQRUJOV3E2M1BOZ2IwL0hLK3dSVWRtOEx5a2ZCcFRLNGdDTDFTVTZm?=
 =?utf-8?B?Rjh4ZnhUTTlUSzlzU3BUR0lDSTVaclN6N2habVZDeEhlQnpoY0IxRjlqa3lW?=
 =?utf-8?B?Q0R6T3d0UTdLSSt5UHcralpzSXNOVmdYbnJQMDZnbjVNYjlPMm9yUmFRVlUv?=
 =?utf-8?B?azlJalJ3TU5pNDRRMVV4ai9pTXZ1eTl0K3BhRUIwMnArak91UzlLZldkUXkr?=
 =?utf-8?B?RmZDSzFGUkZTN2JxU2hMZ1dzT3I3bjg3czJnOE5YRUIvdTExWlhCemhOamZ5?=
 =?utf-8?B?WW9OdlNPYnlhY09GQkxUWXdIMzdOM0JoMGFIbmkwTEpWY1Z0Vm51eCt1cFhw?=
 =?utf-8?B?ZXlGbHVqYlExWUxtRU54MjJ0NlNXaFlyTVhhOGdkT0t1RWZhcUE5aEVzWGFr?=
 =?utf-8?B?UlF3VGVrczJCbEh2OE5TWjlJMGE0UFhUU0h2TjBKUzlwVFRud2pGa3hIeDhO?=
 =?utf-8?B?ZmNrZ1VtdDVrNEtadklWTnorVXBsNVYvLzNNWTRmc05zZXZBNEFobTFOdUg1?=
 =?utf-8?B?MGJCTktWQ0VsUk9yc2lBL0drWmdhdkxOaS91V1Q3RWxES1U5STFuTU8vSjlN?=
 =?utf-8?B?cDQxak03dm9lV2s5dlVMRE55L1JrTlc3WlFyTk1ZVTZmYnoyZFJ0S1YzMnAr?=
 =?utf-8?B?Vm8vVU9vWVV4RWNrVEpPS3U1SnF0NGhXYm10WWc4S3JuaGRJZEVxVUZneUdu?=
 =?utf-8?B?S0xrWWswbFB2bm5hQjRjZGhhOHo3VGd0b1RReUR4Z2NxWTJVdm1oZjNIbnhj?=
 =?utf-8?B?TitPY3pZSDVXRnpoVUxIaUxOdGZxajEzVzZlSW5PSFh5MzkvOE05QUliQzBs?=
 =?utf-8?B?NDN2c045VFEvRjBvRHdoYlErQTJZaDdSTUtQV0Z6akpuaFpHL1pjNzU1RWxr?=
 =?utf-8?B?amFRM0hXb25qd2RPQm9nNXhvcVpGSzJoQ21ZSnZwN2tCTTNhVGpVaExBdGd4?=
 =?utf-8?B?ODduMUtYSldPNkwrbjZPWXVESFNiWFV5emQvSGZhNmpLdUUyek5KRGhTVUc5?=
 =?utf-8?B?bGlDRXM4eDdiSms1WmZIaTBxS0pMY2J2RmU1c1RiUnJmcm5Ob2RvWTJqWm5O?=
 =?utf-8?B?aVk5YlNOT0FIK3A0am5IU25QVDRyK2FlT1FtaUlBcFRlZUI5Ykc3N0Q2aElj?=
 =?utf-8?B?NUhjdjdOajNrVmR0dTBDS0J4ZGtHazlQSUErUUs5amVNZXc3K2tWL3pPamtO?=
 =?utf-8?B?VjlVLzhvdDl6dmJtNXNqVnVrM0RXYWVkalVrOUpLVEwvaHVqcExCYjVHOS9I?=
 =?utf-8?B?b2NOcy81d2VKVi93YllKYWkwMC84MnpsVkFlOFozN3pyRFlHMEVGK3RzL3NG?=
 =?utf-8?B?b1NzZ1FMdUFhVWdrMWR3elpWdWxoZFRXMEQ2UE5iS2J6TU0zaHEvWWVMbzgr?=
 =?utf-8?B?ZUNrZ1JEako0WlFKcWs2ZTVKVm85c1BIMEliRVBRRHRJZmJuQnVsdVRMVldw?=
 =?utf-8?B?WHBrQTRDOE5sSndVTjdYR09aU3FSQlhmNlpFRHhiSXg1dWlFc3hyVVdXRkRj?=
 =?utf-8?B?b1dIbHh5K3FPZ1M1Qy8vR0ZQY0kwSURFV0pFN0pyRmw3eFpIUlRqbyszK08w?=
 =?utf-8?B?clVFSnM5TTRqQk1ReXVacUhZMm5MaVBJZUk3SjhVUkFlMUJzcHpSWFo3UlQ5?=
 =?utf-8?B?N2s5WXZ5MnBDbXV1NFVGSkpvWTE3dVhLR2YrSUNqblZLVWVJTW9hMFlqSHZF?=
 =?utf-8?Q?ozFnnqymnYSmn5v4=3D?=
X-Exchange-RoutingPolicyChecked: h8RIVuTu7/IPdkyJNyqG0EKUQu7WaAYsQANjTGocOyhpOwEMx01YtLvZThGrypgPRBsQCSJPrK8aAt2Eic3MSrZLs9HjDGtVzAXUbtYriJ1Y/yfBLAzNRBc8bx85uKoPGMo4mBr1IFeg1X1KXYZgIcNWAM/J0MYXhJsTZfosqAmD7JsaL55j9tDASPy/G40Qj+rS5IrGvGHBvyLmbs971MU0FHRlk6MgSo58pP66tOGL0/MAZx/MK6+1rydpz/0ua5vrSyoErARYlYldn5LfT+cXVAVnjup4MEloo9DfNFdtkDtLdsGcXpWQRgr8MueoW40hSb77L4Y79j6C+TSmmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 285916f5-fac9-44bf-0d11-08defba91035
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 15:14:27.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFn55u64KJMCy9wyj+d7olaibBND9FdZN7SHwz7K/fMsHxWe4y//040z41cDV+ctZg9eH1r30GAE5C1qNBYbl5jLVC1sIywIKMj0zykpPsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB403477
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



On 06-08-2026 04:40, Matthew Brost wrote:
> Migrating a device-private THP back to system memory has two distinct
> paths in __migrate_device_pages(): the fast path where both source and
> destination carry MIGRATE_PFN_COMPOUND, and the fallback path where the
> destination could only be satisfied with order-0 folios and the source
> THP therefore has to be split via migrate_vma_split_unmapped_folio().
> 
> The fallback path only triggers under genuine memory pressure, which
> makes it both rare and awkward to reproduce, yet it is the path where
> the interesting refcounting happens (the CPU fault holds an extra
> reference on the device folio taken by do_huge_pmd_device_private()).
> 
> Add a fault_attr, modelled on backup_fault_inject in ttm_pool.c, that
> forces the higher-order allocation in
> drm_pagemap_migrate_populate_ram_pfn() to fail so the existing order-0
> fallback is taken deterministically.
> 
> The attribute is exposed at /sys/kernel/debug/drm_pagemap_fault_inject
> and requires CONFIG_FAULT_INJECTION_DEBUG_FS. With
> CONFIG_FAULT_INJECTION disabled the helper compiles out to a constant
> false and the injection has no cost.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Nico Pache <nico.pache@linux.dev>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Usama Arif <usama.arif@linux.dev>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 51c6f12e4256..6ae8c9aa36cc 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2024-2025 Intel Corporation
>    */
>   
> +#include <linux/debugfs.h>
>   #include <linux/dma-fence.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/migrate.h>
> @@ -12,6 +13,27 @@
>   #include <drm/drm_pagemap_util.h>
>   #include <drm/drm_print.h>
>   
> +#ifdef CONFIG_FAULT_INJECTION
> +#include <linux/fault-inject.h>
> +static DECLARE_FAULT_ATTR(migrate_to_ram_fault_inject);
> +
> +/*
> + * Force a higher-order destination folio allocation to fail in
> + * drm_pagemap_migrate_populate_ram_pfn(), exercising the order-0 fallback
> + * (and, in turn, the THP split path in __migrate_device_pages()) without
> + * having to drive the system into actual memory pressure.
> + */
> +static bool drm_pagemap_fault_inject_folio(void)
> +{
> +	return should_fail(&migrate_to_ram_fault_inject, 1);
> +}
> +#else
> +static bool drm_pagemap_fault_inject_folio(void)
> +{
> +	return false;
> +}
> +#endif
> +
>   /**
>    * DOC: Overview
>    *
> @@ -960,7 +982,9 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>   		if (order)
>   			gfp |= __GFP_NOWARN;
>   
> -		if (vas)
> +		if (order && drm_pagemap_fault_inject_folio())
> +			folio = NULL;
> +		else if (vas)
>   			folio = vma_alloc_folio(gfp, order, vas, addr);
>   		else
>   			folio = folio_alloc(gfp, order);
> @@ -1554,6 +1578,16 @@ void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim
>   		kfree(dpagemap);
>   }
>   
> +static int __init drm_pagemap_module_init(void)
> +{
> +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_FAULT_INJECTION)
> +	fault_create_debugfs_attr("drm_pagemap_fault_inject", NULL,
> +				  &migrate_to_ram_fault_inject);
> +#endif
> +	return 0;
> +}
> +module_init(drm_pagemap_module_init);
> +
>   static void drm_pagemap_exit(void)
>   {

Missed fault injection debugfs removal ?

Sashiko flags it and looks valid concern.
>   	flush_work(&drm_pagemap_work);

