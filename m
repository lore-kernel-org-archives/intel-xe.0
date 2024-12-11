Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED59E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 09:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84EA10E037;
	Wed, 11 Dec 2024 09:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQjsh8cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111210E037;
 Wed, 11 Dec 2024 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733908441; x=1765444441;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tzXhVItMRrIcpvEh8r0YnudXXZ2qo1ZRQw30jwt+TQg=;
 b=OQjsh8cxTV9ESOCkzfkSKfIdxVt+vIt8hoJM0Pf4JdyTe8PUf2+fXmfV
 suIPTgF2eUU/Vdqmy/Ex2bcllGid9tx0Zk5/6HMIHNQdRGUwryKC9vUQ9
 SsZwZrHr91/Qir/AXg5SKGLoEWMkdrjXxeQj5YqltscZ56AWpIZIU+4zx
 CJpl/WbzcQ8di9BuB4mGXRdWZt0E/ULne48maHEUsjfn+jV0iWNwZi9GY
 S5oQ9kFU0UKYMsZGAa0eLwl+1GKQAWrNPXXdspmOnkOa2iix1MfQoXi3x
 QZ07YJ+/7yloWMyemQX8I6gl+Tm7SxU6IQRZ/LjnoUVZ+NHjgvFCW19s9 g==;
X-CSE-ConnectionGUID: DsATBb4VSBW/CtiLmrfmQw==
X-CSE-MsgGUID: USIC1tyPS7yUTwaTYmWo5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33599706"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33599706"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:14:00 -0800
X-CSE-ConnectionGUID: xRNjVqdtR/yM9XSBWssa5w==
X-CSE-MsgGUID: 5nMopRhXSzyDawuKvI/eGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100272307"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 01:14:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 01:13:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 01:13:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 01:13:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOfcfWlohfSWUL6KgOKTLhVrv/BrMKJOikmCUQq8thQy1TSKJ+V49EdcFT+QeED1IurekqbRSoh5CXf0yg+l13Jyg5WZyK8oq5icAQSNejc69jHCRlxv0aYTYKx9vxGRHPZt9ZWt1ZHmdQozscWeCx/PuD4BwPaLra49X3Wji33MkGcgvU4AIl2YICJRnjBEW+IvpU/H4V6/YJyvCZPWSZHI+GF0h0LXfCD1a524cMfDA8bArGGpmim7DgvHDOVUx6AUhLC4T/pWEpDan/MPWHrhBnY3Qywsy2IOONx79HPqZa5NkFlmQv1IMUOEPQcokzRWtmaMJYx7RHpQ/q090Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHlg8qIfwzBg5Orf9G4sDXXUTljmLyvGj96KAVFEZVk=;
 b=gSzkLyRziRrZ5CH8ZKbZd1Jj3KSBj/xQ3Zbu40y8b4ZYU98ga4pK47mn0qo52Cavr7WcYK61SDa0CP9ynCyRBckr0uXqQ2QbQaDZfHZVez77lkj4WlLZRCh82gc9gb4f8rbb8//ZXArYfFIomJRPMmGviLbdukGqJTIcD5ArJm8PKw685rO2YNDBAg0wNhTmcfT0XVBp5KzMGotmE8GJx+a4/O5rbMF3rWXZYW/T0pIaIvDzlBQk/OLd7u6ozWVm2mc1gxCj/tNtIbQNswA2MsZSsYjFmD0De+muFckv4yrjgIj176jfFkqJ31mNNNQ8VeRhe0Ez0fKKKju2W4IY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.20; Wed, 11 Dec 2024 09:13:50 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 09:13:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Maslak,
 Jan" <jan.maslak@intel.com>
Subject: RE: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Thread-Topic: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Thread-Index: AQHbShe8cI5ICXNyREu5L3nHcfY9wbLeSoaAgAAV3QCAAmUysA==
Date: Wed, 11 Dec 2024 09:13:50 +0000
Message-ID: <DS7PR11MB6197C4D88FE377DC248FA3B3813E2@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
 <60c6f1d7-6bee-40fa-9f7b-8f138b3a3501@intel.com>
 <20241209203822.GR3224633@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20241209203822.GR3224633@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|IA1PR11MB6218:EE_
x-ms-office365-filtering-correlation-id: 97cd5592-53ea-4bd5-8465-08dd19c4209a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3l0kYzFuuefTsLv2wgrnRo0f+9OumFpnqMd8N3W5PNR85THOxN3I2l7YZZeY?=
 =?us-ascii?Q?MqZj4KtXe3gih82v4ghqGywsoA85ZIGcf6Z+xUKb4wggufZuWPMnWHX0AOmq?=
 =?us-ascii?Q?v/zUB7JO1RhAfJQOA38TXKWw1jsOdpz66a/t4G2URGXkynVU6jLHl74COYDQ?=
 =?us-ascii?Q?hZWgHmtg7oIGtqze4jOsuPRSrznfhzSDivS5lyi0WX6qfk6yr0oq5gErECVr?=
 =?us-ascii?Q?Vi94okw4qj3u5GnD0M45qSCA4qHOItQlRjGbwPmBP7UoCf9KFSMSPShWR3C9?=
 =?us-ascii?Q?ymnaN1ANftqEd4lu0fo4dBz0C/kzbaswhC6lIWq5SA/snP/N54z/j0U8+TBb?=
 =?us-ascii?Q?+busq8RuQ/TiOZsoboocUOvuMNtGoLsFxZFp0zTbvw2W+6Y0twsBC+8Jf84Z?=
 =?us-ascii?Q?kFMwTfRWTyBQjgdxUQb6GtTghMvLsyIx0SxhONKbcxsQ3PTgCjWpo/Bmn2Ha?=
 =?us-ascii?Q?is9ifnQeff6ZyDHb06eyvK+d/vAQSYcLyO0t/dElRelTkbqTrpof4uemG0hj?=
 =?us-ascii?Q?HOQTRHAkJ0xrzerUiqVTriklkvvZhZA/XzZudQx5Eq/8hvSBHrYy9ZGNPiAr?=
 =?us-ascii?Q?XyeByBiAh29sbgPwWLcQtl9PZAoUagtL2D/RQqJkeht2jE4vdcCg7UM8hs12?=
 =?us-ascii?Q?SbdXsn2YIR+BXvuQQgFgcXdS7KTXn5pl0eRT9f5JRfpgmYf7j9AgYq86LA4r?=
 =?us-ascii?Q?4ow3Tv/q9sq0PLjHjcc+8ZBTz63D7Wb5z2wFfoDU0ecef7HWJIBojAXcNf1C?=
 =?us-ascii?Q?8Co5SZKjLSxCOhkVPQgHumX3udb08+all12VU1oSXv4NrjhfBxOKqXgPf1pR?=
 =?us-ascii?Q?Cglh4F+PB0ljjyc2rmwkxf283JlLBzdtcjd1ZQKWUPf2qB4y7Q7VmSF/Roa9?=
 =?us-ascii?Q?t4tArtCU2XwwR3cGGSu6O3wD4/vB4EKQppArCTwQyn2CjdlZITWjC19iVL7+?=
 =?us-ascii?Q?HyxyzadOIw6K5WG7R7Ar2ABn0N08HxaM/vclvBAzDiuFglRu70K8I6CfiZu7?=
 =?us-ascii?Q?NMzhX6pJRa0voEeYR0fF4iI1l6YnUxq+aEHEA/KXC/lO6XXi0o6LGIdOsOEx?=
 =?us-ascii?Q?n6EDMXLwuH57d4AerA64dPrlF5Uz++n4g+fQxYd1r5i3heZgJL1I2jFkQvhG?=
 =?us-ascii?Q?B0MflZwcLOtW5gXtq6MegnZFGLC2//4rm9vyxJrJz3k384QONoXItiHtbWrP?=
 =?us-ascii?Q?4ROvT8IhNIRh/8+U5C/ZfYZvnlrKZKDRZj6GvevlqcMnTQf3UT2ro4Yi505S?=
 =?us-ascii?Q?tfdIaI1hNcQqitoOYWrssgMFdcZGbsclCCk0JyVN5aIQ899f0Y2NMtnM+khb?=
 =?us-ascii?Q?cpCSn6U/kH4YzouegKFAeZ7vjig4SmVaCVRO1yIXdHuJTvwcZbfmphyDVTNo?=
 =?us-ascii?Q?y5egY60=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6K4gtBW5hZIOEpraBGZjT9Oe4PHj8IaPLpJdY19+GTGzJO3s2KOoeXur7a3z?=
 =?us-ascii?Q?cOmNA+CNfxm7uX544ereQuD+hSxxWMVcuqL3s0cxOp9AzftL+enZ87kalDcb?=
 =?us-ascii?Q?C+phaksl2uBvuJJ6QtFgxaNcrXpT3nSD9U2S5qKFE139H5b7NkLZ4utb9oB+?=
 =?us-ascii?Q?1naTvPhBdAVttEDE/a3uHRq0kyLEEAh8tCze4cgnn1NQZ04ljBAyM/xg8jHj?=
 =?us-ascii?Q?SivtBXw4Kfcux0YQIwCmtTepExvlSVKM+KlJz6uVb+9aKlJq11oP868PO5C3?=
 =?us-ascii?Q?3hDZs9cGLpT3ob/ja/KO3/Mipr6BNjiRS5aevKRi2v6VJj2/iiqdAjvLbZdx?=
 =?us-ascii?Q?oVFwvDlKndbDINo9mQLub5oGXUpv/NPkMbk/0myUG+/xVyZ/zw0jGXBQ09P3?=
 =?us-ascii?Q?137HQrGgdtAWjUPs/jAJfTCWXC70HbtXciURb2U+t2nXUHoPBpAz9JPuXPU/?=
 =?us-ascii?Q?KDw4hsDVEakG/tmfXrZ26SINbm/uYUsCPyvjPRpgIW+3iC9mc8njsk5yvn5D?=
 =?us-ascii?Q?3k/WV+75dDrG9yeKeUJHEnXXSBjhtndKCOxJZEVaqDxyEfmxV2ZK+ViAgFRL?=
 =?us-ascii?Q?P6XE3uCQM8agUVToj24IHSDcEst5W9SQFdJKKZj+Z96Pq7lVjRzI8k/MDh7D?=
 =?us-ascii?Q?Xi54Ui+Taf/fCXJLEyrLlzERu42P+X1GlMAxeYuUKX3wpHQ7xeGDu1or4IcJ?=
 =?us-ascii?Q?718yuPWkxILtJdOt3JnUv+MgfewMwBGY+qvkooq8UsQ/x+BmrW9gr75zEH+F?=
 =?us-ascii?Q?XA0FVgRv+pnK+VVSHJtRToOXGZEOuJw/HYdMjaWzSzbpOTO2QkJgHuth8+mw?=
 =?us-ascii?Q?CYEiISoWIu3WSYth3l/G14sxKV4RM/J0modkz2h1uR7T/7Ls0lFvNI0FUX2T?=
 =?us-ascii?Q?f4Y4eDUxL+VzqbPZ1Lk7JptnfDidt7jE/F+dvVbyqE+IaT6saFmUG51KFjvu?=
 =?us-ascii?Q?fAexRZzNW/un7XHTnCu33upascwgWznyJ7pL6L3mJC1o6atkYQjfYggTLx5D?=
 =?us-ascii?Q?LOtHzbQqhdKE4t3XNXnJ6quQG5TFSt1QnOZ7wYkKFvckd+q9kJcuEFzg+2Cm?=
 =?us-ascii?Q?rzNSIArQYf6KTPYl8nig1QrwTZiDDBss+yMYM+EwznI1dFe1YZhZH+aeehdD?=
 =?us-ascii?Q?1ZzWghqK/OKS5xdDcxBmot+jkSs/6GowFHW8TER1Ecp09mFHVFHuCHvfGll5?=
 =?us-ascii?Q?67xCKXElMkWI52WSnuGzw35CN58mDOTZ/xY34iQFOkKpBLo3GVZKlGIQP3Bb?=
 =?us-ascii?Q?2yTl20Sl61Q/jqZ8qWbHjK2GMgpRJiKyW/UESkqtuk/KvUwCdcW9QIlHtnud?=
 =?us-ascii?Q?HhvZgzvCSkIz2uqaR0h0kMbf8Mgc0vyxq74PC8AlX+v6Rw6ioA4EWKqkhCC9?=
 =?us-ascii?Q?1leQYtRB0zK/kL4HIRibI35PZ80ilJQ5klNKeVTSRQva2PMaDeuDfZPrJtkc?=
 =?us-ascii?Q?IANAchRbZtT9YleP6QftWOS706P4/2hj9uR5wd0nRSJqcbCdTdOdXDy1l+e5?=
 =?us-ascii?Q?TkCkAcyTbNd7ozdXmd4Bks5m4UjBBynZiRaW43+DzHUF9w1SeIKodoAU45jo?=
 =?us-ascii?Q?rslspFAUeWXbFp5o2ZUtxlyKRWhChWmHAMUtt5AP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cd5592-53ea-4bd5-8465-08dd19c4209a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 09:13:50.7372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jamsVn0W6VTr2pcsmY/D/IhcKmxU6kYc/zwdDeX33g2csSRAJ419Pnhf0HpNaMyZolbxAaFDp532YGIBczi0XXoMI4MxDqFErrytMWbRjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
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

Going ahead with merge of this patch.=20

Tejas

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, December 10, 2024 2:08 AM
> To: Harrison, John C <john.c.harrison@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Maslak, Jan
> <jan.maslak@intel.com>
> Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
>=20
> On Mon, Dec 09, 2024 at 11:20:07AM -0800, John Harrison wrote:
> > On 12/9/2024 00:57, Tejas Upadhyay wrote:
> > > There are hardware platforms which are not supporting hwconfig
> > > table, for example ADLS. Querying hwconfig on unsupported platforms
> > > leads to assert and failure for some of tests like,
> > > ./build/tests/xe_module_load --r load
> > The module reload test should not be querying the hwconfig table?!
>=20
> See the Fixes: line; that patch made it so that anything calling
> xe_device_get() will fetch and cache the hwconfig (and assert if it's
> missing).  xe_module load calls __drm_open_driver ->
> __drm_open_driver_another -> xe_device_get so it does indeed fetch the
> hwconfig table now and hit the assertion added by that patch.
>=20
> I don't know if always grabbing and caching the hwconfig was actually a
> good idea or not.  As we've seen here, the hwconfig may legitimately be
> NULL, so as we remove the assertion here, we still need to do
> NULL-checks at the point the hwconfig gets used to truly be safe.
>=20
> >
> > But the hwconfig test itself should be failing on platforms which do no=
t
> > have a table. That is intentional. There is no platform which is POR fo=
r the
> > Xe driver which does not support hwconfig tables. So the test is suppos=
ed to
> > fail if it ever does not get a valid table.
>=20
> The Xe driver is only officially supported on the Xe2 platforms and
> beyond, but it can still load and run on some pre-Xe2 platforms that
> people were using as development platforms; some of those don't support
> hwconfig.  And even though our CI setup is only trying to test a subset
> of those platforms that do contain hwconfig, note that our DG2 setups
> also have an ADL-S igpu that also gets probed during module load, and
> that's what leads to the CI failures that were reported here.
>=20
>=20
> Maybe XeKMD is mature enough now (and we have enough real platforms for
> testing now) that we could prune the list of platforms that Xe is
> willing to load on with unofficial support.  E.g., drop the unofficial
> support for TGL, RKL, and ADL-S since those platforms don't have
> hwconfig and I don't think any of our developers are still using them as
> development vehicles at this point.  That's probably a separate
> discussion from the patch at hand though.
>=20
>=20
> Matt
>=20
> >
> > John.
> >
> > >
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683
> > >
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Jan Maslak <jan.maslak@intel.com>
> > > Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >   lib/xe/xe_query.c | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index f3731d9d3..8f0a5392c 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd,
> uint32_t *hwconfig_size)
> > >   	/* Perform the initial query to get the size */
> > >   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> 0);
> > > -	igt_assert_neq(query.size, 0);
> > > +	if (!query.size)
> > > +		return NULL;
> > >   	hwconfig =3D malloc(query.size);
> > >   	igt_assert(hwconfig);
> > > @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd,
> enum intel_hwconfig attribute, uint32
> > >   	igt_assert(xe_dev);
> > >   	hwconfig =3D xe_dev->hwconfig;
> > > -	igt_assert(hwconfig);
> > > +	if (!hwconfig)
> > > +		return NULL;
> > >   	/* Extract the value from the hwconfig */
> > >   	pos =3D 0;
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
