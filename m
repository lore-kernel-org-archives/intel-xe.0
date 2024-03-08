Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F70C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 10:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC6610E8C8;
	Fri,  8 Mar 2024 10:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN+0su4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95E10E8C8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709893751; x=1741429751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xyLM/uJSo4XUxJDeCmoRFSU59fni8kUFE1pyMYFScEw=;
 b=EN+0su4W77kKnZVfmMWz8//lnRNC2CInMK3sf36ZBDlve2YTuczkNuW1
 Yh6tRvWYwFe0RqeldYl8NQYb9nHcGdSwX3WoXASyUTffbzjDEmQd/eU1a
 0Lr9ek+VE8bueJLj8X58968LPvcbtNBRSutjPiS/Xu0jADLFbjylK6Alk
 ESJ+lA0qSHCZBzK16rwI7wDOH8fthl1Wgd17ZdffxV6Z13vVC4qF30TQU
 iPISxGqS7fSm9RO1MF6vbo1HDC071/lTPamd7RFXovXWCTxQXboe1gNuO
 le2/51X5iQ7J8ldHBz1ugKq3ytlz7Su3Dl+QVWldeJr0cvVjqbden+wkw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15255530"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15255530"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10299530"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 02:29:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 02:29:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 02:29:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 02:29:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 02:29:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qzl6nSk967GuTvxlLNrXNn9eZoijYgsqm+fDq+KGVw5ZJ1sPdyXLZaAe2o2vex9l8b6/g8ug16aebYBjcWQsUe4QQbDuDKTt80BCL2M6BDlpt9biE6oBv8Fw7vpBOZQyj1CSzPVBlw7lOGof78j3TvP4kCy+Ha12c9Hm6iccUdbQQjwtHCXA6iD00vQLCRL5qM7kVu1Ru+sDPZDcPbS5RyeGLuAMomDdVeoPytaoRTezxitOYQ7u6kXppvUNWmHls+xGRkLbfvwQHAJ+sVRDHxN+W3hQ0h7Ju9qEbPwtT14gt0/ODxhW4WkT5uL1vCTcsdMJf27N4CQsa1+cr6t6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyLM/uJSo4XUxJDeCmoRFSU59fni8kUFE1pyMYFScEw=;
 b=G8IgMBG4e2g++Q/q3XDdAKvJzmjxeOLEemEXAVUnp1ML3/SQ0xGI6qYSxIvgmgYEX2UEZyj2uKkseoqGCBk5bm8Hh7eYkXGFTzOSTFuYyFupgExvBLTqeyBz3MGfg9f1z5aL6F2CcqcPBa/FDYqr6GJ7YaRdUPsSbzPc4W1cVlp+Z8kfkNSOFwUQBivk73bRRPqaohQZcMvXHLA4YKistrt74UPohTAUa9Adg8Ebw5HBDXzlOsFnnYVXhdXdPtLmpXrUUmcNJPDTcpT8miAoRm0mZBcSQpxC/JU7xezgvWcNPmCHtcVUzFqAGtdVp28jrSQ86QHd06SK64+Ze9n6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 10:29:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b%5]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 10:29:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH] drm/xe/gt: Remove redundant num_engine check
Thread-Topic: [PATCH] drm/xe/gt: Remove redundant num_engine check
Thread-Index: AQHacSTvmrzrYDafok+XEwtYpsDOB7Etm1GAgAAI6DA=
Date: Fri, 8 Mar 2024 10:29:07 +0000
Message-ID: <SJ1PR11MB6204115AB85BA65F78AC3C2981272@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
 <ca8373be-d0a8-402d-8e4a-09637c1e3217@intel.com>
In-Reply-To: <ca8373be-d0a8-402d-8e4a-09637c1e3217@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4765:EE_
x-ms-office365-filtering-correlation-id: c405166e-fccb-4bb4-7254-08dc3f5a9638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ooZZFPhmvY9Bt9jLr+eyZeb9M2LX7vC134QNDtOYFqweoWjaALo2QpizcW25qAY78ZRX0E683L9c9R89zpmRHXokJ657woUy7PLSrrq6d5PEPLjs5M1b+/krU2gbJn1kGJ0yxsCRmLuvRmz1ACecQcDHdm4ByXYIseQp6bF3TLfUT7rbiAe+HWDoRscDHvx2wsWS40a4XPQHVefEkKsQNzjMS0BYIGqPE6jV+A3KExdsjLc/V16xBEifMrR90E84xkTbTtCYVYa906TTvTYT8tPzOJmu5Rj7YJEA9Z6oHaG1DtUEGvTdj62WpkjzvlQJCqAeGGyIj+f9oGKRKQipWFrU3rl4LZ/E3jW4qMOk9yhV1r9BUeitMfw6Qn3ZxoU1IzXhWSljem0/NUOVy0T3PUAQRijbuAwJ282R8VM4rb9Dlp9eivXaAYmkR9E3jpvPMNYDJWcMiwKvvxjdgfP2M+3cGC9qXDm5Dl5O+UPJQRqJRNGKTACR6iKg2+GMRuV+o1IYP+rjQZZZWreiHfbuTiKa0FxayHnfYyw1+lgRaxEn3iNn+/WIcHCVdLi8TYOrHPDyTAUTaeTygyim3kYYWyl4n9mHGuCAbPien7pLP77fhla0FVoOzdkNMEYj59pgRpAtRT8yFvpLkwsCyTxVsD7uMYBV+oEIGDJ7lwA5wb4oGLzGBgkBK5D8AMzi4o86+r5usgeKQprD6M64ANvUbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3NFLzJTalZPYWRwQnJkRlRWQ3I4akJnL3prYzFPRGZOck4ydUxONUV3YVk3?=
 =?utf-8?B?L0F1TW9Iekl2RGFtTy8wY2pPYnRiYmdpWFBXUTRJaW4zUWZOYW91bDJneGxt?=
 =?utf-8?B?UkF2M2VPUGZvV1prb2k1TENWYTg4N1llam1wT0wzY3Z3U2ZKa1hsdk9DU2Js?=
 =?utf-8?B?Ulo0eTA1RC9RUW9hcUR3RnFiUkh5Z1ZMNmt0SlVEUGtkS3NEb014bElXQWtj?=
 =?utf-8?B?SHgxS0R2QjhmVHF1NlhNMU11K0dzSFRqT00zY3NqUWJFQ3AxN0FJNkhkVTBy?=
 =?utf-8?B?VXNyVHJyZ29ncnpBaklUcUZrVXNmeWFCNTJ5Y3FIdHdqWUVFOEdyc0JSZ29z?=
 =?utf-8?B?WnJBUy9LQmF2S0tWcEdEVUlDQUlJdXp0cFpWTmNmY0hXRUZTY2tmVEdBczBO?=
 =?utf-8?B?WEJFQjNaZWkvRlhGam16ZytmeUxJdFhremNJZVozcnVNeEQzQmt1ODJ0NGtF?=
 =?utf-8?B?dUp4UFY0R0g1ZjEyL2hRelZlTE1QcGRnVk9pVm9LRHpLeXpEMkIyd0UwUVVn?=
 =?utf-8?B?RVdTdzU1QlVJTDhkQWZ2ZGMxZHZMVHgveGVtY0pZVS94cVNJNHJNMVRnd0tw?=
 =?utf-8?B?Yk1rMkNzRGhxdTBzVVZ0WGFTSW5uYmhpS2VxbVczUzYzK2g1OTNHVzdIeWl2?=
 =?utf-8?B?UVc1WWl0RGMyRjZ2bzh2RzJDNFBNOHk2ZjJ6aDNnaVRWZEd0UmErSGpVbnR0?=
 =?utf-8?B?QUhhMlhUNXNMeFI4NERLNTVMNExHVnQ0QlR0SU1PVXVwOFF3RFR3WjhvR0k5?=
 =?utf-8?B?Nlo4Ynh6dU9vNTkzZFRibnNQTmFMK05NLzYzdm1TS2daOGZRZzlkK3YvaGJX?=
 =?utf-8?B?VEJScm42U093cUE0L1JsN2hJWjJwc1RSUDdtNUFKVCsrTmJBaHM0MDhNZE1R?=
 =?utf-8?B?S0xlUmdabHYvNHhValdkZkp4S21aVzNRdzZhR29CWGZ2Rk9lVm9LbXhPTTRu?=
 =?utf-8?B?OEpyTlYxbWRiUHJDQU1tazNFMEVIbDBlV2llMkZtcDNFVlVFN1V0U0I2d2NS?=
 =?utf-8?B?VGs4aTJnU3E5emJDbXB2aGJtYWZzbkZDeUpRaWZwOUZMWGQ4akw1a1R2V0E4?=
 =?utf-8?B?aUpmckdQTHpLT0tnRVFaZUlTZ2N1c2E2clZFTU94eVgvZUg5ZUt2Z3ZvWEVL?=
 =?utf-8?B?OWdFWGhjZEMxWU1PenFvNEl4Z0dxQytkUjZkNytQTFZMMkg0TGZVQ0hyblhu?=
 =?utf-8?B?WXJBZDExRExUYi9VR1JQVGoyR3d5bmp0b0Z5ai9NOXF5Z3B3MVRyVXVBYW0y?=
 =?utf-8?B?V2ZKZi9YZW82RVI4UDRGNmF5aitaZ2pYYmh2eDMzTDlLNjhPbEFQZ1NzSXpx?=
 =?utf-8?B?U2hrdzFwRGJub3dHV2pWMWs0Znljc3R2N0h3N1RFUWNXb1NSVDJFSHBmcTdv?=
 =?utf-8?B?bEVwTlhDSlY0elBnYk9oTXJCTDJqRGMrS283OEplSUNPSGVDYUJNT2l6Mnp1?=
 =?utf-8?B?TWZ5MzVpeWpJVWNuSVZGUG9pZFVxR3BjL0JNbGtuYURaeDVyRWVSemI1N21H?=
 =?utf-8?B?S3F3NlNsUFAvOXJwaE1tWmlqM1RSRHd5Mmk3ZGJzQkx4LzBzQlk0TEhGejhX?=
 =?utf-8?B?LzUwRTNnU1hyNVcxajVSTVRNcnQ5bEhWKzVSQ1ZEeHBXanZnL01pOXJ4NENJ?=
 =?utf-8?B?U1VsSFMyNE5MVFBNa0pmV3EwSlc2R21yTnF2TmlxazBFVzhqeHZCY3ovTjlO?=
 =?utf-8?B?WDdOMStnTFpjc3NyRE5jcmdnQzNsQzRFQWFsRkwva0Rqb1ozQndhdmpvb2JY?=
 =?utf-8?B?TW9GSFJnaTl4TGp4L2ZrdVVYR05rcEhJSlBwZlJaakhpU0YzREFFY2paRGto?=
 =?utf-8?B?RWZjMHBwT2hpZWRTVE9LaDlDOTFyQVJNS0pRSTVsODFhUWVhUWtNbDB1b0dW?=
 =?utf-8?B?U1p3ZDNDTzJvOEVYNnphNi9JMCtQMVh3ekpoSmw3NmFaWXg5Ky81emYra2VE?=
 =?utf-8?B?dTM2R2hJZnVRWTFPamxHSjVnUUpsKzFXRGQwNVJTRTU3dGpPejNMR3JkTWlp?=
 =?utf-8?B?VjVjei9BbjJIQVN6NkJMUk42MGd1Ri9wOVNaZEloVDd4TmF6SUQwY1RtWU5N?=
 =?utf-8?B?QU0xcm56bmZhUVNNOGVBOWw3T1ZsUjduSFhqei9BMW1sTjMwRnhtbVQ5SWpP?=
 =?utf-8?B?bkltYUxYN3F4NlJIK2k4T3RxZkUzSkY5aEN5ZUdKc2J0M2RkVG9OQzZjVUI3?=
 =?utf-8?Q?1pdD6ZAISSrQREzV29pi84I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c405166e-fccb-4bb4-7254-08dc3f5a9638
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 10:29:07.9580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYXUJTSVMn/xZGyRxtKb2SajKr8E57xWGunRwRU7TMK43RMwOOBIPBKVAeuqp3XjzannFfkHNE3pfQK3bAw3uYc69I221yjnr+tgQ5ttr8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDgs
IDIwMjQgMzoyNiBQTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRl
bC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBBbmRpIFNo
eXRpIDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT47IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5q
YW5hDQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL3hlL2d0OiBSZW1vdmUgcmVkdW5kYW50IG51bV9lbmdpbmUgY2hlY2sN
Cj4gDQo+IA0KPiANCj4gT24gMDguMDMuMjAyNCAwODowMywgVGVqYXMgVXBhZGh5YXkgd3JvdGU6
DQo+ID4gSW4gX194ZV9ndF9hcHBseV9jY3NfbW9kZSBudW1fZW5naW5lcyB3aWxsIG5ldmVyIGJl
IDAgYXMgaXQgaXMgYWxyZWFkeQ0KPiA+IGNoZWNrZWQgYnkgcGFyZW50IGZ1bmN0aW9uLg0KPiAN
Cj4gYW5kIHRoYXQncyB3aHkgd2UgYXJlIHVzaW5nIHhlX2Fzc2VydCgpIGluc3RlYWQgb2YgZXhw
bGljaXQgY2hlY2tzLCBzbyB5b3UgY2FuJ3QNCj4gc2F5IGl0J3MgcmVkdW5kYW50DQo+IA0KPiBu
b3RlIHRoYXQgdGhlIHB1cnBvc2Ugb2YgeGVfYXNzZXJ0KCkgaW5zaWRlIG9uZSBmdW5jdGlvbiBp
cyB0byBlbmZvcmNlIHRoZSBTTEENCj4gZm9yIHRoZSBjYWxsZXIgd2hvIHNob3VsZCBiZSByZXNw
b25zaWJsZSBmb3IgZG9pbmcgYWN0dWFsIHJ1bnRpbWUgY2hlY2tzDQoNClRoZSBzdGF0aWMgYW5h
bHlzaXMgdG9vbCBDb3Zlcml0eSBpcyBhbHNvIGNvbXBsYWluaW5nIGFib3V0IGNoZWNraW5nIG9i
dmlvdXMgY29uZGl0aW9uIG9uIG51bV9lbmdpbmVzIHRvIGJlIDAuIFNvIGRlY2lkZWQgdG8gcmVt
b3ZlIHRoaXMuDQoNClRoYW5rcywNClRlamFzDQo+IA0KPiA+DQo+ID4gRml4ZXM6IDBkOTdlY2Nl
MTZiZCAoImRybS94ZTogRW5hYmxlIEZpeGVkIENDUyBtb2RlIHNldHRpbmciKQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jIHwgMiArLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Njc19tb2RlLmMNCj4gPiBpbmRleCA1MjlmYzI4NmNk
MDYuLjJiYmQ3YjIwM2NjMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfY2NzX21vZGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9k
ZS5jDQo+ID4gQEAgLTIyLDcgKzIyLDcgQEAgc3RhdGljIHZvaWQgX194ZV9ndF9hcHBseV9jY3Nf
bW9kZShzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiA+IHUzMiBudW1fZW5naW5lcykNCj4gPg0KPiA+ICAJ
eGVfYXNzZXJ0KHhlLCB4ZV9ndF9jY3NfbW9kZV9lbmFibGVkKGd0KSk7DQo+ID4NCj4gPiAtCXhl
X2Fzc2VydCh4ZSwgbnVtX2VuZ2luZXMgJiYgbnVtX2VuZ2luZXMgPD0gbnVtX3NsaWNlcyk7DQo+
IA0KPiBidHcsIGluc3RlYWQgb2YgZHJvcHBpbmcgbnVtX2VuZ2luZXMgY29uZGl0aW9uIGNvbXBs
ZXRlbHkgdGhpcyBzaG91bGQgYmUNCj4gcmF0aGVyIHNwbGl0IGludG8gdHdvIHNlcGFyYXRlIHhl
X2Fzc2VydHMoKToNCj4gDQo+IAl4ZV9hc3NlcnQoeGUsIG51bV9lbmdpbmVzKTsNCj4gCXhlX2Fz
c2VydCh4ZSwgbnVtX2VuZ2luZXMgPD0gbnVtX3NsaWNlcyk7DQo+IA0KPiA+ICsJeGVfYXNzZXJ0
KHhlLCBudW1fZW5naW5lcyA8PSBudW1fc2xpY2VzKTsNCj4gPiAgCXhlX2Fzc2VydCh4ZSwgIShu
dW1fc2xpY2VzICUgbnVtX2VuZ2luZXMpKTsNCj4gPg0KPiA+ICAJLyoNCg==
