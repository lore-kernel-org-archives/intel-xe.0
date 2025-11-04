Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1130CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 23:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9490B10E106;
	Tue,  4 Nov 2025 23:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Plkmv/yX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708E10E106
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 23:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762300427; x=1793836427;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k+Q3vNx6kF9N0bncs/kuW/KdqPclFSm0Ulmz7Cg5oGU=;
 b=Plkmv/yXsYV3rBA9KbgqpfZsW2U4eUEVwK2bwUE96dl81BCJLEdn87pJ
 sbvlByUSniIeAqdY9QMGWnyv2aLtgwYdrk41HgtEyd4JvX1lE4nDBjjmD
 giLLnLn2WobyVrv79mqzdOgM0Y/FsuSRClTHbUSk/yG8nXzaBAZCjsJmF
 N2W975tYkX0n3kGF0avSAzTZEE/O8HAXVSyrqw4/JYzz3kxqGKMy5HgM5
 nPq8NvmQC/v4AJwvKarcyhocf/PkIXI+7HD1SidA20MQoPdIbVtqhXRTG
 GTcEk/puPO6mlouMGJ2J0jyG7+iSy6wv6GPPrVmL9h9pRWB63owfd62KB Q==;
X-CSE-ConnectionGUID: O56GFQW9QmCGeQSYBFCPhw==
X-CSE-MsgGUID: 29xDt86WR7ihc8USMuCAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68266350"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="68266350"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:53:47 -0800
X-CSE-ConnectionGUID: 9JpZdSScRcKtj5dZDfgnwQ==
X-CSE-MsgGUID: 7e579LL/Rd6MBEFDuvhzCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187600947"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:53:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 15:53:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 15:53:46 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 15:53:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS6nNni0iytK85qkYUqXIKR26AindphiDxBMpVMZqBsp4epAiXm3RtfmNlMbrJfivYNxJRfK3g7Vtj0crH+zBeu9BVgi5g8T9Hx9Hob9cZPqDPP52cGxgXOkXM9v0l1sMmPFRxskL5dm6Scv0mYN0YOVZ1YhHk/jajROcYzYVwMWsFr9ooOscbvkd4aAl5qhO+R/KkIBdb76/+HMkXj30b4txNmynRIIvc6aAt78v1U1o670k55F+up+LAWZ6RhCsmrTeNG7AOQMiUpWjZdohNz5CHI/d7l0j3Fxe72kD0wVFCKiU6aLYCPuD2As5JiIk8EXJ/mwGDOIlCsLiZMCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKiKXIv7LA899sCaP6BkOvPXvM3NjoYELFYG5rU2zs4=;
 b=XlgETGW6hDYY72sKi0l1GawHGzmvs7H7KND+z8kzrsYEmEjkxm2rG9aHJaEfsGejuXvNmhsuvsozy9hf0IXwIHCbDV06AqkMtNL3dLpBU2dSppOKbhDUmJxLpNSJI7qgd4ACWCAQs6CrTOaZ7AvaLtQ5SCCMLAZdktCAwaPaLOf2hstx+BNn4o+9aw0wwLbg4RIjKO940OM5BBpoGKm9BPK3uatBMmcr8XD/QQGV8pjc0BeIpQ8q5Y9wgbbxp1qclxUqaGv98nqPqczHni8gRBvge0NT7Xde2JHF43v5vnCQK0lqhDgA25nrLvgvvFFn5L/lZTazbG08916mPgqzJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 23:53:42 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 23:53:41 +0000
Date: Tue, 4 Nov 2025 15:53:38 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/16] drm/xe/multi_queue: Add multi queue priority
 property
Message-ID: <aQqSAuzzul1foaCW@nvishwa1-desk>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
 <20251104185150.246345-5-niranjana.vishwanathapura@intel.com>
 <aQqE+KFho9NcNF4T@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQqE+KFho9NcNF4T@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4a9ca7-d3f7-435e-e1ff-08de1bfd61bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTZKSE9vQjNOcXQxaTdDdW5xU3ZsZlI2YnN3a2daYUROMHdwY1FVMUhhYmdh?=
 =?utf-8?B?d0YyNmxYd2NLZ1dIWW51d0NTZjNLQzA1RE5yVE5KekVoRGRFTWxRK2htQ1E0?=
 =?utf-8?B?UlJBRjBibTI4MHJNYmNiRGlENEl6aFhIb0JjMlpUMkJHZzBSbDA5Tlc0aVNp?=
 =?utf-8?B?cFRYUkhlRGVvUmRPM0FhVkZmQjBjemdzdFZYMEhFeVJzbTNYQTRqQXluZHpx?=
 =?utf-8?B?K0VCTFE0VzFZcW5uYVgrUC8vYmlMNDlKa0ZuelVrU3huN2RadEJjeWcxc203?=
 =?utf-8?B?ZVk0TzllYmUyQUpDeXVEaHN2SnpwSG5JZ1h2YkFaWmpEejdKWjhSQ0R1MytE?=
 =?utf-8?B?WXpYaGo4Q1hCcjd3aDh5UktUNVRhTUR1RUE5aG1IL2x0dTJGVDdVZlMvUUNk?=
 =?utf-8?B?VGNUR3h5OHlrNkgwLzZlYllTcVFGbDgvVG9iaUtUOWRHZldWOFd2aGE4MVJF?=
 =?utf-8?B?RmR5YVFzdXBrMWdQRjZDK0grWjFpdjc2QzNwK1lGL2ZOYUpiaHBwOUpFUWxJ?=
 =?utf-8?B?aTJHZnRHbmt2Y2gwZ0hiNWpGajlqUjZjTzhiZEpJTHFBbktDSmZacUZnSkx5?=
 =?utf-8?B?Q3NFSFExR2dwbEQ3M2VTNU1pNWJRQkxVeHJZZ2pVMWp1d1Q0dVluN0VtM0tK?=
 =?utf-8?B?Z3RNVmtaWTVISkFoU0VjdVZhMjNPOStaWHpaL0VqUnBKN1hZTzZlc25na1VE?=
 =?utf-8?B?ekdtcUl2ak1wR3lvSHc1T3l4SFFrNy9FbWhpZGtVTHd3YU9nTUJPcWxEeWlE?=
 =?utf-8?B?eldUem1rM3pzWEF3NXo4aGpRUGpPUXd3RlJuSTRGOFlRZ1V2dHUzc0d4ajVO?=
 =?utf-8?B?cHIzSSttLzlPV20rRGxCbWg2WG16YkZ4dDBwZFRNeHhJOWZKSXIrVGNPenBM?=
 =?utf-8?B?OWtxMTJ3MWI4eldGREp4enI4NUdRby9GWDQ5L1AwYm9Mc2RGMkYxL1AwZFBh?=
 =?utf-8?B?clovQm0yeEFQTVlCS1ZEalZ2YWlndlZnTFNEeFN2RFZHQVUvUjA4eWlLRTk3?=
 =?utf-8?B?Snd5YnNMZW1Wd0x6WTBPdXB3WkxudkEweEJsOVpmVkZUTFdVamI3SG1NSFBl?=
 =?utf-8?B?UXZvZldKNHBBd1pKRlBCUC8zUWc2VWFTYy82K00vM1l1VlJoNzNvTG1qL0I4?=
 =?utf-8?B?SHNJRnh5YmJiUDY4SWN4TTUxeW9CbnhaS3Y2Y0x5TlZwUGY2aGZmV21FditQ?=
 =?utf-8?B?NDhwd245WjRyU0tKWm5ZNTdPR0FIcllGWWQ1bm54UFIrczdpYzYrRGdLSHZS?=
 =?utf-8?B?aUZXdVhNTEszYnVpMld6ci80eUdTVEcwSEM4ZlFlMUJQRzFlTGM2cG40YXZs?=
 =?utf-8?B?VWg4ZDNQQWhvQXA2a0JJOTBGNldQdSszb2MvM2JvUVlsOHMwMkFGYTFiNmhm?=
 =?utf-8?B?NWNhY2NDSjhON2FraXFETkRhYWdwZk1PczJxa1RrUVRjOVdiblU1ejQ2Vkt2?=
 =?utf-8?B?R0JmN3NRaW84Q0ZlVTQvSVVtMk8yWHhxQlIzVGVyMUV1LzBjYVFiUE1KeUVk?=
 =?utf-8?B?eG9OckdZWUw2TDUxS205YVpCZERpbzFidVJ0OGNPSmdSWXYweDIzQjJ0U3dE?=
 =?utf-8?B?UG82KzRGT1pTYmJoWlpnd0c1eHQxenhJSGJSNjdvVkJDemd1ejZNTTVzaEZS?=
 =?utf-8?B?T0F1REsxTkhaRkFrbDVaREY3ZkxRYlFnY1pBNlV3a1VCRFNIdWNxQmNWWWNj?=
 =?utf-8?B?MGdUS1pBeTZhWnFURzd2OWtFOThFd0pwem1CdHN0VzhLd1o1ZVIvc0ZjV0Ir?=
 =?utf-8?B?aXE1ODBRTGpxQTdCbXFPK1VVOTZFbllsWDJROTFtR3BnK01Gc05wNjdDTTE1?=
 =?utf-8?B?V3QvSUIzVDllNWw5aG9iRU1CMXhkdk10SGU3Z2lYM2JJc1RvYmhlT0FndVIr?=
 =?utf-8?B?ZURCVFJ0ZE5xWEJZUTVCbjF5WTVnbWVSVU4zV29mYjNLZ3JxYXV3MkZQaFZn?=
 =?utf-8?Q?i/SypMEdUOP3mkBM/RJuyDEz3wXWJKa+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG44VGxFQ3NOWURnQnhPQ1BWUDROTGk5NUJoZEQweG41SmtVb0w4SXAzcGlW?=
 =?utf-8?B?TU9hY04wdmw2Q3pkcjFTajF5cUtGdHVjWGxwdHRxRjZQOU5hdXVHZzJVeWxp?=
 =?utf-8?B?NWVDVUZBUkZRbml3YlQxcG9xM0tLZndiczlpcTNKeHRaZGFHeWRzNEI0TmU3?=
 =?utf-8?B?UFdZV2dUTlRaL2tKbnlsMlNIOVZoSUxKY3E5alplUmduNjd1UFJobmFvWFp2?=
 =?utf-8?B?U2Vwb0ZFelEwVktmZ2Y1WWNzWW5wcFEwTkdiNFZneGlEeHBxMmtVak0yVjRU?=
 =?utf-8?B?eExFRjZRQXN2TVRkMi9iRm1YN0ExUjd3UXllcUkrSFc1YjBGbDRiUWthL0lO?=
 =?utf-8?B?ek04ZURuNnNwSzNRZ2ZjTGFKRXRWcGhGeldHbUU2SWR2K0tZeWhJYmp0ZUdV?=
 =?utf-8?B?YWlIUE5YUjNFV2l5bTFuSk8zRVdjczdvNVZ4OUc5T3ZZSVBsMlovOE1rVEZS?=
 =?utf-8?B?bUV5ay8vSWdRQk9QVFRtS1VPUVNjU0pEQk5uczhlNFdwUUczYVhqaTVhWWl4?=
 =?utf-8?B?d2MrQm1nOEJyYXZ4QW1zZDFVYmMvdjIxM2RjU2xhMlJDVFM4cDhFTmZaYk5U?=
 =?utf-8?B?Rm5VekVSYmNzYWFaRzZ0cDRIYm9meVVuTDZKSGRDY2JGQTg0aHFLUyt1S2FV?=
 =?utf-8?B?a2kxYlo2QTB4YU8xekFuaVZDUnlnci9lZ0dONnpMbFc5RTdIWjJoMzhVTjNm?=
 =?utf-8?B?T2xINWdRZXFCMENGaFNLdjZhNjVKUlQ0a2d2T0dZL1NkVjErOTVxQ0RRa1Bm?=
 =?utf-8?B?WnVnVGhJclpzQmdLVnVmYjl5NXZncW56ZHdEb3gwZXV4WkVQM3o1Q2Vyb0FZ?=
 =?utf-8?B?S3RkclB2SnR6MHZ4N25xRVZMLy9rNlBVRExnNStwRm5zNlZKU25jNjduU1l5?=
 =?utf-8?B?WHd3NWJ2a3dJanlVODlzV3lrTFlocUUyUER2em5LZWh3dno2ZmtIMVRrMUU1?=
 =?utf-8?B?b04reitHNEpGcnFyRjFySFI4eitWcXJoZlpWQ1MvcGNXNlN4T280NDlCVHN0?=
 =?utf-8?B?VlhVaEFEQkNHaStvWTZkU2diUHkrK1hOWUZvY295Uk5PeE1YUzlFMkNURE16?=
 =?utf-8?B?SHdieW9sSHNHcURvYkprNDhHUU12dWowR1pieTQvc1N2VU8wZC9ZVCtmakNy?=
 =?utf-8?B?T2tyMFora1dFa0RVeWVtZ1BqSnVrN2ZVVlZEdUppZ293Q1Eza2hkajJrWlBW?=
 =?utf-8?B?Ry9KVkY2T2V6TlAzK09aVHVNbEhTUmVtRHNNMG9tSGdsN3RRQmxQWWlNOS8w?=
 =?utf-8?B?WjZIWG9WcGVJLzZWNFJ0aE5aeDl3b2xvclNPdGZLdm0ySGlEVWR1TFBYdjhs?=
 =?utf-8?B?YlR5czFVUm1SSHd4eEFGaXFwQW5VVmRVemdUbzVZYWZxOUV6QU9RYnh0S1Fv?=
 =?utf-8?B?K3FPeTNKNlRvb3N5QjhacVk1NE5BUk1hSTRwTDJKbzhJY2xzSzE4ZWhEdXBo?=
 =?utf-8?B?Z0pUR0YxMlljRUQ1UGdJNHhxa2NHTS9UR25YSW9BY3JtTUtteGtzeGVYM1Qx?=
 =?utf-8?B?eXl2S2dQdWpQVllCbUc5NDVSd25JNnoxeTRzeE43YlFBRlQ0NnVGOElYaXBM?=
 =?utf-8?B?aFFpYkZ5WGpOSHZ6UFdoZmFGU2V1MnNWL2s1azhka2JlZ1NneWJBd0tROUY1?=
 =?utf-8?B?elhlRjZNakxKMVF6ODczaGtja1R3TU9XZXJvMEtYc1BMZVN0V0x6a2RxbmFL?=
 =?utf-8?B?aFVzM3l3RDBIMTJwaTZ4QWVVV04vUkVQdzUzb2czV1dVQzRWeG56OUlNT0pC?=
 =?utf-8?B?M3VHdnZoTVdzUEhORVF5WFJ5RGxVK2FIUWZFbjYyTWUxdkJvNnpoOHR4REtK?=
 =?utf-8?B?SEl6MHRtTHVZT1ZOazdYOFhKNXFOclA3dElyWU1MNmpSakdmeTUxNFpBMTJL?=
 =?utf-8?B?TjcwR1d6YVh3VFo3SmNTWXNlOUtVb0NXdDBEckEybHVrKzg4ZlJYc2R1L1lR?=
 =?utf-8?B?ZWdDR0poYktsMWxKOEFvUzZNdFdPcS9OZ0Y3QzVuVVV4cnlyUzR2b3NlYk1G?=
 =?utf-8?B?cEpSNXlTY281ajFzMGw2am5EVURGT2ltRHlZT2d2RTNkUGdvbDd4aHM4cUlo?=
 =?utf-8?B?Z3NQWWI3Zy9uUFl4b1dhd1ZlazlHTzFTVWxMbzNERDBKbDdWSVdGdTVVaUVJ?=
 =?utf-8?B?K01nNlUrdW9pbllaR043OWkvWXJOUnErZkpkUU1ONVBPTEdKem1BVTB4Mkxh?=
 =?utf-8?Q?HHBJTDHOzCeCj78p361UMjY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4a9ca7-d3f7-435e-e1ff-08de1bfd61bc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 23:53:41.5290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99svQ/xj5dxxhAg6KO1rb01t4fWgpIzpeR1Bzr/oS5j8OfcMuuboIRq01pMBDgOdpLo8vO7QTYd2ZpiuXYYvA+WmKwog2RgFfoHo7xdou77ZD/A8mOv0XKDFyMVSIPdk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
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

On Tue, Nov 04, 2025 at 02:58:00PM -0800, Matthew Brost wrote:
>On Tue, Nov 04, 2025 at 10:51:38AM -0800, Niranjana Vishwanathapura wrote:
>> Add support for queues of a multi queue group to set
>> their priority within the queue group by adding property
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY.
>> This is the only other property supported by secondary
>> queues of a multi queue group, other than
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
>>
>> v2: Add kernel doc for enum xe_multi_queue_priority,
>>     Add assert for priority values, fix includes and
>>     declarations (Matt Brost)
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 17 +++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 16 +++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>>  drivers/gpu/drm/xe/xe_lrc.c              | 29 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_lrc.h              |  3 +++
>>  include/uapi/drm/xe_drm.h                |  3 +++
>>  6 files changed, 68 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 3a701fa477d7..7e9960ede0be 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -179,6 +179,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>  	INIT_LIST_HEAD(&q->multi_gt_link);
>>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>>  	INIT_LIST_HEAD(&q->pxp.link);
>> +	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>>
>>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>>  	q->sched_props.preempt_timeout_us =
>> @@ -737,6 +738,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>>  	return xe_exec_queue_group_validate(xe, q, value);
>>  }
>>
>> +static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_exec_queue *q,
>> +					       u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>> +		return -EINVAL;
>> +
>> +	q->multi_queue.priority = value;
>> +
>> +	return 0;
>> +}
>> +
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>  					     struct xe_exec_queue *q,
>>  					     u64 value);
>> @@ -746,6 +758,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>> +							exec_queue_set_multi_queue_priority,
>>  };
>>
>>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>> @@ -767,7 +781,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>>  		return -EINVAL;
>>
>>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index b9da51ab7eaf..445ae4979c0c 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
>>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>>  };
>>
>> +/**
>> + * enum xe_multi_queue_priority - Multi Queue priority values
>> + *
>> + * The priority values of the queues within the multi queue group.
>> + */
>> +enum xe_multi_queue_priority {
>> +	/** @XE_MULTI_QUEUE_PRIORITY_LOW: Priority low */
>> +	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
>> +	/** @XE_MULTI_QUEUE_PRIORITY_NORMAL: Priority normal */
>> +	XE_MULTI_QUEUE_PRIORITY_NORMAL,
>> +	/** @XE_MULTI_QUEUE_PRIORITY_HIGH: Priority high */
>> +	XE_MULTI_QUEUE_PRIORITY_HIGH,
>> +};
>> +
>>  /**
>>   * struct xe_exec_queue_group - Execution multi queue group
>>   *
>> @@ -131,6 +145,8 @@ struct xe_exec_queue {
>>  	struct {
>>  		/** @multi_queue.group: Queue group information */
>>  		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.priority: Queue priority within the multi-queue group */
>> +		enum xe_multi_queue_priority priority;
>>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>>  		u8 pos;
>>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 2e5106687a6e..b01d852ae526 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -634,6 +634,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>>  		return;
>>  	}
>>
>> +	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
>>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>>
>>  	WRITE_ONCE(group->sync_pending, true);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index b5083c99dd50..56836a5546d8 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -44,6 +44,11 @@
>>  #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
>>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>>
>> +#define LRC_PRIORITY				GENMASK_ULL(10, 9)
>> +#define LRC_PRIORITY_LOW			0
>> +#define LRC_PRIORITY_NORMAL			1
>> +#define LRC_PRIORITY_HIGH			2
>> +
>>  /*
>>   * Layout of the LRC and associated data allocated as
>>   * lrc->bo:
>> @@ -1386,6 +1391,30 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>  	return 0;
>>  }
>>
>> +static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
>> +{
>> +	struct xe_device *xe = gt_to_xe(lrc->gt);
>> +
>> +	xe_assert(xe, (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
>> +		       priority <= XE_MULTI_QUEUE_PRIORITY_HIGH));
>> +
>> +	/* xe_multi_queue_priority is directly mapped to LRC priority values */
>> +	return priority;
>> +}
>> +
>> +/**
>> + * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
>> + * @lrc: Logical Ring Context
>> + * @priority: Multi queue priority of the exec queue
>> + *
>> + * Convert @priority to LRC multi queue priority and update the @lrc descriptor
>> + */
>> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
>> +{
>> +	lrc->desc &= ~LRC_PRIORITY;
>> +	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
>> +}
>> +
>>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
>>  		       u32 init_flags)
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index 2fb628da5c43..569ca380676e 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -13,6 +13,7 @@ struct drm_printer;
>>  struct xe_bb;
>>  struct xe_device;
>>  struct xe_exec_queue;
>> +enum xe_multi_queue_priority;
>>  enum xe_engine_class;
>>  struct xe_gt;
>>  struct xe_hw_engine;
>> @@ -133,6 +134,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
>>
>>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>>
>> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
>> +
>>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 4de21e0a4fcf..6734ef7fada1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1260,6 +1260,8 @@ struct drm_xe_vm_bind {
>>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>>   *    All the other non-relevant bits of extension's 'value' field while adding the
>>   *    primary or the secondary queues of the group must be set to 0.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>> + *    priority within the multi-queue group.
>
>'Current valid priority values are 0–2 (default is 1), with higher
>values indicating higher priority.' ?
>

Ok, will add.

>Do we have any concerns about exposing XE_MULTI_QUEUE_PRIORITY_HIGH to
>non-elevated privileged users? For example, could this allow a user
>process to cause a denial of service by locking out others? This is why
>we restrict normal privileged users from setting
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY to the highest level.
>

No. Unlike the queue priority, in the multi-queue priority case,
the PRIORITY_HIGH is available to the user with normal privilege also.

>For DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY, we have the query
>DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY, which indicates the maximum
>queue priority level. Do we need a similar mechanism for multi-queue
>priority?
>

There was some discussion with compute team on this, but no decision
yet. If needed, we can add it later.

Niranjana

>Matt
>
>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1302,6 +1304,7 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>>
>> --
>> 2.43.0
>>
