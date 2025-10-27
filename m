Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0FECCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86910E192;
	Mon, 27 Oct 2025 20:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNRlC6U9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB7B10E195
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598709; x=1793134709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S/Xvh6xUljaij0dFP3+Z5jKi3LalUMiQDuKisw8Kv6M=;
 b=dNRlC6U9Lb5BMV0EN4wH00Fbcb8GjBrPM9/wB0hX6a8XYpwumxpsAGRn
 XITGyqOkU04zm0a7YsYARxDuekDYoN/CT8175qM7GDcuSw8wcLb/6OslT
 ZLLH2+4Xs/uFcJGuvXTjFNkMPa8OO9Wi6iGrznvzGHXughDZiVc4mXlUK
 l6brO893x0YCQRBjiyd6xQJ2NUAZKfUpYtIiu9aMcFVULKqTIKSLfI1qS
 9WKHyxtZvuKYU+h8U6n9F4a3VoFYCMhL325LewuW4z7Dkd8XRjKokW+98
 VjF3al+k0zMinEeM1xPQvBgPW1mALRGEkODLtGHwda2c9qzHtm4Pci/eG A==;
X-CSE-ConnectionGUID: /D1By8O6T2ewOriJhohn8A==
X-CSE-MsgGUID: JDneoS0iSq21tfSDwK3M4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74366080"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74366080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:58:29 -0700
X-CSE-ConnectionGUID: CGPrhdO5TIKLvAbCgrT8MA==
X-CSE-MsgGUID: 5ujBhLFFQWejiadus1zOyg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:58:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:58:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 13:58:28 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEFlJDWdrC0N2ANP+C/MWfRcD3UDwLvXiEjYOpbX4mDZg1HGaXzXKxtziDr004rIdCAAAj8bCkxP8OdzRVlbpoF1WVl4ro20SY3MJ7TwgT5Eaz4BVoklh86CJNs9Mkh/Z2VZwTBWdMqyGBJgK3R3KqPZgSE4sYgAvlTVCVolJF/zBwocv+ETzgqaAIUN/twV6xA4GJEzmcIP/H20HHLgMG95xbdWVIemikqc6fyku35zyjxKJrKOJXYVS9gy8LZolUNbJcLo6j4OYnD1Fx082Yq/IqzK2ue4OF0voENoFXLrxLTCBeoERC3UJ5PpKFSWYllge6fKz1LoUTL9c7v+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdq3aBLb6Xtq2b75m/73urERxVrewBM+ACHIqTUi5+0=;
 b=a7S0KP0TXIN+u0BCqobapV3qNQezSYknggkj6V8BWoBsOIeKLzpy9hGhxPCTCxKDrMmoz7olr00wmF4ARXZa5ueR9zcjJNH5w0rtInCgpiraV1qSh/1JY6k+vmO8qYT2pXu+wvKSy/Ja4gfrxvamarK8dgr9Ob1PHQuYS4ANTNwQc/QeL/D56SCf6LfBG3wpwvKB0K2JfpZ/RoDJkmHMPBkAgVt2CojJ1kD2LLrrZNTHPZY8gKUaIT7Qgl2gZ3jBnXt3LG45QTLkE31EpysqFvwu8dpgwkEXYZE2kJRIhhJu6YbhG6yw3SNXttnDh85hMpdGFpX1ATilP8M0VlR4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:58:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 20:58:22 +0000
Date: Mon, 27 Oct 2025 16:58:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v1] drm/xe/pm: Enable WAKE# support
Message-ID: <aP_c6nylO9L-swL7@intel.com>
References: <20251024102148.3641819-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251024102148.3641819-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd3a665-b010-4a12-258e-08de159b906a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EYaJyyCaCCbRzwKCPCzQnaZQ9FQYISc1uSlq46JsWTRHSkaY51w3YfkLWVKR?=
 =?us-ascii?Q?BBkk4TwVdIwF3S9PZELBSpLEhyfOHeNb8FWboFdOl2TH1+8xX+4gBb0Cq8xo?=
 =?us-ascii?Q?Qjh6vlSS+qQhbggnke5xKfWKrwdaUTYsCUFvZ48EK1SAvmoYmE8ZO5zLSttR?=
 =?us-ascii?Q?c9ycQhFadVdy281IIt+8L7Yb8wZzX001crQrVzqAIK0sewe0jRSkOr3A4C4G?=
 =?us-ascii?Q?eqsv5jQZ/Nh9fSNj6iqQgOQjdrrbJw1+ZndKSfPnqVoHgVE33OOAh6HMH1n/?=
 =?us-ascii?Q?d8kExyxIEVJb3SweRFYPdtvJTLgawYNfKm/0m1v1WoV6unt/XAa26SqZfTmO?=
 =?us-ascii?Q?Ed/BGe28eAx2pNlSCabBwMdKgHeEyTMPhqKkfl8aFDkRfN3yo5SmzrDUAWhV?=
 =?us-ascii?Q?LU6IJ31mkrgSKhnf2bwsaUmqQgelSSZKj/SiDZ/1q9jBEWiFd4z/5aJLQqpr?=
 =?us-ascii?Q?hrszVjwIRNOESJtx4xiaqrlZ6i3rr8ZUv6I0paICyF5HJL3DQ6pqiLn3Gs36?=
 =?us-ascii?Q?Rl51xhzTRJE0/mB318V4gGYoFX2O//dBbTTuaipCj4tcSHjLcqCN8akMZZBU?=
 =?us-ascii?Q?VW974+XhUy1pHdDVxhw5UPH4+DfvI/kY0dG6gBLCJYoP8FtUR6cYRwPrHca0?=
 =?us-ascii?Q?0BOss0snUY7nJGKffRT40mPvlkNSIWMMCIVz6O5MB8jjRWmnfBZbpn6nLNfB?=
 =?us-ascii?Q?u1aEUzp4tshYMsX+kOcHWKhQXK2YZQ3BTj88/n9dqoxuycpWgYSKseldQC5D?=
 =?us-ascii?Q?VnAIOtwalNtCBAlW4XlizPnFgSakiZhrN0Ta0yE1vsuJFDrwZ0XLHXDRE6DS?=
 =?us-ascii?Q?j4TEmCUS64mqi85OhISTkrmJxEwhgEceoO6ecddSIG33Iu0RSyBgi8t1TZDP?=
 =?us-ascii?Q?YBXfWODBmsaYyReHBW61KZduvJEAlb/zFpedsJolnoa/c+VK91i0NGnOESQU?=
 =?us-ascii?Q?O4/D/3LmgPor1He+B+d9dgeEQspgJZqXSR1wIejfEHgMS36pX6C/vug865np?=
 =?us-ascii?Q?UDgGBNabPftLHeYVUPk3EcDxEjl3ER9c39UbQFQYJhECv91ZOHFEgpaJqZgp?=
 =?us-ascii?Q?NJWnaw/Jeg+yQW9PZ4MDK5TAAVWnqt+Sc8YHfGBpaCevuN0I5V4K2fW8Xd00?=
 =?us-ascii?Q?yLZNSAsUcbduz3vHScDiekKcxwgV11ByvCQoYqHcQbdnuarwZyJKJyK3T0uE?=
 =?us-ascii?Q?pe9wFLbpmCDTkUGOj/eUSynl5mw/Raj9wiUH52ZjMWic0FI9iVwUKzPmrry6?=
 =?us-ascii?Q?RBu0Havp4h/df2qEYBy+ektC24fLkyfRZ2Sp2UZdKLs1a0DiaQV+nf6lXaKK?=
 =?us-ascii?Q?4WDKEHaFRHCPS/06s1uFprRHMALP/c/1y97M37/KaJrRnyQvAVe8GyQf843e?=
 =?us-ascii?Q?Vw24YAdBVTEWquBBx+Q44V5jMiGjLv2DZ1E0WThIIDBNlL9V+h565BtYYRAB?=
 =?us-ascii?Q?c3QglCNcUpWCGu1FJzfjoE0d9EYDpw9y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sOyqsv2BNpezNREHbpFaNRmWTrNh+ohBtSrYVfFz8qfjCBPk2Vt0foeuuwR1?=
 =?us-ascii?Q?CQDlcyhAW+NhQhzJtFRpbtRgdgazvOG4Lv+65AUKferDLdDqDVGHUDrvbAeh?=
 =?us-ascii?Q?t6ORIgUSyD7Ls8d5aFpYTy7anz50NK6g+LM2mrV7mBs06fmk3pYEHtNcHGGp?=
 =?us-ascii?Q?kOe2FcrHVd49mTU/rPgtyIVMU9LvQfI6Du6MwIdDdAZx2yd5+ez0Fajn7Bzs?=
 =?us-ascii?Q?eu9Pvu0IA8/UJwlX/4uMOHeLhtcWiETdBNthGz/jIqTEfrOqSiLVi+CO1w0r?=
 =?us-ascii?Q?SL8IjBYK9ibkNUaMl8N3+8aEqepq8QKv4n+VBpUF3JdmmQMr5OYWVRzfluSG?=
 =?us-ascii?Q?QJzNkf59iwMmnaddmBSibTNOscZ8T3lqMPQr3JIyEZ4YX2NhhMZCQXi8/reV?=
 =?us-ascii?Q?wDyI5ygljzRCayYfBp1p6k9XVHXLnO401GYdWJRKECGqnnt1ic//0l15LIQ0?=
 =?us-ascii?Q?6IpjbOK6oMfmiQIZKZ9aasNZfuDzOaSwyJHTWWo0eRxU6DvxGR8NlMrA/rmx?=
 =?us-ascii?Q?T1OlxnXaNS9VAe3Q36Nfx5Y0vESjwZgem+YhwHdmwKVNr8exuOEvzJeDV3uZ?=
 =?us-ascii?Q?8Wa8RoIP+C9BGHv+bReTq62GtOrC8gD+N2S0BEKNO5LEGZKOK/8GvOQ8Z+MH?=
 =?us-ascii?Q?N02AlamqcAQObDryoVuzaGLoLL2VLRFRTSkfRFZq9PhDBsgW8ru/aLVQoi6L?=
 =?us-ascii?Q?nSKgPbu+SysB9HTfAswCwr/tyA+atVSt3jkY1+WFT4ojNP1qrFnWa1jlpiqw?=
 =?us-ascii?Q?PSgSaDLIiDoRUW0NutZNooveVaGpC91uS4j6H398uqZqGBghZzXo0WXzBX3Z?=
 =?us-ascii?Q?FWDMIv8Ik7TOoqNyG5VeifCU5eOIkUNviIXFNwZKF6tQjZ1fbOFXMqQxLOvi?=
 =?us-ascii?Q?gEvulEcCrEssZ6mczFa6lZTVTpAX8HAQvZhBvG2VSZlm+3RzQ5uzNP9EHuPh?=
 =?us-ascii?Q?TPh1HOvJ9idO2QPNu8T0ilTX1VvqbdC2m+Hr+G98hU+PslAIF03PmC/BXUQz?=
 =?us-ascii?Q?0wGHui7mNxEfD2FrWXf3wVd/40fXI+urYZqKlXJ/tlpzfVRUTQBV5rBWYN/I?=
 =?us-ascii?Q?L3TKDLpN+dPLpw9Bdd1mR6Zyvt/dVSVSLSgTasFYpVJK/qmveR0d237502cG?=
 =?us-ascii?Q?YY1kg+klZfURAx+lnysiCKKqrq18R6wFTGaDIaCfTFvFK/uzxOd+k50vPnL9?=
 =?us-ascii?Q?+01hFrC8V5sxY8M6XMOKI2UpBGDCK9F/0CPM7zMhclx5F1fkQFWNJhhhLIw1?=
 =?us-ascii?Q?Qm3JIHZZXdP59AG5cSa2RkwdtM70rmyUUHX5MgEy6P85I7NsnlTeEb2OQueJ?=
 =?us-ascii?Q?0gS/EBf9vgC/6Za/u+80xXx3uI2BdBl2lC2RMc9COd4VLrI1YRbh1u+znszb?=
 =?us-ascii?Q?NPGhh6ZnDwis2Wcmw/rE9zm+M+cKljPi2hyICX14ZIL3xhzuo7wOFoKOf7PH?=
 =?us-ascii?Q?Ez72VBi8reOau5HEwQdJjavTqGrEBxo52p5dbdWO8sNYEJE8KNPcI9zrDrL6?=
 =?us-ascii?Q?g/J9/MlqXjokvPCkynW9vLA2lXFFyRQOK7EU587KyeY7DlkeQY51xm3Wt1Ga?=
 =?us-ascii?Q?0gHSYBI1ORehbfq2xPyid3/+0N5MhwErY+KB7DNf0GQz3SGoLyHmURRiZtRA?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd3a665-b010-4a12-258e-08de159b906a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:58:22.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qN3POvpMVIT20QoyL65nWJg+Cb7klakEOfgkKIEgLRZhKH6LeZtyjoLkNdIvf7jaxUv8aNtN0BkFcUpWaqEH/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
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

On Fri, Oct 24, 2025 at 03:51:48PM +0530, Raag Jadav wrote:
> CRI supports signalling the host through WAKE# pin on smbus alerts while
> in D3cold. Enable/disable this feature based on device/host configuration.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_pci.c          |  4 ++
>  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
>  drivers/gpu/drm/xe/xe_pm.c           | 72 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h           |  1 +
>  5 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f62ee7a73ac..dae2bd06bcea 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -517,6 +517,10 @@ struct xe_device {
>  		 * Default threshold value is 300mb.
>  		 */
>  		u32 vram_threshold;
> +
> +		/** @d3cold.wake: Indicates WAKE# capability of device */
> +		u32 wake;
> +
>  		/** @d3cold.lock: protect vram_threshold */
>  		struct mutex lock;
>  	} d3cold;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e59642e7820..edf63f55f345 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1105,6 +1105,8 @@ static int xe_pci_suspend(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	xe_pm_set_wake(xe, true);

why does it need to be here and not something static inside xe_pm itself?

> +
>  	/*
>  	 * Enabling D3Cold is needed for S2Idle/S0ix.
>  	 * It is save to allow here since xe_pm_suspend has evicted
> @@ -1156,6 +1158,8 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	xe_pm_set_wake(xe, xe->d3cold.allowed);
> +
>  	pci_save_state(pdev);
>  
>  	if (xe->d3cold.allowed) {
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 92bfcba51e19..3f8d43c1b4fe 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,11 @@
>  #define	READ_PL_FROM_FW				0x1
>  #define	READ_PL_FROM_PCODE			0x0
>  
> +#define   PCODE_D3COLD_WAKE			0x5A
> +#define     READ_MODE				0x0
> +#define     WRITE_MODE				0x1
> +#define       I2C_WAKE_ENABLE			REG_BIT(1)

please share the spec with me

> +
>  #define   PCODE_LATE_BINDING			0x5C
>  #define     GET_CAPABILITY_STATUS		0x0
>  #define       V1_FAN_SUPPORTED			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 53507e09f7bc..30e4a787b9cb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,6 +7,8 @@
>  
>  #include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/string_choices.h>
>  #include <linux/suspend.h>
>  
>  #include <drm/drm_managed.h>
> @@ -22,6 +24,7 @@
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> +#include "xe_pcode_api.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -422,6 +425,74 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>  	return NOTIFY_DONE;
>  }
>  
> +void xe_pm_set_wake(struct xe_device *xe, bool d3cold)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *root_pdev;
> +	bool wakeup;
> +	u32 val = 0;
> +	int ret;
> +
> +	/* WAKE# is not needed, let PME do the job. */
> +	if (!d3cold)
> +		return;

Please NO! check this outside and only call the function if needed instead
of passing the need as argument.

> +
> +	/* Currently WAKE# is supported for I2C only */
> +	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
> +		return;

let's perhaps make it a

static void i2c_set_wake(struct xe_device *xe)
{
...
}

> +
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
> +	if (ret)
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
> +
> +	if (wakeup)
> +		val |= I2C_WAKE_ENABLE;
> +	else
> +		val &= ~I2C_WAKE_ENABLE;
> +
> +	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), val);
> +	if (ret)
> +		return;
> +
> +	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
> +}
> +
> +static void xe_pm_wake_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *root_pdev;
> +	int err;
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return;
> +
> +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
> +			    &xe->d3cold.wake, NULL);
> +	if (err || !xe->d3cold.wake) {
> +		drm_dbg(&xe->drm, "WAKE# not supported by device\n");
> +		return;
> +	}
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
> +		drm_dbg(&xe->drm, "WAKE# not supported by host\n");
> +		xe->d3cold.wake = 0;
> +		goto out;
> +	}
> +
> +	if (!xe_i2c_present(xe))
> +		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
> +
> +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> +out:
> +	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);
> +}
> +
>  /**
>   * xe_pm_init - Initialize Xe Power Management
>   * @xe: xe device instance
> @@ -459,6 +530,7 @@ int xe_pm_init(struct xe_device *xe)
>  			goto err_unregister;
>  	}
>  
> +	xe_pm_wake_init(xe);
>  	xe_pm_runtime_init(xe);
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index f7f89a18b6fc..9cedba8a7f80 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -30,6 +30,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
>  bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> +void xe_pm_set_wake(struct xe_device *xe, bool d3cold);
>  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> -- 
> 2.34.1
> 
