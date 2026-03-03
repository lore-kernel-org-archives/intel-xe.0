Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C979E67A9E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 14:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9B210E829;
	Tue,  3 Mar 2026 14:56:54 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D4610E829
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772549808; x=1804085808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ix1fFYAb6/52E3/6dDmr40WOAwMHN2oRSfvNIr5F0O0=;
 b=ZpsVXFcYfFLn8vxmeLHWsj2i6vQZAZ/O4/eA5TF0OGooKl3zqlHcfvEy
 VNXZun2uxRhc5oERp/wOAnDpn/EH9Rc0r88Fl1wDXLtMI5m49fBr+8sTL
 E2ruKLJT7xxRPsHqaTo6g+h0n+vSYeFavmynpSrQSJDPaUvhXwuV5xMPZ
 7wBBG6WmvXOF9Al0NBugv9C/HMRUFyZEeUoI+9uHVY2JfD79O7PFE4w/g
 DKl9r1Df3PBIcceZo09qS8nvTuqooTsOkTQClulx0XirDLPh5e/EPdLE/
 WlpFPBe2kcv2Mw+EPzXc8906qFx+DXMHxbfXUevDy7EDH87ROZOieloUU Q==;
X-CSE-ConnectionGUID: lhYWPuyxSkaSy7L6XvYxnA==
X-CSE-MsgGUID: sI3mHIyBQfWQrBpe/duhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99062108"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99062108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:56:48 -0800
X-CSE-ConnectionGUID: UcI4wnObT+mPav8TQRs8ZA==
X-CSE-MsgGUID: wcvrpKxSSRqvT58JGZfUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217993488"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:56:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 06:56:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 06:56:47 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 06:56:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iitMf6GZuvkfBGoAtV/c6b8miWr8oTrFBq4P8ZWGUMZGKGuYOo8y6EaTTelIhKpz+o61IL2YTxM1ekJooFcjZN7NYSgVWSMr0Q1eHx6GbEPuQgDUtjla72f7Fwh34MleUMOlf/lg+ieDiKmfJmafswDJwZ/Al8tSnI/WFOzBPQL3IWNZ5UGVcR+4YCEL6CO/UaIOwsdO7R2DFQ5YVfwT+OzF9iRjD3wpbMp8it6WROP67CUQuJHL3oRPq7bnAPjjlncfSosbzCRY+1SROXkmsWH9Spx48ZbFzb6CLqpaZkq0KqZpU+65FDYOEZlDeLwApU9AG57iDcNTp0zPSs0PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ix1fFYAb6/52E3/6dDmr40WOAwMHN2oRSfvNIr5F0O0=;
 b=GcLSTWxEh4XFwyyM4ZWt/G1gFjNYcV1utppncTMPvBS4U/JxokX2oj350VANmjJIUTTMbQtuUeiJIL/m7k5mk9gNLwwWjd06DIfGBtYGfag46rS9Xo4z4TWN3ovhf0+9OhUHuOb3XZ/ES/jzHH2nQRFVBsEkeIrwhHtb7rVARe4QWyIlQppwg9wvbCrWAm9mhVqQ6VpXDJns5+vbTCSNlu9iVU4KvSxp+EUrKXimu/xPxCjQRwkiFcVgIaiq7sftsXDMRvE6DmIPdWoZGeLu0Q0MQNoJpc33kRz4/T0w/3lzhoT6Qkl4XgaXMxLkPRMppPX4ny1DlLrYOXhazp4DaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 14:56:43 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:56:42 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Zhang, Carl" <carl.zhang@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [PATCH V5 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Thread-Topic: [PATCH V5 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Thread-Index: AQHcqtZ7yXjz1FUDcEmB8NPiyMGPsrWc5iOA
Date: Tue, 3 Mar 2026 14:56:42 +0000
Message-ID: <072f1f336adec51b22c8e49a3a066b05da3eafc7.camel@intel.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
 <20260303062441.1860959-9-tejas.upadhyay@intel.com>
In-Reply-To: <20260303062441.1860959-9-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|CH0PR11MB8166:EE_
x-ms-office365-filtering-correlation-id: 9f74b146-f0b3-4019-b04c-08de7935150d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: FuSAFKxqD8iKBc+pMkWFTOXZFG0xjKKQR1jm1lgmxUknOLZSWVSlzMOjvidzxYTdVvDC4jJu6Q3XPQUfN5hYChLO6r/97pu0j33hUihKDeHAmnucYC9+ZduCqphFFIfFcCPd7m4il/AnG2DS63ZM0ZjESTUxF9unsQftzX0l+Vzi/0X0xvYWogoRxFTqsfEKaGTL2UHZXeSS4clgMR+HJ5AoR/8wnAq/osUJmh0dREiKU7EViH88PqhqYpYORWdU1DWQaSob7Q1jtxkSRhQOV4M9BeWiD3hA4m7jO8A0PlyzwwF6vibVwt1QYM5Nz/8HNGQg3+JqhWL5Sn/8fNZJu9/BV43DRgx8wzva27J3wfdXkYz4U7LZN8aLb3Kl+Oj4XLQYwCs4Y8PDxv/pa5h33f7gvK7g2qRo6t1BkIBbZhMINFNd6rp8pbl4i/yk26JxMqJvFf8wMUGat9rqdRwm76iFEmBNCrmNTlj36B+xwL4YOZjAMb8pZdI01WgOAD5nOaT5p5i0OqWWZbE683pWy+NZ/x87UFjzBDA0b06wIVT97eta34qcqqGucCSCzzOVHMza9SNDbw2R3lmKKuELNBuVhaQKbFSkGI2B9XlwKWshHur99R/fp7IkxFNHc5Qo3ThB1igWN1l9zeHr4COBM5R+RxA3734izAtz2v5FBcy65IIx5Opg5K0apo5WupsOHTx2A7VSK0R2EGVO5EbgzRB3lPIrVQssb1ZEUKwwI6eNkpsnSsA0k99a0T2+oFkjfQSmoygPilK261ATm/eaTVl56OEI/8oTy7Cq/mNy8UI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2tucTRqTENsc1EvVlhJSXhyU3l0c2lxWk5pTjY4aVgxUndZQmxPZUgvZGh3?=
 =?utf-8?B?bHZYSjhNSE1iYnViVUxEOUxldDFyemg0VE1FODdZbFF6OVRLQ2dta0xKRGhT?=
 =?utf-8?B?WWNYWm1BSHcrUUFHdHJkY3dWWmNWRkpRTXI5d253UFdkNkVYUjY4Qnl3ZitY?=
 =?utf-8?B?UmhBVjhUdXEvVmxuakJxYzhPVnVTdWh2RFpVeHZ5ZUZwaFZZSXpEdThuNjVs?=
 =?utf-8?B?V1NLV0tMUmFJOWZ5dzNJWlZhQm1kN3N2MnhrbHg5MHMwZCs5dDhuVjJ5Y09l?=
 =?utf-8?B?WlU3ZGJsQ2ZhVzlWUm9sUjFUdVhFaFlBTkE4T29LdnArNHEyL1R1UFVMcVlD?=
 =?utf-8?B?UFNBU0dvb2FFQnQ0S0NkeW00TjhKTW5vUFZ5eEwzR0lsRWwvdzZ1M0pxMGdO?=
 =?utf-8?B?cUhxRG5zeUVubjVLYWN3eWp4U2MzK1dBdkZ5UkVlWVJHcjJObi93YzFGY2dq?=
 =?utf-8?B?TVpGSGp2M0NPNkVWbVRNRmI2WVVZNnp1ZUt4OVhFQ01wZ0lSNTU4KzVUMmV1?=
 =?utf-8?B?Mk9XRE04UXd2Q280QW44bzNCUEhvLy9vRnNWM2gvSStCSnd3ZXU0TnJQeVN0?=
 =?utf-8?B?cWtQSkpLUjNVSmJ6c0Q0aVpMREFKNkJPNEJEbVlnWWtLZllGUkFtS3dZb2Zp?=
 =?utf-8?B?bUdPTjJ5dzlZWW5lQ3RIQXhHanIycEZZVldGNTNJczV0dDVhck9tbXlTL0h4?=
 =?utf-8?B?dit0OXVzWURoS3YrK29hZ3ZaTFBTaWpBNWVtVi9ISHpPKzcrNXdHdTQrSXVh?=
 =?utf-8?B?ZmFPWmo0bTFHUGQ5aCt3U2plZTNkcGhlV3FmRUVzdGNLOXQzUG9CMDlSd1RM?=
 =?utf-8?B?MXlZaURtSFFmRmdCVGo1dU8yUXpWVys2Sk9DQ2poc0dBc292aGFSaGs2dnVu?=
 =?utf-8?B?MHpJVzlRcSs5Yjd4Njc2b0M0dGd4OHZPRFVVdHZRcXl0SGN0WXVnTXY5RXdj?=
 =?utf-8?B?Ny84YnpzNGZIbjBUdlN5K1pXbi9KSVRDTUd3c2djYW5BOUlBRUhZRFcwR2ZS?=
 =?utf-8?B?alFUSmhRSW9acy9SWjdrMVhQb3hsTmFQakM0dTdCQVFXcUQxTURseGoxTm1H?=
 =?utf-8?B?YmcvWE9Za2g0cmdSY1plbDBSZnVsUUxzUy9oUEVyYTcrbUVDYUVBNGI0eTVm?=
 =?utf-8?B?elM2Z1dQMTVUZGpEbFdLNUQ5bE5pMXZYRFVXTGVzbklSeU9Yemp0eXpNdVFK?=
 =?utf-8?B?STJiZStsMENRS3JHc2RVT2NXRFlKUXFVd1hCTzJnaUwreE1oanIyY2NMZmV5?=
 =?utf-8?B?c3FWUHlOUWRwcmRQYmE5b2pLclMzSDBIeUJoYmhGWmpvL2pzZXBpLzNwWG13?=
 =?utf-8?B?NUVrMUdyVWlFWlMxWStualk4MGNmUnlmZG1LL0drRndRenZueW9qMmhpY0R1?=
 =?utf-8?B?TW9ldDVCV0NkcTMvMHVOOTk4VEsrbEd4dkNoVFI5ZDE3d2REREwxaUpvenRB?=
 =?utf-8?B?TlZpU3FqMDUxS0pmcmtpTDNqYTNUamkwTU1SSk9xMElsdXZuWjBwYjNhZHUw?=
 =?utf-8?B?ZlVyd0RVSEJCTjBISmc0ZHRyL3ROdVJnTFpWU24wVzhaSWNjbCt4ZGdsSW8v?=
 =?utf-8?B?R3NIbVFibld1RDF4LzNkS1ZtV3FiemdwbTlxbDVwMStPMm9QS0ROS1JQcHMw?=
 =?utf-8?B?OW5HbHhlcDJWR1NOU05CMmo5QlVJVENUN1FPM2NRR256ajEwNlh3Tkt5ZHBF?=
 =?utf-8?B?Rnl2blNlbDlOTm5jYStjSVd0WTFMVUdmZ25weWV6TnRwMHBsV1IvdXd1Q2hv?=
 =?utf-8?B?UHZFaGYybnFTdlFRSWRJeVptSHM4ck8wTkt5MXNIcTk5NDdqUThCbk90Mk51?=
 =?utf-8?B?dE1CdE9oOWtqVVB3ejNDQzkzZW0rM1UvRjcvS0k4MmFweVZHcmlJS2lncmtE?=
 =?utf-8?B?RjRqQlU4MnJWWUxyMGdmL2pxQlJEdVNiNTFlNk93RGRRMWxEYitNYVpjS1li?=
 =?utf-8?B?YWR3QUFpUXhPanBjdGNUNThTT3A5aUtrdFZGejVicnBjSWdZanJoNFB3amNM?=
 =?utf-8?B?aHk0U3lKVnJOLzFhZjh1aXQ1S1QxQ1JTdTM5TTM3ampQOVh4N0Q4emJSRmUr?=
 =?utf-8?B?UEwrQ3JZMWNJWVVBOEErcWtBaDVpUmFNSGZQdFBTNkdpQWpZS1VjenhjQkpr?=
 =?utf-8?B?RGYvUzAyVmZuTmpGcUljS3BYN0JNZWxWbU5CNWFPb0pvS3hLdW9YSGdVYk1a?=
 =?utf-8?B?U3dQVU1pbXRJb0h4ckQwUlhJTHVYSmE5b3JiSndjcXdqWlNlak1rdFlTSlVD?=
 =?utf-8?B?NS8xMmFtTGNXS0F4WkpBNTJsUmQyOGZEcEthZklqZTRFN3JQbDRld1BFTGlz?=
 =?utf-8?B?MXpYZTYwU1Zlb1lqMC9lc0NhRWJHRUZPVXRYUnVKMll3TmVoR1M2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DF475286E925344B1AA24569D89F814@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f74b146-f0b3-4019-b04c-08de7935150d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 14:56:42.6105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wa1QwbGqmKrFL9G80kqwlEvtnTe7hRnXvPUOOmxvc228Mzy9SgDsOmad6aKjUeKqiMaiK1UIIQhSiJ8jNanYbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

T24gVHVlLCAyMDI2LTAzLTAzIGF0IDExOjU0ICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToN
Cj4gV2hlbiBzZXQsIHN0YXJ0aW5nIHhlM3BfbHBnLCB0aGUgTDIgZmx1c2ggb3B0aW1pemF0aW9u
DQo+IGZlYXR1cmUgd2lsbCBjb250cm9sIHdoZXRoZXIgTDIgaXMgaW4gUGVyc2lzdGVudCBvcg0K
PiBUcmFuc2llbnQgbW9kZSB0aHJvdWdoIG1vbml0b3Jpbmcgb2YgbWVkaWEgYWN0aXZpdHkuDQo+
IA0KPiBUbyBlbmFibGUgTDIgZmx1c2ggb3B0aW1pemF0aW9uIGluY2x1ZGUgbmV3IGZlYXR1cmUg
ZmxhZw0KPiBHVUNfQ1RMX0VOQUJMRV9MMkZMVVNIX09QVCBmb3IgTm92YWxha2UgcGxhdGZvcm1z
IHdoZW4NCj4gbWVkaWEgdHlwZSBpcyBkZXRlY3RlZC4NCj4gDQo+IFRpZ2h0ZW4gVUFQSSB2YWxp
ZGF0aW9uIHRvIHJlc3RyaWN0IHVzZXJwdHIsIHN2bSBhbmQNCj4gZG1hYnVmIG1hcHBpbmdzIHRv
IGJlIGVpdGhlciAyV0FZIG9yIFhBKzFXQVkNCj4gDQo+IFY0KE1hdHRBKTogTW9kaWZ5IHVhcGkg
ZG9jIGFuZCBjb21taXQNCj4gVjMoTWF0dEEpOiBjaGVjayB2YWxpZCBvcCBhbmQgcGF0X2luZGV4
IHZhbHVlDQo+IFYyKE1hdHRBKTogdmFsaWRhdGUgZG1hLWJ1ZiBib3MgYW5kIG1hZHZpc2UgcGF0
LWluZGV4DQoNCkFja2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGlu
dGVsLmNvbT4NCg0KPiANCj4gQWNrZWQtYnk6IE1pY2hhbCBNcm96ZWsgPG1pY2hhbC5tcm96ZWtA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5
YXlAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmPCoMKg
wqDCoMKgwqDCoCB8wqAgMyArKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYu
aMKgwqAgfMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jwqDCoMKgwqDCoMKg
wqDCoCB8wqAgOCArKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNl
LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoGluY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrLQ0KPiDCoDUgZmlsZXMgY2hhbmdlZCwg
MzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0K
PiBpbmRleCA1NGQyZmM3ODAxMjcuLjQzZGM0MzUzMjA2ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMu
Yw0KPiBAQCAtOTgsNiArOTgsOSBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZmVhdHVyZV9mbGFncyhz
dHJ1Y3QgeGVfZ3VjDQo+ICpndWMpDQo+IMKgCWlmICh4ZV9ndWNfdXNpbmdfbWFpbl9nYW1jdHJs
X3F1ZXVlcyhndWMpKQ0KPiDCoAkJZmxhZ3MgfD0gR1VDX0NUTF9NQUlOX0dBTUNUUkxfUVVFVUVT
Ow0KPiDCoA0KPiArCWlmIChHUkFQSElDU19WRVIoeGUpID49IDM1ICYmICFJU19ER0ZYKHhlKSAm
Jg0KPiB4ZV9ndF9pc19tZWRpYV90eXBlKGd1Y190b19ndChndWMpKSkNCj4gKwkJZmxhZ3MgfD0g
R1VDX0NUTF9FTkFCTEVfTDJGTFVTSF9PUFQ7DQo+ICsNCj4gwqAJcmV0dXJuIGZsYWdzOw0KPiDC
oH0NCj4gwqANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5o
DQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmgNCj4gaW5kZXggYmI4ZjcxZDM4
NjExLi5iNzNmYWUwNjNmYWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfZndpZi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oDQo+IEBA
IC02Nyw2ICs2Nyw3IEBAIHN0cnVjdCBndWNfdXBkYXRlX2V4ZWNfcXVldWVfcG9saWN5IHsNCj4g
wqAjZGVmaW5lwqDCoCBHVUNfQ1RMX0VOQUJMRV9QU01JX0xPR0dJTkcJQklUKDcpDQo+IMKgI2Rl
ZmluZcKgwqAgR1VDX0NUTF9NQUlOX0dBTUNUUkxfUVVFVUVTCUJJVCg5KQ0KPiDCoCNkZWZpbmXC
oMKgIEdVQ19DVExfRElTQUJMRV9TQ0hFRFVMRVIJQklUKDE0KQ0KPiArI2RlZmluZcKgwqAgR1VD
X0NUTF9FTkFCTEVfTDJGTFVTSF9PUFQJQklUKDE1KQ0KPiDCoA0KPiDCoCNkZWZpbmUgR1VDX0NU
TF9ERUJVRwkJCTMNCj4gwqAjZGVmaW5lwqDCoCBHVUNfTE9HX1ZFUkJPU0lUWQkJUkVHX0dFTk1B
U0soMSwgMCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggZGEwY2UwYjM3MDRjLi40MjRlMWM3NDJi
OTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0zNDgxLDYgKzM0ODEsMTAgQEAgc3RhdGlj
IGludCB2bV9iaW5kX2lvY3RsX2NoZWNrX2FyZ3Moc3RydWN0DQo+IHhlX2RldmljZSAqeGUsIHN0
cnVjdCB4ZV92bSAqdm0sDQo+IMKgCQkJCSBvcCA9PQ0KPiBEUk1fWEVfVk1fQklORF9PUF9NQVBf
VVNFUlBUUikgfHwNCj4gwqAJCcKgwqDCoCBYRV9JT0NUTF9EQkcoeGUsIGNvaF9tb2RlID09IFhF
X0NPSF9OT05FICYmDQo+IMKgCQkJCSBvcCA9PQ0KPiBEUk1fWEVfVk1fQklORF9PUF9NQVBfVVNF
UlBUUikgfHwNCj4gKwkJwqDCoMKgIFhFX0lPQ1RMX0RCRyh4ZSwNCj4geGVfZGV2aWNlX2lzX2wy
X2ZsdXNoX29wdGltaXplZCh4ZSkgJiYNCj4gKwkJCQkgKG9wID09DQo+IERSTV9YRV9WTV9CSU5E
X09QX01BUF9VU0VSUFRSIHx8DQo+ICsJCQkJwqAgaXNfY3B1X2FkZHJfbWlycm9yKSAmJg0KPiAr
CQkJCSAocGF0X2luZGV4ICE9IDE5IHx8IGNvaF9tb2RlICE9DQo+IFhFX0NPSF8yV0FZKSkgfHwN
Cj4gwqAJCcKgwqDCoCBYRV9JT0NUTF9EQkcoeGUsIGNvbXBfZW4gJiYNCj4gwqAJCQkJIG9wID09
DQo+IERSTV9YRV9WTV9CSU5EX09QX01BUF9VU0VSUFRSKSB8fA0KPiDCoAkJwqDCoMKgIFhFX0lP
Q1RMX0RCRyh4ZSwgb3AgPT0NCj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQX1VTRVJQVFIgJiYNCj4g
QEAgLTM2MTUsNiArMzYxOSwxMCBAQCBzdGF0aWMgaW50IHhlX3ZtX2JpbmRfaW9jdGxfdmFsaWRh
dGVfYm8oc3RydWN0DQo+IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ibyAqYm8sDQo+IMKgCWlm
IChYRV9JT0NUTF9EQkcoeGUsIGJvLT50dG0uYmFzZS5pbXBvcnRfYXR0YWNoICYmIGNvbXBfZW4p
KQ0KPiDCoAkJcmV0dXJuIC1FSU5WQUw7DQo+IMKgDQo+ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwg
Ym8tPnR0bS5iYXNlLmltcG9ydF9hdHRhY2ggJiYNCj4geGVfZGV2aWNlX2lzX2wyX2ZsdXNoX29w
dGltaXplZCh4ZSkgJiYNCj4gKwkJCSAocGF0X2luZGV4ICE9IDE5IHx8IGNvaF9tb2RlICE9DQo+
IFhFX0NPSF8yV0FZKSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+IMKgCS8qIElmIGEg
Qk8gaXMgcHJvdGVjdGVkIGl0IGNhbiBvbmx5IGJlIG1hcHBlZCBpZiB0aGUga2V5IGlzDQo+IHN0
aWxsIHZhbGlkICovDQo+IMKgCWlmICgoYmluZF9mbGFncyAmIERSTV9YRV9WTV9CSU5EX0ZMQUdf
Q0hFQ0tfUFhQKSAmJg0KPiB4ZV9ib19pc19wcm90ZWN0ZWQoYm8pICYmDQo+IMKgCcKgwqDCoCBv
cCAhPSBEUk1fWEVfVk1fQklORF9PUF9VTk1BUCAmJiBvcCAhPQ0KPiBEUk1fWEVfVk1fQklORF9P
UF9VTk1BUF9BTEwpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFk
dmlzZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYw0KPiBpbmRleCAx
YTFhZDhjMDdkNDkuLmU2NjllNTc4NjE4YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtX21hZHZpc2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFk
dmlzZS5jDQo+IEBAIC00MTEsNiArNDExLDcgQEAgaW50IHhlX3ZtX21hZHZpc2VfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWwN
Cj4gwqAJc3RydWN0IHhlX3ZtYXNfaW5fbWFkdmlzZV9yYW5nZSBtYWR2aXNlX3JhbmdlID0gey5h
ZGRyID0NCj4gYXJncy0+c3RhcnQsDQo+IMKgCQkJCQkJCSAucmFuZ2UgPcKgDQo+IGFyZ3MtPnJh
bmdlLCB9Ow0KPiDCoAlzdHJ1Y3QgeGVfbWFkdmlzZV9kZXRhaWxzIGRldGFpbHM7DQo+ICsJdTE2
IHBhdF9pbmRleCwgY29oX21vZGU7DQo+IMKgCXN0cnVjdCB4ZV92bSAqdm07DQo+IMKgCXN0cnVj
dCBkcm1fZXhlYyBleGVjOw0KPiDCoAlpbnQgZXJyLCBhdHRyX3R5cGU7DQo+IEBAIC00NDcsNiAr
NDQ4LDE3IEBAIGludCB4ZV92bV9tYWR2aXNlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
DQo+IHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsDQo+IMKgCWlmIChlcnIgfHwgIW1h
ZHZpc2VfcmFuZ2UubnVtX3ZtYXMpDQo+IMKgCQlnb3RvIG1hZHZfZmluaTsNCj4gwqANCj4gKwlp
ZiAoYXJncy0+dHlwZSA9PSBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUEFUKSB7DQo+ICsJCXBhdF9p
bmRleCA9IGFycmF5X2luZGV4X25vc3BlYyhhcmdzLT5wYXRfaW5kZXgudmFsLA0KPiB4ZS0+cGF0
Lm5fZW50cmllcyk7DQo+ICsJCWNvaF9tb2RlID0geGVfcGF0X2luZGV4X2dldF9jb2hfbW9kZSh4
ZSwgcGF0X2luZGV4KTsNCj4gKwkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwNCj4gbWFkdmlzZV9yYW5n
ZS5oYXNfc3ZtX3VzZXJwdHJfdm1hcyAmJg0KPiArCQkJCSB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hf
b3B0aW1pemVkKHhlKQ0KPiAmJg0KPiArCQkJCSAocGF0X2luZGV4ICE9IDE5IHx8IGNvaF9tb2Rl
ICE9DQo+IFhFX0NPSF8yV0FZKSkpIHsNCj4gKwkJCWVyciA9IC1FSU5WQUw7DQo+ICsJCQlnb3Rv
IG1hZHZfZmluaTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiDCoAlpZiAobWFkdmlzZV9yYW5nZS5o
YXNfYm9fdm1hcykgew0KPiDCoAkJaWYgKGFyZ3MtPnR5cGUgPT0gRFJNX1hFX01FTV9SQU5HRV9B
VFRSX0FUT01JQykgew0KPiDCoAkJCWlmICghY2hlY2tfYm9fYXJnc19hcmVfc2FuZSh2bSwNCj4g
bWFkdmlzZV9yYW5nZS52bWFzLA0KPiBAQCAtNDY0LDYgKzQ3NiwxNyBAQCBpbnQgeGVfdm1fbWFk
dmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiB2b2lkICpkYXRhLCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbA0KPiDCoA0KPiDCoAkJCQlpZiAoIWJvKQ0KPiDCoAkJCQkJY29udGludWU7
DQo+ICsNCj4gKwkJCQlpZiAoYXJncy0+dHlwZSA9PQ0KPiBEUk1fWEVfTUVNX1JBTkdFX0FUVFJf
UEFUKSB7DQo+ICsJCQkJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGJvLQ0KPiA+dHRtLmJhc2UuaW1w
b3J0X2F0dGFjaCAmJg0KPiArCQkJCQkJCQ0KPiB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1p
emVkKHhlKSAmJg0KPiArCQkJCQkJCSAocGF0X2luZGV4DQo+ICE9IDE5IHx8DQo+ICsJCQkJCQkJ
wqAgY29oX21vZGUNCj4gIT0gWEVfQ09IXzJXQVkpKSkgew0KPiArCQkJCQkJZXJyID0gLUVJTlZB
TDsNCj4gKwkJCQkJCWdvdG8gZXJyX2Zpbmk7DQo+ICsJCQkJCX0NCj4gKwkJCQl9DQo+ICsNCj4g
wqAJCQkJZXJyID0gZHJtX2V4ZWNfbG9ja19vYmooJmV4ZWMsICZiby0NCj4gPnR0bS5iYXNlKTsN
Cj4gwqAJCQkJZHJtX2V4ZWNfcmV0cnlfb25fY29udGVudGlvbigmZXhlYyk7DQo+IMKgCQkJCWlm
IChlcnIpDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVk
ZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCBlZjI1NjUwNDhiZGYuLjg2MmZlZDNjZjFlZCAx
MDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC0xMTAzLDcgKzExMDMsOSBAQCBzdHJ1Y3QgZHJtX3hl
X3ZtX2JpbmRfb3Agew0KPiDCoAkgKiBpbmNvaGVyZW50IEdUIGFjY2VzcyBpcyBwb3NzaWJsZS4N
Cj4gwqAJICoNCj4gwqAJICogTm90ZTogRm9yIHVzZXJwdHIgYW5kIGV4dGVybmFsbHkgaW1wb3J0
ZWQgZG1hLWJ1ZiB0aGUNCj4ga2VybmVsIGV4cGVjdHMNCj4gLQkgKiBlaXRoZXIgMVdBWSBvciAy
V0FZIGZvciB0aGUgQHBhdF9pbmRleC4NCj4gKwkgKiBlaXRoZXIgMVdBWSBvciAyV0FZIGZvciB0
aGUgQHBhdF9pbmRleC4gU3RhcnRpbmcgZnJvbQ0KPiBOVkwtUCwgZm9yDQo+ICsJICogdXNlcnB0
ciwgc3ZtLCBtYWR2aXNlIGFuZCBleHRlcm5hbGx5IGltcG9ydGVkIGRtYS1idWYgdGhlDQo+IGtl
cm5lbCBleHBlY3RzDQo+ICsJICogZWl0aGVyIDJXQVkgb3IgMVdBWSBhbmQgWEEgQHBhdF9pbmRl
eC4NCj4gwqAJICoNCj4gwqAJICogRm9yIERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVMTCBiaW5kaW5n
cyB0aGVyZSBhcmUgbm8gS01EDQo+IHJlc3RyaWN0aW9ucw0KPiDCoAkgKiBvbiB0aGUgQHBhdF9p
bmRleC4gRm9yIHN1Y2ggbWFwcGluZ3MgdGhlcmUgaXMgbm8gYWN0dWFsDQo+IG1lbW9yeSBiZWlu
Zw0K
