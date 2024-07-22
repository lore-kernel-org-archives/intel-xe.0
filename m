Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF693C3DA63
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 08:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F6D88697;
	Mon, 22 Jul 2024 08:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+YK9Y9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F179010E458
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721638512; x=1753174512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H89wczjj81ykNpwvWqTcKwjZ3NvHD+b9xkpXr5l8sMs=;
 b=j+YK9Y9DgZFTVZhDC/3fDyvGzvNBsAz8lM/Cocpr/cPqr1LJXWSMoEpb
 0pcBPkSzVP8XFi7WN1UYvBIrg3flXexaqJ3mxnjnYJY8mLSgwc/f7SW4f
 ArNMfqKoEtNgOGS8LlFC+pMBQjevp3JOX1DQJLoyODPfeLi+bCEuPVCRd
 3bpZjnlLNZLgAtSFSnGFSfSog30e111QR7iEKZs/8r0Bm9YlGXE1WiCiU
 IPb6ynmyzWOD+kM3rPAOKYn128EubFoQOI2AqLlGkh8vd42W102+Q1jmU
 cXHB7SDVawV9sjQGSivQxPRQjNPygJptXYUJRZoEzmya7nx3IhaxacTFe g==;
X-CSE-ConnectionGUID: PtJuSF4gRD6iZ+IJ6AUmmw==
X-CSE-MsgGUID: WhF0UFWrSXWdsqRc1elRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19344035"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19344035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:55:11 -0700
X-CSE-ConnectionGUID: wKGlwhZgSpe0xkkrjIfsKQ==
X-CSE-MsgGUID: on+J09ESRFq8x0Yioy0TzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="52435809"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 01:55:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 01:55:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 01:55:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 01:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYOl4SIrxAD10iM8BaX5tmc3SSdkpjRi5Ix5u6eXbJGNkpVUIkbkTcVN/PUGAft6CxYOc0iccUr2/uoZxJch6EB+lsboVtTOsNkLQsVrenLRKq25up86eGwRDZqN8ASnq2E/vQKHsDdCfXBIflzlaM6hGwxgFyKs25kWC3PBjhb4OwFK+T8BDp3jk8EJXIzv8pHhN4u75v+RUD1VDa54R+d+Y6UhKIA1EI7G06Rw8uEhMgTo6+9qIZb8b+BvSqZW7EhkjOYcmyhUHTv2Dywomg2EUEbs8/Skoq/BeUtj0OH4S+UAD1aiTHjDB251EtNiYeYWarnN+SiB6vJoJ8FURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CS4ipxQYyiqWWOSTvDBH5wCz00uoWbtw2B8dc1PYm80=;
 b=tFcKx2jpkRrgm711tqmHXKEP+Z6Eix7xkRhukbTEnMdCmI7IHQywFCWLPHmLmU0vy63HDGfcoPFDpOHamOcsMyrEtqTd1D1rl865/f2Ahba9yF4zDX6tinJf8FC0c5L1Xcx86g2Lbn1JrmrqjLWGlmu4Lf61yvin/t0LpMYRE30vs9A3fDOdg1CV+KN6As0J8jtjlI/8sFJGrVccqPQb3HcE+dK/zH285mNBz021TF7pmohekiHptQ31QGhxz/n08OrR9PETr/YYOSpNnvO6sZ4f+mDTT2RF1fS2t5AWocHtWFLBYoItQnXgBVSxIKaiimzxqvI347cjI+uAU+L6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 22 Jul
 2024 08:55:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 08:55:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2: Use XE_WA() check
Thread-Topic: [PATCH] drm/xe/xe2: Use XE_WA() check
Thread-Index: AQHa12ToZ/P9dxA0GEOu9UAZ6Ob3JrH5ePeAgAEZk0CAAI5eAIAHWYRQ
Date: Mon, 22 Jul 2024 08:55:08 +0000
Message-ID: <SJ1PR11MB62044456F7B0C966F9421FE381A82@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240716094635.3427833-1-tejas.upadhyay@intel.com>
 <cm2vbsok4yidxxslztwg2c6v6i67s6lh4trjeznzx35l5uwkty@ykgepq6ispdr>
 <SJ1PR11MB620439B3B9049981E888F9CC81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <p25fk53us727rqktnpcib5bx2ptrmqqnocichdatnxzplna7y5@yzpinszsi6f7>
In-Reply-To: <p25fk53us727rqktnpcib5bx2ptrmqqnocichdatnxzplna7y5@yzpinszsi6f7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB8264:EE_
x-ms-office365-filtering-correlation-id: bbaeef58-3cd7-45bd-bd64-08dcaa2bfcea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Jiab5fWJtSFk+fG/SBds5IG+1alBjl+9mbzdFHDXYbKQv1h8igDyO1kvem6U?=
 =?us-ascii?Q?OZeSkrSBoVr8b10A20HJ9yuu4Ht4dZk1ZtTdg00RQBfEOKtg+aBwelNTIlOf?=
 =?us-ascii?Q?FNkPNFr869Vk8C4odKFBOCGKKKi5+M/a2CLeo3w17nUVW8Jyfm/f22Dbu3XD?=
 =?us-ascii?Q?RNFWz+akcNhTQr02STf4qf9ez2FL38cgYD1ZsPzNKPMZg8z3YIsCW6nZkoyy?=
 =?us-ascii?Q?hFNbJRdb2CTLU+fvs7O7v9vOtMe6FeVA2MqA7NDUZqWKlhruUDloz0wrsXoI?=
 =?us-ascii?Q?4553QMu4GjYrOrEk6/8Q0VjfLBR4zoob6PT16/0AJqN7iLOZEIJNg04EGOJU?=
 =?us-ascii?Q?9mhOBVQD76ZTDxzl0+CcHrthisVb6OjXQzWbGLAzHwN46NxWjgvnGXCnnXHZ?=
 =?us-ascii?Q?vZfN3Hq1wM0PChgZFPzuPmg2ZbUbTG62mjNFqZZ22eGoRtB8E08geUS7W780?=
 =?us-ascii?Q?3jwdiqQn8E5ILRuyx5TjllPUsD3Qa2typ23bfbb1jN+7FHckaUpjo3Cn73Sg?=
 =?us-ascii?Q?8f07RHMRPElTdtUYTnqEd86VYTkwP63ueKtBdjSIvZVZIeOaEIxQeRyFskTW?=
 =?us-ascii?Q?YdLb3QWDDUvGdTR9ss7eGqPdjwS954hpByPHgzPqpRCBf8kfLJJHdHSSKIUx?=
 =?us-ascii?Q?XI2mMbs8mxODmxxOgOgp3iDqm6fF8IfCVpvpRpNuyIo7ZdnVn4HapLafv6x+?=
 =?us-ascii?Q?Yb92dR//gj6Q+W3RC6o7FgybR/xs/Nl3qITbpZywpNXsm/pXuaa0VvOpPKH6?=
 =?us-ascii?Q?mJiqrSV8Ty//UFVPh3ATYVrS+DgmhKL6Xii5tEvgKA5iGcgbdh+c8y9T0Ibk?=
 =?us-ascii?Q?UgNK/JHgn54Za5lvWR46+bFWXDmEkxCmZDd+Z+NayzwPUSASfKes9ghTPcug?=
 =?us-ascii?Q?5O7y63k4xOR3FF+wS13AVoFonJycrSdqiMfpix/bWb9QaAzxLjpySZ90RuNc?=
 =?us-ascii?Q?cAhXjvjLcu7l3SqZYfP7XRqpfQgbVfGgsY8MMkDnUCgMzC/lBW2wMRhmeh4Z?=
 =?us-ascii?Q?P95LRIVbAJNOSvyh3JoTBjOTCqjZUKN3xX8R1bXlhB+vhE1Kw7I50F5q5iJv?=
 =?us-ascii?Q?xLGvt5UEgJUNLXOH7RNYGC7mAq0he1ibzDGW6uBtk7trn2pVsSPopQ05TJlR?=
 =?us-ascii?Q?CzboJICWjlFIoICW3T1HYndD+UUXPAINV20vG4/PUdkc6t8rgneCSYthjpva?=
 =?us-ascii?Q?GPQ3KPSGnH9y9M4QzNfZwbipHScv+sNugDyIIaBdI8Yy51qAUv5gMqms0090?=
 =?us-ascii?Q?rt3nSAY0Aya9voCfrNFhxCXpXjo64YvQk3qZpo9LvPBHfFQd2Y+tuDV5a1HQ?=
 =?us-ascii?Q?h3jcr0DgmCszUGTRHa9PalnqIQWWdN2+rtJ6h+xuv7HaLg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zGlFL1tW6DI2shpq7RxiDxLi96K0u7LZypvVTd7Nyyv7kJfdnyMq10zPUaYO?=
 =?us-ascii?Q?bzKX0wEYGPtrpRzZAk2RW0TuS6FwTrzygdsH//NEMpC+aMqsDZ5V2FH7sACP?=
 =?us-ascii?Q?sHhmDOULceJTVNLikfsMQ5UUKIUD/zEFhv2bXy7GxFW765qUseMHPJCpPADj?=
 =?us-ascii?Q?+SB+PffzrV2D9iKwlEgNz5d9YlyuPrfGinLuzpKVu5JuUCgkWm7Hm0h+XHXZ?=
 =?us-ascii?Q?tmWQC7y00Prm+kBxfK0TrJRNM/UTUt0jkaNm1pG5hkmRsCAYI2LkSo7bUfIN?=
 =?us-ascii?Q?RAFh0wgOeVXogLTLkLuK4yvchm+AHv9n9UNtts1S2m2ziIRAUONdf4ucROQ0?=
 =?us-ascii?Q?1YHtY0/LplKqnKWrGw/OuxCDd/qquTDgaRSW1q8YtaZ52GdiAVxZt3sX6L3F?=
 =?us-ascii?Q?EonudKkhMRzwN+Tww9JvhOGdjeUVU1cTOmg62t9Uvh13CfxE2gm45H+BKM53?=
 =?us-ascii?Q?AZ2cLcHWUGC28ke9Uvo2Zi5rEM49lFz54trP2lxijjOco9uEXZ77o7zGfqBO?=
 =?us-ascii?Q?LHQ1uJHrqjqSZjkx2TcL7iptD3zb7n9LSy55drxI00VYbZaQWzhiu6v+3YfV?=
 =?us-ascii?Q?LXvllNeRCC1iZj0EhKn3EYGUZJDUaJLNsOwlFfm3w9KlGPWsZBLM0G1wCgKM?=
 =?us-ascii?Q?S0irJf4TLKtVJe1ssppbWqr32wmCdpvigrwO6ecSFecZX+uFnNeHQ7zN93qZ?=
 =?us-ascii?Q?Dvx9xVUu3dAhAC6RfBBXtn2SdNyAFUi4LxZmH7ZPVHPbi0rmMAK+zLfmb7WC?=
 =?us-ascii?Q?XB5qx15Nr91bDRZIGKQ2mMLnNE4ffABrX2PiE0LrVMv3mvqd0JAqY0vpxVIR?=
 =?us-ascii?Q?i9qbT1xrd+3fbDomAq3+NRyACRteueeT3SvIS46SBmjjcXGREiI7/LmxAYqU?=
 =?us-ascii?Q?VHcvnlgwtJPlVKqQP+PitmFfQ38we1r8DTo5nFmwp6TBaGVJiyfAKBJ/AWXJ?=
 =?us-ascii?Q?Ma3Z0fHUYZbfuQppnvm4VWN7dNvBKFvwMoxHyG+TO67Ua55vXz3m0b9akInk?=
 =?us-ascii?Q?FnD4BBSJVXpJB41qYEcQL77nvY0qLvRIPlrZJ6i2G5eSPefecXjUQGSV4Zdp?=
 =?us-ascii?Q?aan0uDFZhTVrnHT+hHdkZq3yBaWt1o7tbf2HQ/piWSUERrLo6es5tgd+RKOv?=
 =?us-ascii?Q?bALLNWGFujAK5gXtiNiRiNkMI6z6RPBbCBruTn355a5phWnli8FHIrn5+yG0?=
 =?us-ascii?Q?gLM+oO20vASHewZp0lSxjno5kOHV3KvlbxTJ98QYWjtVb4eMPUU419UNuVLh?=
 =?us-ascii?Q?kHYedKc2+7NC741LyUHH2R7HiLHW4o3U4fOQcvr/8ISi3eohh4eRbFtsWqp9?=
 =?us-ascii?Q?XdAPa4qEFqHi0PaczaIqAPAYmC3mMQHs7PY+7jX/z/jtj740s4ZsYLfRFVX3?=
 =?us-ascii?Q?rlctNEz+wiARPu5YqQ6GPgH+xYmgunk1oAS+VBlb42Y24DO3HSdty0AE3r5k?=
 =?us-ascii?Q?ImhJykge+50dZ0sXPvWIh1navnMnkK68U/fg9/tkHuqrMR0P+Ib/+WydR6Ep?=
 =?us-ascii?Q?N3m5GgfAisJzNS+0lK7SbkmKHJDrpmqt82oP+ANk9+BpZkPtz9CFYEXs+o+5?=
 =?us-ascii?Q?vuC0usLoG3mBF6oJKDu01EhbdL8L15ijrsxJ5/LM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaeef58-3cd7-45bd-bd64-08dcaa2bfcea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 08:55:08.2905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /t4y22HPAkjda92BACDZ2b3WWem0lS2VvjZpG22psXU7HgZfJ+yzdaZ+v3ewBv+aQPQzDeQxYxw18b4gLdpwZ0ougQwMwHDjMx3AX72pFQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, July 17, 2024 10:09 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH] drm/xe/xe2: Use XE_WA() check
>=20
> On Wed, Jul 17, 2024 at 08:11:17AM GMT, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Sent: Tuesday, July 16, 2024 8:52 PM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> >> <matthew.d.roper@intel.com>
> >> Subject: Re: [PATCH] drm/xe/xe2: Use XE_WA() check
> >>
> >> On Tue, Jul 16, 2024 at 03:16:35PM GMT, Tejas Upadhyay wrote:
> >> >Use XE_WA as used elsewhere.
> >> >
> >> >Fixes: 86c5b70a9c0c ("drm/xe/xe2: Add Wa_15015404425")
> >> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> >---
> >> > drivers/gpu/drm/xe/xe_mmio.c       | 5 ++++-
> >> > drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> >> > 2 files changed, 5 insertions(+), 1 deletion(-)
> >> >
> >> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> >> >b/drivers/gpu/drm/xe/xe_mmio.c index ea3c37d3e13f..1138934cf969
> >> 100644
> >> >--- a/drivers/gpu/drm/xe/xe_mmio.c
> >> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> >@@ -13,6 +13,8 @@
> >> > #include <drm/drm_managed.h>
> >> > #include <drm/drm_print.h>
> >> >
> >> >+#include <generated/xe_wa_oob.h>
> >> >+
> >> > #include "regs/xe_bars.h"
> >> > #include "regs/xe_regs.h"
> >> > #include "xe_device.h"
> >> >@@ -22,6 +24,7 @@
> >> > #include "xe_macros.h"
> >> > #include "xe_sriov.h"
> >> > #include "xe_trace.h"
> >> >+#include "xe_wa.h"
> >> >
> >> > static void tiles_fini(void *arg)
> >> > {
> >> >@@ -127,7 +130,7 @@ static void mmio_flush_pending_writes(struct
> >> >xe_gt
> >> *gt)
> >> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > 	int i;
> >> >
> >> >-	if (tile->xe->info.platform !=3D XE_LUNARLAKE)
> >> >+	if (!XE_WA(gt, 15015404425))
> >>
> >> I'm not sure we can actually call it that early as we have the
> >> following call chain on init:
> >>
> >> xe_device_probe_early()
> >>    xe_mmio_init()
> >> ...
> >> xe_device_probe()
> >>    xe_sriov_init()
> >>    xe_mmio_probe_tiles() <<<<
> >>    xe_gt_init_early()
> >>      xe_wa_process_oob()
> >>
> >> xe_mmio_probe_tiles() does call xe_mmio_read64_2x32() on
> >> xe_root_mmio_gt(). From a quick grep I'm not sure there are other case=
s.
> >> Can you rebase on https://patchwork.freedesktop.org/series/136146/
> >> to make sure the assert doesn't trigger?
> >>
> >> So... although xe_wa_process_oob() is called very early on gt init,
> >> there are still cases in which it may not be safe. At least for that
> >> mtcfg reg read, I think it's odd to call xe_mmio_* before actually set=
ting up
> the mmio regs per tile.
> >>
> >> And just after writting the above I noticed the
> >>
> >> 	if (tile_count =3D=3D 1)
> >> 		goto add_mmio_ext;
> >>
> >> uggh, that neeeds to be properly refactored, although doesn't
> >> invalidate the reasoning above.
> >
> >I got this, better to have check for future as well. With rebase do we w=
ant to
> get your patch merged first and then mine. Or you want me to send both as=
 1
> series after rebase?
>=20
> I did that patch because I was not sure if it was fine to call XE_WA() wh=
ere
> you're calling. So first thing is to rebase this patch on top of that che=
ck and
> test to make sure it's safe. If it's safe, then we can merge both, otherw=
ise I
> think we need to postpone it until we figure out a way to move the oob wa
> initialization earlier.

It asserts,
[  778.229096] xe 0000:00:02.0: [drm] [drm] Assertion `(gt)->wa_active.oob_=
initialized` failed!
               platform: LUNARLAKE subplatform: 1
               graphics: (null) 0.00 step **
               media: (null) 0.00 step **
               tile: 0 VRAM 0 B
               GT: 0 type 0
[  778.229121] WARNING: CPU: 1 PID: 1567 at drivers/gpu/drm/xe/xe_mmio.c:13=
3 mmio_flush_pending_writes+0x33d/0x350 [xe]

Looks like need to manage init well. Any suggestions!

Thanks,
Tejas
>=20
> Lucas De Marchi
>=20
> >
> >Thanks,
> >Tejas
> >>
> >> Lucas De Marchi
> >>
> >> > 		return;
> >> >
> >> > 	/* 4 dummy writes */
> >> >diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> >b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> >index 08f7336881e3..3d0e0779a833 100644
> >> >--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> >+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> >@@ -30,3 +30,4 @@
> >> > 22019338487	MEDIA_VERSION(2000)
> >> > 		GRAPHICS_VERSION(2001)
> >> > 16023588340	GRAPHICS_VERSION(2001)
> >> >+15015404425	GRAPHICS_VERSION(2004)
> >> >--
> >> >2.25.1
> >> >
