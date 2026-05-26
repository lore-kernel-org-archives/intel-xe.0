Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ABECD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DDB10E1F4;
	Tue, 26 May 2026 19:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meLJHLgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4215810E1F4
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779822759; x=1811358759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YVvFGLZ4qOU7l3RToENRGgbs1pFDhyQfEt2SmS1zEeM=;
 b=meLJHLgiPejDr3uuoDkyHaZAQOxrv8csMGvKqlVpu6racsbvXSAkVkOI
 FzSsQMVogehhmjPZg0msukcUxKE7/QJjpV5uyanWKX3aI/KUt4nAko0Cq
 NWkVhWKkd5JPGfgEau8M3YAyt8suAxpxd2Apk/3EWgPwQlqjcRu7SpNqB
 acF76k9XUkqGS2b1xnDqiSP0Kzhg4O3H/TyahvZ2Y3eyZrlH7ttFWsZUM
 mlW4tEsCWn50qcSEW6VannNZYo/BiewOfeCT0FFlI2tqFAxoQddQ2kxkV
 3aQlnqS9IVC+eslb10mXY3dv+YS0p2qN7wFLQ5e6rbzbegB6pDNRqfctz A==;
X-CSE-ConnectionGUID: KjoYVd7WTYK+9vujB76xqQ==
X-CSE-MsgGUID: 972Q+yx+SeuM94STr+w4pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="106106151"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="106106151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:12:39 -0700
X-CSE-ConnectionGUID: qCUVdWZPQ6aa82bUrh6LGQ==
X-CSE-MsgGUID: 8agvrEKxTJ6B3rYWx6jgpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237839989"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:12:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 12:12:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 12:12:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 12:12:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjEqoS22Fd7QGkUYKjGb/k+H1sjgywYHOHV3O5SxZbotYlIDYL5frzw1HV9qKGvfKnkxQDWzGpFicd9exrp2B6DVQs09uU8h0ctcTPFQKtf1MzKZ7tj9WLlaqVp1kr5NLnfliSWKCu2/bFQnP37W2DcDvgNoMnR9h7WY0xXRpOpWR+y3zl0GFbw0Sh5CEl0iLIiJ3UI/JX1se/T0MY+/CByNs5bVbV3keJGGzw9qi3SOJv96xWTWRMZlnE58hDVHatP0nnOpSmZkxtdN/XEkT54AgO1+lHQbnJbDPVN4ln4q/6BAHLFEoutuJM2O8SFF2dWeOc+pwa9tPn5frTgKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbpwBJmVlfHrm1HHb/xZRtqYgzdoOvfgjlOsfN86qms=;
 b=pbcnJyfu8P3zobk4/iHql6zq+pYmu9axNnsCzHhasSAXiWIBHNky3Zw31X52WXOGMnewUV3vfwO8eLWmL88ig3M8/0HTRCURv6fYsLhUK/2LxdqY2fF8TSRaXud9bUL4I7yaRtnoQmYo/SyAauucUboW3GvQm8zD9ULeizJn4Y+t9LnJMb10RTixy4Few0DMM0Wxa94vgfP8QyCboQPz8gc4YLGB+xNc9Oq6FJzsF5K/5ah60jlAnLQdI/iok3zu1HywSEDI9A+nboisopJYtJS08yQyM6XNMpu7Hzs2UMvbWDn2dcLjpInzlObVfLu8RrAhyiQU5xUktEBf5YTWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 19:12:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 19:12:35 +0000
Date: Tue, 26 May 2026 12:12:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA
 whitelists
Message-ID: <ahXwod5FQOxZNj20@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-2-ashutosh.dixit@intel.com>
 <ag+R6ndpufdiwMej@soc-5CG1426VCC.clients.intel.com>
 <878q9cwd36.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <878q9cwd36.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: a6484e06-54ab-4f9a-3d18-08debb5abe3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: nNhvGDiLOzy7BdhaVSIX8gzXj9Xd5ZZq2ZwKA0+45iBwnio7LW+Kxrmw+Bg6FHE1OlkrqKMfaOfJbHJJDa1Z+Rfbs1uRFqKMnS9fSGhTY1y0E0IT+PQw/k5kbU8PgA1Qqhal6TbcWHnsuY4d1jDZQRv7hb+pNqycn1PFRdI5ZTh2b8QC8YfNT5UIGEwwsTPTDUUSax6Vp5dnUb5APlOTWKDuQkYPKPfYFsZ3RxhOx+GsxYAdMqKHAVfebbv4SCE0XOXYhx84sXvmjBeUXIA1/e5x5tljZBLzJ5IOIcziuv82Oy+Sz/cyaL0tyC8qeFXe3r9a+PPEV5Eoc6bL6JClf5CCjZJt6kR5cFdLIRQoxGafCMXtesazEb1SF9F7U8InDKO5h3LMf2uXJdbansrdEM0BI+TpvdQ1xqr22v9vHGYeRWhK1qPdguNJyR6p8xdLuRHSx05uTgyCCiH3nynxXys14ne7NV5YhKSfnlUAswzhkgdmOLX/1ZLFkrodtLWXXgYmdN1QAUl35neLXDEtvBgnQTlkiwaKAgWBsOI+w0sr4UjNI56yePX1eLS2XgChS/70dgN6y7bs6MAA8+kIFTH8j6eOdFink6D12iAYQa+nrXGG/ja6DRc1NR2k0i1lt5/hqtSywzUz85GHp4q4uBIw0N6cMOGlptDVSi8wi21b/KHO5960KCVhjOW5MSPt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZjbktVRHZGc2FnTzM3dGVCWk5MclZZZXhtd0Vjdk4yUDI2Ynphdm13UTli?=
 =?utf-8?B?TU1CSjdoSnZ5dFV0dW5BckFwbEk0U2o1OGpJNDZWUjRLWXV1RWEvTWNoeHJW?=
 =?utf-8?B?OEFpK0NLYWhTZVpFemtaNlhaQ2puV0htdVdLdlpFa1B2U1QxLzYvMGUwWWRY?=
 =?utf-8?B?QlcwRzBUckVIU0JBVUI3WG04WVk5QkNBNlNQa2wwdm5GRkJWVExUUWZMWHNw?=
 =?utf-8?B?SmpMcHdVU3ZLNDVDTlR5SzQxUnVXWVdGMmZHOVFIZk00aUhtb09lWXdWYkUv?=
 =?utf-8?B?UHRsU0w3anZBdEVYVHpON0lvbUtlYWo3Unc5a21UcVhhSWkwcExhZURCNjgr?=
 =?utf-8?B?K1hHVHZXV1luT0NwN2J1VzdVK3N6VWlmeDkzR2NHd0QrQ3pvbXpRbHJZWWpt?=
 =?utf-8?B?SkpCVXorUHpyMWNraGVnblUzUlM1UjJFQW8xU2Z0Z2EzWG1TdmVYSTdEN0J2?=
 =?utf-8?B?ZHdaeUZXSVFzZVc5eDE3NnFQQ2VXRTBnVDBhVjYyRGNhdnhTSnhNWFZtZmlE?=
 =?utf-8?B?b2ZsKysvbURFUi84VnlRNnhVaVI2YnFvVWRKcEJCeGxhM29CRmF5QTB2U0t1?=
 =?utf-8?B?Ry94NEFWNTc0cW94dStkVFNsem40ZHpxaXdLbVBzU1MwanQ4ZGxEcUZyeVVI?=
 =?utf-8?B?MFlzOXNVVW5OK3puZ1RwL2lvdG42TDRPeDY5RU1yNWtOeEtuU1JnU3RzbGRU?=
 =?utf-8?B?WGx5c2dCTlQ5b3ljUUt4Y01OZ0VldDRCMkd4dXdSbm5Gc0I2NWxQTlRWeVRG?=
 =?utf-8?B?NXZqTlRkM2NMTEhUMFVFRmd5KzJyQXlJUktPUDhzWkV1Wm5acnlacHZ0MEto?=
 =?utf-8?B?Unh3WmZyTGVQQzZhZ3hKRjB5SE5aSkVnL1p6dURFN1ErVTlSM3YzYS9mTHRM?=
 =?utf-8?B?SHVGOVNsUVE5MUxCSzhCT0d4MzZRYWNLQU9ya05XQVZ1c0tFYWt2VjVZWitp?=
 =?utf-8?B?L0p3dCs3WjBsZEh1d3ZQWVFhMnhmSi80eXdoM1ZEQXZmcUlBUHRHRm5IUFZQ?=
 =?utf-8?B?MHFEaDdBMnN1ZTRyTm1HYmg2OUJkZE9GWWUyd2hXSStvZmFVWjNyZjNHemhq?=
 =?utf-8?B?WDF1UVcrelhGait5T1FESlVoZUZGOFdZWGoyVDFQOWxGc0tVcVg0WEJ5TlBP?=
 =?utf-8?B?ZThMZHo5Z1ZJY3BrSjFhTjZzWE1tM3NSR01PVlNJcG5jUlA5ZldtaThnRVdl?=
 =?utf-8?B?V250RzRwMjdscVd3R04yOVc3Ung5L3JWekUrUXdaQ3NPZXdtZStST21rcFpW?=
 =?utf-8?B?aWZqUkRtVXhPeG42TGFQQXR6bnFucnpwYUNHcWdzNitsUCtaamtmWmlkZ0R3?=
 =?utf-8?B?S1E3cmRleXdjY2F1clV5ZXZZcSswdTdva0tncEtBRG1xQXZReUdzYmRPRGRr?=
 =?utf-8?B?U1gzT2IrVXZVNWNaZUdlNndoNThtLzBYVnFEb2hMZ1pTbzU4TmQxaFZhU2Ev?=
 =?utf-8?B?b2J6LzRxSGNTVEV2L3F0ZkNoQytqdWtlOEdCWXFvazZ6bzhKSkxUazVWNVVw?=
 =?utf-8?B?WlZSVDM3V211M1VBRjdQUTNUUjJMUFplc0g0eXE4YUowWERwQjc3Y052eGRG?=
 =?utf-8?B?bEVpL1VpaG1Wb0tqcmZZdFJYRHE2c1pKUmVxZXMyZ3lER2lSdk5OK21HK0wv?=
 =?utf-8?B?Tlpqa3ZoVit3d3V1c0tPVVV1OW1JU1J6bm5tMHdPYXJOVlJVclN3cE9VSStY?=
 =?utf-8?B?TDM1YWZxM2lwY0p5NGppOHZoZnkzajJJQzNXVExVY25jbWhqMHUvQkNrK0ZB?=
 =?utf-8?B?TUxQL2JLTnlWWFdObmFYNFRyU0duYzcwSlkyalgvcGgwRzdxaXlKb3J1UVdn?=
 =?utf-8?B?bzNMVjVkMzJ1WGZta1hNOWMvak1BWDViekFmTkgyYW1ETWJ1RUNLK1BSMXFj?=
 =?utf-8?B?TWZSL0hMTDJ2a25aNkxxUWo2N0szdlVYK295c29UNTh2UktmNEtFdC9GR0Vn?=
 =?utf-8?B?V2FQVXdUMTIrR0VibXI5MW52ZC8zaStUaUYrQXVnSWxnRk52c0pRb0xqa2ht?=
 =?utf-8?B?WEV2ZFp0Z3BIMWdFa2hRd056SDZYY3pEckZPTEp2Z3l5UGdxWWE4OGtORFNO?=
 =?utf-8?B?SnQ3bEV5dkJJRUg0SDRNMjA3REw3NnZHRTdSRWJlU2NpK2hvUTJRWkhCVzQ3?=
 =?utf-8?B?b3FuTnphTWhNUDNQSllMZUZ1ZEFpMjFXUlFaNGF0NG9pZXd5ekNzS0pkSTdO?=
 =?utf-8?B?NEI0V0xGV2RnTy9pZzJ5SFNUejlVblJrUmZGZlRqcTI1Sk94T2FNSEJhZmlq?=
 =?utf-8?B?M0g0ampwdU1xZDBIVXVjZ3lGaEZ3Mkt1c2hEbU54N0V4Qkp1eTlrNWhPRURk?=
 =?utf-8?B?Mmh6ODZONlNnUXVHNU9tR1h1a2poQUlSbWVZWmNRNnZ1UjFTRE0veVpIMEFL?=
 =?utf-8?Q?ZCSEyE/6M5C72CHAEpKGY1diyLDW6WoPbo5Q9?=
X-Exchange-RoutingPolicyChecked: L/34RFOeHOUWajrnSYAmRG8a1HNKoPly4H9/0WQbUnUojWn1s9vbbc8hIVP7DqubeyityJ8jiocdDtINBNbOJjWxKJ2mlbL4HLlSw8OD+SDvrbfgkND8o2dZRRp+Ey3bzY2odagUpvnd0+zEK6qIJXMitgfK8m3Tv6M2Ue3nDt+ajCySxcwnrb0jzfpOqad9QQlDra7kTSSp3BZfZzlbDfnALENZTN1BV0mptA/0UcqGMZTuv2Et0s/Iim+S23mZMHPEssNt1/FOOPMO3cC4ZiQcrNczahppe/K8F5K8cduhG41T4C8cvTZ0EH0RlDvx6S+fGpQn/HCZaqnB0smOUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6484e06-54ab-4f9a-3d18-08debb5abe3e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 19:12:34.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvFfTCZw0jdXrItRr2f7UH6IZTC3rmMW5yG7pcQ2Up5V4NG3Mx1XQkIhU4vXUw6+uPrD3Du3lsckLNw+LUa07Hh4bXY1WL4ideGe9Zarx6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
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

On Thu, May 21, 2026 at 04:35:25PM -0700, Dixit, Ashutosh wrote:
>On Thu, 21 May 2026 16:14:50 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Mon, May 18, 2026 at 04:47:08PM -0700, Ashutosh Dixit wrote:
>> > Unconditionally whitelisting OA registers is a security violation. Set
>> > RING_FORCE_TO_NONPRIV_DENY bit in OA nonpriv slots, so that OA registers
>> > don't get whitelisted by default after probe/reset/restart.
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
>> > 1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > index fb65940848d7a..d6a5d499373bc 100644
>> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > @@ -105,9 +105,10 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>> >	},
>> >
>> > #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
>> > -	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
>> > -	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
>> > -	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>> > +	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW | RING_FORCE_TO_NONPRIV_DENY), \
>> > +	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_DENY), \
>> > +	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4 | \
>> > +		  RING_FORCE_TO_NONPRIV_DENY)
>>
>> status and head should be clubbed into one slot, starting with status and
>> RANGE_4. Maybe that can be a patch before this one.
>
>No, e.g. for OAG, status is 0xdafc which is not a multiple of 16, which is
>a requirement for RANGE_4.

I missed that. I thought HW compared ranges differently. In that case, 
this is correct and the individual registers can be whitelisted 
separately if needed. Otherwise some registers can be dropped whenever 
you plan to do it.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


Umesh.
>
>Also, about RANGE_4 above, there were different suggestions, e.g. tail and
>oabuffer should be different slots, rather than grouping in a single
>RANGE_4 above. To avoid any such controversy, I decided to focus this
>series only on removing unconditional whitelisting for OA registers. Any
>other changes, such as removing or retaining RANGE_4, we can do after this
>series is reviewed/merged.
>
>Thanks.
>--
>Ashutosh
>
>> > #define WHITELIST_OAG_MMIO_TRG \
>> >	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>> > --
>> > 2.54.0
>> >
