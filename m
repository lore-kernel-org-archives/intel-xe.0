Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4C3C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2171910E119;
	Thu,  7 Aug 2025 11:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyxWN8Ct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3103D10E81C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754565009; x=1786101009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0kw3gydhkznGoaGndz6nrFxUVrrjwwJi56adPRFzfpc=;
 b=eyxWN8Ct9MJVjMGkFRr5GxVBzzO5bLgxfhrCgtipkHnqPBMkNfATpg6D
 bo/U3c9uQggM/VfamLjllv7lPzx9mGqxtZIdcdKnXYpnw2C1ZCPomcSyK
 E7UX8VBXKJKtrd6RDSg+Xpr7zn0zika9aJXW0ssXbQtn3MDcLwO/HgeBu
 z7Nf+Mjn0NPGfNkOGbimbqUsA7HH2EWQerfANTQVI9s3oeAqKy0fDuj0f
 Ag4rIvPCUxZss36RVEFwi4ox0+VMDNJrN/bzFPGG1v4R4eEfGOnMcc3xO
 cP1WsIMyamxdarKaiyNp0RnLX3kqzQdKau+afJZJub3zrzk2D/bTzXSnd g==;
X-CSE-ConnectionGUID: 4OVEv+VcRyOUQncr2p97XA==
X-CSE-MsgGUID: cJxTkR12RymelBeJQJTtpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56106763"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56106763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:10:08 -0700
X-CSE-ConnectionGUID: Q/bKLkpIR26fKdMogbBLvw==
X-CSE-MsgGUID: DbxfRL5vRAOnv2ZIQv7bfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="170294661"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:10:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:10:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 04:10:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy+SlLPBTM+MbYCGeo5Nsr546eHZXfsoCXWJcD7umND1w9/EHxQS5/J5TBof8zF0eRkAny6J5k4xl/7e8qjqrKmYr6Ljz8iw+QmGYugdIB//0KKgF68mnJUrtoiCpxqEvLOGBNl94saMNQG38rsox/FYefOSMnIMezCYlXd2yKb69g5byKi/l3Ik7F/PHdhuDNGm3q4dqsHlc7xSE8eUsKhhQP3ZLtu4mTYNZi6VCF8nLpCaGOQrGVzjjKCIa8ps0BJ81E5pssno7vczngyr/E+VVgUXgZkq8ag2zUhshRkM8yH2JGPYHtfTdPkK0OAc5xxdn5SFDqJGaDrvEdvPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHiBhi6u3+6/wWrtNx8AJZKt+Ld1jen1Hyl5y1gOlKM=;
 b=f/V4KAraVITOPUsix8uohipmG5gxlT6kXBAMJvHr35Kqxr9iiohZ7ixgSm5rWxud/qRp31exkhBSh7NHmKGRcBBl+ivfmliejsr3I00cMyMxSECa+FxgBNYfai1aqLu6EK+nfRYCgjXKePkQ6Vx5zBeHjZgm1pTmrISOg5hfBpQ26EUzbmPUSMz02qP7njdPhO5UwnEKYPB90uDbSaUVTa3sjh94YvRc/s3yRX2pVAL4XSIoh5U7KgrHy8QBp/HLasq5tb81xgd0kdDUZG8RTyFCr0lz0WBNIXnBk6Q4aEjuEjbPGXo+DG+SiXfe1G6ggN/Ow5iKSJ6oz0Um9H2SQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 11:10:01 +0000
Received: from BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::bf0c:ea27:d51f:1625]) by BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::bf0c:ea27:d51f:1625%4]) with mapi id 15.20.8964.026; Thu, 7 Aug 2025
 11:10:00 +0000
Message-ID: <12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com>
Date: Thu, 7 Aug 2025 16:39:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Add SW clamp for power limits writes
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250806172626.3226676-1-karthik.poosa@intel.com>
 <1d47f02d-2824-485a-ab4d-002cbfb06f1d@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <1d47f02d-2824-485a-ab4d-002cbfb06f1d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To BL1PR11MB5254.namprd11.prod.outlook.com
 (2603:10b6:208:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5254:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: d19794e3-b510-4be3-30f8-08ddd5a2f39d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2E5Z0JZcjhsREdGazNxOU1jVkQwN0NCYUhXV3pvQzlsNWtOL3lEOTZSQzdM?=
 =?utf-8?B?VDBhVEV5REtVcHhpZUJyK1FwUlVrWHlCUGFORTh3LzBwbFBDSHVlSTlmWEU0?=
 =?utf-8?B?RXFrODZLUzMzeDVmV0FMcHdPWG0wcXRYa0h1bGQybExFakduSXBLTFZOOTg2?=
 =?utf-8?B?Q1liekFmWHF1d2pNb25XWlRsejBNVDZHM3d6azNPRkJSRmk5NnRhS2FDeWNC?=
 =?utf-8?B?bnlNREtYeDhnSEZLRU5LNTJqNS9URENCaHZ4dDBCSVh1bHNac3huYXprNlR3?=
 =?utf-8?B?aFBva2JzS3U2VnBoNjZXRzZJK1NKZzhxdW1TbFF0dThMcGNqbFlQQ21NT0Fj?=
 =?utf-8?B?VkJHZi91cXRiMi9oOHJqYS9xVDRadlFpVWFNOERZamw1aFlrNU1UblE5cW9h?=
 =?utf-8?B?em1YZXh1V3V5Q0x2REY0VHF4ZjYrVzVXTVBOU09UcEcwSSs3eFhlaUpoZ0x4?=
 =?utf-8?B?S2RVbmtHbjNTTHBxU2NzQi9WNG55U3Y2cU1zYlFoODRDcXZmRStBNHUxd0dI?=
 =?utf-8?B?Uk05L3B5VWxtanN0aC9aZ09uVEQ0dWIyb09zVytZeTI4R1JISk9zMkVNWEJI?=
 =?utf-8?B?dlV6aDcwV0ZCblRZbHhJK0M1bjd3dm5MT3B6Y0JuQXExaG1pOHl5TGx3VzF1?=
 =?utf-8?B?bnBoVHhrc2pjZUdxRjNpZ0ZsVE1Tc2FpY2t1S21IUVdCZTN1WXpPUm9ELzBj?=
 =?utf-8?B?aHRUd0JQQktVVlJ4eTdLUWp6Mndyc21zZzZjbThleWhWWDhvR0ZpR2kxVy9n?=
 =?utf-8?B?WXY5ZGFmeVdzWGFidnVoWVZrZDFzVTBMKytaNWQ0aVR2bWFrTnhpdGNNZ0Fz?=
 =?utf-8?B?SmYvN1BQOGJiaXZtZkJjTW9lN3lnZVZrTkYvMGwrUUtxYlRTeVJiUE5Cd0Q5?=
 =?utf-8?B?QU9WYmtET2RmdUVhTXViZlNZSjRtTkZhN0RmcmRwUzc4RkUxc3hQY29RdWZa?=
 =?utf-8?B?TDdOWTdHcmlhMmlZR21nY0tJbis5S205dndXb0RtZlExdERGK2VkcWFpajBh?=
 =?utf-8?B?Y3R6N2I5MXd1UkVsSEthekRDR3RocGMyZ3pBdXJJTloyOXdEd0ExMGZKQnBj?=
 =?utf-8?B?UGZrUmlEWnNVSW14eSswdmF2Z2ZNMEkybkZUdHUxaE0yUTZ4VjNYK0JiWndE?=
 =?utf-8?B?dW1UWUZjQm5naTg0cjFzZklibmJnaHdwOEZGWVcwd0NTTFRERmpLbWt1dmhj?=
 =?utf-8?B?VWw0WGpHQksxRTk3OG5Ra0NmTmdDRUxveFN2N0ZTNTkzeTJnWEp2QmdNVW9U?=
 =?utf-8?B?R2gxSHFZT0VUNXNFa01DWkNvc0hrdDF4S0lxdzJ5YXFkdFFDeDV0N3dCWDVp?=
 =?utf-8?B?d3FLejF2cUhVQmJlT210c3ZSM2FQTng3Uzh6cGlIQnh4ZVkzeTVSV09ORWM5?=
 =?utf-8?B?MUE2UG5RK0JER3AzZzVPR21MTTJuRDJlOUFGK1hRSmMxeklQTmlNVEVvY3Zq?=
 =?utf-8?B?WXl6enp5Yi9HWVFTQlcySkNpR3FicEtKWkw5K25hWC9Vc2Nvd2lsVnJpeHRC?=
 =?utf-8?B?aFdWTUNYbU5zMm8xTlJQdWYrWExNd0F5bDlzZGYyMkFrRlFpanh3c0ZHSjB0?=
 =?utf-8?B?SS9hUUpkcFQ4UlVacVNtTTNNdExsRnB0YnNTNWp2UjBJZmJYLzVjVlZIZkMy?=
 =?utf-8?B?b0pLWG05eVMvUFNsMFhZendoc0l1WElOaVdzUWJsby94L2V1QnBUNGhwcG1p?=
 =?utf-8?B?ci9sT1I3Z2VmWEhMMkdBR2hya2pPRWZWSHArRDFhWkF0Y0RXekdjamgvU1N2?=
 =?utf-8?B?cUxPZ2J6dHNyek5oQW5NWkpuSEhiZXcveGZVVTZlVE10aExmQVdZU2pEbFV6?=
 =?utf-8?B?UjkxL0tMWjY3WnJISTV2UEg4Tk9EQWNqbG5WYlI3ODU3MWw1bTlzYm55eU5u?=
 =?utf-8?B?dkkzbmk2cEtvR1F2T1RuM3FOdTRWUlVBNnZmR2lsSTJQWlVFNUV2cWhhbW5Z?=
 =?utf-8?Q?uUibOAzyV6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1lCaGVRSkU1TVdKTGM0ZG5TbUZ2bkgzaGNWQ2E1RHp3MXFKU0xyaXE3ZmVl?=
 =?utf-8?B?RVFuV1UwT0FFVEJLK0hLQXR3d2poR2huQko2b1ZNSDZPNWo4REZPR3NjNUg5?=
 =?utf-8?B?azNPdjNZRGJqajdXc0pNbzU5Sm81Q2psSTZHVkdMMG1wY2FYVHI0VXVoRVJy?=
 =?utf-8?B?VFJJOG9EelFXRDQ4N3AzWU1Dc3lyZml2dmlKNjA0a25wWjA5OGFsbjZGYU96?=
 =?utf-8?B?ZTVkTWtWdUlWNkJxTzAwd0VCdzZ5WVc2elBsWGZJd0k3eURmY3FSdi9mV1dH?=
 =?utf-8?B?WkpKZTF6UWxHeWFNVGk3OWdWd2VxVlM5WlIyQ21QTGN1emNvYTNrczQ0dEFj?=
 =?utf-8?B?bWRWUzNmSWxUZS9hdmtRb0cyRHcrWDNlM3kwb3ZoMmVEZm9rNDBPeHdQNlNk?=
 =?utf-8?B?K3JIVkMzbmU4S0psVStCR0o5MEJwZmxLQ2ZNa21KZ0ozb2RLRG0yQThyY2xk?=
 =?utf-8?B?Rkh2dlVjZmZQdzV1eUVnUnVDaWhLTGtvVVRyNzZGUGl0UEh0S3F2V2wwQm9T?=
 =?utf-8?B?SkNvK1QyWlNWVWVsdHJ2TmdlcitiZENiNU90VkdYb3RCMzhzczFaU0I0TTM5?=
 =?utf-8?B?SXZtSzA1Z2JpZFRpRHA2M0F3YXBUYjBmZ3RyaTRVRTlxR2d0SUE0eldMS1Z0?=
 =?utf-8?B?MzFkYVluUExyc3Rudm4weGgwS1hKbTljdzlJb0tENWxEQ0dBckNTMDR0L0Vk?=
 =?utf-8?B?WmNpOG9NU0pkYWRuZ01pYVZlbG1PeFNHZTRvN21POHF1SUc4SEJ6K3oxcUJj?=
 =?utf-8?B?M3RNaU8vYTd4YVJFK0hycGtWN3RRd3p0TS8xczI2Vml5NFRBZ0dGN2RYQTZo?=
 =?utf-8?B?NHdBMERESTB0bHpha3pQRlYvUlBTYnE2cXFoOHVuZkRGRmtMRjJFUmFhNGFn?=
 =?utf-8?B?QnVxTWUzUStxbzVrZDl0MzRZdG5LQ1Rud09SQmtrQ2E0dFRXRDhZem1Lbk1o?=
 =?utf-8?B?YXJRVDZLMnpTSy9vUDJsUnpvSk5Ic1kwQ1VucVRMbHRqTW13d1dhd3JJREFo?=
 =?utf-8?B?QUVuUFI4SUYzMytaWjd5OWRWaFAvVno4MytYQ1kxZTFzR0t0OU1ZRVFCTWkr?=
 =?utf-8?B?SnBKdi94OE45R09XalRSenJjRkU2ZjQ3am1nZmVsbnBLK2hXVU5tdERoMWdJ?=
 =?utf-8?B?R3d3dDJnN3BPU3pEcmlNejRZaGliN2YyVTVwaExyK3BzQVZDKzVlbU5Sbzdv?=
 =?utf-8?B?RWc5dUtxQzd3bERzd1FDK0JBRmF2SXV3bmV2WkVFL050OXNHcVU5bkhGSUxP?=
 =?utf-8?B?d1lBbjNIc2gvQXhHQ3ROY2lFTy96MVFFUVFTT2JaZXdBd0p1NktpVHhyL1ll?=
 =?utf-8?B?VTIrdUlzTUdhaDRYbU5xTjhkOEZFYnU0UlRzZUhsRWh5TVFVVHo3NDY3ZEJO?=
 =?utf-8?B?S0w3QjFSTE83V3lHcUJaYVlpWkN3cTA3UzFNVTc5cXhBS3RQYU5uVWpJb1d6?=
 =?utf-8?B?Rk82aEhScDMrcERhb015YjlIUFY4dzBMMjdVK1V6QzVEejhNYUdzNmgyWG40?=
 =?utf-8?B?TE1jaWk2NDZWUWhtTzFyVDhVVmpYblE0NUVyd0g1V3h0RERaTjdJc1lXMktL?=
 =?utf-8?B?ampKUjBMa01LL2w1ZVJJTzFzeDc4a2diL0NDcmYyRnIzZzBTWkFGVEhhT0Iy?=
 =?utf-8?B?Nk1yU3d6ZEg5aWxFRFdLVmlqMGRYdzhqNU1TZWxEbFZhcGI1VDJHck9zbzlD?=
 =?utf-8?B?eU9LcDZPNXNMcW9zZHhwY0ZSa2pNQ3VTZytOcjEvcFpmek1jcU8wZEYyMFFj?=
 =?utf-8?B?VlN6T0pZd0xGMU9kMU5NbFFzV3BVa29MOGM3UnR0SktGOGpBdGJ5RVoyeXRD?=
 =?utf-8?B?b1d1VG1teEI0Skt1QkJXQk1ZV3NuK255Zi9RWDF1Zyt0ZEU3V2EzVDRXQUgr?=
 =?utf-8?B?c3hJcTV1L25yVFdLdTF1bXd0M09tRmF1RFhONldFRnRubzNib0VYYTVEVzV0?=
 =?utf-8?B?Y1paZmRYYkFlSnJWOEVvdWRXcDNibGJYSFFoYkRlWXMrRk9zNXpWd01DUnB3?=
 =?utf-8?B?c3ZPZFVGcmR5U1BRYk5SR3pzSCt4UjVHVm5VZVJ6Nk9ERUo1ODBsOWwrckRH?=
 =?utf-8?B?MDBVblYwSWxuRTZ2YWo1YnloOU8zdXpRaWJUQlFWcDZZQXdTb0dvYWJEOTlI?=
 =?utf-8?B?ODVPVVRmcWpjQnJSVWprZjI2VUk1UFdWeHVETWVJeThqSG1QaXhTblZBMzJi?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d19794e3-b510-4be3-30f8-08ddd5a2f39d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 11:10:00.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2e6adu2++OFt+IVJIed+nH6YOWjexogvdtTaasNQGRtqgI5cTE7TbGs/lCyK1QLlnDWS3GVO7fiIgV6PrBWyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
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


On 07-08-2025 16:03, Nilawar, Badal wrote:
>
> On 06-08-2025 22:56, Karthik Poosa wrote:
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
>> index f08fc4377d25..768a942ab0e7 100644
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
>> +        drm_dbg(&hwmon->xe->drm,
>> +            "Sysfs value for ch %d %s exceeds limit; clamped to 
>> supported maximum\n",
>> +            channel, PWR_ATTR_TO_STR(attr));
> Is this debug message still needed?

Having this debug message helps to identify clamping from driver due to 
oversized sysfs input. I think we can keep it.

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
>> +        drm_dbg(&hwmon->xe->drm,
>> +            "Sysfs value for ch %d exceeds limit; clamped to 
>> supported maximum\n",
>> +            channel);
>
> Same question here?
same reply as above
>
> Regards,
> Badal
>
>> +    }
>>       uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>> scale_factor);
>>       ret = xe_hwmon_pcode_write_i1(hwmon, uval);
