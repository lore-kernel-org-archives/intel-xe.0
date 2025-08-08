Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F03C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 21:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDFF10E067;
	Fri,  8 Aug 2025 21:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4hhT7gR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4614710E067
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754690159; x=1786226159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7r79rDLVCqt+odlGQnLRVEFtIt35yKqwWWAFX43qtS8=;
 b=l4hhT7gR2j7/P3qNpMhUOYsKtipZ/rgsK1ARtllvcdus6mDUO9h8JxJL
 6Fx/jd9obRRBAQjt0Gdy00Bmtf269siyJBFPPHV1Z/rQSWWhN0/QOk0f9
 3ds3tnw4WakQIvirOIiu0W3M/xKXv9LjsesIwKjG8DIZTLHISV28aViL3
 +BezP364qtH+mRFHES7V/5g8cWNyDZWXW0Cy7fTOScTkbXsiXpgwjpqxG
 yG7Lad3Sz/BziZYEVXP7opoLcSWhl4r87jj0r+74Z3NfzwANrUf0zNLX6
 aTump48D/WEVtVVxwNaZ82WfqbDAyUE1O5b8EWaqAWrXdj4H3jiiDlY7w g==;
X-CSE-ConnectionGUID: tz8PF861TMu1VTaS3ur7SA==
X-CSE-MsgGUID: aX9EuD8uQquuBzKYIqxcWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="74625153"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="74625153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 14:55:58 -0700
X-CSE-ConnectionGUID: Fk0lVt5GSo++rz6SnGXlog==
X-CSE-MsgGUID: IyN0u2tOQCGrQNxApUCAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196244611"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 14:55:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 14:55:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 14:55:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 14:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyD++6NrYR2lfWP1juEV8QovvuJ74V1D8GVKH5+ZDEDLS92SbX7mcWJ63+J720bUuhdqKC4JiQ4j9TRCuaUdNFmwwVU+Jb9Zj3idUfnhosyrS1CW35EHzr/u4i//xEfFS8gkDEWTlP5ZzJgXt2AAe9iewyl0/LIR0InSGjYf6wEVv+9sfcRQm786yD4J6IhD4XkImdYt9bSzkoMVno7mIWGWKaWGCCPfL6QX6ma0Rx91rJSZ56WfJbn1LgJNifMnKQkgd7zzMdM4ksqqs2qfaWkSTrNrQD3GlWodL5jPn3kswYOsfYfq7NPBn5XPKsufsVr3dToZ7TezmzY0L5Y9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38ucURlwQCykeUzt0oloF1jZsElp3Ok0pB1EB1FbwuY=;
 b=ZevHeSBQBDvpqLjTcgv98swl2r9qQUDr2M2jnNIwIWDAwGiYZAT8sr5qaBKZWGVKeT5PmM8fjDiYhpvekmHyTomkvLOgJUH26aqNXQCaszCsg89WZIhrRXyfiZUdwurJRKU9SAkhXRnqOU5bUwA5PNq7korIom3evMpxODRDQkdMpHxE6k1rNuUCihUcoUuSgsChnfAMKToV8ptLDPtvexR4MPVUcIg9JYEGZYmD81T5Z85yme4iEXtjOdgSwKvStsUeRHRby5EdrCCIXlHtx3uWKy/987NV1TGt99tfzmSVgAt3G8n0nZGwz4b8gqXIQDy20R2htYp4sbTQnE/Gxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW3PR11MB4700.namprd11.prod.outlook.com (2603:10b6:303:2d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 21:55:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 21:55:54 +0000
Date: Fri, 8 Aug 2025 14:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jeffbai@aosc.io>, Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang
 <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>, Shang Yatsen
 <429839446@qq.com>
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel
 page sizes
Message-ID: <aJZyZpk+UBQxJwea@lstrano-desk.jf.intel.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de>
 <aId7hYAfMxlBTV8x@intel.com>
 <a1488184-da2a-4f6a-b955-9c6db9e0cca6@hogyros.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a1488184-da2a-4f6a-b955-9c6db9e0cca6@hogyros.de>
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW3PR11MB4700:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb045d9-4dcd-4985-503b-08ddd6c6590c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E92lawg2C1dhUmktyXRNDK/Qr5ogEgcJVB3IVG0LXvaDh6DGEQ9KOfanWNGI?=
 =?us-ascii?Q?lEmenF9h+Lsp0V5Tyw3yuVStKnQ/rfbxbzoasQf3sBuk6riIv0xGZIlXDGnp?=
 =?us-ascii?Q?zvuv3r3b4SarfTEizan+SOnXTS3ao+MOtJFYFXqCHABn0jufwtHaHFyNPc/9?=
 =?us-ascii?Q?Xnh7TUcRZ3SMeNfMAyqY2nARyQ6mOD7bVBK2hnUOoz3jRUIRevOcd+jYgjWE?=
 =?us-ascii?Q?w9+WvBAIae95v6gG9dNvs7llPlgJy+OqQ5aUk8VisSdOwtWDObIz+qB/ns2a?=
 =?us-ascii?Q?31LwZjUSZv2WKhA+hbqbcPls5H1atxgB7VZ2xwilaEogASv35611mvzbnOGB?=
 =?us-ascii?Q?dHTVSLGDUfTGrl+FvpCmgm2lt9rS39Vf0Qa2WR5dxbPgG8Se34c63XoV17qo?=
 =?us-ascii?Q?1l9rdy5ZOXrJRy7szsi7tV/StriCqTG2/eGKJijiQSwQhenn36qXvqUo60fF?=
 =?us-ascii?Q?nwQ8MExr7VlZctNlyodVw6BVBBoAwc2pZ3Z/T3psb4ARzgwri9G7wmJIMVCg?=
 =?us-ascii?Q?IYCg6IVhU1XVG3f1u+VDFA8nIv7Xc1PwSfqsrkmbW10v5jrmc22lId47lgIy?=
 =?us-ascii?Q?4Ns6L5SC8SGcO5O5tsxVupsav07XREdO5hjZEY2bcNzWooSk9n1IO/kVOP2B?=
 =?us-ascii?Q?S/q64SXBKGt4EqPJINaPWn6SQ1QTvZ52K/V7uY9x2tGQfmyvvDgt9oosZNmF?=
 =?us-ascii?Q?kGebADORxn+SN29z7BTqiUhXzltwALBH8J1jde+N89Gnejq5UvDlAc2exDfv?=
 =?us-ascii?Q?YpAc91AZxfg2FYJDoAKibmuJ273e3eHy6FQPDl2axRoFzO/IWt5X4Y0UIpzH?=
 =?us-ascii?Q?Dnz1s3ArP6WaR/DaDMpwQAdcp4mi44NXjyVSIQWvldAwWTdnXucNioV1IPGH?=
 =?us-ascii?Q?d5ueblbLiwoP4XxpLmL4vjcpqKi2labIpkV6zM2KBij43Yw9Y79kDETtXjtQ?=
 =?us-ascii?Q?XuBvGgySWthAWd+1o7S9hkT5dlqQvD6HGeb/54Ru5KnugpSoj9X8gcMa8+Xp?=
 =?us-ascii?Q?/LRa7U72QRFAAfc5a0ERi4S5UqmVBb7TK0wWIyMdg5jQUwQJzm/P38Xfw4WS?=
 =?us-ascii?Q?+hqA/clSxy3j9awqqGiqPcqSSXh4RspCU06L4rZ65fVd9izamL+0mnT0XCR4?=
 =?us-ascii?Q?YV+6DcTTrHgyHD968ADRUsoo1MXMh1ejqjRng2uw4QM0eUBhrb1nocqfg/Ox?=
 =?us-ascii?Q?9UaCQ7+aMklyVY7p3snls6pap1F5oYf7R1y+nmsnZah9Tac6bBpl4xd0W4VR?=
 =?us-ascii?Q?lNAZ8QQ5lq9rhwl5PqvTPhByH+0s/+Hbh7lnh04UOQUrm3+jN5EzdXCNmUJK?=
 =?us-ascii?Q?/Jzvn2icd9l10QRgqGVAxmH/cxe2VQj3K97M7JzxToAOS+YCpTr+4pfFHmY8?=
 =?us-ascii?Q?vhO4HYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?67RHncXfDPN4zgutYJO75RzBuj9/3/IsUWw3ofeDTnxKLN9zEOWJkvpzzyyb?=
 =?us-ascii?Q?dusPo/Tq5Pi3rNwR2FHZwdSQjOHONy/eWG6CZOfL0aarbToAf//YGCt0WVez?=
 =?us-ascii?Q?jV40TviUDsuKulJlpQ1hUlx3q/Ww8OamaGZz8bGRPjgAb7NPmmS+VP7BihhF?=
 =?us-ascii?Q?ahsNyP8ojrO0hxpizzef6CqKO2JCEyFV+gpGOghdiN+zlPL6fQE0HtILfdNz?=
 =?us-ascii?Q?F24OClpjeA7QII9qUdyF/IgUGxkOMLFAES40U+Fr1pySv9NCFFJFcunF1zxc?=
 =?us-ascii?Q?cp53cbFDT6PcZG5peypuOiblDUThwDAiM8XOENX1/tUyMkeNuFExiw3kshXe?=
 =?us-ascii?Q?9H03cS0QURw54wjKSnfvXhopE2kUhxlNUMIsUgNvVFl8FD7IaGJN5K/dNEiX?=
 =?us-ascii?Q?OvvswcMeXWE/ruwUfWDzMfJsj+f4p/LCjp7H4lvMn73NqPT8ZNKC1SfWZpT4?=
 =?us-ascii?Q?y2eK371ZUtr7U8NjZublcoK9fz9S7FitbFXYN5qrcCjKG6TiKDZNPulElIP8?=
 =?us-ascii?Q?oR0viLSzXqJd3G3cmWpU3d95+fBgaIcravk0avrl87dXhbq5OyfzX1wKzt3d?=
 =?us-ascii?Q?XvThTsilPRkbgTNQt6HokBYyBl2sao9AIAuEHzAyUYwZs1RkJVpcxOD6Ec5T?=
 =?us-ascii?Q?D8jftbPgvcHV5j0jDY3k9o6HcDT7I2JDH8aXGYUKdIAklZJnffVowT0U3JuJ?=
 =?us-ascii?Q?DK3QlHLqgjJSvtq40NJpP4sEXTb1VHajkecHf9RX5fz7VhDgI8M68oP24MM+?=
 =?us-ascii?Q?eeW8r891zoCHQLpbWCZNHrdhj9Ow1OpTjxh3RL0tRBrArPjbln+fjbQCPQ+p?=
 =?us-ascii?Q?qAIMmTJPFfFxRLj1NlfvQ49lljLvFNBnmEvRuvFWreH85rObX2isNOHKdUXN?=
 =?us-ascii?Q?dBnMERdMrwoaffYIxTh5wJmsLvcF4bU59CB4H0rDWhgP+i5S6GR0Q1rqthax?=
 =?us-ascii?Q?LtmHrap5ywgLH8vIhBB1uOKrBQ/a2nTklp288Scpxef+DJ9dLPBdxXz/xtJs?=
 =?us-ascii?Q?38BtU2q9E5fPDQTXS7N2SEuc7rHm150hqAa3yA0i0oeGmH3SGjh7qKdC7jiN?=
 =?us-ascii?Q?0gpv+3YV1VBgESU5cnJ4w/OrKe/TWkpXTwFvTODU2zFn18XBpunt/+Y5PEAS?=
 =?us-ascii?Q?wh804bUZ9EC8nWdkLluIF2pJof87P/z644ZvJ3XWxCVvJfyjjPG5PGzM39zu?=
 =?us-ascii?Q?jTYkfLGMw9xsztAqP94svvPdI6fvmcEd0pALkB0ho+xB8yncYwidEtGno3kQ?=
 =?us-ascii?Q?Of9BXGFV7dczKPe5YaKugmnSlYNAhH3biRztkmc4F1xg/cEieuR5a5R6V6a2?=
 =?us-ascii?Q?qXuZgz2cAw9S8xTk/lYtLTgAO7bTR9DgonZTguX1ZtgPm/MIlQb70BAHJrR1?=
 =?us-ascii?Q?IyEz5K7r4hZkLEqaCblrbZYPrHgzc8rOZ4+6bsZpAU9ijt3Mxu/JrB1QTKM9?=
 =?us-ascii?Q?beytQw/F0pGeIAJreIRmYcVw2kPs2QZ5kCeKnyUlkbVBoJkGVI3WyoECNlkt?=
 =?us-ascii?Q?VSy3LG7DDX74DU++ZswI4Xc5blxRx8MIoRjYzw5jouGAcZNrc07EsgPDja1R?=
 =?us-ascii?Q?V7IdaaXuMMZ66eS6o5ptY0dASambV6af9JoEM+QGpVLnipTY4rJZK4Yy7QUD?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb045d9-4dcd-4985-503b-08ddd6c6590c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 21:55:54.4246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCvs3qXjc/SIrgO89DJBZe+hPfmKp4K4n2ceZcl7aVx91tg+LIPjRlXp+Njooc02Wai1gCG6FxRNHPV/bHMpaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4700
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

On Sat, Aug 09, 2025 at 06:11:58AM +0900, Simon Richter wrote:
> Hi,
> 
> On 7/28/25 22:30, Rodrigo Vivi wrote:
> 
> > > -	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> > > +	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);
> 
> > but this is strange.
> > think that we could get rid of the aligned_size variable and only go with
> > size = ALIGN(size, PAGE_SIZE)
> 
> I'm going through this code, and it is more horrible than anticipated.
> 
> The problematic path that makes smaller allocations comes from xe_pt_create,
> where a 4k BO is created for a page table. This needs to be CPU visible as
> well, so in theory it needs to be 16/64/256k aligned, depending on

Ah, no.

Yes, PT BOs need to be CPU-visible for the KMD. However, PT BOs are in
VRAM, and the VRAM mapping is a large one set up at driver load (i.e.,
the VRAM BAR is mapped, and individual VRAM mappings are just offsets
within that mapping).

There are, however, other issues. We discussed this previously here [1].
It seems doable but more complicated than I originally thought. Feel
free to take a pass at it.

[1] https://patchwork.freedesktop.org/patch/639626/?series=145445&rev=2

> PAGE_SIZE. Extending it is wasteful, but that's what we do here.
> 
> Using the original size makes the mappings fail, because later it wants to
> map SZ_4K >> PAGE_SHIFT (== 0) pages.
> 
> I wonder if there should be a way to merge smaller allocations, maybe even
> special-case page table BOs here (userspace merges smaller allocations
> itself, so it should never request less than PAGE_SIZE).
> 

Like implemented a sub-allocator for BOs in the KMD? That seems unlikely
to be accepted.

Matt

> I've talked[1] to the Mesa people, and because they have their own
> allocator, it should be okay to define the DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT
> parameter as "minimum alignment that is okay for any userspace BO type" (as
> opposed to "minimum alignment for VRAM BOs", which would require Mesa to
> also align to sysconf(_SC_PAGESIZE) for CPU visible BOs).
> 
> For some reason, everyone tries to avoid setting flags to clarify what they
> want. Mesa does not set the flag for "this BO needs to be CPU visible" if
> there is no VRAM that doesn't fit in the aperture, so the kernel can't
> enforce alignment if the CPU has stricter requirements than the GPU. The
> kernel would ignore the flag anyway, but that's not the point.
> 
>    Simon
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/13658



