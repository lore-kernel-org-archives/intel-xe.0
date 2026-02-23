Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60189EEC2A3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC5110E45D;
	Mon, 23 Feb 2026 22:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqAzRX/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDB910E45D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886974; x=1803422974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZMYiWXMWJWJV6RG2/Q7wuxafJcyp3lXEOaO8ckMLtMs=;
 b=QqAzRX/V2k74XnHCH5IYk9rmd9QQ8J4ABx1l//Otl39TB55ZLDVvvRIJ
 c69bwL8ZCJyjpUz1fCKFu+GLS8vv1Y7OLUHnocmaYO1VYqsw3ZFW/fMiS
 2vWxrmSGZqOSL0v7krhCyr6/+4GkQ3JvOvAU03JpLBUW/l4sAUr6WKnt9
 wI7MsPs4aIQulMjTjf5+Z2SYXEGD190m/AFn1as1LApq6gLZj1tiEEQiu
 vRetINfoIRTqCe0fm/ygm9WDoDlx7pppYax1VujRUeZjDco046wlGlLQR
 ssgJSqzF20id27N3ZE3PLOs4uLDbzr4dT/LXPHZeTHPO4bCsIyAxneRWe w==;
X-CSE-ConnectionGUID: hF7HqtVKT1qzZaUfDFAydw==
X-CSE-MsgGUID: HLXSSSkjTIuX3vaMCHGhJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72869358"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72869358"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:49:29 -0800
X-CSE-ConnectionGUID: R3hhjCqoR26zyqkDcQzlzA==
X-CSE-MsgGUID: 6Je30NBUSF+ASqe9/Mx+Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214087264"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:49:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:49:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:49:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:49:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbSQD90gMOaDOweJl+FclQ04KvIkyxE/Ct6Nb4eyjE4FqGNSZf3cDZCzWRw90I2YNYNPJM8wm4XApQdnflhPpUK8UP+gSjQuUd0ajIl13bOFIfc7EhjaJs1yWVkST6IFrEkT0hrPQn3h2Vcm0V2ChZ0crvzgwACvJ+kSm57cnpRg2fT0QLVWX566oOnhM+nwlkUy9593YDuiaZR8hNVtgn8U6lqoPpMXfNR9HwT/irAdMZ5DNHLT03Puj+UYXEB4siJ1kWj4BfsgkZZFFvPvIFMD4ltw9qibzQ46ZNfLrknyOQIvSxnpbZiqPWXd7YP3lX1S/pi23xOcM18rvC9cPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMYiWXMWJWJV6RG2/Q7wuxafJcyp3lXEOaO8ckMLtMs=;
 b=KIBeOTxRZr7fCQlXE26hTPgQOOejxPi4QKNK0vM/JxNVMK91muQppdV7u9AYYzwJ3OsTfPy45p9wHr1n3kzT0aJlr1H/c8xwMHhKdAQhzeNvtxg9cPKP4Cj01rhYppe3oT2iXNBgNf+4bdHpEWBRvFdixC1Kg2zcjly2GCvRNU0/S3qYbdXrMKMA8ivC102jA3dfhJoivM1Sr0dHeqHXuLahTeJXIvTPA/Rx3Lm1hHYD9jYuZRgu9MFX0pBRl1dENHtAPiyK/hLtVk/Oddut+4IYA1UknxeLxsSXVpz4xe+uwsObub/QfngP/I+niiN4tt6lRsRHZ1LpzHeB9TxqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by DM3PPF7D18F34A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Mon, 23 Feb
 2026 22:49:21 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:49:21 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Topic: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Index: AQHckPk3RdncFNFU0UyddFnPlKXa+7WRC1eA
Date: Mon, 23 Feb 2026 22:49:21 +0000
Message-ID: <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
In-Reply-To: <20260129082756.1096935-3-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|DM3PPF7D18F34A1:EE_
x-ms-office365-filtering-correlation-id: b74e9ad5-8004-4f1f-244f-08de732dc8ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z3ZyQU5nTWJqSEt3Vm1rZnlnNUd5YUFnSjdmbTJmQlFKVEJnWjIyL2V5bWt4?=
 =?utf-8?B?OEVBdUt0dHNVVnhicWp0OHViR1VTUHJQdWdlVmI3OU93T0hCeFNTTVVEWWtj?=
 =?utf-8?B?Ynh0WjlMb2RSdWI3ZTNrbTViajUxWmVNQy8zdWpZc2JxamlMcXdZai9xMDJJ?=
 =?utf-8?B?Znd2bTZ3dkNwbXp1MUlCQTFRVTUxVGd5NVNETmtsTEd0dW1UOTlMVW9rbHVl?=
 =?utf-8?B?SEVBMGl0OTczYVAzU3ZMaEFabmVpL3FBOUU0cGhld0NxSHEyRGp0QVA1ZXVJ?=
 =?utf-8?B?eU9lUlNDY21KMlNIVFl2cUJ2K0YxN2hMMUlObUYyem9tVHB1cWlWeWdFeElI?=
 =?utf-8?B?QWx2T2tua0dFY21zMzVneW9pUHJxWVM3U2JTQVBWK25KajhOWVpvdWlEN1lV?=
 =?utf-8?B?Z0E1NHkxazJuMDc5M1FIdGFmdkVoUC9IbjAvaDhMRlJVUndBNy80dURWUUNu?=
 =?utf-8?B?MTVLL0ZkNk9XcVdMSnR3WlZkMHA4bFJEVGJEOGc4akZrMUZqOUlDQW9UbFBZ?=
 =?utf-8?B?b0p2YW8zNjBLYkpLdGFtOE44Ykh0M0M2emc3bkFxTGxYWkZqdHFCMkFhWmZZ?=
 =?utf-8?B?UGpBdGFrMXVxSURySkhMZVc1anFKOTZCL1JoZkhwTE5QNkl1TWlkRHFxalpw?=
 =?utf-8?B?TXk1ZERxUXFyYVlpYnJxSGVZZS9XRzYrZnIyVEJSbm5FWFFZT0MvV1FVSmNL?=
 =?utf-8?B?blRTcG95NVNxRTdRWVpBUUVLTWVtZ09uaXlVNDhxWHR2Q3ozMVZyNExrRXZa?=
 =?utf-8?B?NnFiOWdjb3ZkMlRuQVRsRFlTdzI4UnBuUlJNK0F6K0o4bVlVN2VUOXgrNWZE?=
 =?utf-8?B?d2UzdlZoa3F3UHc1eWJ4aFRIcXFlN1dyNU0yTUVaeVNaUWYvSnZ1cXhwNnNC?=
 =?utf-8?B?eUMvSHZCZUFoazlmY3BNVmhjYkhMOUd0YTN2L1pFbEpERTNkSHVNQXAybjcw?=
 =?utf-8?B?VGE2N0Jyb1ZnS00yVTRTSDAwaFZDcXJPRkJLaFdRc1V4aktsS0E3MUxrb2dk?=
 =?utf-8?B?dDdXWjRqaU8zbHVhdHREdk03aVNveUEyQ3lpNlVWdkZaaDB0MUk2cjFLWWdC?=
 =?utf-8?B?aE5nM2hmckZYY2RkMVRKN09BMm42SU1Od1A4WllkMTlxcDI4WnE4dFo4bkhZ?=
 =?utf-8?B?RkM5Q25qUko0Y3pyTWVqYXI0TGQrMXZSQmVlUDAwM1hHelpRMTlZejJVUVd3?=
 =?utf-8?B?TUd5WGpRQm9FbFJQTDJjQy9QYXBEVlQ1M21WdlpsbzRBZE96Y2VJWVlmNmlC?=
 =?utf-8?B?SkU2Z2o1L0hoZU5paGhiczY1RzlqRFBBdXltOHZhZ3N4Ym45NytHSU5JYlRZ?=
 =?utf-8?B?VitNSFZIQlJ3d2RUM2lhcE52cmtuOTJuRDRFQS8yZ3JnOU82S2k0VlpGY2s4?=
 =?utf-8?B?K2RSUlhWd2xRZTVlV3dWcHhNME9TN2xGSG1QZXFzZklzaEloYWRLc1RyKy9N?=
 =?utf-8?B?YUZieUNWTWlKNTYyeVNaVU5CcXZMV3JIQ1A0a2dBYVcxSlQzaUdXTXNwZG1B?=
 =?utf-8?B?SXN4SnVMeGRPTTdzZUsyTUVBRmdZbHI3a2lFdVN5dG1aN0VIdVZSeEtNQ2xz?=
 =?utf-8?B?WEJYcThYOXZML3hBQXR6b0dFeDdXTE9URnNJZ0s2V1FuR3NoU0Nlelk4djBa?=
 =?utf-8?B?WmN0RVJYNVp1UXo5b1pxVHBiajRUTWZuUGdoN3JibTVHZmR2QWJSeWZOQUlX?=
 =?utf-8?B?TklES280S0R1TUd1SElid3JqeDdIVzdpTmdsS0tmckI0aGtkakhHaC9qb0RG?=
 =?utf-8?B?WHVYWXA1TzVGdXREdVk1c0RvdTNaYjBqb3dUbEE5ZmdobDc2ZUIwUC9tK3ZG?=
 =?utf-8?B?VGk5ZC9BQUM4WnNreFFCL1N4Yy8wbEpxZldmdVB1aGtJeDNpZFAxMldlVTFY?=
 =?utf-8?B?WXA2MlFzWno4VHlTUWdnNlpzSkNKV3RKb2lKdDgxeWpMbThlWGpzRWw4cmow?=
 =?utf-8?B?YUc0b1Z3TTYyK3hhZ0t5d0M3OVVPTStCc1BCMThXdm1BcUJpK1RHcHkvS1ds?=
 =?utf-8?B?VzRUUm9oWDVJVnNFdmVHL3dVY013SlZSYUxPbThBRGxTVytsdUlWTHRKakts?=
 =?utf-8?B?ZG1RbXRRNm9JNlN6MnlWR0xqenZLTk9iY2tJZnlBMDBzQmZMem9VODNtTE5a?=
 =?utf-8?B?UDJ4eE5zZXN5YlNWcy92MzQwZGpVSU1vRkUvWm5QbDdBVCtlU2c4Vk0zRFNR?=
 =?utf-8?Q?+z/RaaErrz4lBnZms6YrGZw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGhta2xnRGFaYktaRUQySFU5NXBzN3Y2RlkwbEJ1ZnJKaXZxMGFyY3Y4NTk4?=
 =?utf-8?B?TFdMeldOcDJVa0NqMDRoSHdVYkZncVJRNUdxODFlVCtBQUdrNmRQSHR1Skx1?=
 =?utf-8?B?NE14T0Nacm15U3o3U1h6V0wxTGxlZHFzcWVvVlZnOHBVUkRjZUNCVGc3UDRR?=
 =?utf-8?B?aXNhWmVTRVdpbW1BRU1veDhJck9JMmxpZUw3VGdib2dxd1RjQWltTVRXZHUv?=
 =?utf-8?B?NEdhMnBBVU1wdmwrTkRBVkVFS2xVVlNwZ1pqVWJUSHdBZVFrb2V1VlNBQUY0?=
 =?utf-8?B?clNidS82T0pORTh1d3F1K2thUXdMbkRGcUJ0dzZuc2tFRHZ4QkdxQjJzK3Bl?=
 =?utf-8?B?eFJFQ3RrMkhqdTFXYVU4bUlxeS9qNWMxOVNOaHNzbFNUdnloZXRpNGtKaUVv?=
 =?utf-8?B?NXBpQWMzMVJDdnpaVWRzRjl5R2Z6a3VKQXU1Q2RYRDJzdzQybWZOdG1TM0ZO?=
 =?utf-8?B?dHIyRWFUWVdlUGhGZzNnQmlDb21TVWt5TDNaY1hzdGlqYVE3Y2U1QThxOFdw?=
 =?utf-8?B?bkY0S0ozWGU4Q2xLWUtXb2NSWFdEV1ZWemw0bk9VWXZHNUVHZ2lnSVEwcHN3?=
 =?utf-8?B?djl5U3pXTFpkSXUvdTVNVWMvNElvaHZ5WFBiMmNlb21SUnFSdjRBV0cvR2Nr?=
 =?utf-8?B?UUFCNlo2UUlvSG1NWVF5blFGRy82Q1Q0UGoyM2dzTUVteStSeWVHTnlUSEFD?=
 =?utf-8?B?b3htWWdTeHg1b25uYm5hVXlCNnlWQ1owSGl2dEV0Skx5MlhUZzdzYlJJYlpR?=
 =?utf-8?B?QzBVdUlQRjVzdUMxSG1UTzhlTkVVL05wTXJUemdEYzVGVVIxc0kyUmlNVXc4?=
 =?utf-8?B?STFYcURYMFJGb1U4NmxnQ0Zvb0pwTHNEZm4wMzdJaXd4cHVON0pkdjUxK0hv?=
 =?utf-8?B?b2N2Q0Y1WlRQVFI4Vmw1YjBJVGM5dFZxMm83TVR4TFVQZmIxVFlZVlJPRG5R?=
 =?utf-8?B?cGt6bmFrQ3MzRGwzc0krL0lsanhDZ01yMzJ2bGZSWEd2SWVCaFFnd3d1cXhY?=
 =?utf-8?B?cVdxTkhYN0Y4bXVTMUhIa3pGV29QVUVTbDRIV3RCV2J5dUhUTTgzMVkxeGlh?=
 =?utf-8?B?OHljelRUb0UzVEJsNHZxOXc4bmY0NTlLYXp4Wm41UkpYQjgrbmdETWxySGhK?=
 =?utf-8?B?eHpHZkE3TjVBQmVFRThteGZsYWN4VzR1WlprWjM2cW9Mc3JoNWpkOStxQTZV?=
 =?utf-8?B?dEw4K0FKMDB2a1JiMlIzTmZib1dKVkhJd1MxaWVtRGxqdlNlbTk3d1kzM2Ey?=
 =?utf-8?B?c29PVjhNQ1BpUmgzd1BqV0J2YXNTWEFuU0JBWUV5U0pMOVV6QTY3b2o1RDVC?=
 =?utf-8?B?S012Q0FPWWMrMm94eXcyT1dpRmtxdlVOdnBwNVlnSW9PZlArK2VQVWJoL2FH?=
 =?utf-8?B?dDZ0WVkwb0p0b093MmFuM1Z3S0phc0RWdlZyZTFONTIzSmtRNlN6MEw0UVdr?=
 =?utf-8?B?WHhvdEExRlhLRnB6ZUI2VTNBTldBcHI3WkZpMkNWUi9YS2FWUFY3dnd1ZmhZ?=
 =?utf-8?B?WXhJaTNsN0lhTkZUQzNOUUM2Q3Z1U29ySElSY3BMbjdZakxLdXpCZWJ5Y2Ev?=
 =?utf-8?B?cFF6RklDMU13djZTSXVvRms1T3VqZHRHeFVrZlJlbjZacGN0VytpYStWY0xM?=
 =?utf-8?B?cnI0a0J3Mmh1VDlkaWhKZVREYjBhNkdhV2tiNWttTHpxcXRteWo1T29tSE5q?=
 =?utf-8?B?ejhUQUxqLzhhZ2lxTmlobU4vcGI3bU8yMUs2aG4vSnVWbkJWMUhEUXVmS2NX?=
 =?utf-8?B?M0Z5OWwyZ08vWnlYa3p5d1RmZmkzVkFoVDM3eFh6bXZ5NzVnanhXRHhST3ZB?=
 =?utf-8?B?VHpiNVkxYlFYV1BWV1BST0hVbDllRzd4d2RkWGt3N25HMWE0WnlkU3Arb2hU?=
 =?utf-8?B?WlFLMU1BYk5hdnIxQjFxN0JIdnNvYWc4MWJzRjdTTkpGNXptdUl4V2d5TnlW?=
 =?utf-8?B?NjlCU054b1RHOXFEYjJSbHB1QmpEQVU2dkZ1R1AxOFFzUjVjV0JvVWR3UGg0?=
 =?utf-8?B?OWkrOWM1eFd1QXhaemg1MEdxSkw5cVZDVEt6b0pGN01DSldpcDVtcXRMRnlY?=
 =?utf-8?B?VlkvWWtmdURLUTRtTjQwaXBQLzRQemJXcE9FYWVMQSsyYWdqTXhHL0FSSFA0?=
 =?utf-8?B?Mk5ia0tqdTJmYzJlOVM2QXZCSm9BN0s4dDRMeWhWc2s4Q1NQcnlwUGZicnN0?=
 =?utf-8?B?VUZtWlZXSmkxS1dmSmhseFNrUCtHZ2lEYTc5N1o1cHJyc2QzdUhqaWtHYkd3?=
 =?utf-8?B?bitPTDVNb3h3RjlJQi9SVW16NklzU01JTjliVjRBUURhZGtSd2Nwa2Jnc0Nk?=
 =?utf-8?B?eDFCcEFyU1BtU0JCLzV0S0dNU1NPbkFhdDc5Vm4zc1hHdFVGRXRVUTBFR1o5?=
 =?utf-8?Q?TpvOoA7FSGuNqxzU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56F8964178CBF048BA3B828ABED61AB1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74e9ad5-8004-4f1f-244f-08de732dc8ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:49:21.2109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YiV/WD27DehL2+GH5c7blPZP/u0YH1Nphhi45BMgAxVNk6KVXjUdgaGEL9J3iy/Xq9j6QEST4paAqL0bbT/6+MTe2tTPA/4AUCvx5L8jukI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7D18F34A1
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

T24gVGh1LCAyMDI2LTAxLTI5IGF0IDA4OjI3ICswMDAwLCBCcmlhbiBOZ3V5ZW4gd3JvdGU6Cj4g
VGhlIGNoZWNrIHVzaW5nIHhlX2NoaWxkLT5iYXNlLmNoaWxkcmVuIHdhcyBpbnN1ZmZpY2llbnQg
aW4KPiBkZXRlcm1pbmluZwo+IGlmIGEgcHRlIHdhcyBhIGxlYWYgbm9kZS4gU28gZXhwbGljaXRs
eSBjaGVjayBmb3IgaWYgYSBwdGUgaXMgYSBsZWFmCj4gdGhyb3VnaCB0aGUgYml0IGNoZWNrcy4K
PiAKPiBGaXhlczogYjkxMjEzOGRmMjk5ICgiZHJtL3hlOiBDcmVhdGUgcGFnZSByZWNsYWltIGxp
c3Qgb24gdW5iaW5kIikKPiAKPiB2MjoKPiDCoC0gUmVtb3ZlIG9sZCBhc3NlcnQuIChNYXR0IFIp
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTmd1eWVuIDxicmlhbjMubmd1eWVuQGludGVsLmNv
bT4KPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIHwgMTMgKysrKysrKystLS0tLQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQu
Ywo+IGluZGV4IDY3MDNhNzA0OTIyNy4uYjczYTM1NmQwZmExIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMK
PiBAQCAtMTY1NSw3ICsxNjU1LDcgQEAgc3RhdGljIGludCB4ZV9wdF9zdGFnZV91bmJpbmRfZW50
cnkoc3RydWN0Cj4geGVfcHR3ICpwYXJlbnQsIHBnb2ZmX3Qgb2Zmc2V0LAo+IMKgCj4gwqDCoMKg
wqDCoMKgwqDCoFhFX1dBUk5fT04oISpjaGlsZCk7Cj4gwqDCoMKgwqDCoMKgwqDCoFhFX1dBUk5f
T04oIWxldmVsKTsKPiAtwqDCoMKgwqDCoMKgwqAvKiBDaGVjayBmb3IgbGVhZiBub2RlICovCj4g
K8KgwqDCoMKgwqDCoMKgLyogT3B0aW1pc3RpY2FsbHkgY2hlY2sgZm9yIGxlYWYgbm9kZSwgbWF5
IG5vdCBiZSBndWFyYW50ZWVkCgpJIHdvdWxkIGtlZXAgdGhlIGNvbW1lbnRzIHRoZSBzYW1lIC0g
d2UncmUgc3RpbGwgdHJ5aW5nIHRvIGNoZWNrIGEgbGVhZgpub2RlIGhlcmUgYW5kIHdlIGFyZW4n
dCByZWFsbHkgZG9pbmcgYW55dGhpbmcgc3BlY2lhbC4gSWYgd2UgaGF2ZQpxdWVzdGlvbnMsIHdl
IGNhbiBsb29rIGF0IHRoZSBjb21taXQgaGlzdG9yeSB0byBkZXRlcm1pbmUgd2hhdCBjaGFuZ2Vk
CmZyb20geW91ciBwcmlvciBpbXBsZW1lbnRhdGlvbi4KCk9yIGlmIHlvdSB3YW50IGRvY3VtZW50
YXRpb24gaGVyZSwgaXQncyBtb3JlIGludGVyZXN0aW5nIHRvIG1lICp3aHkqIHdlCmNhbid0IHNl
ZSB0aGlzIGZyb20gdGhlIGNoaWxkIGFsb25lIHRoYW4ganVzdCB0aGUgZmFjdCB0aGF0IHdlIGNh
bid0Cih3aGljaCB3ZSBjYW4gb2JzZXJ2ZSBieSB0aGUgaWYgY29uZGl0aW9uKS4KCkFsc28gYXBw
bGllcyB0byB0aGUgY29tbWVudCBiZWxvdyB0b28uCgpUaGFua3MsClN0dWFydAoKPiBmcm9tIGNo
aWxkcmVuIGFsb25lICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV93YWxrLT5wcmwgJiYgeGVf
cGFnZV9yZWNsYWltX2xpc3RfdmFsaWQoeGVfd2Fsay0+cHJsKQo+ICYmCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAoIXhlX2NoaWxkLT5iYXNlLmNoaWxkcmVuIHx8ICF4ZV9jaGlsZC0KPiA+YmFz
ZS5jaGlsZHJlbltmaXJzdF0pKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgaW9zeXNfbWFwICpsZWFmX21hcCA9ICZ4ZV9jaGlsZC0+Ym8tPnZtYXA7Cj4gQEAgLTE2
NzUsMTAgKzE2NzUsMTMgQEAgc3RhdGljIGludCB4ZV9wdF9zdGFnZV91bmJpbmRfZW50cnkoc3Ry
dWN0Cj4geGVfcHR3ICpwYXJlbnQsIHBnb2ZmX3Qgb2Zmc2V0LAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIEVuc3VyZSBp
dCBpcyBhIGRlZmluZWQgcGFnZSAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeGVfdGlsZV9hc3NlcnQoeGVfd2Fsay0+dGlsZSwKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgeGVfY2hpbGQtPmxldmVsID09IDAgfHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHB0
ZSAmIChYRV9QVEVfUFM2NCB8Cj4gWEVfUERFX1BTXzJNIHwgWEVfUERQRV9QU18xRykpKTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBUaGUgY2hlY2sgZm9y
IHhlX3B0J3MgY2hpbGRyZW4gaXMKPiBpbnN1ZmZpY2llbnQgdG8gZGV0ZXJtaW5lIGxlYWYuCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBJZiBub3Qg
bGVhZiwgYnJlYWsgb3V0IGFuZCBjb250aW51ZSBpbgo+IG5leHQgcGFnZSB3YWxrIGxldmVsLgo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfY2hpbGQt
PmxldmVsID4gMCAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICEocHRlICYgKFhFX1BURV9QUzY0IHwgWEVfUERFX1BTXzJNIHwKPiBYRV9Q
RFBFX1BTXzFHKSkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBBbiBlbnRyeSBzaG91bGQgYmUgYWRkZWQgZm9y
IDY0S0IgYnV0Cj4gY29udGlnaW91cyA0SyBoYXZlIFhFX1BURV9QUzY0ICovCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHB0ZSAmIFhFX1BURV9Q
UzY0KQoK
