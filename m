Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0349AE77188
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 00:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9798610E0DD;
	Thu, 19 Dec 2024 00:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8xrV9pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCA710E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 00:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734567204; x=1766103204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MXQmMvtlwOkrIyyycN7xBIoe594K7M3Z8gEbR130OU8=;
 b=W8xrV9prxpu69mqQ7XpuUzeT/tyR6V91ik3lPZto7RjGVv8A/2JFr6PO
 xDC8olqK14si+esr1kLHnDMW/ozRFnwYwl6DvYBEdmHKzEP+7BcaqSDla
 5gF5BjtnwnyToO69WQEGhG38v3GxnCJoIwo3i2fw9Utp6e6/waHP2WLTU
 G0OZ095s+/NEqbN7F9amQbddOlwb2vPt1jRU8F8XgLjZytXe0FEATO37s
 ++Wjw7k+iYJJuSqEcOeSVkpZhqPRo6KkyqZr6n6gd4NNRWziQ15sKkRGU
 SVogz5aik6roNhoBTAy+s92ro90kPCxhADIMVUqmt9jgwyrqNfoGZndM+ w==;
X-CSE-ConnectionGUID: akLwkheGRdmuEimdbUA9Xg==
X-CSE-MsgGUID: Bz8XszdwRc+9eeuEtZKEtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45660050"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="45660050"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:13:24 -0800
X-CSE-ConnectionGUID: KGgsregWTaSMCuVL5AcyCQ==
X-CSE-MsgGUID: ZPfOhl8ERZGkEgsKQXTIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98500331"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 16:13:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 16:13:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 16:13:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 16:13:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmJpZ9x4URju80RtMUg53JfMvDWiiLdykutia32uf+kYumniE8vbFKQC4KMMh7XFz6Bs9RdGd63veb1XMQRElYJwRNSo0Nz2fe/+5f7PQ3NWH91Rjv8cEA8w3VTw7Z94e8ZzIadqNyiR02j8SM4nkvrOEX6BbOiz+mGwx4MZH3ujXNYxauwKRB57FUiLTeFiXMBycpBBFXUWv93DJIwEUJbgVmHT+6QaMTDRQ7F3Mb5+obgwiEfxfFwHI7mfFHNcxK1w7v12mknu3tj2jqhA0CxmqMnSLr3DDf9LT+e0penLVewBluZSFhdPGeRrnGxI5Iz02934oXviV0317eXoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uiON28wuQL+o3PlV7yMlgcyiiBZQs9Hi0NtumQvvqU=;
 b=shWO25W9JbFtIvyfnvsVOYU12bDrFphM/N6KLxiroGzDb4XZS9mUSWW/4aGK9IpDe2UaBYBdyMA0Y3GOzZLSUcGlV33vv940tDWjwL9K6qfVtdE5N/8HlMaju6uHl8Z03V2dMYqEkeJWAiaiBJdMW0NExcibOgd9zIAdmZHdptncMRhYdkUA8R5srYgl3XmINDVGS7yYykun08IcCpivjoKwuELvOv45OvLG5fE86vUcViwtUVP2wXdTmznX+1jv1BnlAt87+x9JElOhpXAGZjfc3MTWZxCeEOyXScJTA0TO6GT/FB8Ac//l3/nHTzpLTy+XuO50X9gln4oZqs99Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:13:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 00:13:22 +0000
Date: Wed, 18 Dec 2024 16:13:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe: add function to convert xe hw engine
 class to user class
Message-ID: <Z2NlHBRw84jErRNx@orsosgc001>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-5-riana.tauro@intel.com>
 <Z1jTTEkbCJYNJy1L@orsosgc001>
 <c47646f8-b4b1-4ff7-b51c-a363990b9c28@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c47646f8-b4b1-4ff7-b51c-a363990b9c28@intel.com>
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8d2dd3-1027-443c-7f80-08dd1fc1f2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWNVN1A4SmNJTnY1ODM0cmJTM2xjM2F0WHNHQ05janQwUy9taGZXRHdFdzFt?=
 =?utf-8?B?RE5PMUViRXd6eTJKbXEzaC9MU1M0OC9rdHYzS0VxSzYvajhydzUvRG1yeUts?=
 =?utf-8?B?VEFwa1kyTjN3S2hIMGo5UEVKbnJzU0tFZDZmNnRweEhWQkgxMlB5WDl1Z1RT?=
 =?utf-8?B?QjcraEEwcGh6MHdmQ3dpZzgwQStkSnVUcm9RTnhFMENsV2tjSFpicHVhZm0x?=
 =?utf-8?B?czhlUnVkQXUxM0xkY3hodzUzUGozOHVjVmtXazFBQzNJVTFXbDUvaVp0M3B2?=
 =?utf-8?B?RFo2TG83SWQzdXhsNUhlOU9WL0hMRjljU3JpUVBKZlQvUDZnVnFuWFUrTUNN?=
 =?utf-8?B?QWk2QzRFRUhjWUFadkJ0S2p4NzNLMnRvdGZ6NU1SNkJOYmF3Q0xPQlNnSVM5?=
 =?utf-8?B?ZVpGQXJMYzRSZktVMnNlc0xBMVVYaWZkUmhTa29zQjZGbDFSbWdjOHd6U0Jp?=
 =?utf-8?B?eDVMYklCd0RxeDFZZmhHR0VOYU1ZQnlIakY1bDVsWG5Ec2IxQk5nOUFYMVdH?=
 =?utf-8?B?YzZvMDU0MHk0SG1qVnRzb0tCa0NEWnphbmp1cmJPY3hlQks5dmtMVG5RN1d1?=
 =?utf-8?B?U3RYWmpvMlAxWEdKYkpVN1F1Q2h3M1U1enRwRVBzdVdHSUNpeVArZHZtVGph?=
 =?utf-8?B?K25SS05ISXdvU2p4Rjh1QnFaRkFTbTFPRmJPTHJZOGlGQ0JqeVgyVm9zckZh?=
 =?utf-8?B?UlRqTWJFaEpqSWU5bEpBU1IwMndPQ3ZvWlRHVW9jTGJOZnk2eVYwVVBwY2Z2?=
 =?utf-8?B?ZHlNZUFGR2dIeXBWenQzV1BpeVRiZmZES2ErOTVYVllJdTN5ZUM1Q1B6WGM3?=
 =?utf-8?B?M1Axeko4d1VNMWovZ3V3UE5kcUgvckJMbXE3RTdHdDBUMEdOUjFENkF4OXZ3?=
 =?utf-8?B?ZlJqTTdIQy9tR3Uwa2JWTUVrME0xQy9vbUtQZit0cjZ1d1FRdGFNcTNuQVc4?=
 =?utf-8?B?aGdQOUx0VVN0MFlwWkh3dm1WS2pOQUd5cEthVW1WKzFBVXZSNzlsR2VzNWZ0?=
 =?utf-8?B?UWZlaUJNbTJDWi9IYmlxVXJCUFNpcU42QU50Q3pFV05YRG5CbE9uRWR4M1g1?=
 =?utf-8?B?QURXOWlDSjZkK2VrY2wwRXJVa0Qxb24zeTRrUWVBTlhOUkFXdWt2UGZ6ekRq?=
 =?utf-8?B?QUdzVXVNdVkzTG9EdFExYTNjVkxJbzNQUGRVWUlaNjNmRHVoUW5XamxhTGNO?=
 =?utf-8?B?eUk3T2hwZUxtdzUwODRoV0xaNWluaUpUM0NGczRsL2dhbXJzRE9MQTc5WFhk?=
 =?utf-8?B?dE9TWXB5SWw2OUU1dGdLOGZ6RE1rUGRkUjZZbGYzL3Evbzl5MDlKQ0tHdTZh?=
 =?utf-8?B?djFhTndOQy9qTnVWbDQ2UGtIeUczUXNIZWp2dlM3aUVIVENHOWhiR0pjK0d0?=
 =?utf-8?B?YzZ2cHUyQmVEWEU4eElBN2wrSFRpVEhobHFTRGVyRkJhcGNUdGxxNlhhQ2tl?=
 =?utf-8?B?M2N1Rlk2R0xCeWxibzZKb3NpNXovNlRGdWN5TzVIRldRL0drdHIzeVpGVmpy?=
 =?utf-8?B?MXRydjBZQmVjRStQVzZEaHNSZEpXU1RlMGpCTDFBbEZNaU51UU5UaThvQjVu?=
 =?utf-8?B?VUJRUVdGN1F1T1hJbHordVAwdkEzd08vUTFBbDRzN295dlNydXh6bzY0ZnVY?=
 =?utf-8?B?SmxncUhPRkR4Mmg1R3NRWW9nemppZUNnTmY5QUJGSHRrZ0ZUcmd2Mm9GR1VP?=
 =?utf-8?B?VUd2eFhvU0tRc3hxZkpWK1cvYzBQVU14TmpVQVI0R2JRQUg1aGg0VnBNbGNk?=
 =?utf-8?B?TnUxQnJTVTZ6K1k2ekQrSlVmcG15YXp5aGlpbG9icFdlK1k2anRXZll6cThQ?=
 =?utf-8?B?T0FtMGtlK1RWck5yZ3RTYWRFMkF1TE44VytWMlZBNW5JbTJsYWVBamMzSVFC?=
 =?utf-8?Q?/sx4b2jzfkd4e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFNMjZLcmFuU2cwaUY0THhWMm9nWmRWQTRwVGtvd1ErMEdZTXJHMDBNd0RC?=
 =?utf-8?B?NVFzakZrdWFGdmkvelF0THZvZFlyTjJOdmVQdFpRZjNPdk1zZS9zcUozd2po?=
 =?utf-8?B?QTBOUkNMc0dBS0VPajc2cUczL3dveWt3QmF4Vkpmb3VSdVNOdm9WRVEzT1E4?=
 =?utf-8?B?WSs5R2UxTGltOGhlTEtKOXN2alJENTBQaitOdDFncVBaMkgwS0MxQnowcEVt?=
 =?utf-8?B?TThoRXV0eElHZDZrMkxnWVZtaXk1NUpVSzdHbDRJTExFazJVT3lwZDdVUW4x?=
 =?utf-8?B?UU8weklpNlVnRHV5dU9XQUcvdWNPa241bUJkTzVRdUFiUFZnVDNqSmZMV2Np?=
 =?utf-8?B?YStWT2wwSm5PTUd3REZ4Ry9HSENqd1ZrRlp4WWpqeW1jTm82aTE3V1JySnda?=
 =?utf-8?B?cTJDWjJlekZCa2lJTEFBc1Y3R3RGcE93M3Y3cTBBeW1Fc045SHFwSDVSQXh6?=
 =?utf-8?B?Nnk3TmJmc1ZLZEU4aWpxQmJBY1JRUW5QQVF3TmRoSkEyS1FJZVNGYkRYMEVF?=
 =?utf-8?B?bEJOLzFVamN0R3JIVmZCUVdnYk50VllObnZzT2FPbzM0RVZXRnc1UDU0bkxu?=
 =?utf-8?B?cDc2M0VMMGFrVXMva09CZURqOU5xaGJCeUlGd081T1JHTXBPWTVmMkRDekhm?=
 =?utf-8?B?dU85NjFQM1dMQy82MGtIOFJqUXFMb2MrK3lwMEgwVUxzek5CRHV1TXE4WjRy?=
 =?utf-8?B?SUZiandYNFd2QTkwZHZwMC9zdXcvMnoyV0EvWmdCY3QwS2JITnJidXMxcmdo?=
 =?utf-8?B?V0luRW9PZHRrUm55T3RYMDFVcExVdGs4elhoM1l0ZDgrdnRUVWp5NFBPWjVM?=
 =?utf-8?B?bVdjQjIxdjJjQlBFNU5JOStweThUSVBmS00wU245QXFuWWRoSXZUU0pmZVMw?=
 =?utf-8?B?RnFPYmhYWG5McmlOVGV4TmhlK1FwM2lpM281QlkrYzRCY2R3MEZ1b1AwQUpF?=
 =?utf-8?B?dHdPWEhPZTUweGtPQ2graFo0NFgwaUF2WGdURE95UjBBa1RRQ04yTXBmWG5k?=
 =?utf-8?B?SmVFT0szbmR4UGdXdWRuME43Z1JxVUhiSnZsVGxoMm5QSUVydDRzajdWY2d1?=
 =?utf-8?B?T0VwSXhqK0QxU1JNejRIeHpha2lwRThIaHNIYnB0MUs1YjE2Ylh3QWRIUzVH?=
 =?utf-8?B?WThPdlNoSDVUMWoxbXQwUk1RTVpBa0F2Qkwxc3gzSGpsL20xZmU0VlAyRFNJ?=
 =?utf-8?B?OFltdVdmRkpkUjNmTUYzVGdpdVN6NGtuWXJncUEvZ2NIaE5vWWtqYklBVWpU?=
 =?utf-8?B?ckdEUlhhS3JaNDNFMmhJUk13ZERTT0JrUnMwYXNQaUgxWXQ1VzU5YlFwaUp1?=
 =?utf-8?B?YmRUU05NclBWd3BsR1ZlbHNzSEgyOUFMZVFNcFJLbzhSR1BvaWhYQkZvVU9t?=
 =?utf-8?B?SEc0eEdXL29JVDFneXNRakdRQlV6cmxNMGVlQkZIZkN4YUFBVU1DT213dkoy?=
 =?utf-8?B?YmZZODFzdUhkME1neFB0Nzl1Z3NaM1o3dGZpK0o4MCtBczNDN3R0MzZXTzRk?=
 =?utf-8?B?OEd4OElOL05ZRm5pOGNRRGR3U2xJdnU4U25hVUt5dWhYaDhGYis2dm1ldmRw?=
 =?utf-8?B?bUtBaUp1cXFROTlERHlPZURjRzJjdTloanF2TWJJNW5jampFVzZ2Y3I0ZmhT?=
 =?utf-8?B?M3VGSkpVVUNZRTlJKytwQUJ2UnRNTVlIMTAxS002dnpaZHNQN3FhWDlTWERQ?=
 =?utf-8?B?bGJIU1pXRkh1M2FybU9obERIRTB5QzlPaUwvU2NsUGVONmNURmVFaW8xejFw?=
 =?utf-8?B?eUdLbmtNOXJBNmZUZ3BTRlZGRFFUU2ppYzY4T0RWRVRnbzc0Qi93SGRoY3RG?=
 =?utf-8?B?NzFHVVpNcy9TNG1panNpVURhTFd5eDZqMEwzWTlFTCtmME56QzVlUUhONVhX?=
 =?utf-8?B?VTliYnRPTi91cHdNUVVBTnEzSnY1aHlxSmxEejV2RU1UNmxvYUVSM01nRnZD?=
 =?utf-8?B?OUIxdWpWTEhKZUVxOWkrZGVWSjBUalZWckpIcmJ1OVZvczdIdmRzYWFVVDha?=
 =?utf-8?B?M3Vwam5CZzJidjFUOE1qNHNIK1FLcW5xaTVOR3dLRm4veThsMnFDMklPQndh?=
 =?utf-8?B?VjBaaHFtZFd5ZXgvTEc0Vm9ld1pGZENEZnNJVW9NM3BwNGhkcytsc0xCMG1D?=
 =?utf-8?B?TGUvME42U3loeFZMOGhtbWNFRVBOS1BMdENpMDNUUWxwNWx3RlZDNDc0cURp?=
 =?utf-8?Q?XephS3VlhOypU8dHZ83cGoU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8d2dd3-1027-443c-7f80-08dd1fc1f2a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:13:21.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wH4OqW/XZyipqo3pxm26kZJ2CDwbD2uG2tD26CEQCahXnyIUgt09Hj29is6bIwTeKdM9x1fpDcT/+KWCjwRoeocyorTvfnN0dsES2N5AfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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

On Wed, Dec 18, 2024 at 01:03:19PM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 12/11/2024 5:18 AM, Umesh Nerlige Ramappa wrote:
>>On Thu, Nov 21, 2024 at 12:09:00PM +0530, Riana Tauro wrote:
>>>Avoid duplication of code in PMU by moving hw engine to user class
>>>to a separate function. Refactor existing code to use
>>>this new function.
>>>
>>>v2: replace with array (Umesh)
>>>   fix commit message (Rodrigo)
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_hw_engine.c | 21 +++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>>>drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
>>>3 files changed, 24 insertions(+), 10 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>>>b/drivers/gpu/drm/xe/ xe_hw_engine.c
>>>index c4b0dc3be39c..c41b4038dbb3 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>@@ -979,6 +979,27 @@ const char *xe_hw_engine_class_to_str(enum 
>>>xe_engine_class class)
>>>    return NULL;
>>>}
>>>
>>>+/**
>>>+ * xe_hw_engine_to_user_class - converts xe hw engine to user 
>>>engine class
>>>+ * @engine_class: hw engine class
>>>+ *
>>>+ * Returns: user engine class on success, -1 on error
>>
>>1) Depends on what you want to return on error since you return u16. 
>>If the WARN_ON fires below, you may just want to return a default 
>>like:
>>DRM_XE_ENGINE_CLASS_RENDER or 0 and change the comment above accordingly.
>
>This is called as a part of iterating through hw engines both in query 
>as well as pmu.  So it shouldn't hit the warn on condition.

true, but now this is an internal api, so we cannot guarantee that 
everyone will use it within valid bounds. We need some check to ensure 
valid array access. Maybe you could use an int return type and return an 
error. For code that iterates within the proper bounds, don't check the 
return value. Not sure how else to do this cleanly.

@Lucas - any thoughts here?

Thanks,
Umesh

>
>Returning render would cause wrong mapping, how about 
>XE_ENGINE_CLASS_OTHER or XE_ENGINE_CLASS_MAX ? or do i just remove the 
>warn on?


>>
>>2) Returning -1 means use an int return type and make sure all 
>>callers check for the return and act accordingly.
>>
>>I would recommend 1.
>>
>>>+ */
>>>+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
>>
>>since now this is a xe_hw_engine api, pass the hwe to this function 
>>instead of the engine_class.
>
>There is one other function in that file with the same parameter. So 
>used this.
>
>*xe_hw_engine_class_to_str(enum xe_engine_class class)
>
>Thanks,
>Riana Tauro
>>
>>>+{
>>>+    const u16 xe_to_user_engine_class[] = {
>>>+        [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>>>+        [XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>>>+        [XE_ENGINE_CLASS_VIDEO_DECODE] = 
>>>DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>>>+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = 
>>>DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>>>+        [XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>>>+    };
>>>+
>>>+    WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class));
>>
>>Revisiting this, it should not index into the array if the 
>>engine_class is invalid.
>>
>>     if(WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class)))
>>         return <something>;
>>
>>Thanks,
>>Umesh
>>
>>
>>>+
>>>+    return xe_to_user_engine_class[engine_class];
>>>+}
>>>+
>>>u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>>{
>>>    return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe- 
>>>>mmio_base));
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h 
>>>b/drivers/gpu/drm/xe/ xe_hw_engine.h
>>>index 6b5f9fa2a594..06b39cb1a434 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>>>@@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct 
>>>xe_hw_engine *hwe)
>>>
>>>const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>>>u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>>>+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
>>>enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct 
>>>xe_hw_engine *hwe);
>>>
>>>void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct 
>>>xe_reg reg, u32 val);
>>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/ 
>>>xe_query.c
>>>index 3eda616f1502..a260c43f13f4 100644
>>>--- a/drivers/gpu/drm/xe/xe_query.c
>>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>>@@ -27,14 +27,6 @@
>>>#include "xe_ttm_vram_mgr.h"
>>>#include "xe_wa.h"
>>>
>>>-static const u16 xe_to_user_engine_class[] = {
>>>-    [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>>>-    [XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>>>-    [XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>>>-    [XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>>>-    [XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>>>-};
>>>-
>>>static const enum xe_engine_class user_to_xe_engine_class[] = {
>>>    [DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>>>    [DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>>>@@ -207,7 +199,7 @@ static int query_engines(struct xe_device *xe,
>>>                continue;
>>>
>>>            engines->engines[i].instance.engine_class =
>>>-                xe_to_user_engine_class[hwe->class];
>>>+                xe_hw_engine_to_user_class(hwe->class);
>>>            engines->engines[i].instance.engine_instance =
>>>                hwe->logical_instance;
>>>            engines->engines[i].instance.gt_id = gt->info.id;
>>>@@ -678,7 +670,7 @@ static int query_oa_units(struct xe_device *xe,
>>>                if (!xe_hw_engine_is_reserved(hwe) &&
>>>                    xe_oa_unit_id(hwe) == u->oa_unit_id) {
>>>                    du->eci[j].engine_class =
>>>-                        xe_to_user_engine_class[hwe->class];
>>>+                        xe_hw_engine_to_user_class(hwe->class);
>>>                    du->eci[j].engine_instance = hwe->logical_instance;
>>>                    du->eci[j].gt_id = gt->info.id;
>>>                    j++;
>>>-- 
>>>2.40.0
>>>
>
