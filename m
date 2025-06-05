Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E94C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EB910E2FE;
	Thu,  5 Jun 2025 18:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRtbh8rg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE2A10E2FE
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749146615; x=1780682615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1X+X1UX08aqm3sl/3Z3YtI/8Xlz2knDw/P0qhUnD9lU=;
 b=YRtbh8rgQ12J17+uHJK0LQdWJpDWXZnYORn4Y9cckFE3jY6OyJymoFXi
 7cBcO0fDbICrRit3XHq/StHNOGv8T0sCbrI+T/VmMTZNxSUNHcHrtX/as
 NMH1IKD1kqTF1sh/2Qn4KXJYT0s9OwJ4/Td1TjpSD0EriScR2Y9CkhJwh
 V8ptLvmcC+rrLihdJ1fsvFJubebAGZFB5jEYXknIN8CmOKyvzTUK7cvhl
 Fco9gYmJGdjXh3H5o4VZJgI+r6mZUVoa147AeQc8DGDPco+P+xwBWitmr
 CkONAkl5vUISDNV6ODrGA4tIUjtMBZgsMJwLBV5lBpFRYDpL0lcrJXAgD Q==;
X-CSE-ConnectionGUID: I2RselgYSqeNoVWw5xTB8Q==
X-CSE-MsgGUID: NuOv8G6yQs2l8SM4EwNHPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51428118"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51428118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:03:34 -0700
X-CSE-ConnectionGUID: akJq20S9TVqJ1DKl0sbwfw==
X-CSE-MsgGUID: LUrD61HuSqSJMmQxIfUc2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="168748357"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:03:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 11:03:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 11:03:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 11:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBkVjFCBweDKRjewRmcrVdUI76ixjGy1mhl5aOVpeZmul1EiWH0YsG1dTrGgx7zv0UIM3Z9oMkFsTvYN0N+PBWlp5/FlbOU/T0GNckkUTKDOQKL0o053NaFnsZzLM723WCBWagaNmhOd51NqKOua2Merfwbcqlj5hwq4IVhMIQPg9+dhBPUYvVxLGAuHtn3qnJxcb9GtnBSBirql92PxqyQIi+uTpUhrZJlJ6kqgAzHTF50mDPxG5K+8dckUMe2VLIqyp+ytwrF30P42MGlr+00pPoHgslXJ+YGKWNa7YRNLMXK53B1E1oMvtDQGQgFdic2IvsMkpx0QKn2NJqTiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/EWeMOQ1UrvFfqyp4+e3pzWIuUoOHAxmKNuhe2D6a8=;
 b=vxE/8Oa8W++PlMp/5ZYE5k2IuR3TRFcDHWwEFP9BOFjmUH3LqLVb9dhRjtGzIRcwie7lduskf9MAfCrsnGnYszC8q7pKaozkZcK97belCs1rKjJILClBr39GjsBB3A/gyr6NH/vYpMTA7i/XvndCBMIHkb3jFYxB01tTZu5Fd607X6Ah0OqsY6uJ3CrNR0CyROwZRWMDV0yItuOazSZbOMRh8sPWF2qWgzqcafpzXV90yq663PPcaDPJ/OtIqKj7q0GrKlgSOisadUdo+m/658jrWilRJgczC8QWo8sVLurVCmEE3fuA+g9UY0ZqRRrNOaMqFSMbsWx5Nul2zv4cTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA1PR11MB8793.namprd11.prod.outlook.com (2603:10b6:806:46b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Thu, 5 Jun
 2025 18:03:16 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 18:03:16 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Subject: RE: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Thread-Topic: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Thread-Index: AQHb1WBVj8AHGxYzakCen+euf/Fr6bPzWWaAgAGDUJA=
Date: Thu, 5 Jun 2025 18:03:16 +0000
Message-ID: <IA1PR11MB6266D2F6353264ABB1C73C68E26FA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
 <20250604145236.1143122-3-dnyaneshwar.bhadane@intel.com>
 <20250604185419.GG6239@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250604185419.GG6239@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SA1PR11MB8793:EE_
x-ms-office365-filtering-correlation-id: b4b7b19a-a68b-4c57-81eb-08dda45b3f1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gDRp8CPzpxRU0OCf4gUK+p0IM4ehrECvMBVTqlYnl89z3FwPFvT4Xx3Dw9zx?=
 =?us-ascii?Q?JVqjfWjYcpfAU2fLcvUwe9EIPK549iRLSAAXBe+fgLMRSkqR9QjVZfQ8wuq2?=
 =?us-ascii?Q?CoCKS3RGJI3JRf+YMGcUlNu5tzXbJHMkIQTng074938YAeNI8rJsE87rJcw8?=
 =?us-ascii?Q?KzorBwPZqkdtoYufwurLzRlEizzp5XmEbmyJmelpCTzv3ZNcDo2qU+4q5GdO?=
 =?us-ascii?Q?X0010s/4RmrNOeIdZYFMgvEcvA7YF86+sbijgpr+aHshd8l+mrU4FDY1VN7o?=
 =?us-ascii?Q?0HktWXO7FGNJZMDuiApaJ62FiQRRiBd8fC1EK/4Lvdq850oHG6FxRAUSZGT8?=
 =?us-ascii?Q?Evar24si1d+9zFLyx6uQCOPP8AHmVpDegZTuGHDz16/Ii5m8MIvCrJu04tZW?=
 =?us-ascii?Q?ch5UNDkGFtuOmnnOv2qpANA2r3Ryhd8hgnHXmWu8Cl5lWo8RjrId+Xmp2rq0?=
 =?us-ascii?Q?2NbreM40g67SsMp08HPwQvPM5LH7xIXOUzlQmMTJTRfQcRAI9sv5JHyqTOz9?=
 =?us-ascii?Q?klojRdbq44rpI4HWlO9eJ9Yl/QauNz5BlyDwmXFIQrhUW7JQalbmRnqAliMb?=
 =?us-ascii?Q?E86LU4RMZKbz/kkCnGcPNc7h3X22fFXYOmSsnylMOnZKdv0hA8CJCj++lLx5?=
 =?us-ascii?Q?dlkdm/i3ZDH7V5XY3tIe8oaZiAHQmpl5QOiqQ2aAUnlb4+z3S5/ml1hxTY2n?=
 =?us-ascii?Q?J1G5aQLjCoUQv2NebXIe1tcuH7PeHaIT6G7U0bBMmxXB1jHv1wexBXPMHJlk?=
 =?us-ascii?Q?4Q+IvMxuGs7p18Im9WdqrctHKeCc86BJ+jPArCQlMnW822C8eCgPqBBsuyG/?=
 =?us-ascii?Q?MUAalI7WlA5flt69id9QNdwPJLsgrBxcty1r5Hd9oWNuI3fjj19z5dg4CjBp?=
 =?us-ascii?Q?vIv08UVx60BM7yd+C/4/xB5ylQT6nGLE95pR/OvMZy2LihaFv3vd3z14QgLK?=
 =?us-ascii?Q?jfiyEo00WxrCB0U43yQW9xAq5BSlsAqADpaR9BjIJfdlv9/P9f+Jql1FlfUJ?=
 =?us-ascii?Q?Oj6aR0KaaRWhmGB5G6PsUjehXEv7QMT7R63ldAFpX+jYhq99vkzRtnpU1ChY?=
 =?us-ascii?Q?uEl4n0mlVn011HrRaddQEBD8tUIkfckAPFI0YcCEh3U6Ri2tlPSHrqj6GVLW?=
 =?us-ascii?Q?yZ/XQU/DVogEscu7sSB1fOTy46V28+VbZtrZUPSHWVTVyI7PUf0PfpyHLFtT?=
 =?us-ascii?Q?t7wBTAbMd8oN9DyfZX2zAe6DU9r0/TiTz5tl7/16ph2/9KLjYkrTcb2cH4/O?=
 =?us-ascii?Q?QSBZKJJ39rc4kxAQPbaF3FR+XOE2hCeYTz9lVmjwNw3XSJVBZlSmpKhIFsBd?=
 =?us-ascii?Q?IyDWz4Jj1fkVLB0SPSfnNtJjMQ9eC7eAB8yKcpGc2fiXn6gBrvZtMzLY4v4y?=
 =?us-ascii?Q?4rrFebN2LUo57x7jLplxHmRloZkeJ3wGArunANcKrK2L07Z3eKlAcjtE2gMu?=
 =?us-ascii?Q?aGUwPoe2oUeAVVsXw7PzwimwCwyfYxZao7ncIlY1sOKr362cjQFiLBR/y7dw?=
 =?us-ascii?Q?AvqpZhSGWdmw3Jc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9D+RCADraDC56IN2bQzoEdso5fkl8yMgpludeeXOI+9xa9oV4UM30Ln08fi1?=
 =?us-ascii?Q?L7v/HgWrdTTloX0G609XtSRg3EJ/69vWgrj1yqSNTGvFzu5z4hsHgNgQ7rYP?=
 =?us-ascii?Q?D3PnP3ag8APLyxZokEFPjjS7YsNGAbyDOO5pY263situGySJmkgMLDwjIybZ?=
 =?us-ascii?Q?uRcPybDbTErj7B/6zUCKu5LLdhnuJM6JZITTaZwhgep41QTsJkBTZVY7l+TP?=
 =?us-ascii?Q?quchlRT70PyB4U2jNX9OIvNcTrP4qaCGyeowFQjJTnqjgAmSDUlDFExTR0Qw?=
 =?us-ascii?Q?uy67zcwsHK+9r6M1tbPQAomtXBDgBMyfB89iaWy3jMrluZfrVh7PTiUoFCHe?=
 =?us-ascii?Q?2NjRyh+ZBES8fo5TgxfaFxKeyUIINsjzV8puoPPRuT5BMyfH+/YLEbq9n/7i?=
 =?us-ascii?Q?pvahxzTG9lYVSA1UD4FV4i0QWIowzSUaKmJhxi5DiVsCVVoTLDHNj0ySRKjz?=
 =?us-ascii?Q?kc6mO5aDKFlNzHsVfcDItRs0awNlx/AKEiMaNqoEumY0gSeppfQL2BL+SkZC?=
 =?us-ascii?Q?pALbrVWXzofPTrUa+GyGFoLotzjtYAOujr68jS5gxhiXqZ66LtdY0awoPhD8?=
 =?us-ascii?Q?D13ROdKlFafYUtVBHhp7+skib4xddliY8NKRhKBpB6ODj4Gbb6Vf2fS4Vjw4?=
 =?us-ascii?Q?CktlHjxrE6ihjbXRu/fGGXVaHbe0jRgZ73IwFVZCoOn61X069TqLayRjwdJo?=
 =?us-ascii?Q?Gyip9rKKdqlE2CFIc2SYIb0LD3t/Ij7JsDhuBTbsBiZFdWjLgdfexOuxwCJ7?=
 =?us-ascii?Q?JWd71mSc9Xpsxkm84Tm05FtSA0KkDpB2YDrJy0fWyk5Lmokf6mtLHCgN9gkv?=
 =?us-ascii?Q?osN5hU3qU6/MagR7UO/JBO2nU4OPaGE/5jz/swFB0spIKDr3hftaufPQNidq?=
 =?us-ascii?Q?PGkPL2pe0sUMSTIXESzoNyCWNd9IrZDQDmQy+K4eGwB4PE4ziW6DUz0SeAKl?=
 =?us-ascii?Q?3oreSYCXIDm9NlG9kX9bvyKkNi2bYOBP97zd7r0oBNlIwUsNZAysiY3b6mFi?=
 =?us-ascii?Q?OH+ldEla8KkO+jc7HIvAq6BLUQ2mfvjHA+cQOWexrEvs8Tx7zXrWgQ6QHfDT?=
 =?us-ascii?Q?OpPvLc649onpIB71R8X7I4fFMFeMvLyHaWTSSjcH7Tgn78rsQDue5i9XuZEx?=
 =?us-ascii?Q?uZHo7rU4kB2ImHhIZt6bG8qPQAnTHDcxpakwz58ycLSj8z8OEFyhsILJWF/L?=
 =?us-ascii?Q?GCO/p2CZzLFjViqfhzXPzLcIDE6n3jy+PzXZbEFbvGU39+Nq/xtz4pxp35pg?=
 =?us-ascii?Q?xxYWwdoT189+Y50rxN26Ix1yMmqh4znm3ZgURLkWIDK15dgQ/xj8D/0o0frI?=
 =?us-ascii?Q?Hrb5LnoPGLRhxWfz9DF7ZJDrrbNjHwwYu5rBaJr4h4uFMJFGe26AIRDoonPx?=
 =?us-ascii?Q?u7TtYJcJEyTu9WIdb6Q7ot6j9hJjISblwten4PL/DaZGlXfRpooi9qKL8zRx?=
 =?us-ascii?Q?jwTi3RoDMimRbgHiU1NohrUYbzodubjshI0hY0glzP6+CFHn4HjLhr4bAR5K?=
 =?us-ascii?Q?10arblE3oMDW9tlKPgV9u9uLOyZZ0ZzGCOzmlDXzqyvavN9Jdqw6f+dVf7uC?=
 =?us-ascii?Q?GZv1YrMktPwzqWBsWImFOH6vmPezygWt02YpmYYpe0pa7hRmEklzhADiKhcy?=
 =?us-ascii?Q?qw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b7b19a-a68b-4c57-81eb-08dda45b3f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 18:03:16.3899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XV4r3v7fyDk5Z4ljOPuVY0W20/jE4LMheOl4dhxr7wVLLG+iruT9nUygRTXi8hXlIk4O4T5DjbZyTGV946VQ0Z8WRhgC1iL4pBmOhxshQfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8793
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, June 5, 2025 12:24 AM
> To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Chauhan, Shekhar
> <shekhar.chauhan@intel.com>
> Subject: Re: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
>=20
> On Wed, Jun 04, 2025 at 08:22:35PM +0530, Dnyaneshwar Bhadane wrote:
> > From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> >
> > Add set of workarounds for xe2_hpg.
> >
> > -v2: Fix xe2_hpg GMD version for some workarounds.
> >
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c         | 55 +++++++++++++++++++++---------
> >  drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
> >  2 files changed, 40 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 67196baa4249..2c0e0adc5904 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -489,8 +489,8 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3,
> XE2_EUPEND_CHK_FLUSH_DIS))
> >  	},
> > -	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221:
> GRAPHICS_STEP(A0, B0) */
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> > +	{ XE_RTP_NAME("16021540221"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>=20
> Breaking out 20.01/20.02 into a separate entry farther down is good since=
 it
> keeps the LPG and HPG handling separate, and also avoids blindly applying=
 this
> 20.03 which doesn't exist today, but could potentially show up in the fut=
ure.
>=20
> However is there actually a benefit to splitting 16021540221 (a-step
> only) and 18034896535 (all steppings) into separate entries given that th=
e two
> workarounds have the same actions?  I think breaking it out like this wil=
l
> actually cause a warning if run on an A-step platform since we'll have tw=
o
> entries trying to update the same bits of the same register (see
> compatible_entries() in xe_reg_sr.c).

Understood, merging it single one and avoiding the duplication on writing t=
he same bit again. Thanks.=20

>=20
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> >  	},
> > @@ -507,6 +507,10 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> >  	},
> > +	{ XE_RTP_NAME("18034896535"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> > +	},
> >  	/*
> >  	 * These two workarounds are the same, just applying to different
> >  	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
> > @@ -533,31 +537,38 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  	/* Xe2_HPG */
> >
> >  	{ XE_RTP_NAME("16018712365"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> XE2_ALLOC_DPA_STARVE_FIX_DIS))
> >  	},
> >  	{ XE_RTP_NAME("16018737384"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> >  	},
>=20
> Since this one is now a "from now on" special case, we also need to remov=
e the
> other copy of this workaround farther down in the Xe2_LPG section.  Other=
wise
> we'll wind up with two entries trying to apply the same workaround on 20.=
04
> which will cause a warning (it looks like CI saw this too).
>=20
>=20
> Matt
>=20
> >  	{ XE_RTP_NAME("14019988906"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> >  	},
> >  	{ XE_RTP_NAME("14019877138"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> >  	},
> >  	{ XE_RTP_NAME("14020338487"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3,
> XE2_EUPEND_CHK_FLUSH_DIS))
> >  	},
> >  	{ XE_RTP_NAME("18032247524"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
> SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> >  	},
> >  	{ XE_RTP_NAME("14018471104"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> >  	},
> >  	/*
> > @@ -566,7 +577,7 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  	 * apply this to all engines for simplicity.
> >  	 */
> >  	{ XE_RTP_NAME("16021639441"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
> >  	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> >  			     GHWSP_CSB_REPORT_DIS |
> >  			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> > @@ -578,13 +589,19 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
> >  	},
> >  	{ XE_RTP_NAME("14021402888"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
> CLEAR_OPTIMIZATION_DISABLE))
> >  	},
> > -	{ XE_RTP_NAME("14021821874"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> FUNC(xe_rtp_match_first_render_or_compute)),
> > +	{ XE_RTP_NAME("14021821874, 14022954250"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
> >  	},
> > +	{ XE_RTP_NAME("18034896535"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> > +	},
> >
> >  	/* Xe2_LPM */
> >
> > @@ -774,7 +791,7 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
> >  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE),
> ENABLE_SEMAPHORE_POLL_BIT))
> >  	},
> >  	{ XE_RTP_NAME("18033852989"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> >  	},
> >  	{ XE_RTP_NAME("14021567978"),
> > @@ -807,7 +824,7 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
> >  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> DIS_SF_ROUND_NEAREST_EVEN))
> >  	},
> >  	{ XE_RTP_NAME("14019386621"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD,
> XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> >  	},
> >  	{ XE_RTP_NAME("14020756599"),
> > @@ -824,13 +841,17 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D=
 {
> >  			     DIS_AUTOSTRIP))
> >  	},
> >  	{ XE_RTP_NAME("15016589081"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> >  	},
> >  	{ XE_RTP_NAME("22021007897"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> >  	},
> > +	{ XE_RTP_NAME("18033852989"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> > +	},
> >
> >  	/* Xe3_LPG */
> >  	{ XE_RTP_NAME("14021490052"),
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 9efc5accd43d..425cb401c276 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -30,10 +30,10 @@
> >  		GRAPHICS_VERSION(2004)
> >  13011645652	GRAPHICS_VERSION(2004)
> >  		GRAPHICS_VERSION(3001)
> > -14022293748	GRAPHICS_VERSION(2001)
> > +14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
> >  		GRAPHICS_VERSION(2004)
> >  		GRAPHICS_VERSION_RANGE(3000, 3001)
> > -22019794406	GRAPHICS_VERSION(2001)
> > +22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
> >  		GRAPHICS_VERSION(2004)
> >  		GRAPHICS_VERSION_RANGE(3000, 3001)
> >  22019338487	MEDIA_VERSION(2000)
> > --
> > 2.34.1
> >
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
