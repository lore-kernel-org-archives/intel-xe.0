Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AABC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 04:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE70310E422;
	Wed,  7 Jun 2023 04:49:15 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AF510E420
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 04:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686113353; x=1717649353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXjsGqRHVv4R9hnseniZTFewU/VXzsSOFRNLt94DY8c=;
 b=EhbVpHcMnYbUuzDNCiRVTHv9xJA4ITC5BdAVkwE2DJLXw3qC1ta8CCzH
 edogi+71b92V7C0wSzncQSM1CHcQ/weRgc7TvEoi2oeTlfwJn/dhPrsym
 MKjuyv20D4cpLSvfkOHb2lQmJkFyVGLu9neLpQyc6Hb1BaI74YriOgF9i
 vA2oxlzLW6bZd2DMvenmTiGfY0x1t9Ex6C6fOanJB14Zk0mO40i5Y4adk
 Wm21DL7qMpwY8dQSWafri52xXjQ3Km4a8+SNInA4YCoaOiD/t5eI7P2fD
 lBjY8FthMwe84Ojj2TTNeTjJAZ4RAsDu0fWrnpti9hsBa96U8bVfbHZ6b Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359347942"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="359347942"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853686850"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="853686850"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2023 21:49:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:49:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:49:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 21:49:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 21:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4HNoEbio1K3bYI8wvY22zQdru/kGmniHz8gjnFLcmaT/92K+8s3gEPUcWmycuHWCyYWA/8kZ8vFfkFhTB5BBlrSggp9KeFEmxFheqjLwN8iBzRg57swZKzc7gw2OKZysw7hvdRuUhPEB7RFYc8fvFq6a806BYA/rqx3/G2okvMM8+Q0k7yfwYy9P+Rm6JIs49QLKiyNADeAOSiKDD8ij743NqVRfJ3rsiytg8ux32kxc9y8Dwve8RBig8PyI9+6GW3862wjZbFGCs+sfJ7QtfFCcOoy5FdsA8saKeT4fmepB19aunf3XX1UzjtNQi2HvKXMcq+1//QSbsZSXFraRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXaQhviQ2DRU7E2qJEMOqTjK/WBdV0H2YEnz52/PjJ8=;
 b=I1kFf+LzICyx293Eo8JWvJLsc1gVnuK0fbuamQYiYi+2A7eVCZtkRFhinyLgbveUXXmmWXZvGrZ0rC0vOwbvM2adbGBpxO9Mzosy7mCThRybmBf29gpsGkOkF1AkH44qFf0l+TbT89/eIjjFGXRUm6y1PxObnzXihyOd0+xR8vBgj0IvFqzSo515GUKqwNBM+we+TCmKRUCPq+RhajXuU8Gnb9Q8d6qgDoQEtFOPYUqBWyx/v3xQFQi55jyUckrpK3PIwX0APf9J2Jwk4JlZnUiJxBbG52aNtx0YBMyMFzrapwdvi3qA5qpPG+5htfQuDw7gHEVPQoKsoMVTPyiXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 04:49:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Wed, 7 Jun 2023
 04:49:09 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH 1/1] drm/xe: Report tile count from device query api.
Thread-Index: AQHZmFuqLHh/vACXIU+8q43jJBmKMq9+MReAgACPkhA=
Date: Wed, 7 Jun 2023 04:49:09 +0000
Message-ID: <MW4PR11MB705690A2A21050E31CBF545CB353A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
 <20230606195555.GH5433@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230606195555.GH5433@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA2PR11MB5211:EE_
x-ms-office365-filtering-correlation-id: 503b40f3-123a-4fa7-fbaa-08db671287f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x18wb75fol0m4OgQGuRR+msRfEboMvzmfQqGPGBZajOeoA3PI00IYp5LNOE5YoD8F+wY0wQhthJMRN1+u8wziKopoH0ZmZ2BEYtICFKF/vDTsQ00pR9fajRS+/BjoMjxV/SNBZdGNLCKjfHePM+9KSFpwKQ6kiM/qAD07wSXQi74+zLEMkfCy7E897hhe0QUc5VNsXf28ya4HyN2B3lRj7KGBuKmaP0eGKxY2PgUt8PrWTgAEh4n6dmfUjEiAvD1FEa4jh0Urw/qeRr51ZtEoR+/wMDIWUYdWqkpZVm3NTtOOhr2u1a9MngosnNpdsnHX9VIVbdLhsJ0IzsECzOmEK9eKxzCkonYqVTaRbg18JQEfxLQyPiESkZ0/kYLxpK6Kt5pzhHBbaX78YagK3Bln/rWJwnpJ546Fu63kTZxqeh5i7C1wopzmt0kcfJLhlI3qc6zQmhDvB+ycbHXHgHFdh38KFbFqCRmtjZJCffyayowUGQu3x70bn75idTxeRaO1IYpq07srMMJSOyB9u0Qv0NIP1mQR8nGtV/iCXY2dkRxTq2m4OQYqPqTNS+UNY2w
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(107886003)(53546011)(9686003)(6506007)(38100700002)(41300700001)(7696005)(186003)(26005)(966005)(83380400001)(71200400001)(478600001)(54906003)(122000001)(66446008)(6636002)(66556008)(64756008)(66476007)(76116006)(55016003)(66946007)(316002)(82960400001)(2906002)(8676002)(52536014)(8936002)(5660300002)(4326008)(86362001)(38070700005)(33656002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q6qQ9AeZaq6tIEWDbntWMFKVam1ECttPe+CRmA6TQiIAMiH2t3W3OqkkWltm?=
 =?us-ascii?Q?7Vd8v4FK4F8dUyTZejhuXSt5WGR8m8EJCfzbgtH7nMAtApNJMBkmLibtWQp4?=
 =?us-ascii?Q?elk17YyfhjTyfEwoAtUbQhgNKVo1A8gCspF5RH2ALuzu4sJJFmOb945z1NwZ?=
 =?us-ascii?Q?78SwwRiDReNYpAts8n6RkCWDQ+hcbpxBXX4D5/cYOvKbEUcT0vxRwNxSnjZQ?=
 =?us-ascii?Q?A/EMqbTmEgbOZJwfeQaAcO2AxK+ZAviF81b2HPisBvy0X/pjVJnEZrDQap7a?=
 =?us-ascii?Q?G8kJbbgpmZ6cTv8MtcISxoe/Zr9/HBK/0y5CsHQx+5kGsHC92VsHynEWgC92?=
 =?us-ascii?Q?0H+uwyLulACk+ihDnLWeo5/IdDkNncLZOIPDpiho18C6/t7qgOMXM72FHfJX?=
 =?us-ascii?Q?p1ILTqhpF7LDSrzPPwN9iBB7C98ODrI3VBwkr7l01uQujj6D6REikUoeBOmH?=
 =?us-ascii?Q?Fm3jKlQmPS8B04bkNaERh/xn0LX+EtMcgndWCPd82UuwGNp3m4aQTnUSDf2F?=
 =?us-ascii?Q?+1bp2ERA1A6+m+zajvhoUvUh2lrbu0LLTxQ7Qziw3pjaTe+GksjUdFS019Gi?=
 =?us-ascii?Q?Q7kdy1dBcShdKyZX+WKenuep5FDTievQXpT5Yq+R27Z4L7V0B26aUOL8m7Nf?=
 =?us-ascii?Q?8g0EKFMr66xveZo8fCoaMMzT69Gd35ZBfv5oIzNmDUIOnK5jRRD/lpyIAo7A?=
 =?us-ascii?Q?3Qks4XHZv3JLwiN5Veek/pNwAI1q5R7/814wC9uqcxgB3SNy0SjACA4ycP8a?=
 =?us-ascii?Q?j9dn64tufZG2KNGiPpfZNmg/kP+oVr5953cE0udmq6jCZQGoWcgJzDRtlbfP?=
 =?us-ascii?Q?NTsAITrOfduHGGBUP2hB8SDmcja+PFOosCC2X/1IGY0bS+J21xpCrVeau+jC?=
 =?us-ascii?Q?rylLxVHajPGGlR+QikbcD0ta6DuSGvLOFl1Gzx3plMhhw6R8PE1tZ0S8J4+s?=
 =?us-ascii?Q?n2HpHkhV5BlbR7GrcQnlBUDT0vFS+Tca5WqT6TxOIBdxEOSbAwNXYn1HI7G2?=
 =?us-ascii?Q?gRDSespO5oG8xEYkpy6ReX6JE6NDyhpwA6PhU0JWbEkOgCQY/sBD84qLioMh?=
 =?us-ascii?Q?rfLFuAqjlsqRtg0wTQZmM14548QHxgR0Xjxy2A2mf0C0yKP4k56g9fBCaCnq?=
 =?us-ascii?Q?zumqlpXhYLNEaoQQtGjocYiaXzp4HaTOqiXdndOxiZC+//LlXQNPrQyYTES/?=
 =?us-ascii?Q?kMIXm0qbmUOcjD8nZbXodPL5p7JhdthUYY1w3B+1m73me9ka0gB4Il2Q1FVW?=
 =?us-ascii?Q?LTcWjSWBr9qJduiPNj1lLuXLQU1NFAczKTX41hLpTym/FW05wucChkSrVN0M?=
 =?us-ascii?Q?bt3p0krjodusFGod1TuJQaj0YauYh7/gNrpg/OSSGJ+A6tvjbDgKpl49ILLm?=
 =?us-ascii?Q?2lAZe4VRTvv+Yjmw31LkyDmhx+VOQRgLA47Yi8jWzgvF6I5dFB92z61q6zdf?=
 =?us-ascii?Q?84k2xrMc/mSgbzs8MLryFQ76KPPSJCr2/d8n5X7OyrP9YFxuqZ9I0hpCZ2RL?=
 =?us-ascii?Q?3WKSPt2bfxmDW57GhFjlRN9siOOjVScCuBiPiyfXHfFeNGRzCIN1beJtxLDg?=
 =?us-ascii?Q?4evDNoX+Ao5hWgNpp4zm9uEm7aiLHauOiujUZyJvwVWtt/LHb14GaMPlVUam?=
 =?us-ascii?Q?/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503b40f3-123a-4fa7-fbaa-08db671287f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 04:49:09.0777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6lMiWdm8S8r4ulv/XmOHY58yxJ5Rvj2sy4RmwVKddwi8CAtfeamDz3/f3w/r+xMFbpDOYwM3hvUAG7nRZGoGiBsZPdDI4BzGfGwjpHGFqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 07 June 2023 01:26
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Dugast, Francois
> <francois.dugast@intel.com>
> Subject: Re: [PATCH 1/1] drm/xe: Report tile count from device query api.
>=20
> On Tue, Jun 06, 2023 at 03:19:29PM +0530, Himal Prasad Ghimiray wrote:
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> >
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>=20
> Does userspace actually need this reported in the device query?  It seems=
 more
> likely that they're going to need a tile-based equivalent of 'drm_xe_quer=
y_gt'
> that returns not only the tile count, but also further details about each=
 tile.  If
> that's the case, then also adding this count as an extra field to the dev=
ice-level
> query seems redundant (and the existing GT count seems like it's probably
> redundant as well).
Hi Matt,

From userspace  perspective the requirement is to know number of tiles supp=
orted by device=20
and agreed 'drm_xe_query_tile' should provide this info along with other de=
tails.
Can you please provide your inputs on what other details can be part of til=
e query ?=20
>=20
> Are there patches for any of the userspace components yet that show
> how/when they'd use this?
https://patchwork.freedesktop.org/series/118927/ exposes per tile vram addr=
_range via sysfs.=20
While writing IGT to test this sysfs entry, I came across the requirement. =
IGT patches are WIP.

Just a thought, will it makes sense to expose number of tiles device suppor=
ts by sysfs ?=20
Something like: <device-properties>/number_tiles
IMO this info should be available to userspace even without making any code=
 changes .
There may be other such potential candidates which can fall under device-pr=
operties.

Himal=20
>=20
>=20
> Matt
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 1 +
> >  include/uapi/drm/xe_drm.h     | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > b/drivers/gpu/drm/xe/xe_query.c index c4165fa3428e..54efbefd663f
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -197,6 +197,7 @@ static int query_config(struct xe_device *xe, struc=
t
> drm_xe_device_query *query)
> >  		hweight_long(xe->info.mem_region_mask);
> >  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =3D
> >  		xe_engine_device_get_max_priority(xe);
> > +	config->info[XE_QUERY_CONFIG_TILE_COUNT] =3D xe->info.tile_count;
> >
> >  	if (copy_to_user(query_ptr, config, size)) {
> >  		kfree(config);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 0ebc50beb5e5..8e552aa55037 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -185,7 +185,8 @@ struct drm_xe_query_config {
> >  #define XE_QUERY_CONFIG_GT_COUNT		4
> >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> >  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > -#define XE_QUERY_CONFIG_NUM_PARAM
> 	XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
> > +#define XE_QUERY_CONFIG_TILE_COUNT		7
> > +#define XE_QUERY_CONFIG_NUM_PARAM
> 	XE_QUERY_CONFIG_TILE_COUNT + 1
> >  	__u64 info[];
> >  };
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
