Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60570CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 04:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1871110E208;
	Thu, 14 Aug 2025 04:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNx0B820";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE87B10E208
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 04:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755145133; x=1786681133;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wbTl5F9+DLOxaqOFic5TMfE9mnqkson40nY0JzX2I/E=;
 b=iNx0B820J2LdWlkL35Z7h66+ieVjbJrT5hgUrQcMFdUIN34VlZ8E9IeI
 LQsQAXsmVdOQTnRSSOEOe4mHUCTuD7EAOx/TjHblR4//S9rjFfF5vq83F
 QcFXEth957xXxa2jFFRouneRD/3D9djLgXBSNt2q1AUydAiDBS76dXXSc
 YJA6C0QTiaXzrpoN/7BO4UYmOeUJaJcBCgd23A3saGxzRCVAlmaJ5iPa0
 z1uFZyVx/Q4ywKr/FJWfyE0FS02MFOYJ1n640nMbm6jOONOOUAps9KvTF
 VTvlpomCxQ0QoT9NtZj3yn5yAN9Ct93AAETzAGjsZDQbPoaqTFllbMgzy Q==;
X-CSE-ConnectionGUID: FF4IJeWiSnqLW1GP4/Em4w==
X-CSE-MsgGUID: QJhkDK0KSYif2QBEr6EV4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57321173"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57321173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:18:53 -0700
X-CSE-ConnectionGUID: Y95m9OztT+OiJ2vyD+NWmA==
X-CSE-MsgGUID: CQOrsAVbQeaxNhr/giByqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171890301"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:18:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 21:18:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 21:18:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 21:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7hGAmekBewVJzI9eblDonnn6m2wT4K/a19qILFBloK0Qew9OCuWKmaxexAy9QD30bXa3cnl3JS+7te8cMcliT7I5zpDQ6rvtTMesMd+5t77AI7M0ECpU02lnb6i/UKhkLPfA477Clm+v2zbvkW0uVqWitiA+ANX2EUGj06+JQ/BBrZiuDdtGsjr5WyzHMrvEv0uACrx3VCNWxXzufgsxzIqE2/YLntI/OXTU+gcYx2BfQpzo23UZx+ifOFa6eqa+F50CHMCXl98sPoftasHTCTQvZEOE1hAi1GUt4w1dtH49uIp9GvNM8rUr9jxwlaTe8JyEBgxXyzEXCUlRQetZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gKEmJYLrvLncsVh1m31RqgjakV4UzPy25mUjZPzyXw=;
 b=Z4HL9VBzqZVykrYpRyXnxVDrfg08ySW2w6hKS15HoS9vRDwLLVyBBY9SRJ/T6ZSIlxVeP0ao5RnyCpQOzdQDoYKEnhUAfD90ZqIvGN/drP6yt3vVAQbJ0ezqNIzCD9SVumFaTya75TXDND/rmpOwYCPvTBmbp/Fyd6RhwESFm9lQfvs1d09rNeOMX1WHuIDmF5hP5SDOC78YtDA2Ue0AcsCiNQjYPoOJm4dUgyu4puGq+5SVq33OmJmR4IQPwNkEJpQR3jDdd5kkT++jvZGjKStzOyxwtSEe46p+LuRPA2g9j0FS4zMqT2PIjdGcxXDCQ38Ig3eSUCHdy7+SqVl7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 04:18:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 04:18:47 +0000
Date: Wed, 13 Aug 2025 21:18:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 14/15] drm/xe: Convert xe_bo_create_pin_map() for
 exhaustive eviction
Message-ID: <aJ1jpOrhPEkIMA7r@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-15-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-15-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bccfd6a-3c5b-4bb0-d849-08dddae9a9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmpKOThyZVZEZzRSNW5JSlpmUUpSOUJQZVZrcDVNdmZXeEkvVy9SUW9JR0lt?=
 =?utf-8?B?ZXpodm84dnZvRXNBRmZGQXBqbTFvTENBa1NXcUlDaW02ZktGSHhFTlpMR2d2?=
 =?utf-8?B?WTVPdmh6MlBaa3ZwTURJY1l0SDZybGRlM1d6UUZnZGhOb1NjYlNDOXhsQnpz?=
 =?utf-8?B?bVJjNEwxSzdaS1JOMmRKdjZQVWttbmZBN2JabDQwNTA4ajRUT21pYlhPdWxu?=
 =?utf-8?B?eGppV3NZMzdYWFU0YU91WTk5bzN0eEtRRXduTEM2MXRtbFFCN2JwZm4vY2lF?=
 =?utf-8?B?SUMyVE1hY2VtTmN2bnhPNDVkbHFMRmRickgzdkhNcUxOVVhtVmE5TGNLNzkr?=
 =?utf-8?B?WVJ4TS91eWhuQUZuNjlmSnJOWllGcmYyTWZnVDAybU95dGI5RHRuRUNoUnRv?=
 =?utf-8?B?ZWs2TzFtYTdsQXZvejVCRFN0ZnhGcTc1cnoxS2FtNVdDMUZMTG1ubjc1dzN1?=
 =?utf-8?B?SjlHdnJDMllpeEhmRHplbHo5MjBPaXBiMmFBREZmSHh6SEhhYUc3Y0NvSCtR?=
 =?utf-8?B?MmdwTlExNzNVMEh2N2xEQjN5RWFwT1QxWmduNWQxcHQ2akkyNE5zSHJvNnVG?=
 =?utf-8?B?YkJSOExnUGIxcTVQSzNqVXlLa3JpY0Z4R284K0FwRUp4bmhYenllZkJQTFZa?=
 =?utf-8?B?d3B6M21yWU1GdEQ0L3AxV0RMTHgyVXYyd25xbVVXbXg2R3RuZGdSUVUwTXZ5?=
 =?utf-8?B?dC81d1hPaVBWYXlKNFJQRFFqbWN3c1R6ZTd5aUw3TVp2NkNjbVVVWWxyMWFD?=
 =?utf-8?B?d0NFaERjRmdsL2VlcWZuTDdGM2xvZGNLeFdCMnBJdFhRZUI2N0FNcGx1dkN1?=
 =?utf-8?B?cDJjak1lOHVuNFlLMGF0K0RIMUxEZUVQVFZMMFdvN052SUkyMjdLZkdvQmxq?=
 =?utf-8?B?WHBWdVNwY1VBSlVxeUNTMGVmQW02OW1NTUdWdEs0a0xpVkRDbzRSWHd0Qlhm?=
 =?utf-8?B?Z3phSjBZdGVMWjVSS25Xb1hoUnhwb2JhakZMRzhGbUp5TU5UVHhoZVQ1ZlE5?=
 =?utf-8?B?T09rOHJCOHkzRGlvQkRFdzREOXZnR0Zka1VjQjVqVEx3VVNNSHY4Q043MmJF?=
 =?utf-8?B?a0Q5M0IvTTZheVFjWjJCaXhoaVZkVjcxNDdzNVZEOGpGV2VWamJTOGtLcmFF?=
 =?utf-8?B?SkZyQ1RwTnNLTzZzczVqZ1V3aFR5R0N0ZXh0OGZhOFpVblR2WUViMWEyaGlX?=
 =?utf-8?B?dWFFUkFNcXQxZUk2TStkZGhxWjZjNVNabXdUUjZEbnFVTEsvbXBjbVlyclVt?=
 =?utf-8?B?WGlLaXVidy9pd3orei9nZC94R0xHMGNXd29kL0NZOUZOaGcyd2MzNXZnU3Z3?=
 =?utf-8?B?dUsvVVFlam1Nc25FT0hjWHBRSlNDSUIvM1Nacm9wbU9MdXdwMUl4emZIclJz?=
 =?utf-8?B?ZXZrbTYvZnpITjdUWmRZRlRGZWZnbjgxVit1b1I0RFZ6THE4RU1sejQvV3BV?=
 =?utf-8?B?bEU2eTFaRGJkK0FCcFY3Vk5heXBPMzBLaHowcHIyWWhla28rOFRMYk5URXRW?=
 =?utf-8?B?REJ1NHdUaUtRNzZBRlQ2Z0w2ZmxyRUlxd3lDMmozTVNha1RXU0hBdFR1THY1?=
 =?utf-8?B?M2pPN20yUkkyMzR1RG5zN3VRdTMyc3lWKzBBT29IbDZvWFlRaUozUkFaam5W?=
 =?utf-8?B?aTQ0VDVIbHQxaFlJZEpiY2l2OVIrRi80WnJTYTVpc2dYUE9vSmUrdUEyODJ2?=
 =?utf-8?B?S0xEWWlBZ0hibnVPVzhMR3dtU2g0bldoNmV2ckRiQWx0TnRzUjA5U2RVWCsw?=
 =?utf-8?B?QllhR2V1ZlA4c0NJYThvbitKNXE0SWxWcEdJWlNsRm5WZ2lHSEdnalZWb1l2?=
 =?utf-8?B?VERIeXRQT0JYMkJDMWRjcWlaT29Lc2ZLL0xUSDhNaTJMcGtUUzhYclJjdjU4?=
 =?utf-8?B?Z1h1QW5CaThSV3NiMFlJa2tpQm51MHNZZDhwdFRvUnkrdUNNYXFUNk5KT0JI?=
 =?utf-8?Q?ylSNF1xKeVU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkNKQlBLeGFKRTB3ZEFad0tVWHpXTTRUaFZtaEtQN2h1UFI3ZGpCMDZiOVY0?=
 =?utf-8?B?eGtvOXNwb0xTN2RFeUR4ZGFzdGRRTTZDUllRWXVQYUwzY3puZk1PdzByVExD?=
 =?utf-8?B?VERPRUFnTWwxK1pLYjcyOEZIMC9YL3BIeGFkZFJmeWxuOGJEbVhPTSs4eDZX?=
 =?utf-8?B?d3Bsa1MvUjk1aHZ6SWRLOVhXalE3czBhcjFKdGdLUW5wbFVHVXkvOThxSENZ?=
 =?utf-8?B?b2pJNmlWRkh2bFdoTk9iM1JFS1N2MkhsREorczdtQTJvTzBUVzBqL3d3RHhx?=
 =?utf-8?B?T1NPSW1lN3prS292N1dHK2g1WjZpQlVZTWt4d1NGQmNnZFFxaDR0L3JtN0dq?=
 =?utf-8?B?OGtoT3M5blNJSXN5cE5zb0lWNG1ha1h6RjVEV2tYbDJHSjFtZTBOZ05wbDRs?=
 =?utf-8?B?ZmJPcWhpZFQ1S0ZjSUhnS2lPc0NER0ZydVRMU2s3Z0tYSW9INlNTa2h4d283?=
 =?utf-8?B?d0ZoaWZPQ0RGN2Y4QUFYQzE4VkxEa3VDRmlVbVRFWXhFbHJOcW9EWUxHT2wv?=
 =?utf-8?B?QlVWd096UWhnUWhadE5xZzNta2wxNG1zMzVuaHE4ZW9ZYVZqOVprV1RMZGhN?=
 =?utf-8?B?WVlxWnZaODZiNFpncVh6OTd6UXRTYm5NeUl3emlhdDVFYzBuTUdGMmEwRjRV?=
 =?utf-8?B?SDVZTHQ1NGxsZHlLZ2NBUzN1V0hCaUpudkV4bVc0UDArb3p4dGtRajN4ZTd0?=
 =?utf-8?B?a3A4c2FiTWZXTlRMbzVwUGtBR3R3bEhCNTlhbWF0N1hiOFhVaTFMaDZtMHBp?=
 =?utf-8?B?aUxkbmd2MlloOE0yeERRNzBJWkpRYVFOZDgwSHdIYTVhbjN4eG1IdHY4Z3FQ?=
 =?utf-8?B?TCt5YWJ2TEZrbUVrTi9BSzYrTm40bEE3SnhqSFgvcmtZWHFKSXhacFRSSHFp?=
 =?utf-8?B?a0hjQmtlb2hMWk5XSTNpM2k3amNBdWlwOXVkYXN6TWVhdy92UGlhckptMUhL?=
 =?utf-8?B?cVozVTR3RWFCNmFRRERQdDIwYm40WUloSzNZdThjWFh1Ti9YVjdxaUlHdlpL?=
 =?utf-8?B?T1dKM3QxTFhGbzF5Ukoydk9kSUFib2VMZXBkNHgzTWJnOHkvSVpsVzVOYnNL?=
 =?utf-8?B?VUdnTVRpdzU5cnkrRnV6QloxYk1nSXZrbVIyZzBJSzlhbk5jLzFWZnY1U3I3?=
 =?utf-8?B?OGlWYWIrdGVkN1dNWC9Sd3RQcVFFSmhkYTFET2hHSWJhWXNYd25KdTdNTGQ4?=
 =?utf-8?B?SVJFdFFpcG1GaHY0bTYvdXVtYURVSXN5U1FGa1V4RlI2bm12SXczQnpXVHRK?=
 =?utf-8?B?eDZzZXNCTm9KMUdYcXp5NlFzMGhKYjBqVG5KMDhJbGhIMVlpUHJSZ1VweDQx?=
 =?utf-8?B?ZWlZVDNmTFZURm1ZYVNYU1RGTEN2ekR6MG5oRlBlUmpGTGNZbDNiZUlRYkY2?=
 =?utf-8?B?Q3BzM0Q4cmtlTFErSG15Mlc5dXR5ZjBOek1Senoyd0lXT0Z2UWVMMGtsUGd2?=
 =?utf-8?B?NVNvSTNXc2lYQ0NTYnhxN1ptVTg1V1YvRDNWQ1JQMDlJNFJIaUJsaUI5SlB6?=
 =?utf-8?B?SUIycDZFRlFwMWVGUVA4MGdLa0JNajBUTUxJOVFxdkdIbjVkbkxUWkJLWmFF?=
 =?utf-8?B?Uk5UWnh1TGxXQUNteWVlRUhvTjJ6YXMwVmF2SnZqeElXWDR4YU9XdFMzMVFX?=
 =?utf-8?B?emZHRmtYaDFNV1Q3VkwvS2xCdVp5T0pvSVZjTEVML3hHODBtamtwYTJyZlFY?=
 =?utf-8?B?VTdROElOVWluZmhVejltYVNKZHdlcDBHd3pWWlJ2OW53ZjZhMlJpemFsYmRU?=
 =?utf-8?B?OCtPTEFuUFVCTTBqeTBXQ0RlcVk2VVBhb1lNMmNZQWRvRzdFeFBGMGg1MFU3?=
 =?utf-8?B?dXhDcmdFTXd3NjJMV1Mxa0JaZW1kaUxkTVVZWXRBSDNpSGVROGlOMnJZOWg1?=
 =?utf-8?B?b2hHdDlvbGVnNFcyUzZmTERPYXJMVXZHdFhyUGo2bGtwUWxvdTA1cUREWlBz?=
 =?utf-8?B?UzhMUXl3YytKdWoyZEIyYWtrQzlyQk5SdjdEbTZJNnc1N2thWnloQzRKMVMz?=
 =?utf-8?B?NXNibFZLYnFYcThmck4xMytBT1V5OHBNTWwrZkFOQ0s1Q2NRVWVydFY2MFhk?=
 =?utf-8?B?THl3TzR4S1VkL1NHdnFKUjZvdzB2VEEwd3k1dVZNaGJZVUFpdzFEeklSeTdt?=
 =?utf-8?B?OUFUOVdhS3c3QS9OQ05SeFYvcmYzZVJHWStkMW5iV05HM1VNR01oZkFyVzda?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bccfd6a-3c5b-4bb0-d849-08dddae9a9e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 04:18:47.1442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcEQIOUZEAE9RxwzPi2T3ORUYVcddHXvKv8kenU1tt8WCPiwMl+GkJOeREP0e6GtVhSvi5ZFgL2vuyDAq5RtxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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

On Wed, Aug 13, 2025 at 12:51:20PM +0200, Thomas Hellström wrote:
> Introduce an xe_bo_create_pin_map_novm() function that does not
> take the drm_exec paramenter to simplify the conversion of many
> callsites.
> For the rest, ensure that the same drm_exec context that was used
> for locking the vm is passed down to validation.
> 
> Use xe_validation_guard() where appropriate.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  18 +--
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  39 +++---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |   9 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |  53 +++++++-
>  drivers/gpu/drm/xe/xe_bo.h                    |   6 +-
>  drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  24 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  24 ++--
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  13 +-
>  drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
>  drivers/gpu/drm/xe/xe_lrc.c                   |   7 +-
>  drivers/gpu/drm/xe/xe_migrate.c               |  20 ++-
>  drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
>  drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
>  drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
>  drivers/gpu/drm/xe/xe_pxp_submit.c            |  34 +++--
>  drivers/gpu/drm/xe/xe_vm.c                    | 119 ++++++++++--------
>  19 files changed, 252 insertions(+), 171 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> index d96ba2b51065..8ea9a472113c 100644
> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> @@ -42,11 +42,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
>  	obj = ERR_PTR(-ENODEV);
>  
>  	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
> -		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
> -					   NULL, size,
> -					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> -					   XE_BO_FLAG_STOLEN |
> -					   XE_BO_FLAG_GGTT);
> +		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
> +						size,
> +						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> +						XE_BO_FLAG_STOLEN |
> +						XE_BO_FLAG_GGTT, false);
>  		if (!IS_ERR(obj))
>  			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
>  		else
> @@ -54,10 +54,10 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
>  	}
>  
>  	if (IS_ERR(obj)) {
> -		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
> -					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> -					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -					   XE_BO_FLAG_GGTT);
> +		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
> +						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> +						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> +						XE_BO_FLAG_GGTT, false);
>  	}
>  
>  	if (IS_ERR(obj)) {
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> index 9f941fc2e36b..58581d7aaae6 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -43,11 +43,11 @@ bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *d
>  		return false;
>  
>  	/* Set scanout flag for WC mapping */
> -	obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
> -				   NULL, PAGE_ALIGN(size),
> -				   ttm_bo_type_kernel,
> -				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -				   XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT);
> +	obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
> +					PAGE_ALIGN(size),
> +					ttm_bo_type_kernel,
> +					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> +					XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT, false);
>  	if (IS_ERR(obj)) {
>  		kfree(vma);
>  		return false;
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d46ff7ebb0a1..d8e15ebb740c 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -102,32 +102,23 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  				 XE_PAGE_SIZE);
>  
>  	if (IS_DGFX(xe))
> -		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> -						   dpt_size, ~0ull,
> -						   ttm_bo_type_kernel,
> -						   true,
> -						   XE_BO_FLAG_VRAM0 |
> -						   XE_BO_FLAG_GGTT |
> -						   XE_BO_FLAG_PAGETABLE,
> -						   alignment, false);
> +		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
> +						ttm_bo_type_kernel,
> +						XE_BO_FLAG_VRAM0 |
> +						XE_BO_FLAG_GGTT |
> +						XE_BO_FLAG_PAGETABLE, true);
>  	else
> -		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> -						   dpt_size,  ~0ull,
> -						   ttm_bo_type_kernel,
> -						   true,
> -						   XE_BO_FLAG_STOLEN |
> -						   XE_BO_FLAG_GGTT |
> -						   XE_BO_FLAG_PAGETABLE,
> -						   alignment, false);
> +		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
> +						ttm_bo_type_kernel,
> +						XE_BO_FLAG_STOLEN |
> +						XE_BO_FLAG_GGTT |
> +						XE_BO_FLAG_PAGETABLE, true);
>  	if (IS_ERR(dpt))
> -		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> -						   dpt_size,  ~0ull,
> -						   ttm_bo_type_kernel,
> -						   true,
> -						   XE_BO_FLAG_SYSTEM |
> -						   XE_BO_FLAG_GGTT |
> -						   XE_BO_FLAG_PAGETABLE,
> -						   alignment, false);
> +		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
> +						ttm_bo_type_kernel,
> +						XE_BO_FLAG_SYSTEM |
> +						XE_BO_FLAG_GGTT |
> +						XE_BO_FLAG_PAGETABLE, true);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 30f1073141fc..4ae847b628e2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -72,10 +72,10 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
>  	int ret = 0;
>  
>  	/* allocate object of two page for HDCP command memory and store it */
> -	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM |
> -				  XE_BO_FLAG_GGTT);
> +	bo = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), PAGE_SIZE * 2,
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_SYSTEM |
> +				       XE_BO_FLAG_GGTT, false);
>  
>  	if (IS_ERR(bo)) {
>  		drm_err(&xe->drm, "Failed to allocate bo for HDCP streaming command!\n");
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index afa794e56065..5904d658d1f2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -204,7 +204,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
>  
>  	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
>  				   ttm_bo_type_kernel,
> -				   XE_BO_FLAG_VRAM_IF_DGFX(tile));
> +				   XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +				   exec);
>  	if (IS_ERR(big)) {
>  		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
>  		goto vunmap;
> @@ -212,7 +213,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
>  
>  	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
>  				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_VRAM_IF_DGFX(tile));
> +				  XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +				  exec);
>  	if (IS_ERR(pt)) {
>  		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>  			   PTR_ERR(pt));
> @@ -222,7 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
>  	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
>  				    2 * SZ_4K,
>  				    ttm_bo_type_kernel,
> -				    XE_BO_FLAG_VRAM_IF_DGFX(tile));
> +				    XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +				    exec);
>  	if (IS_ERR(tiny)) {
>  		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
>  			   PTR_ERR(tiny));
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c9928d4ee5a0..82bf158426ad 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2343,16 +2343,60 @@ xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
>  	return ret ? ERR_PTR(ret) : bo;
>  }
>  
> +/**
> + * xe_bo_create_pin_map() - Create pinned and mapped bo
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * @vm: The vm to associate the buffer object with. The vm's resv must be locked
> + * with the transaction represented by @exec.
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + * @exec: The drm_exec transaction to use for exhaustive eviction, and
> + * previously used for locking @vm's resv.
> + *
> + * Create a pinned and mapped bo. The bo will be external and not associated
> + * with a VM.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
> + * to true on entry.
> + */
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
> -				   enum ttm_bo_type type, u32 flags)
> +				   enum ttm_bo_type type, u32 flags,
> +				   struct drm_exec *exec)
>  {
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> -
> +	xe_assert(xe, exec);
>  	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
>  					       true, 0, exec);
>  }
>  
> +/**
> + * xe_bo_create_pin_map_novm() - Create pinned and mapped bo
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + * @intr: Whether to execut any waits for backing store interruptible.
> + *
> + * Create a pinned and mapped bo. The bo will be external and not associated
> + * with a VM.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
> + * to true on entry.
> + */
> +struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
> +					size_t size, enum ttm_bo_type type, u32 flags,
> +					bool intr)
> +{
> +	return xe_bo_create_pin_map_at_novm(xe, tile, size, ~0ull, type, flags, true, 0, intr);
> +}
> +
>  static void __xe_bo_unpin_map_no_vm(void *arg)
>  {
>  	xe_bo_unpin_map_no_vm(arg);
> @@ -2365,8 +2409,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>  	int ret;
>  
>  	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
> -
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
> +	bo = xe_bo_create_pin_map_novm(xe, tile, size, ttm_bo_type_kernel, flags, true);
>  	if (IS_ERR(bo))
>  		return bo;
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d06266af9662..802e3c7d7872 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -108,7 +108,11 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
>  				u16 cpu_caching, u32 flags, struct drm_exec *exec);
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
> -				   enum ttm_bo_type type, u32 flags);
> +				   enum ttm_bo_type type, u32 flags,
> +				   struct drm_exec *exec);
> +struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
> +					size_t size, enum ttm_bo_type type, u32 flags,
> +					bool intr);
>  struct xe_bo *
>  xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
>  			     size_t size, u64 offset, enum ttm_bo_type type,
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index f5ae28af60d4..83d61bf8ec62 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -136,10 +136,10 @@ static int query_compatibility_version(struct xe_gsc *gsc)
>  	u64 ggtt_offset;
>  	int err;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM |
> -				  XE_BO_FLAG_GGTT);
> +	bo = xe_bo_create_pin_map_novm(xe, tile, GSC_VER_PKT_SZ * 2,
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_SYSTEM |
> +				       XE_BO_FLAG_GGTT, false);
>  	if (IS_ERR(bo)) {
>  		xe_gt_err(gt, "failed to allocate bo for GSC version query\n");
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 906011671b60..d0a87d7b028b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1452,7 +1452,6 @@ static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
>  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> @@ -1479,24 +1478,17 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  		return 0;
>  
>  	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
> -	bo = xe_bo_create_locked(xe, tile, NULL,
> -				 ALIGN(size, PAGE_SIZE),
> -				 ttm_bo_type_kernel,
> -				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				 XE_BO_FLAG_NEEDS_2M |
> -				 XE_BO_FLAG_PINNED |
> -				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> -				 exec);
> +	bo = xe_bo_create_pin_map_at_novm(xe, tile,
> +					  ALIGN(size, PAGE_SIZE),
> +					  0,
> +					  ttm_bo_type_kernel,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_NEEDS_2M |
> +					  XE_BO_FLAG_PINNED_LATE_RESTORE,
> +					  false, 0, false);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock(bo);
> -	if (unlikely(err)) {
> -		xe_bo_put(bo);
> -		return err;
> -	}
> -
>  	config->lmem_obj = bo;
>  
>  	if (xe_device_has_lmtt(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index c712111aa30d..44cc612b0a75 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -55,12 +55,12 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL,
> -				  ALIGN(size, PAGE_SIZE),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM |
> -				  XE_BO_FLAG_GGTT |
> -				  XE_BO_FLAG_GGTT_INVALIDATE);
> +	bo = xe_bo_create_pin_map_novm(xe, tile,
> +				       ALIGN(size, PAGE_SIZE),
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_SYSTEM |
> +				       XE_BO_FLAG_GGTT |
> +				       XE_BO_FLAG_GGTT_INVALIDATE, false);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> @@ -91,12 +91,12 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL,
> -				  ALIGN(size, PAGE_SIZE),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM |
> -				  XE_BO_FLAG_GGTT |
> -				  XE_BO_FLAG_GGTT_INVALIDATE);
> +	bo = xe_bo_create_pin_map_novm(xe, tile,
> +				       ALIGN(size, PAGE_SIZE),
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_SYSTEM |
> +				       XE_BO_FLAG_GGTT |
> +				       XE_BO_FLAG_GGTT_INVALIDATE, false);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 92e1f9f41b8c..2b99c1ebdd58 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -94,16 +94,17 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo, *metadata_bo;
>  
> -	metadata_bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL, PAGE_ALIGN(metadata_size),
> -					   ttm_bo_type_kernel, XE_BO_FLAG_SYSTEM |
> -					   XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE);
> +	metadata_bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
> +						ttm_bo_type_kernel, XE_BO_FLAG_SYSTEM |
> +						XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE,
> +						false);
>  
>  	if (IS_ERR(metadata_bo))
>  		return PTR_ERR(metadata_bo);
>  
> -	bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL, PAGE_ALIGN(size),
> -				  ttm_bo_type_kernel, XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				  XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE);
> +	bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile, PAGE_ALIGN(size),
> +				       ttm_bo_type_kernel, XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				       XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE, false);
>  
>  	if (IS_ERR(bo)) {
>  		xe_bo_unpin_map_no_vm(metadata_bo);
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index a78c9d474a6e..4ad468574174 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -67,12 +67,12 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  		goto out;
>  	}
>  
> -	bo = xe_bo_create_pin_map(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt), NULL,
> -				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
> -					     lmtt->ops->lmtt_pte_num(level)),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> -				  XE_BO_FLAG_NEEDS_64K);
> +	bo = xe_bo_create_pin_map_novm(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt),
> +				       PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
> +						  lmtt->ops->lmtt_pte_num(level)),
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> +				       XE_BO_FLAG_NEEDS_64K, false);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		goto out_free_pt;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8f6c3ba47882..6d52e0eb97f5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1340,9 +1340,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (vm && vm->xef) /* userspace */
>  		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>  
> -	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
> -				       ttm_bo_type_kernel,
> -				       bo_flags);
> +	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
> +					    bo_size,
> +					    ttm_bo_type_kernel,
> +					    bo_flags, false);
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ddfad7506a82..fe0d15ab340e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -35,6 +35,7 @@
>  #include "xe_sched_job.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
> +#include "xe_validation.h"
>  #include "xe_vm.h"
>  #include "xe_vram.h"
>  
> @@ -173,7 +174,7 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
>  }
>  
>  static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> -				 struct xe_vm *vm)
> +				 struct xe_vm *vm, struct drm_exec *exec)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> @@ -200,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  				  num_entries * XE_PAGE_SIZE,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				  XE_BO_FLAG_PAGETABLE);
> +				  XE_BO_FLAG_PAGETABLE, exec);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> @@ -404,6 +405,8 @@ int xe_migrate_init(struct xe_migrate *m)
>  	struct xe_tile *tile = m->tile;
>  	struct xe_gt *primary_gt = tile->primary_gt;
>  	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	int err;
>  
> @@ -413,11 +416,16 @@ int xe_migrate_init(struct xe_migrate *m)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> -	xe_vm_lock(vm, false);
> -	err = xe_migrate_prepare_vm(tile, m, vm);
> -	xe_vm_unlock(vm);
> +	err = 0;
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
> +		err = xe_vm_drm_exec_lock(vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &err);
> +	}
>  	if (err)
> -		goto err_out;
> +		return err;
>  
>  	if (xe->info.has_usm) {
>  		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a188bad172ad..a4894eb0d7f3 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -883,9 +883,9 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>  {
>  	struct xe_bo *bo;
>  
> -	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
> -				  size, ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
> +	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
> +				       size, ttm_bo_type_kernel,
> +				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f3a39e734a90..33ad40418ceb 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -88,6 +88,7 @@ static void xe_pt_free(struct xe_pt *pt)
>   * @vm: The vm to create for.
>   * @tile: The tile to create for.
>   * @level: The page-table level.
> + * @exec: The drm_exec object used to lock the vm.
>   *
>   * Allocate and initialize a single struct xe_pt metadata structure. Also
>   * create the corresponding page-table bo, but don't initialize it. If the
> @@ -99,7 +100,7 @@ static void xe_pt_free(struct xe_pt *pt)
>   * error.
>   */
>  struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> -			   unsigned int level)
> +			   unsigned int level, struct drm_exec *exec)
>  {
>  	struct xe_pt *pt;
>  	struct xe_bo *bo;
> @@ -123,9 +124,11 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>  
>  	pt->level = level;
> +
> +	drm_WARN_ON(&vm->xe->drm, IS_ERR_OR_NULL(exec));
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>  				  ttm_bo_type_kernel,
> -				  bo_flags);
> +				  bo_flags, exec);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		goto err_kfree;
> @@ -589,7 +592,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	if (covers || !*child) {
>  		u64 flags = 0;
>  
> -		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1);
> +		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1,
> +					xe_vm_validation_exec(vm));
>  		if (IS_ERR(xe_child))
>  			return PTR_ERR(xe_child);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 5ecf003d513c..4daeebaab5a1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -10,6 +10,7 @@
>  #include "xe_pt_types.h"
>  
>  struct dma_fence;
> +struct drm_exec;
>  struct xe_bo;
>  struct xe_device;
>  struct xe_exec_queue;
> @@ -29,7 +30,7 @@ struct xe_vma_ops;
>  unsigned int xe_pt_shift(unsigned int level);
>  
>  struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> -			   unsigned int level);
> +			   unsigned int level, struct drm_exec *exec);
>  
>  void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>  			  struct xe_pt *pt);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index ca95f2a4d4ef..54bd6b64dc6d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -54,8 +54,9 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
>  	 * Each termination is 16 DWORDS, so 4K is enough to contain a
>  	 * termination for each sessions.
>  	 */
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
> +				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT,
> +				       false);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		goto out_queue;
> @@ -87,7 +88,9 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_validation_ctx ctx;
>  	struct xe_hw_engine *hwe;
> +	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	struct xe_bo *bo;
>  	struct xe_exec_queue *q;
> @@ -106,15 +109,26 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>  		return PTR_ERR(vm);
>  
>  	/* We allocate a single object for the batch and the in/out memory */
> -	xe_vm_lock(vm, false);
> -	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> -	xe_vm_unlock(vm);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		goto vm_out;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
> +		err = xe_vm_drm_exec_lock(vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
> +
> +		bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
> +					  ttm_bo_type_kernel,
> +					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED |
> +					  XE_BO_FLAG_NEEDS_UC, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			err = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			break;
> +		}
>  	}
> +	if (err)
> +		goto vm_out;
>  
>  	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
>  	if (IS_ERR(fence)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 989d84c2e82f..b3ee65126841 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1606,6 +1606,7 @@ static void vm_destroy_work_func(struct work_struct *w);
>   * @xe: xe device.
>   * @tile: tile to set up for.
>   * @vm: vm to set up for.
> + * @exec: The struct drm_exec object used to lock the vm resv.
>   *
>   * Sets up a pagetable tree with one page-table per level and a single
>   * leaf PTE. All pagetable entries point to the single page-table or,
> @@ -1615,20 +1616,19 @@ static void vm_destroy_work_func(struct work_struct *w);
>   * Return: 0 on success, negative error code on error.
>   */
>  static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> -				struct xe_vm *vm)
> +				struct xe_vm *vm, struct drm_exec *exec)
>  {
>  	u8 id = tile->id;
>  	int i;
>  
>  	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
> -		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
> +		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i, exec);
>  		if (IS_ERR(vm->scratch_pt[id][i])) {
>  			int err = PTR_ERR(vm->scratch_pt[id][i]);
>  
>  			vm->scratch_pt[id][i] = NULL;
>  			return err;
>  		}
> -
>  		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>  	}
>  
> @@ -1656,9 +1656,26 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
>  	}
>  }
>  
> +static void xe_vm_pt_destroy(struct xe_vm *vm)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	xe_vm_assert_held(vm);
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (vm->pt_root[id]) {
> +			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
> +			vm->pt_root[id] = NULL;
> +		}
> +	}
> +}
> +
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  {
>  	struct drm_gem_object *vm_resv_obj;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	int err, number_tiles = 0;
>  	struct xe_tile *tile;
> @@ -1745,49 +1762,64 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  
>  	drm_gem_object_put(vm_resv_obj);
>  
> -	err = xe_vm_lock(vm, true);
> -	if (err)
> -		goto err_close;
> +	err = 0;
> +	xe_validation_guard(&ctx, &xe->val, &exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
> +			    err, true) {
> +		err = xe_vm_drm_exec_lock(vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
>  
> -	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> -		vm->flags |= XE_VM_FLAG_64K;
> +		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> +			vm->flags |= XE_VM_FLAG_64K;
>  
> -	for_each_tile(tile, xe, id) {
> -		if (flags & XE_VM_FLAG_MIGRATION &&
> -		    tile->id != XE_VM_FLAG_TILE_ID(flags))
> -			continue;
> +		for_each_tile(tile, xe, id) {
> +			if (flags & XE_VM_FLAG_MIGRATION &&
> +			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> +				continue;
>  
> -		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
> -		if (IS_ERR(vm->pt_root[id])) {
> -			err = PTR_ERR(vm->pt_root[id]);
> -			vm->pt_root[id] = NULL;
> -			goto err_unlock_close;
> +			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> +						       &exec);
> +			if (IS_ERR(vm->pt_root[id])) {
> +				err = PTR_ERR(vm->pt_root[id]);
> +				vm->pt_root[id] = NULL;
> +				xe_vm_pt_destroy(vm);
> +				drm_exec_retry_on_contention(&exec);
> +				xe_validation_retry_on_oom(&ctx, &err);
> +				goto err_close;
> +			}
>  		}
> -	}
>  
> -	if (xe_vm_has_scratch(vm)) {
> +		if (xe_vm_has_scratch(vm)) {
> +			for_each_tile(tile, xe, id) {
> +				if (!vm->pt_root[id])
> +					continue;
> +
> +				err = xe_vm_create_scratch(xe, tile, vm, &exec);
> +				if (err) {
> +					xe_vm_free_scratch(vm);
> +					xe_vm_pt_destroy(vm);
> +					drm_exec_retry_on_contention(&exec);
> +					xe_validation_retry_on_oom(&ctx, &err);
> +					goto err_close;
> +				}
> +			}
> +			vm->batch_invalidate_tlb = true;
> +		}
> +
> +		if (vm->flags & XE_VM_FLAG_LR_MODE) {
> +			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
> +			vm->batch_invalidate_tlb = false;
> +		}
> +
> +		/* Fill pt_root after allocating scratch tables */
>  		for_each_tile(tile, xe, id) {
>  			if (!vm->pt_root[id])
>  				continue;
>  
> -			err = xe_vm_create_scratch(xe, tile, vm);
> -			if (err)
> -				goto err_unlock_close;
> +			xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>  		}
> -		vm->batch_invalidate_tlb = true;
> -	}
> -
> -	if (vm->flags & XE_VM_FLAG_LR_MODE)
> -		vm->batch_invalidate_tlb = false;
> -
> -	/* Fill pt_root after allocating scratch tables */
> -	for_each_tile(tile, xe, id) {
> -		if (!vm->pt_root[id])
> -			continue;
> -
> -		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>  	}
> -	xe_vm_unlock(vm);
> +	if (err)
> +		goto err_close;
>  
>  	/* Kernel migration VM shouldn't have a circular loop.. */
>  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> @@ -1820,7 +1852,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  				      &xe->usm.next_asid, GFP_KERNEL);
>  		up_write(&xe->usm.lock);
>  		if (err < 0)
> -			goto err_unlock_close;
> +			goto err_close;
>  
>  		vm->usm.asid = asid;
>  	}
> @@ -1829,8 +1861,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  
>  	return vm;
>  
> -err_unlock_close:
> -	xe_vm_unlock(vm);
>  err_close:
>  	xe_vm_close_and_put(vm);
>  	return ERR_PTR(err);
> @@ -1959,13 +1989,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	 * destroy the pagetables immediately.
>  	 */
>  	xe_vm_free_scratch(vm);
> -
> -	for_each_tile(tile, xe, id) {
> -		if (vm->pt_root[id]) {
> -			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
> -			vm->pt_root[id] = NULL;
> -		}
> -	}
> +	xe_vm_pt_destroy(vm);
>  	xe_vm_unlock(vm);
>  
>  	/*
> @@ -3845,7 +3869,6 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>   */
>  int xe_vm_lock(struct xe_vm *vm, bool intr)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;

You add this earlier in the series and then delete it here, which seems
odd. If the intent is to apply a workaround (WA) earlier and finalize it
here, that makes sense.

However, deleting it here appears to leave a problematic path in
xe_svm.c around xe_vm_range_rebind, where vm->validating._exec may
remain unset/stale. I’m surprised CI didn’t catch this—perhaps due to an
unbalanced xe_vm_set_validation_exec leaving stale state—or I’m missing
something.

Matt

>  	int ret;
>  
>  	if (intr)
> @@ -3853,9 +3876,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
>  	else
>  		ret = dma_resv_lock(xe_vm_resv(vm), NULL);
>  
> -	if (!ret)
> -		xe_vm_set_validation_exec(vm, exec);
> -
>  	return ret;
>  }
>  
> @@ -3867,7 +3887,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
>   */
>  void xe_vm_unlock(struct xe_vm *vm)
>  {
> -	xe_vm_set_validation_exec(vm, NULL);
>  	dma_resv_unlock(xe_vm_resv(vm));
>  }
>  
> -- 
> 2.50.1
> 
