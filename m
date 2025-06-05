Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034FC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 14:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D694310E056;
	Thu,  5 Jun 2025 14:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daDYLi/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D44510E056
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749133373; x=1780669373;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=+c9WEFV8ja0o+0vSvhTXRvUk5ZRrclIw5TiscpgI5gs=;
 b=daDYLi/4ZyPlonwhcbPxGeInjq81uhYmiyK68IhiH7Y6jlqN9WIMvhL7
 Y5chKAONRuAJevF176azJjCgL7QN0u+n29Ot3eWdp43TmMFVR/d041Me4
 q9SXadw2reRztWwsbm3wOJW9PRQgtJJfsg+C5HFMPet/Kk/rC5DS5j0MH
 WjYzZkaMk5XrTjJYCzkt0XCacSyQxKsIEcfjVuItqvAisLYi5yFr9DY+W
 M/GobpviRGmmxGLA6rfsp0ohQm9wRNE6w2Ua1Khzs90JBC5sI3VmkcEpl
 euB//9TjhXSscpRrUkGJyG9XN+CjBup+keaY+xKA6LGEJG66V8rtqK725 Q==;
X-CSE-ConnectionGUID: QcJ+mLpLQhOG/SeNKeN3uw==
X-CSE-MsgGUID: Tir54zU9QeiniXl7r24Rwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51168182"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51168182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 07:22:44 -0700
X-CSE-ConnectionGUID: fcTiWmcpQY29MVfE9NIHhw==
X-CSE-MsgGUID: JZ9ICon2QoKhl7y/PajmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145423270"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 07:22:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 07:22:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 07:22:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.48)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 07:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grA5nYq73+EQZyGP3Z+jt9u/u3g3VBg8CgiR4vIz/cmQFyZ6SMSpOr5jyo1NbTIykhGX5iYyc61e6MLhKQVgFvdOZ71hvPoFEmVU4fjKAjulhpCWBZYRR5mLjclOD4Gr21olMYSq6y9BfL+P6jPQUVeGQmaATn1Nduq2pDOlEapSErpPsJFztpYi1EMfZqZQengLvoDx0HNyQfPlpXDGpkP3OH9ZuUGALFXNPYiLv3BI9Cx0DuJC+roIW3V++iw4sTGtSfcKhX7kXOogScvT4jRj4WvZoDggSgXZ8mRLM3Z2166OFmA7ETBmb1Hx1WNZKStfE7I7R7n0U5JtSG/zGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN9DVyVAam+iq7jI1pDBsuq2uoqacH0d+BdpWWYPtr0=;
 b=QGH5+lfnORo8UsUju1gsWH8miugswepB16eXShpChmx7k16tODekpGBHaKtV1QdHBJOX4EK2Hh4spkSJoIcCRinXDZ1AThois1VieBT+TeWPp0/14ExClsw4tXzIRP9sfvuRaCAr3ElT5KDY+Un3Gsh16ghIdQEAG5zcIva+pwDQ3UNXGEx6/rcmkVNOdB6mAL3NVi2pQceNzYRjP+MvUGjPLfhZ1MC4m606bgpnVXHCBes46nIZ7XdqpRskFskMwj39gBvOuvolQgEF15GJXhWaX5Cnb3qkf3V8/iyLj5FA/sx/mKwBtUAExNBZ14dwp++xXUvJMhlr/CV25AjpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 14:22:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8769.033; Thu, 5 Jun 2025
 14:22:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250603182430.1016734-2-dnyaneshwar.bhadane@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-2-dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH 1/6] drm/i915/xe3lpd: Add support for display version 30.02
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Jun 2025 11:22:32 -0300
Message-ID: <174913335239.1605.17387763898181442433@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW3PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:303:2a::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 10348fc1-1393-4f9d-2d13-08dda43c6c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anNQdmdEMTRQa2FzR3JuemJWRkpRdTBwMDViVE5rWXhHcjVOWUJzd3NyK2xP?=
 =?utf-8?B?MlZzUDhYaTlkRGFGVll6YmtXbGFHZmM0RkxxKzQvL2tYbFYrelVhOUhRdHlo?=
 =?utf-8?B?NUJPUWw3ZFlwVGdUazU3ZFJ0Q25saVRsc0dsMDhaQ1YvUEQvSnE0VEtBWnRv?=
 =?utf-8?B?MVppOTNTdnZBeEUycDVWM0pZNlVaVE9vUHhPdWNpWDBUNW02S3VKR1dnWDgx?=
 =?utf-8?B?RGtsL2diZyszM2VrNmtPZFQ1UStFeHdZKzA4enFRQ0dEQVZYbXJZTzVWdjlD?=
 =?utf-8?B?cDR2OU52Zm16cGg1cEwzMW9BNmMzV1hscnMwVTZPZDRZaEFUUVZhUm5CL3U3?=
 =?utf-8?B?YTZac3FKQjM3MFpoYVhCU0ExWmlKYmVVZWhGZFJLcGNNYVhFdytieUNjZ1lr?=
 =?utf-8?B?ZHZKRmVuM1AwVVZmNG1xSnZZODJKTk1nb3VzVkM5OSsvS2JqNlYxZ2t3a3VC?=
 =?utf-8?B?a0VkQ0M4QnpZOC9xZUdYQU1tYUxTV1NWVlJoSTFNWjRMRCtwaHFkVWxyR0pL?=
 =?utf-8?B?alEycWdlY21WS2JmK25sZDFoQ3VpTzdhS1pTdmdZQVRvVDdFbjhZekZTTGFR?=
 =?utf-8?B?bW96Ukluek8xa2F4QzUyeHkrTVVtcjNJSE1HcTV0QkNHRVYyWDY0NVhCbSsy?=
 =?utf-8?B?S1BTellmd0h4SUsvdzJsU2NITlovaVJrQS8vaGlYRDEyMC9vbkgzWE0xcEpI?=
 =?utf-8?B?Nk5iMzMrdSttalNpbGIxTmdMOTBDU3FCWWtINlV3enl5UWJncTBCdThaWGZ5?=
 =?utf-8?B?aTRRdFVJbXZ5YVdHa1FZQ2x2aFFrV0dQWXA5ZGxNOVZ1SmZmQkFHay9aay9K?=
 =?utf-8?B?bEVtOVNRRk14ZXZ6UmU2ckt5V0RtNWE0emNpdXlESFdzamlxTVJIMGNod2M0?=
 =?utf-8?B?SytxYXp5MXRJaTlhcWlOdnhCV1pQdkk1ajdWUytsdTE0UUtWbjFuMjViNSts?=
 =?utf-8?B?Mm5RSzFWTWhPczBHZWY3YTNVbVlUUFdzSmVxVStJZXhGbkRodExKT3Q3UG96?=
 =?utf-8?B?eTNqdzB3eVAvYnFtaytteVdQeDBVaTZ6NTZMd25uTnNoVytzZTc5SjJhYjlj?=
 =?utf-8?B?cGUzQ3lOOFh2TXRSSFVlQVVoaWVlbHEyVG5oT3J3bmI0cVlPUlI5TGNwYVhy?=
 =?utf-8?B?L3RFUS9uTEJXTlFDcDBWdjlSaFNHVkxid2o1WFVXTGwycDI4dkRxdmxJNGtq?=
 =?utf-8?B?T3RxeWREbmhpSkpSL3g1NG5tKzNSajNNa0pHRzU1c2NhUWtVSElYcXU2QkNh?=
 =?utf-8?B?bDgxTEdwSFo0NVNHbHAwS1RucjlhVW1YcDdWS0N6Sm9NZ21BVFdzTE1QYTZW?=
 =?utf-8?B?N2FaTjVaa2Z5a2RZaVNaMGF4NHBvNURvOHNnY2Y4c015S0FsV291aEFxcEVX?=
 =?utf-8?B?U3Fya2VaSXdLOVhicVhnQjhyTDRrUnV6cGJNWHNWNDFpOGJ2Ym9rNlhWOUQ0?=
 =?utf-8?B?TkcxNkJJUEY2K3B4UHFMa09Fc2dkMEpHdktueUFvb3dhVmt1b0k5ckwrZ3JF?=
 =?utf-8?B?bE1nOVlCWHBnQkd5WVY4VjVIaW5PUHhYRlZ2VmExNUIyQW1FZHVnMzl6OXU0?=
 =?utf-8?B?ZC8yU2UwR21vWWVSSFh4ME9PVityNk51OEpKZk1ZbTVKUHJMaFBaZFAxUHZn?=
 =?utf-8?B?Y1lJcjQ0N2pzTjV4bVFMbWdqYWJDNEJhRlpraEdyQTBPS1hnOE91TWV3YWM4?=
 =?utf-8?B?aThidVNHZDVqanJNNUNRYWFQZUdScXd1TkE3UXRHVnBhbElkV0puZ21Sb01W?=
 =?utf-8?B?UVpsWldybGtBT01sQlpHVkJDNTBVUkUwQlUxL09EekdTa05YV1p2a1VYcGUx?=
 =?utf-8?B?U2ZVenA3S1FkN0FJdDh1NC9Wb05oeGs2OTFxSkhoOXJnekwxYUMrZm5Wei9n?=
 =?utf-8?B?Z0E5aWJUUEFKNnRLZHFnaUZjakkzRWJKWmR1S3ArVnNLWmNULzMvWXYwYmRX?=
 =?utf-8?Q?gbS92oR9BYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm1aYWZBMXlmY2tuUlhsVkJRS2FjTVVmMVF4UzhaZVdYZE9GVjdaQlpEMlY3?=
 =?utf-8?B?c3FGMXd5S01rRUVmbXlSblZjWC9XUkRrd1YvcUEvcXI4dW5vek11aWwxbHZT?=
 =?utf-8?B?SjQ2cmlwVkZYalA2eUp4dGxaSGFGTm1PTjVldmZPeFZpUVMwUjhUUXZERzdE?=
 =?utf-8?B?VmdCVGhkUjArVElLODNMQW8xKyt3a2pBUnBxN0p5RWo2a1dKY2dEYmZQbWVG?=
 =?utf-8?B?OUFCSFFPZDNNckJTYmxUdzBYK3daY3JoM083aDllOGUySmlQcnFmaUVLa1VJ?=
 =?utf-8?B?YmRZMDBaQ0UxVkVVKzlmajJYNERVZjZzdG5BN08zRnZyaFNybUlDaXg1enRJ?=
 =?utf-8?B?R0x6SUNXd2RXUXg1ZHZKNlNaZ2IwczRzUFpHV0Y2K01HWkluVW9PUDVqRVl6?=
 =?utf-8?B?c01UcVlNc3YrcW5iS282MXZlaFltaHIvak9sS2hhRmw5UTZXY3RQOE1DRExF?=
 =?utf-8?B?MW5GV1daUFRvQUYxaWhBSmpzQ1BFVGxHSzZIR3ZDTkVlN0RrOEtTbmZGREw3?=
 =?utf-8?B?UWlqQ05YeWw4NXVRdWhScER6L0I3OUNzaXFRci9HMEkwSHBUbFZ5ZFJ4cWkw?=
 =?utf-8?B?RlFBd1pHUndIanpzM253ZXlQMGF2M3NhUnY2c2hiV1FKNlU0bnpuaS9ua0NW?=
 =?utf-8?B?dmU0M2xvWE9PZ2tzMWVoQTNua25Hd0p5eFdrK0hkYlZsSWFqUlM0ZFhQbERu?=
 =?utf-8?B?ckxnTkR3Y3NTc1BGSVRkNlBPR0t1eWNGVFVJRm56U2E5L3FQUmR2bGlUK3Vr?=
 =?utf-8?B?Q1FsMmN6U3BTN3NIYUxCMVZ6T1o4RnBHUjMxejc5T2xhSytBNjBVK0RYYnk1?=
 =?utf-8?B?T2hBektrelBLS0lIZllMOGFKOWhOdUcrSWdZazRaY0VvOHhuaXNUY3gyN01D?=
 =?utf-8?B?bWtkMjBiUko3Q1VwUnVjbkRsNGdxTEozNTBtenU4RDVwWUlGcHBWajRDQTFK?=
 =?utf-8?B?bFh5NGd5aTdGUDlVV3kxUWdiSmIyS0YwM3RXVDFiYlJ2Wk9CQmhaRnBBYmth?=
 =?utf-8?B?T2MvcFhMd1I5R0dtN01SM0FpeW0vMXJDK2g5YWpFQlV6QXAybXpoa2h4SXYx?=
 =?utf-8?B?SUpVRTQ4dUhEbkFsYUVNckc3cFQzRXRNdSttUzUxTEZVNC9xYUxvdnJSUUZu?=
 =?utf-8?B?OStFd1JTcFZqQmVjOC9Oa0NXR2NVbi9YSTFDQVJDSE5icllqU3pONmlzblVo?=
 =?utf-8?B?K0hZa0NuekFpR1hNUklWRUZ0RE1ma1lGNGtzNTBOQTBSZktBRkNZVG1lMTJL?=
 =?utf-8?B?NDBmSmo1bi9MWWJkQnhKR0pkL0s3azVGSWw3Q05sMU1ScnF6OGovSXhOTXcw?=
 =?utf-8?B?WVEvK2hFSEpwNGIzSUlQQklwbThuL05wZ1piMTdXa0FyaDdITllPMGMwUnNR?=
 =?utf-8?B?ODJHTkY1aCtvcjAwMmVtTFpUbHJTdkVOdGxCOUVIdVIzbXhJNDhidTVqTHIx?=
 =?utf-8?B?Z3BrNmpaVkVHc1d0QUVzYlcxR1MzM3dnM3RDd01yRHVSVHZUTlBsRVNiQVhW?=
 =?utf-8?B?TjYwWEZNWFo0L1BiUUxKVFBJRjRMSUFJRGlzZVJyOGordlAyS0pzQ29icExt?=
 =?utf-8?B?ZUR5YkdGd2QrU3RSQnJQditqd1lUTVpjQXJjZnAvVFFRZEwxNTVPN2FHc1oy?=
 =?utf-8?B?NTY3NUw3UFRLSWtTQVFDcitmUjBKSlBHU2plelgxSGRHd1BFSDBBcmtqMzY4?=
 =?utf-8?B?T0d6UXFLVjV5c2JycnRmSjdBZ1pJdi9BWVdUVkF0TC9iODRUQS9KQnA1anpl?=
 =?utf-8?B?N3F4UlNtalFrRjN4SjRsVjl2dXNLNGZ6bnVZcWlCUjB1b3FkRlltdW45c241?=
 =?utf-8?B?THlMZXJSS1hoUm5PVndIZUNWY2s2WDFNZ2E1QW55MkYrdGpRY2YwTnVDa2dn?=
 =?utf-8?B?bTBHYlFieUxlYzlSZ08vTm1uZGxwK1RXVFFZYlJYWXRLYk9qemU3Rk16cVZ4?=
 =?utf-8?B?MUs3YjAvbjdERW1mZGZ4VGNYZzRpMW1KUzRqVFlLVWo1NUp4bVJ5bi9KcHdJ?=
 =?utf-8?B?NUVxazBTZi8ySEhGM0xXMGdEd1h4cng1L3VkNHZTMGJ1djBndm96M2hzalJp?=
 =?utf-8?B?UjdJUjNuM1ZwY1Q4M1lFOWNKVDBKcDhvaWdQNE9kc1N6aHhUak56UkR2dzZt?=
 =?utf-8?B?bnROZjhlTzZ3THh2bStrTGxyNWdiZ3BTRUxQeGVtaDFkM1E2eldPRlUybm5P?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10348fc1-1393-4f9d-2d13-08dda43c6c84
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:22:38.4468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3eqBQwCmjj+Wp+BsEghqKR++7f94yvbsuklda12d0uRobjhDwdE/PfFbaXORwboqVal+fLR2f+a3fqjeoy8tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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

Quoting Dnyaneshwar Bhadane (2025-06-03 15:24:25-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Display version 30.02 should be treated the same as other Xe3 IP, but
>will have a slightly different set of workarounds.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers=
/gpu/drm/i915/display/intel_display_device.c
>index 90d714598664..e0db4781bdf0 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_device.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
>@@ -1479,6 +1479,7 @@ static const struct {
>         { 14,  1, &xe2_hpd_display },
>         { 20,  0, &xe2_lpd_display },
>         { 30,  0, &xe2_lpd_display },
>+        { 30,  2, &xe2_lpd_display },
> };
>=20
> static const struct intel_display_device_info *
>--=20
>2.34.1
>
