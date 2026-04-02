Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D088DCC6B33
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 09:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E71310F121;
	Thu,  2 Apr 2026 09:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHsaCsT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0857A10F121
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775121012; x=1806657012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5kOqh80kZLrtes6BFn+qWBvlypyrEQ4y3kdDTVsXz80=;
 b=OHsaCsT17H0mjHbXUyqe12akSKN9m8iilgPmvQQ9xzvkm4mhmW+6GfFA
 ck3ZX15YWKZffGS7FWjiu6VYRP8CdWvy+cdXHgcSHx4r0wSw+dfA8CvQS
 SdPPfYPTb/prWdI6ZNQi2Z0jnjPrVCutUoVFNZQ/1PNv0+J6zECuWsIkH
 hHZRbKC26QZDwuXPQ/diRylIA+8Tq4tTMvUBhh10NFr/V1qYae48xHeVz
 aGEaU0XnlpA+7SfnhebEt3IFBkpQxKdJ3lQUEjRDjr7Ap/NpS9b8Zdwly
 COBL7Hm7lvQ4GSWR0h2gcINjWn2X8TDvbJcw5g1L0WQl4y2HjAPxNT6nJ w==;
X-CSE-ConnectionGUID: qmoPyxv3RZ+UKCaoef006Q==
X-CSE-MsgGUID: kCtj1FzbRfqNSRcUZ45t0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76063904"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76063904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:10:12 -0700
X-CSE-ConnectionGUID: Defs9yLwSwWnaTE//nPLyA==
X-CSE-MsgGUID: FOcvPDivQMCBB8pfoo6+Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="225918672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:10:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 02:10:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 02:10:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 02:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVZaQ/en+eq9409JbDG96SZTiYJjWvdxC/vctpBO0uDZ9jkz7YmY+jfd7A7rghZ2cmrwygJTauxp4ZF8uj5YXTVvdLtlr+rDbGzvd7BkXwyNXVa9OEoxXiWR1qpLjdIfl1/xBi34mx/gcukaZLhcg+PCNgONIZV7/1vH6mP8vSB5wf2HrinDeqDr6bGbPXLZCU93kvfpfvagHBxVHyuT16FLZuutkYSVUAlqumQboRtwtkja3dXbTYDHrHHhNKYxEMTp8JgkxQgwwYsPgnZGRgWCJJU9WgMQJkadnvOuPAnYTPte5AQKzruWBIMv6zaTnLTjkxHdFw9KNc0jKeFpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ut1U9quQFtnUgyopDRBAs9HT0fBlmK0Q3fUgjCiick8=;
 b=T26ddO6kt1Ln6g1wj+Ds76lTVoieEJQZ6v4bi4Cx/uKWhBZo+L+RpzkfG0mYj9ykgtfHy91jy1MATqk35e98HcHduXiZq4NjLhUmiEHr/b886Mboguj9gUs9eYG+C2mxWYpfEDZysvi6xlDgD90knvctPtHU6iTvKfduz04HqVPDyRICQw5ewennMFBByv+BsbBAW52ZbJlqgO/gTAvlQE1ey6CYmyJBo0J/+oZbZrPgS+k5m0w9ffLaUBfNP4qOJHfQNal8ru1v+pPKWZQ13xtW4fN3OgbG/rYoywkm1xy8BkDRlsSJBbsxraDTTqSjBNQXNEP2zJ4S/xmqnvXRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 09:10:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 09:10:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Thread-Topic: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Thread-Index: AQHcvd+9jochD0AeNEGHbOaTAZjuPrXK6qGAgACaK5A=
Date: Thu, 2 Apr 2026 09:10:02 +0000
Message-ID: <SJ1PR11MB6204361A01C00EABBEB1986D8151A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-10-tejas.upadhyay@intel.com>
 <ac2wu2u5wNhkmzx9@gsse-cloud1.jf.intel.com>
In-Reply-To: <ac2wu2u5wNhkmzx9@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB7397:EE_
x-ms-office365-filtering-correlation-id: 0cc2a0a1-8f8c-4042-1d64-08de90979fd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: Kx8/cnyc+jQKESVwr3vJy3Z3/a41qDJRQpayQfrc+3X2D/hOKRBNjvMk25a5nvVGboxzeI28Km7toR2Ho4SExtg6q5qr4rVihKtVQS+KlhmWBJ9H2XdotGWCDzXWvxLZTzU88jQHLmgbQGDHlQFSXAkkyU2xoIXBMM4MJWYN0/A7kxspwoSjkkdC8NRIL/Q3UMe9omyFjnqLvtOK5Mn3jsDiW/A5+kwZFqjQ+oFT323RZWoeZ3j0+bKsNj8HWkm6yNLQng095EaRPtBtQXsIYk55ap46Su1ZuzpWOo060eIB0RUXNU5JcQE7QyDyAfo2DgEsBu8/Qv3c19ukp8FhRT/q7Fw+VVAbZ4S4Dv8N4Y2RpOCYWO8kWhjVc/R39FPI+f+d9IjFd19jSwYoqz/pCMFvf+EmCw0G0+77JBhwc//ZqVVuQakcVgRgaVUXM/MM+y4h6doCqK0Oik9ej6UowBcHfoycd0HnlR8IgJN+2Ei6ymmUgnq9XqpYylineYQu0J4cW5DbQsbq/IZN5oUiJT78Am7by7vXFJulgU3dA7YRujh3tMCP3wNmx5Ajo+xkrddhIXr2kdJFMHRUB2t6anvkbbwfDnBV6uv3jMGdpXraeid7lXv7UPq6xghhGgBvXyqthgzCRM++TKXXlHc2IvgfW3SKwYxZEpEDArWVfw+vxNvSfTrESiU6zMIS/VQPLjpdEWJap+EgxkBjPFbbU56RkpoGQq0NLmhI4EATyB4nQZMKS2BvYHmacuZmDEirbDXbiNIrJgcEhvMiG0yqkOdbsOLNJekVdV3gEGqKdwU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?38m0AxqB+7xl0efYZ1TDq9j2Tdr8AGvbPtGAznH6EC4QIBIc5BmGT27llWGn?=
 =?us-ascii?Q?4RgMp1p37U/4x97PtxnhJnm+DHxDZBg8AyWEGb5xs7sq5g81OT9INgim8US2?=
 =?us-ascii?Q?of4OHghLjIcWYSR7XXwrnHYYa/RT0forhduvPiRhUybUQaVGc0LCITxHbjxs?=
 =?us-ascii?Q?UiBicXX2s8D7dlTZNv3VEK51wCjw0zIHvrhsWES0JsjKn0BMJ1wILqIQ5in5?=
 =?us-ascii?Q?2vfyjWGRG30jJzFl3uaxnb252jW1kpmEdYhufX09E0HVuDmvG3hjHI97eWFJ?=
 =?us-ascii?Q?C+R5oXxEfkBg37/uA1imRhtumkF0f7EuzQI6ukH98RQMajLQdxur+T8HDN3v?=
 =?us-ascii?Q?rOc8PFQ0x1WwQDYioA5SGWKzgesDIcWjprMbGWiri9ZIzNRuW9n9E4djD1pi?=
 =?us-ascii?Q?d4/WA9OI7AUaWBuxrSrT/Ar5CZ4k95Zc1UbnOzQiY0cjFo8ZSyBzGLKd0yjm?=
 =?us-ascii?Q?BSxqxpAT40+uIBHYeVolf26P/dPlsZaFlQKykU5PsMboCjwTreSjbqA5TspD?=
 =?us-ascii?Q?yxFMmD9STeMlca90DcclfeLnfbRKhbf5n/XUx0PhPptrviH+PVDBiYxSNcFz?=
 =?us-ascii?Q?O22BSad6l9Dusqo7C1G1B+x7SwDhLvg4aQCcpDnzn35c9NJRXzpQJxc9e+BC?=
 =?us-ascii?Q?i2Z2PseNk/nepho2iR2L8wb/Mxjt8op11ZnZGnYe/RkrZr0RGq77eUtpKi06?=
 =?us-ascii?Q?zmnOOElA1ARNjI1HNUryjWG+lldjYv4YMdUi/QoQOdGSk9NFIdhw0TfFk7BY?=
 =?us-ascii?Q?Dc0OGV3UyC8d1ev8UxKOJSJHpmujY4ihBIQLQis6tG2PWXnA3DzrIYtDm/Wi?=
 =?us-ascii?Q?KimUHArxqN8RwGCcThqvc6o0CZvyhHthS6jWP6M6qoKQb3JUqeVoLOYyn/qp?=
 =?us-ascii?Q?dbGVtJAcB1xIW4lVsrsL2l5UZf0bcyPs+YrnN1Z+pZdg0EtoRp54UgmztCA4?=
 =?us-ascii?Q?5B/IxOHwdiFueMpXzo0MZ53yU+kKgci+ISNoBj59S6I6c8gAAm66k5SFVMtR?=
 =?us-ascii?Q?vDoJl4LvIEDgET5DgaImLzTjDgBJnRAoB/LjkVKAsKElYt15I/5VcvP4L3KS?=
 =?us-ascii?Q?5hQ/eNK3zr+FRAGR7JCibDQ39bMbKAUV735+uHSPJipYp/J6S8D5pDoC2ZrZ?=
 =?us-ascii?Q?3hqLcPnQiXvAxWoy95uAhOrUuqM76cEid/liOU0rsbBguH/06Tq1YYw91uT1?=
 =?us-ascii?Q?I14JSA4ywWMm7iPhuLKPDqTjFnwtUNj+Psj1jt7TXd8+V+g8gc7Wyl28ykCS?=
 =?us-ascii?Q?RlUyUN62Upfu6OhbeyeZi02mXNCJzZLFR0CGNGpPX7jyZAPetWvIDmIbU4X/?=
 =?us-ascii?Q?LEfeozRkIzYX1+wGAKf6R5GAxQ4zzGCUO/XfztPp0HETPP684IhsxVhGi+9J?=
 =?us-ascii?Q?95C3BnKKNrQcejd+H5VEZwee7Gkiow2cTkV7ZykNVnUlBbX3g6jLMZRTW5pj?=
 =?us-ascii?Q?90m5DFMd5isOkdk86vsspHXz93tyNvEEclggBxpJqA+G9zAfhGnGAJy2Ufbe?=
 =?us-ascii?Q?669rRWCfS3gpdJNzmPmaFvkg2R9TFKqirKwRGE6Xxxh/EoP4lfQhxPCY0XAh?=
 =?us-ascii?Q?E1dbeo1qAwCUl0rSxOeS18yLaSKaREOWPsLYEG4xJDiOH4H6C5Yp7tibkAtn?=
 =?us-ascii?Q?rGi9lDMRNrr33BeVNfsVKmDhibLwsdSB9xMc1LVZ+hqLZvjmQO+ku6UtgSIP?=
 =?us-ascii?Q?g+42Th9ghoOd9qjDyw2235LSP0Cx4lguTnO1uXK6WLxq5wQthWu9h7i75jbD?=
 =?us-ascii?Q?IHJd/+qlfg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qpxe9ipK3Jlj7zt7+EKLU9SCv/M4eOxBCiSrYSDfGLjkHEtrZLL8eefWDBzYOdybhFy9Yde5FPEXIC6VNwkeXFd8FAYXc78KXSdgyB+NIABJTap98JeRV8Bv+fDPdsFMRgiKf3mS0HjQ35JABYL4rq5fggbGjlIYgMVy9LYJe5OF2kCwbFHXrjZduBGr2/qse+mdm9f996n1P5XYaQ6Ch8AUT3jDHXhgtH1lSwXM3ONoUf43Oe+NEjuzTR+KWRK+3m00QUEwaXB/owZOOCyGsH/SWaG+PX804gBMC3zRvQIEDJxPMYxh+3YlJqA40DSCZYrtJTBI+4iL9RlpPX70bQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc2a0a1-8f8c-4042-1d64-08de90979fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 09:10:02.9038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pZKw6fLEwRYUXJ5zoeLVr7ja0EB7eWFYeSmyP0jtriN7HSmu+tEpRD3YpFfuLKMRuKsrKPiFLnswHNApUA/vpTw9jhEx2RA4/56dGvY48s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: 02 April 2026 05:27
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
>=20
> On Fri, Mar 27, 2026 at 05:18:14PM +0530, Tejas Upadhyay wrote:
> > Setup to link TTM buffer object inside gpu buddy. This functionality
> > is critical for supporting the memory page offline feature on CRI,
> > where identified faulty pages must be traced back to their originating
> > buffer for safe removal.
> >
>=20
> I just checked the SVM code is still setting 'block->private'.
>=20
> I thought we had patch for that but I don't see it in this series.

Yeah, you are right, it was there when I sent earlier revision, I somehow m=
issed adding that patch in this series. I will add it back in next revision=
. Sorry for confusion here.

Tejas
>=20
> Matt
>=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 5fd0d5506a7e..c627dbf94552 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
> >  	struct xe_ttm_vram_mgr *mgr =3D to_xe_ttm_vram_mgr(man);
> >  	struct xe_ttm_vram_mgr_resource *vres;
> >  	struct gpu_buddy *mm =3D &mgr->mm;
> > +	struct gpu_buddy_block *block;
> >  	u64 size, min_page_size;
> >  	unsigned long lpfn;
> >  	int err;
> > @@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
> >  	}
> >
> >  	mgr->visible_avail -=3D vres->used_visible_size;
> > +	list_for_each_entry(block, &vres->blocks, link)
> > +		block->private =3D tbo;
> >  	mutex_unlock(&mgr->lock);
> >
> >  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> > --
> > 2.52.0
> >
