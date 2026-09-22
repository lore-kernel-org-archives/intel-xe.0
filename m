Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A844BC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 11:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAA510E6A6;
	Tue, 22 Sep 2026 11:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpIIilHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D146F10E692;
 Tue, 22 Sep 2026 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790074892; x=1821610892;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WfYwVIGgm/DP73UsihsIvf9GXIDJXR4tN/vYjnxUzpQ=;
 b=KpIIilHe/+zfmNyLVclV1f5319F6bnEjK/e+N/rzkWchafu5qmvg+xt6
 ag7x9Nq4DJU0XAR0DJ93+lXSzp9QzoWD7XGahNqGZoGYFugg6A8TtZANM
 i9bIDgDI2wbiesyu7iaWiHc6mtO87ltU1a9qAijbrpsT/f1uyEkHkoKRZ
 Qbw4YD3Fnrf9B3vxVhWVq2xzEG6rBFWapbpXHz40q85umrlwF9NhM1avw
 cs6pHratxMPe/BvqKj9/TnstZBN1Q4n77sUq8jkXoMyEqsheYTSWRrv9l
 qXaoVuBltuBkgZ7nawXbi9XUyTxDk7+Vnuy3bomdkHgrMPhs0+8Kezyic Q==;
X-CSE-ConnectionGUID: Tk9R1RadQiqEwAWFL15Hqw==
X-CSE-MsgGUID: 2GsAJMeiRPGIaR9IHQ12Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101328265"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101328265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:01:32 -0700
X-CSE-ConnectionGUID: 1DBMsyu3S9Cvj4oe36VeJw==
X-CSE-MsgGUID: k2/KRyZyTVqkabFukn+a/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="273254636"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:01:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:01:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 04:01:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6ovGm/coKxYCNLFKwNAEYgIBy4n4qgds9B2h9DzmddbVD7KKmSPFZj015GalzNbPo4Wps48OZ3m4cqnlFTqqVmUBQZIHaPB3IFHB1rxoPRsGVK4YibWH2kPONRuXRdhUJEloej69gj963GAHvm0uC4miozg3+91Cj7Lkyblb9chqwr3z4/cws9PBPFqPvM+Jjnc6hdqTq/oWvgd/XXdxWK7nW2cpFAD/N28ChQJbMLC+/k1Jp/HBb4xnjKfEYcBb7UwWHkteJrRtfBcs5wqjZ7hGL8DjX59DwZGNc+ATfH+JkeDy4Bxt5JpDsDOZsCbf7jPz1L1bBuyUhiKSm6UxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfYwVIGgm/DP73UsihsIvf9GXIDJXR4tN/vYjnxUzpQ=;
 b=Ag8RKXbfV6W0I2i6i64Kn5+L9aLNbbzxPYQFxEWEZ2Uh/ZlHr1WyIgCDEd2oj9wJziW9S/QhuQbihdgkanTX/PAc1Mo7tvtyvFiTLW/0hyjhi2PgAPRxrjuAIo+fdlHdLC1/Bu7BVVCutBD7H5ZJXp7E5Xuj+srHiIuuuv00bltqMWLJXrk+ON3p+F+6A3/yKgFlHHcw9/THgDOIZM4NL8+42+XUQsI8JXmc6iUe0sU3+M8taSVqQJz1gSyj04ejnFeZBn9BsbkWWZs2B3OGiXGwIQ0UmA5iMhlxYI0IdI0t28vHREgXKfMCCzmXqQzvQ8kV3lw1LWKQw3+N10ULIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DM3PPF78DCB3A49.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 11:01:15 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 11:01:15 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: RE: [RESEND PATCH] drm/i915/fbc: remove uint16 from supported fbc
 formats in xe3plpd
Thread-Topic: [RESEND PATCH] drm/i915/fbc: remove uint16 from supported fbc
 formats in xe3plpd
Thread-Index: AQHdRhV/P8jb8XV5qUeZ9InRP/zlurbadxkA
Date: Tue, 22 Sep 2026 11:01:14 +0000
Message-ID: <DS4PPF69154114FF392B3408F34666072DBEF832@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260916195602.939242-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260916195602.939242-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DM3PPF78DCB3A49:EE_
x-ms-office365-filtering-correlation-id: b2cab05a-356f-4b98-9d7c-08df1898d230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: QuXzm2sOPa81AyBWgmBEkbdFRHmmCslPx9vPY+QQIK+YBn0pM1fgqUP6Ne5FYo1iiaTYpTpwkuFoJvDyJ3LPO3fd/dCkC429cKbIINUS1krCB0HeJZ+n0amS0xOHU4v1PkdSVE9DzVTMx22UjADjjrxixw+cfmK67Yn9XsXiSznkz+EIghL9jx0oMQa5M0qHtx9gOAO4KscWsO1tzhMr3zNqyHkMRcvrT82jC2XQ1+HaBQuXJmGPkC2NGG86+G0tbAbWrsKqfTxkP6Vv+hOV5fToIMnYm2aL0ap0R5Dgant/1ex+PULkilVzcO+EaAtAtVUQ54TqwZwUOQZrqcrT3yYZM33Wj+oV3yiQULvCjpFbeZ7vg7xta8zM0JgzKc5t2YhI9KCI38IdQJkaooxeAWZybgcJJ6c69KD8QCybObKhc6wSJwXkIHUYyW5ySEMSzf2nJNnFtaRAMUCVxM+uqmz9jR4QAWGGIA5JVX6fGP0gzlNLS+Mzt633GrxosJexVjZzqQnfV4B93XDhn7dLTAAXR+k3zF5z129q8MEi7gncVLvb/+LM4bIbsJDhnbBO98ZVAK3Ioo9pueKuFSP1CgI74a14DsZS/Vfm2uHjv52epGjbtKh7ISWxa1FCUnYaRyjPw6I9Icg1Y5ZkxoMTeGa7fb+TRut65yIofWaPNNthcqGK32oEo9KoJArveQV7ZT8689Gy/04g0MU23qEEKSjPbvovJeCGXECFIongmks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTBnWUZ0OFdsbW5XYVlnS1ltTnZRcU9uTWR6ZnJoenlvakpTVGozRXN5UWFX?=
 =?utf-8?B?ZGIvbmZaN1Naa0FUN1NUL253UjhPYU9wSzZPQmtIU3E1ditkNitTZ0ZmVTl5?=
 =?utf-8?B?V1o2OVcxWDVCZ3NTN0xIZkRqZzMxWURBNTZiOHRaMXFuT3NaZmlOK29SOG9p?=
 =?utf-8?B?YmdXbGJMRUM5RStoWU1hNVJKR01ld1NQYUVIQ3ZZWGNVQmhXMk5oc094WUN6?=
 =?utf-8?B?ZzI0VCtpbklhYWFHMy9HbnZONWdIb3VOSSs1U21oSm1uWElHaitlZEhSVWJ3?=
 =?utf-8?B?SlVENStHUTQxbS9sWGJIbnRnT1BIb2ZWSmdQTG93TllIVGRURUp0dEtTa214?=
 =?utf-8?B?S0dLcHd4emFEMjFCRlU4anh6TWlTcEtadFdwdlYzTFJGNG1IcU9lajNxaXkx?=
 =?utf-8?B?Q2pCam9zN01SdHkvUjNiaytlSllRQmlCU3pvd3J1RFJNN0lZRytXTWd6UERJ?=
 =?utf-8?B?NksrdHM0czlRVHRRMVk0WDhSaFVXbUdZWEFWRHBnUnpPWnM0TTVBMitqWHNr?=
 =?utf-8?B?VFlSNVhGTFgyME1yeHpvYnJsVExvaEttdTB6NHdCREszK2ZVUThYRTMvV0Ew?=
 =?utf-8?B?KzJYMjFtMTZLUExoR0pDdFIxYUlKaGZoTTd6UzVYK2JZK3JvQURlZjFCS3JK?=
 =?utf-8?B?eWM2dnM3Y3JKNzVKVkc0RnhYdzN2R2U5c2JoMzYyTE12YmdUbTJ5L0JNR3Y5?=
 =?utf-8?B?MWRHRTV6WWl4enNxMnB3UFk4TVNFZzNtZFVkQXljaGVxZzRSTVZ4d3FDc3E5?=
 =?utf-8?B?ZUIzOUhFd3lmZS95VGNRalk5UjZ5R1l4eS9SL25MVmFFUEhsTHpqa3Q3OXdF?=
 =?utf-8?B?dUFjNzJDUG44NlhDK1pUeCtwL091eTlSMTZDeERaWFFnNG43c25teS9tU21H?=
 =?utf-8?B?TlJpNTFDYlRKR05YbTdSZlNTQjc3dXB6ZEFKMmh6aFhMU3ZNUTlVUlZXcDBl?=
 =?utf-8?B?S1lHc0MrenN3a2hsdWg2TExmenVKVTlMRUtNYXJoc2ZRckViZU5Ca1Awaitu?=
 =?utf-8?B?VlJIekd1eVp4aGhwU3Q0SzJwU3hqMmRCWUs4aE44YWdwOVI5T1lHR25BakR4?=
 =?utf-8?B?RGJVNkxCcnl4TmYvK1duTlVlVi8zOUhid2RDTHBab1lqQjhmVEE4R29yYVVz?=
 =?utf-8?B?c3lreGtveDVCOWxSOHJqMkdPMytYOVdSbjJQNjFvaHFLR1BMKzh0UCtFUDV3?=
 =?utf-8?B?elNoM2ZqcXNjWHhISkpCY1RYL0FQbFNwTzdqeXFTMWE0U2t4UmVGTEFBb2RG?=
 =?utf-8?B?akYwUUo1M1g4SzVnMHl1SDUyYUc4SllzYy9IVktPaXhjTGZkekh0aWVGMVVx?=
 =?utf-8?B?Q2pQa0pVY2tvQ085MWJIeklSVHJ1TU50SzlEeXBLSWgxWDc3MkVHRk0yQlI4?=
 =?utf-8?B?bEdXaVdzdEtMbytWdlZWcVVJZ0JMY0FIYjhkYlZ2RzQ1aDNWTytNSXcxMTZ2?=
 =?utf-8?B?b0ttTnJCUUFMeWpCR2syMzdHSFJFazF1bVlZN0lSbzFxN3VvWDlvMXlmZ01h?=
 =?utf-8?B?ekNLUWR5em5yaTNIdjlvY3V3TjdSaEpxRHRPMFpjYUJrUURjempjSXRFT3pS?=
 =?utf-8?B?TWZVYjhqTkUzZENnN2lNdVFnNElwWm1HWUhpNk96Q3Y2ck82a0Z4L3R4cXNR?=
 =?utf-8?B?UnlnQll5djlxYVdFbXZ3d1ZaWUVLMXB6N0NpbWNqdC9qZ0JCZjlKamRCMWU4?=
 =?utf-8?B?YkxmWitLSXlmOG9IZThuWVFuejlGR3RFaDBjR0FMWU1idkxwTEFWcmN6MnFO?=
 =?utf-8?B?VUwya1ZodzdXVndRYm5hSE5hRVFhaFVRaVZuZ0JVVnVjSEJqdnhoL1pQNlBB?=
 =?utf-8?B?Q1dyaDh1b1FacFF1ZG91NzVuL1pyUmFPZnRCRDBhRDRIQXFyUWtpT1BLV3dL?=
 =?utf-8?B?bmh6Wk04bUxua3VHbDZtQllIYkNGNzBtWnRqWXRXWFNQUEs1MXJnbEl0UktI?=
 =?utf-8?B?ZG11VWJOMkZ3MHVUSUNBcXA2Tk9qditlWlRHaTl3K1pjWFFnMGU1ckcvUkxn?=
 =?utf-8?B?M3AwOHVUZHh1TVA4SkJXazhmbHllUVc5eFRaekJsaEVTQzlBd2k3c05mRDM4?=
 =?utf-8?B?OVRoWHhwTGp4UkJhRHQ0WGJrMXN4RlovTG85dlNPSS9xSDZkbVV2ZUo4U2Vt?=
 =?utf-8?B?WjNCbEl1YktZVm5qL3d5SXUwNlJDcWN0ODZzRWNob2xlcE1URk9CTytRd0U2?=
 =?utf-8?B?cXcvSzM0ZXBuWHFvMDRrQWE5NWF6ZGFFQzhvMWFrcG9wTUZ0anJLR3lBay9z?=
 =?utf-8?B?MW54YmtJdzgveStSN1ZUME9hNk9jb1hlZGFYaWJxM3J0ZnFIejQ0SU1qeCtX?=
 =?utf-8?B?VGswRjZ1d3ZraW1EbTdlQkhvT1BVS3hpU3lsMDNURE1DUWdFRjVNUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NJP5dcRLkHdKFZoeVkjmf12VvwYFRjw/Haj2zDQXsiyFLP/MHXtqXkaxsty6ITbouxsL7xHLp49KPCC5kGTPEtlyRAifopevVVyBInvlb7vgZiBnAvnSyHFZYPC80RP5fIYVt7pQgyoZ7P2O26F6BQgHiRE/3xhYW9K8PG7JJ5RKCC+dsOU8V7mkG4889xc/8glUbbwp5Anq6XfwmotHasSdwtHtiU2mNVXY0qlD8Xz8PlXFtn+9pSGK/aRq/snu3PckN1SFx3AUww1MpJu9WA1Y3NIElo7khF7wxw/1TcHHBVCSHz2FbkLFBC3onh6gJvBnkUyIpqra9EN66ZeOiQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cab05a-356f-4b98-9d7c-08df1898d230
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 11:01:15.0052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHYjt+Wlc8AkpriKFGI96qHresjW6AoPqhEsTXRokf+mTAa7uzhYlR3VpJYmZZqSHSflcR/d3zy1z8IhI/ajzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF78DCB3A49
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaW5vZCBHb3ZpbmRh
cGlsbGFpDQo+IFNlbnQ6IFdlZG5lc2RheSwgMTYgU2VwdGVtYmVyIDIwMjYgMjIuNTYNCj4gVG86
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogR292aW5kYXBpbGxhaSwgVmlub2QgPHZpbm9kLmdvdmluZGFwaWxsYWlA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUkVTRU5EIFBBVENIXSBkcm0vaTkxNS9mYmM6IHJlbW92
ZSB1aW50MTYgZnJvbSBzdXBwb3J0ZWQgZmJjIGZvcm1hdHMgaW4geGUzcGxwZA0KPiANCj4gQXMg
VUlOVDE2IHBpeGVsIGZvcm1hdHMgYXJlIG5vdCBsaXN0ZWQgYXMgc3VwcG9ydGVkIGZvcm1hdHMg
aW4gYW55DQo+IG9mIHRoZSBkaXNwbGF5IHZlcnNpb25zIHNvIGZhciwgdGhlcmUgaXMgbm8gcG9p
bnQgaXMgaGF2aW5nIHRoZXNlDQo+IGZvcm1hdHMgbGlzdGVkIGFzIHN1cHBvcnRlZCBmb3IgRkJD
LiBTbyByZW1vdmUgdGhlIFVJTlQxNiBmb3JtYXRzDQo+IGZyb20gdGhlIHN1cHBvcnRlZCBmb3Jt
YXRzIGZvciBGQkMuDQo+IA0KPiB2MjogcmVtb3ZlZCBhbiB1bnVzZWQgdmFyaWFibGUNCj4gDQoN
CkxHVE0sDQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29t
Pg0KDQo+IFNpZ25lZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFw
aWxsYWlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZmJjLmMgfCAxMiArLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZmJjLmMNCj4gaW5kZXggZjYxYjRhMjE4ZDZlLi41Njk0ZDIwNzczZjggMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiBAQCAtMTE5Niwy
MyArMTE5NiwxMyBAQCB4ZTNwX2xwZF9mYmNfZnAxNl9mb3JtYXRfaXNfdmFsaWQoY29uc3Qgc3Ry
dWN0IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkNCj4gDQo+ICBzdGF0aWMgYm9vbCB4
ZTNwX2xwZF9mYmNfcGl4ZWxfZm9ybWF0X2lzX3ZhbGlkKGNvbnN0IHN0cnVjdCBpbnRlbF9wbGFu
ZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ICB7DQo+IC0JY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+aHcuZmI7DQo+IC0NCj4gIAlpZiAobG5sX2ZiY19waXhl
bF9mb3JtYXRfaXNfdmFsaWQocGxhbmVfc3RhdGUpKQ0KPiAgCQlyZXR1cm4gdHJ1ZTsNCj4gDQo+
ICAJaWYgKHhlM3BfbHBkX2ZiY19mcDE2X2Zvcm1hdF9pc192YWxpZChwbGFuZV9zdGF0ZSkpDQo+
ICAJCXJldHVybiB0cnVlOw0KPiANCj4gLQlzd2l0Y2ggKGZiLT5mb3JtYXQtPmZvcm1hdCkgew0K
PiAtCWNhc2UgRFJNX0ZPUk1BVF9YUkdCMTYxNjE2MTY6DQo+IC0JY2FzZSBEUk1fRk9STUFUX1hC
R1IxNjE2MTYxNjoNCj4gLQljYXNlIERSTV9GT1JNQVRfQVJHQjE2MTYxNjE2Og0KPiAtCWNhc2Ug
RFJNX0ZPUk1BVF9BQkdSMTYxNjE2MTY6DQo+IC0JCXJldHVybiB0cnVlOw0KPiAtCWRlZmF1bHQ6
DQo+IC0JCXJldHVybiBmYWxzZTsNCj4gLQl9DQo+ICsJcmV0dXJuIGZhbHNlOw0KPiAgfQ0KPiAN
Cj4gIGJvb2wgaW50ZWxfZmJjX25lZWRfcGl4ZWxfbm9ybWFsaXplcihjb25zdCBzdHJ1Y3QgaW50
ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQ0KPiAtLQ0KPiAyLjQzLjANCg0K
