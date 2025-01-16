Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF8AC02187
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 19:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EAF10E22C;
	Thu, 16 Jan 2025 19:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Df537vlc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE5410E22C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737056258; x=1768592258;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=q5/+96fKe0li9JEU6UPYuSWlvh7tDD/wccnRNbeGLOA=;
 b=Df537vlcb5mwV9xajyDjRvv8I8EpO/2ujRmzTL3tb6s+5JU7FDUqXsOi
 hGwi/8gYwjJoxa0KrC7H9ubtc+VC5+MbxNIui8lUzUuxNFjdkmP8osi9x
 kjpDbjhAjN6EwS38DK6jRfYiY7Y62XkLUyPsQueUnKUn1MPSizl9UkoFl
 neY5fA9Kh7Rux9cmHHw4EPj/FChlOzwzPnmoRJXo2GVRZfmdIZ+CgBpYg
 spAVSwvZ0nI8xVwLfpLzxOw+TO8LAC2fBhHj9MUnSWqgocMQRooOacmBy
 VGYIWeWXHzRTUVcFITS53xe/MGSEwQi4QfgQo5OwWvpoaBlESqgQvFeMh A==;
X-CSE-ConnectionGUID: rpJWWW1/Tl+Z6Sg7lK2oqw==
X-CSE-MsgGUID: 6nf0plBgTLGKJ9tqHPUWJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48878445"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48878445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:37:37 -0800
X-CSE-ConnectionGUID: B9923ShtSBKviLif9PZnfA==
X-CSE-MsgGUID: bY8+hKugTmmvB8G9LNQENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="110570163"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 11:37:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 11:37:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 11:37:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 11:37:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7spDDsjjTbzVgCZLC7idzvjRgTi0LkpzhUUZAE5lgAiamI1L5whVcU4Dhq5dJS+uhV0Vo8PI0UwqdK4bmBG/1OK+Cse/16sVvfQ0nyK98bwuuyVpc1U5LYrhmUYW1hzODUuu/6EDn4J1Ql7KdAf8h+a3AkAWTLwXL3p5Mqie9mG8LiUla+FNnO5IwwIIPnu6pEa0bJ2OrNKfUwCFEjl9bZlWP45AcIwNeGnxORT5DV37si8l1FCei/RqrWPCjunxqhSFTcCfzbgjHO3sUxVp2FFfa9fNsGijwfrrWw7S1EtxhB47aKDE+7LfiTx37PyLoUzSJz05E3XAseTPHNFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5/+96fKe0li9JEU6UPYuSWlvh7tDD/wccnRNbeGLOA=;
 b=VcYfNfDP/x4MIieCmojIt2Y8VOHAlr9FFRVjSm4ofZ4UdiQ4oro6glYOJgxWhLIJMD5lrl5A4FhkDIXDY1rkwyyYWgnDRw0Hc4KTGaeId/nQezXc+RnnKp6ZNqK4yXMc80nr3u+5zqz0X4fiLCvKrnaB1ZNqrb7RU3g/GK6CxeKUGCWyqjgDk2zDwaoZyyxzvJ2AvAnsiOthvoOLAPGt4IPKiuJpMLH40CTufwalpUMJx+K8SVvpWA1E6NkcfBaPXpf1XnhML6ZgogIXhQgvlVaHc79MeQcqIINix4h37we2dciQthoq5TKAcaooDeKupbyLhA6KdvrEP2aLAxpjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 19:37:32 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 19:37:32 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Apply Wa_13011645652
Thread-Topic: [PATCH] drm/xe/ptl: Apply Wa_13011645652
Thread-Index: AQHbaEeMIhdxE6jR3EWPkfRocHNSh7MZy5oA
Date: Thu, 16 Jan 2025 19:37:31 +0000
Message-ID: <cb502320b39685342f35adb8f8ff1be70fdc6e79.camel@intel.com>
References: <20250116184659.384874-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250116184659.384874-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB4925:EE_
x-ms-office365-filtering-correlation-id: a854d739-353e-4b25-3fd7-08dd36653847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T2tHRVhKVVVwZlM2MmhpV3BRTGNpbGRKT3B6QnhGOUtHaVZOcWdXbXozT1lv?=
 =?utf-8?B?OUpISFZqaGdHekhZRTZYd2kyNEpBZ2ZKM2Q3d1ZwbFVCZ2Y5OVhXcGNjajgw?=
 =?utf-8?B?MUoxTm5EcW5oTVJkbUtiQTAvcmExakF4eG9XVDc5Zmtmc1ZjLzlMZUNFZ3Fp?=
 =?utf-8?B?R3d3YlZ5Y1dHVWI1WnZtckdUU2tQSzFqSUlJc1RGbkxLV2lqaDl2b1luRSsy?=
 =?utf-8?B?dnJ3Y2RqeERMOTQzTElPZVJITG5iUks5VkxvL3NNam5jc2VMSTFmZUlReHgv?=
 =?utf-8?B?TEF3QUlzbGlUbU1BR25LVWpDNXpEQUFadkFpb1RQd0I4RnFuUDJjTVROY3RG?=
 =?utf-8?B?ekU0YVBXeWVqQk9qbnFFRTNiV3JRa2RrbjhvWk16WWtaZVZ5OXhJOTE5emdk?=
 =?utf-8?B?V2t5T2F5VUx3K241OTNTanJDS1B2czYvUmNBczh5VlZkZVFpV3BTcUVCWnZs?=
 =?utf-8?B?Z0lsZWwxL0pUMThVcGo1RXozRlBKcGFmYTVsMU5xRk5JQmZCMzl1STlndGV3?=
 =?utf-8?B?SGNMMkNyRTk4WVYyZEZRR0xKbGxNNE4wamFjeXptYVRGSzRVMy9JNWNUcDJM?=
 =?utf-8?B?dGlVV3E2SitFVjFicVEzTitxMVpOOUJTbCtlU2phZWZ5cW52TnR2MSt2Sk9k?=
 =?utf-8?B?bHc3U0RlK1RiTXl4MU5kZEQvOU5kSzlIbCs1MklSVEtsUkRCNFMxaWRhc05M?=
 =?utf-8?B?WFZCNkVybzRxZ0l5dHpPMUl6bFEza3g2Q2hiUmR5MHZPQXcvTVlhWVR1K3Y5?=
 =?utf-8?B?aUZxeTh1K0lmOG1PVktSNnpZdnNaRnhtVXowWGRBd0RGcjk2aHJIUitPekpE?=
 =?utf-8?B?VVNOZEVkQkVFaEVZTFNLbTc4c3czMUlFN1U5b0NOMzJsdjdzeTNyT1hOd2Uy?=
 =?utf-8?B?Z2Q3VUlEUSttc3ZBSzRFOC95cng4SnVBSFlLTzNyOUl2RnRUdVI0NUV1VTFp?=
 =?utf-8?B?NmNXWnYxSzFGZ256Y25WMEZQSXRCeTQwZGJaODBJQ1JMK2ZtSDZCNWJTQWpj?=
 =?utf-8?B?RXI4c3V0WEk5bWFZRlJadmx6WGFGRUlzUTEzWjB3YUcyVjF4NFFkUy9QRUZh?=
 =?utf-8?B?bU9BTnRpQmRVV0pMUlNBN3p5RXZ6RGY0ZGJtK0NnWHArTjVFb29rSXFmYlhl?=
 =?utf-8?B?am1XeTZKSnU5RjJQaG5zZ05nM1lqK3ZKS00rMUJkK2NrOTlLTjFJRll1REJE?=
 =?utf-8?B?ZUVHc2J1RzZ0dForeUpjM1VtTlk5VENCY0QzU01tS0d3NW5HYXpJNkNVUWFw?=
 =?utf-8?B?QUx4MUtwdXE4UEsxYXJTRHJ0WENVTEc3N0pVbXlBOHo5TGJYV1pwSzB5cm5s?=
 =?utf-8?B?dGpydmljSWZHSWl5eWFLZFlNejMrckEySWdUNndiSDdiRGZteFpuYm43eDVR?=
 =?utf-8?B?ajlXNXVaWUJtN3o3Ym0vU0lhYWk3aXBsR2FjdXZmbVN4a0NyTUdlVWFMeGpv?=
 =?utf-8?B?dFFuVmJDejAyVWZJZk1oL2c0ZUQxd21BMEdCYzZWSk12MHhyaGhWYmJsdUp3?=
 =?utf-8?B?WTBzZXJ3MWV0WURPQ2JKQVhKc0RHcHloQWE0VzRnamptOW9CeWFUOFhkTEtJ?=
 =?utf-8?B?SlpaMExRMENZZHFlSFJkRUVzcm5MYnZEUTNTQVJ3dklEZVNVNytzMXVoa2x2?=
 =?utf-8?B?VkpnTm9rOGhndW9IdjgrbUIxMmhicGFYb09LWWkzMXZydnhDQ1prUndEYzlw?=
 =?utf-8?B?aTdBc1diV2swZXRoNk53My9ZN0J1b3dZNk9XYnluUUJLUU9rTHZWdUpPZ1dU?=
 =?utf-8?B?d2FuaEdpSGlIdXczb2MwRUMrUXYzTTBoSHJueko0eE5KZ3BDVG1ocjhkZFRJ?=
 =?utf-8?B?dkhsMk8ycTJQQk83WitMcit6dVVFNmRMZlZzYlIzN3BKcFhWNHM5d25ld3Qz?=
 =?utf-8?Q?RKoLuVXQEysQ9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWRQMXFPOHRueUR1aVh3UmtVNHdjVlBMeGI3aHR3R09TeWc0WjlqcXVWZWVM?=
 =?utf-8?B?YjNPOFlGZW16Ylc0YTBvYmRpc0xjU1pRcVlySGxsN0F2eVROeUppbFdKTFNJ?=
 =?utf-8?B?b3lCNlR1Z3RxRXhiN09YQVluWkRSOVlkRW9rSFZnaDFyNElpaFVRSkdlM1FB?=
 =?utf-8?B?VVlJMWRFV1d2TjZIcTZ0cTlVNHVoaEhab2ZsbUF6Nmh6Y3AwNXFQNW9lTlpQ?=
 =?utf-8?B?ZEc0ZSthaFVpeDhFZnRuQ0ZMak9sQisyRCtkS29QYUhOK09LN2x3eWliNzFj?=
 =?utf-8?B?SSt2YkxxNjRkbnRMSW9mcCt5cEZ2Tm9OZzA0V0xaWksxdGZqTEVvK0xHWWdC?=
 =?utf-8?B?bEsxSkdmUmdDeTY3Myt4ZFJOb2g1TitNMGYxcWNVbFl4MzJZOE9PaGxFQlhs?=
 =?utf-8?B?eElQVmJHVnFFN2Q4Uy92QktkRE9Gb21Ec2JLYjZMeC9tbzQ1ZW16TnVob2hv?=
 =?utf-8?B?cmQ4YWFMSUE3aTVVdVUya3BqaWhGNFgzR0RIdGxVOWVRa2F3NllLMUNCWlFn?=
 =?utf-8?B?RmpJektOb29PMWZTNEcxb2d2M1V3SzhOZTB4SmhaYmZJTUNremVGWnZsVmFR?=
 =?utf-8?B?Nmx5TG02MWNGaEpDMGg0Qm8zSDNTdmJsNXpGeHJwWVBzTlNpODBPTHc3QTJX?=
 =?utf-8?B?d0pQUlpzMVROWER2QVZMUGZ1eGRTY1k3a0xPNXhBS05UYldMUmw5UUQyRVZN?=
 =?utf-8?B?QUdoZk1iN21EQXlIdlQ3aWQxMTlNVWtnZzh6WGl0K2JyUXdUMDVOOG9DdkdO?=
 =?utf-8?B?WWhQenV6STZYem1RQkJOU0VDOWJpRkVIRlpUNGpPc0dKeGJrTFVnV2hKZzc2?=
 =?utf-8?B?VE1ZMXh5cFJGMWRnKy9TZFZ3ekFqcE16ZmRncGVZZmVLUWswQXFISmpJTTFj?=
 =?utf-8?B?L2RPc0RmalZ6R1o4T0E2TFVId3JBc1BDYmh6a0E2TlQ2NnU2WmlkNWMwSVdl?=
 =?utf-8?B?NlRiaVNiY05RR3RQckl4ditFdmwwWWtCS0dvWUFCTzl0V0JPL3FWcXRWR0ov?=
 =?utf-8?B?ZkJIRkdDTWVzMmZydDkrTDl3bHhnTVE3T0FhYVVoRVJDczdTL3liSHhRMHBO?=
 =?utf-8?B?TlN2aEZ0bGJxWXE5Q1VQa2pBa01YNEg2K1BXRkhMU0RXc3NTa005MThvWW9S?=
 =?utf-8?B?WmJZcjdOb3F3L2dVQzRDMnpxTG5sM1BJbGsrMjNKN3AzSER3TjRaZVVpNERt?=
 =?utf-8?B?RlFhZ0hvalRtNzFBMDJCOU93NG9JSmFMYWQvVEphSkpjZ0VkdWRvaW43U1cw?=
 =?utf-8?B?TDVYZjZ6eVM2NEpSb3BSK0ZNbklsQXVtWjZXaFhHYnc3SlVNdE1INFdnbjJr?=
 =?utf-8?B?OGc0emYvRzJzZHpMaVh5RzBXaldtdG9SdlprK2w1bU0rWDZzU1loOUxSZTRE?=
 =?utf-8?B?V211Y21WUE9yc2Y3RytrUlhPYTJRRXNsOXBCK0xEL2c0TGlFM3FQZ3h4bXkz?=
 =?utf-8?B?ZHhDTktwZTRRd1pxUVBvcjhxU0dxVDYxc2RXNmxkL0EyeEdySU9lRnNGYVZj?=
 =?utf-8?B?MGFhNUx5NlVsVktMWmJNZFY5RktjYjV4UTl2ZTQvd0hWTEl5TmdUTVhMcVdu?=
 =?utf-8?B?cm1iRVRYMWJLMVUyV01FVkVkSFNJcjBNNDhQaTlyN0hWQmNpUER6VXBBd0xU?=
 =?utf-8?B?d3o3a3JiVlRRZUtXZHAzbW1FVHNzWFJmbXRyaUF1NW4wN2UrMWF5cDY2dksz?=
 =?utf-8?B?NTlkWkZtcmFEL0FBUEVzdSs1L2oxaWZFOHdFRGk5ZEgzYzJHdUprYm1xMi9F?=
 =?utf-8?B?VUlrNjVTSjVZZ1A1Y2NVMk45N2pSNjlDU0RPNjZpcjU5R0dLd01LWnN4Qzc0?=
 =?utf-8?B?Qm05SERmcTVwVXJTN05hbG50NEZPK3gyUC85OGEwMHppY1ZIZUhLZDJNd1VP?=
 =?utf-8?B?VG1qWmhhR2ZLSTdRVlh6UU93by91a05QZ0x2RURxaGgwY1gzTFcvekc5TUhp?=
 =?utf-8?B?S1ZYNVIrbFFOTnRXWEdndUUvS0JMR2c4bmVmbDNiVE5qQjJDaVlJN2VvYllp?=
 =?utf-8?B?UDRrN3FFdWRwMVpUWDlhNFc0NERTR2ZJbmVZUWV1bnFZRVhabDU3ZlI2M2Q1?=
 =?utf-8?B?TG5VeTVYUStuejFndDBOMEdFbFlpZUtTQnRsR0VMRHBxQUhGUkJYaDMvRHYw?=
 =?utf-8?B?WjBKMEhRUW1pWS95cm1sODQ3dEpwQWNadlF2blc3TlpGR2JEd0xVVVBuWHJa?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <610CE0EFA674834192BC6CB948E32C9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a854d739-353e-4b25-3fd7-08dd36653847
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 19:37:31.9942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q08mzBgGlVmXta661bvvqXLA4HbAdYPcez8nm+TCkWCvjxjRu5xUHMSl82bqZ7/strZLRohxjjP239DoKHy8kO0av+D7K8kvRbDObCkeumw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
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

T24gVGh1LCAyMDI1LTAxLTE2IGF0IDEwOjQ2IC0wODAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Og0KPiBFeHRlbmQgV2FfMTMwMTE2NDU2NTIgdG8gUFRMLiBUaGlzIFdBIHJlcXVpcmVzIFBUTCBH
dUMgdmVyc2lvbg0KPiA3MC4zNy4xLiBVcGRhdGUgdG8gR3VDIHZlcnNpb24gaXMgcG9zdGVkIGlu
IHRoaXMgc2VyaWVzLQ0KDQpMb29rcyBsaWtlIHRoYXQgbWlnaHQgYmUgYXZhaWxhYmxlIGZyb20g
NzAuMzcuMD8NCg0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0
MzYzMC8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdh
dW1rYXJAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ff
b29iLnJ1bGVzIHwgMSArDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gaW5kZXggNDA0MzhjM2Q5YjcyLi4y
Mjg0MzY1MzIyODIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2Iu
cnVsZXMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiBAQCAt
MjgsNiArMjgsNyBAQA0KPiDCoDE2MDIyMjg3Njg5wqDCoMKgwqBHUkFQSElDU19WRVJTSU9OKDIw
MDEpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgR1JBUEhJQ1NfVkVSU0lPTigy
MDA0KQ0KPiDCoDEzMDExNjQ1NjUywqDCoMKgwqBHUkFQSElDU19WRVJTSU9OKDIwMDQpDQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHUkFQSElDU19WRVJTSU9OKDMwMDEpDQo+IMKg
MTQwMjIyOTM3NDjCoMKgwqDCoEdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBHUkFQSElDU19WRVJTSU9OKDIwMDQpDQo+IMKgMjIwMTk3OTQ0
MDbCoMKgwqDCoEdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCg0K
