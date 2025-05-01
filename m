Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8B7C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 21:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704510E895;
	Thu,  1 May 2025 21:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9m7vQhg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605ED10E895
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746135717; x=1777671717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F7oNcvJUNM+nn+9rMsvgUWC8b/qeWSiLbbEc51K/nsA=;
 b=k9m7vQhg2EMZREPQCEp+caRDZqiDiUNp3ZVsaoVyI5k7LOFxHE9oFS1a
 sN7j5lfYcJpUfLQxPfdF/sL5U5fQWL+qgDrdNQzVkEJD/Y2R0GOmeblBM
 gdxzov7phynmGK/Lrg++G8j7ycYLr4xVtOzZNQN38eDlDElcmi7TTUxHv
 /TRawZIWXjtNBM6asHpZuZ3b+V/z3q34j0SUe3dCmJnbtnyQ5L7+mKk/e
 Q8Em7ujQCyUGFX7Hb/AFzKLiun87jReWj7A5v4tYVLazt3kc8RUCFc/hq
 m4SdscQp/w2CpkLEfgRaS5tyOq0gA+rg2om3LcxXthqUGGowXulPO5uPX A==;
X-CSE-ConnectionGUID: 7ZmsJ07gSnm58IQKfpOQ5g==
X-CSE-MsgGUID: oZGZcIisQuqZuuX4fab/oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47958827"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47958827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 14:41:57 -0700
X-CSE-ConnectionGUID: iKzSqPMOQIaDkrmoq2xUvQ==
X-CSE-MsgGUID: 2H2v+zwxTPKSEFEHvqysYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="134795702"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 14:41:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 14:41:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 14:41:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 14:41:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS5xP5jeiS+NbWflfl4zbpM4m78dh05WjiJWtPzjX4GHvhI2Tov4+ZCPL1LHEc2qXHo/gpKSuize0l+zlNulK2OarBnrEFE49nIX8mZpfrTDFTPnbdv7kVxFnx0RxOvUNUnXSz3UVASX7HuCLXVYqhADMKbrH0WsTEte+lBNbm4UPSNm/fFe9hP8YNRMd2xnIosVAHPhRsVVd1DB07XQd+KWPUT/Rx/MC4Ma9KS7JErW8nVDNoyGCKQAvibKaYK0f8vIki7v1A6sboIOTg2JHVRtF4RLaiN/B5vrPU76hXvNGTy/+gkCjtLvs0+0wUGIx4oFS1Aqn7Z8A0y6XXPzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uo7XBeb880wiR6fOk3E15RQ8UAA1r/WtDpy54zb2fmQ=;
 b=XsjpbDF6Y2L1YBO35LR1u9X5sRxOU7k9Ux9RHvfxobRHnGo7BcQWzG9VIel6S5xrdsCpZrXDR+SzsMLhWoY1igJYM+ZJPMnaKj2y35YzoJPXMXaK8xfcXazTuTx2TesqxHsSS4Za6hVCfGPUjd6DWdDE67WVSfDpJ90+9h35tRYpwYPB4XcaWnu6cdcEoVjhnYfScWFAx27AwCii12c9nUCEouuVRUR2Ym3bnJs9mYmowYXKYVL5DPi73B1Vn0KPCCBs4g1ofw7MubKanY2cybW83eKBwWwm7IBPG4Y3yg5KKka3WvVkyiRHBI1tsgMK/5ubNBVk7FtqW6fpngUw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7099.namprd11.prod.outlook.com (2603:10b6:510:20e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 21:41:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 21:41:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Summers,
 Stuart" <stuart.summers@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Topic: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Index: AQHbur+fFE4YPnblHESd4ImP0PUaCrO+TS0w
Date: Thu, 1 May 2025 21:41:25 +0000
Message-ID: <CH0PR11MB544417F2D4FF01C4094025C3E5822@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250501173626.64481-1-stuart.summers@intel.com>
In-Reply-To: <20250501173626.64481-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7099:EE_
x-ms-office365-filtering-correlation-id: 7b3c4f4c-21a2-4572-5420-08dd88f8ec69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mGl8jeZ8zfP9a0OMt4VcTNDs4i1VIVbb5C8y3mN9F0M9uPv6xSDsqW4HVI0q?=
 =?us-ascii?Q?B+RMY2ozs5J+zKC0LlFSHxys8LreHi2II1ehh4574cGMrT7Pi2BoDaMr0r9a?=
 =?us-ascii?Q?HJw5Jurz89BFgm3ZXbKs9icgQyJwae10gyTRszVwMuKuC69QfAdzDNqS3QPe?=
 =?us-ascii?Q?GJCYu+HqlhU7UV1JUVV8wGCVhY4j0GC1PrBisYxLJoL7w/YxFymPl8zdmDQn?=
 =?us-ascii?Q?f507Rb+JWDES8rEXKSubvMK6LQXMBwvm3cvGCWhvJ95V2kdRhymcwcXHoj9I?=
 =?us-ascii?Q?UzsLlZpOGv0h6pExXKQdTZia/+FRZI01DE1vyucn9YtPR0RvZtRtz61wWgVq?=
 =?us-ascii?Q?ZV9vk4RRWw1kVLmpIxlSuHUyYsbbeR76EMsXXrF6npY54tSANopZ//zf0PrA?=
 =?us-ascii?Q?WCrs6K4Z5o+nbaRCFe7+foPJJcoixofnDfXGMI0OX9PljkPLdYNyOnKTFoAJ?=
 =?us-ascii?Q?S4hX4v5/bC5w3yjpdeOhPlDSXEshNk3GvTMk5fhuFZOm/VfJp/Xez/tcPxN+?=
 =?us-ascii?Q?wC4huoN/kXSISdbBqmDNhe2flu+IZw2Q95vnl7wjW/kUPysAs2u2Fl/mXa6r?=
 =?us-ascii?Q?eW5nSrV0ApfPBw3I8q+8/jxNEkd7OgkqJRWbiZwkeka7q7CKJKTcfuNY2TZ3?=
 =?us-ascii?Q?N6LcBDYEC8y0LS/SYvRVmrDYpLj2WlN8CDnCHhCYUplm3fwp3XxjBYsp+swQ?=
 =?us-ascii?Q?q1bIMoX1KE6rY4Ftb8h9bvE5vP+AoqgahiOtm5FmxlOiYDzskE3gw+cIdAjx?=
 =?us-ascii?Q?2f88qMQbSyzB95IAQHNX1PREEDAN4pvrpXA1HcNrMpowDYwopFZS7MFcf393?=
 =?us-ascii?Q?3DcGhCwiHS7ESlvGm2wD9e0H9P3suMPhM7IOeyLJ+74CVN5SHmpiMocaTQ3F?=
 =?us-ascii?Q?UjYnEFWMlsHtTnQrW4daFx7y+dKcl3vlG8mRRG6fIi29LFnQoRKL6KDzk4xl?=
 =?us-ascii?Q?AUgKRBqnxFFNqRRFCIUQbYHCFBTLDoHjhOc2BsYwPRnorynmfx8YdEo4ZVHU?=
 =?us-ascii?Q?ksa1DafMo2jUavtPq5QuGlZCoGjoCvIEQlkC7CJu92hZApqSd2C1ViNPYYTN?=
 =?us-ascii?Q?OsPLqU1hxq/BtRxixV/OZ9VyvEtgZceop8mkeHZvQtz/OhghZfLlkbUbGkRU?=
 =?us-ascii?Q?HYDdvYU2geKT1DhZdADcOQ4itgUH7l4LEKfVGKRwNufljP8qHamQkzgndIq7?=
 =?us-ascii?Q?je3uI2qFX2fiKstnWZroakm0zME5qTdT9WA2KyYmkqKM4sDKGPT1cbfFhA9B?=
 =?us-ascii?Q?3DaoeYVRt14QjqE7T3qZZ7JTCh0M/NSj6zInzK5772fkC3qjV4J2CcZziqDV?=
 =?us-ascii?Q?ZxvaMSqvTMweI9A1CpX0H0O1hNBnqEe0S3WRkqAGRSHDhywNpjFABEIDJyX0?=
 =?us-ascii?Q?EgLGLEqU07N48O7WBjnye5zUaw/RuyyFX9DJlAOua6B1fMjnHSHzlEC/TzQn?=
 =?us-ascii?Q?al+u+jWpgzV6Eoj82dg42gIrpEnYXnS3ZSaKKuoKX8lx1/vJrkgZrIrAvBSw?=
 =?us-ascii?Q?a8lB15eL5ECqeE0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MZRaGgpKnlRkuT9/dd7TU0+hwKHFxah9FT+b54EE2GVXphAL/Kwl8/6Nti/z?=
 =?us-ascii?Q?KKrMeCzpB+m/CWjjnGRmKEmTv8vxGJgSecl6hJMH/7lMM1ZVpkbYQdCM5nuM?=
 =?us-ascii?Q?u2B3tcjyIFOdmecgXHgoY/W5kyFRa/2yjIdpDEJ+anCYp2tUQKN2BZLxv81W?=
 =?us-ascii?Q?vbmi7PpzjN/ths5nJKre4snliVr5VxlDd1Ym83CwSvYt8hdCneUinchC83iV?=
 =?us-ascii?Q?2sq6wmv0aQSeE3jRd2fYKt7HPdIQGv0cWiAwbpHdIDa8CG2AvWvUtrnd1ONI?=
 =?us-ascii?Q?v/ttZSp6LHPo6JwaYyo+c9XPFQ8T0BXm6KBNP1yYrrzZIq/p1M3qaka0bCon?=
 =?us-ascii?Q?m4pp9RCj6Oiwipz2UrYiB9x1GBJoc+kC08CK/Nu/nKIHE7ow4+U98vgNL/YJ?=
 =?us-ascii?Q?92VsQtdxWUKAilATl0vveB9AW47pSPEuZwtl3pLyoqMST6qp0bDnYMSo+kX+?=
 =?us-ascii?Q?6F10PhmSfPFbFczcjTKiZs3THehW9yWDJWdMuQMPY6aKjf8KtDkJ0K7NXYcs?=
 =?us-ascii?Q?USd46lGtWYdskyKjrKJaknP4DrydwPYfRNe5SXaTSdsws8m1djrU9I+/8+3e?=
 =?us-ascii?Q?0/iaAhVz2yHmRKsxWP0u4OB2ZMx0oi1DkTHsY/0RZe0FexFBt3qX/CV9piGI?=
 =?us-ascii?Q?qPwukvywVkull4Dxa4xGc6d3SdoPQ+hxh6Xwxl2oFTUIi3OSL2WCBXDqPgcf?=
 =?us-ascii?Q?QYeSp+jNZsEzkRE4zwlAn0enlg6hezKIOekx5ei3cXLmqRIvrgo02C9PMNJM?=
 =?us-ascii?Q?TkYKrapG8XTqy1sPrYkcwowIayYifk3qw44DJuTRVc3ztJzGaYX3DudTO+nN?=
 =?us-ascii?Q?dUz/Xs7jwlKVheyVuDDt/SYSBfcqbzJP7R+cDKPtGsEM832GV/EUa4pUebHC?=
 =?us-ascii?Q?L/cu2FJcRssA2B4GBXxJBq6clMiMvd0DkViBMmxwegr8uAYZkwJ5z8UftegI?=
 =?us-ascii?Q?tp9i9gFAVrMj6ZWT5fnrYWuF4wGV98YMQsVRYOWy3RZwwnf9X7cDxan6o8Jw?=
 =?us-ascii?Q?88KIyuRzXGmylr06/PW82pwhpCXFbhX399Xsd+SzVXbnqwwqzJHG3LWlNUJQ?=
 =?us-ascii?Q?MxmNEDU6y8KeMWDbbGIAh7m77tWJmQ/nCNeGAOP+KlKCEPAaVMLTXLGhcrH6?=
 =?us-ascii?Q?zC3/6f+tW0dy/QgNPM7kFsQ8GGvCpeQUEMwsPJP3OCKFg8ZUbsZPzBWz4B19?=
 =?us-ascii?Q?ycUrSOhA/4xoLDr7yB/tc0zQ33UwJUwi14yMggF8QQkUmXOSWn0r7AAoE2yD?=
 =?us-ascii?Q?6ylHEexFFCsl0eEX8cNzMBqBXGhehZGLURzd7vwcx85WcKySnikNa1qPMo7Q?=
 =?us-ascii?Q?bH59CSuO8gcmhslUaDAT2+3xIJc4PZH2efNYJSl8Uw0anncekC44jXozBAfT?=
 =?us-ascii?Q?tqWSpVBCZjaNIqk6P1/uS2aoXmrdx1GkeaOwiEWhhPQHfj8oOPTNAccO5O9q?=
 =?us-ascii?Q?Xl6pW4fghGWkyMfGE3Xz6kYaC2V4Ylcl05T8y26zXvr3HisVX+YRuj+Ur+eQ?=
 =?us-ascii?Q?pfJZUGvRnIsf6cDCdZmh/jwyW+JDOdXvh3GLiTqPg8eIs2skNB2TFZF/2XbP?=
 =?us-ascii?Q?p+ONB8HTRRSfQDYRCJq//BSop5Utoby9wjFXYJEL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3c4f4c-21a2-4572-5420-08dd88f8ec69
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 21:41:25.5879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGcuW4acdLcBPZjh84H/MO5HoBNupr8OKEPIsXZG2tox3EoWBBoFiw+FIYAhgMHSoe0ST2NTshZ3D1UB1Vgvk/Ya4QIQnw6nZwrnmPVXSyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7099
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Stuart=
 Summers
Sent: Thursday, May 1, 2025 10:36 AM
Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; intel=
-xe@lists.freedesktop.org; Summers, Stuart <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Add ASID to range invalidation feature flag
>=20
> Make it explicit that the ASID is used to identify a VM
> when issuing a ranged-based TLB invalidation.
>=20
> /s/has_range_tlb_invalidation/has_range_tlb_invalidation_asid/
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c                 | 6 +++---
>  drivers/gpu/drm/xe/xe_pci_types.h           | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 06c65dace026..3e49b88a8a62 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -327,8 +327,8 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
> -		/** @info.has_range_tlb_invalidation: Has range based TLB invalidation=
s */
> -		u8 has_range_tlb_invalidation:1;
> +		/** @info.has_range_tlb_invalidation_asid: Has range based TLB invalid=
ations */
> +		u8 has_range_tlb_invalidation_asid:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
>  		/** @info.has_usm: Device has unified shared memory support */
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/dr=
m/xe/xe_gt_tlb_invalidation.c
> index 084cbdeba8ea..c68f7cc8e175 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -366,7 +366,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> =20
>  	action[len++] =3D XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] =3D 0; /* seqno, replaced in send_tlb_invalidation */
> -	if (!xe->info.has_range_tlb_invalidation ||
> +	if (!xe->info.has_range_tlb_invalidation_asid ||
>  	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
>  		action[len++] =3D MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a4caa6222b6f..cfafcfcbbbc6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -91,7 +91,7 @@ static const struct xe_graphics_desc graphics_xelp =3D =
{
>  };
> =20
>  #define XE_HP_FEATURES \
> -	.has_range_tlb_invalidation =3D true, \
> +	.has_range_tlb_invalidation_asid =3D true, \
>  	.va_bits =3D 48, \
>  	.vm_max_level =3D 3
> =20
> @@ -140,7 +140,7 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>  	.has_atomic_enable_pte_bit =3D 1, \
>  	.has_flat_ccs =3D 1, \
>  	.has_indirect_ring_state =3D 1, \
> -	.has_range_tlb_invalidation =3D 1, \
> +	.has_range_tlb_invalidation_asid =3D 1, \
>  	.has_usm =3D 1, \
>  	.va_bits =3D 48, \
>  	.vm_max_level =3D 4, \
> @@ -680,7 +680,7 @@ static int xe_info_init(struct xe_device *xe,
>  	/* Runtime detection may change this later */
>  	xe->info.has_flat_ccs =3D graphics_desc->has_flat_ccs;
> =20
> -	xe->info.has_range_tlb_invalidation =3D graphics_desc->has_range_tlb_in=
validation;
> +	xe->info.has_range_tlb_invalidation_asid =3D graphics_desc->has_range_t=
lb_invalidation_asid;

LGTM, though I'm a little worried this line might exceed the soft 100 chara=
cter per line limit.
An initial inspection seems to indicate it doesn't, but it's quite close (a=
round 95 characters).

This doesn't mandate a change: it's a minor concern in the grand scheme of =
things.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	xe->info.has_usm =3D graphics_desc->has_usm;
> =20
>  	for_each_remote_tile(tile, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pc=
i_types.h
> index e9b9bbc138d3..3d1c745de2ac 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -19,7 +19,7 @@ struct xe_graphics_desc {
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_indirect_ring_state:1;
> -	u8 has_range_tlb_invalidation:1;
> +	u8 has_range_tlb_invalidation_asid:1;
>  	u8 has_usm:1;
>  };
> =20
> --=20
> 2.34.1
>=20
>=20
