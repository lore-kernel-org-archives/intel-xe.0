Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5ACC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 23:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3301810E29A;
	Wed, 27 Mar 2024 23:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtwNi2Lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32210E29A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 23:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711581198; x=1743117198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xd748FYc+Z8hGNLggiXq8u1F91CXNHSN/LG6otTQqdY=;
 b=jtwNi2LvwbD1CZUr3RfcqihLTPVWQ0A3d44rCuWVj6O/KYMN00sVvtT+
 PtkRZHoUBko9byWwhoUczpTr9aoMNHMGQTsWKEJ9aOOfqxRVxGQF7mot/
 TOTl8Sv1SVaj7JkrG2C0z4g8urF5KSbbPU/5fqslRW19pR12K49+a3vM3
 cnhJSrsGTGAQxgfEfpP5l4dKStHiQ9p+kVJOHHpGQm77TXxIb7av+pdh/
 CdtvTn4iw1LKqlVzCP9UHzLstaNmOCaoif7CYWBXWPTMo78Qs6GVoidjQ
 bgWUoi2h9xClNnXBlpHaBOkAdh9pDVcL1gBjD38gP9JzWoewT8GrSog/7 A==;
X-CSE-ConnectionGUID: PUZI1tdVSG+IG2Rtq2vIBA==
X-CSE-MsgGUID: NVwSzFl0QEm9k6Nl8d0BgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6575494"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6575494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16529070"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 16:13:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 16:13:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 16:13:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 16:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keS2iGiZG8nyS/VphRdeVn28iq2dV7d7ViyZ6Zk0HVOzonm86KVxSqosAlfLbG74wZfrKKm39JumVcFZTeoOXaNDAjF9tEPBhHIQQiGNRN9uIZnZWV6f9zfbn3Zpo7B/U00GEPAIUKoBB4HqNuDJuc0MtzLfwlPOOTSAtGo1kk54U1ggzg9zrg2+aes5+9YDaZeSaLgJo5ExqDIE79CCZ6xJTx9kAZ27UwEiBDuIuLoETpF5ZAwc+MuJqOd6qicLt13i4qNpzmx+X5Wbl8ygN22NAK40DkHT8oqPOHYW2P/JFsMa9EFXg7H6ntiWOW8Gw5BGXX/uVVym92vHrDXYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLhuZWYaNYka7yXMiJfrQKGOxV8qSP1Swy4W902+O78=;
 b=AblMsGj0an06+0GJh9GSEWCHwnKLv/PKv+v14mD3vzw164027286Hk6d+aTUzz3udvVFMQgdvibuJO9ILRlbZZAoJQdVbDhaIWS4/z2ZJOEvjKBa4DVNvyqND8VZi+2t/dySi1jfPAZUzxoOIbPscInfVGrkZF28NEv+GuG7lDYNTi+5SuPAWbBt2L0ah303dg/36J5SscWsCasEaZWe5qOBe6Viv9THpoXALvMTokhi4MQGyv4InAxrUqrqGnPlkM/uLRAkW5a5wUL8T0YCXnb5jzEuan+9yVvpqDAiSaV9jY36KsATb5NYj8aqkG6QdlVKAzAz+cZ6aMlA+xGYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 23:13:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 23:13:14 +0000
Date: Wed, 27 Mar 2024 16:13:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Robert Krzemien <robert.krzemien@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/uapi: Add L3 bank mask to topology query
Message-ID: <20240327231311.GH718896@mdroper-desk1.amr.corp.intel.com>
References: <20240325111439.7-1-francois.dugast@intel.com>
 <20240325111439.7-2-francois.dugast@intel.com>
 <20240326001720.GB718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240326001720.GB718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: 07adffa4-9656-4513-d6b1-08dc4eb37a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: anBUs/thrn/LDz4LkjaaN8rMhPd88Gyy8nIBpKFNHyhY5d03HPLNyNaqy7/A0VJd/dk0YPjwEDXW0CBYvDORVbyQScXf0/3EfEVn2iCC+7RHFGCmRJYM5GNR3+HxeGl0/9kPtrtB9fQvvF9hg/R0MRkpIQDkSIjQ/8U4cuL2GgwoSSm8VTQVFW8gU3Lrjo7h+7/+C3PZHPPsYh+73xa/4sWUFOp73GLOzIMo8vKaYvVAAun4GGAdDgCbe9cqwo77pwzKOeH7X07ZVLENE0dEAjWZCQ8BhfylL2wmYtmmU67W2msqxtj7GHO5A4AmZh+DtUMzmfK/476EU8MIOnnXN3TSLDCk4hAvyQXBUaDFMZFHQqHsbG/7m2TKadK4V5Kby4al8yUxEKLvypaL0lPtRsrhJkFj+iXUFoZAF/Q/XAKDgK+S7+yWzKd8awjH6CPiFn4Pe0arMpPh+hDfWSwmf5hgrwoEsPw5TxtNPD42aWn+RLVc36lAebnOY9WAsB7b6QeecrTYmz1bb6/267ULQ4WrtBIhnjGxLt12cz/G16uxQWjGM37grWvaIvkmQ0lIBL4mJhohFNVx/Z485UPqY1YFnd92IKVxU1NPO+S7v6FpxZhaAFDpSURRfHqeXJ6JBWxy+AoA/6QO4SkfNbsM+DP7nWWnOYgg9HGMi0SwQuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g51JPvFg/Ei+DYfAgZ/Pnr+i41GNjyWvc+jXAVgGikn8SZIoUrSfKk4eNTDA?=
 =?us-ascii?Q?KNZK9BDuxLnpALzKvFyMgKTdhUo2MGV1n2jCGPmMA4s1fnHJIGYqHX8el3Ib?=
 =?us-ascii?Q?cPn0bBercxsv9zylu8W4e3zQYjlwGxLcnz0V5/1eFBPS3hR+6zEvXzg+1GQF?=
 =?us-ascii?Q?8CJjFnEy2zpaGaYNTkEZBVeIWnABq0PkNW1PS3weR+vm8NdtXzgYDXiOKEnn?=
 =?us-ascii?Q?V567WUm5ruZybi2QefdKMa1O3v+isvKbFRlOau94b4WrmwhG5XNUXjI7ihS1?=
 =?us-ascii?Q?2XQMKFTJnEdA7HGK21kVsPpIPsuofx46sjIRSRb5fZ1U+H3E/OcGcEqOO0kt?=
 =?us-ascii?Q?S3XtGGu8WdU/8U4arsayMFnpHGJiTpdYYGWl5Y3XZCEr0HrRfe7NZOJKh/2k?=
 =?us-ascii?Q?sdHJEl0x55UEeRGDXa6K+46zagbeWghDr4/4bAGB2dUpJnmsOoGpoic1MJIz?=
 =?us-ascii?Q?JShgArqeDxAKmr+gObQudPVWall3kbhWkGgRTLKorbucN2hPK9DCI9gomaQX?=
 =?us-ascii?Q?ncsnf/i6HmesUu5WAzVf41CL12NFWeSu1EbDP3Cfm7UolsIbDDQkVtPZAOKj?=
 =?us-ascii?Q?b5RIGHKmuRj6i5nK7UV1A4tIRABdAQ3f9i4h8Oc0hfMaiqngfYZPievRuylJ?=
 =?us-ascii?Q?cuF8V1qzHHaR+ewSiQ/h1a2crSeeMKYwL67ClzeBAZ0KM4eTxK8xySS9S5rn?=
 =?us-ascii?Q?RAbBs8XYtvALTDyEilVpWMf4MEZ84l4kGc/7G5UPBC1Sz1VudZ1qi2dokw4F?=
 =?us-ascii?Q?G/JuGNWtxOG5ug0KUlf/dht/BMyu8dpA7hltZUmX1L25FW1jQ4iDpC3WeZPt?=
 =?us-ascii?Q?RrbuMgkxrBcQkhE45FaLlPJ4ZaIVqLUTjoS+NHFC8CIUJWzLd5nYlaSQH3CV?=
 =?us-ascii?Q?EzrRUELoNivZKFPJzO2qZtoGC4E8ltaNAjwnx0/2mJkldeO4K5yJmJvALage?=
 =?us-ascii?Q?BJ3/Z7lgHzzXlqUzi2qkof7tTiwC+R/5USZoNzLQtr8FPVrbvFzw4dA5DsrQ?=
 =?us-ascii?Q?UpntIw7f3FIzn2WCobwjkwb+e3LMcRfZJvZ81neKyItRGgWNWnfmeJ4ZcNRC?=
 =?us-ascii?Q?4GGpaDvnwcM7oxtB1BHxTteNKbYqnjrp5pvDIg/yMH2XLdviwJtYNnYgxR8w?=
 =?us-ascii?Q?bcaaH/xONXQs3xZlyX1uz6Bs+0XCZpqEUpXIrMEyiOEFUZrK+8tzCi90KR1E?=
 =?us-ascii?Q?8xyT1wJEy6bq17w5QZc7G8M8ioMMSj4MtTg0x5unFRlr9oTUZlOPJizMkl/A?=
 =?us-ascii?Q?8oKosaGT37LM3ruGBposRFEo7DFTzOIvJ69VX5+vpLtuaRUGNwmBMNg+y54n?=
 =?us-ascii?Q?ac644u7whX2j5fGWkt0YDswbyWFf0/CGM1o5zKABMFBCfpgcUl7wQklAu9ze?=
 =?us-ascii?Q?4VRXAZQ/w/9qSmKvvIcjjGZ9COBZ4hWicJ1yfMMTtDalEfDRjsdIbnVpAk1y?=
 =?us-ascii?Q?9wSZfbx3AEk2QUwtgIz0SkOUJ19rGcOsq0TWOk/QZcjvxFx7Badzr+fFAQMv?=
 =?us-ascii?Q?SuNWitb+xlS7bMkVQ3QrIHavo1rYHGt96326YzZU+EBQwcqLB0lbvQ53UXop?=
 =?us-ascii?Q?fC0BPXRpOypDq38F6r7DYw2N/bzRmvsvahX3oQS76KB10TlFrPudKrzhT7zi?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07adffa4-9656-4513-d6b1-08dc4eb37a71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 23:13:14.1600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wF5GG/JGuAn4RP3pPzboZu0XM8ZMOhKYABUC8RIArACyIgrt186AbdrrYUocqyKzTJzVLruraXM+kPveLr3/GC0J51GjXUMF7pw7r2HeQHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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

On Mon, Mar 25, 2024 at 05:17:41PM -0700, Matt Roper wrote:
> On Mon, Mar 25, 2024 at 11:14:39AM +0000, Francois Dugast wrote:
> > The Metrics Discovery Application Programming Interface (MDAPI) exposes
> > disaggregated metrics only for available instances of hardware, therefore
> > it needs to know exactly which L3 banks are enabled on the device. The L3
> > count is not sufficient information as in some configurations the L3
> > banks might be individually enabled or disabled. This is why the topology
> > query is here extended to provide the L3 bank mask.
> > 
> > v2:
> > - Remove "Fixes" and make uAPI change explicit in commit message
> >   (Lucas De Marchi and Matt Roper)
> > - Add separate conditions for Xe2 and for PVC (Matt Roper)
> > - Return the L3 bank mask instead of the L3 node mask and the L3
> >   banks per node mask, as the node mask can be derived from the
> >   bank mask by user space, just like slice masks are derived from
> >   subslice masks today (Francois Dugast)
> > 
> > v3: Use TOPO_NUMBER_OF_MASKS for the number of masks (Zhanjun Dong)
> > 
> > v4: Detail the user space need in commit message (Lucas De Marchi)
> > 
> > Bspec: 52545, 52546, 62482
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Robert Krzemien <robert.krzemien@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Link: https://github.com/intel/metrics-discovery
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
> >  drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
> >  drivers/gpu/drm/xe/xe_query.c        | 12 ++++-
> >  include/uapi/drm/xe_drm.h            |  1 +
> >  5 files changed, 96 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 65af9fe95db5..03388c69af1b 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -156,7 +156,10 @@
> >  #define	MIRROR_FUSE3				XE_REG(0x9118)
> >  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> >  #define   L3BANK_PAIR_COUNT			4
> > +#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> > +#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> >  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> > +#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
> >  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> >  #define   MAX_MSLICES				4
> >  #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index f5773a14f3c8..8920426332dd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -59,6 +59,75 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> >  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
> >  }
> >  
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
> 
> This is going to cause us a lot of pain down the road as soon as we hit
> a platform where the size of the mask can exceed a single u64.  Then
> we'll have to go back and change all of these if/else branches.
> 
> It might be best to just build the bitmap directly in each branch now
> rather than doing this in a way that we know we'll need to change later.
> We can add some static helper functions to do common stuff like
> replicate a submask according to the bits of a different mask.  Hard to
> explain in text, but something like the following (completely untested):
> 
> 
>   /* For each set bit in @mask, replicate @pattern into a corresponding
>      slot of @dst (where slot size = @maskbits) */
>   static void replicate_by_mask(xe_l3_bank_mask_t dst,
>                                 xe_l3_bank_mask_t pattern,
>                                 u32 mask,
>                                 int maskbits)
>   {
>      unsigned long nextbit;
>   
>      xe_assert(fls(mask) <= maskbits);
>      for_each_set_bit(nextbit, &mask, 32) {
>          xe_l3_bank_mask_t shifted_pattern = {};
> 
>          bitmap_shift_left(shifted_pattern, pattern, nextbit * maskbits, MAXSIZE);
>          bitmap_or(dst, dst, shifted_pattern, MAXSIZE);
>      }
>   }
> 
>   static void
>   load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask) {
>         ...
>         fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
> 
>         ...
>         } else if (xe->info.platform == XE_PVC) {
>                 xe_l3_bank_mask_t per_node = {};
>                 u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
>                 u32 bank_val = REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK, fuse3);
> 
>                 bitmap_from_arr32(per_node, &bank_val, 32);
>                 replicate_by_mask(l3_bank_mask, per_node, meml3_en, 4);
>         } else if (xe->info.platform == XE_DG2) {
>                 xe_l3_bank_mask_t bit0 = {};
>                 u32 mask = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> 
>                 bitmap_fill(bit0, 8);
>                 replicate_by_mask(l3_bank_mask, bit0, mask, 8);
>         } else {
>                 /* 1:1 register bit to mask bit (inverted register bits) */
>                 u32 mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK, ~fuse3));
>                 bitmap_from_arr32(l3_bank_mask, &mask, 32);
>         }
>   }
> 
> 
> > +}
> > +
> >  static void
> >  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
> >  {
> > @@ -103,6 +172,7 @@ xe_gt_topology_init(struct xe_gt *gt)
> >  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> >  		      XE2_GT_COMPUTE_DSS_2);
> >  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> > +	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
> >  
> >  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> >  
> > @@ -120,6 +190,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> >  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
> >  		   gt->fuse_topo.eu_mask_per_dss);
> >  
> > +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> > +		   gt->fuse_topo.l3_bank_mask);
> >  }
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index f6da2ad9719f..e1438a478f94 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -24,13 +24,16 @@ enum xe_gt_type {
> >  	XE_GT_TYPE_MEDIA,
> >  };
> >  
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
> 
> This definition doesn't look right.  For DSS the hardware just splits
> the actual mask (1 bit per DSS) across several 32-bit registers so
> 32*numregs expresses the maximum possible size of what the hardware can
> provide.  But for L3 banks the rules are much more complicated and vary
> by platform, so we can't use the same rules.
> 
> 
> Matt
> 
> >  
> >  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
> >  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
> > +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];
> >  
> >  struct xe_mmio_range {
> >  	u32 start;
> > @@ -334,6 +337,9 @@ struct xe_gt {
> >  
> >  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
> >  		xe_eu_mask_t eu_mask_per_dss;
> > +
> > +		/** @l3_bank_mask: L3 bank mask */
> > +		xe_l3_bank_mask_t l3_bank_mask;
> >  	} fuse_topo;
> >  
> >  	/** @steering: register steering for individual HW units */
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 109a96212310..e026d993f246 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c

I also think we should split this patch a bit more too.  The general
readout and storing of L3 bank masks internally is something that's
generally useful to the driver even without the uapi part so we should
add those in separate patches.  I.e., even if the userspace consumer
never materializes and we drop the uapi stuff, we can still utilize the
internal mask values for our MCR initialization (removing some of the
duplicate code that exists over there now) and it would also be valuable
to make these masks available through debugfs and/or dmesg so that
developers can easily figure out the fusing characteristics of machines
that they're trying to debug issues on.


Matt

> > @@ -23,7 +23,7 @@
> >  #include "xe_mmio.h"
> >  #include "xe_ttm_vram_mgr.h"
> >  
> > -#define TOPO_NUMBER_OF_MASKS   (3)
> > +#define TOPO_NUMBER_OF_MASKS   (4)
> >  
> >  static const u16 xe_to_user_engine_class[] = {
> >  	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> > @@ -460,7 +460,8 @@ static size_t calc_topo_query_size(struct xe_device *xe)
> >  		 * sizeof(struct drm_xe_query_topology_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> > -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> > +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
> >  }
> >  
> >  static int copy_mask(void __user **ptr,
> > @@ -519,6 +520,13 @@ static int query_gt_topology(struct xe_device *xe,
> >  				sizeof(gt->fuse_topo.eu_mask_per_dss));
> >  		if (err)
> >  			return err;
> > +
> > +		topo.type = DRM_XE_TOPO_L3_BANK;
> > +		err = copy_mask(&query_ptr, &topo,
> > +				gt->fuse_topo.l3_bank_mask,
> > +				sizeof(gt->fuse_topo.l3_bank_mask));
> > +		if (err)
> > +			return err;
> >  	}
> >  
> >  	return 0;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 808ad1c308ec..aa917308cdeb 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -521,6 +521,7 @@ struct drm_xe_query_topology_mask {
> >  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
> >  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
> >  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> > +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> >  	/** @type: type of mask */
> >  	__u16 type;
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
