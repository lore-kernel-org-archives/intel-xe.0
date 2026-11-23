Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1E606A32A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WhAumY/z;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fTkCxJmd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0241910EA73;
	Mon, 23 Nov 2026 09:09:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94E10EB46
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795424936; x=1826960936;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+69U+nyucpkbyb8bxepDouqzgTwi7CxRMG37j2P+y1Y=;
 b=WhAumY/zm6VrIS1WP7ZjsDj/DyWjnWCx3r3/0AwEoUDMF/RVGmuxSW70
 hXZUQhvq0W9ucwCETA2P+MYrKwhU/TCqc9scOZJsNgMl7fGCv+jXKw6RI
 K+RHAAjv0r7XK0PaVuBwqMpJC3JIImfhs2O+dVpbgSY7yDAtYg7W1YI2t
 fvi0q5j4BpGcegNYGqoFnvuJZI8nF3RX+fS1ghSWOlZwFGeS34zmYaDY0
 D+iLVjxPauW9duVmDFZfD2yeBzN0V/rbRkSzvOm6WV0FLDXviafq/Puh1
 rFv7G60x4bBGMKRJwxe02FBxvYu1DqI6gThernSmsS8tKLW6a27FG2y8y g==;
X-CSE-ConnectionGUID: Fewr336rQGa4Tz6BwIz8cw==
X-CSE-MsgGUID: omfxvEH0RjCVgSO1uvcWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4134309"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4134309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:08:56 -0800
X-CSE-ConnectionGUID: tENNLTzVRtSS2JZ6pbZQqQ==
X-CSE-MsgGUID: J65s3OXhSHGP8ZAWTeEPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11334044"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:08:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:08:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:08:55 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYvcNm5frvYCOLB+6Ol6zUizg9Bc7q0p0N5ltsWbfGFwhP6nvw5OPx3bcPWrIcNG2wZWLSElt6JxiY5/3ZU23u2WudAYNSIGgVWSriQSRsd+hoRlr/kXDGMhyGO0a+w3MbNQqjEEicqpKsHinVKFEVgrgnc167j1zIHfvNpm7oGhcAE/DLXNDdxOVwd8XJXtJFU6FBTzVnGj91oi2FF7Ffb0ZehmloyVWKsnyHmkrEaevEsyrxdKJahqIE6Y5nSfRoNciBuhogbRy0wZ568PjiVnKR7zJN6mtHv7XzzXLNNpK1O/gRHAmKkEs5UdB39JiUk8HwlXp/BLRD06cLZtbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOZH0o9H22mi0Z9S8VpsE0ftlBbNISPeqUNoJ29P/48=;
 b=Qsj55o40N9mOviL7tvNdzZkQn/LvVcbYssLTRIxR7c30nrB9biyE15z/RHfBrPB3qqu51PEdevybSFsEKtnTr+orUpDlgfuGVlmnoK8m8nSBCGKf6jFao2RKvoVAXXqCYiVbk19o6AF4yZDnZ45tUY1VsXa/Fby3u3PzzEnVjDHM+aVlJAMXqC+gLTiilHUId87DG2/lqK9+sggD5/tFEGIR8oxQH/p2rIey4RI5YUQGTFA+lPwScSmkTMu97b2+XrlHwQ9feCJGp9g15frEBBrKCYZRTZvPt7SI9PxhKYnQ4ab+NGgFRxrNQ6s7LPdcMEo+ykafTI7wkfq4Fr0eGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOZH0o9H22mi0Z9S8VpsE0ftlBbNISPeqUNoJ29P/48=;
 b=fTkCxJmdlO6vAC9SChVmgXb8x1hD6dz6vkcDW7ZXKCWU2KYDcHfoMmjujRXolc220wUBBJgFQ2QozcipeNIpQER7Wz0loSPTt/wWAmi/6+C9f8agUt6HlJAoGo6HLH35KcBTjzf2n6ak38pJRiBD+V6z5+oXf0f4EKPljAjtjTg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DSVPR11MB921876.namprd11.prod.outlook.com (2603:10b6:8:3e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 09:07:53 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:07:46 +0000
Message-ID: <c62b4400-7c77-4ffa-acaf-d707ccb2ac28@intel.com>
Date: Mon, 23 Nov 2026 14:37:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/sysctrl: Drain page offline queue on queue-full
 event
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261123063932.1061164-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261123063932.1061164-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DSVPR11MB921876:EE_
X-MS-Office365-Filtering-Correlation-Id: 80da5af1-5d74-4b25-04fd-08df49413d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009221227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WelBSBe6hxAX4miV5tOgc6mfI/vNMYUozxa9IUO2kEFRxdV4VS3UOSoq9nrmrAQT7dZ0FbuWi0yvqdYMcLre8ktjRsIWkHTZ1WUYt4zUKm5XUC9gbx0UOY3B+ODThuleBExBKU/+lk2fEHYwBzaFQzYUuqO/Bvv6qZXnn0unN2gR0rtCI10CMuetUOjBrRisWgWWLbDmc1YpYXQFr82p3BfdZ0LMVBkYgLm/N4YoGgnUYWGt8NAfkMv4xBRfBT7ddE1KVzIKr4QqgDyevHLZeMwA/Xns+I1IY7zEdps9bFqcnP7SKcTGGH7krh5yGDftCFySibeCFPQ1VY1DJxMXiuqSz/0q+AaKpnd0cuztPEGTLIej6BjXooySUzeUS7WWbAyBdFqFelXopvdx6DoQ0DXzO+5dBVhHm/nRMIKUlxqf3CMeUumPcHS1EBheA0j/vsclLaC4SBCTUwBxOP9GnAoKnLbP2RavGADeXwe865of3/JYuU3bMHS0BuSaI2fzPkeNa7ikm+z0D4SrMlDDM+bBZdJO1160z59crNWl5ysD6SYo02KiqdT68LXX2ak68QK+t17h87HCNg9eUI/e0izYP3b/dMaSl9SX1KSS07dTPgExFf7/pgUEimKoitbMX3cT/KBiyY4muIzcfJmkfmZuSlnUSybUFjkkKdbO07U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009221227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJFQzNVNVBEOStEdVRCcC9ZQUNFQlRNK0tVQ3ZOd3o3aVJXdXpxZnlYa09x?=
 =?utf-8?B?UzU3cCtMSWtpV3JwbWhEd09xSW5DclFCREpMZkU2Q1h4Snh2R1kyNTNnWVBr?=
 =?utf-8?B?UStxMTN2NjJOSkhvb1FRS0RCaHpqVHhieFRSZlMrZmVhbkp4OEV2SHRkdWRy?=
 =?utf-8?B?ZHNIQ1RwWnRNcDlIRGdKMmdjUFlDaWg4a1ZWbklIc3kxeW91Q0JTYjZ1Q3NU?=
 =?utf-8?B?TG1JRzJzWnVmbnpEd2Vjdy9xNTliMmo5bEJWR2NCOWxpbFlYRjd1T0thdlpU?=
 =?utf-8?B?TmlETmJhTFY0Z1dWMEhJTFhzWlJTS3F5MmhnbnVrWmVPcjZ4R3U1OGtrLytT?=
 =?utf-8?B?OG1lc015OFI5ZXhBYTNVeUlXOXZoU3ZzNDJtOXNBNFNrWUtSYjkzMmlkazl0?=
 =?utf-8?B?bFNaOHpxS25pYW5JenJyd0dnZE05ZlZ1T2lwUXVocmRvM0pEMk51UzA5S0Ni?=
 =?utf-8?B?Rll1ZkFYV3dRc2h0K283bXRnaldxTUh6a3dZZFUvSEs0dzM2Y25ValZxZ0Zw?=
 =?utf-8?B?WHRSNm1QL1dFQnBUTTBwYnpDMFNSbUIrVm13ZkN0cXNwRHFpSGdZWEV1bWdN?=
 =?utf-8?B?aWRaK3JzdEQ1UEU0QUFWdDJMUTRKaVlYcEVWWGRJaEsyWXowTURFU3AzTU5a?=
 =?utf-8?B?VUJWMzJOR1JYOVNqZ052YU5uaGh3VnRrcUZWSExGMDV2OG4ybzVGSXZXYjBN?=
 =?utf-8?B?RlV4ZFNabnB1dkdickdKVXUvajUyYXRUU3lzTUdSa1ZWOHlSZEQ0WFd4WmNn?=
 =?utf-8?B?SUZyYk5TZVpFWHR1UXNZNlA2eWk3elllTTEydk16NmVBVXlWMXZqTnFDRFZB?=
 =?utf-8?B?VmtHVEhtMTFuT1QxaGN1WXdGOGtIVWtlbWYvRnYrR25zV1pzNVlxUWtpcEMr?=
 =?utf-8?B?SUU4RlI5WmtpRHVaUFhkVDFCS0hJVHNSZUkvOEFBMmxTYVZQa0ZqREVUUjFk?=
 =?utf-8?B?N3krTGNSQnpIc2t3c3d6Rmk1c1NJNDNhTGo5K3NOakhQc3Z5OGcxUnlIcU5X?=
 =?utf-8?B?cktTSFBPMVVVclNHNmNQdmRjWWoxRHdIK1B5K21rdHJIeDg4c2dYeTVjVzl1?=
 =?utf-8?B?OEdUKy94a1pmVkxGZVI0WEFqQXdqTEVzeFYzV3dONGNLV252WHlWQ1ErUmkw?=
 =?utf-8?B?OU9YeTBGbVFEbStySFdOeHA2VlFja1Z2RnJyeDU3T0t2Qm9mQjNIa2xCZXp1?=
 =?utf-8?B?M3lSYWVPUWs3UmdJSFYvbkp2UzBGc1ZBQ0orN1FvTWpHaWwzQjJHUjlmOHBz?=
 =?utf-8?B?aTMzM0U2T0M5REVISzg4V1BSWjdjN08vWGFjbkRxMis4a2sxZ1F5Tnc2bERJ?=
 =?utf-8?B?bE1HOXozVXk4NWppMUlnSmF2U0ZFYXEybU1qU1ZmTWFrL2gzd2xValJZNU9I?=
 =?utf-8?B?RWZBZjFBNTdmMVVkOTZDUFk4UUt4THJ4eDlqZmg0UG8xZ0xtem5WZ2FIS0FC?=
 =?utf-8?B?b0M5RmZtbE4vTzVGRXdBZHR3a1ZuRXBxc3NtWVVqdmQ2V2JzZFM4ZGlVclhR?=
 =?utf-8?B?NHU2bTdPRnhMTXFkNld1c3RqN1p3aXFDbW1GaXh3WTk1NmVzeG1sVVA2RXM0?=
 =?utf-8?B?WWhyV21LR0hYaWVKVUt3N1NSQU1EYmFOb1FSMVZ6TUxjWnJWWnQ4U3dXaktl?=
 =?utf-8?B?RW50NjRGWi9td0xhOFJLK3RuenNkYXVueVE5N2dkTUpPdFpoTGlOYU1SSGla?=
 =?utf-8?B?YlVHNU01VVVyT1EyN0I3bVFnYWdKZW9VSDBtaXJwbi8zcEtjcXlFSGVTUTRp?=
 =?utf-8?B?LzYyRUFtNEdkaEFqYXJ6aHR2VDRYWWgwazJFSFk3QlpyQjIycGF1K1Byb1BB?=
 =?utf-8?B?M21Vaml0YU9PbXVqU0F4VjUveDlJODV3d3RoekpWZWt0Y1JOYTR1L2diWnhB?=
 =?utf-8?B?ck9jeUJYQ0wxVjI5YnZGS1dQUlpkdGovQjFyWFBNOWg0cEdWNTM3WUh4Nkxp?=
 =?utf-8?B?eGVrT2svZGkzdFZXc1ZKaHVacmhYUlkxWXdTSExLZjEzSlVRZWE0dVNOTk5j?=
 =?utf-8?B?SlBCNTUxcWNPNU1UL1FNL2tsaWRYbWdwNnQ1Y1RXa0hDQXh5RjFUU3pwRmw3?=
 =?utf-8?B?K0dpdm5sSFo1d1N1ZXJMMlBpVDFyMDMxVzVBSDhNbDNKd1ZoMGVXK3piWmkv?=
 =?utf-8?B?TjZJbWhCbUlFTjUyMzBod3d1RVRwRlIxb1dtZ2tQOU9ZWVRaZEpOazV3T3NK?=
 =?utf-8?B?aU00azA5R0Njblh3eEI2SnNTbkdkY2hOaS9Ib3hwbytHWEM2THhtZ2cwQWtz?=
 =?utf-8?B?SFcwQlNYT05QMSt4R0NCQ25PS3g4NUZlR0xOWTFwUm51aUVXTVVxNk0wZUR6?=
 =?utf-8?B?cUF5eldZTTBTSDY1cCtHZy90NnNMWUoyZDNvazhxZU04VWRwM3FKMEZic2FK?=
 =?utf-8?Q?3vfO0nVGyvCyUdpQ=3D?=
X-Exchange-RoutingPolicyChecked: P6Rnh3yUnnXjIKxp4WIA8Rf4uj5Cs18BvjUKH5lNDOmp37cWtIKN7VEmHyvoZj3oWHgtctl++A6EEF+rVPyAxmaOfRhx1cu+wom8owVHKfm5wCoYtHYoQ7lu4d7lYJlMho4vCP+/iulAlZRJx/1mfS//kyh2quR2D3zIhP94uMDjNq5p3m7vVJLuIMhfohMf3NW7DmjyhvfICSXipvfuWCo8g7QTeLVUMyzGoIH6PV0+/VnGzKh2/fPHDqYq08tpycSi4CVnc/mV1dAytX7Z0Bi4On+NJEkqraDAkHjs0L3zvKY9jrgY8WEAS4tbvrp+PZqG0LvA0sOsKeIySv6mUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80da5af1-5d74-4b25-04fd-08df49413d41
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:07:46.3835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IN/S3GSYRq3JDtxowE2kHMG6auh2V+RSxvHDI545njr5H82Iu7BAq3+Ik4JJYb91Q4mFyxuOHETAfx/u69WiA70pABqHuvjdGiFG4B9QOwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB921876
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-11-2026 12:09 pm, Riana Tauro wrote:
> The firmware raises a System Controller event when its page offline
> queue is full and cannot track further pages until the queue is read.
> Handle it by draining the queue and offlining the returned pages, so the
> firmware can resume queueing new pages.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: rebase
> ---
>   drivers/gpu/drm/xe/xe_ras.c                 | 12 +++++++-----
>   drivers/gpu/drm/xe/xe_ras.h                 |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c       | 10 ++++++++--
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h |  4 +++-
>   4 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b35c77caeaae..4014945b47ba 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -483,11 +483,13 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>   	} while (common->additional_data);
>   }
>   
> -/*
> - * Retrieve firmware queued pages from warm-retained SRAM during probe. Handle and soft-offline
> - * each page as required.
> +/**
> + * xe_ras_get_offline_queue() - Drain page offline queue
> + * @xe: xe device instance
> + *
> + * Retrieve firmware queued pages from warm-retained SRAM and process each page as required.
>    */
> -static void get_offline_queue(struct xe_device *xe)
> +void xe_ras_get_offline_queue(struct xe_device *xe)
>   {
>   	struct xe_ras_offline_common response = {0};
>   
> @@ -1524,7 +1526,7 @@ int xe_ras_init(struct xe_device *xe)
>   
>   	/* Fetch the offline list before queue to avoid duplication */
>   	get_offline_list(xe);
> -	get_offline_queue(xe);
> +	xe_ras_get_offline_queue(xe);
>   
>   	/*
>   	 * During probe, process and log any errors detected by firmware while the driver was not
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 5d41c4543c55..5d24390c8f56 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -23,6 +23,7 @@ int xe_ras_init(struct xe_device *xe);
>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>   bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>   u32 xe_ras_get_max_pages(struct xe_device *xe);
> +void xe_ras_get_offline_queue(struct xe_device *xe);
>   int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>   				struct xe_ras_get_counter_response *response);
>   u32 xe_ras_get_info_queue_size(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 3239c110a66a..9afd2b231793 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -37,11 +37,17 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>   			return;
>   		}
>   
> -		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> +		switch (response->event) {
> +		case XE_SYSCTRL_EVENT_THRESHOLD_CROSSED:
>   			xe_ras_counter_threshold_crossed(xe, response);
> -		else
> +			break;
> +		case XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL:
> +			xe_ras_get_offline_queue(xe);
> +			break;
> +		default:
>   			xe_log_err_info(xe, SYSCTRL, -ENOPKG,
>   					"Unexpected event %#x\n", response->event);
> +		}
>   
>   		if (!--count) {
>   			xe_log_err(xe, SYSCTRL, -EXFULL,
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> index 348768ca454a..03bb34e279f0 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -14,9 +14,11 @@
>    * enum xe_sysctrl_event - Events reported by System Controller
>    *
>    * @XE_SYSCTRL_EVENT_THRESHOLD_CROSSED: Error counter threshold crossed
> + * @XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL: Page offline queue full
>    */
>   enum xe_sysctrl_event {
> -	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED	= 0x01,
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED		= 0x01,
> +	XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL	= 0x02,
>   };
>   
>   /**
