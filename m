Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04658EEC2A3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE16610E314;
	Mon, 23 Feb 2026 22:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fsrt+dAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4810E314
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771885773; x=1803421773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+Dt4s2nj67j0Z1cQADkCdZ5zuYxC6yYSpQ947dw1mY=;
 b=Fsrt+dAMhMfP/gLr+H5RtfaVq00oQjLXFKDjy5YiCDoPXdfcYr6qGPaV
 qNdjIZX1YVrHrJ1JgwSMy2nlfJpuLQXUKedISyfuUb0JLXVZSZtllnEWX
 bgjOj0GxN06Q894aH51kPFQOqIHS4c9pGz4rEq1Na4d/8lS9tKkOKGMTv
 M58JekcAu9ZNKNcZPBTHFAi4OXaOG+96v/3Tp4QfkuHW6oArr+pkGpXpX
 50hEJaKT4hifT6FcfZP3PSX1GyBbYitnHiogp6JykY6+Bs4CpZvhB3VoE
 WVq3dgEsjvdWgK0LZJoGCxsz7hDbRSfY11rlqQjN7IgkkT24sb8vjlZ5d A==;
X-CSE-ConnectionGUID: F2nVdbvMSvieO/pWawHazg==
X-CSE-MsgGUID: rjfpYGuzTHCOw0uzOpX7Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90300530"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="90300530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:29:32 -0800
X-CSE-ConnectionGUID: m0MYHjMKSKukMzODKziDhg==
X-CSE-MsgGUID: D+3EbV1MSUihUX5uzhrqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220258035"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:29:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:29:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:29:30 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAPZuCKC1IQj6Cxh3NtLQeLHpLwyUppGT610POZ3qD9hTBZitIOOOCbDvpMS3YyVcUZYN5FFpmoil5FQQRnhgEKDOD08vEK6z4driLYo3g0bX64yLBRjBbAZjIDY6YZK/Mym/HFgE+ZyhTsPiK+xLaQRcTTTQOoPPBTjWuE9e9mMk/3W5ZxhiNgB0RxSj/UEN8Ib/TBQsna8MIVbqY2xhMADpf3ZcOl+j8WOzA9XQE3toXKJqc+4i0/pzSnUZroea3un3RmpBvoMiw0OFTD1vI5Giffjq68adslU8m3D4jInuFcvd+HNiG6L1ylFd15+dT5Nfa4KoBXPrBL9HECrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+Dt4s2nj67j0Z1cQADkCdZ5zuYxC6yYSpQ947dw1mY=;
 b=iaj6C7tDBbarjNTzyADNK5wH31uOSXVFdai1ZK76JBqNDytGvZ/VQqX/oQPugChogTCiMfaBrwk/r3UsXWsLnKAM+tvIzx3FmCeiTildvmq7ndWPVt/geymc+/aSBfjDdmR0XvaqoCkhmPYOCZz9S9QgZ8kOuPle95699N+vTkXLbabkfM3UQfJV6fYn+6TXX8zC/PS2iODRBOc38o7Z1lHIidXiznmTvIDaPH8RuPWO6ej25B5L+CVTDB4HpHVvs3H8aCTBlw4eDLyhkkyzIMOIRHj0gm8YqQb/MTezQ6gyNfSLVQiWIdozf8B1ywX7vZVIAFFoCcmubz4xawuOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:29:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:29:20 +0000
Message-ID: <3f44097e-d95f-49f6-8a50-b0a6949116ab@intel.com>
Date: Mon, 23 Feb 2026 14:29:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pxp: Clean up termination status on failure
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-6-daniele.ceraolospurio@intel.com>
 <8afd21ec-48b5-44b5-828e-da4e49d2fe74@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <8afd21ec-48b5-44b5-828e-da4e49d2fe74@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f97454-2421-47da-806f-08de732afcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmhyeE43cGl6bE9vNmJyZi9KRlBzKzBPMzM3a0VmNkNXM1BUdC9EWG1ONk9U?=
 =?utf-8?B?RWtxTnlXb1RqRGhuemJWTWMvWFRrRDJka3ZLQTNUTHlodmNHTHRXZnJLS1Za?=
 =?utf-8?B?cWI0d1RKZ3IxbmMzelNWS3VsOWZneHh2d2pJOXFiRkxadFg5OG1IeUMrVEsx?=
 =?utf-8?B?azdrNHdZMTlzc2Z2TERwNld1dUVmOHVRcGNDa1YrbTkvMUg4WUlBZjZIKzFo?=
 =?utf-8?B?WFR0aXpESE1LNHM4WnZaT0lUYlFRODBZYjVwbE1taFNyRDdwS041Z3BRU0Rk?=
 =?utf-8?B?QnA3MmZ5bHQwSlNWK1A3dWVWQnI5YWU0UEJqR3R4MjZsRkZSdDVEWkhxRGJM?=
 =?utf-8?B?Zk5Ld2owRnZuRW84ZnJHMy8raTZkNHhXclYwUGRLNFRReC9STGtWWFdxakUw?=
 =?utf-8?B?UWxYRHdHcGNMKy90dkhLeGNzaWJzZDRqd1JDcXJMcDZualh0eTdPeVprR2RP?=
 =?utf-8?B?S3ZZL2UvWWhvZTJHVVVkcmt5WE95aDVnUElnZi9FTGYrOTcvdEVMY3dvWE03?=
 =?utf-8?B?K2tOUzc4RWtNV3F5cGFqTlBYdmU5M2I2KzhhRHl2bXZNUFJhcC92bFZrZmc4?=
 =?utf-8?B?U1Q1Vy9xcjdBYjNNK3JQNzdZOHN0d3JYajNucmJSMWMvZkVwZnpZajZTdkE1?=
 =?utf-8?B?ZzVIZnlJMHFDMDdENWt3Y3dwZzNORlJ3Q0k1Qlo5Rit3YVlDRThza3lXa29J?=
 =?utf-8?B?bkZhQUR1MTIyQ2ZnTVJuQWpMek1KdXZZVDljNkM3SjlHbmNWbEt5WVcrL3lM?=
 =?utf-8?B?bXROTXFvSkI0V2RSaDBSLytMeHZMYXBKb0xxUUFWdEwyenVRVU9vYzczZXFI?=
 =?utf-8?B?WHBrcjVpMlRUbXU2cDd3QzBUZ0V2K09wZTI4bFY3V3hHLzBJVlhkVUszMUY2?=
 =?utf-8?B?N1hoeFI5K2xKZWlsNkxUSmFQMUxreWtxaFdlZnNEZjNFaktDaUxvWk5kNVJu?=
 =?utf-8?B?Uzd2Q2NwR0FVZ1JYbWpWRFlwK0V1RjZ3ZHN6YkNOTlVOTk9wbG1wc1J2d1N6?=
 =?utf-8?B?RGlrM2JjNEVWRjdsNnNtT0ZoNjR1MVRRSDZTYkNBRm1Gc04wUGRPQlhldHNW?=
 =?utf-8?B?d1FhZ0pLK3B2OGpFUU9odkxXdUlmWG1CZEMwd2RITTkxSzB4UmZlL2VuaWQ4?=
 =?utf-8?B?TWZLc0xUTFBQQ0VnQ25qdkJUbTJta1ViTTltdTFCdXdIcmd6TmdTcFdJcjRE?=
 =?utf-8?B?NGJJWVROQThDSHF5WXQwSTErTXNSa0lVSXpMbWZtSSt5eUN3ZEprNy96RDlH?=
 =?utf-8?B?eDZNZkRvV2g4STFGcy9VWnFYQ2VPclpxVEd6MVhzbm81ZnNTUkt3ZlZUVHFw?=
 =?utf-8?B?clRITTRNODlKdnJYWGRXSlAxOS9lRHRBdWtsc1BQbytqdHE1aWZkWHNmWWxS?=
 =?utf-8?B?aFAzZU9HbUtOTStxd0VvNE4yWHQxejRoYzBXSDFzNko0MXBYT1dRbmoyMnpn?=
 =?utf-8?B?WHZZL2xuR0JESGdWYXdxcTJzNE45YTFwazhIbGNkRTBhSCtYVTBtbFpWbVp3?=
 =?utf-8?B?Yi85bGwyc2o5UUFZaGc3RjFqMmlMejdWRzdOQ3dlckRXc2ZVTzlpM3FORUcz?=
 =?utf-8?B?NkRvaHM5enJuZm16dWVWUlB0M0o3RU93bGZwTE1sNXZIZTJBTllqWm9DTElM?=
 =?utf-8?B?WmRlSXhQblJmTUNrdlV4T0JYVndRSVh6dS9aMkRJZHNHbDcvd2RHcWQ0UERT?=
 =?utf-8?B?ZW93RU1oQkdwSUdDK3dDZWNGbUYyZlFPTmdQRm9mV1FrVkFqMlVaWFFzd2xB?=
 =?utf-8?B?V2hSSk52L3ZZY0RrODhMd2dRRlVUazk4M01VRWFjQzJRS0U5Y0pJU1oyczcr?=
 =?utf-8?B?OHdsdG9lUzZKVXVzYzFFU05JYXpnbTZ6UmZkMUFtcjdCRzhGSnFFMDgyek5w?=
 =?utf-8?B?OWQvbkU4WHA5Zy9FK1FYM2dHYm5scFI3YlBpV3g1ZzNJY016WFZRb0F2TnF5?=
 =?utf-8?B?MEE3OSt6WWxvb0hpNkZoSGp2dHI4eHl5d0EzaTBNcW8wdnNKVDIrajNta0Js?=
 =?utf-8?B?U09YaEVnS3ZadldRbGsyMTV6ZFcxa3N1bE9YMGNIamhiWkg2dUZkUm84eldO?=
 =?utf-8?B?NTN6Qkx6Q0w5c25vMlhZaFltdm9lSVJTajJUZGFjT0VNRkVVTDVpWGpnTk1B?=
 =?utf-8?Q?t95Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjI4Mnd4SS9DcXYrN3lTWDhDTmV0ekFxREVKdjQzZmNhczFUYnFKWFR3Z1ZX?=
 =?utf-8?B?ZHdjOWpyQXRPZzJoLzY3U3R6MlQ0KzRWSmo0V3FWMmlScUx6WGQvcExEN0dz?=
 =?utf-8?B?ZFFnR1pOWUtlVkVDVjFNWEoxb1pNY2t3ZWlEKzBvZ1l0M1ppR096enhwd3do?=
 =?utf-8?B?SWc5bFlTUUxTVUowV3VFVG5xclZXLzJXVDBnY2hQMmJqU0o3RGJaNE0zY1Qv?=
 =?utf-8?B?M0djbXJsN1AzWkk4Y0tON09veElkUEw0Wm9jN2Y5TmhyVjdsRUxLT1I1TkVX?=
 =?utf-8?B?dFljZkcybkNvKyt2MWN5dEpuL21TYXhUbDNFK3I2TjRrTm9JSWdoa2RHQzJV?=
 =?utf-8?B?R1pUYlRaWUhDT0NrZFNBTmFJdFMyUWFpSzg4cU4wSVlzZm0xSlJQTnZ0Skk4?=
 =?utf-8?B?ck45dkRRd3NqSlBaSU1QN08yVVJSeXczL3M4QUc1N1JEMFZ4M3N1R00vRmQ2?=
 =?utf-8?B?NVh0TThRcjBYbnlyMjJkNGdxcHRNdHgvRmxteTllQnNtV1IvT1JKZHg1ZFZy?=
 =?utf-8?B?TExacnhOcWlGLzh3Q2M1RHZucjZFLzNUd0JYVGpZbXJaRE9vd3JsbzZNK2sy?=
 =?utf-8?B?NVd0cDEyYXN0MnB6Z3E0OCsxQWlYZ2ZTeG9RQmVVZTA3WnkwZ3JmelRJb0FY?=
 =?utf-8?B?b3h0aHc2cURHT21YUnVtaVlSUW54SEhPdzdYZzhneU5xWnVSRkR3Q3lQS01M?=
 =?utf-8?B?MC9vbGcvVnlHT1JLQXVLNFQ0TC95RmRlSFVxbzBNV1o4YTR6M3k2N0s3Q3Nr?=
 =?utf-8?B?c1VkVXdBajZYWG5tZHB5T045NFRoYkErRG5Kb2h1Nk1ab3BzdUZpeVhOaWgz?=
 =?utf-8?B?ZDN0Q1UrTHZHeTBlZ3ExM1FSeWpWTExSS1VHNnpsQ2pIVWJHc1VmVXIwV3Zi?=
 =?utf-8?B?ZXhCRGkvelN3VjR3Sm8vcXUyMlpiMXd1UTRiT0dQK1ZrRytPRXRNQ21HWG9Y?=
 =?utf-8?B?VzBkNVJCL1ZCODZmcXh0RVk4SE80ZGlFSEpDa2dTYmJGcGxPQ2tmTGFMb0xa?=
 =?utf-8?B?REFWc1N0N29jdWN4aE1ueTNUakEwWnh1dmJYZ3NxQlRwbG83bWVEWXowZlRh?=
 =?utf-8?B?OHJIc2xrcWFuSVBtcXBGN3B5cHlxZDBwOVlDRVowNFlsb0dRbTE0UWc0VTgv?=
 =?utf-8?B?bG1kRERYNWVNeWpiVGliaGF4REMwdHB5aGlZYk1rUDhQbXM4ajd3LytrdHQz?=
 =?utf-8?B?MmRBK29lUEpLWm93U2tVN0pkOUFvV1FGd2trUENiZFJyVHR1bGdWYjMwd0g5?=
 =?utf-8?B?RU10QWZNRHQ3bHRrMXNndUYzbmVVMjlsMjF5V3lvRTBFTEZMQTcwTXd5a2d5?=
 =?utf-8?B?eHlKbExaSGRVRENhaXBLY0hTdmJPSlV1VjF2MDQ3aDZtdDJTRGNaUkY4ZHZG?=
 =?utf-8?B?ODl6c3lDUWVibWhsZlFuQkI4NmVzNk5idUt6OWkvQ1FlSWFJWnlSSG9iRktF?=
 =?utf-8?B?WHJmNUhQUzdibEtFY3lSOHJZUnpHZXRvY0luWDZSOXd1bUtISTF5eFZsT0ZN?=
 =?utf-8?B?am1DZS9vR0RpUVAvUTg0ak5ZWC9nbVBnSHlER0h4QnJVSy9EeDFVVzYwZnk3?=
 =?utf-8?B?MGxvQU5KMG9aZjVxQkRURzlDVVNqK0h0UWIvL0hrZlFCN2FBbHVobXNGWjM5?=
 =?utf-8?B?TnhEUGhPbTJqMFdxTURKckE0RTBUMlpha0hNc3QwdmRDZ3ZMQUJkTDgyVjVX?=
 =?utf-8?B?RXFQaUNnVCs0Mld2MUw3Nm5Rc2VhK0pMeURpK2d6cTdPUExJSmtxclU1Y2Jm?=
 =?utf-8?B?VkpIeXAySVhaMkxXaFF2Z3BSZnM0Mm04U2poSVhkRWs4dms1VGFkVFNKYTRo?=
 =?utf-8?B?N0VBb081SThzbURKTC9Ta09xbHJTYlQ0MkExYUVqbEFlQmdtU3laaGpkWTNy?=
 =?utf-8?B?TFRDQzh6RjJDSm83TjJwalRWcG1nS3pDWlZyRWkyT2dydGJ4anlFU0xSdnFN?=
 =?utf-8?B?TkYyZTVEMktOSG9Sc0hxN1U2MGdhNEJhQkgrcVpGTktNZGRMRnY1MzJaZ2Nz?=
 =?utf-8?B?R2swT1lOeTlSbzVLV0Z4K05RbWYrR3htMW5iOXFMZmlDdWVSbUxQdEtUZXRI?=
 =?utf-8?B?MTBWUFk4U1pOQzVzakN4U3IyeTJWR3JraVFTU3JQdFFKR0VPSTd2RytHSXFH?=
 =?utf-8?B?QmxESWdEendselNwRlM5QkNCNkpERGZ0aUF3by9oemtlV2hzdXM5SlpncnM3?=
 =?utf-8?B?akR1anRzZEpDRDFsYUU4OEhuRE95NVRzMnVHU24xUGRBa29jTjBsYkVEMjhF?=
 =?utf-8?B?RHZ0S01GalhGd3FpUEVHcDVBUWZXRzV0SllvVkh5MEk2ajdycTMwMWgxSEN6?=
 =?utf-8?B?akFublU3d3QzU0pTSWJJSTdxRThPUVBWM1BTMkM4eFF6QVJ5TVB6Nzg4MVVD?=
 =?utf-8?Q?AOtv5oSi1lxD76EU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f97454-2421-47da-806f-08de732afcf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:29:20.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rIAdeYlFJ6uDuFCkT5LMw49WXQTKom1tOjS9fiEEDGSeXTvYDk9AS7VqHXqOpVtv2Upycl74J2lorrJWgmkI7mjcM3qRa3kGcAi19rrM30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546
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



On 2/23/2026 2:14 PM, Julia Filipchuk wrote:
> LGTM
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Was this meant to be an r-b?
