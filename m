Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21284C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 07:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D129810E341;
	Mon, 21 Sep 2026 07:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5PPY165";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331B610E341
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 07:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789974491; x=1821510491;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+jq9VIS2bqlbNxPbLy3a1Jb3EOVseclCs+Dx/tTel+4=;
 b=f5PPY1659p7miQNmpUs4jWMfpiFMVF+6g4RcNwncgu8/aM/Dq/b3rjCJ
 uGjRQLLriEJcw3JHeuIF+ht5DMAi2qY0LaJ8hRgE4Qzp8he5Uj0P44Q30
 ECoYfEx29LwE71CZzvjMhVCYNHlMOqg/31m75AlJJPPV06BA7AfMbcZIy
 1GjftYu4lLEz7FGeiLEWv0EbyfpFrkXJ8WI2qE8kgqkou8ZHC1G9t4nTk
 rAdqb+QW4yRVHIi8lth7CLfW1Gcg9sNjldg7O8RM8YcJVBalMfGhX9ZMm
 2/uamNEaT8j9Mq1WrgaOMrNtOCV5iRkECk4P81PT/3VlU9ykfXURtmGZp A==;
X-CSE-ConnectionGUID: BAA+duHkSdi22gLnXMP1gA==
X-CSE-MsgGUID: G3tlkPjiRVyyVHKS7GJBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90486188"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90486188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 00:08:11 -0700
X-CSE-ConnectionGUID: s3O0Wh4fQhS7UEi8IlDtEw==
X-CSE-MsgGUID: VWjmhguSSsmKYKFXnYEggQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300471678"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 00:08:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 00:08:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 00:08:10 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 00:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFRgHvVO1LIT+4gS9tHZlfKpz2xsLp6WpjWZ+AHXLxLSw4LhYqqPvuhs/OHB5DbuzivBUiHZe+CPImBRwQ6kB5i7Yg+TWeJc83ORhGkbgW3fxJeA8LioX8TBLGvZkmrzZQSJGRP9BuGySAhI0LDB59lGqOktL3aVJQkMGh7Ypc22ybcHXdXiTeHGUbDcgYLm4JrMVknC02aQdLgfD0nyyJIuDExBgoTMA3ia659Cp5eD5FVKxg4Kv+fm449ql3vUSNB03rHkFSFR4Bh77f95HAi09qbHmKTMujo6woazXwMsLD/Jg8Px0BFuMEaRUGzvGPpRMsMVqd7lClpcCnA4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gUTvb6ZpsCiucBuB9iO9o9iWYe6LWroGgjrHg+C7ho=;
 b=Vdo9dWXFu6+JxxCO314SfHDDnUsh8UtAfcQo+T0WxY/7tex7KehEztwr1AzKNVrnrfWOI/cwon/LBlCtKLY/lcifLw92Tg7/0aViEBkOWdQyYxTL9hjBblBFqYKZHp2PwSKNcnjJicGrysEStcSBW9zGIdEXkQauize4hO8/hmf7c3lvr6Q1uSqjQsFpBYr8kH/afrVgAciEhV3HKQj2k3Iw2aCdn08pGCuciocyFxcRSXUCUaQeXO95c0tb5lNvtCksh7GbYVuubGx12iIRBW0O8WrRQv6/8gGglpM9r7CbR/9kd2IV1kRzMWyKwepYFy/zC++NULKX1/bo4iRisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:08:05 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 07:08:04 +0000
Date: Mon, 21 Sep 2026 09:08:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Move locking to xe_sriov_pf_reprovision_default
Message-ID: <20260921070800.em4uqfkucj4kihf4@intel.com>
References: <20260916212949.13120-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916212949.13120-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY8PR11MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d7dbd4-42b8-48f4-5ce9-08df17af1467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: kLo5ZBM1RGpK1PJJM1H+fkwN9Bq040Ja7tiEj5iu81yFADN+K675R8Fez2sV0E3+44gN21nswM/XW7a7WVWi30whzT/JNEbzUnxwETh0oGFfKRL7xYhFiB/mA0IPwKU/B7Os1r+Q5wqmjG8O7G+F1FMzaaLWidewqUlPw/EPPQp4zn57thc+ir8wPnl9Gsv2Wd4iJUKraviglSeyxhAHK+eYea8ZCZw5+u8SopveWcSyT0zoLdKGi6WykeahqM30GJS365XLH/lUrzo89tNSGhYJy4JHIHcUy07htYQ8osliUFKfnlvrXmkYUAer54Qxqg3Wf0jA6rtui6wTmO9HZMxuNU8zCqQzDQOAAU6RAAiIulvn2r90mOpnvHR9z7Ub3CTLtDW5R6M5Yx7o8nzX5yqdOyc8ODvQ9YTlEQIslVyH7JWj/RkA6+IDzT1wMAvpq9OLDf8eNNvRPnPnkpFcXu0Vx05Dacs/j53QkDTbRJtC0eCTkQQlDxY80JgiHAdc71Qcd0rS0wXBXtIJ3Iw9OwesQan2wZqST/+1d65HAoufxPCjJ1c441sGKcNAAfGyDWnuPKlaXfShXS+poqgHL84hfCwcXJU586rgxHxkLuUmhfRbPa2v7M26shCm5rRXucDFI8mBhVBdjiPPIPT94OxxgghEsvf+0coeyh31ywo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkg1MDZ2ODg2RzBLbUJUWCtReTBFTy82QVJCNWVBNGRPdGE4THJjZXU0c3RW?=
 =?utf-8?B?T1U2RVg0dzNOb0thZEN0UTNVaTcyS3RCZ1hUTFdndnNnTDRWTUZIa29oN1Jt?=
 =?utf-8?B?Rk5zanB4MzIyalNuaUlaY0laUG9INEJ3UklpKzdzOHNrNEl3OUVjNXpIQVI5?=
 =?utf-8?B?ZnJGb3phT2YxQW1XTlJpdmowTHJVSzk1TVJORmZEcU9zZDBLRURXeDMzZkZB?=
 =?utf-8?B?VzVXVytFOUExWnEwTHljdXB0T0xXYU9NVXlWb0pGak1LdDJtMm9NdUdlN0Ew?=
 =?utf-8?B?S2tsd1dvQTdzU0V2clRnYUMxejYxOGIvdzNOUWcrRDFIYnFCZVNhKzdGVWpa?=
 =?utf-8?B?d1lvRjdTMHJCUjNEcEIzZ3plcWNGNnBQZHY5UHFaZjk5VW9oNGo0dmViSzg4?=
 =?utf-8?B?TjNWc0VFVFpDN3M5TGxuUUltN0h3R0IvaFM3dkQrU0xVYXlBM2hFb2F2ZzdB?=
 =?utf-8?B?MVo4K2NHYXF3L1pCSytKUjFpbTRnbGRNNlZ0b3JPSkUrQWpJSEIyOFM5Sm5F?=
 =?utf-8?B?M2JIMWZzRkxmSi9EU2lGcGdWNU1RMnFBbzF6U1BqUnpNbWVvV2dKU3A2UlNQ?=
 =?utf-8?B?WVA1TjdQMVVhU1M4bXo4TmhaZmZjV2dpU0ZYY1hGVlJ1THVmR0tTaHlhQTkx?=
 =?utf-8?B?RmFWSWwvdVN1ell1YmRsNURLVHhRSFMvbU9wUWtnUmVoK3lzOS9odFY3RGpv?=
 =?utf-8?B?QURXRDZjallOYy9jS2lPUVdwVkp2K0Rna2R4Q1FvckdhNWVsMFM3OEZFYmRD?=
 =?utf-8?B?dXJkQ3ZrdGhTNVV2c1FrMXVzUy9qK0ZMc1NBemdZVlZpVE1lSXNJSjRKVldw?=
 =?utf-8?B?UVhoQ2JicmZSdVhrWTFKRzdFZko3K2ozQnl6b2F2Y1VMTElsWkx3OFlkdVdR?=
 =?utf-8?B?UitFTXVXcFZDd3dtbnh1RWRRUkpSRnN0aFBrcEl1VHllMHg2T0V5RkdaWWx5?=
 =?utf-8?B?b1hOUEFRVFVCTjNnNXZXNGpYczNtT0xpSkRKYnJ1Qkx6eFdDOWE4K3d6dkZD?=
 =?utf-8?B?endlekNZQnlsbWg0Rk9VZENjR3BOSCt6WUM4Ky9vSk1Fd1BqZVNoWi9HV1li?=
 =?utf-8?B?NFBzdDVzbXM0Qm1GN1FCL2VnVnA0cWJ4bFNBc005a2h3ZVE1Z0pmYkhRWlox?=
 =?utf-8?B?WUpsbTRsZ0FmUEhYandvVkVqQnh3ZStZN29xT01sV2pkdHFIaExMKzVacE5m?=
 =?utf-8?B?NjB3R2xCcG8wQlJEbHlUOExNNlFWRHc1Y0N5aU00Q0JualppWXgyVmRDRGE3?=
 =?utf-8?B?Mm4vYVNZbkFEQnd0VHlYZWhFY1J3L0ZGbjNETnlPSWg4enluTWljL2xickp3?=
 =?utf-8?B?UE05Q0IrRmhMMm4zRkVGdStwSUNJNkxPWEtmemh5NjkzQ1dYWk1LOTB2dllX?=
 =?utf-8?B?U1J0TURGQ3JKR3ZtQ1hRdkg2Y0xUQlE3RUtRdHR3N0p5L05vWk9DUk1weTZn?=
 =?utf-8?B?amNiZzVCaktpaHBQbWNMdkhYOUNZSVRFalE1RFNlR2VMZVdPU2RIMGNJWTdo?=
 =?utf-8?B?MkxEZ2dDb1dpQXRnRnBpOG5HOGJDKzd6WGkzQVFOL0ROenhYU2ZkUGFIYTJw?=
 =?utf-8?B?R0szUGFjOGdrakhUeVEvU0w3OWJFanVtSmZ1bXRvbjBIaGNZcWVjMTlTaksy?=
 =?utf-8?B?WGE2WFJFYVZlQitCOFVwSk9BUWhLRUpYRHB0dmtrdHVEZFBMc1RuM0JuQ2RI?=
 =?utf-8?B?bGtrNU1MWTRqZGRKU1JYKzZYKzdKUVJ2NW94Zld0eE1ISG8rNG53RFRqRktT?=
 =?utf-8?B?MUpKSVYvRjgxSFdMMzN3aGFpUWVNVnFCWW1UakFvWmRNb2NIa1RUdnRJVHZz?=
 =?utf-8?B?bzJDWW54RWhFRlZOMHlUUUd6Q3RCQmlvcnFIcU5tektUWXlObTFMMmEraTFL?=
 =?utf-8?B?QXhaUmhkdkRlZVcvdFgyZG0vRE9GVG55S3ArbHh2YVNTazNveUZMRmt2czBR?=
 =?utf-8?B?RFk4V1R4ZTEvamhlTzFKTWRpaWxCZ2paRGRvRmdReHZFMzc0eEpyMjdHTHdJ?=
 =?utf-8?B?NWJ4OExhQlhUVnVYUEt0UStzdFkyZXhpODUwOHlvMTJBZzZvUENxT1JoeUwx?=
 =?utf-8?B?ZDZHYlNCWVNwcHA0Z0tYYlRSZlZIaWwxcGJOME9UaUVkS3J6Sk94Z01Gamdx?=
 =?utf-8?B?RWxHdC9oNUJ5UlhtMGRPTmU3c0ZuQlkxUnRPYmRmWlhzMW0xb3huVm5TWEkv?=
 =?utf-8?B?SEk2RXdRcmJNaSt5MmdLbUZEVmh6V2pmZEVyNkJLTGF0VXBrMGFERHc0MEEz?=
 =?utf-8?B?WEpKYUVyb3M2RmszZWJsMlBwVkNRZTFYMjk5VjllMlBpcHk2MTBtSzZpUFZ6?=
 =?utf-8?B?Q3F1U0w3WjcxMjI2THI3TXVwanJ1S1NtQW5pYUZudlhDdWpGY3I0Wkh4NVRl?=
 =?utf-8?Q?jwWfJ0cZPYHlcZEU=3D?=
X-Exchange-RoutingPolicyChecked: L94a1Nh9de4D5/XbVx0zs3tHkbu/I9L+B+k/U1Db1XnP2V46c3zGJZWAmy040/2roj8qf/MiqbY+cFq7Qvhawj9WP9fOnSQ8YRLF3NxueHpIexApH2Mp4iMnEth7sWCV5BTv/UF8pe0IAkXIzmU1w6BymUn7H6giz8Px1j9M9QOrw2X+p+GAjwm01gb2D7hDkNw3OeJTJU1onqn3nTGSoaIjz/mpJPlQ/qrvW5B0+XW5WlnczQRCtZGLBPygRINd2teSZdI8hKiOBZ+Y0FC3z//PYRNMKn50Dhh2dBeZ+wSVhsTGNB34vQhv4AXjxdx+RBx3dx5eYVj4cVt1/Jfr9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d7dbd4-42b8-48f4-5ce9-08df17af1467
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:08:04.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBCVvCiaCXkieDUQ8E7Pgnj1/KZgKaH/H9ZNsQk8dnOa1H5WbokKCxWi1SW07a97aNnjNd7YIdvb34c+HkXYu1Ff+jV/Nx3TOIjibYr5fpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-wrz-16 23:29:49 +0200]:
> We should avoid taking the mutex in the helpers. Move guard from
> the helper to the main entry function.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 0ec7ea83f12a..c37e422b5a5c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -112,7 +112,7 @@ static int pf_reprovision_default(struct xe_device *xe)
>  	int result = 0;
>  	int err;
>  
> -	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
>  
>  	for_each_gt(gt, xe, id) {
>  		err = xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, false);
> @@ -138,6 +138,8 @@ int xe_sriov_pf_reprovision_default(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
>  	if (!pf_auto_provisioning_mode(xe))
>  		return 0;
>  
> -- 
> 2.47.1

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 

-- 
