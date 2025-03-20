Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D80C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EB010E69B;
	Thu, 20 Mar 2025 21:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlXM0i2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8310E69B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742507088; x=1774043088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0t885ljUmyA5gs63Ho63gMe0OGhdHlbvk81SeEZLC3w=;
 b=DlXM0i2nFqzNYyTPa6d63CziI8T845t7geemjIK8Q9SjkVgaoviR4Dk8
 zNHBp7sWx4gcb27+fiUMMIS6Szitxjo0gCwvRkNK2UKWW/fAYnGShWnbT
 BmI/00ZISUP29HmCfiCBRohwdLRylzkCSrfQjtUFoHoMRRIO0v/PdZjBg
 MfNEPaTWtnPIVbbH22yFujOU3RcdLHD9FZ8gKY5Dxy66eK7QdL5zjkI3G
 4/QqfLWyadjwUt/xS0DlU0HdwBKMZ9fzXvvkaE3S6ei/rDpo6/HJLpuV5
 0PIozwvsh4NmNeJUbAgLl/JlZesVtjCNu1UN2ulKruNLIJ0A1Gsvpl3Ei Q==;
X-CSE-ConnectionGUID: jBUSrQuXToug/dBQBvgqDQ==
X-CSE-MsgGUID: NYC7qUqYTbKDqTbKIArDHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61288897"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="61288897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:44:48 -0700
X-CSE-ConnectionGUID: ojHRBoWfTnu91BkhvN13Tw==
X-CSE-MsgGUID: t4dWnjkRSBu0oqAYtzg5+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128282777"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:44:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 14:44:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 14:44:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 14:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oczzNbZNjVcKKtYl8a2Mbb4wWfg0q1kMxfXcdXD00i/nSxoVeJnE0XtO+A4/j5+ZJoRaKuaExVz0vwnqykIOXYFAVIT52MKiq+y1MwMxsvXAvft04RBzijcGZwHv8fZtrOqwzfubYhNGS9EbQs9MHowCNqXHykBimweiXkBvnXn088PZJnkfnVJ2dGEevno527+7jVww7DeQnd3wvYi3lej490jw/6FqcpWgEWSdYX/818+Ny/mFORrHtj+BWt3JI1y1mcYtQy+M9ZoGiAre/SEx2Vrp/26u0sohGSTwpeWybpD337X+Vm9ECaAMC1uSuuT1UPiP7Vpc2lRVOD8o+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8CXx6n/WrbU8VaD/C9FyjZVJEI5nvu/WVrEHmcA8/0=;
 b=en3+6yQIkhiWGjBZS20W2OA6orwfhC3BK2E/g8dIdmNvjY5pNa6HKozWxzEH0a4hmG7dFR3XSBHBlGBGsZMNdAb+qXJP5MV+Stz+EmmTxP9F9DGW+IvCmBLc82YpmanETUjqnyC8nNxF1KP7URITp7AKu/EBzyhsCNrilPoWUHJyI8Dr79PFn9Drh/l+jhE5DCODpdPkqGhcEFHVFAlqrDBqsrXYn0ps3LhgAGZUAcxmIcFIlQVOGG+U17Qak0h0ld8Zy2uz+Ga+CqJ0oq+6frnV87nwGhmm/yq5Q+Q4ewmP3Y2P0TNEYirl25ca+xeQvnjwGskuBPsghgwtaso5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 21:44:08 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 21:44:07 +0000
Date: Thu, 20 Mar 2025 14:45:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Remove extra spaces in xe_vm.c
Message-ID: <Z9yMbpMle5PF1k+H@lstrano-desk.jf.intel.com>
References: <20250320211519.632432-1-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250320211519.632432-1-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:303:b5::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f04188-2ac6-4b54-c514-08dd67f857b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x9Xan64BVolNbOhJ1nRco3fMhECkl6x8Wx06SgiHeUwz4cvl6GAtjmkg1ict?=
 =?us-ascii?Q?JGQMOZuyyl9fPrMxfbMgy2jo812y8LJrVZcQZAxOZ4LhxQFLqKwYMfR/RAEz?=
 =?us-ascii?Q?hDc/OeTxhAs8DeV5DmpPsqnmaDpPLbz5lmt/QohlUOddfVOUMn7e0Ozd0UdA?=
 =?us-ascii?Q?gol1j2dV/UNSeEiByWWyVWY69eNSmtMKdNVVu5/4a1jfQMJG0CW2YQxKdvNC?=
 =?us-ascii?Q?e14o16cGKfyBvHq5Ql+/MpjCq4FjUUYnJPONkb/jJlAoSoE5Owf82oAt2Wbc?=
 =?us-ascii?Q?52vHrdHF9LV+M8lYzoyHrwDQ83oK/2I8LjnN0cNwOTBsR02XfCfkAwp8hsS1?=
 =?us-ascii?Q?vE5ioIUDoCAxGB6z5PEqiwh79ea74ITJzpuX4YoyhCP35AwYRShLEa4Z6Znt?=
 =?us-ascii?Q?h+GWZPa1ToafqtklvRSb02C6jmeiHh4fp2/NK74Qis0R+Zw4w5w2nJ2C03Re?=
 =?us-ascii?Q?uHQ44/9IJJEjFALgk+jmdNr4pIvFCEYk8/zEVVwNWoNPyi9XBzXV5bbLvTvj?=
 =?us-ascii?Q?m0VYahCDHhrzezO4oKE3eWyJVUOYENR58swTVg9fCEj1OXQXNce9phegN8t5?=
 =?us-ascii?Q?MW/PokNECW4xVX7A+bm68oBK4x4QuTI4ttu5SWsUqKloRnZbzt1DVjhw3q96?=
 =?us-ascii?Q?Df+Qg4+ACGqZSIJydVTszmldbaBuouai6w4E3tbmSam35wd81VLhEEo10Rb/?=
 =?us-ascii?Q?VGBXoXasq9OmwZHj5JZGReFeaQ3W6uWIy1lll7Sg6Gi+BVAtzA66/TshjbaQ?=
 =?us-ascii?Q?aNLyNJ/JaGrZsPQdih7QqgS/q6wU/TQF5/vs8r1mTMKYucpMk1nT0Y/F7xfr?=
 =?us-ascii?Q?tJUoSR357d2r7B51Ud/6qWzDfQ04zwiYXE5Gw9LLA2wWiIjQPagw46yaOmUo?=
 =?us-ascii?Q?KPDJ1gGQMAR7E32fjjYl/1RjRJZIdBc6oSVYzvTkTqVOvr6cOSt3srtDJF+B?=
 =?us-ascii?Q?R3vydlXwFaYV5kFVJViWQ2IH9+W6XphIQDBjqV0lg191Lq9n0jv98890gj8p?=
 =?us-ascii?Q?23jVi9aaq38LfZUhjjOsOgeD1gZBYnQV5dz3p4bZXi76SH/U3gaQrKh8Ct78?=
 =?us-ascii?Q?GBjrjMLcKONvMx4+/3jH+hJ+VY6MHpAl6NRoulP6f6mlXtAeypds6zI8+Koc?=
 =?us-ascii?Q?DY5wigHB7pvU8j/TWx8DgsWerYuCtC6Rl9DUVDeIPNI8v6NjVOSV90hh0X22?=
 =?us-ascii?Q?RzW831VaOn0RW1w4+iISWvV4w8IxkAEqvWXrs9yIB7Plj4aDX+gNu1CdORSO?=
 =?us-ascii?Q?Wy3TD6xPQPyqEuosSbuvmXNbq0lb0Rt4QLeuv4d1BFd9lrT8Y6253rVT/npg?=
 =?us-ascii?Q?csnh+HY/q9/vQwbX8cmLWQ52tHNB3LGxH4DFOXuiUUfC2FZUfwAatQaOEnzT?=
 =?us-ascii?Q?IFjuG77WXrcOk2iimRDddM/G5fKe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxBt54ak3Q+DIz7I0MgP6b0mevrEsvV6ALRP1tibqTKaGMmxTMqMv6fEffoj?=
 =?us-ascii?Q?y4S7TwXI8+tbeGe+oknLUksCjTz/u//tNgb2xbfwnR28GQrgvP5qXncuxSFw?=
 =?us-ascii?Q?js9w2+ui+E5HBnb0UCp0SNz8wt/CHg3sRK+/IvFQ4wW6Qh2MHqtPOTLWJ7Xy?=
 =?us-ascii?Q?cp/2KWMTjTzFm0LYwjs7M+AXKiU0D1pZb5ENxAOJT8IkV7HDXFKrJh8+eNzw?=
 =?us-ascii?Q?CuvhC48qP1HMWsCOCyWSfXVIvaXYgP508MhnuSGn5Yhv23Xk9jvbZg/ObWGF?=
 =?us-ascii?Q?RU5SD0ofm+nB2+X+4FARn5LD/2L8Tg+c9Uk4KgM/fYeOLNCtI0Q+oS28INPc?=
 =?us-ascii?Q?zPSaw2nqeoJmIVnyq29Cr0BIuWmYMA65Iinp6xbIgOW8MS8YY5Gc2fNPaDW1?=
 =?us-ascii?Q?iUigbmSUCZ/CZjL2CdVEaoSUFArIlirU9nfKr6BZ+mYZNJH7lqJf5TUqV0tf?=
 =?us-ascii?Q?B9jciEjyZPsDWc1P/EgUueCxxmU8UUeWq05rJKOF/voC7uJrGqlihH0yj7kP?=
 =?us-ascii?Q?wdBB5l3B74lxGO3X69mZfJQ8XMEAlqobfA6jZbRaEd2dDfUgcxRDBM8jFNjp?=
 =?us-ascii?Q?4sTGe0IvTW4PIIm8hnUKu95nxNvmKLnO7M0CY8cuynoUicei6m+Xc17QZZGY?=
 =?us-ascii?Q?WF9lt4mpkOzOUxtNOOOwZMsUhdYYBSwnCT1BuPYHxj5TTV0LC5dY95dYJtqS?=
 =?us-ascii?Q?xkdHLya2VyYWoYVY9CjwMcwMyNDFaXd4DLZIYwG/zD/L65WFKjLs54Ge5GOj?=
 =?us-ascii?Q?iYrcwPVggDZL8mL0KnWO4bg+KSHgeQ1i5J8XK4ZotgCVlVIJ8Qgnyha2J6GO?=
 =?us-ascii?Q?RNjfn334TEBhYGBCJqgnKCUAyKTH9Oj7XZXy/rveb4j7jBFFak+AiwpjIN2u?=
 =?us-ascii?Q?CF1A41B0JsEsrlpuE31d/H0lnnHvp2jpCp+5i0MN8yyJw5U5K/PBKTki3y7f?=
 =?us-ascii?Q?zSu1X/VK77q+M8SCpZxa22rTXAFCTu2gWEKnnrv8gW+VQ/hjeRkSPyip8qvJ?=
 =?us-ascii?Q?G8YOCvIc+ZdQi/i7ojnAJ7DSF3t0Pi6fjNCCi9PXsGNfPCf/GI5WgBoX5R1E?=
 =?us-ascii?Q?PhBuCkvSTuugOUQsrEfvXQ8bL7AOzexTI9fxaHM/td5ILfGwlNwKg9tE6HRs?=
 =?us-ascii?Q?yOJGPss4mrPDhSpc4Vj5BTYoX+X49VFq7Te8IzZqZ2PDYrIvkqNpC5tpn0l6?=
 =?us-ascii?Q?geej/HzJe67H4+/9/nrDeQoXQSvvpe8+lo3WcJCkgqVihn6w4rN6ssf8RSSX?=
 =?us-ascii?Q?lk0lHiNmg277ywo98xvAA+a+ck84phOBmLDXjmQN7CS7PsT1z7+1LCZvc1gC?=
 =?us-ascii?Q?8oDb548An7xP/b/Tl1q0ZXbSde7qAMTIs2TaGrW53powsnck/6VIzEj0W30O?=
 =?us-ascii?Q?wMuH879h0y2vmQ0sPSQyuN7IUf3Qqqo84WuBtxYNxzXiGLNtFFCTrWEs7E9i?=
 =?us-ascii?Q?FbCGWTNd3OnjPNyIh0eGWreRRNS73uugsNev6Cvm4VYAfNuU+SEoHC+aiI66?=
 =?us-ascii?Q?l6bfNH9Tf8FIP7yard3ELPJ4d/0FHnAUP0vccboQpYeHEnfvus62sc0LSGCc?=
 =?us-ascii?Q?1wJ7jKEDk5br+CtvjNokoufcbWmPH9AIpt6KwysefuMI1+e/OBATAHfgbpX7?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f04188-2ac6-4b54-c514-08dd67f857b8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 21:44:07.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivWkxYWiQyfb+s3PISLcSdNZUdu8CfWdhrIFhqIRCtHSdDjUUoeYUp15tx+0sIYR+VDwEp7pYvBd6KkCGU5Bng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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

On Thu, Mar 20, 2025 at 10:15:18PM +0100, Maarten Lankhorst wrote:

Probably add commit message.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3dbd3d38008a5..fed4b97d1882d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2980,7 +2980,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  				 XE_64K_PAGE_MASK) ||
>  		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
>  		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
> -			return  -EINVAL;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -2988,7 +2988,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  	if (bo->cpu_caching) {
>  		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>  				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
> -			return  -EINVAL;
> +			return -EINVAL;
>  		}
>  	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
>  		/*
> @@ -2997,7 +2997,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  		 * how it was mapped on the CPU. Just assume is it
>  		 * potentially cached on CPU side.
>  		 */
> -		return  -EINVAL;
> +		return -EINVAL;
>  	}
>  
>  	/* If a BO is protected it can only be mapped if the key is still valid */
> -- 
> 2.45.2
> 
