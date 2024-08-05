Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B764C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 19:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406F10E162;
	Mon,  5 Aug 2024 19:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp0RGpwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FBA10E162
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722885607; x=1754421607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aXYxyNfH6D1MSj1XXJ1BKa5aE5wvpXC78IbwDYGPnE8=;
 b=Jp0RGpwyJ2izAdUYdprWQeM8SSzeCyfMPametxWztPHdhQimae4+2Qrd
 v0XKUxSAZjrOeYxIvdfceKUJv2tucpMBdaYWeo+qyuNfdEvXpyN9MXfQE
 hOQ41LHtpF2ljvUkGCzH9jgBx7NEWuwtZIcU0K2muyZv5wEoTuVwVD2k4
 lCaswzSBz7Z4IrqDJ8A8Q2MvT5b6yofHLgNh9Wq4pDHjFl9T2MrFBqr0/
 L8Zi0CZDgyQirb6tKrGB0Z5rXe7zzW+uF9/XYuL3eQBy0+VCuzFbpWUSJ
 bFHu09IP1ZvOwPk6/xtEJxVjgUg+sw9UBya2ZEidlWq3LZjo/JGTWBeKA A==;
X-CSE-ConnectionGUID: zYsIVo8kQ42/h/hIecaFCw==
X-CSE-MsgGUID: e1um2yPCQy2/x8MmmdgHVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="38377156"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="38377156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 12:20:07 -0700
X-CSE-ConnectionGUID: 9AZ/taUkQQi8WZ5s72Nuag==
X-CSE-MsgGUID: Rhm/+wd9QVmPQNeGG9DuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="86853346"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 12:20:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 12:20:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 12:20:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 12:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JP6k/eZoLr+ji5826MzxPY2baH4lxBgmIWFu1SticL0WvVsoHI4+0Fn1yU0vrbiS06J5HCHXjpVzz/hZH7wyDb5GNpBlVFJItCMOvT8O3uX5mG/teUrXNWAD8ZxNxEGPvltqHBJLdnM2A8BJIWUf1REOLKiMdZYpqgUxSlK6ydUfs8/+wVGyKjRnbD1Ci83xXYL3suafUr7wWrplR0sCFLGPoWPtfzh0UUUpJMv/vy40909MpWF1WWbQS5lv+CYM26IDFnekR0bp8T+gf4M4Qe8AD68AlG4s/Lwo9A8t3m3j6Y62SGxcj3yI5KHO8ooFl8Sk7AdP/jGAySGv4wOYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw8Vv9IHdBi8+fJYkFMYWU5RUXCWeYBGCDNWUMAaKc0=;
 b=uRGUweIyr+shtcb5v/4o5b7RUXK8Kkqx0chiEjCSfBMp6SwcC3q96qkp8nWi5w0dGy784aYxKAGHPx9mt9Rcn3LtuCv/FT9nzn1/2yKK0xkQwHGEkTUSQJ+UvryUFlO5663p4gWP76a/j9o88y9fmfvpDpKQjYh/ugPclnVy9fWm1WugTXJz95GMTqIFjeGA2eQTuGaD8pd75uaz787mYoFNkZwx39RvqN1sZ+vIbe0ooQQBEiKfClau8iwsKEE9rAd292u7njfZ827aHaAh+BQuJeaTzbA/CuudOym+Z9k+jk66brzB04iFErv2w41MN8fBpyoMKmazrggtXj9BLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 19:20:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 19:20:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/eudebug: implement userptr_vma access
Thread-Topic: [PATCH v2] drm/xe/eudebug: implement userptr_vma access
Thread-Index: AQHa51gtQIbS0S3PsEKPx3n6GD8yxbIZB+xg
Date: Mon, 5 Aug 2024 19:20:02 +0000
Message-ID: <CH0PR11MB544405B724D13C586C384124E5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <Zqp5oYGygI97UglY@DUT025-TGLU>
 <20240805165421.3033741-1-andrzej.hajda@intel.com>
In-Reply-To: <20240805165421.3033741-1-andrzej.hajda@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6291:EE_
x-ms-office365-filtering-correlation-id: 4deb4947-bcd2-486a-ff9e-08dcb5839b3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?A4WkmWkl1f1olXbpXME2ujsS8JSwZfFdUPtk3rg7YwWwalLFtj+sq8RVnD0H?=
 =?us-ascii?Q?GlGyGE8YQcH3DKjqENl6d+2tKKiXDHJqerYWIhtn6QFGzaHkgqrsnF1yHfrO?=
 =?us-ascii?Q?Bwm0oZJQQYeboLaTFCyK4GX2FaEWiAyNNqTGQVsvC0fTJXYrsJn5EGoMMddi?=
 =?us-ascii?Q?KcZVP9NDC1O7lAyb39nhRSwJpk+AVEzK4aPHRoJQwoTrVnfBZGuCWd12lq7D?=
 =?us-ascii?Q?8wx1AtJJeA51j9o2MjNSU9Cv7fa/86TBPWg8nxbHbfu8gjXTHvLrAB7B3Ukt?=
 =?us-ascii?Q?juoZGSEHW08szJsDpijgqeR71LFZgj+Jh1l2d3XtZHslVpKhrW8I34CuJ/3N?=
 =?us-ascii?Q?oEGvapK65pMovUyTsA94+o36u9tef7ikxm9xSZ7y0zVXFrrlTFoFHihQjUfz?=
 =?us-ascii?Q?+lkb8I3tQ6s9vAq9CFLsIEV7bGmzDzJGebrCt2L6ECWQd168lKSPlSdXUpuV?=
 =?us-ascii?Q?/gcf1p9J8AHK1S/rP3m9+duzCIjiQ2e7HeFUXDYO1o1iw/sT+XnduFgvxXZC?=
 =?us-ascii?Q?6mdRV5tUFCdKf8OzTsFP2Z7iqkjs7duLJgOnham/6A+wps/Liz0hnrLOsXv9?=
 =?us-ascii?Q?hDjTIpVQwqvBz2QS7skWb0aZ0ks6NQ/YuDfh0BO7s647VVOEHCpVBnXSLTNo?=
 =?us-ascii?Q?c40Zb11Apn2fWgMiD63XmWOrRdIUEzT1JvotbMc17P0H24fz7hqpcnUxPrIp?=
 =?us-ascii?Q?MvA7oY//BpvqmgUvLjhAYAzYR/25NsExBlrdQDZ+qq2jMhyt/B7qFzEnwB3F?=
 =?us-ascii?Q?6MnOMkh7TkcY/3YVCDl41AZVs29bCn2AQG5PUgBXO1DbN003AFD0+mev+t2z?=
 =?us-ascii?Q?/b4cTiTqhbmdsFvG3kStzwPEt31n8yKC2CF2c+8yWQFiWEnRMq+RbUWGryhl?=
 =?us-ascii?Q?w00dLU16rajaoMLERZz0nYGtk1cJMGEtAVnurK1/l/DpuJcD6WF9o3O8tLJe?=
 =?us-ascii?Q?ziKJh5Y/eTqBqJI5dqSkOWJkEfGqwi/vsMCZwgHruxxBxlNmwcuxss/Rskv5?=
 =?us-ascii?Q?NWdW/IhjFkA3qz4t8OJhv7CeY4BBIjdJTMBHdxuOn3o/uneZPohAqAndq3fS?=
 =?us-ascii?Q?oqQj8XDV2DtZFXWdGrfRhD/acPK/87VrMcBPtvzIHaVw8Mb9qAd0wNpUrDl9?=
 =?us-ascii?Q?BtcoMN98g2k4Xu2LacZD3Q5ajJz8smYbpC/JgVD2UB9g1Rksr5uOgOtVcF/S?=
 =?us-ascii?Q?GUViV9V7YhMYUiDJbt7l8a2QmK2fcNn1CbmsLE60Q0vGhfZzf74qskWKlMr6?=
 =?us-ascii?Q?5cgw7Hf4Cyh//gy9fs0X8wEObH/b4rqX9Ar47dmzOvig/aS2Jyn5PnojjQP6?=
 =?us-ascii?Q?lXmsnNlR7ganzeczFEuAQD4jhYIG7FTDyWu/a1h5fgRumNsEq6hyvmDWGM7P?=
 =?us-ascii?Q?01zazEgsoYPfDCMhpTs9TzgyFgpSi0Jqm2DzSnNU44xBWRrQCw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3zrX3XMXXvoM8bHbQQYV30S4egjK5/b3qToCeIH1Xh9t2Z+hbfvNTfnN7MoP?=
 =?us-ascii?Q?R3H5HV8LrHv198BN+//Cxp6L8kTGIRzcAJ+coW/yYSnjRlMIRhWgiA+uY8GN?=
 =?us-ascii?Q?X6MDUwTfm1kSLjTytMl+nIq0WL6yBzV1ki4sVdrd+VzKnNmw5MqmlBdtQW3l?=
 =?us-ascii?Q?xwpcqUq/g+pzFaGF2vmiMihOY9E4vtnIN4/2zlWkJMwFJCo140bf96ruxHL6?=
 =?us-ascii?Q?qajzip+B/ciBeI8BKAVSGj7acgiPud4XXOAU7c6jIjEkRCn7x6aZd9uq2euk?=
 =?us-ascii?Q?7WPKy4L5fbz3+lRS9A2fsyiDsqoSCaqrJ9JGjzeWwVwZqc37tD4hQJ+3+M/G?=
 =?us-ascii?Q?T6T342Wr1DKM0o7oEGQrV/WLcJXvYq3XV5779rj9w7dfCJxErk5s5M+W96rR?=
 =?us-ascii?Q?x82vzloT3Xr0z4jdQRVXKriitsg/1e+t6+xrq6aHcLegDC3xPNL6X3JWWOoO?=
 =?us-ascii?Q?casBJxITauirZqYQekp0mDpISs9v4sexuSI5o/+6kkgkeJxQRJlYHPm7VNMD?=
 =?us-ascii?Q?VrTtJ1Nx5x2kOtC0oRuhSh6p2uqtzEMMyNXHNFH91RgoDy/srINsqqZgWgG/?=
 =?us-ascii?Q?2dO56U0O1VPjmhVjgNaA+K8sbNPW0rZgFJ8FCrZInPY2Sv3j/4VzsYLTVTf0?=
 =?us-ascii?Q?PmWU9nNikNwvoL25nvgoraCGwvbSMOOqwkFbtKATWyOyjux350HcJxwrFHk9?=
 =?us-ascii?Q?fc3uNOIzIeIde8WSeKB4ile7rQ8CcXWzRt9S8Mtt/2nGfdqCGGLetPYffU7R?=
 =?us-ascii?Q?wTeiwvkYFhuOWWWrURflfQ/d7afR0jPRaeajCqRPpGl1FBFT8rzI/C/LVyCG?=
 =?us-ascii?Q?n/FhyJqLzSqMLeZYcxoyowNFyzSdXqdqjJR7Olq8kfbQDConeICLy7GOQ7OX?=
 =?us-ascii?Q?idMMjiQ+ykFf8JjIMYkib12duxDuoY29N0rSH6vKHl7I4PTcdzOcGh0OuMGU?=
 =?us-ascii?Q?V6chiM5WyFWEV1hSj8otGq00/w+P0aF8wK23CtfIVKbwoic06EfmR9iLqCtR?=
 =?us-ascii?Q?o+rNdoYXtQXkZi/J0LWMHwdERODWn1YtVIjK0LmMUPr8hZLoJYMX6UOu3veZ?=
 =?us-ascii?Q?3dKbwmSQ7dwbZTqnxQjwuSsSDUyN2upy6WsuN8jHTThw93bm+9FrXA+HzX3M?=
 =?us-ascii?Q?2AWypEgAKHPqGk9JrN6XokYHFv/PntFDFpsnXEo+xd6/mZaF+pKp+ZgXQHVy?=
 =?us-ascii?Q?6llkMMP/AEeYmjuZzU0Jhxgf7I4DusGH6YEtSZeK7wgzDwt8ughyly2Kxh+U?=
 =?us-ascii?Q?vJlNOY/FHJBsqqjgMXTsDNdFhC7rc3cIOeNpxhFgi4k97bNMdAmsa99rbPqU?=
 =?us-ascii?Q?MNggCEZQEztWjbJ6R04bPSlUSPoPersQVsS7PAcLHRuYrrE5jEcT77wWyHGP?=
 =?us-ascii?Q?nL9fGCDvudoq1Y1maetdRUPOk+Bz9btm16ZN+LG2ahJWoAMVCY3/Fks88NPg?=
 =?us-ascii?Q?Zk76nacWOPOm761RywEbD6YZbl+5JzP5TrZ4uzDWNHrPUKVXaGidwlENkLma?=
 =?us-ascii?Q?wl5fBwyySvZQ9r1mBOv044OIRPhEXfaDTmvILHiy0dPQPIs82QeMoWPcFcIi?=
 =?us-ascii?Q?AdjTWKfX4cN5SExN4LY4ihLn2t0sTyogQaVqqrZq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4deb4947-bcd2-486a-ff9e-08dcb5839b3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 19:20:02.9367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9D1z+Tx1MLxxK/swSN4AOjdDSyy5BukfjFJYBzNJvBIu18G+aUjB5Ov2PW4N24NcrOq+6n9Nac5PgGOrSrWCemdQi3rJ3mkWpP0wEBl2wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Andrze=
j Hajda
Sent: Monday, August 5, 2024 9:54 AM
To: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com=
>
Cc: Hajda, Andrzej <andrzej.hajda@intel.com>; Mika Kuoppala <mika.kuoppala@=
linux.intel.com>; Patelczyk, Maciej <maciej.patelczyk@intel.com>
Subject: [PATCH v2] drm/xe/eudebug: implement userptr_vma access
>=20
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.
>=20
> v2: kmap to kmap_local (Maciej)
> v3: simplified locking, moved to xe_vm.c (Matthew)

I get why it was requested to move the xe_uvma_access code from
xe_eudebug.c to xe_vm.c, but if I may ask, do we have any plans
for using the new functionality outside of the eudebugger?  It
might be good to add some additional use cases while we're
implementing the function for eudebug.  Though, I guess at that
point we'd want to implement the xe_uvma_access code in
drm-xe-next first before fixing up xe_eudebug_vma_access to
support userptr vma access.

I personally won't block on it, though it might come up when
upstreaming this.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>  3 files changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> index 62be0879e651..baed2812438a 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -2905,7 +2905,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma=
, u64 offset,
>  	if (bo)
>  		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
> =20
> -	return -EOPNOTSUPP;
> +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
>  }
> =20
>  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b117a892e386..f1aadd5068a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3429,3 +3429,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *sn=
ap)
>  	}
>  	kvfree(snap);
>  }
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write)
> +{
> +	struct xe_vm *vm =3D xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up =3D &uvma->userptr;
> +	struct xe_res_cursor cur =3D {};
> +	int cur_len, ret =3D 0;
> +
> +	while (true) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!xe_vma_userptr_check_repin(uvma))
> +			break;
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		up_read(&vm->userptr.notifier_lock);
> +		ret =3D xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!up->sg) {
> +		ret =3D -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> +	     xe_res_next(&cur, cur_len)) {
> +		void *ptr =3D kmap_local_page(sg_page(cur.sgl)) + cur.start;
> +
> +		cur_len =3D min(cur.size, cur.remaining);
> +		if (write)
> +			memcpy(ptr, buf, cur_len);
> +		else
> +			memcpy(buf, ptr, cur_len);
> +		kunmap_local(ptr);
> +		buf +=3D cur_len;
> +	}
> +	ret =3D len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..99b9a9b011de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct =
xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printe=
r *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write);
> --=20
> 2.34.1
>=20
>=20
