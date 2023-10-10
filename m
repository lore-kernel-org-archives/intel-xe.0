Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE699CD8CAE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 17:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE56010E3B2;
	Tue, 10 Oct 2023 17:50:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAF110E3B2
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696960230; x=1728496230;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w9hLRGw1P7Z8uMaoFwzdHFE5SdkSfY06OWgPkRrEW7o=;
 b=CL3CoIxapFrRI6Hq3eIdY4XU6rebd34kpkHss/lGPcgd4q7BQehVgvaN
 CUZd8STblE06bS14IXG/xkL7SJ+NXe5X9DCjBPkF5qwjBkAaQnV9bfB6s
 AH6OtyoiRaKqzhRjWqmv5Jozw7GXc3s8FmmSR29EgnDe+y1Y2qKEBHPMM
 O/isamYDBRbcrljuCHwdTB37GXBZgh7FwJCpGEyDVWztDCwiWR5v5S69Q
 vLH0ZUs96W6MNPlIlUxzhNRmJQgLktf4VNrFqdNzVo/EdEE4lf5RgiBT2
 j2Ed0MTbhrUusqgLKuwnGGmur4tFHZT+k0tcL8KjTqU9rW7Skz+L6sdAb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384323072"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="384323072"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 10:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703392779"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="703392779"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 10:50:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 10:50:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 10:50:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 10:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhVMojyesbZF8O51valWAiFxtD7hNa5MLxUKQyXZEmG8ys3QHyQjDXS5CiL651dt8glhneWbvg9YGx3NI7QSOJ0z3GNiWMLwKitE3IuDX7gt8Rd5XuFbnbvrbkadkMgnM42tVMsheAt6un31cganFsJ+QFRBCDJ00LbccZRyKE/SV2LnTXz+TOAeb5SUznn2rrmYKqM/wofF2P47RbTXzYZHm5ySSZZkBsws4T5n9VTlNxwAetgbSiQmbVlYblm/xJJ1dkKKyD+snJ1l32BcQGNRbdflWuP5TxQ8YGCDllL42BOM9i1HdqjIWsKTaIkSSVWyIf3BJlxnWuo5FKtp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWS3T5Cu1XrsohQjnqlTj5Hvnl6QXubZqo4ReNxoLRo=;
 b=iz+5+v2qGA0V2IwGAYLUKkH1c3IX+xcNSNyHVgIC1A34MxUJl5hlj9lYo2W+osxELWGvm0u7wl5LUw/N8UfwvB4fSYqXkeMm0itwuR8lZF3L8igLfLduROSWMtLUUX7n2BsGp7L/+Nb+JDIaftVONnELk2BcB3yoegty5l1D27HcT7ziwkh7mnh4Cx+DX88O8HLeFaCGQs0RzT9EcmwVSPiPj7AWBW52cRDSWz2WdY7N9aPEKwNUHcLfhBt0uYKj0U7uKKJEX46cIaPrnUBSKwrSsIX3NWVwqhaiZJRTnhOHdUejrkOR6Fc/gdJxU+K+hDxOqLmgWgE9uNYwr464Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Tue, 10 Oct 2023 17:50:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 17:50:00 +0000
Date: Tue, 10 Oct 2023 10:49:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20231010174957.GH5757@mdroper-desk1.amr.corp.intel.com>
References: <20231009202149.245718-1-jose.souza@intel.com>
 <20231009202149.245718-3-jose.souza@intel.com>
 <20231009232323.GE5757@mdroper-desk1.amr.corp.intel.com>
 <e1ce2948a1a62cfbd14a3c98544fcc01fc52fbb5.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1ce2948a1a62cfbd14a3c98544fcc01fc52fbb5.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b76f51-d244-4ded-7f9d-08dbc9b952e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUepJhMJg+fWURiez9ofWCSAe8fQWOpYQs1mHtyl3VeMkrfkj0DNVUIZ64fXKV+PtMWLYmGxn+hzUEOHA0I/v6tdy02duGoZSVjCkCmEJyO8LmqqcDuhNMu7hVBG0CInj1i0Og4PnCdoXOquJpdrFbXqCpyT5fIrz1ZZz3dQ4lMl/syRYquyEj9yKL5l64662d3bCNm5zr8nHZeXmXIV6E3MhorEw9FPmNUU4jgeEZoKAww/ka2FOF1joJXFZVH8Eu8AYoOToiy0kWkti+3U3bYPvn9WpG8Ppx3vqbeP0I+5lmvtLTkQ8rVRoh5QM+CpyOgo/BARWuyIezEZVEk7Es4xDThsP7V+VEwnOZQYM+3baXkOVZdqx0U3C0jns+gRuSkuWDa4XquKsHnlxEgmXMo3rBevnNHfHKlTaGs2fWIAtU/y4Spbp3F5dEGa+aHoG3cddDnzqITL5xYGJB33YBU8pgWO4ZBtDwfoDzPO5j96MNSSwhYcq0lzdFgsn7BEaAfrxKqmJiGhR4OE7gZLLZwQqSNBvS3521etmjclzV5mC8SjSKc4el+ja2VMHC1i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(107886003)(6506007)(1076003)(316002)(478600001)(41300700001)(6486002)(30864003)(83380400001)(2906002)(66556008)(5660300002)(66476007)(54906003)(6636002)(66946007)(4326008)(8676002)(6862004)(8936002)(26005)(82960400001)(38100700002)(86362001)(33656002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Meuz+8UE65dAh1WzfQ+3Ivn3THFzzm6iXFpsbCkdmcbHK7aJXmngc+X2l6?=
 =?iso-8859-1?Q?To9Dyy3sHIxgatUXxpbThNd9DJmHnyyndE78SY/IPGwPV6PcP6t3G9LG3M?=
 =?iso-8859-1?Q?M7N7VZXWSANHyMohrmUlnq8E7M8MLu50AQvSyTIr/zAaJqIpNU6XEmNqqO?=
 =?iso-8859-1?Q?r6YxOCzHT5NUsC77833X8a1GUq9g3Z7YdH37JJj1l7YxJTd+jbr5QNTa9R?=
 =?iso-8859-1?Q?mkNBeOxOCmCRrVK9ZIqrdFT7517dAAO8shKx6ArgRm/vaG0WVz0UjfzaYA?=
 =?iso-8859-1?Q?Xm90sqBdSPD1K8M+3F7O/TqhnoHu2xb4GDFLPH0MTo03c+H5kfJLTev0Vl?=
 =?iso-8859-1?Q?RmH90L6Won9sMyzcSLmi5ufM8zY9NU//JwpyyeHRxNn9jiweHGciw9KiGK?=
 =?iso-8859-1?Q?UyxmFuACSofFzvf7Go+S8huU2neEl9BFqCNuV8DTs4zGVAOZBladDM9wHl?=
 =?iso-8859-1?Q?mx7KtqIKrdTR4ATh22p9GFgSQgG/0yU2/r6TIFInSC2kY1gSmn1lT5+OBA?=
 =?iso-8859-1?Q?cgyBDUusftVsSvu464ExLCO7bxlSIFgJvQhBxZHmzWYjeeVIknyX67DwAj?=
 =?iso-8859-1?Q?NliFy3iAH27jWt+XGnqSE7hEgV3xHEuVI1jlztFxS0XW4i7ktFUAYoe+AL?=
 =?iso-8859-1?Q?Ee8MNE/IMlUjuGCt3RZ+0yYs9ahPpDDsrOf5Pk2EiDjRmBObpULdQQs8wx?=
 =?iso-8859-1?Q?5KNeIJnnNZR6meA7tLYfDP9rLpq2aGqwsog5IHiHn/OYU5tWD2gojnu1X+?=
 =?iso-8859-1?Q?1zSZ0A26bD6hZEE6BnTuwcZ5PhyHS0uyIgpkfbL7McBZekpYcs5NT5b6BO?=
 =?iso-8859-1?Q?NO50QWHwRoZGSkrtjw3OLeltt6RaDcAC9T5NEgRPIhFpms4nnlTVJYXOdN?=
 =?iso-8859-1?Q?dVKX9rwy9UgSbWDxwEfIfJXmDNOr4bNisp5a/bpiEwJk71VSBK+j+EYdu9?=
 =?iso-8859-1?Q?Q3xEkXvpHp9GUJ/LLlqwfoPLF9QlTo/H45G8S/WM9r6PbnQAU4yf6rQKqm?=
 =?iso-8859-1?Q?Jje/s3dxYaNZTWNVnQ0Tqt6mDjYrTu4Z4ei+u5OCSIFc6imkX1oWPhCxvK?=
 =?iso-8859-1?Q?kdOy816c51ZZUyJeQKXEpYAH0RUygTOP7TuOUTUf4L1vPgXwqKxxfBYZ7r?=
 =?iso-8859-1?Q?7fqiKJ2QBI3p/KhccrNVuSTlx9qBGVAaEvJTHEHATr59Bx1DxWgp8JbxhB?=
 =?iso-8859-1?Q?1EIAOti4vauTHOr8EOnj9OHV352QlXU6AVoSwXts96jnYgmgHkoNTi2yPy?=
 =?iso-8859-1?Q?r0r9QRq9Mpo1A2EUQ/3RN7iFGi5/scuN87CALd2auo9mKa2eqJf8GxGNs2?=
 =?iso-8859-1?Q?zNImzWk4eJEttXqIL7e3vzFKjeH8CImYPDMxcoTZ/chuZB32MTqmTGidGt?=
 =?iso-8859-1?Q?JBxvLAWz2xIh/GBdM2AE0mtQFUmFHkFedkkFdddmTFFLUim3PsKopaCYFC?=
 =?iso-8859-1?Q?skYOlbSJ+xzfgz0teRWUBGFowhZp8yhY9FFnigzu72x6Ir7BWcE8lORZ+Y?=
 =?iso-8859-1?Q?M+pSW5vocOlpYK7w9SX9nQDUbLQLlex0H65MNoUM25YwDwmtXOptNR7IQe?=
 =?iso-8859-1?Q?KGq8gjpCQKDlQvHoz/wTpo7qefCoA7mB8+HpcE5nlIF29RAciUJ9yDYesG?=
 =?iso-8859-1?Q?1lzRip8WPXGa8VqNlafDPv0NRMp1dQbzZXHVxLvXWOt842J6JoKsMzoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b76f51-d244-4ded-7f9d-08dbc9b952e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 17:50:00.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v14NpWmJhOnQPKMPoYkww9r6qvWPoZu2unu0WTzRv8eEwbvDb+iTpztQiVhoHV4tBBNhEtSfhBkh3d+VkjxeRfefFWuR0VQooRuMCgQF/ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add INSTDONE registers to
 devcoredump
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 08:32:04AM -0700, Souza, Jose wrote:
> On Mon, 2023-10-09 at 16:23 -0700, Matt Roper wrote:
> > On Mon, Oct 09, 2023 at 01:21:49PM -0700, José Roberto de Souza wrote:
> > > This registers contains important information that can help with debug
> > > of GPU hangs.
> > > 
> > > While at it also fixing the double line jump at the end of engine
> > > registers for CCS engines.
> > > 
> > > v2:
> > > - print other INSTDONE registers
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   9 ++
> > >  drivers/gpu/drm/xe/xe_gt_types.h         |   3 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        | 107 ++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  10 +++
> > >  5 files changed, 126 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index 35dd4837dd75f..32465e384fc24 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -32,6 +32,7 @@
> > >  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
> > >  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> > >  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> > > +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
> > >  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
> > >  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> > >  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index cd1821d96a5d8..c6650124ae6a6 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -105,6 +105,8 @@
> > >  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> > >  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
> > >  
> > > +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
> > > +
> > >  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> > >  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> > >  
> > > @@ -117,6 +119,10 @@
> > >  
> > >  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> > >  
> > > +#define SLICE_COMMON_INSTDONE			XE_REG(0x7100)
> > > +#define SLICE_COMMON_INSTDONE_EXTRA		XE_REG(0x7104)
> > > +#define SLICE_COMMON_INSTDONE_EXTRA2		XE_REG(0x7108)
> > > +
> > >  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> > >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > >  
> > > @@ -299,6 +305,9 @@
> > >  #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
> > >  #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
> > >  
> > > +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> > > +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> > > +
> > >  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
> > >  #define   ENABLE_SMALLPL			REG_BIT(15)
> > >  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index d4310be3e1e7c..d566df56fb8ea 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -25,9 +25,10 @@ enum xe_gt_type {
> > >  };
> > >  
> > >  #define XE_MAX_DSS_FUSE_REGS	3
> > > +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> > >  #define XE_MAX_EU_FUSE_REGS	1
> > >  
> > > -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> > > +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
> > >  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> > >  
> > >  struct xe_mmio_range {
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 37b3ee1268090..6433016fa10f8 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -16,6 +16,7 @@
> > >  #include "xe_execlist.h"
> > >  #include "xe_force_wake.h"
> > >  #include "xe_gt.h"
> > > +#include "xe_gt_mcr.h"
> > >  #include "xe_gt_topology.h"
> > >  #include "xe_hw_fence.h"
> > >  #include "xe_irq.h"
> > > @@ -655,6 +656,45 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
> > >  		xe_hw_fence_irq_run(hwe->fence_irq);
> > >  }
> > >  
> > > +static void
> > > +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> > > +				       struct xe_hw_engine_snapshot *snapshot)
> > > +{
> > > +	struct xe_gt *gt = hwe->gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int dss;
> > > +
> > > +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> > > +
> > > +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> > > +		return;
> > > +
> > > +	snapshot->reg.instdone.slice_common =
> > > +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE);
> > > +	snapshot->reg.instdone.slice_common_extra =
> > > +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA);
> > > +	snapshot->reg.instdone.slice_common_extra2 =
> > > +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
> > > +
> > > +	for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) {
> > 
> > Drive-by comment:  Looping over all DSS is probably going to be needed
> > in other parts of the driver as well in the future (probably perf, eu
> > stall sampling, etc.).  It would be best if we could avoid open-coded
> > loops like this that require the calling code to know about
> > XE_MAX_DSS_FUSE_BITS (which is tied to our internal bitmap
> > representation of fusing).  I think it would be better if xe_gt_mcr.h
> > could provide a general DSS-looping iterator that hides those details
> > and can be more easily re-used elsewhere in the driver, similar to what
> > i915 does with the for_each_ss_steering() iterator.  Then if we change
> > the underlying bitmap representation, we only need to update the one
> > iterator instead of tracking down all the various loops that need to be
> > updated.
> 
> Is this enough?
> 
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index c0167d57de42a..16fa19cf5723c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_MCR_H_
> 
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_types.h"
> 
>  struct drm_printer;
>  struct xe_gt;
> @@ -30,4 +31,12 @@ xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
> 
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> 
> +#define for_each_geometry_dss(gt, dss) \
> +       for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) \
> +               if (xe_gt_has_geometry_dss(gt, dss))

Maybe you can also make the iterator fill in the group/instance values
rather than requiring a separate xe_gt_mcr_get_dss_steering call inside
the loop?  E.g., something like

    #define xe_for_each_geometry_dss(gt, dss, grp, inst) \
        for (dss = 0, xe_gt_mcr_get_dss_steering(gt, 0, &grp, &inst); \
             dss < XE_MAX_DSS_FUSE_BITS; \
             dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
               for_each_if(xe_gt_has_geometry_dss(gt, dss))

    ...

    xe_for_each_geometry_dss(gt, dss, group, instance) {
            foo[dss] = xe_gt_mcr_unicast_read(gt, REGISTER, group, instance)


Matt

> +
> +#define for_each_compute_dss(gt, dss) \
> +       for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) \
> +               if (xe_gt_has_compute_dss(gt, dss))
> +
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 6433016fa10f8..b5bccfd5a09da 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -676,12 +676,9 @@ xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>         snapshot->reg.instdone.slice_common_extra2 =
>                 xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
> 
> -       for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) {
> +       for_each_geometry_dss(gt, dss) {
>                 int group, instance;
> 
> -               if (!xe_gt_has_geometry_dss(gt, dss))
> -                       continue;
> -
>                 xe_gt_mcr_get_dss_steering(gt, dss, &group, &instance);
>                 snapshot->reg.instdone.sampler[dss] =
>                         xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> @@ -817,10 +814,7 @@ xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, str
>         drm_printf(p, "\tSC_EXTRA2_INSTDONE: 0x%08x\n",
>                    snapshot->reg.instdone.slice_common_extra2);
> 
> -       for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) {
> -               if (!xe_gt_has_geometry_dss(gt, dss))
> -                       continue;
> -
> +       for_each_geometry_dss(gt, dss) {
>                 drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
>                            snapshot->reg.instdone.sampler[dss]);
>                 drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> 
> 
> 
> > 
> > 
> > Matt
> > 
> > > +		int group, instance;
> > > +
> > > +		if (!xe_gt_has_geometry_dss(gt, dss))
> > > +			continue;
> > > +
> > > +		xe_gt_mcr_get_dss_steering(gt, dss, &group, &instance);
> > > +		snapshot->reg.instdone.sampler[dss] =
> > > +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> > > +		snapshot->reg.instdone.row[dss] =
> > > +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> > > +
> > > +		if (GRAPHICS_VERx100(xe) >= 1255)
> > > +			snapshot->reg.instdone.geom_svg[dss] =
> > > +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVG,
> > > +						       group, instance);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> > >   * @hwe: Xe HW Engine.
> > > @@ -679,10 +719,30 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	if (!snapshot)
> > >  		return NULL;
> > >  
> > > +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> > > +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> > > +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> > > +	 * allocations.
> > > +	 */
> > > +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> > > +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> > > +	if (!snapshot->reg.instdone.sampler ||
> > > +	    !snapshot->reg.instdone.row ||
> > > +	    !snapshot->reg.instdone.geom_svg) {
> > > +		xe_hw_engine_snapshot_free(snapshot);
> > > +		return NULL;
> > > +	}
> > > +
> > >  	len = strlen(hwe->name) + 1;
> > >  	snapshot->name = kzalloc(len, GFP_ATOMIC);
> > > -	if (snapshot->name)
> > > -		strscpy(snapshot->name, hwe->name, len);
> > > +	if (!snapshot->name) {
> > > +		xe_hw_engine_snapshot_free(snapshot);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	strscpy(snapshot->name, hwe->name, len);
> > >  
> > >  	snapshot->hwe = hwe;
> > >  	snapshot->logical_instance = hwe->logical_instance;
> > > @@ -730,6 +790,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	snapshot->reg.ring_dma_fadd =
> > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > > +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
> > >  
> > >  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> > > @@ -737,6 +798,40 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	return snapshot;
> > >  }
> > >  
> > > +static void
> > > +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> > > +{
> > > +	struct xe_gt *gt = snapshot->hwe->gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int dss;
> > > +
> > > +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> > > +
> > > +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> > > +		return;
> > > +
> > > +	drm_printf(p, "\tSC_INSTDONE: 0x%08x\n",
> > > +		   snapshot->reg.instdone.slice_common);
> > > +	drm_printf(p, "\tSC_EXTRA_INSTDONE: 0x%08x\n",
> > > +		   snapshot->reg.instdone.slice_common_extra);
> > > +	drm_printf(p, "\tSC_EXTRA2_INSTDONE: 0x%08x\n",
> > > +		   snapshot->reg.instdone.slice_common_extra2);
> > > +
> > > +	for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) {
> > > +		if (!xe_gt_has_geometry_dss(gt, dss))
> > > +			continue;
> > > +
> > > +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> > > +			   snapshot->reg.instdone.sampler[dss]);
> > > +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> > > +			   snapshot->reg.instdone.row[dss]);
> > > +
> > > +		if (GRAPHICS_VERx100(xe) >= 1255)
> > > +			drm_printf(p, "\tGEOM_SVGUNIT_INSTDONE[%u]: 0x%08x\n",
> > > +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> > >   * @snapshot: Xe HW Engine snapshot object.
> > > @@ -785,10 +880,13 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > >  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> > >  		   snapshot->reg.ring_dma_fadd_udw,
> > >  		   snapshot->reg.ring_dma_fadd);
> > > -	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> > > +	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> > > +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> > > +
> > >  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > >  			   snapshot->reg.rcu_mode);
> > > +	drm_puts(p, "\n");
> > >  }
> > >  
> > >  /**
> > > @@ -803,6 +901,9 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
> > >  	if (!snapshot)
> > >  		return;
> > >  
> > > +	kfree(snapshot->reg.instdone.sampler);
> > > +	kfree(snapshot->reg.instdone.row);
> > > +	kfree(snapshot->reg.instdone.geom_svg);
> > >  	kfree(snapshot->name);
> > >  	kfree(snapshot);
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index 71c0a0169e62a..0a10a79962c97 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -221,6 +221,16 @@ struct xe_hw_engine_snapshot {
> > >  		u32 ipehr;
> > >  		/** @rcu_mode: RCU_MODE */
> > >  		u32 rcu_mode;
> > > +		/** @ring_instdone: RING_INSTDONE */
> > > +		struct {
> > > +			u32 ring;
> > > +			u32 slice_common;
> > > +			u32 slice_common_extra;
> > > +			u32 slice_common_extra2;
> > > +			u32 *sampler;
> > > +			u32 *row;
> > > +			u32 *geom_svg;
> > > +		} instdone;
> > >  	} reg;
> > >  };
> > >  
> > > -- 
> > > 2.42.0
> > > 
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
