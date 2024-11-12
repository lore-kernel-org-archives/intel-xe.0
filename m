Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB66D32D81
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 19:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE3810E61F;
	Tue, 12 Nov 2024 19:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPEe7Q8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BDD10E61F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731438523; x=1762974523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CKC7lBSYRUPuxt6GJCXBvU0rSCZXQOV0R58XiSK3pBk=;
 b=GPEe7Q8DPNNdTQfB3o7qRxHnIQ7Ax6SC9XB5MAvIwE67u44Rcl8LePcx
 zMVIqynu8ccdU0YEheShJmn17xRB/bR1L/xKV0WeYqBOq0aGF0D8jkHL9
 HsVScGkGQRw8x3auUHwC00qaVvcuXad+dI5yPWtwNsKaEVDKjhirHHgly
 fQNWS8+91dcvmtgcqTvfNztGycvDbNzkKjlxOCUb9ra45kBQmgAF7xBzw
 7aysjUOPy9YdhIkYY4yjqCXr9FSQ5tmOz8yWQ6of2nhkRJLcno3vb4RVM
 ctDXGZryA+5WMyL5TVPCm4uAtTZc9UIqhRvlL8TTyRSkyjXAjF5UzyFhs Q==;
X-CSE-ConnectionGUID: 9rdAseVkQzCfrPBsFJe0PQ==
X-CSE-MsgGUID: oxCTDH6kRfK/OZyg+WXBNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53849739"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53849739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 11:08:43 -0800
X-CSE-ConnectionGUID: NNYCBZ/jRNGMXv2WuODyRA==
X-CSE-MsgGUID: 2o/Nhm9ySHClh7iGdac/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87519683"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 11:08:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 11:08:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 11:08:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 11:08:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAMbrmzbOAtFSIqlp6NEN74YY/IAgU1euTP9JrtTH9SSY8Q94G0jNMA6rAa0NmvWUDUprA8AgYPB2grVmnF320SmMtMhlRilpb5mfhewMB5HOBv3kpYKm7EethkR2LPLR6cP5B2V9U6jB/E/b3UpGsiGT4FJSvTwusUmeqsQ9utrXuxUpCDTE7h50rde6hjxhPhGxF7VhkGSKKfNU7rbtxCVw40zZXqQtkZgU07zJkrfYln3gIUwCbwmVH7LjvGxLZxnEmrboD9UHXNUk3d4fah8+MgzK7cYkTBmaGTXby+86IVgMeS+HcIggxzQaoXHQYY0cOCIKSGOcQU3OsPK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwOzSmlnMKVR7Acmns/Ftbx4T0KhhWQ0Hf1lulaXHDQ=;
 b=G+OB5lTDYDjL87IOda47KmCRAMGOGjxiAzRNq88kkixmW4P9eHPNDHmPbqdEv7k9+zWjIVknHcuQQ5Vrns9YAzHTVwHg57ciZ/dcaM/+Y699iBUdN1DehJ3zFeTY4xbScsTicLXOXFjs+sOLbAwg0iVYn8IvjEq0W0JrggqKNPVecZKc24FPfJGz55P1GKu+eRfg6omN8B134nsKTwWTpwvNAjcRta7lgb8xSj/XJvGgKwx8dzoKJ9yEc3DwRCb9aGKTCNWYO2Lvvf6fSdjoEoruEtAMEB/DbWx1jqd3RXIcxrhTWoigVsZA0fPmr2fjyTg1sBTyzOaoFwk5/ERemQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 19:08:33 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 19:08:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Dong, Zhanjun" <zhanjun.dong@intel.com>, 
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Thread-Topic: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Thread-Index: AQHbNTRxfpFZCeU5Yk2jESwrASXV1LK0APCg
Date: Tue, 12 Nov 2024 19:08:32 +0000
Message-ID: <CH0PR11MB54444FC80C5508B7D9EB064AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241112185515.64060-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB7156:EE_
x-ms-office365-filtering-correlation-id: 0ba1cbea-4c84-40f0-48b5-08dd034d66c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cqsY0ONy3TJktrmYNdTOqeQtfQDWiF+yn096APAdVd0gFlOFHnf5mrP9Z/jv?=
 =?us-ascii?Q?w42OYfBx25qb5XtsWMtbiRl/UdxL1eG/XoBPkjvOJAMP3MHMATfKgIJf8lDp?=
 =?us-ascii?Q?lHrljaLvgEgZqHyii5UpF7t2q81vhXVQ789P1sUSI6U2diBcVBFSsaaXJbtO?=
 =?us-ascii?Q?uaZc72ZF+SbU46+o5ezXQsNbJmPNvymoN4frRTtAAF6u9He5pnuCietdwHIk?=
 =?us-ascii?Q?FT0HkvZK2ezy1Ukk2P/dvwQrrsWxAHyB/pYVu3/8iuyfSkuy+PUN1xmhecLP?=
 =?us-ascii?Q?JsxBXvg9ywXejJkzfO1OUaSntHqCniSA6E/FvJIudmjny7/SYAl/umf4c8iy?=
 =?us-ascii?Q?BZpAUsUtrIVBw3vssVTHJcnjBYYIm5lSOrFjb5RSMSNV7FpGWtFXDSZOAbw1?=
 =?us-ascii?Q?Qotpy/mSK22cxsT2TOguaw7rd+m4hNx4WpeaoC0NLPvdeIPIcoDHFXKHqPTR?=
 =?us-ascii?Q?XjrgyGACdgETeIvSbAW8ALfolJYmQ3yRw/c4l48UZHE0xrAT9JBdmNIw97wl?=
 =?us-ascii?Q?oTrNqnFQJXt3Ez2xPkNnUh9YC76CfeXjQVyg9K2ckHr2djVIisnh7S4ceU9n?=
 =?us-ascii?Q?hmbsfa/IczRiWg0UEeGYj1/WKHfv2Iec2geC51X2bQ6INHQOwhRatV22530N?=
 =?us-ascii?Q?kTxAYg+qhRTbBkwCrV5PfStC7ZIzl4LkmXglW6pq1D76/s4f0I9TCPDXp5ls?=
 =?us-ascii?Q?FU31z/j1YNzhnVmXEjOnHDb5sKTy0zf7ORY9b9aeqsEi1lRkNf+SQFkOoRi8?=
 =?us-ascii?Q?M39OhWwdPu4SHMou2oZIMLGXFgjiwd0qQBOt5I5bY5BZ1EVc77o+ov9evWAZ?=
 =?us-ascii?Q?ER3ztEBMA6IHFf8ZoYs1TlWwjIFA2iRjzfTwVKVnJ9reDwryHYS575MZJmXF?=
 =?us-ascii?Q?V6Wvx8mX1Hz+s0EgLusLDYoRtHW/faywjZdUzGsFrrR7kyQxMe3+byUtqrDG?=
 =?us-ascii?Q?acGgXy2mCAJq+YA7L/pM61qVQnW5Z62P4APb5oCkfhPgTbI11QIfUy7S1PGU?=
 =?us-ascii?Q?cRzx1YLbKyCWG3+h/+jWrokD36wysbkvnbGVSWTLnl970pjp4zb0Nopmo3Ri?=
 =?us-ascii?Q?m29CpecnFlq7iwy1PD/ytuUECB3PFudNB2g5SJe4s8Tl98MEZQdOoTp3AhFZ?=
 =?us-ascii?Q?1kcsAIH6JwOI6OnuEEU7UiixPVodHOakAtzi/7emu4gEV57NOhE2NzbLG6d4?=
 =?us-ascii?Q?LopLknw+1l9qtJxGnlKiJjzSaqm1WJhiiJ4TeAvEz19tMGmNPMhWGHtt3AyU?=
 =?us-ascii?Q?Ef1Iq21KK7DDK6Vw+jOBFbg9VU5oUHelUb0BcpsQP9J4/CTkK1TruD6Hvn6C?=
 =?us-ascii?Q?p3zoB4IidQOentHvv3l5Q8jU6TojHpz2SZdHemF2NV7tYCMbW+nAu4gF/PAB?=
 =?us-ascii?Q?x6n8auo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gySsNKNa/eTCk9RKRprydviFHVKQ87uIPdVQxSoAPJw+wcbdivN5It0KkVCM?=
 =?us-ascii?Q?CoLAGHF+pu137HdBHeFvVBZNmdYMuoBc2bvT4yc/xL3igbSc60TxTNxy8nW7?=
 =?us-ascii?Q?S5y5ikcC0EpirM3WYrdbNPnfzfas18Jo6V1vn12KpT/4hlW30UG54KuUz1Rz?=
 =?us-ascii?Q?xmNnxKzgR174xYWUZV4Rcj0Pm76vY7bp/cYaSkPsN0FkIVmOpn0q5JZMRPYi?=
 =?us-ascii?Q?aziaBHMFNOEwpayzdBCvf/vAFztOd8sQkAgwxcbX+LHZ5suoSQufhvowJR0n?=
 =?us-ascii?Q?n8FtQIAkyOa+Xx9CXDykCHqR1jmSTPSjZKeXahuHGD9zTRaZ2NlfBbs8Msc8?=
 =?us-ascii?Q?N8f5+q9kNTMaKqocqXJZrZOmCWbWO8rMy9BgIyDTIRrrVr10bc+8ymH93/zk?=
 =?us-ascii?Q?+keY72oFtNk8c51uEaT4cVExvC4zw+QOfWd1u1fgmOLBaIerDMQeg8A5qKL5?=
 =?us-ascii?Q?lA5GteaEVJ+ikt05XTjTulTFabppnjfJetJaPXdiE7Mb79cvVZhLaKm6+9l3?=
 =?us-ascii?Q?3qAqCJ5Y01k/yJ17z2gviToc1Uo2KBZc+uF4M1y/djOpMDyNOWjsINqfqS7q?=
 =?us-ascii?Q?e/L/8l7q6FKBI0El9e0obM5OTPcpcFvG3SLgvpU4l87Wr3pcRiA329EqfVOk?=
 =?us-ascii?Q?nXssgK60SCLYiLFPvt/zIXckZwJ8zgq1qY0tjhc/tQzs+h9qJ/0+XpcRdAdC?=
 =?us-ascii?Q?vC6YKfqAE0lPi3zcvx21STXfTxkT75FmRutctCTQs2m0WKXelm/mPHp8XpUo?=
 =?us-ascii?Q?/v1Nq/xrOv1VEVwwvq0dt0ADmyIL4oNRb2Q3J2ZQ1mZxg9OXB5zUoVlI90Wl?=
 =?us-ascii?Q?uInVF3w3c5brDDl/dhkdt4N8+/9jP8dbddNVCBqLP5nzDAhwBOdih0rX/5p3?=
 =?us-ascii?Q?eKc0MranMFcW6Aj3IJayM4LiL3SMoDpe46+IO0Vub95QZzAyVYDEc9vkKZ6c?=
 =?us-ascii?Q?UrYHtUOYSuwiQ7YKYsBmlRO/Ezxu1ihEDXU9X+DwZCd27zEs2RTilNUnWA8C?=
 =?us-ascii?Q?jgnSTeWI41wSknijOkN2VguD+WBez36Dzgj727x8DOBhSl181Pyq3bGHVwJM?=
 =?us-ascii?Q?oM19npB7fJEzeGo3As/a7XpEVH2zk8A/CvDL3Hazy+5DcX3XOjB0brdhPkuG?=
 =?us-ascii?Q?yXQxbK1ojgq1aJiDnhgg2iKVjPM3cm3HovzGdRHfqMoRZBNQg+G5YYFxhMuk?=
 =?us-ascii?Q?lk5tTrqTdpOjz/P8POIN+rllK5J25TTvRnPbDsam/BKkzSdchoF4ht5wFXVe?=
 =?us-ascii?Q?BVyYxoqUv+YTzVCTyT2dOJ7MEyYCEn8fomp47dBjq/C4hLIG74VX5YHANdBQ?=
 =?us-ascii?Q?L0Xdq6jO6LGjzgC0DbGce06O28Vf5EseI2GxC7fWoLr2eONAVDkvHYsee55j?=
 =?us-ascii?Q?S+ouTsj3vFWLrO+7TSEksx9l1DHKtKatnto6gahtxxQhI2wgUP/n09O5SKmo?=
 =?us-ascii?Q?sON/BqPet8cVQlD60SO+fD9yu3e/tGkU/UT1R6JonWioJ4/VYF2kjUA5/kCV?=
 =?us-ascii?Q?Z3NLhYBQiBkWaxz8m+ZtXReUlQp/ATSUrqhEGmJcIDEfMqr7Lv2SwisdIRY9?=
 =?us-ascii?Q?NFSeu5GK0h/0KEP6lTEV3SxpjWNqjb1IXqNEtwHn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba1cbea-4c84-40f0-48b5-08dd034d66c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 19:08:32.7511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMzTT3lAIpiITH2NJZz71b4AYyvVmLF0absvGU5H7lKPOe3528/91FES7oc5I8cVQ0c9NZRhgcEn+p9G6nF8PB8bTInOLX2y6w5ifWk+if8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Tuesday, November 12, 2024 10:55 AM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c=
.harrison@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Dong, Zhanj=
un <zhanjun.dong@intel.com>; Teres Alexis, Alan Previn <alan.previn.teres.a=
lexis@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xe_lrc: Rename desc to addr
>=20
> The qualifier "desc" as used in the xe_lrc_snapshot struct is a legacy
> term used by i915 that has been incorrectly applied to some of the
> attributes.  Said attributes that use the "desc" qualifier, namely
> "context_desc" and "indirect_context_desc", would more accurately be
> referred to as addresses, so replace the incorrect "desc" qualifier with
> "addr" in these cases.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Matthew Brost <matthew.brost@intel.com>
> CC: Zhanjun Dong <zhanjun.dong@intel.com>
> CC: Alan Previn <alan.previn.teres.alexis@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>

Upon further inspection, it seems that the last three CCs were only in char=
ge
of moving the xe_lrc_snapshot struct from xe_lrc.c to xe_lrc.h.  It would b=
e
better to get the people who originally wrote the structure CC'd here.

As far as I can tell, the struct was initially added to xe_guc_submit_types=
.h
in the following commit:

bbdf97c1 : drm/xe: Convert GuC Engine print to snapshot capture and print.

So, pinging @Vivi, Rodrigo for comment.
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  drivers/gpu/drm/xe/xe_lrc.c         | 8 ++++----
>  drivers/gpu/drm/xe/xe_lrc.h         | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index cc72446a5de1..b95c21a18c31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1632,7 +1632,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, =
struct xe_hw_engine_snapshot
>  		if (ge) {
>  			guc_id =3D ge->guc.id;
>  			if (ge->lrc[0])
> -				lrca =3D ge->lrc[0]->context_desc;
> +				lrca =3D ge->lrc[0]->context_addr;
>  		}
>  	}
> =20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..09f0e66952e7 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
> =20
> -	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> -	snapshot->indirect_context_desc =3D xe_lrc_indirect_ring_ggtt_addr(lrc)=
;
> +	snapshot->context_addr =3D xe_lrc_ggtt_addr(lrc);
> +	snapshot->indirect_context_addr =3D xe_lrc_indirect_ring_ggtt_addr(lrc)=
;
>  	snapshot->head =3D xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal =3D lrc->ring.tail;
>  	snapshot->tail.memory =3D xe_lrc_ring_tail(lrc);
> @@ -1692,9 +1692,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *=
snapshot, struct drm_printer
>  	if (!snapshot)
>  		return;
> =20
> -	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> +	drm_printf(p, "\tHW Context Address: 0x%08x\n", snapshot->context_addr)=
;
>  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> -		   snapshot->indirect_context_desc);
> +		   snapshot->indirect_context_addr);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>  	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>  		   snapshot->tail.internal, snapshot->tail.memory);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..f6bf81009294 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -24,8 +24,8 @@ struct xe_lrc_snapshot {
>  	void *lrc_snapshot;
>  	unsigned long lrc_size, lrc_offset;
> =20
> -	u32 context_desc;
> -	u32 indirect_context_desc;
> +	u32 context_addr;
> +	u32 indirect_context_addr;
>  	u32 head;
>  	struct {
>  		u32 internal;
> --=20
> 2.43.0
>=20
>=20
