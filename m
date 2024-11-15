Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435B6D6A223
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 00:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15AD10E103;
	Fri, 15 Nov 2024 00:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maGlgsay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13CA10E103
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 00:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731631691; x=1763167691;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=P52isyOIpXEgN1SIy4c1ckehpCOprVOgKHFUh1U52kY=;
 b=maGlgsayJkwSwojGbLM1Dqxwf8lPV8Df1sqlscSdl7q4y8AHAZ92IG8E
 fQGC+YggWQpGTMen0kSYFAAf57FUV4MMph/oiyXslUp36bN9pPFaZAK4M
 yzU3QRvooe+EmmOGwNwQTVSIthYTbp7CGtzUeqQXJObkZoQmnALagEO2A
 PzAatVgUlc25V/ieOXgsYk8Lw7IzfxGjUzCdasIJcQCBSanHPVOGrqT5A
 9XnFUOtMxr+KBNZ2C8YOfg2RG+E0PwNSkPIkfJD2VtGnWNzsCyFhhAYr2
 TGC5l8Zy8EhVBkN3NndAZdHQrUZMTlgzeDMfqDVq83OSnZIDYsMAFf2te w==;
X-CSE-ConnectionGUID: 3KQc7hkPRGSdarwpHM5xHw==
X-CSE-MsgGUID: 9ZWLqz6ORLiU7A7nCwCAcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="57018046"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="57018046"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:48:10 -0800
X-CSE-ConnectionGUID: cOEn017gRKm4up13EYED0A==
X-CSE-MsgGUID: 2SNQ9JLoQ8mEJlRD4dLetg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="119192214"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 16:48:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 16:48:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 16:48:09 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 16:48:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8L/EFZm7lOHocZw0tMb3O18Blf7bee2W9N3ZWWSenZ3h6Y/FkJ+DFAWH01wYl1k/0LPfhxsayFLfFLKhd8g0+3afzvh14y/cHmZF2SlY5XweTNKFsV7FSoAamfhSnApQyqgzXNyz/Gd8wWZz7qlNGtWKTmvw6v7WTeXfH05imc/+neOkH/tUVmUPwWOJOo1CGgWvnFt9jgmVAqt+V9Pu5XbWRVR6pZtQDHoK22nJaVAE0zHik3OI2YzgT2c1kBEP9E1E0GBBcqDmx4J5No7Au4r0SM9POGH4jowwBpcH/YoTh2bB1BGiZEFcB93FDH0RjwcutK2Egk91WvYngMs4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVcyOD8nqWF5W/TDpm0R/GKdXoifU7cyotGFHXZ9rqc=;
 b=kqC0hIsH6I6eN84lPhjry132YRQ3b21qJI05HL2YDHW8Z7qRPYJ4EUqPuQDa0s/lkarjDFqYoHdmVxx6FHLGVr4veVQGhtnBLDY+17CDkCZ7Yxav+AyjZA3QozXs2n4oGklqZJRUAjDRntGAhPwlaGqan8egsJhEYIJ3OSCipFRGhbutKkjOw6VQkXtZEMLkgT5LkCSi/yd6/3RYeT1TUuOxVBbR3pX7/q8sI/LVSXsxzl9v/js93WjVyMJGysMhbX5Zs1JOWao90My0X1XBm+a28/Gr8p+VcgORVohJ+GQIs4yBpV1mctJ5NX7AmA4fVLcfBWrPeiAFbbiOQgdzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.31; Fri, 15 Nov
 2024 00:48:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 00:48:01 +0000
Message-ID: <afeab73d-df94-4a5e-ab70-87cd4d545f79@intel.com>
Date: Thu, 14 Nov 2024 16:47:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/xe/pxp: Add spport for PXP-using queues
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-8-daniele.ceraolospurio@intel.com>
 <63591af8-7d95-44b2-b3c0-3890b850d80b@intel.com>
 <0f0b7b2f-b8c2-457d-bfba-c4311efd2c50@intel.com>
 <189089b3-561f-4639-9718-e96c098ee96e@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <189089b3-561f-4639-9718-e96c098ee96e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9c49f3-290a-436a-fb42-08dd050f27e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3A1UTBZQ3FMb051Q2FvNW43ZFNTbW1lNFFIMG1uOGcwNFpITVcvSkp1eXlK?=
 =?utf-8?B?YWYvaEU4UmVHdDJFalVMaWVid25PcHV3K3Bvb3B6c2lEcUd4WXNjbzBKVVdi?=
 =?utf-8?B?bjZBUzNQbm9jaVFKRzVVM2RhT1N3VU5GakJVc1VCT2ExWDA1NG1lUEo0aGt2?=
 =?utf-8?B?L1VPWjlsdis3N25oOE9aSEUwYjNEVEtjclg4Lzg3MEc0T1NGeFRnR2VVZ2dz?=
 =?utf-8?B?akd5WStYWkpWVHIxYUhhTVNkcThuRERJWW9LRVY5TzZ1L3pyVGxWZVNHRUdT?=
 =?utf-8?B?bzVmV0cva3BJczIzeUJBMUhsUFMxemhXN0p3MGFrcGJkL2d3cEFNLzJoVng0?=
 =?utf-8?B?NU5jMmdrQkV6bFVyb2w3YnFyYkkzNkFtWVBSa00wMC9MY1JibGlBdlZJWldt?=
 =?utf-8?B?eU42blZmM0VXM1pRbndkaStJcUNyZEorTEVhYStRT1ZVZlNleExOQlh2bmZN?=
 =?utf-8?B?YUZRSHdYbnFqaEVweWl6TXcvOXdGWXozOSsxL2poZnB4QmZ2QkhVcXMvOHJ1?=
 =?utf-8?B?U0xoTDNUcUlSVm9vV3Yrbm5ZMVFIdUlKOFdob3d2UUE0K2hONy9OVFlQbDcz?=
 =?utf-8?B?c1ViUDFWRnlhVWpkTzlxV0NXaDJHVFdWRi9OQmdsM09ydUdUZ29aOXlEa2JB?=
 =?utf-8?B?Ukc4QklXU2JraVZCSmJKRzNFMnUvbVBiU21RbHN0dDdLQlJaS29nWWpWckhy?=
 =?utf-8?B?MVEvQlltcHp2bUUxTy9NK3piSkd1VTFKNEtyMDgxUmdZWlBHNW5peDdHdlpQ?=
 =?utf-8?B?cG9EcE4zb1ZQWllEcC9DcFJ0SEtSelBwK3pFNlprQ0R1VWpGY2JDZm1VUjRv?=
 =?utf-8?B?b3dvRHB1U2JJSzBvc3BxdjI1UjBXQmVRb1JZb09SRndYQm1FY080VkVML2F2?=
 =?utf-8?B?OGZ2U05VYkQ4R1VUN3lWWVVSTlZtLzEzRFVyZzJFTVNpNDJOc0N5RndZNlhM?=
 =?utf-8?B?K1NLaGt5d3FXajFsQTRyK0N5cDdaNE5MZVNBMWZmSXgrUytNaDBYY2R3c2lq?=
 =?utf-8?B?ZzVGdWxnSkJHSG1VSUJ2T1JFUXM5YjgwbVArQzN5YTRzS3dycHVlT3JxQTdv?=
 =?utf-8?B?c2JDdDRCdmpYWThUZnBTM2VUWjZvRDUvUkcxYjRBd1ZLb25YQm45UkxLRlJO?=
 =?utf-8?B?TVlOK1pSNmlDS1VkOEZTYVByZFczMUJENFRldUJ5cmY5UFk3M0JWYW1laURR?=
 =?utf-8?B?MVVCUmludndhUWJVQTVhSmo4ZEZkK0UveXFCeWNYQnkrSVZXOENxNjZVdlZz?=
 =?utf-8?B?THoxYmhHVFRJOE5rT1BwemlXajNhaDRKL3RybytGS3FOOFNpVXNUK3V2NEth?=
 =?utf-8?B?V1VFTHdlYkZyT0RjRlZORStaa0JoOVZTcTVxZnRvZC9pcEcyUDZuUGo5dEtR?=
 =?utf-8?B?em1pNkRFa0FsNzJkTzFDUUhLOHl0amZEOWRrSW9RNDhHbjlURTJlaHR3QXdQ?=
 =?utf-8?B?aEJ5dXpkTlhZaTlWNHhRL1htZUxjd1BONm5YaU9KWUN1aWxwajNpaXhwRFdH?=
 =?utf-8?B?UFlEejdhSVV5MHNaUDVEWTlpb0c1L1FKd2RGQVJFZzNSRVNTbnVTTUZqTXlM?=
 =?utf-8?B?NlBLV2pSNXFuSjcxWFl2bHRXYS9WUWNGbUZDVzVKbW5uMTg1NEw5elFNbFNN?=
 =?utf-8?B?T29nR2swVTUrK0lZVE52ZDJsanJZRVpEY2pkMXIwdkRaa1VrYk5HalN3WVZO?=
 =?utf-8?B?cUU2T0tkL2I0S3kzdUlsdGM4RjhpSHQyajVwc2dReEZ5eEcxQUs0WlVvVXow?=
 =?utf-8?Q?Z3+3vw4Pk03fMXOi8b1nfC5/i+g8qlguwyWMeWq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW42a1E0UXNnVE40R0l2eXdEYjhjK2hjYXY4R2FEclVid1k2bU1SZDRSR1pn?=
 =?utf-8?B?TTh2cWQxM1RBMGdzQ2lRalRsdzdEMG5qeDFSdmZDVHJSWHBLMjBISDFFbmN5?=
 =?utf-8?B?NHFmQ01EdHdqVG5ZckJ3aE4vQ2lUYnI4U2dQS2ZjNEQ1RWRYUHpnR0V2SGtL?=
 =?utf-8?B?VUZNeUVkd2dmMjEvVTJBNWRWcnR2TG4zZE0vSVF4dWR3ZlA2ZW9aalFFQk1F?=
 =?utf-8?B?WWtkQ0hraC9TeTdERk1qNEsyZ2FqekVxSENkOG5KdExkRGM3RDNUbm04Mk9h?=
 =?utf-8?B?ZzgwOVNxUUw0dnhyUkQzcnFOWjNPUmpFME1nWm1jVWYwMEx6Yk52Zk5OSUNK?=
 =?utf-8?B?QzJ6YmJPdXZLcm9STERxN1hoa05ldk1OUUROWi91ZjFhbkVMMkd0NkZHWU4r?=
 =?utf-8?B?SUZnMVhRaGplbFFYcU5kSitKTjlTSnEwOTNLbmtoWWRVRmoxU3g5REZpQUdh?=
 =?utf-8?B?QjJlVElBb2FTMkk4L1c1eWw0TWdxVlBFbEpYUjc2TE1BTjhzYTh5WWJ5V3pN?=
 =?utf-8?B?VU5Md0ovQVBCeElrOFlNR3U0cnBnSTN0cjBTc2dGMEdVb0ZwcGhucXA4UlB4?=
 =?utf-8?B?L2JVVzlMZ01sbnVrR0NjZmxidHE2clU5N3IwcHFKU3k2N3NxeGZHdHcxdTJq?=
 =?utf-8?B?SW53amkrQmY3bmtjbzBzY0pTaXVsSUl3ZWhRK2ovQjlWb0VBSjdseXB2QVU1?=
 =?utf-8?B?aDZoeVhtWGdWL3lpOEVuV3hQK1F1MHJkNEEyS0o3bGhiWHdGK0U4cW5LazQ1?=
 =?utf-8?B?VkhVMjdqUzQrOEV2U2V3WUtjQjFDdGNXNndqSEMwTTdXNkZhRlIrOW54VWZu?=
 =?utf-8?B?RlladXJHb3VORlVaNGx6RlN4MmhKZXNtZW1XSlRNUlhqM2s5VWFOdVl4d0ZL?=
 =?utf-8?B?T1plVXVYZWRKdlpmbEZYWkJFbzBZMTc2NFh5STVCRVMvUHphS2dKbDNmdnFC?=
 =?utf-8?B?RmlNN0hsVHZkTWJ1N0NWcUVheU1pdzNrY0RYbzFsRXFoMCttRUkzeFMyZmR4?=
 =?utf-8?B?cHhqRGp6dGlkMjUzTU1vSmZpNXhVeWM5aWtsZnVvYzk4THU4dzlENmdUL0xL?=
 =?utf-8?B?eWM1NDU3cmJPOEsySmxMbndJWVFESStOTlBEZ0lVMFkra2l5MFZDVlEvN0x0?=
 =?utf-8?B?OFhCLzlqNUZuenAxdFp0a0NFOFVudkZJZWhMZmtkSWI4S1VDNkIrUnlsWXVs?=
 =?utf-8?B?dVZOTVp0ZGxhbjJmNm9KNUgzbHZLUnBCTGYxeFF5all2UFBYYWsxU0x0d24z?=
 =?utf-8?B?d0JEdHhWQTVuM0JtSXdvZTRhUXBsQjJpTUJpRHpPS2pPWmVkN1JEb0UrVEZz?=
 =?utf-8?B?ZnRHZnp4dk9NL2JmZzdab0tzcXlERXlyNnJqckU4b05hWTJqMFl4NFo2WTM1?=
 =?utf-8?B?RjFQTHhLRUJ3MFdHZ0lHaWZPTzd0WjEwR2h6WTdqbUs2SnVieGZWTURWQ01X?=
 =?utf-8?B?QzFnWVVTdGNxTXplWU1KWmROY1R5cGpkUFJLVGtVTTVWOW1IUm1BRk9WTTVs?=
 =?utf-8?B?eVFLOXdGZDAvNE54ZGM1cUNGWWQrZTJ6YjhtcDdaT0tXV2UvbFlSb2xpN1hP?=
 =?utf-8?B?Qzd4N0FsTlJ2N1Z4YjRyV3ljNUhVMzVmMjVseFdJZ1hXMzFxaTk5MGZXWFdT?=
 =?utf-8?B?NGRpNEFnL0c0ZjdjMzV5dU1Pb3E3cDYxbVcwdFhCUFcrdlFmS1BSVWo3Tmhy?=
 =?utf-8?B?cEt5aHFGa256Z2hoY2dodW1uaGNOci9XYnhCMXpVM2F4VTlSUFFHc1RxVTlE?=
 =?utf-8?B?QlJEWWxaaUx3QVdLbGJnYU1XTzVJY0FvVHB6YlVvUVgwVlNEaUJPdTV4Qmd0?=
 =?utf-8?B?TloyRWdjby9nU0hJMVc1MGJQQ0FRbjdQN0hIMmhIUGhpSUtseEdYUE5USUx3?=
 =?utf-8?B?OHBuT0x4dnJXMUxXNzZVYmFCcG94eGJBV05JdFVDemZBaFg2aDUyRTEzSEtq?=
 =?utf-8?B?S3JBV0dKaFh2RkJqYzNPdkZFY1JKTmVCZWszVkpGNFVqNytxZEpORnNWTklt?=
 =?utf-8?B?TUJRQW9ZYTdiN2JDR0FmN3ZmdmxDRnRySjJ1blpDRTR2ZDc4UmgvaGF6THNa?=
 =?utf-8?B?Y3RnZ0xPc25PV3kxdldPd0pBdWZKUUZQanRkZ3FQVTk3cjJDbzcxZ2lVTklJ?=
 =?utf-8?B?a3ViMHNYZS9aUUx2N1kzOTlzMEFENDY4ZlI1OFRJUmNUZFdiLzhEcEZkaWMw?=
 =?utf-8?Q?6iuJun1CIciWD/Z/05WC1dg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9c49f3-290a-436a-fb42-08dd050f27e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 00:48:01.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs34gg7DHCXYN+nxA4JvN36A2f4UYR31ZB80/bVgkctZebB1oO8SJ+yyseHPmvL6Rh7hEqbXfPJbfDhaCF1TTCCKqgIkxNM5fx9TebVCxQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
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

<snip>


>>>> @@ -343,6 +377,24 @@ static int exec_queue_set_timeslice(struct 
>>>> xe_device *xe, struct xe_exec_queue *
>>>>       return 0;
>>>>   }
>>>>   +static int
>>>> +exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue 
>>>> *q, u64 value)
>>>> +{
>>>> +    BUILD_BUG_ON(DRM_XE_PXP_TYPE_NONE != 0);
>>> Why a build bug for something that is a simple 'enum { X=0 }'? It's 
>>> not like there is some complex macro calculation that could be 
>>> broken by some seemingly unrelated change.
>>
>> This was more to make sure that the default value for the extension 
>> was 0. Given that this is UAPI and therefore can't change anyway, 
>> I'll drop the BUG_ON
>>
>>>
>>>> +
>>>> +    if (value == DRM_XE_PXP_TYPE_NONE)
>>>> +        return 0;
>>> This doesn't need to shut any existing PXP down? Is it not possible 
>>> to dynamically change the type?
>>
>> No, this can only be set at queue creation time
> Would be good to add a comment about that? Maybe even an assert or 
> something to ensure this is not called post creation?


Missed this comment on my first read through. All extension functions 
are guaranteed to only be called at creation time, so there is no risk 
of this being called later.

Daniele


>
>
>>
>>>
>>>> +
>>>> +    if (!xe_pxp_is_enabled(xe->pxp))
>>>> +        return -ENODEV;
>>>> +
>>>> +    /* we only support HWDRM sessions right now */
>>>> +    if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
>>>> +        return -EINVAL;
>>>> +
>>>> +    return xe_pxp_exec_queue_set_type(xe->pxp, q, 
>>>> DRM_XE_PXP_TYPE_HWDRM);
>>>> +}
>>>> +
>>>>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>>>                            struct xe_exec_queue *q,
>>>>                            u64 value);
>>>> @@ -350,6 +402,7 @@ typedef int 
>>>> (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>>>   static const xe_exec_queue_set_property_fn 
>>>> exec_queue_set_property_funcs[] = {
>>>>       [DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = 
>>>> exec_queue_set_priority,
>>>>       [DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = 
>>>> exec_queue_set_timeslice,
>>>> +    [DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = 
>>>> exec_queue_set_pxp_type,
>>>>   };
>>>>     static int exec_queue_user_ext_set_property(struct xe_device *xe,
