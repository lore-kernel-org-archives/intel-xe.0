Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A3FED3F1
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 17:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F110F64F;
	Fri, 24 Apr 2026 17:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSKtrbF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F07F10F64F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777051075; x=1808587075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qmfikl98kc4iBTgY0HQ57qRXjK+5Rhz82IZco1vwo+s=;
 b=cSKtrbF7CRhlZ9FzgTtKhFVHmExQlnhy0fcHWs8XvHhksdbURq9GzPDk
 IXtSxp5Gjn0s2jQ/rsd/vICOEcVEwtoDhnGezeafR2E6m7/KrtORvDWjM
 mgrL7QePa4s3spYZJpd81yKpGc6OGuqzJdvjIKekWS66QEYii9G5hhrEW
 JyFBLe5+yZGnJKySlcmrVJ2aH46qn63QZtl8WmICQkgfQgA2+ZVXlgIpW
 FdyT6zMv1e3JeJpqiMexipBAfps6xEM+zDGAXa5lwaOZhcu2cKOe5Dj63
 kmlgYvOcadK7m7OthbolRP+kPLfLPZKLzt1i8hODJ3Qg1bobtJrFFQhbQ g==;
X-CSE-ConnectionGUID: j8isLcm1RIi46BGa9seeMQ==
X-CSE-MsgGUID: WYBulq/RTueq9VNiAck4pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="88344150"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="88344150"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 10:17:55 -0700
X-CSE-ConnectionGUID: 3+bNkwArSj+WUb70bVQ8Fw==
X-CSE-MsgGUID: lOP3+5MXTRO/nujkChlwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="233300549"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 10:17:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 10:17:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 10:17:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 10:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIA/RT0KCW6qynUyXSGRrH6vJZeBLvcTn6A/NjNPrFZ0KnK4pEm+NNV/+dhna4TnB7ow989FS+gGpCYmwbRkFohfRyBban+LLhLatEQIrf0trejGLi8ARKL4nqm1ENoq4g0v2M76mVl6AmsS1ps+1DBbNoBCT0d1KiRAlwyVtUMbXJznPziLiyE+gNNtKTbEc+SAfmhsATqLI9y72uE9DskaZQsexJIigKog5ZBcsBO07NBF2KftXyibpw9C2dNvCKFqSmS5p9jU7EeesBGW3vdLio+efzwXilHoTJcSDddj0Yvl57rDoc5d+lEAyCAQoEPkv+ED0s64dj9lJEQfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qmfikl98kc4iBTgY0HQ57qRXjK+5Rhz82IZco1vwo+s=;
 b=iTgyI5OFp4KIe63BRku68jsawYQWEe+CNn5xPaTPA8wvUbDrD17wulk2TaeieS7DpVjsepMT/KKQtQStCkLSWWBq439QRnMLehh1HN1INQnYDMPTRW94NBrCFT8VwOOk+R+Uu9pAvjHfMykPgW3jfGPLcMIV1BdSSyl8i5JDZI/n5BrshwQ3r+t9WW1bnd+yICw9567Xl9GREKFi++gBxvP1wpwAjU1LYb5QIRrGslvaXRhVOaKioXA1o+geidOMXB0OS/yVYrhH0t2HgCGpoBPJp3FqjqNp6h3S6agRKmoBeYkxN3QGHn57AcAvBw/GRFacjouU9NcaC6y5WqaIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 17:17:46 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 17:17:45 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 02/10] drm/xe/rtp: Add "always true" match function
Thread-Topic: [PATCH 02/10] drm/xe/rtp: Add "always true" match function
Thread-Index: AQHc03N0UCP422ser02WUL3oLir1JLXudIvQ
Date: Fri, 24 Apr 2026 17:17:45 +0000
Message-ID: <DM4PR11MB5456E7E2AC2A74FB363BF836EA2B2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-2-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-2-baa94014e3e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA1PR11MB6490:EE_
x-ms-office365-filtering-correlation-id: bff550f3-b804-4792-2669-08dea2256707
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: loOwi6tBIxHwmGS9fkT+/NEYUmLGjxm7y11V/op/Ho50E+Tk3KgWTCJWG+YMzi0O6CCOl8kd1UYr8Ugp7fv+DxKZpDkL/40pbEYzmP10bfvmZ+SXHXHFgt/6VMWKDjInzFUbvNzir4bY0jg7dOYa3y2/zXcxqqzn11gPEYEDkLZ5PTmVZMEpxpLYdPQWZB6c5ngyw9Gkz1mBw+9NRWynfE/C+teGzCzP48uf0dcV+/wMhVMJyHYdaz9pdwYaU+QgOCPXgRMS879+Oa7ARvQjyckBaiWIU+Dp4ZMRIH+nxtGvXy7E2okGGBn2m5GZ8uRm7VJSbofhYnfev0Zwvlu/vvDJD8R4fERooGJOOMlvQtgX6IJdtkf3yOLIVK5mvzXrXvy4bBW+iNPtNzP5Pgvc8IurcGmGZgwn6dhy7IHThTpcm4+fQZ7mA8lDjLbFgDraIZipjw0G2kRrLlx2lK4EW2Om4ksWqNE+W0o9+NwPDYtWUD7iddztkSkE8rlyn5Js5N9c5zPL6hoJrwzmhPU8PngC88gESbvaxFUMRAnoMUL5wP+WdlbFbUU6jlsDT6GI94AV86rqjCecv80NKhDIeHTyBqWroBQY6m/VrFu3uho7O+IAfnbjYQiz1JGPWDmYfZI1hgvJTpilvG5yoN486zhj5d8STDOTefgh4D1Da9580FguuO9JysWCA1xqr7kD9v5nw1qieRCBk9+wOPuEhK+s5QvYeixL8KC++P+XHQcWopY1iOQJ5c654AF0975vhSfyPZhvhI05CQSqManfwVbx13mTjF3WCt3BNxRB1pU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnpucC9LemZJdm5VYUhuYVZpRy9vN0ZZVlIyOGQ1UU96RjJrVG5MZk5oN1p4?=
 =?utf-8?B?ZGxzQkF5emRlazRFeEhHT2t1Nmc5dnNRRnlkakxBSExwL2F0eG1kWkVLY2c3?=
 =?utf-8?B?MlZkcFpJL2ltMkUwbUh2K1RpWkNZWmlUSXlmbjFSV0tKMVBFUmRpeUxWUHcw?=
 =?utf-8?B?dXE2aG9tOEpjZ0ZqaFNGVjdFb3RZRHAvUGNFRUM0alpCdmJDVXFzb0hELzVM?=
 =?utf-8?B?c2Y4UEpodnB4TUlhU2RXanVGQmVBMmROQ29rR3JiVFkvQk9kUWhzTUdEZ1dK?=
 =?utf-8?B?ZWsyTlBjbURLR3dYWUM1cDRkNFBtWUxEejhab3pNMCtQalpIbWQwU3NtMnVl?=
 =?utf-8?B?VkNOck81Y2FNSGlPNyszU3pTbUV1Zmo5UEpNVUNWZkNiZ2V2R3hjcC9Lbzhq?=
 =?utf-8?B?RU9yUHJDcmpuSjlpNnE3UjJ0TWlOVnprWXkrcWZBNXJuZm8xcnh3RmlkNytT?=
 =?utf-8?B?cm11a0Uxc0QrS3l6bTNNVjJxV2xSQUlNY2x4TkE0UnlIckNmS0szL2plNnNa?=
 =?utf-8?B?OHdteUVhamx0V0trWjNkWTZYankzRUVHTGluSDVBZ0gxVVlyaGlkRmpsc1Rr?=
 =?utf-8?B?SExyNUdEMXNqWkcrZWt6Q04rYjh5M20vZ0FxbEFKTGkwWkFEL1lteEluU2FN?=
 =?utf-8?B?SGNyOGFnZWR3RUlxV3B6cWZSY1JPdmtKSnRtNGg1ajV2TWZoU0wzK3pwVk9W?=
 =?utf-8?B?TW9ESW0raURnVzVLWko3bmgwWm9WeUdrVzJYMlNua3cyQTZCWDBLMVZReGhL?=
 =?utf-8?B?SjhUOGZ5TS8rSXBsMVRwVmwycTBxbDNwQlpqbjZPcVFmcUlySWRvK3o3MmJn?=
 =?utf-8?B?MXhKZmtRZXYwcTVVMGVISnlGN3RIYUQzR3AxQmgyTGxlUlRPbXg4VldwSGpF?=
 =?utf-8?B?RENOcFA5VEFMTFZPZWVRbTV6eDIxSE5uUG9OMUxtSHFSaG4zTXYvSENGUHdJ?=
 =?utf-8?B?ZTFpN1VXNWhZL0lJczk2ZUMvM2hjWGZqLzdRbmFRSDYwd0k3aTEzSjBBUUZX?=
 =?utf-8?B?elEzQ1VNWE1lUk9ZczM5elZMU1RmT1VPMzNDcWFJYWsyaDhZcTFLbjNjUndP?=
 =?utf-8?B?bzZVRm50dTJyWjVoNEZLdnRCb1M2cWozV3VlREtlVGgyVGNyRzF3cDNNcTZS?=
 =?utf-8?B?MnVIazN4QUdFa3h5RWNuWW9DTzlzUWV6MnFkS3ZjYWdpb3F1dWl0SGFodFJz?=
 =?utf-8?B?Sm5oTTlMUnJoQnNzM0ovdFY3TUk3TmtJRFVqY1hmZThrS3ZhK3dBNjd2TUZR?=
 =?utf-8?B?d01rUitNYWV4TVovbG9iWGRHaTBXT29LeFB0Sm5ZWDJPdTZiWVlFcks5cTZk?=
 =?utf-8?B?REFnYlhqRXJVRGhDd3pJdkMxeFBXdmYyQTBKRDFXVEdvR0lOQ0N1U3ZoYXpm?=
 =?utf-8?B?bGNJQldsWGF6THhMdXp5SWhTYVdqbnJGMDJIUldtTUxxNGZnUVMxZ3B1QVFR?=
 =?utf-8?B?OE1vNTZLWnNoZ1ZMbXd4Umc2WHM1ckltOEpuNU5FUGkzbXNXRHY0M2x1Mmp2?=
 =?utf-8?B?T1UrS1Vpd3VJVjk2bXNQUUtRVGR3dGMzcWpCNDdnOWYrWlptcVJ3R3RlZUN4?=
 =?utf-8?B?UWJvejR3eDVrZ3VEYjZkdVFSU04ydXh2b0R0NTZDcFcvL2cxOHVoaDYyOHZi?=
 =?utf-8?B?VjhmdkhveFRRSHdyUThGOFBDUGIyZW02WjlDKzV6YWU1NVUxYUZXTysySW1D?=
 =?utf-8?B?THdMZG9Icko2RWhVcHpvZHl5eHpOU3BjVWdUVG0vZWx0ZXBsVWdLZHVmWi9N?=
 =?utf-8?B?M0lrRyttSGVKYVdWU2FCajVFS1pUM1cxUlB1LzQ0L3Zpay9aaWQ0ZzBZeUly?=
 =?utf-8?B?Y043b3YxT3ZiVzdkTXh3MHIvaDlLMkU1SnNQODRLbVJWUzROeWkwd2RZWXBP?=
 =?utf-8?B?SHM0NWQ4NWNmUC8vcnY2VTFEaDJKYUwxZVlSeUdKd2k0SmlRaXloZ3dHTW4w?=
 =?utf-8?B?LzZoblhBbUtOTUZiTzJvY1dvQWMxYTVkT3RIRllRNWlqQnFxQklXL1FxQzFS?=
 =?utf-8?B?UlM5cEUrM2tvWXF1QmF6ZWsrUUtmVWtTd1RLZVVOaEkzR0hhZk0wWENZR0hv?=
 =?utf-8?B?U1l2TUQra1pOT3p1V05PaituSGpWV3lvYUp0V2owYnNIQTNmL3l5bmpScXZ4?=
 =?utf-8?B?ck9COWJKWnVvaFFKMUVFTEx5TGV5UGwvUGJVdWU0dis5MlVxa09HRVdoNFg4?=
 =?utf-8?B?a000ckJxUy9Ca2dnMW1IRk5JTTQ4Q3hCSDkxNmVuRjhMeFdNaVo0Z1NkMjhy?=
 =?utf-8?B?UmEyNDJRbXZwQWdUd0VpRDE5S3RFQzVtOUdEY24wQ0FSdUJoMjMrVEZ3NnBy?=
 =?utf-8?B?bnVOVWw3SEdNZUFveGFhYkJXSmpSQTN6OXZBczNKMGIzcDJpcFladz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: U4WJTwPQed/Z9K3bd/3Oo2aDlzoCrMvCFt1hhzAKvL4BzpfJ/pkDYI/vafGU8qj7OKTPhH6KKQreaRd79fzUHz2btK08LEfTQU4bI8wmgSwxJJnYFgld3i6zzgv6/LIebvQWgO+7nvwNjvRjGHPJO7TTxhERRBWhA5PuCwtlMnEua8qqGv7NzbI//1OeOM4G7Yp61/JjK9DndeWdwzs/6ZW3r6KXwQEWAgAzzNZVtfPU1Sj8YzWkjHUjMxLdwXEFjJdvxJpXoSzuFbM+3YQRsV+2QTd7Fxr2POu5pjAr2ERVW8LZ1Hma+g1O5M7rrllJJXt8D7nMmauVYhXU54rMjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff550f3-b804-4792-2669-08dea2256707
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 17:17:45.9001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNdaTgCAllLxVEdW6Ba47JdfOE35XtaIkZSTUu9rBabG1aWGazZY05elxLzAOQNsmATUnm2rCf3c+SUllUOOag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgMzo0OSBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBBbGwgUlRQ
IHRhYmxlIGVudHJpZXMgYXJlIHJlcXVpcmVkIHRvIGhhdmUgYXQgbGVhc3Qgb25lIHJ1bGUuICBJ
biBjYXNlcyB3aGVyZSBhbg0KPiBlbnRyeSBzaG91bGQgYXBwbHkgdW5jb25kaXRpb25hbGx5IGFj
cm9zcyBhbGwgcGxhdGZvcm1zIHdlJ3ZlIGJlZW4gdXNpbmcgYQ0KPiBncmFwaGljcyB2ZXJzaW9u
IHJhbmdlIG9mIDEyLjAwIC0gZm9yZXZlciBzaW5jZSB0aGlzIGNvdmVycyBhbGwgcGxhdGZvcm1z
DQo+IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyLiAgSG93ZXZlciBpZiB0aGUgcHJpbWFyeSBHVCBp
cyBkaXNhYmxlZCB2aWEgY29uZmlnZnMNCj4gKG5vdCBhY3R1YWxseSBwb3NzaWJsZSB0b2RheSwg
YnV0IHByb2JhYmx5IHBvc3NpYmxlIGluIHRoZSBmdXR1cmUpIG9yIGlmIHdlIGhhdmUNCj4gYSBm
dXR1cmUgcGxhdGZvcm0gdGhhdCBsYWNrcyBhIHByaW1hcnkgR1QgYW5kIG9ubHkgc3VwcG9ydHMg
bWVkaWEvZGlzcGxheSwgdGhpcw0KPiBydWxlIHdvdWxkIGNhdXNlIGltcG9ydGFudCBwcm9ncmFt
bWluZyB0byBmYWlsIHRvIGFwcGx5IG9uIHRoZSBtZWRpYSBHVC4NCj4gDQo+IEFkZCBhIHNpbXBs
ZSBtYXRjaCBmdW5jdGlvbiB0aGF0IGp1c3QgYWx3YXlzIHJldHVybnMgdHJ1ZSB1bmNvbmRpdGlv
bmFsbHkuDQo+IFRoaXMgc29sdmVzIHRoZSB3b3JyaWVzIGFib3ZlIHdoaWxlIGFsc28gYmVpbmcg
bW9yZSBpbW1lZGlhdGVseSBodW1hbi0NCj4gcmVhZGFibGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyB8ICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfcnRwLmMgICAgICAgfCAgNyArKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cnRwLmggICAgICAgfCAxMiArKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNodWljaGVu
ZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0K
