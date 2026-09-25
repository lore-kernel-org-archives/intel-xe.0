Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F13C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F1310F9F7;
	Fri, 25 Sep 2026 11:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lD+CJGx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D80110F9F2;
 Fri, 25 Sep 2026 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790334518; x=1821870518;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+ez2FH4kFa7Cn6dpgnPxtA8j0ngZ87wBLv5m48SoNFw=;
 b=lD+CJGx45Qyy4fzjpLmt4X5vY64pawLLJ1rekbeuobRITEnBUsqPDwlo
 ONpgZpD4qvkF7gMAoj8FfvgKcAGne4brmztAR5jH06Cw+7k7shFOXGxTH
 C8w95rTXquWqGHhcMmkAaex4tlUu74NMl/m7MotUdecWaX/vlbKrltkUW
 dof+gsmChA6JysLdDDvqSnWqU3s19j6Ip0pOJCY8qY59SzIVNS39kbVUi
 +K+HledmBPZkurbTdl6+UME+Y9FZP2o6+EmW7UzjwsH4VSBYi+ImM7YWn
 dI1EiO/5T/t0UdR3PuuhjlnRoJT+e7dfa85orDEZRts+h270mA7n9i4/6 A==;
X-CSE-ConnectionGUID: RbM3tdXESiCLoKpm5195CQ==
X-CSE-MsgGUID: OQngyG8WSAO37gd6Mh3hbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90157469"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90157469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:08:37 -0700
X-CSE-ConnectionGUID: Fwg8+tRWSIeItOUpVXJuIg==
X-CSE-MsgGUID: AEE+QepHRTKJRYVSFVrttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272886935"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:08:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:08:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 04:08:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:08:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahmC3yCWAFxmuBkT5FgB0oQHt62T8PPySYZq5JARJxPyNhDHEFGuGL/s0UIi7d48CV8J6oxLxeGJ6/H3wvKbWctLJ/Oz7JSd02APAF6d287OZ+r+xlkBlef+ckGJsgLSnQ3+SkJHanAjTFHbbvxEH3ofyayUyHV9BAAMfoGlO1zBs0UWQM++FMudnJez5mJrdTFpXYJmVav+u01ruc51sX9l1boyzjLn6yZPvCFX4iyLrAmFgUMtev/Qf8LXsn/tMlir88QtB5BRS82lAnpYTSrCv+7iGlJrEPxA3UlDz2hZlirB1IqiACVR9YSRXjfVgtMErZmVsu/WW05vcsGpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ez2FH4kFa7Cn6dpgnPxtA8j0ngZ87wBLv5m48SoNFw=;
 b=UUytA4qy9JoQTDWj9+zpPbbcmTnec5vGfQMgwFIbrJZjEDVOUb5aMUdKxMzufE2PdVxKrLu8kharvxbu52KwBERyo07BNq08iqFgXYeBBzq1pDLI+LiiFC42IpnUt+L9D1ey5eWY34Ah+4bRTuAAqIKeF/McU/GzAxyMHk7Igkr+zRnsjz8G212L88m3PFZ4RggfeivKGbi6UVGwYbu/st2HcKIQZKJh/OXVZ7oTZRPhsvU3pKBNXrsD6s5AeyxsFJmyUX7opYJ3vAWPKTz3qYhMFVrcBtcLImYbImVyfY22CwfqHQ3tcanCW0hxeiKBgNLwTNUpcKg11mWzokokiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DSWPR11MB9870.namprd11.prod.outlook.com (2603:10b6:8:4e2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.19; Fri, 25 Sep 2026 11:08:33 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:08:33 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: Allow forcing the joiner on eDP
Thread-Topic: [PATCH] drm/i915/display: Allow forcing the joiner on eDP
Thread-Index: AQHdS1MY8LpwRs0J2U6NnEf8Pe97z7bfJb+A
Date: Fri, 25 Sep 2026 11:08:33 +0000
Message-ID: <f94341a4104e06687779fcb833294883f1aa6cf7.camel@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-6-mika.kahola@intel.com>
In-Reply-To: <20260923115941.746934-6-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DSWPR11MB9870:EE_
x-ms-office365-filtering-correlation-id: bf068548-f1df-4a0d-4b51-08df1af556fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|10067099003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ScJTPBAKgS/oqyVMEUrmLrD+AW4suf7Yz312yj9tukGwVXIMuVou1lAU3d3vhELwq6CkX9Ui2SJtSkJWtJT3HBk+8XFrjgy0/L3ZO879fbE2lwqYLd1uP3/FExDy4P5CtS64oFdLwNtcCLCNd/DWrppuejQgd8Yi/0CP0olMtVH/XgdmybV4kz8gbgIalEWX0r8bzZOpm1k774xNLKY7sGg5kcHGCCr1kvsPoSK+h4M7JRXcdOICU5zjwmVlGhD2HL9RYnTUd1A/7vf7g7B/ZWO4qVX+j6yEqUQnfF60wIqRkluIJC5P44I2kTMZCVlpZJtJoKvYpO9k0CaQ9/dQEgoUH4xw9/fk2FaLsK6GdYjBk7dzhsZhFdS56kbDcA7HlSylzxuoz0S/SOYWBKZNxjorpSwRIEZb7lfuHPouBwJ+FDSwp2F24UO8DRZ0R+QTvJNpC3KPS3TSJTINU9g75+SRJvm84iCR9wvWWo7UtI1JzL4DLJkR6SUKONBiiQaY70J1VxNDISNLwQQqGIuSl6dnhcgP0WoEzNrWgjdSee4N4zYHy877j8RgTymrEY5VdQhYtgxAA+QSXBPw6sViu/mZxc2KgbSeUH+SpQRHxVUbpUmQ+UsImLi2lMuXQRz6v86LeuVyXaXYA13rV3pHInNkQUaqBtZQYiATn8IIj2PWpd7WEpyHpcEBdnUsXrFBd61f5sZ4Pvn5LqlDl9R2wlJhKRpNKtDPHyjGRjSmoN8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnNVV21EaTYvMTU1L2pwaTAxY3RsY1NqeVVpanlkTjhJTWtzc00zMFhlMHA4?=
 =?utf-8?B?TjhQTzR0Z0dxZWpUMk1KUkhMVk81RHRBNmtrTUtIV1l0S04xRzVIU3plOEc0?=
 =?utf-8?B?TCtOZDRLek9ndVk1bGVRbmN3V1pHYUtoSGZ0ZnFKRXZnSXIvQlF4c3BRdlR1?=
 =?utf-8?B?SzBxWS96ejd1RlhBUTYrQ3JRRHRXdjI3RXpvL3owQ3lzQ1NDSUFUbUdaejY1?=
 =?utf-8?B?dlk3S25nRCtjcmpzajFycGVuS1E2R1NReS9TemtlWlZ0Q1IveStrcGEvMnJF?=
 =?utf-8?B?ekZLeDczQTZsdkd4TW1oWWIvOG5LcUFza3B4bDN4M3RtMEhBWTd5anF6elFI?=
 =?utf-8?B?Y1o0T0owKzdJb2oyMWRVOHR4TGV6Y3hzQWZXNTRTZlN5QVRmOGN6ZTQ0Y1NT?=
 =?utf-8?B?SklReUczYkpnWWtkTzNYUDg3aFk2b1NXZ2JZZmN2Nmo0KzdlaVBCSW5ESVpu?=
 =?utf-8?B?Q2lqbGl6K040OXZGdmZJNzRmeHhZNkhPS0MzeERQTkZLVUt5djFGTXN0VWF6?=
 =?utf-8?B?a2JuM3JhNkN4Nnp6anBZL3diWlVnNDdmZjhlVGFjVVIraHJHWDV1VVVKMWIr?=
 =?utf-8?B?ZkxCMGlIZGtoU1NaRHRYbXJ6TzRiODlvUnVrRW5kZlFwNUVpaEEzUjMxZC9k?=
 =?utf-8?B?bGZ4dkhjbW5yWU9pWXdjVE53Vmg2RjdQalJyN01NMGY0Sk5mbTEvRkt6VElr?=
 =?utf-8?B?K2tnenpheEhmQmJTem5sN2RibWgvNWszWldtUDhaWk8zYzdUQlRaOXZhU0Jv?=
 =?utf-8?B?ZGFoNS84MjA1SVlaTEVRK0tZSGE1UjlENEkzQmU3ditXOFpRSUN6cFhMa2I2?=
 =?utf-8?B?T09nTkE5THdUQllqQm02ejNDNWdMbVBGeEFBQTJHcm1GZnQwUStCLy9HVFBB?=
 =?utf-8?B?RlJqeVB2OFJtR1oxYXZNcFE1a2lDQVpSOHMxeWZTYXAwVDM3bm1hcmE4aUpT?=
 =?utf-8?B?Y2F1RENucHBwOE9BeTg3TFlZaE1nUXJLTFNHOEpvWXlrZUJwTUNicjVmYmNu?=
 =?utf-8?B?UnJod0VnUDF6Nk8zRVBJWDFwUU1BbU5EUGd0MjNnc2NVYTU4em91WG1Ucms1?=
 =?utf-8?B?ek4ycFFVaUk1T05iWHI2SW5MSjJwenFTZ0FsSWtqUXBCVEhwRnlvSld5TE5L?=
 =?utf-8?B?WFRVVXhyajZ1SzlWRXhrcldrc09EU3U3RWIwcXRSWDJUbDM1cFEyMlZjT0s0?=
 =?utf-8?B?YjFHaW9aTk9Fb255MFJWejBxS1VVTlhBOHBNcjRXVFMzK0NINE0yeER1eUV5?=
 =?utf-8?B?MUJUc05JclZFa2YvS0VpZlQ0S3U0VmZPYmUwajE1S3V1NTRaRDdQTVo0ZUNj?=
 =?utf-8?B?eDh1TUErd01DT1dMSE9aUU55bmRqaVI5VVljMk5rTndSdzBDU3FJYmQvb09L?=
 =?utf-8?B?NDhqb0xvM3hYKzFiMTZPOXV2V2dkWlJRUGkzYStBU2tJbkNjSitXdko4bXky?=
 =?utf-8?B?R0RWV2p1dm1CYy92dFR5ei9IbENvY2dVK3ZGYVRlUm1jNlpqVWNkK3ZwUXhI?=
 =?utf-8?B?Yy9pN2w1ZzUvdW10djdDb0xVRSthV0VkelI3a2ptQ2M0VW83MjVuMTgraGd1?=
 =?utf-8?B?Ujd3bHhJRFQydFk5elFvdFcrdk1JRHFleWlIV1pFdXNVYlZwTFFFSDQvS3c5?=
 =?utf-8?B?UHA3Z2MvaTJYd1hFZ0lVZVg3TDdPU0NLMGpuczVyR2cwdTRoa0g1akFYTVR4?=
 =?utf-8?B?OXU3amhOWjlvOXR6UWxRUzd3YU1XUVhyWkRCS2RrbFRkbkdKN3oweVVaMy9Z?=
 =?utf-8?B?aEpGQmZoMTJxeE5WK0lqSWdFVmkrSThLU0hFdVR2WTVhZ3NmcDg2TldVdmJZ?=
 =?utf-8?B?SXZOYXUzSmRwWGNYdG5UdVBTSXBjTmN3K08xVHJodS8rajNERTgreFM0eXc5?=
 =?utf-8?B?ZHdjZEpsanhiUEY4Yk1QY3ZtWEZwZzlTQ2NpUlQ2c2xhdVlTeVpkWGhBM2Nj?=
 =?utf-8?B?V0lVb0tpZ29HQnU5U3VhdEZ6WHh5K2tXdC9WN2g0SWVjT29IQzFvbWhodk80?=
 =?utf-8?B?em85VjJhbGJMcjRNWk1aS2VBSGxQODdDQ1ZmcEN4UDNEa0ZGTXJzUEdxOXB2?=
 =?utf-8?B?NnNNZG9ZRGpOQmd5UmlYQ20wcGRLbGVnb1k0aEY5QnBwY3UwSnpnMjRZOGsr?=
 =?utf-8?B?dDRtREJ5NTlzWFlIdHBFM1kwSzRVckp6UjB4VDJEOTgxSFJyUHg4dGNQRmVV?=
 =?utf-8?B?MExTU01TUEFGbEdnVGRVQm9hUWoySnU4N1ZYU2VIbmN4dkZRWjFSZTM0SlVX?=
 =?utf-8?B?MGMxeVEvUnZDM0hDZXY0d1ZSUG1WdnFsNmZZeHgyQndJUkRYcllsbmxiWkZH?=
 =?utf-8?B?YXp3d2dhaDlqRGJxbEtJODFZVzJZRm12UExPOTI5NnJCR3hmVjVOd2syaks0?=
 =?utf-8?Q?WptgVGxgy3N6dFEY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FD6A471046CA34DA624CBC88C60F60B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RgNkS1MW7C0PVpkgznd1vkVpVXDfi795QcEQ5zh6OfztlCMen2NnMslRHv0oL98XJ417M2tlMa+rpw3tZLlbwkX+iMc+Md5xcE+xpR/E65AAnYjgWJmiQMsFFzjy6XqllP80LQbpZnkVOxftbU0vHvukeDO0qp+1kbdqTePc6xMhjgWWQTN/XUkODAwe3I5apG+tI23MChHBKQ3eWMEH5NTppwZCJYDEVqPWwx2LDZZYtUOq34AyE/UwmhUD/DFcwtSRPS5mwvOJAm040cbXA0f6MeseDmnR4DsgVHOOy93RNAYE7ATFnF6TXMWsZe9gQ7QFpYJ/CmoqXc8bFsKSGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf068548-f1df-4a0d-4b51-08df1af556fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 11:08:33.8002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rM6OPP3m96SxxE9KLvT3GpgQW78LyE7MVze/jLnWGA9TtrQmOJApTAPbbVzEkg22m2a1V3+tDoc9ghfiTpxvTgsW/HIAko9Olod+iVrWWAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9870
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

T24gV2VkLCAyMDI2LTA5LTIzIGF0IDExOjU5ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
aW50ZWxfZHBfaGFzX2pvaW5lcigpIHJlamVjdHMgZURQIHVubGVzcyB0aGUgVkJUIGVuYWJsZXMg
dGhlIHBpcGUNCj4gam9pbmVyLCBhbmQgdGhlIGRlYnVnZnMgZmlsZSBpcyBvbmx5IGNyZWF0ZWQg
d2hlbiB0aGF0IHJldHVybnMgdHJ1ZSwNCj4gc28NCj4gaTkxNV9qb2luZXJfZm9yY2VfZW5hYmxl
IGNhbiBuZXZlciB0dXJuIGl0IG9uLg0KPiANCj4gQWx3YXlzIGNyZWF0ZSB0aGUgZmlsZSBmb3Ig
RFAgYW5kIGVEUCwgYW5kIGxldCBhIGZvcmNlZCBwaXBlIGNvdW50DQo+IGFib3ZlIG9uZSBvdmVy
cmlkZSB0aGUgVkJULg0KPiANCj4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNQ0K
PiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoN
Cj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2Rl
YnVnZnMuYyB8wqAgNSArKy0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKysrKysrKysrLQ0KPiAtLQ0K
PiDCoDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfZGVidWdmcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5X2RlYnVnZnMuYw0KPiBpbmRleCAzZTMwMmYyM2YyNDcuLmU1NWZhMDFhZGRiNSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVn
ZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
ZGVidWdmcy5jDQo+IEBAIC0xMzUyLDkgKzEzNTIsOCBAQCB2b2lkIGludGVsX2Nvbm5lY3Rvcl9k
ZWJ1Z2ZzX2FkZChzdHJ1Y3QNCj4gaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpDQo+IMKgCQkJ
CcKgwqDCoCBjb25uZWN0b3IsDQo+ICZpOTE1X2RzY19mcmFjdGlvbmFsX2JwcF9mb3BzKTsNCj4g
wqAJfQ0KPiDCoA0KPiAtCWlmICgoY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9S
X0Rpc3BsYXlQb3J0IHx8DQo+IC0JwqDCoMKgwqAgY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVf
Q09OTkVDVE9SX2VEUCkgJiYNCj4gLQnCoMKgwqAgaW50ZWxfZHBfaGFzX2pvaW5lcihpbnRlbF9h
dHRhY2hlZF9kcChjb25uZWN0b3IpKSkgew0KPiArCWlmIChjb25uZWN0b3JfdHlwZSA9PSBEUk1f
TU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQgfHwNCj4gKwnCoMKgwqAgY29ubmVjdG9yX3R5cGUg
PT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgew0KPiDCoAkJZGVidWdmc19jcmVhdGVfZmlsZSgi
aTkxNV9qb2luZXJfZm9yY2VfZW5hYmxlIiwNCj4gMDY0NCwgcm9vdCwNCj4gwqAJCQkJwqDCoMKg
IGNvbm5lY3RvciwgJmk5MTVfam9pbmVyX2ZvcHMpOw0KPiDCoAl9DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gaW5kZXggMjQ4MGI4Y2UzYmVjLi44MGNlNzFj
ZTRjMjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4g
QEAgLTQ3Myw5ICs0NzMsMTUgQEAgYm9vbCBpbnRlbF9kcF9oYXNfam9pbmVyKHN0cnVjdCBpbnRl
bF9kcA0KPiAqaW50ZWxfZHApDQo+IMKgCWlmIChpbnRlbF9kcC0+bXNvX2xpbmtfY291bnQpDQo+
IMKgCQlyZXR1cm4gZmFsc2U7DQo+IMKgDQo+IC0JaWYgKGludGVsX2RwX2lzX2VkcChpbnRlbF9k
cCkgJiYNCj4gLQnCoMKgwqAgIWNvbm5lY3Rvci0+cGFuZWwudmJ0LmVkcC5waXBlX2pvaW5lcl9l
bmFibGUpDQo+IC0JCXJldHVybiBmYWxzZTsNCj4gKwlpZiAoaW50ZWxfZHBfaXNfZWRwKGludGVs
X2RwKSkgew0KPiArCQlib29sIHBpcGVfam9pbmVyX2VuYWJsZSA9IGNvbm5lY3Rvci0NCj4gPnBh
bmVsLnZidC5lZHAucGlwZV9qb2luZXJfZW5hYmxlOw0KPiArDQo+ICsJCWlmIChjb25uZWN0b3It
PmZvcmNlX2pvaW5lZF9waXBlcyA+IDEpDQo+ICsJCQlwaXBlX2pvaW5lcl9lbmFibGUgPSB0cnVl
Ow0KPiArDQo+ICsJCWlmICghcGlwZV9qb2luZXJfZW5hYmxlKQ0KPiArCQkJcmV0dXJuIGZhbHNl
Ow0KPiArCX0NCj4gwqANCj4gwqAJcmV0dXJuIERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDEyIHx8
DQo+IMKgCQkoRElTUExBWV9WRVIoZGlzcGxheSkgPT0gMTEgJiYNCg0K
