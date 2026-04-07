Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA62FFB5191
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 05:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2DE10E222;
	Tue,  7 Apr 2026 05:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+EJFGYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A50710E222
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 05:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775539910; x=1807075910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLfYxxEhYhXeufB+n8cbzLkwrUTZWCu6C7V3CvnErmc=;
 b=L+EJFGYcVX2WOsdwIh1sDa6ZZecbMWVbqDSAd+uz/NMF7BvepqUi8vmL
 BnEwN8eDeykmwAUdSQUBRpKMmA5kN5oTGMWnafTqImE4ujJ/OUXYo0m6p
 chod8dwK1c35d7xPQlBN2eXnEFOC0/ZKsOSTp1HnGxoIsuznLzEO9B3vL
 RJLIqjhgoGL+bwxZfv8Z2cg1O6GNGpdGywYg9DSwaNlKxZh/F06EiEew7
 GeIKjMch1PyO9N+jWF+eaqQU8Lj3mcVdVUdl2rQNe5BUqv4d52Tk3yKJp
 ESQNFJLjcOxvD+koeOVm/wzwMuff2YEJY8efMqwCWDTJCUJMgkGAdmZnn g==;
X-CSE-ConnectionGUID: LFqPxaoBTfSUKtapVsaj6A==
X-CSE-MsgGUID: d8C7/ia0TY+bwZOBUCkGIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80352373"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="80352373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:31:50 -0700
X-CSE-ConnectionGUID: KQ8qCmL1RCK5H0hhH1GSVQ==
X-CSE-MsgGUID: E2w4dfJKR9au1iUnW5tnvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="225320034"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:31:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:31:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 22:31:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBqL9a6qgOfRcPvexWYGoa5y/itn9cpjuzC+Bf+yNOlr2+WaShOfKvSGyFeqMGeVH1+4WB20UyAoK3rHKV14FOR/qqc+0s1A5SLE8zhYgJMTApsn6Ls+UnRYLlaXwc/uQVs8ErMfjrRlGmY5UzzITJCPJpJl/eVHf+xSye9wi9qmMRXbyUFoWE9v59XZ8w6VO5S3qwME7RFAFP4wPCog0wBPkQPT+utGFQI4Wbe4ITrI8BgMxaG9Pdjf5Fjbuj6/cuuUD9kcSMJHG6E29oN/Ka6Dpc73BfEZzcXNlrrzgAtFtZaIkRXqMEhdfIgLTAMeMDma7K6lUx/ZwMrNXqxdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNPG5X62YpH5IHuWRKYQCfMlOPoxZ4alTI6MZNV49cY=;
 b=lKzv7ymgZ8KrS/o3Wv7gDKWToZrKBH3TC8wLBWouR81otnLceOMVipn5E03LXQNa5EubqDDnn1Va0in7F161e8mrnJUMh2jzMO6+fvD0Y/ipnNLd2yKutbucHtiB5qrXTluaqxJvlOyY3ES6V8fFDLjIiy1SlnCrXgWsWPbVoJHXCFx7/GDxcm4jAlCjZY0mUzih+8AIDZvA4/snmDHzKEVCvQ8jCI39MFM+EObOOawIbdvEuRAEZsOpMCrcH3YEY0u8/+6Ent/qAl4hvhkq8wKb0yI35U8Tz4pX6AFqVb86EIf/PUklA8/HhgM5wZiRBw05ZxWCHP0rwyg8ZOXl6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Tue, 7 Apr 2026 05:31:45 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 05:31:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/svm: Use xe_map_resource_to_region helper instead
 of direct access
Thread-Topic: [PATCH] drm/xe/svm: Use xe_map_resource_to_region helper instead
 of direct access
Thread-Index: AQHcxYhH/zxaYfVCukC1d4b7SziCb7XSe3cAgACYC/A=
Date: Tue, 7 Apr 2026 05:31:45 +0000
Message-ID: <SJ1PR11MB6204B93BC343B905C0AC29F3815AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260406054249.2769479-2-tejas.upadhyay@intel.com>
 <adQWUJSpnkGCfe+X@gsse-cloud1.jf.intel.com>
In-Reply-To: <adQWUJSpnkGCfe+X@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB6214:EE_
x-ms-office365-filtering-correlation-id: 5fefde6f-3854-4628-f522-08de9466f547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: QwbyWhVkVcJ+dPDhDsNffGwHwzkXD5kvE2h/rph+a5mwYfBrlPWYpDUAM0pHcIdJ5/GTIi7xHAmo7MAfRHe/n5HSootG0tg9c+wcs0goeDHmEHa+SaQ4tfsjt78ZmU0XmJgTpDsMfwlNzvGM0E4HQpYYm0tS5dUKZfZlB4NixWRwHKWXa+aAXvAOfCOgFpFVcoMzO6PH9RJZdjmimZHgfK4LtgEgJiyV/Z4S4of6rw020GjMWGntDv0W86nf7WY2gEsm912bp5Z7nOKdH1nnylIgM/SQ053tL7TLCEHL9VGjVhDSO5GxKFZjeUNoMelm3y+1rZbT45aRYQKPsVaoPN1ySYMRdzCaDck6bnI5WcK0CtbcoXmXGjrd7L8lr+JTzv1hYtyXVGtOLBpT+LL409MAhyzXJoa34kuuKDwlg0x/d3uA4RrP3yPR0n0Pczkot6T86/ZwtjXqS18GIc24VJdqsr+vwUQbQl/IhnU7+osntmk/PAQmOOeVjFG3Fcnj4iZFLzkfwNGfNd4wWBdan8Ux0s9h1tiT6vreFMK49eh0hKCfPQu43kRN/ZKQfI3HONtbvvRdwFavTwaWd86YMd6V909Wdh95vI+GYbbM++h2jPJIcTmNMJ5ORMZzvXQCx+4deDu/azawmu+6L0InIA6PQibJdQkpWu6nQsP/+eFKEKg/OoWYsJdMPu233s+QGJhYXtCpPQael2nkpEsIdc0YnuQdkHC2hoqkuGCVqMuhbEfgmHfPHG5YytTRpPrZgXYjAHDXx6RHPhLLdcNBr0clXcpqo9yum3AUusCznfE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6SuZQR2tIjFgrsVFULveMaOlx3cgtzsNPXbc/tH6lJ4zcbp/3KWFEglxGwhV?=
 =?us-ascii?Q?vbDA0V5ZCgisl4gojyRzCLXu0gN4+EaWPErrPx5YkBAgjVzFRlR7iLXMo/xC?=
 =?us-ascii?Q?ah1SM+w6H9bmram1SW6K89/bNOGWp+FpC2v/O4fNZIz7A8F8MpSNsfNv3Tmr?=
 =?us-ascii?Q?cHFkqzHIvvnzOWelLty0GwxFoMDwJv0hTTNfylGHaAZDEo/DJBliue5B9ugi?=
 =?us-ascii?Q?WUmtRI+rOW0rSLB9tpwY8gTvrBl03O9HoI7lYMOAM1O04Zj8miQnawoAKiBF?=
 =?us-ascii?Q?SH6z5iosLOJml/IobjyXC9Rzzaq/1ICCBNYIrGVWgV7xveDHqum79KZN4dze?=
 =?us-ascii?Q?8igtbh+NFLZFZWYC61+Nrb+zmDEp5HpKKC24EE3A/rUZxLpIklOWEnlUDooq?=
 =?us-ascii?Q?cvZpsrPjxyoLjuxOIkO1GisJXe91OZxTfMDisXPxj7VXUltFoLeka61Q1KSO?=
 =?us-ascii?Q?dMttulbyCtnM9Gl1toV+Q7Os8yUBWhZ5WNycKW0nUMMXGeJrOmdn/H1+c8V9?=
 =?us-ascii?Q?ueJEY7jHeJyIQutPMfGqEVjd/QQ8S4pNoZk+kWtQ0nFEKpzVj1V50iM/YcHf?=
 =?us-ascii?Q?DqJHGomTG/n9cAIkwykLfmsM07FHJWrTG8MNChOOLqZw0y8hTfPQpvEeau/V?=
 =?us-ascii?Q?yxgFuszctItiJMhdcxnsufC+UD0VlP4cfR4w9lIeNde4ga3IBOGXggvdcOC0?=
 =?us-ascii?Q?T1JgEi9+5pZ0uQl7EFcPbD5QIDVG5Vwgjgb78FnP0XM496w+HfI/4stQYytG?=
 =?us-ascii?Q?oOTd2MzffjCEMiSRoD3vpGVrbtGvOAzMGYw98+W/Z+zXU7qHFaHQ38/TRHlJ?=
 =?us-ascii?Q?RGt40UgqjBXodrxf52YFgOZeBoowXcQz5H9qfgGZG8GAl7mtY7djVDIXf5ug?=
 =?us-ascii?Q?u7CQuzCoa4cRBF/2ScH1TvL6hf7nOpg5MUX9/WGZzjDKXSIQcE6nlqcqjFxE?=
 =?us-ascii?Q?Hw4k8HktruGm2UXQjUINk8zm9Ks3FmSPiigIwqDkHECnrIUu4eb9B5hThoC4?=
 =?us-ascii?Q?tV2BhKRmbyS7dnDyB+AecJ5fLYlSUwPkUpvyTJFDTrtq9rtoIKNvAJ1hxxyK?=
 =?us-ascii?Q?c4t2S8VN/z5ItebYk4AFmrQ/y7ow/lN8FoxfmnMdJw2qUYUN1xDquNGR47s4?=
 =?us-ascii?Q?Kae2sdeVbwdyOYZo3pWf+T4IL2TjvMRfWM5sk8hsi3h6YRlOISYYHZ/YxkSZ?=
 =?us-ascii?Q?rLqzg/gota+zS+pv1b72ViCYblsgJYWOWwl3jEycHj2TEk7+yVnuFWoqhlvR?=
 =?us-ascii?Q?B+eLsMQK5pxVyQT0qIXmjb9+lrkD6yDZDKMUnNb/e1zDh2mwhGJHj9SJ2WNU?=
 =?us-ascii?Q?Ah9/LPkPKPFYBVVyo05aX3wdaHdqQcgtPcFak9S3rA6QTWXxaC93hM8YPETL?=
 =?us-ascii?Q?zqTMkreP7F6Qi/WRvrQ5dfUNpyhmerHPUq9zJk+CqaJFQTlEjWsL/KRm5aH1?=
 =?us-ascii?Q?a3vGggQBMKlO8Wv62npC/Krg+NET65xodp1aTv0/19mRL0Oy0n+h0WvBqejW?=
 =?us-ascii?Q?4CBDi/na6B589qEC2/3p9mu8hTnrQ4yIXa9bm0sUFxK7XEYWmMDrtXEC4rMZ?=
 =?us-ascii?Q?nGGT/8SYPRH1oi3TgHu9W0QQp6CUspBQa4IfWTv6aUN3h3R+IbO+7+vnS3vt?=
 =?us-ascii?Q?azJOXVQHDZpKEqA9XvLGBSNyFJ+JQQrRWNSe4oHGheygOJ6+zr8DQYicEBO1?=
 =?us-ascii?Q?bbv0AJews/DLCNHyGTtLlUeFXfNe9a1PGQINTFT58LU5R8ulQQVc5A5JIsNS?=
 =?us-ascii?Q?3b7yAmZwpQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EbSpN5vO78iNdsubAlKhJE1LsqpyF/kjyy+/m8kc7O0Gv+YTdBf4r8N5Stlh3IjFcolUsYJbjHQtG6hC3U7X0E95868ovGsuz7ylZMhv8JVyZbq8U5Q4K0MZxBsmhkJMrb0z2G/I11myfFMYkshrnp4ZlvzV+GKCfeaf2FZFYMWEnBlemU74m9TmxhS34i0Nue4QFWPnNR6yIWzdC66/hlk+Z+PE6UYYgAJsyIXoo9UG48LCfoSwjWgIZwmccr+JVWC5Z5RncQNWbFWgbvJmggIuOd2jlKaT0pkWg2neZ7gBYIyLqIpqw6O7hLLJQZ//wF5g5w4/5a4sQpOPLoOSDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fefde6f-3854-4628-f522-08de9466f547
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 05:31:45.5291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TmmnwLQn9ea/r0aG35RyddeAb4tXfTA/T+jZ54hJ3ILgh177U577tfHUmiU+XKuQX2ch5laJ3yHMIGFkCQ0SUaJWZeo/2nGLlNYEPff430k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
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
> Sent: 07 April 2026 01:54
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH] drm/xe/svm: Use xe_map_resource_to_region helper
> instead of direct access
>=20
> On Mon, Apr 06, 2026 at 11:12:50AM +0530, Tejas Upadhyay wrote:
> > Renaming:
> > The helper function res_to_mem_region is now
> xe_map_resource_to_region.
> >
> > Abstraction:
> > The patch removes instances where block->private was accessed directly
> > to obtain VRAM region data.
> >
>=20
> I'd include the 'why'... e.g.,
>=20
> The patch removes instances where block->private was accessed directly to
> obtain VRAM region data allowing VRAM manager to own block->private for
> future use cases.

Yes looks good, will add.

>=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c   | 21 ++++-----------------
> >  drivers/gpu/drm/xe/xe_svm.c  |  8 +-------
> > drivers/gpu/drm/xe/xe_vram.c | 22 ++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_vram.h |  2 ++
> >  4 files changed, 29 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index a7c2dc7f224c..daac53168dba 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -173,19 +173,6 @@ mem_type_to_migrate(struct xe_device *xe, u32
> mem_type)
> >  	return tile->migrate;
> >  }
> >
> > -static struct xe_vram_region *res_to_mem_region(struct ttm_resource
> > *res) -{
> > -	struct xe_device *xe =3D ttm_to_xe_device(res->bo->bdev);
> > -	struct ttm_resource_manager *mgr;
> > -	struct xe_ttm_vram_mgr *vram_mgr;
> > -
> > -	xe_assert(xe, resource_is_vram(res));
> > -	mgr =3D ttm_manager_type(&xe->ttm, res->mem_type);
> > -	vram_mgr =3D to_xe_ttm_vram_mgr(mgr);
> > -
> > -	return container_of(vram_mgr, struct xe_vram_region, ttm);
> > -}
> > -
> >  static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
> >  			   u32 bo_flags, u32 *c)
> >  {
> > @@ -635,7 +622,7 @@ static int xe_ttm_io_mem_reserve(struct
> ttm_device *bdev,
> >  		return 0;
> >  	case XE_PL_VRAM0:
> >  	case XE_PL_VRAM1: {
> > -		struct xe_vram_region *vram =3D res_to_mem_region(mem);
> > +		struct xe_vram_region *vram =3D
> xe_map_resource_to_region(mem);
> >
> >  		if (!xe_ttm_resource_visible(mem))
> >  			return -EINVAL;
> > @@ -1642,7 +1629,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct
> ttm_buffer_object *ttm_bo,
> >  	if (ttm_bo->resource->mem_type =3D=3D XE_PL_STOLEN)
> >  		return xe_ttm_stolen_io_offset(bo, page_offset <<
> PAGE_SHIFT) >>
> > PAGE_SHIFT;
> >
> > -	vram =3D res_to_mem_region(ttm_bo->resource);
> > +	vram =3D xe_map_resource_to_region(ttm_bo->resource);
> >  	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0,
> &cursor);
> >  	return (vram->io_start + cursor.start) >> PAGE_SHIFT;  } @@ -1782,7
> > +1769,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object
> *ttm_bo,
> >  		goto out;
> >  	}
> >
> > -	vram =3D res_to_mem_region(ttm_bo->resource);
> > +	vram =3D xe_map_resource_to_region(ttm_bo->resource);
> >  	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
> >  		     xe_bo_size(bo) - (offset & PAGE_MASK), &cursor);
> >
> > @@ -2923,7 +2910,7 @@ uint64_t vram_region_gpu_offset(struct
> ttm_resource *res)
> >  	case XE_PL_SYSTEM:
> >  		return 0;
> >  	default:
> > -		return res_to_mem_region(res)->dpa_base;
> > +		return xe_map_resource_to_region(res)->dpa_base;
> >  	}
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 5933b2b6392b..71fbc75bd0da 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -790,7 +790,7 @@ static int xe_svm_populate_devmem_pfn(struct
> drm_pagemap_devmem *devmem_allocati
> >  	int j =3D 0;
> >
> >  	list_for_each_entry(block, blocks, link) {
> > -		struct xe_vram_region *vr =3D block->private;
> > +		struct xe_vram_region *vr =3D xe_map_resource_to_region(res);
> >  		struct gpu_buddy *buddy =3D vram_to_buddy(vr);
>=20
> You can move 'vr' and 'buddy' to function level variables.

Yes, I will fix this.

>=20
> With the nits fixed:
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks.
Tejas

>=20
> >  		u64 block_pfn =3D block_offset_to_pfn(devmem_allocation-
> >dpagemap,
> >
> gpu_buddy_block_offset(block)); @@ -1061,9 +1061,7 @@
> > static int xe_drm_pagemap_populate_mm(struct drm_pagemap
> *dpagemap,
> >  	struct dma_fence *pre_migrate_fence =3D NULL;
> >  	struct xe_device *xe =3D vr->xe;
> >  	struct device *dev =3D xe->drm.dev;
> > -	struct gpu_buddy_block *block;
> >  	struct xe_validation_ctx vctx;
> > -	struct list_head *blocks;
> >  	struct drm_exec exec;
> >  	struct xe_bo *bo;
> >  	int err =3D 0, idx;
> > @@ -1100,10 +1098,6 @@ static int
> xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> >  					&dpagemap_devmem_ops,
> dpagemap, end - start,
> >  					pre_migrate_fence);
> >
> > -		blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> > -		list_for_each_entry(block, blocks, link)
> > -			block->private =3D vr;
> > -
> >  		xe_bo_get(bo);
> >
> >  		/* Ensure the device has a pm ref while there are device pages
> > active. */ diff --git a/drivers/gpu/drm/xe/xe_vram.c
> > b/drivers/gpu/drm/xe/xe_vram.c index 0538dcb8b18c..23eb7edbdd57
> 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -13,6 +13,7 @@
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_regs.h"
> >  #include "xe_assert.h"
> > +#include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt_mcr.h"
> > @@ -249,6 +250,27 @@ static int vram_region_init(struct xe_device *xe,
> struct xe_vram_region *vram,
> >  	return 0;
> >  }
> >
> > +/**
> > + * xe_map_resource_to_region - Map ttm resource to vram memory region
> > + * @res: The ttm resource
> > + *
> > + * Get vram memory region using vram memory manager managing this
> > +resource
> > + *
> > + * Returns: pointer to xe_vram_region  */ struct xe_vram_region
> > +*xe_map_resource_to_region(struct ttm_resource *res) {
> > +	struct xe_device *xe =3D ttm_to_xe_device(res->bo->bdev);
> > +	struct ttm_resource_manager *mgr;
> > +	struct xe_ttm_vram_mgr *vram_mgr;
> > +
> > +	xe_assert(xe, mem_type_is_vram(res->mem_type));
> > +	mgr =3D ttm_manager_type(&xe->ttm, res->mem_type);
> > +	vram_mgr =3D to_xe_ttm_vram_mgr(mgr);
> > +
> > +	return container_of(vram_mgr, struct xe_vram_region, ttm); }
> > +
> >  /**
> >   * xe_vram_probe() - Probe VRAM configuration
> >   * @xe: the &xe_device
> > diff --git a/drivers/gpu/drm/xe/xe_vram.h
> > b/drivers/gpu/drm/xe/xe_vram.h index 72860f714fc6..dd1c8bf17922
> 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.h
> > +++ b/drivers/gpu/drm/xe/xe_vram.h
> > @@ -10,7 +10,9 @@
> >
> >  struct xe_device;
> >  struct xe_vram_region;
> > +struct ttm_resource;
> >
> > +struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource
> > +*res);
> >  int xe_vram_probe(struct xe_device *xe);
> >
> >  struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8
> > id, u32 placement);
> > --
> > 2.52.0
> >
