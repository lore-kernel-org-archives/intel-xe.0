Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD44C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 21:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8109810E919;
	Thu,  9 Nov 2023 21:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA1A10E90D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699563886; x=1731099886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SwMWtdVUE3/Vd7PNTL3oQ0XWmnIjCSCB7yAeRrKkP6g=;
 b=jNzHfUXBvAhx8PRZIti7hxSxXt6iKLNVmGzVOXqddRcT66FSyBgteMB4
 ICaZDzLuXKxO0WRh4ihycr4oX+e8M5/JgQNSU13v4dpHq9aZ5WrrMMNHH
 7dj2bYEWtD0jTHRfMWah1BebIv0FWqIZU37So2IEt9l/HSE7Rh8Ka8eVf
 3jXmbIuCFVz9S08e+hT5D6PUUq/e0EF2UASZLJG6Idl9zEqMiJi9v0zxn
 12DWM19WZ80utivqThsLFk3uJ+2GqEce4CPkhOR2VRDMDPqLcGwc/cMYx
 SjVUcZshjf5nonl62T7SOuEnPOa80Xx9iIYT31e9yKnged26DJXclTQ4p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456566747"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="456566747"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 13:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="880733575"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="880733575"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 13:04:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:04:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 13:04:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 13:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOJnMVCiv6gN6xSI1JfasvglcUbRqNSYcLlwaAj6TSq6142CFpBhJkxgYvjyrw+M0m+FDzn4bTHpXvi4HzxHNVF/memnTApuS+LG9k+1ooRLNBhaFnK9J4qP9cNDlaNtckiaosZt4rRY/53E5QpCHIxy6sfiGrgQKSkG1kAq5LrBEFn7zw/Tc0DjD6a0q9FiYAie1AfhFCp0FTUjVH6PEe4BDhmtoFZpMDzxulwqmwixuE6SrJkYUQhjHJv5NkSJoF/12U5iot9CXyjdZccihdgNrH/B8Py17uU03zaM6ean+dVhWIX/JIY+5mlonP/25iATw6USCSJK6h1gRIPuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAOFU5QiRpImeXUJrCf4xAmBmmaAHokxZWmfWt6UpAM=;
 b=JQ5HMGhtccIGFIrxwk6ENs66enKqcH5Nwo13mZzAXmPD1fM1ZFeskNddAfX0a9Bz/IAtrDxHWf/qxZzJShmzELO7JFoLem6xF0uZhuvJpuvVY0C9sCkCLduwQw6u2R0HcYJjrBP14Pq3qXTYvDMHdCxE5Q3pNgMDD5tqPS+wHQn02y+EbJnnQn+aj1MDwgq3HONNuFwkZA6XHhIGSeYc21gsKkIcKF+lskw40NQJ9hTxq6kDqyx4myyLYOwhaNTp/E/9jboYX29hEEuGCQs7p2+kp2rfBTCKQ0CUS+OURjh0rmXOzJIOGepqF9syOo4AtuJ6NxeB0uocdEYc1KkwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 21:04:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 21:04:36 +0000
Date: Thu, 9 Nov 2023 16:04:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZU1JYWbHgWF3lain@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-35-francois.dugast@intel.com>
 <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
 <b5252d2f0873bcaebf0ecd1fcd4579020f7821f7.camel@intel.com>
 <ZU0o6z5MtoaG8fuZ@intel.com>
 <d6889593ffacce61174f109832537176b5f2d28c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6889593ffacce61174f109832537176b5f2d28c.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: 3162bc69-f97c-472f-284c-08dbe1677af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LsuGI30UMNlGJohbCscLnNR2M22Nf+KJitdcvRYaxz665/F+yR1TOK29guvHaobcZ8vHEisEBux6LkvXefdQr8fJ9y+xA8JCLfx15jNR4tGVPwHYjOb8rDgcVlSC27HueGOfHgvpKRQFN4bL7YZ0mdYMqwCbO1Kms1W4IIbNWBG3AoNiTbj2Y7YzNBNSIMJ6kYiy/7pCoEbuCV0j7VacdIFEILriftr31hU4mysUHouw+Eu3VzvaLHOTM7OlPVA9CG0sOMo5dEqCIaTuqG9kM682lJy8CoSLIrNoQOHNag7tqpq792XIGRH6bmb1dvPgUdW4COtqN/ZsAHtTwMAUT5Qlv717aDs2NWz9mXgKd9SFtbbqQt7dkdQrdmNr46eTmuMTVSCXYcFzVrDeMTu+02QfDas3+CpSz9G+iqQeEydrbFiKPpI2oOsKXrPKkIm/PA896LwCuiI5QkyopTN3sa+jPx0fLP6e1XHbA/D3RHUQF0Gu1iLL+hUmynQDIs+mtqrp08aM0UfBxlvQRWN1aRw2n59qwPzxDZV63kChg3B2Sh7RWfF4Q977OF+hX7x8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(6486002)(38100700002)(6512007)(83380400001)(6666004)(2616005)(6506007)(8936002)(44832011)(54906003)(41300700001)(86362001)(36756003)(4326008)(5660300002)(66476007)(66946007)(66556008)(316002)(6636002)(8676002)(6862004)(37006003)(82960400001)(2906002)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?X3zy/bECdcnU2m+dc/ZvHCmWNnDcbdL2g2Imxs96a/m5KEi3X7+JYx5bJa?=
 =?iso-8859-1?Q?5ZMJ+Ghll07MazKhXEnZW6LWhjQ4yJpmQuOdphUs1ETeeMH/ltnZkNMVlY?=
 =?iso-8859-1?Q?eanAWyrHpBarU5xS4XEFeWXU1dcHIyVnICgIpsnuYw2ZMYtUcszb1iLmbV?=
 =?iso-8859-1?Q?YPy8wyKVS3jLZLvHwIDHl6igcMB+IJTfeVLCSQzALm8ypleanIBYgP8xZZ?=
 =?iso-8859-1?Q?tYDKGa96bntQsw+NxOr7LBq0oarRldTy/tk/uFqX2CyBywOhx54fSWkPGj?=
 =?iso-8859-1?Q?Bi3cdrZQ+K2e0el4D/dMZOuKUHo9JXnG+hShUOZn1UCTC1B8QMeX4nzUp3?=
 =?iso-8859-1?Q?Uq7gjjD8rH3zCbcSpt465i1EW7FjdnBUGM/o4dLGpWghGQt6qMtg0hhbkC?=
 =?iso-8859-1?Q?b4g8Zs0W0GrBbEBWxBtK19pjEraugs2OBGfh0LweZMheBZtgijMQgA+hLl?=
 =?iso-8859-1?Q?cOfQ4PVOSksraK7ge15RLsgQY5o7DVnIqqt9phk5/AuQpsrFkmKlHxJWTq?=
 =?iso-8859-1?Q?6zGEN34LHs6MmAG2mdQAjdjuzsvi6FkpYNeEUYwkNEfjISRa3H2vAD4cgz?=
 =?iso-8859-1?Q?UmbtZRmDH84Hmo6lzsYzs4M6v9ayMEJJGBQzFWpccwVnO2eN0uL/mM/xZg?=
 =?iso-8859-1?Q?D1D5sgIHHnyocM/ahrp9tvVgmuU/RgsozRkSHtNGzpwFWc6ohWmPJ7+RwV?=
 =?iso-8859-1?Q?vzqXiA6IGeOoIbXEn+tz9CYNtRac7BpJ7AK4WikKQfHkv/e8gkcikT0x0p?=
 =?iso-8859-1?Q?rsqkSCYceHeAWA4eLMLV/g5M8QErBBEXGZWEkQXbKTCN6EeL3rKYbFLohs?=
 =?iso-8859-1?Q?5MU++/DzE2CrVD0Z40ITTThu3rlphRQek2e5qmWYedPv156Zzd/z9Lphh8?=
 =?iso-8859-1?Q?8r1ihgJ2s+Q+y72NZAOrD9siqfq8emkFGw/W8R7/JcZ4enzi57TYCU8u3u?=
 =?iso-8859-1?Q?FdQN3XzcnpQJMGdJmiCABKw9ObWbgX4jjQig4sd2RjXx/PkGnXCAnzfOML?=
 =?iso-8859-1?Q?uogdI0k7UsuL2TOcHdTFXvRkFbWMJeQMl5FuQaiAIZSkQBI6ByotRzlRIf?=
 =?iso-8859-1?Q?RdwT1bkHtj9V/DgE0Tl0SkGOyoZaMzIO8GnBh+lrlwmUYyjsPCzGZ9O4Lf?=
 =?iso-8859-1?Q?dKLzP9YqZsSgap3Jv6o4sNhiymncFQ8pd/89ymMVyXpz74LgSzE+Yk0NHd?=
 =?iso-8859-1?Q?ef9VicEWUMHBHNI9akKUrIbOggcd+VnUyv4+z4K+OhMkHw02UZ638js0z7?=
 =?iso-8859-1?Q?D1Z3AhJA6j4ZxVy6W3IiowK3MVux+9FIP+vcyEnc61YhHur4SXz+bwf3Om?=
 =?iso-8859-1?Q?IdWmTJF7x7m5eys/Qmp25xTha5FpvpAS0xO0VQK/wQVGTAfZa5S4gaRaOq?=
 =?iso-8859-1?Q?UrFbMAc5rLMvIO2MVEw1nlv9stXuadFzHA/xhtMhXXAWaomkPRqyQ10HCs?=
 =?iso-8859-1?Q?oJIkxZ41pcuV6rEZicmIRTmR4i0O/A5SZnbkelYkpuKZ448QuxNWBmJNim?=
 =?iso-8859-1?Q?xhnrQ9pxoS37VdDy2AEnmsdbxZ4xaYqaOcOWpfZYlSx5oPCVb4++wt3gAG?=
 =?iso-8859-1?Q?XkCcPkVsX69+y3WOKkRLLqFnROsgWfiNv9+XykAxcRVm9wFzr4bC7jaMID?=
 =?iso-8859-1?Q?oNq6DslEBK8BCHSPqFndjU+3WC4f09ROIc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3162bc69-f97c-472f-284c-08dbe1677af8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 21:04:36.6195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VbsvCz1br1r8oTgwQIrS9tDv/iSUqY+lrzgjmMx49gksVMFASplm6GSok36iwCX5Seo2PcCJZI70XLqMWfHEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
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

On Thu, Nov 09, 2023 at 02:50:04PM -0500, Souza, Jose wrote:
> On Thu, 2023-11-09 at 13:46 -0500, Rodrigo Vivi wrote:
> > On Thu, Nov 09, 2023 at 04:35:19PM +0000, Souza, Jose wrote:
> > > On Thu, 2023-11-09 at 08:29 -0800, José Roberto de Souza wrote:
> > > > On Fri, 2023-11-03 at 14:34 +0000, Francois Dugast wrote:
> > > > > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > 
> > > > > In the Tiled platforms, the memory is more tied to the Tile
> > > > > than to the GT.
> > > > > The distance (near vs far) makes more sense from the Engine
> > > > > perspective than from the GT perspective.
> > > > 
> > > > why not add a uAPI to query tile information?
> > > > this is duplicating a tile information onto every engine of that tile.
> > > > we could leave reserved fields in the tile uAPI to include additional information that might be relevant in future.
> > 
> > This is not necessarily a tile information. In PVC, truly the mem_region is tied to the tile,
> > but we don't want to fix the uapi in only one platform.
> > Like in the previous, the mem_region was per GT. who knows the future?!
> 
> Older platforms had one gt and one tile, MTL has 1 tile and 2 gts and in both cases it matches with having a tile query.

but we can have a platform with multiple tiles and no memory on any tile directly.
but adding the api there you are limiting your future. or sentenced to have a
version 2 of the uapi.

> 
> > 
> > But the engine needs the information on which mem_region could be better,
> > regardless of if it lives along the same gt, or the same tile, or outside.
> > So, near and far sounded the most generic and future proof way.
> 
> Memory regions are also used here in drm_xe_vm_bind_op.tile_mask/pt_placement_hint.
> To me it looks odd that I need to go trough all engines to know what are available tiles.

that won't be the case. we are going to change that to the sched_group_mask.

> 
> Other way to make it future prof is keep this information in gt query, each engine will always belong to one GT and each GT will always belong to one
> tile.
> This way it do not matters if the memory_region is tile specific information or a GT specific information the uAPI will be consistent with less
> duplication than putting it in hw engine.

Okay, with this I can agree. Although it might not be necessarily the most future
proof one, but since all engines live in the GT and the 'distance' to any memory
would likely be the same for every engine, then we could have this way.

Oh, I though about that. that was another reason why I kept the 2 patches separated ;)
So we can drop the second and keep the renaming.
It would be okay by me.

> 
> > 
> > > 
> > > other issue here and in other patches of this huge patch series.
> > > 
> > > a previous patch in this series renamed near_mem_regions, then this one moves it to other struct... please drop the first patch and rename and move it
> > > into a single patch.
> > 
> > okay, rename and move in the same patch kind of makes sense. and patches
> > could be squashed together. But when doing the IGT on the side, I felt
> > that small changes were better, so renames goes with sed commands and
> > the patch was small and clear. But I don't mind if they get squashed in
> > the end.
> > 
> > > 
> > > a series as big as this one will cause reviews in KMD and UMD to take a while...
> > 
> > that's unfortunate indeed. But big patches also don't help much to speed up reviews.
> > 
> > > 
> > > > 
> > > > > 
> > > > > So, let's move this out from the GT and into the engine info.
> > > > > 
> > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_query.c | 14 +++++++-------
> > > > >  include/uapi/drm/xe_drm.h     | 27 ++++++++++++++-------------
> > > > >  2 files changed, 21 insertions(+), 20 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > > > index aa5743e2e4d0..49a9b36f1193 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > @@ -217,6 +217,13 @@ static int query_engines(struct xe_device *xe,
> > > > >  				hwe->logical_instance;
> > > > >  			hw_engine_info[i].instance.gt_id = gt->info.id;
> > > > >  			hw_engine_info[i].instance.pad = 0;
> > > > > +			if (!IS_DGFX(xe))
> > > > > +				hw_engine_info[i].near_mem_regions = 0x1;
> > > > > +			else
> > > > > +				hw_engine_info[i].near_mem_regions =
> > > > > +					BIT(gt_to_tile(gt)->id) << 1;
> > > > > +			hw_engine_info[i].far_mem_regions = xe->info.mem_region_mask ^
> > > > > +				hw_engine_info[i].near_mem_regions;
> > > > >  			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> > > > >  
> > > > >  			i++;
> > > > > @@ -377,13 +384,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> > > > >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > > > >  		gt_list->gt_list[id].gt_id = gt->info.id;
> > > > >  		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> > > > > -		if (!IS_DGFX(xe))
> > > > > -			gt_list->gt_list[id].near_mem_regions = 0x1;
> > > > > -		else
> > > > > -			gt_list->gt_list[id].near_mem_regions =
> > > > > -				BIT(gt_to_tile(gt)->id) << 1;
> > > > > -		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> > > > > -			gt_list->gt_list[id].near_mem_regions;
> > > > >  	}
> > > > >  
> > > > >  	if (copy_to_user(query_ptr, gt_list, size)) {
> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > index 5164ed150a2e..8e84ef6fd46e 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -228,6 +228,20 @@ struct drm_xe_query_engine_info {
> > > > >  	/** @instance: The @drm_xe_engine_class_instance */
> > > > >  	struct drm_xe_engine_class_instance instance;
> > > > >  
> > > > > +	/**
> > > > > +	 * @near_mem_regions: Bit mask of instances from
> > > > > +	 * drm_xe_query_mem_regions that is near this engine.
> > > > > +	 */
> > > > > +	__u64 near_mem_regions;
> > > > > +	/**
> > > > > +	 * @far_mem_regions: Bit mask of instances from
> > > > > +	 * drm_xe_query_mem_regions that is far from this engine.
> > > > > +	 * In general, it has extra indirections when compared to the
> > > > > +	 * @near_mem_regions. For a discrete device this could mean system
> > > > > +	 * memory and memory living in a different Tile.
> > > > > +	 */
> > > > > +	__u64 far_mem_regions;
> > > > > +
> > > > >  	/** @reserved: Reserved */
> > > > >  	__u64 reserved[3];
> > > > >  };
> > > > > @@ -401,19 +415,6 @@ struct drm_xe_query_gt {
> > > > >  	__u16 gt_id;
> > > > >  	/** @clock_freq: A clock frequency for timestamp */
> > > > >  	__u32 clock_freq;
> > > > > -	/**
> > > > > -	 * @near_mem_regions: Bit mask of instances from
> > > > > -	 * drm_xe_query_mem_regions that is near the current engines of this GT.
> > > > > -	 */
> > > > > -	__u64 near_mem_regions;
> > > > > -	/**
> > > > > -	 * @far_mem_regions: Bit mask of instances from
> > > > > -	 * drm_xe_query_mem_regions that is far from the engines of this GT.
> > > > > -	 * In general, it has extra indirections when compared to the
> > > > > -	 * @near_mem_regions. For a discrete device this could mean system
> > > > > -	 * memory and memory living in a different Tile.
> > > > > -	 */
> > > > > -	__u64 far_mem_regions;
> > > > >  	/** @reserved: Reserved */
> > > > >  	__u64 reserved[8];
> > > > >  };
> > > > 
> > > 
> 
