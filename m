Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6408BC55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 08:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2A10E4B2;
	Mon,  3 Aug 2026 08:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPpYdD3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7649710E4E6
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785745531; x=1817281531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O2FqJOdC0ekHQfuRVIaFkd6Im3tM38Yby3gv8DRiTBs=;
 b=QPpYdD3f7xggY0+Qn0uTY1lCYxY+bsYv6hrFQKSFdgj6AwV8YeJBxpI4
 x//PMI6P+IbkEYRJzWTFsuqg2XXNzI++16DruEq1cg31ysiFhMYU+usni
 5ZPCGypaMeTurw4WIdQpxKN060pEBXNZMjFJa+BfyKxq/9o1OsV95VQ3A
 lZj1hucjVew7MjAo9ucLrjvcqq7/TQn9ODwrELttRVO3m8NGu7zXprBYn
 f7GnpyMKDyGmYl1NnPMN97HWVa4f2I2T32MBO4Cos2paH19vVt+G7+GK0
 Igc9rYgh1BTqvjtRUq+xMwcr6LFheN9b5rV9R6piEEryqi7zR2tzl806w Q==;
X-CSE-ConnectionGUID: +0f9dHcBQQSyZUZGS9d+kw==
X-CSE-MsgGUID: 1vAODDrGQCKDfLU9Eie/3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85251453"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="85251453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:25:30 -0700
X-CSE-ConnectionGUID: hkAndgy9QCeEbIlfLYc13Q==
X-CSE-MsgGUID: BaKT0P+GSJe1/hxKQ6GVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="284546149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:25:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:25:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 01:25:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:24:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fcxcq6KGyrnDPyCD4GaLzGVrDY5gk71+ffpI4gAZmPD/7kHppJSHog5RnYn60UO00Bahe7Ek13RpDCiWXYitRZmDAW74LUpMC+TEWx/9LX3+89Iu6yhk0NtCwdXdVRmK97d+P2z/Y28kONHYSBNd0ImwXCmRmCGl4BXv1DASmUH3Jp9eKiFYGB2DWO0KcIkfUyGOBqKaa9oN3rvoOQatRhA7vwbGd3eB0Ei2dAEdAfpdBGtDDw1/3Xnsoa6dRwmSDEkKOb/cj2Zj/TZHUli1lcHqBHbB+QnYS7xcwixa5ovDW5k1wnlY142embUsJzaih04vRlNdQB3UBOYi9kaAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpmEGFgWpWQb5PwT/hPWz2nJxo0PMK73dzZjIGYEbZE=;
 b=tU3x1/HXctIWVXgEl5hom6HuHQRB+GRfxgjJ1qGPfJyK2OBbuSTdfLYYOyogM1OQLaRqUiPHGqtrOBfapOITGQVmorWD8CoZ9kGUxXDR24u+ufM4eZWW/kK2IaEdIAP4HIo+RXEhdeoJX+5+GON9TQp+vyayWReyBf1ft+WaN0qoiol0jSfUQlgtBd4hZNMbyOkt+vmQG1fC8PmLE8q7YzXsgD7WbkqmOffWMdoOySLqvJgnddAKk6dOjTWQzDfs2csJbiHtZjnuxjYDWX6cEApVHg4Whbf+Kz06Su1QfyZ6uQtK9N0VQ7nSFX3uCosPF7L+PvPWXC3QmbolijzhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Mon, 3 Aug
 2026 08:24:01 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 08:24:01 +0000
Message-ID: <8c5bf3fe-8a12-4fcf-bbfc-7ab2e67d426e@intel.com>
Date: Mon, 3 Aug 2026 13:53:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] drm/xe/log: Add SIGID log helpers for severity
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-6-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3f2ea4-beab-4bcc-fd64-08def138924d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4uY0GITzbF7LqrwPIDzaziGFIXBbFOlSo6a36MR9oD/JkUg+/bnf+EAWbf+2rE90mNDtDrTG42+kh9NXG9b6gwR/20CTo3ympMsxQiGa4OrGKRIspiJeP0DKu2/rEPFh6MnX0IwX6c1w/YYsONGnIkaDGMmP5oVlJUfuq0uTVWgXBGoqVoDn7cDYorHCz986A4RCQTMwSKgoqmLf6R89wyvP+WeShTPOREgswCpwlX4Zuewj1fo4PpwOE386ldzweaU0620y1L8oM22mgLrXQWHC1LwTk7ou7ZeOiLuK8aTsg0csToyqQL2mRXmhtVnJ6ovI2pp/tA302LPtOsWF11MI/Yk5tZPMJsMbv85QS8t9+6LYjdA7sMY5WgIYvSmOCqz/4xk0dNIftYKFo2zUj4t+S2qSQCBQ0PiaoaesZ0SqwxEQc4cpiDlpfSv+ZWIku+G5WQnz2IqmEMHUbH+24kS02NQWGVhr3MIJSkr0EkEP9nCocrtAd0p6fikdhLQadpD1F6uEJWnFVy9HWaErqP0Rj+ECwG4GgaQAEXSLKScbACF8wuVtrcQMS/T7yNlFpZH6Nhjy9OYB0NYLxAq6pLPRA1We/80rlFatQNkq79BggLSxX89xnQp63zY+7C/QqJOZbodylgufrC1zG0ZA5Txk8p/P0/oUKLRCeoEIV/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cml2dGlzY2c0ZDRkOFl5OXdZRjBsTndYcGN3SVhtcjVydFl6MTF4NUtiUk9o?=
 =?utf-8?B?aUdpUFdMQVhqQzY0a3gxVjRFdUNBbEM4NzllVERGYVAwajhqMEkvQmZlUEp2?=
 =?utf-8?B?Y0hKeFVyMXhoZGEwcFV1WnBKM2JIeUc1QVRDQzVlKzdQTU9SMysxQmc0T1BJ?=
 =?utf-8?B?Qkl4SnYxV3VoSU5qcjZrZEJ5RERnd1FwN0xEYXdhWFFUdC9qSzlTMURVeUZn?=
 =?utf-8?B?Y0tjUFNNNkR2cTAvOUkzUUtuTXViSDI1ZlFGYWxBMmNldjJqSnM2OXpxQXlO?=
 =?utf-8?B?VEJqZ2pvN0VGTE4zQzVXYkl3QlFrWWFER0JTa1YwaENkckxuZEdjMEw1RGJZ?=
 =?utf-8?B?R1hlbTlwdXRydkp2cUNKdUdwbTRSNW1ISmtOYURJazd0TTYwUUlPRDcxdGdk?=
 =?utf-8?B?UnMzZFM4K2FOTG93MVVhbUYxckR3dWhYQUtZV0hNY1VXU3JmNEhEVlN1Sk5D?=
 =?utf-8?B?UEJqY2JVWmtzU1FLb2JPZ0p3azJnTklPUTR4ZCtRVlhjQlNiVUxxcDlPZmN2?=
 =?utf-8?B?d1lyMVhGVDZIMXg0akdNMWJySGt1S1JXeXVBemsrSUNnOWovL2F3VnM1Sjls?=
 =?utf-8?B?bWJqaFNhZmpxWUJUZ1JvcnBTcFpWQjYzMHptcVR0Q2NsWmxGOHQ4ZGlJR3VV?=
 =?utf-8?B?bWdrc05sYTVYU0xNVThhdjh0SERrRUVCc2xkRHJwQUlsVXpRQU01NHcrZlQ1?=
 =?utf-8?B?bjJIUEs0ZXd6WU9xMVJUNVV6ejl1byt4QWVsOVNLOUNpOVBpYTZxLzI0RnNz?=
 =?utf-8?B?d0gyT0JDZjlPd0NXcGRTZjNkdTIxTlU2cXRSOWIxWU4xVjlJWGZiZjVBTUxK?=
 =?utf-8?B?bWFFeDdXR1N0T2FQRHEwRGlpWDBSWGJxeEpQbEdQN2tSNS9uMUZRRUw4Ym85?=
 =?utf-8?B?QnRGZTlmREtZcWZSczk0YTlhdk9Vc2dBeVFpUEJWbVd0NzNMM1gyZHNzemlH?=
 =?utf-8?B?dGdoWk90dzdNZjVLUFVhYTA1ODVQeVlnUUoreGZwUzFCSTRjd00wb2FGS3NG?=
 =?utf-8?B?ZTA1RjNQYzllVDRSd0wvNGFubkN6d0g3YXozM0loNUhlMjJ0NXBhWkZURElx?=
 =?utf-8?B?YmRuRWZZekkwTzdtSHpQSVBQM3ZTMm5uQ2VSdmlXY3dBcXN0bHhqQ1R1WGVl?=
 =?utf-8?B?cWFxRGRKZmpwL002aXBpTjFxK0ZaSHQrdXVqTHd3ZWZiV082R292K3ZCK01y?=
 =?utf-8?B?VG1XT0JQMzhEQWgvc1VDMU5RVWF6TzRQbzdmeVpSNkdsVHRPbGlqWCtVeGJu?=
 =?utf-8?B?cnBZWlpXNzdLWW42S0VyUmFXVHhrYjRJT09xQXEwSVNYVEJYNjk0UWVpY1Np?=
 =?utf-8?B?TG9MTVBjUVZEVWZKOWRLcTJuaFluN2pPN05zbDZMalQ0cDFWYXZJOHQ5alBp?=
 =?utf-8?B?L1dyVkJ1eTBJZm5MTHBEbzN6Qjg3QjB3dVFMdTVhVDFzR05FVHozQlJOV0xD?=
 =?utf-8?B?US9VV1dibWhseG14WHBpZVdTdGJQcVlQK3RTTFNhdWl6YXBrb3NXWEZMaUMy?=
 =?utf-8?B?OCs2UFhSemhOUUJIL1pnZnFsNkRURnMxM291TGxscWhqdHhMU0wyU05mcGhC?=
 =?utf-8?B?NHVzbUVaWXdtNDhRMlgwNXBZL0hnUEtlK2lmcWtuUHF5NmlvMXYxTE1ZWm1s?=
 =?utf-8?B?eWJoNTIrZHVXMUMrQUNWOHYzL2Fnc0ZjN00yUzFXeXBCeWdjZGYrdmpzQXZn?=
 =?utf-8?B?WndoTE8vL1RxaWNncVBmbDZjNE83Y3RhMzZzRlBRTzhHM3hTT01hVUpuUHZV?=
 =?utf-8?B?aHFYcFhaaDQ2VW83TmNjRzVCNHVibjJsVGpWeFF0VFJhOFVGbmJRM3FJcjFw?=
 =?utf-8?B?Nk9FVHVidDhzVjhadEVtNjZiWFFxL3NuUEF6ZWpDQ0RKN2llZDV4M29hQ0JW?=
 =?utf-8?B?RWxnUE5DRXBuTlc1ZTR2bmUzc0hIUENpNkd3YUpmWTVqYm9BWUdHeTBLZkM1?=
 =?utf-8?B?WWZLcWtkR0pKQXBxeHJEQ3BLUW9sSmhOajdtOWRPVVRXQWlVZmFTQ0lXMkgr?=
 =?utf-8?B?N2l3dGxMdXp3QnZRVTJPZWdIam05ejI5Rkc5N2xNakFxdVJGMytoNjJyODMx?=
 =?utf-8?B?eG5ZcUs1clhwVkcwcGxFaGIrMGkrc1QzVnRnb2FHeFl1bER3elp0VHZ4YU5h?=
 =?utf-8?B?UkdHZy9NQy9OaDBrTlkrdUVmbFI1TTVCcWN6R1AxMXVvTVlZaVlVTUNSV1o3?=
 =?utf-8?B?SDlscVhqMzRXRy9UZUVmazBJellpRXh0ckpXc0krdlBFampOeVFoZm1uKzdF?=
 =?utf-8?B?aXVUUjYwWFE5TENXWFNPbDdNVjdoQTdOcTNZM3B1UDV5cFpSTEVMVXk0NmNv?=
 =?utf-8?B?Ny83NnVEMit5c0g0L0owejV4N0wzUTVSUUJFK3BVUU13SlUySXRsZ2IwVkJO?=
 =?utf-8?Q?gYPGybgAuAh1ltL4=3D?=
X-Exchange-RoutingPolicyChecked: mhEyenPHN81CuEQvb1Fj0JB0sjksQP23+V0I6g7gAG0YHDSovDpzavzi3IMQrZ1DGUCzOMzT7smCEI8CnmUfTxjMP9zhxLhDYp2aDdQ41capcGmUUnMcX9v4JZRDiEIgDt66pwmVtRmOvvte7S5LfdPPc9boHr4dw8KWMGBAibI/8qIg8b5E0KYNVl/L04ZwiO0ODaecq5TK6TXd4lf27L62ahWQnHh1nj/qSv+E1/zPOOnT/tLJj7aG3G+/NyXZ9nX9mD0zxezoDrEx152L1o6AMwP8RxQP+xYde1XESd7nBXdGhnKc8HIkKj+e3WpsMNb3Dz/md3phVEiZdvREPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3f2ea4-beab-4bcc-fd64-08def138924d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:24:00.9772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5mirXzdxA/3vaDVDh73e2+5/l8IEcZQZ56Kge3+J0Ozndu1pU3PXE9s9xF/xrmZG+mup37BVhiZetHMwwVpdaE+YechzmEvQI8q/hTFhoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> There are only few CPER severity levels defined, add simple helper
> for each of them, to avoid forcing developers to write full severity
> name in every function call.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: drop support for any_to_pdev (Michal)
> ---
>   drivers/gpu/drm/xe/xe_log.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index d475e816ee0b..73daf37d6463 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -17,4 +17,20 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   		 u32 component, u32 location, const void *data, size_t len,
>   		 const char *fmt, ...);
>   
> +#define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
> +	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
> +		    (data), (len), fmt, ##args)
> +
> +#define xe_log_emit_recoverable(pdev, sig, comp, loc, data, len, fmt, args...) \
> +	xe_log_emit((pdev), CPER_SEV_RECOVERABLE, (sig), (comp), (loc), \
> +		    (data), (len), fmt, ##args)
> +
> +#define xe_log_emit_corrected(pdev, sig, comp, loc, data, len, fmt, args...) \
> +	xe_log_emit((pdev), CPER_SEV_CORRECTED, (sig), (comp), (loc), \
> +		    (data), (len), fmt, ##args)
> +
> +#define xe_log_emit_info(pdev, sig, comp, loc, data, len, fmt, args...) \
> +	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
> +		    (data), (len), fmt, ##args)
> +
>   #endif
