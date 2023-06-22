Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1A9EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 19:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E5E10E028;
	Thu, 22 Jun 2023 19:15:06 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908A310E028
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 19:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687461304; x=1718997304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=atwRnAhV5Q+BI4tw66gRAZmf0qJcWechX3YfAZh0/gA=;
 b=fr0kwtjCFnez4EdjL7+JDLdJg20OhaaTDcxuZRfPPMkQ/lix2y28bXSc
 LYLp6VsisINNTFNWQCkMypRRvG4P4l906vA2fqOsPt6jcws69V4NSJ1ob
 cgq81J+oRBWmQh6xj2WhVEtiisYFVAxYuBPDDGOKvDjLx56vzrd5Gmumf
 G4KmBY45B5LzOC7lo4LLAU4cbVWB85owvi8L7L+yZeLe8vBtuuS2CsLAL
 iFIhgQpTc4mcXe5tIR3YYI1sAIeAQtIyYn8MB15qc+gOnLRJy3vqtU6oj
 O3p8oI8wYuX6mtaG3oCE2tC+yveVtXett1oj7cBippNMNTgmzn88jIOTz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350346167"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="350346167"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 12:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="718216758"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="718216758"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2023 12:15:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 12:15:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 12:15:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 12:15:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsDiok2N9a2XYwWmCxi4LTJdH3o87SwIxN3io0Cry4LtNX77qxxoRm7pFZdmVTqJHEniSAIKDZdZS3dW+gA3zG9B66Km6hwrpkamkw3cDtTds84+Ae1VqaoauBOQ/CI8UCzTuBfjGp5/IDcyByeVd5atfWLpMa+LQWoRZ4TcCO9Ga8zwrT1bfUAlQVEoxemGuQRD5rpRwDHEMUy8QuaXyjNkOawlSpuFDiUnMgGjbf8Va8vICK0VTfalPmibRAXRc33X2VTnNqJQkwAtyXotc0RSI0Qq3Nq57+B2GKLIMPRVJzCe1+CAlVF7pa11SDE+RkBPZfmWREq/DExQ9b3kzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IInmXpVmrE9zSp25EV9cuewXgwAr+fofgX9fvyPzu2Y=;
 b=cTvg3iabm6Bkj6Qjrf63Ng3E+eZzymHyazzy6urE6GAiL+2XyiLWEWrYVWhDzJwX3QCA6pvZDrwXssZHJmINpwxmicmLIn+TvA4imfy02o8u8O9B5BWKQl/QT1ouip3EOtONLZidoE3ojGULx/lAHB/uYAAgVbijYfjx5ogBzPK2XNWZK246PcOkNazBjNdGBIw8zzu0WqPaTr0yYPZxwhaijidrEx/lvmwU7GiiUk1KJjbaa+qV0A5nnAP+SETC6Geew6Tkn7FUgon11KrvFjjLcRjaUtJpMCiTB5aEkJ7TYG335NbKphMAGTfpMosRcxCebI2Mxz5fmpJ0EgDkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 BN9PR11MB5483.namprd11.prod.outlook.com (2603:10b6:408:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 19:14:53 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 19:14:53 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
Thread-Index: AQHZo65XKmLJRtXRWEeVQ19I0PrYNK+UNMWAgAAOquCAACMPgIAAHU+AgAFcbYCAATPvIIAAH8GA
Date: Thu, 22 Jun 2023 19:14:53 +0000
Message-ID: <DM4PR11MB597163D7908B7F0F000C03678722A@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
 <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
 <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
 <oekkd7ikdekbxmqaumvffxxxmgimawic232muweq4c2vgjpd7q@4fkzr5dpx55o>
 <20230621021043.GC5433@mdroper-desk1.amr.corp.intel.com>
 <l5cru7upg7xhoyjfzjn4vkkstelvt3or34i255u7rcygxvfuo7@mekxbs6kw47t>
 <DM4PR11MB5971A53F407E735E54D25FBB8722A@DM4PR11MB5971.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5971A53F407E735E54D25FBB8722A@DM4PR11MB5971.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|BN9PR11MB5483:EE_
x-ms-office365-filtering-correlation-id: 0f89501b-18b6-4490-c047-08db7354f56d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1wUmrvxOMJZD+9pxPHhe/58dwk4M5gykn0SmGdzfmf3wOkioKYtrA1pomb+2fSOft1LRf9joM0rK9dH6+aDcdkJPJWU+0LDCeGF4pqFUABK9soOnKm5Vv+++MkaaLYQhcAeVtO6wdWBtkUxnvsiAIXwsEifkOq1y7ahxBBqw0+QblKaZUgYUvSE8u/4pQ+GK6qGtzJVy+eKKfs0q3k5jwzle5q4M+QrKNnJrw5CdJFzHbT8GnM84xyPzVerqGskYaLMJ2IyYkKss7W91t9us2HNyf+YPt4rV1wkFFEzWOR3uEaKKRw5yXZPTUTyqkfyWoJjuVcAqi6igisnCGcVzWFiIRp+gAwQV1lD9OcedR8quossvwcIoKhY3KPwLRiVaZOKJ8QTC+b4yMxb0T0DVWwhwISxENB+3/mR0/5jMnL3cuPAvm0SQIYUDEhLrBcKoMsIyTjIZA8rCRAcffPoV0PJjY7uAMlkK8gL0aNAeC0UoTet3KfoNT6644FU5LvnHkfcFeUmTpkga9EZS/n0RqSiA6rCWw7bmpTj7W1IVhsKKrPm1os1h3Cemz0gQK0rvMzVSDS95MwQHByowKc3SS6f2H9h3jX3mgAs231T7bjE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(7696005)(38100700002)(122000001)(82960400001)(38070700005)(86362001)(33656002)(4326008)(52536014)(41300700001)(8676002)(966005)(5660300002)(26005)(8936002)(53546011)(6506007)(55016003)(478600001)(83380400001)(186003)(30864003)(2906002)(6636002)(66946007)(316002)(110136005)(76116006)(2940100002)(64756008)(71200400001)(66446008)(9686003)(66556008)(66476007)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EGH1JD+39Aif8+d1e7d5476KS6jnSMM2/wyMDnzjtrIL+7Ccc3Ofvxf8WqJa?=
 =?us-ascii?Q?pP83OFceEQICexs7zqFjUy3YeMr4BYVHxEkMib6asgAqYKps3D48XyLYsr/M?=
 =?us-ascii?Q?MH99psIghsf7l5aonywkRZufq6tV9l9zNxZuxxWLaryA03CfEh/lxK4hr+OI?=
 =?us-ascii?Q?IMaSPPfGCmRmhhuIHd6jrjbce9dyiP8VcuYYX6RnNNGjUR/oPk4Olod/rfHF?=
 =?us-ascii?Q?83rf5Keb/7Ih2ulzX1ChbNEMTE13OE+8ACGy9rEy0ThZ7TV9NO7H9jkmo1oX?=
 =?us-ascii?Q?pOoaJRCDjZlEgLMI6O4NHM02RT+NpVkoIYIXiBxt18pycbY18bW14n8KTayX?=
 =?us-ascii?Q?oow9v6M6/cyVHZYfXfDFk+nF+R9qyfoVr/zeGOdNNRMrp6iA1z4pxOFLGO1n?=
 =?us-ascii?Q?opljrpF+xmsR+B7V01uLaweAVCtvmieGPKTx52uTDgKmFExiCdFG8isbHvdx?=
 =?us-ascii?Q?c+7BHczC+mItTrq0HLf470iZBiRV+xK44xaFVVGPneNnn11m+LCJxH9H5MXh?=
 =?us-ascii?Q?QxvbU1VA1M/u4BkYg+QXVzltRlj1H+A8uWqIhXmZBsUMXCeHayW5U4KCsSO+?=
 =?us-ascii?Q?cdUJR3fM5qQIRizvbKgox+ycNx0NiT0k1nRnai8zWYaLHePFhET/WR/KHxEU?=
 =?us-ascii?Q?UdGCZqhddqCFXtwHQTKBrIKNt1kivNLlXzBKF5N7aD3INMyvt0HSVpODTlis?=
 =?us-ascii?Q?JqrGT5NQDltD73gH1s5Uhh7fSCVIaNxHIBcf6gpRYI5RKt9bEK46BOOWnihD?=
 =?us-ascii?Q?HEQ9g2IbhA4UBG48NfUsIvBlls5DHSC56py2jd2knLT9gfaRrHnaIb7a5d6x?=
 =?us-ascii?Q?e13zJj961ckc0xczyQ+v4yk8vC7UxSZ0Q2E+PRO76kGNAY22pDWB4qB3kejv?=
 =?us-ascii?Q?bZfDCYKrM7hMyLreKdB2zn5Dkp283IZrWy18zvyUwS9eTVtbO1GgJhVEn/p1?=
 =?us-ascii?Q?ZuSe2TzMDVaKBRgQnxSYj9f5asgshoTdjqJo3evnYCaWIP2RGVqehPEkgCtQ?=
 =?us-ascii?Q?JmU2H2j6ZV8nizySUnUd90ERMgT8RzHA7TPI0doenMo0XlXykfXuuHGq7N3X?=
 =?us-ascii?Q?IzLbyxEQJIP3ruNaHroozvKCxRzOJuYHSGTSbDmMnVDUvj6hK1wuFuzbRcVQ?=
 =?us-ascii?Q?uN0cBloQ72EDbjMOO6kQvRKWhv1GNGJby4/U/4pShTmCyWJV3qirnRUvMjUC?=
 =?us-ascii?Q?4ao22maD09icPlgTaPeZX4zR+/cowhSMvBC6skrwoFz42k/KLAinUpbAKSAf?=
 =?us-ascii?Q?gPM+CZDM1LACbAkVq8WPdZ6hP3glgvUCpg7qgmE4l0HtAzeLR1+3nSeau9nK?=
 =?us-ascii?Q?56aQWDcZWB8j4HY53A8415hV8CT/gx7t5dBfUIX2YaM1wPqMkYsNbWoTvUwl?=
 =?us-ascii?Q?GltaBtfrssjDlVo4DKR9AkHl/BEVHDtHs294Hhy7yK07p4HxBgydferZrxJ5?=
 =?us-ascii?Q?h2f2tcZ9oz77dB+0S7nuy+Bt9DE/OblBRfulHxq8pJIrvtuSdX5Kzw1ZMUMB?=
 =?us-ascii?Q?nrmGVwOYhEqfe0or2pkm5XIY2oDmGucb7JXKROU6afEfpv1omSdcCo9y02+Q?=
 =?us-ascii?Q?8MfI1sUTBAC1DLEV+c4BMans731CWnFMkyBxLzwzAPrPH/2hDXY4d6ZP2Haq?=
 =?us-ascii?Q?+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f89501b-18b6-4490-c047-08db7354f56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 19:14:53.4899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hzs27mVF3kzQ8FpoqQY1ZHsKu5o11gs29AxBisIdkCEyWgNiWB2VDg90C6BZXAm53Gmz4G9mKyur6WgQwbOpht0sAZ5sdnzhXm8LXaU1x9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5483
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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

Forgot to add the link below. Thank you Lucas for the reminder

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Srip=
ada,
> Radhakrishna
> Sent: Thursday, June 22, 2023 11:50 AM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
>=20
> Hi Lucas/Matt,
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lu=
cas
> De
> > Marchi
> > Sent: Wednesday, June 21, 2023 3:58 PM
> > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
> >
> > On Tue, Jun 20, 2023 at 07:10:43PM -0700, Matt Roper wrote:
> > >On Tue, Jun 20, 2023 at 05:25:49PM -0700, Lucas De Marchi wrote:
> > >> On Tue, Jun 20, 2023 at 10:38:50PM +0000, Radhakrishna Sripada wrote=
:
> > >> >
> > >> >
> > >> > > -----Original Message-----
> > >> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > >> > > Sent: Tuesday, June 20, 2023 2:28 PM
> > >> > > To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
> > >> > > Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> > >> > > <matthew.d.roper@intel.com>
> > >> > > Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/writ=
e trace
> > >> > >
> > >> > > On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada w=
rote:
> > >> > > >This will help debug register read/writes and provide
> > >> > > >a way to trace all the mmio transactions.
> > >> > > >
> > >> > > >In order to avoid spam from xe_mmio_wait32,
> > >> > > >xe_mmio_read32_notrace is introduced and used.
> > >> > >
> > >> > > feedback given before was to avoid the exported _notrace stuff. =
If
> there
> > >> > > was a justification for it somewhere I probably lost it. Could y=
ou
> > >> > > clarify? If I understand the above paragraph correctly, it's due=
 to
> > >> > > the fact the xe_mmio_wait32() reads the register multiple times.=
..
> > >> > > why would we want to avoid the "spam"? If we are reading it mult=
iple
> > >> > > times, the trace should show it instead of hiding.  If we demons=
trate
> > >> > > there is an actual impact, then xe_mmio_wait32() should be adjus=
ted,
> not
> > >> > > the rest of the shim layer in intel_uncore.h
> > >> > Unless I missed some whaere earlier feedback I received was on the
> usage
> > of inline in function definitions.
> > >> > Xe_mmio_wait32 I believe is loosely based out of
> > __intel_wait_for_register(atleast based on compat-headers)
> > >> > Where during the actual check, no trace version of register read i=
s used
> and
> > just the final value is traced before
> > >> > Returning from the function. A similar kind of approach is adapted=
 here.
> > >> >
> > >> > If it does not make much value like that then I believe we can use=
 a
> > traceable version
> > >> > But in case if developers want to have a stack trace for each trac=
ee out
> put
> > then the spam becomes even more
> > >> > messy.
> > >>
> > >> there was a chat last week about that... maybe I misremembered and y=
ou
> > >> were not part of it.  The trace part should be pretty cheap to be ke=
pt
> > >> everywhere, particularly because it's not enabled by default it's
> > >> nothing more than a few nop instructions.
> > >>
> > >> If we don't trace everything and hide some of them behind functions =
like
> > >> xe_mmio_wait32() or intel_uncore_read_fw(), with no indication in th=
eir
> > >> name that they won't trace, then when we are reading the trace we sp=
end
> > >> a long time tracking back what exactly was happening.
> > >> When we have the complete trace, filtering should be pretty
> > >> easy. Eliminating random traces means we lose information that is no=
t
> > >> possible to recover after the fact.
> > >
> > >I could see an argument for avoiding tracepoint i915:i915_reg_rw withi=
n
> > >xe_mmio_wait32() if that function utilized separate tracepoints like
> > >i915:i915_reg_wait_start and i915:i915_reg_wait_end instead.  That cou=
ld
> > >potentially consolidate the repeated trace output down to just two lin=
es
> > >without losing any information.  We don't have tracepoints like those
> > >today though.
> >
> > you mean xe:xe_mmio_wait_start/xe:xe_mmio_wait_end, right?
> > Yes, that would be good and the non-tracing functions would be local to
> > xe_mmio rather than exported for everybody to shoot their own foot.
>=20
> So in order to summarize the discussions, we can reduce(if possible elimi=
nate)
> the number of non_trace functions being exported, introduce 2 more trace
> points
> namely xe:xe_mmio_wait_start/xe:xe_mmio_wait_end(it should be cheap to
> implement), if we define the current xe_reg_rw as an event class and only=
 use
> the
> nontrace variant  inside xe_mmio_wait32.
>=20
> However the question still remains on the display side. There is an i915 =
patchset
> [1]
> which should eliminate the nesting of trace events, for which non trace v=
ersions
> of
> register read/writes need to be used. The motive is to avoid nested trace=
 calls.
> Though
> in my recent tests it did not cause any problem, I think it is good to av=
oid it
> overall.
>=20
> Can you suggest a path forward? IMO we have to minimize the export of non
> trace functions
> just to be used under other traces(however there is no way to guarantee t=
hat
> those functions
> are not called other times.)
>=20
> Thoughts?
>=20
> Radhakrishna(RK) Sripada

[1] https://patchwork.freedesktop.org/series/119303/


-RK

> >
> > Lucas De Marchi
> >
> > >
> > >
> > >Matt
> > >
> > >>
> > >> >
> > >> > >
> > >> > > >
> > >> > > >v2: Do not use inline for the function declarations.(MattR)
> > >> > > >
> > >> > > >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >> > > >Cc: Matt Roper <matthew.d.roper@intel.com>
> > >> > > >Signed-off-by: Radhakrishna Sripada
> <radhakrishna.sripada@intel.com>
> > >> > > >---
> > >> > > > .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
> > >> > > > drivers/gpu/drm/xe/xe_mmio.c                  | 80 +++++++++++=
+++++++-
> > >> > > > drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
> > >> > > > drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
> > >> > > > 4 files changed, 111 insertions(+), 8 deletions(-)
> > >> > > >
> > >> > > >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncor=
e.h
> > >> > > b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > >> > > >index fae6213d26f1..036f3b963a84 100644
> > >> > > >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > >> > > >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > >> > > >@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(stru=
ct
> > >> > > fake_uncore *uncore,
> > >> > > > {
> > >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> > >> > > >
> > >> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > >> > > >+	return
> > xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> > >> > >
> > >> > > how would you even know that intel_uncore_read_fw() is non-
> traceable?
> > >> > > ditto for all the other functions in this header.
> > >> > In i915 intel_uncore_read_fw and other _fw functions translate to
> > raw_uncore_read
> > >> > And its variants which do not include the GEN6 Header/footer which=
 have
> > the traces
> > >> > included and hence are the non-trace variants. Unless I am missing
> > something.
> > >>
> > >> I meant "as a user of the API". There's no clue whatsoever in
> > >> intel_uncore_read_fw() that it will not trace. I think the selective
> > >> trace/no-trace in random places in i915 was a mistake.
> > >>
> > >> Lucas De Marchi
> > >>
> > >> >
> > >> > --Radhakrishna(RK) Sripada
> > >> > >
> > >> > >
> > >> > > Lucas De Marchi
> > >> > >
> > >> > > > }
> > >> > > >
> > >> > > > static inline void intel_uncore_write_fw(struct fake_uncore *u=
ncore,
> > >> > > >@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(st=
ruct
> > >> > > fake_uncore *uncore,
> > >> > > > {
> > >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> > >> > > >
> > >> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > >> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg,
> > val);
> > >> > > > }
> > >> > > >
> > >> > > > static inline u32 intel_uncore_read_notrace(struct fake_uncore
> > *uncore,
> > >> > > >@@ -129,7 +129,7 @@ static inline u32
> > intel_uncore_read_notrace(struct
> > >> > > fake_uncore *uncore,
> > >> > > > {
> > >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> > >> > > >
> > >> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > >> > > >+	return
> > xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> > >> > > > }
> > >> > > >
> > >> > > > static inline void intel_uncore_write_notrace(struct fake_unco=
re
> > *uncore,
> > >> > > >@@ -137,7 +137,7 @@ static inline void
> > intel_uncore_write_notrace(struct
> > >> > > fake_uncore *uncore,
> > >> > > > {
> > >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> > >> > > >
> > >> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > >> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg,
> > val);
> > >> > > > }
> > >> > > >
> > >> > > > #endif /* __INTEL_UNCORE_H__ */
> > >> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c
> > >> > > >index 78c7f839f783..ef2192a2d060 100644
> > >> > > >--- a/drivers/gpu/drm/xe/xe_mmio.c
> > >> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> > >> > > >@@ -19,6 +19,7 @@
> > >> > > > #include "xe_gt_mcr.h"
> > >> > > > #include "xe_macros.h"
> > >> > > > #include "xe_module.h"
> > >> > > >+#include "xe_trace.h"
> > >> > > >
> > >> > > > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > >> > > > #define TILE_COUNT		REG_GENMASK(15, 8)
> > >> > > >@@ -429,7 +430,7 @@ static const struct xe_reg
> > mmio_read_whitelist[] =3D {
> > >> > > > 	RING_TIMESTAMP(RENDER_RING_BASE),
> > >> > > > };
> > >> > > >
> > >> > > >-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > >> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
> > >> > > > {
> > >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >
> > >> > > >@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct
> > xe_reg
> > >> > > reg)
> > >> > > > 	return readb(tile->mmio.regs + reg.addr);
> > >> > > > }
> > >> > > >
> > >> > > >+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > >> > > >+{
> > >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >+	u8 val;
> > >> > > >+
> > >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >+
> > >> > > >+	val =3D readb(tile->mmio.regs + reg.addr);
> > >> > > >+
> > >> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> > >> > > >+
> > >> > > >+	return val;
> > >> > > >+}
> > >> > > >+
> > >> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg r=
eg,
> > u32 val)
> > >> > > >+{
> > >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >+
> > >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >+
> > >> > > >+	writel(val, tile->mmio.regs + reg.addr);
> > >> > > >+}
> > >> > > >+
> > >> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 =
val)
> > >> > > > {
> > >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt,
> > struct
> > >> > > xe_reg reg, u32 val)
> > >> > > > 	if (reg.addr < gt->mmio.adj_limit)
> > >> > > > 		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >
> > >> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> > >> > > >+
> > >> > > > 	writel(val, tile->mmio.regs + reg.addr);
> > >> > > > }
> > >> > > >
> > >> > > >-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > >> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg=
)
> > >> > > > {
> > >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >
> > >> > > >@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struc=
t
> > xe_reg
> > >> > > reg)
> > >> > > > 	return readl(tile->mmio.regs + reg.addr);
> > >> > > > }
> > >> > > >
> > >> > > >+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > >> > > >+{
> > >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >+	u32 val;
> > >> > > >+
> > >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >+
> > >> > > >+	val =3D readl(tile->mmio.regs + reg.addr);
> > >> > > >+
> > >> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> > >> > > >+
> > >> > > >+	return val;
> > >> > > >+}
> > >> > > >+
> > >> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr=
, u32
> > set)
> > >> > > > {
> > >> > > > 	u32 old, reg_val;
> > >> > > >@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct
> > xe_reg
> > >> > > reg, u32 clr, u32 set)
> > >> > > > 	return old;
> > >> > > > }
> > >> > > >
> > >> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg r=
eg,
> > u64 val)
> > >> > > >+{
> > >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >+
> > >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >+
> > >> > > >+	writeq(val, tile->mmio.regs + reg.addr);
> > >> > > >+}
> > >> > > >+
> > >> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 =
val)
> > >> > > > {
> > >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt,
> > struct
> > >> > > xe_reg reg, u64 val)
> > >> > > > 	if (reg.addr < gt->mmio.adj_limit)
> > >> > > > 		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >
> > >> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> > >> > > >+
> > >> > > > 	writeq(val, tile->mmio.regs + reg.addr);
> > >> > > > }
> > >> > > >
> > >> > > >-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > >> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg=
)
> > >> > > > {
> > >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >
> > >> > > >@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struc=
t
> > xe_reg
> > >> > > reg)
> > >> > > > 	return readq(tile->mmio.regs + reg.addr);
> > >> > > > }
> > >> > > >
> > >> > > >+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > >> > > >+{
> > >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> > >> > > >+	u64 val;
> > >> > > >+
> > >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> > >> > > >+
> > >> > > >+	val =3D readq(tile->mmio.regs + reg.addr);
> > >> > > >+
> > >> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> > >> > > >+
> > >> > > >+	return val;
> > >> > > >+}
> > >> > > >+
> > >> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg=
 reg,
> > u32 val,
> > >> > > > 			       u32 mask, u32 eval)
> > >> > > > {
> > >> > > >@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct
> > xe_reg
> > >> > > reg, u32 val, u32 mask,
> > >> > > > 	u32 read;
> > >> > > >
> > >> > > > 	for (;;) {
> > >> > > >-		read =3D xe_mmio_read32(gt, reg);
> > >> > > >+		read =3D xe_mmio_read32_notrace(gt, reg);
> > >> > > > 		if ((read & mask) =3D=3D val) {
> > >> > > > 			ret =3D 0;
> > >> > > > 			break;
> > >> > > >@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct
> > xe_reg
> > >> > > reg, u32 val, u32 mask,
> > >> > > > 		wait <<=3D 1;
> > >> > > > 	}
> > >> > > >
> > >> > > >+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
> > >> > > >+
> > >> > > > 	if (out_val)
> > >> > > > 		*out_val =3D read;
> > >> > > >
> > >> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.h
> > b/drivers/gpu/drm/xe/xe_mmio.h
> > >> > > >index c06fcac2cc5b..02364ba9dda2 100644
> > >> > > >--- a/drivers/gpu/drm/xe/xe_mmio.h
> > >> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.h
> > >> > > >@@ -20,11 +20,16 @@ struct xe_device;
> > >> > > > #define GEN12_LMEM_BAR		2
> > >> > > >
> > >> > > > int xe_mmio_init(struct xe_device *xe);
> > >> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
> > >> > > > u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> > >> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg r=
eg,
> > u32 val);
> > >> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 =
val);
> > >> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg=
);
> > >> > > > u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> > >> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr=
, u32
> > set);
> > >> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg r=
eg,
> > u64 val);
> > >> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 =
val);
> > >> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg=
);
> > >> > > > u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
> > >> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg=
 reg,
> > u32 val,
> > >> > > > 			       u32 mask, u32 eval);
> > >> > > >diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > >> > > >index 2f8eb7ebe9a7..a5d514c190a2 100644
> > >> > > >--- a/drivers/gpu/drm/xe/xe_trace.h
> > >> > > >+++ b/drivers/gpu/drm/xe/xe_trace.h
> > >> > > >@@ -12,6 +12,7 @@
> > >> > > > #include <linux/tracepoint.h>
> > >> > > > #include <linux/types.h>
> > >> > > >
> > >> > > >+#include "regs/xe_reg_defs.h"
> > >> > > > #include "xe_bo_types.h"
> > >> > > > #include "xe_engine_types.h"
> > >> > > > #include "xe_gt_tlb_invalidation_types.h"
> > >> > > >@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm,
> > xe_vm_rebind_worker_exit,
> > >> > > > 	     TP_ARGS(vm)
> > >> > > > );
> > >> > > >
> > >> > > >+TRACE_EVENT(xe_reg_rw,
> > >> > > >+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len=
),
> > >> > > >+	    TP_ARGS(write, reg, val, len),
> > >> > > >+
> > >> > > >+	    TP_STRUCT__entry(
> > >> > > >+		    __field(u64, val)
> > >> > > >+		    __field(struct xe_reg *, reg)
> > >> > > >+		    __field(u16, write)
> > >> > > >+		    __field(u16, len)
> > >> > > >+		    ),
> > >> > > >+
> > >> > > >+	    TP_fast_assign(
> > >> > > >+		   __entry->val =3D (u64)val;
> > >> > > >+		   __entry->reg =3D reg;
> > >> > > >+		   __entry->write =3D write;
> > >> > > >+		   __entry->len =3D len;
> > >> > > >+		),
> > >> > > >+
> > >> > > >+	    TP_printk("%s reg=3D0x%x, len=3D%d, val=3D(0x%x, 0x%x)",
> > >> > > >+		      __entry->write ? "write" : "read",
> > >> > > >+		      __entry->reg->addr, __entry->len,
> > >> > > >+		      (u32)(__entry->val & 0xffffffff),
> > >> > > >+		      (u32)(__entry->val >> 32))
> > >> > > >+);
> > >> > > >+
> > >> > > > TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> > >> > > > 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32
> > len),
> > >> > > > 	    TP_ARGS(_head, _tail, size, space, len),
> > >> > > >--
> > >> > > >2.34.1
> > >> > > >
> > >
> > >--
> > >Matt Roper
> > >Graphics Software Engineer
> > >Linux GPU Platform Enablement
> > >Intel Corporation
