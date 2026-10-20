Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBC606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iJau0Dbu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387D010F327;
	Tue, 20 Oct 2026 07:55:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1530E10F327;
 Tue, 20 Oct 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792482918; x=1824018918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=da4ytu/+9sHgdgG07iq7SndficUoM9bHFR5tNRwVltE=;
 b=iJau0DbuOYEhHmvn6YcyLxUnSDk/08UNgPr5eMDM6P7OtfhtOvg5EET9
 vieW16sEIu3V5wvXDKUHEvJAPp2cpiTZmFs6qBZGTdCGuUCAh1wlLgAWh
 FSSaoGIUjxvBfl1XoOOS2qQqddVSZGdCoIy74hFlz/WHP6lKPS6uMhYdF
 Mn6KSnMvkT3ij/ZkRrdngTlWwqxpHeYDY0UHPQPhgRF1TxfXMh4D/0k2p
 g7hyQjlxz/jRlXSScYtYiLDpSbo+yBAuNsKvWCTfigmOdYDTQ6NL+D7Mf
 PQ62ahEgbq5RKpZ5Ujw1eZncaQac7Zldseo1PnQDAx/muZtcqYspJMTGq w==;
X-CSE-ConnectionGUID: ltjcWhEKRSW/3sVohNqhIA==
X-CSE-MsgGUID: WbvCTU7SRXSGtJ4TWgx26Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1058382"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1058382"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 00:55:17 -0700
X-CSE-ConnectionGUID: Pam7aBDBRg6Tc3LMKwqlbw==
X-CSE-MsgGUID: f+IbsPy1TCO30dCS+HYieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4540103"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 00:55:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 00:55:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 00:55:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 00:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gx54jJ2nMIqMAt8VReA6fjCanH2urxOBE8ycWCkHc8CPVKBzJw5RRI+WOfvR4KYyAaFL3q3Fsh7h0GP/lLIivHLcz6ob28n7JryUkbS/9Zf0kVbwZxnkkiMQ3RcajkGWXmKTFcOrx1RdSMdsv2Guws7uIJfpqoedlR/m8jfaCcE+M7s4F31QipCz3znO5oE4EdHgorYMhQuP2d3/G+vcjjnMg7w5ZXIv/tc81U7KHRs+gVIimyTVBGqpsDtL59YNkcubwAxX4T7YwLN1VBpdFavHtBEJMgY8wBzL7WWyvnCm9YgAsSKZcIx4VYAuBjD61ZZxBqyw6uPWBWWzBSmIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da4ytu/+9sHgdgG07iq7SndficUoM9bHFR5tNRwVltE=;
 b=CuYXb88lSUABNP6D3v6ufyxpQ4PGfl8z3ORJ0qUvsj0R8qKIVFTPig+HLR5ThaO1G1LUzVMCIs2aR8UDJ0eM4kJWyFFj2IApImE2G6KFciovijDEm1AaSoB3PNyMBzElxfaHJzVCoBAlzwE0eN2QeNFiEttplZQ24msjn4btOeGIqWdPZjWR2rOzWCNIzcHmMLHrhDoO9PlpMIUTWQTkB3TPlFFVvlB9HyAu2xXxtZILo9Yc/VM6B8676jItdTVYRGUyJMTWdswc9wYV63cID1ego0C6jf7zUl6Moj6bsofClZg9286y1+jQIrCihdB7v9OEZj+Clgy7IEsVcLNokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Tue, 20 Oct
 2026 07:55:14 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0522.016; Tue, 20 Oct 2026
 07:55:14 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Thread-Topic: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Thread-Index: AQHdVjbCLSRiLaGB10Sxp/I/rx57u7cFG0aAgAEI9wA=
Date: Tue, 20 Oct 2026 07:55:13 +0000
Message-ID: <c988f151789feb6154c728abdb0bb52d5d873687.camel@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
 <20261019160651.584009-1-j@metarealtyinc.ca>
In-Reply-To: <20261019160651.584009-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6076:EE_
x-ms-office365-filtering-correlation-id: 4fda422c-da64-492e-1abd-08df2e7f794b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|11063799006|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info: i7pn1S6Ir+OXuyPhBFjhq74YtzL7ogUowmbSb4LZPaT9X8T6IFB2ZAPav6oakaABaIhOk+V5qzOcQMjeXpn3excReq/FI9771K2xWt4UaQF/V+iCV8mHZxjURW6QcPAdUA08eaOBOe8xVCP74DRpnKV0f7J9evKfKPfElcBgobJSFO9mMX6feXSsghtPggdcLZ+hMRSduDBLfkSmdtpdgG9RJWoZwBrMm+U4298ZlfpUHnQw+xsBWiBs07fZ601AZOi5C/0fw4zSTSMoL7kKnJKnY/SAE9JsHAHfIp564JhujIRGbHfG4PIl5axci6/2yrGHLOnMPWtdkClpGK284sJylDaw8GqoHLlcjaBUKwo3SRkjpqydXiXlY8q+YbgyZLewZUBNdr1lRJMGt0BFHrA5ap0C5fRiL569Z8ovrzAQ5FUUnj+xZgSBMh2GtLxUa80tsXZhjmBAWw3vUUgq9iPGyKc7cDjriVyOMOAHkuFgEyj+7oDalIshsYuCw8cexlghhIHJjM+vjIt8CufRfUhw64jHmt965zRNmP4wCq7PeuJEe3RgrE0kFX22e/+WGtAkXeFpSMHGSHyF7vu41DHwUSXdeUsyDtyHGiwjdX3dtwjRL+1jjFqETAx0GyNV5zfZBqdUfElLNMDkDeibHBv7KHv6UAEkk+K3VjTLAkw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(38070700021)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTBkcTlxRTlDS2hhUW00UkhhZlkrNmYxQ2JNVEhac0J4ZE95N2Y2ZFZEWUdx?=
 =?utf-8?B?elg2TmROUU5TaUdDSWFyVmdsdWZKOVhRNk95c2doQ2ZBOVovbWgwSFZQTFRX?=
 =?utf-8?B?YlZ0OThOSTl6bzF5RytNeDl0bTJySXUzeExhR242MXZiYlJPRlpBTzdFODRj?=
 =?utf-8?B?SHVpQmdFMGFkMUo3d1VEak9UNzh0NlJkV2hrZ080MU1OSmlOOFkvT0wxYmFs?=
 =?utf-8?B?WmY3Y2JHUE9yeldNcjF5WndJSk9xSmExRCtLMEh0SkNYcWVLK3RyYkdHM3dT?=
 =?utf-8?B?NHpXUEY2MEVTRSt2VUhFdGNwZHZNRWd6UHNsY1RDbURNV3VCNHVGL25oNFFw?=
 =?utf-8?B?UlEvVDdqNmE5VFgxemprd2xJTU9oc2lBRnE2aW1UUXNPMmMwU0V6VnBMd2Rw?=
 =?utf-8?B?OTRyM3E1YWY0c3FQOWc3Y1l1YWRlczVkUFhaNTNvV0VjTUY1MUZ0RXJKbEQ0?=
 =?utf-8?B?NHFId1I1SndxblNCUmYzb1o4UlNqUElRdHZzQU1JK1hYaGNNTWhLZnB0b2JS?=
 =?utf-8?B?R2c3UUNrUytMcmpxSzJlMEY1VUpEVGRUWVoyeHFCaUNtL1pza2I5RWJxUkVL?=
 =?utf-8?B?aG83V1l4aitVUHZyVUsxdmFwbE9oN2I2RnViMkQxemVQbzl1ZHBxQ1ZIMXhG?=
 =?utf-8?B?VWZXSnBYZzl0QUEwVjc3Y1pEL3E1L3BoVGNlOVVlYVVkL2g2QjE2RGRESE95?=
 =?utf-8?B?RlRVanBXL2tQU0piRHVvcmFhbDAzY2g0MnhBTW5WdHJqcTBXd3BpaVkrN3d1?=
 =?utf-8?B?NThPU1ZBbzhwOWZQbzZjT01nQ0l4ajRQQmJWcXcyTTRrSzQ4OVdEKys1NFk1?=
 =?utf-8?B?b0xRTHVJVHlwamJEU25nYWltZzJRc0hzWDFvaGtNT1padWdJaXdHMGUzZWdZ?=
 =?utf-8?B?OXZ0MDNNMnljY2phUGpFdHptNnhTb2ZQT2ZnSUVBSVlTbVFaQ3g4YW9MZ3pB?=
 =?utf-8?B?cC9FM1MxRE9XRUcwRmhvd21wdTdGLzRpYThPRDdKYzZDRXFFbm9QVDMxdXhh?=
 =?utf-8?B?NGJsSGJqd29YdU45OXM4MlJNV29jb3NXaHpHRWdjQzEybDdtdWQ3K3ovRndB?=
 =?utf-8?B?aHZITjBZY0FqWUNlRkRxS2ZZa3lkdFhsaDFGOFVLeXlaR2JUWVI4bUd3cUlO?=
 =?utf-8?B?QmZiajdVNWJlYWU0U1FvU0JDeE1RbXpaR0FLRXpvay9Jc0p1VVg0SFd6bHJL?=
 =?utf-8?B?U1NEUmRoUDhYdVo0K0t4WW5EV1VudFprWk1lUmZmZjZ0RFlaazE5LzM0VXFm?=
 =?utf-8?B?aWpoRDUrZnA0c0w3YVF5aEZ0ZC9rUHdIMFI4TU5lb0Jtck9lOE9ZRGkxdTNB?=
 =?utf-8?B?aXNlV0FESWpHK05sVC9jU2JwUHRwTWRUSUY1S0lrcWcrQzloRFJvU1VYNmVn?=
 =?utf-8?B?OFFFbWEyZ0NuNlFBbFJHZHVKdTJ5V3FyTEw3bmJvS3EwTzErYkFSUXRHZ3Jl?=
 =?utf-8?B?eHRUUERVK29DTGZmTWc1T0JENk5kbktQcjZYNlFZbGVJV0hNc2NYckY3QW9R?=
 =?utf-8?B?c0JnRms4MXg4ZXRBOEhIQTg1Ryt3aEIzT3FCb0VwUEFaT05RU21SNkg3SWRz?=
 =?utf-8?B?WnVYWnU4dE9jc0xHdUNvN0ZCYjlaUlpTVUNQbzF6dU1GamVOOHpwKzJNR3Fp?=
 =?utf-8?B?eUxhRStDZlcyWFpoamZvTWlPNXBjRE1DQW9jTEFoeHY4ZlBDa0hFRnNTNzZs?=
 =?utf-8?B?U1ZKdlg3Qk9CSWI4VnovWVh5YjNhNUFkektZZHQ1aURPNjhiZXdBZVJmN0Zq?=
 =?utf-8?B?QldMRFZJVUlVKzh0a29ER1RIbU0rcWJIak5UMGltbXBQeVFQTklMdFZsWGpv?=
 =?utf-8?B?T0oxZGo4V2dtSXBDVE5YNXhZZXZuN3drNUdSVmhGNjBjQ3NGazI5Snh2N1Nh?=
 =?utf-8?B?S0dobFBzRWY0TXlpMjJwM2RQa0xpWWtIWENNS1FxdkV3YWZzSjMxOHdiS1J5?=
 =?utf-8?B?UytseGJtQ2xIUmVTOEtBUjZESnM3RHVuRTJHSFhxRkx6ekNRL0hiNThzTlhq?=
 =?utf-8?B?ajFHTWo0bTdMS01iOHpIY0p1TmhVQTF3Z2Y5SHNGTGw1REM4eFhMSGZxaVVN?=
 =?utf-8?B?YVI3cVlKck5CbytGdGhTQUcwd1VFSnlKaHdVTUZxc2Z1cVJ3WlM2M2hkRUJF?=
 =?utf-8?B?dTMyYkQwdGwvV0gyZmVDM0FQVEZDUjZZVTdkWFQ1NVFyZk5HMXpySFhNM0Ju?=
 =?utf-8?B?TVBIQnlzbG5nUnVzRjVnTmZ3VGh1WjA3WDVNUndBUDRnR2Y4cE13ZDVnOTdY?=
 =?utf-8?B?YUVKYUI0MnU1S3p4NEVHUFhreVFnM2NVYmtSTHRrOVhYcDlDUU00L3k4OXlx?=
 =?utf-8?B?bGxubFcxQllka29FT1F3eXhwUGJ5M0U0aDdsY2x4alpHQkM2enloNU9ja0xK?=
 =?utf-8?Q?A88THDL6EBPsCXEU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F2815FF483CBF4ABBF3FB77614ECF7A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hiYuNpNfOKGk1mTo4RgkNMn4pQEC5zCk/E1BB2HFjVzFvCNo5T2PFFHSxArU51c7a/Ts9wt4cNXTw9K5H5Gzr+UyO9rb6eOzerAVzyrSZ3pXO/Vahq6mCDG3p+nHHixOAn0lfV3gz0Wg0HOPtezx18Jhwly7uMm+6Lo9fHypSpXRBl1oF4v0N6T8dMvREEM9T5QqqOM+lF4ue+CJcvZwo69GqNlAyJLivDjkagjZEnKee+eiJxWn1zu02/83daIV9tgekrmf729c7IGxTPlYezfAJNY2sejjBjChVWIUsOGA+zuHMrBbfZ1Psc5pXAInPjfpwFfOBmtQ91DfeEZr9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fda422c-da64-492e-1abd-08df2e7f794b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 07:55:14.0313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oY/nZlJfBseF+xgNaIge/bAChku4nxyHeHT/QtMOKq9Q5xK4bfqZnzTgvnQis3CdNGfhj9hWcMKAEN1t/UZndiB0pipnpTQ+R8fn34muXC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTEwLTE5IGF0IDEyOjA2IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBIaSBKb3VuaSwNCj4gDQo+IEdlbnRsZSBwaW5nIG9uIG15IGxhc3QgbWFpbC4gV2l0aCAweDEw
NyBiaXQgNiBzZXQsIHRoaXMgcGFuZWwgc3RpbGwNCj4gbmVlZHMNCj4gdGhlIEFTIFNEUCBpbiBQ
UiBBY3RpdmUgd2hpbGUgZnJhbWVzIHVwZGF0ZSwgYW5kIHRoZSB2YmxhbmstZ2F0ZWQgUkZDDQo+
IGlzDQo+IHRoZSBvbmx5IGNoYW5nZSBpdCBuZWVkczoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MTAwNjIyMDUwMC4zNDE3NTcyLTEtakBtZXRhcmVhbHR5aW5jLmNhDQo+IA0KPiBT
dGlsbCBydW5uaW5nIGl0IGhlcmUgb24gNy4zLXJjNSB3aXRoIG5vIGlzc3Vlcy4gU2hvdWxkIEkg
c2VuZCBpdCBhcw0KPiBhDQo+IHBhdGNoIG9uIHRvcCBvZiB5b3Vycz8NCg0KSSB0aGluayB0aGUg
UkZDIHBhdGNoIGlzIGEgaGFjayB3aGljaCB3ZSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgaXQNCmhl
bHBzLg0KDQpJIGRvbid0IHVuZGVyc3RhbmQgZWl0aGVyIHdoeSB0aGlzIHBhdGNoIGFsb25lIGRv
ZXNuJ3QgaGVscCwgYnV0IHN0aWxsDQpuZWVkcyB0b2dnbGluZyBpbiBzeW5jIHdpdGggdmJsYW5r
IGVuYWJsZS9kaXNhYmxlLiBJJ20gZXhwZWN0aW5nIGl0DQprZWVwIHNlbmRpbmcgQVMgU0RQIFBS
IGlzIGFjdGl2ZS4gDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEpha2UNCg0K
