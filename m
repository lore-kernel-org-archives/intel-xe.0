Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B31C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 20:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B78610E3BB;
	Wed, 29 Mar 2023 20:16:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B3310E3A1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680120992; x=1711656992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A05mH0nnjTUw+Uzeo3gmlv+C0mc9t9+QJjpX4VJuyx0=;
 b=fdN4T94yG0vaLvE+Y9ngbi2c9FcjROs8s4lOPZr5m10EjGsg74tkU/x1
 GRT0uKbu2H+iNnwGgcZt1jjV0LaLy1uO6MPne3fs6sWSQuW1XhqUpT3v/
 kG4o89oeTpuQTS/ZXd8OYMLx8aYEUMzGn2+L/KrKO2Nrx34BrUGGS5D7r
 /1/ubQTFy4fWpN7NLN2xqRzRjC5Oe1trDJSa/SMG4mwULrV4xeuLA2BpU
 4xFHP+R5gCJ8wyCFHB6ziLZ9TyLjuics/8XnSniAeduJhHlj8yu1IC9yw
 OMOwa/+LQ58mYvqnYl0GPOYyIISFPLShtKmK9ouKlDoW+qEOQJRY54sEX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368765455"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="368765455"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 13:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753739215"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="753739215"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2023 13:16:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 13:16:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 13:16:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 13:16:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 13:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaI6n/hi1kK501ROP07RifexzD4NSJyi43S5fMHKld3ayMVnxZAkpVRTs4rJfzNQRZ51qDySoxmZ6+wfbq2D1zvDgZd3hS7+neBinQyNmzAYNpDBw/W0WnWcWHRwytmKw92ygwqonYpP995t6A9jtgXC3KX0geUUu5WVTmhFWYTQTgUXboh4GvFbq/UYBj/fORwa3hB3JmKCbkqsCkyG5i6xcVV9V/T3/Q403wTS0ADRPa+Mkwv2yZ9lCTjePP4kFPR7xj6PkD4UFivzaYeojasyhZPt9XioDpwrGNz5HMctTyheNnnSCuBQBW5Cg/9rx95xJlfh5Ix6gwx8koOpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKo+VVXY8QHPDicYjQfLnHUEtEWgNL+EmTUB7EkrOv4=;
 b=DXze/IJ8kOyywo/qqlwiHCNP+QBIeAn1ulKqT/zOkpYk48y7RoJCBXDYAX1ifZAN8E3rCJUFxUMYO6FYBOADS/qSEqH0RXgEtFwIvZTEm60lpoLKfQ0kfJP1xtscCR6inCox8XWyKVC8DCjIBMKjCO6uVC/KriL5R0Z2168MwRTiobFaQwAFgwkQoun5p7twiKjhEHhymMtQLVtdSoqmYhjczZs7IvdUxhz/fic2SqQ9Ku2tlSVuDUzOEbhmuj4fXEHZDtFMgrvf410CYJWOUF5ZEBLsRGaEDwIhr8rIZlvEcbc/7yUpEzbnKZC0yh7BWglzuSRtsHX1ElpX6QxGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Wed, 29 Mar
 2023 20:16:29 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%8]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 20:16:27 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
 if guc failed to init
Thread-Index: AQHZXdpJTAsK2/AuE0m/FE6dTpuzua8I+4KggAEgeoCACA1tgIAAAG0AgAAP5ICAAACUQA==
Date: Wed, 29 Mar 2023 20:16:27 +0000
Message-ID: <CY8PR11MB6940CABEF01845BBBFFB206BC3899@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
 <ZB3Mn1atvjMFK29G@intel.com> <ZCSN356SJZFVB7w6@intel.com>
 <CY8PR11MB6940B98AB197C6940808DED4C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
 <ZCSbjyHInE4wkKQ9@intel.com>
In-Reply-To: <ZCSbjyHInE4wkKQ9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|SA1PR11MB5923:EE_
x-ms-office365-filtering-correlation-id: 0450bd1e-fe33-4ec7-2461-08db30927a05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m0kKLFWsswIefLEvhhIruIwTmmVQKOdK9kM/boHQOLsGj0pTlKCWxbsqji4ZlWc43yc3LjvzvClIFFAhGI/M8zdjPw/xiQ+U3O/dhDFu58BEQyB/3Udz2lV0Ll7cGmc769UEP8k+lT4gwtcVaUJq1s6gCSJALH7cG0muFlSjgIm6o/AArceuHW9e7t2p1fRNPx34mX2/RuMTlaZKGPiGjhGtasRcVXD+vj0crbVNiYNswwrdRda9WHWnsrpVOu/gUA48v54vVfinkbF5+jt8fDx8CmjjMcWkluPQSTS5wCG/ioxyMoKjAr1/f0ZGmdsQEPCgG4q3TBCOBO8+/oxxISyLHEIymRLXIjnI7ZVnoESiF8UYWwP+4Hs0PlC1pCR0VIQfbCRxPDky+jqSj2SYY8IU2uGCYeb10DsdmxCbpmrZHmauW8rv7WESpDO33qDuthX1w1Qj5RgvmaBoX3WX+P3hqsctQ8ZANAC9l0IW9hoWopfOebSZQPwVFgn5uOKtLCg7W7C0pirMw1StDIM7DNPoGt+V6y4glFCWtxNFJD8mtcNpP9o3PKPevHay4kxCsvzU8t0GfvifAE487Ysy2aNCWXuoy6jQe+OUuDUvA93id1g0l6b2B1uWSdVaEEfA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(38070700005)(71200400001)(86362001)(66476007)(76116006)(64756008)(122000001)(66556008)(66946007)(186003)(6506007)(66446008)(7696005)(55016003)(6636002)(4326008)(316002)(478600001)(33656002)(83380400001)(8936002)(9686003)(53546011)(26005)(2906002)(41300700001)(6862004)(38100700002)(5660300002)(8676002)(82960400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WEd7UQs5tyxZyECnmBVLmPy10Hm4RMuc2AsHDU6inCDDQJI/0R/Cfcpo7StV?=
 =?us-ascii?Q?G4pdywE07RniCI7BZwIDbjEib90iocK4KfpFVYSHSREDb4m+QxPFWxv0WdVG?=
 =?us-ascii?Q?SxrBHel2Tt4ITw/gbgzOEfgOGRAEWBNsfgdFTE02iVvPX9oc4YI7/KPTDaTv?=
 =?us-ascii?Q?s0hXN8xIlBEuIjNgmo3qJt5E8lvcf1/wQEeFZY4aR88k/vstz1QO8T9xqskB?=
 =?us-ascii?Q?S+0xX+O/8dL4ml2+FWbq2JUcgMlalP6xC51nebyw/AoBJEtJWTrWFrUNoLG4?=
 =?us-ascii?Q?SHhyV6zuy5x47mms7ouoYT4pukwLo0JJs5viv/rtYgI4HyRtI1+VMSqBb7+m?=
 =?us-ascii?Q?QiSOpfvvwAMC5IaALdXCujQ2G0R7iotXTqmywiZqUy6az0AGXpxT5PBxdB5q?=
 =?us-ascii?Q?ENNkzaqVno15kxsiSEuSKJ61iACM/8P9ydxge4lr/+hr8TPrryqaWoRRiarM?=
 =?us-ascii?Q?3mip93Ou+AXCR/hEBrfvTDq17pug+dAB3qrxnp08RUfk1E2T7qg3g4FfNOXN?=
 =?us-ascii?Q?eCoT3l7ziPvh0rrprkQeoAPzaI+5hGsh89t5tm2Rk5sKW2xMPmTCNjkukVoH?=
 =?us-ascii?Q?mRi4kCUQAn22YfDJpX335ZFngzi2AHNwoJV2KNwO7n9X/ev+QvSYN5uIMw8H?=
 =?us-ascii?Q?TajwqDYnQuYfb4e0TvE51eWomHTsjQAXCCMtYFeNaFgWmJv4cv/4VN6urUws?=
 =?us-ascii?Q?RzwBjEpKA7DU0/YFmHLHmVyKoTV0fl3xpoxIDScLySdI+UEFxBCn5GAlqSrc?=
 =?us-ascii?Q?26Y1xfmELo2vBP8uuWoHhtSzezkvACiPjNDc3d1JbJU4N8geQROVbxDHLIt0?=
 =?us-ascii?Q?mkYb5PpkaZmHG3TQM2wsTKoIBZlAs9EB/KRxaewmZBFV86j8HbyKK/Oqqx8C?=
 =?us-ascii?Q?seqpZmYWbgtLK5XT04rFxZZEt4Fxof8v7eqO++JQUT4tRobnIIpG2JRYWbVf?=
 =?us-ascii?Q?kmrWixm3c/La+G0+lFM+h2XIP+UmYl0o2Ez5MwJYBYwCqW2sIbNBdlbS1KsY?=
 =?us-ascii?Q?lQ/EmuFcHlN58yZN7XkXm/ZfuY6W29VnELwdS4GOzbgZGfPmkIu2qpAHwPTo?=
 =?us-ascii?Q?VUhYVXXzZfzvgk7Fu4XeuexyWrGUFTAMH/BzmLLHbm4AgQ4KD5c0i2sa6VJy?=
 =?us-ascii?Q?PfXYeBFxWOjcY+PMmhYgpKR7ezU3LrK9lz0VgE8bZWTNMH9thxQ5fZGVfxjm?=
 =?us-ascii?Q?q8PB7snugIfHllL594+3PwDj9cCZUR6gDY8Suf+Ah0Lt3tTX7+NEyXMSprXS?=
 =?us-ascii?Q?oRFaTvQ5BXMlO4RmbWGuhPWMtEjrxyJ/A3J+ksLzECC9G7NqIN12rnJGc6ty?=
 =?us-ascii?Q?oyJhziHraSteqA1qb0Vy7GBqGAYZSn6zY8VA/irtaOP2ul/IQildDxBWIjMf?=
 =?us-ascii?Q?7JWd7VJKUiPKWa5qiW5Deg8pbzS+xg85umS8Yg8FysGRm+SBM0murHeiLjjN?=
 =?us-ascii?Q?TfEhQwg4d5Mo//AkmmnEpoC83COHbvOzrlhHeR59fTZt+D3Ordb/KIVFDfGR?=
 =?us-ascii?Q?8v7DAYoxR1ZPMJu/iB35bWm/Wa8krSUVBdOsnm/BCM1RMkVaG7U091tfSUG0?=
 =?us-ascii?Q?TBVvi3qTsmvva8lNt5PvSHrwe1EWKU24oW9RKdv/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0450bd1e-fe33-4ec7-2461-08db30927a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 20:16:27.3569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9EJrX8jnIoB7yLYpTmH/0XzBtcSeYR2tCYnceZUVtDRLz/tQOLGsx3wqc8QGrJC0YghB7L2mtbA5AqLgMPRrsGePHDFf8Hi1A3NE2NbeF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, March 29, 2023 1:12 PM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist =
mode
> if guc failed to init
>=20
> On Wed, Mar 29, 2023 at 08:00:35PM +0000, Chang, Yu bruce wrote:
> >
> >
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Wednesday, March 29, 2023 12:14 PM
> > > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to
> > > execlist mode if guc failed to init
> > >
> > > On Fri, Mar 24, 2023 at 12:15:27PM -0400, Rodrigo Vivi wrote:
> > > > On Thu, Mar 23, 2023 at 11:08:58PM +0000, Chang, Yu bruce wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > > Sent: Thursday, March 23, 2023 3:53 PM
> > > > > > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > > > > > Cc: intel-xe@lists.freedesktop.org
> > > > > > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back
> > > > > > to execlist mode if guc failed to init
> > > > > >
> > > > > > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> > > > > > > In general, this is due to FW load failure, should just
> > > > > > > report error and fail the probe so that user can easily retry=
 again.
> > > > > > >
> > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > > > > >
> > > > > > I have not tested this but assuming you did:
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > >
> > > > > Yes, I tested on PVC and it used to fall back to execlist mode
> > > > > and constantly print out EXECLIST_STATUS. Now all those are not
> > > > > showing
> > > after this change.
> > > >
> > > > But now the entire execlist code is bogus.
> > > > We should remove it entirely or at least add a parameter that
> > > > allows that to be selected.
> > >
> > > :( My comment was entirely ignored and the patch was pushed.
> > > Well, I complained about dead code...
> > >
> > [BC] I was thinking you were discussing to remove execlist completely.
> > It is hard to make a decision in the code review.
> >
> > There is a "xe opens" document, I will start a conversation there, and
> > will @you as well.
> >
> > > after removing the fallback we need to either add a paremeter or
> > > kill execlists entirely. My preference is for killing that entirely.
> > >
> > [BC] there is a module parameter "enable_guc" to go back to execlist
> > mode
> >
> > > But also I just notice that this patch actually only does half of
> > > disabling the fallback.
> > >
> > > When fw is not found we still have the fallback in place:
> > >
> > > @xe_uc_init:
> > > err:
> > >         /* If any uC firmwares not found, fall back to execlists */
> > >         xe_device_guc_submission_disable(uc_to_xe(uc));
> > >
> > [BC] the xe_device_guc_submission_disable(uc_to_xe(uc)); and comment
> > should be removed, can you please double check the latest from Xe?
>=20
> Please accept my apologies. I was in the middle of a rebase+build when I
> checked.
> I clearly need to setup some workdir here on my xe dev environment.
>=20
> The only dead code now is the xe_device_guc_submission_disable() itself..=
.
>=20
[BC] correct, there is a moment I wanted to remove it.;) yes, this is not u=
sed
anymore.

> Sorry,
> Rodrigo.
>=20
> >
> > Thanks,
> > Bruce
> >
> > > >
> > > > >
> > > > > There is still other unrelated issues during
> > > > > __pfx_ggtt_fini_noalloc, and need to be fixed as below.
> > > > >
> > > > > [  223.839894] BUG: KASAN: null-ptr-deref in
> > > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.847211] Read of size 8
> > > > > at addr 0000000000000018 by task systemd-udevd/566
> > > > >
> > > > > [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted
> > > > > 6.2.0-xe+ #4 [  223.864921] Hardware name: Intel Corporation
> > > > > WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140
> > > 03/03/2021 [  223.877365] Call Trace:
> > > > > [  223.881707]  <TASK>
> > > > > [  223.885658]  dump_stack_lvl+0x5b/0x85 [  223.891200]
> > > > > print_report+0x499/0x4aa [  223.896690]  ?
> > > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.903268]
> > > > > kasan_report+0x99/0x1a0 [  223.908683]  ?
> > > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.915210]
> > > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.921621]
> > > > > ttm_bo_release+0x3e5/0x550 [ttm] [  223.927811]  ?
> > > > > __pfx_ttm_bo_release+0x10/0x10 [ttm] [  223.934530]  ?
> > > > > ttm_bo_kunmap+0x11f/0x160 [ttm] [  223.940775]  ?
> > > > > __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]
> > > > >
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > > > > > > drivers/gpu/drm/xe/xe_uc.c
> > > > > > > | 3 ---
> > > > > > >  2 files changed, 2 insertions(+), 5 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > b/drivers/gpu/drm/xe/xe_gt.c index
> > > > > > > daa433d0f2f5..8a436c95591e
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt
> *gt)
> > > > > > >  			goto err_force_wake;
> > > > > > >  	}
> > > > > > >
> > > > > > > -	/* Allow driver to load if uC init fails (likely missing fi=
rmware)
> > > */
> > > > > > >  	err =3D xe_uc_init(&gt->uc);
> > > > > > > -	XE_WARN_ON(err);
> > > > > > > +	if (err)
> > > > > > > +		goto err_force_wake;
> > > > > > >
> > > > > > >  	err =3D xe_uc_init_hwconfig(&gt->uc);
> > > > > > >  	if (err)
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c
> > > > > > > b/drivers/gpu/drm/xe/xe_uc.c index
> > > > > > > 4ccf2b3435e1..70eabf567156
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > > > > @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> > > > > > >  	return 0;
> > > > > > >
> > > > > > >  err:
> > > > > > > -	/* If any uC firmwares not found, fall back to execlists */
> > > > > > > -	xe_device_guc_submission_disable(uc_to_xe(uc));
> > > > > > > -
> > > > > > >  	return ret;
> > > > > > >  }
> > > > > > >
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >
