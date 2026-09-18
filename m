Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608AC982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0410F19F;
	Fri, 18 Sep 2026 06:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5XPNqcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DD410F1B4;
 Fri, 18 Sep 2026 06:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789713449; x=1821249449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MZgK83TD+NKsFMcBX15XVsgk0z3Q3EtxJQpKF1+WWtU=;
 b=A5XPNqcvHq65WWim0yz+mVdG/mMoIqvB73L5PcRCJdaDVVh2eGuipGhA
 KqL/PBZkj6qFmJGlw0/Xv1R8O1ow4czTY5JbgQWm3gTxNTZaSONb8PH+U
 KlmlaYNnDjKrOA7CRiDRHC2M4p6P+P6y3UqdhRc6KGroGRBPgiIwsNoIp
 jpatpuabbJdgUlWcv/4i/pGkPZ8AOG3nW4oKSf/8d+OFSWWfzuVVMMDUH
 aZR+a796XWmnIzPJUuc1xR/qcvYQZnL6sUQ7ewRrkUoIETOzX8EleHd6W
 vBR9ZePYLH+2zkV6hnm8G7vi5zvMB1CH0okit6q6FcSf/edIaCEyrKIcf Q==;
X-CSE-ConnectionGUID: iFO+z4uzSVqcYqPZwW/QCA==
X-CSE-MsgGUID: coGpO1ifTpiPHbDDbCqYDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90216737"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90216737"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 23:37:29 -0700
X-CSE-ConnectionGUID: QZRxgGVBTyKpSRSA8athEQ==
X-CSE-MsgGUID: q5nXJuSeT8yQEQZp2oa+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2431638"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 23:37:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 23:37:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 23:37:28 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 23:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yyq+EyE1huXB7UPHBTK8oje8n1jeetZwlDSKuA/KWU4+PZBaquuAkHXp9obl5WC3luzBkGD3HrCqsU9iGyfdo+k8M9I059fnYRXIvSlMuXhtOIdVkayg0rlHImUMw0yaahdNXfOQeVUuX/QsnRrQSeTn8fZ0Exh51pNn1SWxLyu8e08F2WomEST450j2Udt0o2HGbPlZEfmli4Z+eK3z7hDtr3/rXtBilxPd2LcQAOcWRNHAi6ofjBTgoR7sdXhv4SY1i2mpxkPa4BhzyEAaTvFUnHvp5tSB2q0ibgvKEZwR56KCeNp/7amgFflEK+dI12YlaLbcLq2AuiVNe22SYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM9X0mXJAp0L8J/J+nTe/CUHWSDrY1N7uz+8jkn0E8s=;
 b=PHLxi2vFc/0ANvuy0gRB25SUKXNJXimK15QP6KQvukYjcEIGYIeDHf99L1PjfOuSJ+LVZNBIkaPvorArQgtACgpcBDwQElfeXsCyP0K/xOL7YflIXZYbxhHboOdnKmaHgb1uSuqNZwhQje1/lWAHhR9Cf2rcMqxCwxnMQrkrcFIwr45x2HVbr+z/ExDa7MMkn4C1tXbkeubQCvbQvxgp7ReCcviozR6EZKKwjv3LEg6I5ZeymJJET7QPsQF/7B/35apIXq0IYWTpvdjkaY8IR37tc1vkEke5sxlrMn3nmZVtskzJVhztmQ8Qqcv9u+puzdes7TELsHVAGHXgTvwjcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by LV2PR11MB968400.namprd11.prod.outlook.com (2603:10b6:408:423::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 06:35:21 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 06:35:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Topic: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Index: AQHdRzOYM6oqFMdE1EqKPlxekPsNTbbT253QgAAFltA=
Date: Fri, 18 Sep 2026 06:35:20 +0000
Message-ID: <CH3PR11MB73004485F3772F3CA569260BBA872@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <CH3PR11MB7300FA5719A49415EE099044BA872@CH3PR11MB7300.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB7300FA5719A49415EE099044BA872@CH3PR11MB7300.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|LV2PR11MB968400:EE_
x-ms-office365-filtering-correlation-id: 59388878-6d5f-43d1-2f78-08df154f0313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|22082099003|18002099003|11063799006|10067099003|4143699003|56012099006;
x-microsoft-antispam-message-info: dedIGPFGXaP1dYeCkp3gPclVEr/CA10lRZ83pnI8njkgM4+t7mPavOMCJIksY3RATXQ1j5mKNrZ9rZsMCwU5uZF6sPAPpcvhTMM8pPEvAb4FQrtzceC/b+jEiyyS8uOquR05ZSOS22kvWc+FNbLIyUWSEroPyPtizH0aXRrQUo1KLHLMvG8MCPwU1iZM1KgoV+DtFIAWS2qCMU60sbROcT78boVwOWYbPKZCu7sAmumBwtfZWlQmTNB5z1LykVnGCAJRmoSqKGL+PQNvCT/Rlu8BIoZy75WSIAguVV6DtT3l1yxo6qFTk0swOlsJB8Tqe97i31trYBuOWA37tejT2l0SGzIYy/pMMgcJBaZfj6wWrWWJRHzn6+ZPbk7Rh2459nwvuTuEB2VTtEnBPY0x/GS3RW+UlhXaJLPGRoJ2bYTDPWBak+PCO2QwhzyY13THCurT7t09H0xIomRPpo9XLgrArVwzrDSRdqGUfox7YuKu5Br+6Aur6qM2GQf9fL2v184YZfcXLPkzJn9lVx45wVD8uDScLQsmETwuu2A6kMnG6Owt+zXyHdBAqqvqarNFZe+mX212NnU+q9ttmQqdx6YZyvKdCBQuGPw0Kh6AF7yre6NzL/cdlLHLFPn0U/9gzLP3yFk0ux437k6IfYOk1RacVcqT+vZAGi5y65P9PcQe024eRnr27tNgoQWhEYvMuER0DlpMo0rbQVds61lwtvjxSyfjbcyekKFosVkhXYc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DYQMAEqrdEUp8ZCTyA6t3KYoUMRQRjY44RFWRhVibIG5g95nh7EaTgKF5jlt?=
 =?us-ascii?Q?xuXt05LDBSb+GGTBajn63trQASVb2iQJKhTRFWYjamrejikkaYI62puTTEjx?=
 =?us-ascii?Q?Atun4D/1XkRbGCr3xVhPB+bEQBslWGU8Z9CRdF5pmV6N3+BvUcO86zTb+FKS?=
 =?us-ascii?Q?y12vDg7SG4d+CvpqKoiU0Nn2hoJQNr2upnRo9HvuPvm/P0b0c0fHNMa4znCo?=
 =?us-ascii?Q?ERqCAE6Ve15YxqkFnMCxeaghUcHbwKy0qFBsDR0T3grb2a8a6ExqiCdm8xZ0?=
 =?us-ascii?Q?s3iDDxeu4aFOjLkYV7mwfw0P7j1U2FpSHOoyzkqvbLzwJLl0r/B/qR/Wmq0C?=
 =?us-ascii?Q?FsB1ZHYuzsaUGT+tippvZSD1xVokrJo224VfPXt1BU0EsCtmDwaRovlbyKw2?=
 =?us-ascii?Q?DctGlU8mvQl3tEpNzHw4CVl2hgp58zGXstcG6NTI4XJaikgoRHa42VwWzWIh?=
 =?us-ascii?Q?yfEpo60yc87VsgmfTepWb9H56X+ZfWAs/plNciumUbcNFmeFq/55EkJROLtl?=
 =?us-ascii?Q?Dg8k4ji7Mfm3/P3/ZKhfeY1GWrjplbVr27lSEjB+T8qO8IOl00YzZcOwIaCn?=
 =?us-ascii?Q?BsrkLIeg3n4lWw6XhSJZgNhPoULe1BapZfo+mc/IlJ406mTfP1I62LKekOO0?=
 =?us-ascii?Q?BRG84hzA7pbmmSED0tyx4tQ5QDRW3MPCgMs7xEcXj67VSTykHosOgNvTPRu4?=
 =?us-ascii?Q?33Sm5FJLLgY5wdknPJBgn4T7UGErO5atCQLdbTCGcN7XtIvu86rDZ3B25+Ii?=
 =?us-ascii?Q?4w3ofgc95q3pAiaEF02KyrOSqi5kAGVAjWhXhyUbcFoJ8OFGQD1MOrbKDszc?=
 =?us-ascii?Q?UCSAo+OhG/EXPLZDx+6bCmpebuBkCsyjJlbNKtO3Nb1moZlCBhAM5UEv8S56?=
 =?us-ascii?Q?3hOHRKdWnYr38Or/dRRBv4Td9qtukla33pPktQUA1ZfBot/Q0txMyArhhYZk?=
 =?us-ascii?Q?pmL3UBW/4fx9+VN3LI9vn4Cz1vlU9VXTC4US5Bn3xD6yqffVpm4gpgBOMHuz?=
 =?us-ascii?Q?/X8Be2PGLaXzgQcZoM7HuV5qz3tqStxXJ5qV0XRHoo1p/k1VpyfWRImEbGjc?=
 =?us-ascii?Q?niXEI7Qp6M/bSCupSGxZ/Ai8v5PqHUSpunOpHSTTDkvabIHgR75vW4ecxeIP?=
 =?us-ascii?Q?gVp61PfLaqYzearMxOorUD54t+9DmzLqe4kxcf+qbwHG0toTfzOPXYoow+i/?=
 =?us-ascii?Q?T+QOBt9K1sH8pBKKNVxWAeqaf3uhHZvmq40r/QkkqRvPAuNJre/WDlAl+C2N?=
 =?us-ascii?Q?xB0ojDP4rn0ipy7pK1d5a70uAB4mR4++rfXx0Wfno3dEz7+999uG8tK02g7h?=
 =?us-ascii?Q?XowZmieoc6974+tSalkOn7gU4s8VXcMp7vvoykcpyMt79cqwE1LFIEZDP8gT?=
 =?us-ascii?Q?a8YyPB9uB/T2S6bK7MnqNJN9Uswxm88876CuWmppF8LTnTFcx1Wx5PSQnME/?=
 =?us-ascii?Q?XHvDwLX+yyccibK8IoNZbKaRDMXbtHbS9bOKg9qPffC/fmghlmUnUeK9UYSl?=
 =?us-ascii?Q?4IdBi2aXLLlJRwutS5FVFxIFyMae0Xt7zOLEqvPqJkPNvfSM5+RqnPaBvwTl?=
 =?us-ascii?Q?kLYWkTvknXVlUxE3pIVvVUzNxkp2uXhfI8VZDuIpxIuve/L7OJdDgcUEQOyj?=
 =?us-ascii?Q?VNokp1i4j9k8U2AiNmn5bu9foTERRKioxmtTTwprxvyHbPeP3v3jV2UX//pO?=
 =?us-ascii?Q?l1h6d547KLPBiX+10mOP4kvnQoP1/L9BHIwrKXVK8vVJMZI9SCZUekXellMD?=
 =?us-ascii?Q?2ZFSiz+Xxw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GOr0ZIm5WlTuO14u7fuU76t3JHnksrl3qlwOkulQlJzLzBxlSNsW/VuKKbQOWrfqSX3aeaaex4KEDivPD64RwPchVY00JoUWxYhkmNwLwMhNWLcY6w4ONd6dN4f1JfD9Ed4CI02obJcrRt0Xr0K+W+7OR2whYZPOkLWtjfPEP9jJDHVDzRg3Ghbw8dpjqeHXmLh5hnOUTtSxjy4sAidgN4JxXOWQ664SWcw93PMKFTDdb8ry3AKjU6XZ4gNncBX1vnAiQyZuo026o0QSuTjhuYEIs7rHYX/JtEcVWpHJvuJg7EZ9uidumkUsIib7C16wYm3wTShKPWbnEHGBx7QJig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59388878-6d5f-43d1-2f78-08df154f0313
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 06:35:20.8000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jU+mutAzvGQqJxopqW2ONmO7D2o9pQtFZ598hH3jBn+IsME8p36Z9q6pSKqSbggCLjiXqKAX0FNK5GdGeBHTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB968400
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
> From: Murthy, Arun R
> Sent: Friday, September 18, 2026 11:52 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: RE: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Friday, September 18, 2026 11:34 AM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
> > Sharma,
> > Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; Naladala, Ramanaidu
> > <ramanaidu.naladala@intel.com>
> > Subject: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
> >
> > From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
> > for SNPS PHY Aux will be always up. But from Xe3p LT PHY was
> > introduced which powers down the PHY. Which means we need to make sure
> > Step 4 of AUX
> Please provide direct ref(words) rather than step 4.
>=20
> > Programming sequence is honored.
> > Disable Dc5/6 when programming AUX.
> >
> > Bspec: 68851, 68967
> > Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
>=20
> Looks good to me.
>=20
> Thanks and Regards,
> Arun R Murthy
> -------------------
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > index 3cb07b0a901c..350dac72c996 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	u32 aux_clock_divider;
> >  	enum intel_display_power_domain aux_domain;
> >  	struct ref_tracker *aux_wakeref;
> > +	struct ref_tracker *dc_off_wakeref =3D NULL;
> >  	struct ref_tracker *pps_wakeref =3D NULL;
> >  	int i, ret, recv_bytes;
> >  	int try, clock =3D 0;
> > @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >
> >  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
> >
> > +	(HAS_LT_PHY(display))
> > +		dc_off_wakeref =3D intel_display_power_get(display,
> > +POWER_DOMAIN_DC_OFF);
> > +
Maybe some tool issue, I am not seeing the if() now?

> >  	/*
> >  	 * The PPS state needs to be locked for:
> >  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> > @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	if (pps_wakeref)
> >  		intel_pps_unlock(intel_dp, pps_wakeref);
> >
> > +	if (dc_off_wakeref)
> > +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
> > +dc_off_wakeref);
> > +
> >  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
> >  out_unlock:
> >  	intel_digital_port_unlock(encoder);
> > --
> > 2.34.1

