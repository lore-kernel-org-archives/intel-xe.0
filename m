Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C68C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025DA10E745;
	Wed, 15 Jan 2025 15:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTXDX3u/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8B910E745
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736956585; x=1768492585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Tdk0UBkUVv8hVkLIBpzlZqY9Etr+C9Hj1RBjYnx0+M=;
 b=fTXDX3u/C71TkDD2Q38YNQ/G7GYY9scU/2i9ia0Hw2fqYlVjva8rMuHv
 IKC0nofenAuTR/PiTxGFjYsnxrYME7NAIXbk5uQwXht9nXxoydOfTBlvm
 yFoAqIEOuA8Ur5RTm5HQm+j8ze2EHDBGamTRxxZXbJrWzmeJp/xTe6Aiy
 TMPcb7mO9ZRCy/4lhI3rIqkHRRQDTwN3THIJcF9nYZWdU8pa+/kDDNRxQ
 3wAIoAGoLwH+UU2Wl7h8FS3efOhRmoOI/XLgtXTms4EIBn/3v40yB2Q/Y
 gc4ourhAAQTpx3IgmTyAZX9hlkOnq1Aojsg3wTHMMKarKdWiVmhchsFml A==;
X-CSE-ConnectionGUID: JoXcoDclRs+VMhcvEE2mZA==
X-CSE-MsgGUID: BrhOxkiqSH2rkmCR1kDbFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37327059"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37327059"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:56:24 -0800
X-CSE-ConnectionGUID: tQ/uScGhREm4NG3hczib6g==
X-CSE-MsgGUID: H4s7AyO/TV2TTO8pccZ0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105707800"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 07:56:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 07:56:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 07:56:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 07:56:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv97KdVqG1qfEsupib4Ii6l1MHV3ptgIOlZQGcSo4ZQkwaD5DxGuvT5nOgJPtnrcnpKhpfEIZlO+VJJhRpXL+C1UrmCesLTwClJVn2n9/KMToEAMjJelIZi4eRRJGhLkO3It/QpMEEH1zSG0BN/lNm2BwpdqKG/tb6YFCdPR4gGz5RmaqsbqqKxRHdJw2euVEF4/Ke+VV6z9opP21ordmxcZov7qjyu4dCBoUgvpS7xAuMDZPxnzQVgQrZMH0MIoQ6ImkIJHjRSUbEZxUVRrBuYKS5UbZAzp0HqGICOXRYyd0GB6EqlB43vEvcvUlb8vW/LfdejLYiYqQXHpzJXRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGn+h+R3zawHN5oqwMn2u1DEdudTCxplbKEY1INlfr8=;
 b=kVJzGoEIippcv0IOFhuDFg6R7tH82fg6QBALKBoAw0GFgPWWo/pk3bIqPoZnHODZorjcwe0ec24ioYglJor1S1HXPS0AmKn5bGv4t3u1axfI26pJLc2oRyvilTxAvwkKkiEq1DvJZyCEyZ8ZMvGzADHDUROxfUeLcq2shy/EEFf27o8Gd064rQSoPMhe7shTpf+piz8HI6E28Mzq8/WnnVXHUYPMupleWFwMtZtkX1tuLXgxLDvrs2LjeqsU9qvb1BOoZLUIbWySRIJJrDwWiW85sEYjIOxf5f45caM6BsCCuPHfuruK6aZ5nqjHfl/TisuBZqmY/mefqBm5sCkiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 15:56:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 15:56:20 +0000
Date: Wed, 15 Jan 2025 07:56:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3: Generate and store the L3 bank mask
Message-ID: <20250115155617.GE5109@mdroper-desk1.amr.corp.intel.com>
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
 <20250114212954.GC5109@mdroper-desk1.amr.corp.intel.com>
 <Z4ea8HrkPavnQBut@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z4ea8HrkPavnQBut@fdugast-desk>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 7287eb81-268e-4e36-14c1-08dd357d2714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cAHzb4G+3p4vExZSDPHDZelGwWomEx2T+92xbfzK9QX/0FEbOZY2sihblLlS?=
 =?us-ascii?Q?pZvGs/RB+2zPICZ7YChCRu4wNjLy8TLDqbPplxx7GV6Zsz/qByetehKuuXdi?=
 =?us-ascii?Q?xblzIcD4fh9CzkkzPQbbcC+2QyNk6xZ1hMoc+hY2atAu+eAZacV2xkfIojF2?=
 =?us-ascii?Q?cXlWOldqvPnTAytmb9aL1MjnLwkEPOxOIrCYUKYLgP1ZLuhKkksszGE/4Pk3?=
 =?us-ascii?Q?MLL6pn3pgkv1oVaif1+Ox3EBTRAIC9Vo7I+WjaQPM4UPx0Mc/XnAQg92pUFT?=
 =?us-ascii?Q?sWOiuPzMcYEJ/Ky5naECewL9dm0Pm4LUGe+y6HECAnss6r/V97VV+x+fIKVU?=
 =?us-ascii?Q?L/bwm18O1i9zmYLZsy1ihtMX06ti3tSmWktHQPs942Tot9ldm+CTcTKEA0dP?=
 =?us-ascii?Q?VXYSM5RY164jV+O+mnou1C9QE25GySu6OhXD9CMlxkb3CX5YN602Dk/Ucl0D?=
 =?us-ascii?Q?PaBlyjwvqo3mptjg+bK1yPZn2XUPs2D1T9xowun0oNhktPl0rbU/I9ERAUGm?=
 =?us-ascii?Q?l5Ql7c3qDQzUkJFfYtsmf3CnjbHX1JraY9uTxySc9S6wYvhDQq6rFYHfUagN?=
 =?us-ascii?Q?dRFwshmUtpS8VKQSPRPHoyemwF4Dl+QhqVDR6JYNfpmw2ccnhqJtKUC6drkv?=
 =?us-ascii?Q?fso8Huzb+XKukOupJXMLnXMuRO2QLzhKXJ6cOqiF6YpTqAmclzXZNcCK9iFe?=
 =?us-ascii?Q?04rzVN7mxQ/1K0Qlo9eU3pA3cEKj+K8LFLmqVaFsQkrSqu48drgN1//N8waz?=
 =?us-ascii?Q?rgo48acu7TnBAGuA/UXGYWg2qPOS9WRr1EAimVAcIfe5nfrDedQHv2nWjUyY?=
 =?us-ascii?Q?p+3In4p9kIibayLQvKOpRqlB77BX/rAoBgLLDbuPy3mndpDxqrVhFH06K1q6?=
 =?us-ascii?Q?FLLksFftXuL/gle71CENNNLONv0y52rJbZokGg7sVcLLmXzdz2f0PF7ycpDV?=
 =?us-ascii?Q?oJo3oi4KogVlrkX76hcLCvWhWAk7nnQ4ecQrYg6CUxxR3zx+7+0giydFWyVZ?=
 =?us-ascii?Q?16oHOLJbOyGVye6bpPA8lh72VU5Y9UQYVzBAkzVAkE1pm3xHQcQaipe9Dyp0?=
 =?us-ascii?Q?IKXh5RYBnhmU4n4GMszQMSZqrQ6XeNYoon3BD9UbL7bF72/9tpSzeGl2USG0?=
 =?us-ascii?Q?nWW/QPIzQqIPT767fAXPE6iyV4UVLZeNlvTQhy0XdfVjrdZ+FNSZkZOeJzrg?=
 =?us-ascii?Q?fg7dTEjgjIKBljhah/kNY4Y+LQLN3q3R4a01aYRP5NpSgk5CNiv0bE1JRP32?=
 =?us-ascii?Q?RJcupY6xmoUej6nJa8D5Vj6U9YVEQC0JYVWTrjkTzVTsEZNSVnNfjSVX48vV?=
 =?us-ascii?Q?0BBsybtSQ0AqiPvqOIoHhC3vQT1UHfZv6xnvaEmm2UoVf0HEzZd/WvoqXm8C?=
 =?us-ascii?Q?RcwDTg7AkmpO4Jevan+hSGEiKYDm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?082P4WtJXqfUNobYhfMrKD2IVHp5a+i/66U3EmGNVeIPKkl5IAeQF/qGtHY9?=
 =?us-ascii?Q?JPCe3LjZLycKrgFwUi8zIx/C8Mp6A7EMEDvPJatKeoLiyDfU1QgatyUQVgUk?=
 =?us-ascii?Q?CxrJJ1eBnn2TqsQd1FFhc7rzolg3B2SnpMCsqfBx0Lp5YUSlmeSOsGGkiX5M?=
 =?us-ascii?Q?Qu6RnNM0voFLBnz1KPImNtjR0fxkRUBLRoYotuwT6+3B4faIKsHiw6XfaHqH?=
 =?us-ascii?Q?osWZ7GAaG8Sl1k+c8BCT2nHlpdxwiNgCmHsWq6bmmCsDoSlHbBmsxZz4s6yJ?=
 =?us-ascii?Q?qxiedz72b1wcK+eU20+2QJcuJE4Ee8grua7eTGzs3/w5u2xR1MYoavtgiJ1a?=
 =?us-ascii?Q?+ewBTDAU68Ss/7ish20+PY6LW+0WCin80l+tDrl80cPtHhiJsMllGbv3sFTs?=
 =?us-ascii?Q?56JhlFC7qBDBPEn5pKGwjFmBSjMd2ngboX6Cuhwca6TxVk6n3rgYivHKi4Qx?=
 =?us-ascii?Q?xARy4VZjHjfUcHNLEtnhBN1qy0BV0A9zjTP8MrFHuKfZ/gKYLImyuYuvv3qU?=
 =?us-ascii?Q?/LnmwZAFSBxo4kKjYMMW33n6jZaQAcr8R6gqA45i4R2sGXmiUj4JXlNW1Knm?=
 =?us-ascii?Q?lMD+vEdXGVbg53o/4CGHpRb2pHd8BfoqhuqUalny4Q5f/uy3oI4g8shGKjvK?=
 =?us-ascii?Q?B3qKmm68F8W1ym1LQCcORXyDhTfq5ZHVcWNj91z7oDWJKCPX5jP2/Nh8fN8X?=
 =?us-ascii?Q?KueplvtvLZw+jrSbdHAG5FKGvme3JCJ/VrZMrmcSkDtDX3toregX1x4PXTBN?=
 =?us-ascii?Q?j85lQa/QGjj8TWKGSUCLWyEPjmkACzw5pZkH6CetPm1l/CWEMfFm6kzW8SPP?=
 =?us-ascii?Q?tIN4mwpf5BWfkzVzvXzzH7KIY3IfFq/tS1hxNfUveBQ3stBciRXCLNjLw45U?=
 =?us-ascii?Q?46zzbIDm+shVxvEFeR0KBSXzyTal0GDaEANCy9rjbLyq35Zf5xeCvGMMmuuf?=
 =?us-ascii?Q?LtBzDzLZwAoD6+CR19o5njk/OTmrmA/Q0WpmrkHyZfNTT3VZDfF2A2DdDrTV?=
 =?us-ascii?Q?gLBJX8F/4ZLm79xToI/HsabaZUQVzXZnWPSWDkEHEUbe+e2LUklbRulrmSUB?=
 =?us-ascii?Q?tuTa8v6+kZei+pRuBGFwjNml19U2d0vL4GccrhFo5GSmtLUS20dAToyqexlH?=
 =?us-ascii?Q?NBzAI5skZQJ8VHZliVYs/GosG/8seRS8XF6pXlfxCxXDilVnuv7pqM6t/reO?=
 =?us-ascii?Q?3WDBi5FJMsjkxcGKIUGYdqo3jkl5LU1uCKG7T0Ou/oIOtCAt0kqbwuQ8ANgn?=
 =?us-ascii?Q?4FFfQg7QVnDCwkOl7vsRyT312Iu3WM6CmdlyzkYWXgLAQHZiWHi+x9nC4zVz?=
 =?us-ascii?Q?ZQUSr/ZHnVgxFCSOJuXv4qbPfUS45cef/EisA/3lmR1A9jyGSPcq4n5fUklu?=
 =?us-ascii?Q?boIzQEnlxxkLBKwKbvnfleOUwAMslfHa3QL4b5piAF6KoBM4f5df/jK/eQJQ?=
 =?us-ascii?Q?Ndp9AC5ApfLtf/B8kNxla0ZBawFW9fWI66lMuV8faz7cSUbFL+h3ZG0osxpm?=
 =?us-ascii?Q?m4k9UFAvYzhutR5ahjFqbnPTEdA6Pv9pswlX8Eixm5jO92EMc8IbUmLLkCdG?=
 =?us-ascii?Q?/54I1+l+M4PKS7cPcpHrPMBgSrUYjB4rAVDkPWW2QLQRfr6OVKeCQQ0Zl8tM?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7287eb81-268e-4e36-14c1-08dd357d2714
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:56:20.0563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zxqNhuXp6jVniP86+aLVPj0u814Z2aOnJhqP9c2xnRpyWggXVfN+/MrfuHd9Gti0ex9fw7aJ2EJRcsVJ6yWvtXsW98ObqiZpUrOPYLGUMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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

On Wed, Jan 15, 2025 at 12:25:13PM +0100, Francois Dugast wrote:
> Hi,
> 
> On Tue, Jan 14, 2025 at 01:29:54PM -0800, Matt Roper wrote:
> > On Tue, Jan 14, 2025 at 12:38:53PM -0800, Matt Atwood wrote:
> > > From: Francois Dugast <francois.dugast@intel.com>
> > > 
> > > On Xe3, the register used to indicate which L3 banks are enabled on
> > > the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
> > > represents one bank enabled in each node.
> > > Extend the existing topology code for Xe3 to read this register and
> > > generate the correct L3 bank mask, which can be read by user space
> > > throug the topology query.
> > > 
> > > Bspec: 72573, 73439
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> > >  drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++++---
> > >  2 files changed, 16 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index b4283ac030f4..096859072396 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -221,6 +221,9 @@
> > >  
> > >  #define MIRROR_FUSE1				XE_REG(0x911c)
> > >  
> > > +#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> > > +#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
> > > +
> > >  #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
> > >  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> > >  #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > index df2042db7ee6..516c81e3b8dd 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > @@ -129,7 +129,8 @@ static void
> > >  load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> > >  {
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > > -	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
> > > +	struct xe_mmio *mmio = &gt->mmio;
> > > +	u32 fuse3 = xe_mmio_read32(mmio, MIRROR_FUSE3);
> > >  
> > >  	/*
> > >  	 * PTL platforms with media version 30.00 do not provide proper values
> > > @@ -143,7 +144,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> > >  	if (XE_WA(gt, no_media_l3))
> > >  		return;
> > >  
> > > -	if (GRAPHICS_VER(xe) >= 20) {
> > > +	if (GRAPHICS_VER(xe) >= 30) {
> > > +		xe_l3_bank_mask_t per_node = {};
> > > +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> > > +		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> > > +		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
> > > +
> > > +		bitmap_from_arr32(per_node, &bank_val, 32);
> > 
> > Doesn't each bit in L3BANK_ENABLE represent a pair of banks rather than
> > a single bank?  It doesn't look like that's accounted for here.
> 
> On this platform, MEML3_EN represents enabled nodes, which can be 0x1 (1 node)
> or 0x3 (2 nodes). L3BANK_ENABLE represents enabled banks in each enabled node.
> 
> If 2 nodes are enabled, each bit in L3BANK_ENABLE will account for 2 banks in
> the resulting mask, one in each bank, thanks to gen_l3_mask_from_pattern().
> 
> For example, if 2 nodes are enabled with 8 banks each then:
>   meml3_en = 0x3
>   per_node = 0xf
>   l3_bank_mask = 0x0000000f0000000f
> 
> This seems correct.

Hmm, it seems the two bspec pages listed on this patch are inconsistent.
73439 indicates that each bit refers to a "bank pair" rather than single
bits.  However 72573 indicates "1 bank in each node."  The latter is
likely the correct one, but we may want to file a ticket to get the
spec's description fixed too, otherwise it's going to cause more
confusion.

Aside from that, things look good.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Francois
> 
> > 
> > 
> > Matt
> > 
> > > +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
> > > +					 meml3_en);
> > > +	} else if (GRAPHICS_VER(xe) >= 20) {
> > >  		xe_l3_bank_mask_t per_node = {};
> > >  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> > >  		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> > > @@ -155,7 +165,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> > >  		xe_l3_bank_mask_t per_node = {};
> > >  		xe_l3_bank_mask_t per_mask_bit = {};
> > >  		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> > > -		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
> > > +		u32 fuse4 = xe_mmio_read32(mmio, XEHP_FUSE4);
> > >  		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
> > >  
> > >  		bitmap_set_value8(per_mask_bit, 0x3, 0);
> > > -- 
> > > 2.45.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
