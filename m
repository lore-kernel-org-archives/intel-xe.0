Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913F0C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 23:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BA810E3D2;
	Thu, 17 Apr 2025 23:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et1Iobpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CAD10E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744932272; x=1776468272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=OxQaHWlEXwHA0dtSime3nIfedqo2kT0ZF4IV9aroZ80=;
 b=Et1Iobpxf45XlCSa9y89AM0lzWtTqLIkH82a7sokT2YQiQurDXu1JQrX
 r9hkDkXmrK6/BEf5S0hYQaDJQdj3d2/xghPA7wrys0jLFih/o/kNdN2FJ
 F722nQbEeE03TafhJNtRkBZdY53pbMMBkr/W0M1L7s0iH4u1t/nDJD6JA
 WpD2igA/PyZpiilDg4BZl/D8zITgQj+ubNi/kW93kAiq4juffOuh0+Azb
 NWitQu5lWy/ndiFga/XxPS4mUtzVYN64KN0OvFttOJrDLNgLvZkaRPTqB
 MtjGxc4oW2ooMRuorh7Nu0tdCIsHGy8xIJgpnVrXk/IGyFWuwI2BRpcdT g==;
X-CSE-ConnectionGUID: CW2VUpSETH2z1d/+c/NRag==
X-CSE-MsgGUID: VOJf8XztRWaQhjYSFzokVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="71944636"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208,217";a="71944636"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:23:58 -0700
X-CSE-ConnectionGUID: dG2CE2txRDy42sZ2bwA++g==
X-CSE-MsgGUID: uxf3DwurSDWv4UlgbZvgyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
 d="scan'208,217";a="136070587"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:23:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 16:23:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 16:23:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 16:23:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfpvQCJaCrNHdeygW2oL4xBXRTSqN6PjOcJA847hRbMcSXoKClC2qb2RNLjyX+mSZCSg4de+UCpL3HDN6dfAW8y8DfvhL7lUQvhPBFhmxF48qamlTz3vTHsI6EmNzLT8RS9pB5KvL0P1warA18OOqr93mAeWv60E3Z1CZVnhmH1SQ8CLOCk2iMUlGBj1UxPptOQOYFS2vPmOBOdkeTQhltSrBJUjdzE8QXSJCVMvKdmQGCUmivRvknTfCcQIzGGpi/42Q0MokxYTl1Z8INQnSIknVlLZoDsTWq/9OceKL+fYgBwhhl0c9LereH3xVnjjOWXFW0tDMMQgpmNzQhjkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEJ2xiQRUygvAeb6aM8PGjZOXmDuiz6tcUEA1r1V8U4=;
 b=oibwz4FNNN1jR+5ZdfmOTTcpRFcs/O1WQazrumE8DZCKsGHor4VgyrG8tEfNMLMJjK9N/bfN9zSN4EAPH42sLBNlN2Ap0MrC5QtLuntX2b2+uqt/i/hnH+Jz16uFQqyQzx/iaNPkVDAvLi/JtKBKyeNu/59CZwNJLti/2Y5ND2/CaXNSvuHBZdAAZs6GWdFzs3mnTeOVNnGMlXZlVtUDq9MSWMJ2uvZwESVgkk/3WmmK8RFch2iO22kqkZCrDnnP82H2RicVp8fy+iBUWeW/W5JvuCGij10S3j2bNd7bXDh1WCW8YHce4oubLPRuWLRfP1bC9ALbBgyZ9Dz/dai3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 23:23:39 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%5]) with mapi id 15.20.8655.025; Thu, 17 Apr 2025
 23:23:39 +0000
Content-Type: multipart/alternative;
 boundary="------------L00FKv7i5WWhtXGbNAURiIoU"
Message-ID: <b7cc2842-7fac-4cae-9f8d-df0d17707e59@intel.com>
Date: Fri, 18 Apr 2025 01:23:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250411203626.3272415-1-tomasz.lis@intel.com>
 <20250411203626.3272415-3-tomasz.lis@intel.com>
 <179d9877-f260-49e3-a014-46c071a1c973@intel.com>
 <a2b6c2ab-b4db-40ec-9399-0e31718b9ea3@intel.com>
 <21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com>
X-ClientProxiedBy: BE1P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::19) To PH8PR11MB6707.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SA2PR11MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 93983c99-bee0-4c1f-4431-08dd7e06e191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDVlMkdVWGk3ZGJwWUNlOFlpUTl4bElBV1VSRUlTOFFpSlNxVW5ML0JaSGhK?=
 =?utf-8?B?RjRuM2ROQkM3YzRqTjRqelVQL3lWYXlMUUJOTVJUdWlBdmxwUWhTNUNLMGZm?=
 =?utf-8?B?dDY4TzJVYzNxSTRGQ2N2Z0Fwd05pMVF0OGo4WGpISk96VFVnVmRkM0FxWHJh?=
 =?utf-8?B?MGdmd0lBRm9FYjFUdEYvM1lWOU1BMVFxbXJoK1ZxcTd6VFM0UG5tWjBRaGtF?=
 =?utf-8?B?azBJc3FDdzlmZFoyQVNIcHhpcVB0ejRHcUx5b1J0aDRsVXRURTg0NGI2Sm9t?=
 =?utf-8?B?UjFLcnBaZ3BvWmxEdGNUVzRqblJzNkpNbDRBb2JVV09SZjlLdFo1ZUtoV0Mr?=
 =?utf-8?B?N0d3WDFuaWdUbldVWTAzTFJpbjNTY0ptM0szdFNSZk5Qdys3aEYvWlhXdVZF?=
 =?utf-8?B?TEpsYUtWbmNaZWQ0a3dzZnJFb1dvbTRzR3ZYYzREaXU2d2luOXE4MEZMZWRQ?=
 =?utf-8?B?b2lCN0JBWkpKSWZtZ0t4a25yb1FEU1hFWkZVcG1oaTF5RExhUnN1eDBlZkhW?=
 =?utf-8?B?b2RjcUphUHlVUUxUaDBMSVJXUFpEMzUyZnEwaVNwZmU0N1gzcUw3Mk9XOFM5?=
 =?utf-8?B?YklvQ2ZQMHhUemhnaVFjSThCUWxzWXM2R0taTU41UnIvZjRYTWtvc2RweTFV?=
 =?utf-8?B?a3prUmc2MllNZEZSUGJ6M2grNXpnakE4VmdCSTIyNmRVYW9xcmlld2phSFB1?=
 =?utf-8?B?YlRWK0xOYytWTGNMMTNwTkRPLzhYY0IwT2hZSmp0dzFINkNDY0xHR1VVWVRL?=
 =?utf-8?B?eEQ5aWY5M2w0czlJamxFWmh5aDY4RzdxdHlBemUxajdpdFFpeWZrTVNFMnJ1?=
 =?utf-8?B?Tzl1S1NFZ2pXUjdFMm1sdHFTMUJLRStURFo2a0hMVnJaS2F0UlhJcUtzT0Fz?=
 =?utf-8?B?czFmbUxIQXpyVGx5Y3dxZEVOYS9CZko3SlMvMENtdWNRNEozc0xmVmd3VnZY?=
 =?utf-8?B?SjNad2hzaGdVbElYbHNwVlprbFgxRzVlZTlKSlhoRUNrMzVpaytMSEtzRjh3?=
 =?utf-8?B?OTdCZUNlWjdOTTFTOU5INWpTWTdJYjcyUXo2V1NVYjFmK2I0M2xKYzVmSnZF?=
 =?utf-8?B?YVRHZ0xhMWI3SFNzb2k5RytES3l4bzEwemk5cnN3dkZHOWdHSmN3SUE5dTNR?=
 =?utf-8?B?V2VkZVcwS3ZIcVZNVUIrSy92aDYrV2s0blM1b1I4TG9WVlRzL0FPeXFiM0tK?=
 =?utf-8?B?RW9UK0owNVo2WUw2YnRVZUdlektBSzlYdWpUUU8wQmNJbENLSlBlSTVaTTVQ?=
 =?utf-8?B?eFo0Q1U5M1ZQbmQ5bVpmTzMxMUx6UHJpRENGZGt2Q094SnBYb3ZWdCthUmR3?=
 =?utf-8?B?N2JSVnk2UmFnNy9BL0ZpZnRVUVZaaUgraGt5Tk5QRVFaaW93andtRE9XZXVD?=
 =?utf-8?B?Wkc3UVJIb2RhZTNZSG5uMytVYldSRlZlK1FlQTMzSFMzSFRRYnA0QkRNSVFV?=
 =?utf-8?B?ZGdyMzI3d0FpYnY2anBLZkRRZHNpb252V2hrUEYvWCtma3dpZTRwc21jV0Jm?=
 =?utf-8?B?R1ZVOWUrTldlYmpTcVhJdWdscXh3ZHlwdGJJS0MvN3o3T1dEalZhazg0aVVQ?=
 =?utf-8?B?aFVwOUNLMHhIMXp3NWpqNHZMRi9EK3E0RmRKRE9FUTdNbGF4bDV3VFBSUGxU?=
 =?utf-8?B?d0ZMb2J5OHhZelptcVdZR0JzVFpCcWgzbHJwNE0xMmF0Z3Ftc1BPV1E3R25w?=
 =?utf-8?B?dVdYZkR2QUduS2tjVnNZOUUyaC84OFducXNwRTE4SUFENUhoeXlnQndqaFVq?=
 =?utf-8?B?WDVOYW9vcjFmeFV1TXFFVmxzQUtxR3FFWmZyVkNIaXVYQS9oZ0lYNnovUVQw?=
 =?utf-8?B?ZWN4T0U1RkdScUJIZ3o1Y28ybGhKLy9NeVNvZERvYWRzem9HQ2dwcXQyRVcz?=
 =?utf-8?B?VlhId2o5RlBBN284ck5NWVFtNWdOdUdBTE5scGhlVXQza1ExNlBnQkFWVklH?=
 =?utf-8?Q?FVqvx4vgwoY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0NXdCs0bThQc01Md2ZNenRUcmU1WXBXbzE0V0x3TXVhbmpPWlZGK2kyZndn?=
 =?utf-8?B?ZWpSQ21QYnk4NzVNb0djcFJQY1dvTzBGOGQ4UUVCdnN3VThNcUF0b3Fnb21q?=
 =?utf-8?B?d1JodU5lVldVbUhZVFk0b091bENuUUpBUVBpQTczR2JEQmFrdHdIMXJyMVRk?=
 =?utf-8?B?STdUK1BxRWZjVGZUeTc5RWJQQ2NZWk5pSWpyNUJWRkdkenRPZlRFYUFGbHA3?=
 =?utf-8?B?Y0tGZklxdlJzazNiT2VLR1FVS0JsOFBoS1h5RDA4ZGRjWUFHdGpoZjBZZnQ4?=
 =?utf-8?B?ek1EK1VBcm1qOFRoQ3VQT1dGZVlLRjRmcXh6TFVjWWMrZnpoMjJWcFFTeHl0?=
 =?utf-8?B?QVJiQmJwUFNNd1dqZXhna05Mdlp4K3M4MHlaT3h0UUlqVmxoV3ovdEtCbnpU?=
 =?utf-8?B?NkJUSHBiY2VWNEZUZU5nS1RYaFp4ZktRQzZrbys1QXlLM1BER205eDllQ3J2?=
 =?utf-8?B?VW80RGt2bWVFVlFUYTJKdzB2Ym9rUEUzTE5TNVdHQStyYlUxRmJUVmc4Yk1s?=
 =?utf-8?B?UkMyOHc2VS9UYUpPWUVSNUd5TkdUQzUxckhTUFZVZzBWL1gzWklrZnNFR0JR?=
 =?utf-8?B?Z3d3YWg0SVhyRVd5ZitWamw4S3BjNDJEQUJEaWtIVzA2SVJJY3lNQUVHTUlh?=
 =?utf-8?B?ODJvTHVLZjJNdXd3L2FGcE9KZ2tTSGh3VXJKQVVmWEpzV3ErdG9ycTJJcllG?=
 =?utf-8?B?ZE8yT2U3dUdrUlg0OWpaUkZaejcvK3A1SW85dGlRUHZCU2Zoa2ZxVjNQN25a?=
 =?utf-8?B?cDRkRUZ1a2RNc2pvaXBGcFZLbWZOQ0ozNHNuYUxLRXhEaEFGbGtWTklGbFJm?=
 =?utf-8?B?NENveHNCTGVNTmFnTnRoWFoyTjZxdVpGUDhua25STGI5NW4vN016Mm43dmp5?=
 =?utf-8?B?bW43UFVBQUY0UzJ2ZjYxSjJCQTB1T3ZpQWNzemMrV3dlTU9nT3FCYXlCQmVP?=
 =?utf-8?B?K1hWZXNJQmhHeGx4UlRCWGZOMU04SWdiV1hQUkd1VGhMQ1FjN2RSNGJZczZP?=
 =?utf-8?B?bms3UzI0czQrV3hJd2c2WU1jaEF3YzY0U2FCWnREYmpKTmlVWHFDUTlJOENI?=
 =?utf-8?B?UzZHcjlQdXBpSi9wTk5ueXZnOHNDQjBTbzJOQWViYWo1S1dJZ3c5cGtxb0Y1?=
 =?utf-8?B?ZFNsVDRkbFlybG5odVpJNkFoYXNrVlFucWlCTGJLc0Jvb21YZGlWbHdueDI5?=
 =?utf-8?B?dXdqa0tQN2FvdW5YVyttMklHVjRzMi9pNll6ZDhqMnZra0Zqby8zQ0RxUHdX?=
 =?utf-8?B?c2hMOUVmSVliVEsydkFlUG8wKzlDOTFRVFNnZkIyRzYxekdlZ0w3ei9BRlBx?=
 =?utf-8?B?RTZqUUZhc1BpQW9xd3lwYUpNdUNJeWVuQ3Y3S2V3emR4emtnd3I0aVhuVTBv?=
 =?utf-8?B?THRFOGljbjcyZk5BWm00SG9BNGwvSzhJQnFQN0p4bEE4WC9lOE5Zc0xLMXBO?=
 =?utf-8?B?cnVuYWJNeDJWNzN4RzB6b2xhb0hsTzRES1R3N3BlRGxSK1g4VzRwWFhpUUsv?=
 =?utf-8?B?UlAySDk3aTFpK0ZWcFY1NXhIZ3JaOFZlTElIcDdrZnRZL1UxZThXZDZIVXRN?=
 =?utf-8?B?RHVVSU96czluN0x1Tm9EMnZkLzkxSi9JSjlBbUp1b0lyTUoydTEvUEZGWGVK?=
 =?utf-8?B?b3RuY1piNDl6MkZDcitMUTlRRE1zRGVjTzU0YWNNRHlPeitjL28yeUlGZnpl?=
 =?utf-8?B?dXhGaVBMa09MbDRnK1k4a05CMUtxR01YL0RkT2l2ZVd3RnBlSmp1UUQrblBI?=
 =?utf-8?B?dm9Xc25CNVdQM0RFUUVJaGo2cnAzeHJCL2laTGVwbHgzRUpDb0NBRUFCR09V?=
 =?utf-8?B?RWgwbExlSndmMTRZRmowVGFBYnBWeDRIOS96djBGQTZGajFYa3dXWU1qYWVT?=
 =?utf-8?B?Ui91NzYvTXUxd2NPQkJ2eDJCNUdoVE14dHRtUWdqRGtTNG92RTB1dEsyWmRH?=
 =?utf-8?B?TXJKOVM1bTdxZk5IOTJLdFBBWkNYVUMrWnBqM0l4c09lemVzem5EWDBUM09l?=
 =?utf-8?B?eWtMcmtoeDhvcExUajBJQUEzTXR3K21PaGdjalEvL2NadmpzaERDVzMyd3F2?=
 =?utf-8?B?SjBUUDlBNnBJM2dhRkE2ditJbzA2TktsOTNpSm1Nc3hlaTdtMEFMOWVvMDd4?=
 =?utf-8?Q?OSxI6waGTNLcKcQBvqK91pBt/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93983c99-bee0-4c1f-4431-08dd7e06e191
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 23:23:39.0601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQWxwvQcu/GEGxVSGqEVpW6S5i603P34NYe662t7UVvRQ6hOmOIoJhegir76nS+Yp/cI14Nld0FFNyOz/iPg9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
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

--------------L00FKv7i5WWhtXGbNAURiIoU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 17.04.2025 20:50, Michal Wajdeczko wrote:
>
> On 16.04.2025 00:08, Lis, Tomasz wrote:
>> On 14.04.2025 11:23, Michal Wajdeczko wrote:
>>> On 11.04.2025 22:36, Tomasz Lis wrote:
>>>> We have only one GGTT for all IOV functions, with each VF having
>>>> assigned
>>>> a range of addresses for its use. After migration, a VF can receive a
>>>> different range of addresses than it had initially.
>>>>
>>>> This implements shifting GGTT addresses within drm_mm nodes, so that
>>>> VMAs stay valid after migration. This will make the driver use new
>>>> addresses when accessing GGTT from the moment the shifting ends.
>>>>
>>>> By taking the ggtt->lock for the period of VMA fixups, this change
>>>> also adds constraint on that mutex. Any locks used during the recovery
>>>> cannot ever wait for hardware response - because after migration,
>>>> the hardware will not do anything until fixups are finished.
>>>>
>>>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>>>     after querying; improved documentation; switched some warns to
>>>> asserts;
>>>>     skipping fixups when GGTT shift eq 0; iterating through tiles
>>>> (Michal)
>>>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>>>     balloning nodes if non existent
>>>> v4: Re-used ballooning functions from VF init, used bool in place of
>>>>     standard error codes
>>>> v5: Renamed one function
>>>> v6: Subject tag change, several kerneldocs updated, some functions
>>>>     renamed, some moved, added several asserts, shuffled declarations
>>>>     of variables, revealed more detail in high level functions
>>>> v7: Fixed typos, added `_locked` suffix to some functs, improved
>>>>     readability of asserts, removed unneeded conditional
>>>> v8: Moved one function, removed implementation detail from kerneldoc,
>>>>     added asserts
>>>>
>>>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>>>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ggtt.c              |  48 ++++++++++
>>>>    drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 102 ++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   2 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>>>>    drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++++
>>>>    6 files changed, 177 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> index 5a37233f2420..9fc0d57be00a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> @@ -484,6 +484,54 @@ void xe_ggtt_node_remove_balloon_locked(struct
>>>> xe_ggtt_node *node)
>>>>        drm_mm_remove_node(&node->base);
>>>>    }
>>>>    +static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start,
>>>> u64 size)
>>>> +{
>>>> +    struct xe_tile *tile = ggtt->tile;
>>>> +    struct xe_device *xe = tile_to_xe(tile);
>>>> +    u64 __maybe_unused wopcm = xe_wopcm_size(xe);
>>>> +
>>>> +    xe_tile_assert(tile, start >= wopcm);
>>>> +    xe_tile_assert(tile, start + size < ggtt->size - wopcm);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a
>>>> change in usable address range.
>>>> + * @ggtt: the &xe_ggtt struct instance
>>>> + * @shift: change to the location of area provisioned for current VF
>>>> + *
>>>> + * This function moves all nodes from the GGTT VM, to a temp list.
>>>> These nodes are expected
>>>> + * to represent allocations in range formerly assigned to current
>>>> VF, before the range changed.
>>>> + * When the GGTT VM is completely clear of any nodes, they are re-
>>>> added with shifted offsets.
>>>> + *
>>>> + * The function has no ability of failing - because it shifts
>>>> existing nodes, without
>>>> + * any additional processing. If the nodes were successfully
>>>> existing at the old address,
>>>> + * they will do the same at the new one. A fail inside this function
>>>> would indicate that
>>>> + * the list of nodes was either already damaged, or that the shift
>>>> brings the address range
>>>> + * outside of valid bounds. Both cases justify an assert rather than
>>>> error code.
>>>> + */
>>>> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
>>>> +{
>>>> +    struct xe_tile *tile __maybe_unused = ggtt->tile;
>>>> +    struct drm_mm_node *node, *tmpn;
>>>> +    LIST_HEAD(temp_list_head);
>>>> +    int err;
>>>> +
>>>> +    lockdep_assert_held(&ggtt->lock);
>>>> +
>>> nit: my idea was to assert that we have room in the GGTT for that shift
>>> ahead of doing any movements and if there is no easy way to get that
>>> from the drm_mm is one call then do it like:
>>>
>>> drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
>>>      xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
>>>
>>> and then follow with pure code that we know it must be ok
>> ok, can do that. Though this does not look better in any way to me. In
>> fact it looks worse, as it introduces another iteration through the
>> nodes which optimizations most likely won't be able to cut out. I
>> thought we should avoid debug-only iterating.
> if compiler can't full optimize out the loop then we can do it with:
>
> 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> 		drm_mm_for_each_node_safe(...)
> 			xe_ggtt_assert_fit(...);
will do that.
>>>> +    drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
>>>> +        drm_mm_remove_node(node);
>>>> +        list_add(&node->node_list, &temp_list_head);
>>>> +    }
>>>> +
>>>> +    list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>>>> +        xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
>>> so without this assert here (as we did it in a separate loop above)
>> ok
>>>> +        list_del(&node->node_list);
>>>> +        node->start += shift;
>>>> +        err = drm_mm_reserve_node(&ggtt->mm, node);
>>>> +        xe_tile_assert(tile, !err);
>>> maybe drop the 'err' assignment and just confirm that:
>>>
>>>      xe_tile_assert(tile, xe_ggtt_node_allocated(node));
>> The proposed solution is again worse than original. Ignoring an error
>> return should be avoided. There is no reason to ignore it here.
> but we don't ignore the error, we just rely on node_allocated() instead
> of looking directly at err, which in non-debug build we will just assign
> and then completely ignore, risking static code analyzer to complain
right, I did forgot __maybe_unused.
>> Also here we are not iterating through xe wrappers of drm_mm nodes. I
>> will stick to current implementation.
> you can still use drm_mm_node_allocated(node)
>
>> Like the one before, all this request would do is generate changes. If
>> solutions have almost equal weights, maybe it's worth to just stick with
>> what the author proposed.
> 'almost' makes a difference
>
> usually review comments helps author to wider his/her view, but it looks
> the some authors are just too resistant for different views, and NAK
> them without even trying to understand them

Presenting my 'almost' as 'slightly better' is at odds to the arguments 
I provided. The proposed solution is actually slightly worse.

But even if it was the other side of the 'almost', this doesn't change 
my point which is the opposite of 'makes a difference'.

But keeping true to my words - the difference is so irrelevant it is not 
worth discussing, and the change isn't very complex - will just do it.

>>>> +    }
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_ggtt_node_insert_locked - Locked version to insert a
>>>> &xe_ggtt_node into the GGTT
>>>>     * @node: the &xe_ggtt_node to be inserted
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>>>> index d468af96b465..4337a279ff3b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>>>> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>>>    int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>>>>                           u64 start, u64 size);
>>>>    void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>>>> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
>>>>      int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32
>>>> align);
>>>>    int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/
>>>> xe/xe_gt_sriov_vf.c
>>>> index fa299da08684..a822549169d8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>        xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>>>                    start, start + size - 1, size / SZ_1K);
>>>>    +    config->ggtt_shift = start - (s64)config->ggtt_base;
>>>>        config->ggtt_base = start;
>>>>        config->ggtt_size = size;
>>>>    @@ -560,6 +561,24 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>>        return gt->sriov.vf.self_config.lmem_size;
>>>>    }
>>>>    +/**
>>>> + * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF
>>>> migration
>>>> + * @gt: the &xe_gt struct instance
>>>> + *
>>>> + * This function is for VF use only.
>>>> + *
>>>> + * Return: The shift value; could be negative
>>>> + */
>>>> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>>>> +{
>>>> +    struct xe_gt_sriov_vf_selfconfig *config = &gt-
>>>>> sriov.vf.self_config;
>>>> +
>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> +    xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>>>> +
>>>> +    return config->ggtt_shift;
>>>> +}
>>>> +
>>>>    static int vf_init_ggtt_balloons(struct xe_gt *gt)
>>>>    {
>>>>        struct xe_tile *tile = gt_to_tile(gt);
>>>> @@ -817,6 +836,89 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>>>        return err;
>>>>    }
>>>>    +/**
>>>> + * DOC: GGTT nodes shifting during VF post-migration recovery
>>>> + *
>>>> + * The first fixup applied to the VF KMD structures as part of post-
>>>> migration
>>>> + * recovery is shifting nodes within &xe_ggtt instance. The nodes
>>>> are moved
>>>> + * from range previously assigned to this VF, into newly provisioned
>>>> area.
>>>> + * The changes include balloons, which are resized accordingly.
>>>> + *
>>>> + * The balloon nodes are there to eliminate unavailable ranges from
>>>> use: one
>>>> + * reserves the GGTT area below the range for current VF, and
>>>> another one
>>>> + * reserves area above.
>>>> + *
>>>> + * Below is a GGTT layout of example VF, with a certain address
>>>> range assigned to
>>>> + * said VF, and inaccessible areas above and below:
>>>> + *
>>>> + *
>>>> 0                                                                        4GiB
>>>> + *  |<--------------------------- Total GGTT size
>>>> ----------------------------->|
>>>> + *
>>>> WOPCM                                                         GUC_TOP
>>>> + *      |<-------------- Area mappable by xe_ggtt instance
>>>> ---------------->|
>>>> + *
>>>> + *  +---+---------------------------------+----------
>>>> +----------------------+---+
>>>> + *  |\\\|/////////////////////////////////|  VF mem
>>>> |//////////////////////|\\\|
>>>> + *  +---+---------------------------------+----------
>>>> +----------------------+---+
>>>> + *
>>>> + * Hardware enforced access rules before migration:
>>>> + *
>>>> + *  |<------- inaccessible for VF ------->|<VF owned>|<--
>>>> inaccessible for VF ->|
>>>> + *
>>>> + * GGTT nodes used for tracking allocations:
>>>> + *
>>>> + *     |<----------- balloon ------------>|<- nodes->|<----- balloon
>>>> ------>|
>>> left side is little misaligned to above WOPCM (it that was the idea)
>> true, will fix.
>>>> + *
>>>> + * After the migration, GGTT area assigned to the VF might have
>>>> shifted, either
>>>> + * to lower or to higher address. But we expect the total size and
>>>> extra areas to
>>>> + * be identical, as migration can only happen between matching
>>>> platforms.
>>>> + * Below is an example of GGTT layout of the VF after migration.
>>>> Content of the
>>>> + * GGTT for VF has been moved to a new area, and we receive its
>>>> address from GuC:
>>>> + *
>>>> + *  +---+----------------------+----------
>>>> +---------------------------------+---+
>>>> + *  |\\\|//////////////////////|  VF mem
>>>> |/////////////////////////////////|\\\|
>>>> + *  +---+----------------------+----------
>>>> +---------------------------------+---+
>>>> + *
>>>> + * Hardware enforced access rules after migration:
>>>> + *
>>>> + *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for
>>>> VF ------->|
>>>> + *
>>>> + * So the VF has a new slice of GGTT assigned, and during migration
>>>> process, the
>>>> + * memory content was copied to that new area. But the &xe_ggtt
>>>> nodes are still
>>>> + * tracking allocations using the old addresses. The nodes within VF
>>>> owned area
>>>> + * have to be shifted, and balloon nodes need to be resized to
>>>> properly mask out
>>>> + * areas not owned by the VF.
>>>> + *
>>>> + * Fixed &xe_ggtt nodes used for tracking allocations:
>>>> + *
>>>> + *     |<------ balloon ------>|<- nodes->|<----------- balloon
>>>> ----------->|
>>>> + *
>>>> + * Due to use of GPU profiles, we do not expect the old and new GGTT
>>>> ares to
>>>> + * overlap; but our node shifting will fix addresses properly
>>>> regardless.
>>>> + */
>>>> +
>>>> +/**
>>>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match
>>>> assigned range.
>>>> + * @gt: the &xe_gt struct instance
>>>> + * @ggtt_shift: the shift value
>>> nit: function is about _GGTT_ so maybe we can drop ggtt_ prefix here?
>> True, since we already did that everywhere else.
>>>> + *
>>>> + * Since Global GTT is not virtualized, each VF has an assigned range
>>>> + * within the global space. This range might have changed during
>>>> migration,
>>>> + * which requires all memory addresses pointing to GGTT to be shifted.
>>>> + */
>>>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift)
>>>> +{
>>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>>> +    struct xe_ggtt *ggtt = tile->mem.ggtt;
>>>> +
>>>> +    xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>>>> +
>>>> +    mutex_lock(&ggtt->lock);
>>>> +    xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>>>> +    xe_ggtt_shift_nodes_locked(ggtt, ggtt_shift);
>>>> +    xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>>>> +    mutex_unlock(&ggtt->lock);
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration
>>>> recovery,
>>>>     *   or just mark that a GuC is ready for it.
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/
>>>> xe/xe_gt_sriov_vf.h
>>>> index d717deb8af91..6e0da81d0359 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> @@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>>>>    void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>>>> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>>>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift);
>>>>    int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>>>    void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>>    diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/
>>>> gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> index a57f13b5afcd..5ccbdf8d08b6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>>        u64 ggtt_base;
>>>>        /** @ggtt_size: assigned size of the GGTT region. */
>>>>        u64 ggtt_size;
>>>> +    /** @ggtt_shift: difference in ggtt_base on last migration */
>>>> +    s64 ggtt_shift;
>>> btw, do we want to expose this in self_config where we already show GGTT
>>> base and size? if so then update xe_gt_sriov_vf_print_config()
>> No, I don't think that's a good idea. It's just a derivative value valid
>> only during the recovery.
>>
>> GGTT base and size from logged lines before and after can be compared to
>> get the shift.
> it's not about the math
>
> relying on the dmesg with those lines being always available might be
> just too optimistic, usually we want to able to collect data directly
> from the driver/debugfs in case we detect a failure

hard to argue with that. will add the printing.

-Tomasz

>> -Tomasz
>>
>>>>        /** @lmem_size: assigned size of the LMEM. */
>>>>        u64 lmem_size;
>>>>        /** @num_ctxs: assigned number of GuC submission context IDs. */
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/
>>>> xe_sriov_vf.c
>>>> index c1275e64aa9c..e70f1ceabbb3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> @@ -7,6 +7,7 @@
>>>>      #include "xe_assert.h"
>>>>    #include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>>    #include "xe_gt_sriov_printk.h"
>>>>    #include "xe_gt_sriov_vf.h"
>>>>    #include "xe_pm.h"
>>>> @@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct
>>>> xe_device *xe)
>>>>        work_pending(&xe->sriov.vf.migration.worker);
>>>>    }
>>>>    +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>>>> +{
>>>> +    bool need_fixups = false;
>>>> +    struct xe_tile *tile;
>>>> +    unsigned int id;
>>>> +
>>>> +    for_each_tile(tile, xe, id) {
>>>> +        struct xe_gt *gt = tile->primary_gt;
>>>> +        s64 shift;
>>>> +
>>>> +        shift = xe_gt_sriov_vf_ggtt_shift(gt);
>>>> +        if (shift) {
>>>> +            need_fixups = true;
>>>> +            xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
>>>> +        }
>>>> +    }
>>>> +    return need_fixups;
>>>> +}
>>>> +
>>>>    /*
>>>>     * Notify all GuCs about resource fixups apply finished.
>>>>     */
>>>> @@ -191,6 +211,7 @@ static void
>>>> vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>>>      static void vf_post_migration_recovery(struct xe_device *xe)
>>>>    {
>>>> +    bool need_fixups;
>>>>        int err;
>>>>          drm_dbg(&xe->drm, "migration recovery in progress\n");
>>>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct
>>>> xe_device *xe)
>>>>        if (unlikely(err))
>>>>            goto fail;
>>>>    +    need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>>>        /* FIXME: add the recovery steps */
>>>>        vf_post_migration_notify_resfix_done(xe);
>>>>        xe_pm_runtime_put(xe);
>>> otherwise, LGTM
>>>
--------------L00FKv7i5WWhtXGbNAURiIoU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17.04.2025 20:50, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 16.04.2025 00:08, Lis, Tomasz wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 14.04.2025 11:23, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 11.04.2025 22:36, Tomasz Lis wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">We have only one GGTT for all IOV functions, with each VF having
assigned
a range of addresses for its use. After migration, a VF can receive a
different range of addresses than it had initially.

This implements shifting GGTT addresses within drm_mm nodes, so that
VMAs stay valid after migration. This will make the driver use new
addresses when accessing GGTT from the moment the shifting ends.

By taking the ggtt-&gt;lock for the period of VMA fixups, this change
also adds constraint on that mutex. Any locks used during the recovery
cannot ever wait for hardware response - because after migration,
the hardware will not do anything until fixups are finished.

v2: Moved some functs to xe_ggtt.c; moved shift computation to just
&nbsp;&nbsp; after querying; improved documentation; switched some warns to
asserts;
&nbsp;&nbsp; skipping fixups when GGTT shift eq 0; iterating through tiles
(Michal)
v3: Updated kerneldocs, removed unused funct, properly allocate
&nbsp;&nbsp; balloning nodes if non existent
v4: Re-used ballooning functions from VF init, used bool in place of
&nbsp;&nbsp; standard error codes
v5: Renamed one function
v6: Subject tag change, several kerneldocs updated, some functions
&nbsp;&nbsp; renamed, some moved, added several asserts, shuffled declarations
&nbsp;&nbsp; of variables, revealed more detail in high level functions
v7: Fixed typos, added `_locked` suffix to some functs, improved
&nbsp;&nbsp; readability of asserts, removed unneeded conditional
v8: Moved one function, removed implementation detail from kerneldoc,
&nbsp;&nbsp; added asserts

Signed-off-by: Tomasz Lis<a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Cc: Michal Wajdeczko<a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
&nbsp; drivers/gpu/drm/xe/xe_ggtt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 48 ++++++++++
&nbsp; drivers/gpu/drm/xe/xe_ggtt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
&nbsp; drivers/gpu/drm/xe/xe_gt_sriov_vf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 102 ++++++++++++++++++++++
&nbsp; drivers/gpu/drm/xe/xe_gt_sriov_vf.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +
&nbsp; drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |&nbsp;&nbsp; 2 +
&nbsp; drivers/gpu/drm/xe/xe_sriov_vf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 22 +++++
&nbsp; 6 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5a37233f2420..9fc0d57be00a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -484,6 +484,54 @@ void xe_ggtt_node_remove_balloon_locked(struct
xe_ggtt_node *node)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_mm_remove_node(&amp;node-&gt;base);
&nbsp; }
&nbsp; +static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start,
u64 size)
+{
+&nbsp;&nbsp;&nbsp; struct xe_tile *tile = ggtt-&gt;tile;
+&nbsp;&nbsp;&nbsp; struct xe_device *xe = tile_to_xe(tile);
+&nbsp;&nbsp;&nbsp; u64 __maybe_unused wopcm = xe_wopcm_size(xe);
+
+&nbsp;&nbsp;&nbsp; xe_tile_assert(tile, start &gt;= wopcm);
+&nbsp;&nbsp;&nbsp; xe_tile_assert(tile, start + size &lt; ggtt-&gt;size - wopcm);
+}
+
+/**
+ * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a
change in usable address range.
+ * @ggtt: the &amp;xe_ggtt struct instance
+ * @shift: change to the location of area provisioned for current VF
+ *
+ * This function moves all nodes from the GGTT VM, to a temp list.
These nodes are expected
+ * to represent allocations in range formerly assigned to current
VF, before the range changed.
+ * When the GGTT VM is completely clear of any nodes, they are re-
added with shifted offsets.
+ *
+ * The function has no ability of failing - because it shifts
existing nodes, without
+ * any additional processing. If the nodes were successfully
existing at the old address,
+ * they will do the same at the new one. A fail inside this function
would indicate that
+ * the list of nodes was either already damaged, or that the shift
brings the address range
+ * outside of valid bounds. Both cases justify an assert rather than
error code.
+ */
+void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+{
+&nbsp;&nbsp;&nbsp; struct xe_tile *tile __maybe_unused = ggtt-&gt;tile;
+&nbsp;&nbsp;&nbsp; struct drm_mm_node *node, *tmpn;
+&nbsp;&nbsp;&nbsp; LIST_HEAD(temp_list_head);
+&nbsp;&nbsp;&nbsp; int err;
+
+&nbsp;&nbsp;&nbsp; lockdep_assert_held(&amp;ggtt-&gt;lock);
+
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">nit: my idea was to assert that we have room in the GGTT for that shift
ahead of doing any movements and if there is no easy way to get that
from the drm_mm is one call then do it like:

drm_mm_for_each_node_safe(node, tmpn, &amp;ggtt-&gt;mm)
&nbsp;&nbsp;&nbsp;&nbsp;xe_ggtt_assert_fit(ggtt, node-&gt;start + shift, node-&gt;size);

and then follow with pure code that we know it must be ok
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">ok, can do that. Though this does not look better in any way to me. In
fact it looks worse, as it introduces another iteration through the
nodes which optimizations most likely won't be able to cut out. I
thought we should avoid debug-only iterating.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
if compiler can't full optimize out the loop then we can do it with:

	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
		drm_mm_for_each_node_safe(...)
			xe_ggtt_assert_fit(...);</pre>
    </blockquote>
    will do that.<br>
    <blockquote type="cite" cite="mid:21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; drm_mm_for_each_node_safe(node, tmpn, &amp;ggtt-&gt;mm) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_mm_remove_node(node);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add(&amp;node-&gt;node_list, &amp;temp_list_head);
+&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp; list_for_each_entry_safe(node, tmpn, &amp;temp_list_head, node_list) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_ggtt_assert_fit(ggtt, node-&gt;start + shift, node-&gt;size);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">so without this assert here (as we did it in a separate loop above)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">ok
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_del(&amp;node-&gt;node_list);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; node-&gt;start += shift;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, node);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_tile_assert(tile, !err);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">maybe drop the 'err' assignment and just confirm that:

&nbsp;&nbsp;&nbsp;&nbsp;xe_tile_assert(tile, xe_ggtt_node_allocated(node));
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The proposed solution is again worse than original. Ignoring an error
return should be avoided. There is no reason to ignore it here.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
but we don't ignore the error, we just rely on node_allocated() instead
of looking directly at err, which in non-debug build we will just assign
and then completely ignore, risking static code analyzer to complain</pre>
    </blockquote>
    right, I did forgot __maybe_unused.<br>
    <blockquote type="cite" cite="mid:21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Also here we are not iterating through xe wrappers of drm_mm nodes. I
will stick to current implementation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
you can still use drm_mm_node_allocated(node)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Like the one before, all this request would do is generate changes. If
solutions have almost equal weights, maybe it's worth to just stick with
what the author proposed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
'almost' makes a difference

usually review comments helps author to wider his/her view, but it looks
the some authors are just too resistant for different views, and NAK
them without even trying to understand them</pre>
    </blockquote>
    <p>Presenting my 'almost' as 'slightly better' is at odds to the
      arguments I provided. The proposed solution is actually slightly
      worse.</p>
    <p>But even if it was the other side of the 'almost', this doesn't
      change my point which is the opposite of '<span style="white-space: pre-wrap">makes a difference<span style="white-space: normal">'.</span></span></p>
    <p>But keeping true to my words - the difference is so irrelevant it
      is not worth discussing, and the change isn't very complex - will
      just do it.<br>
    </p>
    <blockquote type="cite" cite="mid:21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; }
+}
+
&nbsp; /**
&nbsp;&nbsp; * xe_ggtt_node_insert_locked - Locked version to insert a
&amp;xe_ggtt_node into the GGTT
&nbsp;&nbsp; * @node: the &amp;xe_ggtt_node to be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index d468af96b465..4337a279ff3b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
&nbsp; int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 start, u64 size);
&nbsp; void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
+void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
&nbsp; &nbsp; int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32
align);
&nbsp; int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/
xe/xe_gt_sriov_vf.c
index fa299da08684..a822549169d8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_sriov_dbg_verbose(gt, &quot;GGTT %#llx-%#llx = %lluK\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start, start + size - 1, size / SZ_1K);
&nbsp; +&nbsp;&nbsp;&nbsp; config-&gt;ggtt_shift = start - (s64)config-&gt;ggtt_base;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;ggtt_base = start;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;ggtt_size = size;
&nbsp; @@ -560,6 +561,24 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gt-&gt;sriov.vf.self_config.lmem_size;
&nbsp; }
&nbsp; +/**
+ * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF
migration
+ * @gt: the &amp;xe_gt struct instance
+ *
+ * This function is for VF use only.
+ *
+ * Return: The shift value; could be negative
+ */
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
+{
+&nbsp;&nbsp;&nbsp; struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">sriov.vf.self_config;
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">+
+&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+
+&nbsp;&nbsp;&nbsp; return config-&gt;ggtt_shift;
+}
+
&nbsp; static int vf_init_ggtt_balloons(struct xe_gt *gt)
&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_tile *tile = gt_to_tile(gt);
@@ -817,6 +836,89 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
&nbsp; }
&nbsp; +/**
+ * DOC: GGTT nodes shifting during VF post-migration recovery
+ *
+ * The first fixup applied to the VF KMD structures as part of post-
migration
+ * recovery is shifting nodes within &amp;xe_ggtt instance. The nodes
are moved
+ * from range previously assigned to this VF, into newly provisioned
area.
+ * The changes include balloons, which are resized accordingly.
+ *
+ * The balloon nodes are there to eliminate unavailable ranges from
use: one
+ * reserves the GGTT area below the range for current VF, and
another one
+ * reserves area above.
+ *
+ * Below is a GGTT layout of example VF, with a certain address
range assigned to
+ * said VF, and inaccessible areas above and below:
+ *
+ *&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4GiB
+ *&nbsp; |&lt;--------------------------- Total GGTT size
-----------------------------&gt;|
+ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
WOPCM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GUC_TOP
+ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&lt;-------------- Area mappable by xe_ggtt instance
----------------&gt;|
+ *
+ *&nbsp; +---+---------------------------------+----------
+----------------------+---+
+ *&nbsp; |\\\|/////////////////////////////////|&nbsp; VF mem&nbsp;
|//////////////////////|\\\|
+ *&nbsp; +---+---------------------------------+----------
+----------------------+---+
+ *
+ * Hardware enforced access rules before migration:
+ *
+ *&nbsp; |&lt;------- inaccessible for VF -------&gt;|&lt;VF owned&gt;|&lt;--
inaccessible for VF -&gt;|
+ *
+ * GGTT nodes used for tracking allocations:
+ *
+ *&nbsp;&nbsp;&nbsp;&nbsp; |&lt;----------- balloon ------------&gt;|&lt;- nodes-&gt;|&lt;----- balloon
------&gt;|
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">left side is little misaligned to above WOPCM (it that was the idea)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">true, will fix.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ *
+ * After the migration, GGTT area assigned to the VF might have
shifted, either
+ * to lower or to higher address. But we expect the total size and
extra areas to
+ * be identical, as migration can only happen between matching
platforms.
+ * Below is an example of GGTT layout of the VF after migration.
Content of the
+ * GGTT for VF has been moved to a new area, and we receive its
address from GuC:
+ *
+ *&nbsp; +---+----------------------+----------
+---------------------------------+---+
+ *&nbsp; |\\\|//////////////////////|&nbsp; VF mem&nbsp;
|/////////////////////////////////|\\\|
+ *&nbsp; +---+----------------------+----------
+---------------------------------+---+
+ *
+ * Hardware enforced access rules after migration:
+ *
+ *&nbsp; |&lt;- inaccessible for VF --&gt;|&lt;VF owned&gt;|&lt;------- inaccessible for
VF -------&gt;|
+ *
+ * So the VF has a new slice of GGTT assigned, and during migration
process, the
+ * memory content was copied to that new area. But the &amp;xe_ggtt
nodes are still
+ * tracking allocations using the old addresses. The nodes within VF
owned area
+ * have to be shifted, and balloon nodes need to be resized to
properly mask out
+ * areas not owned by the VF.
+ *
+ * Fixed &amp;xe_ggtt nodes used for tracking allocations:
+ *
+ *&nbsp;&nbsp;&nbsp;&nbsp; |&lt;------ balloon ------&gt;|&lt;- nodes-&gt;|&lt;----------- balloon
-----------&gt;|
+ *
+ * Due to use of GPU profiles, we do not expect the old and new GGTT
ares to
+ * overlap; but our node shifting will fix addresses properly
regardless.
+ */
+
+/**
+ * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match
assigned range.
+ * @gt: the &amp;xe_gt struct instance
+ * @ggtt_shift: the shift value
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">nit: function is about _GGTT_ so maybe we can drop ggtt_ prefix here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">True, since we already did that everywhere else.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ *
+ * Since Global GTT is not virtualized, each VF has an assigned range
+ * within the global space. This range might have changed during
migration,
+ * which requires all memory addresses pointing to GGTT to be shifted.
+ */
+void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift)
+{
+&nbsp;&nbsp;&nbsp; struct xe_tile *tile = gt_to_tile(gt);
+&nbsp;&nbsp;&nbsp; struct xe_ggtt *ggtt = tile-&gt;mem.ggtt;
+
+&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+
+&nbsp;&nbsp;&nbsp; mutex_lock(&amp;ggtt-&gt;lock);
+&nbsp;&nbsp;&nbsp; xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
+&nbsp;&nbsp;&nbsp; xe_ggtt_shift_nodes_locked(ggtt, ggtt_shift);
+&nbsp;&nbsp;&nbsp; xe_gt_sriov_vf_balloon_ggtt_locked(gt);
+&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;ggtt-&gt;lock);
+}
+
&nbsp; /**
&nbsp;&nbsp; * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration
recovery,
&nbsp;&nbsp; *&nbsp;&nbsp; or just mark that a GuC is ready for it.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/
xe/xe_gt_sriov_vf.h
index d717deb8af91..6e0da81d0359 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
&nbsp; int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
&nbsp; int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
&nbsp; void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
+void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift);
&nbsp; int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
&nbsp; void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
&nbsp; diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/
gpu/drm/xe/xe_gt_sriov_vf_types.h
index a57f13b5afcd..5ccbdf8d08b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 ggtt_base;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @ggtt_size: assigned size of the GGTT region. */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 ggtt_size;
+&nbsp;&nbsp;&nbsp; /** @ggtt_shift: difference in ggtt_base on last migration */
+&nbsp;&nbsp;&nbsp; s64 ggtt_shift;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">btw, do we want to expose this in self_config where we already show GGTT
base and size? if so then update xe_gt_sriov_vf_print_config()
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
No, I don't think that's a good idea. It's just a derivative value valid
only during the recovery.

GGTT base and size from logged lines before and after can be compared to
get the shift.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
it's not about the math

relying on the dmesg with those lines being always available might be
just too optimistic, usually we want to able to collect data directly
from the driver/debugfs in case we detect a failure</pre>
    </blockquote>
    <p>hard to argue with that. will add the printing.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:21c3c6ab-701b-427b-a705-975bcb68b5d3@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
-Tomasz

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @lmem_size: assigned size of the LMEM. */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 lmem_size;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @num_ctxs: assigned number of GuC submission context IDs. */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/
xe_sriov_vf.c
index c1275e64aa9c..e70f1ceabbb3 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
&nbsp; &nbsp; #include &quot;xe_assert.h&quot;
&nbsp; #include &quot;xe_device.h&quot;
+#include &quot;xe_gt.h&quot;
&nbsp; #include &quot;xe_gt_sriov_printk.h&quot;
&nbsp; #include &quot;xe_gt_sriov_vf.h&quot;
&nbsp; #include &quot;xe_pm.h&quot;
@@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct
xe_device *xe)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; work_pending(&amp;xe-&gt;sriov.vf.migration.worker);
&nbsp; }
&nbsp; +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
+{
+&nbsp;&nbsp;&nbsp; bool need_fixups = false;
+&nbsp;&nbsp;&nbsp; struct xe_tile *tile;
+&nbsp;&nbsp;&nbsp; unsigned int id;
+
+&nbsp;&nbsp;&nbsp; for_each_tile(tile, xe, id) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt = tile-&gt;primary_gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s64 shift;
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shift = xe_gt_sriov_vf_ggtt_shift(gt);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (shift) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; need_fixups = true;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; return need_fixups;
+}
+
&nbsp; /*
&nbsp;&nbsp; * Notify all GuCs about resource fixups apply finished.
&nbsp;&nbsp; */
@@ -191,6 +211,7 @@ static void
vf_post_migration_notify_resfix_done(struct xe_device *xe)
&nbsp; &nbsp; static void vf_post_migration_recovery(struct xe_device *xe)
&nbsp; {
+&nbsp;&nbsp;&nbsp; bool need_fixups;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;xe-&gt;drm, &quot;migration recovery in progress\n&quot;);
@@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct
xe_device *xe)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(err))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;
&nbsp; +&nbsp;&nbsp;&nbsp; need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FIXME: add the recovery steps */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vf_post_migration_notify_resfix_done(xe);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pm_runtime_put(xe);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">otherwise, LGTM

</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------L00FKv7i5WWhtXGbNAURiIoU--
