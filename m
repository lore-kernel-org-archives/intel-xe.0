Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9C9C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 20:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3147010E554;
	Thu, 15 Aug 2024 20:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPJEfe/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50910E554
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723755305; x=1755291305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e3zriXfR2FTgaE0khYEJybiio7n0Ao+CjOsb983xUE0=;
 b=IPJEfe/rzQ/Aei8crz2/3eLRML2et1GOoHWKKgTUjoS1Ifpy+M2Rh/Zo
 qXR9FvBgVSVfn4GQ+lUj9kvdSSx4GzkEs6AfFn5ydP9f18d+nP3nJoJ21
 rFAiRYKpCWHPGXOtc96p7dboJnpt378tFcfbhatfQKpJJYEQ44B2eqHNR
 PcB9tRFq64oZ5bd1VrGYTiIMKonPXq78ocrO5kxAPs/F19RsBFT0u3TP6
 qVapC9ohRJdMG0YZpIFVEN+fnkoYfJAKV/Y/7lxpqiIgSZGSWLM3oWNet
 59D6hBLdDHQcEk30fxDQTGunbGjX74TpBUE5grZfsIvokZNyfx2p3Ge2Z Q==;
X-CSE-ConnectionGUID: NJcFA31ORvqnKoFEg2tMSA==
X-CSE-MsgGUID: N0XM72peS3ithgjavWPEAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21676815"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21676815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 13:55:04 -0700
X-CSE-ConnectionGUID: CfoEQ+RBTPe3fwacM7gsPw==
X-CSE-MsgGUID: yXynWae+Rv2tlipzKQKxJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59145652"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 13:55:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 13:55:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 13:55:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 13:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqX/HngtGQ6h235X3ILWf722bEa3XPaOYNnG8m3D1g9x1/sbcDCcNGk7Od4oin7YWqfM+iPjOoXkzM3ZrlkizYo7qkh/5qQd0WUcytuPcIuxIVoYdiAV2rhh09ih9k6SGWl53gTp0N1sakbXVf1SBLnhD4hu8WC+kze3pGP1NkGP9qHFSSipuygWnVcP/aVz7mDniqdFWaXPVX4l+K1nV/vS1zarNT2Qp8VAG2IJ+kjO7uDjvSpupS/4ejVWcm2FKqOHGAoyxdea9I04ObfB9Fg4oKUFM+mUxv77epOoWsI0rF5EPgN7sW1kKir0e9Kgw7kNMD8xINcNjULigfcbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3zriXfR2FTgaE0khYEJybiio7n0Ao+CjOsb983xUE0=;
 b=r5z6KTiZpWnJjd1HivpRh04f+HZ7JndDf+EN3nUJEGU08ir3Tn0B2G+XD/VY8lIe/+Pr9P/CbGDNWv9A5Co9qgbhvmvZZnTe3dF5wl/JGhGYAEt9ZgwSH8gqqk5SUqF4HWPxD5cOwB+Ep0gMGfGE7E0hX5PVsKapU5Hj5pLBamCmSjE1VB6U418DD1e7It7UDlNqfM9yfU5rLrHoI8PcPfYP3ImAGgjnFW2n7NWXEO6ZDpmKRAWgDHZvP19Vj7kqT4DvRaRfyTgRHI8+BlqwFNrBH3lUblvOUSQbzJ1+f56LlTZxlWNa3i+2ndPZORrB3OOEgKPLOvYm8zl4DOI1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 20:55:01 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 20:55:01 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>
Subject: Re: [PATCH] drm/xe/display: handle HPD polling in display runtime
 suspend/resume
Thread-Topic: [PATCH] drm/xe/display: handle HPD polling in display runtime
 suspend/resume
Thread-Index: AQHa7zgpWMu8HlX9YU2Z2GY/7xP+cbIooxiAgAApP4A=
Date: Thu, 15 Aug 2024 20:55:01 +0000
Message-ID: <2c3cdd30bb585e3462c35aaa3c9be40e4a300885.camel@intel.com>
References: <20240815172500.78479-1-vinod.govindapillai@intel.com>
 <Zr5IiefJuIR9tpzo@intel.com>
In-Reply-To: <Zr5IiefJuIR9tpzo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH7PR11MB7514:EE_
x-ms-office365-filtering-correlation-id: 937aa32d-7067-422d-09a3-08dcbd6c87bc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NnR5U3U1L2ZNWnlqSStCTWE5cGhhajZLb2RHVTArc0JPckowNTJiQWRKQ3Rs?=
 =?utf-8?B?WHR6VlJmZmQ2ajczM3QyWFgyalVVSS93RmdHNWdWazIyRzZFRC9xMWhFQTVt?=
 =?utf-8?B?UzUxanI5SEoxVUYxVmpBTlU4bXZXVHRIZnRtTW5kL3lCUlpLNFBrR3BUUmV5?=
 =?utf-8?B?dEdKT1Y5bnVnMVM2Q3VCVFl0ZFBJMWJPWVFTQnhkMlYvV2l3WlR3QUt0WDh6?=
 =?utf-8?B?eUpjTDd5UzZxUWJJOHp2WUEyQjVrYXNvcWpKQUJsR2EwSDdneE1FcSt4eUNk?=
 =?utf-8?B?eDd5OWtMVXBsMk5Da1pHT2V6ZzZPck81MlNvUkhaM0dZdSsvU29DcW5IZ20r?=
 =?utf-8?B?bFBLNUhmNWdUOUNsNi9YdGI5SW1WR1VyWTdLSWx4bEJkR0hzNjI4NlEwbXRQ?=
 =?utf-8?B?U1J5NFQ2MlZ0eWRoMVdoUVI3V3NacWt2cmdwRUlOeXQwN0Z2Y0t3RlNYMnlN?=
 =?utf-8?B?S3ErdXcvTnpuK1U3Wml3UTBWbzVBRUZ2YTZmUW9ZR2ZBNkorUy9aQkZTS3Yr?=
 =?utf-8?B?ZlI2Zkl5OCs3Z09TVk5Ha3hkcGV4K3c3ZVpGRVltNnN4L2JxVUNuSUliNTB2?=
 =?utf-8?B?b20vc0g4R0kwQTBSRysyamVoeXFxN1RmUE15THN3UUNta1hhcVZQYTJUUExa?=
 =?utf-8?B?aVJFcXpKZkhrYXVxcml1RENOb1ZhVUlqeWxWUFhiblZrdWpGMjBhc1EzRUZD?=
 =?utf-8?B?UmVibGJCd1A5K2JCT2hNdDBuMWFQb2o0bUs3YjNvVkZiRUNyWS9FTm05clYv?=
 =?utf-8?B?UE9uVnI5NlBSQklOZkJkSm9ma0RDYXVXaWpBd3hKdFp2bjBva24xbUxHV3Bn?=
 =?utf-8?B?bExuaTVNMXVsRUJWd0Q2aytjdzdXNzVmbHZBdmFLQUpIcGpQdi9rdXE0b01w?=
 =?utf-8?B?akpTaU92WXBhaG8rekdiMG1jRlNTbU1HUDlHVUhNVkdiM2gzUFdxOVkvNXdq?=
 =?utf-8?B?QTQ4Z1d0S0p5WHcvN3V3UjBaOXl5ZkR3Nmh0QnpJYUtLMVRYTmNhSHJXSENr?=
 =?utf-8?B?V09vYU9LbGc3UGlkYUk0VVYxNzZiYjRaVko5T1V1T2hJejFyNkZ6R01GZzNO?=
 =?utf-8?B?Vzdnci9OWktBeGE3MWdoTkZIU29mWjJyVzVwY0Z0RVlMYnNKaGxNUTBCYVlq?=
 =?utf-8?B?bTBwbHE5ZVdpUENFZnhnQ2tkVkVHdVJQc0NNMDREUEFIMWdjUmJxOENJbmIv?=
 =?utf-8?B?V0FaM3JpTHBGR2R0ZnVqeGxoM2dHeW1IQ3d3WDJqRiswbmVWY1UrYW1jSzZF?=
 =?utf-8?B?QXBjQmhKK0lhNytVSlp5TDErTWVDMjVNTW55cE11Z3dLWWY1WUVGK3ZnYkVq?=
 =?utf-8?B?cmNScy9WUFprUlNHdTV2Y1FtNkc4WkhXWWM0d1Z6UlM2SDgxUUhWN3owQmJi?=
 =?utf-8?B?RVlLTHhuMDNRd2NGbGpjQUVxZDAvRGUzVHVPYnhzNldBdkJrTGp1Sm1qaWc0?=
 =?utf-8?B?VGh3UU1XNEZPb2s4MkhONVJQMkFOVWZ5TmxjeUJQUTNYWVY1ZEgzWkEySXJo?=
 =?utf-8?B?Z3pxR1BSOTluTmJTVWpLazIwNjUzak5WNmRTTndrWk1vbndTM1h2VW9ENjJ2?=
 =?utf-8?B?SkdpSk9zWitKaUhIMzJNQkVEMlhhc0RmTm9KMm15RjhGclZrQ2dtaGJ4enpw?=
 =?utf-8?B?eU9rNnEybVhJSWpzb2tCSko4MkFRMzhHMk9HZVdFVyt4YWIzdm1UeC83Vkkx?=
 =?utf-8?B?UWN5Sml6bmdJOHptRVhuY1lPb1ZodEtoUFpHaUNEd2YvaldId3JtMFBFZ0NF?=
 =?utf-8?B?UDE3eFBzTldLNEZyRG1lVjJGTExJbDMva3d4aUJrSGdXM1Q0UklEdWlEcnZy?=
 =?utf-8?B?WUpTbUxYQzdGS3ltZDZNbFFPa1BWd3NGeGErVDhkTytQRGcxKzB2ay9Gd2RD?=
 =?utf-8?B?YnJnaFNVelo3bXNOTjZvOU9kbVl4Q3NWRUYrSEh5V3QvK1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lyYVozNW9nOTA2M1pPWTVTWHVmb1ExUjJPS1ZlUnQ1dDNzMmFNT25veDBw?=
 =?utf-8?B?VlRRWU9nR1EveDVqNDBkVnlKSzhzRUlPOFZIODRoK25lWVRBcXRXRU12TUpm?=
 =?utf-8?B?OEpQcWo0cDZLSG0wbi9FTzFXR2g2dy8wMjNqSFgrWkpMOE5Fb2FKeGJBNmlX?=
 =?utf-8?B?cjBkOUxObTdSbGpZalpLMnRzN3drL2x5c3g1S2Y1WHJrTENDMHlsY01KNkpt?=
 =?utf-8?B?Yzl3YXJzNGxvR2lkcFdueU9WSjg5cW0xWGU5N1hDWVBmNCtOQllabFZGWVJI?=
 =?utf-8?B?V0lic0V4Nmg5elNuOXRqd1ZqeDhPNFpCcnMwK3RYM1Z1emZvOGZBOVdYT1Np?=
 =?utf-8?B?TmFhaVdvZ1ViSmlDRUZxcDdFdm1KYmZHdmt4T3BVeVpUNy9uYkhZU3NVa05N?=
 =?utf-8?B?NDhmZ2ZYakV1ZGtVcEJhWnh1b1k4L3l6YXBSWUpkdFRzQnd6SXpiQlZ1K0xX?=
 =?utf-8?B?eTJlYWZLRk5QbXBUTTJmNy9jWFBBZmJMNHVFVmZvM0syUS9uc1FVTGNBYW1s?=
 =?utf-8?B?TS91MWthNUlmNjNaSFo5dFdRRkV6WVBXYXE4QnRZR081Y29lZ2Q1RVV5TkFM?=
 =?utf-8?B?QzJhbTV5NFRaanAwUEpia2Z5U2xvT0h6TUxGMWNHWjZOVm05aTFZdFdEdC96?=
 =?utf-8?B?NUVxeG5IWmRuaEI3eGxIWkdhWElBcm0wcis3VlFiSGoxbENXSGcyN3E0ZHZX?=
 =?utf-8?B?cmNCTC8xZE9malhNclJoNDZBZjJZLzZxNjBLekQ2dW1RZzBYUTI1OEtFK2Ir?=
 =?utf-8?B?VTduZFB6VGw4TXFOei8zZG43WU5rWWl0aXIzejRQM1RtcmFsSG9uTkg3RVBL?=
 =?utf-8?B?L1BYM2ppSlVvWmtNTHRVUi84S2xObXl1UlVvekl5VVBVcE85RDhEVDdBZ1BY?=
 =?utf-8?B?UCtsamptWlkyU3V2Nnc5L0ZEdTJMS2JiZVlQSVpUQ2VvYXlLYmlrQk41YVF6?=
 =?utf-8?B?MFZqUEdGMlhCd0taQk5FaWhWR2IwMDNaNVZ0N2lIbUtpdnhaU3Ywc2wyQzNq?=
 =?utf-8?B?czRiRjNLQ0ZJQ29LNEJlWjFtVWExZkpvTitvb2hSNy95Y1lpM2ZKSXZYNEd6?=
 =?utf-8?B?TXZvTHhxYks0V2pTam1WUXlMRytNYWx0TmZPS25FajlQRFl2c1BYRWlRb1JP?=
 =?utf-8?B?d1pKN2tiaXg2M1BvVG0wZkdEcExWYzBkT1A4OHFoSkFzQTVRdFd4cE9MY1ZP?=
 =?utf-8?B?Rm1jUFlQeTlHbmNiT0kwbUtvLytnZzhENHRBc1kyUFZOK2lVZ3dGOXQ1TXhD?=
 =?utf-8?B?OWJQelM5VndGTmdnemx2OTRnbUFNL1B3c1E2aXIweVdYNHlpNjNBc3pkUWFJ?=
 =?utf-8?B?MU9HcHVZdDNnYUNDUHN5NTN4RnZYTjZ3QzcxdHl6YytCTHNsbW5GbWVlZllI?=
 =?utf-8?B?aVN4NXp2NXdFZU5wVVkwSytFZTZzcXZTSzB6MEhEZEV2WUNINnVLalFaRnRy?=
 =?utf-8?B?eWNXa1hvOWdCbHpCY2V2bXRXWEdMdDRWeXdHWWJteDhtTUp3UTJYL1pTN25G?=
 =?utf-8?B?QmowVWtVMVZtdW90VEZBaFN0WXFLR1ZGRmRVd01USnlvTGpqZ3NObm9UcXNP?=
 =?utf-8?B?eHh3M0huVUpBUEpWRjlXaHQvT3VkSzFoZEhKbnhuTG4zREM0cGFMd0ZDYUZK?=
 =?utf-8?B?dHU0VkRldStTVzQvRWRxS2F4ejQxekcxeDhheXI2QnpZbDlBdXN1NXk0M1JH?=
 =?utf-8?B?dGhBc2xBWHlsNm51aDF0emxPejJvWVV1OTQzdkVDemxhekM1UlpDUEptZUEz?=
 =?utf-8?B?RVAyc0lEMisxWHc0K3ZPcmx0M0NGTVA4SkdEU0d0RUo3WnNyMisxb21uQlpX?=
 =?utf-8?B?K2VaaWprWXlPRzhsS1NHZEs0Z1F3cDhMUTdwUnlvQlJUWU0rWVZkRVdESnhh?=
 =?utf-8?B?Z3dSU3J5SlhPcGxWZFNkUUNSZnpDSm1qM2NFTW53T3RvbGthWVlubGg0NVY2?=
 =?utf-8?B?UlgwSlY0U20wVFRGb3A4bEVzS21jeHU3VWxocy84Z3hHdzZ1M1RoNnJyQm9Z?=
 =?utf-8?B?OEhINjJDV1hWN2t2cUs0WWVseExWRlFSeFl1Ri9xTFFldURqWU1QYmI1Q2dS?=
 =?utf-8?B?M0lxWHg3ZHBSaTVLUjhSb0xRR1V3dXRSTkMyT2JQWTVZQmZUUGorblJJYS9Q?=
 =?utf-8?B?Tm9sYS9zcVVxeGp5LzVnUGF6M2R2bWc2K1hnUHpIb2EybWVRTVdiTzl1S1VF?=
 =?utf-8?Q?F4sNWUR9Y9r8fdY+2QPYWEQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BFF3775FBB82F4A9291F546C640E52E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937aa32d-7067-422d-09a3-08dcbd6c87bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 20:55:01.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Eqz5PT+ljjoh4ivD4YUlmzbi0qu3hWm6+SPQXIjK0J503cIjqH5t391f0vkMa0Iis8AWuWqHOKvgdoPyV6Q7zkBTgD0x0kVICN6dew9+ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
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

SGksCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuLgoKT24gVGh1LCAyMDI0LTA4LTE1IGF0IDE0OjI3
IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6Cj4gT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgMDg6
MjU6MDBQTSArMDMwMCwgVmlub2QgR292aW5kYXBpbGxhaSB3cm90ZToKPiA+IEluIFhFLCBkaXNw
bGF5IHJ1bnRpbWUgc3VzcGVuZCAvIHJlc3VtZSByb3V0aW5lcyBhcmUgY2FsbGVkIG9ubHkKPiA+
IGlmIGQzY29sZCBpcyBhbGxvd2VkLiBUaGlzIG1ha2VzIHRoZSBkcml2ZXIgdW5hYmxlIHRvIGRl
dGVjdCBhbnkKPiA+IEhQRHMgb25jZSB0aGUgZGV2aWNlIGdvZXMgaW50byBydW50aW1lIHN1c3Bl
bmQgc3RhdGUgaW4gcGxhdGZvcm1zCj4gPiBsaWtlIExOTC4gVXBkYXRlIHRoZSBkaXNwbGF5IHJ1
bnRpbWUgc3VzcGVuZCAvIHJlc3VtZSByb3V0aW5lcwo+ID4gdG8gaW5jbHVkZSBIUEQgcG9sbGlu
ZyByZWdhcmRsZXNzIG9mIGQzY29sZCBzdGF0dXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZp
bm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPgo+ID4gLS0t
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYyB8IDIwICsrKysr
KysrKysrKysrKysrKysrCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDUgKysrLS0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rp
c3BsYXkveGVfZGlzcGxheS5jCj4gPiBpbmRleCA5ODJiOWM1YjQ0MGYuLjBjZGRmNTUzNTFjOCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jCj4gPiBAQCAt
Mjk0LDYgKzI5NCw5IEBAIHZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLCBib29sIHJ1bnRpbWUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5w
cm9iZV9kaXNwbGF5KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47
Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+ZDNjb2xkLmFsbG93ZWQpCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlbmFibGVfaHBkX3BvbGw7Cj4gPiAr
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBXZSBkbyBhIGxv
dCBvZiBwb2tpbmcgaW4gYSBsb3Qgb2YgcmVnaXN0ZXJzLCBtYWtlIHN1cmUgdGhleSB3b3JrCj4g
PiDCoMKgwqDCoMKgwqDCoMKgICogcHJvcGVybHkuCj4gPiBAQCAtMzA4LDYgKzMxMSw4IEBAIHZv
aWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRp
bWUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZHBfbXN0X3N1c3BlbmQoeGUpOwo+ID4gwqAK
PiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9ocGRfY2FuY2VsX3dvcmsoeGUpOwo+ID4gK8KgwqDC
oMKgwqDCoMKgaWYgKHJ1bnRpbWUpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aW50ZWxfaHBkX3BvbGxfZW5hYmxlKHhlKTsKPiAKPiBJZiB3ZSBuZWVkIHRvIGRvIHRoaXMsIHBs
ZWFzZSBkbyBub3QgdXNlIHRoaXMgZnVuY3Rpb24uCj4gCj4gTGV0J3MgZmlyc3Qgc3BpbiBvdXQg
dGhlIHJ1bnRpbWUgZnVuY3Rpb24gdG8gYSBzZXBhcmF0ZSBmdW5jdGlvbiBhbmQgdGhlbgo+IGFk
ZCB0aGUgaHBkIHBvbGwgb25seSB0aGVyZS4gQnV0IGFsc28gSSBkb24ndCBiZWxpZXZlIHdlIG5l
ZWQgYW55dGhpbmcKPiBvZiB0aGlzIGNhbGwgaW4gZDNob3QgY2FzZSBhbnl3YXkuIFNvIHdlIG5l
ZWQgYSBiZXR0ZXIgcmVmYWN0b3Igd2l0aAo+IG1pbmltYWwgY2hhbmdlLgo+IAoKT2theSEgVGhh
bmtzIGZvciBwb2ludGluZyBvdXQgYWJvdXQgdGhlIGQzaG90IGNhc2UhwqBJIHdpbGwgd29yayBv
biBoYXZpbmcgYSBzZXBhcmF0ZSBydW50aW1lCmZ1bmN0aW9uLsKgCgpUaGUgaW50ZW50aW9uIHdh
cyB0byBoYXZlIG1pbmltYWwgY2hhbmdlLsKgCkZvciBMTkwsIGQzY29sZC5hbGxvd2VkIGlzIGFs
d2F5YXMgZmFsc2UgLT4gVGhlbiB3ZSB3aWxsIGV4ZWN1dGUgImdvdG8gcGFydCIgLSB0aGUgSFBE
IHBvbGwuCkZvciBCTUcsIGV4ZWN1dGUgdGhlIG1haW4gcGFydCBvbmx5IGlmICBkM2NvbGQuYWxs
b3dlZCA9IHRydWUuIEJ1dCBtaXNzZWQgdGhlIGQzaG90LgoKQnV0IGFzIHlvdSBzdWdnZXN0ZWQg
aGF2aW5nIGEgc2VwcmF0ZSBydW50aW1lIGZ1bmN0aW9uIG1pZ2h0IGJlIG11Y2ggc2ltcGxlciBh
bmQgbWluaW1hbC7CoAoKQnV0IGFyZSB3ZSBleHBlY3RlZCB0byBjYWxsIG90aGVyIHN1c3BlbmQg
cm91dGluZXMgdGhhbiB0aGlzIEhQRCBwb2xsIGZyb20gdGhlIGRpc3BsYXkgcnVudGltZQpzdXNw
ZW5kLiBUaGUgaTkxNSBwYXJ0IGZvciBydW50aW1lIHN1c3BlbmQgaXMgcHJldHR5IGRpZmZlcmVu
dCBmcm9tIHRoZSB4ZSBjb3VudGVycGFydC4gU28gaXMgdGhlcmUKYXJlIGFueSBzcGVjaWZpYyBk
b2N1bWVudCBJIHNob3VsZCBmb2xsb3c/CgoKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50
ZWxfZW5jb2Rlcl9zdXNwZW5kX2FsbCgmeGUtPmRpc3BsYXkpOwo+ID4gwqAKPiA+IEBAIC0zMTYs
NiArMzIxLDEyIEBAIHZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLCBib29sIHJ1bnRpbWUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfc2V0X3N1
c3BlbmQoJnhlLT5kcm0sIEZCSU5GT19TVEFURV9TVVNQRU5ERUQsIHRydWUpOwo+ID4gwqAKPiA+
IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kbWNfc3VzcGVuZCh4ZSk7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqByZXR1cm47Cj4gCj4gd2l0aCByZXR1cm4gaGVyZSB5b3VyIGNvZGUgYmVsb3cgaXMg
bm90IGV4ZWN1dGVkLgoKSnVzdCB0byBjbGFyaWZ5LCB0aGUgYmVsb3cgcGFydCBpcyBleHBlY3Rl
ZCBvbmx5IGlmIHhlLT5kM2NvbGQuYWxsb3dlZCA9IGZhbHNlIGJhc2VkIG9uIHRoZSBnb3RvCmFi
b3ZlLiBGb3IgaW5pdGlhbCB0cnkgb3V0cyBJICB3YW50ZWQgdG8gaGF2ZSBtaW5pbXVtIGNoYW5n
ZXMgdG8gdGhpcyBmdW5jdGlvbiAtIHRvIHRlc3Qgb24gYm90aCBMTkwKYW5kIEJNRy4KCj4gCj4g
PiArCj4gPiArZW5hYmxlX2hwZF9wb2xsOgo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJ1bnRpbWUp
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfaHBkX3BvbGxfZW5hYmxl
KHhlKTsKPiA+IMKgfQo+ID4gwqAKPiA+IMKgdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmRfbGF0
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkKPiA+IEBAIC0zNDYsNiArMzU3LDkgQEAgdm9pZCB4ZV9k
aXNwbGF5X3BtX3Jlc3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgYm9vbCBydW50aW1lKQo+ID4g
wqDCoMKgwqDCoMKgwqDCoGlmICgheGUtPmluZm8ucHJvYmVfZGlzcGxheSkKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDC
oGlmICgheGUtPmQzY29sZC5hbGxvd2VkKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gZGlzYWJsZV9ocGRfcG9sbDsKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRl
bF9kbWNfcmVzdW1lKHhlKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGhhc19kaXNw
bGF5KHhlKSkKPiA+IEBAIC0zNjgsNiArMzgyLDEyIEBAIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1
bWUoc3RydWN0IHhlX2RldmljZSAqeGUsIGJvb2wgcnVudGltZSkKPiA+IMKgwqDCoMKgwqDCoMKg
wqBpbnRlbF9mYmRldl9zZXRfc3VzcGVuZCgmeGUtPmRybSwgRkJJTkZPX1NUQVRFX1JVTk5JTkcs
IGZhbHNlKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcG93ZXJfZG9tYWluc19l
bmFibGUoeGUpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IAo+IGFub3RoZXIg
Ym9ndXMgcGxhY2U6Cj4gCj4gPiArCj4gPiArZGlzYWJsZV9ocGRfcG9sbDoKPiA+ICvCoMKgwqDC
oMKgwqDCoGludGVsX2hwZF9pbml0KHhlKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGludGVsX2hwZF9w
b2xsX2Rpc2FibGUoeGUpOwo+ID4gwqB9Cj4gPiDCoAo+ID4gwqBzdGF0aWMgdm9pZCBkaXNwbGF5
X2RldmljZV9yZW1vdmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqYXJnKQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMKPiA+IGluZGV4IDlmM2MxNGZkOWYzMy4uMmFiZmU3MGQyNjk3IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wbS5jCj4gPiBAQCAtMzcwLDggKzM3MCw4IEBAIGludCB4ZV9wbV9ydW50aW1lX3N1
c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGVyciA9IHhlX2JvX2V2aWN0X2FsbCh4ZSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQoeGUsIHRydWUpOwo+ID4gwqDCoMKgwqDCoMKgwqDC
oH0KPiA+ICvCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fc3VzcGVuZCh4ZSwgdHJ1ZSk7Cj4g
Cj4gLi4uIHBsZWFzZSwgbGV0J3Mgbm90IGFkZCBleHRyYSB1bmVjZXNzYXJ5IGNhbGxzIHRvIHRo
ZSBkM2hvdCBwYXRoLgo+IElmIGhwZF9wb2xsIGlzIHRoZSBvbmx5IG1pc3NpbmcgdGhpbmcgd2Ug
bmVlZCB0byBjcmVhdGUgYSBmdW5jdGlvbgo+IG9ubHkgZm9yIHRoYXQuCgpBY2suCgpCUgpWaW5v
ZAoKPiAKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkg
ewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9zdXNwZW5k
KGd0KTsKPiA+IEBAIC00MzEsMTEgKzQzMSwxMiBAQCBpbnQgeGVfcG1fcnVudGltZV9yZXN1bWUo
c3RydWN0IHhlX2RldmljZSAqeGUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX2d0X3Jlc3VtZShndCk7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZS0+ZDNj
b2xkLmFsbG93ZWQpIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kaXNw
bGF5X3BtX3Jlc3VtZSh4ZSwgdHJ1ZSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGVyciA9IHhlX2JvX3Jlc3RvcmVfdXNlcih4ZSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiArwqDC
oMKgwqDCoMKgwqB4ZV9kaXNwbGF5X3BtX3Jlc3VtZSh4ZSwgdHJ1ZSk7Cj4gPiArCj4gPiDCoG91
dDoKPiA+IMKgwqDCoMKgwqDCoMKgwqBsb2NrX21hcF9yZWxlYXNlKCZ4ZV9wbV9ydW50aW1lX2xv
Y2tkZXBfbWFwKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9wbV93cml0ZV9jYWxsYmFja190YXNr
KHhlLCBOVUxMKTsKPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAKCg==
