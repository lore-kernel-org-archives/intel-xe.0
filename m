Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24803C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 09:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6A810E010;
	Tue,  6 Aug 2024 09:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhubSlbd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5614F10E010
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722935661; x=1754471661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IuCWMM2B2h2OPJaJHxssVRzn4ZbH5adkQB0PLm69sVo=;
 b=HhubSlbdhyRjLZmn3lowalHKALeZNuFjFKYznXpXYLHYbhM6ZFog3jGD
 YWP+WkhcJswR8EkHgG0di6FDU+84O9osaCw+85sv74dVpyf9bW4ppqN98
 JbHU5s8Kh917O228ZdWnuaPf6kzemTuvcwc1yM1fr8q6zPQ4RaDBn9dSG
 Ay/PXsQmI4N0OBjCe5C7QRHzhWu47DxxqAfyXqA64gD7UJMCz6uzH6dKa
 KIuvcMTT0JFdwV7GF2tkSRTi7ZQJc5u4C6UhuljUNUA7U04NsrfMjnHVn
 G5IvVmhtGQZJMziHyDG3+E9N1n/I4SsXIGjLvWgv+83Ei1aNKSTt9OUcj w==;
X-CSE-ConnectionGUID: bR3fQ2xeR1KtWCp7DL/ffQ==
X-CSE-MsgGUID: XRVZgZ9STz+dNk6j2t+nLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20753855"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20753855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 02:14:20 -0700
X-CSE-ConnectionGUID: H8u4OSM0Spmn60j1eW1fTg==
X-CSE-MsgGUID: uIo0MbvRSiKrDxR0D7JZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="60823529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 02:14:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 02:14:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 02:14:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 02:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO850CD2hMAf4ZDvTPMfrkpHXbR2JipdRZkCil0QnnwWT7nnOTpF5O5v9oB6HyQUpJIw2TQQIlhM+X//Q/WRcPbdGyIOk6jki5wyUiSZyqkNgya6T/cbICWBYjGHdsCPQZ/zZj2fKpzT2R2fi8Cd6mBlSQfpVkSKQ+9djldcTRX1+VZ8EhWm4kV2/3T5r6vrdPxnJg8czN4ZUaPii0MqFhUEl0KMZw896/voSvreSNhukyAThCJmKaoM3iAO/DCOlbSdPf1IuqNubeDUzaowqGPWDExERq1Q3dPAwXOCpzDqzBELsG33uXe60KVQwBeWcqygPB63JTHNYb7Sk62lOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbDZMIZ1WCOnzGcAcNb2LXalzp7x37H7NiXEU3F5fzU=;
 b=qS/ukXOftqz7jPOzpIt0r2aRpqCN5BqjP/JDBb7Fhw/klDqTp6dH9w7IWCGmFxcvogX5Hmi2pFKXkdG8JPqQr46QydbxxJR9GbWpd9j1ts53B9xgF8V7zlQ0pFcTmx7O92UVbbkUcHJUoGJMTzaxLc3H113Eg7YGtMkC7XjNrb2XKsfbe5FEyQqAdLCEdC3y5CcN8ilPvs8UFX+lE1PIWiVGwU+N0Ewk67MTqVwKdoF5UWxI7CW5nMZr4MDGFjnQX48bgBRxSHlqF3bNi1LVeb0HkjtHHCdE+9klSShWp/H2kbe6YMkxpFna5alw926lULDBrxtMdZHUdIBDo99m2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB7542.namprd11.prod.outlook.com (2603:10b6:510:28b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 6 Aug
 2024 09:14:15 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 09:14:15 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Write all slices if its mcr register
Thread-Topic: [PATCH] drm/xe: Write all slices if its mcr register
Thread-Index: AQHa4yw9tTRhHqabbUOffdt9BpmRbLIRSDEAgAiywuA=
Date: Tue, 6 Aug 2024 09:14:15 +0000
Message-ID: <SJ1PR11MB62049C56A03784747EB3D44681BF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
 <20240731202148.GJ2906448@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240731202148.GJ2906448@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB7542:EE_
x-ms-office365-filtering-correlation-id: 398d8fc6-245d-41bb-ce2a-08dcb5f824eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rwAc25EuBbFOepS8sbBWKoNMAxWZFKdYIrye4j2mHZDO7wBZ1Eyws/YYhlv9?=
 =?us-ascii?Q?DUI8uLsPHXXBpfT5PIyP0gSJqOMhvEO3aOo4S6E5AQNtPEQ5fuOWgSKEvuOX?=
 =?us-ascii?Q?NEsCwdHHf3HNHCKb3Mz2CUb+530JVyCI7x7P0f6MLLuA0EhYw8Jg3ns1zDbv?=
 =?us-ascii?Q?LmU9Kszn1YrlEUWQUu8E+YtxuMubCRtHQkiTwai7aDhqJw35VUqRIxFq6+GL?=
 =?us-ascii?Q?Z6b8YmxoXHp4BrIO0DkQwHydmAhsEkkKNm3y2JOUjtRG5GgVfPObHXYzWEYQ?=
 =?us-ascii?Q?+86ycc1K9L+BjvqlK7Wuvzu2uuE1eEiK0ZT8duoWhvdhGTyv0Mq85ClGou0m?=
 =?us-ascii?Q?fjs2X0WqWiUSzqMdRmlsnA6BeDw5bc+Az2aDagv59FLEemAmuiEbPNV4MLNj?=
 =?us-ascii?Q?+Hxan8x6Puof8Z9gzYhE0/Xq+fmqUFCtSRgGWZ+QZluGhGhFQu1lB0zYhQD3?=
 =?us-ascii?Q?w5JHVbI3ShxjX1bqf4anpr4FBjUWHxqjKWtILDKFcrCNSQO1BN6zMjQR99nq?=
 =?us-ascii?Q?qYUQ9e8Dvdb1eBkxdCd6XE6NRWwwhjQhOMcqcf/yRQH/IsZYkKFdfvpuvpoU?=
 =?us-ascii?Q?jaBmBMJ+du71eTRN1fd3xtyrdOf3WhalwN8F3cUDOxzXLyk4NFCC01yQlltg?=
 =?us-ascii?Q?NfFJpM33UbRzwiPT41B7e4RD80OzB8Rr1mvXWgDeHj4yTv4JGe5DCl/chKvM?=
 =?us-ascii?Q?fFPS4ekmJtk9ElOc7HlCsoWdNauMzMdqCVpXswVL5wv9nNLW3RbghTSiXVWc?=
 =?us-ascii?Q?g2qPAZEuGk3gdOWpXBMaOh/pkI6CLe/3WhPlpolImMP+1NOqDRJrxfmSfGat?=
 =?us-ascii?Q?6iVkFFtVw3APfvXivJo7iO9iZrZv2RbCpglJhBfwGWFN5Du+RSvvdftnnI4l?=
 =?us-ascii?Q?X4ytsCSphBTfN+DNI3jduaSAOM3pPastxBnNpZD0rbR23Q8WdHFnPMNWynDh?=
 =?us-ascii?Q?PHNHrtk31BkVer04Nyi/aW3ixKpO8L42+U9Kz2PwYxiaIiWvKgoNtMHXhjlR?=
 =?us-ascii?Q?4T61Ik7HkGZ/gFG/H9jvzVTPkoL1nwRogS4DANi1/HSnmrd19oQoAqBLQMZ+?=
 =?us-ascii?Q?sZ+WttumxttVqeDn86GuaKoI4qUiNAfYTqUyf11NMbJeT5goFR6gCj6m0JS2?=
 =?us-ascii?Q?BYYmPIZdaCq2WfHgtT+r/jtjqeRlnlw4FmSpJnux8xG2AHIa+Yz6tN+LRFEA?=
 =?us-ascii?Q?URrfeRNNyxN05oa12/Brl3PvuAMNyji+VNhSEc9GoscBZ/ah/IZjzCL/E2cb?=
 =?us-ascii?Q?+/bCh70oB70DANCHrvZ4OV32VEu0PpfTE4EpOs+uZA9BG4cdt3wZDiz724JB?=
 =?us-ascii?Q?Uh1UQXfSpJSi7JYF//gBpzm8NlU3cO2UB6MpDP4HD9d7zKApolHuCFJNvUX8?=
 =?us-ascii?Q?d7VOIumnyLiS7bkP+LV9m0q/3w8xEYVVTrLphu0AXxVK/7TSRw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LqO0HeqLclDRy+1iPY8HORbcRwl6wk46Iz+HW11ygKj2F3u04LX6zzJ3pu1b?=
 =?us-ascii?Q?S8QQHFodbcEVweE2kjpumDB3CAXHzkOXUsNQvQ9/IPsppqoahRiK0i1bXB3l?=
 =?us-ascii?Q?2qMc/VzGj/Mf7864dRaAHWOLuNb0p/fTDynjJswV2ZuypuSGYD7aSZ4zd7Rx?=
 =?us-ascii?Q?vKIRuRm31y52J68J0YsavE3yrsIccByLIoTrDS/bh7yhHUMNQbXenac8Viav?=
 =?us-ascii?Q?IPfUjWXP4rDbPhFyH4tsyfvgghpA327IzGMO7ZuOMA59c+DqElFqEQkAl9eV?=
 =?us-ascii?Q?a8emcUonkr9Tt33nwEXZ2s3seIwNo7DMjWTjdHEKCa/TpBfprqBFhMmCACOO?=
 =?us-ascii?Q?M5/DseMv1sk+ULVAveonXkHauahVlDVKJFZJ36b+Ha9+7Cb2rbLIhuRrP0XO?=
 =?us-ascii?Q?8L3VHzSYy+4WSuZM2g6HMYC64SRQZwa0X0pTjwvKqxnKofP5lOTqHYACsXua?=
 =?us-ascii?Q?UnIVfNaQlLf+1Br198rRGaoJkjTvtGFp4zrW8GOtTjL0EMSE+ny/Dn+2vX3b?=
 =?us-ascii?Q?gjF6z3cCv8psAi4OK3VB2O39Czz+edDBlKJX8qShDgRyYQvWR1OhnnfOCAW9?=
 =?us-ascii?Q?PgzHoLSX9bNgKmeGQPhML7nfBCF/4HZLSYV8+agnnc2UTfDM7HPolVahdo3B?=
 =?us-ascii?Q?GUl14QJ6PEh3TCN10JxC8pElbNz6gthOrvZkjdrwz0mSE4oS0e3qsLwNnUCX?=
 =?us-ascii?Q?nXS5W/vU1OY3vr/OhxL66qHjy9CCpnK9qWfcpX139kPv/tEgQqZaLbDBRhij?=
 =?us-ascii?Q?+1lJF5JHoBBdQqyZkMmbTUhTQPr4E6shiRHF4kc2VMxYqfn+nlmj6DaF4zuw?=
 =?us-ascii?Q?hC4s6HSsQPfsUOp5wSqZ5SP3fyavnheUL3PnGTlZMqMh+r7y2ahXDBtVawCb?=
 =?us-ascii?Q?X6A8rNqkGg6zoxWe9xPpEVvwQHt7ZuRt85Ed1RoW+bZsBwBluwgFRvt7l6m/?=
 =?us-ascii?Q?qSP71tpYYq2+XNc4JggUWR/KA7+XNgO6oTa9sHiHtumQoxZftG9qhcc/oIqH?=
 =?us-ascii?Q?P2RDSyy7LFPedVE0ISU8WHbFKUpWhfETVzlmxYq2asMNqrUParXnr9uI6lZB?=
 =?us-ascii?Q?Qtc+fT17BfNTNot4Z1NTQzX1J1NCH2V7Vpg/Tz03CAboeYCuem5QWVWqTXWU?=
 =?us-ascii?Q?Tyncdm+gzIj7ZpWoTP9bAPJZaErDLjH7ddwqrKo0OUBQMz3PoNbJS83+Mgr9?=
 =?us-ascii?Q?KTwozUSqr4kis0AB+Bv0rpBv2eOJXgOzMcsi0Tfvyj6FSoDr4FwTopx6bZcx?=
 =?us-ascii?Q?jWcKCAmFI2duQsiVlQvVQdr4vaJO28AAEyk2yKOwGLYe7fAxAWv2Yukp/akK?=
 =?us-ascii?Q?OAFHDcuYjagVTFsciTJUunN+ybaxgrnCNHc5RsYddYV8mVOddvBGpfFy2o1Y?=
 =?us-ascii?Q?IbsFvieqtlESw5gH2red4qklwYUncL4zDMb8dre47Ijz3YJKuTGaA+yKOt7e?=
 =?us-ascii?Q?Y6oFmy0Lq485LZw6nU9lBT/WzkRiCJcOnjROygN3RmAL2Xv1Q9atKerBtTxn?=
 =?us-ascii?Q?HO8TIGWS0QiPL8RbyriL35+QRj2hvnkwC5IlMIbRnbgvI9D/s/KulyirZ521?=
 =?us-ascii?Q?uHuGCUSY2F49YeoR3FjsNc6YHyqn+0VUt2tERjLg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398d8fc6-245d-41bb-ce2a-08dcb5f824eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 09:14:15.5637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Db4JXTndPCjUMt/cdnROaCa+1GfW0o6lYEWeZcG+VKovZv/pqwzkxVTef1Y/BYnti+mlvemEBvMa3MwkRTGWszS2A34aKxOmVtYGPk2oj2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7542
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, August 1, 2024 1:52 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Write all slices if its mcr register
>=20
> On Wed, Jul 31, 2024 at 03:01:52PM +0530, Tejas Upadhyay wrote:
> > Register GAMREQSTRM_CTRL should be considered mcr register which
> > should write to all slices as per documentation.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Bspec: 71185
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>=20
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
> >  drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 3b87f95f9ecf..b131e3171899 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -80,7 +80,7 @@
> >  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
> >  #define   LE_CACHEABILITY(value)
> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
> >
> > -#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> > +#define XE2_GAMREQSTRM_CTRL
> 	XE_REG_MCR(0x4194)
> >  #define   CG_DIS_CNTLBUS			REG_BIT(6)
> >
> >  #define CCS_AUX_INV				XE_REG(0x4208)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 58895ed22f6e..c6296dc8897f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -110,9 +110,9 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt
> > *gt)
> >
> >  	if (!xe_gt_is_media_type(gt)) {
> >  		xe_mmio_write32(gt, SCRATCH1LPFC,
> EN_L3_RW_CCS_CACHE_FLUSH);
> > -		reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> > +		reg =3D xe_gt_mcr_unicast_read_any(gt,
> XE2_GAMREQSTRM_CTRL);

This is showing regression, mcr init is little later after this call. Shoul=
d we read first slice default using  =3D xe_mmio_read32() or we should shuf=
fle order of mcr_init and xe_gt_enable_host_l2_vram(). Any suggestion?

Thanks,
Tejas
> >  		reg |=3D CG_DIS_CNTLBUS;
> > -		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> > +		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL,
> reg);
> >  	}
> >
> >  	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3); @@ -
> 134,9
> > +134,9 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> >  	if (WARN_ON(err))
> >  		return;
> >
> > -	reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> > +	reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
> >  	reg &=3D ~CG_DIS_CNTLBUS;
> > -	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> > +	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> >
> >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);  }
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
