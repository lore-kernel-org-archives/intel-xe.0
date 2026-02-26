Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA9FC592F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD05B10E8EB;
	Thu, 26 Feb 2026 12:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S11uhgOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296D810E8EB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772107385; x=1803643385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DJOaoRxnkLl/x1HBRPBJH/WBxkKD/abU+ZRqg6MJnJg=;
 b=S11uhgOCSyZbQfLde54t56iUFZ2oeBJpk65vmx2melfpI08kszeLsQPJ
 ukk0fNIAyXrZXyU8WKsT9fxKhL8XZKIBzePyX7/j/AaOUKYiIuivX0PcV
 GYqansxmoxHU0Opjd642y2DVer2mczKQNn38WeFz0uJdQTMCxS5A0BhkN
 +D7aT0pXqjYJa+2/QLBCcOJs6fckLL2uOdY+9af/lb57byLhQknm8KaSd
 ijByoV7w+AwLbgejVCu89KWp8fdx2YxoMuV4+5qF3Lv80KzI35+ix6oyw
 qerb3kQTcpYJ4iqg3XRE7h8l0kAp+qkFhlzrnLDW4G61YoGlq4Sj01Xq3 w==;
X-CSE-ConnectionGUID: cUmMopWhRpmbf6O8wLsCOA==
X-CSE-MsgGUID: RbIfcuv7Q22CPxSQRoD3Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83493938"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83493938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:03:05 -0800
X-CSE-ConnectionGUID: VsOVeZAVTIObT46spMrG5g==
X-CSE-MsgGUID: RseMEj+NQ5iVHbvFFy6Ecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="244135605"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:03:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:03:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 04:03:04 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:03:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWgLBTcvrfZTGq9cJaVqmT6s6UKgDhrRxGGtl5ssulc99j6xKHdnFXVitcG9kTYNinG9AegPF0wDF4zyki4EcU2mU2KmcKoJFI+FdjkWlZrlVDj3zJ4fPzGxAgMleYl+IOFlyUGZU0ZA6w6PTJmUWNok6DtJuBdh6vZ5hw08FG56gYWs3Vz0GE0dWF1+K7E/90j8ijkgmSUfjA/37/r508owUz4VqxQkbwVRygEsDqy/4pNr13bAw6dYtCI6a0bhfLtyPAahOZfo+AELTg5PMFwxFRSMO1KKeo+pSX0438/HdkNDDf+A8QKUY0vnGj/oN3nLwFyM1sBBgkoeFIwxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJOaoRxnkLl/x1HBRPBJH/WBxkKD/abU+ZRqg6MJnJg=;
 b=fjLPOZyHlYWBDaznBOoJI9HODORvMQAwJprR9yFgmi7oD2eMant2CLAUqWy/fIx1X7IKQ6WGaykAmTLmkaD+BhrGxF8JBSzStVKaSCSqXQ2FCEDhq0KXl4UhO8afpcCdWKyYZV0LDqETbRhOhFIJp/14KtPV9EBmURPwXBMHwst6MKAnjy8OyAhlCEzfpEw/GnUsGmoT/eANOEFMny/b09g/0LGcSKhz+x5tKaEFocM2bNCt27gU4VUUM21IMsnviWZJIQiyOvdTDtpy+AiEXs2nk7vZ0bptLP8WIh6Ddgru4SLTuYwZhuiCGmG15t1xfza8/35J2YHJBvIc0UOw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 MN2PR11MB4647.namprd11.prod.outlook.com (2603:10b6:208:262::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Thu, 26 Feb
 2026 12:03:02 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 12:03:01 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Thread-Topic: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Index: AQHcn0w0JZUjpGabA0yL08Ptn+mIFLWU8RsA
Date: Thu, 26 Feb 2026 12:03:01 +0000
Message-ID: <b094058fc7db041332455f1b509af0debb385c8a.camel@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
In-Reply-To: <20260216135107.3148167-4-naresh.kumar.g@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|MN2PR11MB4647:EE_
x-ms-office365-filtering-correlation-id: 0e7b28be-d62b-48ec-e130-08de752efdbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: XzbCxVgmMNev/uogJJjptP7WJk6IIurmMOsssKr2we6oqNbIkCvepb48P03a7nDD/oTVNANBDD912Oeou2uZnjfaCUzqAtZRBAr+HH1OlGCDTaE00YIByrvJxxpXYeh6XSNvk241Oq0bV3x6SS6WewS/l5WLMCk5Yc3p0kxWf7+zSwXKL6wP59/VCb4MtMkYEV9apdbcgmjm9DXkbXj9GdGz4/B83ugUXWs6LaazGuT3LgnBIOqAe8jGUx4lYWCULnMnFYiP9EGLfRei8nNwAD3ytYF0gpJaI8F2UwV9P5qRr0Z6d/4ANQxNkiiM6lCjGtunNzBpDQFTCg0+JIdwTLVIZaONVvudpo2NOkPVSrgt4Hg77uZMh15wmOGM8qHVHCKVSVhg+qty2F0XgDvib3HMBSSVvzBTw1BAtYqFKC/gkVS+oJDQKXjDEducMKg44AgsS9/Wl3X51kFBRJBBen+Y9kUkOdIExfPfEbk+dyeglHBNTO0G3CmZM5RaBA0eOIyCZntGOoJxgjh1VE3Wu9h/cbGyVaac7FEBWeP8tfkdPEiKAzNG4TgG+Xq1EWWqBzWhdZElg0CiLTTm0ynqttJxXflGymR76/iJlJkgz7TFO3+aOfTGaa+Jaey6cFPzUxswB902oo3Xp1KRg3okXJhY8kxe7F52tRI7ZGJKg5CIIprYWSAVpz8hWPXkA+ZiAjOAphc4Fl1mPXQqfP00KiJxXPFK2q1F1yugiMEmmpSnSKY2Jv4TakYvYmX54FLdMcc8ngqNm8pZchOCEa0pISHWDaf0TjUXzSaVLka3xOo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUVRVFZYQkkyTDNNMW5hcUw1eHJxbFVObnV1bjdQcmlxZXRSMVNaVnVXRHhw?=
 =?utf-8?B?aWRwamNEVEdUZ0JCNVdBVitlVXluQTJGakZ3K0RhVGFTVmp4VTBodXZ6OWdU?=
 =?utf-8?B?ZENYNGZOWDF4TDFkRStDZENnUkFKbEZUcEEzWW9sRmR4UUNETTIyb2RQUVBJ?=
 =?utf-8?B?QmdVWTNxWkNsczZjbldpd1loYUlVeG9LamJpc1h2SlA4aEFmOHFHRVVHWW4z?=
 =?utf-8?B?cCs5eWw3eDcrZk9FRVJuZkd3eVcyYUdJSGpuWnVqN1J6SGx4aTlqbnZ1Q0FD?=
 =?utf-8?B?Z1k5TjA2UXJ0dVE2VWRtV3BhQjJpQzQvc3YvU0pSOFUwVXZUQ0lFOTRpQTFk?=
 =?utf-8?B?RHBmS2ZOUjBOWkFManNUY1o0Q0hQZUZiNDE5SmpvUWhPNW1TZ2J1UmJ4OU9u?=
 =?utf-8?B?TEVON3lxU3RRT290TEE1ODJYZmw4MW9MTG0xTmc3cVRWbHEycW02aTRrMWNs?=
 =?utf-8?B?ajFtTE1hN1oxUnlCbEhnVmtBa0lRTmpCWVJzYlJxVllvK2o1SUdiVFY3dWNG?=
 =?utf-8?B?MTJ0WmJyNmxGUWt6NWdGbm45YUsra25MVy9CNmJ6eEkvYml3SU1vaHBXMnhs?=
 =?utf-8?B?d21qM2dpWEZ2d25LYzFJaWRrN3BZVnlLcTVSSktWVXQxczNiTlhxNjBRdzdB?=
 =?utf-8?B?V3FmV25iSmt3bUtHdEtOTmYvNWZQTU5NV3ZSdmtjbWtqNzZUL3piM1l4S1Rz?=
 =?utf-8?B?U3ZXWWtwOUU2eXVPa0NGZHk3QWJEVnBnZ0RuTXRPbXFNOFJyYTY0eG5XVnVU?=
 =?utf-8?B?b1ZZb2RlYnlTRW9UZkx3MDFJNXk0eHdQaDBuVUxFNkJoNlZsekQ3ZmlKenpP?=
 =?utf-8?B?TGxyNjFzMHNJSEYrQjRHajJoN25iaEc0WnhITjJSeU1Zak9RL21EbUc5Vm5x?=
 =?utf-8?B?MlRRVk1neks0T0FMMlFjV0xwUFBDVWp0V0RVNVNYY09SWFlQL28zSmdCazBB?=
 =?utf-8?B?MThzME84YzZNOXdyY3lhRTlsaWQvYUIrUVdIbitpOFZJZk9leDBKVy9BeS81?=
 =?utf-8?B?bkR1SVU1eUtaRXdNVEo4NU9BNUhiR3pMclZjL3RYdFdQREpDcmMwUmR2Z2Y2?=
 =?utf-8?B?cEFHeDZjNUZ0QVZrZWhEQldwQlJLL2dRczB4SS9jM3ozRTAwWVdyR3dyY2NG?=
 =?utf-8?B?NDR4R3V3a3ZqbjlMWlZ0YU5mTVpMSHFXTTRGcDduSERLSzNKT3N0TndDajdC?=
 =?utf-8?B?WmZqNnRuWmcyU3hMOTJaRkFPazZ2L0k5eFNqVUxoQ0RENjBPNjM1ZGdmVDdS?=
 =?utf-8?B?aUMzbi9QL05VR3ZqTm1DdmNQY21jdFMvMnZsWGtzL2x5NXJMcW1GbGJXd0dj?=
 =?utf-8?B?bDZLVnRPeFFYV1I3emUxd1dOWTdtSklHMWpabWltcXdra203UTNrZ0FsUGNR?=
 =?utf-8?B?WTJpWGpBTU5xN1lqUnd5NlNuaXB4M2ZRWWNpODJ5WThKbDVOTVhDeThkZmxK?=
 =?utf-8?B?dWV6TExodThLVFV1ODFJUFUza0N6L2wwOTdoSkR0RUwvckczS2NlUm9oNjJO?=
 =?utf-8?B?YWpnalV3aytXYzlYUW9YemhBQjBwVDhlRjNXR2h0bjRjaU4vMkJLUDAybGY3?=
 =?utf-8?B?N01OQ0VGbEVPN3c2NTE2b3ErZWRXUHhwK1JiWDdjcWFxdkRYbGhYS1E0aDd2?=
 =?utf-8?B?VkxzZHFRdVNUSG9PVEZmTXk4a1laQ3Njc0R2SzRROE9UWTJQTHlaOGFaNTlZ?=
 =?utf-8?B?SzAxTTVWTWRlMkxTV2pJeHBXK0pnYUQwb0FOZVdHVWFKc1hRWUE1WkxoNjRM?=
 =?utf-8?B?YXBRcThOcys4MS9OUE5pRC9ycTQzZDR2VXNCVHkwbVhOSzVMMDJqa05CQXht?=
 =?utf-8?B?R1JVYlJ0QkxiaEpEdzhjZXNQWWFxVEJlSVZhaHdEWDR5cTJxLzVwSm9JclM3?=
 =?utf-8?B?M2htNW9SUytNT2N2amJ6UDkvSEFuWC9kWTF1ZWp0aXdUMEh0OXNJNmxnYUJh?=
 =?utf-8?B?eG1seit2SUFXN0hGWFUrSzIwVUR1QzZsNmtCSlpCcEFRMFhJVXJuQzVxYkto?=
 =?utf-8?B?YUlnQXFwN0pVS0hVWkpZNHdIK2EvZGNFMVRDR0YwTGtZVUZXUHR1WUR5cXV6?=
 =?utf-8?B?Z0tuaUczVzY5SXlKdElvaXIvZjJnQVZ1RW5NRjBzZGt1SXBXNWZ1NUYrOWtY?=
 =?utf-8?B?cFdhT1hjVG1hQkJkTmwzMW5FUGU0c2FOeG1KajhWeGVKaTFkMVZGN2grK1BR?=
 =?utf-8?B?U0U5aFlIN2lSeWNtaWFiT2RmRFcxOCtDdDAzQU12UWZKbklGbTUvMWVHcG51?=
 =?utf-8?B?VXcwT0tYSEhxbXUvQlBaWFM3UnBVMUZaaDU4RmkyaG53WUJzZVFqMFh3RjF4?=
 =?utf-8?B?V3JtQkF6MDlSN21WbjJBRnhuRVlucGxvOVVjeUg2TGM0d0R2c01qeFNYc0R0?=
 =?utf-8?Q?rlCOjQzI+t8seZyNni/JMe3pSsdIu7uyLEcmBpzBCPQLw?=
x-ms-exchange-antispam-messagedata-1: GS0/AZDVDa32lg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <50616485428292428CBD725A14F658E2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7b28be-d62b-48ec-e130-08de752efdbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 12:03:01.9039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFM5QfNXVwpGLHUMLfATZWKj61LzrkQ+BySnhdPkiouvdgnZAtlvlnSpG0chzvF37huXNusuVSp7rBKHYNiGt1KCE0Ul6UE6XnFe+9kgewA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4647
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

T24gTW9uLCAyMDI2LTAyLTE2IGF0IDE5OjIxICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IMKgV2hpbGUgcHJldmlvdXNseSBhcHBsaWVkIG9ubHkgdG8gdGhlIEJNRyBHMjEo
QmF0dGxlIGltYWdlKSBwbGF0Zm9ybQ0KPiDCoHZpYSB3b3JrYXJvdW5kIFdhXzE0MDIyMDg1ODkw
LHRoaXMgMS4yIEdIeiBtaW5pbXVtIGlzIG5vdyB0aGUNCj4gZGVmYXVsdA0KPiDCoGZvciBCTUcg
YW5kIENSSSBwbGF0Zm9ybXMuDQo+IA0KPiDCoFNldHRpbmcgdGhpcyBmcmVxdWVuY3kgZmxvb3Io
MS4yR0h6KSBkZWZhdWx0IGlzIGNyaXRpY2FsIGluIG11bHRpDQo+IEdQVQ0KPiDCoGVudmlyb25t
ZW50IGZvciBzdXBwb3J0aW5nIGVmZmVjdGl2ZSBQZWVyLXRvLVBlZXIoUDJQKSB0cmFuc2FjdGlv
bnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXJlc2hrdW1hciBHb2xsYWtvdGkgPG5hcmVzaC5r
dW1hci5nQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19w
Yy5jIHwgOSArKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19wYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+IGluZGV4IDVlNTQ5
NWEzOWEzYy4uODgxMDU0YzljZjkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3BjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+IEBA
IC04NjAsNiArODYwLDcgQEAgc3RhdGljIGludCBwY19hZGp1c3RfZnJlcV9ib3VuZHMoc3RydWN0
IHhlX2d1Y19wYw0KPiAqcGMpDQo+IMKgew0KPiDCoAlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGd0
X3RvX3RpbGUocGNfdG9fZ3QocGMpKTsNCj4gwqAJaW50IHJldDsNCj4gKwlzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSA9IHBjX3RvX3hlKHBjKTsNCj4gwqANCj4gwqAJbG9ja2RlcF9hc3NlcnRfaGVsZCgm
cGMtPmZyZXFfbG9jayk7DQo+IMKgDQo+IEBAIC04ODUsNyArODg2LDEzIEBAIHN0YXRpYyBpbnQg
cGNfYWRqdXN0X2ZyZXFfYm91bmRzKHN0cnVjdA0KPiB4ZV9ndWNfcGMgKnBjKQ0KPiDCoAlpZiAo
cGNfZ2V0X21pbl9mcmVxKHBjKSA+IHBjLT5ycDBfZnJlcSkNCj4gwqAJCXJldCA9IHBjX3NldF9t
aW5fZnJlcShwYywgcGMtPnJwMF9mcmVxKTsNCj4gwqANCj4gLQlpZiAoWEVfREVWSUNFX1dBKHRp
bGVfdG9feGUodGlsZSksIDE0MDIyMDg1ODkwKSkNCj4gKwkvKg0KPiArCSAqIFNldHRpbmcgR1Qg
UlAgbWluIGZyZXF1ZW5jeSB0byAxLjJHSHogYnkgZGVmYXVsdCBmb3INCj4gKwkgKiBhbGwgQk1H
IGFuZCBDUkkoRm9yIEJNRyBHMjEgV0EgZG8gdGhlIHNhbWUpLg0KPiArCSAqLw0KPiArCWlmIChY
RV9ERVZJQ0VfV0EodGlsZV90b194ZSh0aWxlKSwgMTQwMjIwODU4OTApIHx8DQo+ICsJwqDCoMKg
ICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9CQVRUTEVNQUdFIHx8DQo+ICsJCQkgeGUtPmluZm8u
cGxhdGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpKQ0KDQpJbmRlbnRhdGlvbiBsb29rcyBvZmYg
aGVyZS4NCg0KV2l0aCB0aGF0IGZpeGVkLA0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7Zt
IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCg0KDQo+IMKgCQlyZXQgPSBwY19z
ZXRfbWluX2ZyZXEocGMsIG1heChCTUdfTUlOX0ZSRVEsDQo+IHBjX2dldF9taW5fZnJlcShwYykp
KTsNCj4gwqANCj4gwqBvdXQ6DQo=
