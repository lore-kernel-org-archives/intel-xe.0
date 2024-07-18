Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28E9C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F22110EA98;
	Thu, 18 Jul 2024 18:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbFHtzJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67110EA98
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721325708; x=1752861708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bic/5n//zMKhFOpVf3OIyz05JuZ+0c1Qh8PvEYqWt5w=;
 b=LbFHtzJAWZnzHiNWmQespJvjZwDtsWndZE/s+D9jc2l3APwRYgZiwYPA
 DyECYusGVS+14cy7omazYK/fzQOLK7A9johSLQLO6JLcra3pt8EPGqbIW
 z59Ub5EUI4ze8ciUlAKC3Y0zehpi1DeMeFqdJSmkjIhSvL/viYa2ROhiY
 k42c17w/Edc2iVNWOxIra4UnT7jpe8Vv23Vf0YCJuijMx3FkMHBEYIotW
 FL2Dg+rNYucK3z7PgKdqk7J/JO4MA1UEqDyv+PD5jznV54NE9vasWM7Zl
 ZJQyuyDRcq6z0Ww/B3WDZXf6Rb5SmJhoyhyyAlffr4wGMcJct1Mjw1w8Z w==;
X-CSE-ConnectionGUID: i6dMIJagQcGIEVXV7EmDuA==
X-CSE-MsgGUID: lCHjVWywTlSft/UA3vP+9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22676472"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="22676472"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:01:48 -0700
X-CSE-ConnectionGUID: BlNoovGuTsCsCy4XnzQ4mg==
X-CSE-MsgGUID: wTPEFCrQTHaH7Z4QRYI5RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55714622"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 11:01:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:01:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:01:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 11:01:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 11:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgI61D8bagedoIlwYK5pAiTzeLzpqgTbUpnHdBjLItrWsGHt9jAXye57qfNFlFJAo7HfyJ8cMvyFzwhyXNdT23xfWeBzozpXXWkMudUCMrHogkvKPfMqk5F+r8lMsTSl6XlxZ5djrskvfGkd8X1HPjvtSQld6p1z++VabPXgqRkeu4DMHVXbDPdiSm42B9ZQL/BwhtqbDBnM4iFJ3af9B0QV499EWSwP1xkMwOUY6aCMitLwJWc7rb9mG4sQ2svFnXWNP6F62BCxZ2tkctacJ8OTeCumy31qBdvgg0qFdrp9iBW49DBcMuIbnLlk+DV2M5UvENudCr6rZOCjduI3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj6LcBAi8JtjG6v2ls9sJWJqQ7CudqDwxTfgdczrIlQ=;
 b=rn5AWJ9aEHK5ZtqY6JrmL9KUMDMAWu/yHHniVQQ9V2zy2depmBXhGe72DWocvlgpPwHn9mAKYjtbfg9Ys3C/9zFfcK+kpjgzIbGt9AxbPIxRmwbngYQGr1TUZ1pTtE6q/A8CZWJfWsJp3F0XRnji4AmVThEdPsBG+DQG8OTeV2jyvH8ROCfv9R3+oubBlIIPZYXhNK4iSc6RQfUOsMURIkAu9SxqQzZmwneRbKovGAFdADbZr/7GwR1cFh+aFZMjWzN1m/JCkX/DPnuVrtNWraynfWNiRAx/MHd2+fdXteW9RVJnkPygow+9xrS2TEmxUmNwc1h8/rsIyQx54Vjf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 18:01:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Thu, 18 Jul 2024
 18:01:43 +0000
Date: Thu, 18 Jul 2024 18:00:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nirmoy.das@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe: Build PM into GuC CT layer
Message-ID: <ZplYVMciprTu4Y7n@DUT025-TGLU.fm.intel.com>
References: <20240718173445.1490455-1-matthew.brost@intel.com>
 <20240718173445.1490455-2-matthew.brost@intel.com>
 <2945f2f0-0d3e-4b6c-ae0f-30ce3c053f81@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2945f2f0-0d3e-4b6c-ae0f-30ce3c053f81@intel.com>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea635c6-44c0-452f-55ad-08dca753ae67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3GdIDe3TcTGhimTmB5NnSLCJnL+x59xJe2EPVZmK2k1qu+Qhx5Yx6sCk134I?=
 =?us-ascii?Q?ekyp7JJ/osz2lggIdII+idc+iEfZTetuervxKhHz1J/T6LqNFPElxEFPGOEa?=
 =?us-ascii?Q?56h7K7tn6j5DCUIFEZdgPiFza+EwcTc73Tr59JmwbFn2AVfohlNb2x8jL3Vp?=
 =?us-ascii?Q?yBU42oll0CLBjNJRvAFE0sn/QsjFpmXhRxPVzklAGDzXfARdRLjazcpVU5+I?=
 =?us-ascii?Q?Jebv9TihOxb66KRRuyQKRpMYIYhsXWCL0H+R1s6YSdKnMAjLz5YFoReNnpRO?=
 =?us-ascii?Q?4mSL8qOjPrS7LGaUdw9p2Xu8tZtjxqHh/rHSfD7S13GqdtMoogZZiFVU2fEQ?=
 =?us-ascii?Q?b3s7r+J/lKIAwZgTE9LQEbUJAkowBAPdbFKMQVKuM82+8jwQlOgJoAP8QCu4?=
 =?us-ascii?Q?FHN6aeOz9Rbg7106MOP6CoUhg/SOlHaxee122JSLPiUK9KiAzBJ1gchuJ4q8?=
 =?us-ascii?Q?c3voSSXO49N3FgzO/KaBD0n1f+0GSht2RlD6SnZA/PXy4H+9uISwjWsL7Zf5?=
 =?us-ascii?Q?MK8mZPyEwWkTW9NmBE9/0Bqx3uw4a9FFq3cw5B3YHrhicwZLmzQXmZFIGFpD?=
 =?us-ascii?Q?opYSyVzpYli9MgfGO+Hr9VsBtp2SLOihgZQOpWHZ3RObAdfEURLOsm7nl5s+?=
 =?us-ascii?Q?4YwNftna3j3YK62ROMURM4UVfrgjBZHJlkTTfa0VKPBQYC1mVAUlEqs030GE?=
 =?us-ascii?Q?4YB9lmcwTg3gZoU1hCG03TLx/ll58loXNFoA0SGyliHpZ41hZU8e8wJRuVkY?=
 =?us-ascii?Q?TKH/wl4cPsYPpxv4zy8J1DyvcbLRmnzpPJ2gIMOjGURBavYRsHXWj3BPIaBn?=
 =?us-ascii?Q?EXmFNqgafuKi5JhkZ+PQFfGRJIy+csV181Ly9/wN1NWrVOxyuS3dNm9iTKGU?=
 =?us-ascii?Q?86OaWeDwgW9jFC1LYg5oZLfDtCjHsey3CkBPrmvW25A/m+2BqLe8gasP0XHI?=
 =?us-ascii?Q?sFI1oqXZ/CaMcL93fdHM7wWsy3JLv6DxQp9kDgd1RQxIRD1rfjHKh8s0uXEF?=
 =?us-ascii?Q?tKRpdKQbmOJACBwxo4TZbYgOLySeXhSZYmMPIDMpZqlJI/yaN9zmqzSZJQON?=
 =?us-ascii?Q?z6Oh/pvAysuSqZgCnpAtfyLbSexoFcQRuspXOfj2vh5spCBaGg1Mx6DzGjps?=
 =?us-ascii?Q?j6CTbXTAXj22DSKrioX55pLUuK15bva7g0GE2mRF7TbhDiitOQA9KApR3mDV?=
 =?us-ascii?Q?LXj4dnqALj4daU8rjQP+uoWug399UTe2TgVzmWMstslaKNtOrcrglUPTWFov?=
 =?us-ascii?Q?Rjpzgo3H7CHlE+a8tgMU5H36CZcpHSZfgZpEoZFJPQWsX6FyoOCL4/V5VmxJ?=
 =?us-ascii?Q?XlTrPrCyuO7pcvDt/JXfcTE2C769UUXl2JN9/80NtoXBRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xznOLaFRpJzfXV7yMxQ3vxKb8zastSl6KMcb1TAOr9VsHJ2xhCnXe1q0gKtV?=
 =?us-ascii?Q?yb4T2Ig4moa4i1/33h658V6agzFDQpO2E2gNKPKRqTh2dTUcvnhyDoT5Vq+G?=
 =?us-ascii?Q?1/f10bzYzjR2ArRBIOkS59OmdO61wwX+xViCZZY1uyAaDj/bZctZE70y4Dio?=
 =?us-ascii?Q?3svXlds+VldpRNb7UKFyEqSv3yzcDH0ARuTlA9AAKXquytIVEuiqgnmMMfWG?=
 =?us-ascii?Q?q//IJHbWsBo4SL3cbL/KpVeGxL1WBS0Uc303skfyK1m4aiPbZtIcRlFfLzcA?=
 =?us-ascii?Q?t1EabmazGLjZZogV+16uK9Z7le140Ped4kQqeyl5RVlsmkOoATvQItJj3/t+?=
 =?us-ascii?Q?QEjog9bgVmCz9N0FCDjqTadrWiLmOd9PgRejJyWsTgJTKw3dLYEH9GB/PmY6?=
 =?us-ascii?Q?e/wz0nFkymmXKUIr862cOk43p0xzh3Pm5CXlgwxMf8ik8MYWauBguSakMBUx?=
 =?us-ascii?Q?qEfJjb+tFJS3RYv1aZM0N7cD8zXmmYmJ6tBpZ/iPqrmucWVA2sE07J0XQiDa?=
 =?us-ascii?Q?zig01blsKY1p+bLFd/7p4UGL2u8PhB27vQKk3cA2xPpS4daeJQrPui/+gHnB?=
 =?us-ascii?Q?bGDyLAgy03q8x5/3m/82v2tbTFjiPvC8sWHCp8Rp6nkwgVTWjcnx+7DpdUBj?=
 =?us-ascii?Q?/AZzJfFo59WpkcGk4lrhMsmtwaT/dh5doyibjfgX+g/vpg5OOj1tAfIzuYAF?=
 =?us-ascii?Q?Hb2rIV8Yee3VQUVxNrU+UbMw/511Hv8rvJXaJzrWTYTV8zzpY3OtM6gZeCo/?=
 =?us-ascii?Q?E9KEVgxv+MUN/gEXLOVXv44k3CkzEt8RmjyfW/vABftDj5xsP2ozmTnC9uSN?=
 =?us-ascii?Q?fkw3LiA4hatylwVs49vEDPeRvtKGu/79ButAuiJT1+bjdaRJHqVujGnBqyfU?=
 =?us-ascii?Q?vTLXuVfMxuJPYpEcc4apJhWEbCsnMPH9XKle6XgcyuWHd6lUF0iG+kRLzGeh?=
 =?us-ascii?Q?B6iydbH/RpcTCU5BLfqkagopttue7f7WuVfauJoIiZ8Ub7puFfYlGoYH/44u?=
 =?us-ascii?Q?j62a/6KcMW5+iWzh5Icy+RlQu4IPh+hwaa58IdNuqly6yZVULyiHyT3vrS45?=
 =?us-ascii?Q?zuzrBx+GmUE8nn9VLREEtZhJVYxgmcaez/hzHmZBYsBq0Bx5YL25KqoXIHYM?=
 =?us-ascii?Q?f03EX2/oLkQEII69Ac1K1RdH5lJjDfpagPvwj+G6QL1DOhF62lwoH65G9/Mo?=
 =?us-ascii?Q?JWM82j8YVhk3esZhbrKWdwlpzhbkiIA8i8JR0JPbA2BDnS7CGnCG8FEjPMbb?=
 =?us-ascii?Q?9o0689xPM7RtRwceR6JpKzKB4ZhozYF+qcuN5uc44m9Cr7XeO9ziqnhQQq3q?=
 =?us-ascii?Q?1XhpJ/s7aOeynSQ7l5mEPhUDdVqmxAAKE8X3uuRw13ehLU5jSDnzGSfMbgbb?=
 =?us-ascii?Q?EYGglmORH2vsw7ORD40SbFG2XR3/chRjl1nLvg8iy0GYk/xkbTKA7kRjc2e8?=
 =?us-ascii?Q?j1hiGcrkurPb6kLIxnmIkLjBjD46lWNsUw0i3fN+kncWqn/naP9dlO9V62e2?=
 =?us-ascii?Q?d2fzhZryAujeTLXdxnHbZatatNaXCl4jw+Qs5dZCdfQ6I5gcK8nTCmfD+vJF?=
 =?us-ascii?Q?ajgpK2GBF0Hhe/SRXOWIigEXU6zVi8IwwsxZmQKZYnLM8DIpJcxCGHDI7K4a?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea635c6-44c0-452f-55ad-08dca753ae67
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:01:43.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPXtVPwn+GPB0MiUb8XP6CTYZmq85DkzD/ZXpqhNnYum0B5hNd5eU8Kn6VAyV6HGmH7iQVWBDd9ycqgQ/B1t7w==
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

On Thu, Jul 18, 2024 at 06:52:10PM +0100, Matthew Auld wrote:
> On 18/07/2024 18:34, Matthew Brost wrote:
> > Take PM ref when any G2H are outstanding, drop when none are
> > outstanding.
> > 
> > To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
> > to be held when scheduler messages are pending too.
> > 
> > v2:
> >   - Add outer PM protections to xe_file_close (CI)
> > v3:
> >   - Only take PM ref 0->1 and drop on 1->0 (Matthew Auld)
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c     | 4 ++++
> >   drivers/gpu/drm/xe/xe_guc_ct.c     | 8 +++++++-
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
> >   3 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 06cebaffb451..b68ab474e1a0 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -101,6 +101,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> >   	struct xe_exec_queue *q;
> >   	unsigned long idx;
> > +	xe_pm_runtime_get(xe);
> > +
> >   	/*
> >   	 * No need for exec_queue.lock here as there is no contention for it
> >   	 * when FD is closing as IOCTLs presumably can't be modifying the
> > @@ -126,6 +128,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> >   	xe_drm_client_put(xef->client);
> >   	kfree(xef);
> > +
> > +	xe_pm_runtime_put(xe);
> >   }
> >   static const struct drm_ioctl_desc xe_ioctls[] = {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 7d2e937da1d8..e1d179fb7f43 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -327,6 +327,8 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> >   	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
> >   		     state == XE_GUC_CT_STATE_STOPPED);
> > +	if (ct->g2h_outstanding)
> > +		xe_pm_runtime_put(ct_to_xe(ct));
> >   	ct->g2h_outstanding = 0;
> >   	ct->state = state;
> > @@ -499,6 +501,9 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
> >   	if (g2h_len) {
> 
> So we can also have guc messages for which we don't expect a response
> (g2h_len=0)? How do we track those? Or maybe guc itself will take care to
> process them as we suspend it?
> 

We don't expect a response when g2h_len == 0, the GuC can still send
unsolicited G2H (e.g. engine reset, page fault, etc...) but to get those
we have jobs running and have PM refs elsewhere for those.

> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks. Noticed one other nit, going to add an assert for 'num_g2h' here
to make sure caller of this function know what they doing because if
they don't we will leak PM refs with the way I wrote this patch.

Matt

> 
> >   		lockdep_assert_held(&ct->fast_lock);
> > +		if (!ct->g2h_outstanding)
> > +			xe_pm_runtime_get_noresume(ct_to_xe(ct));
> > +
> >   		ct->ctbs.g2h.info.space -= g2h_len;
> >   		ct->g2h_outstanding += num_g2h;
> >   	}
> > @@ -511,7 +516,8 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> >   		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
> >   	ct->ctbs.g2h.info.space += g2h_len;
> > -	--ct->g2h_outstanding;
> > +	if (!--ct->g2h_outstanding)
> > +		xe_pm_runtime_put(ct_to_xe(ct));
> >   }
> >   static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 860405527115..993d0344dc88 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1402,6 +1402,8 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> >   	default:
> >   		XE_WARN_ON("Unknown message type");
> >   	}
> > +
> > +	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
> >   }
> >   static const struct drm_sched_backend_ops drm_sched_ops = {
> > @@ -1492,6 +1494,8 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >   static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
> >   				   u32 opcode)
> >   {
> > +	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> > +
> >   	INIT_LIST_HEAD(&msg->link);
> >   	msg->opcode = opcode;
> >   	msg->private_data = q;
