Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC2FCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 01:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F4F10E077;
	Wed, 13 Aug 2025 01:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWD04tZo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D6D10E077
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 01:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755049276; x=1786585276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E4pNBO2PtnFY5NCjpudbR8FSY/5llcDPBOF03+yE1GY=;
 b=UWD04tZofO6ZjarY0zngK7pOaMWLth3KY48ifsVVH/EV/wTedWRdd1xa
 c0vj1tW8AGeTAZmSqMSq2oNKRFQrYJ8prkqFObfhWEKa4H7nm0GqyvR4y
 0YFd7hkBEfuaj7XQB/T4P6vHGlIqka/1TgqAEVZ8IpODNfh8w6CxrEl3U
 ocLvYeLtzw3pFsF0dm0pZxTb0w5kULz3U/7UbsJC0rs6kaAM0K3t4XvKT
 6RmwwzdhHdg7HZ4u2tlNBorM+SEUGR4iK3clha71iStowBPPf0TxOEV4r
 L4gwQkYgL5r+F/biaPpbmEjasWYj3WHsvl5HejqRkCD5qNKFd7Dpjrom6 Q==;
X-CSE-ConnectionGUID: BA7+JotATgqRwEoXzrHp7g==
X-CSE-MsgGUID: ZOfI1DB/QWy+kUwy+oKE5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57412530"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57412530"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 18:41:15 -0700
X-CSE-ConnectionGUID: NrDBhvQaSh+3fiJS2fm8cQ==
X-CSE-MsgGUID: lhRnccJoQO6eWvQR03VuRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="190041138"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 18:41:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 18:41:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 18:41:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 18:41:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFCYfNoIlxmhluEYbB/IR7LhEO90HUiuvfjone8tr6yOe26fvZauXwYnXwKfZZS35DicZLZ42ad7gkqRMTBTmvswbmV9hmDTiWMoJ8ZkUv/O53h+ZQb0lp/NOTkpY4JdZujN4GbbM2e1GBdUOD6W3N+nQHzDnBYn/eRaBxx5/EphuCjtMm1oAuj9XISri0oO3wf0Yog53jnAs0XLqXqOZWYpDmmew1Dox934AzINMuM3s41jzYASIZuE5B2Jn4EiBnMzK0OMXeNOj6GPYFVPX82VkB1S73MkDXCTWfS3zMXUA4vmOuMws6+Ld3LAClJbE3AsIDJBRZ7N7l+zCwQHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2tebX02bYtRZt+YO87ddAOGK30H8NytOeuoeVddsa8=;
 b=Iovpmv6U1F4HV66ai7zOxad8Kd9ABAfKDhi2ng7KM4svCaut+bwBvv8WxL1RuTxe49KcISnkJDG1l4fjj0u/eitzTQZJkf6wbYiePp7dldrqH03ethyy6SDQieVULD43EBgb+fy9QVkjOfqDjTcLv5VBlwDjwZBtrPyHKjvWK5fPl/Be67LSh9cJcr3avQxReyvdGu0rJkclb+7F2PLm9dkyiq7JJvf3BNukuq7OwIgJYdZrSa7iCGRyhZIN3eGo4DPA4u4mEhU5JNZP/qkq6CvPzlqu7RJPCJLnq9/+iz1z1VuWwAgBGM5837GU/HDRsqro9uz/1hy0929CxP+TyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 01:41:09 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 01:41:09 +0000
Message-ID: <fa2e340a-be16-4a68-90f9-30cdef23e148@intel.com>
Date: Tue, 12 Aug 2025 18:41:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] drm/xe/psmi: Add debugfs interface for PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Brian Welty <brian.welty@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-2-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250808-psmi-v3-2-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 618fe5b9-6a18-414c-1f57-08ddda0a7a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2F4MnIrVFBMMmp0cEVnVFBaZjZDdUpDMVFkTUQ4YzlubktzUW44anpiMER4?=
 =?utf-8?B?QTZNSUtCc211SkNrUHhFZmMxNFB3VEJPemovL2NLcGI1MnNhdHJFR2VwVjA3?=
 =?utf-8?B?VGdVZEJubUVDTExtRjY4NjhjYjNUdFRRUldJOUZwcE05QzZrK3BsM1I4U0NB?=
 =?utf-8?B?M1ZwSEV0azlJVnZBUjd3SVVGRG81eHZnSXFXZEZWSXpEWjl6MlI1UDVCM3RE?=
 =?utf-8?B?YlJiZlpaSDl2aGVRT2Jad29wMlhjY2NKVDE0TVYwMEV3ejJtNzN6Y0tyVXFy?=
 =?utf-8?B?eEo0blNsS2RzVmJ1VVF4blpkZHRPY3ZpcmF0VkVnWDBhcjB3ZjhjOUhMSVFT?=
 =?utf-8?B?NHJvY3ZXUTJ4eGJJMUVuS0VkcnBXOXBqS092cWYraWtudE1seVRFOU1nWm9y?=
 =?utf-8?B?cWN1dEsyNWUzaXZXTXRZaExoZUErYXp0MzBPYzh3dzVJenlnRjhkaFZFZWh2?=
 =?utf-8?B?czhMVmxURVlwZkxScVp2SGF3YURIeDV3clBjdG5qRHlPMnBmcEFjb203L0Jz?=
 =?utf-8?B?S3o3WFltNURNc2s5VG5NVnBFUitBOGtJei82Z3k2R2Y0VjhBdGFoOExqYzJJ?=
 =?utf-8?B?a0RPVkFORk5TMkZSdnUvMkVoMDJIc2syQVNRb1g0M1NhUWJxQ0tIamhUVnVT?=
 =?utf-8?B?TnhoaFl3Y3ZWMnJLUWdZYU1wM3dxbVVycDBzYzYzd3NoajVhU2Z2UEsrcHla?=
 =?utf-8?B?TDJxc3ZZaGpaN2lLOGkzM2FsTWNsQmlpYU8vaCszc2pqdzNxYi85Rmx3cEho?=
 =?utf-8?B?cVF5RmRScjBHK2Q5MXJnTktmS0thRm45VWFFby9SMTU0b2plTWhIWDAxaWsw?=
 =?utf-8?B?c2xaWVdsNlhBeDV1S2FBT0MwSnZDb1RQREJCL3lxdUhmTjF6WitDUmtwV1Rr?=
 =?utf-8?B?VURWUU5xNk0rcDdtTzhhbmhuTDAyRGJSNjBKRFhRa2FMaCtzUVYwOWxiMkox?=
 =?utf-8?B?Zmw5dFF4NkhBaERWWVN4Z1Z5L1lHRnBaWG1kbmY0ZXhkdTJ0SXpobkZ1a1ZW?=
 =?utf-8?B?c3pnQzZPeXVBc25zaTVlOVV3Y25sYS9PMm9VcFRCbUltaXlQKzVlYXlNSmZw?=
 =?utf-8?B?ZHpLS1BIdm9Dd05jc1JyMXVFRVZ4cmRNckhiOFh1WGY3MkZNZlhUK2UwS1BI?=
 =?utf-8?B?M2RQenJXVit6ZEVsMFJyQ1ZmS3ltRUdLaGcrUnROVjExZjBxTWRoM0Rnaksx?=
 =?utf-8?B?Y2RVU3hzaFZJZkg4MXllT012UkxJTTdmVVQ5VkZPQ05Fc3lycTJWMU1DZGov?=
 =?utf-8?B?NmRYSjg2ZHAvbnhHYU9GOHdaOVRQYkVmZVpkbWl2MFI4RGJoUHEraFdpbjVk?=
 =?utf-8?B?dkdNOHhhWDVReXVpRGZsNmcxSXZ2Y0dIbnZxRGJHT1Y0dW1xT21HZ2UxVkpF?=
 =?utf-8?B?aVh6TDdUVWJEVWNRMWtnL1JRT2lOMWFQYUNLUHc4YlNEbldDRzVEc1hORGJa?=
 =?utf-8?B?dTBKQjQ3M05yOHFuVTBRQUFyUEdMWHd2bFRPRFJmREM5NUV2Q1ZRWnVGbE51?=
 =?utf-8?B?OTRVaEI4OC9sd0VJVzlrQkFaV3FmMDlpaUdyWWZBeTFrWktWUWtlNGdkSE5v?=
 =?utf-8?B?T3Z2SndmMWhuTnA0cCtIOHVscjZqc2RIdlRXKzVMRXlhR3ErS0kzQlUwMGVq?=
 =?utf-8?B?blo3YW15b2hhdXdFZDc5YVc2U1VhVXZjaEFBclBEUDBtQkZaSzZ3YTRnT3Rz?=
 =?utf-8?B?eUFFWDdhc1F4dldXZjdPS2NrQWJjZFhBMkVMa3lGMnBwWG5yT2tXSGVjaE5J?=
 =?utf-8?B?UHRSNUN3bWlPNDQ5UnBwc2hRSlFkTVRLWEFNZ3RKamhZNFhxVkx4YjJVNm9N?=
 =?utf-8?B?ZjFycVZ5K3VwMVpwQTlIRDdhMVltaUtFaFRHMEJhNG1lL1YzWkpRejBMTGY1?=
 =?utf-8?B?ZS9sWFZMTWJaUWs3WGJFY1V2YWx4N1pJN1U2L3NzcHk2dG1hWDNNQUVyb0xH?=
 =?utf-8?Q?om4A5+PJK8w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzFNQW8zeWdsVU5QbXk0emVpWkxtRUxSaHNZbmk5TERPOXp4a2FDd0tPaGUz?=
 =?utf-8?B?Wm43YVlsT2lqUjY1TFZ1cEd6WjU0SW1IalJsSmZNcnIwMGxudmpxRDQwYjNn?=
 =?utf-8?B?WEdkNS9XZXVnOGNaNldESFc4cUJuSGlWRjk5N2xUUkJSamlERmpaYVkvNy92?=
 =?utf-8?B?R0Z5ZG9HREUrN2VJZ3VwOVBybUxScUt6Kytici9QcUphVG5VOUJrNVFqbk5O?=
 =?utf-8?B?d1I3U3FxdXBEd01QVWV6dHVhZFloMjcyenRPak1WSDlMUVo0VTBud3VwUlJ5?=
 =?utf-8?B?Mk5WRmFOZnZNczlsT3FraHRGdkY1bjRBRmsrZ2dYWHc0RlgwZnNpdTgxSWNh?=
 =?utf-8?B?dmhjTDFpZkJKaE8vcGQxMC8xOXJKTHVzZW5UczJDT285eUxOY3VKdk95M3Bs?=
 =?utf-8?B?R2FRdmJ1SXZsMVgrRlN2V0hCVjc3RnBOT1lORFR3K1Mxb0Z2MmsxOGZtSSt0?=
 =?utf-8?B?ZjRVTXRxSFpGWWo1Z21PQ1pVN1lFY1Z6UGtuNjBqZTFjQkgxN0lHelBRc1ZK?=
 =?utf-8?B?VHVDYmtleDhFODl1R0tqSm1BZkpQNVZ3empjN1M3Tkd1L2k2cUlzSU5LUkRh?=
 =?utf-8?B?L2NmYWNMWUJtY3VuempiOGh6czhaWCtGcnF2bmF5cVpheHNVQUJGOHhDVzQy?=
 =?utf-8?B?UUc5bHo0Zm1wVGpPWUhrMFRiYStHTC9rUUZ5Z0ZsWEZtYzFKM05xbXU0Mmkv?=
 =?utf-8?B?TmlieTlwcGlzMVhyOFVSSlhPZTJwNGhuczJJbzNRUlRKLzJyWjRmL3VEVS9T?=
 =?utf-8?B?WC9nZUpUNCtiUTdPMm1nNnREblF3b1NnWEVDUFhuM0NOT1dUV0FqeVdvckVl?=
 =?utf-8?B?b0NzWVRCaDU1cW5nQzdJWk9QUFFLcy96Z1BkYTZXajB3VnJ3N1BYMEZCei90?=
 =?utf-8?B?VjJjbjRBV2pIRmVMcmVNdUdRTmtJSFIrS3NEZmcycUtyajFrNThMaUxNM3JW?=
 =?utf-8?B?dnoyNFYwZDB6azlLSStiVGFlZHMxQXE5a3k4SkRPQkVHdmNRSDBuNUQzWU9l?=
 =?utf-8?B?Y0tzVHcveVNVekh0d0VrQ1BVbGt3MUF0djV1Smg1Y1VhSHBDY0lLbURwMzZN?=
 =?utf-8?B?UVdSUWI2aFlxS3pISG5nVHpNbDZveDEwT2V4R2oxSmo1M1ZwVDI0bVZGdGJw?=
 =?utf-8?B?U3lIOUxJd0FnNC91QjIyemxMTXhPR2hzUEdzQWZwV2hac2t4aklHMDVUU01H?=
 =?utf-8?B?bHZqNE45Wm4rRGM1cTJQTmxzM1RhYnJ2dER1K3JwMWV4dDdFWkJORkNreDRO?=
 =?utf-8?B?TGlCRVVtcGVaT0tGTXVUVnZFbkVXNEdmK2p5d1hORXlmSzJYUU1lTlgzVVNo?=
 =?utf-8?B?UURNNEZHZUlTNUlOZUdFK0xhekJhQjAyRzNndTFabm1INGZHL1FGRTBXZjlW?=
 =?utf-8?B?NnljTGwxUTBIU3NsQ2t1REFtWDVmV05RNHhRdjk4TzlUL29qenRVZksydzdH?=
 =?utf-8?B?aWpZWk9lMmhRdnJaWm1XRmhNeG01UGpaTm1iNmtBVWNabmpuWmdOQjZza3Jq?=
 =?utf-8?B?T3ZBdkdnTTlQNVhZYkgrMXRYN212Nm52R0NBRmEwQy83TEU1SXM3NFA5S2tz?=
 =?utf-8?B?QTU3WnNFTmQvVFYvQnBaVlV3OU0veXRPaEFnUnZVSElhZUFMU05mSGdjMlpy?=
 =?utf-8?B?TkxqS04zVFFyenl2ZHlXS2lYVUkwd1VHL0xkWXArUVhjT0U0M3hOOFBzdFZw?=
 =?utf-8?B?c09EQjRMN0Z4ZlJ4YVR6YTEzMUx5THdwV2NUNDRwdkt5ZzFkWmF6MmxZVlhZ?=
 =?utf-8?B?RVhyU05sK095Tm5TOHF6RmpQaitTblBPR3NmQktaZDY2RzJaelNPeWVGL29R?=
 =?utf-8?B?MVQvWnlMTGU1Tjgxb2kxbFdQZG92UFVtSk5CNmFwblVqVHYwZnd1bjdqQlpU?=
 =?utf-8?B?ZTlrL3VVYzQ0ZmxiTndkeXF3MmhkMUx3dFpwZldoNkhISlZEaDhkd0p0NDFT?=
 =?utf-8?B?ZzdNc0NDUEh1blZrc2d4MnB5aml6L1Q0UGI2cCtWYkNXRnNjYnlySXBZOUF4?=
 =?utf-8?B?Rm9oOTkxbVVMUE1jNVlBRXRDVFZBZitBWHJuY29IMWFMWXF4cGJVSFVwNHVy?=
 =?utf-8?B?UkJHeTZEZWhycWJOUFR4d0ZiYWh5dHRTQUE3QUx0bXZDVEt4VGlIbE9BRHN1?=
 =?utf-8?B?dEczZlN2QmdwdzYvRC9leW1jc0RUQ3BvQ0E5eVA2YTI2TTBsRVJrRjVQbHNo?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 618fe5b9-6a18-414c-1f57-08ddda0a7a66
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 01:41:09.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENmbvBtVLo2d7rhJcH4kD8OR9fSa6c8XD4UquKB2DAQkCe7CaJKBqygR+D+W7Mlr429vEUwQvmtcQMNMlqa6jXWj91OFdk1znFfLFx1ndMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
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


On 8/8/2025 10:29 AM, Lucas De Marchi wrote:
> Requirement for PSMI capture is to have a physically contiguous buffer.
> All the needed configuration is done by the userspace tool directly to
> the GPU via mmio access.
>
> This interface only support allocating from VRAM regions. For integrated

NIT: s/support/supports

Other than that, LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> devices, the PSMI buffer is in SYSTEM memory and should be allocated by
> userspace using hugetlbfs.
>
> Here we add the ability to allocate a region of physically contiguous
> memory by writing to debugfs file (listed below). For multi-tile devices,
> the capture tool requires ability to allocate a capture buffer per tile
> (VRAM region) and so user can specify a region_mask. The tool then
> can mmap the buffers via direct mmap of the PCIBAR via sysfs.
>
> To support the capture tool, 3 new debugfs entries are added:
>
>     psmi_capture_addr - physical address per VRAM region's capture buffer
>     psmi_capture_region_mask - select which region(s) to allocate a buffer
>     psmi_capture_size - size of current capture buffer
>
> Writing psmi_capture_size will allocate new buffer of requested size per
> region after freeing any current buffers.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Original-author: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
>   - Fix kernel-doc
>   - Do not walk all region_mask on cleanup: it should never be needed
>   - Replace sysmem checks by asserts as they should never be set
>   - s/debugfs_create/debugfs_register/ and do not pass the root dir:
>     this makes it similar to other parts registering debugfs
>   - Do not export a cleanup function, rather use a init that registers
>     a devm action if needed
>   - Drop modparam in favor of configfs whose attribute will be
>     implemented when everything is ready
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_debugfs.c      |   3 +
>   drivers/gpu/drm/xe/xe_device.c       |   5 +
>   drivers/gpu/drm/xe/xe_device_types.h |   8 +
>   drivers/gpu/drm/xe/xe_psmi.c         | 313 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_psmi.h         |  14 ++
>   6 files changed, 344 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757c..85b8d3a59ef07 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_pcode.o \
>   	xe_pm.o \
>   	xe_preempt_fence.o \
> +	xe_psmi.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 0b4a532f7c45c..bc717519502dd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -20,6 +20,7 @@
>   #include "xe_guc_ads.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
> +#include "xe_psmi.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_pf.h"
> @@ -400,6 +401,8 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_pxp_debugfs_register(xe->pxp);
>   
> +	xe_psmi_debugfs_register(xe);
> +
>   	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>   
>   	if (IS_SRIOV_PF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f4..62edb39b61fb0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -54,6 +54,7 @@
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
>   #include "xe_pmu.h"
> +#include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_shrinker.h"
> @@ -908,6 +909,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_psmi_init(xe);
> +	if (err)
> +		return err;
> +
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f7..bf9af8d0b84ae 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -576,6 +576,14 @@ struct xe_device {
>   	atomic64_t global_total_pages;
>   #endif
>   
> +	/** @psmi: GPU debugging via additional validation HW */
> +	struct {
> +		/** @psmi.capture_obj: PSMI buffer for VRAM */
> +		struct xe_bo *capture_obj[XE_MAX_TILES_PER_DEVICE + 1];
> +		/** @psmi.region_mask: Mask of valid memory regions */
> +		u8 region_mask;
> +	} psmi;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
> new file mode 100644
> index 0000000000000..e6a67e85e1bb2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_psmi.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_configfs.h"
> +#include "xe_psmi.h"
> +
> +/*
> + * PSMI capture support
> + *
> + * Requirement for PSMI capture is to have a physically contiguous buffer.  The
> + * PSMI tool owns doing all necessary configuration (MMIO register writes are
> + * done from user-space). However, KMD needs to provide the PSMI tool with the
> + * required physical address of the base of PSMI buffer in case of VRAM.
> + *
> + * VRAM backed PSMI buffer:
> + * Buffer is allocated as GEM object and with XE_BO_CREATE_PINNED_BIT flag which
> + * creates a contiguous allocation. The physical address is returned from
> + * psmi_debugfs_capture_addr_show(). PSMI tool can mmap the buffer via the
> + * PCIBAR through sysfs.
> + *
> + * SYSTEM memory backed PSMI buffer:
> + * Interface here does not support allocating from SYSTEM memory region.  The
> + * PSMI tool needs to allocate memory themselves using hugetlbfs. In order to
> + * get the physical address, user-space can query /proc/[pid]/pagemap. As an
> + * alternative, CMA debugfs could also be used to allocate reserved CMA memory.
> + */
> +
> +static bool psmi_enabled(struct xe_device *xe)
> +{
> +	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
> +}
> +
> +static void psmi_free_object(struct xe_bo *bo)
> +{
> +	xe_bo_lock(bo, NULL);
> +	xe_bo_unpin(bo);
> +	xe_bo_unlock(bo);
> +	xe_bo_put(bo);
> +}
> +
> +/*
> + * Free PSMI capture buffer objects.
> + */
> +static void psmi_cleanup(struct xe_device *xe)
> +{
> +	unsigned long id, region_mask = xe->psmi.region_mask;
> +	struct xe_bo *bo;
> +
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		bo = xe->psmi.capture_obj[id];
> +		if (bo) {
> +			psmi_free_object(bo);
> +			xe->psmi.capture_obj[id] = NULL;
> +		}
> +	}
> +}
> +
> +static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
> +				       unsigned int id, size_t bo_size)
> +{
> +	struct xe_bo *bo = NULL;
> +	struct xe_tile *tile;
> +	int err;
> +
> +	if (!id || !bo_size)
> +		return NULL;
> +
> +	tile = &xe->tiles[id - 1];
> +
> +	/* VRAM: Allocate GEM object for the capture buffer */
> +	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
> +				 ttm_bo_type_kernel,
> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				 XE_BO_FLAG_PINNED |
> +				 XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +
> +	if (!IS_ERR(bo)) {
> +		/* Buffer written by HW, ensure stays resident */
> +		err = xe_bo_pin(bo);
> +		if (err)
> +			bo = ERR_PTR(err);
> +		xe_bo_unlock(bo);
> +	}
> +
> +	return bo;
> +}
> +
> +/*
> + * Allocate PSMI capture buffer objects (via debugfs set function), based on
> + * which regions the user has selected in region_mask.  @size: size in bytes
> + * (should be power of 2)
> + *
> + * Always release/free the current buffer objects before attempting to allocate
> + * new ones.  Size == 0 will free all current buffers.
> + *
> + * Note, we don't write any registers as the capture tool is already configuring
> + * all PSMI registers itself via mmio space.
> + */
> +static int psmi_resize_object(struct xe_device *xe, size_t size)
> +{
> +	unsigned long id, region_mask = xe->psmi.region_mask;
> +	struct xe_bo *bo = NULL;
> +	int err = 0;
> +
> +	/*
> +	 * Buddy allocator anyway will roundup to next power of 2,
> +	 * so rather than waste unused pages, require user to ask for
> +	 * power of 2 sized PSMI buffers.
> +	 */
> +	if (size && !is_power_of_2(size))
> +		return -EINVAL;
> +
> +	/* if resizing, free currently allocated buffers first */
> +	psmi_cleanup(xe);
> +
> +	/* can set size to 0, in which case, now done */
> +	if (!size)
> +		return 0;
> +
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		bo = psmi_alloc_object(xe, id, size);
> +		if (IS_ERR(bo)) {
> +			err = PTR_ERR(bo);
> +			break;
> +		}
> +		xe->psmi.capture_obj[id] = bo;
> +
> +		drm_info(&xe->drm,
> +			 "PSMI capture size requested: %zu bytes, allocated: %lu:%zu\n",
> +			 size, id, bo ? xe_bo_size(bo) : 0);
> +	}
> +
> +	/* on error, reverse what was allocated */
> +	if (err)
> +		psmi_cleanup(xe);
> +
> +	return err;
> +}
> +
> +/*
> + * Returns an address for the capture tool to use to find start of capture
> + * buffer. Capture tool requires the capability to have a buffer allocated per
> + * each tile (VRAM region), thus we return an address for each region.
> + */
> +static int psmi_debugfs_capture_addr_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = m->private;
> +	unsigned long id, region_mask;
> +	struct xe_bo *bo;
> +	u64 val;
> +
> +	region_mask = xe->psmi.region_mask;
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		/* VRAM region */
> +		bo = xe->psmi.capture_obj[id];
> +		if (!bo)
> +			continue;
> +
> +		/* pinned, so don't need bo_lock */
> +		val = __xe_bo_addr(bo, 0, PAGE_SIZE);
> +		seq_printf(m, "%ld: 0x%llx\n", id, val);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Return capture buffer size, using the size from first allocated object that
> + * is found. This works because all objects must be of the same size.
> + */
> +static int psmi_debugfs_capture_size_get(void *data, u64 *val)
> +{
> +	unsigned long id, region_mask;
> +	struct xe_device *xe = data;
> +	struct xe_bo *bo;
> +
> +	region_mask = xe->psmi.region_mask;
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		bo = xe->psmi.capture_obj[id];
> +		if (bo) {
> +			*val = xe_bo_size(bo);
> +			return 0;
> +		}
> +	}
> +
> +	/* no capture objects are allocated */
> +	*val = 0;
> +
> +	return 0;
> +}
> +
> +/*
> + * Set size of PSMI capture buffer. This triggers the allocation of capture
> + * buffer in each memory region as specified with prior write to
> + * psmi_capture_region_mask.
> + */
> +static int psmi_debugfs_capture_size_set(void *data, u64 val)
> +{
> +	struct xe_device *xe = data;
> +
> +	/* user must have specified at least one region */
> +	if (!xe->psmi.region_mask)
> +		return -EINVAL;
> +
> +	return psmi_resize_object(xe, val);
> +}
> +
> +static int psmi_debugfs_capture_region_mask_get(void *data, u64 *val)
> +{
> +	struct xe_device *xe = data;
> +
> +	*val = xe->psmi.region_mask;
> +
> +	return 0;
> +}
> +
> +/*
> + * Select VRAM regions for multi-tile devices, only allowed when buffer is not
> + * currently allocated.
> + */
> +static int psmi_debugfs_capture_region_mask_set(void *data, u64 region_mask)
> +{
> +	struct xe_device *xe = data;
> +	u64 size = 0;
> +
> +	/* SMEM is not supported (see comments at top of file) */
> +	if (region_mask & 0x1)
> +		return -EOPNOTSUPP;
> +
> +	/* input bitmask should contain only valid TTM regions */
> +	if (!region_mask || region_mask & ~xe->info.mem_region_mask)
> +		return -EINVAL;
> +
> +	/* only allow setting mask if buffer is not yet allocated */
> +	psmi_debugfs_capture_size_get(xe, &size);
> +	if (size)
> +		return -EBUSY;
> +
> +	xe->psmi.region_mask = region_mask;
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(psmi_debugfs_capture_addr);
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_region_mask_fops,
> +			 psmi_debugfs_capture_region_mask_get,
> +			 psmi_debugfs_capture_region_mask_set,
> +			 "0x%llx\n");
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_size_fops,
> +			 psmi_debugfs_capture_size_get,
> +			 psmi_debugfs_capture_size_set,
> +			 "%lld\n");
> +
> +void xe_psmi_debugfs_register(struct xe_device *xe)
> +{
> +	struct drm_minor *minor;
> +
> +	if (!psmi_enabled(xe))
> +		return;
> +
> +	minor = xe->drm.primary;
> +	if (!minor->debugfs_root)
> +		return;
> +
> +	debugfs_create_file("psmi_capture_addr",
> +			    0400, minor->debugfs_root, xe,
> +			    &psmi_debugfs_capture_addr_fops);
> +
> +	debugfs_create_file("psmi_capture_region_mask",
> +			    0600, minor->debugfs_root, xe,
> +			    &psmi_debugfs_capture_region_mask_fops);
> +
> +	debugfs_create_file("psmi_capture_size",
> +			    0600, minor->debugfs_root, xe,
> +			    &psmi_debugfs_capture_size_fops);
> +}
> +
> +static void psmi_fini(void *arg)
> +{
> +	psmi_cleanup(arg);
> +}
> +
> +int xe_psmi_init(struct xe_device *xe)
> +{
> +	if (!psmi_enabled(xe))
> +		return 0;
> +
> +	return devm_add_action(xe->drm.dev, psmi_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_psmi.h b/drivers/gpu/drm/xe/xe_psmi.h
> new file mode 100644
> index 0000000000000..b1dfba80d893d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_psmi.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PSMI_H_
> +#define _XE_PSMI_H_
> +
> +struct xe_device;
> +
> +int xe_psmi_init(struct xe_device *xe);
> +void xe_psmi_debugfs_register(struct xe_device *xe);
> +
> +#endif
>
