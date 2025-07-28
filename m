Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDA2C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 06:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DF910E496;
	Mon, 28 Jul 2025 06:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx/PiK3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9B10E494
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 06:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753685703; x=1785221703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GAZncqGBKsJzu3QaSIjDUqMUmZWzsDn1f5ws9Cl8EyQ=;
 b=cx/PiK3uNfwxSoxJyvs9UkaEPgxw1hJwidYkUSJU10vWHz4Pm02GoTGc
 qeOpIE2u26kMHeMJ2aS390uIWiGY+mU6zGB//kgCqDSry7lbIN9uZnglk
 SzRMjYiRFpAWEy2G2zccnfBkKgTd3Ivjgrgu82YPhAbthqKBDcCojVztp
 lxmw8O7UMdkdhcppEjgVVQOQtUaZFT/SKmj1dJyoJanWp+BKfH1KoTM40
 l4B13guEFBl+CLIF5OfgD18FvYRVqHfYw9mCHbeGdBQRBlnnsfrI6SXLM
 CdtLDisxJULgFsH3VkSJHvCBZpv/bCVeJNMpz+pbu0emIz5Le6donqZrD A==;
X-CSE-ConnectionGUID: Nn1k7m1lQo2f6u3r3RM56g==
X-CSE-MsgGUID: tDjaoVuFT2uXHCuGnvZD2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="81370825"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="81370825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:55:03 -0700
X-CSE-ConnectionGUID: WnY8sZQoQK2gxuvNV/1pVw==
X-CSE-MsgGUID: 5CaVsTT4TPGjcsRssLB9Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166816442"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:55:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 23:55:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 23:55:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 23:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDUeNBIgLe4iJR+6AKUSYsqV6FJPxVk4mvUEmjVXQrWHt/rTUcFVpWtzVa+6R8FSGTgM+3WR7w1cMWOCAxZAnxGPrfthCJe+L0y9dPTYx+UD1VLA9daCum0SWGu6amqZsiF1+AVN+XjZRK3AZE2DUXPoYwMdRW7FSlLs57WA4GU8JNpOsZGjzNkN7r2B8N3OgPxCAkua2X+8GEpNmRm2dNifQB1JMbvFetHX27JouQ39+X9IdPjZ4IVCDiZfcSjiTXbNqxQrZxHexBeYFXak+5sJj03h+j5hP6s8DjBJ0EzcdI2TqAnfBlPC4vEVmxvVbKpgi/jMSoeJO5UZtwPwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT1WWRfjBn8rRIsVQh7/KjxYkTlfO2i250Uci3Fk8t4=;
 b=QMeuXo9zmkXJMfMcvlGarOrJ92Jkn0KTdmXjlMzunLDa50+pDwNcharJCrzwp6qEF8GaY01YGqDmBdGx83m6qz0GOoDWj6THQyiNXkklwMdlh1OxYBu+Qct1zS2nTWfZj994sIqJGYW/E2rmL5dYSUAItfONjeGmSfyxTFvmzSiMKKUf+g1uawOD9mzkGxTKrf+oB8ofWpInNWAnjnI89ysRsIfLCWav/goILAaBZzp2G9gba4hhJ6YrZL2CgcUOxw7uBDcPxbw17VOmRux2BDSCvtYPc8ETlUQuKj8niFNZHHDNdqJgROy6pj6pA48yaTAj+qb9p02Irc9/1AWW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 06:54:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 06:54:32 +0000
Message-ID: <08320779-14c3-4485-ae2a-cd6b2de2e22a@intel.com>
Date: Mon, 28 Jul 2025 08:54:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0228.eurprd07.prod.outlook.com
 (2603:10a6:802:58::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 601dd074-f3ff-431b-0927-08ddcda39b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUd6ZXYvdkdUcWxTeGoralBYbGlka24rQVVnVjA1YnRQdGtYNnlON1FkUHZn?=
 =?utf-8?B?THNkQmFBL0dGc01DVGxvWEtEQVlQcDlVQktpTWVZRHlEV0dRUzl1M3F6WCsx?=
 =?utf-8?B?b3h2RCtiY0x6NnpNaHZnMGpsaUxwT3RNSmhUb3diU1VBVWNNV1FlTjIvNUx6?=
 =?utf-8?B?dlNtYTlWVEhFazVwTjIwdUZWQVV5NG1NOHZYOTNYcEpGYm42eEIyRVRJdzRF?=
 =?utf-8?B?ZTFLdGM0MlhCdjRBVGVpQWtBRm9ucDQxMnRXUWhLdEhBSWpGcTUyQUVxekQy?=
 =?utf-8?B?cGNEQ3R4WnVuT010T0Qxd2EwcHVuTDR4ekNYcU5jZVFTKzZWQ0lHZmRmM1pu?=
 =?utf-8?B?bk1FTUNtb1hRZEFBV3FGZlA1V2VyV3NEZC9HdVY2UGt6Z1R4RlF3SlJ5K0Nx?=
 =?utf-8?B?MVF5ZlJhZFpHQmc0aStqYmNqSmxEQnU1UE12MFB4bmVuZ2pPS0w3UGlOeCtO?=
 =?utf-8?B?TlZNdGx1b0lQaHNYYUdRNm44bEd4WG9ybkx3eFI0bDRtWmxiYzlrcmlPK1pN?=
 =?utf-8?B?dHRJa3c2eG1MbEVVVGVNaDRDT2plN1kzbVNPSGlpa1ZTVlhJUE9PTExjQlZO?=
 =?utf-8?B?VWtvMlYvY1N4cEJvZVE5cWkxSEF3TW11VTNaYnlOSE5xSXNWRHJ1T3BqZ2VM?=
 =?utf-8?B?Zi9HdzllZlF4UUhJYy8yUWZQY1lXcHprTTI0Q1IvQ3k3VkdFM3NGZmpFYUpI?=
 =?utf-8?B?ZktOd3NNQWNPckRaZTdXaFc0OUl1NHVXbjdNQUtwSUJNNllWRndwdW1kdmh3?=
 =?utf-8?B?RFh5WUNaWndjbi9JYnh2ODVhYXhpR3BHT0l3OTE3TE02M3NqcHczbXhBR2RH?=
 =?utf-8?B?N2xLZXJlZCtHSGtIR1JWaTltNmNXcXpHYXBpVWhCNzZhdVlyZ3Q3WjJKVlgv?=
 =?utf-8?B?aThBeFRIUkkyWGptU3pqc2l2bkdTSzNxWUg1RzNKZDZPN1h3T1p6T2lONnA0?=
 =?utf-8?B?cUF2cHJ2WlNTUGUvYkx5VFErcGlBenhhUFRMK3drc1pZeU9VN04wcFJDV2tQ?=
 =?utf-8?B?WExDZ2dGVGZUbVgzTTlXWEN1MVZDUm1kakdLa2QyL2p2d051N1d2U0V2Z1A4?=
 =?utf-8?B?SUdITnZQaEIvOEVVWVlpaGdIYVRlMnhUS1g2WURabWpSRDgzNXpSZnFBQndG?=
 =?utf-8?B?VGtRN29nSnNINTFTMVVDU2p1Y3Zoc1ROQ1ZvVkRtTTRmeDM5KzQ4V3lISXFR?=
 =?utf-8?B?TXJveXNSODFPOU93WkZQUS9WWms0bUZZU0RMTHlTYUM2N08rSnBYcVNJSEl3?=
 =?utf-8?B?eXhJQ21uRmNHR1JnUHFhUnU4R3VXUEU0a3hMNWZSQXpTVmxXTFliVnJpL0ty?=
 =?utf-8?B?aWtpWjEveGFTWXRjb0Y1bFNOL2VUMjl3cVdVc0dRNm02cHMrNUpZMmpmRVZk?=
 =?utf-8?B?M1FPcmxXcFFMMFZhdVQ0aHN1QUpaMDViamJkL3FtSjUzQ2JlRFFEaFRkRVRz?=
 =?utf-8?B?TGszMHN1dStSL0ErNGxvSTNTNXFNb1c5a0VvNWkxNy9hbTQrN3ZYQUJnY1gy?=
 =?utf-8?B?Syt6UTJvMWNMbElTbnY2dlNwMlhETkxmWVdTdXNvM2NXTkJLakRNd3k5Z3ox?=
 =?utf-8?B?N2orRk00OEJEcDJCSnVyUXJVdFBmcUQxUTd2NUJZS1N5RzlQaWtqWlpuL1lM?=
 =?utf-8?B?WXhlcTRldnZGZDg3QnhzTVU3U21Ec1RaMzhJUW5iYmVmTWhBMjVwRU1BbU0r?=
 =?utf-8?B?YWQ5VmZuTWFmanQrNENTMkZtUUh2bGVlRXlxdFQzbk1wbS9FTitxVzZNSnp1?=
 =?utf-8?B?MVJGU2g0SUpXS0pleUQzaW5BeWtMQVNoT1NEK2lJYlRjWXh0bC9kcUw3Uysy?=
 =?utf-8?B?dXlrdW1kWSt6TUR2OEozRlJKb21SS0ZnVjczYjJpOU1mWS95VW5BUlhpRkdJ?=
 =?utf-8?B?b0RxQVRSN1Zways0NkhaL3dYVVhhMkU3S0RQamNwOEptOFk4bjZkV1M3eFZs?=
 =?utf-8?Q?kFJ4FGc1+QE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3pyNm9UVUhaeUwzV0RFT0tvcjVVeklPWFZ0cldUcWorNGJvQytyWkxwNmhW?=
 =?utf-8?B?aE8zeGZ5Q3BuVnVYa1NRMG5DZlNPSnhjWTlxMnNzUXF6aVdHbWVXTVJvMGFG?=
 =?utf-8?B?dFZqcjZBRWJJMEZlRU1pQllIQ1hEd21PL0hKdDFFU2E3REcvVmI2VWVXRjlY?=
 =?utf-8?B?anJ6ajVrbms4Umg1L3B0ejVjdFZnVkZsazdiSW5pdktCRnozQ2RJTVNrdWlY?=
 =?utf-8?B?UGhCREIrVk80WEh0eUlXOUdpWDRRQkxIU3Y0TzlwZm51ZmZhUFBwK2FzUzNy?=
 =?utf-8?B?SXFxdTdjZGxDa2FKNFZjelUvZisvZVNBd1NHRXd1V2pRdHp4V3I5eHNiUUFu?=
 =?utf-8?B?UW9LcnAxT0VVWDM3bDN1YnlpNE1IVWdHNk9qV2VZNGRjNzZqWk9RZjdoNUFa?=
 =?utf-8?B?S0JqU0xYTlpsVDNINXVLa3ZDSmR3OWFySndGOUJNSktlaDFsemFRV2ZlMGY1?=
 =?utf-8?B?Y2pWRjYyR3poYnBhRUJYYWREYVZSSUhRSVhNamwvZUh0bkR3TkxwWlRpNXFy?=
 =?utf-8?B?d3RDQXZZTUlwODlqNk1nZmtqUU5VYzRBdTlTOWcyVTU5RDQzY3dKREpIWWNp?=
 =?utf-8?B?UGsyZTVUOTFRRlc2cktSRDhZS3k4eUFhS1pVVzlYYXRWMkFUWnJEaVV6Vmhs?=
 =?utf-8?B?SVNCaHE3SitFMVpKa1pob3dRMENROFR0RnkrZ25BZWUxeVNWaE4wSGpyU2l5?=
 =?utf-8?B?ZVc4MDJESzNCallhdnd0a1oxSTJHak4yVEtWT1QxUGVkYVZZeGU1aWJFMEJS?=
 =?utf-8?B?R3BQamRtOGZ1dlFzU0NOREJhRXpqQlB0NHFtNDQrZFdUSE1GUTdCakU1L0Vx?=
 =?utf-8?B?YXpBR3JDUklibGJCZW1qUklLNzVYOGlqQ2xJbE5mVFdyKzBIZTE3ZTA1MDEw?=
 =?utf-8?B?MTZyeTAyNlJWN1NKMzNGREVaWEFTb3ppV0ZrWkJmRFI2cXpZK1lPUEpPLzBD?=
 =?utf-8?B?VjJYbDZJdmhyL3BlQnFQd0lBZXlueHFuR3JidUp6eFFLdGNaWnExdXhqcUpM?=
 =?utf-8?B?UUVreHMxU0JDMVZqNXhQdEhzbWlIMWp3NGxwdWZWMlRYeG9MK0R1Z3NQOUo1?=
 =?utf-8?B?V1B3cXZvR3JQRlZpV2JmWDRXWExaQUZCQXJSNVF3aEpjcjZLNG1RWEhqaTJ5?=
 =?utf-8?B?dWRWMXJ2bDJTdEZaYXZhVG9GMDc4M0Y5NGxvY2Zhb3NUUEJ1akhORHIvTngy?=
 =?utf-8?B?UkRhM0lTOExpSjNsMnY1NnNtbVBvZW5rUmlORE5MOFN6RUU2REFCNnFMNXNy?=
 =?utf-8?B?NmsvaHlodUEwbHF1MExzcWxrRHhFOFZ4ZXYraThqRWllcFg3NXI0ZmQ3TElM?=
 =?utf-8?B?U0FoM2dpWlk2VFRMRlVmR1RCTjBWRitGOU5hQmx2YUEzOTgvd2tYZmdEd3Vh?=
 =?utf-8?B?T3RqbG0wcDNjRCtrTE83N3lzVHVHVFRXQ2NndTdIRTNNdHV5ZzFKUlVlaEN3?=
 =?utf-8?B?QnFqZlJ3VHBPQkFnSzVOTHpSdjRmdXpRMHJ0a0QwcHJjOXk4ZmR1ekJvQlVE?=
 =?utf-8?B?ZmZnRWxhRFJpMjc1N21pWGNadC9vcmhaMEFFVjhnaUxoL0F4a293QzNpVFJ0?=
 =?utf-8?B?NUZuZ0RNc1QzZjI3N21DaU5HRTV3V0Fzam9RTHhoU291amlrNXJpMlZWeGVJ?=
 =?utf-8?B?Z0RaTU5iOFNuWUNsRjBxUGJJaVRMRTZQNXJ4M1BkTDJodzhjRTBJTytmNU50?=
 =?utf-8?B?SmVqaGE0ZmR1d1NDcmRrTEE2cWcrMFpLS2lQangrYmtJb09vYWtMUDdlb0Rz?=
 =?utf-8?B?VFBNZmxMdVNMMkJvaWZqQmZONzdjSnVqK1NDM0ovSGMwUlVPL1hWZFNZdjFM?=
 =?utf-8?B?SUtkSEZzbGxBTStLYWN0YU1KMDc4WG1CcnlHbUZ1aEpjcnVETElnRWdraTdN?=
 =?utf-8?B?bm1HczFGWFBmN2Q4Y25FUHZWS2NwMjA1SXMwOExLc0NiWU5wUTZUVkJVYVo5?=
 =?utf-8?B?SUdEK2QyTSthbVQ2YmpUOUVuakp6ZTJnSGE4d3pEdEZTUEF4MjFQdXdOQ3Vm?=
 =?utf-8?B?ZUMvck94Y2hLbGEzODVTWnViNkVvSmxiM0dScEZoVnUrU2txRXE4c2ZpZENN?=
 =?utf-8?B?RTVEeUdYbExHcmpkR1BtZkIrYzdrcE4xL05kNW9scngzRWg4a2lCQVd1aTFy?=
 =?utf-8?B?dWRZcTRBMHVCZFF0ZzNGU1A2VzlqNWVBeE51aDAxNjVrYmhqOHgwL0ZINXVD?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 601dd074-f3ff-431b-0927-08ddcda39b67
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 06:54:32.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APDl7oTVKlotZI2eiCY5IBIRUsdQ3F8qfOL2uXDPJ2Aa30nOk8yyuKjO6REiejVnMKDz2WjDWuAn2Hgh6eK9Xe1UvEurQYPYNePJwOsl9qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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



On 7/28/2025 8:40 AM, Satyanarayana K V P wrote:
> The VF CCS save/restore series (patchwork #149108) has a dependency
> on the migration framework. A recent migration update in commit
> d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> caused a VM crash during XE driver release for iGPU devices.
> 
> Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel enabled
> CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W           6.16.0-xe+ #4 PREEMPT(voluntary)
> xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1 negotiated ABI version 1.0
> Tainted: [U]=USER, [W]=WARN
> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
> RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF ABI 1.0
> Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
> RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
> RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX: ffff88811a028c40
> RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
> RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
> xe 0000:00:02.1: [drm] GT0: reset done
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811a029c40
> R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
> FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005af31328c000 CR3: 0000000114534004 CR4: 0000000000f72ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
>  devm_action_release+0x12/0x30
>  release_nodes+0x3a/0x120
>  devres_release_all+0x96/0xd0
>  device_unbind_cleanup+0x12/0x80
>  device_release_driver_internal+0x23a/0x280
>  device_release_driver+0x12/0x20
>  pci_stop_bus_device+0x69/0x90
>  pci_stop_and_remove_bus_device+0x12/0x30
>  pci_iov_remove_virtfn+0xbd/0x130
>  sriov_disable+0x42/0x100
>  pci_disable_sriov+0x34/0x50
>  xe_pci_sriov_configure+0xf71/0x1020 [xe]
>  ? sriov_numvfs_store+0x78/0x160
>  ? _parse_integer+0xe/0x20
>  ? _kstrtoull+0x3a/0xa0
>  sriov_numvfs_store+0x10c/0x160
>  dev_attr_store+0x14/0x40
>  sysfs_kf_write+0x4a/0x80
>  kernfs_fop_write_iter+0x166/0x220
>  vfs_write+0x284/0x550
>  ksys_write+0x6f/0xf0
>  __x64_sys_write+0x19/0x30
>  x64_sys_call+0x2bf/0x2660
>  do_syscall_64+0x93/0x1320
>  ? ksys_dup3+0xba/0x170
>  ? __x64_sys_dup2+0x2e/0x1f0
>  ? do_syscall_64+0x1a2/0x1320
>  ? __rseq_handle_notify_resume+0x447/0x5e0
>  ? trace_hardirqs_off+0x5a/0xd0
>  ? irqentry_exit_to_user_mode+0xdf/0x2f0
>  ? irqentry_exit+0x77/0xb0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7e030351c574
> Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
> RDX: 0000000000000002 RSI: 00005af318d7da30 RDI: 0000000000000001
> RBP: 00007ffd34a107c0 R08: 0000000000000073 R09: 0000000000000000
> R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
> R13: 00005af318d7da30 R14: 00007e03036045c0 R15: 00007e0303601ee0
>  </TASK>

you may want to trim the log to show only relevant info

> 
> Update the VF CCS migration initialization sequence to align with the new
> migration framework changes, resolving the release-time crash.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> ---
> V1 -> V2:
> - Updated xe_migrate_init() input arguments and return type (Michal Wajdeczko)
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
>  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
>  4 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c8eda36546d3..5a79c6e3208b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt)) {
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
> -		tile->migrate = xe_migrate_init(tile);
> -		if (IS_ERR(tile->migrate)) {
> -			err = PTR_ERR(tile->migrate);
> +		err = xe_migrate_init(tile->migrate);
> +		if (err)
>  			goto err_force_wake;
> -		}
>  	}
>  
>  	err = xe_uc_load_hw(&gt->uc);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 90065d7d29ff..7e295ca00763 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
>  
>  /**
>   * xe_migrate_init() - Initialize a migrate context
> - * @tile: Back-pointer to the tile we're initializing for.
> + * @m: The migration context
>   *
> - * Return: Pointer to a migrate context on success. Error pointer on error.
> + * Return: 0 if successful, negative error code on failure
>   */
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> +int xe_migrate_init(struct xe_migrate *m)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_tile *tile = m->tile;
>  	struct xe_gt *primary_gt = tile->primary_gt;
> -	struct xe_migrate *m = tile->migrate;
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_vm *vm;
>  	int err;
>  
> @@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
>  			  XE_VM_FLAG_SET_TILE_ID(tile));
>  	if (IS_ERR(vm))
> -		return ERR_CAST(vm);
> +		return PTR_ERR(vm);
>  
>  	xe_vm_lock(vm, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
>  	xe_vm_unlock(vm);
>  	if (err) {
>  		xe_vm_close_and_put(vm);
> -		return ERR_PTR(err);
> +		return err;
>  	}
>  
>  	if (xe->info.has_usm) {
> @@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>  
>  		if (!hwe || !logical_mask)
> -			return ERR_PTR(-EINVAL);
> +			return -EINVAL;

hmm, shouldn't we call here xe_vm_close_and_put() ?
looks like a existing bug

>  
>  		/*
>  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> @@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	}
>  	if (IS_ERR(m->q)) {
>  		xe_vm_close_and_put(vm);
> -		return ERR_CAST(m->q);
> +		return PTR_ERR(m->q);
>  	}
>  
>  	mutex_init(&m->job_mutex);
> @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	if (IS_DGFX(xe)) {
>  		if (xe_migrate_needs_ccs_emit(xe))
> @@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  			(unsigned long long)m->min_chunk_size);
>  	}
>  
> -	return m;
> +	return err;
>  }
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 3758f9615484..e81ea6b27fb5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
>  };
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> +int xe_migrate_init(struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index af43e04179aa..bf9fa1238462 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
>  
> -		migrate = xe_migrate_init(tile);
> +		migrate = xe_migrate_alloc(tile);
>  		if (IS_ERR(migrate)) {
>  			err = PTR_ERR(migrate);
>  			goto err_ret;
>  		}
> +
> +		err = xe_migrate_init(migrate);
> +		if (err)
> +			goto err_ret;
> +
>  		ctx->migrate = migrate;
>  
>  		err = alloc_bb_pool(tile, ctx);

otherwise LGTM, but maybe wait for Piotr

