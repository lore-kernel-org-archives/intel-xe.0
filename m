Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B73AC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 17:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5308B10E26E;
	Mon, 26 Aug 2024 17:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyNpy14A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E1210E26D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691809; x=1756227809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ze7bwPlocXrJbSbONko5jkMboTuYn65Wwr2J5+aUOqI=;
 b=NyNpy14AwZvt1Nqe/tafhsVZgbzyixIR+oHM0TMvrJzAOhIg4bhF2AXv
 AoMEwj8MZMVKSR9xoxkMKtCZ1yPffyCPQqe6hyHXkx7B2geYcVpsy5jO3
 mf81wTdFkxO63kTnpo9oPFg3WgvaSAn0CMuyM3v+wgfRZgZRcsg6HllXK
 6cK00nhXEkKTNIZGo6s0cXUJNvhKyupusjrEDF9S992YPgJBElSsSlWN+
 mVIy/WSWeZEJhWLPtFs9NIvutTgP/kMXj/yv9NAYzSg6Mfjb1LCRCb6UI
 S6LISDAFo2sdIkLqziJ5Drmpu+F6YUwXFudToSbQfy6j7NiINoxCsazyJ A==;
X-CSE-ConnectionGUID: f5Us5UXtTgqq3up4KeyUFg==
X-CSE-MsgGUID: dkNtIdgKTtSQ5Z77wLa2Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22998633"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="22998633"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:03:24 -0700
X-CSE-ConnectionGUID: yAKppnz7TyKJ0owyOsMCIQ==
X-CSE-MsgGUID: rTnRTT3fSl+Vw96Yi3YqvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62248717"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 10:03:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:03:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 10:03:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 10:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jt33k1rQ9/WE75mleuL/C6OfYFDJ541mrdww6ZHhkhkWFbukIgJSpc5aZcFnjQ/UHpXCAwwHqKvCmkdpfFJOsZmGKewpp1wBADxhivIy9MJG8VLiMktiA5z19FF27d+ZyDpV1upPdnjw54/Jr9D3oVo66OsiMDLpeh/7bsf4K58LCbDsSr59X9RI+5wmxMoTN/ukjzEu9SRiS/LK0khwAo427OR/ln33T9TAs+MqAUK9cVu138qW1eMVZb3R8kaW0LONlOXandytuaB9CfEj7AElkelI4K2TWEU3Iay8VvzhQRi5tkngD1YQCrccet4qPW+r4N/HgZyMFRgGn8RVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCB1UyFi9UNrUEn9T21F5mjJ4jibGcz/54cuVsNk9S4=;
 b=Fsb7aDinm+hrKXpJcgArl6/MxCLQ8pNoSzBo384yeb0lQzGWHVLlYEV4FD1jl6PioDOw5JxIdZS9gvwZ3ua1H2BxYG8Mr1XCZQufCnJlRVP1G00B7+MjzrY8yO/Jrtv4l2ijbxp1+V/sAFrfhYc5c1TyXCMTstiwqf9gtEBGc4tUFGPG1whuuiOp2efeqD4WjE+oJya8kypCMW++tmFbvjhZCjTX8EjGZEGEEsrr6KwmDGC9FwVgPu8PKwul7IfsvLfh979mQPXxTNSXk70Oh+XRjyuHAQ/Gri/zqOikwwJaXzXz28gJuctABxpXEAfY4K7bZTyuwkLewlbzwTVeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 17:03:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Mon, 26 Aug 2024
 17:03:18 +0000
Date: Mon, 26 Aug 2024 17:02:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2.5] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Zsy1DFqH1b4AkKcm@DUT025-TGLU.fm.intel.com>
References: <Zqp5oYGygI97UglY@DUT025-TGLU>
 <20240826144000.302353-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240826144000.302353-1-andrzej.hajda@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f25268-d86a-4850-389a-08dcc5f0fb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7mRNKVZcB1NRYAQspFGQexMb5xY9AYDPPFednomlBXVTubA+67XvdvTl92CD?=
 =?us-ascii?Q?ZVJOuKcVDZgE8sVAlP3CTyOR8z4G6uAnHAuaWxjeKJHGQaSIr31MJBpRZhTX?=
 =?us-ascii?Q?SliAS1/npM2pRDvgRMc3eJbG8x2sxXLu6FGDLxBzWR5YnNGQ4+YJozK9uBkZ?=
 =?us-ascii?Q?KZNSp+O+yG9RGyu1vopwz6exgvDikmJuLPAGBRX3GAnaIO402joq+V/kzj/t?=
 =?us-ascii?Q?ga/Sp/vOgxRo9NQT5pBbgsVHdSKyOSkt+VH8lRzsf1KYnceOIYKh0uIDPMH2?=
 =?us-ascii?Q?zQ/1aoSVjEKK+LVmQSruI/6aBjOaYcJa7zD/yfGwXiC666d6QCNyE/Zk/qBp?=
 =?us-ascii?Q?Dy48q9BmrUtfefWZ6TuRyr0iZXGmxGzvMdQ3Qes3oZVwMvTyhX05ubobvmrZ?=
 =?us-ascii?Q?JN3K2XdZKNlulY29BTLr+f3jYahA0Pm5lYcR2saiFWoJxDJSG/gxWd2hwqxN?=
 =?us-ascii?Q?TdSBcNcGHJ+2H3mjroP/uSqtTS47d8D4CGDNMb5ZzyOP7Xh+yfmyQmEv6b7g?=
 =?us-ascii?Q?iAnZoDuxoE/GSEVdSUHaqnSPe+OkHyGY34XOtKtokto0jakVfUFAoVCQPTHn?=
 =?us-ascii?Q?CvFumoxd83jlAUryhFZlt50ufBSmq99rxarjg+FuWo7keRQna1UrgYRITo1e?=
 =?us-ascii?Q?N7EVv735EKXqZ1yQClxqnEHpaFU9nZWzWX7n66YNfPL1WZ4SADWW3M/uUvw2?=
 =?us-ascii?Q?9uec2pK/ItGqH0OhjEo1QX+LLnlv2xieB89VkPMipoctwc3D82lImU5hiwZM?=
 =?us-ascii?Q?cIm6Px7a5rGqg9s9mKqbLpjDlaJ+no9Us8GzT22RPhnUHh1dkhrwGWlVgfFx?=
 =?us-ascii?Q?myP1IpzjAS2M76ZF+osLgLuxpQIKGC2ZurLe/Y72YQah1Z8LSQRTbiwHhWa1?=
 =?us-ascii?Q?soSMdZDwIQQ15c9MplTdU43ImxLdMB1rqx2DmEnzJtABXhTtVCytqPFbPSUi?=
 =?us-ascii?Q?va2XFd1RYlZCJLRX6yoSdPA00/fzEia61BGhCxqO4zZN+vXxxfpIM94R+VI3?=
 =?us-ascii?Q?m9DAdwowWTYwsg0SnVnJ1W956Hxql6i8/bIbKGPqzKqcA0Ufz7liv3ZyL0Ge?=
 =?us-ascii?Q?vhdMF4P7ws4NCTsvjgU+rcI1qP2MEgzkzBaBWmZxfmUIiiI3eV2sHATzHEIG?=
 =?us-ascii?Q?Q+e6UWXuMiKqlm5LJN9/dwvEjrmdpHTgXq5p7Bx/u5TOW7DR1Cfe3M8Xaaao?=
 =?us-ascii?Q?30RHxe2vnMd71TCEZPnHIIzm2XmY9s6KlCtduuJgr+Ukku3liSV/IWvcluvL?=
 =?us-ascii?Q?Ctl6OibOI+R6X/wPZMav7/iASGN5uGZHwKJlbnLZmBC26SGFUI8iInsLBFOT?=
 =?us-ascii?Q?12saP5n3i1yw9qrl3drqRiQhbiFlV7XEjxC78bN/hBFCKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QpBaFBoMypg/Y7bhoCVY9sYM4qG44TEVuJUrRs2mnVecTaCVywveVFRC2Te7?=
 =?us-ascii?Q?kYMK0WwvSTT21VX82vm96PQ6q9/DumnM9z24KuQhD//yP4/Dszc0MUogrfRT?=
 =?us-ascii?Q?hOpBSccP3+tpOXFdX2CQfu8IBLYvFLxo67z1NCRfZ3O9nqQmK0cdw3iNy5z1?=
 =?us-ascii?Q?OObBg/RCeKgpvxBsWiti6ccB+kr9ahcnG5Q7XgxfEC3NgZCTTzFV23EiczIW?=
 =?us-ascii?Q?2zfX2dZx9RfFWILB263ynkk7iciF7kePpwQ55k8FGEjTKPEaXdaHBIPAq222?=
 =?us-ascii?Q?WXtOxw2yWi3kmyG4RCsn6k1LbFZOQrSle9X7Ibns60dUAgeFVtf9kNSQbiDd?=
 =?us-ascii?Q?3sSF4sJ0vO/va6mCHFxiLP7esZf3Z01+zTFlIQg7l+srHlugn/CmYKwCwMMM?=
 =?us-ascii?Q?71NitOpgqO68+01uUt3SQZn35hOEbi/Aq8VSj7nFNwOygME2+QM9XG0Tx81k?=
 =?us-ascii?Q?BdoZ6fJ68Y4n8TAFE9TdjsfBZI+R8LnCLXXVSGW5j1E28StbM3sN0tmCLgd9?=
 =?us-ascii?Q?BUydkkw+OhhmqRFFAo/JHYWk0lzEL3IZx51kQ9SyJZXSJtXiSAJDi8VmJZSp?=
 =?us-ascii?Q?Jfsv2oN9cHMaORg1ezkg2wKODTI5ZEpuMDjj7Dsos33UYNKTWJSYSaEWefie?=
 =?us-ascii?Q?1XKmPvzjizyrHUqpROPgq4LpkWpJ2JuOzRUk/z3AcwjUQIaSHegafD6ZVjaV?=
 =?us-ascii?Q?5ZzC0A/vmWEof09pFftP6N97FXjhFyCwC5xjg6wVeIhinGQPXlL4Tb92F+RW?=
 =?us-ascii?Q?JoaeaGCXm8SgxN8kuVsJKlWbdbVPU9l0gqSBV10MnGkadfPO8ON5dPMGF1V8?=
 =?us-ascii?Q?jP7U0WigviN/pUop/zFY+QIh15v3IVZDWs8jWjyFkApnHcm6y50h7tmHQAOE?=
 =?us-ascii?Q?Z9Mmh72gXiobO8YZqaCwilJ2n/06b+ajW1oeb+qJAz1MlsLiolqREwmxNXIP?=
 =?us-ascii?Q?MWKvDZzfGblHr5SoKMvH5T7rgzr8HCS6HnHzgLODQ4/0tUyYEeltdOawFWiO?=
 =?us-ascii?Q?MrS5wRmIagCdnvjrTYxHll+WwQlOc96H/YUbKXgCAPq0s7MY4XbRYgYrA9Oe?=
 =?us-ascii?Q?iOYgYlmrEGqC6yc9XxX74dXwRcY6OCmZzDy2g9Tdj4clLR412NP6NtSbLG2L?=
 =?us-ascii?Q?cNv3YK5nS+qj/a44RqOXz0JYOMR09ootxrv9Sd9wMLXL1Z4QTyFmWAPr5MUK?=
 =?us-ascii?Q?YHUVVJ05ustbCURmBCt32sv3q3lyRhihPC1sCoPiFSUWarb8CdEs5DqjVhCg?=
 =?us-ascii?Q?383KLqoViJ4ww0M7SjW57YJlBSu4/94Sbn47HkQkcxTSoCyjCBcfJ6aOpKkQ?=
 =?us-ascii?Q?ZGWgeNeNHXzfWxFJBoeFdQJQ9tCvEhUqQZrpGY3dFN7wyWZYzYLwQABOJc+8?=
 =?us-ascii?Q?Yk7LJ3yH96jSTuszNk2Xg/sW11yNacezljpbPiPzUaV+KOXoAapzOuFImZX7?=
 =?us-ascii?Q?/ue5MskUj411iFAG7shM9beZNOe5Eq1uMoMPkljQZ5QrT5S4JSDryomMqJHH?=
 =?us-ascii?Q?quSsYBDIboWHCd1mmb0jVKK6xvi/Xcjzsi1Cr6ITHB0Py/B1Vl/CpukjI2d8?=
 =?us-ascii?Q?mHkt6oN8UwG5keecuuPqe66iYc3d3annD3ZDEyTgACTumi2YQ2k66/GU8YNj?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f25268-d86a-4850-389a-08dcc5f0fb9a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:03:18.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wBKfCWI5pIesS4zUMKFb7hNLtgtOWkcviL8cN0oApm8Fi0xberd7uO6fvoY5abKcp1f8LKcHSY05g8VHQiYRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
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

On Mon, Aug 26, 2024 at 04:40:00PM +0200, Andrzej Hajda wrote:
> Debugger needs to read/write program's vmas including userptr_vma.
> 
> v2.5: use access_process_vm
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
> Hi Matthew,
> 
> With recent changes in drm(?) v1 and v2 versions do not work anymore.
> I am wondering if using access_process_vm could be alternative approach,
> at least igt tests do not fail :)
> 

Yes but s/xe_uvma_access/xe_vm_userptr_access

Matt

> Regards
> Andrzej
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c      | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 7e62b0ffca83..39b33bb7893d 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3392,7 +3392,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>  	if (bo)
>  		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
>  
> -	return -EOPNOTSUPP;
> +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
>  }
>  
>  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ec4dd2c611d3..ee6e2ee078f9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3607,3 +3607,15 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write)
> +{
> +	struct mm_struct *mm = uvma->userptr.notifier.mm;
> +	unsigned long addr = uvma->vma.gpuva.gem.offset;
> +
> +	if (!mm || !mm->owner)
> +		return -EINVAL;
> +
> +	return access_process_vm(mm->owner, addr, buf, len, write ? FOLL_WRITE : 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..99b9a9b011de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write);
> -- 
> 2.34.1
> 
