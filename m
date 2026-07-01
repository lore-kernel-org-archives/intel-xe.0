Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1534CC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A61010E2E3;
	Wed,  1 Jul 2026 05:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYbG2Hzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998E710E2E3
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 05:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782882115; x=1814418115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xTXWKAPJ8v5eRmXv6MfCXyAH0YBntCOk9HCeI7Aifbk=;
 b=FYbG2HzdDcRfOUn6PLLP41KCRp3Ot7qBq11gRrSXHCVT9IhjpzdXXsTG
 qFmtMbpysJHvU+/+byX2b66IRGdF+l633mMuMSxRj3J8Z4p8qiLf07R8M
 fwk/NsR6YOZNyHXw3mvK2FLIL+/DxWoIssJWdRYUpGG64euXTi3p9g0Q2
 oMi5K1B0kFD7SNvAYbfDhNHuSrsK3GesCIQ3E3tMcaYPcXpE8ZwRbxPKI
 A9HTQX6HVsX6ia5zuXuts84rwcZ5CVr9ScacHsXewFS215dQiewaBPOaY
 QjEBKLfe568sTWDyjXBcXUPGrZDfuWAazwbCyEzE/AgWcNxY3bAwK7enW w==;
X-CSE-ConnectionGUID: AsFl2wqPQDqwGr2T9YsETg==
X-CSE-MsgGUID: YggeaHf1RKyw/xjjQabmdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83380690"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83380690"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:01:54 -0700
X-CSE-ConnectionGUID: mUcDUhgGRGq+fLCBBkn7iQ==
X-CSE-MsgGUID: 11YdP0LPSNeJDvE3xxcZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="254377125"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:01:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 22:01:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 22:01:53 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 22:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKyMHS04TRAKQLXqIekPm9GACVnnM5x7UrZCoXPEshzVhwrC+Vaz90I45JCJJZT4t6jwzwHqqFyzmYGIbFbXcIJBY6gEZdJH6JNeqForCv/5SESrKEX0mf/G0D8F3dluFB5FpVRQDUFEA9TYtbEQY38QN9Mk9TOfIqsmKfGhB/VeZ0+MYG3hL6ftMKida/X46N8e8bA3fv7byTo6koa/jNDb6fR3aQK/+NTiSGN3xVQOdLdjBJi9olZYqulnKTu6zm3HJMC8F0PQTQsCysk7k+DQVSEk51qwUic2u8juSWQvpHRkUB3qpu5ZgrWk5lwgpW9192Xdk76I5vr8u2pVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7oCYhqchPK5zJ2SfesjN7qJywg5uDo+BPqG/kYlRyo=;
 b=ym1ayhU5qVeh6NR7G/qg6sbJSsZ8lTlV5SqA/Os0E8f0wo1oEEAD7UOnEEj8QGwaIpCGFXbwlX+IYWfs3xUkZoPEvvwh+Spq3y0afzWRSFpjv0PGd/SF53ynuU7/VAHuKqOgButkDHvFjVqYilz6GIO0On7i6ElK7KhWgzM0DP2qGsZ7Z9wYvkWLemyKJUakGQbcW5RNwOj6RSfpj4LqdiNqgu8QjgH8PjiNDFmaDZOsAwhwVp1arC7HxMdkVvXP2MY7sPmhbfh/oa+ANB4+nyFUw1kAW+9BSbNYUtncNBf5p2RJ1U2yHw+IMwb1k/h4yjowHbcQCoE62f90YzInSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 1 Jul
 2026 05:01:50 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0139.018; Wed, 1 Jul 2026
 05:01:50 +0000
Message-ID: <8f11d7bc-e9a3-4476-9b1e-fba35eadd15a@intel.com>
Date: Wed, 1 Jul 2026 10:31:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
 <20260619114018.667995-3-karthik.poosa@intel.com>
 <IA1PR11MB64184D94FBA0BEDC0D4BB166C1EF2@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <IA1PR11MB64184D94FBA0BEDC0D4BB166C1EF2@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0311.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab95bb8-44fa-409c-5d4b-08ded72ddc01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|6133799003|18002099003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: 38cmqiTn+BmPH6GpFJVWxRCjcLfz5wlPQAoMZT980FbutJZllGlcSoq7JITKGWc5HTmD8RKgroFdP3Bvq1Vk9LdOJRLo0dbbB9bmHARWJSiL17YYse9vUMRrlLOvXf1dA70zShtPKGXg5sVmAqkRZ92Sfq7PmsUZ1yOgIWzKnnjYbBJFNwL1dTVkKs56JWLNoIXm+oOIw0RVWA+C7QaviW/wZbUp/1rFvzL+CdGx8ZhBRhjTe7Q4MFoCxVrnhByI1cI0CIEf3LP+PfYKy73GdDyrUL43U5wVPkFTPl59wA7sRwZLyjeaMxS4gz5lhvBPTN5Tpcem1Do0A6DNdL7mc8FIklsyZxGUul/Hk2L3VM52QNhQ9/nSu1YwqYx9xOgOkNTtyai204CZ1QcezX8iK2fxsBnWviB6fXgyT7xkG3hZzi4ewg3VjCt2cpkT11moWwC2mb50CXkszFJl5e1gGA2PZ/vriTnNr3UJtmx8S1JOUzRb5R5Q6P+/5e6spcAsZnZRYyFcFmX2+EcYUJiNnMLY+nvDpJCJuFH5RqQLbCR7f2mdzK9ai8PznF0L5d91NR9RWfznlynqrzq4yU+yfbWNoQpFQEu4ljOibLEjaRjD1mC+TyePPABwR4A3KFRH/isZTM2zPIPCe45nxcPxdrxWu5ymcaGJL8psoI8muck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFtczRIV3FZZEhMaHRYKzNxaStmV2svQzBUTEk0aGVNdVN5cHAwd1pnRWRU?=
 =?utf-8?B?MnhNaU9xODU2Zno5c1dXN09jQTAxT0Z1elZxU25WeGxwREpJRWdKMVlYZGxV?=
 =?utf-8?B?c0Z4N3o2L29PNUw5cVFIOXNHcklkekhTL0cxbXAyTVpCRnFTWFNHRzd2TUlU?=
 =?utf-8?B?cE83c0Z6ZlNXR2hScExtOHp1SEtucVpPdm95VzRmc2N1dUlzaWZPaXVKWEVC?=
 =?utf-8?B?Mnl5ZCtWUVh0azlUTHFXMGdRb2c1YWxqOWRrOTVFRzBKdDR6MlFXVTh1WUtm?=
 =?utf-8?B?VHFkUEZxUnpWbEl5d1VvMU1ITDMwWGlKemZkdUQzbVBmcmM4Sk1jZ2FRWjhF?=
 =?utf-8?B?bFBjMUZoMnNjdUxST2tCYVV1ZkY5a2QxdVJJWmFFZTltdUNzaUVWSGdyLzNR?=
 =?utf-8?B?Yjh2UDg4OFg3TEdSeXpFMXd6RUtpMmlHNGJ1QkdGeDdnY01uMHZTcHljWkZS?=
 =?utf-8?B?QnZqdVJreVNlYXZFbGp0K3RFTllDalRYOXd1em83RFFXZjhCdDkzd05YSjFL?=
 =?utf-8?B?Qmh0TDExVmhaUmx3aWdqQVpOc1dyVitKTVFnVDZ0QVRIMnZjZkFpRE9zdGNj?=
 =?utf-8?B?RDJWV3VqSjlNTTg5cTNyaWN3emZoZVc1cE5ZWndGZXl4NS9CRXZJdTJTTVhr?=
 =?utf-8?B?L2laSHBnUW1xc2cxOEdESU9Yd09yUldza01WRkdCamhWTE9oZklGZGkzelhH?=
 =?utf-8?B?Y2svRnArYnMxZFpmbTVMV01Udk9OMy9remNnTXhCOHVWQ1gxdzFwZEh2eEts?=
 =?utf-8?B?SHdtMUJnYmxlOEs3eGtMR3piYU91ak96WFFpVHc0d1hpTTd0VThuOWMwbVRN?=
 =?utf-8?B?RDlWc3d1SDlaaTJ6b1M1UDIvNXNwOGFaN0piRGxJd0Y2TE1HTTBwZ0NQWFFu?=
 =?utf-8?B?UGVOY0RoSjNRMHNoblZPQWVrNFRkbDVFT2gweXJ1N0xpUWI0eE5LbzNKRWgv?=
 =?utf-8?B?MVMzUmg3azZFakhjTE1Dd1diMjhISCs0V1lwM3gyQjlSVEp3b25DWFgramF6?=
 =?utf-8?B?RWw4RngwT1FPVkNGREp2WWVhM29jcjBsRVhyR1ZQY0I5bS9yZ29lMDQzTkhj?=
 =?utf-8?B?VnVUMTVaY3BOT1M1bmZjaGttUzBZV3lnTGI0OFFHRWd2RDhyblpXU1V0OHg2?=
 =?utf-8?B?L1JPeW1PQWtkdTNkMlJodVBGbDBaR3dKcm91T2phTUJMSkZCVkllaVZsa0Ji?=
 =?utf-8?B?aWM3YXhiTHVHc2tFK3cxMzJxa3FuK0hQRzVBdHltYUNiT1dIVDBMRkRFYXQv?=
 =?utf-8?B?Yk1XaDZkU29CS1kyd3ZlN0lkeG5mL1BXY2xQdTZCWk9GeHBhR0Fjb29hNEFT?=
 =?utf-8?B?REFZV2NDeThyTEZVWmtEekdSQUk3U2JERmNrRDJGZGMyclkwOFhUdFFmc3RZ?=
 =?utf-8?B?aVFZRnM0SWl4VjZLQWtnOWc1aHk5anNVYVZRWlIzaFB4V0N6NXdCK3FtWnJk?=
 =?utf-8?B?U1pYYWpKbTdIMHVGbHNTQk1PVWw1Qnd2WFlPdEJOMDVyeTdHNE0wTFMyS25D?=
 =?utf-8?B?SnJiZXlOeFc5ckFVeDdOV2dJOUhjVTZjemhhM2twVkFSNmtGSGltUkZjbzdN?=
 =?utf-8?B?RythQ0tSVEsybzhwNFR4ZTFNd2NZVkg1dkpMRzdMNmtpbUMzN1dUWEpvSC9I?=
 =?utf-8?B?RElOV29WOFV1RnVjcEpSeW5lTmNNdHBVcXJDWTlpYzk5T3AwQzJZbFBUY0pN?=
 =?utf-8?B?cERlYVBDQkM3WDB4dTBSUldtUlNoMW1xWDA5WTZma3R1TEZoTjgwdkpwQTBv?=
 =?utf-8?B?M1RFTHhLZCtiMEgwNXdHY1JqMjd3OFpRVjZDTlhEanhtUFJjU3ozTE51Qktr?=
 =?utf-8?B?b3FiUzZHSHlDSkg0OUJBS0RvakpJWTJJTnJrVkRseHVWVytWVXkvNlNyMUts?=
 =?utf-8?B?NzQ2dEhGNjdZcTRuUk1peUdvQW1QdFdvL0VxUnRDbmxtcFNXcXRKNUtKZkdw?=
 =?utf-8?B?cHNIQndEMzdlM1FXT3pvSjdVNHNpS2gzZndQWEt1N2drajF4eGRNczJZcUNU?=
 =?utf-8?B?RnNmUHlsVGg4b2hlZUlxTENON1RVM2ppbVBQanc1U1gyc1UxS0ljR0lkMWtR?=
 =?utf-8?B?YkFKTE1nWXloblM5cUxQQUpjUXk4UzdoeXd6QjY5dms4Y05VWE81ZThBQ0tF?=
 =?utf-8?B?UmxZL2ZyaGVjNDhXQ0U3bkZzdzBUemgzL3ZwOHFVR3VyNkU1b1NmVEg4N3ZV?=
 =?utf-8?B?L0pYak5EVjRGanM0S0czekhSR2FiK3NHRUVsM2ZJVVZQOHJ0TTI3MkRUWXhZ?=
 =?utf-8?B?aHVEWmh4RFRkOVdLOE9aTlZYQzAxamExMTB6ZGZ3Zk04TllWKy92QWdVbUpP?=
 =?utf-8?B?RmRndzFyTUtzK3Q3LzZhb0dweUNtS2FOWjZOR0ZsTnJ5YnkyRzROQT09?=
X-Exchange-RoutingPolicyChecked: CmE6H/xI6y4o8dVhcoHEXOdiAehtpdlRu/R5pPjdJhE2W/TvsPYQSQY+djlQUNpQ7rqn0PNY1/PguMuDU17RKXXrj4O0Fszp2y7/kooDACi/s+BfCnfbciIqwbWUmcGHT4nbMbW7tsXfe0EQv7t+67TAMifrClDYiXwFqdxFOHyu1oaJWAL2WdRmEQTyfJxDaAYu9dUYNkJ+t2PVUgBNaAxjHAINnXtAqEckq9XBDUZKB2p66ksipXgdGoitWcEp6SRK4tjhsAV5Fl/r/XUzOTxHXt3Jpdh+ZMCDPHvK1M6eAhAngFHsi4MIxjzH+o2a6Oq/VGVrrH5KWCkkATNADg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab95bb8-44fa-409c-5d4b-08ded72ddc01
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 05:01:50.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYWaUc0RyaMrMGu4wQ7UQGY55iQqpGdpLqJLeA0VJ2toFZuAhUKMDWyUM+xsBJ+l0P02CbOlVJAl3vp6ZdEBxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
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


On 22-06-2026 20:35, Ruhl, Michael J wrote:
>
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Friday, June 19, 2026 7:40 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>> Ruhl, Michael J <michael.j.ruhl@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; Purkait, Soham <soham.purkait@intel.com>;
>> Poosa, Karthik <karthik.poosa@intel.com>
>> Subject: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
>>
>> Introduce a pcode_info debugfs entry to report pcode details.
>> This initial implementation exposes the pcode version.
>> This can aid debugging when the pcode version is needed.
>>
>> v2:
>> - Enable the debugfs only for supported platforms. (Micheal Ruhl)
>>
>> v3:
>> - Move the platform check out of this patch, as it is not relevant here.
>>    This patch solely enables debugfs; debugfs creation will be determined
>>    based on the return value of get_pcode_version. (Karthik)
>>
>> v4:
>> - Skip creating debugfs entries for SR-IOV VFs, as this is not
>>    supported. (Matt)
>> - Reintroduce the platform check during debugfs creation to prevent
>>    creating debugfs on unsupported platforms.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_debugfs.c | 34
>> +++++++++++++++++++++++++++++++++
>> 1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..cafe3deb04d5 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -31,6 +31,7 @@
>> #include "xe_tile_debugfs.h"
>> #include "xe_vsec.h"
>> #include "xe_wa.h"
>> +#include "xe_pcode.h"
>>
>> #ifdef CONFIG_DRM_XE_DEBUG
>> #include "xe_bo_evict.h"
>> @@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void
>> *data)
>> 	return 0;
>> }
>>
>> +static int pcode_info(struct seq_file *m, void *data)
>> +{
>> +	struct xe_device *xe = node_to_xe(m->private);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct pcode_version version;
>> +	int ret = 0;
>> +
>> +	ret = get_pcode_version(xe, &version);
>> +	if (ret) {
>> +		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n",
>> ret);
>> +		return ret;
>> +	}
>> +	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
>> +		   version.minor, version.engg);
>> +	return 0;
>> +}
>> +
>> static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>> {
>> 	struct xe_device *xe;
>> @@ -221,6 +239,10 @@ static const struct drm_info_list debugfs_list[] = {
>> 	{ .name = "workarounds", .show = workaround_info, },
>> };
>>
>> +static const struct drm_info_list pcode_info_debugfs[] = {
>> +	{ .name = "pcode_info", .show = pcode_info, },
>> +};
>> +
>> static const struct drm_info_list debugfs_residencies[] = {
>> 	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show,
>> },
>> 	{ .name = "dgfx_pcie_link_residencies", .show =
>> dgfx_pcie_link_residencies_show, },
>> @@ -567,6 +589,18 @@ void xe_debugfs_register(struct xe_device *xe)
>> 					  &inject_csc_hw_error);
>> 	}
>>
>> +	/*
>> +	 * Pcode version read from PMT is currently only supported on CRI and
>> BMG platforms in PF
>> +	 * mode, as both platforms support the necessary telemetry read
>> mechanism and have a fixed
>> +	 * PUNIT_VERSION_OFFSET.
>> +	 * Attempting this access on other platforms must be verified before
>> enabling support.
>> +	 */
>> +	if (!IS_SRIOV_VF(xe) &&
> There is an IS_SRIOV_PF() macro, is there a reason for not using that?

IS_SRIOV_PF() returns true if device has SRIOV enabled.
For normal functions without SRIOV support that would fail, so that is why we are explicitly checking with !IS_SRIOV_VF(xe)

>
>> +	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform ==
>> XE_BATTLEMAGE))
>> +		drm_debugfs_create_files(pcode_info_debugfs,
>> +					 ARRAY_SIZE(pcode_info_debugfs),
>> +					 root, minor);
>> +
> Other than that, this looks reasonable to me.
>
> For the patch set:
>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
> M
>
>> 	debugfs_create_file("forcewake_all", 0400, root, xe,
>> 			    &forcewake_all_fops);
>>
>> --
>> 2.25.1
