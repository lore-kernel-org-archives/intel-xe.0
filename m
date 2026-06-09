Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C92CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 19:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A0610E5DD;
	Tue,  9 Jun 2026 19:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDa2+ukb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7CA10E5DD
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781033903; x=1812569903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=va3Icjl8gOtwsAUzHkqp9cITkLfsqxj9TUufUlfFY7o=;
 b=FDa2+ukbUhpbmyVcVdjsrvirdCYvY8dzPqqg/8lnoXyekEvjhETHxMss
 SIT0BhULrcapbhyGJJJMUk2th7l1w82j96OLuqoyePckr0QN7812XJ2Kk
 qXQvPMtIEkr0RLjDT8q8VODNzCxDjgoIb/a+qPgAw/Jd/Cu1IQS/1/DRx
 LAxZSgwhdX99ua3+p31VM3v8UCUlqtqxT7Nlr2Ha3W1RG98zUevKeoFOz
 9rNFGJUNlbIctrZ7rdFzNfXZm2FzJU9123fx94MXkwcU4bPv086k1nBAx
 JZGdiCDXwf8wigNiyV6vjwRy0pY+LDpFOVfmbF+qUjTsfsPYZDPKpRlPB Q==;
X-CSE-ConnectionGUID: Kmj7vhm1SNqCM5qkPDFJ3A==
X-CSE-MsgGUID: 54I9PvjxQ6a0bYD2xZZCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92486619"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="92486619"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 12:38:23 -0700
X-CSE-ConnectionGUID: G+Q2hRSIQxOTpUNhhSz1+w==
X-CSE-MsgGUID: fYcBZvqnQ3KA8A0frRET8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244813105"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 12:38:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 12:38:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 12:38:21 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 12:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHs/E4gKLbZk3uEybtaT2/zwXn/popd4Y12CyMeWQ25Wb3076ae9uak40DRp/2ZucrCEvJ+uCndkljAA+txv0xdj6iJ1iuij1x8iahBNSYV7behdedkWsg8JCf7p9PVVpeHcd7ehixByRqLpvGAZA66EeH4FwVgnTr4yUx1301ms06hLngb+T4xRzpO8HSe2XL2t4eT1xVkLNstCQ009kwIK0L86KjpwpxHa/ttqG5MQWbHvws5kypcGU8reuadRD2JdQdjpGP7TRrWpy/pJSahwZX1PzNnz+cVsmqv2WHxAUWHdeOO/QNtboH4OMppdZJ0zVKKgzymNn3vvUHADDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va3Icjl8gOtwsAUzHkqp9cITkLfsqxj9TUufUlfFY7o=;
 b=J4FY8lD98JzC8qo1v4fTRq5AowyplcPgwukFU3SUl0Bb71c2BOoJjXRfNZItc2zqfyO+naU/sdJ1VNmpA7z9mUyRV8NKQqF21AFdkfMR5gYKzHqpl+THTdNwYIbLmQx32bRQ6WDczUwIfkaOYdb1qAywaLw7qB4fgg5V5wcAqs0cxuC75kHUs2tTOM8WffRicBmHtoLTjBM+sLWpuTvQKcLI5zSLN3KH8Zd+k2t8VhUYZ3/QzOQ1/1d7bMZ4fIDokRVpancmx0RPu1iM+jV0/shiFV0z4w2P+lb4gYE02tEXeKDgSIL8eeyXOD6waUtirlv3f2mi7qlAo5xMtvvFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 19:38:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 19:38:19 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
Subject: Re: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
Thread-Topic: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
Thread-Index: AQHc9UIJDEi3+VGgN0OrNIKVwaZhrLYxYeMAgAVCooA=
Date: Tue, 9 Jun 2026 19:38:19 +0000
Message-ID: <1ca4cf6934e72cca5bad61bc413c74a2ac9784ef.camel@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-21-stuart.summers@intel.com>
 <d0861102-2bd2-4010-90c3-fee01fe0f142@intel.com>
In-Reply-To: <d0861102-2bd2-4010-90c3-fee01fe0f142@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB7255:EE_
x-ms-office365-filtering-correlation-id: ffdfd7e7-f5ce-42dd-a064-08dec65ea8a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: JuIdIMZrK91vto10PHTXoy4QQFvAhRaDyJvb9UfocHOho5iSsj8MUwvr0mV6RCgJRbSGyuuP44wfYd9Krv1nkNwPRfVQoZ+DFtDffFPUTvjXh+pVmz1dOim41a6vogwrapJGdYhb6TodqUsu5UiL4xi2fbAIuLTVskX9O1W5F5AR/ZOhtnP/B71zHjH4wtyANjuB5AVydo8jPmoXi0MfB2LSCpVwJaSXfIOIhtbqg6xA8Wd8ypV8aB3ymGRAJ5PJOhVBBUpefKDSAuj1zLdiZY9iGBLORutVyzXRX5mUm0o/2Vio0ThmEnBe4TBnontiWmbpB1SZhDuUWmfU1YeyDztvKjNQXqdjXYXTgmCbX7nZmZS0o3GPueMFMeIAgroWbfWkRRPyOg46jlnFAAlPWP4y/0lXCXm02sJVrc+FF/5l1ojrEmAs2+qktP+oaodd2/0/jKUlPvhzxf7UD2vvnfggrRImmrMA+kCZllUERNjMOGeZCzjiqJ5ylCtX/S6ps9H6o8SDJNsuNjmGfFt1t/w0BHcmpbhSUFddMYGDuzWp9UsPJmbs7AOpNREJj3hxw3ef240dJgKUArXro7nPk7Ul3+JVg38Vc0d8Cqfm5Hf0oC7cBcTJdb5Lxlf6KyCAcTFhjFOQLXvA6KwJ3+7iMLZxRlMUWMeqVYcAZ14+hMXbl2ahyHuZ2NRY8kCzFmJfOuZYf1Hn2lIbFppg5Jq/t3hkhgHrz5G0rsRJqj7lAEbhAcNvTaj+Gn8LQFbx5CNe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmQ5YjJKVzNmZjV2MTJDOWkxbVY2SEpWRUp6V0JyUDBhT3lwOE5PR0tyWjZP?=
 =?utf-8?B?aUF6VWJ6UjVVbEswVFVJT3ZmSDJvQ1YxSXJ2ankwNVZuS3BVNGt5NkZudTEv?=
 =?utf-8?B?UU1FdlhsbzJyWHhSRStpTkpuckxoVkdPU3UvbHVzcnIzbi9yd3hJVlZjSVFx?=
 =?utf-8?B?eXVqdVVCOTNndjRoTnBWVWU3Q3VHUnpxT09iTTJnWGhzZlMrOU56UUtSNDNS?=
 =?utf-8?B?M1EzOThwdm9TVWZINEYyakZMTmVlN0R2WmtuV3g3cTVqL0p5Q2xYbHV0QVRN?=
 =?utf-8?B?TFNyWnhIRmp3NFUxazRDYlB0SUFYQkVuS29XZWoxdmI4eVc1bWhEd0kzTjRY?=
 =?utf-8?B?MU5kNWJUSDNBdGRrNlM3V2J0UVM2Q3BGVFNxY2hpNVkxVUFNYk1Hakh2WStn?=
 =?utf-8?B?WDVlT0dPaXp5WlA0c1JGQ0I4K1BqcENPaklYeWdkL3U5ZWZlcE81YldyWUZ1?=
 =?utf-8?B?dS9odktrYjNRcVc0dmVBM0hWcXIvcVJVNmtVN2MrNDFIYzNHaEVrS1RCczF3?=
 =?utf-8?B?aktZZThkRHU4QWVVcFNtTjFDeTVkWUtnb3NtQ3VQRkhZdXRTK0REd0pVOUFU?=
 =?utf-8?B?R2pTZmdHc05YT1JpWSsxZy9pSThYUGZpNnllajN4UWp3UHhxeGNBRG90d3Fr?=
 =?utf-8?B?eWJVTy9BVkVobmhYWWFaU2x3SW1qd3J1RjYrejRtRVRJdUkvMFgzWWtsdTl2?=
 =?utf-8?B?N01LSTRhbHhTNU1vMW1VZTFXSzgwclNJVkx6c1ZQMXVNWTVNVU8vU0daTHg3?=
 =?utf-8?B?ejdvRVFMVlhkWG1zRWVDbFRSQkhZYkwvTXRPNlNsQW9HUlI0aVhRelhNOG5y?=
 =?utf-8?B?TFYyMzFJY3h5ZjRtZUtBVExkYU9LcldvdVhHSWNXb2lRT0ZzSEhneEtJZ3k0?=
 =?utf-8?B?K0ZqV1dwZ1JSYjE4VWh2VFpOQ3EydmlBcTlsQnVJZkJ4Vk16VCtUOU1hU24z?=
 =?utf-8?B?UXpVb1Rnb3FtNlhMdU5hZk54eDJma1NrRXpFVHQrOStiRk5TcW52RWhtTlY2?=
 =?utf-8?B?UUcySkV0cjkxc3BaZURBUWtTNHRYNVIwTWsxMkJiV2FsaGlFSE5seUVtdEsr?=
 =?utf-8?B?Zi9rMm5FWjVOc0VKZzloTW9reEdTYlhCd2NOUGJJOG4xemZpdzFOVC9HcHNB?=
 =?utf-8?B?ZWpKTGQ3VUFMaG5aTG05UExmNEFVOHpiRjlxQ0V2TjhGdnN1ZUVpa3Z1NHBo?=
 =?utf-8?B?OG5WMExTVGRqNXhjQkJmcTRQU2RPNXB6cGU5SjZpYUpVT0phZzQrS1pCS1Bi?=
 =?utf-8?B?WGxld3lRbzV6UDdTKzB4OVlTa3NFeWEzUzh3d21rRjlIVk9iNm8yUUFpM0xR?=
 =?utf-8?B?dFFMZUg2RWUrQ1EybGhYcmlZbUhkL0tucVBGaHc3SjZCV0JqZnIzN3ZkSE05?=
 =?utf-8?B?eWN5Wk9RQldEZmJ5ZTRiRFM2bHJ6RDNubTRYUTBIaDVpc2RKM0EvdXNVQUcv?=
 =?utf-8?B?c244YUpPa1JDVk5ObXVENHZ5dndIZ0QzVVJKQld0WllDUTEvRUJTR2JWcVVk?=
 =?utf-8?B?SG1QOXJMMGZTcG1tamxPbjlwazFuSkl0a3I4L1NRZGFuajJ1czdMS25KS3Nr?=
 =?utf-8?B?anFtTGlUNkFoUDFBTmZIcTFqc2hSOWRJU3c1YlR3eTRydTZWcVF2N0NpUVZ6?=
 =?utf-8?B?aUhVeFI5U0U0L28xcXJzc05JODdZV0VBNzR3LzNBK3FReFo4Ty9PckJDWEpZ?=
 =?utf-8?B?QmhwODJTSjZqUll1OXZjeGI2c3piWmRzYS9KNHYrbW9sNU0xb1JwalBFRU1S?=
 =?utf-8?B?Q29qY3hUSjVpd2ZiSFFSamZjOEVaREh2UkFhQlJCNmtxMkRxRkgrNTFmNmh5?=
 =?utf-8?B?bUxXbWZoUVNLdnVtbEhRa3Z6WHlhSnk1VUoxV0tBN0RiSFQ3OFZSYUEvWlJF?=
 =?utf-8?B?M1NHNjQ1b0JwejBDbjBobVZjOHhWdjZvY0VTSHJxUVdiV0dUbDZEenN3S2h5?=
 =?utf-8?B?N3JzS0hZUVRYQS9MY3Q2TUlXaE5TMS9zcHhieWU0cVNibEtMbUFjUTRORUNM?=
 =?utf-8?B?NG9LcjE3UlNOMk4rbTR4MStsR043OWt1c2xvWHB3T21hd2ZTYnQvdkdiTWRp?=
 =?utf-8?B?L0RsYzdXck1QengrejRhaGVab0JaUlFoSUNHQzVEd0hRa1R6R2MyZlNzdjFs?=
 =?utf-8?B?NVVSVVhjTlZjMzFldWNhYWVPVjZZUU1OQ3ZVQUFZbEtEOXF0eWNJZTV6RWxO?=
 =?utf-8?B?V0ExNEd5MWV3Qm9JTHVHTXJnOFl1dnVKQURxTUcyeWxCY0swV3pRVUV0Y3pm?=
 =?utf-8?B?VWJSTVVKQXMxZTNXZnFicy9RbG84cGJHMHhIZFR4cUlQL2JOZ3UxN0FEM095?=
 =?utf-8?B?OGY1KzMyTjU3ZytRdE1URnpHRDZiUExpRUd2a2tZWDJ0UThsZjI4VERPRzVB?=
 =?utf-8?Q?Iko/+Qnzfljy1G50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <130BC7E86D94E94CA6A6A81E78554477@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N8std/IxscCkuhnDSb2OF53DSRpDmTWLbDSojKxIjtj51Z0nxOqERvNvrk3ztVMvNf5gTT/K2L2vSajt6yqy6jVg4Y6iANWXbjv1ex58YUV+sow4qo4Wo+IWav6kWNq9FgqRVTWGLJ5mItDpJs5zSk/7mOP4NIOrloZQLxwVSdd0F/dMG7VEhfCFlCXyLfP8LszYnZuPnv5bFxaXB1mVH0VaW4j+woxstKQql0J5e+MVHXM0QavkHVug7W+Ol6V0AhujUyT+eixKcjcJjCMg3scF3d0arQIctguyBVm+wzzhFU6z5eodGauEf4P+DWeR6hRKq5fd367z/DhIf4gYtA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdfd7e7-f5ce-42dd-a064-08dec65ea8a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 19:38:19.1777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+RW2SNt9hv2Y1UDsUeFjA93kacmhfJd2o92r8pFQLV5icsBC6IM5E3kQb51T2sDVKzsDWjPrGqpDMMHyMgDLYkNei8y/ngeqLbu7EwbyJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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

T24gU2F0LCAyMDI2LTA2LTA2IGF0IDEzOjE4ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Ogo+ID4gCj4gPiAKPiA+IE9uIDYvNi8yMDI2IDE6MjEgQU0sIFN0dWFydCBTdW1tZXJzIHdyb3Rl
Ogo+ID4gPiA+IEZvciBlbmdpbmUtc3BlY2lmaWMsIG1lbW9yeS1iYXNlZCBpbnRlcnJ1cHRzLCBo
YXJkd2FyZSB3aWxsIG5vdAo+ID4gPiA+ID4gPiBmaWxsIGluCj4gPiA+ID4gdGhlIHNvdXJjZSBh
bmQgc3RhdHVzIG9mZnNldHMsIGFzc3VtaW5nIHRoYXQgc29mdHdhcmUgd2lsbAo+ID4gPiA+IHV0
aWxpemUgPiA+IHRoZQo+ID4gPiA+IHZlY3RvciBJRCB0byBkZXRlcm1pbmUgdGhlIGRlc3RpbmF0
aW9uIGZvciBhIHBhcnRpY3VsYXIKPiA+ID4gPiBpbnRlcnJ1cHQuCj4gPiA+ID4gCj4gPiA+ID4g
R3VDIGFuZCBWRiBiYXNlZCBpbnRlcnJ1cHRzIGFyZSBzdGlsbCBoYW5kbGVkIHRoZSBzYW1lIC0K
PiA+ID4gPiBleHBsaWNpdGx5Cj4gPiA+ID4gY2hlY2tpbmcgdGhlc2Ugb2Zmc2V0cy4KPiA+ID4g
PiAKPiA+ID4gPiBCc3BlYzogNjIzMTYKPiA+ID4gPiAKPiA+IAo+ID4gbm8gZW1wdHkgbGluZXMg
aGVyZQoKSXMgdGhhdCBhIHJ1bGU/IEkgdGhvdWdodCB3ZSB3YW50ZWQgdGhlIGJsYW5rIGxpbmUg
YmV0d2VlbiB0aGUgY29tbWl0CmJvZHkgYW5kIHRoZSBzaWduYXR1cmVzPwoKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+ID4g
PiA+IEFzc2lzdGVkLWJ5OiBDb3BpbG90OmNsYXVkZS1zb25uZXQtNC42Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmMgfCAyNiArKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MTggZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9tZW1pcnEuYyA+ID4KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
ZW1pcnEuYwo+ID4gPiA+IGluZGV4IDlkZmU5NjVjYjQ2ZS4uMjA4ZjQ0NDM2YzY2IDEwMDY0NAo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuYwo+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuYwo+ID4gPiA+IEBAIC00NDcsMTggKzQ0Nywx
OCBAQCBzdGF0aWMgdm9pZCBtZW1pcnFfYXNzdW1lX3JlY2VpdmVkKHN0cnVjdAo+ID4gPiA+ID4g
PiB4ZV9tZW1pcnEgKm1lbWlycSwgY29uc3QgY2hhciAqc291cmNlLAo+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqBtZW1pcnFfZGVidWcobWVtaXJxLCAiQVNTVU1FICVzICVzKCV1KVxuIiwgc291cmNl
LAo+ID4gPiA+IHN0YXR1cywgPiA+IG9mZnNldCk7Cj4gPiA+ID4gwqB9Cj4gPiA+ID4gwqAKPiA+
ID4gPiAtc3RhdGljIHZvaWQgbWVtaXJxX2Rpc3BhdGNoX2VuZ2luZShzdHJ1Y3QgeGVfbWVtaXJx
ICptZW1pcnEsID4KPiA+ID4gPiA+IHN0cnVjdCBpb3N5c19tYXAgKnN0YXR1cywKPiA+ID4gPiAr
c3RhdGljIHZvaWQgbWVtaXJxX2Rpc3BhdGNoX2VuZ2luZShzdHJ1Y3QgeGVfbWVtaXJxICptZW1p
cnEsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQo+ID4gPiA+
IMKgewo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoG1lbWlycV9kZWJ1ZyhtZW1pcnEsICJTVEFUVVMg
JXMgJSpwaFxuIiwgaHdlLT5uYW1lLCAxNiwKPiA+ID4gPiA+ID4gc3RhdHVzLT52YWRkcik7Cj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgbWVtaXJxX2RlYnVnKG1lbWlycSwgImRpc3BhdGNoaW5nIGVu
Z2luZSAlc1xuIiwgaHdlLQo+ID4gPiA+ID5uYW1lKTsKPiA+ID4gPiDCoAo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqAvKgo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCAqIFRoZSBwcm9ncmFtbWluZyBu
b3RlIHNheXMgdG8gYXNzdW1lIHRoYXQgPiA+Cj4gPiA+ID4gR1RfTUlfVVNFUl9JTlRFUlJVUFQg
aXMgYWx3YXlzCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgICogc2V0LiBDaGVjayBhbmQgY2xlYXIg
cmVsYXRlZCBzdGF0dXMgYnl0ZSBqdXN0IGZvciBhCj4gPiA+ID4gPiA+IGRlYnVnLgo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoCAqIE9uIE1TSS1YIHBsYXRmb3JtcyBoYXJkd2FyZSBkb2VzIG5vdCBm
aWxsIGluIHRoZQo+ID4gPiA+IHNvdXJjZSA+ID4gYW5kIHN0YXR1cwo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoCAqIGZpZWxkcyBmb3IgZW5naW5lLWJhc2VkIGludGVycnVwdHMgKG9ubHkgR3VDIGFu
ZCBWRgo+ID4gPiA+ID4gPiBpbnRlcnJ1cHRzIGhhdmUKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAg
KiBhIHZhbGlkIHNvdXJjZS9zdGF0dXMpLiBUaGUgZG1hLWZlbmNlIGNoZWNrIGZvciB0aGUKPiA+
ID4gPiA+ID4gZmVuY2UgY29tcGxldGlvbgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGlzIG9w
cG9ydHVuaXN0aWMsIHVuY29uZGl0aW9uYWxseSBwYXNzCj4gPiA+ID4gTUlfVVNFUl9JTlRFUlJV
UFQgPiA+IHRvIGlzc3VlCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogdGhhdCBjaGVjay4KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKElTX0VO
QUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVR19NRU1JUlEpICYmCj4gPiA+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgICFtZW1pcnFfcmVjZWl2ZWQobWVtaXJxLCBzdGF0dXMsID4gPgo+ID4gPiA+IGls
b2cyKEdUX01JX1VTRVJfSU5URVJSVVBUKSwgaHdlLT5uYW1lKSkKPiA+ID4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtaXJxX2Fzc3VtZV9yZWNlaXZlZChtZW1pcnEsIGh3ZS0+
bmFtZSwgPiA+Cj4gPiA+ID4gaWxvZzIoR1RfTUlfVVNFUl9JTlRFUlJVUFQpLCAiVVNFUiIpOwo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9od19lbmdpbmVfaGFuZGxlX2lycShod2UsIEdUX01J
X1VTRVJfSU5URVJSVVBUKTsKPiA+ID4gPiDCoH0KPiA+ID4gPiDCoAo+ID4gPiA+IEBAIC00OTks
MTcgKzQ5OSw3IEBAIHN0YXRpYyB2b2lkIG1lbWlycV9kaXNwYXRjaF9ndWMoc3RydWN0ID4gPgo+
ID4gPiA+IHhlX21lbWlycSAqbWVtaXJxLCBzdHJ1Y3QgaW9zeXNfbWFwICpzdGF0Cj4gPiA+ID4g
wqAgKi8KPiA+ID4gPiDCoHZvaWQgeGVfbWVtaXJxX2h3ZV9oYW5kbGVyKHN0cnVjdCB4ZV9tZW1p
cnEgKm1lbWlycSwgc3RydWN0ID4KPiA+ID4gPiA+IHhlX2h3X2VuZ2luZSAqaHdlKQo+ID4gPiA+
IMKgewo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBpb3N5c19tYXAgc291cmNlID0KPiA+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSU9TWVNfTUFQX0lOSVRfT0ZGU0VU
KCZtZW1pcnEtPmJvLT52bWFwLAo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPiA+Cj4gPiA+ID4g
WEVfTUVNSVJRX1NPVVJDRV9PRkZTRVQoaHdlLT5pcnFfcGFnZSkpOwo+ID4gPiA+IC0KPiA+ID4g
PiAtwqDCoMKgwqDCoMKgwqBpZiAobWVtaXJxX3JlY2VpdmVkKG1lbWlycSwgJnNvdXJjZSwgaHdl
LT5pcnFfb2Zmc2V0LCA+Cj4gPiA+ID4gPiAiU1JDIikpIHsKPiA+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGlvc3lzX21hcCBzdGF0dXMgPQo+ID4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSU9TWVNfTUFQX0lOSVRf
T0ZGU0VUKCZtZW1pcnEtPmJvLQo+ID4gPiA+ID52bWFwLAo+ID4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgID4gPgo+ID4gPiA+IFhFX01FTUlSUV9WRUNUT1JfT0ZGU0VUKGh3
ZS0+aXJxX3BhZ2UsCj4gPiA+ID4gLQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDC
oD4gPiDCoMKgIGh3ZS0+aXJxX29mZnNldCkpOwo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtZW1pcnFfZGlzcGF0Y2hfZW5naW5lKG1lbWlycSwgJnN0YXR1cywgaHdlKTsK
PiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB9Cj4gPiAKPiA+IG1heWJlIHB1dCB0aGUgYWJvdmUgbmV3
IGNvbW1lbnQgaGVyZSAob3IgdXBkYXRlIHRoZSBrZXJuZWwtZG9jKSBhbmQKPiA+ID4gY2FsbCB4
ZV9od19lbmdpbmVfaGFuZGxlX2lycSgpIGRpcmVjdGx5Pwo+ID4gdGhlbiB0aGUgIU1TSS1YIHx8
IFZGIGNhc2Ugd2lsbCBzdGlsbCBoYXZlIGEgc3RhdHVzIGRlYnVnIGR1bXAKPiA+IG9wdGlvbiA+
IGF2YWlsYWJsZQoKWWVhaCBJIGNhbiBkcm9wIHRoZSBtZW1pcnFfZGlzcGF0Y2hfZW5naW5lKCkg
YW5kIGp1c3QgY2FsbCB0aGUgb3RoZXIKZGlyZWN0bHkuIFlvdSdyZSByaWdodCBpdCdzIGp1c3Qg
ZXh0cmEgY29kZSBhdCB0aGlzIHBvaW50LgoKVGhhbmtzLApTdHVhcnQKCj4gPiAKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqBtZW1pcnFfZGlzcGF0Y2hfZW5naW5lKG1lbWlycSwgaHdlKTsKPiA+ID4g
PiDCoH0KPiA+ID4gPiDCoAo+ID4gPiA+IMKgLyoqCj4gPiAKCg==
