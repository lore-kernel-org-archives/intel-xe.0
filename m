Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09C606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9fQJJNw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D00B10E58B;
	Fri, 23 Oct 2026 05:09:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5A210E58B;
 Fri, 23 Oct 2026 05:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792732189; x=1824268189;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=goFSAcnTdHkL4IolwTL1vZ4WzS5yapFB0+OQL3+bjLM=;
 b=b9fQJJNwnSbnKqNhE2DPjWHmk7XqTLz555IF8La0cSYF4AZtSP8yKlH/
 2/DSRuUjGaP2HhO2yitlQ8FT3JZBQSsPcYaWOQ3dW73wjHE0vc3uUfRMP
 ptaliGzF7Dn3W1Q5YR+pIOJp8h5YdN7rjwnagx6c01cmDP/Cpf67zL6ji
 pA3TRQ0r8aVlH1JrV3JWSi/UHcsrWOiY7XIh/VbhTRpeC25n7NLrDrOZP
 +P6zWxVtuyiOis9dPQ2OTNS1vVSwQigCtz5dLddVhpiGQQdDcYhqMQvL1
 IjXwPqSkIpu1cMH+p/PIAzsJxepTDdxfeorSUJebSeEtCYxfjFMKU0WF0 Q==;
X-CSE-ConnectionGUID: BuJhCj/zRGa3ZMpgWGz3lA==
X-CSE-MsgGUID: p7YiZ7jaQtqFfaih2enamg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1502852"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1502852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:09:48 -0700
X-CSE-ConnectionGUID: mZmGq3x+Trm1aMesonLgBg==
X-CSE-MsgGUID: hpIImAQfSj+WxVX1q8tyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926149"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:09:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:09:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:09:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWYQwDbqszV+S9Agf7fS/xBo5WDhR1OMxdadN9lsoJSsmdPO1CcODj/9EKYShlUrWHLpWMrH/MI7PgHvDjP1LkYFXIYrhkkc35vCj8FXpTk1XGV/t0iJ6DqHoUpvxKJQkuQrsn0TECcPtt/0y6n/mvzDqlRG6q65DfRC7YuzN5Ua0dXYYr3puKkMKaLoxxeaNJy+xkigQAJ5dL+u6zC5v5C9kiaS36Xf6RfbKwNXk1msF2MYrnK7rlUUWFdhQbLL5ILPyOJz3CtcLKsqYu2OqAhCXCe0DNs9nyxE3qStwZaMI6PF/xJlrSjQWMYpXWnDTA5r0QHjKFB34Q2maN72OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYe37Urkww3pl4dfjCkBsbKgAZ4WD1v+Mdsl4Bt6Bog=;
 b=O+hA/FlvN8JH7WwJpVW+10gbFChSroIXo4fjQhhUsXsJ2cC1Qc8hW7ZAWJO9tOK84ClAJpF0hru5UE4Eft53Mssf++nHDziVakLN31QWobW5SU1snde6LWLjfsOZ4OlvK5v9JY1kAwIIIK+OQwsguKsDUDxbgRz6mAolwBO+vzjhaSEzuP647koPDNweyNPNcI9+SIqqktslvIn2njrYqOXaB8DwweHOZQHe5ELqnBt9WXMFU5xGTJ5dA9oR7XLZRZFBzsg9GYCROkCLy6lKCiaEAMZ6sEPR+mSWEgskSKuXjM+K7nKKBUleaDJQAVh+OIsKUqU9DDExnh6I2TNa2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 05:09:44 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 05:09:43 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v8 08/14] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v8 08/14] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdYqvDfQiSh3CJCUSYBQkHgjDo+LcKk+SQ
Date: Fri, 23 Oct 2026 05:09:43 +0000
Message-ID: <BYAPR11MB37831E2C81BCA0EEB1607AF3B2642@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
 <20261023050227.2068466-9-suraj.kandpal@intel.com>
In-Reply-To: <20261023050227.2068466-9-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|PH8PR11MB6612:EE_
x-ms-office365-filtering-correlation-id: fed24374-8576-4bb5-c491-08df30c3d9b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|4143699003|56012099006|260925022911599003|11063799006|260925021311599003|260925021911599003|261009223027099003|10067099003|22082099003|18002099003|261021121427099003;
x-microsoft-antispam-message-info: tvD/uuW7m3zOeCdwucijd++P7a3iMOEwocg6AXdTxaemVH46z22gQ9D13iAr0o11bhC/hGFxaU3CzVqIHrk/eLx5lu/j4E4m9SKw+CSsFVpeHf1yFrudjJugZIhO6TXxk2DpV7BPBNnfNyhn1r3to3SC79UTWd6G+m6/igBg/ORK7G5odCsg4ELVxLAG+kulWg0XK6oeCQlrVs3lh7A/p43PVZmlXRtDnS7FRseMVOW5yL7b0zLfmFkP6h4tPFnixCW6d/DpbaSdv3G8SQIy6oh3CbmaPdUgeA1xBAiMY67iPP0AXMuxUF3dpv4cCJ7rKxCe8WsXtH5XkaM/w4x/nSLG8EbbSEUom8r7gak75AHMaXPyFhJUYwV8qFv23zMAipks1eSBhwQuacStBAH3OlggBEgFVHCQYLdvXGP+WZS+lcg6E7D7bM1Jjb/v3V6peBHUUzff2rJN41kjhz1c2inGy+MRv9ZPfGORc35O3kERHA9Qh+oNEEHF5RG3mazNLyVWTZe/bA1gJdheXhOUQnjxxyGblslXxEk/MFk0ZQ48Y1NXW/RyIRyH9UNKpA+R97e0f5Sb/tQx1GP7K4cvSTyEfHJ6llKWh2euPaJX+oObYj1huQ8DV+uYZmfhmIqoXTu0Nd5CTk3WiWvG76U/g/FW8COwH96lc0zvVrq7fRmyPFDnWV4ovSzNe86lENCsiUX2sESnveNNUaYqr/pLmok1nfdNx2uxNomc55asSdo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(4143699003)(56012099006)(260925022911599003)(11063799006)(260925021311599003)(260925021911599003)(261009223027099003)(10067099003)(22082099003)(18002099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QITsVa0tyBomG4LLU4MnOp6kqgmX83hiNQmt+goCMzOTxzB8P/FAGzDM/s/S?=
 =?us-ascii?Q?Jie/4EBYJG1sXFqqFFscSRjh4oaYX2T0qZnjk0vWfA/b7tBkVM+wgsoqEbhz?=
 =?us-ascii?Q?20rsWkjeByb/qNRBryJ+kizVT9BU0FUDyGNvSRY3urZRBFrsOvDE6wumG1tg?=
 =?us-ascii?Q?UeDzb7EWjJrhZpyf+RxB6Aob4dC7B6BJEuW08gMPkJSfPcUY5n1avzUp3pAS?=
 =?us-ascii?Q?cCatYCEJL4nI5ZwDqT5WzklsShCmykcqyYWf/Ueq1bzjxU8ht2I/eKaPFWy6?=
 =?us-ascii?Q?cfdJ4wjjndiFcmENOwphXHyF4EmRMDIJCL11QEaF0ECLUUBKZBWJZoHQQZ8Y?=
 =?us-ascii?Q?30jqq0M3rx3zeFQRK3ka3ishGIeVZDyyv8y/yO7hAhKn0jYmHhg48XRuzFEs?=
 =?us-ascii?Q?51lIlpod52qN4IWkqEPpTrzG4FcqVKFaz03cG/ZmFXrpY/qwwHAG3zzy0oh9?=
 =?us-ascii?Q?nwBTsSqyR+sX+SDum+Ox4FF5C9A9QsGwWkOOvKWX+7NOwbhFuyY4NMO6iI6H?=
 =?us-ascii?Q?5FlAJwPwsh+Py3afjUJFBntXCSwfhou4xAt8R6PvlP4U2igUIQOgkFrJv1Ma?=
 =?us-ascii?Q?LSSxeUUOzLOmmMFd1dfd1HTOa8izihOtqJCX+9jJKgURlqupKBnUuOh6t72q?=
 =?us-ascii?Q?eGEHf0CasBbHbJLADc59KucLz21gV2b4REUHtgPhoSZsnF+tJasm9FP8R2M2?=
 =?us-ascii?Q?XsiJNCepzQ+JgZYkEn2VbL9esE8HnT56MXdJkzOWoH6HTy5LfIbzxP2MFcNc?=
 =?us-ascii?Q?Gq+rzAQSLVI5I3wRfcuBG34IADiKGwJZs9EJpwfDRqrDKRl8XcHLbPYFSHam?=
 =?us-ascii?Q?xp19p0FKOTVojXrHfUJyKY8dE5iq/VQ3xXk5Oq7jNXhwByMdbX1eO3t+To+2?=
 =?us-ascii?Q?YYVmu47pkw9aHPR9Be1BQzG5nCxzDCQ/snEHhaoZAMCz3Nxxq9WwWcDP/4xM?=
 =?us-ascii?Q?gD2EOEocyKCnL5/mfmwXv9pbgx7WhE+P36e44uB8HtIJOIj7YoyMtLaOfyG+?=
 =?us-ascii?Q?2/K4Q08HoNL9wiMlEh6/stUxmmjM92PUu1UfnF0AAzCjjPdIel4fD32YnryP?=
 =?us-ascii?Q?V4nF3U6jAt6tloikS5FE5bExoe8tSGzDZeDIqCYJ0JiD68THhIYCOW+gzYmh?=
 =?us-ascii?Q?EEd8sjiYpvNITgmh4mZ4MCjCySDG1BK7nHW1Z2AkDpZzg0AcO6UjWDNxmblU?=
 =?us-ascii?Q?PKPOhOJdiuRHuYKdZuJbSFGCBGplR89ImxTJxRAoWSQq2Pv/VLAYUbIzI7OZ?=
 =?us-ascii?Q?9BeBfgw4HdHFMGopWGC9JPG8KToOmS3XKvkmfxe9a0NARL1Vtsq/SjXkuheO?=
 =?us-ascii?Q?oBy5hhLE2vB9aP3FmfsLdYD4L0eErWBdoHmKkPQxEdzNtcVs8z/LwM+pqxTI?=
 =?us-ascii?Q?/JvLMECfS90EoNNZk/OFudG54WrZVYwx4ofXdZvb2t6/CK/+ZrGlk5NnyjlJ?=
 =?us-ascii?Q?TPor8a+Kk4kmWHDuDvimGGLXErVb1XTbm+M5odfE5MWXBAuFcA7dYmK9oE/T?=
 =?us-ascii?Q?vqPZ/qeIwI+MOH7AIQL9SNuI5Myp6f260Dd9wVOeNvzLuJSi+4N4Yq1yyG7+?=
 =?us-ascii?Q?pNNjVENlT7iErbBO0idtLUo0fVHR1mT+2T3jiwUY1Sq/2HO0enPWnqNR8/5Q?=
 =?us-ascii?Q?nJGeMJBnD1ofxoAgqVCfsgbzZdpx9rMg+bXFgf51belCaIm7pAB+zKn6lzg+?=
 =?us-ascii?Q?/cMZD89cIQLC8NvCJfq5RjfQfJC1t9EnrolEiSF4B1Ky22Sxd0JmWqcOveqZ?=
 =?us-ascii?Q?DZIzDMRXy74EPNJt7HfvIWvHZGdogDf887HZ+ZMgewryAUOyuTCo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: t9S7Mg/0Xhh09VZ70+USj9WhUnAlhxvwSNbpht/hZxM1LLuog/plvWJ2hukpEMLYiVFygcYhuSIldYksK3ew+15jgWVjpHKHllw2PCIeeWdWk+GBQEir648r3JblFbR5m22idFth3K5LJ4s8m3lu2GhEYs7fYxW+24txzSYNCgKaA364tQRia8v5rEQwHrAaBFfU62TCsG/b+OOFxU+qdnQifn3QWzCeFke1CzYHX2BLc9Nu1h1E/7u5q1F2tzplvbu6qQ3lV5E2lmmtO9F7dx/gvK1VCFySODgZMlqsFjhxhIRaYmsvb0wTe/ajQyiwtew4dJiIP66Fsn8BQAzz+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed24374-8576-4bb5-c491-08df30c3d9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:09:43.8579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eu7d/q2IlXBsH5Gc6v6yIeRv9eYeLbw4kvgmjlXG0vwO0UXOG3xiS3EB3AgJEyFz9+SKPybCKIry0uYjoM7rnPaL/ipStaSVz4xV/WxRI9mI5Dd8Py/mN9tncIpEZwaV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 23 October 2026 10:32
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v8 08/14] drm/i915/display: Add bits for Wa_14021768792
> for linkm/n ratio > 10
>=20
> Add the register definitions for the WA: the INT and CEIL nibbles of the
> extended LINK_N field, the Link M fraction field of HDMI_EMP_DATA and the
> enhanced TGDDA bit of CHICKEN_TRANS.
> Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold INT(L=
ink
> M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
>=20
> Bspec: 49266
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 983a0d9dcb9c..bbdbc27629d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -550,6 +550,11 @@
>  #define _TRANS_MULT_B		0x6102c
>  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans),
> _TRANS_MULT_A)
>=20
> +#define _HDMI_EMP_DATA_A	0x600d8
> +#define _HDMI_EMP_DATA_B	0x610d8
> +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> (trans), _HDMI_EMP_DATA_A)
> +
>  /* Hotplug control (945+ only) */
>  #define PORT_HOTPLUG_EN(dev_priv)
> 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
>  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> @@ -1192,6 +1197,10 @@
>  #define _PIPEB_LINK_N1		0x61044
>  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
>  #define  PIPE_LINK_N1_EXTENDED(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> +#define  PIPE_LINK_N1_EXT_CEIL(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> +#define  PIPE_LINK_N1_EXT_INT(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))



>  #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> _PIPEA_LINK_N1)
>=20
>  #define _PIPEA_LINK_M2		0x60048
> @@ -1710,6 +1719,7 @@
>  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
>  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
>  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
>  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
>=20
> --
> 2.34.1

