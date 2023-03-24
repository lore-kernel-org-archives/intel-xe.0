Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B2AC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 18:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F410E180;
	Fri, 24 Mar 2023 18:12:10 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0910E180
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679681529; x=1711217529;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7xyRgQ8/jZOgDNYjhAFzo2u4J4D5EBxdzS4qD0ncn3w=;
 b=SLfPduFLkPmZtVSzCCc9lnQowDxf7I+fxhYLEb9ImidBmgbeFRre34se
 2ftdqE1q7eTPKUl4LflyUBztuPOUDIJKKKbVz5pK1sBAKJ3t3M4AwxA/b
 Tvog9G/7E90sfamfCyFBTWMfKeoSwLqkbF3qkivA8+XrznUQ21qQ8GLrg
 elpQJZcZ9X1o6r1UaV9p+NBadDXVohCC7yrLA4DtJfIC3pAmJMy484C0V
 l9TF5ajvMVHY2xHzqI0RojkH2UncKX5m1KFclUOYg072M3Xa2/RmwR4Lv
 kfQCV1fVqzJPzDdZCPVFQFsMmMmFTQlKT0W7h6gVwSqqrFduGyKuIiu0l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="402443781"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="402443781"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 11:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012384334"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="1012384334"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 11:12:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:12:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:12:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 11:12:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 11:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PY9mdjPbQLRIJ8t34u6sk6KHcZMb8teLAtbBmSUJU9+iS/qlyhKhudPFx6MQbxF84nB+2hYmtSYOPJNO7xvKmwktjI1hf4iugSx7hA0oZOHglK2BCvq58waCG8vFd6rc2k7z3I8gdOOJ+fUnf+mCqd/9ti+9GDDf6WjsZo9h0i7EZb83mn+TwYKFTtVPngLIIkLsKHXnMyDJXtK5tL3a2ZwgRWaX4OGCFymuJh6fhh2pkMFSMm3RxIE0qdpkJHzG7ixOzm1Jp3IAGhF8WLjppGvdUwnz3Trlv1/Bhrjrt2zf8ZoBwpCF9gT21htyFtpS8O/IFKzshuF/+jLfBQoTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCu9ZUyHZs5etJA+6fvSh+iX6aL7y1dexNtaL8EAxS0=;
 b=URve32quo40wMf/pQCvziVaNcNoF1rtohft6+ah2y0KQDgIipmm2c+mL8oqPlwRvR74q8GlrMmoYd+gNM85r+Wq41s6qtEyKf1rGJ6lMV1DPWSh1aXVyiwRQMh80Xh55IQgpOrWgrcmOHuYZ9svSJw68PQXeABYVNcVt0iSdM3DadCv3SLfXJo69syo23X+JFFRw11M15Ptmh+qZPuafV8SdOofJQN9JduujdkJHl76SFgF++Str9yo3OR+TUMHfaX/u8cWvTuqZxhi4ns7dDCZWaqSg9Id6i6e1Re2rDc6guu3D+GXraTAyQs8XdUPkpQQHHR0wNH0SKFrXuPboGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.23; Fri, 24 Mar 2023 18:12:01 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 18:12:01 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
Thread-Index: AQHZXe8+G7txZcHulEafSM+XRoM2ga8JXTKAgAAjQgCAAIxPMIAADOcAgAAgTJA=
Date: Fri, 24 Mar 2023 18:12:00 +0000
Message-ID: <CY8PR11MB6940EB1DADE0C4E4583D62E8C3849@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
 <20230324045311.h32fyw7mh6o6eyic@ldmartin-desk2.lan>
 <ZB1KSkvCngrSs3bR@DUT025-TGLU.fm.intel.com>
 <CY8PR11MB69406B340F0DD44161F3B691C3849@CY8PR11MB6940.namprd11.prod.outlook.com>
 <ZB3K0PjzD1LWD7u0@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZB3K0PjzD1LWD7u0@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|DM4PR11MB6432:EE_
x-ms-office365-filtering-correlation-id: c379bdb6-e3a8-4b8a-d96b-08db2c934394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T/WzffIuiEzn7WlJaaVeKmytY2d7hDIp+/Pjpwh+IRYKqTlZm8RjIse/lru+l7b2drSt8yWskyZb38wQv/nau4Mnb0Wzuwj6jougkdtibV7yy8yqVPI7+uasNoA6kZrNcnPUDXUWGYAjjfXgfRENHHFByixD0HiRdnbf7JelXSGaDlCXsdKJgJGa6sXrB20TmUgd3EVrwMxfpdZXQ1N6XfJzzFt4waRhqaLPxJ1XgIDIghZiXfnyoByGT/j/KOJFezK7fnfe2YxckTBRNNcdVAo/pZQxWCkATwTgTPlEL40pRyIsIhRlHnfd9b3RmiObNs6Dt9KUHOun+y4ChTZgYl7g142oC5mSGh8OA0J2p3KKp7lQNn5GQ6gVIK99Q66/SaqgpsDTxaHI9N2E2wyXH9mcARBg+xUHKO5wEwM45uL04EDu8fAwf+P1ETOlySb+fXXmk7QBfNv53CGrRKwkRNKW2TDBhw/MW1qYjySMxwP1rhoAmsP0SVhMYxUdk/6feM/O1VRt3Lx84qcU8apJqp4kP91gAc0qz0fJS+qgirayeFiFL7NcD0ApCpZqSPkw2va2hJSJ+rVlnMGCt2C9jL4V79IxJDROKHXXOM/boyrjMTDetQbUtSvju9cQJI1wNEZtng2CcjwfqW9RqAbdlf9y1qmdIDNmfAlyaMAlItvnuf9oYSDI0BdBxlcYUfAQe6yBvvmnJF4AFdGeZqgjgostJtePhAWDvCXiKEo9L8c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(66899021)(26005)(83380400001)(55016003)(6862004)(66446008)(66946007)(186003)(38070700005)(38100700002)(478600001)(9686003)(7696005)(71200400001)(6506007)(66476007)(54906003)(5660300002)(41300700001)(8936002)(86362001)(4326008)(64756008)(53546011)(76116006)(316002)(66556008)(2906002)(122000001)(82960400001)(6636002)(8676002)(33656002)(52536014)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ZRrC2u6QcPhPtByz0cYcOJWIvj4RvbHl4IyUi/dcUEB+p9G/mb+w/8eMf19?=
 =?us-ascii?Q?jvMzZU9BEd5IRrI+qY7hOlymJgL05+NHztTB38lw1DNaE0U96gpWrbwsf3zO?=
 =?us-ascii?Q?kmm/hcTiapvjuTT9vCvMM6dF5Tcw8GsvNzO+R9HqN8qR+559pMKY7FmeDKfZ?=
 =?us-ascii?Q?W7dJNUmTEFPbt5KKOhkH4+1Z4IzWOMXF0XhYZPquKrh8x2wECCt1YRgTxOle?=
 =?us-ascii?Q?054zAGDca2fvFJsvs+oYpmNWjPZyQGh9IrtgH8BvaT3tHL/lwnYSuwXRXws+?=
 =?us-ascii?Q?DeAb46XLMfJichvae04IfvZH8sESlhpAQFQli7rkLGk1szUSfQWyJBuBnroK?=
 =?us-ascii?Q?qh028CPyI29DNKh+rwwSr4PSwjmPqf0sVvKeSWcscjYkrdFRd4IoF53X0rbw?=
 =?us-ascii?Q?J67kGQ53/zx/kSq3oN1sfY1JChmBaqNzjAvbWrraJ2Hq24plq7QBEq4fjZGW?=
 =?us-ascii?Q?rt5CAqLvAQvIkveoNg7a6cDcCKef5ULF3p1WWd2pGC2n1cHY2fyBp0i8qW9w?=
 =?us-ascii?Q?s0rsnl/nU5sA7kci3QUajNALKDXqeeoxYPYnPk1kVx5KTfC5tDlKy8jw5ABt?=
 =?us-ascii?Q?d9+jreNnq4eNpwiyFkjjtUslkbQO2BpR2QRmZf+6fSKOiTU7AGqupOcp9Jn7?=
 =?us-ascii?Q?Y/JwwwBQsndMZ1exSgdTQ5aetjq+gV147HQA1XQFWReznYTq4qVQDeXGtoQ1?=
 =?us-ascii?Q?Q8CABQhJE+BJdZac/HhHxesd466V5KWEQLbjAOGbZqnzH6S/GG9d/5ONe1Fm?=
 =?us-ascii?Q?B4VLPugNXC8bmNu7IKquqdQnEqeAROS5u3IEr22s5HFwzm7IkjwTOPFRi9K6?=
 =?us-ascii?Q?L4zRHXBOQ6Mld3QS4PrPLCY59nZRlUXjgDTZWhU+DRB5A0QLFLv62O4vyuBX?=
 =?us-ascii?Q?omk4KdxWiK0jW1U10qyU8pc/wNm2gXnh5WKR2zilEGYH41Nq3yO31+KRvehR?=
 =?us-ascii?Q?JcE1Qx5sCqhfu6DkTq0MeDMHT1AJjXd91K6Hk6wDXzDBSwb9IuJTorn492YI?=
 =?us-ascii?Q?odCexsBQMZzot4ylaAVIH3Cs59x39CThFi3r2+m9JkfnHHCE15yvBRIEpEGP?=
 =?us-ascii?Q?Kenc9gnR7cY6IYCr5QKl447SCn31d+QhhusIZ+zS2q2X/JkCiDgm2I//MDff?=
 =?us-ascii?Q?Hd+7vITqQClEpIHvjcFHjQNOzZvns0citr+A1t9ky7AW5D06gX5uQC2zp6rZ?=
 =?us-ascii?Q?f0RTwtmAobFyU61cbC328FJVJgZUsNZI7kv1kvzykClbBG1Dxg/mMfF4v+hv?=
 =?us-ascii?Q?1LHh5t1bUWeXFDZWqX7PSnyV1gbtn9Zy3d1KRT9ktia9MOMuB85vd1sruKX+?=
 =?us-ascii?Q?cHHeTFgw7RZ7E4LzvoCgamq5KUMSJXcEwSafofpnx3Q764cbq09AdHKZyL6x?=
 =?us-ascii?Q?L2lv7Zj90q2gg7YgHZpiHgwJc9h6UM1YZkf9WpanRv/T7FNLGolJD87yOqf5?=
 =?us-ascii?Q?TXOon7FdHq8KtAFReFf+atA2fArLFZroWS8jbczq+sEQ+sXlmvF+WE1l8xJl?=
 =?us-ascii?Q?v2dvsvDYWhySpmKcG/Rw8nmvbJhzgMOwwRHy08NhSHFkTsFjPWt1rvh9stiS?=
 =?us-ascii?Q?v/P1ap8fbbEGyb/4AC5B+AH15a9HOj5HgYMpSDwr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c379bdb6-e3a8-4b8a-d96b-08db2c934394
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 18:12:00.8546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KeEg8RxAicHe/5+0IBQTCKhgqCeDtuXAYXp7q7qguN3LUNHHTNeoS/glBH6XyfneQwF3gFL2Wf0YvhGY0ZGj6WB1TcY1YRuXWmrgn8exN0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, March 24, 2023 9:08 AM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine f=
or
> migrate engine on PVC
>=20
> On Fri, Mar 24, 2023 at 09:29:10AM -0600, Chang, Yu bruce wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, March 23, 2023 11:59 PM
> > > To: De Marchi, Lucas <lucas.demarchi@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Chang, Yu bruce
> > > <yu.bruce.chang@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy
> > > engine for migrate engine on PVC
> > >
> > > On Thu, Mar 23, 2023 at 09:53:11PM -0700, Lucas De Marchi wrote:
> > > > On Thu, Mar 23, 2023 at 06:23:29PM -0700, Matthew Brost wrote:
> > > > > Some copy hardware engine instances are faster than others on
> > > > > PVC, use a virtual engine of these plus the reserved instance
> > > > > for the migrate engine on PVC. The idea being if a fast instance
> > > > > is available it will be used and the throughput of kernel
> > > > > copies, clears, and pagefault servicing will be higher.
> > > >
> > > > how faster and/or why?  If it was related to being link copy
> > > > engine vs main copy engine it was very understandable as the
> > > > commands available are different and optimized for certain usages.
> > > > However below you are setting to the odd link copy engines + the
> > > > main copy engine
> > > > + whatever was reserved for USM.
> > > >
> > > > Without a proper reason here or numbers or spec, it's hard to
> > > > judge where this is coming from and understand in future.
> > > >
> > >
> > > Your right, probably need to get a spec reference or something to jus=
tify
> this.
> > > I came up with this bit mask from IM conversation with Bruce, maybe
> > > he can point me to the spec. Also I looked at the i915 code for this
> > > and it is just BCS0
> > > | reserved BCS so definitely need to dig into what is the ideal mask.
> > >
> > Please find the detailed information from the i915 patch below:
> >
> > INTEL_DII: drm/i915/pvc: Force even num engines to use 64B
> >
> >     On PVC observed gt_fatal_7 as arbiter is out of credits while
> >     running Molten Concurrency stress+ 2 HPLs + ProcHot + Warm Idle
> >     + Solar DVFS + ASPM + Link Width Change.
> >
> >     Its root caused to HW bug and SW workaround proposed to use
> >     all even instance engines to do 64B transfer while using
> >     system memory.
> >
> >     So this change implements below scenario :
> >     ------------------------------------------------------------
> >     L7  |  L6  |  L5  |  L4  |  L3  |  L2  |  L1  |  L0  |  Main
> >
> >     8      7      6      5      4      3      2      1
> >
> >     64B    256B   64B    256B   64B    256B   64B    256B   64B
> >     -------------------------------------------------------------
> >
> > Bug-id: 16017236439
> >
> > The 64B will limit the transfer BW. The main copy engine has several
> > backend, So it may not be impacted much, but other link copy engine
> > such as the reserved
> > bcs8 will slow down to possible ~20% for host transfer.
> >
>=20
> Hmm, we don't have this WA, indirect BB, WA pages in Xe? I have no idea
> what this is for but for the moment this patch isn't needed. If we pull i=
n this
> WA, then I see why we need this.
>=20
> Matt
>=20

PVC will need this WA, as long as there is concurrent read and write from s=
mem
for bcs.

-Bruce

> > -Bruce
> > > >
> > > > >
> > > > > v2: Include local change of correct mask for fast instances
> > > > >
> > > > > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > > drivers/gpu/drm/xe/xe_engine.h    |  2 ++
> > > > > drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
> > > > > drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> > > > > 3 files changed, 26 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_engine.h
> > > > > b/drivers/gpu/drm/xe/xe_engine.h index
> > > > > 1cf7f23c4afd..0a9c35ea3d34
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_engine.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > > > > @@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
> > > > >
> > > > > struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
> > > > >
> > > > > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
> > > > > +
> > > > > static inline struct xe_engine *xe_engine_get(struct xe_engine
> > > > > *engine) {
> > > > > 	kref_get(&engine->refcount);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > index 63a4efd5edcc..d2b43b189b14 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > @@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct
> > > xe_hw_engine *hwe)
> > > > > 	return xe->info.supports_usm && hwe->class =3D=3D
> > > XE_ENGINE_CLASS_COPY &&
> > > > > 		hwe->instance =3D=3D gt->usm.reserved_bcs_instance; }
> > > > > +
> > > > > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
> > > >
> > > > this deserves its kernel-doc, probably with similar info asked for
> > > > in the commit message.
> > > >
> > >
> > > I thought I added kernel DoC but apartently forgot. Will fix in next =
rev.
> > >
> > > Matt
> > >
> > > > Lucas De Marchi
> > > >
> > > > > +{
> > > > > +	struct xe_device *xe =3D gt_to_xe(gt);
> > > > > +	struct xe_hw_engine *hwe;
> > > > > +	const u32 fast_physical_mask =3D 0xab;	/* 0, 1, 3, 5, 7 */
> > > > > +	u32 fast_logical_mask =3D 0;
> > > > > +	enum xe_hw_engine_id id;
> > > > > +
> > > > > +	/* XXX: We only support this function on PVC for now */
> > > > > +	XE_BUG_ON(!(xe->info.platform =3D=3D XE_PVC));
> > > > > +
> > > > > +	for_each_hw_engine(hwe, gt, id) {
> > > > > +		if ((fast_physical_mask | gt-
> >usm.reserved_bcs_instance) &
> > > > > +		    BIT(hwe->instance))
> > > > > +			fast_logical_mask |=3D hwe->logical_instance;
> > > > > +	}
> > > > > +
> > > > > +	return fast_logical_mask;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > b/drivers/gpu/drm/xe/xe_migrate.c index
> > > > > 11c8af9c6c92..4a7fec5d619d
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > @@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct
> > > xe_gt *gt)
> > > > >
> > > XE_ENGINE_CLASS_COPY,
> > > > > 							   gt-
> > > >usm.reserved_bcs_instance,
> > > > > 							   false);
> > > > > -		if (!hwe)
> > > > > +		u32 logical_mask =3D
> > > xe_hw_engine_fast_copy_logical_mask(gt);
> > > > > +
> > > > > +		if (!hwe || !logical_mask)
> > > > > 			return ERR_PTR(-EINVAL);
> > > > >
> > > > > -		m->eng =3D xe_engine_create(xe, vm,
> > > > > -					  BIT(hwe->logical_instance),
> 1,
> > > > > +		m->eng =3D xe_engine_create(xe, vm, logical_mask, 1,
> > > > > 					  hwe, ENGINE_FLAG_KERNEL);
> > > > > 	} else {
> > > > > 		m->eng =3D xe_engine_create_class(xe, gt, vm,
> > > > > --
> > > > > 2.34.1
> > > > >
