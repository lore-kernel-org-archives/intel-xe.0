Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558FFC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 13:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB82B10FEDA;
	Mon, 29 Apr 2024 13:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T62F6H4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0DD10FED6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714398394; x=1745934394;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LiiXVPKeflDpOE51Bp4ptH48t4BUP/8tqbH2/vKI9rY=;
 b=T62F6H4uG3I3YGLyWi9Gg3jgGC0Pr1tp3spWZz1wesEgRjYXdWPoLywP
 +4SDMX7lc5TxTIFe3AtkZpMLLcRQbAKP/0kshXpGCFHSMF+tGtc++MgZS
 L9WY60QRX+f8DhZLXDXeJvECq+syYKI2UOZ57LphF/wrdx03Mw09dU/AV
 979f+R3VZvoIDmVZFww/acvKvk/luKDNKniIfR8XHTu5zpn7XIgPiL3zI
 RbYiXdWCeImdJws1ycDTes1TJXf3vYErDbj6dL0FojjDiar7lfzrc5B0k
 PWKoWPT+QzDhLN9wo6rWSR/Knd7icqDHC8nLBuSoYu6JRzGzQ9RwCvm+w g==;
X-CSE-ConnectionGUID: xeFlNgOaQ9CJQVFTCiZ7Lw==
X-CSE-MsgGUID: UhzjRLFrRY6OpiFNj0MgAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9983411"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9983411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:46:33 -0700
X-CSE-ConnectionGUID: fiu2BbXvT4m4My+9HfPC6Q==
X-CSE-MsgGUID: 5/eN5D/VR/asChadBKVuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26225737"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:46:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:46:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:46:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVlDINwq0Kr/GFjWWJzLgV21kevGLe5Rnm0QNHQtQshcAfoDyP36HLKVxEK1Y888qAzIfUS4/wgfTfFu0qEMk4goLwJFwwIdd9y3O7U3CVAqBsCd2qjJJrRFYCx5t6gFX/GW9hU7PAu+3V2o8pKcvFFp2GT5RstlBb4cEUwviYkH4ArpwFtes1ZPf2fmKMptOJzkZjEDmxWEnNek/WCCBCfnbMgBZq/DWYODum8rBO6DROtsfAFBeRQ8V9+YV4yYTc5jRfCHwsk2IqYbqs9IBfJ4UigGViakq2BkFBomoTnzAEmhJI3LqmSWI1UyhpP9J7WP8uXtEOoto+forTA08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiiXVPKeflDpOE51Bp4ptH48t4BUP/8tqbH2/vKI9rY=;
 b=k0nQ1NDD71hS49zIOqX2B+E40jTbLpT44IYTefQnGAxheyMPSLyCAD9vA+41qWdJ4h27DqdqDrBOHtOjM5Yx8seA7MyBm80XMEHrT3fj2aq/letJwGhKxlhiSyJM9yACExXy6Ecs3tRRXT89ohmG+KUaZoK6WtUPZbBBz6G5Fxky5whn3nvKLJDrU5j77LUaJGDWzP8JuHyHKbSYXiGrsTcUFdVMAXuPKXGwVdo4tKS3BLcAFfzipd4KyDk0bUrOrhj7VOnq5hlpOZSoGP2jFHI2WDlitm5cYL3SM5yRGk7NzMDw2G/34ShK+C3fjCZ2CfxM3EwW6cFNXoEZMMPzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:46:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:46:29 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
Thread-Topic: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
Thread-Index: AQHal8qRXy2S4Uv/pU2OPvpPXzaCUrF7CwMAgAPuRACAAE5mAA==
Date: Mon, 29 Apr 2024 13:46:29 +0000
Message-ID: <9839e7e9932330f9877402782ee411ada2e84df0.camel@intel.com>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
 <20240426105655.23738-6-nirmoy.das@intel.com>
 <ac8e78466a4a33e48f718781e47b15a7c5c73a1f.camel@intel.com>
 <f68727e7-03db-44f8-b5eb-7ceed550eddc@linux.intel.com>
In-Reply-To: <f68727e7-03db-44f8-b5eb-7ceed550eddc@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB6941:EE_
x-ms-office365-filtering-correlation-id: ecf37e88-621a-4fe1-ee43-08dc6852c5aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VEZJTXRLR0FnZkpjZmQ1WDd2QlRucVk1dTBrcEpaeE1nR0hNRWNEUHlyb3dx?=
 =?utf-8?B?MXVxSWVqNkdPSVpDRjdmSEE1YmUxRTk0aWFlcXRvNnpSTWdlRUxvVHdNWFN0?=
 =?utf-8?B?T3ptVGpWS0dYUTF3VWJncHBsVGVVTnViMmpKd0d5OEt0ekxQOTZSSitPdHZi?=
 =?utf-8?B?MFplNjBmb1lkN1lQYjdtUzVXL3JVMXRlSGpnZThRNHkzYllOTWpEazA2blNl?=
 =?utf-8?B?Z09yVk0zei9ZdGR0c042RXlWQVJVTitIclVqU2NzNGJhVlBtVGtjN2FtdUJk?=
 =?utf-8?B?QStPbkcvWTJxSXFBYmRuejJlUDMvZVhSRlllOExZSSt0TDc3UndkZE91RzhH?=
 =?utf-8?B?SUMzMFhKUnpvWnhhazhheHFwVGpHWUdkTDNwRitpUy9BUlUzekF2b0R2TkVG?=
 =?utf-8?B?aHUyRmNZUGxXZEl4ckpnd09Ed0xnc09vUEFTYUp3TFY1a2J3dk9PSTYxcUJI?=
 =?utf-8?B?SXFLN2xMM3c0cTEvcnQwT1JLSlM1aUhKcjBJVkd3WldVc2lpL1RTeS92K09X?=
 =?utf-8?B?bnQzVGFUUzc2MlBNeFBUVHlqd292amFTK2xINGJYZkQ0UHBIWERjVVBkR1hx?=
 =?utf-8?B?clVLU2dxTWhldVlDTElGNndoZC9XVTlxajFjTlNZOWFKNDR4MkZKU0pKU1Fh?=
 =?utf-8?B?bW41VDJVcW4wR0l0ajVqT3J0SkN2MFc1bEY5Y1o4N05XU3VHa0t2ZzVUOVJX?=
 =?utf-8?B?dTBER1YxOXJ0b3plSGRsYkdCZ2l5NmJUbDMxeWtoY2dlNXJ4cm41SGFDcEdt?=
 =?utf-8?B?U2hBNEV6NlhTVzcvNHkyZUVQR2pzb05xTlZyYVpKb01HMklhMGVwMzFzV211?=
 =?utf-8?B?elFWL25rYUxGRHdZMU9jaDhLejFXa2QzbklQZnN3N3FTbjFwd3ozMGphSXFy?=
 =?utf-8?B?eGRHQlhxSUJGRlN1YytBUDdpM3FqV04zME13Skxxb0FLeUJ3SUhEV1R2R2JS?=
 =?utf-8?B?ZmY3a1BaN3VnK015V3lMNDBVWDZLSHFjNk91R2JWRzhqeDdrb3FZZ1Q0R2lx?=
 =?utf-8?B?UFJyL2VlZ2ZsK2phZkJ5TDZOQWpzSFFFMnZYektONXJsN2U1bWlPUXhRRVFF?=
 =?utf-8?B?R2MwalpoTkFDQklBR0QraTRCY0swZEZ1Qmlla2srYndJMVdpQkkra2tJblZJ?=
 =?utf-8?B?d2xxMEVLT0N5dUpZWXc3bEN5U0dvd1k5WjFWdlZCQStGcnNTRGwwRWlrbmVQ?=
 =?utf-8?B?TGc2M2ZnaVZlaEw4K2pFNSszdmVpSC9rL0VvRFBZZ0xEdWFaVjdibFEzemhj?=
 =?utf-8?B?UUVFeVRLamZoMFR6emJhb2JKVmFkK3ZHN1lDSGgwcUZmZk5CVEJ4YXhZajMx?=
 =?utf-8?B?THZ5MFpzeDlxdTBpK2hyVjhKZ1FTMGJUQSs4dlhMcWZkdVdTSEpHN3VFTkJh?=
 =?utf-8?B?eEtlaDdoN1Q5TGFndE5SamhDK0RjRktCVW1VaS9VVGlsR0Fickt0RnVGbE8r?=
 =?utf-8?B?V3VqeVRoWmJPT2Z3bEx1V1p1TGNybk1HZWR3blBnZHRVbTBMOGtFbGM4QTRE?=
 =?utf-8?B?elNWZVZidUc0MmNhYXBYQkgwZEtCbVVOYUJhUTlBKzlYMTZGVGl3amhZYkNF?=
 =?utf-8?B?SXhCcWRSS1VvdlFiakFCOCsxZm1uTHM4RHdFSWdJa0dPM21TUm5jWStPQm52?=
 =?utf-8?B?U09uVXVXdlZYUnZzSEllRmlNd0Nqc0NMR2xONUtqb2hlNXNTQkpPS1NoaWxI?=
 =?utf-8?B?S005WUlKVlJpR0t2L0F2VDhFY1h5UEN3UXpYb09kUDdoMkpxY0hwRU9qYzNR?=
 =?utf-8?B?RVJrak4vb0FHbk50Tm9nVElGREdGaU9nOWZqZXdEMm1STUxGTi9aN0UvYmRU?=
 =?utf-8?B?TzNWaW9yd2h4VVhJYURPdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDUwaWQwZ1NDWmNERFpObkJNWmszb0kweXBTK0VSS3BKWVFwSDRHRFZ5TXpp?=
 =?utf-8?B?NlYvY3BFcEdRRjEya1YvM3VQeS9sbjNiU3BxalhhRGZwQkQvSHZEN0YvdkFt?=
 =?utf-8?B?ekxCNC83UzhRVXRvWU1NanhwYU1kMkJHWHNrV2N2MG12TlphYUNONjdBZzRU?=
 =?utf-8?B?N2FJQ2ZhdCtvNzlFaVkzM1pKQjhLbVVLWUNWbEd4RGZiUHJ2Q2hEOVhYa2d5?=
 =?utf-8?B?TGZGM1pQUUtsaEg4NWtVSGNCS3BNeWV3VlRKbi91Y0xlUTJ4V1pEZE9CNmJE?=
 =?utf-8?B?R0YxZnlPdkFnaXNNanFoZ0kwNk5pa1BqcGtwTXhrdDUrU2Fyc0VrekcwckdI?=
 =?utf-8?B?aUFYZTlNR0NNNDk5QkRnREw2Z3pGUUFLUG1zd3hoQkthcHpra214V2RpNWRC?=
 =?utf-8?B?U1B5Y0FPMFpLRFd6c3lmQXhWdjRhdWREK0wraVREYkpmNnFxK3BZeHBjY1N6?=
 =?utf-8?B?MUxJYUljVFJxUi9qNzVWYVlwK3FyU0oySEo5bGZGTnB1ZVh1eDRQYU5oSXBK?=
 =?utf-8?B?ZzZpeVdvZlAydCtTZlZCTFdCOHBSM3pKTTZWZ3IrbFdYQnBjSEZibzhuQmJT?=
 =?utf-8?B?Z0ljdHBhbHlKVWpzWlU5T1JDSHl0YWdRYW9sdVhvRFIyUFJScDdZc0FwVGRn?=
 =?utf-8?B?dHg5cEhxTW55ZnFuaHRpckg2ZnFWSVBmc1N0SUhpTXRJZ3psV09MQXpNbEN6?=
 =?utf-8?B?ellSMkE3VnJRcEJtclpHb3VQMjNmcTZ6N3BQRXZnRHVUR1B1YlJNREpxQndQ?=
 =?utf-8?B?VE1LM0d4YjY2K1U1Q0h0RzlWZFlkUm1HZW5XNXRaQkxqWk1UQ24yc0FFbXVs?=
 =?utf-8?B?UitpdDYyZVRJSDU5TVc4a0M0RzJqUmpNeXE4VWU4V0ZNNDdmMWdvRUpyRzR5?=
 =?utf-8?B?cnJSZDlnTFl2Q0pkU09wdjJYT3BzWmJNSUlFbThBdUwyZWVzL01vNlhsQ0Zw?=
 =?utf-8?B?Yi80T01XL0YrbGd4S3V2ZjUrM3V0dGdDa1pqSnByYWVyL0hMc1VnZUF3b0hT?=
 =?utf-8?B?SFBFY0RzYlBoSkh0Q2pGV2NpT0xtWUtBM0d5cC8wV1B0YUdZVUo1K3BmUHhl?=
 =?utf-8?B?alM5Mi9rbFo2bTNNeW11V3orRExNdklYaGRkRTdZS29OZHhMWDdlNGMrWTI2?=
 =?utf-8?B?aHd2d295anF6MzhmWmdLNTBqWldTVU5MQjhPSmdzaFc4Y0o1aUlNZUF0R25p?=
 =?utf-8?B?eFBEcE1iSmZITldwZDhGejhrSUo5UFVsSTI5aTdXQllQRTAva25YTmZQS3g1?=
 =?utf-8?B?NndHLy9McmltSVlTeG5Ta1ZZa3Z2MG04TjdMMERVNCtMaTJ6N1Bxc21GbFZp?=
 =?utf-8?B?dS84Q3c4R0Q3K2dvM1FlTmorbUp1Y2s3ZlRJek9mOHlwOCtKbDJRcEhzeWZZ?=
 =?utf-8?B?dlhocSt1Nm9DcmhmZHFRTnNoZHdxRm0weWdCeWZ3N296b21wUXNvTStUemVz?=
 =?utf-8?B?TUVxUjJVelZ3T2Urb0VldG84NGtmV2lEZkJ4TTJYcGRCNmNtQjExTnMxNnNF?=
 =?utf-8?B?WGJPQ0FkbDdvQXpVNDc1em52b3JWQ0lKbXhUVFlUL1NNOGhKWFJjZVJzR0g3?=
 =?utf-8?B?VlpjVzZkdmVIR29FWS9GV1ZObEtaVVpsMFNFYVpXV3d4ZEtaZ040UnVvbmpE?=
 =?utf-8?B?Z2NmU0tyV1hpM1J5TG1IWmdtSDVQSHUrR1ZpOHV0cjExWUZXamZiVE5TS2Nk?=
 =?utf-8?B?dnd6RzlaWDBJSWx2R3FRMEJzWnFVWTJhQm1KREd0YjNqMXlEcnNLT1ZISmpF?=
 =?utf-8?B?Mm5ObVhUZ2Npa1hOaWJyOXlSZXVxcUZXU2FTbmQxaXFwQmdKcTdVa2YranRw?=
 =?utf-8?B?eDVQWC9SU092aUFzMXd3RS9wUHZCMzFsZGFXekRuN05tQ3JzM1h1QW5GbUM1?=
 =?utf-8?B?UmlYODZQZGo4RE5CNkk0TVZKaFZSd1hoUTZnRW5hRHBKczMyWjFMZ09mcTho?=
 =?utf-8?B?UENibEZSNlV0eElCYUxnQ291MDQycFgyR2hmRTAvRUlWYnBqbU4zeDNlVTdO?=
 =?utf-8?B?Ny9TUnNPQmxNcDhRczUzdklCYiswRGpCVkxNMXBTRnR1WmVGUTlUS2lCUG1H?=
 =?utf-8?B?MGJTRFdIcXFNUmYwQmlSRzh3anhxVmFpZ3dBVVVqbUxHZVEvc2VDaXY2Qnh1?=
 =?utf-8?B?Vng0VDFQcE9uVWpWWWFOdmtnSkUzUnlaVHQ5Z1pJblZLSUV0R3VPUnAvUjUy?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F684768800117841B6DD541BB195D9CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf37e88-621a-4fe1-ee43-08dc6852c5aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 13:46:29.2468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FselPRK+7EbBz22gWK7lJrHoelN3mpWU5K59Qo1MP6NLAFl6x488k6i4cxbkk8PNo5bklln+u9jfEXjD/twu3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
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

T24gTW9uLCAyMDI0LTA0LTI5IGF0IDExOjA1ICswMjAwLCBOaXJtb3kgRGFzIHdyb3RlOg0KPiBI
aSBKb3NlLA0KPiANCj4gT24gNC8yNi8yMDI0IDExOjA0IFBNLCBTb3V6YSwgSm9zZSB3cm90ZToN
Cj4gPiBPbiBGcmksIDIwMjQtMDQtMjYgYXQgMTI6NTYgKzAyMDAsIE5pcm1veSBEYXMgd3JvdGU6
DQo+ID4gPiBUaGUgZGVmYXVsdCBiZWhhdmlvciBvZiBkZXZpY2UgYXRvbWljcyBkZXBlbmRzIG9u
IHRoZQ0KPiA+ID4gVk0gdHlwZSBhbmQgYnVmZmVyIGFsbG9jYXRpb24gdHlwZXMuIERldmljZSBh
dG9taWNzIGFyZQ0KPiA+ID4gZXhwZWN0ZWQgdG8gZnVuY3Rpb24gd2l0aCBhbGwgdHlwZXMgb2Yg
YWxsb2NhdGlvbnMgZm9yDQo+ID4gPiB0cmFkaXRpb25hbCBhcHBsaWNhdGlvbnMvQVBJcy4gQWRk
aXRpb25hbGx5LCBpbiBjb21wdXRlL1NWTQ0KPiA+ID4gQVBJIHNjZW5hcmlvcyB3aXRoIGZhdWx0
IG1vZGUgb3IgTFIgbW9kZSBWTXMsIGRldmljZSBhdG9taWNzDQo+ID4gPiBtdXN0IHdvcmsgd2l0
aCBzaW5nbGUtcmVnaW9uIGFsbG9jYXRpb25zLiBJbiBhbGwgb3RoZXIgY2FzZXMNCj4gPiA+IGRl
dmljZSBhdG9taWNzIHNob3VsZCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0IGFsc28gb24gcGxhdGZv
cm1zDQo+ID4gPiB3aGVyZSB3ZSBrbm93IGRldmljZSBhdG9taWNzIGRvZXNuJ3Qgb24gd29yayBv
biBwYXJ0aWN1bGFyDQo+ID4gPiBhbGxvY2F0aW9ucyB0eXBlcy4NCj4gPiA+IA0KPiA+ID4gdjI6
IEZpeCBwbGF0Zm9ybSBjaGVja3MgdG8gY29ycmVjdCBhdG9taWNzIGJlaGF2aW91ciBvbiBQVkMu
DQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAaW50
ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIHwg
MjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV92bS5jIHwgIDIgKy0NCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0KPiA+ID4gaW5k
ZXggNWI3OTMwZjQ2Y2YzLi4yMzdlNGE0OTg1YTQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcHQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0
LmMNCj4gPiA+IEBAIC02MTksOSArNjE5LDMwIEBAIHhlX3B0X3N0YWdlX2JpbmQoc3RydWN0IHhl
X3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV92bWEgKnZtYSwNCj4gPiA+ICAgCXN0cnVjdCB4ZV9wdCAq
cHQgPSB4ZV92bWFfdm0odm1hKS0+cHRfcm9vdFt0aWxlLT5pZF07DQo+ID4gPiAgIAlpbnQgcmV0
Ow0KPiA+ID4gICANCj4gPiA+IC0JaWYgKCh2bWEtPmdwdXZhLmZsYWdzICYgWEVfVk1BX0FUT01J
Q19QVEVfQklUKSAmJg0KPiA+ID4gLQkgICAgKGlzX2Rldm1lbSB8fCAhSVNfREdGWCh4ZSkpKQ0K
PiA+ID4gLQkJeGVfd2Fsay5kZWZhdWx0X3B0ZSB8PSBYRV9VU01fUFBHVFRfUFRFX0FFOw0KPiA+
ID4gKwkvKioNCj4gPiA+ICsJICogRGVmYXVsdCBhdG9taWMgZXhwZWN0YXRpb25zIGZvciBkaWZm
ZXJlbnQgYWxsb2NhdGlvbiBzY2VuYXJpb3MgYXJlIGFzIGZvbGxvd3M6DQo+ID4gPiArCSAqDQo+
ID4gPiArCSAqIDEuIFRyYWRpdGlvbmFsIEFQSTogV2hlbiB0aGUgVk0gaXMgbm90IGluIGZhdWx0
IG1vZGUgb3IgTFIgbW9kZToNCj4gPiA+ICsJICogICAgLSBEZXZpY2UgYXRvbWljcyBhcmUgZXhw
ZWN0ZWQgdG8gZnVuY3Rpb24gd2l0aCBhbGwgYWxsb2NhdGlvbnMuDQo+ID4gPiArCSAqDQo+ID4g
PiArCSAqIDIuIENvbXB1dGUvU1ZNIEFQSTogV2hlbiB0aGUgVk0gaXMgZWl0aGVyIGluIGZhdWx0
IG1vZGUgb3IgTFIgbW9kZToNCj4gPiA+ICsJICogICAgLSBEZXZpY2UgYXRvbWljcyBhcmUgdGhl
IGRlZmF1bHQgYmVoYXZpb3Igd2hlbiB0aGUgYm8gaXMgcGxhY2VkIGluIGEgc2luZ2xlIHJlZ2lv
bi4NCj4gPiA+ICsJICogICAgLSBJbiBhbGwgb3RoZXIgY2FzZXMgZGV2aWNlIGF0b21pY3Mgd2ls
bCBiZSBkaXNhYmxlZCB3aXRoIEFFPTAgdW50aWwgYW4gYXBwbGljYXRpb24NCj4gPiA+ICsJICog
ICAgICByZXF1ZXN0IGRpZmZlcmVudGx5IHVzaW5nIGEgaW9jdGwgbGlrZSBtYWR2aXNlLg0KPiA+
ID4gKwkgKi8NCj4gPiA+ICsJaWYgKHZtYS0+Z3B1dmEuZmxhZ3MgJiBYRV9WTUFfQVRPTUlDX1BU
RV9CSVQpIHsNCj4gPiA+ICsJCWlmICh4ZV92bV9pbl9mYXVsdF9tb2RlKHhlX3ZtYV92bSh2bWEp
KSB8fA0KPiA+ID4gKwkJICAgIHhlX3ZtX2luX2xyX21vZGUoeGVfdm1hX3ZtKHZtYSkpKSB7DQo+
ID4gbml0OiB4ZV92bV9pbl9mYXVsdF9tb2RlIHJlcXVpcmVzIHhlX3ZtX2luX2xyX21vZGUsIHNv
IHlvdSBjYW4ganVzdCBjaGVjayBmb3IgdGhlIGxhdGVyLg0KPiANCj4gV2lsbCBkbyB0aGF0LiBJ
IHRoaW5rIHNjcmF0Y2ggcGFnZSBpcyBhbHNvIHBhcnQgb2Ygbm9uLXRyYWRpdGlvbmFsIEFQSSwg
DQo+IEkgd2lsbCBjb25maXJtIHRoYXQgYW5kIGFkZCB0aGF0IGlmIG5lZWRlZC4NCg0KSSB0aGlu
ayBNZXNhIGlzIHRoZSBvbmx5IGRyaXZlciB0aGF0IHVzZXMgc2NyYXRjaCBwYXRjaC4NCg0KPiAN
Cj4gDQo+IFRoYW5rcywNCj4gDQo+IE5pcm1veQ0KPiANCj4gPiANCj4gPiA+ICsJCQlpZiAoYm8g
JiYgeGVfYm9faGFzX3NpbmdsZV9wbGFjZW1lbnQoYm8pKQ0KPiA+ID4gKwkJCQl4ZV93YWxrLmRl
ZmF1bHRfcHRlIHw9IFhFX1VTTV9QUEdUVF9QVEVfQUU7DQo+ID4gPiArCQl9IGVsc2Ugew0KPiA+
ID4gKwkJCXhlX3dhbGsuZGVmYXVsdF9wdGUgfD0gWEVfVVNNX1BQR1RUX1BURV9BRTsNCj4gPiA+
ICsJCX0NCj4gPiA+ICsNCj4gPiA+ICsJCS8qIFVuc2V0IEFFIGlmIHRoZSBwbGF0Zm9ybShQVkMp
IGRvZXNuJ3Qgc3VwcG9ydCBpdCAqLw0KPiA+ID4gKwkJaWYgKCF4ZS0+aW5mby5oYXNfZGV2aWNl
X2F0b21pY3Nfb25fc21lbSAmJiAhaXNfZGV2bWVtKQ0KPiA+ID4gKwkJCXhlX3dhbGsuZGVmYXVs
dF9wdGUgJj0gflhFX1VTTV9QUEdUVF9QVEVfQUU7DQo+ID4gPiArCX0NCj4gPiA+ICAgDQo+ID4g
PiAgIAlpZiAoaXNfZGV2bWVtKSB7DQo+ID4gPiAgIAkJeGVfd2Fsay5kZWZhdWx0X3B0ZSB8PSBY
RV9QUEdUVF9QVEVfRE07DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ID4gaW5kZXggOGZjMzdjNWEw
MTk2Li5mNzk1MDE2YTgwZDUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiA+IEBA
IC04MDUsNyArODA1LDcgQEAgc3RhdGljIHN0cnVjdCB4ZV92bWEgKnhlX3ZtYV9jcmVhdGUoc3Ry
dWN0IHhlX3ZtICp2bSwNCj4gPiA+ICAgCWZvcl9lYWNoX3RpbGUodGlsZSwgdm0tPnhlLCBpZCkN
Cj4gPiA+ICAgCQl2bWEtPnRpbGVfbWFzayB8PSAweDEgPDwgaWQ7DQo+ID4gPiAgIA0KPiA+ID4g
LQlpZiAoR1JBUEhJQ1NfVkVSKHZtLT54ZSkgPj0gMjAgfHwgdm0tPnhlLT5pbmZvLnBsYXRmb3Jt
ID09IFhFX1BWQykNCj4gPiA+ICsJaWYgKHZtLT54ZS0+aW5mby5oYXNfYXRvbWljX2VuYWJsZV9w
dGVfYml0KQ0KPiA+ID4gICAJCXZtYS0+Z3B1dmEuZmxhZ3MgfD0gWEVfVk1BX0FUT01JQ19QVEVf
QklUOw0KPiA+ID4gICANCj4gPiA+ICAgCXZtYS0+cGF0X2luZGV4ID0gcGF0X2luZGV4Ow0KDQo=
