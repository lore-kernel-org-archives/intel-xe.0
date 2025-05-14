Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09743C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339310E742;
	Wed, 14 May 2025 21:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDXZD9HY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44B210E742
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 21:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747256842; x=1778792842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dEcmqLPkrzj0c+1jy86Mk+kCpL6o9HpW0+bPYgr+6cI=;
 b=SDXZD9HYnWmrnELjAA8Jlj0RvsQ7m9j9T67EU18kZQ3KAYCsoGjv7KMY
 amgRj2d57kIRKAqvJlIa+cT3AHwEjK9ru9lr0LKiRq13QNgpRiEDT6zLw
 XH95b0U4nVmGy4SE5v4f96Jxwv053Ij3NzbX0ujAo8uIZ+6DyIYFrroQF
 tc+uwS5lT2B7G6RC7qd9H3VY/bCzk9bGGGwGg+rVEHKdjzkEXs2xZp6uv
 +601BYLv2hOrgLvkAE+tqaucBpmJy0rCpX264raXgtwvXrKJ4T4vrAUfx
 XVBnAiH/7XL77JpOp6P3vT2AYEPWGxCjsZj1dSK+TJtmpZbAG0UwvsBOC Q==;
X-CSE-ConnectionGUID: VzFljLwuT5a6VpZPD677KQ==
X-CSE-MsgGUID: 3rOqnh0QR/mW6GxZ59Fe/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="74574197"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="74574197"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:07:21 -0700
X-CSE-ConnectionGUID: Tp2EbPSRQpKI7rhEItFXuA==
X-CSE-MsgGUID: uHJOQqeKQUaltpl5vlJMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142179516"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:07:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:07:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:07:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+OqHZMNL3aPSnMmuw5z+ekTyYbaFN0GnwG3LMC8322ORh7mUMHgNlu9mTJhByPkylZhLgPG/zAesY75UphYsIlfkfvdeqfzkilFw/3q8wXOui5DtZRw9Bf7IhFCxMM+Z1XYSosftqhF4Zz/QWt2nypsBHGUC+6P18Tj5KJvmE4PqjuYAycbc3rcTm55hYT9GjDVJrdBZ7+UMn0DXbsLhZtPJNDOaZ89XYMUZQHRT9uUzhz3kO4TKlUXB0+VnFyg02dCW1HPb86Y1RwbvDfYn9h1UvvI+t74RENgfTRC4jQvleYmAAFVq2N48f4A46NHwXjuke+F5HgtvJrMm+alFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0aWUCTz8kA0cFtEERKPO9QbFWwbcIAoPPME+lqWCQ4=;
 b=oIb5WJeSHDEHRSTwMrKZuoscgJBtXIhYKSAXHCFzKydZRw3GFtXGTpbfRDQLJGMQEdixh/GizAcrFQwG7qDyGtFbnpNYFj3chnFuNUSKx44ivaJFL6ogZGl/hyOyTxDV+ouNpUPa1HViUIxulf4DPO+7mVYh5YL2Ga8/IAIM+MhhtB46kt5OUd+FOUFEdJ96wcPFs9/HYPV1wzDcWxFr/FRficaI0/jrBeFVO+e/i4OIUwXwQt2DwT08lqxU8bItVn19UL5a9BoVIVeTxx258JUdqrZBOklZl8zCHduEVgbeOWOjXYuXCw4u7acExSSbo13CgWOjLyRvO01PVf9tSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 21:07:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 21:07:18 +0000
Date: Wed, 14 May 2025 14:08:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 30/32] drm/xe/uapi: Add uapi for vma count and mem
 attributes
Message-ID: <aCUGXIya4wohGME5@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-31-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-31-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:303:83::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: 0029c998-de48-48e5-ae29-08dd932b4f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EQz/T/IxEMF6VI7YKmZPsrULKAnfvU6Xvyck9/yTo2OAS8OsEbPWSZUS0v1u?=
 =?us-ascii?Q?7gayn6mjIEybDQ15C+NDggm4iT3au7DU+9vWCGpr37zZuPSGSGIBXaOeScR5?=
 =?us-ascii?Q?w9MgpdPtM0TSLufV8i7YPJk6YytIBuPjgo05qNRzAM1uYFA6nWyCX469PdTc?=
 =?us-ascii?Q?pWfY7RKwtOiUmVSWR6UHTuvZRbbWRoVGj0xtGvFxypoG0s2CZxdQgdg+wX3b?=
 =?us-ascii?Q?1DnZveNI51mzJUb8wx8RW0DN9xzvmabC8mF47ElJZa6cwNmDVIN6lP1epeDy?=
 =?us-ascii?Q?uGBHA2FWh2P4kA4Y1CQcAmmvADalVvYhtJlEWhH1tNIdPTYHVFj3m3nDf06v?=
 =?us-ascii?Q?B32Emn2CgGR+Wz5mtqX7sxe36mzAYKlKtXiXV5C6R7agG8hNgAGZ8vOrwHTf?=
 =?us-ascii?Q?cRh2fRMlsPZ/zc2tX3YG2eol+o3mhwcGtuQS/i3d66/G3P36GaISKCGwJ1//?=
 =?us-ascii?Q?SDGBbEkPWjs1iWbCLFLl+l4LyP3t+g/DFC5d2PSTv8rrkjbsSxB0QTo0xp6D?=
 =?us-ascii?Q?Fruf79sDyOEI43eIZK1bUCG2I/s6MoMzAFGkd6RGTVy3Tq1jNB4W7TXTrVzN?=
 =?us-ascii?Q?mEM6S6rHBqxP9C7rUygxyv3KaOyb4pJlyjsGEuDLUg7Qq0giThSjenCu33AH?=
 =?us-ascii?Q?vDeTRc8WxXbtaFMtc7d4sAw1FdwUXshBChbFC7QcfmzPJniATlA/I8s9iXwc?=
 =?us-ascii?Q?vP0BH4d63q/Qb4nzyUlI5i2BpGUuHCnPcwiaXjGTMw7oNncgemTgeeBJfYJq?=
 =?us-ascii?Q?GIg8yb9LGmqi8l/2ovpSytXYC34Sg27uI+t6RsKWi3XGNrAjlbNIpMatdLaX?=
 =?us-ascii?Q?qHlIUdhyJTR0AVxSsUcBiWV1j6XS24Hy22cQL3yIQI8l27SjEoZUuGv7Xa/s?=
 =?us-ascii?Q?OsJYb8Gz6pNTZ9WAVsOLU/YiKF/zKB/OOEd5COBtroPLJ/iJoDx8BgH3boKQ?=
 =?us-ascii?Q?Osu5LAgj4chBla2S/9yVpd2lN+BgMSDijPUXJQhVrW7y+pA4TIdiMyMzUd6b?=
 =?us-ascii?Q?FzkkEiSpRhgZskNhO8/l11Gs3en+HUqoShEfuxku64fDf04nOeSGFx7uC/hJ?=
 =?us-ascii?Q?6rpvKAooSzfHYjYKI0YJg3p4V5ycvdmYerq7/hTkwow3cJotUDFVU0Xfa4R+?=
 =?us-ascii?Q?he4tNh4jz5L4VUlL6rTjIxGoVcFkKSB3hF0/8L0/CD1+EBMW9OgtIo6JMKdL?=
 =?us-ascii?Q?m73jgzrVK5SobavQgAYfRMb3T1QPb2FyXVp2Om8V9fm3sEf5F0exjoWaE9xM?=
 =?us-ascii?Q?vlm/d9G1KVFibQobzpB5bsM9mNC+iMOkZqLIRlz3GT82dvrXwRqOI0A20aC7?=
 =?us-ascii?Q?m0rlknThYM0II2f+5WdGYofm87CLuQbdOyTMJYRaGjg8+OZ503LpcQF9K1Js?=
 =?us-ascii?Q?FelVSQEd1+izbycblOPaCVgtCPmNVRjxt9wqW/6Ewi+M9F8uTaGmYZvuj1D+?=
 =?us-ascii?Q?WXF76m+OIho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbRZMlT/n1jAtbkR9sBLGdvYBIB7KobBjrq05aHxkSrz45N5QW2n1aGVdrme?=
 =?us-ascii?Q?7nTdQVp4LyN+UIdOw9RAxH6K6tqd2f083pe1JmpUgaiLo3tBZwLrsH94Fd2/?=
 =?us-ascii?Q?xrKpluSRYbjKGqdimRwlx8Kd4Aae7WHyy0eErNy5TpJz5LuorhOItzqsqYrA?=
 =?us-ascii?Q?u2AEE/y4APEBFsMFIgddhoXQbQRbuzTqJPLr7e2T1Nd+rqF37ORO9TICSfCf?=
 =?us-ascii?Q?8RroqIa/iir5HGv+FyyUO30nmqcyUPT2GPMqaB6JJa+jm0ymfMRGv36OPihV?=
 =?us-ascii?Q?PhTgCYF1TAzJxSuJ1UEhFpFviPgeex4Vspjwx/wJsY1mVGqzTi3CtZJ9Si8b?=
 =?us-ascii?Q?bqaCTp8gXiq7KuW4leT9C34ZZ6KWIYBZLSetptC+mohuA4fxX+WCMNXzpHZQ?=
 =?us-ascii?Q?8fk69Hmb9ss+NeLPBai0+0NbrTA1FD3tPp+FwwTYldcjySu4cNQT676IA3l3?=
 =?us-ascii?Q?fuboTrLEpdgTg2bZyYZVn5ygGQlRRFuwwhbs2N+OAbeCzWErFFz3btyIOYDa?=
 =?us-ascii?Q?MoJFjkEHLBdX9hRHjsq/LEMBsavvv2KnHWYaHhFwxVJvJdreir4t17xdaGy0?=
 =?us-ascii?Q?ElegmUsYq05Rv55vgX1FL75bYh/prrsUcAk2ebAsHIGJZ2hHgREuEdd54MR7?=
 =?us-ascii?Q?YLZeFD7Hxr2lEaak8czxV6K9WTsb8B4H1T3wj5K7MLk3srC5nDw4Lqwi+vqc?=
 =?us-ascii?Q?VYa+vzzxFK6i8rnejSIWsmbS9dQbUw26N5Tt06EoI2hzifA+29H3unGXOYC5?=
 =?us-ascii?Q?WfiTF3cnZ6LeHXLzEs3DWrhiz+ll8xAOBEM/1BsNCgYuHxBNPOxhB6z9i6Sy?=
 =?us-ascii?Q?j8z8OWdb+c+ELuJ4qR8fegmdAoW7ecfwG7cKz2YyOHxUbyHwgB75gDqJ3Ynw?=
 =?us-ascii?Q?mrSuKcHxMaLM3vA2vxdSHcqwcx3rnP6HgWInkGkbYlkDR+mLuUhSDgtR5A4d?=
 =?us-ascii?Q?4Pg7tRtbeiT5JxPLHtbXf9kCx8y2mZ7ZOgso6GAzmKNQHfOyo3bmbTXN8NhR?=
 =?us-ascii?Q?i+h7YavBQHjfIyU7/C56CGw0DnYm4ftLcdNiKucmfmRHthtcpf+aEVxes7Bj?=
 =?us-ascii?Q?TeVLiF18OTW+XqwiHsRQo1rHzbyOX9LptD3heXcAnkXPiFoANZdKkVn9Ea5g?=
 =?us-ascii?Q?N+kMfFUmK8jqxKPAT4wqGguRMwja3XZIIHHa3oi1SB7CS+L7zBcAIx9hIvgx?=
 =?us-ascii?Q?FprZ3p5T5QCGhksnU5JzE8XhgRwnzUDqSrObff3ES1Pe7TuT6YpzXErVw4KK?=
 =?us-ascii?Q?CjocX+ZEb2TcYBA5cG8tQFtnnQCJiiRHGB62utfPAQTLOmR6kkuWx3l8A/2B?=
 =?us-ascii?Q?fKlf0TQqUURb471WEXcwWRmUT99Kk+1NpgfkQ5Z7v9msJy4wXyD4UM+M6nFR?=
 =?us-ascii?Q?wrI7NxE7GwUsIIiM5QIuPr/PImJ8x/n9RN5dGezpIT2D/SwmFCH568rqCEVm?=
 =?us-ascii?Q?lNrUUIyE8oOOQcLoLehMGBfVDv0QyPBYdrR8xnQq/66g81KU7clmmQeIHLPj?=
 =?us-ascii?Q?rG35lairz+N1p9Q1T02yQomBvUkoBjHg7xFotRnjcinrpd01WB3K0oOL3DQC?=
 =?us-ascii?Q?9ipu90xHwIUGS5Iic71QHQwXx9Uk/G87vilYVRr6yA1AjQ+/IPsYisozDJob?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0029c998-de48-48e5-ae29-08dd932b4f37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:07:17.9830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dJYl5mYp+4aJO7LhIIBf/qDn/bN7INFItjJB3GQnjUsZWbVRLD21bF2GCrMjFoTNxABLaHs7iqbhd7Iuie7GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
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

On Mon, Apr 07, 2025 at 03:47:17PM +0530, Himal Prasad Ghimiray wrote:
> -DRM_IOCTL_XE_VM_QUERY_VMAS: Return number of VMAs in user-specified range.
> -DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS: Fill VMA attributes in user-provided
>  buffer.
> 

Replied to wrong version eariler...


I can't remember if we landed on if this is needed? I thought the answer
was - no not needed.

If it is needed could be make this a single IOCTL. e.g. Call in once
with num_vmas == 0 + NULL vector, IOCTL returns num_vmas, then called
again with num_vmas != 0 + non-NULL vector. Generally we try not burn
IOCTL numbers, rather overload functionality.

Matt


> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     |  94 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   3 +-
>  include/uapi/drm/xe_drm.h      | 115 +++++++++++++++++++++++++++++++++
>  4 files changed, 213 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3e57300014bf..968c24c77241 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -198,6 +198,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS, xe_vm_query_vmas_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e5246c633e62..f1d4daf90efe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2165,6 +2165,100 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_query_num_vmas *args = data;
> +	struct drm_gpuva *gpuva;
> +	struct xe_vm *vm;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	args->num_vmas = 0;
> +	down_write(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, args->start, args->start + args->range)
> +		args->num_vmas++;
> +
> +	up_write(&vm->lock);
> +	return 0;
> +}
> +
> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
> +			 u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
> +{
> +	struct drm_gpuva *gpuva;
> +	int i = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (i == *num_vmas)
> +			return -EINVAL;
> +
> +		mem_attrs[i].start = xe_vma_start(vma);
> +		mem_attrs[i].end = xe_vma_end(vma);
> +		mem_attrs[i].atomic.val = vma->attr.atomic_access;
> +		mem_attrs[i].pat_index.val = vma->attr.pat_index;
> +		mem_attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
> +		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
> +
> +		i++;
> +	}
> +
> +	if (i <  (*num_vmas - 1))
> +		*num_vmas = i;
> +	return 0;
> +}
> +
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vma_mem_attr *mem_attrs;
> +	struct drm_xe_vm_query_vmas_attr *args = data;
> +	u64 __user *attrs_user = NULL;
> +	struct xe_vm *vm;
> +	int err;
> +
> +	if (XE_IOCTL_DBG(xe, args->num_vmas < 1))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_write(&vm->lock);
> +
> +	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
> +				   GFP_KERNEL | __GFP_ACCOUNT |
> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!mem_attrs)
> +		return args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
> +
> +	err = get_mem_attrs(vm, &args->num_vmas, args->start,
> +			    args->start + args->range, mem_attrs);
> +	if (err)
> +		goto free_mem_attrs;
> +
> +	err = __copy_to_user(attrs_user, mem_attrs,
> +			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
> +
> +free_mem_attrs:
> +	kvfree(mem_attrs);
> +
> +	up_write(&vm->lock);
> +
> +	return err;
> +}
> +
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  {
>  	if (page_addr > xe_vma_end(vma) - 1 ||
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 377f62f859b7..0b2d6e9f77ef 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -193,7 +193,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> -
> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ab96dee25f6c..177ee3a1c20d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -82,6 +82,8 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>   */
>  
>  /*
> @@ -104,6 +106,8 @@ extern "C" {
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_VMAS		0x0d
> +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0e
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -120,6 +124,8 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2063,6 +2069,115 @@ struct drm_xe_madvise {
>  
>  };
>  
> +/**
> + * struct drm_xe_vm_query_num_vmas - Input of &DRM_IOCTL_XE_VM_QUERY_VMAS
> + *
> + * Get number of vmas in virtual range of vm_id
> + */
> +struct drm_xe_vm_query_num_vmas {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +struct drm_xe_vma_mem_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the vma */
> +	__u64 start;
> +
> +	/** @size: end of the vma */
> +	__u64 end;
> +
> +	struct {
> +		struct {
> +		/** @val: value of atomic operation*/
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} purge_state_val;
> +
> +		struct {
> +			/** @pat_index */
> +			__u32 val;
> +
> +			/** @reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			__u32 devmem_fd;
> +
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * Get memory attributes to a virtual address range
> + */
> +struct drm_xe_vm_query_vmas_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	union {
> +		/** @num_vmas: used if num_vmas == 1 */
> +		struct drm_xe_vma_mem_attr attr;
> +
> +		/**
> +		 * @vector_of_ops: userptr to array of struct
> +		 * drm_xe_vma_mem_attr if num_vmas > 1
> +		 */
> +		__u64 vector_of_vma_mem_attr;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
