Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF3ACC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 15:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ABF10EC40;
	Thu, 15 Oct 2026 15:53:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D3110ECFC;
 Thu, 15 Oct 2026 15:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079608; x=1823615608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GD/aZtSCwsXWz517LzmMElw2sdT/yeqAKb20hkHRc/Y=;
 b=JCasI3N0I0lCOp1pZJA/rxVBbLy5Hx6nV1Gs2nefsdVuwu0B6FwH4u1g
 fjqJ2thYWFmiSDXAsjd//tDPZPjTKfXb9GzyZiTsWnVFH1NIpk4xSQiQT
 9iNhWJKYtzhl/8byijwFftuey3sUWn7xHaHBSLd5JkwRU6XJLJKQ1TF5x
 1cwMb/EA1n1JlfBS+Yxg8HUZ8ey6l1QoP983TBn/gRVLl87FqazcJPbA4
 cuim4QEEFS+P8I+eODGt4cHUyOa/Xy0r2Vh3OkBdbV2trj/JEw5vGNIGT
 u4okIR2u/JTkr7hiiRwaEKDh54WlMNfdwV1x7sxhFLHCLbCXSIB+T3TbI A==;
X-CSE-ConnectionGUID: jgijXPjXSLO8iRfYctT+zw==
X-CSE-MsgGUID: 29AMe5QdQ/GF/+kN0o1VYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="743190"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="743190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:53:28 -0700
X-CSE-ConnectionGUID: cBm5QhCEQiqNT+nuMeuxWw==
X-CSE-MsgGUID: azIctzZ1TAu+mr2w56syZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2156002"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:52:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 08:52:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 08:52:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 08:52:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+T/oiW1pViuP86g9SE6k09UBRG4LQF64OLxevLPTZvqAgefvgtgI7spR0moVj01RX8quel4uTjxUvMOszVY37lRZna/NsSh/vQZY8t/oCtGvu/Z6gIa93ygX5AN2aqRfvNIRdgAz8liHh7cU0Jx+rTACfR1NHUc6YTliB2OodbpZDxOdlTaX4cDxKxYlSq8NBfSpRjXkLmr27ouucwLMtE2JmTvFEbVjgtPwJ4LFiMk9wUoyMVqsA2W/8q4hcZgTGOqfJ4PJOUnBFhFv/sXCqlyiw9IIJBRlRH67KQUcbEAOMOy9pzU7M5ZuUF9ljsBQrRgmq79JcWrGKPXNuvaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlnsuhkC7x9TUR7Uty3NTTQMwIYRtgoi6drkUN12XpY=;
 b=Ptq6Kga280iN2KoiIpAUvpgEeUFaMrTIEzWmT6W/Z2Gr4/81cgGclfYNdYmLEw+qpIgFxQWa3Da2bLkJZaIJ+arATIu5pKzyN85c6lfmpXvp33nHdf4cT9au8h5OX4RdjZ4bw6uB2258dCAuqbL1gWzvOkMJ9CxA7D4V0F/nJFLu2iJ5Rl8aVnpYk+E3Za/rvcELqdZHWHDGRz/e/X72v/pxrvld0tqrN0LO1qB4lA2BsBEbmZ0bKu6FepHtq5IXR+syg5eyUC5d5uU2aRXRvHZLtrNgMOW4DddTjvu1FtxRnafft2WARhcEEV1mBxkxOC5D6gMxkYji/MwLTsObBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by IA4PR11MB9370.namprd11.prod.outlook.com (2603:10b6:208:55c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:52:39 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 15:52:39 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Thread-Topic: [PATCH v4 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Thread-Index: AQHdRmKFd8fbiCMW50ysJ+tPHqzCtrb+40zw
Date: Thu, 15 Oct 2026 15:52:39 +0000
Message-ID: <BYAPR11MB3783D41F61AACCC6928B351DB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-3-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|IA4PR11MB9370:EE_
x-ms-office365-filtering-correlation-id: 7765aa2b-61d2-41e5-b905-08df2ad45709
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|10067099003|3023799007|18002099003|260925021911599003|11063799006|4143699003|260925022911599003|260925021311599003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: fqUt65o9ES5Ny4pQGBZTjdBZYSwiyr/5W58MEaI2DNPEIDTDWTvIpcKuSCQNOlp4VAXhpFxatYFkQc2geVrV/0ZWKxXHsjZcrHJhLqN3IuzbHt//7jQPcA6b1s4XfyA/ToWbMEP255XeCfgYOa4TvminfTHYAMn1wHpsNmvbWOy1dHfPxEUHHN9fVOFrgsUH6IAC8rVudDynHLnFIU86jZnDcuS9YJ47vBl59x1QKhTLCOXC+iBi8nZrTB6K31BEPuerU486KwtAvvWR/UVDK3K3Nmvr692ICOqQ/VVjgC0ztgOPoxJCpVshYZA1IAdUFNbWDYk8owUeBXORokxOVZDG2i1YTBSNmAycKbf78Ea3ILtM6u4Jx1n46UFPu/uGeKKeAGkteKReb90e0VtzEcbLacnqLkTZQtcIK3DAfL4J9n51ZkuGXo5nCqLEjimD9y9Aw6s1Btbr5eYW2w9mHnEwqKoDcBava18/Vt2YwkjyxkH09nddMt+Jql7dDtl80LFNoBOTuRBFYYnxa4tLHgthU/X3rpy64GJSBLyDxvK/mnr87ynE3WLJSUgZK3K2NmXwUF929IB831Yo4/ObRR30gHJfCLw45M9BqTPapv4+0QuFuhYTdtd8i38mpLgzM+stew4Zeqjrx6hBmm9yYeBcZ4IsXwinVJn5WIgId/Fp6sVlSMckehmd/C2GjRTrGUhtAhsVn05X2+DLY9odmZ1dwEdAMVLo6TzRaKrbItM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(10067099003)(3023799007)(18002099003)(260925021911599003)(11063799006)(4143699003)(260925022911599003)(260925021311599003)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aR77w6mhnvEVlhrx7NJSyaZ/dsrchhm/eXGTKR+9LEGzLy4TwFYYDx0zgOC8?=
 =?us-ascii?Q?v9Q+5199ES12b7T1vrhaXTc80lVpYQj359cYDeMAh0YCPriddkpUUZ8oAEuv?=
 =?us-ascii?Q?eminnsQZPDm8+W0kxoj7B3hHdiGYRBhGs6Hta5CoJV0iZ8L+U9Ov+UaVK7hZ?=
 =?us-ascii?Q?JKSgVoUz+/smjPFIoRpGP5CPl1MObSi6U/q3dDC85r9nB1cqBRaWcRCD2u79?=
 =?us-ascii?Q?SHQOQCspFh+VYoqW2Ig4OvG9aokrIAy0lnUaV2M5oUnVD1lrHvUg0Fw5IyT4?=
 =?us-ascii?Q?lVdvtXlTqfrhZN8STcZom0eICVi56GvEfUDuPBRjVoRI+mkquiyP0J5UqDLy?=
 =?us-ascii?Q?TXztmQbmjR15gxADOVtpOnAcwImgExQVambGXyxsduJJtWHsZGsUHzEf6qX7?=
 =?us-ascii?Q?0WqRU1bQzyxL/nXO+BjF7PzU9VvSA+9/8x3iv978sN/DR98/KGk2+ZZsmF9n?=
 =?us-ascii?Q?MIen4Uuzf1U1ijaPDHBYHiqWqcuxmGsQc9eR0307NgKFvibPGyok6493NJ0i?=
 =?us-ascii?Q?KkyXegcx+LSQXt772VQ4f5vmE9BSk5RnEWdKuCOiqZ18J625Zq1evpnbnjbI?=
 =?us-ascii?Q?9OFHs+9OYQ6PSk2aNHCjtA6XQa7a88/3jmzNedbQK9YHfbxEsarl5R04QSu4?=
 =?us-ascii?Q?R1d5aU9uoL5lWaRGClicnAo3sv8MNEPLYs37DfGK2rz+2YjdiLOyJn1b/NM7?=
 =?us-ascii?Q?pgXxXTob1ItotrBeBWt+gH3trqDYAU4s4WN37SPauyswTNIWi2oHl1PmSmog?=
 =?us-ascii?Q?BEnWDvR7yUpPB9NJRpkKkmDb+iAiXk5tZL2JfNqRNEOtA/xflvnMyok/TKF+?=
 =?us-ascii?Q?7IMLc6gKeeIHW/GtrSwJCNbLGp8ILZI1OgOZbOiwY2oyml6gd2aelQcgaV+u?=
 =?us-ascii?Q?PcWUPQQyRarc4T5LawgR3M46Nc+VjBVX82BDe27OCMvTzwsNeEWyRJExUr4/?=
 =?us-ascii?Q?sOM40qWKI+/TwANlaWdNH4/46Zb1jo9mtUn6F03miYmt4MpNs4Yo5y0NioMn?=
 =?us-ascii?Q?kUGqfLgUBuN1N/HkE/x9dtRlfQUis1PGFzmFPzhGw2Nkzugj486pFV0LCmQU?=
 =?us-ascii?Q?50eXCV+22pPy1M8kFYFP+3oYpm/mj9zQz1RkSMJN/27nbYJIlmikII1QShZc?=
 =?us-ascii?Q?nCNXJQDhBEeXkLGgoCnH3ZO56ZBlArPimzAJ9UUe2XbozS3CIHjNNkoni7Gf?=
 =?us-ascii?Q?9w02zGmLQaNJt/oIjg4rJUPRQNtNY3fEUAEEmsE6MSPEsdLv39xvI4WYdFrQ?=
 =?us-ascii?Q?yxVqYIqyKwwLvSq6MTQOxUJXcCgI9tkCv4kY4ldOUWEU5LUZqGscymOvlJ7G?=
 =?us-ascii?Q?mwPHJL1AjgdrjrOwqDgrCh+31bXRte0jehTt3kL9mo4/SOR8uMAhimIyG6ir?=
 =?us-ascii?Q?xBFZPK10Ll6k7DwTVDXTKSQbgUw4q0spDLSrp+y5TUG27Ax+1xYx8kHwfRDe?=
 =?us-ascii?Q?IyXxYd5xUFI8QwGKsT95Da+gasW/j5wbRq3bbXjNWS9AF6fcM+dgiXo5D0z5?=
 =?us-ascii?Q?ehmUthcGdoKpmUNZDTLIBMggFmyMQiucPUaPapc+fRI1LYppKVVHGnB/BTUW?=
 =?us-ascii?Q?Jf51sbyAGi1THL6XoBOEQUagzdINcGcVanFJhFRG3U7pfTMTaOFGjZV1DXC3?=
 =?us-ascii?Q?eaVd8i1lPWgPVHGGRac3LZHJgTOX9cEk+9fGf//f29o5B3MJJfFnaxX2IkjF?=
 =?us-ascii?Q?1CmMNFPHzk1JhZvNaExrXObqIuV2Q4538YMIvTbRGkMqvHW5QHgLpJpy/vtd?=
 =?us-ascii?Q?8wrHNVnJ4GyJddNNfMJI8SIJOQW0qkI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xMf2UE/Wef5pUSW7ZF8xX4bjNsgXwXioi0N2VbHTbSmrjic2hNkTf+mFXDjnokp3iPdTIvMxoA9QQjwJq0YwU0CYdoHTmgOKxPxvE7Qz54+GcjiV2EHnI5/KhifS08bz4mawk9xUoGpif09eEjuKzVolfnZBVDMFgwwk4wwiuixcrocptTeLeggbcJYbvzdbKZ/qYHxfQeVHfCaI60R2qPnfAEez+9S0ndAzsnvXVSh6f8zOwpetJ7yWyrDtQ8nzqIBaQnSLFELbsuIMN3B/p9sZASNDmAw0b3fNH0/+tm1hyoW7dyLtW7I8laJjNYoozvRyhJRdYrXi3f49N4yc4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7765aa2b-61d2-41e5-b905-08df2ad45709
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 15:52:39.1507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOz44Ie2vlYUQE3YNTVEr4OKl2cROjg8AAy3VPx60+SaobEujXKJodQph64VA9uJWgy17bfw7ry6vUxnrcZX1EUGkGvrCfgyhl0vmrFSJk/wN7gBcJQ3ZwhQLxokClLK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9370
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
> Subject: [PATCH v4 02/10] drm/i915/dp: Limit M/N ratio for DP SST
>=20
> The hardware cannot support DisplayPort configurations where the ceiling =
of
> the Link M/Link N ratio exceeds the limit the transcoder's timing generat=
or
> DDA can track. This limitation has always existed, but it typically wasn'=
t
> encountered without the use of joiners and DSC.
>=20
> With higher resolutions and combinations involving joiners and DSC, this
> constraint can now be hit in certain scenarios.
>=20
> Restrict the link configurations to those satisfying the constraint while
> computing the link config limits, so that the SST and the MST paths both =
get
> it, and so that a mode which no link rate can support fails early rather =
than
> deep inside link config selection.

Nit: This check is inside intel_dp_compute_config_limits, which mst_stream_=
compute_config_limits also calls, so MST compute is already constrained. Th=
e subject ("for DP SST") and the "applies only for SST" note contradict tha=
t and the "SST and MST paths both get it" sentence. Please say that MST com=
pute is covered and only MST mode_valid is left for the follow-up.

>=20
> Also prune such modes in mode_valid. Note the ratio is the pixel clock ov=
er
> the link symbol clock, and the symbol clock is not monotonic in the link =
rate: it
> is the rate divided by 32 for 128b/132b but only by 10 for 8b/10b, so e.g=
.
> HBR3 has a higher symbol clock than UHBR20. There is therefore no single
> best link rate to evaluate against, and mode_valid walks the link
> configurations instead, only rejecting the mode if none of them can satis=
fy
> the ratio.
>=20
> Note: This change applies the check only for SST. Support for MST will be
> added in a subsequent commit.
>=20
> v2:
> -Move the M/N ratio check to the link rate configuration phase instead of
> during M/N computation. (Ville) -Prune modes that cannot be supported
> even with highest link rate due to M/N ratio restriction.
> v3:
> -Rebase on the link caps iterator based link config selection.
> -Set the constraint up in intel_dp_compute_config_limits() by narrowing t=
he
> link config filter, and fail there if no config qualifies, instead of ski=
pping
> configs while iterating them. (Imre) -Use a limit of 4 on DG2.
> (Wa_14014191401) -Walk the link configurations in mode_valid rather than
> evaluating the ratio at the highest link rate, which is not the best case=
 for it.
> v4:
> -Add iterator for all dp configs in intel_dp_mode_valid_m_n() so that we =
do
> not prune any mode that could have been supported (Sashiko)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_display.h |   2 +
>  drivers/gpu/drm/i915/display/intel_dp.c      | 101 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h      |   2 +
>  4 files changed, 107 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index f04a6f97e05a..c53163d7c082 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2641,8 +2641,8 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
>  	intel_reduce_m_n_ratio(ret_m, ret_n);
>  }
>=20
> -static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> -					   int pixel_clock, int
> link_symbol_clock)
> +void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> +				    int pixel_clock, int link_symbol_clock)
>  {
>  	compute_m_n(link_m, link_n,
>  		    pixel_clock, link_symbol_clock,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index eecafff167d3..404168f4213b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -523,5 +523,7 @@ bool assert_port_valid(struct intel_display *display,
> enum port port);
>=20
>  bool intel_scanout_needs_vtd_wa(struct intel_display *display);  int
> intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
> +void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> +				    int pixel_clock, int link_symbol_clock);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cd5e6b5034c..f6a2152c4432 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -61,6 +61,7 @@
>  #include "intel_cx0_phy.h"
>  #include "intel_ddi.h"
>  #include "intel_de.h"
> +#include "intel_display.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_jiffies.h"
>  #include "intel_display_utils.h"
> @@ -1265,6 +1266,34 @@ bool intel_dp_has_dsc(const struct
> intel_connector *connector)
>  	return true;
>  }
>=20
> +static int
> +intel_dp_get_max_m_n_ratio(struct intel_display *display) {
> +	if (display->platform.dg2)
> +		return 4;

Please route the DG2 limit through intel_display_wa() (INTEL_DISPLAY_WA_140=
14191401) instead of a bare platform check. Right now the Wa ID only appear=
s in the changelog.

> +
> +	return 10;

Also, what's the BSpec reference for the generic limit of 10 ?
> +}
> +
> +static bool
> +intel_dp_can_support_m_n(struct intel_display *display,
> +			 int pixel_clock, int link_rate)
> +{
> +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> +	u32 link_m, link_n;
> +	int m_n_ratio;
> +
> +	intel_display_compute_link_m_n(&link_m, &link_n, pixel_clock,
> +				       intel_dp_link_symbol_clock(link_rate));
> +
> +	if (!link_n)
> +		return true;

link_n can't be 0 here: compute_m_n() fixes N at 0x80000 and only halves it=
 while M/N exceed 24 bits. Please drop the check.

> +
> +	m_n_ratio =3D DIV_ROUND_UP(link_m, link_n);
> +
> +	return m_n_ratio <=3D max_m_n_ratio;
> +}
> +
>  static
>  bool intel_dp_can_join(struct intel_dp *intel_dp,
>  		       int num_joined_pipes)
> @@ -1300,6 +1329,31 @@ bool intel_dp_dotclk_valid(struct intel_display
> *display,
>  	return target_clock <=3D effective_dotclk_limit;  }
>=20
> +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> +pixel_clock) {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_dp_link_caps_order order =3D {
> +		.key =3D INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> +		.dir =3D INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> +	};
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	bool found =3D false;
> +
> +	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
> +				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (intel_dp_can_support_m_n(display, pixel_clock,
> link_config.rate)) {
> +			found =3D true;
> +
> +			break;
> +		}
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	return found;
> +}
> +
>  static enum drm_mode_status
>  intel_dp_mode_valid_format(struct intel_connector *connector,
>  			   const struct drm_display_mode *mode, @@ -
> 1454,6 +1508,9 @@ intel_dp_mode_valid(struct drm_connector
> *_connector,
>  			return status;
>  	}
>=20
> +	if (!intel_dp_mode_valid_m_n(intel_dp, target_clock))
> +		return MODE_CLOCK_HIGH;
> +
>  	/*
>  	 * TODO: Even when using a 4:2:0 sink_format
> intel_dp_output_format()
>  	 * will always choose a 4:4:4 output_format if the DFP can do the @@
> -2654,6 +2711,47 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct
> intel_connector *connector,
>  	return true;
>  }
>=20
> +static bool
> +intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
> +				  struct drm_connector_state *conn_state,
> +				  const struct intel_crtc_state *crtc_state,
> +				  struct link_config_limits *limits) {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D to_intel_connector(conn_state-
> >connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_caps_order order =3D
> +		intel_dp_link_caps_connector_compute_order(connector);
> +	struct intel_dp_link_caps_filter new_filter =3D
> INTEL_DP_LINK_CAPS_FILTER_NONE;
> +	int pixel_clock =3D intel_dp_mode_clock(crtc_state, conn_state);
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	bool found =3D false;
> +
> +	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> >link_config_filter);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (!intel_dp_can_support_m_n(display, pixel_clock,
> link_config.rate))
> +			continue;
> +
> +		intel_dp_link_caps_filter_add(link_caps, &new_filter,
> &link_config);
> +		found =3D true;
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	if (!found) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] No link config with a Link
> M/N ratio <=3D %d\n",
> +			    connector->base.base.id, connector->base.name,
> +			    intel_dp_get_max_m_n_ratio(display));
> +
> +		return false;
> +	}
> +
> +	limits->link_config_filter =3D new_filter;
> +
> +	return true;
> +}
> +
>  bool
>  intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>  			       struct drm_connector_state *conn_state, @@ -
> 2770,6 +2868,9 @@ intel_dp_compute_config_limits(struct intel_dp
> *intel_dp,
>  		limits->link_config_filter =3D new_filter;
>  	}
>=20
> +	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state,
> crtc_state, limits))
> +		return false;

For MSO (eDP splitter) this uses the unsplit clock, while the programmed li=
nk M/N uses crtc_clock / mso_link_count (computed later in intel_dp_compute=
_config()). Does the DDA limit apply to the per-segment clock? If so, the c=
heck is too strict by a factor of mso_link_count.

> +
>  	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
>  		return false;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 04fae203bb69..aa58833a405b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -239,6 +239,8 @@ bool intel_dp_joiner_candidate_valid(struct
> intel_connector *connector,
>=20
>  u8 intel_dp_as_sdp_transmission_time(void);
>=20
> +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> +pixel_clock);

nit: This is only used in intel_dp.c. Make it static unless the MST follow-=
up needs it, and if it does, say so.

> +
>  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> intel_dp_link_cleanup(struct intel_dp *intel_dp);
>=20
> --
> 2.34.1

