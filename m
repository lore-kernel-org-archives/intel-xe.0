Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F21C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1E610E218;
	Wed, 14 May 2025 08:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMRfg2nq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332D010E218
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747212257; x=1778748257;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xZULr3GGTpuGtFFnR+P2w6DlLeM24BlEezWHS0x2Hus=;
 b=eMRfg2nqjEupMbzcxR7b1n/YBLVNQXhBgFExjsJQvoZof2kfxrZ3pe2s
 8vtIZvKi/ZjCfT5YMJ+YE6iuWFT6LezCBc8uVW0dzkZoXjB0ccIemoPG+
 q+dlNgUeUJAkfVCc3L3fWmAc2vd+y9aLNXzYifgMUQtCmrW+keO1iLpJj
 U2LvN3gF6VfYNyj2ji5ZTW5HEfwNc5+3rUd0pz3aXsy8TLxBXnR+FLdlZ
 uf1fWZ4Fz9x1WsciKab02q+3uFhYMZGAuta93lk2qDXToVe5CwkOz9r8R
 KNVZZ/DfNTxjGm1Inlygbzo+ziYJpNT5gXfKSG86posdMjk/e9/rnLwfK g==;
X-CSE-ConnectionGUID: QhQ7xF1qQCq35N4nXGFgag==
X-CSE-MsgGUID: ZgJP8hSJQXGOvD8Mf+5uAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52900004"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="52900004"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:44:17 -0700
X-CSE-ConnectionGUID: +7Ejts+yTUyn2esEWOekbA==
X-CSE-MsgGUID: 8S1Q1ReXRA+lhTK6jMhYqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="161261767"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:44:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 01:44:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 01:44:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 01:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCrspmzw/abANfIgplbqJrvSxsRuYlszjRzrwVaD11wzMi1CkMqV8TpAGND3nOp2BPpXE4WOa4rbDutWbF/zLPk940+MOKBE2XuairSSE0Z+2qwI63cLKYVm1bhfNUgo9xsu5gml3sJPHPE7hCdsX5QWsg+TlIIzhQRuNtaHZedZSPWzx00F/vkI5UnMGZai8KDUV2kyRgxTDj9M1GrdSFmpmC+Pr+KTQw15hXaswQXxZwucaPOqiNnsxEuLMNk2qpw6llGKckN2ZnitsxFYOXlsEx/dtln31c0Z0iaWee+bAZH3CPsIbkF9lWtF9JZ/LffsyGn5ace/Kr6MozLvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfrCWhbuzYflkPrSu5IiNjVa566CZLKObgRRI6LEkOE=;
 b=xKDLkk0S+VQ1AFzddNVgKCkVskmfk3A5W7jc1blUGTtsIqeICv7JYLXNGkaNN4noNCM8FAt0w/wkt5yER/yry2cpmsecY+EEnQQKy0De6hZcmCRhSz3DHiJkV5uOCe6yop5OZN1lv06Wf+VZj6su7o2Jmzel58pUJnpw/m6fFqnoi53d8jxZCpAPKeMLvY7HwZtoPi1b7cMhLryJMp+NH+wOvLkU4R2yko8Y7M62LwFOM53wXnmussgEV0mZFTWg3W0IlcE4ciGlTGDVYOfFZWn9jNLurZO/WXzn11ovUxhM6bErQN3y8hyjcfZJt8/jseaPZkSAXm3XOgdRgxLkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS4PPF7551E6552.namprd11.prod.outlook.com (2603:10b6:f:fc02::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 08:44:14 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:44:14 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
Thread-Topic: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
Thread-Index: AQHbxKf95zjQ9vdrME+6CCdQlgf0zrPRzTqg
Date: Wed, 14 May 2025 08:44:14 +0000
Message-ID: <CY5PR11MB6211DB2EB721F392610831779591A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
 <20250514080721.265515-3-soham.purkait@intel.com>
In-Reply-To: <20250514080721.265515-3-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS4PPF7551E6552:EE_
x-ms-office365-filtering-correlation-id: 8781408a-2f86-4073-17e5-08dd92c3816f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?L7/Zpa81uGgXiNn+OjY9Z5J6DjMjIUs5PyG1VvCe44TbBKNH+95NxlhYG/U5?=
 =?us-ascii?Q?lChEzEqjMiXdmY8nQgyrP4g0BnTCux6v2Y7wlVYPM4B6q+5p7motek22YshG?=
 =?us-ascii?Q?6qpHzecu1pfzXLRgJkROPk8Zx80HZUyPwCI6cu5lTIJygBAGMzal8J/CS8ZF?=
 =?us-ascii?Q?QwpEymb89psyTy97cVG8uXRJM6JlnyPnpZoqjIURddXSh2Sj40/9SNXm7GJX?=
 =?us-ascii?Q?3l0eOqs3T+RAAAijwli9kSEZwUxCWAuxjr/p5v6RMGakrTDmPMPOK4aT61Ew?=
 =?us-ascii?Q?bg/kkDfAJIfBow5ByB0IlpVeYK1bdkZztOfs9aYXhPyri4/vXBHQPSfirT5J?=
 =?us-ascii?Q?v1c02E5RAn/HnVUzny4AeSEstuypxDMWidFPO6F3OBwBVaus0gtnJ6Z42rMW?=
 =?us-ascii?Q?esuR6AONdygJB879ryu3xNQUUSC9qDP1Bl5bMc90AzQms3ndCoI7flTEpg/1?=
 =?us-ascii?Q?Zj4OzeLkTJz1Ks4L4WsYMrze5/VdnGhAxigA+W7AIeNqEbgkFI+GSpNe01Fw?=
 =?us-ascii?Q?VCvNh4UJyB/fEk44EwBtImaAjhnXFpnT63EapJtZdG5Jx6hQF9ZWHxuNLwLR?=
 =?us-ascii?Q?4KEPKA4Ji4gK7QwzVa8spgs3zuV+VQAAmDO4IMROYg28YrmBHL2wDj7/UdoO?=
 =?us-ascii?Q?Uny8q6Q37NwGXNdAIy9Pms5aow3oSrwd6PzHvKASomWN8dUlIRk8hQCA5LQb?=
 =?us-ascii?Q?8fbcsVYhl7V92795Por7CTv7pMr3P+oG3MLsDOs3JoiGeyAxUyff6sn92IqC?=
 =?us-ascii?Q?2A9Jsg99Y3o95QGsK7stWq0HoOwKcIc5QAdLBKJlHdBjmMz0ojdmyktVksZM?=
 =?us-ascii?Q?g6hDm7DlaHDks6Q6jeZASq7zJzLgjUdHkWVTDgxXQsDRCXfY4LQph6rQ3gpj?=
 =?us-ascii?Q?0btfcNeKUeystscIa/I+WjpRK6o13AWnv6/0ounaNqZKpo72QZgW3VFHiruP?=
 =?us-ascii?Q?GdtveHn4uI31w+loSvYEt0QXKy02B5BYKytSLSJ9N/IiD6vY3qdGh+xXzxyS?=
 =?us-ascii?Q?JA22ipI8VYn1xwLwlPTafAY79h2eUcLPV6mv3bzNTdnokJeg2Mv4/dO+oJvg?=
 =?us-ascii?Q?cS9l78A8/kz4928JqoMEEvlu5yiBiPATpCxIZuY4KUdgiiLMBQDVYFWDD/06?=
 =?us-ascii?Q?EJlH86vRJwLNbQkVj3LpvOE9ZB634DuXzYfsRa9sebd6wU72KdWd/u9+5B6s?=
 =?us-ascii?Q?u1F1/uGVn5Hr3m7La+dsH4qlkeb6FT9QqhyeYB0kafFhRNxK3eDmEOEAumme?=
 =?us-ascii?Q?OrWnRN9OXPeSR1QnUfXHfe/FFuQFqr7b59qPl1kpTE1pbN6WlSPlGoSVV8Pd?=
 =?us-ascii?Q?bUs8vnwpMKzgai+3yloS5hVoaqSZlOjFn9SoCjz2QzfeNh+x85y7RSdMYttM?=
 =?us-ascii?Q?aMg7S2VdCiVA18TlCrPRS8DZLxerV/5/0rnV3l1miC+8qC89yL+PjVdbtGPi?=
 =?us-ascii?Q?0VYWA3Pao1I1FsyWFYegK/wBMaYImmtZRAPgSmaCC/UWH+5I3o21TNMseQIU?=
 =?us-ascii?Q?hEt5ob+nclKBzaU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sovAkXZsRWu528NNtoYoJDV/vmkIRkwxOhMbE/7b1/jwWFmovVopOOd8AeMw?=
 =?us-ascii?Q?h6D4sAk1zLyKgETugQS5SKUJBLfGvreWCixBmfuHyfXjsI2u6dxW59awi7vK?=
 =?us-ascii?Q?kpz3v76jd5ZfReDJok+smoMphTVbRM8zDs8POyHa/pD6GIOI4MrYluzA2woE?=
 =?us-ascii?Q?/T5YeoQ/wQ7yKQ2Kgh8yO7vMkEc1z83g0WL9ZNxGxrn4PDPOF2l8OOafDb9T?=
 =?us-ascii?Q?cM6J1oSvPaO/13dvTfHHUdr31MbdckWeMz602JmuDx1p1Sj4f4cM2mcJdmsW?=
 =?us-ascii?Q?vgwmWLijsYZhV0PrRW01ls+cTEgwTZw3f5eATGECnqm6prGg/v6vfxT+WcJH?=
 =?us-ascii?Q?oLtSyAn3K8XMw/USTgzGJmbg4FRnP3h3o6jPZewn0VsNQtRsT1Dj7fDFY34T?=
 =?us-ascii?Q?mm8ick6ij6oGnBqDTs1ROkcgDAIMovwX/NojO6O4ak4toP+fio9jg2jtWs5/?=
 =?us-ascii?Q?XVVr5ZCaRCTt2SANHnSbULeVUiKqR+que/zXd4iyJUxrhxS33SjjcB4/jeXs?=
 =?us-ascii?Q?WxoPCtmPb21IsOMaxbHLtU0lRSutHPK2AZvXdzcb+t+WSKRohB9oO901XBdC?=
 =?us-ascii?Q?YcmX/cHw5GfxNN+ZdCRwbXVZ8L8U+EjiK2CKFP/WBOuZnaWByA+nsAY9S7Iw?=
 =?us-ascii?Q?khSFSb69waRP58BsaNL9YHeByufW5JYlyhl2wu52RDCy6FpLauFGeybjjzFJ?=
 =?us-ascii?Q?3O5N/fnqvpEgfOUCXyr0V29h6D8hDnqIzep4S1jk/FAsM/BDngKXy+cv5MCB?=
 =?us-ascii?Q?rK5PE4p+KJwtLb0uMGt2wZfKMJDDmEHzHM3IZaVQQz7+tSKv6JtpV13XIU2l?=
 =?us-ascii?Q?Tn/JGXe2aQN0Y8oO4K+YHm/Yj3DedOa0dMuZ56pEWGEfwNQR+enfRfZ9EX1c?=
 =?us-ascii?Q?PI0VgcmMqjtdWrxnz6CLRRnpIA8JwlvE/z4ulGjkaFLRKsllHtJLekgS4C61?=
 =?us-ascii?Q?tSfkoiFqG05UQhRYmnWKOlp2oLqYs7x3WmY200cwZQRdPm/F5L1OcBo0OEpx?=
 =?us-ascii?Q?sw0qdHvuEstgGpYjhAoEgKnWtUEQ42m7CoTuuei82/vmzdEOi4KlNlTHgZKP?=
 =?us-ascii?Q?O1olQfUuGyIkGNwF0BN+xMnHgoUFL3vcdIfssiumGS0/ZIhofn+jRTRrdTPX?=
 =?us-ascii?Q?V9qHs3xrG75VtNaTdzwLhiBHixNFGEDEfY6bZzwwrsaVWqe9bKYT4NyweMiF?=
 =?us-ascii?Q?b1Bq1reQWADRWcFpqwtKlrMZpbDmYOSPVJS6gHFAa1gO+YZRrCiBRDhcRrWk?=
 =?us-ascii?Q?5rN+Qe6NlbD4FSIFO7nrpoXW+HgCYvVah7J7jry6cI3txs5Nys5oMvBFsjbl?=
 =?us-ascii?Q?WC1orgVKXVnV/fMF45FOLx6b2ynZOLT32nVBVU7xevNdpdRf66QdLyeHux+G?=
 =?us-ascii?Q?3OiOUJxuY3eA35OGnMa2c+tLGCcsq+sGVdnJ6pEQwcdUIyyNbLaA7YmIgk4E?=
 =?us-ascii?Q?kAgV2HpKb/Kv87y9wWZU4ritKF+8l0QuCsddo81z3a7tfPK8qH4VcILFU5vD?=
 =?us-ascii?Q?yhaRHxCs53vIWttJGZXB7IFimbJo7YGpXoSq/LNMcD3x5EOKNqWo3FrZFppT?=
 =?us-ascii?Q?zj68UHlSJn6ksWruo4QU0ykFlMQNbtd+85CoxpIv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8781408a-2f86-4073-17e5-08dd92c3816f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 08:44:14.4152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wE2hvWZHNeM5qTsSxCadhsgYh3AbRlTDx0Nw7tUM2tMIKJPrTLCSn5V/WSrVrbV2dWtenAlNqFablxbXw5/eDR24dcZ69qmy3k6Rtpacjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7551E6552
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
> From: Purkait, Soham <soham.purkait@intel.com>
> Sent: Wednesday, May 14, 2025 1:37 PM
> To: intel-xe@lists.freedesktop.org; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Poosa, Karthik <karthik.poosa@intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Tauro, Riana <riana.tauro@intel.com>
> Subject: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
>=20
> Add a debugfs node named g8_residency in order to obtain the G8 residency
> counter value.
IMO better to expose all such residencies under a debugfs called dgfx_pkgc_=
residencies=20
CC @Vivi, Rodrigo for naming suggestion.=20
Context: This is similar to cpu PC8~PC10 residencies. i.e  /sys/kernel/debu=
g/pmc_core/package_cstate_show=20

Thanks,
Anshuman.
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 37
> +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_debugfs.h |  2 ++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c index d0503959a8ed..f9ab6a03af29
> 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>=20
>  #include <drm/drm_debugfs.h>
>=20
> +#include "regs/xe_pmt.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_vsec.h"
>=20
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -185,12 +188,43 @@ static ssize_t wedged_mode_set(struct file *f,
> const char __user *ubuf,
>  	return size;
>  }
>=20
> +static ssize_t g8_residency_show(struct file *f, char __user *ubuf,
> +				 size_t size, loff_t *pos)
> +{
> +	u64 reg_val;
> +	char buf[32];
> +	int len =3D 0;
> +	int ret =3D 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe =3D file_inode(f)->i_private;
> +	mmio =3D xe_root_tile_mmio(xe);
> +	ret =3D xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio,
> PUNIT_TELEMETRY_GUID),
> +				&reg_val,
> +				BMG_G8_RESIDENCY_OFFSET,
> +				sizeof(reg_val));
> +
> +	drm_warn(&xe->drm, "G8 Residency read from mbx 0x%016llx, ret
> %d\n",
> +		 reg_val, ret);
> +
> +	len =3D scnprintf(buf, sizeof(buf), "%llu\n", reg_val);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> +
>  static const struct file_operations wedged_mode_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.read =3D wedged_mode_show,
>  	.write =3D wedged_mode_set,
>  };
>=20
> +static const struct file_operations g8_residency_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D g8_residency_show,
> +};
> +
>  void xe_debugfs_register(struct xe_device *xe)  {
>  	struct ttm_device *bdev =3D &xe->ttm;
> @@ -211,6 +245,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("wedged_mode", 0600, root, xe,
>  			    &wedged_mode_fops);
>=20
> +	debugfs_create_file("g8_residency", 0444, root, xe,
> +			    &g8_residency_fops);
> +
>  	for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1;
> ++mem_type) {
>  		man =3D ttm_manager_type(bdev, mem_type);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h
> b/drivers/gpu/drm/xe/xe_debugfs.h index 17f4c2f1b5e4..86868a3cd379
> 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -8,6 +8,8 @@
>=20
>  struct xe_device;
>=20
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +
>  #ifdef CONFIG_DEBUG_FS
>  void xe_debugfs_register(struct xe_device *xe);  #else
> --
> 2.34.1

