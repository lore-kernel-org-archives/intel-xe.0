Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F37FCDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 09:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5119710EE41;
	Wed, 24 Jun 2026 09:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOxuEGop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ACD10EE41
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782293991; x=1813829991;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4k7KzMxAHlBUjCYV9FgODTXDeIP7KLsAD7WYzUyddlw=;
 b=KOxuEGopu9dPu+fquGykoj8i03Xss6NRpQi+9OKYldYIZap5UiJ+0GTq
 o2v8lln2s+Ikao8l0xR2eXE4qM24Hx9w+kesA/3NYTwxFYS7ZdqcWbaWi
 yjJuqCKjw4qbDXtQduedzr3Od+3DOp8T0mV+J61rLKuOzKZ1cQ4pypmfD
 kIJnCkNrl23pJDSDiOEhmnag59GEgJZWvmOLrCbqccftVNTmKF0SAWWDG
 AbiALgPgNvTqJPSnKTJkJQe2HbuU/YfzWfC8ff5CY6WYzlVW41KOQ9k5v
 Lwm3di/wvdEyg4lWCM4Lc3BaLgp7JxAQhaB9RZT70bfQneSPxOiHP04ci w==;
X-CSE-ConnectionGUID: io3M4ihmRrmuVdA0z0TxhQ==
X-CSE-MsgGUID: f0x+RSKlRN+R5+UbP42xSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82821876"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="82821876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:39:50 -0700
X-CSE-ConnectionGUID: 8CSsprdvQfSMoXCcpjDCCA==
X-CSE-MsgGUID: nswhPESySiG3onicGSNrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253671791"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:39:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:39:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 02:39:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0L2ENIzAyvCej5bvWioHI29uJ1g1A7jdhXR3po+CCQarQfiozi9mNo7KVlHpJeq0WNMAa6J4GWDZTa1gvgvf/0cuFB4AltSNFQJgsqkza1q7vE1eFDibi0vu52sMX47WunuKHjLLL6xsGZ2zSOD7mKu/63AG8QvatGJDo+5szfK5sInmORHChjvlVuEyaM7hFGC/0KOqVOjM1MhAnXO6eVVkAA0WC24jKq/z/EYFfW2JOciGqIUVX6A0Dv/DX8R63MJU1X17ycKlnLeM8Y8gO54DOVOgn8sjSxUmbsbhpBu/7uiDBInIF06Egq7ZCTr+8z2HQuG7iUF/9WK/SggFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqyMFy0mcHD4AM/vJSoQdCpSR6pemXn3yT4XYvcdmBc=;
 b=iLgBD04Xa6Xnov9ISrM/Nt8wWyFXB3WZkF8T90vpWEjcqVZdNfTlJGHu7hROBXzyGuWO8uS82mVfNqn9FZ69kmy7Iy1pxrGPMaNfcBq9HXVhr5kN74eK85fEsig7gfxH5pTl7Rto/sCBlyz3uOKJkCcqbPHLoultoVfcH180VG8O5AOjZpNuTgyyaOsB/wqJ4acmpCPkCp6NH9NTrYbBEmVoL3XwvFmbThD1wI9KcDi1IW20x0ypbBgi5FjRLYndIiKizgPwk3mJT5gAMx6iaq+/KlyvQcTbJAel3JZBA8UU5UYeK9zhWHyjR/E33hLs0hA42ABc00z4sxRsqD1Xwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:39:46 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0159.015; Wed, 24 Jun 2026
 09:39:46 +0000
Date: Wed, 24 Jun 2026 11:39:43 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Don't attempt to process FAST_REQ or EVENT
 relays
Message-ID: <ajuluT-E_nBECE1b@nostramo>
References: <20260527183735.22616-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527183735.22616-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|IA0PR11MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: b42539c3-6669-4900-7c33-08ded1d48734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LVQzl1FZBJWNiK9dylTw1wm4F3oXjzXu8pDYzHP2sQKFDqSe1QfpySTdsJGAVs/Kdktwt51AJtKL3tTrL0JwwIN8zRp5u/T7paBRWO7drqEgY6uqscZSqlade2VcI+FAsnZbcgS/dowj/snQxfdyEqamyITueQBjUGPmKB4r/g/H1vWxqto9CUBLJ3YsvF/SGkOPMLWlH1PxcZtna5H5f2rjbGJXPgbLTrQghwLe/AAnIgvjJ+dJ8o9CtgwAGh32oa6Rh9lYZzgUtFx36TwxyueRKq1i0QqOQjgtCqdazoXzlAsnRdkyWZJRCnwiyG1VLgAhUriPEcu3sO2JLL0JXoNi36sS39xMUx865wizB6vEHws4cm22ksqKroswesMcgCNCNKOHaF220VE5qJ5NTOqKDiFHz2od2iyehIZUhZx0zo91UZq0GC026xBP0TK2xqn3IRtCJZF606X0nj/Zf6I1D86OySkKsz0e/jHz8UM9O5h4PLbVcYkR0fPCJ9N855giajsQxbEfKIDcgmQZDKkZKs8dlwRTQMGZjvHHUX8Tg4mcplSf6amwO05uXyRiw8tXPJzh/Nb4h7mgDzcc187YXepmtvu/iAvEJ8Vgj7njRceTFunNa0YLQ3Cb8sKLUM9DHkDaJ0J1rdpQdjzLh/DTSn+Nma/Rqi/FTu5boh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE14SjNCSU1UeG9uUEZNVEdxV3VuaS8rMnoyVW5LbEVrMTcrOU5mSUVmYzN6?=
 =?utf-8?B?bHQwT3A3OCtvMHBQRjV3QVlnT3FRYUhsdTZLZFJiNkYzRGhyUzJOTmR2OTE4?=
 =?utf-8?B?c1ZVRGM0K01RTm5FNW96TFlLK0FIZzVJT2l3QWxrTkFwWVVyRFhmWlF3RWtF?=
 =?utf-8?B?aVgzT09sdjVDOWNFQzJHcy8xN3ZKTzhxSWxFc1Y3R3hvZUlZckwwbENrWjU2?=
 =?utf-8?B?TFRWaFpocnRhaDNSemhqTXJIejJqcWV4MGlGL21lQXd4ZjRMZmlZY293SzFw?=
 =?utf-8?B?ZU11Q0ZCNGRvamRudHN3UDllZFR2eW0zMDFIY0FvdXJRTURWUnNDRjk3TVo4?=
 =?utf-8?B?RUhETXFpSFJDRnVwcEtSSlAxWUMrR2hWNyt4dE5aeXhJMi9XOWtROUJkVVR6?=
 =?utf-8?B?MjhKbXA5WjZ1Z25sTzJZOXlzYlJ2YWtHK0p4L0Y3eVNWdThVMmpqOHRVV1lk?=
 =?utf-8?B?c1RjblFLSEZnMmpPajRtZjVlZ01COGk2NlJybHNlOTVOSXpDcXNXL3FLQ2Z6?=
 =?utf-8?B?N2hSWk54U0RtRHh3NXhBTzNBcURrTEVFWko0MzlXS3ZCU0NHc0hwaW5NVmNE?=
 =?utf-8?B?aE1jWisrMUh3TUhYQ3VpaGVtcy80bEM0SG9DZEdjZDVxcmlQeS9IOEh6anZp?=
 =?utf-8?B?WTQrUE1GQUpVTjl0RXFwOG9zekZOQ21abGhvQkhXRjNLL3drQ25ndE9sZ1Zs?=
 =?utf-8?B?TzhVV0d6Y00zaEtUcVljWGFUMjVjV3FZZWZTWDRDNVhQa2xtcy9lM29md2tu?=
 =?utf-8?B?K05DVlhhQVBsQ2wrN2FnSkE1ZHpkSjREVTNyM2tqZ0ZEQWlPSUE3dU9MQjNa?=
 =?utf-8?B?dFVzclZ1YXIzTm94NjFLb056cmNyamtqVGZYd1VqSFZsb1BGRXNLTFlCMWdN?=
 =?utf-8?B?dU5SSWplRWpWWHFHcmtqNXFYUjliZVR1d1RRT1BJRVEvem0rYWVibFUwa1ZJ?=
 =?utf-8?B?SGw5NUJPcE1LR2tZYnM1YTR2cTkzdDJtOGpMSEd2cld0QnZNK1pQVnErSXZq?=
 =?utf-8?B?TVludGgyZ3prSzF6NE04UmEwSkhoMTNzQitONTRVY1JyekhBTWpRMWFVS1Iy?=
 =?utf-8?B?dnlNVWdwRkxUMmNaSHppeEtCRzBhRHN4SlIvaE9MWEFZbUxSNTEvTktXL2dv?=
 =?utf-8?B?SzZVQkdJa0JwSGZvcjhvdDZnZ1dKalpicG1wUkQ5Rnp4RHFIa1NKZFNuNGcx?=
 =?utf-8?B?TnhZdkxacDE5bmVnYWsyTmdMNHRzWGE1K0diRkxzN1F3czNEUGtZZkloMlZz?=
 =?utf-8?B?NkxCL2tIWis4RlRSbGhFUXBvWFZWSmdnSkRGamk5dGJwZFJTb0Urd2FnMlNF?=
 =?utf-8?B?TWplRDJlVy9oWXRPRmhZM2NlaC9UWnk1MnR1c2N1cDE4bzltNk5VVHFvSnRh?=
 =?utf-8?B?T00xdmt3Sy9qem51VExMcUE0MTFCVE9DaGFHVEZKN2VaL0djbGJ1dzVWNmNw?=
 =?utf-8?B?UHEyR0hGenpWRCtjdzNGekxadlMveThPT0M0RDZ6ck9jRTAxMUw1enJIUzd3?=
 =?utf-8?B?ZEVPRmpxUzVvM3JXYjNJSmdjdG9tZCsyWXZzak94ZHRtdlYrRzBMVEtVSTZk?=
 =?utf-8?B?ZHh3RVJkaDNoT0svWEt1RTF6R0d4QXBXY2V5bzZBR3dVMWo5RW85MzMwWXNq?=
 =?utf-8?B?c3VZV0s4bGE2Snh4ZUZNbWhWK3VVaEh3MlVUV2xFbGRvQWIwYllsYjlySm5C?=
 =?utf-8?B?b2NVK1JHZ2lGeXhVV1M3SWwyQVFPYkJ6b3J2UWJLcktIbVJkQ2lBMlpzdWMx?=
 =?utf-8?B?N3pYR2c0YjVkaVc4RGs0R3dNQjFZaEhQZjkzMFNHdm5BY1IwZ2lncTRsOGNN?=
 =?utf-8?B?dFlVamk5SnV6OFpJVFlwMzEvNE8xQzNrRE5aRWFTeDZsUTQrUU5WV1VrUjZo?=
 =?utf-8?B?aHQwdjB6ZHVRYlNhM2c4emFGVCtkdVpuSEdiNVBkejZzSDBqaVJuc2NDblI1?=
 =?utf-8?B?L1pqdVBtSlV5VGE1QUR5cmtYWG9tOXBUM2pkbUlURks5VXU2L2pUbjh2ZjAr?=
 =?utf-8?B?alV4VGdmVm4va3J2czJyajBnSDZHTDR1VFhBd0M1dDlmeDhSUkY2bGFGWFpo?=
 =?utf-8?B?cStPK01GVjlxbzViNVRkRlN4cFgwcGVpSjBWd1Z0ZkVnVDRsaUpmM1g5YW10?=
 =?utf-8?B?ZmYzWUhJWlptSTZLNEg4emY2YXF4Mm5VcXQ1b2pWS1UrUEFaYVZWM0NSeGZU?=
 =?utf-8?B?NE5wY0V1ZkpDSjVabzVYNis3QXp5NWNtWTNoaUJVTmlyQ2hKUWdIenpJeUk4?=
 =?utf-8?B?Y3lLT0tGY3ovUFpyRmx5QTRyWld4UzdlTjZ2dDVvcUNBSHJSQnVybjZiRVFG?=
 =?utf-8?B?cGZDSVJrWXR0UTVvSEViMHhhUGFFYXZKQUh4ODFPN0grekxEb3YrdEpNcTF4?=
 =?utf-8?Q?LDf2LYYeLHg5QlvI=3D?=
X-Exchange-RoutingPolicyChecked: tP3ShiaHY8uTVt8A1yan1d46zFm9di1pem8geAOeIX5TMZGMPsOJT6Uw3sIuksKmk90JfOEJAkCHpUKtWdtekDMQw/eJi1GOpIXT+zbRtAZDLTcxOv+8V1nS+TK5GD+XtSMIq/9c+jlTL+xp7Cyeik3iOXcyLRKgwHJuas/46AP40/eFWdlEyPZ8jkoCESoDPiD8uUajLyfyP7PcR6JKxI/Vu4+LBp8ZmDWd0cR9xkxSHIGlbNvZvzRXQWRS1zH07cw+mtFSzCpVaU3kpW2ZCQuLzOOinSHxlESbPnrMNnTFjTSRH7jewRlO7oZIcvflt45CtWT27j804Lnf3GKNWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b42539c3-6669-4900-7c33-08ded1d48734
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:39:46.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeufpgbSvfK8WeLaPGrjdHtK2QZ/ESPj74VAZSQ3RKJkhd7F1j5DwpLZLGIG3ofcZe0VxN73VFqGbG29tdMQqgRDI2o9I8WGveBp6NR5BmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
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

On Wed, May 27, 2026 at 08:37:35PM +0200, Michal Wajdeczko wrote:
> Currently defined VF/PF relay actions use regular REQUEST messages
> only and the PF shouldn't attempt to handle FAST_REQUEST nor EVENT
> messages as this would result in breaking the VFPF ABI protocol
> and also might trigger an assert on the PF side.
> 
> Fixes: 98e62805921c ("drm/xe/pf: Add SR-IOV GuC Relay PF services")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_relay.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index 577a315854af..eed0a750d2eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -689,12 +689,17 @@ static int relay_action_handler(struct xe_guc_relay *relay, u32 origin,
>  		return relay_testloop_action_handler(relay, origin, msg, len, response, size);
>  
>  	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
> +	relay_assert(relay, guc_hxg_type_is_action(type));
>  
> -	if (IS_SRIOV_PF(relay_to_xe(relay)))
> -		ret = xe_gt_sriov_pf_service_process_request(gt, origin, msg, len, response, size);
> -	else
> +	if (IS_SRIOV_PF(relay_to_xe(relay))) {
> +		if (type == GUC_HXG_TYPE_REQUEST)
> +			ret = xe_gt_sriov_pf_service_process_request(gt, origin, msg, len,
> +								     response, size);
> +		else
> +			ret = -EOPNOTSUPP;
> +	} else {
>  		ret = -EOPNOTSUPP;
> -
> +	}
>  	if (type == GUC_HXG_TYPE_EVENT)
>  		relay_assert(relay, ret <= 0);
>  
> -- 
> 2.47.1
> 
