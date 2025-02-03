Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E12C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 14:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487A010E0D1;
	Mon,  3 Feb 2025 14:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTUkxSdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0121910E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738592129; x=1770128129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XAtO7BYqhMv/PFOU40N8vjDGK/uZyaER1jQQVilaf3Q=;
 b=HTUkxSdv8uOqEYiDUYvB+T0KoAK2utqIenNSnLcK1tyow/X75hBKsMNT
 wnPDfhJKqaFUe4xORjf4SKVLGBX7iUg3lpawOcQ9eySuZ6NFV4s+97jNn
 Cigrdl5z11LwMKqln1DWZqjjTYZ3TtljPfxE31gElCUeNaAmdxq2PVAph
 099JCQnBlj+wYKJy4c2CDdmg4CBo45OqOIGbH2dE1Nc94i/wjgiKj5gbm
 AvTdvP12yj2Ove8HENPNijwY4yENQJ9gnJjvZCLe3TjrQLrWRJIG1b5sK
 09sSX3xhDJej/VALs5AfjtRDDSsxjo8u3Xgbf/akp9GB7cEPmcdjFzPKv A==;
X-CSE-ConnectionGUID: kCbrplQiQg6ahiFrwB248Q==
X-CSE-MsgGUID: lzZoWNddTnyHg1z2J4IxMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42834448"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="42834448"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:15:07 -0800
X-CSE-ConnectionGUID: ndtJy+QXQViM+muxpqBksQ==
X-CSE-MsgGUID: xmeLuJojRXGHJqIabZJ1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114919493"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:15:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:15:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:15:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:15:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAOnqa2hHHa6HymxVStJiOUNvJ+9XW5j5LxJUf16r3a7VB+FOtuvM1Uh3x1wA6p6LblPqd1DL6zevlcPKv7exvjqFWD58qup2PbRVAtvfpiRZGhFiwjWtipp0y7mvjasfBA1iWX4jjz9LPkCukV34DKHM5c1A1Nol3msceCqP4GSsfaoB1AOOUuIYAeEsiIhN0xLd4Kbzwv81IaPGIJHF28y5Tq840pgAkCViMlCYWnrHrUM2bsECg4jhBjZsHj46fN+GHhVTS6WJMbpsCMbR0S99lVW3MdA7QtHhsBTzZO2Fmm1pIn2nf1Cl3XFkq6Y+o7HK8GFySeQpP4rsTqnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ae2aHDKS7sPXZR35jQly2NOHvZjmbyy3SQFJho4GSNM=;
 b=lIVGOFENlbnqP4m3hbRwPyevUe5/39/bR7f/MC46wHFjFriqU0/pa59YAfFjiXrpIV1hpe8N72x8q9GiHidfuBHApe6JPeoGIPo8rK8rWG5oRyI1792Dhq3Y/SiGB5XsuVKdaaB0hPpftYKBR0VlJx522ATi8nrwM8woNHdOZyMkZSLK/da8LFUMUI+8qemUDJ7wbIe1OGIs4ZWgKWxYIjUz80JlXXGd3VXoZvL4G95+Z91OiA6PXv05q5T7lCO5lSaXN330BKHwhOZpftyuhLYZA7wvnyfQcI81M2XkwMQ3XAYkTnyKX/m3I20nTZLsWdU64fqSPOFfCPFsLkHaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 14:14:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 14:14:35 +0000
Message-ID: <10546030-ec4e-4717-8d80-5c976bd3e596@intel.com>
Date: Mon, 3 Feb 2025 19:44:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] drm/xe/xe_pmu: Add PMU support for
 per-engine-class activity
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-5-riana.tauro@intel.com>
 <Z51YmyBWc2HlsSZt@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z51YmyBWc2HlsSZt@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1f587e-c378-4ac8-8396-08dd445d15e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2g4cjZZYzJlaWtBbG1CMmhmY0tUd2lDbk5iYS9WNC84VXY4K3Zaa252Wnlv?=
 =?utf-8?B?Y29abExuUi83UU50bWk5VGQ2RWlTNm91OUpOdGZJdGxFUTRNcWduYWFsQ0Zr?=
 =?utf-8?B?a0kwRWZoRXdoa0I3dytTMGVhVUNXRXB2SGF0UWNjczczeFlheWpYWUVzZTZX?=
 =?utf-8?B?VUc3ckxrdThGb3hZWDNDNGRtNVhGZlFyMHQrQ1hMR0JyRmNzVFBZT2lDNUMy?=
 =?utf-8?B?c2l3aE4yRVFmeVFjekcrcHZxWFYzY2FWb25vNStZRDBnQmtBb0ZXekdWSjlo?=
 =?utf-8?B?L2I4b0VtRWp0TnBSRVpqZ2o1M1NZNWZWK3pFZ29QWEgwbDBUZjNjdTBBbCtH?=
 =?utf-8?B?bzZoSlVvSklYZjlnWmgrc0ZnM2dHRkZQU3FOK1V2eVZjcXZ6N2JOc0k4anBW?=
 =?utf-8?B?bFNaa0xoV3UzR3BQTEtMQXVnSWNFV0I2d3dxY0xEN2k5M041c0g3RWxzWkNB?=
 =?utf-8?B?WFB4S0c5WGhTQ3VoaE9ibDBELzZFTmF4enNHSE5ZODFGQ2k3Z0VDbnhUSEM3?=
 =?utf-8?B?bHFFaExGSVFXcHBiUFNtZ2FWVzVKbkhiN1RRRkg4cXU0VlFOb0swZEFqdGtT?=
 =?utf-8?B?YXF2RHE2c0gvSDUyb2FZMWc2YW5VQ3pyZWpzNWtnWE8wcEJ2eCs3TXdSUkRM?=
 =?utf-8?B?YkFSRXJBZUUzaWpmdVZ0cXVYdUxabjlDRkk5bzVPMUFvamk5Vm04U1RmN3A1?=
 =?utf-8?B?UTQvUTR4SDVKeWFIZlF2S1dsNlgxMFQ1Wk9BYmlwN0d2OHdqOTQrU3BLbXhP?=
 =?utf-8?B?UDlKOFlpdGcwT3V3SFcrKzVYWkdqQXFyQmJEa25iQWEyMWVJWklmeWRGN2Fo?=
 =?utf-8?B?YzRreXU2U2xEblJ1UFZLZXJKZVZGcXo1cHNIaUZHUjhERWpqdWEwU3A1UERn?=
 =?utf-8?B?blpvMU85V2ZCOUxZTHpOYUFKR3dEbFFTMlpVY0o3SU0yZWkxdHlrWXpuQk5V?=
 =?utf-8?B?eGR1ZFFUZzlFQ1c5N3hqY2o5T1NCWUI5SFVWWFBMaWdQNVNGSFV5UzFUMVVI?=
 =?utf-8?B?M0ZUMzdyd2xldFNwMUUvQW5VcDRVaW92WE9LU2pQZkRGa2YvNDVqanYrUWNs?=
 =?utf-8?B?OHppbXpEWkU3c2xzbW1YNWczSVBpbWd1VFNHSGxkUnNCWG0xdTlkbWNiMnZh?=
 =?utf-8?B?N3FrVEhLNGprZ0lob2VkdEJabm1tcVNUeU1WaTA3emRhUloybFovTThsNmtv?=
 =?utf-8?B?cmtKbkk0QUcyV2VXNGxaVlpuaWdRMEh4UDZMbmlRNHRzNzJ3QmxLd2syM1Aw?=
 =?utf-8?B?anMwTU9wN09OdkdKS29OeFVtVlNxdGZDWW8zRmhqTjAvMlgrMmMxT1l6aUpM?=
 =?utf-8?B?ZWV4SEdFazNZb2xzd1B6R0EyN054Q1VRRjhLRUdqUGdybVFhOVM0ZmY5VjUv?=
 =?utf-8?B?SGg3NFdLYm5ybnZKcy9lRVdoSWFDNGVjQTkxV0lQK0tHZmFpUGJ6SkxTK1dG?=
 =?utf-8?B?UGxJS1FnMGFXc1ArYWQ4cjhkVmNycWFCc2o1TzN3UFZuY2JrdHJ1Y2JZODNa?=
 =?utf-8?B?UnVqWjBPd05SL2JSVGtTQUIxTEtCSU10ajBKNWw5S21hU2xXZVNibTVPdE1J?=
 =?utf-8?B?WVZQRkVWQVdiS0x4T2NGdlFYclloRkU1dEJVTFNyVHRTeGxvWlBNMWdGTGg1?=
 =?utf-8?B?ODkvelZYSGNpSC9mWWVwVVpka2pyeWE4REZtUW9DeGNqZlkvNDNBZ3FqY2ox?=
 =?utf-8?B?bVFYNHkvZ2I5dlgwd3U4V3dETGNTT29laG9vSjNkWHdRREdYRFZsMWxib1Vq?=
 =?utf-8?B?WWlnS2ZBeDhOYjN2SHprQ2w1M25Udk5JTUpOUHB2cE80TTA2NXlYcDh2bGdw?=
 =?utf-8?B?YW5oSzRsTWhBczA0TzRBZGVrVXoyTmoxWStndndJYnFhSHZTZ1M3U1hVeUZa?=
 =?utf-8?Q?+N7NrDpDfxUVW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWxLV3NpVW1YRk9HVzZCbDFDZWhRZm1CSGxsTVRlaUp5S2ZuamR3aXdMUHlR?=
 =?utf-8?B?RUVZaTRYUnFmSFh6LzdEWVlVSm1yU1AvaUVFQjJCYTFRazJvb0VnL3lxeXlE?=
 =?utf-8?B?QmN6VXNuclRSbjVPRTdGTG1ZeWtxK1dDdUlFN25xU1RpZ01ub1lteWNjVyt6?=
 =?utf-8?B?MitpSEcwa3hwSTdrRHpOZWpmaHp3ZktoYmVMNjBSY2VOK2tBVzZxcWoyV1l1?=
 =?utf-8?B?b1paY2VpbENPVEJTaldlYWVSM0huZllrSTBXQzhzZ0xPa1ROaE83ckNZNjRw?=
 =?utf-8?B?WU9pZ1hMTVNaWG9kWkVJV3Rrd29aQlZKUk81eVRSR2VlYzAwK2sybDhSamFZ?=
 =?utf-8?B?TmNpTUhBOUtlbTAxZVBhTmRXVCtXbEFCdDQwZkQza3U4c0ZvNEpiVVBkRG5s?=
 =?utf-8?B?aGhCT1lqcEVPR1hCMFZwVGMrdHlocE8xVTNLSHdHcjhpYi9WZ1BNV3o4NHhT?=
 =?utf-8?B?N3lBZGJhSTBBWkpLZVRJbzhJaXovM2xhNmtDV1VDdXJtaWNnTzYrdmNPL3lN?=
 =?utf-8?B?RlU1VGd2ZlVUdXlnZWFGbmU1TlVKODVqcW1LYnczNGFUUVpkU3dmQUJlKzB3?=
 =?utf-8?B?S0lNUUJJKy9EU3dRa3RSdzJwa09uU2Q0VE9Fd2w5aHRiMlVXRVNwdmJ1Skk5?=
 =?utf-8?B?MGJMcFhtRHdDMWRZY3VGY1RSKzFEQ2RiUUJHVnJpZHRCUE9UMmxmT2xWZDFZ?=
 =?utf-8?B?RE4zUWp2VW9JVlptdlNSSkMvSVJjMDlEc0d4V1daYndSNXRQbGJBdnhzMnJv?=
 =?utf-8?B?SDcxaGZIbDBXdGFpRTBTYnlGUHpxam53WGNFWTlHajRLUkNMelFkaW55RGJY?=
 =?utf-8?B?RmtvUTg3TWJHNWlWSVBhc3d0ajhkQmdlek1WWmZyTEhqUmtONkg2L1I2c3Rn?=
 =?utf-8?B?Mytrd3c3R0J6VVJ1V0o0UXhDaUxNUEJQTlVqWW5OL3BzUHZKN2EzV1ZpTHpZ?=
 =?utf-8?B?b1FLS1pmYkpRWHlvWkU4VlJLZFRMbHVBOG9kZnF1MUVvVHFmclhiWk8vQ2dy?=
 =?utf-8?B?cms2R1BFOTdTeDFGc3o2aytBS25iVmd0amVuMTUzdDBCTytkcURDTm5zOHRV?=
 =?utf-8?B?WlJ4Q2xYTVVHc1gzZlpIVjh4T3RSL2IvMjRueXR6YjBtYUpVSUhiSWplVnE5?=
 =?utf-8?B?UGpxVzhxVzNPVzRzVU92NXBTZjlwQWtieGErd2Qrb2owRmYxZy9Md3JFTTVO?=
 =?utf-8?B?K2hLTHliR0NsVDFZYk9WdTZlU1hBaEFFdUwra3l6cEpvNXVwclZUVnZxZVNv?=
 =?utf-8?B?RGJaVTUyekJNaHdCNGV5dVc4ZVpXWktzRy95Y3Q0VlIwMmI1ZWZRVHkyQ2xx?=
 =?utf-8?B?VS9maEhFS1NDQUtDdC95bk02SktQc1RYM2NPOEFpTlg4Y1pSUTdhVmtwTEwv?=
 =?utf-8?B?OWhoMGxCSGVUMXZqODZGSlp0SFNBMWgrTFp4a1BaY3dON29tcEhnYW45YmdG?=
 =?utf-8?B?UU1pOTdrRGZRYWtXMi9XNnRQY3dYNVVzNCtMY3l5T3RrbkhlNk9JdE4rUXNX?=
 =?utf-8?B?ZXFuZXdPa3dJWU9ZUXpRdzhLQWpCdlRUQWtReUJWRnRJR1p5R2NqTmdTQThB?=
 =?utf-8?B?cllSRzhCczlQbmZqME5QQ3gxSjhPN1ZmeFlzR2xFdmVCcHkrQzkydHl5Q3JE?=
 =?utf-8?B?T1pnWFVqTElSUDVka2V0eldINWFsUVNITXJQUmtxS1dtYnRweUk3U3plVVNF?=
 =?utf-8?B?TExaeDdNWVZqSjJqbFJJcHl1aXAyeW1qSUhOZTh3VFZOZm1uMjI3VitMVFk0?=
 =?utf-8?B?bkh1eVBKV0hFTHM4RjkrT3NIZmo5bjlPaEZSVEJlUENQWEtJSDh5c0Evb0sx?=
 =?utf-8?B?V0x2UFp0M3BXTEpxNGxPbFhDSmVWSGR2UElTUDdKVFMreTQ3MUVzV2Mxa1Ft?=
 =?utf-8?B?dkthanVIb3VLQXkvY3FSZm84dVJBbHppaTBESGJEU1U3aFZXVklwRk1aK2Jj?=
 =?utf-8?B?YVhCZWhKMUpVK2RSclBEYmJrckZNcVFpVVBaL1p1Ui8rWnRDWnQremdwQmlH?=
 =?utf-8?B?elZEZVB2THJOM3JsczhGa1o4QzJKZitMOEFyL0czdVAyVy91N015RmR5OFll?=
 =?utf-8?B?MmUvOWwrdGUrMUZWTnpuNGhEeEJjUm1NcHUrd2g0NkZ0TnFaZUg5RE5Cc2ZZ?=
 =?utf-8?Q?d/LnQza7x27FVLvGLk9ucXNdJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1f587e-c378-4ac8-8396-08dd445d15e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:14:35.1401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDWhmzqDoA9T0JFBrGJsg6/utl2XDlff/RdMCqLbSMua+kM3xJfn27TUXfiTb9ecp4LNOvXgnYK0pEAUf/1i3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
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

Hi Umesh

On 2/1/2025 4:41 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Jan 29, 2025 at 03:46:47PM +0530, Riana Tauro wrote:
>> PMU provides two counters (engine-active-ticks, engine-total-ticks)
>> to calculate engine activity. When querying engine activity,
>> user must group these 2 counters using the perf_event
>> group mechanism to ensure both counters are sampled together.
>>
>> To list the events
>>
>>     ./perf list
>>       xe_0000_03_00.0/engine-active-ticks/        [Kernel PMU event]
>>       xe_0000_03_00.0/engine-total-ticks/        [Kernel PMU event]
> 
> checkpatch complains that the line is > 75 columns here. Maybe drop the
> '[Kernel PMU event]' and move it to left:
> 
> ./perf list
>      xe_0000_03_00.0/engine-active-ticks/
>      xe_0000_03_00.0/engine-total-ticks/
CI doesn't show this. Its below 75
> 
>>
>> The formats to be used with the above are
>>
>>     engine_instance    - config:12-19
>>     engine_class    - config:20-27
>>     gt        - config:60-63
>>
>> The events can then be read using perf tool
>>
>> ./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt=0,
>>                    engine_class=0,engine_instance=0/,
>>            xe_0000_03_00.0/engine-total-ticks,gt=0,
>>                    engine_class=0,engine_instance=0/ -I 1000
>>
>> Engine activity can then be calculated as below
>> engine activity % = (engine active ticks/engine total ticks) * 100
>>
>> v2: validate gt
>>    rename total-ticks to engine-total-ticks
>>    add helper to get hwe (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c |   5 ++
>> drivers/gpu/drm/xe/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++---
>> drivers/gpu/drm/xe/xe_uc.c  |   3 +
>> 3 files changed, 128 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1619c0a52db9..bc1ff0a4e1e7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -27,6 +27,7 @@
>> #include "xe_guc_capture.h"
>> #include "xe_guc_ct.h"
>> #include "xe_guc_db_mgr.h"
>> +#include "xe_guc_engine_activity.h"
>> #include "xe_guc_hwconfig.h"
>> #include "xe_guc_log.h"
>> #include "xe_guc_pc.h"
>> @@ -744,6 +745,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>     if (ret)
>>         return ret;
>>
>> +    ret = xe_guc_engine_activity_init(guc);
>> +    if (ret)
>> +        return ret;
>> +
>>     ret = xe_guc_buf_cache_init(&guc->buf);
>>     if (ret)
>>         return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 3910a82328ee..8ea78d8f7e2e 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -8,15 +8,16 @@
>>
>> #include "xe_device.h"
>> #include "xe_gt_idle.h"
>> +#include "xe_guc_engine_activity.h"
>> +#include "xe_hw_engine.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> /**
>>  * DOC: Xe PMU (Performance Monitoring Unit)
>>  *
>> - * Expose events/counters like GT-C6 residency and GT frequency to 
>> user land via
>> - * the perf interface. Events are per device. The GT can be selected 
>> with an
>> - * extra config sub-field (bits 60-63).
>> + * Expose events/counters like GT-C6 residency, GT frequency and per- 
>> class-engine
>> + * activity to user land via the perf interface. Events are per device.
>>  *
>>  * All events are listed in sysfs:
>>  *
>> @@ -24,7 +25,19 @@
>>  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>>  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>>  *
>> - * The format directory has info regarding the configs that can be used.
>> + * format directory configs:
>> + *
>> + *        60        56        52        48        44        40        
>> 36        32
>> + * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - 
>> - - | - - - - |
>> + *   [ gt ]
>> + *
>> + *        28        24        20        16        12         
>> 8         4         0
>> + * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - 
>> - - | - - - - |
>> + *            [   engine_class  ] [ engine_instance ] [         
>> event             ]
>> + *
>> + * engine_class and engine_instance bits will be applicable for
>> + * per-engine-class activity events (engine-active-ticks, engine- 
>> total-ticks)
> 
> Please also mention that gt is applicable to the engine events as well.
> 
> Also a line saying "engine_class and engine_instance are not applicable 
> to gt events (like c6 and frequency)".

Is the below description okay ?

"if event[0:11] == (0x02 | 0x03) (engine-* events)
use engine_class[20:27], engine_instance[12:19] and gt[60:63] to select
the required engine of the gt

For the rest of the events use gt[60:63] to select gt. Rest of
the formats are not applicable"
> 
> Ideally it would be good if there is an intuitive way for the user to
> determine this association, maybe something like:
> 
> gt-<event>
> /* gt should be passed in format for events like  c6, freq etc. */
> 
> gt-engine-<event>
> /* gt and engine* should be passed in format for active/total ticks */
would be intuitive to find formats.
> 
> but I am afraid that could just result in very long event names in 
> future, so I am okay with what it is now with the required documentation.
> 
> @Lucas, any thoughts here ^ ?
> 
>> + *
>>  * The standard perf tool can be used to grep for a certain event as 
>> well.
>>  * Example:
>>  *
>> @@ -35,20 +48,34 @@
>>  *     $ perf stat -e <event_name,gt=> -I <interval>
>>  */
>>
>> -#define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>> -#define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>> +#define XE_PMU_EVENT_GT_MASK            GENMASK_ULL(63, 60)
>> +#define XE_PMU_EVENT_ENGINE_CLASS_MASK        GENMASK_ULL(27, 20)
>> +#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK    GENMASK_ULL(19, 12)
>> +#define XE_PMU_EVENT_ID_MASK            GENMASK_ULL(11, 0)
>>
>> static unsigned int config_to_event_id(u64 config)
>> {
>>     return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>> }
>>
>> +static unsigned int config_to_engine_class(u64 config)
>> +{
>> +    return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>> +}
>> +
>> +static unsigned int config_to_engine_instance(u64 config)
>> +{
>> +    return FIELD_GET(XE_PMU_EVENT_ENGINE_INSTANCE_MASK, config);
>> +}
>> +
>> static unsigned int config_to_gt_id(u64 config)
>> {
>>     return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
>> }
>>
>> -#define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>> +#define XE_PMU_EVENT_GT_C6_RESIDENCY        0x01
>> +#define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS    0x02
>> +#define XE_PMU_EVENT_ENGINE_TOTAL_TICKS     0x03
> 
> checkpatch warning here ^ (space before tab)
Will fix this

Thanks
Riana Tauro
> 
> Thanks,
> Umesh

