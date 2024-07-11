Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F227DC3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 18:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743B10EB5E;
	Thu, 11 Jul 2024 18:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXvkNxmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4993110EB5E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720723089; x=1752259089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fn80nAw8PzV9TN0ViJrvSXHaoSFitSyQd0k8Mx+BlCU=;
 b=CXvkNxmSy22c+U5dUAWb47HSY47dpuCHmL5x4yeRJD36SIuJ7VM8xTcA
 RsJPljtUMlk8sEVz0xU6esJMjJRnAlH5jvP+/X4sunmGxIpzzb9MqJh/t
 Vkp7Zh+Fn/ANHP1ZvApuyFjyHTpu0+6XXAMIyfqGk9bbrLYGhzn27+A3W
 DSiGfAsmm9TlrSHWmdMX3QYT44Jm5mgzZo+bvk8WomXTxjZueJ5BC6qzY
 m+k7GFGl4HEwC+0tBD57uVFfF9LECPd/+k/16w4cVusLFon/AY4YtN7N9
 1noocDjmjj+efEnjcjJLqs/fG49LI5xLclZJ0DKQhbZaCBA68MTqRS33a w==;
X-CSE-ConnectionGUID: MklBY5J+RHKsyiCgyNkBaQ==
X-CSE-MsgGUID: Yr67mubBQAqgHna4PQi1bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18336511"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18336511"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:38:09 -0700
X-CSE-ConnectionGUID: 13TCNJMNTn2DJHCM/KeL3Q==
X-CSE-MsgGUID: aJD9o92kSDKN/IHJeRmAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48628455"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:38:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:38:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:38:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:38:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MggaCWYXC5Hbm3hXOAh+ZTTyAsmCfS0e3ePznTWZEdJeM4WdNMnkeEXXzc2wGZcuMozHRR17BhpNhTu3z2mVGDOMkHdSBze58zH5jBW34o2+x4WSMe0pYJ1JzDv+aTI2ba1g/XCtW6P4sIYyONFFmGV02+xSezTzQtWPRMO4yfeWbAKQfn55IF/2uIKxveGlomyG++Zi4+0e7FBSW2yY1M2nVhqRZGgQZaDi2Yb41102/gY/mpZB6xARWoB+Dh+qtaP9FVcrt+/eBcggacOvhT56DZuwWPW6oPJDAmWGTXvb1uL5IHDXjlHttPHf7WzHsWaIJzqD9mB1yzcOhS/cCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZLEfMn6tx0Bo5P1TaeWCtPHPv8H9+4GoKyBw+rtxQQ=;
 b=ZqKUF9S7I+DadoxQ27O36TPP3k8FhXDViS+3Fbz4E2qb9M2bxyOahYFWdqPBHCBP3JLxkiH0VHJlZxvzZBEXUNBymYXYlDSW0KqE4y3nNF0DE4Ouu+QU2HaiT/WR7AxszpnPVa5fdDhkx9xhJSorALn7oWOaRUxlcgpcnGASZLu8GHl4IWUpZlNfMklcO7pz9aWawihv4Nup6pgsNx+aqL9wlZL/Tjm+1H6U8G9BOizAOJOBT4EWNQOOaqERkinbO394RyiNiTdZYoFTb41vpEDUUoUYy7Eaxxq2Sc2qTAOh49OiahQFwNkosSlIYxscJd7JjiSBPP6XYed//6BFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 18:38:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 18:38:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 04/12] drm/{i915, xe}: Avoid direct inspection of dpt_vma
 from outside dpt
Thread-Topic: [PATCH 04/12] drm/{i915, xe}: Avoid direct inspection of dpt_vma
 from outside dpt
Thread-Index: AQHa07WRv3y0SA5knkGVW5t8kpV7+LHx2xSw
Date: Thu, 11 Jul 2024 18:38:03 +0000
Message-ID: <CH0PR11MB54446F82474AF25E044E8076E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-4-rodrigo.vivi@intel.com>
In-Reply-To: <20240711171155.173717-4-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV2PR11MB6046:EE_
x-ms-office365-filtering-correlation-id: 1bd8be48-7367-4301-50cf-08dca1d8992c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IGlX2nX+jHSnOurjkIOAhJlNLSEc9joAj0KmA1N6oW8T0k11yqjNPqFouXe3?=
 =?us-ascii?Q?Z6aLVkUP6hJiLiBFHgaoK1uTQgW2xh/X8PllBNzWuV6zS0/f+ATgSetgWUxh?=
 =?us-ascii?Q?9vHrPnikPF4y6a/JZT9hcCo8y3XIBbkvddtrfEA4UgkNPRIjpNhRngizjmHR?=
 =?us-ascii?Q?MQtEKtbxqw8o9lkNe9Y8Yn7zAntTzhccQX7X012howMp015LjfdUCrUih7jJ?=
 =?us-ascii?Q?yN1wJby6dwnAd6081ceks8acEMSHkSmKTjU7ahjS5+Eh1hiThEWxEKhlAxgN?=
 =?us-ascii?Q?otoBykyr5UpxQvwiEd7L3x05GLwPSbiOJw7UB8IwE9HwVxfD+LQ/oUPbp/+H?=
 =?us-ascii?Q?7OsyMX4CCkkFSfRe4yrz3cKZVE2yMJ2mO46YRKksNOHFhVNvXvFB96+isJAu?=
 =?us-ascii?Q?0F6C3Xwkv3YBg3JzyMuz5nPx9MY8Zaq5kTR+HOwQKDi0b6TWTJg2aXeb0xLu?=
 =?us-ascii?Q?pLSlky0GVCZ2aQyYOpMYQDB+HrOabd9nH2gQn9x68/Xe2qR7I6L8B730fcL5?=
 =?us-ascii?Q?3wHsxRoGDmhk1IW0pkqYBzgqfHtNKCh+/c7ilbW7nWMJJ3Ut8b4z2UmptNoq?=
 =?us-ascii?Q?kVs7kNGmDGwBQoKN22vJPaQb+YOENuVvAogkQ2uZANAugbPmS4Jy845+b12M?=
 =?us-ascii?Q?VIz3NehgFIxtQ5YjSimg6v8Rv8CFGyRqq5hIeoRv8SWIzr/lr3iqrTGxoHqs?=
 =?us-ascii?Q?hMWbjivp1Yby/WczZAvN9ojXXQ7RFnH/PAnhooyG6tqkUFhZy0js0emAqSp5?=
 =?us-ascii?Q?pEJOrOprrQcH3l2QRVE3a+X8LvaNMFrpwXFwrtDUql2v6+xg5pMMUK/P72DN?=
 =?us-ascii?Q?RHvZtV1ThbHsGSIwpQulAehysJ8NPihAh7PWWrgJHu21wbkoHJ4xWbcfMPYo?=
 =?us-ascii?Q?uS1fh021y830c8D8DAVTQs5uZWJtF1P/qjqEU71axNj0Y6SEupcx+hR13TJa?=
 =?us-ascii?Q?vZvnfFu44PEU4RkvmEtseqxvBg5rOPpG0G8N6be9FbMA9rpzaba95FF5MjOf?=
 =?us-ascii?Q?1ySnnHZM0bT00aMbItgUCTH0oxCG6oj22ESNBKB678SJF+rZgVvJVmkBKRSj?=
 =?us-ascii?Q?D1UtOTZlFLkXAHr6tep1PjXaDX0Ah3XkvXcBj7pEG4E71WVzSKSfYZfhA7Cv?=
 =?us-ascii?Q?EP+TcBt01DYc/Gl8ITwEEffAJ0OxCqBdNenNcJ8sfE4Npk+5LI093dRksz3w?=
 =?us-ascii?Q?OKleb1bBOo5IlK69O5u9WVREi38Qm8aNFJlxiLShauf8cLENH7xgDWUbB2Py?=
 =?us-ascii?Q?hBFgaIb/SFmxcvfoaST2bDlgNKWrhG+wBG8T00ohcIaxNT/VDj5b2awF57qt?=
 =?us-ascii?Q?boFOkB63UfyJ9TkIsjNqueh2Q8i2BYWShnXZZJJzMiQyi4hj6NGNz8GeEqR4?=
 =?us-ascii?Q?IUsUTKC+xEhbhPlV0cJEQLyQPMBmN6Z8qPlgkxS3ldV8OzgJeg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oexFLzB3Pl7MQgDQKEEmOlGJ4EC+gY+Wmz7TDVkc2NyIhKz6izjJN6zl5BuC?=
 =?us-ascii?Q?CBMlJwj0fy89uQSy2qr6VQsfnuePAhKrsftAAnWkZgztKXcwde3FY3smzmzB?=
 =?us-ascii?Q?rqGv/mlFbtketLmcHwR5C9c+GSuLf3R/m3+73YAMrdlvfVwZcppd+bR0Nsw3?=
 =?us-ascii?Q?kqQTMn+nCGQdheB9aEtpMKibLapT1jjjuGtXlfgJoq1eanqtsAbwRMesI5ud?=
 =?us-ascii?Q?4d1hjZolVYbrVWlSQey3hk4ztyfmBLofMrQZ9HE8C4XtD4ed07y6o/fbcwUY?=
 =?us-ascii?Q?19hK2EUYSy/qsoOKxJfmWUOR4Ax6z0LPv7DMyvOptcJzxd2W0f/juFjaKX7q?=
 =?us-ascii?Q?jlBnzXVYeRHVyKRYYO7OxC8HParJGMP39ct/uBfmCyjV4xSEw2eLGTOrtgbx?=
 =?us-ascii?Q?xzLR8XsUsH4UzF3BpiZ9tqrHk7hEnkTJcoh4JWyiBe6AHdVG8swV+KQXIaqX?=
 =?us-ascii?Q?jHfuwuK4cIyzU6G1HEhMyrwNDYSTCzzHoXJfub3uss8eBquIj1NsR6igUSWt?=
 =?us-ascii?Q?jjuToIhRZtkakRp7XEUoymQ8jXTDjzZbTyxZwB9qc2CfDL+M0ub6JtbdYyFD?=
 =?us-ascii?Q?zRJZjEOKgVQrd9xl6npcr16eEGpS55yc78YYqGfGFvwKTtIAH4ztfksCShmJ?=
 =?us-ascii?Q?SCkyIFJ4gJ+TtjFX6mHYyQXb5q+7DXzucQOMzttDVvtnPDru/iYShuVuqeJB?=
 =?us-ascii?Q?RyWJiJZcabll6UkX2/WnZ2XRfrDbQpu4YHXzFMc20JaMtcKtX0fdjG4ol+dj?=
 =?us-ascii?Q?i1FBF/4ASRhsB1dWnbYxtFLQ0NZHUixI6WdXzGJ8WwQROE1wX40HQwcwfTIC?=
 =?us-ascii?Q?/WuKoJm9zb4hidz7vbmRti4s5x1u6NrtqwbZUjCfbJCpfYQimCdGUBXPAFa7?=
 =?us-ascii?Q?H5hl7928yehSQ0Gj0qlZtV+Vxc2RoZhRS8RsNnw16I1VSCoulwRXwz2RlxuM?=
 =?us-ascii?Q?qaRyvfpZKhKHXtmYErimWFoTcHn+Zw11YMKGzTQYfyP4hNdbU/PFk0rTsLvd?=
 =?us-ascii?Q?BbWinSRW4o1sGRu2pfO85rvbzvV6hViXo6w4zc94VEgDI0r1P93vcykPaP1e?=
 =?us-ascii?Q?XTwgjATwurFAKCEhOZ7i4Jnxm6zhYNdJbfiCV2+/zd36/fsMTw6JhlxKlQbF?=
 =?us-ascii?Q?RGaydl1W9QPagzAhfqm9NGXG81hTWt4YLG7cpuH1fNw0/a5wpvhw2foHFwi1?=
 =?us-ascii?Q?8m75yFvY8eIvW3dGmXbWOuOjOrVVGMpqfhxa/g1Unvwg99EWaOFnfxb4WUxJ?=
 =?us-ascii?Q?VIBS6qEBfVB7Y9ebMv30XkU3lvLjxc05dv9S77S93nkUiBeBOHOj8mmIZaQl?=
 =?us-ascii?Q?vSRpWOel6u//lhjvNnwnXuqghdh2XEp9kHSg2vIKJREThYdtOmstWk3ZHx8+?=
 =?us-ascii?Q?wktf/jrxq0uFmWehIIcvxakqPy2prBTf19h7w0A8caMhF725IhTSF7isAoYO?=
 =?us-ascii?Q?+x+T7mmy3R62ya+x2ZC8XHPB+hVslvovVBEPMUXoIcYUZa1viryu7Cfmcq41?=
 =?us-ascii?Q?QfFZnUoHhBUR2arLE8eNagWth/PAauYh88P31KprE74LXPl/qFywTHwIGBOc?=
 =?us-ascii?Q?A5LM7/aXaqLcCO+asB+PG3gTNtOx1iuXfmJa2GQ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd8be48-7367-4301-50cf-08dca1d8992c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 18:38:03.4513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 905skE7MsMqxaQVjq2DgCovUnGgcha0hQrnnI/4ejNYCKQMVw8/JlOy5ELtAKAXMdAXOUZX7bKZ+3J5PoETkh+5XH0a3Uz6Gn3Pt2JYKHMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6046
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Thursday, July 11, 2024 10:12 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Brost, Matthew <matthew.brost@i=
ntel.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Juha-Pekk=
a Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 04/12] drm/{i915, xe}: Avoid direct inspection of dpt_vma f=
rom outside dpt
>=20
> DPT code is so dependent on i915 vma implementation and it is not
> ported yet to Xe.
>=20
> This patch limits inspection to DPT's VMA struct to intel_dpt
> component only, so the Xe GGTT code can evolve.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
>  drivers/gpu/drm/i915/display/intel_dpt.h           | 1 +
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
>  4 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i=
915/display/intel_dpt.c
> index 73a1918e2537..3a6d99044828 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
>  	i915_vm_put(&dpt->vm);
>  }
> =20
> +u64 intel_dpt_offset(struct i915_vma *dpt_vma)
> +{
> +	return dpt_vma->node.start;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i=
915/display/intel_dpt.h
> index ff18a525bfbe..7336e905142d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.h
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.h
> @@ -20,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
>  void intel_dpt_resume(struct drm_i915_private *i915);
>  struct i915_address_space *
>  intel_dpt_create(struct intel_framebuffer *fb);
> +u64 intel_dpt_offset(struct i915_vma *dpt_vma);
> =20
>  #endif /* __INTEL_DPT_H__ */
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index ba5a628b4757..1cf1d5c8b9dc 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -14,6 +14,7 @@
>  #include "intel_de.h"
>  #include "intel_display_irq.h"
>  #include "intel_display_types.h"
> +#include "intel_dpt.h"
>  #include "intel_fb.h"
>  #include "intel_fbc.h"
>  #include "intel_frontbuffer.h"
> @@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plan=
e_state *plane_state,
>  		 * within the DPT is always 0.
>  		 */
>  		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
> -			    plane_state->dpt_vma->node.start);
> +			    intel_dpt_offset(plane_state->dpt_vma));
>  		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
>  		return offset >> 9;
>  	} else {
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index d7db44e79eaf..42d431ff14e7 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *o=
ld_plane_state)
>  }
> =20
>  /*
> - * For Xe introduce dummy intel_dpt_create which just return NULL and
> - * intel_dpt_destroy which does nothing.
> + * For Xe introduce dummy intel_dpt_create which just return NULL,
> + * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset retur=
ning 0;
>   */
>  struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb=
)
>  {
> @@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
>  {
>  	return;
>  }
> +
> +u64 intel_dpt_offset(struct i915_vma *dpt_vma)
> +{
> +	return 0;
> +}
> --=20
> 2.45.2
>=20
>=20
