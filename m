Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE49DC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 13:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3981D10EA16;
	Thu, 21 Mar 2024 13:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QI/HvEYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392310EA16
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711027209; x=1742563209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PdmZiBmBERtGNaNwOGijPeHhLpc7j1aL36ZqAaZN5Rw=;
 b=QI/HvEYREfVwh0OVip4jOPc+ccMWjcbXdvwNbUMlUTUprVekXz+v4Isa
 LDQMd3W5JVBDJaW3ljJGJo+VUyueMRQAf2Y5TwJpbm8r0pqLEH6yde4b0
 rv9j7zntOzoxI695EMdbcnvlobIXdme/34oNq9FeEOTG9QhVELUJWn281
 hjLhfrbspK3Xz9Yg10/zomIONLkCqdkBWHytfzQaOpue5IMtFfW30MJ5i
 pdcuX23wFdETRurRKi5l4bhtDMaOt4naZX/YoN4Otp4agKlEv7BlNvdsC
 BhiYXfR1I6w2katS8ncM8fgIwevCvDZC9Nic75KG7ZTXi6CaD2zG6y4wl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5864296"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5864296"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14539914"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 06:20:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 06:20:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 06:20:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 06:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXtH2apAi5ofRKkYOftichQikZbD/e2RMPKAh2lw7/A8AEwArxWo1/tKX7n7qL8ux15nq5KTc6/yIqOgMflYuVCjOvfvWIIetc9tnGWZu5laVbikyJMiVC8LTTu3zx2KjT8H/kxIjKP0lLfHZdLoGZAuS1HSYElBen976bLMBqnfdiIu0jz4/0zWQuiQhSB7S4Oqv1PbkxE0p8yMVNZCsel+PRVdr6d1a4NNk+TqjWVJvMzFebvP+t4g6QE/Ncu6l+dAW5cmHi1ly9Shm8JDbCEArPsKck2KpumMRoriXykHoi9UsQAvuxRcn0INqlzDLn1XEh5TEJLuXGqInlMT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfZXRJWGzkJcnceyrGNPjETKgS2qqp+32TX8nxrYfnA=;
 b=dmGCUgHup67MbFeRO06esemSRSy/2WC9PSFH2DK6N7PmbcgMbJBEq1PBQn+/j0axcSFaoWB3ryEEvmQciaUQaOXwD3DDBt+Li1FI4HQQbsRNsag77YVAg4IIHKHmszObaWFmJ7Zy4f2DK5YX/zBi3Zb8qy2vHtV9iLCVduOGJaETu72WV8+QG0FKu2DFvm3+cWNGC49XG498Cc1jNILZQ/zP/qXbeCI3ILgVv4Vl8gZUuAVLnkZ5PiQKs/qqzmM3P4/JQwxf6W07I1sG2m68wd4qVzjOr5/NE6eB6CmcnVGPtWpjWXXHkQDvdnKmgxkuEmi+eny4lEH1K80UsJYQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 13:20:04 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7409.022; Thu, 21 Mar 2024
 13:20:04 +0000
Date: Thu, 21 Mar 2024 14:19:57 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/uapi: Add L3 bank mask to topology query
Message-ID: <Zfwz_R6zNdecxxtw@fdugast-desk.home>
References: <20240320150027.7-1-francois.dugast@intel.com>
 <618db874-2503-49f1-b4f2-282b0f1140a4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <618db874-2503-49f1-b4f2-282b0f1140a4@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI2P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 9225c91b-5245-4c95-07ce-08dc49a99ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFoeOhknMuti/0zk1pc/mcNy0kRBFo5cPe6NL3kt9STXLqz81rjeA4wmj+QkJMcedFrH6nYGdgvzLBNG7lUYvalwpvO7RS0+heFvf4JpH+8TfU0Op0JosBLs+YvnmWcmMKU8dEDey/bh6OBHO5SD4wWkejdhaahhCgmfL/p5cWOrbkdPeAYh501ejul3zu4+60VpGZPWYfgNtAwfCeTBRikLLhPhlaw70wHxpWmQiMIfHnv02XKRBLdMEgYrJA6hTSqOFYehW8jITSdyLnXH8BbAAg1JGoeqBErwLKIenh+TGyZhDxWSBFjn3TE7Y2V94Z0vSjyDclkEdN0H3Z+km5NbEwS2unPJvW/IWBp79JrP/Tdjvj3UleWvYSTSHvt9li1Be1Dt27V38l3mNkw2n5ZMOmsMkc3lUv9S1FWbl11Plju6jsTC2PwLZJmhV0m71MfcO1PQIvkiZuY4VsZAFdjwvH5kpj00vaTPaqN9vCT9IZSpf47A2NdxwpiEEeWU3JpErWfpDk79KcVXR/+dq5Ohc5diLlBdNfhUbCDO9bN2wi/ZekFsdS+X7i6M+28ApZT0RaTbXwwn3E4D6YFUS/hboo/i9u314po0EipBTZQEtf3nf66/1gQsrXX10b5R+XTviAzwiq956GzwyWKdJJ5KJrf2c1Jfq/iowtzSCko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KAZvjEEFDHCY9kihSwcxqYuDEPStKPeuGVIeIIN2e8jFRBUqg5JfCKgLlMAN?=
 =?us-ascii?Q?Nr5XeUdRHQbq+vhYINw6BffsQ1QkZy51OhyqL0boHg2QTuPYDe8I5odKDgna?=
 =?us-ascii?Q?WZKZgw2bvyEv4VXDyM5fazY1OgMJB15CSkESiso36nCRrKINkw1NOLqMvlCX?=
 =?us-ascii?Q?iuRb5TAiNAYnIoF43sDoA1XJF6Nv1wYtJgjdiuAk+lvBL6J7svnazE3h0/JF?=
 =?us-ascii?Q?YS+OXB21lh0QK8nuZXcMDSEwLgYuhrboAZgmfCOa0wvQMhxb8jFCIna27OAF?=
 =?us-ascii?Q?SG7xd4qQF0ZLKpbya2ydK3C+dJUjfZa0AKIUFcpkpYWsxGFhUaN50mFNvBJM?=
 =?us-ascii?Q?7TwoTqlFDZZ0gmingWYlo8BwFFEi2n2pGL80taxJ+Ni69BRuztC+4dKaXGgc?=
 =?us-ascii?Q?5wOhOU/edo3XgkGew1D4AzgcDGOsAUOYREa2M6Q6HFi96Rx57qBKhjFYSj5k?=
 =?us-ascii?Q?NvJsaMsSqexXwGmEDsfaCmcANhUZxXdVEmVQLW0+kj3aLBzxkdD2WxUtMC7G?=
 =?us-ascii?Q?+au0VCS5SLHc1480GXyHp4e3dnARwYzxxdhxM2qKagrj6vvyI5oz6e7J1iUu?=
 =?us-ascii?Q?kLCjeO3De6ngqxHzM+T2eaxbsuMub0wIOwNz+b7TTIJJ1PMSQa1JNVs3T4M6?=
 =?us-ascii?Q?8aMBVGqboSLmt7nGqqYYc5mlr/w+a5eEGhS7qtUIikbYhzsi6ZJB2jaOR/3O?=
 =?us-ascii?Q?I5q8vh/00DOgg0etVHz0be7ISGQNJXtra6szezecd+LTk2VfS+HRlfWUIqwF?=
 =?us-ascii?Q?he6Iz22zH1c5TOovbnk+5LrxwdQZlTD/YRuUTsK1IHqfvvUIRjzrXL2LS3TM?=
 =?us-ascii?Q?I7khe4kl7230e6EHfswkRQ2QS5dwlZ7IteD+tC4ibc7W0dsHlzDiXK7uZQZq?=
 =?us-ascii?Q?OkUhkP1Wcf7V9FWDtWLFNAClLoT1x6BWFVEyLK8y8Su4U0nF70NbEn8gWBza?=
 =?us-ascii?Q?4pcWXqeu6Cy4HHEr7jP9naBUl2UeX/QOTK7wDH8yCY0YAxLrWC+LJ/cXWP1d?=
 =?us-ascii?Q?Cp6IY1wbM7aWyS6DroqvcBguEecDOI94nGEeuiRYLVOOM1lDIBByNSBCkxrE?=
 =?us-ascii?Q?bChKVeM10YVmMAydFqr3Bs/2lK13wdkUKbaHiu5KE/FEUzpvqSVxz7HsX4UG?=
 =?us-ascii?Q?/gqNibygU9oxH2h1GG3MH379tM1nu+m1d1ZPCnCYkfYHxiUN+7EdB09Tplsk?=
 =?us-ascii?Q?P6jhASpH8HJcAztvTfI7zjhcg8TrIYIMaX4Zei+5HnU3V9Qsvnaom6FU8W27?=
 =?us-ascii?Q?9Sucmh5tIsFZr+jnYnZWkCuC++fO2cuoSghTiztoR5a0/pQL23I9jINheqwg?=
 =?us-ascii?Q?iZf0+Ww+WD0TEYAOngoT2gI1X9rXP6UtW0Sl6Katz7IfAYALojGHYKUSpEhr?=
 =?us-ascii?Q?73vZ2gCC21o2Zv0+oS3uIUcpx/yde88ECKnMlV6oMcVLnk05vky8ZQMwvo0Y?=
 =?us-ascii?Q?BYWhJ7609yH68dvtHR3pGAmjAjF6izpE+41Cv6WgFza30b9xXGRhCnzAr5bm?=
 =?us-ascii?Q?TcH+dw/n3HK/gFhKpmQ/qOSO1eY55pMyhQX0lJTe6CgfOO6mtlkoIKfWgznv?=
 =?us-ascii?Q?lja4w7ukDv1fQnKiIPh0yG8uEznidAVSuiYjTdKruY6fPX/YPQkJYXlY2hLv?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9225c91b-5245-4c95-07ce-08dc49a99ebc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 13:20:04.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqI53nxynEu8gvnb2CqXoi6IX5hdtQXsLRXxjiLiPvmbQ2EHPB5wyKmQoLiYQjHnSg+6186EELux1zl1itAzrAs6mK8jopkkfqOzBAZK3Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Wed, Mar 20, 2024 at 12:14:21PM -0400, Dong, Zhanjun wrote:
> See my comments below.

Hi,

Thanks for the review, please see my reply below.

> 
> Regards,
> Zhanjun
> 
> On 2024-03-20 11:00 a.m., Francois Dugast wrote:
> > Extend the existing topology uAPI to expose the masks of L3 banks
> > to user space. L3 count is not sufficient because in some configuration
> > not all banks are enabled. User space needs to know which ones are
> > enabled, in the context of OA.
> > 
> > v2:
> > - Remove "Fixes" and make uAPI change explicit in commit message
> >    (Lucas De Marchi and Matt Roper)
> > - Add separate conditions for Xe2 and for PVC (Matt Roper)
> > - Return the L3 bank mask instead of the L3 node mask and the L3
> >    banks per node mask, as the node mask can be derived from the
> >    bank mask by user space, just like slice masks are derived from
> >    subslice masks today (Francois Dugast)
> > 
> > Bspec: 52545, 52546, 62482
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Robert Krzemien <robert.krzemien@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
> >   drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
> >   drivers/gpu/drm/xe/xe_query.c        | 12 ++++-
> >   include/uapi/drm/xe_drm.h            |  1 +
> >   5 files changed, 96 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 95969935f58b..be5b4936eb53 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -156,7 +156,10 @@
> >   #define	MIRROR_FUSE3				XE_REG(0x9118)
> >   #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> >   #define   L3BANK_PAIR_COUNT			4
> > +#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> > +#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> >   #define   L3BANK_MASK				REG_GENMASK(3, 0)
> > +#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
> >   /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> >   #define   MAX_MSLICES				4
> >   #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index f5773a14f3c8..8920426332dd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -59,6 +59,75 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> >   	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
> >   }
> > +static void
> > +load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	u64 node_mask, bank_mask = 0;
> > +	u64 banks_per_node_fuse, banks_per_node_mask = 0;
> > +	int i;
> > +
> > +	if (GRAPHICS_VER(xe) >= 20) {
> > +		node_mask =
> > +			REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> > +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		banks_per_node_mask =
> > +			REG_FIELD_GET(XE2_GT_L3_MODE_MASK,
> > +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		for (i = 0; i < fls(node_mask); i++)
> > +			if (node_mask & BIT(i))
> 
> Is the for/if equal to "for_each_set_bit"?

Yes conceptually but it seems "for_each_set_bit" only applies to bitmaps.
Here the intermediate masks come from using registers and they are
used in that format, before the end result (bank_mask) is converted to
bitmap in the end, see last line of this function and other functions
in this file.

> 
> > +				bank_mask |= banks_per_node_mask << 4 * i;
> > +	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> > +		node_mask =
> > +			REG_FIELD_GET(MEML3_EN_MASK,
> > +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		banks_per_node_fuse =
> > +			REG_FIELD_GET(GT_L3_EXC_MASK,
> > +				      xe_mmio_read32(gt, XEHP_FUSE4));
> > +		/* Each bit represents 2 banks in the node. */
> > +		for (i = 0; i < fls(banks_per_node_fuse); i++)
> > +			if (banks_per_node_fuse & BIT(i))
> 
> multiple dittos ...
> 
> > +				banks_per_node_mask |= 0x3 << 2 * i;
> > +		for (i = 0; i < fls(node_mask); i++)
> > +			if (node_mask & BIT(i))
> > +				bank_mask |= banks_per_node_mask << 4 * i;
> > +	} else if (xe->info.platform == XE_PVC) {
> > +		node_mask =
> > +			REG_FIELD_GET(MEML3_EN_MASK,
> > +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		banks_per_node_fuse =
> > +			REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK,
> > +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		/* Each bit represents 4 banks in the node. */
> > +		for (i = 0; i < fls(banks_per_node_fuse); i++)
> > +			if (banks_per_node_fuse & BIT(i))
> > +				banks_per_node_mask |= 0xf << 4 * i;
> > +		for (i = 0; i < fls(node_mask); i++)
> > +			if (node_mask & BIT(i))
> > +				bank_mask |= banks_per_node_mask << 16 * i;
> > +	} else if (xe->info.platform == XE_DG2) {
> > +		node_mask =
> > +			REG_FIELD_GET(MEML3_EN_MASK,
> > +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		/*
> > +		 * In this case, if a node is present then all 8 banks inside of
> > +		 * it are present.
> > +		 */
> > +		for (i = 0; i < fls(node_mask); i++)
> > +			if (node_mask & BIT(i))
> > +				bank_mask |= 0xfful << 8 * i;
> > +	} else {
> > +		/*
> > +		 * Here the mask logic is reversed: a bit is set if the bank is
> > +		 * disabled.
> > +		 */
> > +		bank_mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK,
> > +					  ~xe_mmio_read32(gt, MIRROR_FUSE3));
> > +	}
> > +
> > +	bitmap_from_arr64(l3_bank_mask, &bank_mask, XE_MAX_L3_BANK_FUSE_BITS);
> > +}
> > +
> >   static void
> >   get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
> >   {
> > @@ -103,6 +172,7 @@ xe_gt_topology_init(struct xe_gt *gt)
> >   		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> >   		      XE2_GT_COMPUTE_DSS_2);
> >   	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> > +	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
> >   	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> > @@ -120,6 +190,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> >   	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
> >   		   gt->fuse_topo.eu_mask_per_dss);
> > +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> > +		   gt->fuse_topo.l3_bank_mask);
> >   }
> >   /*
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index f6da2ad9719f..e1438a478f94 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -24,13 +24,16 @@ enum xe_gt_type {
> >   	XE_GT_TYPE_MEDIA,
> >   };
> > -#define XE_MAX_DSS_FUSE_REGS	3
> > -#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> > -#define XE_MAX_EU_FUSE_REGS	1
> > -#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
> > +#define XE_MAX_DSS_FUSE_REGS		3
> > +#define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
> > +#define XE_MAX_EU_FUSE_REGS		1
> > +#define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
> > +#define XE_MAX_L3_BANK_FUSE_REGS	2
> > +#define XE_MAX_L3_BANK_FUSE_BITS	(32 * XE_MAX_L3_BANK_FUSE_REGS)
> >   typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
> >   typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
> > +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];
> >   struct xe_mmio_range {
> >   	u32 start;
> > @@ -334,6 +337,9 @@ struct xe_gt {
> >   		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
> >   		xe_eu_mask_t eu_mask_per_dss;
> > +
> > +		/** @l3_bank_mask: L3 bank mask */
> > +		xe_l3_bank_mask_t l3_bank_mask;
> >   	} fuse_topo;
> >   	/** @steering: register steering for individual HW units */
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index e80321b34918..0a064c12d80a 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -453,10 +453,11 @@ static int query_hwconfig(struct xe_device *xe,
> >   static size_t calc_topo_query_size(struct xe_device *xe)
> >   {
> >   	return xe->info.gt_count *
> > -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> > +		(4 * sizeof(struct drm_xe_query_topology_mask) +
> 
> I know the 3 to 4 is for numbers of masks, can we make it a marco? For easy
> to read.

Sure, I will make it a separate patch as this is not caused by the new
code added here.

> 
> >   		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> >   		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> > -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> > +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
> >   }
> >   static int copy_mask(void __user **ptr,
> > @@ -515,6 +516,13 @@ static int query_gt_topology(struct xe_device *xe,
> >   				sizeof(gt->fuse_topo.eu_mask_per_dss));
> >   		if (err)
> >   			return err;
> > +
> > +		topo.type = DRM_XE_TOPO_L3_BANK;
> > +		err = copy_mask(&query_ptr, &topo,
> > +				gt->fuse_topo.l3_bank_mask,
> > +				sizeof(gt->fuse_topo.l3_bank_mask));
> > +		if (err)
> > +			return err;
> >   	}
> >   	return 0;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 808ad1c308ec..aa917308cdeb 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -521,6 +521,7 @@ struct drm_xe_query_topology_mask {
> >   #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
> >   #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
> >   #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> > +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> 
> Here is a good place to define numbers of masks
> for example
> 
> #define DRM_XE_TOPO_L3_BANK		(1 << 3)
> #define DRM_XE_TOPO_NUMBER_OF_MASKS	(4)

Unless this is required by user space we could keep it internal to the
source file where it is used.

Francois

> 
> 
> >   	/** @type: type of mask */
> >   	__u16 type;
