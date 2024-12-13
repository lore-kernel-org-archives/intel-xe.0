Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35189E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 07:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F0310EF0D;
	Fri, 13 Dec 2024 07:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kc8od6Ey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2FF10EF0D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734073639; x=1765609639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OLc9ZDrY91HP+L+y9eZqXZM6rBo/tLs2S7Cn45x5nYA=;
 b=Kc8od6EyncYfI9W5S7qeLNDIc+ITnaX7p5r7dEP3imVatJkTP9tpKQVX
 Sl/2NkQbdrHPfX/yvFjCG4BQFwv//zSa+WD2vNIa3bRxEyGJUEiNKGnIL
 FQg6Tog16RdYY42PvvN1HmBBoRxJ+C+zO+yTDcyuWeAZr5u5MI+RjO1ru
 Z1rTuCmknALMVaJafrDkwkSS4IPsToXY1S8cTUowTaBhGNttvaLj2iNNd
 6IBiTvOBJhKiuKK+nbdAx8fvflG0/adKmFSHRJ+6zLoonsi4cyHf7KTGm
 gGeLrHcZKHwhK0H2ici8PfkTDNtKQ/2NecT1cO0fcHebwVvOCOm/GD776 g==;
X-CSE-ConnectionGUID: njv3P0TsStG6lAFs9czPbw==
X-CSE-MsgGUID: VaS4y4lFQuy/7qiGfOhkEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37363991"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="37363991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:07:19 -0800
X-CSE-ConnectionGUID: YE4YFkD5RJ+lpT20HN/jfA==
X-CSE-MsgGUID: v3z4OPbtRZ6aOSTOn5xp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="97011224"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 23:07:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 23:07:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 23:07:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 12 Dec 2024 23:07:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDlvkL1jXYLvNylIYHMyvQJpotpwTVFhQc6XIzIteZSoz9yHKo4sqRlkQtFl0hlpU++TWU77egXfW01hmbG/XrGCnX4WKONyEXgAvFYIzjKLGm2/68+4397A734j27hn/TvQ/zhOwDDbEWEMj/RiQhtaacYYlBi+Cjo5hE4zEbuYj/sO3p/9k4LBp+4V34IXWXozvma6VwHyF3hktb9eX2EekVW6/HVkuZDAVQHNTDMqp+cenTEG90JkgTZwe7U02ssUjpQE4FKLWgYlQOG8t8Wl0c5uNkSAEASEpZDYTyNgr/8onPwQmBhMlHDVhesKTH7ywWKf2XJwxJUxyDSkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKF7v3Nfne5x6W0npotp6tCyygaflFGtGooTAvCUjtk=;
 b=rzI17bF2znZBcRiIeLpSiXy5R9hzK34dUP1rbEubFkot3xVyg4PNRtpdKucqgNd2QDtlfWHurjWpaG7x08wTbExs+VnR7OPvAGYKMdpwump2/ZBFgrJbuH4E3mVvAEYYxWC1jRQqhSpECJlzFTrjc17UvAvI3rfY6bSxDU7r0hT9tLQMMvREcpk28YtDahxS14f0SvCSCrZ9daS0rOVR1/E5rc5Zq4n5f1DCiRUPA3JaESHqup8iKL8cnCjREhNhPS9MA8iZWB69zrO9V38YoYAgZR+g/AbF5mx9+Gc3+eJj1SQYJHXjeyHtrEfPnfYiq3BicqArb/ujpHJhnPNgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by DS7PR11MB8806.namprd11.prod.outlook.com (2603:10b6:8:253::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 07:06:45 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 07:06:45 +0000
Message-ID: <a5b2cf3a-cec8-4abc-bca3-8ac49c5cbeaf@intel.com>
Date: Fri, 13 Dec 2024 12:36:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/xe: Add single engine busyness support
To: Lucas De Marchi <lucas.demarchi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-6-riana.tauro@intel.com>
 <Z1t4EB0GwI3qINhe@orsosgc001>
 <nxkihpoy5djjkv5uosit4l7jfpqgohjtp2y4dgejph6bdljyko@jxeh5qaavck3>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <nxkihpoy5djjkv5uosit4l7jfpqgohjtp2y4dgejph6bdljyko@jxeh5qaavck3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::28) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|DS7PR11MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3fba9f-4c92-4a24-e0eb-08dd1b44b457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2F3M1VSL2NRcGFrdUlxMExNSzA1TWN2U21Qb1JPSU5rUExiOHBBT3ovaW1q?=
 =?utf-8?B?NXJsdk5pVVNnVHRHRU5rcFJwQmNxSGE5MFE4cTBSdWlyL3g2RG5RYnFxSnJt?=
 =?utf-8?B?REJRNVNMV3RQeGZKWnB5R0FORmZ0cE52NWZJTEVsMW4rNHhMNnFYZVdiNW8y?=
 =?utf-8?B?Qm9sU2tYVlN1a0RsVWEwNnlNR2MrdW1HU1dkbzFBcWw0Zk9IY0xUdS9NR1lG?=
 =?utf-8?B?eFN6ay9mSUI0eUtoVUx4TGRTdDAyczk0ZS9VRDJwbTJKYTd0a0dWREhZcGh3?=
 =?utf-8?B?bVlkcDEyVUlYdkFEOVpZTlFxZ0VUNGVvUStvbnhHYzRJcFVwZ3JXb2t5T29B?=
 =?utf-8?B?VHIybW5BNmprSEpzakFKTUorckNJNGNmbjRtcEoyNkNGZ0tLREhzeDBPTHRz?=
 =?utf-8?B?K1dObFh0ODN3dG0zU0c2R0ZFTjd0WWhPLzJMcCtCQTBvL1gvY0R4ZW9xeGdl?=
 =?utf-8?B?VmZvbUNXMlFuS3RkNkdpZ3VaenpCSzIvSTVZTWEzVkZsdmNNS3Bxckdnc2xV?=
 =?utf-8?B?WmJtdjB5cHlWRDduUlBmaUVqUm95Z1ZmZXhZVTk3UlFpd1RHTjc0M3R2WGF1?=
 =?utf-8?B?WGhCbm80UzBvODZlSHNXQUlBY25BRzFmdk5abjgzUU54bDRWN3VSb3ZWK3Fp?=
 =?utf-8?B?Z0hkWkU1Y2hwYlZzQzNmaFRLOTZ5ZXdIK2lWTlRkWVlwY0JEbjlIQVVuNXpH?=
 =?utf-8?B?OTdha2RxYzVQUk5acTg0RFg3MTUzTHAzK0hjdjZadDJUckJxSzFOeWZLeGJI?=
 =?utf-8?B?V2JETWRyT3hLbFZzdzZkaVBQRjI0MzBCT21zNDM5eHFzZVQ0SGR2aDdnYjNy?=
 =?utf-8?B?K0pRd1d1Y2tjRUdBdGZSOE1tYnVtWk15ZWlrNGVkbWRNVTJDOTJJODR4Y1l1?=
 =?utf-8?B?cXE2U3pSaTZBejNDdDg4TE1udzEzM0I5VkhFMnh0bUhuTUZFUHZTY0NpTnpY?=
 =?utf-8?B?UVY3aGp1dkUweWE2bjlwT1JSSW9vandNQjlTS2I4ZElEeGFvZFBOSDZYT25V?=
 =?utf-8?B?NjJXNm1FczErZmhFSVlvNmFEL2V3Rndsb3J5SmRid0M3aDRSa05zSWM2ZWd4?=
 =?utf-8?B?MnNUSUhBSkpWOFhQdlZNbWVrYXpMVk8vczZ5Q2FyOWFNY1dOYkpuQWtzMmVI?=
 =?utf-8?B?dWdXN2VSam9QTEdKcWxpck5NM1VKTnNNNWhNTW0vT2IySGxsR2tHaFdCRmxt?=
 =?utf-8?B?eHJBQ2M0VWRURkNTTGR3bE41OFpCenJSNTdqcjA3bHc2cjdSMy9HaFgyeVdG?=
 =?utf-8?B?aVhMWnBKSm5Ndm5IUlFTNE54SHF6L0I2Wjh4Q2hzSm5JL3RzZFlCY0tGK2RS?=
 =?utf-8?B?SUVBZHd2dDlmS0pCdkdHL1FtVy9jakswRTVLMEtzeWdLbFJpcnhyQWxxWERr?=
 =?utf-8?B?Mk81YytlVEpOYlNZU0ZnN3ZkMmIwaFd2T3pldEtQR1NkWkxkZ2p3VmpBSlhj?=
 =?utf-8?B?QlVWb2FQeXlDNldVYmN1NUNjOVNJMkZ2T3IycXNvYVVSbTR0WFBmWE16UVNh?=
 =?utf-8?B?dUk2eWllTFVHNkJ6ZXMxQ2pqV0w0eitSQ1puUTFDV0VyQktLRzZrQk1aSWJZ?=
 =?utf-8?B?aW8zaDVia2htQjQrY2VtRllqVnlBOFowNlA5KzNEb2VtVURmdFhadVpxOC9K?=
 =?utf-8?B?aFAyTzNLVnpLRkRHUWR0NWNud3JEdmtDTXpIazd6RkJkdEQ2bk1aOHU5Nk1m?=
 =?utf-8?B?WE5wbzdjN2I4dDNJRVRqdlRmNUVJdlQwZ0U3dDJEaVg5N2NTQ0lsZlJnUUZL?=
 =?utf-8?B?cWptV2VrTEsxL0FNMlBCbWZoTjJ5WVNXMjQ3SGdZcStINnZxczA0MzJqSE9w?=
 =?utf-8?B?ZEF2QTZmN0h4RS9xbUJ4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWFZRituRGx3T2JkZEpOd0Y1OHpUTUVNUmtQN1NseWJqMEYvd1FLeWE4NmtU?=
 =?utf-8?B?SGcyU2FCMEYzTSt3K1hiTWF6RG1oaGN1QVVoM29VQWJSaUNmekNuNVRaN1lt?=
 =?utf-8?B?VW1JWU9ZZll4cTBJN3MvT3JlcjdEY01CRS9LUmZaZm85ZXBreHIvTEFvdDhr?=
 =?utf-8?B?RmUzQmNyOWZJZlo2eGtVVVVyMk9NVjRacXYwamg4NjhyUUQ0ejZJTzV4bm1P?=
 =?utf-8?B?RlBwZzRSS3ZuUXJPRllJNW5rOVd6eDZLbVhsc002ZEdIUnRleVFnN3F5cmlj?=
 =?utf-8?B?b0JRUlprV0JtTjA1M0VFSTljRGU5aUJRclNhRDVzck9wWHdEWTJGRE16QUcy?=
 =?utf-8?B?T0dnY2svbVJ2aVo0WVY1SWNtSHJLMVBDV2VpOHBpei8yc0JId041eW41K3Zw?=
 =?utf-8?B?QllyYmJnVHJJa2xDKzZ0MzFONitTQnlRWldCMERTdlpSb1lmM2NRaDZhTVRr?=
 =?utf-8?B?T3MvMHdlMlVrdnZMa0swUDdsUi9UeFkwMlZ5MEhrT1BjVDQ4bGpwVHZNK0tu?=
 =?utf-8?B?VXZvcVFnQVV4Q3M4N0ViczdQelZrK0FjT09DMnBqdEYzOWhUMFNNUHQ4N0JB?=
 =?utf-8?B?NDlmQi9LRXlkOFVFdzRhSTJMSzVDV2lqN0RtU2ppTFJMYXJLOENvRGFPYW9B?=
 =?utf-8?B?bnZhNHhrNzZsUGI0U0ExaUNEcHFSR3ZPTXB2NUh1cWs4T2NHWWY1K2w4SU4v?=
 =?utf-8?B?WWhvckJSU0paa1RrQm1vTmdTLzAvZ0haQ2lKUnZPZzlLVFR6UnFhbzc1R1d0?=
 =?utf-8?B?anhpZDJTZDNzcVhUcWF3c1kzSjFNcFZNQ2pzZWduaFNoV3REQjljYTI5a0pB?=
 =?utf-8?B?a0hiVFZlMVdpTWsvdHlvR01tSlBpWHQwYWJHQmJGY1ZyYlpwZzlIVUxFNVR0?=
 =?utf-8?B?YnM2OFFHK245ejBpL1h0QWZ4NWc5anVUM05YSVViVWZldjVnYzFINTJHbXB4?=
 =?utf-8?B?K0dCb09zMTQybjRlRk9iR3JiaUYrVkZyVWRZeXdlKzM5YzRPblg1akROZUR6?=
 =?utf-8?B?Q2srRUdwWUs3ZWpYNUZnOEtOSDBBcStuTCtISW1uT2VCZ2wzQnM3U1R4UnlP?=
 =?utf-8?B?bDVnSEJndVF3MTFYSDdzaTI0b2djWTdWa1J3K1JjYVIvR0Y0Sld5V2ltZDhZ?=
 =?utf-8?B?dFJLVktoQ0FhQTdxcEltTW9IdGtwVjNSNWVaWFI4bkw3dXpvdVhpdWFhOHJu?=
 =?utf-8?B?Qlk4YlhBMW8vaDdhZGNKbndJbEQ5WVFLNW1BNTFGOXQ2anQ3Vzh4UldyWnM3?=
 =?utf-8?B?a0RQU3ZseXNFT09GU2llYWIvZGkwdWRnaEYxdnJPTTZVemlVRXFwZTdaUndD?=
 =?utf-8?B?QlVUcGo0Qkp6YzE0SU15TzlUYUdlM3NENFJ0VFJmMkZkbWJjSGpIb3Y5N2tv?=
 =?utf-8?B?aEswcHBBZjJNWVRtZC9lSGx1S1l5NDk1TGFHN0laRzhVLzlyK0o2NFY1MFF1?=
 =?utf-8?B?OVBUS2dVNWJWRGNwQzZHSmw4ZTl1ZHB5RGVmR29VaWdwbGx3Vmw0Uks0YVFv?=
 =?utf-8?B?ZDJVNVZITHA2K3RTNFlnR09qVVJSTkl6VzBtVXpReFo4NUtyVG45L2thYkJp?=
 =?utf-8?B?VHlacTlHMU80Tk9JdTBUbTNmby81UUJKZC9lbVNRQ0E1OHdzTFEva1hVTnJS?=
 =?utf-8?B?SUhCMElVQ0FGekhxc1dPTnc2L1hDTEVOWnBUYmVoaDdIbzhFZDZGenZzOHdt?=
 =?utf-8?B?VHllWXlyYnQrenJSc0hGN2c1cVR2VmZGVFRYTnFDcVljN3ZUeE1ncFhabVh1?=
 =?utf-8?B?ME9TWkwxZzR5c0tocXRJUlBaQVkzRHp0ZEhtZ0JsQjdTeVFsM3ZESjcrMk1s?=
 =?utf-8?B?RWNxRkVxVHY3UG1Xb0NxNGl3c0UxajNNbUVMR3pUbGhxeW9UN3Arc1ZTZ25v?=
 =?utf-8?B?dFVyMi9zOUQ5QVNtSFRiajFNUGc3ek9YVnFuSlNUeE0yWU9QQUExOHlYK3FF?=
 =?utf-8?B?K0xlbmM1NzEvalZKZmdld1VNNENOOU5XK2JZaXJURGVVQ3VPMW91ck0wR00r?=
 =?utf-8?B?RFBEQzcwekZabS9KTmJTM1pQSnNWU2hHejhTcG5UUEV6b1lZbUp0RHBWN0tX?=
 =?utf-8?B?UXJGZ2xNRGUxVEwrY1YyT1B0RzZ1ZU51WGJ2VHR5MDVaMkJ3UTNTdFFCcUoy?=
 =?utf-8?Q?ck2wjANox8Qygo+oJZlrsK0Cj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3fba9f-4c92-4a24-e0eb-08dd1b44b457
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 07:06:45.7185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfybl3BjBConokASZRw1QVoTpBt3A7OFyixrzTa80aEewe+3hTY1fIyTRQSkcYbHQ2ln/WmvmS0O8jphypj8oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8806
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


Hi Lucas

On 12/13/2024 6:22 AM, Lucas De Marchi wrote:
> On Thu, Dec 12, 2024 at 03:56:00PM -0800, Umesh Nerlige Ramappa wrote:
>> On Wed, Dec 11, 2024 at 04:44:17PM -0800, Umesh Nerlige Ramappa wrote:
>> On Thu, Nov 21, 2024 at 12:09:01PM +0530, Riana Tauro wrote:
>>> GuC provides support to read engine active counters to calculate the
>>> engine utilization. KMD exposes two counters via the PMU interface to
>>> calculate engine busyness
>>>
>>> Engine Active Ticks(<engine>-busy-ticks-gt<n>) - number of active ticks
>>>                          for engine
>>> Total Ticks (<engine>-total-ticks-gt<n>) - total ticks GT has been 
>>> active
>>>
>>> Busyness percentage can be calculated as below
>>> busyness % = (engine active ticks/total ticks) * 100.
>>>
>>> v2: fix cosmetic review comments
>>>  add forcewake for gpm_ts (Umesh)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/Makefile                   |   1 +
>>> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>> drivers/gpu/drm/xe/xe_engine_activity.c       | 323 ++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_engine_activity.h       |  18 +
>>> drivers/gpu/drm/xe/xe_engine_activity_types.h |  85 +++++
>>> drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>>> drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>>> 8 files changed, 453 insertions(+)
>>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
>>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
>>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index c231ecaf86b8..32473c609824 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>>     xe_device_sysfs.o \
>>>     xe_dma_buf.o \
>>>     xe_drm_client.o \
>>> +    xe_engine_activity.o \
>>>     xe_exec.o \
>>>     xe_execlist.o \
>>>     xe_exec_queue.o \
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/ 
>>> drm/xe/abi/guc_actions_abi.h
>>> index b54fe40fc5a9..3a7834f7e421 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> @@ -138,6 +138,7 @@ enum xe_guc_action {
>>>     XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>>     XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>     XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>> +    XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>     XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>     XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>     XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/ 
>>> xe/regs/xe_gt_regs.h
>>> index 0c9e4b2fafab..7a7283262673 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -355,6 +355,8 @@
>>> #define   RENDER_AWAKE_STATUS            REG_BIT(1)
>>> #define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>>
>>> +#define MISC_STATUS_0                XE_REG(0xa500)
>>> +
>>> #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>> #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>> #define FORCEWAKE_GSC                XE_REG(0xa618)
>>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/ 
>>> drm/xe/xe_engine_activity.c
>>> new file mode 100644
>>> index 000000000000..464cb09933b5
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>>> @@ -0,0 +1,323 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +#include "xe_engine_activity.h"
>>> +
>>> +#include "abi/guc_actions_abi.h"
>>> +#include "regs/xe_gt_regs.h"
>>> +
>>> +#include "xe_bo.h"
>>> +#include "xe_force_wake.h"
>>> +#include "xe_gt_printk.h"
>>> +#include "xe_guc.h"
>>> +#include "xe_guc_ct.h"
>>> +#include "xe_hw_engine.h"
>>> +#include "xe_map.h"
>>> +#include "xe_mmio.h"
>>> +
>>> +#define TOTAL_QUANTA 0x8000
>>> +
>>> +static struct xe_guc *engine_busy_to_guc(struct xe_engine_activity 
>>> *engine_busy)
>>> +{
>>> +    return container_of(engine_busy, struct xe_guc, engine_busy);
>>> +}
>>> +
>>> +static struct iosys_map *activity_to_map(struct activity_buffer 
>>> *buffer)
>>> +{
>>> +    return &buffer->activity->vmap;
>>> +}
>>> +
>>> +static struct iosys_map *metadata_to_map(struct activity_buffer 
>>> *buffer)
>>> +{
>>> +    return &buffer->metadata->vmap;
>>> +}
>>> +
>>> +static int allocate_activity_group(struct xe_engine_activity 
>>> *engine_busy)
>>> +{
>>> +    u32 num_activity_group = 1;
>>> +
>>> +    engine_busy->ag =  kmalloc_array(num_activity_group,
>>> +                     sizeof(struct activity_group),
>>> +                     GFP_KERNEL);
>>> +
>>> +    if (!engine_busy->ag)
>>> +        return -ENOMEM;
>>> +
>>> +    memset(engine_busy->ag, 0, num_activity_group * sizeof(struct 
>>> activity_group));
>>> +    engine_busy->num_activity_group = num_activity_group;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int allocate_activity_buffers(struct xe_engine_activity 
>>> *engine_busy)
>>> +{
>>> +    u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>>> +    u32 size = sizeof(struct guc_engine_activity_data);
>>> +    struct xe_guc *guc = engine_busy_to_guc(engine_busy);
>>> +    struct activity_buffer *ab = &engine_busy->device_buffer;
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>> +    struct xe_bo *bo, *metadata_bo;
>>> +
>>> +    metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, 
>>> PAGE_ALIGN(metadata_size),
>>> +                           XE_BO_FLAG_SYSTEM |
>>> +                           XE_BO_FLAG_GGTT |
>>> +                           XE_BO_FLAG_GGTT_INVALIDATE);
>>> +    if (IS_ERR(metadata_bo))
>>> +        return PTR_ERR(metadata_bo);
>>> +
>>> +    bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, 
>>> PAGE_ALIGN(size),
>>> +                      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>> +                      XE_BO_FLAG_GGTT |
>>> +                      XE_BO_FLAG_GGTT_INVALIDATE);
>>> +
>>> +    if (IS_ERR(bo))
>>> +        return PTR_ERR(bo);
>>> +
>>> +    ab->metadata = metadata_bo;
>>> +    ab->activity = bo;
>>> +    return 0;
>>> +}
>>> +
>>> +static struct engine_activity *hw_engine_to_engine_activity(struct 
>>> xe_hw_engine *hwe)
>>> +{
>>> +    struct xe_guc *guc = &hwe->gt->uc.guc;
>>> +    struct activity_group *ag = &guc->engine_busy.ag[0];
>>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>> +
>>> +    return &ag->engine[guc_class][hwe->logical_instance];
>>> +}
>>> +
>>> +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>> +{
>>> +    return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>>> +}
>>> +
>>> +#define read_engine_activity_record(xe_, map_, field_) \
>>> +    xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>>> +
>>> +#define read_metadata_record(xe_, buffers_, field_) \
>>> +    xe_map_rd_field(xe_, metadata_to_map(buffers_), \
>>> +            0, struct guc_engine_activity_metadata, field_)
>>> +
>>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>>> xe_hw_engine *hwe)
>>> +{
>>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>> +    struct guc_engine_activity *cached_activity = &ea->activity;
>>> +    struct guc_engine_activity_metadata *cached_metadata = &ea- 
>>> >metadata;
>>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>>> +    struct activity_buffer *device_buffer = &engine_busy- 
>>> >device_buffer;
>>> +    struct xe_device *xe =  guc_to_xe(guc);
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +
>>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>> +    size_t offset = offsetof(struct guc_engine_activity_data,
>>> +                 engine_activity[guc_class][hwe->logical_instance]);
>>> +    struct iosys_map engine_activity_map = 
>>> IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>>> +                                     offset);
>>> +    u32 last_update_tick, global_change_num;
>>> +    u64 active_ticks, gpm_ts;
>>> +    unsigned int fw_ref;
>>> +    u16 change_num;
>>> +
>>> +    global_change_num = read_metadata_record(xe, device_buffer, 
>>> global_change_num);
>>> +
>>> +    /* GuC has not initialized activity data yet, return 0 */
>>> +    if (!global_change_num)
>>> +        goto update;
>>> +
>>> +    if (global_change_num == cached_metadata->global_change_num)
>>> +        goto update;
>>> +    else
>>> +        cached_metadata->global_change_num = global_change_num;
>>> +
>>> +    change_num = read_engine_activity_record(xe, 
>>> &engine_activity_map, change_num);
>>> +
>>> +    if (!change_num || change_num == cached_activity->change_num)
>>> +        goto update;
>>> +
>>> +    /* read engine activity values */
>>> +    last_update_tick = read_engine_activity_record(xe, 
>>> &engine_activity_map, last_update_tick);
>>> +    active_ticks = read_engine_activity_record(xe, 
>>> &engine_activity_map, active_ticks);
>>> +
>>> +    /* activity calculations */
>>> +    ea->running = !!last_update_tick;
>>> +    ea->total += active_ticks - cached_activity->active_ticks;
>>> +    ea->active = 0;
>>> +
>>> +    /* cache the counter */
>>> +    cached_activity->change_num = change_num;
>>> +    cached_activity->last_update_tick = last_update_tick;
>>> +    cached_activity->active_ticks = active_ticks;
>>> +
>>> +update:
>>> +    if (ea->running) {
>>> +        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +        if (fw_ref) {
>>> +            gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>> +                 engine_busy->gpm_timestamp_shift;
>>> +            ea->active = lower_32_bits(gpm_ts) - cached_activity- 
>>> >last_update_tick;
>>> +            xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +        }
>>> +    }
>>> +
>>> +    return ea->total + ea->active;
>>> +}
>>> +
>>> +static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>>> xe_hw_engine *hwe)
>>> +{
>>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>> +    struct guc_engine_activity_metadata *cached_metadata = &ea- 
>>> >metadata;
>>> +    struct guc_engine_activity *cached_activity = &ea->activity;
>>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>>> +    struct activity_buffer *device_buffer = &engine_busy- 
>>> >device_buffer;
>>> +    struct xe_device *xe =  guc_to_xe(guc);
>>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>> +    size_t offset = offsetof(struct guc_engine_activity_data,
>>> +                 engine_activity[guc_class][hwe->logical_instance]);
>>> +    struct iosys_map engine_activity_map = 
>>> IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>>> +                                     offset);
>>> +
>>> +    ktime_t now, cpu_delta;
>>> +    u64 numerator;
>>> +    u16 quanta_ratio;
>>> +
>>> +    if (!cached_metadata->guc_tsc_frequency_hz)
>>> +        cached_metadata->guc_tsc_frequency_hz = 
>>> read_metadata_record(xe,
>>> +                                         device_buffer,
>>> +                                         guc_tsc_frequency_hz);
>>> +
>>> +    quanta_ratio = read_engine_activity_record(xe, 
>>> &engine_activity_map, quanta_ratio);
>>> +    cached_activity->quanta_ratio = quanta_ratio;
>>> +
>>> +    /* Total ticks calculations */
>>> +    now = ktime_get();
>>> +    cpu_delta = now - ea->last_cpu_ts;
>>> +    ea->last_cpu_ts = now;
>>> +    numerator = (ea->quanta_remainder_ns + cpu_delta) * 
>>> cached_activity->quanta_ratio;
>>> +    ea->quanta_ns += numerator / TOTAL_QUANTA;
>>> +    ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>>> +    ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, 
>>> cached_metadata->guc_tsc_frequency_hz);
>>> +
>>> +    return ea->quanta;
>>> +}
>>> +
>>> +static int enable_engine_activity_stats(struct xe_guc *guc)
>>> +{
>>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>>> +    struct activity_buffer *buffer = &engine_busy->device_buffer;
>>> +    u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata);
>>> +    u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity);
>>> +    int len = 0;
>>> +    u32 action[5];
>>> +
>>> +    action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>>> +    action[len++] = metadata_ggtt_addr;
>>> +    action[len++] = 0;
>>> +    action[len++] = ggtt_addr;
>>> +    action[len++] = 0;
>>> +
>>> +    /* Blocking here to ensure the buffers are ready before reading 
>>> them */
>>> +    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>> +}
>>> +
>>> +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>> +{
>>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>>> +    struct activity_group *ag = engine_busy->ag;
>>> +    int i, j;
>>> +
>>> +    for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>> +        for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>>> +            ag->engine[i][j].last_cpu_ts = ktime_get();
>>> +}
>>> +
>>> +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>> +{
>>> +    u32 reg;
>>> +
>>> +    reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>> +
>>> +    return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, 
>>> reg);
>>> +}
>>> +
>>> +/**
>>> + * xe_engine_activity_get_active_ticks - Get engine active ticks
>>> + * @hwe: The hw_engine object
>>> + *
>>> + * Return: accumulated ticks @hwe was busy since engine stats were 
>>> enabled.
>>> + */
>>> +u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
>>> +{
>>> +    struct xe_guc *guc =  &hwe->gt->uc.guc;
>>> +
>>> +    return get_engine_active_ticks(guc, hwe);
>>> +}
>>> +
>>> +/**
>>> + * xe_engine_activity_get_total_ticks - Get engine total ticks
>>> + * @hwe: The hw_engine object
>>> + *
>>> + * Return: accumulated quanta of ticks allocated for the engine
>>> + */
>>> +u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
>>> +{
>>> +    struct xe_guc *guc =  &hwe->gt->uc.guc;
>>> +
>>> +    return get_engine_total_ticks(guc, hwe);
>>> +}
>>> +
>>> +/**
>>> + * xe_engine_activity_enable_stats - Enable engine activity stats
>>> + * @guc: The GuC object
>>> + *
>>> + * Enable engine activity stats and set initial timestamps
>>> + */
>>> +void xe_engine_activity_enable_stats(struct xe_guc *guc)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = enable_engine_activity_stats(guc);
>>> +    if (ret)
>>> +        xe_gt_err(guc_to_gt(guc), "failed to enable activity 
>>> stats%d\n", ret);
>>> +    else
>>> +        engine_activity_set_cpu_ts(guc);
>>> +}
>>> +
>>> +static void engine_activity_fini(void *arg)
>>> +{
>>> +    struct xe_engine_activity *engine_busy = arg;
>>> +
>>> +    kfree(engine_busy->ag);
>>> +}
>>> +
>>> +/**
>>> + * xe_engine_activity_init - Initialize the engine activity data
>>> + * @guc: The GuC object
>>> + *
>>> + * Return: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_engine_activity_init(struct xe_guc *guc)
>>> +{
>>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    int ret;
>>> +
>>> +    ret = allocate_activity_group(engine_busy);
>>> +    if (ret) {
>>> +        xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = allocate_activity_buffers(engine_busy);
>>> +    if (ret) {
>>> +        xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>>> +        kfree(engine_busy->ag);
>>> +        return ret;
>>> +    }
>>> +
>>> +    engine_busy->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>>> +
>>> +    return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, 
>>> engine_activity_fini, engine_busy);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity.h b/drivers/gpu/ 
>>> drm/xe/xe_engine_activity.h
>>> new file mode 100644
>>> index 000000000000..d44ac3366bd0
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_engine_activity.h
>>> @@ -0,0 +1,18 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_ENGINE_ACTIVITY_H_
>>> +#define _XE_ENGINE_ACTIVITY_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct xe_hw_engine;
>>> +struct xe_guc;
>>> +
>>> +int xe_engine_activity_init(struct xe_guc *guc);
>>> +void xe_engine_activity_enable_stats(struct xe_guc *guc);
>>> +u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe);
>>> +u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe);
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity_types.h b/drivers/ 
>>> gpu/drm/xe/xe_engine_activity_types.h
>>> new file mode 100644
>>> index 000000000000..cad83aed3d0b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_engine_activity_types.h
>>> @@ -0,0 +1,85 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_ENGINE_ACTIVITY_TYPES_H_
>>> +#define _XE_ENGINE_ACTIVITY_TYPES_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +#include "xe_guc_fwif.h"
>>> +/**
>>> + * struct engine_activity - Engine specific activity data
>>> + *
>>> + * Contains engine specific activity data and snapshot of the
>>> + * structures from GuC
>>> + */
>>> +struct engine_activity {
>>> +    /** @active: current activity */
>>> +    u64 active;
>>> +
>>> +    /** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>>> +    u64 last_cpu_ts;
>>> +
>>> +    /** @quanta: total quanta used on HW */
>>> +    u64 quanta;
>>> +
>>> +    /** @quanta_ns: total quanta_ns used on HW */
>>> +    u64 quanta_ns;
>>> +
>>> +    /**
>>> +     * @quanta_remainder_ns: remainder when the CPU time is scaled as
>>> +     * per the quanta_ratio. This remainder is used in subsequent
>>> +     * quanta calculations.
>>> +     */
>>> +    u64 quanta_remainder_ns;
>>> +
>>> +    /** @total: total engine activity */
>>> +    u64 total;
>>> +
>>> +    /** @running: true if engine is running some work */
>>> +    bool running;
>>> +
>>> +    /** @metadata: snapshot of engine activity metadata */
>>> +    struct guc_engine_activity_metadata metadata;
>>> +
>>> +    /** @activity: snapshot of engine activity counter */
>>> +    struct guc_engine_activity activity;
>>> +};
>>> +
>>> +/**
>>> + * struct activity_group - Busyness data for all engines
>>> + */
>>> +struct activity_group {
>>> +    /** @engine: engine specific activity data */
>>> +    struct engine_activity engine[GUC_MAX_ENGINE_CLASSES] 
>>> [GUC_MAX_INSTANCES_PER_CLASS];
>>> +};
>>> +
>>> +/**
>>> + * struct activity_buffer - Activity buffers
>>> + *
>>> + * This contains the buffers allocated for metadata and activity data
>>> + */
>>> +struct activity_buffer {
>>> +    /* @activity: object allocated to hold activity data */
>>> +    struct xe_bo *activity;
>>
>> nit: When comments are added, IMO, spaces between the members make it 
>> more readable.
>>
>>> +    /* @metadata: object allocated to hold activity metadata */
>>
>> Please use /**. I see a mix in this header. I think the /** is for 
>> kernel doc.
>>
>>> +    struct xe_bo *metadata;
>>> +};
>>> +
>>> +/**
>>> + * struct xe_engine_activity - Data used by engine activity 
>>> implementation
>>> + */
>>> +struct xe_engine_activity {
>>> +    /* @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>>> +    u32 gpm_timestamp_shift;
>>> +    /** num_activity_group: number of activity groups */
>>> +    int num_activity_group;
>>> +    /** @ag: holds the device level busyness data */
>>> +    struct activity_group *ag;
>>> +    /* @device_buffer: activity buffer object for global activity */
>>> +    struct activity_buffer device_buffer;
>>> +};
>>> +#endif
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/ 
>>> xe_guc_fwif.h
>>> index 057153f89b30..8b336c15ef5b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> @@ -208,6 +208,25 @@ struct guc_engine_usage {
>>>     struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES] 
>>> [GUC_MAX_INSTANCES_PER_CLASS];
>>> } __packed;
>>>
>>> +/* Engine usage stats - v3 */
>>> +struct guc_engine_activity {
>>> +    u16 change_num;
>>> +    u16 quanta_ratio;
>>> +    u32 last_update_tick;
>>> +    u64 active_ticks;
>>> +} __packed;
>>> +
>>> +struct guc_engine_activity_data {
>>> +    struct guc_engine_activity 
>>> engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>> +} __packed;
>>> +
>>> +struct guc_engine_activity_metadata {
>>> +    u32 guc_tsc_frequency_hz;
>>> +    u32 lag_latency_usec;
>>> +    u32 global_change_num;
>>> +    u32 reserved;
>>> +} __packed;
>>> +
>>> /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>> enum xe_guc_recv_message {
>>>     XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/ 
>>> xe_guc_types.h
>>> index fa75f57bf5da..3a89bfb18307 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>> @@ -10,6 +10,7 @@
>>> #include <linux/xarray.h>
>>>
>>> #include "regs/xe_reg_defs.h"
>>> +#include "xe_engine_activity_types.h"
>>> #include "xe_guc_ads_types.h"
>>> #include "xe_guc_ct_types.h"
>>> #include "xe_guc_fwif.h"
>>> @@ -90,6 +91,9 @@ struct xe_guc {
>>>     /** @relay: GuC Relay Communication used in SR-IOV */
>>>     struct xe_guc_relay relay;
>>>
>>> +    /** @engine_busy: Device specific engine busyness */
>>> +    struct xe_engine_activity engine_busy;
>>
>> nit: Maybe we can do away with using busy/busyness in the Xe 
>> implementation.  Use 'activity' everywhere. Thoughts?
> 
> 
> agreed... I see at least 3 terms for the same thing here:
> 
> 1) utilization (commit message);
> 2) usage (comment)
> 3) activity (struct name)
> 4) busy (variable)
Will use engine activity everywhere, if that's okay?
> 
> Let's settle in one.
> 
> I also think there's a layering issue here with this part of the code
> talking directly with guc rather than adding the appropriate functions
> in xe_guc.c (or show this be xe_guc_xyz.c?).
I initially had the name xe_guc_engine_activity but the function names
were long.

xe_guc_engine_activity_get_active_ticks
xe_guc_engine_activity_get_total_ticks

If this is okay, will rename it to xe_guc_engine_activity,c
Any other name suggestions ?

> And... this talks about "single engine busyness" when we are rather
> talking about per-engine-class, not single engine.
>
Will fix this

Thanks,
Riana Tauro

> Lucas De Marchi
> 
>>
>> Rest looks good. With kernel doc format fixed, this is
>>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Thanks,
>> Umesh
>>
>>> +
>>>     /**
>>>      * @notify_reg: Register which is written to notify GuC of H2G 
>>> messages
>>>      */
>>> -- 
>>> 2.40.0
>>>

