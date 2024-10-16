Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A96D2A526
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 15:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD30010E0A6;
	Wed, 16 Oct 2024 15:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHID2Eb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8036710E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729090817; x=1760626817;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0+rpYwXYzEnlUWa7wimOoMkdjkwtmyOrhICv5T3PkCI=;
 b=KHID2Eb0JX9IgBCq6ClLVOWjNLmioF78omnYT/9Pwdh5OyG9gxZmEtne
 pmR2MT5uNsqnzYWAa4anNVXX0gBk1uWYvGsn6zlJjolwyUcF6KEXR1Xrj
 ARKNL7HA/cxONNFDOCrl7Jmi7XxrxNrlLJuyS8sLMCDkhRbBK2QQEEAoo
 yPkIKptslbYhRKsQmjeOQWTRCWoyNJ8eQVm8irQ1hQh4ENZRi8jZsqvc6
 WoseztEtk26pbCFQozCYlIHMDq/8DQULgcUogX6nQu80v+c+Fs1gAvzfj
 cnzIyGulVUmYPcyic9wIHAr9pAD2LN2fOKVVaC5gEw/Lu9/ExdpZEF3nO Q==;
X-CSE-ConnectionGUID: ElseXsrqSUS6XTIk3sNKOQ==
X-CSE-MsgGUID: hte33F+sTz2ga20juHcN4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28690916"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28690916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 08:00:16 -0700
X-CSE-ConnectionGUID: wk6bDvTlSBy11U/r5qTOyA==
X-CSE-MsgGUID: VNtFBboCRoW0L0Z2Nf/WmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="82793115"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 07:58:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 07:58:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 07:58:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 07:58:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 07:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzIHasEj9GJfS15ZStEIbjQIujzhLKZWNu6rDYc466APp3poD4mqZ3p3yKv85ZyzHfH0UF1iiiCqrgVbxIkM85+FXfGvtyVtLx8Rcva1DA5/spEx9Im9Le4GyLpDarYYaxt29dOGXv8gvpFXInw6dA0pa+aEqogMyjQ6YJz5rnJXPz+DMVwDBxUNLtnYr9XnqNRV6blbq1ozGqHcA1v450GbQIICwi36LABr7iYzLUtr0Lq4saGB/xc59nDbtmYjQ572rWc5fI7vtAyOspe1GUehsNgmBFKUZKd8n4gS0YQ0bMVBsOFHffc0zGOXxsyxEt78RCrYW3zCnXc7T9+w9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+rpYwXYzEnlUWa7wimOoMkdjkwtmyOrhICv5T3PkCI=;
 b=gmfCwq1p5UH6VgCpDXJjbfXXL1Im4rbm5cJpXxd7Gi0Vrwkx5lvfUXxAj7Gj100VyywmbBx+frsaKKLS8odEl6VBbSiNF6F1faGq+3QjG/NWqJDsXrzHLs9F4XC7u9WgW0GgjXfTfSzjulSFOJCT6w6aYZbW7FvU9cZlYzmgu6FYsUS/YTh7vMopwfWNGqxn+12rDNQ8k81gCxl7tdhtfTyhwyVlQJxYxCfSqsedzMVaeSx6V4e9qwM28KAT+BoF6LUMfh2neEG236evNNoHN6jV0yRNslyLUBIJWP6yXxUJQCoYGJkzK/OoERSxmLEakx0UhyDS1z7vFIckD4r6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 14:58:03 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 14:58:03 +0000
Message-ID: <44b59c01-ec83-4bc7-9054-1bbd54d3e146@intel.com>
Date: Wed, 16 Oct 2024 16:57:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add caller info to xe_gt_reset_async
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241016134405.769682-1-nirmoy.das@intel.com>
 <f57b1e3e-dbc9-4401-b2b8-0066213db11c@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <f57b1e3e-dbc9-4401-b2b8-0066213db11c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0017.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::7)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 34163973-9f7d-4f50-505d-08dcedf2ef1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDVGQml1ZFJUc2RHZEpCVEVYdzE2ZXc3UFJUZEQvYlpmUmdMUlNmMHBROXY4?=
 =?utf-8?B?R2N3UVdlRlM5SGFiNmZMdloyM2JQbTZjSWxlYWFaWU5MaVdxSU9yZlM3KzRV?=
 =?utf-8?B?R2ovOGFBU2d2eGV6bFpYVG82VGV6SXVvSEkrWFRGQjBVWDV6cys2WHo1S2Zn?=
 =?utf-8?B?a3lMRGQ2WVNVRU1PaUZSN1RWT2RhWnk3aFhOMkdFd2N6cjdzSXFRd1BFUkZj?=
 =?utf-8?B?RmU1RFdNa1o2NjM5M1kwRVBCdENGU3Y1UmpjdnJNV1BGNVlSTU9Eb29ZUTJv?=
 =?utf-8?B?WTcrVVo1Z2p3bkZYRmdRbzk3VFNxbHdHcWtJdFBVR2VxdnBvUnQ3dFF1MUVp?=
 =?utf-8?B?a3R2WVdRZXordGJoNTJZYXE3cVpWc0VNak1kM3J5cjJwaVNZY2RLWHBCT1VB?=
 =?utf-8?B?b0JZWERmRWNvakVZazhYQm45WkZYMTFJcnNYMUwyZGZjMUp1bG54bzRRRUV4?=
 =?utf-8?B?NnE3TlBKVEhnNVFndFlVVGxZV3pQZGREdzFyNDFZWWNESDJkR1UzbWRGQmtx?=
 =?utf-8?B?TG1GQm5FNCtJZVkzbXpoU2dhUjNCRERXRlJWZlJaMzNablJKNXVOZG1XRW1J?=
 =?utf-8?B?RFF3c0pUNkVBbDR0dWw3OXhoaGxOZis3RlRWSExkTHUydlhxK2FSeVZldm9y?=
 =?utf-8?B?bFVrTUdtV0tBNG1GUEEvcmpnai84Z1F5R2NrRFB5K2RZVitJZWxCbGg0WkYx?=
 =?utf-8?B?R1JEemROV0dLT0dYb0E5MHFtR2VSWDJCcE9kNzcraUh2ZGpRRElTUUorSm52?=
 =?utf-8?B?aURaZ3hGckE3UXBheDRoNEFJcmZnTG9aNXFBZVVSQTRSaWV5S3dkVDZhekxa?=
 =?utf-8?B?dVZ2c1lvZXhleElyTkYyNm1tYm9uZm94VnBzc1VEdVdEUzNQbk1iYS84UVRq?=
 =?utf-8?B?SGppYnlTMmN6MkpQQWNuNzBDRGM0MG1LaHZWbG5OcmNzSWpSdWd0eXI5YmZY?=
 =?utf-8?B?ZnJNSDdub3BaTXRVWkVQNk95YUJhbEVVak5CYlY0emduOUpseG5FM2ZhOFdG?=
 =?utf-8?B?UExOU042Z0hlUDRBUFZNZlU1S2ZJbHhvNGtoYS9Nb3dMMnYxenlwSU85RFUz?=
 =?utf-8?B?UlpSMVJndTdrQzdSZUVEV1ljSEJydU5PZWNKenJ2YWxBWmRwSTUyYUlJc2RC?=
 =?utf-8?B?Z0d1ZU1KUzlVLzlkaVluMzVUTDlSOVNmRlVzM29wZHhkZjRLNkJycDc2NUhm?=
 =?utf-8?B?RklQY09HUmI5TVV2Kzd1UmxWMXVVMHE0dTU3a1VKT3lseERQYnRKOGpsRXdL?=
 =?utf-8?B?S280K2VYOVFBYVFJTnFSQnVSNEtsbjBZbFA1c1B6NGlFb0pXZTF5bnRRNW45?=
 =?utf-8?B?QnJlZVhLYWlFVGowTFVRbVdXOUgyWVFCdXNBeWRWYThlZnN5TURCMmZnSDYr?=
 =?utf-8?B?T21tWHRyc1VOTjFaQTk1SXZ5Q0ZWWkh6RlF0SlRUMHJ4a3R3aVZmd0tzUHla?=
 =?utf-8?B?NU8wOWd3emxrQU1LUEhPOWdqVVNXdUdiY096WkR5VStWL0hrNUFNUmY1ZHRx?=
 =?utf-8?B?cjNSLzc3SWkxdUZEbXVCWkZDNjEwYzdERU5aRktWNkdKeXlaOVViamhya2x3?=
 =?utf-8?B?MElkMHp5WGJIOHdKTW5jM3hTMnVrN013cThqakhtV2NLdEs4d0tYcWgyVEQ5?=
 =?utf-8?Q?iBpSG7IiLvl67icq3OmHiO3DGkQEq8VhUnFj5nbyu3YM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2pZamU3cWhlZjBBdVZtZExtQ3BtZHIxWVBWQnJ3TTJwWTVOL2NGL3J0bEcr?=
 =?utf-8?B?YmYvelVLYysxVzExdFhDV05kOVg3RGNHZ0M2b3NCeDhydU80Y2J6UnNHcWFm?=
 =?utf-8?B?UktxblpVODVORUgrcXRNc2orK3l2L3MyMG1GZXk3cVZ4VDFST2w3UlBjakZx?=
 =?utf-8?B?Rit6aUVwMzl0azBIemcrVDFZZ3ZzemJSYmZVTVdHY0Q1MFhSbzBHR0sxU3F5?=
 =?utf-8?B?VS9YU1JFWWg3K3RabTZpTnY4WEJIMXB1QVRvY3JXT3RWaCt3Zi9ESDFIaWhp?=
 =?utf-8?B?UWlqMFVKV2wvMmQrWTAzQzYraThRc2VDZ2ZYeXRDWEErYVlreDlVWUZGc0Z1?=
 =?utf-8?B?WktuRmEwN1ZudWVsdU95RXRqL0kzNzBCUGQrOVdJY1dTdEZISXplR2YzVDdT?=
 =?utf-8?B?MGJRS2ZQWlZIbnU3SzcycU1NMzlmcVptYzYzdWc4UUdpQjlMTVRmUFlveHc2?=
 =?utf-8?B?U1JXc2ttd1lkSFhqSERmQW9GOVU2WjRFMDRVVk1WTGlwbERGMWVFUGlTNURF?=
 =?utf-8?B?NmhhZFRwS3ROdmdCQm5Qb1Uva1ZiSERsOHVkQ1BZL1FqdG9ERE9GYStFOUZJ?=
 =?utf-8?B?S0lSK0o0Y1paZ3c1b0Y2aGs2WFpPdCt4alhSbmNTSWE2cFQzTzFOTFJ3VmxJ?=
 =?utf-8?B?NExrbjBaM2JSQUgzclNoQVZmNS9pY3VGQmhmN2ZpMk5WejNCVURkRGNEYmgw?=
 =?utf-8?B?b2NYSHFYMkNnWFZOMnY4Q0tGbEZITWJZWE9YVFN2elZnTFU3QyttVlZVTDJK?=
 =?utf-8?B?TmlSWEdPdXlJNFp6T2hTdjFqV2szZUpaVkQzbDlocGlWSzBJcDIvNXFQbmlQ?=
 =?utf-8?B?Q2lFREJyUHp0UVBLTDBUd2ViT0ZBTXpOMHZ5WDhjQTFaZXRxRW4zZXlSaFA1?=
 =?utf-8?B?UEhDckl2Skd3YWZycTVET2RMejJ4c05ycG1qcVdrU1hUeTZaZEVkS0dFM09F?=
 =?utf-8?B?OEplTlRYY0sxRGRBWVpsUUNuaHpycDFvK1E2L2RZd3lMK3pySHZiYnduOUdL?=
 =?utf-8?B?OUtxeDBMODhVNDVhZnZTVzI4ZDNEdDlYd3Q4MDlLaFNGQ1RhVkJVUWdRMVdF?=
 =?utf-8?B?M3JNR0MvRDl6VHBralFLaWlWeks0WDd4ZVR3UG92UWp4cDQ5OGVVcHFOTDVK?=
 =?utf-8?B?L3gwR2tmeDV1Z0s4TUNXRUVkbmdMZDRobDJTMCtQMUE0TGIzWDZWT0VGUDBu?=
 =?utf-8?B?YkN4RzBNVldiYWtlMUQvOFU4Y2hVSGpvV2ZkSG1tTWIweW4rOENIYVlHSm5G?=
 =?utf-8?B?Y1d6QUhIaHUvUk9vd1luRWdQR1ViaWNUc1FCSEJBdEQ4aVZJQURZbWw4bXZm?=
 =?utf-8?B?SjlZTStDT2VKR05qOGJyeWVvR2FqbHU3YVJjMmcrU25VekVqTnpSQlVtQ3da?=
 =?utf-8?B?MlltaDhESGRWcHo1SlFaV0hPYVlXVkxENnVzVnhsU2NTZ3hGSWVGWXdWK1M5?=
 =?utf-8?B?WUFvN0xxRTdiL093WVpLaFNqMnMxSXp4Qmo2THVTLzk1MkJnOG1Ua3pQaW9M?=
 =?utf-8?B?TS9sTUJiTnMvSDE1VjhWYlo3YXR6Skx2UFVYY0VBOXRjczFmZFNNTVVKYWhq?=
 =?utf-8?B?c2E0SkZ4aVNoSmdKMFZVMGRVVVY4aElvL3Q2QnVnRHVWQzZKb0pKNWdlSW4x?=
 =?utf-8?B?S3ZJeTAxZG9pQVJkazdJZFpaYTNmaWJjUlZGejZRRzNBVVR3RFQ1aGhUK0RI?=
 =?utf-8?B?T1phNFVtaTJPRUcxbXZsQUNjeFdUcXFTZVdYbU9tQ1JaUFJxY2Frd29kUyth?=
 =?utf-8?B?dDdBNURmSlZWMEtHWk5jcUJMa2VoTU5LODluNk85ZmJNNDJ1cENFVUdCZGZy?=
 =?utf-8?B?Q28zMXhiWGt0M1hjZEU0MVRCb1JpYmhKcmZtRC84S0J1Z2x5MGRGdEYzTDQ5?=
 =?utf-8?B?V0FEU3EyTzNJWGNIeTVpZGZqV2V2UCs3SkpEWGZpWlB6YjFLWE5MVW5uWmto?=
 =?utf-8?B?b0xNVUt6Ry9yeDQ2Z3p2dGtZY21GQ1JxOWlCcFRzSk5Zc2VnWVo4VjN1Ynp5?=
 =?utf-8?B?WEpBcHhZZHBhRjJtZU1ZSGFOeTVyMlNIdjJ2M0Nyb1FmczR0WTF2bi9KUE5u?=
 =?utf-8?B?bElZYkZPbXByN3BLRHliUFh0WUZ4NUNvWm9xbVV5d1RmR2d3ZllRVUdpMzh2?=
 =?utf-8?Q?EO2GGUx4G8VUNfdd51zswkZU4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34163973-9f7d-4f50-505d-08dcedf2ef1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:58:03.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z60RmXZq/j74pbnf6QeJ9YrVu4x0TKE37ODNDz3+OQz9oxljYeAzIq7LSNdRPgHgeaNQEatWh29LabXuNOc3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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


On 10/16/2024 4:44 PM, Matthew Auld wrote:
> On 16/10/2024 14:44, Nirmoy Das wrote:
>> Add caller info to the xe_gt_reset_async() to help debug issues.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2874
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 1c79660fb086..51324c7da0a9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -834,7 +834,7 @@ static void gt_reset_worker(struct work_struct *w)
>>     void xe_gt_reset_async(struct xe_gt *gt)
>>   {
>> -    xe_gt_info(gt, "trying reset\n");
>> +    xe_gt_info(gt, "trying reset from %pS\n", __builtin_return_address(0));
>
> Probably ps is verbose enough?

Yes, that will work too. Re-sending.


Thanks,

Nirmoy

>
>>         /* Don't do a reset while one is already in flight */
>>       if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
