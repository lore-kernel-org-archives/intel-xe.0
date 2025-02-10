Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943CEC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 05:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A54510E183;
	Mon, 10 Feb 2025 05:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5d5mCK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2710E173
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 05:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739166287; x=1770702287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lbLC8uyMYizvz3IKZwHlW+uj6SNVMamJfsP2t5ezE00=;
 b=g5d5mCK7lE+Ky4+iGoUvzGvpJEPGKCeoIolIwah99gkc5Makm/oDHz6u
 kyNAu5mDuy6L+I0G12/tfBVtGMuSXU55mWpEunmUOJOkog9Sa0t8+RKq+
 oG0sGRSFpWBOsNXHG56d0Zb37ecW4EOqtzR/LhV0CF/rqzgVE0oAQ5xaj
 JynyH+unkgDLXraUeZVlIACeAo8LZQQI9drWqXQCzCZitC/sgawbjKdQ+
 ffM2tFo0nRW/o7V8YhVgFLZgqKR5ZBnyfZt1sG89xsNZD0ArI2MkRDuU8
 6Y8NeWV0lnfwyKmFAIYMDy4o3mU26DPOxxDy4t2hb9L16vqcYDK0Ir0Lb w==;
X-CSE-ConnectionGUID: G0/crVr+Rx2mC0hmX+7BBw==
X-CSE-MsgGUID: b3SjimhzS6uaos9EVBatvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="62207773"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="62207773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:44:47 -0800
X-CSE-ConnectionGUID: BXTFW4oRQwWuCC77Ydc8Vw==
X-CSE-MsgGUID: gfg6+0ByQzykUnTZh79vdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112969825"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 21:44:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 21:44:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 21:44:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 21:44:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tihYyT1dW55Cu0SahEw1EexAhBLwvdtvn3+x6qUG1bfr9gykKlaoVXW/h77/HTWRsWiUrzeUmUMKqQNdDtPcaMcqX/2MvI+CjBO5DjUnRF6I0bJjhRiRQC8M7gONaIl1N7vAEEs2IenMGTvRID8WM4wuCmGpuA6qt2qNIBtvQAv+TkqZYEyYmYQjc4gAI1q/fg7tf+Ed95+VYlloKRnEm9k8fLzZ65qyoRpUWZxy+8teFa2+yvB4D3CvjZj93ucdGuXf5v90eKHNC30VIf0giaNXsNgatA9p0Edwx7b7vQ8CtRypCWVYSlCCdUHNyf+noVEfYJqL6q3qGQ9JaZhFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjW52sUM6Hg/qKsaCNID0znVh0UDVYf5Hlbe7F9GELU=;
 b=BJvLEbbZS1DN1i+7znDD4G1f0XFIKJ/q0ZtOFc5wxxH4oj4yO5hOLzIn+fu0OgkEtm3+lrdcz2EvPG/juHE0MTVM+4YieB8hWao1vBgvHkAlFp6Rptq2MXncs7mqsdmWobv0LIeGGw0HJtvsPOH49u7HZwtpu4AW/vuFmOt4kMAmq5Y+73WTHt/3USpVNwSFmopKyWhSwe7cAYwrFv00wJtUu2lt3o63Rm3tNHNBjddfrttZfJytvlIz4dpE38wyeaq11WZ92IeQa/klf9eGp7xhzipeXLa4ugcJr1tVJBI54MvoZwKtRrPvxVbg7Uzryzqc3+VjtRTow/gtq7sxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 05:44:04 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 05:44:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v3 10/13] drm/xe: Move drm_dev_unplug() out of display
 function
Thread-Topic: [PATCH v3 10/13] drm/xe: Move drm_dev_unplug() out of display
 function
Thread-Index: AQHbebAHdlgM/ZVMfk6hGaXWQv32SbNACRWw
Date: Mon, 10 Feb 2025 05:44:04 +0000
Message-ID: <SJ1PR11MB620466658CC69FA8B4D1E4D581F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-11-lucas.demarchi@intel.com>
In-Reply-To: <20250207221945.2878241-11-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6753:EE_
x-ms-office365-filtering-correlation-id: 3a7a2c55-3452-4886-11d2-08dd4995edf3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5clJN2fNxbZT13Z1m1rQPJr37PYxv845JbhCTzKm/rZol/00vGIvkmdIs+XX?=
 =?us-ascii?Q?J/RHbnLcfz9iG5pRFG+tRfXioN8i5iJuYP67UeHHDAOCCdCx75t3TCTvw4iB?=
 =?us-ascii?Q?+DQwhu97HXRkYCm9727cdeyjWVWgY5YwONWfNax03tE12Nmvgvc4QL2QU/lP?=
 =?us-ascii?Q?VVJugi6BfPx96NYIxeP1zXX9q740NJiC2/UR3Gi4/+BkSChz7kC4W0+xq5ho?=
 =?us-ascii?Q?KUqV4qEzEm0KFO9rc5xqiDHzrQYrwyFuuV7fSjeZNCXUZdVaKuIzTU65mK+J?=
 =?us-ascii?Q?/7ImwNN6NSgqiFWxrzvgO29i0IT6jcGSGJ7sO/mxWZ/82lDUDORysKsF0rbJ?=
 =?us-ascii?Q?+Hy1zoM0WzGDON3QwmCfjeCUD8iPUNzZQhkO5Mf/OMa1ttC/DqP1nGfDWvst?=
 =?us-ascii?Q?6J7qFSP5gvod7zaLz+LRsOhi6DBntc0qgnH3IoDrhpfhzO5pFSO78az0fWt+?=
 =?us-ascii?Q?BfSftZO/z/WtstWKXwU04gMqfpF8J9wkVfihqjkPDcae3laKOhxuKGWLsn3S?=
 =?us-ascii?Q?LKA98vrzHO0mcmGsdL0f5u0ZE5E4V2KMD5he/bKF9Qbmn3oCp5kwRdpX3gR+?=
 =?us-ascii?Q?AZrxvhBEaMc4vXFRnMTWsOBQOMQtFCbIS605lyvWjhqnqTi7ttkjmo8oJWyb?=
 =?us-ascii?Q?ehmZjDwl0w3Rd2iziWMpAGvpqNFDN5bUHrzV/JmPWZ3AJsq6Mc2TG4WmEt6i?=
 =?us-ascii?Q?KdLxHI3X7eDluJE3bx9BC8hS5kVRxqleVfK09lnXyOWRWE+xAmUdaOUjfRLi?=
 =?us-ascii?Q?Ivj6C8FDtMcbw1l2cmsYghEaJF8zPIze6TH1esXmLBdMY7F66FciLUtHNiy7?=
 =?us-ascii?Q?Qfz/I01rvfDzOG8VYFXXxCnoXtYwnuwbGf9qaU1KvecNLssrwgTgYffhe6u7?=
 =?us-ascii?Q?14Pfax83f5+XzAEPVp6TAIIUkFTLTZaUOJc8myTwWIUsu3eNQy7IogrHkxmF?=
 =?us-ascii?Q?hAQRlMWckcq5sxqXzUM8iyRt98lMAcwnqKKDY2Lr4DiDYPLPYMWpGLHHPwYV?=
 =?us-ascii?Q?XPGwc7CAQ0mc8qFbujY7n2LQ+C177a/STKWDhUXlaRtHQzQpkbtt9FReSe4P?=
 =?us-ascii?Q?GAgHK+K5KG+IYWuFWEFrFbfHXTAiuKxMDc4bsk97ocbRS667rVvtlnd7+hJ2?=
 =?us-ascii?Q?M4rfUuzn+INyKqf5+06UXgeT6wJf7Ld6yxsw/AWYuTEyyTKgl8We/PhQ0CSH?=
 =?us-ascii?Q?RFlOyziZsAV8QeGQWOgDgqpVEgK+UfByjYLmYIYnapF4byM9Q1QVbIvvmlSP?=
 =?us-ascii?Q?Lp+0yCyhP2qNjvpUSotYt9hyiEwwHw50ZG7J0ixOFQqLF3WBD0CBOdXOWUvX?=
 =?us-ascii?Q?xl8B9+uOwxc133QS1KiVt/3K5vhtPNLOESoEfCXHPQzsN3n5LEo3IhJ1pmZH?=
 =?us-ascii?Q?wCTBkfTp+xbry1Em65mwH1PIvbAZL9yGIqSMZJeqBJ+F4MtAZL8iNt9xLXmA?=
 =?us-ascii?Q?QXRSzYnjzNglsBGypgaFEKuHFGLBb5O+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+RjUGaUJZCjTPvHC1sHaoXpGKRCPpXLLbjV+BJxsLgREqwC2Juxu2ZsWMUCg?=
 =?us-ascii?Q?YYpz+m8ZAWlBzFlDsONRs50XIefVrUtZYj4eamUhzkSh8oI7YcGjvmcevdEj?=
 =?us-ascii?Q?7SfMgqeFbKNQ9we/9iHLiZ4b1KIpmy1NjBjei30PEb3R2N4UfgwW8fJ+ITNf?=
 =?us-ascii?Q?hfUnFc1IhR8pByCadHe8gkd41X2xY3hPcvH3gSvafvfrnSqAjp9THrDqWMVW?=
 =?us-ascii?Q?SKIkgL6rWnUAj3mrTYTPlnBaVV74gjJnAiy80zSxnlKH0WVhpb31BFO9W2fj?=
 =?us-ascii?Q?xpobuglrIsdZmjF4WCMCMdRHVbmITwoyImfKy/omVjNlkedZ9X2dJ73YLTzf?=
 =?us-ascii?Q?p1Pgu2l1tKLlea2SA1vNds+JK2tBN246HW1FG9QR9hHC520LbwuRHtt8t12u?=
 =?us-ascii?Q?tPEagWeDQl6U9orKmS/SvnfeayXpZfOJju7xzuEvkPQJtKQBL60+o9JtOwtL?=
 =?us-ascii?Q?NMhV2OI7U7KS57Ig3fRat75Jf77LPJh+Ub4yToNhIhRRY48SeqOnTKEIVx3x?=
 =?us-ascii?Q?3daoLZnSfdRPId14hMcO5WwO5PdA/uu01zcJUawgiG5BMavZXgHSoVJy8Dsa?=
 =?us-ascii?Q?A9gVw+gTW+8Jp4qpdz9fYKudadFs4ni6NML6YM1IZFrdD5H8rhOepz436HbY?=
 =?us-ascii?Q?ms0W1XTJI8AYxs9XbsGLK6ybXECMqrZVDFD1qsWiuFokKtCDXgtswN4NpwyX?=
 =?us-ascii?Q?vsBE37CzVkwF8WURwu3UWWzsA3MjD8YPneXFkjupCabk0IUadixTFyxrYdz3?=
 =?us-ascii?Q?2AWAnLmut0kQ5hU6YGgJp7GATW1wyWRqntVDSu7+3B9dJBI+1kg1dvyXN4BJ?=
 =?us-ascii?Q?XnOSaWdUKgdFS5tSXfp9yt3JTHFnM8IRghLybVFryH+D2B8uyGhKWYnl96u+?=
 =?us-ascii?Q?Zo2M8vN2trDERew4Gtrwlf1+0dYmfZA3zmLN2CI/erZGxWa0wZO6j0d3lvJ8?=
 =?us-ascii?Q?5BIpNk5IHpW54m3SG//R/TNMBsAh94kvHy8sbdAOiDfSwemqKdcxgG3n6nCt?=
 =?us-ascii?Q?RRaoI+OvMMnj9oUbp1KeLIEgQILiETzyZI951ZFT5v/GmM+OZ71+9l05ABxL?=
 =?us-ascii?Q?nE0HZC2CwMGtInDCYx2YQVp14zE67qdqFOQx5MRAeGrHaxWl7fASaT42IC7v?=
 =?us-ascii?Q?8U/HqGUQoqtKCk3O06CDdl2CHpdiNUX8wDYVCEi1kRqAurIfZog7OHjh6Ve+?=
 =?us-ascii?Q?bYzFA7KAAf0HAdn7evvtnaE7pFDN6Z7aNR3vFSo4mAVxKq/GnubK4wYTO9q3?=
 =?us-ascii?Q?wWzeyyAFNNbk3YL3MAC58j0mgTZTFNH9sHDBetqrwSGkSp2pmfPTr2tHiU/Y?=
 =?us-ascii?Q?cKJDqVEqifQM+AXM5bVgTJUFcndXZ9mjW3Wzc3z9iHcxfHesj6zZ1cQqYKst?=
 =?us-ascii?Q?ER7yxXGr9Q7HG4iVWURUs1OOIkmbXeKbnVGvcjSDCc+4R51Yt+yjLyxyn/x1?=
 =?us-ascii?Q?8vsckLgojjve8nfm5NCaNfbH1TCo3lwuXFGKhK2/8Z4fsZ4cV88yMV6SeVdv?=
 =?us-ascii?Q?ZPagcgCpOo7oIib1+jqYOrTaKNS2cRbRQ2Wsssi/4H0W9jbMHg2VpflBOG89?=
 =?us-ascii?Q?ANhLgCHo9CAF1I7ywMe8d1kQ5CJkdQQDL8JIUBuX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7a2c55-3452-4886-11d2-08dd4995edf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 05:44:04.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjv8FAckxCEDl/GKT9devQ6SdF9m22+AMgvblsQM37rj3uPjU3qbimMOPa5Pl7JNnEWfUYIWhP75xQf7kPo4lZ1QWKS5B49420+D4ntsccU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Saturday, February 8, 2025 3:50 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Luc=
as
> <lucas.demarchi@intel.com>; Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH v3 10/13] drm/xe: Move drm_dev_unplug() out of display
> function
>=20
> This is not really display-related and needed for any sequence on driver
> removal that has to interact with drm_dev_enter()/drm_dev_exit().
> Just remove xe_device_remove_display() and inline it in the single caller=
 to
> make clear this is not done only for display.
>=20

I feel this is move is ok, LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 944a40a1e0174..5e4c50a70df35 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -954,20 +954,16 @@ void xe_device_add_remove_action(struct
> xe_device *xe,
>  	list_add(&ra->node, &xe->remove_action_list);  }
>=20
> -static void xe_device_remove_display(struct xe_device *xe)
> +void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
>=20
>  	drm_dev_unplug(&xe->drm);
> +
>  	xe_display_driver_remove(xe);
> -}
>=20
> -void xe_device_remove(struct xe_device *xe) -{
>  	xe_oa_unregister(xe);
>=20
> -	xe_device_remove_display(xe);
> -
>  	xe_heci_gsc_fini(xe);
>=20
>  	xe_device_call_remove_actions(xe);
> --
> 2.48.1

