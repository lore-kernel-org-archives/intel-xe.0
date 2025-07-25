Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B920C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 19:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D792210EA09;
	Fri, 25 Jul 2025 19:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6O1YV3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832F10EA09
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753471796; x=1785007796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0GUUGdXE6Qq74wvX26NtHR3ZO+d+Fo+MaCcjcc0o3YA=;
 b=O6O1YV3TdZD6SKfuiucVnbh9w1kiEzzAWgvETIJ36c33eAjcKB/IoAde
 CIak+ORAk1ZONiHwxUGsNM5oPUpT4rn1TyqprDfL8iciKHHzoiMQrwtqi
 xVEEUn0KmR/LQO/p+kjYgpz88kzlSyoGPGfW6AxvCR4R3sy469o9HUCaJ
 3DNBy4xYBhVS9OjsiJvemNCEtOUYzDJG1xLNPsR+d6U6eavNKqwoLyNxB
 CH8+T9NNf07r4/PmHsd6Iq2YjvKBMdpQSWbNsVWCk5140JwkOTNL37Sld
 QwBsY+vCAp6Z4hJSeatnRGqX8RGF39Jq8jrLPG/+31xSJCa4aPMVFBwTW w==;
X-CSE-ConnectionGUID: J/aYQLfjT/2bqccEiH0lEA==
X-CSE-MsgGUID: wKTs1a9FSF+NWO6/cQHILw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55692186"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55692186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 12:29:55 -0700
X-CSE-ConnectionGUID: wmO40q1nTAS/bRiYA09IGw==
X-CSE-MsgGUID: X6TjP6s9Q6qq8KzrcrBwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160703093"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 12:29:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 12:29:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 12:29:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 12:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxD+i9zKkr3+F+skFKtURv5cQVVLFPn4p+CykX/PudfkBP9j8mHWVamUEdPuFKO4HU6V4XOOhhq11MQ+v02lmsUS7GjQqAgNRru/4PqYMcXuzTgOgbHPpy554pM+lE3/87vRVP+lg5ri7CAYEpl1kSTqMKDSO38UyjzSUdGJXAsJk72d3r9Xx2exUecgPwIJqeEENYipMktvWEOgMoQbMSIw0g750/wY2uXX4Dg5NaSDy5qwpIeCO+QTpTo7SMgIkQKghWg/OcAphVrehcGrx/tzjwfcB5D4cEjlhcDHlRF6ESOiHcuG1mC7HNge4bH5bKBa+JDvJLtItdUCmBA7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRkRu5ooiOWEusfaTvE45HrXOW61ZLoWQHr81TPjzsA=;
 b=SG+V0bpoxc3MLRdyci8y3gQRBTaLo+BRN3zgY6NsM+ud3Th5BnjjfwRa/dhWRKA1OsHxYP/s6mLEys4dDcdhPUKeAafD3wV6D7/POfg0yr5BoYT2iWHJAn2SXQnll9KXmfeZcQTABafxS7xR8bdPE4yP+Mfb0dzhzfF8SGcsm2dGMNSAHO0D/xNJkLvDlRrxprwkNA9XdEXHq9mfmYjjMONAZ+vQ3d3W4b8XqtbBe3XG2Il/E5N6j+jO1CHD1i6/L2pVxGu8NqTAiGtN1vxHUEQlcIZ+96su+7gODEYRATTAELopgXozOjUgaXD+8J1KGsElvqjzDbNUM8nsE98tOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 19:29:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 19:29:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Add more GuC load error status codes
Thread-Topic: [PATCH] drm/xe/guc: Add more GuC load error status codes
Thread-Index: AQHb/Zf521fSwdaOdEarnSsyBLHs2bRDNjHQ
Date: Fri, 25 Jul 2025 19:29:38 +0000
Message-ID: <CH0PR11MB544413A7C4A3FD8724D2E748E559A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250725191132.4008357-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250725191132.4008357-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB6868:EE_
x-ms-office365-filtering-correlation-id: 2c1a3eff-3b10-44cd-c9a9-08ddcbb1984b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LPM6mrTBulrZenbUKfsgCj4o9djX2zqoCRKr8Z7EvxaNC1dzDS5ScqET4LF/?=
 =?us-ascii?Q?aBm98j0AXM4Oj0uFjWc+z/JPiz2tOKDoBUksNoIIzfmJ7P6qeoL4lAHPCKwE?=
 =?us-ascii?Q?cZHLRGA5QxTKZmpa4gGJ418Odjxxs3nWSJYb/+eZNNg2vMLHGZ96SvzWejYy?=
 =?us-ascii?Q?+fLtgVRagIswNRDuhHzFA/4etozDD7Ab5unZHEpTsevlsLVVGfYjl8W0ijPv?=
 =?us-ascii?Q?EeWnSphiSb84S5+S1TPTE7NHidhlCG3mjSgXsRzk8MpkB/qmOKOHayw/PhQ9?=
 =?us-ascii?Q?2op/XP9ZyxdJGpr5I5dc0+b9AOHTEYyWKSLS9uYJ/pzNgS+fefM3tnCvilOk?=
 =?us-ascii?Q?7nu9iqcHYeMAW1+yZSRkYWNJRuMni4dB0WljbXL3oeg8WdGrY3Ji3/xgQ60X?=
 =?us-ascii?Q?VM6UKpmQBd5AJm4iecxaiqbf9IUphm0XGP18dpI6lsXBSCy8c8/NPnxulFtK?=
 =?us-ascii?Q?WyHi6cxv/j/5Z4q/Pd0SVeebKiVzjWPPJpgG1b7I63kn5FmEqS1W28RwO2+p?=
 =?us-ascii?Q?EpfKoOYSh9N9Gvlxd9DkNW9Dq2uQLFkJhaNJhM68MHl2WliLjjeJGrXc//66?=
 =?us-ascii?Q?gGhhq2WXtptSQQbeS4u5Hr6OfL+wSQGC90LCuvkIFN7JzIxOQ4GARdIdb5CM?=
 =?us-ascii?Q?nCI5LCfonhPPblkDQzjn4aQIiLYQrfpnMlemZLyhZJL/k6rYj24+8ClUqm5W?=
 =?us-ascii?Q?4WHBnbbYb3w7hrgvPZDhEaimrhcbv3aPahpX50aYthnOZPw4lAKbIn9tSDNs?=
 =?us-ascii?Q?jGgjGylD4AJ/BsWYNlMEdmVTDCED90wKtdXiPiPB98v6YVhE7z8uJYqEUuh/?=
 =?us-ascii?Q?ojQTARWOhA9d68ZkDCnnObDykw+TxyqiP9/jvmbJcSbjAS0qSbIrj4Xmpv08?=
 =?us-ascii?Q?Z8vWCMQC8GzOPj/tnQh1/SfSlvLuPKhNW2v6iVyYHadEdEmin6lng/cOCptK?=
 =?us-ascii?Q?EBMa2HAA3tuxQGbKTlLS+itKp6EITn/S/rt5j5CFAz6tzp+vdOR5o3W+0Kj4?=
 =?us-ascii?Q?yPH1NynTKAWHjCFwG9TP+Lt97kLqWzEfaNXW711osAveluouuXoX2MDQWEt8?=
 =?us-ascii?Q?E7fAE9RHwPY8rcq6Nd/XE0eLfHLNFulJWTf9cByrHdn3amklVlsfM5WVkKMK?=
 =?us-ascii?Q?VRdXtV6/kqtjhPL1OlLvKHWwYNegyf/Te72LsCZp90AdyF3krEwqi74RvOwC?=
 =?us-ascii?Q?YaMK7AzSLuO0uk6RNWlv4Qg7eMAv+CXDGZWOFxFBGxqEbpXmnRv68nPl26+4?=
 =?us-ascii?Q?GhcnI4rJj+YXZBCuLEt8MQYkRDZRwqFpEw/iwky09hFTh63uqMNGLWxuJ4qW?=
 =?us-ascii?Q?KuQyekjFNLcyyOViUcbkFhGSYvx1/FepzXbbzsoCD/LxZ4Z3hEgbbhwymZkc?=
 =?us-ascii?Q?j1Ufp2W8vZSNnar6TPYZEr8QxDnsb1UCpn/JuEz6HI/zc51j+UQJ0YdMlCKf?=
 =?us-ascii?Q?8xywDc5gGDYXya7XKH1BHN2cJgvgsB1ePWEKjn+0F57f96laLvv/gQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JyX9TRE4QYhhs9ysG7zYt7O/b0vUl8FCQDpK4NfpHwE9Ua27HIRTvhw6WbX5?=
 =?us-ascii?Q?WZ26YXNiE7DIpwAx/PGTj78UTshDi+tpm2by91aqg/ZmZ6v4hIesFNl9rEsi?=
 =?us-ascii?Q?sWyj29Lp4ELQj+fMKLIodTbH4lSgiAY0LFzQ3y4nkQDK0v91dGq/NNxB6REJ?=
 =?us-ascii?Q?MPCuBa4YiBSj0tBIgei1CJr4MUFEvITmsISx0d/oeGRsnwBX0TntCR7G5/wQ?=
 =?us-ascii?Q?Nh1oInke7pRvhjpAun+hDSYWyBaGg6FRa751R1ylt4OI838Q1qdkiPG0hBPi?=
 =?us-ascii?Q?d36gVDVeJCDwLIuAq3qWuKO1SmJZyEmcZB4H20fWQlRuFrBqPuK/K5ags/VL?=
 =?us-ascii?Q?BsJ2GA/k7Y94jxsxb/Yt+kJCFVPPvug876zuhemoLLZQCYZCMQx/OLxS8jZP?=
 =?us-ascii?Q?eYoqqE8xsc7GghiKSYoWZqwOn1kMFHXuMUHLpM8JEEdvKx0StJaUE/3/l1Bh?=
 =?us-ascii?Q?WB0AR1CIoByD43w7XgXIMVWYHUiV5BbNdLiiWUAyqLBExHbdOqBhnK7lXmFp?=
 =?us-ascii?Q?Rj9M2GEiLYZ1EhAgyrwTbpCglPa+k0XJLgTj2jY1f9Bygoxo7j9DAhWfSmWG?=
 =?us-ascii?Q?HD4aBPlULpJ+uHmNNX0zSF7ByRuORXn39lGOCFF38XsvwPsSNXqlUJrob4M9?=
 =?us-ascii?Q?TwDnMW+oJQXsA90yJHrww/eii11CAfnkJYtawGYXLrfNFzr27USMb0OWPYI6?=
 =?us-ascii?Q?h89SpaKbAzDlCNEcOeXR0TY9utxznMn84IJ5xvNu8PhzTUw3Ficu47e4WjoL?=
 =?us-ascii?Q?OQtOjeq1zcAGSnkhPClg6FEy5qcfLt5UJj77WybB4h+zibQYkG4PtB8p1Kc5?=
 =?us-ascii?Q?0x6Uuwvlf1ATum207Cgy//t/kbv5BMUE5UYKJgTQXHEG7x3fnijWUbxyNluL?=
 =?us-ascii?Q?7+2LSAQGc8FEJklkQ87wEhs/Vrc/zBXyCb2ZPG0LYhGRqn+enkDLhH04JP1S?=
 =?us-ascii?Q?8bolN3KL0n+azIbX7qE5O0pwO52UfafanjGXl5kfXrDl44vJkG7qaGtJZko4?=
 =?us-ascii?Q?Ll/DVV0rWx4CVOSsQ0pjHMfnKUkzylowveHqNeKZr7S682EczYXFbFNZKbtj?=
 =?us-ascii?Q?Oyy1n0s6MU+bCbislt19EL6eI6Ncu+Y72rbhjSYIGjA5SBgANbOk1B5+Ysro?=
 =?us-ascii?Q?TmCnf2ZDP/Lty0mc1dSjon9DHYsfMtwZVtTf8vx7ikGndB5a0W7nZloRb5CJ?=
 =?us-ascii?Q?aHAfnWoTbdE2UoK+G6e1uhdagvATnKiH9WKLuKYb0XgWqyr38nnJNq0a9pGB?=
 =?us-ascii?Q?u8MpJ7C7L+Xd3K/kQxe+Qo7IxlU4IwVm3q/tcPyCBgi5ih6Tpc4TnahwJHLD?=
 =?us-ascii?Q?qdzBxBldanwsElXGiU3ax9eMgeXmf0MmsWrzJ95pvVijCjJQk5k6f4y9ajRQ?=
 =?us-ascii?Q?w9MhBb1iZaypQpEWy7p9hNDIOF4F8T8alTH4FMrCQ7HTm2vWbQHlCYO4+uhL?=
 =?us-ascii?Q?fH23HFrGuznb3dMFOeqvwfa8kMswPjGhcc/a8aSBSs2c3zYq0ybyxkDqgSi3?=
 =?us-ascii?Q?bjN9dv8GpqwMgf6hSH49PN6yNL186m1P+/Z7Qwdpx9b9yK3U/Jn1DTt8jBLa?=
 =?us-ascii?Q?7j/mcmBlld4aztDKXzLy5Rjv6XufgWhgr82EG6xK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1a3eff-3b10-44cd-c9a9-08ddcbb1984b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 19:29:38.0716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONqw4iNUzP94tw3Hzg5xBt5QXz6Vy2zlH3SYCevcFgfPKYeoGqHWvTP8VAS0jlmA7K9zpi7dd0UBgRxCu0R54E4kpX6W+LtjXcw3nBq8fnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C=
.Harrison@Intel.com
Sent: Friday, July 25, 2025 12:12 PM
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH] drm/xe/guc: Add more GuC load error status codes
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> The GuC load process will abort if certain status codes (which are
> indicative of a fatal error) are reported. Otherwise, it keeps waiting
> until the 'success' code is returned. New error codes have been added
> in recent GuC releases, so add support for aborting on those as well.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_errors_abi.h |  3 +++
>  drivers/gpu/drm/xe/xe_guc.c             | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe=
/abi/guc_errors_abi.h
> index ecf748fd87df..ad76b4baf42e 100644
> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> @@ -63,6 +63,7 @@ enum xe_guc_load_status {
>  	XE_GUC_LOAD_STATUS_HWCONFIG_START                   =3D 0x05,
>  	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    =3D 0x06,
>  	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   =3D 0x07,
> +	XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH         =3D 0x08,
>  	XE_GUC_LOAD_STATUS_GDT_DONE                         =3D 0x10,
>  	XE_GUC_LOAD_STATUS_IDT_DONE                         =3D 0x20,
>  	XE_GUC_LOAD_STATUS_LAPIC_DONE                       =3D 0x30,
> @@ -75,6 +76,8 @@ enum xe_guc_load_status {
>  	XE_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
>  	XE_GUC_LOAD_STATUS_MPU_DATA_INVALID                 =3D 0x73,
>  	XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   =3D 0x74,
> +	XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        =3D 0x75,
> +	XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG                 =3D 0x76,
>  	XE_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
> =20
>  	XE_GUC_LOAD_STATUS_READY                            =3D 0xF0,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1ca7f4f27e26..315ef74bb5ff 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -992,11 +992,14 @@ static int guc_load_done(u32 status)
>  	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>  	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
> +	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
>  	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>  	case XE_GUC_LOAD_STATUS_EXCEPTION:
>  	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
>  		return -1;
>  	}
> =20
> @@ -1146,6 +1149,14 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
>  			break;
> =20
> +		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +			xe_gt_err(gt, "illegal workaround KLV data\n");
> +			break;
> +
> +		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> +			xe_gt_err(gt, "illegal feature flag specified\n");
> +			break;
> +

Given that XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR and
XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG are indexed after
XE_GUC_LOAD_STATUS_HWCONFIG_START in the xe_guc_load_status enum list,
they should also probably be placed after XE_GUC_LOAD_STATUS_HWCONFIG_START
in this case switch branch, but I'm not going to block on it because the or=
dering
probably isn't that important.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>  			xe_gt_err(gt, "still extracting hwconfig table.\n");
>  			break;
> --=20
> 2.49.0
>=20
>=20
