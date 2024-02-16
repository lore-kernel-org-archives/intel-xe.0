Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB6C48BEC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 09:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709210E45E;
	Fri, 16 Feb 2024 09:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe16TkA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1BE10E45E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Feb 2024 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708076322; x=1739612322;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7K4tnBbGAVmvc1aU6x8EQuX+skPiKoF19usPCYtAkz0=;
 b=Oe16TkA7cxJgzHXBmyrA18H+RRe01elqL4L4EiWcaFeyYl+sDUAuxNgt
 Mf0jYI2Q81n1brmwMx6DFB7HiZlhKFx1C54xgIdpWpVpY8qQEuN5NWkgs
 3jjaF4Lxpn+TgAgI1PnjFWCCPD0iw67tQ+GiIypPVSFDtDDxvWxTFbYD0
 Pex7n+ST+gGBXgx9PfeRe7QNnMN4AsCWt9XaU/0uXLZxa8NzrxwHXL8Yy
 iLE5OjMbJCJ647Stb66Q69Ui8CgqVlj78yzBLoEarArWrGtSJYJlHi6fK
 eEKqh8NDZxdVs+wdnWV+wWa/+SJGOt5u6lB0EU0SHAKjDGbNgelmr8FjY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19720671"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="19720671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="26947087"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2024 01:38:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 01:38:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 01:38:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 16 Feb 2024 01:38:40 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 Feb 2024 01:38:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTys2hkmdlhAZCq4eCHZAJd218vbBJIJflRR0YKV8jn02PkPhFoDc59WpCaryDZqGmxtK4BJaJw+m1FcSUeeD52ub0n4ccbWLJucDG01F2oKdVjTfeG10XwgLKOf1g0E+M336Mpc65wqwXCS/gsxUJESltIonp9H54TYpBNuGFZZpk1iIATKHWx3g/ZxdAnN8kQkWOTa7WJOuoF47hU6sHUwYY3w7QVK11gJlg8K6Q1QVsk6ZRoyakc94AsqT+3IlW2NXEyhKj2wrIVNEegAJm19IaGc6RqjZ04bo5u4mPyc0VdDH68/u215bZw4LXPH6oCSiqCK82QgO+GTfk7yJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbkY+HeneqHc0GQuQYDPFASDaL/VqsDNWhy9qwDRknI=;
 b=ANy9m7yawJfKg2gi3g70UaIS2yQ2dlLX+rraTTPY2KC/1xd2BxBOlWYwwc2GB8OBL6tOeKGhtvKtYPaJnZjBNCjeMo8f23mHT8FnvFMpzQ0lLnBMpwGgKammE71c2Ej//nknNvi8hhLbDBi2SU5xDjU7j0EoHB1dBPVezxf1nY/376bOMiIdGRR2gvcwzZse/+VG7lMmSvdys1mn7RqE/qDQawclAjg2eLBCoKKNoozUBBL5ay6XHLdrdNPXGAnSv8sbGnDxo8qfFiFYRd4YeH9SR/PrhImulArh7Zt8zxQsKN6cx8/P16r9Rc2uJbmQtCFT/EzGMbHI0K/s7wnKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 09:38:33 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::c3f1:7053:cb08:737e]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::c3f1:7053:cb08:737e%3]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 09:38:33 +0000
Date: Fri, 16 Feb 2024 10:38:26 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 03/14] drm/xe: Runtime PM wake on every IOCTL
Message-ID: <Zc8tEj0DnkTPEhRO@fdugast-desk.home>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
 <20240215193430.130106-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240215193430.130106-3-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd004ce-0bd9-4a2f-247b-08dc2ed30a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bR4QVMgjLuLBSQM/HMI9038hrZECc97HeJqPE7hxs2gIpoEakEqnwYuSUgLMBPDZFJm71LEf0PLW0r5plm/2WI3vOJTvp069KN4qYgea7462txAenDchTgkp5LN46eOSELJJBkwtOppqUtU4zBBEKoYwUX8rcIJkiTsgoNj7A/1sZFSGm6rXiPztW8VmXfq3/UZBFahKyeywZzQ4SxO+AoeGSkK9mUw319IkekCRHHK2w6EvcoiPgsDilcv7doDURZG6Sa4LBAB0S/XcE0Dn81luneRDebbdxzaUUxjsisXbHOX/Wwc6NHYhZTT/+sqgWEvKknE4SWUJNkD2Fgi3vg48JuldsEcDUnpv2nOvY464CZus4epb/Mpd3trow3yZVG8n6W8ktWYyZmLfd39BTGe9EjQ17jOikVmCVGIAoaz9drKIQ4xWPw8HrOFu7XdBNERfOanho3SOZdoZO1K2tM0e+jbrPFewPfuU7v+423jPXg90GSmhFTm8bB5JUFEJiwtxMGR/Dd0qDKgZ/5JCYGjY95YbuHhInv8DQuhHZBPQb5QDsE/lzxn8piqPbEuG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(38100700002)(82960400001)(66946007)(66556008)(66476007)(4326008)(8936002)(6862004)(8676002)(2906002)(5660300002)(44832011)(107886003)(26005)(6636002)(41300700001)(316002)(6666004)(36916002)(478600001)(9686003)(6506007)(6512007)(6486002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuZply7ZRKd579OXxBKVnEQdFRZI4kF0Mm8htDnQdaJDlejUAelopQPICk5A?=
 =?us-ascii?Q?5XjIGuLb3Scv0vGAh3H+/1DgVTgHTuoFvOise01Xp5CLqC4bG2njptNSuaki?=
 =?us-ascii?Q?e4/qd+X0JLqmJ/U1a/XUxiuaJbSGCiNo94Nql9cgQnSlz8FBTXW6nMQZpOOX?=
 =?us-ascii?Q?cPTLwMgLigySb0sGunaFaoeGy4Ac1qlbrqOnK9XgmFoHxyG/mp3e4bNGwxg4?=
 =?us-ascii?Q?40k6O0DT4xXQuvkSp2PIk5ebpq4XmIrq2ZJhgIVUr8lrjsbY5PVYn7pRbRHH?=
 =?us-ascii?Q?nl+OQP82Py0MwBLWYofXaHdl/h8aOKmUWRjCiUhS9eiXeqnoCFONhUZMlYMW?=
 =?us-ascii?Q?bAcZVkCt1jU7XJGrgVWtst+8Mhwla5+WyVWKdgYMOgCzK2nDYCCFRtkpQ+Ev?=
 =?us-ascii?Q?AWY/Om5RhdsRwnOLUBpDpBJDSZCB/FtHW7jRjYmNnsTfYIhpqZIibkgM4RYT?=
 =?us-ascii?Q?eM/ygh5dfwO6Gyu+7miXY5OJwE2639Yp6qaTPBLXEcx57mjBmDRhVU90tAYT?=
 =?us-ascii?Q?PrBvioTRKMYspibJ9qTZe2E0EAjHBAmP1mvjT8bzYdAUkkJM0PpQaPp719mP?=
 =?us-ascii?Q?wSUbfePyRV0kFbByD6+/mJLCFFJgRJFlx0oGpuUviLzQ5BBBAG62GZKib4VC?=
 =?us-ascii?Q?0k78b+jscr/Y86sEruLYOvFzRQLg1mECeT7tUg67bN86vxQ4fYlIH811Q3Qp?=
 =?us-ascii?Q?OyOvKOilg5OzBV6l++E4ofbVhKd/GZVpvVgDVSNwIFVxt5vmrDKEpOGgmpf/?=
 =?us-ascii?Q?l/UkbfO9BBYVDoh3weOoTDh+YYLKA0YWx6yYCI8/keJdESeUDX4zNwmfIOPq?=
 =?us-ascii?Q?Fm0dkoiIrbFDNKNq9d3VnETlc4bfuOVmsCURCdaYzNWuwtkDeJ+vSF55H6de?=
 =?us-ascii?Q?vpYFzLm0P1ydH0tgzdSN9PYBZEBaBTb5XdzKFFSq6K7QZqwxUu7y7vwEruBF?=
 =?us-ascii?Q?6mVCzw/vU2i9vYWkwTSTNwKW9pnsDQWdDvYSQrH5XCYtMbB27GDJFYbc8P/3?=
 =?us-ascii?Q?2CzqGcExIesELrq8Bc4AFrsz1KVYQB4yrLAdfsJYl+ReS+xtdwxU8XMNPTMA?=
 =?us-ascii?Q?4dXHeahhNapC59q8/eCs9MGubUvBAOmB496agfEM0wESuiO7+0zgqQeVmbsR?=
 =?us-ascii?Q?kLCkOexCwc5AO6AfH6Wl//ZCnywsiDuuQqaZ3likcrqhCHB9hs3kuC3cED7h?=
 =?us-ascii?Q?21aBfI/AL7E24zbZftToDT1NZpex6FvC5br2cwIq3HdteimE59whpB/24w0B?=
 =?us-ascii?Q?90LrYw5WYg34ENcA9thcrD+YjozCUp+An2kgHMG6PZjPoxpKmkdjLwgvpwbt?=
 =?us-ascii?Q?QmoXd0bJBvP7VlYqFR6C+Xio90uyR+zvOiUN2fu17xd+EaCC7UQ/2OtRpfiF?=
 =?us-ascii?Q?vuW66XMNlCUfUAijalZJl4GSmOSsvwN0W/jyd2pzpsixG5hYRYk0IoF3iJtH?=
 =?us-ascii?Q?PUtUJ8d1tBdLeyu0Dnn1xsOmL+a1nE4l23LB4kLIn+tRL8PQqqHtdGPDf41O?=
 =?us-ascii?Q?yGw//qNRO16U7s6/XVwGP2ZyzBFq9WNRqhCqT7gPUBmPMtXcbRMZ0OO+5MHT?=
 =?us-ascii?Q?O4boIdy0z4YnIyJhVd5hH/snBxnKhUuXg2HnnlM5tCzm54V+ePosYRCBRwnk?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd004ce-0bd9-4a2f-247b-08dc2ed30a92
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 09:38:33.0873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QjHNAJg80YNCIz6kX5f7tn1U3HAw6AbwSLVz1RR8wCX/XptipE3ktTfochFh7bOPX75+hEBGQGjgqQsMSn/2C7lviDZ4XW12tcWogCrwbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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

On Thu, Feb 15, 2024 at 02:34:19PM -0500, Rodrigo Vivi wrote:
> Let's ensure our PCI device is awaken on every IOCTL entry.
> Let's increase the runtime_pm protection and start moving
> that to the outer bounds.
> 
> v2: minor typo fix and renaming function to make it clear
>     that is intended to be used by ioctl only. (Matt)
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 32 ++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_pm.c     | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h     |  1 +
>  3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 641af3c7fd34..f763385b941b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -141,15 +141,43 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  };
>  
> +static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct drm_file *file_priv = file->private_data;
> +	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> +	long ret;
> +
> +	ret = xe_pm_runtime_get_ioctl(xe);
> +	if (ret >= 0)
> +		ret = drm_ioctl(file, cmd, arg);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct drm_file *file_priv = file->private_data;
> +	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> +	long ret;
> +
> +	ret = xe_pm_runtime_get_ioctl(xe);
> +	if (ret >= 0)
> +		ret = drm_compat_ioctl(file, cmd, arg);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
>  static const struct file_operations xe_driver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
>  	.release = drm_release_noglobal,
> -	.unlocked_ioctl = drm_ioctl,
> +	.unlocked_ioctl = xe_drm_ioctl,
>  	.mmap = drm_gem_mmap,
>  	.poll = drm_poll,
>  	.read = drm_read,
> -	.compat_ioctl = drm_compat_ioctl,
> +	.compat_ioctl = xe_drm_compat_ioctl,
>  	.llseek = noop_llseek,
>  #ifdef CONFIG_PROC_FS
>  	.show_fdinfo = drm_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d1c105f0eda0..b7a0e3cc594a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -429,6 +429,21 @@ int xe_pm_runtime_put(struct xe_device *xe)
>  	return pm_runtime_put(xe->drm.dev);
>  }
>  
> +/**
> + * xe_pm_runtime_get_ioctl - Get a runtime_pm reference before ioctl
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative error
> + * code otherwise.
> + */
> +int xe_pm_runtime_get_ioctl(struct xe_device *xe)
> +{
> +	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
> +		return -ELOOP;
> +
> +	return pm_runtime_get_sync(xe->drm.dev);
> +}
> +
>  /**
>   * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 75919eba1746..7f5884babb29 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -27,6 +27,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
>  int xe_pm_runtime_suspend(struct xe_device *xe);
>  int xe_pm_runtime_resume(struct xe_device *xe);
>  int xe_pm_runtime_get(struct xe_device *xe);
> +int xe_pm_runtime_get_ioctl(struct xe_device *xe);
>  int xe_pm_runtime_put(struct xe_device *xe);
>  int xe_pm_runtime_get_if_active(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> -- 
> 2.43.0
> 
