Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF84FC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6110E082;
	Tue, 25 Feb 2025 22:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSWqGVnG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FC310E082
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 22:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740522657; x=1772058657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8+rasY42SDiyJH6lTN0wpn8ZgVtIPzDUCdz0cwiep5E=;
 b=iSWqGVnG4bguSysc9aSIqOuJ1vgUkSrsjN7O3fsmK3THVzjWX1f1RhVS
 tpUY7bzMezqQah1QQkNSKB4Ir6d19hJYLHPxYUmHLgIAVokBXQjPR/DNZ
 x+tCDdnNlHIpU9QfjF0aq6vyip7fcDfr5mMNgm1iK+UntR3egtIL214Tv
 bRitUwANDYR9+FgPPGHFCN43pwYZL5Q+/Nh/P7FyVbEuRFVf0UU3bTYrG
 YPe+7rvadoSSPdgqhZyZkBKNjQdpbExZHgwHG2EmBsX8G5fA9+l5fbMcz
 EEXJHz38IdfADKiwHxql1l5O/7SuanYad1gm4yDBv8ZNVZtkPfdczcbcj A==;
X-CSE-ConnectionGUID: 3KgdqLpJRmSPU6fP/HkE2A==
X-CSE-MsgGUID: TgA4Bkf7S+q1lGNFCovX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41605883"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41605883"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:30:56 -0800
X-CSE-ConnectionGUID: 7i/A+rjdTfuipnXSSUISaw==
X-CSE-MsgGUID: C4VXFX8QQwuypdVH12mswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116716325"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 14:30:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 14:30:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 14:30:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:30:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqzIvKw+7XuFZNyqR4xLzh7PL+VDsqY1lilX8aIIVhACtv1DKzJNZTxtWkyZ1VxbdjWd218SWU1YT6aDXT67lDuXJbDzrETDmy6LYUI7AS/fsHUNod3MZFPw5YmNTTALn6BJVpN/dXUGjZmH9xozP+Xw7a+aJQMr1SZ+Ud3t3yA0Fvw+lkW6sB6hoElwKv2pboTlFsnIqq6vRmr4yMpFMvLxAP8+QpR6dYKE7rpKDquj8KfR972wOSw5M/JEujjZQCEWd8GJBMDYTXMBM7RZE0w8FXjVLwQRntYioGWLiL1uZqcKzKY4WCR2ZhRA46P3wHYi74r9iFPsg8XHk9dfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFVsLf/uoiHXwhrKv7xvwfu+AD72IajuotFM3m9SjBw=;
 b=OnCmhGaE3FUQ13yydHKsTD2Zwl3ov83RhItHBOncX1tHuKGImJixh00J0ovIaP/hXuyEvdk0vd3SKzm6PVOumZyNKmGHddbXnv4JM0fSwV843NyGitLJBfdNg+Bs62qpMZlRP63cTolYGoDrq7UO6wZNwpeAP3xupv6wrsLSd7mK/sTla1HP3TvolftEYvF2nXX/dX7Z9DdmA5jfDbmb7oJLglN1E49edkwBXA3zvUTtnyNvBXf7mWPuOFSM9jCm7uy9BBLf9Q7AI1Z65lzqxIUbJys33ptrWNBzdMg+HFTccN6fSsgrunAR3a8UCkIkTs+D83nnZT5UG46/BLtgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 22:30:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:30:53 +0000
Message-ID: <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
Date: Tue, 25 Feb 2025 14:30:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
To: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
 <20250225132337.6508-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250225132337.6508-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 402af8c5-c73e-415e-c359-08dd55ec1015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUt1LzVycm50cTV4dzMzMUtFck8wVkpUR2dqMWZ6cjNpSW54Mkt3eDRseUVV?=
 =?utf-8?B?WUVOMUd2SXl5UlpTSEhuTUI0Vk1vRE15SU1qU2hEYmlWLys0cjZycXJ0MWU0?=
 =?utf-8?B?R0c4ZGZ3LzYvcHJEU0VBTWRJdnpjZDNJblFHajY4cHRheTJOMmlnTHdMTWJC?=
 =?utf-8?B?MUgrcDBRdUMxL0xpdmcxUlo5ME4reU9kZFpJTFkwenJQN0RWSDdGTlBHU0dk?=
 =?utf-8?B?SEcxaURoamdZbU56UWFWQVR0UlVGa09uc004dnA3MzNtVlU4NDhMSGdxbmVN?=
 =?utf-8?B?Uld2cFN1THlWb09jL1dOei9HV0FOdTdNU3N2R3ltMTFTYUZBR09QazZFVDZU?=
 =?utf-8?B?N05USjhtYzRCQXlNM2xqZUtOa01JOGdJSStFNURCdmpkMG5rMXIwZnhlb1pQ?=
 =?utf-8?B?ZFhXUFNLQXZrajlzOXhFWFRpU24vWjNMaE05dVl4Z1JmRXE3b2RIYnFycnkw?=
 =?utf-8?B?aXgzNnJBbWVJbFpCa1NLUGZmSUphNkN1cjlTOFhZZlRyaFN6UktzbjdsQzJs?=
 =?utf-8?B?amV1VUVScUorT1luaVJTNDhUeFFEcDRFYlR6Vk5yOTNTUndsV1Y1ZWZEMmlt?=
 =?utf-8?B?V2dRVGVWL1g5UWdJKzJDMmhkSXRibW9xY2JrSnZHcjUzUlU3TktvL2NMQmRx?=
 =?utf-8?B?ZlF5NkFWRXBuOXZUaHdBVGRGdUpRR0FDcGNWRkk4dlo4Z1VTZ1JjamM0Q0pm?=
 =?utf-8?B?bGNrT1oydTNiQWpCQXBJNnBlOVc4R3RKWTQ4dUJrTW9INTVKT0E5a281anVX?=
 =?utf-8?B?blVocXFWZktpRTRWdENnWGx6ZXdKSGFlai9EQmdBT2R3MmNscFBVTkxEOFJ6?=
 =?utf-8?B?Y2dMcjZldXU4WUhORzgwMEFhWkVPcEM2ZEF3eE5SeVNsZnAyWVVHd3E0Qkpm?=
 =?utf-8?B?QjU4SDh5RzVRaitxMlJ3eHoxTC9pcTdsc3ZINVIrbUhTT0Y5WERxTGZlUFNy?=
 =?utf-8?B?WFljelA4NDF2ajMrSHNmWmFoQkxUallHZ2dOc21VeXdxQXJCSi8vM0JXVEJN?=
 =?utf-8?B?VGdJSUs2RGJVbHJPVVpBQUtKcHJXRHRmamkyeldqUklnendidlFKTXR4Sjdv?=
 =?utf-8?B?NytFODFQSTFoWEo3cDRzT3Z6YUtFV3hLTFF3aDJWaHFkeXEyNGxpY2tZL0ZB?=
 =?utf-8?B?QkJmTzZuSTJGVFNsWGlnK20wbGoxL0tUQXdnRTM0bkQ1ZUQvYnpoZGppdmFZ?=
 =?utf-8?B?cEZOVzdkc3FIWWk1Sm1Yc1RWWEc4aGdBZGxDTlRrQ2FrTjRNTTNCMzR0dTE0?=
 =?utf-8?B?OHJRZ1crZ1BjNUFnblg2SFVTWm1HVnlDbVFOZVZPZ3NrNGpjMFZXMzgzT1M0?=
 =?utf-8?B?cCtiaWdRaXJ6ZTczRHpOZUZWWDFaOGxhcWd3aDU2emV1UHFpZ0F0OWVMZlgw?=
 =?utf-8?B?ZWlVbHpFSERLK3VKTjBodko5UWNhNDlIOHhFWi9vakkzNWRiQVk2a3RGOU5R?=
 =?utf-8?B?bjV0UnRiNEdSWm51TzF2a0VqbmRaRXUzM0JKVGxuWVQ5bDQ1c0lMRDNId2Rx?=
 =?utf-8?B?MVB4WjNRb3M4a3ZIUFZLM1VrOUI0MzdkZUQwMTJwZmlvSDhSV25KRlJHdHly?=
 =?utf-8?B?MmhhSHc0YW1ZYUhmOTlpV2JNNUNSTVVBTHlvRCtCenQ0citXVUlPUDhmNGhL?=
 =?utf-8?B?cGpmUDYzT1VCcGQzSVRjbWZrZ01iNGtxc0NZWGpvMFhRTURrcFIrOFdqbkh2?=
 =?utf-8?B?QXNvNXB6YXJlQU1QRUNqeGIwRTR2QzRDbFNTeW9hWE9aM1FCbFpjMXZBM2RJ?=
 =?utf-8?B?bHRINHFaWFZTVkVjMzdsbkpZb2l4R2FUbXp4TUwrWjNMcnZsS0phMVA1eFNm?=
 =?utf-8?B?S3NSK0JvZ3F2cmhlbGdaL0R4dHcrUklBRk4yWStKN05KZ21XanpCN1FHU2xa?=
 =?utf-8?Q?NDy3xDkVe79zi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VC9oYVB4RHY3MTVJd3lSOTFSM2g0QlVYOWtPMjA3NXNsUjBlODMzNytZc1NR?=
 =?utf-8?B?QitkVUtXUzZKdk5WbG5LakNObXFvUlJDVkNZZDBWM0pWdERmdE5VMFk4OGhT?=
 =?utf-8?B?S1RpRHdrYjlvSW5FT2hucnpkOVZhUVdWSDRZc1lMdTFrbStoZzJqVlJoWW1z?=
 =?utf-8?B?ajQ5TGdxUGZROFJVUWRlUDY3Um1ubXVPSVphNFowNGxoSFZSZDcrZzJSZTF0?=
 =?utf-8?B?K1VQMVpEWWRqR01PTVFTZDQ5TjlYQ0V4UXFLM1BaalZJc3ppV09CK0JZbUU2?=
 =?utf-8?B?V0FNZFcvRk1oYmY3Y0ZNSnlKaDBudGNEdUpnL3JiMGJBTmpOYlgwdGljbkcz?=
 =?utf-8?B?cDlBaVJhMHlVOWNpaUFiYVRva01XVEhaS291WkRnZzRkSWtqTzNFKzk4eDFD?=
 =?utf-8?B?QzR2SVJxaTNJTUNEQXcwR0tIWlZ4aW5CSGQ4dFpLS3llR0N3dEdaN2JzNWkw?=
 =?utf-8?B?QTBIcDExY0JXeFJFZldnTmZjWFNXRDJ1ZC91R24zejdOUWlvb1I3ZHZOdkZj?=
 =?utf-8?B?U09TQ3R5aEEvQVE5NjdqZmc4azQxbERSbDU4YjV4a3NkYktZNTVvallMTC82?=
 =?utf-8?B?SkpwRmNZbUZwWWVzeStrZGxsVXR5OU92V0xpMUk4M1lFQWJMaHh1cW11aXpt?=
 =?utf-8?B?dmZQd0pieFBTaUQ0cVhRTkZwWmdNTjhocUhSd0lWS08xRjRtWm9NMkdzQ2ZC?=
 =?utf-8?B?Q1pqbE1CT2dyNWZnRU5qdWx3MmRGbzVDVWgvNG5XcTFSM0Y3NU9iN041WXlw?=
 =?utf-8?B?L2tKUDdDM1BlaVZhQlNkYjZrWkpDT1FGU2puWkJBQUprWEJzUmkxNjE1RTVF?=
 =?utf-8?B?U0UxSGJkK0ZORkRneW5hNFpUVEhVNHYzbGpYN3BRaU4zNGQ5SFF0QVU0WFYw?=
 =?utf-8?B?aUNPVloxNWI2bFluUG5BbCtNWU9qenE1aFJBODBKdC9UVjNUOURncTVYK1B6?=
 =?utf-8?B?eUNWaVZ0N2R6Y0JNa1NuWnZKL2h2RDk0YzNnKzVZYjVBVGdKVlVvTHlBOFZD?=
 =?utf-8?B?WHltN3dGaHltQWpaOS9jNnZiRkhpN1VFMVFTaDVaVWZDaHdYdnVNY3FYS1VN?=
 =?utf-8?B?VVlaZnJ6eUZPYmVsVVkvYXFUbEQ0Y3N2UlhibUVFUmh3YUwrZ1NHSmg5NzIx?=
 =?utf-8?B?RmhEOTlKT2NrcGFsei9DWWFvU2RFSUhjNmFmS1NZZ0FIa1lsVFQxMU5ic09H?=
 =?utf-8?B?OWlzQ296VmdmcnRidEp1UjRXN2d3MUVSZGR1WnpCUHc4QWpsaGdKN1Y4am8w?=
 =?utf-8?B?VCtUVDlHNHQvTExyTTVhRW5hMWhnMkdQUklXbHY1T1JBaGk4R3VBdVZockpa?=
 =?utf-8?B?dlB2NFcyYXZVVTVSVnZPVFIzaDRkTHdPQzlhQ2M3K0RjNk8vb2JheUxWU283?=
 =?utf-8?B?SE1iU0ZUekpKOEZZcncyVlphcWMrVFpRa0kySUoxWlZYWUhkSEV2am5zSU4x?=
 =?utf-8?B?aU01ZkFvUlZ3b0JLZnhWd1lWa1M4cWQxanVobmZRMFhsNmdid2hncENtM1BV?=
 =?utf-8?B?d2hQMU0zNFpBQTh2d2hLTFZvRmhDTDFHWG45VlZad0tPRk1nU3c2WVNwRWZY?=
 =?utf-8?B?YW91TmdQUmNaVzBFOGsyRGxENHNlaVpCUExSZTRHbTRZNTlLU051WVppUklM?=
 =?utf-8?B?RFdZUy9UdWZtNTFKREFTU1l0c1hSYmQ0bjJxbXN6bENBTzVSYURjekwwd0xH?=
 =?utf-8?B?Ry9vZE5FdlRQTEJ6dVppVW9TeDUyZkNGL2U3Q01BcWE4OFJiRUNPeEU5OU9D?=
 =?utf-8?B?Ky9Rak8vZ0hQWkt6Z1NIKzFqSjZNNEtHZXFjcXBHSVl2d3hDUWdTWTVUZVhn?=
 =?utf-8?B?UVZ3SGlkT0xIODhsUGE3SEVGa2kyVnlPdDRyOThidEE2cXNWd3Z2MVZEVmU1?=
 =?utf-8?B?dlh3VUdmamdJbVEwczBXQVNVQTJRcXc4eU9FMnFKa25GdGlZRFQ1UFBFcmtE?=
 =?utf-8?B?ODBiSmRRWjB2WXFOZGVCN1hQUUpQY3NBR3B0VHlsQlE4L1lUaFhVaGhhKzVu?=
 =?utf-8?B?eTRUc2V3WnpyVWRFM09FL3dyV1BxeUFWWjhqUHBKWE4wdVk4VWlaTHRUKzBx?=
 =?utf-8?B?bGtNZUhzRlpJOEF5WUFYN2hzNU1ZK0pnVGU4TmNQUklJcDd1SjE5TmQzR3c4?=
 =?utf-8?B?ZGdkL0tQQW00dllPVWNYejdmUTNCNHdha25RbUtyNVVEaVBGbDdPTURUN2dP?=
 =?utf-8?Q?+0CQ6H9ssxIApH3wa1TqCNg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 402af8c5-c73e-415e-c359-08dd55ec1015
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:30:52.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQKvy7XTSscFhAWjmvoKUKuu2SxKYPC8hUyqjYVE0MK8YZxjc1oM4PmpeX99zPMqGWEWCI3cUtw87m41nSSOFL1sX4WTgO0mtDGbP8NGjI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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



On 2/25/2025 5:23 AM, Lukasz Laguna wrote:
> The VF driver has already negotiated the ABI version with GuC. What
> remains is to populate the generic xe_uc_fw struct with the version
> before initializing submission.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index bc1ff0a4e1e7..7b38447d902c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
>   
>   static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>   {
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_uc_fw_version ver;
>   	int err;
>   
> -	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
> +	err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
> +	xe_gt_assert(gt, !err);
> +
> +	xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);

Why not just pass &gt->sriov.vf.guc_version here, instead of copying it 
into another variable first?

Daniele

> +
> +	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
>   	if (err)
>   		return err;
>   

