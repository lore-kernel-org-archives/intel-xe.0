Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301B6C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 07:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018F410E158;
	Thu, 27 Apr 2023 07:19:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2E410E158
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682579944; x=1714115944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8+rjv7GF3rim1IpRMPvWrzLQKkkcfGCmpRq8Gs5I798=;
 b=Y9QtSPVOtwPQzDDH5aZMbRSC8G112thjS+DTq0Ihodjyxz1Y7HXCVb3W
 VmF6GbMXxiu11a8iWNvRGaUv0SzedJgQAhzqHBoWOH3Y27uJVXYrt7qdG
 E1ijPak7VeNCEVf89RiyBnbdL3pyPk/3FGFACY2BiSPkak8fou26hv/Q/
 tup6tQTrr3SLFd1qGpxCyFFL2PfxmvR0XqpiIwBFYCb1jJEXbVxkbPJc4
 gRXhSjuB3DenrhsytvtrDHdjYNFyKoIQcsYSHvcHYDJB84/zCu8g0XqrH
 Ai6IKDk+zv17KPVdHmWfn7Z+ouFbZM4l/aOU2MGVgX2lBXSWOXjYPVM5y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="346113118"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="346113118"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 00:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="783612101"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="783612101"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2023 00:19:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 00:19:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 00:19:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 00:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwaVVmilH6rHNc9KjnT7UScIgAjOCQYVfTAdOfINjnh95VYtmJ0rvdnTOlFWbhIf9PSQKxOLcLWXsDKxi0+4ep5iMHNuQYcN352iVAAOCgaep3sJoJo4KFdDJWgoCpcqU1e6JZibLwaATUzydlncBNKMl34fm2g2qLtn9K2ray9pXGCJtq0SN52HYZ9bWdZOXcF1qj7thOlZLISQcBJyX2H9nt81PsoJaCtj7ELMOQOi02dJzUy+zGiHfOnsVw89kvBpJA7CcHxi9Eukix9QK7SqmsuXnH1CRv3ad2FyRWBRkbrR65w5JMDf7fM55OBn4uL70gH6SGDByLyO1diBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDO+S0IfIj0N+NBHKbS0XZZpQSHbN0iYuNFuZQHX11k=;
 b=Ml8QkeJMlGmObIuRqC+LCrIFPeFemy9vWY9/Sh4CWO3Pq99bNnnkiSIF7ofWISQpsmYQdi94SREFNWrjGse3QPCCD/phxt7VRSIi0oj82/Oz5qzFSbE/Hr1PoGaLk0RquU4lZzqusVRnXuVz5nEdQ6o5lzemA5FgIVIX22B24tUX3iaOcZS4UVm+Rfc32KjeVZRjPsb8RevD6ECtqmtYA3UXgU9Gwi6FuLOeo0bpX+JRuLIdpFisAcUy99qaQzmL2yXxy2zzEDVNSrM/KOr5faSobpoufSsd5cLGORFWf38GHvhnmuJ/WXbCK9QMUgSBExYLrUnWHvkS+bKgAEK/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 07:18:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6340.021; Thu, 27 Apr 2023
 07:18:59 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/4] drm/xe: Handle GRF/IC ECC error irq
Thread-Index: AQHZaGl/6ZW0qLE6lk+QZG6iZhPJTq87PqQAgAJh6qA=
Date: Thu, 27 Apr 2023 07:18:59 +0000
Message-ID: <MW4PR11MB7056302470FB353FF3BAFF4BB36A9@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-2-himal.prasad.ghimiray@intel.com>
 <20230424235148.GJ10045@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230424235148.GJ10045@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH0PR11MB8235:EE_
x-ms-office365-filtering-correlation-id: 386f12ea-79cd-41da-9b2d-08db46efaba3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64cCsWFsic0BAn1VOEn9JG2v+TZle01eMcl/euoGR5HmBSxcyuY9eXIZmVFzfmYMFOYlBdW72ni/NMsZJ87mIYEqPmxvIenQ2LNth6uLku++SgEX1GohG/E2Yw4xyT0JS1E5VDEaHNVqGe4qzHZ8WQBHz3SPUlxT52JeSN6vEgftIbeCV/MpAfzAh5SD8viA//0k0xgHJXYadQ5+ENTg2jP88ntc2MYwhHJ4hYn1aLX+TccFE5845W7EtTZRJZsQIqUx0tNaJdjyJFNxXGJsxP7KtDqEjSBR9sz2QIohrvWi7jB0Xbvq+xXDrLkbw30mdvLH4sIkqhWXo+9LCjjtdgXDhXlvWrDprxZ3B43D2Uc9IOeTtSx1lEmhdAWcGp5rFsgz6hmYU/Cvd1lD9Wv3HeolHuCTKfhH4HYNDs3kK+4mn3MYK9aimQNmOMpk+xWQ2CI7N+3cJigZapFvrJnshjh0rf2Ozu7pogMkgDb37w0IiOAJdnW0T2uxyAE5KNgHE6CLeqe5UaDhbJc60mlch3gowIm2Q1QrxR9EHAnBD5mdVwyTFadGJ4xRr15WMGUtVrXDzTNO4Ow4dKSF2b/az7jMIAn32A2GouQN71oMCBM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(55016003)(107886003)(38100700002)(122000001)(26005)(82960400001)(6506007)(186003)(53546011)(38070700005)(9686003)(83380400001)(8676002)(8936002)(52536014)(5660300002)(33656002)(2906002)(6862004)(30864003)(66476007)(54906003)(4326008)(66556008)(7696005)(478600001)(71200400001)(64756008)(66446008)(6636002)(41300700001)(66946007)(76116006)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C6lh+/VnaCqet2+t792lK0xkBnoa8/IUm/vZ4SLGMD1v9KZvpWk2yJejNY+2?=
 =?us-ascii?Q?u6a21h2gwBcomIzyERKz5NtYJUwKQPMI4YFfpfdOc8kXeu9BcMjNI0WlHPeb?=
 =?us-ascii?Q?MkWe4CFqafZwIEWI9HMrQI16sJRlW7uLJx0xkJDV82UQm+oAzljb+KXGu8Dg?=
 =?us-ascii?Q?OW8S8Gs/dH5QF3wt5bh36hYb6TtS+RbDzg3djLG0Sl1MUby3dRpcwkUm4ADF?=
 =?us-ascii?Q?kqG+9OM2j6jl8a2OqOR6t6n+79AptfYBB83Vek3Y9fln3oan8vl8JaC1C/bV?=
 =?us-ascii?Q?HT5B99IygLrTUq0/h/2iZ1LQwyJYP8+qyx7HIzeKgf8Vzgw2pABSB0jFZzqq?=
 =?us-ascii?Q?e6BghR/sOBeUz4kC9GwridAsZX9JLO9J9sdT46FlnnJkj3LnzOmP79jLwx0E?=
 =?us-ascii?Q?PRfsySCh4GoBgJB4XBMs9rvA4Yg+nUmk1FIAsXeVCJsEouKSyx7UKvXGB3pl?=
 =?us-ascii?Q?uG0US9M0xrJN39GrY6BJUvQByegnurcmOEgGHWi2pxtur2Ua9H/SxCQ7k9AQ?=
 =?us-ascii?Q?+gINsi+3VWLVHISsgE20DaY4dwxV1r/gBDCjI0OGpPS5JCo1bZF9J+uZJVos?=
 =?us-ascii?Q?Y4iKLJH5Q6xfM2BUW3IPCXOnoI/axe3Oxuc5wnx9nQpIL4IdVAtfyHBF8R6O?=
 =?us-ascii?Q?l8oRYNm1Bakq3Y3rvcGwr6bBSDlSjlBdP87MBOW6OPhxaZ6a6y5pK06Q1Hi9?=
 =?us-ascii?Q?cMaIU3pWHLD+32kXZawv7/+JW3dGc5P/BUrdWtvO8o4bg3g6BTvv+WK90vbI?=
 =?us-ascii?Q?HjgCGCIhqAu0pJ8iqySl3Jh2SLuMqBeZg/bMuGw/s0u8vO9QmJk96pRymm/+?=
 =?us-ascii?Q?vQmP3SP3zjOTbAIiHgY5NjJ670Uc+EG9x2uWDJqqfm3Nszq7xsOw5ui2H5Hp?=
 =?us-ascii?Q?PNZw9UH0OXn9DQxP7h5RFLgYuo7u30grl1Qj1Lsm/v/moegmsSyNQ8LyXCMs?=
 =?us-ascii?Q?/+/WF8vECfBIBz3CTQKjTNdw7QvRtkzwofoyH19MWdZIoei8UVc1bYDtKF9q?=
 =?us-ascii?Q?WaJ5BmPSGW6+1+zDK56N9SCDE8JLdYtpyrUArGhdgyUjJl8XRiqZOWtYJjsa?=
 =?us-ascii?Q?vu11Subj+2cWZhFtMCrjQxIl+6AkijJin/MGWATrpMcRKEVFHif9zY769i9D?=
 =?us-ascii?Q?/xK5m8p8UVTSLEAdHY84suSMkmJodca8p6fQbNLr/deJscUZ21p0+AR93Ft2?=
 =?us-ascii?Q?yUhBr6Te0E2u1tXiNEsFOaVQcqVTJ2lKGmN0WLqy9ZRgsVvVVhuHeCcjjlIb?=
 =?us-ascii?Q?4OAk07IufaBBIVg/P92Rhoes2st22oRHTAfuExyng8K118lmVc4jHEU76wMR?=
 =?us-ascii?Q?0VqpIGZhkpE5TiI5heV5EgC5QTjYTJWegzQl2NRC2Bz8CZemJlL8wcaCGUFN?=
 =?us-ascii?Q?OavBqkopOkNVyUiVdcg6J8u62ScWVHaWI1nrt9l0Vl1n9RPiAfHqfdA5B7qr?=
 =?us-ascii?Q?J5fFy7priXaS+IixkDeCZVzsTh5M/doQXAcYim7qmzZrqVQ7CS7MO6PdRS8y?=
 =?us-ascii?Q?m9rB1Tpbb4uEc0QlOkPJwFTgWc08RbsnhIcjQZgIte+sOjufVyn/9yaPDKX7?=
 =?us-ascii?Q?5F0tL2hZ/WZXTU3HszMxUnn6HvYqBTGmAttWA0Y14Y5Ho1RLTjCXNlF+uQ9O?=
 =?us-ascii?Q?NA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386f12ea-79cd-41da-9b2d-08db46efaba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 07:18:59.3208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoezghyvIgQDdECVEkalWj1BsXQEwnqZui885uT3G1Wu2kr1/uSnzOUa77HAzl0S2HVtOKCdXUc/7bR3KAQyMuBpsrGRM8cYVTrMOaORDP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Handle GRF/IC ECC error irq
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Fernando Pacheco <fernando.pacheco@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 25 April 2023 05:22
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Fernando Pacheco
> <fernando.pacheco@intel.com>
> Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Handle GRF/IC ECC error irq
>=20
> On Thu, Apr 06, 2023 at 02:56:28PM +0530, Himal Prasad Ghimiray wrote:
> > The error detection and correction capability for GRF and instruction
> > cache (IC) will utilize the new interrupt and error handling
> > infrastructure for dgfx products. The GFX device can generate a number
> > of classes of error under the new
> > infrastructure: correctable, non-fatal, and fatal errors.
>=20
> Nitpick:  Your commit message wrapping is too aggressive.  Generally comm=
it
> message bodies are wrapped somewhere from 72-75 characters per line.
Will address this.
>=20
> >
> > The non-fatal and fatal error classes distinguish between levels of
> > severity for uncorrectable errors.
> > All ECC uncorrectable errors will be reported as fatal to produce the
> > desired system response. Fatal errors are expected to route as PCIe
> > error messages which should result in OS issuing a GFX device FLR.
> > But the option exists to route fatal errors as interrupts.
> >
> > Driver will only handle logging of errors. Anything more will be
> > handled at system level.
> >
> > For errors that will route as interrupts, three bits in the Master
> > Interrupt Register will be used to convey the class of error.
> >
> > For each class of error:
> > 1. Determine source of error (IP block) by reading
> >    the Device Error Source Register (RW1C) that
> >    corresponds to the class of error being serviced.
> > 2. If the generating IP block is GT, read and log the
> >    GT Error Register (RW1C) that corresponds to the
> >    class of error being serviced. Non-GT errors will
> >    be logged in aggregate for now.
> >
> > Bspec: 50875
> >
> > Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Original-author: Fernando Pacheco
>=20
> Is this true?  This may be inspired by preliminary i915 work Fernando did=
 4-5
> years ago, but I don't think anything in this patch is actually his code =
at this
> point (especially since the Xe driver didn't exist back then, and even th=
e i915
> driver looked completely different at the time).
> We shouldn't really forge s-o-b lines when it isn't actually true.
I agree with you regarding not using s-o-b. The patch is inspired from Fern=
ando Pacheco's  work in i915.
Is adding co-developed-by is right way to go ahead ?
>=20
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h |  29 ++++++++
> >  drivers/gpu/drm/xe/xe_irq.c       | 108
> ++++++++++++++++++++++++++++++
> >  2 files changed, 137 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index c1c829c23df1..dff74b093d4e 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -92,6 +92,10 @@
> >  #define   GEN11_GU_MISC_IRQ			(1 << 29)
> >  #define   GEN11_DISPLAY_IRQ			(1 << 16)
> >  #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> > +#define   XE_FATAL_ERROR_IRQ                 REG_BIT(28)
> > +#define   XE_NON_FATAL_ERROR_IRQ             REG_BIT(27)
> > +#define   XE_CORRECTABLE_ERROR_IRQ           REG_BIT(26)
>=20
> You only use the parameterized marcro below; the three here never get
> used.
Will address this.
>=20
> > +#define   XE_ERROR_IRQ(x)                    REG_BIT(26 + (x))
> >
> >  #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
> >  #define   DG1_MSTR_IRQ				REG_BIT(31)
> > @@ -111,4 +115,29 @@
> >  #define GEN12_DSMBASE				_MMIO(0x1080C0)
> >  #define   GEN12_BDSM_MASK			REG_GENMASK64(63,
> 20)
> >
> > +enum hardware_error {
> > +	HARDWARE_ERROR_CORRECTABLE =3D 0,
> > +	HARDWARE_ERROR_NONFATAL =3D 1,
> > +	HARDWARE_ERROR_FATAL =3D 2,
> > +	HARDWARE_ERROR_MAX,
> > +};
> > +
> > +#define _DEV_ERR_STAT_FATAL             0x100174
> > +#define _DEV_ERR_STAT_NONFATAL          0x100178
> > +#define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> > +#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> > +
> 	_DEV_ERR_STAT_CORRECTABLE, \
> > +
> 	_DEV_ERR_STAT_NONFATAL))
> > +#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
> > +
> > +#define _ERR_STAT_GT_COR                0x100160
> > +#define _ERR_STAT_GT_NONFATAL           0x100164
> > +#define _ERR_STAT_GT_FATAL              0x100168
> > +#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
> > +						_ERR_STAT_GT_COR, \
> > +						_ERR_STAT_GT_NONFATAL))
> > +
> > +#define  EU_GRF_ERROR                   REG_BIT(15)
> > +#define  EU_IC_ERROR                    REG_BIT(14)
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 529b42d9c9af..6b922332bff1 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -344,6 +344,113 @@ static void dg1_irq_postinstall(struct xe_device
> *xe, struct xe_gt *gt)
> >  		dg1_intr_enable(xe, true);
> >  }
> >
> > +static const char *
> > +hardware_error_type_to_str(const enum hardware_error hw_err) {
> > +	switch (hw_err) {
> > +	case HARDWARE_ERROR_CORRECTABLE:
> > +		return "CORRECTABLE";
> > +	case HARDWARE_ERROR_NONFATAL:
> > +		return "NONFATAL";
> > +	case HARDWARE_ERROR_FATAL:
> > +		return "FATAL";
> > +	default:
> > +		return "UNKNOWN";
> > +	}
> > +}
> > +
> > +static void
> > +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
> > +hw_err) {
> > +	const char *hw_err_str =3D hardware_error_type_to_str(hw_err);
> > +	u32 other_errors =3D ~(EU_GRF_ERROR | EU_IC_ERROR);
> > +	u32 errstat;
> > +
> > +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> > +
> > +	errstat =3D xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> > +
> > +	if (unlikely(!errstat)) {
> > +		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n",
> hw_err_str);
>=20
> We should be using the per-device error macros (e.g., drm_err) rather tha=
n
> the legacy macros.  In fact maybe we should be using the _ratelimited
> variants so that if something does go wrong (and keeps going wrong), we'r=
e
> not spamming so much output into the log from an interrupt handler that w=
e
> crash the system.
Will address this in next patch.
>=20
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * TODO: The GT Non Fatal Error Status Register
> > +	 * only has reserved bitfields defined.
> > +	 * Remove once there is something to service.
> > +	 */
> > +	if (hw_err =3D=3D HARDWARE_ERROR_NONFATAL) {
> > +		DRM_ERROR("detected Non-Fatal error\n");
> > +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> errstat);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * TODO: The remaining GT errors don't have a
> > +	 * need for targeted logging at the moment. We
> > +	 * still want to log detection of these errors, but
> > +	 * let's aggregate them until someone has a need for them.
> > +	 */
> > +	if (errstat & other_errors)
>=20
> So is the goal here to just silently ignore GRF and IC errors (unless the=
y're
> non-fatal, which is impossible), but print a message about everything els=
e?
> That seems to be what the code is doing right now.
FOR GRF and IC errors we should log them. Will address them in next patch.
>=20
> > +		DRM_ERROR("detected hardware error(s) in
> ERR_STAT_GT_REG_%s: 0x%08x\n",
> > +			  hw_err_str, errstat & other_errors);
>=20
> For correctable errors should we even be printing an error?  I thought
> correctable errors were basically something the hardware could clean up b=
y
> itself and there's no impact to the user.  It seems like if we raise DRM =
errors
> on correctable errors we're spamming the user about something they aren't
> supposed to need to worry about?
Hmm. You are right. In case of correctable error should we print warning me=
ssage instead=20
Of error ?=20
>=20
> > +
> > +	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat); }
> > +
> > +static void
> > +xe_hw_error_source_handler(struct xe_gt *gt, const enum
> > +hardware_error hw_err) {
> > +	const char *hw_err_str =3D hardware_error_type_to_str(hw_err);
> > +	unsigned long flags;
> > +	u32 errsrc;
> > +
> > +	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
> > +	errsrc =3D xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> > +	if (unlikely(!errsrc)) {
> > +		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n",
> hw_err_str);
>=20
> Is this actually an error?  You've wrapped this function in a spinlock, s=
o if
> there are two concurrent entries to this function, the one that winds up
> waiting is likely to see a register value of zero once the first one clea=
rs the
> interrupts and releases the lock...
Register bits are R/W one clear and we are writing value which is read, hen=
ce we clear only serviced bits.
>=20
>=20
> Matt
>=20
> > +		goto out_unlock;
> > +	}
> > +
> > +	if (errsrc & DEV_ERR_STAT_GT_ERROR)
> > +		xe_gt_hw_error_handler(gt, hw_err);
> > +
> > +	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
> > +		DRM_ERROR("non-GT hardware error(s) in
> DEV_ERR_STAT_REG_%s: 0x%08x\n",
> > +			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
> > +
> > +	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> > +
> > +out_unlock:
> > +	spin_unlock_irqrestore(&gt_to_xe(gt)->irq.lock, flags); }
> > +
> > +/*
> > + * XE Platforms adds three Error bits to the Master Interrupt
> > + * Register to support dgfx card error handling.
> > + * These three bits are used to convey the class of error:
> > + * FATAL, NONFATAL, or CORRECTABLE.
> > + *
> > + * To process an interrupt:
> > + *      1. Determine source of error (IP block) by reading
> > + *	 the Device Error Source Register (RW1C) that
> > + *	 corresponds to the class of error being serviced.
> > + *      2. For GT as the generating IP block, read and log
> > + *	 the GT Error Register (RW1C) that corresponds to
> > + *	 the class of error being serviced.
> > + */
> > +static void
> > +xe_hw_error_irq_handler(struct xe_gt *gt, const u32 master_ctl) {
> > +	enum hardware_error hw_err;
> > +
> > +	for (hw_err =3D 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> > +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> > +			xe_hw_error_source_handler(gt, hw_err);
> > +	}
> > +}
> > +
> >  static irqreturn_t dg1_irq_handler(int irq, void *arg)  {
> >  	struct xe_device *xe =3D arg;
> > @@ -382,6 +489,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *a=
rg)
> >  		if (!xe_gt_is_media_type(gt))
> >  			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg,
> master_ctl);
> >  		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> > +		xe_hw_error_irq_handler(gt, master_ctl);
> >  	}
> >
> >  	xe_display_irq_handler(xe, master_ctl);
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
