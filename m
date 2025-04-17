Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D4C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 02:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA52E10EA04;
	Thu, 17 Apr 2025 02:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqeiNIdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D697B10EA04
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 02:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744858365; x=1776394365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vaFoK5hfhBw2r3QSoHgtlsIFst2tA1MAJLPneIaySBk=;
 b=QqeiNIdX+9RjjxHvEov4o+vuvhRMLCyvch9RXW2o4/ivjJ0idDAbNBNQ
 Ca4wcb0xmlM2GvAQQw2ymJqJiCiTkW/d/l5nclBVKvnByDLO7tiIb4VCL
 dvw/kR/znohL/AWERf5w+uShJLCf9eq+30Yoo8iEAZpu229f19VqL0IsW
 2Yl+a7X9yBkbiAzKloBti358VsmdjyQVHju7yIDq0ycxQVB/L5e4/OV1M
 Oy6BmdOB/rQ1mGA5psj6rOm+74ecT3YttLW5WikcyCk+CJRyNpQCNb4lA
 5nefyhYLPWjIVi6q/ayImer2KRuDGbAJ71VFTPlgWkQOBGdymK3drZlvP A==;
X-CSE-ConnectionGUID: UUC1ZhlTSwaGp6COQX8Qrg==
X-CSE-MsgGUID: ekX0LfSFQmeCw0o6x3/ndw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50077026"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="50077026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:52:45 -0700
X-CSE-ConnectionGUID: j+msojsIQ1aJYUtvX8ncGw==
X-CSE-MsgGUID: a+5ewp5hQRSADRleK5pd+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="135520855"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:52:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 19:52:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 19:52:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 19:52:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxB4TL7IrMFxv9uuT1vKivblVKJZDB5FL3+EQUiouzwp5TkIvWay9FEcP01bSQh/SpoOcD5DM7Ie6mDZynj/BfYrEnp4f3o545gPNMpfQZJdDqPA7mJqRcvxFCyl0EwhccwiDgoMM1I/9TxxyaYQPUMmzp+7AWsWpNC6LwGenciHEcRROVMniiFU0yJT1n6/CwUuRswGVo4ibjDERiXgtkBcqQtKhkTxZJ7I7Aj8ny0HYHQM7k7uqlbodN1n9uU+kpCDoScHmgcsP5XDhwauCvZCQla+eodF2mUdcGD9KRsy8ATya530E4XIVf/VaI2ebuLlnhcPlse6e4pLKcNvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc3so61bk04MbUA+6JFRDk/WZXiZWMMs4jEo50UNX1M=;
 b=cAKubxzHQu4urcTeBg68OO3sHEAFcAPFn1hdI+cLtA2C4EEv+47IfLfryyJTdPaI2xtftPi0Iq7mMBn6kXNcUarhdgXf2dBg13u0gCAmjDUBN1wGw603AR48J101id64BONWZ9lVq6+2PwwvW4F4RaYJfthlu9x3mZSYgEGT4HQ6LbVJj3XPbkRZpsqUgRYTd4TrfDOub08ilt4u6QIKmCFGHgQ9R/e1Ifx/tQ8jAOd7Q3MdChn4lO6Pwdr7wbNxfkCNR23fksqFwhklXzOmaJfUa/8tvvuQfZ9XxmP/k8ymT5Ywh7PJqMWpNiKxGhWWBfY0xaR3QjsAtnC2LmCxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 02:52:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 02:52:31 +0000
Date: Wed, 16 Apr 2025 19:53:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 09/32] drm/xe/svm: Allow unaligned addresses and
 ranges for prefetch
Message-ID: <aABtPXEhUTq0KKPR@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR2101CA0031.namprd21.prod.outlook.com
 (2603:10b6:302:1::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0eb3a8-2a8b-4fae-4293-08dd7d5ae5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?20lCNqzUDBGDNxNwRR7mOUmQ1SYXDRw3KdBAiOFOl9xdvbn3+lbe29p7zv13?=
 =?us-ascii?Q?BXP3okHl23jMen1qHHLWTl7Gfve76nXhMvFT8GXfS5nQr2IqBE4fVvtSJKaB?=
 =?us-ascii?Q?8ObGWCdOqcRdUxqpHkrpwta48so3RVYPC00NDQUX3tBocA8VjulH+zAhsOjX?=
 =?us-ascii?Q?jb9AYXI1Rhphgoyldqq041j5VOAYbG6/Ja2ExLDP05LzYgjTFpCbKhUIEdRc?=
 =?us-ascii?Q?N8TQ8H6CwUDdyNBT66n6ovGEyjjogrrUF5sAeM89AJtdmRkJnXBiryVhACsi?=
 =?us-ascii?Q?IQ8mZYlGdqFt2Mtax+uJd3/ShY3H/q/+RXSNoFpwhoIJqkUMD/BuAiWGq6IK?=
 =?us-ascii?Q?hY5rYxHMbhIAKTB1Q7QiUwFOCS24fP6/wWrgmSRQ4/ITr5KEfXUc2W1M4lgq?=
 =?us-ascii?Q?lj2A5aenuc6oJ0VJXi95Uc8AM72bXl0ekkb6A2EVtdqcH2pMO4/AsdnJRFQf?=
 =?us-ascii?Q?f9irNUC4Pecl2I5IMejlbB3/fhBoJITATJ9UpcwwWF3bmvVNkDUb3NKgqoVR?=
 =?us-ascii?Q?G7ioXyNUR7wOGqzpZ23ow+tOYgiKZKBTUhe+QF5Km139vyy7xpGw6Am0e1tQ?=
 =?us-ascii?Q?FXAr3NbNJezYlLFTtARoX7jp31rRN69Y7shk1/xsB8ieR4bp8Muxij0W3m5f?=
 =?us-ascii?Q?Hyf6zwFu12tV3ZSreM2p29H3lF8R4hiR3OrXFNzDtAVmilMuSxhwQLYKLi1B?=
 =?us-ascii?Q?1ERn0m9oSYAJT7xnuxz8x507vayt8JKWSIFpzRsPiPfgoWUwKUxoa7b6AFkN?=
 =?us-ascii?Q?DijUjF7/VrZwYMPt7Juiow67MZGaka5ztj4+4Tmw0CXExMYtq0LYnRipnxm+?=
 =?us-ascii?Q?i6Lzi/Bx6c7R5Xb99nM8v95lL+lb4n8mdbS9d+9aFsi6M+UY8PJSKl0FHORS?=
 =?us-ascii?Q?uWNLGeal/JghtCeYDZXntFzKOr3v5cdeCIwEwC6bwRt5lPOlwl2c8ecovoQR?=
 =?us-ascii?Q?2lyDxt61R8nPzyOpShz25Ity60pnNaD5Mgi5Zt3lO5nv+fvHI3DY58YQ7SX4?=
 =?us-ascii?Q?Q4g+Hbv6fc1vSUCDi7Kn0VY/ylRnnGUwXW/x/THPKVoq5z9EI4l7ZPVVm1JB?=
 =?us-ascii?Q?IdLOrPOvMRSld9RN61ELT5oMaXYCNYpDpj+RU5FAt2eY8jOMh+8K32EnA8Ln?=
 =?us-ascii?Q?frssf7uiKuyUscv7YeZSe8MaXBcGoJmKum9CG/HOKRjMuaOtel42LYfcDJud?=
 =?us-ascii?Q?IyMlxLVUCy/AZWt6qDVSdsQkE73IRqFL9n6kw6rx7XNZu2eHq5hegWqRG/FM?=
 =?us-ascii?Q?gNFgMmXH8/70EJnacuWigSprD60DvXDGcPycuhwmCA26Xqqab8shURUJParI?=
 =?us-ascii?Q?ivwFAVh7EL84s6K+sKxVdSsejw/mw6VwfjWcBQJ7MX4GlqDMnS7vqwZZetMY?=
 =?us-ascii?Q?8zUa8pXnd9BYqQfUvwFImUYUrGLm15J5O+7FOfyX5MVdpN4g11snnxZmLQSY?=
 =?us-ascii?Q?lGGrx2+AV6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5XzWwI7LN8US+qP9/c7k8/H06SvDSqViJf8m4iRSEtFqjuxPGXbK2scTl3Eh?=
 =?us-ascii?Q?9xzCtb95bIEt+0J97lkcSAKMXLAsudjUlE+FB4opqXu8eNs81ZgfnDbeXR1n?=
 =?us-ascii?Q?UOZYH3diiZOFqTThigTs5dADUDbIgZCJFgsrDgqvgn/GXWttk5HP/Du0p5HF?=
 =?us-ascii?Q?S2m/mtHYidT/wuy8OMYLFh5nCPpd5f4oB7cgTBhcIlLE9lnQfmbygVrY9jjK?=
 =?us-ascii?Q?AN5EHJtnd9b7hPsl2xdtmXSJVl4+uSN0IF6WCUGob6nZBjEQlzK83AYBH4+o?=
 =?us-ascii?Q?oTfKLIkWM0i9Rfh6tfIKi95A7gUKSihusbS8slQK/uG/LEgOBfqSTRYTqmr4?=
 =?us-ascii?Q?yJ+p4jus3UJ46K+EJgNerEFKqDgZ5rDdu+xkg/ovhPt1Dq6wgXlfESYAwrcx?=
 =?us-ascii?Q?NjE5uyquKNkSFObPIXqpOh4zzvUFDiD72zY9k35M0ZSxdwwdUTMOzBeHxeGQ?=
 =?us-ascii?Q?wESFIfpDezhua7USjpWH0t+Qp/R94pULzx/D1+vpeSmj/UkCbTtd/FTdmBfY?=
 =?us-ascii?Q?G4Lhx6/w2HRWPLqUQ8kCVCLpdwvr+8O/3tVVFvykK2louNFA/EfSzrCtcxJe?=
 =?us-ascii?Q?fHDrJZPibb96OHe8WHZDqYLcLzPlBVY8jlZacXWYHq5XFIzkMssd9Y0Bq6Fk?=
 =?us-ascii?Q?XJfgME5Qj1G1uQ5R7fs6L7o+zGINrag7vRaRzLsGHe/1vGmGdqKRizqGDKT/?=
 =?us-ascii?Q?ZKXaQ/QyxrnUxliLh7mEN91pTlcSCcpEzKYDIObsEtB5fE1FlAxFfdOSDUKk?=
 =?us-ascii?Q?9ndswncm4JgiNdFzs8tRtWHlO0ek8XTjS8BscVLVDlsmIR0Jwf3yzHUdhngb?=
 =?us-ascii?Q?NMFTJtGT8U/ZQQ6dy2rR5AU21afu8nM+GN2ytEmqN4w0B42itB/g/bmqZBny?=
 =?us-ascii?Q?XxubJsmX8OHIb7wnlp0a6l5LzGsTPbRvFhSspxr1XSqKx1+LtddHHgE9wJLr?=
 =?us-ascii?Q?M06f2Tp9+549mzyz5sGwq3Bup/I9zoh6NvbAhhjPict+LPMuUp+7aaYY80IW?=
 =?us-ascii?Q?CNsYZcqH29BWUHbM/ixEnFhutAmzPXbztpTsDgQkFcbZ4W0rC/gSaIVoVo4A?=
 =?us-ascii?Q?ShEvxS73lbj4Z79TSuq2wI7gRlWHrHgPwi1lbVzFHQZQrxTDZNV2hBF1nqv1?=
 =?us-ascii?Q?Db5+SzG6klhRInU0IGkK2Sz4AiHzmteM+634oW1ORWffR7oV0vdM7Tqji1me?=
 =?us-ascii?Q?+DYh46nksYckLWBqgjmb721uOF7uyFyjiW4lRNxiyALMjbM8SwaRcuWQhGN6?=
 =?us-ascii?Q?RAjTymqLeip3+ft0QeuM3hy0gD0ihbEKnyE3q+V8sQTZCuXamLcUc0eceOIv?=
 =?us-ascii?Q?7msAANf4AxHIILZxqdBf3CoGtLe8GR4vC5ZufXl6D3IYWNOPekNVqUqJ3xlU?=
 =?us-ascii?Q?ZozBkz3EahIZ7X3cc24HRuJG0/j/JEWYIW6PF6h7y4dNMMtIknkSCZlWksq6?=
 =?us-ascii?Q?CMY2vZtUuJ96PH0NDBVrXki+5gM6eActGAasdXmqi+gtEhir2mEGyDSA2UOR?=
 =?us-ascii?Q?hvqN4Pe9TcSbMvmxQl05aU2KWvwyotSNfK8QeVNydj7/I+R6IwOcsgP1O2jv?=
 =?us-ascii?Q?n49/ZLSFPzDgDXBMcluudH8qKIZUHPligl23jvtpISUtgKDSr1t9kxdyEy0q?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0eb3a8-2a8b-4fae-4293-08dd7d5ae5ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:52:31.2378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkcI3Ik+xn7thyghRsuHhkVkhlyLBjMPL4uoi8i2hondlZPq70eYR9dVkwgVEFsGFnp7o3RgpCxzeV0//9M7/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

On Mon, Apr 07, 2025 at 03:46:56PM +0530, Himal Prasad Ghimiray wrote:
> The SVM prefetch operation can handle unaligned addresses and range sizes.
> This commit updates the ioctl parameter checks to accommodate unaligned
> addresses and range sizes for SVM prefetch operations.
> 

This patch can dropped per discussions with the UMD team.

Matt

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ac308cfdaf28..57af2c37f927 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3111,6 +3111,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
> +static bool addr_not_in_cpu_addr_vma(struct xe_vm *vm, u64 addr)
> +{
> +	struct xe_vma *vma;
> +
> +	down_write(&vm->lock);
> +	vma = xe_vm_find_vma_by_addr(vm, addr);
> +	up_write(&vm->lock);
> +	return !xe_vma_is_cpu_addr_mirror(vma);
> +}
> +
>  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				    struct drm_xe_vm_bind *args,
>  				    struct drm_xe_vm_bind_op **bind_ops)
> @@ -3219,8 +3229,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		}
>  
>  		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, (addr & ~PAGE_MASK) &&
> +				 (addr_not_in_cpu_addr_vma(vm, addr) ||
> +				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
> +		    XE_IOCTL_DBG(xe, (range & ~PAGE_MASK) &&
> +				 (addr_not_in_cpu_addr_vma(vm, addr) ||
> +				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
>  		    XE_IOCTL_DBG(xe, !range &&
>  				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
