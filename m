Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FE4C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 09:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102810E610;
	Tue, 29 Jul 2025 09:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dv28d3m2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AED910E60C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753782235; x=1785318235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6LEV/NHYQHw7KT6bqe3EQWjbIBYtrOw7nh5j4sDsiyo=;
 b=dv28d3m2DjeVx8qbeA0ZYcd2AIDdRU6s6fRu7lGzAEhG7dvtAGhVcV9x
 WmfpKCxkGD3sjXh1vPvp77oNcG6taaqu14eyNYQ2D7Eh0kSIDxxGI/967
 raECGalqsHIB7D2NIQG3SEt5aENF2PAcNYA6hiCECwf0q1bSvdkEWueBw
 fnEutBlWBumjA5yRoYB4SBhRXw2GaMzWHWOTRAeAqsZM2/Wj3uQ91yIX9
 EqaNd+3878QfWC5/QuUFCfWSz50EijEIcxVp2HHwYPJoqnCFfenpsMFix
 0uVGaYwIjAO5wKuClWj6iIF3m20sEPyPGh4PgOF6yz1CIjPCdM2O2d+oA A==;
X-CSE-ConnectionGUID: EEYwLokzS2qoi9whJv+rWQ==
X-CSE-MsgGUID: tyiwbon8QgWdSgN6Z5IqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67400193"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="67400193"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 02:43:54 -0700
X-CSE-ConnectionGUID: kzDMCg9ISEm/+7t/SmgpkA==
X-CSE-MsgGUID: oLaH9D+rT9ORhRC5pGEMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161921381"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 02:43:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 02:43:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 02:43:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 02:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNe4ATJWYBmLOT4Un3Xe3zlg8ugQ33anZ78d5qSw9ojWaJGBTsSr8+urlXCsRHRPtsf+SUN+B1ApZ9TE5L0sckjlC4E2VasGxeSqwQyFGPnoLaiZi9Ml4ZeiL3EGDtIqxm8qQc7eQBrKWjHcd1VqTTWIMiRu+q2TGzh2wnOqECqKT+pN+IJQCOTrfcDM8bH1bWoDtCyYn3G5EE0CwBJjJP8WonF0JpZJMMmTNCBJD4OEEEM7Alh+70R/awS5pSxvLW3bC4fvsuRT/qcleg05zKWkYPl/tqhbpPRfJ1p2kCtFk6mk6Z4IYXpcnRcMmRZRT1miO0DmT2gHq/iSZrEfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1mVd6ZAEZE6zKgS/oymJWx1aexndVFeCNBOst9jxks=;
 b=DfkkuZR5hjO2+h8n/wM1PHazvsayYntZy45zV6sd+HufPCNcOI41L8PH4OCZpR4OoJ+5WOKVzYEjH+ijPWxiExw+4Ol4stwwGXhi2lH4dayEoLrp43gsVeilyJw5/Wm8vAx2MeINe3sWib91/5m3rt8BRGRZocN2rIX8Fvv6nvLvvEoTkUr5PIexXEPU7R/ct4QeM4ZhILuVsqluPYE0bj36KfouA7Y0cExEyPcl7Kg1sfYUG3KldcSRX7i/oRYTVCCGVm1+l+pgILpQrBeQJ/zsr/skHTuTlt1fVstldkg7Ngc8IyP89SyAYJtxZjWKA3BUOxaSTXt7v6HqQw0xwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW3PR11MB4521.namprd11.prod.outlook.com
 (2603:10b6:303:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 09:43:36 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Tue, 29 Jul 2025
 09:43:36 +0000
Message-ID: <fbd8a6b6-0802-4698-9e8a-751cdaa87b15@intel.com>
Date: Tue, 29 Jul 2025 15:13:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/23] drm/xe: Implement madvise ioctl for xe
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-11-himal.prasad.ghimiray@intel.com>
 <aIhFeh5rSjtg3W3K@lstrano-desk.jf.intel.com>
 <aIhMtuEl8oBBapGS@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIhMtuEl8oBBapGS@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 239a920f-2759-4cea-1198-08ddce8463ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajhUM0tCRU9aeVNEN21lTWNFK1N0ZFppZFpjSC9Ucy9UWUFyZ2I2Wkw2RlBF?=
 =?utf-8?B?RVlMMnpQVVNhUVVVQmhkcVNLZlRLakpVVE9oUXoyMFc0eTZNRUNOUEJmU2Rp?=
 =?utf-8?B?bk5CMTRSZEhJOTR2Yk1US2dLVFRVYmFUTWg5aWZNTFZPeERXeUhrTFhlNW1V?=
 =?utf-8?B?NVAwQmtTRXJXT2h2U042R1VoQVNYU1ZhcHQ2dHBPZWxMV0hlVjZ1N09Ob3lJ?=
 =?utf-8?B?QUR4eW13eHpHenZGTm1YMWhCcThBSGthUzYwY043OXZjVDdKWkN4VHlKdWV1?=
 =?utf-8?B?S3NSamhLUGFSUnRJVCs5ZXh5RWRsc3RpQkJCN0ZvM3FmYUhyL1JCMGVlRHpo?=
 =?utf-8?B?Q3lpTUdsTnAxcVI4Z21jRU00VCtXUWhPRU9CV2NpNks3bVNaaU9iQ0owUm91?=
 =?utf-8?B?eDFBQmpXc0ZyR2hrak5DMlJqT3FLV0szQjFkY1hSR0NuYWk4bHNRNzl3NWVn?=
 =?utf-8?B?YXV2VkgrL3FjU1RNM2F3ZlhqMHlUSlIwU2dDRE1QVlBENFNqK1FCUGFEeXZP?=
 =?utf-8?B?Ni9DMHdZZ3pkY1plV3l5S3k1blFaM21lcTN0bkhpSFE0dnFCT3g4UVl5YWV5?=
 =?utf-8?B?QkVoTHRISnNUclY4bHhWaDJoaWhsYktVR29kUzQrNjJSR2NySmlTUW9KbTdT?=
 =?utf-8?B?c1JuOVVWdm9qb0pVVSs0dGlBdWZFZFFVSmF4RXc5T2FCNFJ6K0d3U1FWTGZq?=
 =?utf-8?B?ZXhKWVlTNVEzSmhpSHI5U3lzSEFjZi9oU0F6N0FCZHdQd09WQ2tCZ0JpcXJh?=
 =?utf-8?B?cktvRHhGMkJSV0t0YUlXbjc4R2N0QUNUV3NiaVMyS2d2VERPeG5KVXhSZVRy?=
 =?utf-8?B?d2Z0MlQ3YkNRVTlMK2NOem5Ydkp0Mnp1bGFWM3g2MDZiK1dxZzI2VnZtd3JL?=
 =?utf-8?B?d09PUkFITHlmNFRKN2ZIdFZmUVExM1dXKzFjZE44Qnh4MlZwYkkzSU5sdDEr?=
 =?utf-8?B?V0RpMEgrQ3JabUF0SCtIY3BIeXN4K1l5aUJYMVZZZDZYb1g5RnREaXdlUklu?=
 =?utf-8?B?cDVmU2xxOXNBY1B1dXFnY0VNRk9LdkROS0VLMSt4eEpwVnVqR1p4Zk1NRWpG?=
 =?utf-8?B?d282MWtpdWZ4c1o4bW9xRExRbU5WNUduRFFwTGdBRlZST1RWSmxUc3BiL3dm?=
 =?utf-8?B?SlVrakdKYWtRWWI2ZnkxU0QwY3ZFUnNuZ3dYaHZzdWcvU3ZxMFkyYmpyRWFR?=
 =?utf-8?B?Z0ZLeWwwZ0VSNjlVcml1bzh6Y0dZSEM2QTNQbEFtc2hhckNicDJzS3hiTnJU?=
 =?utf-8?B?Njc5c1JIWGk5N1hoNWxGd3JDNnFMbGRYQjJxcGxzK3RKQW9laG54SWEyUURR?=
 =?utf-8?B?MUlLRG1LQ041QitkbjJoTHRYY2NxaGN3dDJRUzJVV29Fak9jVXA2b0tzUCtB?=
 =?utf-8?B?VXB2Ykp1bUprY2duV1ZxeHE1ZmozejdRcExoSTdjejVBYlFTakwwYWdhazFo?=
 =?utf-8?B?TlJBYWNMYktnaGQ5MGNqN2NGdGJxTURRK1VvMDcwaGZ6eStFdTNFR0FTRC81?=
 =?utf-8?B?TWh0RnVKdmpWVTJ3NTBtT2J5NXVQRUFwaGZXS3Y0dWpUZTB3YWQyZnVxWFhx?=
 =?utf-8?B?NzR0NUNLWE9nWGhTWk5oNVB3YzdGM1BwZ2JoWGNtbHR4d3BJOW5sRFFNQlFD?=
 =?utf-8?B?aXdmRllyNktGdEJCSmZLdUhIUElkRGovU0JCYzRjQS9wc1ZzeldvU3kzeWgw?=
 =?utf-8?B?TEVLbGxXVTlRVHlUd1hJTlRwK0E2OFVHRDNtYWh4U1lVYTRXMi8vQ1BzbXB6?=
 =?utf-8?B?ZUN0WmJNNDF3eUlPeTVZUE5XTHJPWCtsUzlSQ1pEM0hKeG0vZlZPek1uS2ll?=
 =?utf-8?B?V1o2WkhvVzJZR2xmMkNJc3JYMGx6QTRlMUNGM2wwa0pGUSt4TlRFdlNLUjJo?=
 =?utf-8?B?bUU2Zmowd1RFREc0NlJuSkFRbHBNNWcrMFlEMC8xdDJZcFg4bFRNM0pXcFhp?=
 =?utf-8?Q?2K+0glfBAhs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVNwc1lUVUNHbkhaZllLSDNGcDBZTUl2cnhiWWk2dCthOFN0QzlDdE84ZXBO?=
 =?utf-8?B?c3NhUWVBdGVyd3QxTllQaVdtNENKbFZRaXVyazRXYllEQzhkQjY3dE5nbkg2?=
 =?utf-8?B?L1p5UGpiaDlKdENrWkErVTFrZXE0eHB6bVdidEM0TFBqM2RpT1hGQmNBaGJV?=
 =?utf-8?B?a3ZmdHpObmRkeFZWVmN3dzFzekZKTXA3ZENSS2c0UWYrbVJFWkRVVjN6TklF?=
 =?utf-8?B?V1RZVWwvZlhWWmZKN3BCOE9VWHFEUkkvUW9hTVNRS0QwK2FoaVhvUi9ORVNN?=
 =?utf-8?B?VUVibUxxR1BLYWZHcHVTT21oQ0F1R0lUYkY4SW01RkxvUWJXSklHWVAyeStS?=
 =?utf-8?B?eDFEOHRWS1FTZzUwZXQ0ekhGZmZOWXBCQnQ5VUdobkhWY2h1Q1hWbWZnUlNS?=
 =?utf-8?B?YjBaQXFsbDk2U2FJb3pPcVBmMkpjSko0ejJTdWRoUThaTGxzOUpYTnJpN2ow?=
 =?utf-8?B?ZWhBWGZ1anhMNElqeWpBck8yOEJ2SlU4OWlwTEFuQVZmaWc4cm1EQ3h5YSs2?=
 =?utf-8?B?eFhKamdoWllnbU84Nnh5czZDUWlSaldhMjkrWjh4VTlnSU1lM0ZSYklZQ3Fr?=
 =?utf-8?B?TlQrWm50V09Kc2dhcytKcEdYZ3ZZQXhPZlVOc0E3T1pYcS9Tc3lRT21ra0hr?=
 =?utf-8?B?WXEwRXJVRXoySWFCVUNGUWNDT3FSM2pzL29ZY2dDckZMQVJNeVlTQ0c5QjFo?=
 =?utf-8?B?c0tYek02Vk9mM3hNK1ZLeWJ3VDRSbkZhNFNhNDducFBTTHpvNXZMeisxSzNP?=
 =?utf-8?B?RmRNNzZIZWIyNHc3UUFZaGFyUGZwYkUzWVh3eXl2YmNEczBRaERSdzlscmQ4?=
 =?utf-8?B?c0xndFB2dG0rWVdreFovTmo4dVJxME8wYkFPVFJ4cGs4YWpxRVBIa3ZONC9H?=
 =?utf-8?B?V0xpMHJkOVJVdGRqMDdyUmxJTlVoK3B1bThLSG8ydEl2cWNta3Rmd3ZyL2Rn?=
 =?utf-8?B?a0t6OWF4biszbkl4c2tSTlJBdzJreUZwTXJFZVhvK2NaUHczMXVvNFJGcEFH?=
 =?utf-8?B?b1BwOTFRRnA5YUI1WjdNcTZrU05Cdkpoc3IrWWx5T1dhWHlSZlN6Z1dENy8r?=
 =?utf-8?B?OXA2azh5aTF6TTJpaER5dktVK2lMTFNOVkdpcGdSRkZ3VkpnNlRtN2ZQdXdn?=
 =?utf-8?B?RWUwNkpkcGllT0d3cVFzS29UdDRSSURhSE10WGlwM05xUlVIOHN3bXNmNGFG?=
 =?utf-8?B?amlldmtCcW1vanU5UkRCY21UVXZ6ekZURDFmU1FkS3dOTStheFd3ZURaaGx2?=
 =?utf-8?B?eHZRNnpKcDhrWVZScjNTdXZMT0dUVmVnQU9kV2RvSGNsT1U1eTZWcFFqRFBn?=
 =?utf-8?B?SEpIbjliczRmcTAwSTc3N2s1UStENlFBdWdLOXRvbFpzZVRJYjhIZFRVbS9K?=
 =?utf-8?B?YlRaUVRRZy9yYUgxUlZybDUyQUxSMlVOWityM21heGRBeklUMERYdi9zV3Bo?=
 =?utf-8?B?L25DMVFpcUlzWTlQb21aeUQ3R3l5Zm12QWJsWE1GUDNsWmt0NkxOdi80VSth?=
 =?utf-8?B?dUhxd2U1QVBsMUt6eUNET3RCMVU5TG1jSmE5c1RMaWZXNVFuTndlWWx5cGd3?=
 =?utf-8?B?eUFXcTNGTTdYZkFSa05taHRXWHBKcGVYYURHdGs0YXBkS0F1VWRqVXBQRDUz?=
 =?utf-8?B?RzFXTUtoUXJTZWIrbDFOaFh2VzBpVy84TDNtUFF5L3FlYktyWERwOVMxZUxv?=
 =?utf-8?B?cWI5Y2VJMkNMa2M0VWRSdS82UjIyejRQYnU5K0lCY1R2LzJWc3REMlA1dS92?=
 =?utf-8?B?NW9hdmdLS21uMURCMXdYUC9uREIzall2OS9iOEJrUGszR2pIblFPTXJLdVJQ?=
 =?utf-8?B?QWp0RHRxeWtXOUMxakFncXdmSHJzL2xtNktRcnhjR21xL2VTNFhRV215aHkv?=
 =?utf-8?B?VzluaWhLN2FGaUhpbHRKWll2Y1lEQ2p1N1QxVWdJUDNpMnBCZHZDR1ZaMVZ2?=
 =?utf-8?B?amtBYnMxendmQVBTMjRwTE1Za3pIbVJZdnJNLy84Qjk2YkhxaUozbk9UREVr?=
 =?utf-8?B?L2JJZTltQmVNL3BKKy9rcmQzTXFpM0tyd3NKZXRaaFU0ejJxL1NMVExLMkhz?=
 =?utf-8?B?cEpYSXUwS3lvSWYwd2FESXNUQjJZeCtqZXF5RzJ2OTRmcjZGQnc3Mkl4ZklX?=
 =?utf-8?B?a1lJRGQ4SmpPeHk5VGZYVkpLQjloZXJTenZJUElXWWJZV2VXaHNkNWExY3Fn?=
 =?utf-8?Q?mV8DktEt/bqlsEajSFw0Vkc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 239a920f-2759-4cea-1198-08ddce8463ea
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 09:43:36.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZ8o0D40YV9xKi2RpaEhOIkXoGW/i2mLSNeM/PloAym1DvD63I1GlCrfbCHmgzKvv+HbRIagPD4FHrlWmGAI9/k4IP20ianD6KDQfhuMo74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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



On 29-07-2025 09:53, Matthew Brost wrote:
> On Mon, Jul 28, 2025 at 08:52:26PM -0700, Matthew Brost wrote:
>> On Tue, Jul 22, 2025 at 07:05:13PM +0530, Himal Prasad Ghimiray wrote:
>>> This driver-specific ioctl enables UMDs to control the memory attributes
>>> for GPU VMAs within a specified input range. If the start or end
>>> addresses fall within an existing VMA, the VMA is split accordingly. The
>>> attributes of the VMA are modified as provided by the users. The old
>>> mappings of the VMAs are invalidated, and TLB invalidation is performed
>>> if necessary.
>>>
>>> v2(Matthew brost)
>>> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
>>> fault mode too
>>> - fix tlb invalidation skip for same ranges in multiple op
>>> - use helper for tlb invalidation
>>> - use xe_svm_notifier_lock/unlock helper
>>> - s/lockdep_assert_held/lockdep_assert_held_write
>>> - Add kernel-doc
>>>
>>> v3(Matthew Brost)
>>> - make vfunc fail safe
>>> - Add sanitizing input args before vfunc
>>>
>>> v4(Matthew Brost/Shuicheng)
>>> - Make locks interruptable
>>> - Error handling fixes
>>> - vm_put fixes
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 306 +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>>>   3 files changed, 322 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 83a36c47a2f9..fa52866bb72c 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>>>   	xe_uc.o \
>>>   	xe_uc_fw.o \
>>>   	xe_vm.o \
>>> +	xe_vm_madvise.o \
>>>   	xe_vram.o \
>>>   	xe_vram_freq.o \
>>>   	xe_vsec.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> new file mode 100644
>>> index 000000000000..f64728120d7c
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -0,0 +1,306 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_vm_madvise.h"
>>> +
>>> +#include <linux/nospec.h>
>>> +#include <drm/xe_drm.h>
>>> +
>>> +#include "xe_bo.h"
>>> +#include "xe_pt.h"
>>> +#include "xe_svm.h"
>>> +
>>> +struct xe_vmas_in_madvise_range {
>>> +	u64 addr;
>>> +	u64 range;
>>> +	struct xe_vma **vmas;
>>> +	int num_vmas;
>>> +	bool has_svm_vmas;
>>> +	bool has_bo_vmas;
>>> +	bool has_userptr_vmas;
>>> +};
>>> +
>>> +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
>>> +{
>>> +	u64 addr = madvise_range->addr;
>>> +	u64 range = madvise_range->range;
>>> +
>>> +	struct xe_vma  **__vmas;
>>> +	struct drm_gpuva *gpuva;
>>> +	int max_vmas = 8;
>>> +
>>> +	lockdep_assert_held(&vm->lock);
>>> +
>>> +	madvise_range->num_vmas = 0;
>>> +	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
>>> +	if (!madvise_range->vmas)
>>> +		return -ENOMEM;
>>> +
>>> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
>>> +
>>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
>>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +		if (xe_vma_bo(vma))
>>> +			madvise_range->has_bo_vmas = true;
>>> +		else if (xe_vma_is_cpu_addr_mirror(vma))
>>> +			madvise_range->has_svm_vmas = true;
>>> +		else if (xe_vma_is_userptr(vma))
>>> +			madvise_range->has_userptr_vmas = true;
>>> +
>>> +		if (madvise_range->num_vmas == max_vmas) {
>>> +			max_vmas <<= 1;
>>> +			__vmas = krealloc(madvise_range->vmas,
>>> +					  max_vmas * sizeof(*madvise_range->vmas),
>>> +					  GFP_KERNEL);
>>> +			if (!__vmas) {
>>> +				kfree(madvise_range->vmas);
>>> +				return -ENOMEM;
>>> +			}
>>> +			madvise_range->vmas = __vmas;
>>> +		}
>>> +
>>> +		madvise_range->vmas[madvise_range->num_vmas] = vma;
>>> +		(madvise_range->num_vmas)++;
>>> +	}
>>> +
>>> +	if (!madvise_range->num_vmas)
>>> +		kfree(madvise_range->vmas);
>>> +
>>> +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>>> +				      struct xe_vma **vmas, int num_vmas,
>>> +				      struct drm_xe_madvise *op)
>>> +{
>>> +	/* Implementation pending */
>>> +}
>>> +
>>> +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>> +			   struct xe_vma **vmas, int num_vmas,
>>> +			   struct drm_xe_madvise *op)
>>> +{
>>> +	/* Implementation pending */
>>> +}
>>> +
>>> +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>> +			      struct xe_vma **vmas, int num_vmas,
>>> +			      struct drm_xe_madvise *op)
>>> +{
>>> +	/* Implementation pending */
>>> +}
>>> +
>>> +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>> +			     struct xe_vma **vmas, int num_vmas,
>>> +			     struct drm_xe_madvise *op);
>>> +
>>> +static const madvise_func madvise_funcs[] = {
>>> +	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
>>> +	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
>>> +	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
>>> +};
>>> +
>>> +static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>>> +{
>>> +	struct drm_gpuva *gpuva;
>>> +	struct xe_tile *tile;
>>> +	u8 id, tile_mask;
>>> +
>>> +	lockdep_assert_held_write(&vm->lock);
>>> +
>>> +	/* Wait for pending binds */
>>> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
>>> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>>> +		XE_WARN_ON(1);
>>> +
>>> +	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
>>> +
>>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>>
>> I think:
>>
>> xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma)
>>
>> No need to invalidate NULL VMA's as those mappings are not modified by
>> madvise (i.e., you can call madvise on NULL mappings but it doesn't
>> actually do anything).
>>
>>> +			continue;
>>> +
>>> +		for_each_tile(tile, vm->xe, id) {
>>> +			if (xe_pt_zap_ptes(tile, vma)) {
>>> +				tile_mask |= BIT(id);
>>> +
>>> +				/*
>>> +				 * WRITE_ONCE pairs with READ_ONCE
>>> +				 * in xe_vm_has_valid_gpu_mapping()
>>> +				 */
>>> +				WRITE_ONCE(vma->tile_invalidated,
>>> +					   vma->tile_invalidated | BIT(id));
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	return tile_mask;
>>> +}
>>> +
>>> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>>> +{
>>> +	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
>>> +
>>> +	if (!tile_mask)
>>> +		return 0;
>>> +
>>> +	xe_device_wmb(vm->xe);
>>> +
>>> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
>>> +}
>>> +
>>> +static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
>>> +{
>>> +	if (XE_IOCTL_DBG(xe, !args))
>>> +		return false;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
>>> +		return false;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
>>> +		return false;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
>>> +		return false;
>>> +
>>> +	switch (args->type) {
>>> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>>> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
>>> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
>>> +			return false;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
>>> +			return false;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
>>> +			return false;
>>> +		break;
>>> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
>>> +		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
>>> +			return false;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, args->atomic.pad))
>>> +			return false;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
>>> +			return false;
>>> +
>>> +		break;
>>> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
>>> +		/*TODO: Add valid pat check */
>>> +		break;
>>> +	default:
>>> +		if (XE_IOCTL_DBG(xe, 1))
>>> +			return false;
>>> +	}
>>> +
>>> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>> +		return false;
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +/**
>>> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>>> + * @dev: DRM device pointer
>>> + * @data: Pointer to ioctl data (drm_xe_madvise*)
>>> + * @file: DRM file pointer
>>> + *
>>> + * Handles the MADVISE ioctl to provide memory advice for vma's within
>>> + * input range.
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>> +{
>>> +	struct xe_device *xe = to_xe_device(dev);
>>> +	struct xe_file *xef = to_xe_file(file);
>>> +	struct drm_xe_madvise *args = data;
>>> +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
>>> +							 .range =  args->range, };
>>> +	struct xe_vm *vm;
>>> +	struct drm_exec exec;
>>> +	int err, attr_type;
>>> +
>>> +	vm = xe_vm_lookup(xef, args->vm_id);
>>> +	if (XE_IOCTL_DBG(xe, !vm))
>>> +		return -EINVAL;
>>> +
>>> +	if (!madvise_args_are_sane(vm->xe, args)) {
>>> +		err = -EINVAL;
>>> +		goto put_vm;
>>> +	}
>>> +
>>
>> I think as this code can modify the ranges during a VMA split, you will
>> need to ensure all queued unmaps prior to this are complete.
>>
> 
> The explaination is wrong, but it is still needed. You need a flush of
> garbage collector because it can modify VMAs and we need that view to be
> current. Feel free add this in this patch or patch 20.

Will add to this patch.

Thanks

> 
> Matt
> 
>> So call xe_svm_flush(vm) prior to taking any locks.
>>
>> Looks good otherwise.
>>
>> Matt
>>
>>> +	err = down_write_killable(&vm->lock);
>>> +	if (err)
>>> +		goto put_vm;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>>> +		err = -ENOENT;
>>> +		goto unlock_vm;
>>> +	}
>>> +
>>> +	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
>>> +	if (err)
>>> +		goto unlock_vm;
>>> +
>>> +	err = get_vmas(vm, &madvise_range);
>>> +	if (err || !madvise_range.num_vmas)
>>> +		goto unlock_vm;
>>> +
>>> +	if (madvise_range.has_bo_vmas) {
>>> +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>> +		drm_exec_until_all_locked(&exec) {
>>> +			for (int i = 0; i < madvise_range.num_vmas; i++) {
>>> +				struct xe_bo *bo = xe_vma_bo(madvise_range.vmas[i]);
>>> +
>>> +				if (!bo)
>>> +					continue;
>>> +				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
>>> +				drm_exec_retry_on_contention(&exec);
>>> +				if (err)
>>> +					goto err_fini;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	if (madvise_range.has_userptr_vmas) {
>>> +		err = down_read_interruptible(&vm->userptr.notifier_lock);
>>> +		if (err)
>>> +			goto err_fini;
>>> +	}
>>> +
>>> +	if (madvise_range.has_svm_vmas) {
>>> +		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
>>> +		if (err)
>>> +			goto unlock_userptr;
>>> +	}
>>> +
>>> +	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
>>> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
>>> +
>>> +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
>>> +
>>> +	if (madvise_range.has_svm_vmas)
>>> +		xe_svm_notifier_unlock(vm);
>>> +
>>> +unlock_userptr:
>>> +	if (madvise_range.has_userptr_vmas)
>>> +		up_read(&vm->userptr.notifier_lock);
>>> +err_fini:
>>> +	if (madvise_range.has_bo_vmas)
>>> +		drm_exec_fini(&exec);
>>> +	kfree(madvise_range.vmas);
>>> +	madvise_range.vmas = NULL;
>>> +unlock_vm:
>>> +	up_write(&vm->lock);
>>> +put_vm:
>>> +	xe_vm_put(vm);
>>> +	return err;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> new file mode 100644
>>> index 000000000000..b0e1fc445f23
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_VM_MADVISE_H_
>>> +#define _XE_VM_MADVISE_H_
>>> +
>>> +struct drm_device;
>>> +struct drm_file;
>>> +
>>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>> +			struct drm_file *file);
>>> +
>>> +#endif
>>> -- 
>>> 2.34.1
>>>

