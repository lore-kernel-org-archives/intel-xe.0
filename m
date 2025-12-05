Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D28D3748A
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 20:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D62710EBB2;
	Fri,  5 Dec 2025 20:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1BY25zI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7177510EBB7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764964888; x=1796500888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hnzsL6N776IDhCnlvlr9YsdXUCydbNMwvAvbsMiVKQ4=;
 b=b1BY25zIdaYeGRIHIMrBJCMnTU0ADY8GXUjRjcjJdViShl+iK/bMvEz/
 1TB9aUMWAqBmpD5k7JgCE7JxQRuBnXLor9fOFp5ycOKuZ+i3DJyxvrFGd
 ZS7e4kcECrVkK5EoU6E0tz0X5xoZrnAIBqEUP5VwIzCJ1F2i5kbR9VrYo
 6Mv/1R28nS19+Jqn+cKibPc72w487iTs/QRaSyTZrfqxCmTcd23YxHECf
 7pJ3DGpbb0KhyVZDmtYscYugkH6JEY13j60XGcs0GjsQ4XZxY3++THDBu
 R9XQp94aEDNWrX5mp+6xPmm7ZYE9bMVPvqvyGZzdeUtlqPa34UGv4Xw5G w==;
X-CSE-ConnectionGUID: KMgn41ksTWCtUMLnl9+ScA==
X-CSE-MsgGUID: QfYw+12ASumujw179Gdp1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67044722"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67044722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:01:27 -0800
X-CSE-ConnectionGUID: o7dIehmESrC0S5U/C5E5JA==
X-CSE-MsgGUID: tLn9eg59SSWT4TSF1+AqPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199810171"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:01:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:01:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:01:26 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:01:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXb5Lql35EHGJxeFbfXTMXJlbmsdF5EYeJDtcJKnof1N8K40rTgynktYVQ96sUc049iik7JQSObkhDy8grHBFrSJZx1PyRO8NccZutEd4t1iFTOXTNSVKsho+ku7ubwdJdjOQzXzPclD4KyrR4rdCU1vris4F644OF9XC/iOfSgqzpw/CWHHNaety3u2TDReULSdjC/9KeMrTl9O5IENmpYFQcZrslULgsQw33GhnUMt8xG3bRYIsyWTsDkRz5yVQClU+D9JOh/zD+0MFvXWr6OW9L6+eCu1EM05om2nZvqJegfdHbyx9uyy5SzrXoiB6MZC+EXByukO/iPT8RHpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5ymiBof51spQ17q/lkBLq4/9XiJJRgB4tjlmUzyaio=;
 b=BUjkl1Hif0nfOo+XRf1h/+bnipBomTweWYkq801V037dWrOkjwOnbakNHG8xgHZi8WokiCM3GSw+dwRFZyoHv2shD4NxFOT+/aa8sgXinzuWXQ+G/DZolEX2CGnvIkABdApOxGopg51dZRnazQqx26PTLb2445dviQ93pkO4ve/gUF5b3vAMfFe1aDEQGj35iE00seQdRKP6oYG/GAR5bSRnLeMzhdgBJhvXBBqB5hekoHFKOb+0mdUOJ8iRJQEch2ulCSvyGVmDdUrKMRBlVyjnUVKQDALKY4f6vIXhVNsjnVwNQ0Qla+pTzTLuB3bWwKi5qGgbNjCG5T3vzppn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 20:01:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 20:01:19 +0000
Message-ID: <6f4a0e2d-0bcf-4f19-92a8-bff2949b63c9@intel.com>
Date: Fri, 5 Dec 2025 21:01:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/vf: Reset recovery_queued after issuing
 RESFIX_START
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251205082615.154649-3-satyanarayana.k.v.p@intel.com>
 <20251205082615.154649-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251205082615.154649-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: d61de434-0e3a-4496-8dbb-08de34390e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEhmVXRTbytlMy90em1xK3AvQVFQZC8rOUx4RnJQVnpZaC8wNjlhNmJiWTlX?=
 =?utf-8?B?K2VFNVhyYkp3OWdUQ3p4SkIwZTVreS9jOUhpcWpxN1lBVHVhdWJzM1R1Zld4?=
 =?utf-8?B?OExxc0gzeWtQZFAxVXZ0WCtJSFdseDdxaW8rSm9pMmpNSVd5VE5xTlNYcEd5?=
 =?utf-8?B?OHUxNUZRdExaSG4wTkhVU0diZUd5aEl6dzdYTzFzM2hqWW1pZFF1Mkh6NEJN?=
 =?utf-8?B?QTZtUnlwc25YcFdKWXpINnRLTHVRZjNHeUZhb01KMExEcFVPY2VyTmRtbHl1?=
 =?utf-8?B?MkZGTjJFd0hGTGVXWU1wZkF4Z3N1Q296N1hDNXJ3R3BOM1RNdzNBcGJsbDJU?=
 =?utf-8?B?UzcyZ1VCREoxQXB4ODJta0lRM3Fkd2QxMm9hdTF2RVoxV3VUTyt3cWVmOTQr?=
 =?utf-8?B?NnI5RkwvbHc4dVoyY2lyZ0xyTDNBL05zNlRDeWwzMXpaWkpwMTFiVE9wbmNt?=
 =?utf-8?B?ZFdWdk5CTTJacTA0d1dTL3AvVitzam5HMWp1OEM1bi9JTTl5QU9EbXJGUkZG?=
 =?utf-8?B?cmtKVHdjM0UvcERtVHRMd2VQTTdUTjJvTHBFSEt1QXBrc3lSV25sbVdtY1lK?=
 =?utf-8?B?VUtkcnptbUhiUUZ5WUZ5MWdyUlZZUXJmeFFZN1QvRHZ5VjJ1WFFBL0xOR3Nj?=
 =?utf-8?B?SnFyTngxckhkQUhjS2I5bEUyNFFuRW9iNVUyeWJCVjhJUnJwL3FOMmZkK1hI?=
 =?utf-8?B?SmJuTWFNdXNFaVkvd2pqQjQwU2xQaC9BdHczMUR6Zi9oaVVZOXNPWjFueUhO?=
 =?utf-8?B?L0UyOE9UWVBJRWQ5NnpqbDdnYXhpemhPdjI2SmZyMWZ1aE9zeWNIWU83Q2xS?=
 =?utf-8?B?dGZPc1BVYUk4REJTT0puVWNmeTNOMzQwZE9vWVAwRi9nUTRNM0NlSnczMnlF?=
 =?utf-8?B?VXp3QUZySUxRbTNsYi9qTlRwYVRlN01MRVRhV3E5SFFNaklKUnphaVlsZHJ1?=
 =?utf-8?B?azcrZWtiTVU4RjVuNEZIaUl0MTVJSStSYU1wbU1OaXBZMEUrNDhJaUpxUkto?=
 =?utf-8?B?RFFydTIvTEVyU0pDcUJRUmloRDFkLzlLaG5PKzZlaGEySDYyVkxJcm4xUU5J?=
 =?utf-8?B?dU9SZXFkb0hGcEhMUVcwRWtlcTdiRFFJQ09EQ2RiNmZnTER5Y25hcC9vaEd2?=
 =?utf-8?B?UGRpSDhtenVXVzlhUmJwa0FwN3FnZDZDOWdHa0xwd2VYR0k4aXdubHJsVmFC?=
 =?utf-8?B?RXJ2T1Bma2ZHSDY4V3dXMzlzaUpHQXk5cExqV2VjS2pHWkV0eHNIbGJVbEdy?=
 =?utf-8?B?d1Y3VUlvRHZqcHBCWVErd0V4dmxMcjd4VEF0NzJpaklkcHhIK2hEVUV0Q1h6?=
 =?utf-8?B?REd2Y1grbzFZM2ZkWG1OUWJjeXE5STd4VjFmRmNSejFyS0t4eC9FSW41YWlR?=
 =?utf-8?B?L1U4ZW02ck9TN0ZyZW9rTUtwaEw4c1VuWER6TVlxUjVUNzQ0U3hXRUNrSXY4?=
 =?utf-8?B?NEM2a00vb3Q4TDNmQ1dIMDVFbUpaaFZQV2xieERsZ1J6UzdBYkpLbVhibkRH?=
 =?utf-8?B?Q1ZxcExLZVoxR1o1aFdDb0IyOG9Daytsb202M1g1NUxzWlJBTkIvRkJhc0VE?=
 =?utf-8?B?UUZTNHFYSXBnSFRDUEdOMTRZL3F1Y1FVaU96cVl5OGNvZEgwZytISjRYcW9W?=
 =?utf-8?B?RWRQQWk3bC8rZFBab25Lb1lNUFp5Nnk5cUpmOXBBemU4SWk2SFJzL1lzUEhJ?=
 =?utf-8?B?RVZPczNGL2NmOGU0T3RXQUNiYmRSWHU5VE8wWG5ZdVlmcDJSNDA0bmRNbVhM?=
 =?utf-8?B?LzkwSXJNQW15aUM1L1Y3OW1qbysvSnhUUExHOXhsSG5YMVl2VkNBYXM2R2Qv?=
 =?utf-8?B?QW9wZ3dPRlc4WXp2L0wyRDdXT1Y1TjdIbE0xY2tkUnQydFdaQnA4Y2pFYVE1?=
 =?utf-8?B?K3F1WEY2Ni9IcXpWK2hPT1FPMTdmMmNlNk9mZVZZQlRvSUJPY2VrcTVFK1Mr?=
 =?utf-8?Q?+p+OTYz1kTFRP6xzgnpX4CDuekw8hZRr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3lELzNuZ1V6MTdXZzZOUlU5VGZpRVVnbjEweUpVUFhOeklpSFY3MUVBT1BO?=
 =?utf-8?B?cWRGN0J4L2ZHYlNKdXRUaU9xWjJJS1J3M1g1WExiSlJGNjlscXQ4Ym9Nc0FD?=
 =?utf-8?B?eUZ4QlM5SUxFcXlwc1oxU0w1VnUvcjg3Qk14NWhGQTQwL0pOVmhUMkUwdEJt?=
 =?utf-8?B?dUREdElBVlB4WEhicFJSaTBoM2RvWSsxYXdpdUhhR1hYNW9BK2xKTE92aWQ3?=
 =?utf-8?B?YytuakRqY29wLzZqNHVnT1ZyOG1QMzNFWVorSVYvODdKWVUxcVAyY0ZZVzNm?=
 =?utf-8?B?L0RISzVxampJOWZWRCtoZTBPVlgxV2Y5eWozS3FHaEcyMngzT0tWY2ttSDFr?=
 =?utf-8?B?bVgzS0hzOU5BQmEvdUZnemU3ZktpNTI2ei8xZ1lGQUtYOU5XR2JUbDJvYU9t?=
 =?utf-8?B?OUJUMXQ4VmdudFQ2UDdQNi8zalNWWjRST3pZVllCOEp5anRWVm1UYUhuMWVR?=
 =?utf-8?B?YUhqeFM2UVROTFJwR0VIUnRkYVRpU3dScjRLdTlzZzZtNER2YnMrUHlKUFNQ?=
 =?utf-8?B?NHV5d083WlV0dVVkTksvWmN0UXF1RCtsbjJ0cHRzYmQzVlVUaWRmQVNLVmUr?=
 =?utf-8?B?UTdmYWlJTDZXNTZ1MzBaZjl0LzZPKzVpS1lCbFFkR3dPQlZpYXJOSEJROU85?=
 =?utf-8?B?dUVUMEJNYXhnMUp6bW9LQlZUbHRmQW1GZElTUjBHWFlKT1hFTkZRTmgycmJB?=
 =?utf-8?B?VGtLUHRhdXRRTUJVVFkybmtwbE9oZVZaZUlCNmhTc1RtSWNmb0xPVGZUYzly?=
 =?utf-8?B?Wjc3NkRaUFFsaGd5S1pqV053VXA5OXRjSk5zZ1I0Zkx0WXZycjJQdWVSZmVD?=
 =?utf-8?B?RzlSbEtJUnIyOHFaNlN4QTU3bGhVcVUxMjIyS3h0OHJOOGd2aWZ6RzNRNEx1?=
 =?utf-8?B?citFK2FFdDhGcW5ZZm0wYWdGYWNYVktFTEdJU0VjL1l5N0hqc0xSNWJReERW?=
 =?utf-8?B?d1pReGRhNTE5eTQ0YXFsOTBRYko0SVJrTVNiZ0lBbjhXdExWejh5dVNJZW14?=
 =?utf-8?B?VmVVU0JuWER5NDlMVVlDTWJOcWdQNU9OLys2N0VTaGRmZ1JWaDZzTVV1ZVl1?=
 =?utf-8?B?dEVKckhYaXZ1Nzk2YklUWkJ2Q04yWCs5R2VyYUI2Z0VtZGZ3STFvQngxM0tB?=
 =?utf-8?B?YmtGTWMrQVlmeElETHlDb3pRMnlvdzZ5TEpNR3dnWXVxT1BkS21FTUphdkRC?=
 =?utf-8?B?QW5rUkVybGdDMUJKZk5wSTNuQkNEZSszSExKUHAxNzY2OU03TVJXa3FOZ1JO?=
 =?utf-8?B?WGhIRzNRUFFtQUs1SVRIc0tsOHowMndBejRGaUorZXJXTURTOWorOUtZRWdh?=
 =?utf-8?B?a0pFWVRMRmV3dGNkS0t6STBtLzUwbmM3SzVpRWJaMHBoYkdYekdvOVgwbG83?=
 =?utf-8?B?dW5Xc0EwR2ZEQlhIcXRZdXRUZ0x0NkJmRXpqbGZtUWdJSzZVUURyVUFOYTQ3?=
 =?utf-8?B?K0czSGc2em9VNS9XQk96ODdERStzcUwxT2dhcWRzMkVWQm1paEd1RVBvY0hq?=
 =?utf-8?B?a1RBQkh2MXBTRlI5bGdialQxL3RSQUJ0N3VJeTh6dnVVUGJCcWM1ZUtNa1dx?=
 =?utf-8?B?RU5NUGNhUlpOclJiT0UvNWE3K0JnOW5keWdBdmNCNFk0SS81R1NnTEFLUDA1?=
 =?utf-8?B?U1NjUjhwTHVKK3lITUp1Q3hzVUdIZ1lweVFBMlJBRFRucHRrV0Z5MW55K1B2?=
 =?utf-8?B?Ly9Kc2pUY3hLeWltbEw2OW5jTnBETEpEUTdGOGI2VHV2eFhyM0lIcnZvaDVF?=
 =?utf-8?B?bGF1U2VYUTdrWnp3SWlzVVl3SFZDMUFmaUFPVDkwZjNuazQ4bmJudTFOOERx?=
 =?utf-8?B?bEFNc1BIRnNEd1ZrNUhNbjY0SXcrZkYwVUhpTW5MMlRvOWRRNjMyZkVSdXJK?=
 =?utf-8?B?c2M1KzQwTCtFdFNJb1pzZFR1dnczZXdscXh4SzF3SnpzN0pWb3RjOENIUUx1?=
 =?utf-8?B?VWs0QVRaYU9GSEVibjkxalpyTG1LYmlhM1lISFU3U1hRZEtvc1hlNGdJdjg2?=
 =?utf-8?B?cjl1dkRYdFVYb2JIbk9LaEU0QVlycTVSZ1BhMENqWi9TdnVTMXVKMFptNTEr?=
 =?utf-8?B?SytJVC9HK1RzTE5yNk0vNTVPcVNad1R2endITXdWRWxjMjA1Z2xoMW9GZ1l4?=
 =?utf-8?B?bXN6RnNBclc4bnNDaVFvWVR5bk50cWxvcCtMZEtNd0tSNmovbkRSUDlIY0F1?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d61de434-0e3a-4496-8dbb-08de34390e5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:01:19.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygKqgPzKyASsc0BCENhJfwdmTE2931EOnlyhWrnKROk9myjh0mZ8zUAmuBiFSQOOrokPlnJOTeE4Zd/DTBkAXVfVMTasAxsrzIDQ6XdjxyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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



On 12/5/2025 9:26 AM, Satyanarayana K V P wrote:
> During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
> clears the RESFIX_START marker. If migration or resume occurs before the
> VF issues its own RESFIX_START, VF KMD may receive two back-to-back
> migration interrupts. VF then sends RESFIX_START to indicate the beginning
> of fixups and RESFIX_DONE to mark completion. However, the second
> RESFIX_START fails because the GuC is already in the RUNNING state.
> 
> To prevent VF KMD from queuing additional recovery work items when extra
> interrupts arrive, move the clearing of recovery_queued from
> vf_post_migration_shutdown() to vf_post_migration_resfix_start().

hmm, it's not about moving the code from one function to other, as this is
implementation detail clear from the diff below, but rather we want to say
"clear the flag after sending a RESFIX_START message to ignore duplicated
IRQs seen before we start actual recovery"

> This ensures the state is reset only after the fixup process begins,
> avoiding redundant work item queuing.
> 
> Fixes: b5fbb94341a2 ("drm/xe/vf: Introduce RESFIX start marker support")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 3c806c8e5f3e..90f2ef1772f2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -781,7 +781,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  
>  	spin_lock(&gt->sriov.vf.migration.lock);
>  
> -	if (!gt->sriov.vf.migration.recovery_queued ||
> +	if (!gt->sriov.vf.migration.recovery_queued &&

this is a different fix that deserves its own separate patch with
a proper commit message

>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> @@ -1171,10 +1171,6 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
>  			return true;
>  	}
>  
> -	spin_lock_irq(&gt->sriov.vf.migration.lock);
> -	gt->sriov.vf.migration.recovery_queued = false;
> -	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> -
>  	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
>  	xe_guc_submit_pause_vf(&gt->uc.guc);
>  	xe_tlb_inval_reset(&gt->tlb_inval);
> @@ -1258,7 +1254,15 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  
>  static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
>  {
> -	return vf_resfix_start(gt, marker);
> +	int err;
> +
> +	err = vf_resfix_start(gt, marker);
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	gt->sriov.vf.migration.recovery_queued = false;
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);

we may want to use

	scoped_guard(spinlock_irq, &gt->sriov.vf.migration.lock)
		gt->sriov.vf.migration.recovery_queued = false;

> +
> +	return err;
>  }
>  
>  static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)

