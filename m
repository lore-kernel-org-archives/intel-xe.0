Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE403C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 16:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB5E10FBBE;
	Fri, 26 Jan 2024 16:05:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD310FBEF
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706285107; x=1737821107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=us+OLofJsuwS92texJM8B/3G0JXD19uIyljkatWJcyg=;
 b=bdx/69nx263TTpeUfgoASccqsWiLjQDhQFXCZb8J40u3pWRlsgnf4pHv
 b0tliDDxuVAqhBJoNOOeFDj0EaMkIO0tVNaRV/Q/LOL6800o9Af4F5Yo5
 Y0LVrloqKQKrVfBzQwePwefBi3rSlMMn0TdrDDcPfB4n1U4k+nzvvSL72
 CyFehrGWCdsmdt8F32nvm+S+4jUZ3pqZ0/coIOe6mIt6NEa52S6IrxBsA
 SbCwNfl7ikmb+L4AVoob1ajZ3n3FVfMNY9UNon8DgPXayyl9k/CQipSjs
 kWj8tEtkPnWsk4d29yIsOOrMzGrxmUA+KJNT5Il4nIOuTvslOJ20KnoMF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9880342"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9880342"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 08:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857432172"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="857432172"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 08:05:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:05:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:05:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 08:05:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 08:05:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYYCh9RvoO7+uCtz3f3Ho0JKfDftJ786zWpT+0RRazBdoY8nl45f2wfZpMf22edrcuoKOTTNQCuerGQV3Stl8OUNdSMEK7G0GSaT3ZKu319WqCPZ7spTCGKvO0k+mq7QUfU/8mLvble7uBPTTlCpqS/ISiewVzNtcRZaUddXr0SsoOUZbFnwCD5xbXjxqBmhf6YYzjeAi0INskPIJWv1fIZKgfPAXzXw89gcYusib9XoB6JFItgStVffHVznW22nJjUU2PtHQcL9qPJKVyx/ncyikYSH7HC89NMXuewXV53JbMWI8iefa2Ty4wvxP6OB8AX1/aqdDG+JXBaK7UfY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmhPGyrSAsBJI/yCCCvbs3yHJ2NfarRKgG45igx9P34=;
 b=coTWJ3luZ7tnxEYrnp5OXZoDPfYwOW8YrTc+b5zEGFqsrpgVUP6prTHSau4SaLaa+GifIX9Ra/vRWn6fpa3qx0iCYYjFecgSIaeiHfVShWo7INQIdmHgCZXAmwNY1rvhVdJXwadaPbEO3EWmGQH+qYd/dqO3qEi9OG+GeVAuS5pZlujcGkbiVsR1Hj8zmlN3eM4GwSDWcyrr14v1mRaRTHArYEIbGAGB4UiPCSj78PC8oa6lDk+A4EkGwCUrVDL8+cyD2y5yjKEfgfqYBe9z3gIbd7a+oIL3eQ2IK0WMwUNUjIRqLWuV9ZZsv+oeCuROmHWI3etnLT70FdaFa87anw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 16:05:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::63a:96cd:589f:5b76]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::63a:96cd:589f:5b76%6]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 16:05:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Thread-Topic: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Thread-Index: AQHaUG3LGQ6gXKP6Pku5aokvA4lLKLDsPy4A
Date: Fri, 26 Jan 2024 16:05:02 +0000
Message-ID: <CH0PR11MB54447377526CBD16DC719A3FE5792@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240126153840.7-1-francois.dugast@intel.com>
In-Reply-To: <20240126153840.7-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5295:EE_
x-ms-office365-filtering-correlation-id: f0a317e5-bee6-4765-184b-08dc1e888dcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZRanLFCCpFdf9VI7g30v1MTS86CPkCq631PLIlxogU0s7fH3K1k7bjr4MEDQHohZ+rz7jW5SbrJdzRbeaGzWb/3QSVL/cc7DbhTZWqcUnvadfHKvchNQ6j1/J8nZ589qCBmNJDNwhFL6ivoeNrHI0NQSNOEA3GWLSuuYfA85Vvx4hP9qxyPL6C9b62B0ZtSR4jLElLUKdzazS1v4WboJDxWQXpeYif1Ymn2ahXm0bnpy7dSZdS1HpKbiOr1SwrDNc8JBQsx4Y15KS+50v+WhdPmJD7j1azTKiGcjmvUOJ72jrdCFwz4MH5rFoxBTPbt1rJ2Yb7kqqAE9RZRIyepoQnrK1dh/DMRWxv3wNBbjhavlbYQ3oIWFace5Bhj8X1YL3/7SCfb06r4SxJSaN/JFBhSqtrXbI1M01sXMFNU25HgKszOS1Zn0EF7NnugZwJlt+B0TA+Hm3p32Ikpu2yEPNRlibUm0tz5TvSShIP9QSi552q5WwodwiJe5Y8HSTYlGsr2QXevDIF7zR/ColMGvHAw5p5zewKhAoVNqI/iZGbjKONUv+KZwxLbmSgfN4bLk2BL+jS9/2iwtUicT3uHdd/kLA72pDQI4xzopPyWu0VsYAADmyiH5RmBa8vARlNAF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(38070700009)(5660300002)(26005)(122000001)(8676002)(4326008)(8936002)(52536014)(82960400001)(38100700002)(2906002)(15650500001)(83380400001)(66946007)(64756008)(66476007)(66556008)(66446008)(54906003)(76116006)(110136005)(316002)(55016003)(478600001)(7696005)(33656002)(53546011)(9686003)(107886003)(6506007)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eJcek1x5JCQ+gRar3rttcZmptGqGRPJ1EvdX/1GkKSLjfIa9ph5uWplAiHT6?=
 =?us-ascii?Q?fTuGdXfLT0hdd57cuOQzlfMXPBqP7Pnagbocyokp3c/FEXRBiw7o2DqKyvaI?=
 =?us-ascii?Q?ZDXdbr4+W+WkUzuSXy1vLaJ6kbaZxfKVuw2l8WThu6JgrvIL4cMss5pMdolh?=
 =?us-ascii?Q?1ta1Qkj+Vb54vyoO8O8W9FW1LyZP6WAESDyYqFgPX5AeRiLoSBrn1Da5O5cQ?=
 =?us-ascii?Q?m/8hdS3bLyfha5/OuXVEsMiK+MXB5BIVHasWjnPDQU/H3eYupbuGZ7sSbG5M?=
 =?us-ascii?Q?m+QJ2wsV6ZlghnclnUe2BU2kI5ZWuvjYdiHRke40maeZuI7I7GP7dA/Nbl+k?=
 =?us-ascii?Q?hJnvqAoY/BfEKKxHqkQWTULfiJUCzOSpWb1CmJgSEuPE0xu9V7hEjyRvV1r3?=
 =?us-ascii?Q?lZCQkiLCb3hdb2H0yT6NBmWc/+80AYjvjAJlm1FMaUi/0zWHjFesHJsCOY8V?=
 =?us-ascii?Q?qpgMY8QEE+5RJaN7YnyMdUchiLU0W1zEoQq/JAvOeBxr+E26wpsbaqt0Y/XN?=
 =?us-ascii?Q?ls4VGGisn3yaMN5dFOBxHbkK6G9Gp+0+fHDw6DZKvlGc6DKC8phkfCDKtMFt?=
 =?us-ascii?Q?nW9DWP5DNG4SRxOCK/pcTM5ErnFf1s4uI6zskKD34ZJquzFDYisJz27iykAC?=
 =?us-ascii?Q?E6GXNsD24ffC8TnvUp1krjppiMcdtwyOMGc85PnNyHClqHkgHf4nGgqpjyhX?=
 =?us-ascii?Q?7Yk61i6YazWaE8eql3ltkEsXoxwBxYMEeQv2wmGq/tqFmhwTLvkuj9z5mK08?=
 =?us-ascii?Q?4CireBNdqpjMrs5MhzWcR5YNPqHQ/Jy66LogIN5d55upZswdK5Df0da7A0zE?=
 =?us-ascii?Q?i6wWZRkYWZPlsP2Z8ZUtqLs4W5r/uTza2AO/WK8ptWmLEkExorSjINMAnK+i?=
 =?us-ascii?Q?MDH02EtPDNEzKI0Q0f2qW8+sVqEjjC51PH36BV+VQKM+5QoqqD5aPHpuooW6?=
 =?us-ascii?Q?J//CCeqew1u919aFrZ9i3urMafkZW7IHi4rxR6zCHSM9Z4diMivFZotHji/e?=
 =?us-ascii?Q?NFbBWGfdx7B7UD0WewpHN/7SrYONn4iQMfB8PpQyPMGoiz9vZz4jgI2//QhR?=
 =?us-ascii?Q?HzJTA6wY/yaFAoGHv4olJ3wo7rvxQ54EHt31lnbSjHMR34v/MNyZR/KI+dWU?=
 =?us-ascii?Q?tWz9QNMQsgxmFENDtdYh101ELLUI22UvSD7ylJXNc+sLRCOA+PtMWssVmKIr?=
 =?us-ascii?Q?qQ2CzDHM3NJisU3c7KQG6Sl7rA5UUb0gveFdbU494HcWcpgGmxZGv3GFbm4y?=
 =?us-ascii?Q?WKFUhEcV6Z+FxL/rDLlw0AjrqqYcrCRiHLtrkfeoXKZhjbAUnSo+A7Yp9uvG?=
 =?us-ascii?Q?boqQziGye0JYMtT20IdjlIoGJofXap8SLAm063zSj30CoOKjVoSHzrQPkRX5?=
 =?us-ascii?Q?CrV4obP8kBh2Lj+8HvSFGgeG0zuNUeVhibcuouPSIVahEDnZkhKtCe7oIBSJ?=
 =?us-ascii?Q?tKJ6qo8UPjnBIc1u6z69jxgzFpXmJO6s00PSe7UhokfNMBWlF1zRtKEaiPX2?=
 =?us-ascii?Q?90d9WHTY5IazJtnmIUatLkRacVyjvdoNsiyYrwKUJaIH6OavOjWUIFx4TT/V?=
 =?us-ascii?Q?zcQKyK263Cp9c1qP0i155ZrsGD9HMLhBt4OWWr0a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a317e5-bee6-4765-184b-08dc1e888dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 16:05:02.2671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaJILO0+BP4A3qa7Bam1wOYYfcxn0wD6BAI3JBpKMffgyM134qvFdplTc+OG5CpOQNx3lKuzSTWcrT/0jKmuQLotprrWxFPvAanDFkNTRSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Krzemien,
 Robert" <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

-----Original Message-----
From: Dugast, Francois <francois.dugast@intel.com>=20
Sent: Friday, January 26, 2024 7:39 AM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonatha=
n.cavitt@intel.com>; Krzemien, Robert <robert.krzemien@intel.com>
Subject: [PATCH] drm/xe: Add L3 bank and node masks to topology query
>=20
> Expose the masks of L3 banks and of L3 nodes to user space. L3 count is n=
ot
> sufficient because in some configuration not all banks are enabled, so us=
er
> space needs to know which ones.
>=20
> Bspec: 52545, 52546, 62482
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Robert Krzemien <robert.krzemien@intel.com>


We likely won't be able to push this change to XE until we have IGT support=
 in place to exercise the newly-added L3 Bank component of the topology que=
ry.  We'll need to get that implemented before this patch can land, unfortu=
nately.
Besides that concern, nothing about the below implementation seems wrong at=
 first glance. Though IIRC from I915, userspace only needed the number of L=
3 Banks, not the raw node and mask values.  This may have changed between p=
latforms, though, so I won't block on this discrepancy.
-Jonathan Cavitt


> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 38 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++++--
>  drivers/gpu/drm/xe/xe_query.c        | 20 +++++++++++++--
>  include/uapi/drm/xe_drm.h            |  2 ++
>  5 files changed, 71 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index cd27480f6486..f8606649d1e2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -156,6 +156,7 @@
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
> +#define   L3MODE_MASK				REG_GENMASK(7, 4)
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_=
gt_topology.c
> index a8d7f272c30a..6f4cf147a7aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -13,6 +13,8 @@
> =20
>  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_L3_BANK_FUSE_BITS (32 * XE_MAX_L3_BANK_FUSE_REGS)
> +#define XE_MAX_L3_NODE_FUSE_BITS (32 * XE_MAX_L3_NODE_FUSE_REGS)
> =20
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> @@ -62,6 +64,36 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
>  }
> =20
> +static void
> +load_l3_masks(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask,
> +	      xe_l3_node_mask_t l3_node_mask)
> +{
> +	u32 bank, node;
> +
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1270) {
> +		node =3D REG_FIELD_GET(MEML3_EN_MASK,
> +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> +		bank =3D REG_FIELD_GET(GT_L3_EXC_MASK,
> +				     xe_mmio_read32(gt, XEHP_FUSE4));
> +	} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1250) {
> +		node =3D REG_FIELD_GET(MEML3_EN_MASK,
> +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> +		bank =3D REG_FIELD_GET(L3MODE_MASK,
> +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> +	} else {
> +		/*
> +		 * Here the mask logic is reversed: a bit is set if the bank is
> +		 * disabled.
> +		 */
> +		bank =3D REG_FIELD_GET(L3BANK_MASK,
> +				     ~xe_mmio_read32(gt, MIRROR_FUSE3));
> +		node =3D 0; /* Unused */
> +	}
> +
> +	bitmap_from_arr32(l3_bank_mask, &bank, XE_MAX_L3_BANK_FUSE_BITS);
> +	bitmap_from_arr32(l3_node_mask, &node, XE_MAX_L3_NODE_FUSE_BITS);
> +}
> +
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_=
regs)
>  {
> @@ -106,6 +138,8 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_l3_masks(gt, gt->fuse_topo.l3_bank_mask,
> +		      gt->fuse_topo.l3_node_mask);
> =20
>  	xe_gt_topology_dump(gt, &p);
>  }
> @@ -121,6 +155,10 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_pri=
nter *p)
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
> =20
> +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> +		   gt->fuse_topo.l3_bank_mask);
> +	drm_printf(p, "L3 node mask:        %*pb\n", XE_MAX_L3_NODE_FUSE_BITS,
> +		   gt->fuse_topo.l3_node_mask);
>  }
> =20
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_=
types.h
> index 70c615dd1498..adb1de613e77 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,11 +24,15 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
> =20
> -#define XE_MAX_DSS_FUSE_REGS	3
> -#define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_EU_FUSE_REGS		1
> +#define XE_MAX_L3_BANK_FUSE_REGS	1
> +#define XE_MAX_L3_NODE_FUSE_REGS	1
> =20
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_R=
EGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REG=
S)];
> +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BAN=
K_FUSE_REGS)];
> +typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NOD=
E_FUSE_REGS)];
> =20
>  struct xe_mmio_range {
>  	u32 start;
> @@ -332,6 +336,12 @@ struct xe_gt {
> =20
>  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
>  		xe_eu_mask_t eu_mask_per_dss;
> +
> +		/** @l3_bank_mask: L3 bank mask */
> +		xe_l3_bank_mask_t l3_bank_mask;
> +
> +		/** @l3_node_mask: L3 node mask */
> +		xe_l3_node_mask_t l3_node_mask;
>  	} fuse_topo;
> =20
>  	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index 9b35673b286c..fe3906e8f721 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -453,10 +453,12 @@ static int query_hwconfig(struct xe_device *xe,
>  static size_t calc_topo_query_size(struct xe_device *xe)
>  {
>  	return xe->info.gt_count *
> -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> +		(5 * sizeof(struct drm_xe_query_topology_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_node_mask));
>  }
> =20
>  static void __user *copy_mask(void __user *ptr,
> @@ -515,6 +517,20 @@ static int query_gt_topology(struct xe_device *xe,
>  				      sizeof(gt->fuse_topo.eu_mask_per_dss));
>  		if (IS_ERR(query_ptr))
>  			return PTR_ERR(query_ptr);
> +
> +		topo.type =3D DRM_XE_TOPO_L3_BANK;
> +		query_ptr =3D copy_mask(query_ptr, &topo,
> +				      gt->fuse_topo.l3_bank_mask,
> +				      sizeof(gt->fuse_topo.l3_bank_mask));
> +		if (IS_ERR(query_ptr))
> +			return PTR_ERR(query_ptr);
> +
> +		topo.type =3D DRM_XE_TOPO_L3_NODE;
> +		query_ptr =3D copy_mask(query_ptr, &topo,
> +				      gt->fuse_topo.l3_node_mask,
> +				      sizeof(gt->fuse_topo.l3_node_mask));
> +		if (IS_ERR(query_ptr))
> +			return PTR_ERR(query_ptr);
>  	}
> =20
>  	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9..eca8f5f502c3 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
>  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
>  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> +#define DRM_XE_TOPO_L3_NODE		(1 << 4)
>  	/** @type: type of mask */
>  	__u16 type;
> =20
> --=20
> 2.34.1
>=20
>=20
