Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC1C7EE2E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 16:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E5F10E2B0;
	Mon, 12 Jun 2023 16:32:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C2310E1A4
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686587538; x=1718123538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uwUD0crVMbWQyxHwiQJT4v5zXZpceu27q+I/Fmql8S4=;
 b=lkH73J5ys60s2zQaPxli9mAiS8Ba/DiV+E0zfsr3RAZlbfEn5FYHW1gx
 WMk5QWNLAay09TRhRwndJ0M1A30WrTdkyQbcF58Q5ZOI0n7fiL1fhbwGi
 1sj3IcYzir9SXZAoZ8my1+qZaSwp/WhPQ9YMn6h/c37oI5S7+7PdyBaXf
 XT5+oA/PfVOM/yy1kaHFstAc4IqSkQ20YmTMM90gtgdzIFBWjEee7cQ/J
 ARawkE59hOaiSLZ0wYj1bA++7bV5eN0eeZbkbxZsRBnYO8DaFASeo9KOT
 bxMR+LW2+yB577oJqt/qZqhFB+ng7Qk8c45EkiebM704WyzgkPzPw2Rjr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355593220"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="355593220"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 09:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="741084908"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="741084908"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 12 Jun 2023 09:32:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 09:32:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 09:32:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 09:32:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 09:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjnULnNfT+NyxDpUuN5Yj4N2BUth5CXgzla+eCVDV+q3vcwRRJicKxdv7v5PaoSKYedA7KeyMwxzIl2/nS5kwyfzvijKFdAvDhVP9GOx3h4caF6HEJQxmEJMfa21I0NXh1bnTSyjCSL97ErDWhYa97Ng6YxjWa0HqqjvNWr+TYRICpD5x9wztyYfb55WiLKQ1Zb/KzwF3FtxueMmb41Y63DjfWkZxBictgLCqZQ/sCWJWGOwvRi27u30kdoKG+Y8wEJC232hxSSoraTGid9YrMsTdfZlVu88dZnEYidvewXZMijm8RwtCMlSRRPfAddDgSK316yB6UCR1pMEwnCkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxCf3iEfcMWnNfd/5gFmNiVpwWIjfObzaS2r3E76kTQ=;
 b=VdbUF9c6lWUV2Ya4ZvMe0PegLBFaYcrHv9ZEEZhldsvyOiTerDhc0l5uhAxVxjRnKy8L5rduic2mr8xG/Q9HYD7+0r75fVLKkCLnjWmN31obPvX3WePNB5dh0LNwyKxLhAJmUIh0qrbC+C5O4d++DC6LZpRNRTBj+nYqAen/qL/qTzWMWWp9z1QqGd3z9vSf7/KXLyuwN4V7847nFr4wlONEYbRu0cSYJuo9rnpUNZRl8elsoyP6IJIPEaCy+qzfGSHMEEZjZENAdJmch5MDt0L3U88wCvJ701+JtsnAkv6JG2HpQ9IxBvXdu58sJGhv3dHGFXCoFDRCUPXV2ns99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 16:32:09 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%7]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 16:32:08 +0000
Date: Mon, 12 Jun 2023 18:31:57 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZIdIfdiClQ60fZSI@fdugast-desk.home>
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
 <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: e9304d3a-2a95-466f-7b99-08db6b629089
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wT5eGuiO9v6nyrzVRWHVhFuCekDV5oPosZKeLvRnsG9OUg27SabsmT5AnlCxK0uSR+3KLAaBDz/OxyJgaOnO/lcnmq39obTdF8Zyk4APIctE9fu92IRzY5FQ0SZLK+QH58iOHqSkXkZGeWR5npZKcHyHiZC7FqV480aSBYLLm9hXIUgQH6gkZc11+HfqL8nDEiEnG0cbER/upumxorIzzz5VtUI5zkDuEoG4w4L+okuvuQU3Z06V7FITJZ2SPcpiB6yDQK2y6i8X3tEPsocWdVy15boDLzksRKhXVXLu5BO+ehVZQkpozX8amvURH1vbmaog1WexhK2D69B4HD/knKaXxyoDtdOWSyXVMHqMJeRt2xtWlcOiDvVVyoWg6OtjZ+eS8wivvv9itK5z4sOYc3RiPQ0CBc+ze6SFzT2GUER4eBsZLd/yvLzoczjOupqPQq1Fh3hB0Er+TUE3Zvbru+B0zvWJZtDZGNjjLwu8zpqCippD0edv7hrCBFXdOm25IoQ6fBnkkjUHQIpTbfe6NLc7thILfcNzQzxP2vbsR1JBF7iCs+0QY1S1h+shN3zu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(66556008)(66476007)(66946007)(316002)(6666004)(107886003)(6636002)(4326008)(478600001)(86362001)(36756003)(83380400001)(9686003)(6512007)(6506007)(26005)(186003)(41300700001)(8936002)(8676002)(6862004)(44832011)(5660300002)(2906002)(36916002)(6486002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BmuQyQ7zrJvSpcW/4uB6WUggXT2RhilkzSEKsXq9iFqqgmS/SUbDm9IAez5l?=
 =?us-ascii?Q?w1u1+ygB2WpvC3cVUs9kbN3b+3O/8NG3dOP38LJBUTFkoyr9hOb49piQaokb?=
 =?us-ascii?Q?LsdDWLsbMZxhRkKJCaZzRp5WG19xXE7YrPZXx2CBaZff8AEPhvv8L8SBQCYD?=
 =?us-ascii?Q?r3IudzHod/xnsCiUdXvUtaKMKp+FjQyIbm0O8HpWv3xkfaYT4LAfdyPrsxjZ?=
 =?us-ascii?Q?pMyeIDIK6LAqhhGKJZaYbnH1liB0aJB5ocy6yN63jxvV4ISQdw/19GiFBTwF?=
 =?us-ascii?Q?tW6nt5X/seGw+PUVTQcg4xRAHrG455qi6FAVJ7WfOpDOvlU5jH88G7BKIxae?=
 =?us-ascii?Q?wQFXRxgy19cn1M2XMAeEBOY0i11BiB8bh+Zv8vbqcSb/n8QEOiyWp++6xCRN?=
 =?us-ascii?Q?DZM5ZOUD0KtzQBU1YH//BDLWXPTu/wEfbHzefKwqRAfLkfGXAylKPe32gvXY?=
 =?us-ascii?Q?ODOhWSQO9CqLlWKjHxURaUvlUzPnp2oHXBj2cPfrF0bqR2EuUT32doyxu2m7?=
 =?us-ascii?Q?oYjVsR4/lbkxWAQE6pg/o9XTnGTDd0zetT05Y6fLntuHRtdFODcq2OtTeAxq?=
 =?us-ascii?Q?8DRmAqBc1Xigh6ewSMQ9XjQZKlCTi8s5QSFl8Oms66i4fs1V+UlGIUDdba20?=
 =?us-ascii?Q?EphFkCNQU7IVixrqY58ZcJxJ/MaNm1pQV4dFZrJpcecOsDQZQjgkKnaUZhAc?=
 =?us-ascii?Q?OZUrDGBmB0cDGuRHee4c9RBmwPfPN7GSl49HNy8vO/wQC+2xkP+WwHMBxFep?=
 =?us-ascii?Q?UxvvNP42xF5iBc5OVEBRsbGZKjDnzFUepqsdCZuTQAppSl+hWlYSls+H5z88?=
 =?us-ascii?Q?WLPlSv0uyp9596/oOsWIcmDwD334gwuHHMMXyEc6qOnKmWioQ0SDkY36IePc?=
 =?us-ascii?Q?dvI3vSXtiM+6CnF4biOHRXep/0t2myJYTJmurOocCzB3veN+cYNRw3pH15z1?=
 =?us-ascii?Q?b46eNL1oKzUQYtQmrQl6jQ9m0gmlci6tj9AaEZhVjWqVZ9uloC6s31aT732R?=
 =?us-ascii?Q?sUArxgTL9TW7OjH4dFMp1P69WVU0qcloI6D+y/2Hn3trWqH11iiJsURUDd9Y?=
 =?us-ascii?Q?XFn6RzzYbbA6M1yar4HGgNDKx6sZe0uLvkpwgog9Bjas2skvchy0B0Ngbwqz?=
 =?us-ascii?Q?vq6c0UoYIoy7gDC3QS5kTxpLQCbmjqqrtkCmZt4goDdUWYq77lnJLA6KErX3?=
 =?us-ascii?Q?/5iZoqgCyNZnvPC3NJei1QsOvdpxOS8ffVjDiKWQAXUYwX+hxQtpGw1wfmBL?=
 =?us-ascii?Q?L8p1MhzLox0mRZGS24/thQLO77Jos2JhxVMigHDd17BarYEsJmeMx63d0XJd?=
 =?us-ascii?Q?/GxLNnaWvSLo8RZm59It5pN7OEw+RDoCT5YcY3vYq98khYYbfTXKMwgQu0jC?=
 =?us-ascii?Q?7vgj9BHWGXJ98WzkSe/qxMf59AAei98Z0zPU1u8qF7SCibnj6ZuAYVJPNiPI?=
 =?us-ascii?Q?VnQ3zztV0/5BaUxRmjyh7ehj92ijOve28CFvSASTpnYa5j/JKdzTC0tccVve?=
 =?us-ascii?Q?dwGndVJrMl0/dkQuOjWiDkweTYCs4gvd9k0VXRgkkEgZwlOaCUq2Tf1CBL0c?=
 =?us-ascii?Q?lT3Jd7pHVDpN1Ll4rfzcl4IdnRNGgjM+Ju28fZtJL5uDoYJp+mMcrCOqjX6k?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9304d3a-2a95-466f-7b99-08db6b629089
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 16:32:08.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oo2n/NZ1iEdQBuCgShXodHXreNM0EPWbYzMA546JSBH1YGQEaZIDS+uZIQUwLbNk/hQvQmIabvXmVjpNPa1bKP7KLDVyl8bAqeUHjYew9xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 10:35:29AM -0700, Lucas De Marchi wrote:
> On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
> > A local structure of function pointers is used as a minimal hardware
> > abstraction layer to prepare for platform independent MMIO calls.
> > 
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Cc: Ofir Bitton <ofir1.bitton@intel.com>
> > Cc: Ohad Sharabi <ohadshar@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> > drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> > 3 files changed, 99 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 17b6b1cc5adb..3f8fd0d8129b 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -378,6 +378,9 @@ struct xe_device {
> > 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> > 	bool d3cold_allowed;
> > 
> > +	/** @mmio_funcs: function pointers for MMIO related functions */
> > +	const struct xe_mmio_funcs *mmio_funcs;
> > +
> > 	/* private: */
> > 
> > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 475b14fe4356..f3d08676a77a 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -25,6 +25,62 @@
> > 
> > #define BAR_SIZE_SHIFT 20
> > 
> > +static void xe_mmio_write32_device(struct xe_gt *gt,
> > +				   struct xe_reg reg, u32 val);
> > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
> > +static void xe_mmio_write64_device(struct xe_gt *gt,
> > +				   struct xe_reg reg, u64 val);
> > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
> > +
> > +static const struct xe_mmio_funcs xe_mmio_funcs_device = {
> > +	.write32 = xe_mmio_write32_device,
> > +	.read32 = xe_mmio_read32_device,
> > +	.write64 = xe_mmio_write64_device,
> > +	.read64 = xe_mmio_read64_device,
> > +};
> > +
> > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
> > +				   struct xe_reg reg, u32 val)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +	if (reg.addr < gt->mmio.adj_limit)
> > +		reg.addr += gt->mmio.adj_offset;
> > +
> > +	writel(val, tile->mmio.regs + reg.addr);
> > +}
> > +
> > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +	if (reg.addr < gt->mmio.adj_limit)
> > +		reg.addr += gt->mmio.adj_offset;
> > +
> > +	return readl(tile->mmio.regs + reg.addr);
> > +}
> > +
> > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
> > +				   struct xe_reg reg, u64 val)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +	if (reg.addr < gt->mmio.adj_limit)
> > +		reg.addr += gt->mmio.adj_offset;
> > +
> > +	writeq(val, tile->mmio.regs + reg.addr);
> > +}
> > +
> > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +	if (reg.addr < gt->mmio.adj_limit)
> > +		reg.addr += gt->mmio.adj_offset;
> > +
> > +	return readq(tile->mmio.regs + reg.addr);
> > +}
> > +
> > static int xe_set_dma_info(struct xe_device *xe)
> > {
> > 	unsigned int mask_size = xe->info.dma_mask_size;
> > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> > 		iounmap(xe->mem.vram.mapping);
> > }
> > 
> > +static void xe_mmio_set_funcs(struct xe_device *xe)
> > +{
> > +	/* For now all platforms use the set of MMIO functions for a
> > +	 * physical device.
> > +	 */
> 
> 
> what is "device" in this context? that seems confusing as we always ever
> just support reading/writing to a real device (physical here may also
> add to the confusion when thinking about SR-IOV and VFs).
> We shouldn't add abstractions that are then never used and all platforms
> end up using the same. Unless it's a preparation for a follow up series
> adding the different handling.

For now "device" is meant as "in opposition to simulator" but I agree
we can find a better name. Existing platforms all use the same
implementation but this is preparation for platforms that require a
different implementation.

> 
> +Matt as there is still (at least) one refactor planned in this area,
> since gt is not always the proper target for the MMIOs. He was saying in
> his earlier series about having a mmio_view or such to abstract the
> offset and other differences between each IO range. Not sure if this
> series would go the rigth direction, maybe we need to think in both
> cases together.

Matt, would this series block the refactor mentioned by Lucas?

In general, are there objections to introducing functions pointers for
MMIO functions (extended to all of them, as suggested by Ohad)?

Thanks,
Francois

> 
> 
> Lucas De Marchi
> 
> > +	switch (xe->info.platform) {
> > +	case XE_TIGERLAKE:
> > +	case XE_ROCKETLAKE:
> > +	case XE_ALDERLAKE_S:
> > +	case XE_ALDERLAKE_P:
> > +	case XE_ALDERLAKE_N:
> > +	case XE_DG1:
> > +	case XE_DG2:
> > +	case XE_PVC:
> > +	case XE_METEORLAKE:
> > +		xe->mmio_funcs = &xe_mmio_funcs_device;
> > +		break;
> > +	default:
> > +		DRM_ERROR("Unsupported platform\n");
> > +		break;
> > +	}
> > +}
> > +
> > int xe_mmio_init(struct xe_device *xe)
> > {
> > 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> > 	const int mmio_bar = 0;
> > 	int err;
> > 
> > +	xe_mmio_set_funcs(xe);
> > +
> > 	/*
> > 	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
> > 	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 3c547d78afba..80ce9de7aac4 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -19,6 +19,13 @@ struct xe_device;
> > 
> > #define GEN12_LMEM_BAR		2
> > 
> > +struct xe_mmio_funcs {
> > +	u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
> > +	u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
> > +	void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > +	void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > +};
> > +
> > int xe_mmio_init(struct xe_device *xe);
> > 
> > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > static inline void xe_mmio_write32(struct xe_gt *gt,
> > 				   struct xe_reg reg, u32 val)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -	if (reg.addr < gt->mmio.adj_limit)
> > -		reg.addr += gt->mmio.adj_offset;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	writel(val, tile->mmio.regs + reg.addr);
> > +	xe->mmio_funcs->write32(gt, reg, val);
> > }
> > 
> > static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -	if (reg.addr < gt->mmio.adj_limit)
> > -		reg.addr += gt->mmio.adj_offset;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	return readl(tile->mmio.regs + reg.addr);
> > +	return xe->mmio_funcs->read32(gt, reg);
> > }
> > 
> > static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > static inline void xe_mmio_write64(struct xe_gt *gt,
> > 				   struct xe_reg reg, u64 val)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -	if (reg.addr < gt->mmio.adj_limit)
> > -		reg.addr += gt->mmio.adj_offset;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	writeq(val, tile->mmio.regs + reg.addr);
> > +	xe->mmio_funcs->write64(gt, reg, val);
> > }
> > 
> > static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -	if (reg.addr < gt->mmio.adj_limit)
> > -		reg.addr += gt->mmio.adj_offset;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	return readq(tile->mmio.regs + reg.addr);
> > +	return xe->mmio_funcs->read64(gt, reg);
> > }
> > 
> > static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> > -- 
> > 2.34.1
> > 
