Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B208C02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 19:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0586C10E47D;
	Tue, 14 Jan 2025 19:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enbH3Ok9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D1910E47D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736884235; x=1768420235;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fgQSFV9rNsz044EqbdQqIZwtGF9CPACjW+8rF9P+824=;
 b=enbH3Ok9EwwqnhDFbuM9OCl4HzqWEtbot+YbBhGfKVNk1sJfZMHtKrDQ
 JT+MhmuEy8Z/qYKlxwM6vRM9oAIdi9WEcSJF4x9bLNFPz1dStJIZ/d/SD
 ijhhwvwmomB6vSH8bB93CFmPpceogyWhSRvk2sOy8yrJG3fVrDHZF0EJ2
 1NX+eY4aDdRbeSMU7YwmMHI1BeIhERWKVVdRgwC0PFLUUhLMNxlhusR16
 tagMkwhvv596MoM0Qnx4fYy/OXXuyv2zIlr0Bb7vxXoNWMKQoYflNOtXK
 Jfw8EAbe5+aacC0jfOPfAcMDxXI7cEeoSvecZ+9UqpiUzJkllbfxb+e4R Q==;
X-CSE-ConnectionGUID: KBTCUHjjRLei3pA01XPPVA==
X-CSE-MsgGUID: 8DFUedXITmSNNMrpUqdO+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37312427"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37312427"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:50:35 -0800
X-CSE-ConnectionGUID: xOuA15l+QcCKPMOov9KXMw==
X-CSE-MsgGUID: 7e6W618pTAaRy8mqpbBSNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="105431825"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 11:50:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 11:50:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 11:50:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 11:50:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0HjXQBGltzwBYYIe/9sG3FH+Qz1bmjdVL7qwruIozDJK6K4RAnAc35XS1o/wr2BrDt2hFe1pk18Cck3EJY9cEcROdyqbLJQenbM/NFGVig0TYGuSVE3B1bJPNeiEspkn8Y+sqLgGpkQmFAsGUXTjDXJ91wW97366uRIaU1R6x45C9+CieVRWerlKO234ZPbLrxLtXXj4CYaxMsAlKxGCw6XpPYyDuTBOsZvF3y2rg55qy/EQkWQQ52t/X2MR9C1FaBJo5rzvIXrvU5Kj5tkwbRcuu0SqzXH6Uyii7v5Xq1+bJq/PY3KgOC6+Pfd6SCuYEoypKbi5Gw4eXXxiVqq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RjPF+B9dFqv7vBt0n51bbkx8Kk1mmo+F9GRx7kGhmI=;
 b=N3NtU/X9JTfX0Aln7IQ5lqqsJteM/Me9NtY708rF45TpivMJK91tPbCg9xXwh2Ka+3VyjdPwhrDxyNYTSNVQoXOk+Ug/2VRB24zkjOSq1imyu1iDLcEAmc7znG28kbWyzdSW6n9IWnH8RgBOqjuinVzwovI1OubehySOLAcAmTT2epfkuZfy/Ev4CKq6IPvxp8mhTyGElEaFUYN4D5FM0S0QjPtTe3/ainYKLWb4EKWBFjyrcyqQk4kRZmjS0b60qBx5/l+VEsrfzc5QX6F2kI97ou5eFn35p1uny+2H50MHvj+psWz5wrKpcXddJe2PHQlNtsLnsRwVEDtwVWkxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 19:50:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 19:50:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/mtl: Add Wa_22018931422
Thread-Topic: [PATCH] drm/xe/mtl: Add Wa_22018931422
Thread-Index: AQHbZrcDLYLwyOxqhkes65tun/SROrMWpwCQ
Date: Tue, 14 Jan 2025 19:50:17 +0000
Message-ID: <CH0PR11MB544417CB0EB413752268FDDCE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250114190242.2026743-2-matthew.d.roper@intel.com>
In-Reply-To: <20250114190242.2026743-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB5947:EE_
x-ms-office365-filtering-correlation-id: 352e04c4-6e6a-4668-d5a2-08dd34d4ab80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PQSxIgWWQOknd7sArmdtQkj3YT8xetK7mq11tb9E1Of+sjpNL79UHpXa4QRE?=
 =?us-ascii?Q?9e+lkFFx9nF9mJBC6LRbyovmTph3I0XjHRRGvHU7GEJeIwj3CN4E2gTK11eQ?=
 =?us-ascii?Q?WjEDaWfbDDo+GCDYQ85RF8/fzSt5pvLoEBa0CbWjJT+eOmabkQiSGDWIULUL?=
 =?us-ascii?Q?lJ9PhlaHPDxuURKnmrNBo1lNpbLorxUZd4LlqBkhUp/qo49vzduDKREWjuwM?=
 =?us-ascii?Q?pCID/kT8UEFdpcJljsaA/ZFw9NOIhJ/uMgMrzZOqJVczAAmFr4YqdSWl0egC?=
 =?us-ascii?Q?weg/O3lXW1Q1PQ9iKd3iMo4uTszwmW7mNnnzvHD/sesmzln+OW2KnhS29KNg?=
 =?us-ascii?Q?w3yB65B+mBklfXZR/ZH0nXtyzqdq/7Mpy/0v+++pzDV/Kt7HhIEmjby+8WSr?=
 =?us-ascii?Q?kLbvXFB0HImT6dkd1N6NRKSxfTKbSCf7QtooqDd09swJBG4hHkvNni6aa3/I?=
 =?us-ascii?Q?inKHArn9v0167335RoyAltFjqQTF2Abg7aiP/5aPKlnincqNLx4GjgdtKsrO?=
 =?us-ascii?Q?U44z6Q3PX6dcWRiPtjWhZr+0o5cLsPkpCURM0LDdCD0KBibwVjxAOX3k/ms8?=
 =?us-ascii?Q?P05He89YfhQPgtEe1wNpwyXgwnwVu0mMQL8jPAZvkYB0ed2jT9jWqU8H1rRO?=
 =?us-ascii?Q?nZ4cw3CapfIzhfil3eHnLVdBqn/wsL7UGXTvSXIhE3b3iDiYOfYsj9eeUYDY?=
 =?us-ascii?Q?TqoKg+3sY+xDFVaRvRggxSl0jN3dyS0A70GpbrntYdh13DTWJ91uojns053j?=
 =?us-ascii?Q?kft2s+37ULv+WhZQVjB0VDyCu+NxrnNqgQIZXwR9v+X3mffN/p1dc5JjwJUz?=
 =?us-ascii?Q?fEQeEvkSg2EXk2VdwkzWFFEDlBSgZkr6fuHZ7UoHnZHxS3hhZwWGMOUUN38T?=
 =?us-ascii?Q?EOAJWYoTgZmaYomBkDfx2dkP+1KMrxMd5fUA4cN2g6ct/leqQuWf8Wi3iCcw?=
 =?us-ascii?Q?S2DvaK0LLC8N6xKY4rze0gSsXZOlVormV5spt6xKP3HO5r2wB2bsUXfem+zP?=
 =?us-ascii?Q?9F4pOoL2GhdilcAhVWdqeSWy1+gtSqHoLn0H6sXM6QFcvUfRLBYUwNOWFLzj?=
 =?us-ascii?Q?0yiYd3tmA1xKF/kewhW3NAS9vZ9xrtwgmWpEnspsTuaYaNWXXzVqtN6Fg4R/?=
 =?us-ascii?Q?Yt5XIODWQ/lEno0Psu6Fh8NL4shpdFOI1rU4EISPvIhZtkscKcSKhWMWki3n?=
 =?us-ascii?Q?OZIOYMU3raJVBPGxzpaVlvwaxDBtPpQJX5v5JSz9DuhQDg2fGdi7da/LcZbc?=
 =?us-ascii?Q?+LSJQPEqHd8/EQpjLih0l6/3nDSUFzgx77f5M/Ype0OB7Q8CHDBqkcEEgpra?=
 =?us-ascii?Q?CqgzLqedGjVIh6Q7qDGS8loGQQG8AA+pjA7SlQND6/mHAdF/oOT7k22wJAZv?=
 =?us-ascii?Q?TeIkknJnANj/dyuWP1WhU14piZ8Rd6AUIcfiDI2bLZOfe3ytFQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yHOHQ3WZYxwjshg6/Q5nnjy1AI6hdNKbBaKenjI/aUELgbGeBWIyDAxzLT5D?=
 =?us-ascii?Q?Q9ZBWJKjJ+i/PKrPWQnQeE4bYdUIC3moS/vcGS0pNkggR/KgxxB6r2MhoX4e?=
 =?us-ascii?Q?jLlNkREfjh/uqXsEw+BoowmV9vrLH5CdT4JdbroLBHhAMQ/rJzHKOuQNlh6x?=
 =?us-ascii?Q?3M4scKhHldCs5MfkC/4ZZOYdTiFfO7DtkGO+LMPoD1oriZmOOP7oTW6zcWHG?=
 =?us-ascii?Q?v+kaIomjHh9liR5eiYp30hHeX56Y52g4sJvwxacGMwb3ryVmd+6F9zKSVgKz?=
 =?us-ascii?Q?RkATCgra9ugK6AugOpXpGZyv40Gf6uYX3G02b9oiynAow+gXNiiQF9f01LUJ?=
 =?us-ascii?Q?Bdmq83mE+JgbMiycrf1zeVeY18HoqTG3jIDafV8XJredxXBR2bzcK3L7Xn3D?=
 =?us-ascii?Q?rj6RQPA9QZbarVs9pFkcA7r8XrlLMtM568x/1kGpYkewcwPvHJS2huQulbq2?=
 =?us-ascii?Q?Wrcto9pKiFGb6N3gadu7XaTjvn0J928HRXmYIPYOyO5xPfua3vx3o4/2/dc3?=
 =?us-ascii?Q?bR5rNXZnDtxRZxX1LB7yAPRFnUxADhqrBvUc6RHGpFKoHdb8WXkcqj/SDWDk?=
 =?us-ascii?Q?Bea4at6u0kFTfNWswkbZblO6pkbuL/Dt9NL1H6MG5NZp+qvfsHQYX6m+ckWR?=
 =?us-ascii?Q?/Pz9IFZua3QGmatm/BDbV64C9+Hb+EFIAclMnSyAMU34qFKgVUaQd4UWLD1R?=
 =?us-ascii?Q?/AREKJT+IA2wMzhk4XkjaU5ecmEmT1j2kHOMnwxanZc+wgNHFBaqpNt/Zpvv?=
 =?us-ascii?Q?VMLhqqMCRGLOEY/YZ0KzH1SOS+5N7eNSmmc7+/Nk7Yh8+SfhkRxchX50R6KN?=
 =?us-ascii?Q?ndZGttwMbyOEolhZAu6C3CJRBCh9RC30HCBTsPsjusM5why238iY0N7CeFIY?=
 =?us-ascii?Q?Dy1fqJQxlZHKKwmhm9E1xa0q41aoIqmmfAhYPvsFVuz3xQsdP8epS1tWiwq9?=
 =?us-ascii?Q?6VO7h6RdzgqCJ0pbF91SKRQ0a2Dx8SyWxrRYnSRkXaVhsDyhMdiv9BEbRGzM?=
 =?us-ascii?Q?W3v8tZmWeKkp42jt8wD9R0hk3PZcbtXUErU77axvkLoYhspim8QX0EQAm695?=
 =?us-ascii?Q?1Ppq0V6v1zjg0z5NgfyCN7yz/FIbmOG8OM5NBEsRCL55J4cghvlGPkR05BZK?=
 =?us-ascii?Q?kd/4A3UOQRRqtpIGkb8ajaoQo+5J0f64MSOM5jHo7iM44CNxQXpKLvGDr0j0?=
 =?us-ascii?Q?1s0P+XBNB1LOw5BiJp6CyWg9vYmgU81kepRQH8pErPGPGb3+GeC448AT41tB?=
 =?us-ascii?Q?2nDzl8Ul4HOmU8IJrX7Xy9gI4z0MhhIVNRJTb23XmkoHxJ+jk5uoNiPDo5As?=
 =?us-ascii?Q?jss3uAbmvwCUHwO2TYfGxoBd0Z7aRYQlwglMQiqCHNwtYI5EQcnUMDk5L2Ry?=
 =?us-ascii?Q?mmU8h4qqNSbdHuhHGskq9N53p/zaP2ARGogsUy/ZF264lEusbU0Yj9BWiSkC?=
 =?us-ascii?Q?ebLx+HFF90y6Mhbvx/34RzcSUdI1lCZfxcNrAGtX9lA/OA5On4Hq7OP05g35?=
 =?us-ascii?Q?MMqx0vYZv/ygd1CdbfjKPRI35/FjUh8A/GkWzS2k1j6SLXG3aJrhju31aGyo?=
 =?us-ascii?Q?jHCmdp5O4WDFnP6GBf5KLSXf4dh4JDdNI64Ul7ZS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352e04c4-6e6a-4668-d5a2-08dd34d4ab80
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 19:50:17.1182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kaoxS1oBgZzEXCSa1Ef6oJwlFAohDc+fvLqal75oVkgmFwarTt0jFMY1gNHJ9yge4kW2QW+paPxkVN3/tbe1Q+jTXN+oZrm0lgmYU5QIyhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Tuesday, January 14, 2025 11:03 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/mtl: Add Wa_22018931422
>=20
> Although Wa_22018931422 still isn't fully documented in the hardware
> database, it's been implemented in i915 for over a year and has been
> successful at fixing MCR lock timeout issues.  Bring the same workaround
> over to the Xe driver.
>=20
> Since the official documentation for this workaround still isn't fully
> complete, there isn't clear guidance on exactly which platform(s)
> are/aren't impacted, but our belief is that this should be applied to
> the graphics and media IPs used by MTL and ARL platforms.  Offline
> discussion with the hardware teams indicated that this should not be
> relevant to any Xe2 or later platforms.
>=20

It would be nice if we had something more concrete than "our belief"
and the undocumented words of the hardware team, but I don't think
we should be waiting for those to arrive before landing this fix, so:

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

-Jonathan Cavitt

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4059
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c     | 27 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>  3 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mc=
r.c
> index a1676b787fdc..f2699ac9a4f6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -5,8 +5,11 @@
> =20
>  #include "xe_gt_mcr.h"
> =20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
> @@ -14,6 +17,7 @@
>  #include "xe_guc_hwconfig.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
> =20
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support
> @@ -607,9 +611,27 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&g=
t->mcr_lock)
>  	 * shares the same steering control register. The semaphore is obtained
>  	 * when a read to the relevant register returns 1.
>  	 */
> -	if (GRAPHICS_VERx100(xe) >=3D 1270)
> +	if (GRAPHICS_VERx100(xe) >=3D 1270) {
> +		/*
> +		 * The steering control and semaphore registers are inside an
> +		 * "always on" power domain with respect to RC6.  However there
> +		 * are some issues if higher-level platform sleep states are
> +		 * entering/exiting at the same time these registers are
> +		 * accessed.  Grabbing GT forcewake and holding it over the
> +		 * entire lock/steer/unlock cycle ensures that those sleep
> +		 * states have been fully exited before we access these
> +		 * registers.  This wakeref will be released in the unlock
> +		 * routine.
> +		 */
> +		if (XE_WA(gt, 22018931422)) {
> +			gt->mcr_fw =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +			xe_gt_WARN(gt, !gt->mcr_fw,
> +				   "Could not grab forcewake during MCR steering\n");
> +		}
> +
>  		ret =3D xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
>  				     true);
> +	}
> =20
>  	drm_WARN_ON_ONCE(&xe->drm, ret =3D=3D -ETIMEDOUT);
>  }
> @@ -620,6 +642,9 @@ static void mcr_unlock(struct xe_gt *gt) __releases(&=
gt->mcr_lock)
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1270)
>  		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
> =20
> +	if (XE_WA(gt, 22018931422))
> +		xe_force_wake_put(gt_to_fw(gt), gt->mcr_fw);
> +
>  	spin_unlock(&gt->mcr_lock);
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_=
types.h
> index 6e66bf0e8b3f..2e0c138599de 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -389,6 +389,12 @@ struct xe_gt {
>  	 */
>  	spinlock_t mcr_lock;
> =20
> +	/**
> +	 * @mcr_fw: Forcewake reference during MCR steering (only used when
> +	 *    Wa_22018931422 is in effect).
> +	 */
> +	unsigned int mcr_fw;
> +
>  	/**
>  	 * @global_invl_lock: protects the register for the duration
>  	 *    of a global invalidation of l2 cache
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_w=
a_oob.rules
> index 40438c3d9b72..92a922bad630 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -42,3 +42,5 @@
>  no_media_l3	MEDIA_VERSION(3000)
>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +22018931422	GRAPHICS_VERSION_RANGE(1270, 1274)
> +		MEDIA_VERSION(1300)
> --=20
> 2.47.1
>=20
>=20
