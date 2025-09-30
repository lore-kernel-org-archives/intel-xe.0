Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BD7CAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 08:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378EC10E514;
	Tue, 30 Sep 2025 08:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnv9/ppR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67110E520
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759220141; x=1790756141;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hrtVfGexI04FjIAjHO1vD59RKYkPPt2DZ+9MiZnqPC8=;
 b=gnv9/ppRlUR/93iy38nPu6sr1DhLS36R4/gXXtOA1/Jn9pBqcVUbCxEz
 JyHUvvZvr0sWGuwtATUZmvcfg+/SBMp9nDuscfSXS7fL1C2/HjD1bDnea
 7Fa6fiLzubHjBnVK6QzfC0x3IhSJ0tNhNa1dOp+Zk0n9vQPLsX5fk0FEh
 cAZkmXbpM5ZZ8ZqQsk8bbEGsr4m/ksmiPjLPSqjs6TS6TmQrd8xKCJ0Og
 6Nh3ZkxGElthal6DHoBKbLK8Mi7iGLMD6lvUhUCjaBEIdv/2V0ax/6Uag
 KA32GIMQaDX9XJTBNnZ9IQa8ZGq4M7CBwByx7wR4EXkCcUMKCzR9po6jb g==;
X-CSE-ConnectionGUID: hWcfkI5dT6al52mkcP8Yqg==
X-CSE-MsgGUID: Q3KemXl1Qd6RDXDYN/Achg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="49031742"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="49031742"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:15:40 -0700
X-CSE-ConnectionGUID: +FWGcja+QjW/ZtP0lmLLYg==
X-CSE-MsgGUID: N+WM7XlHTf227xqyNpPnCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178417541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:15:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 01:15:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 01:15:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 01:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QU9ldujgzE1QOUmJeKKD9yOk4LgAoG1y5UqZ+BHBGHDiuz3AFDCeMZdpGerjbmrXMjkbszTaOQK/WGENkWZ/gG2a+y+lgjVzNWZGq78VyYEqqs08yIyjtmtEsZW/7OUhk4kMTSe7JFhl03X3RshAnId7lD6t3WzamQ4MW1zXfczP6LiMZhKA19oAMTB2pkll+ilL7fIXxW5DOlWB50LVp4uaqknV1hGcBOhq2SQBRimIzzedifeRY00CdwsQJF4Wql0RQJSN4SY7Tul266qQTbAluFXqsJxjSvdiwaEyjnX/1Lq2DwEMAnpN2ubk4eihSXWJF0kupN0cEsy1CbyZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BFLAqZ7aC6ujxF5kWOXX8xDKkLMu8TswG3WxLBE4Hk=;
 b=VsdIPxMmYxEVPEFJAxoFD6fZ5/aSy3vty40/0FkWPGkKG0EnUZf8SSfh3tSjFIJeFunCFZ6wNWz3MPQj2kLZBxgY+eHokpLTtD2VQ6MJkGCRlXaDOi7jFNwsEjl8v2uJnxtlkpfTfFi7aEYXmKrwlchC1kI7fsZka2mVgOu+0t2PpYmCt//TXEE6nuFzXQU8p891wXalcse3A+iSbh5osGqVu46+iZ6z/z+7XH2Dago2ranCb3vs+eVpMiae0TRmdPB8WtqpXKMq+EAJnjqQcCMmWZBErFxiTUZd6RlOLXRwrF/P/yDnx+hVNmdrTVjS51a6fJGU8lttgQ2xTU3e/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 30 Sep
 2025 08:15:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 08:15:31 +0000
Message-ID: <449c4fc1-0b6f-4f83-91e7-53ffd3c5626f@intel.com>
Date: Tue, 30 Sep 2025 10:15:29 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/debu?=
 =?UTF-8?Q?gfs=3A_Avoid_use_of_wrapper_functions?=
To: <intel-xe@lists.freedesktop.org>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <175867966427.360509.16902292047990176768@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175867966427.360509.16902292047990176768@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a96b484-253d-49d0-dab9-08ddfff98610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW9DN1UyVjZVbzg0aTRJOGVOU0xiMG1yazFCdXd3eDBjUzdFU2NnTldwdmYx?=
 =?utf-8?B?RnBBRFNLaWJlVkNWZ21mZk5iS2d3TFdoK2sySVZXUzF2WXFndE0xYjU5SjJm?=
 =?utf-8?B?L1JTbEJZeU9XamhrbWFjbzRWb29SNVBoa2htTEh6WjY3QjNwMS9sWmNtR2JN?=
 =?utf-8?B?TGpLazJyZ2ZuSHNtQlVsM3ZaR1h3bjU3RXZpWWkxUUZZbTgxQ0JPd0E2bjE4?=
 =?utf-8?B?cWdzTEwvOEUwdkVCc09iU0RNUHhjVHRzeE5abDNtSVl4VTVray94VWZlc0VG?=
 =?utf-8?B?dUpBQmFvREYzZlUxVWdYaXRVVjAxcVpkZno0eHlxb1BEQnFKNW1BYTR3UnVU?=
 =?utf-8?B?bUNna3F0NStRelhvL0g1SG8vTEZ2bTBBS0JUOGNZQnR0bUxENWFKNWEwTm9R?=
 =?utf-8?B?anpSL1NQNVFwSkN0NFdKMzZvZTVZWFdhdnRqSnpOcE0zVmRpRVVXOGpFcDBu?=
 =?utf-8?B?VHNDcjd4MDcxYjVqZ09aT0wweHZlZHQyRjZrZUIvWks0RWtBZ1hueFFKRlBY?=
 =?utf-8?B?SDcvRjF2bmJrUktteEMwc0xrN24yYU9Fbk9vTy9QK29teVNOeHhwc3JtMFZr?=
 =?utf-8?B?Y3FUNlE2M2xQbE02U2lZSVZXRUlnVmJyQWNabW5YWm9DOURXdlgrWWdvdDMz?=
 =?utf-8?B?TURZRjRJSW42MHBSL3p3TksxUjI1QndWbkFJdHVCWEFyQ21SNENPeWRybFVT?=
 =?utf-8?B?Q1Z4MXJaL1VKcSs5dm5aaHVuRnNXVCtNbHhSWEg0cXJla2xwR1BUWDR3MFRB?=
 =?utf-8?B?UUR3QjVhTzNweVEwMHhnYzV4RWE3cWZTajYzc1ZJbWczdzA5Ym9RL3VEWkRH?=
 =?utf-8?B?cS94MlFYUFhBVE5OZk5xTy93VkI5QWRRM1RxRmswdzhqaXAvdm9DcGFtNmhR?=
 =?utf-8?B?aEVDL0ZpaWJVdkEvSDdnMXgyREJHQndBL1dsMDRkZGhJdW11K3ZtK1pRVnp0?=
 =?utf-8?B?MXFLY1dqd2RMNVRwcEw0RWJYZGZZWmNiSC9jbndkbDc0V3Blcm1xMExyU0R2?=
 =?utf-8?B?NjgwY2laRThyUmNOUzFZWkk2NHJzU3U0RUdsVkRGUE1mcG50ajhqTnJzREF5?=
 =?utf-8?B?bW9TRDZKUjBqQ29YZ2RZQ3dwN2s3d0xuSTVHMENGeUo4czljbkxad2NjdzB3?=
 =?utf-8?B?a3hPRzdtUmZpaXFES2hxeGJ6a1VERmQzNk05N3BtTUh0b0tuVStaVnJCa1ls?=
 =?utf-8?B?QVRHQjA3SnlBVHBpTnYxY2ZqTzBLM0VYem5yTUQ4Q2N6SDJUTXlHbklRZldV?=
 =?utf-8?B?aFVLcWxOQnMwN1pZTFlvM2NVcDJhTWQrdnpxYXpJNXVlcng4VWNwNFBXaGJr?=
 =?utf-8?B?QUJsa2tQSnVOYlFHc3FhM1FjeldtRjhNSG43bzJlMHpPWVlWaUdTOE9Ja3FB?=
 =?utf-8?B?dlFlV01GZ1VCeWc2VTNqVHp2M1d6bSs2dThia3A2anhqb1dPS0dhakVTazQy?=
 =?utf-8?B?aC9ZUkNKeGRMNnpwMnZyZGQ1b0lMa0VnMUlxTjNXSlZMUkhOd25oOUR3WjBJ?=
 =?utf-8?B?NEJxd0VKWnQ0S21aZUVablVOSVRGbnVuOXAwbDdVell4VzdCV1ppMmcxMHlF?=
 =?utf-8?B?NXQzdDZOaDdPdlZJZHFxSGJ3bzIxWmtob3JqQ3NIMjFmTmlDMVJCdkZkcVFC?=
 =?utf-8?B?eEFQUTYyL3JCYUF5QjBuRTNsNU8rdm55WTJrSHhmV2NsSmNpVHhma3NxM1BR?=
 =?utf-8?B?STlyMlYrdFhEWkNWczBGdjB0bTY4MXNLWE5XMjBGZU1IZnpLNlMxam1saVU1?=
 =?utf-8?B?N1pZRys1TUxEZ0VQQld3RUxCbnVSY1hWeEpUY251RFVLclEyM3haanRDSHAr?=
 =?utf-8?B?N2RvMFpZdmZucWdXV2FEbW50azJDT1JjTnp6Y1Qxd0QvV2NRQ2VyRmZudDJo?=
 =?utf-8?B?ZTJIL3dKODBHVFRHYURwSHlsbmZLMGhNK1F6dmhTOTBxeHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZ0Wk0wWTRPc1NRdnNQSVJMK0p6d0JHS3lKRzZaeGVSS3ZRWklZVjBGdFNw?=
 =?utf-8?B?K2VhUnlUOUtOeWtzSjdyNFdRMm43ZG4yMmpvSmVHNnd4ZzdLNVdVQStXNWs1?=
 =?utf-8?B?U1lKcDFYZDdWSmg3SkZ4NWtiR1lsYS9Da0xUd1J2SVZMN1I3dVp3VWM3cHFi?=
 =?utf-8?B?TmhKb1pRSmtraUNmOGlLM1FTeEJNZ055Vk5pMGFxcURqcGQ5OXF2bDk0YTdI?=
 =?utf-8?B?Zlc1VSt2a2w1VnpKVkxTZFpLUWkxQjhDMjhqQUlHdW53OWN5eEVZNlFlMDJ2?=
 =?utf-8?B?UkhpcHRFeFkybnpXcklIYXlpNW94VFRRRUoxSWtLRjNGaWFtZnhkSDd3SUI5?=
 =?utf-8?B?R3dyc1RNOEZjdmZpRUJncXdMblBIaTQ0RllmaU9yNHVYZkwzT0FTZFZkdy92?=
 =?utf-8?B?VE9ydDlKbGRBa2xZQ05pVFhIOVBDK3hSTkQwZjRUVEZqUVlTQm1mNDVsaGdT?=
 =?utf-8?B?UERwazY5enlYbHBUMFZBNTczK0s3WGVrcW5GYllkUG9NMk1CdjIzKzhOd0Qz?=
 =?utf-8?B?OU1lbTRQOHpORXAraGpvM1VTYWhZQ05venIzb0ZGUVZiaERSWkxPY1dtK1c2?=
 =?utf-8?B?UlUzT0w2dTd1dWJkdFRhTVNFdG03eFhJSnBRNHFQOXVRZUdPdDZvMTU2U2pV?=
 =?utf-8?B?S1RuM25lM3pTVGtXb2Q4alRza0gzZndqL0VWWHRJZ1NiVk9BNXg5b3N1bExh?=
 =?utf-8?B?SkVSY3o3dWo2YTM1ZGRNTy9ROVIwK040RkY2STFMdjZnSzBUdHJCLzhXTzZl?=
 =?utf-8?B?Z2REZmtpclh3enhzMEVXT1RXUFZhZ2MvaWVrYkFKMHNaY1FQaE53UjdQMHZV?=
 =?utf-8?B?NUNVeHNRcWord3FKdUZtWFYwT3VzeE9FeWtFWDQ3Y2JaK2JlYm9ZcjVsMGc3?=
 =?utf-8?B?dTMxK3g3SE11NWtyL2h5VzVLWXNXYnlFZmgxdGJSNXpuTFIweWFGSERhSTQy?=
 =?utf-8?B?UEtqME80OTlybnZHeXJLZ2pqcndiOHpkdGxiS2pQM2VhV1h6aWExdUJrTjB2?=
 =?utf-8?B?OTlrdEdDcitBa2NQektCMTlmQ3BVei9IcTl4d2xMZFIvZzV2Q29BeExMdXkv?=
 =?utf-8?B?L01HUEhqY2ROdnMzUVlzOTduZTkwT3V2M3BWZy9zaU02a3FVbUJZQXRpOEN4?=
 =?utf-8?B?aHR6TlByVVBUSFV6VllqR1NxNGNVeDRKbzl3VEZNS2Mxam42bnJIdGlBMElh?=
 =?utf-8?B?YkxnM0tHaWRDREphcUdFNzZXQ1pBb3NSZ3ZlajZ3cURPMDZrUmhCdC9TQ0hX?=
 =?utf-8?B?UzRLdXE0SDhaRStvRWZ0TFUvVUJ5dUNFcElnU1JsV0cvVlBkbWZuVzljaXdZ?=
 =?utf-8?B?L0w4SDZkaDROTUhSM2RrU3IvbkVRSUgwSTlWRTdlNFlqTnBCV3oyWjZKUFpG?=
 =?utf-8?B?Nk50Q2xnZVJZaW9mYTY3TERFWlNyQnpYcGJaODZXcFNVL2paT3lpNGF2c2JV?=
 =?utf-8?B?bkR4M2FZUnBHMTFyYkRiSkljL0JMN3ZxNlhGU2RhTytmWElGN2xRSWNBM2pI?=
 =?utf-8?B?VWRTYUtZRk15M3lIc3lmRWNGMGhMVElWODJndytNMGo3a3lkR2dIN2JzWG9S?=
 =?utf-8?B?ZytORk5aejJLQXBoeGJKWlZ4TjhycllqZVdPVEFwckxWVHl2QmdzSzFCZUFN?=
 =?utf-8?B?cU9Hck9UL3JZRWF6dnpmMEFoMHVoUTUxTUEzZTZYQUQ1V05nWGxTRWh3MzJR?=
 =?utf-8?B?SkJHZkI2S05iN0hGRHVpU0oraDN6SDdSaWFhVU5ZbjNyZFBSUTF0VktjNEFH?=
 =?utf-8?B?MmdRZWpBS1dwSWhGdTZYMTU3UFYyQTRTT1NaUU9VVXVvTXl0STNLN2JaRUpH?=
 =?utf-8?B?RlllWVoyaE9qZVBISmpzQUkxVkhqWkd0NEhHMU1nenBNUFBQdEJSUHVRVHlk?=
 =?utf-8?B?bFFzOVRrbGlkajA0c0ZrSWVLWDZpOGkwMmcrZTliT1dZV0s5ZVpyYW8vY3k0?=
 =?utf-8?B?SkUxVVlXQlV2dzJkNjBBWVQya01jVDdxdDhseno1QWJNajlRNzlaZHE2Tkl4?=
 =?utf-8?B?VHlMK0poNVJLK01Ga1U3dFoyTUQ1R2lxanFvUm5Yc05BVHczQStXTDZuSGRO?=
 =?utf-8?B?SEJvTXpMSW85WXJXN2Z1MDNnZVBoYUFpVXZNWUl5RVpMMnd6dUJabWNMZWJS?=
 =?utf-8?B?SXM2eVRuY2NDK3Uvc2MzQlRtMjlHYk5id0NsdnFyczJvd2pWQ3ZUUXFYc1p0?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a96b484-253d-49d0-dab9-08ddfff98610
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 08:15:31.9729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ev7Li3a5/uPqZgo3WJrs92HAoa6taTwKj1fhN+YRE3RZ80vLkejVF2B5SjKOvOfw9KHWcTK60UpGgrpdLGHCn8LbWET5j4lCIyuO/93GXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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



On 9/24/2025 4:07 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/debugfs: Avoid use of wrapper functions
> *URL:*	https://patchwork.freedesktop.org/series/154927/ <https://patchwork.freedesktop.org/series/154927/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154927v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154927v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3820-547682ff49fc0459e80b1dca71dcbfec7082b43b_FULL -> xe-pw-154927v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154927v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154927v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154927v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154927v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>

unrelated

(kms_cursor_legacy:6555) CRITICAL: Test assertion failure function two_screens_cursor_vs_flip, file ../tests/kms_cursor_legacy.c:1544:
(kms_cursor_legacy:6555) CRITICAL: Failed assertion: vbl.sequence <= vblank_start[child] + 5 * vrefresh[child] / 8
(kms_cursor_legacy:6555) CRITICAL: error: 437 > 428


>   *
> 
>     igt@kms_pm_rpm@system-suspend-modeset:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3820-547682ff49fc0459e80b1dca71dcbfec7082b43b/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154927v1/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html>


unrelated

runner: This test was killed due to exceeding disk usage limit. (Used 10532962 bytes, limit 10485760


>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3820-547682ff49fc0459e80b1dca71dcbfec7082b43b/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154927v1/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html>

valid, but unrelated

<5> [279.319264] FAULT_INJECTION: forcing a failure.
name fail_function, interval 0, probability 100, space 1, times 98
<3> [279.319276] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Failed to enable GuC CT (-ENOMEM)
<5> [279.319900] FAULT_INJECTION: forcing a failure.
name fail_function, interval 0, probability 100, space 1, times 97
<3> [279.319922] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: resume failed (-ENOMEM)

>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3820-547682ff49fc0459e80b1dca71dcbfec7082b43b/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154927v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html>

unrelated

<6> [250.985668] Restarting tasks: Starting
<6> [250.985994] mei_gsc_proxy 0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5464: bound 0000:00:02.0 (ops xe_gsc_proxy_component_ops [xe])
<3> [250.994550] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_ipc_send_receive_internal(): IPC receive failed: type VPU_JSM_MSG_PWR_D0I3_ENTER, ret -110
<3> [250.995118] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_pm_runtime_suspend_cb(): Failed to prepare for d0i3: -110
<6> [250.995656] Restarting tasks: Done
<3> [250.998764] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_pm_runtime_suspend_cb(): Forcing cold boot due to previous errors
<6> [251.002059] PM: hibernation: hibernation exit


