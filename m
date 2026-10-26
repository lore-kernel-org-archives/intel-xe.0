Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE662606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SperVKCL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95BC10E2C4;
	Mon, 26 Oct 2026 06:48:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EDA10E2C4
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792997307; x=1824533307;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uymt1FbqtaIoG+HNSwwNtlF0AgBI8Cvzhx1STyph1kg=;
 b=SperVKCLGyEzABsFNH9aY2+UNx/g48klYA07ij/EKQOa60E32TLdOk1n
 jjhOqIsqkQM8b0bWkUL0eO2lgmqTcpvZks+NZIh1DCGxNuSwHYQ1vxksi
 fxVHp0G2j+hfIIg1FXGf+YP01FLP+FNxv1RjPa//nyYxKrxSJUHfH+d98
 oQW9SOwlTdVIsA01QjeIpxi9jqL9MF3zRZIEzeg/lpSuBntl0graiOLrM
 Xj8UQUGzDh/SAxhz6lsq1aB8Qu3gYMXf0xrNhdaTvQHdzJU85JamIDBf6
 UFTCn+MUSkAs+pGnD6iPzLcnoeGq/HLA8p+7z+VVDwJTTVceUzogJYe0u A==;
X-CSE-ConnectionGUID: 2xZgas1DQ8eLDpi3WjrXqA==
X-CSE-MsgGUID: ADCsR/XZQCWqLAlaJJ5XEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1660647"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1660647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:48:26 -0700
X-CSE-ConnectionGUID: aOEpUIP5T3id2Nu1aDeIRg==
X-CSE-MsgGUID: hVvT2TOERg+qVjqrk3CByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4286922"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:48:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:48:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 23:48:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPxxfSWZjBM1SmXXBwd+6C5AvjJgnQH5H96DiI0nOma0Ev+kIEFt2goJ/I5PFrerBQDia8RmYEhHxSyPOrq+9x/s9xhS44eavKCBoCTw/dZ7ckuGEiapWN7cOYT5ou6FY5eFY3Dmi1qTAyV7pKZQOAzQ6UqG9sjC117YbepcGe+sjTJRBP8JjOC5wAGaRF2L4A3UtE1GqongSgfzpVBqRoCXnfeGjCAeurtDQQliOJnSZrR80nNICjIUhjETwH7WvCnbn1IYy/+PFqCpkwrb4vLViKYNNySiteDUbJvzAJZLzj6lDYDqXWo2CDProX4QueyZIbk+v8tynHLPAgzlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3IEnTJz4EqCLXcG85hRK8iN2dxU5frx8H5ixASfSuA=;
 b=ySsOL+v2DBUNXQydk+3EkJ1zl2LCzEFT8SRK1osoLJnL36R/e3OBvmh6ilmo/V+6pmvjlTe1GorBaQ1aV1S2rDy3ZcFiDpvTm5yTzJUu0LyJMvWtJRVsu4or7myvKhgaTKPz6U1GSJGvp9ZnwYF7ZrSG2m8t3MekEzkZMG/DObL5oK17vy8V6KGDTc0dMzs/VGZRrJAqcCZ4ZsyqaVgbr7HjrTir02PnMk2UdQ8TN7YHw+j24lJTkM0f3C4M4yIHnh6+QNb1BOP3SNcJVI01ZBrFrrDkyi+mDRrAVcA9OPzSq+J5R2l2mZieoDXkX6+RheAWlsFAXrznxs600lZilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:48:23 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:48:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Thread-Topic: [PATCH v5 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Thread-Index: AQHdYrT0NZxhc2+jv0+rKdC8pL2JrrcPZk9A
Date: Mon, 26 Oct 2026 06:48:23 +0000
Message-ID: <DS0PR11MB8718EE3A3657D7646C07A00F81612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-5-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-5-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA1PR11MB7130:EE_
x-ms-office365-filtering-correlation-id: 4f6569d7-13cb-4972-4d20-08df332d210a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|10070799003|1800799024|366016|18002099003|22082099003|6133799003|3023799007|56012099006|4143699003|11063799006|261022075727099003|10067099003|261009223327099003|261009221727099003|261009220027099003|261009223027099003|261009221227099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: 68PWI7424tfARDcqmUbXnpXw+hECsHVLkTdUyDlFdv8ucrOz6WD8QXHW/W78yMC6t95HLf2uaQSt3e88KotnbayrBE0UHYeYDP9oPHjlK57EKmErzZEidA1VQ+dEBq1iNoxk89J4BrKGnU1btZQ5t+TxrqBvkfMIFcBOBjv+cGqXcTpuIAHMtG6UW0IQDwlygvJ4ox/dl8jvtevVh1EQGImvC4esrEqSmnyeF317epEg3BX8CnfGs+xFhU7CWKlPxib+Q81B386GZS8qxA7F8U5QHC71SHHm4RJzlYgZt84HiENx9Vr/RtXfmjjVJB4dK3KSD1qRqiiGg6PvnynicMncj24l5H/x2ph0nFZYo9quM74TWL82uwUKrTweDRAj+PH8+kA06bD0nrdEKVEK1lebPZZGncbuqCMulHkc1+mryjY+nOqHpdIS/DLJIwFdDo9qEyd27sl2phtnFpFO/xuAMg2GEavAn9cJy+2gTSeJg4BwlR56bpqjETA7UxYgwERgVUqGoNC3UFAxRMBPYKv3wi8LaMdclt72U8dxiGeBrmkhq+SWBop9CtRrdFaf8eRqk+0PX1KW+Wa7YplgRCHquv0tF7mszWEwtB39InhDP6YxEgd8J2NTf1VCrsI+blmilzAdKY0TBRNdcq8bGXw4prurvPMNOqCXxAvTiy9kXnv6XmxyejnevHmBqhx4SR+yqmgJlWnWlpwL9i9O/V1U1yth1upQl/lyWVAFD2A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(4143699003)(11063799006)(261022075727099003)(10067099003)(261009223327099003)(261009221727099003)(261009220027099003)(261009223027099003)(261009221227099003)(261021121427099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i6C7lyC0+71Cf7Eaha3uDTVacLjr86kS4YaUZb6imOYMdRrMb8lxqVGYlCC2?=
 =?us-ascii?Q?r7M5LaTJvvfv0tBy0mvxD/hI8kpViW1IDxQseEn4GAnnodOBBnnlfeymjMft?=
 =?us-ascii?Q?YrZtHqaL7J+7aL+cT8Q/8WZboYjpLcKa75g759nIOCE2UpI5KEltUON0zCRX?=
 =?us-ascii?Q?w3EtDKGHUsrpEiSr9Wpyg7Ehue27CDaQmO5ftpM/FeVzqkJ6jT1vPwFBjv8m?=
 =?us-ascii?Q?MH/Syt6Pomyz5AevaDApRxhHLIQ0hoqx9oZDHJEFKumJj8XgY/UpoWkrhnhG?=
 =?us-ascii?Q?+09f3OO+z1Xsf/RZhPrntyWLWIbM7mlGFd09cSX/kw8LjkJA5Mob53loJVUG?=
 =?us-ascii?Q?6sV6t1PTXA5nJJSVjf9qxMBhIw9tf5/ZDU4ComKrQUgZg5bf/36iJ2TEtnEG?=
 =?us-ascii?Q?4qq8mStqPLErgJJd9l/r26CAw3TUzk+8k3RDXxlJsKa3+aDbd5pEgcPbG4Jf?=
 =?us-ascii?Q?0S57t8kbL3WPINJsPiZHdymLrdRvtkhw+y5vLEZbEwKXqq6xtFtZvjPbvdU9?=
 =?us-ascii?Q?6OhkSUzIpg8mVy2U54EUEvwpyMswmSoUF4S9T9hwLp+4bW1dgsVahQHsX14a?=
 =?us-ascii?Q?/OFu9Fphrf+o8dbAuvahim4flGNRu720+qfN7rSENiOpx7cHKcTlBOWt/09m?=
 =?us-ascii?Q?NMhW7opb/KGl1O4CHgXfUofC4QFBBuFbmAYpHM6pe3z1i+FpMEiDRMMYjtsE?=
 =?us-ascii?Q?bJA8aUMg2TCdE9qJchluplDcwpK3D6E/dRU+Jdp7znPFDUAnHPgfobOatS2E?=
 =?us-ascii?Q?VWJfQm/9rD4KN9wGD90RMwcF6d8DPhmoWQlO8boXijHOKR7QotsWwQob128X?=
 =?us-ascii?Q?cff2Tbiz/+fP2vmub5ccoJiuXxyjg9nINrH8n8C6/niz80seuHqF/B4toXBv?=
 =?us-ascii?Q?qdQ2e1le4s1hAUOyLn8xf8w10RIu93fhSu3A8v0Y7tgAeP51jAlQMX/ueb/J?=
 =?us-ascii?Q?QBLnAhqfNkZptrPmtWF52NmvEbPHKTLo6uo3MdLW0N+JcAau0GI2hod03QEP?=
 =?us-ascii?Q?eZRWPdM6tMsoQsJHrpqf3V9ttxLCMThOouA3EoSE5N0f/is2F6yDmytL92I1?=
 =?us-ascii?Q?i947986PnjuYM9+oogeK3SSTuTjDdpEzG99xMCBe7WvHIXKQZOYm5k5bZTu3?=
 =?us-ascii?Q?NUgFbDU3VeJHn+mdIWUgJWQzOYCH5DYqr/74bPyuhCid18Qte+7aKxzkxQfA?=
 =?us-ascii?Q?XFNZ9ufoYg/f1AvdsHPifw+GnRUsdMHiIlKkmfW2KO7Wk7nRoDhx1INsn1b0?=
 =?us-ascii?Q?baOyFCeMbhsVpUvdm1UKRnT2AsJgDoAJcYd6/k+KqY90xoPLvAGq1QmcpF+j?=
 =?us-ascii?Q?luDcAhhbTborxjvihri1lDsw+aCgCajlNzCH6wTiXat4ry3e2pZNV8bYJk88?=
 =?us-ascii?Q?j9raa2of18WR9hP4rrvhYqbISvFXtLtcbpAwvbTX7DDN5uofuvWzwu0Akflw?=
 =?us-ascii?Q?l0P2tKIfKowjBGj0+q7fFXFnUCnurv7/ixOjpYPYh2dGLyZPk1A/LUpfAP2N?=
 =?us-ascii?Q?s0Zip+cRCzEm0VOAMBrtzjtP9kykiG5o6RZwxHTVJowOqRnzZ4CvsBLTjoAO?=
 =?us-ascii?Q?z8joi9H02N8TcWajTQYhUaQyrtI7DWSEu8wiAfi3B3xwSKtmd+U7s1oqQiBv?=
 =?us-ascii?Q?jXJX+vgwUIF6FFQKbKK3m3wrOTWqLtT9E+st7HMbR4f7PjYjUGf/AVeLZ4ev?=
 =?us-ascii?Q?hPJy3+5pgkQfJgL8l1q0lbNsMADWIn5/OwFDwk/FnVeBzAO/YQrYz6f8ZvpK?=
 =?us-ascii?Q?h/1ppgdmtpQ/FbmIDQ+nK7VGT1dPVlISue4irOuafOIDWigp13kH7GFKR73Z?=
x-ms-exchange-antispam-messagedata-1: N7ZqsrCSDKAV7g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jDvv3IJR/b7XH1DX0YvBHxbfmDgqFM77R2+rhrkSaqCqB8qPrm/p5mL3fjhaI4jZ1jQhiVzdiH7LFsZfA8rJQCs1MwYuoRFcanHVtkx3cluc4iRlxw5i/q0V8P49SGrfioZl0QiqeIXgoeE2/qX8F4yPjnI/1RKxRI+UbQq9GcH8T/mNvGQH2tdTt1oDkKSXVS0DxgcSRKtJ3+gSfC3gfs9zvzcNlCC5gl1graGlTTlDxt5cQ66pI+XE6tSmTFHGXQ+4NN6JazJGm8Deya3eLpLo6sUzsVvcHo82EOxOaQ2mb/qiHFyQlSoAiDsRysVRr+Rmw+QJrb01zeesLOfsUg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6569d7-13cb-4972-4d20-08df332d210a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 06:48:23.0452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyYeh4MSRWk9Xhdko89UETQtuZR+YQ1FnKPd43kKCfGmmsyd1lLLL47TIh8RPb7VXhoIqcbFTbxKFFcO2Lb4VygFupRtmd5kfSEpUOA0iSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 23 October 2026 11:36
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 4/7] drm/xe: dump GAM page fault report registers in
> devcoredump
>=20
> Add PAGE_FLTRPTQ_HEAD_GAMCTRL and PAGE_FLTRPTQ_TAIL_GAMCTRL to
> the Xe register definitions and capture them as part of the devcoredump
> snapshot.
>=20
> Include the register dump in the devcoredump output and release the
> snapshot during cleanup so page fault report state is available for post-
> mortem debugging.
>=20
> v2:
> - As design change made for previous patches. refactored this patch
>   as well to accommodate those changes.
> - Add PF occurred print when the two register values are not equal
>=20
> v4:
> Refactored as per the patch1 change(Tejas)
>=20
> v5:
> Refactored as per patch1 changes
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 37
> +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 ++
>  3 files changed, 43 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e93895e0c731..e9eb0bd04af1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -530,6 +530,9 @@
>  #define   LMEM_EN				REG_BIT(31)
>  #define   LMTT_DIR_PTR				REG_GENMASK(30,
> 0) /* in multiples of 64KB */
>=20
> +#define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
> +#define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)

Apart from all other previous comments applied here, PAGE_FLTRPTQ_HEAD_GAMC=
TRL (0xcf90) and PAGE_FLTRPTQ_TAIL_GAMCTRL (0xcf94) fall inside a documente=
d MCR (multicast/replicated) address range, so you need XE_REG_MCR

Tejas
> +
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188,
> XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 49a7c020a161..8d59f80e2929 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -114,6 +114,11 @@ static const struct xe_reg_desc
> xe_dbg_media_gt_rpm_reglist[] =3D {
>  	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
>  };
>=20
> +static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] =3D {
> +	XE_REG_DESC(PAGE_FLTRPTQ_HEAD_GAMCTRL,
> "PAGE_FLTRPTQ_HEAD_GAMCTRL"),
> +	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL,
> "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
> +};
> +
>  /**
>   * struct xe_gt_regset - Struct for register descriptor list for GT
>   *
> @@ -133,12 +138,14 @@ struct xe_gt_regset {
>   * @XE_DBG_REGSET_FUSE: Fuse register set
>   * @XE_DBG_REGSET_RPM: RPM register set
>   * @XE_DBG_REGSET_GUC: GUC register set
> + * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
>   * @XE_DBG_REGSET_MAX: Number of debug register set types
>   */
>  enum xe_dbg_regset_type {
>  	XE_DBG_REGSET_FUSE,
>  	XE_DBG_REGSET_RPM,
>  	XE_DBG_REGSET_GUC,
> +	XE_DBG_REGSET_GAM_PF,
>  	XE_DBG_REGSET_MAX,
>  };
>=20
> @@ -161,6 +168,10 @@ static const struct xe_gt_regset
> xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
>  		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_gt_guc_reglist,
>  					  ARRAY_SIZE(xe_dbg_gt_guc_reglist)
> },
>  	},
> +	[XE_DBG_REGSET_GAM_PF] =3D {
> +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_gam_pf_reglist,
> +					ARRAY_SIZE(xe_dbg_gam_pf_reglist)
> },
> +	},
>  };
>=20
>  static void xe_dbg_reg_snapshot_print(struct drm_printer *p, @@ -202,6
> +213,23 @@ static const u32 *xe_dbg_find_value(const struct
> xe_dbg_reg_snapshot *snap,
>  	return NULL;
>  }
>=20
> +static void xe_gam_pf_snapshot_print(struct drm_printer *p,
> +				     const char *title,
> +				     const struct xe_dbg_reg_snapshot *snap) {
> +	const u32 *val1, *val2;
> +
> +	xe_dbg_reg_snapshot_print(p, title, snap);
> +
> +	if (!snap)
> +		return;
> +
> +	val1 =3D xe_dbg_find_value(snap, PAGE_FLTRPTQ_HEAD_GAMCTRL);
> +	val2 =3D xe_dbg_find_value(snap, PAGE_FLTRPTQ_TAIL_GAMCTRL);
> +	if ((val1 && val2) && (*val1 !=3D *val2))
> +		drm_printf(p, "PF occurred, refer to dmesg log for PF info\n");
> }
> +
>  static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
>  				     const char *title,
>  				     const struct xe_dbg_reg_snapshot *snap)
> @@ -315,6 +343,8 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>  	drm_puts(&p, "\n**** GuC CT ****\n");
>  	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>=20
> +	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss-
> >gam_pf_report);
> +
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>=20
> @@ -369,6 +399,9 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>  	ss->matched_node =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
> +	ss->gam_pf_report =3D NULL;
> +
>  	xe_guc_exec_queue_snapshot_free(ss->ge);
>  	ss->ge =3D NULL;
>=20
> @@ -565,6 +598,10 @@ static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
>  							  other_gt,
>=20
> XE_DBG_REGSET_GUC,
>=20
> XE_GT_TYPE_MEDIA);
> +	ss->gam_pf_report =3D xe_dbg_gt_snapshot_capture(gt,
> +						       other_gt,
> +
> XE_DBG_REGSET_GAM_PF,
> +						       XE_GT_TYPE_MAIN);
>  }
>=20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump, diff -
> -git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 52db64640f89..34f224a6751f 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -103,6 +103,9 @@ struct xe_devcoredump_snapshot {
>  		struct xe_guc_log_snapshot *log;
>  	} guc;
>=20
> +	/** @gam_pf_report: GAM PF report snapshot */
> +	struct xe_dbg_reg_snapshot *gam_pf_report;
> +
>  	/** @ge: GuC Submission Engine snapshot */
>  	struct xe_guc_submit_exec_queue_snapshot *ge;
>=20
> --
> 2.43.0

