Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEC6C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 03:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5938310F8D4;
	Tue, 15 Sep 2026 03:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKDDcOK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF8A10F8D4;
 Tue, 15 Sep 2026 03:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789443263; x=1820979263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bI2G04t1sbRMYqADUmqxrChNCHmR4q348Wjf0HEDI3I=;
 b=fKDDcOK4A6qvj3vbxyJgxrswcOWxW7Q0m55Ykgj47GF4XlBSSSbAFwhH
 4+oUHJjK8Dc8WqCVf1Bzi/GJL2wx4ok5EVymNwpKNdY7IgsM+eU14DOEK
 j6ehL84V6t4t9Nq/VDRzyZtBnB69b75kM+XQE5O0EU83V3nE3OeIWC5x0
 wvb5TfyBcEKF7Q/6ukNDlPJV5e+hn+fNHfhbJDEvsekmkvz5aJU2iz+Hl
 5ZtA1YxzUr7B5QT8vizQfeqealnCjO696m6KT7Ws+TMW0+cqanIM9hU9G
 pTPEgURQu5DzqtaJrccUWQpCrgd5Ov2t4DRAo+KVol+eQ2ZthCUd6SO+7 A==;
X-CSE-ConnectionGUID: 8q4i0GeTTHerStnN7fO9Hw==
X-CSE-MsgGUID: KtICiDUvSiy1RbT+UIM83w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100462540"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100462540"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 20:34:22 -0700
X-CSE-ConnectionGUID: 67qiIc3hRXWhZVSJV77HQg==
X-CSE-MsgGUID: eIcMWsBoQHOTaV8unmBBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1030231"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 20:34:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 20:34:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 20:34:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 20:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QerwYpE8bBVJmnwXhwhpOD9urzP0a7PpfLNtgAMVIHIfCKLMh85k9jpUQBIuDw8r7B1wdOS4ICy8U1Shlv61nLQknL8qZSmfwvfqTZZD6HgUHV9YXWdt7iSV9p2vxNJyy6WbfZ/yTmVGOK66kzqxEx7FcGxXJEnQTv7k/vkp5m44IhiGuGp2hruB7B0C25Tdi8b8KjZEIw6bDtRieoc+X+l9jUk3obCaynSxPQZdm+E/KLWIS1g9P6HiBxmyGXP+LT01T6Xdyz+5Gds2ohdtASWrgOzT0Yk9bpvuxaIosyKKCOlyCVKOo/YJKbbJ1F4Qbw79wXe9LB3BEdEPJ6Kirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI2G04t1sbRMYqADUmqxrChNCHmR4q348Wjf0HEDI3I=;
 b=VftYscyBgwbnlJCyW5f07T6KKgGQ6g7Yh/tczwB8GMC9pghdai+xgNrb4dIwhCUO0NWvzC4QrjUqKNuI0KAJ+p6TLIlfCAo/tZMxv4OVx9AnsrfIhjQosPfZRUcKLnTd7pWB5C0eUkSq8aXM8CNEuRa2dbUJU5qFPu1NyISdWSA0ACYbm0kc4vDMi7/yymwPFEDK+eSbtpNEyfDBuvTirF1Hyt9ydn1zblE8ePZ5MbL3VkIUuTsM5LEHOo1YINA8i5uezGbDQurvbDAHx6vmq4yHxTfEHUezKZBbWlxxLMtlThLJDoOOHdvAGNgHYNKFv/AAHiOVHtgcUNjBQDUhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 DS4PR11MB789483.namprd11.prod.outlook.com (2603:10b6:8:514::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 03:34:18 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 03:34:18 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v5 11/15] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT PHY
Thread-Topic: [PATCH v5 11/15] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT PHY
Thread-Index: AQHdNFm5Laq6qu9RzE+aph3Ct214uba7FJIAgBQIdUA=
Date: Tue, 15 Sep 2026 03:34:18 +0000
Message-ID: <DS0PR11MB8049B41B76CDDF9B8FC10590F9BA2@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-12-animesh.manna@intel.com>
 <90d1f5e68b62613ffd8916c101579082a20cb236.camel@intel.com>
In-Reply-To: <90d1f5e68b62613ffd8916c101579082a20cb236.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|DS4PR11MB789483:EE_
x-ms-office365-filtering-correlation-id: 613a5b82-4ed7-465c-066b-08df12da3942
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: QycImEwZaMPf8TYoM0/utPt0OWp3NCfKlUFmdvOfFzgJasI2SBxqCdGOWTpqdaNRjKvSXIxK8IKSOljxYjwjU1k/94bp3IkBxsdACTKScQcfdHzoLB/JFkJZ4CRyiC1kxKM/hWgbCyfbvt4ye7dcv0quGM8hGd+HKpwOOW1tQRq3nrA/zi3SybFJa6D3ruCe3SwlATl8OR6bW+/ygF5LOO1Gwilw0ixDvYAtjxkDIU+UpayrtgldwV44GqpZ3Iv9HyKimupp5ZVHpbPTVxnN3pKPx6zApQAd3VABHk7Ff378Cd9F60QktIKPD08XIwUbAeyMIAadNryZTab5IOBorZrtj9Mje/+4tYFGf9KMWYRO/A/nKtzSa0xzPHZIM4wwwhFpu4rl4Fmn/sqrmQmQJEAqrnw/Cbajllw4vtYSTSTTmxN+kzRhYFmeh/7s0YvnzYxM4l5buWMarot5XBXx38Su9+V3W64k7YiqnROoYmS8apijr4+gYIal/VdvLGkwT6izIAGrXRm1UVqwZVBhVrb2IeP0rAuSB2uGkeasfZgBVMtDTyb43RHc/YHDtkd3C2DMEpvi5eVpKDymRXDcxvPYeUTfGRcrmg7Xo+2Qxx2fELNPI3DehRmAyBo/AAy2QjkmIYTt9JLEORxJBqgbrHZHdfVTAHql7/hmn7yhLeLLB0+SgUAOlUowI3uHxmB7RXC9kKIp0ZXBR4MbHnv8bacSzw0JojACrpMwyknxaxw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2xWNWdNTjlCdEJDckNQTjVmUmNINEhpbVJaV0lsQXE0RUg0SlNPV1hFM1R3?=
 =?utf-8?B?Y0hWQ2JDcWxVdWlCbm1PS3ZSSnNLTXZRZXR3emw4WjhpMENPWTA1cE85MjRN?=
 =?utf-8?B?Ump1Q2lJWG5HaVVGcE0rM3M0dGluSzErWTBUVS9ZZzJIbmtqYno3TS9laWo5?=
 =?utf-8?B?OGJaMUJHcWFhZ1E1UFQ2QktVUHNFM1lqeGV3bzFnamVZUENBQlY5VWpIQ2h1?=
 =?utf-8?B?OTIzbC81VGtSZUFaNzNnUHU1VEIxQ0VoVGlWNmFQWWQwd3pXaWJmRFBFL05y?=
 =?utf-8?B?NURHcjlGNlZ6RG8xNzBqU09FL3ZtNFdjNVZKMEdGMlJualhGMHg5RzNjSDBV?=
 =?utf-8?B?ZmRKYUFjbHVPcUdtTWp4V3BaMFNBTFAyOVh2SEhQM29ZYTJEL0NFekt3Yy9v?=
 =?utf-8?B?RXN0azVBWEEzM3E2amxDNGhab2dwSXIvbVMybnlZVTRWd2lEMVdFOVNtWG4v?=
 =?utf-8?B?KzFTSEpjU2QzU245OXNLRnhaZlRDa0NtckRrSnZLaXVsYkF0R00wWkg4enpS?=
 =?utf-8?B?T1VhYlNvS3VyaEhBSGoyVU43ZXlTUzg5QkpoZGxzRU9mczNrYS9RWVRsRFA2?=
 =?utf-8?B?anZqVFRpSDR1VUp3TzYybEhmWHJ5a0l3RWhXeFBmeGZwZ1duQmZVZmszWGxI?=
 =?utf-8?B?YU1HY2JtMFlKT3ZKV1hsVm81VGtuMzZCVzZYR2VYY3E2NitOUkxmZm83c2Zy?=
 =?utf-8?B?MzhNWGNIOVU4SFJXTWxqOFowZkgzT1NoTUVkblVRamtwOG9lUHlJUEI5WjdG?=
 =?utf-8?B?bVFGOWgramdJMzB6TTJLMmh5WnF3RTNpSTRtdWoyMlZINjBMeWlmSHZEVVpn?=
 =?utf-8?B?Wm9VaGwwN1JKRW82UWRBNmo4cDlXdFFuRzl4TXhXZEdLR2FVY2QzdG9Cc1Nz?=
 =?utf-8?B?d1Q1ajBSR2hITXF4d1BySDI4eXpnUUkxSVAvTWlHcldQb3Aya0VEK2dKMTkv?=
 =?utf-8?B?SFp0clFSbG5Ub1BqTnVSRS8vMFhMekhSN0E4aUtaYThwSE5taG1OL2I5Sy9X?=
 =?utf-8?B?Z01ock03Qlh3b0Y0cW5CdVRDN2E3ZVU4ek5JYlNlMkJDMUx5S1B1S01ESzVl?=
 =?utf-8?B?M2wzOXBhVDEwZFV5Y2VyN21kQ1FtUyttZElCdk1HZ0Z5VThaKzB2Y2NBWGt5?=
 =?utf-8?B?Sk1wU1QybElPdWRxdHh6WHVQWDBEejRhOXVkOXZWcTM0anBQZjNYRU56UTBm?=
 =?utf-8?B?dXR4YXFYSXh3U3YvVU0waUVwVlJTOGhEdXR6aXJRSFNqaGR4bWNKTWJBeUh0?=
 =?utf-8?B?M25hR3BBdElKWUNtaFVjOE5MVWdVTHRQWTlpeG40MXl1K3VFT1VHWXlkdi9K?=
 =?utf-8?B?Q2FTYzlwbXV0RWQwQVB3M0RYSnlGMllVK3FjZVFOeDdHcTNCRm5Qd0ErTmlR?=
 =?utf-8?B?TUNQUzBwbzJENmp1SWRTSDV0dnlUaGNoaTc5QlNML0tZRy8rakduQkcrK242?=
 =?utf-8?B?MVZjRi8zdWk2bXRlY1pkdGZmK25JSDJHL3lTcTh0aEpnNlNTcG43c0tyRzRn?=
 =?utf-8?B?UHZqWG1MWjJUc3Y3dG5yaDBIZDBaRE4yeFFLcDN5SXM3Tmh0NmNMdTlQVXI1?=
 =?utf-8?B?am1Obms3eEFwUk82cWxVeXJVaFRGcFRaWlVJV3I4YS9ick9NeUp2SDBpYjI0?=
 =?utf-8?B?aFIzN3BSSjQzUXZXMDJEeHVCbG0yTWZXQUpGYzRlcjh4TXU2YWliY2pIZ2hV?=
 =?utf-8?B?RG05cDVYc1hEa1d1bjU1bi9TTFdSNEdHNEZlRE5lbWZKN2ZWM0VnV3ZwNDZ2?=
 =?utf-8?B?UmNhcXdQVmZjaWt4SHFoL0VQaDVRNHJjU09aKzBPelRqV0Yvb2xZWjlDZW5L?=
 =?utf-8?B?dVN2K1VBcVNwNXp4UVJlTDRWNlNIenZna05qUU90YjY2ZVFtajFWdTMzNHpS?=
 =?utf-8?B?Y1hHZzkyQ0N1Z2s0ZTVZZy9wS1ZUdllraGp2UTlXbWMzMGhVSXpGVmNnNyty?=
 =?utf-8?B?c2J4ZTU3aEhQMWlVcTU5bFI5NUYxYUJRL2dZV3YvZm1USEk0WjNKQU8yaGhl?=
 =?utf-8?B?TWh2ajh5blJFbzgrL1ZERlV6VXhYeElWUVd0cVcyTXArb0pQSS9pSCtvY3pT?=
 =?utf-8?B?UnVwVXdsdDN0ODBMd01nNzIwT0FHbjlTaTRFM1NqNHFzTHpoTVpMVzdBV1dl?=
 =?utf-8?B?WG9VV2R3cUNFQ2wreFlMd0FMWlQ1TGZqK3BZR29NSzJKcjVhRGJUeVN2L3hJ?=
 =?utf-8?B?RnR2Vlh3Rll5RUovRkJmakp6ZlRwelI2VFJrMlNmS0VZT0pYTmNkSXRGNmto?=
 =?utf-8?B?d2FIa0Z0NWd6d0dockgwY0Y2aEl6VE5yQjFLcWpYWFJORk12czZwUGtDa1NK?=
 =?utf-8?B?TkZibk56YmRUelJMYlpZOHVVek9TeDNhNEJTNGZhNUNPMHRWNkNhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LBp9HBMrDeb0qMJcULHFPPLAQOzJbbsDUTX5IviFaiMUM5SjhizTbqZK59xMuPyLrzm2CO0YxdFCXHo7jBScnbOOcvrZB6zlDxiyorTcTf7JkICRd1RaW7O2s+7rz8geic7YJaBIyq9CFH88DKb7i/8pl3H3bAJfeZ0icHBSLUv093mNciNVOrWhP7JLoi8EAkUmQg7r8AYahGTpZRINC6EUN2gt+DWu4rqMdVRAkifOwWRrDL7xaCwAhfIl4MTVUo2t0QuU2v38KkAuW1FC/Oo3QdIxW5tljmFVk7/YlragJ5vDKa1p1lR0278xjDi0JogzZtuyjXxT1zqr1e+4cg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613a5b82-4ed7-465c-066b-08df12da3942
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 03:34:18.2311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kX055DGz3MF0Dmko0KT0dBNxI9K8ulAKgZgP+0BHAvWNKcbA0XurBjjUaYBPKc2JGtq4poOOTYdq7VWRNnj/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB789483
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVy
IDIsIDIwMjYgMzowNyBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBN
YW5uYSwgQW5pbWVzaA0KPiA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBp
bnRlbC5jb20+OyBOaWt1bGEsIEphbmkNCj4gPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NSAxMS8xNV0gZHJtL2k5MTUvYWxwbTogRW5hYmxlIE1BQyBUcmFu
c21pdHRpbmcgTEZQUw0KPiBmb3IgTFQgUEhZDQo+IA0KPiBPbiBUdWUsIDIwMjYtMDgtMjUgYXQg
MTE6MTUgKzA1MzAsIEFuaW1lc2ggTWFubmEgd3JvdGU6DQo+ID4gRW5hYmxlIE1BQyB0byB0cmFu
c21pdCBMRlBTIHZpYSBMVCBQSFkgZHVyaW5nIGF1eC1sZXNzIGFscG0uDQo+ID4NCj4gPiB2MjoN
Cj4gPiAtIENvcnJlY3QgY29tbWl0IGRlc2NyaXB0aW9uLiBbU3VyYWpdDQo+ID4gLSBSZW1vdmUg
bG9vcCBhcyBubyBkZXBlbmRlbmN5IG9uIHRoZSB0cmFuc21pdHRlciBMVF9QSFlfQ01OX0NUTDAu
DQo+ID4gW1N1cmFqXQ0KPiA+IHYzOiBDb3NtZXRpYyBjaGFuZ2VzLiBbU3VyYWpdDQo+ID4NCj4g
PiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuY8KgwqDC
oMKgwqAgfMKgIDUgKysrLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9sdF9waHkuY8KgwqAgfCAyNw0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmjCoMKgIHzCoCAyICsrDQo+ID4g
wqAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5X3JlZ3MuaMKgIHzCoCAzICsr
Kw0KPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0K
PiA+IGluZGV4IDliM2I1MjZlNWU1NS4uNTI0NDIxODEzMmFhIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+ID4gQEAgLTM3OTYsNyArMzc5Niwx
MCBAQCBzdGF0aWMgdm9pZA0KPiA+IG10bF9kZGlfcHJlcGFyZV9saW5rX3JldHJhaW4oc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiDCoAkgKsKgwqDCoMKgIGlpLiBFbmFibGUgTUFDIFRy
YW5zbWl0cyBMRlBTIGluIHRoZSAiUEhZIENvbW1vbiBDb250cm9sIDAiDQo+ID4gUElQRQ0KPiA+
IMKgCSAqwqDCoMKgwqDCoMKgwqDCoCByZWdpc3Rlcg0KPiA+IMKgCSAqLw0KPiANCj4gSSB0aGlu
ayB5b3UgbmVlZCB0byB1cGRhdGUgY29tbWVudCBhYm92ZS4gT3RoZXJ3aXNlIHBhdGNoIGxvb2tz
IG9rLg0KDQpCb3RoIGNhc2UgYW0gd3JpdGluZyB0byByZXNwZWN0aXZlICJQSFkgQ29tbW9uIENv
bnRyb2wgMCIuDQoNClJlZ2FyZHMsDQpBbmltZXNoDQo+IA0KPiBCUiwNCj4gSm91bmkgSMO2Z2Fu
ZGVyDQo+IA0KPiA+IC0JaW50ZWxfbG5sX21hY190cmFuc21pdF9sZnBzKGVuY29kZXIsIGNydGNf
c3RhdGUpOw0KPiA+ICsJaWYgKEhBU19MVF9QSFkoZGlzcGxheSkpDQo+ID4gKwkJaW50ZWxfeGUz
cGxwZF9tYWNfdHJhbnNtaXRfbGZwcyhlbmNvZGVyLA0KPiA+IGNydGNfc3RhdGUpOw0KPiA+ICsJ
ZWxzZQ0KPiA+ICsJCWludGVsX2xubF9tYWNfdHJhbnNtaXRfbGZwcyhlbmNvZGVyLCBjcnRjX3N0
YXRlKTsNCj4gPiDCoH0NCj4gPg0KPiA+IMKgc3RhdGljIHZvaWQgaW50ZWxfZGRpX3ByZXBhcmVf
bGlua19yZXRyYWluKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gPiBpbmRleCA4NjQ5MjY1
MWIwMWQuLjRmZTAxMGRmMjBiZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2x0X3BoeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9sdF9waHkuYw0KPiA+IEBAIC01LDYgKzUsNyBAQA0KPiA+DQo+ID4gwqAj
aW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiA+DQo+ID4gKyNpbmNsdWRlICJpbnRlbF9hbHBt
LmgiDQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfY3gwX3BoeS5oIg0KPiA+IMKgI2luY2x1ZGUgImlu
dGVsX2N4MF9waHlfcmVncy5oIg0KPiA+IMKgI2luY2x1ZGUgImludGVsX2RkaS5oIg0KPiA+IEBA
IC0yMzU3LDMgKzIzNTgsMjkgQEAgdm9pZCBpbnRlbF9sdF9waHlfdmVyaWZ5X3BsbHMoc3RydWN0
DQo+ID4gaW50ZWxfZGlzcGxheSAqZGlzcGxheSkNCj4gPiDCoAlpbnRlbF9sdF9waHlfcGxsX3Zl
cmlmeV90YWJsZXMoZGlzcGxheSwNCj4gPiB4ZTNwbHBkX2x0X2VkcF90YWJsZXMpOw0KPiA+IMKg
CWludGVsX2x0X3BoeV9wbGxfdmVyaWZ5X3RhYmxlcyhkaXNwbGF5LA0KPiA+IHhlM3BscGRfbHRf
aGRtaV90YWJsZXMpOw0KPiA+IMKgfQ0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogQWNjb3JkaW5n
IHRvIEhBUyB3ZSBuZWVkIHRvIGVuYWJsZSBNQUMgVHJhbnNtaXR0aW5nIExGUFMgaW4gdGhlDQo+
ID4gIlBIWSBDb21tb24NCj4gPiArICogQ29udHJvbCAwIiBQSVBFIHJlZ2lzdGVyIGluIGNhc2Ug
b2YgQVVYIExlc3MgQUxQTSBpcyBnb2luZyB0byBiZQ0KPiA+IHVzZWQuIFRoaXMNCj4gPiArICog
ZnVuY3Rpb24gaXMgZG9pbmcgdGhhdCBhbmQgaXMgY2FsbGVkIGJ5IGxpbmsgcmV0cmFpbiBzZXF1
ZW5jZS4NCj4gPiArICovDQo+ID4gK3ZvaWQgaW50ZWxfeGUzcGxwZF9tYWNfdHJhbnNtaXRfbGZw
cyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gPiArCQkJCcKgwqDCoMKgIGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUpDQo+ID4gK3sNCj4gPiAr
CXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBlbmNfdG9faW50ZWxfZHAoZW5jb2Rlcik7DQo+
ID4gKwlzdHJ1Y3QgcmVmX3RyYWNrZXIgKndha2VyZWY7DQo+ID4gKwl1OCBvd25lZF9sYW5lX21h
c2s7DQo+ID4gKw0KPiA+ICsJaWYgKCFpbnRlbF9hbHBtX2lzX2FscG1fYXV4X2xlc3MoaW50ZWxf
ZHAsIGNydGNfc3RhdGUpKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwl3YWtlcmVmID0g
aW50ZWxfbHRfcGh5X3RyYW5zYWN0aW9uX2JlZ2luKGVuY29kZXIpOw0KPiA+ICsNCj4gPiArCW93
bmVkX2xhbmVfbWFzayA9IGludGVsX2x0X3BoeV9nZXRfb3duZWRfbGFuZV9tYXNrKGVuY29kZXIp
Ow0KPiA+ICsNCj4gPiArCWludGVsX2x0X3BoeV9ybXcoZW5jb2Rlciwgb3duZWRfbGFuZV9tYXNr
LCBMVF9QSFlfQ01OX0NUTF8wLA0KPiA+ICsJCQkgTFRfUEhZX0NNTl9MRlBTX0VOQUJMRSwNCj4g
PiArCQkJIExUX1BIWV9DTU5fTEZQU19FTkFCTEUsDQo+ID4gTUJfV1JJVEVfQ09NTUlUVEVEKTsN
Cj4gPiArDQo+ID4gKwlpbnRlbF9sdF9waHlfdHJhbnNhY3Rpb25fZW5kKGVuY29kZXIsIHdha2Vy
ZWYpOyB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfbHRfcGh5LmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRf
cGh5LmgNCj4gPiBpbmRleCAxNmRlMzk0ODQ3NzkuLmM3NmM5N2I5MDk0NiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5oDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuaA0KPiA+IEBAIC00
OSw1ICs0OSw3IEBAIHZvaWQgaW50ZWxfeGUzcGxwZF9wbGxfZW5hYmxlKHN0cnVjdCBpbnRlbF9l
bmNvZGVyDQo+ID4gKmVuY29kZXIsDQo+ID4gwqAJCQnCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBp
bnRlbF9kcGxsX2h3X3N0YXRlICpkcGxsX2h3X3N0YXRlKTsNCj4gPiDCoHZvaWQgaW50ZWxfeGUz
cGxwZF9wbGxfZGlzYWJsZShzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2Rlcik7DQo+ID4gwqB2
b2lkIGludGVsX2x0X3BoeV92ZXJpZnlfcGxscyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSk7DQo+ID4gK3ZvaWQgaW50ZWxfeGUzcGxwZF9tYWNfdHJhbnNtaXRfbGZwcyhzdHJ1Y3QgaW50
ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gPiArCQkJCcKgwqDCoMKgIGNvbnN0IHN0cnVjdCBpbnRl
bF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUpOw0KPiA+DQo+ID4gwqAjZW5kaWYgLyogX19J
TlRFTF9MVF9QSFlfSF9fICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfbHRfcGh5X3JlZ3MuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5oDQo+ID4gaW5kZXggZmY2ZDc4MjlkYmI5Li5iNjRm
ZjU3ZTBjMDkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9sdF9waHlfcmVncy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9sdF9waHlfcmVncy5oDQo+ID4gQEAgLTM1LDYgKzM1LDkgQEANCj4gPiDCoCNkZWZp
bmUgTFRfUEhZX1RYWV9DVEwxMF9NQUMoaWR4KQ0KPiAJX01NSU8oTFRfUEhZX1RYWV9DVEwxMChp
ZHgpKQ0KPiA+IMKgI2RlZmluZcKgIExUX1BIWV9UWF9MQU5FX0VOQUJMRQkJUkVHX0JJVDgoMCkN
Cj4gPg0KPiA+ICsjZGVmaW5lIExUX1BIWV9DTU5fQ1RMXzAJCSgweDgwMCkNCj4gPiArI2RlZmlu
ZcKgIExUX1BIWV9DTU5fTEZQU19FTkFCTEUJCVJFR19CSVQ4KDEpDQo+ID4gKw0KPiA+IMKgLyog
TFQgUGh5IFZlbmRvciBSZWdpc3RlciAqLw0KPiA+IMKgI2RlZmluZSBMVF9QSFlfVkRSXzBfQ09O
RklHCTB4QzAyDQo+ID4gwqAjZGVmaW5lwqAgTFRfUEhZX1ZEUl9EUF9QTExfRU5BQkxFCVJFR19C
SVQoNykNCg0K
