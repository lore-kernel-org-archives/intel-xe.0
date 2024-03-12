Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503FFC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 23:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF75410E0A7;
	Tue, 12 Mar 2024 23:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKp5Uiok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448D310E0A7
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 23:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710284549; x=1741820549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XkhGLvbir1XFrZ7Mf6z/4oKcmhCGLKEKQBApX9nJBvo=;
 b=MKp5UiokHNIyz802pXfihaf616Kctgqyin7uumd2fUQktUUxMssYh3Xx
 fa1AARU8KhsKva9r9UOXrrVM08pUcPzou1q4j8wJBmPx1yuyZxOq+xQ1D
 kOoJukH1xjKr8pXdFNW9Yi5BdNwqgdwv3PyfCP/Et8UvsgWd68dvyDCQ5
 hkp8VXVupoNgIBWOvtyLlqjnjhRKxmEqlUO3UDSFMEKvAZgvqQDEEq/2L
 71ALAD49pxWD/+klok9sUAhYpXU50B01UT3tYQubcrZt4zr8GacHcg7SF
 P4zJ2+nrRTUCHW2sEVClm4/qSCVKvPxTtyIKIujvHmOWABPNVkDZmxLht Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5152155"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5152155"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 16:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42700216"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 16:02:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:02:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 16:02:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 16:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2wKRjdqES77IJrvuIIZ6ofiX1CXEaUByNNPREylyHNoNVA1U6G2+cci1oQXEnTCCMIg709iL2GvJWGacz3L9xvjN2WEH3kNsBxvoT+AKLUNizWr9C4eGVu0CH1XgC3YQ+6cmvPFB8vWszFnwWlKhlzURQLOrGXndtZyA3Cuz79GhHFNitipKiN80P4476Wmk9lTyqeAJeUfLD94vFYO5I37YLMj25LvrITuD4rMfB44dzqTWNS/i3PFrnIyue0ECtFgp8OycthD378IQnxuDpyfPvPwNb3d5o5pi3ooq7sbnbAwA3en2CpFVcNpAjY3DwB/VGsA9qWDAR20mBbD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkhGLvbir1XFrZ7Mf6z/4oKcmhCGLKEKQBApX9nJBvo=;
 b=Ut+SQHoP6ypVicZ9xak2p8kJeE2nT/+45kniTggt15FKIo3SOPyu1QMReWJ6eG1+LhQotIJ+8cuXW7+JMnmviTLYQBe8xkvi8S22UzDcrZqzkSLsgj+9hdSNrJ0GZmu+rNNisdyYxzjX6LHybMjkQ8c0dwfZCywDiSLLkghebQgMZ1ayCcJygc0CogGtGVH84SodNf1euI5gRIugWqmDWtucBg1ojZpx9zW7YKZNdGCkvvHGZvLmLeuZvv2uQdDeH3bP3z/whc577Sw1MvRUKQ95i0Ey32MepLyOIvenepHJYrp0vOVCW/PJJAHGDDnicIrMDHV4ZvG+ZpLiGhY/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 23:02:20 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 12 Mar 2024
 23:02:20 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: Separating xe_vma- and page-table state
Thread-Topic: Separating xe_vma- and page-table state
Thread-Index: AQHadFDywx5K1cRH40+OxAMGoL7g0rE0pF2g
Date: Tue, 12 Mar 2024 23:02:20 +0000
Message-ID: <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
In-Reply-To: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB5109:EE_
x-ms-office365-filtering-correlation-id: 950f9e2c-c038-4382-ca96-08dc42e878be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opNAXWZal6gMiR5Qzz5YyHfdw5BolDX6Za+9saFFH8pulCBB9xM4nhMzE8vcotZRE6O+Qh8pmzTCauDmPMjpBbVaCTPxxYoH3vZ1QayMXvEYgBnTtS5McdMk+ogqhONgyXvk3pNTsRRRh8QDqfgzNlgQHvfm60V6Vjwj8DaeGY2+2rmnm7ZI9qP91UYdwWiOLTy0YA1SzEV8Rteoeq0rz/8O1+Q1qAfgUfejL3Mqo3WhxS0f/kMIqNHQgEUU5V0Yc9Vfvu3r+suC+Ntr+SVlGhtaiu1iPRbU74J7bAQEDMvnL8eHuuGn8PjUbZKtcbmPAN8GoaKrUj1OD84GYrq7A5zoNZhaUQGokouG+uYH6Li4mdn1GkgrUiIViVA/S6iOFLr49wNdHcmXjH2aP84lhWRN0V4cCyVIEkDVGUD24/FkpiK1GVtR0XiEYd3KOYfqHgX5VjFwrVtQQez4AF/yrFV84x46/vnCAW7/hUaw9ZlIK5AC0MDAU6g+/1h8vZrF+M47vkf4+F3kuu4lskjKynJCEL7B82jBRHNuy0qiMNyQ7pqAh4Yb7dYbUZjCH/+J6wZQkfOogKLOWmhPBrreafH73ggdc7p4hMVg9NNQmBmbidgWB94QOl0sMHfrsrWcUij0vtIX6kQG9J3DViKXy350AyxtPOIYyGnwmvLSDtM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGlGcXlNVnJOVGxyc0xRRHNGOEorNnJzNVZ6clRzTmpUZ2JUN2ZyclZsMVBQ?=
 =?utf-8?B?UVROemcwOUlpOU9uWVZqSUFuazNnUW4zdHUvMUR5YkpDTkxiNWRoZWE1ZlV5?=
 =?utf-8?B?UjNjdDJTWm5kZHJoNTJhcklyeng5RlFudHJGRWNhTnlqZFJCYVcyUm5rZ0xF?=
 =?utf-8?B?NjNsaTc4RFI3TFo4aDByaDdKYVBNNXkwb2dKTWRFcUZBSG83RmJOTURXN2xE?=
 =?utf-8?B?V1pzbGJqVExWdlAxWXZpLzBYS05rZVE0RkRXc0QyODhxc2xqSlAzcTlpdi9D?=
 =?utf-8?B?OG5DdXlzQ0NHbjlGY1czWmFrQzVTWTBNRUs3b2tOQ2pNUFhLaUwyN2VzREow?=
 =?utf-8?B?N1dya1hPcXppeGttdDB3eEJqNG5LKzVhTnR1RWk0QXJsSW9CbG1jSmtWaVVa?=
 =?utf-8?B?MDJPTngzV0ZyNE9sV1hPTVQyY3BRdk5kcWx2TXkrb05oQnB1WVdNMzFDNmh2?=
 =?utf-8?B?Tm1oMjRwSjRrMWg5RzBieFlMOTVwY2trTDlMZHpkMkNyd3JtSHdEUm1welIy?=
 =?utf-8?B?NDhHZWVvd1cxaEVSUU1tOC9Oc3o0QWl6MnVLMk9aeENneVllS3RIUjRpRUpI?=
 =?utf-8?B?WEppSldRTFNQWm0zbDQzM291ZnEzNnFrZTJpenVxSEpzOTlWWXpxanZEVTNR?=
 =?utf-8?B?SC9BQzBPcjlrY3VKZ0ttRW4wQ3ZKU1JrWG1ORXJuYnZYTlpxNVdUVy9aNnNa?=
 =?utf-8?B?QlpLYUpoSVdmejRFaldVUVM3YmJLczBoY2pZdVJuNDB3cWJnRzVKcFpkSmtM?=
 =?utf-8?B?N3paRDJaOERIcXlXZEIwK2hKZitSaFh3N1BOeENMb3lTMWhrVkJ0RjJJRzl5?=
 =?utf-8?B?bVJzd3BicUIrSWx3c1NOV2VKQWhqdEk3RWhDaEtMa3hYUy9DU0R5a1hKNXQ0?=
 =?utf-8?B?OVJYd2Y5QnNRK0kzdllJeWREUnBmMFU4YlhSUmNBVEhmN0N6anN0MFJTRExV?=
 =?utf-8?B?ZDczZXhyS3FpeUt4YnNVUmVRaUFSUnIrUUgvSnJxYmhjaUkrU3U0b0k3OEYy?=
 =?utf-8?B?YnN2MERsaW5KeHRPellCWC9WK2xWZURKREZZM1BRRkowNmxrb3hYZjVseHZO?=
 =?utf-8?B?b25wSjBHekp2dFhNREhyTHNPVWEvcktGbXdjeFF5KzdZYkxOanlJZ3RMRkpO?=
 =?utf-8?B?SXM2RGlDRm1lbnRkcjdmSllBaWMrMGswT3hpRUdyT2M0ckgrV1cxSHpVMWFa?=
 =?utf-8?B?ZjFTVzRRK1JiVWNVS1E2Tm94em1lMUpJUklkSW54TWFlNWhQdGxORGRhVUhH?=
 =?utf-8?B?UzRpUGRRVFhNdVN2ZDM3ak0wM1NwNlpWMlFrcFdVTXJLcG1oajBoZEVjOGlQ?=
 =?utf-8?B?VFVaemYrc2k3djRCMHQwMmlRY29XL0dJSEovb0g4aXNUK2NnQUxQU29VSFJ2?=
 =?utf-8?B?ZUozU29aN3hneUVFVllLUkRjREJTakxLSk5VdlA5WnVvb1NKZmxLSmdDVE4x?=
 =?utf-8?B?TGR5SHJvOHVMQ0J6SjNYZCtDRTVhVnY3V2dZSWZ2SkJPUk4ycFRzcWtzSlp5?=
 =?utf-8?B?OFVVQ1BaMEpMc2RCMm5Kckl4djFqZXNVeWVFV1BQZWJPWGVrRXRWUk5VU3N4?=
 =?utf-8?B?bGplZWNqRmVZd3VvRWhvOFRWUTZ5VTgwazU4alQ2NjZHV3V4ZjRya2xYV3Y0?=
 =?utf-8?B?N3ZONHFVWlFxay9lVXhNbmJpY2VTMHRCdlJxbFNxTURpUWFpV3FaYzRHL1Ni?=
 =?utf-8?B?bXZUTUkwek9pcDJqN05CRUdwN3U4M2I0YUU3TUt6dG52VFhRa2ExaUREY2ls?=
 =?utf-8?B?ZTloNGY5Vk8rdVBEN3VHNmhxY09nYlJ0amk4c3pCcXNnMkVzckRDdUY2c2VJ?=
 =?utf-8?B?eVVIZzBOcDI1aFNSUFgxcEhiQWtCdWpYWXVValo3aG9TNWtxREZoeGIzeEcv?=
 =?utf-8?B?V3QwVXJsaUU2dDAzbG5DSHNEUjl6UU9WL2M3K29EUlNETDdhWHJFa092ckwv?=
 =?utf-8?B?ZnFnMnJmQmNkeW12Q0piN1lCUkM1dXd0MytLZldoQis5MHIrNFljZE1kT0FE?=
 =?utf-8?B?eEhQMW9hakUzanJFNkQvZHpUcmV3OTdUK25tZENnMGh3eTFIWG8yL1hJaGtw?=
 =?utf-8?B?dlhoa3dKaWI2ZkhEZm04aHFQa3lpeE01K2JkR291MGpMM0pSQ3ovU05mY05Y?=
 =?utf-8?Q?twU8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950f9e2c-c038-4382-ca96-08dc42e878be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 23:02:20.4764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IB7yYvk+L9TCByx8pR7OfspTO1IR/vY/U8g1B6LVn5eV7WJ45vaXGtY+WSVcpTIaC1jQBSmMqOx9n8T6GCA2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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

SGkgVGhvbWFzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDog
VHVlc2RheSwgTWFyY2ggMTIsIDIwMjQgMzo0MyBBTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5j
b20+OyBaZW5nLCBPYWsNCj4gPG9hay56ZW5nQGludGVsLmNvbT4NCj4gU3ViamVjdDogU2VwYXJh
dGluZyB4ZV92bWEtIGFuZCBwYWdlLXRhYmxlIHN0YXRlDQo+IA0KPiBIaSwNCj4gDQo+IEl0J3Mg
SU1PIGJlY29tZSBhcHBhcmVudCBib3RoIGluIHRoZSBzeXN0ZW0gYWxsb2NhdG9yIGRpc2N1c3Np
b24gYW5kIGluDQo+IHRoZSBwYXRjaCB0aGF0IGVuYWJsZXMgdGhlIHByZXNlbmNlIG9mIGludmFs
aWQgdm1hcyANCj4gdGhhdCB3ZSBuZWVkIHRvIGJlDQo+IGJldHRlciBhdCBzZXBhcmF0aW5nIHhl
X3ZtYSBhbmQgcGFnZS10YWJsZSBzdGF0ZSwgc28gdGhhdCB4ZV92bWEgc3RhdGUNCj4gd291bGQg
Y29udGFpbiB0aGluZ3MgdGhhdCBhcmUgbW9zdGx5IGltbXV0YWJsZSBhbmQgdGhhdCB0aGUgdXNl
cg0KPiByZXF1ZXN0ZWQ6IFBBVCBpbmRleCwgbWVtb3J5IGF0dHJpYnV0ZXMsIHJlcXVlc3RlZCB0
aWxlIHByZXNlbmNlIGV0YywNCj4gd2hlcmVhcyB0aGUgcGFnZS10YWJsZSBzdGF0ZSB3b3VsZCBj
b250YWluIG11dGFibGUgc3RhdGUgbGlrZSBhY3R1YWwNCj4gdGlsZSBwcmVzZW5jZSwgaW52YWxp
ZGF0b24gc3RhdGUgYW5kIE1NVSBub3RpZmllci4NCg0KSXQgaXMgYSB2YWxpZCByZWFzb25pbmcg
dG8gbWUuLi4gaWYgd2Ugd2FudCB0byBkbyB3aGF0IGNvbW11bml0eSB3YW50IHVzIHRvIGRvIHdp
dGggc3lzdGVtIGFsbG9jYXRvciwgDQpBbmQgaWYgd2Ugd2FudCB0byBtZWV0IG91ciB1bWQncyBy
ZXF1aXJlbWVudCBvZiAiZnJlZSB3L28gdm1fdW5iaW5kIiwgeWVzLCAgd2UgbmVlZCB0aGlzICJp
bnZhbGlkIiB2bWEgY29uY2VwdC4NCg0KVGhlIHN0cmFuZ2UgdGhpbmcgaXMsIGl0IHNlZW1zIE1h
dHQgY2FuIHN0aWxsIGFjaGlldmUgdGhlIGdvYWwgd2l0aG91dCBpbnRyb2R1Y2luZyBpbnZhbGlk
IHZtYSBjb25jZXB0Li4uIGl0IGRvZXNuJ3QgbG9vayBsaWtlIGhlIGhhcw0KVGhpcyBjb25jZXB0
IGluIGhpcyBwYXRjaC4uLi4NCg0KDQo+IA0KPiBTbyBmYXIgd2UgaGF2ZSBoYWQgbm8gcmVhc29u
IHRvIHNlcGFyYXRlIHRoZSB0d28sIGJ1dCB3aXRoIGhtbXB0ciB3ZQ0KPiB3b3VsZCBsaWtlbHkg
ZW5kIHVwIHdpdGggbXVsdGlwbGUgcGFnZS10YWJsZSByZWdpb25zIHBlciB4ZS12bWEsIA0KDQpD
YW4gd2Ugc3RpbGwgbWFpbnRhaW4gMSB4ZS12bWEgOiAxIHBhZ2UgdGFibGUgcmVnaW9uIHJlbGF0
aW9uc2hpcCBmb3Igc2ltcGxpY2l0eT8NCg0KVGhpcyByZXF1aXJlcyB2bWEgc3BsaXR0aW5nLiBp
LmUuLCBpZiB5b3UgaGF2ZSBhIGhtbXB0ciB2bWEgY292ZXIgcmFuZ2UgWzB+MTAwXSwNCkFuZCBm
YXVsdCBoYXBwZW5zIGF0IHJhbmdlIFs0MH42MF0sIHRoZW4gd2Ugd2lsbCBlbmQgdXAgd2l0aCAz
IHZtYXM6DQpbMH40MF0sIGEgZHVtbXkgaG1tcHRyIHZtYSwgbm90IG1hcHBlZCBncHUNCls0MH42
MF0sIGhtbXB0ciB2bWEgbWFwcGVkIHRvIGdwDQpbNjB+MTAwXSwgZHVtbXksIG5vdCBtYXBwZWQg
dG8gZ3B1Lg0KDQpEb2VzIHRoaXMgd29yayBmb3IgeW91PyBPciBkbyB5b3Ugc2VlIGEgYmVuZWZp
dCBvZiBub3Qgc3BsaXR0aW5nIHZtYT8NCg0KDQoNCmFuZA0KPiB3aXRoIHRoZSBwYXRjaCBkaXNj
dXNzZWQgZWFybGllciB3ZSBjb3VsZCd2ZSBlYXNpbHkgcmV1c2VkDQo+IHhlX3ZtX3VuYmluZF92
bWEoKSB0aGF0IG9ubHkgdG91Y2hlcyB0aGUgbXV0YWJsZSBwYWdlLXRhYmxlIHN0YXRlIGFuZA0K
PiBkb2VzIHRoZSBjb3JyZWN0IGxvY2tpbmcuDQo+IA0KPiBUaGUgcGFnZSB0YWJsZSBjb3VsZCB3
b3VsZCB0aGVuIHR5cGljYWxseSB0YWtlIGEgY29uc3QgeGVfdm1hICosIGFuZA0KPiBhbmQgeGVf
cHRfc3RhdGUgKiwgb3Igd2hhdGV2ZXIgd2UgY2hvb3NlIHRvIGNhbGwgaXQuIEFsbCB4ZV92bWFz
IGV4Y2VwdA0KPiBobW1wdHIgb25lcyB3b3VsZCBoYXZlIGFuIDE6MSB4ZV92bWEgPC0+IHhlX3B0
X3N0YXRlIHJlbGF0aW9uc2hpcC4NCj4gDQoNCk1hdHQgaGFzIFBPQyBjb2RlcyB3aGljaCB3b3Jr
cyBmb3IgbWUgZm9yIHN5c3RlbSBhbGxvY2F0b3Igdy9vIHRoaXMgdm1hL3B0X3N0YXRlIHNwbGl0
dGluZzogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21icm9zdC94ZS1rZXJuZWwtZHJp
dmVyLXN5c3RlbS1hbGxvY2F0b3IvLS9jb21taXRzL3N5c3RlbV9hbGxvY2F0b3JfcG9jP3JlZl90
eXBlPWhlYWRzDQoNCkNhbiB5b3UgdGFrZSBhIGxvb2sgYWxzby4uLiANCg0KV2hlbiBJIHdvcmtl
ZCBvbiBzeXN0ZW0gYWxsb2NhdG9yIEhMRCwgSSBwaWN0dXJlZCB0aGUgaW52YWxpZCB2bWEgY29u
Y2VwdCBhbHNvLiBCdXQgc29tZWhvdyBNYXR0IHdhcyBhYmxlIHRvIG1ha2UgaXQgd29ya2luZyB3
aXRob3V0IHN1Y2ggY29uY2VwdC4uLi4NCg0KT2FrDQoNCj4gVGhvdWdodHMsIGNvbW1lbnRzPw0K
PiANCj4gVGhhbmtzLA0KPiBUaG9tYXMNCg==
