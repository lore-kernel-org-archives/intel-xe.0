Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C0CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED5310EC06;
	Thu, 15 Oct 2026 13:42:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1315F10EC06
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792071748; x=1823607748;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zuIsnJKqL/sTjS/ke2m1KiAg+pZX3vVvNv3Dxx4EhDQ=;
 b=UJLD+1R0xAqXtjfzZTeHKRpYOoiHWTV7qIbajF5AVKV3DtVF7o+KAf/W
 /HhP9RwA+8RNhWf1OY+XsyL4d7LI9PGBBk15VhJiCumlJelqcVyZQAS63
 IZ1R4bNui1wNA5YA6sRaCCYr6oVT8FCjn9LxsW0xyT/XQbZaqihseQWQF
 C+bTU+58fKw4XY2jrEPUvVAWWmaORkju4DeWHcTTmDPIBDtiJJyFyA2In
 O4ihlGNv5Y3k3JrZK/F5Z58AYDGlSiEB1T1kA7qOYgERNTN01OaUh7h4S
 adc7GNheaJecMLnbOAJ2AUG2KaPfZ7t1iSGcC8Q5cufVGeNPINRVomwLi g==;
X-CSE-ConnectionGUID: pbEaJc04TrGQhy6z7t/Cnw==
X-CSE-MsgGUID: U5dIebypQZSHAK4Gg3YM3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="852634"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="852634"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:41:51 -0700
X-CSE-ConnectionGUID: WyGta93oQY6rTBx+fd6yGg==
X-CSE-MsgGUID: 1sli2mLlTrqhRh/02fjRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1627869"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:39:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:39:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:39:38 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbv+4QWEgO16DOWd7psri0j2sOxYShyyYSF6eoUv65203ha7o5J1gbSb4nj/soT0JsZYTzybHlzTd4/opClM5Bd7WNZw943APA+cQ/LRKxWS+V2Jd8E+z/SUG5mBgR7Le/SAXRvPR5P46Rlexnoni0Ls5qs9NLtfIFFyXDIwmUz/Q9+lQUwXIsGFGThBhj6iNFefRJ5vMmdw9BE8qgSuWWA1OHIQw7X10wJ4uovrzxv7QzqZuXvu9V8DQBCXZiem5poueXdShmGX9lkhZLM0vpQWq3tjaDCEldKf4lji9Q9lOjikQPU+ohU89dENYymOb0ijp6sFKMBYrDl6v1+OPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcG6wpnuBPoVnKo/0uPHnVmHMvibAFVy4JOwh4c1cHw=;
 b=u90SsbJ9NYan1+SzwWcNt1rPpXUNQVLpdb4hjECCTQE4Z969AFE3WVg9X6ZUKQSKpijkltJONWy64vCWC6WumXDjNMxiIn7tvoJwE33kUEiPbsoWg0b3GhhInGHk/em5lmnndDGLjX19r++sK8lSxyjhLpVs1cMAh1B0g6p4A97I4Rdx1dA8Hh1LPjeqtTK0wRJZ24+INoIsuoEIbO+60U77Ngh440pl3xeDCAGC4QHIcnJYnOe7t2Cgr84W/sz2a/+IR4nPgCZ4jqMYM2CdQ75q/f0eND5Qfvfx+SOfdEJ4xO3e/kFL9DcHOkMCk0FRCixZQ50iZlX7flIE7hA1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH8PR11MB6831.namprd11.prod.outlook.com (2603:10b6:510:22d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:39:31 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 13:39:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Topic: [PATCH v4 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Index: AQHdWlmtDRGviBuOfEq8rge/oDo4wLb+nziA
Date: Thu, 15 Oct 2026 13:39:31 +0000
Message-ID: <DS0PR11MB8718355749C25D8B180845ED819C2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
 <20261012145237.3788198-2-naresh.kumar.g@intel.com>
In-Reply-To: <20261012145237.3788198-2-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH8PR11MB6831:EE_
x-ms-office365-filtering-correlation-id: 272f3c3f-4749-4d3a-0baf-08df2ac1be29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|261009220027099003|261009221227099003|261009221727099003|261009223327099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: hDV70oFcnUWXi75BulLRYCY5FzUay/puh4ZeNsGbQt9ACLM8+sqY41y+Qo4h7UQ6pcLXzQLKzP7SFd+K8BLrd1D6GeAOR6HqwCBFmqP034UBd4X07nwbR85O/9XBG3PkW7ac/9Ijd7WNJsoDGombYmP8xKH6htOni1RSy98Ydw9iGrmXuXb02AazhBOoKCrTGbvSWwVRUV9KBG5Cw4O8akbXMRH3ifLf/QrnAkyemewLMeRBtRZasBiQ/7EIJEaLhk/wYwg2Il3Krb+853vLUbxfpp0ABhrQlCn74zk80m91AGOBiKfR4f2E6Bqj7hGWNn3lyFueS0OgqUfu6zSv/nnEO3FWyX8+7I4KTO1lCVUbvST2M8GNI2WfEKqih4P7rJruWiLzgt11u5fidogjgmXatJ+cV11FuSb1sa6ay7yANW+1gf5uCglbVkUqo6gC+KL0HePlP/uvvQQDz9NNzkA4ANg99mXYAAW2WDjh+sTcK7tHMqPkicB3wNqcAWMzr85j88FbydT1LT1kgsPCsDlfSO6841IM8cQsP+UlUTxPMNedjkCmTeJaxCexIcWFEjfJJc6YJzp3RFdXKFwWfGZ33+C5fzWm3xQ9Wq0ZUr1Kusg9g6KnlZvLystzPnHkmlaN/cSqH4rM6qZZ2FsPTevrNET+DG43Z9m+asb+kqRVrr+2VQWOkcYq8S1A/aisY008vDmQRJPD263i+ZewKTj8CLpqVLZU4jpF+jjPR3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223327099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T0LQ8tCCHkVG2h+kyTztS7Ug637J81vFKYOrk0uxogxLUMen22QAqv6HAMkY?=
 =?us-ascii?Q?RS5UaHxuK3yU/dH7sLs+5apWxcdKjmUjW/9izE6SsuBORwKW/R0KolVSefVR?=
 =?us-ascii?Q?pgbbXOSaygGM32j9h2eq/h05kNkfqYRpVWtIQY19LRbHG1XJ8KtR2P5BQctZ?=
 =?us-ascii?Q?5YkZHHRKBWuBAAxChZprdtszN4Pdob3CzevAq4ClqB9i6B5XYgotvqvbSObq?=
 =?us-ascii?Q?zdMTbplqNj4GTqjmIDcfhFFefydu854rcGaE+n9BF7iiPVWwJGLwNexeImp+?=
 =?us-ascii?Q?MFashg+NmXVhEUphU68MGHcJ4s7V4DoGLvSDRzQRodv02F8NUeBYYyXoRX5g?=
 =?us-ascii?Q?W9SlqoJIrJb67SsoPZCLVKp4/XWGXHx1LASwXJSE1wPZFsJ32rkVsqYimXy+?=
 =?us-ascii?Q?SbGTSaQpFNNU8mAnO3VZoKWNKcO4L1DT5rOItOnKOm1Rcc1f39WhosGg2OtS?=
 =?us-ascii?Q?yjNxRI29sAdhQFdyHDoFT/jPvN2mBFMj8TQiHMh4tgxim7ZS81z0JpuEqf9E?=
 =?us-ascii?Q?/AX01249HEQs+RKKD3MMEsQ9cvFSO97b7FWbnDfkj+63RyLWhrthfhpK9ZPm?=
 =?us-ascii?Q?GbxKczJmahkJR722R7TJe8aWA200wb9Ge98r0uuYiIyM9FUpb9b3cQUZzCfU?=
 =?us-ascii?Q?2+gnNTUHPC7ewlZukAKoOHLH7vEzsJ/r//e1iGZteV/Y9T4mlZ2PnzzaEuoj?=
 =?us-ascii?Q?mP+J2GU8swAbhfz77oTjEU6cchrdHprW3KUdzaLClLKFjGkARWLHqPcIXcfj?=
 =?us-ascii?Q?iIn3fRKbTJXAG6TpgSXsEaFUq0roRASHpiRhyM+Ft7XrWoHDZ0tzx9tx73eK?=
 =?us-ascii?Q?9jsmBcasxP6ItbQHW6zd/DCEJlz5ugcM6zylUagwwg/Ngip9nMi/0Z8EqIcQ?=
 =?us-ascii?Q?s1E/NMDY5ZcQS9OF2wG75juBBya+y/t9rLiIBmOqdCqmSw7VQhjFYQ0qtvRV?=
 =?us-ascii?Q?8JkA7FDuXBaeV+3CogbnGzaw7Xgs9bwHoTJ96DZzI3aOyPk8C2GZCGWbLVfF?=
 =?us-ascii?Q?Cm94/3V85loI5Pc3pFHqW9A00REj3lkPkFF8FPxVxXE4u8d1JBHRbQ7inSs+?=
 =?us-ascii?Q?EF+8C0qh790i1X3OD1FzPAIz2GG7OHdAyJ5cDyE+urtFuHl+5v/Yp/933Cmb?=
 =?us-ascii?Q?pDKvZSsgGAZjJRJcArDFQ7mGWddKOAScbK3XTPQMtaDS61rbnkcBRywFOeTt?=
 =?us-ascii?Q?pyXbUcoTuo5oTkOfaaEXUlvSU/ntM3DnawQCMww7WkzRQON1skWbuq/sxfMJ?=
 =?us-ascii?Q?v1J+MnAyzrV2FYpBzGLQsOdHijDo/a9+oOZvqZyzzol0xkWz1ZcxMs97Vzui?=
 =?us-ascii?Q?HSmCxZmJf6UMO8jYA0fyHaqftdvSoEtCzaisTcpNat/7DrkzlgY5Zo98UdUe?=
 =?us-ascii?Q?beEgvQdofNetPxYGY3Bmqr5m6GvofoNPqwAksbftXdllNfvAkeponXZUswcf?=
 =?us-ascii?Q?IreWCPC5LCWnQ/r5wwdPlIZFyYsC2a7Pe2GNhzr29gubIoB7OudOtD9ygB/x?=
 =?us-ascii?Q?JK6ECaKzM3iXTgOIjhEsTBWU5j8i/0nM5tQhrhOTMJvruOmHkFdQkwK7CPhi?=
 =?us-ascii?Q?nTH7aVBWTVR6r/jvogrCUOv4JkaC+PRozKZ66oyAumvlUU+l5DG0juLyqP/5?=
 =?us-ascii?Q?4vUxAH10JiizuhF8qcTo4Lm35I92W3v1CsrY5AOZP81ZgEztwMst6y+osw4X?=
 =?us-ascii?Q?iPItD7tQrOgJAR4FTGqxz47LENgaUilF8RSmzIxgPePmiNEK/vdi3c0kgt62?=
 =?us-ascii?Q?TGobV8baUA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3kAdZLoLONdBGt1sshR5m4B3B5Cdp938o6g1KYojdshRPSYXnbvPB+d/yPXroUwNClU1IkxJGMnq+E9ItSC2Yeagy8iZI1pEWjjLSxe4P2W8oXsfEgBOxUswh1FxVtkJnnjqgBB2InXU6XvvMjjdZIta72AyZ4cmovT7djNfBm9g3U6iELGoCHAX/jEcQDhcrVhcrcQ1MV+VcsLciCsxImxA2+fM4GIgoTe1f2pRfdIbdSAgmMvtrIPVTsUEKsIOKK//pWr2XLziCUa2PIw0q7QOsO+UAn74MMQCkT1LkbDKo2QCpUZVeMJPMMsQjRgj5iSDx8AYlT7k+klxKEhKlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272f3c3f-4749-4d3a-0baf-08df2ac1be29
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 13:39:31.6698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DIMir6jdZRZNpnwc/19/P8VXBQStvjkTl/MP0VNHKcbLvAA+fnjGGLb42F+2sDYgEhGRqo1Bfo6FuiXTsinpO84r0aT4/Vzl0O8WkdoVDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6831
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
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 12 October 2026 20:23
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v4 1/7] drm/xe/devcoredump: Capture GT fuse registers in
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
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 215
> ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  52 ++++++
>  3 files changed, 269 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f5cd3a94e47f..e93895e0c731 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -22,6 +22,8 @@
>  #define   MTL_CC_MASK
> 	REG_GENMASK(12, 9)
>  #define   MTL_CRST					0xf
>=20
> +#define RPM_GCD
> 	XE_REG(0xc98)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0
> 	XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
> 	REG_GENMASK(5, 3)
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index ab681b148869..1dbee725f55a 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -25,6 +25,8 @@
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
> +#include "xe_mmio.h"
> +#include "regs/xe_gt_regs.h"
>=20
>  /**
>   * DOC: Xe device coredump
> @@ -69,6 +71,171 @@
>  /* 1 hour timeout */
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>=20
> +#define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
> +
> +static const struct xe_reg_desc xe3p_gt_fuse_reglist[] =3D {
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
> +static const struct xe_reg_desc xe3p_media_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(RESOURCE_COPY_ENABLE,
> "COPY_ENABLE_GTFS_GCD"), };
> +
> +static const struct xe_reg_desc xe3p_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"), };
> +
> +static const struct xe_reg_desc xe3p_media_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +};
> +
> +/**
> + * struct xe_gt_regset - Struct for register descriptor list for GT
> + *
> + * This struct is used to reference the corresponding reglist of
> + * Main GT and media GT
> + */
> +struct xe_gt_regset {
> +	/** @gt: GT array indexed by tile/GT id starting at 1; element 0 is
> unused */
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
> +		.gt[XE_GT_TYPE_MAIN]  =3D { xe3p_gt_fuse_reglist,
> +					  ARRAY_SIZE(xe3p_gt_fuse_reglist) },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe3p_media_gt_fuse_reglist,
> +
> ARRAY_SIZE(xe3p_media_gt_fuse_reglist) },
> +	},
> +	[XE_DBG_REGSET_RPM] =3D {
> +		.gt[XE_GT_TYPE_MAIN]  =3D { xe3p_gt_rpm_reglist,
> +					  ARRAY_SIZE(xe3p_gt_rpm_reglist) },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe3p_media_gt_rpm_reglist,
> +
> ARRAY_SIZE(xe3p_media_gt_rpm_reglist) },
> +	},
> +};
> +
> +static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
> +				      const struct xe_dbg_reg_snapshot *snap) {
> +	u32 i;
> +
> +	if (!snap)
> +		return;
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
> +				     const struct xe_dbg_reg_snapshot *snap) {
> +	const u32 *val;
> +
> +	xe_dbg_reg_snapshot_print(p, snap);
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
> -109,6 +276,15 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>  	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>=20
> +	drm_printf(&p, "\n**** GT Fuse Register Dump ****\n");
> +	xe_dbg_reg_snapshot_print(&p, ss->gt_fuse);
> +	drm_printf(&p, "\n**** Media GT Fuse Register Dump ****\n");
> +	xe_dbg_reg_snapshot_print(&p, ss->media_fuse);
> +	drm_printf(&p, "\n**** GT RPM Register Dump ****\n");
> +	xe_gt_rpm_snapshot_print(&p, ss->gt_rpm);
> +	drm_printf(&p, "\n**** Media GT RPM Register Dump ****\n");
> +	xe_dbg_reg_snapshot_print(&p, ss->media_gt_rpm);
> +
>  	drm_puts(&p, "\n**** GuC Log ****\n");
>  	xe_guc_log_snapshot_print(ss->guc.log, &p);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> @@ -146,6 +322,18 @@ static void xe_devcoredump_snapshot_free(struct
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
> @@ -328,6 +516,7 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  	struct xe_guc *guc =3D &gt->uc.guc;
>  	const char *process_name =3D "no process";
>  	bool cookie;
> +	struct xe_gt *other_gt;
>=20
>  	ss->snapshot_time =3D ktime_get_real();
>  	ss->boot_time =3D ktime_get_boottime();
> @@ -345,8 +534,34 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  	/* keep going if fw fails as we still want to save the memory and SW
> data */
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>=20
> +	other_gt =3D q->gt->tile->media_gt =3D=3D q->gt ? q->gt->tile->primary_=
gt
> +					    : q->gt->tile->media_gt;

q can hit NULL here

> +	if (other_gt) {
> +		CLASS(xe_force_wake, fw_ref_other)(gt_to_fw(other_gt),
> +						   XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref_other.domains,
> XE_FORCEWAKE_ALL))
> +			other_gt =3D NULL;
> +	}
> +
>  	cookie =3D dma_fence_begin_signalling();
>=20
> +	ss->gt_fuse      =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MAIN);
> +	ss->media_fuse   =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MEDIA);
> +	ss->gt_rpm       =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_RPM,
> +						      XE_GT_TYPE_MAIN);
> +	ss->media_gt_rpm =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_RPM,
> +						      XE_GT_TYPE_MEDIA);
> +
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index a174385a6d83..90cca9ad2877 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -14,6 +14,48 @@
>  struct xe_device;
>  struct xe_gt;
>=20
> +/**
> + * struct xe_reg_desc - Register descriptor struct to make reg list
> + *
> + * This struct is used as descriptor containting reg address and name
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
> +	/** @num_regs: refernce for num regs in reg descriptor*/

Typo, should be "number of registers in the descriptor list"?

Tejas
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

