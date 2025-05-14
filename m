Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD51C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07AA10E297;
	Wed, 14 May 2025 18:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1vrtvS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0754E10E297
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747247997; x=1778783997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZrgyokGmscjcKIqjrg+6VqUhmzdHN6b3UfBi31OidOc=;
 b=R1vrtvS9MaQLiScQdk/ks2QhXUi8MULgDAGSQI9E1qi/3HVlS4klq7DL
 B66tVJE+2kPA2LE32y1m4i5JdB2HQJ0H8hnlUYm3U+LaLQXa8LQFmxe1u
 hsso0TgkiGfs6bcV1Sxi8OlZh9XowjHbMLtCh6D2yfwW7ajKr6BalguZD
 WjDn0o4B2jT1PXX5t7Rq5WKxiFAC1+mQKM3mBmKeYBMyKqvPFkXcAHKLQ
 luOEW3fy9baHO34tR4AwL0OAP411HPukHTWbdslW+JfaSdHY53m0rg/et
 fXpaGsiN5c4ejmoWua/u6sct8bhet6d+HX6u7oxtWIy+C5JrkxYDjqE+4 Q==;
X-CSE-ConnectionGUID: zGmRubDMTZGJjGI3Xa0NQg==
X-CSE-MsgGUID: gnBavXHFTUWXMCSPK1kcgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52832035"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="52832035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:39:57 -0700
X-CSE-ConnectionGUID: irgRVmL3TBWIG8UcCfFbiA==
X-CSE-MsgGUID: faQpiOZnRHauxJDaelhcxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138002088"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:39:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 11:39:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 11:39:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 11:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kc2Ou9xvw1fRvmrAokZaPOiFnWZBsmLuz1n+XN3Nz6oXowoX5VlTf0DZ+AhsgKdUD+YIF5+DI6WNUYjtf7A9sYQlcrK5QrSn/68jV6yri7nn8PCU1OKBfUUHIPqz3aaI99WxRoHerhb0WeOx4H0cfXlFT+PSAjwipq4C/5zPvSxniu4vxXEfNCSgKOfFBGHh+YjQsYmvJjLw1RgzsSgS/0aw60a1PCot8zC3WSjU+dDIeq/i6dmE73yaDJQgTyklJz1a+0ibTYJzDg+zovyEb42ozEuloIfS51Tntei2OLeDNh7Re8si7pMnFirUtQ5DGXtpTvHZqOb60syo8MJRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luqvR8tDLtpGXWOOpZiKbESPS1vmyqNtaRTpAJ3r2pw=;
 b=lKanoBY+GQnKQTt+Roc04e3Q5S189sWrz3NWfUJ4jKll8RVPOoJd5IkG6G3YAIXtD0bN6lCngouxxY+xY5sAmqt+IqcBPxDcwpkA1IPVcx1eNnFAM73YKgrFjkDuON40MshaUM+UzdBtwGS5Zr9pvJRVlDL5646/CeCY6lgSA5ns+E5qewBroZnpj81xKd103kToewE+5J9q7ABzrugeA7F+wt6GXN9LxeOvzfAbkBswHakzwKLfAfCDpSqMrgVTLwQ/IOaN1sPVAUn20gmzHG5CXKXhqIiH9ABj6valfbxSPXokIDVzfxze82hFsgkPYcGPMznFl+VH1pDMANVGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 18:39:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 18:39:05 +0000
Date: Wed, 14 May 2025 11:40:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 20/32] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <aCTjoNNlxviyPEQ6@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-21-himal.prasad.ghimiray@intel.com>
 <aCKwSLSJvGF1n6AV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aCKwSLSJvGF1n6AV@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 02581442-e15c-4d8f-97b6-08dd93169ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2WQ8jpSJrLMICdUOfFQwBSX5Yct9ZrC7m2c6oWE2oa1tg4a9yxBoDJlr77QB?=
 =?us-ascii?Q?+bT9qte37fxHsAGhQsjuJq0JcReKYo84b2pjNjPjU8Q/NTnNLGpCBkOtxpK3?=
 =?us-ascii?Q?9vAPTdhRcbcEEGDtEBdEHFmBcxSZfHFtBZlV7Zu+7oSwlezp92UgNAPWGI8j?=
 =?us-ascii?Q?eAsSD6YthTENuvkt2zHdYUbFh8tmRvQ68Q3+QVn/A5yZokAHGGM//f9VaV+a?=
 =?us-ascii?Q?ZD+gMtYmjkrBRiAp64XKaoVnKUn+KLRwTceidFm2Cjg5Y1giayi5e21Fpz59?=
 =?us-ascii?Q?NbkjwEf8a0/sA+dTx7AMD54klVO0DdLhDja9ZDuazNbrSWb6SeeOSXjYu0wu?=
 =?us-ascii?Q?RnMb9sX7ZJRn+qYVmHLWWNg5q+TM2nb0rRkKgCBJmYGgA7t/iddfP6n7KIN+?=
 =?us-ascii?Q?xNg0uczTVJ14kUDS1cvk07Lr3/Ic3pWs/8IDrFzj5qF7DKc4fbPvVoPAH23h?=
 =?us-ascii?Q?H79Cs46XPzjyPUkc9o610f0M96L/a8zIsIcLJWZwj275HVQ3uqzTgS7dVHW1?=
 =?us-ascii?Q?P3Kzp/YDEaFaVwTsUfSFbZJ6XOm+I0YqYPveaGZrd+MpjgyVUYmoa68hwmpV?=
 =?us-ascii?Q?M7sA8+07+N8Q6PJtFSdJe1Xonj7CeqEoP8KsiZrerqfCNWcHLscv0tumq0rs?=
 =?us-ascii?Q?x7x71enys1HgC00ojjGZ4EqTvTnxLMvjvyZAL68wEHRG2OWl+nR4ZvmGMlVZ?=
 =?us-ascii?Q?E+kayO6aBgr+Lzy9sAHMkk+Z5yXyDg+nUmQr4WH9t+fNzfD8/3VhTjDsUzQY?=
 =?us-ascii?Q?l7oKS+kIw/0OCBecfdx+z7nvCBjNl3F+1U+imKoyxNq/MMqDFCV5byUGS8lu?=
 =?us-ascii?Q?+le1I1HxmZ34yjObZ0IX6kn+8oD9LOXSBf5gvPFh34qLWyJvXWk/h4EsfoGH?=
 =?us-ascii?Q?DUub90jM4WbrR/MF3RZoeAuQ6F7YZO4JJJqUZHIWRIZaEZ3GXw7D88SQx10m?=
 =?us-ascii?Q?F+XSKb4SpnDsIdxo8lT5Zy9nXblO/CASjnilGXMfluQWxnRBmNZtYWYtpW0l?=
 =?us-ascii?Q?5jc/84cmohTtH9C5ZFOeUv1s8ABWHsYe1uiMLNzfaQPOUOhHf4NtQKaetZdN?=
 =?us-ascii?Q?RzL/LJkD4frVbAzupbtJDWloRG2aChms3QzyfQDdxGikEzTwj9lo9gPhIGZV?=
 =?us-ascii?Q?yaStjJXiHnyI5hhqFFFaGI49qhH75bMKnTqlDwNAREdtJZ6BP+Z43YpGvnQ3?=
 =?us-ascii?Q?rEvy2mswOq5NKn3g3cuEQP2fNB/iPnuUU1DUdmW1OmtxRc4tRkWsiEck216L?=
 =?us-ascii?Q?ecTVP8FjADlOQeGk8k9+BWeB8vXNeJ+6lT/TrICN5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y5PLYEyhsiNDrCYucHXnzuvpCAaPUiiOpUE/BCMG7klfReZb66b4CngKtLxy?=
 =?us-ascii?Q?qaSC9uwIO6U43XHH0vyO3q8PU6Mh7YO7HXkKwnWCADeHvjCEzyGpDmBq3ymh?=
 =?us-ascii?Q?WW0K5Tm/wWHALyYSXIWtqax9h1EzSY/Yp5YnXX4vv3sS7v0RjBbsDOsmd0pB?=
 =?us-ascii?Q?3I7LIk4nlSamzgt67nVEpfXVMPByOeuhghOqQ3RRxDufNSlFvpHSQnqPCqHm?=
 =?us-ascii?Q?bti039N0gzlo4beyaqCcHkAVV91epQmuWs3dM5Mf2hPjy3eT3SKEB0YqDUeg?=
 =?us-ascii?Q?DqJHnqjgajgv1vZyauWWl58BuN/x8Qi0CIwqretKk+vOk1MlxkVraDTCI/dw?=
 =?us-ascii?Q?XAJK5HmvksPvEQTcoW0mJkrfZwHfpGtrcw3afq88j+iHkIH1xn94g7LEuVrE?=
 =?us-ascii?Q?gck8VRcvPDFy7KGPNoC17lOoaMJbXzyQdGj2hhUu7azb+7kkEmHUTvEI6As4?=
 =?us-ascii?Q?OMe2jcPxyKvECsFJLZSy8DuYfRNBxLz7ndhzVvZMT9Z+LpalfWUvCaGvsa6F?=
 =?us-ascii?Q?BhCh5SCG0LwFdjFahfXqsUCLOv7Ni6bNi4LO5+anF5Z1kfa5gxXqSt03zQRy?=
 =?us-ascii?Q?usbsiSlwdBdLaF42PTaPwmoWraIRfzK8SJBCew0SevbhmVS8WPgNVnNte1Rs?=
 =?us-ascii?Q?DJs01PY5fc9YTsv64e2Wzb9/i0cQuT5MDZXVVfonX9/d8PLyrry4Kl3Amuq+?=
 =?us-ascii?Q?DrYJA44WiFpeniPDaB48yXSiD7TsXg4REFa1DiWbdJteFyxvM2Yi+vnnqpft?=
 =?us-ascii?Q?Q2jQxuiAuj7/93Z4uZtxraQMuakqz7AVofF20oy55yWDfLbXZnyt7L6TnECa?=
 =?us-ascii?Q?QXIdMP+tLaOePFCdgKior/mLZQDE9eMer+PiCsvlZhPq+0w1JKrRzdIaJYXL?=
 =?us-ascii?Q?VrYQvmYSqzZte3zFP7HHgt0oCH/EXxQXizWeWyuaNAwiudLwwK+Zs40utOg9?=
 =?us-ascii?Q?eu+eNOy3Hf+DJCNCswklfc/1CQ6YwNtDLL9z+xlMueGf1fFaiqce22M7SNjr?=
 =?us-ascii?Q?5nebZPJ+nGA7jJyNVceB3NtuprPPkr2dbxU8D63qA6NprS+WTYvyuuecgOPy?=
 =?us-ascii?Q?6WeK34IHxJnxzZtba9IaMRITs6YLwdFcq54/XSoyg5n+KfJFuBp72wBt4H9a?=
 =?us-ascii?Q?XfOWTKjwOrcZrCcEYMfVw8xn3XsQBUWhl4gDeuG2znwBaPbAgXcYdmiavjkB?=
 =?us-ascii?Q?tO6zk/7liBpG3KUdCouauQ5x5Jl5L9VrV0ABUjcnGFRZWgVG6A/gNSjhjX5L?=
 =?us-ascii?Q?7jp7i8RUH2RqXbX7bal+QLyfs/nLFXqboH14kLs+uuXgO/AOJwPdByK3OleG?=
 =?us-ascii?Q?rQQoeyx/DUtLaDS3RwH01y5k3TXKoQGvND1FJBvcDi7JUufZ48lndWd9PvpB?=
 =?us-ascii?Q?Ga6zEyhEpHPYKpe7VlBtWhzJqxmEAcynyVG4KefxTQXPS+ZVy542JOFQ7MFz?=
 =?us-ascii?Q?KKyuE4oixZwlmCiV204qg1HK44/ZngIyn6U6TmV0zwhM6g9VU44Rb6yN0iLO?=
 =?us-ascii?Q?espubUFgZnMrPI4ra1tmKUXxj/uFstV6Wa584tl3wxO3j5uI6kBwj+IZvCer?=
 =?us-ascii?Q?t8chskafdZ70pyM2b3dUCSVu8IChVkQ2DKIZlQ477NxMpBiGryTtMlOoNCAw?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02581442-e15c-4d8f-97b6-08dd93169ac9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:39:05.3181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUYbkG9rRgZxyx7poii2gExFK8QrulXbL+ySevk3XSIDTmSWRjLHO15ovZa3KLOF5Ow/tj8gL7eN2wbWJCgs5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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

On Mon, May 12, 2025 at 07:36:56PM -0700, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:07PM +0530, Himal Prasad Ghimiray wrote:
> > This change simplifies the logic by ensuring that remapped previous or
> > next VMAs are created with the same memory attributes as the original VMA.
> > By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
> > in memory attributes.
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++++-----------
> >  1 file changed, 26 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 59e2a951db25..6e5ba58d475e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2421,8 +2421,16 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  
> >  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> >  
> > +static void cp_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
> 
> Drive by commment - not need.
> 
> memcopy(dst, src, sizeof(*src));
> 

Actually you can just do:

*dst = *src;

> Matt
> 
> > +{
> > +	dst->preferred_loc.migration_policy = src->preferred_loc.migration_policy;
> > +	dst->preferred_loc.devmem_fd =  src->preferred_loc.devmem_fd;
> > +	dst->atomic_access = src->atomic_access;
> > +	dst->pat_index = src->pat_index;
> > +}
> > +
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > -			      u16 pat_index, unsigned int flags)
> > +			      struct xe_vma_mem_attr attr, unsigned int flags)
> >  {
> >  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> >  	struct drm_exec exec;
> > @@ -2451,7 +2459,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  	}
> >  	vma = xe_vma_create(vm, bo, op->gem.offset,
> >  			    op->va.addr, op->va.addr +
> > -			    op->va.range - 1, pat_index, flags);
> > +			    op->va.range - 1, attr.pat_index, flags);
> >  	if (IS_ERR(vma))
> >  		goto err_unlock;
> >  
> > @@ -2468,14 +2476,10 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  		prep_vma_destroy(vm, vma, false);
> >  		xe_vma_destroy_unlocked(vma);
> >  		vma = ERR_PTR(err);
> > +	} else {
> > +		cp_mem_attr(&vma->attr, &attr);
> >  	}
> >  
> > -	/*TODO: assign devmem_fd of local vram once multi device
> > -	 * support is added.
> > -	 */
> > -	vma->attr.preferred_loc.devmem_fd = 1;
> > -	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
> > -
> >  	return vma;
> >  }
> >  
> > @@ -2600,6 +2604,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  		switch (op->base.op) {
> >  		case DRM_GPUVA_OP_MAP:
> >  		{
> > +			struct xe_vma_mem_attr default_attr = {
> > +				.preferred_loc = {
> > +						  /*TODO: assign devmem_fd of local vram
> > +						   * once multi device support is added.
> > +						   */
> > +						   .devmem_fd = IS_DGFX(vm->xe) ? 1 : 0,
> > +						   .migration_policy = 1,	},

Where are a couple of magic '1' which I suggested to avoid patch 18.
Same question as patch 18 on the usage of these.

In general I think this patch makes sense if the to previous patches
land.

Matt

> > +				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
> > +				.pat_index = op->map.pat_index
> > +			};
> > +
> >  			flags |= op->map.read_only ?
> >  				VMA_CREATE_FLAG_READ_ONLY : 0;
> >  			flags |= op->map.is_null ?
> > @@ -2609,7 +2624,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  			flags |= op->map.is_cpu_addr_mirror ?
> >  				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
> >  
> > -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> > +			vma = new_vma(vm, &op->base.map, default_attr,
> >  				      flags);
> >  			if (IS_ERR(vma))
> >  				return PTR_ERR(vma);
> > @@ -2657,7 +2672,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  
> >  			if (op->base.remap.prev) {
> >  				vma = new_vma(vm, op->base.remap.prev,
> > -					      old->attr.pat_index, flags);
> > +					      old->attr, flags);
> >  				if (IS_ERR(vma))
> >  					return PTR_ERR(vma);
> >  
> > @@ -2687,7 +2702,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  
> >  			if (op->base.remap.next) {
> >  				vma = new_vma(vm, op->base.remap.next,
> > -					      old->attr.pat_index, flags);
> > +					      old->attr, flags);
> >  				if (IS_ERR(vma))
> >  					return PTR_ERR(vma);
> >  
> > -- 
> > 2.34.1
> > 
