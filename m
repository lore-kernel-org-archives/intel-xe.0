Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AC8EB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 08:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86EC10E423;
	Wed, 14 Jun 2023 08:08:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5634910E425
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686730090; x=1718266090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z0uf9KXPf+QuJL8l+OvRw6mLlSIzjVYgrVYR3yqCNPc=;
 b=KvsiUIMKhawGFLWZ9ir8dIgNB8hImVKpRdApUv28Odb5RX9TAdw7Bagp
 bXP6Ot/y91jqhdrcKRYEqEvAZhshx1gu7YHswBmGO9MD1rMKw3oLy+koS
 Fpa9O730iO6Qk/h+ivFed3NFB9eXvTsZ3UiJFIDXQs1S7AOibAIXNeewg
 osruIUJ90pfkGQd+FjW0OqZc+l+TPc0tUBNOjxG810NPSjWXmeKcc+G+Y
 NM7JglRYE5rCyqT4+QxeR05VxzOJTWPfSukar+clbLcfj6xTzyST/++7u
 uaDiNq4/S8aqydj6Hv/lotc/p6aMmPILzhxpiUIBczRHJHLJIgFgHWRUH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361923676"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="361923676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 01:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="1042101350"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="1042101350"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2023 01:08:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 01:08:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 01:08:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 01:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0BeoicOnTfo4H7iLoGkF+nUNlaihT6KmDaIFJ6OO7CMgK1/OUfOn62hcyKdF8LSKFuOlAqwlhwS8xBYNZt0/6jZbKw3FyslFEAVmfATyyEFlOna4NSstaUK3hxepmo3+DGiC3wt1+sm5mttuP848/lxB0Yuzssk+csORPQRLqs2UNCSrdgovk+FKjUHyIRhC02MMI0DgvfzFChvI/+/Ym2bFS1MmrCh9k0J6RiIKFz4RsdWM069Ekr1DxHUz6bBuajEKsJstGk4e1Mv9YH5GlauruNHfwp7sBNvdA5U2F75QGnYqOyOkZYH/EPXbKjmyKUPUbkTJEIJcMKRSq/0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrlccSvnAIUO8p+adGLxhGssbf0n5O7KV6QXOfJavho=;
 b=UlFPOauKnir4aUA2SabyI7yPnKBRQmiMY1/G8mUngrgsgmH43tmO3oEbC2uN+FXyAeFtimfK3hGJdibtwcIJby48Ue046xFcaVDj0UvXUNm1GRhhvpskcMF2BjIIg9j+PW33H/Az1b8G8pl93F5S/yWjN922jtlB8pvpLtfEFyspHz+5QvoyoNg8HAwn3Wv2vZ7OannLlwKQS/Ktg6BWFR/YLITc5QjSpQ45VKgMjWGVRfLjo0NEEkXaX6C7Ngu2RpJmLPTGnb8TJ7SCF6Z54H3fGDszyBYoHhfGcZdubn7q3F1SfwfOyGyzQ9zr+t1NhyqFBCgxL5pVlbl6K9QYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 08:08:01 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 08:08:01 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nilawar, Badal" <badal.nilawar@intel.com>
Thread-Topic: [PATCH 2/2] drm/xe/mtl: Add support to get C6 residency/status
 of MTL
Thread-Index: AQHZndNJ+1WSevAJMEKdhZf0fjgxT6+J67aA
Date: Wed, 14 Jun 2023 08:08:00 +0000
Message-ID: <CY5PR11MB621125B0EC412873760578A3955AA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-3-riana.tauro@intel.com>
In-Reply-To: <20230613084721.3698818-3-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW4PR11MB5823:EE_
x-ms-office365-filtering-correlation-id: 30157204-bb2e-4a51-6b97-08db6cae78ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +frr5D5APhuRX9SOrWZDUvq+PMzu3M7ckhR+34Xcy5AuRGUZAir5TpPuwaXiOtgCaoIylfwJU4TJ6d1Rj+6rlb7MCumreKy+DzxPyXxb7UmwVRZnsqOr54YBjGr7ZkPqEg4d/1km0NT54PJccYmCN47XOdtYWnu1jmIcUfjdvFpIX0XBuE1Gr+EBJPoWzG2vuXeIBhVSbps7lSvObjO4C9m6JInYTKrKdaayU53QHOCt50WHBZ6iO1uLNxW4Kz9A/QHriTGp5XEv04+bmNkCTSgAUqpyT/g9+w3hvz8H6yxbEt6Rup2OIoBo5FfFPX+rxC3hFEsUOgO9nSq4+n4qSyjFS5teW1Vw0tYjzHfJ3gH98Ig6kZlyfvGrdTgybC+tYraiqrZ4lpVz0DSmbBdcTIsqU9qIAynclCmfJef+M4txPpfphfBYa1aPiCW4KKr4PCgUmbQzFlHyLkW0r77XNs8n8Zw8WcgcKDOCcCzZNqhB4+E4dtdfxhLMf7LpLnysZ0l3UlL5+bmquBQPHAFFtCL/leiOlEUQY0Wg+MsE2D5J18miikh9DLDHnfxo1UOwPd+MQmoLa9joPtcff98z0s4Pm0o2u236alnZ1+HZRvd3f/x+rCO8agLRHLHzXvT6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(122000001)(83380400001)(66476007)(55016003)(64756008)(76116006)(26005)(53546011)(9686003)(71200400001)(7696005)(6506007)(6636002)(54906003)(186003)(110136005)(86362001)(5660300002)(478600001)(8676002)(52536014)(2906002)(8936002)(33656002)(38070700005)(4326008)(316002)(38100700002)(41300700001)(66946007)(66556008)(66446008)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0YhgImtNCaroHwlpNWPXiTonoJwhaAQfwney899Yo/+MnJtCg062gXLasaww?=
 =?us-ascii?Q?oczc9C1VeeuUevcfsch08DH1NXO21KHdeBlnsDEEn7G1tCDNh2MH/TMvfLDZ?=
 =?us-ascii?Q?jkFQbhoiTnfbSLuqyCX8G33q5KjKfcXYtgdxCtMXudN6e+Oje6t2KyElwHGU?=
 =?us-ascii?Q?F6q86+WucJ6IshYnyWynzOk0gJGCYgy5gIbChKKzjoRS85PPSwzrm59fLx24?=
 =?us-ascii?Q?9CSNS9rn7QarPYKf75xnAN+FV45/Upe6wzuZjFlq/NSFLOhCNgFp2Y2wTjep?=
 =?us-ascii?Q?z0469J8dFW7TR+BwGMYo9xgwaLLqFmeb3LY9UdttRptUelImGKWdkxJnhGq2?=
 =?us-ascii?Q?Sui2WL2xK4ektBC7JVIzEqXqBcmaYPIF31Lu8pzNxqlMiNPMP/pvheYx8ewx?=
 =?us-ascii?Q?DsvKiokVZ0ZUXG7NXyr7OCdwmG9vDTcTBvZIaRKvo42qu/hesDZQ38lStRt5?=
 =?us-ascii?Q?6ibwn0GW2IOUGEvgI/T59N8U7kEWiy3tpvMoLcimdX1JQ0yCae/SqIORQ63S?=
 =?us-ascii?Q?RCAd+5DkTKkKfMtGzaFVNbmnLIv6+HOyrAEk98zLRItuvfNig84gPtjS0sa4?=
 =?us-ascii?Q?ftvBDupt2eCUJJPMqXG3BxNF3nb2Skvs0mFHxFy++IZlCPqcRhcAgAMf9Lzl?=
 =?us-ascii?Q?JNTm8ft7H6stzSrkNy1SLo+NXWwcoAlZC/D1hugg81lzyDR9rdg6PDrn+rRv?=
 =?us-ascii?Q?QyBcpLzDkw9jEWJVMD8/MheucU82/SctUEZz/ITcsl5daLziFeNUZBfSttqt?=
 =?us-ascii?Q?s2hS8Ykd+OfUyT1ntpgdU2bR9T06Ba5yW1QPWW/hSY0nj1GszvGC/mou1w9a?=
 =?us-ascii?Q?zcIYoLc6TGtqfwGESVYEf0YVqDKpVMNQRSTsR3WZs0OCghUzTj2IS5NAnNjC?=
 =?us-ascii?Q?enhmHoRjsevmtsSxsD4cBPjVO8kYx1zxmzwvhxv2II8ZM7cLrOsHLrfs8UOu?=
 =?us-ascii?Q?CTkvIXECrsKde/NUpZetemipBj8TejizBCGB09gDzYiRLO1hixWromN/LbEs?=
 =?us-ascii?Q?+xWFOvREC8trDZCsspclc0PMI2dwDXfLloFJfk3n3p2LfJOrpa4Txrs+TtGm?=
 =?us-ascii?Q?UwyLna0O03kIWmxcbk+yRE3BlvnQi59oDOsy/5v7oh7ARG/95l3ns6C7Wl05?=
 =?us-ascii?Q?YGBy5bL18ZD5swPh2A2evW9rKaKXxaw64kRuKfSZZmvbwBbfWi9lNu0YS7mT?=
 =?us-ascii?Q?S+/D7JlJ23qLTs9xVhhWNK6nB+uYdOLJG5KL2139ba5nubM3Bb0n131tGGGL?=
 =?us-ascii?Q?A07k0+2V/QjAWst1fRo3vRd/xUslsy1iiDjVt4sE8TSct3xXesXDlFktpc5f?=
 =?us-ascii?Q?+Ddjyagu7DWpB4egBWQ+HbNq8crOMMawv5Mltrt1ePoSIiJBCoVmwCtu6OC2?=
 =?us-ascii?Q?MZpoJdoDype0NdLxP1yTqgP3D/ZM129xtfWRQZ90BGHSN/E+ae4UccSEVAFJ?=
 =?us-ascii?Q?67YoXmbgP2WyFzBAz+n7M0jPMU52MiO3O4IDOtAib3GfHPLhRyGeTVtLCIMZ?=
 =?us-ascii?Q?QxzN+WMisUZu8rAx7wJeFdV6kOHrGf29QF3nEaO3frxr7lMxnJjOZuaoOPMM?=
 =?us-ascii?Q?AhEYN/nUs6etnoIVC8sn/3ON2i87bI8XoSLO4FhF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30157204-bb2e-4a51-6b97-08db6cae78ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 08:08:00.7326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okNFyQKLJIgrEPWLS4je14dpu5W6854rYO7EaXQJ4vQhOnGVafcy3nLIp3hkNIasimhEIxu2PSc0bJZ1ZlDQos7/0AguX1rZAgG0HSZwZm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Tuesday, June 13, 2023 2:17 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Brost, Matthew <matthew.brost@intel.com>; andi.shyti@linux.intel.com;
> joonas.lahtinen@linux.intel.com
> Subject: [PATCH 2/2] drm/xe/mtl: Add support to get C6 residency/status o=
f
> MTL
>=20
> From: Badal Nilawar <badal.nilawar@intel.com>
>=20
> Add the registers to get C6 residency of MTL SAMedia and
> C6 status of MTL gts
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  2 ++
> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 16 +++++++---
>  drivers/gpu/drm/xe/xe_guc_pc.c        | 44
> +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h        |  2 ++
>  4 files changed, 60 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0f920175526e..7c3dd0a81b71 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -341,6 +341,8 @@
>  #define   FORCEWAKE_USER			BIT(1)
>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>=20
> +#define MTL_MEDIA_MC6				XE_REG(0x138048)
Reg should define in a header.
> +
>  #define GT_CORE_STATUS				XE_REG(0x138060)
>  #define   RCN_MASK				REG_GENMASK(2, 0)
>  #define   GT_RC0				0
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> index 1b2dcac46479..a75816a610ae 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -140,11 +140,19 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle=
)
>  	if (!kobj)
>  		return -ENOMEM;
>=20
> -	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> -	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +	if (xe->info.platform =3D=3D XE_METEORLAKE &&
> +	    gt->info.type =3D=3D XE_GT_TYPE_MEDIA) {
> +		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
> +		gtidle->idle_residency =3D xe_guc_pc_mc6_residency;
> +		gtidle->idle_status =3D xe_guc_pc_mc_status;
> +	} else {
> +		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +		gtidle->idle_residency =3D xe_guc_pc_rc6_residency;
> +		gtidle->idle_status =3D xe_guc_pc_rc_status;
> +	}
> +
> +	/* Multiplier for Residency counter in units of 1.28us */
>  	gtidle->residency_multiplier =3D 1280;
> -	gtidle->idle_residency =3D xe_guc_pc_rc6_residency;
> -	gtidle->idle_status =3D xe_guc_pc_rc_status;
>=20
>  	err =3D sysfs_create_files(kobj, gt_idle_attrs);
>  	if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index 72f49808918a..35ca4115dc96
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -36,6 +36,10 @@
>=20
>  #define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
Need Bspec index here.
>  #define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
> +#define   MTL_CC_MASK		REG_GENMASK(12, 9)
> +#define   MTL_C0		0
> +#define   MTL_C6		3
These register definition also should move in to the appropriate reg header=
 file
> +
>=20
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GEN9_FREQ_SCALER	3
> @@ -598,6 +602,29 @@ enum xe_gt_idle_state xe_guc_pc_rc_status(struct
> xe_guc_pc *pc)
>  	}
>  }
>=20
> +/**
> + * xe_guc_pc_mc_status - get the current Media C state
> + * @pc: XE_GuC_PC instance
> + */
> +enum xe_gt_idle_state xe_guc_pc_mc_status(struct xe_guc_pc *pc) {
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u32 reg;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	reg =3D xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +	xe_device_mem_access_put(gt_to_xe(gt));
Duplication code of getting a wakeref can be avoided  with macro.
Thanks,
Anshuman Gupta.
> +
> +	switch (REG_FIELD_GET(MTL_CC_MASK, reg)) {
> +	case MTL_C6:
> +		return GT_IDLE_C6;
> +	case MTL_C0:
> +		return GT_IDLE_C0;
> +	default:
> +		return GT_IDLE_UNKNOWN;
> +	}
> +}
> +
>  /**
>   * xe_guc_pc_rc6_residency - rc6 residency counter
>   * @pc: Xe_GuC_PC instance
> @@ -615,6 +642,23 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc
> *pc)
>  	return reg;
>  }
>=20
> +/**
> + * xe_guc_pc_mc6_residency - mc6 residency counter
> + * @pc: Xe_GuC_PC instance
> + */
> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc) {
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u64 reg;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	reg =3D xe_mmio_read32(gt, MTL_MEDIA_MC6);
> +
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return reg;
> +}
> +
>  static const struct attribute *pc_attrs[] =3D {
>  	&dev_attr_freq_act.attr,
>  	&dev_attr_freq_cur.attr,
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
> b/drivers/gpu/drm/xe/xe_guc_pc.h index 976179dbc9a8..0d13c19b7b78
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -13,5 +13,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);  int
> xe_guc_pc_stop(struct xe_guc_pc *pc);
>=20
>  enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
> +enum xe_gt_idle_state xe_guc_pc_mc_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  #endif /* _XE_GUC_PC_H_ */
> --
> 2.40.0

