Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2A9F54ACB
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C1110E176;
	Tue, 24 Mar 2026 14:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSGhqhy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5B110E176
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774364016; x=1805900016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hHFe3h+kymvkRra9X4NmBCQRheN7cRZ/JPZ3pCWQxRk=;
 b=LSGhqhy8W+Mrfp9Rd3AD3Sdc/Yll8T5pCGtk+RFIjpBUj6Kh7NWHaSRC
 eSPy1+dbSAAC5sl+RqH1kSYUu493zwQqNnLd//3GpiFj6XDAHLi1vJY0a
 oAsnM4iLNdufgRxKyYwJSFLa4I99jTy6c1Y4mTbSthQYAitGk3lRjD51S
 HayOybVV9sSOs1ZhTaEGEKuOX19UPTBpCWkxz04OA7FjxF2Q4mVEGH4rE
 6j05On+zWYDjorL5GSGIEySvA/txVFLY1ylM1XQLMn4HiJpCeukyFvaRL
 VQR3eWUAsxsqLhAY4n3jX/6EfXx6AEf7XN7tyaI25kdLoBvmTWWoZWzNT g==;
X-CSE-ConnectionGUID: LnvYM5Q+QsKGMPl1y2RrcQ==
X-CSE-MsgGUID: LKNJmTkLTEi5Ax5wD4DSyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75498777"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75498777"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:53:35 -0700
X-CSE-ConnectionGUID: 3EknH/ZVSV+qKp3ckxO8Gg==
X-CSE-MsgGUID: XMJxnZV5RGyeogSwuNDUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="217802235"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:53:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:53:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 07:53:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK9UjXSL9VY6fjtvcSxCCLHlsP5YlW/b7R9dztfCNkmv0FIZNJA/x4FTek9b4RLhjunj9f63DD3kup7BC6xeQIZgIL5EJ3i8BpKX0covpOaVGleBXeEUA1azNhM5v9k3OurQCKtA2/07BcFLEggSt/dyo8ZeYIh4SEdtevytUtAOU+ZAErkn0Gw4vBSJZ/F28osoIy5+UDCJLmJuhQbXdALxU6sK7xhgFteW/91rXDdWl1NP6DNmTLB+tk2vGdgVCsIXCBCdsiK3oI3IXBcAzt49vVfreMNw2zx4yIoWaxKHm0MOidoA+mOb7kyqM44uoIw8orC07xa1eZlKzza18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHFe3h+kymvkRra9X4NmBCQRheN7cRZ/JPZ3pCWQxRk=;
 b=VKY+AixYZ4U807Payf6Stx9ATRKiylgpvYJgLs3ujIvR7D+6+sPKGmtteMwhLON21KQbYWXXdnjlDZfURpPIO628GKexmene8FOHWeHF/nqgCYJlE5YxQV5XHcaZnXMnx88MO4IO+sxsYFqG5ctO3NmChbye64kc22uXL3nszhcLsAMDEWeqaogRCGkt+bnb+5w0MAVu17zQRa+0kixJbiuaXC6m8HNDPWsXUWF9+zuNzo4v9LzU/2D3NhQQqIIT6Cpprw064D0gktOIzcEqylUNjS4OhK/0OSo87kabkNQO5m6mIj975QotcF24JPZQjdbykuwAMrbi8bfW89uv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 14:53:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:53:25 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Thread-Topic: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Thread-Index: AQHcuwqDvtaeByK1NkStSwXNeI4hObW887mAgADSHoA=
Date: Tue, 24 Mar 2026 14:53:24 +0000
Message-ID: <0e9794ab3a16896d0790289750f56538602798e6.camel@intel.com>
References: <20260323211743.285064-1-stuart.summers@intel.com>
 <acH1IT6MBYvSf2GH@lstrano-desk.jf.intel.com>
In-Reply-To: <acH1IT6MBYvSf2GH@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 1a340653-65f5-486c-97ee-08de89b519f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: IimeJYb4/QxjweeYGxejftSfuD9fKBPG9dLwO1nqQn658Zzf0e6+dRg9p1gFBtAy0iEaz868pfuMIcjas0ON6jssAQRhWXX8Ng9vAZIRF19oJ0SnMW1vpB63N8z4sj3Szwr4lMOLvdVS/7/THw10B8tv4rGoJBFOxR222Ei8adeKJodhZZzErY08K3PnZo+dab5VDickUHwWqBKaMt7kx1duu5AyWotVecooUHn+1Eoyis0OldSvS5nvC/KuIWVRQwF12CmJTXSWy9nEEj8FiAr4Id4eUoowshL78/RsX391ndZgyEoddUClNb4o8CVs2csjHKyFb4hBr3UMFUKDSEGJdximrsALfK7K/MxUcDL+ewXW7bRNLOECPG5yUzmjl0C4jwNM8JhqbuDChEGzUTkNWj/8JRSPxc6hq/za2qns8JWSA7Mc0KLdnnpE9EW0hyXzwe1gQ4Xp+Gql2dLy+N90rrtMVi90QXZN6RhOuUGMi84gGFsNX+hgfQd/8MmUZtfrGY+jqeehULFvb1dbLRPHUYp+ucdFr8tpmbWkYXKsNIqaLzDiliyqT6Ex3yem+UE8gIcT8hr0k5G3X7bYOTAVLLLnvqc9q4dBZZwf29AIv3hX5wRpaPK/e+GzSadvbS5BoH1xIGAKq7J0zFvs5MBGdvgBIJY4m10cdRF1rF02t6OZ5MuMHzTuPeqx2E5WOiDXaUIRtJCksWJkZkYIYntvHC9ZHmxyDxBStn/koBmEAz52EPDzek/9RGES3MwHWznxqDkmdy45J/l2kMA7xko02o7Y15vSez5t2ylAGLM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEZjcXhWSlRCMTRleWpYZ3NtT2YrVG1DQWVHU3VVN3BvYXg5cEJnUlY3cVNi?=
 =?utf-8?B?NTZHbGJaY0p1cHZFeFNFOXNheTBsZEJUV3lBYlk3M0taR3FmMUJzemRpYkR2?=
 =?utf-8?B?VTFXUlJiMmdEdFRPMTFXcmJ3UFZ1K1NQZUcxc1hrV1dhRUlQTy9TWWF6OVJj?=
 =?utf-8?B?MGRNekpRVWVOdStaL09iRWdzQ3RwcG1SNmE5QnV0S09kTS9wSHBCTDcvTUhy?=
 =?utf-8?B?Tm1wVG9BRmhjWjAzcENqVVNHSUVzbFIyZlVOc0l4YWlMVXZOaDNsL1JZWmla?=
 =?utf-8?B?bEVPSkdreXA3bFJaYWsvUFNGVU9qRzhaSkVkOXgxZkVaSmJxZ2l1NEJkWWMz?=
 =?utf-8?B?UWdlL3FCUGZYeEhzMm05QmV2eWZUSUIycWhiWmxDSnlBZ2RmZXZsdHFKVHZk?=
 =?utf-8?B?STFlQzRRTHZBYnowanc3c3Njdk5nV1JOUWxjc2JmcWdRdUJpR3dCWE9rVFJ0?=
 =?utf-8?B?OUJrMVc0RGJVL0tqNFgrSEluaXRxdDU1RmxPYzRTbVV2Nzd3N0xza2FGdWp4?=
 =?utf-8?B?cjVJUEpKVkgxbDM0bEhlSEtLcXZONkgrQnVmS3dSM1V6QkRQWVllb29UY3RE?=
 =?utf-8?B?MndPMVNOUDhub2NBUUR5UjRtMTNCbUhNR3dRSG1nUTRULy9EZVV3S052c1lD?=
 =?utf-8?B?amtrRW5vNG8yTzFnVmZmcWlLK2VEaXk2OCtTZHVJaUpobU8yY1dTNTRDM3Br?=
 =?utf-8?B?NkVTcHBkQ0xjLzVaOWk0NFhXMURXQnNyYVBHbURIbGd2c0NKdFB6TGU2b0pF?=
 =?utf-8?B?eFN3VG0zVkZZNHpESG5RMW5aZExHRmtEZXlmZlFaVVQvRU1EUHI3NkI4UHVS?=
 =?utf-8?B?d1AwaFZEaXI4ZXNuTnNWd2VyRTdKVmlncjVYeXlDeUhXbzBMbWIvTVUwTHQw?=
 =?utf-8?B?Q2lvM29WR1EzNnc3Wkc2ZHVMbm5MVmJKdnJ1WjlPRkNjN0xzT1Q2RnlRejZt?=
 =?utf-8?B?RXVHNTRHQVJBb1hnS011QTdhcTRvL0ozUVl6ZWQvNUpyTTBGakI4OEM0Q2sw?=
 =?utf-8?B?bkZBcUF0b1I5d0NCL2dycXhOZ0V1TUF2M2xDc1JlOUJJNTRNVXZpZm9PVVhD?=
 =?utf-8?B?QlE0azAreEkrL09DYTd4dS9waVNZUmlVUUUyaGFjbUFOZnJUejJaTHpyY1ZK?=
 =?utf-8?B?dzdEYVNUUmh3MjhTSk11cS9jN2tNajQ4U1N3UzkrVTdDam8vZVRXckZDMmlr?=
 =?utf-8?B?dGlJdloyWDFxNmNTOEd2cVJucDkvSHUxR1FvejBkWDdiRExHR3luWkhHN1lJ?=
 =?utf-8?B?M3RNak5LclJ1SHV1RC85VGp2dlMrSDNyWmJ2RjJ6R3BNZy9pZ09Uc2Z4T3hL?=
 =?utf-8?B?cmtMK1g1UG9ic0pPbGZ6VEJReCszU3Qyb3Q4b0RiL3J3RHRJR3pVTm94dXJw?=
 =?utf-8?B?QUpTOVdQNnEvTHZxV29TRzNwc0xuT1pEcWhLR1Jnd1FxUXJwSXdudUpNYjBi?=
 =?utf-8?B?NUpLWFk0Zkg0NDJFR2lxZlB3NDhQcUQ4RjVTMkM1VFZJU2JlQ3poZDJtR0FN?=
 =?utf-8?B?UnJJVzN4MmNsZFdBWW9sSVdtakpjdm05NGsyR2JMQ3hReHpjbi9RanN0Vkdw?=
 =?utf-8?B?ZnFrTXhoeW9yNWVieXRQRW1SdTZnS01DQUloYVhzMUNHWFhiWENGclBZc3hZ?=
 =?utf-8?B?dVFLdW1sVzUyVzg4WHNDM1RpaDVkNy9WaWVzb1VvdjdORjRyeHNqMy9wNU9k?=
 =?utf-8?B?WjZTY0Y3Rlp1cU1iaVhjbjNyRTF0WW0ydXFDZ3k1UTZWbzZGVjhiNS9rblpi?=
 =?utf-8?B?WU5JVlJhNnJadGFRbVhZTWVqTTJCOXBlNDJqOUdWNEhwNkV0TXcrNW9EeUJJ?=
 =?utf-8?B?dlBhZG9pS3N1ZzlSWWY0eHc4clBQREVPNndFZ1ZkeTEwelJhQXFjNEREQmVP?=
 =?utf-8?B?Zmo2bGlpMHlhbXFlRnpYcE42dHlBVnQ3elcvaVhMRUlXM1VGL3EzVVpTcXQz?=
 =?utf-8?B?bFQ4ZzVrREE4RGdiQVVzNjJsQ01IZDRvYk15NlRtQWRBM0o1cXVlLzQwQndI?=
 =?utf-8?B?YjZVNE02R29icjZNUkptVzl5OThaMWpJNGNtNmltTFpNdFNXT1RFd0prV2dS?=
 =?utf-8?B?VU1YZGhBYjNoQUJ5VjVOd3J6b3lLMUl6Mi9kdVRpL2w3TUMzSEVVUG56U1VF?=
 =?utf-8?B?ZmVoYllrRmlKRlRWUG9ldFd5aGd1QVV4UWUrdllGQ3dxMFdxOWR3MEl5SEQ1?=
 =?utf-8?B?NkFsU3k2RXcvRWNTWERMdC9SOVRRWkVnWnhVWXZ0UEVUcG9qcS9DSTVZdFdh?=
 =?utf-8?B?TG5Ib3FCY3BRSWN2Y2FaQW1rVmpmWjV4LzZNSmx4UmIzWXM1ak1LdDlVclBE?=
 =?utf-8?B?TnlySmJGaU91TE5LRCt3WE4rdnp0OHRWQjVkMWxZZW5uODY0RGtCOXZ2cUIr?=
 =?utf-8?Q?gzxXBCDSKd9Vs2Ks=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CEE92526D7D0F4E8BCF4B70F6F50D48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jEPiOpjO/7yCQqZSL0a880sxBZsB1VhYiAr6wTY8jxfU4sBkqXjTWFdZNkQSiTKQKlldt8sH4dtQQOHz5ozlTaoJ3HievUm+S7chlt/ePM9Qwxf2K2jReJ17RGX0FZKIvNbDrHEOCsmmDvoHZHM/jKTrmVydXJlCJiKT6hmOQedmOuWfXIo9MBGCycnwiQjvEEe9uKAhTAQyvIou0RmCsn7sOy1b8hZ9c/4v5zCRs/XslwRUUIRQgB6731QGIJP/w6a1Ric7dZUYYym0SRsJy4HOqUiGHqnkpILopZlDAC8TRZmr7lgcbe7UDZAJng9In6ODeoTEjhaelYEydx3LJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a340653-65f5-486c-97ee-08de89b519f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 14:53:25.0184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dl0VZOdR6Nesv4kUxdparHnPRJpogd0oxO2VWCWdr3wgGwqIcAzDaF0P41Ob6bebi/X4X6OrzGUX9RHHPC5OOEIotSZoO7TIfpG1z92DwYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

T24gTW9uLCAyMDI2LTAzLTIzIGF0IDE5OjIxIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIE1hciAyMywgMjAyNiBhdCAwOToxNzo0MlBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBSaWdodCBub3cgd2UgYXJlIG9ubHkgaW52YWxpZGF0aW5nIFRMQnMgd2hl
biB3ZSBhcmUNCj4gPiBydW5uaW5nIGluIGZhdWx0IG1vZGUuIEZvciBub24tZmF1bHQgbW9kZSBi
YXNlZCB1c2VycHRyDQo+ID4gVk1zLCB3ZSB0aGVuIHJlbHkgb24gY29udGV4dCBzd2l0Y2hlcyBh
ZnRlciBhbiBNTUFQIGhhcw0KPiA+IGhhcHBlbmVkIHRvIGVuc3VyZSB0aGUgVExCIGlzIGNsZWFu
IGZvciB0aGUgbmV4dCBzdWJtaXNzaW9uLg0KPiA+IA0KPiA+IFdpdGggY29udGV4dCBiYXNlZCBU
TEIgaW52YWxpZGF0aW9uLCB3ZSBjYW4gbm8gbG9uZ2VyIHJlbHkNCj4gPiBvbiB0aGUgaW1wbGlj
aXQgaW52YWxpZGF0aW9uIGhhcHBlbmluZyBkdXJpbmcgY29udGV4dCBzd2l0Y2gsDQo+ID4gc28g
cmVtb3ZlIHRoZSBmYXVsdCBtb2RlIGxpbWl0ZXIgYW5kIHNpbXBseSBhbHdheXMgcGVyZm9ybQ0K
PiA+IHRoYXQgaW52YWxpZGF0aW9uLg0KPiA+IA0KPiA+IEkgd2FzIGFibGUgdG8gc2VlIHRoaXMg
YmVoYXZpb3IgdXNpbmcgdGhlIGZvbGxvd2luZyB0ZXN0Og0KPiA+IHhlX2V4ZWNfY29tcHV0ZV9t
b2RlIC0tciB0d2ljZS11c2VycHRyLWludmFsaWRhdGUNCj4gPiANCj4gDQo+IEhtbSwgdGhpcyBp
bXBsaWVzIHRoYXQgcHJlZW1wdCBmZW5jZXMgZG9uJ3QgaXNzdWUgYSBUTEINCj4gaW52YWxpZGF0
aW9uLi4uDQo+IEkgdGhvdWdodCB3ZSBsYW5kZWQgb24gcHJlZW1wdCBmZW5jZXMgZG8gYSBUTEIg
aW52YWxpZGF0aW9uIGluDQo+IG9mZmxpbmUNCj4gZGlzY3Vzc2lvbnMuDQoNClNvIGluaXRpYWxs
eSBJIHdhcyBtb3N0bHkgZm9jdXNlZCBvbiB0aGUgeGVfdm0gaW52YWxpZGF0ZSBjYXNlcy4gSW4N
CmhpbmRzaWdodCBJIHNob3VsZCBoYXZlIGRvbmUgYSBsaXR0bGUgbW9yZSBmb2N1c2VkIHRlc3Rp
bmcgaGVyZSBhcw0Kd2VsbC4gVGhpcyBjYW1lIHVwIGFmdGVyIHNvbWUgbW9yZSBleHRlbnNpdmUg
dGVzdGluZyBpbnRlcm5hbGx5Lg0KDQpBdCBsZWFzdCBpbiBteSBsYXRlc3Qgcm91bmQgb2YgdGVz
dGluZywgSSBkb24ndCBzZWUgYW55IGlzc3VlcyBpbg0KQkFUL0ZVTEwgYWZ0ZXIgdGhpcyBjaGFu
Z2UuIEkgZG8gdGhpbmsgZ2V0dGluZyB0aGlzIG1lcmdlZCAob3INCnNvbWV0aGluZyBzaW1pbGFy
KSBhbmQgdGVzdGVkIG1vcmUgYnJvYWRseSB3b3VsZCBiZSBpbnRlcmVzdGluZy4NCg0KPiANCj4g
V2UgbWF5IGhhdmUgbW9yZSB3b3JrIHRvIGRvIGhlcmUgd3J0IGNvbnRleHQgYmFzZWQgVExCIGlu
dmFsaWRhdGlvbnMuDQo+IA0KPiBJIHRoaW5rIEJPIG1vdmUgcGF0aCBsaWtlbHkgYWxzbyBuZWVk
cyB0byBiZSB1cGRhdGVkIHRoZW4gdG9vLg0KDQpIbS4uIEkgaGF2ZW4ndCBzZWVuIGFueSBpc3N1
ZXMgb24gdGhlIEJPIHNpZGUsIGFsdGhvdWdoIGl0J3MgcG9zc2libGUNCkkndmUgbWlzc2VkIHNv
bWV0aGluZyBpbiB0ZXN0aW5nIG9mIGNvdXJzZSAobGlrZSB0aGlzIExSIGNhc2UpLiBJJ2QNCnJl
YWxseSBsaWtlIHRvIGdldCB0aGlzIHRlc3RlZCBtb3JlIHJlZ3VsYXJseSBpbiBDSSBpZiBwb3Nz
aWJsZSBhbmQNCndvcmsgdGhyb3VnaCBpc3N1ZXMgcG9zdCBtZXJnZS4gSSB0aGluayBtb3N0IG9m
IHRoZSByZW1haW5pbmcgaXNzdWVzLA0KaWYgdGhleSBjb21lIHVwLCBzaG91bGQgYmUgdGltaW5n
IHNlbnNpdGl2ZS4NCg0KQWxzbyB0aGUgZmFjdCB0aGF0IHRoaXMgaXNuJ3QgZW5hYmxlZCBpbiBh
bnl0aGluZyBpbiB4ZV9wY2kuYyByaWdodCBub3cNCm1lYW5zIHdlIHNob3VsZG4ndCBjYXVzZSBh
bnkgbWFqb3IgYnJlYWthZ2Ugb3RoZXJ3aXNlIGZvciB0aGUgZmVhdHVyZQ0KZ2VuZXJhbGx5LiBP
ZiBjb3Vyc2UgdGhpcyBzcGVjaWZpYyBjaGFuZ2UgaW1wYWN0cyBldmVyeW9uZSB1c2luZw0KcHJl
ZW1wdCBmZW5jZSBsaWtlIHlvdSBzYWlkLiBJIGNvdWxkIGFkZCBhIGhhc19jdHhfdGxiX2ludmFs
IGhlcmUgLSBJDQpoYWQgdGhvdWdodCBhYm91dCB0aGF0LiBCdXQgdG8gbWUgdGhpcyBzZWVtcyBs
aWtlIGEgbW9yZSBnZW5lcmFsIGNhc2UNCmdpdmVuIHRoZSBkaXNjdXNzaW9uIHdlIGhhZCBhYm91
dCBpbnRlbnQgb2YgZXhwbGljaXQgaW52YWxpZGF0aW9ucy4NCg0KQW55d2F5IGxldCBtZSBrbm93
IHdoYXQgeW91IHRoaW5rIGhlcmUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IMKgDQo+ID4gU2ln
bmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRyLmMgfCAyICstDQo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiA+IGluZGV4IDY3NjEwMDVjMGI5MC4uZGZk
Njc5ZGQ5OGQ5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRy
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5jDQo+ID4gQEAgLTEw
Miw3ICsxMDIsNyBAQCB4ZV92bWFfdXNlcnB0cl9kb19pbnZhbChzdHJ1Y3QgeGVfdm0gKnZtLA0K
PiA+IHN0cnVjdCB4ZV91c2VycHRyX3ZtYSAqdXZtYSwgYm9vbCBpc19kDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmYWxzZSwgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBY
RV9XQVJOX09OKGVyciA8PSAwKTsNCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZV92
bV9pbl9mYXVsdF9tb2RlKHZtKSAmJiB1c2VycHRyLT5pbml0aWFsX2JpbmQpIHsNCj4gPiArwqDC
oMKgwqDCoMKgwqBpZiAodXNlcnB0ci0+aW5pdGlhbF9iaW5kKSB7DQo+IA0KPiBTaG91bGQgYmUg
Y2hhbmdlIHRoaXMgaWYgc3RhdGVtZW50IGJhc2VkIG9uIGhhcmR3YXJlIHN1cHBvcnQ/DQo+IA0K
PiBNYXR0DQo+IA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF1c2Vy
cHRyLT5maW5pc2hfaW51c2UpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAvKg0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIERlZmVyIHRoZSBUTEIgd2FpdCB0byBhbiBleHRyYSBwYXNzIHNv
DQo+ID4gdGhlIGNhbGxlcg0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KPiA+IA0KDQo=
