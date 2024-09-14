Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8543C021BE
	for <intel-xe@archiver.kernel.org>; Sat, 14 Sep 2024 23:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6311210E076;
	Sat, 14 Sep 2024 23:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n64Hp8ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B78D10E076
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Sep 2024 23:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726356601; x=1757892601;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOPhw4uvZHSrWL+DxmKgDc93TOJAFRd/KKYiH0NlHUA=;
 b=n64Hp8ieUkrG2Ijiwoh93fDdloM/dybb1T7ewDFcTWQo9OwdVw9UnqSN
 gWZ1Z71PTIIIcOFE7UwIqI+HieiJ1Z7RQ39no/R+PRDY0xwirKjLVWbz5
 R806+1hjtX0BEdGMb/0OzZrp4HzZaZGEy+qiaUAzgYCCGSw+HH3Ua2MnA
 2VbpKJ6YutniRHVaI6dHESamCwCMi8uxFJwm0aNsW26BZhKxSh2nljoh+
 tBejT3wi6kwtXb+kIcNuHB+3lAtr6aRO9fSOGOR3P/4J9p7jtdXcoFPRs
 CEYISBr5jG0cuTZUEPQUmr1nyh3mgcpzbTXy/c1W/+Ibnq2sXgoNYX+pa A==;
X-CSE-ConnectionGUID: YuQ5KtNMRIS/hq8Be0v1MA==
X-CSE-MsgGUID: zUqohI1VQi+no90k+4KXng==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25326296"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="25326296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 16:30:01 -0700
X-CSE-ConnectionGUID: +ZgUilJ4TgCLHHrcqSuAZQ==
X-CSE-MsgGUID: llIGo6YLTRmpBMBUzAwmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="69269783"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2024 16:30:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 14 Sep 2024 16:30:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 14 Sep 2024 16:30:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 14 Sep 2024 16:30:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 14 Sep 2024 16:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNUaIQeMkcKCTZZQrDtGE7uWOiGGJzqN88RkOVNVnEwL1DwsN6bVCGcYhqOMksksw5l89S0BL4Jjc5TZFXOJXi9s/2UJ+wPEkESzIfnJy70ik0xK+vlvMPpJ4Hz1e1Vqz15m6Bq1Hr/cOhDdkiDXkj9b4apQPh5ZRi1QzuERjJf0rTqYDtbmrfVnTLU0+IJlu4nbsr9cGi9gmY86Z1g2qDfCWdpNA8NtF4lUbXPCYRq7kLuZtc5cosa9suhXqdT5i3A+QPZYub1neE1EgVAK8mFVijEiu4EVzMraUd7USoTRP4gWP/vVNvPIKFzKgLDjHt6I7qCuAGkpa1y9TT6Rmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i5w1XY4YTD56gyKkLe110Ziru7bDRpIcQVWBm0paWg=;
 b=N3/ze3FNdkMlwbMg9m+p9hL9t4GlWl51a4OOEc07DPnLSk5gZleGA6fIGMr6YwEQPxqxaQUqdnXQfjYjt26Z+25OygPWqljaHs9tSh8NKSLEhc7jTbvdWEztU72Qhm0l/qDMTOIVfmu899DcFM4HtX+OvDvHPhaohrTOGgR5olQ22J+OR7sXXto50/4WVOm29bw8AZmKVcFMeBEZIx22VO3rl3nkZC/i3r4u9guhXmYt9VXdk2/hb7YnpnVU/npeOFMUoTFV7DuB9C7w9WN0q2jWdv8J1zI1a6OODSa10M6tct0H27LEP2+I6xj4Mmh+5glZg+RA54ACnzOHGwythA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Sat, 14 Sep
 2024 23:29:53 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.7962.022; Sat, 14 Sep 2024
 23:29:52 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Jahagirdar,
 Akshata" <akshata.jahagirdar@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v2] drm/xe/vram: fix ccs offset calculation
Thread-Topic: [PATCH v2] drm/xe/vram: fix ccs offset calculation
Thread-Index: AQHbBdSxv7g8x6wMyU60pnODJ4vvLLJX6PKQgAAFr9A=
Date: Sat, 14 Sep 2024 23:29:52 +0000
Message-ID: <DM4PR11MB5456F540B3D043C896C4773EEA662@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20240913120023.310565-2-matthew.auld@intel.com>
 <DM4PR11MB54565C34141FA293E75209E7EA662@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54565C34141FA293E75209E7EA662@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA3PR11MB8119:EE_
x-ms-office365-filtering-correlation-id: f6db83bd-6121-4ca1-e3b7-08dcd515227b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?uqJ5fHoRiNhiR7X6angep/QSXacpo3C8wUIHrTLG4r5MRcgzqK0iGhZD1Mtn?=
 =?us-ascii?Q?1nEo3t2iKTm1MbLGbTomPRXTi5Ok/5PM3GkxkwLEIt5GnpJ/SN45LXb0v0T9?=
 =?us-ascii?Q?++x66kwLvuEGYiBq4gfIEijSvKSEPWOGy7Zl4WHK8rh43ZIJPPJ1C21et1l8?=
 =?us-ascii?Q?YA3/Ts3/iXujh4WLkoqmo4PXI0EY5zjwZT8Fa1bM3IEyHMHD4FNn+uP5uDND?=
 =?us-ascii?Q?g8N8J8Plv5ufK/zeqmIIZHwlQDVwcf0w+X2apnA7ipNzDXu8e1QnowTJm6NI?=
 =?us-ascii?Q?xjV+xl6wMmCNEZecxJ29Vco3KIiKjEXrvKCaCxO0C4mv8KF5OMa5MJDfzsw3?=
 =?us-ascii?Q?5I9issUE4yfjGR0xW0XILSWOoA8/Vkph0mEQWZ1eSh2uxiQaQ/a8WNmZjLan?=
 =?us-ascii?Q?YMzd0S9gBBmf86zqckreNg2fMnmMUlivASc8I1RUESTCp4cU5Q38E3CPQEQ2?=
 =?us-ascii?Q?3wZwtmU4DJx63EKB8LSw0vHhvkW76dRWG+YpaRT/4GWNCYl+KY+S5OB7/MoP?=
 =?us-ascii?Q?cjRXNji0C8SAg9Cvv1aTrCXsniVFvZAFtRvVAx5lInhuTop3nIe7Hp9yUCtn?=
 =?us-ascii?Q?S/bcmF+V1GMW2nCc5gzFbeZUoyCo0Itu4Zoem+1n6xIwu5HRAgQvCL/YZ6Gf?=
 =?us-ascii?Q?Q/y2A+qg38f3kPPRAOSg0fQe+RYL9ILdzIfaOKQaaMJxbRO5RWtCM49PDBM1?=
 =?us-ascii?Q?lIKU7I42pafkpAZaMQM23MybP7OByboh9gW1xyU/RC7qKr7Es5cP1m9oyzS5?=
 =?us-ascii?Q?rq0T9sJ6QhdGfD0D6VcnO6sMTRyamUtL6+iTBqBRKWyd36ZORllao3rAiPur?=
 =?us-ascii?Q?Wp7xLsxgck2HEicArrKQnFNSqm5deJJiVikkfHgwkhPRKzBWwiK3xAjPMPDj?=
 =?us-ascii?Q?AYa+OtqenUCL7XPiCQGLLaOCuDP9/oYlZUrQ0jlaht2NDmbN5oOxkBRt9ssq?=
 =?us-ascii?Q?Kd/7YOjgvcWF9HjE8LAao31aF1jB9SC6MJ+80/rfHEyOQ8QPufhMHzhaW8bs?=
 =?us-ascii?Q?fI8J6JmV4UHlnwkuIZIS4gpAJSLMrz2+tdXIhXbWcFm4I+GqTpI9dEiD4vIh?=
 =?us-ascii?Q?+f9LzjIEBradlkG8Ra6VpDAwyWgdEWMq/C+5QhLFGOr67zyAv3PFsYtggdlN?=
 =?us-ascii?Q?z1HYn5neDqRgge4iQZbDghY5w5wBGDznbsIQkTGSfzNaU+Dm/PFmd+nKIRwX?=
 =?us-ascii?Q?2sUFHgncNp4l/6eP6PsWWOY1tdMwbSdkbU9er+UHHwFCjmRtmSi7WdcNU4ji?=
 =?us-ascii?Q?OOHcE3r5k887VzfG9RgJovO6adlbrPOpHRSnrJLJroDokga6yL3Br+xf2qbe?=
 =?us-ascii?Q?IN+b6E0mFdZjoy/dnPE9sIv5rlkGB0hiQYAJw8zjMqYwymSDccOSssTmzds7?=
 =?us-ascii?Q?ZmoETIvLvlXYeHRskNvjeToqhAmZe2UQRPjv+F2vyXS8GQ/L1w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RzhaITP9dr2TDc7cNWaWU1H4eXVqG2zaeyVf/JZ6TZsohcstS7LyaT1qorDY?=
 =?us-ascii?Q?ClSYde4Et8QxPzze5KRBTWPme9CtZqmNvGVdOS+6jFRMAVH4wE9xq+aC+2TK?=
 =?us-ascii?Q?OU1NjPZ9StMZGv1HCCd6LTxOv4mKiNDrfJAf2+s8jE6aCaaKnK66evFil3tW?=
 =?us-ascii?Q?5cZzaP6+/CmDIQLEtF6jryIWv0KzNb9x8nU0wCks9wJ/qKacmg0y2dpFGX//?=
 =?us-ascii?Q?1jyslksnk/C/7eVfiS+h33yyODwOIScE+/l2FSDG8kg0z2RDd/B+A02Lbbzs?=
 =?us-ascii?Q?4cLK6OnvYg3okxjcHB0kPwBdv4CbHW/SYf0lXYY3GL15pzmKUb76zrKJQ5kX?=
 =?us-ascii?Q?AfSL6TIy3cIpe82TAWGynTtfahvGBYkfHV2ARBtf/dRqQQaYlZTaBYO7RPuB?=
 =?us-ascii?Q?bPTfpAiSN3hv2mPVsUHMt88aPbWBOh38BaDkrOSUSveJTs1ffZ3LlIxTqjVo?=
 =?us-ascii?Q?4ubEBy3m917Nm7M6pv+VgGDpaNAJrjA2juRxzdgj02+gNh87TGGRvuE9wgbY?=
 =?us-ascii?Q?3UfBI2LKM5y2BjiKQYT5w1Z5jUnpRwCSQnNFkG01pJX2esMPMGtzeDyLVCFe?=
 =?us-ascii?Q?ktozZ3POFICCfUvUB43zk2QSphKDA1r8hg92+EUOChgRbwk7sKkJTepynUJQ?=
 =?us-ascii?Q?JvKZlyRRXbVq3ZXBzwx6yQyBsvguX0FfDq3mFmBPk3XSf+uEvk9j46wEkvs4?=
 =?us-ascii?Q?ae8PLKPVGxIDg4b2QT3YDtXsKB+H+xLodlUOTY4M/wB2oOYvagtxRY3vlCbQ?=
 =?us-ascii?Q?e6QPTeXqVYqrTdtCG5L1VcmxN48VStoEwVNYMLOQdNqbWHPWxCJF2hv8EUk4?=
 =?us-ascii?Q?+S3RuutlB1JeVC26sMQmCCev2QpiTGgDq46VJBDquFS61vZWeMuir8Ekocbw?=
 =?us-ascii?Q?l91woRdV6LXYGQhrunulDPrWta174fuD7ih83f1+eD1OgDGCdoqP05p53zUD?=
 =?us-ascii?Q?EfeUY5J6JhFaJx7Xkrt+4TiSBQcCnnAuTFE++kZ5Eqxl1Xti34xA05LvKfYd?=
 =?us-ascii?Q?STOi6/ZpkS0XBWTdd2PSvIsiV+Q/FBsmfLjTULkPv1V7GqZZiMGVMd80lok8?=
 =?us-ascii?Q?DkgC52UgutwvCc/zla39GZs+iZkKviETp/zrccRsxZj2ZtQKLoqpW61Fgapc?=
 =?us-ascii?Q?Ry0FvPEOBMO3BJzHlbU3QKLJCkJ2l5Cp3C3ibfSZ8EkZRK23M+mBgQB4dcL7?=
 =?us-ascii?Q?SrRDknO7QtA2WXTNfk0NZjlqZNLscbV44a1ctwSA7jXKzCorHvP/FgywzpSw?=
 =?us-ascii?Q?dEgUxHhGHMAj3dtdwj1DqR4tphyQxCg4fU1WMq4PsE7fSo0mq5ix7YasWjGP?=
 =?us-ascii?Q?rH7j+RsAyj0LQ6uhbEzczQLRFvqR7XPe29xsyIf1j2tdqFdZu2EkGW/wlitI?=
 =?us-ascii?Q?hmwzgjZHNhsnEVG1E5IZ5UbJXKYdnY1AZcHuZvPpN6j+dXYHOALOjuoFOrVA?=
 =?us-ascii?Q?+BZYzHF69Y8epiA2AFYGZYgIzaZAXk4Ipg3+iyP09LI6cqqju7J5Dep5NGk3?=
 =?us-ascii?Q?z7hfTUf/GnlWiKuQO07cyTT8XD8l2YbqcskNIwwonXjzv2CSYEt03qxWpQes?=
 =?us-ascii?Q?LetH835wy1Vj7JzgZyayQBPVr62coyP7H9nfBQoT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6db83bd-6121-4ca1-e3b7-08dcd515227b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2024 23:29:52.8995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5QW6aQLjXF7oBxOWcNmweSTqCNamIDfXdnECXyGfHD7ZIBPobPgPcExlf0fszMRi8yHNtOB2Bsx37STO9A113g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

> > Spec says SW is expected to round up to the nearest 128K, if not
> > already aligned for the CC unit view of CCS. We are seeing the assert
> > sometimes pop on BMG to tell us that there is a hole between GSM and
> > CCS, as well as popping other asserts with having a vram size with
> > strange alignment, which is likely caused by misaligned offset here.
> >
> > BSpec: 68023
> > Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for
> > vram")
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.10+
> > ---
> >  drivers/gpu/drm/xe/xe_vram.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c
> > b/drivers/gpu/drm/xe/xe_vram.c index
> > 7e765b1499b1..8e65cb4cc477 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -181,6 +181,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt
> > *gt, u64
> > tile_size)
> >
> >  		offset =3D offset_hi << 32; /* HW view bits 39:32 */
> >  		offset |=3D offset_lo << 6; /* HW view bits 31:6 */
> > +		offset =3D round_up(offset, SZ_128K); /* SW must round up to
> > nearest
> > +128K */
> >  		offset *=3D num_enabled; /* convert to SW view */
f> >
> >  		/* We don't expect any holes */
> > --
> > 2.46.0
>=20
> The patch works in my platform.
> Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>
The round up should be applied to the SW address. So, the right sequence sh=
ould be as below:
  		offset *=3D num_enabled; /* convert to SW view */
+		offset =3D round_up(offset, SZ_128K); /* SW must round up to nearest +12=
8K */

I applied the patch manually and didn't notice the sequence difference. Wit=
h upper sequence, the patch could fix the misaligned offset issue.
