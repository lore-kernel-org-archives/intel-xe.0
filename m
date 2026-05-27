Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8435ACD5BDE
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 15:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426A310E265;
	Wed, 27 May 2026 15:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEPwoZQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F1510E265
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779895933; x=1811431933;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t6coOpF2/UXa44fr3tU1oupMCL6C9CjKthbzn7eZ76k=;
 b=CEPwoZQ31TIHK9eLT3inY6qql7+DFpt2JAeT45B6NPO37cMYCSwifiq4
 OFgXZt0pBHhKQ/STgwgzyxVKhkD3uOYVedzo/UC+FDMiIATLR+GqH9wIo
 tHEwp/Cw4LYSgIpfhIrhrw15cuFitZdZXHlI+WqEtvzWfqCqoQf4ysn8M
 MA9SmVxwhjqczOLSRB5jqhKTgIKmM93IR1xjYHJnPOGPXCnU8pp+dnob0
 eiriKgHn+rVGB5k68PJb07EjT3I2k9gK9KIpZ1+Okr/l9xyQYuk3By5LE
 AKWu42SlnBqFLLE+U6QpTlbyWnujJTYK2vJgN7NTrM8X1MR23z3ynJJYQ A==;
X-CSE-ConnectionGUID: qBRKA+j9SUK5kGkQ6OREAA==
X-CSE-MsgGUID: VExDc06+R92ZkZ2VTSYKBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92203422"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="92203422"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:32:13 -0700
X-CSE-ConnectionGUID: /fNNtdQYTFKMjEbQ6gu8ig==
X-CSE-MsgGUID: 7Sj+VkvxSgmvYMPT23clMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="265886889"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:32:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 08:32:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 08:32:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 08:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buvKAqZDZ+eTHnGAybOLaLFagAPljxxQgOjzFVLPFt31FDYkqAwiDftUIGROzA94wk7sWf2wx0MfgNf+ictFi3PgVLsToIlO3DJ8S2vuYEjnwitphu1HbKITeKp28EnwuSDmNGc+HD22qwPbgtVwqQVTRs5EL9jNL9z569ObHOYQAAEXCpWWC1Xa6+GB26+3CcfS9ZwB+R0pj6dAR6IolUvEOZzhaumM1SHaJduxCICYLjKoLZvz3Ho+rM0Ypq9InD8CkyGx2RoF6fkaKekYQgKA3iLSVH6vo3A6gORk9M/flLluk2AsakBuvabtgW1LYNtGvvku9gX/KubXMH64YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbG7oNMsC5jatvD1CUxDGRznt7bH/g0+2FLNfF9M6i0=;
 b=d8VsztJxtXaOXVgntMBJszPNWUdIaxobfQzkrVdm5uMrbl7Kpk2EXmDyRGjZQyGgvJiir8JEizVxA3PMK9G9ekld0uIwWxfjwtfTNHyTFxHTPBNuuEy5CACMcQI7L1PbAV36607jxVYEEhOkL9NrChbRsKnyLtAVwMbv4W4dY/nuf9zh3zbiznMiA1P0uNxaohp7WICD01YDKIebYkFv1HPqVEHo67ixcIpkIsO6VcjlgvFpvlLttGJ7F7jSq+qdofeWytax6mEAbcnmcKH2FNTTUo08ztDMg8VA+uAUAVvz3vA0J2L9L9YHkYvZ4YJcataHGbQCr0iUQAx0P+quHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Wed, 27 May
 2026 15:32:07 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 15:32:07 +0000
Date: Wed, 27 May 2026 11:32:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Move xe_uc_fw_abi.h to abi/
Message-ID: <ahcOcsiSvCL2bAoS@intel.com>
References: <20260527112608.22448-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527112608.22448-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 426aabd8-6134-4547-775b-08debc051c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: S23r9tjOgv65waSaI0C3FHQuMu/J2tyteltyZ1n90zBtKirSQqxIjoiHkI32dMa59PLHd+uSCJZqhGXE2PSIhRNrwUr27EZxQMt7/koQr/pOijIf+oMpy/qN/WQ30/1j+MWyP36ghpd/i10CYTr7cm9acoVzNn7TkXaCgZEyn3DiFm+UzZBhNnOL5jz2/Ui4t/oeojnOozsOX+Ezdem3UEVhEV20xeonPl/C66IdGnCyu+K+zW4kPPH8o8S0PkrkcY3z9xY3vaherf1hBo4Gl65C6PwDxlGtLjBk3bP5N/3fBmnGneGOtBpMucsRnVzKRbwpAdya+0lA4/lmPk4pHrjmt1Q8CIEHZFEGY93IF3dV0BK/kjUtCtf4T6xIVL58+JKowhVPMT8N/kjI8QEuj0S+0jjbmMq4tSrOlq7KwvL5rcmBGp+diMjYCgD064m0GgKMMhPFEepIkBlbs3UonA1LXGJJzB0Xmzk6qP2xncsRs6OJp8TZod1iONTZbkmEEJT5EXiRTM7XETrhxIWymyB2fLRoQfJskNfMI9q2c+tRji5w7brrFzFoG2RCZgIrq3Smx1INrbt5u1fwR5yFsoJerRBGKVC1GFbP1K0VwTfbChvAsq2yZQxuAcn5Rz71k8JCst3I2+D0YnZ7e6sET8c2Ez9jDFwJNCWl+2Dds7se5KVp6QZWkRA1CieKLiyS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uMKdcmkeLnDaXesIfC/e5y3E72HyVTVTSk5Z/77mInapNu6cUo2P7ObIYO?=
 =?iso-8859-1?Q?hW1+EJDWCBJTzoXDcqTxP4HG+EhrCppVuAAoAyCU36WIdFaiyQyGGmCBJR?=
 =?iso-8859-1?Q?hRniugiv7opPscpuyCeq/8uE8LpYOE98P5VEQZC+iBPqfpDrxd9qGUyGVh?=
 =?iso-8859-1?Q?J8Dx7qdwuv4I5L4bds5kROescOE5rf/ru5mPa2yMj9KwLVZtupRxyf2edW?=
 =?iso-8859-1?Q?uFDCi+XAnciHnwn1KXTK+quBLmiWgs7lNclh2uvj69B5FT7e7sn3u3J1n6?=
 =?iso-8859-1?Q?gzWxUY3wDmI+2/jH0zJ+B95t0HeGxsvb+z+lMCNW8Ye4nwT7lU1mfhCQKU?=
 =?iso-8859-1?Q?Vmxil6N8nlQmEnKrZyTXMpwi4KE7If+1fmvfnTCtvLzZivXP8zlmhlSVhM?=
 =?iso-8859-1?Q?P31eLpai+Sd3DuVuAB7usCXtMJ1L+kEKAf5CiIBvVspUIlgmmiAAo+7py5?=
 =?iso-8859-1?Q?ZS5OD8HAQlgQIOnjAIiKT3mHM2gPnat8qCUIf7Q1Ozv9ywZPz5Gi/FyBfJ?=
 =?iso-8859-1?Q?lEDg77GvJH5KD/NVrgdZC21zwVHRsB1qbhNi5EhkRbMC87mkft8ddeAa3G?=
 =?iso-8859-1?Q?r8BK2RT9JwERsQqwsl41R3/Ynemwcy2PLs8genMQvlPvp8uqybGfy7LWq1?=
 =?iso-8859-1?Q?tZDi/hXeB7DgwxBBr9uMX+v94Td9B5IpuN5OLReOuMD0CzbnTy9vcoVcoF?=
 =?iso-8859-1?Q?viIRkdhpFRabzqUCva1IRus6vi9Xj//WjHQAJudP5Z1cSj80O7FrSAIj8K?=
 =?iso-8859-1?Q?rEPdtwA823CW1dQ3xhZ2raMM33O659I8gY8M2ujfHxK3MHIlQ6jE8K1AIK?=
 =?iso-8859-1?Q?C1LaW/uUumdd3+iauoeYlJQSluomDp1sSF+40xBsBpWYfDZePw2gBtZkDk?=
 =?iso-8859-1?Q?N+IWO2YYpJvUJ6PbbAFeuv1xeTaq5weLCkkJhACXY1nOJjrB89k6yrt8fS?=
 =?iso-8859-1?Q?hhvkiaC22FVcwnQ7FPbvxmoZ6/jow5XePu8oI34+S5XZeh3hd4/+Z3SaFE?=
 =?iso-8859-1?Q?8vic9Rp9VRSD28WJGTiAiPNDH88yfdO8LYMPz0HTfQshoGTFadwGHx9jFI?=
 =?iso-8859-1?Q?tfaX90oDuyWc/snqLguWpmGhn5kqbBLv3cvqJJaeFrSdi5P+zhY2ICYkBW?=
 =?iso-8859-1?Q?U+5lc1S7d441WCehR46TaLK0HJEjiUmV0N+waYGuOu5hAQNd02l77dhDfA?=
 =?iso-8859-1?Q?dyP0/bkFWrcbQ0DcuK+jgpHlSpqjeiG+Z3X4XJ9BpM/lTREMr8VguVlx/0?=
 =?iso-8859-1?Q?eAOYWIr/oSytwMlK8uAuJysbJnlV8qFSaiZIoM1nQ93pAQe40JyVdG6IkL?=
 =?iso-8859-1?Q?NEuppoJ9flsKWM76hCiZtoQxP8xJ6oma8ZJ4xVpuasiZN8Dz54YII+9Ast?=
 =?iso-8859-1?Q?ZyWj/XzZ092eCv5C1ixdZFW9DYwBK4LYf1kS6EBBPHuWcyf5e6dmWc5l/c?=
 =?iso-8859-1?Q?aZx7iBdWep2rooV/wILrpGB4ruLhP0R4XjH1tFOvk8SHvtPv0hs3SSUwvW?=
 =?iso-8859-1?Q?JOnC/F8sJKdxD0+1XAnIC/F4PXp594KTygFKPWU+sbdnnPGVfUvvq11Xw2?=
 =?iso-8859-1?Q?j/SC9DrFdLm+CCUKaCwROv8o7CPMu0FjiHPwyp66pVX9YbKNyRJpydQvRU?=
 =?iso-8859-1?Q?dQksN0AJLGUgrLA9mrgGFuxcXnJdFiABBFdLAsuOMvnK3F4bfZDWBbmciv?=
 =?iso-8859-1?Q?BgUXXRnsdfQeIJu68mA7O6lDgvD6Mfr2aIHfp3CtM/b/PwhcmPXb8JPiqk?=
 =?iso-8859-1?Q?D+yfiyD5nGKwHiShVRWRdbJ3i1vTNn4WTYYUeVmjSSk5FZP1avPJpvRNcM?=
 =?iso-8859-1?Q?fvfX85gGAA=3D=3D?=
X-Exchange-RoutingPolicyChecked: hG+qxNFtfzWfS79jSklNdHwc4HYEggSmutV7YWbIQn8gjuv9m0anhqRvVOotIJNBNjujetpbFjfCyKDtN5s/elb4flkCEirW3m/FE2z+F8Ahu2AGGXZbQUhmr8iQVepRDs2BiU55coBezLEK9bi8/3o6qhxPv2Am6ksj68mjHndhCURVFZvOH19g7vxjuQ84r0raTMqkn1czGKrdwLgFwsfcjKCocHECFxLEJqTL0UFHoVXJf4rTkrrbKdMP6R/IdoC62jmvJTNkGFkCMSRfbQatXz0xItj8IzNbtRTfnexGV+jxCuscpqnKU3B2mON3kH/MpNhpfNmT2jpW90Ws7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 426aabd8-6134-4547-775b-08debc051c16
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 15:32:06.9522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z0jgbwX+pQ6pW/YqoMHUkfMGewAR9x79vmRuXXeRsWikH2mulqo21jOk+Nz9QLwHGL00GP0oTh98u5GegrA6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

On Wed, May 27, 2026 at 01:26:07PM +0200, Michal Wajdeczko wrote:
> We aim to keep all pure ABI headers in the abi/ folder, but
> somehow we missed this file.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: fix documentation link (Sashiko)
> ---
>  Documentation/gpu/xe/xe_firmware.rst                   | 4 ++--
>  drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} | 4 ++--
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h             | 3 ++-
>  drivers/gpu/drm/xe/xe_uc_fw.h                          | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
>  rename drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} (99%)
> 
> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> index 9c15a300bc62..d3030d1c9a84 100644
> --- a/Documentation/gpu/xe/xe_firmware.rst
> +++ b/Documentation/gpu/xe/xe_firmware.rst
> @@ -7,10 +7,10 @@ Firmware
>  Firmware Layout
>  ===============
>  
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
>     :doc: CSS-based Firmware Layout
>  
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
>     :doc: GSC-based Firmware Layout
>  
>  Write Once Protected Content Memory (WOPCM) Layout
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> similarity index 99%
> rename from drivers/gpu/drm/xe/xe_uc_fw_abi.h
> rename to drivers/gpu/drm/xe/abi/uc_fw_abi.h
> index 74b888904fdc..198e949660e0 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> -#ifndef _XE_UC_FW_ABI_H_
> -#define _XE_UC_FW_ABI_H_
> +#ifndef _ABI_UC_FW_ABI_H
> +#define _ABI_UC_FW_ABI_H

I was going to complain about the duplicated 'ABI',
but I noticed that we already do this everywhere :/

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  #include <linux/build_bug.h>
>  #include <linux/types.h>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 7fdb24e810b3..ee5efe60774e 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,7 +10,8 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> -#include "xe_uc_fw_abi.h"
> +
> +#include "abi/uc_fw_abi.h"
>  
>  #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index bb281b72a677..f2d3a3e7208b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -8,8 +8,8 @@
>  
>  #include <linux/errno.h>
>  
> +#include "abi/uc_fw_abi.h"
>  #include "xe_macros.h"
> -#include "xe_uc_fw_abi.h"
>  #include "xe_uc_fw_types.h"
>  
>  struct drm_printer;
> -- 
> 2.47.1
> 
