Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D58CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 17:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5F910F7AF;
	Mon,  8 Jun 2026 17:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XidwqN9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A60710F7AF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780938811; x=1812474811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GFU7XdbB6q94ebQWeiWVIC3FLtuggJGWHn8HOo6ISHM=;
 b=XidwqN9HODk26x/ktZ0B4Wa19UaEgi3naHBRk6qAbw3dkha67GtyAhwg
 y2hXZL8dps5fNSVhIKgT16ItbZwyUOrmx2YlrAcxc1LOtGjhOsbfSoKHU
 END7RN/7puBENrP5ZtXZzl0n02Djvinr4lmEM3W0FpcCKovROKSfdEh71
 HCkMXrgRw5x0GqKSaKbLCZa9jLIg+wQuMPV95k3jafB58Lr3Q7RLYATQV
 60PBH89+Hs72fkZEiiqmMR1P+st26F3KUfij/18bN5uWc4V5OgpxuWMBO
 f2hqH+yup5ehT11fbsWG/3Dobrf1R3INLpWdzdgtWB2WKDqsBUwkg63lM Q==;
X-CSE-ConnectionGUID: BSb5oo8tQPi22WPhgg5hjg==
X-CSE-MsgGUID: DUZpxEqxQIinlJTJFOPDSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81590036"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81590036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:13:31 -0700
X-CSE-ConnectionGUID: FBB5uSVNS1mOcVztZUaZcw==
X-CSE-MsgGUID: 82Rw7nAoSQKpzkWfzv3O1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="239272394"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:13:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:13:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 10:13:30 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYgwdNVlhbCyzWV3xGKukLO6UywQH7+BMsrj2DFkQcKAiDIW3Jij8+23tbHi/97ZJgFLVxgZ5BhtEg/QSjyKXC7mnbelB7hd5bJmIsdu6c6Lymg/SwAmNX9b1ooYwrEFTdwppX4EbDlGfT+D0FjkM+GVuZoCG3vEk6RA9YzUDNquaXNDttMhwn9AfDWzeETI6RGI+aqHkC9dsWwqnttxixPngHvx9SP0gMVz/n9J94tvLgmeBiJi0iuQBv2x1wAhPSig5pISd296tbI4qHVdfnm0rscgwHx2K0YOdcvGo8E2depWErUBV+xppKsk6GtizudQawRRmer5YXU693VD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCvoQ7YxKN5P9/a5s3E9Z+X3TAeWqnVXNeFJod3ACiA=;
 b=pVnpL5hYBFyCXbJnyyRA9tAc0Q6r23MpwiBuR1RUEaUYTkr4p1RMJXJVEIAeYlzDd402Dx2Ua9GOTqNqAXbHp5uZbwUt7HjW2HMad94XsqwRLIXRsWjWzzztEw9bjLkuXegNlYG/AqWEvIWQ/n7UfJeXbi73LQzBuehy8sHSTGu/xjKOuGNHHM6BUl9xA9ohftYTJdOUERL52jyxPTe4J4heaXdBKLZtiwL7YrvGbvjV+2l3utxnq+VkU4KU5cdrUKihnLDWUeWsWDNVuUt+74gqorbv8dpOJ4ygd2x1lgEHdt3DZcq41FpM10yLTc7bDxk8LvdEtCPeGsYb4UdlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 17:13:15 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:13:14 +0000
Message-ID: <7853b2c3-b3e1-4e4f-9051-8d81c72287c2@intel.com>
Date: Mon, 8 Jun 2026 22:43:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC drm/xe/guc: distinguish wedged from recoverable
 cancellation
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <michal.wajdeczko@intel.com>, <stuart.summers@intel.com>
References: <20260504192801.2542945-2-sk.anirban@intel.com>
 <aib1h6RWQXViTG4i@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <aib1h6RWQXViTG4i@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afe6ed7-4181-42bb-81b2-08dec581397e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9VBuTUWvMwGyi7vtON7UQ8ZLUWlvdf2tMBt1MeugNSMgJfyR5NzCMdQ5W2uoX7vbBGNzabVaQknzEIo1+PYIcgHrO3vDNIYyMs07DQM5V0StZIzU25ptjA09tT5Y3R8vorCsJa2TF6uvgmJbxQm/8ZhICJEsBKjyCmq9zvn8fiYlhAmqzWU2G6rJ5KhPmF8+9uoj+rf/mGyUkqUF7hZ4J3T7OnNahEYg5dQhYvH+yRxq7+pCSnF3g9h3dux47+abdWmuRn1RD7/eSBlOLiFPseCTD5vn415YGC/mKCZ7hcIbQotJMNldV8ufHX8cXu7cz3cldSE9AfV2k5mEvSyIorP+MbN3J1XN1gC0TwYLFaff1ej5q0fzdWN2DkG0nowvy0pB7Dx1L9Z9yK5Cc8fTRBvsD/ctMkZOjpOmRDez6RXF5/tO/oj4OjT5mtrr4A33DC5KR7dz+GqANzJy1tsLQGc4m5Ya2CGgDbxZql09i38mYuTPwobRVqdCRvUmvCmvZA429HhdwRIZngzJV0GuLMDyQ42w1XXPHAPM6nccOSDwSg5GNsWRlX+w9ANj/H9AVunNJupFuhnyFFVLp1FARWIO4SrxFNfCqQfD2VwJ8lUh5bJApG6+hz3+Fg1s0IuBcAiA64DM/c9vzxkKgCFjEtaXzS47zJnw3GrY70fTB738Ekj7BxScRULqzJ+rOtrY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXpRMEh1ZTJQZU56Tm84V1NWcmphNUQ0dVE0cmpMcGJtcUJFYmZsQ2tXeUU3?=
 =?utf-8?B?YzRRRUZWMDU4YnV2VkNsVUtIZ0dpdGppcDhpQzcyelFmZHhuUUt3VnlkOFk5?=
 =?utf-8?B?RG82WEhKU3BMVFNERnE4eTEvc1c3WERSRWFzZXZyZUoxRENKSUZicHhVNDBT?=
 =?utf-8?B?VDZ0OVB3ZEZvajJNZGVtdklyQ0JGVXNDditDYUs5SFowTU92bU5Gbi92c2lz?=
 =?utf-8?B?MkIvaEZWTEdKMENMSzRSL05nNmZDa0JGT1REQkt2Y1d1Q2ZaUlB6ci83TFc5?=
 =?utf-8?B?QWx1c0ZGQXBVZ2hlcGN0Qit1Y1NzMkhqNy9vb1BoL2c5THdoSElselE5Y1cr?=
 =?utf-8?B?NTBmbW5VekhUVEFOOTl1NUt3QWpXVWZXRTJsTzhXcWxldXN2ZGpYTGpuM1ho?=
 =?utf-8?B?d0tWWnY2THNZN010NUVNd25oeGt1MHM2bWNtcmNwMXJMVVJoUFk1d2M1MnZ5?=
 =?utf-8?B?emZJUCtkekRQNThMc2JrYUp6bWVjSWM5a3VuM2lJTFo5N21MUG1mYWpsQkFE?=
 =?utf-8?B?dUtqM3JNN0UyYTlSTlZCZkNlVXpmbkhaVjh5UEsrQW01L1BLbkNFZDA2Mm1r?=
 =?utf-8?B?dE00ZkI1MUpuS3FEcWRHVVlSQjBlS1RCMUdHWWpVdU9rWVJkVFhJMEpzN2R1?=
 =?utf-8?B?M0NpQ1VQR1pHVDVlSW1hdkNRSU5LaW1UVDJlaTh4YjE1RG9SQ0tyMnBsTU1Q?=
 =?utf-8?B?b0xXSml6WUYrbC9EQ09WTjRQM21obkxnTyt4bE5XdE51cGdBWmxtZVVaaWYr?=
 =?utf-8?B?R2VEK3BEelJFV1N5VGM4Vm9uQ1JxYURMSm5WV2V6UjhrQ2JMZ05mby95eEdP?=
 =?utf-8?B?RGpROGU5dWZzOEVyOU0rVnN6M0dvUHVCb2lTWGs5V1plbEFtYjRyem51UjRi?=
 =?utf-8?B?MmZ1NHc2cVpsRWRFL3VJaXBJUjJaTk5nb1FKbVdFU1h5WUoxUlMyYVVEM21D?=
 =?utf-8?B?U2NhV2pnVWIwK01qRzNjRWFVcFkwNFdBQi95ZEtPS2xUL3hZNE5xQTFFOHJt?=
 =?utf-8?B?NjlqdXRmS0VteEttR3M2WGVuTTJOeGxsTlk3SUdSV0lBTllmQWsvSEd6a0F6?=
 =?utf-8?B?YUJDbHgveUVkMHhOUzJvb3lxWFdPQzEzL1UycG0vY2N3VUE3WGM2azBTcU9a?=
 =?utf-8?B?SDNuUWJna1VaQk1uU3VaT2k0WElPV3ArNUZnV2MvN20yejhVeTVNbGdtQloz?=
 =?utf-8?B?YXB3VUlmU0lsQldZN3VOdXlpM2pJMkZpMExIUm8rM1dDM1RrRm9uaWs0S3ho?=
 =?utf-8?B?RzNlbjRWQUNxOG5xWUhYYWVpVUw1QUlUeG5zUjBkLzRvVXZDRUExTEZOY1Q2?=
 =?utf-8?B?RWtPN3VhNG9GZFhUd3B0NjV4NnljcFZtTE8rVS9ING9oYmtNaWprMnh5ZTBF?=
 =?utf-8?B?Tk1hSzZ3dVg2SDZjUG5MbmV4b2RxU0xmcFlkbnppWmtwMWRZWlJpdFlNVmw4?=
 =?utf-8?B?UTRiQUMrODVyNkVSMzdIVG1KZWpqVTc3SXRBRFh3T0VhSTJ6ZUhRLysvcCtC?=
 =?utf-8?B?NXdHUUl0MzYrVjZySkF4ZUdPaDhFeVlNZVRjNGt4TG8zY0E4WGpacDByQ3hQ?=
 =?utf-8?B?bThGZkJRSzdxc3hrRlJDWitnMUxxd3JwWDJ1NTM1QnhWdTdVSldwK3hRdk9F?=
 =?utf-8?B?b2d0NnpXa2t6ZjJtcytmUFdJTFpPRUdkb1ViUHlNUmZkaEFzWWlnVlJvZGti?=
 =?utf-8?B?elorNGVmaDBOOHkxUWFHWGNLUWp4SjlxSXpYOWFWNWFZYWVDVFN3QzBIQ0Na?=
 =?utf-8?B?SFVPS0I5TEp2aUhpbjV6aXVNMk4xd3NvVnFFeTZ4NUJ5ZVlOcjV0YWVlTWY0?=
 =?utf-8?B?aW9sc2lIb2U2NVA3T1FObXhFamovRHdYNXBCRG9DM3g5THhwZDNEaEdySXJQ?=
 =?utf-8?B?c0JiQ3c0T00vMjlhbHdyclIzUVFnaFpaTW5oQ21BMW91T3dLRVhyOWhzYTNn?=
 =?utf-8?B?TWd4Ry9mbjVybnhnTVNpRlB5UDBaaGt1SE0yOUF6aStJT2wyRlRVL2NSTlVF?=
 =?utf-8?B?VkJUdzVmU1VyMHNrTDFySjl5WFNNSWR4MDA1OUkwb1dBUmJ5dmFjNUNCTCtZ?=
 =?utf-8?B?SDFSYWpuMXZEWEMrUjc3WnkwK2IzUG9UV1pacWN0dERFeXJiUUREamk1M1Z5?=
 =?utf-8?B?ZEZOdEVXQXdjZTBqcitqQy9wdXRXR0JOOGxjV2FrMnUzN1BRaEpVZzFGak5I?=
 =?utf-8?B?bjA3TjdRRHdLd0EvcURIOG9mczVMdFZJTURzdlJCSjU1aEVjU2tjWjNwQi9n?=
 =?utf-8?B?WkFRd00zVE9SMzJjUHRjSTlwd1pRTW4xbG1wWFlyMElMT2lES2t6REJFWXNv?=
 =?utf-8?B?eDg0NGxuWmpJaVA1UUFEcmlZdFBqY0l3R0tVb2hzZHZyUUMrTzFHQT09?=
X-Exchange-RoutingPolicyChecked: X9H05SogbXGjf5hvlggJn+gLVF5nSd8Jfij8qh5jtTB32tyilp/BsHGr36IgQtfCTJ/y+pLhXqPW8bQCPXMcLoVeogdTnvtBIUC4KnmbU9g7NcRwaA6gd3ViJuKzAt6tISK/Z0j5uysD/galkb8gGn7A9kOyz0G9gd89XyP5PAEbw6mGckwZzWE2kPSmrPZVQinQ7ez+ZRojxUgBR1w2IGK7KGa1ObC7n2HdbA09wKeCplNYS3BPuqZjUWulN4cyOg64c/4vJWdLR2hd+NsTXS6aTxQb6UDWy8lAw4LWGiKuioGom41UKrOeKCIiYR1fgSLkfsbaaPRr2HIluq0uNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afe6ed7-4181-42bb-81b2-08dec581397e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:13:14.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65Jha3WyDXmweTNds0ZGBTF3aN1vorZZj7cP3UiyVtL+BEjY3/woMwGt7GlLzBfOUYm3NsfLLAi1wZV+SekSRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
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

Hi

On 08-06-2026 10:31 pm, Matthew Brost wrote:
> On Tue, May 05, 2026 at 12:58:02AM +0530, Sk Anirban wrote:
>> The CT layer returns -ECANCELED regardless of whether cancellation
>> is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
>> on wedge so callers don't need xe_device_wedged() checks
>> to suppress spurious error logs.
> I don't see any checks at the caller for -ENOTRECOVERABLE to suppress
> the error. Is this just a hypothetical use case, or will it be handled
> in a follow-up?
Yes, my intention is to address this from the IGT side using the error 
code and `igt_emit_ignore_dmesg_regex`.
>
> In general, I have no objection to this patch, but we have a large
> number of error codes returned by guc_ct_send that mean different
> things, and none of it is documented. Since we are adding another error
> code here, it would be good to include some kernel documentation in the
> codebase describing all possible error codes that guc_ct_send can
> return, what they mean, and the expected actions.
>
> This is something Copilot is fairly good at—creating a baseline patch
> that we can then edit and review. We could also review all call sites of
> guc_ct_send and ensure each one is handling errors correctly.
>
> Matt
sure, I will check this.

Thanks,

Anirban

>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c              | 10 +++++++++-
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |  2 +-
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index a11cff7a20be..b7d38fa80675 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1057,6 +1057,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   	xe_gt_assert(gt, g2h_len || !num_g2h);
>>   	lockdep_assert_held(&ct->lock);
>>   
>> +	if (xe_device_wedged(ct_to_xe(ct))) {
>> +		ret = -ENOTRECOVERABLE;
>> +		goto out;
>> +	}
>> +
>>   	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>   		ret = -EPIPE;
>>   		goto out;
>> @@ -1371,7 +1376,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	if (g2h_fence.fail) {
>>   		if (g2h_fence.cancel) {
>>   			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
>> -			ret = -ECANCELED;
>> +			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>>   			goto unlock;
>>   		}
>>   		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
>> @@ -1690,6 +1695,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>   	lockdep_assert_held(&ct->fast_lock);
>>   
>> +	if (xe_device_wedged(xe))
>> +		return -ENOTRECOVERABLE;
>> +
>>   	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>>   		return -ENODEV;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> index 2b99c1ebdd58..f43ca1c76f75 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -473,7 +473,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>   
>>   	ret = enable_engine_activity_stats(guc);
>>   	if (ret)
>> -		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats: %pe\n", ERR_PTR(ret));
>>   	else
>>   		engine_activity_set_cpu_ts(guc, 0);
>>   }
>> -- 
>> 2.43.0
>>
