Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220B1C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 19:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9575D10E057;
	Thu, 10 Apr 2025 19:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZzgCV0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC78710E057
 for <Intel-Xe@lists.freedesktop.org>; Thu, 10 Apr 2025 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744312956; x=1775848956;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ikfEjdhKrrdv7SqouSB0pQGTqgbFyMKUxbYnGqSdvv4=;
 b=aZzgCV0/7irTme+TR+Bb++DAyWVQNRk6I/LZi3nd3ICY9GVmiSNZFXOQ
 wjeaUjChIN/F7WCh/5yvxNuSTo1ubckYOzkZgAGPrJ46/QroIpL/rCZLz
 Z8R98HVPMfieh5Rfg265wwiTu3aSu6SxcR3ZbwnKDtzB6CwoeC1Qti9wf
 RK8GXgFUdGDpz28ZoWlVD/KoIGsRhNpxJQuikvyeAgV1XpR6LtjwT9SeT
 8+1cJCdh5osD9dAmzjDpx0t3g+IopNjOpl/E4lV/ehCkDkEM36+8Uewey
 aUVbA4lWqE7Dxj72Y+4yr8QurSgc3XsK8+pSnrXl2TRq6/Le1HmxXVu3E w==;
X-CSE-ConnectionGUID: GjODtFLyTV6HpqM/Qp7ItA==
X-CSE-MsgGUID: y+7YOFNaSO2V+Uy9/slhlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45865424"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45865424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 12:22:30 -0700
X-CSE-ConnectionGUID: CCzod5bvSvqdPPn9v2ehjA==
X-CSE-MsgGUID: cSvryItzSDKqc9N+aMi5aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="133719769"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 12:22:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 12:22:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 12:22:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 12:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2OrJ7u/cHlelhqhV0RMq5lbuDAyjASt8biXyHy9zRkEzJYmDgt2nNmib25s+s/8gn+u4Fl0IAeFOP9RKrXsZQ4dPADqmVDlyGTmtmQBjYZFvgdaMEQUeopQ7Rs/KXaaGQytcWemdjXr4u2czOWvLAbvYlIY+EaWmk0StXbhYCkydLEO8B1dMFsISFj1apfbW5D1qOBKDaHNs1FdmAer4OfdA5KSrA8HHvbkSuHFtsgjRwo1v6PGlkHLbrvGNBANV914ShNTHTV4r9vaGiaWVKUEPA2utTmbRizgbRWx2SS+JplX1voYoxZmokycGYqydH3Ib0D0ceFgWz4Qj9rS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjSUeDuvEDquUxQiE++82mkbQ+l1o9vMMUNJdrAv39c=;
 b=jYpOwUEFqGugBS3ElMWyitIk45VFkonT8jyzS3I0WieKyx6etMaVeWjBTst1Nn7GYTKu2DEnRI+1Dky9rGHd7hmORmWiHpz4yO6HhgqbYOU3TMyUDxOiZySNCdqtqs3IrTm1JOZjrdBGKoCFl2lHLZS83mpVdjrvR2aSxJs8PbVMdbiqcooO9p4aXxjntduI9tK3xa4A97t+cOZvZyBrfEkWpbyetpQ4lXTvt5udWjhYdeOS8KpyLKHdMFxx+h+xNn6n+2XltuphoPnWELNs4wyZuuAaq/xFV42toKw5RAr4rQo704pTssqM4ANGTRfhq1ZdDKFKK8M/yVb7elq3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 19:22:11 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 19:22:11 +0000
Message-ID: <6b550724-d765-4730-8267-59dac8aa015c@intel.com>
Date: Thu, 10 Apr 2025 12:22:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/guc: Bump the recommended GuC version to
 70.44.1
To: John Harrison <john.c.harrison@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
 <20250403185619.1555853-6-John.C.Harrison@Intel.com>
 <c7b270fc-42f7-4b2f-a0ec-f5c1cc58da28@intel.com>
 <5cb3a5f9-d97e-4927-a8b9-419eec61d885@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5cb3a5f9-d97e-4927-a8b9-419eec61d885@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 6917973e-4491-46f0-0bca-08dd7864fe26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2N4cHUyZWpRUGUrNWpxZDcxZmZlaklOaXBHTlZKK2M2Y2trTFJjV0FUcGx1?=
 =?utf-8?B?bnV0NC9oNmRVdTZzR3VxNWM0QjhLZWdsRERIbnVqVHRFZ0R0cnZ1cnNEeDZx?=
 =?utf-8?B?dlZ1Y2lsUEhXWk1LNXpvWW5kVW1vSkxwQlkxajc1UkNkbUtHNkhMaC9HZCtW?=
 =?utf-8?B?S25Ib0MrSDRKOUdoWkhjWW9MV3FPS3FaSnFjTVlXLzJCaURySTFBRTRaRHo3?=
 =?utf-8?B?aWg5QnJNbHljNHhMTmNVb29VSWNHQ1ZTZUhNUHJUTHJVK2Nydm5TOG1GRjFi?=
 =?utf-8?B?R2lZZzFmWVJPR2I2eVZyc1hrYVBDN3VPazRmYThMbHo1ZDRKbXcrTVJxRzZG?=
 =?utf-8?B?b2xJYXZaQnB5Si9jYml5YUg0KytGdzd0dTJqRnFuL21OYWdhMGR0VWE0YTVG?=
 =?utf-8?B?TVhCanJsRlg4QjFXL3lUeElrMU51TVpxOFRRbkF6Q0NsSVB3N2dKRWRJcW9H?=
 =?utf-8?B?WitpVWlsMVpVbkZ0TmFMQnYxTXorUkNWMzBTQjdsRkJzNitaenFGei9PbEgx?=
 =?utf-8?B?MWpGclRFcU9wdmZmQnlsSDkzeE9oQkpDbU1MQ2VDYnJ3ZlRGdzdlM2xmYWFy?=
 =?utf-8?B?UHJyeWovUzRyNHVMdGJuMkQ5aUhpN1VqRm5TaXhnZlNLRmJMc1BBbzg4anpV?=
 =?utf-8?B?QUZJMmNZRklzbTV3d2N1bUd1eDhzYklEQVB4ZUwxYzhVS0RLL1ZPWTNzQzcz?=
 =?utf-8?B?ZHI3cWxRUTRCZ0Q4WTFqL2xlS0YxTTA3c2VPWnBLNHpvSUpNVGRhRkNJbVFF?=
 =?utf-8?B?di9DUElSUVFLdVlRK1RFMWxmRS9DSmowNjBIaHIxNStwRHdGQWFQMkRyZk8w?=
 =?utf-8?B?SzI4eXhrY0JCV3p6Ynl4TmVTc3RxM0VMN2VnWnF0YTRmNEh2dCtLSVRyOGpr?=
 =?utf-8?B?aUM1VUFUOUF2dTVZMm1XU1M5WTkzQjBQNU10Ukl0bEZWYkp5dU5mRjJzdlA4?=
 =?utf-8?B?eGUzL0NUYTF6V0lha3k1MVprVEhMNk8rakdJallsS1FCd3Frc1dYeHlET2Y2?=
 =?utf-8?B?S2thRnRaNjI1QW9jYVF6N0RwcEE2VkJxS3ovVDcvOGlMSmFIUGd0TmFLMjJD?=
 =?utf-8?B?aTZOcTNyVFg1cUg1QWJabjlyMVhsZ2R2c1pFV0s2a05GMmJUT3diaFRnU0tQ?=
 =?utf-8?B?eG1PZUNudkdBZU5SUUpGNjBiMUtEMjBPL1g4THFISnBRblAvZ0ZBVG1UOVBQ?=
 =?utf-8?B?d0lRQTU5STF6STM2TDhBbzlhQzlUVXRYMUlBU2ovcXdGUTNRWHVmNjFGRk5D?=
 =?utf-8?B?YklEN0hTZTJLZk5Wb21tbjNtVWhadzkxWUJrQklKR0swZWQ1cDcvcFg2NDFm?=
 =?utf-8?B?RjNtVENIa3pkNU1YcHFjSW5YOWRxKzFVVUJpRHhPa0w3UDg2RW1rUjRraGEz?=
 =?utf-8?B?MWw4Z3FwZFJWQmRsSGlrK3BFZFU3R3JwYzRxaERHM2FDQVVWNjZpaVFGZ1hX?=
 =?utf-8?B?UThKYjJHSURYQ1BBMlppZytDeE1rQkZ4Q0NJRHBodXFFRG5tTGF3WFcxamtG?=
 =?utf-8?B?Rzh3c2xVMVFxMS83dUlKbnA1c1VrcFZ0NUE1NTRxOUh4Q2sybW9JdFRyMWxi?=
 =?utf-8?B?Q25rVFJCSm5DMllBbDZwa3lqYnlYalBzOTI4RkRmY2IvNXdKbFd1ME9hRVlU?=
 =?utf-8?B?TWlVajBZRHcxTXduUUQ2Ukh6YkdOdlVIaUJYOW5rS2JZSWVPR1l5ZVBMQUJI?=
 =?utf-8?B?cmZPUE54Z3hqMjU1S2FiUCtIYm1JUnVpSHhDaWVqc0llWGl1MEhkWnlQaGlr?=
 =?utf-8?B?Y3hCMzlFV0RzTGdGR0xMQXpNaUErNllQcDJVaitXaGpZRzdYYUp4M0dMOEMy?=
 =?utf-8?B?NUZJeWJORUptQXlKbEQ3REhqL0lWUDJvN0J0TUZSTFVxOEx4UGN6dDgvaWcw?=
 =?utf-8?B?dkhsWkZlc214eG5RVVJuWTFESFl3VU5jNG1GWXdpY2FETC9nVDBpYldqK0ZX?=
 =?utf-8?Q?/n6KRouxvsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDkyVEJaSFJRa0RYa2tEWkM3dGRldUJ0RHMzRmVMeGpxbUJrNkkwcUxKR1pU?=
 =?utf-8?B?T3Z3c0FjTnFMeXo0bWFkR216V2wvLzFlN1gzaU5LMnRxQ0RyNTZWLzNGNis5?=
 =?utf-8?B?MmQ2TEVUeG5OSFNIZzJGTDJ5VDhCZFV1YWtjWFJLSWNyNjcweFV5YUJDeW5p?=
 =?utf-8?B?MVZLeENCcmp3aG9CSDRWS0daQmdCdUF2K3hzWEllVHZSTzFmRkFwdmFHdDBW?=
 =?utf-8?B?c1UxMXR3eHhpRU96RWR5c1V2TStaanh1Sy91Q0c2MVAvZ0gxWVVWNnlxVlJC?=
 =?utf-8?B?cGhpR3BnNGE0Z0oyNUVGZjJzUEtWY3ZEWnhNRHk3eEJoNXF6NHh0Y0JkNUIz?=
 =?utf-8?B?ZjNrem43N0RvdGhiRDYyd0tUU3IvWHBtTmtwODFzTDZCSGkweWhxclpqNnMx?=
 =?utf-8?B?V2pUR09HM2Y5THB5UWQ1WjdJSk5RV1ZQM2FhamZQM0hLYmdrMHAxUzRhN3RH?=
 =?utf-8?B?Y0RtQkRKNWYvSHZqN1hSbjhyU0luZktwSGU4eGZmRlhja0U2S3l6WldNeEwr?=
 =?utf-8?B?c1d3UzBzQk4yUEJpa3NjM2txQ1cvUWZNWDhDZjhmaFBhc3JGTExDZlppUGtJ?=
 =?utf-8?B?TFdVejJmVzM0REo2MTZrWGsyc3Fkenc2eXAzZnNodmphblVqdnk4TlVsTnBp?=
 =?utf-8?B?eVUyV2Ewc1pVdmNDOEdBcjZ3ZFpYV3RsMFVObnJ6cEp0c0FoOTdNRHhzNEk4?=
 =?utf-8?B?eUJ0TWg4SzNIUTlkRW0wZjk2S1ZLeTQxY29QZXZyTUhzSHZ2ZW5Bbk9Wc2E0?=
 =?utf-8?B?L3ViRzJldUJxQ0FCcWdjQzZXQ1dwdVBhNmJuYktDRndiOGJJQ2JnY2drbFpP?=
 =?utf-8?B?Rm9lL0RSVFZ2RVF3aFJHMlFJd1ZKZWtSczlCRGdsLy9vbGZobFd4NEtrdFZ3?=
 =?utf-8?B?QktyTkhGL1lSN1I5dWRPRlExVW1SUjJzbDFZb3cxKzVnYmpJSGI0QXZLUzJB?=
 =?utf-8?B?UC9tN1QrU0xDOXlmdEcvbU5WVCtacVJvWEJsTkI2WGNBM3FkQ0JkZHFYbjVp?=
 =?utf-8?B?cFNiREh4WWxQNkZYZjVRbEdXN29xbTR1SjBTWkNBYWtET0cvemc5UUVOQnlm?=
 =?utf-8?B?RUdvd0s3ZEFhbHBOSTJTdlNIcWZXUzlKaW9zNkdvSUR0c1RtZG1aZXFEaXRX?=
 =?utf-8?B?NG1LREN4dGo2KzVkOVQ1RG9ON3FRdUVST1NaQ1hCR0wyN2xMbmhHUStoNnVZ?=
 =?utf-8?B?NGx5TXNBMEtWQmNzaTJ1VitWdE9Wc3VSRHBMekRjdy81azRPeE9OVUlsWkNN?=
 =?utf-8?B?UFFIS3BaVCszWWIrOVVpektYTTFZQXRRM0VRa0NudDUwQlBqaWNWR1hDUFky?=
 =?utf-8?B?U3hFSWdxV0dBcmtDS3dTS1NuVHVTSE1NOVRQNWpGRm9xWnZLc2lDNUJZWHVy?=
 =?utf-8?B?VnFOR280bVMvMU5ZYm8rQk5SZkN6OFRuTEF2S2NPSWRwMzdIK3czSXFHN1FY?=
 =?utf-8?B?VGt2S09DYjIrVU0wUzdvWEdFSGptMXBRTDVKbmhCeVcwUUFjNTdzdWw2TllP?=
 =?utf-8?B?bXZlQjlMbTMyQklLTG9YM3UvekxLNzUzaDdQNzh2OEc5UllzM1lwdk1mZDZK?=
 =?utf-8?B?eWJEQkVCYys0ZXNYVFk4UWx2RFlQaSt3c3ZKOFAvM1BLWkxZejVJSmZaS3Nn?=
 =?utf-8?B?Mk9Sc1dSbkJCdEM1aU9HYnozU3FwaVBhS25FRnZONTc5Q2cweEpvUk0vMS9O?=
 =?utf-8?B?NnFzbkxTb3hwdWFETXpqdUN1TEk3MHE4SlZCbnRQUDRWNDBmU0NtZktsOXRJ?=
 =?utf-8?B?RnNUS3VXOXRaMVhRTVR0Si9Ed2dEbzVldWt4WC83d1UzWG9rdTVjS2dFTk5H?=
 =?utf-8?B?aWtnTWw1NGpJM2M4SmZ2ZFNrNVpxakEzOUZTb1FpdEhjUDkyVzRoRXRiSDJj?=
 =?utf-8?B?SEZKZS85cmUwRWZSc1Q4bHpVQlg5d05KOHBmZk5mV1dvRk5ud1hLblQ0emNB?=
 =?utf-8?B?bmtZMFJXbmRISFFQcXR2OGgzSmdxL3pkZE9LR1dOMUpiMXN0cUtNSnNxTnlT?=
 =?utf-8?B?L29qaEk0Y3lrRnVKS2dGdHJNK3VVRzQ4TWlmOUVTSjhQSmM1alJ1aDJkZjBx?=
 =?utf-8?B?aFh6dDdBdWtnZGNXMDlFUHhoWVM0T0xpNFkveGlzWnNOZWhUOU00NE5HbDZF?=
 =?utf-8?B?Z0dhK1R3b0JsZTR6R2lBUFN4WVJaTVJId2J3M05zN2I2d1hUdXpra0xoY1lI?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6917973e-4491-46f0-0bca-08dd7864fe26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 19:22:11.4019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKL23GbmJi1omijBRNogymThcbRt0t5Evf081iok3j2wzZYHc9P9qmTqoISEHauY75qaTuLkhEq7Qap/1wmPntnPU5OOcWyFM3QJzbRpWkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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



On 4/8/2025 4:54 PM, John Harrison wrote:
> On 4/8/2025 3:15 PM, Daniele Ceraolo Spurio wrote:
>> On 4/3/2025 11:56 AM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> A new workaround requires a newer GuC version. So, recommend that
>>> users install it.
>>
>> The feature the WA is for is only officially supported for PTL+ 
>> though, so users aren't really impacted on anything else; I'm not 
>> sure if we should recommend the update everywhere.
> It is unofficially supported on other platforms, though. And most of 
> the platforms below are not officially supported by Xe at all, anyway. 
> So 'official' support isn't exactly a deciding factor. There are also 
> various other minor improvements since 70.29.2. So it was agreed that 
> now was a good time to just do a blanket update.

Fair enough.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> John.
>
>>
>> Daniele
>>
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 20 ++++++++++----------
>>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index 4a16d3c40ea9..2741849bbf4d 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -114,16 +114,16 @@ struct fw_blobs_by_type {
>>>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>>>     #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>>> major_ver)                    \
>>> -    fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>>> bmg,    70, 29, 2))    \
>>> -    fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>>> lnl,    70, 29, 2))    \
>>> -    fw_def(METEORLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> mtl,    70, 29, 2))    \
>>> -    fw_def(DG2,        GT_TYPE_ANY,    major_ver(i915, guc,    
>>> dg2,    70, 29, 2))    \
>>> -    fw_def(DG1,        GT_TYPE_ANY,    major_ver(i915, guc,    
>>> dg1,    70, 29, 2))    \
>>> -    fw_def(ALDERLAKE_N,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 29, 2))    \
>>> -    fw_def(ALDERLAKE_P,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> adlp,    70, 29, 2))    \
>>> -    fw_def(ALDERLAKE_S,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 29, 2))    \
>>> -    fw_def(ROCKETLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 29, 2))    \
>>> -    fw_def(TIGERLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 29, 2))
>>> +    fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>>> bmg,    70, 44, 1))    \
>>> +    fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>>> lnl,    70, 44, 1))    \
>>> +    fw_def(METEORLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> mtl,    70, 44, 1))    \
>>> +    fw_def(DG2,        GT_TYPE_ANY,    major_ver(i915, guc,    
>>> dg2,    70, 44, 1))    \
>>> +    fw_def(DG1,        GT_TYPE_ANY,    major_ver(i915, guc,    
>>> dg1,    70, 44, 1))    \
>>> +    fw_def(ALDERLAKE_N,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 44, 1))    \
>>> +    fw_def(ALDERLAKE_P,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> adlp,    70, 44, 1))    \
>>> +    fw_def(ALDERLAKE_S,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 44, 1))    \
>>> +    fw_def(ROCKETLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 44, 1))    \
>>> +    fw_def(TIGERLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>>> tgl,    70, 44, 1))
>>>     #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver) \
>>>       fw_def(BATTLEMAGE,    GT_TYPE_ANY,    no_ver(xe, huc,        
>>> bmg))        \
>>
>

