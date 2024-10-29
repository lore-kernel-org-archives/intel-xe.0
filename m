Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD6DD74943
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 22:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856D10E3B5;
	Tue, 29 Oct 2024 22:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xjg2NNpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAA410E3B5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730239525; x=1761775525;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uy2zFqFR5LXpCgnPTcIpXpjG2WyAeJkkVsxHIIt9+gk=;
 b=Xjg2NNpxXVmXvo/iRJn6svBNPyngxW6u8gJBL+W40VSCpMrNRNh9TogG
 /tyx4WZrLhs4rkX2XXBrJM4E9cFRAj+GN5t2C8myolz9c5n7jbU3zJW+N
 xQBcWhUYXwcIqWj+5c4JsZGdyRRfFrQjIFpZtM7nP+cvA1n1JcNHAg9yO
 /NXdfulLR9Lu03sMsbIVyXAD/QI22lr2Co/wfc2H8auz3Tpb5F5Nt7VaF
 sjZrfUQ1/QD58hjzzJxdEFYAkqERQ/npND7XkzG27ec0R8H/qebMvoPOn
 LaXZpijgOGGFZ5As+ZHUMpl7lBViYBvgnkwFppU10cO94WN9cSpTGntsB A==;
X-CSE-ConnectionGUID: Uo4ssIB8QJuzYR5+V+kluw==
X-CSE-MsgGUID: wxdO1ig3Qy2vjRuW45qdhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30059758"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30059758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 15:05:25 -0700
X-CSE-ConnectionGUID: NFSIN0l3QTSAxJy33lUoxg==
X-CSE-MsgGUID: db4HtJUvSuqFuJsw99Outg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="86714661"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 15:05:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 15:05:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 15:05:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 15:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnYfCgb/RcUnfrnzqaz3RufqZ+W7RW8XnCDInJszHb75trZsQj6qe/Zb0KZO5lk6gPScw4/lnE/2IKs4zM4DLe+UTkVyuaBlQ3y3yLfb+kpxM6B5USlIzQ4RmzpN29smb2PletZ/3405X3sWV4DeWtrnpLztF9syZ07S1L46hqO2PMGTkwceaJEVkfAZlWfkWeQRabBK9rrrA6rIXGXSxUJ+0S78ZiTUFLg3LBrgjAD8ndWdTfqunYtLwsiNiEnpzegWg+iweU4bw/REfpR4xun8C5AYOv7owX5ax3kmOpiEFx/xnER8pxDYGoQbisShLoGChiR0ZrpLrmfEl8dR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVPycQZqsJWDN7hKDjUage68Cz/qJXAIics9tLrbMwY=;
 b=xQ+xesRT7bXPHlAwAlGJek11SXARVNikD20i7XnrXfTxcA0yz+jEFWncRVvkizLRCy1odyGUDw28J7kZltePhhnLEmtyW/VRK47EJSsMTivBLxJpvnNDct0uIKprxdNZ764HruDOB5DgZ5EHNjAPcrk48nua6YAY6SPBFoQu3GeBIoRftc7IjMUSj/FMQtMfExt7XwYamF0cQQi2sgmtoQJKGPa9UxCEmKkdzK0sUREAu/AOag028g7h8oL/deXRpISXF/mey6HkSK1Xn+GZcIireIQXLLzAYCaPbd36GfIQ+T4IKA/AlX9aRStMqSr6htWVVo5zbvPrBcIPDKHCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 22:05:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 22:05:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
Thread-Topic: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
Thread-Index: AQHbKku7XhkHoXOFYEiitIAKVd0kALKeRTIQ
Date: Tue, 29 Oct 2024 22:05:18 +0000
Message-ID: <CH0PR11MB5444E2830B55D38B1E1C07E4E54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-5-lucas.demarchi@intel.com>
In-Reply-To: <20241029214351.776293-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7356:EE_
x-ms-office365-filtering-correlation-id: fd96aa88-63b2-4809-e0f0-08dcf865c69f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Wo72xUA6I/JFsfxfowmwyiPSh/H6YTbjHROs7DGcVPJJ1DubfuDZbxazvTsg?=
 =?us-ascii?Q?h4ocsgG/tHgqSHmucv0PrjiG+bBEGAyXoMZV6i3NkUd/24shmqJz0CPaaw/i?=
 =?us-ascii?Q?XJUBrDKy+APQF8EgZFLBrlosfrYpIBbuuzlbiXa2iSf3uKb4ZR1boTighTNP?=
 =?us-ascii?Q?8tm86K8BfZbxzoZNr1oay6CRL82ACWaxrw+f0OgN88GpQD0uATfY676iYa3T?=
 =?us-ascii?Q?WV8RXFLk2aKr5scCEgrfIU83AFSF97/jM5RyarUCAdxOc9DJUIPldwk44Xfd?=
 =?us-ascii?Q?acv36+lxhavBAEdtOx/hSqb/9I5EBuvEOC/6z2bzGB9bRkWt5EAPUn8LkCVi?=
 =?us-ascii?Q?PgtBEluLRbY4yOnf0I4ClbMCiq3b4Lax2mznUzhrHGR4JSRk8laTbM1Ka96/?=
 =?us-ascii?Q?e7RGzmUZkIkM60Nyw+Ki49qHToDLm6EHZXFIMLR2O9F4HDRnKYRC2qS1jIqB?=
 =?us-ascii?Q?AFLKXoNpAmcfgICexVeAHfHUfnI/dZWuFFg3iWS9aHr21TkssqiYZriJkFqu?=
 =?us-ascii?Q?ubH5yEg70wmVf8LySdAqY5dYs5zDIBexUbhW1Octl9T3Hr0swTLuSRG7p+vZ?=
 =?us-ascii?Q?1MSC1mTbS0HA1iM5pZemiTD0NErZsRMzCC/vmE2Da4MPBeUKPuxttZjN7+1o?=
 =?us-ascii?Q?DIy46XMYyhpS08NkEQqwFCWIf/vMA5T9aXhD5OX/NhplSax+6CFCeMEZhn7H?=
 =?us-ascii?Q?Y0ueClBYAYgKVGy+2LJK//NprnDZx55FxalUie1FxU1dAvzYBV7gtgVxEtw5?=
 =?us-ascii?Q?AJlgmnVpCdfmDt17yLl6G6Jz2AcX4YESozmNT28xoueooSGSGkv/0Qse43uU?=
 =?us-ascii?Q?H+Uwzl099JjPb0EEm613gYKQ1bG53y2yMMKZzDEnZ5EEwVsnrwB63eDGK2Lh?=
 =?us-ascii?Q?WNpTgU0zgEBtn4ga8SvqaJw5F3YGdNQwJTV00tf1sEodl2fQ3rF+2JuixkkQ?=
 =?us-ascii?Q?z5ZsZMT/FMQG6gQKaNmHMAEwP25dn73OMRDOQeWuiz1PvvoYFfWLtq/bewEs?=
 =?us-ascii?Q?URsQtoPZlBOV6MyPAwD9pBMcK5Y9SjpH3qgJZeCU8tGLxJ6nNkTKObsNjGOa?=
 =?us-ascii?Q?08lJbxPM798j/Q0So/Q+hagKjbyeSJN1+72cJHJN4EQIkqvDbksNV6ByN4za?=
 =?us-ascii?Q?21oGN7I6ka3/Kv0vFbiZ73ke605Dst7X5+MNNLClSysl1cLe73dfP49/aEbe?=
 =?us-ascii?Q?rJj34jDco4yoRwOsK9CpuOczMI/YkjlFvo7Y9CN7dqeuYSiW75BhrTPUQfyC?=
 =?us-ascii?Q?a7oiowBuzKimaVoBt0IcPUm3+eORQ6YTKHcEpVC3ssnJjEhEwdRhK4JCCiJ6?=
 =?us-ascii?Q?sCGuBX5Pab4JCAh4EPAsy9BJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/L4uGM8wTWdGyGOvJ6lz+hZPtOXeVnKSs/TxQXpLaumo2w+c1uM+WsVMCBil?=
 =?us-ascii?Q?3HQ5CbTu+n5MGWEPHI6YR6/5AVSEMSNt1+f0Qm4hRrY9DfdlbH3EDU+6x459?=
 =?us-ascii?Q?8KLPKWgIdPTx9sGhsAx+rhAP2l/ti1FCkfsLhyPRrE8hW6dIkzyP3YHmhFgF?=
 =?us-ascii?Q?O8MgrtwIVFB2rZ9FutEKcYWMknvEtBcWvJYCNNNqFrk4JBgoKE82BCxqgja9?=
 =?us-ascii?Q?Jzr6VH5Zg3d3QcvpUsAvKaUAYV7HVHUgK8EBzAFg9IZZaNQisNyx5Lcr0Yc5?=
 =?us-ascii?Q?rGcf3tkOBRPbLHtL/nMFYQq0/P0NiJB0OU0W/QPPm3j+pNFGnRopB47Onj8r?=
 =?us-ascii?Q?RlL8h4RuBh3HDRV4atpbR41SKtQWfvLULbaZmcWSwY1W63SimKg0/D13B9nO?=
 =?us-ascii?Q?N7suntpnOdgCM1dykPjGXFmCHQfVNhog0SBaZwAQJ56l97oRPdZGfWaJpc1o?=
 =?us-ascii?Q?ePIKhTpFB3xtSBJwda2PvOdeKQ2Owu67/9h5aOYtZv2n51Bx1SDFAnj8mAgF?=
 =?us-ascii?Q?qp1yeCGfCNZ3O2wdd3bt3/iYRVzxM0OiA4BS4X9Krxs8KGkl3YzmhMloT0nw?=
 =?us-ascii?Q?jpqQtJ07SnqM3+/DLoAWuDpm8A4MrktxFxRgJ4ECkqbp1cc/Odqd5Iu8jrzQ?=
 =?us-ascii?Q?ZXZ5MM/sWw80GDpU4LNQs3BVdVMymUaEzijhDseLOz/eDDgv52G99qTmBMBj?=
 =?us-ascii?Q?SEeD+2NNtRd41qtunc3bMQj3CP4+yG4QcWsFf5CAIYmuK6JlCzDysZZLAf6i?=
 =?us-ascii?Q?AmNDP3ZZtnyCuQiAxXoadxhGfl7Yzn5q7WtG3awdTr4jiG62Zk4swIpXQSWk?=
 =?us-ascii?Q?phFWKZ8ABOVuQ376gB2wp3a7rWBvOB7WaSZMo4Rltoe/31kA+yMs/5ppSTIu?=
 =?us-ascii?Q?ReaCcmXvx+RC1rmOVWbwpRLTr9X7K3zxFIM8qzSKZAO/yXbQkCLup/cvRNBl?=
 =?us-ascii?Q?qr/hOiFeqpQUpEfTsepx++nqav1lL/5I6aRwXXo4Xq54vU8oCHaamba9U/Bh?=
 =?us-ascii?Q?wffXGytKRhO0J4NGC06Z5eXUQoGsaXKphYkiDdXQ0Fcy+NXOyXyLuEIP3xYl?=
 =?us-ascii?Q?nRsm1cqxq8+lEGiYkSuZPU3a5aRVJWZpZc29wluttosYrQUT5WWQ7KpVTD5h?=
 =?us-ascii?Q?2HYmoqdWOMMpeCsO+PJulTqviTLDbigKeEoMHZRQ/cRP/83Ze1GXdktCcrQl?=
 =?us-ascii?Q?F+bJByWahOxwFdNhSRFU9WLc6l3qbTcMzdnJn+Fheujmxy14MZ2HjkgV5xkf?=
 =?us-ascii?Q?Yw1FsI7W9+ngTzSCdzTdFqOavdJ11Zzjd817fzK1GbHsKtf8tOGxLiIT3ufo?=
 =?us-ascii?Q?kdwpRR9hZmbPqymM94iHSbIZDV+jhGfMRGl6Dn+GmrGoMFL6b5brwsgU9m0b?=
 =?us-ascii?Q?rVJtoMxN5bx/clu6AN7b3g3Rz8MVbuvdSehci7DutVUwNa3hieppa4U7n4cL?=
 =?us-ascii?Q?MzdKH2gpjsHd+RP64qbCJmEoctFZinMhpQxKXe7YPbHzO9mw74XMKvJ1pJjb?=
 =?us-ascii?Q?lL4dCP8qzIh4EuwsNxSQ6l+JOGYP990LX2aZF6Tmt/0TuGvHEQW/9P6Dzdb9?=
 =?us-ascii?Q?6TGjPPrEY4CQjbNtANKogQaSQhlkcF/DWJLFOAQV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd96aa88-63b2-4809-e0f0-08dcf865c69f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 22:05:18.7415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IeJkK4xmQirRPp76S3/FKEJVj+EN3BPoNNO+EhRr7zGgXdXB0tGVnq3frMcNHllYqIijxvri5J+OaeGii76NzvwEOk/ElJ7TzewBGkxeS0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Tuesday, October 29, 2024 2:44 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
>=20
> When an exec queue is killed it triggers an async process of asking the
> GuC to schedule the context out. The timestamp in the context image is
> only updated when this process completes. In case a userspace process
> kills an exec and tries to read the timestamp, it may not get an updated
> runtime.
>=20
> Add synchronization between the process reading the fdinfo and the exec
> queue being killed. After reading all the timestamps, wait on exec
> queues in the process of being killed. When that wait is over,
> xe_exec_queue_fini() was already called and updated the timestamps.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Non-blocking asides below.  Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 4 ++++
>  3 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index ef7412d653d2e..b949376ca388a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -614,6 +614,11 @@ struct xe_file {
>  		 * which does things while being held.
>  		 */
>  		struct mutex lock;
> +		/**
> +		 * @exec_queue.pending_removal: items pending to be removed to
> +		 * synchronize GPU state update with ongoing query.
> +		 */
> +		atomic_t pending_removal;
>  	} exec_queue;
> =20
>  	/** @run_ticks: hw engine class run time in ticks for this drm client *=
/
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_d=
rm_client.c
> index 22f0f1a6dfd55..24a0a7377abf2 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -317,6 +317,13 @@ static void show_run_ticks(struct drm_printer *p, st=
ruct drm_file *file)
>  		break;
>  	}
> =20
> +	/*
> +	 * Wait for any exec queue going away: their cycles will get updated on
> +	 * context switch out, so wait for that to happen
> +	 */
> +	wait_var_event(&xef->exec_queue.pending_removal,
> +		       !atomic_read(&xef->exec_queue.pending_removal));

There's probably an argument to be made that this should be done before
getting the total GPU cycles (as that's when we update the run_ticks value
of the xef exec queues), but I'm not going to block on that.

> +
>  	xe_pm_runtime_put(xe);
> =20
>  	if (unlikely(!hwe))
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index fd0f3b3c9101d..58dd35beb15ad 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> =20
>  	/*
>  	 * Before releasing our ref to lrc and xef, accumulate our run ticks
> +	 * and wakeup any waiters.
>  	 */
>  	xe_exec_queue_update_run_ticks(q);
> +	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))

I was going to say that we should probably perform a wake_up_var irrespecti=
ve
of the dec_and_test result, but then I realized that there isn't much reaso=
n to
wake up the waiter if the pending_removal value isn't zero, so I suppose th=
at's
a moot point.

-Jonathan Cavitt

> +		wake_up_var(&q->xef->exec_queue.pending_removal);
> =20
>  	for (i =3D 0; i < q->width; ++i)
>  		xe_lrc_put(q->lrc[i]);
> @@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *de=
v, void *data,
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
> =20
> +	atomic_inc(&xef->exec_queue.pending_removal);
>  	mutex_lock(&xef->exec_queue.lock);
>  	q =3D xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
>  	mutex_unlock(&xef->exec_queue.lock);
> --=20
> 2.47.0
>=20
>=20
