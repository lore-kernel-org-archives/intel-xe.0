Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB14C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF7510E224;
	Thu,  9 Nov 2023 18:46:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA1B10E225
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699555577; x=1731091577;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D9YPZ5eYfHsvc0h2ON6UhI6n8stkPvqDa5Oa1DWevLs=;
 b=VKJZi2ptFOa69vdoozOEftagDKiH7aEue7/Rmbk3ufELnATpUe/Yh55F
 tHLbLKIfZq03E0VFjs/SizRk0WeUNDI0T/yKplIXVQkbpUWVCET6+tC5u
 cMSmiIhKzDpfy/Vxzw8nWhlQy+bbsvmygMivpiGCJWXrNb18TU1+7Gf/7
 oxYkrkoAIRGlBjSrtYaXPTGAisNHTaWILnShAM2SaM00yRSiCrz7I/KtC
 sCnNljkNK1u1O2KKO8SWqhfn/Hr6zoj3HHd/ICgMBM5Qw/Kwsh4xqpaXd
 W0XPItFT5h2XAllw6uOGnYSOcuEvTYR/41XYh+4mlh2mWxaotiIeH4bCM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8703515"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="8703515"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907223486"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="907223486"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:46:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:46:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:46:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:46:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhzbxopkIbFyurCAbTKd1cdxGafbz96R8qsER5FdP8LLAZ8+sonH0K3mqcnsrRnPIpiEbSEkFUZuUgtlcnO3FBCe5rrPmO7IdDREqRNLjPFT0GEFNoLFNtyGmkLn0iXk1bXTQeLpVgbNwVoXKuMlNM9Y9d0bKk49ayEE3eAV5FW4mwHe2gmpyAa/0K7lrB5ATTwkVGyUijKc1woMrEn8zytvCKM1JO4pf0ExLtWKZApM2zr9KerEng8EmiwxhKm+PcQ5cRitCm20P9OxTkdTN5Hnc/II8yQGkvQtvC/1lvXG8o4nwRwKVSAfqIyJDBlACsEDatrhWhH5QT8HIRH57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmYXuFg9FW3g4nk/Ed4iXU33aVjpFQWEfzbiOrCTNK8=;
 b=khMi3Lg7Zjnb9SNj6v3+KWZ8woaBk3nh0fNFsWsn8zYL61rxTt2O//ytEXZGyAcLd1ygj7rhp0il/CN9sYRJktkDfZ0uQ36wsh+IOEVSYg//YiH7Gf08fPp9D5fG2lf9bBzGW21zBn9CTTsmBDKyEdrcGcnWn4bY8rSftrksLp+FXGbdXt6/lewJ5YWGYp6ZVVQQNZFIQbuF3XdEu2r9z3i1xUbTd6Fja2pr8+Pw0PiUdCt3Jvf5lKpeCUsbXKRyyeppZN5h8PvrTqeuvUa6JPXs81xz7R9wyBiaHAsQ0gppl/DBK9Hj1g9L807n5mxhNRnLv/UMfXwV7CDSaRa1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:46:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:46:10 +0000
Date: Thu, 9 Nov 2023 13:46:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZU0o6z5MtoaG8fuZ@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-35-francois.dugast@intel.com>
 <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
 <b5252d2f0873bcaebf0ecd1fcd4579020f7821f7.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5252d2f0873bcaebf0ecd1fcd4579020f7821f7.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d4f571-9caf-43f8-5c58-08dbe154245a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/y+vUmFrHw/yXIcMjLAHqVhm4UjAdouuQOvZ5WAYDiSh9O3FmrD2bSRyT30cNZSWX6q6TU/2XeKJeG5qXDuH2ooV3OHfV5KIVVo5r6W8HYl8P5IWs8Z02DfrVsHbcmU/hy5nFuFNgqcyLdzVJbuSz4TRHhrPf26fI0GOClsHuQEfX+uphfftYY8jlC0skQQi4OHUeqXzMaSShs0XoFudjlXzx+KWB/q+nwVOsTORsuKz0Zk6A3Uf3zvVczkRoERgmeBovICRt+zaJ2vyyi2EQL8UsDj/4cw2EvndNBBRkRniTMAlN0ho83zS1N6ffD3vUb0eER523uRNNN3IIBRVeDL79IWzRa3bndixz9YO16XfjApz9S1BSS4SEnmyr2AstxDbj/jY5xNO3VChpvL6DFvPX0xczeR6UCXEzbsFkNGROGjJ6x/pWnMMip71gUt/rEN7vfq6EpDbXzsnVtO7P2ZlnKuSwAsnFZjC6xJxu0/b8cCGUwl6JjP+gRifTbUDNv43quzI/OAFUEutHPk4E9yXfsfOkoct5vWwKtLsKYD24Y2LolJ+68gIhlKCXrd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(8676002)(2616005)(6666004)(83380400001)(6506007)(82960400001)(26005)(6512007)(6486002)(478600001)(107886003)(38100700002)(6636002)(66946007)(37006003)(54906003)(66476007)(66556008)(316002)(44832011)(5660300002)(86362001)(2906002)(6862004)(8936002)(4326008)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OctngutJVfr5Qhbr0gt+mVJEqT07lwZiIjb05FRkyaT0byGY9ktBQmN4eA?=
 =?iso-8859-1?Q?+KppuEr7W9k44kAFqYHE7E2Ry9bIUEKPh1NpxtMXH6hziXLFkn+bhiUDlC?=
 =?iso-8859-1?Q?0vTWwYu5giblIFN8Wrf4IBEYFMv/eBgRE6dHebbhHBeXRYsaCF4xMcJ2oq?=
 =?iso-8859-1?Q?JlwUxz3v2ph0Aiqyzd4GVf+DD4Msdw+VStXkhrFrUM0tBxh8S+4KfDg1qN?=
 =?iso-8859-1?Q?aeAdHvqGt/So/msHGAMc0ozcPTcRGDPzAU+hJXES+5fXA5zbu37yYmCfgU?=
 =?iso-8859-1?Q?uro1DoHyv4Z6qLdxa656m8QEPK/X8W5p5ExcTS7S4w4RR7yp5t1Bll97OS?=
 =?iso-8859-1?Q?Fu8tvNUUbUNN87ur4gZwvNRlrq2y19cDWbampEpgpGo2gjDsmvooFjD4Yr?=
 =?iso-8859-1?Q?sRN/btmqUn+0cM/T5oXci1nPrZzcubI2o1zilZt5oM2M1gC3vpqGFsa0Oo?=
 =?iso-8859-1?Q?UCNVZgwyksCg4jEFf+ymdZmzGU3wH2f6nvlnKCvO281UtR8+51qrVHbDsz?=
 =?iso-8859-1?Q?qbeS8dx6cjKM9z/VV0XbUe1fhU0zT1aCgSS4zCaglu8lHBX918/bSfjxqr?=
 =?iso-8859-1?Q?+WItUwWoUaFYfnpvPF+7knJMpzSr/QYj0BXiW3mSIrNR/8w9Ix6K9Rq/LH?=
 =?iso-8859-1?Q?cd6pNlk4BczavVXjikhxNV4w56QMvJbuXh/BVHRdUWVXsGietadD8FL8H2?=
 =?iso-8859-1?Q?OghadhnVaIphjxyIvmO5uJFppeZw+4bmWLyAgzkDjLSXRUpaFNWBVOW0uu?=
 =?iso-8859-1?Q?FN0cZCpTlQKNZdhSwfG9/KSeHO8+XZ7b2ORaFxtHV7DIzS7JheaFRbVxQJ?=
 =?iso-8859-1?Q?KmLr7/VaNLRlq52opmYKvHAaI5vW9Ne7WK+vlxPyPb1FxVEpJQ71zLEkCv?=
 =?iso-8859-1?Q?K3u34E4fOoWiv3gXZLZHck0rvtR7gnaZh7fv6FtRUyeCSgjnakZr3xKbBj?=
 =?iso-8859-1?Q?94/c5cFBGd4n2fiX2ZLaKmDl07nI+w4Z0He/GhcQBRHVvau+uAj1h3Yq+9?=
 =?iso-8859-1?Q?vNGa7V3YMZpAyBmD1GU2Owl5N5uXru2ju2scBTbIZ93Ux7s+VBCFI9IAmy?=
 =?iso-8859-1?Q?pKzJaQ7bRtK21Eqq77zBlOoj59Saq22yhnLFkUU0Q6yrq4j+gv+kztyeT1?=
 =?iso-8859-1?Q?ubroZBRjbFz1fC/RbbNhju4nvLs/yqqP34qxPEv+dnqtdzlOR/RthTmQUk?=
 =?iso-8859-1?Q?jm+XWAzUJ8BZHiPS1liBlpjYR66P/jN0jlXpXenpXK+QdKz3x7TK1ce8A/?=
 =?iso-8859-1?Q?Ugx+kljNVkW+0ZE8CWO9MimC8uxPgoUzcn7Z6uljOOUvOmac26oRvf5V7Z?=
 =?iso-8859-1?Q?XAhFcOqzayaJNeOnFkWbUgowsPHhKSjQmn8oeD7ssvBbPxypqeE0BqqnMh?=
 =?iso-8859-1?Q?BUhSK+/dhmnWERJKwLU3JnAldXG9Cnoq6hkDxsHe/sl8eC9PCbmQK3F6IG?=
 =?iso-8859-1?Q?kFo4KtXHsKWgxEsK9ujRqUb8GvZhJ5RQk0lUnnk7hNscVTpDVRS6uHK0O+?=
 =?iso-8859-1?Q?xrWjyl8degs8G4xn3dwyL3iPbus7ivwtbp5HMT4IYp86gZmCdPixJYvKCU?=
 =?iso-8859-1?Q?HVro3rEXPdC+Gjiogv2uZOgV4Ra7xjO0zMyRMzJPE/B+N7YIOlqdN57bNH?=
 =?iso-8859-1?Q?QJfEIzpsuJ053fNgJpPBTUfW3PzWdbkaAFjVBd5A6gKxf6MXAKIGaTlg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d4f571-9caf-43f8-5c58-08dbe154245a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:46:10.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2t3ONzFXGXYux0hywgNQudL9dLH9rgWkK1ViJONpnDgHHT34tE4OskXcafHBMqMzTBsMTHF4HUX9kmC8axZBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 04:35:19PM +0000, Souza, Jose wrote:
> On Thu, 2023-11-09 at 08:29 -0800, José Roberto de Souza wrote:
> > On Fri, 2023-11-03 at 14:34 +0000, Francois Dugast wrote:
> > > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > In the Tiled platforms, the memory is more tied to the Tile
> > > than to the GT.
> > > The distance (near vs far) makes more sense from the Engine
> > > perspective than from the GT perspective.
> > 
> > why not add a uAPI to query tile information?
> > this is duplicating a tile information onto every engine of that tile.
> > we could leave reserved fields in the tile uAPI to include additional information that might be relevant in future.

This is not necessarily a tile information. In PVC, truly the mem_region is tied to the tile,
but we don't want to fix the uapi in only one platform.
Like in the previous, the mem_region was per GT. who knows the future?!

But the engine needs the information on which mem_region could be better,
regardless of if it lives along the same gt, or the same tile, or outside.
So, near and far sounded the most generic and future proof way.

> 
> other issue here and in other patches of this huge patch series.
> 
> a previous patch in this series renamed near_mem_regions, then this one moves it to other struct... please drop the first patch and rename and move it
> into a single patch.

okay, rename and move in the same patch kind of makes sense. and patches
could be squashed together. But when doing the IGT on the side, I felt
that small changes were better, so renames goes with sed commands and
the patch was small and clear. But I don't mind if they get squashed in
the end.

> 
> a series as big as this one will cause reviews in KMD and UMD to take a while...

that's unfortunate indeed. But big patches also don't help much to speed up reviews.

> 
> > 
> > > 
> > > So, let's move this out from the GT and into the engine info.
> > > 
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 14 +++++++-------
> > >  include/uapi/drm/xe_drm.h     | 27 ++++++++++++++-------------
> > >  2 files changed, 21 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index aa5743e2e4d0..49a9b36f1193 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -217,6 +217,13 @@ static int query_engines(struct xe_device *xe,
> > >  				hwe->logical_instance;
> > >  			hw_engine_info[i].instance.gt_id = gt->info.id;
> > >  			hw_engine_info[i].instance.pad = 0;
> > > +			if (!IS_DGFX(xe))
> > > +				hw_engine_info[i].near_mem_regions = 0x1;
> > > +			else
> > > +				hw_engine_info[i].near_mem_regions =
> > > +					BIT(gt_to_tile(gt)->id) << 1;
> > > +			hw_engine_info[i].far_mem_regions = xe->info.mem_region_mask ^
> > > +				hw_engine_info[i].near_mem_regions;
> > >  			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> > >  
> > >  			i++;
> > > @@ -377,13 +384,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> > >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > >  		gt_list->gt_list[id].gt_id = gt->info.id;
> > >  		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> > > -		if (!IS_DGFX(xe))
> > > -			gt_list->gt_list[id].near_mem_regions = 0x1;
> > > -		else
> > > -			gt_list->gt_list[id].near_mem_regions =
> > > -				BIT(gt_to_tile(gt)->id) << 1;
> > > -		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> > > -			gt_list->gt_list[id].near_mem_regions;
> > >  	}
> > >  
> > >  	if (copy_to_user(query_ptr, gt_list, size)) {
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 5164ed150a2e..8e84ef6fd46e 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -228,6 +228,20 @@ struct drm_xe_query_engine_info {
> > >  	/** @instance: The @drm_xe_engine_class_instance */
> > >  	struct drm_xe_engine_class_instance instance;
> > >  
> > > +	/**
> > > +	 * @near_mem_regions: Bit mask of instances from
> > > +	 * drm_xe_query_mem_regions that is near this engine.
> > > +	 */
> > > +	__u64 near_mem_regions;
> > > +	/**
> > > +	 * @far_mem_regions: Bit mask of instances from
> > > +	 * drm_xe_query_mem_regions that is far from this engine.
> > > +	 * In general, it has extra indirections when compared to the
> > > +	 * @near_mem_regions. For a discrete device this could mean system
> > > +	 * memory and memory living in a different Tile.
> > > +	 */
> > > +	__u64 far_mem_regions;
> > > +
> > >  	/** @reserved: Reserved */
> > >  	__u64 reserved[3];
> > >  };
> > > @@ -401,19 +415,6 @@ struct drm_xe_query_gt {
> > >  	__u16 gt_id;
> > >  	/** @clock_freq: A clock frequency for timestamp */
> > >  	__u32 clock_freq;
> > > -	/**
> > > -	 * @near_mem_regions: Bit mask of instances from
> > > -	 * drm_xe_query_mem_regions that is near the current engines of this GT.
> > > -	 */
> > > -	__u64 near_mem_regions;
> > > -	/**
> > > -	 * @far_mem_regions: Bit mask of instances from
> > > -	 * drm_xe_query_mem_regions that is far from the engines of this GT.
> > > -	 * In general, it has extra indirections when compared to the
> > > -	 * @near_mem_regions. For a discrete device this could mean system
> > > -	 * memory and memory living in a different Tile.
> > > -	 */
> > > -	__u64 far_mem_regions;
> > >  	/** @reserved: Reserved */
> > >  	__u64 reserved[8];
> > >  };
> > 
> 
