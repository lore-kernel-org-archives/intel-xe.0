Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA3EC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2FA10E924;
	Tue, 25 Aug 2026 07:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjWADMQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E0F10E924;
 Tue, 25 Aug 2026 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787644597; x=1819180597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tw6lgHYp5lb3hjZwJV23Iq46lwc3JfBdDhRumGXLwG4=;
 b=QjWADMQgFoltuzPGnzJJ6PWRrRbzUEyCmH0DIEb0VrENJ+1oi0N/12PJ
 nUs/zHusSJspQHzqdCgUjm3CE4Q3C7JKUel/5vb7UW73GeLBbEy5QyK+r
 zhAiFKh7X+6f0M1scwWICMJ6fxNmFzzGjMPSZsNxOI/gcGjFXXbhc+G5k
 6r2RTCjm8dOHOn9cx3F+JrHA7SjI3NFB0JWmOjroGTTQif9iG5HlZHRls
 260HArxaFiSQZjSZGnJNyATIGDIrQTfL6f8J0sDH6qEK4Go9hRsl9voZr
 H3g/c0YVavw02wTucLiJSiZhWctEU6bUQHwSD6rkVpAqrd/WejAEUyCAH Q==;
X-CSE-ConnectionGUID: o4BLBXFUSHCgvAk3n34tUA==
X-CSE-MsgGUID: VviqI5MRTMiHUX1PlhF7CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88232320"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88232320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:56:37 -0700
X-CSE-ConnectionGUID: TZ57q6/PQamb2i7bDgf26w==
X-CSE-MsgGUID: qqN7M/iHRVaBO9fUUnNhKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263481842"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:56:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:56:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:56:36 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VilBCeStk4uE9vZhqq9cbOeYBUZiSfgiwDpSP3PYJr6veJL6Z9MAFpIwebJJZax710Yoy1diwZiS7z6f4iPmINbiKnA754eyWfOEeNJ0l1ngidR7EPAPwvfONL1pGHn7S1OEerI0IjVEDXtwxyOqd0n7/bk9YiU3SsZkQKE3Ul/1oShMLAd7pyvtB9sXeuoVGDpj8T8f9QHCdo7CgeLDrlEQuPdjGwkPMQNzlrfmoBmiT/dZhYWxfg9ZXGi0VO1sOLM81Llf8esBAyN++xUGRlVSa93atu72V9rdck+FoKapUrduPPicfRuZR5vk87zSWUCMH8hFk3TZ6yjo3bIpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSLlTcJ7wsN3mOYwfTufXQwz369sa/l0pAYYpS0cuFw=;
 b=NPEB4x17EqIhJUNipzMo4DZ3IJ+YRyso3BKCPq2lH47lhdQz1HyIvyyqz+cBwPhm+7Yq2YtUlq49bknuTOx5PJcpK5njUqoLyS2jpaDgrIONaXarjnA5qHCJbapWxLFkhkjVngyV2Lrze5oqGPC4nK2LDpYUl1Hr7csqY9GOkKnARXEIvaVzEaZvOZpfJBS7NJkdOxhVo4X7KjIpK7DaY1UZkwqjPePS37znsY6S2WV6BmgZf4fiEvNGfeaa2+OzzSxG4VADP6PyaiGsoivtENAvIrBrG1rhAtmhRq8aPjwUQW4g3lf2+ESQwuUTkrykipHAiN/885dW6x96efafow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:56:27 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 07:56:26 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
 capability
Thread-Topic: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
 capability
Thread-Index: AQHdNGVIQrysojkq0kqCizDePtEQ/7auZDCAgAAAnvA=
Date: Tue, 25 Aug 2026 07:56:26 +0000
Message-ID: <IA1PR11MB634880F643696AAC01CD8779B2AF2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260825073204.872441-1-mitulkumar.ajitkumar.golani@intel.com>
 <DS4PPFE901A304F509E49BFC04F3EAF48DEE3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F509E49BFC04F3EAF48DEE3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DS0PR11MB8208:EE_
x-ms-office365-filtering-correlation-id: 2d8f194a-029a-4157-67dc-08df027e5d6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: lnLCdTE52MSWw5rjhrcjCTdeLhrgz5n21SJWBDe69lLHMHb6cxQJkh47OzGRvJkXyCMcTZPWxFhIS4UkIFsmrZ8pXoLH/qfPLI+Ue5LxRHbInX08HfyEATlA0iPQs2yuKg/rZzq8OTV8qgyXhFnsrAiTRYaKNmeHYbd/E4mpBZSh6MyL6DkcHlrHBZvXTL0PT8LS/otjbfhuQnc3fyuQimbbqwkh2YWuENXsSLgbZP+eS0BbugIDx4QnRTWZUfuehJK5OYy2rUqtxcuAde2Yawed3oeUjIPbb9k2bSRbX48+/NFUN+31ha/aMRS3TMSf+a1QFNP1O9V7P2+e632d9HGiXJhl0xgcjbxcRejxUJuP2weI0hFeVtZIFJaWL1X9C5QP2GafU9cDVAz8pJ1GKVggAaxZXb4kxTgQyiaFv37i1Dmj7fok3ZqA553iG25LKkuZyQfwqRlwxa5wdgMB2WDO9m7QkYiJ/r/H6OinQX9H0fLtTFHXuU82BmakBe7rswiLYGHwnYPp6kQ36BZG/PI/7fYRNF/ZEWYbfjXeE4kvVEckNYF3ZLac9It063PUuhnG++pNReTFwrRzgU5YSQRXYQQtI8RdyPZGo84KwFha3IZMsdaGMJ/wEJ9eW10wXHrTJuZkqLuz0aqKKpKjpv2bl1tcmt84X+2HgAy3Y/mwuWYGCYy4y9MJSg3BbDGJIJpeXy9m+0gloEhiWOSg0KbsWhztD+SWEZMRt1s586o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZYgnlymZjVrV48AkEF/NvdDHjT8UV0PWTN4CaqiuyNDsTePJS5+kuvQqE/Fn?=
 =?us-ascii?Q?oEVrSV5yahakUgzo1fV3j9bj3LKgl5/niJZotuUHvLHf3PPMdF8vfRQdEoCN?=
 =?us-ascii?Q?OE+NvUze9ZHH5Qz9sI7mg+X/Gn3eLrIZ8NVCtkcKZ52Ty/4ZASxfjFvwRmVz?=
 =?us-ascii?Q?2kSq04OmFUx999wfkZMt2aBCZHCgbtBEc4l8ZfJH/Ya/VEH28+ktsViwR/ZW?=
 =?us-ascii?Q?8iC54xmogawUsLdWKIpLSF/gyuIeDO5L5I7CxIQo5jQ1Dd9oDJaj7V+/fPP/?=
 =?us-ascii?Q?/4WEfA2/ZwGC6RzlT+BGkMbaBKzviV129ixjHE6jWWxCAAmknSgKuUmjJg2p?=
 =?us-ascii?Q?g2VmeUKd4GIgIytTayFadGsVjYR7gF62hZpSgeNcyksiktOSupzU0gghTHQl?=
 =?us-ascii?Q?MMliv+ymZ/JUyleMjPH74GsgT6jTLRCYeUImZkXjMvaCe0OoY6Wr8J3/mQmb?=
 =?us-ascii?Q?AG2T7N1qz7tnN25nlgvvTceR8cWiQ+C1efF41buELEqmGh/YRB3lAk23AgBZ?=
 =?us-ascii?Q?igflftDKwOKsnCXfxTYJI/bnOXn9eIhy57Q6QC9UFbCXOUT5I3d+bisPDRSz?=
 =?us-ascii?Q?HPe0tSEJodHnYiAid1+b9AaOfrvs3D3o2TAtBununxZqdOZtYHkXkEiQKsza?=
 =?us-ascii?Q?1Dm9V7/82lRyjrOLJNw8HSNhmuzZJTseXhDKv+Jtsmt4RMjTbX38HY8eD8ox?=
 =?us-ascii?Q?siC5p3RngH38qNijZ5SE1Y0LStSUogmTrRGzIsSLSoKys7+gxHVEWhPyaPVN?=
 =?us-ascii?Q?qSey3y5vPy7U1AfzKLBzIIIKWyuvbGjpUjaWcByHF4Bth9qTl3BgMqAJK22x?=
 =?us-ascii?Q?KD4vCUkrmW0yzwstRUzTZ9Sg2FAJIeQZktCSudnzzOsq7AtxeUUlwLFIUPE+?=
 =?us-ascii?Q?lO0mrKN8nLVIIAXswPeWm9ZmmEhe++gHAML2Ujh6LJf52cZY6InJsng3JA4l?=
 =?us-ascii?Q?yLb3qPf5UZotwTY7HV/0BwwlN9idyzIdMepp8QiCR8kXxRLPg+LKdK4IyN3S?=
 =?us-ascii?Q?Zs8KLzjWVAdy0ecIi8lAafzMRlf7hL4QqEgphd8gGiKnFd5k153fv9Zb/hCg?=
 =?us-ascii?Q?QVlF+X796glHG+hQQJRNrAZZ3nOimHWD3xwbvrFjJsFXIjl2XOsT7y/Y4BVR?=
 =?us-ascii?Q?eBzWWRxKRi6w6cd9G31yhWvKnbkX6ta9BV9qsz/McKW0UrlS7BbLDDSKcNsF?=
 =?us-ascii?Q?MtvMNFp6q75PbtrmdV7qp79Dn43aHdfB6b3fRAMoXtUN7SYt2J5PR/zMofWS?=
 =?us-ascii?Q?xaf/QPm6tcF3FYc9IqLcqLs+71i0VJ8RJNGYZU0JMoHFbKvdlsMXG5saXg2F?=
 =?us-ascii?Q?ChZxucgxSkUwmVQJeVK5V5fQGzBTRxa992iRs3IK0yEP163UcF0IKn2e/2/t?=
 =?us-ascii?Q?eZAOZkuL52HJxPA9bobnsOjO9SKqslbuwfgOHNfYCfOv4S8+2gbgMT2aNarU?=
 =?us-ascii?Q?pft2iWoyhspoMcaJoCZZ8ppeoI5SaHwi+p7Ibg2EA1Gw4Z/GfYseXTBvGvAl?=
 =?us-ascii?Q?bseqjJ290w1w+YXd3mukPOMY2X2DQ/3C8slmHmLROmtrKSJStdZ4szCctbLM?=
 =?us-ascii?Q?Qw4GLWoS7uKUrDMzFjfLAHfLZvYeW1vFMV4gcfmJ585A8XObxU2r5MNaTmDe?=
 =?us-ascii?Q?IucZH+yPTtXrnNCKzIYzBPdshDfrLVAaLq3tVzpfKRQn6SfuxtjjK46tckVh?=
 =?us-ascii?Q?1PTnMgBc1dEBHKxJQ1r6IjqCmDW/ezdGUK5SNziidiMVLg4KlumsOW3gpzOW?=
 =?us-ascii?Q?Gn75i23T6+ZtCXmj9HZlYFEhsfI+tmd4TWHwcTwQtHv9/wScD+qO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m42j1+gvSjI5QUnAggQA7qFyNeOS40RI7RdkgfIU5goO8m1wrs00IuZkropLryfxv4IAyCRg0WnNLsDqrwNkkJuXUSQaUCpeLmmLqGIimnurKdnxJp2Wggj85I2fki+hw503jSa1HpwveuxxHzydzzoNSwJHy7rkVnkPLADX/vGom41KPx6ZqemPWNjuclwHwi9I9vKH6CRTr6FgpxpZTwGIl4jVHu4ySEkb2WV2cmCpytteVDIvyy0UC0i5S2lm3JVlh1ykReS/UidGDrYmiG+m2tibHTM87PDZdwF3OYMVqg4pK6wakRfEki4nHPT98f8gQQiGcDloyTWPu3OGpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8f194a-029a-4157-67dc-08df027e5d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 07:56:26.6170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXocvVRvl0FtDIq1BP/VkLjiQi/sYgoOBTNHPCB1P5XjM4G7yihvdyezHZCgy2oqRcEtxx3RUUK3kiW8kxZdCiDQEFV8LKDb71EvB7xew16NbugwAA9+UktmnLcdERxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 25 August 2026 13:21
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Subject: RE: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
> capability
>=20
> > Subject: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
> > capability
> >
> > SDP splitting for 128b/132b (UHBR) SST audio must only be enabled when
> > the sink advertises support for it. Previously sdp_split_enable was
> > set for every UHBR SST stream carrying audio, regardless of sink capabi=
lity.
> >
> > In MST mode SDP splitting is inherently supported, so the sink
> > capability check
> > (DP_SST_SPLIT_SDP_CAP) is applied only to the SST path.
> >
>=20
> [2]
>=20
> > Fixes: 8853750dbad8 ("drm/i915: Enable SDP split for DP2.0")
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > --v2:
> > - Correct the name in the intel_dp struct. (Suraj)
> > - Add the Fixes tag. (Suraj)
> > - Explain the reasoning for guarding SST separately from MST. (Suraj)
> > - Add a separate helper to read capabilities. (Suraj)
> >
> > --v3:
> > - Use drm_dp_dpcd_read instead of drm_dp_dpcd_readb. (Suraj)
> > - Move Assisted-by above Signed-off-by. (Suraj)
> > - Add the versioning diff. (Suraj)
>=20
> This either needs to be moved below the at [1] which you will have to do
> after you make a patch Then resend it or it needs to move above at [2] No
> need to resend can be fixed while merging.
>=20
> Regards,
> Suraj Kandpal

No worries, in any case new version needed for below change,=20

"> > --v3:
> > - Use drm_dp_dpcd_read instead of drm_dp_dpcd_readb. (Suraj)"

Rest we can fix before merge.

Thanks


>=20
> > ---
> >  .../drm/i915/display/intel_display_types.h    |  2 +
> >  drivers/gpu/drm/i915/display/intel_dp.c       | 44 ++++++++++++++++---
> >  2 files changed, 40 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 20a07ea06b5e..5f0fe18c0614 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1951,6 +1951,8 @@ struct intel_dp {
> >
> >  	bool colorimetry_support;
> >
> > +	bool sst_split_sdp_support;
> > +
> >  	struct {
> >  		enum transcoder transcoder;
> >  		struct mutex lock;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 6b60e0a1c8ee..0cd5e6b5034c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -3409,12 +3409,22 @@ intel_dp_audio_compute_config(struct
> > intel_encoder *encoder,
> >  			      struct intel_crtc_state *pipe_config,
> >  			      struct drm_connector_state *conn_state)  {
> > +	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> > +
> >  	pipe_config->has_audio =3D
> >  		intel_dp_has_audio(encoder, conn_state) &&
> >  		intel_audio_compute_config(encoder, pipe_config,
> conn_state);
> >
> >  	pipe_config->sdp_split_enable =3D pipe_config->has_audio &&
> >  					intel_dp_is_uhbr(pipe_config);
> > +
> > +	/*
> > +	 * SDP splitting for UHBR audio requires explicit sink capability in
> > +	 * SST mode, whereas in MST mode it is inherently supported.
> > +	 */
> > +	if (pipe_config->sdp_split_enable &&
> > +	    !intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST))
> > +		pipe_config->sdp_split_enable =3D intel_dp-
> > >sst_split_sdp_support;
> >  }
> >
> >  void
> > @@ -4456,16 +4466,25 @@ void
> > intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
> >  			    str_enable_disable(tmp));
> >  }
> >
> > -static bool intel_dp_get_colorimetry_status(struct intel_dp
> > *intel_dp)
> > +static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp)
> >  {
> >  	u8 dprx =3D 0;
> >
> > -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> > DP_DPRX_FEATURE_ENUMERATION_LIST,
> > -			      &dprx) !=3D 1)
> > -		return false;
> > +	drm_dp_dpcd_read_data(&intel_dp->aux,
> > DP_DPRX_FEATURE_ENUMERATION_LIST,
> > +			      &dprx, sizeof(dprx));
> > +	return dprx;
> > +}
> > +
> > +static bool intel_dp_get_colorimetry_status(u8 dprx) {
> >  	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
> >  }
> >
> > +static bool intel_dp_get_sst_split_sdp_status(u8 dprx) {
> > +	return dprx & DP_SST_SPLIT_SDP_CAP;
> > +}
> > +
> >  static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
> >  				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> >  {
> > @@ -4765,6 +4784,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp,
> > struct intel_connector *connector  {
> >  	struct intel_display *display =3D to_intel_display(intel_dp);
> >  	int ret;
> > +	u8 dprx;
> >
> >  	/* this function is meant to be called only once */
> >  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> @@
> > -4776,8 +4796,13 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp,
> > struct intel_connector *connector
> >  			 drm_dp_is_branch(intel_dp->dpcd));
> >  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
> >
> > +	dprx =3D intel_dp_read_dprx_feature_enum(intel_dp);
> > +
> >  	intel_dp->colorimetry_support =3D
> > -		intel_dp_get_colorimetry_status(intel_dp);
> > +		intel_dp_get_colorimetry_status(dprx);
> > +
> > +	intel_dp->sst_split_sdp_support =3D
> > +		intel_dp_get_sst_split_sdp_status(dprx);
> >
> >  	/*
> >  	 * Read the eDP display control registers.
> > @@ -4868,13 +4893,20 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  	 * the OUI/ID since we know it won't change.
> >  	 */
> >  	if (!intel_dp_is_edp(intel_dp)) {
> > +		u8 dprx;
> > +
> >  		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
> >  				 drm_dp_is_branch(intel_dp->dpcd));
> >
> >  		intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
> >
> > +		dprx =3D intel_dp_read_dprx_feature_enum(intel_dp);
> > +
> >  		intel_dp->colorimetry_support =3D
> > -			intel_dp_get_colorimetry_status(intel_dp);
> > +			intel_dp_get_colorimetry_status(dprx);
> > +
> > +		intel_dp->sst_split_sdp_support =3D
> > +			intel_dp_get_sst_split_sdp_status(dprx);
> >
> >  		intel_dp_update_sink_caps(intel_dp);
> >  	}
> > --
> > 2.48.1

