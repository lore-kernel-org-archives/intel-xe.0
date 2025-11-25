Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C43D0EE0F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B49510E429;
	Tue, 25 Nov 2025 18:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSps63NS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EBD10E429
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764094114; x=1795630114;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RVYRG2MlVbe6Pqdpgqj7HuKmTpVuc3yxif40nKoe9lE=;
 b=NSps63NS1l4ASGb8caHVGDliJMlbunsiktrNNmDBlHWiMzh8lGYVweRY
 IgJALt61vLxxykafXKh7XEMVU6lFKJ832K8CFs9LlpHqLI/3r8mBv+A2V
 14MlQ4pFoPlkGEKiY+oDNJl/eQ0M7+rd2rndK2oZYFBNmmMWjLbB1C4hj
 ghDWr13IEcYKjAFIwJS+imRrzluk13TmF8c5tXePp4x0YkJYOLrB8hSdK
 cMljxzOYy/eMgx+RLjGTq/0Leyh3RCO8CuVRnkes/oIzOUpOYIlCtoIrz
 BPIlmDV5l2D2U2ABdn4+KxjXQG0r1n5KrP3PCAHWQl7mtcfz0rzXfM96a Q==;
X-CSE-ConnectionGUID: UcKPnMXTS5imqvn74wysdg==
X-CSE-MsgGUID: nnHb78rxTgOVeqPXFcwNOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53691036"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="53691036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:08:33 -0800
X-CSE-ConnectionGUID: lNVWKt80QiG+S7kcl6LTTw==
X-CSE-MsgGUID: +Gs09Ce0QPWA4oszMt+VmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193126587"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:08:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:08:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:08:32 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:08:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgj7Mfp3fxn+rv297ZWp3MeTJAMF14JCxeKvDLBl2SWMgMneYGasPO0AGv0Z0roGHqmY9PydZU9jwgJr2DM7z83zqdcMB49qwg9hBgImfW7217ZcqOqpchtseT5MtZmxT/pwbWIeYUMZY0IAHvc/299/3H2JigpIMel2zJC+QleqVjHtHXBbBDcQCs3ud6dkjwciIgYR6p0u8dhvYOsTbuvinYd/y/7eATzILDm4vRkrYD8/YC18XocLsKcmfazw3jPMUlerJuwzNM0BuSTfE1vKQ/Zz+O4AXPRuab4ZmDFRmlwDO6R/+VyIpd51JOFWxPVVo6xT0Rp4BEVX/EqfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i35Xiq1Ej5yoRqIpYO4+qKARn6I2c1ZBA6cKE3x50uU=;
 b=Ds/QAMfyRhFnNl2sUyKz4WKx/URIrS4cBtupa+4SxZom9Q+ZsG5LaZDxsKkhTykOmXGsLSxCtsnYzsu1/nu7GZ930rf9fugGHWDlih/yHNUUNy/F1fgRkt6rvZocJqfmwBVCPHDfmPtOyznATd9iA0gtP8subjkngPhm9UYcno7vuGROgP4TpnK+aMOc33+8ib7M++TLRO5oR8fnOGvZ6ReCfLy4fC3yqHMrmtKNMitRux344GIRaJpgNuD+Hz7yGcPn4fu0abujLJR7mQPQ4ReYzMQOWsVAr6EGURdseEfy2xRYLv8KmotZqu+1mtjzm8ZhmGvfxQ/dg9SE1CfV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 18:08:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:08:27 +0000
Date: Tue, 25 Nov 2025 13:08:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v10 1/4] drm/xe: Validate wedged_mode parameter and
 define enum for modes
Message-ID: <aSXwk4cFBmdYhoo-@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
 <20251125135422.11244-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251125135422.11244-2-lukasz.laguna@intel.com>
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9682905a-f771-42c8-173c-08de2c4da172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VJG2GpW14lYTen642ZKmJPUPEKjh/Ag7GsKMNCcDg19/owBgARmBK3FuQeYB?=
 =?us-ascii?Q?AloG+AYW3KJo+uh7rxHr8fzALDLejrMLPrHHVrCsknxGgTQJ0CaujOGAc+P8?=
 =?us-ascii?Q?X9KbUIjIo4pl/r3axebiWEyg1C2XAZVPR3enprjwMI3tSdVPz5X+YM4WpHfV?=
 =?us-ascii?Q?Kv9g4z10ZhOEdPy/Nl+JCkauswYIiA4cYEwU3mFt1PB2D20Z0inG14zuLg0R?=
 =?us-ascii?Q?mhenMHM4BBc7p4hfC4Rf6VpLKR4tP9YZIgzdB4D1S0uvloeNwhrTenPDr53c?=
 =?us-ascii?Q?ampXKFG3/jKZL9PlNHtsjAFrJjXNoWyqQGC+/QgOedWCg2FuRUVXBGtKeRUS?=
 =?us-ascii?Q?Q3AZKuF4E6uv7JDRjpi27izWUSu2E3MJYJKKeq3bc3RaPGEMcXW+y/2mWcmF?=
 =?us-ascii?Q?27enZKkrgsgPqlKogGQMhcdBhFYsP4n7a1P188cRq9XAHpwj7CysXM2izZQC?=
 =?us-ascii?Q?iuOQUjZ8im/Eypr6OlbcOXVw4o8lkYVTxH3lUJjkuQSC9c1e4UsdInw/jLwO?=
 =?us-ascii?Q?dTnNZa7j4VMhJrbJjHKuOrIbexPwyCJeGTpVV4LToOV650gYT5lyg3sNSgsu?=
 =?us-ascii?Q?IBEaGQwhsMPU7dHuaTWc/t5uybjhXTIfFIxfV2UkX8PJ5bjEaA+ZyDq69Yr9?=
 =?us-ascii?Q?HTi88wuXpj3SCmOCRxnCgGlVWOBXCtCE1KhlVSE/y/icorUDiTtTCdlVtYnr?=
 =?us-ascii?Q?u3YlD1KFoV9fkX5UlS/eNonPfu3xCut8Q8rz9H7aN+KwXYxxgStNHtnPRxfC?=
 =?us-ascii?Q?wlh/7GhZAP0MTWJGW91OEDTWjlDMDAAiYweUZSx6htotnrjmeo76oogWy7Bl?=
 =?us-ascii?Q?MLZmJouvEVk8UNvvqQZhIAqRFB8/OUx9BbbATgq/sTAS+kQ95caoADmBWCf2?=
 =?us-ascii?Q?M0qzy5DF8w8X+xgKM21jn4O4y1QMNoRtFErfP5M+VMRjXx7eJnn1HyBGTWgt?=
 =?us-ascii?Q?yNiIyebnQk+Il5286ipGD3eRPns8uQdJcY4FCb4NGmvINvTbawosiRE+FXC9?=
 =?us-ascii?Q?XDKr6iYr3k6MjRgbD112YdBIGNWAIyVsSE8aYDw97bpjSj59pbIglchYaGnR?=
 =?us-ascii?Q?bAZX7AtVMSnBoxq/CK3ic8f8IYCIgH44a5gdlhs3aUlX78cpuDy3CrJHAC/n?=
 =?us-ascii?Q?GuXcYgqkoXDqQgLRpLBZYeMGRDjBQbkDX7rtLyP3DmMogj3t0XwC+i9gd8sI?=
 =?us-ascii?Q?VRUhD/2Es/JG0esJNoOUQaxnBUTmpSUGTz2r6tRsO3C0p9HXhWgqX3H8vvPv?=
 =?us-ascii?Q?TB4ufjXiqOpbjAzaK5msNXnTNrCsYSaHtWOZlmYsRJk6IE/db6bfVBS434E1?=
 =?us-ascii?Q?iOAMr3c74RJXLq7inclqD6YVX/TJN68/3TdxwamKvP2DQ+FCuV2oZkHtKgxR?=
 =?us-ascii?Q?UblJUaVmqwqdu/+zPy6skX4gS3pdglpeOokP1giPVaXXiB8Ghp5IMyobL1Gt?=
 =?us-ascii?Q?nLdJqY6f497a+KLOFO7tunFFiy9hQyWg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pysWwrneb80XkXhVyFPWi0y16Ca2OMcThV/ImZs+tOFrqevosF6evDczX5BD?=
 =?us-ascii?Q?EcE+YvaziE7FIpuO/1BReH379RkhUvHA7b8PVq7i2+vhSx3WiUMj+Jf3tDaH?=
 =?us-ascii?Q?PCO+NndrVzzDKQ79Db72TOKvumxU1knyBFepKHodGRZFfEUulkW/oEgMAcZp?=
 =?us-ascii?Q?71VW8kC1B+s5ZCfcVoLxn4QPhFNt+eJllN+FQG8L3nzTeRJv6WcLkLL4UV3C?=
 =?us-ascii?Q?MhLGCGGC2fIrVAweFDYR9/oVc0axYSTEL0EfYBrVu9z3lFHo/VRx/Sk2CcNe?=
 =?us-ascii?Q?IN6odUI1cGyrbR3/cncWupzPhIpX+aspX16Rbk680X9X7WjhhualzAGgkn0a?=
 =?us-ascii?Q?W9sX28IKhAD3DD8aEE1cJoAbqsZuK5g7YrcZi4KCuZvZa8VxeoqYGDxc5FrM?=
 =?us-ascii?Q?q58/YzoXVgKPUYz1Bj3QZH0DW4K6t02h8awgf/mASApexJC8GeqEl3z5PW3H?=
 =?us-ascii?Q?UKk1IdISMYfYmG4MhptCWVv0T7vF4rMzHU2C7XcqZdp64c+XDzYuw/vI5qmp?=
 =?us-ascii?Q?kk75z5n85/EW7PyhJCERUg8t/tF8Hc4+/+wdbxwICaW9PKzli6C6XXSrM5tR?=
 =?us-ascii?Q?xYWWJYLdm3xb1l+9w4AJ0bfyVa2E3VWoSKGb6+zq1gTs8XzqU1DeMtA68W4N?=
 =?us-ascii?Q?UN9uF+ybyXc9Yo8ST3bXhNbWWbSFJw+18ks4DuLPKr+psHHcHvr7EJSDz/Ha?=
 =?us-ascii?Q?aBXd2ylGhFAnUmWvVG8av6/RmR1mKkV7qOAHZCU4/NDhltOhMtUWfhWI8DUs?=
 =?us-ascii?Q?B9OJYqDLM8FTtofLDufIp26cgWUYtq6szq6yjwXWMZ/bext9ZZcOUbj6dPJY?=
 =?us-ascii?Q?g9ak+j+KzrAc/P4+g2LC4irM98IFLcQ8W31FgXNs6puKMRqcmSAGm+4SxTab?=
 =?us-ascii?Q?2Ddbv8y0lY3uf+XEkKHpxMczR1lYSf9Vsw+UpKod0xWttmzgfs7RRnPQPtCy?=
 =?us-ascii?Q?9KWchY+thfx4Qje5aEREFlgj2q7bLgMm0vp5smRxuw0J3kWbBeCPwX20cnF/?=
 =?us-ascii?Q?efhXvrQZQ3ls9jMKdNrWHW6iJfU4gi7XeWfV26AgFdre+qg5qpW+8tgwVtjx?=
 =?us-ascii?Q?9Jx0fSlmiZik/jC4zM6tpxqI9VlkasnaZdPY09tMcOT9J5Zl/CRgZVeKlyh+?=
 =?us-ascii?Q?gi8ND72WkGGIcJqNZzLICtSQgrVbR8u8XbNgZyhIbuxfGEo4c4zqWcNJE1Js?=
 =?us-ascii?Q?FD3RZSYd++43awc441dUzCk8Dx/Pt2GE7MAwofZHAqj5PGImkyS6mqDEl6M/?=
 =?us-ascii?Q?wfZUpDNxWTYo4uD3GVSWVY/KDdLP9UGvfygQIUn+AM+eFhmRql41em/5vmph?=
 =?us-ascii?Q?qI+h1uzXh0R8WL7ZgHiMggwo6iHKrRXti5NMJHTcSQKs8/u/MntQWvQKs+yD?=
 =?us-ascii?Q?um1nhs5ujup082bIPDx5wnkurq37dFxcco+qyZX6GmQ4Xbh92ir7u+vqXZGd?=
 =?us-ascii?Q?4VVSVeC1IhPjwm9LA+OpvwgSsHqqdJwol0mJpBkUSd4dYhE8RLb8l1QIbiuJ?=
 =?us-ascii?Q?6RSgz1ipM6bHUzlbK5LzWEdefxhnCBRQ4BT2q5rFnEYLcMn8l7AtabEJGMFm?=
 =?us-ascii?Q?NaRoE2LN/u5INv3Xz8x/AwxtfaHTnu6tyAeMk6E/6Y8jd1vbTTYdc9wYHm+M?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9682905a-f771-42c8-173c-08de2c4da172
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:08:27.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/+HUEiK6fc01aAOJvk4PYV41lASjoFA2o7Xx8OuPupb956JAAFqGUpXTp4wHBXgAj1q5cIFCS95F9qNN80+zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
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

On Tue, Nov 25, 2025 at 02:54:19PM +0100, Lukasz Laguna wrote:
> Check correctness of the wedged_mode parameter input to ensure only
> supported values are accepted. Additionally, replace magic numbers with
> a clearly defined enum.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v10:
>  - define enum outside of the xe_device struct,
>  - fix description of module parameter (Michal).
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
>  drivers/gpu/drm/xe/xe_device.c       | 46 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.h       |  2 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 19 +++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +++--
>  drivers/gpu/drm/xe/xe_module.c       | 10 +++---
>  drivers/gpu/drm/xe/xe_module.h       |  2 +-
>  9 files changed, 88 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 1d5a2a43a9d7..e7cdfb1cda8c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -265,8 +265,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (wedged_mode > 2)
> -		return -EINVAL;
> +	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
> +	if (ret)
> +		return ret;
>  
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c

Please, while at it, please update its doc block:

 * DOC: Xe Device Wedging

> index 1197f914ef77..f6216c4f83f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -760,7 +760,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
>  
>  	err = xe_device_vram_alloc(xe);
>  	if (err)
> @@ -1250,7 +1253,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	if (xe->wedged.mode == 0) {
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
>  	}
> @@ -1284,3 +1287,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>  	}
>  }
> +
> +/**
> + * xe_device_validate_wedged_mode - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedged_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_wedged_mode to convert
> + *
> + * Returns: wedged mode as a user friendly string.
> + */
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG:
> +		return "upon-any-hang";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..2fffa88f91b0 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -189,6 +189,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  
>  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>  void xe_device_declare_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
>  
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6ce3247d1bd8..81bf4a70b888 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -43,6 +43,23 @@ struct xe_pat_ops;
>  struct xe_pxp;
>  struct xe_vram_region;
>  
> +/**
> + * enum xe_wedged_mode - possible wedged modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only in
> + *	case of critical errors. This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG: Device will be declared wedged on any hang.
> + *	In this mode, engine resets are disabled.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG = 2,
> +};
> +
> +#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> +#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
> +
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -583,7 +600,7 @@ struct xe_device {
>  		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>  		atomic_t flag;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> -		int mode;
> +		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>  		unsigned long method;
>  	} wedged;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index bcb85a1bf26d..466f192b6054 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -451,7 +451,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
>  
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>  		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;

This mode=2 end-go is not to actually wedge 'upon any hang', but actually
to avoid resetting the GPU at any hang... like do not try to recover.

I wonder if we should and could make this explicit in the name somehow..
perhaps upon_any_hang_no_reset_attempt or upon_any_hang_no_recover_attempt...

but no strong opinion in here... just some random thoughts to make this be
more explicit.

>  
>  	ads_blob_write(ads, policies.global_flags, global_flags);
> @@ -1004,7 +1004,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>  		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 0c1fbe97b8bf..45ba0c5308ba 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1889,7 +1889,14 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
> +		return NULL;
> +
> +	if (!xe_device_uc_enabled(xe))
> +		return NULL;
> +
> +	if (IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7e0882074a99..4a93a2ff061f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -998,8 +998,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
> -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> -			  "Although device is wedged.\n");
> +		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
> +			  "Although device is wedged.\n",
> +			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG));
>  		return;
>  	}
>  
> @@ -1014,7 +1015,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  
> -	if (xe->wedged.mode != 2)
> +	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG)
>  		return false;
>  
>  	if (xe_device_wedged(xe))
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..cefd00eb7379 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_module.h>
>  
> +#include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_configfs.h"
>  #include "xe_hw_fence.h"
> @@ -29,7 +30,8 @@
>  #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
>  #define DEFAULT_MAX_VFS			~0
>  #define DEFAULT_MAX_VFS_STR		"unlimited"
> -#define DEFAULT_WEDGED_MODE		1
> +#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
> +#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
>  #define DEFAULT_SVM_NOTIFIER_SIZE	512
>  
>  struct xe_modparam xe_modparam = {
> @@ -88,10 +90,10 @@ MODULE_PARM_DESC(max_vfs,
>  		 "[default=" DEFAULT_MAX_VFS_STR "])");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
> -		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
> -		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
> +		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang "
> +		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
>  
>  static int xe_check_nomodeset(void)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..1c75f38ca393 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -21,7 +21,7 @@ struct xe_modparam {
>  #ifdef CONFIG_PCI_IOV
>  	unsigned int max_vfs;
>  #endif
> -	int wedged_mode;
> +	unsigned int wedged_mode;
>  	u32 svm_notifier_size;
>  };
>  
> -- 
> 2.40.0
> 
