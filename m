Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7D8C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 00:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874F10E5A5;
	Tue, 29 Jul 2025 00:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTD4K3I+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD1210E5A4
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 00:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753747884; x=1785283884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F9OIIHDO7YeG5u9+uJeHxFIVOeBhvuvn4y++TyR9gdo=;
 b=JTD4K3I+eHw1s88uI+qzJ2fXgjDiBbvG86aC3oUGroO3L/yT6tc0qf2o
 YREFsypc9TYkayWSoM5Nn7C1pj+hImU2nauSMSNT/MHkPHSOBjgvN1Dvo
 d8IZBAGKQS/YiXtBKzFFtoRuqHOmSMHLLokBYIH+buTCx4Iv5T3Ksy/Sz
 5OG8rQ0W/bjhxY7nbOM0iPexzKdQpFxZv2jC6adpawGjJZ8hiL/JBYMaP
 SJeNjM8XW5ChLMorhv9ugLxpIVaDhq3SMN3Rhd5KHG7Z3qCVnrpYzZ8Cd
 VMC2MaVh+akYmMPUsxiEfJRu/uNL6z/uYIJPCZLkVSVFYZUWvBso46Rrs w==;
X-CSE-ConnectionGUID: wHQJoGOLSNyRZ2qHdfJbtA==
X-CSE-MsgGUID: wIueGIUKR+GSPNo5/p/3JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59655174"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59655174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 17:11:24 -0700
X-CSE-ConnectionGUID: 3yxwQp0+QkiCfWPeLsYOSw==
X-CSE-MsgGUID: KNVA2SQiTJOhjIpmqQ1R3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="166723703"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 17:11:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 17:11:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 17:11:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 17:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLOLqXFEN1FQ5nxW0DsEB1CGCW7fP49DpmLED7nQQ/gLhqZJ+jT4PiwrR5jT+FGqVsdnypXuZ7x8eQiIx8BG+dFA7lsYcezewpaXgBdmopYUMjgYH0eiRm/faVMuR8h+jzwIQtY9w99AdADTNHLoHmTkfT0yGGXBs7VTWT83YBuCXtdYt7iMgsJBGxASqV3Zc+TSE7ncOM9+MkRKXKc9WTVQhKyQAjZShNlRjxmXV/wza9jlCi2Vf+MK60rje8FPQS4ayKo5CRDA4MfdW/QCbZkWc4CO0HYQ+ma9F/bCrvm4MYHrfHBdi7r/D3IwKfJxWatDloQZVFbSoa4kRtYyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcsERCbkG8MNi3C6LC6B/BUklN7Wk/KXX75it5GUu8w=;
 b=FqjObojRKSy+JXcnPsBqYvNK4yAnX7qLhREt4GxdM+OQtWpfRttCb1y5WWG3dpVxN4m9hjN2hSA3k/PbCzl6A2z/4CZQ9PiJdq6oue+fGoNZ9T4JH8u7pFVQR/p6Ef1dPq490qM0wTTy+b5Cj37fgJN3bmLN797+YtQl8MG78AtmoARIMwQ7GZSoF/hZ/RTQWqwYbp9tdsYRIp1i8ncElvR07FKAcm87vsbkpGpIc+HgSrYVRYD4MY0WyxzggRG9EvC1ixBenbxXVOvoyO4XmcyUugZmgEhm1zwQ3R+t7qAX0iIDBBlTfFRkO0JC30kzWdWMqqi8BLT2GVKWaH3fOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 00:11:14 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 00:11:13 +0000
Message-ID: <6f8a790b-c2d0-4c7a-8768-5a1ed6d29fbf@intel.com>
Date: Mon, 28 Jul 2025 17:11:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] drm/xe/configfs: Check if device was
 preconfigured
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-10-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250727172009.587-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0034.namprd21.prod.outlook.com
 (2603:10b6:302:1::47) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bd3146-9a96-4f0e-da93-08ddce346e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2hMeWVUZzlnWTJFMVZibkZ4WEhnYWJSNEZZajRUVWFLb0dYaWRHbnBocVFV?=
 =?utf-8?B?czVlcWp3bEFnTzNnSmtzcmxjV2RBMjZTUjU1WStxUzNPalZzTnJEY1BIeDQv?=
 =?utf-8?B?dDZJd2hDek95OVZrdHEzcnpnQWhEK0x2WFZXVXF6YXE1ZjhScjlhUStlM0Yy?=
 =?utf-8?B?c01CWE44OWQ2OGJUSXRWTDN4bElCRGFGalpIbmJxYktTNktWL0tvQXB5b0ov?=
 =?utf-8?B?SksxS1pZWnR0VTRCdnl3bjBpcTd3eVltc1dsTS8zaEIvYTNFS1JVSkVRc2RU?=
 =?utf-8?B?TU83MkRjWlo3TE8rRGdaWGhiUlNHN2c5ZXNHUldQSFFQQklaK2dFNWZNM3ZO?=
 =?utf-8?B?L2RNRUVSMVJqVGF3NDBjc3M0Y1R4QUdRamtGMVY1R0svMjRzQ2R0ZG1Jc1Vn?=
 =?utf-8?B?T2c0aXBHVUtpNjN6NFc3TmZ0K2lNTitzYUFwVlBpMWQ3dzhWVldSSTV5MGRI?=
 =?utf-8?B?ZDZlVGtQN1V4OEVkb1VKcDE0NUlOK1M3STBtd1FpaEZnYlJIRUg1NUxRUzBs?=
 =?utf-8?B?WVY1ZVU4TlVWMDd1alpGUkJwQjdJTWo5RnVyYXljYS9VeC85cDFnZGhHUTlz?=
 =?utf-8?B?SUV6WFFCRE84QzUzbktiWElxa1cwQkFRUEdJN0RMWDcwTXFta2d3OXJyZHJx?=
 =?utf-8?B?VnNSYm1Rd2Y2ZmNxTm81QU93VlNBeFhqTWQ0a0F5dzQ5dlMwdlEzQnNYWFhi?=
 =?utf-8?B?Tk9sSW1hQUZ5YlB1MklWTTR5SHNJbVJWL0tBY2hJZGhJclkza1BuY2ozNmRq?=
 =?utf-8?B?bWNVcFN4TERhTjBxeERUb1RQWnk0MkpKZzh4bktjMTRKUDZITU9aNnlaQUpm?=
 =?utf-8?B?MWw4S0dHeGV0MW9wdDhqcXNRS0l4d2dqNUN5aG8yT2NLQU9lM3FvdkpwUVpp?=
 =?utf-8?B?SmZDRzRYNEdNNHVRNU5KK0IvWmdUK2Vwb2ZTYXBsem1KZlp3S2FvQjI3MExC?=
 =?utf-8?B?RWJoakxLc3h3NlEzcExFT21jQVVmSjlRRkxRY3F4bndFb3VkaFFoUnVDaHBn?=
 =?utf-8?B?bHR2U21pRkIydE1LRG5vbnIyTG1UM1JabHgyT2JrTE1vSW03QlhrVy93dWs4?=
 =?utf-8?B?UmN0amJuUFhKd3d2a0pvT2VrZVBRMXBRR1pyMFdIZVY0eW9mYlR4MnZPMkpQ?=
 =?utf-8?B?dFgvTUlMZVNBVFZtSFFkaTFCSXVPNTI0S3BPNmI3M2xvTDEwRjhSbFFJYzlH?=
 =?utf-8?B?MU9qcHl1TkY3WTlEcnhGVFBFdzlpVUIzNkMySU9DYTRBVGs4SzcwM0FKc0xO?=
 =?utf-8?B?eGRuRTIyckR0RUM5cFlNWEF6SFhybXRsNkQ1MUx2NE5oaW1mV2hweHViT2x0?=
 =?utf-8?B?SDJYNDhIUHFJbjVNbGkxeTBiWFFLTjFBNU9tU01HQTllYjRHbElEaUlFM0xX?=
 =?utf-8?B?VHROdGMvNU5udnJ5dmNJUVpNYXcvUW5tdU9DM01iL09hTDBLT1BFc2lJYk0r?=
 =?utf-8?B?ZlFWMzNHTWV4Tjg1RlMwWUFpUE42OGU1UmZhU0g3cWJpR0c1SStkU050aEY5?=
 =?utf-8?B?cnJpVlRnSlBXeFp3ekZiejZnaW90MisvN0ROVnJKVTRQTTcxeW1pb1NRTEZK?=
 =?utf-8?B?VisyVVBRSWpmZktiN1N2dS80c2lrMis4eE04MmdKRmVVR2d3bUppNndNTUJM?=
 =?utf-8?B?SHFzcDIzRkltQzdQS1dTWXJUaXp1ZVlMVWFGeklLQkRuNVpLaVd3UkZpeGRV?=
 =?utf-8?B?OVl0cUJQbXRDdGRNanloWTlIa3F1V1RaR0lLWExnOW1yVDlVcytRVUJQbTBX?=
 =?utf-8?B?Nzd5SUUzS2Z0OTBvbjM1RUZHa2JLUDhLSnB5dEwvcFY0ckptOWl6SEJPUTJa?=
 =?utf-8?B?am5UeWp3WXorYUNSTUJJRGk0YklJKy9YbDlRd2tXbVJXR1c1eHU0WG5NUlla?=
 =?utf-8?B?eUZiWFpVS2VsYk8wN1ovOFFhWDlwKzZrTGpNQ0Jic0RtZmVOQzJFWlpaZ3Yv?=
 =?utf-8?Q?ibFh1ykU+H8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnNGd0Q4cnB1V0RJUlR1TDd5R2Jsc0pieEtaRWhGK2tKbkNrb1dsc1QvUXA1?=
 =?utf-8?B?WEFqMzV0L1IvOVVXM1NLQ3UydTU4bzBTR2JYL1ZoMXRxSnNrcnRvNldoZ0dl?=
 =?utf-8?B?V2dMbWI5T1BKK01Ua2Q0bDliSWtrUWlETkVyb3dBMUVYa1Nhd0tIQ0xwZXlM?=
 =?utf-8?B?WmdRdE9JSzQ2bzBsdkJETUVQVExTUDRyZTVabTRyYkhTY0pOck1YQjJNVjNa?=
 =?utf-8?B?WER2cU1XL0U5MlNJbURzN1VHbllQb2NmbWttTUFsMnVhQ1dmWjJBK1o5UklK?=
 =?utf-8?B?NTUrS3dvaU9CSWY0UXpwN0FpWWsyWklYU0RZb0doUzR5OXJGWkswQTFQRlIr?=
 =?utf-8?B?bEM0NFI4MlIwV1FNSmkwb0NyamJ1ZXZGejJNbTROMGQ5cjFRWnpvQlBXL1d0?=
 =?utf-8?B?dENNZE9UMzN2cU13cFJIVmlPcU41TGFwLzArMktFc3NRY29DaWIrOEEzQVVW?=
 =?utf-8?B?V3ZvYlhxbHZhcElKU2s4bXJwdkpFeEt1M1BWSjV1Sk4vSURZUG1GTHY3Q2pu?=
 =?utf-8?B?elJBcTh0YytjRW5xQmNNQUJEZTRZNGd6TXFxRGxCaWl3N3dYWDF0aElKTUMr?=
 =?utf-8?B?NVFZa2lhZm9EQnpkbmFMWGNTQzQ4Mmt5b3NxMG1tME9WMVk0bTQ3ZzJBR2do?=
 =?utf-8?B?RUZVM0RWc01GcHBGR2I4amRsbDdXeTRiN2FoN0VHN0IwUU0yMng0d0tTcnI2?=
 =?utf-8?B?QlRXYU9CVnBkNlJHWUFjZmljcWpvTjByL2k0Z1krOWlabi95UFcrM0U0dnhL?=
 =?utf-8?B?UE9ITlo3c0kxM2U5a3ZndUFhK3BDaWRLNnhxNE00d0JhK2NsMld4SWpDL3VE?=
 =?utf-8?B?NklZTDNpUE1jQzgwZkFnSTV2L0g3MmZFSTNUc0JiTktINThqRDJGZGlwakFN?=
 =?utf-8?B?VEQ5VzZKcElVMkg4NlcrSyt4ZUpvbmYzQ1lhejgxUFZEaDd4dDdiMEg2QUVh?=
 =?utf-8?B?QkZrUTVaQjdZZnVDU0FlNkpTZ2hDVWYrOTdYN0NEQlpFd2VhS2VnU0tKK0RX?=
 =?utf-8?B?VWFNUGxTM0F4UDVYL1l0NkpZRzZRb0tNUUhzZ1lLdW53RmdhcnFLTDNYNUdU?=
 =?utf-8?B?dVljZm5TTml3ZEJBelRMZGtIOENYeFRwRXFIbXF4VWlKL09SazJyalNWUzR4?=
 =?utf-8?B?VlJTS2w1TkJmREtBc1lCMVpIeksvY3FCcm05NS9pMkFodjRxWWl3ODhHRit2?=
 =?utf-8?B?UE5EdHJRRXNLbk40alZubis4a3Z3ZWd1d0EyVVRCSlVGSEsvQkh0akFvSVl6?=
 =?utf-8?B?alVCV21penBNeHVVbHEwUXRYYldFZlQydDU0YkVSeTBISHd6NlpRRlhhZkxs?=
 =?utf-8?B?WFhIemFuc1JVeGpuL1h4RElJbmNHd2c5SHpuVEIzNUFoNzZSZDBlMGZWUW9K?=
 =?utf-8?B?M1NORW54OWVyNm1LMVVuR3IvbUFuejVDMWtkalJhMkN4eTdKaTQrYm1iSE1B?=
 =?utf-8?B?ZTRsUHpCVkdrRXpTOU1RVnBXaWFic2JiS1QrSjY1OEpwYXNGczdWRi8zUFEx?=
 =?utf-8?B?WjVWZlpKY0VFRzhUc3dGSTdaYVYwNUVqYlZCczRjVEVSYjFPSklITndTNWFW?=
 =?utf-8?B?ZkJQcUZSZ0pKcUp1U3lITE15RDdTeGtMdlJ1K1dpMXN2bW9oTVpzN3ZvL0R2?=
 =?utf-8?B?QXJNd2daWXpJZE15ZEF5bFp2OWRaalorV1piMXJQSUMyVWg2Ynk5YVNNK1Rv?=
 =?utf-8?B?RkZ6SExWVTlpcGpLZzF2M29RVG1lMHBUUnRNZXJmYUhoQVBvMnZyNWxzWlpE?=
 =?utf-8?B?Vy9HdkwzZE5nRXdYcWpCNE03MHRrMkNyV2RYQ3E0S3QvbUt2dUZqMnU2NytT?=
 =?utf-8?B?ODBzblZDNEZUY3JjMmsyb05iMGdxVWd4OWh6VXBsR1ZhdTN3a1o1SHFwd1JS?=
 =?utf-8?B?VWYyT3VOcHlJYk1taUtnUE9EbndDR2sxTkZlVnNQRUJCbTE0SW1FSWxwc3JS?=
 =?utf-8?B?QzNSSnhDZFNISWFZOTc0NTJiREIrZnJsNm5TMFkwaUd1TCtBc0xtS2RDTUJY?=
 =?utf-8?B?NlAwaTVYNzVrTmZPTmRhT3NINEhrSEloaHpyV2xwd2lRd3hUWUlueWhlM0JC?=
 =?utf-8?B?dVJpUU1WVlZmQVJkZUg5T2ZmNGEzZlZ6ZDVYZ3RjL0VYaGxQUkE1THBTbEtu?=
 =?utf-8?B?bnl3cjVhMTEzT3dHL0pJYTFtYWNKT2Y0V3ZDckloNzNybzBYQlQvYzlUK1hi?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bd3146-9a96-4f0e-da93-08ddce346e1d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 00:11:13.8746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAs/3MhMR/VypLCDTmpr9A+PdKlkj32bsiE7yMPMAfKuhyvmK4uaueaPamgwhE8GSB+TYOrVpqcZTx9BGC14fqed2phVSlDaClbxD4iPwtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
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

On 7/27/2025 10:20 AM, Michal Wajdeczko wrote:
> Since device configuration using configfs could be prepared long
> time prior the driver load, add a debug log whether the current
> device driver probe is using custom or default settings.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
> v2: make function void, rename helpers (Lucas) and rebased
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_configfs.h |  2 ++
>   drivers/gpu/drm/xe/xe_pci.c      |  3 +++
>   3 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 60d89d3ef656..73fb6812efe0 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -108,6 +108,11 @@ static void set_device_defaults(struct xe_config_device *config)
>   	*config = device_defaults;
>   }
>   
> +static bool config_device_is_default(const struct xe_config_device *config)
> +{
> +	return !memcmp(config, &device_defaults, sizeof(*config));
> +}
> +
>   struct engine_info {
>   	const char *cls;
>   	u64 mask;
> @@ -333,6 +338,26 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
>   	return to_xe_config_group_device(item);
>   }
>   
> +/**
> + * xe_configfs_check_device() - Test if device was configured by configfs
> + * @pdev: the &pci_dev device to test
> + *
> + * Try to find the configfs group that belongs to the specified pci device
> + * and print a diagnostic message if found.
> + */
> +void xe_configfs_check_device(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +
> +	if (!dev)
> +		return;
> +
> +	pci_dbg(pdev, "found %s settings in configfs\n",
> +		config_device_is_default(&dev->config) ? "default" : "custom");
> +
> +	config_group_put(&dev->group);
> +}
> +
>   /**
>    * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fb8764008089..fa4ea7f0c375 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -13,12 +13,14 @@ struct pci_dev;
>   #if IS_ENABLED(CONFIG_CONFIGFS_FS)
>   int xe_configfs_init(void);
>   void xe_configfs_exit(void);
> +void xe_configfs_check_device(struct pci_dev *pdev);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>   #else
>   static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
> +static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>   static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>   static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 52d46c66ae1e..9ce6e6dca5bc 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -17,6 +17,7 @@
>   
>   #include "display/xe_display.h"
>   #include "regs/xe_gt_regs.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_drv.h"
>   #include "xe_gt.h"
> @@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	struct xe_device *xe;
>   	int err;
>   
> +	xe_configfs_check_device(pdev);
> +
>   	if (desc->require_force_probe && !id_forced(pdev->device)) {
>   		dev_info(&pdev->dev,
>   			 "Your graphics device %04x is not officially supported\n"

