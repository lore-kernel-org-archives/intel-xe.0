Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A09C88E64
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 08:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E93010EBF2;
	Mon, 14 Sep 2026 08:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRyB03rS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0324610EBF2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789374497; x=1820910497;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f3wTaSTU9xA4Y/z9Ct1lVEn25gHp29IDpZb2720AVOo=;
 b=gRyB03rSykZJCn83L4ZOX6tRaqkNeK+vnOU71T2oz0MZGsgwHvfCgFaQ
 uRu+VFuSgN8oWnAT37FtyREssJ0xb2D23UGmRWJTn3vPFtCg4593H9Z5V
 gcFQXyhKDfDAoS5x3UJXZnr/blFeuhpCqmJA39jW9uQhNGr3KtBh/+9kj
 SNJp8MgEuS1dpwc2q792pfNrKIMvW9rMLnFsuDnmv2gNsJuezByB6NQDO
 8qPZs2mxP5Y6ZQqixa4xF2aHgwcEH2D/BhRsJXPvp/Kr0/Q2KPiZxHNps
 mBu/XGkdjkentz+IWa5y1NuOsky8J4dwI85cpzTjvDskDTUZwWekd+r64 Q==;
X-CSE-ConnectionGUID: 3r90lf3wQE20vj93IA9X6w==
X-CSE-MsgGUID: rlDaK9q8S7WdaDbTkm4Rlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89565909"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="89565909"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:28:17 -0700
X-CSE-ConnectionGUID: MYJ8pEcWSPyMMy8h0fIKXw==
X-CSE-MsgGUID: V2mPOomOR26yErzkoIWhJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="310853666"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:28:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 01:28:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 01:28:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 01:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKj3K6YkiYAzxGgDyuWmqNLY1k5SMNnuw0qs4utjeszWcxq6DPaBKfaHOOjVhkYLKCmz3xU2ultBdEG2LttsX2IcT9ZViEa2n697Zue7gHK3g9hFBy+JJ/ZriquQon4MC5DNiprs9f75aOrrvSIdgKWVRkXj3T45LpLUfRh9tYhpWwzn3vB+3xP0lsN+jMeDH/7ddTkHee7KhRJFlr98wo+1GTCclaq+j5yfKm2133HJt5Ea9f2OOzjlHeHnu0ruuESDBWddDBAWJkTK5ikvVrxC44Pz13lvSkG/LfOWDKiGspaT0bGDT4XelMn7fzzUIyEI5xW6lFzl3CHYIXk2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yoq4wUDdgR9St6EuakgTpkg2zql7DN5t+i8Ug6qEbk=;
 b=clXL2xm/0iftjz5AT3Q7shskc7b6dUkHv0aEjU4Xr+4s3SwOX5b1vMLpfMHrxJp8iN2Ex6M2TousK3hUGOv17CHvXF9afB5zSGY1RlmeFD6ha+kK6+iqTdkU7goq/OcDhMnKDsHfWFO8c9vxX8AyzQXPAAlrnHW0OyRhGYBevBPZooG0lw6jqZYNHEbdAC7jzWaxMXjMCCBqarM926pmG+TWt5xh0i+C1p3/UgPq8OBw66Dcq4hy3f2ziZWgqxBsGnJK+9NkJOAC3lvIoLLI1Wx2EuNXwiDnJVQHDkwg+uE+kTgY0uUMo3ZvFkZz+vo4B34FZBWKgR/zU/4VcTzj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:28:09 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 08:28:09 +0000
Date: Mon, 14 Sep 2026 10:28:06 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Add _locked variant of the priority
 config function
Message-ID: <20260914082806.x7mjneqv3lnd762c@intel.com>
References: <20260911183257.14999-1-michal.wajdeczko@intel.com>
 <20260911183257.14999-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911183257.14999-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: AM0P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 030bf17b-1338-40d3-15ac-08df123a1bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nqRelSEDUwNqUvZqcQd3tOgps+nYLkzX09XhH2rbxL/tm5TdWpwSREdfTxIJ78auMB+tEyhppKIYQlGFQszVQ5XX8DEXCZVMM2J6NOAe1MehKtQDDMsLsrfL/mT5wmh49IyzWzssdyP2YRbyFul1Bq8opAw8KDqmyYSCA/7iVJpoQwimGPyMYcdzB1LFC7OGZAHz4ivPTbmuqZwnV1frtkd2JhDNWS24wEpfcvzLBMkwtxTX0P0raYjlaqOPifiSwlto7Q38NKnonACZmCEoO2LrGnxDJiIAhHhZDiGEmqUd+q8hDXlMaNf7uiOWyhxg062R74E/Hr9e0QQyQb6neO5MbCAjBJfReD56Kszvp/iUe6LMtspzofF7oVwVo8cP1gSDjCTu871QaEdxYvJdvSjRrqu0hAq0DGGbxms5vrqZCQKIpdQ5+LoHxosP1vv2Mgh9x5McrFRZCTzCKPSc557Uv6LOeNxFGvV29QYU28kyrr+fg/3uRHc8PK5BEBtQxhF/zQCTv58DzEug56SCqoDG/0RzJlOSfzkOR+FMXjbqx/1ojsh08tZXAkgSgjLiyZ1o8icvkvJEssFJ5pDKnPFnUr9bDBX8SydVM48obU2UOUopOPH5rrgkNsQrtnkSWAT8Ae62Wyrj37aIFhV2Pt36CECPHgIawC9FLN0ZBU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDIvYU12bmszM0JidFM3VHBOblcrUWxQTWMwTGxyM21IQTZSaTJYeGh1d0Jo?=
 =?utf-8?B?QWlMbkdCTWVwTnFMVFJLMExNRHNBWUdSSFdWZDJQRW1BU2ZCWjFsdjV4K2ZT?=
 =?utf-8?B?QUhZMmtqZHo0MCthbVFpb3VzZFFRNWVEU2V5UjJtN1UrTnZpRTltbWp4RGc5?=
 =?utf-8?B?RkZjLzRjdER4UGhRT29iVmxyR0hzYTN3TjBzMURqOFU2ZGVJclFhTy8xMkdU?=
 =?utf-8?B?dnFBRFkyOVJ6S3NQY3ZjNDc1QVBqUXVRY2ViaEt3N1JBa2lFVEFGZjExd1Az?=
 =?utf-8?B?OGt5T0pBWHFGRGNybTR0Z2EyblpJVGFKcTBGdDdUQzFsSlFMVGkyQStWRUpT?=
 =?utf-8?B?cXFXM29jMTkxanEyeUQxdUZHM1FIYVF1b2VSOTlCUzBBMkRXRVNtSVVIcEhW?=
 =?utf-8?B?Vk1IYW1hRnNqSk1nV01VeU1IdjBOTk84cGw5cGp3VWRYZVB6SndtV2N4bkR4?=
 =?utf-8?B?dTZFaWV3UnRpeUpxOTAxcmRLM3FPc1Q4bFIwMk9LWnJZWUF1ZlA2cVFZQVYy?=
 =?utf-8?B?UzliNTN6Y2t0bTdBMnowMHZKVDg3UnNDbGhlUUx0TE1SdUVuTG1wTXNaUmF5?=
 =?utf-8?B?Q1lFMEV1bjZnYkFaM2dxbzBsZUNZWXNMRGZOZDJjLzVYZXppbWhUT1g3ZE1T?=
 =?utf-8?B?dEQycEQ1V2ljVTc5Y0xneFhGR0hpdFFjT0orZjJteVNEd01iT2tKbHJPeXp6?=
 =?utf-8?B?YURJRVRWTk9DbzVOaWxmNVZrbWhEQVZaSFAvSTBBbmdJV3g2YVVnWi9wZDBa?=
 =?utf-8?B?N245VDc0ZndCM2g4UnNnRE95WDJ6SzM4TDA3R0oxRXNBSnZZa0piRG9obG12?=
 =?utf-8?B?eXNxWHhYWmxMNklIQ1VQcEM1RGo1K1oxRndvblV1NjA5WHdRbVRQY3JqSE1R?=
 =?utf-8?B?ZjZtcUh5d0dma2FWbFRtTjdFRUFvSmJ2TCs4TEhNQnB0U2tOandRSExoWmx4?=
 =?utf-8?B?czA2WEs4Sm43T3BsekFvT2IyaUc5NkYzMmN4RjhPaUxPV2dsemxGZ0RyREps?=
 =?utf-8?B?M1I5TnM0Q3ExWjhJZTFHbHNCUHVldVVFYTd5dDNYSnBObG5KUEVia3FmSmtK?=
 =?utf-8?B?eFh2MXNRN0VoU3FWU1hWQ0lzMzRJRDJ3aVIyWXFtbmRaQU50K0dTbHRid0xo?=
 =?utf-8?B?NWowdkJKOEFWT0JMbG00b3lpcWI3NkNrS0ZEM0dhNnFmSUFEblFMZjJOb2lX?=
 =?utf-8?B?bGhvTnovUlc5V2JYSTBHU3ZoWGQrSVkxY2hiTlBqZkxraHZWUVF5b0xrVXQx?=
 =?utf-8?B?bE1qYU5valpwWUYxQmR4NCtndC9FY095eWJWV0puc1FqUFluYStnNnB6YUJo?=
 =?utf-8?B?dUF0ek1VSGloNUd5Z3RVSExEaGRPQS9aSTZBOFdsY3ZONEh3V0tmV1BRRWhT?=
 =?utf-8?B?WmEwU3duUi93L0EyaGtxWEJ5L0NvRGptelFSdU1pampYM29jTHNnWFoyaGVP?=
 =?utf-8?B?ZzJLL1lEcGhxNUZLVWZPYXhxNWE3YS84c1JrQ3YyMGJ2azBBWGJITG5iTTgx?=
 =?utf-8?B?VmZ5d2phSmNnTTRHS1FTa25QYVBiYmJBOFdxQWdzcFVXMjIyK2JwZXV4VEtq?=
 =?utf-8?B?ZGVPemdkMHR2Z3NRNEFTUlMrT0R4QTZYam5lR0tBY3RLalNIT2tDc2tkR0FW?=
 =?utf-8?B?c2RNckNtYm9uejFyZ0RMOXhpV1k4YmJYblRONVZDZ0FlS3ZhRWVRWUQyMzRM?=
 =?utf-8?B?UzJscUFnTEZxMU1VcVg1MkNrUlppaTZHNGh0VTBqRDFNeEJ4OVM2SnZORFBG?=
 =?utf-8?B?NEM1SzJoNVhFZlJUcVFZL2dMY0VOZHNIdGpBeXFodVp0V1V5d1FzU0JxbzhT?=
 =?utf-8?B?Ny84SzBxVTZyNmh6N0Q1NTNPTHlQU3ovUVc0NmxhWnFWa0NQQm5LMWozeU96?=
 =?utf-8?B?TFpTWkNSNmtCcVBnOG5nYW5jOEZ2bWJ1VitVZndyZzAzTjVYallnNTlxK2Q0?=
 =?utf-8?B?RWNUcjgvQS9MbHIvWklrR2djV3VJSTBXekRKOHBSc0w2aUswankrYXlxOG9Z?=
 =?utf-8?B?VXlBWTZKRjhaVXlhbzU2amN3OXRsZ2xmUjhLWHM2TGcrRjJkbDE1U2l4U0tx?=
 =?utf-8?B?aUE1OC9Kb1lWUkdrN1dGV2o2dzNScTkzTnpPcFJvM1lVcUU0Mk5BQmo2WDNL?=
 =?utf-8?B?elk5Kzk2TXRtWWw3WUltMmprTmw4d0hOVStQd2JvNWc5OVNqUVQ3Zzh2eDVX?=
 =?utf-8?B?cU9GWmdNRkxkYjExTHF6eVV2SUhJUTd4LzNhaFFlTGtRZkh4UU1qRHlDQmNT?=
 =?utf-8?B?TTlwbnRyNXJ6UjRNeFA4LzR4ZnFvZHBLejR3THp4eFYweUdHVkxiQXdSVDdu?=
 =?utf-8?B?MlMyb0FMTkVUanhuUUhYUFZjeDBnMzgzUGVveU4yUTRaY2hCdXlRb2pGdC84?=
 =?utf-8?Q?QX5OM/17NuG9Kab0=3D?=
X-Exchange-RoutingPolicyChecked: 1ffr7YXNdApdBzTRhANDyLqZ3lc4Lgw5bnI2ntyrQCm2SG6DWFZnpkWGBlgQqV0EeBMCxSvtAbovMrfrWJGTzR9ATTfiJrGU6ceq1SDhdS6RSvZloyqNqFa6apPqSzp2unnEo62PDXh6KpUaXAHOVRk6WSGHZhYhJwC+3om6kJ8ogGaGEABzpwIT7DfRq7ZbQbyFxWdFswvoe6rr0Cx4XObbk9al3HWy68UONljF/YUhKp+LDptn5h0zQWme4HUVOeaWunwfY8OHlGaqk+bOcQ/86E2Pb2iJ5xghIkvJO3lAfZGA896ynUZPuY5oIL8FhGMDkOeLhl0SB6rnSVC8Sg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 030bf17b-1338-40d3-15ac-08df123a1bce
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:28:09.5782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0AaPl5EsobhdRDP+PLRURRYZuuwJa5MeCMhehbxNhe3sOnFxoXE40rkHcqQ6SCbExOOXS7FDd0bs2M6RxlEf20NnjqO9fzpdseNYTMC/NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-wrz-11 20:32:55 +0200]:
> We will soon want to provision VFs in a single step, while already
> holding the master mutex. Split existing function into two.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 +++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
>  2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index be0a413ee17c..8de8f42ed4d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2623,28 +2623,46 @@ static u32 pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_set_sched_priority() - Configure scheduling priority.
> + * xe_gt_sriov_pf_config_set_sched_priority_locked() - Configure scheduling priority.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   * @priority: requested scheduling priority
>   *
> - * This function can only be called on PF.
> + * This function can only be called on PF with the master mutex hold.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
> +int xe_gt_sriov_pf_config_set_sched_priority_locked(struct xe_gt *gt, unsigned int vfid,
> +						    u32 priority)
>  {
>  	int err;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	err = pf_provision_sched_priority(gt, vfid, priority);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	return pf_config_set_u32_done(gt, vfid, priority,
> -				      xe_gt_sriov_pf_config_get_sched_priority(gt, vfid),
> +				      pf_get_sched_priority(gt, vfid),
>  				      "scheduling priority", sched_priority_unit, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_set_sched_priority() - Configure scheduling priority.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @priority: requested scheduling priority
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_set_sched_priority_locked(gt, vfid, priority);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_get_sched_priority - Get VF's scheduling priority.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index a56e63f3660a..84246978d21e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -77,6 +77,8 @@ int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned
>  
>  u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
> +int xe_gt_sriov_pf_config_set_sched_priority_locked(struct xe_gt *gt, unsigned int vfid,
> +						    u32 priority);
>  void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority);
>  
>  u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
> -- 
> 2.47.1

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 

-- 
