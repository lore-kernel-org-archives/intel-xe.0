Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA255C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F64510E5BC;
	Tue, 29 Jul 2025 04:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFWoNA1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCFE10E5BC
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753762107; x=1785298107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dG+ZowPv0uqb44tE7DM8roOZPeMbEk15ODZugus1EJg=;
 b=DFWoNA1xZG6/PWYosN2E7Um4ChsIR8GxgG3uDb6ISkVDKDP/h925jKEG
 jXzI/OagfSkw7fzyzEgu65t/xqOainoqJ/CzoB0ycEIhysfFC3D5/87HG
 Zybh4I9H79xJEPM4607kYv6YJ4QfOP2eWGorp3UuDbDpqnuvARfRrLgV+
 fpc5sHGN2TKyL2fCpr5HmASXcwn1Fnmvbl4O66ZS+AIht0O+x8pNiGSgX
 PQyElex22lVf1ZNbmWRsfeZu5kyXTm7gi6DDPAXtmYB87C2DowvupIUR8
 u12AluW5z/wtSVZzARn8udMA3Z2MUfNZb9+zNWNXL3VOEgHZGk2qooJW1 g==;
X-CSE-ConnectionGUID: 4w3850kyTXObKJwXtc5kPw==
X-CSE-MsgGUID: NwtiC1RtS8WnoLLAT1JpMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55902428"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55902428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:08:27 -0700
X-CSE-ConnectionGUID: btYqwtcYSBefU0IFvyqSLQ==
X-CSE-MsgGUID: irKWyerSRqG94U6/sJsGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162941405"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:08:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:08:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:08:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPt1ZESdHK720XPMzgMi5/jfou0O0QXPZ8/e+JyprmSUFo4NynNr8396jSxWKULmzecZ7m6ZBTP6BdRy5Ah+DutA4XeLHMzROwtkERpJqYUZzc78w03tD+37BXLEhnIpL2sahLx4zr9G0Y6Y2hE1jTw0qGvGk+iHFDp9grYN/sxebvEARoYUW0tg0RmrEjbGbbz6JJsg4RLlCvzdbb/Si1JkxJQegdQe55YskNrmh0xm8WTea92Wrq+/kL4fV75QoX8WkZXggCsADG43QUT/pVm37PlTd/XnVHSruMbwLXA4sOvAZ9mcW5jTkNHFrWI8GC9O5aMbKgP5E9rVnQJHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGvvHzTc2KQ3fBLi31YEnGtE5Nk6rexdsnp1Pa4Qv7U=;
 b=RRnvpCVm0r0exfhiLCQJM6W5YeJK8WrAowGGFGdNonPHIMpww0dcC4fe2qliqDszksD8WzT1i14LEWne9v0hBDnlE8Gp0qNhriECn8u376EPit/NAc8sYYsKnNNc0iXg17FSLbYOANplSzn77qllyyX17tclNMkMRZHgXHd24zKsY44V7RrbNScYlLaLEfRimyFJDH/YRlRvQNEFvcHXg3D1cK6fAMQi7VQZzho4E8c5YU04xlUwuxNK91LGqdSVOwh44jc7s+eMJDCG9XlzpwQPKoc8RN9tYR3zLiwS78SR6qjg+6K/wAFcvOQNMrQonnLXEnvLigLB88s/qzlZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 04:07:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:07:42 +0000
Date: Mon, 28 Jul 2025 21:07:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 12/23] drm/xe/madvise: Update migration policy based
 on preferred location
Message-ID: <aIhJDIxs2mQmmyR8@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-13-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:303:87::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 90104a97-192d-4d0c-a746-08ddce55773e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrMblrBqLEIo6f3vgqVhqEfhQRZPsFPSbnePo/8aelpk8Jd1MhI1xa9sKInA?=
 =?us-ascii?Q?dghmDL1xwCACq/zCHUwthAZLyE6v12+cn42UbAzNekW9GR1khU+I6U3HzY4h?=
 =?us-ascii?Q?ZBH2YNR37t9OpAim3YezY8xRF/ebT4xuVtiWjcMGJ4AfYATJgSbglTE2R2qW?=
 =?us-ascii?Q?c42BkmYOdRYoiZz7dyAhrN8Cra54WPUy/WX3c9YLrKnUeAVetJwgh4NeW5zX?=
 =?us-ascii?Q?9XvQ5hv/rnYkJlf07OVmCURAx8A5ht/zNuMhhu6w9e78LvOMzUm0Ewrm/vNs?=
 =?us-ascii?Q?CZCM0HFp69bfZs1BucljgbSmJlCglFs0czuLU0jEiV6OM2txjpnnA5qcU7K4?=
 =?us-ascii?Q?jrnDnBBisBUZ0xsxZ8snFViD4+YhNdGMBypGl4v/5wlbdQK0kcb6+HWaw9PK?=
 =?us-ascii?Q?aIBx2iuvdyQFWNrxtTrPA9bmiZcLd0DUFspIGRJVsHQXR+Na5BXnJBq6ApBe?=
 =?us-ascii?Q?P+GQ5bHpf0NMD62+UpT5pFtaa6hlT3YIvPdI39pWo7qJSbDo35NEfCXl/9FR?=
 =?us-ascii?Q?gBKdpRzFtEMbG3q5yIGdwh4hapQZMLdPHu6CFInUNPV4AoHUiwVA0/6zyJAa?=
 =?us-ascii?Q?7fZgLrXPGK1jsphHghQfM263c6/VzV7XG/2HNaQbzbu3FW86Ir0s3sW8TfxF?=
 =?us-ascii?Q?7Gam5Xw6iPrdq3sxhXTsEZQ+VfEwwcM+oCbULnrLM7ZdgFdCdziGbtKuSmSi?=
 =?us-ascii?Q?/wguMvUYew8n/GdVzc5lTSzSzovP3KOw9c8FEudYUycBc1KQRfRaQDPGwdYL?=
 =?us-ascii?Q?FZZF2X4dSEfvMuHlK+xDaWUgRyeohevFI5Hh5defoItfzCSYogAj1NSUrbuZ?=
 =?us-ascii?Q?sh6YHUE/3Y2i3i0IyMxiymizFdwgoyT1lYY2c93blrv2MPqVYZtgs808+Era?=
 =?us-ascii?Q?/I4py1jLcEpxHTk6ImDaX8mDTEkgV/d/XkCNEO5FFu4OzFUcb3faSAMBf0Ac?=
 =?us-ascii?Q?M8M90YeOOWf8xqYG14/2NLT6AmH095ofXXJdJBYP55x40D7zq5jcthTL10bH?=
 =?us-ascii?Q?NoHsH53ab9B57zFKDKJFNoO6qq4EXiKB2f5VrdDpPWTATsKlkO7sdwyNiE3F?=
 =?us-ascii?Q?MXOgCazXBsanxNos+jtI69SpTIrYfh7+UWS0b0TNqAuLkpxKa5/2JiHf7tVm?=
 =?us-ascii?Q?aW5Zz05ivM7D3JIJHNo0bKpKb+OSkDdhVWlVDnB/Iy5hR5k0cRP9UO1j6k0A?=
 =?us-ascii?Q?4BhRIauCXHQbnwsKHFTbq5dXTDpt4kHHieS2pI+3q25RirLVDmGDsK/5QLs3?=
 =?us-ascii?Q?8YBfjN4UyO7A8mvOqDGuyKRdXDrasTIvo9X5mmha8kleBNF9VMGgh9vOSmnd?=
 =?us-ascii?Q?OYT8TokgLweO9emjZtA16JsgXRhw381xWZo3Wjr72sZDXL6GbiN948RMFNPY?=
 =?us-ascii?Q?V7QU4zrGJM+Pmq93wLVl8FpWbV7xELE4RSIS46EgMNMqHCLxyDIlg6RIGYTL?=
 =?us-ascii?Q?8kU1J7kgC0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4S9NKznEo9BCA9ZJQnrJBlt5/2B05/iqb7rRcqUhNvKxvdbR8XZ8uAEhPTe?=
 =?us-ascii?Q?r+DPYp3BklBBaji3Hq2bCl68AnVkvTxoKY5av5myuD3/amcjZRCIVE9Zohok?=
 =?us-ascii?Q?hfSUjddrVbOAv1CQO3TyXOPqRpR6YBGu0qkURkAPoMNqI1u6vVZLfGA+LfGG?=
 =?us-ascii?Q?hMu1WW1sWdXMS38yp7OYnml3WaIWod4XNVo2tiy2l4+xTpiHvgsOFY/xfAFn?=
 =?us-ascii?Q?ePYEfdASm1BntqRLmHm1BY8pqhj+CfMkIfB3xcpb3YaRyfKh9AII7cHMBaKf?=
 =?us-ascii?Q?b63mGR80xJuhgfSbgVxDQECFB5mxUl4v/l1AZy2aL1BjF0QW+XoJ+pCmU/7K?=
 =?us-ascii?Q?bUF4R+LvyTIGGGec2FvSfRD4pf0eujQWnkxAXR3nMTtqUQ+AvmOUbjd4N4NU?=
 =?us-ascii?Q?dscWywJoyTe9XPmLeVLOtRp0AbDsehskhRIGQPVke5CT5cMvhWU247fRDxhr?=
 =?us-ascii?Q?kf5W6Bnpunqq2l3A+XEDEk2x/5cQT/pLUpNchTy/ZiFh+XrMYFofKOFZt37/?=
 =?us-ascii?Q?4f+m12549oo3E2PorAZbXmZoCBVyn3DuibmKogDbusS0RUmaTD6W9FqAnqfx?=
 =?us-ascii?Q?ZctBv5dlibFzt3NnhEAj5a/VAa4ptbiPwSiw6UIqs3RR2vgkpXpp0jMjiaoY?=
 =?us-ascii?Q?Mjxeohr79WXwS7JN1YfQJYyw5sW9GHyxdJF3Q5HbnWoOmUUHt2c27FkDN3nh?=
 =?us-ascii?Q?OnaGrjlC9pj9i3yf4mZ+nWqwtCPYVxzQN35tc6tLp4r8ErnudxXW44Y2pK/X?=
 =?us-ascii?Q?W+0mjcrX83XgI2XwpWxJLVOkNZLOcHtNCkfwXw9Xs6Yu7cSzJJ+C33w2hUkG?=
 =?us-ascii?Q?wjKVbplPf+zbOcBxMX5WD7yI9jDdpij3mME/dRkCaTgmIp0Y9GCd901MxbGa?=
 =?us-ascii?Q?69ViTPUNQ12Qeo7rD8p5gTZDZTOjxHVOHhdoW+ujSpzukb/ecz0uPlAG73oK?=
 =?us-ascii?Q?S9YM3ZEBkGdoa79ANgSC1YZ4ryL1LC0buwbO2tCJ/yzzpJAvIMsfka0uQLEL?=
 =?us-ascii?Q?OITD2KYIKSrupfCHLXXPFEN7CVo69y1fknJ3yMsObtXgMBKibavzOdQQe0aL?=
 =?us-ascii?Q?uytlIT0RXp4UdqZ8AvZ4clJ7eyS6MPQK/yVVwGHrOcv5X9rB2SEshTIab7Kj?=
 =?us-ascii?Q?OcLWc5otYh5ZxOpjY8uISyXO3gPI9Ny++tgq+16yiaFxhrD++9z3GBFQE5PO?=
 =?us-ascii?Q?PiOq6bjvGs+6vTuPfJTcCq7gf3F/0Z/WRTVAX+ONjQ3dIZSi8OML5yn4uUAQ?=
 =?us-ascii?Q?CT7bZ4vfQSH+q3Y0iXd3bW3EZRF1v34r0IFAsmQOiISeQGYRmGEioB9S8mcE?=
 =?us-ascii?Q?+fRN1cpB2krMqyKZSYdd8Ai8c+VTtIJRcJowfs+hPheI5Jbh7R5557FRy5nS?=
 =?us-ascii?Q?90XrvYJrsx5HkLztPJV/mI5SlMFrQH1hl8e+YgnjK0ERSUHzIS/LinLjrYuD?=
 =?us-ascii?Q?Ekici9x/yVLU7VPyGPq+8JP2BhAyXcIN87SVp0dHC/lmbRCYjsAR+N5WHF1P?=
 =?us-ascii?Q?mNu2tPPAf8G6JjTOtc3fQiOErBE7SeGoySsJNZOn+vyUjnm1bFu2o4omMvKH?=
 =?us-ascii?Q?06D2OYwloTOsc15GOWnp3RqjwpEZzR+JHLxoJN6UbPJKtzT7N70PLN3goePL?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90104a97-192d-4d0c-a746-08ddce55773e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:07:42.5759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MctC9IzGS+p0keXz55XLmcNsg0h7+/BDZuRNraDKoGZnN/MGrp50PUxO//jaOcXAEiC4CIHnmO/Aju9h3ryh+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
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

On Tue, Jul 22, 2025 at 07:05:15PM +0530, Himal Prasad Ghimiray wrote:
> When the user sets the valid devmem_fd as a preferred location, GPU fault
> will trigger migration to tile of device associated with devmem_fd.
> 
> If the user sets an invalid devmem_fd the preferred location is current
> placement(smem) only.
> 
> v2(Matthew Brost)
> - Default should be faulting tile
> - remove devmem_fd used as region
> 
> v3 (Matthew Brost)
> - Add migration_policy
> - Fix return condition
> - fix migrate condition
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c        | 40 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h        |  8 ++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 21 +++++++++++++++-
>  3 files changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 49d3405aacb9..ba1233d0d5a2 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -790,6 +790,37 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return true;
>  }
>  
> +/**
> + * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
> + * @vma: Pointer to the xe_vma structure containing memory attributes
> + * @tile: Pointer to the xe_tile structure used as fallback for VRAM mapping
> + *
> + * This function determines the correct DRM pagemap to use for a given VMA.
> + * It first checks if a valid devmem_fd is provided in the VMA's preferred
> + * location. If the devmem_fd is negative, it returns NULL, indicating no
> + * pagemap is available and smem to be used as preferred location.
> + * If the devmem_fd is equal to the default faulting
> + * GT identifier, it returns the VRAM pagemap associated with the tile.
> + *
> + * Future support for multi-device configurations may use drm_pagemap_from_fd()
> + * to resolve pagemaps from arbitrary file descriptors.
> + *
> + * Return: A pointer to the resolved drm_pagemap, or NULL if none is applicable.
> + */
> +struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
> +{
> +	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
> +
> +	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
> +		return NULL;
> +
> +	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
> +		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
> +
> +	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
> +	return NULL;
> +}
> +
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> @@ -821,6 +852,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	};
>  	struct xe_svm_range *range;
>  	struct dma_fence *fence;
> +	struct drm_pagemap *dpagemap;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>  	ktime_t end = 0;
> @@ -850,8 +882,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT");
>  
> +	dpagemap = xe_vma_resolve_pagemap(vma, tile);
>  	if (--migrate_try_count >= 0 &&
> -	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> +	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
> +		/* TODO : For multi-device dpagemap will be used to find the
> +		 * remote tile and remote device. Will need to modify
> +		 * xe_svm_alloc_vram to use dpagemap for future multi-device
> +		 * support.
> +		 */
>  		err = xe_svm_alloc_vram(tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b0da0e85f0b8..494823afaa98 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -94,6 +94,8 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
>  
>  u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>  
> +struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -318,6 +320,12 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>  	return 0;
>  }
>  
> +static inline
> +struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
> +{
> +	return NULL;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 62dc5cec8950..17959257ee1d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -78,7 +78,19 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  				      struct xe_vma **vmas, int num_vmas,
>  				      struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
> +
> +		/* Till multi-device support is not added migration_policy
> +		 * is of no use and can be ignored.
> +		 */
> +		vmas[i]->attr.preferred_loc.migration_policy =
> +						op->preferred_mem_loc.migration_policy;
> +	}
>  }
>  
>  static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> @@ -178,6 +190,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  
>  	switch (args->type) {
>  	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
> +	{
> +		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
> +
> +		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
> +			return false;
> +
>  		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
>  				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
>  			return false;
> @@ -188,6 +206,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
>  			return false;
>  		break;
> +	}
>  	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
>  		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
>  			return false;
> -- 
> 2.34.1
> 
