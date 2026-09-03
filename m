Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2540EC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 04:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9263410E03C;
	Thu,  3 Sep 2026 04:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0fg9ECM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9653810E03C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 04:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788409986; x=1819945986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=2cYlcO0SfXB4Kt/+DDpC9Wtw8XbFN0YByi2wZjfpU/U=;
 b=a0fg9ECMYZhVdt8LGscEWNbaSXpGCkiEQiGq9psu7y24913D7L2hxmqm
 lxvo4kZyDIzSp/SUdbtVodwBUvPzB4YN6NReSHuzAnG0f6414j483+Ygb
 jTk+udWuNdTLNnn00ISsaZUk9K3nfAxi5CefA6qHp94YpzeZSabYZaANV
 dmpv4c0CMeozjC9XuPvdf5QoMRwmlwP0Mr8NKhnjSI5DayV9cyv5PINRd
 CUGlDS2d54NDr/ZeoVoueDVGSkpdEXZkxYXlBJ6bW9QGLPgAfSYGQ7icm
 WYkt/HgFoBV/NOAeWR2UjFFJHtN2D939sbG13BaBgwez+hfpqfnQmhxTK g==;
X-CSE-ConnectionGUID: ceIahPfJTZuTAt/QLKSL+A==
X-CSE-MsgGUID: gahl8sXvQqGpioG15/r9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88911370"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208,217";a="88911370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:33:05 -0700
X-CSE-ConnectionGUID: 5Tg+zMEYS1WhNltc0l+OdA==
X-CSE-MsgGUID: 0F0Mv6CVR9avASUQ4nmC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
 d="scan'208,217";a="274895717"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:33:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:33:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 21:33:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWTcBwsCd2HiUlfz1kbD6AsZMn1jrNXUAWLOrlZzowGi/KEQgQ+bLc99hFpYf+pmZLaO8kS3jrNStkj1oYFdTpxXXH+6UHYcpYnJYrCq6n/XQrIR9GYub2z2Q6WsSolPaCb6lVCFjbPz/ky3ytEgEOfX1ewbSsPyZv6lRRHIY2quWyfiKkR3X8jRL8teyOnadoW/hXMJAa06O8pxn/iUcUIUBu2nYOrjqMrr2UTnfcH6Fq2gEboXizECCZPNHvkBuOjuYZD3t27UnaDnPGUulRsaEJ1WCtN8Rclv3+N0hyqdPi2cFr+MXSH94v57bwc+wWeBxzZDddI/u1aWH0UiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQnJdjhrN2S4NAVOPNaJ33u3Xe+lT37x6Gh9ZrXxp90=;
 b=ucF087DORRd56Kk4PADG8VQjb+bsxRKLcos7M61/TXLhS5GSd9fsFzw0BUPIGDVzP5wFpxa/oTQ/lsN87fW4sJAxQO3TKVr+1EdjKaAZbfP4qtXtDqcngVC+2tFaisgXsI6w26G+qT1XA82mGuVGqcjCXcnaQNfq1dAh+7GBOaT2BAFOn7beNO0HKENB7A7Jg9MHJNmqaC9sWMmO/AR3OkiNVrds7dIlqBD9p0NpGRpxZ83mg1kevWqv6YIfXhrNdPYL8KHUA1ukOBWm/AlpkltMHf3UuJXqPqjJ3UwfUuIvAajhrrsK/JeenwxkUlGODNnrjchdmtTJ1gCf6yMObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:32:40 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:32:40 +0000
Content-Type: multipart/alternative;
 boundary="------------L94XpbEsz0JfpfaST0JbDgiI"
Message-ID: <e3b0a92d-14d6-4d32-969d-f6f52f6b7d51@intel.com>
Date: Thu, 3 Sep 2026 10:02:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe/gt: Report GT reset failure using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-5-arvind.yadav@intel.com>
 <f1d01885-1a97-4b5b-ac17-b53ad3541ca5@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <f1d01885-1a97-4b5b-ac17-b53ad3541ca5@intel.com>
X-ClientProxiedBy: MA5P287CA0194.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|LV2PR11MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: de0727cc-02e6-492c-0176-08df09746368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|8096899003|18002099003;
X-Microsoft-Antispam-Message-Info: 8/MhfHMV+rTdu5f+Jbe4p4fDB0Csksll9F8KApiOvE6NvS6x3JkDBnLbCB3+5lykOH/yrCf/Na+5uhCGg6r6YtMfinb/EtpSlCBqtJspxkApeV77IkpebF+PJO7dOqP7I3D7tPBNIK/gEgvw72YJ6pFTXaTGEUo4Dxjxjb3q+2O2blJOj2gtel8eCFpLgWG0m7j+VX32gX2XutPbDEzGVZZIqFOZaUKlqrsG2QGN5zYoraNs0RGdK5h16Q6bcuwU7WYNMUEpLNTTeHEBS2gdF42IWpdrzRHzK0lPoPWrXv1pNp+U8LQaApucgBEO3SWwrGKb8/ZB5jzNeJtXJIGWq1CDRlxPm2cDJYIIPisdvSRyVJiBe8P/PC3r4tFkDXV7TMSyR9QCEiqz78JX0pCgag4qLPIdMClNVtOktHMFNxlpcCfb3tREmZbdJAbbhD+HKoKUrzB2csJRaKhJrp0sLL2NNDz9JERemoltcrkTfDo6t7UvCkHvjIKtoH1MY9XWWA/eIRL/ZMwA3vjat31i4ChBPY8EyxU7LgWFgqEGJfpizL56QSQSWnUQJ8fVfjDeD0gHS3ii8s+ay6jzfbWwsT7jCbUHGbVzMXBoiqNLgvzaVKIQnaX1/t4gq0G7YRX6PoIcDFzSApGVJbTG/qyiA+cqNZaj6WSo0lEF/82upR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(8096899003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TExBLy9OQldEM2hnM0VFU3J5SjNya0dqdS8xdW0xODY0a2krWWo4YnR5a1JD?=
 =?utf-8?B?Y1NKYjczSW94WDh0dDl1U2pCa1E3eDFBaGowSHV2WjJ3MU1qSHlxZXpnTG5V?=
 =?utf-8?B?R25CSlZIYWlMZ3QwUTJRK0pYaGVOc2V2QUY0MjlONWdEOVgwb3JEY0VjVFdr?=
 =?utf-8?B?d0NTeW8vWno4bU1WcjB6NStacktGcVRkWERtOURwd29qSWpKYm5kYjFZMGNT?=
 =?utf-8?B?RWhDMzYzRUtLRnp6VXpZS2dxVGlYbGlBMCtVa1J2bUhVQm40UEpnWHpxTDdB?=
 =?utf-8?B?K3lQZXlsZ0h2NzR1cG5EbDFBZ2RrUkhyTS9UWjJKUjZVdURYRlZ4R2crOGo3?=
 =?utf-8?B?dnhvblpLS0Iva00rMGNPOUNweEtnc05QZ2NUK05XVGgvbW9PZzlWbWl2R3hN?=
 =?utf-8?B?a1dnVlNWNFRMWHFyaEpONXFBazdhVEJHSXAvMzNiSHBvQXA4SU55R0JkQVkv?=
 =?utf-8?B?NkMybUd6dHpMcGJGV29CdEIzZXAvY3F4cHU1Y29CSGV4VXYwUStyYlhSL1hJ?=
 =?utf-8?B?TWNqanJjM0RDaWlNaTNjK01OZFpKaUEzRGVVdlFoL2svRjFpaVhwQ0s3SjZ2?=
 =?utf-8?B?dFlzTnFjUFNMVWIyYzAzczFmakdTa3d5blBCNmFTQ0IzRnVxWk1HMlVOK3NN?=
 =?utf-8?B?cUlRd01HS3VlbFZyYi96T1dLTFY1blU4RzdXR0FQM0M2elBwcVhSNnRMNjMx?=
 =?utf-8?B?bzNPS0NDS3pQdngvZjJLaFFpbzdMUVprVEd0eW5kYzNRZDdhY1NIZk1wM3h2?=
 =?utf-8?B?N1F4R0hQNVRMWlZGQ1lxSjVRSHlneXlocmVuWVJHWFB6RUozSU5jOUdYL3pN?=
 =?utf-8?B?b085cUp2MWtzd213SDBpdWR4WnlET2wxcGVBZnZiaGFndG8zN1l4bTRjZWNQ?=
 =?utf-8?B?WWNlWExGQSsrQ0RQc0Vtb3pSYnI5Y05sNFRwb2RuV1ViRlMxaDNIeHk0WWJU?=
 =?utf-8?B?YWJMTExRaU10R0FaOGNnS0NVL2FKSTJwdkdZUEJkQ3AyNFB3bkZUcHZwaUhN?=
 =?utf-8?B?Nlk0bERYYU9GNnhKaU5NWlhySmZEenVubjN6aWpRVnA2TnRwdzlNVTBXMnpF?=
 =?utf-8?B?dlZwOEhESDVGT2cvWmFORmFsU0ZKeVJlL2w2UFdjdlY2bVVhaTNFcDdpaEls?=
 =?utf-8?B?VFJUN1Jldm5lYkQ1amxPZVJ2ZzZvb3JUNEZ6c05CSHNIQWl2UEF0eXNkdEts?=
 =?utf-8?B?amQybFlqTmlrWDJ4dXg2bjJIbHpDZnRpbUFlU0ZJcitnZnY2QnBzWS95dUty?=
 =?utf-8?B?MW4yL2ZtZWc1Mlg1VU5MTjBiNmQ2VFd5QTVuNnJsVTJ4M3pQc0ZpcWUzQW1C?=
 =?utf-8?B?RW1FbHF4Qk5tTkFFczJOWGFJcHUvbzMrblZldnhVdGVIOXVHM2xqNWc5VVNs?=
 =?utf-8?B?OUJFY1N0bnh2T3NkOHJmaGlVNi92VVg5ei91a1BSSFg4N05ldDFMelVVV0lP?=
 =?utf-8?B?N1k1TmloejlMMnlCcFZnUmQ1RzBqckQ5YmhJbThucDZRSDlaRExIeHZhV1NC?=
 =?utf-8?B?TCtqMmIvU0VSRUVLc0l6clM3cUNQdGhuQnJKMWtVbnlvSWpJc29icVFQaFUy?=
 =?utf-8?B?Vm5mM1ZHVng4VDFKblQrU09BNFQyTFgzeUM1dXhYVVhvQTF2VklKUUtOL2Js?=
 =?utf-8?B?QWdubkxBcUVXTWZ6cGZjNy8wMkdDQ21VTXJrZ2diNDk4SFZJM0U0REVuSXFZ?=
 =?utf-8?B?UmJJcHdZWHdiY0RsTFh1ZEhVSGx4VUdRV0VLSlhBRVF4d2c1K2dxRmhldUFO?=
 =?utf-8?B?bGduNHBKMEdEV1JXazNIOW12WnppY1d2Umw1QXdxOXg3RUcyeVRxU1RySmM5?=
 =?utf-8?B?amFmdjJ4bStlMVIvV1ZyQWRuRFNzVGw5Z1lhOWVYTHpUR01LTlZteGdoVlp5?=
 =?utf-8?B?UEVLeVFWbkViY3dpNWFyckthdjVLZGhoS2JVcGd5bDVTaDRQZ2J4SkJ1ZUc5?=
 =?utf-8?B?NGRZZXlqZlJSRStiN3FSZS9wYjBrZkRIUTJtbitJa0lPOXNhNG1xN2o2RDBu?=
 =?utf-8?B?UnJHQ2s5MkpYVXcwYjlOazVRY2daT2o2UFV0M2hHWFFBTnI1RnZFNjkvSHRW?=
 =?utf-8?B?K3d1NVVWaUdJem5zZVUzSmlXRFY1TW1Hbmx2MHl6SkVXQTd0YVVtTXFGZ3l1?=
 =?utf-8?B?ZEFYdHA4WTROeWxXVitIUjlOcW82VktFU2Y5cWhJUjZsajVhODdTUE9BRlM1?=
 =?utf-8?B?NVprVFhJRm5KYmFRLys5bGpDT0J1eXdvLzBSY3U0SGUwRThHTnpRRUVxemk0?=
 =?utf-8?B?Z1k4bitwSlFxVUxYYnJtQjBRaHRValVleFlsVzRReThwR3ptQkNOU2RvS2h6?=
 =?utf-8?B?RXdCMXp3K2ZobW0vTHFvZkxmVnkxUFhIbVVrVEQvMnZqOHR4b2t0Zz09?=
X-Exchange-RoutingPolicyChecked: vlt+3aMqFgstkOxz8pwzFkO1W9X8orBtFxyA1cF6Xo5Z0Sslz/1uQMdjz6QAC5GKAqMZ4fa1n5322ZLC7CV0cP+OHdwlTV2PD8u5v8CBUu7gI2V9u+QZ2iYZQ7/vPbp3p1WtF/zfjBVQlRrhsUfA7qJDg0dK+NXzQ6eAc3LMs5cvhaYvuioaYqIbnUyfRCFM8g08HB6TWoA9HDkATIj1MlgNZA57CBxJowN32vHVV2BwwOAEAtK3U5XDtvHdjjczVrXNeay1zoQD4lERoiPIw+6cbqHD0n8e9QEgHpHxGm9ILUd17tyWrJPMhobpe8jlCmNzpqBFOqhAybeS5FY1WQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: de0727cc-02e6-492c-0176-08df09746368
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:32:40.1923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOapLg6Z5LMj/voL2HtRTnyGJAr+kI4ipjwWPig0aIIhmfzVFpyhWUKKK1iABc9S/GUArhichsZeloTUZFk28Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5976
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

--------------L94XpbEsz0JfpfaST0JbDgiI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 02-09-2026 18:21, Michal Wajdeczko wrote:
>
> On 9/1/2026 8:30 AM, Arvind Yadav wrote:
>> Route the GT reset failure log through the structured SIGID logging helper.
>>
>> Failure to complete the full graphics reset means GT reset did not finish
>> as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
>> the reset errno value to the helper.
>>
>> Also update the message to describe the actual failure. The driver does not
>> clear GRDOM_FULL directly. the reset should complete and clear it within
> The reset ...


Noted,

>
>> the timeout.
>>
>> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Suggested-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>> ---
>> v6:
>>   - Corrected the GT reset timeout in the log message to 5 ms.
>>     (sashiko)
>>
>> v5:
>>   - Kept this patch limited to the GT reset failure path. (Michal)
>>   - Improved the GRDOM_FULL failure message to describe that full graphics
>>     reset did not complete. (Michal)
>>
>>   drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 6805e0d3bf21..d72c7ec9a956 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -824,8 +824,8 @@ static int do_gt_reset(struct xe_gt *gt)
>>   	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>>   	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>>   	if (err)
>> -		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
>> -			  ERR_PTR(err));
>> +		xe_log_err(gt, GT, err,
>> +			   "full graphics reset not completed in 5 ms\n");
> hardcoding timeout value in the message seems wrong, to make it properly:
>
> #define GRDOM_RESET_TIMEOUT_MS	5			/* 5 ms */
> or
> #define GRDOM_RESET_TIMEOUT_US	(5 * USEC_PER_MSEC)	/* 5 ms */
>
> then
> 	xe_mmio_wait32(... GRDOM_RESET_TIMEOUT_MS * USEC_PER_MSEC, ...)
> or
> 	xe_mmio_wait32(... GRDOM_RESET_TIMEOUT_US, ...)
>
> and
> 	xe_log(... in %u ms\n", GRDOM_RESET_TIMEOUT_MS);
> or
> 	xe_log(... in %u ms\n", GRDOM_RESET_TIMEOUT_US / USEC_PER_MSEC);
>>   

Agreed, I will add |GRDOM_RESET_TIMEOUT_MS.|

|Thanks,
~Arvind|

>>   	xe_gsc_wa_14015076503(gt, false);
>>   
--------------L94XpbEsz0JfpfaST0JbDgiI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02-09-2026 18:21, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f1d01885-1a97-4b5b-ac17-b53ad3541ca5@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 9/1/2026 8:30 AM, Arvind Yadav wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Route the GT reset failure log through the structured SIGID logging helper.

Failure to complete the full graphics reset means GT reset did not finish
as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
the reset errno value to the helper.

Also update the message to describe the actual failure. The driver does not
clear GRDOM_FULL directly. the reset should complete and clear it within
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The reset ...</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Noted,</p>
    <blockquote type="cite" cite="mid:f1d01885-1a97-4b5b-ac17-b53ad3541ca5@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">the timeout.

Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Suggested-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
---
v6:
 - Corrected the GT reset timeout in the log message to 5 ms.
   (sashiko)

v5:
 - Kept this patch limited to the GT reset failure path. (Michal)
 - Improved the GRDOM_FULL failure message to describe that full graphics
   reset did not complete. (Michal)

 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6805e0d3bf21..d72c7ec9a956 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -824,8 +824,8 @@ static int do_gt_reset(struct xe_gt *gt)
 	xe_mmio_write32(&amp;gt-&gt;mmio, GDRST, GRDOM_FULL);
 	err = xe_mmio_wait32(&amp;gt-&gt;mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
-		xe_gt_err(gt, &quot;failed to clear GRDOM_FULL (%pe)\n&quot;,
-			  ERR_PTR(err));
+		xe_log_err(gt, GT, err,
+			   &quot;full graphics reset not completed in 5 ms\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
hardcoding timeout value in the message seems wrong, to make it properly:

#define GRDOM_RESET_TIMEOUT_MS	5			/* 5 ms */
or
#define GRDOM_RESET_TIMEOUT_US	(5 * USEC_PER_MSEC)	/* 5 ms */

then
	xe_mmio_wait32(... GRDOM_RESET_TIMEOUT_MS * USEC_PER_MSEC, ...)
or
	xe_mmio_wait32(... GRDOM_RESET_TIMEOUT_US, ...)

and
	xe_log(... in %u ms\n&quot;, GRDOM_RESET_TIMEOUT_MS);
or
	xe_log(... in %u ms\n&quot;, GRDOM_RESET_TIMEOUT_US / USEC_PER_MSEC);
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> </pre>
      </blockquote>
    </blockquote>
    <p>Agreed,&nbsp;<span>I will add&nbsp;</span><code dir="ltr">GRDOM_RESET_TIMEOUT_MS.</code></p>
    <p><code dir="ltr">Thanks,<br>
        ~Arvind</code></p>
    <blockquote type="cite" cite="mid:f1d01885-1a97-4b5b-ac17-b53ad3541ca5@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
 	xe_gsc_wa_14015076503(gt, false);
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------L94XpbEsz0JfpfaST0JbDgiI--
