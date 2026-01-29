Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92A2D73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767A410E1EA;
	Thu, 29 Jan 2026 23:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9ZfnC8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B910E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769728300; x=1801264300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e31wvxsJraiN5jx8IyU2qNOY93BnhfGP5uQXWq+WBxU=;
 b=U9ZfnC8s3T79l75+oJyIanekxQZzFM1fOUMl8uOlK6kjSOIbIwKiJmxe
 /n2yHKhBBRdJSmH3EwXQmN5QRUTQx/MQWMRD5zzvRBxMu5SvARM63zDNV
 fNiPLq9XCp3IKoIIcVS4+CYmJvYfYUBVB8+yfCsE2OsqihSw+x111Rbky
 DDCGq/TeU9TyyGTbhC/c7ZZ/M6CftS/ZiV9XTEsOdCFANtsCRGdj3Fioi
 +GthpC3rY7E7Hq4oTHUDq4h4YdV4sQfzCvSRKmyiGDkCsinVh2Rq1uFa6
 a9aN6sT90sypf7lveJvQiOrIyIE3DoNK/gl5Lp82V7dpSxdo7k1CYDRND w==;
X-CSE-ConnectionGUID: NDuEj/qpREG0y7JD2dm5hw==
X-CSE-MsgGUID: PlNNeDxJSCSfRYrPoTjqKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71017975"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="71017975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:11:40 -0800
X-CSE-ConnectionGUID: wnNT/eqCTf6MFYST9VA4XQ==
X-CSE-MsgGUID: kAztaDbEQrWxS/hHewetOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239429563"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:11:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:11:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 15:11:38 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:11:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDy2xF2hAdmcG8DeZUux8EZKOwnX8xxxP5Y8+UdM0a1kDvnNZRk1cQdoDee6Zk5i7cqXjbtHeCJXLikBdvy4a3lmY1S3vgsTWrZJi7BFy1iG113/8M/8OlNDSpWIfQjaN+uY99hfQmjjq/4GmzjK4CQ6og8z6ERdvANBPN2QZPHtd3g1SNpi/opmKSR08833Fwm6m//rjcFwneJMisc4sGWHJLIGayt3qfbKY1LvAvz32I/M4U9N+9EBoahUGmEYQHL7m7JeIRk/ZO/WtOM3Ti3xdncFVir5ug/C3s0bBSJddvVkObiY3N9oUqR3cjtcY1+s0yhkaWm/2ChXs4jjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxPe5gud2TJUxdwAI7IXiTVxrXa2L5tOM8reXKxoBIQ=;
 b=gO4j+gPDXBsNzK12y+pcRiz4Y/HoomPDcoGTWZAb6i8AK0TyhjL7Y3lr+H46YpZQNiRs2IBKfCk8jM9dX4sp8VMWtyPDM9G6aEVCVTgGKa5dbCUTA/kuZquKZoX2rOHe3BjJGf0D08troizpF8qJ/6HCaR3XpJ7lEx8i4r5Rs0Wn8QcFH+Mcrm3FakaWFU1Bo/nyj7U4M0+52a07xQ5ERLmgvFSMFmjl94V52ZXd5X+9kS8hkMln/ciU+y2cA63TmXond0PLKvZLva7v3KcNkhjYPv+LKDgKvyDNBXV6HMYcBiB/s/W3Si85u04A6G0HsDk2yERGAO0RXfLyT2/3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB7654.namprd11.prod.outlook.com (2603:10b6:806:305::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 23:11:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 23:11:35 +0000
Message-ID: <bcb3d5ae-f4cd-46ff-ad20-cbbc0e44cb64@intel.com>
Date: Fri, 30 Jan 2026 00:11:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] drm/xe/sysctrl: Add System Controller
 initialization
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
 <20260129121044.3670780-12-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129121044.3670780-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8a7341-d575-40fe-d4bb-08de5f8bbf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2RzQW01LzQ5dm5ma1lZRWl1aG9lZDl2TUgrc2RsSGFCdUhSUE1NQ3hSNnpm?=
 =?utf-8?B?aGFhVklRaEN0TEhvN2V1ek5IdWpxSUtwVG5XemQwWm9vanpIYmQzM09PWmNx?=
 =?utf-8?B?RTRaTnNwUitsVFo3K3J4WWswb3JaN1R6T2MyZzNXZUN0MXo2MmZTS2dnS2dQ?=
 =?utf-8?B?M3JNZEd6UnFoYUdtdnlCT2lIb3FRUG85ZzVPMWVwS21TYVl4TEZLaCtjaGlq?=
 =?utf-8?B?R3RGOWpmdXNKN0ZISWRuUGx5M1J0ZG9DazJuTzUwaHJQUlJzMFdaV2FwYjUr?=
 =?utf-8?B?T21IYlo4MXpLZFFzdVFRNGxBRlNmVDhEOUNWa1VVKzB2TmVuNXhPS2ZwK29l?=
 =?utf-8?B?UnpzSDR6cU16THcwSzZzeWhPaGF6Z0h2TUZzUHFWTERGZFFRdTRKaFBtaGgx?=
 =?utf-8?B?Q2NZMnBOMVBnUkNzbmxPazdkVUY0YmVndHpwdjh5Z2VMbm1LSlkwK24reWk1?=
 =?utf-8?B?MGlIU1lWakp5eFMrN0o4WElTU2FrdWg1UzJaRFdDVEtsVkVJV3JnNkMxS3hI?=
 =?utf-8?B?NS9ZenAraFRjc2NYQjZtVFZETHdremJ6U0U1SDVwdU1UTGwrazhyY1lLekhn?=
 =?utf-8?B?dGFqTGxud2NYaUR0Slo5dlZSdDErTVhEOGl5V3hweEc5eUh0OHhud09jdUV3?=
 =?utf-8?B?NWl1OFo0WGlaUmh2UFR3REp0bDBRVVVpR3VsM3NHanFIdFUyNVNyUkxxcVBy?=
 =?utf-8?B?R3dXYXh6bi9JS2JKYnAvU1FrVG5DMGoyRWtJSElPM25LQ3YrZkNFQkpoYTkw?=
 =?utf-8?B?bFNCOGszcTdzZ3BHZzlBVzVhSTVVQnN4dnNva0Yxdklwa0FPOVUyMFp6eDBQ?=
 =?utf-8?B?T2h2cG51ZHlIeGRkOEF2Z0xFNWNRMi9UUG4wc3hLeDhHdjQ4VnpSUWpMMDhY?=
 =?utf-8?B?dGRYRG5jVUJRNXBNYnFaU3lsbjRheFBGd1doRVN1TGwyZ2RDazFUQlZibHNK?=
 =?utf-8?B?OHJjUXFvNml2eEI3V0xscmxoRHdxWlBKcmdkTHkzOFdXdGdtbjR3V1NVbGhl?=
 =?utf-8?B?elVWQ1lpZlpEVmVYNkR1cy9TQ3JxWXQrV2FmUG5IMExOZDdRaDlyQTRlckh3?=
 =?utf-8?B?TXRoTW9SMnozQzR2aXd1VktZTUZ4Qnc3b1ltR3loeUl5eHRIT0t2WTVUYzdH?=
 =?utf-8?B?RFU0NDFjSDJyQys4VEs1MUtCUTZjSHN2NWZmY0xwOCtPdTV1K0hXZUhRd2lk?=
 =?utf-8?B?dUVESTloWlpYc1ZnN3k2Nld5TGlsQTJpV1lHaTgvbWRiWGtFSERFMWpPTGZv?=
 =?utf-8?B?OUREbHBEb2tuYURVRkJGb0VDTEo5SUY2elA2T3VwUTExV0MxNDZHdkpxWmU1?=
 =?utf-8?B?WHNCTHVUWEIwcWE3NTlxd1p6NVIyTlRMOTBHUU1HYkhORTFxc2ZjdmxnRW1I?=
 =?utf-8?B?Snc1Y3dJTTdacnhHVWM5SHJOOUJkd09YNTFVQnJ2YnMwcXpXRzFlSzk2UUZR?=
 =?utf-8?B?d2JQVnd5L3FSdWVVamZsUGpnU0s2R1NpQ3NFMnZIZERaOTZXRHJLaEVQT1o4?=
 =?utf-8?B?UXBESVI4bWw1TFlaeng2ejMzWUdJVEs3a0xmSkt1RWgzYXRlOWdmVmFySVcv?=
 =?utf-8?B?Y3ROSmlEd3lXN2R2VTdnUEhQS3lFajdJejRnS0owL24yaGNzRmR5bXdWdlk0?=
 =?utf-8?B?UktpS0k0M0hKZlpsZ2ZvdTQ4SlZtbHZNekhRTmpzaDYxNkNMYkt0dVNrei90?=
 =?utf-8?B?Vmd1ZTBjWk9xajdzeU80a2VqOU5OMnZpQldhTUVJOWJ0WUZsUVBrRVNBSTE5?=
 =?utf-8?B?LzJiMXVEMFp0SEEvV3pTM1F0bmtRZVVzZVhnTHNaWnNwWVRJUnozcDE4aWhT?=
 =?utf-8?B?bFhxdVJiZ2dmYVJJaG9qMWdFNzFadndQa1Zha1FMU0sreXQyYWFNeVdySS9k?=
 =?utf-8?B?eUdGaGR3Y3lzMlZxTXdWL0RSWmgwOURsSG1yZi9xM0pPQ2FuZWFsNGdIMUwx?=
 =?utf-8?B?REZmeVYrUnVSSGowb01mSkY5RThGV25iSFFJeVpEb2V5cXNXSWo0TE56Y0oz?=
 =?utf-8?B?K00xeHBOejlrSFVRcmc0OWhoTlZ1dTRLL21TbVRHak9sVnZ2M2UxcStjSVl6?=
 =?utf-8?B?dFFxTE9oWUU3Zmp3WVpITEoxMTBraXlkQzVtZnI5TFlDSWU0bTJZOTZVRVZv?=
 =?utf-8?Q?BToE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUhpbHFINWFyODc0VktxcldSN2dJUWFqSlp3NUIzRzBONmROTk80N1RZV2Vz?=
 =?utf-8?B?MER1SXlwZWk4bE1rcmtOaHhBY3hqZnppWHBFbmZvZzRMdlZCWkhUNlJ2Tkov?=
 =?utf-8?B?a0pLYWMrNWtZUUFvN1l1TWR3dWM3LzNuYnFRRHFaUWlOSXdNT2ZxTkVheTVt?=
 =?utf-8?B?Q091NENJaGFzZWZ0WUZzVU5mNm1sVnBPTFlnY1BWamM4QTRSZlVDTjZjMXZl?=
 =?utf-8?B?L0MvT3ArQjdHTHFDaUM5WHdhTGptYjl3OFhUSWE2VVByRVFDOHlzRE9uQ3pr?=
 =?utf-8?B?bnIrcXhEQ2tuS3kyM2RXaFBHMWNtWUdCM1JCTzN4WThBQlZvZmpsekpRZDU5?=
 =?utf-8?B?L29nZ3ZzSFQzNWtNZHlWelo5WERxM3RVTWxsUHJybHpZbisyanc5QzJ4bkpU?=
 =?utf-8?B?bFN5aHRZcFpISnRFSlEveW5wd0RvK2tmNDMrWkUrNjdkcGhXb0FzNzA1S29a?=
 =?utf-8?B?dWZnVXhEUzVaSzhvMmlHa0M0WXVEZXJkZms4MmpGRzc2ZisrVGtIZEppUWlM?=
 =?utf-8?B?M3BKRzk4RVF1RThmcjYyVkF2V0JhdnZvVHNLeWxMWHZOYnZjQ0xIK09oLzND?=
 =?utf-8?B?REI5b1QyRWR3dkU1ZGZDaFM1V3FRVWNDUG9uaVpuSWEyMm8rQ2VXNjlDM21z?=
 =?utf-8?B?WUlqV09SMXMyUnFsNnVGTWpYcjI4YnREYWtMRmlwWGVYQkpES3FuWWRzSXVV?=
 =?utf-8?B?eGlTTU1XMi9ScU1PMTd6WlYreUErWW5uNmpvOHZpL283UWVzQjQ1bnBUZERJ?=
 =?utf-8?B?WE9NYVRhVkduanZ2WENHRUpWNGNNbTEyVU5hQmVQU0JTcGxoNmh1NTVWUFhE?=
 =?utf-8?B?Z3QyL0puRW1SUHJLSWhLMldteHhObUs4dnZnRXh0U3pIbFhUbS9zaEpZbG5M?=
 =?utf-8?B?R1hkMFRvQ0JjZ2lPY25VRis4VWdIWEdTbmhvRi9zeWE1bFpiOUF3bkM1TXg2?=
 =?utf-8?B?Z0Q5ck5ybmN1ZjRpcFdlMnJoWTRWbTlBNWxOMW52aHphbXloK1o0YURZWU9n?=
 =?utf-8?B?Z0VWM2lZUEdsdGtTWitXSTB0TytUR2R1d2VpM0ZNNG5LcVh0UStJMGZmTGNI?=
 =?utf-8?B?VWFNZjBTcmdGdDF3TEZCZW8yakVHK0JDMVdXWVdYSHVSazJ5ZXFKNkd0amVh?=
 =?utf-8?B?azR2QUxIRTUrM2lEbmdwajJXTjlmNklWYVVCb05OTDNCUGJ1RE1sWDZpOGQv?=
 =?utf-8?B?WU94N21taEYvYkxwdURqR2NIRWFOSXlhVWpXZC9YVHV0RmVtOHdTR0M1Y0tl?=
 =?utf-8?B?K0ZaVE5TU0tqT0kydTd1c04zWWU4M3BNQkh4TTNEM3RoMFg3VkZsZngwWmZs?=
 =?utf-8?B?akxFbzVxd0E2RUUwRi90ZmNWMll5WXNoTW8wbERzVWJoVTNVdzdLdHh4bjhk?=
 =?utf-8?B?ampVVXk2V28vUk9TTDVzWEdldzNjRjFTdDlrVnl1aW16NU9zVjVLdEJ1Qy91?=
 =?utf-8?B?eU1ZN2VETFV2Z0VvMlVMMk4yazZCZjNzRzlKMzIyRHlUOUlFclpYd3NoaHl3?=
 =?utf-8?B?Z1g5RnB4ZWpBSGxHek12amZ4K0VGQTBnNGJ0QlhmZFkvTmxvYWw1RFFUeDgw?=
 =?utf-8?B?dmsvM040aHU3SlVzNVpZeVdncDF6eTBRdTAvUjI0QTNaZnBMaVZXc1ZtSXRT?=
 =?utf-8?B?ZnVWUzRHNGJSVFpNc2l3dU1nRnJkTThGQUF2MDhhQXFZOGVNTnkwQXpWUHdv?=
 =?utf-8?B?SlpTQjlnWjdISkkrbEVNemphbERuY0xwcHFjR0N1V1NJL3NlRUF3cTBKclgx?=
 =?utf-8?B?TU5Bek14ZFRWd3Y2a1c2aVZBcC92ME14U2svc0wzYW9SaVJodTNRUndMVkV6?=
 =?utf-8?B?Q3FDVnlnZUU5NmhaeWZCUkczejRqOEd3aW5iK000aE5rOTdTVDRHZER1dGxx?=
 =?utf-8?B?bXpHVXlhbHJlWUxGamxmcHZWMFVVRENFNXpIL2J2MDJ2eEdEcEVxQnBSSVhH?=
 =?utf-8?B?WDBQTEhOSW0vVXowRkkyamZpb3ZQd0E2dTVDQ3ptRUJpVHorbkliZjQySzEr?=
 =?utf-8?B?RW4yVEx5d0JFQ2RYMkFnUHBINDN2ODFLRmo2Yko3V1kxZHdZUm53R1h0eWJa?=
 =?utf-8?B?K2hJa3EzYWxiN3h2MFM2bDVyRVF1V0txSVQ5NUdEN2Q4OGRVRGwrYkFoTGZ5?=
 =?utf-8?B?cS9YeWRqQmxJRTMxSWVkaHNqYnJnUHFaZDdPRVA4aFRKODdJa0JtZmxzQ0hH?=
 =?utf-8?B?VFUzbisyY1JTN0tEbGxLZGxkZHZNR0tQZ3F6ZkY4TFFEbnhnNkdYL244VDgw?=
 =?utf-8?B?SHViMUQrelV0QlpWUTgwRGpLTFdXNmJidXA0cGRING5JMkg3SXF2dFQzYmNw?=
 =?utf-8?B?WlVLMWtoTHhxK0xjT2ZKZTdnL29hVWFpYVZZMkxDZDczb1dVcDQ4OXE0ellO?=
 =?utf-8?Q?cmedp4CuimxUmILA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8a7341-d575-40fe-d4bb-08de5f8bbf9d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:11:35.4428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLxPv2RufSjQJHEWukWiTnJvPshAyTDD6PpcamL3E4cNs2TWtVSSC1L3g3pN7sAV8y6wxdHZVdjFN+e6+//s53r1AqJJJpKmGMgxHDwZTPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7654
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



On 1/29/2026 1:10 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add top-level System Controller initialization and cleanup:
> - SOC remapper region configuration
> - Mailbox initialization
> - Resource cleanup on driver unload
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl.c | 80 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl.h | 13 ++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> new file mode 100644
> index 000000000000..430bccbdc3b9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/device.h>
> +#include <linux/mutex.h>

usually we put linux includes first, before drm includes

> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_printk.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"
> +
> +/**
> + * DOC: System Controller (sysctrl)
> + *
> + * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
> + * responsible for managing various low-level platform functions. Communication
> + * between the driver and the System Controller occurs via a mailbox interface,
> + * enabling the exchange of commands and responses.
> + *
> + * This module provides initialization routines and helper functions to interact
> + * with the System Controller through the mailbox.
> + */
> +
> +static void xe_sysctrl_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, 0);
> +}
> +
> +/**
> + * xe_sysctrl_init - Initialize System Controller subsystem

btw, while still not common in Xe, the official syntax for function kernel-doc is:

    * xe_sysctrl_init() - Initialize System Controller subsystem

> + * @xe: xe device instance
> + *
> + * Entry point for System Controller initialization, called from xe_device_probe.
> + * This function checks platform support and initializes the system controller.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sysctrl_init(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_sysctrl *sc = &xe->sc;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	if (!xe->soc_remapper.set_sysctrl_region)
> +		return -ENODEV;

can't we just assert that?

> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
> +	if (ret)
> +		return ret;
> +
> +	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
> +	if (!sc->mmio)
> +		return -ENOMEM;
> +
> +	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
> +	sc->mmio->adj_offset = SYSCTRL_BASE;
> +	sc->mmio->adj_limit = U32_MAX;
> +
> +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_init(sc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> new file mode 100644
> index 000000000000..ee7826fe4c98
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_H_
> +#define _XE_SYSCTRL_H_
> +
> +struct xe_device;
> +
> +int xe_sysctrl_init(struct xe_device *xe);
> +
> +#endif /* _XE_SYSCTRL_H_ */

no need to comment simple endif

