Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A75F513F6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 05:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E3310E35D;
	Fri,  6 Mar 2026 05:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mElkHNa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFD510E35D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772776010; x=1804312010;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I7sGkLpUNtabYx8TabswD5Im4gOmYNjaSc4QpPBiHgs=;
 b=mElkHNa5SCwuNUjvEwaT/t/eawlNJhlA8Xztr7fnPPOLFmrl/R+yxEzS
 VTGDRH/jsvj8WMGUqxtAJBUZij2KH4XerbDo12iqGQTrrO6lXk3v1fWeH
 BmxcQjO1v+thKah7I9KtH0/k4U3dB+GeWisqA25BmqSzXJKbDBjYbHWaL
 ADELopJ253qOa0EABJBFAR13mH4A4J3Q7M0j56NoYO9N1BL+n998Dxhlr
 +XbR4tJIsu1bUznoQXRcD5bH/KrArGpnjtlYMQbp1PFhWxQ8Xgr7HWSJw
 hgvlunUqha2dJAQDpmX3CB4nZNzwcAHes0I3/QPGMWy3DEPxSU0Sfz720 w==;
X-CSE-ConnectionGUID: 0Vc6wNaxT5mY7y413JZbgA==
X-CSE-MsgGUID: ESLaESLIQD2Y0GXnIOg5Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99350483"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="99350483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 21:46:50 -0800
X-CSE-ConnectionGUID: sBIIZigcQtSv39Q/EHf9cg==
X-CSE-MsgGUID: e0QSWx0jSkij4wR/jaQUhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218905642"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 21:46:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 21:46:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 21:46:48 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 21:46:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY1Xj4F8q1LO0HwCcXSd4d3F8hTcMPZCUd3zQ9akNbXuoHA0Kx02qXt50P1zDTBxWWE7B4mU4LE+SJQxh8TfSd6wVZstOvDQO4lL5wjzI22/nONSKPhdlBWeYEHpcZYWJWdWA6cSOQJ+bK7l8xbd0WPFqgUseGkUtiXGERlhoV4MPA5meYIlKpewMOcgI8xvDj34pGZxNdzFnco9ZSMLSgjlL9sEIU9H0mkgTTKZGYMTypbFuoV33xt74ceW7gkA6g9TUj3wUBSyplBnN5MkkqmNuT15Os3cbanFBm52jHT2cYLcaoQcb2myCbnywRhUpEbExfzDTiXM2gFPDr75UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7sGkLpUNtabYx8TabswD5Im4gOmYNjaSc4QpPBiHgs=;
 b=Sf7dpLI6X3SWnNbY1zjY5hGIbiP9jBRF4WPmsBma6V9ubfbePiR1oazZzkI35xZtqk3BrItouW37/7ZL4R9Tl2VNISG5AA1T8DH0qhLvqBfzFgontfxWCtZe3fOTTOUsj9tMeZwoRpomcFsLry8f+l/fcNhqo8nISSgzOx0y89be6A1Su0DLKGsNj2o1FynOe86WOlzHQBOfICZ56Oj3ccKTjn9/xsjDc+lcc8gUixGqmYj6ScxT3uhZbx2SW6sjfuNrgvUF7GgYEpvUBgFQGD+5Z1p/lJpBvP3e64jRf46OdmjH27t/m29yFSdm78FmWr5cda2//O8FPp5pc3WtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 05:46:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 05:46:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Young, Dawson H"
 <dawson.h.young@intel.com>, "Li, Yaodong" <yaodong.li@intel.com>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Zhang, Carl" <carl.zhang@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: RE: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Thread-Topic: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Thread-Index: AQHcrJpYT/18LGrTCUmL3FajpYgyU7Wf92IAgAEHLKA=
Date: Fri, 6 Mar 2026 05:46:39 +0000
Message-ID: <SJ1PR11MB62046E9836AE1872EA717B63817AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
 <20260305121902.1892593-9-tejas.upadhyay@intel.com>
 <3d8e09d5-c82c-4d8f-91c8-6901860cfc6b@intel.com>
In-Reply-To: <3d8e09d5-c82c-4d8f-91c8-6901860cfc6b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: daniele.ceraolospurio@intel.com, dawson.h.young@intel.com,
 yaodong.li@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA3PR11MB7433:EE_
x-ms-office365-filtering-correlation-id: 771d7213-1726-4035-2830-08de7b43bca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 5yBwpSwFwVILU7cx9kg4DIPX8q3hg9GIX3dfv9A/z1GMj1Tr+1x4f2T7SfLfH0Yl2gERHkulOzbpZX1M1VTj+DKHVyGfI9EUfiuH4PwCjZCfysiB1q2QaeZVM64yvhZwYGv8t3BYI5ofvCcF5CVtR2zpWW+boW2t4C0eCheErqGvnSpbM3AXA4WBV3Sqq85YvgFN00n2GxD9COXNPgzo2liC4XiEn2sUDbq9lnuXnqCVlzgrqM/Vo6y3fY4vGGa28jiqRI6rcBNawBD9BrLKoHQpZlJfldibYS5NPKXgeJFhhQ919ugZtUtIj2j8foJDJGqTp+BFWhSzaJWTkudMgQTFjTeOWk3p784Rrak8/q0nXPTseqKIFPucckAPFlQUOwTHvblU/Tw0O6Zfla9Fp0n4W+RE58eVdKeXsy4h/lsQ4PgHwpwPHKwLdYWSvQ7wiJ2L6L5aZM+ds9HBwptknWeRLIBmC9tK87feIF9pGC02kQ6z9GyNFTrR7kNBgpXGWw80XNfzcN6wAYqPhWKFvJN7ExBjA8EQ0nst6wfXfQlZYkqmrIps5evAq/u13jAla4bP7VWrwloQDLXMngUR2HHZc+ghoKsG9zakutVHsZdRPj294Pkc0SDIK5cnKiTo9Up/aYz7wQnpv8aP8rMltJBaZ65mP2h3fqlWbxiH4VGe6oj4PJo3BmWvjlaDXOK70c2TPP2VIHGOmZaKLWTfico/+JQqxBbf4T+jVvuiHHH+LUlmearrV+6cNQYOO4Q63uTRanjqs6U+urRyhY/ww0lJ0iL9AyTMCkBQ3o0xC+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2VLT21MT2JVdzZJYkcvZFNqLzVMZWoyZlV0bEZSQ1VWUE9naGU5ZEdSd2dT?=
 =?utf-8?B?cEUrVzlmSFYrY2VxSlRjbE5jTmpNOVpqRWlVeCtjRmJ2MjkxQUk5QzlsS0pS?=
 =?utf-8?B?SHZDWVZxTFZTdEtGaVJmeTFaRC9OMnJUQkxCWHNzSENYcGwyaGtWZitzRG9Y?=
 =?utf-8?B?V2dhVWtsMGIrZHZiMVN3RFppNXJaNGFPcFY4blRDamV0WW0zZ2JvSG1VVmtK?=
 =?utf-8?B?eHNEMlpSWkYwWEpMZE5hdGNjMFBQYStYa0lVRzdnMUp3YXNUYWlPVnFyQWxJ?=
 =?utf-8?B?OXZPd0NVTm1DbTNLMHV5dDU5cTVVWDcvckNnRnQxWVdkeTNTYzFhUjhJWTFP?=
 =?utf-8?B?eDlhTmVBbGFPQkpNVDVkWEZRcFVwcno3Wi9nSVdBZk82QUhkUXd5SU95aEwr?=
 =?utf-8?B?NHFuWFNDZEQ3a0U2ZlZ6SmxDZ0d6MHFxRitEUXdtWEF5cW1ac0ppeUpOSVp4?=
 =?utf-8?B?Y0hkUFVCT241UGw5WjlVa2plWGlsZmZWeWd3cStyZzAyMkcvck81ZEh1UmVy?=
 =?utf-8?B?MlIxLzNmUTk2dmp2ODdNSmgwUVZmRDlyRkJ4ZUd3aFQyckt1dHBDbjVtb1ZI?=
 =?utf-8?B?Mk8rRVhSYy9QVkVSLzZ6YmZ3bndkMW5hNVhRUmJOdElsUkZHZVhVRFVxVE9p?=
 =?utf-8?B?Z0FZcFY4a0xuZG0zbkFKdTViSkZGOUFMdVlzVlZSY2kweEhOVk50ekpkb3p6?=
 =?utf-8?B?MksrMkUya3p4OU85ZjZud3hVRjZjVnlhQ0l4WWNiZTVQTjlHMnVGNzUwQ1lF?=
 =?utf-8?B?V2xIVFA3eHdzT28xM3RnbERacmtRa2g4cG5vbU9LbGFQU1FmRVF4Z1ZGd0Rv?=
 =?utf-8?B?VlNZMmJwcGkxVGttQ2hrTjcxeXM1TnRVSU5iOTNDZ3pXVThLNzMzL2ZsRktP?=
 =?utf-8?B?NDJVMmNOaTJOMVZCdmxjQTNVOENsWVZRcFlMNzA5MEdYQm9HSjZnYWFlbWxy?=
 =?utf-8?B?dGZ4RGI1TFcwRlB5Y0F1dFROdytXN2t4TFpGOWszaEJVdUkrclVjb0preFdJ?=
 =?utf-8?B?YkRTMGVhU0c0VzN1NVAvYXg1anowSHcwbFdmY0loUks1cmJLelltbjNIWkZZ?=
 =?utf-8?B?VlUrZkpZQkpLUlJtUzZ1K20yRkVRWlpURGtGOHJneE5pNFF6ZTNkOXVCWGZT?=
 =?utf-8?B?eTBXVXZObWVFUWRsUmFqczNmL3RGWTV2NEhHYW9lNTU1b0RueTQxVlN6a2ZN?=
 =?utf-8?B?N01YdUxONVBTdUJJTW5HZzUzVWkrWFJ2WmFXYS90bGpoV3pkYk05anFJa0Vx?=
 =?utf-8?B?R0lFQUtCcTZoUCs3SXBuRW1pUVVIUDdyQjFUYkI1TmNKUk5sbkFudmt0SGJ4?=
 =?utf-8?B?ZWpLQXgwTmdZVmZVa1hSdVNWNTRhaXpHdnpvY0lkZjEvWnBrQSs5enF5V3VO?=
 =?utf-8?B?Q01xanZsV05aNjVESTZzKzRjSUw2WXhBRmZzaFpWem9VQU9EQlYvai93dlNx?=
 =?utf-8?B?Vy9ERHVydWgwTnV5MVhxemxpWE9CWHZIT2xVV0pvalBGWUlUL3VwbHc2ZE85?=
 =?utf-8?B?UmREQ01rYkNlZXkvejlENmpYd0JpbDZFbFk3N0cyZGl1dDdPK1NrR3dJaHBX?=
 =?utf-8?B?L3lSRThJS21sVk4vOGRkcDhMZW4welBMeGJGa3RKSEs3UGtmUi9UOUx6dTE0?=
 =?utf-8?B?cE96eVlLYnhKVVVhcklmakY4TGNmRytUclBTS0VWeTRkMkU4cGR2d2ZodDZj?=
 =?utf-8?B?Q0lqTUZYZXpGeUJ2Nmdzd2RvczNnYlVpa0V4QU5tSk1oRFExTW5OTGZ2eC8z?=
 =?utf-8?B?YWlqSXgrTkY4NzRoaFA3WWd5QkhOK3hvWEhqbXk5SFRhYzF6b29HOFNSRU1W?=
 =?utf-8?B?aUhQWC9HUHU3MTFSS015NnRZN0htclNPYXNUT2NTa0RrVW81RHRUVFZiY1pa?=
 =?utf-8?B?WDRxV3VGbU5QbHQ4S2RxZmxtVVFGNEt1TTlyUU9iZjJaTWUwQTZCcEc3UEF0?=
 =?utf-8?B?WENrOG50SE5IZ2pDYktOMm5TTlNNL0VPdHZ5VXg4SEhFT1JrbDhjTHdFVVZB?=
 =?utf-8?B?OTRIdytBaW9xV1VlVzBza2VIVmlrS2MzejZ2WU5vSmlNbmF3MHBCbG9xUmNH?=
 =?utf-8?B?cHNpTzRHTWNhc05VQ1dTcmRxdFloN0dPNHh2NmRxVE53UmxYTjdRMExTVWtD?=
 =?utf-8?B?UDJseUhhTFZObVdML3h1L0ZWR3NkazNpK0IyekMvaXFsWldOd1h6YnQvbzZo?=
 =?utf-8?B?d1ZOSTFaNU9vckoxRERObnNBT1h1SFBIUldla3lOL3lLYll4M3U0KzFTRU02?=
 =?utf-8?B?bGlvd3BQNEdCL09nMTJpdjN1U0ZidGYzdkpwcTFPQ0Q1K2V4SWY2ellUb2hD?=
 =?utf-8?B?UXd3UGkvTTZocEFFUWJ1ZXpYZ0hYMHRCYVVOVjdYZHBwMnh5bS9WUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771d7213-1726-4035-2830-08de7b43bca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 05:46:39.0988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQ0XSGWKMtsfZ5nq/YA4XMsa58tiq7cgErXoPQUbXSsZd6YrPH5ILFs2oK3cUITEs+KJztiCJ4EfiVCMfoL5QyUjnrHgkdf0HURndKte688=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMDUgTWFyY2ggMjAyNiAxOTozMA0KPiBU
bzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbTsgWmhhbmcsIENhcmwgPGNhcmwuemhhbmdAaW50ZWwuY29tPjsNCj4gU291emEsIEpv
c2UgPGpvc2Uuc291emFAaW50ZWwuY29tPjsgTXJvemVrLCBNaWNoYWwNCj4gPG1pY2hhbC5tcm96
ZWtAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY2IDMvNF0gZHJtL3hlL3hlM3Bf
bHBnOiBSZXN0cmljdCBVQVBJIHRvIGVuYWJsZSBMMiBmbHVzaA0KPiBvcHRpbWl6YXRpb24NCj4g
DQo+IE9uIDA1LzAzLzIwMjYgMTI6MTksIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+IFdoZW4g
c2V0LCBzdGFydGluZyB4ZTNwX2xwZywgdGhlIEwyIGZsdXNoIG9wdGltaXphdGlvbiBmZWF0dXJl
IHdpbGwNCj4gPiBjb250cm9sIHdoZXRoZXIgTDIgaXMgaW4gUGVyc2lzdGVudCBvciBUcmFuc2ll
bnQgbW9kZSB0aHJvdWdoDQo+ID4gbW9uaXRvcmluZyBvZiBtZWRpYSBhY3Rpdml0eS4NCj4gPg0K
PiA+IFRvIGVuYWJsZSBMMiBmbHVzaCBvcHRpbWl6YXRpb24gaW5jbHVkZSBuZXcgZmVhdHVyZSBm
bGFnDQo+ID4gR1VDX0NUTF9FTkFCTEVfTDJGTFVTSF9PUFQgZm9yIE5vdmFsYWtlIHBsYXRmb3Jt
cyB3aGVuIG1lZGlhIHR5cGUgaXMNCj4gPiBkZXRlY3RlZC4NCj4gPg0KPiA+IFRpZ2h0ZW4gVUFQ
SSB2YWxpZGF0aW9uIHRvIHJlc3RyaWN0IHVzZXJwdHIsIHN2bSBhbmQgZG1hYnVmIG1hcHBpbmdz
DQo+ID4gdG8gYmUgZWl0aGVyIDJXQVkgb3IgWEErMVdBWQ0KPiA+DQo+ID4gVjUoVGhvbWFzKTog
bG9naWMgY29ycmVjdGlvbg0KPiA+IFY0KE1hdHRBKTogTW9kaWZ5IHVhcGkgZG9jIGFuZCBjb21t
aXQNCj4gPiBWMyhNYXR0QSk6IGNoZWNrIHZhbGlkIG9wIGFuZCBwYXRfaW5kZXggdmFsdWUNCj4g
PiBWMihNYXR0QSk6IHZhbGlkYXRlIGRtYS1idWYgYm9zIGFuZCBtYWR2aXNlIHBhdC1pbmRleA0K
PiA+DQo+ID4gQWNrZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KPiA+IEFja2VkLWJ5OiBNaWNoYWwgTXJvemVrIDxtaWNoYWwubXJvemVrQGludGVs
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jICAg
ICAgICB8ICAzICsrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmggICB8
ICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgfCAgOCArKysr
KysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYyB8IDIzICsrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAg
ICAgIHwgIDQgKysrLQ0KPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gaW5kZXggNTRkMmZjNzgw
MTI3Li40M2RjNDM1MzIwNmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gQEAgLTk4
LDYgKzk4LDkgQEAgc3RhdGljIHUzMiBndWNfY3RsX2ZlYXR1cmVfZmxhZ3Moc3RydWN0IHhlX2d1
YyAqZ3VjKQ0KPiA+ICAgCWlmICh4ZV9ndWNfdXNpbmdfbWFpbl9nYW1jdHJsX3F1ZXVlcyhndWMp
KQ0KPiA+ICAgCQlmbGFncyB8PSBHVUNfQ1RMX01BSU5fR0FNQ1RSTF9RVUVVRVM7DQo+ID4NCj4g
PiArCWlmIChHUkFQSElDU19WRVIoeGUpID49IDM1ICYmICFJU19ER0ZYKHhlKSAmJg0KPiB4ZV9n
dF9pc19tZWRpYV90eXBlKGd1Y190b19ndChndWMpKSkNCj4gPiArCQlmbGFncyB8PSBHVUNfQ1RM
X0VOQUJMRV9MMkZMVVNIX09QVDsNCj4gDQo+IFBlbmRpbmcgd2hldGhlciB3ZSBhbHNvIG5lZWQg
dGhpcyBvbiBwcmltYXJ5IEdUIG9yIG5vdC4gU2luY2UgaXQgc291bmRlZCBsaWtlDQo+IGl0IHdv
dWxkIGFsc28gbmVlZCB0byBrbm93IHdoZXRoZXIgdG8gZG8gYSB0YXJnZXRlZCBvciBmdWxsIGZs
dXNoIGJhc2VkIG9uDQo+IGN1cnJlbnQgTWVkaWEgc3RhdHVzLCBhbmQgaXQncyB1bmNsZWFyIGlm
IGhlcmUgd2UgYXJlIG1lYW50IHRvIG9wdCBpbnRvIHRoYXQgZm9yDQo+IGV2ZXJ5IEdUL0d1QyBp
bnN0YW5jZSB2cyBqdXN0IHRoZSBNZWRpYSBHdUMuDQoNCkJ5IGRlZmF1bHQgbWVkaWEgaXMgb24s
IHNvIGZ1bGwgZmx1c2ggaXMgaW4gcGxhY2UuIFNldHRpbmcgbWVkaWEgb2ZmIHdpbGwgYmUgY29u
dHJvbGxlZCBieSBtZWRpYSBHdUMgdGh1cyBvcHRpbWl6YXRpb24gd2lsbCBiZSBjb250cm9sbGVk
IGJ5IG1lZGlhIEd1QyBvbmx5IHNvIGVuYWJsZSBvbiBtZWRpYSBHVCBvbmx5LiBSaWdodD8gQENl
cmFvbG8gU3B1cmlvLCBEYW5pZWxlIEBZb3VuZywgRGF3c29uIEggQExpLCBZYW9kb25nDQoNClRl
amFzDQo+IA0KPiBSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPg0KPiANCj4gPiArDQo+ID4gICAJcmV0dXJuIGZsYWdzOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiA+IGluZGV4IGJiOGY3MWQzODYxMS4uYjcz
ZmFlMDYzZmFjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndp
Zi5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmgNCj4gPiBAQCAt
NjcsNiArNjcsNyBAQCBzdHJ1Y3QgZ3VjX3VwZGF0ZV9leGVjX3F1ZXVlX3BvbGljeSB7DQo+ID4g
ICAjZGVmaW5lICAgR1VDX0NUTF9FTkFCTEVfUFNNSV9MT0dHSU5HCUJJVCg3KQ0KPiA+ICAgI2Rl
ZmluZSAgIEdVQ19DVExfTUFJTl9HQU1DVFJMX1FVRVVFUwlCSVQoOSkNCj4gPiAgICNkZWZpbmUg
ICBHVUNfQ1RMX0RJU0FCTEVfU0NIRURVTEVSCUJJVCgxNCkNCj4gPiArI2RlZmluZSAgIEdVQ19D
VExfRU5BQkxFX0wyRkxVU0hfT1BUCUJJVCgxNSkNCj4gPg0KPiA+ICAgI2RlZmluZSBHVUNfQ1RM
X0RFQlVHCQkJMw0KPiA+ICAgI2RlZmluZSAgIEdVQ19MT0dfVkVSQk9TSVRZCQlSRUdfR0VOTUFT
SygxLCAwKQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gaW5kZXggZGEwY2UwYjM3MDRjLi4wYjIzNmUw
OGMxNTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IEBAIC0zNDgxLDYgKzM0ODEsMTAg
QEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3RsX2NoZWNrX2FyZ3Moc3RydWN0DQo+IHhlX2Rldmlj
ZSAqeGUsIHN0cnVjdCB4ZV92bSAqdm0sDQo+ID4gICAJCQkJIG9wID09DQo+IERSTV9YRV9WTV9C
SU5EX09QX01BUF9VU0VSUFRSKSB8fA0KPiA+ICAgCQkgICAgWEVfSU9DVExfREJHKHhlLCBjb2hf
bW9kZSA9PSBYRV9DT0hfTk9ORSAmJg0KPiA+ICAgCQkJCSBvcCA9PQ0KPiBEUk1fWEVfVk1fQklO
RF9PUF9NQVBfVVNFUlBUUikgfHwNCj4gPiArCQkgICAgWEVfSU9DVExfREJHKHhlLCB4ZV9kZXZp
Y2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhlKSAmJg0KPiA+ICsJCQkJIChvcCA9PQ0KPiBEUk1f
WEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUiB8fA0KPiA+ICsJCQkJICBpc19jcHVfYWRkcl9taXJy
b3IpICYmDQo+ID4gKwkJCQkgKHBhdF9pbmRleCAhPSAxOSAmJiBjb2hfbW9kZSAhPQ0KPiBYRV9D
T0hfMldBWSkpIHx8DQo+ID4gICAJCSAgICBYRV9JT0NUTF9EQkcoeGUsIGNvbXBfZW4gJiYNCj4g
PiAgIAkJCQkgb3AgPT0NCj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQX1VTRVJQVFIpIHx8DQo+ID4g
ICAJCSAgICBYRV9JT0NUTF9EQkcoeGUsIG9wID09DQo+IERSTV9YRV9WTV9CSU5EX09QX01BUF9V
U0VSUFRSICYmIEBADQo+ID4gLTM2MTUsNiArMzYxOSwxMCBAQCBzdGF0aWMgaW50IHhlX3ZtX2Jp
bmRfaW9jdGxfdmFsaWRhdGVfYm8oc3RydWN0DQo+IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9i
byAqYm8sDQo+ID4gICAJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYm8tPnR0bS5iYXNlLmltcG9ydF9h
dHRhY2ggJiYgY29tcF9lbikpDQo+ID4gICAJCXJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gKwlp
ZiAoWEVfSU9DVExfREJHKHhlLCBiby0+dHRtLmJhc2UuaW1wb3J0X2F0dGFjaCAmJg0KPiB4ZV9k
ZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhlKSAmJg0KPiA+ICsJCQkgKHBhdF9pbmRleCAh
PSAxOSAmJiBjb2hfbW9kZSAhPSBYRV9DT0hfMldBWSkpKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiA+ICsNCj4gPiAgIAkvKiBJZiBhIEJPIGlzIHByb3RlY3RlZCBpdCBjYW4gb25seSBiZSBt
YXBwZWQgaWYgdGhlIGtleSBpcyBzdGlsbCB2YWxpZCAqLw0KPiA+ICAgCWlmICgoYmluZF9mbGFn
cyAmIERSTV9YRV9WTV9CSU5EX0ZMQUdfQ0hFQ0tfUFhQKSAmJg0KPiB4ZV9ib19pc19wcm90ZWN0
ZWQoYm8pICYmDQo+ID4gICAJICAgIG9wICE9IERSTV9YRV9WTV9CSU5EX09QX1VOTUFQICYmIG9w
ICE9DQo+ID4gRFJNX1hFX1ZNX0JJTkRfT1BfVU5NQVBfQUxMKSBkaWZmIC0tZ2l0DQo+ID4gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm1fbWFkdmlzZS5jDQo+ID4gaW5kZXggMDcxNjk1ODZlMzVmLi4zNzZjMDE0MjM5ZWUg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiBAQCAtNDExLDYg
KzQxMSw3IEBAIGludCB4ZV92bV9tYWR2aXNlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
DQo+IHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsDQo+ID4gICAJc3RydWN0IHhlX3Zt
YXNfaW5fbWFkdmlzZV9yYW5nZSBtYWR2aXNlX3JhbmdlID0gey5hZGRyID0gYXJncy0NCj4gPnN0
YXJ0LA0KPiA+ICAgCQkJCQkJCSAucmFuZ2UgPSAgYXJncy0+cmFuZ2UsDQo+IH07DQo+ID4gICAJ
c3RydWN0IHhlX21hZHZpc2VfZGV0YWlscyBkZXRhaWxzOw0KPiA+ICsJdTE2IHBhdF9pbmRleCwg
Y29oX21vZGU7DQo+ID4gICAJc3RydWN0IHhlX3ZtICp2bTsNCj4gPiAgIAlzdHJ1Y3QgZHJtX2V4
ZWMgZXhlYzsNCj4gPiAgIAlpbnQgZXJyLCBhdHRyX3R5cGU7DQo+ID4gQEAgLTQ0Nyw2ICs0NDgs
MTcgQEAgaW50IHhlX3ZtX21hZHZpc2VfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4g
dm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWwNCj4gPiAgIAlpZiAoZXJyIHx8ICFtYWR2
aXNlX3JhbmdlLm51bV92bWFzKQ0KPiA+ICAgCQlnb3RvIG1hZHZfZmluaTsNCj4gPg0KPiA+ICsJ
aWYgKGFyZ3MtPnR5cGUgPT0gRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BBVCkgew0KPiA+ICsJCXBh
dF9pbmRleCA9IGFycmF5X2luZGV4X25vc3BlYyhhcmdzLT5wYXRfaW5kZXgudmFsLCB4ZS0NCj4g
PnBhdC5uX2VudHJpZXMpOw0KPiA+ICsJCWNvaF9tb2RlID0geGVfcGF0X2luZGV4X2dldF9jb2hf
bW9kZSh4ZSwgcGF0X2luZGV4KTsNCj4gPiArCQlpZiAoWEVfSU9DVExfREJHKHhlLCBtYWR2aXNl
X3JhbmdlLmhhc19zdm1fdXNlcnB0cl92bWFzDQo+ICYmDQo+ID4gKwkJCQkgeGVfZGV2aWNlX2lz
X2wyX2ZsdXNoX29wdGltaXplZCh4ZSkgJiYNCj4gPiArCQkJCSAocGF0X2luZGV4ICE9IDE5ICYm
IGNvaF9tb2RlICE9DQo+IFhFX0NPSF8yV0FZKSkpIHsNCj4gPiArCQkJZXJyID0gLUVJTlZBTDsN
Cj4gPiArCQkJZ290byBtYWR2X2Zpbmk7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAg
IAlpZiAobWFkdmlzZV9yYW5nZS5oYXNfYm9fdm1hcykgew0KPiA+ICAgCQlpZiAoYXJncy0+dHlw
ZSA9PSBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfQVRPTUlDKSB7DQo+ID4gICAJCQlpZiAoIWNoZWNr
X2JvX2FyZ3NfYXJlX3NhbmUodm0sDQo+IG1hZHZpc2VfcmFuZ2Uudm1hcywgQEAgLTQ2NCw2DQo+
ID4gKzQ3NiwxNyBAQCBpbnQgeGVfdm1fbWFkdmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLA0KPiA+IHN0cnVjdCBkcm1fZmlsZSAqZmlsDQo+ID4NCj4gPiAgIAkJ
CQlpZiAoIWJvKQ0KPiA+ICAgCQkJCQljb250aW51ZTsNCj4gPiArDQo+ID4gKwkJCQlpZiAoYXJn
cy0+dHlwZSA9PQ0KPiBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUEFUKSB7DQo+ID4gKwkJCQkJaWYg
KFhFX0lPQ1RMX0RCRyh4ZSwgYm8tDQo+ID50dG0uYmFzZS5pbXBvcnRfYXR0YWNoICYmDQo+ID4g
Kw0KPiB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhlKSAmJg0KPiA+ICsJCQkJCQkJ
IChwYXRfaW5kZXggIT0gMTkgJiYNCj4gPiArCQkJCQkJCSAgY29oX21vZGUgIT0NCj4gWEVfQ09I
XzJXQVkpKSkgew0KPiA+ICsJCQkJCQllcnIgPSAtRUlOVkFMOw0KPiA+ICsJCQkJCQlnb3RvIGVy
cl9maW5pOw0KPiA+ICsJCQkJCX0NCj4gPiArCQkJCX0NCj4gPiArDQo+ID4gICAJCQkJZXJyID0g
ZHJtX2V4ZWNfbG9ja19vYmooJmV4ZWMsICZiby0NCj4gPnR0bS5iYXNlKTsNCj4gPiAgIAkJCQlk
cm1fZXhlY19yZXRyeV9vbl9jb250ZW50aW9uKCZleGVjKTsNCj4gPiAgIAkJCQlpZiAoZXJyKQ0K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS94ZV9kcm0uaA0KPiA+IGluZGV4IGVmMjU2NTA0OGJkZi4uODYyZmVkM2NmMWVkIDEwMDY0
NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAgLTExMDMsNyArMTEwMyw5IEBAIHN0cnVjdCBkcm1f
eGVfdm1fYmluZF9vcCB7DQo+ID4gICAJICogaW5jb2hlcmVudCBHVCBhY2Nlc3MgaXMgcG9zc2li
bGUuDQo+ID4gICAJICoNCj4gPiAgIAkgKiBOb3RlOiBGb3IgdXNlcnB0ciBhbmQgZXh0ZXJuYWxs
eSBpbXBvcnRlZCBkbWEtYnVmIHRoZSBrZXJuZWwNCj4gZXhwZWN0cw0KPiA+IC0JICogZWl0aGVy
IDFXQVkgb3IgMldBWSBmb3IgdGhlIEBwYXRfaW5kZXguDQo+ID4gKwkgKiBlaXRoZXIgMVdBWSBv
ciAyV0FZIGZvciB0aGUgQHBhdF9pbmRleC4gU3RhcnRpbmcgZnJvbSBOVkwtUCwgZm9yDQo+ID4g
KwkgKiB1c2VycHRyLCBzdm0sIG1hZHZpc2UgYW5kIGV4dGVybmFsbHkgaW1wb3J0ZWQgZG1hLWJ1
ZiB0aGUga2VybmVsDQo+IGV4cGVjdHMNCj4gPiArCSAqIGVpdGhlciAyV0FZIG9yIDFXQVkgYW5k
IFhBIEBwYXRfaW5kZXguDQo+ID4gICAJICoNCj4gPiAgIAkgKiBGb3IgRFJNX1hFX1ZNX0JJTkRf
RkxBR19OVUxMIGJpbmRpbmdzIHRoZXJlIGFyZSBubyBLTUQNCj4gcmVzdHJpY3Rpb25zDQo+ID4g
ICAJICogb24gdGhlIEBwYXRfaW5kZXguIEZvciBzdWNoIG1hcHBpbmdzIHRoZXJlIGlzIG5vIGFj
dHVhbCBtZW1vcnkNCj4gPiBiZWluZw0KDQo=
