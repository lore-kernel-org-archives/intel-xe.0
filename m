Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C94CAC5BB
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 01:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3D910E751;
	Thu,  2 Oct 2025 01:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICkqYQH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478AB10E74E
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759366984; x=1790902984;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sd1OvXGd1UJZJ8bNw9hKzpjh4VAFrcpHxzn7ILBGtLE=;
 b=ICkqYQH1ntz9N7rp3sq7lxJqMtAMuV/O22bKTK6eLTlGxnBioZdMTtvq
 CVeMUQ/ODoYJDVHs7chHJcwWLt+3xnAZRTSPg+vmflD0UJqpzlWZQk3iO
 nToiGAPGCfloek1dZfpPP2rAwHVqwirmAAL172xgqS5bR2ty5CCPG33HL
 kMi3ATEvxz++pOQ/+heqLiAO7aXbl4NLtWcUMLbiWIa7b6fkUXk6kKSy0
 XUhyFOCU9PcvWsbmj8QzvpSSbefZ9d2yadHek3g1pUlQsuHma8wg8Arck
 JO7JoP+EiIthAw9xJkKVLbZ7U5ku/Qg5d68BYYWreuz8a9+2o9+zzFlR0 w==;
X-CSE-ConnectionGUID: khLVa8mBQLKiHD2pS1kaWg==
X-CSE-MsgGUID: DvMyPdFuSa6TIhfugxCAhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73081181"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="73081181"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 18:03:03 -0700
X-CSE-ConnectionGUID: uyAmPFoYR8qGkTISZesuOQ==
X-CSE-MsgGUID: x7/dBEltQ9WpxZIvmhPmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="183326074"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 18:03:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 18:03:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 18:03:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 18:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiqaGTI7seokkPuQoIzuEYJZI9oey12/sFEdwAsnYrDyhlWWLwE5tmKS991uHLdGzOqOuVSAYuaBu2yhhJcn/h8z6O8/0a7JlmXAFa0conOqHteL/sJFy/DjeyJ6DZUsRfCbYaOo/jxtq7pUOzlhdEOnmwAhkE/x3DpvQg6392hOh30BPXPOsj7AsYS1DeUVHlj/9rDYezuLbAt6jA6F0+9Tqm068umy0Zc1P8H0PGQlWNlWY18piT/K4TK7ZNQRlJAdjb3e5YEMaFAPsm7cpfJWcJ54AP9Dd3RXAmlKdaeP9A92hQDnMVJZV2ZmkC1QvBAf+Tu3NParveGjVTvElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFtGLHiA0AIFc7jyCowWS1273NwHx4aVbp6cmEfSUDM=;
 b=cNtX92HUbfeD7uRt1Mvl+lTnqINEe4MyZBWc4kaXXFSIcpgGrc8tFWyyx18MM/YzvroiLTnZCNc5vv8LIzDs9EcNrViyRPslVS6ZMKiS5ekbUO9aYQVo5Nrrl1bDtB0D6CeM2dh2/ern2FrUiLRcDfO4kI0j6pQnlaadbFuTZvFsi/CXd9nu1cW0op3ZeH9w3B33hicNvTSRrug5Yf2jasDfAcky/FLAgqr+xctQx9Q+K5yQ7RrjtknN8pY6PF3m8bVpuVT3+cfyEFQB2xgqtyWIrfzx/OW9yfTzHmGkF2coZ2C/fSUFCG39dBHNaZ2MllWw0HAEIQlG0711nq0e9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 01:02:58 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 01:02:57 +0000
Message-ID: <55094858-e8f5-4bde-bef4-1a0e96b30723@intel.com>
Date: Thu, 2 Oct 2025 03:02:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/36] drm/xe/vf: Add debug prints for GuC replaying
 state during VF recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-31-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-31-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0008.eurprd08.prod.outlook.com
 (2603:10a6:803:104::21) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3a3ff0-b665-43ea-59f2-08de014f6d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnlqNGFOSUpUOGd1S0c1M2QvSUFRRzd4T280dkZrRGVhcElPaHJKQnh2RHNo?=
 =?utf-8?B?WENuSm1SYW5LaVNtYlJsNWptTzVsekJpbFphc0pPTWNYZE5xYUhCempvUHV3?=
 =?utf-8?B?Wk8xWEVjbTkyZTk2VDI5d1lTUGlsNlZ6WmN2Mnk2V2xQZzZGMy85bmpFTmFB?=
 =?utf-8?B?VlRvOGxkQk96Q2VaNmEwaDZXU2dUUlBWSnE3Wk5LMk8xcldiM1NnUDVVa1ZO?=
 =?utf-8?B?dlJSMFBoUDVoUlArVDZWU3BZa096b2ZZRHNXMWRyZU01SGZta0ZHVDBNNk15?=
 =?utf-8?B?WkFPdHBtYnF4N2JZYXltNzFXQkhMcE8rMFdRTUpsYUUyQktQOFlOdkZCTkFQ?=
 =?utf-8?B?YkpaLzkyL1VSTk5oMU4zczhCeGd4Zitqbk1OOFFVa0lVckVRc0xudG5zU29v?=
 =?utf-8?B?T3NjOE1VOXFtUkhlTURRREg3QUR6WVdwN3B2OFIvbXBnUGdHMEdwcjM3TDg5?=
 =?utf-8?B?bUdXdHJhTjFPODMwbW5lZ25EbmVBNUQyb3hzb1paVXBWMStUeGVmZlA2Yi9k?=
 =?utf-8?B?ZWJrMURoVXFpeEoyNW1yNTZCNXRPSUlOYi95aVhTUkIwOEt4M0tQYzRpSStT?=
 =?utf-8?B?VUVWYXp4R2pzNDNaZEZ6VXZ1VWVaMG51RDJxQW5jRVlrcDBsemRPRlZXTnlT?=
 =?utf-8?B?Y1doN2NteW1ibXdjSWdQK1ZkdFV4c3VESm8wNzNYSHRleWpiVVM4OXpwK1Jp?=
 =?utf-8?B?NHE5YlQ0ckNtYjZjVkdwcTZ6enF5RWJ3RHVidGpjRkMxdFBlNzdaMFBkVnZF?=
 =?utf-8?B?VUdpa2pqYXgzcnovcFRBOG9HQ3o2bXZ5cDRSczRobG1nVWZJV01IeThpOXlw?=
 =?utf-8?B?QnUxbVBoSHROOFpmbXpGWUlib2VzbVdVMkNWSTBybENLUGs5UmFaMjUySVYy?=
 =?utf-8?B?MWtRYkFZeVR3N0tMUlNUdE83YmtpUGRsOEd5TkFYcFBlMUpOTXVXL3RlNStj?=
 =?utf-8?B?em1ueGdZWkZaQWdFdm9RZ2FWVmN6Ym1KbGJpZzdvV1pjWUpKMzBscThTNmpM?=
 =?utf-8?B?SFlwcnhEUGhBbElZem5QNGJkZkxSRWlKcWdKTjZrSU9rY01XSy9HalJyRlNQ?=
 =?utf-8?B?ZjZKQzFldlIwTjZPcXNUUE5xOXVialFxNFMvZ2lobWx6WlVUWnJacmRhM0dE?=
 =?utf-8?B?WThPRXNmKzRVNWJ3Ym9kdHFTMGNpT1NBV2N0Q1g3WVBzeDM3N0dwUUdIY0k0?=
 =?utf-8?B?YURScWZkM3BqYnFKNm5ZUnJic0hlZGVBTE9vNm0vOXkrOCtZN1RkWWFvRDlF?=
 =?utf-8?B?ZlcwblhUUUkwalFLd1VLV1ZrVjhtUWxHLzhDQW9QbjBsdVFqZ0lNTnFBdTFU?=
 =?utf-8?B?OU1BZzgrQkh0UndTRnROR28wZWFiSVVZb3Bxckl3amFsOEoydTc4VVZVZkVC?=
 =?utf-8?B?aTZYcDdiZWM2K0t5VWxQUGZ6MGowUGJlbDZqQTdpSDJKUW1hcTlPbFRjZGQy?=
 =?utf-8?B?M2JqRy96cHk0ai9BemNWa1B0UmpZVkxNdjBHNXhRSmdLYVArVkNrVFpnajc4?=
 =?utf-8?B?WEg4YklNMmR1NXVYbGZQRmYyRVlObzRHcWJydEcvMXZHMnVvNlNtMGx2dDR0?=
 =?utf-8?B?dmJ1U2NObVZGWnViTEp2WjYrQzNLb3k3YVRoYnFGZ2J6ZXBCc0hucDFmQURG?=
 =?utf-8?B?Ny9hcFF5YWk5Q3lCa2tNMUlUYWIyakthbkh5eG1QOEI1eDVVdnNGWFZKNVBX?=
 =?utf-8?B?NWp2Wm5jZTh2N2RHMTNBRnJ2VnB6QnRQSVplTXVwZm8xS1hTdFFwSXVKNHl6?=
 =?utf-8?B?V21IK0dlc2tGTnRMSklvcUtndUFuMVJEWnlUeHFzMUJLOVNiV0FORjM5VUdx?=
 =?utf-8?B?MkplN0ZPcWhvTnBQRkgrWXovMTBWSzU5YXVyK0R3TVNIVzhsK1pGRDVXL2lG?=
 =?utf-8?B?M1pPN1VubE1seDNqei8rVVFRNU16UDBLaENCOEJOdmF3aUdCYWhXWVl4KzNQ?=
 =?utf-8?Q?T1hS15t40grBN4F/6F3NU6rH1f4bxXfr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck43V2h2Yjg2MFpOWnhGclhkQUo3TmlsaXBvM09OSkdBMTVmTVpxTXdiMTdV?=
 =?utf-8?B?L25Md1EyNkR4MlBQK2ROYUVjVHQ1UFJaSWhTY24rYUV0QVRCcnQvUmZZOW1q?=
 =?utf-8?B?SVZaZEFHdFd1RmNqb3U3MDlkaVRSRDBKTE0yajdrTkpzVy8rTkxzVFhhakNk?=
 =?utf-8?B?eWt2YUkyUVdNNVdlYzFrMnBuSWhleDJYOEh0VEo4dzR6cXZtUDEyQ0lpUDEv?=
 =?utf-8?B?N09aOGVwMGVsQ0drSUlYcGl1Ty90dnhZSzRNMzNPMjlDaHpMWVFBbXhpTWpY?=
 =?utf-8?B?UXJWMWJ1L2s5MGtFbldhaWhJc09qWTEyUWJGN2trZmUvS2UzRUgyTmVzV3Rr?=
 =?utf-8?B?bDVva1JLRzlmb01xTEhIVlN3ZkJ0MmlTY1pnRDhSMjR4Q0ZTa0ZzQXgwZ2NC?=
 =?utf-8?B?KytSbmZ5eTZWV0h5OUltTmlrSzRaYjRUMTJVemY4NWJpbVIrTWE0cVVCZXdX?=
 =?utf-8?B?ejg3NTdkSjZsNHdseTAxdmtoZTNxTlMzZUU0RFZ5aG5mYkJMYVZaZ1JnVHVy?=
 =?utf-8?B?NzZIVFlFOUtEYk1CNG1PaU10Z3J5RSszQndkWkdjRzZ6Rk43N2NaemdjcExN?=
 =?utf-8?B?NkRsUzAyUU9wcGJabjNQdW03aFpxTkV0VXQ0UmFZM0ZDYVkyZXFCTVJiN1dl?=
 =?utf-8?B?ejh6ZnFjS2dqdy9oSGt5RnhpT2d5MWJlVWZCejg2TUZJZ3pXVVZsbWhiZkpo?=
 =?utf-8?B?VnpPMTl5dE5lbUlmd25LUzNLV2JpdFhyWmtzYUEvYndQQzhiam9yd0FSWDRR?=
 =?utf-8?B?ZTVCbXdKVEw2aVhNS2lDQUYzNnBHL0ZzZ0dvSW9acm9iZlZLS3F4eEl0cVpQ?=
 =?utf-8?B?OVdEL25ZOEZLYWlQZEtaMXBHQndGUDEyUkE5eDlZR3dYdmkvaGtjUkJncVNt?=
 =?utf-8?B?WFZIZnJMcHBYWmRxRWRwR1hUSkdub3BGajdLOG1rL1dIZndFUFJJa0RZaDVR?=
 =?utf-8?B?MVJSM21QajkrYzgrTXpkRktwVUdoeFJMZ1JIUS81ZDAxRjZMVEVIL0hlejBP?=
 =?utf-8?B?OW5qZGlXRmRVa3pCSzVJRlNhMmR2OGR6UW9sK2F1bEJlSDVXRS9ieTBNQ0Rx?=
 =?utf-8?B?Y1UyelFZQjFieEpSL2F2K1VsVUJGeCtnbjUwVmN2b0xkWnRJNHJhL29sUVlI?=
 =?utf-8?B?eE84Y1EzVjcwSEdTY3V4UG1PSE5VR2J2SzZ4T25yaFR2cmdmYjdXaGRNZmFZ?=
 =?utf-8?B?MEJYYzNOZTBrZkdwMitlK2R0WTc5ZEI1dlh6Y25tbTJqWU5pREh0cTlaZGx0?=
 =?utf-8?B?NkxNaFF6TGJDdDJaUUpvc0dsVEdacndrNm0za1pTNU1leWw0RGFrU2dCVWh5?=
 =?utf-8?B?UlcrejlwbG1ZSjFaQmxUeiszcXp2aElkeXkvWTY0WVJFOHNDWWFSbUI2WkRp?=
 =?utf-8?B?dkM2SDhJVnhOUmtJS3BHaGJ4MjNQdGxKM3hOa0VMcmtQVlYrUGNYU1FVOVFC?=
 =?utf-8?B?WGlkTnczcXlxRUlBczZ2b2l6NlNlRmE3Ylp4Y2JoVEFKOU1zdldNeHAxZnNy?=
 =?utf-8?B?TndjK3JVeUFna3lQbDI3UUYyR2dqbCtGblErSXdPSUpkTUozMnM4c00ra1hr?=
 =?utf-8?B?dEtQWWV3c1ZjQm56SWN1NnNENGw1TzV0R3JLdzhTdi9saGNqMXdnYmNNd3pz?=
 =?utf-8?B?emlxODVZZHF5Ymw4ejhGdGZPMVZmYkY4ZCtlczM1OER3TVVvZmpDQ2RGQTJi?=
 =?utf-8?B?M0JBWU1wajljK3lsOFNXMmlkNEM5SGRKQm5ZM1l4WmRJTE1udXBWNUlZbGVn?=
 =?utf-8?B?MWxsMUxFeFdwNVp6NGEwRzYrVHU2eWJwbldhOU9IWEx0MnlJMWxESmJhaVFt?=
 =?utf-8?B?cEJzems5U3FpdVFGSVJ6dHIwU2RXakc1Yi9YMW5BeU8yWERMaEtXTGZMMU9T?=
 =?utf-8?B?RnAyckVCR25VTUl3a0ovMVVZMWRVZkU4aytWcThzVFY4TDVvbWxQSzh6TzZp?=
 =?utf-8?B?Ynh2Z1ZSMWVRQjd0dFBpRGFLTkh2Q3YwTnpiaFFvajZBdXBCcWNMb0VacjB2?=
 =?utf-8?B?Y1NtOUhiRWtPRXNlYVFkdmptVTk3R0dGNzBFWEJ2S1ZyMW1ac05ieGZUeXh4?=
 =?utf-8?B?U2dENE5HMW04Y3FjbkwyR29rTFVTL2prUkRSR0lFYlZ3N0kyVWs5Z2phT0Ry?=
 =?utf-8?Q?g9gbUXxmPtYEvarEc7rRxWCVQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3a3ff0-b665-43ea-59f2-08de014f6d0a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:02:57.8990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdFFFWaz/TviW3No/OrmNsKaxnXNE/Vsw7LyU9cVR8PXFJqijF+4d5CSYoFt+gps8z5S2LZn8bRgYcYaz9UCHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Helpful to manually verify the GuC state machine can correctly replay
> the state during a VF post-migration recovery. All replay paths have
> been manually verified as triggered and working during testing.

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7fe3fb07e35e..bc717403740c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2306,21 +2306,27 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>   
>   }
>   
> -static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
> +static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> +						       struct xe_exec_queue *q)
>   {
>   	bool pending_enable, pending_disable, pending_resume;
>   
>   	pending_enable = exec_queue_pending_enable(q);
>   	pending_resume = exec_queue_pending_resume(q);
>   
> -	if (pending_enable && pending_resume)
> +	if (pending_enable && pending_resume) {
>   		q->guc->needs_resume = true;
> +		xe_gt_dbg(guc_to_gt(guc), "Replay RESUME - guc_id=%d",
> +			  q->guc->id);
> +	}
>   
>   	if (pending_enable && !pending_resume &&
>   	    !exec_queue_pending_tdr_exit(q)) {
>   		clear_exec_queue_registered(q);
>   		if (xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	if (pending_enable) {
> @@ -2328,6 +2334,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   		clear_exec_queue_pending_resume(q);
>   		clear_exec_queue_pending_tdr_exit(q);
>   		clear_exec_queue_pending_enable(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> @@ -2337,6 +2345,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   		else
>   			q->guc->needs_cleanup = true;
>   		clear_exec_queue_extra_ref(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	pending_disable = exec_queue_pending_disable(q);
> @@ -2344,6 +2354,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   	if (pending_disable && exec_queue_suspended(q)) {
>   		clear_exec_queue_suspended(q);
>   		q->guc->needs_suspend = true;
> +		xe_gt_dbg(guc_to_gt(guc), "Replay SUSPEND - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	if (pending_disable) {
> @@ -2351,6 +2363,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   			set_exec_queue_enabled(q);
>   		clear_exec_queue_pending_disable(q);
>   		clear_exec_queue_check_timeout(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	q->guc->resume_time = 0;
> @@ -2376,7 +2390,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>   	else
>   		cancel_delayed_work_sync(&sched->base.work_tdr);
>   
> -	guc_exec_queue_revert_pending_state_change(q);
> +	guc_exec_queue_revert_pending_state_change(guc, q);
>   
>   	if (xe_exec_queue_is_parallel(q)) {
>   		struct xe_device *xe = guc_to_xe(guc);
> @@ -2478,6 +2492,9 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>   		job = to_xe_sched_job(s_job);
>   
> +		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> +			  q->guc->id, xe_sched_job_seqno(job));
> +
>   		q->ring_ops->emit_job(job);
>   		job->skip_emit = true;
>   	}
