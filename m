Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDD8C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4C310E701;
	Mon,  7 Sep 2026 09:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Svx1ibif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AFF10E701;
 Mon,  7 Sep 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788771619; x=1820307619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NHBTWBIcF/onh6+/Fevrm/bea8CGlZ/+D8XZOicuUBs=;
 b=Svx1ibifaloTgEm3WI84j4Ihe7hqLTUzcBfbBKXbDF0nj8WfOgEv9ids
 H/ey6dpM6yGbKWqdlVpJBHfoFXywlXGyQ6t4hAy34Om3kP6N8OTkH3kAc
 8rYgo4omGI4XyRH5uCdaJRBtcuMfGY7kCHN7fUp8l4C0ErOBIc+I2NjxN
 4qfxcQRGL2QL2iSDBbdB5HOYtsk47CYi8/ujUiakVKgJfc+0M8KNST0V+
 0Ci85HtPX3VwDXPwT9D7RZi9woZbHs+rYvQmQwpZ+KXqkOZqESI0E+HOB
 Phj8yspnPjiMguEoy/JGTk7GvP1dbxQx6LWTMS0GwAjeMEnLbL35/DLW6 w==;
X-CSE-ConnectionGUID: UMMAO1k0TgexwZxxNf+2nQ==
X-CSE-MsgGUID: jMSbIq+mQFS7meDbcgwoFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76729027"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76729027"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:00:18 -0700
X-CSE-ConnectionGUID: owESmhTiSJGF4lc3Pzu+xA==
X-CSE-MsgGUID: JWemZLfhTGWmZPGAwDVTbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266964277"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:00:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:00:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 02:00:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdMzSWmlFE+MLgEXN1529G/kXYSr1whGbg/7gZENzORLyzgoNdUkVL3tW1nXS+Up6YV124o8cy1wrjnJ89Nl0ZRms49Ek+aFL1BHE0u70NzdpH5uqBY3f4RlYm2haW6hSbTlYBnL8nLiIp57Dml9+VU9oXaAurP3nm4suXJyfyuwfl4Uj2Qppsf4kNCBnB7Y3FUfBdJoaz+n2uKgLwaHB6DWkPQD86Q+zAMI/2Y1AUgEIkUCD/paUDJU+P6azUUdlnjJxzja04K1ygIKLV05Ojd2uTLxzPOFf7DF7X9Ao18pLMuQvsSnu7PGJAqQMP4O9st9SvlIGxp0tk4qYtRDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxNPJHaO9vtqQUpU5Xa7F5AQWXwW80WA0F8HOCgvY58=;
 b=mwgpmgfnhmvZAC0S9XEpg3NFChfYRXPDz+8xxPbEERbdh+ikN2pHKP8Aa8OqaI1zMVosGeP+ktAMTI/f6bL8Pa+H/wm8bVjRBCmatm/exAB/L4FEU8cESWUArAy+mRjNsqVhV3ybB1aUYVPFPHSTx0u3UyDluq8u3CDF56eZXDnusp0vU07My4HETnwVGnYkfCnsCMEAnUzOl3Ax1khNIRe57yYo7AHFMsC4shEAbDm9s+kcDtEvr4HuBPjmf+Y9AiqBNq16Ah6JBaCE4Sv0CqYTOBx1bBGJQL1v2ABGvD8rwlWl+jXsDeauHxEdk9NAa84Xl4G//j5yYcneeZeI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:00:14 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:00:14 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHcph3FsqS1/K+rvUKHMUB9V0aQBbaQNTGggAmVQACAKjdN4A==
Date: Mon, 7 Sep 2026 09:00:14 +0000
Message-ID: <IA0PR11MB730774BFA9F655401274EE7DBAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260225061110.385441-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307A07B980ED412AAFDBCE2BAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DS4PPFE901A304FB98A4EA3E8BBA006864EE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304FB98A4EA3E8BBA006864EE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: 842e7614-5f48-4b7e-a568-08df0cbe6e54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: WGfpK3zFJkgaC91G6jn9trsK3HqR3zBLw16MvXi9ZQKjboSXS/wxueNTJhFQg7c5KfLsAwRK36OzifuZT3FvrvUS1BCTe0r+0vnRSTzeWlmKetOLttTewUMeA56R8TcW2g7RogD/pGD2y0MNhvzAXBXDD2mknSBpx8V1xNKUyMRApW2bfCOXovn8zehaMoCi7r8LS4sh1zwLRN8xMdVxtrGQfAm3BrRiXu7iDtuZPj68jmzUN6NetlOhvGLG8B0A07y+nPFBxe5rwgGtIo8C17EwEAJn+FPLJSWrZKCt1L6NdZyhgjCU9kE2Ugu2eC8pZkMxNrOA/MrJrq7MS/N/PtPSxnuNnFrlW2JRpfgzjrQWnhIp1sntBSSxH7eFVLAbi55C+EGJ5lMF0gbjIZmWCUZ0lzR9Gn+GdeyrvZnqMwTBVbHyH35s5ulv9Rd4i+CAYQfH7BT23de1Rqz1t0vVnw/NQGGjiwYYdOTwXaQzpz5hyQb1xqNiByi1FOoGR+ot5o51znUZ2JhjCguGaOSTnYSbDwFBHwwlmv59Ig6I98TfdapphAixIuKTIuW1nLf9PT0FPeQI/rCdi/kpfFJyoIxNFOn34zxUiHCmi7U2+JmfCtvnIhKXPchqE11l9Wtzv4My+TOYZ7p2reyAGGFDply6KI7K/upxAkIxGBZp5qE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2w0w6u/lXT1m/1cdRg57ijPst37ZEMtvVMtW9h5nak1UWBAMEalG8KTAX9YS?=
 =?us-ascii?Q?9SzUzXt92EbgiUJPzq8DnX3bh4G82LLYKwDs2qjY3Win6Q6G+z7y+xnrreHt?=
 =?us-ascii?Q?7WEOC73jsWBvv/xQZieufi9v3WtqgKS3PD+TuqXbpjNSHFzqp3Ezfu2w/4oZ?=
 =?us-ascii?Q?PqCIBZDQaPzhGSnbN4uK/A+/vUI1XpHNxndpgmYIki110PM43592/cTguiBE?=
 =?us-ascii?Q?7RP235MPvf0Y1R+P8FMsLPqIR+8XbQAfzsToPHoqKkvfItsZQJGouUCfKlJf?=
 =?us-ascii?Q?Odplcy5Dm2aPM2KK6Z2ZN3XnBwNitXZwGUGwCvVSaPVDxGXXiQ4HV+j8n/17?=
 =?us-ascii?Q?SUEwZRK6bGO+s9IAE/ip7dBYKobS7GGeJE8Wqp0TsHhYCWhXGC9FnwqUS3AJ?=
 =?us-ascii?Q?5nvtilQncL81CrdKiF3gePHWpDivasV69wuPO/QYnT48becBIXoXHZ+KaOI5?=
 =?us-ascii?Q?2wg3pHG4tjtwxv19S3TJ/UcfaBjkFCZ3ZWxamRTjRwVPSpbvfKjALcHz773i?=
 =?us-ascii?Q?hJ16P7dbSgE0LWZlYclEglZDM74ARXc5iVYT8qx7pQs6hgL1kNB3G2ZOpRHt?=
 =?us-ascii?Q?sFFqo5t93lNMMEyAJN4b8TnGKYwjPKYpS5ER40CIrdRk7GMQaT55+FxgaqVf?=
 =?us-ascii?Q?Z66Zcargx5lph3hUcVlKZ79rpxmWRyDuvze3DkovtzsnJ0gD6KjSshniTz3F?=
 =?us-ascii?Q?hmvpnrc9zKCVx+fTzkO3fUhXyn01zl+tZnGOyl5vSJAZ2b1UEFjOG/b2WdAy?=
 =?us-ascii?Q?eyfcBBl+WTv9naNEjXnUMwE9XZgOPk39WLBtenZJ1hcS+PLkVjdo+c1I+G1V?=
 =?us-ascii?Q?SLCNLVUIHMF44QhE00DnBrrm5HghZ/URk3DNgsZAfKJNMiofx+1uFZTQ/yA4?=
 =?us-ascii?Q?V0H02gRcylPxBy05ERrLPeUp/EqWTh3wcXbgwni74ku5uqK6Rk+ohgN+AILX?=
 =?us-ascii?Q?MFvZAMwSjGb6V2KJuOFboTy2bYbe2he2vIO0MTw0lrX/sVw6Q3abJVMFe0cY?=
 =?us-ascii?Q?2b3FstxDVuPz1jL3XHXP+x1n+8ejiK1HK7oX2yytxy1fWJ3IqDjnxsGzTgQm?=
 =?us-ascii?Q?uKyNBw67i3AhrPIDSL9y4oxUFhpdUh0YmqOR9pRF1kvO0e49av3kPNwgVisU?=
 =?us-ascii?Q?XssRjhFYdDEgmdrjP4k3tNKOE2n9gp5YVtJeXIFfto4MHuIvZTU6mXVbNufM?=
 =?us-ascii?Q?5jcx4ATDPf6IgqFvT0heJrw4FnhQHlNwYeJqgySAyo6ce462PRGQeBzHeZ+j?=
 =?us-ascii?Q?CyWD0T6AxqK9ncRqJ20wKK1lp4BLqDHguf4EL3w8C6xh4e/eR4stn26EtNen?=
 =?us-ascii?Q?ePTx5LhhkKv4Uk46/ikeVpv8qbu8OeteuJ5IdCtzSxO65xTSSm9Jm1B1w6MG?=
 =?us-ascii?Q?A/U+ZmC0yFG05+vxS9Rh4ooB8y3hPMqEuYJ8vukmUUB+VGOpp7KhN6RfB5FZ?=
 =?us-ascii?Q?DHotRywlNtvqQFVwK/eWPB4Av8Y0ZbCsCdoatKNOl9TrdlWczMJO+MFJbh/i?=
 =?us-ascii?Q?j13uD0W5LQZGcE1+bCtqBJoWLYUtJ6GO0rGskK2MMUKlEJ+5XRBXFzts7ASj?=
 =?us-ascii?Q?r2jtmouWt4GcnegEpE0YCTSn6A2QciTrKwaNYY2351RLQgSC6/9YeX3ouPTt?=
 =?us-ascii?Q?rOOg2bjZq9Px8qElFemWRKsl0YQn1cQ9XeLaKSNdOp+p46zXVw+sBykmmFtr?=
 =?us-ascii?Q?K74UA0ivTyWGzkkw2LWgbIkMExzoGUKAznqf96KUdSF2IAMLpuueIAZZttv/?=
 =?us-ascii?Q?7tRiuBOzsg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: StZnDpwtUvOnDs8zekGeLknw65yStHBOAuCuczMttUl3C2Fz6xS6gayOL1+KANI9VzlDv0l5XWCYRtWbKuviDd6orQhy+SQHnRssVXarNO+LsUIpOh8Npq/tHIzautRMMa281euTzYvYXhZGOpJUc6JeOtyX6BPafur44HzeyKnXperfzTJXrRcuw2vwAEsuZ3R+iYewcrtieuf4ZQ0JSL2IAR0xRlKHYmidnEobE5wEeDOedrxWgG5ixJ59p2M3rqy7CdG4vNSbU0d/+0GBmR96bZ8U9jOH7tj0LPI6yp0y2HNY8jB0RMwOrJqktMU22+K+hDwQ8paf57VaqA9x/A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842e7614-5f48-4b7e-a568-08df0cbe6e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 09:00:14.4194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoiLMDyx25ybbV3JNWOPA+SaHNPsAB9qHDJEtj39GRTDnCm/PCCmXOpRxollzN81+49fo9F/filzJjVlLbOnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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
> Sent: Tuesday, August 11, 2026 5:47 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-gfx@lists.freedesktop=
.org;
> intel-xe@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Nikula, Jani <jani.nikula@intel.com=
>;
> ville.syrjala@linux.intel.com
> Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
> > Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
> >
> >
> > -----Original Message-----
> > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > Sent: 25 February 2026 11:41
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; Nikula, Jani <jani.nikula@intel.com>;
> > ville.syrjala@linux.intel.com; Murthy, Arun R
> > <arun.r.murthy@intel.com>
> > Subject: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
> >
> > Its observed that on AUX_CH failure, even if the retry is increased to
> > 1000, it does not succeed. Either the command might be wrong or sink
> > in an unknown/sleep state can cause this. So try waking the sink device=
.
> > Before reading the DPCD caps wake the sink for eDP.
> >
> > v2: Use poll_timeout_us (Jani N)
> >     Add the reason, why this change is required (Ville)
> > v3: Wake sink only for eDP
> >     Remove the dpcd probe set to true/false in wake_sink (Imre)
> >
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> > Closes:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> I think this reply messed up something in patchwork have a look. Moreover=
 its
> not building anymore.
>=20
Ok

> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 34
> > +++++++++++++++++++++++++ drivers/gpu/drm/i915/display/intel_dp.h |  1
> > +
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 025e906b63a9..38ea4aad74de 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4705,6 +4705,38 @@ intel_edp_set_sink_rates(struct intel_dp
> *intel_dp)
> >  	intel_edp_set_data_override_rates(intel_dp);
> >  }
> >
> > +/* Spec says to try for 3 times, its doubled to add the software overh=
ead */
> > +#define AUX_CH_WAKE_RETRY	6
> > +
> > +void intel_dp_wake_sink(struct intel_dp *intel_dp) {
>=20
> Should this be renamed to intel_edp_wake_sink now that its used only for =
eDP
> Also I think this function can be made static now.
>=20
Done!

> > +	u8 value =3D 0;
> > +	int ret =3D 0;
> > +
> > +	/*
> > +	 * Wake the sink device
> > +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> > 0x02
> > +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it
> > up
> > +	 */
> > +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> > DP_SET_POWER, &value),
>=20
> So we have recently switched from using drm_dp_dpcd_read/writeb to
> drm_dp_dpcd_read/write_byte I think you can have a look at usage and Repl=
ace
> it with that function here.
> Check https://lore.kernel.org/r/20250324-drm-rework-dpcd-access-v4-1-
> e80ff89593df@oss.qualcomm.com to see what that was required.
>=20
The existing functions readb/writeb are still supported!

Thanks and Regards,
Arun R Murthy
--------------------
> Regards,
> Suraj Kandpal
>=20
> > +			      ret > 0,
> > +			      1000, AUX_CH_WAKE_RETRY * 1000, true);
> > +
> > +	/*
> > +	 * If sink is in D3 then it may not respond to the AUX tx so
> > +	 * wake it up to D3_AUX_ON state
> > +	 * If the above poll_timeout_us fails, try waking the sink.
> > +	 */
> > +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
> > +		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1
> > sec 2.3.1.2) */
> > +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> > +				   DP_SET_POWER_D0);
> > +		fsleep(1000);
> > +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> > +				   DP_SET_POWER_D3_AUX_ON);
> > +	}
> > +}
> > +
> >  static bool
> >  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector
> > *connector)  { @@ -4713,6 +4745,8 @@ intel_edp_init_dpcd(struct
> > intel_dp *intel_dp, struct intel_connector *connector
> >  	/* this function is meant to be called only once */
> >  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> >
> > +	intel_dp_wake_sink(intel_dp);
> > +
> >  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
> >  		return false;
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index b0bbd5981f57..3f16077c0cc7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -232,6 +232,7 @@ bool intel_dp_dotclk_valid(struct intel_display
> > *display,  bool intel_dp_joiner_candidate_valid(struct intel_connector
> > *connector,
> >  				     int hdisplay,
> >  				     int num_joined_pipes);
> > +void intel_dp_wake_sink(struct intel_dp *intel_dp);
> >
> >  #define for_each_joiner_candidate(__connector, __mode,
> > __num_joined_pipes) \
> >  	for ((__num_joined_pipes) =3D 1; (__num_joined_pipes) <=3D
> > (I915_MAX_PIPES); (__num_joined_pipes)++) \
> > --
> > 2.25.1

