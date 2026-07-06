Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D8CC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 15:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34CC10E396;
	Mon,  6 Jul 2026 15:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDJrxisO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9975F10E396
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783352067; x=1814888067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VRykKYV/BKfPV+SobM8Smshk/2p734X26fI4ImtQSKk=;
 b=PDJrxisO8rcI4TN6rN4s4+EPSJrk7xIUXEvv+hszUyciXnV4wFQr1pt7
 ibpsU6jlSiN7cxJFEHGoGqxNgGRb+Ke6whKlyR9MjoEbis5aZZaoEOu+k
 xn9xXAPq77NrDUU8M4RcKw6RmGCwhnx8vyyWDzOv6yJnN0kdLFcgmimyy
 pfJY/gWYj/ItuxT+65kgxWumTOOm3aw9ZaH+etqCbFhxi+ZZwHx1dbsiE
 TN60iKTIrMomWzzlFbXYCZ8CLW46cQLVQQWWhhMA9KCk7x/fATJPCXFng
 3HGY6hWUdqml7jZxU1QnWWL3K1CVw2NwzgAHdKARp2SO1zne77mC0gKGm A==;
X-CSE-ConnectionGUID: 44YVuNl1R9Sqf9+RpgCE2A==
X-CSE-MsgGUID: G7ZBDt+5RRWsDWYnE/UW5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84042073"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="84042073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 08:34:27 -0700
X-CSE-ConnectionGUID: D+9Wt/nFT8GNJTA4U9/slA==
X-CSE-MsgGUID: /ZnUKILJQUGXWseKnOgWwQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 08:34:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 08:34:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 08:34:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 08:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHTlCC80h+QkWEn/ztE75/cqmDiNmEof40QNNJirhWQeE/WtUGza7Qy8krQjXKxltt6jnrmrarloYPhPSvIZeSAJSReomjRPwnyRM5AYQ8O/f9kgydbMIHw7c1rvprbpMaOhx+bXz8aB01bLkYoOgiRFUrgtAra6wAXnk4IJZnh8PFoU3+zfJc/g3yxinAwoqFvT4seYZazdqd+tr/ps9PuYfUZSPmlmEJ1Al5HoWT9UQPZWiqwp8nVsMBtVaL6qz3Hh/GcEsQPJZFqAel0Z6btfHffAzGISbBZp/HgByd5sBudB9GH9OXlH0Rm9s9fUPWnhUrw54MsLZI+TczVYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zu5eU9+/EXyWg1W83Pk3T64TVQfIVIdqBuaP4H7VECc=;
 b=yVkb59L3FWw65TI7AwQOsB/KY8xg0dklHw5jJ3/aBKyDSdZVsnlODy/vZmPtON97bhpYH/4hvIXR6apSzTGu9feIQpaNuquMogR0RSYXrpF4DWUWlXBdnNn/Nhl9opK2gHwL+BrPLSZkgEKVC5bR3W0cZ+rDnSJlJl6MUo6kEmdrCRt42BxFbcsF0bntuxm70i1xRFFQwU68HYxpIWUqv+Vt8+3CGeNPbI8+SSByDVslrFSe3osmwtA/EH0/CFSIRgBz151Cl+c5dVyueLLPwNptsoreMvypFQ3w8E2ekN/fsLp6S/z4wU8JXPjd3dNYRRc3klvzHNX0VOkLx6ZwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 15:34:23 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%6]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 15:34:23 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: RE: [PATCH v5 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
Thread-Topic: [PATCH v5 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
Thread-Index: AQHdCgN+b8sXYGwZwUK66HPUuzyOrrZgpaMw
Date: Mon, 6 Jul 2026 15:34:23 +0000
Message-ID: <IA1PR11MB64182C38B567EC4E4CD3EB7CC1F12@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260702092540.1005095-1-karthik.poosa@intel.com>
 <20260702092540.1005095-2-karthik.poosa@intel.com>
In-Reply-To: <20260702092540.1005095-2-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY5PR11MB6114:EE_
x-ms-office365-filtering-correlation-id: dd3ba8d1-99ad-493b-da27-08dedb740e04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|22082099003|11063799006|4143699003|18002099003|56012099006;
x-microsoft-antispam-message-info: NAyzEHuR5eeEdvNw9Y2FnBiAxPbv3kzlF9hDCBxemqIM8M1ASYVelyrd0GsoQj6XkRHDTUauQ99VbpO4vrocBvt0SSNnbbep8rwRj+KT7BV3q97T7kW3ACwww7LDRI4mWz2WDx23gPUTeVoiv1Fz13onFMKrxuSod5Crjk26nLUCDO4y4X5QKpA3vmKC9EjsTZiVY1mOBDO8lB+8o2RUpfA/aYeqgZmFCSgtC4E2TqXNmuyVVl2ldQoku0QJpxhuh+97nfJL5e0OOguQm3zs2wsrcNC1OVGYrbHk3KgbohvEebwa5byDKF/i62qCgReL83bfSrEXjRQR9uMo+RG8pSZu/CZyO95i2YZ5kpl9ew43Cz8giaAAuXlC/+JZUu3e5+H87rzMq74WuGOQSFas4THB44QaWAAlTXOTdFQyf8hAabvVL5Oz4OBT9Kh0gQjV6EQRVDmWJ727qhgMNfbEY09+hlCU7n1Lp7qs6D4PtGyYN8BwqHbQwvoL+loZIpB81quZ/YUacXBaBtGTGZPt9uZiPPpEf3tQtj/bl7BVV6E6Vy9rEVxfD5xzCjg7vsWEwnCydFdpBynW+4rGxuxH609PI7p5gBEXo/+HphgXa5UEyN6YCmARjGIcfQ+aQs+W3mCe9H26BxqPpGQ0i5PEOZlZMJLQYi9K6j/MnnXCgCALQQBkyMt58UXIok8L2nZtkFg7VDljuokYpdsD/+RVRvmVWXDyu0sJ0bDTPAkIIRc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(22082099003)(11063799006)(4143699003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PpTAYyaRBzFB+IZlLgYgVUdry2cntgCqJppgH1mNoQR6A9IctOqJeMq0NhKL?=
 =?us-ascii?Q?swzxz8CzmueqLSjLguDV0MFdLaRJ99gTUT4VMCd565d8zIH0cvZEQmZtODKM?=
 =?us-ascii?Q?93THwSGwsX0KxyEbVvsycefw2gPG1hIJRtX1Ub8lmFJbMP3MY5J4RzBNQMpH?=
 =?us-ascii?Q?gvua7mMnJaOo8mN1w2P22NWYRtzzE66gaFWKyt9zEpJ2wdGGgAYOklSmG9Ma?=
 =?us-ascii?Q?4QQC+yC4HUWGeV6rYKiDPUfyvR/K3YhWlvuQ/c/VU3CK3drzvUB4EBjxQsRl?=
 =?us-ascii?Q?DMUTBghFTmN+KP5jSXtIJN4kzvOsfSr5TtiqMh3CiqplCeoXwcicKvlG8Afl?=
 =?us-ascii?Q?FhYXGdLibnK4Gz58VuWd7mEaK2hP4IZVpBmm/vc9Ff8OIqOhRSG3Qe5B2dic?=
 =?us-ascii?Q?GjYyO5nAdk4oSPUllDEjDZmfQFdbAVfaqHexceCSzIqL2o9hewk2XDYlJdiD?=
 =?us-ascii?Q?xq/KG/C6GdM24Jl+GVo+MVs196ggm/kWWQSR/Nlv9T+JvGjnrZYHFeX5pqom?=
 =?us-ascii?Q?0yRQVJBrgdsVr4F25U77paWrBpufc9834fji1npHDs0zk5CxreVbCO6fQ2Zu?=
 =?us-ascii?Q?SfW3mhgjTPRSQtcLE2JHNpJ0fn7e+/Md7kASIdnWEJ90Sd+yHPAU8eGdGawK?=
 =?us-ascii?Q?SbQMTSp3miR5ALzHMqw5pcbQ1udhoN9eGCYyR42CfAjtLfdq0w4/EUJHv1SK?=
 =?us-ascii?Q?gkE0CGaHS5BySM306GX9DWPnbqclPa7K3Qz9XfXZHpjL2w8jLInCT6l56F/B?=
 =?us-ascii?Q?pSuesQsak1e5/+5GQb2ByRABbxcHygQzFqtBDdb0sY+ZnUKKo8DUz0Iimr/k?=
 =?us-ascii?Q?krAJch6JPfpoy1sV0zOWVbnbGHTZQH8gs5d+u4tVQSTrRZIIdXZ8WNL4DdfA?=
 =?us-ascii?Q?tGG5+GsqQL4JloCnGVSjmijOCOfF2uiEkCaXr9y6PZ7z8sFUcLtT1InzGan8?=
 =?us-ascii?Q?M9pvFedZDy9xJyCI2tX25DhzQi7qtuwKtBHD0UoHGrwFJ6lHfubpAPfvlWwI?=
 =?us-ascii?Q?lXTd0OHeyLdV8DUdRIJV4t3fQUVkxC4/dxyWEwKHzy3nOUtm6thdXln2R3u8?=
 =?us-ascii?Q?INIcrKgX13LmGe5IYzI3HDvsXZABg6Uy4amtOVIKDwHqIjS8usX+ATr4bIwc?=
 =?us-ascii?Q?Qv2QXZNoiOWh5L8X4UmC2IKZFhDTwAFCEuHJfVfjt6UcDhPNE1bpgoi/wOIb?=
 =?us-ascii?Q?LOCt6vi1PvEgZXE1GwZO1qo0A1rXlOv0lY1waUhlw+12FBlDiTPLA5weoCz9?=
 =?us-ascii?Q?LSctdQGU6L62/WSx5xF7fIxWqb6pDccGdKLsztdEtp06SVmjc7mUcl8xOzR3?=
 =?us-ascii?Q?56g5IBy32b0XN+VPBJtDjsS23euovjkJ53XsHb2zzx3+TDwWXXHzSLyVaDRG?=
 =?us-ascii?Q?klImggJMF1ghraeH21A+zJW/wkx6CjJr58kz0OW0y5daFrxGxh0l5jmIOeKV?=
 =?us-ascii?Q?C+vuOEPo+yHLSHNRu8UdmdJAgoXTHcO/wTIzi0rVO+vLT2DJX1gOVE9EmKe6?=
 =?us-ascii?Q?eH3yhwDzptEPEWNi/xkQLfk6E7wITvbM9u0URFkGpWXfJV1p3MH95jWtyGDY?=
 =?us-ascii?Q?fxds9PRLsN6ooXzPbdGulXcrzfB2yRu7hTde2Sx5LLDaXxhlsTyvdiKYNeko?=
 =?us-ascii?Q?5bj7/pFFHF16Zf1MTG52wQAWFpqG5NU1IyEdsNVcg81o10UQafnV1dY6/J33?=
 =?us-ascii?Q?1zTD9g0Rip2nyAqPlgH8Itlp7tmwfuyDA4uM617ltqlT9yX65gG2+Ah38q5F?=
 =?us-ascii?Q?nT91wAJ5mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DIjiVq6VuFUi6pWccWUxgI9WoFQIMq7IyHNM0SrHvQy1Ug8dw0/vxw+VDOIwWV6OGXtDXHrmFXjrQJoS5uo1fwWjT50UMZa10yOGo8RIBOTxdi3d0mlWAOmcadQ8+M8ocJAwS8kGKkbEXOFQCvjeTaxHKOiEjUsS1QBbSw/Nj/zlAKdwuXlYSeoBSSL1nazl6u0OQcrHQNUlOX6ewTr1hN+FKtRpymXd7HN0UWARJ4GGNQyPHwKOO6jFR5GfbKLOmDvkEj8PPShFheUlBdsVIGEQlIPYFBDaw5V2h9JgTZY5dJCl5WYDFRP2aQkc4FA9Oirlx5u8vQGfmGzj19d3CA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3ba8d1-99ad-493b-da27-08dedb740e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 15:34:23.0806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dPbVW+RU/yk+ihliUJEZXSzo+hmDtPLvCSc5/PfSKMD2KeqPDiWpHm+gDzPauVAAwegrlA8C+3PyF4SM39b9h7lVWN6ZIu9Oe5bwHuV+cno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
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



>-----Original Message-----
>From: Poosa, Karthik <karthik.poosa@intel.com>
>Sent: Thursday, July 2, 2026 5:26 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
><anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>Ruhl, Michael J <michael.j.ruhl@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Purkait, Soham <soham.purkait@intel.com>;
>Wajdeczko, Michal <michal.wajdeczko@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: [PATCH v5 1/2] drm/xe/pcode: Add support to get pcode version fro=
m
>PMT
>
>Add api get_pcode_version() to read pcode version from PMT telemetry.
>Add PUNIT_VERSION telemetry offset in xe_pmt.h.
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>---
>v2:
> - Pass struct device* instead of struct pci_dev* as xe_pmt_telem_read()
>   got updated.
> - Support pcode version read from PMT only on BMG and CRI platform as
>   PUNIT_VERSION_OFFSET is currently fixed for these platforms. (Micheal)
> - Use scope based runtime PM to wakeup device before PMT read.
> - Update commit message.
>
>v3:
> - Move the platform check to xe_debugfs.c where the debugfs entries are
>   created.
>
>v4:
> - Address review comments from Michal.
> - Sort header files alphabetically.
> - Rename get_pcode_version() to xe_get_pcode_version().
> - Add kernel-doc for xe_get_pcode_version().
> - Use `xe_warn` and `xe_dbg` instead of `drm_warn` and `drm_dbg`.
> - Use %u for version print..
> - Prefix `struct pcode_version` with `xe_`.

For the series:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Mike

> drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
> drivers/gpu/drm/xe/xe_pcode.c    | 32
>++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
> 3 files changed, 41 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
>b/drivers/gpu/drm/xe/regs/xe_pmt.h
>index 240d57993ea6..a62ab05c6b4c 100644
>--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>@@ -15,6 +15,8 @@
> #define	ENERGY_PKG			REG_GENMASK64(31, 0)
> #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>
>+#define PUNIT_VERSION_OFFSET		0xA0
>+
> #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
> #define BMG_TELEMETRY_OFFSET		(SOC_BASE +
>BMG_TELEMETRY_BASE_OFFSET)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index 866986694d9c..ccc3bdeed6bb 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -11,10 +11,14 @@
>
> #include <drm/drm_managed.h>
>
>+#include "regs/xe_pmt.h"
> #include "xe_assert.h"
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pcode_api.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_vsec.h"
>
> /**
>  * DOC: PCODE
>@@ -350,3 +354,31 @@ int xe_pcode_probe_early(struct xe_device *xe)
> 	return xe_pcode_ready(xe, false);
> }
> ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See
>xe_pci_probe */
>+
>+/**
>+ * xe_get_pcode_version - Read pcode version via PMT telemetry
>+ * @xe: xe instance
>+ * @version: pointer to struct xe_pcode_version to store version info
>+ *
>+ * Reads the pcode version from PMT telemetry and fills the
>+ * provided @version structure.
>+ *
>+ * Return: 0 on success, negative error code on failure.
>+ */
>+int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version
>*version)
>+{
>+	int ret =3D 0;
>+
>+	guard(xe_pm_runtime)(xe);
>+
>+	ret =3D xe_pmt_telem_read(xe->drm.dev,
>+				xe_mmio_read32(xe_root_tile_mmio(xe),
>PUNIT_TELEMETRY_GUID),
>+				(u64 *)version, PUNIT_VERSION_OFFSET,
>sizeof(*version));
>+	if (ret !=3D sizeof(*version)) {
>+		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n",
>ERR_PTR(ret));
>+		return ret;
>+	}
>+	xe_dbg(xe, "pcode version major %u minor %u engg %u\n", version-
>>major,
>+	       version->minor, version->engg);
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>index 18260c29e620..8fb3e4ba13a6 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.h
>+++ b/drivers/gpu/drm/xe/xe_pcode.h
>@@ -12,6 +12,12 @@ struct drm_device;
> struct xe_device;
> struct xe_tile;
>
>+struct xe_pcode_version {
>+	u16 minor;
>+	u16 major;
>+	u32 engg;
>+};
>+
> int xe_pcode_init_early(struct xe_tile *tile);
> int xe_pcode_probe_early(struct xe_device *xe);
> int xe_pcode_ready(struct xe_device *xe, bool locked);
>@@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32
>mbox, u32 val,
> 			   int timeout_ms);
> int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
> 			     u32 data1, int timeout);
>+int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version
>*version);
>
> #define xe_pcode_write(tile, mbox, val) \
> 	xe_pcode_write_timeout(tile, mbox, val, 1)
>--
>2.25.1

