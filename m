Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10763E668AA
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 02:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E110F12E;
	Sat, 20 Dec 2025 02:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWzYUb8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9710E07F
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 02:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766199532; x=1797735532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T1/T7aDPNwjoZFCkMbKojQwAhVa39z0NK1ArDV/NCPA=;
 b=LWzYUb8/aNkFjYUOOg3NL5x4GV4OhA1/qVmhQMVjEF/Pe/rXZkRv5/Gl
 ssT4u1nw7z+cQdR+bzCt4w7SKllsB1VeqOejK1rYzQkA1Y+Z5p2kxsScD
 nlb4Q3ngLhdw4eZSHFC7eoc42xMmZNUXWlTlls2Mfyqj620OeYCKZQYDZ
 8vlGvpXQPtlOCir5FOewGZz6a84I5m1Z6A62e1SpQXYgQAr++YMqtnpMO
 varN23/rxy+xDo6iyHBNkWMtBBQQ997T+gmyTypb3CDS+XLb88Tr4rBpF
 Y/UouYLdwtyEEQ5+NwtS7jPP9IS+KGFlBOsDdbSJVWx0mpmhJzBRVelYX g==;
X-CSE-ConnectionGUID: QwWHJUwCRYOwVr7vMxNuaw==
X-CSE-MsgGUID: mQ+ReR/CQnat7G6gZ01SOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68132943"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68132943"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 18:58:52 -0800
X-CSE-ConnectionGUID: CJLRBjZiQaq8KzbtDsHLzw==
X-CSE-MsgGUID: WqTgMIxiSe+DyBOAWOAHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199249636"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 18:58:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 18:58:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 18:58:50 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 18:58:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbwlwFvkXT9qlEqAm4/uBOFlN6qYEqratXCguNDHVoxlkGicc2nwccnatb2X6A1ymMbPr4+3qalhzwPZxMYTEQkvS1KbH9mwUhoeRjbe1kmK8pO2h4mc9l7KCYkDWX3XEWdTew2uOlqRb9ivYJ9lkZzfZXzoth2xe4zSDzemUeMoVOc4C+0rLnEtTxh7/AagVkxBYQ5Q5aLufZ2hSJEIDY1YIRgrjuU4PucCRi/A6MWT+jP3Kg484Zr9o35QMAsKSMOcvFGGbvV/i1oiIyeOScdr7uMMbFWA+ejraRwduuugjSaVVv+QFK3twZW7OrbIzzQWPivru3RrSYtr8RXf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOl1z7xMZh6IF4BqwClhFzGOoMogyr58QRuoH+OM8To=;
 b=o2aIe+gqb+TnLTU22nCoCS/2KP/denx2a6y4MyuSlLZAFSRXOyla0nwAX4+1vOWTRlvoD2+dsu9HdFMzHls+9/E9gwzmfZIdxasBlctb59J8UoOq5szo0zs815GyrXAFfx6VLTglOQMsbGLfyqTCILJ9ZLWsUMEFGq2QhY9NfOip6GGsW4CSvQDgBKTOwUt1Is523W1OHonUO9xmAc/AAGVLZI/Q5y1gLjCNyMKhaFe4S9xcLOlZRUaIoJi4cxdtkXVau6AQduj0F8VD2KQHjVoyIu1bMFyp4IUduFzKn0LniAivFDKkpU48ydTE+TNo+qQJYRqLLAoM0sb3jeo0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 02:58:47 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 02:58:47 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vijay, Anoop C"
 <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v6 3/3] drm/xe/soc_remapper: Add system controller config
 for SoC remapper
Thread-Topic: [PATCH v6 3/3] drm/xe/soc_remapper: Add system controller config
 for SoC remapper
Thread-Index: AQHccVJHhu6ZRJoRIUuU0ZuZZaA8+LUp0MlQ
Date: Sat, 20 Dec 2025 02:58:47 +0000
Message-ID: <DM4PR11MB545660F92C4F85ADFC95C3A4EAB6A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
 <20251220014442.3076408-8-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20251220014442.3076408-8-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN0PR11MB5961:EE_
x-ms-office365-filtering-correlation-id: 6d357342-5651-436c-7971-08de3f73b1ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?2DdOc7vRKlMHd1sFJQY3gvzKohzS6p72ZEuQTuIFypxfh433TFdusPOX22TJ?=
 =?us-ascii?Q?Aystxr9O8Z/neC6X6PEnSaoI15vc/9FHHrItrmRI9vZWGUh89UibT4tkzESN?=
 =?us-ascii?Q?pgLojqkxdXOx85elFJKaxsgjEMwJwKmiLTybxpfS9Yl/508BeWRm2gb7pB19?=
 =?us-ascii?Q?LIcD3mj0dTt5mpNqvpaXOFfkJxsVlthOTuYbvn8EMeXADtgrHSjpWD2Y07gM?=
 =?us-ascii?Q?fqqYbNjI3PyP6DsfbvxOj66kHbaDF8mrQQWTyIlqbT/XT+3ujduy0jjgPt0u?=
 =?us-ascii?Q?whn4WH2Mgkw2RtKVM+SKI50EHv3L8ah+x/2Wml6f3viedqdIlSf5PC5hDRIF?=
 =?us-ascii?Q?VZ1F7e95ea1JGVeDTTGmOBWhA5DnIb/4ox8dPEuNkjWGzBlb+wA+7krGByUF?=
 =?us-ascii?Q?ArGO5uH3q7rCwuuvGYmFw76RlIJyMyO2J2xOD3W3D6Qc9sA1VIdOV8JHEpVo?=
 =?us-ascii?Q?IpJmKg+9g8b5ZDhpYoqe09GO9+oxNxMeI7sAp2GkS9w13zrxFS8En3uTRwlL?=
 =?us-ascii?Q?nONmSR7Q7R2swRRZNff2SHBiGntTahYHSz+IFDr4DUPJZ1bAe8tDq9cU5akl?=
 =?us-ascii?Q?V/isqUNHnTSeNJeJo84r5ITngf5+StD8MfHtoLO3fPpER7bX0oQ/+u4CCgwe?=
 =?us-ascii?Q?pupeeDTHRFmxEyuZ3yTZHHLjIwNcL7ezNNW08ngO50SsHwyMiqZMn/7o9CIO?=
 =?us-ascii?Q?PEKLvQswHvIZdn840vKchfxT/sThJFxQUNkCmbPhweaLoc7hwA8y5NqjLLM/?=
 =?us-ascii?Q?m3HG1nv5p0DmVhXesc/7SpylAcWVPCTrz5tdtFOq32IqnFjRbFfgWMrd5+0t?=
 =?us-ascii?Q?JblUlvfmrB6iCHjYIXP7AJNAtqsAm0c9i+eCtxWall4yS7I7cTbUztQNqynb?=
 =?us-ascii?Q?g31F14zMnCyJNTL879k6FaBI172k6pY8OXz0EhPNmYmQkYOGzcj58ozl023l?=
 =?us-ascii?Q?gzo+vJcOwD1fYwnMo7cgsPnwsqED4Mz9ENhEXbyTTtzvKgmPw3kL/t+5q6lI?=
 =?us-ascii?Q?t/pFkH/yMUXqubsglDhanp1qMlnoncobIZ3earR6hJFzTSyCI/8EUp3n2FnG?=
 =?us-ascii?Q?EbYKFSvdUAyeOY1qM9Qc74TiojYmXoHfulEkXdGgk7UxrJt3fElAXJJwxB0R?=
 =?us-ascii?Q?QJw++UIR2BI7hywKnUylHhN4gtzSgypPHWpgiqS8z1DCPNQx5kj2Iqfd3hGN?=
 =?us-ascii?Q?MMB+RSPmS+9Q/sokQez01PQaGPl10iTbB4fG/38flflIyvAyMbXHhtpZaTcz?=
 =?us-ascii?Q?VLlPxwqJ1fuxbCd9o19DtaJli8viQHph/0DhnwxwPky7s/KCgL0oyUK8Ooo6?=
 =?us-ascii?Q?o0nQv3LTPoG8wVdHYrxT03XX/zhHaiUg8aqV7cPi+2jkxj8TxiTDz+i8bU+S?=
 =?us-ascii?Q?C5cJWjdC+yATqEVmsuK0CetH8FhnF6DKm0zFGj+o0C6HXG5OmKwJWVkemqKM?=
 =?us-ascii?Q?CfE+ZyJhL8YqjNPKFv7bNUk6qyREVIe9hJqsMgmM1ZhZs7N3WAF3q1iMisWi?=
 =?us-ascii?Q?6aHUspeNEoJkLfPiYzP0ZSblIv/ruGR1uU38?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0BhLza3nQuJ93Na1/8dhxoKRbWGZzKFOr0aqnjKK3nEFAuc+QED4RuucSjH2?=
 =?us-ascii?Q?zt56DhDHGPlZyOJSMLGPCKMrMlCVsbcDLrSreUzwuqBS1D3cm3dC/tSSwEen?=
 =?us-ascii?Q?tdfjjZyyGOVoCP0kQvLexZRxpHhwJD8YPzfxML/gUe81FoxJlRBRf3YDy20X?=
 =?us-ascii?Q?b5aOq1GasTmPs27Pr73qUVS6pGaEdEbk19TkHAjlvndnBE81A4TEzOAeieIL?=
 =?us-ascii?Q?1Spz8p1PB5XLk06l7Cu2LvNz6AW0gfuKX71PxXbA1BTt5shn36pqcdn1bkD4?=
 =?us-ascii?Q?O6n6JAXFl+SOC+jMSAvpc8h61EHskd4KmQhQYFw4BKMulrOTlIVNjEC7IgVP?=
 =?us-ascii?Q?BG0cC19E9WP0VLR8jXXHZKSBIPRuGIskJQQnBY+4xToc1bwLbEvBFV68ZzpN?=
 =?us-ascii?Q?2atwEBv/HhNkWeIwhFwGZuFI6DwpyKNo/a8F3XPbh05a1F3X1eWIorKLzE8R?=
 =?us-ascii?Q?hYjFGkd6BNAxztEOUQi5HwppPuOOGaa2nz9BFRKo1uJ8fa71WZ2vncKh8JRw?=
 =?us-ascii?Q?mJoO3Cn0ipiz5B8JwxtzNVvZ6XZO1kCxjHwq9NKCO+hD8L9VT9XWYCcLPubO?=
 =?us-ascii?Q?+lcFRquYPlRiR6XsihPEMMILUEsnyVVZa2BZng0zFd5wDOos04Ot9znLXqU9?=
 =?us-ascii?Q?ZYLsryZ13Ovxf1RKuTdVmfpOWGdM2YLbrO8Zqk5v8CvnBLkgP8nv3pyaLZ5R?=
 =?us-ascii?Q?PdgUvdCgIhkjawhoaRU6G+sNOiuyeTiytpxVIqGKY9gxmfmPHqOz+nufXxyR?=
 =?us-ascii?Q?OmkaVDybaJJpZV104G//J5UTTGxNSNjZFCox+OGcyjJt6C1TbQOcGqLtdmMz?=
 =?us-ascii?Q?ir8u5auBrWw89AlMg2cbUQ0qPEE8PdBmiCiSVs/9jMyeTfII9xySkbhADQso?=
 =?us-ascii?Q?NvbeLwT1Pa3C8ecuv133TIXLS301lD0s2fNi6lOA3GDpJccnx86odobVrXR4?=
 =?us-ascii?Q?s7x2+5jv7Omt6fnJajzpQaNdk2uz0vIbtkfdfKUNZi1Y4OuDAC/F9rOvfcsP?=
 =?us-ascii?Q?MYrLwb82R1NF/roCFoycmXTwTQoJOcDTFhaONUOPkU2BMvlmPNmEddqpBpBQ?=
 =?us-ascii?Q?HttzAqxQvOc1NrRPTnlMw9bN9dsg1vPItl37OboUoCjZaSreVgqdcwb4pzKK?=
 =?us-ascii?Q?2R0IDn9Y+QL6Hr07wPEvX5wrfyfMwSghvxwu5uBlbpCX3n3HL6ZekCVq+UGx?=
 =?us-ascii?Q?iA2xpAO6AKOzG6bs5H6MfB9J0Dod+QjtdwxrUtaxOnKH0HLkgeDb6Slant/T?=
 =?us-ascii?Q?HtEYPWBn8k6ppsjw9DI1qMzz73YcWvyy878qwnGpRZ9StF969TPAoMabCww5?=
 =?us-ascii?Q?s2uRYWjDclKvhDHriSJ1hF2idznyA0eRoUFqjlXrZo4PuiY2oSQ+mO/PIGij?=
 =?us-ascii?Q?qlqA/oXDp6+LEDWHua+2cWAlA+35YIviZ6anMUQJ6csTGGDpcflwWvxWuAHr?=
 =?us-ascii?Q?HUz0sBZoA6unMKsVOibxHSP33dEKFMIN9eurwAe39q26AeNwUanVTk/elpq7?=
 =?us-ascii?Q?qlY1KjJPzc0HBObMhUJ6hdxTIJEaYdnY2Y4vX/iXgQl/io+h89KA/9aItpPG?=
 =?us-ascii?Q?z8HWLrn33oNwqVbwp6WVt4lK9MiPFwAyG90kmvlkd3V4H1IW0rT/0x14nrTq?=
 =?us-ascii?Q?hfV+BcabUCO7ZlUcfwuD3k+cJW1hFea2Yy1coi7DkCpP9B5BFP796KoAkxWH?=
 =?us-ascii?Q?jqZ1qj66wohslVjV47bTl6Celg0PL6ba+iaZjRmyu639FJ4xcVUYTSNVG1II?=
 =?us-ascii?Q?QsWtdc0O2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d357342-5651-436c-7971-08de3f73b1ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 02:58:47.1749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QmZLIRlGanJchda/pI/RyyC9Wxlrq0kYdqstzytgf3+u66rsU3ViAXFTKrj3JPInfj4HEtYo5u6e3RPKDAjig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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

On Fri, Dec 19, 2025 5:45 PM Umesh Nerlige Ramappa wrote:
> Define system controller config bits and helpers for SoC remapper.
>=20
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2: (Badal)
> - Add kernel doc for function
>=20
> v3: (Badal)
> - Prevent bad access to SoC remapper
> ---
>  drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h           |  5 +++++
>  drivers/gpu/drm/xe/xe_pci.c                    |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h              |  1 +
>  drivers/gpu/drm/xe/xe_soc_remapper.c           | 17 +++++++++++++++--
>  5 files changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> index 9edf234227a9..be0eb37e73ad 100644
> --- a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -9,5 +9,6 @@
>=20
>  #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>  #define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +#define   SG_REMAP_SYSCTRL_MASK		REG_GENMASK(23, 16)
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index fc121b236dd9..3b6a46a4e239 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -335,6 +335,8 @@ struct xe_device {
>  		u8 has_range_tlb_inval:1;
>  		/** @info.has_soc_remapper_telem: Has SoC remapper
> telemetry support */
>  		u8 has_soc_remapper_telem:1;
> +		/** @info.has_soc_remapper_sysctrl: Has SoC remapper
> system controller */
> +		u8 has_soc_remapper_sysctrl:1;

Nit: sysctrl should be added prior to telem to follow the alphabet sequence=
.

Shuicheng

>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
>  		/** @info.has_usm: Device has unified shared memory
> support */ @@ -582,6 +584,9 @@ struct xe_device {
>=20
>  		/** @soc_remapper.set_telem_region: Set telemetry index */
>  		void (*set_telem_region)(struct xe_device *xe, u32 index);
> +
> +		/** @soc_remapper.set_sysctrl_region: Set system controller
> index */
> +		void (*set_sysctrl_region)(struct xe_device *xe, u32 index);
>  	} soc_remapper;
>=20
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> 55daa1b5f383..9d0dbbb98362 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -422,6 +422,7 @@ static const struct xe_device_desc cri_desc =3D {
>  	.has_mbx_power_limits =3D true,
>  	.has_mert =3D true,
>  	.has_pre_prod_wa =3D 1,
> +	.has_soc_remapper_sysctrl =3D true,
>  	.has_soc_remapper_telem =3D true,
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 2,
> @@ -694,6 +695,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_page_reclaim_hw_assist =3D desc-
> >has_page_reclaim_hw_assist;
>  	xe->info.has_pre_prod_wa =3D desc->has_pre_prod_wa;
>  	xe->info.has_pxp =3D desc->has_pxp;
> +	xe->info.has_soc_remapper_sysctrl =3D desc-
> >has_soc_remapper_sysctrl;
>  	xe->info.has_soc_remapper_telem =3D desc->has_soc_remapper_telem;
>  	xe->info.has_sriov =3D xe_configfs_primary_gt_allowed(to_pci_dev(xe-
> >drm.dev)) &&
>  		desc->has_sriov;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> b/drivers/gpu/drm/xe/xe_pci_types.h
> index e2bd4c81b2a7..5f20f56571d1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -53,6 +53,7 @@ struct xe_device_desc {
>  	u8 has_pre_prod_wa:1;
>  	u8 has_page_reclaim_hw_assist:1;
>  	u8 has_pxp:1;
> +	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
>  	u8 needs_scratch:1;
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c
> b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index eaf18d85279d..f894f4899cf3 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -20,6 +20,12 @@ static void xe_soc_remapper_set_telem_region(struct
> xe_device *xe, u32 index)
>=20
> REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));  }
>=20
> +static void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe,
> +u32 index) {
> +	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1,
> SG_REMAP_SYSCTRL_MASK,
> +
> REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index)); }
> +
>  /**
>   * xe_soc_remapper_init() - Initialize SoC remapper
>   * @xe: Pointer to xe device.
> @@ -30,10 +36,17 @@ static void xe_soc_remapper_set_telem_region(struct
> xe_device *xe, u32 index)
>   */
>  int xe_soc_remapper_init(struct xe_device *xe)  {
> -	if (xe->info.has_soc_remapper_telem) {
> +	bool has_soc_remapper =3D xe->info.has_soc_remapper_telem ||
> +				xe->info.has_soc_remapper_sysctrl;
> +
> +	if (has_soc_remapper)
>  		spin_lock_init(&xe->soc_remapper.lock);
> +
> +	if (xe->info.has_soc_remapper_telem)
>  		xe->soc_remapper.set_telem_region =3D
> xe_soc_remapper_set_telem_region;
> -	}
> +
> +	if (xe->info.has_soc_remapper_sysctrl)
> +		xe->soc_remapper.set_sysctrl_region =3D
> +xe_soc_remapper_set_sysctrl_region;
>=20
>  	return 0;
>  }
> --
> 2.43.0

