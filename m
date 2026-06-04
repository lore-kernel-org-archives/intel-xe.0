Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C359ECD6E6E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 20:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A411129C6;
	Thu,  4 Jun 2026 20:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoDyQuoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E83B1129C6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780606668; x=1812142668;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=c7UzvInkoPVh1Viz+8eAC04BmXz5jiZZHJjsY2oi718=;
 b=hoDyQuoPzHNhsyW7cdbF9BZ6+EzhZf1KtmfFRYmXCGLZ4MY6kl5+4Gk3
 QptAttImZ5mikGxkIHnG1r+GaBs7zujTQ8VhAbMSqnBMNt75MAsu/J7q8
 RbTVfyTa4Xqn400fwZ1Ya3Nf4Ix1JE6LS1qxj8vBPMAHPsErk6CbtZ9iQ
 vwMDULIFsqlzQKUA6Cp9GS26SzE5xNWJn2Vo3fbdXtuYZbCrzLf9PnP15
 is57kFmRdOb4O6Gpi3JCOBOVyQ2iaXOwNcxCtufL2iYPTo6l7oM3YZcEy
 cts5mbOHFhZF4tHMx2fg3LiwFF5QDYGJxfInCyUz+4OxNNqSWDsUMKec3 w==;
X-CSE-ConnectionGUID: AUfdmDUmTo2kRyHj5kjqeA==
X-CSE-MsgGUID: 5FB5+UHqQyqWCj1kMJSH9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81567575"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81567575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:57:47 -0700
X-CSE-ConnectionGUID: Lb/2kPUXSx+FXWNSe0ywKw==
X-CSE-MsgGUID: BYp1pyI2R8yt5iCkjjV3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="248989690"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:57:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 13:57:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 13:57:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 13:57:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucxTZIumSCNVhbVy/ueQvivyTxuuwb7yvXBp6BfIyBlXoeVN8Z6chQN+jxGBWvD9yhe5AKbeZDh71vE7+q3QO57Ibm8u98TBEFBzUcxmT5WRqfDJ9Le6YYZYUh/AauCPRlcDlAsO4jfdBp3zl/fs+mpUSRO1v3d8mvoOz7zu+QRDvwBrd/SrHEZfSbPRZBwT1ocqNG59UIRXLl/xfjIkoeGYwREwAv/3gypgXM5xsqibtJmtp8YfpAj6mJv+TpkZsqxyjq6z6d8agfehOuaJvEptlso7VYVmbhzHBGnMTSF1sDGbYUTQJ/LV5bGuzz1Ste1aa5eLY+qERiXnEKBGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7UzvInkoPVh1Viz+8eAC04BmXz5jiZZHJjsY2oi718=;
 b=SD/0CEstdQDvludd3KXwyl1IRWY+/5XczgCWeJXwmax2D0RSS/pbGdwvcFLGmsXyE2T2pwZnJjKjEnLN5m5oZmBCkpxyoF0eN0WYKP5PmO2rHVkWDdbQl5wEC1gEPa0yN8K/Uy4j1Sn4SedJMnKCXVRaxieWZ7M0fMWClwK1J+/Mn0wooMB7sJzU+Q+8WHHCuOQFcBo8ZeFwmyMPrhoUm9/yAJPbaYVrlstaw8r+GTwlrchMGL9+EJvqrVCvpTIsASA6LD2HNlKF7WDZqmjzGvqxprpu9+sAB9XjJ/YFB81G6ovzfkIkqT3smEc+kiTcW4S6wW4Nj+IaMAutrfKE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Thu, 4 Jun 2026
 20:57:41 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::d584:8d08:18aa:7b91]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::d584:8d08:18aa:7b91%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:57:41 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: improve Kconfig.profile help text for scheduler
 timeouts
Thread-Topic: [PATCH] drm/xe: improve Kconfig.profile help text for scheduler
 timeouts
Thread-Index: AQHc7t/9w/Stfd2oJ0uFEecNzxY8jrYu6zIA
Date: Thu, 4 Jun 2026 20:57:41 +0000
Message-ID: <1b83dac4dc9d9b4334717f1e77b9c5e336ea6b76.camel@intel.com>
References: <20260528202425.135065-2-rodrigo.vivi@intel.com>
In-Reply-To: <20260528202425.135065-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|DM6PR11MB4692:EE_
x-ms-office365-filtering-correlation-id: 3d2e8fd2-c1ef-4c09-4026-08dec27beb23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099006|38070700021|11063799006|3023799007|6133799003;
x-microsoft-antispam-message-info: tuXV9PBlOEXG745Wy+sj3ulUqku6F51p3IMZ+977i6D4EOJjFVQ0/8cI2US+eA5lJ8Fc0399k4rO2GYdRrqfEWTSgJfunJCOGoDDT0gz6Daa+UcqRS4TAl0Y3tlxP2kvCXbsA3RCa4cXK1L/JDPj/LsopQe0FuPgIWwK7Lwl6Nr2cHaIIUgQ6LWLFrkY2eSLF2PHurgFrHu+hvx4FnprqxGGmnZOdPs7VOiS7TsZPCCixjb029OAKwCDjG/cdo6D0dUFEN4GwbaXiKd7ik8B+yJey1+YFKLYgaNYd3XUzFOplRN/XLpy/llwxOoHIISUM5dDUwl/TE24U+py48N8vPgYJhPzvYieJ/7rLis8fbZ23yM5ekAKHqL+couuEWtGyYCWAuaKoIqHVvN7uF3+BAE+25gspJT+9mowBWTJUzXhgIITxxr6MgFjmF+4hFhkcaxnZks5DMR7LfXF3msY7MCTzENjw5bZEFQ27uSbnaRJcNKwuKHDQPBTUwdJ/KpQqZh/FqaM3XCn90qft5Pt5OknC5dtTCvsTfcBI/Mbf4y3vmWr76C+NQLntals++5lCuBUvQAlMKzw3n7IPW0JraxOSkN0ijk/K7HZjQoUTL6VgMEvKyYSeHN/B4m8xDaCMdgWzAbSKxj/pbmyuOA/Bf8/BTu6m8ovwy7IkudKKByJ2uN8g0ywLGUKTYX9mgpkvCIdBmSu//LtVH6Hih8G7yeKbnGGZSQUonqammUnfVq6OTfs2dNCgADPi98gB1jW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(11063799006)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUtQLytNUDlJMFE0Vk5QaHIwbHpmQ2J4ZVFOekROOFp6NmIyeEFMMW5kd3kv?=
 =?utf-8?B?dTZ3SzJLRWhvR09MakYrM09aLzdYaGZIVzhzR0UweCszRUQxVUNTY1N1Tlhr?=
 =?utf-8?B?azNnVzZLbHlTM1I3OFIzTFhXenAvbUJmQUhBeUlQVGVmQmNZQ25TdnZMZWhy?=
 =?utf-8?B?aXdVb3Z2UXRQY3FaUlBWTlRtbkNuUmlQNm1sV0lGaXVrSjlrcW81OEFFbEgz?=
 =?utf-8?B?eGdRK3lHS0VYbmtrVFlIMGl2Ulp6U3p2ZnYwTG5nUnEyRHl4V3Y0NUZKUjNH?=
 =?utf-8?B?K3l0clVuUmRYQkU0M3MzMDgzR1kxdEJEYkgwaVFudmVTbzNzSUQrV1U3WmE5?=
 =?utf-8?B?K3QwOFo4VHJlM1B3T0tMeHJ5ZDh6MWUvY0NHUkVJWGRBUHJyU2VHY25qeDVN?=
 =?utf-8?B?aU92dzZveS9idkVnR1VadGdKMndGUG5ZR2JPT1E5VU1SUVhUdFhCa1Z5ODM5?=
 =?utf-8?B?ZkVGay92cko1NS9CT2RiYkROM2ZWTmVaV2NsSWFGRjVwMUNjdVBRdWRmV0Zm?=
 =?utf-8?B?WTZDeEtJVnRmWkpQbDJteGVkcGY3c2FxTktRb3BiRkQrTy9BcHV1Qnlrcm9Q?=
 =?utf-8?B?d0hrUFhRbm5DQVRKTGZOZ1AyY1E0Q2N3RDd2aHc2TW4rZ29abWlIV0I0ZEZm?=
 =?utf-8?B?RUN4ZnNYcXIraVRINnA4LytpdjFHeHlMTHl4R3ZUVXQ2U3BRbDJvK3BxT0Ja?=
 =?utf-8?B?aDVtZXFxNklKZHgvRUZMMEJWNm9MRTRMU3hpd0JkQTVrVnNnZ01iMjlMYXkz?=
 =?utf-8?B?U0pNTnhEUndYYzNDNDY4RXM4d05mbTNEN1FIL3pwRWVPbEZhaEJVL2RzaXhC?=
 =?utf-8?B?SGZNT2J0OFhBV2pNZUVNaUEvbnJjY1c3WXBaeXJ3b2RrN3loNC8yZnJqLy9o?=
 =?utf-8?B?SEFkM05YRG1aV1RnRnIzRnRHa2dwVHBrMjlzNEszdGtoRmJ4S3g5emJpNXRn?=
 =?utf-8?B?MzZDRng0VWY1ZnJCTmNTdWtrbjNQZHNVSjlNSmRKZ09SejhQK1lPRmgxZDhi?=
 =?utf-8?B?ZXJ2em9uQW91RUdJK0YzMGdoSEVuV09ieGd5Y1htOTdYcVFHR3FFTTdWZ2Vm?=
 =?utf-8?B?REhMOU1HcHVwanBSVmhiM3lTcEFla1htSEgyOWhhM2ZONkxTYVFzVmZaOHkv?=
 =?utf-8?B?R3BEcGR2YnZOeGpRczZBUmdjNG54dHhTVzNCcXAvU3BJSFZxRDMyY3J2b3BN?=
 =?utf-8?B?VldhNHJzenI0dTlpMDBWSThPNi9ZczgzaCtmN2xqZElEK3lyTXdNZ28zdDRC?=
 =?utf-8?B?T1hRVmlLZ0NyWnJKRXgrVG1LR3JCbU5xZjNoSEV6RlptQTRCbkRsMVdkaC9s?=
 =?utf-8?B?Y0tWV0dERVhrSFRDQ1p3ZnVzaFhCbko3eWcrTWtydkJHZWdCMHcwVDlxREZw?=
 =?utf-8?B?T1VnTFg4VGxIZXF3Ykh6SkJSbUlTNXRQKy9xMmNVTnZONENtblFLVEx1Vll2?=
 =?utf-8?B?R0NORnZmQ2dZK0wyUFZ2UWZ0U3c5WW1NUEpDT3dWRi9NWlFGNVlHaWJxRDZS?=
 =?utf-8?B?d0lLZHM1MkdseCtyTWNuelJ4RStaS2xjWWpEWWUyWjErSmVqWHZkUm9YZXZR?=
 =?utf-8?B?R2E3QzdZUW1yWjhoNE9pS1NCWHB3Ym1qSGc2NTFlZ1V5bVB0YS96UVBIV2JE?=
 =?utf-8?B?K3VaRWZmbTJWemowQmZEM2o1NFVjdnJ4akZFU0tPbUJIbTYrMDc4Yk44U2hp?=
 =?utf-8?B?bEM3V0xjZXpsMUJydlg4QWZuODNwNy9pSldzOW5aUVRWbHJ4TGpqVWc3N3Vh?=
 =?utf-8?B?Y0k5SGZKM3BCRkYzMXpWNzllb05mSDR2VlM5b2tvTjNUa0RNbW1scURuWnov?=
 =?utf-8?B?UWlVQmE0amFLZmV6WnFzZkx5bnJmNTk3QjQxVXgxMWt6d1ZkcC9RSmUrQUMv?=
 =?utf-8?B?OXNuZm1FWUFpSENxWXRBRFRkOHZvVldBdlJIQ1dqQ1p5TVZOMDBROG53azNY?=
 =?utf-8?B?K1ZpdEVFZUZ5Nkl3aEMrT1NTS0YyTjdWMFdNeDlKTXFDRVo0Q1ptRld5OWt1?=
 =?utf-8?B?NW1tWCtMYnRNZEN0SDZHYWxKZ3NMVFRPZUVYWXJmNzlMdDJuSFJwcGZpcW5q?=
 =?utf-8?B?WWFVUWZZMXBpUGp1dEJzRVJPZEdWSU16MnJHR3V3NWFYNGNhM00yaGhzSGtD?=
 =?utf-8?B?S3hPUElEMXRxa0VBYUYxeUUzbG9SdTZpTFhvYnhoYzAwZEpiK2kvNlBqTGVB?=
 =?utf-8?B?eG1LY2hMMXkyOFFJSnhXRDN1eXc3UnFPNnJpekprTy9KZU94U0ZVa3ZlSXhr?=
 =?utf-8?B?WWgvVkNXOWVxbkRXQ0UzaWR6UFBYdnEyZEw4b0dhOG5mQktCUXhlWUNDRkdl?=
 =?utf-8?B?ODg3aHAyWkNiV05vVWFxZ0N0eXA0amg0bXFuMXRINW9CYlFZRjUxZy85MmJC?=
 =?utf-8?Q?B6lfDkI69bNZMXBA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86A37A75D872F24BBC3C3D07265286B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: r78EQzJ1r9U9rN9nuJ+bgZiqQBP9kXmFlRaDUhsvGkDnvoa2w+GNVxCLDJYr2mmQsTBiwFC5dPekkSCdH6fAnIuSy976cjjdFSSDcVbJtKpjNyuDyGM1AUk85+qtLf1RHjW7PpjQ5ik350Czjbcd+MljkWjBYaSIyhQgNwoT8UR41DeOJ/2gjvy6qIUFp2EbRMcOCscu5wwKqrYT5AJUy/JivnTkZvI6+rF2HQi5w5fpWvtteq5NZes+3/ly75aYeuPFJLpUWtcZ1Sn9KXB7BgwNnLfK0BdWWLnaOoCWmR1kuG89AlJyuTkEoi/8m6AU3t8uy2kjv78EYaPmZ6q1Jg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2e8fd2-c1ef-4c09-4026-08dec27beb23
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 20:57:41.4339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fve6pQuQjT+NcyHCOVYqYzZWQQFIjl+FxwviODzNZ36ZsnNSY7iPrIayBS3vL31Cu4BuR/7YrsGBynLKQGHrmSoWwxFAXIBnx4yPPkW6De4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

T24gVGh1LCAyMDI2LTA1LTI4IGF0IDE2OjI0IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFRoZSBleGlzdGluZyBoZWxwIHRleHRzIGZvciBKT0JfVElNRU9VVCwgVElNRVNMSUNFIGFuZCBQ
UkVFTVBUX1RJTUVPVVQNCj4gY29uZmlncyB3ZXJlIGJyaWVmIGFuZCBkaWQgbm90IG1ha2UgY2xl
YXIgdGhlIHJvbGUgZWFjaCBzeW1ib2wgcGxheXM6DQo+IA0KPiAgLSBfVElNRU9VVCAgOiB0aGUg
a2VybmVsIGRlZmF1bHQsIHVzZWQgd2hlbiBubyB1c2Vyc3BhY2UgYXBwbGljYXRpb24NCj4gICAg
ICAgICAgICAgICAgb3ZlcnJpZGVzIGl0IHZpYSB0aGUgU0VUX1BST1BFUlRZIFVBUEkuDQo+ICAt
IF9USU1FT1VUX01JTjogbG93ZXIgYm91bmQgb2YgdGhlIHJhbmdlIGFjY2VwdGVkIGJ5IHRoZSBV
QVBJOyByZXF1ZXN0cw0KPiAgICAgICAgICAgICAgICAgIGJlbG93IHRoaXMgdmFsdWUgYXJlIHJl
amVjdGVkLg0KPiAgLSBfVElNRU9VVF9NQVg6IHVwcGVyIGJvdW5kIG9mIHRoZSByYW5nZSBhY2Nl
cHRlZCBieSB0aGUgVUFQSTsgcmVxdWVzdHMNCj4gICAgICAgICAgICAgICAgICBhYm92ZSB0aGlz
IHZhbHVlIGFyZSByZWplY3RlZC4NCj4gDQo+IFJld3JpdGUgdGhlIGhlbHAgdGV4dHMgdG8gcmVm
bGVjdCB0aGlzIGRpc3RpbmN0aW9uLCBuYW1lIHRoZSByZWxldmFudA0KPiBVQVBJIHByb3BlcnRp
ZXMgZXhwbGljaXRseSwgYW5kIGNsYXJpZnkgdGhhdCB0aGUgTUlOL01BWCBsaW1pdHMgYXJlIG9u
bHkNCj4gZW5mb3JjZWQgd2hlbiBEUk1fWEVfRU5BQkxFX1NDSEVEVElNRU9VVF9MSU1JVCBpcyBl
bmFibGVkLg0KDQpUaGFua3MgYSBsb3QhIFRoaXMgaXMgbXVjaCBiZXR0ZXIsIElNSE8uDQoNCkkg
aGF2ZSBub3QgY2hlY2tlZCBpZiB0aGUgdGV4dCBtYXRjaGVzIHdoYXQgdGhlIGRyaXZlciBpcyBk
b2luZywgYnV0DQpiYXNlZCBvbiB3aGF0IEkgcmVhZCwgeW91IGNhbiBhZGQ6DQoNClJldmlld2Vk
LWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4NCg0KKG9yIHlvdSBj
YW4gZG93bmdyYWRlIHRvIGFuIEFja2VkLWJ5OiBpZiB5b3UgdGhpbmsgbXkgcmV2aWV3IGlzIHRv
bw0Kc2hhbGxvdykNCg0KTW9yZSBiZWxvdzoNCg0KPiANCj4gQ2M6IFBhdWxvIFphbm9uaSA8cGF1
bG8uci56YW5vbmlAaW50ZWwuY29tPg0KPiBBc3Npc3RlZC1ieTogR2l0SHViLUNvcGlsb3Q6Y2xh
dWRlLXNvbm5ldC00LjYNCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnLnByb2Zp
bGUgfCA3MSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0NiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZy5wcm9maWxlIGIvZHJpdmVycy9ncHUvZHJtL3hlL0tj
b25maWcucHJvZmlsZQ0KPiBpbmRleCA3NTMwZGY5OTgxNDguLmUwNzUxN2QxMjBlMCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL0tjb25maWcucHJvZmlsZQ0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUvS2NvbmZpZy5wcm9maWxlDQo+IEBAIC0xLDUwICsxLDcxIEBADQo+ICAj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gIGNvbmZpZyBEUk1fWEVf
Sk9CX1RJTUVPVVRfTUFYDQo+IC0JaW50ICJEZWZhdWx0IG1heCBqb2IgdGltZW91dCAobXMpIg0K
PiArCWludCAiSGFyZCB1cHBlciBsaW1pdCBmb3Igam9iIHRpbWVvdXQgKG1zKSINCj4gIAlkZWZh
dWx0IDEwMDAwICMgbWlsbGlzZWNvbmRzDQo+ICAJaGVscA0KPiAtCSAgQ29uZmlndXJlcyB0aGUg
ZGVmYXVsdCBtYXggam9iIHRpbWVvdXQgYWZ0ZXIgd2hpY2ggam9iIHdpbGwNCj4gLQkgIGJlIGZv
cmNlZnVsbHkgdGFrZW4gYXdheSBmcm9tIHNjaGVkdWxlci4NCj4gKwkgIEFic29sdXRlIHVwcGVy
IGJvdW5kIChpbiBtaWxsaXNlY29uZHMpIGZvciB0aGUgcGVyLWVuZ2luZS1jbGFzcyBqb2INCj4g
KwkgIHRpbWVvdXQuIFRoaXMgaXMgdGhlIG1heGltdW0gdmFsdWUgdGhhdCBjYW4gYmUgd3JpdHRl
biB0byB0aGUgc3lzZnMNCj4gKwkgIGpvYl90aW1lb3V0X21zIGtub2IsIHJlZ2FyZGxlc3Mgb2Yg
cHJpdmlsZWdlcy4gVG8gcmFpc2UgdGhpcyBjZWlsaW5nLA0KPiArCSAgaW5jcmVhc2UgdGhpcyB2
YWx1ZSBhbmQgcmVidWlsZCB0aGUga2VybmVsLg0KPiAgY29uZmlnIERSTV9YRV9KT0JfVElNRU9V
VF9NSU4NCj4gLQlpbnQgIkRlZmF1bHQgbWluIGpvYiB0aW1lb3V0IChtcykiDQo+ICsJaW50ICJI
YXJkIGxvd2VyIGxpbWl0IGZvciBqb2IgdGltZW91dCAobXMpIg0KPiAgCWRlZmF1bHQgMSAjIG1p
bGxpc2Vjb25kcw0KPiAgCWhlbHANCj4gLQkgIENvbmZpZ3VyZXMgdGhlIGRlZmF1bHQgbWluIGpv
YiB0aW1lb3V0IGFmdGVyIHdoaWNoIGpvYiB3aWxsDQo+IC0JICBiZSBmb3JjZWZ1bGx5IHRha2Vu
IGF3YXkgZnJvbSBzY2hlZHVsZXIuDQo+ICsJICBBYnNvbHV0ZSBsb3dlciBib3VuZCAoaW4gbWls
bGlzZWNvbmRzKSBmb3IgdGhlIHBlci1lbmdpbmUtY2xhc3Mgam9iDQo+ICsJICB0aW1lb3V0LiBU
aGlzIGlzIHRoZSBtaW5pbXVtIHZhbHVlIHRoYXQgY2FuIGJlIHdyaXR0ZW4gdG8gdGhlIHN5c2Zz
DQo+ICsJICBqb2JfdGltZW91dF9tcyBrbm9iLCByZWdhcmRsZXNzIG9mIHByaXZpbGVnZXMuDQo+
ICsNCj4gKwkgIE5vdGU6IHRoZSBqb2IgdGltZW91dCBkZWZhdWx0ICg1MDAwIG1zKSBpcyBoYXJk
Y29kZWQgaW4gdGhlIGRyaXZlcg0KPiArCSAgYW5kIGlzIG5vdCBjb25maWd1cmFibGUgaGVyZS4g
VXNlIHRoZSBzeXNmcyBqb2JfdGltZW91dF9tcyBrbm9iIGF0DQoNCg0KV2h5IGNhbid0IHdlIGhh
dmUgYSBrbm9iIGZvciB0aGlzPz8NCg0KDQo+ICsJICBydW50aW1lIHRvIGNoYW5nZSB0aGUgZW5n
aW5lLWNsYXNzIGRlZmF1bHQuDQo+ICBjb25maWcgRFJNX1hFX1RJTUVTTElDRV9NQVgNCj4gLQlp
bnQgIkRlZmF1bHQgbWF4IHRpbWVzbGljZSBkdXJhdGlvbiAodXMpIg0KPiArCWludCAiSGFyZCB1
cHBlciBsaW1pdCBmb3IgdGltZXNsaWNlIGR1cmF0aW9uICh1cykiDQo+ICAJZGVmYXVsdCAxMDAw
MDAwMCAjIG1pY3Jvc2Vjb25kcw0KPiAgCWhlbHANCj4gLQkgIENvbmZpZ3VyZXMgdGhlIGRlZmF1
bHQgbWF4IHRpbWVzbGljZSBkdXJhdGlvbiBiZXR3ZWVuIG11bHRpcGxlDQo+IC0JICBjb250ZXh0
cyBieSBndWMgc2NoZWR1bGluZy4NCj4gKwkgIEFic29sdXRlIHVwcGVyIGJvdW5kIChpbiBtaWNy
b3NlY29uZHMpIGZvciB0aGUgdGltZXNsaWNlIGR1cmF0aW9uLg0KPiArCSAgVGhpcyBjYXBzIGJv
dGggdGhlIHN5c2ZzIHRpbWVzbGljZV9kdXJhdGlvbl91cyBrbm9iIGFuZCB0aGUgdmFsdWUNCj4g
KwkgIGFjY2VwdGVkIHZpYSB0aGUgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX1RJTUVT
TElDRSBVQVBJIGZvcg0KPiArCSAgcHJvY2Vzc2VzIHdpdGggQ0FQX1NZU19OSUNFIHdoZW4gRFJN
X1hFX0VOQUJMRV9TQ0hFRFRJTUVPVVRfTElNSVQNCj4gKwkgIGlzIGVuYWJsZWQuDQo+ICBjb25m
aWcgRFJNX1hFX1RJTUVTTElDRV9NSU4NCj4gLQlpbnQgIkRlZmF1bHQgbWluIHRpbWVzbGljZSBk
dXJhdGlvbiAodXMpIg0KPiArCWludCAiSGFyZCBsb3dlciBsaW1pdCBmb3IgdGltZXNsaWNlIGR1
cmF0aW9uICh1cykiDQo+ICAJZGVmYXVsdCAxICMgbWljcm9zZWNvbmRzDQo+ICAJaGVscA0KPiAt
CSAgQ29uZmlndXJlcyB0aGUgZGVmYXVsdCBtaW4gdGltZXNsaWNlIGR1cmF0aW9uIGJldHdlZW4g
bXVsdGlwbGUNCj4gLQkgIGNvbnRleHRzIGJ5IGd1YyBzY2hlZHVsaW5nLg0KPiArCSAgQWJzb2x1
dGUgbG93ZXIgYm91bmQgKGluIG1pY3Jvc2Vjb25kcykgZm9yIHRoZSB0aW1lc2xpY2UgZHVyYXRp
b24uDQo+ICsJICBUaGlzIGNhcHMgYm90aCB0aGUgc3lzZnMgdGltZXNsaWNlX2R1cmF0aW9uX3Vz
IGtub2IgYW5kIHRoZSB2YWx1ZQ0KPiArCSAgYWNjZXB0ZWQgdmlhIHRoZSBEUk1fWEVfRVhFQ19R
VUVVRV9TRVRfUFJPUEVSVFlfVElNRVNMSUNFIFVBUEkgZm9yDQo+ICsJICBwcm9jZXNzZXMgd2l0
aCBDQVBfU1lTX05JQ0Ugd2hlbiBEUk1fWEVfRU5BQkxFX1NDSEVEVElNRU9VVF9MSU1JVA0KPiAr
CSAgaXMgZW5hYmxlZC4NCj4gIGNvbmZpZyBEUk1fWEVfUFJFRU1QVF9USU1FT1VUDQo+IC0JaW50
ICJQcmVlbXB0IHRpbWVvdXQgKHVzLCBqaWZmeSBncmFudWxhcml0eSkiDQo+ICsJaW50ICJEZWZh
dWx0IHByZWVtcHQgdGltZW91dCAodXMsIGppZmZ5IGdyYW51bGFyaXR5KSINCj4gIAlkZWZhdWx0
IDY0MDAwMCAjIG1pY3Jvc2Vjb25kcw0KPiAgCWhlbHANCj4gLQkgIEhvdyBsb25nIHRvIHdhaXQg
KGluIG1pY3Jvc2Vjb25kcykgZm9yIGEgcHJlZW1wdGlvbiBldmVudCB0byBvY2N1cg0KPiAtCSAg
d2hlbiBzdWJtaXR0aW5nIGEgbmV3IGNvbnRleHQuIElmIHRoZSBjdXJyZW50IGNvbnRleHQgZG9l
cyBub3QgaGl0DQo+IC0JICBhbiBhcmJpdHJhdGlvbiBwb2ludCBhbmQgeWllbGQgdG8gSFcgYmVm
b3JlIHRoZSB0aW1lciBleHBpcmVzLCB0aGUNCj4gLQkgIEhXIHdpbGwgYmUgcmVzZXQgdG8gYWxs
b3cgdGhlIG1vcmUgaW1wb3J0YW50IGNvbnRleHQgdG8gZXhlY3V0ZS4NCj4gKwkgIEluaXRpYWwg
cGVyLWVuZ2luZS1jbGFzcyBwcmVlbXB0aW9uIHRpbWVvdXQgKGluIG1pY3Jvc2Vjb25kcykuIFRo
aXMNCj4gKwkgIGlzIHRoZSB2YWx1ZSB0aGUgZHJpdmVyIHByb2dyYW1zIGF0IGJvb3Q7IGl0IGNh
biBiZSBjaGFuZ2VkIGF0DQo+ICsJICBydW50aW1lIHZpYSB0aGUgc3lzZnMgcHJlZW1wdF90aW1l
b3V0X3VzIGtub2IuDQo+ICsNCj4gKwkgIFRoaXMgaXMgaG93IGxvbmcgdGhlIGRyaXZlciB3YWl0
cyBmb3IgdGhlIGN1cnJlbnQgY29udGV4dCB0byByZWFjaA0KPiArCSAgYW4gYXJiaXRyYXRpb24g
cG9pbnQgYW5kIHlpZWxkIHRoZSBHUFUgdm9sdW50YXJpbHkgd2hlbiBhDQo+ICsJICBoaWdoZXIt
cHJpb3JpdHkgY29udGV4dCBiZWNvbWVzIHJ1bm5hYmxlLiBJZiB0aGUgY29udGV4dCBkb2VzIG5v
dA0KPiArCSAgeWllbGQgYmVmb3JlIHRoZSB0aW1lciBleHBpcmVzLCB0aGUgSFcgaXMgcmVzZXQg
dG8gYWxsb3cgdGhlDQo+ICsJICBoaWdoZXItcHJpb3JpdHkgY29udGV4dCB0byBleGVjdXRlLg0K
PiArDQo+ICsJICBUaGUgcmFuZ2UgdXNlcnNwYWNlIG1heSB3cml0ZSB2aWEgc3lzZnMgaXMgYm91
bmRlZCBieQ0KPiArCSAgRFJNX1hFX1BSRUVNUFRfVElNRU9VVF9NSU4gYW5kIERSTV9YRV9QUkVF
TVBUX1RJTUVPVVRfTUFYLg0KPiAgY29uZmlnIERSTV9YRV9QUkVFTVBUX1RJTUVPVVRfTUFYDQo+
IC0JaW50ICJEZWZhdWx0IG1heCBwcmVlbXB0IHRpbWVvdXQgKHVzKSINCj4gKwlpbnQgIkhhcmQg
dXBwZXIgbGltaXQgZm9yIHByZWVtcHQgdGltZW91dCAodXMpIg0KPiAgCWRlZmF1bHQgMTAwMDAw
MDAgIyBtaWNyb3NlY29uZHMNCj4gIAloZWxwDQo+IC0JICBDb25maWd1cmVzIHRoZSBkZWZhdWx0
IG1heCBwcmVlbXB0IHRpbWVvdXQgYWZ0ZXIgd2hpY2ggY29udGV4dA0KPiAtCSAgd2lsbCBiZSBm
b3JjZWZ1bGx5IHRha2VuIGF3YXkgYW5kIGhpZ2hlciBwcmlvcml0eSBjb250ZXh0IHdpbGwNCj4g
LQkgIHJ1bi4NCj4gKwkgIEFic29sdXRlIHVwcGVyIGJvdW5kIChpbiBtaWNyb3NlY29uZHMpIGZv
ciB0aGUgcGVyLWVuZ2luZS1jbGFzcw0KPiArCSAgcHJlZW1wdGlvbiB0aW1lb3V0LiBUaGlzIGlz
IHRoZSBtYXhpbXVtIHZhbHVlIHRoYXQgY2FuIGJlIHdyaXR0ZW4gdG8NCj4gKwkgIHRoZSBzeXNm
cyBwcmVlbXB0X3RpbWVvdXRfdXMga25vYiwgcmVnYXJkbGVzcyBvZiBwcml2aWxlZ2VzLg0KPiAg
Y29uZmlnIERSTV9YRV9QUkVFTVBUX1RJTUVPVVRfTUlODQo+IC0JaW50ICJEZWZhdWx0IG1pbiBw
cmVlbXB0IHRpbWVvdXQgKHVzKSINCj4gKwlpbnQgIkhhcmQgbG93ZXIgbGltaXQgZm9yIHByZWVt
cHQgdGltZW91dCAodXMpIg0KPiAgCWRlZmF1bHQgMSAjIG1pY3Jvc2Vjb25kcw0KPiAgCWhlbHAN
Cj4gLQkgIENvbmZpZ3VyZXMgdGhlIGRlZmF1bHQgbWluIHByZWVtcHQgdGltZW91dCBhZnRlciB3
aGljaCBjb250ZXh0DQo+IC0JICB3aWxsIGJlIGZvcmNlZnVsbHkgdGFrZW4gYXdheSBhbmQgaGln
aGVyIHByaW9yaXR5IGNvbnRleHQgd2lsbA0KPiAtCSAgcnVuLg0KPiArCSAgQWJzb2x1dGUgbG93
ZXIgYm91bmQgKGluIG1pY3Jvc2Vjb25kcykgZm9yIHRoZSBwZXItZW5naW5lLWNsYXNzDQo+ICsJ
ICBwcmVlbXB0aW9uIHRpbWVvdXQuIFRoaXMgaXMgdGhlIG1pbmltdW0gdmFsdWUgdGhhdCBjYW4g
YmUgd3JpdHRlbiB0bw0KPiArCSAgdGhlIHN5c2ZzIHByZWVtcHRfdGltZW91dF91cyBrbm9iLCBy
ZWdhcmRsZXNzIG9mIHByaXZpbGVnZXMuDQo+ICBjb25maWcgRFJNX1hFX0VOQUJMRV9TQ0hFRFRJ
TUVPVVRfTElNSVQNCj4gIAlib29sICJEZWZhdWx0IGNvbmZpZ3VyYXRpb24gb2YgbGltaXRhdGlv
biBvbiBzY2hlZHVsZXIgdGltZW91dCINCj4gIAlkZWZhdWx0IHkNCg==
