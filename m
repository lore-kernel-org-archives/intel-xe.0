Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF50C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 20:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAEF10EA01;
	Fri,  9 Aug 2024 20:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzMX0CEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00A010EA01
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723236494; x=1754772494;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h5wyerhd18GN3QEyaSr0PDYZuMp4/9WGm0GrVfRMlUY=;
 b=FzMX0CErFcw6bPHdVruZl3Oqnp+WdPtzsRFOTaEhfg3Z303Rf4F9WtHf
 gicmqQ93zkmsDRu7YGBX07B9JKrfoLJSjbnrxi2hyClXOKAJGxYeBReBt
 YJuvMe806hBCxM4gB7jeX/Jly2ozOkgLqGrcMuZ21AxOfSZFd0okApwFK
 bTa6iBFwK+AODHVP61qkdyLU3tzXahqgC32eMCUA+lGJuPA5u6YZhOU2j
 OkGwYH2vACsj8J+5vE4Z6gouMflhFCZjIhlcoCAgAWhHlgJzROrK6+ngJ
 f3oe3yD092Y+LG3kNPSRLSIkeo4ai4Ts+BfPsVDW8rWlj7GxGIZ/vVgzp g==;
X-CSE-ConnectionGUID: tFUf8l4sT+eYUvK2/R2FcQ==
X-CSE-MsgGUID: GNYeIqVgRCSNrUH2CTfBCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21556346"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="21556346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 13:48:13 -0700
X-CSE-ConnectionGUID: xj4FFijTRJGaMG4CafmgXQ==
X-CSE-MsgGUID: M4yb4ScLR6KZpBGLXQEwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62514530"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 13:48:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 13:48:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 13:48:12 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 13:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQ9M3RolBNRJpov8lxDaJrTMJJJY9DC0dr5dGJisQ1hXHXEpvot3gGngFKQ8MG+iFb7j4ULwMUiGda20465971G0UmR00xdhz/GrE95EpP8kUzz2gFL8CCWGc8uyduDCAimVJjcUbHnngW92CGYdQmtBEYytCOZDuAr9vHWdhE3MDBcsLzyOrjvgqID8tJvHxXA+0q6o4/+H5EvzDuq+qJ8Jfj9POdQgH95sJRVDIEIKn4TTpfth88MAsI+2nU8s8A+mtwn7aSUz9trYEbqwKR21OsXVsWXvDsolLrDjYDHqgCC2V6e7reH+L4r2l1ur8ctLtuR9QIunCaFWJhgcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoI9rbCPUG+3piIcKkFg0H3tTYXUbQ4e1X5kIfRzaTs=;
 b=jXJsj1+U5hyhBdZF34kpzRE5jRxcbD45ffObxBmttk7UVTILLpy7EY3YQ0LScr5KYVX5xHiYwr5XBAeujp8z+yt9lcvqOw5k4v2I2TUQZQeJ8SBOfgfAz56xJHatRnBgJ5qc4r/kwwTWEBWY2GtfM0a712QouXAYd3XjWuqpQF4Y5gUXjNVhfmV5y7Tfv7QTNp7AoHYpwipt750lxC0vZYsUsQLiEiM2T0cQm9a/HOVX+LTqg2ddwKpQnwkm2aODTtmM1QzZimK3nQbdTeIw0g+zP3pKjLta4wsDcKgbbtSq2ewiqhHHh+ugU6dHoaj9O68o1kxjp7OYWghYu4DocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 9 Aug
 2024 20:48:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 20:48:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/5] drm/xe: Only enable scheduling upon resume if needed
Thread-Topic: [PATCH 4/5] drm/xe: Only enable scheduling upon resume if needed
Thread-Index: AQHa6pEL3xWwcceAwE6OjoydfbsvH7IfZY5Q
Date: Fri, 9 Aug 2024 20:48:10 +0000
Message-ID: <CH0PR11MB54443BAFA606FE472E71EACEE5BA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
 <20240809191929.3138956-5-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW6PR11MB8366:EE_
x-ms-office365-filtering-correlation-id: 9af1fad7-9ef3-4f21-5ca3-08dcb8b4944e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1CmHDpggreKdPELGLib1JrkoMjNfmFteR6VBzqSqU+jb/3ZO5xQHKGyIwAHv?=
 =?us-ascii?Q?EUki54Mgg1j9Hx2l6lP+vtWbVBTE+FET8t1oRJUEgFTKuhJ6T317/fn4w2w1?=
 =?us-ascii?Q?xDX5BYkp8ub4fqS8qERwNi9gjDK4HfuXzVUXW6pTer5zXVNM+Me6sPmq0gcg?=
 =?us-ascii?Q?xxQymXBZ7vQuvRWl9fptnU65d7lRDS3qV8OhycB/eb8nRPly5TU8MhPJOnlL?=
 =?us-ascii?Q?RlBoXkljA55ga2zGOuWoaVUVnqDXHudGOYzL+9Bl0vM4dRp0a0QJM8OX0+2o?=
 =?us-ascii?Q?U70IWb2juny7tmN3CIRsg0tGp//vCARUI+HPuZgqxlaspF45z68QOyjOSVZv?=
 =?us-ascii?Q?+l7fEVD2fQ/Ij3C8aeWj9eEvLWTK0OlgNlz0clbQuSvaVfqk+tvdZ/uwR6jD?=
 =?us-ascii?Q?ucRjGnmfJdbWOTnz0axAoiNMeEwrwjiOnxXAGa8quA5VZWp0BCTHdlwYyLIp?=
 =?us-ascii?Q?OBZJCrF30a2h+5jbf1Ax5DgP7VuQM60SkI5bMNmAARvCW7skAUOtfeHXF/dI?=
 =?us-ascii?Q?xEikdgIXEEW+5955rPKoA8DJmo1ugQ1gt9K9Ne1zbC3+gdpukaflKyAZy0+O?=
 =?us-ascii?Q?LRBc8HjKpj63sxpRaYUIWEb1Z6WiwKTFI6z3/Z2l7owqfO+R7VNk+ZjCZkX8?=
 =?us-ascii?Q?Cbxtl442cgan5nT57gEP5R8lpnSAKIoyzyHcDk/P+clo2XtFFQiYZnPqImVv?=
 =?us-ascii?Q?6k5lyZ1aNzH321U6ytu1kKxHlSYoTp8o9YQABkKhcog5PYqDrgsBYmOU6pDK?=
 =?us-ascii?Q?r/2Uke48746L9N/fgRsUtprQHoKLh+A7Zzy28fMTLQazJdQJTK05+qbUlXE7?=
 =?us-ascii?Q?OiW4aPCx8HdkqwKhEHx+rcRQ7/fBd7nHRUYGdV4gsjmcM2DDtNohXpqe/9Ts?=
 =?us-ascii?Q?OIhmDE1vcBKc2DMKiojSrnhZctYaFaoebJjgxArWdt4csXqTg3SWyibzyc2w?=
 =?us-ascii?Q?7YxWcPKwbnhkf9TxXJzWvzxoOHc7tmBdiag8ng6nONiSZ4/1b1539ybWTFTl?=
 =?us-ascii?Q?nmnRWvlriA9rNMXf60dZuVWMVsLme+WzSeNJSMcQ5frF7Fbn0Dhnl4+EwgUC?=
 =?us-ascii?Q?9WYVZBVxdROAHoEKQswmWuilN9q3Lc29E4ZYnk8UMVo0CD/v59/8A8k/xws8?=
 =?us-ascii?Q?bFzolvhiHDeFOFb+/L5I5LbPHoUdffCFUBGSD99MKJWhkSpoUy08VpB+I0cY?=
 =?us-ascii?Q?UW4LoyvJBDhYWX69zYi66/1YuTCQ2W8I3Yq9xHtaPgT+S3dxF+otHNZWV1EM?=
 =?us-ascii?Q?L7GnG1YcwOj1XIksWkAAn7HXDtj88+0SdOpvU63zbLlKZXnJ+z2LUFlzPkT2?=
 =?us-ascii?Q?WCSiSEBOSTDTdFfFuy+8Ow0VyD5GxM7Vcn0aQww+P1UHix7ZOS2eT7O2sC+x?=
 =?us-ascii?Q?RKW7tMQlSFDH/UDyg2Jju1SMGlGpHX6bcBZHL/qnW/XeMTvUyQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EhDVISo8wgCO/Dt9IIzsPZCzBQKiaBcWXc1F5J1/XSQNNNIzWNt0XjNWSyGh?=
 =?us-ascii?Q?cFQhESh/+cvVDWYFh7BZYxR+e0gBHoqF3NSHX+JMHO+8mH7MitQ7WkCK3Gzv?=
 =?us-ascii?Q?CmP60+c8fxiw2qV4040IcmJX4iwjtR2LFcYAaESJbp5MSYdJT231xunq/gIL?=
 =?us-ascii?Q?TNL/tLnGpgvFNM3X6mxwnwIE3MyqOQDdWUqwFVjoIfLCtGX31c3TZrNgwzPJ?=
 =?us-ascii?Q?jSFnP9kHvd/gmfahXpvP7v9x6bSqOeLcq8LcHR1pQb1HLh66HmsoV7Ybw8B8?=
 =?us-ascii?Q?r8JUP+y0YrzKcf0VLwtoeNX3PqYMzafdKRzAFthnnAd1kPLG4/Qz3s2HiiwN?=
 =?us-ascii?Q?n0zg7kd9ajmbEgkoyUfASaEyJnSamcMS4+U8ZNbgHSnEdaQySnyr4SGUuIeo?=
 =?us-ascii?Q?FjktLJBIRaLF6UPfHPjzHovpS8xyIBpx4tnrIIR5Cftw5TFVVgKPmXrS2NeQ?=
 =?us-ascii?Q?q3Cz/DjwmUnKGFFfCWiRyjvqpnshfsDU767PstLa249s7jPDxs5+NH4qJggs?=
 =?us-ascii?Q?krbLqyi4X/rrsxIemk4DE+HoHpCNOGYPHbpucibT/iEzNtx49Icx9Q1LQZAu?=
 =?us-ascii?Q?TgkwVbF5hPsNfZzEFZ9TveKRs/luqUNlV+3RfQFNQbikeyRUpdh9T0Xkw8uw?=
 =?us-ascii?Q?/dz5ONp8NaDQ7acydR7xkt1pwAQ7xbT3YUQ5xXYq7xQbsMpe4/86VJ/7tWNM?=
 =?us-ascii?Q?vV+7ffrBbV11n6YRN5ixaUmoDxxspfiLce4YUjnTMgcdE54ZRJ1OU05sCvu5?=
 =?us-ascii?Q?wvUgMk/ry1/9K5K5tqNFmXjdL2SwXiImGHPRY25iQf5mHEXPDJzITHYJued5?=
 =?us-ascii?Q?03RsKqUvPffEvdNqzI6Qe1fHz3ZXH2OVW/kOSlYJLngh5emzXfDSwHVaC6BJ?=
 =?us-ascii?Q?sAGDjsbCeZmOZwzMIR0iJWRB/iZSFjn0L0N7HCwrC1ymhHm858Yc3D7fwqm8?=
 =?us-ascii?Q?OcDSS+XCsAfr0x135uJhjVZIUEXjvt9sBZxE6WuMVmqoAqiv1syzp4Uo++uh?=
 =?us-ascii?Q?bitfNJ74w8Kxw08dcE/RKpO5W9UlaNIgc4cz5ktKTFvZx2CZvCDE39ZxSXiM?=
 =?us-ascii?Q?yQB9lSGaByrtlxC223PErlno6wK+vLAFuZjGHBU1VRVPytT15mERR8LN8wOT?=
 =?us-ascii?Q?qE0/CtYIq9RyJu2mOZFlk7mgfhpgv73Z1Tldx3nt9x4r8NyBDaQ3A/WeD7t0?=
 =?us-ascii?Q?C0UvFltQcNu1bidpSCvI28JRyie9lEq35DdXvcMc9Rr8hxqSxLFA5vXSJNli?=
 =?us-ascii?Q?9YkX1pdyQDxc0KsqkvwuaH/B70NOVegW8X2+XL6JxJlkHj/Ja30bitM3kKAC?=
 =?us-ascii?Q?mX5+6iUk18wQYz4atDGwJSpBLoTx93UpCDmGUzsJ4WfkWWLc8rL32fInYG7m?=
 =?us-ascii?Q?QoFYGtRqGzNdOhVCO+1djvADoj8vCVF2BN2kd+ovADO8zlS5M4s7whH/HNT5?=
 =?us-ascii?Q?O1wswVxOEA+cLbsCvskcynQhfePviAVLkeRIzuaJkTabd4LgcwRTOR3MscFU?=
 =?us-ascii?Q?LLZ/nfTiSWQly/vKXXUJD25JzLQCaqDrazArENwLHneBfgFDANS+tPmulTH8?=
 =?us-ascii?Q?83Zj1uBkU1XDlQYrsKXSylWf1aK3SHJiF9igzq/miZy4Okd78/qVfxT/PO53?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af1fad7-9ef3-4f21-5ca3-08dcb8b4944e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 20:48:10.1348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjweRuKF8ORY6su1In/UG2z6GzJbqzH/c1ZcQh9AeBXRNAuMmgwCsDYmm7y7Rtzn0FP1f2Fl3YKVIW0w4wbNcaOfWdwi1baeJ0nHBOlxbIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, August 9, 2024 12:19 PM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH 4/5] drm/xe: Only enable scheduling upon resume if needed
>=20
> No need to enable scheduling in already enabled.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Makes sense to me.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 460808507947..a9af33ff8aa7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1374,9 +1374,11 @@ static void __guc_exec_queue_process_msg_resume(st=
ruct xe_sched_msg *msg)
>  	struct xe_exec_queue *q =3D msg->private_data;
> =20
>  	if (guc_exec_queue_allowed_to_change_state(q)) {
> -		q->guc->resume_time =3D RESUME_PENDING;
>  		clear_exec_queue_suspended(q);
> -		enable_scheduling(q);
> +		if (!exec_queue_enabled(q)) {
> +			q->guc->resume_time =3D RESUME_PENDING;
> +			enable_scheduling(q);
> +		}
>  	} else {
>  		clear_exec_queue_suspended(q);
>  	}
> --=20
> 2.34.1
>=20
>=20
