Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377F6C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 14:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C4410F0AD;
	Thu, 27 Aug 2026 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5B8p/WL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592410F0AC
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787841295; x=1819377295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iP/gO4ZR0HPkfRMLn0cdhTo+FZYGDxOyNoywYQ9jQ+o=;
 b=E5B8p/WL5cXCbg+QbDlDAsTHnnIYL4WdYqzE0HxqOADYyUkh+4zgjJtY
 wnyMYEA5EvaFADGO8OYgHk5XneL196y3ScdX7NLeEk2m763uZnQsx/ZC0
 94vnHZo07BvL5dYE+c8Pk1lwj7PesL0KWhlUL+dVQo0OumsTBnbxrX334
 TKLH+mUDrslrdarPwx5eKMFHD2JIHkGKEjGIQ0++MZq5rP4akn9Cg7JX3
 L2z2QVlppoK9gfum8mPo5Vi4Z+qvwdxestaMNa/KDnbdSLgo7DwtD6J6+
 sB20GksbsXGOoh+wectR/bkjIsG2E1k+FGsHBHkeNDnu0COJvUg1+znTQ g==;
X-CSE-ConnectionGUID: E0iFfoN2RCGyW7CzdrMWlg==
X-CSE-MsgGUID: X/7D8oImRayZgp18Az2qcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="90850718"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="90850718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:34:26 -0700
X-CSE-ConnectionGUID: x1T7nldgT0CIedveFJbUNQ==
X-CSE-MsgGUID: kzwGoyQmRAy2Rqee6kWyKw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:34:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 07:34:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 07:34:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 07:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQXdWhGrIJnymAy2kylXHosXtSm9BdbuNCs3jeUKgpPMRqViuF8PH0lQPEgLl81KHPqpdEhBxuw0pKXkA1RonSz2voZkH/K7ipJj0f6pjHTNCIjFYjjSXfmoUtFeXZuMU88OFymzu974xz5ucqYMzXralMDukqyq8RmdOgsytIIhzOSo9QgaBcMBkUKQ14JS3QAy4u1ZpG+4kQtHwUh2JR4p/NEMVVRcVKVXon4Mbva8UblxW1WM5yNz78cs5yfpnNE7u29oJuasg6jjwgfdy05P7Ycvs8PiS2jTWVCN6OXtq2psfQ4hfo6MMgb40yVN2VutKy1rAyEyXJosjXhffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEo2uMYmuM9sYInDatwjL4QyVOtHm0ZwsAeoOQSTy7Q=;
 b=Q7Q2Xrxp9sCF8pmzuhk4tjFPtb+T0vFXwmeQyr8i7Ka82QejTMAcY3T4aBlxGEtoaZFXkTDKPagmZJ+7I/w3okV+pUn9Zf+VCnV66ma5XhhJ25I+OXF/lUgSq7R74noT27SFBPcSgctl1cq+DVEx7t2cVMrQUJBjAFjJGQzH5zBmjYY7dVuPSABm6sVfQqZtzFSpygd5uakTaNaTBHuAHgH2TeDq2BrBpnRXfnTtQD8ywvESaA2gPqjvRFaljBdlfWPs+8/Lm4V1kG9EzurWV+XbjgxfaKoRYhHmPuKdwZb++qO3oTuam2aouCFh+P945Vx9E3XEx/BYIWMLb9sqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 27 Aug
 2026 14:34:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:34:20 +0000
Message-ID: <c88d3c1e-4b46-41b4-be7d-829b12e2e18d@intel.com>
Date: Thu, 27 Aug 2026 16:34:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Alan Previn Teres Alexis
 <alan.previn.teres.alexis@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
 <20260827002801.837731-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260827002801.837731-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0155.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 00948a6a-761e-4e24-e3ae-08df04484817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|4143699003|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2Rfssx6woY2TscFo+Ui856W/XwBxSgXmoBCkb6x94U51Ktssptji4Exf6c/umcq8Uf9O9YRDqW6Xh5ZFZmXbNL3PRtxTniaaxUnwWvFOd4OINiQVlEtQHVJlbtx75PATbMk/a8Na1iENNo+slbXmqCmpvqxyhJZGUNAoxm+c+Bt5YRaphXiNXLS/+9zTl86hGaWrk48E3RoUZsqExC/rpKcP1k7gDe3L76J5jSy/hn+ywqNeAdO8NAg0zZyYJJKHr0sDtT3p6la/Vc0jW2JpPeb2KPG3rcP9fdxyGVDR30VzeokuYH13fJm3emq0XzKQsEC1Suw6RNizLqEbL56H2uEHsjCc72a/PZlDYl+Tiy+vchhcmvM7T4z6AdzDEQxAFcA9J7xAEnY0Dx3eJgzezw9AfnCDffDYYYXjjBRAXSrvk0znBqnWM2bHdo2nz41ZPzGSXoa7FDrTgP4K9Czt+rqT+ri9xKRL/WJFCwL9i0LdmIdX+sJQ3nrcsmAVjjJ+YFZ3xfEufYCaD88nxjkLmBkBLKQUdTHX+ZLjIgPVuStKZz39JQt/KBonzKg0sxwQgi04uY3yqaj9Z98w0BZS7ehMabBGEMQGNsK6uEq7suZJPoFBnbyEyX4TjiBKGjCkkkMDW2rh9F7KwLz4IZ7HAVdukfnOM6f8NcJd1fPE+XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdZeStXRVQ4dUgremNYZ2pjK1EyM21NSjlJanYzMGhMck9WbHJHZjN2YUtx?=
 =?utf-8?B?QzFodTd3eEFnN3FncEI0MVFGS1I0ZlRUdUkrM05lM003SjE4ZzJhWUl2YkNm?=
 =?utf-8?B?OGQ0b05LQVFxR2l2NzUxY0tMNDFDQm5nQmJqMy92bGRuRlVFN2ZRdUxqLzlZ?=
 =?utf-8?B?c0ZHMGptanoyOVV2Q2x5dFF2UEpocVlKSTZhb1dTeGJhZ0ZZeEttVDVoQThO?=
 =?utf-8?B?TitkL2kxcXhSTVVkaGh6b2hJTjFDLzFPcXREWHZxOVQvaUxwV1lSakNSTU8r?=
 =?utf-8?B?NEt2RHl6L3ErKzB2SFluZ1hZUmF6eEV3djBPbktXdUUvS2ZhM3NRVzBWMWhB?=
 =?utf-8?B?TXdDNGlzSDBHZnF4SjBsazNqVEp6ZkdNY0w3NkVUNVFBTk9FazVhbXIrdlhC?=
 =?utf-8?B?VEFOK0hUc0J0OEkxNktTU0xOb1RWNkgrZjdCZm5DeUZtNkdnRGhoWG5VUWxx?=
 =?utf-8?B?M1NEWFhXTi8vSGNuMUdCcjJ4cSs3VTJ0Wm1vSlRQNjZJTThhT1BHZVYvRkts?=
 =?utf-8?B?L0RBM3hWdnpqYUZVaEVwVW9RWVBSZnBtamVzczV1T3hxcGFOOUUvTU5wdzV6?=
 =?utf-8?B?VGw2REJKTXNXcEp6NHZPODI2NXdQdXF5SERUVHBSeEdLVDMxdDJlbDdXdzM4?=
 =?utf-8?B?aXNOVzNSeVhmUGhocUFCV2Z4VmhzZTRhcFZWVHYyWExiNHhLUnVQTTJ3RDY1?=
 =?utf-8?B?S2cvNXJJbUw4SUVoN0t1YTdpeGtMTW9tM3Q2NmVCQ1FUNHJ4S2RBMzE2aERY?=
 =?utf-8?B?cit0V0lmUU5MQm1BUDJzRysvUTVibDdLbjlSMFdZUENIazQ4M0tPamJ1Q1J4?=
 =?utf-8?B?a05vM2VzWjFLK0dvN2N3M042a1NHZ3RrTmV1VXYrZGtqUFZZcm5IZW85ZUdU?=
 =?utf-8?B?MXlVcG84dVZOcWVHMmQ3dGZHL3daOUZjYmtaZnNSa3U3T0JZZE4rcUpCSXdQ?=
 =?utf-8?B?UThyUDJUVG9uK2hiRVNFK2xHWHc1MlllZWlYVk1hb0lLMlVnS3d6LzBFekV0?=
 =?utf-8?B?ajRwV21zVHhqT3kwYW1Nc0JTYkttb2E4RGlXUndYMUFlM0ZwQWJCbGJpU1Nw?=
 =?utf-8?B?ckN6TFVNbEYwdWNFTXpwLzRuZWpjUDNOV2pOcHNlM2tyOW1jZ3BINjkrdXda?=
 =?utf-8?B?UXlndmpyVDQvRXVEdTU2cFJZSkpyeUxLbks3TEhhb29rakNTSXdIYkI1ODZU?=
 =?utf-8?B?T2ZjMkFPYkRNL0k4QUVJYlc3VU1mMmg0ZGNDYmhMRDZvUGZNc3ROWlBKSks1?=
 =?utf-8?B?eWZZUDB3YXBlNXdZTzd1SVpld1pObWVwZlcrK0ozeTZwVGw0c3Fxb1QrSlla?=
 =?utf-8?B?Zjk3Q09SSG01OFp2c1FKZURocW40UjdGSzZmNUQ4Q2VVNEFuME90aDQweDM1?=
 =?utf-8?B?bmlxRktxYnYwM21ZcmRGc0Z5TUEyUFRBSWZBMVJoOUJrR282UlhPWUxtQVNn?=
 =?utf-8?B?NkM3VC9YN0FwSTNkc3liTjhnQVBhVC9yMUUvUEp0clBHRmJmeGdseTBmQWEr?=
 =?utf-8?B?UG8wSnhuVHA0TnpneTBRS1FsN1VFSVBvWGMyb2o1VTB6bkcvK3FvR0xhQlRi?=
 =?utf-8?B?eXliZFpvNjFMOThHRVdjdEN3L0czeXozN1pNL3R6MWFRanV2UmljNW5pUVhI?=
 =?utf-8?B?VVEyOXpSTTkzYWJvVDFrbzdYWFFud290UTVaT1NOc3JpSkpIdWNvdlcvWFB3?=
 =?utf-8?B?emZvNTFodGNBWDErYXE0b2YwdmVKZVpKVUJOVTRmUUNzS1IrMGlPVjlHSnlD?=
 =?utf-8?B?ZnFFS2Z6aE92akJwYzZWZWY4UnE1ZUMyVjA5ZGhPMGxOSTg2OHBNeWdhMXMy?=
 =?utf-8?B?MTltaGlXclJuSW5wT1UwRHozNkVoNEJybllqUFRrdVdiZVJoTzY2Rk51eXpM?=
 =?utf-8?B?eitZSHh2NUZvVDcrZWpFbHg0VHcvSWQ3MzZDaUJlYVJRMUFFL1FBTEY1OUtD?=
 =?utf-8?B?SCswMHBGWnVUQXZZUlE4VnFaUmtFbTFFay9WMjVHUUtYOTlLWTUxUVVLeG1m?=
 =?utf-8?B?ZC9VUURjelEwSFdmS0dEZVN4YmR5RWwweW55MGg0N0lIUDNFZEtUSzdDK1B2?=
 =?utf-8?B?RFQrN1ZtUXY2U3BzeERXMTRuRDR3VUFEK0tCbmwvaG9SK3duNlVFTjlrV09I?=
 =?utf-8?B?K3Q3d3RNNHlPMHAxM1c5U0NUUzRuNWgvU1YwZnR2SDdIdjl0TVFNVCs1amZW?=
 =?utf-8?B?Q0VyZ3Buc2FRbzdmc2J6NVBWbkIvZ1Jvd2lSOTR6dVhJbU5zdWs4eHVNRjRj?=
 =?utf-8?B?clRwS1lEM0VJTU56d09oYVVOUmJKdGJlUzVoK0tvQUQyOFV1T2Y3UnluYlBT?=
 =?utf-8?B?YnQvTDhLV2REU3Jpd2plbmlZUVFrT1U2c3lyTUZta25SUnZROHZ0ZjdRUEhF?=
 =?utf-8?Q?4PVCPW8/McLagZAE=3D?=
X-Exchange-RoutingPolicyChecked: VywaPaW0crAj5+cJKCqmzcI4l+gJPxWQR4nogBC/OrezlkWpAtuUmNx+2hx2V+uPi3ptok1/Q0pfbu6LDFjbAs4jtYUT+KQt1QvQf3FU/dF8xkCJ9a1xLLa0D6a1QPy8MbPLt/uT+9+O2toOtqnGBYUv1M7gXCwSpcpFf+3kGgcLqsilXXUiLu8lSr8xCh+3jX7oFvNFhkmRWXP2qk1xBsP0fDejLiH38R8As+tJ0O34+cYx+QI9FxpPUIU7FsGiXdGu6WRjyuWZcDbbPZOuXoF98ecSNtrw+5M6JgUkKe6fpTzruVpD0CuOgQs5MFZvG31x9ur15ihVXoca4Og0Aw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00948a6a-761e-4e24-e3ae-08df04484817
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:34:20.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcpINMunA5fdVO40Bf1rTgbIcWEMs+rvxy9KzsIEpX6Z2Z/EpLMGmwN2OjdJ/1hoVG8onVqt6sKA5FvY4/pPkRdcC8XU9RhhPSB+3AXyWI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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



On 8/27/2026 2:28 AM, Daniele Ceraolo Spurio wrote:
> Convert any errors that can cause the CT to be declared as dead to
> use the xe_log_err() helper. Errors that are escalated to the callers
> are left for the caller to report with SIGID if needed.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 91 +++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..4efaf2d24c3e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -30,6 +30,7 @@
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_guc_tlb_inval.h"
> +#include "xe_log.h"
>  #include "xe_map.h"
>  #include "xe_page_reclaim.h"
>  #include "xe_pm.h"
> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  	return 0;
>  
>  err_out:
> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> +	xe_log_err(gt, GUC, err, "Failed to enable CT\n");
>  	CT_DEAD(ct, NULL, SETUP);
>  
>  	return err;
> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  
> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
> -				  h2g->info.head, h2g->info.size);
> +			xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
> +				   "CT: invalid head offset %u >= %u)\n",
> +				   h2g->info.head, h2g->info.size);

nit: we usually use -EPROTO to report mismatch in the messages
while here we have corrupted descriptor, so maybe we can use
something else, like:

#define	ENFILE		23	/* File table overflow */
#define	ESPIPE		29	/* Illegal seek */
#define	EPIPE		32	/* Broken pipe */
#define	EILSEQ		84	/* Illegal byte sequence */
#define	EUCLEAN		117	/* Structure needs cleaning */

>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>  			return false;
>  		}
> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  	bad |= !ct->g2h_outstanding;
>  
>  	if (bad) {
> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
> -			  ct->ctbs.g2h.info.space, g2h_len,
> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> -			  ct->ctbs.g2h.info.space + g2h_len,
> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> -			  ct->g2h_outstanding);
> +		xe_log_err(ct_to_gt(ct), GUC, -EPROTO,

hmm, here the "bad" flag is more an indication of our (xe) miscalculation,
not something that FW did wrong, so -EPROTO seems wrong, maybe

#define	ETOOMANYREFS	109	/* Too many references: cannot splice */
> +			   "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
> +			   ct->ctbs.g2h.info.space, g2h_len,
> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> +			   ct->ctbs.g2h.info.space + g2h_len,
> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> +			   ct->g2h_outstanding);
>  		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>  		return;
>  	}
> @@ -961,21 +964,24 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  		desc_status = desc_read(xe, h2g, status);
>  		if (desc_status) {
> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> +			xe_log_err(gt, GUC, -EPROTO,
> +				   "CT write: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
>  
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> -				  tail, h2g->info.size);
> +			xe_log_err(gt, GUC, -EPROTO,
> +				   "CT write: tail out of range: %u vs %u\n",
> +				   tail, h2g->info.size);
>  			goto corrupted;
>  		}
>  
>  		if (desc_head >= h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
> -				  desc_head, h2g->info.size);
> +			xe_log_err(gt, GUC, -EPROTO,

as this indicates that FW found an error in CTB, maybe:

#define	EPIPE		32	/* Broken pipe */

> +				   "CT write: invalid head offset %u >= %u)\n",
> +				   desc_head, h2g->info.size);
>  			goto corrupted;
>  		}
>  	}
> @@ -1220,7 +1226,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  
>  broken:
> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
> +	xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>  
>  	return -EDEADLK;
> @@ -1558,11 +1564,11 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>  	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> -		xe_gt_err(gt, "GuC Crash dump notification\n");
> +		xe_log_err(gt, GUC, -EPROTO, "GuC Crash dump notification\n");
>  	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> -		xe_gt_err(gt, "GuC Exception notification\n");
> +		xe_log_err(gt, GUC, -EPROTO, "GuC Exception notification\n");
>  	else
> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +		xe_log_err(gt, GUC, -EPROTO, "Unknown GuC crash notification: 0x%04X\n", action);

maybe crashes should be identified as one of:

#define	ENETDOWN	100	/* Network is down */
#define	ENETUNREACH	101	/* Network is unreachable */
#define	EHOSTDOWN	112	/* Host is down */

>  
>  	CT_DEAD(ct, NULL, CRASH);
>  
> @@ -1592,13 +1598,15 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> -				  fence,
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> +			xe_log_err(gt, GUC, -EPROTO,

FAILURE response is a valid message, maybe:

#define	EBADE		52	/* Invalid exchange */

> +				   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> +				   fence,
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>  		else
> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> -				  type, fence);
> +			xe_log_err(gt, GUC, -EPROTO,
> +				   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> +				    type, fence);
>  
>  		fast_req_report(ct, fence);
>  
> @@ -1674,8 +1682,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
> -			  origin);
> +		xe_log_err(gt, GUC, -EPROTO,
> +			   "G2H channel broken on read, origin=%u, reset required\n",

#define	EBADMSG		74	/* Not a data message */

> +			   origin);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>  
>  		return -EPROTO;
> @@ -1693,8 +1702,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = parse_g2h_response(ct, msg, len);
>  		break;
>  	default:
> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
> -			  type);
> +		xe_log_err(gt, GUC, -EOPNOTSUPP,
> +			   "G2H channel broken on read, type=%u, reset required\n",

maybe this should say: "Unexpected message type %u" ?
and since we rather do not expect new message types in CTBv1 then
maybe this one should be actually -EPROTO ?

> +			   type);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>  
>  		ret = -EOPNOTSUPP;
> @@ -1792,8 +1802,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
> +		xe_log_err(gt, GUC, ret, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
> +			   action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);

drop %pe as it will be already printed

>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}
>  
> @@ -1840,7 +1850,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		}
>  
>  		if (desc_status) {
> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
> +			xe_log_err(gt, GUC, -EIO, "CT read: non-zero status: %u\n", desc_status);

#define	EPIPE		32	/* Broken pipe */

>  			goto corrupted;
>  		}
>  	}
> @@ -1871,15 +1881,15 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (g2h->info.head > g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
> -				  g2h->info.head, g2h->info.size);
> +			xe_log_err(gt, GUC, -EIO, "CT read: head out of range: %u vs %u\n",
> +				   g2h->info.head, g2h->info.size);

as before, one of:

#define	ENFILE		23	/* File table overflow */
#define	ESPIPE		29	/* Illegal seek */
#define	EPIPE		32	/* Broken pipe */
#define	EILSEQ		84	/* Illegal byte sequence */
#define	EUCLEAN		117	/* Structure needs cleaning */

maybe except EPIPE which we want to use to indicate that CTB error
was already set earlier (likely by the GuC FW)

>  			goto corrupted;
>  		}
>  
>  		if (desc_tail >= g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
> -				  desc_tail, g2h->info.size);
> +			xe_log_err(gt, GUC, -EIO, "CT read: invalid tail offset %u >= %u)\n",
> +				   desc_tail, g2h->info.size);

ditto

>  			goto corrupted;
>  		}
>  	}
> @@ -1898,8 +1908,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  			   sizeof(u32));
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			  avail, len);
> +		xe_log_err(gt, GUC, -EIO,
> +			   "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> +			   avail, len);

#define	ENODATA		61	/* No data available */

>  		goto corrupted;
>  	}
>  
> @@ -1981,8 +1992,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> -			  action, ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed (%pe)\n",
> +			   action, ERR_PTR(ret));

nit: you may use %#x
drop %pe

>  		CT_DEAD(ct, NULL, FAST_G2H);
>  	}
>  }
> @@ -2080,7 +2091,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		mutex_unlock(&ct->lock);
>  
>  		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed: %d\n", ret);

drop %d as we will already print ret using %pe

also, maybe worth to mention "..., forcing GT reset" ?

>  			CT_DEAD(ct, NULL, G2H_RECV);

hmm, I'm pretty sure this is redundant as we already call CT_DEAD
on every case where we report an error, can you double check?

>  			kick_reset(ct);
>  		}

