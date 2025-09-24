Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A008DCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 10:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE6210E147;
	Wed, 24 Sep 2025 10:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Btbhl66E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5E710E147
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758710981; x=1790246981;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sf9KPgLkQWArA8F64ijM7kdh5zmtdgdDDh4930wzE4M=;
 b=Btbhl66Ek6zrhgoZoY1sjLmFWQoxZ0mjYKR4VTnE5fivF+EDCBY1M+KZ
 e3hZl20Sle/HlqNyShM4A58tE3pPN6UcPrfa3Dc4QG/1WIOejQyOmSFf7
 uRVGVgmxxhYpr3C34gFucZSczzSTBAW79++nPU7M6maHGhy8sL88IF1Kq
 eBSN4TOyrUnQEFQVeaGDIRM/z1jiz0JTIqwQXduKHsrAwoahkzIOEttuk
 3bEa2nB8SP4kyMdJNgr72EunBX/OYyTz00Xey+bj8Pfk5ine7f1ANVUU7
 7p+XYtyZSnI5lJhSsTv6a7k1YmOfCwvFORfwkcsyDrgG96TmTf1hHPFog Q==;
X-CSE-ConnectionGUID: J8kYyuTaTiqxy/4YrluRjA==
X-CSE-MsgGUID: N18jRTPLRiOttHcTBlV89A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48570288"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="48570288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 03:49:40 -0700
X-CSE-ConnectionGUID: dyOvrYeoTOGvlZtNtryNOw==
X-CSE-MsgGUID: ScrvNaYIRMKp/9fQ0syvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181017454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 03:49:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 03:49:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 03:49:38 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 03:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgO6YfNjNkok5FNLWo+gDuHfVvZmMgiw3gV/P+Q8M0VPBzqpUQHo2nMf79zG9dpL8sZLhWoyUiAaciwTq2VjIFKjFLOEv5VrtvRHzE/38kGU85ul/2yVF6XEV81+49bQoDgB1Uqf6O302o9jxf79fBCHjoY/FB7LqlVYzA6Qamw54A1Qh7bZDMokp+qXQYe5OLUN9FeWnY5elW0JG9ZUQQ275xFuaapPjPvZy01dkj2IUqd5hzBykZ+7r1FqlPmDsTEj2Ttbx8VHqXQZLvN1G9pVmae3TUzG8ACd1vRiAlsKGWBiaHhHg9+uAJVS3MCOzJL65mXGkUlKxb5GsV8Qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NyWIZXPxSS60Ycd9qDXZnaxnGhjv7Sky/FJ7wQryVc=;
 b=ILCmqZnl1xVH1GtO2IncPQ8hkESuIPbR+E53fOws5lFzOgjVhFWAVVIS1QjiVM60np04L4yC3gzXn5/vOawyiToplXB+Q/9pAbC1aWxJgQC5bDvb3Ang5ftUntejvXJzpESv3goCGQrf39kgPVso6q2PYUwZfZN/UY6AYelNpWzWmWkXHV7aaXpcyuz2RkghcGelx5IQqgIAyMb18kLYBTXV/RG90NYAlQwWwXuK/ExMSRw4pyEu83IN98w1cmX2xRAsTT6F4Nl6YVBD9Aczc/HiJ4l5iUdFAZRLtPHG3pXaj2OekkUibA4neZbRjqbGiWCR+lmGVlYDqSlla/gT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 10:49:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:49:30 +0000
Message-ID: <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
Date: Wed, 24 Sep 2025 12:49:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-13-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adfb251-368b-43e5-ab71-08ddfb580a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2g0aW5mU05Na0FFWStzUzgvdU1haFRwNk00NFhWT0xUeXhrejdNS2ExQnR4?=
 =?utf-8?B?UkF2WXovOE1YcVIwQWZGMjNKejJFSkNEaFZiVjFqRFdKYlVmYzQ5K2dVUFJG?=
 =?utf-8?B?WHNmL3c0NCs2bHVHRmJ4TzBOdDNYRUhMU1lUL2tpWVgzWE9CUTJ1Q2h6VDll?=
 =?utf-8?B?Rm44THU0OTRoTGNXbm5BdFVOd2t4ck56Y2FjYWJrVXhRVE5KbGJTVHJCRktB?=
 =?utf-8?B?dUNkbU1wSmhhS0tGNWpMZkZQcW5yY043UittdHhINmJQaW1sZFZRVkhzNXJP?=
 =?utf-8?B?YXhVMTNMMGJjYUtWTDlNMENPbGRVV21lTytDbzRSU3dWaHpTMS9jS3R5YWlG?=
 =?utf-8?B?Yms1UjEzdVpDT3RXbzNZVjV2bTJzZElscDZRUEdaaW9pVlNMV0JJR0gzZ25C?=
 =?utf-8?B?czUvVSt0U0ZSK2E2M3hiTXkreHh1Z21rY0F0UVU4SkVwbGtZVC9jZ01yVDU5?=
 =?utf-8?B?MGxLY1VURXRBWXVsM0NPd0s3MitJcUUxME4xNVFIYk5OWHUySVoxaTJxZWdk?=
 =?utf-8?B?NVRobFIzWGllNms0YURCaUFaQm8zMlUrS0dadDJPUDRyTkFvZ0ZaY2cwdjRF?=
 =?utf-8?B?NGRFM1VQNE5KQ2pqRUVVZ2dVWkpzSHNySGdKb3c1NEI0V2x5REtWeTVEUExo?=
 =?utf-8?B?dWFCTnN2UHpjL1pOQUF0bHpqbXZ5dFRZelo1V0tJZE45Z3N3SkUxL1VxVjBX?=
 =?utf-8?B?S0IycEVXekJVRVcxUWVsZk1TNkhaY3ZEMjZsYkNUNlV3LzRCVnBNb0FUYVRL?=
 =?utf-8?B?S0dPeHEvMXhnRm5zU214a2V3eVR6aFVCU1RlcjBMVlBDSHZsU3lKRjJTOWVV?=
 =?utf-8?B?NjlxRFZUOGVjc3VoOFZXanhuMndONXd0S3k5UTEranlPUjM4VTgwc1p6MWt4?=
 =?utf-8?B?dHp0ZnFMWit5RkdtVUF0MklRR29qWmJQWFFUYkc5SzdpSm9BLzlsbG1ncVda?=
 =?utf-8?B?bnNNWW5jSjBPMjJJOFBSUzRZa3ZEN09YU0F1amFwTnVGdW9ZU3A3WG5sa3ZN?=
 =?utf-8?B?MWtub2xzYUJaZjREN0Y0TjV0MExWWFBkdUVaZ2hVNWpUeWtqUXk4NWZJYy9E?=
 =?utf-8?B?MU00L3dFR1F2YzhSVzh1NEtCTVlobGxVVjluMGNVR2lYZjJJaVRBYXp5d0VZ?=
 =?utf-8?B?QVd2RTQ5RlBjSzYzQ1RkQ3QrazM4Y0tIZVBTdGFpNzAxdkhOUWlSZmwydGZ0?=
 =?utf-8?B?RUJFOU1IL0ZUL2laajhEVUphY2tsUDdTZkN4TmRvRGxjM3dncUhBc05pVlRL?=
 =?utf-8?B?aWxrZUY5a0tjYkp3a29jNWlBc2pMK1MzQVFXOEZ5UjUwMXg4WmErNjVnekVB?=
 =?utf-8?B?VkdWMUxqUG9na040QTBBZERuZkJscGt3VTBkS0lnS3NKZGswWHdMWm1kRW5I?=
 =?utf-8?B?aW8zRS9DcHFFMUxWRDlQZi9wbGc2dTFrTWIxelFxNzJVUmpzZG9MRVhMY2ZS?=
 =?utf-8?B?amt6Q1NUOWZ6eWlPRjZnSmlIK1ovWXBCWnIzWUJ1UXI4UktLa0w5Z2VNU2dp?=
 =?utf-8?B?V3lTc0s0a0M4VitWeVZEbkFWTjVDQWxrZVhZVGljZ2JvbXlXQmJ1ZENFV1JR?=
 =?utf-8?B?NjB6MVhoWW5HSGVGVnk1cDM0NTJUWUVFMnV6MUJNKzVRem84SGt4VjFJRmhR?=
 =?utf-8?B?VUF5eHgycnFZUHpVRzUxdC9CMjNNWnU5WFFaNDdpMklYUGl5TnlLeXV3ZmNX?=
 =?utf-8?B?YnF0TkRVTURLUTdHQ0x2eXczbnMwZ2QvTjIrd2xIeGVRdHVmR3phcWV0NHlw?=
 =?utf-8?B?NEhmNDhxaXJUV280OEJDMTgwVlZaQVRSd3Z4eWFTUkhhQ0RrVm4xN1ljZVBR?=
 =?utf-8?B?VUNmSk1xZ2ZDeElXTVFKWmNaRW9SR2xxbi9jMGx5cVozeklLN3RJU0RJWGJT?=
 =?utf-8?B?dk40VERuTUhnWGhKOVQvamVNQVdYSC9vZ3M1cHFFZEo3eTdvWnZ6eGR2ZmdV?=
 =?utf-8?Q?HENzUGt1vFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm52YnAvc2tnZ2FTWlcya1ZNVDliSlpTU25odTdnb3lUaDJjZ1VzRklKdEVi?=
 =?utf-8?B?b2RNUGl6Nkx5ajgvTVdscEZ3Um9lVW4xNmJtYWZQV3JXYlAyVkcxdEM4d0xG?=
 =?utf-8?B?UXM1UHVVZjkzQlVETkxqOGdPTUd1N1UvNFIvWEVPeFltSHhxdzlNS2RzSDRZ?=
 =?utf-8?B?WWk3bThFYW9pcWJWNCtpaklnL3lSU1VCWms3a0Z4RndaemhxU01RV2JvL052?=
 =?utf-8?B?V3M1V1Y3U2FUQVVld1hmblUvOXozajBVU0VIM3F6dk9mWHlBMTRVQ012OXk4?=
 =?utf-8?B?cm1UclNIMU13TDh2dTFWQmFuRjA4Z3JTZ0ErbGI2VGtseDF5Mi9hN04veXAz?=
 =?utf-8?B?N2ptM2dCNS9XN0RvWkpmUnRZR1hTbjVVL2p6cG96MTJXT0p5eDFBS2dRN2FG?=
 =?utf-8?B?REc0ZTQ2dFFUS3ByUUJtR0JHdmlIcWZuaXgvWmxkVDB5QnFISWpxSnhRS0ow?=
 =?utf-8?B?TWNWQ0ZibkVMOFQ5cC9MZmJPL3ZxYWVicndVbVNPUEN0T2dQeVY2VFpVTlBp?=
 =?utf-8?B?emI4a05CSkpBaGwxVTJmQnVJazlPTGRvUVh0TFFGQXdyQ2c1aEc5cHNET2V6?=
 =?utf-8?B?RjR5ZWJWdDVpeHhxU3Q0REdwUWtBQjhFcnp0ajF5dEZIRVFPM3lpeFBtaTk4?=
 =?utf-8?B?djJmaWtzbmErcG5DTk9nZk1aNmlXT3YrSEVjOENhSFlmL2o4VHNRTkh6a0xD?=
 =?utf-8?B?eTR0L1NXVGJ1RjRydkROSGIzTzQxdHNKZVRLVHVxWkRyOVVuZ25yTCtjK0RN?=
 =?utf-8?B?RFIvUXg3UllQSVhOZUpJdmZMc1pSWDlNTG84aFhjdTRZUE5kTm4rbk93Qkor?=
 =?utf-8?B?UVhZQ0pxOXgrL1ZlR2tKL0JuYnptc0pXVVNQQ0l4TTZGSVdScE1CTjhWWndm?=
 =?utf-8?B?ZEtKQ01xR0s1cGxkVU5LV25zcTNRTFMzeEVXNVp1b05zbkRCUUlFbUMyWnI3?=
 =?utf-8?B?ZzVWSWRuY2x3VjQ1clZFY3pnSXMvR1NRaDJhOWk5VWMzK0JiQlBtK2lPQnNj?=
 =?utf-8?B?SnJjK1VoUk5CQWYxU1ZBakNVVXBlODVFdHdmRkl3VURyUWpHQnhKVktscE0y?=
 =?utf-8?B?QXVsQ3Z0QUV6TytRdUJpcWRweTNDNndBS3c3L2JuSm5HdWcva1hMK3lrRWdl?=
 =?utf-8?B?OTBUTlNhaHVGL2JLcSttMGNtZDRoaVVMam52WGVFS0FNQSttS1dsak1KNGNU?=
 =?utf-8?B?VjdkV0czTGhwQW82ejJORWUxNlFZOEpxTm1vZGt4Ynp6WmFzcnJzT1lEbFRJ?=
 =?utf-8?B?THFZMnFvb2tCZkxia05oaTJReUJFMEpQWEEvbDNGTkFtV2hMcHUvaGlVVVIx?=
 =?utf-8?B?N0NrY0dZc29zVVNyWjVzRmYwQTRPMlQxZnMwOFRwamJUM1JkOVFFbklGaits?=
 =?utf-8?B?azhIdk1qQWtsU3k1SGhwdWQ1NHluZzFoODlvZXFjdDBqSkgzZjV4d1lUQXVu?=
 =?utf-8?B?bDczZDFLWmJBSmNueFFBOWJQTDhIbk0wMmlaN2RyT1NzRVFmcVZ4c1RPZlgv?=
 =?utf-8?B?bDdleGNIbUdGMk95cnVtK3NyUzJqcFBxM2xBc1BwS1cvSzZpYzdKTU4wL2lx?=
 =?utf-8?B?TFFWZGZlRXdnNHFFRVdxKzBUVUtlNmw4MDlNYWNvVEVSdmZ6VVR6RVdYQUJu?=
 =?utf-8?B?b082Z2JwclpFaUhYOUFpbHBQeVp5VGxrTVZSZTA2TjhlZDFMckhDbWIzdVdz?=
 =?utf-8?B?cEd1ZS9BWlNzU21QbUtkRjR1cS8zU2Q5UGluZTVrUGxYT2Iyek1yWEVtYjRv?=
 =?utf-8?B?aU1Ja05YaVU4OVM2UkNjdGh1QlIxcGwrdDFyTm04MERuTlNiQUt5cG40dnBE?=
 =?utf-8?B?ZDFQaDZVcWZ2bnY4ci94czJ1dTUxK0hyTk9VdEExc0syQ3dsTHV0cWhoWVVM?=
 =?utf-8?B?QnYzNjNycE9ZbE1rRCtBcWlhaUJYU2lCR2hSRi9qU2R0djhyaUppUk54aDFr?=
 =?utf-8?B?VHA0WkpxTnhmRzZSOE1yZmdCaTNKQy9RbkM1MEY1TXk4UHVMOVBtelZaYkFC?=
 =?utf-8?B?L3MyYXhHS3pJZjgzSW5OQmp0VDRuMDRLVlZYMUhzaVIxQklFUEgyRGhQNURT?=
 =?utf-8?B?N3VTTDMyby9BY0JJRVFQa3YvQkNhUlhDdzBOOEZPbTU5RE1WNzdnTHFIRk1i?=
 =?utf-8?B?MEhFcm9FbCtxQi8yOW13bUhnS2w0aWNVTUgxdHByQTB3VDRqR2NxMURyN3dH?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adfb251-368b-43e5-ab71-08ddfb580a29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:49:30.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rso9BHMFM8rhKFQl+8Dcy/9i2lhvTtoupD06LuJiye9BYHeFq0xLBVXru5Xxofd67JzWwbLrrebeXVikIAxP5qAmxoUiuSsb1sEqlGmP3so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> VF recovery is a per-GT operation, so it makes sense to isolate it to a

that was also my suggestion to make it per-GT, good to see it happen now

> per-GT queue. Scheduling this operation on the same worker as the GT
> reset and TDR not only aligns with this design but also helps avoid race
> conditions, as those operations can also modify the queue state.

but while the recovery is per-GT, we should still protect against that
one GT starts the recovery sooner then other GTs notice about it

> 
> v2:
>  - Fix lockdep splat (Adam)
>  - Use xe_sriov_vf_migration_supported helper
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 170 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          | 242 +---------------------
>  drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
>  6 files changed, 169 insertions(+), 258 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index c9d0e32e7a15..cfb71b749e52 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -25,11 +25,15 @@
>  #include "xe_guc.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
> +#include "xe_guc_submit.h"
> +#include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> @@ -314,7 +318,7 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>   * Returns: 0 if the operation completed successfully, or a negative error
>   * code otherwise.
>   */
> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> +static int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
> @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>   * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
>   * @gt: the &xe_gt struct instance
>   */
> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>  {
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
> @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>  		xe_default_lrc_update_memirq_regs_with_address(hwe);
>  }
>  
> +static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)

nit: if this is static then could be just:

	vf_start_migration_recovery(gt)

> +{
> +	bool started;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	spin_lock(&gt->sriov.vf.migration.lock);
> +
> +	if (!gt->sriov.vf.migration.recovery_queued) {
> +		gt->sriov.vf.migration.recovery_queued = true;
> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> +
> +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> +				 "scheduled" : "already in progress");

with this .recovery_queued flag, can we hit "already in progress" case?

> +	}
> +
> +	spin_unlock(&gt->sriov.vf.migration.lock);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>   *   or just mark that a GuC is ready for it.
> @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>  
> -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> -	/*
> -	 * We need to be certain that if all flags were set, at least one
> -	 * thread will notice that and schedule the recovery.
> -	 */
> -	smp_mb__after_atomic();
> -
>  	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
> -	xe_sriov_vf_start_migration_recovery(xe);
> +	xe_gt_sriov_vf_start_migration_recovery(gt);
>  }
>  
>  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
> @@ -1175,6 +1192,139 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  		   pf_version->major, pf_version->minor);
>  }
>  
> +static void vf_post_migration_shutdown(struct xe_gt *gt)
> +{
> +	int ret = 0;
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	gt->sriov.vf.migration.recovery_queued = false;
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	xe_guc_submit_pause(&gt->uc.guc);
> +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);

this |= seem unneeded

> +
> +	if (ret)
> +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");

is this the only possible reason? maybe worth to add %pe ?

> +}
> +
> +static size_t post_migration_scratch_size(struct xe_device *xe)
> +{
> +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> +}
> +
> +static int vf_post_migration_fixups(struct xe_gt *gt)
> +{
> +	s64 shift;
> +	void *buf;
> +	int err;
> +
> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	err = xe_gt_sriov_vf_query_config(gt);
> +	if (err)
> +		goto out;
> +
> +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> +	if (shift) {
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +		if (err)
> +			goto out;
> +	}
> +
> +out:
> +	kfree(buf);
> +	return err;
> +}
> +
> +static void vf_post_migration_kickstart(struct xe_gt *gt)
> +{
> +	/*
> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> +	 * must be working at this point, since the recovery did started,
> +	 * but the rest was not enabled using the procedure from spec.
> +	 */
> +	xe_irq_resume(gt_to_xe(gt));
> +
> +	xe_guc_submit_reset_unblock(&gt->uc.guc);
> +	xe_guc_submit_unpause(&gt->uc.guc);
> +}
> +
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +{
> +	bool skip_resfix = false;
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	if (gt->sriov.vf.migration.recovery_queued) {
> +		skip_resfix = true;
> +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");
> +	} else {
> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> +	}
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);

nit: this looks cleaner:

	if (skip_resfix)
		return -EAGAIN;

	return xe_gt_sriov_vf_notify_resfix_done(gt);

> +}
> +
> +static void vf_post_migration_recovery(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
> +
> +	xe_pm_runtime_get(xe);
> +	vf_post_migration_shutdown(gt);
> +
> +	if (!xe_sriov_vf_migration_supported(xe)) {
> +		xe_gt_sriov_err(gt, "migration is not supported\n");
> +		err = -ENOTRECOVERABLE;
> +		goto fail;
> +	}
> +
> +	err = vf_post_migration_fixups(gt);
> +	if (err)
> +		goto fail;
> +
> +	vf_post_migration_kickstart(gt);
> +	err = vf_post_migration_notify_resfix_done(gt);
> +	if (err && err != -EAGAIN)
> +		goto fail;
> +
> +	xe_pm_runtime_put(xe);
> +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> +	return;
> +fail:
> +	xe_pm_runtime_put(xe);
> +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> +	xe_device_declare_wedged(xe);
> +}
> +
> +static void migration_worker_func(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, struct xe_gt,
> +					sriov.vf.migration.worker);
> +
> +	vf_post_migration_recovery(gt);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
> + * @gt: the &xe_gt
> + */
> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> +{
> +	init_rwsem(&gt->sriov.vf.self_config.lock);
> +	spin_lock_init(&gt->sriov.vf.migration.lock);
> +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +
> +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +		xe_gt_sriov_info(gt, "migration not supported by this module version\n");

we likely don't want to repeat that message on every GT

> +}
> +
>  /**
>   * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index bb5f8eace19b..2ac6775b52f0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 7b10b8e1e10e..53680a2f188a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/rwsem.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>  #include "xe_uc_fw_types.h"
>  
>  /**
> @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
>   * xe_gt_sriov_vf_migration - VF migration data.
>   */
>  struct xe_gt_sriov_vf_migration {
> +	/** @migration: VF migration recovery worker */
> +	struct work_struct worker;
> +	/** @lock: Protects recovery_queued */
> +	spinlock_t lock;
> +	/** @recovery_queued: VF post migration recovery in queued */
> +	bool recovery_queued;
>  	/** @recovery_inprogress: VF post migration recovery in progress */
>  	bool recovery_inprogress;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index da064a1e7419..7d91553c4acc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -6,21 +6,12 @@
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
>  
> -#include "xe_assert.h"
> -#include "xe_device.h"
>  #include "xe_gt.h"
> -#include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> -#include "xe_guc_submit.h"
> -#include "xe_irq.h"
> -#include "xe_lrc.h"
> -#include "xe_pm.h"
> -#include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
> -#include "xe_tile_sriov_vf.h"
>  
>  /**
>   * DOC: VF restore procedure in PF KMD and VF KMD
> @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>  	xe->sriov.vf.migration.enabled = false;
>  }
>  
> -static void migration_worker_func(struct work_struct *w);
> -
>  static void vf_migration_init_early(struct xe_device *xe)
>  {
>  	/*
> @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>  						    guc_version.major, guc_version.minor);
>  	}
>  
> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> -
>  	xe->sriov.vf.migration.enabled = true;
>  	xe_sriov_dbg(xe, "migration support enabled\n");
>  }
> @@ -200,238 +187,11 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	unsigned int id;
>  
>  	for_each_gt(gt, xe, id)
> -		init_rwsem(&gt->sriov.vf.self_config.lock);
> +		xe_gt_sriov_vf_migration_init_early(gt);

still, this should be called from gt_init_early kind of functions

>  
>  	vf_migration_init_early(xe);
>  }
>  
> -/**
> - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
> - * @xe: the &xe_device struct instance
> - *
> - * After this VM is migrated and assigned to a new VF, it is running on a new
> - * hardware, and therefore many hardware-dependent states and related structures
> - * require fixups. Without fixups, the hardware cannot do any work, and therefore
> - * all GPU pipelines are stalled.
> - * Stop some of kernel activities to make the fixup process faster.
> - */
> -static void vf_post_migration_shutdown(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -	int ret = 0;
> -
> -	for_each_gt(gt, xe, id) {
> -		xe_guc_submit_pause(&gt->uc.guc);
> -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> -	}
> -
> -	if (ret)
> -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
> -}
> -
> -/**
> - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
> - * @xe: the &xe_device struct instance
> - *
> - * After we have finished with all post-migration fixups, restart the driver
> - * activities to continue feeding the GPU with workloads.
> - */
> -static void vf_post_migration_kickstart(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	/*
> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> -	 * must be working at this point, since the recovery did started,
> -	 * but the rest was not enabled using the procedure from spec.
> -	 */
> -	xe_irq_resume(xe);
> -
> -	for_each_gt(gt, xe, id) {
> -		xe_guc_submit_reset_unblock(&gt->uc.guc);
> -		xe_guc_submit_unpause(&gt->uc.guc);
> -	}
> -}
> -
> -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> -{
> -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
> -}
> -
> -/*
> - * Notify GuCs marked in flags about resource fixups apply finished.
> - * @xe: the &xe_device struct instance
> - * @gt_flags: flags marking to which GTs the notification shall be sent
> - */
> -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -	int err = 0;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (!test_bit(id, &gt_flags))
> -			continue;
> -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
> -		if (gt_vf_post_migration_needed(gt))
> -			continue;
> -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> -		if (err)
> -			break;
> -		clear_bit(id, &gt_flags);
> -	}
> -
> -	if (gt_flags && !err)
> -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
> -	return err;
> -}
> -
> -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> -			return id;
> -	}
> -	return -1;
> -}
> -
> -static size_t post_migration_scratch_size(struct xe_device *xe)
> -{
> -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> -}
> -
> -/**
> - * Perform post-migration fixups on a single GT.
> - *
> - * After migration, GuC needs to be re-queried for VF configuration to check
> - * if it matches previous provisioning. Most of VF provisioning shall be the
> - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
> - * range has changed, we have to perform fixups - shift all GGTT references
> - * used anywhere within the driver. After the fixups in this function succeed,
> - * it is allowed to ask the GuC bound to this GT to continue normal operation.
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
> -{
> -	s64 shift;
> -	void *buf;
> -	int err;
> -
> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	err = xe_gt_sriov_vf_query_config(gt);
> -	if (err)
> -		goto out;
> -
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			goto out;
> -	}
> -
> -out:
> -	kfree(buf);
> -	return err;
> -}
> -
> -static void vf_post_migration_recovery(struct xe_device *xe)
> -{
> -	unsigned long fixed_gts = 0;
> -	int id, err;
> -
> -	drm_dbg(&xe->drm, "migration recovery in progress\n");
> -	xe_pm_runtime_get(xe);
> -	vf_post_migration_shutdown(xe);
> -
> -	if (!xe_sriov_vf_migration_supported(xe)) {
> -		xe_sriov_err(xe, "migration is not supported\n");
> -		err = -ENOTRECOVERABLE;
> -		goto fail;
> -	}
> -
> -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
> -		struct xe_gt *gt = xe_device_get_gt(xe, id);
> -
> -		err = gt_vf_post_migration_fixups(gt);
> -		if (err)
> -			goto fail;
> -
> -		set_bit(id, &fixed_gts);
> -	}
> -
> -	vf_post_migration_kickstart(xe);
> -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
> -	if (err)
> -		goto fail;
> -
> -	xe_pm_runtime_put(xe);
> -	drm_notice(&xe->drm, "migration recovery ended\n");
> -	return;
> -fail:
> -	xe_pm_runtime_put(xe);
> -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> -	xe_device_declare_wedged(xe);
> -}
> -
> -static void migration_worker_func(struct work_struct *w)
> -{
> -	struct xe_device *xe = container_of(w, struct xe_device,
> -					    sriov.vf.migration.worker);
> -
> -	vf_post_migration_recovery(xe);
> -}
> -
> -/*
> - * Check if post-restore recovery is coming on any of GTs.
> - * @xe: the &xe_device struct instance
> - *
> - * Return: True if migration recovery worker will soon be running. Any worker currently
> - * executing does not affect the result.
> - */
> -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> -			return true;
> -	}
> -	return false;
> -}
> -
> -/**
> - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
> - * @xe: the &xe_device to start recovery on
> - *
> - * This function shall be called only by VF.
> - */
> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
> -{
> -	bool started;
> -
> -	xe_assert(xe, IS_SRIOV_VF(xe));
> -
> -	if (!vf_ready_to_recovery_on_any_gts(xe))
> -		return;
> -
> -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
> -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
> -		 "scheduled" : "already in progress");
> -}
> -
>  /**
>   * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
>   * @xe: the &xe_device to initialize
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 9e752105ec2a..4df95266b261 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -13,7 +13,6 @@ struct xe_device;
>  
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  int xe_sriov_vf_init_late(struct xe_device *xe);
> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 426cc5841958..6a0fd0f5463e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -33,10 +33,6 @@ struct xe_device_vf {
>  
>  	/** @migration: VF Migration state data */
>  	struct {
> -		/** @migration.worker: VF migration recovery worker */
> -		struct work_struct worker;
> -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> -		unsigned long gt_flags;
>  		/**
>  		 * @migration.enabled: flag indicating if migration support
>  		 * was enabled or not due to missing prerequisites

