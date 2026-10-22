Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55088606A328
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBna7UI9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E283112808;
	Thu, 22 Oct 2026 16:29:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795301127AC;
 Thu, 22 Oct 2026 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792686593; x=1824222593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pqNvtzJ7VSjpj2g0TpirKwad0EYgwlg/cY3o5p7y98k=;
 b=PBna7UI9b4rHE67sRiexCao4+SaiR7M+jHylRGqSjyJHfX1lfyaN9Dbf
 5bJQJJRxB7YpIkTm73HQwQ0Wvy1N/sx06AVNTXPjERKBrH5Glvqb7vhG6
 trdJ5PbEauTn59MIy1gV8KPYwuAVbqYfPWdXF5iLtDDCsO6lIA6FvXC0k
 cs7mcramYwd08Dq4mGiRS0gnSdxuzmnemJof7yvUZHmbX2aocB1FTjC+K
 tZP5jNCG5zQz/THH7ryuxJClg0z61CEsizALaTFBOAk1d+SSt4BquHXTC
 Ufhu6SGXQEW0WXuSR63FwUSil09bl5Iwkaqa2DTtL4cXd5xSXnFtS/ZWl Q==;
X-CSE-ConnectionGUID: Cl8t42L4RR6XN4t03RoJqw==
X-CSE-MsgGUID: mlPdFY6VRyOv5dh55PTvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1448959"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1448959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:29:52 -0700
X-CSE-ConnectionGUID: HyBmIq0GQwWayHvylRPMGQ==
X-CSE-MsgGUID: 77we9yjKRhK/JMu+NpHUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3749725"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:29:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:29:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:29:35 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uM80HPoRAPs40s1ZqBfFLJ7saeHi3wRe5rcrY8qP3/DSm6/EcLK9F0o1Rn50XBNyYJJgtYsA1tMs3nSgEmsqIF91vYQcpWJh+W+vLHEULFkQYQIoOsQiGGvxCVbDck2Bal7CzKu/e2XsEUP+bG5TRvozu3wl2OUtn432LZa/Jya11RSsEujODEPd0Qb6YZ1EDNV4Ks86kdQfdiYfzs2cBBKe4fXrC657r1UWkj1Cnv4bEQf7CkD+XXB1BDmbIVuN895xUzpCbFaGut6j+rNsuU5teHDFyST+xk93OWoTWVTQibLSZGPkrGu9313Qmmu8NPjopE6Xgwbcu6Cl09AZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5UpomW4hxCO6DRPUvsypB6tYSLBV5BlbcQ1xopapUA=;
 b=fDFOY6DiFDHu4CKiSpoczRDr7FMC5W5LRTeVhoWOg0q8sCpx98vz8Q8fn6u28ETqD3ueP0FQyWNIMV0X+Gq/lO2Zy8FZoZbE/tqhV0FAbQqNnATA5Fppo1AebEoPKQFRUNq3M1lk9Igl63IknFcXf/tpICmgkD6S0aYZGAfF0ao/9wsXLq9iI8Sv4KKj9L1ahIQGsxk/IjM8SdSESM7FBcUzehgI9oDEQQQiFkjayLofhW0TJ2OM8WvZBoKROGN8GjS9STLeQOsQxZ7LYWU6K0vH0ntnT6xjXSzavWkVOsaCawGTDgIB8ak66orQVSdsyu0yqz7HdBldobaoSOMGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:29:33 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 16:29:33 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 02/13] drm/i915/dp: Limit M/N ratio for DP
Thread-Topic: [PATCH v7 02/13] drm/i915/dp: Limit M/N ratio for DP
Thread-Index: AQHdYdSp95aJyAQpu0O8kjKsiDE8HbcJwTPA
Date: Thu, 22 Oct 2026 16:29:33 +0000
Message-ID: <BYAPR11MB3783213C73FA5E3E5974EF07B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-3-suraj.kandpal@intel.com>
In-Reply-To: <20261022032247.1378809-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|CO1PR11MB4866:EE_
x-ms-office365-filtering-correlation-id: 3018aa85-a899-437f-e653-08df3059a7a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|23010399003|11063799006|38070700021|4143699003|260925022911599003|260925021911599003|260925021311599003|22082099003|18002099003|6133799003|10067099003|56012099006|261021121427099003|261021123027099003|261021135927099003|261009223027099003|3023799007;
x-microsoft-antispam-message-info: 8j1nQwqqNFgRSAIEaxgcAhqzDz9IbpIP1qYck1fCe5LhMg0hRR/3Dd++yjqAMp8h12bNMhqx4XtTqI1ZaMzk7ws7hIQQMdoQBAW9jf0j3dpIyL5yDbVQULHVBRScsuyz/BtpRYbdr5OYj50I3i6IMUHixRgN690BfnAmBAopyXibiW3SijTHMwuvvG4La0agkkOjGO34QVzD5HlcI1vniJLl+0V853iCc3YMFQOoadwkUfRYIDKzY43vpw+5Ja2Y9FSfbptl3TzfuaRhAe5jjf6TRQEw6XQEbEmx31q2PTAkt0+pJSdhzDGnhgoN3sQGZSoRWYw+RisARA8cfcccMP+vJVjts62gmojUCxyOlyEhAleJBFv3ew4SYhRE9BitJ3P3LRmQrtc9Zs7r2zYS3f5ow4RbBKoMPZIcvL9hc0CyYGVsAhChqIcGKE3qV3Fc7oEET1T2lZCYiIzrtzkjbAiwah23TBvN7zXlsmPst4rsynSJt+olp6/ewei1x7/lxPEIs4Qvotke6lZbKoAHgcExgE/gV0lSphJn0C+S9nVKVOa00CV9A8PAkmNuFTUJ3TKZaHHmy6F+xpC6JD5LJDUJ5IF6CJZkrSa96jFrKMomD2n/s4WpeiCMwQsy9jZBLoCRs3TiWSdsmd/3sc5C6Qd42904W3VOeHbLHWBboYlVzyiwUwYM04PI4Yo6ah7AShDN7zMi/wQt6Sg9FU3y7FNK6jkql9cGyQ91G9hdJEc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(11063799006)(38070700021)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(261021121427099003)(261021123027099003)(261021135927099003)(261009223027099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oao5D6dFfXUCrFlw3x8V0SODkS7/rFHVw2f+Bn8wL/fe3KN5mRTToY849zhL?=
 =?us-ascii?Q?QL5lpjgF7MmzSsXvPPZatjec30rLkfXZW3COEsDaSBkncYcLmQj8d3u1UuSQ?=
 =?us-ascii?Q?WCz5PG1Be8rpnizVQl2JnBQz7FvDQPwzc+8OPx15Nk1hJH9HF2u6yAZJrqEB?=
 =?us-ascii?Q?tLUQETm83vvkR/zs8d0vxHnNZiTuTAWIPE5WdzK2+dz0GWMk4QN1yMsfcriN?=
 =?us-ascii?Q?KCy2xikH4R37XrxrJMPLyCtk3IQQWTn1YtK7a41W5He5g/GKFK/3Ovxqh9v2?=
 =?us-ascii?Q?7BPoHmJvKseyIrxi39cf+iwVWWW7vcduOgU2OdUlNVU5nnbgojgtBsIF2dL1?=
 =?us-ascii?Q?IXroYSBk68UB8H58Mon/1w5aPyVRgRS+5PnjrkuQJjHiojrQdcqsGWnv9Pkb?=
 =?us-ascii?Q?ixJOOesgIc7AOBrKV0vMGj0PUNBtVAbHqXnVco2QN1o6vwqi7+K75BU6bQfE?=
 =?us-ascii?Q?1xvQVPVn4XDoqvXhcF8czRNvU90CUhj/+pgFKo3ggrPFbjsTO80cLKFX8fTK?=
 =?us-ascii?Q?eSJLstn6qw3jz8ZNeLv+MLrnozKdh+F5z34LM5qsyqZ7uTM6Mfq/3jViL+Ml?=
 =?us-ascii?Q?HMby0cFlLWlYRu+WWlcNMUfF8fd9K33CECRibq+y8NurBTLQR8MScrsJC1JP?=
 =?us-ascii?Q?X4UYGhxglp4wm0kcVB8uVF4cmeslmKb4GcbHnSt7UR5QoRY+73+kBf1G+48u?=
 =?us-ascii?Q?n/e/2FGcFhi+WfNV5yjvkgnsjiD/+3CWKMnzBaYTaSlJerGro5p+4loEg2/4?=
 =?us-ascii?Q?0urJPtEnh0Po8HuH7GpbFQZ5rzcBtNuW15E5ptwXyEW6W5O1pGZ/cIxMlUFT?=
 =?us-ascii?Q?9PlJbKq9IpiuI7kXRuhW24ORi5t7BT7Jl+o++F7GZdibTosvbyEhN79SzPB5?=
 =?us-ascii?Q?Cr0VWaUvun9bG2C7NWk7ax377UXaJnZAaQoVeFs3BVvyUm0+ocH/F15Ue1CR?=
 =?us-ascii?Q?7TAKRFHeP9sIZg2hrzxrw4gfE00AGGMfARePJw+QZybJI5kHODNcuE6wGDbm?=
 =?us-ascii?Q?qYmDEmgqazLqMYSNpazipwLNmdPPdX928cknHArRVxeRYo0TKNACD13Yit39?=
 =?us-ascii?Q?myIQ54M8QPE0yvEnUPGTOCpJTP4FGNL23n/r9/l/oVqxSnY/dAxtM7E+/aQk?=
 =?us-ascii?Q?nsakpwXpjxFtwuJmxk+1M36+UV6E+e7NFJZty3dU2uNt/gZcxVREVrqIsOkz?=
 =?us-ascii?Q?BTam2RSv7ZDjlTjRGwXjTKzsFfueJoDVFplhMB+9cd7qJUoP1ZqVKKBluJXu?=
 =?us-ascii?Q?KEfoFaSB0ckAouiwndMAU/1cxCEgmoAr3/tAQkXyUOchtQlIK34CnfE0RDe+?=
 =?us-ascii?Q?HriEdJLul0sJX6QRgDcmwO9Gpe0RAXMvQyqYfMP1EOoTL53eZF6Qev/FJT6L?=
 =?us-ascii?Q?uK0BiX7fnuqMVJ2Qbu6qF6znSQ4gJWfHFsT5PaFw0SkeDb2xRPTqSCXI1RMM?=
 =?us-ascii?Q?Q8j8GtWCLXdwmiVeoFiCU7Sq/TMwczp4D3W8ktA9zD8TBrlPSiw9qwSYKUAP?=
 =?us-ascii?Q?n0tuiKnjJ1+zwQpviclRk9nfTQ4RoVnA28f0zeh49ye2t+gmSy9pFcMxA4RA?=
 =?us-ascii?Q?4BkXxTZK4y4E3J+miZwChqBqGUwzGL6aftQj4Lvt8KxwQ+jVtAMm8NdcaBh/?=
 =?us-ascii?Q?UgHkg8FGTr/e/lzcBQeW+lOBfBz1nXYPYNgZPyliPRHkpdIOKQSkLk2kEV8u?=
 =?us-ascii?Q?z6E+8+yRPbppYvI2/xgqCu1i0jek6NZAexE/TXzY+FlrkY05Cm0kWG295Oc3?=
 =?us-ascii?Q?98fIWa7L+bNYnRxaDiOExSdzDelZlO2eSDdt06wamCcjF8lYssdsCaLXVgu9?=
x-ms-exchange-antispam-messagedata-1: dffNV7haO80k5OUOI0oaAHH3DOh0TrbSqE8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lEEZYHIwze2YsKDxLqe+GqGpuB+L3qd86iLLJyOVfSyaExdo5CmTEhJWeosz+3hXiRe/Kvu369iC7vjMfcjhvTEJgXepFqMXI22IaMg8z6nsrfPhg4cHZOU8vyS0hO3ik0W6QG5oiEcp/Os1iklj4J6h7FaVcT7f5j8N3c54H2umh3woJYH/NCfVenQaA7c2wsF5l3ryvH2mPIevDAByF1hmQG59xPCqRSEXjyKbD7nd80XZ1y3r+sh/rjWz3L/niLhmRf0dg0ZG+YrTI0en5ydBIFXpWj5/rfygwbLTBQ0CwSo6wqMaW0pRuy9Zp1TmFs/NVEeUeyjkytt+0sJbAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3018aa85-a899-437f-e653-08df3059a7a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:29:33.2214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNGCBPAbECNZay/PiR6uneV3LBeuKTpMgzxIR/CrXEowsnOXYX00vLh6/L+IGemGex53P58DdABZ1rM/wZ+vcsQygQLXLd8sxaQsn2WEHo53naE8nsINfJUzdazBfTii
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 22 October 2026 08:53
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: [PATCH v7 02/13] drm/i915/dp: Limit M/N ratio for DP
>=20
> The hardware cannot support DisplayPort configurations where the ceiling =
of
> the Link M/Link N ratio exceeds the limit the transcoder's timing generat=
or
> DDA can track. This limitation has always existed, but it typically wasn'=
t
> encountered without the use of joiners and DSC.
> With higher resolutions and combinations involving joiners and DSC, this
> constraint can now be hit in certain scenarios.
>=20
> Restrict the link configurations to those satisfying the constraint while
> computing the link config limits, so that the SST and the MST paths both =
get
> it, and so that a mode which no link rate can support fails early rather =
than
> deep inside link config selection.
>=20
> Also prune such modes in mode_valid. Note the ratio is the pixel clock ov=
er
> the link symbol clock, and the symbol clock is not monotonic in the link =
rate: it
> is the rate divided by 32 for 128b/132b but only by 10 for 8b/10b, so e.g=
.
> HBR3 has a higher symbol clock than UHBR20. There is therefore no single
> best link rate to evaluate against, and mode_valid walks the link
> configurations instead, only rejecting the mode if none of them can satis=
fy
> the ratio.
>=20
> For MSO, intel_dp_compute_config() divides adjusted_mode->crtc_clock by
> the MSO link count before computing the link M/N. The limits and
> mode_valid are evaluated before that, so divide the pixel clock by the li=
nk
> count there as well, otherwise the check would be too strict by that fact=
or.
> The joiner needs no such handling, as
> intel_joiner_adjust_timings() only rewrites the pipe mode and leaves the
> adjusted mode the link M/N is derived from untouched.
>=20
> Note: MST goes through intel_dp_compute_config_limits() as well, so its
> compute config is already covered here. Only pruning the modes in the MST
> mode_valid is left, which is added in a subsequent commit.
>=20
> v2:
> -Move the M/N ratio check to the link rate configuration phase instead of
> during M/N computation. (Ville) -Prune modes that cannot be supported
> even with highest link rate due to M/N ratio restriction.
> v3:
> -Rebase on the link caps iterator based link config selection.
> -Set the constraint up in intel_dp_compute_config_limits() by narrowing t=
he
> link config filter, and fail there if no config qualifies, instead of ski=
pping
> configs while iterating them. (Imre) -Use a limit of 4 on DG2.
> (Wa_14014191401) -Walk the link configurations in mode_valid rather than
> evaluating the ratio at the highest link rate, which is not the best case=
 for it.
> v4:
> -Add iterator for all dp configs in intel_dp_mode_valid_m_n() so that we =
do
> not prune any mode that could have been supported (Sashiko)
> v5:
> -Drop "SST" from the subject and fix the note, MST compute is already
> covered by the shared limits, only the MST mode_valid is left. (Mitul) -A=
dd the
> Bspec reference. (Mitul) -Drop the link_n check, compute_m_n() fixes N at
> 0x80000 and only halves it, so it cannot be 0. (Mitul) -Fold in the MSO
> adjusted pixel clock from the M/N ratio check commit, so this commit is
> correct on its own. (Mitul) -Add intel_dp_link_m_n_ratio(), so that the M=
/N
> ratio check can share it. (Mitul)
>=20
> Bspec: 49266
> Co-developed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_display.h |   2 +
>  drivers/gpu/drm/i915/display/intel_dp.c      | 114 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h      |   2 +
>  4 files changed, 120 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 580c36a52921..f74e7ddf0e41 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2650,8 +2650,8 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
>  	intel_reduce_m_n_ratio(ret_m, ret_n);
>  }
>=20
> -static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> -					   int pixel_clock, int
> link_symbol_clock)
> +void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> +				    int pixel_clock, int link_symbol_clock)
>  {
>  	compute_m_n(link_m, link_n,
>  		    pixel_clock, link_symbol_clock,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index eecafff167d3..404168f4213b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -523,5 +523,7 @@ bool assert_port_valid(struct intel_display *display,
> enum port port);
>=20
>  bool intel_scanout_needs_vtd_wa(struct intel_display *display);  int
> intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
> +void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> +				    int pixel_clock, int link_symbol_clock);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index d8c0d9381471..7ceb7c02b597 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -63,6 +63,7 @@
>  #include "intel_de.h"
>  #include "intel_dip.h"
>  #include "intel_dip_regs.h"
> +#include "intel_display.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_jiffies.h"
>  #include "intel_display_utils.h"
> @@ -1267,6 +1268,44 @@ bool intel_dp_has_dsc(const struct
> intel_connector *connector)
>  	return true;
>  }
>=20
> +static int
> +intel_dp_get_max_m_n_ratio(struct intel_display *display) {
> +	if (display->platform.dg2)
> +		return 4;
> +
> +	return 10;
> +}
> +
> +static int intel_dp_link_m_n_ratio(u32 link_m, u32 link_n) {
> +	return DIV_ROUND_UP(link_m, link_n);
> +}
> +
> +static bool
> +intel_dp_can_support_m_n(struct intel_display *display,
> +			 int pixel_clock, int link_rate)
> +{
> +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> +	u32 link_m, link_n;
> +	int m_n_ratio;
> +
> +	intel_display_compute_link_m_n(&link_m, &link_n, pixel_clock,
> +				       intel_dp_link_symbol_clock(link_rate));
> +
> +	m_n_ratio =3D intel_dp_link_m_n_ratio(link_m, link_n);
> +
> +	return m_n_ratio <=3D max_m_n_ratio;
> +}
> +
> +static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int
> +pixel_clock) {
> +	if (!intel_dp->mso_link_count)
> +		return pixel_clock;
> +
> +	return pixel_clock / intel_dp->mso_link_count; }
> +
>  static
>  bool intel_dp_can_join(struct intel_dp *intel_dp,
>  		       int num_joined_pipes)
> @@ -1302,6 +1341,33 @@ bool intel_dp_dotclk_valid(struct intel_display
> *display,
>  	return target_clock <=3D effective_dotclk_limit;  }
>=20
> +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> +pixel_clock) {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int m_n_pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> pixel_clock);
> +	struct intel_dp_link_caps_order order =3D {
> +		.key =3D INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> +		.dir =3D INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> +	};
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	bool found =3D false;
> +
> +	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
> +				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
> +					     link_config.rate)) {
> +			found =3D true;
> +
> +			break;
> +		}
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	return found;
> +}
> +
>  static enum drm_mode_status
>  intel_dp_mode_valid_format(struct intel_connector *connector,
>  			   const struct drm_display_mode *mode, @@ -
> 1456,6 +1522,9 @@ intel_dp_mode_valid(struct drm_connector
> *_connector,
>  			return status;
>  	}
>=20
> +	if (!intel_dp_mode_valid_m_n(intel_dp, target_clock))
> +		return MODE_CLOCK_HIGH;
> +
>  	/*
>  	 * TODO: Even when using a 4:2:0 sink_format
> intel_dp_output_format()
>  	 * will always choose a 4:4:4 output_format if the DFP can do the @@
> -2656,6 +2725,48 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct
> intel_connector *connector,
>  	return true;
>  }
>=20
> +static bool
> +intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
> +				  struct drm_connector_state *conn_state,
> +				  const struct intel_crtc_state *crtc_state,
> +				  struct link_config_limits *limits) {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D to_intel_connector(conn_state-
> >connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_caps_order order =3D
> +		intel_dp_link_caps_connector_compute_order(connector);
> +	struct intel_dp_link_caps_filter new_filter =3D
> INTEL_DP_LINK_CAPS_FILTER_NONE;
> +	int pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> +
> intel_dp_mode_clock(crtc_state, conn_state));
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	bool found =3D false;
> +
> +	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> >link_config_filter);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (!intel_dp_can_support_m_n(display, pixel_clock,
> link_config.rate))
> +			continue;
> +
> +		intel_dp_link_caps_filter_add(link_caps, &new_filter,
> &link_config);
> +		found =3D true;
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	if (!found) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] No link config with a Link
> M/N ratio <=3D %d\n",
> +			    connector->base.base.id, connector->base.name,
> +			    intel_dp_get_max_m_n_ratio(display));
> +
> +		return false;
> +	}
> +
> +	limits->link_config_filter =3D new_filter;
> +
> +	return true;
> +}
> +
>  bool
>  intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>  			       struct drm_connector_state *conn_state, @@ -
> 2772,6 +2883,9 @@ intel_dp_compute_config_limits(struct intel_dp
> *intel_dp,
>  		limits->link_config_filter =3D new_filter;
>  	}
>=20
> +	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state,
> crtc_state, limits))
> +		return false;
> +
>  	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
>  		return false;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 04fae203bb69..aa58833a405b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -239,6 +239,8 @@ bool intel_dp_joiner_candidate_valid(struct
> intel_connector *connector,
>=20
>  u8 intel_dp_as_sdp_transmission_time(void);
>=20
> +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> +pixel_clock);
> +

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> intel_dp_link_cleanup(struct intel_dp *intel_dp);
>=20
> --
> 2.34.1

