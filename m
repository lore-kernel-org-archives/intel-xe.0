Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE944C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 22:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FD910E047;
	Wed, 14 May 2025 22:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlAEmnYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B0010E047
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747261236; x=1778797236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q27BO4sPllF/trZbNKKXFC5HV5Gcct/Vl/eTyUk4HYc=;
 b=IlAEmnYRR3GZlXKuCUNiDCI+v3AH3nZ7VaBJ6f3cDFgesLFbPW15SXX7
 /AeaJB3JOfbM4YmFBByKTTEF5U1c+I3gAC6jyAh+1Kqk621pm9Z9Qz3kU
 ye3nqqNU/9fzKsBiK+VAmP+YAiXWNhKP5IGSPFK0sTXoe5YSLcfdvMXWK
 INuVqOSEGz992OssNnQlrfRgtf+nLChcxpWasyU3e/GQSxU/zDbtdXqtx
 KKPa398KaVXSXfD1NmBdPh5AlWHT1SDQdcVzzHHUT6SgRPwFQTPf/iEob
 l8aZV+/mqZk80sbu2TvDK9V5VJL/TKF4gRYNzROvbhMzKlUksvK9t0+HI Q==;
X-CSE-ConnectionGUID: mQi3VBIuRuqDrb8ra2r/tA==
X-CSE-MsgGUID: DgrVBH+XQXG8Pjg1NG4gZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49164137"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49164137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:20:34 -0700
X-CSE-ConnectionGUID: fLbmXhRURbiOJLM1xq98Gg==
X-CSE-MsgGUID: CgC9sZc0SAeNs7yvhzZEZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169111486"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:20:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:20:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:20:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0qO7HIKPvRwHyVJaYILyxMyXetGLSBXUKtT6vXPU4zN9EehkiVrOyTCS+PM77F+MVPYD56UseH0d5tBn+GRUAtKMwl7l0Fbec78oH8ptA20lapfuKv86iCaJFKMT40GhSoXtPUhcdsJONo8TNLtxXXSh8B0ZXU1dGieewZhx/cLk9OBYtDmRTvBVqJNyyNxmeqRox7nSf+8GEfiUb4k98VV82OV+ari+hkAEVAB24zxapk8u2E6t9YdNqMf3R0opm6M9KUVLBvhJNGVMsi5KRP9zF6WN7rYYvux+5Q8WGoohN4fQHL0VguzpZZlBzEM/v2mcAZdVQVUuw47iFAPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twRS6Q0WHXH9ayibU/xNYFsOX3j1JPjrbG1DdtO0RRw=;
 b=H+M1aJtApv8o+8yFuqlfVxTb7qAam0buf2KAgyVh2OJJUpv245/WfSDffZQ2+wKI1TOLm9plyYb/qDgFfQ62OpLoTlDSV4lEaCMDiCRSEauCPByiLEBu929kc+oYQItYs1kxGTmlD15gyKY0uDDMtCjMK9LxHp9X4di4Py4flbLKCKTOZGxiW+TttIJj0N1RTeQ4bCcaAY+VCrhCUvLaDuWB2XO9zUOi+w/D07H1FJWYa9LAmZ94lnKbo/gsYUUgfzsP7+bn6BV2x0kKTTnmGHAmiGCckQq2v7pyAPRIX6dyLnV+gdZ0cZYWpdE5bSQG2QxkOu7MeqDG5TeXt86g/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 22:20:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 22:20:13 +0000
Date: Wed, 14 May 2025 15:21:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 25/32] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aCUXcxq8i7LjGl0w@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-26-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-26-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4f7280-f941-497f-2d25-08dd93357eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qH8SH6gzkXeA5S2Nv8+1V4VunK2q35y0ei1HAHIKLt95lkEvDx88Gid+HO8D?=
 =?us-ascii?Q?Of+k3KKAN7hDYh4lMhWIxz9ktdRVqXh8Hl8AgY3i+H7EaKmpJNt0iaUm6C95?=
 =?us-ascii?Q?UqWuts21xdeQZx2X2DjJYJHdajR6ZM3Uz+IG6fCHMY0X8dWaPKtT1hARz9/b?=
 =?us-ascii?Q?OUj2vCnk7zdye0vhQEvtZ8TSPeQlaPo3wwUP1lS6yTrkVbKqbemFjMTyUZEc?=
 =?us-ascii?Q?Ahjd/sI5ZNztgPcT9TnVEpi+Lh2OZm+Tp4DvH8A6T5KKQGaMhV8l7qTnyGfX?=
 =?us-ascii?Q?B5c4qtOF5m3PUAgIuMafFtUJLqs++eYVSSSGmb62mnTr6BcMVJRTSNkj6Oss?=
 =?us-ascii?Q?+VJTroauu3B1DHOeQzqv8+xio6UiLBLmTYZ373XNYdiTJtV7+ahmSzJMHWZ/?=
 =?us-ascii?Q?aYQI5ok0pR9iJIm8WlcQsnkijyCuMtqekS6ljHXltHhiqbKQI085ZhtE2WUw?=
 =?us-ascii?Q?y235wW7OBQM2BfSiXd+xx4UwKcoxWCQan/7QS99egws6+rOZYR6TXPYOpyip?=
 =?us-ascii?Q?aa11uR3z4cctPJiRNXjYCKnDBjXJheCpPyCPnWRhQHF1kwB+A8y1issqoclb?=
 =?us-ascii?Q?HZep+AF0DTLbduxvlK6qhJy9TJzQ32n0zapixR85hv7hwr/rwxAjy7pBgD7A?=
 =?us-ascii?Q?kPiuiNGL3hlZH2yOSKb7fHxlotqrlvB4Y5eMS8Wy2jNse4puej3wLMER30Eb?=
 =?us-ascii?Q?MOtuBUaGk/nMWO13drtKQkK22GkrwBMiBItTe8e6Fo/2ZfqIyHQNLRT1xlsO?=
 =?us-ascii?Q?YJwACOGtO6lNE9ImR92NIG9AxAHu+io1DO38FTjOksMHhnPskFQUK9pBgGGn?=
 =?us-ascii?Q?gVlbFrWXyg3hwGANE+F6TMMO11/ESu0GbFzbUDqEigILC25IjuV4DimFj1rh?=
 =?us-ascii?Q?csJNxNVLgG6qrLEud2IYwKG6oTjdCAw0pUE8EMwo04iim8kmZK9AiTgtEnF3?=
 =?us-ascii?Q?GbA0uZjKWTsU2jiBvcQ6ykWJYfMBK4SnUOkx4cUVZyPrHDl4FkRc6hV2ZzPm?=
 =?us-ascii?Q?VN+xBAzxgs1vnw9MyQlXy4hxvXOWdBFb4HacE6KGBX10Nj8bxBh/x0CfAKer?=
 =?us-ascii?Q?5YSPXM0ndLaF7960f6ulcXSnsBTCc4HUYoIgrOcwyY3ze11OUw+f451ILFJH?=
 =?us-ascii?Q?E7xfJGZ/TP0YcMBLYyBowve/6VIxRx9OEakstk+G9pY+olPb+OQSZS1wWeJl?=
 =?us-ascii?Q?sNh8f98zThiE7qlhg6Rnv7XFfhj72nSWD5QQLsE+ue9SSsPQikMolljFFy37?=
 =?us-ascii?Q?vpD60Jjz2gJcUR34Q1hw2TmhBc9/U1Zo2hUSO4L1RNnWXVDF1IgOnr98g5HU?=
 =?us-ascii?Q?gZjwkBxtXP/UTRVU0WjWQAlNapvJk90Kg21q3B0h2lmjslC0qvpEDyyM77pB?=
 =?us-ascii?Q?CTh4WaN8zgxnuwCUW1bfbvyRxvuMDqsyjdin0LwRfPGgZhxK2wtSHdWI7erz?=
 =?us-ascii?Q?Az7OYV/7nJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WpHakJBIXRsAidXqMPaW6YF5dtO+e4/He/TouhxtLhpQ7Dtulx2ayqdKeLrN?=
 =?us-ascii?Q?mn+aXoLDJ6fnYPza76cTNvtDf1Pub0x+f6cmJOlpNCUikjpY3bbcqMxR0OYf?=
 =?us-ascii?Q?VPakw5Yq8NICy0YR0z6/efPBuzW6HU9apZ+xEA6ts1QJ2cqMTgO9Y8nZ1bFz?=
 =?us-ascii?Q?RiInJL9hfLXSskktIXaQWp715dNBG2ZAB+p6fpFqbDMOFraRgM8gBdrxxpO/?=
 =?us-ascii?Q?OcHUVzvJo1VSY+a9MXo6u9y/6HBoR0X3UiVvd8QHEtSWTNk/LON2hER68B6Z?=
 =?us-ascii?Q?O6wV5IrTCnlZa2WwCRIkbbyBKrUWzmWagawuqeN2yC12P6JYCtK4RMeXfIVS?=
 =?us-ascii?Q?Zv9iGU+rlWPmZhF5DtrIYpf7YGo+t4pkhkHvVLk+nOXoUy/RmkslJfJIlEKF?=
 =?us-ascii?Q?+44Fk1s2KbI02CvrseiNUW0qcF7d45STKLBNiGgUXgQ3r5ip1wJUSoP7j4PW?=
 =?us-ascii?Q?btvSnnhCSCdN+x+Uoiwy/ZPXe5JGs7KDxoItcxpKUhksffVk58herP3Teoc2?=
 =?us-ascii?Q?eu71+vkkUP2eYYi5f14xGAc+AMZTWwm3Yk5idpFKq7v+2W8OjU5haFR+Ijyc?=
 =?us-ascii?Q?z+B37L0QBUv+u5FzBXmMFjxZ53mZbFjnms9ue3cZbQq+ULC5h85X21KQmrTe?=
 =?us-ascii?Q?gtSA7jKdzpbZnjH2x2p8DWm5UuyndFmy1YeO7ZA1x6aovcj2tAH7EuJZdBST?=
 =?us-ascii?Q?qNbpAoVLNljlTsF80KyQ75IfKNr+7GrwXtaCEAn6k2zZ237WFXw8M7A7lcxR?=
 =?us-ascii?Q?GcUz4UBSJa/Gcd1Trv9ZsELDty8kg9D6amxEhRHPaXKs3PEOZZy0NiPzKGET?=
 =?us-ascii?Q?SHJIgNP7hgvUsZo2mgXwQm+xM9Jun0dQSg7wl7PS7sBg1X8e6xeJUyYFoTR9?=
 =?us-ascii?Q?7zoCNcOwbniqHl8aRKCiPHOMLIdaLqU8E7c9+qk6NeiNuT32O7BGbvKovmin?=
 =?us-ascii?Q?P22ssBLlDN1hubIf12dhgSTugumi8dfVwOoY8uKqH9KiTKYy0sFaWOzeEoyP?=
 =?us-ascii?Q?ytG2Q5DgaXLaVnM2c0kTbc6G/yRrhSM+VEr5qXBht6/b+a7MF7RnGr4K+9OO?=
 =?us-ascii?Q?u7UKpVLXI7ovFaCzDxDVRcrgLk2JCxuNbCDboY7d9N+tKhVk1kGrYMJz96vO?=
 =?us-ascii?Q?kPgL1EYYfxqrtECnL5JZ+LRPxxMuKxtwu1DJ0DuN+UbXkbIMOSrwKAS1T2J2?=
 =?us-ascii?Q?2xlOKkkS5NCCmrr38W2iO/HS30YjFeOr9Y2QACYbVBLOx3iSiDL8RJwlqVw/?=
 =?us-ascii?Q?8tPqeG5rWzD5z4BArvwhrLQkcO1A+Pqjpc4EUX+ahwoTWx3f8zDSBnPcP0mf?=
 =?us-ascii?Q?dwpLnKl1w7h/7osRgS46fAsBqnOtPxZ757xjXXDyCpfnoKe2s2Js1FWnG9+b?=
 =?us-ascii?Q?zYk9WXQsnen0QVKrYPWVuFaM0ztO0zfeorV3/C25xU6xu4VQkV7WFunJvhns?=
 =?us-ascii?Q?OUWz+mXjoXiDpNHMDsL/Mj5PmpRmVxPxUdukxknskJ+Xq8smtI5zJjeO+lAr?=
 =?us-ascii?Q?Qn2KBF6DFVMo4hI2RWibadjxIe5y1h5Q00YUATXsxFW9sp4Fe8y6m6fwcuC7?=
 =?us-ascii?Q?Ut5L0wt4jU/JarW3BHSJY+7vK92TWPrGANybb0BeEWt1pczgnAtjDn8wXTMA?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4f7280-f941-497f-2d25-08dd93357eea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:20:13.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v33zQOfg7N1oIdix52ltB2BnWu56ZSG7I7bk6bPPWdRpKQN+HfQy3TmUSOAzlTQUhEEtkfVg05nm2Cj4oVsgTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
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

On Mon, Apr 07, 2025 at 03:47:12PM +0530, Himal Prasad Ghimiray wrote:
> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 

I think the baseline was changed a bit here, but I believe it mostly
makes sense. Will review again on the rebase.

A one nit below.

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         |  9 +++++++--
>  drivers/gpu/drm/xe/xe_svm.c        | 14 ++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 11 ++++++++++-
>  4 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2479d830d90a..ba9b30b25ded 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm,
> +				 struct xe_bo *bo,
> +				 struct xe_vma *vma)
>  {
>  	struct xe_device *xe = vm->xe;
>  
>  	if (!xe->info.has_device_atomics_on_smem)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> +		return true;
> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
> @@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>  		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index efcba4b77250..d40111e29bfe 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -717,6 +717,16 @@ static bool supports_4K_migration(struct xe_device *xe)
>  	return false;
>  }
>  
> +static bool needs_ranges_in_vram_to_support_atomic(struct xe_device *xe, struct xe_vma *vma)
> +{
> +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
> +	    (xe->info.has_device_atomics_on_smem &&
> +	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
> +		return false;
> +
> +	return true;
> +}
> +
>  /**
>   * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
>   * @range: SVM range for which migration needs to be decided
> @@ -735,7 +745,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	if (!range->base.flags.migrate_devmem)
>  		return false;
>  
> -	needs_migrate = region;
> +	needs_migrate =  needs_ranges_in_vram_to_support_atomic(vm->xe, vma) || region;
>  
>  	if (needs_migrate && !IS_DGFX(vm->xe)) {
>  		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
> @@ -828,7 +838,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	}
>  
> -	if (atomic)
> +	if (atomic && needs_ranges_in_vram_to_support_atomic(vm->xe, vma))
>  		ctx.vram_only = 1;
>  
>  	range_debug(range, "GET PAGES");
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 92b8e0cac063..0f9c45ce82b4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2930,6 +2930,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>  		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
>  			svm_range = xa_load(&op->prefetch_range.range, i);
>  			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> +				region = region ? region : 1;
>  				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>  				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>  				if (err) {
> @@ -2938,6 +2939,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>  					return -ENODATA;
>  				}
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +				ctx.vram_only = 1;
>  			}
>  
>  			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index ef50031649e0..7e1a95106cb9 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -69,7 +69,16 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			  struct xe_vma **vmas, int num_vmas,
>  			  struct drm_xe_madvise_ops ops)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
> +	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
> +		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> +	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);

Again I'm unsure if this debug message how a ton of value without
knowing the VMA info.

Matt

> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.atomic_access = ops.atomic.val;
> +	/*TODO: handle bo backed vmas */
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
