Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB8DC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 18:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B124310ECFB;
	Fri, 28 Jun 2024 18:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRsuTbZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A0D10ECFB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719600180; x=1751136180;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J0P08Da9C5+ywK40KaaKkLB3JQGkhsufM3EawOMBNR4=;
 b=jRsuTbZXAkXWAX6Pq6W5NBRJf2EP5Zs0Oa4rk25b3yr7RbPqrcxCnUjo
 Nxwr/yBNyqrPOQ2cdBFRTJHQ1JT4DVTEyKtZYcaY3YZM+ZIp0EFTNrR/5
 isKRfqL0ZOuDsuNILvqYxakdIpglEv9+B0uOGMZmAC7ru0vrEBfWbHIJA
 uDqewSosNO2t5cdAR1CthM0bUH+n6jd/GT3os/iDWm2FJR5YOMS5jHCIO
 4W2JyVZanSes1WS9+1PYS4uhUv+cvEGF7QmvyH5mhUPYmLuj8fcZx3neB
 EEW7hYq5cJr4Gu3WRdrdlHuXEfzQzDOyzzUKcuubo8C+SGQkzSeTq1i+w g==;
X-CSE-ConnectionGUID: sKHSJoqmSRivdCHoYZfNkQ==
X-CSE-MsgGUID: eU/fW1wFTRe3PElK1SX9vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16930121"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16930121"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 11:43:00 -0700
X-CSE-ConnectionGUID: VbyPksEbS5q9Cj/mXlBrMw==
X-CSE-MsgGUID: UzUkfhkbS+yu61OABY+DDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44731537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 11:43:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:42:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 11:42:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 11:42:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6KZqbc3ZO8NtdatZDNvEShVIHeApNJz8JWwwpTR2VGlyCuuOtSGeODmT+PIHQw4wa0JCJKzCC5zG0ATn1LptiaVPAumUb4QZ7tMbTV+8POSzx2pF0cV9QR/rOhtqGV/8uQbKQRlADW3iOBpGWfvO/jLIOXg8ak1uBltJ8dkpKN8lgT+bRaodFJ4YBpLKDJmxiRJrqcp8lB4HUfcVo4bUz3rbVTgC5sIpG9Q0zXzsJIEsjjbQtrJxs5h993LvXR8MpOt8MFJPn4+aQ5zv3RWLGSlR5J5p+TvW5tuBZW27Bb7jmNqcfrktDYkYJBZtkW2C1+DYu9aObgutcdbneQjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C32A+zp0X5NiJYkX3IvugzOmaC3Az3qLkT9sV+po0LE=;
 b=UPbSfUKV48RLDQnUH/VVXAVQApJSNuUL0O1dUKk+Z+oVseSYVHoax9qwCk+uY0C3nxL4KPZm3/jHRvj9DCwmh64C0coctPzLMJCD5L/EDzb5lvzHd7/JqcOg56b58EvB3Fgodb7USeSGnLTCxo0jpojfmQiOK2kZO9269aZQxe5/jHBb1Dv9XiWe9m1fkFt3Jb/oonC+ntU3GaIBrzEmmBUXw2PvE5c/zgoIXAaVgHQUNIHpItD1Xc2fs9GiwE0gYHv7iBmsw4HxCgmHLNlDOGlTY6TkPqHf0nOeYvJWsWo7+iAm4DibYLhKgd5OBPaIQwIjf0+QYrURJ9V6LWEtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 18:42:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 18:42:56 +0000
Date: Fri, 28 Jun 2024 11:42:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?=
 =?utf-8?Q?for_drm=2Fxe?= =?utf-8?Q?=3A?= Get hwe domain specific FW to read
 RING_TIMESTAMP (rev2)
Message-ID: <Zn8EKaPfCv3Xe3sy@orsosgc001>
References: <20240627235105.2631135-1-umesh.nerlige.ramappa@intel.com>
 <171953915225.166133.10462396048420163575@a6498e030952>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171953915225.166133.10462396048420163575@a6498e030952>
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: b07e2901-91df-471c-248c-08dc97a2201d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlPY2toNGRDZUg1SytCTUNxMXMyMzNCRkExRUV5Y2cwOTk0R1VsN1AyQ2VQ?=
 =?utf-8?B?eHoxMG5CTmVFRWNEYjZvRGZ0UnY4Z2tLaVpaVVFaSDYwS0xRSTVBMW9Md2VG?=
 =?utf-8?B?Tmw5MnhHb0V0VDFzTjg1aUR5Ri81QXpic3hyQ0d4WlVzZG81YS9FaGhvYU41?=
 =?utf-8?B?SEZ2UEpQeHkrMVhWQ2c4UnZnOVFpL0RpblVFYXJBOVRobVRRZXkzY3p1U2Zq?=
 =?utf-8?B?QnQwelJpRVpMeCtjM3pYcHFTdDF0aFkwKzZHN1NlbjRtS0ZFclJSUGprMFpZ?=
 =?utf-8?B?cXNSWHB6VVZxNE5HOU5aSDN0WUtGVDArUXcyTEM5VE5rQytwZVJFTlJ5T1JO?=
 =?utf-8?B?WkI5TzlJY3NnWjJLVHRhRHV0ekNRQk02eFM2MU91NndBQ1pBbWxSZGFLbnZL?=
 =?utf-8?B?WmZUUHBtMEJJdXU0eEMxNDBOeW5BQ2JHTDFnNHZXa3JBbHhibG1Dcm85WnRh?=
 =?utf-8?B?SkZMNU9LOVhjOHI3OUpvT3Q2amlMT0VoMXRMY0ZJWHdjUGtzU1hTU1EwemlH?=
 =?utf-8?B?TDJQRVByM0FYTGJnV3hQTTB3UWNqUVorMXR5OFREVFpMelllVm9WdHhWYkND?=
 =?utf-8?B?dG5BVWk1SmdxMmRKU3VKSTNwNHIvNU4vdDk2TDc4ZVNjeVE2d0UrOCtVSlJU?=
 =?utf-8?B?b084Z3Z0N0M1YlcxNWNEYXRNSUVOSjA1Vk05R2NaRWFha2tkNnE5SXNNYmlY?=
 =?utf-8?B?S0tCc2oyWncxNjZOS2F5QmlwUE9ScXQ0QkpnT0xhd251cTZUY1h0WFdMYkZ0?=
 =?utf-8?B?Ykw4Vk8wWGtIak50c2ZMWEtLK2ZpRDJPNkpQbHN4b0xMeVloL0thT09uSUw3?=
 =?utf-8?B?cGJuSFY3UzBCbzZTY3prVm9YQ2lTMjAwbVlVcC9UWWZSRGtwMC9zY0x3dUdO?=
 =?utf-8?B?b1BSOG1SZ0YvQmtObTAvRmdPeHZvTW9pdlcvOFJEZHFwNnNPcUZqNnQrcWlH?=
 =?utf-8?B?Zm9EYVJZakZVN1R3Mis3aE1ncWZVZHIyUWRjbGNXdWRlWCtpMFdWR2VKRFJL?=
 =?utf-8?B?MUwvV253S3lkU0g4ZVBLTW9aaFFCSUpkU0FQLyt5RkN2RGZzVGhHMDlkK0h0?=
 =?utf-8?B?Wk9ETHl3cGg5RjN1ajBoT0ZkNFRCeEZWaXNnOXEwNGEreGNObDhUeXo5aWZj?=
 =?utf-8?B?ZkdhU2xKNVQzKzE5aVRETzJSQ3Fwb0R1Ni9kVVRQZTdvUGdEMFBUVkJvNnA4?=
 =?utf-8?B?cW5HZFpPZUZnZnhmNnd2VHgxN1g0SjRrK1o3d1lYaGsxSm5JTlJDb2hmZ0I5?=
 =?utf-8?B?TGRuQ3QzVEprUFJERDdpOEpVVCtvNyt5MzZXMzNYMlowQndjUW5uY2xmdk5O?=
 =?utf-8?B?M1cvRURxQStDdHNWSlUyQUxOVkxIa3JrRlRUaFZnMjcyTit0Um5EczdxOXFD?=
 =?utf-8?B?SGRBUWg3aGNDTXQranV3QlNPdGJZaGgycHpWa2tuaW9vcVRUZmdDSWVCbkFT?=
 =?utf-8?B?T0dkekJJbzVPa1lJK015cU04K2RRMEZEcWxqT2s0L0pQTVdhNlBEb2tueDhB?=
 =?utf-8?B?dVo3SnQ5dWozTnFiN0RIbVhwVkFHbC9FNm5pY0l3UVNIb3cwRk42T3J1M2Zv?=
 =?utf-8?B?TkFvNlphbjA1cUxLT3psdlVXNEJReE5tcGJyRU1EaUI2SEhCVW5UNkc5YlVO?=
 =?utf-8?B?R01uSnNnc1JZdVByZFRwSVFuRFlJWHV0RGJGanExNklpcW9sc3FiQ0xDQXlN?=
 =?utf-8?B?VThGUjNDNGM0Z1VyR0Z0L3ROd1BzOS91bWVZU1JRbHErSDlPaWRFcThMK3hK?=
 =?utf-8?Q?ygDK7/lIVWeWiYgazA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3JTNXgxZENZU2JJbDZUb1ZQY3lLcDYrekFzb1JZczg1ZkFualRDbzcrQllR?=
 =?utf-8?B?aERoZ2NmZThIdEZZODhXU3RnL0VXRUFuM0xLQm0wWlFla0JIcEhndFZQdFhK?=
 =?utf-8?B?ODV3RHVtY0x4TGNNbWZUNnhXckhLbHRlUkwydEUxbDdhWUxRM0Z5MGI5T2h3?=
 =?utf-8?B?QmZkTHNGK1E5aHhZZ1QxakljSU4rL09pbmxlNVNJRmZ3Zkd6MWluSXBmWDBz?=
 =?utf-8?B?Kys5T1VXVFNaTS8zZ1BYbGV5ZEUvRlhWZUN2RXVnMnAzRWNFTFM1MUNhT1k3?=
 =?utf-8?B?RnJ1aHJRN1JqUTZ0TzlGazQ0bjFXcVdrNmVSR2xKYmMxTXIvR2w0OTVIL0JX?=
 =?utf-8?B?T29EOVh5QnBmR29GQTA3RWI4SVdyam5PMFRXUXZWbWwwVWVIbXpCbVlNaEEw?=
 =?utf-8?B?dm05aFk1M2dJNWE2a01BTVhWOHZmOFg4U3doaFdqVFpzck9yajhBalIrMGhx?=
 =?utf-8?B?OFdZM1RNWlRncGpuTlJUcmdjZHdZcWpDUmNiZTVaRlVqd0p4NkdTcUhoOERF?=
 =?utf-8?B?dW1uMnpZZElBTDdTTml2ZFVTUVduRmZJOU84RWxhYno5cjNUZDJzZGpFWktR?=
 =?utf-8?B?UllVUmY1Y0VSVkZjNFJxaUlRRjNxenpSR2VBRmtkcjBUbjVneU1rKzRxdGNQ?=
 =?utf-8?B?K0hYTGo4SWg1UUN2Z2FTVGM5elZSWTNsemtZYm85VlBCVWZwZ1lTVXJZUTZj?=
 =?utf-8?B?cDgrZHVJYUtBeUFYQXgrMXpJRFR4K0lQNDJLdjhsNm84QTFtUzU5dkVyQVI5?=
 =?utf-8?B?YnpvTHdJZmJYN2FqVXpjUDdRYmF6SEQyamI1S3JIanJOalZXdTNMWkgyVkFO?=
 =?utf-8?B?UUhiZWFzc3VhNVpaNHF2NU5aK3o0QmdQV0V5VDVPQTlKUjFQdXFNbEY3OVBB?=
 =?utf-8?B?Z0twVWZSSkdSeGFFMWpLOE94U2kvYllHdW9ESXVpbHgwbVhuejJzemJubHpB?=
 =?utf-8?B?OTN4cnZsWG4rTE5zYzk0OTMvTk1ubEFMQkducTBSLzVVYm5jSUZXMEQ5eXdW?=
 =?utf-8?B?L1RRSjBZc3VxZzBNOWJ5eUt0YXNYTWlZM3FoM3FtdU5EY1BGT01URkRXK0Rh?=
 =?utf-8?B?S3IyVzZvSWZQSVVab1NJMnNCaFVLTEt4dlJsUW5yNWpwcTVmdTVSSnpudFAz?=
 =?utf-8?B?Mk94b09HV244ZlpwNkdUN2hZbWFsNldGWFVhWDVTbnM4WGVXVEJKVmtmS3Rn?=
 =?utf-8?B?b2tRTGNWcVA3UDJxZXVYNVkwcFR3ZVJja1VNR1ltWG1hcWJLYmkyTkJvNEVa?=
 =?utf-8?B?dnJiZ0ZvbEtQU1Z4SG5WWWlDTDc2UVl6aEVJRURhQTE5Q045ektSWHI0MnZs?=
 =?utf-8?B?VnlYY0swMlAybkQ4V2paQ21Hdy9wR3FYTXRvNTN2UlhiMWQ4Si9wSzRTMXha?=
 =?utf-8?B?WlZKNzZ5VHRnNElWQUlOU1B2QW00dHptekdOcUZwS3VRV00vNDBTWnJZWmdZ?=
 =?utf-8?B?amtGN29JbCtqRklxMG5nVEVBOE5Qd2FyOWNSRStPK0paV3doYWxkUlRYd2U5?=
 =?utf-8?B?QzNjQXZjSmp3V1FFLzVOVFVqSDNtZm1xSEsxcnpoZVRjUTFoa3ZNRTJacG9v?=
 =?utf-8?B?MFVqbDh4T1NURVJJYkI4ZDYzTTZvS0lkd1lqSVFUNStXUU5hTGFpdzFmbWNo?=
 =?utf-8?B?K0pQakJzY1A3aENXL1RzY09DZFh5MFp5U2VRQkFzakJUZXRZRHhFcGpMMmZ3?=
 =?utf-8?B?ejRDek01TVlQVU9qeGxBd2hxTjdjdDlOZ0h2ejZEUzhacGlhaFhtTlFjODdE?=
 =?utf-8?B?dGE2bEFpRTRERmhSVFRyc25VN1VkTktjdGRwTHl4RHV5L2hiQWw4bVk0Qk5m?=
 =?utf-8?B?cjhYQnNoWW9oRkh3NG9GeWJqd3ZQN29zV1YvVTBpQ2NVeWM1bWpHeTFaNXpq?=
 =?utf-8?B?dzR0YXp5VklFd2wwTEdhaWNwd3FrbWZ4QzVHblNPUkg2czArNE5DZEFDYW90?=
 =?utf-8?B?L3d2NjgwV3pVaEg3d0JrdS9RSDlLMjdvWFZsZmZKSGJxa3QwQnk0TnE4UGly?=
 =?utf-8?B?V01WVkxvY1hXVGNvUTFjUklkeDZnTzVhZy9uQ0R4c05oZHA2UkdUV2syQWJ4?=
 =?utf-8?B?eWlwMCt6eTQrWHpRL3poUTMzQ1lQVmRFRjZLc0VoRk0zTGNNMXV0bVBFZGxG?=
 =?utf-8?B?OHRPZUZWZStvVXlpdnlzcE8wd2RsZHJMYnBhSk81bmVIeEpDbWJjdWYvOGpy?=
 =?utf-8?Q?3UnS1c4JL3pbd2qeFc0ZTZk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b07e2901-91df-471c-248c-08dc97a2201d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 18:42:56.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkdsc9zyDn8D6wMcwX9UcDPzcuLH1f+q8F8Rpv6F1ZIjacpVVQ8Tiigl/rMllkUW9Ys6kmuXsyWpE64GLGLdimhWN3TNt9bGTs5Edoeiaog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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

On Fri, Jun 28, 2024 at 01:45:52AM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP (rev2)
> URL:     [1]https://patchwork.freedesktop.org/series/135370/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135370v2/index.html
>
>CI Bug Log - changes from xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c_full
>                             -> xe-pw-135370v2_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-135370v2_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135370v2_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (3 -> 3)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-135370v2_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_pm_dc@dc5-dpms:
>
>          * shard-adlp: [3]PASS -> [4]DMESG-FAIL

Unrelated to this patch. Failing premerge in other series too.

Umesh

>
>    Suppressed
>
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
>     * {igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p}:
>
>          * {shard-lnl}: NOTRUN -> [5]SKIP
>
>     * igt@kms_psr2_sf:
>
>          * {shard-lnl}: NOTRUN -> [6]INCOMPLETE
>
>     * igt@xe_wedged@wedged-mode-toggle:
>
>          * {shard-lnl}: [7]PASS -> [8]ABORT
>
>Known issues
>
