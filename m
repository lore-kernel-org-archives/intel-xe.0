Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C286CF8843
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 14:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FC810EA28;
	Fri,  4 Oct 2024 14:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HD8XYTIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214410EA28
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728052692; x=1759588692;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kUC0nmupSKWo3u8NbXMeEDr9yypozF2NCIx8rKdhD0w=;
 b=HD8XYTIlaBgmOneG9fEC6Djv4NsUuqWeF0iGQrag6tAg6Xe/d9qrlLk9
 PgHCV1Qox5P7ILM+0xbIDV0cqYqlCpwUHxT2eikhWTd/7pZ5vyPLQ9u/G
 roo6IYtFW/5ggMd9lFYWZoSfhXpH9iSTNtd2AEe8atEtWtQrjAUsq5Zly
 2/AVtqLaK9v36hrk2qcFEE6rIQo+3VDmtUY7+XneHEDnVoRbSKd7kLdkb
 h/xUWMWFcWnMx9I2B1/vp+5nqkLIv9kjGmhdc49VoxfCxgMoXsrohp82A
 f4Bv3zBFrq/7Dz+hu2behGI0TOUoVWQOrFPLojxTjHG/hLX9hd3tvpXNQ w==;
X-CSE-ConnectionGUID: 5FXABv9QQ1mkzGO/MmoHcA==
X-CSE-MsgGUID: uKaoKqaaTUCBFkybrGQXSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38413733"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="38413733"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:38:10 -0700
X-CSE-ConnectionGUID: j8Mn6Ca2QSifwcYAz13ljQ==
X-CSE-MsgGUID: +vGTzH9gQ/mJujg2pILbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="75048688"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 07:38:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 07:38:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 07:38:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 07:38:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 07:38:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crrjU7CZ4o2N2XKXki+LxmFRVqH9s/W5Qvb7D7AQ02NER1TN95PGyn5vjB/w9/trptMiYq73sl1g27KFxRed9OsqMmyCK5g6v5PvDyIGerT2vVK2udFtJyVPvXP8uj47tUrnFN7ydHyT90LmJV7qOnxTmBHadt+L8VPwOkTup0hqJRYI8J3iN1ZdwwvFH8h3ONuJb1sEM9pnbXwbBupsExDY4NXIjOcdHtZHgFgboj2CwLIOhgASCO9IvFDv/LTlVMh5sbxXrCKT+yuI+3j9jL8P8V5V+Ic/+hyo93EW4xdmVz6vv9n5fM4sCVLPiRq4wEsMTeENoWmPeFaIBVfA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oudi7AG+c+Civ/GcMWiDSyp7R5l+BMpaW6if1nuMbk=;
 b=Be1mj4E6B66v0DmBPZ88Yu1FsvnLyLJc9MedE3v7YZc9yDCCo6jlnUrdyQg1/U4TKzFRVjogXipeBVVd//TCg1zgbZx5f0kyie+FomHOrKtavPDJggfzLmR0hXj/cFm6v408JpDEZTlhlBw9XqriAgCDubxoMZiu7RIagXlnwQdQ+C80gezGfkPo4/nZzBodNrlx1FPZO8jyGIJO4qAF+D4R7f7RDSW22A3loRgHQ9et2+//9lXlDLFod7uITpgY4OZapyArhi6BRrGderQieWAWZhzC0pG7DfbesBxK1FB4MWs2D13jVpkOuJGS5mEdXE3YeCP7wIcVqzYQqp49mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 14:38:01 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 14:38:01 +0000
Message-ID: <20caf022-168b-4f08-9f92-645ede2470dc@intel.com>
Date: Fri, 4 Oct 2024 10:37:57 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Ad?=
 =?UTF-8?Q?d_GuC_based_register_capture_for_error_capture_=28rev27=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241004032400.3146208-1-zhanjun.dong@intel.com>
 <172801785340.1172277.17137134921492650138@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172801785340.1172277.17137134921492650138@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA3PR11MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 6487d0f7-6172-414d-95ef-08dce48225cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDg4d3djNVVwaWdxV2ZQZVFzTnpHYndKdWYxRFZSZVEybVdyQnJaZlpSQlNR?=
 =?utf-8?B?R1FHYjl5ZHNFNWNIKzVEVHZ6bE1KUlRHOXpzQU9rUWE1c2UxTmFzWFMvY2FR?=
 =?utf-8?B?NHZSbDlYK2swbk9uQXZhTnVtTTlJQ1c3ZGhuYnFUNlM3NCtZS1NCWUN1RXo3?=
 =?utf-8?B?c3YrdEQ1bldQK3VneS9KUkR4b3Fsbm01d1FNVE1VeWxvOWpMb2c5TThwbm1N?=
 =?utf-8?B?NzJrRmIreTY4L28reGlTdDRoa2pua1dsSjkxQlNxRHlORm1VdnZwUExXUEpm?=
 =?utf-8?B?Ulc4STBpY2h3TkFIcmRrWGZ2UnhsVjRCUTlSWlhUVkNQYVRjd2NSaDJTTVR4?=
 =?utf-8?B?TnZEUDNlUWJyb2J3YzhRNGNWTnF3c2RhdGNBcEYzY2U4NzU0YUhhY1lVUUtv?=
 =?utf-8?B?UTZDZ2s2V1labzhZWHZDbTZaRlFBaTIwWU5pSkRRTExqbjhGZUNScHZIUFpk?=
 =?utf-8?B?UnlNOWtFSjc2bE1icUdXaDJwNGwyWlNrYkZwajArUkpzNE5IUmZaSzdOUlBY?=
 =?utf-8?B?TURXYmJzK2xSamQ5U0JHcCsyNEdiUEp4UUhyZ2dySE1Qc0FsZ0lVWDd3M0FH?=
 =?utf-8?B?Wnh3TExPQjhHM1BseTBYSFRBVXJvazR6cU5IZjB5c1VZcU8zYnRWMnRtc3Nk?=
 =?utf-8?B?UWRVUExFS2ZrWDhqeDBZV3Zob0ZYTER0YmJZQml6TkQyRUZsZklKNVAxdmNu?=
 =?utf-8?B?dGlJbHFWV2Vlc0pVaVRCRkF6YXlPZjRzWnc4dHZzUkhlYW9LZ1p4dGxZTjNi?=
 =?utf-8?B?SXpIQ1UyUkVjNXdJbFdaS0Vya2RFaFl1dWtNYTJWRitycy9qdVJZRGJnMzdY?=
 =?utf-8?B?UXZaek1tNUtXVWl5ZW82TkltMEEzanpwRVYwbEk5VXF4WEdZQ1hnR1RCMGVN?=
 =?utf-8?B?ajhZc0p5WXhHTEE4TUlFdGRmK2JMcjUwaTFkQ2J3QzFqZFR0ajdsemNlZEZU?=
 =?utf-8?B?dVBOYUhEd2tlV3M2U0VNUitnTjhVbXVPR2UwZjdVYUFudjY0TFhxYnNpTUFN?=
 =?utf-8?B?RnZVZnlyR2FEN2lLemlxU0dYdEU1RFc2eTFTZWo0NnB3NWhvcGJtQlQwUzJL?=
 =?utf-8?B?eXZOT2duTjJmMzc3WFB4ZzhaOEhaY2FyamhsTitkVmcyV2FIWkJGb0xaeTVF?=
 =?utf-8?B?eVBHMmNyYU1zM213T28xU1pCSjhwenZieDJXWnVkYk5DcXIxWlNad2pxZFRh?=
 =?utf-8?B?d1ZoS3RodlFnczhQT1gzZWZia1ZjR1EvWlg1akc4YVBsVnIzdzNWSmZORk9M?=
 =?utf-8?B?RHFaaHNGMkVIVGNvWGpqUXlScnB6WjYyOHhNM2tzMGhyVmZVdFNPcjVpTFJN?=
 =?utf-8?B?cXk3a1ZIRmo3TEVhcGVoYjR1OHdJMWhiYUp1aUdqZFFpaEZEcHJ4SmlQZTVO?=
 =?utf-8?B?SW5LT1VibTA0QW1rbmNyejhVZ1doVmR5OGlTRk9qbzgzUUxqWWRsQ1VIa2h1?=
 =?utf-8?B?Z0t4TitIQVMydjZEdC9kaUtBL0U4NnZmY3ZtK1gyQTJ3MHl3OEJjRVBRdGpU?=
 =?utf-8?B?M0JJWWVTUlNudjlhNTlYZkpEU2JLN2lkOEhTNkJrbmJCQmFrNGpwZkJXVWZN?=
 =?utf-8?B?MzdsV25XU1RqZ24yL3J4S0J6MUtBajhZaS9iWjI1YmxIU1BxK1EzYUovRWF4?=
 =?utf-8?Q?Wr7Dhu2q5n2egvTJ/gbsQojSt6d69tF5jFGXYRQ8/jxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnF5UzREbnpTUkl3NUlwc0ZMc3Q3dER2a2NWViszMU9LYVIyelVLYkdWVUhj?=
 =?utf-8?B?WkZ5c1lYbHlJS0VjUU9LZ1pZZWpCdFpIcGNndmo4MU9vNGVSTTVCWVBxUU1k?=
 =?utf-8?B?L2sybEFGNGlOYkpyU3JEdTlKUnhCTnNUaHZoY2c1dUJCSThuQ1B6R1VwMHpj?=
 =?utf-8?B?ajVGelpKY2F0eHV6aGlxWWdDclp5Y0d0WnB0bFoxcTY0cmJSc2dQZG45UjdX?=
 =?utf-8?B?U1I3WGVwTFpkV3NlYnUrcklrZG9aK012Yzh6RG9oNkRhZnI0VDRMcUIvelBj?=
 =?utf-8?B?SG04ZSt5cmZWQitXanRSQURUUnNDT3Q2NFpxektmY1BZSnAvMjV1bGxkZ3pv?=
 =?utf-8?B?Z3VpN3BzSlk5djNaVG4yblN1NEo2UTRYOTBqWHV1RlBiYUU1MTA5NmZ5eUJ5?=
 =?utf-8?B?OUZjNTVNZlUrK1NnbWIvSVFjTWQ2SEVGUzVXeDAwOW8zTTZhUUFkcFNscEJX?=
 =?utf-8?B?Q1BTQUhRM3NzcUJRbTI3NXNhTkllY1JvTHhaeXdJOTZsTWM4UVRyUzdKbzF1?=
 =?utf-8?B?RGhZa2RncGtabVV1QXZ0Rjl3bUJUVitWRU84bmdETnFrdUVRTlZEWlBDaUUr?=
 =?utf-8?B?R3lwd0xwWWt6blExdndmUjZZQkpmV2k0TExpdXkyUTNkVkpCcXI1RHVwMEV0?=
 =?utf-8?B?UzMxZXhlb2tncHk0OTNTZDJxMVNpUXd2dXQyNzRtdU41MmxkZXU4aU81YXZv?=
 =?utf-8?B?NGtjWW8yTHY2Q3lRdmJ1L1lzbURvQnF0SDZVSklFcXhUWDJHbmFyTHFxMWZU?=
 =?utf-8?B?bWJ2NDVmU2pFL05Fa1RXSSt6OUFIU0RSZ2MwNzZ1REZLd09XVUpCeFJ2anpK?=
 =?utf-8?B?bUtjS0tFNkliSEZLODJCdDdscjZ5Z0hkZ3kwaHBFR2ZRUXdIRXU5SWVKVUNq?=
 =?utf-8?B?bk9mRk9RWitEM2hNenIvYncwTDBnSm9mUndiVVlpaDN4bGdpaFBnZzVJVVlx?=
 =?utf-8?B?a21DT2xnMmtpOElzNFViSXdoK1Y1WWg2UlNtV21mdUxSeDUwQ1JiQnQxNDgr?=
 =?utf-8?B?MTR3SGx4Y2xHWTNrNVdKNU12VUN0WjV5SURLbUpUSHVKbXZxOTk4eFN4bFRU?=
 =?utf-8?B?NUd5V205WUo2Wk02Y3ErdDZ4emdyNXZId0tqTlZNUVJGVG9pa3V3VUlBWWZV?=
 =?utf-8?B?NlNRTnBXdVVFUWNET2gxZEw0ZytyL0JTcVVRQUJlcUtrdHc1RFB1Q1dxUXFG?=
 =?utf-8?B?QWdLVnJ2M0ZuUkk2bEZYNHBxM3AvM0ZFWEpQbDNMUTlMa0lqWVhNY05xb093?=
 =?utf-8?B?Z1RhWFIrYWVKMERBYjVHU1Jzd1Rhb1NsU0tBVkRSVERzVHBYZng5d2RWcG8x?=
 =?utf-8?B?dUEzcWZ6U2RQaGUrNC9qQkc4Z0tyRExhTyt4UjBRMkdMUVEybDViaWs5VlQw?=
 =?utf-8?B?Tm9LVWhuMDA0MkFNN3pZWW4yYWtVWXhSZityNmxULzU5WmFMeWVtdGFNUzJp?=
 =?utf-8?B?NlRZdEpHWUtlcHIwbjB4NlFyeElVcWpCbmdsUzNGclAzenFkczJjbGdHN01M?=
 =?utf-8?B?VGNYUnBwL2hiWnh5em45VE9FUDlqV0Z1Zm9RK1V0NVBBZ093ckI5bDNRRG9z?=
 =?utf-8?B?MlJLSFV4WDFLS1pDbm9ENzM5MTNLNzZOMzlaaFdLVE5IbkVTU0dSdE1hZHRE?=
 =?utf-8?B?SWZlY01jVEkyK3FadE9MdG9SNnNSUlVmUDRtd2haL1E5aU9oYUZjamo4TERv?=
 =?utf-8?B?MTRnSkQzajVSTXZOVmh4V0xuZCtwWmdkWFNKRk9jRkV5dVBVY05vTlJkekw0?=
 =?utf-8?B?eTNWclZOK0hxMGlQQVdINy9tN2tZR2wvc0YyQnNESXdqRi8zamlxNHdnSjlW?=
 =?utf-8?B?ODM0UnJkV2FCVkRKeGRNV0dKR25mMXp4L2NKdVdjNmxhT0orWllYb2lQVDBX?=
 =?utf-8?B?WGpqKzdCeG9HOGhGOWNPQ3JZZG9mM1dRRkNRaHlPZVdtYTBaV0xlKzJldlgv?=
 =?utf-8?B?S1FpdjJKcXV4dFQrUjh4MlExdmcrWjcyMTNLdnB2OE9mRGxuNTA3MTlTdVNr?=
 =?utf-8?B?dWc1ZXFTdGpUaFdiV2dFWWwzU3BiZUFCOGZ2OTQ2UlErMWR2SUM1dWpIVGFv?=
 =?utf-8?B?YVVnM1cyQzdzQ0RsNzIza3UxcTV4clhXcWNuZUhnbjNvTUhMWDhYKzJFY3ZU?=
 =?utf-8?Q?cH6o8WMJBlq8S9bWgHaRSWDba?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6487d0f7-6172-414d-95ef-08dce48225cd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 14:38:01.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYRM/Ls72WuZKZq/Ui/8T1Z5saN04Z7VVMK2CcMt8j5nBLhuWVlxkupFaaCxa+0UPG6KFOxw8AL9v3KRS1mmtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
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

All failures is not related to this series.

Regards,
Zhanjun Dong

On 2024-10-04 12:57 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add GuC based register capture for error capture 
> (rev27)
> *URL:*	https://patchwork.freedesktop.org/series/128077/ 
> <https://patchwork.freedesktop.org/series/128077/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965_full ->
>   xe-pw-128077v27_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-128077v27_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-128077v27_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-128077v27_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html>
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_dp_aux_dev.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_dp_aux_dev.html>
>   *
> 
>     igt@kms_flip@dpms-off-confusion@a-edp1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_flip@dpms-off-confusion@a-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-1/igt@kms_flip@dpms-off-confusion@a-edp1.html> +11 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html>
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear.html> +4 other tests skip
>   *
> 
>     igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html>
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html> +2 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-1/igt@kms_content_protection@mei-interface.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_content_protection@mei-interface.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-random-64x64:
> 
>       o {shard-bmg}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x64.html> +8 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html> (Intel XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-4/igt@kms_feature_discovery@psr2.html> (Intel XE#2374 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_feature_discovery@psr2.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html> +10 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html> +3 other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html> +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html> +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html>
>   *
> 
>     igt@kms_psr@psr-cursor-blt:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-6/igt@kms_psr@psr-cursor-blt.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-3/igt@kms_psr@psr-cursor-blt.html> +2 other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-hang-fd-rebind:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@xe_exec_threads@threads-hang-fd-rebind.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-rebind.html>
>   *
> 
>     igt@xe_wedged@wedged-mode-toggle:
> 
>       o {shard-bmg}: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html>
> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965_full and 
> xe-pw-128077v27_full:
> 
> 
>       New IGT tests (4)
> 
>   *
> 
>     igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.23] s
>   *
> 
>     igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.24] s
>   *
> 
>     igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.24] s
>   *
> 
>     igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-128077v27_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html> (Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23 other tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +16 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +3 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +5 other tests fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +2 other tests fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +12 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +7 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +35 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +53 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_cdclk@plane-scaling.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +2 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +11 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_content_protection@lic-type-0.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> / Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +10 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_display_modes@mst-extended-mode-negative.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#2915 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915>) +3 other tests abort
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +9 other tests skip
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>) +11 other tests skip
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +3 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html> (Intel XE#2899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899>) +1 other test abort
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html> (Intel XE#2899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3 other tests dmesg-fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +20 other tests skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>)
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +25 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924> / Intel XE#783 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/783>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +2 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +62 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +32 other tests skip
>   *
> 
>     igt@kms_getfb@getfb2-accept-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#1339 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339>)
>   *
> 
>     igt@kms_getfb@getfb2-handle-zero:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@kms_getfb@getfb2-handle-zero.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_getfb@getfb2-handle-zero.html> (Intel XE#687 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/687>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1470 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470> / Intel XE#2853 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#2332 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html> (Intel XE#2622 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622>) +1 other test incomplete
>   *
> 
>     igt@kms_plane@pixel-format:
> 
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_plane@pixel-format.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_plane@pixel-format@pipe-a-plane-3:
> 
>       o shard-adlp: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_plane@pixel-format@pipe-a-plane-3.html> (Intel XE#2078 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078>) +1 other test warn
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-3:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-b-plane-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_plane@plane-position-hole:
> 
>       o shard-lnl: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-b-plane-1:
> 
>       o shard-lnl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3 other tests dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>   *
> 
>     igt@kms_prop_blob@invalid-get-prop:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_prop_blob@invalid-get-prop.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_prop_blob@invalid-get-prop.html> (Intel XE#780 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/780>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +11 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html> (Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr@fbc-pr-primary-render:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_psr@fbc-pr-primary-render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>) +7 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +12 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@kms_psr@psr-cursor-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +22 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +6 other tests fail
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_rotation_crc@multiplane-rotation.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_rotation_crc@multiplane-rotation.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +2 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_vblank@invalid@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_vblank@invalid@pipe-a-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_vrr@flip-suspend.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +42 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_ccs@block-multicopy-compressed:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>) +2 other tests skip
>   *
> 
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-463/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html> (Intel XE#2915 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915>) +1 other test abort
>   *
> 
>     igt@xe_compute@ccs-mode-basic:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@xe_compute@ccs-mode-basic.html> (Intel XE#1447 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html> (Intel XE#1050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@xe_eudebug@basic-close.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +9 other tests skip
>   *
> 
>     igt@xe_eudebug@discovery-race-vmbind:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-3/igt@xe_eudebug@discovery-race-vmbind.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug_online@single-step:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-8/igt@xe_eudebug_online@single-step.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +15 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>   *
> 
>     igt@xe_evict@evict-small-external-cm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +12 other tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-simple:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-simple.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +15 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-userptr:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +33 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +22 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_reset@gt-reset-stress:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#2895 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +1 other test skip
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-6/igt@xe_module_load@load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@xe_module_load@reload-no-display.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@xe_module_load@reload-no-display.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204> / Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@xe_oa@create-destroy-userspace-config:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@xe_oa@create-destroy-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +8 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@xe_oa@create-destroy-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +7 other tests skip
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@xe_pat@pat-index-xe2.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> / Intel XE#2838 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@xe_peer2peer@read.html> (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html> (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1 other test fail
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@d3hot-basic:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-1/igt@xe_pm@d3hot-basic.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-6/igt@xe_pm@d3hot-basic.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@xe_pm@s2idle-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#2915 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915>)
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) +1 other test abort
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1694 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>)
>   *
> 
>     igt@xe_pm@s3-d3cold-basic-exec:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +3 other tests skip
>   *
> 
>     igt@xe_pm@s4-d3cold-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +5 other tests skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +5 other tests skip
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#2747 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2747>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> +1 other test pass
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html>
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html> +7 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html>
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> +10 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_flip@plain-flip-ts-check.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-436/igt@kms_flip@plain-flip-ts-check.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> +1 other test pass
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-1/igt@kms_hdr@invalid-hdr.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-2/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-4:
> 
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html>
>   *
> 
>     igt@kms_pm_rpm@i2c:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-4/igt@kms_pm_rpm@i2c.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-3/igt@kms_pm_rpm@i2c.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes:
> 
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> / Intel XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes@plane-50:
> 
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html> +1 other test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html>
>   *
> 
>     igt@kms_vblank@accuracy-idle:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_vblank@accuracy-idle.html> (Intel XE#1523 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-8/igt@kms_vblank@accuracy-idle.html> +1 other test pass
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_vrr@max-min.html> (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-2/igt@kms_vrr@max-min.html> +1 other test pass
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html>
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html>
>   *
> 
>     igt@xe_exec_reset@virtual-cat-error:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@xe_exec_reset@virtual-cat-error.html> (Intel XE#1638 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638> / Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@xe_exec_reset@virtual-cat-error.html>
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html> +1 other test pass
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html>
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-9/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-1/igt@xe_pm@s4-basic-exec.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_feature_discovery@psr2.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>) +5 other tests skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html> (Intel XE#2925 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>)
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-render:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html> (Intel XE#2924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v27/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8052 -> IGT_8053
>   * Linux: xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965 ->
>     xe-pw-128077v27
> 
> IGT_8052: 8052
> IGT_8053: 2b0fbc179b3055a1c577835e79710adee5b4e754 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965: 
> 92d12099cc768f36cf676ee1b014442a5c5ba965
> xe-pw-128077v27: 128077v27
> 
