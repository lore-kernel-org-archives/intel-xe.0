Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E305C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 10:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3F010EBAE;
	Fri, 19 Jul 2024 10:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hU5fdro3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FB10EBAE
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721384093; x=1752920093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ptZ/9yvJcJzYkEn5w44/nX/SoA9xs0ZyOJzUfeKZtY0=;
 b=hU5fdro3eeRyfMBUXqSsDbHFlsHB7wy2xF0BPJRwdJycmj/lLB17VdbY
 py08OjjsTT0VwiTYaL/M4Rj+0cFIvlqZ9OKbQWIDimo71bBkZOAmvqi7f
 Ijl4KTEXhINoypb89SzOqp9u8FqcSYVLNIp32MGk11CKP9TyXodXXiOPZ
 SYqnAcoW3m/dbgWceXQVBaC4Zh3lOn1kIZG11hHZqix7uNt7SfjhFTt3P
 AfcUmrsY1eRAv4a1qXIbrVPPnioOtQI/rATlIPWJHT0MrGVllPvtAemg0
 M/SbLrTt5lvY84K9OARyaWYObnPhLOmWVJFpItTU+oxHfbOkTXwQe0G7l g==;
X-CSE-ConnectionGUID: gOu7A+q0TuSA6UNGuu+ytA==
X-CSE-MsgGUID: 0QAUXQTPQUCc5YWF5n8lHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18947006"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="18947006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:14:53 -0700
X-CSE-ConnectionGUID: xz04sTNQRVmmc9sMGIXwBw==
X-CSE-MsgGUID: XMF9s4QnQ3CzVkKMr0xVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51087477"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 03:14:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 03:14:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 03:14:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 03:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtqyJ4ttJQWVLsgT+AepoDwjl8TSsEUzNZvBhnaVPvm6ZUjO1yrd5F0NOcu8WmYhHNwEkZ5Ay2xHxLTkEA4hIHTCxsD7aR+JEqrgBD0trpbzLhU1kGdOTZepUaxNWbsP0AlZKbmadpQ0RjoVySJCQpnEn4NGAFyHyMVrdLQW7OtuuFbsR/Os950IK+7Kczdi1D6HMChOro5ef17oyjn56mMFEJBsRQZg7okVnBlbRldUPC3NZ1BNZ+DI9ZcbVK0+YIlW04MPF112m0rOk+gfiYsb4PabqaA/aPq4oXbt3OTL9WHqzPZ17VP+5uDJdZUqaSTpx5/RHqQ/cmbDRWNflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHuzbl6sQgOWB8YSNXFUG0dmhi0s8+s2jNSzEQU+LC0=;
 b=YMeIsiEZ4Fb0NGMG8A8H7r+XXHHehGG45TcrjKOZKOVOvmvMbKW9Q3uBkEj4m4Cec3l3WckF7CPqPaqcd5pxSZ1xnTVEZ04M6LvJ09SuDjdr2XIu+5Yn0o6SIkTLLBynKt7vOYsvCpG7j5Bv6T64TaRV8hA6yP1bLW2G+6Z3+VFwhQgIYQlkqwDaKvvUFhrrgjQkSTt4bageANq8M49Fe0EXbC3hekKKWacDSE9RWAM0Tg/40S83FJf8BBFvAc3/9DLL3jzDEDpHSFiI3w4DWafaOJeOuFFN/GCc918gUtIv3H7r0CsAIzsnE3YxsbJHuTpp5Z6F9k6tUnjFpZQQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Fri, 19 Jul
 2024 10:14:42 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 10:14:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Unlink client during vm close
Thread-Topic: [PATCH] drm/xe: Unlink client during vm close
Thread-Index: AQHa2RTHRUD7kzxzjEmRktj4GtbcG7H8pGIAgADb0ECAAB4FgIAANzwg
Date: Fri, 19 Jul 2024 10:14:42 +0000
Message-ID: <SJ1PR11MB62040D9AF56895B69161194781AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
 <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62048D1E37A856E52AE40C4381AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZpoNHwGU6OXxmpqJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZpoNHwGU6OXxmpqJ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL1PR11MB5223:EE_
x-ms-office365-filtering-correlation-id: a955a701-5b49-4e6a-1b8f-08dca7db9b12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?40gdCVuefvCfk7uc3re4DXVNTHuQn5E+UYkSCmxfpI/HhZAYizJZ1seEu96V?=
 =?us-ascii?Q?7RTZrF6LgYgQ18XAqJOnj4VtBWhIFC//U88a0dQoog58k5xR98wmjAS9xIPp?=
 =?us-ascii?Q?hjTzJrMrr32msd6WMZkT3K5rXCw6Q9OUjJLlELV1h8R1oKgFh+HMDv4dGJc8?=
 =?us-ascii?Q?Tmd/mBbui8kRLMKpnjYbVXctGnUukZUZysXgrZVmGIG9+GO5+A6wl5MuYLD/?=
 =?us-ascii?Q?WE4VPFV+vhmAJxbiw3pluyl3dxspAjcYgsVTWtrvOrI64/jfqaWdL4azdHeS?=
 =?us-ascii?Q?IcgwCAkXlBHhY0l+Iw7JUdk2n7ShYSz2K806sbM4LueQtrkvo5/BwX0TLgFV?=
 =?us-ascii?Q?wd32X5bwGjy7xCek5/o8lG2byXmqN8YuVopnxHLU8R0hePDh/2LYCyDYH3W5?=
 =?us-ascii?Q?GrR62009F+9pHWAuuLp5sXtZmVIy8MdXZKlG11m0IQmNdDQAa1PWcZCK2ZZZ?=
 =?us-ascii?Q?ICYwXIKXGQoKh+QqykkfnNpshPSckYbfvBXln00p4RvkVRCpZVO67DzULQ93?=
 =?us-ascii?Q?N3CzMCNvQlCY73nTrKPIlzRgZZ/6QtekwGdnGu5JydHlVRej1QVlw0CgE7+7?=
 =?us-ascii?Q?/aoGd3YvbpO0y3WM6/UYXTHZHs6kR37oGVk5VF1tORgvN2dOm1OodjHQsxmB?=
 =?us-ascii?Q?+/RPc5h7rtG2JzCWdwfgaEovNFfbi4DyHYDImSKMjn2aFHFsbEWetHHUozb3?=
 =?us-ascii?Q?SNxugyX/kIcwyAK3jIJhP3AoaC6dkfdCmFEORdgPLyN0aETu+DnKHSwgcMMV?=
 =?us-ascii?Q?0uO/kJ3Xh5Xjl6UHogmGThoB6asopOBOeW7mOQJELXs1151gP0mscKdX0NaU?=
 =?us-ascii?Q?Q0ShHs/IAyAq2bvN15uK3+WCBOoki8tgyxkzQzohK9X4kNursc6QyMVMyNoU?=
 =?us-ascii?Q?M34KulqIPMhsG63JWBadTFf1kt6FzSzbos+u4puOd1J0L2M9g89oANKa+Zeh?=
 =?us-ascii?Q?GI8DTxnfTOhnPl1xjq/fyFyZ08rkdbTpIf8XGa3Hw+3mJpszt67Q9RvUnnoY?=
 =?us-ascii?Q?TgT6YtkVGhT+25+qOXdqCrbOxitdzWr9kYz8bCOkJd5e9wEYoiV4gYtk6u+o?=
 =?us-ascii?Q?T3NfNzfBehl9fPDD6Zc7j6ijmc6lDCBXuu3CeD1HNQxR8DgCK721S0UQBdpy?=
 =?us-ascii?Q?SR3zt7PAqstA+JgcXZEYrst7FsMCeOujJEi8r99oeGOybCVpa6j7HhGq/oOG?=
 =?us-ascii?Q?J7PeDdDK8gCVg52Ee9PkN2CWiImJP2kUfIASu1LIAjYCXfGX5jtNX8/JhUAQ?=
 =?us-ascii?Q?94q7tgwxKW0k/2ZChrjTRqmdhP1Pa7W88JG8TAtzONKgPs8iulE99m3ReCBy?=
 =?us-ascii?Q?GYxfu1AAIx/41kBmeizjcEsSYm7C6ga0gRYeCaMGPaPJEIzRF1rEXRk28HLc?=
 =?us-ascii?Q?i3tH+1c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vp13u1uFA/4MxmXmlkPz8wwyuWfyPgfA+eBrxigl8/ACOBFVPdNgTT2WuEtQ?=
 =?us-ascii?Q?B87dtFF1N+NZXgz8nG2uPIxAJsCJaXuLCRMvD+DtkHcqNwKLA4dvo5EDzjE6?=
 =?us-ascii?Q?HTR46yPFtynUbNTtSjCYhZ05u+6ZcljOTE9yuUW8WyQjoVNw05+x5Vj2EiPX?=
 =?us-ascii?Q?p/KwvY5IOMvMGkBrgBs81cLlcZXhbphsIaSLc/3creai7jpmPUpQD21kIbDz?=
 =?us-ascii?Q?/Cp7rJ0LhZZA+pY1eeSVUL/63n94nt8S1kuQihiEFx8X09heHwaJ4EV9ILpl?=
 =?us-ascii?Q?6KVKDe7yoART3nOQlEkSPnElJUEA7PMJEHveJfez0UrUtYxR1wbeCTIAhoGp?=
 =?us-ascii?Q?zIBlB8rlMl0VwddUEVLykDV7x/5w3Rq4XzpA22KrGmiCktA4cKUyzU3L34G+?=
 =?us-ascii?Q?dv6zne9qNcZ66Rt2Ki8PuRLVybCM/1oZcSnQRGIdg7VYORWApnWIK5UH9zna?=
 =?us-ascii?Q?lBFN3pXMj0AkdxFGUnlp446hTQaXDwJzCTiFueGkp5yKJ9c/9mVrqo1LrowE?=
 =?us-ascii?Q?z7AOVMgbsw8OvwGQ7H1QiDNj4VbSSdu/7bAeetCLT0DzxP8uq4dFNxR2QTJX?=
 =?us-ascii?Q?RctYk9GfUJJWCrTB/qaS9r7hPn/sby61XlM9lVUm/WbHk2RMEEpaXfArQNYT?=
 =?us-ascii?Q?27e8+4USBeWcaT/I8JbbaoX5sgkkJprsaO9vtlfRr8stYfjpkNpla6AgocV/?=
 =?us-ascii?Q?fVWnRK7MkKJSktRth+GREgA/of3OuUO+AinsoOCtSo96bSz+sQyBrTYBZz3a?=
 =?us-ascii?Q?ApLXvckuef6nMpcw4QphZUXthLux5zqpUDZyTKfVd3gvwtBV03tJ+FgbCiBR?=
 =?us-ascii?Q?YWjX/a7RAGwtWFVLm+MeEHo/P9cb2F4ZeCUm9UhfYW8QJ8HFyiHKJts/VaI2?=
 =?us-ascii?Q?LOdDGeUsKM+MYpBz0DWlH43pyMFluWO1y+/XMu4XZxM9OyJmlIUhOJjZ0q8l?=
 =?us-ascii?Q?q2cHGWate7ao/3UkZ1WGqc5ubgz1Ny8AC3NjshaVc2vSVQNtQJVStzwY/QL+?=
 =?us-ascii?Q?+BazK7rRTnkJ4Uu0ujX7cIF+t4nLGOpE4qSmtLYRqYICbXsxp72sgEwJ4UUM?=
 =?us-ascii?Q?5WHyPiQD3cYu3E1AfGjOIJrCywvib4ztQYvNPGNk8e5JpRDsVO+h0UC5QU3+?=
 =?us-ascii?Q?iQ2XqswDhnrSp/2ATTdGc7kpxf19w2aHI0eim3P5D2jWQYBalxsqJDfhSdhE?=
 =?us-ascii?Q?DrAI0jG3AHkce1oiwb5NrjT/DMfQ3/UqsppeU5hdelz5u58QaU13F77vXMtu?=
 =?us-ascii?Q?K8mRUYLfbLnloh2h2B3s+5ki7Jfdy0CMCuAI2JgopSUtT8C2C/An2o8Ti853?=
 =?us-ascii?Q?rpEAaGRntVq9vC6Z5A6dYQXiNRRskbtVhg4z3s/HSc8nAz9qr2NluKQXT6ZG?=
 =?us-ascii?Q?rxVTFAK+MJJYTZeJiN17I+n5Khvsi/gImaQsRqNqxMljgR5Sya3/OqvIGUuC?=
 =?us-ascii?Q?PMZE3mzqEKf+yc8qocevRK3F3XYQb+/fWWsbrzUFSa4YauQoaYx3CGrSTnxO?=
 =?us-ascii?Q?lMWxTFyVOkpGbB705/5QgYFj+K2v0BPl86oCzvOY7T/NSYu+0W9tj6Ga2QYC?=
 =?us-ascii?Q?PoRr7Lhm0R4juHoULvLU9pN6nRdhV/pzy4ZWUoId?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a955a701-5b49-4e6a-1b8f-08dca7db9b12
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 10:14:42.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TP32DY/fobh9TcEpSBtQtBY6gPjZbfsYIxid7ogxIK5gTCxuSl8DJySoagOeI97+VMY2Ce4pH49ELoEuh/zpcmgYaBQK67nvJrsWYsZjxnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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
> Sent: Friday, July 19, 2024 12:22 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Unlink client during vm close
>=20
> On Thu, Jul 18, 2024 at 11:08:42PM -0600, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, July 18, 2024 9:28 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH] drm/xe: Unlink client during vm close
> > >
> > > On Thu, Jul 18, 2024 at 06:47:52PM +0530, Tejas Upadhyay wrote:
> > > > We have async call which does not know if client unlinked from vm
> > > > by the time it is accessed. Set client unlink early during
> > > > xe_vm_close() so that async API do not touch closed client info.
> > > >
> > > > Also, debugs related to job timeout is not useful when its "no
> > > > process" or client already unlinked.
> > > >
> > >
> > > It kernel exec queue timeout jobs, now the 'Timedout job' message
> > > will not be displayed which is not ideal.
> > >
> > > > Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
> > >
> > > Where is exactly is this access coming from?
> > > BUG: kernel NULL pointer dereference, address: 0000000000000058
> >
> > In guc_exec_queue_timedout_job() accessing "q->vm->xef->drm" after
> client closed fd causing crash. We cant take ref and keep client awake ti=
ll jobs
> timedout is what I thought.
> >
>=20
> Taking ref to q->vm->xef is exactly what Umesh's series [1] here is doing=
. I
> believe this is the correct behavior and based on you comment above, I al=
so I
> believe it will fix this issue. Please test with this series. Hopefully U=
mesh gets
> this in soon.
>=20
> [1] https://patchwork.freedesktop.org/series/135865/

This series also fixes https://gitlab.freedesktop.org/drm/xe/kernel/-/issue=
s/2273.=20

Thanks,
Tejas
>=20
> > >
> > > Also btw, the correct tag for gitlab link is 'Closes', "Fixes' is
> > > the offending kernel patch so the fixe can be pulled into stable kern=
els.
> >
> > Ok
> >
> > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
> > > >  drivers/gpu/drm/xe/xe_vm.c         | 1 +
> > > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 860405527115..1de141cb84c6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1166,10 +1166,11 @@ guc_exec_queue_timedout_job(struct
> > > drm_sched_job *drm_job)
> > > >  			process_name =3D task->comm;
> > > >  			pid =3D task->pid;
> > > >  		}
> > > > +		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=3D%u,
> > > lrc_seqno=3D%u, guc_id=3D%d, flags=3D0x%lx in %s [%d]",
> > > > +			     xe_sched_job_seqno(job),
> > > xe_sched_job_lrc_seqno(job),
> > > > +			     q->guc->id, q->flags, process_name, pid);
> > > >  	}
> > > > -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=3D%u,
> > > lrc_seqno=3D%u, guc_id=3D%d, flags=3D0x%lx in %s [%d]",
> > > > -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > -		     q->guc->id, q->flags, process_name, pid);
> > > > +
> > > >  	if (task)
> > > >  		put_task_struct(task);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c index cf3aea5d8cdc..660b20e0e207
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1537,6 +1537,7 @@ static void xe_vm_close(struct xe_vm *vm)  {
> > > >  	down_write(&vm->lock);
> > > >  	vm->size =3D 0;
> > > > +	vm->xef =3D NULL;
> > >
> > > This doesn't appear to be thread safe.
> >
> > Would you please elaborate!
> >
>=20
> Sure.
>=20
> vm->xef is to NULL under vm->lock in write while
> guc_exec_queue_timedout_job doesn't hold the lock so the two can race.
> If you wanted to be thread safe, the latter would at least need vm->lock =
in
> read mode.
>=20
> Anyways this patch is likely not needed based on my feedback above.
>=20
> Matt
>=20
> > Thanks,
> > Tejas
> > >
> > > Matt
> > >
> > > >  	up_write(&vm->lock);
> > > >  }
> > > >
> > > > --
> > > > 2.25.1
> > > >
