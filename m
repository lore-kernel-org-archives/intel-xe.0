Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D82E668A7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 02:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0767F10E07F;
	Sat, 20 Dec 2025 02:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huczASfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A9610E07F
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 02:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766199258; x=1797735258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RN0+JAVM6mxg51lNY2y34zRqzdINMDc6p2vFlFfUpDk=;
 b=huczASfxyOhZP5+ivghLqWaC9BMR9YXFsUafRcetkRvg8mO99bEOLZ4a
 dX5GGHxuKkpG9GuXhKFEvAwhMHX+4bCcnb5U/dsN9AeK7LXbLcdX5mq8n
 cIjrjtXup3oHLCInyv87EgJOue+fCN0ImE8zJSWPdE/Rrm/SA1OxKYWf4
 RflCVHSKFkACbTuU68ZDiSAkoprrqQDMNGOH1+kF1PXCj1r7J0ElLHtO8
 DQocDzJTDcnsriKPN2VA8YIi+uCyeGBmpn/Ik5rmq63Hb9qSKCITyRw0r
 QtK3GMOXvAwLkV+0k1EB1vCArYsfIsKCi03dDYrYX0Bn8pabah25MV1nE w==;
X-CSE-ConnectionGUID: JG6dZJqKQtODmbThpg/m9A==
X-CSE-MsgGUID: /h7xjx7WRm+QiPCIn2vHUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71790495"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="71790495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 18:54:17 -0800
X-CSE-ConnectionGUID: obJh8w6LSiyWhyl8kVwQ5A==
X-CSE-MsgGUID: M+8t/81rRoaf7SSbEMsN4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="204085841"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 18:54:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 18:54:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 18:54:17 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 18:54:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re2BJB41GOMuQDegf+d+RrHj+VqQF4G+v7L8OZFzTa4rWjUeleDnzltH3KndKFjYsoWjZuv5ogLPqSmwUd2rY4H2kXzolLmLZ5ZkihjIoMyZSOMw7rFwKvEyYdf7CZ32+A1owMN6HZicDGIDz4ByYvxoH0c9KaMuxXl78Pj6P3aSZEGI2MIYGqYQf5bKLkYo6UnooM2c1wpJbVP9OMyZEzDL0Upd3gEHPsbS9TSXcxeZQuRpAjjr+vMyVHYDx0kYfeuh7ajaLbC7XAGyje0cBJ7R5kwZvaXJmbL6kbTJH4llFjwQGYBVjI/gW1N+DM0MAdWygvnl3t/Piw+qXK9A9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN0+JAVM6mxg51lNY2y34zRqzdINMDc6p2vFlFfUpDk=;
 b=Gxq/ReU0A3EuN3w6+FdhY2vjZEQVeKf+DI1bdx/X0x5PVmwZ7Ww4EFzytmZRfoz4O1zTwgxodLrztXlNg6Lurf26OFD0DTIA/zfhbeQZ+dbohvgcruKUsEm9WEas1O6Z+PtHuQFjgcCeSEy9Fjb1TdmaaNdtyiW3rwhiQtWgoKCtjYNuWgR6wFSapWvY0p6OhKXd2LjEAKGAqSiYdJB565MVu3pRLkm18Of9DAjjS8PlD5y4WntNnZ4ki1Ya2GgK030hHdOmCOlrAESLJnWtw/IX8w0F1cmD492ynYiJf2kaH63gLsQ8IMuMwCNfaaRD1S1RgPeNYqqFIt6uY5g+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 02:54:13 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 02:54:13 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vijay, Anoop C"
 <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v6 2/3] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
Thread-Topic: [PATCH v6 2/3] drm/xe/soc_remapper: Use SoC remapper herlper
 from VSEC code
Thread-Index: AQHccVJFB5pDXrczu0CSzsj5NoRW1LUp0lZg
Date: Sat, 20 Dec 2025 02:54:13 +0000
Message-ID: <DM4PR11MB5456C9E37B47AFFF26264DB6EAB6A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
 <20251220014442.3076408-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20251220014442.3076408-7-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW4PR11MB6738:EE_
x-ms-office365-filtering-correlation-id: cd80f8a1-2d46-4046-9961-08de3f730ec0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WEYyVElwRGFwY1dQSHBGWEZYVkhEendXMkJDOStzcmxxMDdMYlJEUkNxam9X?=
 =?utf-8?B?OU55bXFCT25hazFneGg2UnljNTJobS9tNmVoWmJOUUVKZnJiNWt4OHE1NHlD?=
 =?utf-8?B?dHBJUFpXOU52dTFzWS83OCtlVFA0MnU0ZG8ram9Vc29GV3ZFUytEemZPSWhw?=
 =?utf-8?B?VkFHRHFKS1ZHaXoxMFZQdkxWRUZvTWxiVzNhVVpkK1pQblBBSzFzQ0dReGhQ?=
 =?utf-8?B?b1h3anYrdVY5MVFZdGMreUIvQ3U3R2NxY1AyWkk4alpXSEVCVGF0T0tROTIv?=
 =?utf-8?B?YThXeHZOMWx5WWRkd24rMDlNYWplYk5zTVlEMjEyeFg0TzMwaUIzRWNwaDlj?=
 =?utf-8?B?MWFlOGhwQzhqbG1rTENnV2ZhQ0kxQVBhSkFvV2tsREo3WW9ucTlIMGErQkRC?=
 =?utf-8?B?aW9YbVRlWjBrWk9XRkVvVzNiTVRKWmF4K0dVaVE1QzVEcmpUVCt0MlVMRkFl?=
 =?utf-8?B?Nmxjam1wRmxoalI5cjZpVGU1d21hV0ZuK280elRyTUJXbEJwUFBRaFloZjgv?=
 =?utf-8?B?SGdGYTNkMkZXaWdDcjkycy9ETmlPNlNyZUlRNzVkK2Yrd3hleGlsQkVWQkdU?=
 =?utf-8?B?MXpybHZVNGEvYmJEU3lrWmZNdCtNdzlIc1RDZmU2UGVyTEU3NzJvYjI0b0tW?=
 =?utf-8?B?Z2FCdWNPYjJsV25jV3FRNzRPZGh1ZkhmSzhlQ0JrS09pYnFZVks4RlpmUVpl?=
 =?utf-8?B?RllBNks2Q3JQN0VlNEM5NnhGTDlUb2NWVW1NaVhBUE9ibCtLQWJhdkE3TXF6?=
 =?utf-8?B?S3poeng5M2pkSFY4NTRBLzJWSFpOQ091cm5IZU1HR3FKV0tLczJMeVN2d2Rl?=
 =?utf-8?B?cHVyZWN5Z093b1Yyalh4RjYwSTIxSHZIeGd1djNWcjFXODRlSWo1c0xVT1Ew?=
 =?utf-8?B?ZnltM0lIUHpZcWVtVVdjQnhHdmZWbGZ0ZXF3VzdObXVCRlBjRXhLRHhjZXZt?=
 =?utf-8?B?KzZYYjdPQWI0Z2FHWERYVDU4YzdQQTRVd0hzVER5S2VTYVFIdEgyeHB5SEJ1?=
 =?utf-8?B?YmVlekU4S1Q0ODRmYXlXK21ic3RIOHJoYnp6MG1FRWZLeGVmcDR0VVoySW5T?=
 =?utf-8?B?OUh6Smc3djFUWGJEZ2lKb0E1dHR5aWROaUIxclRIQ2xCdjFMd0xwNVRKUXl4?=
 =?utf-8?B?cXd4ZndpeERjZXpQWlc5SENDVDJTc3dGVW9xc2NLNE1jRXBkUWVmYW9VY05R?=
 =?utf-8?B?c3hid0h6UzhnZFVLYnJkK1lvUmJoSHVnekhzMHYrN2MrM1h6eWUyTG8vN3Vi?=
 =?utf-8?B?dFltaTF2ek5uVysxWFZjK25OS21Jcm1BejZhY1hJYy8vbDZLRGpwM0VyK2l2?=
 =?utf-8?B?RFhYQ0FlMVN4RFc5enMxVUV4R2FFbnc1ekVzeTFoQzNIZkVxejZ2dW1JV0o2?=
 =?utf-8?B?bGxYWE9icnFsNUtVZnEvaW5UOTNHUmo4ZzRIQkprSFlycjhCdmFxcVlYRXZq?=
 =?utf-8?B?VXg4T3FxS25QNWFIQ2JuRWJpaGNEaEEvQzF0MS9KSDBJaEFXeXc4UGVoNWI0?=
 =?utf-8?B?U1pBRXZVaTVyZERQMGo4OW5RVXRMSDZzYWxWSmdaSTZXTWhjZmhSdnIwVjFm?=
 =?utf-8?B?NEtkNFREUktaMXNhWHBFUWlNU09HVEdPQmFDTjRObytVVHBKQU1mTDBDYXJu?=
 =?utf-8?B?eTRmMjRoaTJmSktHaWNHVnZRcjBUeHZLb3ZkdXBxQ2NNVEFjSE9OMjlBL25Y?=
 =?utf-8?B?cERiOFFlVkpoN1dMUHllTVNEYjc0NkpvUFlSQlFkdi9SU1h4YURMc0RJZUVG?=
 =?utf-8?B?dFNyeGR2RHlaemM0MFRha3RCZllYY3FHUFlVRHhybW9tZ2p3bk16Z0t5aVpv?=
 =?utf-8?B?THo5VlBNNmdCTjFabS9rNmFTbUlEczRSSCs4VFoxMHZ1Y0R3a25ieituY2RR?=
 =?utf-8?B?dmdNTjVyOEJoeGJxc3ZXSzlLcTdvQ2EwU09TRWtEVTZhWXJHdHdJUkJUUTBk?=
 =?utf-8?B?dExqSW9FeUlnRWdXLzN4azRSNE5Ka01FaG1DbG1sUnRNSFlQWUFmTXdGRlgr?=
 =?utf-8?B?TUFJK1RzSUJ6TEhzQXVrejNiUllIQkJMVWd4WDdDbXN4MHMrVStmcHM1OStB?=
 =?utf-8?Q?lS16tt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTRwT0MwTkRjUGdJMEp3Vk9aS0ViTWZJWmUwRDIrQlhVMXhkV1hnMWVuNXhI?=
 =?utf-8?B?SlV4VWVzZ3hlRWY4UGZaamhnWXg4Q2pzc290QWhOR3pUdkdmQ3hsNTFteFQ1?=
 =?utf-8?B?SXZVbnRtZWdyNC9qYnhKT2NIWC9ZS2F0MFQ5d1gyelJEUy9CK2FxbHAxWUdt?=
 =?utf-8?B?RWJscFh4ZC9VVStNNC9IclArUGI3cTF6R1ZYNzR4SW1sMGVCaWNnaWhlRTA0?=
 =?utf-8?B?UTNxOWNYQmlSemRyQ2ZCem81WE9kakg4Yjl3VVBMK1l1eUpIZHZ5aXY0ZUVJ?=
 =?utf-8?B?MWxlSUUzV1d4blFXaTAxSU5BcFJrTHlkWCs4aTZrOFdPM3hPbVVzYkVscVBF?=
 =?utf-8?B?bzFWQmlHcllrMXRvaEN6NytFeWVBNFFDd3lHZmx6NDBxamk3WU1oZ3JEeFIr?=
 =?utf-8?B?bWtGMnFIS3pROWVoelJ4Qmt0QThyWiswaFNFb01nQUUrQzh6RDFYa1ViL05I?=
 =?utf-8?B?R21EWTJBMUJ5OU9xSUdsODRWaytONmtwUzk5OG9VT1pnMGM0WFkzWlZGUlJ6?=
 =?utf-8?B?cmROOHdabDR3NTNCQTlERzFaQVR4VXprWVFDdHZEalZBd1ZWNVJobWxNbnhS?=
 =?utf-8?B?aFZIOFR3M21odVB5ZE5FTmRhUEhURnlrWDBVK0t4ejZNeXAvcDBBbXVUQ3d4?=
 =?utf-8?B?YlZyN29lcndqZGtMcDZ3YXV2eHhoRkhLZTZkckdnSVpnSjJiRUMyM2dLVVlI?=
 =?utf-8?B?OSthZE5oMWFRTk03SGNZQXMwOS9KblJSZTJOMFVwcWc0RXBYZ0FHY2tmaWpT?=
 =?utf-8?B?R0gwaXFjKzVBTVNUeUZvazJPSGFtY1lOVk1jakRLalJQMkhIOEJPVGdMemVx?=
 =?utf-8?B?TUJ2YnJYeVk2ZDRrY0pkamR6bjhjN1YvMHdkQ0hGaFg0NlZCMzcxaUtRdUtK?=
 =?utf-8?B?cFFSL2M1K3NNOVk1YW1ob2pYWTVpcFlXRUo2MGhvMXVUQS9SOW5Ia2pVSTBo?=
 =?utf-8?B?Q3JsWXdTekZqK3U0c0RmSEtocHM2QjBnOUdKZHpYblpROVdEZWpRdVlzeFJY?=
 =?utf-8?B?bXF2b09XTWUrcWNkanVWOEM2eXQ3T1FOMWsrOElNeHpDUHFlU05LalIyc1E0?=
 =?utf-8?B?MHM1QVhIL3dkTGF6WkdoTUtwby9EMG1FSDNRc2JpOHV1WFIwcWRzNURhU1dv?=
 =?utf-8?B?aSs1eHVVc2prVHFVL1g0YUJERHI5SElzU1pZMG5mRjByemI5QkIvdTR0VEtP?=
 =?utf-8?B?VWMwTXU0bkFRd3MzRlZCQ01zNXJCSWt0elRSbmxkVkl2eXBtSTNMTVZXY3BX?=
 =?utf-8?B?VFVTM1VGU3hXRkVEc3g4VHVzZm1KMnVYbDJFMHpuaWxMbWo1WExkWEVTWmUy?=
 =?utf-8?B?bDR6SUYrMGVBM21ad05Jb25GSzB0R2p5K1orT0V3VEM4WlB0SGJuSi93UFpC?=
 =?utf-8?B?a1dlcnErYy8vV1EwM2RBK0Vzc2J6TFhacThXU0FKT3grMVp6TnN3QXh6dkQ4?=
 =?utf-8?B?b3dNWDhDVWpURHBKY2lub2NIck5QYkZzaUkxaWtFYm1YZ1gvVFo3UEdlaFls?=
 =?utf-8?B?bXF6eGNTd1RKNlowT0tJOTJtZ3JGLzdEWlJpNnM1SVJ4MEZzUHVzVGpZaFpC?=
 =?utf-8?B?Y1V1dnZoUE9McEhTVFNiZWNlTXArR2dTVjI1VHV0Z0psc3NtSERlT21hMnh4?=
 =?utf-8?B?c1RxRFk1ZE94SDQzSmY5SjdqajZYNE9XT0ExZmIzZkpDMzg5MFA4Z0hDU1BZ?=
 =?utf-8?B?dWl0TDZ6bkY1Vk91djdqeUJlcWovUHcvVlJLOEVpVngxYkY2a253dHpxTmRa?=
 =?utf-8?B?TU1UWE9reDlRYWNCNXZsZCttYXhLUGhad1B6NFV4SWd2VzNlcnoyUFpCQW92?=
 =?utf-8?B?MnhITFgzeU01amRBTlRLam4rUjdFTDNzSWdvbTBmWkZNRG9KRXBMU3prcVpz?=
 =?utf-8?B?RUYzRUlyVUVCK3hmZmx0VGRKU0pOcStuaTIvSzJCaDMzNXh5ZDkweFlBM3FJ?=
 =?utf-8?B?di9KYXNhSE1nVWNtTEVLR2FqVG84UHpGalFhblRMd1RKekc3NDRQc1creGZo?=
 =?utf-8?B?c3NNaWo2ZEFIYWsxREsyc2RVRUVaZjEvdXduaFA4MWsvZERNQTUzMmtwdHJx?=
 =?utf-8?B?UFdScCs2WFp6ZUhqa2NXc0J3NjNJRGxCOXE0N05HUlpOa0ZrMDVLSkgzdjZ0?=
 =?utf-8?B?aVA5VTkzM2g1ZXFaajd4d3F2MFN5VW9Dai9XZWtoUnMzQTdvK3V4SFZORmNj?=
 =?utf-8?B?dGk1M0VxYlBXbVNKb1RsLzh3RW1tV0ExbVRJT2RHTlo4NTBCOWZjekQzQitC?=
 =?utf-8?B?T1JiY0VSUDhKQVN5NzNvQSs2YlVaci8weXVVbjFVdExKQUZ2RWo0cEVMZDZJ?=
 =?utf-8?B?VU1pYk8zaFhxeDNHTEc5bkpUVjhscEZiblUzWDFqWHR6WVl0Y2czQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd80f8a1-2d46-4046-9961-08de3f730ec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 02:54:13.3896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OoBvhHXwNNM7I6EwANBaAiIt8Wlti8GJMzfX1NVGBSJE/iMcdhaTVENCepq/Lsup6vSzwdn6goGL5RzFbuSGnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

VGhlcmUgaXMgYSB0eXBvIGluIHRoZSB0aXRsZS4NCnMvaGVybHBlci9oZWxwZXINCg0KT24gRnJp
LCBEZWMgMTksIDIwMjUgNTo0NSBQTSBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgd3JvdGU6DQo+IFNp
bmNlIGRpZmZlcmVudCBkcml2ZXJzIGNhbiB1c2UgU29DIHJlbWFwcGVyLCBtb2RpZnkgVlNFQyBj
b2RlIHRvIGFjY2VzcyBTb0MNCj4gcmVtYXBwZXIgdmlhIGEgaGVscGVyIHRoYXQgd291bGQgc3lu
Y2hyb25pemUgc3VjaCBhY2Nlc3Nlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFVtZXNoIE5lcmxp
Z2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IEJhZGFsIE5pbGF3YXIgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gdjI6
IChMdWNhcykNCj4gLSByZXRhaW4gY29tbWVudA0KPiAtIHMvQklUUy9NQVNLLw0KPiANCj4gdjM6
IChNaWNoYWwpDQo+IC0gVXNlIHNjb3BlIGJhc2VkIGxvY2tzDQo+IC0gQWRkIGtlcm5lbCBkb2Mg
Zm9yIGZ1bmN0aW9ucw0KPiANCj4gdjQ6IChCYWRhbCkNCj4gLSBQcmV2ZW50IGJhZCBhY2Nlc3Nl
cyB0byBTb0MgcmVtYXBwZXINCj4gLSBFbmFibGUgc29jIHJlbWFwcGVyIGZvciBCTUcNCj4gDQo+
IHY1OiBEcm9wIGhhc19zb2NfcmVtYXBwZXIgY2hlY2sgKEJhZGFsKQ0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS9yZWdzL3hlX3BtdC5oICAgICAgICAgICAgICB8ICAzIC0tLQ0KPiAgLi4u
L2dwdS9kcm0veGUvcmVncy94ZV9zb2NfcmVtYXBwZXJfcmVncy5oICAgIHwgMTMgKysrKysrKysr
KysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggICAgICAgICAgfCAg
NSArKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAgICAgICAgICAgICAgICAg
IHwgIDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmggICAgICAgICAg
ICAgfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc29jX3JlbWFwcGVyLmMgICAgICAg
ICAgfCAyMCArKysrKysrKysrKysrKysrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnNl
Yy5jICAgICAgICAgICAgICAgICAgfCAgNiArKysrLS0NCj4gIDcgZmlsZXMgY2hhbmdlZCwgNDUg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2
ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9zb2NfcmVtYXBwZXJfcmVncy5oDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcG10LmgNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9wbXQuaA0KPiBpbmRleCAwZjc5YzA3MTQ0NTQuLjI0MGQ1Nzk5M2VhNiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcG10LmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcG10LmgNCj4gQEAgLTE4LDkgKzE4LDYgQEANCj4g
ICNkZWZpbmUgQk1HX1RFTEVNRVRSWV9CQVNFX09GRlNFVAkweEUwMDAwDQo+ICAjZGVmaW5lIEJN
R19URUxFTUVUUllfT0ZGU0VUCQkoU09DX0JBU0UgKw0KPiBCTUdfVEVMRU1FVFJZX0JBU0VfT0ZG
U0VUKQ0KPiANCj4gLSNkZWZpbmUgU0dfUkVNQVBfSU5ERVgxCQkJWEVfUkVHKFNPQ19CQVNFICsg
MHgwOCkNCj4gLSNkZWZpbmUgICBTR19SRU1BUF9CSVRTCQkJUkVHX0dFTk1BU0soMzEsIDI0KQ0K
PiAtDQo+ICAjZGVmaW5lIEJNR19NT0RTX1JFU0lERU5DWV9PRkZTRVQJCSgweDREMCkNCj4gICNk
ZWZpbmUgQk1HX0cyX1JFU0lERU5DWV9PRkZTRVQJCSgweDUzMCkNCj4gICNkZWZpbmUgQk1HX0c2
X1JFU0lERU5DWV9PRkZTRVQJCSgweDUzOCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9yZWdzL3hlX3NvY19yZW1hcHBlcl9yZWdzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
cmVncy94ZV9zb2NfcmVtYXBwZXJfcmVncy5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uOWVkZjIzNDIyN2E5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfc29jX3JlbWFwcGVyX3JlZ3MuaA0KPiBAQCAtMCww
ICsxLDEzIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0K
PiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArI2lm
bmRlZiBfWEVfU09DX1JFTUFQUEVSX1JFR1NfSF8NCj4gKyNkZWZpbmUgX1hFX1NPQ19SRU1BUFBF
Ul9SRUdTX0hfDQo+ICsNCj4gKyNpbmNsdWRlICJ4ZV9yZWdzLmgiDQo+ICsNCj4gKyNkZWZpbmUg
U0dfUkVNQVBfSU5ERVgxCQkJWEVfUkVHKFNPQ19CQVNFICsgMHgwOCkNCj4gKyNkZWZpbmUgICBT
R19SRU1BUF9URUxFTV9NQVNLCQlSRUdfR0VOTUFTSygzMSwgMjQpDQo+ICsNCj4gKyNlbmRpZg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+IGluZGV4IDZkYTg5N2I5ZjAw
Ni4uZmMxMjFiMjM2ZGQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
DQo+IEBAIC0zMzMsNiArMzMzLDggQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ICAJCXU4IGhhc19w
eHA6MTsNCj4gIAkJLyoqIEBpbmZvLmhhc19yYW5nZV90bGJfaW52YWw6IEhhcyByYW5nZSBiYXNl
ZCBUTEINCj4gaW52YWxpZGF0aW9ucyAqLw0KPiAgCQl1OCBoYXNfcmFuZ2VfdGxiX2ludmFsOjE7
DQo+ICsJCS8qKiBAaW5mby5oYXNfc29jX3JlbWFwcGVyX3RlbGVtOiBIYXMgU29DIHJlbWFwcGVy
DQo+IHRlbGVtZXRyeSBzdXBwb3J0ICovDQo+ICsJCXU4IGhhc19zb2NfcmVtYXBwZXJfdGVsZW06
MTsNCj4gIAkJLyoqIEBpbmZvLmhhc19zcmlvdjogU3VwcG9ydHMgU1ItSU9WICovDQo+ICAJCXU4
IGhhc19zcmlvdjoxOw0KPiAgCQkvKiogQGluZm8uaGFzX3VzbTogRGV2aWNlIGhhcyB1bmlmaWVk
IHNoYXJlZCBtZW1vcnkNCj4gc3VwcG9ydCAqLyBAQCAtNTc3LDYgKzU3OSw5IEBAIHN0cnVjdCB4
ZV9kZXZpY2Ugew0KPiAgCXN0cnVjdCB7DQo+ICAJCS8qKiBAc29jX3JlbWFwcGVyLmxvY2s6IFNl
cmlhbGl6ZSBhY2Nlc3MgdG8gU29DIFJlbWFwcGVyJ3MNCj4gaW5kZXggcmVnaXN0ZXJzICovDQo+
ICAJCXNwaW5sb2NrX3QgbG9jazsNCj4gKw0KPiArCQkvKiogQHNvY19yZW1hcHBlci5zZXRfdGVs
ZW1fcmVnaW9uOiBTZXQgdGVsZW1ldHJ5IGluZGV4ICovDQo+ICsJCXZvaWQgKCpzZXRfdGVsZW1f
cmVnaW9uKShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyIGluZGV4KTsNCj4gIAl9IHNvY19yZW1h
cHBlcjsNCj4gDQo+ICAJLyoqDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cGNpLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgaW5kZXgNCj4gMThkNGU2YjVjMzE5
Li41NWRhYTFiNWYzODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gQEAgLTM3MCw2ICszNzAs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGJtZ19kZXNjID0gew0KPiAg
CS5oYXNfaTJjID0gdHJ1ZSwNCj4gIAkuaGFzX2xhdGVfYmluZCA9IHRydWUsDQo+ICAJLmhhc19w
cmVfcHJvZF93YSA9IDEsDQo+ICsJLmhhc19zb2NfcmVtYXBwZXJfdGVsZW0gPSB0cnVlLA0KPiAg
CS5oYXNfc3Jpb3YgPSB0cnVlLA0KPiAgCS5oYXNfbWVtX2NvcHlfaW5zdHIgPSB0cnVlLA0KPiAg
CS5tYXhfZ3RfcGVyX3RpbGUgPSAyLA0KPiBAQCAtNDIxLDYgKzQyMiw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgY3JpX2Rlc2MgPSB7DQo+ICAJLmhhc19tYnhfcG93ZXJf
bGltaXRzID0gdHJ1ZSwNCj4gIAkuaGFzX21lcnQgPSB0cnVlLA0KPiAgCS5oYXNfcHJlX3Byb2Rf
d2EgPSAxLA0KPiArCS5oYXNfc29jX3JlbWFwcGVyX3RlbGVtID0gdHJ1ZSwNCj4gIAkuaGFzX3Ny
aW92ID0gdHJ1ZSwNCj4gIAkubWF4X2d0X3Blcl90aWxlID0gMiwNCj4gIAkucmVxdWlyZV9mb3Jj
ZV9wcm9iZSA9IHRydWUsDQo+IEBAIC02OTIsNiArNjk0LDcgQEAgc3RhdGljIGludCB4ZV9pbmZv
X2luaXRfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJeGUtPmluZm8uaGFzX3BhZ2Vf
cmVjbGFpbV9od19hc3Npc3QgPSBkZXNjLQ0KPiA+aGFzX3BhZ2VfcmVjbGFpbV9od19hc3Npc3Q7
DQo+ICAJeGUtPmluZm8uaGFzX3ByZV9wcm9kX3dhID0gZGVzYy0+aGFzX3ByZV9wcm9kX3dhOw0K
PiAgCXhlLT5pbmZvLmhhc19weHAgPSBkZXNjLT5oYXNfcHhwOw0KPiArCXhlLT5pbmZvLmhhc19z
b2NfcmVtYXBwZXJfdGVsZW0gPSBkZXNjLT5oYXNfc29jX3JlbWFwcGVyX3RlbGVtOw0KPiAgCXhl
LT5pbmZvLmhhc19zcmlvdiA9IHhlX2NvbmZpZ2ZzX3ByaW1hcnlfZ3RfYWxsb3dlZCh0b19wY2lf
ZGV2KHhlLQ0KPiA+ZHJtLmRldikpICYmDQo+ICAJCWRlc2MtPmhhc19zcmlvdjsNCj4gIAl4ZS0+
aW5mby5oYXNfbWVtX2NvcHlfaW5zdHIgPSBkZXNjLT5oYXNfbWVtX2NvcHlfaW5zdHI7IGRpZmYg
LS1naXQNCj4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmggYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcGNpX3R5cGVzLmgNCj4gaW5kZXggM2JiNTFkMTU1OTUxLi5lMmJkNGM4MWIy
YTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmgNCj4gQEAgLTUzLDYgKzUzLDcg
QEAgc3RydWN0IHhlX2RldmljZV9kZXNjIHsNCj4gIAl1OCBoYXNfcHJlX3Byb2Rfd2E6MTsNCj4g
IAl1OCBoYXNfcGFnZV9yZWNsYWltX2h3X2Fzc2lzdDoxOw0KPiAgCXU4IGhhc19weHA6MTsNCj4g
Kwl1OCBoYXNfc29jX3JlbWFwcGVyX3RlbGVtOjE7DQo+ICAJdTggaGFzX3NyaW92OjE7DQo+ICAJ
dTggbmVlZHNfc2NyYXRjaDoxOw0KPiAgCXU4IHNraXBfZ3VjX3BjOjE7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc29jX3JlbWFwcGVyLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfc29jX3JlbWFwcGVyLmMNCj4gaW5kZXggOGE2NzQ5OTE4NDM2Li5lYWYxOGQ4NTI3
OWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zb2NfcmVtYXBwZXIuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc29jX3JlbWFwcGVyLmMNCj4gQEAgLTMsOCAr
MywyMyBAQA0KPiAgICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gICAq
Lw0KPiANCj4gKyNpbmNsdWRlICJyZWdzL3hlX3NvY19yZW1hcHBlcl9yZWdzLmgiDQo+ICsjaW5j
bHVkZSAieGVfbW1pby5oIg0KPiAgI2luY2x1ZGUgInhlX3NvY19yZW1hcHBlci5oIg0KPiANCj4g
K3N0YXRpYyB2b2lkIHhlX3NvY19yZW1hcHBlcl9zZXRfcmVnaW9uKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLCBzdHJ1Y3QgeGVfcmVnDQo+IHJlZywNCj4gKwkJCQkgICAgICAgdTMyIG1hc2ssIHUzMiB2
YWwpDQo+ICt7DQo+ICsJZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSkoJnhlLT5zb2NfcmVtYXBwZXIu
bG9jayk7DQo+ICsJeGVfbW1pb19ybXczMih4ZV9yb290X3RpbGVfbW1pbyh4ZSksIHJlZywgbWFz
aywgdmFsKTsgfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB4ZV9zb2NfcmVtYXBwZXJfc2V0X3RlbGVt
X3JlZ2lvbihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyDQo+ICtpbmRleCkgew0KPiArCXhlX3Nv
Y19yZW1hcHBlcl9zZXRfcmVnaW9uKHhlLCBTR19SRU1BUF9JTkRFWDEsDQo+IFNHX1JFTUFQX1RF
TEVNX01BU0ssDQo+ICsNCj4gUkVHX0ZJRUxEX1BSRVAoU0dfUkVNQVBfVEVMRU1fTUFTSywgaW5k
ZXgpKTsgfQ0KPiArDQo+ICAvKioNCj4gICAqIHhlX3NvY19yZW1hcHBlcl9pbml0KCkgLSBJbml0
aWFsaXplIFNvQyByZW1hcHBlcg0KPiAgICogQHhlOiBQb2ludGVyIHRvIHhlIGRldmljZS4NCj4g
QEAgLTE1LDcgKzMwLDEwIEBADQo+ICAgKi8NCj4gIGludCB4ZV9zb2NfcmVtYXBwZXJfaW5pdChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkgIHsNCj4gLQlzcGluX2xvY2tfaW5pdCgmeGUtPnNvY19yZW1h
cHBlci5sb2NrKTsNCj4gKwlpZiAoeGUtPmluZm8uaGFzX3NvY19yZW1hcHBlcl90ZWxlbSkgew0K
PiArCQlzcGluX2xvY2tfaW5pdCgmeGUtPnNvY19yZW1hcHBlci5sb2NrKTsNCj4gKwkJeGUtPnNv
Y19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uID0NCj4geGVfc29jX3JlbWFwcGVyX3NldF90ZWxl
bV9yZWdpb247DQo+ICsJfQ0KPiANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNl
Yy5jDQo+IGluZGV4IDhmMjNhMjc4NzFiNi4uZWRlZDQzMzA1ODRjIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV92c2VjLmMNCj4gQEAgLTE2Miw5ICsxNjIsMTEgQEAgaW50IHhlX3BtdF90ZWxlbV9yZWFkKHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCB1MzINCj4gZ3VpZCwgdTY0ICpkYXRhLCBsb2ZmX3QgdXNlcl9v
ZmYNCj4gIAlpZiAoIXhlX3BtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSh4ZSkpDQo+ICAJCXJldHVy
biAtRU5PREFUQTsNCj4gDQo+ICsJaWYgKCF4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdp
b24pDQo+ICsJCXJldHVybiAtRU5PREVWOw0KDQpUaGUgeGVfcG1fcnVudGltZV9wdXQoKSBpcyBt
aXNzZWQgaWYgcmV0dXJuIC0gRU5PREVWIGhlcmUuDQpIb3cgYWJvdXQgbW92ZSB0aGlzIGNoZWNr
IHRvIGJlZm9yZSB0aGUgeGVfcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKCk/DQoNClNodWljaGVu
Zw0KDQo+ICsNCj4gIAkvKiBzZXQgU29DIHJlLW1hcHBlciBpbmRleCByZWdpc3RlciBiYXNlZCBv
biBHVUlEIG1lbW9yeSByZWdpb24gKi8NCj4gLQl4ZV9tbWlvX3JtdzMyKHhlX3Jvb3RfdGlsZV9t
bWlvKHhlKSwgU0dfUkVNQVBfSU5ERVgxLA0KPiBTR19SRU1BUF9CSVRTLA0KPiAtCQkgICAgICBS
RUdfRklFTERfUFJFUChTR19SRU1BUF9CSVRTLCBtZW1fcmVnaW9uKSk7DQo+ICsJeGUtPnNvY19y
ZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLCBtZW1fcmVnaW9uKTsNCj4gDQo+ICAJbWVtY3B5
X2Zyb21pbyhkYXRhLCB0ZWxlbV9hZGRyLCBjb3VudCk7DQo+ICAJeGVfcG1fcnVudGltZV9wdXQo
eGUpOw0KPiAtLQ0KPiAyLjQzLjANCg0K
