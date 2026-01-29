Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17774D46C16
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 00:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426910E2F7;
	Thu, 29 Jan 2026 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfZBeLBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B1910E2F7
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 00:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769648329; x=1801184329;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cVE/GRxmnMSqNJGqxE0+oxN5qF+ckb/xl0Gm4jSGNvU=;
 b=RfZBeLBRloIc/4yMePzulzEmUvF0QNGVKc07k/2DQTXej7UM1Du6MKJv
 yZXT1IlvtHl2G8GpeaQkixo6nsCd2eC9MPKG2LR1a2L9Qkn/cRuYtfGZ+
 mUWhyLucMvgwowWjRUecpvyEDdeIlReVMuNa+3bDmELFgb63hyvE2YEV0
 PZs9F2ERq/AG9TavcwvyGOLcBHI0AYPnS7ZGYSZx/uIgnliQ00phtJ6Gi
 PdRM4E6Xhaf3hTEfDPhk7NZKrie2fvhoMKDOs/xYs5sZFQ5JvvO6WDPyh
 /dheAzopObQH8Y6LeUjwNgJg7fEEWUqVmUIx8cKWQmNEUbAGBwVCxjeQl g==;
X-CSE-ConnectionGUID: gn6z58kNTfuayle5iLhHtQ==
X-CSE-MsgGUID: +6Tk6eEUQsucn/gemTJElA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69891298"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="69891298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:58:48 -0800
X-CSE-ConnectionGUID: pZFBboTrTxyVfX9IwJVJnA==
X-CSE-MsgGUID: rAIpCAoDQ1mzNWctzNkqiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208209563"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:58:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 16:58:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 16:58:47 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 16:58:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMV5MAGwJ9JYf7me0ax+jwzly5wmXFe+Bvc0ArgFcZo+eOlabDxznTZiYwJqzesKVysQxPVTySBNs+T2gE7s46aTlST4KSBDYfql7rrwkumetXZKWSMApurxy153Xos+nDDMLp1IuTWPyF+squSkTuHRxWyTQWUnZn+yI4gcmASBLw8Z7C08Zp6AcA5mkiNqW5v2inZz3X0gTnP601PC/xxPoNS3bwnfMhNbACg641ga3FJ/GLI402fZcgJIkg8WGsUubw8IL+pHYPSWMfVmjn65/WpVnAOGCHfEIEFrtpDtO9zeSTWBWhdRlppuDBerMc3VQBaiuqAFJH+TwivX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbVsi6haJ1TqEVGogbiba1wJHVcw2Bg5zO/xrMhgz/s=;
 b=Dosvja83aJ2I17oVe+lIA2866SFjuRPIyE4G4BBZ4AJBXsFMQ8lhOypZLUSAkiNxdSyTtQ6hYlP7YTawkvaplwJ+BO2tKe8tkyUDUG2h8CMAZFG2hyGHXzeyVcrdA0qSJa1V+BXeRwdbJlS3NtXmTPR492dXMQ253i57GHdDoZdkPXyA7ngABR6LwMzkqDKiBjAri9afImiJVQPtNeqKPixCNuC9Uhm90VtZ+JQacBrvkV/llW6Gj/ffcV+GjmwxaSpzzWc8dJFzqb5+En+yVD/+s+TVpFFS8QATsOQDkm2z7b2ieA0zZI9s8Bnpw4i14Qlw7ek9Am9kUFHGwosPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB9518.namprd11.prod.outlook.com (2603:10b6:208:5b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 29 Jan
 2026 00:58:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 00:58:45 +0000
Message-ID: <16461473-6334-435f-b8f9-5f8759af740f@intel.com>
Date: Wed, 28 Jan 2026 16:58:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260128115134.657091-4-sk.anirban@intel.com>
 <20260128115134.657091-6-sk.anirban@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260128115134.657091-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc98d10-1210-4ab6-7b7c-08de5ed18dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3FxOXVXOXNmcXl2eFF4TllyZGt4OVVTZEhuNXVaVzloVHFFZWg1aUpuSUVM?=
 =?utf-8?B?UzBMWGd0WGdsQWZ1MHB4OTFYUkdYS0QwaUZiMWdTeE5HdnAxUFo2MGdIL3Az?=
 =?utf-8?B?VjZ2MzhONHFRMTIvRzFpSWk2YWxsY0tOQWJiM0ludjJlcVd1M0Q5cW1yajBG?=
 =?utf-8?B?Vjh4SW4xS3RReE5TNnVuVjg1VVRPUWR2dDk4YXZ1SDF5Q1h3SmYxbENtWFA1?=
 =?utf-8?B?TEpKdVRzMUZzVk5OTU5aNG5ZaXUxUmVNRE15cWNzV2h6QkxpMmY2Z1F1RU9R?=
 =?utf-8?B?Sm9pQWhkV2NsVXM4NGhMSnJTQThybGJaajZ5Mk83VVBVSFZWQnJNNW4vWjhO?=
 =?utf-8?B?WEJlT3cxQUlLK0p0OFYwWXk1a1pOb0cranNrTTA3ZExybWx3VTZzdXlVNzI5?=
 =?utf-8?B?eXVLU2tjT0tZZHhwYmZKYjQzTFI3TDU1aCtuTXNpTHlPazBsUEJ4azNva2x6?=
 =?utf-8?B?Q0d6Q0pLRlBDY3AxbTZmN3lFdmJTVXBJU2tLNG5qalBJczdTUGh4WHFjRjFV?=
 =?utf-8?B?SmFOdDd4RjNJdlRVVzR5WksyVFhsVmhzaWg4Q1I5MkRIU0VLQmhNV2NpaUZr?=
 =?utf-8?B?Qm9mYVJTdVpQUjNlblVNRmlMUmhEd1FqWUtiRjZ5bGdBd2lXQXNiYklqYkRa?=
 =?utf-8?B?NldOOFRBWkhhNzNYYzRUUmpZSnV1aUdkQ2VhcEwxYTZmamNrWHIwTDIwQXFi?=
 =?utf-8?B?MGhEMTFNOFp6L0hVTkxYa1JMU3JwdWNWdkk2T1ovZkZ6dzcvVktQUGpQOUMx?=
 =?utf-8?B?UUovN2pjeTJlRW9ac2gvYTYvOEk3eFVFb3Iwd0gyQUJqQUpudlMrNGdsTXg3?=
 =?utf-8?B?U21SVmRsNTdBVzZQQ0xOdE9Mc3VYeG1PcFg1K2s4ZUVRRkQrTHFSRVpVeXZu?=
 =?utf-8?B?ekFJdkZhcXhGTWFQdEFkVDhGeW5RQXZOTkRRdlpzeTRSbW5NMkdndWtvaElP?=
 =?utf-8?B?ZHU5bWoyUllVOVF0UWdydVR5ZkNFRzdXQTFYTU9raTVQL2dpSFBhbkVDaU9P?=
 =?utf-8?B?Z3ZVT0ZTZDEyZGlNcXNhTVFMcW1PTm5GeEc4RW5pZzg4R3RHRFFBUmx3akl3?=
 =?utf-8?B?TkN4UXhBL2pGVlJ4UFRBRFQwRXd1ek5vcjJwaTVkUFRLRGgzTkpHeDhPWCtr?=
 =?utf-8?B?QmNFM3BVS3FjY1RPQm5YcTc0MFhDeEVZdElsd09PaXZxVjZ4WHZ6a0pucnpj?=
 =?utf-8?B?Ti9XY0NpWGRoeVVyNlN0US9DSVl1RmVmTUF0alFNNnlqRVNVWUJlTEU2VmpS?=
 =?utf-8?B?dE5CQjNzV3RvMWhYYkt2TWlreUFpTjV5amxJa1RMQVR6bjB2VC9MZXp1YlNp?=
 =?utf-8?B?eHJnL3RIbmYrWnFPYWRzVTZkSC8vTTVwUVE2dE9FaHh4VnRwOXMxaS9MT0lY?=
 =?utf-8?B?UEk1MllkUEJDZVpCZjlkTFlua0Izb3lIb0MzNnBFbUx4SDZRdEliWUhsaEFX?=
 =?utf-8?B?YmVHbXdzOXRHTWJlQzNReUNkRUNSVXpZVjBwM1E5cnpRcmF2ZVRxWWdYbDJ4?=
 =?utf-8?B?T1dZdklER0VCWk5yZndid1pseUViU0JaVHAxTjZrNlJBUUhuOFhVdy9qM2Zz?=
 =?utf-8?B?c3ZJVUgrdlJpTUVmQmIwR3JHNW91ZWRiSU4xTStQUG9yUnZvUElsMFBHOVEz?=
 =?utf-8?B?ZFR5Q3JCVzRveG1RY1VaL21nOFUxeHJicVVrQ3NLRmlaT0NhcEh3bEh5Ymx0?=
 =?utf-8?B?N05LaEhzQnFWaytIMmY0a1FnSFIyRGZJNXhIc2pEeGZGOTQzME94STV1YUlp?=
 =?utf-8?B?WVFLTzEyLzQzeUMwM1RaWEVhUjAxckFVMmtTSm5wcGJ5MHlEYm5QQzFiZHFK?=
 =?utf-8?B?a0hMNnpPSkZQYUIxMUV3QzdLUUxWNjMzaThzeHRaK1lPWGJmL0I0RXRiVG1O?=
 =?utf-8?B?TVFkM1J5RzVxTlIyRVN1N0ZqQVZPU2c4d0RsQUY2UVA5a1JnKzF0RU8vMDBP?=
 =?utf-8?B?cWFDYWd6djFKVXBuYStRZmw1QzdZenVDd3FZQUFGWThYWC9FeUUrRGRKRVpn?=
 =?utf-8?B?Q0VYamZOYzBqR1FDK2dVOVJMVEY1RCt2SU9xNDFEWUxiMzJiMm0yQnY5MzNy?=
 =?utf-8?B?OGRka3FZektXVEg1ZEJLZ2t1UkRFYmc5c3h6Y3E1cnVubWROb0I0eENRSlYw?=
 =?utf-8?Q?ARXA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3owNVc0RUpkVWdlUms5aEN1VlkvNEN2dHpkb1pQaHFseUl1TVlFZGFkdTNK?=
 =?utf-8?B?RjVwWVUvOEdma0o3ZDhZdmkycTBzdlVXSnFoU1R0UXRRR1BObmljd2VRc21r?=
 =?utf-8?B?MGdXMWYxdGNGdiszZENkOFI1dmw4Y05EQ3BEZlZsbVF5K0RqUmpQVk53Z3hP?=
 =?utf-8?B?a2V3MUluNEVLSVJoMStZZ1FEU0lVSGNrYlFKMVA0aUZta1pCeFFNeWExamxm?=
 =?utf-8?B?MlR1Vzh0T1NMTlpHTTlRR2pZeWRrRXhPd1E0REdtQVFIVFpVcy9PUitvVGJS?=
 =?utf-8?B?V2NNOUdMYTZSeTVPWkxrWWpPQmp0WDdXSG93Z2R2TFl4VGIyWDlDT1BsMlZP?=
 =?utf-8?B?MUhuM1Jka255N1hmTGRTaFJPem1CR1RoNjAyam5qUWVxTUxXTTJ4Z2NJNkMr?=
 =?utf-8?B?Qm9TMlZTbWNPTWxyT3Z6Zzl1TWlhU2YxSXdaWHJheG9LbXpXRUU1WFEyaElm?=
 =?utf-8?B?MEEyZGZ2VGdheVh4dEk0WXQ5SkhYMzJRZEd5TmppNWE1T1RpQnNJVkpVVGc0?=
 =?utf-8?B?VzlRQkQrWVp6eHRIQjIvWGhpMFlCbEhVaTJmTm1ydkRGN2Qzd1BtbmsvT1hm?=
 =?utf-8?B?ejNKb3FPS3NBYmlQcmwwTkJMRCswY1hFam5EUnQzUkJMQ2xFK3IxNUcvUzU0?=
 =?utf-8?B?emJqcWlCNkQ5a3FjTWt4SWxVblA4aXlZRmZ3bDIrTVJHTXpNa3NrUDdHUHVw?=
 =?utf-8?B?Z2hzOFZVMnJsdHJuYXBIR3lOMlpnbHh4bEl3R0pYL0E3bTZkcXNlV0d6RGFQ?=
 =?utf-8?B?bHJ5cG9jcUtTZ3M0L1h5RWp3K1l1VkwyUUdhMjZmMEY1eW5peUNyQktzWEJn?=
 =?utf-8?B?ZXNHQUFrR25EeE91ODkrZVpFUlVNSnVZNFo3dDFUazBIUkFDZEtpcDd3L2lD?=
 =?utf-8?B?Z01PSWc3aFFoWk51OGVhelIrUGxVQnBpSklVRFlPa3FRNU15S1RHcFVRdFdM?=
 =?utf-8?B?Ni9IVUhzTi9kUzAvM3NBOVF4Ujc0WlI3V05NdFAyVFpGVXZiQkFLYW54ZXh1?=
 =?utf-8?B?N21JbnhIaGZLRHJzZktyWUdBbEtyZzRWZ2xCSGg0KzZqckFEYnJaR3VGN1R6?=
 =?utf-8?B?QmV4QXJEb2o3aXdSeDdlMy9DL1FlbnZDbDZlaGI0U0lhUXNqU2VLWUFERCth?=
 =?utf-8?B?MHoxSmd4cTEvY2NuL09NOEliN1VWeE5qZ1M3blpKMFFKeDFHTW5qRnFib2lq?=
 =?utf-8?B?bUh2R0pONE5YdkVsYWRFWjRBU3B3SG5yYzBWenBheFFuKzJoUS94MSs5NWFE?=
 =?utf-8?B?L0Q0VkhuckhuUWd0RG01RGhzZXl2YnJ0cm9WS2E4dVg0RmNsU3c5cGplb09z?=
 =?utf-8?B?T1E1MFFaRm5pYURBT0NOSkYzdHVCWFlnZFk4M0p3eWRhb0JiTEszdnE3ajZ2?=
 =?utf-8?B?WFdMQUJSaHVVakx0VVpYNVJraHNpNkRhS2FCMlowSFQ4NDFZK0V3T2QvQWpV?=
 =?utf-8?B?Z0hYZEZoTkwzUUwvRlo3elk4Q1E3KzZOQk5JNWNWMm9OU1lDNURvb0hMR0do?=
 =?utf-8?B?aXhKNGwwSkFTREtXcUo2c2hpdWQ0aFgvQjVpRUNQclErUFc5ZzE0WVUrTXNQ?=
 =?utf-8?B?cklmTjVhV3AvNW9kQW1wczZGUkhoZWI3TXM2WUw0cXlsTmJTSXJScXNRclY4?=
 =?utf-8?B?VXJ2REEwUUcrK21MMjBqQmFWdTcxaTFtbDJPaFBNVDNHQ1RDTndOSEpuM2c4?=
 =?utf-8?B?OThzYlM2RXgwdjZlV3R0QkZOcHB0OGluUW5pL2lsdkZWYVFIWUxDVDYzaTZI?=
 =?utf-8?B?MWF1L2prR1E2U2w5YXRHNjBtZ0FtdDdnbkJhU1ozdzJyY2diT1NQaTlaeWZV?=
 =?utf-8?B?YXdoWmxpbUtXbDJ2eFo5WDBRVEVBZ08vMXlZRnVxRnVxY3V5d2c1Q2VBKzQ2?=
 =?utf-8?B?NUVtMDE2cW0vQ0t1VmNVa1QzQ0h1TnN5UkxkejJUb3RYaUZRR3FsS21aVElp?=
 =?utf-8?B?YTZLdkdjdkdjdEFXTXMwaVFpR2xUSlFqa2NnS1ZYZlVObnJwWGp4U0Ird1Jk?=
 =?utf-8?B?dzZqeFhsSjNNTm8vZ0FFWGdVSDUvTm1aTGJ0cDlEUWxBN2xwQnp6eHg5RVhu?=
 =?utf-8?B?bE1vOXJONTlVOUxnMTJ1ZjMxWXRtRmV3dmVtNjRRcC9qRHZPZHRBT0pFMmsv?=
 =?utf-8?B?WjhmUTNZYkladjV1bzJ3S09XM1p4RDU5b0pCcDN1ME42cWkxeU8zN1A0a1Vi?=
 =?utf-8?B?OSsyckdBN2p3WEptN3FUZ2N0N1FDTng4aDNkY0N2MlBIeFRYaFdETXc1YjZa?=
 =?utf-8?B?b3RZeG1yUFZJN1dWeE01TzJ3WmFTbnhkU3l3NGJzb3RrOWVjMHNHWjA4Rzk2?=
 =?utf-8?B?NzEzRVo3bkNpc0JXcnFoODVZemlici8rcFYxcDJ4YmdFdXB1bkFhYzM3b3VO?=
 =?utf-8?Q?Tts0ar/flEapCkeI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc98d10-1210-4ab6-7b7c-08de5ed18dee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:58:45.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XI6x2BFgPtaRhBKDFLiefTKjvfMkq4apwES+uv/n5l3nghyCwa6pNNzfWB9KLwlMqn7+1s16kM5lJNCA/zRV/zHvNf/a0xCyIfZCOhoAq0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9518
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



On 1/28/2026 3:51 AM, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> v2: Modify error message (Badal)
>      Rename reg bit name (Daniele)
>      Update WA skip condition (Daniele)
>      Update SRAM handling logic (Daniele)
> v3: Reorder WA call (Badal)
>      Wait for GuC ready status (Daniele)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 37 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
>   3 files changed, 54 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..c9cb02f32f5a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
> +#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
> +
>   #define GUC_HEADER_INFO				XE_REG(0xc014)
>   
>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> @@ -83,7 +86,12 @@
>   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> +
> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
> +
>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..d28542d980ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -900,6 +900,40 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   	return xe_guc_submit_enable(guc);
>   }
>   
> +/*
> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> + * SRAM save/restore operations are complete before reset.
> + */
> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 boot_hash_chk, guc_status, sram_status;
> +	int ret;
> +
> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	if (guc_status & GS_MIA_IN_RESET)
> +		return;
> +
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
> +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
> +		return;
> +
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);

IIRC in one of the previous rev we agreed to put a comment here to 
explain why we don't need to explicitly turn this back on.

> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_STATUS, GS_UKERNEL_MASK,
> +			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
> +			     100000, &guc_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "GuC not ready after disabling idle flow (GUC_STATUS: 0x%x)\n",
> +			   guc_status);
> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
> +			     0, 5000, &sram_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> +			   sram_status);
> +}
> +
>   int xe_guc_reset(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -912,6 +946,9 @@ int xe_guc_reset(struct xe_guc *guc)
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);
>   
> +	if (XE_GT_WA(gt, 14025883347))
> +		guc_prevent_fw_dma_failure_on_reset(guc);
> +
>   	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>   
>   	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,3 +73,12 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +
> +14025883347	MEDIA_VERSION(1301)
> +		MEDIA_VERSION(2000)
> +		MEDIA_VERSION(3000)
> +		MEDIA_VERSION(3002)
> +		MEDIA_VERSION(3500)
> +		MEDIA_VERSION(3503)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)

I was re-checking the WA platform details and it looks like the WA was 
recently extended to graphics version 2004 as well.

Daniele


