Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6301D606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 02:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VznAXwrs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234E010E195;
	Thu, 22 Oct 2026 02:49:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7968F10E195;
 Thu, 22 Oct 2026 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792637366; x=1824173366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GbhtMnWIpZfb51YyYCQnHj8Q8w+6zotoVlVT9xux6i8=;
 b=VznAXwrsvigCiJgZSQtHIkOQ17x0rUGBIHzlHSjGIgbHfrvqVoy9Y0jd
 PvTeBtjw2f+te6yC3QjedbNXpWDoe+dEO4U8UnxRpXqmrwnS/9j7v4ae1
 mD5gri+88V+l4WUr0SARpuIoAGFUTVTLfIvlQdHdnQwU9NZP/I+U3f3Jc
 75wjmyVsNF1Bq9G/u1TiCjvWkJGc/AClLt5LFsOFCgX8Opl9ri2JRecXU
 JaN/sxkYSlHaLVc22gFIacmXOWYJfDChQMMH+Li5vAYXekbLJARmeJ+LP
 2nHXyGigDMOQy6sZtmZzm7skybN51VamkJMzTh7lhVvkA0WxNyU+2cDt7 Q==;
X-CSE-ConnectionGUID: nidWkJ3HTrOVnv1HsdqmEg==
X-CSE-MsgGUID: hYJRNTnDS02KtVOpbS3hgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1277821"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1277821"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 19:49:25 -0700
X-CSE-ConnectionGUID: jfeFE5BBTEG7wqy8TwrnyQ==
X-CSE-MsgGUID: Lo0iIPBCQp2cW7Q/smljXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5006624"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 19:49:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 19:49:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 19:49:23 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 19:49:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBvSh+pmYVEFK+84qY5Kd3q4hiWj9oQEppodn+qVzGZHTHQpxD8XyqMT3V4/+m3a2pCPmfYhLVeEEGfzT92sZWyaNbUrD4rUjYpyqyLXwliF8bj16MOzu0WNHuHEvKXOOnXu8blHxsPiqMJkGaRBw4SZdvhWmCWXe1gRzV8lWfYGpLn1dZT/m9DrJPIzudsZVdokk4CBeXGi67DfT404mAx2oYDPPXtf7zTFSqTfV/B9wB38zEqn6qjrRJMpf/IASWJoVcR+0XdWCuTMlMF5KX/WWUq8tCUh1dfqtItKKN+GNM7vf4f1cGz+L6Kxyqda8dsXATAfIFZEf/LX9J1M8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+D4DoroAPnQ4NqarT5Mvv3zzqLJft+pLMyCXvwUVyo=;
 b=P9jQ78m7M24qcT1P3NWgFDazVbfkRSPT6UZycxf/lavMtC8PL5jqTbfjbI9Y+StDfl6EY03eL6Lk4MtXnfO5RuAyjcYSvtzh+ZvBd+LHXnENPnO1JOi1OjiXCYemx3lVsIJNLYuqRsoEnjZZXibChFELzSlOLsI6bu1GDp8H86jkxRFl8J5ZhhMkxfNV1j20YS42SGSmP1jWn72H45yy/VeckWNnhzdk9YM8Ctrs8GdzLvgAeLJjOZxR168npr6O6jVmtXZY+BFCgPC/rbtqgpADJCa1vg4ve0Bk3gHnq76eML23bp3n2ld5Hys3kX+svESR0J3K9VB2+vB5gyJidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SN7PR11MB7067.namprd11.prod.outlook.com
 (2603:10b6:806:29a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 02:49:20 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Thu, 22 Oct 2026
 02:49:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Topic: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Index: AQHdYS1L+OyNM2F3rkKCHWFx/yn2ErcIOW+AgACj4EA=
Date: Thu, 22 Oct 2026 02:49:19 +0000
Message-ID: <DS4PPFE901A304F3469C4429F99EFD3AEB6E3652@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
 <20261021072438.1164249-6-suraj.kandpal@intel.com>
 <BYAPR11MB3783EFBE4FD869254CC5B7A0B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3783EFBE4FD869254CC5B7A0B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SN7PR11MB7067:EE_
x-ms-office365-filtering-correlation-id: c021ae23-ce0f-4332-3a97-08df2fe7123a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|3023799007|4143699003|260925022911599003|261009223027099003|260925021911599003|11063799006|261021121427099003|260925021311599003|56012099006|38070700021;
x-microsoft-antispam-message-info: btSVAY9574pzTlDwaSEDOGMgT5JCEDqYGCt5QH0+tK/zwMoMmkywHsqaQi9oSFSMEnX4qIuz0FAX4oczTEhVJuJqC7/gfHIp/7FQ2U6gkgnz/VU5sUA/555D2gSAUURPj32+k8PvG00mR6SUAMjRov8mJ9LiexstpBjBb7xusFGw61tEYBetzLtOiGUKwyi/yAWMEiheVCeL5V3Bb3f7Gb/k0wtZTsJc3Cs+MABX2d1MW1o+Ur6mzHqn4LjEXlXiYkpbs8dEum/nKw0esuOJbFIvYrvHnqOXIMPCluxTlLp92HxGq+n6SDbpYfmwmcMSzNXTw2nTbeIBqJTWy6t4x94POXPrEFQ/GUvRSUbvKtPv+Uy3Y8DLwn3UkO1vbF01dl9zSTXy5FRldp+BGG+PYHTxlKdi09b3hjGJ5G5k3Rkx+pMYMWBtulMD62GxTm8kZa76hRxa/SAPMFgsrRTiC1xywsOUM5eOQShTKIvr+F6C/oRM2HHakC0TuZAjakh3wvSOBD2HUZb8Thhr8m33QBp8R2d2cqUdL6kUn3E8c/ndFrZ6j7XOKu+geXUag01DASC6n8PCNtSAq5oZCu3dxOg2Fae5NjLJlsa7zIKTZQtQ1DnqUJWa0VtWRbLT8XQdg2RMYAqWYJSXIq4a31JDkg4Cq5krrRKWoa6Zo8CNEEEIJD+lFmG2nVLAp7EGBBrXiBN4JJHcmaaLf8XOf0Qu925WqgrZjiwYw9tgxCD6H7c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(260925022911599003)(261009223027099003)(260925021911599003)(11063799006)(261021121427099003)(260925021311599003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2B5rY72umwgpLs9PMnxtNoQ9zPLeICiCbzDTxN8D1LEOJSbErCoaQ3qGq3ZZ?=
 =?us-ascii?Q?rXaGOSUjGlwXxHjtD5UgCXhv+v9TuTrKkAR/6dCkhGyvKyCDxddmSX3hFwEN?=
 =?us-ascii?Q?xSsVfMXNQOMJ1IpzeEHeXCpaqdW59u+lT03GMtM1Tfh5ht78vG7PMBiDgtIf?=
 =?us-ascii?Q?C7QrgaxQgpIrK+QQw9kaclqXinDB9jjCNhqzNoCYUiKM1O0GrJ7rQdwU0+/M?=
 =?us-ascii?Q?Xdn8VipakBzhdGtuV8N5bQHqTlbKjFRWbIoyDzwr1r6ZsYCOa79zl7cxT8d+?=
 =?us-ascii?Q?bVFEUulSSvvlLjWt46LdaKMy2OqXWbOdKgiN63wcjIePmQdiDfyUYbMcLu01?=
 =?us-ascii?Q?aIUGZc3GO6kf1+5c45x3MbvIljSgD6xPjMzShOB/BioBCc86Q7RAID1lxvjl?=
 =?us-ascii?Q?sk8Dx1aLc1dJFbVlo4lM1GUBhu3ZrQ35aJiLxyqeDUCN1aTaDNpMtIPE7yPD?=
 =?us-ascii?Q?IVXD3LE8CBOkEgagP19J0LKGJDOunQIh/hVpEjp6oNfQ+td0QBaNJ66/pBir?=
 =?us-ascii?Q?yObsA0moh3UsuMIHdlf1CB+nhwUYUGSKMuqkgOgPyKCA0+s+O9WgtXgZgyr0?=
 =?us-ascii?Q?ILW7UCJ0Ea+46HNlgFA/CJrqMUUmcGbyBWcuCNrN8Zybb6a+OYqqjM8/THR4?=
 =?us-ascii?Q?LcrWM2MY0+tMSq+eqU0ox9oy8SIG44tr+XT3XoCIU+3aRZ7ng9WVo13Q69UB?=
 =?us-ascii?Q?lNvwhR4LrHRz9gj50kO0Q4X+jLUKL/cdAPi9Pv+kElerqV2xnf3RnmdyELb/?=
 =?us-ascii?Q?vISLnGecOF/BMl7zGexmfsD6b41RmRgShx/yFYrntP7He0+pNEZvEEl68TJ4?=
 =?us-ascii?Q?8oVwMYc6zjZnsLPvwa6d3PNnixZ9dtDfTU57qe+MPcjuAgZOQV5JWld5okAZ?=
 =?us-ascii?Q?RwvNQbZBUpLYgtxVq8nqS4qX/etDqUnpdbofG1zI0ut66ZOQAWCGaYuN5hYd?=
 =?us-ascii?Q?JvCCbf0mFf5GQ2gm+BAIAF88a6aoEeRLBHj31uURMa4zBakl0MjFkNx1BA/c?=
 =?us-ascii?Q?dQHrooCv8F5M1ACICEVRrI/qN9+Jp3n3aHtzUsBJL9kTkNYnsyYXxh5u29Up?=
 =?us-ascii?Q?3h+3F57Qg9EP7YniHbFmAHMid3KYf7ND8nxngxrzEbwUbIk3wzfIBll5Mu/b?=
 =?us-ascii?Q?Y50wogzvBT1aQgeld4y+iye/n3IF/nKHQg6UEKbgFWd3qZ1aRNC7aISmGtin?=
 =?us-ascii?Q?Gwt0vx2qqtKsruyIFE402+QPy6XEJ2fqcd+stun6na7n+2wULbN1YEY3CbBE?=
 =?us-ascii?Q?Y5qE84ifudXY47w6Rm/lgWycIEYBanFObMBryiodhNQG/ip2i9EHsENLjwpT?=
 =?us-ascii?Q?HXTPw71QKHXLn/qiYK6ouBkK9xBKJRFdwgdWJfnV1gfz5s8wFyzmUH3jmHeS?=
 =?us-ascii?Q?1fsJ5MGoC9cKNXIZ+0e2vDLQRu4/3xdaNWm1KLmdR8QkWcnF+vmK6EINLrkr?=
 =?us-ascii?Q?n65vqSfHtRYpFZkFPurffWJsCit70ASh9Y0WBB8bCfWFp4xojdPc4Zku3cQw?=
 =?us-ascii?Q?rgej3s4KNJh4FZSdyR8vpX8qTe7L4LXTBofaxB2r7ILUSXW9NHtBq3uBtAxh?=
 =?us-ascii?Q?cmHXfRU4Y19VPJBbrboVOSbUJ7YAhwvcOjKEX8UF6Cfss4MZNBr0883SzaKi?=
 =?us-ascii?Q?YpzexDgdpoWH78khAUoUa4lYeF/EjX7TK0q1hJtOe7bUGjebMJ2VElybYP38?=
 =?us-ascii?Q?R0w7u2/keYyR60UUJkUvV870ucOUwCG4H109JjHRtu0Gp+u1ma50l2eGLZHA?=
 =?us-ascii?Q?yqiTiLVhPA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: x807lwLz4SEKFs56L3sMqktXpGHjU0qta0HJuV4qKUNdTMYlPlW9FEV5JUtTYQ3wRyHrlp1u3K0B3LS+9reWW71AZkBXY3tqvkq5+DjkNCjMk4usETewr8YKREb53IKzFictdivy9S9LbZsNZv5t0GM9nlE6/S/+NvGAcTDnwWX0946GyO+/gcpRg/ZFyfWS9JOJw+l3f2x/PJKFL+TJmoMcykr8Bhske317D2vYZRh8N2WenbEfITm29cTc1G5dplhaYpgzFJpSob4q6VBlH9OTEFoWpQUUngFuoK95e2kwAjxbF8LMPAAxN+81zNmxQIAemQc2kZcpM5NrLehdWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c021ae23-ce0f-4332-3a97-08df2fe7123a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 02:49:19.9130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YthnvyRYWwqbCNXr1+efRKt/TmOOSYcJdVsWkrfJayCBjs/eu0R5Or6xm/yDmtSPMijrQB4IJnT7cStR15v9Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
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
> From: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com=
>
> Sent: 21 October 2026 22:32
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-gfx@lists.freedesktop=
.org;
> intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP lin=
k
> config
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 21 October 2026 12:55
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Golani, Mitulkumar Ajitkumar
> > <mitulkumar.ajitkumar.golani@intel.com>;
> > Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link
> > config
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > Introduce intel_dp_check_m_n_ratio() to validate the computed link M/N
> > ratio against the maximum allowed value, and log it if the ratio
> > exceeds the limit.
> >
> > The link config limits computed in the previous commits only restrict
> > the configurations that may be selected; this catches anything that
> > still slips through.
> >
> > Log it rather than warn about it: the link config filter already
> > excludes the configurations violating the limit, so the only way to
> > get here is with link parameters forced through debugfs, which are
> > applied after that filter. A user triggerable drm_WARN() with its
> > backtrace would be out of proportion for that.
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
> > v4:
> > -Move the MSO adjusted pixel clock to the commit adding the
> > prediction, so that one is correct on its own. (Mitul) -Reuse
> > intel_dp_link_m_n_ratio() instead of open coding the ratio.
> > (Mitul)
> > -Drop the m_n and link_n checks, neither can be NULL or 0. Make the
> > parameters const and move it next to intel_dp_can_support_m_n().
> > (Mitul)
> > -Drop the check on dp_m2_n2, the dp_m_n one already covers it. (Mitul)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 17 +++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  4 ++++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
> >  3 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index f3a79ae49b18..8ef6b4c4fc8e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1299,6 +1299,21 @@ intel_dp_can_support_m_n(struct intel_display
> > *display,
> >  	return m_n_ratio <=3D max_m_n_ratio;
> >  }
> >
> > +void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_stat=
e,
> > +			      const struct intel_link_m_n *m_n) {
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> > +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> > +	int m_n_ratio;
> > +
> > +	m_n_ratio =3D intel_dp_link_m_n_ratio(m_n->link_m, m_n->link_n);
> > +
> > +	if (m_n_ratio > max_m_n_ratio)
> > +		drm_dbg_kms(display->drm,
> > +			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> > +			    m_n_ratio, max_m_n_ratio);
>=20
> Not mandatory, but, since the DIV_ROUND_UP(link_m, link_n) <=3D max check
> appears to duplicate intel_dp_can_support_m_n.
>=20
> Suggested fix:
> Factor out a small static bool intel_dp_link_m_n_ratio_ok(display, link_m=
,
> link_n) and use it from both places.

I'd rather keep it as is. Later in the series both callers need the ratio
value itself, for intel_display_can_bypass_m_n_limit() and for the debug
prints. A bool helper would mean computing the ratio again in both places
after the call. The ratio computation is already shared via
intel_dp_link_m_n_ratio(), and what's left is a single compare.

Regards,
Suraj Kandpal


>=20
> > +}
> > +
> >  static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pix=
el_clock)
> {
> >  	if (!intel_dp->mso_link_count)
> > @@ -3755,6 +3770,8 @@ intel_dp_compute_config(struct
> > intel_atomic_state *state,
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
> > index aa58833a405b..1e3da678c9b6 100644
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
> > +void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_stat=
e,
> > +			      const struct intel_link_m_n *m_n);
> > +
> >  #endif /* __INTEL_DP_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index f00edfb66a10..8db84975f36b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -429,6 +429,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp
> > *intel_dp,
> >  		return slots;
> >  	}
> >
> > +	intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
> > +
>=20
> With consideration of above suggested change,
> LGTM
> Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
>=20
>=20
> >  	if (!dsc)
> >  		crtc_state->pipe_bpp =3D fxp_q4_to_int(bpp_x16);
> >  	else
> > --
> > 2.34.1

