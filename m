Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E716C02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 17:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B614710EB60;
	Fri, 17 Jan 2025 17:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN6/zFPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C3910EB5F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 17:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737136559; x=1768672559;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0NUrP4s01Nv49WkLy/Eo42FhVi3ZU50VmCHoeDgxmwM=;
 b=DN6/zFPoNF5aGIl3apjGqwO7Cbqp9Jb+rIbkROkWoJKh7ah8G1QPOR7t
 ZNsVXY1NhoVtB7RjOyZomc1CU9rBNEDD872j4l9J6KkDm3/XSNnd67UH4
 uWzhyXWqPc5vExn/zY1GW0LHiW+58FvGWhpsqqbFLmmC0vX5+2pt2U3+T
 WHzj7NFwMeTfpx1Mh59+RKjhordM9ERvvwHMqofuS/jgogKy5HEXRrF+t
 ikdhw/na/bNvNj74x7ruFm+sS/Gng92+5TfuALfMFegqEVSfYHyVuQq68
 MqLfrDTcsBcCM1yLNOO6Lz8I6avSMUEpzS9cPlcoVBzSBq9LzVp87B5h3 A==;
X-CSE-ConnectionGUID: mc4oERGsTcWl2sI+wtL63g==
X-CSE-MsgGUID: YCxGys8gR1OnDu1Fib/tCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37458839"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37458839"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 09:55:59 -0800
X-CSE-ConnectionGUID: hQwJk2yJSoqas8xOy+kT+w==
X-CSE-MsgGUID: uSqULzlzT+urLgzGybE2ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143148243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 09:55:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 09:55:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 09:55:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 09:55:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QujWsYJ00w562Ecmk6jNTWIlZbuWT430L8swo40/wmj+HoopsWBbDKnDwj70R/zmOUjtGGBFQkxhNWxFmkhTtzLFOKVszj2+4WizyenvpTRQz7AuhD56JY+fKajj76ruJtv4/rYls/ABNHmT2UJ9t0+7mAG0XLp3ZD5aY3EcPYbl5xJOMRcN/aIWw8hEy78zxw5ywEbVk3F94uNNYAJJM4Svw4fSVhWzM51xw1fDlyT59V9HMzG1gJ1m0THtOrxkyEPmt+VLG+/TAe8wSidkbNuxWlIvo/BLYJq1mrlfEbSfPWC8nEXOpkRhq7HIXgWmwPJiOkPNGWS6AdCoUCwG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NUrP4s01Nv49WkLy/Eo42FhVi3ZU50VmCHoeDgxmwM=;
 b=nRzgulKvmfJHZyz4AyvFsNu0xvDc7rV5NHghHQPspIcBIQLrG/QwT/pB/ZtJNKuuIxl/Rq5JFFAMO5rLW46WMt0wksk5759aP2laZ3IfcRSUJ/xcq1Aqed8mDh5+FkeZMoj7KPMMxMN86+9lKQD6pb5YkWb5uVr7uGivWEzoTXSVdeG1m8IUi03tj67LiUwqagE1dhjKmEPF/CtUAwtk7qEg+STPf8D7j/Tq1FmuOIIF5DieoW/2MglF91lgmu+hGS9bo3fsB+gFF+9Vs4euqWK4Ercns/xT/wRTJciiGZI3es0KPP5HsZlXltZN0B5fYI0tRcge6VGXldPsGQVCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.15; Fri, 17 Jan
 2025 17:55:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 17:55:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/display: Clarify XE_IOCTL_DBG message
Thread-Topic: [PATCH] drm/xe/display: Clarify XE_IOCTL_DBG message
Thread-Index: AQHbaNZ94GaD6eYIsE6Zp32EGJRMbLMbQG4A
Date: Fri, 17 Jan 2025 17:55:56 +0000
Message-ID: <bfb41019793270ae2aee1e4cc14b95c109dfce3e.camel@intel.com>
References: <20250117115305.53113-1-dev@lankhorst.se>
In-Reply-To: <20250117115305.53113-1-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB7938:EE_
x-ms-office365-filtering-correlation-id: a0bc1220-c29a-4098-10d2-08dd37203154
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q2tqTi9oTjhocGlEYUFJcVhqamJudDJUZ1kycjlma3VWbTB3REYybmRKbHhh?=
 =?utf-8?B?RUg5aWk5SEUxSTF5MG45bk5ubXRPanhydGU4Qy9uV0lBdmdNQW5xTkJNeXdU?=
 =?utf-8?B?VjBEK2QzVjdTMmdkK3ZiQnd3ZHh1a3VxNVFDS244UFRLbklFcFhzai9yeVZ3?=
 =?utf-8?B?TjlxY20ydm5EOW4xWm5Kb3BNczJoRDNrYm1mdUNLSkFxYlUvWkRuZGUrWXFk?=
 =?utf-8?B?czhLRmhkK0hrdlRQdmVmd3VadjczcEt5QzNuMDZwY3NMbSthaFlzRUt2YnJ2?=
 =?utf-8?B?M3duU05MWXpLT1NiT0VRNXNidmJaSEs3aG5FLzlzVlF6T1Y0MXhiTjN3NGM1?=
 =?utf-8?B?VXhjbVpLNzZFZGt6eEwxM3VHdElOQTRPTDZCZnU3bjRTN0ZUOVc0aDdpUjdz?=
 =?utf-8?B?Qi9UMW5CM1R6KzQ3T0J5M21iZ2E0Qjg4aVM4cElpMGJiakQ0aTFwUHJNVm1n?=
 =?utf-8?B?ZUFUOUxtcGo1VU13QjJDeXdvdE4ycHN5WGFUVndHOWZlSWVETUJrUFJQbkhn?=
 =?utf-8?B?Z2ttM2VFMHAyTXFyZXBaL3dnMndMZElQN0UrelhYenBOV0g2QnN3Vi8rUEZC?=
 =?utf-8?B?M1lQQ1pzSmcwVGxWdDU1Mkg4SHZhLzFxdXlWdG5CYnRjWXRQN2h2TnEyQkdz?=
 =?utf-8?B?cGxiUE5peVZXM2RSR3BXZTZrUEt2Y284dE84SkhlUlRCSFNuYjJOMmVHaVJs?=
 =?utf-8?B?VTViV1U1OEtLUUFhU3dmeFBuS0FOeWdtak5yQW43SFdkdlduUFE4M2dPTjZF?=
 =?utf-8?B?MjRib2FmZlZ2M3Q5UkxxOUJJZ01OWDRYeFQweFNTVFRlWTdpQW5LZlN0UHdk?=
 =?utf-8?B?MERNakF3cUpLMUtDUzJRWDdZSnpLbnFEaFFzbUZpZTRJNjdjdXNod2NmSTBE?=
 =?utf-8?B?dkZOTWFVYXMwOFZUUlZVU0sxK0FmaDFpd2J5Yk1DM3dncUh2cCt4UDV1SURP?=
 =?utf-8?B?WUlGOHNYTkFFOW9UYmlIY09UOXBvYWtlbThvMkNSaEp1d3l2SEdtVDc1Wmtv?=
 =?utf-8?B?SFk1QUgrZEpFVVZZNVhRSTRDRjBENkNmY2c4WFAyeE1HK3krTEVDbEI2TzNt?=
 =?utf-8?B?c2V2Z2w4WEdldDBGeGkxT2prTTRzSnY3RU5ZSkVJM0NnaWdZSWFqUDdoaW5l?=
 =?utf-8?B?d2ZGNklxeFlyNXpOYXBqUlJ2VjVtb1NBSGxSVndaN0hja3dWRnhVNE9laU5K?=
 =?utf-8?B?bkZ2eGU3Vk9Fc2VIKzhwQng0cnh3akJxOWpSMlBFYW40Y05YRjZtOG5xd1J0?=
 =?utf-8?B?cE9wb1Nnb001bnNTVW93dzN5VnZQY2NPMjFHbVMweDlWQytCSm9MQlE2VDNP?=
 =?utf-8?B?K0paVVRiZERCZDV3MHdWcDhmdWtmbk5hVE5BUVBEOW9IaTVGa1UzTU1RY2Rk?=
 =?utf-8?B?QWZVZU5aVjM1STdPcFhkS2ZkaklIK0djUDhqQnpBVVlBTnlNTUkzMStMWUh1?=
 =?utf-8?B?emI2d09Pc2I4RjlKQWFONCs3Y1RJcTJVQkc0TjZneDU5aDkvQnhBNzd3SkdO?=
 =?utf-8?B?RVErV05ueityNUxuVFN3ejdUUU1mR0xNeVNNd2Nzc211Q0drZmpxTjZFUnpl?=
 =?utf-8?B?VVlLT2MveCs2UG9HWlU4RFBVZ284bEZlejVxeGFMT3FKaENmWHF6cmUxMlQ2?=
 =?utf-8?B?ejJSQlNVblRtREtNY2p6NnV5MERzdTdDNE15ZVU5Q0VVQUZ4eXFXdGRMOHZT?=
 =?utf-8?B?dE9Sb2t5K1pnU2J1WGJPYXdCd2JPdm11L083dzgyNGtsZEJHTVpscWhoVmF4?=
 =?utf-8?B?RnhHRXJGWW8rc21lMk9BT29uYTJra0F0ejB0SFRlSkhwWEJSNHdYZTNMSXhI?=
 =?utf-8?B?VFA4MnhkS2ppbnhIMTBvTU5XU2tQalJVNWtqbjlHRjQ2ZEYyZnFXVTBySDY2?=
 =?utf-8?B?ZHh0MlBUNytQdmsyRkppYitueFV6ejhveTRvY094NThMSkQvRnJNVzZLL3Bt?=
 =?utf-8?Q?5qVxqlQHKrU4Xm1XvojCmMMYsTHeYnEH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkdscTgvRmRMaW5jYmtmcHFodyt0U2hEc1J0YUFWU05JSHJ4ZGdHZkNtSEN5?=
 =?utf-8?B?aW9laTlMUE1CZ3V6eUt6dWtFcHN6R25TRFB6S2p3N3Y5ZXN1ZEo0UzFOUTh0?=
 =?utf-8?B?TXdxNFZsUFRwR3JzcDFjdHpQMWNWQW82SnJMQ0ZGN2IvTDhOTy9qNGNmTUor?=
 =?utf-8?B?a2RMb3hwazJzRGpwY21haG1uVk9iWFB2cHdmcG9BUmRrcytKZytrZjhRdEVG?=
 =?utf-8?B?L2xMK1kyZnVTUitEYWl1UFZEUjg4WmJLL3ZBUjNvUVdWcUlsaVVjeTRtQy9H?=
 =?utf-8?B?UnNvWVVKZXlIcVptYm1LZGhvczBnWktpVEs5eXBUdHB0ajQ0RGdtN0h1bkpx?=
 =?utf-8?B?NjljSWwrdmJaeENyS3dFb0laYVdnUEFmUVdidGRSTTlKMm9vSXF5b2RkZ1M1?=
 =?utf-8?B?Y0lkMm5YSHJWREtEYVpuMDRoY2RWOFZtNFM1RUdxRWt6bDhqblE0dzMxL1Zn?=
 =?utf-8?B?YjdLOHRUdWN3TVhnbnVkYTIxcFFBY1FWSnFkaEpUdWxFNWwxWE9YdHFSakQ3?=
 =?utf-8?B?SnJVdFdac1ZLYVVjaVhhZ0pNV2tKVzUrbmtGcHJpL1NDdzhhcVFxYnN1VUh2?=
 =?utf-8?B?U2JSMWhkSFlpSVZGS2N6WVVhMGpPYitPYzZQVERVQjBUc3BpREdYZUZyaGlD?=
 =?utf-8?B?cUhiK2hQalJjaWRuN1BmTzJkbTBiNU1Na1FacnFVS3h4dVphNE4yWjZvaEVx?=
 =?utf-8?B?U2Uydmpab3EzREJuaEd2Snp4VmNWWUpCWDBNaVVrN3d5SG10d2Z0Z0VqWHF0?=
 =?utf-8?B?NDFTR1FPL2JzRENXK2QySklzeDJDQmhydWxHdXk5S094VXg4ajJONG0zL1BH?=
 =?utf-8?B?UEhHb05mL1JMYzVPM2dqVXBpRzBZT25NN05iQ1pLZGcvVy9WQVlrYjIxWHFm?=
 =?utf-8?B?OWxpSTZlMkVUSDFLQXdHbUYySEVSbXBDYXpkYnN1YmdKSmJFZnFqd2VjUzl0?=
 =?utf-8?B?bEZHWG1rRkllZXZPbnR2YVh2amh5bXMvN3Bta1NrOHVFMU9ERGRpWDJwTXdy?=
 =?utf-8?B?YTM2Y0pOdTFMZkNRbklyQXVyenk0Tm5JS0pacjE3Y3d2Wk9aUm1XNEE0VFNP?=
 =?utf-8?B?SWFWc1EwaTNES09VV2swVDNnVXc3SXoyc2kyajdZRi8rMkdmMm9TaitMbjlE?=
 =?utf-8?B?Z1kyV0M3OG1xNEZnOGJHcUd6WTVYV2xsQ0t1aWJTcVJjWmFmb3NvbWZLc1Jy?=
 =?utf-8?B?dVhMbEQrV1VyOE5zbUk1NzRoK3cwRmswMmpFcmZ5MXV1VkhBanhkQVREYzNp?=
 =?utf-8?B?cUxSQXVPMEQ0ZFhjdEcvdSthRnVFZ1RMTnpvamdKQjRRQTkrdUdnRmlMUnpE?=
 =?utf-8?B?MHA1VlI3OEFXV1BralJuZktjWUdPZnZhNmJlUVFMYlVGRUtIVmlrWjNSU2Jw?=
 =?utf-8?B?LzIxbkxsNUh2V3lBbWQ4V2E1VXdWR3R6YzRBblJLK1kwR29FZjJLeW1DUTJV?=
 =?utf-8?B?ZS93NU1DejZibWV0ZGVhVEFURDFZcXJEaEk1UGduaTVmdDRoOVY4LzZkdE1k?=
 =?utf-8?B?WkNkejE1MHV4Nlc3TnJpZUxOWkwzSTFIWXlBQ1pSNzZJbGh5QUhSUjBWdkVh?=
 =?utf-8?B?R3dITmxvQ01abFFHR1IxMHNkVVcvZmw0dDRvaGVIMWVvM29aZ0VYeGQ2d1gz?=
 =?utf-8?B?UjdRemxNOTY1dlNVWDBhZG8vbnNDRlViYm5NT3IwUzRIaVNLcE93Sk53Sjky?=
 =?utf-8?B?SGNmbjllaFBKZStCVjg5aGMwSmVGRnhiWDNCS0o4d1RBcU9kOHQwNlFNQjNz?=
 =?utf-8?B?bVNQR2tjVFBYdmpVMWM0VS9Lc1F5dkw5RGdZdjlONnN5cEt2RTNicHBmVUlj?=
 =?utf-8?B?RCtPeHl2UnZINlQrOUJnenlQdysxazZxMndtRGVmRlhMNlJDTTBtcGtVbFZn?=
 =?utf-8?B?TUx4L0thMkRUN0RlVnFCVFRLQnU4RHM0UVFSQkZwaUdZb1RIQ3ZwT1ErL3FU?=
 =?utf-8?B?WHRmMmRRMlZ6L0daZXljQUg1OUFobTIwTzZNRnZSa05xRkM5d3pnVGdDWW4w?=
 =?utf-8?B?ZFdyUHg5UkRKNVNYN1AvVXhXbmFTa1hmcXYzNWltMGlhbWJmajZGbHVOOWlI?=
 =?utf-8?B?NkZxK2FzT3huM3FMLzczYUsrZmZVbHlRdExoRGJMRWRGZHY3UnhuL0lGK1A2?=
 =?utf-8?B?TElQQkZFWGlISXpPL3pBRHJ1T0pRVTM1MUcydi9nNzQxUHhSUGFOVzI2Mm9I?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86DDE681E2332F4B9A70763297FC8402@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bc1220-c29a-4098-10d2-08dd37203154
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 17:55:56.2047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B18arDVNswAAiLxsJDvSVQXUUWhJZIKUFIdKL0gEtkfKYUq5A4dBqUBhxkb1kXdWg6KV7jER6gI69F/ZGg+yoGqUFh0xJVXHYkBoaa1FSkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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

T24gRnJpLCAyMDI1LTAxLTE3IGF0IDEyOjUzICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBUaGlzIHNob3VsZCBtYWtlIGl0IGVhc2llciB0byB1bmRlcnN0YW5kIGZyb20gdXNlcnNw
YWNlIHdoeSBpbXBvcnRpbmcKPiBCTwo+IGZhaWxzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkvaW50ZWxfZmJfYm8uYyB8wqAgNSArKystLQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTYgKysrKysrKysrKysr
KysrKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAxICsKPiDCoDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkv
aW50ZWxfZmJfYm8uYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkvaW50ZWxfZmJfYm8u
Ywo+IGluZGV4IDRkMjA5ZWJjMjZjMmEuLmEzOTE0YjYxYjcwNDkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkvaW50ZWxfZmJfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L2ludGVsX2ZiX2JvLmMKPiBAQCAtMjQsNiArMjQsNyBAQCB2b2lkIGlu
dGVsX2ZiX2JvX2ZyYW1lYnVmZmVyX2Zpbmkoc3RydWN0Cj4gZHJtX2dlbV9vYmplY3QgKm9iaikK
PiDCoMKgwqDCoMKgwqDCoMKgeGVfYm9fcHV0KGJvKTsKPiDCoH0KPiDCoAo+ICsKCkRyb3AgdGhl
IGV4dHJhIGxpbmUgYnJlYWsgaGVyZSBvbiBtZXJnZS4KCkkgYWdyZWUgdGhpcyBpcyB3YXkgY2xl
YW5lciwgdGhhbmtzIQoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVy
c0BpbnRlbC5jb20+Cgo+IMKgaW50IGludGVsX2ZiX2JvX2ZyYW1lYnVmZmVyX2luaXQoc3RydWN0
IGludGVsX2ZyYW1lYnVmZmVyICppbnRlbF9mYiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21kKQo+
IEBAIC01MCwxMCArNTEsMTAgQEAgaW50IGludGVsX2ZiX2JvX2ZyYW1lYnVmZmVyX2luaXQoc3Ry
dWN0Cj4gaW50ZWxfZnJhbWVidWZmZXIgKmludGVsX2ZiLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFhFX0JP
X0ZMQUdfU0NBTk9VVCBzaG91bGQgaWRlYWxseSBiZSBzZXQgYXQKPiBjcmVhdGlvbiwgb3IgaXMK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGF1dG9tYXRpY2FsbHkgc2V0IHdo
ZW4gY3JlYXRpbmcgRkIuIFdlIGNhbm5vdAo+IGNoYW5nZSBjYWNoaW5nCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIG1vZGUgd2hlbiB0aGUgYm9lY3QgaXMgVk1fQklORGVkLCBz
byB3ZSBjYW4gb25seQo+IHNldAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBt
b2RlIHdoZW4gdGhlIGJvIGlzIFZNX0JJTkRlZCwgc28gd2UgY2FuIG9ubHkgc2V0Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBjb2hlcmVuY3kgd2l0aCBkaXNwbGF5IHdoZW4g
dW5ib3VuZC4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoWEVfSU9DVExfREJHKHhlLCAhbGlzdF9lbXB0eSgm
Ym8tCj4gPnR0bS5iYXNlLmdwdXZhLmxpc3QpKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAoWEVfSU9DVExfREJHKHhlLCB4ZV9ib19pc192bV9ib3VuZChibykpKSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdHRtX2JvX3Vu
cmVzZXJ2ZSgmYm8tPnR0bSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0ID0gLUVJTlZBTDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYwo+IGluZGV4IDNmNTM5
MWQ0MTZkNDYuLjAzZjkzYjg1NjE2NTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYwo+IEBAIC0xMjQsNiAr
MTI0LDIyIEBAIGJvb2wgeGVfYm9faXNfc3RvbGVuX2Rldm1lbShzdHJ1Y3QgeGVfYm8gKmJvKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgR1JBUEhJQ1NfVkVSeDEwMCh4ZV9ib19k
ZXZpY2UoYm8pKSA+PSAxMjcwOwo+IMKgfQo+IMKgCj4gKy8qKgo+ICsgKiB4ZV9ib19pc192bV9i
b3VuZCAtIGNoZWNrIGlmIEJPIGhhcyBhbnkgbWFwcGluZ3MgdGhyb3VnaCBWTV9CSU5ECj4gKyAq
IEBibzogVGhlIEJPCj4gKyAqCj4gKyAqIENoZWNrIGlmIGEgZ2l2ZW4gYm8gaXMgYm91bmQgdGhy
b3VnaCBWTV9CSU5ELiBUaGlzIHJlcXVpcmVzIHRoZQo+ICsgKiByZXNlcnZhdGlvbiBsb2NrIGZv
ciB0aGUgQk8gdG8gYmUgaGVsZC4KPiArICoKPiArICogUmV0dXJuczogYm9vbGVhbgo+ICsgKi8K
PiArYm9vbCB4ZV9ib19pc192bV9ib3VuZChzdHJ1Y3QgeGVfYm8gKmJvKQo+ICt7Cj4gK8KgwqDC
oMKgwqDCoMKgeGVfYm9fYXNzZXJ0X2hlbGQoYm8pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1
cm4gIWxpc3RfZW1wdHkoJmJvLT50dG0uYmFzZS5ncHV2YS5saXN0KTsKPiArfQo+ICsKPiDCoHN0
YXRpYyBib29sIHhlX2JvX2lzX3VzZXIoc3RydWN0IHhlX2JvICpibykKPiDCoHsKPiDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfVVNFUjsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
aAo+IGluZGV4IGQ5Mzg2YWIwMzE0MDQuLjZkMmYxMDg2ZDUzM2EgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
aAo+IEBAIC0yMzQsNiArMjM0LDcgQEAgYm9vbCBtZW1fdHlwZV9pc192cmFtKHUzMiBtZW1fdHlw
ZSk7Cj4gwqBib29sIHhlX2JvX2lzX3ZyYW0oc3RydWN0IHhlX2JvICpibyk7Cj4gwqBib29sIHhl
X2JvX2lzX3N0b2xlbihzdHJ1Y3QgeGVfYm8gKmJvKTsKPiDCoGJvb2wgeGVfYm9faXNfc3RvbGVu
X2Rldm1lbShzdHJ1Y3QgeGVfYm8gKmJvKTsKPiArYm9vbCB4ZV9ib19pc192bV9ib3VuZChzdHJ1
Y3QgeGVfYm8gKmJvKTsKPiDCoGJvb2wgeGVfYm9faGFzX3NpbmdsZV9wbGFjZW1lbnQoc3RydWN0
IHhlX2JvICpibyk7Cj4gwqB1aW50NjRfdCB2cmFtX3JlZ2lvbl9ncHVfb2Zmc2V0KHN0cnVjdCB0
dG1fcmVzb3VyY2UgKnJlcyk7Cj4gwqAKCg==
