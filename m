Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458AAC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A85610E407;
	Wed, 17 Jul 2024 20:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvmbnHeU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE0310E407
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247448; x=1752783448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qg0RaQ8Z8Ci7Cr+XXtKSeJfdzlYmWDq8jYV4Vq6V9eI=;
 b=KvmbnHeUJooknFi93o8Y+rvCwdVZi/zU+8re3NRzY8UgXi+RLb23P8LZ
 liWhxXcEMdzzdtf/mAhmzURjfknRCSslErZO4F80R7uFrDeEoQNnFcZ66
 pFM/uCqkO7DVq1X1cKNVS++8tX7Jk5SWmdAuQc/CgY44vSA9K6Toj77we
 G5RLy8OiwYnV6uI2+W7g5RsytkYMPeglB4SqQ4WJz1DxTORZ/2wrvVwLq
 FhvUliWLpMIQI0sGpAUuoCOHLrr/tUCTGMnrPkVbXBdRVL6bycQTlmlJN
 YI5GLOL44a4iTOZupwcjP8MUyq0i+sSPdNqXpoJxb4Gv7VWZYkNq2UJe5 A==;
X-CSE-ConnectionGUID: e4FxPOWMQpiL03Gue9jsLA==
X-CSE-MsgGUID: Vz80UnzIQg65LDerU3WF9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18916919"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18916919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:17:27 -0700
X-CSE-ConnectionGUID: gEnbB27/QSG0UtXOfaBPRg==
X-CSE-MsgGUID: v48IY7LJQNOEEyawXgKsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="55352621"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:17:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:17:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:17:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:17:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoI1Xuj5JUCpG1eYAIH3lN7xhgYAmxPVw089ALCWbmLXp+YsJ+EsvW+BIf8iqd8gYHzEVsUSIQ5DffP1Wls3Cl5b5ZUf5MHcWqHDaedXfNh1w2MXfzFvGVsWM2j/phWdmwCnMvS6fqDMCX3Ij1K2Hn+qSOPPU2rDR+cAyJqiZl0pzGLqmvdByUv2m1QISiLaeJiLuQhUOzvYRBx4ghDE6ftLywJIaaZQwk5vFtu0ei51PoqbXPMIKMNB5BQQJgitxXHuNKtXW75GxKaZ6dD1RrcOh+1DvKv2klYyal49XZi9Mch2RMANP759MWM/yWJfYVG2D5FnunUcX5bgja3ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv/Nf98DfWOAgk48Xk5Yafw8Xxr5v1rZVtuXbWLM/GU=;
 b=nMi2W92fKDpf3tX1g0JlAc2foyY70zRz+uq8QBg2aqDEKUg3ieGSPpPgKGRtVELcm4TATLypmUsGU+3YrtA/SpJmlwlDN2Q6SR2YDsy/n/RTtABg0SHnB/Mz/t7w2BUt1z2W2a5UB23sXIRFoKOEvLgwolvYICVz2zEMUMBuUB3QbeZuSBwVbZgWgbBf+szS7aXkRF6EQRIw/AnTiFkWdqA/MB9LVWcgnKje0zKnRrVzcHMH+UmbH38plnrqvKbsXqpVXS99pk655UIfMEFZpCmNGRA43c+57tzEAXz8dTTYTfvapkoU0CsypLI0S1n+rQO8ha4c2ixNF946tgiWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 20:17:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:17:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 4/7] drm/xe/tests: Convert xe_dma_buf live tests
Thread-Topic: [PATCH v2 4/7] drm/xe/tests: Convert xe_dma_buf live tests
Thread-Index: AQHa2ILwxIi7DUTYZ0eZ9IzSY8BTVrH7Wxww
Date: Wed, 17 Jul 2024 20:17:23 +0000
Message-ID: <CH0PR11MB5444E83BC6DE82E5141F711DE5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-5-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-5-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: 78740399-8be2-49d2-927a-08dca69d785f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?LdGveeac5CJCNyqIV0BUCg5QfQwmKdwHBBEfo5uROtugY06TwYDm9pqKliWs?=
 =?us-ascii?Q?y+9xxbpgYK5AYTg6hZ+RMUePs/VXp0rrnNBZC1PYqD1+Lcgsi3dXttEV9Lg+?=
 =?us-ascii?Q?hnl2ffwL4P0hdckd8utpZxpQ2yptW2GNeSJHSZZcI7i7dMGI5HSG5GzGpzKk?=
 =?us-ascii?Q?s6qP3nDp3k0gDfpYo2c3EkLVN0tSDDlilqnfukZLdHa1ZKeXLWzhCLjRXmhI?=
 =?us-ascii?Q?PKh4ds8O5zxtEa50tXA0E83cH/z/4tzliWiOR+2wAjglnEvJ9Y5aXqvL1vpg?=
 =?us-ascii?Q?GZIJ30tL1zGMJJ8U0c567BGWauK7LgRPNc+AcLNXxuoAvUJq0Dd/otEjyyjf?=
 =?us-ascii?Q?0fgGG1i8LTND7+KxjnTEODirrCkhBzMxhX9nQXQzU8QDeZQb7msYYjOsPzkl?=
 =?us-ascii?Q?pYaQg1i0Rg4y96n5slAgBeb4UjqCh/xCl2KhAMHHY1VX1GtJxU3hG0Nwz3Hp?=
 =?us-ascii?Q?hrq8rg9eszmmk3GYOmDmAUm7lNDelDj/bgKd2fc527mhO7mjrKp2H6BvIqTz?=
 =?us-ascii?Q?PmZ/piADwTtpLNcxQGq2nDwumeLgw4t6oQosZVI9t+fJbIrZZMVfvtn2IYwD?=
 =?us-ascii?Q?7qoICjTLzWzrzKdGEetF+gNkVIUlp64wGyTQa+NS0rkLioojThe494unwHTA?=
 =?us-ascii?Q?uv6LcYthR/0aW1ENva3mX0JIG0M7CCewLSM477c44k2/mcWE7oPyHUphLV50?=
 =?us-ascii?Q?e0q3llTb5YOCgbG3bzIoAR/c+OUkSHZ33NGYlMgluRQAc7XrGC0+q8rLrOHc?=
 =?us-ascii?Q?pLjtE991s8lUjXkkxGW8suGy8EgIeOFhDMc8TqaakFVALsyFcjEJOM0hG2hz?=
 =?us-ascii?Q?guwmWXRaNboGFBn3ukKR3RW7mjVt17T2ZkkWoLF3BAg2TPMQVxvOp4Y9k7j3?=
 =?us-ascii?Q?OoYNFaQvr3cUx/EijwOTSQ4jECxkQ3/olHhu2HBChHIYe1pbQn84XMZOdXGy?=
 =?us-ascii?Q?w6pOU9xbPzzIouhipr/mGHpX1Id4LCatCznY/zraNP6IFUammOtRFinzodoO?=
 =?us-ascii?Q?siUAtlaWt6hRmmMrY/D/I+KLMiLn14DGRC0nhQGmVowMCuyyWXNPhk8DHPK4?=
 =?us-ascii?Q?6/IAiPQd30O4+pjWJOH/6Qy4pvvt45UKge1Cu+a1M39ZMmhc0SISAyx13d7O?=
 =?us-ascii?Q?+jfu6P66xWfIoI6OmCzAJcov90CCPZ8WzmZnbwaydDZF5YHkCt3Q1DM6rPLn?=
 =?us-ascii?Q?nKJEmzxECbXW2DXv0FNnElX9NuNem3kDKoM5sFCySM0RL+W0Z+K+Bv/DygFG?=
 =?us-ascii?Q?fgRTDMrPpRuPAYPov8RAAc5UOlkbmNZ+oDznnoiJHlLl2K1ro3QDoqAsfo5z?=
 =?us-ascii?Q?saiDTxtNe58gwPAUkY4mK8TZdLeqW4+gZVxHR8+W/XJ55hvwqdxJkaBrvcYV?=
 =?us-ascii?Q?YsIIMsx6zxe+7Wo7yXYr0NRosC7Fvk+sS6LfFwwjKeOd2lH1oQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZQQ8pcDqWjjusg5PMnfmxmS7h8uFXzwoAm50EYluCSg6vhtthrCx+sgVMPSM?=
 =?us-ascii?Q?Yiq1HOOxkRfvmLE/PLXZR3UEbstKQuFXlGfbOnwcLbap4V/DoXvfb77HVv+E?=
 =?us-ascii?Q?56D/+D5K6PH79OwxE4kVe5d9VkQedfOC3IpP3p0GHlqaYy4RuFGJyBvxsN/r?=
 =?us-ascii?Q?yVHweikIlTZ/5GE7gVchUN/45xSDV1ZdFOhz1bcshvrxgMseQr+cmib8nNRO?=
 =?us-ascii?Q?38CvOEIQ1GyuljteJ3938Glpz6+OF+gp3JGbufQPtLQAVgw4nnRUjdp1RCli?=
 =?us-ascii?Q?n4gNPir+CcKEdxWHGAQXLIldKBLA8jMXpGpd5S5Zfzd2oKOkWk546ASUIznc?=
 =?us-ascii?Q?qzDaTwa5GJKUzHnUCeaVgzMapVHDVhm0Jp8VIaqUjqAN8RwCBruPTSk8N9Iv?=
 =?us-ascii?Q?DvoZpGGaL9k8nf9caopCi+/qsaxBLPdkdzHCOzVmMGt+lSC/VGtTFe8lib3/?=
 =?us-ascii?Q?92S47ruKmND1TPGPnjE1fQEoUUOU25noTRF0iWYycU8qF/FEP8Gw6LCSWj9c?=
 =?us-ascii?Q?FH3+d9bXNAJSgEhdlM0ntZon/WE7UZqofX7OfCkmS85vusatJec1+2I1z4JR?=
 =?us-ascii?Q?XckxZcydDSUMr13YFfZag4qkJiMv2ZSbUfYqyTIeFIDjcIeCbDCnQmnojlcO?=
 =?us-ascii?Q?MDPZR9vShU9WxPgpNu9/qOIZNGRW947O/VaeudVBL/SKbESo1/JlnE5ZUUiI?=
 =?us-ascii?Q?qqJC86XvWUM9FJDO2xYgMXdg5wzQ7Su+Tj9caW5+83XzuNYtY7+84kiLY25V?=
 =?us-ascii?Q?ECpTnkN/IL2sNBilqOzDCj6r/5OmmyR1Zer0SK8xGROOKZwC+x5DCNpZykVW?=
 =?us-ascii?Q?szr2ibzNj3th0P6zahxvBJmY4O7VtfoFe4DKkEVeC2IIoxdGbxUPR5pdL6Jc?=
 =?us-ascii?Q?UecroCffXEzyq7U+oW7/pXJ/2jLyC1qazqgSDzTJx6RudF7xaFMmfb/cptPO?=
 =?us-ascii?Q?u4nEIbPE7I7Hoty/ighXPi2cSFEihhc9TuwftPrPkd2NndxN8CWbHfU8neoM?=
 =?us-ascii?Q?f/u/p+PDxeEWGpImoywMTbeXKXmyJsjZXbHDGehe9us2d68oSJH2Cfoe/Mvi?=
 =?us-ascii?Q?Ec1aD5IyV8O//DzNBM8UnQtMmoHd+TuwgYe0v/KQ9tQ7VhsEK0rintBgbpVY?=
 =?us-ascii?Q?y/mwsoU0Su2BYVQl3GYigM8pOMEqfh3ORzPi5TRLE23UWzI81oLydxA+qVdd?=
 =?us-ascii?Q?OKp/ewsAbG/kLos+KXUS2NMpsLICC4GaImPWzWagKHD7tnd2NKXXTCFXj0Ih?=
 =?us-ascii?Q?DtaPGrF9LGckGJLCVafdUu5k7SBHpAVzkfKRNFQhJTg4HlDdatXWdwELZgS0?=
 =?us-ascii?Q?hrX+7H+FrccKrlPE9l3H/9D4nB8OZ1h1kQHONdHDzz8+43De1+cWL+PW3V3f?=
 =?us-ascii?Q?fShSETDFzA1Y4kdDfoTei2JEoEHHNb/X25bpEjXgd+8RyGBMhvwjFgf376Up?=
 =?us-ascii?Q?XRzYe3XlZFrpaeQ4udtx4Hd9FT6FPX/rj6tykth8JNw4vahlA2TZOZAf/GVF?=
 =?us-ascii?Q?gzdoqHxS0l4wc1zZ9fphZ4zRxClXxd7LHVeuFTeoBsgMqyqiwJC+PeiD0bmk?=
 =?us-ascii?Q?WgyUQyc4g5vvHUjSi5xnTBXorE32hrPECunGRz9b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78740399-8be2-49d2-927a-08dca69d785f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:17:23.9158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvye5Gl3E8E8rscYWQMtcdS0YIXxtEVyTZCK3Hn5l5nT6Clo1DCBrKftG7wQLl37sOfJjbZf0W0IKeAH0m2jcQHGl9OO7bw+5heohdZ89tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, July 17, 2024 12:52 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 4/7] drm/xe/tests: Convert xe_dma_buf live tests
>=20
> Convert xe_dma_buf live tests to parameterized style.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Just read this after the third patch.  I wonder if it wouldn't be better
to perform this parameterization on all unparameterized tests in the
same patch?  There's probably some benefit to keeping them
separate, just in case one set of tests needs to get reverted back to
the old style, though, so no blocks from me here.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/t=
ests/xe_dma_buf.c
> index 4f9dc41e13de..c24c8509227e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -8,6 +8,7 @@
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
> =20
> +#include "tests/xe_kunit_helpers.h"
>  #include "tests/xe_pci_test.h"
> =20
>  #include "xe_pci.h"
> @@ -275,11 +276,13 @@ static int dma_buf_run_device(struct xe_device *xe)
> =20
>  static void xe_dma_buf_kunit(struct kunit *test)
>  {
> -	xe_call_for_each_device(dma_buf_run_device);
> +	struct xe_device *xe =3D test->priv;
> +
> +	dma_buf_run_device(xe);
>  }
> =20
>  static struct kunit_case xe_dma_buf_tests[] =3D {
> -	KUNIT_CASE(xe_dma_buf_kunit),
> +	KUNIT_CASE_PARAM(xe_dma_buf_kunit, xe_pci_live_device_gen_param),
>  	{}
>  };
> =20
> @@ -287,5 +290,6 @@ VISIBLE_IF_KUNIT
>  struct kunit_suite xe_dma_buf_test_suite =3D {
>  	.name =3D "xe_dma_buf",
>  	.test_cases =3D xe_dma_buf_tests,
> +	.init =3D xe_kunit_helper_xe_device_live_test_init,
>  };
>  EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_test_suite);
> --=20
> 2.43.0
>=20
>=20
