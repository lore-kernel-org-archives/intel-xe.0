Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD99DC41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 14:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263FD10E111;
	Fri, 22 Dec 2023 14:04:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A408D10E111
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703253880; x=1734789880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OwreCjydptdz4Q+mbRo+2kfYPgC/wakgdB2pQqeDOaw=;
 b=Mfy6Z7VhKTRfUmgW2QqytUQPUJUEaxcC6WsUVOPt2AxOsE9GQe4ClqzX
 8qrsZSlAhgg2iThWhhBufZFH9LzeYTNz45TY0uq9AVYAPnRP9NR1JiRcK
 u9RlQ5H1WomLqFxWn6djm1e4PcNMpl7YT9JJcDL4nqd7HapcHbY3P5aHU
 CbQ0wh4Ry5nRlrH7NvJr5Oo6XXeijE3klLkjL0WADrRMccwYepDw1Ovkz
 LEpT4NK+MWu2KmVI41REhEWRuOfrLqu0PfM5Nvx0fJ0jCI8/Ks1ERaexT
 K38r9y2WO7bpqcB4tyTphMowrJzJ/yvXQ+3JTd7JVwD3Y8IPAoTegDHo3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="395859146"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="395859146"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 06:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="867642614"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="867642614"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 06:04:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 06:04:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 06:04:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 06:04:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ceqc9JqYBmHrdSqWqRx1rv4wBtrx5AELv/vr+5skX0wnGLmVAG0mXaKxPW7Ag+lCiyDi8eAM/rFxkCMwf4H0j1pG8sCBGf+uQ6xab57T6iU0vc7lLAOB5RYzK4DHd4CUFjpjxkCVPSJe5i4aWETeyLnnl9/LbDx2lqGlN89CJGGlE+C92gm15cQWIZNl66X0E4c/NWLQ9FxmUK/sohE5WRoH+GxJbTMle4V1QkPpL2eTkB59Rs9paFXodJiEJFt70K4y4v4jcSbRq02NIitObMm4tqz2U/AuS0LGERdE+LGs24+f/clCnnogR6b1rhKko0ytH9BT4zNt7svQHaXOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKTWNmRdXh+2+ifn+oKgw/WegjmWIlKjRU5xQ0m3efU=;
 b=UA9m0beKbSH9vXylDCiJEYQAesrz69B1vh9fb7nTTqq+U+sNQi82FKyHaPf1YMk74IJSSVD/Ako8p/WDa4WJd9M7yHvmrFDDtHGtjkAvLh4h/96XCFDbm2YrygQIPfa1OlFkcl7GRb/9eAZdP2eKclOOorNqtKSi4VdZwxIuaI2FUfNvTkRIEfdzJjWQSAlCJPAjgDzyBKZ4jaJDjaTFGRNn7rie4kiVAjwNBZoTLZrurhNX799iK5cNUHlHljwDwcU6xyJfNtB+EGGoYrBgHOjpgDTuAe3EqnYKQi+MbRtddxlehUyVZasd0xStl+a6DggS9V1KUu2NDkGP2IlMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 14:04:33 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 14:04:32 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [v6] drm/xe: Add vram frequency sysfs attributes
Thread-Topic: [v6] drm/xe: Add vram frequency sysfs attributes
Thread-Index: AQHaNMTbY7op1p/q30Ku5LZRgdlPiLC1T5Aw
Date: Fri, 22 Dec 2023 14:04:32 +0000
Message-ID: <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CH0PR11MB5491:EE_
x-ms-office365-filtering-correlation-id: 5a7cb73e-2d10-4cdb-c06c-08dc02f6ec48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qRru2zge+A4846EI5Y45mBbQX5kKTmAK+NGJl7ZX5Vb8r+P9BuS3PaV8nbOzBKAFVLnLtz0S+EIzKhKdKnPjL+dSCV6S0Sw44EBL0fPVZjh9YwUp+Fg3GfrzqbPHxdAxD9f+nanL4YFAR5QZLr55zp/OMyopA2CK+YixEEMtZLzQ2MNFNens8cGyW3XSCVD+SB65ztBFqYCSGlONpTVMHEu/9pPPu4yTMWSeSJyK5okdgkccRJqVX1OLImKZcxh6I3l9P8Fj1yvyfy5I08rJblUYPYTci+yNPKEt70RzQ55LHlFrsUhrhrGgJiXiKStMuWXvAH6NbKFAEN13C2r5wWeEXy4sxCN/64g2tICnb+d0TKtgsrzqT+xhhdNwaFm1cVJInZ7AKXbUD7Ho9xa/QEz3Vm2LjuOp3gUdnMVOKZ0p10c+NBFAhgtiDCPs9Hkwn6ihWQtx318qTiDgEbg8It6rzKUyQzjgiFrmu9HynfNdF8SnRI6URQknaLjc22xD/DdvB/LxiKw7zZWtotOrN9PEHrHpzfSp+RTDf/h05VrZtm1aZlbnwYb+Go8efo2bd8yZ+iYOISulSNzmufc4K1Ra1klVZj/YLPh0v+XnU+Z+ksxgYy68l9UWw6LSSoSI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(9686003)(107886003)(38100700002)(122000001)(5660300002)(83380400001)(33656002)(86362001)(41300700001)(82960400001)(66556008)(52536014)(110136005)(66946007)(64756008)(8676002)(4326008)(66476007)(316002)(76116006)(66446008)(53546011)(478600001)(6506007)(7696005)(8936002)(71200400001)(2906002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y8cmPMrP+Ylb7FtsvzqqHUaCsTAuw7qSd+5nJeuxBbnon6KLQXkwrg9PMjMr?=
 =?us-ascii?Q?wEIFIDcL9hdkKuOI8ddC3Izn8qkN5pnYuh/hT1iPY9rf9N9jph3y7CElBaa+?=
 =?us-ascii?Q?AmQEGgrGlvnf+821kBY8/QJlxCADIAplvjAN04l0T52LTdW9bSgHaqV3czdC?=
 =?us-ascii?Q?5ZyYmy2RkvgdQ+19h97fX5mrdI25gAPOaTT38BzN22+vIBAjEOaA7b9gzUTu?=
 =?us-ascii?Q?gEjlip1MlXdLUVJPyxMHh/gsrSwJyr4mLiyOSIfn5v0eOC5c6vuiuvV9bDW6?=
 =?us-ascii?Q?oVPs8Uyr7SonA71Ji9SLLWukv4SAQd0aYlYr+UXwBMjAnRKwGyiAHVOisE0h?=
 =?us-ascii?Q?7OVDIaNsEzn3af3Rf07qfSwRxk8tUrUJqGyrAKVwGPIJ/yOfFQ125eVYMZYn?=
 =?us-ascii?Q?Pjd20NZg86xXZ4NzNQINVTH5KBTKpMOct2FmnInhqCWBomZPvAoFDoneLFmO?=
 =?us-ascii?Q?ixha46eenjzNhO04TdDtQBuyRb8qsXFjcvfpf74+lLbRRVx7wJTglr+UlqX+?=
 =?us-ascii?Q?GIX4hFImaUebb83L/Gvjt2t2JjBF+0pw4hmKPhbDbXSxHR31owJKpm8zUVuv?=
 =?us-ascii?Q?2SJr2X72dlF0cXq61fQQH5s3F9WBDLoPPhP74FRWT5u/ol77GzkBVQ6W87hU?=
 =?us-ascii?Q?VchVbLMs9r+UFku3wobM/r+/F9eTC5/vmes8ekI+x1z4n2yu1s7lF28VmNjv?=
 =?us-ascii?Q?KL6SI9J4A5K/SlEAJMAAe48wGw3Ub2ZxQUmO0OSs/m1H728Uh/oE1HO/8riU?=
 =?us-ascii?Q?XBtBUC+CEqap+3jG8APyiEWUh00B3BEgElYWdsWcMLB5Nma0QkLfhY9c//Ud?=
 =?us-ascii?Q?G9WoY/Yt/+uTIMprl7g86FuIKHUYsopCLBHd1luLuMfOhF2EAPKXc1toLg7d?=
 =?us-ascii?Q?vBIUQpUzJ9FRMqulbHNXwpCT3Tp4cPe4lyCdLNSP1M49n3Svn4QfTlDcWFrA?=
 =?us-ascii?Q?Yn7Awrt6wbtftUeTuN2d0K/zhXIGhvcGtjtM+f7XOKJTgdeQG5BlClctj5tx?=
 =?us-ascii?Q?ClEwJs8viOpEdE8qCdN5nP7sBIEr+HRGN4SizOf1QXUPEb/OmtEHzFochmyZ?=
 =?us-ascii?Q?OjIuD6wy61b1AFpoHpHzxGHqunmGAZhJAnfryxDW8rznnm19amHJakas5c5j?=
 =?us-ascii?Q?Y21gGJMV6KLJv+Rpkek3eavJ8aQuPTYEURvQecEROfuJ2DbCE0manIBei4jD?=
 =?us-ascii?Q?+IxwYHR0cBcO0b6RWf3bWHjHplgCFVRl6RgF1nv9VgKAp/l1tbujYnK1S3EE?=
 =?us-ascii?Q?Oa8DezxktsnEbBhXpyxPAGgrl6GPGRH2X9lT0wP4aN2VqaNurVyds6YVTYNz?=
 =?us-ascii?Q?I3z8EG3WBip9ovU407yo1eFsMybvx346yg2jmUw9YTYuDQYuNQv76M92oJQI?=
 =?us-ascii?Q?zt2T2hgJRwyn9ePZztQ282W9y8JpNVMsduGbs3OpS42CfxTQYMIKJniZFNip?=
 =?us-ascii?Q?4OUbqb3ENH/pu5XMwa6ZNbjeleVhQnRrBZydqneCP3OojG/G/BXAWB6V57wp?=
 =?us-ascii?Q?DlW0JThxlWLPllWYBY17zOKhcF1RU8djsJWgcAKR2HrYAIwvGBiTsQdC1lsh?=
 =?us-ascii?Q?PCOyKXZUj2w71A4Prik=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7cb73e-2d10-4cdb-c06c-08dc02f6ec48
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 14:04:32.8661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QHxogRzcaUxGxOUO5nqP7gnpDmWdXNX8pszy2hwIACSL/zshnbjqzxTwAHPmcgn5ORVPGfDsBZyB+ZRAG/QGKKd0kAl87ro8RbEYcg4eIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5491
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Sent: Friday, December 22, 2023 4:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [v6] drm/xe: Add vram frequency sysfs attributes
>=20
> Add vram frequency sysfs attributes under the below hierarchy;
>=20
> /device/tile#/memory/freq0
> 			|-max_freq
> 			|-min_freq
>=20
> v2: Drop "vram" from attribute names (Rodrigo)
>=20
> v3: Add documentation for new sysfs (Riana)
>     Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>=20
> v4: Create sysfs under tile#/freq0 after removal of
>     physical_memsize attrbute
>=20
> v5: Revert back to creating sysfs under tile#/memory/freq0
>     Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>=20
> v6: Rename attributes to max/min_freq (Anshuman)
>     Fix review comments (Rodrigo)
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
> ++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..f153ce96f69a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,13 @@
>  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
> point format */
>  #define	    POWER_SETUP_I1_DATA_MASK
> 	REG_GENMASK(15, 0)
>=20
> +#define   PCODE_FREQUENCY_CONFIG		0x6e
> +/* Frequency Config Sub Commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* Domain IDs (param2) */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0f8d3e7fce46..cdc9dbbc97b0 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,21 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>=20
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>=20
> +/**
> + * DOC: Xe Tile sysfs
> + *
> + * Provides sysfs entries for frequency in tile
> + *
> + * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a
> configuration and read-only.
Let's increase verbosity of doc something explaining it is a fixed fuse poi=
nt not a configuration.
> + * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a
> configuration and read-only.
> + */
> +
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>  	kfree(kobj);
> @@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type =
=3D
> {
>  	.sysfs_ops =3D &kobj_sysfs_ops,
>  };
>=20
> +static ssize_t max_freq_show(struct device *kdev, struct device_attribut=
e
> *attr,
> +			     char *buf)
> +{
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt =3D tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> PCODE_MBOX_DOMAIN_HBM);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *=3D 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(max_freq);
> +
> +static ssize_t min_freq_show(struct device *kdev, struct device_attribut=
e
> *attr,
> +			     char *buf)
> +{
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
If you are missing to create a kobject for freq0 , then this should be
kobj->parent->parent.
> +	struct xe_gt *gt =3D tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> PCODE_MBOX_DOMAIN_HBM);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *=3D 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(min_freq);
> +
> +static struct attribute *freq_attrs[] =3D {
> +	&dev_attr_max_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs =3D {
> +	.name =3D "freq0",
> +	.attrs =3D freq_attrs,
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_tile *tile =3D arg;
> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct device *dev =3D xe->drm.dev;
>  	struct kobj_tile *kt;
> +	struct kobject *kobj;
>  	int err;
>=20
>  	kt =3D kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
> xe_tile_sysfs_init(struct xe_tile *tile)
>=20
>  	tile->sysfs =3D &kt->base;
>=20
> +	if (xe->info.platform =3D=3D XE_PVC) {
> +		kobj =3D kobject_create_and_add("memory", tile->sysfs);
How freq0 is getting added, I am unable to see the freq0 kobject as per the=
 path  "device/tile#/memory/freq0/"
> +		if (!kobj)
> +			drm_warn(&xe->drm, "failed to add memory
> directory, err: %d\n", -ENOMEM);
> +	}
> +
> +	if (kobj && xe->info.platform =3D=3D XE_PVC) {
> +		err =3D sysfs_create_group(kobj, &freq_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq
> sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
Don't we need sysfs cleanup and kobject_put in tile_sysfs_fini() ?=20
Have you made sure kmemleak won't complain here on memory leak ?

Thanks,
Anshuman Gupta.=20
> +
>  	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
> err: %d\n",
> --
> 2.25.1

