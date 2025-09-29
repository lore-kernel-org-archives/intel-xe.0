Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C8BCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 09:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909C10E121;
	Mon, 29 Sep 2025 09:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Km1pdNsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0AC10E121
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759137460; x=1790673460;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zZqozzJ0t6ekqKrQL+4zCsNy/ppwLw/nx3a17s3V3rU=;
 b=Km1pdNsNHUhdHKyhlhvKFL6kUNBo43ry0wOzPC3mLw1idv3I6c28Il33
 Ug6p7lkoRtHwPdv6KqEm8uF7ziMSY2lg5sec9yOQQ5+KjAmfpYgtFFnGB
 JUB13PYhNDoEKGclOtZ637CGKnCmWsYvMw0DlufxrwV0CgjGzRvBziKdD
 S7lHZGfisEIcyauzmgoLdZ6ZmbI+FUro8mst0vAcelvMaV5++kQISEwnJ
 vgyWpaCFhW5fuAgRwpPtShqDpQXmKiPB92p140U4c8DMXWOZ02aR/kToM
 Jr+YMqZotuZMKlSWexKJWMxjZApwmbYhbiVyRAFLPUJMP+LYWP7Z/ymxu g==;
X-CSE-ConnectionGUID: DRb0bb28T9Gjd428IElskw==
X-CSE-MsgGUID: NhGzwTbdQhmIvpOvqJ1Bow==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="65226457"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="65226457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 02:17:39 -0700
X-CSE-ConnectionGUID: EQ+md6eyTE2yM7LJ7nSxMg==
X-CSE-MsgGUID: T2I/dbL3RJmImBns9MMhjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="215335972"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 02:17:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 02:17:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 02:17:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 02:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybTHG5NYIL7Yxm5x0aTUShoN8m8ffPSSimQEAWybVxXznQ6qcPXwAc2jBeY2/rj5dxh4zW4wQQ971fPYVEVi2xjyUToPmgx2PPkWQ5o+XoBQ7aa92mWpDKyolm3eTPvDXFgvVARMLv9zAO4tIaARqIr4k6547LivXqqtyxCsbS4eVFlByPuEFOu8jzSVsurRvwq8UdhM7pIYY24plbKKdBx/QZvAQKQdVCpoJZ3WQ9M7sho8BG0rFvrKeDoeiod2gKnz8Gnp/uWxi44rdYcAGMS9uLzoj5qOEOJEQIWiScrLCp/sJ9crHnHjgVHjUAcE/aSg0/Gkj/LhURYrW5yp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9dAFhhi8mDtRiawqGRGJaR0yHI/ElW0fD+rhGIrse0=;
 b=VZig356fNs2w+zJ2m2Ob3ZCAvUKBJwNe/wuGi9pKKFFl2b9h0PYEEfb6Cc7mXReY8eMQM4Ef3bLGGl6Lvy/lFCzWAaH1M/8iJgmsUV1gqRdJtqsziuBDJfE9ZUUX/dUR42BEXz1uHXgR1iTXQPz0jgFay2X7bAVJGsvV3vv3tPpcYrQ/m/EpalAMGvWJpLOIshYc/ft4F30ZXnlLUw7FRfl7WVVmVZz78zsGE46ibeaIEkvPszrd/RUV7HYEs1dv5RB8RxUXbqRyXY6bsNlFWTtykzVFor1Rka0BngM0qdkeHRB6llGZ8VyV4qQPQ7RlIwP+F2pqppRFmNhJINRGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 09:17:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 09:17:30 +0000
Message-ID: <7133a2f0-82c2-4af0-b0c6-62765adb151d@intel.com>
Date: Mon, 29 Sep 2025 11:17:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/36] drm/xe/vf: Don't allow GT reset to be queued
 during VF post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-19-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-19-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: a4084abf-57fb-4257-cd69-08ddff39042e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW9IZGZobWtaUm8yTVM3eWVsOXYyOG9Lb0F2bmZYWXlIL2xhWllSVC83UkdZ?=
 =?utf-8?B?OXNSMzkyUzRuaTJBdnJqcEExK2RWcnFUb0NGU0NkVTZvY3EyUWtQYTNyZFJC?=
 =?utf-8?B?NHVWb1plOFB5NnJzZVZPVkk4TWE2NWxHTkpmNXRSVTNSYzNjWUJNUVliK0s2?=
 =?utf-8?B?MFZ2bU53d2Rnb2g0NWRpbWJydERYdWlPdUszbHd1L2doTE1NUkRWY2FJRTNK?=
 =?utf-8?B?RHExVjRVemlQdVRUdU1nSUttSXI5R1gwanNnelBtSVJBMERxL2poWmM2dXVG?=
 =?utf-8?B?QTF6SzVFM0lNOUZPbzJBUFZYUFhxZlNsZXpOVnl5Sk1zWDUyS3BqaHhvNnRJ?=
 =?utf-8?B?NWtZSFFraDFhdmJCK0R6akN6S0wwd0RkQ3NCVmFORXlpZzRHT0tpZkFlM2d6?=
 =?utf-8?B?eHdHNDc3Y0VaR2hSZVlaZmcxY3p1ODFMdDJMTDlocDEvcndRR1VVaGhBT0to?=
 =?utf-8?B?YU1PTC8rcjdMQzdjY0FZeHNQTGpNM0d3eHpUQkxPWWw4dVFtaDA4b3dPeWE0?=
 =?utf-8?B?eURZTjNPUldzRzlXVmNCa2NrSjZIUXJocXY4VjlmLzBaNlZXR2NmRVJ0cGNq?=
 =?utf-8?B?T1NORnFYN3pmdGI1WDAvcHRKa2YwYTRTNGhzQTRLRE1tY2VZWER2V3RjQTh4?=
 =?utf-8?B?ZG1yQlZoQVBYVnkzTytqbnNPcE90YUZFZTFyNS9TMXg3Z0pYUGdRZnFYeWZX?=
 =?utf-8?B?RTVtUTlkSGUvbXkrY3ZySCtGWVRJY2t5M0tyRmR6UnNsejZoVGlVSWhXQlV6?=
 =?utf-8?B?NTlaL3RSTHU5Y0JJWkQyeG9aMTI5RnNaY2pHSW5mdHdvVDViNTE5QVdsTG54?=
 =?utf-8?B?ZndvNldyYiszVTlpRmNmSkdsVG5TV1UwdkZuUnBxRVpUemVpaU0yNE5BQnVz?=
 =?utf-8?B?L0ZETDlTSUdQREpabXNEMVpYcFNwMThlOVZMZzlrN2cyUEF3blZQV3FkdGRa?=
 =?utf-8?B?SnRRVTNGTmpRQTVlNVJnS2FIODgvZ3dWTjRnRFBZQllXcXByL1dCbnV4V1ls?=
 =?utf-8?B?OHhWVmNRYm9yeVd2Tm9sNTAwM2daaDBob1lNR2U3YzdSUXJtZURXdCswWmhS?=
 =?utf-8?B?UEhGQ2FRSVR4REVHTWk5SzVleFYxbFBvSE9WY05QWSszRlM4M0V2bEVHQ0JN?=
 =?utf-8?B?M0QxZlExUW55b3JkY1IrTmFXOXA0VmRHWWZkSXFlZFdZVVpFTVZMU3Z2bWZJ?=
 =?utf-8?B?OUp1VFpGZVU3ZTY4L3BxMER1YXBlQmxuejFXNVAycUNKT2JVaEgzVUgxcHUw?=
 =?utf-8?B?RVBjWldlQjF4VzY0YlB1NDV6UWN4V1ZlVUQrQmJZL1MvNjU2cDhpWmlzMm55?=
 =?utf-8?B?MkxreFhHMW5RTDJYZkVEMENObG9vUUZROGNOaCtnVnh2S2prYU1DZWlJRVRh?=
 =?utf-8?B?cm5VTkJpTk9rQXpvazJoVTZMeCtVNlF1ZWpmSm0zN21tVnYxVGxqM09SZU40?=
 =?utf-8?B?R3hQZjhzVUhESzNmZ0ZHQnpDRWZpR1FueXN1YURxN01WdEJXeXNoZy9udGhi?=
 =?utf-8?B?YXVsVDRDZWdpNjNmYzF6WTRlM1N0bHFLTWpFMDNHR1RqYTVac2xocVJmcm4z?=
 =?utf-8?B?TkFhMmU4bThoL3M5YzJZd3NQRUtuVjRFS01TNGNNZUJnM1BONFg1SW11R29v?=
 =?utf-8?B?TE1QbTlySWZjZlV3K1B5WGdDRy9taFB3anJYeHZnMkxYQ253ZWY3bW1NSE1a?=
 =?utf-8?B?Wi9NNmZNYUZYWWY0YU1WR3haQVFoaENvV0RwSDM0OEZ1TWx2ZU5rbUpNYWsx?=
 =?utf-8?B?RkdKNlFWZjRtemM3aDNxUjRIcTZJNGs4TzMxbHRSMG40NjRCYWU1eStIa21U?=
 =?utf-8?B?MEp1bGlNWE5oVUg1VFZlVkx2S1BaUWR5QWhFMWYwaWovWk9FVXRmcHVaNmJQ?=
 =?utf-8?B?Vm9ka3VaMUc4MzBUV0kwcnFiUlBOMjBpakwzUWxySUo2WDZYUXo4SE84M09T?=
 =?utf-8?Q?8EB07t+g2J/245lVzaDTKfJSkX9NLWuc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVduSzFtdVNRUEwxRlRTckp3aWxEVFVBSFZsU3k2aEFldXh0ZXlHOFA1aFYv?=
 =?utf-8?B?SVBqdGVES0JoR1JaQTN6ek1kTXlNUG5LT04wN2dHOFdZWTNvK2RsdFdxc3Bx?=
 =?utf-8?B?OUNjcm1VRmdXQWF0S2tibk9mUHJoL3JuR3Q3NXZkMEZJVk5zelprdkNUNjFn?=
 =?utf-8?B?blMzaS9HZXVXWkM1UVhYekhmL2IwU2Y1dXFqK2F6RkhmZEhaRG1VV2NsazVy?=
 =?utf-8?B?UTBhVUJFcmRUQVhxTlQzcWNiUGM4ZTdNSHd0QzJ4M1VMWnRqNVhmM3ZhR1JV?=
 =?utf-8?B?WE5GaWI0N1lPRDVxVFR3VWtOdjZIeGpOYWpMZFdXWFlqVUlxWlVHcy81djdl?=
 =?utf-8?B?STh1ZFo2SnZYaVczeVdZTG0rUU82OVQyNTM2eGZUVXRVRWt2dmxIRmF6Mldi?=
 =?utf-8?B?QTQ3SUMvQUxXNVFhem8xL1NuK3kzOFFOSndld2VxV3pUYkxOUi9wZGdRZEJw?=
 =?utf-8?B?OGVzRmtEc0RTNzFnRWpkR0QyZEFZSnRHRWp3ZHRCV1lMZm52YmY5RDB4TmNu?=
 =?utf-8?B?RFdNWEhJMm8vZW5uRXp0ajFIZFhFYUpwSW92NTRuYkN4WXBlNjh3U3oyaG5q?=
 =?utf-8?B?T3hXSjhNUUdiTnc3S0kzMGRNQlgvYUZ1bGw1c242SS9vMXlaZFd3ejFMOVJP?=
 =?utf-8?B?a0hRd0RDSVpvakJmMFRsSE5MN0t5ZVhUSXZyTUlXcVc0VWlGempsVHBSSGFI?=
 =?utf-8?B?V1RncVIzaTBRYXZ0TGZHTFJ2bVBETjRYdTU2ZXI2REkzTm9MV1JmNUtVUkR3?=
 =?utf-8?B?QXpYa1M1QXZrdEEvUUFSOXdkOFJTVHlvaEZvcThUUllqWVV6czFBVkpyODVz?=
 =?utf-8?B?VWZiZmdUMDNmVEtYYUFJb1FrSjlQQUVtSFhmOFMyUmFZbjJwQVdWS1p0cUJy?=
 =?utf-8?B?R24yN0pCQThBQmgrdFFnWTBPdVovWGdDQnRKcFkyUW1ZT1Q0V2lRR3Zwb1ly?=
 =?utf-8?B?aE9JU2NuWW1EZGl4SXBUU3hiUU1JRHU0bFpOMndaRUYrbjdlUjBTbXFKTjhK?=
 =?utf-8?B?dFZkR2pxT0RpeU5QZ1ArUEhLYTRQVzdsbXhCU2RUbTF6VktpTG1yUUZiUGZw?=
 =?utf-8?B?V2dlZjJPYlZPV05WU1dGNlltdTZxeXhUSnFXNUR0QTl3RHRRZ0MxOGllK0dq?=
 =?utf-8?B?Tm9xbjlWc1E5eU55Um9WUmhubHN5dVlQOTEzUHQ4bXA4QS91TkFZc3FHemxK?=
 =?utf-8?B?TGNFR013NWkrZ2J1YjY4N0o0V3hXcFpTM1NwWHR3a1kwbnpQem1GZzU4UVFx?=
 =?utf-8?B?UEVXNHlZS25yZW8zL3lvalpiK0lBZjVWNk5pejdLd1FkUEoxd3RxRzJXVVFU?=
 =?utf-8?B?Tks3OVQ1Vi9jM24vc0NnOU5nQzFtRFVSUXJJSHhzcXhiaXZFanRSMnRwT21U?=
 =?utf-8?B?K0YrQ3ZuWmZWUWVCdjZyOW43dXBBL1J1ZUtxcEdxMTVHUWFiYnhia3NiZ2x0?=
 =?utf-8?B?ZHJlNldaSmZVdmt6NzZZdlFvaHU0dXROcFppQWtlUXltbzNRQ0IwRzE1TkVL?=
 =?utf-8?B?MGgwRWVEKzlyZ0tmeC9kN0ZReXFZc0pKWmZ6M3BwdTFZUXErWTRveFIvbWpG?=
 =?utf-8?B?K1kxYU02MDZobUlNeVBybU5EaStGTnlpZHZ3cVNrRWE5K1ArK0ZGQWluWHp6?=
 =?utf-8?B?KzVTbWdrMDRPL2FKWFNYa29OVE0vU3UwSEtaRWc2Rjd0QlF6amRGa3VyOUdN?=
 =?utf-8?B?aTMyUWtBNUhUdm1uVXpJTGVMeUE2SGU1MGc5d1B0UUIyWFZpSVFqZGgzVnEx?=
 =?utf-8?B?aGVkSXhmRjRCcEhkME1lVGpsZUpROGNuL3R1cStvYktITnlKWWplaGo4eWxM?=
 =?utf-8?B?dDNxRm9mZmtrNXVSc2tQVTZwbGNzU0Z0N1hNdVk0UFVtVTgzM1JaWmQ0MVFW?=
 =?utf-8?B?ZkxQMUEzWVJMei9lYWRCa1B0dUc1bndTWmM1TlBJcFJab2ZiVnpDYlIyeUpQ?=
 =?utf-8?B?WHdic0FDM2ZiTEI0aUJ6VGc2VXdOVGtCTjZsT3VHdlU5QzVPTW5Wa2FGTHRP?=
 =?utf-8?B?OGUxK1hwR2twckN4a2Q5Y21yZjM5TERCRDRQcmx1MzBXSkZxTkZHdzVEQ1M0?=
 =?utf-8?B?NTBNb25yNlRwcEFMWW1WUWd3TWNnckwrYjUxdzRKTlp2L3pva3Q3bGJLZUcz?=
 =?utf-8?B?ZHROaWs5N1pWUG1qMTM0SnM2V2FES1RTVkxvYkZLTnVQVDdyZWgvcWljRVBG?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4084abf-57fb-4257-cd69-08ddff39042e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:17:30.7025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mD+l/mhWBiSijs356ibmu5gsAWYVUK4w2L0ZoBDhqEjQlZjO5RW1cBW+p27drbJI40Ii+aNbOU4LK43koe06JuBl6wHSC6CNcDteAaawKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> With well-behaved software, a GT reset should never occur, nor should it
> happen during VF post-migration recovery. If it does, trigger a warning

hmm, I'm not sure that GT-resets depends only on the SW side, nor that
reasons for it couldn't happen just before VF was migrated

> but suppress the GT reset, as VF post-migration recovery is expected to
> bring the VF back to a working state.

can't we just say this last sentence, that "there is no need to run
explicit VF-reset sequence during recovery as VF-recovery is equivalent 
and it is also expected to bring VF back to working state?

also, since the patch is a refactor, it should mention that "instead of
blocking resets, just rely on the recovery" 
> 
> v3:
>  - Better commit message (Tomasz)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c          |  9 -------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
>  drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
>  drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
>  4 files changed, 4 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 82be38c99205..5f04d562604b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -815,11 +815,6 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -static int gt_wait_reset_unblock(struct xe_gt *gt)
> -{
> -	return xe_guc_wait_reset_unblock(&gt->uc.guc);
> -}
> -
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> @@ -834,10 +829,6 @@ static int gt_reset(struct xe_gt *gt)
>  
>  	xe_gt_info(gt, "reset started\n");
>  
> -	err = gt_wait_reset_unblock(gt);
> -	if (!err)
> -		xe_gt_warn(gt, "reset block failed to get lifted");
> -
>  	xe_pm_runtime_get(gt_to_xe(gt));
>  
>  	if (xe_fault_inject_gt_reset()) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index cc5af19c1911..b16e8fd271f8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1175,17 +1175,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  
>  static void vf_post_migration_shutdown(struct xe_gt *gt)
>  {
> -	int ret = 0;
> -
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
>  	gt->sriov.vf.migration.recovery_queued = false;
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
>  	xe_guc_submit_pause(&gt->uc.guc);
> -	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> -
> -	if (ret)
> -		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
>  }
>  
>  static size_t post_migration_scratch_size(struct xe_device *xe)
> @@ -1219,7 +1213,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	xe_guc_submit_reset_unblock(&gt->uc.guc);
>  	xe_guc_submit_unpause(&gt->uc.guc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cd5e506527fe..b82976f031e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,6 +27,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
> @@ -2182,47 +2183,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  	}
>  }
>  
> -/**
> - * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> - * @guc: the &xe_guc struct instance
> - */
> -int xe_guc_submit_reset_block(struct xe_guc *guc)
> -{
> -	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
> -}
> -
> -/**
> - * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> - * @guc: the &xe_guc struct instance
> - */
> -void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> -{
> -	atomic_set_release(&guc->submission_state.reset_blocked, 0);
> -	wake_up_all(&guc->ct.wq);
> -}
> -
> -static int guc_submit_reset_is_blocked(struct xe_guc *guc)
> -{
> -	return atomic_read_acquire(&guc->submission_state.reset_blocked);
> -}
> -
> -/* Maximum time of blocking reset */
> -#define RESET_BLOCK_PERIOD_MAX (HZ * 5)
> -
> -/**
> - * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
> - * @guc: the &xe_guc struct instance
> - */
> -int xe_guc_wait_reset_unblock(struct xe_guc *guc)
> -{
> -	return wait_event_timeout(guc->ct.wq,
> -				  !guc_submit_reset_is_blocked(guc), RESET_BLOCK_PERIOD_MAX);
> -}
> -
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))

we have a gt-oriented variant:

	xe_gt_WARN_ON

and likely we should not use the _ONCE variant as resets could happen few
times in the VF lifetime

and since we are sure that "recovery" has the same power as "reset"
does it really need to be full WARN ? maybe just "info or notice" ?

also if want to skip real GT resets, shouldn't we have this check
upper in the reset stack, at GT level, not just under gt.uc.guc.submit ?

> +		return 0;
> +
>  	if (!guc->submission_state.initialized)
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 5b4a0a6fd818..f535fe3895e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,9 +22,6 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
>  void xe_guc_submit_pause(struct xe_guc *guc);
>  void xe_guc_submit_unpause(struct xe_guc *guc);
> -int xe_guc_submit_reset_block(struct xe_guc *guc);
> -void xe_guc_submit_reset_unblock(struct xe_guc *guc);
> -int xe_guc_wait_reset_unblock(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
>  
>  int xe_guc_read_stopped(struct xe_guc *guc);

