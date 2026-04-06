Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F088EF4EC2
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 11:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB710E1EC;
	Mon,  6 Apr 2026 11:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xpt60vA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7083010E1EC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 11:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775473490; x=1807009490;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ng+idA1ypgL1iHoSi3GNy0MNNQAL6AtpyZcCpCOUTYw=;
 b=Xpt60vA1x9F9fa1RATabxJMxskUJRUw/xx+IdIGsI4wcWS5iYXTLnrfZ
 CnMgw5qAgY3rqH0dGmDVMqCVd1DdPBrCmPgIhRjhgVUhA4o3gklHsawhO
 iV6N+C/UaEonWPuFp6yAm4/GI8xWk9OMLlfTPtrLuder212la5DC0nwDl
 GiBl5uQgUhAqEfwqzjT8FmkUNhttVTB9bDwdywJFrg5siIv+a5fw9vI/q
 7XjyMfw/3EmfTM4qcoyPKzNuaYUVPPPjfM3kksPaYj+jrxPoF7hGxv3oz
 /DDK1IEk1Z+LhdrYgM6VEhaA98YQxvUgPZgOVWc5iQ4CPADnUUCGFm6Db A==;
X-CSE-ConnectionGUID: bny2WwO2RcGLAeBPnNVRCg==
X-CSE-MsgGUID: HXDVvCSCRYmmCYCPeOPr0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80308741"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80308741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 04:04:47 -0700
X-CSE-ConnectionGUID: 4MLcFEnPTFWj3eoN3ER7gQ==
X-CSE-MsgGUID: 5QLjy5aKSEO04iB1Ff9mfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="229505958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 04:04:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 04:04:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 04:04:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 04:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrL5yaScEdrdfkA/KWsKLi9ni/uAByVXlZKO+tmx7vmE2vAVkHm4hvFz91c2eMoZKzHhIs/olJ1LK/1CoOeOEz4aeTns7OEgQeibOAEvVjzCxTQ5abXY54uhvgLASJl2S7ErDqY8RqxTxS6PF482F2/h6nGR8VQpYX2hj9hi0vAsF1NrGHPAeYs1YddzIwdODj7nAfRU3zo/5n7O/h/Rw4lZFTj6auSP6peI8g6s7bQp9jUpVifcrf0468e8P01W5/D+pZLPz49BSFQIXBWNob8dewSXGf4gWQS17jW0YDVxYU7HFkWimZLGeATrM+o1N+60Kyy8HveM+GrX7/Ko5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFKHVUbYjVoyzJ7J5/Me/ZLPhIJS7+dg+wL+0wEbd6w=;
 b=NIsiYkYj8LV8/4Md9tCJtS2IOBtff7fYPOvlPnotlyTgPnN5Qp+psybG6DSo+3RgvEwIbRy5ohZkCTZ3jxOi0kGiQiHKLN6ZRSdjxTkvvowVcd6k1gFNoMonG5gN6ReXYW8iCoW4HUaP4vgCGekWPHix3OANi0SZe8baAQ85/z/YbcG9yD2No85GyFu17izbtIsHGGobBOSyy5AGjArG+2UoV6JUFn81/OUhoLwxOaSvjKOOZu9bkLl+SzQtS0/Th1aaBVn3Eo1p6JclQkkdBs2mPcbJp2f9Of0eDJGhZ+wFnepMU5qUZbRVUNiP+EDpufxGmKq9Enz21kESVXHtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 11:04:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 11:04:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Thread-Topic: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Thread-Index: AQHcvd+9jochD0AeNEGHbOaTAZjuPrXK6qGAgACaK5CAAMQKgIAFo95w
Date: Mon, 6 Apr 2026 11:04:42 +0000
Message-ID: <SJ1PR11MB620461FC984C7CFA6980E35B815DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-10-tejas.upadhyay@intel.com>
 <ac2wu2u5wNhkmzx9@gsse-cloud1.jf.intel.com>
 <SJ1PR11MB6204361A01C00EABBEB1986D8151A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ac7WgTPbXAwAPibW@gsse-cloud1.jf.intel.com>
In-Reply-To: <ac7WgTPbXAwAPibW@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7358:EE_
x-ms-office365-filtering-correlation-id: a0c13ef9-c282-45a5-0c53-08de93cc4e3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: HxUhcN+xDF4Uzoi/UlyC0ZKUK2rv0KqTkp3eXCe+SoY/3SZ5Lx8BXDlLsa145mdwpNL522HWUnqqxKukpXhkV8bxiiJItmCutJUv4FWLasllYOyGA1MQiLwwvfH2o9eB3D/nkdnqPIueEd+ZzdTf9N+4oJ9bLQFUGVcUPDq3myQ0tnjNCgaTBOBkhAoIAcFaTxP3ynC66XJUQPjzKZL+2ekIrZ0D2KZbvjJEODJuh2lHKoC1n0ySDDPO8DmNhhj9JVf1FlKkQBz+ZQolotI11rWvofv0vyUzMnxqkEzwv0rk3HLc2l81YmrB+Kg4XPIoBxg53+s2NxEvQKtTcMtHNa6oV1C2HUfT1WPM3nYjNYGE81s+VaksSuuVvajUCqW3nZ+raMrIhxJXLzJUfpAzfLLzio4zpX5wzS5qCU+WR0FgBZpUF5iCYtuqIrHbWeVm0F67LRC+in8oqAiJmmasgL/Mi0Ao/OvNd1AXXmW6eO84jYfjfNmOO3WglpQR/BIvkhBkBF0VceTmdWS1yznGJrvWGQ/I1HwqPHth5se48RgwSJf1xnsAgTyOhJxlwERxyI4t3XqwztKHpFxoDqOwu0EHM4/PFn7d8kbwU69j7mZv5WUAu7KouFhRSEXc8ClTCWPVDHpiMfBCOmggicx+VFOWt1pli9vQesXYmJkNnI47lIZ7242T0pyDpANoibH9lxH8Pmf5lKXZGxj1eNgu1ydlCL2mFmGAoXdXqgOagkdUevbbbEBKCbOpjSSkT9NXMSqh9UfYlgItg4kZrWXSTu6I+VGpIyGAtjTFArFCtrs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mzUyr82jp1zT4c37XUGvIPf+tNIbB4oORa1bVZyEjtaRL/c++EU0DVNUIKHI?=
 =?us-ascii?Q?7l1oZLDlHMIlu35cWvxloJk9MLNpHkN3eQiaNYQRLxFhOBEhNiITAHrK0NOx?=
 =?us-ascii?Q?bAoNDF9cys4oieefR+snrnIsITtUkPDsqaLdT9iNkOhtNnyl6qt05VJCi+Vv?=
 =?us-ascii?Q?oNO5kC79PqWPRGHukiHNpJPq5EuFhBNLdJl5FSj5PrPGhelI0YIR8LcCqZWb?=
 =?us-ascii?Q?q9Z5KLAB+bPPrh4308oo5Ygpc+/rWjqpW+1+D9tqKhR7JeSdqv6cBnClv5jS?=
 =?us-ascii?Q?MABaAyi/sJu27gnzUUjkQY9H7fLIRmEnKDht0/gj0u9logrBSlj93x1XZdxi?=
 =?us-ascii?Q?aI+GO9ah1AL4+GFkKuDCc8NVGnloNkYm3EamHGdCOBediWvfhxsDPHV2F2ob?=
 =?us-ascii?Q?6TjDjcs5iMATsAjewfnnLxkY7TtvZA2nDFm6ef0ceOmInAj3wjFA8aXwArJP?=
 =?us-ascii?Q?6uFVWAoWvmSFjer1p2oJryU5mcwatNXaBhcvxgyz3LYsCcakSLz83s25Fe6Q?=
 =?us-ascii?Q?E38d4MK7cWlSNMGw+vQbYyYm3w5FjNLRhX7v8CJ0WwrZJzVY8Iyh+zuaAv5T?=
 =?us-ascii?Q?UF6HsJ8WIoHd9j5qGFJ3HUKAuSiJyhoa0kvqbEAABUEn6pRd4vLwfGrS8KGP?=
 =?us-ascii?Q?BinnDGWxFWhbHhu/Vjy50ECX7mR9BaUv7a5EbFuXy0MLfA9f/w2Z0e0WFoeX?=
 =?us-ascii?Q?eWO7ki0L/pMklOpsmfRbvHn9YigU8g4iBTbe6sqGq0lMCB5DlSocMHUCjPWd?=
 =?us-ascii?Q?PCxK+PHSaIafgMheDrot6th2KwlV99fHUJ8m2gpT5NlFnWySsBsQAakRz26H?=
 =?us-ascii?Q?ad9akWzROT5nGY8/iC26Ft/BbYCGWM+dlh7/Zlj75C9F1jS+d9QWwf2zcsaw?=
 =?us-ascii?Q?Wy0d2TqDNSOt84EERoJpBoNyMnuxRoiTLuV5dbLUFbUANEb6rzI4E4q/c6Gi?=
 =?us-ascii?Q?c2N4TgBNTO9KQbfFU6Ckt6VjWg+mojVg3JQSmD/p7VDJrtJOPQW7coIYUdKf?=
 =?us-ascii?Q?w4xHP7ZS+tvunJZBeU2LnUZ0O2YH9JV5qQ+lsaiikAg27I8XEncsvSsNUidw?=
 =?us-ascii?Q?4k3OFLXhA0DAI/JkvyHDNqN/BE6DaKB+f/treiRIxqnorxnqoFKMNQOHCTJV?=
 =?us-ascii?Q?ZQeADhz4U5GTYHnh3VxLfDGKHDlccrJUX203Db9knPauIbS+qqFtZWV0XL/S?=
 =?us-ascii?Q?eYf7IqAaRlL6VxQkidHSui/tq5FKyUIr4O/R2MHCaLdr5RdImIHSmfQDgyYf?=
 =?us-ascii?Q?PkQZQ5K+Pr6FsTo2kiUQBM3gMMgz2U63bgDvyaDcLm8gClc8apb63yMxLTn2?=
 =?us-ascii?Q?+5Qdh+frPF2vS7K9sCjKwgYRJH6ipN/Ic3T7GgcGlP8IIbszGMgL4JGOhczF?=
 =?us-ascii?Q?VBtGDdSw4pFlyS6V2V44F/L9y9dy4HM3wmx8pr0uVCDz1U0Tu4oIJ944IVTz?=
 =?us-ascii?Q?8sZPYb8rdC+LujQOQXiiOOVRKWqa0Pu2pnenD1v9lKAX9nLCcZMKtifua4rT?=
 =?us-ascii?Q?2oXkPhd9OHx46m1yQNdu+zTqk/DoP4VZoJzpCeBEYTrvtfYqJ+iqLu6bmIPt?=
 =?us-ascii?Q?As0pWGyWfA1NeczleXmXcTdYt+0I0ZtrRg92NLjqA7MbeKfeZOSOpYb09+ht?=
 =?us-ascii?Q?lNWjC3xNOKW/Ynmk+MPZiQYIPO0XwFf5Tf61I58PtzoCXlMWej697M71vchX?=
 =?us-ascii?Q?cL6yhiRsyMO9Ao8jDINjqWN909gR7XO2Ny2hCsk6ytn5hdc/j3t2ib3NAqEb?=
 =?us-ascii?Q?XO8HkQOIuQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YVugZbopaCk6EzZukltkekshKIjDV0WpT19FDrvdobrFhLvxn+1bpivJuocSB2pUF/dGqqnQzA6cDsbilb/I6C1USS8DMQMN4Tsgmbluwqu8mN+5ON2921z6m6BH2x2KFgzHChEaHDGMWbLnOBgqfTSm5n7KZHBUJR7AkAD4I40qcCEPmgUxUT9r9gRk0Lz1lVnJQMGFxrp+I78MbywaNdA1v7dW26LFz2HKwNe05tSe1R0xk+994Q+U1w3pUAIvSNbSaDvtmCNlCZHov9apbRBqnWnxhR6qlVVSyluWUcX55PmF9ha86ZlN4b8q/cazAO/XONUU41dN85fKZRNM0A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c13ef9-c282-45a5-0c53-08de93cc4e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 11:04:42.8070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhmNu04sg58B+om/dOrPI5GvxB9pOiiXF9IeqqK+Q+sEH2qu8J8F4oUlU3YXOGnQp+SWPPb0LMMwr5/MDHgR/e9oAjuOsDMtvjHOcwnwgpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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
> Sent: 03 April 2026 02:20
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
>=20
> On Thu, Apr 02, 2026 at 03:10:02AM -0600, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: 02 April 2026 05:27
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> > > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com;
> > > Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu
> > > buddy
> > >
> > > On Fri, Mar 27, 2026 at 05:18:14PM +0530, Tejas Upadhyay wrote:
> > > > Setup to link TTM buffer object inside gpu buddy. This
> > > > functionality is critical for supporting the memory page offline
> > > > feature on CRI, where identified faulty pages must be traced back
> > > > to their originating buffer for safe removal.
> > > >
> > >
> > > I just checked the SVM code is still setting 'block->private'.
> > >
> > > I thought we had patch for that but I don't see it in this series.
> >
> > Yeah, you are right, it was there when I sent earlier revision, I someh=
ow
> missed adding that patch in this series. I will add it back in next revis=
ion. Sorry
> for confusion here.
> >
>=20
> Also free to send that as indepent patch as we should be able to merge th=
at
> one whenever.
>=20
> Another comment.
>=20
> > Tejas
> > >
> > > Matt
> > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > index 5fd0d5506a7e..c627dbf94552 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > @@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct
> > > ttm_resource_manager *man,
> > > >  	struct xe_ttm_vram_mgr *mgr =3D to_xe_ttm_vram_mgr(man);
> > > >  	struct xe_ttm_vram_mgr_resource *vres;
> > > >  	struct gpu_buddy *mm =3D &mgr->mm;
> > > > +	struct gpu_buddy_block *block;
> > > >  	u64 size, min_page_size;
> > > >  	unsigned long lpfn;
> > > >  	int err;
> > > > @@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct
> > > ttm_resource_manager *man,
> > > >  	}
> > > >
> > > >  	mgr->visible_avail -=3D vres->used_visible_size;
> > > > +	list_for_each_entry(block, &vres->blocks, link)
> > > > +		block->private =3D tbo;
>=20
> Should we clear block->private in xe_ttm_vram_mgr_del() to avoid blocks
> having stale references to BOs? Or are there guarantees elsewhere in the =
code
> that a free block cannot reference block->private as a BO if it encounter=
s an
> error while in a free state? For safety and clarity, even if such guarant=
ees exist,
> it may still make sense to clear
> block->private in xe_ttm_vram_mgr_del().

Yes, there is handling for clearing block->private right after reserving vi=
a gpu_buddy_alloc_blocks() in xe_ttm_vram_reserve_page_at_addr().  But I th=
ink no harm to clear in xe_ttm_vram_mgr_del()  as well it seems.

Tejas

>=20
> Matt
>=20
> > > >  	mutex_unlock(&mgr->lock);
> > > >
> > > >  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> > > > --
> > > > 2.52.0
> > > >
