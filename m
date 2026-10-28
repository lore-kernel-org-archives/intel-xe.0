Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE1606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DDqbtlg3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEED10E3C3;
	Wed, 28 Oct 2026 13:30:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CB010E3C3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793194248; x=1824730248;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eqRrVEWRrczxtWtmLIyhRaNXcKmBb95F+FOUDe79kWE=;
 b=DDqbtlg3K9bZtMLrXB6BC1NJSzrRjm3/UXq/gS1Ox/xpnUXYAD7UCt82
 wiOzYRHudoKqg1p7FgE+XEI7FWTJyDa8tdX4Jdu637oKpwYKV2iViKpH9
 NKr/lM3DOGwGTjH5z6ahkWjeTHKyw9SafDrswiwJ6A0V94FTTpJht4bS3
 aXLelub0U50fTMcOB1S3TQHwEoDQmg9nsokLYa0Z5+PeWHn2fIqqoKvTz
 4SnK2Jv6VZxRyHkIeEgg5IEiKtRuqnxQUhfYZP+UAR2WZ51TJ6mrX1Q5/
 pR6iZKUpjJnLu+rs94csX2LPQ6pm6vmvRgwAkjrtYAHilOwg6NixE8mtd w==;
X-CSE-ConnectionGUID: BNPYYL4YTXij/qrhhV72gg==
X-CSE-MsgGUID: 3d4/KOjpTVS61zgI/6in1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2006853"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2006853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:30:48 -0700
X-CSE-ConnectionGUID: kOqffVi3Q8mp2Ak1leYVfw==
X-CSE-MsgGUID: zw/wVx9hTkOmO52S9vcCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4940188"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:30:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 06:30:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 06:30:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 06:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQu7gGfBPKVTWTtNKirUluwDcp8A+P3K1baFixBxSHnN0lgypwEDLAP7OHhSZF4MIyk8lR7cQuEH9UToDNKr/sr5U9a41hMUJb0fKdE/jvgGYsuuVCmYYWPXfgpbKVH5/RRsvwoVhqwmUYmth/zqpTQaeu9ZJtotfBDs1PMxAMy+ufRxmvZJ064te4Bk+UYBRe+lum5dhe6LbMiBHf9XKmQlrroRgLBApjAqopQUU75KcfJ2PzildT9tMy9tmtP5ve2sTACxuaK9sQ/QzuKHGnSFBw19OqAEme2oUaiCkIW6im7DlEZsYYsK7qA/WzX6jNWpioC3n24KvfneQyE3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o4yqo4jtCUltQpQWFWD1mAkMwBZGaQrsQNeo8SDSsM=;
 b=FAJ1AvCLihQm1dWr9Yd2y1G09AJw2vO1UZS5jeliVuz+vFXtN2aJvMbGpAt5Mw0DnSo9QYP5Q1CnNBCXSj129b2wbhJls+1xyYehdLVsUDLMTVuiph2rhWW6d2GeTVfa2yLcm/GYB/3UnUQ3tNaO34W9TVsWdwJvwY5t8AOoPvZWkYvQalqexaeoVNjUFsVkFofxCAnn2ROcWKq6nHO+Oe+WCmWpG6QaddBge0O4k50tJQznU6gRSJdfD9GdIizvUOobgM8gJSkZJcxGE0zTT6lAOCVnJXEku+kF7hOaMyponnqX/gP9pfjyZ+u+InbRTA49AhM3SV/C/WxwhiGhfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA3PR11MB909395.namprd11.prod.outlook.com (2603:10b6:208:548::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:30:44 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:30:44 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Topic: [PATCH v6 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Index: AQHdZdHcUzGb9ruSJUCppiuEXtQwTrcS9Pxw
Date: Wed, 28 Oct 2026 13:30:44 +0000
Message-ID: <DS0PR11MB8718DCDB275DB04EB6B26F43816F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
 <20261027051024.465587-2-naresh.kumar.g@intel.com>
In-Reply-To: <20261027051024.465587-2-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA3PR11MB909395:EE_
x-ms-office365-filtering-correlation-id: fa6fb80b-0195-4562-ae06-08df34f7ab30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261026140227099003|261026130827099003|38070700021|11063799006|4143699003|56012099006|261026121527099003|261022113327099003|261021135927099003|261022115727099003|261022105027099003|261009221727099003|261021123027099003|261021121427099003|261022075727099003|261009223327099003|261009221227099003|261009223027099003|261021130227099003|261009220027099003|10067099003|3023799007|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: tjB//1BHPCDNRwGK/Rg6joD4HJzS05SB5ia/2vBbZXRijySXaJtFdbcnii9L45oulPBS4aiSqI3INYOyO3eid1iUqmNPfNyXVjTbGwrpSamd5/0KGvQ8Xg1aaHk8af2QZ9wje6ZYCOLc0AE9R1lnJO3Jm2ehvSi6txU/mWM93V7bxVVp7zr2icMGw7K2R7m+2htE/NO37G282+JFhrNvCqfWD8XVjiFnOtHbOQ5r8F7Jg6Lbb2QX05bXg1SYw1DMucwG40e8ukBrnc9IWvLnhV2pF3K4Gv2udUEfOYgEhJ8HKwmI7+02BT0ZRPGqwfPv9LWyGrNS9C+x/xel0PkDXPuZ7lGiuogc/bWHE+cR+NKBEZPzSvOJoulZtROiRnsat+OBtwYH+9rouTut01tHdOzFo9xs4Q6XVnn1TEas2hUQ3OOqu+5ZbrK4XZjp3Xt1URrTNtq6yDt3TUov67k0BTAg1Qipj2BH/CjQT30Qtsb+I0mJ81VTyUfxE1tmWZ62+hk0UNglW0Og4OzVM8gymdH35IYt1q6nq4VG6ey5KW000gQlmwUJvFGoOQ6/ewI4n4ExzkNUYgdZRYcqb8DWBJP3On0mVDUdlcnMVi13l3x0QK9CQK5bfVmKLVi+l38TwL7xPM2qAStQHe555Q+HgqD02JbrmWq+6mRe/LwgJAAhfsoWZMKhhKeC7m5Irw8EsJmpbLWDLD+8x0x/1e1UIvTSDCCxuSq3nPz8R231+Fo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261026140227099003)(261026130827099003)(38070700021)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022113327099003)(261021135927099003)(261022115727099003)(261022105027099003)(261009221727099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223327099003)(261009221227099003)(261009223027099003)(261021130227099003)(261009220027099003)(10067099003)(3023799007)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bhwxDU90z17pUSeOrzUXLiy3XyaPjbadO0oUOOUm0qCwJIM6+H6RC/JUF3yg?=
 =?us-ascii?Q?i54Lrj63CyHg37q0x+qeaH/N9Kx9lYB1hMlWgNgMAEBm7XZzsACKCvCn0M/b?=
 =?us-ascii?Q?lu4ZPwkJXKr7VWycpZ77eo+rzPo3ZG53ynvOl6Pbbnh5hLIbxvx8Mf1SZepT?=
 =?us-ascii?Q?tc7nbHzbm9Bmv+DSMdWXaQdusMIEBiRs+US3G+BxyjT6+Zha2We0KkJ1DjaM?=
 =?us-ascii?Q?R9MuvOQa98LwZshfRE7qUWfGqOBuXTRKevmmYhg392HI80yMFlrJpq2p6JKS?=
 =?us-ascii?Q?twW3iIRo+oUQq6MkIklYgk4vUNjddGt2i7SK0uwRUwfHjCXqrE4zgbxdz7Kz?=
 =?us-ascii?Q?yJXBZZhjDnR05ehOO1xOzuNNCaU/9I1sXDXchcEKPlHzxJxQVQKuVZ9MXtxt?=
 =?us-ascii?Q?SKJgfSS5kiZxQPppYqv62i1TG0KVJpJf+neM731jJjhsSsl08SrWRS18Trvv?=
 =?us-ascii?Q?5EYZpMNRampd4t0k0PgbYOW11WVOHEM31WBCVHjDZ2FZNy55TcuRfy71Rik1?=
 =?us-ascii?Q?W3npOixoCg6SgUuWrPCvyUlFwXocq8GCu5V31lzpVO1zRKO/fUnPHqw41RWQ?=
 =?us-ascii?Q?xn0tLmS76LdVCAwBsBr/y3PxR2p0czl/FlZdxFgpCMU/7XP60ChUI/zzPqGQ?=
 =?us-ascii?Q?vqguY9Moty33Y0cZJdWBSCRBm2mSG65D81c/B5Kmzs1Wt2ZR9HudpbsuY4ki?=
 =?us-ascii?Q?6bvsfUkQBT3XzogL+TT++fyR/kr7Qm+/F1s0pXe8u7GnoXIjyZsJjzd3Nauv?=
 =?us-ascii?Q?+Arw4vprP+9XwJ5rpFdanSocsir97ozMFHqZEE8VOj1r14aYZP/jK5QV3AjK?=
 =?us-ascii?Q?5jKfpZUJgeAaQFFCnBHpE3zwny3gPxgySaXHnRdyRAn2kvNwJuTFZnGon7xE?=
 =?us-ascii?Q?CL/+JkZy7oF9PHpnnuV0ZMAsfIeMytg0FySazLR6rwMUTOREX5HQPw5eBIvj?=
 =?us-ascii?Q?xb/YKcpjFaWYWbp+R2qc0JGXUWSuvTZeSvRwGdMNa8wFYn8soHbAiK8hwtrk?=
 =?us-ascii?Q?0KJc5Gy5Iy3YBlxM503r8SkWTwifVnL3Z5I4ExB+3KDdFYWsbnXzG5cI+Rb5?=
 =?us-ascii?Q?b4pT3Qtq6/AgAD4klWbZKxJNE05UC3ZDPXvRBtFiEncxlVt2vqkgApInJD4g?=
 =?us-ascii?Q?AvQ2iE+hMBZo0kqv4OKlOyIhI/cDfMspVkGz0GZnbwJCuOBP/F6BDVeUkIw0?=
 =?us-ascii?Q?oTpBQIuBZl7o4HuwF/vLVwPWeqWATnv0ITMYkKIRgy0G/D5gcK4EYvpttxSf?=
 =?us-ascii?Q?WcQjM32Jpx7Fg2f7kZE/vqtwhxBoPFvf6g4M82i+autu0fH6ngSdBoVEXvhn?=
 =?us-ascii?Q?jBjq7qbawNuimdJBx7aQYz1hWxL/GlquO5YyPbWb6xE5D/SYh+brT3JtZU6w?=
 =?us-ascii?Q?9YhYX6JBFAyMh2YPbKq4w17yVnGTzEE73ojNVn1Ys+YwV7bPyeWye40FRG0c?=
 =?us-ascii?Q?phAFrcv7ojYghIRZFS8r0LalFxBayloWMZ8+46rq80m/55VQKVQAloL+mI/W?=
 =?us-ascii?Q?rHmPEm/IeHZ4t50/FEXKaCE8giraAMzB+SWrLS+pqyVcNp3J6XGN9+g7XDNS?=
 =?us-ascii?Q?nuKxJTK1zY6mwgkztGvuEwydmzR00SavJy+ijfgXrQITXMeWhoCcTKsaUVvF?=
 =?us-ascii?Q?cKaQ2DF2VO7U/0oBktaRyDUIVCdSEp+mlJgVGZ5bJaY+xhOIza5zX66gwGaj?=
 =?us-ascii?Q?hyNeiVyQEF5hd19cFPA9bL16/Lb9gzaQzEfH+0J8O49KHc44b12FwIYceACV?=
 =?us-ascii?Q?Mud54K6WYg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bdbRJF8f3J7k7fyjbNp7UGAcEl5xJDRmyLqT0q8HTScmsNKfXQxUCMcYkN9cHV3htO2W5owcWu5lEN6EpLVyL2xgWETTpAyKFmoTPnt0Vi5GOi+/msjQSlL8lzc0+E+XOtjCwo2oofvyUVeZNOuWDCsZ3mraXpusJym1iJRltZv+a+HJaRaGfoUmz4YNLm8dLrcwmYO5gDi8Ep+WZrUNf/ceTiW4L1v1G322jxC3c6SFtrFuKn+4KdI9Mhw/yHeNfvAt2CpRmIZ1lQYjaNtfcvztw1e6FdO2J8mg7NAhAe8ac4zlXvfwE/+JtqQkYFmSbM93vWZsmrJiqKTqNToLWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6fb80b-0195-4562-ae06-08df34f7ab30
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 13:30:44.3125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5eDGLKiZHHQAgZBajaD3Mg5yCwGh1mTETLsjv+fEzYXi7l8Yu8DweWcIdqaelHxX37/olwmXWnEb4EW/7MHf1/Z9s7Ahier5O4pfNK6TTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB909395
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
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 27 October 2026 10:40
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v6 1/7] drm/xe/devcoredump: Capture GT fuse registers in
> devcoredump
>=20
> Capture fuse-related GT register state in the Xe devcoredump to preserve
> additional hardware configuration information for postmortem debugging.
>=20
> Add generic register snapshot storage and helpers for capturing, printing=
, and
> freeing MMIO register dumps. Use them to record both primary GT and media
> GT fuse register state during devcoredump snapshot collection and print t=
he
> captured values in the coredump output.
>=20
> Also add the required GT register definitions for RPM and mirror copy-ena=
ble
> state used by the new dump paths.
>=20
> v2:(Sashiko)
> - Fix GT/media fuse snapshot capture to use the correct GT context.
> - Add non-fault GT force wake for cross-GT register capture.
> - Skip reading registers when SR-IOV VF.
> - Skip media GT capture when media GT is absent.
> - Add RPM snapshot print/free handling explicitly.
> - Add POWERGATE_ENABLE register to get render awake status
>=20
> v3:(Sashiko)
> - Check RENDER_POWERGATE_ENABLE of POWERGATE_ENABLE register
> - Replace "render is not awake" message with "render powergating
>   appears not enabled"
>=20
> v4:
> - Reduce multiple apis and optimize the suggest way of struct arrays(Teja=
s)
> - Add document for struct xe_gt_regset gt member(Hook failure)
> - Change struct reg_desc to header file
> - Remove Graphics version check for these registers set
>=20
> v5:
> - Fix possible Null dereference using valid gt instead of q->gt(sashiko)
> - refactor struct member commenting(Tejas)
> - Avoid using xe3p naming as the regs are for all platforms
>=20
> v6:(Tejas)
> - Refactor regnames aligned to spec names
> - Rectify misplaced comment
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 228
> +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  52 +++++
>  3 files changed, 281 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f5cd3a94e47f0..220f0968f9db8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -22,6 +22,8 @@
>  #define   MTL_CC_MASK
> 	REG_GENMASK(12, 9)
>  #define   MTL_CRST					0xf
>=20
> +#define MIRROR_PM_DEBUG
> 	XE_REG(0xc98)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0
> 	XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
> 	REG_GENMASK(5, 3)
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 133cbe196d66a..b3fb8a521c9ba 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -25,6 +25,8 @@
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
> +#include "xe_mmio.h"
> +#include "regs/xe_gt_regs.h"

Make sure the order of header is correct, with that, LGTM :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  /**
>   * DOC: Xe device coredump
> @@ -69,6 +71,179 @@
>  /* 1 hour timeout */
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>=20
> +#define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
> +
> +static const struct xe_reg_desc xe_dbg_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE,
> "GT_GEOMETRY_DSS_ENABLE"),
> +	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE,
> "GT_COMPUTE_DSS_ENABLE"),
> +	XE_REG_DESC(XELP_EU_ENABLE, "EU_ENABLE"),
> +	XE_REG_DESC(MIRROR_FUSE1, "MIRROR_FUSE1"),
> +	XE_REG_DESC(GT_VEBOX_VDBOX_DISABLE,
> "GT_VEBOX_VDBOX_DISABLE"),
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(RESOURCE_COPY_ENABLE,
> "COPY_ENABLE_GTFS_GCD"),
> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_1, "GT_GEOMETRY_DSS_1"),
> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_2, "GT_GEOMETRY_DSS_2"),
> +	XE_REG_DESC(XE2_GT_COMPUTE_DSS_2, "GT_COMPUTE_DSS_2"),
> +	XE_REG_DESC(XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> "GT_COMPUTE_DSS_ENABLE_EXT"),
> +	XE_REG_DESC(XE3P_XPC_GT_GEOMETRY_DSS_3,
> "GT_GEOMETRY_DSS_3"),
> +	XE_REG_DESC(XE3P_XPC_GT_COMPUTE_DSS_3,
> "GT_COMPUTE_DSS_3"), };
> +
> +static const struct xe_reg_desc xe_dbg_media_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(RESOURCE_COPY_ENABLE,
> "COPY_ENABLE_GTFS_GCD"), };
> +
> +static const struct xe_reg_desc xe_dbg_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(MIRROR_PM_DEBUG, "MIRROR_PM_DEBUG"),
> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"), };
> +
> +static const struct xe_reg_desc xe_dbg_media_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(MIRROR_PM_DEBUG, "MIRROR_PM_DEBUG"), };
> +
> +/**
> + * struct xe_gt_regset - Struct for register descriptor list for GT
> + *
> + * This struct is used to reference the corresponding reglist of
> + * Main GT and media GT
> + */
> +struct xe_gt_regset {
> +	/**
> +	 * @gt: GT array indexed by enum xe_gt_type starting at 1
> +	 *	(UNINITIALIZED=3D0, MAIN=3D1, MEDIA=3D2)
> +	 */
> +	struct xe_reg_desc_list gt[XE_MAX_GT_PER_TILE + 1]; };
> +
> +/**
> + * enum xe_dbg_regset_type - debug register set types
> + * @XE_DBG_REGSET_FUSE: Fuse register set
> + * @XE_DBG_REGSET_RPM: RPM register set
> + * @XE_DBG_REGSET_MAX: Number of debug register set types  */ enum
> +xe_dbg_regset_type {
> +	XE_DBG_REGSET_FUSE,
> +	XE_DBG_REGSET_RPM,
> +	XE_DBG_REGSET_MAX,
> +};
> +
> +static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
> +	[XE_DBG_REGSET_FUSE] =3D {
> +		.gt[XE_GT_TYPE_MAIN]  =3D { xe_dbg_gt_fuse_reglist,
> +					  ARRAY_SIZE(xe_dbg_gt_fuse_reglist)
> },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_media_gt_fuse_reglist,
> +
> ARRAY_SIZE(xe_dbg_media_gt_fuse_reglist) },
> +	},
> +	[XE_DBG_REGSET_RPM] =3D {
> +		.gt[XE_GT_TYPE_MAIN]  =3D { xe_dbg_gt_rpm_reglist,
> +					  ARRAY_SIZE(xe_dbg_gt_rpm_reglist)
> },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_media_gt_rpm_reglist,
> +
> ARRAY_SIZE(xe_dbg_media_gt_rpm_reglist) },
> +	},
> +};
> +
> +static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
> +				      const char *title,
> +				      const struct xe_dbg_reg_snapshot *snap) {
> +	u32 i;
> +
> +	if (!snap)
> +		return;
> +
> +	if (title)
> +		drm_printf(p, "\n**** %s ****\n", title);
> +
> +	for (i =3D 0; i < snap->num_regs; i++)
> +		drm_printf(p, " %s [0x%x] =3D 0x%08x\n",
> +			   snap->desc->regs[i].name,
> +			   snap->desc->regs[i].reg.addr,
> +			   snap->values[i]);
> +}
> +
> +static void xe_dbg_reg_snapshot_free(struct xe_dbg_reg_snapshot *snap)
> +{
> +	kfree(snap);
> +}
> +
> +static const u32 *xe_dbg_find_value(const struct xe_dbg_reg_snapshot
> *snap,
> +				    struct xe_reg reg)
> +{
> +	int i;
> +
> +	if (!snap)
> +		return NULL;
> +
> +	for (i =3D 0; i < snap->num_regs; i++)
> +		if (snap->desc->regs[i].reg.addr =3D=3D reg.addr)
> +			return &snap->values[i];
> +
> +	return NULL;
> +}
> +
> +static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
> +				     const char *title,
> +				     const struct xe_dbg_reg_snapshot *snap) {
> +	const u32 *val;
> +
> +	xe_dbg_reg_snapshot_print(p, title, snap);
> +
> +	if (!snap)
> +		return;
> +
> +	val =3D xe_dbg_find_value(snap, POWERGATE_ENABLE);
> +	if (val && !(*val & RENDER_POWERGATE_ENABLE))
> +		drm_puts(p, "render powergating appears not enabled\n"); }
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
> +				   const struct xe_reg_desc_list *reglist) {
> +	struct xe_dbg_reg_snapshot *snap;
> +	int i;
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return NULL;
> +
> +	snap =3D kmalloc(struct_size(snap, values, reglist->num_regs),
> GFP_ATOMIC);
> +	if (!snap)
> +		return NULL;
> +
> +	snap->desc	=3D reglist;
> +	snap->num_regs =3D reglist->num_regs;
> +	for (i =3D 0; i < reglist->num_regs; i++)
> +		snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist-
> >regs[i].reg);
> +
> +	return snap;
> +}
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_dbg_gt_snapshot_capture(struct xe_gt *fault_gt, struct xe_gt *other_g=
t,
> +			   enum xe_dbg_regset_type type,
> +			   enum xe_gt_type gt_type)
> +{
> +	struct xe_gt *target_gt;
> +
> +	if (!fault_gt || !fault_gt->tile)
> +		return NULL;
> +
> +	target_gt =3D gt_type =3D=3D XE_GT_TYPE_MEDIA ? fault_gt->tile->media_g=
t
> +						 : fault_gt->tile->primary_gt;
> +	if (!target_gt)
> +		return NULL;
> +
> +	/* non-fault GT needs the caller's confirmed forcewake */
> +	if (target_gt !=3D fault_gt && target_gt !=3D other_gt)
> +		return NULL;
> +
> +	return xe_dbg_reg_snapshot_capture_target(target_gt,
> +
> &xe_dbg_regsets[type].gt[gt_type]);
> +}
> +
>  static struct xe_device *coredump_to_xe(const struct xe_devcoredump
> *coredump)  {
>  	return container_of(coredump, struct xe_device, devcoredump); @@
> -109,6 +284,11 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>  	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>=20
> +	xe_dbg_reg_snapshot_print(&p, "GT Fuse Register Dump", ss-
> >gt_fuse);
> +	xe_dbg_reg_snapshot_print(&p, "Media GT Fuse Register Dump", ss-
> >media_fuse);
> +	xe_gt_rpm_snapshot_print(&p, "GT RPM Register Dump", ss-
> >gt_rpm);
> +	xe_dbg_reg_snapshot_print(&p, "Media GT RPM Register Dump",
> +ss->media_gt_rpm);
> +
>  	drm_puts(&p, "\n**** GuC Log ****\n");
>  	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> @@ -146,6 +326,18 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  	xe_guc_ct_snapshot_free(ss->guc.ct);
>  	ss->guc.ct =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->gt_fuse);
> +	ss->gt_fuse =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_fuse);
> +	ss->media_fuse =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->gt_rpm);
> +	ss->gt_rpm =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
> +	ss->media_gt_rpm =3D NULL;
> +
>  	if (!IS_ERR_OR_NULL(ss->gt))
>  		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>  	ss->matched_node =3D NULL;
> @@ -319,6 +511,27 @@ static void
> xe_devcoredump_deferred_snap_work(struct work_struct *work)
>  	}
>  }
>=20
> +static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
> +					   struct xe_gt *gt, struct xe_gt
> *other_gt) {
> +	ss->gt_fuse      =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MAIN);
> +	ss->media_fuse   =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MEDIA);
> +	ss->gt_rpm       =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_RPM,
> +						      XE_GT_TYPE_MAIN);
> +	ss->media_gt_rpm =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_RPM,
> +						      XE_GT_TYPE_MEDIA);
> +}
> +
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  				 struct xe_gt *gt,
>  				 struct xe_exec_queue *q,
> @@ -328,6 +541,7 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  	struct xe_guc *guc =3D &gt->uc.guc;
>  	const char *process_name =3D "no process";
>  	bool cookie;
> +	struct xe_gt *other_gt;
>=20
>  	ss->snapshot_time =3D ktime_get_real();
>  	ss->boot_time =3D ktime_get_boottime();
> @@ -342,11 +556,23 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  	ss->gt =3D gt;
>  	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>=20
> -	/* keep going if fw fails as we still want to save the memory and SW
> data */
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>=20
>  	cookie =3D dma_fence_begin_signalling();
>=20
> +	other_gt =3D gt->tile->media_gt =3D=3D gt ? gt->tile->primary_gt
> +					    : gt->tile->media_gt;
> +	if (other_gt) {
> +		/* fw_ref_other must stay in scope through the register
> captures below */
> +		CLASS(xe_force_wake, fw_ref_other)(gt_to_fw(other_gt),
> +						   XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref_other.domains,
> XE_FORCEWAKE_ALL))
> +			other_gt =3D NULL;
> +		xe_devcoredump_capture_gt_regs(ss, gt, other_gt);
> +	} else {
> +		xe_devcoredump_capture_gt_regs(ss, gt, NULL);
> +	}
> +
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index a174385a6d83f..e2fac33dce091 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -14,6 +14,48 @@
>  struct xe_device;
>  struct xe_gt;
>=20
> +/**
> + * struct xe_reg_desc - Register descriptor struct to make reg list
> + *
> + * This struct is used as descriptor containing reg address and name
> + * of the register to dump its value during coredump for debug purpose.
> + */
> +struct xe_reg_desc {
> +	/** @reg: The register */
> +	struct xe_reg reg;
> +	/** @name: Name of the register */
> +	const char *name;
> +};
> +
> +/**
> + * struct xe_reg_desc_list - Struct for register descriptor list
> + *
> + * This struct is used to reference the corresponding reglist of
> + * various component
> + */
> +struct xe_reg_desc_list {
> +	/** @regs: Pointer to an array of register descriptors. */
> +	const struct xe_reg_desc *regs;
> +	/** @num_regs: number of registers in the descriptor list*/
> +	u32 num_regs;
> +};
> +
> +/**
> + * struct xe_dbg_reg_snapshot - Register snapshot
> + *
> + * This struct contains the register values captured at the time of the =
crash.
> + * It is used to store the register values in a human-readable format
> +for
> + * debugging purposes.
> + */
> +struct xe_dbg_reg_snapshot {
> +	/** @desc: register descriptor list. */
> +	const struct xe_reg_desc_list *desc;
> +	/** @num_regs: Number of registers needed for capture. */
> +	u32 num_regs;
> +	/** @values: register values*/
> +	u32 values[];
> +};
> +
>  /**
>   * struct xe_devcoredump_snapshot - Crash snapshot
>   *
> @@ -35,6 +77,16 @@ struct xe_devcoredump_snapshot {
>=20
>  	/** @gt: Affected GT, used by forcewake for delayed capture */
>  	struct xe_gt *gt;
> +
> +	/** @gt_fuse: Fuse snapshot */
> +	struct xe_dbg_reg_snapshot *gt_fuse;
> +	/** @media_fuse: Media Fuse snapshot */
> +	struct xe_dbg_reg_snapshot *media_fuse;
> +	/** @gt_rpm: GT RPM snapshot */
> +	struct xe_dbg_reg_snapshot *gt_rpm;
> +	/** @media_gt_rpm: Media GT RPM snapshot */
> +	struct xe_dbg_reg_snapshot *media_gt_rpm;
> +
>  	/** @work: Workqueue for deferred capture outside of signaling
> context */
>  	struct work_struct work;
>=20
> --
> 2.43.0

