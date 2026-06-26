Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44278CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6A10E34E;
	Fri, 26 Jun 2026 11:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INapbA+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E65B10E34E
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782473176; x=1814009176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Ze2OP0b4YF34PMAMt/+1l9BjlAFxSv0UqL8oChB+vM=;
 b=INapbA+fvyYKbXRHdA4Hwcwo9xXwl6a51qHB/luRdY0odqgMSYwn/Rhn
 qE00S76YpzHEfhxqMa6UAMtpRfBFMZeXHzH3Qbop3LGHs/hPhIGPdKNu7
 Af3qxLj4jZWS4F5WM0daEtfXgvKDSMlDPVpBXidiFMBXhC6RFfQXroFCu
 Lpt2bsch2JQqDJ1/RUWwtmfzO2kIpZOPQsEYskm4flaPAHigghTzBwKHz
 uX8DQIFrKxo9vzbTaGuTHPpKBLcdsrowULBY1PFkj8/9GUThyIxKPI+xP
 kAOI6Ro3MdpumM22CjXFOxrWyhsZtsNnsMDs0LgUQIcxciUA+eXcAuOSN g==;
X-CSE-ConnectionGUID: grSnGgA+TmyQsy3V8QYR+A==
X-CSE-MsgGUID: gO9eTbeNTv2OwV7rWPG6Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="87111398"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="87111398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:26:15 -0700
X-CSE-ConnectionGUID: ZrKFPNW0SBiVMqCd1fA3Iw==
X-CSE-MsgGUID: T4TUWKe6Qf6r5pqyFzBK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="248665137"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:26:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 04:26:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 04:26:15 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 04:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8EB73NGHCM3Fx4gPWr8rvvW2fhbwFIMogsu3bOS3g4lQZjOG+YTWwxpBC4S6+882aC3DYw7l5XFEajCXqnUpM7XZB0lmbIX6VogsRctlLIX7SXZxeuO33uy9EmPEE2fHC/Nk/1d5KV6fZ/dfwJgGZxCI4YVkZDjWROlWmLZilPwiBgosj0a+YaZsm5FoVM/xfNwwA4k84H3RUz5oggOIBmZEgLRIzu6RHCm1TbUECL39GKZMlLoIgViVZP6Atu1Y3eeAALONgRrQiHwSi9TqzVLTe5YaOVAuYneMLY4IIbJElNDotnc88Ewks9hKv9NM37OWsYs8oS/RN3tXFpcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SdMK0zdVf6yomuympwumkqabcq7lTSnq8KicRhLUsQ=;
 b=MPuJZ5+lnYfxnDvoYY3+lqeWLOb7kp2sMtX68zmhZ7MshfTivEWKPs7H24qpWo0A14EqztycHzBGF+rs8vv1y+iOPpCAIn+eifRwMxxPO5lNMiDmz3rtD1NcfiSH/6VoF6r6c5mJLUwQbXnB3Etk3VZSztEiV8+oSfQHs67rRb2C0WbiH4125g1peVZk1PzzXSwSAynqzghboW0oqQ6zIh5kDt1zPsz2LbXk+DiSnFUeVgIsAi0WY7+XEy7Aw+zgSrE1+8TCQbkwutA8PfgpaeiXdBUlcZRRpQ1SNOcXtN5+7hRuZPV7NZHofJ7YQQpW/UKTIMWars1OS+t+cSPMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF9FBA0498D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::848) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 11:26:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 11:26:12 +0000
Message-ID: <e1c64344-07c3-48f9-b943-a5b1dfa9af06@intel.com>
Date: Fri, 26 Jun 2026 13:26:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Matthew Auld <matthew.auld@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
 <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
 <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
 <b992c4c5-4934-4015-b6e6-f8d13435d415@intel.com>
 <63fd304b-9b4d-4d8a-b609-25a807050448@intel.com>
 <e3e0025a-efb1-4c74-ab5d-83532a689474@intel.com>
 <d8562f46-cb43-4d66-abc8-35143466bc17@intel.com>
 <32cdb954-c2d1-48cb-b847-80d5687b5ff0@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <32cdb954-c2d1-48cb-b847-80d5687b5ff0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B85.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::617) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF9FBA0498D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5419322e-5f14-411d-a83c-08ded375ba74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: eSP3irTpeDyS7wycybkzZJ7yskZVphjG3fuzjEnIXYzKqXq2hhTnoyJmaKI2OkAKAV6v/c5jS3nWCvsZRe54kEg2BIlZdt/pJ8e250kGRT2dH6EKeKRkj0K7BpcmJl9FHk8aLyurmGPTrWTjrAlusjf6PkyPbUnDCH3XeTWeycyZQB+qEkz2YYXWqp9BncmCP1sBUbZIbQQlnA3TmCayj60Oz8CoV300qLuKn04Hgz7hTvWLK3BD2pYRQfL4DTuJRGtSx+yMB5zTJ1dTjZxzBPcT7/7Cm17NtQj+yGPFTPaDaG+4zukqghJCB/rpgz2mdb6j1N+5wpvLYG38SCQ4ThMufXfrGwcTSQe8TPZyTPR7Xn8t8olM3vWAfaQVtDC0646g0+9Pk6M1GgkjBR0fOZ20Cf4cqo/rNeO91mUVqg/UzdN0426NdTUul5E7q3dgRwI8LEWuA48yJ+ldHi58XBv09OjBYwZTFYc9kvRvlkmfSq80bbEf6XgbodO1wFVOkYKGnfOUqCzv32zPx0TmgxsD2MG73ZVOrgkyQLOj5FgBZMC52jzcCWJPGfmGvusfxLn9VOWmiQlm6ZmyENyOkHsZN9VE4NMYGhDrIeY3fuG3ezO7Xt7FOCfi6sVXX5acR4m4hROIp7TvMo4paYM+I8QVKo/6xnWSUQVKFa6w5XM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBnbUxrQVpxdHA1dDM3QzRacXZ0c1NwK1A1SUJjNGVWQVRBd0VQNDNQSThu?=
 =?utf-8?B?WVBPQWtLa2krNVVVY1MvQmFXZmVzMFVpajRzV3ZCVmt1OGJ2aFVOcmpwaUNM?=
 =?utf-8?B?d3V2Qkt5TEFsaHdHS3VOVWtIamp2OHlmRVhYUXkzdTl4d09iVDBlTzkrdDgz?=
 =?utf-8?B?ZSt1aCsxZDZrV2g5bmJpU1dER2ZHNi9VYlpJSlRWWURMWHdsZ2R4ZzZYRUdN?=
 =?utf-8?B?R0IyMDNpME16NS84SytkbDRUdTNHN0JzVnc4c21sdTQrS2tpN0piTG5pcU4z?=
 =?utf-8?B?V0xPVnZXaVd6ZE9aNWtaY1dPUTRLWlNYN20zbXp6d3IwUnlCY2tFUmhyQ1BH?=
 =?utf-8?B?QlRRWSswQTVLbTBvS3ZYVmRYSWtOKzlKMjV5U3ltdFZHTFNINXlkQlEzOXVq?=
 =?utf-8?B?T2dIMUgzRENjczZoejdvZ2Q4akV3UmQranFZOUsxcVdIK1Q1RUxiWDNGa2lI?=
 =?utf-8?B?b0NqRlVCNjFSc3NkVE5QcE1DTkJMMlNVMTdmRUpjSzBOZjYrTlc2U0NPRkJZ?=
 =?utf-8?B?SjczNTd2NnVMUlgyU0IxRVo2YktDOEFZVStwK0M3TEpicDhIYU9rcEFhejRl?=
 =?utf-8?B?bGp3bUhYOGx2TjBLVFc5elkvSjFRK2hSVEpMVm05TTJhdFg1cUhTdVIzcERL?=
 =?utf-8?B?cllDdnhGWVVSWFgwaDYzQWRtT2g1Rjk0T09SNUdoSDNXRExiSytsZUJWMHEw?=
 =?utf-8?B?VTVsZHVDTDF2aEtXQkpUMnZaTVE2b0tnODRrRHpPOXFGdzA0ZkxtcGVLRzEy?=
 =?utf-8?B?RjdvNndZeUxIM1FrMUExT0pGcHlBdVFkN2Zhd3kzMUxyMXR0RFpNZW8rZlBj?=
 =?utf-8?B?Zk4rbTduZDkzMUE2SWcwWUdDUVZyVFVsZXAwVFozRm5xOE5mYjFNTFFIUkJW?=
 =?utf-8?B?MUVaWjhRK3hDMG1xbEFTeUduaThWWVg1cFNob3BKakkvU2xEUjFEcGJBRm1D?=
 =?utf-8?B?eVpPQTl4VjZKSFYrbkk4T3l3TSt4QWtsanYzMDlPcmJRckEzZGtBLy9rVVRM?=
 =?utf-8?B?VzdDM1pGOEh1RENVSjE0NFQxTmFDRCtNNnhQMjgwRDdqc2VyTWpxVTlNSHBo?=
 =?utf-8?B?c3QxSXZpc3FGNzJIVzVXRlZ0RkpzRGlCUFUvaEIzNm5JbjdpKzlZSFlsMkpZ?=
 =?utf-8?B?THNVUlhoeUNxanNGdUNSdkhtUjhROU1iQ2JpeDd1RExoQTNrU2EvZG1YUTBx?=
 =?utf-8?B?ME54WXl6bnFoRktZMFQwM3pabUJvZmZYWjJjS3A4YkY5OEU2enJEL0s0ZDU1?=
 =?utf-8?B?ckdIcmJQbmxtS2lqU2NFSXdEUENqSHNhb2FraUN6clVvZE1NOTFGYmI3WnEy?=
 =?utf-8?B?ZlZTZmtZaGNoVXh1WHJEcmZEQVdlWEhVdWJaR3NSMzJrcG54UzA0Qi9KbEFp?=
 =?utf-8?B?UHo2T2FRZ2RUekNuR214TjdJTisydzhjQ29DTmpzcXd1MFVJeHFNUW1Ydnk1?=
 =?utf-8?B?ZkprUmRhTVdPVzdFZ3FjQzQ2RS9zL2tWR3JIOENldHEwNkdmYUp0ellWZFU2?=
 =?utf-8?B?aUFPd1VjeWxlaHBUd3cwTGtBK25zM05tQWQ3WXVsZWpSbVMzNUlQd3ltVlFF?=
 =?utf-8?B?bW84N1dlNUREcXpPSVJtbERUeWxSRFR5Mk9wRzFyTWxLYVZ2cnFWLzhXdXdC?=
 =?utf-8?B?UVZtSVQ3ZC9RRTh3S3FPMVFNUVZMY01VL1M2czllVmI1MHoxVE5XaDRzc3VM?=
 =?utf-8?B?eXdFY1k0amlOdXlJU0I3ZkFrVVZlRnhWWWRaMW9HaWVCMkxSNHNiOFF1S21m?=
 =?utf-8?B?ZXVVRjg1ZzVXZDNualZiRDZGVHVIbGl4TzFhRnp3QlNuTzFRU0NxY1pqeDlx?=
 =?utf-8?B?MnNtZWNYNWNibTZ5c1N2K00rWXZ4SzFGUlZwUTFWbE44bzBERG84R2w5dXMr?=
 =?utf-8?B?d0o0V0YzYnFYbytXMnFGRDBVVnFwQnVIb0ZiTmxQc0l1QzczMk1UNkN2eCtG?=
 =?utf-8?B?Tnp2K1Q1VDlaVDNsbko5RS9xc0wvTHFLK3hCSEhrT05IZTlUOHFad2lIVFpZ?=
 =?utf-8?B?cmN3cnlUWi9ka0VXenpQVzRQelJFem1rTXZmQUJKeWRLUHpDNGpwc3hFaGZ0?=
 =?utf-8?B?cStHQWNRTVFzb2h2YkloN0NIcVRxNEdEdUtpdGxraDAxdmVQdWRIVmpQOFFD?=
 =?utf-8?B?bUxPUVk0UDdERWNWUStBeUtNbys1cHM1VW15a1I3cmJ0NEdBa3dwTFltM2Jr?=
 =?utf-8?B?Y3VxVkdHVUtHRzg3VXNzcXl1NGQ5VW5nTm85OXlwRzVTa1ZlZ3hhd0NSVCt1?=
 =?utf-8?B?VFR0SzFOR2hFaGJWWUtXeEhSTHZZQktSTUZqbkxVeXA2NkJWRnBORU1MYWgx?=
 =?utf-8?B?MkFmS1BEb3pkQnlRZmVYSmUxYm8wUm1rSEpZTVdjaXVtM2Frb24vaTFkdXV0?=
 =?utf-8?Q?OzMS7keTf/GCf+bc=3D?=
X-Exchange-RoutingPolicyChecked: nsFt+EHDIzSLcXXYIXELmpPI/4VK4e4GG3R2hNOXkkJwq4Forz+RiiRN3YahVaLYjDUb9fhnlPdq6wcjAFsqTnVBa3yJCIY3Sik/wO0UVZj1kvmMsiVEqCzUmpJHBHOe9mbic2c+LhjIp2UvdTQezI8/pSohWocUTf06nowAwZtOjxGG+1UBxv/hTy1LE7duEBNHBk7wR5oRyGgRHE/sSzpUWhNvnmBVGFDsnvCIlExe5qthc3oh2v9kb9T0TccaesVAXJ+vSQ4LbNL9S8i6J4ROdZbS9V6q7tq9Pq1FEMT/kIEOQj5KTc+Bd6FiMlS7PV3EYNdvDUAThLh94zrsFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5419322e-5f14-411d-a83c-08ded375ba74
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 11:26:12.8341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz9vrZosUFdcN6OJMaP8GxAxQzHFiIc1pjIYTiUHLOlydvKR/2O015/u5Q5taG4V/mCdGdZMJMSOoX4iJEG1zNdBvDlQzuVdkWhYDo0D5jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF9FBA0498D
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



On 6/26/2026 11:49 AM, Matthew Auld wrote:
> On 26/06/2026 10:42, Michal Wajdeczko wrote:
>>
>>
>> On 6/26/2026 11:16 AM, Matthew Auld wrote:
>>> On 25/06/2026 21:58, Daniele Ceraolo Spurio wrote:
>>>>
>>>>
>>>> On 6/25/2026 1:53 PM, Daniele Ceraolo Spurio wrote:
>>>>>
>>>>>
>>>>> On 6/25/2026 1:40 PM, Michal Wajdeczko wrote:
>>>>>>
>>>>>> On 6/23/2026 7:50 PM, Daniele Ceraolo Spurio wrote:
>>>>>>>
>>>>>>> On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>>>>>>>> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>>>>>>>>> When host PF writes the logical configuration for the GUC PAGING engine,
>>>>>>>>> the VF is meant to query it, and mirror it. Size of N means we have
>>>>>>>>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>>>>>>>>
>>>>>>>>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>>>>>>>>> should be zero on older platforms, where we should simply fall back to
>>>>>>>>> the old behaviour.
>>>>>>>>>
>>>>>>>>> v2 (Sashiko):
>>>>>>>>>      - We can't call use the guc_has_paging_engine() this early in the VF
>>>>>>>>>        code. With that just unconditionally do the query, if the GuC is new
>>>>>>>>>        enough and take the value as-is. With that drop the -1 special case and
>>>>>>>>>        just let the upper layers figure out the rest.
>>>>>>>>> v3:
>>>>>>>>>      - Also update xe_guc_klv_key_to_string. (Michal)
>>>>>>>>>      - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>>>>>>>>        tweaks. (Michal)
>>>>>>>>>      - Update with final GuC version.
>>>>>>>>> v4:
>>>>>>>>>      - Just fallback to manual reserve when vf reported paging engines is
>>>>>>>>>        zero. Will revisit in the future.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>>>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>>>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 ++++++++++++++++ +++++++
>>>>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>>>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>>>>>>>>     drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>>>>>>>>     drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>>>>>>>>     6 files changed, 91 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/ drm/xe/abi/guc_klvs_abi.h
>>>>>>>>> index 644f5a4226d7..753c049d2fc8 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>>>>> @@ -52,6 +52,12 @@
>>>>>>>>>      * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>>>>>>      *      Tells the driver whether scheduler groups are enabled or not.
>>>>>>>>>      *      Requires GuC ABI 1.26+
>>>>>>>>> + *
>>>>>>>>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>>>>>>>>> + *      Tells the driver the paging engine configuration.
>>>>>>>>> + *      Paging engine logical instances are guaranteed to be dense starting at
>>>>>>>>> + *      index 0.
>>>>>>>>> + *      Requires GuC ABI 1.36+
>>>>>>>>>      */
>>>>>>>>>       #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY 0x3000u
>>>>>>>>> @@ -60,6 +66,9 @@
>>>>>>>>>     #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY 0x3001u
>>>>>>>>>     #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>>>>>>     +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY 0x3003u
>>>>>>>>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN    1u
>>>>>>>>> +
>>>>>>>>>     /**
>>>>>>>>>      * DOC: GuC Self Config KLVs
>>>>>>>>>      *
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/ drm/xe/xe_gt_sriov_vf.c
>>>>>>>>> index 0cd9d77f3351..0a11e63f470b 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>>>>> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>>>>>>         return 0;
>>>>>>>>>     }
>>>>>>>>>     +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>>>>>>>>> +{
>>>>>>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>>>>>>> +    struct xe_uc_fw_version guc_version;
>>>>>>>>> +    u32 value = 0;
>>>>>>>>> +    int err;
>>>>>>>>> +
>>>>>>>>> +    xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>>>>>>>> +
>>>>>>>>> +    if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>>>>>>>>> +        return 0;
>>>>>>>>> +
>>>>>>>>> +    err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>>>>>>>>> +                        &value);
>>>>>>>>> +    if (unlikely(err)) {
>>>>>>>>> +        xe_gt_sriov_err(gt,
>>>>>>>>> +                "Failed to obtain the number of paging instances (%pe)\n",
>>>>>>>>> +                ERR_PTR(err));
>>>>>>>>> +        return err;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    gt->sriov.vf.runtime.num_paging_engine_instances = value;
>>>>>>>>> +
>>>>>>>>> +    xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>>>>>>>>> +    return err;
>>>>>>>>       return 0;
>>>>>>>>
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>     /**
>>>>>>>>>      * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>>>>>>      * @gt: the &xe_gt
>>>>>>>>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>>>>>>         if (has_gmdid(xe))
>>>>>>>>>             vf_cache_gmdid(gt);
>>>>>>>>>     +    err = vf_cache_num_paging_engines(gt);
>>>>>>>>> +    if (unlikely(err))
>>>>>>>>> +        return err;
>>>>>>>>> +
>>>>>>>>>         return 0;
>>>>>>>>>     }
>>>>>>>>>     @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>>>>>>         return gt->sriov.vf.self_config.num_ctxs;
>>>>>>>>>     }
>>>>>>>>>     +/**
>>>>>>>>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
>>>>>>>> nit: we don't do any query here
>>>>>>>>> + * @gt: the &xe_gt
>>>>>>>>> + *
>>>>>>>>> + * This function is for VF use only.
>>>>>>>>> + *
>>>>>>>>> + * Return: number of GuC paging engine instances configured by the PF.
>>>>>>>>> + */
>>>>>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>>>>>>>>> +{
>>>>>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>>>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>>>>>>> +
>>>>>>>>> +    return gt->sriov.vf.runtime.num_paging_engine_instances;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>     static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>>>>>>>>     {
>>>>>>>>>         u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/ drm/xe/xe_gt_sriov_vf.h
>>>>>>>>> index 79878f21b1da..d171a8242a34 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>>>>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>>>>>>     u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>>>>>>     u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>>>>>>>     bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>>>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>>>>>>>>       u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>>>>>>>>     void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/ gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>>>> index 80562ffadb16..21cb9bc1a341 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>>>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>>>>>>>>             /** @regs.value: register value. */
>>>>>>>>>             u32 value;
>>>>>>>>>         } *regs;
>>>>>>>>> +    /**
>>>>>>>>> +     * @num_paging_engine_instances: number of configured paging engines.
>>>>>>>>> +     */
>>>>>>>>> +    u32 num_paging_engine_instances;
>>>>>>>> nit: can we move this up near .uses_sched_groups
>>>>>>>>
>>>>>>>>>     };
>>>>>>>>>       /**
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/ gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>>>> index 97600edda837..be992b8da9a1 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>>>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>>>>>>>>         /* GuC Global Config KLVs */
>>>>>>>>>         case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>>>>>>>>             return "group_scheduling_available";
>>>>>>>>> +    case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>>>>>>>>> +        return "num_paging_engine_instances";
>>>>>>>>>         /* VGT POLICY keys */
>>>>>>>>>         case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>>>>>>>             return "sched_if_idle";
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/ xe/xe_hw_engine.c
>>>>>>>>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>>>>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>>>>>>>>         return err;
>>>>>>>>>     }
>>>>>>>>>     -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>>     {
>>>>>>>>>         struct xe_device *xe = gt_to_xe(gt);
>>>>>>>>>         unsigned int num_copy_engines = 0, num_paging_engines = 0;
>>>>>>>>> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>>         if (num_copy_engines && xe->info.has_usm)
>>>>>>>>>             num_paging_engines = 1;
>>>>>>>>>     +    if (IS_SRIOV_VF(xe)) {
>>>>>>>> maybe:
>>>>>>>>
>>>>>>>>       if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
>>>>>>>> or
>>>>>>>>       if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>>>>>>>>
>>>>>>>>> +        u32 vf_num_paging_engines;
>>>>>>>>> +
>>>>>>>>> +        /*
>>>>>>>>> +         * PF could in theory reserve multiple paging engines, which
>>>>>>>>> +         * internally the submission/scheduling backend can load balance
>>>>>>>>> +         * from. Not something we currently expect, but we are at the
>>>>>>>>> +         * mercy of the PF, so we just need try our best to mirror the
>>>>>>>>> +         * paging configuration.
>>>>>>>>> +         */
>>>>>>>>> +        vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>>>>>>>>> +        if (vf_num_paging_engines) {
>>>>>>>>> +            /* This should only be non-zero on NVL-S+ */
>>>>>>>>> +            xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
>>>>>> missed this one: I'm not sure we should use assert here:
>>>>>> it's not our fault after all, but it's misbehaving PF,
>>>>>> so either we silently live with that or abort
>>>>>>
>>>>>>>>> +            num_paging_engines = vf_num_paging_engines;
>>>>>>>>> +        }
>>>>>>>> hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?
>>>>>>>>
>>>>>>>> can it be due to GuC FW being older that 1.36 on NVL-S+?
>>>>>>>> can PF skip programming paging class on NVL-S+?
>>>>>>> PF can indeed skip programming the paging class and that is a valid (although currently unexpected) scenario.
>>>>>>>
>>>>>>>> maybe 0 on NVL-S+ is a good reason to abort the probe?
>>>>>>> The expectation from the GuC side is that if PF has reserved a paging engine then VF must match it, but if PF hasn't reserved a paging engine then VF is free to reserve a BCS to do paging.
>>>>>> but then this paging engine on VF side will not be a paging CLASS, as the rest of the code may assume
>>>>>> or it doesn't matter for the VF?
>>>>>
>>>>> You're right that if we reserve a BCS (like we do now on current platforms) then it needs to be submitted as a COPY class and not as a PAGING class.
>>>>> It looks like xe_hwe_to_guc_class and xe_hwe_guc_logical_instance might be unconditionally returning PAGING class on VF if we're on a setup that supports it even if PF has not enabled it (unless I'm missing something), so that might need to be updated.
>>>>
>>>> I was indeed missing something :)
>>>> xe_guc_has_paging_engine(), which is used in both xe_hwe_to_guc_class and xe_hwe_guc_logical_instance to decide if COPY or PAGING class should be used, on VF returns true only if PF has reserved a paging engine (see patch 10); if no paging engines are reserved the code should automatically fall back to COPY class.
>>
>> hmm, so maybe we should move that VF chunk from patch 10 to this patch here?
>>
>>>
>>> Yeah, should "just work" either way.
>>
>> ok, so either way, with at least assert fixed,
> 
> For the assert can we go with:
> 
> if (xe_gt_WARN_ON(gt, xe->info.platform < XE_NOVALAKE_S))
>     return -EINVAL;

that should work but will look like we're complaining about the platform ;)

maybe if we start with the VF case this could be:

int hw_engine_setup_logical_and_paging_mapping(gt)
{
	num_copy_engines = ...

	if (IS_SRIOV_VF(xe)) {
		num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);

		if (xe_gt_WARN_ON(gt, num_paging_engines && xe->info.platform < XE_NOVALAKE_S))
			return -EPROTO;
		if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
			return -EINVAL;	
		if (num_paging_engines)
			goto done;
	}
	...
done:
	xe_gt_assert(gt, num_paging_engines < num_copy_engines);
	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
	return 0;
}


> 
> ?
> 
> I do think we should treat it as some kind of error. I think from xe pov, we will be missing coverage for this combo of GUC_PAGING + pre-NVL + vf, so can't say for sure if it will work or continue to work, or mabye just blow up in a more obscure way later. If this does actaully trigger in production we can revisit?
> 
>>
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Thanks.
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>>>>>>>>> +        return -EINVAL;
>>>>>>>>> +
>>>>>>>>>         reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>>>>>>>>           /* FIXME: Doing a simple logical mapping that works for most hardware */
>>>>>>>>> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>>                 }
>>>>>>>>>             }
>>>>>>>>>         }
>>>>>>>>> +
>>>>>>>>> +    return 0;
>>>>>>>>>     }
>>>>>>>>>       static void read_media_fuses(struct xe_gt *gt)
>>>>>>>>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>>>>>>>>                 return err;
>>>>>>>>>         }
>>>>>>>>>     -    hw_engine_setup_logical_and_paging_mapping(gt);
>>>>>>>>> +    err = hw_engine_setup_logical_and_paging_mapping(gt);
>>>>>>>>> +    if (err)
>>>>>>>>> +        return err;
>>>>>>>>> +
>>>>>>>>>         err = xe_hw_engine_setup_groups(gt);
>>>>>>>>>         if (err)
>>>>>>>>>             return err;
>>>>>
>>>>
>>>
>>
> 

