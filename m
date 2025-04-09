Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E5DC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 20:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152910E1F1;
	Wed,  9 Apr 2025 20:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFZbdinH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B2E10E1F1
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744232358; x=1775768358;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Bo3j+gFBunjhC+LiJNN9ba/eFwNFSju6Eo/q7hfebo=;
 b=dFZbdinHptcmeRIs0W55I3xCF7gZePyLk57U7ATjpT7/oWflwMLNy16W
 zI+9NR6qiFcOd/6QwXYvdyKtWk2sL0GA3JZLP7M8f9Qq3tWJXFLd0cHP7
 8IqMOxWSDkLQiTvtlveQ8CcIfmKdw+M/0x4SIQT9ylD6EpU9WPz4PNurg
 YIUXePEMaIIzJ5fNP5RYRNAAxCaOf6ncNiIfXd/GVR6KCkeL4Kj0VeOva
 foEFCU5H+nWAAw4dR/xRIt/3W7Pxh/hPOHjcPrD3gdD6dFKs42+3IddoT
 K6j05eb/AxjZAzqOr+ct8L0hQnXapy0Zd9KGRS4E+KHe5DPieT8KT7Gcy g==;
X-CSE-ConnectionGUID: rhV216sdTp6uyG0GQaDsgw==
X-CSE-MsgGUID: vlNo3e2lR16+/CdpfmKvAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56396409"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="56396409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 13:59:14 -0700
X-CSE-ConnectionGUID: sA20Dd31S+yEqbkpM4b5nA==
X-CSE-MsgGUID: 3b6Iw4DKT8eWXBO+1IOSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="133903536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 13:59:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 13:59:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 13:59:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 13:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmZl2Z3iyiO1yF9reVByd6WxeHRpbH0Gsu8Cfe6NHpTv4rzPX35I0fCRoEGW+KcT2GqtT4JBiTj4afeb+vqWn3qIZejNpYp4kjsNpE3kU01f//wXtkBumdT8pUIiz6OWVpnJHI5ElvqkRkDSfQdlAt+V+//FNtSu47ycooXXOTzXxCu5ebnv1EyHrTKwfdTwPL37oI0kv5r2rclKzIxn7S07le2SAS/Cl/sZgdm2dl7SFF46dDIeZL3PYPRgsCZWlLqhKKrTr2EJk++bnQy+CXSdX4psp3uNSAmoRpZ3EHFx3sy4QcTqC85RM7VNVxNALpwH72I/yNlNrs6h23tKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGfU1NLtL91VTYAcz7tgOjbgWBadBN9fCcg3YtGE2Uw=;
 b=rwEk0czUfUwCZaom0eKePFDUe6EDYxY62YSPKqe+0Vyte0pmxjdy8f10Siv8omKfygzuO3i6K91iJkLIZD5mU3vuoR6uqa/HitLK4d1JDlqIE76rD0YBlgBpBV8ItRbhzDY5ddH2VH4eN33J6eMYPFz4nbOzh63U2ornozRre7tOZhhjms2fMtZz4iku3m5Lhp+XeTWLh8nafpmXaa6pr6LpgauGfpFBsdI0ZReV2YNdaG0a59wGMiipM/RV312QTrS91NNbEuiMbPIst7umyg8IJHsdKLuWR9/QsH7CDdeqZm05rXXEJH58aU+VofJGFD+RWhwh3Ze4IcxaWwxdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 20:58:43 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 20:58:43 +0000
Message-ID: <9e61802a-392f-4abb-be5f-99683475d013@intel.com>
Date: Wed, 9 Apr 2025 22:58:34 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 1/4] drm/xe/vf: Divide GGTT ballooning into allocation
 and insertion
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-2-tomasz.lis@intel.com>
 <df3d130a-8d4c-443d-99ba-92d79eda14d5@intel.com>
Content-Language: en-US
In-Reply-To: <df3d130a-8d4c-443d-99ba-92d79eda14d5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f97400-0e4c-4409-1393-08dd77a95027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1cwbnFTNTh4R091M1pZcEN3bFVPL28yK0twTTAxZitndUc3c2tuT0IzZGFL?=
 =?utf-8?B?V2RhZkxsZGZuS3BMMGhyUlFpVUFEajlpUTY0S1NTcE5TeFdLVm9kL3hNQWp3?=
 =?utf-8?B?NUNmU2dwMmNVdFptQk9FbWtRbnF0ZGZ4aDVZSG4vemZOdFFtSE1ETEJ4UFlT?=
 =?utf-8?B?QUd2eTNodWMrM0ZLNWJiUGFveTB0YS8zK1kvY1VNb0hlaXExM2hRamVLNmll?=
 =?utf-8?B?QWMvQW9EcWJZMEFkc0dLZGlEMWhuMXBMWkJERDZDbkVQbXdabXlaTWl4bkJ5?=
 =?utf-8?B?ZDBhNWxaWXVkZFJhaWI0QkFDU09saWdjWTVoMDZGQStUQ1d5NGg0TUlZWWtl?=
 =?utf-8?B?a1dNSUM3aU1xdENaN29qZHZiLzJrSTRnWVowYytiKzNXZTR5a2U2L1RWdzRi?=
 =?utf-8?B?YmxXRnJmSG10L2pRb2dMeDAzUUpNNkN4UUx2Y3lQeDJaNkQwTi9TK3JpVnNQ?=
 =?utf-8?B?eU5OWGV6SE9JQkp6eW5qaFphUm82alI1d3lIa2l1MlZTNVlHT2R1ZCswbXFV?=
 =?utf-8?B?UjRsdSt1ZWg0RmVUc2gzZXVQNDVnYjAvN1FIRWNxNWNOU01ULzdmYmZrNlRF?=
 =?utf-8?B?YUNwd0ZyQmpON200dFB1R0NFYUtJcjRmVTR2dFRId0hhOE1UcUo1SHJReXlC?=
 =?utf-8?B?ZWErNjJ5T2tCT2hTZEFWU3NubEVPQ0JJWTNQNUVsRS9ERWJIRm9leXpZNkJD?=
 =?utf-8?B?a292eG9aVFZ5aVBGcGxPS1BxQjVWOUtiT1dGaDdEeDFRbkZpTFN5T3hzQndC?=
 =?utf-8?B?a0Ywa3ZSdVpmMlJVK1dWK2RtWFhUYkRhTzROR2trZUloNXNsMHB2bVlSU2Z6?=
 =?utf-8?B?eUF2ZHJoUUFoU2N5VTJJbUFybTNQMzhmZXVuZWwvZG9xYUpWcUx4VHhBdlNK?=
 =?utf-8?B?NHlZSlBYZ0p3Tk8xOC9NenFDZnN3M1BBOHRnY004SWdvTVNGbTN3VjN4dTVh?=
 =?utf-8?B?eTFFS3FWb0FmRWcwbjdyc2tHMkZxZXpSQlRSdTNGbWppdm8wU1ZKL0p4YUJ1?=
 =?utf-8?B?VEhTbmVEMHd6Zk5rTG44b201eHdJbUdPcjJNZ1FrSVVVaDM0QnA5b0tjR0Mx?=
 =?utf-8?B?VzFTc0JPN2cxZExWdWxpbkQyUzZmUXJYd21NQkMvUE5BMWtWTkpEWm9FbWsz?=
 =?utf-8?B?TkFBVTgyWnNBR0paemFDZVNHL3g0SC9nclJhcm1XekFTUlpGR3ZNKzYxT1pt?=
 =?utf-8?B?amhvSS9MbEVEWnk5TjBSOUxDenI1clJHQ0FwOU1sQ1dnMDFUQlNsSjRXbjhu?=
 =?utf-8?B?TDEveHAzUWhmWWJnNWJZNHNsSjQ1bXlWWXdJQnNyRDMwLzBiZGN0eVFtSjha?=
 =?utf-8?B?RVdxY3lVTnhlVi9CcFV4T2ViVzFOTmY1cmUrckExcmdZUE1hMkJRam1Wb25v?=
 =?utf-8?B?bUEyYU5kNDIxeTVJWFRyZDBucDBqaDdmUGdveWZxT3pXeWJNZ0o4eC9HVDhk?=
 =?utf-8?B?UStJTXlOWW43OE9kZmJZaXd5RjQrbm10NFdEZlh1ZzdQdFNOT1AyR1VVODNa?=
 =?utf-8?B?SVRBV2VsQVJqd1NOQkRsdm5keXEvWHI4NWd2RVZLR0Z4d1hZaGl4dVdEWFEz?=
 =?utf-8?B?V3l1SDhuRFd1UUtVTXdzdkJrcCswQ0ZnT2VQQWM2NFVTSFB2cWluc0pNME52?=
 =?utf-8?B?WENjcExZRmFrMU9jMzg3MFhqQytjekVSSkxSc3ptN0RNcHk4eUhKRGRycE02?=
 =?utf-8?B?ZThuTktrZkFSSzZIdC9OM3luWHByTzVpcHRQK3k3VzZqdlR0NG9neDF1MmtT?=
 =?utf-8?B?VUFVdFpJOVNEbWJ6a1dyQnZ3TEFlWTZUQTZVRTNvUE85RUVyTi9Xbi91d29z?=
 =?utf-8?B?dGR6RTF6QUlNaVlyaVY5bTBDMUZtazNuMk1RQ1FZWDR6NzR5MFFsbEtjQld3?=
 =?utf-8?Q?2vGr5xLXxniBN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2RuYkpmTW9iVkJJNnNKaFJEY1ZFWWxCUTJVaHR0RlFLYjlQekx4MmdGQjVU?=
 =?utf-8?B?ZXN6U25kQWpPdTFpN0VjN29xdW1FaVJxYnp3akcxSEYxMjMwQythMWdxRVNt?=
 =?utf-8?B?aHZldDdrei9CQ3czZ3VNdjZmSnN4bHZITWwzK1pvMnA5ZEZLbEVrZXhoZ0N3?=
 =?utf-8?B?aURLQk0yNFp5ZGxubWh3VU9EalpLSHVLZ2V2ZnlrcWNtbzE5ZWRMcXFKMFRS?=
 =?utf-8?B?enpib25OS1Bwa3AvL3RKYXpsNmxrZEtxeTk3Z3NzNG4rM1Y1eXRTQTZTR1Na?=
 =?utf-8?B?TE5IVzZWV2lNeXZRVHJvcUpGdlNMTUVjdUx3Z3VUbHZvQTd5MlZlUUM4MG9S?=
 =?utf-8?B?ZnBPUGF4WHdqQVJYd0J1d3k1RlQ3LytJVm5JVjg5NVhRZDAwMm5Lb0VOU1hj?=
 =?utf-8?B?cEE5L0I2V282UzBwY1I4SDFpVkVVWnpxNll3NHBHSkx2RmFqellkOHJqVktX?=
 =?utf-8?B?YkxJNWFocExpUktNem1JRmNTa0xCMWJOUXVaUWR4UzhnQmdwbkcwNDBXSG5s?=
 =?utf-8?B?YVBZamNDWmFaZUZIeklLL3hyR05QSURJWW9wam9NQ1JrMTZLRFBFSkh6MG14?=
 =?utf-8?B?SDAzUkZ2S3B4MmlMZGptNndOV2RTSWJaWU92UlRMcjlBVGVHK2ZPbVVoZTQ0?=
 =?utf-8?B?Y2trQkRTQS9LZ0hzT29QdlpOTEhjOHJzSytVWWJJS1V4bnF6NDZhUlFQZFFq?=
 =?utf-8?B?M0R4WGxzOS9OR3MvNDZOVmY0eDRDRFExdGtpbUhOVE8vSHNsejF1Z3lQSkYv?=
 =?utf-8?B?bFVXbnh3REpjOW41dkYza1lZYjhzeld1RlErbEhlWUFYcWJGVVFtSXg2UEt2?=
 =?utf-8?B?ZlozdnNwdDE5RjNiQy9XRllsYVl6YVRtaVdVNEJnK296ZTFCbnlzMEpxVVJO?=
 =?utf-8?B?dy85RHl5U0VFSlZtNWZ1ektseGxDK21OZHprL1dmMzRRQ1d2VHJxeDR2a29v?=
 =?utf-8?B?OWNZY0wxZzBPUDFvR1NDOWVVT3orOVBlNWVXV25jc2ZRUmJvb3JKT01mcUlV?=
 =?utf-8?B?NkNYdk1OM2p5SGRjM0VkOVBRSDlOMmdFTWJZVEUyejdKUXV2WXdNL21tay9t?=
 =?utf-8?B?RzVUbU03c2owV3R3UVBFai9BdnpuUEZ2dFlOZUZhK2lVSVV1aWFzTElFcnNo?=
 =?utf-8?B?aUh3VUxCajRoK05kWFNydkw1QktTeERRL3k5N0Erdmp3Ykl6dC9Talp0QzE5?=
 =?utf-8?B?SHM3TitIWHgyYUg3UE9FSFgzdTVhS24xM2xCV0xKR1dRN09uZnNkZjU0TUh2?=
 =?utf-8?B?TjJZN3ZiUU9lWmNoZHN2ak5vSzNCckVjNVJpa09OTE01VlJkSVFYc1pZQzNF?=
 =?utf-8?B?OExYYnQ2bEh4RU9LMlBPamZ0dzhYVCtXTG5iU05aRkprMlBFelZwcDF0aGhY?=
 =?utf-8?B?bVl4QTZCNUlmNk9tc3liRStmZDBOUnRTK1Z4eXVVM0xIakxNcW5ONWJJTys5?=
 =?utf-8?B?VEFJbGh0TmlQSm9YbmY5VDBzRy8yNmhzdU5HMjBOSTdjVEUyVzg3a0doSnpW?=
 =?utf-8?B?YWF6Ri96Nk1VbzNWVVY2eTlUNE1UVHhtWFlJSElwMWh0VUoySWVtV1pYeit0?=
 =?utf-8?B?NHhaNmZpMUhQQTJYRTA0UXJnVGlnU0tlZGpRR3VmVmpGQWVZeTVuNXRZNTQ2?=
 =?utf-8?B?cjJrVEJYSU5oOThxeEs4M2ZrZzl1RUZhZnd2YUJYOTY1bkRmWDJXak82ZXVC?=
 =?utf-8?B?THg5d3BOWm92amc4U3FCa0diQnBMUUU0b1JuKzgxWnJHOUtkV2l4d2xaRExO?=
 =?utf-8?B?TUFkRzJjVHh6OFlrKzBlN3pJOVRqOG9KbzRFV0xqKzF4bW9ua21tYk42bm9W?=
 =?utf-8?B?R2lJQ290K0VxcHpuUEcyOURVUVJjV3BHUi9tQlpCYVV2R1dyakw1Z1JycTBj?=
 =?utf-8?B?dWJNUlFzU1RFRzdmREVkTGtneUQrOHMya3N2aTR2L3BCaUo0SDBTYll4NGt6?=
 =?utf-8?B?a09qaTR4VjNSYjNqanJhZFNVTCtjVUxEN2ZTWGdBenN3MDRvNWp3d2RWUHRW?=
 =?utf-8?B?ajlZUWVjR2xlbGloaVhkeGhFUmFndVFwOHR4cFZxcXpYZlVwV1FXeUp4SWxQ?=
 =?utf-8?B?R2NjQ0xGS0VQNUhPTUhsZEJYcm1YRUx0bzMzODUwUWhjYWdwR2hsajh1Y29s?=
 =?utf-8?Q?HnztkZwDnPYdahBsx0DahAmhx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f97400-0e4c-4409-1393-08dd77a95027
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 20:58:43.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z49hq5rgTBnlyMqzdvbuZ1sm7ooV89JZO3nAz8XLpOa+vmEhDca1L93+8gWfidptS1YwyK8aoLPUHWEKxSLiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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


On 08.04.2025 13:59, Michal Wajdeczko wrote:
> On 03.04.2025 20:40, Tomasz Lis wrote:
>> The balloon nodes, which are used to fill areas of GGTT inaccessible
>> for a specific VF, were allocated and inserted into GGTT within one
>> function. To be able to re-use that insertion code during VF
>> migration recovery, we need to split it.
>>
>> This patch separates allocation (init/fini functs) from the insertion
>> of balloons (balloon/deballoon functs). Locks are also moved to ensure
>> calls from post-migration recovery worker will not cause a deadlock.
>>
>> v2: Moved declarations to proper header
>> v3: Rephrased description, introduced "_locked" versions of some
>>    functs, more lockdep checks, some functions renamed, altered error
>>    handling, added missing kerneldocs.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c        |  11 +--
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 102 +++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   2 +
>>   3 files changed, 82 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 5fcb2b4c2c13..769a8dc9be6e 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -447,14 +447,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>>   	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>>   	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>>   	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
>> +	lockdep_assert_held(&ggtt->lock);
> since lock is now prerequisite, this function shall be renamed to:
>
> 	xe_ggtt_node_insert_balloon_locked()
>
> likely with update to kerneldoc like:
>
> 	"To be used in cases where ggtt->lock is already taken.

It now has the ggtt->lock dependency, but this is ggtt_node function and 
not ggtt function.

But sure, will rename and comment.

>>   
>>   	node->base.color = 0;
>>   	node->base.start = start;
>>   	node->base.size = end - start;
>>   
>> -	mutex_lock(&ggtt->lock);
>>   	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>> -	mutex_unlock(&ggtt->lock);
>>   
>>   	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>>   		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>> @@ -477,16 +476,12 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
> same as in earlier comment, rename function to:
>
> 	xe_ggtt_node_remove_balloon_locked()
ok
>>   		return;
>>   
>>   	if (!drm_mm_node_allocated(&node->base))
>> -		goto free_node;
>> +		return;
>>   
>> +	lockdep_assert_held(&node->ggtt->lock);
> this should be earlier in the function, as by API SLA lock must be
> always taken, not only when node is allocated

but should the asserts verify the API SLA, or real state inconsistencies?

either way - ok, will move.

>>   	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
>>   
>> -	mutex_lock(&node->ggtt->lock);
>>   	drm_mm_remove_node(&node->base);
>> -	mutex_unlock(&node->ggtt->lock);
>> -
>> -free_node:
>> -	xe_ggtt_node_fini(node);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index a439261bf4d7..c3ca33725161 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -560,35 +560,38 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.lmem_size;
>>   }
>>   
>> -static struct xe_ggtt_node *
>> -vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
>> +static int vf_init_ggtt_balloons(struct xe_gt *gt)
>>   {
>> -	struct xe_ggtt_node *node;
>> -	int err;
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   
>> -	node = xe_ggtt_node_init(ggtt);
>> -	if (IS_ERR(node))
>> -		return node;
>> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
>> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>>   
>> -	err = xe_ggtt_node_insert_balloon(node, start, end);
>> -	if (err) {
>> -		xe_ggtt_node_fini(node);
>> -		return ERR_PTR(err);
>> -	}
>> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
>> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1]))
>> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> what about ggtt_balloon[0] ? no need to fini() it ?
will add.
>>   
>> -	return node;
>> +	return 0;
>>   }
>>   
>> -static int vf_balloon_ggtt(struct xe_gt *gt)
>> +/**
>> + * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
>> + * @gt: the &xe_gt struct instance
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u64 start, end;
>> +	int err;
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>   	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +	lockdep_assert_held(&tile->mem.ggtt->lock);
>>   
>>   	if (!config->ggtt_size)
>>   		return -ENODATA;
>> @@ -611,33 +614,76 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   	start = xe_wopcm_size(xe);
>>   	end = config->ggtt_base;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
>> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>> +		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[0], start, end);
>> +		if (err)
>> +			return err;
>>   	}
>>   
>>   	start = config->ggtt_base + config->ggtt_size;
>>   	end = GUC_GGTT_TOP;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
>> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>> +		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[1], start, end);
>> +		if (err) {
>>   			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>> +			return err;
>>   		}
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static void deballoon_ggtt(struct drm_device *drm, void *arg)
>> +static int vf_balloon_ggtt(struct xe_gt *gt)
>>   {
>> -	struct xe_tile *tile = arg;
>> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
>> +	int err;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>> +	mutex_unlock(&ggtt->lock);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes which limited used address renge.
>> + * @gt: the &xe_gt struct instance
>> + */
>> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>>   
>>   	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>> +	lockdep_assert_held(&tile->mem.ggtt->lock);
> nit: IMO this is redundant as lock shall be asserted in
> xe_ggtt_node_remove_balloon_locked()
ok, will remove.
>> +
>>   	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
>>   	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>>   }
>>   
>> +static void vf_deballoon_ggtt(struct xe_gt *gt)
> hmm, in this patch you don't really need to split (de)balloon logic into
> locked/unlocked parts, so maybe keep it as it was and introduce such
> split when really needed

By this logic, we could squish everything into one patch. I do not "need 
to" separate any parts.

Also, this has no impact - introducing this change does not affect final 
code, and does not improve readability of single patches. It's just 
cutting a pie slightly to the left or to the right.

I don't think such request should be part of a review. It seem to be a 
matter of personal aesthetics rather than engineering.

The current division is no less consistent than the proposed one. 
Actually, for code readability, it makes sense to introduce a locking 
wrapper here even if locked version was unused.

> also it's quite unusual that unlocked part is named in completely
> different fashion than locked, can't it be (later) defined as pair of:
>
> 	xe_gt_sriov_vf_deballoon_ggtt_locked()
> 	xe_gt_sriov_vf_deballoon_ggtt()
>
> and
>
> 	xe_gt_sriov_vf_balloon_ggtt_locked()
> 	xe_gt_sriov_vf_balloon_ggtt()
We have established that static functions have shorter names, and we're 
sticking to it. It is not unusual, it's the matter of project coding rules.
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>> +	mutex_lock(&tile->mem.ggtt->lock);
>> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>> +	mutex_unlock(&tile->mem.ggtt->lock);
>> +}
>> +
>> +static void vf_balloon_fini(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
> missing asserts:
>
>    	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>    	xe_gt_assert(gt, !xe_gt_is_media_type(gt));

will add.

-Tomasz

>> +
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
>> +}
>> +
>> +static void deballoon_and_fini_ggtt(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_tile *tile = arg;
>> +
>> +	vf_deballoon_ggtt(tile->primary_gt);
>> +	vf_balloon_fini(tile->primary_gt);
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
>>    * @gt: the &xe_gt
>> @@ -655,11 +701,17 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
>>   	if (xe_gt_is_media_type(gt))
>>   		return 0;
>>   
>> -	err = vf_balloon_ggtt(gt);
>> +	err = vf_init_ggtt_balloons(gt);
>>   	if (err)
>>   		return err;
>>   
>> -	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
>> +	err = vf_balloon_ggtt(gt);
>> +	if (err) {
>> +		vf_balloon_fini(gt);
>> +		return err;
>> +	}
>> +
>> +	return drmm_add_action_or_reset(&xe->drm, deballoon_and_fini_ggtt, tile);
>>   }
>>   
>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index ba6c5d74e326..d717deb8af91 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
