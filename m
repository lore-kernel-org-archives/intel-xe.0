Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A32FCAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B96C10E124;
	Fri,  3 Oct 2025 14:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvf9buMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046110E124
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759502002; x=1791038002;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3aXx1V1LW1wOVxVNvt2zYzyKnzVCFHbktl7q64OnvkM=;
 b=gvf9buMFsdIAWA5zq7ix2r1LdfK/4w/hPp28esGnCIWy/vjaKUS1iKB8
 5hu8H+mBWF+4W2jTKnZ29Gnw+W0HkQ9+1TLXh4Mt0KHvf9VZeK4e2CWUi
 Ds+CKMq6jt/cpaelHcAYM/8Q//XSwKBxVyc4sYRBD/BAkp3BxUlWK0Uhb
 M6dY10k2KwwGsVaASKQNe3zm6QxjsYQeDZIsOH+AVS7WeKKS6AGfN7yjZ
 5ZJ6cz8BsAcQ5pBMDlgiQi0qAeB2mb6sM+7DDbfsa6m8wfElMg5YPn9gR
 HupKRRaPZPdmpOIM7oJsoX9YW4Gw5DkPk2J0fDtddKOaCNvgKOO//fVAU A==;
X-CSE-ConnectionGUID: 0yMEmlUCSp23DFicCKCz5w==
X-CSE-MsgGUID: m4VypxuSSwy1mKNKxawGoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61670504"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61670504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:33:21 -0700
X-CSE-ConnectionGUID: 8tsqAqitTmuRbwv1nPm76w==
X-CSE-MsgGUID: s2IJNptdRNmSTah3LG5AOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="179238081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:33:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:33:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:33:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:33:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3JxKXMegjLkOcVJt6r3s2boNpEoAA78nmDzQf5+9JXYkQWBxO5Krf35r4CUv/+3uVKkYoyUzi53a7dptZEwxLhP8Lo9MMPQIF8GufsSQoP735hjTwSPFfPa1CeRVC+z9Ug+vTpJZxasg83QpAAtwVYBZ3YlUAk1DxQmvj9B00X/Df/uYjgmMpL6UBQ0WybaoXV5mpKURFSbt53XDlzZz6WHj9ghqA+/h3c4F3PRvtfT4fihmO8LCutUSIaGp6jekNJVHkzykNl93T8K89Y7Gq7pUrV5hNplrZys2rKxLmJo8Q/1ib5Wm48ESOVUU5ywH5jXqrWFzPpLsV3Gc4OSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aXx1V1LW1wOVxVNvt2zYzyKnzVCFHbktl7q64OnvkM=;
 b=VJaKEgImZjUmVZqxmR2f0rR0DdSfRDE2LAI1Q9t6n+otEFFaYqjEznf144UKRZT2ss+MSnYbEqw15GN4KD1Xb34zxyhg6bCWCNtAbJ++dw42uxjErCfTOBzVm0vRhzaHeAxZuMVscmdlbb+XNS3zjx7+YfsOXtUtt8ectGHPsS0kfBEw+Jf6orq7fnS0oqReCYwsISxmsn2BFozoo0e9Mp2q1bib1hUgvtQJ1q1RIlFoGlA1VBN3HtxxBsaBN36tWIUkc/lhYyuEcK9UWVaLAUEXO0/yfRc3DjdpEsC1ujkZsw1k7zIXAGqJPq3sgV0RuKmLnF0eK1bLttuzfDwn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.16; Fri, 3 Oct 2025 14:33:13 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:33:13 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/xe: Handle missing migration VM on VM creation
Thread-Topic: [PATCH 5/7] drm/xe: Handle missing migration VM on VM creation
Thread-Index: AQHcM/D2LrAII3nHMkiNfGwowrNZwbSvgk+AgAB7ewCAAH+eAA==
Date: Fri, 3 Oct 2025 14:33:13 +0000
Message-ID: <b7648e4c608be828a16e54728d2e82fb084b5f40.camel@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-6-stuart.summers@intel.com>
 <DM4PR11MB54568D4AD095B963ACD2442BEAE7A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aN9zmrOxEhgiEgv+@lstrano-desk.jf.intel.com>
In-Reply-To: <aN9zmrOxEhgiEgv+@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: bbaec566-edbc-47b6-3f16-08de0289c8f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T3Nac3VzaUNrMVdKYmx4bFh2a0YrME1MK0tNaDQyUG1ZZzFKNVZJbXA0Z09i?=
 =?utf-8?B?bWRxaFNNa2dBc04rSHErd2wrYmloTnh5SmZta3FLcGJrbUVGUFBObWc0Y1Ns?=
 =?utf-8?B?c1JIb3V5VHRsSnAwaWxyUlhZeVQvNGRLR2ExYTU2TFBxT3RXallIcEF4SjVI?=
 =?utf-8?B?NTdsNFFGY0RSd2pRb3NNeG1lV2xpN3BOOGc0b1Y4NlE0aDQ3c2MybGF5aTVx?=
 =?utf-8?B?LzVZOHA2L2JiTm81M3ZoT2ZWSXB0bFJHeVU5aXB5alNCczgySy9nWVFweCt0?=
 =?utf-8?B?UG1pUUlMbm1uNVpiYklFV2d2dDNDalkyQ0xmamdEMWlkNXI1V1FYZERRb3Mr?=
 =?utf-8?B?aGNMczcwdlBpL1hiTjVhditCbXhjc1ZyZGs3QStFTURuTjZLWkJIV3RlYi95?=
 =?utf-8?B?c01pOTBsM2h6Ny9NQmlUaTZScUtmdUhqcEdidGtSYmlIUjVYVVZCNDR3c1pl?=
 =?utf-8?B?NDE3a1BaMXJheUgyK0ZRN0JEUytrYnRTTmJrYzdQdnRkYVozRnhGVEkzVndl?=
 =?utf-8?B?eTA2Q1A3VWxyR05JbVpxdWEveFJiUXloN1RzRGk0djdKdDh2NnhhM1R4RVN5?=
 =?utf-8?B?L2pWNlZZcTFIeWMwS1VMdmNnQ2ZZNkFKaWZ2ODRkdmZxWno1NlpvT1dqN3Rn?=
 =?utf-8?B?M2JpamN0R0hVWTNMSTVOOWRMVzQzOVdELzU0a0J4L283T0p2T1BBUDl2Y0Rx?=
 =?utf-8?B?Y05GNjRIdXlCK3JjQjRLRXUzQzRIekVWaFVZM2JBdDBLc1VrUjlRQk5aNzZ5?=
 =?utf-8?B?RWNCOUR3emVxN3ZRSkZjK042blhNck9vVm05R3pHYzVYVXFwOTkzN3FWOHhz?=
 =?utf-8?B?SWJFWXJTdzZyMXFjcDhqT2RxWXFGMEVuU1VIMWtycnpCcEdkaWR0VnNRWTdG?=
 =?utf-8?B?YUROQktqQnlXaUVSc0pDUElUVnoxa3BPWFBOYnhIdS9FVlAwODM1Nm56dHlJ?=
 =?utf-8?B?b0JRVFBuU3JRdXNCekJxa0h3TTlvb3RKM2VBd3Nsbno3NTY4cld2RFFnUVNy?=
 =?utf-8?B?WFVJSStiUjhpY3RGbFJwZDZCU1JyTzNCVEpLUTd4Z0Jra1V4VWZrUWtxeG5p?=
 =?utf-8?B?RCt4NURlV1Z0STdCMWhNcFJ5ZnJwYnR0UTJVM2twZ05RZzlaMmxKNVlJT1Ex?=
 =?utf-8?B?VlRUenpoMUkrVXpPUk1hVmRYYlhaMWNJQW1uVXMvNmxTbEk3cTdtcjBJUjBQ?=
 =?utf-8?B?YnNweU5WUlE2aUhreWdMMGlEMnJVOXRBSTFWL3FjanlubDdNUDY2SDd2WG9P?=
 =?utf-8?B?QlNYY3dlSHVEcDNjTVo2VUlhWXpNNm9ockdQZmE3M3VKSXlKd1YyN0Y3dUgx?=
 =?utf-8?B?SzJYbHN1bk1NeVc4SklKWDFqcFJXMTVjdERoZ3JMTmNCU1ZnT2lqV2JVZlZa?=
 =?utf-8?B?MHI0SEw4ZDk5L1MvbmhUenRGSGxUUEIyUWtpeElnT283dEtBREg1UjYxdjEr?=
 =?utf-8?B?dm11c1gxdEdBRkl6bEN5YnFCSk8vWkR4YnVWS0lvUEV5Z2I5WHh4QzNhMnpk?=
 =?utf-8?B?QVk2TWtLeUkvYnRFMmJJV1hsMmhHQTUvNXFBTGovUElTTnVkYjdqWlBweWpH?=
 =?utf-8?B?VmhBUGZUQVEvNlB1KzBPZFRZUkRxUHRMYzZUQklGUjE0eGZ6YmdHWk1ZWlVL?=
 =?utf-8?B?cDl1SDBSTXd3dmxHaGpvL1lNWWd3VmZWTG5CbmMyb2gyZEZyL0p5RjhEbDE2?=
 =?utf-8?B?QlBzOGdaVkZtdnNJRk42d1RBSnJKa0I2ZHI1RC9kd3ZpZVM5M0E4ckwwRmpp?=
 =?utf-8?B?b2ptMyttTHFzb0JEUHNRNkphVjNpOExRbEszMTlFUkxhQjZVWkxGelYvZVIr?=
 =?utf-8?B?U1dzVFBBd1ZNWjd0aDZOZVpkQlpOV0VGOHNRUTBZSUtjZUtsMWFiV2Z4UnhL?=
 =?utf-8?B?UkNubWlKdVdscDc0Um1sRDZ2VWtSc2FhcE9ma3RyVUhsdFVub2FTbnVxYmdv?=
 =?utf-8?B?UUV2aFlyWkUrWlMxalpRUDBQMmtzalFwQ2QxQkZyOFJvT3dmMTdVNnJEUHk0?=
 =?utf-8?B?dmIwSy9jNmt2Yy8rdldWbEJqbFhwZDREbFJPd1laMDJlMnpiMThnVVFjaGY2?=
 =?utf-8?Q?XPu8sa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckxHYXFpM21EbDNkM2NFK1pSVkhGL3VRVzJRRHJ1dll3UHlWUkJBVmtLMmd5?=
 =?utf-8?B?RXFxOUpLcEVqT0pvMUFBM1hJRUlrN1o0allVTmtmdE16UTluNmhxVG1qY1FS?=
 =?utf-8?B?QmNuK3lKbTJ4dHFjUFp5OWQrT2U5R0NaOTg5eFpjcmFkQ3ZlZm94b3I2bDlZ?=
 =?utf-8?B?bWJndjBacDdWVzQrQnB6N0xsZHVnSk94Z2I5RE01ZktpaWNrUHIxQTJkd29s?=
 =?utf-8?B?STFzd0RPa09zMzJxcDhSdWNpTDZoZHJGQXozcG1pVHhhK2dSTjhIRWJWNFhN?=
 =?utf-8?B?Q3hYTm1nTGVVTnIzcnB2UmtVZjkvVDZtazlzOFpzeEdGZmUrMVo4c0h4SHJC?=
 =?utf-8?B?UW5XTWJNTGIwdk1iNklveDlQdUNBUjg1SDZ5OGs3OGlrMWRCZExvcHg5VkNX?=
 =?utf-8?B?TmowZkxXSWJpMHNlZEpnWG9BNzV6cEMxUmFLMjVyTnR4TWo3MTYwVm5XQTlk?=
 =?utf-8?B?eENPL0RyQXhDMkRhSFlkVnhpc1p3TkNDVFZwRGhUL0RtdThDV2xoQUx1Nkdj?=
 =?utf-8?B?Y050dEpuTURzU25meGVSS1lQN0o4K0J4U0orV0J3T0w0ZFZzM3hVRDZJT2ph?=
 =?utf-8?B?WmZNZjB6QTdvWDJRalpNOGFxY0VBOEdYTG5IUG9FTW1BalVhb1N2R2FzUFh2?=
 =?utf-8?B?bnYxSkl3dFg5Qk10eXBpN2FrS2tySnlhWWJDQjVMUlBCTHJPVEFJVE95RTQr?=
 =?utf-8?B?YUFZZGNJd3Vsb2JtbTFNdVgyeC81cCt5K1BwRmV2aERGb2tJNmo5bTU5NlFv?=
 =?utf-8?B?anpuWnAxUmxIS1ZoUDMrOWVjVGZ3cEF6eUk1MjFnUW9TWlZsR2c1MkEzaHZw?=
 =?utf-8?B?aDlDWnVNaVFJZ3RSQWVqVWZoYjdBVzhVTUdISkdrOVdET2J4bXFpd05DY1hC?=
 =?utf-8?B?cjErUzl6bnFBWExPb0hiNmx2OVpPV0xPdzBzK1lxTDdHTjZ4bS9jSTNmd3dp?=
 =?utf-8?B?MUpEKzhpbDdEcDBMVVBPcHoxRnJpNmdTbnI1MXhvSFV2V3dOVno1MlVySWdN?=
 =?utf-8?B?aVNuck5VQ3lQUFZoanprOGpXM2xieXowdkxPLy9rTTc4NjNWdzNXMXVzZnJi?=
 =?utf-8?B?K01NbkpDVlQvYVdCNVdrNGJjSFBEcUkyVUxvQ3NXZzlRTS9lQ21hbmx2cTUx?=
 =?utf-8?B?QjliOVN2QVJZTWZTMkxXa0UvTzRGN2ZQQXUzSVV5RTlNYWlDOG11bUFqdEcz?=
 =?utf-8?B?c09GM1JxYktaZ3RzOXY0bWNaR0JWaXFhdmNhSHZnNmVPZUdPUGNMMzZER2o1?=
 =?utf-8?B?WFVFOGEvQzJVR1hidUd2Rzg5Ujc3am1MM2VwcTZ6UDdkYXdUd053aDRTdWI5?=
 =?utf-8?B?QThtdnp5eC91d2pCUGw4RUhmL29zcTIvSk5uVW9NRnhFUHJ1WkJmd2EwQjNC?=
 =?utf-8?B?dk93VHRENExRS05McnpZVFdYV21wSm56YmtscWVQVTc0K2t4V0E3YkNxWWM0?=
 =?utf-8?B?Q29kUFFqSTUzNktrbXltR3dzczRVVTdGSDk4c3NjM3dqT1g1UUREZGR4bUJ0?=
 =?utf-8?B?ZVowc1FnTC9JNmgwbVJ1YWM5WWFFb1ZLR2c5eHR6N0cvVlNiWmM4NzhqaVJ0?=
 =?utf-8?B?ek53NlF0azEyVFplS0l0UjZEcnN2SDhMWDJCWVgzeXVmZkRSSFZBd1FaNFYx?=
 =?utf-8?B?VnVLWEdXUStsR01aNS83TUZjQ3ZjS2J6MkgzYUZIWVAvZDlVWWVxWDkzVW5Z?=
 =?utf-8?B?MjVJUmtObGwxVzJVNU9RdTJaOE9DNXRlWXNVZHRaTDQ4STBoNVkzbTNMdmJG?=
 =?utf-8?B?ZWJsQU93SmFIS2lQRFh3MnUvVm14SjQrbEtsQnIram4xTG05ZXk5RHY5RXdK?=
 =?utf-8?B?cEJSdnFwWkREYUR3UGQ5SjdMb2FUL2pvSDk4QURYaC9vQ3NRd2xwRHovTktn?=
 =?utf-8?B?aG14SWpjMVdXbGsvbnpEdmkyd2JDM1ZWdkhWYnQzaVhReGpYN3ZsZDBMVlo0?=
 =?utf-8?B?cUFESXZ3Q2pud2tNS2RiYkh1UXhVY0o2M2M4bk1JcnZZc0ZUaHlCdlUwempi?=
 =?utf-8?B?RWdtUmttZzVaazB0SEpvK2dBZHh5NDVMUTVHeHQrUkZBdG44SjBtbTZOZVY1?=
 =?utf-8?B?NTFOR3lxWkQ3cVVBallMN25VVkV4WEJQbDRuTmw5VjhUZlIvMVY5NHZaVkdX?=
 =?utf-8?B?aUg0U2gxb21VeFNSVG43Qld5aXlxemtmL0FRZ1ZGa29odmVIbHpvaXVZVkE4?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <627CD78D2EFBD245A697258BC37080BE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaec566-edbc-47b6-3f16-08de0289c8f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 14:33:13.7893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WshP4eCj24dm6SdYve/95GNlLKUHb6KRoeUACe1HqKP/jCB5RV9RUeR0IBkcGnGcOgjLEp4pimVMDRkY/ixeLbljMctZVcqWhCTjfo5MeSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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

T24gVGh1LCAyMDI1LTEwLTAyIGF0IDIzOjU2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAwMiwgMjAyNSBhdCAxMTozNDoyOVBNICswMDAwLCBMaW4sIFNodWljaGVu
ZyB3cm90ZToNCj4gPiBPbiBUaHVycywgT2N0IDIsIDIwMjUgNDowNSBQTSBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiA+IFRoZW9yZXRpY2FsbHksIGEgdXNlciBjb3VsZCBhdHRlbXB0IHRvIGNy
ZWF0ZSBhIFZNIHdoaWxlIHRoZQ0KPiA+ID4gbWlncmF0aW9uIFZNIGlzDQo+ID4gPiBmb3Igc29t
ZSByZWFzb24gYmVpbmcgZGVzdHJveWVkIHN1Y2ggdGhhdCB0aGUgeGVfdm1fY3JlYXRlKCkNCj4g
PiA+IHJvdXRpbmUgZ2V0cw0KPiA+ID4gY2FsbGVkLCBidXQgd2hlbiB3ZSBhc3NpZ24gYSBtaWdy
YXRpb24gZXhlYyBxdWV1ZSB0byB0aGF0IFZNLCB0aGUNCj4gPiA+IFZNIGZvciB0aGF0DQo+ID4g
PiBtaWdyYXRpb24gZXhlYyBxdWV1ZSBpcyBubyBsb25nZXIgdGhlcmUuIEFkZCBhbiBlcnJvciBj
aGVjayBoZXJlDQo+ID4gPiBmb3IgdGhhdCBjYXNlLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+ID4gLS0t
DQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgfCAzICsrKw0KPiA+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gPiA+IGluZGV4IGMzMWJjODQxMWE3MS4u
NmJhYTE5YjgwNTFjIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4
ZWNfcXVldWUuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUu
Yw0KPiA+ID4gQEAgLTMyNiw2ICszMjYsOSBAQCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQ0KPiA+ID4g
KnhlX2V4ZWNfcXVldWVfY3JlYXRlX2JpbmQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3ZtICptaWdyYXRlX3ZtOw0KPiA+ID4gDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgbWlncmF0ZV92bSA9IHhlX21pZ3JhdGVfZ2V0X3ZtKHRpbGUtPm1pZ3Jh
dGUpOw0KPiA+IA0KPiA+IElmIG1pZ3JhdGVfdm0gaXMgTlVMTCwgdGhlIHhlX3ZtX2dldCgpIGNh
bGxlZCBieQ0KPiA+IHhlX21pZ3JhdGVfZ2V0X3ZtKCkgc2hvdWxkIGFscmVhZHkgY3Jhc2ggdGhl
IGtlcm5lbCB3aXRoIE5VTEwNCj4gPiBwb2ludGVyLg0KPiA+IFNob3VsZCB3ZSBhZGQgdGhlIGNo
ZWNrIGluIHhlX21pZ3JhdGVfZ2V0X3ZtKCkgb3IgeGVfdm1fZ2V0KCkgYWxzbz8NCj4gPiBUaGFu
a3MuDQoNClllYWggSSBndWVzcyBJIHdhbnRlZCB0byBrZWVwIHRoZSBnZXQgYW5kIHB1dCBhZ25v
c3RpYywgc2ltaWxhciB0byBob3cNCndlIGRvIHRoZSBnZXQgYW5kIHB1dCBpbiBvdGhlciBwYXJ0
cyBvZiB0aGUgZHJpdmVyIGZvciBvdGhlciBkYXRhDQpzdHJ1Y3R1cmVzLg0KDQo+ID4gDQo+IA0K
PiBJJ20gbm90IHJlYWxseSBjb252aW5lY25lZCB0aGlzIHBvc3NpYmxlIGFzIG1pZ3JhdGlvbiBW
TSBpcyB0aWVkIHRvDQo+IGRyaXZlciBiZWluZyBsb2FkZWQgLyBib3VuZC4gSSBkb24ndCB0aGlu
ayB5b3Ugc2hvdWxkIGJlIGFibGUgdG8NCj4gdW5sb2FkDQo+IHRoZSBkcml2ZXIgb3IgaG90cGx1
ZyBpdCBpZiBhbiBJT0NUTCBpcyBydW5uaW5nLiBIYXMgdGhpcyBwcm9ibGVtDQo+IHNob3cNCj4g
dXAgZHVyaW5nIHRlc3Rpbmc/IElmIHNvLCBpdCBsaWtlbHkgcG9pbnRzIHRvIGFuIGlzc3VlIHNv
bWV3aGVyZQ0KPiBlbHNlLg0KDQpObyBJIGRpZG4ndCBzZWUgdGhpcyBpbiBsaXZlIHRlc3Rpbmcu
IEkganVzdCB3YW50ZWQgdG8gbWFrZSBzdXJlIHRoaXMNCndhc24ndCBjYXVzaW5nIHNvbWUgaXNz
dWUuIFRoZSBzY2VuYXJpbyBJJ20gZGVidWdnaW5nIGlzIGluIHRoZSBldmVudA0Kd2UgaGF2ZSBl
aXRoZXIgYSBob3RwbHVnIG9yIHRoZSBCQVJzIG90aGVyd2lzZSBnZXQgZHJvcHBlZCBvdXQgZnJv
bQ0KdW5kZXIgdXMgKGkuZS4gcmV0dXJuIGFsbCAweGYncykgZHVlIHRvIGEgaGFyZHdhcmUgZmFp
bHVyZSBvcg0Kb3RoZXJ3aXNlLiBJZiB0aGF0IGhhcHBlbnMgaW4gdGhlIG1pZGRsZSBvZiBhIFZN
IGNyZWF0aW9uLCBmb3INCmluc3RhbmNlLCBJIHdhbnRlZCB0byBiZSBleHRyYSBzdXJlIHdlIHdl
cmVuJ3QgbWlzc2luZyBzb21ldGhpbmcgaGVyZS4NCg0KQnV0IHllYWggeW91J3JlIHJpZ2h0IGFu
ZCB0aGF0J3Mgd2h5IEkgaGFkIGxhYmVsZWQgdGhpcyB0aGVvcmV0aWNhbC4NCkknbSBub3QgbWFy
cmllZCB0byB0aGlzIGNoYW5nZSBzcGVjaWZpY2FsbHkgc28gaWYgeW91IGZlZWwgc3Ryb25nbHkg
d2UNCmRvbid0IHdhbnQgaXQsIEknbSBoYXBweSB0byBkcm9wIGl0LiBUaGUgbWFpbiB0d28gZml4
ZXMgYXJlIHRoZSBsYXN0DQp0d28gcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLg0KDQpUaGFua3MsDQpT
dHVhcnQNCg0KPiANCj4gTWF0dCANCj4gDQo+ID4gU2h1aWNoZW5nDQo+ID4gDQo+ID4gPiArwqDC
oMKgwqDCoMKgwqBpZiAoIW1pZ3JhdGVfdm0pDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQo+ID4gPiArDQo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKHhlLT5pbmZvLmhhc191c20pIHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlID0geGVfZ3RfaHdfZW5naW5l
KGd0LA0KPiA+ID4gDQo+ID4gPiBYRV9FTkdJTkVfQ0xBU1NfQ09QWSwNCj4gPiA+IC0tDQo+ID4g
PiAyLjM0LjENCj4gPiANCg0K
