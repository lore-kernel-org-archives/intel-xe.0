Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E393C07E97
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72510E0E6;
	Tue,  5 Dec 2023 15:21:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3434E10E0E6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701789698; x=1733325698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TpTV1+GSl5mXWYwnJYpoViPPba2JGdgOT1ClyYyomyU=;
 b=J0RgWauJ+TFzfmzS84O2GBVwuCnUOYIz1+Xfqs+ClfNVIdMBh6/Fw7TP
 /Er9RX4a9c1MLvI8Sr9EVpfnHNwQ650vfzmJ1ir52av2TCJ0wmx6iEpw6
 3rWEIWCCwtnH2p5n8jQR/FpU+drVq1OZpHTHUPVQipxPu2zZM+YnU1LlI
 RLHBpp8NAm/6t/og1sARQdqI3j/febZZbNLSwqg+D2T6QWlYpJPxMaKqV
 XJrw1IO5U61/+0udOL1XH1syxrHfitxiKgF9I8LwcJeFRAStN/Zs1TE/x
 qwrbOjX3LLqz2PnBddIxi46hWOg+PYNOTj+YB1Iaj51xjBCz38iien0Pc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378933280"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="378933280"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894414734"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="894414734"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 07:21:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:21:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:21:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 07:21:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 07:21:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+qxQwVWSbZadkw5217R2s0jSvtP6z+ZTBIA/UiEMC/k/LESolaq1waTN2/RsrOu1jnNsftpeQepot0M4LgQT3b4KQGwR23Z5gP9PFFtfHez70E/yfhWYezlwWqk2RW1abCJ0CH+gAuaxt7kEGb0nVXV8hDNCwi42djm2EwW1/ZA6raRrsyr4RNJ+U5Sd5kCrkJkBdSfnUp3SfbmUbaxvuVWXrDqIWjpypVqPB/a8bN2MwaGKy3sZilA3SSGOkb6Npjvkke7Ued96fXPf2V3EON5/AgPJ6p1lu9OwYnoPmA9QsbgAnPjXPFIL0QJjN04cx2aJ+qlAbbRnYd1fzNAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFUOhbgrfP313OH3396gVZ0O3LDbNlIxcM9kukDUrJ4=;
 b=R2+CV2fflSFyb0aqn0gf9lZ8hp2r/VtvqgmcEmZ8VNoUHxgJKNOCAy05HyhC+ijRW/zIVrOVEmKCL4tugmWD4VLDiuLNQWqMWjgUAdv8Cl4RdGPkx4niQn4Aso7qlOrprgpLvCjFv3SgOXvqHDOIXRy0mWVSXCB/7VtI0E74DgApYZ33In8Z3iRTbAHEd4uQ8nQKHIfMgQ80sQt4+CdgV4YD5NrCpGqNZUF2To2+cKRhkNbGuBb4M9rkLLL+YKWBCxpr7GRKmOcACWttJTo4yCgZ7tz4wqMeP5grlQs1TMf2Ly5VmKf37hXDDNLzD33sNES5CVh3cw6/EyIlZyVoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 15:21:35 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 15:21:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
Thread-Index: AQHaJqYS0B4aSHqDi0CzbuawfzvDqrCZdWuAgAFCOSCAAA5qgIAACfVw
Date: Tue, 5 Dec 2023 15:21:35 +0000
Message-ID: <DS7PR11MB6197270658CB13C3AE5E0F808185A@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20231204114525.791141-1-tejas.upadhyay@intel.com>
 <w4zznqo5xdko2gpx7sfhcmkncxgmqk5ewtopzpof6z6vvry3je@pla64iszsa3p>
 <DS7PR11MB619749FCAA441D9E8430493C8185A@DS7PR11MB6197.namprd11.prod.outlook.com>
 <khxyqt6grryjkho7mjdugw5l65523ptf5pdkmw2xiwif3kleqt@vwd6ku53krko>
In-Reply-To: <khxyqt6grryjkho7mjdugw5l65523ptf5pdkmw2xiwif3kleqt@vwd6ku53krko>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SA1PR11MB7014:EE_
x-ms-office365-filtering-correlation-id: 6d445b67-73da-484a-635f-08dbf5a5de75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oomQWpt2o+1o+skYA1oo8LFGxSjTQJpN2yKCapzYaQCyQf6VyKk6pZlrGMmXpT5ZKBr86grwDR74MUmoT+2YLpQILh+wxSKq29UHZ4A9uP83GUH33juyG+iCnxIXlkoVehObnSdwXb2VW2dCals5DUM7CBE4lFFryebJLGbFcyWxc6TSvWrNA/fE9a2Jmd9GtjYOqecMRysFd+7cxezTER1AbulpwW+iACS9NxAATUUitayJWUIon7w+onppWwy7AaXBlESI2dDp9GN8qvly8iKYWHEvhHtwitzRU7QhQ1hsUpQ5NvNKIxJGGy3D7hyUt+AyhoMhB9lEoLJDHc7AMVa5zkcGf2euU6ipvLNjtEfU8djCd64f9mgVnIhHpYl7DSVPvooif9SHq015W1Kc6mDpdEQLsVq5tey42wUjZgbgn+19bgQVDQ+fqdVHb9lI9WqbHDgM7dBZwj3zcH2MIMVfN5yM20bUDBWB2HAEaKdxR1NRR2LWMfglKYHsyPk7E/WWwdYxYkDXGGRWp8FC5kBH0GDcCUtgIqVdluDDFYddvzoA/Mp9bWJIsABe0A7BXuAAkAju58bFya+AliAeaxIxV2isbSD+bRj/4ueCgvEQEMYjLi/ARAQgC7u4ql8n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66476007)(6636002)(66946007)(316002)(66446008)(66556008)(76116006)(64756008)(478600001)(71200400001)(5660300002)(41300700001)(38070700009)(33656002)(2906002)(86362001)(8676002)(52536014)(4326008)(6862004)(8936002)(38100700002)(83380400001)(82960400001)(55016003)(122000001)(53546011)(6506007)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zmnnGkBlufD9vE45oNcgiOJYdCfCi1mwPPVDDkm5tgViPMepQS8MZgrMKhAg?=
 =?us-ascii?Q?2abvvhZvmvkFuVQ6hcoiZgKi7UbDcU+v99WXxQLiFl7g3cz8sRMOnFgcRTW1?=
 =?us-ascii?Q?DsjwdhSUvts46M32/IJN7fuqxZsrdhQHRgjWN3Jc4fHKGKT4RajW+4Tk/+EX?=
 =?us-ascii?Q?Zc9NkKXTzXEkRHLyxwB+g+sEFT26mUATBtp1pgupEikwIM+15wod9VOYf8yz?=
 =?us-ascii?Q?UtKf99oqL8zcIZon9rjP9cphSLIWg4jpPfyD1aXrdDWWJxFSeR9CAc4h91KY?=
 =?us-ascii?Q?a8NFwrjwXTuZOyACjKa1QheT82/6arGr9+gQKikev9vm8b+Z+a4NoGjugQ8M?=
 =?us-ascii?Q?VtTOrVg2Urcx06pIFdbBcc/0++/bgjjbw1kCTQeSQBjUIOsF8fxxGfUQ/szM?=
 =?us-ascii?Q?iDjPMtJXbjTOrDQTMpIApZD8ENEOoO9MQwXIHmDH7ylwLq9x4izjJ8llUbTm?=
 =?us-ascii?Q?GATgM9rseGypg8Wss0lCAtTanqsAQwOyzcfiV1803oihIUJheyhyyPBpIn2H?=
 =?us-ascii?Q?cO22isbCAOmlEtOLgiVHKFfwq5msPIKJSsFTCFXgPaH4ZH20lkSN4izi3m0e?=
 =?us-ascii?Q?oqMWvBeZgiahKZrL5ob/0EcsCo/XEogf8U4cJVS93jbt0L5Fe1Tb0ZUPPVQQ?=
 =?us-ascii?Q?HlhRUEqy6+GFtYjK3arNB1CgJ9zzrU/COIiYgPRKKq+Lf8wMV5mUgR7nu/1h?=
 =?us-ascii?Q?yWh6hdwkgdOdj6Ksj0jh/dzb8I2WAmEfyEQ6JkVkOGcHSlBra7P0KR6uXDM8?=
 =?us-ascii?Q?jnm679oXH1zw1ZUFAXPVtS+V/A48SLmO/gGhQrXxOxBb6t3/hzKUrz9E1L22?=
 =?us-ascii?Q?lyDDe0myBZ9plhVZB8loWyqCVxIPcqTp8T2ZniiJtKD7u0usz+VVmOyrXbEo?=
 =?us-ascii?Q?t6dejh0Az39ykPZanqLHnK0NoHUAOBfd2f6tDh6EXLMGKKILlDUkIfgHCVdZ?=
 =?us-ascii?Q?4Sk24lZ3K+cfMwKUXXU6r0IzIKrRh5yjg/ctwnJp7CWv8cGmf38672eZUJ+g?=
 =?us-ascii?Q?bkFcnOXmHT583vWl+XYZcEjZ8gopo/dhx6ITTs+tsy5bOO91T3mPuS6mhOBm?=
 =?us-ascii?Q?aVA5VmNy8eMH7irpD5zeXey2jGK1jCVmloAMvKZkWuW2uLSA4UZ4/nw5pQqy?=
 =?us-ascii?Q?gYwvgGcdC5dkl/+5hxBgHQw/0z2JmWTlZtXcuSofPv4foPSspJ2lQ19Ys30N?=
 =?us-ascii?Q?x7cIv0a37pX72eNgbAiGTFrYTHTs18NzFR6dTeBmQfLPhsftLWywYK4cwwVz?=
 =?us-ascii?Q?RiHfMVM4LB0ra+5JJhkKNVo78IyoVkRAgRHh+Ozedw3XzOeuPcYgY2hI3+31?=
 =?us-ascii?Q?w1k/4R5x4lwuvXLGesJfYxgz5KEh/aE5r2SXq00l8GtK7L5+nEoZA/pFzNkh?=
 =?us-ascii?Q?GeIdNJQE7UB/oRMEsK2tK58GPzjRZxrCprCB8FrAOj4jN3TM7mv7XR3jljQ2?=
 =?us-ascii?Q?ffr79ms9VomEsX4KD8Z3d2g7SYStsuMkPVlmsQ0Ar/vonTugHhQHQpTOuLoh?=
 =?us-ascii?Q?7n45ExQSLYVLyNA8UGGTfWb8ASNgwCyTlZ97Fc6mXRb4j/pnRZvL0wHB0arM?=
 =?us-ascii?Q?+/OfnjJiingv+VuwaKLPrIkET3KOKQeZkuOOrRe/3cudz5966ofYshtmsJRi?=
 =?us-ascii?Q?IRwqs4UixrhGRRQKzAJqRH3RwJyNooxjPRyh7TBqpvUP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d445b67-73da-484a-635f-08dbf5a5de75
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 15:21:35.3301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPvtGf1ZxyI/NtZxW2kvkG9y/0Q14cXi79DjL1Q1P6tRkzJNB2dBgycBB9izeDoRI1GcwHrcMkkGm5sCwlc9NbzSW0vPW90I0kcMJbFxBQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, December 5, 2023 8:15 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
>=20
> On Tue, Dec 05, 2023 at 02:10:28PM +0000, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Sent: Tuesday, December 5, 2023 12:11 AM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org
> >> Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
> >>
> >> On Mon, Dec 04, 2023 at 05:15:25PM +0530, Tejas Upadhyay wrote:
> >> >As per bspec RING interrupt mask register will have lower 16 bit
> >> >masked by upper 16 bit.
> >> >
> >> >Bspec 60352
> >>
> >> am I reading the wrong spec? 60352 doesn't say this register has
> >> masked access, i.e. in order to write any of the 0-15 bits we also
> >> need to set the upper bits.
> >>
> >> Compare that to e.g. 60279 where we do have a masked register
> >> BCS_SWCTRL.
> >>
> >> In this register it seems the upper bits are just another field to be
> >> set rather than considering this a masked register.
> >
> >"If an interrupt is unmasked. On occurrence of an interrupt and if the
> interrupt is enabled, will result in generating an interrupt message to t=
he
> host."
> >By above sentence I could understand that this mask for all interrupt bi=
ts
> mentioned in lower bits.
>=20
> it's an overloaded meaning of "mask". A "masked register" in bspec (and t=
he
> option you are trying to set in xe) has a very specific
> meaning: The upper bits select the corresponding bits in the lower part t=
hat
> will be set when you write to the register.
>=20
> For those register if you try to write 0x00000001, it won't have any effe=
ct as
> the hardware will ignore it. You have to write 0x00010001 for the write t=
o go
> through. This allows writes to different fields in the register to simply=
 not care
> what the other bits are, avoiding a rmw cycle.
>=20
> Those registers in bspec are marked as "Access: masked" below the symbol
> name, besides the bitfield documentation.
>=20
> In this register here, the mask doesn't have that meaning. It's a normal
> "interrupt masking/unmasking" field.

Ok got it, access relation. Thanks for the information.

Tejas
>=20
> Lucas De Marchi
>=20
> >
> >Thanks,
> >Tejas
> >
> >>
> >>
> >> Lucas De Marchi
> >>
> >>
> >> >
> >> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> >---
> >> > drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
> >> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> >diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >> >b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >> >index 444ff9b83bb1..d9013c698710 100644
> >> >--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >> >+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >> >@@ -39,7 +39,7 @@
> >> > #define RING_MI_MODE(base)			XE_REG((base) +
> >> 0x9c)
> >> > #define RING_NOPID(base)			XE_REG((base) +
> 0x94)
> >> >
> >> >-#define RING_IMR(base)				XE_REG((base) +
> >> 0xa8)
> >> >+#define RING_IMR(base)				XE_REG((base) + 0xa8,
> >> XE_REG_OPTION_MASKED)
> >> > #define   RING_MAX_NONPRIV_SLOTS  12
> >> >
> >> > #define RING_EIR(base)				XE_REG((base) +
> >> 0xb0)
> >> >--
> >> >2.25.1
> >> >
