Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFCCA5FAB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 03:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B5110EC69;
	Tue, 29 Sep 2026 03:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig2D8zn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13FC10E8EC;
 Tue, 29 Sep 2026 03:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790651787; x=1822187787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+NE5cdazWPABBIyeBlKdgeba3HQTcoGZAe2sslancg=;
 b=ig2D8zn2Xs5XtE22IkqqUntXRV9xb0aervPuJiiL0BI7KAsYkuHmL4Al
 w6ntNyLdnEHWs+n65+AhV9RunmPoi6MDJtmrJaoAfAleSYCtwNDDLI7u7
 uY5Nv/mWJ3SsJ6hAsvGQSmaW0WjZ0lSlHDB2lmvHTemQ1uu3f5IwVMTEJ
 IR7wXrPO7n3nNBVFzUwP7/1nGx20PrXVgcZacnSaC6lu7a6Bw9nGECcjb
 /32aYdz7l2FhlH6ENM+MryiDTrdJyiJFlwcSAXU32jRsEWIVxotvGZRYY
 D1zpCaXaNaCVRpp0dqV9/ev+MUh6W3AD2u2ZiTjdAHZ8jeTcwzgTsi5bv A==;
X-CSE-ConnectionGUID: wzVAlyfIQomBMACvcAn28A==
X-CSE-MsgGUID: vCNWcgACRz+Jad0k5k8VOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102021943"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="102021943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 20:16:26 -0700
X-CSE-ConnectionGUID: g9ucYQQTSLqD4LbMjwGaNQ==
X-CSE-MsgGUID: bZd9ignoR0aA9DJ0kYRc+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="279960536"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 20:16:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 20:16:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 20:16:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 20:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7GbYWK2pz9FEVO6sOU9rbsQBJLU46bnIwLFj0hOrcQbb5VmE4HplVMvABFRFL+ITPT9kocmyw3AZthzLb/LS2cMfpwdRBeQoi9PI37qmkQ2UTeTmAG4yjvDtjlHZYW8KbrN9lc8W1bunEG0539vjakTOJWcrsb29PlN+UW3JNdS+jfL7XWcVpStgB3RE9Wz5ob/RBt8I/0cxopvUWyP18C0cnm67MSjB8eOcaSLL5LW+VX9xc84nrM5NVRA2CWzpVwJcIATC/1HlYuaOj2AAUXMqpxDcjxkMBK/gw1hRwa1yYW8xh6uUkmStwc7jDHpAF8+tb3ZOc7hvRVfhVV90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWz7IFFLlCX4VjWzCd379xmKejV8nHmq27WDkKLuaV0=;
 b=PUD0YJm0qSyHIE72WAz9548MintXT/hT9QGOuZ3zGEpUamXQxS54EcyHu26RTPeMxIBBTIxh3TFNkDXT4amKeun0D6Ws3CQIPxCj4GZvOrgKtEzKhrHdOqrQT2FQt53wus8h13zC2qkOQyahi+9Pj1+1XnFOihh0kjZWVXeikIMS3nK0wwRI1sB8MYcDTvP1QRXSsGq2Svs4E9Hx2J1CrF35DqLVQYJT/um39DnxY1751mVDQ4YKewNOqNC1xa15hR1fIJYAQeV2tZD/k/Cn8ys/+S0IrmSHh3DZrFhJIIn5ArRxeuiUk1OO1PWDIKW/S8qnl87K/c4alUgY7cEGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB7632.namprd11.prod.outlook.com
 (2603:10b6:8:14f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 03:16:16 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 03:16:14 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "arun.r.murthy@intel.comm" <arun.r.murthy@intel.comm>
Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Topic: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Index: AQHdTxBX5NbRXFSSbkKXLjZW4RbJ/Lbjq4kAgAAARwCAAAKdgIAAAW2wgAEznVA=
Date: Tue, 29 Sep 2026 03:16:13 +0000
Message-ID: <DS4PPFE901A304F100F3FA8750372EA759FE38C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
 <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <d2d37b6abd46bab14cf6716ff1f8c06c8d06f174@intel.com>
 <DS4PPFE901A304F5D1E1AD81739F43903A9E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F5D1E1AD81739F43903A9E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: imre.deak@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB7632:EE_
x-ms-office365-filtering-correlation-id: 0904e75f-af0e-44a0-1372-08df1dd804cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|5023799004|10067099003|3023799007|56012099006|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: Sjvw1tZ1w8KWGOVSijyqi/WZ7KXhsihexGlOpa1Q0WzR0zjm5qN7ES0QdDKd6Dq1xTLCADdu8RgKcSRRnQSu6KzegWqhH6ThwQnKis//6vPKOopTGty2KU3kFvyp2i27TxNuo80tBiEohWVhAY1ZD2yiumilVuF7+Q9CZUYUDWiJMRNgxGrKtuMIGsnNkAiZ/EEP3OQnUPJB3LAx2EN65yS9pKb0wPmJSxmvWGw+YV9lPitTG0bZNBWAlEzdKttE9FvsfZ5870o82Yj47d3WbuuwiryxPSBBGA33sdCFgWMhVqyzckeGI9yQZ4qOSN9ZqPDryoWLoCFhQgu9f8d6JrbPdxMmMsBSyajIFkBP+O1pqNv5eTzkGPrx21ECZu+R5scTqQEZRlR7K8JQbIsqFZ68EYzMUdqMhVTy+3/VoJ48g2hiL5vQS9OpGYksOhBew8wjcOOgLf7dxtKrREfhWHX05rhvRQCfGLaK0zNVRWfijB4xJVuoOMh4edOCBMNlFnMxllhiJQX9bb6hsDF87wAbokewXYuql4Enz6T8Kf6A/EV4Dht6ahGidEJ31J8G/BPlSPq2bjgezPuldVNIHliTAlYzN9IpLkeHTciY3Yc9rKzk8So3mADDlbVFFwbzKhKQrw76tVBPBRtY+i5z5Z3QIoQm+1mJ0y5GHCrn5ZnMVy2l0NTqPjR3A2SnCAGkjuLRV4ffMchbNeoQGArf/EH7LG2utIORIua9UuF4vgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(5023799004)(10067099003)(3023799007)(56012099006)(18002099003)(22082099003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vrz+8dbaTBa+J6B6OolfkuXpmI37qPoW7smkXN2LV1i6WXy9vXymRVdJQEBk?=
 =?us-ascii?Q?stNtggbwgk6aZErOxqizVwN2CWxSxV92jctqYQeG23qfh8+uyKLpb/RThKlW?=
 =?us-ascii?Q?sAGzt5PkIQnpLmpGfvQ66rj5t15VhH7T6RR7Dp8XjjL32a4u61ZA/85U97rf?=
 =?us-ascii?Q?RTyfsNY2u3zveVoJ7CfiiygOg2NkXLADIuRJuKuBs7IsUxE08whh/YvjluXD?=
 =?us-ascii?Q?bDrXWXNdv2Nz7EeGKjsyJEUQsBtLS1Y9ZIkBorfONXeZnOthvMeU6+CjdRT6?=
 =?us-ascii?Q?18ta9JtR4jHfIuGXPPnygk/2RV5UlWiXLk8NKggtjPFBszHGr3Y2xBFb+OMx?=
 =?us-ascii?Q?WcPVfsshZUvQsLZ90Oe+wD4YzDZjJQhdxZzf2aTiLNy+EzPH5530lOnjBsJ8?=
 =?us-ascii?Q?V9TiDWHG6vC+0hUIuRljamDsjW5KzHDZUA3rP7is4adaHImTItQ4Timq6TJM?=
 =?us-ascii?Q?+I7p1PZ0ylNtqSYxAzL9UdtmBp8+8GL5aJlcZMGs4HqHajVxOC+CS4xcRlQ+?=
 =?us-ascii?Q?VX7N8Wprk9roP1EZKQNcg02LAAKEDi45lkx5v36tu6XfnRWEr8on85SRnxgi?=
 =?us-ascii?Q?Mr2Qu6NR1BkVAeIdlFwstQDYwph1cvB9PsODEgenaSVZS/tQCrDKdNrk83la?=
 =?us-ascii?Q?fk/XsfjuW79Y5DbMeGTee9l5IYGg6Ykh+/a1mXv+z3LH/Q9LDYOV8reN6O38?=
 =?us-ascii?Q?tEChsg2FAK/esjPCOk7FWeLiw2xJnFVT6lzUWi2nlwAGgDMsgumTh1RQr4Pt?=
 =?us-ascii?Q?XkdRi2+B0Z7vj0QWraTBSU5DfpcDWSzCaJ1iKWrqoszBD1XoT0bp+qOu1Jgz?=
 =?us-ascii?Q?vzt2TRdZhEfBoQW8glBw+FBvEMsCP40vOaDfvZzNszgo8RQwqKNRnxl07NPO?=
 =?us-ascii?Q?ZqAOQC7/JrzqpguvKoV5g4F8yavSMHMgqZz7birY9wGXwzR3h4T2qY4tYV7d?=
 =?us-ascii?Q?L7/Kk0cLADvw8wTHhQpeVRpjXH7nrt7uYRFwrhv7K/vLa1XupNFe6U3J5/fn?=
 =?us-ascii?Q?s2BJVBScppqSWxXWGsUNwsUuRRYhHmRMmcTpdJ9Wo9BDCHXCumxb4bIKIFvD?=
 =?us-ascii?Q?68jhBvkq9W+TrmCcUVa8lxxA+a9bnkEJw/vRlUdPQB4nkwlf9fnGwDyDvpwE?=
 =?us-ascii?Q?S9dFQkPeESJO+OMjS0StGPDpBiGOdr4cHtvqitVS56hMLuPNJtmwZJKOMpAd?=
 =?us-ascii?Q?JgY8hTIib1VrHzGFokzFUOplsXojrU/gNkTtzNSGp9ZBSOYWnKwx5u+7WypK?=
 =?us-ascii?Q?iOUdiInw9TlxUfF7hTJS6EA77M9ydGPrcB7MJdujujuQcrRgKYZphwZ93ykf?=
 =?us-ascii?Q?Wkqjydydyy1iveuJf856iFdX9471comcCOD6gBGPIX6Yoiz1/ubtsfTaJ1mB?=
 =?us-ascii?Q?eKwDHqJf88b9OW1FksJH4+Ptsy8+i/pm3/TDovgHhOxJhXemMdSOykTsSpfR?=
 =?us-ascii?Q?wSGpPi92x/ICoRF8q9WBAsMFXDQJLFsO6DdCwLN1CvA5rda79CaKHBQHJnTJ?=
 =?us-ascii?Q?bjjvC1P4l3b/hkGHdT31EO8Mg0zjE68vG4JFL51gzWujqcClCKm+uMUnOKbG?=
 =?us-ascii?Q?iDoU6BKZlzahoWFeakcMYkEDqdNqDCPmobHwhf1hs5TbUhmbigteTr+4JqJS?=
 =?us-ascii?Q?JCu21IFhqIvxSP1X12O7/6d/PLQtMq3KcrLVAohq706sbxULaQ3JCwQxjcZu?=
 =?us-ascii?Q?5ob3H1kLVh9hMbUUwdfdsn2lV0L7/EUkXw3iZTpG72PmTqWqRkLDq9e4t5bE?=
 =?us-ascii?Q?szfHweNmlQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sTHrwyBddfsMOQsZldCEkPAlQnSDGLTvLrI3HEEC1A/eOCGPGIewcU+n4cSIbrnM3Bpyu7X14vI6lSXPxE+JH7hpY6QkIoqEksVslJmv+Pty2UngnOcaCL3AmE4iAOHrsczRZ4RoJG75zqlE/jZCQSiEwNF7FPCthPeBET52i5wxhwMf8k/3F3ch/lrH3/cDY3/4xlb5Q68mXOKpAgWAvKf6lezI/Y/k/cAxalu8fXpnA9qBV6XqyFrTFub8WU7MatD7fkLO+wgfjlpA6kE315HHXWgQrJY+tHKAVViftlvJKTipn1Bql3KLqrB1kHKKigArC02E77OqskHj2Mbzug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0904e75f-af0e-44a0-1372-08df1dd804cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 03:16:13.9932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQzeH7WfgnbmMUGODyWkE1AWc0G4Ze6GLq8iwtdvNyrLBAMT0B/oZu8MiGmwAtivaYc34J8ArZB3Qrt8Tv+cEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

> Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> override is held
>=20
> > Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> > override is held
> >
> > On Mon, 28 Sep 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> > >> arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
> > >> Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the
> > >> VDD override is held
> > >>
> > >> On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > >> > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds
> > >> > it until
> > >> > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay *
> > >> > 5 ms after the last AUX transfer. That is seconds on a typical pan=
el.
> > >> > The AUX domains now block DC states on Xe3p_LPD, so that
> > >> > reference keeps DC_off up for all of it. DC3co arms with a 1 ms
> > >> > put delay and never gets a window, and its residency counter does =
not
> increment.
> > >> > Nothing in the panel power sequence needs DC states off for as
> > >> > long as the override is held. Take AUX IO instead, which powers
> > >> > up the same well without blocking DC states, the same split
> > >> > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers
> > >> > still take the DC state blocking domain around each transfer.
> > >> >
> > >> > Bspec: 49277
> > >> > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
> > >> > DC_off")
> > >> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > >> > ---
> > >> >  drivers/gpu/drm/i915/display/intel_pps.c | 21
> > >> > +++++++++++++++++----
> > >> >  1 file changed, 17 insertions(+), 4 deletions(-)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> > >> > b/drivers/gpu/drm/i915/display/intel_pps.c
> > >> > index d4c98b150fa2..bdbaa10bce23 100644
> > >> > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> > >> > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> > >> > @@ -11,6 +11,7 @@
> > >> >  #include "g4x_dp.h"
> > >> >  #include "intel_de.h"
> > >> >  #include "intel_display_jiffies.h"
> > >> > +#include "intel_display_power.h"
> > >> >  #include "intel_display_power_well.h"
> > >> >  #include "intel_display_regs.h"
> > >> >  #include "intel_display_types.h"
> > >> > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct
> > >> > intel_dp
> > >> *intel_dp)
> > >> >  	return control;
> > >> >  }
> > >> >
> > >> > +static enum intel_display_power_domain
> > >> > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
> > >> > +	struct intel_display *display =3D to_intel_display(intel_dp);
> > >> > +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp)=
;
> > >> > +
> > >> > +	if (DISPLAY_VER(display) >=3D 35 &&
> > >> > +!intel_encoder_is_tc(&dig_port-
> > >> >base))
> > >> > +		return intel_display_power_aux_io_domain(display,
> > >> > +dig_port->aux_ch);
> > >>
> > >> Seems like this is something that the power domain framework should
> > >> take care of instead of hacking together locally.
> > >
> > > Actually it does not at least not for Xe3p which now has DC_OFF when
> > > taking AUX domain, Because of that when PPS take AUX power domain it
> > > also takes DC_OFF(exiting DC states) which is not required And since
> > > it keeps the reference for longer than what a normal aux transaction
> > > would
> > DC3CO does not increment its Counter.
> >
> > I mean the power domain should be modified to take care of this, not
> > that it should already take care of this.
>=20
> Hmm.. I am not very well versed in power wells and domains but let me see
> what can be done Without hurting other parts of code.
>=20

@Deak, Imre any idea if this could be solved via power wells

Regards,
Suraj Kandpal

> Regards,
> Suraj Kandpal
>=20
> >
> > BR,
> > Jani.
> >
> >
> > >
> > >>
> > >> Cc: Imre, which you should pretty much always do when doing
> > >> anything related to power domains.
> > >>
> > >
> > > Sure will keep in mind going forward.
> > >
> > > Regards,
> > > Suraj Kandpal
> > >
> > >>
> > >> BR,
> > >> Jani.
> > >>
> > >> > +
> > >> > +	return intel_aux_power_domain(dig_port); }
> > >> > +
> > >> >  /*
> > >> >   * Must be paired with intel_pps_vdd_off_unlocked().
> > >> >   * Must hold pps_mutex around the whole on/off sequence.
> > >> > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct
> > >> > intel_dp
> > >> > *intel_dp)
> > >> >
> > >> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > >> >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > >> > -
> > >> intel_aux_power_domain(dig_port));
> > >> > +
> > >> intel_pps_vdd_power_domain(intel_dp));
> > >> >
> > >> >  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
> > >> >  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@
> > >> > static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel=
_dp)
> > >> >  	}
> > >> >
> > >> >  	intel_display_power_put(display,
> > >> > -				intel_aux_power_domain(dig_port),
> > >> > +				intel_pps_vdd_power_domain(intel_dp),
> > >> >  				fetch_and_zero(&intel_dp-
> > >> >pps.vdd_wakeref));
> > >> >  }
> > >> >
> > >> > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
> > >> > *intel_dp)
> > >> >
> > >> >  	/* We got a reference when we enabled the VDD. */
> > >> >  	intel_display_power_put(display,
> > >> > -				intel_aux_power_domain(dig_port),
> > >> > +				intel_pps_vdd_power_domain(intel_dp),
> > >> >  				fetch_and_zero(&intel_dp-
> > >> >pps.vdd_wakeref));
> > >> >  }
> > >> >
> > >> > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
> > >> *intel_dp)
> > >> >  		    pps_name(intel_dp));
> > >> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > >> >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > >> > -
> > >> intel_aux_power_domain(dig_port));
> > >> > +
> > >> intel_pps_vdd_power_domain(intel_dp));
> > >> >  }
> > >> >
> > >> >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp
> > >> > *intel_dp)
> > >>
> > >> --
> > >> Jani Nikula, Intel
> >
> > --
> > Jani Nikula, Intel
