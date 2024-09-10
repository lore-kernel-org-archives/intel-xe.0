Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBCBEDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5B10E14B;
	Tue, 10 Sep 2024 16:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mm9tdeof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1524510E14B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725985542; x=1757521542;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ghKFbVAQ5x5WdFnctXxMxpWEAJQ1c9zdGQpFa2giyMA=;
 b=Mm9tdeofWQ/KlAkxqch5v1MGyCezDAuYJgVHPXEeOE02GsfzZfgtdXak
 7VQzjeyauq4r+y3uc0Dt6W/LpJ2Rb97ZeDbnFfjf6Q8wA1G3JhmZs60Bf
 yuj8qA1eJ6OxXJpggP1jQbwTpPtK/KiFxAz/y7UvF3gzfMz+mOOODFuP5
 MYXLAiOuyeEBS678rt/JvBtvhf4RSfRSPKxHG64mwvIFGd8M5srylPt7U
 7Pw/4uiju/5n1qXDErfe44NbZMI7wwCprjFQVzjUuwI9DmU8GYW/5D8Hz
 dHH2Eqg54mV6JGtuSNchv6zyaTe0VDaEj4uJ1BHqjs6TPMA0VXzjQCIoc w==;
X-CSE-ConnectionGUID: SlVNRWoeQWiaNZ5UcAas+Q==
X-CSE-MsgGUID: JEid6UEzSEGgqbzYeEcOiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35315676"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35315676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:25:41 -0700
X-CSE-ConnectionGUID: gN7pwCHFQm6p9Tx8vrFJLw==
X-CSE-MsgGUID: 49zHMo3PSyO9HjKdIWtoug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71469397"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:25:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:25:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:25:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QU+ULLLXcdBUcrP6+V0wWt3EWSfAV5IgycKriIHOt5MnhIoQXIRvJalXIh5DzO4rv0qfWmYEPbQCzFFqcMSRPSZghQf/mzxqroqmLc32Q9jXfNqmKOxoxxn/VwGfnnxC5xYOIw+WY4odQoV950bDH69mJMkmvZboGEoCTXFahsWb9uKWpTW4RRBPDqi+OuVn31+yq81OnkJaEB9oSuYTWPN9oe+u2CNunyfcoAiOxE2BrsLAo6vqb6pNNdWQf6O5cIvWpIkLbylv89Irt7UN2CLx6jfEwGwpOEUOF9e6U6ZZ1b2MilQkeVEvGhYcoS5BXds2JtwErTQUDLJo0c6JHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGeYAzgdHhHV1JYr6wLLn80mFd+jqqGy067gG9KR2N4=;
 b=heAgpp4TctTfpKYy0isH8CktRkldMOwPY3V4Mt4z70a6M/ynfOTfep+6jghDc5tNl2rGFlV39IHYkSv+VSEggAPF1YqeSvRkyog8SosbtQWzZfiBAmabgKJdROznj45e8JgFvLvxPgds7WCjvK1YSmpYjK/6Acvow7WHZelBNcHzqXvfZtEqFMFMEJyINC3y8doMDSu7Dzoba4n5VapbtqNbOFBO5SdDpEZJwU0yKWfIbB9vIaGTqXCGCgENsQnSA39PMDYTFyD34YxUkk45tL/BFcOB1bB/xgi2S4yABmPsmLAEPbeSsndunxxj0sVwjGbXfqCWO311sEgdd0WjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 16:25:32 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%7]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 16:25:32 +0000
Message-ID: <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
Date: Tue, 10 Sep 2024 21:55:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
To: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.nikula@linux.intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com> <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: ee822dd2-d4c4-4bbf-a571-08dcd1b530bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjcvVklGTFJzd1QrYjFqT3dwb1ZaQUlMQnZOanltSkNzNGZ0b3drR2c2YjVp?=
 =?utf-8?B?M00vTlhoZVNMcWl2UytBRVY1SzVZQ3MwTWN2eFVoQXdYLzFITDA3ZDRwd29x?=
 =?utf-8?B?UzNSM3M3RmdmdHpFcW9YUndiWE5IcEMyUnBtWjd1RWRqT0h0bVBwbG9WZFZ3?=
 =?utf-8?B?L0M0VUc3TkZZRzk3eEpmaDRaanc4SXVmdGRxYmpwaEU4aW9IbXVjVHFWd0to?=
 =?utf-8?B?K0tjMFRwNCs1RTVBYWthWE13QkdQamp2ZE0rSG9tSkY2OU1EZUYybTNZbHh1?=
 =?utf-8?B?VDVUVHRhK1NoR2xFZWY3djdWR29pN0VKZ2pNL3ptRmx5TVAzSyt5Y2VoSjlU?=
 =?utf-8?B?QUxMc28vdkZ1SjBhNGMvWmJSRmMzMWc0TXh3Zi9xTUVFMENLWjgrKzBBa1RV?=
 =?utf-8?B?UVgwMUF6LzY5Mk5NNlB1WEwxSXFoRTR5UXROMEZCaW5IclFtQzNDN3J4MDd6?=
 =?utf-8?B?VDRtcWNpd1d6Q3V2OG83WG1XYWpqUnVvNXVrN2d6aVNTS2lHRU1TTXk2VUdH?=
 =?utf-8?B?V09JYVN6bmFZdlY1WlZLeHRpenJsYk9Vc2R2bnIwNkdyUFBzWUh1RVM1RUVE?=
 =?utf-8?B?c0FtZDN6cGNxWUlkcnFSSXZSYWxIaTNGME9kVHhXSW5BRlZjdU9kbVNqRTRV?=
 =?utf-8?B?TFdXMzJldk9XcDBJam05d1RNRk05TVpHVDRSRWF4aWF6V0pkaU95UEh4TVBT?=
 =?utf-8?B?aUdGSHJZRDlLOEFnS0VJc1V0TFVzbjQvUWVwL2lvWHNaUXVTT0UvUTlkWGg2?=
 =?utf-8?B?WDVNY1k5OVBsblRCdkZDQnRuUTR5ZHNiWFlkT1paUWlHWlJhVkM3VGRxK2Z4?=
 =?utf-8?B?Y0d5bm9vaWl4OHd3eXpkUUE2TUFraGJTNlVUejJ0b3BmTnA0YU5KVkpVbU05?=
 =?utf-8?B?Wm1PNjFhbHdDdDVLU3ZtNVNadm1WTFFKTUxJRGpLZnM2YUZDVmlDbGJwUVpX?=
 =?utf-8?B?a3gxS3RTUWJ6ajlCdXVtN3hNQ2JKNDVTNjhDZkprd0hqbENnS01IeXZlenFC?=
 =?utf-8?B?emVNZEtQc3lTSUJHWjlxSy9BeElwc3psejFaUk5VUTVPc2VqaitENmQvWjYy?=
 =?utf-8?B?c083ZVF5RVFEUEZqSE10aHRCUFJuN2pNWWxqUnIrckNPY1ptOS9PVCtQTkVR?=
 =?utf-8?B?S0VWeFE4SWhkT0o5bVliMWtUem4zNEJtRWVxMUU5MXFoSEd4ME1pM0htNENX?=
 =?utf-8?B?Y21pd0dIMzhxV0JPRFcrbThxV3QvRUxGTWFlcms3V0swYXVtTVhySktlQUoz?=
 =?utf-8?B?cmxuTlFTdTZ3QWwxdUhuaHo3QVAyaWJqOE9EN1BkWnIzS1pRMjU4Vno0b0dB?=
 =?utf-8?B?MHkxVjYrV0VpSjVGWTNUOVczNkRuZ2VUNHUvbWhvZGxxWS9ScG9JellPQnp6?=
 =?utf-8?B?VDczOTc2bmJmQUtwRjVrZGxwdVVEa094MXJ4K2VpM0c3bW5raUZ6MVh5QWdm?=
 =?utf-8?B?SCs3YnBES0JsTitRUmdoeXV4SGRKQ0JCZlJVV1NaenppczlXem9qMmh5SG9I?=
 =?utf-8?B?TjdmTnUrQWNMV3NmYVFnMmhpNk51UkM3QWJpL1RieVpWTHdpV0FsSWJSNEFK?=
 =?utf-8?B?WTM1VnhoblFSekNZVXhNTVZFTVNEQW44eHVpeGNnS2lIV20yREFZZVNzSGtU?=
 =?utf-8?B?OXdYUi9FUDZLR3RtSHhnQytkNE9GUzJUQ2ZFWE5kU0hybFlYdm50K0Z1aXEz?=
 =?utf-8?B?bVkrc1ozcUJHbGZmZVA4REptNHdRSnM2YkNQYkZXVDBhcmgySzlvb2RzVGdN?=
 =?utf-8?Q?rpQf3rj4I+I4yT0qXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNXYmo4L3ZmeUZJWlN3VW0wazBjeW5Bb2s1TWEzRVF6L1dxSFJ6cVhxcGFp?=
 =?utf-8?B?bTJwdjZTRWppWmpWejZJaGYxa2R0K2JyN1I5bzNXTklRSjFKR0pVS055VjRr?=
 =?utf-8?B?czB5b0twMjlQVklaTEM1eVM0UHZCRVN4NUR5WmYwTEFKNVRWSzZLZkNXRHhu?=
 =?utf-8?B?REI5YTRTeHgrNmJVYWljRG54d3gzdHovRkVVck1mUFlLL1Ayb3E5dk5JOU00?=
 =?utf-8?B?NnFNRm5CWkVCbWNISFRsdksxS2xxVDhhUjdKSkpTZWxCdGF4ZlQ5VVlyNkhI?=
 =?utf-8?B?eE1pdUtFUjdGR2ltZXpxSG45cVJZQjh1QUFMMlJ4TlEvSlVkQmhBV3BzdTdY?=
 =?utf-8?B?ZU0yRTRIVXhrMG9XUkxBWXVIRExQTzZHUHEvYnJpNGdySUJIV2pMdFBWZ1Rw?=
 =?utf-8?B?UEc2K1NobjZJVE54V3djMTg2WkVXdmQwRUQ5UllQVUdPTUQydEIwaW1uL0xC?=
 =?utf-8?B?WDFVR2ZBT3BhUkZDdjluYXIzengrZVMvZzdnNjQ3amRVYjYyVUZ4Q1pORmFo?=
 =?utf-8?B?cStJc0hzMGxnZDR0THIybmovU3ZYVGN2U3htdy9FS1hwRXh6c05NTHhUaW9I?=
 =?utf-8?B?U1NuL0NCWjRlWWJqQ3BXc3JvTTJucjFlYnpIVGN2bnJyVzEvbDArOExVZkY3?=
 =?utf-8?B?elE0c2h2K0JWdFBqV0ZENUZTdzhLWmR6SWdRVkZubUs0ckdJbWtydFNLaE5P?=
 =?utf-8?B?UlgzcVJZSyt3QkNjL2FtaXQ5RHVwdmxBYzl1L2YxWVV2VG5JWlNsei8yWGtm?=
 =?utf-8?B?ZXJqWURqcjJHZHVkLzM5QkVtWkVEUXpPaVFZZ3ZxM3U4MmdMR29yak9WM1la?=
 =?utf-8?B?SS9iQnRrVmxKS0k3c21QYWxXNmNIcjgwVEU0eWkzQ3plcFo3aWZYMFN3aWhZ?=
 =?utf-8?B?dWdSTXM0ekFaeDBKWnlNbUlZUHBLTjhjVm5TM3JTV294TXp6ZUhudFI2OXAz?=
 =?utf-8?B?b2FsTjBSRE5FWTZsWEpPenpzM0tJdXVKN1RjQVFYUjRZZG1nbW1uaHQyWkFp?=
 =?utf-8?B?ZmZra05GdmhjRnU5UFR0WWFhd0xsYjVodEhwclRwVUFLR0dTd1Nra1ZFSlgz?=
 =?utf-8?B?U1dWWEdIMU0ySXUvNXplb25GTmVHUUdWQjBSMHNWL0RVZFJCTnJiRWZIVXZL?=
 =?utf-8?B?dEF0YWhJbUR0Mi9jc2xpMVlKSm50VjdLSyszTHpxMi9lSTQ0UGY1STI5aXE3?=
 =?utf-8?B?b0pkSk1qM1MrOE9KaTVhbEsvV1RCcmhPNnlpMmQvT3IyQXNzOTlrdjBNRWNU?=
 =?utf-8?B?cmJEQnVyR1N4TFJnNmRxTVkyQ3huZTg3ZENTTStTZzJLelJDTjluRzFtZTZm?=
 =?utf-8?B?ZjN2OTd1dUlWYjVyTVBHRk9adXNRbTdhMmE4V29nUmhDVkxwclpqMWZKSERT?=
 =?utf-8?B?M0puM2s3bXhmVWJYZXgvSkJCZ3hVQkFockI0TDBVNzRXOThPbVpPWHFFYXpl?=
 =?utf-8?B?RVk3K1hCSjJaTlQvWm9YMEVlTVpjRCtPb2FhdWZzaVVXTWtHd0hnQnd0aENt?=
 =?utf-8?B?UXZYakpBWDlEOXB5bmdQSDYzVFRUa1FrSWtwWGZNWUVyM2Z3NGFaNlZqa1pW?=
 =?utf-8?B?Zk1Sb25Ldy9GNWs5OXRhdjRHb1FJNDYwS2pCNGxqUXMvY2FqSlFkZCtuRHhX?=
 =?utf-8?B?L1psU2dEMDBKenNBTUdIWDN4NlhIeWd3WVZqZ0ZlZHlZdUxQelZXbTNNR1o5?=
 =?utf-8?B?Z3k2clN5YWZJSGZQWCtIa2hwZVZzdDloWGNEVDBpM1pzUWFSbXFDeC9yMXNs?=
 =?utf-8?B?VDJQdUs1bDFwRDZyQXBuWFMyVkhpN3hCdGNPdmlMTHhKK1JNaXhPclUwakk5?=
 =?utf-8?B?SzJEYTZFUENCZVBtekNKdU1KRzZtK1BJVkVWa0FKdjRibXpLdVp3Sjh6ZFpr?=
 =?utf-8?B?Z0hlWVFxOEprY0ZwVEhjYXlJbitnOVBaTnF4bWJjQ0NXRlBDNzNuZzEvdi93?=
 =?utf-8?B?SXNBWVRBTFpTVlVtWWpzRGpYQXM5cHAzN3V1NmpMMTNBb01EeE93ZHhGVGxF?=
 =?utf-8?B?M0l2Z2xzNDRHaE9CWkM1S1NPRjJ3YjBaTHZSNE1pRjRRKzlrNk1wWkVueVdT?=
 =?utf-8?B?QkI3dVN1RDZrYVQrdi9BcXhNdWVSWTIwb282RHcvV21YUDdkV1ZuanV6cWNl?=
 =?utf-8?Q?l5EReTtxCVBWYFaUdlQk4p9J+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee822dd2-d4c4-4bbf-a571-08dcd1b530bc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:25:32.1081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjpog0QpiX1H6SjSk9AC0q67Y/lEf5xJXKn+Do9RO7p3vqV/RbUmDfOiU62tm5VduRlYAnHcoL/MNsgV3lbVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

Hi Rodrigo/ Matthew

There was an error when this change was merged to linux-next
https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au

The conflict was because the below commit
 
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b

Jani suggested to rename or remove it in 
https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.

Removed it for now, will add it once the commit is in the tree

Thanks
Riana Tauro



On 9/10/2024 8:24 PM, Matthew Brost wrote:
> On Tue, Sep 10, 2024 at 10:52:35AM -0400, Rodrigo Vivi wrote:
>> On Tue, Sep 10, 2024 at 07:58:37PM +0530, Riana Tauro wrote:
>>> Remove local copy of str_up_down to fix name conflict.
>>
>> what conflict?
>>
>> I don't see any conflict caused by this. But well, nothing
>> against this change itself.
>>
> 
> I don't see one either:
> https://elixir.bootlin.com/linux/v6.11-rc7/A/ident/str_up_down
> 
>> perhaps s/to fix/to avoid/g in the commit message?!
>>
> 
> What about s/str_up_down/__str_up_down rather than remove the helper.
> 
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>>>
>>> Fixes: 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
>>>   drivers/gpu/drm/xe/xe_gt_idle.c    | 9 ++-------
>>>   2 files changed, 3 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index cbc43973ff7e..8f850b9e1947 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -14,8 +14,8 @@
>>>   #include "xe_force_wake.h"
>>>   #include "xe_ggtt.h"
>>>   #include "xe_gt.h"
>>> -#include "xe_gt_mcr.h"
>>>   #include "xe_gt_idle.h"
>>> +#include "xe_gt_mcr.h"
>>>   #include "xe_gt_sriov_pf_debugfs.h"
>>>   #include "xe_gt_sriov_vf_debugfs.h"
>>>   #include "xe_gt_stats.h"
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> index 85a35ed153a3..a8ce8b484561 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>   	return gt_to_xe(gt);
>>>   }
>>>   
>>> -static inline const char *str_up_down(bool v)
> 
> Also if this is kept, drop the inline as we don't use inline in *.c in Xe.
> 
> Matt
> 
>>> -{
>>> -	return v ? "up" : "down";
>>> -}
>>> -
>>>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>>>   {
>>>   	switch (state) {
>>> @@ -227,7 +222,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>>   			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>>>   
>>>   		drm_printf(p, "Render Power Gate Status: %s\n",
>>> -			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
>>> +			  (pg_status & RENDER_AWAKE_STATUS) ? "up" : "down");
>>>   	}
>>>   
>>>   	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
>>> @@ -241,7 +236,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>>   		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>>>   			if (gt->info.engine_mask & media_slices[n].engines)
>>>   				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
>>> -					   str_up_down(pg_status & media_slices[n].status_bit));
>>> +					  (pg_status & media_slices[n].status_bit) ? "up" : "down");
>>>   	}
>>>   	return 0;
>>>   }
>>> -- 
>>> 2.40.0
>>>
