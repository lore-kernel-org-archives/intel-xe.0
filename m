Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD4DFD8FD8
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C026F10E081;
	Thu, 26 Feb 2026 16:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzWPHxIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8C10E081
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772124941; x=1803660941;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kv6oRfo1+6r4glvC49UcCMR5DiIw099zJHUOoUBsEGQ=;
 b=lzWPHxIY7AveEEvNSPKPlEjZII5//4rWSms2yonkB4wX5pObYLsLpIiS
 XybCgug6pFOO3IvpeFyydhKyyoIWizES/lYqFdugaaKoLoIYpFogl25mh
 QGBqNi/IuY3iQfGB5cK6iPzSEI7HK17bJ45FLruCie4lCcYxOKLn6y25u
 39trtQA3z2iEoeR7YgAp+/jL/2w0UDU9tRyr5A0pURgalQBR+2oqlPwgt
 fvLXioyDMX+cxmIjM1SJT4T89m32PK7frpU8bp/uv+//OPvuHQyEWwfzX
 doKHVafZSbw5wEbUTClf5PxS/QAhx9cFv310EXMEgX//apwYYm1cZPdmr A==;
X-CSE-ConnectionGUID: ncrMa05JQNyARR/5z96pow==
X-CSE-MsgGUID: x92amunpQAyGqw80WqGn/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73101670"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73101670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:55:41 -0800
X-CSE-ConnectionGUID: VuR1qUvzSCWVzaELES06Kw==
X-CSE-MsgGUID: mja1ZGEzReqUVcxR2pB++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221140079"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:55:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 08:55:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 08:55:40 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 08:55:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwazqBQFkgEZOYz6azzzcDA0Hmad+GSeEi5o0ssP0fRbHpR2fBiisK0XSUMKMi0JSY79z1Y3b8tN2X9mMdjnNLXRf74CaF27eaXbg9+aAulPzMT3l84xHqcjGttuvGNAaWo2eBjn+kPr4KpucvqIPm1uiPtxh1ZF7+5LGFVDVgm5JIc1mN6TMWCbpExC/BgXraxd+Sz1+5NOsOsIbHo1nrkuDgMaNfPIutvmL4VhE6yafxBBy6nWayCEOozFww0H9cgmHtHzXOpxsxKRUm+HqIDPwV2UlPYkwkMKKM9LBeUe56/dQVtlS9cJ5kZdYjyVqO0zq7Ld272Y9L+TuIV+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSGdBd2YGhuO4Mr9nAyOLkmz9b1IcJi1fvGqK9GZtfM=;
 b=djexZ7wi9PNmls0ZAdUKWTW3aLkiYCWlPRCLi6O/1XGIKXnyAG+9nQT6KRzpPnD0ygXdPKzW78LnuZK64CPTjFlQAvFr2hiC+1Sm6wpnIB1mdWuv0Q46TMzhxMMYVxWGFf3UmyHK1vkO8BEfe/8kUE4vMJ5Oywl7/6uEs0+cpe2ye4HP805kolYTIeIP38hMdynU+3XVdH4Y2bT9xYRyYta3RiwZXhYGkfFjh4Rvt7m/xFAXctxvcla6rU3sdzXiuXk08rsUdqmIzI+viRAy3ymuMjBX9WlFgeoe5B7dC6GKjswIGmy4eL77iRsz3/wS8WXUqG4Q11gWutLM13/S3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 16:55:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:55:34 +0000
Date: Thu, 26 Feb 2026 08:55:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
Message-ID: <aaB7ArTqURiJoGaB@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-4-matthew.brost@intel.com>
 <bf67f6971cacc71313cc92de8b0e99212106344c.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf67f6971cacc71313cc92de8b0e99212106344c.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: 5530a086-9774-4b56-eec8-08de7557db48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: b2Z+Tl49btkquKPLm+VpgPW6h5y0CiXD78oxLD2dhxz5EoQtGzOQUuzk/TlAnJ3BZ08jPvXX3Y3V3Oc5qsHrVScBvTnvUf+UHXNTHAm1tPpzODduDv1Uz/SenG02LZesY96ie9b9SA8d0ALfcvXqBDRM7QhHsPNo7LM8GkCgHIRfxrEM8oQ4BrWCHP4TRr9wsSPTtCdK0a4qFzOQF+GyEWXwVR0vkYZF0Lv02xtuRS3FKDWL6pnmesUkiSRyVzfTecXGAhYluvY/NIuYhAbSQOsWgd7Hh3hCOTY3xp2Iq5vW18Z8Xaax37v+4O5jDdKDQYFK2BQK+WeTc4cAoGDEqoaSroFgHMJj2StiA4QBSY8zcxPlxu8kLqXbXDOSHr6ug90KcX3KGRMJ7hpPBVBpTGMIIRqAraLyhow42IQpMTQiQ4JfrJ7H96H7b9hKc+RF1878+Yx2PmFJoeZEnHfy87lz6ji2c+sDrwQU7OIAEzRFimL3cvhaIOW4crNuHRC4tzHz7YIxSLlkxT1IjBYYuorEUo97jp6+KkmMtZQvTZjzY7HQYR85fGotUkJSIP6xA1ChhARwJJhXcv3zWy6Js11VD01giOx+IIK/pRulIxLalBNAlZuckGuzJReRYnI1K8Lf9pn07FuM+c6dYwwoc8Tl6AEv+rCuaFoftAKLdPtculVuvYST4+HUPCnPPd06FDxv/0EIRi7Heq+Bx1mBHHK4zo+y+NQJBdb4gWDbbXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d0wlTbYaXTLu9jMPBjdWu+Iho+3D1LDKKvXpUbmM0hRHmh0R6f2i1okYex?=
 =?iso-8859-1?Q?bYdBUBzPUzvio6b+KbAMT9ROUH09cB3eASNZIYEDxrW9fiVlpsZDlgguAs?=
 =?iso-8859-1?Q?vdQ1SkEy1+sM6uOsWZCYI3KufRJnb6VdJFTUuIJSIsnxo3lnrNnZNBuVgO?=
 =?iso-8859-1?Q?vr1ERNdE7BXjDtMCFoNEQXgNPG2p6ycAwx8tHRAq7rKOuqWqXKnKlQFaIA?=
 =?iso-8859-1?Q?Cb7vcD9Z/wAMs8uyVPBton11hBEznSKOBrN7s/xPLz6ug457GS47rIdZ8A?=
 =?iso-8859-1?Q?bXmkrV1c+HLJGs/3YP4miCYcovZfUGiNQbMgbd/foXgFKumd/EBzmgKfu8?=
 =?iso-8859-1?Q?BKbfwQ2hU8aHftTrULQVlPtO4Vp2g+TbDJI4fI9cjOazGXXOrTe67ckPAY?=
 =?iso-8859-1?Q?8y4xV5icm4rXxRViShYxFNb5oPOYUeKZQizBs38vOhpOCxC0bb0haE0WJ1?=
 =?iso-8859-1?Q?v+E+KQM4WJxrZR0lAsBfcFmI2CaSxLa6mMFWTpRJu++VxDedtH2MWuGCfn?=
 =?iso-8859-1?Q?3IgERj5vYrtsRkSARxT9zDws8xSKzM+K71uMAkFMu0aFfOsIQLEOzAAQMo?=
 =?iso-8859-1?Q?XuWkpOdQgobr7KMVp/rZ6mRH7ew0jAc1RK5usCc5UeiUFMA24qycQU8AG3?=
 =?iso-8859-1?Q?lZmWax27Thi4+hxknQJZl2Wprb+T3gLRqRbXBdG4Wq+wn0x2+k+O+eI/Jl?=
 =?iso-8859-1?Q?2162pucrexJt4/KRCIyiHYWksSkz5rgymFFxhmolzPeQgnSp9o2u+5UrSs?=
 =?iso-8859-1?Q?UbMD0lRzYwiMOn3t9NciQXMBB0oiQAtdtbE82/8Hq1aJwMuuOlA+UV9RV4?=
 =?iso-8859-1?Q?I1g2qUsjZPLSd/mWPJFiW/1zzwn0cUKYfeWCb+pQEURFFtL/L81Csh1XV9?=
 =?iso-8859-1?Q?0Vel3ZbGUkxqBfxsiQZQdFydd2XlU8sQsA0ouetCnK4Am0gbl5fBRoA0/U?=
 =?iso-8859-1?Q?PkvbeTO/OJdvzyZjuUISqzbjulOBig+altw0SKM6Dl6tSv15W0u9kNubmq?=
 =?iso-8859-1?Q?ia2I8jraqw/1LyF7h4BXNGh9+EYh+ISMGbL/PqOQ1mwgbcxUz/xb+aiH4n?=
 =?iso-8859-1?Q?fFREtdSrth7KPZZ7hck8RIIx/dXBzSW0qOhJGATkN09uQkofpZMoojyu7w?=
 =?iso-8859-1?Q?DLUspjs9smUL4UIuf/KvljWI+I4gJyDPxjVYR8tqRlsUM7bZeKjcCYJOKD?=
 =?iso-8859-1?Q?AiVh1LQoO9Bl9/CEY6Z4GdFlITB1P5Ym9G3iSmjCus7xcl459yxJZjhfcX?=
 =?iso-8859-1?Q?imcenO/9UcU7igDL+PbpFgZ0/rP0EA5XoxUaYwlTkZPu+rm3MkScCiuGd2?=
 =?iso-8859-1?Q?fsOyit0IWg3LliuNgkLqrF/3mFMKQb07iiyu5CIpzYHutWWy/h9gu1pKMa?=
 =?iso-8859-1?Q?NmbnJKqRhK3X5oIgpAyUl83gsBEeb7QLzdrEWIbcDpJGI9LwvoS8znSg5T?=
 =?iso-8859-1?Q?uINqRjZE59CYzzc6pDcu+Fr37t9irf2aSRvo97qq/1CfKJzbuyD4SwQ1NT?=
 =?iso-8859-1?Q?YtUQ0yBd/i92B4BNM+J/jcjKeHwskklWB6lE70WC/ZCuaRw69XlQxHm2+W?=
 =?iso-8859-1?Q?/k7bTpx4y0m1FTpfpLPK/oCFng1fsIdq4yKkk0VCfAxGd8gxJXglE2nD6d?=
 =?iso-8859-1?Q?oFztGORnynOPJiTc/pFmtNf3HJfC3e5U8vw5CvcNkJMw/eMXusNUfIzeZ2?=
 =?iso-8859-1?Q?c6dyI7kEs+mMx2d+QPzxPpFadM2ceoInd9rzJ9yVVNLbgTiJURWXSAbmkN?=
 =?iso-8859-1?Q?5M+Zpnp3nc7G9EclcPr4ALcF4IXfiYTvDkdxOuV4M6Vv/KviaUcdd3WUHu?=
 =?iso-8859-1?Q?Aj206woTKvBvc8yqOCaYiYhr5FLh2jA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5530a086-9774-4b56-eec8-08de7557db48
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:55:33.8475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRCHmYRyZiCofEU7bkb9tY18peGawk3VbcSE4HfoyG0L1QtW0xy0IZeztg7sO608MJHp42w7f8Q5735wqJ7/ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
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

On Thu, Feb 26, 2026 at 01:43:43PM +0100, Thomas Hellström wrote:
> On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > The LRC seqno is read by the CPU in the fence signaling path. On dGPU
> > that read can turn into a PCIe transaction when the seqno lives in
> > the
> > main LRC BO, making the hot-path poll/peek much more expensive.
> > 
> > Allocate a small dedicated seqno BO in system memory and map the
> > seqno
> > and start_seqno fields from there instead. The GPU still updates the
> > values, but CPU reads stay in cached system memory and avoid PCIe
> > read
> > latency.
> > 
> > Update the LRC map/address helpers to accept a BO expression and use
> > the
> > new lrc->seqno_bo for seqno mappings. Unpin/unmap seqno_bo during
> > teardown.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c       | 57 +++++++++++++++++++----------
> > --
> >  drivers/gpu/drm/xe/xe_lrc_types.h |  6 ++++
> >  2 files changed, 42 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > b/drivers/gpu/drm/xe/xe_lrc.c
> > index 38f648b98868..d72146313424 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -715,12 +715,13 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> >  #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
> >  #define __xe_lrc_regs_offset xe_lrc_regs_offset
> >  
> > -#define LRC_SEQNO_PPHWSP_OFFSET 512
> > -#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > -#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET
> > + 8)
> > +#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
> >  #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
> >  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> >  
> > +#define LRC_SEQNO_OFFSET 0
> > +#define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> > +
> >  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> >  {
> >  	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> > @@ -747,14 +748,12 @@ size_t xe_lrc_skip_size(struct xe_device *xe)
> >  
> >  static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> >  {
> > -	/* The seqno is stored in the driver-defined portion of
> > PPHWSP */
> > -	return xe_lrc_pphwsp_offset(lrc) + LRC_SEQNO_PPHWSP_OFFSET;
> > +	return LRC_SEQNO_OFFSET;
> >  }
> >  
> >  static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
> >  {
> > -	/* The start seqno is stored in the driver-defined portion
> > of PPHWSP */
> > -	return xe_lrc_pphwsp_offset(lrc) +
> > LRC_START_SEQNO_PPHWSP_OFFSET;
> > +	return LRC_START_SEQNO_OFFSET;
> >  }
> >  
> >  static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> > @@ -805,10 +804,11 @@ static inline u32 __xe_lrc_wa_bb_offset(struct
> > xe_lrc *lrc)
> >  	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
> >  }
> >  
> > -#define DECL_MAP_ADDR_HELPERS(elem) \
> > +#define DECL_MAP_ADDR_HELPERS(elem, bo_expr) \
> >  static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc
> > *lrc) \
> >  { \
> > -	struct iosys_map map = lrc->bo->vmap; \
> > +	struct xe_bo *bo = (bo_expr); \
> > +	struct iosys_map map = bo->vmap; \
> >  \
> >  	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
> >  	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
> > @@ -816,20 +816,22 @@ static inline struct iosys_map
> > __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
> >  } \
> >  static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct
> > xe_lrc *lrc) \
> >  { \
> > -	return xe_bo_ggtt_addr(lrc->bo) +
> > __xe_lrc_##elem##_offset(lrc); \
> > +	struct xe_bo *bo = (bo_expr); \
> > +\
> > +	return xe_bo_ggtt_addr(bo) + __xe_lrc_##elem##_offset(lrc);
> > \
> >  } \
> >  
> > -DECL_MAP_ADDR_HELPERS(ring)
> > -DECL_MAP_ADDR_HELPERS(pphwsp)
> > -DECL_MAP_ADDR_HELPERS(seqno)
> > -DECL_MAP_ADDR_HELPERS(regs)
> > -DECL_MAP_ADDR_HELPERS(start_seqno)
> > -DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > -DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > -DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> > -DECL_MAP_ADDR_HELPERS(parallel)
> > -DECL_MAP_ADDR_HELPERS(indirect_ring)
> > -DECL_MAP_ADDR_HELPERS(engine_id)
> > +DECL_MAP_ADDR_HELPERS(ring, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(pphwsp, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(seqno, lrc->seqno_bo)
> > +DECL_MAP_ADDR_HELPERS(regs, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(start_seqno, lrc->seqno_bo)
> > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
> >  
> >  #undef DECL_MAP_ADDR_HELPERS
> >  
> > @@ -1036,6 +1038,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> >  {
> >  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> >  	xe_bo_unpin_map_no_vm(lrc->bo);
> > +	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
> >  }
> >  
> >  /*
> > @@ -1445,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe,
> >  	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_bo *seqno_bo;
> >  	struct iosys_map map;
> >  	u32 arb_enable;
> >  	u32 bo_flags;
> > @@ -1479,6 +1483,17 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe,
> >  	if (IS_ERR(lrc->bo))
> >  		return PTR_ERR(lrc->bo);
> >  
> > +	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> > +					     ttm_bo_type_kernel,
> > +					     XE_BO_FLAG_GGTT |
> > +					    
> > XE_BO_FLAG_GGTT_INVALIDATE |
> > +					     XE_BO_FLAG_SYSTEM,
> > false);
> > +	if (IS_ERR(seqno_bo)) {
> > +		err = PTR_ERR(lrc->bo);
> 
> Claude found the above. Should be PTR_ERR(seqno_bo).
> 

Nice. I should take the time to set this up locally to save everyone
time.

Will fix.

Matt

> /Thomas
> 
> 
> > +		goto err_lrc_finish;
> > +	}
> > +	lrc->seqno_bo = seqno_bo;
> > +
> >  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> >  			     hwe->fence_irq, hwe->name);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> > b/drivers/gpu/drm/xe/xe_lrc_types.h
> > index a4373d280c39..5a718f759ed6 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > @@ -22,6 +22,12 @@ struct xe_lrc {
> >  	 */
> >  	struct xe_bo *bo;
> >  
> > +	/**
> > +	 * @seqno_bo: Buffer object (memory) for seqno numbers.
> > Always in system
> > +	 * memory as this a CPU read, GPU write path object.
> > +	 */
> > +	struct xe_bo *seqno_bo;
> > +
> >  	/** @size: size of the lrc and optional indirect ring state
> > */
> >  	u32 size;
> >  
