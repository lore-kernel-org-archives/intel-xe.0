Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFBDD358E0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCED310E819;
	Thu, 29 Jan 2026 08:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wb1l9mGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE7B10E819
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676958; x=1801212958;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=81TK3RQ2qeZn3S34XUV6fud8dT2IIq37qJco4GGWO1A=;
 b=Wb1l9mGvd3W2PzturzzpqPyyO+nKuI77kg4hiuADDOrRNS4akfj+GHuY
 72wM8ghoEKnqqF0Xu3CevGgZsdSgjVVt+JyL/NAmMCQcIi1NvIBWmsCEf
 Ppz9rYFtcFMpBayeC2fpzQqWn/2feYz4y4NOcoHkVK+uoQ6zVljlRVio4
 BBtQHOIRV2JUTLKrXDrncca3yyz8RPFuKUpBpl1G5UNZVLsyuaxfqUfLp
 cTJPPO51f1eoG5XUr8Dp4jyW7eYspbHW8h23W+iOYohVfCJPQlf3zxLxz
 1Lm+CoJY33UNDe/TH+kKsCvyf0fL5ILuTGQkZrveV290rKXgGqDCVbLBB A==;
X-CSE-ConnectionGUID: ud8lAw05QM21oX4QwUFPbQ==
X-CSE-MsgGUID: B8nrHbf+SlyDZdUlGQovDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81221031"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="81221031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:57 -0800
X-CSE-ConnectionGUID: vtlRJCIBQvGw/7R3L3R4Fg==
X-CSE-MsgGUID: 4y+2Y+4jTjClvnb3b69grw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208411379"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:55:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:55:56 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYgMbEsbRbKUWBIxtpf3kzoVLzc2JSpLqbuKx/26NEE3cfPw9QxjVlpyHezQ/EsHku0p6f8kwBfsoaZ1vnXQy5Qqir2HWUkgMwGtAGX7DYhYPCh50fjQekyd8t5+DccL3YYpZDj7isijgx/BQ3nnyNj+EtoV6re8PdaUfIJyusVwap1gVBeO/o/rOtNAv0rIPrJlT762tlRYHgXpq5Cz20oqP2qRud3UndGZHYvv+DRJ7ulifS45J9qE3XSt/Mw1oXIBrvDJsEmyKDnF0uRzijiTbV0xeToRNBDTiygPOflIV0Qbaj5DmRcSzsBPe9qu6pnHivywAz6ndhBOUkKQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta0MLEuOjeX04vqB2by4XfceM1hz5/ks72wSqCsKE+I=;
 b=ZWVkEF6bd+redqxhufigtDf+gAhykCe51BXDwDGGE6pof1giaU5rTIs3Vx0CHIZjYagTdXQ7CehHHspw3zQOY02U58HsQlqP32CpB2LAMgR3qZqDr+VMkh1KvTDYnaRpwVqiSHVvKWSw37KtlOwKLtUJ0ZgHrwlHNYeXq9Bxek638C4IBmik1rD2ATcS/sHlpqlpXzp9VF9H1SB9Z/ujTtdSfyH0gW34KkcTvWV3cYcbm7tay0n7zKI22lq+pRNl3aNUfuAliuLgbhU/VrcWkJ9x3mCgjdwf8KkOphrtkswxa3zRwLnRxdItBjvU2MukcxypvXrOm9i978HCsnxVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by LV8PR11MB8511.namprd11.prod.outlook.com (2603:10b6:408:1ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:55:53 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:55:53 +0000
Message-ID: <533415d0-a773-4687-b332-f405df7d8a73@intel.com>
Date: Thu, 29 Jan 2026 14:25:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260128115134.657091-4-sk.anirban@intel.com>
 <20260128115134.657091-6-sk.anirban@intel.com>
 <16461473-6334-435f-b8f9-5f8759af740f@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <16461473-6334-435f-b8f9-5f8759af740f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0208.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|LV8PR11MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 08250795-f13c-46aa-c4af-08de5f14355f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2dVVGJXaU1iYVJFMkZ0VWIxaHJJcEdob20yZkc5ZFU4V1pScUtDSHFLSkJG?=
 =?utf-8?B?SkNFVGh3RWw5WmppbDdyd1VUaEhXYTVMeUxHMUhuSmQ3aWtqVTFPVWlrUk5B?=
 =?utf-8?B?OXRpVmRQbTRhRWRhTklPWXU5cm40eGhiVU1qNkZicjZ6VDhYSzc2MU9qNExS?=
 =?utf-8?B?MVluVUljQ0JFdVBTcGdFVktYMlpUN0FOS3lxcUdvS2lmV3dPdGp6WGRia1RX?=
 =?utf-8?B?OGJkVWhkWGZ3MnNCSlFjaHNVYmJOZ2xxK2NSTkNFaDFIMFJEOGc4QzZ2RUF2?=
 =?utf-8?B?cFpIMXpoVUNQbjJDVG4veWxLQjNOUTd4OVBYeVZjUHNBMGNPYU9BenB0UStK?=
 =?utf-8?B?cDlxTU9ZcDlDbTVMTThpL1R4dFF5YXNyNzVSczRMY0hqeklwMXcxakZXNTJP?=
 =?utf-8?B?SDM0M3NoWWxRL29DVTFWM3NvMmpObDV0aDJaeUdmbDc4SndueHNjMGk1Y3VP?=
 =?utf-8?B?TVVzVlYrK1VtMnZnM0ppU0dKY3VMcStGVmtvL2FpbGhEY0s3am1JREVyWkRE?=
 =?utf-8?B?T0VwZENsSE8wRzBuS1VZNTRYY1BJQ2JoMndZRzFGcGRUa3MrYnBCUk52TXNB?=
 =?utf-8?B?VlE5aVpnSGJ1dlRuL01PMWJ2OUoyT1Fram1qSjI0YkhFTHZRSmJuNE01SXds?=
 =?utf-8?B?SVFHNUxSM3BpYWlXQW02R2dsNCs2QnI3M2tJajJDQitFa2pNQm1yUmRBRHVl?=
 =?utf-8?B?SjN1bXZEVS9kZWxvUUNtVFdaUi82YThGNVk4VHVkcFpVTFNsVzNJWXNnS251?=
 =?utf-8?B?OXltQXNVQXpEZUNyR0NicWxkOEo4WmRpNDVCWngzWHJwQW01RnNHL3lydXhr?=
 =?utf-8?B?a3Z1cUxEU0dLd3BEN0JNQlVPYWFpWEVwakxZRzZYQUttaG1DYWx3MjNRdkNY?=
 =?utf-8?B?amxXY1dXT2FhNmhUeDhpcnZVY2FpQjdQQVhOM2NmZHd4Ukt0TXdnaXdKeXlX?=
 =?utf-8?B?RUY2TUlVWERVQlkxbEErQTFGRkRSVFRpVTRPMlFSdnEvSitlS2MzWmkwRDBC?=
 =?utf-8?B?bnhYK2RKSWc4dkRGVHhiWUZxQWczNnhMWVVtK20wRW9oU0pKamoxM2d2Y3ZI?=
 =?utf-8?B?bkxjR3MwZ0JFUDJ1QnFYbDBIUGZaUWNEN1V6SVhmeXZQdk1tdG84TkpQQTlT?=
 =?utf-8?B?TVJBd3JEdVZIa3V5b0FaTWx5YjRKZy9HcnR1UGtyakoxWUFkNW1oYUViVGVy?=
 =?utf-8?B?Z1kzZ2s2K2Y2QTE0Z1NhdFlrdjIrcFBrcnJKb2Q0SzduRGMxVkU3WVJxS0RP?=
 =?utf-8?B?UGVBOHdNTGYwSVlmallRVHZMOENBc2VSdjB2Z01mNUJaTk9pdHZhTlUxSm1j?=
 =?utf-8?B?L1NlMzlhNmlKeUU3SlBraU1PRWpnd1hLRnBsVC9yUEErUG9LTk80UDA2ZytV?=
 =?utf-8?B?YjBMOFA3MURYMTMzTVptMDdHelpxQmxNTmc3cC9tRHZKdC80KzM1Um1JN2Vv?=
 =?utf-8?B?STNDRTVSY2pIcmlqVHY2OGo0bFVVTkhHd2dTbm10ZGJuSWEwbnJWeEF5Kzdw?=
 =?utf-8?B?QzdUQVFtNFBsei81WC9ta0hGRStBQ1VRS0dUN2ZRNFBxVUZndDFmNEZ6cDBn?=
 =?utf-8?B?c0FMcHIrVklqeFRJOHdyRmNxeWpCemJlUDQySkNOa1pVUWtLTVZMcTQyc2tn?=
 =?utf-8?B?R01ENzZFVDVzM2pndkc0SzVwRzZjQ05ENDQ4ZXZFTlFmTmIxRSs3cmR4UFN2?=
 =?utf-8?B?YzI1clFobDkwa3pFOHBOcVNWWkRlMVpRSWJ6TVVaamoxQXc0UmlRNFZqNnVn?=
 =?utf-8?B?UG1ZNi9TNWQ0RzczMkdHaDhEVXJvQVhyZzdGdjFxTkpRVUlMTFYrZ2ZVNFlY?=
 =?utf-8?B?U3dTdHM5SnU5YUd6WlplNksvcHhNS0ZwcVRyL25HSENpbWgrOHp6SkgrUk52?=
 =?utf-8?B?bW5vK3F4UXZ2UGFSQXpaL2FQczZERmtVUlFOdy90MEMxY2JWa091d3ErM3Bv?=
 =?utf-8?B?SGsvTS9VbTRadTRTWFhMV1YxM1FNbWNRVDRWNEdTanhzYUxNSzBBV3dieGFU?=
 =?utf-8?B?dzNpaGFXQ2xBM0VzWklSQko0K093V01RUEhZeWpJcm5UNlA5eGt6RDk2Uk5H?=
 =?utf-8?B?aEw1OXlJc3JJbXBid0ZhWWxzMTJVeVJwOFhWQlBiUUYvZlN3bU1aRWdpVS9P?=
 =?utf-8?Q?jWkc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJ0TmtoMWVpSGE1MVptcFhMZ1Jwb2ZKZkFQZmRYbzMwaG1UdUgzd1V0QjYx?=
 =?utf-8?B?M1Vod0l0SlBsRGVuR1BobVVUYTRNc3A5N3E2L2JkaCt0QlBKZDB6Vks2UEJ5?=
 =?utf-8?B?djJ1Q3U3MEtaMEVsLy8xUWZKdVQyTVg0cGRDdUFFdnpLSWdYYyt4NTJ3Q3Iv?=
 =?utf-8?B?UXRKNVh3M0dPbWowQ2JvWC80U1hPSmlseWhzYkZPL2ZJNnFhZGVaSG5ueW96?=
 =?utf-8?B?SXB3d1czYnRXRjdCSmVVUDlla1lzbldvVlBlNWdsQlJMbGwzVm5qQmNUaElo?=
 =?utf-8?B?QWJtcHJqakNCWVc1TzBSS2N2L2Y2blNIdzhWSUlHRGVxdkRsbktaeVVkbGU5?=
 =?utf-8?B?a1JCMi92NDA3NEw3QUk3U2o5NldzVnJQSmt0UTdheW9qYks1Z3dOWHl0QnVB?=
 =?utf-8?B?SDF4OVp0TEVCQmJBcDlycDdNbnhVNjh2eXY2SjdkNVhTUlBRL1hwVDJWeC96?=
 =?utf-8?B?WnhORlpjL1ZudWp0SmcvV21oaStwazlkSnprUUwyU0VNa3hwcVptanp1Uytw?=
 =?utf-8?B?YThCRStDVHVWLzJYQTNGQjlJdTQ3cXh5N1Vvc3RQNGw4Z2xMenprS3RPNCt0?=
 =?utf-8?B?eDgyV0xSQThuanN1T0J1YnNTVkYyL3VPQWhTb05KTWhaMG5sNWI5STVpT3Q1?=
 =?utf-8?B?MlNsSkowc2FCOGtUekd0clNyYnJsbzZiRlV5Q0IvczF2S2VHbUM5REZsNGkz?=
 =?utf-8?B?aDF6M0RDZjB5TnFDOW5Xbjh0Z0RTcDIwdlRZbDdKWFNnVkhtMEFLRFgzT2tk?=
 =?utf-8?B?TEtwc096eFh0N1BnVEtVcytDcHBJMnUvTm1tVEg4QWo4MFJMbHBXckVKNTJQ?=
 =?utf-8?B?UmQyOU1sRjlmaE1vSGxEZVJ1RENHTEVTdW9nb1IvNklzcE5kdWZxVUdpOUVR?=
 =?utf-8?B?UE0wK1VCZkZIZkhPMTlVVjlJb0xpR0hEeFVrd2Mxb1FLUXR4NDN2QmFlenpT?=
 =?utf-8?B?UWV5aUFkdXlEaXJ1bFlDWDlHa2Y1bXVGNEdnN3BwRHlNVFhneGEya3I5aTJR?=
 =?utf-8?B?QTlEcXl5MVo5VWF4dk0wUHA1dzBtTEFQVXZKMDVmblBJbmVKK1VUZ0dROVVw?=
 =?utf-8?B?Qmc1ME9pZ1BWaEo1L2liOXFpcDB6aElFK3dvSkhydlByK0JWdFk3THdaRVhh?=
 =?utf-8?B?OFloai9CQlRYMlhrc3dySUVydlZRNUhsbHJzK3I5QW5zZDdyR0FVMXFFSUhr?=
 =?utf-8?B?RlVyM29FY1lCbkl1SzFXSTZxQ3BHSkhGdDhGMnEzRGtKYTNDUGVJUGJmNVZM?=
 =?utf-8?B?QnRseERDYlk0Z2VGNWExQ2d1UGc2YkxaYmR3VFIzNFJiQ2dORGUyNGg1d1ly?=
 =?utf-8?B?Z3h5Wlk5alpXVi9adzJUMktpVW1wK2U5S2tGVHE1VFIxcUYzU0MzanlWZnor?=
 =?utf-8?B?c0txczVybVFxKzhNMEFPL0dWd2l1OWNuYUZJK3ZwTHZpdVhPeGxnSkROVmw3?=
 =?utf-8?B?VUowdmNBOXB2bkJIK0JsdDVOTUxDWmVvaFBXYm00TDQvL3pGbmVjS0trR05W?=
 =?utf-8?B?NFJ4OXFENjAzQjlXNytid1dmbGZkaW5aTk5ZVEY1UjNlMkcrUlRiN0kxQlBj?=
 =?utf-8?B?K0N3bUM2SHV2ckRRdzB2bVNMWnlxZkhTWlFTWE10TU9ZUXZ2TzRPQlBzQ2pv?=
 =?utf-8?B?M0FDa0xpVDJQdkVwNmxBdXNuRU01Ky9CRENUZ0d1RFpuL3VIcEN1bWUwc2Nv?=
 =?utf-8?B?YkprV0JJYWVuNXFvM2t6TzhndE5VVk4zUjd1SDhYS1NqRE96UU5kaGovUG0y?=
 =?utf-8?B?WGxmSjZFUVNHbmpvUHp0WnZDUnJraWZPSXNtTTlhRUhFMlZvYzF4U2JSQjNB?=
 =?utf-8?B?bWJyMDlVQlR0VlZFRFZSMzN2RkxFdkhIY2t3Q0pvMk52TVpybU1iSEdCSkNM?=
 =?utf-8?B?MW40QWxoeW9GR3VRc3NkaTFsUGYrYUhiZFgxYStPUVRxQXFQYktYajVySTZ2?=
 =?utf-8?B?MjhFd1JLb0lLOG5UYXJFOG9YVVZvVmQwcEJ6anl2RHlYN3dlRTMrckVkaEZ0?=
 =?utf-8?B?T3JyVEpUaUNPMGI1RE5JUDJuU2JNdlZYOUo3eEw3emdaa2FtOXhrUkFCYkx3?=
 =?utf-8?B?SDBaZFNGQWdVbEx0SzR5Qjh5MDgvRE9rL0hjTHNWRlQvWHFEZ3ByTkYxYmMz?=
 =?utf-8?B?TTdCMkVkUThjaWFmKzlwUlBBR1lXemxpWnplbjdWOC9PQ0lmakZaNkNrQmR0?=
 =?utf-8?B?a0tqM3ZQRHJhbHFFNExQUmN0WHpUWmxIR3pHaE9iWnNua2g2VUlBK3NHNlJr?=
 =?utf-8?B?WUZ2d0p6TTFOeFhDNUZ3QVh1SzlqYXRQR1Q1TUVwYmhvdjVqQVFnZC82R1lU?=
 =?utf-8?B?Vi82Ykc4ZGlRVHVQVXJVcGt4aS8wcFEwRTk3dENkaGFhdnJMeUtQQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08250795-f13c-46aa-c4af-08de5f14355f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:55:53.6409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4Ky8jUUe7skvoNhQ49UAg40v6x2pIAKx2z5V2/y5I4bXeGRBnFaQvFJD6JWLZopNc0a5Qm6S5zLdiDIesyMVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8511
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

Hi,

On 29-01-2026 06:28 am, Daniele Ceraolo Spurio wrote:
>
>
> On 1/28/2026 3:51 AM, Sk Anirban wrote:
>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>> idle flow and verifying SRAM handling completion. Without this, reset
>> can be issued while SRAM handler is copying WOPCM to SRAM,
>> causing GuC HW to get stuck.
>>
>> v2: Modify error message (Badal)
>>      Rename reg bit name (Daniele)
>>      Update WA skip condition (Daniele)
>>      Update SRAM handling logic (Daniele)
>> v3: Reorder WA call (Badal)
>>      Wait for GuC ready status (Daniele)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>>   drivers/gpu/drm/xe/xe_guc.c           | 37 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
>>   3 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 87984713dd12..c9cb02f32f5a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -40,6 +40,9 @@
>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>> +#define   GUC_BOOT_UKERNEL_VALID        REG_BIT(31)
>> +
>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>> @@ -83,7 +86,12 @@
>>   #define   GUC_WOPCM_OFFSET_MASK            REG_GENMASK(31, 
>> GUC_WOPCM_OFFSET_SHIFT)
>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>> +
>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>> +
>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..d28542d980ac 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -900,6 +900,40 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>       return xe_guc_submit_enable(guc);
>>   }
>>   +/*
>> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only 
>> reset by ensuring
>> + * SRAM save/restore operations are complete before reset.
>> + */
>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    u32 boot_hash_chk, guc_status, sram_status;
>> +    int ret;
>> +
>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>> +    if (guc_status & GS_MIA_IN_RESET)
>> +        return;
>> +
>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>> +    if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>> +        return;
>> +
>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>> GUC_IDLE_FLOW_DISABLE);
>
> IIRC in one of the previous rev we agreed to put a comment here to 
> explain why we don't need to explicitly turn this back on.
>
Thanks for the clarification. Although I thought the mailing list 
comment would suffice, I'll provide additional details here.
>> +
>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_STATUS, GS_UKERNEL_MASK,
>> +                 FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>> +                 100000, &guc_status, false);
>> +    if (ret)
>> +        xe_gt_warn(gt, "GuC not ready after disabling idle flow 
>> (GUC_STATUS: 0x%x)\n",
>> +               guc_status);
>> +
>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, 
>> GUC_SRAM_HANDLING_MASK,
>> +                 0, 5000, &sram_status, false);
>> +    if (ret)
>> +        xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 
>> 0x%x)\n",
>> +               sram_status);
>> +}
>> +
>>   int xe_guc_reset(struct xe_guc *guc)
>>   {
>>       struct xe_gt *gt = guc_to_gt(guc);
>> @@ -912,6 +946,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>           return xe_gt_sriov_vf_bootstrap(gt);
>>   +    if (XE_GT_WA(gt, 14025883347))
>> +        guc_prevent_fw_dma_failure_on_reset(guc);
>> +
>>       xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>>         ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, 
>> false);
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -73,3 +73,12 @@
>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>   16026007364    MEDIA_VERSION(3000)
>>   14020316580    MEDIA_VERSION(1301)
>> +
>> +14025883347    MEDIA_VERSION(1301)
>> +        MEDIA_VERSION(2000)
>> +        MEDIA_VERSION(3000)
>> +        MEDIA_VERSION(3002)
>> +        MEDIA_VERSION(3500)
>> +        MEDIA_VERSION(3503)
>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>
> I was re-checking the WA platform details and it looks like the WA was 
> recently extended to graphics version 2004 as well.

Yeah, I just checked, will add the platform in next rev.

Thanks,

Anirban

>
> Daniele
>
>
