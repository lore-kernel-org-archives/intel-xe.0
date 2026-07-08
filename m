Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8793DC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 09:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344AE10E59E;
	Wed,  8 Jul 2026 09:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdeWOM4O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF4010E59E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783502390; x=1815038390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i9aEJZTPxxbVym9sKtu5mOfrUT5y4T6s/xVEMBMbwjQ=;
 b=VdeWOM4O4Ze/ZL/LNLaag9z4Lq0glwMW28cSEYceAWeHPbMm8cKpp7KB
 hfCUlT7j20yu7WezwkICkpinNTfHt4gt50mn72W55bD7roArhtGcVrJEy
 UwuAWt1MkT65nzEBMppcPKIoyjEfv81bz09f2/hl6Y0ZKw8LAAs506QaO
 9I9+Odxam5vXEyFK76RwWVwiye3MbvjUi1qqQNm+eljd7vu/lcMvnUpdp
 aiGm+4QEYg6x2nw8BHPiKogUz0tYVOJP3sCUstiG0JfqzuGTtogrFUqko
 yYhFDs7ljIPpPcr3h5YiVvTpxSLaPgePYBaLumlYYQ1vnIf46G7pbbtrW Q==;
X-CSE-ConnectionGUID: WE9/rWdYSzKqFIWOsCu8wg==
X-CSE-MsgGUID: 2VJ3vdHGR3qIIpS/WtSFag==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84017391"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84017391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 02:19:50 -0700
X-CSE-ConnectionGUID: uv7B9ChlR/CRWL3vk8PXKg==
X-CSE-MsgGUID: PmgtPg42QM+gUCjDBGbFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257815982"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 02:19:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 02:19:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 02:19:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 02:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb0GnZxfDn0nZVoLY4oAdMJLyLq/MuCN0ws3rwyaNjq9o+gBlzPgkAioXwosDHOnDgD3Mna+Z6xel6ZMUntPjIqSa8g7dS4k9A3S43PgkAwZvG4Yx0ZZfHp/wXWzCWwszOM4p4uvm36eNXNCItZKgaaSYwObA9DjNlPcbIel6XBNrVKwkKtW40xKP8a912Z8Gtd+UIDTheMVSB0hPCb4lB/EboN0DiujCJsCSBo98YROkLX3ppQlAoluObUt25yFRxPhDB67lwRGGWJ4zGL8rTjl//HaYhKtc1LfB+7cNbPjQaoxI0e+RtHagxNnxHzERXpJ8OY2Wwh3VNgDEUDH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwXEbpZ7F/scuxtpIP7tBEl6cU+TpVQLjXQi7rK86qY=;
 b=DMvU9WL1t+sGcxedTgrOr25itSE0sH2PSXRc/Ce4ZUzmOE/svz+hKfrmdqlVfaZRJsbAV8NfqaPKJtTbsfS7K4CWP4FLyJorNnlGXjOVL12PgAJED+q31DCe1T3DNNZu5D5/th+lPqqaC2pbyi7L1cGkhrzTgyfoTzTHwVzKb/n0mdq0Y+nvFw3tNWH4keTwDH4MMJEFJ9CvYCu+S1/VZ13wfFLXOBHcAq1UOEo0SETGkDkznbY7LF3rTQ+pzNtrxIFoz8MUXMxCwtb5ZqW2CpzpuJGtsatTijVkdQWXPrG3FD6rDF7Ebsi/Krc8g763m4PHHkWvUnv2fjKiPCZ0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 09:19:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 09:19:45 +0000
Message-ID: <a3d9f081-f59e-4637-9310-24fb2c16aa1b@intel.com>
Date: Wed, 8 Jul 2026 14:49:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <andi.shyti@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
 <1642a35e-36f4-4930-b9f4-c4a64105fa06@intel.com>
 <9d18fe09-196d-4766-b82e-5561de15dec7@intel.com>
 <2d2dff48-2955-441a-bd63-4f56a56cfabe@intel.com>
 <c2eb9860-0fdb-42ef-a6f6-aad3cb700429@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <c2eb9860-0fdb-42ef-a6f6-aad3cb700429@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 037be0a8-7aad-4b88-b303-08dedcd20d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|6133799003|18002099003|4143699003|56012099006|5023799004|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info: JRA+BYqK80g9fQNFJd2xIVcTEnXfsOgvhYgSYWdNHaWMebhw0p+SlmYBmJ8HqEigtSGmT2Uro3/sIf8k6um8CeLneeeCSHtkBJLDk4YWnQaEX+lQoVsfzMaPbzhkWRMY02LkK11XUHM8poHOIexlJ3d1qQtOe3lSJtUuBRQ+fN+yAFhI+DGuja/0YgOhSs8hUzDZrY0HvaYj/zaCuobfAo9RvvlKuhtBv1nqF1Sq7G2OtkEeEq3qG3XLZ8qMeqf2JYGj0p2b9438MmwFe/OwAc2UYbQKMl0AKMEUU9Pe25ys9vt5ISplPuX4lLx89DVHyjzAObWQ7O9IqcfSOIkY6PWEmewsNKiPJiHNLC04PjQL+uacBA6NPNc3dyHgHjrqonlfKIGEta3hg1dLa7M83WEScwsih3vt1L7EVl2P2avC1SX5PoH5JGrglQSg+Ne3ra3aSFmCRgReG8J+ORRgldeyNcbxIKK8AY/+BpYZiUc9AuUJrRqQYgdyUbFBztyoENTz0Qy+ggO5vBkbmcmm82SrNFkdxr1TNFH5lBBY/oaEnq/55THrTBtluUdhv0kwaPQkaESEbtcNzyWXmkMlgFv/HsnI2mz9joQ+TQ3jVzX2Sd9Ajl3y65ymVjPeIt/gCVFWkRZCJZjrHTIIfZUk5n5Z3j/4Q+sGlgvUPFsORlTHXgUMqLSkSF8CNU1RrygmE5ZRnKhMfng1r6suno+3Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(6133799003)(18002099003)(4143699003)(56012099006)(5023799004)(22082099003)(3023799007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9iUTlZOHR2L25hZld1QmdwVmYwa2Fwbmo4Y0RxZmhaYXdCSTEzenpGL1Vt?=
 =?utf-8?B?L01HbUFxWkRBYmxFdWpGTjV5UFBWT2VSWmlhNzVBRGNOZGJ4WU1HbitYbm85?=
 =?utf-8?B?OXo1VlBsdExNa3M0WVdjcG1iMGRTci9Oa2k4N0JzSktVZkRmNm84cDhKbmI3?=
 =?utf-8?B?aG4wdVB5RVlqTVhYWFpXQ3haZEorVmZrS3o2SUJRdHZPR09LV3N2L3hQQlNY?=
 =?utf-8?B?Skg1S0p2aXp3cUhueHMvdVpraldBellncEh5SjdXdmdPVHV4bkV4S1hwV3hk?=
 =?utf-8?B?NHZzeHA4bFNOaVhhUXlYVGJCdXBQV25hMGczVGtBT3daSEhUQWYrOFdvN2RV?=
 =?utf-8?B?c1hESmw0c0k4UUZLWkE4MitLekh1Z2lnbUxQbHBvOEp3VzY1dTBzUG94NjNO?=
 =?utf-8?B?Z1BWaTZpY0ZqVzlqV29VMUNSRVZXdDJTRS9jVmZNSCs1Q3FhTTliQUZISnN6?=
 =?utf-8?B?QzZpWmRsMlRNVHpLbWZKcUl6dXJXa1VTOGxTU09URmNlVFAvc1E1RUhTRjc0?=
 =?utf-8?B?d2JVYlBHdzkrM0Nmc0JuOVFYVGw4N2dzdU8rVlpZYXJ4M3E4bGlFUTVPbEZa?=
 =?utf-8?B?VjNCY2JROHBVQTl5eEJFQjU3MmxPT1J2ZnhEQUFBclVQZ0dPZEZ1UHE4Sm5z?=
 =?utf-8?B?VkUwaHpXdUJOdU85Ti9iUElnZUVlY0hrelc4VGJydG5vWGZJa0NVcktRNTFC?=
 =?utf-8?B?ek5kOXV5ekZjcG1tSUoyekZhTk9WdlBhVFN0eTJJRWxySzlFaUJmOUxEcVlw?=
 =?utf-8?B?YnNXclgzbk13Z0FiWkFEN1VUM1QxQ2ZLcXM1TWh2Ukk5OWJncHhSN3Y4MENQ?=
 =?utf-8?B?NmNvbnZSNC93YmlBbzNFREhHVjlxZExwcE5WVXRvcm5KSHk2dk53UXJqbUdl?=
 =?utf-8?B?ckF3WUFYTnIvYkNJbGhYRlFuTXVmaWtyK0t5aXdsMUNWQ0VxZjRTUDlhYlBx?=
 =?utf-8?B?aVo1UGRTTzlWTUJiQTNMYVF6cWIvRXV4bGY1bjZEOXVOeTlvZXEwSi9hd0dY?=
 =?utf-8?B?ZTVFaWIzZm1rdmkvQTRBSVRkbFV3bFNsNm5CeDcyUlBjKzdvamhlNWk3U2Nx?=
 =?utf-8?B?NUJVZDhJZW1qTHcyZ2JzMUlMWXdMbFpUWWxhNGxLQnFYUGRaNWNPdEJ4bEFB?=
 =?utf-8?B?VGNjSVJuYkZkM2kyNE9xeXlvdlZnQnd1TWwzWEY3VGwxMzkxbkFFM0JHM1NM?=
 =?utf-8?B?OGtpbnovMmtLSDhwS2lMODgrSGdwbElwYWRDSVpSVDEzc3VWajNaTldyUkg1?=
 =?utf-8?B?c1l2T1UyUGlIY1k2bG4zbC83TFpwc0tJRE1RWnV4bStDa25GSFUycWpCOUR5?=
 =?utf-8?B?RFB6VEVQRkJMUDRxOUVLNW8xTEY5UFVxSzBDSmVLSjNTeXpmZ1lVSUtoaEsw?=
 =?utf-8?B?VzBJRVlpRFRoRGVyZm1JZFZWMzgrTG9CQ1FDUkNOQlZjcXFQUENVQnUyRDF3?=
 =?utf-8?B?UWpneEt6dVpCVlNvNjRuWTFONytnblQ4TTg4dExwMEdOcDNhTG9EbkZleXpn?=
 =?utf-8?B?WllKMjR1MkJyZzZUcDNQUVJlcXo4ZHhiN2ErTFZDa1duWllieDR3aEN0QlhY?=
 =?utf-8?B?Vk94WDI5S01jVlhraUxGYXo4Rk9yYkJ6SHg4YStqRStDcUxTalIzeFBpa2pG?=
 =?utf-8?B?SnEzczVXMzdMdFNCUC9LQVZUVWZjUDBPeEpWRkt3SGFxWENLenNsams5Vmlm?=
 =?utf-8?B?UUREb3ptcnZpc1dGZW5pMlY5ekJ2RWYzM0M1TlJKZkg3YzJEa1I3WmxLZlBE?=
 =?utf-8?B?M25zV0FnNDBkMVJVMmxvM2YwQkVpWThEZmFrSjkyaU9LNFBrSGVCL2pmT2lM?=
 =?utf-8?B?ZnY1L1hFcFFlQWQzUXpnSWpJUnhNLzZpT0lmQVFCYTlSNEQ1QzJqSHRueUpQ?=
 =?utf-8?B?STVkVXZSUFBWZjdsYVJrYXVZbnpwdEtXWlVoYkMvY1BHbjN3ZlBqZHFIbDZu?=
 =?utf-8?B?VnJTZWYrby8zYWtRZ3BzdUV0dUFxTDZ3aS9SRHhHN245aDFhU0JwU1dSMTVH?=
 =?utf-8?B?NXkrZlFmMjZWM2xneUxETmxwZ0M4YjZEak8ycnRLOXIxazdaYzYyanpIVFhj?=
 =?utf-8?B?S2xxYkpTZmdNRDNmdUNHeExuNmVhNGZGMkRWSjE4dHVNR093WG5IRExmem5w?=
 =?utf-8?B?aisvK1ovcitLM0RIZFJoZk1mOGxUYnRmK2xNS05VWVhYaHVpaUt6WitMMW5Q?=
 =?utf-8?B?ZWhNNkFZNWVjcmMxdDBpNG5NRFVPS2lhazc1WTFUM0JDT093bnNqZkRmSGN6?=
 =?utf-8?B?RjRsMVFzWG5iZlZaUlJjaUxUdjZqSi9BY3haa1paUG5DL2VqVTJIQVlaKys1?=
 =?utf-8?B?UmtKalFZSG1ZU0VqS3h2VDEzeW1IdjRNMm12YnNPSmc1TE05YnZUQT09?=
X-Exchange-RoutingPolicyChecked: nYzsFLg2QDfglDP34HkT1ICJTqqDlpVj99hPExBpIbKgNsq5Hg15nA29W6TkgvTFco8xJaUp+RWMBk4/9nVuD8tAjls2ky+TG26uvWsEN8ktmT6kJUAmJBlNRsXoXh9V8aaXY2KJAX1reoUdHSRi5hQOX7czkgUJLu/ZFfWx6bsCtXJTglYDjvbYnypztYTZOa0OYkoq+hf2VFQ06oIGu3B5X6+6nb6ZlpKjy6G7yZgfpzOryUVpAARy4T9wjNsFdy3VmsaI2N5d+0wAt17baXUXU4bBkeV1xy96wy6IllxJbim0opzBASCHntWtOLMxUn7zBP0dQBNId36HHEJJtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 037be0a8-7aad-4b88-b303-08dedcd20d14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 09:19:45.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/Ivxvex7zPps2jJpFfs/TAJaPFvrHfK9H+MePc3pvE93HtzRoWvFZ2fRJOkGu5yt2yLefTpbbDJXMp+ESFqhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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


On 08-07-2026 13:44, Purkait, Soham wrote:
>
> On 08-07-2026 13:31, Tauro, Riana wrote:
>>
>> On 08-07-2026 13:27, Purkait, Soham wrote:
>>> Hi Riana,
>>>
>>> On 08-07-2026 13:10, Tauro, Riana wrote:
>>>>
>>>> On 08-07-2026 11:42, Soham Purkait wrote:
>>>>> Add a sysfs interface that reports the current GPU health state and
>>>>> lets admin users and management tools update it but is readable by 
>>>>> all
>>>>> users. Requests are routed through the sysctrl mailbox. The interface
>>>>> is present only on platforms that support the GPU health indicator.
>>>>>
>>>>> The interface is a single read/write file at the device level:
>>>>>
>>>>>    $ cat /sys/.../device/gpu_health
>>>>>    ok
>>>>>
>>>>>    $ echo critical > /sys/.../device/gpu_health
>>>>>
>>>>>    $ cat /sys/.../device/gpu_health
>>>>>    critical
>>>>>
>>>>> v1:
>>>>>   - Add enum for health status. (Andi, Rodrigo)
>>>>>   - Return error number instead of error message in _show/_store. 
>>>>> (Andi)
>>>>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>>>>   - Return only the current health state for sysfs read. (Andi, 
>>>>> Rodrigo)
>>>>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>>>>
>>>>> v2:
>>>>>   - Make logs and structures consistent with their counterparts. 
>>>>> (Riana)
>>>>>   - Drop unnecessary variables. (Andi, Riana)
>>>>>   - Add correct KernelVersion. (Raag)
>>>>>
>>>>> v3:
>>>>>   - Add missing blank line before #endif. (Badal)
>>>>>
>>>>> v4:
>>>>>   - Add consistent "gpu" nomenclature to the gpu health indicator
>>>>>     DOC blocks. (Riana)
>>>>>   - Add Kdoc for gpu health indicator. (Anshuman)
>>>>>
>>>>> v5:
>>>>>   - Rename struct fields to response.health, request.health. 
>>>>> (Riana, Raag)
>>>>>   - Use devm_device_add_group instead of custom sysfs init/fini. 
>>>>> (Raag)
>>>>>   - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
>>>>>     invalid-input log, and minor log/format cleanups. (Raag)
>>>>>
>>>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>> ---
>>>>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>>>>>   Documentation/gpu/xe/xe_device.rst            |   9 ++
>>>>>   drivers/gpu/drm/xe/xe_ras.c                   | 139 
>>>>> ++++++++++++++++++
>>>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
>>>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>>>>   5 files changed, 239 insertions(+)
>>>>>   create mode 100644 
>>>>> Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>>> new file mode 100644
>>>>> index 000000000000..9612b97b0f88
>>>>> --- /dev/null
>>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>>> @@ -0,0 +1,30 @@
>>>>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>>>>> +Date:        April 2026
>>>>> +KernelVersion:    7.2
>>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>>> +Description:
>>>>> +        This file exposes the current gpu health state and allows 
>>>>> the gpu
>>>>> +        health state to be updated.
>>>>> +
>>>>> +        This sysfs file is present only on Intel Xe platforms 
>>>>> that support
>>>>> +        the gpu health indicator interface for RAS. Reading the 
>>>>> current
>>>>> +        health state is available to all users, while updating 
>>>>> the health
>>>>> +        state is restricted to administrative users only.
>>>>> +
>>>>> +        Read returns a single line containing one of the valid 
>>>>> values for
>>>>> +        the current gpu health state. Writing one of the valid 
>>>>> values
>>>>> +        updates the current gpu health state.
>>>>> +
>>>>> +        The valid values for the gpu health state are:
>>>>> +
>>>>> +            ok
>>>>> +                The gpu is healthy and operating within normal
>>>>> +                parameters.
>>>>> +
>>>>> +            warning
>>>>> +                The gpu is experiencing minor issues but remains
>>>>> +                operational.
>>>>> +
>>>>> +            critical
>>>>> +                The gpu is in a critical state and may not be
>>>>> +                operational.
>>>>> diff --git a/Documentation/gpu/xe/xe_device.rst 
>>>>> b/Documentation/gpu/xe/xe_device.rst
>>>>> index 39a937b97cd3..6fdba960c2d9 100644
>>>>> --- a/Documentation/gpu/xe/xe_device.rst
>>>>> +++ b/Documentation/gpu/xe/xe_device.rst
>>>>> @@ -8,3 +8,12 @@ Xe Device Wedging
>>>>>     .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>>>>>      :doc: Xe Device Wedging
>>>>> +
>>>>> +.. _xe-gpu-health-indicator:
>>>>
>>>> Where is this used?
>>>>
>>>>> +
>>>>> +====================
>>>>> +GPU Health Indicator
>>>>> +====================
>>>>> +
>>>>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
>>>>> +   :doc: GPU Health Indicator
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c 
>>>>> b/drivers/gpu/drm/xe/xe_ras.c
>>>>> index 74d5016d9ffe..d1214a213d6e 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>>> @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
>>>>>   };
>>>>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>>>   +static const char * const gpu_health_states[] = {
>>>>
>>>> status or states. Use any one consistently.
>>>>
>>>>> +    [XE_RAS_HEALTH_OK]        = "ok",
>>>>> +    [XE_RAS_HEALTH_WARNING]        = "warning",
>>>>> +    [XE_RAS_HEALTH_CRITICAL]    = "critical",
>>>>> +};
>>>>> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
>>>>> +
>>>>>   static u8 drm_to_xe_ras_severity(u8 severity)
>>>>>   {
>>>>>       switch (severity) {
>>>>> @@ -332,6 +339,132 @@ int xe_ras_clear_counter(struct xe_device 
>>>>> *xe, u8 severity, u8 component)
>>>>>       return 0;
>>>>>   }
>>>>>   +static ssize_t gpu_health_show(struct device *dev, struct 
>>>>> device_attribute *attr, char *buf)
>>>>> +{
>>>>> +    struct xe_ras_get_health_response response = {0};
>>>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>>>> +    struct xe_ras_get_health_request request = {0};
>>>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>>>> +    const char *health;
>>>>> +    size_t rlen;
>>>>> +    int ret;
>>>>> +
>>>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>>>> XE_SYSCTRL_CMD_GET_HEALTH,
>>>>> +                  &request, sizeof(request), &response, 
>>>>> sizeof(response));
>>>>> +    guard(xe_pm_runtime)(xe);
>>>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>>> +    if (ret) {
>>>>> +        xe_err(xe, "sysctrl: failed to get health %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    if (rlen != sizeof(response)) {
>>>>> +        xe_err(xe, "sysctrl: unexpected get health response 
>>>>> length %zu (expected %zu)\n",
>>>>> +               rlen, sizeof(response));
>>>>> +        return -EIO;
>>>>> +    }
>>>>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>>>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>>>> +               response.health);
>>>>> +        return -EIO;
>>>>> +    }
>>>>> +
>>>>> +    health = gpu_health_states[response.health];
>>>>> +
>>>>> +    xe_dbg(xe, "[RAS]: get health: %s\n", health);
>>>>> +
>>>>> +    return sysfs_emit(buf, "%s\n", health);
>>>>> +}
>>>>> +
>>>>> +static ssize_t gpu_health_store(struct device *dev, struct 
>>>>> device_attribute *attr,
>>>>> +                const char *buf, size_t count)
>>>>> +{
>>>>> +    struct xe_ras_set_health_response response = {0};
>>>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>>>> +    struct xe_ras_set_health_request request = {0};
>>>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>>>> +    const char *health;
>>>>> +    size_t rlen;
>>>>> +    int state;
>>>>> +    int ret;
>>>>> +
>>>>> +    state = sysfs_match_string(gpu_health_states, buf);
>>>>> +    if (state < 0)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    request.health = state;
>>>>> +
>>>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>>>> XE_SYSCTRL_CMD_SET_HEALTH,
>>>>> +                  &request, sizeof(request), &response, 
>>>>> sizeof(response));
>>>>> +    guard(xe_pm_runtime)(xe);
>>>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>>> +    if (ret) {
>>>>> +        xe_err(xe, "sysctrl: failed to set health %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    if (rlen != sizeof(response)) {
>>>>> +        xe_err(xe, "sysctrl: unexpected set health response 
>>>>> length %zu (expected %zu)\n",
>>>>> +               rlen, sizeof(response));
>>>>> +        return -EIO;
>>>>> +    }
>>>>> +
>>>>> +    ret = ras_status_to_errno(response.status);
>>>>> +    if (ret) {
>>>>> +        xe_err(xe, "sysctrl: set health command failed with 
>>>>> status %#x\n",
>>>>> +               response.status);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>>>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>>>> +               response.health);
>>>>> +        return -EIO;
>>>>> +    }
>>>>> +
>>>>> +    health = gpu_health_states[response.health];
>>>>> +
>>>>> +    xe_dbg(xe, "[RAS]: set health: %s\n", health);
>>>>> +
>>>>> +    return count;
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RW(gpu_health);
>>>>> +
>>>>> +static struct attribute *gpu_health_attrs[] = {
>>>>> +    &dev_attr_gpu_health.attr,
>>>>> +    NULL,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * DOC: GPU Health Indicator
>>>>> + *
>>>>> + * On Intel Xe platforms that support the GPU health indicator 
>>>>> interface,
>>>>> + * the driver exposes a sysfs attribute at the device level as:
>>>>> + *
>>>> code block would be appropriate
>>>>
>>>>> + * ``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``

Nit: This is okay. But for consistency with the file use <devices>

>>>>> + *
>>>>> + * Reading the attribute returns a single line containing the 
>>>>> current GPU
>>>>> + * health state. Writing one of the valid values updates the 
>>>>> same. Reads
>>>>> + * are available to all users; writes are restricted to 
>>>>> administrative
>>>>> + * users only (attribute permissions ``0644``).
No need to mention permissions
>>>>
>>>> Can these be set by firmware too? Worth mentioning incase an admin 
>>>> had never set
>>> Does this  falls under the scope of this doc ? 
>>
>>
>> I am asking.  Do you know if firmware is allowed to set it too? Or is 
>> it only admin.
>> If as a admin i am reading this document i see that only i am allowed 
>> to set. 
> Then It could be explicitly mentioned that :  for only inbound cases.
> As reset of the part is out of the scope of this doc. 


To confirm, apart from admin (IB/OOB) no one else can set this
Not even firmware?

Thanks
Riana

>>>> the value and sees a warning.
>>>>
>>>> Do we need to mention when user needs to use this?
>>>>
>>>>
>>>>> + *
>>>>> + * The valid values for the GPU health state are:
>>>>> + *
>>>>> + * - ``ok``:
>>>>> + *    The GPU is healthy and operating within normal parameters.
>>>>
>>>> Have you generated the document?
>>> yes.
>>
>> Any reason for having the description and the status in different lines?
> Just for the aesthetics nothing else.
>
> Thanks,
> Soham
>>
>> Thanks
>> Riana
>>
>>>
>>> Thanks,
>>> Soham.
>>>>
>>>>> + * - ``warning``:
>>>>> + *    The GPU is experiencing minor issues but remains operational.
>>>>> + * - ``critical``:
>>>>> + *    The GPU is in a critical state and may not be operational.
>>>>> + *
>>>>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for 
>>>>> the ABI
>>>>> + * specification.
>>>>> + */
>>>>> +static const struct attribute_group gpu_health_group = {
>>>>> +    .attrs = gpu_health_attrs,
>>>>> +};
>>>>> +
>>>>>   /**
>>>>>    * xe_ras_init - Initialize Xe RAS
>>>>>    * @xe: xe device instance
>>>>> @@ -340,6 +473,8 @@ int xe_ras_clear_counter(struct xe_device *xe, 
>>>>> u8 severity, u8 component)
>>>>>    */
>>>>>   void xe_ras_init(struct xe_device *xe)
>>>>>   {
>>>>> +    int ret;
>>>>> +
>>>>>       if (!xe->info.has_drm_ras)
>>>>>           return;
>>>>>   @@ -350,4 +485,8 @@ void xe_ras_init(struct xe_device *xe)
>>>>>         if (IS_ENABLED(CONFIG_PCIEAER))
>>>>>           ras_usp_aer_init(xe);
>>>>> +
>>>>> +    ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>>> +    if (ret)
>>>>> +        xe_err(xe, "Failed to initialize GPU health sysfs, 
>>>>> err=%d\n", ret);
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> index 6688e11f57a8..4c4fbc42c956 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> @@ -10,6 +10,21 @@
>>>>>     #define XE_RAS_NUM_COUNTERS            16
>>>>>   +/**
>>>>> + * enum xe_ras_health_status - gpu health status values
>>>>> + *
>>>>> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
>>>>> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still 
>>>>> operational.
>>>>> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may 
>>>>> not be operational.
>>>>> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
>>>>> + */
>>>>> +enum xe_ras_health_status {
>>>>
>>>> If you removed status from enum, remove from name as well.
>>>>
>>>>> +    XE_RAS_HEALTH_OK = 0,
>>>>> +    XE_RAS_HEALTH_WARNING,
>>>>> +    XE_RAS_HEALTH_CRITICAL,
>>>>> +    XE_RAS_HEALTH_MAX
>>>>> +};
>>>>> +
>>>>>   /**
>>>>>    * struct xe_ras_error_common - Error fields that are common 
>>>>> across all products
>>>>>    */
>>>>> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>>>>>       /** @reserved1: Reserved for future use */
>>>>>       u32 reserved1[3];
>>>>>   } __packed;
>>>>> +
>>>>> +/**
>>>>> + * struct xe_ras_get_health_request - Request structure for 
>>>>> obtaining gpu health
>>>>> + */
>>>>> +struct xe_ras_get_health_request {
>>>>> +    /** @reserved: Reserved for future use. */
>>>>> +    u32 reserved[2];
>>>>> +} __packed;
>>>>> +
>>>>> +/**
>>>>> + * struct xe_ras_get_health_response - Response structure for 
>>>>> obtaining gpu health
>>>>> + */
>>>>> +struct xe_ras_get_health_response {
>>>>> +    /** @health: Current gpu health, see &enum 
>>>>> xe_ras_health_status */
>>>>> +    u8 health;
>>>>> +    /** @reserved: Reserved for future use */
>>>>> +    u8 reserved[3];
>>>>> +} __packed;
>>>>> +
>>>>> +/**
>>>>> + * struct xe_ras_set_health_request - Request structure for 
>>>>> setting gpu health
>>>>> + */
>>>>> +struct xe_ras_set_health_request {
>>>>> +    /** @health: New gpu health to set, see &enum 
>>>>> xe_ras_health_status */
>>>>
>>>>
>>>> Let's use short description . "gpu health to be set" or just gpu 
>>>> health
>>>>
>>>>> +    u8 health;
>>>>> +    /** @reserved: Reserved for future use */
>>>>> +    u8 reserved[3];
>>>>> +} __packed;
>>>>> +
>>>>> +/**
>>>>> + * struct xe_ras_set_health_response - Response structure for 
>>>>> setting gpu health
>>>>> + */
>>>>> +struct xe_ras_set_health_response {
>>>>> +    /** @status: Status of set health operation, see &enum 
>>>>> xe_ras_response_status */
>>>>> +    u32 status;
>>>>> +    /** @health: Resulting current gpu health, see &enum 
>>>>> xe_ras_health_status */
>>>> Let's use short description . "current gpu health" or just gpu health
>>>>> +    u8 health;
>>>>> +    /** @reserved: Reserved for future use */
>>>>> +    u8 reserved[3];
>>>>> +    /** @reserved1: Reserved for future use */
>>>>> +    u32 reserved1[2];
>>>>> +} __packed;
>>>>>   #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> index 6e3753554510..d4da6e9ef774 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>>>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>>>>
>>>> gpu health
>>>>
>>>> Thanks
>>>> Riana
>>>>
>>>>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>>>>    */
>>>>>   enum xe_sysctrl_gfsp_cmd {
>>>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>>>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>>>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>>>   };
>>>>>     /**
