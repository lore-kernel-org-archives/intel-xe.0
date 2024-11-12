Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3023D32D92
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 11:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8284210E5C7;
	Tue, 12 Nov 2024 11:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APzmyZBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E8710E5C7
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731410089; x=1762946089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FnPMPpm2ZjqS4NxaAYN3Z/O4wVcNxqQxEI4iD3heP4A=;
 b=APzmyZBqeDl2awMeithUVbKNCGIVbj0Ma+PUnJUdaa9rEZ3VS1rOvwld
 1dgg1uVWpixoQ9qEUUZnCSPyO16xl0Yin7eT1y3OCOknn7GqaOmRXBT6I
 9uGmfsPpBQxePOyA0EMM76c3l748lsgbD+ADaWvOU3DOnPVyKMDsfF1+M
 v7R9KR9+Tnbthv2rZZWTD2yOTlXBR+RbHx5++NiG5EZeW/ylLiuHGCJrv
 PCtBERb9iviz9fVw0o4d3TLK7+R7J4HogtgFlbJ+D58SJayxv4GpykSoj
 oq/++8skPx6YsVr6/IU7wk1MxeEMSWpWltoGQUZW237cVNF/Liarkw5z8 g==;
X-CSE-ConnectionGUID: a6aPY1NBTcWtgNTQBI21Qg==
X-CSE-MsgGUID: kVdtS644SEm89S/XzERQFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35171071"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="35171071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:14:48 -0800
X-CSE-ConnectionGUID: oeClVxbFTUew9WTrVT/giw==
X-CSE-MsgGUID: lNdNFRXNROO5PELWNqbB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87768001"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 03:14:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 03:14:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 03:14:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 03:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDwyP8Ao+dsrluhW/Yaa0TlcM328PsQh+vSWl7mb4BQCMefdfXs+6MdKF+SkrUe/s5Aow2wKY19eQWjm0gL1mgJe9wmv07057dJvzqnTXMdZ9UgQRCzuqJqS/UqZB0U64nBjjMozidVpz0CoRYoN7kmxys57hRkD1MkJeQBWqAkAvXvkyOL15On/RaPwPRbQM6GX+CEF4uP0mklfe0o32WO+70XeS3rBFQtrK4vRzHbd+46JgZaPJ1mhL40i2W5DwYBBPmf1BmTiaDCWSzjZORAPy2LOiPt6fWDe+AblhgD3NEwtF9VHOkbIsGStIGGOqlNC4ZYAKRHya6uRFxm5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oMmH6hduoOF44H0qL3BnPNEpf/qnsKr3sMN80LPSiE=;
 b=CzrY9WzEczI1d6QFwWX9V8rFOBBnN2UIoBephrS7gmze/99Zf/1DYiYizcYn4ROGLOWD1zpEjmWZxiiObL6llKixGEvPnOLeIxqBD1RQS8YEKq5uySf2ZqpT6YUz8kGYWwrtQ8e6UolToz8JSqsJlVfZMnqC/n8Eo0ErJMpDeU1xHtzyRGkQ9FPftUAGP/h0t9jmT/z0bLvH0pCSELbRhPiwgZ9sndNKCD06cqc5l6KgyKNC6Uf8Y6E9LMxNoemgD4GqjryiA8spPjVCWWAvb+jK3kqcSoOhC9JUHHg4caBJ7++HCEuyys/y10Ic+A+6otlNU4CFfjwHDGWooemZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Tue, 12 Nov
 2024 11:14:42 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8114.028; Tue, 12 Nov 2024
 11:14:41 +0000
Date: Tue, 12 Nov 2024 12:14:33 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm
 bind IOCTLs
Message-ID: <ZzM4mV8VXtuUyBT-@fdugast-desk>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
 <20241108161307.1203967-2-francois.dugast@intel.com>
 <Zy5wJSsG8ppPCg2A@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zy5wJSsG8ppPCg2A@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW3PR11MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: 608d433c-631f-43d4-ee1e-08dd030b3468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5bwCpRh8TjCO8xK1uNfKNIfyUmgsjkdJIaCurn41ijpnpQuQg8OTCLf5j3ca?=
 =?us-ascii?Q?w1jtBh9ThE5R0QVe26RdLtvI+xQZgrW6e/wFRVcPLSSb1r+spoQJQ0ob6HfS?=
 =?us-ascii?Q?iw8MVX/iNWnhitqvr6ppnG/zLWH9mjHIzrLWI2rTdnK9Tfhk1C4uyQJocyMc?=
 =?us-ascii?Q?W0RIUtqC4bwPgDkH48r14nblbKi/zr8E46NghT60LT2Zz1L41f2Gq3k8a6br?=
 =?us-ascii?Q?Dc853qKRzzzdn7cK7eDkCaPvCT7BsO+ucrLkNwlOumwXoQ7WTJxKvQwL7JIY?=
 =?us-ascii?Q?dpqsVhSfEV3oKVAiSEwgzShi9h55lA2BD5pGE09tAyVcPHw6d6yf0d8l8b20?=
 =?us-ascii?Q?UGGNkwDEKwkJ/SPWR0TbqSOFv8jQ2Y0+Lf1KnvoYI7aSZkq2cZbcQqKXZQ+/?=
 =?us-ascii?Q?SWSIwB2kEaX2p5C0P9d4PQkD8o66NK8rqP1IYUNDo4p2G/pbXXM7zDFZ1Kdp?=
 =?us-ascii?Q?UXPvSp9lKoZ/t+ba7/TozboRTYgm8UY0RrtP7/SgFEGoVddk2ldwT2V+vENa?=
 =?us-ascii?Q?NgUpBlhzaVwQZElG8ZW4FE2DtrYOAPtXn/kx0nUxIshE1uSxdGmpIaAfbx+V?=
 =?us-ascii?Q?4Z2YnnZUUW+jOttqS+snFRN3kMrr3gm25v0FohuNCzm7Fw76mHsbxvUjuvFH?=
 =?us-ascii?Q?lJgZlsPr7ceeuTklgB6tdlpUPogoqH0wkoLOgzrh/pDSlZuEH0NZ2a2TdsgO?=
 =?us-ascii?Q?rQG8uVXbOcx44PSMWLmSRPzsES8pIeKPRrXA9bZa/G3egFzRZSYbeMnr2YfE?=
 =?us-ascii?Q?qfTQfA+p2QIUi1JuF7Ehy1cOvq+fCgWqiWjB4gOYbvmdqlNlkNZiMADY5eha?=
 =?us-ascii?Q?WGSHH4eiOMJcjZPNUcFr620NEllHjnSnuGNngCcWvw/I/b7mqSYRFJz1yr7j?=
 =?us-ascii?Q?n4tAFuio+2wqNWdXXPFC9kyV9enUJKCUiYu47y0cXcWQQZqkBchJuJhkmDkh?=
 =?us-ascii?Q?N0FIQrlqLyPGmNyC5pSN50ei9S25HFOOq0O7gJqfKGh/3YoOU5kk+xZOApcs?=
 =?us-ascii?Q?j8Cv/WtxunqFKIyzXFJSMZsc3ftIZGMRU1FrWqkpDlbJtMKqz6CYk9qIFmCe?=
 =?us-ascii?Q?/qrxx092I+xdVofOcNLxtdfvjNvb++IOnB6Labme2HglC+CifUi/ul2ZbUgk?=
 =?us-ascii?Q?W9K4P781HqT7EOvaZRVMbXCLNxfBOBZMnfwOhkH7NWjdNYMWJa1SOYZhajrb?=
 =?us-ascii?Q?9XDM6s27yNUulRTJ6N3p3ZDbs3RL8ryzFr55F+KpvNL9wzO9PU9Njj25I+PP?=
 =?us-ascii?Q?RzlfoW8Xn5jEnIEsWRLksFWc1vBx6/7c9AugbGDwow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJgONSFoCvg/8H9dpW/BafeGDqTdqEB8nQRcB1Tb6tdZVwbP0/HE01JZdjHw?=
 =?us-ascii?Q?Ut13JNTLiomtGXB5DcsFqR0k0IOqls3/hCrbTF3hklS4nqSp1m11k5U6fGTa?=
 =?us-ascii?Q?hNVizRHNyQZjLeB9TY3tXu1Z2hgRn0x8U+Vmq/doW4lxIW0KaU5vZlMcGgcX?=
 =?us-ascii?Q?5wck6wie715GKXMyly8tX1FxXHiSJvJzjD3kb4/3iqZsSKmMAuQ5fGoUpXiU?=
 =?us-ascii?Q?heGTppmvMd4S+D/t/LBxrR9MX2LOooiIhoNe1dj5EtXWx4CWy/tZzfwOblcV?=
 =?us-ascii?Q?eZYziedI27kAe2+rqxrlJSOkgmtNidAsTUQklNVKQIFvWlH7+vZrgQFv1tNc?=
 =?us-ascii?Q?A6kJcPOzoC6nb81PAWNgIuKRHd3qCCPcE4zmjivVTFtqv02yxZ4uONrX1QFn?=
 =?us-ascii?Q?6RgdaIFSNjUc9y/RmU0FLloACVmSMOcTGgIkatvIMfrQNC6tXhu9GWb2jhBR?=
 =?us-ascii?Q?xdwhV8rRr156bNXI5jYelqdoHA255kQsUahXmHo90IU4ViVzbhNay2wk2rh4?=
 =?us-ascii?Q?RubpekXvDNqY4MNFyPVW1l9nsU0pkhZZH9NpnVJG8KuIaThEVyOVwmMonzPF?=
 =?us-ascii?Q?p5trVxp52OhvYMtyW8VI64e6zfW0VRl+EQQ554VN20ktU8G1mY1MtQWFd5QC?=
 =?us-ascii?Q?W0QYkrG6cMtMUfHzZFJYNbHay9/PxCzNPohOzw+gxUed4PUYryCSGOZmi4TO?=
 =?us-ascii?Q?GY4uxaMl+vJd/15ZrhsOtcGbL93wlM+35FSlBaEqeBtzd4qYN3MEQqdAbdk3?=
 =?us-ascii?Q?gvS7hSp6IyfN16QgjfpSqyOobCqHys5Gi+VYrbnjoY4bBp7h8ZKyOhL0wthW?=
 =?us-ascii?Q?HoSNAXdMgN1aoKyEOdtp+1WQDpINGZznQ7P1OUzdEVlUtDhmlnpNl02P9k0e?=
 =?us-ascii?Q?s9VR1Nu5CEpSn/qFKDLNqVGPpnunzdqV2qi5Nd/okUMUQFbSQlnSpIeV+aLW?=
 =?us-ascii?Q?ZCDkG6/dWHtpV3eryQunaK1IqUQmKPHdq7E3lkVLp8WiWSxFk3NiM1sDj3kx?=
 =?us-ascii?Q?DQbOxyUhQspUDRl8m4lS2PlJ6gR6f/uSz5i/yn51iwttZY1wqeTk+aBHB+hh?=
 =?us-ascii?Q?8jgTFy4yChTSDONpTCifBO8ITrABiB2EK3+TeAg76pXyBDOV5ybXZ8hP7Qp/?=
 =?us-ascii?Q?doGxL56gQn12S9YT0YshlL4srLTptT853rMInMy2HQypqw4guy9cbxXxClhw?=
 =?us-ascii?Q?dsFELxRCRBfQXtgofWGRzzJiMx4fdcQmzFf84ifGmQ8vFO9nvXdetYyTjWQV?=
 =?us-ascii?Q?4pCVQIVHkAVkyM3054rLlzusrn6mA/tfYcZ9vgWa6JTMS03bnLr/D7/VWHCl?=
 =?us-ascii?Q?bQHsVb6XRpVHndmsZWqtav68cNYKV7O+xMMogPFb7oIeVtPPDgBhRVb6Razn?=
 =?us-ascii?Q?M0H5xZR/seDvKz3AndzWx50TPtstC6BpCXHdZihfmGJf1W9aNqnUW9EXuCWL?=
 =?us-ascii?Q?Udm0Ds8hp811gSH1wKqXi6uES32Z9tqGr6eEGOxuMSnXhsrbTyMHLRXyrmQF?=
 =?us-ascii?Q?N5Z41+W1qgtzYyNsRSpj6Y1yMN2bZ4qQKukIVbvNE7cPCJTRLGmzfKf7g/qc?=
 =?us-ascii?Q?K1By5rXRyT1TNaaMrl488AwUJ0qX9B37H30jkAfXcZRtvJo8stSijj3FuPt9?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 608d433c-631f-43d4-ee1e-08dd030b3468
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 11:14:41.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiYf8YXVBWyrxW/B8t5Tg5peOUnNxvEaiUt4A3o9lbg49Tg93NlDld5WShZRtRTowpI/g2wEA2yhREfPwuBy7klJujnObNiICcA3PCbekqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
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

On Fri, Nov 08, 2024 at 03:10:13PM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 08, 2024 at 05:11:56PM +0100, Francois Dugast wrote:
> > Use fault injection infrastructure to allow specific functions to
> > be configured over debugfs for failing during the execution of
> > xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
> > thorough testing from user space by going through code paths for
> > error handling and unwinding which cannot be reached by simply
> > injecting errors in IOCTL arguments. This can help increase code
> > robustness.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks! May I retain the RB after applying the diff suggested here [1] which
adds xe_pt_update_ops_{prepare,run} to the ALLOW_ERROR_INJECTION functions?

[1] https://lore.kernel.org/intel-xe/20241108161307.1203967-1-francois.dugast@intel.com/T/#m69d0b496c82f739e2093710fa8b8d7ff9f4ae712

Francois

> 
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
> >  drivers/gpu/drm/xe/xe_pt.c         | 1 +
> >  drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
> >  3 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index fd0f3b3c9101..b999db5f5c19 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> >  
> >  	return q;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> >  
> >  void xe_exec_queue_destroy(struct kref *ref)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f27f579f4d85..e111698abbd9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> >  	xe_pt_free(pt);
> >  	return ERR_PTR(err);
> >  }
> > +ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
> >  
> >  /**
> >   * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 624133fae5f5..2e67648ed512 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
> >  
> >  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> >  {
> > @@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
> >  
> >  static void xe_vm_free_scratch(struct xe_vm *vm)
> >  {
> > @@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  
> >  	return ops;
> >  }
> > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> >  
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  			      u16 pat_index, unsigned int flags)
> > @@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >  	drm_exec_fini(&exec);
> >  	return err;
> >  }
> > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> >  
> >  #define SUPPORTED_FLAGS_STUB  \
> >  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > -- 
> > 2.43.0
> > 
