Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287D5FF8862
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 08:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15B910E28E;
	Mon, 27 Apr 2026 08:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFzK0Si/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E499F10E28E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777277919; x=1808813919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cWZlQcsjwfr9XiXknTdpA3E5uzGpiXzMO4Un0nyqnjM=;
 b=ZFzK0Si/66JhOGq4p70YLIHKVe91MagLs+vDFTv9huMS+uxW0vFGqSgw
 KjuN7SKo2B3sww1X2PdKl2smHMKUswzV4hUDrPcT8qJeiswOYMReOoU4I
 GcPkgve1V5EdXP6LnPNsbmIKlVF6rvLr8NE4Q0ZCI8bG3GpUzEC3W4Y2V
 NxsEpo/kDaXGumkVlh4L1dnmcyvrnnqWpYZZITeeXP3xSnblcnsxNj6vr
 zQEseeMPMBiTJNFvcW8KW0lWsZnlEz/NP0PfdwE1LW+p4WhiqLMHb4E4l
 YhNj9C7VwR4UiSxuFbC6ZP0XY1iIb14vTnEByP1eIi011v4FKWtMJDS7v w==;
X-CSE-ConnectionGUID: wqUE7y2aTVaVLduXf3/S3w==
X-CSE-MsgGUID: /0Pns0cBR0u+W8Xtvgxaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="103622102"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="103622102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:18:39 -0700
X-CSE-ConnectionGUID: BYR4oyO2TEeu9AyQseczPA==
X-CSE-MsgGUID: BnUnXK/MQH60Hg0RcXncXw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:18:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:18:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 01:18:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:18:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvtTEDFzPFXAcCf5jRGEfBnnbdyGc1oepCjOD1NydWq+wQUpHnlo8G/H/rAVuYI/s3+AZ5JVzK4QpsxLL77UrmdBlK5GLmt5QGxVa99jhgjSBEe4jr+IiYy/+Ol3lRlf/hMzAA8ZKbHN2VBlGvIUY1AGwLEspGzBfmFFMtl7txaAn30TCAkuzn0YZdAlhjKPfAFzfYcHctnnHRya0lZ3E1UOqH8UB9kjtTyX/mlxCZU63lxQHtC9Oz/sW5jqmE+09tkaCKMZLo8y6DOoNtNmk38S57fm7nMkpwzcBlpTI9/ZzJ9C61W3rKNEaBzhCTnlgjOo1IMCX1Hs9FWLi4M0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEB4SCSiIxJne9nvvfro2K2/fgl0T95BhyZwkOBbR7E=;
 b=GsNy1/FMg09xiUlZ62yUx+66rlr1WAi8JIKYkKL0c0XDzZhmuBf1oYL/RVctOMkHFK61evJy7teR9MieAX82LMyASKnJ70kpTiqT4hCrjYCUVrSG6mxDOUhrDc6DoNfW+YTQTIfKdGZOXCVm40HHqFt13D7xFOz1lalA6mOVT++lZnXfZrY5sWW5qpaIqMAOcv7gXY/eXkM5ME8CgD1eZOKhPa2ZimoqgRz16edJY9yPIKYIsTRMSNwKkGTl+5JDU0X3JbHu1kBElijqdi9DqKu7hBDUvTSDChhWtWMTvJ+4X5Kg3frnXYR+WJC93VjyTP5vhuKeypUh/nXcFYVMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.21; Mon, 27 Apr 2026 08:18:31 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 08:18:31 +0000
Message-ID: <3989ed8b-7d9e-42e9-b9b0-913b2a5684d7@intel.com>
Date: Mon, 27 Apr 2026 13:48:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/hw_error: Reuse CSC worker for generic
 error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260402174229.1062874-1-raag.jadav@intel.com>
 <20260402174229.1062874-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260402174229.1062874-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d08b666-7a28-4047-a76a-08dea43590f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: BX3dLh65t5kPJt9n8xdcdvpoDo+vBaiW83hMfGuqvTGtXkQedTtWy1bGFPZ4eS9V2dwisUKYy0sPkVgQrlt5s5FZic7F+I/P093xxyf8tWpko6+rVmKDNrIbpNxPD2QkL1/zffHTGC26DgEnk2/AXW6kChkoX1C1vzqJHLYEiqvAwh4Fby4JlB96g/wFHTt3jWuEBpskavvHcPf5bUYLNOaMFIpqhze45lhHQCJeCFa8SSXGWNrEgHsrVL0dFEiKVHCzbf9jm6JRPv9707TymLL5i6pTjt87Jz4GAU2Ygwf1+WzEL1D6c7IDybxSS1U7d/sQZGbGq9zRN85G77swuQq2HtPsjRPb70F6Prbx15zowX8Zp34vKmbTZ159qSPMJMmtGjtufShcKC+jj+5FyWXXKg/zKkgi3VTloyXIMEEd2lWsW3Hq025EUOtS82Klc9XnrIpH5rum6vBFucRSRDNafqshRM7c25BXyRXL2rjBnk+V2ySx/r+HUDN82IQoUH3M2kELjrge0D/MDznjG/1T4RZ0SV3pgaWXWqW0CIrELnxhg52sq92NIBd946buTXwAJj3/FTaAeOciaJ5fqzggL8R8tUw9Rs6THGgpZjZKKG+PzwNx+a7aCIlqYf8UQZJbSOmab9IiWyEjC5niuQJj7T8oZA/ffUz/iU9iEjW2a7BVw37k7mXyI3H3TS/ByofhX+YxrPVN/evdT0zp4oVgq/GGKD3Qz9Eezj+aXGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEU1cHdTZ1FCRmo4NHZSM0h0UDhhaElHbXBoVTQ3dHROajc3RjZ2WGlheVdl?=
 =?utf-8?B?SUQvRUFpdEZqbFBhZmVVODc4QjlmNGhQRG9IcjlabTFvSFVOSXNsSm84eXRz?=
 =?utf-8?B?ekNCKzBvMGhrK1VRYStHQ3BDTEJpZHUvdnpxZlkrN1c3SVlHSVI1WDJsNEZi?=
 =?utf-8?B?SExmRmJHM1Y1S2JueWFZd2dacG82SDNyWU9FanJ1a3pUd0JZYm5mZHhvQ1hl?=
 =?utf-8?B?RVMrOFdJbWFFa1lYckd6YTlKYXJBT05RWURHYUZGRWJyT1MxOUthVkt0cExJ?=
 =?utf-8?B?U2djUHVBWEZUWU9wRnExWDY0VlZyc3dLTkdSbTE2MnU1ZmM4VGU2T2FMVUkx?=
 =?utf-8?B?Sll2SE9nMjl2c1JFOGxjalpoR0haYzZYU0FIVVBNMm1seHFXa2t0bWVZY0cv?=
 =?utf-8?B?K0xhS1N6MXBEN1lsTWdwdXoraFhoNG9OZ0JGRnhoLzE5WitWaWFKdlJ5V1RN?=
 =?utf-8?B?QnNYRklTcVMyWEw0Q3ZHM3BCOTd6OUgwNmllQ2VVbWFVZEhXd0tCeTVRY2pR?=
 =?utf-8?B?ekJHaXduUWJrT2JFVDFZdzRBSURjTzZGVklIQVNPZWFaUnRxMzUrUW5lWTV4?=
 =?utf-8?B?aVBhc0t6RjVuOUFza1crdWVqdkZKYXVKMkQ1WEZvd05NS3Uvd1hodWJqRXpR?=
 =?utf-8?B?dEIwTWxReHZUelhOMzV4OW9EYU1zaTBOcFhreEtlVFVXRzR0enVaUzRkekVS?=
 =?utf-8?B?cWJaTFZEYWVxMXlDRWRqaE4wYzdQcFJmMU1INjhIUjFhalYySktGSU95dTJR?=
 =?utf-8?B?TURneHVDbjYzWmdsQ1IwNy9ZeVlxZ3paQTk2YmlmbjJJcUl5VkI1bW9ZOS82?=
 =?utf-8?B?R1lEVEoxdS9rTVdHemFqNzU3b3NmVUdWeURzejVndzJNMnFNeEpQVXlzR1ZM?=
 =?utf-8?B?VGxSQWoxd3pTT3MzeWZ5YTBUdnZvazgrVm9mN1VxMFQxaXFra2pZQUgyVHp1?=
 =?utf-8?B?R1dGQkFNY1MrUTBES3JJV3B3YXllcGEyTmRjRWgvTFJzUExkV2QvSHZMU2Js?=
 =?utf-8?B?OW9YYnlxLzYvdmsrR29IT1RMNnVTa0t4MDdLMk16ODU0SThJZTRZV2t4K3lH?=
 =?utf-8?B?dngwMXJRNi9XNlNUbkdaeFQrM0ZKd1ErOXkzWUU3NEVsUURoK0JQK0hLME9y?=
 =?utf-8?B?czZhTDIybllzVCtza0RKVkQrSDh0WnpwV0lsMGF2aU9Ka3VJWXFocDJTWUJI?=
 =?utf-8?B?ZUFReXJNUGJMN0o5c0s0eldpR2ZaeEV1cGVaZEdmcWRSbXBYRk5kM2JmUWdl?=
 =?utf-8?B?OWVkSCt6eXhpei8wM1hSSmp0WW1PVDFOL3pDa3gvZ01Za1o2bVA4TmtIOU1J?=
 =?utf-8?B?a2tiZi9NdlhMMVU3MGJySHpGS1lVWE5yUk1xYXY2NytiWjRXbllMQkJRcUYv?=
 =?utf-8?B?M0M1TUdhSG91R21MdUlvSUE1OWNEbmNvSms4Tm9pbFhUdWQ0akZKblRSazh2?=
 =?utf-8?B?emk4YzRyb1VueW03bW8wbUNNbUlDcVZIYXl6dHRxMFdjdDJtYi83bFlYb3V0?=
 =?utf-8?B?WTA3cnp3SWlTUEdaMnhrS0gyZmQvM1BwbUZPalVEWFpSckJubkRNNXVWeWIv?=
 =?utf-8?B?UCtkMEIyVEcwcE1SbEFuM3VlWlJXMlNJR0hORWVneXFRM1g2L0o0K3plZ0Za?=
 =?utf-8?B?QmRTamV2V2xQb24wemE0MmdrNkx0aU5mNDJCUkdIQVRTSzI3dTJKUUxJVFk2?=
 =?utf-8?B?VU56M2pwMXlXUVlNSjJqL0hGbWVqZ1U5WTJMVWVsbk9rb0pFNDl6Z25MYlkz?=
 =?utf-8?B?dkhPTDFQV0FpMjd2YXk1Zis2eXg2YzlmNXpudUFhSStXM3JESW10VGRMMFJt?=
 =?utf-8?B?Y3BZU1NGZjNPWmc0ZGpoYytvVFF5SGo1VTM3d3c4V1BXWTBhR3Z3RTAwQ0hz?=
 =?utf-8?B?ZVdzL0w4dW9BRDRUKzMyUEE0VzZZdEE0L2RCZVFvd09teGpZZWt0SGY2U3RI?=
 =?utf-8?B?cGp4dGZTRFJsaGt4NGJUTHlTSEovZVhtWi9aSVJMME5QeU92VGpjbHpZV0F3?=
 =?utf-8?B?bU9YRUZJSDVXczB2YVZVMzhBQWhsZUY4ZURnbXErOVhBQmMvU3YxZmpVRm9w?=
 =?utf-8?B?T1NLWlF6MXZrZytuS2RDeDY0eFYwc0hUKythcXFWSkhudmxYTEkzSklNK3pk?=
 =?utf-8?B?NnJnUWwzUExuZ1l4VEZ2cG1jbmpJYjdXZVMvT001bE9Fd1o5YmtxYlY1S0ti?=
 =?utf-8?B?aHA5bjZiV2lIMEZwRS8yVnBaNXl0UmpsN0dpZ1FJQ3JRS3BzNHRwZDJKQmVj?=
 =?utf-8?B?YTN1c1Z6U2ZuRDkrdnY2V0R2RDdvVmdoTktlRExma3BmTVNRdmJ0VGRUQy9k?=
 =?utf-8?B?M1dXZ2FZUHlmVTY1L2hYT2JGWWJuYzlOakIvQ3JyeXE2WmJzQ1M2UT09?=
X-Exchange-RoutingPolicyChecked: Ye035QLmz5cIXKh7xFvFMMlERzps/cW0jQAB8IQOR9Cnc6piuwAWQmv1m+enGnJ3n7U9Lit6gJlf7URY4mMsbKBFaRMTGfGp6RWhtCzqfwHFPwVmp8B5QIdsltOtarJb4O0Ej+Qbvn4qVDlc/YuSuHL8MRqm66kEskKoRmlfNeGn/ViCHwmY1OGK58s7cVZMippo22CksXQ/VdaI0U+ja5ZRrjPrOS86XQPwHw2cFfh5qc73LqVua9WnXU3oXfqxQe4Qk+vvSaVLWeYTdc7dSUIpz9y+W/zPmqql1ETIA9oenoL3lD1wLedSiBviBcbmj5QK/x7x2ahDkVl3PQPQpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d08b666-7a28-4047-a76a-08dea43590f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:18:30.9473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4D11o2tNPmxURwi+8QKHsESX13rr4Q/IcXc7+3Pzk62PxvlLzbm8vrl1OQSfuXOvVpNzb4CQfc9+EkJUFJgQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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


On 4/2/2026 11:12 PM, Raag Jadav wrote:
> We have upcoming usecases which require defering work during error
> handling. Since we already have CSC worker in place, prepare it to
> be reused generically.

LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
>   drivers/gpu/drm/xe/xe_tile_types.h |  4 ++--
>   2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 28ad5c15685e..c7b720ba5a4f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -165,9 +165,9 @@ static bool fault_inject_csc_hw_error(void)
>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>   }
>   
> -static void csc_hw_error_work(struct work_struct *work)
> +static void hw_error_work(struct work_struct *work)
>   {
> -	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> +	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   	int ret;
>   
> @@ -205,7 +205,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>   					     hec_uncorrected_fw_errors[err_bit], severity_str,
>   					     err_bit);
>   
> -			schedule_work(&tile->csc_hw_error_work);
> +			schedule_work(&tile->hw_error_work);
>   		}
>   	}
>   
> @@ -510,7 +510,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   	enum hardware_error hw_err;
>   
>   	if (fault_inject_csc_hw_error())
> -		schedule_work(&tile->csc_hw_error_work);
> +		schedule_work(&tile->hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>   		if (master_ctl & ERROR_IRQ(hw_err))
> @@ -577,7 +577,7 @@ void xe_hw_error_init(struct xe_device *xe)
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> -	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> +	INIT_WORK(&tile->hw_error_work, hw_error_work);
>   
>   	ret = hw_error_info_init(xe);
>   	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index 33932fd547d7..f214e893f39e 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -116,8 +116,8 @@ struct xe_tile {
>   	/** @memirq: Memory Based Interrupts. */
>   	struct xe_memirq memirq;
>   
> -	/** @csc_hw_error_work: worker to report CSC HW errors */
> -	struct work_struct csc_hw_error_work;
> +	/** @hw_error_work: worker to handle HW errors */
> +	struct work_struct hw_error_work;
>   
>   	/** @pcode: tile's PCODE */
>   	struct {
