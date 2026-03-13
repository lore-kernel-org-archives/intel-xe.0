Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83DB107BCE8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 22:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847510EB97;
	Fri, 13 Mar 2026 22:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAQTeNId";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B4A10EB97
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773442404; x=1804978404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OhMrZvqOwuLGwHr0Nhlw2WPyRA4+ESol5PJ3tu+lxSQ=;
 b=jAQTeNIdCHpVMxe0aDGIIipemAT2i58BYSGapVBOt+zb/s9Q7lhvxXqx
 xNxe4aEXNEcEIJuzPhA4OsW6JEIm5JNOxLyAkVpMCN+DKV2kpAUQcBY2Q
 g8W2q79MXaab2LRX+QIBLfN/t96lWme5fIK8MmSp2hLxwz/IV2mNZQaxc
 OUDQ9PCjsCxl14w6mqUFjSHFgHETxKflAeAl8ocyjSBVM2yvbCcLv2M08
 hrYu44qQ+ctt4SCv5v6CTsaZdjGCgL2EVcH6MYZaDhJAwfR++6tzOrI/z
 30IY9MTD2LfMwfW98WazXvnZ9rkgyyJWxQYmBnacxzEPV+by6cEbJL+mf w==;
X-CSE-ConnectionGUID: nT5Hlx7tQ0WBgr3W+E4q6A==
X-CSE-MsgGUID: zZjrvwErQIG5cHeAbRQIGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="97166495"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="97166495"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 15:53:23 -0700
X-CSE-ConnectionGUID: Nvmkx+RbSu+PPtR5Rdi5EQ==
X-CSE-MsgGUID: URXlS0zBQvu9FUE+HT0vNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225761118"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 15:53:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 15:53:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 15:53:22 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 15:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUHK7T5HSUjOoLgjPebJTEHwm7hKUA2prWUxlV/8PEomuRygdMAAxNc3F97X5NtPoFi5M2WNz/7JcY152+VOAKo9jcQ86ZDvnKHpYICY9Ru7peXzDKkQCd+VQMtlmEp/FQUa6/9DPJEtEYr8hLX1spwGq3srPlVQYA2ltqW2xh5hTSEXnY4ZqPnVzW+8jS61W18hAjQH4Kvtrrp3077Lx6dw5BKkDIdouR7EeGF7WpggxvPwluaP9TLUrfLmwHvOaYFuyjl27dgg1wPSwQuGaL/pUS/ASTLQicq2M3BS33qaMwevnF7WZ3JABvkW63HCQo2g/GHg6C63W5nfU1MKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs2jfezNUhP8Bd2Rsso6OhpWYaygpXysmSAp7cEsgI0=;
 b=enWZcAYVrI9kD0kg89vWtzu2pwT8/2906x6RaXqIBMpvQMw30EuCkGBx8Pou3qmCeQYvH/z7hO4gz6+7J9jBIk//MB7MzuZBhdJtzT+lH4Ze3okZ19lhceJO2+Wu2JNTELHC9F/wv9MKWLL6MENaU1O2BEdPKfXFwhCqNUw+ChjKObTb3T/96fFMmeQRCTNF9iTOOAHPd8I4h7suoog5BNfNJ/RThuVQcy569RGS6dgI6Rg4SleKPy+imNCGE4M8ddjDZr9+HP3A1HLZ1QMGuM5F7+QIJW7TJQLcT9EcKJshj8EBgEHUpde4WirPQVi9HXHAHNAOooEt1NguAhIrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 22:53:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 22:53:19 +0000
Date: Fri, 13 Mar 2026 15:53:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 6/7] drm/xe/uc: Drop xe_guc_sanitize in favor of
 managed cleanup
Message-ID: <abSVXOEjTjE06GM6@lstrano-desk.jf.intel.com>
References: <20260310225039.1320161-1-zhanjun.dong@intel.com>
 <20260310225039.1320161-7-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260310225039.1320161-7-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: a33a87ef-a4d5-43f6-1ad9-08de815351f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: vDrrEQ+ZxeAINPHFhWUaEqS7esbJW74RDIU1DluZHjnpgb181Gwabq/I36ex2MfIWod9yydFQgaS67BjLyRGCDB9dO6kddZT1n51EteVuQekb8VC+iggNIx+vYT3yGTfSog2l//dpJ3x/+EydEKqX2dzddwMyL9C/ZYNVZO0o9m/XG7Fly1vf0ynhiqVEWKbMpS1PR7lQ0Zzdli/6aE8SK18YOqY5xaR1D9DEWITTL40O+sXN5i3+q9+9Gx9ROOE6Y11bPEF7be4BFEHVTHHh1pRVxRm62BWSK05OCF/h23jpBpaJChFolrdYeNx7QHJD14cCKKlZbVwqmAPovqCaRIfz6g9XfGr4a3cPn0fS9RyjOtPWTIv5/2N2RNl243eQrTzRH2zcWWIX3H25K300QemRjR+THSWBwqs5Zs1UFkg5zLIstEyGvXFCkZyBt/66IO9nE7pKopZJMHUnp44vUBU9WM8RffwFHh78cNDV+Y3kW7lw45ks45u9eBcoVfCT31aRaqaNWDw7dLdBL08gUnwqeH0J+vEislLHE+O0yF75RFhvLugrtO2iyrnvviykO8Yfdb0VCFOD1zJ0fAi2I/GgSSZqhgbf7jluKghtOD5b7+b1r8YCEpTkw5cVm4pyULdGWhKOr9y5cEUaxQCSNv2NXwClr4pD4y11cXwY7k1vfPABVzNRLNpRoRgIYNeKBPE3pWnwBTSFa3IWMpTr2R3tqvqxuTzKIBlFocG+OE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KR9QqYfG0+jt4u2q+GYlTrKjsq+sUsr6h+6O7Ze2lYXtcktLiw3hOdh0615E?=
 =?us-ascii?Q?4O8oHedYoBN/h+e5whQUnEaME56pB1R8ba+yLG/S3jNxUtGVDOJfoTr/24T8?=
 =?us-ascii?Q?64fWMNR0TZKPHL3ReX8Ja31UgagS6DSqZjYX7UCTfdrbiX0ohHA8kfEHRlyi?=
 =?us-ascii?Q?E6bFAahhFQ67OUfsenLU11UuN+0ie+e2iBxIxQFSb0J2EYmTW9ilWRw4o4Ox?=
 =?us-ascii?Q?Uu0RduizgJ7GQa7I2+1AbCwI0RrhmsFLgHbkHPh0yba2KsFSSBpaeXn5eev7?=
 =?us-ascii?Q?eK4SnXZhYNGelzuYBc4n05hpSqOrubRjHnJpZWdXk2l9JcG/6gQJG2S34l0s?=
 =?us-ascii?Q?oVKzQoZLa+seGWSWPowRXGvh0M14FkbWyWyJ6kqx8QF0GLpA6M1KZ9Olz2co?=
 =?us-ascii?Q?6CrkXOSKL8KSAykaPgEshoSv+D9ItRxrb2YCaJ9I/K4CpcrPo4Tu/uE9kyNM?=
 =?us-ascii?Q?7lovPzzsr+zVSYgZxTt89pXz/qsZTYWRDXxzxN2Lw2FJE9bcEvdL8Ji0D8ny?=
 =?us-ascii?Q?eZHbVZCGUg5PvAj8cnQKAeezI5Qc1N8ja2nkGi46gpLMXpI+4yY2dKWmbsIC?=
 =?us-ascii?Q?O0jQaYVMyELyl9hyVIzcP7dTD/0yUJkPYZXTPeLLY29qeVoShLGE8qgHG2oH?=
 =?us-ascii?Q?YtNoBk2C55XsuU6AByRA5yoP88Zn56mHTyddLXilKf80Akyx1IZG03bTLa1G?=
 =?us-ascii?Q?DJDjTFo+HDAo2NKDPxR3dzxIB3GfR7k76Yh/5mpYw9SLhy/zW4S2xT5sucrU?=
 =?us-ascii?Q?o1XnscP01PaZaWYlsm/jQHhv9AE3fAyNFDaiSXfZONcOL+NoEGAtehCniepF?=
 =?us-ascii?Q?akkzFSzugW8jOjqo/N7beg9uAb+551tCA5g7tGJwqEwGjobm6z3rBgYO0tCX?=
 =?us-ascii?Q?pT/ISwSvtsP/Fl1sMnAO9w9cYqhP1J+0Vf+RQBte5GIj9QIlUm+gdtJTasFp?=
 =?us-ascii?Q?Xw6IWBnACbizvcIT3Fd+FqRgvMZCIn/zZ9qlRn4K31HFD50ivpUcon1PSPay?=
 =?us-ascii?Q?iHVUTEkA+trvNsxjv6Pkh2oanmQMWS6UbKvCFUIxt87qRNSsH8dBzV69ImCl?=
 =?us-ascii?Q?1FOM7bgVBgmqBPQHuQP/mK5UiR7Rj5AhpotbgF4YAYruyDioD3B4rtcDAi0R?=
 =?us-ascii?Q?edPw991/gRg/VvDCHzKtu4wl+a44z3M6wvdKmmShy7KMUOacrCuJEV/qZZTp?=
 =?us-ascii?Q?lV+rUubgghkwGo74p1oy0dTN3w0Arc6/AU2vME7dPDJqIYB0NgX1p/x9WjC4?=
 =?us-ascii?Q?+p2JTtEsGzytOH0gKRvNb2X9nMCETQM6N0aO5iYrMQ1R3bEWRVzLxcpmpP+b?=
 =?us-ascii?Q?CnSaO5bzyNy9jspxwlcNuVJan+hfHlhJBTpHtWS23HxqtppF001i4J0XrV+B?=
 =?us-ascii?Q?aQ6LvmA40uk2yvQeYEEngHytK1Uet9Q3+EX6+MjymSw9YukJXtGl/o25xS0R?=
 =?us-ascii?Q?nVjbFmKOKaOgwzHWvbbssFbZx4rWm/A6lyEPrRoNDYUVhtIN53oyzseHOKRM?=
 =?us-ascii?Q?hEn35amLR0TnCPGe09/BDhpzwxYqM5ot+XdTgp9UV+tBKSctpqOtqQ8Ld83x?=
 =?us-ascii?Q?f2RfOZ4taoZKQytuwFuYsMe0biIQoCny4GaKq/lK+Ql2vRhUkvFsyV7jItnn?=
 =?us-ascii?Q?wdY3/xrlE8UcZehwaox6uSdlSOB4hWMRe3mOK0V/OATM8bgw59rK3RYmDDHX?=
 =?us-ascii?Q?TrZLzwSoU8Aexv+asTsBWMbODKjG/PchOZ5TRKurYW/KoeFWrarREdAPXKKq?=
 =?us-ascii?Q?JVzm0tITz0dtCE6go0OcbnGHfLRZfWY=3D?=
X-Exchange-RoutingPolicyChecked: Oo/aDpOfK3rO9W1jMJLAjbYFecbc4GfrZrFKB8DwMwhiOHIyadhYVA0DnkDJYt91b3r5vdk7W5wb8PxEzU8bVHf/43sYPHtOAGAkKShvHIHgttQQcv+ItfC9qxn/6PBOWSTfPYfUH/H4N2WxXabHkLparoSXk7HvcLNcS7iYDZLAh7EoKIF4BHTyqgKtBIZ4QVcSev9TnPIa+Y58gzcdOsFqqzRxDD8ZqCICFwm9QmclYvrJfMGWdPBE5zyPJeYj2opEGrnuzK+I4PeGisY3Nn+yiGf/ighYx2N8l7cywj4GO6vlUU0jSC2ArmFtLTrgnjsxnH9yVYtICz/96TjCGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a33a87ef-a4d5-43f6-1ad9-08de815351f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 22:53:19.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xxh5sCuCGcomjYDTL1w4dTk2COdLxHB7X0eBFXubQ11T4ThIUJdKBnolMco33xVXe617T2lrvatwGyVSaMlzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
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

On Tue, Mar 10, 2026 at 06:50:38PM -0400, Zhanjun Dong wrote:
> If the firmware fails to load in GT resets the device is wedged also
> initiating a GuC state cleanup.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index d9aa845a308d..75091bde0d50 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -157,23 +157,19 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  
>  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>  	if (err)
> -		goto err_out;
> +		return err;
>  
>  	uc->guc.submission_state.enabled = true;
>  
>  	err = xe_guc_opt_in_features_enable(&uc->guc);
>  	if (err)
> -		goto err_out;
> +		return err;
>  
>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -		goto err_out;
> +		return err;
>  
>  	return 0;
> -
> -err_out:
> -	xe_guc_sanitize(&uc->guc);
> -	return err;
>  }
>  
>  /*
> @@ -205,19 +201,19 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  
>  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		goto err_out;
> +		return ret;
>  
>  	ret = xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		goto err_out;
> +		return ret;
>  
>  	ret = xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		goto err_out;
> +		return ret;
>  
>  	ret = xe_guc_rc_enable(&uc->guc);
>  	if (ret)
> -		goto err_out;
> +		return ret;
>  
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
> @@ -232,10 +228,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
>  
>  	return 0;
> -
> -err_out:
> -	xe_guc_sanitize(&uc->guc);
> -	return ret;
>  }
>  
>  int xe_uc_reset_prepare(struct xe_uc *uc)
> -- 
> 2.34.1
> 
