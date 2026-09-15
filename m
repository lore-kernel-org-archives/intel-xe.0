Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E012C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 12:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAE210E4F4;
	Tue, 15 Sep 2026 12:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URZez4j7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467D210E4F4;
 Tue, 15 Sep 2026 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789476923; x=1821012923;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=z6UzILlBITypBa9LuoybY+uqKWtkkXcnM+Q35DRbREs=;
 b=URZez4j7EGcPqu5QW1qtP9mS0smKC0I4O+TA1SW2zYBgxrfkUyJJEguE
 YPKEGAo8zDi/PJoMDUUbVju3XAc7BGDJPKHyTlGs+9+cBgPcJVimiv1Rv
 nv3Y6MxoMQpAYfCzi7zwYDWcIKCgprkTvRxMOXxTRRaI1fuEFdXc7FspC
 Ia57sUU2lrigllEyII6hMBR40GXnHdxeNIoJjLAhr9cggt1q4TPXHnUAM
 0YnuXey/RGUZ9kYl8cbJfTOcVgawQ3avAnSUYTVQtvg756iz1fov1EoPj
 kf1Juj7pqZ2xjGCU14GdzHqLpFfRD1ESYO1xa8FkvR7hb0UPFJ4lDrzkv g==;
X-CSE-ConnectionGUID: 3jTv53IbQWKYcYMTbXd4rg==
X-CSE-MsgGUID: YXI7glFVQ7iFGob/QmtiPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="346712"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="346712"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:55:23 -0700
X-CSE-ConnectionGUID: k1NYJs5oT7WJukmoaJyPhQ==
X-CSE-MsgGUID: 1KrfpQdDTem7y5YJoH+ItQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1230164"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:55:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:55:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 05:55:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oouZvkOpMghIR3e5ZdiqsWJ3g25JmrLu+6IHSXdA6AB+K67fCsMG+EEsFWH0rJpmLClT531cfNU5xEn7KO0o01xuzfYa4KyMRVMNyQbqynNJyDvAWYokj2/KZi/XE1GrAn357jViDSNhsnhiUL1Bl6koFTr+yTHyntzoSo8lg1SJZQZ/fZR49vpUDAX1kh05tGVgUhXG/Nk3Fp6ajA4C3hTET1BWos/PQO9eXJNklgNVpONGRM0GyWWLCko5k5owh3CAUqk87K58whSdolAS+Ph5dzAtZ1VFQl5WOwk/88txCAm5s6C5eyzmKgD/gCGHQ9PYpKTI7ORxk16WMOd1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6UzILlBITypBa9LuoybY+uqKWtkkXcnM+Q35DRbREs=;
 b=SfaM7BFk6eXR73GWDx/u/fqasgcYD7ynSTwhf+FHNaw+piEnJrR9IffA0SCrZQOjiTBaH/iD+QeTJpoY39P6T0GNiYVqP06LtaBn5rZUxYqTQlp6cd/GZJlaCFr7N1e7sE680jx313LnLhmQvLi6M4CLEGF6HBQ3T0Yj3dmTjiyJ3OpF/cyVC4IPC47efXeyJjYeb85p72KMTeQfiuVTmLEaiBGClcw1dHi8Yn0NZ4LUqS3m7XL+RJqsLaGUBoBk5kiJa0MKmwkxG7fSVIJwyYYTTRpoGMe9ZPg6DkmmvfLtjimaXxAGbkk5uuPqZFY7Q1HnbitQHHmtBSNLAnV4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA3PPF1805EFE45.namprd11.prod.outlook.com (2603:10b6:20f:fc04::ce)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 12:55:15 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 12:55:15 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v8 4/5] drm/i915/irq: conditional HPD IRQ resets based on
 PME capability
Thread-Topic: [PATCH v8 4/5] drm/i915/irq: conditional HPD IRQ resets based on
 PME capability
Thread-Index: AQHdRPQ702aR0ZcjY0yho2cnrVf4DrbPmPyA
Date: Tue, 15 Sep 2026 12:55:15 +0000
Message-ID: <535c7657b7b73a3f0b7dd4927b1e683fa355cfde.camel@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
 <20260915092518.639448-5-vinod.govindapillai@intel.com>
In-Reply-To: <20260915092518.639448-5-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA3PPF1805EFE45:EE_
x-ms-office365-filtering-correlation-id: b8862418-0f42-401a-69a3-08df13289697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info: h23XtaiIWCQZag1rPi7Ghut6/ZQqvu+MlM9LmVI+2P6BDbRGxHk2rb9nL9msbVu6seUte12tiLNIu1CAbdV6y5LNuAoTXqcWSEOhBntYSRtjg16cti6pTgsJHeT5zqxfPw3g+WFH9taZygw8KMjLmoJmgTWbSuJoWdg2Fqhe5brtGnaXENwYEdzndsVHczHhe3ubozvHgUXDztt0q49sj6JareySP3fvCGzcxbIubl+8w96IG5YbEVQvJkXq7MRYeWyI3Lnf5dWOTwrSO+78NyXqIHz91Jf6fHKcu1QZf0fvL/B/KIu+3FDHhanqCsbfZzKQhwYeYAr/YY2JyxExY+/gWdh+4UVfhDUK3caHkFf11/1nfAVoZGcnlR0wtaNNGty9JU4orTjjo58K0mhh6gpW7jlklDSi2XJcGKnuryUhnfZYH6wATAoqzlyBkTOYfvWGxpeqWFKqz8T5/83wL8U5QCrlJAZgZmG5kLAebPpDEWaSUyArV9Pa/AHCHUbTuRo54+c3yp+afyvuy2GwULDGn8N2/88DCR7j1AsPOLPtXiFkmgrPSi9neW5iALEhdBLil+84M/WwWiNC+UKxKbfVVLI0KqpQh9p0SEc/AhwGK8gowEhPqfSdmTkCDj9ay3fdxqhZ1W75fOzUHXPbIAlVNadnRiM5KjsKUtOjbR/rWpixoCh58vdwQir9S6LV8RpR3waY6J4pdEpUQ3p4ctucABo3ovwaum/JqCVm84g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjV0SnEzWGxzckllZExWVWFCYlRnWFFHTThzbnRmNlpaQ0N0L0hVNVpxSXEx?=
 =?utf-8?B?a3I5aWphcWhhVnIzR3lFZ2YwSjhDd1UxSFNJRjhsUWpnTUxXdkFpOEZlckdD?=
 =?utf-8?B?OHNJdjJZR3UwUVNBcDBVYy83eFBRZWVZdExjK0RkZjhaMk1qMDVvNHlXTnRk?=
 =?utf-8?B?MDlSMDdwdmFQeWx1bFFldVhDakUyeDFYRjlXdDF4ZGpGcVJ3MTcvOU9NRnlQ?=
 =?utf-8?B?YjJwTXdrOUZGZlJ6NGVHZEtOTGRuL25SQk5HVUVyemlPNGJHaTBhRDVUMzYr?=
 =?utf-8?B?LzhoZUtWL3BxQmUxYnEzUitvM09IVU1aVG5FWmtJd2xyNEZvYUhPNzVLUzRa?=
 =?utf-8?B?aDMxbFJqY2tzOU9qL0RYUC8vSlZXYXRQZ0Rmcm9rQTJXN0tJNHVuaUJJZWMw?=
 =?utf-8?B?aWQzckVrYkQ2b2ZuK0pPM0pvTmxseS9YbXZzbkk3ODdLNlhRb2Y1T0oycHN1?=
 =?utf-8?B?eWlxWTNONDdwWllNZThhRlVFOVJ0TnRIK1FWTk1GSEdUVHhGd3l2SXlUeGIw?=
 =?utf-8?B?MHF0Z2xkWVd1NlFaOGZCbzBnM3dTWXpIOVdoM1FwWitRaTM1TzRScXkweXBt?=
 =?utf-8?B?VEdSMlRmWE8xSU5wMEJXd1ppSERnbTkwdWNSV3dObHhNOFZsN0RQa0hxRnQ5?=
 =?utf-8?B?S3FubmdvTHJHck9wa3BLMW85VXVVb2ovSWFITWhaZzdzM2tRZDZUMHZIME1R?=
 =?utf-8?B?UFo1ZmFmUVdSREhMTWk1bVJjK1VxaElHOGovc29tdnR5T2taSk1kZUxYcktF?=
 =?utf-8?B?VHdoZGRJeDhoNjluVklTMnZaSWh5V2RjRnpWWXlQb1dLWUc4TGh6ZTdQaU9S?=
 =?utf-8?B?UmxvRFBYUFQxbndnTlZ1bFJ4VVYwYlRWL2tRWHQ3RlowS2lnUDkxRExqK2F3?=
 =?utf-8?B?MkdlTWhFWUU5SE1XQVZjTXRvV1kwb0V3L0JLdXZrR2xMckpOTUl2Um1ETTNP?=
 =?utf-8?B?L2dpQ1ZxYUppMTZVZm9kVGtCRncza2JFWWtackd6bmd5ZnJwcmhHNHlWcW9m?=
 =?utf-8?B?UEZZVExRcDVZWDJGUGM1YmVWNjFEYmhvV1VLWjc0UnJhWkhsZ3ZaOG43NnFN?=
 =?utf-8?B?dUR4NGdSNFRhYUtyNkRpSmRSYkJDNzRVQUhLYmlNQ3lCcVF1YUVxRDhQQldT?=
 =?utf-8?B?eGdYWk5iQ1RZUFRueE9RV09za2JUbFNpZUpJUmdYNEkxemhvVUp1dng1UElo?=
 =?utf-8?B?L2NoZnhaMU9rVEVxcnhSSW9FcFJnUHc2a1ptZ0N1R1NPQlFSc1gzVGRVWFJF?=
 =?utf-8?B?alY1SmNrbzM0eXdKbEtrQWRyaHZwb0k5MU5Pc1pFNS9nSjhmdGdNdno2WmQw?=
 =?utf-8?B?bTB1d3ZtWlAyN20wM2tYMmNoM3JtQkw2STlYUWw5UERRbCtuSXAvVGE2M3BD?=
 =?utf-8?B?eU9sVUFwV0lYS0J4ODRueHVzSEpiWHZ1ZmE1OU4rMXpmV1dIUTZaYk5laGhM?=
 =?utf-8?B?Y291eHR1emZ6enY2c01jY2lJajdHRmJyWE8xWFRmeUNZLzNUVGs2ZlFDQWFi?=
 =?utf-8?B?eWhONHZnRXhQVXNEY2p6VUx1aWJmU2NnY2ZvdTlqcmFiS1R2MzdraEZ0ckIx?=
 =?utf-8?B?eml4NUxnZGdXRlZvbW9jSnN6bzBVYktFdG5sYWhtS1R1MThuZXRIbUFkOC9W?=
 =?utf-8?B?N0ZySGlwb3laTGlCWGZEQnFiamZYbXpOS1RlNkRwWWpNZmdnL1NBbEJPZ2x2?=
 =?utf-8?B?WjY2T3RWcjN0b2pRR1ZoamtucFU2ZzNsZkxhd1R3UGdEaGtVelFuK1VXbG5o?=
 =?utf-8?B?NTQ3NUE0TExHYTV1RDhGV1V5NVNGQ1FnUWY5bDdCcGpOQ2NmTzVsc0liOVF5?=
 =?utf-8?B?WHNSMW1qNWtveEkwVXFRVTZ0dU1wcXZkSjBleTZoZmluRVpET1lvMkt5WEUv?=
 =?utf-8?B?MWhWNitYMjJLRE5LYjNiak0xZ0xtNVkxVnU1VkIwUS9zYmtXVHV4NDNmM2Q3?=
 =?utf-8?B?amlqS1lGa2dyRGNTUFR0UUQwSW80Z2VkVmlqVFk3b3ZUSzRkZlh3c0JmdmF4?=
 =?utf-8?B?dFRaVUdKTlgrYVdrOTVjMU9FOHhpSndhb0I2UTRKUGVCZFpyQytIVlk5TmhW?=
 =?utf-8?B?d04wS1pSRGdPWW1ERHZUUzY2OUJvaDIrT0I3ZmgzWHV0SXhHS0MyRzBGN0Vm?=
 =?utf-8?B?VFdTZGQvSkU3andtNm1IYmRFWEh0YXJ1UjJlWVNZV0JhL2VRT2hVYWhqaUpO?=
 =?utf-8?B?Zzc3emdvVEV2YjZSaW1xbll5RHRvOVRRZHFYSFl0MllSSTF1MEFaTzBzZ0Jn?=
 =?utf-8?B?S2hHSnArQ2MyTGdpV09JWTY5YWhMOGxZbmVwWHM4cERhc3dpRmlPNnBxWXhD?=
 =?utf-8?B?aTIxNVp0NmZNMm9UTldrak1lMnhNWjJpTWZ5WkZYU3BCZlNlL0lBYlJvZWV5?=
 =?utf-8?Q?1c2ESwRWDl7Gx2fo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0DF17A642E6D341B4B6011F885B6723@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q7K1S1Zal1J1/xInd1tByLnfKn8+0lBTGYNi6PX8/Jg1Vwa5A+FeUgutnXNcz0B6VrToqVjO878CL/ehfugPFOA2sx5oRmwN5JnAxRBRj9bHCa042ru48DhRa4cADQ3xZc62l+jiiZ5tpfF93R3wGA7/vr0afh5BJ0AleXJjKYPGD6/Or9PV6zgJIGvrUV1yLoqET0vlpG3xuO4mC55+XW6mXMRYHya6e1afoERKTsylfBGFhKPiMg1YyRwSdRu4OCaRbizCUa0EbDwHvvBie1Wv4YpUoPCPVQIBzuj0/KmW5wYCtF3HPmGtrV9htO+rMYnMzmF7wLvoueVRfs0ZKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8862418-0f42-401a-69a3-08df13289697
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 12:55:15.5410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3kep19Oogq49ORnwDVpNJD3zlzC9uwAK08RmD4n36We6qj0ihCxLeoRospC6ZsBo2T/iP9V66/rFm9YdkGP0kpO8fc7xHkNU1C4PXIvy6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF1805EFE45
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

T24gVHVlLCAyMDI2LTA5LTE1IGF0IDEyOjI1ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBJZiBhIGRldmljZSBzdXBwb3J0cyBnZW5lcmF0aW5nIFBNRSBmcm9tIEhQRHMsIHJl
c2V0dGluZyBIUEQgSVJRcw0KPiB3aWxsIGJlIGNvdW50ZXIgcHJvZHVjdGl2ZSBhcyBIUERzIGl0
c2VsZiB3aWxsIGJlIGxvc3QuIER1cmluZw0KPiBzdXNwZW5kIHJvdXRpbmVzLCBhbGwgdGhlIElS
UXMgYXJlIHJlc2V0LiBTbyBpZiB0aGUgZGV2aWNlIGlzDQo+IGNhcGFibGUgb2YgZ2VuZXJhdGlu
ZyBQTUUgcm9tIEhQRHMsIGtlZXAgdGhlIEhQRCByZWxhdGVkIElSUXMgZnJvbQ0KPiByZXNldCBi
YXNlZCBvbiB0aGUgUE1FIGNhcGFiaWxpdHkgb2YgdGhlIGRldmljZSBvbiBhIHRhcmdldCBwb3dl
cg0KPiBzdGF0ZS4gUE1FIGNhcGFiaWxpdHkgd2lsbCBiZSBhc3Nlc3NlZCBhbmQgdXBkYXRlZCBz
ZXBhcmF0ZWx5Lg0KPiANCj4gdjI6IGNoYW5nZSBrZWVwX2hwZCB0byByZXNldF9ocGQNCj4gDQo+
IHYzOiB1c2UgaW50ZWxfZGlzcGxheV9ycG1fcG1lX2VuYWJsZWQoKSBkaXJlY3RseSAoSmFuaU4p
DQo+IA0KPiB2NDogcmVtb3ZlIHRoZSB1bnVzZWQgaW5jbHVkZSBmaWxlIGZyb20gdGhlIHByZXZp
b3VzIHJldmlzaW9uDQo+IA0KPiBCc3BlYzogNTI5NzksIDUyOTgwLCA2ODg1NywgNjg4NjcsIDY4
OTcwDQo+IEFzc2lzdGVkLWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+IFNpZ25l
ZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwu
Y29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+DQoNCj4gLS0tDQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfaXJxLmPCoMKgIHwgMTggKysrKysrKysrKystLS0tLQ0KPiAtLQ0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiBpbmRleCBh
NTliNzU4MzBiZDEuLjhjZTMwMTEyZGU5NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2lycS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiBAQCAtMjIxNyw4ICsyMjE3LDEw
IEBAIHN0YXRpYyB2b2lkIGdlbjExX2Rpc3BsYXlfaXJxX3Jlc2V0KHN0cnVjdA0KPiBpbnRlbF9k
aXNwbGF5ICpkaXNwbGF5KQ0KPiDCoAllbnVtIHBpcGUgcGlwZTsNCj4gwqAJdTMyIHRyYW5zX21h
c2sgPSBCSVQoVFJBTlNDT0RFUl9BKSB8IEJJVChUUkFOU0NPREVSX0IpIHwNCj4gwqAJCUJJVChU
UkFOU0NPREVSX0MpIHwgQklUKFRSQU5TQ09ERVJfRCk7DQo+ICsJYm9vbCByZXNldF9ocGQgPSAh
aW50ZWxfZGlzcGxheV9ycG1fcG1lX2VuYWJsZWQoZGlzcGxheSk7DQo+IMKgDQo+IC0JaW50ZWxf
ZGVfd3JpdGUoZGlzcGxheSwgR0VOMTFfRElTUExBWV9JTlRfQ1RMLCAwKTsNCj4gKwlpZiAocmVz
ZXRfaHBkKQ0KPiArCQlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBHRU4xMV9ESVNQTEFZX0lOVF9D
VEwsIDApOw0KPiDCoA0KPiDCoAlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTIpIHsNCj4g
wqAJCWVudW0gdHJhbnNjb2RlciB0cmFuczsNCj4gQEAgLTIyNTAsMTMgKzIyNTIsMTUgQEAgc3Rh
dGljIHZvaWQgZ2VuMTFfZGlzcGxheV9pcnFfcmVzZXQoc3RydWN0DQo+IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXkpDQo+IMKgCWlycV9yZXNldChkaXNwbGF5LCBHRU44X0RFX1BPUlRfSVJRX1JFR1Mp
Ow0KPiDCoAlpcnFfcmVzZXQoZGlzcGxheSwgR0VOOF9ERV9NSVNDX0lSUV9SRUdTKTsNCj4gwqAN
Cj4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTQpDQo+IC0JCWlycV9yZXNldChkaXNw
bGF5LCBQSUNBSU5URVJSVVBUX0lSUV9SRUdTKTsNCj4gLQllbHNlDQo+IC0JCWlycV9yZXNldChk
aXNwbGF5LCBHRU4xMV9ERV9IUERfSVJRX1JFR1MpOw0KPiArCWlmIChyZXNldF9ocGQpIHsNCj4g
KwkJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDE0KQ0KPiArCQkJaXJxX3Jlc2V0KGRpc3Bs
YXksIFBJQ0FJTlRFUlJVUFRfSVJRX1JFR1MpOw0KPiArCQllbHNlDQo+ICsJCQlpcnFfcmVzZXQo
ZGlzcGxheSwgR0VOMTFfREVfSFBEX0lSUV9SRUdTKTsNCj4gwqANCj4gLQlpZiAoSU5URUxfUENI
X1RZUEUoZGlzcGxheSkgPj0gUENIX0lDUCkNCj4gLQkJaXJxX3Jlc2V0KGRpc3BsYXksIFNERV9J
UlFfUkVHUyk7DQo+ICsJCWlmIChJTlRFTF9QQ0hfVFlQRShkaXNwbGF5KSA+PSBQQ0hfSUNQKQ0K
PiArCQkJaXJxX3Jlc2V0KGRpc3BsYXksIFNERV9JUlFfUkVHUyk7DQo+ICsJfQ0KPiDCoH0NCj4g
wqANCj4gwqB2b2lkIGdlbjhfaXJxX3Bvd2VyX3dlbGxfcG9zdF9lbmFibGUoc3RydWN0IGludGVs
X2Rpc3BsYXkgKmRpc3BsYXksDQoNCg==
