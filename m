Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197A606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dEOipYFN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098E610E455;
	Thu, 22 Oct 2026 17:42:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA97E10E44B;
 Thu, 22 Oct 2026 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792690930; x=1824226930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W1lOOkKFVZ+KFHC5k4NorOozecCp9C64h+x+Fosz4Xc=;
 b=dEOipYFNtRii+0R2wlzKk+aKWrkGmA22Evle+CQFGLi6bvbep6vggYwh
 398XZ7N04YRY6XpD0kglXFVJfL1oTFHmmiz0IGlBaru1IbnXwvr8pcH9O
 tT2M1/DLe0wcOilP99HsqjyXaxHjGf/VLxoqW43O6J2NIlgn+IArIu6Na
 WZWy5EdSZOP4dlItn5mEaUbvN5TCuuez6Dz2TxvYtyJ+V6GQ5ocxukNlB
 pJSTonoRT1p4JrooxtIxAEl2O11qhEiSDPtmsD9MpKpdQwvmfZ8FWhcJR
 g93kP9kOAtBY5T6jrYVbBhpKxpdXspZAC/c9Hnu8kngOX0U/yQbuVhQLL g==;
X-CSE-ConnectionGUID: DiXnrrmGTuyvmsQwjM1iGw==
X-CSE-MsgGUID: tqUh3ZjIQgO9ZozPbr7PJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1450050"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1450050"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:42:09 -0700
X-CSE-ConnectionGUID: vEZyBGoEShuFcawp72uKHw==
X-CSE-MsgGUID: DJtZAtPyQdWdqfSF4THMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3333296"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:42:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:42:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 10:42:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=finjVOGcjGdxGsE9USVMPWByDBtISNY9/VOV4D0N4haBS6JkKaQxvKc0jzJ0iPSOieUg/Oepw1s4kUAIok1UF9GRs39tPZAcc769FgZT2iLQt0JZ8lie5yOOlbHNCdTJNoOWJ0CulCbIuFJCHO558UpaMYg8DGS3SEYw8t76ayksWRN8CT6z/secjzfsjACtv6gdnxpsMGM6v4P70lwXklgh292ea8Nb/c2l1m35QTm7iUJPXiX8p5pPeIWUA8OLvbSRc0KuTUalOM+9IoKmrB7O5WL0lb/RIqnn1UyvymME4fzA+lkZL7y2wAXFg/su1IXNhX0sHc+OrSloGnSb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24v2mQfqLEpqDKzr8SfqirjVbSCUMmWGHJiHMMcdptM=;
 b=bc5L3yf4z5ZVkkgbiY7FaII86ORtv1lTkp/Uw8qwmQTAbkvmLqk2lP5ShR/sXSIY7zOy9KRF1dW44M5w2n9yldfuixIxr0XsusJGS6sb7vKZqbJbHfYkAiPOUnS0e5PZZ7AbxYRbjeHBkvU4BO9/f19+eQ+QqAq0zb0XOaeYorHwe9h0NtUfqDGzZCARe4M6Apy71AMwxhSt/x9SdmeSe62Fx5GVwHYwE2xBtiBj8TBccGpplc2+Rj4pzWB4tOLD6WoC3Ox23sk67HxvdEUahn0QBe1w2s2V7nP7/avynftHXY/rFGzgbcEQdq67YjJLKUWn5Vamumdc6SA7LQ4I2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by LV4PR11MB9489.namprd11.prod.outlook.com (2603:10b6:408:2e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 17:42:06 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 17:42:05 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdYdSv8BTQ5PKPcku+vkGAlxuh2LcJ0lSwgAADAMA=
Date: Thu, 22 Oct 2026 17:42:04 +0000
Message-ID: <BYAPR11MB3783F7C420248824F9576A00B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-9-suraj.kandpal@intel.com>
 <BYAPR11MB37830FEF13F6A9C523A0B9C1B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB37830FEF13F6A9C523A0B9C1B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|LV4PR11MB9489:EE_
x-ms-office365-filtering-correlation-id: 10ff38c2-24c1-4be6-8cb4-08df3063c9c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261022113327099002|38070700021|4143699003|11063799006|5023799004|56012099006|261021121427099003|261021123027099003|261009223027099003|260925021311599003|260925021911599003|10067099003|260925022911599003|18002099003|22082099003|6133799003|261022075727099003;
x-microsoft-antispam-message-info: yoMUOYvkX4JZb8b+K+f9Hb9pzNmPd2g9Uk2iPBrFR2+o6jZfCoB+XBzxwe5Ezmri4MwBBtnKurJZXRPaUpqkr9+r2N56Xlm0z9qIqG4ZxhHFbUL+cXiwLpHG2+EMpKeS35+Sg3S+D8oXozkJ3vnZg9TCD9V9yYYJYMAxmxjrHn00JwKXWWEuIK9DGj28Wh8kER4mtPAtPY4HzAcs9zsWQigGM+OC/Hivyzvm3hl455d9gX+izY29+6OMbbu66Nm3tepzOacghEpN+HBeKRVf/CWnbu9AvkUPyNPxVbVIugNtTWLXJ7fIvQnn7bVVQg80WPsqimtPWOiHQTh1d/nfVMB/J5FOTC8f9qsekPU6h4MEwIJWrdbE3qOxKZHrBeYbIC/RoEa37sT1PRwlwFzaGClwB4yzwSn6vf/b5IXot35g8hM+1e3vYjIrx1H5Bx3tj5QN3V6fgXtJumFbrrYEavX5atVPR9WY7kikMTqf4M0XYxnOQmCoD15pECXW0ui2NUuj6VRxxo68a+RxOe+qkryuBD3c0Fh8afQGLHB9KBVGmbyZAebm9WYj7eYSriQ4vYTDTNosBN3/oIyfiq1bntMr5/zaE8Z7M7kbZfugUZR2q2xElS4dbpRoiJrGaVueCkz26JQk83FRUYhaVAKou64tQBQNZfXoQJRkuwUwrGJE12p5tAsQcDp38+bO/g7yQkxm9UmqjKYzNVAHD/2a0wEKkBLJdrplYKQhZfKrDOg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022113327099002)(38070700021)(4143699003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(260925021311599003)(260925021911599003)(10067099003)(260925022911599003)(18002099003)(22082099003)(6133799003)(261022075727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gcpV2GQ2R99Ues/UmKfQWb0x2AbBZ9l6CluS9mYzbCqk5yji/qpWZ9mU3n3A?=
 =?us-ascii?Q?pihDNIUMP69Yku/MHhGZM2mMwSCrsS8w8pYVfWCMbcTPG5l5jYQ3/4Wvx47E?=
 =?us-ascii?Q?/wQMgghp38ER1YOEkMBUMVPpH9f0wultbeBHVw1y/F4NfSicZdKZiNrKGBJk?=
 =?us-ascii?Q?JXD11yLYaIMVg1iVD+9u43/HFSH1DjZKa+mMFAaZBn1E/UTLez8CJIL1JNOm?=
 =?us-ascii?Q?5x3sDTlpHALGT4UBZ5T9GyDjXQmecNPS4/OVBRpvH8Mlsk5E8X8zdrcc0x5u?=
 =?us-ascii?Q?mQAHSQqAqdVdyLJC+aGWIhDiydq5rSNcYfVhbo+2/ceVunxg6pnW0lGog3Y/?=
 =?us-ascii?Q?wYKaSaIo0WTdJb0eud60Ij31Yz56EAIFvma+7WDWg0SagiYRDgzM/GeGUTC1?=
 =?us-ascii?Q?O566XMaoG/VgaRiGqCgGfpEB8aDH1J4GR+xnTk9KZRY4Hrbtgipkiuydu4jG?=
 =?us-ascii?Q?UrWoHvamjxFZGaRpCm1iY0CXZ+/jiaGMqeXpbb0vbp+1lasu7EKZ39yV0yFw?=
 =?us-ascii?Q?JmJ3/TgwJinKVqnPDcznjxSWA6n31Zb+UA9NUFSsnhJarBCGPWIuz/1D1Lp1?=
 =?us-ascii?Q?lKOiTR05qffpPyuogGfdA69SN5qAJqepmkQof71ftYo28DQGhtlefTpC8cvW?=
 =?us-ascii?Q?OAwarY8OuYCTg42D0W8iMQyGUYe+kl0crPxJMEbCyPRUOntmMA97wfUWq7J7?=
 =?us-ascii?Q?8v/Y+nspqlna0FBMvFszzx5bUuEixRG+qEekbiRBw/SJ7sRqTG7wA8nLNCNx?=
 =?us-ascii?Q?DhZN5yJ3glI+9yqMk25UYi0fWx8dlEUgQUbLCZ0dAq1DLlr42TRXrySG5wvU?=
 =?us-ascii?Q?WQ0yXhFLKapsHLs8SHRzQxURpoTN10Ikgrd8iB1llhjWQz/pzdmEdIeA8XF0?=
 =?us-ascii?Q?X0L3Fe6rBqA33Rm+29k/ZtYGwoIoHKiJBJ9XItw1e/reb2jSv79H4C30FTC9?=
 =?us-ascii?Q?Hoqptwo+NJFCRqvDxYJGwMooW3d2GUdML0LiyJexAce6xwgJEWpJIRgLotjU?=
 =?us-ascii?Q?ZZn9zrjSsnp3l1DYCEpKO5PBgb/y2zetWCt95iHqARCdU4TExaJZgiSCnZ6m?=
 =?us-ascii?Q?oH0Gg2X8pMBD0VqTQDnyLrbG8Ngk5F2CCDD0yitvlPFakdoO3GeVzm0aU1r0?=
 =?us-ascii?Q?7Lgw4+PFEu6vRjLEMZSSCZjzlHvwpbD75Fm2F2Hqdz66mlCJkbGT44ngdVmA?=
 =?us-ascii?Q?arW4aunA6P9PG/C18G7YsnnfjkOddjy4oBLT/r65v+ZEyI5WY8QPJoXakCQp?=
 =?us-ascii?Q?urHjOp75qQ0HmdWdVM+y7i4W9yCkjSdoFmMHQJ4oi8pDm6Hp3P8pnLq8uQo8?=
 =?us-ascii?Q?iqsm/YuJGabzM92B4x3jPOgv5F06Jtrbu6j16leCGKzfPGPV/x7eHwC/It33?=
 =?us-ascii?Q?lHca0cwNHpal8jVx4MwwdtOIKKDqEjz+i+vlZ21QWAff5spmvrh8nGy7X0W+?=
 =?us-ascii?Q?rodljQ2FnlUU4RHsO0rW5E972sBGfMhVHAaMSKnaiapDrMWZ5YGPMdOlxINX?=
 =?us-ascii?Q?PfKMrEe4KFkdXDwsVOtlh1OtThwLIfaKjXZUvVlpdeRFchF5cZJDeOGunA80?=
 =?us-ascii?Q?yr0hXc2fZNZUvc+NZj1KxZUSl9H0dv/sHO4/C2ELIuzblyRPsGWfBsUKiX8M?=
 =?us-ascii?Q?lkBk1FjD7cmnI1TskXBKRwNbhEWtkW2e7gLRJTWn0GqXtAlDLnPqNU53ZX9m?=
 =?us-ascii?Q?zZf6NgnbTllTBlCdz3XR4SokqsC6Ko24yvP0XY7PlcW1l4w0XfHrHatq/cg9?=
 =?us-ascii?Q?3mYllK7IuSwYfaQJ3fPb3AnOzSZW3LE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qhjOLituYVbLDpzRIs2ku8rFpWUx5qINEAfIHOyR1Si92twR/Bh00qOfYCRQcRkcY+9Bux6EXWANMCAdv6p70ERsXGRegS00lrXYvlOiIWlpgoqRIxzUCRL7OcF1PaP4snINmJRkyYH6ul4ebWLM1vTI43T3r98H6cL0p0c3tTaNbJwa2h1Amwpz/xf7O6zCetCkAlklUXzjrnl3xkiVeJ1POHKICKlhIuqLlOS2v3+8gJSKCj4iZ9n5kFfibHJp8HOMipnRa1XdpOuOoOGUV9zHIg0lGEw+NPz7tu+Wr+jSTu6f61jebzfGN50TZJVJ2hA3+FwWLrqVcyFP80QA9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ff38c2-24c1-4be6-8cb4-08df3063c9c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 17:42:04.9052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TBWwdGRxzQnwkDRhf6JwMmS3n9Ef6NcIHrWCMIe3dOH7lMDfRwqiCeWoxIpdbdg+1bRgbKnvFXwRJKgAnSHE17ZDMCmO0KopWh60eBttp44fojDnLoVz55/H94mLOqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9489
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Golani, Mitulkumar Ajitkumar
> Sent: 22 October 2026 23:02
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-
> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH v7 08/13] drm/i915/display: Add bits for
> Wa_14021768792 for linkm/n ratio > 10
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 22 October 2026 08:53
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Golani, Mitulkumar Ajitkumar
> > <mitulkumar.ajitkumar.golani@intel.com>;
> > Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH v7 08/13] drm/i915/display: Add bits for
> > Wa_14021768792 for linkm/n ratio > 10
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > To support a Link M/N ratio between 10.0 and 15.0, for some BMG
> > ultrajoiner cases we need Wa_14021768792.
> >
> > To bypass the hardware limitation within the Timing Generator DDA
> > (TGDDA), we need to program the LINKM and LINKN registers as defined in
> the WA.
> > Along with this we also need the relevant bits in HDMI_EMP_DATA and
> > CHICKEN_TRANS.
> >
> > Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to
> > track if we need to bypass the Link M/N ratio limit in the intel_link_m=
_n
> structure.
> >
> > Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold
> > INT(Link M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
> >
> > The workaround is limited to transcoder A. Check the transcoder rather
> > than the pipe: for a single pipe the two are the same, but the joiner
> > secondaries read the M/N back through the primary's transcoder, so a
> > pipe check would have them report the workaround as not applied while
> > their state, copied from the primary, has it applied.
> >
> > CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N,
> since
> > writing LINK_N arms the double buffered update of the M/N registers,
> > and all of the programming has to be done before the transcoder is
> enabled.
> > Both are also explicitly cleared when the mechanism is not in use, so
> > that state cannot leak from a previous modeset.
> >
> > v2:
> > -Drop the drm_WARN_ON() on the extended LINK_N field in
> intel_get_m_n():
> > it is derived from Link M and Link N, so the state checker comparison
> > of those and of bypass_m_n_ratio_limit already covers it. (Sashiko)
> > -Compare bypass_m_n_ratio_limit unconditionally, so that a change to
> > it forces a full modeset instead of being applied during a seamless
> > M/N fastset. (Sashiko)
> > v3:
> > -Check for transcoder A instead of pipe A, so that the joiner
> > secondaries read the flag back the same as the primary. (Mitul) -Drop
> > bypass_m_n_ratio_limit from intel_compare_link_m_n(), the
> > unconditional
> > PIPE_CONF_CHECK_BOOL() already compares it. (Mitul) -Print
> > bypass_m_n_ratio_limit in the crtc state dump. (Mitul)
> > v4:
> > -Move the state checker comparison and the state dump of
> > bypass_m_n_ratio_limit to separate commits. (Mitul)
> >
> > Bspec: 49266
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c  | 80
> > ++++++++++++++++++- drivers/gpu/drm/i915/display/intel_display.h  |  2
> > + .../gpu/drm/i915/display/intel_display_regs.h | 10 +++
> >  .../drm/i915/display/intel_display_types.h    |  2 +
> >  4 files changed, 93 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 461b81bf8341..9e9321976a21 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n
> *m_n)
> >  	m_n->tu =3D 1;
> >  }
> >
> > +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> > +	if (!m_n->link_n)
> > +		return 0;
> > +
> > +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> > +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m,
> > m_n->link_n)); }
> > +
> >  void intel_set_m_n(struct intel_display *display,
> >  		   const struct intel_link_m_n *m_n,
> >  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -
> > 2726,7 +2735,9 @@ void intel_set_m_n(struct intel_display *display,
> >  	intel_de_write(display, data_n_reg, m_n->data_n);
> >  	intel_de_write(display, link_m_reg, m_n->link_m);
> >
> > -	if (DISPLAY_VER(display) >=3D 14)
> > +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> > +		link_n |=3D
> > PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> > +	else if (DISPLAY_VER(display) >=3D 14)
> >  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> >  	else
> >  		link_n &=3D DATA_LINK_M_N_MASK;
> > @@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> > intel_display *display,
> >  	return IS_DISPLAY_VER(display, 5, 7) ||
> > display->platform.cherryview; }
> >
> > +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> > +				     enum transcoder transcoder,
> > +				     const struct intel_link_m_n *m_n) {
> > +	struct intel_display *display =3D to_intel_display(crtc);
> > +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> > +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> > +
> > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > +		return;
> > +
> > +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> > +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > link_m_frac));
> > +
> > +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> > +		     DP_ENHANCED_TGDDA_ENABLE,
> > +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> > +
> >  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
> >  				    enum transcoder transcoder,
> >  				    const struct intel_link_m_n *m_n) @@ -
> > 2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct
> > intel_crtc *crtc,
> >  	struct intel_display *display =3D to_intel_display(crtc);
> >  	enum pipe pipe =3D crtc->pipe;
> >
> > +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> > +
> >  	if (DISPLAY_VER(display) >=3D 5)
> >  		intel_set_m_n(display, m_n,
> >  			      PIPE_DATA_M1(display, transcoder), @@ -3504,6
> > +3537,49 @@ void intel_get_m_n(struct intel_display *display,
> >  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> > data_m_reg)) + 1;  }
> >
> > +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> > +					int m_n_ratio,
> > +					enum transcoder transcoder)
> > +{
> > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > +		return false;
> > +
> > +	if (m_n_ratio > 15)
> > +		return false;
> > +
> > +	if (transcoder !=3D TRANSCODER_A)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> > +				    enum transcoder transcoder,
> > +				    struct intel_link_m_n *m_n)
> > +{
> > +	struct intel_display *display =3D to_intel_display(crtc);
> > +	u32 link_m_frac;
> > +	int m_n_ratio;
> > +
> > +	if (!m_n->link_n)
> > +		return;
> > +
> > +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> > +
> > +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> > transcoder))
> > +		return;
> > +
> > +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> > +	      DP_ENHANCED_TGDDA_ENABLE))
> > +		return;
> > +
> > +	link_m_frac =3D
> > REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > +				    intel_de_read(display,
> > HDMI_EMP_DATA(display, transcoder)));
> > +
> > +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> > +		m_n->bypass_m_n_ratio_limit =3D true; }
> > +
> >  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
> >  				    enum transcoder transcoder,
> >  				    struct intel_link_m_n *m_n)
> > @@ -3521,6 +3597,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
> > intel_crtc *crtc,
> >  		intel_get_m_n(display, m_n,
> >  			      PIPE_DATA_M_G4X(pipe),
> > PIPE_DATA_N_G4X(pipe),
> >  			      PIPE_LINK_M_G4X(pipe),
> > PIPE_LINK_N_G4X(pipe));
> > +
> > +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
> >  }
> >
> >  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, diff
> > --git a/drivers/gpu/drm/i915/display/intel_display.h
> > b/drivers/gpu/drm/i915/display/intel_display.h
> > index 404168f4213b..d53b7b4a80e7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct
> > intel_display *display);  int intel_crtc_num_joined_pipes(const struct
> > intel_crtc_state *crtc_state);  void
> > intel_display_compute_link_m_n(u32
> > *link_m, u32 *link_n,
> >  				    int pixel_clock, int link_symbol_clock);
> > +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> > +					int m_n_ratio, enum transcoder
> > transcoder);
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > index 983a0d9dcb9c..bbdbc27629d7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > @@ -550,6 +550,11 @@
> >  #define _TRANS_MULT_B		0x6102c
> >  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv,
> (trans),
> > _TRANS_MULT_A)
> >
> > +#define _HDMI_EMP_DATA_A	0x600d8
> > +#define _HDMI_EMP_DATA_B	0x610d8
> > +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> > +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> > (trans), _HDMI_EMP_DATA_A)
> > +
> >  /* Hotplug control (945+ only) */
> >  #define PORT_HOTPLUG_EN(dev_priv)
> > 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
> >  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> > @@ -1192,6 +1197,10 @@
> >  #define _PIPEB_LINK_N1		0x61044
> >  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
> >  #define  PIPE_LINK_N1_EXTENDED(val)
> > 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> > +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> > +#define  PIPE_LINK_N1_EXT_CEIL(val)
> > 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> > +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> > +#define  PIPE_LINK_N1_EXT_INT(val)
> > 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))  #define
> > PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> > _PIPEA_LINK_N1)
> >
> >  #define _PIPEA_LINK_M2		0x60048
> > @@ -1710,6 +1719,7 @@
> >  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
> >  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
> >  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> > +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
> >  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
> >  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 8f9fb2603638..d0748837ce97 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -985,6 +985,8 @@ struct intel_link_m_n {
> >  	u32 data_n;
> >  	u32 link_m;
> >  	u32 link_n;
> > +	/* Wa_14021768792 for linkm/n ratio > 10 */
> > +	bool bypass_m_n_ratio_limit;
>=20
> This commit still combines register definitions, WA programming, the bypa=
ss
> helper and readback.
> For reviewability, could it be split into: (1) register definitions, (2) =
the
> bypass_m_n_ratio_limit member plus write-side programming, (3) readback
> together with the state checker compare (fold `drm/i915/display: Compare
> bypass_m_n_ratio_limit in the state checker` into it), with the dump stay=
ing
> separate ?
>=20
> I'd keep the compare after the readout rather than before, so it doesn't =
land
> without anything that sets the flag.
>=20
> Not a blocker; the current order is bisect-safe.
>=20

Optional,
for reviewability: 548e544158f8f could be split into
(A) the register definitions,
(B) the bypass_m_n_ratio_limit member plus the write side (bmg_get_link_n_e=
xt(), intel_set_m_n(), bmg_enhanced_tgdda_write()), and
(C) intel_display_can_bypass_m_n_limit() plus readback, with "Compare bypas=
s_m_n_ratio_limit in the state checker" folded into (C).

Each step builds and is bisect-safe since nothing sets the flag until the c=
ompute patches. Fine to keep as is if you prefer.

> >  };
> >
> >  struct intel_csc_matrix {
> > --
> > 2.34.1

