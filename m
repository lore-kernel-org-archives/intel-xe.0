Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F65D17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 22:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE5E10E5BF;
	Mon, 21 Oct 2024 22:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghjdRsry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53E110E5C5
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 22:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729549714; x=1761085714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fyUjPm9wQFy7dJqoyFaUaPPAvLczEp4DdSmRsql3kNs=;
 b=ghjdRsrys0SqB6bGwTgWbXZyvLaa7AqhP67eajA+2HAFg9evFF7VqXoo
 xtqFPWNeouTnrdvSSM9v80aFG4fFVSzJLPhUEKngzqyBv5HF/nHcdzFU3
 COh87k5+sc07oN5Bwj4/Hrq4I4XoeeOZJ0lg66ZImGWFv5uu+FmC1ah3X
 KblmSmo2Fku4fhGbRKtT7TwGetE6MWU0fxuTuYVFMvpY792Et/kpwlKze
 vU2uhev321uT71xD470DkkP3K0a8rRTVnMw2fabrftReFCyFI8Ew01O2W
 UEOjQd5GPjNtctU/TOYUCWXGWU/azZCHN7DwTfJrW4sLoC9We+zYbWDPn A==;
X-CSE-ConnectionGUID: Q8PxxuZYRd6p7jL0PcWYoA==
X-CSE-MsgGUID: 9wxWv921QlaATt/LgqH+Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32738250"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32738250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 15:28:34 -0700
X-CSE-ConnectionGUID: GYwXP3sURGutfuwqBg75rA==
X-CSE-MsgGUID: 1SVljwb6TVyOnlLAY2Q6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79661804"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 15:28:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 15:28:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 15:28:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 15:28:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 15:28:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6wRKUbx2kfrNOaWgIbytMlVDcZmO50D4XBlaRly7Ro/FxBhS2qUUNTJQ4VaxhwfdwfkCKO9/R68HodiKmL2P9IKeJ4i83r26gbXhwLYSPzFZ9rXVRxk735gWquO0WekegjY3jDsMyVf4nXyOnqZMb28Jtwb+aVlw9w3iqP8GbzYIPF0UVlWCNRUI440yy6hfWVhN6wwGvWqYw+HrI+SwlTo583yW2IgwQP3kKXVcugbZyhxJ3AJCuwKQ5maU8cdcI9YC0ucDqdLjYExPuFGSY0dLsuoi2tKNWDpsiItzohMTn7z9DNDJ+DPv5tFmtoRhHAT3A19A/uQgsVirWlyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymjNWbPjZlN+MgGnx2vjGijq5LRGuwHV/qdzmKKbiD0=;
 b=ZoW177XqSzQi71/fXUNbqL1I2qyyqaHvP2k25/MNtQqShHEoqoiijG5xNUOJEPTvN5OcngL1tnZ20SHvdluobPSq76zdK7cycOJPw6/Ijcuj1SD3iCycJ6YwqkopXk1F92ohn4OT9mVvyLZoiKS9pTSYOU9eIxB05VAxtmfMCiCGNLj8K7NRhwlG3S3w2NpS9gpSd6+w+ADnw7FyDW2uzErakdIIpLRur1IuGtgcyhVNgHT/gM3//lZf8QL7khMGwHF5lBJFmcjabbdj4M69XVYDYgw8mmNEbaC9H3DHo3ubU3iLbd+JTfuwdQoTJfNdfJ+EwrelbNyY312pG1LbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 22:28:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 22:28:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Don't restart parallel queues multiple times on
 GT reset
Thread-Topic: [PATCH] drm/xe: Don't restart parallel queues multiple times on
 GT reset
Thread-Index: AQHbJAPAyeP+83XW8UekUZaOGNmRRLKRx/wg
Date: Mon, 21 Oct 2024 22:28:26 +0000
Message-ID: <CH0PR11MB5444BB63F191EACB8572EBDBE5432@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241021211146.3842483-1-nirmoy.das@intel.com>
In-Reply-To: <20241021211146.3842483-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6497:EE_
x-ms-office365-filtering-correlation-id: 306db0f2-0cd3-4787-f479-08dcf21faea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?p0ipsptf2Bjx3Yy+UobTz/Z88ZT+gNydffZe6GngDWwtzNCkeXNRpGaKRty9?=
 =?us-ascii?Q?7b+nbdo9Xs9ZxbbMxHvYnhX81i0BBfBgQ7cAhK+2pxjvafBVZczpz4r0Dm+L?=
 =?us-ascii?Q?V5U7pDOs7WDv3pgflTCqwUUZUrvKAS2P0uTWfDgRPRAKkF9uXC0RL9vsQRyx?=
 =?us-ascii?Q?6ZP+2CObmRjwnKBMmcmLiFa+En9l015Ch0zwV7A/0QZOmPu+6I/SkU2Pdk5q?=
 =?us-ascii?Q?QG4HCQOZ8N05ACr+4KayGTw3XVdaa4ABBlzadrwoyl2pqVxgXtQjjZcXJShh?=
 =?us-ascii?Q?48LY2fsLx8AvwM7YhZRrCimwnLFHTVQCGVhynbSkh9C0EyuxGW45tfUgeLF/?=
 =?us-ascii?Q?fVlAT0Y9QqPrELUmnnJNQwAqcR2RN+XtJQot2fExlKExVGygKCo8pcpO6BIf?=
 =?us-ascii?Q?YLX0xGlh+GBlMTibeaXHOyZpyBIQKnlpWllt+lEw+Cr/lf4ucfTUI5CikE8o?=
 =?us-ascii?Q?eFJWGz7iDCjNdB4ImPJ8dN6pxIZTdSHFsgixLvMt8E7AlOHrXbJifLFOQZ4j?=
 =?us-ascii?Q?uALAkqp4pwduuxGtD1Q/egDyEBHanyH8uJFT9Tl973BuQNYFWVs0GJ0woDKS?=
 =?us-ascii?Q?E6AhkTbd2/TCFDNzhBim8qxYZ6hTEYKfa0asWVGdIV+yG8N2f/VmQf7xOgVe?=
 =?us-ascii?Q?kvibhyZ45HXuIllVkZDUKwOHlRAE4a8RtDRiNmETnoaOJ/68yiJ4pSX/B/E0?=
 =?us-ascii?Q?Gn2q1RV6AkArhOoQg87x8s9ClOzGG4rJsdoAJH1pyiWF4Y++dMsGsjElOvGa?=
 =?us-ascii?Q?/E3Rc8JcnUvXK2MpTKfwFJHRp87lnJ6CJ3V2fIom0pjCOSqTSijRT0PcjR7H?=
 =?us-ascii?Q?WHrq3SXurrTH/MpIdWUonvx/QbSWGlZnYLGl1v90qNoHAEdCE2805YN9SX0x?=
 =?us-ascii?Q?A5Gr+M1O8913cIAM1AyRk6HrB+XUMxL19yYVp29OOp0QGKGsIu8duOoNOycZ?=
 =?us-ascii?Q?yBVJ2FYxPu1Gabn47nHjsTPWTbxGvz8Uq2Dp2Yw8tOwj0ZRISq0sQQZ6pXOn?=
 =?us-ascii?Q?qkTkSWJZpzoO7t/CWJZ0QPLjX+M3XE1H389guMzYuYb+9FonMr1xwU6fDZBK?=
 =?us-ascii?Q?KAWLq/ck8n+7VDqvSsFRH6fmo7gPCHtd7NFEBEjETFMo3Vxbg3GTRdhr4MrY?=
 =?us-ascii?Q?a87cj9BS9/O4G5fvddlac6LDxeXm+t5NtTXvHZzk901bW5l8tY8g+RbeEg82?=
 =?us-ascii?Q?VR0ToTzyq8eN/BoL+E4t11VhfF7gxAzdskfzEY6bikS0XKtmFIfTntzh6iXC?=
 =?us-ascii?Q?/m0b4K/21gh6oax0wP8ycLgS704TdeANZpwMmgaVt5aWKPamHjWecmE42t3a?=
 =?us-ascii?Q?X+311FBqSAFoH8opwDQ8U8zH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AqejAtrVHiSa9x52O5CeXfi2JqBaIv4G3atqdh49Ga6E3mnQXHa1Xu1B3fD3?=
 =?us-ascii?Q?B6R+vsr3DAEbiayjLnaogP1UmP33s2WQzt/iI2A5AuZ6KfeAnrroj3EAX1GU?=
 =?us-ascii?Q?WwB3F5x3T31NH9OmQPZrIt71wBJ0V5q3iMJ83TjZN7jxrKdfBs1S3RVsBU/j?=
 =?us-ascii?Q?FJXivdnV4KoqlU+Tw0X8m6RyuXx1l2U2K9Cb/T6Rsa4dFMixic+Q4w1hg4bN?=
 =?us-ascii?Q?79sWLOC5ONyvw78t3qZ2asHWBEKtk/Gy9Wcdg3UkL1U8wCPmGy6l4gNYiqae?=
 =?us-ascii?Q?VbWT1kpaUTISpza4FaTLe9aXxvYBfBQBVIHjW3NqbAhZKNGC8wwcAoNnfom0?=
 =?us-ascii?Q?IvI3UauED2Zadbu8QAiqfD10Wwa8DoENF6B7yp9V1NPV9+Nn2fVQ87oup4WR?=
 =?us-ascii?Q?5ypZ1kAwO5blblAb1Wh61W9D9/HmRe8uAcu0BOQnhLV4xtJlDYjfDr0wsx7W?=
 =?us-ascii?Q?xKLNIUVbIbnxrG8hD1kMq8w/1/pFKvLkVzi9qNB0pJeCx9/APEzXUdp+2bo+?=
 =?us-ascii?Q?vr3BmXwpX3kbl6djwSgMXU936YmyccESu9Qqhn3ocEq39wEQCUxzqXj5YJIH?=
 =?us-ascii?Q?c8U8nnRWk8JptbUbFue9lyQnq3im9D6eKHS2J1x0/KPJd4drk7gPj2IldkQY?=
 =?us-ascii?Q?+R9DFv2cUbvoB6GTB3yoAlHxvXACXx8Jjk6vKGC2mtgJWbw3DC1Eo9T4NSuE?=
 =?us-ascii?Q?D+aNcM3xc6LAFtVld27WR8YZ5cKJStFKgcxJMravyFvj+/+JqqB03KiKr9vf?=
 =?us-ascii?Q?SchNmA2jskG9K2dfgitAbPzQ2V0QFgnzFHGCCyH99/XX7109++FJ2paZFxDq?=
 =?us-ascii?Q?H9+hr6OsHlODkXKp/NHS3fmeI8paqPpd+CK+tvWVdLqoi2zAh1xk+ejUYSKc?=
 =?us-ascii?Q?nAovLfDQUxsBvxsp82aKrWNz68VoCruAc9g8dfKEL8aMQ1dIwXDV5wEWq/RC?=
 =?us-ascii?Q?MAv924jPHSZEM0PeaMe5x0SlzPH2q0+SG5g6AFhrDyZx0xjMA+FerPm/mxtF?=
 =?us-ascii?Q?m9kgU1q+IGR/Y0iH6gekdMT9RgaezHcb63Zt7DKMtY+Z88eHz424za1vxKkf?=
 =?us-ascii?Q?gryluFNYs7KTNOi7Um9piEdZzfrAdEn93TGYsJZ6sBgLdsG1/9EDy5OFafN6?=
 =?us-ascii?Q?oGv5XocGKV2DNPO4bmMPaiJ1Qa+57Mu9I2+mQyp1AIUtLGIUSP1RXA7OwYkc?=
 =?us-ascii?Q?WcVpZVY2ZK+8VMob3w8YIw5Z5EMLUmCLtvYFEpypICNoZpMsy3vtUjdXPX6s?=
 =?us-ascii?Q?1uGa3AOwfL6sXlVX8FMPV1jxNjhuINi4SIHL1yS+LS1D7q40MwKZbPPXIgRT?=
 =?us-ascii?Q?Y2MznF2gEwovgu6Z+ULgK1GO1iTR/P6Vxx/YYVpCWjRgTzP3vht1YMUfFHvp?=
 =?us-ascii?Q?6sGs3oKLKAjqxTljz51TvrBOS3umfoD1QAw1+Yk+dDETuW4eweBn3saaG/4O?=
 =?us-ascii?Q?SZEQAjRUlqk5kRDqxh45OBs9dRAzQ4Bv7Sjoag0S4/LgmYS9PueVmDqgCJG3?=
 =?us-ascii?Q?uMEepNT52YsipNlDC2PXObAj/wijjIXjkO3Lu1zO/qtAaM8uwk7kllINclyB?=
 =?us-ascii?Q?Np2lxSjnFCOKfVdSBWVVqwJkhlgTCfxuoT98Lr81?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306db0f2-0cd3-4787-f479-08dcf21faea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 22:28:26.7490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c5ZV88AHNSemTYb3UT87+AXz9aJss8VzEQuElXA+ju3vEsAeBT+frUmzd4TzqX69nLiRIA36vQrk6dQdeMf5zGoQUUVC8TpwC2n3qP/9+nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirmoy=
 Das
Sent: Monday, October 21, 2024 2:12 PM
To: intel-xe@lists.freedesktop.org
Cc: Das, Nirmoy <nirmoy.das@intel.com>; Ghimiray, Himal Prasad <himal.prasa=
d.ghimiray@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Brost, Matth=
ew <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Don't restart parallel queues multiple times on GT=
 reset
>=20
> In case of parallel submissions multiple GuC id will point to the
> same exec queue and on GT reset such exec queues will get restarted
> multiple times which is not desirable.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

This makes sense, though I'd assume we'd want at least one of
the GuC IDs to restart the exec queue during a GT reset.  Is that
what exec_queue_enabled helps allow?

I won't block on it presently, just was curious if that case was being
handled, or if we didn't need to worry about it.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 0b81972ff651..6aeb007eaf06 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
> =20
>  	mutex_lock(&guc->submission_state.lock);
>  	atomic_dec(&guc->submission_state.stopped);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Skip restarting parallel queues */
> +		if (exec_queue_enabled(q) && xe_exec_queue_is_parallel(q))
> +			continue;
> +
>  		guc_exec_queue_start(q);
> +	}
>  	mutex_unlock(&guc->submission_state.lock);
> =20
>  	wake_up_all(&guc->ct.wq);
> --=20
> 2.46.0
>=20
>=20
