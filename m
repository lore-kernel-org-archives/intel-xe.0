Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F2F531DE
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 00:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32F510E03A;
	Tue, 14 Apr 2026 00:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCPqVNCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573B10E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 00:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776126605; x=1807662605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=01P6Ofmb3J2P6C8YHJ3Rg+jrxpgIbTEVOLkA0x6911A=;
 b=aCPqVNCr/fztqJXHkLjtNyUSBBg0tS5synWmjo4KE5RF/smvFeXq+SUM
 xiFrXw/Mftkrv4ZmgI+zlCk4ZwYNhCAJ5rDsxHnznvAeKS//HZtpaRT0c
 1qqpjBAQha/J8SndJ44b5L7nxeSJ8jur/vmwCHz8nHurqmQ6e6zpfnIbV
 4OKaSV0nJqtgDIH/6pJRFrs8s/M6IE5sUxeI5/tcMu90sjZGwT+s17J4t
 +QMmMJui4yaaYnpZT3vRTWwRW6lVs/m91FLy2oskJEJpPDP5dh3HgpuXL
 2qFin2TMjVIbK4869Sb8MLfsXj0BRUsB5i3QoQTXcsxWUenXzIokYEP/d g==;
X-CSE-ConnectionGUID: nr/xe3qkSZ61kdit5P61MQ==
X-CSE-MsgGUID: TjwoHGojTnS7rO+EJPNSpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87697045"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="87697045"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 17:30:05 -0700
X-CSE-ConnectionGUID: dIX0HIoyRI6UL72YYgAHwA==
X-CSE-MsgGUID: JEVq1PDJTzedt6+yBZiWYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="229810074"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 17:30:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 17:30:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 17:30:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 17:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHGl71e/BBJBceRez8K5YlAbGgHoIdQNrK7i0BGw3RcJhoHqRYwihbIVI8kvgl2MNYg3GfVimpxxxo7AdHQUP/IXWCy2kDZRgigmKlTpjupEGsLlRYyxgXXOGrjN0su3VhOOt7rQbEJzKKdhaNL9BBikSkqnTHc6app9EXN5omzN0cCpZ3BUki1WeTQTTutRVd3GBNpX8/2D+8lWVpWMPRivLEWNM6fhfqkb+gWS/IOjNHWVKBJ//mRDKcfXeteMHOTFcyKNQwDEJCKgYiBiZH9THEDUJYsXDJqYdop2Qby5T8muzGwy9RmP4gVum1yd70p6SdAAms4OQtWEX0a7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrxY0dC1TG7Uxb5dhdrliVwNHB8BLJomGylIbORJ2+0=;
 b=KPicTc44LD7KL4IRhcyYynx/7MhhPgi89ua5M3O1v2NGz7dDdyu6YKKc+OmuqoA2PgGx6RdHHgNSP8/pLVv94591FOp8dVphGnbJX1vz/w3AfK7QPSwepl2HpwQFYcer1/pd5eB8OhCvK3++8AJiZS6h5aL/PjEY6cuzo8Wd0Nlh88OShNpzmQuLdPKR3iOtTXzukV8PHbHnqtulyqMMGBDHWipKHeCiG7Fe2fNhY1jiCY3oF1ETG/WhEynE8SXLZ0ycjJ2NNPInSehut/dYBFB72aXQ1oRFuORIsQatItcE419f0fxuVZKxhPu0ycNG0jsJ0SCN6SVSYDzFTlPVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 00:30:01 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 00:30:01 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Thread-Topic: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Thread-Index: AQHcxuK6I9NZAAefIkur0xx85qhxorXZg5KAgAQ5p7A=
Date: Tue, 14 Apr 2026 00:30:01 +0000
Message-ID: <DM4PR11MB5456648D71E87DC8D522DFE4EA252@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
 <adn-n0TPOeXAG8IU@black.igk.intel.com>
In-Reply-To: <adn-n0TPOeXAG8IU@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW6PR11MB8338:EE_
x-ms-office365-filtering-correlation-id: 479509de-2bd8-42d2-b558-08de99bcf71b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: MOMLNDnx+G95RVMQ55wwKh325BgtIDeqhm75YE8Ze44Qh+RezjX4QmJNWiKQoaf2JMCmLbp81SDAi9vB0ZqmGmBBxL9/RPS1b7yYSW9jsY9JSCtSLoNrGrTwFTIA2sFYVnuzQ23lrmVN0v9l6rxkZtijhxGLIQWoKMowqhzUWPtljm3kgXkWuJhKdZufzwTRv/WLlirtUNQBsWsnXYs1n/jZ57LuJKhMFqQClz/zgfIXMGSJwFQo+dORIVcUQgFQQwytJZrYu564vcIdZw6+LNF+/0I1DXYJJ8p3/Nwq22thTWdq/BoRglqatAFwtd/MRSNNBz9zKelwTOo/BLx4u0mituFYWNdxkKfAz3i9Ej719Ru2Bwdz70udyfKMKNIDpCBatwEGFU1AKDaFWQvqYgBYZoZRe40saJhT7xnEkROmgBIaeoQ2a4+Whj1RLGoCyRJvxzgANlt5yxzCUB85dnZazjZ1bV+LR2tk1bzmOrC0zktDcn3tf/8uEXikbp2NlrqJbdAZ8jU8gFMj9upN/vKPMR10Lq2rPyFpOOpwAoVDdOMxkN3/VNpj2SNqyEPRWDDlwJZwBiHG65V9KEi/JRpqad3sTB6P0wct+2WjwaZp9mGLLOlvTwjLmxC/+QQLz5n0t82fKtSZYNb6S6MGUoBmyLkjMvcEHZj8Dpag2NeqzHtvlc05Sd/NrTbnUs2dPeoAjoMoHZ2ym6KkWh54XrM1psBi8fW53ZPLmLiOXJZRz/pZu+C43zQSpaZi9WAw3NN+D3MoDBPHXVrcToxVRCZRJ72/7REDCeExlRaQks0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9r74VcALkorhaxWAqqnkSyV6Tmz/Ydxwj0vgzuHXXWImGXHb5UPRC6raHOOe?=
 =?us-ascii?Q?IZN2VwaH5ma8Pr+pbj9BrrZkneNEvVM7XuM/qbzKEG1NuGV0Q1MvX86q5MGu?=
 =?us-ascii?Q?5Enr5chwZHiRE1eB0bj6Wzs4bRtqmHQKXMkh7UENRMPHFQQQpIpK59FYGa3l?=
 =?us-ascii?Q?U/WHW7WZ0QuKhzJ2Moq7qyuR5F8KXWI2TH/eU4gMEI/sJncKkq8yCfog699c?=
 =?us-ascii?Q?mZ9m+8PZlG+NN0LvRUOyukbPuv1ZVae5nQcPwCS8Mb0UE/MnN7tetLdHQQyP?=
 =?us-ascii?Q?cxvDTFww/u9eXWhLpyn19xvkoabGf3w+bsXWiD8T2fJ7MiHgygu9g5FYNZdU?=
 =?us-ascii?Q?TwIWkfkcCIX2vTpZvx6UNyvPvRHqA94q3j31O60sNYi7eZ8iiGcbeE1+Go4Q?=
 =?us-ascii?Q?rcIOa8NKh5SyRPojI+I3If7tHRocIq+jcBZ2RQ2MPe5mGgiU5a77mBm9DZbb?=
 =?us-ascii?Q?vj3L+ONZAag+lyYPk7eh29meurptwT2zX1w8ERZL7TPHqKzkAEOWSQya/1JW?=
 =?us-ascii?Q?vu/vgAcNRVPOuktDldJ1buviRE1v9r9aR4DSSYjfN6l4fx5cs+2RxRqCCZVM?=
 =?us-ascii?Q?1/ve248xb3t8A/YM5VhZO6GYjh3S4aDWeEzdsLYTvdMDhA1V8AaMUDJ2+Pqk?=
 =?us-ascii?Q?6OJYUrUMPkRtRb2ZtUeQc+LtWxWi6zrZW1l52lcz8odX+mf/Mx+ZNcKquf7P?=
 =?us-ascii?Q?7ySssPMAqhmuEXOh+xUhjK9V+RwwKvxfu0dwNo8qTLw4XlDSeGeVD2DptZRI?=
 =?us-ascii?Q?CtLnvYXyALso5xSxuh/w/pk48/WYM2emM6SJ/AwuStDIYQVNBls4MIOuZs66?=
 =?us-ascii?Q?x7nJlnbo49iwgs7zwVsjcCsWIrEck6CG7yclOYFmzlyq0ZeVNP2heQbu5hUs?=
 =?us-ascii?Q?cnO9QE4Bh3n2W0vWEYIcRuDSDmoObo3+Z7uFVKOActtoktCf3uGWlXNbNexJ?=
 =?us-ascii?Q?V24a7D4fOZ+ChrITjZQgjbCkWVcX9q4xSicDkJik72eqJW/pJ7o0ptCBj8hM?=
 =?us-ascii?Q?S12/JuLpGJLm7AdLOWCzo6A+u5FcpJsXjOTthfrSs+/rd09TXXzlZjISA/uO?=
 =?us-ascii?Q?drPRAr0ZOxTkgvVqZKNX2ppa2CmJtuhAI3Toeg7IE6Ctg1xUPkL3Uwxo6ZFu?=
 =?us-ascii?Q?0sUh7GLukdSosgYgqp3H2httK+XACh7XzEZBCn9tgJE+hhWQSsWcZbY4bd21?=
 =?us-ascii?Q?9FG1GzWP3fTTL1il/0SVd00qGYSxaKap/ESXyoW/xkUZanrXVu8THuzM57LY?=
 =?us-ascii?Q?xKo+TxpPMg+L/ukMhwK2aMcNpE2RzDW0coWLqB52XFgRjKGzIHMi3qJFqnM1?=
 =?us-ascii?Q?k2Y8aok7xzgpWhRjCRjeU3Dc7uhl6GTiayuOkHfIfeSj3c74p8lX8nd4zjsc?=
 =?us-ascii?Q?JXtKLv4cyGoy0BiF6M2V4mNjCLTSM9NYkLDTzs4UE9eMS32I2l+zn9mHSv3/?=
 =?us-ascii?Q?22gbeXJB9FeSpXRTF1XwWwyC2eWpCFIjs2JHKWWzHdnZ3u2V4KZjYSg8tu3H?=
 =?us-ascii?Q?hyrU/ilgDAezd+YJJFkmAHjjpt4IqoH1hC6Yt0y7yCZSOVYxhtEW5XOlqRa9?=
 =?us-ascii?Q?mTu8ZnsXg/HUqn+DTZezUu3AEp8XfHhDlZeWJCO9lfIWbAvzvO3MGybWpA+l?=
 =?us-ascii?Q?b8HW5yF2Zg7LL1qd0lyiprS9iFjCMSCVIz8eHi39bpmYX6R4VqOOYlPW0x71?=
 =?us-ascii?Q?cwoHqvGk/TtHhgSKVZk7T1ptpbavmk9IfwmbM7+jlPwY4xqiS47PKlImjzf6?=
 =?us-ascii?Q?jsoxaoJvLg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cOWtnfAyGr7eKercQrH49YPODxToiLTynxodyGlPiQF+V0TY94MUq3DGqBy0jBhF2Q49jZbbEKlot9DbLr3eKs0N9xWx1K37+GK0kRGRr6bOnNMHn3xFo1bhCBtQisrMqVAOqrzOgMIkXJZinjMRURUR6Ft16drz6isgUjqXmE4rEro2W8eBR+6akAdgNxIOw98u7Sfs1oK/Ubuw/DRsDdBRSJYfOXmd5TNaPlB1dWJ+9/ezXuA8upJWw8Heq43nOd/nxvYtGAA9Z4rfDD3aFk0z9hOy0e/KoeSG/46DBuLV/UwpJS3nPGeWnt41zecP4ABEkM3OsFmcb/bxGyEsBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479509de-2bd8-42d2-b558-08de99bcf71b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 00:30:01.1285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKLrqo5Zx7mvy5cEo0qmKxpmHRH+0uwF0GLg3hiaU2Lp/a5RQGjDiccBn2RIFT+WXOv5Ndgbo00OHOgHJzgS4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 11, 2026 12:56 AM Raag Jadav wrote:
> On Tue, Apr 07, 2026 at 10:59:12PM +0000, Shuicheng Lin wrote:
> > Fix two issues in register_nodes():
> >
> > 1. When the loop fails mid-way, previously registered nodes are not
> >    cleaned up. Add goto-based error unwinding that walks backwards
> >    through completed iterations.
>=20
> Did you check with the author if this is expected behaviour?

Author is in the Cc list.

>=20
> > 2. When allocate_and_copy_counters() fails, assign_node_params()
> >    leaves ras->info[severity] as an ERR_PTR and returns. The caller
> >    then passes that ERR_PTR to kfree() via cleanup_node_param(),
> >    causing an invalid free. Fix by making assign_node_params()
> >    self-contained on error: NULL out the stale ERR_PTR and free
> >    device_name before returning.
>=20
> Can this be rather fixed using a local pointer?

Yes, a local pointer could make the code simpler.
As author will have new series, I would leave author to refine it.
Thanks.

Shuicheng

>=20
> Raag
>=20
> > Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Assisted-by: Claude:claude-opus-4.6
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_drm_ras.c | 31 ++++++++++++++++++++++--------
> -
> >  1 file changed, 22 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
> > b/drivers/gpu/drm/xe/xe_drm_ras.c index e07dc23a155e..802e4bcb731c
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> > @@ -73,6 +73,7 @@ static int assign_node_params(struct xe_device *xe,
> struct drm_ras_node *node,
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> >  	struct xe_drm_ras *ras =3D &xe->ras;
> >  	const char *device_name;
> > +	int ret;
> >
> >  	device_name =3D kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> >  				pci_domain_nr(pdev->bus), pdev->bus-
> >number, @@ -89,8 +90,11 @@
> > static int assign_node_params(struct xe_device *xe, struct drm_ras_node
> *node,
> >  	node->priv =3D xe;
> >
> >  	ras->info[severity] =3D allocate_and_copy_counters(xe);
> > -	if (IS_ERR(ras->info[severity]))
> > -		return PTR_ERR(ras->info[severity]);
> > +	if (IS_ERR(ras->info[severity])) {
> > +		ret =3D PTR_ERR(ras->info[severity]);
> > +		ras->info[severity] =3D NULL;
> > +		goto err_free_name;
> > +	}
> >
> >  	if (severity =3D=3D DRM_XE_RAS_ERR_SEV_CORRECTABLE)
> >  		node->query_error_counter =3D
> query_correctable_error_counter; @@
> > -98,6 +102,11 @@ static int assign_node_params(struct xe_device *xe,
> struct drm_ras_node *node,
> >  		node->query_error_counter =3D
> query_uncorrectable_error_counter;
> >
> >  	return 0;
> > +
> > +err_free_name:
> > +	kfree(device_name);
> > +	node->device_name =3D NULL;
> > +	return ret;
> >  }
> >
> >  static void cleanup_node_param(struct xe_drm_ras *ras, const enum
> > drm_xe_ras_error_severity severity) @@ -114,26 +123,30 @@ static void
> > cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_err
> > static int register_nodes(struct xe_device *xe)  {
> >  	struct xe_drm_ras *ras =3D &xe->ras;
> > -	int i;
> > +	int i, ret;
> >
> >  	for_each_error_severity(i) {
> >  		struct drm_ras_node *node =3D &ras->node[i];
> > -		int ret;
> >
> >  		ret =3D assign_node_params(xe, node, i);
> > -		if (ret) {
> > -			cleanup_node_param(ras, i);
> > -			return ret;
> > -		}
> > +		if (ret)
> > +			goto err_unwind;
> >
> >  		ret =3D drm_ras_node_register(node);
> >  		if (ret) {
> >  			cleanup_node_param(ras, i);
> > -			return ret;
> > +			goto err_unwind;
> >  		}
> >  	}
> >
> >  	return 0;
> > +
> > +err_unwind:
> > +	while (i--) {
> > +		drm_ras_node_unregister(&ras->node[i]);
> > +		cleanup_node_param(ras, i);
> > +	}
> > +	return ret;
> >  }
> >
> >  static void xe_drm_ras_unregister_nodes(struct drm_device *device,
> > void *arg)
> > --
> > 2.43.0
> >
