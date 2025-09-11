Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5CDCAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 18:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1406010EB7B;
	Thu, 11 Sep 2025 18:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRUM/jqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A522110EB7B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757616965; x=1789152965;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Oun//+tlI7PZe3/zlaW3o/ONwjzmOL60g/DufCvhEzI=;
 b=iRUM/jqP5+h25amvBnRsZK5O/GvxWpqOKqMBy9iBNRw+I2+8fBNmt25l
 rgG0Btk6QKyNnZ3KejiC2fSH5SJCcZV7NWWZ/2trXipMZ+2Da7snfvkWn
 0zvkCFmBMCLILsrUAvXaOLX43WAwEgtVAyR2wNM20UHbDk4Tqm8N39zDx
 uOjAlU12IXWKdqPMxaPT5bwKq48R6LlhSluHNdL4I85f7q+w7MzaCSC4v
 EsZyLi+W6ff6mc4Lvy8hQPr0F+njSFH+EoyMgfANcW14DTIZ48TcZw5ze
 exxzvSqz2WOHC2tGWSqEiWm1qNyh/wH2sWTW59vdP6t30MqAIqzvPAYXY Q==;
X-CSE-ConnectionGUID: 2wB2gX8RTciSwIitfV/9wQ==
X-CSE-MsgGUID: G1GUKUVPQo2pO4DDyCbU5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60069905"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="60069905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 11:56:04 -0700
X-CSE-ConnectionGUID: IOu0IlZySYCavOLJ0iIesA==
X-CSE-MsgGUID: mhI2pNTNQZ+4lrpkX4BV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="197448094"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 11:56:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 11:56:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 11:56:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 11:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnHeHJ7RD2UjR0rSt3huhC8h2U8pZweWPgiom3XsMNGQvbBKTZeuhKcY9nA7eHOTsE0O5KS/zkNpvVh4CLkSdgBBPnkA8Eda/MS9Zc+TJqCwQuHOkGaUoWPd3l9gE/SbNvgjDJpmzuNwIUdmXa3sdWYMzUMNr0CcvqSjp9n+s2gg/tv5US7nDy+RCbbaOW0uXb3PEgSOcyDZysg98tuJaDgWE4ZXIaecNHdxMeolGj/ghF+JEpXPnbBBYzBfT26L/Y1ocUU3uwaYq6/qsaiFhW5kwROP4j0CU9W0ZJvLZ45wsszoH2nHxXsFAd5Dp1CwRocZpwudszrv8kC5kaihFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3s2VDU0lMDzLyA/XGj4bQSp1RXCe/mLcJw240DoH1k=;
 b=yrOlxYAieZ7u/V7ZUQkRS6o9gUX2Xi3PlMHYUVt+bTAB5vGiR3lSpkAOcPXndhpwJcrmjAUSY4Mn6gkAJO2v10nXUutdB8uln1heizcMml4Iv/s/0t+xZ76MiouyQufBGstz8UhqhbrDLfWNloz5oLnnD3f2RciO/OXzT8Sdxl6FRC51S8NVyDHKwSUZkXWrOXq851tLm2+JESzMbt9eXad0R4DmAvX4fdN3D0ZPYgekEVBYQUk0kQhoS9oRhxSQXeV6cCNTmlPU9Qhf8FHa9JK+bE5BGcxBpQqUQIvuC8FrqdcEqB70GjFV6uFdw72UC0COC70vSQC0Wkx+z38dBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB4934.namprd11.prod.outlook.com
 (2603:10b6:510:30::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 18:55:56 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 18:55:56 +0000
Message-ID: <16c5394e-e112-44d4-8c0a-13c7a98c08aa@intel.com>
Date: Fri, 12 Sep 2025 00:25:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/madvise: Fix ioctl argument check
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250911173139.1405878-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250911173139.1405878-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: c99ff63f-c768-4796-9f64-08ddf164d6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dThrUllSbUNiaUJlWHhobXg1S01uUEVpaFJQQzNSKy9yS1FGM0xHQVVhdUhs?=
 =?utf-8?B?ZTRNWThYaFh5NEVha3lKNjdFbWEwa09hRnQvS3B5N3JwcjJJNUdmLytSb1Fl?=
 =?utf-8?B?Ym5oVmVzTVZwZHFtYWdKUE9iTmJaL01jb1ozNSszRTBySGZJMWpMWFdOdGt0?=
 =?utf-8?B?eFJLaENkVGVUbC9zaUpUQkdORzhvb0pDbUhENUQ3WDNJSDdURDJuaHRWaHlW?=
 =?utf-8?B?aGlWV2ZoaWtxM1ZxQ0NZVWZ5VTI5ZmlnVXRaVFJOYUtFRXlMdlZVSWtjYXRY?=
 =?utf-8?B?aDUxdFM1d1FZbElnV1BRaXlsWnVoTWYzaFdvN0JNRTVSb2hXSTRtZ01VaWpE?=
 =?utf-8?B?Q3pMaGpXWllMYzBvOXluMkJ5Rm5OekZpRkJ2RENCT0JaTkxvRjdRY0tKNk1X?=
 =?utf-8?B?OFd2aGw1dUNTQ09udVdmNXE4Z0cxWnpldStpVEp1c2FicjVGbStpckljaTAy?=
 =?utf-8?B?VC9DTzZuMGhVNFhBK0ZEMXRnaTdsOGdKeEZkd1QwQTI0dG9XWXU1TjUrV3hk?=
 =?utf-8?B?VnNydE9OMG9tRUMzNytVcG80aVVJOHBDaGRPMzQ0ZEVWbmFwTm1NMkVGU21T?=
 =?utf-8?B?VGpNUVFhN2x5RTI1Q05XRnEvRFVRQklPTGpJWG5PeG9JYmV2eWlyU1MrOFgz?=
 =?utf-8?B?M2g1Z0s4aGlBM1lhOWJTN2oxZERmNVdGZmdqMG0vMXJLblJQdStXNDA2blpX?=
 =?utf-8?B?bnhPRDBoR0lFd2d6WmhUWENFQXJ5SGF6UjUwbENJYkUzblY5SERIWnUxNzJU?=
 =?utf-8?B?ZUZIeWhGOWloMXh4Qys0S0ZGcUZMQVY4ZkNZV1dKSUl2cGg5QVY5YjNIVno1?=
 =?utf-8?B?enBJUVBFSXc2Y292cW5IeEl3ZWZzdWZXcFB6Q0pUOXFoeUl4YlJwMURYY2RJ?=
 =?utf-8?B?S1NUM3JhazJSVGxIMThtQ3lTZ3N1bWRLT0YvTkhDQXBKaUJMeUpFS3hvQUx0?=
 =?utf-8?B?ZXQrSWF3TlUrU2dkMjhkSmFhZTR4UEJZUUtCYmNzaGJXU0kzNkZYRkFZTnQx?=
 =?utf-8?B?eWJTYVJmZ3dSVExaODVkbzNlSzNMTVlqbEM0eEg0T24zN0UwWXdtRnB5REFS?=
 =?utf-8?B?QktjdDNEWXdVOUk5RGhMWVRhWUEyczhtTlFvQ2JNdFZRVm53bXdjZ0R2a1Bt?=
 =?utf-8?B?TEI1M1NoY0ZnZmdPSWw2bk50NmkyV2N5TlJVRHQ1UGxFN2YyMUFzc2FreEUr?=
 =?utf-8?B?VUtNbDJIeDdBMC94UnlJcjJxT0loY3huNVFPSkdUdkV5TkRsSjNNbG5ZVEpE?=
 =?utf-8?B?ekdEUExyV1JKN0JnS09rQmczK2ZCQWlzWlhQdXlWN3NTdGJZenZQaEdWL2tR?=
 =?utf-8?B?SWVxL3ZNQmRtYW5SRmVxSjVibEpHRlUrQkNGa2xteFBCS2NjTnhITFg4UmE4?=
 =?utf-8?B?dExmQnRqZW5GeUpwRFZESEU2VVk1L0ljdXQ5VDBkMHpKNmJBWk91UnhhYkIz?=
 =?utf-8?B?ZUdYMGZFMFZpcGpxVG9XMTYrNmZVbVJ3RE5qbkZ3NFhkMWVDbzl1WlJHRXlG?=
 =?utf-8?B?TW0rN2dXWTVlVkRHVk9kanZPRlpkRDkrTUdDL0VVOGwzUGlEV1FsUHlkYW9O?=
 =?utf-8?B?V1d6cnRnMzBGd2I5VjdmMk9tazZwYVRRZWFKNVgrcVNJQlJJTE9yVWZRRDRY?=
 =?utf-8?B?T0J3TW15QWN5R0JWTXZmdFNZUm5wVldQT3J5bkdmR0FBNC90SXBQcExSeEpi?=
 =?utf-8?B?bW9BVFZrVTh3M1NtNkduQXByUjFFNUpuY3BpUlphQUJnTXBwSFNrMCs1Sy95?=
 =?utf-8?B?UVU1Sll4OE5qTER0c09DYWNLR3g2OGNoSFdrZ0tiYTNUNnlsYjcwaktBL05n?=
 =?utf-8?B?a0oxV1g1dXp1U0VmUUF5QnNDNDlDVEVybDVVb3NYZC9NSFR5cTZhSXJ5OURn?=
 =?utf-8?B?ZnRkcEdBQzRBdVRLSEE3L09SSTlEcS81SHA4Q2ROWUxZalpsWXFYcjZ4b3JV?=
 =?utf-8?Q?fymZ+kcmNi8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bStsdW16ZmtCdk13NFBrK3VVd1lRR29pQ2RqaG93TS9iT1VLcEVXVmZRL0xk?=
 =?utf-8?B?MitZa0pFcmZjRk5wajFja240bXdYWnB0S0l1STBJbmdWaTl0RmZQa2I1V0Ir?=
 =?utf-8?B?QnQwVVVvejc3dzd3cHRqd1lKcVo4TXgyelFoTXpkSlFkMmhlMkVhSUMxS20y?=
 =?utf-8?B?clBUU2RYdlRDZmFvY2pzSGdvUGIvMkhwRkZWT20zWGcrK0E3QlpKUFhTRlFm?=
 =?utf-8?B?N0RncmxuNURkelp3bFBFWkttbTJOLzdnTGlCZzJPSnBacE1BZ3dNY2dEY2hj?=
 =?utf-8?B?Q1FLUTljVGZOSE9XQVlhQmxXVDNLY3dDMlZYNHRyOHFHSThIczRuMFB4YXEy?=
 =?utf-8?B?QUR2b3hYWEJsMkIyOXh1WUs4TnFyK2ROdDRqMzltckpaVDZ5cU5kQnk2ZUwx?=
 =?utf-8?B?RVY2dHFmSXdjUjBlWXNYWjNxYVhsNTJUQkhnRkFadjRrRFpzRzRrNXc0WEUr?=
 =?utf-8?B?RUVzVzNOTTRqUVk0TlhtZWszdjlOc3pNWkVHazlCVTNobXhRT2xVV3pZN01B?=
 =?utf-8?B?MFJXM2Y4ZW1EalNvTUg4TnlGSUpaV2dNSTEwWHgvQ2RhbnZLL3NtZEFPRHlK?=
 =?utf-8?B?cVM5RzFNcnZ4T0Ira0Z0Z1Biejhkb2hlcVozWDlpRzl4Vk9pUTU2SUhtSE85?=
 =?utf-8?B?Skg5QldkbXhrR1ZlSkY5M25PRTBiUm5QZTF2ZzlnVTFyelJLb3RibUwrczM2?=
 =?utf-8?B?VEtxaStINlZyY212R2hmaHVGRnZ1RDVpREhhVm9qQlJ5TW9xelFxU09CcHJx?=
 =?utf-8?B?TFFZZC9LVzQzUTFIOWRPQUptUyswM2RBelY0cjl1dDd1QkxXUUUvTG9vdmY2?=
 =?utf-8?B?WndWVkYwRllXbXFmdFE0VzVqR1VFTW92WG53VllOWjJyK0l4R1A1RW1kN3VB?=
 =?utf-8?B?VDdmQkZLNEEwSFJnR0IrYlY2MlNQNnhNRXdQN0N2YXU3UVA4UUVab2dxRjcy?=
 =?utf-8?B?OVMzQVlkSG9CRUtjamgyV1ZVbWlaL0EvRy95dGJqZTNzajYvdFJIQ0V2SVI4?=
 =?utf-8?B?THoxRUdiMXVpUlV0MENhOEthczc1Qi9iUytGOVN1cjkxblE0NFRUVVpjSGlG?=
 =?utf-8?B?UG84bjNuQ0NoOVloUmRvK2lZZTJvbVA3RTVVMXhnUG9mR015emErSnhQbFFv?=
 =?utf-8?B?V29mVFZFbC9EOGozVVFudU85V3kya2hqUFFIbzl6WW9DQnFPMTdlN3hEQzhE?=
 =?utf-8?B?S1hzWHlZTFp6RFVDMTRhbVhYYUFhdUtlUzc2Zk42ZHlpaHBJUU4wdzFDTzRJ?=
 =?utf-8?B?U0xOakNOQ3c5eWNLYVk3ckYxL01qQUJyZEJDcUY4eDM3VTBvSXloMG5qckxx?=
 =?utf-8?B?ZXJlZWdVTTVvMGhVaUZnTnlFS1ZLK0syZkNoTUdGMkZXZ1JUcGZ4YXRwSjVj?=
 =?utf-8?B?dDQxUXB0dzh4Q1RUbmN1ejZsNUFybUVLMXdSRFZuSTVDUUhpcHgzSE0yNjh5?=
 =?utf-8?B?dUU5bFNZbGh0L0xnT1ZOaFRWM2lDU1ZSdUlQMWFKcEpzSVJsbW1JMklCcDNU?=
 =?utf-8?B?SmE4RkEyejZ2aUZubC9XSHlLaDdPK2Y3MVJVd3NJb0k2TXB1RWliUjZ4SUpn?=
 =?utf-8?B?Tm0vQmNsV1FUR1M4T0hkRjJnMU5ERDZqUE1aSi9QbTd6UlRXWFpzakhVOW1R?=
 =?utf-8?B?N0I1YkFwZEZ4VWUrdjNOaUdpbFpUeUpsM3ljaXNsNmQxUGswWWFqUG9TZkJR?=
 =?utf-8?B?NUR2YTR4eHUwWHFWQS85cmJOaVM5TkFWUWx2SW96QWM4Y2xqZk52RFN1NURM?=
 =?utf-8?B?R3dtRTAvTFloU016NlFXeDNwdURYWGJxY3d2SEk1ZjFSMDZPVWh5am1mZ2xm?=
 =?utf-8?B?NW9zQzNWL0VhZW0wcHBWNzRueitScTJWVDVTd0VBQW5rdUJwV25UcExGMzhR?=
 =?utf-8?B?eDJUVzZrRUkzd2FzWnplUEx2MU1zdDFoQ1p5OWZsZzNqNVNwZEZBS3RPdWtx?=
 =?utf-8?B?WExUZHNUOE1nSUhrUzRGZStTaHRBUCt2eXlrRmFJc1RFTjl1dGlTVThZQTZo?=
 =?utf-8?B?TFNrRzdTN2J0RlcvdWlOSEk1enlRQzZUWUVIMGNGOFoyN0dLOGFlWWk0K0lC?=
 =?utf-8?B?Q3hTNXM5eDJQWUdUaWpiUGMrQXBzRWNCb0tudndlYUUxcmpOZXp2SEIrSGo1?=
 =?utf-8?B?SmRMYVdaQkowMCtndGhTdkhKSzNZNzZ3QkZuRWExUUhDS3pSTGszYXQwZDhP?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99ff63f-c768-4796-9f64-08ddf164d6ef
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 18:55:56.4121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+47ffYw0qC0f7RDvR25gRXmmn3UdAP61o4Q6+7KAAq/2ldJx5q+FdVX8w2+SesKGHrt/CxnXFnfOZorezF50Z9Z1aOpShuKkUxXIHkJG+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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



On 11-09-2025 23:01, Shuicheng Lin wrote:
> It is "preferred_mem_loc" instead of "atomic" for the ATTR_PREFERRED_LOC path.
> 
> Also include 2 minor changes with no functional impact.
> 1. Remove the redundant "attr.atomic_access" assignment.
> 2. Replace down_read_interruptible() with xe_svm_notifier_lock_interruptible()
>     to pair with xe_svm_notifier_unlock().
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")

Thanks for the patch.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 153700743545..cad3cf627c3f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -124,8 +124,6 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>   			vmas[i]->attr.atomic_access = op->atomic.val;
>   		}
>   
> -		vmas[i]->attr.atomic_access = op->atomic.val;
> -
>   		bo = xe_vma_bo(vmas[i]);
>   		if (!bo || bo->attr.atomic_access == op->atomic.val)
>   			continue;
> @@ -253,7 +251,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
>   			return false;
>   
> -		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.reserved))
>   			return false;
>   		break;
>   	}
> @@ -407,7 +405,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   	}
>   
>   	if (madvise_range.has_svm_userptr_vmas) {
> -		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
> +		err = xe_svm_notifier_lock_interruptible(vm);
>   		if (err)
>   			goto err_fini;
>   	}

