Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D79606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j5QqTmx+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318710EC4A;
	Wed, 21 Oct 2026 05:17:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC73210E303;
 Wed, 21 Oct 2026 05:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792559847; x=1824095847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qwJC0T496gn42jpdbO1E+QvT6kiJbkl8QnpNtMFd9tI=;
 b=j5QqTmx+/owm+kUGHlV+IlpLvAVMOz1misyUvc95O/wl2oFZDyaEpK0D
 1EyzZy/Szlgz020AuYGU/MxeHDr1DFnzlPjRa/S3wjUS8e9vmewWFqFcT
 jLW1+V5VL/UgyHna1csZCIDc5LJx+tcIHwq1rpGku/P7e0m26Em4829dG
 AfS+sboSu4isEWe/z3a+iDP9lDcuyUhf34mzpGTuw1/SYgO+VO4l+1BHU
 HgbfbE+JXw+kApGWe2hDUAe5rZ6GSOF9OvEUaFb19s7MLkbCSCjOqBAui
 pkdGrTeZvVhgHZI8xjK4gRoiV8CfzVtbItlm0HNz4tek+/FKrHUT+cZ2H w==;
X-CSE-ConnectionGUID: y8D56HayTKeqHvlA4SWMgg==
X-CSE-MsgGUID: FY5tsneYQZibn76yYCNVUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1176980"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1176980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:17:27 -0700
X-CSE-ConnectionGUID: FsSvkCdBSJ+CBZJ7UBCyzg==
X-CSE-MsgGUID: y+jtVX9/TySEQtrYTK0Pmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3456985"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:17:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:17:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:17:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCthbF06gevEqGRzkjmuJbEOrJbubT6/S8vioyv3iStfz6sOgJq1wkv5O3OqZ3t5SqexJYO7Bc2+Ay5waCC9tBTVhzyonkps6zqYQA6/ukOuUtRgKCsZfiTaLwjRmuRhsOJDOD1he6vlqcBT4XRoH4rXphktr6izJdYvUj5Iyf7i4PsAfuf98puevoFhoAxw2rxYDvchESGbvJh6y1Lb4FeziABXwuB0v8n7RFKhqztte3i0DctRYSmXmbNQZwrZcc3G4FaWugfbk1un2gCJpLOONQli3S0oRly3H4fYQmAj+HfHwn7EL6q5Z6xWashPiHBfk8R8sy+NOEontIdIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ1a4AKN3EGzgRUf2bSKEPUfuBOKy4sioPCiq067ees=;
 b=NdI210DcmMz4n7jeN2BolHQT+xAu9BiRoXUXs/402t7pCxQlWXR7ALRAjQSay472z83JGUL2Q2R8M9eMj9zeAnvFj9sbJ8vl0sVZv6Fpco1xRvl7NSFysUI5Wm64FzDYb0ikDHMzT1jEdSZO0cpIbHq5ZPai3r7U0AGud+VFlHmWVL2UntS6DjQnKgRu8p5oxPMwGS9BPHytpCEbtl+7fDtY9pwlYhvXTKmx+MIZsYZdNp349+h6rfgUTBROHXOwOlyWSVSXyl5HBZUyRm2LmpnyztZXocNm3kq6rQJPpckLEfhD0W3gyGAu16B/BdzrOBe696wXMAP0PcB8vM93Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA3PR11MB824491.namprd11.prod.outlook.com
 (2603:10b6:208:626::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 05:17:19 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Wed, 21 Oct 2026
 05:17:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Topic: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Index: AQHdRmJ94wCbcD5pPUyk/04vWGZevLb/ITyAgAiH96A=
Date: Wed, 21 Oct 2026 05:17:18 +0000
Message-ID: <DS4PPFE901A304F4B4712F24CF4306E2337E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-5-suraj.kandpal@intel.com>
 <BYAPR11MB37839E745F7C026E80523E08B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB37839E745F7C026E80523E08B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA3PR11MB824491:EE_
x-ms-office365-filtering-correlation-id: 889827ca-1a6c-4189-5b6a-08df2f32941b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|23010399003|56012099006|38070700021|260925021911599003|260925022911599003|260925021311599003|261009223027099003|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: A+R8yeHbfEf60PhiCzUoJmmGCYB0pAYFikmxvGQ3pQ0X9eWefPB5qi7kml6q+G40m16B9uRHhrHI1zuJTRrN02Wdb4KpkeDh+iDiZbK+scuEmmW/zSZUeJsHt43FMNo9QEQpic9SIR6Q38RMeWoys6Qkxgs+2EVrISYE0xdQ/0KMlSO/rqtxf6BMjxE7+OyGgca8NvH1/jXmF1vdVy7Qh25KZWNF7T/z4dof2cacZtmApoLNVSgExjDYbuXXTHBQQ1NcEOmnkNGEMoy4fsZuKerp5bW2XgMNGL3mBFcyRLy5cVFE4M0tSr61nPBvX+VuRqMA30EMmORjpxQRxfHf9GYgGiXZtPGpkVBn7nA9ftZVfR/7FRdVVQg85E0UnDk3WgI1XFSCpRmfiy8SS07qxOfh534iYT9pC84GWb4VuVfh+rL+YPC0oGDRSsgKFCUooGgEV2SwliyUDyUEH0gW+PP/duC34377PLiQApgOGKG0lZNGWCM8xZl66SxXshDEr8GsOn5TIs8sqgNRvhJWkc7XryW18fjYMN/3WM1lF3TRsvgNgzn6CBBGySho5lVLLZqISiBkwu4q1acsxj22SaI5eFKHuzKsiX/9F+ptEsCzBmfOliwbiKN3C7fYVyxw5GufsDJoPfMeYINQ1knmaeGlR0pS1t4i5PhGE+udQHEhWbIqtTIAADOReESXrlTz4icMxfVcBrtCPy0RZPtMQgiiB96VN/ORJR7Y86WoKC8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(23010399003)(56012099006)(38070700021)(260925021911599003)(260925022911599003)(260925021311599003)(261009223027099003)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xjGHSjXO4iqIYGs2qqK3w7jtpOp6+6F6hLNt3jF5x43CfLwUtNN+yA1TD0aH?=
 =?us-ascii?Q?GYQCAinxhx6N6mhGboXt4jndgrvswEg9TSZB/VnvYhLjATY0bBPFbZVwoS1L?=
 =?us-ascii?Q?S2ECjEYZ50SEbD3qfAlFwmPzP0BErUvgKXXkweFD7iGzvKiJVYD6WNjjA8Fr?=
 =?us-ascii?Q?bpzJNLuE6gh8lqV3GV7F6eiIIrc34huJbLVwrKwf5LeHLVhwD/2a/Hr6kl4U?=
 =?us-ascii?Q?qneZPHBGMZ67c0yfXsvVjthVY5bWlBcgjRAhHLSWqjchbu9saT+/8S1gD6Lc?=
 =?us-ascii?Q?yOBBscgspXegF+FszFtHxUvFxasHa/XXV3ucyMyQ4AaMiaPHDKc0ocRYEJ/+?=
 =?us-ascii?Q?uLStE3BD6B5kRxPTdFK7XqqWF9eXb2di5ha+RzstZIdMwm/ksZiY/DiZ7ili?=
 =?us-ascii?Q?jCAchDxtN7rcxnEREtCQTh4q20lafxhcm58xW2vU/kULb1s3tALvNqV1eHoQ?=
 =?us-ascii?Q?cpedypnvA3i2AaOX3APqQ5S1FOBMw1EEpOF8E30mNE12SANpAzmJroB4aqjF?=
 =?us-ascii?Q?zLrd86AEruRv7JJq+8+SDrfyJLjr3H7SegfVasIy98IXxFegNgcR85AEDZ3I?=
 =?us-ascii?Q?AVnVB5RT23tZ7i0pxOWmNfQb+K82DaQEsVPdZaoJ4jUR4v894SXB6wvnb2GF?=
 =?us-ascii?Q?3jucGWG5C5q5dVBFuwvyPB2HBwnwDzfu4IJvZcjiBuf6mVC3SeC53Eo4+wtb?=
 =?us-ascii?Q?EfE8tn9f1oN2t7s62L/PHnzld3/+7NU0p1KewHsWtD31Ubv7Jk4V6iKthstF?=
 =?us-ascii?Q?u78lqZSNiOb2Z/7gFHT6fYaaaw/0xlvsLzpk9iO/UYwWeA/Zlx9/8JVa2GTn?=
 =?us-ascii?Q?ulFwkzjvc80rubNxHbPnAf0FlTNXHfIHuKNQZxkSbvawlJDqT4t5tQ0tZi1A?=
 =?us-ascii?Q?LdvkteKtBx0yb44eCZz+mHdPRenQa81duIRZbylBmyH0+WeWkwUDHxcx4m9O?=
 =?us-ascii?Q?f1CCu4YiDtTiluLLCrIvJ4eGVgO3sZhy6uWBT8Fg8G48w10I0bIXR7E5v5Gu?=
 =?us-ascii?Q?dPp+Low85G4pYkBrfr6lIWP+O767WWbKX9GomF3d9MhXWoNEjHahTh41C0Vf?=
 =?us-ascii?Q?DAiXWL0qHjAcgqZr40XNddmVGhyrGRWOnAveylMGtQ3sbgeinyGAyVx+vUX4?=
 =?us-ascii?Q?+IfQMO4W6x+F0T5JRSU8Bm72op4Y+Jf5X1f9276OOVMm32TKUNofBThGEyzU?=
 =?us-ascii?Q?tXxWwWIBA5I7PHKfqV/B5jtekB1HMpy0oHzrCEysWt5aWKQjoO1tvMaJtKJ5?=
 =?us-ascii?Q?xL7yCZcTa0gCnsr63d3kNpcmTGyYXCq8uEB59SxjlPXz25aeO9b661sreo3J?=
 =?us-ascii?Q?qbAOMV1SG5Cg21J8kKPCNQq3XNRm88MUkg9b/euM7y/wjii9VKe7DGewf4C6?=
 =?us-ascii?Q?MNOsp/Jaz7tgX5AS9rV0Z3a+Ad4x90MoFFse2ZO02M35HcP6Tp79pHuXViH1?=
 =?us-ascii?Q?xagoRIU7hfNlfLqVIeQAWD1MquJikueHg9EJL6XwacQLBflAnkziAwSEWIA1?=
 =?us-ascii?Q?+TLvqJy2VGa6HSS5X5o5cf9tciJkiDKbYKOv/G5tW067RpqRCuqIdkXDAX4b?=
 =?us-ascii?Q?SbCVjFaeOegBd3AkNsiFqsTY+ifNBEsO0CrAbwvSKAtV6vH7V/MhQy/NyrHv?=
 =?us-ascii?Q?9jd0SZyaN5fOKqZD1NYR6F1YlT3aSycztXceEspGQtFQVvNReeCxFGfSfasV?=
 =?us-ascii?Q?B84k40SU5Qb29gE53IWrGZVJtFms9OLQzj9Lc8RmqHp9ADrtu9aM1ly1+WkP?=
 =?us-ascii?Q?wGOycOBDcIGf04NB2Qtozli/5gMcDxanhDs/NxvOHPlmjpCVsJevkLlfCjpj?=
x-ms-exchange-antispam-messagedata-1: dDuuASg0vbi+qw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QW6QAZohBxWWsalfgW02gnvhZDNNjjbQu9WNc6aXAgioICD35CV8QAVU1Ei2MYoD5IUIYodDQPI6oRYNfVdWYmMkueMwtlDKtCMAUHZ2Ke48DRlk0TgPFlCGz9WAKTi9xx5sr4mmkBcET+NU13j8kiCSuh1qDW+j2FBVnXANI6e7gkwSFJYvllW/vpOYprwHNmOGCUYuPbJLUTNEcTcDtf/qrBnTKlnFaKsdWyLGuDLJvFeooMg4Wjc+SUIUaZ15ZRPaUDBac+Brtz+yMEdkxWXlIkYeV1qucYbX4CbT9LhzfFcPbDaseVW8XyOdrbrdknWTlCOvr279ILScxZYGTQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889827ca-1a6c-4189-5b6a-08df2f32941b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 05:17:18.8961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YoMB3RhRi6Pe8FztTZEr7IAB+ZtL/nHov9oFtrRjyhdFDGywqmKbxRjPA7vtseok+rLmtY2Umc4j7Y+3Yr92gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB824491
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: 16 October 2026 00:27
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP lin=
k
> config
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: 17 September 2026 10:37
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link
> > config
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > Introduce intel_dp_check_m_n_ratio() to validate the computed link M/N
> > ratio against the maximum allowed value, and log it if the ratio
> > exceeds the limit.
> >
> > The link config limits computed in the previous patches only restrict
> > the configurations that may be selected; this catches anything that
> > still slips through.
> >
> > Log it rather than warn about it: the link config filter already
> > excludes the configurations violating the limit, so the only way to
> > get here is with link parameters forced through debugfs, which are
> > applied after that filter. A user triggerable drm_WARN() with its
> > backtrace would be out of proportion for that.
> >
> > This check works off the M/N values as actually computed, which
> > exposes a mismatch with the prediction done while computing the
> > limits: the pixel clock there is the one before
> > intel_dp_compute_config() divides adjusted_mode-
> > >crtc_clock by the MSO link count. Divide in the prediction too, so
> > >both
> > agree. The joiner needs no such handling, as
> > intel_joiner_adjust_timings() only rewrites the pipe mode and leaves
> > the adjusted mode the link M/N is derived from untouched.
> >
> > For MST the check goes after the bpp loop rather than inside it. The
> > link M/N is computed from the pixel clock and the link symbol clock,
> > so it does not depend on the bpp being tried and the result is the same=
 on
> every iteration.
> >
> > v2:
> > -Use the platform specific ratio limit. (Wa_14014191401) -Use the MSO
> > adjusted pixel clock when predicting the ratio, matching what the link
> > M/N is actually computed from. (Imre) -Drop the check from
> > ilk_fdi_compute_config(): it was passing dp_m_n rather than the
> > fdi_m_n it had just computed, and an FDI link cannot get anywhere near
> > the ratio limit anyway.
> > v3:
> > -Check the ratio once after the MST bpp loop instead of on every
> > iteration, the result does not depend on the bpp. (Sashiko) -Log
> > instead of warning, since the link config filter already excludes
> > these configurations and only forced link parameters can reach it.
> > (Sashiko)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 37 +++++++++++++++++++--
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  4 +++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
> >  3 files changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index f6a2152c4432..fbfc00101886 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1294,6 +1294,14 @@ intel_dp_can_support_m_n(struct intel_display
> > *display,
> >  	return m_n_ratio <=3D max_m_n_ratio;
> >  }
> >
> > +static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int
> > +pixel_clock) {
> > +	if (!intel_dp->mso_link_count)
> > +		return pixel_clock;
> > +
> > +	return pixel_clock / intel_dp->mso_link_count; }
> > +
>=20
> These hunks fix the prediction added in "drm/i915/dp: Limit M/N ratio for=
 DP
> SST". On its own that patch over-restricts MSO eDP by mso_link_count .
> Please squash them, together with the MSO/joiner explanation, into that
> patch so it is correct on its own, and keep this patch to the debug check=
.

Sure

>=20
> >  static
> >  bool intel_dp_can_join(struct intel_dp *intel_dp,
> >  		       int num_joined_pipes)
> > @@ -1332,6 +1340,7 @@ bool intel_dp_dotclk_valid(struct intel_display
> > *display,  bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> > pixel_clock)  {
> >  	struct intel_display *display =3D to_intel_display(intel_dp);
> > +	int m_n_pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> > pixel_clock);
> >  	struct intel_dp_link_caps_order order =3D {
> >  		.key =3D INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> >  		.dir =3D INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> > @@ -1343,7 +1352,8 @@ bool intel_dp_mode_valid_m_n(struct intel_dp
> > *intel_dp, int pixel_clock)
> >  	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
> >  				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> >  	for_each_dp_link_config(&iter, &link_config) {
> > -		if (intel_dp_can_support_m_n(display, pixel_clock,
> > link_config.rate)) {
> > +		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
> > +					     link_config.rate)) {
> >  			found =3D true;
> >
> >  			break;
> > @@ -2723,7 +2733,8 @@ intel_dp_compute_m_n_ratio_limits(struct
> > intel_dp *intel_dp,
> >  	struct intel_dp_link_caps_order order =3D
> >  		intel_dp_link_caps_connector_compute_order(connector);
> >  	struct intel_dp_link_caps_filter new_filter =3D
> > INTEL_DP_LINK_CAPS_FILTER_NONE;
> > -	int pixel_clock =3D intel_dp_mode_clock(crtc_state, conn_state);
> > +	int pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> > +
> > intel_dp_mode_clock(crtc_state, conn_state));
> >  	struct intel_dp_link_config link_config;
> >  	struct intel_dp_link_caps_iter iter;
> >  	bool found =3D false;
> > @@ -3382,6 +3393,24 @@ static bool can_enable_drrs(struct
> > intel_connector *connector,
> >  		intel_panel_drrs_type(connector) =3D=3D DRRS_TYPE_SEAMLESS;
> }
> >
> > +void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
> > +			      struct intel_link_m_n *m_n)
> > +{
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> > +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> > +	int m_n_ratio;
> > +
> > +	if (!m_n || !m_n->link_n)
> > +		return;
> > +
> > +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> > +
> > +	if (m_n_ratio > max_m_n_ratio)
> > +		drm_dbg_kms(display->drm,
> > +			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> > +			    m_n_ratio, max_m_n_ratio);
> > +}
>=20
> Could we reuse a small helper here, since the DIV_ROUND_UP(link_m,
> link_n) <=3D max check appears to duplicate intel_dp_can_support_m_n?=20

I can do that.

> Also,
> are the !m_n and !m_n->link_n checks necessary, given that callers pass
> struct members and link_n is fixed at 0x80000?

Sure will drop the check

 Could the parameters be
> const as well?=20

Finally, would it make sense to place this helper next to
> intel_dp_can_support_m_n ?

Can do=20
>=20
> > +
> >  static void
> >  intel_dp_drrs_compute_config(struct intel_connector *connector,
> >  			     struct intel_crtc_state *pipe_config, @@ -3420,6
> > +3449,8 @@ intel_dp_drrs_compute_config(struct intel_connector
> > *connector,
> >  			       intel_dp_bw_fec_overhead(pipe_config-
> > >fec_enable),
> >  			       &pipe_config->dp_m2_n2);
> >
> > +	intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m2_n2);
>=20
> Could we drop this check since dp_m2_n2 is computed using the same
> port_clock and its ratio should already be covered by the dp_m_n check? O=
r
> is this intended as a defensive check?

Sure will drop it.

>=20
> > +
> >  	/* FIXME: abstract this better */
> >  	if (pipe_config->splitter.enable)
> >  		pipe_config->dp_m2_n2.data_m *=3D pipe_config-
> > >splitter.link_count; @@ -3739,6 +3770,8 @@
> > intel_dp_compute_config(struct intel_atomic_state *state,
> >  				       pipe_config->port_clock,
> >  				       intel_dp_bw_fec_overhead(pipe_config-
> > >fec_enable),
> >  				       &pipe_config->dp_m_n);
> > +
> > +		intel_dp_check_m_n_ratio(pipe_config, &pipe_config-
> > >dp_m_n);
> >  	}
> >
> >  	ret =3D intel_dp_compute_min_hblank(pipe_config, conn_state); diff --
> > git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index aa58833a405b..4c975358ab96 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -26,6 +26,7 @@ struct intel_display;  struct intel_dp;  struct
> > intel_dp_link_config;  struct intel_encoder;
> > +struct intel_link_m_n;
> >
> >  struct link_config_limits {
> >  	struct intel_dp_link_caps_filter link_config_filter; @@ -244,4 +245,7
> > @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> > pixel_clock);  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> > intel_dp_link_cleanup(struct intel_dp *intel_dp);
> >
> > +void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
> > +			      struct intel_link_m_n *m_n);
> > +
> >  #endif /* __INTEL_DP_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 823fe99ca0a1..6d2e234a9e9b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -429,6 +429,8 @@ int intel_dp_mtp_tu_compute_config(struct
> intel_dp
> > *intel_dp,
> >  		return slots;
> >  	}
> >
> > +	intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
> > +
> >  	if (!dsc)
> >  		crtc_state->pipe_bpp =3D fxp_q4_to_int(bpp_x16);
> >  	else
> > --
> > 2.34.1

