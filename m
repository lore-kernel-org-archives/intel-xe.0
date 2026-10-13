Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0FACA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 04:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225D010F464;
	Tue, 13 Oct 2026 04:53:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977610E733
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 04:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791867195; x=1823403195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5nLFjhopi3Mx3KisnOqI17OIYQQ17y8EPoBioji93Qs=;
 b=Cog+d228PQv1gPoB9ybAoDH8+IHksfc8V5mvgJu+gkwbihuVp7o+EVbx
 /evbfO5SgL+nCPnAPtjIUBwgSAz8lIInbzWx8fCwC76f1LRVW+k0vP0mN
 lDBk35VQKfiHbrOFfcsUhvX4Ov1uvWI50Q13IcR2AmzjP6+w4fkbm3XFe
 +0Jr8S1mkixB1IGa0ZH5oHc0R8+EobPf2OECZPEyrjKtw6hc9OLBzXbUK
 AngsPp+UADgmy9yKIjIddLwIS2+Hfuaywz/Eiu0cq01teakL/RBF4IXdX
 ELCaOHv9V2MZk4iYo0upZF6C/ck5wtftduEU/q50N4ZgCiSiS8/Q2DpbX Q==;
X-CSE-ConnectionGUID: Hy/akBU6SvKJ6AjXV+xXIQ==
X-CSE-MsgGUID: 7sLYqpU4QIumC1F3SkbowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="586774"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="586774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:53:15 -0700
X-CSE-ConnectionGUID: TSyiHgKcRJ23p38FaGtWDg==
X-CSE-MsgGUID: ARZk1Ro/QfGQQ/pznQWz5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1430629"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:53:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:53:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 21:53:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXHth1o2g2bZ+du9q4HBwYBqfI0dOWHoYDuTz6aFZEIP+qp9Ucnv1J9b0xY9yQstWy8F83xt/InZLLtBPu134SIh66cXJYBRDIpl0a12k7BSTFVxDbACNesXcqNlyEUWboMnhtHHk61X+xZD16GnS+CIe4I4jiSOvEAi6Rbh4lfz3IZwgZFgbmO9XI2UV2473v8g0GHwKGBBoRi9zEP1iux5KCzFeTlVcdX1ZYY51HT6KKTdQwjXyXWriTKYeeExIt5kDY5YLQtuA2cVVCjOcBozTYywIajh17zaZ4T8E9N2A4aJoHP68zqeaZkeq4gjrx24m/A38/7zMVh7rjimjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXme6JjU/bl6oe+fPvg/czAamjlKPmShKNhTgMB7G/Y=;
 b=tmNryC0YOfbYxs8Cje9ZYNF+lkZYQTIB0Rft+tU2wpP3DYZ97jMmlhgcnKxfn03jXIdT+yRO6DFyv4ojib5qz/GZgAw1ibL/it7vtoDX/J8J528OXXc4qMUHwaCnL2mbLd+ygLptwJohHgjL1u5II+KW240NQM6wFbyUbS9grtGko5nVGGBc9lGGlYmCcNBF0dznLrU8cCgOEDLPZTDNjbwTDKTZ3gdUOeYQDcvcllFURbyQoCDzWasZ8OfZ7XtTep1nuH43Jq+0AAx/gd4zR3JxNovrfYeZrzeRfeRf/XvGTrPFDhUQzDRTrD/SssRWRKC9MOhrW6s6pjWVcsslyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 04:53:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Tue, 13 Oct 2026
 04:53:06 +0000
Message-ID: <cec2dc54-14e0-48b7-b0e9-54c410226f82@intel.com>
Date: Tue, 13 Oct 2026 10:22:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
To: Varun Gupta <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20261013033430.1885990-2-varun.gupta@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261013033430.1885990-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5e6fd4-daba-46cb-ea9f-08df28e5de52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|56012099006|22082099003|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 4yidc++FdEgU8LRNW9uGCaae6EJ/MQhSA+2vPoRO5gSZ+MU9lQ62GuoZxTNXynYLrQlV19ZB+MnyKMmRfqoIcyWlm4Y653CvnG5WXtXRIs2nGp3DHHOSMHTGGbkhm4plO3TbRXTzKrbFfKQzEXgy1MiCP/YmGu2O8KdkDbrADqloZrJOqb+/d7bgU2cWeBmgTIB+1YzIXty2hDjfGNQJYtdJxEkKDnXIpjzNOcJCHTxAa9bYye4zpB0628ix4Xk3KVUKzPZg8ByT9DWeA8VoBQznMoSvMabhGrsptrA7XMosX0V5x4SSxOA9Hnqm6sByzFZHd3MUJzfhxHxI4tk/AdogTYwf4sOzdDjZ68wpuZMPrwb3XFaZPphlC071CWYwtksxvWJnF7gG+UoMbRygmPADuB0jeFm6gvXUH52dA/I4rAUDWojJZE8IBa5UMek1PNxpTBuEsMtDreQkczrXzrQHC58n7ErSIYQPTgl1W1HWd40rbO8rHTqP6EarHEFkwcdVPurPF4U3nWX7RDvzowngMMUPa4OCruRABA2aAHK4r+ITWk3IFVXNtB4VK+DUjp0BlMAWWCrvst98LPMMpIemi+V/XQea4wpTwGQtnUoMVO049JStcJgSxCipU2QlNBPHiUZzfcBEgm6urdFJrcMM05TL/6PY3U2LRU4tvZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGE4YnNEWTlNVFlPSDNsdlBGZnB6c2h4WE5WS0V1RzZGYkJ2ODhGZm1FVTZ3?=
 =?utf-8?B?bGszeUNhb3hwVnBoMG5HN1A5UmxJZ3VLMjhTakVwRzAvRDkyYkhGeVROZ0lG?=
 =?utf-8?B?YytWeGdrcTJrVHpmZkVOQWhxNGtnM1Y4QlU1SEg5a2NVUHgxN2dBN21tN1Mw?=
 =?utf-8?B?dzBKN2xMaTRsY3o4Sm5OOTZFRE0xMkxsanpySnhxRlpDR2pDOXhHays5UGdl?=
 =?utf-8?B?MVpnNitmZDEwVnJRenZELzA3VHI0a0lsdTViNDM5dTFkVHUwaVlJUUlNZzNk?=
 =?utf-8?B?ZTVSU1FnNWN5S2pORUEyVVBsT0lyODRla05rTkVaOWZCVUswd2ErdDdsOCtl?=
 =?utf-8?B?a2h1aVNzeTJ0M2RtM25zRGRGSFU5WGpFYXVVczRxQkxIRGNuUUE3RXZ1SGVE?=
 =?utf-8?B?Q3V6VVEvL1FyMi9sN2Nqd2hybWhxT2JFcGlXTk5UZkZhMWFOZmdQVmpHVGJk?=
 =?utf-8?B?QmFISGdpVmRIQjVLdkE5YW8yTXJiMDhoL1ppOUFtdVRFcWRxV1hJRHlJZ0Nq?=
 =?utf-8?B?bGsrWFRrT1N1STVKRXd4S3JuVFhsaVVBSXAzaEtRRmhYblJQQzAyeXJKWWpu?=
 =?utf-8?B?SkVvWGJqWmprSlkwQldsL3ozQXcyemZUSjBYWTZTZm8wZXFLR1R4Q3JFZ1Fa?=
 =?utf-8?B?SWNNeG14cFpackEyYkUxUWxKcldUWkpNUjJ1Q3JvaCt1WmNYRm9PS1ZZT29q?=
 =?utf-8?B?TS9rVHRoaGdwd0I0WE1VNHJ4UG5PZjVZSmdabllOMzRWdURnc2kwbng4U0VZ?=
 =?utf-8?B?RXFNeHpiYTc3cHcwVzgyMU5zTzNPTEUvc1doMDdWZFI0b0xmdlFkL21QeklU?=
 =?utf-8?B?R2FMZXZPWUgzZDB6T2RPNlFRWC9jQmRjUitVdnlQdE1aRVhzRDdZczVrSWpN?=
 =?utf-8?B?Q0N0dXZIRmpjczV5WnBSdHcwZG11WnB0Rm5PQWpKcXdvV0FidGkyVHRnK21j?=
 =?utf-8?B?QzhGZWFqT0g5c2NEWjNzY0pDaWdKaS9HY3pWRERyWXFuczJHVk5uQ3U0aFp1?=
 =?utf-8?B?ckpycFRNNG9yTHp1TXhySVJDUWRXR3hZOWEwUHd3M3BISGFhQzlDTFg0SmUr?=
 =?utf-8?B?U2ROWUI3QW1yMHpyUDgzdEtwYnhmUU9JOU9Laml2bVJEb2xYWDVUZTNwQU10?=
 =?utf-8?B?R2ZIVHUzRFIzRHNvSUs0TDF3ZE1aYUp0alpZSVcxNkp3Z2wxL2xIdTFjbTZn?=
 =?utf-8?B?YTZBSXBzcnMydEJJSDY5TUdIWGtLNlZaVHRtMVd2SHprZ08zZFdRQ1ZMM0xo?=
 =?utf-8?B?dmV3eWNzdlNJaWtGYW1TK01mdytNNE1MbGRvcXVoT1dkQnA4T3BOdEQzUFVJ?=
 =?utf-8?B?SWEzNkQ2dURHV3lXSSsrWlZIRml6ZTJSaUV3WXkyTnBEb3luWlk3TW1lWDY5?=
 =?utf-8?B?Yks5NzRNK3B3MjJOM0pQRk1qZThXbFhBaFpZOEVQUGRVWWVHeUE3aGxVaENv?=
 =?utf-8?B?Q1FDS1FvMHFXamRObnMyUk5UY25takNFb2NpRFlxUWlucUtEU1M3Y0Y2ZHlJ?=
 =?utf-8?B?U1RMR1I2QUVrTnl3a1FXZ3h6SXozUEVhMjllNTIwd1FtdGx0RldTRHkvaU02?=
 =?utf-8?B?TndGM3hHcjNwL0c2alJKdGhsREU5M0hBYnJjZGdvYjR5eGVCM0wrdEU0Wm1G?=
 =?utf-8?B?SkpkQ1JkNVJvWjczQ0lPOHlSM3FaSjFvd3ZrcE1QQXpWcHg2UllIVlR3WjF4?=
 =?utf-8?B?L3FhZk9nVDJYMy92Rk8yN1ZqRWROOCtEVGVQcDlyQzM4ME9zRXpPdllpMXI5?=
 =?utf-8?B?M2cyMXVyeTEwdjdSMnl5QXh1bmxxTUZvTmZzYnptdXR2Qkw3YXR0UFdRVG1H?=
 =?utf-8?B?d1ZqVWYxVmcxNzVvcXRxUTlnQlVTYU1LMVFWQi8wSklqekl2SS90dWpFOXR3?=
 =?utf-8?B?d3hrVHlBMFRHZ3ljUFJIYnBIWkhXMDduUnJwZi9aMEl2WVkwd2hWV0gwK2Rt?=
 =?utf-8?B?bi9MakRLSGFNeEcxYUVRb2VoQzltTFh1MFRMems5TGdXSkh0SCtrQy9ReG10?=
 =?utf-8?B?OG4ydHJQYklsdWMrTTJ5Q0ZLMGtNcmJISG4zQ2p0bGxxSlNNL3NyTG43QVNO?=
 =?utf-8?B?VXdvZE8zRVQ5eGpOVk1qNXF3UjlGVlBQdFJXMG5VMytZUCs5Zi9JQzVIZmQz?=
 =?utf-8?B?WkE0V1lyay9OS3R3V1pVTVJFeFJ5Z0YvV0hLNlhjU3ZmWjhXa1g4Z2pQNG9M?=
 =?utf-8?B?ZThkNktwTnBHenhqcEVETXl0WnNDU3NKMCt2RDFpMzJnYzRXM2cwTjBIelRy?=
 =?utf-8?B?dDlDY0ZQVkRnWWhSemNqQld5YUZYTm82bEk5SkxWaGdsVEVYc003NGxWU3h4?=
 =?utf-8?B?SjY4ejRVUHJUaExOcDdVZ3MzM2ZIanNkSUNKUkVtck1DVHh4N2lTUT09?=
X-Exchange-RoutingPolicyChecked: MDvBFnRk0I053bV5G89hiJbCVowRXe7ftF6ROUWi1ow6fuzRovYAB5B80ymAJ5psrYeoblQKMCX/rqrqyCPia3g7SPToLBYQgnCeiYy3JyjcQ+ke+vLkeE/tOXXD9ORb51+wvOtTy/szIff2ZLEhqPIr7ImnNmbYo2Uhg5OgMkz/nJ5vAlk8At/A8+bnrdoxw0u4UPAsM45+EbVQdNynl2UJn131//7Ff+oOPdEg41o+qFs0xVvfWBxAJVJPy6x5taFdjfAkGuCRs8HD3e/OpigQXk6r5aCNLQPi7SCB4FAAXSwkx4UOzBgkc1JNTMT90ik1pKV/tZWte8S8cke4yA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5e6fd4-daba-46cb-ea9f-08df28e5de52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 04:53:06.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uW75/NSt2sIcpQmjmUaF40d0zxAvnKx1+ZT3YTdYS535U0iRziEZlB6KehHtN8Fz83ywTlvqu3Vbn+PpyX4nbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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


On 13-10-2026 09:04, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. On CRI, due to a hardware limitation, the platform cannot
> distinguish GT translation faults from true RAS conditions, meaning
> standard workloads routinely trigger this error.
>
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Demote the log level to INFO for CRI.
>
> v3:
>    - Limit the demotion to CRI and add comment explaining the HW limitation
>      (Rodrigo)
> v2:
>    - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>      (Himal)
>
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7ce73489c35f..dc5b6b98ffc2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	guc_id = msg[0];
>   
>   	if (guc_id == GUC_ID_UNKNOWN) {
> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>   		return 0;
>   	}
>   
> @@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	if (unlikely(!q))
>   		return -EPROTO;
>   
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	/*
> +	 * On CRI, the hardware cannot distinguish GT translation faults
> +	 * from true RAS conditions. Demote to info to avoid false-positive
> +	 * hardware error logs.
> +	 */
> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
> +		xe_gt_info(gt,
> +			   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);

Shouldn't you be using ci ignore dmesg in test rather than demote an 
error log?

Thanks
Riana

> +	else
> +		xe_gt_err(gt,
> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>   
>   	trace_xe_guc_uncorrectable_error(q);
>   
