Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087ADC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 11:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFF710E0A5;
	Fri,  8 Aug 2025 11:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBf32HT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802EA10E0A5
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 11:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754653541; x=1786189541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YOT/E/URDhGgOLrUkg0azXWx7LZanRowgGC+L6C7Djc=;
 b=WBf32HT4gOwazDfz3TqLj1y/jXXGYAZl13ZFuCV3YnKO2ORr4whAFXtA
 Pq0d4+QOLMlPNEKfrfAYRaF8nfpE8Hn95QF+9mtKHmHaHzoloQMNHrqzH
 9GxRlMmx6W6sD0e39s8VitHI61bCA28qRpCaMiC3rs94cXN3djOKq7xfh
 8Vs/4wh+cXMRcDFc02mlMll+wkLp2zI0bMOdxWX10WD9SxxlBBQ9nsm/x
 EnWXd3jWRaWdTm4LWIjqwlI0XirQEnc4aufFb9WetXea175xLIhjCV6m0
 1xH7YYZcoJjhqJ7E12enOtTIzhtktv1GfwPIf/93/3yO3iY3URSCrkTfO A==;
X-CSE-ConnectionGUID: lDq6Yvk+RfOrf5FVEuvFew==
X-CSE-MsgGUID: NMcrj/ZpTDKjdsMeOaVX6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68367307"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68367307"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:45:41 -0700
X-CSE-ConnectionGUID: TZneyU7tQVec23AWDUoFog==
X-CSE-MsgGUID: lQjffyPGSUmc5FkQbGXSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164825898"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:45:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 04:45:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 04:45:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 04:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfPxuqDeH3PeqnmNTCu8yacuyPKErjlw7I0BZX/9+HmJ7u9runW1YcCaV1q7mGG2UO635vmM6zBib6s3IsGR3Sm0g1bF+5FUE/HX0OG2QiiabEk/WnBUHBOkL5bgitDAquY3g596MLWI+UHqMWUCfbJkfObcwjz4ocOoQZYgEaHZ7In1pE/RgbBdE1PaBVau8Mf45vIdqaPtO9zI1FniTL9kzBAGOHnRtUilBYBESoaTbmO4pDNtePoVjYQw9wTA0dEnwM2ALRfT90TtCuGpJOE2a3JVBArBPMtiNDhkQbxoa6MLzjxc29cS14947snw0l152OhwQ8PYxERzRU6neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOyZs0PRtV7h7AwEsD2g9//2nbM42KCM9UFg1N7CMu0=;
 b=RYcFG1m6DjS3KMcOk2mNlipqBVmqZzwCsvSFBtNdyMiQICy9ZueMjDqulWc8Le0MxAnCCmd6PF2MEZUI2F2a0fPh36NXovrnCrjrZMZHIY8PT2tYIHSElQpkbxn1doWG79GakmXuNzNeaRi1owNjlAPqt7BVJFsqDyR4U5U4IyW51VWAqCPXccr7SaiaKQt46qsx0yUnfJFFPjWjixZ0piQziwROQLFyrUp5bF48aDFeK9vUeYeQnZHo3ygYc5HbzMTEAAEMkkRsA+5vYlGXfz+29nCvOhTIbSN050e1/ed2nsuOVAy1ghu0CkEWoRIrQzT842JwpJE6QA9JxGxQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 11:45:36 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 11:45:36 +0000
Message-ID: <13c29a0e-040e-4212-b51d-33cca1e2746a@intel.com>
Date: Fri, 8 Aug 2025 17:15:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Add SW clamp for power limits writes
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250807140602.3247853-1-karthik.poosa@intel.com>
 <625144eb-9b3f-4d93-860f-3b200400bf5f@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <625144eb-9b3f-4d93-860f-3b200400bf5f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 78919968-5422-4a98-8e21-08ddd67116ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHprSmY4aTBCZVJmL0xCOHliZGRsNEpXU3V6Mk44MXMyWUlqbTdqS0Mza1Vo?=
 =?utf-8?B?a2tpWVV6a3I1K1N0MVVMeTRWb3ZIWlJiZTBBbFJzd3JnSjdhNGlHOVJETHgr?=
 =?utf-8?B?ckgrVyt2aHBLSHZjd0FMMUpsWlBYTUtkKzB2K2tmbjN1MEl4VmlNcVgraDJr?=
 =?utf-8?B?cDRzSjhOS3R6NFArZnJQUGdJb3ZkY2xIYkNGNlNOZzNiUm9WbUxMQUtpblBx?=
 =?utf-8?B?QnQvUGtNUkx4cERqYnYzanNEY0NSbVpqY0l5VE1oRDAzSnp4SDZKTE9SQlky?=
 =?utf-8?B?SllrUkxRQ2dMUEtWZnRwTk9tTFFIZnU2NjdFQ0Ftekl2dFBybGg0K0o2ZzRI?=
 =?utf-8?B?N0h1cURZQi81dzkzQ015WXVSWFJRSjVOeFM5Q1hpTjJXV2lkTEJ0RG4yZ3ZD?=
 =?utf-8?B?RUlFczJFMHFTYVFtWFkzWGdDUlZIaFd0bGhNcTg1bnc0aHh5OFpYa1pTSzQy?=
 =?utf-8?B?Q0dSVjNnWUV4VDJpOGhWd1Uzcnd3RU9ESEt4MnZiSkJIT1RhRDVoL0l2WUVZ?=
 =?utf-8?B?VTA1WXBDUHNUOVlQWkVseW5tSlVmUVNndUdKMXpXeXlCdk9aNUIvenl0aUxD?=
 =?utf-8?B?ZjJaNnlQWWZiQU9ZZTYxaUJFSXRLSnptOXNRSzl4Ymc4OFlpQmZseHl0dzUv?=
 =?utf-8?B?RVlFSjRPRmZMbEx5L3F6eG5aUDdRdG43Q1hCbTlPSEJSMCswS2tPRWlQaDNp?=
 =?utf-8?B?aFVTZmdiN2VNUU5NZEVZNkYreUZqVUpGb1lYZWdVNUJaRmZKS0hETXdGMXlO?=
 =?utf-8?B?MG50NUgyaS9ySy9ZdkNycXFMOEZ2Q2w5QkIxSFJGRVNmdVhDMG5ySUhqWkpT?=
 =?utf-8?B?aW5DZWczdExtKzdmU0dtMTUvYndadElIendNVzdrRkl1VjhSdi9NdDFtdVU1?=
 =?utf-8?B?cjNYdzhZSXVkMnljS3RHUkRDN3JnZDZISEJ3VU5SRE1CbldzK2ZCQXhqQXl4?=
 =?utf-8?B?ei9tejcxS2dydWlBZTNuNW9pbWtzNjJDd1RVQ05CRXU5Z3c1bWtyS3FUeFBn?=
 =?utf-8?B?L3BublBCdldQYkVKTGRkK09DZ2hQdE1SR1FGbXFhT2daV0IwZzNpQ2xGbGpT?=
 =?utf-8?B?NlBlS2x0M21EZFV2c0xrUUlSUGdDd2x2Wm9IL1Fmb21BR093ZlNCeE1HcGV5?=
 =?utf-8?B?bHdiM3NHby9SSjVpMjJFQXNyeVNBWExxaTRSeVdCUlNKemU5aFoyMU5mdVNQ?=
 =?utf-8?B?akYxVmVESVNlbktwVm0rMGpUbXB1c0hHd1JsbGJSZllwcUJ2WFpvOFhJemt5?=
 =?utf-8?B?cU9KVkxiNFJPZFVTd3lBV0dBTk5CWWQ1NnZCQW5TY1BsVnJKV0FYSmwvQnBx?=
 =?utf-8?B?eVdoeHVJRzl0TVF1NlRRb29HY2VRaHZXdlhsQmJGZHRHUE13Y3kreTNJbEZW?=
 =?utf-8?B?YTVGK0V0MllzKzlnZmVJYThrR0RuQlZTQ1c0c1pkM2F5Qk9hRXJPZ0EwdDB4?=
 =?utf-8?B?cGxnSWN5Kys1c1lqOENyZTVMb0txN3lHYUZFZi80TWFwYWtjU1kxWXVodXI0?=
 =?utf-8?B?QnJ5SzRCYldPRFoxM2Vzc05UenJzY3RBRmNPMVZKcXBVd1U4cVErRnNGWnUx?=
 =?utf-8?B?OVN1OVJwZUZtOWdkaS9GUExjMjFSMmptSW4wTGVaeWEyS1IyY3RxTHlKelBI?=
 =?utf-8?B?QTVyU2FRQnFReStWQkl5STZHdDRENTVOemEwTzd5M2orVkZrZTIzM0NWQnor?=
 =?utf-8?B?QS9QMW1zM2F1VlBpbXAyMzRZMVNLd0hwb0JSOVQyaWErT3N1UVVXQ1NhdWo4?=
 =?utf-8?B?SGRjU1AwL3dVclcvb3pwMUFQcm55Z29Jb1JMSlF3Q0xINW93MXZGN3FnWExV?=
 =?utf-8?B?SkttdjVTclhFSkpMSnovZGpXUzBaam0rSTdHaXhSNlQyR1FDNFJlVk9rRFY5?=
 =?utf-8?B?cVJpN0NFajFSVFMvSkIxdjJidUpkL3NKVisxdVp0dndmZlZqbHpvU2ZGZ1Vn?=
 =?utf-8?Q?EcyUoP9m+P4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzdkUDQ3SjQrWHhJTkdiY08wRkwwYkRza2tYUUl1M1crRUl3YU8zbFZkZHZS?=
 =?utf-8?B?UUdaWUpNYmdqQ0NmVm53bWsvNlhMQ0tpZkNsOE0wdzdXd1o1bFhRcDhpejht?=
 =?utf-8?B?KzkrYlNVSlJEcFFPTklhTXdYRVl4eDNtamZNcEZaWnhEenpOa3A5OGdWbUtE?=
 =?utf-8?B?SHZmM1RnNFJmWFB3b21EUWkwRkNoTm5HUDNpYmZPZklmeGQ5TXJFcEkvSnRZ?=
 =?utf-8?B?ZlhJcUQzRnJ5SjY5bk1tM0hEaUt4a1FCZWVocU9SZFlYK0FaWHAvMWgxOUVK?=
 =?utf-8?B?d0NkOWpyeDExNjRjMmRHbmMxT0c4UmFJQndLQUlxbHNSc0JteWo0YlVHcnpt?=
 =?utf-8?B?MFhRWWVjYU1XWjJhQUxiNkNQN3dJSnlNY1hGUXRqL24xaVZpWTRhVkdPSnNq?=
 =?utf-8?B?ZWVXK01sTmVodVE2ajBkWVNxT2hiQkxyVjFlZWRjSm1CR3N3QTFGcnEzelZz?=
 =?utf-8?B?UzF1bk9ydjh6aUJTQkhrazltSGJmVERkOWFHcDNTb2xGUllmcUJwQVZxVHQ2?=
 =?utf-8?B?U2M3YTlFNjUwODNnL2VXSTB3VUdydUIxZThSTVZDbzVGSk5pbG1iMHU4UkRN?=
 =?utf-8?B?eWw1UXliL2R4SXF0NCtvVTBEc3I1VGVvQWFKY0RCdG1DQVJVN05Va3Y1ZDhk?=
 =?utf-8?B?eFh2UktuYXgxendHMVFHUFBadWJWRFhMUEppUjZEV0pRWFFwb2dRVkc1MkJr?=
 =?utf-8?B?ZUJWMkRwTXFqR0lqZHV5NnVvYjU5MTNQZ0RZUWZabUVRY2Z5ajNROFQ1Qks3?=
 =?utf-8?B?U0hzMmpyU2ZqUzZMUUl6Q0ltZ0ZHeDR5aEVxK0hVT2gwZU9pVnNGUHBVcm9P?=
 =?utf-8?B?YUtpOHo0dUpKYnpEeTV4SDdJOGE3RjI5ZFI1WlJZWXNpQS8vQVpGeUxjM2E2?=
 =?utf-8?B?T0ExQTZhL09YdFpaeVMxK3hRaXdnRUZTZ2QxWGY1Z3BIb0labEJSTWE3SSt6?=
 =?utf-8?B?OFJtbElSNWhBL0ZJUHUwa3hjUnYxU2tsVFAyMUpHTDFHVkptdkpxQkpSeU51?=
 =?utf-8?B?K29FN0wyN3dNZ25XbnZZOXVuNkhCOW13S3NkemJIWFhoVks3R1E2aURlV3kr?=
 =?utf-8?B?cWw1VHVRZXB5OGZjcWttV0o5VjQxc2ZFNy8ramdYVFhvWi96N0VVUi82VGNp?=
 =?utf-8?B?OWZZYjJKS1pmQXNzdjM0ZFRpQnJKUXUySFhPZ2p0S0hSOURGVHNmYThQNjMr?=
 =?utf-8?B?cDhZYlZkSTdsNk8ydWZMOUVxVkE4eTU5MkpFQTczNXpwekRyV3ZvOEVqdVZq?=
 =?utf-8?B?aXpIckpNQ2kzRnN1SDNhQkpWQ2Y2ZVZxK0tLZlZIRzlyUzdtcnIrZGIyR1cw?=
 =?utf-8?B?d3VvZ21lbmI2OHRmK2NlZTNsNlVtOTBESUg5d0I0VEU0U21yckpnYjNoMkla?=
 =?utf-8?B?U0pPRDV6N0Q4dzkzTXVKRE5NU2ZydVU1L1ArZ3kxR1Bhb083UmFpQ2tLUGtV?=
 =?utf-8?B?b05jNk41WU0wWG45ZmhYMUN2eFJDY3Mwa3JXaGIxQmgrTHZjZnFuNS9ka3Ex?=
 =?utf-8?B?Q0N1V21ibG5ZVWdHb29OaS9zWDBIdVJQUmt0OWdZMXRqZm1CKzZBand3bTdl?=
 =?utf-8?B?aXAzRzI4Y1FBNnVOZ2VDOUV2MW9MZlMvUGFYTzhObzdYTnA3Zlh5aWg3WHQw?=
 =?utf-8?B?QkxVRFRRbDVZQjFTZUFmeXVzckQyTlFYSUt1M1hwaS9LWXJjQzFaajFDQzdW?=
 =?utf-8?B?NUxiTUNmc2Job28wbFo0L2VDSmVxMGRhVkxlOWRVWjY0ZDQvR3hkOVFBQ3Nv?=
 =?utf-8?B?QTNhSExCUGQ3blVZV1BIMjdPV093UmdzY2JzVEErQUk4SEwwclEzcDlobGcw?=
 =?utf-8?B?M1piVHZlclUvUXlCNW9HalBVRXpYdWJQQXJNbTlYVTM2TnlQanlzb0IxZVZO?=
 =?utf-8?B?NldXa0ptTGxpcXhTTEhxb3ZzMmdIUjZ2NFBaQVJiTUkrMUpaQVJhRzgzSXlm?=
 =?utf-8?B?UFhveHRSMlF0YXpoZ2l3dnJqL3h2cWVNUUVuMlBvdUsxcS9FMGpicDAzMENa?=
 =?utf-8?B?K0RuZ2o2d1NnWFFoWE5ZdG9WSzJuaW16L3lFRnBOTHRWWTRrVlF2L3FORlZP?=
 =?utf-8?B?MjhCcVYzajVPcHlrTGVoQmZOUkc3OEpYeVFKOFJFV0lBRGR2b25HdTdqT0Q4?=
 =?utf-8?B?disxYjh1UEZXd1F3RUFhdTZNNzh0QkdZTHE5Wi8yOHpiT1pTWDVKL0duNnRX?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78919968-5422-4a98-8e21-08ddd67116ae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 11:45:36.0406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3zNYsGE7/U7QPD7QkCCe0Xks8gIElk5Bf5BUvTg6696HUxN8p2B5zt+HNpT9waGLW8oxkkHXHhEFtPsG/MBpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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


On 08-08-2025 11:07, Riana Tauro wrote:
> Hi Karthik
>
> On 8/7/2025 7:36 PM, Karthik Poosa wrote:
>> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
>> powerX_max, to the maximum supported by the pcode mailbox
>> when sysfs-provided values exceed this limit.
>> Although the pcode already performs clamping, values beyond the pcode
>> mailbox's supported range get truncated, leading to incorrect
>> critical power settings.
>> This patch ensures proper clamping to prevent such truncation.
>>
>> v2:
>>   - Address below review comments. (Riana)
>>   - Split comments into multiple sentences.
>>   - Use local variables for readability.
>>   - Add a debug log.
>>   - Use u64 instead of unsigned long.
>>
>> v3:
>>   - Change drm_dbg logs to drm_info. (Badal)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical 
>> power")
>> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index f08fc4377d25..a43bc8b91fea 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>       int ret = 0;
>>       u32 reg_val, max;
>>       struct xe_reg rapl_limit;
>> +    u64 max_mbx_power_limit = 0;
>>         mutex_lock(&hwmon->hwmon_lock);
>>   @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>           goto unlock;
>>       }
>>   +    /*
>> +     * If the sysfs value exceeds the pcode mailbox cmd 
>> WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
>> +     * max supported value, clamp it to the command's max (U12.3 
>> format).
>> +     * This is to avoid truncation during reg_val calculation below 
>> and ensure the valid
>> +     * power limit is sent for pcode which would clamp it to 
>> card-supported value.
>> +     */
>> +    max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power) 
>> * SF_POWER;
>> +    if (value > max_mbx_power_limit) {
>> +        value = max_mbx_power_limit;
>> +        drm_info(&hwmon->xe->drm,
>> +             "Sysfs value for ch %d %s exceeds limit; clamped to 
>> supported maximum\n",
>> +             channel, PWR_ATTR_TO_STR(attr));
>
> Why semicolon here?

Used it as I've joined two statements here. This should be okay.

> Expand ch to channel. Unnecessary to mention "Sysfs"

Line was length exceeding 100 chars, so kept is as ch.
Sysfs is a comestic change, I shall take care of it during merge.

>
> With the above changes
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>
>> +    }
>> +
>>       /* Computation in 64-bits to avoid overflow. Round to nearest. */
>>       reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << 
>> hwmon->scl_shift_power, SF_POWER);
>>   @@ -739,9 +754,23 @@ static int 
>> xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>>   {
>>       int ret;
>>       u32 uval;
>> +    u64 max_crit_power_curr = 0;
>>         mutex_lock(&hwmon->hwmon_lock);
>>   +    /*
>> +     * If the sysfs value exceeds the pcode mailbox cmd 
>> POWER_SETUP_SUBCOMMAND_WRITE_I1
>> +     * max supported value, clamp it to the command's max (U10.6 
>> format).
>> +     * This is to avoid truncation during uval calculation below and 
>> ensure the valid power
>> +     * limit is sent for pcode which would clamp it to 
>> card-supported value.
>> +     */
>> +    max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> 
>> POWER_SETUP_I1_SHIFT) * scale_factor;
>> +    if (value > max_crit_power_curr) {
>> +        value = max_crit_power_curr;
>> +        drm_info(&hwmon->xe->drm,
>> +             "Sysfs value for ch %d exceeds limit; clamped to 
>> supported maximum\n",
>> +             channel);
>> +    }
>>       uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>> scale_factor);
>>       ret = xe_hwmon_pcode_write_i1(hwmon, uval);
>
