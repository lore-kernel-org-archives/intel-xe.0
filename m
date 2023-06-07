Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0FAC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 18:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46710E53F;
	Wed,  7 Jun 2023 18:31:25 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDAD10E53F
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 18:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686162682; x=1717698682;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+2TPmK8FAjjE5G8KAAUG3eDOMecQmpvJJBQbdnDTHyU=;
 b=b1Avtmf/ZOcea8gm2zqTACiXD1BZ6AJ/qbr0nlaDLv1AG8f3MhUqA2du
 WWG9XMNgvZAduSkTZOS3h1flNugu8K12UkUnHzxZqszr6XTyR1525lboV
 7f7pJwO6Q2HpoVm2DwFnOh3TOClnvO9hiEyIl6P1LQCyFHApxddQdnFdD
 szmdmWmMFYY9VZIqPZ68NaEPDnYc1o7p8YYuzmyaUbqW1P0TXzQA4xP48
 Ag1niqkBaiiMBQwRY2iqcjIu/iCYHtmnRKTzOpVIVbzmKt/sHyz2DD5Lg
 A35FRSKWHfnZCett7NJ2zSMYVSrY80c0LVy7JFvvkGf/YrCYEzG0sZekn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337436349"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337436349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703766779"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="703766779"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2023 11:31:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 11:31:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 11:31:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 11:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad1uHFvVbQKBYJuznbVxGBsXUCdG9MWGI/fX1s1jBe7QJQ2HKzHR5K0UlT2bL3DJZ12NP/pYZw7JcQMqZUooF66NhcIYXeJ+sguaZ3ZP3xCxYZknlIO+jZrY7jM84pTnbE2SDRyqWq03AwaG5ysPhwWhrCHEwfQoTJgo1kMv0dwwYYVfruwZ0b/z3EnQF6wkdOoIFyspeNvDoZDHKATZFzSnbaYztZW4BazcB0aremRCpL/rvfIufFAdvhUVwgJnwfCKuOkuti074HqVnRIbNugQ15mDMAp0BPkhxTaIEE2lUqXyGR+q5WAfckbefZNOm8gccvkwzk7bJpEDFehMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rqXznyMyr1B1X0DkV3HvSM0fk0EjhIA64XxpAUJoqQ=;
 b=QBWbB+WP0Brg0z4+n6pnZ47PI3W9ve5xs6cPRjEuOhm7URxSjK2FxCvwh007pfSqomclhLBRF8Ao4gt5XAASVrRrIGJblE8fA8bkuQfHt1Iif0ZNsN9vfnAJq5avmI6ELpa4nhpGHun9osGM8okCGgSdrt0ZEG/8cKyJi71/uNTfiswHQKFqdvuwcR3HWLRlL63AVGPKQK49c34N70hf0++6GOlKJDEPPSji4Kd4klW+B/X5bfTDbtkZK9zpZgRE+gMvQGc875zGtspkR7HWwEMsulSqDvBr1GRzO+04pUphA94/dmifVdkb8ekelfkzOueLYaTSW1gOr0bCzLFypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 18:31:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 18:31:18 +0000
Date: Wed, 7 Jun 2023 11:31:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <20230607183115.GN5433@mdroper-desk1.amr.corp.intel.com>
References: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
 <20230606195555.GH5433@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB705690A2A21050E31CBF545CB353A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB705690A2A21050E31CBF545CB353A@MW4PR11MB7056.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: e87e4e0c-6516-4c96-d5e2-08db6785622f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 713PFmgYjdtcF9wNQnlyes4iYQpnLBDro1h+b8EtYulTXiRD7IHL6U0AzCh62qDwfA6GzcaFGv/Iw+NLnWNiQ/D0FmPY5MJ7wIastKaALZUmvGuhSTX8vOp63TYstJ+iPY214QlmSTRQbKWkCZ9DAx1LJUsZl3EpqU4YzlZ7aj24oiBHn4vbD6tVIdnjRHcldby2w4tVKYemDcCR80ipePgHDW5TPBNfGEiVJQzyLls1thyGKoJvGuPhHhlAxYETWjHoXqyX2OFUwfMKKX0wFcbO+SxPeaDotAl0o6G51cwi1exRdEOYzSL4uU66lGJjuh1KpTHZsAP7Hz9S/EDKXd78Xu4atlm8ab5bUrrPOb3kcOCp58RAGu9rudGNYhUeNmaUUDk/osRf2VK+Gvlc3yAiwsc9O7KVLX8reHn8tSJPEgjVuRiB39TPdd2857LbRLxqgsLsTOe+rBqxJ33eByLbye5H8wQK2eEoKJ3Xc6icWcObxY5EMEiznb7Nm4MsvTbfrHHTC8h2fwXJBrLwNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(6636002)(66556008)(66476007)(4326008)(66946007)(8676002)(8936002)(6862004)(316002)(41300700001)(2906002)(478600001)(5660300002)(66899021)(6486002)(966005)(6512007)(1076003)(6506007)(26005)(53546011)(186003)(33656002)(83380400001)(6666004)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ow+OJ9OGYbDAupAYykVlPgq1cs5cIA3UyVPLmiTsy5K5PTRwYhjgDAjg5Zoy?=
 =?us-ascii?Q?2kiRYoyEAmQoDY7/hmEAqBFbmLcuUAcFa6myab1J2f49YGVptXmjVkrcHVOU?=
 =?us-ascii?Q?HdHp/PGccKKcBTpuQ5dWyMzTjMBT1bwhbWoo2X+xCktdYbXgboA8LRQnq0OD?=
 =?us-ascii?Q?59jydPkKiYc5M4aiME8T+tpVUWu/dsNZZ/C32EFL9FvUwD8uOfXuKgeHcpjW?=
 =?us-ascii?Q?9RWaOxamqRtXtGasybMVWS3FM36vd+8exVwWCWcVOBwR6E9FQDuJ13h6zFY7?=
 =?us-ascii?Q?znTDFggy68gIBxkfd4fM+672RZSSb8+F/tHSrQ6w80atuBc/8kOPRsqrirKB?=
 =?us-ascii?Q?fRBw957+JsobQMF/yBNOpnymAaYgb4RXqKNR2KlzM/jGPdByaCI/njgLZaEv?=
 =?us-ascii?Q?3AxJPVVZu1TK7E8zdiSHYURCu5Va62KX35d3j89pndLyeLMn7b2iM25Z7q+K?=
 =?us-ascii?Q?6m0VLY1tkeTc2s/74/+Lm1UkMDjOyH88M5fbBokQ0ffVxyln/BmJ03WaA5HQ?=
 =?us-ascii?Q?3Ov7yaue4dOdi33cOVG+SoD1ZhrQ07mokeGxW2JBYAeR+jJC0EPN5obBxfP6?=
 =?us-ascii?Q?YzXxmX9DqxkryCUP/e4TW2IPrV6YU2fn0qRe2mx/Iik9jf5KE4L39V3IJUzh?=
 =?us-ascii?Q?Rqqy21lus5RFSTL5XjQ8XRdC5rDPKxhV99fz608rSWBOlrpD4dH/XdFwquwy?=
 =?us-ascii?Q?tEJZ0byq28phGEsQxHwrrHineFdGxYBiYBmEwOzIS+PASI8mt4aAwFi17Anp?=
 =?us-ascii?Q?yPBh5XIhHiBqBpe3i8hwVRQb1dpGsHPFjfmO0zXRyAesrJ3i+YM9U5W700O1?=
 =?us-ascii?Q?pYeXUyfmD0mpdxytz/kwgqiB0M9OR/YECXrXirsnGQRGl03ZD873DeoDOs3O?=
 =?us-ascii?Q?XZMDFm7WSj+/cugGeKZmr94x0DpqOqT1LhBBN03ApZnRiO6JKdwQjg8oJWsV?=
 =?us-ascii?Q?C2b4iy+7VXYFsg26nRkkehFkNn7d+ltHrJI+y3iHc/XCLgaL1xIBwhqrfzGS?=
 =?us-ascii?Q?L39hnd87TwEOMqigQJSyEt2LgqLSz0gbBEf9qeX+e1HbhizfvnlMu0vApXbu?=
 =?us-ascii?Q?UPauMHNHOvsSuSs/eT5Le9kVoM/at6Gy2xut82a+58ikCT4Gs9LWD9+ZZkTb?=
 =?us-ascii?Q?5VhmNGdKTPaLYzRWar+YZsZzAN7mY6+y/K4pCRd0XJyIImMy1jl1b2C7xVNw?=
 =?us-ascii?Q?77Ck75u6jPtWWuYB73dMToFbGve4IbwtF/tUmMOHW5JBOhC57Ppu7+rqUfdR?=
 =?us-ascii?Q?A0suHZOweZvfLb0Oe9QpJXTQzkBXGebmobaesDI3FRdZJATDgVWjr+5GxEld?=
 =?us-ascii?Q?hsiIAIj1Rkk6roOXT+bDZF4+wzGhoX6UwQCFESoF0PjKlACjKxYta6Ne+pnI?=
 =?us-ascii?Q?maYYAKklUtnoP3Et1Wp2SwfsoitlFGTA4hPb/GdRJRcZt9gnHz4oDEvyXOhP?=
 =?us-ascii?Q?4JFOq75Vm6zISZmb9wRlw0MV5fAwBbsPnoE0iQGvSkebMNF1VMTBzoVxEULm?=
 =?us-ascii?Q?mZk250kK8MRX2Uc7yJi1QHSdsMJdCGUof5xp1Rtuk+jQXAEen0hJ8v2rzDnQ?=
 =?us-ascii?Q?MH8mRXClaTJzzGBP9NokZh7uGV7g4HL6fWoaKhgTTVrMB01bVBjo9uzPI6Pq?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e4e0c-6516-4c96-d5e2-08db6785622f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 18:31:18.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgCdEQzrkVa6/gKJ2gnZ/QApMmZlq6hihocjcw/mtvSQRxEchGNXxUd+aqhNXitKdPkn5sa4eaVMnd/g0XATz1PDSkeOrf7cD1NYfqot24c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
 query api.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 04:49:09AM +0000, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: 07 June 2023 01:26
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Dugast, Francois
> > <francois.dugast@intel.com>
> > Subject: Re: [PATCH 1/1] drm/xe: Report tile count from device query api.
> > 
> > On Tue, Jun 06, 2023 at 03:19:29PM +0530, Himal Prasad Ghimiray wrote:
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > >
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > 
> > Does userspace actually need this reported in the device query?  It seems more
> > likely that they're going to need a tile-based equivalent of 'drm_xe_query_gt'
> > that returns not only the tile count, but also further details about each tile.  If
> > that's the case, then also adding this count as an extra field to the device-level
> > query seems redundant (and the existing GT count seems like it's probably
> > redundant as well).
> Hi Matt,
> 
> From userspace  perspective the requirement is to know number of tiles supported by device 
> and agreed 'drm_xe_query_tile' should provide this info along with other details.
> Can you please provide your inputs on what other details can be part of tile query ? 

It's really something that would need to be discussed and agreed upon
with the userspace teams, but I imagine details about VRAM might be
something they'd want to receive via such a query.

> > 
> > Are there patches for any of the userspace components yet that show
> > how/when they'd use this?
> https://patchwork.freedesktop.org/series/118927/ exposes per tile vram addr_range via sysfs. 
> While writing IGT to test this sysfs entry, I came across the requirement. IGT patches are WIP.
> 
> Just a thought, will it makes sense to expose number of tiles device supports by sysfs ? 
> Something like: <device-properties>/number_tiles
> IMO this info should be available to userspace even without making any code changes .
> There may be other such potential candidates which can fall under device-properties.

That's really something that we need guidance on from the userspace
teams (mesa, media, compute, etc.).  It's hard for us kernel developers
to really know exactly what the best uapi would be for userspace.
That's part of why the DRM subsystem requires that any uapi change
proposed for i915 or Xe can't be added to the driver until the
corresponding userspace patches have also been developed and fully
reviewed.  We don't want to write UAPI that winds up not really meeting
userspace's needs and then be stuck supporting that broken uapi forever.


Matt

> 
> Himal 
> > 
> > 
> > Matt
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 1 +
> > >  include/uapi/drm/xe_drm.h     | 3 ++-
> > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > b/drivers/gpu/drm/xe/xe_query.c index c4165fa3428e..54efbefd663f
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -197,6 +197,7 @@ static int query_config(struct xe_device *xe, struct
> > drm_xe_device_query *query)
> > >  		hweight_long(xe->info.mem_region_mask);
> > >  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> > >  		xe_engine_device_get_max_priority(xe);
> > > +	config->info[XE_QUERY_CONFIG_TILE_COUNT] = xe->info.tile_count;
> > >
> > >  	if (copy_to_user(query_ptr, config, size)) {
> > >  		kfree(config);
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 0ebc50beb5e5..8e552aa55037 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -185,7 +185,8 @@ struct drm_xe_query_config {
> > >  #define XE_QUERY_CONFIG_GT_COUNT		4
> > >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > >  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > > -#define XE_QUERY_CONFIG_NUM_PARAM
> > 	XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
> > > +#define XE_QUERY_CONFIG_TILE_COUNT		7
> > > +#define XE_QUERY_CONFIG_NUM_PARAM
> > 	XE_QUERY_CONFIG_TILE_COUNT + 1
> > >  	__u64 info[];
> > >  };
> > >
> > > --
> > > 2.25.1
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
