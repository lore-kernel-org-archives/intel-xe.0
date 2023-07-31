Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60C4C001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10810E14B;
	Mon, 31 Jul 2023 14:12:59 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C6110E14B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690812777; x=1722348777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3kMaSVDBZfGEvrW3eklgyH3bciuiTBa6ppSK+xjCO0Y=;
 b=XhDb8a0iSLllXMAWhPWtyWHaUxsjTW29InrDAftuyLzGVyEs1w7vD1cN
 FYSFevZfLcsNc0453M/vTSK9IoZocjXd6DuWdqvqsc3Z55nd+4j95LhBZ
 FXPgwn8Jrmath7uedIPvE1yGk1L5ducNQVIJ9L2UjTb1GaQS3VLB2N10N
 P/wuv5KJAnTg07TEP5/Ddmlla0UiyV7KipmN3pndL2qRlLApIQX58dEuD
 PfT53qHPeqOd0kJhUXLb/+Uba/+6CRW4Pm5zqnnURVWusemQB8HVR2cjS
 uwEhWOBGUn5nveExsZ7nqGTaqqIsMpHnToiUdzFf4tuVK4H4wSoHpIXAS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="432846195"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="432846195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="678359908"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="678359908"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 31 Jul 2023 07:12:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:12:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:12:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 07:12:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 07:12:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyRzAL6s9XLjdv17IlC6WYpxieJ/O2UHSPZlFRr0NlDhR19BP/WkDmbo35pJh7JgkH2A2j/J+gx5xAE4Ar+Fn6bE5y9AXYtzxPGV0kfmNqc1AYvU80q1O05FhPCG72IWWEmiHjstfSOgAL0GGW/Iuw0cv4DU/P0ww14nMpFGYm9hUQsjFE6q3OK0TuC2gBZPHusQXtGy0hISgHXgBtQ/brDjQpUKiiNsRG8JFoGVo3yyfngEjZLk0TxnJRgS4QAwLrmA/nWKJwVtTrLmYrNjV4Ij8j5p8AKDO+WwpRWyZYSkfWprFedXYh1uDJEaKDlimdSt/HYQy+IPEHwZ2O8WgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO9MJ+NxiiO/1s9b9juaRX9s5Wp2BoXMZgEoZ0KBNXk=;
 b=SW3Cg5iwDKnV3LQeZHbFIgla6LmzoM9Iq+ceJT0fuJaSGOcQIYc/1d8326uyB68Mbe5Gs/bP+iIpdmHPGp5t4lHSrkgSeytGNoU408GLQoUe1pGw5k0Sz3NgLSSIsuMMKa2M612Gvjjol9gDLO28vPt64AvLVKEIQ1gDEbJSS9DHRzRLvYuu4M6pgOP8e+dGy8wlb21QtQ1mKShNTg07A66i/pdOdqJSfSxq/p0GXCaYTW2JkLG+8b2iQ2212b0+P+byiaiHlfKCnDcIra6rNqtUCfI2gxrLktnHU9e+7xloJO2vLv7Kffc9eQ6dhecXLQjScKxb/cGQPl3/Gm2cAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:12:44 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 14:12:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH V10 1/6] drm/xe: Add sysfs entries for engines under its
 GT
Thread-Index: AQHZw6/j8l8krg1KBUGNxfDth9Cj76/T6fWAgAAAgqA=
Date: Mon, 31 Jul 2023 14:12:43 +0000
Message-ID: <SJ1PR11MB620427C48D43A7CF916146BD8105A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
 <20230731131337.1100068-2-tejas.upadhyay@intel.com>
 <ZMfArZcYV3gL0dWu@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMfArZcYV3gL0dWu@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7924:EE_
x-ms-office365-filtering-correlation-id: c7c9cc55-dbbd-4c43-ad48-08db91d03568
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djC8RGQOneFqLL8oAlSgkitvbni4tKEbz34BTQsrTZ05kYKUfKbKhchk6o9lT3sCyxMDoiMXX2cIVl7u8emGBkkPLVhpnauqu6eA7x12fCp+dVhWqfzrodRSKbpXExhCb5EZMlvkCmnsnvDKlmpfIQODrFQFMBIktjz3+cFRn6afzKIF3VIkQPb9eYBXW0flP9lPD+KdUSF7L2CQK67rch91cIX4YAIqXrn/04pxtJUrhNll7WsPoQYTkogsV50mOATAfXjpOD2TJrvRz3qi5nqpPW2AybqcMFwNkN8dQO+NK8m6NJqd8MNp47HVDgMqnodCiHYpd+TvUWWdcCxF44duPA8DGhpo5+TthfTF3kpN7cRp61ltfOfquFeImx+v3CCs3Qo/Hbb2hhfwJtrOWdl2ki2YU1USK7n9P1+Sv9wIOfBl1XLUwROqk7Gh/LaN2YGLgXrojgJCOJAXNeKJ+x2CNOFERnMNXpNwBLDSj+TPXXAVVOmBLYCnnwy5ctwuDansa9O6t4RWxEj8MNeti7+8ff7IlHWZp0QyDSH3kjOuC++Pf0BgrTNnA28oqpviGLscVDSgw6EFqjIfqwmqM6+g4gYb57cHripCwgyGMgS3fMdXSOZw33acB0j243/t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(9686003)(7696005)(55016003)(53546011)(6506007)(83380400001)(107886003)(186003)(33656002)(76116006)(66946007)(66556008)(52536014)(41300700001)(122000001)(54906003)(82960400001)(38070700005)(86362001)(66476007)(316002)(4326008)(5660300002)(64756008)(66446008)(6636002)(8676002)(6862004)(8936002)(38100700002)(2906002)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YQ2uB3K4AsolEBUlvsQm1UZBSgfd3wtM1bKoEp+PjcD/JN4ctOVSSJjcXUOv?=
 =?us-ascii?Q?Qw5WNNKOLB8+i9Oq06jx1cSi5VLH1g4YAxXoUD+ANvhtTvGiROB+PYa2HRbL?=
 =?us-ascii?Q?tk52IOkpEtKUeNy9i+0kMnpNJh+BzcCpyWHNNFDQVmBymiJRUATNjlC8dGfR?=
 =?us-ascii?Q?L/wJnDrv+kB2hjD8RivXWDNeBecuqz8r25Ad29Ui9iLdAsCkH5OJBp/CtBsZ?=
 =?us-ascii?Q?J4rEJUK5a94RUcgOrwYM+wKW8q85HhyVs4OAluaZUKc9Th4fBpo9Z7pjqdpf?=
 =?us-ascii?Q?kbVxLzsd3qm5/7Xeln6Kl6ojwrGs6Tg/ktepo2zqt519FnQzHDFukTgpH+k8?=
 =?us-ascii?Q?SsjK6NC9M6y0hpTKmbTe/NTZdWXF4CVJsLto/eXfKTY8jj4ilCF/anIoEejT?=
 =?us-ascii?Q?XE8yYrnnTHp/m+nyDziDx88Jit7Gf2StEChO6ATzRVq8LzeJYAK7b5yCDZRZ?=
 =?us-ascii?Q?nxumdXJGE0moDPUSQLGVPgEcrcSfSrEIWoHyAwiEWd6z3V5J1PtnYSmRbAEM?=
 =?us-ascii?Q?9UaaVSRFaqHzq34rHkL2s+PUf8sDOPqdXYeFH8JJ7AGLEebtXQlCblw2zCgj?=
 =?us-ascii?Q?qy0A/dLrPJ/WR6V1E0Ib2U6W73Ec5fANRclsiJE+I8qlRl4Vki1fB/w6yV9J?=
 =?us-ascii?Q?trY12aw5f6BL4057PV0D9OW4t3O+aNZkhNq9iJnvvHM9CdiBriGoDlxBD27i?=
 =?us-ascii?Q?9gECK1MTmaZq7Rsu+mVj7jTfY8iGu1CLeIQZkjZaDVcE9idgcYfZmEKURBaf?=
 =?us-ascii?Q?QkHCeqYMjRQPsSyQHobOcwZs8DvJFpRFcUmNrAuSu4CUpw2IOYTTmhrwqrsJ?=
 =?us-ascii?Q?RCkKHypsTyCB4Fso6e06Od5Ouau3QIXevDelj2u9hdO3nkFJNHN4fyHExnaP?=
 =?us-ascii?Q?iKugu6EcQ/PFpMmYvHj9vkaRHV/BDN0yxb2NtbdUOcvMlT8Swvk5uBdH739o?=
 =?us-ascii?Q?URbbMNhSHGKiI0T8HbDM6s4WTtC1riJQZHJttOsQ172we+cxVFbxpokKmPzY?=
 =?us-ascii?Q?8Esw7vEyyjfUz38qXMvo876vpp9Sg660MdAtEIdWTiWVxGSHMvjtZjHXdLxj?=
 =?us-ascii?Q?IIym3eKYundBHwgujPqn2KEyTAEdwIuaWIv65vJ12lDWxVA2oS8T9P3UIJRa?=
 =?us-ascii?Q?Cf/IBmIhgLrr27DZwqRmH+7m0Hx72VN2HpnV/F4NQB2+qOdjTDUrQnNoWTGZ?=
 =?us-ascii?Q?UplERDfDlu/BAXGn/QdoFUB9G+Tq0Is59EHiPkTtz/Qn2k6czVROqr6GsYcS?=
 =?us-ascii?Q?adlvpoLXQFhFtFR3jXmm69bR2+0Zurso1cGOOPr0Wy8eow5pMAZqg/ffWAr1?=
 =?us-ascii?Q?lSKKdQ3xSQgkzXFEjCNQbxVj5DoZZGhdpm2bNRwISMkzkmFq5UHRMT6Si5i3?=
 =?us-ascii?Q?fkBAcY96j9wbd6i1ppUsB4adYHjRD/cbfO5bgpxNtJvi8EFa4YgHOQQaLxZu?=
 =?us-ascii?Q?mdrHRxAYq4UlD/tvzBM1iT8Em+PtZdAyarjbWHwZ5y+p1PeWoAQ9BdftDBJv?=
 =?us-ascii?Q?cb2g5uKUjABVaGJLoligpnEXChcvO+gLwMfSDulPMlbtkDW2vacTgmkWq32G?=
 =?us-ascii?Q?gbzZ9HKGKl4NM6Wf3jAjMWkcruCVsltTr37usPrZRW3bJj4abIVdj+Bkv2Si?=
 =?us-ascii?Q?/A7/olFl5cxZHaF8nokhqyBGuvznREQZlClsye+Y0EVA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c9cc55-dbbd-4c43-ad48-08db91d03568
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 14:12:43.7869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oPdhqgkZF/q566hovsogRG7kkAUoqYhDP+WbZjR2v3qXduUBtlpm4nqCoigTaJXBy4ZPpmkjp7JaNBIiDXOhMyh7TBQBZkZI37WA/k9PKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V10 1/6] drm/xe: Add sysfs entries for
 engines under its GT
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, July 31, 2023 7:40 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH V10 1/6] drm/xe: Add sysfs entries for engines under =
its
> GT
>=20
> On Mon, Jul 31, 2023 at 06:43:32PM +0530, Tejas Upadhyay wrote:
> > Add engines sysfs directory under its GT and create sub directory for
> > all engine class (note its not per instance) present on GT.
> >
> > For example,
> > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> > bcs/ ccs/
> >
> > V6 :
> >    - Add kernel doc and arrange file in make file by alphabet - Matt
> > V5 :
> >    - replace xe_engine with xe_hw_engine - Matt
> > V4 :
> >    - Rebase to resolve conflicts - CI
> > V3 :
> >    - Move code in its own file
> >    - Rename API name
> > V2 :
> >    - Correct class mask logic - Himal
> >    - Remove extra parenthesis
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt.c                    |   7 +
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 121
> > ++++++++++++++++++  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |
> > 13 ++
> >  4 files changed, 142 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 4ea9e3150c20..2ddae8e312b2 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -74,6 +74,7 @@ xe-y +=3D xe_bb.o \
> >  	xe_guc_pc.o \
> >  	xe_guc_submit.o \
> >  	xe_hw_engine.o \
> > +	xe_hw_engine_class_sysfs.o \
> >  	xe_hw_fence.o \
> >  	xe_huc.o \
> >  	xe_huc_debugfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 28bf577c7bf2..5436ce651076 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -28,6 +28,7 @@
> >  #include "xe_gt_topology.h"
> >  #include "xe_guc_engine_types.h"
> >  #include "xe_hw_fence.h"
> > +#include "xe_hw_engine_class_sysfs.h"
> >  #include "xe_irq.h"
> >  #include "xe_lrc.h"
> >  #include "xe_map.h"
> > @@ -323,6 +324,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_force_wake;
> >
> > +	err =3D xe_hw_engine_class_sysfs_init(gt);
> > +	if (err)
> > +		drm_warn(&gt_to_xe(gt)->drm,
> > +			 "failed to register engines sysfs directory, err: %d\n",
> > +			 err);
> > +
> >  	err =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  	XE_WARN_ON(err);
> >  	xe_device_mem_access_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > new file mode 100644
> > index 000000000000..ad57faf69f9a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2023 Intel Corporation  */
> > +
> > +#include <drm/drm_managed.h>
> > +#include <linux/kobject.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include "xe_hw_engine_class_sysfs.h"
> > +
> > +#define MAX_ENGINE_CLASS_NAME_LEN    16
> > +static void kobj_xe_hw_engine_release(struct kobject *kobj) {
> > +	kfree(kobj);
> > +}
> > +
> > +static const struct kobj_type kobj_xe_hw_engine_type =3D {
> > +	.release =3D kobj_xe_hw_engine_release,
> > +	.sysfs_ops =3D &kobj_sysfs_ops
> > +};
> > +
> > +static struct kobject *
> > +kobj_xe_hw_engine(struct kobject *parent, char *name) {
> > +	struct kobject *kobj;
> > +
> > +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > +	if (!kobj)
> > +		return NULL;
> > +
> > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> > +	if (kobject_add(kobj, parent, "%s", name)) {
> > +		kobject_put(kobj);
> > +		return NULL;
> > +	}
> > +
> > +	return kobj;
> > +}
> > +
> > +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj) {
> > +	kfree(kobj);
> > +}
> > +
> > +static const struct kobj_type xe_hw_engine_sysfs_kobj_type =3D {
> > +	.release =3D xe_hw_engine_sysfs_kobj_release,
> > +	.sysfs_ops =3D &kobj_sysfs_ops,
> > +};
> > +
> > +/**
> > + * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
> > + * @gt: Xe GT.
> > + *
> > + * This routine creates sysfs for HW engine classes and adds methods
> > + * to get/set different scheduling properties for HW engines class.
> > + *
> > + * Returns: Returns error value for failure and 0 for success.
> > + */
> > +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt) {
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct kobject *kobj;
> > +	u16 class_mask =3D 0;
> > +	int err =3D 0;
> > +
> > +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > +	if (!kobj)
> > +		return -ENOMEM;
> > +
> > +	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > +
> > +	err =3D kobject_add(kobj, gt->sysfs, "engines");
> > +	if (err) {
> > +		kobject_put(kobj);
> > +		return err;
> > +	}
> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		char name[MAX_ENGINE_CLASS_NAME_LEN];
> > +		struct kobject *khwe;
> > +
> > +		if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER ||
> > +		    hwe->class =3D=3D XE_ENGINE_CLASS_MAX)
> > +			continue;
> > +
> > +		if ((class_mask >> hwe->class) & 1)
> > +			continue;
> > +
> > +		class_mask |=3D 1 << hwe->class;
> > +
> > +		switch (hwe->class) {
> > +		case XE_ENGINE_CLASS_RENDER:
> > +			strcpy(name, "rcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > +			strcpy(name, "vcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > +			strcpy(name, "vecs");
> > +			break;
> > +		case XE_ENGINE_CLASS_COPY:
> > +			strcpy(name, "bcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_COMPUTE:
> > +			strcpy(name, "ccs");
> > +			break;
> > +		default:
> > +			kobject_put(kobj);
> > +			return -EINVAL;
> > +		}
> > +
> > +		khwe =3D kobj_xe_hw_engine(kobj, name);
> > +		if (!khwe) {
> > +			kobject_put(kobj);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > new file mode 100644
> > index 000000000000..b96125443db9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (c) 2023 Intel Corporation  */
> > +
> > +#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> > +#define _XE_ENGINE_CLASS_SYSFS_H__
> > +
> > +#include "xe_gt.h"
>=20
> No need to include xe_gt.h, rather just forward decl.
>=20
> i.e.
> s/#include "xe_gt.h"/struct xe_gt;/

Like I responded in last revision comment, this also needs for_each_hw_engi=
ne def. So I will need it.

Thanks,
Tejas
>=20
> Matt
>=20
> > +
> > +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > +
> > +#endif
> > --
> > 2.25.1
> >
