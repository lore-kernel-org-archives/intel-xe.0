Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E8EB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 00:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2F410E0F1;
	Thu, 15 Jun 2023 00:01:15 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5897910E0EC
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 00:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686787273; x=1718323273;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pI4Z7skDfCW8HdYDeFOqDbytYHfAs9NzVa4o3dmsejs=;
 b=b3N7DdJNNyxVHGG6fCeIHR7N8f0Kp8+EwfgD8jXDNuGDlhqU2lv7eauV
 cv95tdtb8ky9WmqZOGQKV/sAcdhbNH15vfNXYz82GlHGZpVa21Ig5ckbl
 5t1MWioRbWfDNrnhdYFB4Y8MBEs08q5rUZV1rbeIAmkG8cCbSAKEN0UZe
 7tilwCJN0Uf4CCHXZx1IvkSvTUxaRrBbvpUgwwV4C6G0n2NxUUjBI97Js
 YA57RbZF7pCxNyoTL5XD1jU5KkKN8OuQvtfm3YDVb/1DNXetSPza4se+E
 IUOBFaZXU5cFhJE15eIzA+ctvuaqge//g6nD3lttKx6k0nOdUbX0hTFk5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="424657497"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="424657497"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 17:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="689577088"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="689577088"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 14 Jun 2023 17:01:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 17:01:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 17:01:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 17:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRchZlNg7e2jQ5OJtuz8GX6tv4YdiXyT/E1rZFINtqog7uUcgEMhu2+s+QyEJQRjZPTHYitQHfAaZ3g09a/5d5ThGyzBZNXoPooOidkeVHqGhLpkO03Cy5iEFm82rZjbWFuExL9dg9JZ1SR6FeTBQ+EeFt0DOmSNM+bLqB6MQo9eMofrhpN8f9nGpgdCUSApEQMW7azRu+t2y3xuJi1AS0rTAE+DhJNhbSBO+OkrubV02yGFVfbMxGA7a993WLaZ7YEP9dUaI0WgCvFrqZb0Ch4MSCsZHmPThAN9TN9xuBSOqt4yu9BNI4zXzZc3ghkHVIAO4bff5D3SHybF7fX7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23+wM9oM6MVS9EMs4+P7c5dqYyk7aI28TPAqSzfwudM=;
 b=P4NQ0fvSZ3zfYnH1lfPUctQLinLnFKB4CrIQ//DW80aZpveZk4kfSuPLyQXsJz3awaAn4uZgH/y7aBTMQ6bGB15m4A239PqYvgC4wPdmDFe8V+51w6whgO8aQJ+VDasQLx4Vl1M7ch20Ec63vZ9DVG6gsoLv0U8QQFSy8rLPJUhZ/SkvrPMLlxmEbGOXgm0CnC/5xzhhtgKXeukBEibEfKn4tYZQ4GapEuqB+1Y74cL5qN7Bu3NLz5Djnrwl1gC7YX0hXH0KFIAqxaL3ExHKrK5fY6QiDEzVaAKQI3gdjIe3O8RkfZaCep1SzgA3bm/L5i1+NjSJUBC9AwUH0yBEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 00:01:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Thu, 15 Jun 2023
 00:01:08 +0000
Date: Wed, 14 Jun 2023 17:01:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20230615000105.GU5433@mdroper-desk1.amr.corp.intel.com>
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
 <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
 <ZIdIfdiClQ60fZSI@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZIdIfdiClQ60fZSI@fdugast-desk.home>
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 97aea737-9f9c-4e74-5cdd-08db6d339ef1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIDGeZgqwtkj61JqEU5rhbLcD2GTMVdqnKmLR4+2VW587xBcvb3eVvp0wFRxqmOuIpre316MxqxmReIX/Kb5qikZ7HF+gFcg1AVL7Pk38tzbCXPpRkLd7H1oEbk++9cOcq1W1ursaDi1/6YoUQBUjnAO8hjHawpwYXtkGHuXSWKWHdIpJhmau6SL7Z8gM2M2nm6LLuSYjUjycNRwFQIjBNCCA/G4vLqeoGozB8abCqYaaXHLKU+onE/ARkof80/D4y280PRolahudFZZuzI2Gw547aswvjbJHCwQDKIqbh1onDURB9fvYW8MjYXKSKqJu3YUCxvo6mmCoJESnA1ktjJtl76mTGiVGsOpcZjbD12aBKcdJqRHWRckDfsCqvZOgkZOPnI6UTHip2THFT90385+U/B9Y/mTHuc8J5hwSMkNEsTNpxZpL1snOrmLcNDzDJ0LhUZGejqmF7Jx8XT4gcK9lvuORPi1dDxKJ4nwbv55ZbSY5w6PDKhGpVaz5Hx+TLygWkj65gk4TnWO5Xw7cKPI4lTHgbpapas5A6mgI3jbBoGjfE0p8qhuFIXLwO5w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(6666004)(66556008)(66946007)(316002)(6636002)(66476007)(4326008)(478600001)(33656002)(86362001)(6506007)(186003)(6512007)(1076003)(26005)(83380400001)(8676002)(41300700001)(5660300002)(8936002)(6862004)(2906002)(6486002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ffRJ/wvkgMXwjZvyx2Gg2vi5O9kNwbjJvJmp5nNri5ejQJCO0ZN4MExlNTwo?=
 =?us-ascii?Q?EzAtknagL21Uj+KLA6S7xQctdXs7Kj7dJAxw1u9LnbGRkmflpgFYlgHGkiQC?=
 =?us-ascii?Q?fyf6s5EOaBlHuO2Atq7+V6Sfuxroniyzsu1lrn4VDJGMv4Ar8e5tkRvi0RCl?=
 =?us-ascii?Q?s3clpzXJddYHK3C9H85JoGwYy5pj8+p41c/EUdt/BJO38u/G/cbdZ9EtbH7o?=
 =?us-ascii?Q?Kw5r6seiQM/ZYA7tYp7UTrXL0yksmj2OSP7J9jOgmrOXTpHzOmpcd48AUGy7?=
 =?us-ascii?Q?EKWVPJ0xP130mG6eC6ELi3CUB6qdlzrgR+1J3L0oZfCsH/TLAK7CnZV+RBwZ?=
 =?us-ascii?Q?ExXFJlpEcpdX8IWqeuvEHtr8i33vJuDH4aCXMihfcdI2t7Q0/XBhsc3Ve+aY?=
 =?us-ascii?Q?4O3/LdUxraRJ4iyqk1ZGLlKhfouLiVWv1pBGvFebLipxCVe2q7Pl5nnUbIqC?=
 =?us-ascii?Q?Ej7aVyER63dN5/hwQwdeLNiRv8WNZ4lfGEGvFeVqQgMx5CBuyTKRx/I3/YGJ?=
 =?us-ascii?Q?sOyZsEJAVtLRtEPHZm63r3Taws7MDE6MtnaW28nGJkC8vCL0k+Oft/F5On5f?=
 =?us-ascii?Q?opxHhHT4rfwmMiP6gIkfLsivhVGqesxDM8k4NcLeuvFTPoqlt9qHUbEzTaHc?=
 =?us-ascii?Q?Y14IHqGimyeX9BzqJ83n1cxapy5qSwXMhjk6wQWqKKNkpBXlxZzzu2BjUgU8?=
 =?us-ascii?Q?8oEhKvAI91dq2lxY+pfGhGKZS+qXSsKg9+W8CShv2l0SewIHX2mkE7XUWVOl?=
 =?us-ascii?Q?badRuSVL6C9Ffp41YMWG9Wx39kD6S0obv/aOXNOEHfV6fOgPyRix6WM5c7Yy?=
 =?us-ascii?Q?DQZpL8IO68tFO2Xw6C6ZC3up0ec+pZuQs1qHFIejUms7OqPFvfHnx8+a8QTa?=
 =?us-ascii?Q?TBaQ4/52CgXwUFMHLkYIyAJ4soNTnQu2uHF3TVrWz68Te3br7qmlbLjzm5r3?=
 =?us-ascii?Q?Xc9Iey94IzSWq5JiIQir4PRxC1RjUtNDkdL+syYyAjX0rY4T/DLVO5inqNkk?=
 =?us-ascii?Q?S9UOA2EU0BJklqMAlapyuLKzRQvYjlwz7ddGxSUPvNkvUsS+BM6r/acTnri4?=
 =?us-ascii?Q?w33c337TCJP9gdVKvoO/MRAOFlOEWKDPHBC4QeLbVLw5XU6mT3D5L3kYh2fB?=
 =?us-ascii?Q?8nxjw5TV7o4AFs1qN/67I61+m9CUAS0xJu5FiFIV0+Ofk1jHusUrT8emXUr9?=
 =?us-ascii?Q?Dh5m2oKiNtcnxC8HoKfYlxYUTmMIthNLRbPrzf44QtWBTK3sYfNXTn6fxH0H?=
 =?us-ascii?Q?17UrfWNAEwjpd04HUmZjGP9xZ5iruzHjRxs3VTR6tc9w2adse7GDo1dBxVYV?=
 =?us-ascii?Q?tA32Haox8ukkZ7xnm0A7KOtx5ojM+HqUFKuzcSM/R8jo7a3KlNTctl70iz0m?=
 =?us-ascii?Q?uTd1xIn820o1qQNTzxHcCcX2gGaR4zg7YdSF8I8a5gKjMtSJndYGhZFlyqsE?=
 =?us-ascii?Q?z4UkflfliQe/UpDl+7yj4OPP9uAMConzYBDn6S+P9qaCTwUOgTpjWAAyL9Qq?=
 =?us-ascii?Q?R6UzOALSowxSVcKwYN2L1VHS0qMNHAZU1ZYnK0uEja8W/gf19AunXNNkhrwE?=
 =?us-ascii?Q?gR9QTetYAZ2UBxd7V3zaokHlpd4/G0rcUmXDoqXztLLAOPqMmWW+psm7PeaM?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97aea737-9f9c-4e74-5cdd-08db6d339ef1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 00:01:08.2766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHA44WOlj8i0054TJY8X5+wXdXL8JCfSmTuu7bY9+Go05rQwmzhGovf9sqFOdgj2waZXFPdUsmx6IYGkhFRLioEgXI5L4LCbygpzFw3i4ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers
 for MMIO functions
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
Cc: ofir1.bitton@intel.com, ohadshar@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:31:57PM +0200, Francois Dugast wrote:
> On Thu, Jun 08, 2023 at 10:35:29AM -0700, Lucas De Marchi wrote:
> > On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
> > > A local structure of function pointers is used as a minimal hardware
> > > abstraction layer to prepare for platform independent MMIO calls.
> > > 
> > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > Cc: Ofir Bitton <ofir1.bitton@intel.com>
> > > Cc: Ohad Sharabi <ohadshar@intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> > > drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> > > 3 files changed, 99 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 17b6b1cc5adb..3f8fd0d8129b 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -378,6 +378,9 @@ struct xe_device {
> > > 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> > > 	bool d3cold_allowed;
> > > 
> > > +	/** @mmio_funcs: function pointers for MMIO related functions */
> > > +	const struct xe_mmio_funcs *mmio_funcs;
> > > +
> > > 	/* private: */
> > > 
> > > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index 475b14fe4356..f3d08676a77a 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -25,6 +25,62 @@
> > > 
> > > #define BAR_SIZE_SHIFT 20
> > > 
> > > +static void xe_mmio_write32_device(struct xe_gt *gt,
> > > +				   struct xe_reg reg, u32 val);
> > > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
> > > +static void xe_mmio_write64_device(struct xe_gt *gt,
> > > +				   struct xe_reg reg, u64 val);
> > > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
> > > +
> > > +static const struct xe_mmio_funcs xe_mmio_funcs_device = {
> > > +	.write32 = xe_mmio_write32_device,
> > > +	.read32 = xe_mmio_read32_device,
> > > +	.write64 = xe_mmio_write64_device,
> > > +	.read64 = xe_mmio_read64_device,
> > > +};
> > > +
> > > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
> > > +				   struct xe_reg reg, u32 val)
> > > +{
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +
> > > +	if (reg.addr < gt->mmio.adj_limit)
> > > +		reg.addr += gt->mmio.adj_offset;
> > > +
> > > +	writel(val, tile->mmio.regs + reg.addr);
> > > +}
> > > +
> > > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
> > > +{
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +
> > > +	if (reg.addr < gt->mmio.adj_limit)
> > > +		reg.addr += gt->mmio.adj_offset;
> > > +
> > > +	return readl(tile->mmio.regs + reg.addr);
> > > +}
> > > +
> > > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
> > > +				   struct xe_reg reg, u64 val)
> > > +{
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +
> > > +	if (reg.addr < gt->mmio.adj_limit)
> > > +		reg.addr += gt->mmio.adj_offset;
> > > +
> > > +	writeq(val, tile->mmio.regs + reg.addr);
> > > +}
> > > +
> > > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
> > > +{
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +
> > > +	if (reg.addr < gt->mmio.adj_limit)
> > > +		reg.addr += gt->mmio.adj_offset;
> > > +
> > > +	return readq(tile->mmio.regs + reg.addr);
> > > +}
> > > +
> > > static int xe_set_dma_info(struct xe_device *xe)
> > > {
> > > 	unsigned int mask_size = xe->info.dma_mask_size;
> > > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> > > 		iounmap(xe->mem.vram.mapping);
> > > }
> > > 
> > > +static void xe_mmio_set_funcs(struct xe_device *xe)
> > > +{
> > > +	/* For now all platforms use the set of MMIO functions for a
> > > +	 * physical device.
> > > +	 */
> > 
> > 
> > what is "device" in this context? that seems confusing as we always ever
> > just support reading/writing to a real device (physical here may also
> > add to the confusion when thinking about SR-IOV and VFs).
> > We shouldn't add abstractions that are then never used and all platforms
> > end up using the same. Unless it's a preparation for a follow up series
> > adding the different handling.
> 
> For now "device" is meant as "in opposition to simulator" but I agree
> we can find a better name. Existing platforms all use the same
> implementation but this is preparation for platforms that require a
> different implementation.

I agree with Lucas that this doesn't really seem to be a good candidate
for a vtable; every platform uses exactly the same logic and I can't
really envision how/why this would need to change for future platforms
either, so this seems to just be adding unnecessary complexity.
Registers being accessed at some offset into a PCI BAR isn't likely to
change going forward.  On future platforms it's more likely that we'd
need changes to the part of the code that maps the MMIO BAR rather than
the code that reads/writes an offset into a mapping that's already been
setup.

> 
> > 
> > +Matt as there is still (at least) one refactor planned in this area,
> > since gt is not always the proper target for the MMIOs. He was saying in
> > his earlier series about having a mmio_view or such to abstract the
> > offset and other differences between each IO range. Not sure if this
> > series would go the rigth direction, maybe we need to think in both
> > cases together.
> 
> Matt, would this series block the refactor mentioned by Lucas?
> 
> In general, are there objections to introducing functions pointers for
> MMIO functions (extended to all of them, as suggested by Ohad)?

It probably makes more sense to do vtable conversion on other parts of
the driver where we already have different implementations per platform
and where we already know that design makes sense.  We can always come
back and do this to the MMIO functions later once there are actually
multiple implementations, but it doesn't seem to serve any purpose right
now.


Matt

> 
> Thanks,
> Francois
> 
> > 
> > 
> > Lucas De Marchi
> > 
> > > +	switch (xe->info.platform) {
> > > +	case XE_TIGERLAKE:
> > > +	case XE_ROCKETLAKE:
> > > +	case XE_ALDERLAKE_S:
> > > +	case XE_ALDERLAKE_P:
> > > +	case XE_ALDERLAKE_N:
> > > +	case XE_DG1:
> > > +	case XE_DG2:
> > > +	case XE_PVC:
> > > +	case XE_METEORLAKE:
> > > +		xe->mmio_funcs = &xe_mmio_funcs_device;
> > > +		break;
> > > +	default:
> > > +		DRM_ERROR("Unsupported platform\n");
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > int xe_mmio_init(struct xe_device *xe)
> > > {
> > > 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> > > 	const int mmio_bar = 0;
> > > 	int err;
> > > 
> > > +	xe_mmio_set_funcs(xe);
> > > +
> > > 	/*
> > > 	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
> > > 	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > > index 3c547d78afba..80ce9de7aac4 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > @@ -19,6 +19,13 @@ struct xe_device;
> > > 
> > > #define GEN12_LMEM_BAR		2
> > > 
> > > +struct xe_mmio_funcs {
> > > +	u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
> > > +	u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
> > > +	void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > > +	void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > > +};
> > > +
> > > int xe_mmio_init(struct xe_device *xe);
> > > 
> > > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > static inline void xe_mmio_write32(struct xe_gt *gt,
> > > 				   struct xe_reg reg, u32 val)
> > > {
> > > -	struct xe_tile *tile = gt_to_tile(gt);
> > > -
> > > -	if (reg.addr < gt->mmio.adj_limit)
> > > -		reg.addr += gt->mmio.adj_offset;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > 
> > > -	writel(val, tile->mmio.regs + reg.addr);
> > > +	xe->mmio_funcs->write32(gt, reg, val);
> > > }
> > > 
> > > static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > > {
> > > -	struct xe_tile *tile = gt_to_tile(gt);
> > > -
> > > -	if (reg.addr < gt->mmio.adj_limit)
> > > -		reg.addr += gt->mmio.adj_offset;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > 
> > > -	return readl(tile->mmio.regs + reg.addr);
> > > +	return xe->mmio_funcs->read32(gt, reg);
> > > }
> > > 
> > > static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > > static inline void xe_mmio_write64(struct xe_gt *gt,
> > > 				   struct xe_reg reg, u64 val)
> > > {
> > > -	struct xe_tile *tile = gt_to_tile(gt);
> > > -
> > > -	if (reg.addr < gt->mmio.adj_limit)
> > > -		reg.addr += gt->mmio.adj_offset;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > 
> > > -	writeq(val, tile->mmio.regs + reg.addr);
> > > +	xe->mmio_funcs->write64(gt, reg, val);
> > > }
> > > 
> > > static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > > {
> > > -	struct xe_tile *tile = gt_to_tile(gt);
> > > -
> > > -	if (reg.addr < gt->mmio.adj_limit)
> > > -		reg.addr += gt->mmio.adj_offset;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > 
> > > -	return readq(tile->mmio.regs + reg.addr);
> > > +	return xe->mmio_funcs->read64(gt, reg);
> > > }
> > > 
> > > static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> > > -- 
> > > 2.34.1
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
