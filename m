Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61469C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D92410E736;
	Wed, 15 Jan 2025 15:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdX4s83s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011B10E715
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736954782; x=1768490782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3cFzrynvulIIsSuJz5DoCa1nFyonVvn7y8BF6krzBjc=;
 b=EdX4s83sbN1DiQBapw2T5323iVTQXePg0IKJrMD01fRX/sQ4UibjUxU1
 oncQvirJ5X210pvwbNr0pJo1s8cJkpVuRkWm1ZhvbY+3tmSBRZYUxq4W+
 RT6y35LhSdf9QcpD8n4l52AKKSiVRW3WowOiURMFZApfOdY7HI6WUOopX
 0CFnuF7cfa2M3mcc035f3YgD7xBN9U7RxPgrJsG+ZXIv2NwJtdyvIQxag
 rL3p42PIzQu4bgqUwzS3jBbYdKkgDSrhYne9IGPoKwXaeHTUclWjLJB4g
 xBOTQz1tsFgtsDax+fJFYgJ51M+K8H+BqG1XBwvLnasXvalBHR4zQ93wQ w==;
X-CSE-ConnectionGUID: sq15lPvARsKwXE17u6fa8w==
X-CSE-MsgGUID: 5GbIhS3lQwKFWZdIJt2X6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37452866"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37452866"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:26:22 -0800
X-CSE-ConnectionGUID: mPsRBDxHSaiWxzrEZZQTIg==
X-CSE-MsgGUID: JAWF/Yn0QBqMjMZYTFlkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109798655"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 07:26:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 07:26:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 07:26:21 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 07:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvdwNh7xpS6lWN5j0q1A7Zczk3aJsPa6smXGTXUVDDzxV6NAbEROAHxFRVooDrxyjiIwH0I5Pq4ip2caI3oslDawr96zzATzgClqxYNZjEFkJoqcc/S8oj3X7wb4SxSbvQ7UrhblEwPV0OVcjEQVkNNK/3dId6Nnct0fzLDHHwZHLqfJgOuBalIs9iHh9o7Pubdi3v7QTwSj14bvKa4UjxN6I56EGQmhsCtH9ACf+mlJ6RwBk1xED5h5uW5r3UHJLgf08Fghj52s8jhNIcmpVC/aosnR+xhvwY7RRxfjX2f+dGkQkejY4VfR65Au/hyPA9UT3Ow+EAO0/7QjUNoArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cFzrynvulIIsSuJz5DoCa1nFyonVvn7y8BF6krzBjc=;
 b=moXStKgJNuFOSmzXc7jAdf3SjG3OE6qS7lgMtiMN5sL9QNNihyqld3ZPMfz+3fL8PqxkPmb1LL+pTeDCNGXUjmjQL0N9kfTZuxUkMhAjIR8Qx/TvG3z8pwqLap+Pk6OR2IkqSD0aZ9/V7vl3SrbJYTu+w+ACJtGVMsMIOtdPi6jrO6z28oqTmmZGnT3nAO/wqlgn/UxAKGyotReEOm8D1nb31u9goU80amaO1MVdtNNHRL5ddam5iYVlsjVAaIYipwhHZyDBsXp64AkiUFAndnRAiQ0Zxlo2Kjwt37dTIfLjTbAnabK4cE6NqXx+Tr8LuVVyptCpjMoA2oll8v3ddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6171.namprd11.prod.outlook.com (2603:10b6:208:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 15:26:19 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 15:26:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Thread-Topic: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Thread-Index: AQHbZq5EKKef+MwvU0+YQk/6GGORcLMWnj9AgAECQwCAAFC2QIAABK4A
Date: Wed, 15 Jan 2025 15:26:18 +0000
Message-ID: <CH0PR11MB54445001BEB95D4DA288EB9AE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <CH0PR11MB5444F77CC2DE257A7BA51E1DE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4edb736f-907c-4506-ae77-739d3aa377aa@linux.intel.com>
 <CH0PR11MB54445024134CDCFC27E2662BE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54445024134CDCFC27E2662BE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6171:EE_
x-ms-office365-filtering-correlation-id: 45a5d769-c1f4-488c-686f-08dd3578f597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MStTWlRIbExrdEpFZ2xtZ0p4VG5FemVrWVdXZ3o3RHFXdnJ6WkZtTVF3eCtv?=
 =?utf-8?B?QXoweC9WbXFjTklRK0tpcG9JTllldWNTR05HRE5vM2h5WEdBNGtpSWRCY1VI?=
 =?utf-8?B?N2lITDB3ODl6MVl5UHY4eW5IUTlnUU5xUzJlRXU0Y2UyUmFPZGFsQ01lUUI2?=
 =?utf-8?B?K01pR2ptVXJnTFlISUpWOHBrZWdhY1A4ME5MU1loYTIvMkZoVE9iU2RzR21H?=
 =?utf-8?B?S3h0TlZTMWFSd1hQSVNwaDQrcEtzUlVIR2t4UXJrdXdrLy9FWmw4MDcxaEZ5?=
 =?utf-8?B?RHM2T3RaNmJrV29HV1JaNGg1bHdpaktmWjV2bGFJQjFSSDU3WDJvVGRySk9E?=
 =?utf-8?B?V3p4TVhuOWtWVTBPRGUvUkw4SFZkWW9FVlZNbTdWeWJkd0tWamNXRTI2cE03?=
 =?utf-8?B?UWFJa3A1emgvWGYvUlJ5L0NqSVlwZjB6Z0hzZ0U4TXNpdThEV20yZ3Z0Mm13?=
 =?utf-8?B?bVpKT2c3dVF1TTdYVDF0QWE0K3R2eklSTWdhbEZSbzFqWGNkZFdQRlVqOU5v?=
 =?utf-8?B?blU4NFJQb0EvQ3BjK2taM0Q4N2dsT2o3NHd0YTVFWUhIRUtZeTI0SjhlSkNM?=
 =?utf-8?B?NnVyM3Q0bDhEZ0F2ekNxekZjN29ZVFc0cFp0eGpEMkdIbUVBOFZwaEhLdXZl?=
 =?utf-8?B?R3EzNVpjZHZmelhaOXYrZ0VReGVIQUxSSUpnQWp4Zy9vOVh1dGF1SllmVlFw?=
 =?utf-8?B?M1ZGTHdadDZncGttU1pnOGsvWnhZeVg0U09yNXY3M0R2SFU4Qkd0bm5tcHpx?=
 =?utf-8?B?QlE0dzhnYVdOdWRrM00yeTY1eGVBU0YxbTcwWDB2aVhOazZQVFNnQy95Ukdp?=
 =?utf-8?B?UCtKdDBLb3gyUXFOZXEwS0d0M245NTY3VnlST3AzSExZWlF3VzNVZ251Z2Y3?=
 =?utf-8?B?ZHdpTlJTN3FoZWFlUGpGMFlyT0Q1OVVCWnRCR2lvREdZajNRcU9WeTFJR3hF?=
 =?utf-8?B?ZC9HY24yYm9tcDdJeHNIbU4yR0Nmb1VGK0gwUmQ4eVl2cHhCczJINVUzSklw?=
 =?utf-8?B?aEx4RWQ5Q0txRjI4a3MzaVhGQWVBcnFWTWVGNTNLWGE3dUYzdVA2cWtVSi9n?=
 =?utf-8?B?Qmk2ZjF3ZW1qYTRDWVdqcVFNVTR6RVI1eXUzT0xwcWZWbUY0aWNueXhHcHVl?=
 =?utf-8?B?ck1GeWg1U2hFaTRwNlp3cE5UVTZMLzMwWjArRm9SV1V2aVVvNlFLdkYwUCtC?=
 =?utf-8?B?QmFjWkZhSEhnTDdpSythZGZYWGVhZ3kwalIyS1lLT1B0N01FdTBDVzdad1Jj?=
 =?utf-8?B?aFhVd3c3RVNVenBJbkN0SnZFM1l5THVpdEhTZ1YrRGFWQlphWlVmQ2lWWUk4?=
 =?utf-8?B?eHhra0EwNnhsbGtqOE1JT2R5MlpEbHN1aHlUQlJEaWIxRVpLVzdqQkhLSmky?=
 =?utf-8?B?R3ZiRDAwcUNqSUorR0U4VFdHRGVQSTh2YjNneEtCaWM2cHdkbkhkRk9na2JD?=
 =?utf-8?B?MUh6Q05XQW8zdGlNU2RMSWF6SEtYQWVPejNWQXF6Yml0di9lLzdtdFVONldn?=
 =?utf-8?B?THhuTEdBNHp1TllxQlVHK3RsUzlVbGFuWU5CcXJHMW9OcFIyblpMQUd5TFFh?=
 =?utf-8?B?OU5xdUFSSUlOeVVNSHI0QlBtNzloWGsrK1lIUisySDJRWDZIdGNWYmJEdjU0?=
 =?utf-8?B?VlB1Rk5FYmllWThUZWp5NlBwbGM2NWxTWk54MWpUNVFhM0hjS0pZL0d2SERl?=
 =?utf-8?B?aWR5M2V1czdLeHlnM1VJR3pQOVpXeVhnWTF4TWlDT1FRUUo5S21ibkhlVVIw?=
 =?utf-8?B?RXdNZUxad01FTnU5bW55cEc0MWZsS0VnRFBmVVdJWTl6VERSSGJWQ3hTYldW?=
 =?utf-8?B?RzBNeVVKQ0pqU3cvZi84YjV1THM1WHhvakt1N3pkUzYrZmxQYzVLakdGUXFR?=
 =?utf-8?B?NWpFNzNhVjBDeUUwaGZCdUxlZWxWQ0M0OXNYZVVBUUhTa3ptS1VUbVFkeElL?=
 =?utf-8?Q?dhlRPPlBN1KdmtHQxXLK7YyZ/lFzJOPU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aksrWTFOd3FTcklseGwxOVJLZVJOSlExQ1pseDVaMWtkSCs2QTc4dFVtMXJZ?=
 =?utf-8?B?WkI3N1ZUbWdpRzNtZFNFVkdFWlhxNTFGSHBsbmxEQ2tpTXgvTVM4VjlQNEJJ?=
 =?utf-8?B?UkoxbzYxSzcvb2VDZFRpY1RIcDZjUWJqdHFlaFpxOURwdjdEMmcrbmVmbGVS?=
 =?utf-8?B?Z25hSzBFN29xNGxydlFCaWlMSkN2ckZlUmhJdTNMZG81Ung4aCsreGF1aW1L?=
 =?utf-8?B?Tmx2RFZCL3ppQzFibGdwYm1hQ0tSamFzemY2Y1oyVnoxMzNiQzBLUldiaFRK?=
 =?utf-8?B?YzZxSEtESWNvc0hVWnBxWFdjVTI3NTYzb0NaZFdKdFByVm0yemp3a01FRVEw?=
 =?utf-8?B?N000ZG12YlBRT2VINXlaejdwMWZaaGNFaUt1WFoxRVgxWDloS3daY2Qwejgx?=
 =?utf-8?B?eGVmajY5TXlNU0tLcEJvbVo3RkE0eTBROXllbWFhcXUyRjdvdzhkRGVJTGd4?=
 =?utf-8?B?YmtEZ1Y2SzZuRHN1K1JmNWJmTEcyMDE5TFZQN2xERmRhbW0zcEYzODg3ZVp1?=
 =?utf-8?B?VDhXTUhnU281bkQyNVovL2ZlZEk3WVBVdjZzd1ZhcHdsVm5uak94aytJZEJj?=
 =?utf-8?B?c2NaT3NSL3ZmOTBGWDhDUC9meE9lWnJZSlNaVXV2Umc1TnBMWk9haFYwMmFw?=
 =?utf-8?B?VC9KOGpLSmc0VjlTQndvQUxvMnBMTkI3R1pUK3JPVmkzazR1aUE3MHpjYW1G?=
 =?utf-8?B?RWphTm9icWZiWW1pbmhDZG1CS3NVeXFOMEJjWXl0RWVSVUV4UGx2cWZLZHdm?=
 =?utf-8?B?VU9Dd0JJVnFpbnFObWgrc2hqbWxEQTNHbTFVNUs4NlV4ODhDVzl5SXAxT0NY?=
 =?utf-8?B?OEJ4K3JsbnFvWm01MDNmSFBOZFhmV3JVQ2VOMWMzSkxrOUFFRWNIdWRhak42?=
 =?utf-8?B?OVJhTllhZEFhUnU2NDRMMVcyQ3FxckFXaGpHUE1mVGdWZVArdlI4Z05kV0dw?=
 =?utf-8?B?d1Y0cEZNNTFqN3VKcHQ3dEtsYjRiZThDaTZBVURTdVZYQ05uT08yMFlaWmR4?=
 =?utf-8?B?b3IyUy80aS93UzRDMFRQSEtrdEp3THk0S1dIVVp6QUxqOThOUTJzUmtDblZY?=
 =?utf-8?B?ZGRDYmFpQ2dJbHh1SEYwTW8wWWdPUmc2NU5NQUNmNDVyTGRxeENzdlRLSE1S?=
 =?utf-8?B?aWlzdG9BUWN0cUIrYURFWDhXNUhQczlvdGVZN01iRzJWd1piQW9VQVlETFZU?=
 =?utf-8?B?V21pZHA5dGdxUmo5ZDdlVDljZXoyNFVLTk5BaWdXcjZDY215NXFzZTJKR2li?=
 =?utf-8?B?TWc5Lzk1S21nM0Q3b25pOXFab01wTy9SYjMyeCtyN09vRnpaamNLQi9POGVi?=
 =?utf-8?B?b0JOdytlT1N1dEl6aVRTck1zTlpXY0xHbGJhTDdJbHc1SUV3OS9DK3EzMVcr?=
 =?utf-8?B?UzRNbWF5UkNPSmtuMmxaeGpLbFc0dkhqN1owRWtUVkZvWjNnbnptaDVNZUMz?=
 =?utf-8?B?UVpXd1V1dGI0NlRpWVFoZ2Q3aXczV2tHMXhRK2hZejE5ektXU0lPUDNFaHkv?=
 =?utf-8?B?V3lSUEp1ME9hUnZqK25sL0Y0TkkwL252N0lKTG5LekMxcjBwY3ViNXkwMFJY?=
 =?utf-8?B?U1B0TE03SzA5cENyc0RHTUZIRXdaWHBvQ0JZQ2NOcTJzN2hBbFZReCtFWitz?=
 =?utf-8?B?eEQxeDJNNFUyYlJibjNBNHB0UDVWZkhvMUNqWXNaazlwRzlQY2N1VVpQRnBx?=
 =?utf-8?B?S3RWYVp3R2ZSRVVIYTd1QUtNNWFQVlhTVXh2d2o3ZGsyV0ZVU1hDTEtvSTd1?=
 =?utf-8?B?U1lSeGdxdG1VdktscWF4a3U4aUJGa0M1MkFiRVpKc1REa2NoeUFsS2RtQnVK?=
 =?utf-8?B?cHhyZUk0ZFFiN01SNGgxeitBbUxEV24yU3FSZWlmUnFRb2R1WU5jRHU0emgv?=
 =?utf-8?B?QUFkaVRtYTNrNVJ5YVB0VnBMdTdaclFIUHc4NGJkVVYzNFdRcEw2Q3hXeUkx?=
 =?utf-8?B?OWhnY3FzUnAwZkhYK1M5L0VVS2dCOVNqUUJBdXRSRER4SnU3SXoyRVdtSEFD?=
 =?utf-8?B?TTZib1FtVktpSnlxMEI0UkxIcmhudk8raGwrbUNPd0gwclh5QzdMbWFlYlNj?=
 =?utf-8?B?bTlEM284RVdxY2V1NWkxaDBpekhxL2VIaEMxQTdTbHk0L0NkRUVVaFRKNmdD?=
 =?utf-8?Q?QRWcT9kSWPBEn1MZiqfsxM0NN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a5d769-c1f4-488c-686f-08dd3578f597
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 15:26:18.8792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rI0aDM2eqZJMrBtz0W6h5yFLMf7bIH8sDNz1XYEWX3nLB6DC7ziiom4G6HJqrRA9Oouj90RBv5Hbqp0fDXFpQiQ+1MeT3g42zLImoPScQp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6171
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0
aGFuLmNhdml0dEBpbnRlbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDE1LCAyMDI1
IDc6MTAgQU0NClRvOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPjsgSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWls
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENhdml0dCwgSm9uYXRo
YW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIIDEvMl0g
ZHJtL3hlL2Rpc3BsYXk6IE1vdmUgZHB0IGFsbG9jYXRpb24gdG8gaGVscGVyDQo+IA0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPiANCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5
IDE1LCAyMDI1IDI6MTkgQU0NCj4gVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0
dEBpbnRlbC5jb20+OyBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21h
aWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBkcm0veGUvZGlzcGxheTogTW92ZSBkcHQgYWxsb2NhdGlvbiB0byBoZWxwZXIN
Cj4gPiBEZW4gMjAyNS0wMS0xNCBrbC4gMjA6MjIsIHNrcmV2IENhdml0dCwgSm9uYXRoYW46DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSW50ZWwteGUgPGlu
dGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1Q
ZWtrYSBIZWlra2lsYQ0KPiA+ID4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNCwgMjAyNSAxMDow
NCBBTQ0KPiA+ID4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gQ2M6
IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+ID4g
PiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0veGUvZGlzcGxheTogTW92ZSBkcHQgYWxsb2NhdGlv
biB0byBoZWxwZXINCj4gPiA+Pg0KPiA+ID4+IFNpbXBsaWZ5IF9feGVfcGluX2ZiX3ZtYV9kcHQo
KSBieSBtb3ZpbmcgZHB0IGFsbG9jYXRpb24gaW50byBoZWxwZXIuDQo+ID4gPj4gVGhpcyBhbHNv
IGZpeGVzIGJ1ZyB3aGVyZSBkcHQgY291bGQgaGF2ZSBiZWVuIGFsbG9jYXRlZCBmcm9tIHN5c3Rl
bQ0KPiA+ID4+IG1lbW9yeSB3aGVuIG9uIGRnZnguDQo+ID4gPj4NCj4gPiA+PiBTaWduZWQtb2Zm
LWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0K
PiA+ID4+IC0tLQ0KPiA+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGlu
LmMgfCA2NyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+ID4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQzIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiA+ID4+DQo+ID4gPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPiA+PiBpbmRleCA5ZmE1MWI4NDcz
N2MuLmMyODg4NTMxNjk4NiAxMDA2NDQNCj4gPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
ZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNw
bGF5L3hlX2ZiX3Bpbi5jDQo+ID4gPj4gQEAgLTc3LDYgKzc3LDQ3IEBAIHdyaXRlX2RwdF9yZW1h
cHBlZChzdHJ1Y3QgeGVfYm8gKmJvLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAsIHUzMiAqZHB0X29m
cywNCj4gPiA+PiAgIAkqZHB0X29mcyA9IEFMSUdOKCpkcHRfb2ZzLCA0MDk2KTsNCj4gPiA+PiAg
IH0NCj4gPiA+PiAgIA0KPiA+ID4+ICtzdGF0aWMgc3RydWN0IHhlX2JvICp4ZV9hbGxvY19kcHRf
Ym8oc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gPj4gKwkJCQkgICAgIHN0cnVjdCB4ZV90aWxl
ICp0aWxlMCwgdTY0IHNpemUsDQo+ID4gPj4gKwkJCQkgICAgIHU2NCBwaHlzaWNhbF9hbGlnbm1l
bnQpDQo+ID4gPj4gK3sNCj4gPiA+PiArCXN0cnVjdCB4ZV9ibyAqZHB0Ow0KPiA+ID4+ICsNCj4g
PiA+PiArCS8qDQo+ID4gPj4gKwkgKiBJZiBER0ZYOiB0cnkgVlJBTTAgb25seQ0KPiA+ID4+ICsJ
ICovDQo+ID4gPj4gKwlpZiAoSVNfREdGWCh4ZSkpIHsNCj4gPiA+PiArCQlkcHQgPSB4ZV9ib19j
cmVhdGVfcGluX21hcF9hdF9hbGlnbmVkKHhlLCB0aWxlMCwgTlVMTCwNCj4gPiA+PiArCQkJCQkJ
ICAgICAgc2l6ZSwgfjB1bGwsDQo+ID4gPj4gKwkJCQkJCSAgICAgIHR0bV9ib190eXBlX2tlcm5l
bCwNCj4gPiA+PiArCQkJCQkJICAgICAgWEVfQk9fRkxBR19WUkFNMCB8DQo+ID4gPj4gKwkJCQkJ
CSAgICAgIFhFX0JPX0ZMQUdfR0dUVCB8DQo+ID4gPj4gKwkJCQkJCSAgICAgIFhFX0JPX0ZMQUdf
UEFHRVRBQkxFLA0KPiA+ID4+ICsJCQkJCQkgICAgICBwaHlzaWNhbF9hbGlnbm1lbnQpOw0KPiA+
ID4+ICsJfSBlbHNlIHsNCj4gPiA+PiArCQkvKg0KPiA+ID4+ICsJCSAqIEZvciBJR0ZYOiBmaXJz
dCB0cnkgU1RPTEVOLiBvbiBmYWlsIHRyeSBTWVNURU0uDQo+ID4gPj4gKwkJICovDQo+ID4gPj4g
KwkJZHB0ID0geGVfYm9fY3JlYXRlX3Bpbl9tYXBfYXRfYWxpZ25lZCh4ZSwgdGlsZTAsIE5VTEws
DQo+ID4gPj4gKwkJCQkJCSAgICAgIHNpemUsIH4wdWxsLA0KPiA+ID4+ICsJCQkJCQkgICAgICB0
dG1fYm9fdHlwZV9rZXJuZWwsDQo+ID4gPj4gKwkJCQkJCSAgICAgIFhFX0JPX0ZMQUdfU1RPTEVO
IHwNCj4gPiA+PiArCQkJCQkJICAgICAgWEVfQk9fRkxBR19HR1RUIHwNCj4gPiA+PiArCQkJCQkJ
ICAgICAgWEVfQk9fRkxBR19QQUdFVEFCTEUsDQo+ID4gPj4gKwkJCQkJCSAgICAgIHBoeXNpY2Fs
X2FsaWdubWVudCk7DQo+ID4gPj4gKwkJaWYgKElTX0VSUihkcHQpKSB7DQo+ID4gPj4gKwkJCWRw
dCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwX2F0X2FsaWduZWQoeGUsIHRpbGUwLCBOVUxMLA0KPiA+
ID4+ICsJCQkJCQkJICAgICAgc2l6ZSwgfjB1bGwsDQo+ID4gPj4gKwkJCQkJCQkgICAgICB0dG1f
Ym9fdHlwZV9rZXJuZWwsDQo+ID4gPj4gKwkJCQkJCQkgICAgICBYRV9CT19GTEFHX1NZU1RFTSB8
DQo+ID4gPj4gKwkJCQkJCQkgICAgICBYRV9CT19GTEFHX0dHVFQgfA0KPiA+ID4+ICsJCQkJCQkJ
ICAgICAgWEVfQk9fRkxBR19QQUdFVEFCTEUsDQo+ID4gPj4gKwkJCQkJCQkgICAgICBwaHlzaWNh
bF9hbGlnbm1lbnQpOw0KPiA+ID4+ICsJCX0NCj4gPiA+PiArCX0NCj4gPiA+PiArCXJldHVybiBk
cHQ7DQo+ID4gPiANCj4gPiA+IFdlIG1pZ2h0IGJlIGFibGUgdG8gY29sbGFwc2Ugc29tZSBvZiB0
aGlzIGxvZ2ljIGJ5IHN0b3JpbmcgdGhlIGZsYWdzIHNlcGFyYXRlbHk6DQo+ID4gPiANCj4gPiA+
ICIiIg0KPiA+ID4gc3RhdGljIHN0cnVjdCB4ZV9ibyAqeGVfYWxsb2NfZHB0X2JvKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLA0KPiA+ID4gCQkJCSAgICAgc3RydWN0IHhlX3RpbGUgKnRpbGUwLCB1NjQg
c2l6ZSwNCj4gPiA+IAkJCQkgICAgIHU2NCBwaHlzaWNhbF9hbGlnbm1lbnQpDQo+ID4gPiB7DQo+
ID4gPiAJc3RydWN0IHhlX2JvICpkcHQ7DQo+ID4gPiAJdTMyIGJhc2VfZmxhZ3MgPSBYRV9CT19G
TEFHX0dHVFQgfCBYRV9CT19GTEFHX1BBR0VUQUJMRTsNCj4gPiA+IAl1MzIgZmxhZ3MgPSBiYXNl
X2ZsYWdzOw0KPiA+ID4gDQo+ID4gPiAJLyoNCj4gPiA+IAkgKiBJZiBER0ZYOiB0cnkgVlJBTTAu
DQo+ID4gPiAJICogSWYgSUdGWDogdHJ5IFNUT0xFTi4NCj4gPiA+IAkgKi8NCj4gPiA+IAlmbGFn
cyB8PSBJU19ER0ZYKHhlKSA/IFhFX0JPX0ZMQUdfVlJBTTAgOiBYRV9CT19GTEFHX1NUT0xFTjsN
Cj4gPiA+IA0KPiA+ID4gCWRwdCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwX2F0X2FsaWduZWQoeGUs
IHRpbGUwLCBOVUxMLCBzaXplLA0KPiA+ID4gCQkJCQkgICAgICB+MHVsbCwgdHRtX2JvX3R5cGVf
a2VybmVsLA0KPiA+ID4gCQkJCQkgICAgICBmbGFncywgcGh5c2ljYWxfYWxpZ25tZW50KTsNCj4g
PiA+IA0KPiA+ID4gCS8qDQo+ID4gPiAJICogRm9yIElHRlgsIHdlIGZpcnN0IHRyeSBTVE9MRU4s
IGFuZCBvbiBhIGZhaWx1cmUgd2UgdHJ5IFNZU1RFTS4NCj4gPiA+IAkgKiBER0ZYIHNob3VsZCBv
bmx5IGF0dGVtcHQgVlJBTTANCj4gPiA+IAkgKi8NCj4gPiA+IAlpZiAoSVNfREdGWCh4ZSkgJiYg
SVNfRVJSKGRwdCkpDQo+ID4gPiAJCWRwdCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwX2F0X2FsaWdu
ZWQoeGUsIHRpbGUwLCBOVUxMLA0KPiA+ID4gCQkJCQkJICAgICAgc2l6ZSwgfjB1bGwsDQo+ID4g
PiAJCQkJCQkgICAgICB0dG1fYm9fdHlwZV9rZXJuZWwsDQo+ID4gPiAJCQkJCQkgICAgICBiYXNl
X2ZsYWdzIHwNCj4gPiA+IAkJCQkJCSAgICAgIFhFX0JPX0ZMQUdfU1lTVEVNLA0KPiA+ID4gCQkJ
CQkJICAgICAgcGh5c2ljYWxfYWxpZ25tZW50KTsNCj4gPiA+IAlyZXR1cm4gZHB0Ow0KPiA+ID4g
fQ0KPiA+ID4gIiIiDQo+ID4gPiBUaGlzIGlzbid0IGEgcGFydGljdWxhcmx5IG5lY2Vzc2FyeSBj
b21wcmVzc2lvbiwgYnV0IGl0IG1pZ2h0IGJlIHdvcnRoIGNvbnNpZGVyaW5nLg0KPiA+ID4gUmV2
aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT5FeGNl
cHQgdGhhdCBmYWlscyBvbiBib3RoIGludGVncmF0ZWQgYW5kIGRpc2NyZXRlLCBkdWUgdG8gSVNf
REdGWCgpIHVzZWQgDQo+ID4gd3JvbmdseSBoZXJlLiA7LSkNCj4gPiANCj4gPiBFdmVyeSBjaGFu
Z2UsIG5vIG1hdHRlciBob3cgc21hbGwsIGhhcyB0aGUgb3Bwb3J0dW5pdHkgdG8gYnJlYWsgdGhp
bmdzLg0KPiANCj4gSW50ZXJlc3RpbmcuICBGb3IgZnV0dXJlIHJlZmVyZW5jZSwgbWF5IEkgYXNr
IGhvdyBJU19ER0ZYIGlzIGJlaW5nIHVzZWQgaW5jb3JyZWN0bHkgaW4gdGhlIGFib3ZlIGV4YW1w
bGU/DQoNCkFoLCB3YWl0LiAgTmV2ZXIgbWluZCwgSSBzZWUgaXQuICBJIGZvcmdvdCB0byBuZWdh
dGUgSVNfREdGWCBpbiB0aGUgZXJyb3IgY2FzZS4gIEl0IHNob3VsZCBiZToNCiIiIg0KCWlmICgh
SVNfREdGWCh4ZSkgJiYgSVNfRVJSKGRwdCkpDQoiIiINCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiAt
Sm9uYXRoYW4gQ2F2aXR0DQo+IA0KPiA+IA0KPiA+IFJlZ2FyZGxlc3MsIGZvciBib3RoIHBhdGNo
ZXM6DQo+ID4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQo+ID4gDQo+ID4gQ2hlZXJzLA0KPiA+IH5NYWFydGVuDQo+ID4g
DQo+IA0K
