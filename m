Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CE5CE8E70
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB4810E945;
	Thu, 24 Oct 2024 13:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeLXH2hs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F13210E93A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729776136; x=1761312136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jegt/42Ylhhj4vHQIkdbihlRpkjTbMgdhMHRcWG6lcs=;
 b=EeLXH2hsoaPbEZb43xKvMqjDfP6zgjjbIlCru4tx3iWQ3khwczJR1lJa
 gQ35zuGrELBJkenP1oPxY8eT/5p8OeEPyYxxwdWhkc8xuPvcdmyREotQx
 92hczGxeFRCTxu7mv8RAI/kBNsuOKtFLBdwBaYWKw180KR35NY3kttCUa
 Ku6SPSnJTfQeJgEeH4PTCushANg6Ok0j82ALGZS3p/1T+e4obMXvkspt6
 wB2UNamapCKhefsEnVaBRj6TF5oMXPD7fgiN76jlEIb7mKTlQAQLNpEWn
 fvkRX012McQp/etzT2bE/c7uTmZVrVlHPywukA9Jdi7Vry2OumJTDkcOM w==;
X-CSE-ConnectionGUID: 07rCcaWeRWSVZRese6K8qA==
X-CSE-MsgGUID: tbZcxpbeQm6+knMIO8v2NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51947522"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51947522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:22:15 -0700
X-CSE-ConnectionGUID: bOx33WzySkmmwkboEuug+A==
X-CSE-MsgGUID: mjstzTGVRcyDGEfLsFyLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="81013269"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 06:22:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 06:22:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 06:22:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 06:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Huklu2bM+xLsjpA+auDCYPBRBVePe9NEPsyPwgE8698U7Xs3qSrKD4PtJF+PjJPPOFlMakMspXhjAxychWCYZMEwHKmlZnidcGyo+HT90OxJdrpVYVgmw8EODAMeDwT37Ocu8OklJobiGrUdsGltfqCYkIa8Zhsi7d1tZ3886+aoXNZIAl9Byp10YKgtUvgyUASWEnQj8CVJbiNZVMwHBio4zdiDiAGNWfBlhEs1+ZUEvB6SpxayDHdUiEnhDqg5jB0tZog+HOmcj38WUL5jFC/8qBSM4bTCQa/wO3+frsD9ZXXpA8irGG/AaodLCxZO8O2k9/GC7TuzT2cxQqgMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jegt/42Ylhhj4vHQIkdbihlRpkjTbMgdhMHRcWG6lcs=;
 b=FESY8BXxs2loAgVPvbfEghRMUI2lH9/zW/HIb67pgrtyzN5n0d6Eb8eyDXlX9MawXVPnPrpPg5BMOhVIKgQzY5KGjX1k7C+yHC51Xo7aiyIDXu380G4qZD8PtN4TkRvk/K6WJiPgD+P5i5t9+AIGJfYFIFucig2LaHwZoj4492NY6wHat49RdI02AHgTt2lLUMFu/ED5F/RXCCVCqPD15/Isu134CDHwyudgSVGDGLCLgxBaamsurBwU2qOO1cDFaekpAjG53itr/DKtEAKIY0rfYppEQS3LWCEC4MnflwYUSemDNQw0O7OjuztF1py7QbyA0swJmQ9yl7z/F62RFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Thu, 24 Oct
 2024 13:22:11 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:22:11 +0000
Message-ID: <44cd59e0-20b3-4f24-8da5-91910c722903@intel.com>
Date: Thu, 24 Oct 2024 15:22:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: Matthew Auld <matthew.auld@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, Nirmoy Das <nirmoy.das@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Anshuman
 Gupta" <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
 <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
 <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
 <63a1062f-56b9-4367-92fa-0ef0dd235adc@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <63a1062f-56b9-4367-92fa-0ef0dd235adc@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: e423d247-d738-4446-fec4-08dcf42ede36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDZTcGU5aFA5ajV1UU82UlFJRldvNUNxc1lSaVRKTFJQekVxZXI3ZUZFcDQ0?=
 =?utf-8?B?SGxaMTY3bFVPTUVNb252aDZTUzI5NVBvTkU3b2RULzZkSThkSmkzRzN6eGxH?=
 =?utf-8?B?SDcyUWtpaEFrQlNSMTYyTWZ2QmlTWDBySitiVGtKOXFCWGM2dEVHZEhrNy8y?=
 =?utf-8?B?Mm11OEJEK25XbVptNmwxSXl1U1hWOG9MclkyWEpLR0x4WjZlNFdzNjdKOG9a?=
 =?utf-8?B?c1Y0cE1SQ3RjRHRxUWRWOUlIbmJWdUNoaG96MnppY1MrZ1RGUkpoWUhLdmpY?=
 =?utf-8?B?cmJsdlhXR3ZmK1pmVFRwcHAzQk5POUJCRDNIYVB0QytjZHpuZTVUNk13NVcr?=
 =?utf-8?B?K2RvS2dCUG1Memh0S3lINzZIcWVwVXYvbWlMbTQ2WmhOTUlFZ2VVVlVJT3ly?=
 =?utf-8?B?dXBSWUE3M3BudDc4T3Jpb3A1b1pmNDY5cFcvR3JTNjNQZWY2RCtyYWl4WWVB?=
 =?utf-8?B?eUdoVk9Ub2ZKWFZRekIxQVlZSzNzNTg2SCtBQVk0RzdDSTI3dlQrY2hsTDJB?=
 =?utf-8?B?b2pqWXBEb2dYU01zZUliNi9wUDBXdnlMZC9Xa3BtaU94YnlIdEdybGdYa2o5?=
 =?utf-8?B?d0VHLzVXWEZmSkdUYS8zNmlpb2VLbVNsMHJNRUVrNVpXZkQ1VUZYMXg1cDJS?=
 =?utf-8?B?VDVIb2dkUmM3K3pjdXNFRGd5Um51Z2FqVVFFSDhIenFWVjQ5RHF2M2xuWHMw?=
 =?utf-8?B?ZGZETnBjNDh0TXdBUUE2Qi95T0dwY1MvVmMxaklJQzdpUmU5Y0E3WU90K3E2?=
 =?utf-8?B?OUJZWnNzQ1IyZEtWTllRS0FhVkxIUk1lRVFPeFBnb2k3UVkyYUVnTitSUjF6?=
 =?utf-8?B?WEhkbEwxcGtIcXJ5Nkpkcmd0dVo2K0ZnRTMzcEwrNzExeEQ0bmREWU1UMStm?=
 =?utf-8?B?UUg4aWxpdk9wejRiOFlqbG92OUVSR2p2MENDT1lxM1BPUjFNaVlmMC9ERjhv?=
 =?utf-8?B?VWswRWxPRCtPSUZMenVoU2VSZ1VqYkhCNGQzU0NlR0c3ZmdDVE9qUkFkTFdl?=
 =?utf-8?B?UVJQUXlYNWxER2dlMFZJV3NLVXVkdTgvbFc1VlFOL2dkM0l2eG92RG5wT050?=
 =?utf-8?B?TTgyR2JZcEpvZW9jRTQ0OTl4N2VhSEJYV2NxT29UaGxOVGlWdHNnZTJFanAx?=
 =?utf-8?B?b2VPby9vdlVYZDRmOFJVQUMyMXZKeUR3em0weWk4Vy9wQlZja1c5V0xVSXJU?=
 =?utf-8?B?bWdWMlFudTlmNW9URWdMdWVMQW4yd1ErS040SnZsSFNpRkRTTXo4MVhZQVc0?=
 =?utf-8?B?U3J3L2c0UWpRZndOUWtUck5qalB4Y3VJM1FZOEJDNk9ncWhRenZCeTRzWnQ2?=
 =?utf-8?B?SnNweHN6Vy85d2Z0UnNGVUlVZWovV2ZkcnQxcys4TjdCd2hpNHVhMWt6OXh2?=
 =?utf-8?B?Z29mQnFjcys5bjNVQjZGVWFqRlRud2YzbmUyQjg0MnUrTVZHSjdaQjdxcERt?=
 =?utf-8?B?T1JadXJlb2QxTnA3YzRXTUZjWUVrOW9ocHRBdXdqZ1dxdC9kRkYyZmlPUUpp?=
 =?utf-8?B?SjdDRlRKclpMVnNiK3ovcVFMd1A1V2FUbGhtek5xWWVrVWFnZnovY09zRStX?=
 =?utf-8?B?dmg0Y2FPOE10VHdVTHhIVG1kZzNoZXZTU0JmblE0VHNOMGJzQlFzSVhUY3Jx?=
 =?utf-8?B?ZHpWR3BhYjJsbUxUNjBFaXo2c0JlWDc1OWxUWjV3cHQwcU9oTm91QTRBWk9t?=
 =?utf-8?Q?hv7coeu4+cePPQuW67tc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmMrQm5iZVBSL2tnaVZEN2NyWlNuREh0eDV3VlRTZUd2RFg3K1QxMHdCVk9U?=
 =?utf-8?B?WFpjUXBYYTdoM2NoZ0ZycmNsODNJNGhMeFJRTElaQmF5RzlNd1NhZC9lSFJz?=
 =?utf-8?B?aDAwRjhUYkV5bDV4WnA4TVQyQlp0ZVo1a2VoQkpsZ05KY0ZsV29Hb3ZtYk5U?=
 =?utf-8?B?d2NhVzRsNElrTGxlenpxNzlhN0wwWkhmT1VFQ3NHQkw4NmcydFF3V29xWFZ6?=
 =?utf-8?B?WWdWaEhYYVN2c01ycEFEeVBlaTI1b1VyYkN3SDhNS1ZwRGtBMjJlMjBJdGRW?=
 =?utf-8?B?eU5YcXdVcXdsd2VQeWcyZEJmNE1ocFdrTFZBTkdHUmJ3OTIrUDcwRVR0SWFx?=
 =?utf-8?B?UmdyY2Zxa2ovMU5vVGdobTJTTmcyT2N6VXNBSFUwWkE3M1JVVk9CQ0NvYU9j?=
 =?utf-8?B?M1lyUXF4ai9EaDUreWY1NTFvcWZMUFZkMmRCMEh6ZkFIcGF6bEY1NmYxeVJv?=
 =?utf-8?B?dFlHMmE3dmxSajVoNlZSQXhxejluaGxFWW5ERFp6bDBuMWRxaVZtUkZRR3h5?=
 =?utf-8?B?dFdEKzhZOE4yakhPdzR3OGFUeC90L1ZNVHlua1REeUhKMWRTWWVEWFZka2pM?=
 =?utf-8?B?TDNBUytkWXNLNVF0NGxkQ1E2U3ZGWCtBZ1hobVJpaklpZFZJb1RYOUh2NUx5?=
 =?utf-8?B?R0M3T25ySVE0UWpOdTdVR1d0S2wzRlVtcWlrbkFLeStQanRVSEVPK3hxdER3?=
 =?utf-8?B?QTFCaUJkdjFYN2k5YWU0WC9hMkJ0US9GMGtUMnZwL0l1VVk1ZXByUUZYTGVk?=
 =?utf-8?B?WHNDWkZqVUwwTWw3bHlsZUlIaEJCZVY4WHdzSy92MElPQ0FCSnJiL25PWWMy?=
 =?utf-8?B?QTc4UVlCbUc0T3dFa1JzK2tZVW5KZWh0bGE2ODVKNkJOZEkyUnZESzJxRldJ?=
 =?utf-8?B?Z1VvaXZ0NDFnbktwMVlWakhhY09JYVBRRGN5S3Q2VHU3MXhqcUw4S0VqZFJW?=
 =?utf-8?B?WHg5WVYrRjdqWWlONUhQaVZ5aU5GRmZLT1dKd01YRVE1Y08zY3E4N29HVk5C?=
 =?utf-8?B?dFBaemFKY3pkRkxkMFpZenNiNW5LQXVaZXcxZmpOYVljTWVmVktTNTRRZDZk?=
 =?utf-8?B?eFY4UXFhWmRmQ0hlbTYxQzF3cGE4OGJMWUlJTjRrKzJKNnNJWG9nL295M3Q0?=
 =?utf-8?B?cFdYMHh4T3BzaU9kTm13QUlKUzhwOUFoNndkdWovTE1SZUNDcXdlZzVLT0dO?=
 =?utf-8?B?dGRJOFkvaWhwcGNZOHFBVlRUN3hKZ0tXUXg2TXVJL1JXaFFYTjFHcG5aRnA4?=
 =?utf-8?B?cmluV1BwQzFrVUdUQjd2RFY4RzRubk4vSTEvcjc0RlBhNktic2pFQWJZMjN5?=
 =?utf-8?B?ZTQ2dDV1VkpwTFpGbHF6VkxWR3VqbjVvSlU3TEpjNFhkL3NJRDM3dzhIVXpQ?=
 =?utf-8?B?TXViaWhyOVI5bHVVcUJCTVllS3RaWldERTg3S1JGUjJsTlBnSCtZSVVETXZU?=
 =?utf-8?B?dk96ak9YMHZkejZkS1FMbXY1NTJ0Zm9mVFdWZ25Na2VLeThOZUFGbkZoeEtC?=
 =?utf-8?B?UE4vWERtTWMyeDJWWnJHUjBBa1AzU0s4ZkFFbXNIdVBrZ2MxMkJ3cHh2QVRw?=
 =?utf-8?B?ejFXM0tKakNCaUdUa3ZOWkEwdEdLclhTTzQ4N3h4R2tMU0NVR3pRcHRPK2VN?=
 =?utf-8?B?bUwrWnErTFNVYUQ1dGRCZnF2RVpkRjRVaUpSNm9PUSsvVDUvZFByNFlveTZj?=
 =?utf-8?B?cnl1Nk8zSkl6bU9Va1VJOFVzeXowSWI5UC9ucU1PNmxMaVBGaW9IL1JBYzFs?=
 =?utf-8?B?dFk2SU5ZQ2U0eW5Bc3ArMkg4c1VOVUg3bjhYVFZzZ3dLSERyK1FIL1lJY3Nu?=
 =?utf-8?B?L3FsREhtbXFBSy8yZnR4MFJOdHpUNVN5WllKZ3ZBRTlsaXk0YXBEb0NhL3hi?=
 =?utf-8?B?S2tCbkdDSEduajZjVHdMRklqT2ltUkVFQXVDM01pV2RZa3FTdmZ3dXY5YmNt?=
 =?utf-8?B?MjMzZU1ZQmFwMm9KTkNkUW92MTJ0ZUlicEh5aC91c3hLTCtYOXBuR0V3THBO?=
 =?utf-8?B?U0FtdUZyeG9IbVQ5UDJ1Sk8yVmRrM3JCdGhXY2svNUVZZlpCMk9yYjBzM0Iz?=
 =?utf-8?B?Ri9JL1Y1bnJJbWZIbzFTRVVQNStFNzZYWEdGS2lCRGIwZTNrbEdJMnJEMXBX?=
 =?utf-8?Q?E88T/ksXVb74ZoXbO+Lmk0C5G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e423d247-d738-4446-fec4-08dcf42ede36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:22:11.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGgYg6Sr9u4IKih0ADOPcrG4EYvoXOc5JxBWYD9ckkBACHlBvRfYF49dkVQqoYvdkJF8Fh77ohDPwL0H759ANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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


On 10/24/2024 3:11 PM, Matthew Auld wrote:
> On 24/10/2024 14:00, Nilawar, Badal wrote:
>>
>>
>> On 24-10-2024 15:47, Nirmoy Das wrote:
>>>
>>> On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 23-10-2024 20:43, Nirmoy Das wrote:
>>>>> Flush the g2h worker explicitly if TLB timeout happens which is
>>>>> observed on LNL and that points recent scheduling issue with E-cores.
>>>>> This is similar to the recent fix:
>>>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>>>> response timeout") and should be removed once there is E core
>>>>> scheduling fix.
>>>>>
>>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> index 773de1f08db9..2c327dccbd74 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>>        struct xe_gt_tlb_invalidation_fence *fence, *next;
>>>>>    +    /*
>>>>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>>>>> +     * in case of g2h response timeout")
>>>>> +     *
>>>>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>>>>> +     * fixed on LNL Hybrid CPU.
>>>>> +     */
>>>>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>>>>
>>>> I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ handler itself. Is this change solving the issue.
>>>
>>> AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.
>>
>> Agreed, it does handle in the slow path as well, but upon receiving an IRQ, it will be managed in the fast path.
>> So I suspect this is a case of an G2H interrupt miss rather than a G2H worker delay due to the efficient cores in LNL.
>> For now, this change can proceed as it is helping out, but considering the possibility of an interrupt miss, I suggest debugging from that perspective.
>> In another thread, Himal mentioned that this issue is also observed on BMG, which strengthens the possibility of an G2H interrupt miss.
>
> Note that we currently still process the G2H events in-order, so if there is something earlier in the queue that can't be safely processed in the irq then we leave it to the worker to handle. So we might get an irq for the tlb invalidation completion and yet be unable to process it in the irq.


Interesting. I haven't tried it on BMG/DG2 yet but this issue appear very quick on LNL. Leaving tlb done handling to worker would hit the LNL scheduling issue more often than on other platforms.


Thanks,

Nirmoy

>
>>
>> Regards,
>> Badal
>>
>>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>>
>>>> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>>> {
>>>>          if (!xe_guc_ct_enabled(ct))
>>>>                  return;
>>>>
>>>>          wake_up_all(&ct->wq);
>>>>          queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>>          xe_guc_ct_fast_path(ct);
>>>> }
>>>>
>>>> Regards,
>>>> Badal
>>>>
>>>>> +
>>>>>        spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>>>        list_for_each_entry_safe(fence, next,
>>>>>                     &gt->tlb_invalidation.pending_fences, link) {
>>>>
>>
