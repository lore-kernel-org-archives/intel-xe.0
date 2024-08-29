Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE32DCA0EC8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 23:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A53810E7B9;
	Thu, 29 Aug 2024 23:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Op4t3/lG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3F910E7B8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 23:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724975179; x=1756511179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E1Fkbw5FAnVUF69XZc2X7uflblYoNs7PD9yWEisa2I0=;
 b=Op4t3/lGBf/8TAtpq3WdnM/i8ozj7y+xYlhOx2cgoe+73DPJ/zRSOLCE
 Ko/jljaTX4WIjGdaB6kXvIsOWPEJI30ZIWxwKHY6SrEqTTM7sKgDeyO14
 +Zi4uxpyqBrHNYuQPeG4zY2PT2fRT4lrK3v+/BHnj1KUmX1dbQcvT5HrQ
 rC1oZbpzfyqwI5/OW7P46vGPuNw/aBlVNkp78OKw4EBpJOtl63Ll2KWES
 qdo2Sr2wGOAWKX/bO6WN5NEPcEGzLH+zm0HHEaSJ1ouspMtxpzLur+RQj
 Zlu89OnKnI00YEfNfPkEUZIghVyqHQE7hL4iuxT1sJmiL/5CzmfMZYN6O Q==;
X-CSE-ConnectionGUID: FrPL3/6kQWGp9vlw46vqtw==
X-CSE-MsgGUID: ij/jThdJSHGLifg/RpfiJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="46113265"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="46113265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 16:46:19 -0700
X-CSE-ConnectionGUID: tqKBuwpVToGOhIMHkIvsLg==
X-CSE-MsgGUID: EYSnQQBCQwK5ZbBySkxmBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="64071292"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 16:46:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 16:46:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 16:46:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 16:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut6eQ82tDouCZFtGUo4Z0mGNVg+ARkAK/dhkkL+s9nu4GbNP8/LHKW0P4wvvw0OzuVP6C37TnpYR01EMzsmmrnPV8mJjW3lUbYUTJW9rxozV4pKUfd19Oec5L58pCXE9Ik6GL1ILDVic6qQcdof+ThSnibok3rXrkmvmGdoDp6GZYGmqn7ORApYtqhXsExsM9YyXb168R1UqQN6s1T2TDVTbyOW21pB1Xgzz2GOMCpumeZXk3u1+x2R4voMrKVF3KE3w2+MnH/juSFWTaM96wjT9RCIQ8M/pUlVy2q97RberrndpEednAcrHT0mC952XVapWRbekYUgJeewR2EQQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OuLLjdTI3jxRyXqXQno+vgt1XPpm1I9Zb4G7duwcpo=;
 b=MICu89LZ6XuEOz31bjcecTney9/RyHK0IJ8dbSMnrFsNb93S545Bnpj77BOtd54EiDl5T+2rDXIZa29qp4q3aCNfRlHuXLQvx1NJa3AK7nK5tsdQ0IjoJZwKTupBqdEVqwNNYsWljL53TbR20/sDfZGk7GhBEBuYChm2sRXCmCy+BBoZ5ghIfZD3tswnCehxyxTf8GJ4Uyb5j5c4RhFmq3YtBOXfQ8ZXmVanb6kxbOnpd4/44DD2in7FpQUNM8SmukEOnOTDn8+645XjfKh6Welk9nYUfw+66ZJZAoFe2TLP17QJl6Ldq94XfEkBSPCnacnwKxzIojdB+/4Inu2dKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 23:46:11 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7875.019; Thu, 29 Aug 2024
 23:46:11 +0000
Message-ID: <da3e010b-d97f-418d-ae43-14bb7e952f94@intel.com>
Date: Thu, 29 Aug 2024 16:46:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <Zs92YdWa0tjkdHE1@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Zs92YdWa0tjkdHE1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f11b17d-4c12-409c-0fc9-08dcc884c2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUIrZ0V1U1MveXk5NURRN1NaVmRDeWZJMHp1aTFaYXVlYkhrQVNxeWU1bmpw?=
 =?utf-8?B?NzBDWWNublJFcVFTdlJCRm1IaHFoNGlTaGFiQUF5VldPNVpZdEkwdGdpVkpo?=
 =?utf-8?B?Vm1nQVB2K1JpQmUwWkdrS2VpbFpXZkFndTZiYy9RVk55Z3lwWnREWVRTb09J?=
 =?utf-8?B?TjMzcnRhZzFSNFZFano1blZGMDhXRGs4bGF0ZTNsTjM1WGNqblV2dE9YL1hy?=
 =?utf-8?B?TnVWcjA2Mi9kNXJxRmhxZUI4Y3BUOHlIeWhNbkpjbVBXTFphWFZSN2VuVVNx?=
 =?utf-8?B?ZzRSTDMxZi9wOCt3T1N0QkVSZDU5NjEzNEN5ZStleFBrUWxweXBtaFRKcktM?=
 =?utf-8?B?T1J0T09RWWliT1o0YTg4YUlCUFZ0Ny8xMEUwUUloR0VxY3FaQnJ6NXhOU1V4?=
 =?utf-8?B?RzVUR1RFRm1NYkhxTzJJUFZodHBiakkwNjBidGdvU1l0ZnpnWWV4YmQ4a0Yr?=
 =?utf-8?B?MnMwRzNsNjZzc2U3VENhWEZnRGVQUWRkTm8vckk0cy9WY0ZiUm92dkpab3VQ?=
 =?utf-8?B?VFltUVpoWWNvZmhDWkczRHpwYkthUldvWmNHblYzNWJOd1pJR2hiZjV5RGlG?=
 =?utf-8?B?Y0tvOVRFdDV1UkVrbEt6NFJtUE41ZFhFZjl3STM0S280akl3bmtRbjNkeXpZ?=
 =?utf-8?B?TnJHaDNsd3lFRnJVcDUzZVRKS2N3T3FhV3pOWGJDdDYwbExLZ3NUejUveFdk?=
 =?utf-8?B?OFU0aU9NOHNzS3hLQWtFdGc4Z010UitQTEV1N2JKd0VsL0Fzalp0SzYwdWdS?=
 =?utf-8?B?OHB4VXpUYXdMNnIwa3BQckhtK2podmduT0lMMllkM05QMlROZng5cUw5RHR4?=
 =?utf-8?B?ZVBleEdJMTI0b0JJTTBwRkV2SWMvRXhaZ3AzVklzWCsxOUl4aDBrTE5JaU1a?=
 =?utf-8?B?alVWVllIWVpFWHBmYmJETU5JdXNpcnJ2SWxkVTlTVXYxeWxYNGdZR1VzdWVD?=
 =?utf-8?B?VXptTDY2RjYvWmRjV21JUnk2ZkxySDFveHJvdTk5bTQxQXYrRUlaUG5zMlZR?=
 =?utf-8?B?dnFMWSs2R3ZiN2pkaGNOTlBDc1VTbzJtUXNvalpMdEt5QXY3dTVZekJXVjdU?=
 =?utf-8?B?UGZsTjRJV0VtUlJIdG9oR2F6RzV3Mmt2d3JDOWt0aUNqQmpBRnNTRlN3U0l4?=
 =?utf-8?B?d3ZIRllPN01aaDB0dDNhelBnZWdMNXk1S1phRmxFNElYZitreEhmQzBXTUlx?=
 =?utf-8?B?bFdJRzE0aElSeC9BSWlXWnBKMW1pUG05Y3FwM21lYXZuNzc5bFdqNHlnamxi?=
 =?utf-8?B?Y0VQbElidzd0UkJkc2pYRGtvK0Y4cnZyWlVnQXduSTV1YkxhVHhWeHN3WUJV?=
 =?utf-8?B?VGxTT3h2N0NPOGM4a3BJMkJtQnF6ZGZNM01HZXhxU09IaWlGa00xc0QwQlpY?=
 =?utf-8?B?U0J6RTh4R3Nud20weGYvTVF6WmNIcEUxcDY5RjMrd0pmYytkMUpmbzhGc05L?=
 =?utf-8?B?Zy8xdHU0SGJTS1l6WnBNdTFpUk1EdjlnZUlwdGFTcys0OVI5QUZPdEtNN0lJ?=
 =?utf-8?B?NCtwcmc4dURQZTBSWmdiREtRZmI1a3I1YnBaeEJMNWlQWWxlNUMwQ1ZUVlR6?=
 =?utf-8?B?Sk5jTTcwWFd0N3lMdG9waStMeG1SNGdCbWd0WlYrQkRMNldEZzlDMFF1SUlH?=
 =?utf-8?B?UWd1T21oaEptbmpLVFdsMkpDdG9yaTZZb2NPSVdKSUwvejRTWVlONFFtWXFF?=
 =?utf-8?B?cFNwT2dQNDdlOE1hSFI5dmxYUTgwUlY1SllBR0RZckNLeDVGYjgwdSsvVU9G?=
 =?utf-8?Q?TmgI03BdntZQozhl4c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXhlMXpyQU8vUlJ4YWg4cXp6MThVb2Q4U0VTZzhGS3hoQU5keHJYek83QTk3?=
 =?utf-8?B?WU80Y1FuWTc1Q2lrbzdqbHUwbUJld2I2L09OVDdBTGRPRkd2ZlgrUkFKL3hS?=
 =?utf-8?B?ejdobXR0NXlRVFRNNHJabmJFcHFveXpCZVJtRnpuZUwzeXh1WnpGK0UxQkJq?=
 =?utf-8?B?dkRJaFNXd2NvVWRWUjBWL1RCbVBJZTVtbHZoQkhnRzFDSWNJL0RYZXBJanFm?=
 =?utf-8?B?VXJDaFpRTHhHRGdRUURZRE9pL2wvTWk4QitIdTdkYWFlNHhOK2lRZ2Zoenh6?=
 =?utf-8?B?Q2xrOVdYZVl3V3htWE1TUU1lOGVRWUVDTEF4RzdwSm03bUswSTFIK3JoeWFL?=
 =?utf-8?B?SGYycXRmYjdBWmwweDdIYS9xQ1JmOVduLytpOGpLZzIxQzBTcm1CWEtyZTZB?=
 =?utf-8?B?eksvV1N6ckh1ZWVwMFRwZFZYTlpnU3llOHVKcFhlWkVZV0hUa0FVSnZmbTdq?=
 =?utf-8?B?QjFXUXdlWEtaZzgraTNVV29PU1N6M2RidU51VXppSnNNUURYYVUzWktMcXNL?=
 =?utf-8?B?V3ZmSk5TM0NaNWhwSXR5WnRkTU5TNWNiRGpnSzBtWTV3NUdFakNuQzlvTzNy?=
 =?utf-8?B?YlhYcTBLTnhtUnBqQS9wZjZVMXNTelpGUWU0dHg0QU1DRFFrWWlKVlVyN0l6?=
 =?utf-8?B?UStOWGN2cFF5YW1IOFZtMWFucEFRdmNDcEpnQVdLSXdWcDl5WE9EZUJ4UDVm?=
 =?utf-8?B?aSsrU29MTEp2ZVl1dWQvb0ZlQ0UveTQ2NFRZQlpQVFdCWjRoYVN0M1hDZTZz?=
 =?utf-8?B?ekJDS3pmOW01WjVwZGtsQ0NJN1daSE9wZGtObXNML3l3bjl2R3pMaVBjNFFS?=
 =?utf-8?B?d1RUYkpIekhlemVwcmJuYnRSQnMvbU1lSkh3dTNOYzduRGtrVHk5blBkWmpH?=
 =?utf-8?B?NHVjSlh1bjhTK1haeWtXNFFWMytBM1pVdjhVUXJNZndLcG84YlVOV3h3YTda?=
 =?utf-8?B?RWxhQVg4VTBLWFNTYjZBY0dSVnhvbzJUTGpaTlZ1NXVsYy9sUjFoWXNSdmV4?=
 =?utf-8?B?aXh1WFdZVWhWVm9qSW54ekxDczMyclY4SSt1TU4rK3VIYzBOeFhXVjRWSXFh?=
 =?utf-8?B?S0szNHk4Sm4wN0VyR2ZlUkVBOUZGTnA1bWc4M2tKeDFRcXk5SWFZV1Q4em1x?=
 =?utf-8?B?Q3phMFphSko5Sml5ck5NbGtDZDVVOUp0ZFVaSzRqZGxEMjE1QWhJUEZZbHBC?=
 =?utf-8?B?SWJFeS8rS0lvYlNOY1NJaER6cDZzQUd1RWNKY2FFU2Y5OTFPVDYxVldyZ05z?=
 =?utf-8?B?cVpVbVVrWmVFNzZhZ29VSWJCczNzRU92bTYrZGRCWmJTMnBxdU1MdS92N1Yw?=
 =?utf-8?B?M1VpV3ZwWFMxRFdIZWdzeWZ5R1hHSXFYQVhYcWthRnNNdkJDSExSTkQ2MDZm?=
 =?utf-8?B?K2pYQjIzOHpsTEVGRW5YLzVTZUxsWlp4RTJHVEY1N0k1UmxNbFlyWjZJYjYw?=
 =?utf-8?B?eGxKNWNuOHhLdVdGYVoxem9XQUlHQk9VN0xaSlF3UUs0UWxHTndlUGdhSFRu?=
 =?utf-8?B?TUdjc3BUMU1nQTBESjlpYkdXejFodWtvUmtZeXNkYXZLT1FHMTlsQUV2R1Uy?=
 =?utf-8?B?Zk9Ub0FCT0JpSWFocEdsUVFqRmtDTmdCMTc2QWNZRTlTQnpUZFpyNlMyUHd1?=
 =?utf-8?B?SVQwTTh1M2xqOGhSc0poZTY0dzk0Z2NXKzQvYWR6aXlBbGwwU3FFenZaRGc0?=
 =?utf-8?B?ZFlkeW1SUlUydUZaZ2xQa25nOEFWeTlhbytSVW5Qd0EzTjF6NFZjT215UTU4?=
 =?utf-8?B?Q2x0R3UxcjNGdURUKzZUL1BURkhVME45SWZwMmZ1SC9IcmZncW5oeXlGMUhH?=
 =?utf-8?B?L01TYmNISllTaDVkT1JwRFpPanplRE5jMFhBWkhGSDRyUFZMbEllVDJjbFJj?=
 =?utf-8?B?TU11MWJvaXYxZzFYNU9iMk9xUW82bWgzOFNWVVc1VTIrTnpIZ1orckNqZUg1?=
 =?utf-8?B?UlJ0WmwrUC8yaXBvVWtzcW1iY1lPM1ZObnJFNXNyNmpQU1pvSzlxTUx1c1ZZ?=
 =?utf-8?B?RHV0OWhqWGZGM1kwSkErdlF5VXdFaEtGbTdjNnlWam9XZVlzM0NPWDNmTTlI?=
 =?utf-8?B?cVl6cVB6djBRVzQ2NVhUNUlhV3RWLzZJdlNNRlNSdlVuNmlsZk5MVGRXUnoz?=
 =?utf-8?B?ODBiSVIvT1FSTFlSQ0k5V2tvb2dQano5dnEwYmVhdzFabVFZR21FWEFYTmhu?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f11b17d-4c12-409c-0fc9-08dcc884c2ed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:46:11.2859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HhtBi9Dtz3OgMegbw0XlYCuAKg0cbJN6SrtNZFSnnD5Qgypwg24qAdUQF/VJLG1Mw4gXzZmUSbq0Wv4mVp7r301s4du8THdZ/bfB9eAFDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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


On 8/28/2024 12:11 PM, Rodrigo Vivi wrote:
> On Tue, Aug 27, 2024 at 09:41:04AM -0700, Vinay Belgaumkar wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> Basic PMU enabling patch. Setup the basic framework
>> for adding events/timers.
> probably stop the commit message here..
>
>
> This patch was previously
>> reviewed here -
>> https://patchwork.freedesktop.org/series/119504/
>>
>> I have included the s-o-b names from that patch here.
>>
>> The difference now is the group engine busyness has
>> been removed. Also, the patch has been split up into
>> 2 chunks like the timer being setup in the next
>> patch.
> The commit message needs to be an imperative language saying
> what the commit is doing and why. Not the history mixed like this.
ok, wanted to clarify the history.
>
>> The pmu base implementation is still from the
>> i915 driver.
> perhaps this is also relevant...
>
>> events can be listed using:
>> perf list
>>
>> and can be read using:
>>
>> perf stat -e <event_name> -I 1000
> is this relevant here?
removed.
>
>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 +
>>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_gt.c           |   4 +
>>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>>   drivers/gpu/drm/xe/xe_pmu.c          | 546 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h          |  28 ++
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  63 ++++
>>   include/uapi/drm/xe_drm.h            |  34 ++
>>   9 files changed, 688 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b9670ae09a9e..05edccd85413 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -264,6 +264,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>   	i915-display/skl_universal_plane.o \
>>   	i915-display/skl_watermark.o
>>   
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>   ifeq ($(CONFIG_ACPI),y)
>>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>   		i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index b6db7e082d88..978eca47cbc8 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -748,6 +748,8 @@ int xe_device_probe(struct xe_device *xe)
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_sanitize_freq(gt);
>>   
>> +	xe_pmu_register(&xe->pmu);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4ecd620921a3..eb34f4ee7d6a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -19,6 +19,7 @@
>>   #include "xe_memirq_types.h"
>>   #include "xe_oa.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> @@ -483,6 +484,9 @@ struct xe_device {
>>   		int mode;
>>   	} wedged;
>>   
>> +	/** @pmu: performance monitoring unit */
>> +	struct xe_pmu pmu;
>> +
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/**
>>   	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 08a004d698d4..097a32ec807d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -844,6 +844,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> +	xe_pmu_suspend(gt);
>> +
>>   	err = xe_uc_suspend(&gt->uc);
>>   	if (err)
>>   		goto err_force_wake;
>> @@ -898,6 +900,8 @@ int xe_gt_resume(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> +	xe_pmu_resume(gt);
>> +
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   	xe_gt_dbg(gt, "resumed\n");
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 923460119cec..a95c771e7fac 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,6 +11,7 @@
>>   #include "xe_drv.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>> +#include "xe_pmu.h"
>>   #include "xe_observation.h"
>>   #include "xe_sched_job.h"
>>   
>> @@ -78,6 +79,10 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> +	{
>> +		.init = xe_pmu_init,
>> +		.exit = xe_pmu_exit,
>> +	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..33e7966f449c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,546 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int gt_id = config_gt_id(config);
>> +
>> +	if (gt_id >= XE_PMU_MAX_GT)
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	ret = config_status(xe, event->attr.config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>> +	const u64 config = event->attr.config;
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	u64 val = 0;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (pmu->closed) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +again:
>> +	prev = local64_read(&hwc->prev_count);
>> +	new = __xe_pmu_event_read(event);
>> +
>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +		goto again;
>> +
>> +	local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return;
>> +
>> +	xe_pmu_enable(event);
>> +	event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +	if (flags & PERF_EF_UPDATE)
>> +		xe_pmu_event_read(event);
>> +
>> +	event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (flags & PERF_EF_START)
>> +		xe_pmu_event_start(event, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +	return 0;
>> +}
>> +
>> +struct xe_ext_attribute {
>> +	struct device_attribute attr;
>> +	unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_ext_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf)
>> +{
>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +	.attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = xe_pmu_event_show;
>> +	attr->val = config;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +	     const char *str)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = perf_event_sysfs_show;
>> +	attr->event_str = str;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	static const struct {
>> +		unsigned int counter;
>> +		const char *name;
>> +		const char *unit;
>> +	} events[] = {
>> +	};
>> +
>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +	struct attribute **attr = NULL, **attr_iter;
>> +	unsigned int count = 0;
>> +	unsigned int i, j;
>> +	struct xe_gt *gt;
>> +
>> +	/* Count how many counters we will be exposing. */
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +
>> +			if (!config_status(xe, config))
>> +				count++;
>> +		}
>> +	}
>> +
>> +	/* Allocate attribute objects and table. */
>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +	if (!xe_attr)
>> +		goto err_alloc;
>> +
>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +	if (!pmu_attr)
>> +		goto err_alloc;
>> +
>> +	/* Max one pointer of each attribute type plus a termination entry. */
>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +	if (!attr)
>> +		goto err_alloc;
>> +
>> +	xe_iter = xe_attr;
>> +	pmu_iter = pmu_attr;
>> +	attr_iter = attr;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +			char *str;
>> +
>> +			if (config_status(xe, config))
>> +				continue;
>> +
>> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +					events[i].name, j);
>> +			if (!str)
>> +				goto err;
>> +
>> +			*attr_iter++ = &xe_iter->attr.attr;
>> +			xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +			if (events[i].unit) {
>> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +						events[i].name, j);
>> +				if (!str)
>> +					goto err;
>> +
>> +				*attr_iter++ = &pmu_iter->attr.attr;
>> +				pmu_iter = add_pmu_attr(pmu_iter, str,
>> +							events[i].unit);
>> +			}
>> +		}
>> +	}
>> +
>> +	pmu->xe_attr = xe_attr;
>> +	pmu->pmu_attr = pmu_attr;
>> +
>> +	return attr;
>> +
>> +err:
>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +	kfree(attr);
>> +	kfree(xe_attr);
>> +	kfree(pmu_attr);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +	for (; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +	kfree(pmu->events_attr_group.attrs);
>> +	kfree(pmu->xe_attr);
>> +	kfree(pmu->pmu_attr);
>> +
>> +	pmu->events_attr_group.attrs = NULL;
>> +	pmu->xe_attr = NULL;
>> +	pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +
>> +	XE_WARN_ON(!pmu->base.event_init);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	/*
>> +	 * Unregistering an instance generates a CPU offline event which we must
>> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +	 */
>> +	if (pmu->closed)
>> +		return 0;
>> +
>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +		/* Migrate events if there is a valid target */
>> +		if (target < nr_cpu_ids) {
>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +			xe_pmu_target_cpu = target;
>> +		}
>> +	}
>> +
>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +		pmu->cpuhp.cpu = target;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
> let's already add doc for the exported functions?
sure.
>
>> +int xe_pmu_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +				      "perf/x86/intel/xe:online",
>> +				      xe_pmu_cpu_online,
>> +				      xe_pmu_cpu_offline);
>> +	if (ret < 0)
>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +			  ret);
>> +	else
>> +		cpuhp_slot = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +void xe_pmu_exit(void)
>> +{
>> +	if (cpuhp_slot != CPUHP_INVALID)
>> +		cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	if (cpuhp_slot == CPUHP_INVALID)
>> +		return -EINVAL;
>> +
>> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +}
>> +
>> +void xe_pmu_resume(struct xe_gt *gt)
>> +{
>> +}
> likely good to avoid blank functions and only add them with its usage.
ok.
>
>> +
>> +static void xe_pmu_unregister(void *arg)
>> +{
>> +	struct xe_pmu *pmu = arg;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	/*
>> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>> +	 * ensures all currently executing ones will have exited before we
>> +	 * proceed with unregistration.
>> +	 */
>> +	pmu->closed = true;
>> +	synchronize_rcu();
>> +
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +	perf_pmu_unregister(&pmu->base);
>> +	pmu->base.event_init = NULL;
>> +	kfree(pmu->base.attr_groups);
>> +	kfree(pmu->name);
>> +	free_event_attributes(pmu);
>> +}
>> +
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
>> +
>> +	spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +
>> +	pmu->name = kasprintf(GFP_KERNEL,
>> +			      "xe_%s",
>> +			      dev_name(xe->drm.dev));
>> +	if (pmu->name)
>> +		/* tools/perf reserves colons as special. */
>> +		strreplace((char *)pmu->name, ':', '_');
>> +
>> +	if (!pmu->name)
>> +		goto err;
>> +
>> +	pmu->events_attr_group.name = "events";
>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +	if (!pmu->events_attr_group.attrs)
>> +		goto err_name;
>> +
>> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +					GFP_KERNEL);
>> +	if (!pmu->base.attr_groups)
>> +		goto err_attr;
>> +
>> +	pmu->base.module	= THIS_MODULE;
>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>> +	pmu->base.event_init	= xe_pmu_event_init;
>> +	pmu->base.add		= xe_pmu_event_add;
>> +	pmu->base.del		= xe_pmu_event_del;
>> +	pmu->base.start		= xe_pmu_event_start;
>> +	pmu->base.stop		= xe_pmu_event_stop;
>> +	pmu->base.read		= xe_pmu_event_read;
>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> +
>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +	if (ret)
>> +		goto err_groups;
>> +
>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>> +	if (ret)
>> +		goto err_unreg;
>> +
>> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>> +	if (ret)
>> +		goto err_cpuhp;
>> +
>> +	return;
>> +
>> +err_cpuhp:
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +	perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +	kfree(pmu->base.attr_groups);
>> +err_attr:
>> +	pmu->base.event_init = NULL;
>> +	free_event_attributes(pmu);
>> +err_name:
>> +	kfree(pmu->name);
>> +err:
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..eef2cbcd9c26
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>> +void xe_pmu_resume(struct xe_gt *gt);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..ca0e7cbe2081
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +	__XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
>> +
>> +struct xe_pmu {
>> +	/**
>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>> +	 */
>> +	struct {
>> +		struct hlist_node node;
>> +		unsigned int cpu;
>> +	} cpuhp;
>> +	/**
>> +	 * @base: PMU base.
>> +	 */
>> +	struct pmu base;
>> +	/**
>> +	 * @closed: xe is unregistering.
>> +	 */
>> +	bool closed;
>> +	/**
>> +	 * @name: Name as registered with perf core.
>> +	 */
>> +	const char *name;
>> +	/**
>> +	 * @lock: Lock protecting enable mask and ref count handling.
>> +	 */
>> +	spinlock_t lock;
>> +	/**
>> +	 * @sample: Current and previous (raw) counters.
>> +	 *
>> +	 * These counters are updated when the device is awake.
>> +	 */
>> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @events_attr_group: Device events attribute group.
>> +	 */
>> +	struct attribute_group events_attr_group;
>> +	/**
>> +	 * @xe_attr: Memory block holding device attributes.
>> +	 */
>> +	void *xe_attr;
>> +	/**
>> +	 * @pmu_attr: Memory block holding device attributes.
>> +	 */
>> +	void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index b6fbe4988f2e..de6f39db618c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>   	__u64 reserved[2];
>>   };
>>   
>> +/**
>> + * DOC: XE PMU event config IDs
>> + *
>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>> + * particular event.
> is this entirely accurate? I believe we changed the name from perf to observation?
Will update. Might be better to list using sysfs interface as per 
comment from Lucas as well. Will add this doc to xe_pmu.c instead.
>
>> + *
>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>> + *
>> + * .. code-block:: C
>> + *
>> + *	struct perf_event_attr attr;
>> + *	long long count;
>> + *	int cpu = 0;
>> + *	int fd;
>> + *
>> + *	memset(&attr, 0, sizeof(struct perf_event_attr));
>> + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>> + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>> + *	attr.use_clockid = 1;
>> + *	attr.clockid = CLOCK_MONOTONIC;
>> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>> + *
>> + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
> is all this still accurate and all that is needed?

Will remove, no more group engine busyness now.

Thanks,

Vinay.

>
>> + */
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>>   /**
>>    * enum drm_xe_observation_type - Observation stream types
>>    */
>> -- 
>> 2.38.1
>>
