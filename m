Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FABC2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 08:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BADF10E2D4;
	Mon, 15 Jul 2024 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPP/T4a1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160C10E2DC
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721032165; x=1752568165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SsrjoyvtXsOX77giJBc4y9VMLzY+gWWaC3yHk2yFHT8=;
 b=VPP/T4a1V/RRgSmVgLt3PZ54eW7bHIjz2GPS70NBP6mRR544/p/J1c9w
 U1/IB6e7DuytuqBOdk94IDuB5fyVNnYc6X+v05cgIBh/TOvlD8I7vt+PZ
 MkjnpgNVrMA9ou4xr9n6in6vIo6XucyeF7KpZT35SkSDAHJNvLBNppkUb
 ZPRDZt8kK9M4liuNrDRj9rESgfO0AL7CNYWFzmvaV4px9hDiBCbfTeDgY
 3eVSVs95o2xQ6MdJNjVA3VzSMB6GTL5H5RWThnIz7UPxFIaZKwLCBXOHg
 UGBkHyTytAsKNknVoj02njllO5c9sfbIiYxBzkQV0k6gbVSo6Sj4h2YiV A==;
X-CSE-ConnectionGUID: Y8sL+Pe6RPC2JMze/tMF+g==
X-CSE-MsgGUID: SY53bz0hT++TDkXah3iFtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35827401"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="35827401"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 01:29:25 -0700
X-CSE-ConnectionGUID: vznZJP8iQrCwQgmkxctloA==
X-CSE-MsgGUID: uz3kRjO/S36STgtPekPOFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="53837717"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 01:29:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 01:29:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 01:29:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 01:29:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 01:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=notPyvXqm8otSblABnZPmnu5kSRcCf2LpsrMMXMfArXD9fP93kJoBWWByCrFlihxungGGkw/dDXpyPutZ9nwJVPUq73NLFXc1RtQikCizHbpHNN5cPm7MUi9Mz9Hu5eN2sdd866Fd1/IUPJJmwcXbxj326OH0smfD4UPD5QFKreMKNJWi6gqAMjP188ClC4WYJa0oJh+KLQB8Qc0iaY4drcFZMx+q+dH+kgGuTut7lUs8OTwF4CAo/Lrwoky7umUH73+nEk/zEywDT3iD6r0xWZU2ry6y9qFH0Ys8xf8Ae36jS70G4rReSO/k/Rf5G1oYD9VmGM7T6sj/4phVuo6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0oK0TvulO9kA12uTo+5Zbovq5pr9KIf57ML2fuLO3E=;
 b=GLME8LxXhodOd7imAO1c7AQbjEMrgcWWZg/6TIgMad8FUE4X9q9K1NTJnOR3vrlkeEoNUIyV3ll6nwAAjdT82YdnZ0O/DZfKlVK9ejKKVHhfJA3NtHCtp77AWhsW56XTAirFTc11kYhhUbi/sMggRzQLOsG/R7VQBUPmXZQPy7ls+LSyXa5+rTQ4zPScqK7eBgGbKCkletKjqNMnrBjyyRIfwxyGsn/I334IZ5kz6CPHhNpVE1jxiLmbKbilHd8sQOhbt08V9Hy5V4EeQ8PwCWt4gqK/RM8/xXtlIUO8gKqD6TPlJZ6Eu1kdVY8tOOWJ3YSIrMj/Uw9s9Wvz63KMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 08:29:20 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 08:29:19 +0000
Message-ID: <153961be-e395-4a8e-84c7-fecbd1e6d028@intel.com>
Date: Mon, 15 Jul 2024 10:29:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <joonas.lahtinen@linux.intel.com>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
 <20240203060534.6839-2-nirmoy.das@intel.com>
 <4saec24oxsqk46oq4l2ihygqzllvp7ie2awvh3gwbrfld2aao2@2vf4kjlgedzh>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <4saec24oxsqk46oq4l2ihygqzllvp7ie2awvh3gwbrfld2aao2@2vf4kjlgedzh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cc427b-090a-4ee5-a000-08dca4a838a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VktFZXU1cU1xMy9wQmNuZENPSHI3cFhrRzErL1cvY0xqMi9CKzBKQkhLSFZS?=
 =?utf-8?B?UVg1QU9TMmpkQzN4dHRremJwaVJHVnVhVmdwd1NQeTJUMjVtQmNEM2loWEZm?=
 =?utf-8?B?OVFpQWpCOFJVTkp0L3k2N0RhcFhWSDUwZFc2YlZFRlV5OThmaHY1QllWR1NK?=
 =?utf-8?B?SkNEdlBtZ2lBakZHcGFuMmpUTmdxYnEzaFRwWjJzb0wxZkZoVHdyM25HanJo?=
 =?utf-8?B?UXFUaDZ6NVZ1Q1d5cHRiRm1NN3FwK0RHZTM0OXJSWDZkTlg0dGJZRStIZWJD?=
 =?utf-8?B?bEtzWjg5Z3dkcldQMjlyL1R1U3JxOXVXSkI4MmhLRkY2cG55M0pQRTdRemhO?=
 =?utf-8?B?bmhvUk5zN2FtUWVsalBQS01pUmVFbTVyUFl2bXFYRGEyRVJjdVZKZTIxQ09N?=
 =?utf-8?B?eFE5Q2lMZWpoM2U4STNaZHN4RG9LMFYvWkpndDBkbFJKRHRHL3h0aU45U3Zo?=
 =?utf-8?B?dWk3alhDWTBQaFhoN1pwRUpXTmlOWXdST000K1VUdm9WVUpKb1h3OFV1N0pV?=
 =?utf-8?B?bTRPRW53aTR0dmxPNjUyTGUvZCtiQVVLUjhIOCt5MVFxdkJhZlFMdGhVd2JT?=
 =?utf-8?B?VVpaSVJvTGpGdCttZHNDa3ozTVRlVGpPRmd2L0MrMmlOMHNrTnptVFA2Slhz?=
 =?utf-8?B?bVVkbUQzazk1elRhSHVZWkd4Y2s4RnV4SDdBVmRrU3R2YitIb3dCdEhFZjF1?=
 =?utf-8?B?VjNKR3M5QUZiRTI1eXJHQm5qSW9ndzVwYlVnN0t4YnNKUHJvQU5ZeU43UW1l?=
 =?utf-8?B?a2pRRm1LaW5Fc2paMnFZVzU4VzA1aDVYbWhEM1E5bjJiUU05cHM2WXIwRXpI?=
 =?utf-8?B?ODQ5L2xHU29VTXBuVVEvWHdVRU1KZkFRNU44K3YwMTdtc29wS0ZZVVZKSXRk?=
 =?utf-8?B?OXh4UmNUYTNqVVFlUDhhUFVMZWEwYUJlZW8yZUM4L0pXNnJkTmtpMnZydHpx?=
 =?utf-8?B?ODJCN1JvZnpOUGNrOGkrL0NMWlBZQWVFejRHZE9FWnlCUzRIL1hsTmpHQzJX?=
 =?utf-8?B?QjRQbkllZ1JodDJpTmFndW1vMks4UG4vRVVWd0hpMkFJdmh3NElyRHVmaFV5?=
 =?utf-8?B?NXRzM3M5clNwME9aOHgvSXFCVkNvcVQycmFrcXlpcFYwamtHQkVMWURmbzhW?=
 =?utf-8?B?MGI0VjFOSmZEdExsalBHNlBwQVdKSWUvQUhmKyt6OHJnR204Q3dyUFZkb3o5?=
 =?utf-8?B?ZmU0SnliTUhZYXlNWXduRGI3SzhnOFdob3pUc2J4dTRnWmpJRVJXb2ZvWGJm?=
 =?utf-8?B?VFhHZTBLeHl5UGpJU1VOWHRKU1hNekFOSnR3V3F1eU1CVHJtdnA1WDZ0TlNL?=
 =?utf-8?B?YUkrM2s5eEV6andaOHR6ZjZWMzU1eHpycHNUZWhZaGRieU1seVFqMS81Qjda?=
 =?utf-8?B?dDVGY3JLNWUvNDE3SDFJZ2ZzRzV4QkFabEM1RE9CZ1MvUFNvYkxyMW9UcDFu?=
 =?utf-8?B?My9XclZvYVhSV3k5dUxsdEsrdGszNHhUWGZ0TlIyZUI5ZXlBcjFqOG1LMDNj?=
 =?utf-8?B?MjlLa2NUY0sxZjByd2dWOWxadzludmdiR25hczk5eFgxYlZVd25pQ0NHanR3?=
 =?utf-8?B?SEpLbjFwZWRKWjRueXFyQ0pwU0dhem8xVGVwdDBDWmovSVhIMnh2RjZBV2hT?=
 =?utf-8?B?NzJtK0QyTEtYTXM2TE45eDduaXZCdmFCeCtpSHZDZktIVnN5eml5TWhVSTZP?=
 =?utf-8?B?RFBTNXI4bE5sWFBpYXkwT3NDY3JHU1BUdnVFNG1jVDRYTU5yVHhpT3NBZXhZ?=
 =?utf-8?B?YmZIUVlCajFPdkpuMnR6RUNkQ0JkSHlrWUhUOHFLM25LUElybHhzZlJkSTRv?=
 =?utf-8?B?QWRzc2xZYUxCc2ZwYUVMQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjFmbWtCSzJlRW9PYzFVTzdtMlhERFVvSzdpYjVZM2R4Z0NBTXNpcmhmL0ww?=
 =?utf-8?B?TStMMm5tOEpxSkVDN1cyaEhRQnVPTllrOXV1anpXclhmRjhYOGF2Z2NCWFVN?=
 =?utf-8?B?REJqczZTclVIdWtJR2FxTEc2SDdTK210c2pETGJRSURVSFpoL3hYWnhLQjA4?=
 =?utf-8?B?akxDaUtqWk8rditVTEhaVUx6T3Yxc1JUMVlkNnErQlFRT1orWDk2OFVxYytG?=
 =?utf-8?B?dUNqSkhiallpZVo1M3gyNGJuVVpubisvRjFyNDRyUjdhbDQrZ2o5TkpSUExD?=
 =?utf-8?B?THFyWG03QVM2SS9ZajM3aVkyTENuTEp0UTYxQ0RKbThDNWxpNFh1K0ZLejNj?=
 =?utf-8?B?NS9yM0Vkb3NnQ00zQVl4amZ3dWVmWFFIZE5sd3FNQ2NycTdsVE9aVHlVQno5?=
 =?utf-8?B?UDJpaGdiK0dXV0JENzhXeDVyTzZQdWJtUThTbThEYkNLb1RqbXorWXVrY1Ji?=
 =?utf-8?B?U1JaSDY2WHZUK29zY1J6TmxPY01DSFA2QnAxUjIvbktyWUVzRittYm02Q05I?=
 =?utf-8?B?VzhxWWtlcm9sT0NWVHY0a21Oa2t1bktQbjdpc1N1R0lHVnhTTDgrMmRWMkxt?=
 =?utf-8?B?RlBick1lQWFkSDlwZE95VzRDbCtUcWNTdVVoQVNhZklXdmRlM0xqT3VjK0Yx?=
 =?utf-8?B?eDRHZ2xLemxnUXVraFFIeUZZaGIvazAzSm8xQXA4K25tUmRtbEZZUFBmT1lN?=
 =?utf-8?B?NHVvbFBGL2VQd084Ris1V1BhVFFBMDM4TUFwS3QxK0pRYzNDTjlxcXR6ZUdI?=
 =?utf-8?B?MlAzYzdiUjNWU2VZRGlpWmY1MUh0d2piOVBUeVREQzE2YTRxa3ViQXpKdG9l?=
 =?utf-8?B?TU5LcG1GMldicm5ocTVjb2Nrem9mNmVlUC9UcVZkcnlBSm85dUlRSjJkSWtZ?=
 =?utf-8?B?T2xBUWhoQUIvL2U5djFqSms4Wk41V2tNN0ZyS0FkdWhENG5RNEhXMTJCWE45?=
 =?utf-8?B?cTA1aGhUdkpLcnlJOW1jemhEVkNkcjM2UklPSmhmT3A4SzlUTTB6UzViRys3?=
 =?utf-8?B?S09EWE5YYlYvUHVpVTJwd0NnRS81UDJzZUhUTVU1WXVWWXYzMnZUL2l5dVFR?=
 =?utf-8?B?b3NFRGUwR2xZMFZYMjVzWHRxaVpxbzhFdnpseVJRRUdJN21QdWtxS0h1ejZT?=
 =?utf-8?B?Z3NHZVBEWkMvemJ3cmlsZDd5Wks1TjJURlJUa2xNa2FkR2p3bE5QYWExZHNz?=
 =?utf-8?B?MDlnRmZQUy92Uk1sUStMU1RLU2tWSUJRVk9kbTh1c21IYnJ5L0hwQmcrNmR2?=
 =?utf-8?B?NmlTRktQdWkzTUpOOGVFRHIyMy91eWxycngvYTFiWDM3dzhneTIrUGRNZEps?=
 =?utf-8?B?OG5lWkpHYlY0SWZwWTI1aVZtb3hkbjRkbjhXQzVCdHRRQ1NUV3hJS2R5K21R?=
 =?utf-8?B?MXZKblpZeGd4OHh0eTZTQVhXRDB0Yno0ZGdTQ3I3ZDBSdDQzRWZMY1BBWno3?=
 =?utf-8?B?c3ovc1FjVGl0czgyc1JCU3Y3cFVNekNVMi9kVkdqRG9sWU1wLzZIYkpuWVh5?=
 =?utf-8?B?UzZiSVpQc0JRbldkUlRBeEhpY3VtYmtqS0l6bzUyYkl6MmtaSVBjNjErUkNR?=
 =?utf-8?B?MUVoclBLWDNCN3BmSHVtMFViWkZJVUhReW5VYUFKaTZqanljQmk2b2FFUnNX?=
 =?utf-8?B?YTFBWm9OdG5oSDFvVlJEM09uZ3pXbXNsdTJjOGQvSG5NTCtqYzV2NzBwdjJj?=
 =?utf-8?B?M2ZaZFkrSFFoV3lOQk5SK2t6S3hubUR6S2tJekxxaFZxMldkaUw0M3p2RTRl?=
 =?utf-8?B?U29VSWJORXE1c0JNZXpJRTlIaHJHWVJReUdwNEFHQUlOV011NEc5eDd2bHBl?=
 =?utf-8?B?ZVB2ekhsM1N1akljTkdNNndwdUlEeFEydzk3cSt3OHBNbWZ4NHE0SjZTbFNt?=
 =?utf-8?B?ZWwzdWVSdlBPRU5NcDJnZE8yck1EMks4Yk1hUWtmRno3ZVpQSGIvS2lxRkVo?=
 =?utf-8?B?b2VpK1hmZ2NqdkV0MExMUnJIL2JJbmhNcXZLek5Xem51Wmc3ejJhbHoyc0dR?=
 =?utf-8?B?SU5hMGlHYWgwelh5VHNnUzliamVGcXA5T3Q1RWVYZ29XTmpOeVRLTVlZWW5S?=
 =?utf-8?B?alVBUVJmR1JMeGw0NU92eUpMbTl3Y2FpTFBJL0IwN204a3Q1V2xveENVL210?=
 =?utf-8?Q?ZYW8n6k0uzYnLQT51ttlGNTOS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cc427b-090a-4ee5-a000-08dca4a838a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 08:29:19.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV1HNoBUvZFJsS0ywALYgYNz/aD9MF7F3UpDshKQICVkNL55olgP1VFNxx2vxobw886sqEWW0xOylEPQdbYcJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
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


On 7/13/2024 3:55 PM, Lucas De Marchi wrote:
> On Sat, Feb 03, 2024 at 07:05:34AM GMT, Nirmoy Das wrote:
>> Add capabilities to engine struct which can be used to
>> expose various capabilities of each engines.
>>
>> Add wmtp as engine capability which is retrieve from
>> GT info.
>>
>> Take a field from the reserved for that purpose.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_query.c | 5 +++++
>> include/uapi/drm/xe_drm.h     | 6 ++++--
>> 2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>> b/drivers/gpu/drm/xe/xe_query.c
>> index 7e924faeeea0..10981b46c56f 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
>>             engines->engines[i].instance.pad = 0;
>>             memset(engines->engines[i].reserved, 0,
>>                    sizeof(engines->engines[i].reserved));
>> +            if (gt->info.has_wmtp &&
>> +                (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>> +                 hwe->class == XE_ENGINE_CLASS_RENDER))
>> +                engines->engines[i].capabilities |=
>> +                    DRM_XE_ENGINE_CAPABILITY_WMTP;
>>
>>             i++;
>>         }
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 50bbea0992d9..5dac079e64de 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
>> struct drm_xe_engine {
>>     /** @instance: The @drm_xe_engine_class_instance */
>>     struct drm_xe_engine_class_instance instance;
>> -
>> +#define DRM_XE_ENGINE_CAPABILITY_WMTP        BIT(0)
>> +    /** @capabilities: Capabilities of this engine. */
>> +    __u64 capabilities;
>
> isn't u64 a lot for this?  maybe make it u32 and add a u32 reserved?
>
> i915 for example reserved 64b but still only uses 2 bits.


Splitting into two u32 didn't occur to me that that time. I will do that.


Thanks,

Nirmoy

>
> Lucas De Marchi
>
>>     /** @reserved: Reserved */
>> -    __u64 reserved[3];
>> +    __u64 reserved[2];
>> };
>>
>> /**
>> -- 
>> 2.42.0
>>
