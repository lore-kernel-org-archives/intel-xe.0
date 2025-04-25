Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3095C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8690710E2FB;
	Fri, 25 Apr 2025 14:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4OSIha4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B4A10E2FB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590855; x=1777126855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IP3DdOZKoYJ5oA+3RhdSZCYCFCUYdnK7Cg/mB1q4Pxo=;
 b=W4OSIha4Hvez5B3u4bG2bMXfOBxzmsZcFjDOhIoBrUbE0ZGaBoQdZDea
 +Zv/vfnmoMFGkno9Wd6nOoCm5xzxHPJywDscBFdVtsMVF9V2blVRrWv3V
 H3GY1JBIJyjAJINWDhrdmR2ZLngw24nDg4Lak6C25u6wOdwBq2TkgvCxK
 PPOb8zqcUhuGYW66z1uxJFGY6wW3u2jBrnO5pR85WDBMr+doZz/GkGbBQ
 kQHCeZHHjNoFpPGZWD+oEqdQw1LxevNMtZ62OUKykIcEZmVmyBTM6Fi7Q
 ecBecJajG1aNOqxtSd9oeWdg9cp9RTjgCbDcgNi9MTh/JfTUiGp4cM5yg g==;
X-CSE-ConnectionGUID: TcOeFTXITiK7l54IDFb3Yg==
X-CSE-MsgGUID: AsZLFfxgSRKlEZOIfpXgxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51074931"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="51074931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:20:54 -0700
X-CSE-ConnectionGUID: 0Nt6qBw2SuCsp1D63Y9QTA==
X-CSE-MsgGUID: t3NMLWSpSDexBpISF2lXzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="170131759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:20:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 07:20:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 07:20:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 07:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrEyxcEtAyR8R9nc+/LlVgLwFFxv/3V7Bw+KfhjpsVtekhTU26G5uh7m9BENinKdMoaHBitleeOn6bn0Pz5rhlqrTC8w+M8qwei6iTqRz5UjUSZ25ZLu5ETPFr17MK2Ut0+uVZFKM5V3w7vb4ZJtuzBU8VVFL0QGxWZT67XZ7f7+LUQjHgYjdaY3HOWfCHq8VYKrqMIfcqP5pXVZWKwK93Vmmn/yvElWFWsdQBREhqTSD/d+8gFz4ouYhW9FHp+Djd3dM8hDn86NdDFTcmYJKL5ptJfEVNJ3xPelQYCx2TG/yoqtnoOiDsTT8v6HNMDdaoSh5RJJGLyRcJrDa2FeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3e+QwpOz+qQSQGNlB45CIbCMbWqDF14QleCfGMqWrs=;
 b=u81JXneLaz/fPV4Za8VgKuME7rLg24XPr9dWBNMTaLPDRXfVZD6vFtUHKdhG4mMHBbC6YGT7JvUQ+hvtLwiWANeaLcQpBmqW3ViXjuZ8O+j7k7gKL8gfSXGEUCOaA+tt+KPumJ3T7MKx6jcXpWSKGWIXT3o7h5cuJCNRJ3QkpFTnLtzsyCUp3U/Ie2M0Dhely3b1BHO6nkS1aEn+RRbdqDW58llUTF6JKARw75qQPeHITORLHb7d+4pZTWJnxmW6ivJIR9VvNtGBZgwlq63qSbwadiwRB7bk4H/dXeRTl2KbuDUNZEMdqnShM+m0ITgZN1/kwzajIjHDiQltiorG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 14:20:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 14:20:21 +0000
Date: Fri, 25 Apr 2025 10:20:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Validate wedged_mode modparam input
Message-ID: <aAuaIkqA_7XZ2IFb@intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143043.937-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:303:b4::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4722:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a703e1b-57be-4a3b-89ae-08dd8404501b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bclfDwlNnTbXZ37guJHorLm4e2wv5z+ZA4fhYuw/7LN40yQ5ZGlFKIqvK36L?=
 =?us-ascii?Q?UO2iv9uDrXEt1UWS+Oa3zWREpqtnjBd+TyN0WONwAmbFg72MoeiJYeNAEqRa?=
 =?us-ascii?Q?LpoKaTpHR2ig/0bTeayUUkadWhLs7TPfEysf+5oCmLSSOjeKn/yBcLaQ19vD?=
 =?us-ascii?Q?723J1fbDswTgYyjNZ4xdQnJTqMp0wv8i2Y9lONxJElK/U9X5nh4cupBcyPjX?=
 =?us-ascii?Q?CR4PnUL2D6yIAZTM9r6iTFjM+f7qD1MqLGHuCmPfHlkcqQyODy0bNJxMFCM0?=
 =?us-ascii?Q?rA7nD+XqEDw1lB3S6KLG9SnQ6s2OwtJmfSLDz73pw1lnGKYqi6oP2ZLtuxSN?=
 =?us-ascii?Q?qMoPphqKPGArIaYfobMaLfDr3dcenD6DZwBUoXS+iSZOnHtiU6r+Lop5XBBn?=
 =?us-ascii?Q?7E3N28eyzNUwxVgHhoomSpwhOW+GP6N/lEYBz3x6r6lQAo6jDMbUsWXyQ/PL?=
 =?us-ascii?Q?IynpvM1PxEif3qK3JxkTR4Q1US6fOd4QpeueiLLPnn+xBFc6zMh0+vS4eEaP?=
 =?us-ascii?Q?FpIjLuR+yA7sP626wOXmvnCwkT5XciOyTKBY7x+zkhF8JJiffcPLwxmPVy8+?=
 =?us-ascii?Q?LDZMLhQz3L41awxULcBAH1XKm4qsmylBqDb9qEzCYzmMwWGRyc/9hVQ+MzOp?=
 =?us-ascii?Q?CqmiJOnM+afxkzJi5oevMj1B91LoYa/YRGjOV5N+Zu/7Oc0Qh6RyJKNnuxw7?=
 =?us-ascii?Q?2YloBpfNXaxGifmcKCMQbGLZGdHKw/htqOcY/ZXAjbGY3q9GDQhhO0Yedj2K?=
 =?us-ascii?Q?hYp3ugM7/ZrmQLY8subPuNyZl/nPby0u1fWjzOAIlUXM1tgCJx1tMzKLY0wV?=
 =?us-ascii?Q?XvHEMxC61m/CUOIK0mZ7Zw+ZaYqyaAyDVHGjF3ZjbzTFQgEnRojolLCEjgSZ?=
 =?us-ascii?Q?rOyVAAXnmYWa+PhEqI8ENrMJ9kbfN5slqEVaYpaxE7dDJz0Z5/TI+0gj/FtV?=
 =?us-ascii?Q?xXkX90D28h1G1zZfgsvL4zZNRQBQO7SNLUxH2DcSdHfiqh8bpUBRC9+x7mxr?=
 =?us-ascii?Q?cE0QTQJE4S2qAWjk1Y32EjL4kCiisYwRcMD+CcthAfChpA2TCYS5wP1aYOFY?=
 =?us-ascii?Q?aKoYsSvv+RFCQw6c+eF9xnmaHTpf/F2EqtbNn0dgBBQ/Z8p5zazWc2Kjobqs?=
 =?us-ascii?Q?ss/MOHIckC74HbF2+aooiAM6Q3uRpct/jeXfnp/hMK0GBlTITNK9W89bIDY8?=
 =?us-ascii?Q?yWII0E22LdfsWmDu7Bxzwa5hlBkJvlowkPqC+m7wfN9rFjCimL385sWj+38b?=
 =?us-ascii?Q?BfXE66InAEMzROxOEdmWyQatb2xySzmcET5efS+/FnUEkJv+AzsvykOYZMHG?=
 =?us-ascii?Q?p1JMtXlDRLgxj8QVHdLpiapzOeb+wMNllFwOX1WNOLcDBIqLDqK5+sXSOadu?=
 =?us-ascii?Q?HBT891yWDEpvHEBKyU0mt+vDuPNlhB9Afivv51kYfznWnr6AOrOa6lTH08c6?=
 =?us-ascii?Q?UcUifaiNurI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hBOiMq/4Qv58tmyxn5FXvFlj983OwsGpXLQfZJd60PaG/OF2qVlu62U4drK4?=
 =?us-ascii?Q?PUJfAASDB0JnhoBQ4CuZQSuq4AmSa3ut2PkipJm/ABDfkHvkYbyuYKWBGVAp?=
 =?us-ascii?Q?CBQvBZx1Y/uQYq8PAWCxNisJshPmLC5pSD7hXeOL1PtKg/jR3EoRlV1GnLpD?=
 =?us-ascii?Q?ZzrLb3bjroDO2Wlxk1CIx6PavcP5wzPtplUeHZKs863+s7XxLmp+0E4srmXL?=
 =?us-ascii?Q?gmEP6lVFRgPvTPBVY4X57kFgwUuH3p6bkhrBvsTBukciLdJLbGfSdzfXPLbR?=
 =?us-ascii?Q?cldtEaCLhpjyjxSG/otBxm0xMPy7uq4GvLOCFEiNzdkWtgUGsPYILXARDt6g?=
 =?us-ascii?Q?woQAOvB0l5yXSKUNF1E29N4gVnesJ8Iw5OvmOpH2U5UcETzPj5vnR2v1C9lr?=
 =?us-ascii?Q?ZARp8ZQrA2k7VxSjzdpMAytdUW9MSQKrFgiRLiE5BjtY7YVxh7DnEBonKCSN?=
 =?us-ascii?Q?TqcUZDbz8UvfDPEXjx5CyYwguMEAktBk42RVatXKIg/85bv7aYKT97uKMXLm?=
 =?us-ascii?Q?AxzRyMHb6RGIjHFbND9FwqydD2Ui9TnziHrnLsa62nIMLDbBBT/Olh5RL7wt?=
 =?us-ascii?Q?82kUMYrr9+tzEJGZuvJdFLbhpLJl+XQL+OAlpx1ef897bSGV2p8CvDJApjPg?=
 =?us-ascii?Q?x7S9tADh4FQomBftMvrlT8/z+M54AXlkNha1HtV/3WsAhbTn/AVGHB1cMXaY?=
 =?us-ascii?Q?exlQlVNktm3Q8LDLz4dopMezYJsxOEBtTNmVBFovfG3DJRk4rb23D3+Siv1f?=
 =?us-ascii?Q?c7EjC/THfaUAYILVUCQtgIS7ymxWrLDehvyBLfYtZ0xrMDtCYuogjMmpUG8i?=
 =?us-ascii?Q?RCld0dNaaX0dKyQqaNQLs3FSQy6gbwjiJQLDF+0iNTa7Y4U8W8VuflaLQLos?=
 =?us-ascii?Q?E9GFJ0PV/oGWcNkGxrtbGDxuOnhtxKmf6FaazqgH6RXYBw3vAd3DvO6P7oXi?=
 =?us-ascii?Q?7gvYogTL5mZXrKuvLXwqDwRMJaFxUVAHJBqLJ0HXEaD4Cl6QrfXV9DMe3xly?=
 =?us-ascii?Q?KWE9gCyV3lZJ8Z9gcPWYdvCqADAMN5lZAf8WElix/StHtxxXZllPiKotg59d?=
 =?us-ascii?Q?4iv6hORDIVaEEiorSmMEMP4Yk7CCI/P33SP3XgIGBS84cxjGldvWa1BeJq1B?=
 =?us-ascii?Q?T/Uj3Nl+dEMYh1DCZPUL3MnvaGHkAwvg9jOrtGkACsz4WoJH+Oc+FpR6iiX4?=
 =?us-ascii?Q?T/A3f0ylpn1M7CnF9sq90G4TrZiBUa4AEUMEhqE+yf1FPlTh8UGyiZ/UfE6n?=
 =?us-ascii?Q?n+1KUW2JmWSALz42q8uBIGkYZDutBfJXAGrn5d4Jk8ERst/57iKq7YixAGIa?=
 =?us-ascii?Q?DVJfBLj0bHTTdyQ3BDEkjFsZynQmGax8Z/ngCV8/3bFDhP4ZJO1TW5U8Bm0F?=
 =?us-ascii?Q?zE0p1czYXBChgi9+e1wz8b81AK0CGPVuTkSrJxQes0f3VzPeHjdLEFr31uRL?=
 =?us-ascii?Q?zxpoYJbL/h8zjWw2onL6L0pOuyUsVrWd2nKRHZHOlBxuT3sGHDEMv7/gFlJY?=
 =?us-ascii?Q?niYPqc8jLaba1e2/9tSN0PE1MqT5ONrojB/0MHI/yOJjpRrU6INhhTDRPoX1?=
 =?us-ascii?Q?REqVkBAUBxI+NNAbLZgo+uUm0+gk4NUbMUjIJ6x9GwT9N9opLhSNqOSlwBD0?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a703e1b-57be-4a3b-89ae-08dd8404501b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 14:20:21.7030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UJr0iRlqxhgAYBcRYVHv8bpopzm4u2tDdfrAbQV/4Y68qW2fVsjbULDhkrcPIW8xx4bqUwaBoRYCIXcBF1Xyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
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

On Thu, Apr 24, 2025 at 04:30:41PM +0200, Lukasz Laguna wrote:
> Check correctness of the wedged_mode module parameter input. If the
> value is out of the expected range (>2), set the default (1) and log a
> debug message.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c      | 7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  drivers/gpu/drm/xe/xe_module.c      | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..d2de6936cc20 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,7 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	if (xe_modparam.wedged_mode > 2) {
> +		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
> +		xe->wedged.mode = 1; /* default */
> +	} else {
> +		xe->wedged.mode = xe_modparam.wedged_mode;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 859a3ba91be5..a471cf55ad8d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1856,7 +1856,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	if (xe->wedged.mode == 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..b1b9bb2056ae 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -71,7 +71,7 @@ MODULE_PARM_DESC(max_vfs,
>  		 "(0 = no VFs [default]; N = allow up to N VFs)");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>  
> -- 
> 2.40.0
> 
