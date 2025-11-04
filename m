Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C888CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3BB10E0CD;
	Tue,  4 Nov 2025 22:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6yrJiAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8B210E0CD
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762297087; x=1793833087;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g9+RCjglClYufAiOALfTbRU+77MWWk4rSOPB6iL4F2s=;
 b=n6yrJiARHBtv6I9VX3Jm4m+6KisZnYFroFHSXzxPZwu3ICIY0MFa/M2u
 k8QlVbJgMFUUuM0SrTcYQRQ37LjnpvQIUTRXT/uCYPWltMtWe7dUI/sj3
 0YcVunqHJNS2K7ncBQcXK8ptWL6bxtGGPBkFxxw5Ou74DK+5LJ6hdoc8h
 iaW1AQSJECMGTgM+ZSoCBd0nqI7/35f9B/zmQEpXjAUk4H1MGo9OLwVt0
 k8/FO/VRyxmET9NlPoMYRKBb0Qp43Ee+avnyLUeptKIA/fJ4Yw7sZY03y
 JyGc4QSnSf3moDNRFwu0Ls77SMfU4G4ua0YC+iWJZSOFq7Nf878rfG84q w==;
X-CSE-ConnectionGUID: 37Z69aLxQqi8f+6XcsB1nA==
X-CSE-MsgGUID: w1uyMTXRTCWzTnyPTwA1PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64552912"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64552912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:58:06 -0800
X-CSE-ConnectionGUID: IAJ8EANTSFOeNUS7XZFbDQ==
X-CSE-MsgGUID: A6piLUunSh+KQQKch0QYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187729224"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:58:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:58:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 14:58:05 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:58:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW9ZHrV0+H5/Yd7Urwl2SFXILg4cZTqVGb/u4DJ9VW7Iii/S3zZdoLYN/yaW9qtnLxljf2rtwh9wfLAd8V2wv74fhlv6FazZB5mMZPj117OSjMAUmlJRz8SvbvpEz/KqjIwoSSK/1a1F+eFlo0CHaTZYvOSAZaRfCU8TnqS60gK9ibWC59MIRxUAuwxJ8r3uF2YyDmqV57h7DqD6/ew4aj++j5TmeCcgGZ0iKtI1SRgV0cMqayVa+k7SNuqYInedjR4O1X+PsHFFZyqprrVmjy1oEjE8fve4Nr8J8VTXKzO6e/cBY366zaBiGbWcQDogKkW9uNJ+V8MTJThqDbkItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkvfZrxebzKJbnURhJFNFoozHebz9R5/l9q2DDpRsgw=;
 b=irSWYJ4+5M+uO8vEPA8Qb3OGBMcyAuJxFL3G0RrGtCt90CAdJ3L1Swf7xlCsKwHBs+qKqKv+PS+U51rS/8g8ghMJdzu88ko4cE7hqsNCz/ah9VT5YFH3wJWoySMmK9UVn9VrtNit+Tav+VDlD9mYak4oZW3mpdDq5KOEkBdxznotbg+yyQwWlVS4xK5ZGaFFSWdjburIQShzpnjcPnA6cu9DarcY5Ednl/C0Z3PYFVuhyonxFA176Q0tJBhk6jccSRoirGTR7RglxKQurKSC63IWfa7cX6bWQ62ZEjratsiNqwo6D8qkifX/G5HXBnRj5JA51QcvJ9MvwEU/ng2lig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9502.namprd11.prod.outlook.com (2603:10b6:8:295::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 22:58:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 22:58:04 +0000
Date: Tue, 4 Nov 2025 14:58:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/16] drm/xe/multi_queue: Add multi queue priority
 property
Message-ID: <aQqE+KFho9NcNF4T@lstrano-desk.jf.intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
 <20251104185150.246345-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104185150.246345-5-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9502:EE_
X-MS-Office365-Filtering-Correlation-Id: 7351c9e0-b30a-416c-4415-08de1bf59c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXZyR2IrUHVpMG1NSy90QnJCSXpMZFcyU0JmUWpIdW9KWUZTdmYvVnVGei90?=
 =?utf-8?B?RWlTSWRYdUsvcGNQY29FTTBuRzByUUNpM0dlWDlkZkJqT2wzZXFtRmhYNGZo?=
 =?utf-8?B?QXdrNFBobkFrRElFSzA3bWNHZHRlWTF0eUZDNmxGa2NjY1JkOWlRZjcrRjFV?=
 =?utf-8?B?TDlmb1R6ZzhwWWRqOVc4Rm93dXBnRXlsMGNSRTB0N242TnNqWGpmSHF3MEJH?=
 =?utf-8?B?QW0vV2JUSUgwSy9IdjFIVEJER3NDVWZqRzZ3eTRzOWh6SWorZEFCbHBiazV0?=
 =?utf-8?B?dUtmMzdPTzRZNzdDd2U1dVhGWVl5a0g2S3YxbGg5TWd1L1ZkQitGR0JrSlcx?=
 =?utf-8?B?VXJBNkFqZU02cGlEOTdIc053YXZKS2o2aXdaOHhVTWgzV2srZTNJeDZRaG1X?=
 =?utf-8?B?QTJRdTBpQkxzdHMvZm5SUmNuUkhTWmlJOWVKSXdXK2N0UXBqU2UvcDc2OHdp?=
 =?utf-8?B?eG9pZW15Vk4zbGcvamNEaEMvVEtsL3VDYjNzNi94TmFFU09GdnR3alQ5cjlF?=
 =?utf-8?B?N0pIK29taDJveTdkNTgxUXdXVHRvQjVhbURJMWxpS1AyVUxkOW5iREJ4V0Vy?=
 =?utf-8?B?RldnOVBsb0NOVjYvaU1ZWG0rNjRQZHdWZ1MrcFJMakdsT1lNNk5ORk9xVVZl?=
 =?utf-8?B?UnBOakN3MWtUSkxKNjJzQzJkZThQMFZkZlFZNmVFeHdFUjIxUTBqWTc3SjBt?=
 =?utf-8?B?Wm1DRlU3ZWk5UnBQQVpqaUVEdE1aMlp0c0RvbWdkY0NGNHYyTDFydGN0VTdi?=
 =?utf-8?B?U1FSREN0eWRpMENla09YYWdBVkllZXRndWJHN0dkWFd5MmlqWjRTS2VrS0hM?=
 =?utf-8?B?cGlQZlcwMmN1ZVJFWXFqeDN1TXhmK1NxM0NHRU1oeGFmc0RBcUs5Y3JQbVFi?=
 =?utf-8?B?b2ZyMDh3dXF0dmtzMGRUR0piMmt6OU44YVNsbjdHdlpKWkpxY0FzekFJZ25Y?=
 =?utf-8?B?dUc2TldaTXRzdVgzTDJuaGozcFBTSWJ2eTNaSG1ubWVoRXFvZDQ0V1NaWHpr?=
 =?utf-8?B?ZlBLZnBwS1I1bHJtYmwrWHFMMGpvRG03Zkh1aTljejVyczFMdG93TVNPN0JK?=
 =?utf-8?B?ZWhrUzVXdlo0SXBhQWgxUDNHckhna1dBdXJrYkIzMGQ0MVVqcmlBS2JIVDNr?=
 =?utf-8?B?NlhPN3cyL0hSVEp1MCtkNjZ4T2lqa1ZaOHdBeEdmNmxzc2pZSjFvZDU3RlFp?=
 =?utf-8?B?SmZEWTE5aXRIM1hjeS8yaFRtSHZZaXJwNVRNSWV4bXFBODRma2k3bEoxbGxM?=
 =?utf-8?B?TFlJREdPRk16Tk1wSlpHUkFYN3Z6ZFJiN2VzbUxYck41WisybzAxdDhHMWI1?=
 =?utf-8?B?Ynk5VlArUmp1alhOdEtYb3JPbnAvRmphcDczTkhWVENyTUFEcTBmd1U0OWps?=
 =?utf-8?B?VDVBRGFyL3VWNGhoQWVaa3YvQ0tPOGorQmJ5dDZwUTVuMlpQSUVJNEpqdTF5?=
 =?utf-8?B?V0tVTllRZEp3SlFVTGEvNlVaSG50MUtidmhBbWh4MW5zZEQ1KzJMMDdIYXd5?=
 =?utf-8?B?LzdOQmNDVXEzbkl4L0FUb21NcFlDcUJMUTRaaGtFSEYyVjg5Ynp0WmZiemdy?=
 =?utf-8?B?NEtzK2srYVRWRW5EY25FL0pCenpjUjFNYzdTN3pRd2Z5Vm1vRUp1SFd3VDZL?=
 =?utf-8?B?K3NIMWk3MkJmY2N1M3gzOFE5cUo1TTlwU2hkK2FobWErdFAveWpuQ0ZvZXph?=
 =?utf-8?B?VzVWQU9ieUhwRWlPalJaQmx4bGtKeXdKcHBDOWVUWk1OS0QxQkYvWldvNjlo?=
 =?utf-8?B?NFA0MUJ1YURaU0ZDU1pOOXNNVEtXZW43eDhvVTZFRzZMNmJ2WGxzNWpzVGNt?=
 =?utf-8?B?bjdlZytqazdDeU1FdlQzWWJ2TDJLZFYwMk11TGgwUURUY091NndBZ1VjRU4w?=
 =?utf-8?B?TDgxTTNWK0xka3YvREYzMno3RHA0dWE5amhRTnFxay9TT01maFlUYkdlR2E2?=
 =?utf-8?Q?fjjQFci39u869cBdRYhUxH3dv1g14IKG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhFQWpMd1ErYzJmZVhwVUs4L1RqZyttZUxSYm1YZ05zSU93cWJwb2pGN0ov?=
 =?utf-8?B?QnpRZ3ZKY01EMkhKQWN3NTRERWU0dDF1RURYbDF6Z0IrRGZhc3ROclVEdkhR?=
 =?utf-8?B?TEcvY3k3Nnp0djRPVTVNSjRhZ25la0NLd010b1ZiZmQ5NGVCL3BqYXBIcFVv?=
 =?utf-8?B?dEcrM2wrNmdZV2E4WnMveU5CbkgxWUNpOVYwMWV1OC9IQm5CK3ZYS1FDUEFu?=
 =?utf-8?B?MTNpOCtnUURieWVLQmZUZXBxb1ZaWVpWb3RtUWtmMEpLR0UwTTN3UnUvSEsx?=
 =?utf-8?B?QXdCdEs5OHZhMnB4NWlVdlp0UUpMcE1lUzFSRDNmOFFsQ3Y2YjM1ZXhJS0JN?=
 =?utf-8?B?clVUSTlnUmpKZ3pmTWRsWmtCeHlQRmVPUi9pbHlycSs1azY3dWhIQ0VyVHV3?=
 =?utf-8?B?TzFrYjM2dzR4VlZYODhxUTE4KzVxZzk5RHEySFpha0FhQVkyOU9Ed2tiaDRo?=
 =?utf-8?B?blVYck5Hc1JxOXJMRnIzN1ZuR2kzWG1MZm1FUkNlSXJKSjVvTW9MTFR3ZHBr?=
 =?utf-8?B?VmxRY0o4ZGFaTVN4UEVkYU1XaStScWJYbUZEYjdGTFQ5U2gwcDBnMytqTG9S?=
 =?utf-8?B?bnROUmk4ZGlNd01RbXNhdG5lVWJvMENOanJjM2krSzRIa3pTbUw4K2lYcHhI?=
 =?utf-8?B?T2pqYW56Ny9SZTNwR1JyanRPZ3dUV1p5a3FWYlJTL0R1T3c5R3hUeUdwU1FI?=
 =?utf-8?B?dktIVGU3UzBxNFBqY2xmNHF2a1F2S0RxTkFjZ2dtY1packN5SVRFMkZFMWFz?=
 =?utf-8?B?YmpqZWxZa2wyQmdWckdNTGxmSnVWdVlSOUxuSHdMTDMzSmRrblY5U3JJS2Z5?=
 =?utf-8?B?S01ha1NaOVhuS2JHNnNVOG1yWWpmQ1dtbkIvanJjUVI2N1hldHllS1k3bEc1?=
 =?utf-8?B?YzlxY1RmWUlLNjlNZUdMNGpaSVVtUytkYkFQMXFzV1RNYjBtc1RETnNHYUVS?=
 =?utf-8?B?WDFJYTB3bFRyVWQycFNCQkNwaXFOcnA4V1hXbjVFRmZDci9vdVlpY2tiNFZL?=
 =?utf-8?B?bEhrdWxDWE5UZVdOQis4TGhUcVlGV256YUFQeDVzUTU0dHM2ZGxnOU5HNDly?=
 =?utf-8?B?RS9Vb0Y3emtvM0xnbnJZT1dSNU8xRkthSWtOSTk4MDFCWFR6L0FLb1lTRWU2?=
 =?utf-8?B?MnRZSTlYd3huK1prSzZDcHNac09ZVHJnTlJRV0pId2c1Zi9Uc2JnN2xVVzl5?=
 =?utf-8?B?N1UxOWJZZGtzeXpiYyszRzF5MVlsVXhmanFPRnNmSjNLQ2xwbFd5Z0NBc0Zq?=
 =?utf-8?B?MzJFQkxEMi8vYXdjWjFNVk5MQmkxNVpGdTQzdjI3cTFGNGZlTWFoNyswSmtY?=
 =?utf-8?B?TWJpQ1MwZE5nMU93b2dlbi9wZXcydXBGVTV5ZUVGU2R0TnR2T1hKa2RrT3Nw?=
 =?utf-8?B?dTNydDdiUHJGOVBLS1duVlh5RHozQjJVN0VrbCtwRk5EUWxDNTgwYlhSWTI0?=
 =?utf-8?B?aHRzL3BXSnE1TG9NZjFmclUvQTRJWTJwZHFOd3paYlN1NUlDODdqUk9nQyta?=
 =?utf-8?B?Ris1MmpYdC81dWs1QzVEOU1nak9kSldtSzR3VTExdFQ5NzJwc1Bqd24vU3oz?=
 =?utf-8?B?RXFZM0hRVG1Uck9iUU9ETW9zK21mYUVNRjVROXJTSnRaT09SMlBtaWZSVFkr?=
 =?utf-8?B?Z3ZWazlEbWJuRVk1VnA0Z3ZQK25sK3ZGa1I3RnRvY1BiL3BSTnA4eUtjVzg1?=
 =?utf-8?B?QXlGNzNrQjJETGJlNW0wTEltQ0Z2eVBCTXlhMEVFN3RJelpPTlR0aTBxSWZJ?=
 =?utf-8?B?QXpUYXRuWm1DeVZ1amJOeTJDSllJbTl6VHVCNS91NUFpK21TR05aZHBwTk16?=
 =?utf-8?B?YnlaVGo3RXRVL1hnUXpkVHV1Rm9ERm5IOGNjVzNsRWZtL3czbUx4N3dZWFVt?=
 =?utf-8?B?RjJWSStqQjhQcUV5c3lnUmJOdWpJWnZqeEpQcW9vVVc2NEd3WlROekNnMHBk?=
 =?utf-8?B?MU15clIxWWdRS1U4cWJQNjZFSmllazBsdm4wYys4UFpRWWpIT3lSS2hLVTBv?=
 =?utf-8?B?SDNoczVuSjBBZDRwelE3SGUzOUFFbGU1OVRMRUJRQStCYm5RYUEyaDJxZ2N4?=
 =?utf-8?B?OXU3RWwxY3UwTTFYb1hRMWVwcmNnbCs3QThOa3BvdmdzeklzRDlzek92K1Rq?=
 =?utf-8?B?ZHJFclU3bTBvNkJtMzBGc1Q1ZmkzR0FqUFUycXBiVjBSQzlIa0RuMUhwUEli?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7351c9e0-b30a-416c-4415-08de1bf59c3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:58:04.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufTTRw2kxFVr0xCi1n1jRmsJtqp+L52YZBy/Ra092dF+cW1ARiIvhgD2wJvKvFKSJg55WYl7Q1CD4tFs6uaYtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9502
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

On Tue, Nov 04, 2025 at 10:51:38AM -0800, Niranjana Vishwanathapura wrote:
> Add support for queues of a multi queue group to set
> their priority within the queue group by adding property
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY.
> This is the only other property supported by secondary
> queues of a multi queue group, other than
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
> 
> v2: Add kernel doc for enum xe_multi_queue_priority,
>     Add assert for priority values, fix includes and
>     declarations (Matt Brost)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 17 +++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 16 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c              | 29 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  3 +++
>  include/uapi/drm/xe_drm.h                |  3 +++
>  6 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 3a701fa477d7..7e9960ede0be 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -179,6 +179,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
> +	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -737,6 +738,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  	return xe_exec_queue_group_validate(xe, q, value);
>  }
>  
> +static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
> +		return -EINVAL;
> +
> +	q->multi_queue.priority = value;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -746,6 +758,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> +							exec_queue_set_multi_queue_priority,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -767,7 +781,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index b9da51ab7eaf..445ae4979c0c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +/**
> + * enum xe_multi_queue_priority - Multi Queue priority values
> + *
> + * The priority values of the queues within the multi queue group.
> + */
> +enum xe_multi_queue_priority {
> +	/** @XE_MULTI_QUEUE_PRIORITY_LOW: Priority low */
> +	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
> +	/** @XE_MULTI_QUEUE_PRIORITY_NORMAL: Priority normal */
> +	XE_MULTI_QUEUE_PRIORITY_NORMAL,
> +	/** @XE_MULTI_QUEUE_PRIORITY_HIGH: Priority high */
> +	XE_MULTI_QUEUE_PRIORITY_HIGH,
> +};
> +
>  /**
>   * struct xe_exec_queue_group - Execution multi queue group
>   *
> @@ -131,6 +145,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.priority: Queue priority within the multi-queue group */
> +		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>  		u8 pos;
>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 2e5106687a6e..b01d852ae526 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -634,6 +634,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  		return;
>  	}
>  
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>  
>  	WRITE_ONCE(group->sync_pending, true);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index b5083c99dd50..56836a5546d8 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -44,6 +44,11 @@
>  #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>  
> +#define LRC_PRIORITY				GENMASK_ULL(10, 9)
> +#define LRC_PRIORITY_LOW			0
> +#define LRC_PRIORITY_NORMAL			1
> +#define LRC_PRIORITY_HIGH			2
> +
>  /*
>   * Layout of the LRC and associated data allocated as
>   * lrc->bo:
> @@ -1386,6 +1391,30 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	return 0;
>  }
>  
> +static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +
> +	xe_assert(xe, (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
> +		       priority <= XE_MULTI_QUEUE_PRIORITY_HIGH));
> +
> +	/* xe_multi_queue_priority is directly mapped to LRC priority values */
> +	return priority;
> +}
> +
> +/**
> + * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
> + * @lrc: Logical Ring Context
> + * @priority: Multi queue priority of the exec queue
> + *
> + * Convert @priority to LRC multi queue priority and update the @lrc descriptor
> + */
> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
> +{
> +	lrc->desc &= ~LRC_PRIORITY;
> +	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
> +}
> +
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
>  		       u32 init_flags)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 2fb628da5c43..569ca380676e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  struct xe_bb;
>  struct xe_device;
>  struct xe_exec_queue;
> +enum xe_multi_queue_priority;
>  enum xe_engine_class;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -133,6 +134,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  
>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>  
> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
> +
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 4de21e0a4fcf..6734ef7fada1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1260,6 +1260,8 @@ struct drm_xe_vm_bind {
>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>   *    All the other non-relevant bits of extension's 'value' field while adding the
>   *    primary or the secondary queues of the group must be set to 0.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> + *    priority within the multi-queue group.

'Current valid priority values are 0–2 (default is 1), with higher
values indicating higher priority.' ?

Do we have any concerns about exposing XE_MULTI_QUEUE_PRIORITY_HIGH to
non-elevated privileged users? For example, could this allow a user
process to cause a denial of service by locking out others? This is why
we restrict normal privileged users from setting
DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY to the highest level.

For DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY, we have the query
DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY, which indicates the maximum
queue priority level. Do we need a similar mechanism for multi-queue
priority?

Matt

>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1302,6 +1304,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
