Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC0CC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1967210E70C;
	Mon,  7 Sep 2026 09:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI8p5E0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBD210E70C;
 Mon,  7 Sep 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788772007; x=1820308007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vHSFhZA3TDdNS8ZvJghJMeoJeHZc+XYX3DI7pcxypz8=;
 b=cI8p5E0P7z6tmpp3UIOW7O/Dfh/7jb7m8Ov3n8v495yHT8MlBSd9vw2X
 2f+lIUsWeyU6AOz3Atc5WvPxHth1KYD+bJV+M3GVnwmwgqkBpp4mJZnYd
 OodhiTMGpIvP4vYJGtUZZ4kQWCwF/Z3b2djts6ZgyMN8rD0h+d+Zte0Ri
 F+InQ82DlmYIQXdGpV1QsgiQNXkejirG4KlL01S/j/vRXm/NwQMkxJjXN
 1gVSYPCqQpMCSwhtnQSSJIwq0DkCaTUULDkoY69Jm0Ks0wQR4T6MxdaQy
 5/owz1Djl/sH1mVy0lMJ2SRpO5/bm79DHeJUZz3e0DZHTUE5odLsb4M5+ A==;
X-CSE-ConnectionGUID: VtwProFKRQaG3EWjMVs8lw==
X-CSE-MsgGUID: 6Nc8WWaVSIeYhLVEBQVNrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="93039164"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="93039164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:06:47 -0700
X-CSE-ConnectionGUID: Uw3UK+/WTryYnRee+NNQJA==
X-CSE-MsgGUID: drmk2yzFTc2Y/JOfGVzDNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="275944676"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:06:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:06:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 02:06:45 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiP4QeStkBQ8NP1+kErMKBvTghQoyn5+P5gJkfKKjv1ZEzmCKfpvwTzFYh2rlHdKvcyTHTQW2Fya9dOsVp/wPLci9dHPP+Dv09i1FkQOuU2+aJN4fnfCaKV4/dr6z8sKDo+GcOJuPap/pSY1TZXMW3AuCOYHvPeeSKtoZxljoU/TzUVSCDFXn884ExHtuIZcwRD7ZiqCO60kxwUruxWfl6WX/rVsU8wbikfFxhwINRSNiBnAuimi0nkdfHE3qY1hUHRcLDS0fI4EF6DIVlWc1rUzaW10RrMcI9PijJmra3kJdJc5UoaDfAV/UGzTtTNGLTkVBC6cAVozn1mcXjK3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dudWBGhp9IPela1Z9GjLmlk9YNFRs8164PzXpdD5xok=;
 b=FLL+5BQWIFU43tyw/SkgLdy8WTp/NAznoMA0zBKCQht71JyykF9esSXqXN0BAzDbU7VI4SlyQ1z7GNiaxTC5kQNcY9jrCLeOGBRgxoTNZ4LHTM2Bt8jawPd2nD2tK0XGzPICLI5WiaXRqpEetNySdnYO7tgUHWXIjfLRLNt/nF/0JW1G0eGyvMcXh94rFwdbys6E9joFd36M+y52As0d9F/ioCHX67pmA7NLHBExrbAXML3Vs81RxurR75kd4ZQ5Tx+Mstt4HXz0t6mOt3cH0DlAHJhunUHROu57rnfltHV3PzyV8KLX1W5xXiHOqiWa5PGALcTWX2fZhjjSmVuu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM3PPF777B3455C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:06:42 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:06:42 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHcph3FsqS1/K+rvUKHMUB9V0aQBbaQNTGggAmVQACAKjdN4IAAAciAgAAAbcA=
Date: Mon, 7 Sep 2026 09:06:42 +0000
Message-ID: <IA0PR11MB730708928E7A0362F67A9A6EBAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260225061110.385441-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307A07B980ED412AAFDBCE2BAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DS4PPFE901A304FB98A4EA3E8BBA006864EE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <IA0PR11MB730774BFA9F655401274EE7DBAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DS4PPFE901A304F07A531CDD56120EB9BA5E3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F07A531CDD56120EB9BA5E3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM3PPF777B3455C:EE_
x-ms-office365-filtering-correlation-id: 8e7cb2da-8cce-488d-472b-08df0cbf55b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|38070700021|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: Pep0Mn+UkRO5AVF61AkkhX2TwKgOcEWzxlv+ousENyC2sOIo2f1LoPGx5FnYTMy04U9CB3doUw+fL2piMzki7jce+gnmlH8inhUkYmj/Zaw18tI48ZWOCdOxbl2wWURUrQ/gEBIWFPJr10dIPX/P7bfdhd8qpzFTUqh+Nhjembjtr9SMkmEaRR/L1Er1+QmjbubOeOKMWh+XDuTN+fztE/YImzlUS6yh8BgcLSmhf6RtrHIv1/WGlg/dVv1ljUmjXzGvU6Bp+4+J6PlsUc0zqpiZ9zd6shM7CGI8iJPj81FG7U8/4u6KbXRysM39spy57HBdYOdAbFQOgYWayWe3Akx+8pWDa6SCr7Y4MFUh+RV/UxseNJFA8PnO56Nl2z82V2LZJ6OtViuEODNxrysdxjChK+OwHVgIRcsNFKcXsLuFb6LUVmq6LGZBFuoa6vLxZVklpfU8E72iTKOrcLz7BjKw/IbFx6MA1qRFHslSVKK9Kk3ZgdLCtm3GEQ9AEJhjN3RCuILhk12EP3fnpXIDD6/BJLnqHiJ2ZOvGxtBK25rRtZuVd6I2i2p14fIQDZKYvNJq6mT9rXs2YMrudHegrz7HroFDZNqv8XlOaOj7ms1ku4gJEo5v6l7PNcrH/anrE2ErpyI6231frD6ttp0pWytry2fjG4vlHRlxGiKViUBZt/4Jfgmcu/2LpLddwt0GBcOYNDhIuDj28WPUh1oTweyKRc22HZ8rxN1OB/J2FOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C6j++3AmGqpfF7ttdMxJuhwEiEVIHZUmLsNp6G7egLIiV1gQzkQOnAo6Q56h?=
 =?us-ascii?Q?w1yXiglln62p/9rtxjlXgpQOM1ZY13s07UUlH8YERziqYYOYVybH/8VIrmpY?=
 =?us-ascii?Q?fge6APrrqVI7OKMUJi5hnL7XujMvqwx0jVdeHq/rE0g6DlGSrTkWF0b+5QDN?=
 =?us-ascii?Q?D6NPKPuLUjiIsXLk2fs99fDlFsJO0KqBN29yrf/jsMOmoOPSEg7IcALGy0HX?=
 =?us-ascii?Q?ETn1ScfOsCEHjVZKK7OwaoHgaOPRIchNozJpcvQxhQq7CIdxOdZw1iJE6bFO?=
 =?us-ascii?Q?JZsidw5EWjp1Gl0/T5EjI8u8YYCtl3ucMRwVP2XMZoeFcgid15Ai0eYg5IKn?=
 =?us-ascii?Q?09FJyId7KcnrW5HhMh+YAXCWgv7/+5ZUar/bqcia9TqFUmLIkEqTiihnxSlI?=
 =?us-ascii?Q?ROQcwtz0MjR68I5AQIfdfvF21NEODBwKBe6BoaxNT1l0mkVGUhvjm3NnlYGM?=
 =?us-ascii?Q?X+i+4xRJUIOemSPnuuOX8J1v39J1Gsj8CisnNhy/3kkC2ixfq57gdRPyCDQ7?=
 =?us-ascii?Q?eE6A+DxQMEi4vhy4LOlpN23j7pfUVeMI6uGVkJ9v9nPRrmDWt54QEdxtOwQe?=
 =?us-ascii?Q?a5Qhin35OKH+mZfkC4B/xyGYPLqu69qZghemZpQFklZTeeb6r9vxxP3oLCZy?=
 =?us-ascii?Q?c6dRPhqKhXIhdYW1Msg/7neF2g/ejWMtxrI37tfyNyvHxHG99WfLOHYM0gaT?=
 =?us-ascii?Q?+G5LfbzUn2ftZzPUQt//lJJF0CPPc4Dfzz0yWxjBV07ly1ZalHzzikJXfv06?=
 =?us-ascii?Q?TeIqk7Z3T/tFkzXzUcA83fws4gcG/4BjR9obCuRR4Axjq3GiO7ua7yQOV67J?=
 =?us-ascii?Q?ACj3lveCyFSBGgH2r3Cmr4ZrD9mMINRSYjSV1+I82c/MnIfnWhZYLwu71e6d?=
 =?us-ascii?Q?oo0QbedeD6FS/DgIiOK6adMXAxVmjb9x7CAhhYaIfUFGNZfHr/JfN9pTwkQJ?=
 =?us-ascii?Q?+fIA9Y7KeB8Mje24u7Kq3pa6pRYTBgYX69pA+v4qCD0eFqT3TI1nnlCViYzp?=
 =?us-ascii?Q?YIKiKDfyAjlD1Ly+vJHvSz6Y1hvt494/mgL+9B9kzMoUAz720/NUmYrKbkas?=
 =?us-ascii?Q?kEgl6vEtKPuOSF/g89Ct60BhkIC9RtXez0gbScP7fnzWZBOcdGuloCN/PUKV?=
 =?us-ascii?Q?QghUOgfV28DIz7+vAdfGRR4iDaiCRw79mDGbQ/Eqld+NV/AGtsZcsxZMQz7P?=
 =?us-ascii?Q?m3FJps55m3VfW0w7lYC4S1Rwlz9wGbf1E7B0AfYSx260+SVLqTpOc4qpU2+l?=
 =?us-ascii?Q?5SxOv+FCyYmlIINzTPmtr0ZKpSQVhelDgrspAm3mlYxQ1s+J6Mj4SgOO/cxQ?=
 =?us-ascii?Q?wxKk1E+TnUMyJmeEP/OV+1/RpPs29offJHUUnAKMdXzsyuc/4u4ZckCSbkev?=
 =?us-ascii?Q?THcW9RKeM7Fcx7NMDpuLlOtEimci0Tp5CXdMUSzYQeI2ul15MCuKAiIloYWT?=
 =?us-ascii?Q?udVZ19EzVp69i1XE7/d2ZXVURYr+EsQeyIFvNT3K7lpjunqA3v8wGcZR+0N3?=
 =?us-ascii?Q?QtdW5fLmIhsw4EFZl1TC9rjVx/FI5Wwshppp2ItI/nMTC9fmcazstaF0xPpR?=
 =?us-ascii?Q?5xUnyGTn9ZDDz3Z90xu7rb/iEkvxbcy4bcnd+9lUe7gzJOMRzUkEQwsrZlgV?=
 =?us-ascii?Q?y37LdGPuBf0cXjmGe1bU6ecSMUkhFmkenw6DlyyybLjfSEov+CmsVkERZWsY?=
 =?us-ascii?Q?Rrj+QEzTeoNlLYcRF+A8zVBj0XWXSg261gLTmgqonpMYh9JuGy9J2SSF/jIA?=
 =?us-ascii?Q?1xpF9JFDVw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V72A0o484rHZzjBSDziQY/eK38w7FDCYlsYf5sk1RBuI/QRmRRqcITdswso0FzMbmRR7uPbDmjj24Bia4nLF6iv709XuxCUHWmn2SVbS3HsBcnNdYZ1AE6Rs15B2JqJmQOCyQNq76s9kQGSpKXDXEP46m3vYsW3SuEyF7k0wyA3wIAG+6PO+A3GeoeAbfvJFkliHJNHl06+xifWtpn6/OCQNgeZjV+5hQG/RSEtpMtidoSHgWDh1dQjGWuXtuECYZYCUuCJ8IvIrglcpmytXBcoDMqqIcXXOxZF0CAKyof7na4BIn7QLD2SIxth7WUuewVi864O7TRmmREtf6UCcig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7cb2da-8cce-488d-472b-08df0cbf55b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 09:06:42.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcJMZgVr1gegaRd5fDjLQcoo9+EPMUUS2a8QrpW53l6R3zZX3LNEfdOgsFVUsAsewI/R91UzttHDwpOK5IW4NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF777B3455C
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

> > > > +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> > > > DP_SET_POWER, &value),
> > >
> > > So we have recently switched from using drm_dp_dpcd_read/writeb to
> > > drm_dp_dpcd_read/write_byte I think you can have a look at usage and
> > > Replace it with that function here.
> > > Check
> > > https://lore.kernel.org/r/20250324-drm-rework-dpcd-access-v4-1-
> > > e80ff89593df@oss.qualcomm.com to see what that was required.
> > >
> > The existing functions readb/writeb are still supported!
>=20
> Yes but we are moving away from them and using read/write_byte instead.
>=20
Done!

> >
> > Thanks and Regards,
> > Arun R Murthy
> > --------------------
> > > Regards,
> > > Suraj Kandpal
> > >
> > > > +			      ret > 0,
> > > > +			      1000, AUX_CH_WAKE_RETRY * 1000, true);
> > > > +
> > > > +	/*
> > > > +	 * If sink is in D3 then it may not respond to the AUX tx so
> > > > +	 * wake it up to D3_AUX_ON state
> > > > +	 * If the above poll_timeout_us fails, try waking the sink.
> > > > +	 */
> > > > +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
> > > > +		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1
> > > > sec 2.3.1.2) */
> > > > +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> > > > +				   DP_SET_POWER_D0);
> > > > +		fsleep(1000);
> > > > +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> > > > +				   DP_SET_POWER_D3_AUX_ON);
> > > > +	}
> > > > +}
> > > > +
> > > >  static bool
> > > >  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct
> > > > intel_connector
> > > > *connector)  { @@ -4713,6 +4745,8 @@ intel_edp_init_dpcd(struct
> > > > intel_dp *intel_dp, struct intel_connector *connector
> > > >  	/* this function is meant to be called only once */
> > > >  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> > > >
> > > > +	intel_dp_wake_sink(intel_dp);
> > > > +
> > > >  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
> > > >  		return false;
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > > > b/drivers/gpu/drm/i915/display/intel_dp.h
> > > > index b0bbd5981f57..3f16077c0cc7 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > > > @@ -232,6 +232,7 @@ bool intel_dp_dotclk_valid(struct
> > > > intel_display *display,  bool
> > > > intel_dp_joiner_candidate_valid(struct
> > > > intel_connector *connector,
> > > >  				     int hdisplay,
> > > >  				     int num_joined_pipes);
> > > > +void intel_dp_wake_sink(struct intel_dp *intel_dp);
> > > >
> > > >  #define for_each_joiner_candidate(__connector, __mode,
> > > > __num_joined_pipes) \
> > > >  	for ((__num_joined_pipes) =3D 1; (__num_joined_pipes) <=3D
> > > > (I915_MAX_PIPES); (__num_joined_pipes)++) \
> > > > --
> > > > 2.25.1

