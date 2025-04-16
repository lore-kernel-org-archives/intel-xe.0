Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F212C369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 19:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35610E068;
	Wed, 16 Apr 2025 19:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7pNepNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EBB10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744831846; x=1776367846;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LnIbBSK9xmLks3O03S8bj6zilGX4fOIVIiIs7j5tYxc=;
 b=Q7pNepNo3i8KQ7lUNBRUTkGaWOEuQBOUv57X859QwWBlVt8DVM2dNiP9
 FDvfyLJVsMC8HTybYvZ3SW6STmsWJ1FMf/JtMPDG7AN21WBtyQevEDZUj
 Dn0GK+/FWuw52DuQdYlFhYIMktnZ4CadQbtM00hfShnTmgZvRjGIuyYZJ
 m7hdlkx7RrHckJgl6nSykdkO449kISslrSfKXbA0wLPDBMEV8DPS+mH8K
 4YiVtmnIMiVCRgbRs9FCjgrnvSNFgvUYHVSU2SNbE0/94MCLgDfZM5uHb
 l2+Q1LBxDi1VuURiI+aMDmZrM/TyAAGRtz1B87XJ2iO5SBAiffxvbGzg1 g==;
X-CSE-ConnectionGUID: VRVo87hQTGybS5sU+qXbEA==
X-CSE-MsgGUID: YGvpTsphRliKAqsoX5H6ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50046904"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="50046904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:30:43 -0700
X-CSE-ConnectionGUID: jnNru4JaQXS+RLawgk3Ypg==
X-CSE-MsgGUID: cANreqp3SvWej+FTyGR9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135392970"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:30:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:30:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:30:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTD9Xdq/uS3tsgK68RqN8lz2/XQTi/2r+0LOL7Tqn5+Wj1K+f6UQuZ0p7fuOXRIr1UAlH2DJxfoxzRBQpEQD4cIpwY7+ugeuf99FBThBfm9e+LuA0sdwVvV5DMAhsFvQMIh/RMpcBGt3x9P9ErJ9PCvFJko+mek90+6Fq6XIJcMK9ucStWsrGGBmF+FCjghaiyYSJULVqcfoY3PS0Y0zH24kPuic67KTv339vXFaLB1jFm+twQZIPRE4e1Or7Gvsg6DA6lyPKFKSgidEZ65+LP5sUGpbUXIXfydqVJyrFwlESJ7DrYFnqxh51AsbDlakcdSXKO2WNSxbx3tXcCWZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EohcIEk2rvi+evhQ96ByPupzcWICNblMKMhPA1SzUFg=;
 b=dMgGzUSXgvEnV0rom4fB5G0edwz+fOXhvnKLBXRvRZ7fz/MtFesuoqUYF+r6pegKWb31t2sdBwvHPZus0pTy3kspJF9ubVVAn/lBeFc/0jWDGS4MQzK7yHYbRMy26JuDm9WESn3cfCEiXDTY4wR2kTJ4W9IcM8/mX3SetgtvnneT7a9UZ3GGYkD51B3P0CyPfB1r8rA6lJue/b473cFKDwTUOUE2cmme5GIQB8dYWG8M3hrYVhuwHeKeQY7G5pGonW1d0IvryBDzUgedZOviXmvMJ8NGNexJuI3CMIwR0g1lciFpOGmv5roaV7oXzyclSdwhLARdv8Ym0kFK7b+5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 19:30:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 19:30:30 +0000
Message-ID: <b0634792-f2e3-4402-8b48-58b83f773426@intel.com>
Date: Wed, 16 Apr 2025 12:30:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
 <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
 <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: d277d09f-ae7c-4176-a3a6-08dd7d1d262a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S21iZUhmM0VSTHZLRW9pbGxPa1M0R3dXeEdGeFdkYXZ1MHdWNUMvZDNWcjh4?=
 =?utf-8?B?aU16VUhublNob1RjYjdoQ0pwNVBNNTRnZ3V0cnhQN08zU0FMMlhuVkpreEdm?=
 =?utf-8?B?R05NQTJyMmlZSlZvV3B0QkF0OGZvQStiZElkZVhFMGZIRDliSnJ3MUNjTHNQ?=
 =?utf-8?B?K0tmVHg2bjhGTW93QVdvaU1zbjlvRC9qekxGNzRVb3ZBYW42Vk5MOVFqbnRy?=
 =?utf-8?B?L2pxYVlXUTYxN200d2xYaHUzbnJJbEJQOVNqTXEvYWN1clNSN1g0Mm1yUjRr?=
 =?utf-8?B?ODNucGk3Nlp0V1hSZmhwVFhDTGx4Qk92amVaQUJ3WVk0VUpYbmVsQnJnMWV2?=
 =?utf-8?B?bUdZMkREZnhwMnBIeEpZN1JjNGxiR1BlazZDM3dkay9YNFpoRkJqQ1NIMjVs?=
 =?utf-8?B?V3M3c1VGRXFvN25ZdnF4di9xbzJaM2dwOFQxWHlFWWZHT3dnZStjdW0wSkZh?=
 =?utf-8?B?dThUajUzaXB3SzNKM1R2R1RqTU1rbGNLdWtlTTZsNFMzMTYxcHlHRGZqVmhy?=
 =?utf-8?B?UXJ6bWRuaFJ5Mm5HdklvSXpCNnFDV0pSTEZVVGNzYTl1MWQ5WGo4VVFIcmZk?=
 =?utf-8?B?ekJhQ1hsK0duS3NLM1NDU05MS1dSNW1lcWNwaTRXRVJsY2p0WHRPVm1udmlZ?=
 =?utf-8?B?QzhPQkl6anIrZ1FoWlJ0MUlPWmpXcGZleEhqRzVIdUNHWGcxMHVBVFhWVC9X?=
 =?utf-8?B?SHYyNU5wcysvQk42VmFubFZOZmY5ZFYxR0JrN09PWVlmUFpGaEJKSXEvaWUv?=
 =?utf-8?B?Q2VwR1UyRlQ0OUhiR0hxZ3V6anRCSmdQbjAxMUpsYVdib0lRTWhOVlNoRm1K?=
 =?utf-8?B?UzYwcnJIeTZTa0x5NGhrNndQRFZQS3FGMUR3Ny81NDd4VTgvOHFUOEJPUmkz?=
 =?utf-8?B?aTk0ekVCZCt6bFBtZVFPOGJpR05Cd25LYkZZNlBJdW5jM2dkWFlrQU9lcTNj?=
 =?utf-8?B?KytWMnVUeHp5UmJuR2RrSzBqVitrTFVGY0c0eHBNR2VEN00yRHhuWk5IcmtX?=
 =?utf-8?B?OHJxU2s0WGpwZExpOGRVS3BVbHZYdDd4MzFSSUdmSUVWYTQ4K242ZTJLeWli?=
 =?utf-8?B?ZG94bUluYzlTdzdaVGZ5SFNHbldON1RwbnVYYUl0U01pblJYbVdBT0tnRDBG?=
 =?utf-8?B?R3cwSXpJMG5iQjlqNnkyaHp3WXEzY2ZFNTgzdG1rUy9iWUhpRDErVXRpSXFZ?=
 =?utf-8?B?dC9RdjZ5amhFVlc4RytLNzdsamNnclZqRS9lMW9IbU1OMkZWU204bllLcVV4?=
 =?utf-8?B?QUcxVlZDRWpDMU5UTUhsaDdzR0VzSmlqWGVyYTREdnJxblRQM1ZzSU9TM1pX?=
 =?utf-8?B?QVdmQzEzNEQxeG9TWnZGRTlmL2p2Y21maERUQVRya1F5eTY4aDdJNzdrQ1px?=
 =?utf-8?B?MmhGaGFPeWYxQzdDeW83Z0tHVUVQOXhzMHhiV2V4UWhKWWlWYlcrRmNSK2Ez?=
 =?utf-8?B?YzVhMDJYbHkyWDFzRm91T1d3UzYxbSt5a2dLSU1GeEk3Y1ZYZDdSOHpCbmxE?=
 =?utf-8?B?UDdoYjRnZTJmMDhudTRVdGdXcTIyQk5HOVpIczc4VG1iN0JBcmQybGl6VGk3?=
 =?utf-8?B?VnBjbUdsZXJzUlBZRzcrdE1PVU9kMUFzOEFwL3JuNkFjekZ5MjNSOGkzd2h1?=
 =?utf-8?B?N1AzSE9tUVpnWk1GU0V2ZWFZR0tHeEllWXBoMEJlbEhjQkNRSkdMZkYrRzRJ?=
 =?utf-8?B?eW5kelg1R0JZcm9DZk12K2pXUnF2ZVZ1eXR3VE5Kejd0OHZUU3I4Tnc2eUl4?=
 =?utf-8?B?bDhEbzgxeGhJRGhQTzFMYU9mbmpsK1NFNU9nOU5PbGU2THcrMlZhV08wK21E?=
 =?utf-8?B?UENtV3RWVFdOS0lTK2M4b21Xa1ZmN2VZeDZ4M3dmTTQ2VnJTWVMwTkNNTGhx?=
 =?utf-8?B?aEE3dUJSelpFSkFJVGxhQnpUZGh4aU1XQUdoNEpqR2VTc3NmVlREUjNYeGNs?=
 =?utf-8?Q?IEPZt5xLp6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lybzVXTGQrWVdBRC9DbW1iODJGdHNVYS9WL3MySXRSWE5BTVVwb2h2K050?=
 =?utf-8?B?aVNiNEZmbHY4VkhpRko0alUzYjl6KzBoeXp1bDBIL1FSYmJvdVdDa3Zzd3cr?=
 =?utf-8?B?dHdtVk5ZYXNVS2hPOHZvV05mUHMyN21qekJKWk5QUkwxQU4wUGI0NzdsWkZP?=
 =?utf-8?B?WE03MWlZWC9rdTJXNTd3citEdnNEblBPRWpvTzV3eS9uWm54SDU3bmFzV0hY?=
 =?utf-8?B?b2psbW1KZE1Kd2xuZWxFTmp2OTRCWWR2RGZLZVVxSjlFWFFKNTJqS3dwcDFG?=
 =?utf-8?B?OWd3TUg2SWlVVnZlRTgyQW0rYitQbXh5MEQ5TjZXRnNtcXlWbHFnaWdEc2NO?=
 =?utf-8?B?UWZ0a25ON29kN21DS3NJbnQ1dXJnN0EvTGVXU0xQc1FBeWtiV3RSTGs1bC8y?=
 =?utf-8?B?UzNFaHNkbWZ6aDN0Ty9sSm9JNUovYnhlTEx2WnF1VHh2ckhuMmJtQmtJUitr?=
 =?utf-8?B?SUZlaWRVQ2FtQlBCU2N1MUlHaS9obVBoVzFraENpKyt0amVMK2prWXI4U3VQ?=
 =?utf-8?B?ZzNKOXVBWnJQa1N3M3FtcTdmZlZIS2E2OXNBUWIzZXVhSEFDeUI0am80V05a?=
 =?utf-8?B?Y0Z0NjZKb2JVYUpYM29EWGttUVJ5MmNTTlAyTUM2QVR2WitXMGRCNWZLWkN1?=
 =?utf-8?B?Zmd1TjJnRVJkdjhwRTdPOE5tVVVHc3l2MmpYU3VYZ3o5WnVneGZIYmpGalg3?=
 =?utf-8?B?T1dGdDF0dSttK3ZFbFNQdzgzcGpHdEd2RnBrdFlpSWdQbGJ3WFJOSlFSN0Jn?=
 =?utf-8?B?ejJkd21tWEVzTWZObVAxbFpBV3dqR2xyODh2MHZCcG1LVWw1VUNkaHlLUDY1?=
 =?utf-8?B?aE5DL3JpbFRLQ2drYU03RzJGcTNPTmpqNFlaYjJYRnFsYVNFK3NFR2tjL3Ny?=
 =?utf-8?B?STE2QTRkTWl1Mm5pWkdEOUVURXA3bVBUSXQ3QUt6NWNxWlMwNFJXTHdjRTZD?=
 =?utf-8?B?dEhINkhhb0FxWVNna01QZFdaZWZsekpJVWVMREo2WGFzTjVBcHlQL2h1YVlI?=
 =?utf-8?B?emZNOE5MTnZFMVoxR1BRUlBZR1ZaWlVSdTJTMGZwMHhua3RzTWU4VXE2NzQ5?=
 =?utf-8?B?M0xUTlJYMVp2UVZmQzRyY0F3WnRFYjlkUC85Rm9Hbm04S1IwNXJTOG9CWmNj?=
 =?utf-8?B?dFo5ZHlZRXFzdWVjbnRQcjhWbXNRVCtQUlMrZ0JybktwaGdoc2Jta1pmVnZT?=
 =?utf-8?B?T3RqSHozTHJXdGpWcXNLdExhWWR2enR0clRGY2pqbGZPV1IxQmIxN1A4T1A1?=
 =?utf-8?B?bVpqQk4xUUpoeVJId1U2Z0IvSmNqd1FHNTlGK2VudGVwZnFXV24zWTVEcFFh?=
 =?utf-8?B?WERWRlN6NEdvbHRNZVVnZzdTVVc4T0lodGxBS2tKbExhVWQ4Tm9FL05FNUZQ?=
 =?utf-8?B?dFBTOW9QREVuYjJiOE00aEFHVVAwTVpLVGZ1VDVhVVh2Ri94bTU2N3hwNG9j?=
 =?utf-8?B?Q0M5ZDZLT3FlbDRWZVB2YjJBY3lpcUtmTWlEZ0VNaHVreUFKMGpGckFSYjNY?=
 =?utf-8?B?eHZmcFpNQmQ0V3kyRmdzb1pEcTJYSG5SeGR5eFU3V3dSTEQzTVVmOGxDMWFk?=
 =?utf-8?B?c0E5V1gzYjg3UWkrQWhFOGNDV1grUDFUd2dkNlcyM2gyaHM5dDZnNWJUUHNq?=
 =?utf-8?B?U1FMSUVXZWlGOTltbEFnbDlLVHN4Q0l2ZlBpNmYyc0FtcDVVdWRGMWdXZUYw?=
 =?utf-8?B?UlZOY0tFbjMxWXVzaDljZlhiK1lTUDllZmNiZWRxcmFSL0c2ZHJwYlVxeXBV?=
 =?utf-8?B?TzVyK3dIdG4ydzJOcUF3elFGQjlwL2w5eGptTTF0WHNyaG5sOGxtZlBDeHdX?=
 =?utf-8?B?TktHSzRyYjBmYUt5b2U3NUhMUXpBRkpybnR1Y0hQazVLcU04TlppTEJyYm14?=
 =?utf-8?B?NVdUMmNacmpMdmtWR0FpTnFNSk8xci94d2pBa2R4VVk3cmVPMkNhZ1VRZ2Js?=
 =?utf-8?B?KzBJWFdNaGZBaUVXQ1Z2T3NGaXBLbGxZSVU3ZkF0V0tjUzJRd3NFNGRRUVJV?=
 =?utf-8?B?cDZuTnpyR3JGSVhyOGM4QkM5QmNvRWtFSHlHUmtNMEFUclN6dTlBM0liSW5X?=
 =?utf-8?B?TGZnS0g4RDNvSWdzSUdZc1d1d2hicytMV0FLRHl2KzRUN0p2QTFKaU5EdERO?=
 =?utf-8?B?QS9SUjZOSmVtNEladzRqRlNXcW5jWVFOZ1JzbDZINXR2TC9DSFdkZk1rNlRv?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d277d09f-ae7c-4176-a3a6-08dd7d1d262a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:30:30.6283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6CAoXh+qENT9RDMOyP116ZzaTv8zBdsqcXDkuPpgMYz9D4PpQgVhGEGczEA0Hvxe6RBpqd8ug2NlXrGcZYZjeOYxvRrnGhSWEJ5ncYNcDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
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

On 4/15/2025 10:44 PM, Matthew Brost wrote:
> On Tue, Apr 15, 2025 at 04:18:29PM -0700, John Harrison wrote:
>> On 4/15/2025 11:39 AM, Matthew Brost wrote:
>>> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
>>> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
>>> callback as needed.
>>>
>>> Some memory allocations are changed to GFP_ATOMIC as they done in
>>> xe_devcoredump_read which holds lock in the path of reclaim. The
>>> allocations are small, so in practice should never fail.
>>>
>>> v2:
>>>    - Update commit message wrt gfp atomic (John H)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>>>    drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>>>    drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>>>    3 files changed, 50 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 81b9d9bb3f57..a9e618abf8ac 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>>>    	return &q->gt->uc.guc;
>>>    }
>>> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>>> +				     ssize_t start,
>>>    				     struct xe_devcoredump *coredump)
>>>    {
>>>    	struct xe_device *xe;
>>> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>    	ss = &coredump->snapshot;
>>>    	iter.data = buffer;
>>> -	iter.start = 0;
>>> +	iter.start = start;
>>>    	iter.remain = count;
>>>    	p = drm_coredump_printer(&iter);
>>> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>>    	ss->vm = NULL;
>>>    }
>>> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>>> +
>>>    static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>    				   size_t count, void *data, size_t datalen)
>>>    {
>>> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>    	/* Ensure delayed work is captured before continuing */
>>>    	flush_work(&ss->work);
>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
>>> +
>>>    	mutex_lock(&coredump->lock);
>>>    	if (!ss->read.buffer) {
>>> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>    		return 0;
>>>    	}
>>> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
>>> +	    offset < ss->read.chunk_position) {
>>> +		ss->read.chunk_position =
>>> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
>>> +
>>> +		__xe_devcoredump_read(ss->read.buffer,
>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>> +				      ss->read.chunk_position, coredump);
>>> +	}
>>> +
>>>    	byte_copied = count < ss->read.size - offset ? count :
>>>    		ss->read.size - offset;
>>> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>>> +	memcpy(buffer, ss->read.buffer +
>>> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>>>    	mutex_unlock(&coredump->lock);
>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
>>> +
>>>    	return byte_copied;
>>>    }
>>> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>>>    	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>>>    	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>>> -	xe_pm_runtime_put(xe);
>>> +	ss->read.chunk_position = 0;
>>>    	/* Calculate devcoredump size */
>>> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
>>> -
>>> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>> -	if (!ss->read.buffer)
>>> -		return;
>>> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
>>> +
>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
>>> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
>>> +					   GFP_USER);
>>> +		if (!ss->read.buffer)
>>> +			goto put_pm;
>>> +
>>> +		__xe_devcoredump_read(ss->read.buffer,
>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>> +				      0, coredump);
>>> +	} else {
>>> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>> +		if (!ss->read.buffer)
>>> +			goto put_pm;
>>> +
>>> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
>>> +				      coredump);
>>> +		xe_devcoredump_snapshot_free(ss);
>>> +	}
>>> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
>>> -	xe_devcoredump_snapshot_free(ss);
>>> +put_pm:
>>> +	xe_pm_runtime_put(xe);
>>>    }
>>>    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>>>    	if (offset & 3)
>>>    		drm_printf(p, "Offset not word aligned: %zu", offset);
>>> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>>>    	if (!line_buff) {
>>>    		drm_printf(p, "Failed to allocate line buffer\n");
>>>    		return;
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> index 1a1d16a96b2d..a174385a6d83 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>>>    	struct {
>>>    		/** @read.size: size of devcoredump in human readable format */
>>>    		ssize_t size;
>>> +		/** @read.chunk_position: position of devcoredump chunk */
>>> +		ssize_t chunk_position;
>>>    		/** @read.buffer: buffer of devcoredump in human readable format */
>>>    		char *buffer;
>>>    	} read;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> index af2c817d552c..21403a250834 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>>>    	if (num_dw == 0)
>>>    		return -EINVAL;
>>> -	hwconfig = kzalloc(size, GFP_KERNEL);
>>> +	hwconfig = kzalloc(size, GFP_ATOMIC);
>> As per earlier comments, this should not be happening while dumping a core
>> dump. The only code which uses this is steering related. That implies we are
>> reading EU registers while printing out a previously saved core dump. That
>> either means we are unnecessarily reading registers during the print or we
>> are not capturing state in advance and only actually reading it out when
>> printing. Neither of which is good.
>>
> Ok, I don't have bandwidth to fix that. I'll let this series die then.
>
> Matt
Or maybe just add a FIXME comment? I've been meaning to take a look at 
this myself but just haven't had the time.

If we need the large file support to allow people to debug issues then 
we should get it in. Your patch is not causing the bad register accesses 
(I don't think), that is something that is already broken in the driver. 
But I don't think you should make this change with a comment suggesting 
it is all fine and happy. The commit description should be more like 
"FIXME: This should not not be happening, but until the unexpected 
register reads are removed/moved make the alloc atomic so it doesn't go 
boom" and add a similar comment to the allocation itself.

John.

>
>> Rather than making allocations atomic when they don't need to be, we should
>> be fixing why the coredump is not doing a clean separation of save versus
>> print.
>>
>> John.
>>
>>
>>>    	if (!hwconfig)
>>>    		return -ENOMEM;

