Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51DACAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 23:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3C710E4B1;
	Mon, 29 Sep 2025 23:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYbVMLVL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169C710E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 23:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188431; x=1790724431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HmOtwenOgo0jd1Ilqu3e9l8gYypoiXFF/gbxrkEdUZA=;
 b=BYbVMLVL2foPXR+Vsj6UvWyIyEaSAp+tyNOABufPCaAjX77LbgxoWlV5
 bP9RAr77wxvkaCC8G54Kgz/XuEDoQnEPD1domvr4kp+gyp2YvcF6+f+w3
 c2mX1qMJ4vMEvLvQ8rdy/OwVm15gvWiEfCmcix0OiJPjK412MMSYMXFKB
 4hunT/CleuaXe8xN0sIDG/NW/zTI1WSdsjY2EUF7Jyezo4iD9HPS4YfHP
 Hnz5j7nYZfvObUiOAbY+NqIFmwEKUGktQQw1gaQ1/Aht0J4oAjnRdIBSe
 Zpaltn8A1qC3MKq05s4jSoAamFy/cI4J/cC/KuMByyqDCeYp5CGlcIe+j g==;
X-CSE-ConnectionGUID: YM7wrk7+TpqdqLM1sVBi9w==
X-CSE-MsgGUID: eUZxsEMfQXKCNda5BnnxMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72541206"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72541206"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:27:10 -0700
X-CSE-ConnectionGUID: Wdh9tMMTTFy4LT56CMhG2Q==
X-CSE-MsgGUID: IIZvKVn6S/SwCIhD48Iedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178400102"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:27:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:27:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:27:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2GdQ7GetT3aO6PqgfTpPXEo/XmgQ6KG1jNvXzyT5385YykO2WbpkAEZvNEDEs37g4/meirRsOmxUPwfvY8XDLNyn7ltjTu2uVneZmwpsUy2ZTInR8pueGOiPQIV73DDkrSlMdf86Ii4/PqIslzppu/xRg3gxZWBaTucoxxO9FvgIsPI7bWcQ246xgZiPfroJtlbp71v5u3gf7p+XeV6cHAJ744405Q73zXXGb+ifHp4jFPKKHI7uI9RXWMEnS8YAB346sb3E4+5Ympru9TpQoKp8cNDno/AVvOzoOT+hzxS1K9x4yA+V8mg0s8+qzKwzB9nnGjbpKAmUtcmgf3zuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nzTYbeHNnH5QQYT3Db0KBvE3lNqUqBoydUqDkFbtag=;
 b=n4bYyMyIWMabTw71lskyaVcsgmvV3b7WmGQFYxC4DN6OK1CorxltL+YpRvHCO0cmMsWy+nv6FqX2IWKKxtKGm630e4iy/K+LSASBUXamCWQ+r8EZ+XXvKHKj6l/T3S5Pf7cIPP+3e6BpC5gdO+IQENjONN1ue3OnLn3gcA9XhbjCxEfO+m5NGoRGFTaDgQ97aIiTKmHUEbpre79qt69Ijq/Rsh24LucJGDQDGVCrVaROMCd3DCGMw164Q0R6Ke3XVbBHOWunELpYWnaRg8anpGAeR3Kf7Pt22nuXnOZ6G+EE7P9J7O4/WEURAWRdzg38QkdR2BucAqdLTsEuVK1DSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:27:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:27:05 +0000
Date: Mon, 29 Sep 2025 19:27:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/debugfs: Update xe_pat_dump signature
Message-ID: <aNsVxtprooXpidGw@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923211613.193347-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:a03:40::49) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd05676-c728-4602-b4dd-08ddffafb3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wv/jcGxQUsLr35jTrlbUwBJmqSi7gKtcVk3FkCjVT+Ff0g6vfQ+ty4QG+tDM?=
 =?us-ascii?Q?KOkCQR70jP9noYAsduBh3+yvgPnd2tISWMg4sLcD1oeafPL5J5u7n3gaF6nU?=
 =?us-ascii?Q?725odulKO0GtVlwGOO3Brnfi8m8+7ZfoyJBofSVJ+ihCxmlF5ntrIrf3GncD?=
 =?us-ascii?Q?quRRSOGHhxvanUFCdmTo9UoqbhXrxFg4hc1uhKszmj7KHNXUfPe8OZBPrnEN?=
 =?us-ascii?Q?nadt+27hPs74E4CMUf8hX1HGHg8pB344CeEHMHy5LoQDswPIzT1AhkaOpb5J?=
 =?us-ascii?Q?NmTGD3yrTzJM0ocmHn8FuASocnCtwgA9oAjLJpwarmmGXpW1r0rjLseLP9tk?=
 =?us-ascii?Q?A/KKl0mkq4Rv498B4EaonMdPvDx6eodj0hsVYcuYvK/6IjArtvPzCRMPBiLK?=
 =?us-ascii?Q?CX6hhoTEat5cA5cdkzIbnQU5q2ON9k1qoT4DviOy4F+8Q/S119o/IORAC4J8?=
 =?us-ascii?Q?k5G0/LE6SV4ulrJcpQPgkie9Qt3fMVv8hrPR8dFrSAaphLgXCcT976Wt+Voo?=
 =?us-ascii?Q?FkElxvWRDJtk9SH9xQ7AjaCUEG97P5heoGNIs7wv4I3GLIG5XqmLZF54FxCI?=
 =?us-ascii?Q?KIwBWtr+Dejuifwx6c1g4hC+JyMFr0SpoGavF41qjyM9V2gPX+8FF1Nq6Uum?=
 =?us-ascii?Q?sspmdePXrDEZ1zyYIBOFUnwfGCV86fFfqJ/tcCypstbzTuc+OYBkZE71CzWk?=
 =?us-ascii?Q?us/gQ4MLbPojd0X0RiOJ9TLSZXr3ZdXz7g1K8nzXONiD1oTsNyvWf3hksUW5?=
 =?us-ascii?Q?wCp40dLGrC0kA3X0EfYuraxJOkyV7SOkjS+Nf5z0hTpS/t9i7+sVaZAiYBzj?=
 =?us-ascii?Q?hwFK9kg00SNgIuxKHppk6ZXN5Mn1fCNIwanjx/s/JNUpQBxGjyHsO+c5pb57?=
 =?us-ascii?Q?u3WsDRH7VW5IOHvVi7J8TAoA8WDkBi1KV6QVMPaNaXVVOLPqH8RFvOEVKPId?=
 =?us-ascii?Q?+Pq+lUa32TlLXKZO62enr6R4escF+ABmJXI6D9POqPReBpY5KdJNnlqc0SMI?=
 =?us-ascii?Q?AoV1xOtKItm0jzp8aLh3eET5XY8Z1mnHtPQ49vHUYLIKT4ASaMYUPeQiPRem?=
 =?us-ascii?Q?AVbqINuAFnn7fwFLo5j7yT+moMgH+/8VQlVvZcGRzYgb0UvER99oaQg0k1pW?=
 =?us-ascii?Q?aBcNkybrLhtuMaiNDw42L7MFvS7pPKHrRbmyEgXji9wuHBJkB0lAa6B27Rco?=
 =?us-ascii?Q?EyFrH/qlU+YFZ2Go5fbWjr+NbGXgnmw5c37Ul1nWo8Ty+nW8hyFVADEUiEM0?=
 =?us-ascii?Q?NuCyhvEhMJiXc+lP1+6avSH/k1rZq2CoUNw31W9Yb33we47BqnuNNAXHlx1n?=
 =?us-ascii?Q?Pr+3ZGMi9Dgltee2WoodB60z8aLopivL8C0wqe4HhilB4aofV221CaxSCGtc?=
 =?us-ascii?Q?3aDaBactvDl+DsZK8qgkhUf6ZmArfcmI4dv91Huk+qcjxK60xLgaHG+1tPkr?=
 =?us-ascii?Q?9B3LNBgJT9ik4zCwmALY0P9JxqzyFiRU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g5TsK03vMMIlBVJfQiNvInQp0IVzQtkvX4PV1mGY1jOPCi3a/i2LJx5VEGBP?=
 =?us-ascii?Q?7kMTipWStP8s0/4qkJej+iSbVpwDR4Kx356vO7yHOPZFkKtsRAp2bZVsOzkw?=
 =?us-ascii?Q?NmWcqkp3ST0Fe8pTPnzcn9yXC+UbRvIBaBKxbyuWfPGqBqwYvcCsL5dQpXYg?=
 =?us-ascii?Q?mrTJHadJToKiQG/AHTH0STEl1WMZhH5a+/Us5vO00/CHxMXWtnf2MKppXlHM?=
 =?us-ascii?Q?yutjs22eF2v6railSTON0RRi4/JoX2zyeuhBXdOcrvYolldaB8qkjy0GyGbm?=
 =?us-ascii?Q?KOEgY0NGPMX9/bNIFr/4Wi53ecNp5v5Y2uKpxYqivi+hTejLq4nbBZFPilst?=
 =?us-ascii?Q?j34apZBVd6BWtYW401VDCJxO71T5bHuQH6A7OWgQQ4cgexLBxaxElHiZDQoU?=
 =?us-ascii?Q?QDXXGuSPm+ERvXul8KYCRCYwZBhyEcHwRTOGCqblTuvszRKXYf/ElvYhLz1S?=
 =?us-ascii?Q?ZOtFqdYc2WzrpLjFTrObQ8QrhDq/g0gzFCfEqI6iUCMaGpjUTfGRznXgBIz6?=
 =?us-ascii?Q?5TQ6g4sfcusJuTFvfFuqKunP+AJyCwbUA23d0AjBGNnoFabSWlqBlyMokIFb?=
 =?us-ascii?Q?fuoBA80YZn/s76sggt2clTK+OnaJY3fr7BdPjHW+h//XhZFxoCP6QApkcSM3?=
 =?us-ascii?Q?orGWvLlhjDw+iZvh+wjqzJUeixTEA3xWzaUvhBbzsWe/voucIrl2SiSxsVy9?=
 =?us-ascii?Q?aLdGCp/6LjuJiUw3bu5wXie6m9kdv+qIeqGxWSUZ9OsqTErRzVEESd+MBUcD?=
 =?us-ascii?Q?0ohPsj+/uLg6BOi9SuBuj/ONuHdIE6sDK/qH12xCXFQ+F7FPpZQCHa/aZY0r?=
 =?us-ascii?Q?4fb+8hCT+T18n16RHm+8BA7NHmUt9BstKud4fCViMqDptTOCtdSyHENDHXL1?=
 =?us-ascii?Q?gg+0yO6MEsrJzRenJBIbL4fsdgNKMuFzTsBXgHwo0s64gHL9XwpfKMb3Vfak?=
 =?us-ascii?Q?XKSdwrP92C1+Omo8zC9garbkr6qr+aWvyZBcgXEsaEfrCIIp2V0pYja0m6x9?=
 =?us-ascii?Q?9YKQkfYu0i4h37X6llHIsMH3c5/nnpIJfyoXAH31JNj6eDSGdPQKhsxxd5hA?=
 =?us-ascii?Q?whfrjXeel1nYtqEoAjbawLQFYkzIgX3cfrXOuffcITn1D1sRxhcqb3Cb5orz?=
 =?us-ascii?Q?2Ov2HTPWFDZPbMq/SZdra2WVROpWSC3dLdz3eX6lX8ZACHX8PJvO4YDfQmNJ?=
 =?us-ascii?Q?UjnvJI/gDDryeV6wn17fnZSF5AHOdaw5+qqWTl5G5IKuyNwHlXusjcPi6g2f?=
 =?us-ascii?Q?HJ2X4sM2Qvi5CnkYI3uXWk13MTxfSzZfTdt+afT5fFNwWA3RumXoE2RU1r/4?=
 =?us-ascii?Q?M8zqTCi/Wo6UmeG9qnHblXG7arbanAMHN3O3jej2/VC3vr+6FGT00+5NsPp6?=
 =?us-ascii?Q?5htVN4c8zy4C6+1+M9XNmJGaPcKWFgfLXabYF9NMs2/repePXd3HKzxPQnUO?=
 =?us-ascii?Q?RjrMkf4AleaL33N8xohErh6kwKjkEgPotJ/6uzVmoE7bnDJ4I/OUDnU0oMxO?=
 =?us-ascii?Q?Snx0Nt4nT/yAseC+O+OOuBJa9x8ncvZcXiMOuaLnmCtvVxh8oTYImrRhEBiM?=
 =?us-ascii?Q?RJRRHELZCvfdAVEPVzwYC+jwi4qJwtTkMq1BPwO3KbEnP30G4/foSqh5q3RP?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd05676-c728-4602-b4dd-08ddffafb3c3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:27:05.8828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbkkZeBkDkCjDL8Vb6al2sjawlBn5O1ETrcWJzhXRTsfu57XFZOcGqJiH3YMbW6z6hWrHTGLWToENUNZvKJGOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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

On Tue, Sep 23, 2025 at 11:16:13PM +0200, Michal Wajdeczko wrote:
> Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
> functions to return int. New signature allows us to drop wrapper.
> 
> While around, move kernel-doc closer to the function definition,
> as suggested in the doc-guide.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-----
>  drivers/gpu/drm/xe/xe_pat.c        | 40 +++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pat.h        |  7 +-----
>  3 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b0e6dafeeacc..e4fd632f43cf 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -167,12 +167,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static int pat(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_pat_dump(gt, p);
> -	return 0;
> -}
> -
>  static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
> @@ -232,7 +226,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
>  	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
> -	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
> +	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
>  	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
>  	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
>  };
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 2e7cb99ae87a..6e48ff84ad0a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -57,7 +57,7 @@ struct xe_pat_ops {
>  				 int n_entries);
>  	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  			      int n_entries);
> -	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
> +	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
>  };
>  
>  static const struct xe_pat_table_entry xelp_pat_table[] = {
> @@ -194,7 +194,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>  		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_pta->value);
>  }
>  
> -static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> +static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
> @@ -202,7 +202,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref)
> -		return;
> +		return -ETIMEDOUT;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -215,6 +215,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>  }
>  
>  static const struct xe_pat_ops xelp_pat_ops = {
> @@ -222,7 +223,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>  	.dump = xelp_dump,
>  };
>  
> -static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
> +static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
> @@ -230,7 +231,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref)
> -		return;
> +		return -ETIMEDOUT;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -245,6 +246,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>  }
>  
>  static const struct xe_pat_ops xehp_pat_ops = {
> @@ -252,7 +254,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>  	.dump = xehp_dump,
>  };
>  
> -static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
> +static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
> @@ -260,7 +262,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref)
> -		return;
> +		return -ETIMEDOUT;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -273,6 +275,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>  }
>  
>  static const struct xe_pat_ops xehpc_pat_ops = {
> @@ -280,7 +283,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>  	.dump = xehpc_dump,
>  };
>  
> -static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
> +static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
> @@ -288,7 +291,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref)
> -		return;
> +		return -ETIMEDOUT;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -306,6 +309,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>  }
>  
>  /*
> @@ -318,7 +322,7 @@ static const struct xe_pat_ops xelpg_pat_ops = {
>  	.dump = xelpg_dump,
>  };
>  
> -static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
> +static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
> @@ -327,7 +331,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref)
> -		return;
> +		return -ETIMEDOUT;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -367,6 +371,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		   pat);
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>  }
>  
>  static const struct xe_pat_ops xe2_pat_ops = {
> @@ -462,12 +467,19 @@ void xe_pat_init(struct xe_gt *gt)
>  		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
>  }
>  
> -void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
> +/**
> + * xe_pat_dump() - Dump GT PAT table into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (!xe->pat.ops)
> -		return;
> +		return -EOPNOTSUPP;
>  
> -	xe->pat.ops->dump(gt, p);
> +	return xe->pat.ops->dump(gt, p);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..268c9a899f56 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -43,12 +43,7 @@ void xe_pat_init_early(struct xe_device *xe);
>   */
>  void xe_pat_init(struct xe_gt *gt);
>  
> -/**
> - * xe_pat_dump - Dump PAT table
> - * @gt: GT structure
> - * @p: Printer to dump info to
> - */
> -void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
> -- 
> 2.47.1
> 
