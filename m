Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3064CCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 20:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641D910E84F;
	Thu, 15 Oct 2026 20:38:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D8410E284;
 Thu, 15 Oct 2026 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792096679; x=1823632679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Iq/qY/4+2nALHHxi71Tj9MC89wuQR6AcxCEAnaRUbk0=;
 b=YIdKNZwrMA3qta4DNLiQ9TueRjvR33OcnbncTEkZv7ar1Y4QOo2idaFO
 exyG+DdatEP3B2UKIhXO3QU3bpVwpYAn2UFODEsq0o6eBnbImZRHgIXTS
 Kk5KfLobD9LXf89GQCw5/A+1T83LArC0lkrOTwxRbrbGXVP8LSY81GKt/
 /IiMEhFDBoIVUsjv/AfXfgRzbWKXb/g8A9IM/c+2Ai4ZJABx3+EeezMg9
 I3/WdJZZnw8Lw88FmJp1GgpayVmy1hyQrPkPkskUl3GzBW6tQZFdDNprO
 5Wim3CJ7rguzZcltvT+VQwR4PcaANXWcmsX3c2Llgb7miEzBG9//2qdWa w==;
X-CSE-ConnectionGUID: 70FscE07TtWivWkRHLp6dw==
X-CSE-MsgGUID: B2Kql+pGRb+kCLIpRYozUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="912235"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="912235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:37:58 -0700
X-CSE-ConnectionGUID: DfbaiiCzT3Co+xZd6jd0xw==
X-CSE-MsgGUID: MrDTGvbbTICrhUkkVEdHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1847778"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:37:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 13:37:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 13:37:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 13:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynjqX773eHDaI99baq/m7OOpWIutE9kwOTosDK9zk7fIm8zZoZCWvN5RDlIXs3CbJLPeJgXzfYJtRUcjmPyfe8jTZ1JMOP3sYVBVhuiwDRytzeTQpH4A02e+PdDucmGOWrMOHHkzmSXk8OzKU6PjyKm33kP5U5IxCtNsRH0hohSwtGf1IcINyjt1IjoYnejkmrT1tkomovtGQjgNu784R2xSHxhpviKjcYOQtAqml4lTD673AKmyinAtmHBooldoKrmP7WilYWGQ7l8nkUhKG1C661n7FZlJGqAnCkFd9o+p7DZCqCU8xHsmnabjaoLsJ6eFkTeSJH387EPEsXxjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXDiRPdBANWlhdr5z7AuxjKx30QRPsAE1f4/j7l4fko=;
 b=hlChbDGw3jCIBRlzscAtEZ4wQ46DjeI+IKUTjbf/n8Bu+33ehrP1E6DrUeIBSWO1znp3HOVcJYeWuXS+s0k37ZUkdHcE1WSB9NcLyLpJnZ01sn++fzNsvdGJy6fiRmrGZPk6gejCOQLSzriaEIsttyMr4RYvVgfpdkmVulFuuQAlz8I4mv/q9PGXAWii1qNCZkk7whEEuu8Pu2+pmWNFyWnYOWQqHt1T5WRSLb11hrgwz2/LZGQfX/+/0oDT3NCXEsyINVoWDT65ygI4IOLXOcB7V5oGQTWlbMOU1BytxsJ4JGKRfq3+i2tdKegCI7h4Acjbsfj46xWMDU5loKKvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by DS6PR11MB704522.namprd11.prod.outlook.com (2603:10b6:8:412::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 20:37:55 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 20:37:55 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdRmKMmuk4v6NzAEO9dUvZMfqdCLb/O5GA
Date: Thu, 15 Oct 2026 20:37:55 +0000
Message-ID: <BYAPR11MB378384A05D976F750B979347B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-8-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-8-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|DS6PR11MB704522:EE_
x-ms-office365-filtering-correlation-id: c62e594b-6f79-424e-2a4c-08df2afc314b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|23010399003|366016|38070700021|56012099006|5023799004|11063799006|4143699003|261009223027099003|260925022911599003|260925021311599003|10067099003|22082099003|18002099003|260925021911599003|6133799003|3023799007;
x-microsoft-antispam-message-info: duuhKgEMO+jK29gzh82O/mOqcBTXG1luq3IF1ykIVm8ejRQDHO0lPnpTBzDnTai7Q2A0PdLbX5hJb3KU8ULC/FP9CMMM/Wa+IoYZnGnj44BFX1debkeBcLcmlmVAxw+pQWFctwYsNghpzYvqUhpoa2FwFYIj7g3BN9HVgqkqv71TVLZ0QEh7n4T5QiK64CRo3OgdIodn7sInT+j6devrOaBWrNMRhJDj+Y+tv1WZRFR/xdadac1AX+xxHQ7uNOn/BWZRBN0BOqEediMe38fNSGK+m02wnpbfLeBV9z8LXClAc6C2nUMf9pc8slZMLFVV7fV20N+4JLzbek16ihYakxtCz2Jjwx31bohaGCmeq6eAhWJamGVFvQatlmxlwelq0H5MEtGLpigReYT0KLWzfQBUksmjqXdHqprhDfC2kb6ZMTbB6iyZWcPyjSZR7PcvdQBuiKH3YyPl8mL6+kAFVLXdLe4cA9BbAsCznRCvw2jizuTKc6TwWl38DO4Cw6hwI9slEJLYXxk+IYyXIWrlSiXtTZyVRoMPffkiz/y0rYMry5rH/OAlF9XF0VIcACIoPUCJBQguYvCD2DafjRFMLz6+MKcd2f4fWIHP6lnyYsR138OLuB+cwgbEL76tOAO5ieE7KVZfLaOd1CGFAooTTCqhficcxc995fvLPbDPJ5+T7e475sML3jTcwU3nv1RGN/Xj99LOLXUqArYmTIFsVka1uJnbo46yOb8F6xOCzEw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(38070700021)(56012099006)(5023799004)(11063799006)(4143699003)(261009223027099003)(260925022911599003)(260925021311599003)(10067099003)(22082099003)(18002099003)(260925021911599003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nzehGkHiDxTS27iFVon65Oiy0fpAg3Q3tdQ5nd0nFkbdyYl7PlnrtlofJNOX?=
 =?us-ascii?Q?4DFlmcwtvPd4lBvRoSqgjVS0j+beaRxVuk53CjkNd1O6DzmlCltpFWLmfOwj?=
 =?us-ascii?Q?aZcRL87dKzR7hTH776AmC7+cIf0plLF3UP33t0je0tjrLgkUmc9lPg83J+hT?=
 =?us-ascii?Q?+XrcnG9DRmLfFHQZR1oR3hMKrcy0j0DKxSoV3DxsPViSC0SCm3KeWW1y/6al?=
 =?us-ascii?Q?Bs3lLKdW7ptyDGo7cQZSTL4Vsv07NY0v+099rPkA9grCxQwefSeV2dtcs87m?=
 =?us-ascii?Q?r0rVd5ekcnR8jkY1HmPa1mVA9PZWNSS6wjUGhMBxKXfjAAVPFQvVKm0QuNh+?=
 =?us-ascii?Q?EGFzUZeJtMhI3xWyTbe74XseUxoGD6UXkrdXnJiD6Z5eLgeGpQMjT6afuyWA?=
 =?us-ascii?Q?NHNZfPfIpiKIMCmk6sVK/Lq3hdTu2NXQtFh4M95tdQ5ZjXF0ZrE2b8nOOzMD?=
 =?us-ascii?Q?/QAvEApR+0oK8m99euRHnG9sydO8RLoqgVH+AYGPxRt4IawdT4n4tt3Osn3S?=
 =?us-ascii?Q?acZnUHP2RVz7fO3yuMJ8XWi0kbKcUJhP9n4V8h6qB2KkrbboDdW1D5G+cXHg?=
 =?us-ascii?Q?+LGuNCouYWkFB6xaNNQ9wdbQM6fQBXOoCsPH6PCZ3AgQNDVdtpmwD8KBLobH?=
 =?us-ascii?Q?Dh1G5BPiLiKpGMzsozp/QC3I3FIctnmLtBwun79kntos5qGNVQfKr1Yhndu9?=
 =?us-ascii?Q?cHrJc8rGt3xjiaK7WU24r/bCqhY5PsT5HiQxFbEjn4Rw1HPa99SJskw06jj/?=
 =?us-ascii?Q?0XUldTURNyhcTbepezp7ty1zpsSYnbPcxEEdRvkOACr8U3WHRJzROzdJagLU?=
 =?us-ascii?Q?PHyHytI7ozsNQP5ne9pQuFmeF36QJgePLav8yQDe1ngeTmU3wIxbpWHvtzJB?=
 =?us-ascii?Q?9Y/3CgMdnxV5k1ne08n0CtD2cQNiKwHwfgb2M/fVZQ9Ms8ItP/gLHowp5J11?=
 =?us-ascii?Q?5VeRMpXLNBln3uo0EvQ7NuyG0iuMfsY5Vuuj/+RW29AgyE7IpbujlLrAPHc7?=
 =?us-ascii?Q?gY6gLKqGgvGb4Aksrk3zdddoPv92oMvqGJ7Vs5jZYvy6XFHxMziJgr+YNLnc?=
 =?us-ascii?Q?+Z4wko9HbWEYiytomzwtEPKaGnc5+GBLQYJOLkarSnVg7axLAQ4FKdKdOU1L?=
 =?us-ascii?Q?XEqciuwbvRfe3I4j2xLKF/SErc+64OT1pz8ti85Ij1Qe6ss5UEoHD9cHmQB2?=
 =?us-ascii?Q?Q9Me2ewypfjI5LzMBGFIGEnTwa9VighkTh/qG6h0DF64WygZQUHQ2UY5y2Ny?=
 =?us-ascii?Q?dmAWS48unlJtaFMC4ZGmuHwcRDoy+QpxlkXApnC5kkdtk0vpS5lFyvzmF04O?=
 =?us-ascii?Q?hUaD+qdTME/7Y7wu/+/NxXBaFcgDl0beIBYN60XoGgUSeIqGTRjJ/lRgaswJ?=
 =?us-ascii?Q?yghxkoNk54G4psV0tMGvV2oEw1vcLQny3WNf5BSQ9sBFXtOUv7teiFOthGHb?=
 =?us-ascii?Q?Y7ncAvlecvxuqNl2Aolwz+dNqXE+8ra4DWOjTVAz6VeQB6TLqJJMz1o8kQdK?=
 =?us-ascii?Q?BRKw+MZ6kG4BVc1HUwkavhXai2ZiwfRR7voXBGuU+d9Mr62D9okceYLHiEAl?=
 =?us-ascii?Q?MUiQ63nAy3pjyOLS57mwNNjlKqneykOQTq4qPvBZGWSBlSEM9wXM7rfMlz8r?=
 =?us-ascii?Q?nHOyOTka79oTWX4OD0pv1zcflMWV4Ns6K38fWxKY3tkMvKmigpevG/kPgoYd?=
 =?us-ascii?Q?kNdWVCqJHmaNI4fFlPuL9Sg6zEaFD1zwdHAtJrWVHrgAiiAbu5J8YzAM6bqh?=
 =?us-ascii?Q?Oguv1ULfyOege5mfBJlZFXVrvuKnwG0Ie0WIWTt1AwImhyxEbHsivRvkahig?=
x-ms-exchange-antispam-messagedata-1: fhHOSYClEaJ29x0i5MelMnjz/5ANZ89CTZo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TKtRxiaC5S9+Olx4h2UMk6mUJIW7fR2ElsGBNeEIwKiUq7iK7twSyBAnjbl3ttnY2ulAn5p+xqxiYcju5nidZQGZFwRpRM+ehYsfoWz3DpogQq4YpewXpZ/ATURbxcBdlOzlqQMDOtw8NlDXFq90JhAU2mwvHAVF1jl3U0ne07+BJZkzLry7M2xHlwNrpgH5HyfGQRaZxFrrTTIwlZrFdTj8RbhfbLiTl7sUAmTIbMdUVlEDwUvuojcS1AdAPf2YIVpoAF/mJFRyXu6MHI7dJ2LdSxTtjspvpXVaVPqWFwipkaibY7Q/5NnZDBGwnWBziYZby3QNbIi5sWI5PMoFtA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62e594b-6f79-424e-2a4c-08df2afc314b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 20:37:55.6501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YljWc0t7wHOmtlhKbSTawkAWy8vFaft3l4M2TcbahJivRQ1geDe36yzZXWKZDdgfhjZw2sMTd7bg5yEm9fUK5lpnMVKkRSlEZ0X0VWZ2RMO0U6H7Aorg1ZDeHVY9cN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB704522
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: 17 September 2026 10:37
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
> for linkm/n ratio > 10
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> To support a Link M/N ratio between 10.0 and 15.0, for some BMG ultrajoin=
er
> cases we need Wa_14021768792.
>=20
> To bypass the hardware limitation within the Timing Generator DDA (TGDDA)=
,
> we need to program the LINKM and LINKN registers as defined in the WA.
> Along with this we also need the relevant bits in HDMI_EMP_DATA and
> CHICKEN_TRANS.
>=20
> Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to trac=
k
> if we need to bypass the Link M/N ratio limit in the intel_link_m_n struc=
ture.
>=20
> Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold INT(L=
ink
> M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
>=20
> CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N,
> since writing LINK_N arms the double buffered update of the M/N registers=
,
> and all of the programming has to be done before the transcoder is enable=
d.
> Both are also explicitly cleared when the mechanism is not in use, so tha=
t
> state cannot leak from a previous modeset.
>=20
> Only bypass_m_n_ratio_limit is compared by the state checker, not the rat=
io
> integer and fraction themselves. That is deliberate: both are derived fro=
m Link
> M and Link N, which are compared already, so the thing worth verifying is
> whether the workaround ended up being applied or not.
>=20
> Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
> are not double buffered, so the flag has to be compared outside the fasts=
et
> exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
> Otherwise a seamless M/N update could switch the DDA out of the
> workaround on a live transcoder, with the Link M/N values only following =
at
> the next MSA.
>=20
> v2:
> -Drop the drm_WARN_ON() on the extended LINK_N field in intel_get_m_n():
> it is derived from Link M and Link N, so the state checker comparison of =
those
> and of bypass_m_n_ratio_limit already covers it. (Sashiko) -Compare
> bypass_m_n_ratio_limit unconditionally, so that a change to it forces a f=
ull
> modeset instead of being applied during a seamless M/N fastset. (Sashiko)
>=20
> Bspec: 49266
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 93 ++++++++++++++++++-
> drivers/gpu/drm/i915/display/intel_display.h  |  2 +
> .../gpu/drm/i915/display/intel_display_regs.h | 10 ++
>  .../drm/i915/display/intel_display_types.h    |  2 +
>  4 files changed, 102 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 6d2025e10995..1e9d8943626a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2706,6 +2706,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
>  	m_n->tu =3D 1;
>  }
>=20
> +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> +	if (!m_n->link_n)
> +		return 0;
> +
> +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m,
> m_n->link_n)); }
> +
>  void intel_set_m_n(struct intel_display *display,
>  		   const struct intel_link_m_n *m_n,
>  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -
> 2717,7 +2726,9 @@ void intel_set_m_n(struct intel_display *display,
>  	intel_de_write(display, data_n_reg, m_n->data_n);
>  	intel_de_write(display, link_m_reg, m_n->link_m);
>=20
> -	if (DISPLAY_VER(display) >=3D 14)
> +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> +		link_n |=3D
> PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> +	else if (DISPLAY_VER(display) >=3D 14)
>  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
>  	else
>  		link_n &=3D DATA_LINK_M_N_MASK;
> @@ -2738,6 +2749,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> intel_display *display,
>  	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
> }
>=20
> +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> +				     enum transcoder transcoder,
> +				     const struct intel_link_m_n *m_n) {
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> +
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return;
> +
> +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> link_m_frac));
> +
> +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> +		     DP_ENHANCED_TGDDA_ENABLE,
> +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> +
>  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    const struct intel_link_m_n *m_n) @@ -
> 2745,6 +2776,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc
> *crtc,
>  	struct intel_display *display =3D to_intel_display(crtc);
>  	enum pipe pipe =3D crtc->pipe;
>=20
> +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> +
>  	if (DISPLAY_VER(display) >=3D 5)
>  		intel_set_m_n(display, m_n,
>  			      PIPE_DATA_M1(display, transcoder), @@ -3495,6
> +3528,49 @@ void intel_get_m_n(struct intel_display *display,
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> data_m_reg)) + 1;  }
>=20
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio,
> +					enum pipe pipe)
> +{
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return false;
> +
> +	if (m_n_ratio > 15)
> +		return false;
> +
> +	if (pipe !=3D PIPE_A)
> +		return false;

Could we check whether this should use the transcoder (TRANSCODER_A) instea=
d of crtc->pipe ?
For ultrajoiner, could the secondary pipes report bypass=3Dfalse even thoug=
h their computed state,
copied from the primary, has bypass=3Dtrue ?

> +
> +	return true;
> +}
> +
> +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> +				    enum transcoder transcoder,
> +				    struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	u32 link_m_frac;
> +	int m_n_ratio;
> +
> +	if (!m_n->link_n)
> +		return;
> +
> +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> +
> +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc-
> >pipe))
> +		return;
> +
> +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> +	      DP_ENHANCED_TGDDA_ENABLE))
> +		return;
> +
> +	link_m_frac =3D
> REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +				    intel_de_read(display,
> HDMI_EMP_DATA(display, transcoder)));
> +
> +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> +		m_n->bypass_m_n_ratio_limit =3D true;
> +}
> +
>  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    struct intel_link_m_n *m_n)
> @@ -3512,6 +3588,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
> intel_crtc *crtc,
>  		intel_get_m_n(display, m_n,
>  			      PIPE_DATA_M_G4X(pipe),
> PIPE_DATA_N_G4X(pipe),
>  			      PIPE_LINK_M_G4X(pipe),
> PIPE_LINK_N_G4X(pipe));
> +
> +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
>  }
>=20
>  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, @@ -5002,7
> +5080,8 @@ intel_compare_link_m_n(const struct intel_link_m_n *m_n,
>  		m_n->data_m =3D=3D m2_n2->data_m &&
>  		m_n->data_n =3D=3D m2_n2->data_n &&
>  		m_n->link_m =3D=3D m2_n2->link_m &&
> -		m_n->link_n =3D=3D m2_n2->link_n;
> +		m_n->link_n =3D=3D m2_n2->link_n &&
> +		m_n->bypass_m_n_ratio_limit =3D=3D m2_n2-
> >bypass_m_n_ratio_limit;
>  }
>=20
>  static bool
> @@ -5277,18 +5356,20 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>  	if (!intel_compare_link_m_n(&current_config->name, \
>  				    &pipe_config->name)) { \
>  		pipe_config_mismatch(&p, fastset, crtc, __stringify(name), \
> -				     "(expected tu %i data %i/%i link %i/%i, " \
> -				     "found tu %i, data %i/%i link %i/%i)", \
> +				     "(expected tu %i data %i/%i link %i/%i
> m_n_bypass %s, " \
> +				     "found tu %i, data %i/%i link %i/%i
> m_n_bypass %s)", \
>  				     current_config->name.tu, \
>  				     current_config->name.data_m, \
>  				     current_config->name.data_n, \
>  				     current_config->name.link_m, \
>  				     current_config->name.link_n, \
> +				     str_yes_no(current_config-
> >name.bypass_m_n_ratio_limit), \
>  				     pipe_config->name.tu, \
>  				     pipe_config->name.data_m, \
>  				     pipe_config->name.data_n, \
>  				     pipe_config->name.link_m, \
> -				     pipe_config->name.link_n); \
> +				     pipe_config->name.link_n, \
> +				     str_yes_no(pipe_config-
> >name.bypass_m_n_ratio_limit)); \
>  		ret =3D false; \
>  	} \
>  } while (0)
> @@ -5436,6 +5517,8 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>  		PIPE_CONF_CHECK_M_N(dp_m2_n2);
>  	}
>=20
> +	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);

The flag is compared twice. The unconditional BOOL check is enough.

Please also print it in intel_crtc_state_dump().

> +
>  	PIPE_CONF_CHECK_X(output_types);
>=20
>  	PIPE_CONF_CHECK_I(framestart_delay);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index 404168f4213b..55e676655120 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct
> intel_display *display);  int intel_crtc_num_joined_pipes(const struct
> intel_crtc_state *crtc_state);  void intel_display_compute_link_m_n(u32
> *link_m, u32 *link_n,
>  				    int pixel_clock, int link_symbol_clock);
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio, enum pipe pipe);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 57f388c958b4..81f9661357b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -550,6 +550,11 @@
>  #define _TRANS_MULT_B		0x6102c
>  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans),
> _TRANS_MULT_A)
>=20
> +#define _HDMI_EMP_DATA_A	0x600d8
> +#define _HDMI_EMP_DATA_B	0x610d8
> +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> (trans), _HDMI_EMP_DATA_A)
> +
>  /* Hotplug control (945+ only) */
>  #define PORT_HOTPLUG_EN(dev_priv)
> 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
>  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> @@ -1192,6 +1197,10 @@
>  #define _PIPEB_LINK_N1		0x61044
>  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
>  #define  PIPE_LINK_N1_EXTENDED(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> +#define  PIPE_LINK_N1_EXT_CEIL(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> +#define  PIPE_LINK_N1_EXT_INT(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))
>  #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> _PIPEA_LINK_N1)
>=20
>  #define _PIPEA_LINK_M2		0x60048
> @@ -1710,6 +1719,7 @@
>  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
>  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
>  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
>  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
>  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index a5f18ac8a7d0..7a5286db977e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -985,6 +985,8 @@ struct intel_link_m_n {
>  	u32 data_n;
>  	u32 link_m;
>  	u32 link_n;
> +	/* Wa_14021768792 for linkm/n ratio > 10 */
> +	bool bypass_m_n_ratio_limit;
>  };
>=20
>  struct intel_csc_matrix {
> --
> 2.34.1

