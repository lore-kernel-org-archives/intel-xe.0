Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820D2C54ED1
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 03:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83C810E0C8;
	Wed, 28 May 2025 03:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RC+g3YO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D8010E0C8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 03:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748404144; x=1779940144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t8ZiG835ulSmzLe8JVqahSVyfp/xyfdVFpUgiNF3SdI=;
 b=RC+g3YO8p28Rdp4gKfjWzHGiGTkbgwfhuzF8lIirWU95DN4qBMcTscIP
 QZM/tywr6znXdJACFZLXHZ4sJ7opmjMunJ5nVsnQgf1MwuSwwqxj1yxfi
 T0D6L65189iR7bt50+cwxqI1Lm8I2zs5UmrwmbaKP4MMjKW30zBrKKx/g
 697wL6XiB4cw5y+dB32yMjq9chTQ291QuG+dj/r51WXPIVFmyjQkKpIG1
 8eZRDBp84jFslvXS+8NL9QGFfApi287DWqy30FgoHuWWeTWnskySPKvsI
 mSSnlNISHTTl1bibeHhEKAhSIJxJSIbHlRqo1Zv0+POfW1CRmLKxpsv6Z g==;
X-CSE-ConnectionGUID: AM1N9hcWRdmnTEvDUrBusQ==
X-CSE-MsgGUID: KTMofOOBTOGDXHXWzSxCpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="53041033"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="53041033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:48:58 -0700
X-CSE-ConnectionGUID: /OWBFik6S2OHe65kT7ty+w==
X-CSE-MsgGUID: wPe7eTZmQMKql6PPaqLBFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="174085574"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:48:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 20:48:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 20:48:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 20:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOa31gANVjPRKG24+ZS5fFNOPL1i/dC5ahjTCJh60ZQ7LPKGKKQE/n9EALkxUKv7UTqBljtLy7ROq0AShOxTgkmADK9ssqo/HmW4IIXlUtRIq0CE29zzQhlQLEN83q6JwyDzjnMomaps7GD+EanSjCDGOToBEgc1ObIZtyRXk3N9bLfiyzY3dpu2CCsmlh4wcZuuLpd+g1w46eMEN7j3NQDKH5Kr6+PBXM++B142dezIlqEkqgV/hV3r0ad9G1vwnKEwvRabQU86Wju9ZqsFMmYDLZDwPV+XUZExV31zNrMhiuv35wDMfEajRl1q9Hx1lwd9H55TBwxZiUm3Sxi1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IezyZ5SQ4oup6PLHjFSVAQljkW8k5cc1TA0t3aUeXVg=;
 b=Iac2D2GzzE7DRD9sS+G7Zw6x7vhCasGDKnSck93CJL3PyipEQDrifZRO3yvsU4XvfwtPyLYRhlcl815WEHSdGzy4PG7SljzcEuiMdEG2HcTCIXL4ArR6NsfNsRTDORRUrh5Y+/3921HEvLABPbaQKu26BbFosL83GX0+v+gfOJP2VpLVVJ43/jjFwcFcbaNbpYoXEpWI/uVrCzXsRTM/n0de84FK6x+YWoMoSqJW0wI4GdhiA3NFFdmp1kWzZBdfGdVHg4Sz+yrKvNxORYSL3OIralKILzyCNtKdkSv/DYpqmH3Tq0hhpe7n8JGu6CZReNjavw0itxtSzxLnfxvzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 28 May
 2025 03:48:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 03:48:26 +0000
Date: Tue, 27 May 2025 20:49:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aDaH5e+8h86hkhzN@lstrano-desk.jf.intel.com>
References: <20250521141141.17572-1-satyanarayana.k.v.p@intel.com>
 <20250521141141.17572-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521141141.17572-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:303:6a::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 4002ebe5-2ba1-4465-6e65-08dd9d9a8049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkVlNHB0bzNHNG1PamlsaVk0T0lQZXNzQWwwS0lyMDgvZmNtZzJobTdTNTZ2?=
 =?utf-8?B?RTVYdnZGUk5nWjZEdFplZjlmaVpTZDIxdVYrRGpQMW1RTmgybkg1L2RnVE56?=
 =?utf-8?B?SlAyL0tERU0zVWhVcEVmVzJVSmx2SEs1b2N1Q1B5eEZIWG0vSjFzbDZUTGJV?=
 =?utf-8?B?NC9sWXBrUUJQamoxTDk5S3ZZSmtvVVJ0UDE2ZURYUWkvUjRhUDVSYXlSbEVR?=
 =?utf-8?B?eWI0WjFGK1RuWG05Zlh0RWxRaldDZEoyU1doZncvbmZualNSbmpWYWdBeXNV?=
 =?utf-8?B?aE04dDJsTWRlQVczOTNGd2xQUUJqZDlHSkN4SjRjSFk3RTk2ekoxd25hRkdE?=
 =?utf-8?B?RmJyaGIyQ3ZBSVlkQ0VtelBUSkpmK0FNeU91dFUra2FEeG52bTdac081aHNY?=
 =?utf-8?B?ZU1vcy9zdEtVU0YrWjlValE2aHBrSjh1Wk04enhzakNNalgyTGVNc1dwcUxV?=
 =?utf-8?B?bFlhTFlSRTdoZm9KTEZCT0NvZXAyS0RRaWxZQ0RpdUR2QWhMbkdFVjJwZGtE?=
 =?utf-8?B?cU5EN25pdlB6NVFWWU15dzZobzhOb1pOUlB1ak04L3pLM09HNzU4c3p5cEZp?=
 =?utf-8?B?VVJNRGwzdUkzUDlWNHp5MWE2Z01udzg0V1lZRUJBWHVxRGJsTHFMSlk0QWt3?=
 =?utf-8?B?SzBPWWd6YTBQZnVnaDNaYnZiZ2JxNUppa0Yxc1UrYk0rZS9COHpGN2NBUjdR?=
 =?utf-8?B?aUNoSDlqUzlxRVpHK1U2Z3ZHdWRjZ0c4dGswVURxL2dZUGQ0U1F5MmlpSHV2?=
 =?utf-8?B?dzNmbUtjaWxsWkZxZEdqUHBxMGI0SXF5em9iUGFFSW1TbEFra0dLczJBWE93?=
 =?utf-8?B?ZVhQRjFQdjRtMmxteXFlREVVVEQyR21VOVJqd0Vqa09RUkpLWk9RZ1c0TE1V?=
 =?utf-8?B?enVJdVFxbVM0TzZtK09NWmt5Q2Jyakc0UC8xOUo4LzliQjhscFpPeGRtMlRV?=
 =?utf-8?B?V2pPVHRrRGZHeUVLNHFYQkdOQTk0emMza3Z4ckVXNDJ4WmNnUUw2UVhkNWN3?=
 =?utf-8?B?RkJPYXZrL2o3TWdNeTVZUlI5NEVHdWF0UjRBTC93M09VVVYzdG8yc1hvTTgw?=
 =?utf-8?B?VzZ4M1lTeml0UVJORVVFMWdaZmlNdWwxSjFrTiszL0l4ZDNSQmtONmt4SjFv?=
 =?utf-8?B?M3k1MFpZYmhJaitRVHZiTnFzMkVPQUd6SHEreXJPdmxSR1ZJWWdOZnFaVGt4?=
 =?utf-8?B?dUZJeWRNTnF4SXJaNEE0eXhvWmpzYmVwaE43c1NPT2ROOThRUDIzWDJwdnBv?=
 =?utf-8?B?TndQOUdEQ3k5NHNaOHZ4dnFiaXJpR3ZOUTV5WWphcktFemo5ZkxFeFgwZzZv?=
 =?utf-8?B?TktQQys5WWVYRmxUNDBDRDdySWxGNjRYbXRzWmF4cnBXZjdPK1RIczQyeUlz?=
 =?utf-8?B?L1BlQnhZTHpjMVpLZ0lwMUZ1cGVubkh0bXJHSnRuSVNSNXFjb1pHVkJSYk1R?=
 =?utf-8?B?bjRvYTNLY2d4TlNVSjlXK0w4TUcxNm1qWlhxVDhZSjVXWjFaa09reFRnbkNj?=
 =?utf-8?B?RjJmMlM4N1FVRG90emtYaHMzSC9GZ20wKys0RzhlVTZMc3BoZFZIMXF0QUFz?=
 =?utf-8?B?cytYVjN3cDN4aWhlTUVzRHJxVjgycXRRdXlqZzRiYkcrWVJXajk4ZklZVW9Z?=
 =?utf-8?B?SVpmbkNpUDZYRENub2ZxY3hUdGRaS3F5dkxYOXgxZkJQazVWU0h3ZlYyc0NT?=
 =?utf-8?B?UkV2VzZQKzhBdEJzQ29NVVZtbVZuMk10bS8wTDV0ekhPazE3akJVaTQ2d1hV?=
 =?utf-8?B?U0V2SzBzMFBnWWtGN0k5MXRpVkFua05tc0FtSDZhRU5QN0c3UFdDbGVUL3BB?=
 =?utf-8?Q?lJjkayQqxAPR7pXbUEJIdLvI6ntPLC2+oP6Sw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDhqUnArcDg0ZkJuUGRsKzJhZ2NSc2lrNi9HL3JSYUdxRG9QdnFvckgrenVI?=
 =?utf-8?B?VVZXaTJJUm5qeVJySFdXOTlQdG9qU29yaXBSWlNtMjBETVRNQUhEZG5oaU5E?=
 =?utf-8?B?enNjTEU0aUR6Wm50Ti82SDlmeDQ5ZGdwQlpSZ010ODlPM3ZsZEl4eHNnS0Qr?=
 =?utf-8?B?QjhPOTIxSXc3OUkwQ3RVNW1VOG16SXFua252RzdYYjh1Nmw5UVRIdkdlb1A2?=
 =?utf-8?B?V1NmR2JmamJOSHJsZE0yWFRUb3NjRDVwZHVLNDBaSjNQVHZnZkwwUzgybnlF?=
 =?utf-8?B?bDNWcWhvWnVLTHJjUHdWQTd5ckh0aEQrRVlYak04TXBUUXVxcmc5cnhPK1Ev?=
 =?utf-8?B?ZWUzS2c4dTFBK09vVVpqeGd3bTRiV2pCSEpyN2szM29FZkNxUTZOZUoyd3oz?=
 =?utf-8?B?Zm5rRk4yZStiTjd3RXROYTRDZXRVUXFCa2lERVNrR2o4a3ZWT2pxY1Zxb09q?=
 =?utf-8?B?TjFmYTJabW5iTzd6YU1sbGZ1WWcweUt5Q3pIVXFndi9DdHJOSWhnWDQzckEr?=
 =?utf-8?B?VFNkcnU1TmpWem5Rb1BXS3Z6a0hUV0VTMW44TUtRZjVGTjdCN3FWZ0VLRDlv?=
 =?utf-8?B?SmdBeWFFcEJBQ0pBa0xZbVZ1UWNPanBwWlM4SWkvQk9EbCs2a25ra0lTTy9M?=
 =?utf-8?B?MUJNR1R4bFhRVC9FTy9pelJVVDYwclFJLzZwQmZvMnFJWXNnV1BHMlR6aVlu?=
 =?utf-8?B?YzFkV2xaMzk1aFlhalhlVlRwd3ZqOThvTjF0L3ZKeUxMbWJvRllQYlJhNCtR?=
 =?utf-8?B?WEQwSk9SWjdyQjJLL0dDcHFJSW1ZZyt2enkwMEJaOElwY2ZIVjhMMWZWRC9O?=
 =?utf-8?B?NlNRbHNuNmZzcDBSM1pVQXJrNkRzZlpLQmZ0ZGNvM25pTllMcW9JcllkZC9T?=
 =?utf-8?B?Q3p3UmdFNnMvcXljOTl1WE5oVXovUG5DRWJTNHV0UEZCdGw3bmlzdnpBbUor?=
 =?utf-8?B?N1VuenM3UHV0WHh4R3VMdHcxMk9Hb1dhRFZnc3J5SGl2S1ZGeS9EOCtsb0Jt?=
 =?utf-8?B?d3krZDZGYkZxSDBLVlBLbUFUcVVoSlVjRWdaWEtNekg4ZmcyYktLRWtVUGJi?=
 =?utf-8?B?WW9GNHpsU2xONmtVNG01S1RjOFh6MW1JTnRPMlJ0aFRNRnoybFNrQTFPZURL?=
 =?utf-8?B?RHltVGVkRTdOL21oTUx1aTVESi9uRWRkNkkzT3FYWDI2ckI0OHFDdERGMGMv?=
 =?utf-8?B?MXNhWmpqTDZZK1lqWVpIK1JaZ1NTaEVEN2J6eEpla0JldzdSRjFLSWkyMW0v?=
 =?utf-8?B?c0Jqa1h3MkNBYjZSdGlkdGR6NkxoTWtwMFI2MGNXUVRVWXpnQVN1TldkZUIw?=
 =?utf-8?B?emNrOXVueHkxTitPbC9FbzhYVDJzNGVBRDV1NkhFL2J2QnNIOUFKVVc1OXIy?=
 =?utf-8?B?T2ZKeHJ1YkFINDFLbkZiZS9Pb2lUWEN0dHo2Mm5zaTVjWTFTdnROYUVlcjhB?=
 =?utf-8?B?c0JWV1YvRFgvOWFhWGd0ZzBhb0hRdldTZUpIZmpXU00xVGU0by8wSEtld1Fi?=
 =?utf-8?B?SHdOVUVRbEV6dFphRjBpZHhLVUZzUEQ5UUhVNlkrdVljWWN4Tytwa091V1dj?=
 =?utf-8?B?SDVSbmdNN05OUWgvQjMvUlRLblB1aXVmUFkvZ2NuZWRVMFBpTkUrb2dFc2I4?=
 =?utf-8?B?a0lKbEwxb1VFNkdWOVlKOWd1c2dyOStGRXRUeTBOZmtQYVhxR3BjTUZjTUg3?=
 =?utf-8?B?dGNTekRmVlR4MHBDSXY5eHNpVUpFVWtWWnFXNlBnRFROZi8yT0Q5QTNaa1Aw?=
 =?utf-8?B?d1RrL1U4Ymp1ZEN3dFNlWWc3WEExcHFOUWdjajN5RVMwSHRmVCtxT1FiMDkw?=
 =?utf-8?B?ZW5aNXFiYWlhYk1lVWZxdmVGNC9NeXhpV3BJMzdBMkZhNUxZSTQ3QXlwMEdn?=
 =?utf-8?B?d3N3TlRldEtYVUtTMVZwQXhMWTJjdnllVC9PMjFkc1p4YWZWcW9mYnVQTE9T?=
 =?utf-8?B?eWxZc1FWeTNjUG1pWlM5dnU5SkZJVE16alVYQ2NvRzV6R0ZFdHBmUFNHR0JQ?=
 =?utf-8?B?MUdDQ2l2UkppTVNYYVlMR2hjdzdZUnRqVG5FU29US0hUbkx0U1dxRlV0dnNa?=
 =?utf-8?B?QkhvTFk0ZTB4c1ZwSzgxTlNacjE4Y1NCZVJ5NW9JeE0rb0xIeG8wRHduTkZr?=
 =?utf-8?B?WlhFZUlTRlM2L0tNUkkvaFNWUjlzdmwzdDVEb2s3a2FyTjdrUStSdk9pKzYw?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4002ebe5-2ba1-4465-6e65-08dd9d9a8049
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:48:26.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieaEvnNI85LKpNBGTD/6rJmeTOVIaWU55PYbbKV+7q8w6ufXrrIX5tXZwdJq/u1m3oWc/GyIGNqRqSlPr8RfwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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

On Wed, May 21, 2025 at 07:41:40PM +0530, Satyanarayana K V P wrote:
> Attach CCS read/write copy commands to BO for old and new mem types as
> NULL -> tt or system -> tt.
> Detach the CCS read/write copy commands from BO while deleting ttm bo
> from xe_ttm_bo_delete_mem_notify().
> 

Quite a few nits, but I think this largely makes sense.

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Attach and detach functions check for IS_VF_CCS_READY().
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_bb.c           |  33 ++++++
>  drivers/gpu/drm/xe/xe_bb.h           |   1 +
>  drivers/gpu/drm/xe/xe_bo.c           |  21 ++++
>  drivers/gpu/drm/xe/xe_bo_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_migrate.c      | 159 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |   8 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  74 +++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |   3 +
>  8 files changed, 302 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..bb10151c68a3 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -60,6 +60,39 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords, bool ctx_id)

I though on this below for 'read_write', it is very odd to have bool for
ctx_id then use as an index into an array. Again, maybe an enum here.

> +{
> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int err;
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * We need to allocate space for the requested number of dwords,
> +	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> +	 * space to accommodate the platform-specific hardware prefetch
> +	 * requirements.
> +	 */
> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) + bb_prefetch(gt));
> +
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> +	bb->len = 0;
> +
> +	return bb;
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
>  static struct xe_sched_job *
>  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index fafacd73dcc3..55d5c458d42a 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -15,6 +15,7 @@ struct xe_exec_queue;
>  struct xe_sched_job;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords, bool ctx);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..a26c97850a43 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -31,6 +31,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -933,6 +934,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  
>  		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
>  	} else {
> +		if (IS_SRIOV_VF(xe) &&
> +		    old_mem_type == XE_PL_TT &&
> +		    new_mem->mem_type == XE_PL_SYSTEM &&
> +		    bo->bb_ccs[0])
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		fence = xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
>  					handle_system_ccs);
>  	}
> @@ -964,6 +971,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	xe_pm_runtime_put(xe);
>  
>  out:
> +	if (IS_SRIOV_VF(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs)
> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +
>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>  	    ttm_bo->ttm) {
>  		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
> @@ -973,6 +986,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (timeout < 0)
>  			ret = timeout;
>  
> +		if (IS_SRIOV_VF(xe) && bo->bb_ccs[0])
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +

I'd don't know enough about the above 3 conditions to say if they are
correct off hand. I can figure it out, but perhaps Matt Auld would
immediately know. I have enough other comments to address before I will
look into if these are correct.

>  		xe_tt_unmap_sg(ttm_bo->ttm);
>  	}
>  
> @@ -1478,9 +1494,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> +	if (bo->bb_ccs[0])

I think if you follow my suggestion to allocate the BB upon BO creation
this condition would have to change. How about helper that indicates if
BB has valid instructions.

> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
>  	/*
>  	 * Object is idle and about to be destroyed. Release the
>  	 * dma-buf attachment.
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..481b8e0d8ab1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -78,6 +78,9 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..43de220b3109 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,6 +940,165 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @dst_bo: If copying between resources created for the same bo, set this to
> + * the same value as @src_bo. If copying between buffer objects, set it to
> + * the buffer object @dst is currently bound to.
> + * @src: The source TTM resource.
> + * @dst: The dst TTM resource.
> + * @copy_only_ccs: If true copy only CCS metadata
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> + * memory and vice versa.
> + *
> + * This function should only be called for IGPU.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   struct xe_bo *dst_bo,
> +			   struct ttm_resource *src,
> +			   struct ttm_resource *dst,

I'd make src_bo, dst_bo, src, and dst a single BO argument as these are
all dervived from a single BO.

> +			   bool copy_only_ccs,
> +			   bool read_write)
> +
> +{
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 size = src_bo->size;
> +	struct xe_res_cursor src_it, dst_it, ccs_it;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	u32 src_L0_pt, dst_L0_pt;
> +	u64 src_L0, dst_L0;
> +	int err;
> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;

This is odd to compare to bool (read_write) to a define. I'd rework this
somehow. Maybe change read_write to enum argument as mentioned here
[1].

[1] https://patchwork.freedesktop.org/patch/655132/?series=149108&rev=4#comment_1200360 

> +	bool src_is_vram = mem_type_is_vram(src->mem_type);
> +	bool dst_is_vram = mem_type_is_vram(dst->mem_type);

Do you need vram checking logic? Isn't this iGPU only feature?

> +	bool type_device = src_bo->ttm.type == ttm_bo_type_device;

type_device I think will always be true as these are user BOs.

> +	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
> +	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> +		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> +	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> +	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
> +		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;

I think the above 4 bools could be simplified a bit. See my comments
about VRAM and device type, same ideas apply here.

> +
> +	/* Copying CCS between two different BOs is not supported yet. */
> +	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> +		return -EINVAL;
> +
> +	if (src_bo != dst_bo && XE_WARN_ON(src_bo->size != dst_bo->size))
> +		return -EINVAL;
> +
> +	if (!src_is_vram)
> +		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +	else
> +		xe_res_first(src, 0, size, &src_it);
> +	if (!dst_is_vram)
> +		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
> +	else
> +		xe_res_first(dst, 0, size, &dst_it);
> +
> +	if (copy_system_ccs)
> +		xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> +				PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> +				&ccs_it);
> +
> +	while (size) {
> +		u32 batch_size = 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
> +		struct xe_bb *bb;
> +		u32 flush_flags = 0;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +		u32 pte_flags;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
> +
> +		src_L0 = min(src_L0, dst_L0);
> +
> +		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
> +					      &dst_L0_ofs, &dst_L0_pt, 0,
> +					      avail_pts, avail_pts);
> +
> +		if (copy_system_ccs) {
> +			xe_assert(xe, type_device);
> +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
> +						      &ccs_ofs, &ccs_pt, 0,
> +						      2 * avail_pts,
> +						      avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +		}
> +
> +		/* Add copy commands size here */
> +		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> +			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
> +
> +		bb = xe_bb_ccs_new(gt, batch_size, read_write);

I'd move xe_bb_ccs_new to BO creation and likewise xe_bo_free to BO
destruction - I believe Matt Auld suggested this.

The reasoning being is if we have to resize the SA (e.g. allocate more
GPU memory) we cannot safely do this in the xe_bo_move path but we can
do so upon BO creation.

I'd hook into Matt Auld patch here [2] to optimize only allocating a BB
for BO which can possibly use CCS. We can likely take this a step
further as Jose suggests [3] if we add flag to BO create IOCTL which
says 'no CCS'.

[2] https://patchwork.freedesktop.org/series/149122/
[3] https://patchwork.freedesktop.org/patch/654097/?series=149122&rev=1#comment_1196998

> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			goto err_ret;
> +		}
> +
> +		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
> +			xe_res_next(&src_it, src_L0);
> +		else
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
> +				 &src_it, src_L0, src);
> +
> +		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
> +			xe_res_next(&dst_it, src_L0);
> +		else
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
> +				 &dst_it, src_L0, dst);
> +
> +		if (copy_system_ccs)
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		if (!copy_only_ccs)
> +			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
> +
> +		if (needs_ccs_emit)
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
> +							  dst_L0_ofs,
> +							  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
> +							  src_L0, ccs_ofs, copy_ccs);
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW | flush_flags;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		size -= src_L0;
> +
> +		src_bo->bb_ccs[read_write] = bb;
> +	}
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..2a2f6c4690fb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   struct xe_bo *dst_bo,
> +			   struct ttm_resource *src,
> +			   struct ttm_resource *dst,
> +			   bool copy_only_ccs,
> +			   bool read_write);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 3ef801a1f117..0e8ff3d4b0c5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "instructions/xe_mi_commands.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_migrate.h"
> @@ -157,3 +158,76 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  err_ret:
>  	return err;
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> + * @bo: the &buffer object to which batch buffer commands will be added.
> + *
> + * This function shall be called only by VF. It inserts the PTEs and copy
> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> + * function.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_migrate *migrate;
> +	bool copy_only_ccs = 1;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	struct xe_bb *bb;
> +	int err = 0;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (bb)
> +				xe_sriov_err(xe, "Probable memory leak\n");
> +
> +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> +			err = xe_migrate_ccs_rw_copy(migrate, bo, bo,
> +						     bo->ttm.resource,
> +						     bo->ttm.resource,
> +						     copy_only_ccs, ctx_id);

I'd drop the copy_only_ccs argument as this is always true.

Matt

> +		}
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> + * @bo: the &buffer object from which batch buffer commands will be removed.
> + *
> + * This function shall be called only by VF. It removes the PTEs and copy
> + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> + * before freeing.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	struct xe_bb *bb;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (!bb)
> +				continue;
> +
> +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +			xe_bb_free(bb, NULL);
> +			bo->bb_ccs[ctx_id] = NULL;
> +		}
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5df9ba028d14..5d5e4bd25904 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -7,7 +7,10 @@
>  #define _XE_SRIOV_VF_CCS_H_
>  
>  struct xe_device;
> +struct xe_bo;
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  
>  #endif
> -- 
> 2.43.0
> 
