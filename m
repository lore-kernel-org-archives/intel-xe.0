Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71924D1714B
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 00:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3680D10E037;
	Tue, 22 Oct 2024 00:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAzIfSeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6510E2C0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 00:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729555405; x=1761091405;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=O59VkO1qXV7d3vbDobYf/PslIDVzIz9XVTSc3SVV650=;
 b=CAzIfSePLLU+6B9bPMr+Gul7XcME6ru3Asm6XvkMNNAcvPnQh8OcUobM
 m6GCizXs17pCOtBxhG8cum5h/eo0ZjI6B89aV6Mz0yCEuidMxhZ+4KTnd
 AI2co4oou0uoYQf2HKeJswvHfBXo7v9e7BqH3Sh6SAHe+ECeRYeOdFwPO
 Jf0aGz2ZPy4A2ZmczxAwbVukFvqXIYwzjpOOULfsKNm3n1GwX4+DSsgVo
 QVONS6sCUeWzay+L8tC+8cqlfU1pBQBfXERiN+JpJ1zkeuty23zYXd3yg
 DWAHinmsI6ubtNDj3f+l9S6wyXyjuM2QEkMAzhJqA1b8wc5Ind8lCBxxR g==;
X-CSE-ConnectionGUID: VhywGm1gTqqBZ9grOowuig==
X-CSE-MsgGUID: U8z19RYGTSy/jkpcX2bCSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29177567"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29177567"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 17:03:25 -0700
X-CSE-ConnectionGUID: qsb7Na3ZS8qgCzW6l06Q/A==
X-CSE-MsgGUID: Pv853PEbRMCSKSxeE/+FwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79852890"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 17:03:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 17:03:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 17:03:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 17:03:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 17:03:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOE5JXKHsRaYTzgH30D/khfafqsSjwrmYSnHFjkJLJCAyBYsUuyNvuMIojsCRb8tzV3aK0MFvuernjgG0p8bM3SGmRSb4oZ4Zvo2zhsYanlrk9D1T7ohUVAczeQtJMOe7qzpvo++CYMKo5hWEQ+tRpEtfGvvLsZSPW9GCVvENfhOEQxZ1RoeCmEXC2iqTyM6KREtaMQd9YHlqYsNWq3JMIMpl3UzXmk/FVASe7fj6NcppK6OVSN6NlzXo4OBsOugy+Vc9WcNWHGdsO7oJb7IbIEmbO6c8MdLa7lYUpxAb/QqszGQx2yBrEvhIZViwfh4Femf17/yVUTvSu7e/SwH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiVplT4K7S3SQNQDREYICksCOY5NOJuJAOjzB8tbN78=;
 b=AAE6G0aPMJ7VFIUxzJM32TmHMNJU9uPzH42cjThJkB48RYLYRy+ed35ZTPwqjLk9MnDGVAFFtb7dQ44QVamgahxKh1A6BobeY15h4y00GkUURZ0GognvgT6q9Kn5SFZM7n7zI4h8wF6s2Hhc2D4zwj3cKthIOE6JOC56wISMQHGq1Bf+gvrXLciW/kKDZBAwe/QfmhB7J9qlaNlP93o4knIaRLaq/iss5ycr/pZpxHSdRu1sM76KURvQQpyb92yZvGYOKZIfiPEDPlfRZSTHH37aXAJ6syTe8DGftd/OEtFWU6udSZ4rUcrEn+h9fe5SVy7PKi6l0fW2LFSZVivAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 00:03:09 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 00:03:09 +0000
Message-ID: <9bfe7f26-3686-478c-b103-8bb14986bc03@intel.com>
Date: Mon, 21 Oct 2024 20:03:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Prevent GuC register capture running
 on VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241018224325.130754-1-zhanjun.dong@intel.com>
 <20241018224325.130754-2-zhanjun.dong@intel.com>
 <a4240e2a-65c4-4d32-89e9-12f342f46293@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <a4240e2a-65c4-4d32-89e9-12f342f46293@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1fb378-ea9f-42c8-2f3b-08dcf22ce9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUxZNHlBSG5KZTN5NjBUOEN5aWlYcW9ORjVUVXlIT0hlWG5BZUtoYU1IYlI5?=
 =?utf-8?B?N3N4OEo3OXpYT0Q4cWFhdU5hS0QyS1plU3RQa2ZPemRpZzFwa0grZVk5Yy9w?=
 =?utf-8?B?UnJHeTU2MGIyTkNGbXNUZ01IVFFUa1NteDRXdld3a2kyNHdhZVRSS3pmVzI5?=
 =?utf-8?B?QW03bXdPSU5xSHF1N1lWREdUWmMrY3dDUURQZ1JCT2VVbUMwVTViL2VieE9N?=
 =?utf-8?B?cWRFR0pXMTNYSURsTGE4b0JheVo4elh5a3dvbmY5Q1laTXNIWldjUHpPVHFm?=
 =?utf-8?B?bkw5b1Y3WCtldWExM2NzWlc4WkVLS2ZvU1orUnQ5TVY3eTZqZHlDOGI4MjNB?=
 =?utf-8?B?UW9yelUvdFBPQTE1alcrMXVMNDhZcmZYZWx2MjJXajZOMExxa25Kb3ZJczRM?=
 =?utf-8?B?T3lVekZTY2U2c2MvQ3luUTdSWHhaa0luQ3A4MkZtL01teS9wT1BCNE9aNHdE?=
 =?utf-8?B?VjArK1lBd2xYT0FGRkFZMWJlOFBET3ZWdnJjT0JHak5HZHMwcDZXQzJjNith?=
 =?utf-8?B?NGFIazNIemhOMG9FTE1ha0xxWm9oZjhBWVdwdThhd0VZYjk5TUJTYTk1ZkNR?=
 =?utf-8?B?RzlVTVVUYVFsUXFYQ0FCVEN2bTB6a2lBR1RCRlhlU0loWmg2NTNybDl2WnFq?=
 =?utf-8?B?dm5Vd3B1OXIvYUs2dk9ENEJIUzFPbnVYTEt1ZDhEcUdlWG9CQ1IvK1RjaXNs?=
 =?utf-8?B?TXQveTI4QS9IeG9Nazd4Y01RajQ4VnpsVThMbFdmcnlaa0xOMytlZmlPVmJv?=
 =?utf-8?B?NjQ4SDJuTlhQdk03bkFIY3RSa3hDbXoxa1lpS2E3dVZNTS9xYjVURDRtUjFz?=
 =?utf-8?B?NnVjWGtLQ1BJRmZRL0JWS0NSS090Yk16SFR4R1FESEYxTlVBSUdrbzRFQTEy?=
 =?utf-8?B?OUpRdTdYSnc5cEJKSlo0TkN0c0Y1dlowbjFvZGw1YlhXM2hQcHpRZmkrRE1J?=
 =?utf-8?B?dXBzdVpsN01STTRTTEJvZGFxY0dDOE0ydlU0ZjgzOHJuenpuWS9OcHdTZXFJ?=
 =?utf-8?B?K1kvTUN2T25iRW91QXB2dGlFZkljWWZqc2JtUmNxZzZGSGRVVXlxVzFtMHo1?=
 =?utf-8?B?cVgybHpjcFVEOTBkdDZYZ0pWYzNlUGlKTU4xa1lzNksvdFJnSUlxbHZKRFFH?=
 =?utf-8?B?YWdPZ1RYcjNDSE9uNlZPd1E0UVJ4clRjcS9JRXZmMk5aRDlzeCtBS1hBdnhq?=
 =?utf-8?B?cXcwQmwyc3pUSUVNUlhxWHo4dE5tRXZzVEJWZXB3anRNOExUdTZGc0FRcGZs?=
 =?utf-8?B?QmQwQ1Y1UW1EQjdXeUdwb1pHQkpBNFVpSjB5dnBkUnhpSjNCWmU3R0haUTFE?=
 =?utf-8?B?a01wUlEyTzdhTVhpS0NKRmY0MHFIdmVyKzlMR2dIYzEweUJ0RzJrSkVLc253?=
 =?utf-8?B?c1IzTGZBQ29oMVlVajE2NiswOVVKYzZhTlhIaEdyeVpiZmE5TlFVNzRhaGFa?=
 =?utf-8?B?a04zeWk5UXE3NDZZU3lCcVhxQ2ZWMVl4bGtFV2tGZ0lyZ3dabkgyZWlZUlVT?=
 =?utf-8?B?dUhWWWVHbzVRbUZpQ3Y5RGVxWGtJTzN6U2lVcG9LSFdpc2l6SVlocitnYlMz?=
 =?utf-8?B?NTErVVdudktqR0dRMWovYjVLVUgrR2hKUWN2UkhwSG5zZjlMQkRaQ2luY3Fv?=
 =?utf-8?B?RlI0dnVUamJaSVg0cEZVRm5JZmdmWDJaS1JUOFRacXkreUc5a3ZKSTBGTytn?=
 =?utf-8?B?SUExRWF3V0JWT3BTeUNrc2ZWelRNdVhORVcxNEQzZTdrZk9xZVZCN3FiQjQw?=
 =?utf-8?Q?Ks6mZwDkQi1NCNfUvsDGcx7GANQh4nbNsGqtb3b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNnYm9YUFFJVjFzR3RCa1NNdUt1RkFmcEVhUkx1UVdCUUp5TlVrOWxJUmdw?=
 =?utf-8?B?M2dxTXhKMEVnTnNTMDY2VFZaMy9ieUQ5eEp1QUhzTVhhSzhKd1M5OHFUbFJa?=
 =?utf-8?B?WXIrOFBGT1I4U1NVOFg5UjZyaFQrN2xRK1NNOVo1SStUa2RnUkpYM0VseVNC?=
 =?utf-8?B?UGNPWElhNFltZWFiUWV5bEM0MzQ3NVdPaWRQMTFQQk0ySFZHUWFJN0hacXNi?=
 =?utf-8?B?R2oyV0hGTERqdjh3TW1IREx1RUllM2dZMXhQL1MwY3FadzhKdFBaT2ViVDlB?=
 =?utf-8?B?eDNlWUs0UWJUWHVWYWpsMDhFVE1LemdJTVBmNWl2UmxMVExxYnpLc2E4YWR4?=
 =?utf-8?B?dEJEc3JhdEU5M1g1eHVWenAxMmgxQ0loTzMwQlhBOE1RVW5TYjY3QmI2OHdF?=
 =?utf-8?B?VCsrTzRnbWVrVVZjYWJISlh2TEtqSlZjRy84MHBkUklVeURsL0RyL0UvT1lM?=
 =?utf-8?B?NDlmLzFKMUp5aHFQQmQ0eEw2ckhOelNFNnZPZWdOS2toUHhJeG5vSWJENkZU?=
 =?utf-8?B?cnJNZmRsS2N0Ryt3Y0VRYlpVTEtWN1Q0aVFtWWRsa3lHVFoxMysvbEl5bFo4?=
 =?utf-8?B?TlVTY3JhK2lLa3JMNER1TmFvOWNJcjdkSmhENTRVa3FGdnUwUmppRzVsbWY5?=
 =?utf-8?B?VG80MVQ4SzU4ZlZnWXVIN0R3blBKeVc1eEVFZUxWOUtVQUovcjBaVkhFcTZy?=
 =?utf-8?B?Nk9qa2w3VC9ISlQ3TXIxMG9qNGZUTE5ZZitQRGNsck1oUGgxZ1FIUERMMFpB?=
 =?utf-8?B?TER5bTFGWjRkRlNyZDJxa0tVNmpPZHc4MnpYa3A0aHFkMkdESTcvRHdCUXBz?=
 =?utf-8?B?Y2k5RjFjSS9HaDFlTUJjcVpMVEhDTldCazV5YnZtUkY4c3Y3Rm5jTll5NU1Q?=
 =?utf-8?B?Rjh3dGMwVUUycURoNVFQZGNnZnhGaXdsTzJsaFNOcDR0aVl6am5DOEtiVFBs?=
 =?utf-8?B?dUVQWEZjSG50V1NJMGVTMnUzT3VyWFpDc1dveHU2Qm9xd0w2ZFhxTWhMVmV6?=
 =?utf-8?B?ckpTSmQyQUR0NzNibzMyOHM3Q01lMHZoTTBmUFhMdUJxbGFObzdWSGd4bWh1?=
 =?utf-8?B?aTZyQUNjdzNFZzZxUzlDZlhvUWRUNXY4SXI4VEdJcDA2aHRKTnBoRncrMThI?=
 =?utf-8?B?MURBOXlHcExPeEt0ZndFMS9jdis3emNHSmY3YWE4bFF1cEhDdkZ5Z2dJa1Rs?=
 =?utf-8?B?ZU1NKzg4UGdjS0J6QzBEYWNOZWFobzAzSE56YlF5Zk9rQkhkckVRRmdEOEZM?=
 =?utf-8?B?NWhhUktxNWhLZHlrQlN4MVpRQ1NOTHMvTUlheWZXTmhWV2dJcDB6bitXRUlS?=
 =?utf-8?B?eDdvNzJST3E2T09OVWZLamdFZGNwbXY1SWNLWGhrZHlGTkllM0VKdm9DTThn?=
 =?utf-8?B?QmZOKzA2NDhBNU9yWDU4WlZrRDA2NklzUG5aaFlRSmFlejZkbDBFSjJWZ0g2?=
 =?utf-8?B?Z0ZlcDdUYldGQ3JZd3lSTFB4WEdrRjdHK2ZEQUtZOXBUOXI4RXRRb1R0NWNR?=
 =?utf-8?B?aDZIQlVma29vcGYzTldpRThBZTkrZUdQeW9POGFDT0lIOWUrb3ZZZEVFT0hh?=
 =?utf-8?B?WEx3ZnRwVnh3MGVDVFkwb0VXdUFZL09HSm00dittT2kyeC9nQ2t4UWxEUU0r?=
 =?utf-8?B?M1p4aDJGem4xYTFUMHRFNlpWOHlVNGpieTAySEpaalBKdkxsRlA4dk1YaExz?=
 =?utf-8?B?WVkvV3hpaEN5ZDlseGlvdWFZYUhTaDFXSHVtdm00cURqZ21NSTVCaVBuRUdj?=
 =?utf-8?B?dWZQM3lsYTBxcUdUOWNadklXSkU5K1dFUmtpVThaQmFTNi9QK3NvWmZOelZv?=
 =?utf-8?B?Wm0xYzUrRlNpY004ckk5NGNWWEJxbVVSZFN2ZTdFYmRibHFnNXV5cTc4OEx3?=
 =?utf-8?B?OXhGQ2N6dzlZSS9XVEZVWG5oK1hXZEtPb1lUejl5bVRYbzhLb3FTY3VQUFVS?=
 =?utf-8?B?MDdiZUJ2aTJ0Myt2cDN4Wk00ZEZMRk1lRGlzZ2tJVEpsZHdRS3Nta2l3cEtB?=
 =?utf-8?B?c2RpbjBPY3l6R0g5K2pIeUlyMFl3SExyTEdWSFFBZTZkbjJQR1MxVS84Mlp5?=
 =?utf-8?B?OXhJZWZSTkxwOURQS1BTbWlkczhlYkJ2dXRNbVpFT3AwWmUyd055Z0lrbnNL?=
 =?utf-8?Q?HL9PLv6NWrxLXbuAULRluKEEt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1fb378-ea9f-42c8-2f3b-08dcf22ce9dc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 00:03:09.7474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s18qfMUwOZ2uUju/DFz6R6m7S8kFcTkgOyKO9ORpO9KJc+c7dTwXRbv0EbnnG8QNxuFReKp4SsvcDBaTNgH27w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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

see my comments below.

Regards,
Zhanjun

On 2024-10-21 3:43 p.m., Michal Wajdeczko wrote:
> 
> 
> On 19.10.2024 00:43, Zhanjun Dong wrote:
>> GuC based register capture is not supported by VF, thus prevent it
>> running on VF.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 41262bda20ed..5c0d9efaaab4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1590,6 +1590,9 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>>   	u16 guc_id = 0;
>>   	u32 lrca = 0;
>>   
>> +	if (IS_SRIOV_VF(xe))
>> +		return;
>> +
>>   	new = guc_capture_get_prealloc_node(guc);
>>   	if (!new)
>>   		return;
>> @@ -1756,7 +1759,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>>   	devcoredump = &xe->devcoredump;
>>   	devcore_snapshot = &devcoredump->snapshot;
>>   
>> -	if (!devcore_snapshot->matched_node)
>> +	if (IS_SRIOV_VF(xe) || !devcore_snapshot->matched_node)
>>   		return;
> 
> do we need to check for VF here? if we correctly skipped capture on VFs
> then matched_node should be NULL, no?
Yes, it should be NULL for VF in this case.
> 
>>   
>>   	xe_gt_assert(gt, snapshot->source <= XE_ENGINE_CAPTURE_SOURCE_GUC);
>> @@ -1820,7 +1823,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
>>   		return NULL;
>>   
>>   	xe = gt_to_xe(q->gt);
>> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe))
>> +	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>>   		return NULL;
>>   
>>   	ss = &xe->devcoredump.snapshot;
>> @@ -1876,6 +1879,9 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
>>   	enum xe_hw_engine_id id;
>>   	u32 adj_logical_mask = q->logical_mask;
>>   
>> +	if (IS_SRIOV_VF(xe))
>> +		return;
>> +
>>   	for_each_hw_engine(hwe, q->gt, id) {
>>   		if (hwe->class != q->hwe->class ||
>>   		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
>> @@ -1922,6 +1928,9 @@ void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
>>   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>>   	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
>>   
>> +	if (IS_SRIOV_VF(xe))
>> +		return;
> 
> n (aka matched_node) should be NULL for VFs, no?
Yes, n should be NULL for VF in this case.

The above 2 condition is not needed, new rev will be posted soon.

> 
>> +
>>   	if (n) {
>>   		guc_capture_remove_stale_matches_from_list(guc->capture, n);
>>   		guc_capture_free_outlist_node(guc->capture, n);
> 
