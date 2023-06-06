Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAFAC77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5737110E246;
	Tue,  6 Jun 2023 12:36:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C73910E246
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686054977; x=1717590977;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=a2TwE4fC/SX5ADFN5A2ILDwzmLYbdPIvnef91XAAU1s=;
 b=cp4phirYVnfw8p48a+pVgvCnQf4sSgnVnlHXfdvmwHm9ffm0yPkgK8R+
 7MaWOTbbqfyF60WkjK8xR/3nX8k7wcbqD+rvE1U5HIBuclcYHBIGfFtLd
 cR6pkaX3mytHmCMK2YCLwCNvXv5RU1dbTe0S30kY8NmGyWeqyF9wU76OI
 Hlx02vJLQPavHSS3ciSqjrzLmN86WggLnU5qBn/Nbj0P1HlJ8qmbX6b98
 J4ixzNPbiyqj3DdWTISZ4ys4S5sgKIf6hyilEmOa1eEUpOarMnYDQI6P6
 9PHX18JD+eWFCz+wegpfuvkG5BrA2y//rPIGRwIzetOh33F+wYkft7QZh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359112877"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359112877"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778983652"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="778983652"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2023 05:36:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:36:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:36:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU7gDiu95vpiFqpcrhs9r0jS1rbdvfb9OKNUA+2Tv0zNRtAv8OoUnLvYKrk0ADbkxlB6GQLGKZoyJQCR2BUMUVGViKfsZokUHqNRmOLGrT8/VOx5SiVfxdRnzdWIMUtEi6q6lr8NZQHnXrNwYizTjhZ6tSgb2eXlQjM4F0heRz9LDb43JXkIeaXOlHy7Mrmst6oyTkewUm9Y8so9+eEsQ816MeCQ9DtdU/Gl08t5n9ZbsIE1WXjdEmThfpNyOZa4Ynt8n1TBPV73LQ6h4zejtccccPW/B8z0Vtegop57LoaQsboqiPL3O/noEVbf0vmJNZW0K6caUVUhSTnuHvih1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0hoK28BAfYb3Ows6LPHtAh4Xtc4pjt09yrJhSKhoeg=;
 b=YOMIvwT/oC4t7mf67LHujZ3pMCVQ1FHhDxZu1ttRdjBFfDr70V9zJbBt736C3c7g1a6sgYNSDgLtGRuQP2rMtV4wk2nNOKFjvzD2dweDlWaf+nNeEyznWUP9ipb7d8+XfRr4zjJAiodFHCkUCWO2zh2gGKE7YNZZiJTOWxpnf+PXT1pblAErnL7d9mfsoWkOmbpCcPulDc9ig0YrYPVG8GzEAuCFBxILSr2GkISPvaV3iHof5iq3YqcFfx9NSXSRBErAVm1ZCYBh4hdbwsAtkvpiVSXffqxYo9ezCBonHWXjvM7WESSozpTAV3HYW9YqqMGMQ5G2x3Hr7YRqIqMsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 12:36:13 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:36:13 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcXkDYuNuVE5EG7O9XvY827Ea99pbSAgAAQO9A=
Date: Tue, 6 Jun 2023 12:36:13 +0000
Message-ID: <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH0PR11MB5281:EE_
x-ms-office365-filtering-correlation-id: ea8f29d3-5988-41e0-1dab-08db668a9d21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vFVdlnCQ7rNPuHmIWyytV87YhVmobSTf7fTT2Rb5uaPSADgyudLfyxsdB7MllfYbzSbGbAaXYy953kCjUDvxQvDfbzvzXiskCDLX+9cYfgA8yce2tDIIRQ2nb6IOqEQ+YsEhSxuz7sCOw2cWQazlRxU1R8V5+I7KGNH+cWyynmwPCK9NyX/uTbz7z53rT8fVjfEVvsDqE/Ronprhbu85p8CiPA5NUt+EhSxzt/HA8FxNrPJ2rqJXLjFuWm74yetm/Dln+RXNn4p7XmvJ+7dcugUhOeJEvNqEtJRj8LFFyncpO3lJxuseZDRlWT4Uqe9Ter2YM2AYbM9Uwhe2Yv0/Jw2xuLhg8dE4zLV9XyGleYeML7Dr+sjn0XnL23rfDu4tYgighvOa4s5df4a077iN7sWx6rQVSQX5xdB73jrzk8GkUl6u4r8LhqXyG6psXtkxIhvQIMtoJMRF4OADRbaW50CY/sjX5WwDJ/8b46vIUemOUZrxl85FwlDd9BcX1d8O/N/yZEXHkKA4z4u4+ZZO+BNc4Kr0kM6OzTI8zI1UgbBtngj1jGi/fQNJS+7jWGvEy/DnfN0MthPxseOo2i1ncFJjRfMkScBt8scOhDy0X+DSYQrXIOoeaUrKws+bWBB6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(478600001)(83380400001)(110136005)(7696005)(6506007)(9686003)(53546011)(26005)(71200400001)(186003)(2906002)(33656002)(55016003)(122000001)(52536014)(38100700002)(8676002)(82960400001)(66556008)(66446008)(66476007)(64756008)(66946007)(8936002)(76116006)(86362001)(5660300002)(316002)(41300700001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b3NF7LkE6tUKS4vAwPKrInKFDGg8cpqX1TKGbGPfFREyve6UlelAwPBV0pBL?=
 =?us-ascii?Q?RVZ/Tls0uBALLENTJIUZ/+lW3EjvaLz/LKFS7L08guzHopQTxVr0hbFCDMl2?=
 =?us-ascii?Q?m0vgNH+Ia8sMaaQEpK8QwLxcl4JjYl8g+2ejM33hJOfk/TAXmnfhcZLAqNHz?=
 =?us-ascii?Q?L02LFZVx4OXvTzM3cpm0612rQEfaNrYVZpq5iKr6F2QmoSC3cioPncokdtkK?=
 =?us-ascii?Q?Dk3eYgE0SBE5ycwQoyTmEtMnCmvPMUq3WSLCh91Gd2XZqXAC8d8VUGSWMHmE?=
 =?us-ascii?Q?pSf50hN38vbsgkmumekv2sWCS5UAZLzFMmFeAL4hoT2i9oKjIwP30408L+H7?=
 =?us-ascii?Q?11Hh2ywLj3ZKrlsyjOVwdqpCQ2Ocytp1j281p9AzLVh6dvj11JJ63s5gtl+W?=
 =?us-ascii?Q?Q4Elbeo7bVGsy+9HWg745pto8Yy+iQJEIdlWmBUTklvgjP36o9O5/TdD64PT?=
 =?us-ascii?Q?4LBuvxL2wQNe1N/bMDz4EaT2INOqiy45u5A4jAxUVrs2Kh1On0tCxuobFCFL?=
 =?us-ascii?Q?ZWwhTQmaAkUGaR4cYZM7EQ+zYzFj9Tzz3AL6SIJPctPRdCwdu6P1o4H8O/Jl?=
 =?us-ascii?Q?66hPlhI+5yqRokerIkkjJhNZ4HwCuAelOj2hZxWOW8t/4GFrMVhSQJc+G4HF?=
 =?us-ascii?Q?MpRpcYPx2+sVcRDsdBPxq5R0JGrBPH5QGG5EfCV2GlUEU5hAHvYiRqk/B3o4?=
 =?us-ascii?Q?bjycQYcdN6lPCjbiCWVCfwYJ9NQ8EN4/rQ8s3/hOnNKe3Eao7VkQ7xK/Uq2t?=
 =?us-ascii?Q?3smEU3vj5kjQxpt7Cnjq09CQBjYNdHTVzXVJi8GPAtt3UCG8MorncwmthQ1v?=
 =?us-ascii?Q?u8JfwjhR6cXPJsPzDNSYxBEyXB/Y/Nkp8PlPTW1pVLLVJ4PyoWMYSHbZKouq?=
 =?us-ascii?Q?OJAwrvWvdszYzHcWjhITZKg6B/M+0qbirCe0T3McXXsbOBFnDwKjWa/RqbaS?=
 =?us-ascii?Q?kdK0r75lnjNnVEBmblHQJPSbmYSdoKe9iM6KvmPlZUePlQGLpZmUV8/gPboc?=
 =?us-ascii?Q?88r+hWqycMEEnIE77ljANpTW4vCjU+CEYrml1rsgxrMK3LYkkxIuONHfknFX?=
 =?us-ascii?Q?Yy63tKWpXiEpmYpogEOwaPrhQGcfDLPGGpV6avtd6Sg2YoNVj4G2tVoppZfS?=
 =?us-ascii?Q?OMXRTr8pMm2OieM/I5IFksugU8T+7PdlggDlJucHKYfujXMYS+9XPClgUkOU?=
 =?us-ascii?Q?kYQnijjNakM7LclkhqMrEkCqwRiI8AWFDoxLSDp3/ExeEB2CLBydzfSFKVs0?=
 =?us-ascii?Q?FCmKG0NbaSEjIwmSP6rl4WR8erjNW/Qx+3BAH951HBHn2rhJW8fiD/nAqYpI?=
 =?us-ascii?Q?Xhf3TLBgm2xpfGAldBwI3YVCjMr5SacQt6DU60WYtd3H7E6pkFUgo04DCpxj?=
 =?us-ascii?Q?kF+q42Yr7PvPuvNomRdkP8kPUdS1ZAyvsV4BxazusDlKHl/kUnHky+4WLeZx?=
 =?us-ascii?Q?EvIdMG32husjiDPfAqFJC1MwOHgIeoeoHGVjnTxLqgxlM75XZbDAFlGPv3Va?=
 =?us-ascii?Q?KVDr0QTjAWIhRdrV1+UU46UOFsSlwknpXqotroC+1dhOuh/P2rUv3+ktSDGv?=
 =?us-ascii?Q?WOeczPDCxwwvoS+9cO6ly6AGgJhukYGULmEKbgna?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8f29d3-5988-41e0-1dab-08db668a9d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:36:13.0259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S9ZNQsvuhzthlb6ChNrhnVWCEE5gEDGoi+QcD929EmcWkrJ3krzjNjqFYBiPBw9mLY2/5rgHm0bZh+K1YVp82T9BWX4NYslCqCYXh9EO0SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Tuesday, June 6, 2023 5:07 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Tejas Upadhyay
> > Sent: 06 June 2023 16:43
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
> > tile memory size
> >
> > Add sysfs entry to read per tile physical memory including stolen memor=
y.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > ++++++++++++++++++++++++++++
> >  3 files changed, 53 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index db61da4d6212..7b5443aebd00 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -107,6 +107,11 @@ struct xe_tile {
> >
> >  	/** @mem: memory management info for tile */
> >  	struct {
> > +		/**
> > +		 * @actual_physical_mem: Track actual LMEM size
> > +		 * including stolen mem for tile
> > +		 */
> > +		resource_size_t actual_physical_mem;
> >  		/**
> >  		 * @vram: VRAM info for tile.
> >  		 *
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >  		if (err)
> >  			return err;
> >
> > +		tile->mem.actual_physical_mem =3D tile_size;
> >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> tile_offset;
> >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > index 821bd49de277..d48c599e8cc1 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type =3D =
{
> >  	.sysfs_ops =3D &kobj_sysfs_ops,
> >  };
> >
> > +typedef ssize_t (*show)(struct device *dev, struct device_attribute
> > +*attr, char *buf);
> > +
> > +struct xe_ext_attr {
> > +	struct device_attribute attr;
> > +	show xe_show;
> > +};
> > +
> > +	static ssize_t
> > +xe_sysfs_show(struct device *dev, struct device_attribute *attr, char
> > +*buf) {
> > +	ssize_t value;
> > +	struct xe_ext_attr *ea =3D container_of(attr, struct xe_ext_attr,
> > +attr);
> > +
> > +	value =3D ea->xe_show(dev, attr, buf);
> > +
> > +	return value;
> > +}
> > +
> > +	static ssize_t
> > +addr_range_show(struct device *kdev, struct device_attribute *attr,
> > +char *buf) {
> > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > +
> > +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> > }
> > +
> > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name, 0444,
> > +xe_sysfs_show, NULL), _show}
> > +
> > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > +
> > +static const struct attribute *addr_range_attrs[] =3D {
> > +	&dev_attr_addr_range.attr.attr,
> > +	NULL
> > +};
> > +
> >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> >  	struct xe_tile *tile =3D arg;
> > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> >
> >  	tile->sysfs =3D &kg->base;
> >
> > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > +		drm_err(&tile_to_xe(tile)->drm,
> > +			"Setting up sysfs to read total physical memory per
> > tile failed\n");
> > +		goto err_object;
> Will do kobject_put and return 0. Which is wrong.
> Better to do kobject_put and return err here.

I don't think I have any action to do based on error, clean up was already =
done. Am I missing something here?

Thanks,
Tejas
> > +	}
> > +
> >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > tile_sysfs_fini, tile);
> >  	if (err)
> >  		return err;
> >
> > +	if (0) {
> > +err_object:
> > +		kobject_put(&kg->base);
> > +	}
> >  	return 0;
> >  }
> > --
> > 2.25.1

