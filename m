Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A20C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 13:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE6A10E13A;
	Tue,  6 Jun 2023 13:25:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8A510E13A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686057905; x=1717593905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V8cugtC5uaUAh+tESkL/WYhaLlB9EMkhZL0SO2ZXY2E=;
 b=jGLWQnRcBCcmPDuH5luimb5OHfZ/GqFMXj58hYAXR4SSocafMuBKvovL
 FQ06rxJ89/x+spQq2FBdj9h2121zE1EBEFCdf/kaFdge5bYTjSpeNhwW3
 qKuWsGBO+4jdX++BYuFi9qeskx2LBTwtSLEncKnBq2DWGslHSAlx3OFzY
 JJGbvaMX8+b6DJByOXwG9LDAHyPcqCYWaca7jDgUs/bI+9c/Ix3IcB9jM
 Rbx1qlxzFIWMAtEuDUpdqR0mFRxMxZKLKtg3Mh928syxa2TMBLZuaKlJF
 wVrHjxFwBIE91ah/+ubUmAxWx8/61Etc8pz87d0fVXis89UyQNKd0cHjn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355524472"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="355524472"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955745734"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955745734"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 06:25:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:25:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 06:25:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 06:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyZko2PqRvLrObw2DOFY2KPTP9989ih323v3q85bQPXB5iWIVoYrJG++L+fdarfA/ggovmwZ05slsAjskxUtYVX7cdfGeWxRrLhgAFRmIkbunA0LIls1e87NnKxUZzw9LSWS5dlt3twUdH3JzUcK6CuIh48DnkKUhXcxiX/+ASwzA8O3h3KqbxO/RQI+0Gr/OonBGhSKYnbLgYPy5ev22R8V224gMcTvu8mpxjNPoTbr8sfD3nFy4oqIKq7Ev10Ltkyq1MKMphNaMi+HXzXP1PQwldniWf4utVkrXhHkaya5Jhr1HBqVqkYKNg4U6OIZNPAkqe66F8dmNcDHXSR1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HMaV6VEJwRf4jwdVNHVSmK19jdzpIKk0QarmiPtv6w=;
 b=ZJimoDLy4BHv/5mlxgAJ0v2ETuEoDNl/NyjryKjKy9srQaWup7OMSdKJnvR4LemqE9pIb6yCERmk3h26OmYtYGyqUmfmUxpr6i52NFH04rn0GcnPcZvfmp5vz2kN9Lk+TuVJlM5Oy9IQb1XXO2MpRvTVHW4U4M1Xr3AYdzyRuXltZQLlbwZwd2oZyPky57/r0DxtsoXPYXef/whETNf2Q9o/QrkozY8iJrt42HFKJxTiF6qQwGhastRCuci6TF82+qEu7PYZWtF/LuMameRq2AOClmEjfRVREvFxUZJ3HKinVP0gij3w8cQL6TW8meXv4b5Bee1zdSIjrLsiZmr3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 13:24:59 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 13:24:59 +0000
Date: Tue, 6 Jun 2023 15:24:51 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
Message-ID: <ZH8zoyD-yrQE4AUR@fdugast-desk.home>
References: <20230602142501.6-2-francois.dugast@intel.com>
 <fbab997a-ad07-38cf-fd93-1c8b42f6cec6@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fbab997a-ad07-38cf-fd93-1c8b42f6cec6@habana.ai>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ebc2be-f49a-4645-0a2e-08db66916cea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0l8vgYOaFhxfx2otOdwTU/2Cw/vvltAvAkZChP9SFc4T8eiJDq8eONb4i/iZzOG65pXAN69wX8pgu1t4Ns6GAE47rWj2cWwmMLoAp2keBdX7L2Ez6i/px01RpCzu8OgOjhD7+kHsGeJNQGBOJiyRrkZXJNR4r+WSbkihw5747msWIO2AwfAgPLW84MQG+9u/eCMmvfAGa42DMakkM0dMsKrC0ChI2/H6LNcQuQdyxravLJGQ8xDSBVWT0I3yRQp7PxX/ukJk0Vvytz+JHk40j/9TdxeWWrv6NfvsTbESxeuBSdQeLaXFXW/DLNm3JjNgPyPtPvHDkOpiVcN/7wqYBA5oPzn2orHVzmonSLZ8lDZOlqmNm03/aPyVzc7KiccV7sTDkI/lzcWNsRiNTSsMz426yFXHnr7TTKWHP/o/uDjjcF1krm/8H1VGMg37CxgF2ri2K2jQJlsJBP2Wnkalpr9X37qzuNKsgwjIy5Ry1VCVWipmWxEnZUjyXQlzhLMMrHFhnrNzmKXl+juTeA2inw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(54906003)(478600001)(6916009)(44832011)(8936002)(8676002)(2906002)(36756003)(86362001)(5660300002)(66556008)(4326008)(66476007)(316002)(66946007)(82960400001)(38100700002)(6506007)(41300700001)(53546011)(6512007)(107886003)(9686003)(26005)(83380400001)(186003)(966005)(6486002)(36916002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TV84KHwj9VjA3AgsWnE+2E2omDJgWdL8W7XNYF27UMxO7cz12Y7vgJk7FIJN?=
 =?us-ascii?Q?FKO1dW9+SIj6Jr3XiZ7k0scs8wm+gwNvB6SeCqpU+neFOISPcIiCKVJaObED?=
 =?us-ascii?Q?a4pyIwm3i46KCFiP77GxmYGhcfI2RWQ7L5JSfVMKOJVIEjTxh2pMYh1A+weU?=
 =?us-ascii?Q?7lLHtOw+hLEKN7h9X7VCa6NQUvU7ARNTsWXkOsvSzx7JBplYc9aLyhp7/w+Z?=
 =?us-ascii?Q?EF4rTEYfjqJy0XpC1OxFufEWB00c7g41MVdhyhuwY/jIDTdPwiZ2RnjHxDBe?=
 =?us-ascii?Q?9lViERPfGK8QjCQyUBIGzokN9lnjRfD5C4ZeAQDrKbbrU3Kt0g7qby2YnFd8?=
 =?us-ascii?Q?HLrsuftsVf0y6c6421PbZdEfVJdAYWB2CgrASjNxBlcxYO6e6UIGRHhyTV0V?=
 =?us-ascii?Q?iZH8s+PnDXaKLtzKXOlGJMDW0yvQYCF9CiBapIb4nVq51rxT3l4QzKe6UclN?=
 =?us-ascii?Q?OhfA1V3h4fBHxEPxOoR81b/VTsPNMmd88UGicxT13uTwGxrzBS3sgtw/sH3i?=
 =?us-ascii?Q?IqvNHS2HiVtmKZit5HGwBKQJik0r/qCXByVIv261kxZlstebDLSFkJ4cLqdU?=
 =?us-ascii?Q?a5EOhoXKrnYMGmIY+DSuI8V073p0M5MH32cBcvHhyhgH3lw6EAa1YRTJCEPt?=
 =?us-ascii?Q?iLqW2B3KOjmhtf7NisVxJ4ibSl4KTjAmnZaIwSH6eVVTuyP6lImMlT7JPHI1?=
 =?us-ascii?Q?QqhteHK1sE+wR7livjlTqOPQ+KKzYIZd1+5GJ7qR2F4neUDXivOy/clo9239?=
 =?us-ascii?Q?OTaT8pd0kMKAuVfuUdM5RpT3RMvGY6+9EIsawhxmkdmwAuiTgv7Nzasyoktj?=
 =?us-ascii?Q?OkMTK6UQI62CsHxGLpOm1Zy54Mmu6hWB5WVrImK/+EPR0vzH4fksE57xgziR?=
 =?us-ascii?Q?pRcjxQ02eezCta4zE2M6JoWGb1Y7zALcqR7019drqrS3JA3FSFd4Df9yHVEM?=
 =?us-ascii?Q?s+QagTfjhirEEyJv23VSKT5nP24MlptVXWVtCCt9fyvBWdpfD9xFPtq96myb?=
 =?us-ascii?Q?81hiI1HB/ezq6D1DCmN5oNB+jbAmbB66tRyYEQMEiLu7snBBV6dtEM94XOdU?=
 =?us-ascii?Q?eeMxtKxE2O3rdcKREhE41ACWvuMuPnI9ZRd0KiiWxCWDXxC7sxuL0xhX+xco?=
 =?us-ascii?Q?ag5UhJDV5gDbsI6JyTZdYh3SR4+hWLBMh/ocgRge+94fF7RfC9bQRYP1lqrC?=
 =?us-ascii?Q?+waq+qsnQmXkWDy5PCNhc5fqM5Z3DoivzIKq8am73scBqw1le8c5iNu2OubQ?=
 =?us-ascii?Q?IQBoeuehEoDS5ddHG91a4CtD8eEdZ4Ib6rmKvZoBIvlUQpDfbzNyEEtcOx5f?=
 =?us-ascii?Q?85Wzjuh0YcwVS2oNBfRZ90YyazaTPD2OdBIr4McpW+9QSTx4LXO0D9v9rmK0?=
 =?us-ascii?Q?iSxuBGn7WCfydfN+B/E4CyjDZDXdpQTv3tDyN2XjNqxtxu4bUqS5jGFbiwCu?=
 =?us-ascii?Q?8OZ3nNl5dym8G1L0i67dOfXcU4muZ61OP1QQ1BBDATioMna7V+XdU+NAblUI?=
 =?us-ascii?Q?3JMGjSU2eTHCdk0bgFTMOoL0tJGDEly27x8vf2wKZ/5Af4WVP5q66RX0JNlv?=
 =?us-ascii?Q?/mH1Mwpbg1NH92PeMf30gV8cOW954LhLgtd4K0RDNUgOtEWIBBYK7k9EkXkY?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ebc2be-f49a-4645-0a2e-08db66916cea
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 13:24:58.9121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnVD+u+oIiVQQwTiiAycWJXq5hYbXlFYsFwLkVRnzfyC1NxRAacVD9k5oYKPRQ+giJnudufjuda9CI9gNraqZwqN+6G1r+OpMHbfwUqEofo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC,
 1/1] drm/xe: Introduce function pointers for MMIO functions
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
Cc: "Bitton, Ofir1" <ofir1.bitton@intel.com>, "Sharabi,
 Ohad \(Habana\)" <ohadshar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 06, 2023 at 12:09:34PM +0200, Ohad Sharabi wrote:
> On 02/06/2023 17:25, Francois Dugast wrote:
> > A local structure of function pointers is used as a minimal hardware
> > abstraction layer to prepare for platform independent MMIO calls.
> >
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Cc: Ofir Bitton <ofir1.bitton@intel.com>
> > Cc: Ohad Sharabi <ohadshar@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> >   drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> >   3 files changed, 99 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 17b6b1cc5adb..3f8fd0d8129b 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -378,6 +378,9 @@ struct xe_device {
> >       /** @d3cold_allowed: Indicates if d3cold is a valid device state */
> >       bool d3cold_allowed;
> >
> > +     /** @mmio_funcs: function pointers for MMIO related functions */
> > +     const struct xe_mmio_funcs *mmio_funcs;
> Do we really want to divide the FP structs to such fine-grained resolution?
> 
> Can't the MMIO be grouped as part of GT functions which can later host
> other FPs as well?
> 
> Or do we think that all other GT funcs will, probably, be "common to
> more components" and so define a special struct for it?

Sure, it is possible to use broader FP structs which would contain more
functions. Actually, it was explored in the first revision of the original
series: https://patchwork.freedesktop.org/series/114630/#rev1

The concern is that we might not be able to correctly predict where future
platforms would require specific code, which means we could end up having
very large FP structs with dozens or hundreds of functions.

This is why in earlier discussions we leaned towards having multiple FP structs,
each local to a domain or to a .c file, like in this patch for MMIO.

> 
> > +
> >       /* private: */
> >
> >   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 475b14fe4356..f3d08676a77a 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -25,6 +25,62 @@
> >
> >   #define BAR_SIZE_SHIFT 20
> >
> > +static void xe_mmio_write32_device(struct xe_gt *gt,
> > +                                struct xe_reg reg, u32 val);
> > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
> > +static void xe_mmio_write64_device(struct xe_gt *gt,
> > +                                struct xe_reg reg, u64 val);
> > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
> > +
> > +static const struct xe_mmio_funcs xe_mmio_funcs_device = {
> > +     .write32 = xe_mmio_write32_device,
> > +     .read32 = xe_mmio_read32_device,
> > +     .write64 = xe_mmio_write64_device,
> > +     .read64 = xe_mmio_read64_device,
> > +};
> > +
> > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
> > +                                struct xe_reg reg, u32 val)
> > +{
> > +     struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +     if (reg.addr < gt->mmio.adj_limit)
> > +             reg.addr += gt->mmio.adj_offset;
> > +
> > +     writel(val, tile->mmio.regs + reg.addr);
> > +}
> > +
> > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
> > +{
> > +     struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +     if (reg.addr < gt->mmio.adj_limit)
> > +             reg.addr += gt->mmio.adj_offset;
> > +
> > +     return readl(tile->mmio.regs + reg.addr);
> > +}
> > +
> > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
> > +                                struct xe_reg reg, u64 val)
> > +{
> > +     struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +     if (reg.addr < gt->mmio.adj_limit)
> > +             reg.addr += gt->mmio.adj_offset;
> > +
> > +     writeq(val, tile->mmio.regs + reg.addr);
> > +}
> > +
> > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
> > +{
> > +     struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +     if (reg.addr < gt->mmio.adj_limit)
> > +             reg.addr += gt->mmio.adj_offset;
> > +
> > +     return readq(tile->mmio.regs + reg.addr);
> > +}
> > +
> >   static int xe_set_dma_info(struct xe_device *xe)
> >   {
> >       unsigned int mask_size = xe->info.dma_mask_size;
> > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> >               iounmap(xe->mem.vram.mapping);
> >   }
> >
> > +static void xe_mmio_set_funcs(struct xe_device *xe)
> Wouldn't we like to fail the MMIO init on an unsupported platform?

Yes I will fix that.

> > +{
> > +     /* For now all platforms use the set of MMIO functions for a
> > +      * physical device.
> > +      */
> > +     switch (xe->info.platform) {
> > +     case XE_TIGERLAKE:
> > +     case XE_ROCKETLAKE:
> > +     case XE_ALDERLAKE_S:
> > +     case XE_ALDERLAKE_P:
> > +     case XE_ALDERLAKE_N:
> > +     case XE_DG1:
> > +     case XE_DG2:
> > +     case XE_PVC:
> > +     case XE_METEORLAKE:
> > +             xe->mmio_funcs = &xe_mmio_funcs_device;
> > +             break;
> > +     default:
> > +             DRM_ERROR("Unsupported platform\n");
> > +             break;
> > +     }
> > +}
> > +
> >   int xe_mmio_init(struct xe_device *xe)
> >   {
> >       struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> >       const int mmio_bar = 0;
> >       int err;
> >
> > +     xe_mmio_set_funcs(xe);
> > +
> >       /*
> >        * Map the first 16MB of th BAR, which includes the registers (0-4MB),
> >        * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 3c547d78afba..80ce9de7aac4 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -19,6 +19,13 @@ struct xe_device;
> >
> >   #define GEN12_LMEM_BAR              2
> >
> > +struct xe_mmio_funcs {
> > +     u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
> > +     u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
> > +     void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > +     void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > +};
> > +
> >   int xe_mmio_init(struct xe_device *xe);
> >
> >   static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >   static inline void xe_mmio_write32(struct xe_gt *gt,
> >                                  struct xe_reg reg, u32 val)
> >   {
> > -     struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -     if (reg.addr < gt->mmio.adj_limit)
> > -             reg.addr += gt->mmio.adj_offset;
> > +     struct xe_device *xe = gt_to_xe(gt);
> >
> > -     writel(val, tile->mmio.regs + reg.addr);
> > +     xe->mmio_funcs->write32(gt, reg, val);
> >   }
> >
> >   static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >   {
> > -     struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -     if (reg.addr < gt->mmio.adj_limit)
> > -             reg.addr += gt->mmio.adj_offset;
> > +     struct xe_device *xe = gt_to_xe(gt);
> >
> > -     return readl(tile->mmio.regs + reg.addr);
> > +     return xe->mmio_funcs->read32(gt, reg);
> >   }
> >
> >   static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> >   static inline void xe_mmio_write64(struct xe_gt *gt,
> >                                  struct xe_reg reg, u64 val)
> >   {
> > -     struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -     if (reg.addr < gt->mmio.adj_limit)
> > -             reg.addr += gt->mmio.adj_offset;
> > +     struct xe_device *xe = gt_to_xe(gt);
> >
> > -     writeq(val, tile->mmio.regs + reg.addr);
> > +     xe->mmio_funcs->write64(gt, reg, val);
> >   }
> >
> >   static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >   {
> > -     struct xe_tile *tile = gt_to_tile(gt);
> > -
> > -     if (reg.addr < gt->mmio.adj_limit)
> > -             reg.addr += gt->mmio.adj_offset;
> > +     struct xe_device *xe = gt_to_xe(gt);
> >
> > -     return readq(tile->mmio.regs + reg.addr);
> > +     return xe->mmio_funcs->read64(gt, reg);
> >   }
> >
> >   static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> >
> >
> This approach should work for us- thanks for the effort.
> 
> I do think that if loading this data from the descriptor is acceptable
> let's do it soon to avoid collection of all "switch-cases" from the code
> while other FPs are being added (really not necessary at this phase- we
> want this patch merged soon).
> 
> Thanks,
> 
> Ohad
> 

I think we should be able to add this in the same series, but first I would like
to get more feedback on this RFC before moving forward.

Thanks,
Francois
