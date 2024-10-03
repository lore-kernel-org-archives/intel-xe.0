Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6A7CF31BA
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 05:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E537310E7A5;
	Thu,  3 Oct 2024 05:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TErjfU8z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65F510E7A1
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 05:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727932510; x=1759468510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2wg3OKTM4yGMqODXIRX0QD2+GJjRY6lbujdm6H41VUM=;
 b=TErjfU8z9o37lPlhPJH5c/BHBhlzKzZOITbZJIRsEQ1bWNSfP68xv3rG
 6sn3ucBNsK+6dUX9KejB24P8BIWAsv+pR8G61E13+8mp/h6stKQYoIabY
 ay5ew55kKwF5XECBFBRiaTMmzgEdye2E4S5iArV4dGG5Etpa1dy4LaDRM
 J+btdTQfFx4WATdyw3aaFtlMeRxWW6RdDcB+dpk/Z6hSlwCdDovINyoiX
 dHhfzUGE/oY1gghMjc/0QQuyEoSl5+vecTw2sM/K4FwP7JuzCTd2BJj6M
 SIjSB4jt16qiRMLSA4h3HDVtTNwcyc4vQPnJwnjBD01uDkkEL/3EfFX3X w==;
X-CSE-ConnectionGUID: SubZL7gRQm2NAG855EunJA==
X-CSE-MsgGUID: fTeMc8wAT5SkV3QOFb50dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44584449"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="44584449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 22:15:10 -0700
X-CSE-ConnectionGUID: PCzyuhA2QGSQ+KrBVCFZvA==
X-CSE-MsgGUID: 6k73Imy9QLKcJerf1Adyhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="74478568"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 22:15:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 22:15:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 22:15:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 22:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUBJHx7vu1t+Ch7kq4qNi517kgpFBnL1ndkTcCu1AYLpu3VUWEJn/w/h+XyxmxU80bCxsIOWhydBsMRTS7/tkMjvUcpos8lFbmIdiF7WP5SyIs7ewq2npvG5idlptOUoHLowezZJA/9Epe4bVOirDT73UAAub6ixKG7RY8kagfYuEzqCXs8BZA3hVcFfhdj4xML1Wo0kqnIVAHyQr0mbvBg1TSHFRca6Eexv4fhdmnCQcITEAH3tlltXh4pI2qLQovMBoPI6OAyl9BoIJR+h50nemcjjWflA5eY7xg7sZ1Ax+G6GLbN3tizgnIIaxpKsJ00fp1d12CH2ML11cNH+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWuZIcxkj8u3b5aQGkFSaqAEP9hu9lHOwc8Nt5tcVKU=;
 b=O/qokrovR5JxpiZHyrqXuiG5F+mGTDnz+0gAiFn0byw1g8+QdtSTaoxPyDb/9wjH4zi/rXXR2dnY9KfpFjvMXGz4JjjnmkQghcgfpgALJEAGAkY1YK7hIGgQN+FSWd1+a0pF3hqOXJDM3ny0nqj5UipnEiLw611tfIFNum33Qm7kAmRfIJz5H01OG9pKaLdF8wyFhsH5EohfqKEn5dxSdt0e0xCQeklijBdXg9ggiq+FmvZRan7ADG2ld9QFXDlYgxiz0qP3qj17eWyyY69zeSB9Rgyd7B9wHfA7+bI1rkLDb+TrGujT4s40o+nEbqodbMDAg78XXpGkF/OuV/rv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA3PR11MB7582.namprd11.prod.outlook.com (2603:10b6:806:31e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 05:15:01 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 05:15:01 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Singh, Apoorva" <apoorva.singh@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng,
 Oak" <oak.zeng@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Thread-Topic: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Thread-Index: AQHbFAfx3emXbk1zikCMyZ4dklvDVbJyYoKAgAEt/ACAACx6gIAAwK4Q
Date: Thu, 3 Oct 2024 05:15:01 +0000
Message-ID: <CH3PR11MB8434F29291B4E6E0E532F70F8D712@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
 <20241001135432.447074-3-apoorva.singh@intel.com>
 <juv7n3jsyv6hqcxbcnlxgeq5rlqayukriwrcbjq3lmonlhrnos@t5dpzwna5r27>
 <Zv1g0tKMaCZXMKs0@DUT025-TGLU.fm.intel.com>
 <xt7xysewqynwxbzdgmcnglebbrqpqq3wdqpwkuuitjanitj25t@56zkq7vi7sjp>
In-Reply-To: <xt7xysewqynwxbzdgmcnglebbrqpqq3wdqpwkuuitjanitj25t@56zkq7vi7sjp>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA3PR11MB7582:EE_
x-ms-office365-filtering-correlation-id: b8a9b487-f0c8-4f8a-9d9b-08dce36a5526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rkN+6Utc8k1OqjB4ZJ4I71qnrQWFWhHcwOH2SOm7Vhg1LgRJl28XhFxOCAVJ?=
 =?us-ascii?Q?iBeJ+cSJoeYUJ9Ic1Y77Aw/8Yus/Py6157JUk1zeeZHEk6+3yUYA8ynXLftj?=
 =?us-ascii?Q?vYaeOXUbvWvXMhnLRU/tPakzKgifsLsi+jY4im1xn53QZX5JUfZRc85HyuN6?=
 =?us-ascii?Q?0qTWwiCMvZRJAag+a2A238hAIlaICTe8xQLQp9p/6YoQJ6u6GGSi7hVOM56g?=
 =?us-ascii?Q?latRMu5EY4Pa8aYM+IcV0Qo08rMKlvGvrj0+hGGXP/lP0lPcoGgj83Sk5ZOu?=
 =?us-ascii?Q?r/iQOPVZBKkzu7mFL1TVR4YKUE/G746P7+0ffIR0/MUgj4lTmjvoGqZiHrWB?=
 =?us-ascii?Q?H2RPIvEyumzGemgPG0PcktW4gCfgzMUUiVBxk7ZpcZ/z+6thQJcepWiBA/LP?=
 =?us-ascii?Q?kQBWFRNFWFoDHBcm17zUNPSwDghW8DWPpeI+OZ+5JELVcGTytwsBqb7EBqJC?=
 =?us-ascii?Q?2VmJDettu3BuT854/8vxABDbiHTHYB2bMYDUvGajRZ7UPu8nKNY/37t5VAM1?=
 =?us-ascii?Q?x92ubYzvIYfoYF+AGVBl0n4zm7Mp6ZvJDA05XaGQplvmsscDtcbxJQOC/l54?=
 =?us-ascii?Q?D8S8wSgWEp8XykVWYkPh5XKyRFj0m7NiM2XkUwKWt/VnUD6M8emXVg3f1Rro?=
 =?us-ascii?Q?g4et/LY5e92GPKJf6M1K0j9IQCRFGMHizOMzx8H+NZpHLetng+ut+pDEMlCS?=
 =?us-ascii?Q?x3x1QGD5WZ5xyymdExzutVS/+pMFIFaghnGwUrdsOJmBcCR4OqmI+0tXVxI8?=
 =?us-ascii?Q?Tu3xdzegZdQW/H8OxNku3AMyi9HDLo0ow8UIubUPX4tIxHKLGiOlmWm8amkP?=
 =?us-ascii?Q?A0fUanf1QFeoZtzvDeTc8a+4pik57BVadaYN/v+uS3164PM1doLYUm9qGU+V?=
 =?us-ascii?Q?Stu5VWGNUFVn42bz1gy6nMEpZbAov36uK3ymcTMR0I13hNoyDuz5J8oT5dSH?=
 =?us-ascii?Q?4M5iX1A4WswG4eyzCaTD19UmDokSiQf4UR7LdyLfSr/n3vLVZJV7roFBvupd?=
 =?us-ascii?Q?MCNNlhzJvdX5lPhJgKTJD4mzJ3dtVXGXUz4+JX14IhsbQSaKaICa8iNszejx?=
 =?us-ascii?Q?1UhP6eBXI0BFjZASVfLD21K+qmpcBViCVDg6Ho7KD2QNk3j8K5Zod38q8k4F?=
 =?us-ascii?Q?Ho4tE3zvKPY61jxQjqSNhrfepdXuZaHp9z336wKRVxzH96j/AvCTCgBBNv74?=
 =?us-ascii?Q?WvWys/QC5xlFuJpkSyLH4J83AF0HL8nK0gH/fd12EnzGt8/VsVp+7ZP550Xe?=
 =?us-ascii?Q?w3kbbVkkwb4IlWGlam6nkwlNWoyM7v28qlwCBBdDVWu2BGCrhNyUwM8e0gYV?=
 =?us-ascii?Q?zOAhJzuy+oFZFBfbBKz1HL4SgCYnUxUCqgVhmCiuAp4XSw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BP/zvEvszvs4KkyQTedDEeBlicZ4j5nVKUYyT+cA/14G78CKn2I1fgM7YBLq?=
 =?us-ascii?Q?IgKvmPCZn1sqA6NN3cnWRgSLYFqIG1Mq97uZPSzEYoeu9SiV5y94Vq9seOlU?=
 =?us-ascii?Q?zKli4c5vUrl2xUGY8512wELFReO2TKFC6ZC+XTJqJQJcidOWhHWsGCZHvmwB?=
 =?us-ascii?Q?vaWJyPq0J7930jtuSSpZ9oBcpaPWRrDGwjSKJzxfBfewryV9STsnsSbG4TYL?=
 =?us-ascii?Q?cHEVxGvyikEPsn3qTBBExLDR7dYGUoi7KF4SdTiq2104Q1OsDQSMLhjkagSq?=
 =?us-ascii?Q?W/uzXwfGoKcoYzt5VIDnwJCRnxCskQEgJPIzYeHpLWH+NRdDBXJLTFvmWxiL?=
 =?us-ascii?Q?g3RdHunXpT7chX2b4H0PhqKK//0KSJs4qGICuA9Wpf5ex/B1nu3X8nBHSYRL?=
 =?us-ascii?Q?nTr9R8TVSaLJM7V5nlSBwfDpItqUOgzZDAnZb95XWpRwtp1UrPxheAXapDrk?=
 =?us-ascii?Q?wDVWPfo2kg6aOFyrMs+ZYtSdiObpJbkbpk0cfweCkpSS3xPdwbUut6DPVhbr?=
 =?us-ascii?Q?PPdDD4Mm4cLURTUUrIlecHh3AVKucy1en+opWLb2Cvr98JDwjZdjZktAbCyB?=
 =?us-ascii?Q?vGAxSMb9clmxL1FTbu2MnOZ0U5LTcTGUWXfxDWxI83inwJcb6syyhq02Uptq?=
 =?us-ascii?Q?2r1m9rEzBOvjoZxzCe/gvh09zNhlU5pbGUV4/Af4YY7TjoCv1bwkS2FKo2NP?=
 =?us-ascii?Q?M7OY949EvB5NBOl43XRHM2+kYGf9q/aSPIHzqNTDLpzCw3eTZvZtAlzjrpLT?=
 =?us-ascii?Q?R800cIqidTqUVg0gG29Vgn5mE/j4vghhSobUHNOcCqMCmb6IwZqU2hcj89RW?=
 =?us-ascii?Q?V+/Wvpo2Arv58cj/hqb9qh62s3AE5XUPbQNP9qZBUk9HCMYXpe7rWdBbLD8o?=
 =?us-ascii?Q?GUcKe9KU+76VAgs6DhDLpMegwWb7e1Cul0n1lcfaD/QwwGgFrSfSpw4eAY75?=
 =?us-ascii?Q?H0M9kzg/ACfsgHN2pCd5bZHj22oY2MpfHCENvUfs4UWFsDIUgJ+TKXS4+JrF?=
 =?us-ascii?Q?3+MbWx8kI2yfzQRhrwlHP8IAKKG7ZLP4Rr/KCXP+iSTgvfv5clsFopJxyWTl?=
 =?us-ascii?Q?kLn4namOaRcyMwuZ+UnuNvc8UefyGttZrAf+LtBQ5Jf6tDYo7otHYyIGxzfO?=
 =?us-ascii?Q?RJxjuFCTGFz6JWNj1NREEMivffi0Rf0vH1ZYj50JzoR2q9gMASzFsHO/t6Mf?=
 =?us-ascii?Q?OMKJcBDfQFmj7qK8jzojFqB925PXCHV+kPnSLIU4BeSmis6Quj/DJwPtjML7?=
 =?us-ascii?Q?RnRnAlmmOZKlpuursl7MCIhAFkcIizYJgw9iTsWP+LZubrAPrZvfi6NqikSp?=
 =?us-ascii?Q?wTsZcRjSppW2mJyAH3RJ6LhJGvh/JZUYRI8OcD3JUmUAtOMBGaVpSB5Uozi/?=
 =?us-ascii?Q?9o8hg3xjR8QHLiyqIzNlq8POSrepQEnVNnlwvb73GOfdnrM46rFxagCzgN/d?=
 =?us-ascii?Q?iwdQ4NLNmL+UWnY8leDp5SA7kVd7cFgyH43oENfuJRniOi3vgTjMAPEUTtho?=
 =?us-ascii?Q?uT79kbF0t41Emk3WQW1zk66+HbORaxVg/J/utyD3OBgBEgqM8AJyKoTw5Wa8?=
 =?us-ascii?Q?ZvJLYPk8BdXk0Qm31XviyDkynxn/n3VNlfqbjk/nwMgHX0ZsCtOoDoKYFYEV?=
 =?us-ascii?Q?Q+tLpBk1QTRAF8rM8A76Mjbn3IynBmlU5UPSlQvxBnMi+WZjXCfuFA/SIgih?=
 =?us-ascii?Q?Zsw1WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a9b487-f0c8-4f8a-9d9b-08dce36a5526
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 05:15:01.3915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQi958NFXsj0NPnU2dzmBPSr+agxoxC7ierXrTd61V2eWohaf8CEnSQwC+ur5VyEWPWowlL2CF0/5WrQqKVJqdWqEg7BF0hiDu5ruLsN29I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7582
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
> Sent: Wednesday, October 2, 2024 11:13 PM
> To: Brost, Matthew <matthew.brost@intel.com>
> Cc: Singh, Apoorva <apoorva.singh@intel.com>; intel-
> xe@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>; Brian Welty
> <brian.welty@intel.com>
> Subject: Re: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
>=20
> On Wed, Oct 02, 2024 at 03:03:46PM GMT, Matthew Brost wrote:
> >On Tue, Oct 01, 2024 at 04:02:55PM -0500, Lucas De Marchi wrote:
> >> On Tue, Oct 01, 2024 at 07:24:32PM GMT, apoorva.singh@intel.com wrote:
> >> > From: Brian Welty <brian.welty@intel.com>
> >> >
> >> > In order to enable access counters, this must be enabled in LRC for
> >> > the exec_queue. Add basic uAPI to set configuration of access
> >> > counter trigger threshold and granularity.
> >> >
> >> > When access counters are enabled and threshold is hit, the access
> >> > counter handler in xe_gt_pagefault.c will migrate the buffer to
> >> > that to that GT's local VRAM.
> >> >
> >> > Signed-off-by: Brian Welty <brian.welty@intel.com>
> >> > Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> >>
> >>
> >> What do you mean by **Restore**? I'd expect a minimum amount of
> >> documentation explaining what this is and how a real userspace can be
> >> used it for implementing X, Y and Z.  Link to userspace is also
> >> missing, and is required for uapi.
> >>
> >
> >I was going to say do we have user space for this yet? I also suspect
> >getting this implementation right is going to part of the SVM work. I
> >personally rather leave this disabled until we get the SVM
> >implementation for this all worked out so we can freely change this if
> >required.
>=20
> Agreed. If we want to merge parts that are required and we are still not =
ready
> with the entire feature, then it'd be ok... provided it's properly explai=
ned and
> documented. But touching the UAPI is not. This should come only after we
> have everything in place and a userspace consumer is ready.
>=20
> Lucas De Marchi
>=20
> >
> >I can't imagine any user space is really demanding this to be enabled
> >yet.
> >
> >Matt
> >
> >> Lucas De Marchi

Earlier tried to bring access counter tests along with kernel here but drop=
ped the idea as the existing code related to access counter was also remove=
d as there are no customers then. I think its better to add into internal f=
irst.
