Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CCFC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 18:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6204410E4E8;
	Thu, 15 Aug 2024 18:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cl8MkDlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4DF10E4E8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723746466; x=1755282466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ey4F8XxmMr5gCbwN/fYhG8Y30SwuHscH7jqcwtKH1M=;
 b=Cl8MkDlCjNUyQ6f9TrNa7C3IHQskY4yAC4umNXdFr3ZPgo7RJMdx1B8P
 V6JrAadFrr0kx1ENiSlRG53ECk3m+2KCoCVTkTzTgFStrBZ3LqbGsTy9w
 FuvwiUpmAh7uio4CZw2E/BAGGV2rg+2VpIjwm9V6vG9WhwMUcRjDoPNym
 xbtaZ/6QXzXpyKjj4jowYWrn8ItDtGWii48r2rma5lpi+ufqg0ENJZuuK
 rlN7+0cdZ2MCQk7flrUL+hyIAxZR9RSj0an1qyo9zFtdIdLgB+ZzcyB/U
 0q2hTv9STW2SrPnGxJcPxH8MwnKd9SXZJdpu0tCE2CN4QhHvWRjqnhQuo w==;
X-CSE-ConnectionGUID: cAwv4jrZQN+RWlvWj5Nqaw==
X-CSE-MsgGUID: CI9vb18VRy6EgmUHnAv+hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44541290"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="44541290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 11:27:46 -0700
X-CSE-ConnectionGUID: CYmYJf1cTguQR8QM7i3g/w==
X-CSE-MsgGUID: mH7GDLujQSmxZC+i846JvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59997383"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 11:27:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:27:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 11:27:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 11:27:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3wzjg/tUYG8UN/8IlnZQmzPb6aDAfsD/lgjhdIlhs2bpSnf+PEKcTxaqrob3EX/jmUrPWawu+7a45c+OEr3MbuYB6SlkMjWPwzaqavhBizjWMuAbcA/J0IGckiCxgKwaUigN6j2iSshzNH7iqXeqaoGcTS25pOAtfNjRmSY6HjaAa7/kuq9+oCyjVcDPI4ORxx5rz0Yid/LLnx3U+kuIDoWIBcL5zAVBjE3qK7DGHP934+HqhUM42OOcXVvR0sHxTRVpbO3bwX7u54kwiG831PSfndsdErYlV2vf/53UniNdqPGeu4UjAgxAlyoNSEQ/ea92NxUHcZjdtyjwWM0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWtjo70FKIld8hdFLYrzE5aR92ZNTJuLTa/TrIzk+Po=;
 b=xTJyE0vOgyIyBoqvLJ7ZeC11O2iiytkeJvhXHmpbIFlBs+GxiUd1VJKbdO4zMiXfyJexOAmy7mH31v8w1eXjiQn0U5MBg3hPM8uOKpJmA4zcrry0SvXJMDTpdGtJI6WYTCJIHYg1Atrm+sj9Asci36fHHQCub1Dd2vUgVtH5dF/OThJ8slar3ypDTOZTUl+bX8Q5utCoZQFAh9u+IHChAV99zSlvUIBLR/+C948mx0aGPbm6zNaA7MV4349+xqMKJd0+Ifsd4tphNPc7m/PyB/NmzTJWalNZQHcGB0jAUWyrE6AS9i4BeS+zFSwwioi+COeG3YmGq/T1VeZ+UBoTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 18:27:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 18:27:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/mcr: Try to derive dss_per_grp from hwconfig
 attributes
Thread-Topic: [PATCH 2/2] drm/xe/mcr: Try to derive dss_per_grp from hwconfig
 attributes
Thread-Index: AQHa7zhOGFEG3VeIs02PXUxG2JPXwbIolidg
Date: Thu, 15 Aug 2024 18:27:40 +0000
Message-ID: <CH0PR11MB544428E0C54FE77E54C76267E5802@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
 <20240815172602.2729146-4-matthew.d.roper@intel.com>
In-Reply-To: <20240815172602.2729146-4-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6955:EE_
x-ms-office365-filtering-correlation-id: c0df088f-bf59-446e-d202-08dcbd57f238
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TduakGy9u2Ee92IaN4uIM0tj4sFvc1DJhkLa+3aoRlliOI03qCnBGkadcHMh?=
 =?us-ascii?Q?lKtYOKcpXMgjr40WO2TPidThgOurbPlqv7grWeegostXYcCSuo8iv9kaMd6d?=
 =?us-ascii?Q?d8Ih/N4EsGqJWnXWPdgsRjZV/ePDOUjU4hapl2acA/maW8p07snAtHlDdoWm?=
 =?us-ascii?Q?epi9RMhtgCAh1XXNom5kqKrN25cCt76HUzJ/4I7z3SYgEiTfUYvaqLOtPevM?=
 =?us-ascii?Q?R7/AJvfElZ95+V0I9SXMAE8OcK6GDMNNzJ3YbYr+PZwRCpebL47WBcnXpRvP?=
 =?us-ascii?Q?/yBdOlSZrR5r8cHgrQUcl6EAmYc1RVnAV8eujC44oUBIFS0bqJLYvvrEZx4Z?=
 =?us-ascii?Q?FSg//vf1ImdRpITBSKvqbUF7AnwYI6mlWiKcfVhdugAYNb3vStJmQ75xLhA/?=
 =?us-ascii?Q?RivDkrFp9qmRO2phKFMpKbNxPW9TJpBywSaMNNsSwR1Can4FDH5zeZe0Tf+L?=
 =?us-ascii?Q?orY/3G+ONBb/iQU2JJFY/4fxa8qugDrQLnlCQKPQmP9LQHVIrGsW0Juyh+JR?=
 =?us-ascii?Q?Tzgw2cFK7foTTINFvVO7Br+OvDS6lQ4pLE3D8tyXZFdafo6c2sHNXf6JcDm9?=
 =?us-ascii?Q?pzEl+53tzYr9ImcmG3M620hONTA8WuI/M2qWy/jpywo++2KHCi+iBIa0HItp?=
 =?us-ascii?Q?84nQLKPQXQNyZvLRzb2N2AR+aJWfSHl3lHFl4ZBic2srpAQc2cnaIPbaNspU?=
 =?us-ascii?Q?wnoT5PWhmCh6uhQ2B1KMHuVXm7NBaRPdyn+aFtYaS6G/Ty6dLNGK9Si6wo+J?=
 =?us-ascii?Q?WyXiq4PffDDncTYHMNZC3C8CKxhWgqQjcBJLKrzkAsrshg4fQZ0+HTFDdfBj?=
 =?us-ascii?Q?U/gC9RbGU4PTky0KkSuww+9gS6+uxSM1B9y0thrN96DcS/N1lX9mbev3+RMG?=
 =?us-ascii?Q?x7VZirz9gXpzNsIx6M0JmaK5F9FVhMLipw29eIsO62NPdGmj1Ul34kWLGsG1?=
 =?us-ascii?Q?R1KxnyQ4NFVwAlDnQ6xvyM/T+5IKalQYQO8YiO2bl67VfQ9/Wi38sT1e0YqR?=
 =?us-ascii?Q?oECuqwajOp2tfePxygS9hKoK2cCuGLxwHC14DV6oNq7dpqjwqMfORyJ4lb1B?=
 =?us-ascii?Q?t6MHDDOAGeoNgaOjKVok91JH+XbIC/M3pJcZ4VhqFeNTY5uOmjKwK6sI3EER?=
 =?us-ascii?Q?bfncNgJ0M+VarSQRe2YhvRIZiQix8OaNT9OSbBNOXZ9YCWlylhL/fL3UB0ql?=
 =?us-ascii?Q?zEfPWxJPzfNKgD61oXSM+0RmHFSnr2h95JkeqahCYW5Ot7LrKnOVj9PrVf0z?=
 =?us-ascii?Q?IFuqWd8dUnCr3l4b3O/P222lff0uifjDqxfbyj1WEAf4zvTAvQeT8mT1NWGl?=
 =?us-ascii?Q?kYLoOHbRMHeH20pVi9Bbn6K8Yu1nVNbK8VjTe5BEpxcy9C2fHpAaB0ZMfpwS?=
 =?us-ascii?Q?6L2wGao8cK+3Ktd8o2cePyQ6EhM9YrZZnwGdOBdn+56gl5HtFA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yQFO3IOFxXlKJoWE95dzH/ZY6YanJzrzJ786v7Ew7uT9Jq8OHetqN1KNE1z1?=
 =?us-ascii?Q?r/iWAbsasMiJVgkz0SRwHNqk1hgSKRcL20fAA7LRBK333s1thN0/Kw4j/tQ/?=
 =?us-ascii?Q?Vb5TmgaNVI0NuUtx1AXzOH4OjYHLaZFgTtaNf91zx/p9HnTljRxdGQJ8kdoy?=
 =?us-ascii?Q?0MhpZXnEjswijlsnCPf9geAed2aeykcUUPlhnVtDKHAmpugLjjTUiFAdYiJv?=
 =?us-ascii?Q?MkwUj0gH0Y7vmEEVXjUFRyVegp3WmGMNnUo9QtW2Tdfel791lX4yuAzbBEUl?=
 =?us-ascii?Q?aSklht6y+UN+5Lwi/1C9mA4z/uR5q+RaVniS63IecqIy+GrMWDeNEogkdzmV?=
 =?us-ascii?Q?xHtkmqDEYeWNIwhLg18z6kTAG6gwyw9lFqwKGJ1WSyYR+3stklppX6G3S//8?=
 =?us-ascii?Q?PJYZNEAhT56tGnVok0iGhmkX5dS2qEtGgznC5Nnt3VuMeYLdyWveEMk+KvzR?=
 =?us-ascii?Q?NpL2mC6x5xJMaFtACjG3IfV/IheCEhpQ7K0EgQoRX7F6kS83bv3mFCAQgzlT?=
 =?us-ascii?Q?UVLedOaQkZ3+E6xzPaX7zq8QkheHb8/A7Tqb+rLfnd8nj0eHZINZG5hcXCZI?=
 =?us-ascii?Q?hcNRLLW7EfduOiAcOZCYf+an6uLWC7LglTvecyY24Lt653IXvqt0fDam3DiT?=
 =?us-ascii?Q?iai39usJMzJGvsjhqgv6JmF9xd5hTfDNV2I598fccnWSN9Bfm1D1TFCmH9FL?=
 =?us-ascii?Q?L4ak5uBNyAEUc5x9pSZ03bFhuF3rRHM7mjQ2yhfADTHVzCFGfoAWD+EHsRLO?=
 =?us-ascii?Q?QFzOspLmFjlFz7XuY3G/NtRQQ1yBJ0Ie9Byg7qoDOC24V0SmW5Iptzk+o+g3?=
 =?us-ascii?Q?qBJKbzpSNGoJF3YwlPDeihJLgx5k6ZgGbyxHym6uhJ3VYzp0dMHwue38u8nh?=
 =?us-ascii?Q?5Y30JiG+r7I2RMzH5outhSy0V7NcTQYgGj3yR914ApEK6aMGSaAPKofjEQUK?=
 =?us-ascii?Q?J2xQCcfmilU6J25aHLzdIMaFu1l8bWVzZVAywTkaV6OZiwFn1MWBw2/xx6TC?=
 =?us-ascii?Q?AdyrHYUhYGM1u7i1eOGNKQnf5qBgr2FzBRPyuw232CZNIx4+fvCmna2Neb6a?=
 =?us-ascii?Q?ZxGCmSLQwGY+AqMqqAg9OWjGhW5Xm1HVdOYZJst190tStSE+U4tejOmY9wHv?=
 =?us-ascii?Q?GaysNmAnQpHCjB5UeYF458CQ4nN+5NFq8X8I2IbACZR6aMRm1jMdnMAKYNXj?=
 =?us-ascii?Q?F2sYoREUThSUIfN3FmcIckiymu4aEVYLV7+UqSijEW3p70yEmp4Zk6F86hKn?=
 =?us-ascii?Q?9VrFS6lguNusoTOGrZ9Hbv9569AUljHzRaEnUtjpqUrvcUHJnemdzGW2qHib?=
 =?us-ascii?Q?AhRJSqDvM7lWpFuQ9CYrL20dCP0VvIqXG3saWqvQujLmX/+avXVa9D+kCcW0?=
 =?us-ascii?Q?ypZpQeJPTmqLHxsJh8l9R2cTb8R6Zn/KZzE0aLgeWU4xsFLWmK7rLZw9/095?=
 =?us-ascii?Q?bi3ou7LNBvy4AHXXsHoIIqSVr9QPuN+chw23PgLjZYimw1Arf5rfloEGh24D?=
 =?us-ascii?Q?Q7ewuxaRKnaF4ja0UJfj5rxfp8joQprc8yGnaa9b6MXJ4d7l8dFEQP0h7zVn?=
 =?us-ascii?Q?boaqpX2/H3nW6mNmrQJBRWwmR7GwvoAILjmNZr9O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0df088f-bf59-446e-d202-08dcbd57f238
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 18:27:40.3092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjuYGi6/Ipk3uWumx9lKBoFDq03wCXnz7G7xQ8rQtHlB9/iXpAEvw0Ob2hVzyIIBzmnR4EalpB6ctT5rYqmat+CTlqqtU8REaB4EVnovXt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
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


>=20
> -----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Thursday, August 15, 2024 10:26 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/mcr: Try to derive dss_per_grp from hwconfig at=
tributes
>=20
> When steering MCR register ranges of type "DSS," the group_id and
> instance_id values are calculated by dividing the DSS pool according to
> the size of a gslice or cslice, depending on the platform.  These values
> haven't changed much on past platforms, so we've been able to hardcode
> the proper divisor so far.  However the layout may not be so fixed on
> future platforms so the proper, future-proof way to determine this is by
> using some of the attributes from the GuC's hwconfig table.  The
> hwconfig has two attributes reflecting the architectural maximum slice
> and subslice counts (i.e., before any fusing is considered) that can be
> used for the purposes of calculating MCR steering targets.
>=20
> If the hwconfig is lacking the necessary values (which should only be
> possible on older platforms before these attributes were added), we can
> still fall back to the old hardcoded values.  Going forward the hwconfig
> is expected to always provide the information we need on newer
> platforms, and any failure to do so will be considered a bug in the
> firmware that will prevent us from switching to the buggy firmware
> release.
>=20
> It's worth noting that over time GuC's hwconfig has provided a couple
> different keys with similar-sounding descriptions.  For our purposes
> here, we only trust the newer key "70" which has supplanted the
> similarly-named key "2" that existed on older platforms.
>=20
> Bspec: 73210
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM, though
A) I'm surprised we didn't have a hwconfig lookup function before this patc=
h.  And
B) I'm not sure how this relates to the prior patch in the series aside fro=
m modifying
the same hwconfig files, as this patch seems fairly self-contained.

I suppose we could consider moving the newly-created
xe_guc_hwconfig_lookup_u32 to separate patch, but I won't block on that.  A=
nd
it's likely doing so would just cause "unused function" complaints on compi=
le,
so there's probable reason not to do so.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 40 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_types.h     |  6 +++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 40 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.h |  1 +
>  4 files changed, 83 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mc=
r.c
> index 6d948a469126..7d7bd0be6233 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -8,8 +8,10 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
>  #include "xe_gt_types.h"
> +#include "xe_guc_hwconfig.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> =20
> @@ -297,6 +299,36 @@ static void init_steering_mslice(struct xe_gt *gt)
> =20
>  static unsigned int dss_per_group(struct xe_gt *gt)
>  {
> +	struct xe_guc *guc =3D &gt->uc.guc;
> +	u32 max_slices =3D 0, max_subslices =3D 0;
> +	int ret;
> +
> +	/*
> +	 * Try to query the GuC's hwconfig table for the maximum number of
> +	 * slices and subslices.  These don't reflect the platform's actual
> +	 * slice/DSS counts, just the physical layout by which we should
> +	 * determine the steering targets.  On older platforms with older GuC
> +	 * firmware releases it's possible that these attributes may not be
> +	 * included in the table, so we can always fall back to the old
> +	 * hardcoded layouts.
> +	 */
> +#define HWCONFIG_ATTR_MAX_SLICES	1
> +#define HWCONFIG_ATTR_MAX_SUBSLICES	70
> +
> +	ret =3D xe_guc_hwconfig_lookup_u32(guc, HWCONFIG_ATTR_MAX_SLICES,
> +					 &max_slices);
> +	if (ret < 0 || max_slices =3D=3D 0)
> +		goto fallback;
> +
> +	ret =3D xe_guc_hwconfig_lookup_u32(guc, HWCONFIG_ATTR_MAX_SUBSLICES,
> +					 &max_subslices);
> +	if (ret < 0 || max_subslices =3D=3D 0)
> +		goto fallback;
> +
> +	return DIV_ROUND_UP(max_subslices, max_slices);
> +
> +fallback:
> +	xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using typical fal=
lback values\n");
>  	if (gt_to_xe(gt)->info.platform =3D=3D XE_PVC)
>  		return 8;
>  	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1250)
> @@ -314,16 +346,16 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>   */
>  void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 =
*group, u16 *instance)
>  {
> -	int dss_per_grp =3D dss_per_group(gt);
> -
>  	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
> =20
> -	*group =3D dss / dss_per_grp;
> -	*instance =3D dss % dss_per_grp;
> +	*group =3D dss / gt->steering_dss_per_grp;
> +	*instance =3D dss % gt->steering_dss_per_grp;
>  }
> =20
>  static void init_steering_dss(struct xe_gt *gt)
>  {
> +	gt->steering_dss_per_grp =3D dss_per_group(gt);
> +
>  	xe_gt_mcr_get_dss_steering(gt,
>  				   min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  				       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0)),
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_=
types.h
> index 8e46c0969bc7..82cf9f631736 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -376,6 +376,12 @@ struct xe_gt {
>  		u16 instance_target;
>  	} steering[NUM_STEERING_TYPES];
> =20
> +	/**
> +	 * @steering_dss_per_grp: number of DSS per steering group (gslice,
> +	 *    cslice, etc.).
> +	 */
> +	unsigned int steering_dss_per_grp;
> +
>  	/**
>  	 * @mcr_lock: protects the MCR_SELECTOR register for the duration
>  	 *    of a steered operation
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe=
_guc_hwconfig.c
> index 025bad701556..af2c817d552c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -160,3 +160,43 @@ void xe_guc_hwconfig_dump(struct xe_guc *guc, struct=
 drm_printer *p)
> =20
>  	kfree(hwconfig);
>  }
> +
> +/*
> + * Lookup a specific 32-bit attribute value in the GuC's hwconfig table.
> + */
> +int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *v=
al)
> +{
> +	size_t size =3D xe_guc_hwconfig_size(guc);
> +	u64 num_dw =3D div_u64(size, sizeof(u32));
> +	u32 *hwconfig;
> +	bool found =3D false;
> +	int i =3D 0;
> +
> +	if (num_dw =3D=3D 0)
> +		return -EINVAL;
> +
> +	hwconfig =3D kzalloc(size, GFP_KERNEL);
> +	if (!hwconfig)
> +		return -ENOMEM;
> +
> +	xe_guc_hwconfig_copy(guc, hwconfig);
> +
> +	/* An entry requires at least three dwords for key, length, value */
> +	while (i + 3 <=3D num_dw) {
> +		u32 key =3D hwconfig[i++];
> +		u32 len_dw =3D hwconfig[i++];
> +
> +		if (key !=3D attribute) {
> +			i +=3D len_dw;
> +			continue;
> +		}
> +
> +		*val =3D hwconfig[i];
> +		found =3D true;
> +		break;
> +	}
> +
> +	kfree(hwconfig);
> +
> +	return found ? 0 : -ENOENT;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe=
_guc_hwconfig.h
> index 7df315900e1c..ab4e5038236e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> @@ -15,5 +15,6 @@ int xe_guc_hwconfig_init(struct xe_guc *guc);
>  u32 xe_guc_hwconfig_size(struct xe_guc *guc);
>  void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
>  void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
> +int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *v=
al);
> =20
>  #endif
> --=20
> 2.45.2
>=20
>=20
