Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E7EC54F30
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 06:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2F710E244;
	Fri, 30 May 2025 06:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoAvdTSF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC83D10E244
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 06:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748586518; x=1780122518;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5lS8wJv0t2G0K+ECyQogZUiY2LYs4Q+mhEUyk0uaF70=;
 b=FoAvdTSFSP2bf1lu4tY6zq/fHaoefqOwWeiIzqmUZP0G0oUcN+5FRJ4o
 ryAWQr80RqD7yguCsRWhwvffCEvDUJveKwxaWnmDTTsT3cT1WHMmXcuLG
 2Nq/LAa6CwnpKEHdaj+3khYGPBhxJ6nugO9qIRiqI8pbCR/6fyJSjS0sK
 a5eZMZeu3zly2riH8z79nnF30fX1LwDPCkrC8UtzPpO88Fuqx433gv1BB
 C9R8B0o3joJXlrGx80bXoaqCKYNWFjAyAqP3Eivol20Km0m+lv/Y4dh6D
 1stbzoyVpe57HhGb8ygiw5Z4aYLOIZQfDiSFtsTUlJZZN/6DguZ1dXTTT w==;
X-CSE-ConnectionGUID: YumkTHIeRh+fiv9lIOwW/Q==
X-CSE-MsgGUID: 7lATd2hjRCeRnLB6PDta8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38295041"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="38295041"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:28:37 -0700
X-CSE-ConnectionGUID: 6nTyJzyPQeCqno4WdnIfsw==
X-CSE-MsgGUID: gJSg6q1PT0Wo00uWiUcH7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143814629"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:28:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 23:28:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 23:28:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.61)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 23:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGh1B6mv6l9wsb/n3qVwHAOW9ZkhdKdBrnSLh8Eglgs4TcpLWfmQOptTwf5mmq9VllhKblPThaEfTblLHQK+JmFC9Afz8B62QryS1ea71JrKdIEun18Lx0Jhhdx/0o6oh0yxMEEPC1FRZws8IO7gwf7T7tCMtboGJzFWE5n3F6GiYmwmeqqXCOSoTS5dDKKq9aRTlNXt/E/6I37pz906xDTZsUP9HpLcmKbbRYIUtElbjizr9fhX4h4x+XZ4gSqZPzfKxTJtAVVTUCso+FnqN/Iai0fzQO9Z8/0O7dlQVogpEPE2/zosaoS4gJVpX9rcQ39UhtSXIquK+3phrKtADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpuUCxfOOI5byviMb6TN1SBANK1WZBShetXhFlA62y0=;
 b=GEEON0O1yGUVw8UOYLLj8Vp4ospDsu21QimVvFZ+uOLKncx4nLtoWpWPQJ66zfKs0XdsLV65cOqZ9R17DhVOm0TdKlliD8vifz2wCpAf7tudy1W0zDenpXz7MyVCf9NeD1f5avR8JpA6RT3CM9lwpUI2MveI3+RC5aooeAhfI2w8YKwWi2ToHA0x/fs3sKjxMg6TVY6hCC9D6m5WlIJviiuLzbC/Vj8Z6ZQoy8ZVQRh/qR4eWPU/CJ935e6ztS2bvRFWFv8R0hx+IW9ll5BNsykOcuaCC6kAOXGik5j3knmME/SlJTDtMEqprvbPQ0XlAc2F60+BH6R8ADwzRJOgwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 06:28:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 06:28:06 +0000
Date: Thu, 29 May 2025 23:29:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/19] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
Message-ID: <aDlQUeDNTTIJxM+D@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-9-himal.prasad.ghimiray@intel.com>
 <aDeZHeonaIwMzu0j@lstrano-desk.jf.intel.com>
 <adc4f3d7-7a75-4672-8ba4-7269f6e71b2e@intel.com>
 <aDfb21fATPB4xyyJ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDfb21fATPB4xyyJ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: CH2PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:610:4c::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: e987ac53-22b0-41b1-8c5e-08dd9f432389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXIrZjl4UkpGc2VTWXJ6dHpqc3lEUVVoMHByQ2ZNOEFQOW1oR2tidlJ3SzF6?=
 =?utf-8?B?TmNiWm5qTU03L1ZpN1dFejYzZFVKaDg3ZndzZXRqMGVWN1lFazJ6WnI3U1Ew?=
 =?utf-8?B?L2ljeFRIMEpmM21yc2E5U3ZTbC9acjhhVnJ3S3lSZ0lzeGVNVGp5bG5hbUZ0?=
 =?utf-8?B?RytFWHkrVHF5bEphekt2eklEQnkxTXVqY1hEcXMxZHhRZEs1Z3kzUnJqL2to?=
 =?utf-8?B?VTJ4ak4yT0RrR21kME0zODVqdG1JTXdlRis5YmtIaXBENnJkcitvRmE1QlVE?=
 =?utf-8?B?TlVWbW4rZTRibW5UUmhuUzRVYk5YdjFyNnA3L1NQV05LZS9QZGxDUWd3K3Br?=
 =?utf-8?B?RlFWN3FXdXRZTzdEZkpFalhTZVFVaks1V3ZUNXZHNGZWeVErSGNOcFc2RnRk?=
 =?utf-8?B?NDY2bTd3d1dKdHhhNlVEc3hSM2I2R0o1ajlPS0J5TEd6RFFYK3h2LzFvak41?=
 =?utf-8?B?eUduRXFEQ0RyYlR5dW5BcTcwcHZJQ1FQSngwbU9Rbms0cENucVhpTitSZVlS?=
 =?utf-8?B?N2s1bG52VnR3UDhGNHJvNnFiWllqV0svMVM2S1AzL2FzY1hzMjlVVGE5S0Fk?=
 =?utf-8?B?eUU2S2YzWjRaUlZ0VXJTajY5cTJnOXZsVzd6M2h1Tys4L1VQRDI5NTNDa2V0?=
 =?utf-8?B?ZTBmSVVibTFhU2k1ZCt3TDI5bEJWaHZORmV6QWJYV2xyRGsyd2x4R3N1MmFv?=
 =?utf-8?B?NS95MjkrbkxHMFZvM0o0NU5SaTVqT0xUYW15ZHFITm9SNmtyM1dUZXBpQStn?=
 =?utf-8?B?TU9tYTFBbXkvblM0c3FzMGxJRzY1Q2RzVVM5V05MU2hKSDhNcGswYWpkSFpF?=
 =?utf-8?B?aUVtM0JQV3htUGZEQWlEaWpTc3lUSzdTTmN4aG40cUZUK3NIUTJ4aGd0MWpE?=
 =?utf-8?B?U1owMDN0VTFOS29WdXhYbitZWXRweksvdUhscVZUcnlYOHp0MWRqcTBwRDc4?=
 =?utf-8?B?dnNVb09wN1orZ3JoaytXUEwwMm1XYkkzVlRHUkVwQmtjUHJ5VWJFcy9hM293?=
 =?utf-8?B?T0RsMitZTW1xQXU5bU1JNEJvVkZVekxQd0h0M0syVHh2Y0ZDNUFJTTdOT05s?=
 =?utf-8?B?dWdnSHBmaGFsWTFtaGdlNDUrdlJwak9hUS9GaGRrVmZjNkJPSGZ3a1pSbmpu?=
 =?utf-8?B?eEFwY05RMEdiZVEySVhtWDgwRjR4UUpqWmIrMndBdU1naUtjdmY1M3IrdzZa?=
 =?utf-8?B?bmdsc3JrMWZlbkxMaUFHZ1dZc1ZORS9lOGVDRDEyUTJLN1ZHbHpLTXdmNDJq?=
 =?utf-8?B?ZjF4NjZOeXczdWdUaVBDQTNxWjFVcFBEb3dxYTZEWWJNNElTYlJTSlR6MDNP?=
 =?utf-8?B?bm5ENm1iaVprK2syVk9HQWpkdkNnZWpaVHlmWVltdGJ3bTJmdGJTZHpQcUZP?=
 =?utf-8?B?MU05Yy96VGFTSlVZMkVXN0luZmJNNTRtK1hib24ybGRmSVhrdSs5TFc2dmhw?=
 =?utf-8?B?dDVWd0pkWlI0eWorclZ5SFg4UURIOW9pTThid201WERjVklaRlY2Q0F5SHR3?=
 =?utf-8?B?SVEvMUZqZEtpVTEwS0NmbkNYTVVkaENKeXZlZ1gzdmQ3RXdsaGExMUVmUUJx?=
 =?utf-8?B?eW1ic1VnSldxb3o1dklSU2tIWm1sRUpSdDhNMVNpMlNESDZTK0VJR3FmcGdX?=
 =?utf-8?B?WkJDYWVKOVBOdUVaanM0VXdYQkMwZ0IwQXlvTUh5WnhpbEJ2citENHloRks1?=
 =?utf-8?B?b0xmaEYzbnpEMEtUK1p5dmdhbzNpenhacFNtUllYSE9JVWVweDlXUnhxZGhD?=
 =?utf-8?B?dWk2c0E1UkVtQTByVVpSNjNZU0NNMlZmY2Y3a2x6SmZEVEp1STNKWTI0M2ha?=
 =?utf-8?B?QkQ2c2Nod0pLcVRiWncyVjY5aFdseC9NeGI3K2k5bmFGZEc3NGZsMVNPODdO?=
 =?utf-8?B?b2piUTB4NEk3dHNhZ291YzlvRUZlZUlKeXNzMHByOVVPMERVQzJHdklZa1ZB?=
 =?utf-8?Q?3SFNYEh6TLs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RRTWl5d2svdmpQcFZFK20xZlFQTnQ1TXAyZjZ4UUZMWkhmTThmTm5ZcXJw?=
 =?utf-8?B?OUVYZWRmZVB6QXFVVmhBS3B1QmtzQlVRbnFXSldoMVQvRHZLNkpGVFM1RWpL?=
 =?utf-8?B?UGM1SWFNZ1VDQmdFUnRDTjFqQmhOQVBQeEl4RlRUWGlMN1BGREpUSGc3Zjdr?=
 =?utf-8?B?S2R6cWY5YjFwdU5CSGU4elBTOFJORGVqaGlqVXJxd1JnVWFuN1REWEE2dEZw?=
 =?utf-8?B?YllTZlZ5Rm5qVkZvRUN3T0pNc01hYzRIa0FwSWpOUExOY1dKMEg5NktWM3VF?=
 =?utf-8?B?eTNMR1o1ejBmWHFXTEhuMmRhNDRBYUdwWndTbDQxZnY1MG9rWVBFeExmdWRr?=
 =?utf-8?B?aWIweVV2d0ljcUluZE95b280U2tiUGV2enZML3JXNjBYVEs1TVBaOFhFRStj?=
 =?utf-8?B?M2M0KzVQK2Z6UWJGcXAzcXB1bDVuaHRUaTZmbDVZVTd1bGZGNUhGOWxuVXB3?=
 =?utf-8?B?ZXpSeHVmb2IydUtEcmprUHRJZW9FYlZZMGFBQVZXMC9rNTF4eWxxeDJKNDhB?=
 =?utf-8?B?NlFSelBUd214V0liYzhpNnN0U1BtS2c3RjRobFZmbFp2ZHJQTzU5eVhCNDVM?=
 =?utf-8?B?SXNyN3k5RzVwRVNVVk5nWUZKZjJGVjNXUUQ1WW1WSUlFdEh1Z1dQTGd0RzNq?=
 =?utf-8?B?Tk4vZ2RacUM2WVNaWGRXdERhSEk5SCs2SmpxU0IvWHZlTFJSYVZ1blpUUlpS?=
 =?utf-8?B?YzJ3V0xFVm9jMjZXNDlMRDg1UkIvNHdFOExrdXhYNGxuRE5rN0hwUE80STMz?=
 =?utf-8?B?ODNSR1ptWnBrWHE2U1FNcnJCOUV5UUR5Y2N2NTA5bDBVNWRoeGRGeEM5WjlP?=
 =?utf-8?B?dzljT0R3dzEvakdWK0libDlFMTl5eDlueS9PWDRjWGw5OHpMRXJwSnNjSjNL?=
 =?utf-8?B?Nlhwd0xON1dwaTU3WEZidXVibkVaOW9uTjZUMTVxN0w0ZXVKSnFIaGlWaXNK?=
 =?utf-8?B?djZwUXppUU83NlkwS1pnUjVqWWNNdFBhUEZVL2lJN1Y5TkRLM2xrQUd5cERY?=
 =?utf-8?B?Q3diamhhZTFEWmdJc01ObHdVd3ROK0Z0RE53VUxjTGN2U0E5UFFLQjBrR2dl?=
 =?utf-8?B?Q1Y3ak1waUVDeGZuQ212cWRsbXNEZDVnWnVWSE5PK2QveUZNa2tvWUlzYjI2?=
 =?utf-8?B?YkIycVE4UUUzY0NWODlLWmFIU1dWMDZUVEsvV2pFNXBLbmhsQUZXdURENGYx?=
 =?utf-8?B?ZjUyQzhwRzUrejVxeVBzTENvK1VMdCs1MlIrbW9PbHJqWHFweXpmbnZrOHZX?=
 =?utf-8?B?WEs5SEV6Y2J2OElzWUxkQ0dXamgycUtJYXJFMnltbTc0dXZOYkNBc0hOc3hp?=
 =?utf-8?B?TmVsc3hUeERyb2lPalc4R0xuNVFhaEpKUUdnbk4ySmNYUnY1Qmc5YVpBeUpw?=
 =?utf-8?B?OWpXZlZFSkIxcVVjc2FyYlU1YnVYMnBiMkFiS1Q3UXpaVVpDMGo3bllMcnRj?=
 =?utf-8?B?bXorRi9ZN2JOTExEQWFLYkVHQ1o3WkpIYjI3Tmw4ZXRwSC8xSVFTTmlhMENm?=
 =?utf-8?B?azI1Y05Ta05wQVNWNlZEZHkwVEcwOThyMEJtam5yakdVa1QrQWxSMG9rQi81?=
 =?utf-8?B?YUJvMFg5M0VMTTB0VnhMZjhBMDdjcnVRK2Z2SzdyZERPTHE1UnNISWI5eERn?=
 =?utf-8?B?YkxKSUx2NFZHaU1xWkJjVG5RbnptaDhBM25iaVBBYUNmcC9lZXMwYlgzUkRJ?=
 =?utf-8?B?RzZTL0VBeXE4Q0lBTWdLMDVsS0JES0VaNVBCY2h5NC9rUGpJLzJKd2lKZi9L?=
 =?utf-8?B?ekhrMjhueWtLcFZlaGtFU0lBMXhNZUFXTzY2YWZaRDJLUzNZdlhqQ2NYNlhs?=
 =?utf-8?B?OWMrOGIwd0tBR2U2VkJSRFVpc0FmMFpnaFBMb1hNU3lsVElvVkI0WjFXR2U4?=
 =?utf-8?B?MjFiVWJIVVpucFptbkVGTDFVcjJqdWh1b2hHM25IR1BJZmxsNnZEbzF3NVo0?=
 =?utf-8?B?YjBJQ0VoYWN2azBUdXh5bGUyQ3E2d1B1aHlQRnUybFdWem5iaVhzKzhIQzl2?=
 =?utf-8?B?Sm1SRldwR3JDeWlaM0RJa2dCY1BnMTFtT1NNQUNqaHFYcHNmV3NGVVlwNUJE?=
 =?utf-8?B?SkM3Q2NHZFl2VjBZNkw1Tk5HZ0dmQjJOV2gvdHFBWTJtRjdPYjA2WURuNWxu?=
 =?utf-8?B?ckJkb2dUM3NmWnZ6NnowWU9paVhwRGV1YTM3Mjg1R1A0VEhsRHhrcHllc2tY?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e987ac53-22b0-41b1-8c5e-08dd9f432389
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:28:06.6303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJMNVggWVl2DCRyWtpSGbipY7ehD6oDQnT6rO9X7qygs555zk3JYWNFWss4UtkmCm5ooxtcel9Bmsl8e4XgPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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

On Wed, May 28, 2025 at 09:00:27PM -0700, Matthew Brost wrote:
> On Thu, May 29, 2025 at 08:36:28AM +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 29-05-2025 04:45, Matthew Brost wrote:
> > > On Tue, May 27, 2025 at 10:09:52PM +0530, Himal Prasad Ghimiray wrote:
> > > > Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
> > > > entries (PTEs) for all SVM ranges within a user-specified address range.
> > > > 
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_svm.c | 43 +++++++++++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_svm.h |  7 ++++++
> > > >   2 files changed, 50 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 59e73187114d..a4d53c24fcbc 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -1006,6 +1006,49 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> > > >   	return err;
> > > >   }
> > > > +/**
> > > > + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
> > > > + * @vm: Pointer to the xe_vm structure
> > > > + * @start: Start of the input range
> > > > + * @end: End of the input range
> > > > + *
> > > > + * This function removes the page table entries (PTEs) associated
> > > > + * with the svm ranges within the given input start amnd end
> > > > + *
> > > > + * Return: tile_mask for which gt's need to be tlb invalidated.
> > > > + */
> > > > +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> > > > +{
> > > > +	struct drm_gpusvm_notifier *notifier;
> > > > +	struct xe_svm_range *range;
> > > > +	u64 adj_start, adj_end;
> > > > +	struct xe_tile *tile;
> > > > +	u8 tile_mask = 0;
> > > > +	u8 id;
> > > > +
> > > > +	down_write(&vm->svm.gpusvm.notifier_lock);
> > > 
> > > xe_svm_notifier_lock
> > 
> > xe_pt_zap_ptes_range needs write_lock, whereas xe_svm_notifier_lock/unlock
> > provides read lock.
> 
> Hmm, I think the assert in xe_pt_zap_ptes_range is actually wrong. I
> likely just added the in notifier assertion because that was the only
> user of it. We want to guarantee that only 1 KMD thread is issuing a zap
> or modifying the PTEs at a time.
> 
> - The notifier lock in read mode guarantees that an invalidation
>   from MMU notifier doesn't race here.
> 
> - The VM lock in write mode guarantees no one is modifying the page
>   tables.
> 
> - The notifier lock in write mode guarantees no one is modifying the
>   page tables and invalidation from madvise doesn't race.
> 
> I think this complex condition can expressed in lockdep by:
> 
> lockdep_assert(lockdep_is_held_type(notifier_lock, 0) ||
> 	       (lockdep_is_held_type(notifier_lock, 1) &&
> 		lockdep_is_held_type(vm_lock, 0)));
> 
> If this works, a comment explaining above is probably warrented.
> 
> If the above doesn't work or we deemed this to complex, maybe it fine to
> just take the notifier lock in write mode...
> 
> I suggest we get another opinion here, perhaps from Thomas.
> 
> Matt
> 

Actually, this locking is incorrect for another reason as well — the SVM
notifier lock needs to be held from the start of the zap until the TLB
invalidation completes. The reason is that an MMU notifier could race by
seeing tile_invalidated set, skipping the invalidation, returning, and
moving the CPU pages before the GPU has actually stopped accessing them.

Similarly, the same race condition exists for userptr and BOs being
moved. So, for each invalidation, we need to lock all dma-resv of the
BOs being invalidated, as well as the notifiers.

Therefore, I think invalidations need to be moved directly after calling
the vfunc that sets the property, using a DRM exec loop to lock all
dma-resv of the BOs in the VMA list while we have it, then take the
notifier locks, and finally issue the zap and invalidation.

All my previous replies to this patch stand too.

Matt

> >  >
> > > > +
> > > > +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
> > > > +		struct drm_gpusvm_range *r = NULL;
> > > > +
> > > > +		adj_start = max(start, notifier->itree.start);
> > > > +		adj_end = min(end, notifier->itree.last + 1);
> > > > +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
> > > > +			range = to_xe_range(r);
> > > > +			for_each_tile(tile, vm->xe, id) {
> > > > +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > > > +					tile_mask |= BIT(id);
> > > > +					range->tile_invalidated |= BIT(id);
> > > > +				}
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +
> > > > +	up_write(&vm->svm.gpusvm.notifier_lock);
> > > > +
> > > 
> > > xe_svm_notifier_unlock
> > > 
> > > Matt
> > > 
> > > > +	return tile_mask;
> > > > +}
> > > > +
> > > >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > >   static struct drm_pagemap_device_addr
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 19ce4f2754a7..af8f285b6caa 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
> > > >   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> > > > +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
> > > >   /**
> > > >    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> > > >    * @range: SVM range
> > > > @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
> > > >   	return ULONG_MAX;
> > > >   }
> > > > +static inline
> > > > +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > >   #define xe_svm_assert_in_notifier(...) do {} while (0)
> > > >   #define xe_svm_range_has_dma_mapping(...) false
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
