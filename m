Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6429C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 17:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E37810F474;
	Thu, 21 Mar 2024 17:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="furOzu9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28DC10F474
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711042318; x=1742578318;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NgCUBu1al/wk7I19TbF39NExqOE27ln6+Qo7PGfJvu0=;
 b=furOzu9NFh/6BrXHc/P08qijJ2qpKfQ3YrSloLVDH2kkSWTh1MP0qYfv
 zNmh7DSQ9tWvUTaMbZlnz1JyVJQ5AgjcL7FrkS6DiL4AMzxE5XZbMEy84
 DSGmRde9sBxJKOYxfdX/zhClLofOCIZORl6v06UH9bcFsJB8kbXRT+DPi
 Pl5iN6Umus5D5ngbMWN+8/ILgiRD+kYRHH4zaysjIrsX98EbUjKsq4dD/
 AlkVNfVEu/hMhRqis0NYd8Lx5y/sGVa+aQ5UjVMfs5B/gU9F3ue1YwKBB
 DTUf6VdTlYxbPPFXXOu++ooCRcznxnAOjPriF2d8vwaPntL/V6aCR4D1f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6236670"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6236670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 10:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19158141"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 10:31:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 10:31:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 10:31:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 10:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB4wsJJHhmVnIitABicNBICeGE7uYmuNuwk1s7bsS6/YHzF5VeXInbGi3nnbod2mQo462zeJTDunBFqutOHM6NSTrkSd5WE/XshEduYQrVWc9CZMleVCRi/Zf6z8uc0Jjk9+JK80nWrmJirjRquRWkL/ZMADmmys5gqvT5F0vgoKiBYnvm35zvaFNO07BEdTUIE5Ex8pKcMy6Abs9AZ37IuJ3sksWIpyfdb/7utegi+tetPWevA09WYVfoH3393VHSINweXA6GXo9kdUsw6diizRnZL+LJ+JulXUq00swe3wIvZwVaGOnMN4K03yVirRLAALbyLUCxqBAt4KxKwUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgCUBu1al/wk7I19TbF39NExqOE27ln6+Qo7PGfJvu0=;
 b=Jnfie9lT5wjyLyegPVvL0esP3zAFAJ0wiXYa33bJ5DFSjsSDHBOQ5OG6/CJ5cdoNZ4dwMw/DyHtqLpy4t4X0Wuy8pHwINAGy6pLrGXsbACbL4+8lm7pjh80vAMNDB/5MCpilm/Ak7J4sQcxS4iYKMwD11sVyOLoS9IP6lr3LeKcNY8ym4F+nA/cOZ/sgTeXnqszOnvuf2CkZmjGiWnbEp/24XhsdMdPELF2F4LjrL4V4cqXi1GeFsG2ZCYycsIr9XjK8UGtQTtWz/HvwL4Ih0mLWHanUlt72sQyhH2TmtFDK8T0eBt3i7AURmB2XWoYol7OsZErtrzx0w27X0A5suw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 17:31:47 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Thu, 21 Mar 2024
 17:31:47 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Topic: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Index: AQHaezXx8ukTkUkttEKudqvoYNITzLFCQi4AgAAwrsA=
Date: Thu, 21 Mar 2024 17:31:46 +0000
Message-ID: <SA1PR11MB69913A2B9262804A630AA7DF92322@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
 <20240321022939.2279979-5-oak.zeng@intel.com>
 <20ac0abbb1b2cfd83a34c01f2f4540a43081ea21.camel@intel.com>
In-Reply-To: <20ac0abbb1b2cfd83a34c01f2f4540a43081ea21.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MN2PR11MB4551:EE_
x-ms-office365-filtering-correlation-id: 54140153-5885-4b6e-aefc-08dc49ccc8c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aWkNei+KGWKWZzIlTiTsGA8Js9lhkikK4+aqe+AXifG3sTAQDCQxFSvKbRfUaD/aFaIGzu8WxRRIVeXKvO5kh3FiaoG60WhmG0rwKwPl6ewetvzmXsC9U6iw3nWEvf8kHLn6ENvYBuiNTc+ZrnX23wT9rJOpBbtEb4l8FDcIyitSsMRqNrQWkSHSKfLeIK5rw3FSH5kZs43iLLPlqtFEFO5cv97Z8Ts/qc1D3adWaFsNdsDxCtzkblul3TqF8H9lFo5dC3HILnEA3wYqEQ5XTvS1CoJsp1+ZKo18TOzwzwG0+DHoFQ2RwCHDZ4A6REv7QVLi/UEo9gSZr1rHrvCZmeMxWte2V4pgnpfAOAOI/xW+jIpHvLIKfthKSVU96RphjZCCYg68PniDhRSkPRp1x5ySTyUKMiUAH1++2+BRUBxAL7PPpevo4SSWmZan4uxOQplL6ThdXkUvOe/748y9CYeuWJJtdFdbyofqMmejpR5Gig9z12sBTYY/PP7tiHf7I7LtATDTnVOwm48KpqphpeT3tG1txBTU6MzRPaEvLVzydRzioM8JKB4aR03i5AFA2bN+8s9ouD38dP5huv+VEL03fedAtBCI5qMdA2+fcWShaIvZTr9Ih3IVpPmjmWvS+hMb9lGs/YT4BPni4+J0M4dafKrLwajmKVhtWgNF7MibCtUqv+wQC4BxYGUUndjiKyHPTImytgxC3uQ6ZQH41cX+/ADa+d6r7r4fiYtwDO8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDRyemVrRWNCVi9QL0JpbHl2a0Fnc0JlVDFWaW1NYVVhUUE3ZmNMM2Q4dC9u?=
 =?utf-8?B?aDBhVlMvdnRsL0M2aFdDUVNFMUYzem5pa1c0QklYb3JFOU56SDJWQno5Mk43?=
 =?utf-8?B?YXp1OVNzdzBDalRES2tLc0RtWlNpNXg0MEJGVmhEeW1CaVF2K1ZwWHZSSGZh?=
 =?utf-8?B?R1NxMDlxNUo4aG1yRVRaVng5RXVubHBaWHd5VUhhclRVZWpnaXFBckFuck9S?=
 =?utf-8?B?akFTM1k4OFU3U2QwSXdoZldZalo4dkJDWmw5MDRTR3NHeVZSMGpJMEVqaXBX?=
 =?utf-8?B?bE52WkJBMG9ROWZoU3pwNU51SGJPWVdFelppbXdEcHZyeHdhZjlvNHh4V3do?=
 =?utf-8?B?VGJSOEF6SkJUOFRxSDRFYXZTV1JDTW8wVVc5bDlQWjJreWRHMHNZWWY4Q0xv?=
 =?utf-8?B?N1MxQ0VsaVdmT2pMYXkyMmFoTWJMWGpQYnQzYWRVcXdvWm1iVTlTQ1BEbElG?=
 =?utf-8?B?Q09OcXdNdHZLUzR0WExtZkxtVDladEtKSWJrcDYxSU1MYUJ6YklLZDlJbFEw?=
 =?utf-8?B?KzZIWkxNVHBYUC9rSmhzZ0JGSjZFeS9vMHc2OXcyVlczVjdwYjQzZVVGOGc0?=
 =?utf-8?B?VTBoTml3U1IzWWF6MjFHRUdlK29ud3RyNUx1SlZQa2xXTkxjdzNYYS90dFVX?=
 =?utf-8?B?UnVpMjliRlFMK2pYaW9PYXFNUzJwK2IxVU51RXdubTR0d3lCYzd0a043dlpl?=
 =?utf-8?B?MVZ5SHlkQU1wejAyWjBnczRzQjRLbUlXbC92OUhxdHhJNUsva29wSGxEa04r?=
 =?utf-8?B?L1dFNVNudnFUVUVQM0c5S0VXY3JDeGVpWlhvOUowb2xIZkRpWjIwOUdTZjZY?=
 =?utf-8?B?S0ZaVUR4Wi96dEpyd2x5OVpwUnAycWNNUWVJUlZEN1JpY3VXbCtqMFVMUExy?=
 =?utf-8?B?OXZtTWxzOG1RSVM4amZNK3RSMGNXNi83dm8zb2k2a3BtRGxPVHkydVBaNG5h?=
 =?utf-8?B?OTZYcDhpMjB1cFd2YWF2REZhVG9TT2Y2bTh0clZsVElMTFBMdDltdUtscXVD?=
 =?utf-8?B?ekVGSnlJNmxta2taWm9yenN6Rm01MWFWb0VySzlOWFQ1dFAyZmY1d1h3dWR1?=
 =?utf-8?B?aWZEOTlYTlp0MEIyNUhyZS9Idm0vRVFUakdUQk9pUy9HUlRZREx0aFNLdTY0?=
 =?utf-8?B?RVZJS3h3NzVxb2RRR2FEK0ZQYXRmcm5HL01pS25XalVFb3cxaDNnNDQveTUy?=
 =?utf-8?B?QUViUm1Lb2R5RUpWWEJGMWd3c0xZV2w3US9QdGhDMm5TNitNc0ZHOEh4R1NH?=
 =?utf-8?B?NGxRTjNsTGJUaVFrZXpYcHNzNzBWYWZORE1NVFVzcFJqcUJOVUNMUTRiSzFw?=
 =?utf-8?B?dUlseWhaK1FBcThvYTJOTS9xYUhibGtMZlE1TW0rVXVldkxUL0dTNis2RldZ?=
 =?utf-8?B?MTVjalFHZXRET1dpREEvUGJwbms3STBHN3FFeEZkMis3U0hYT2ZGRysrQUFF?=
 =?utf-8?B?bXluQ0NTYXhkQWxNbUJMUUdaRUhBWDEyTFFKbmhEQ0JrNWVsdzB3cWFpRXBU?=
 =?utf-8?B?S2pWck81QXlnVHlCMnc5Sk8xajcwNTJqeDA2NzZ0ZW9mWDA3dWlMYkF5MVpt?=
 =?utf-8?B?K3dwcytOU2kxNWZsYkdYQWY2MXFzZE1zV3daUjFmeTIyV250WjRqMU9QMzNs?=
 =?utf-8?B?eGhNR0pSdDNYSDd4RHNMQnozdWprNDVjQmNuT3h6UEErVDRTRy9uTmRNaS9C?=
 =?utf-8?B?K2lXUy9EMWhpaDd0MWRNMncvNjcyTG03Yk9jV3U5bUFqWHp4cDg3MXdMZjJw?=
 =?utf-8?B?eUhTZmZDRTBWNlpNL0NhQzVFOVBFb3crM3ROUnZCRUdMZVduYWRicjdXZmVh?=
 =?utf-8?B?dDBWeG84T05LS0NHcjJBdXY0NFFkdWRvcVFEa2Z4cnlUSmpLVXZsY0lyaEhj?=
 =?utf-8?B?ZVZvM1o4L0ppMCt2c1ZnZklkSDB1KzJKNUdGcUtld3h2QWxVRlZKQUo3Z3hl?=
 =?utf-8?B?M3dZVjUrYXllU0JEVUNoNTVoN1pKaTBhaDVNaGpzQW1xajlEUHlQNkw3b1Qx?=
 =?utf-8?B?dHNiZ20xRFJHY1k3TU55OXJHM1V4YXByenk3U01qR25Ob2tsbmllVjVEMHAz?=
 =?utf-8?B?aTJHcEhPZVEyMkEzZk5oOWFacUZkWGU2bEpIN0NKSHp6aWpDUkp3b1FLcHJa?=
 =?utf-8?Q?3dJU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54140153-5885-4b6e-aefc-08dc49ccc8c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 17:31:46.9646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQne3J2VIqo1JPK1ZWUolrE1ZnOVVdPG/aI3QZgRNInCDsD2z8zF0vCFqyIYFqOAB6ICKghXOtLQ7lrH7DDUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

SGkgVGhvbWFzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhlbGxz
dHJvbSwgVGhvbWFzIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIE1hcmNoIDIxLCAyMDI0IDEwOjMwIEFNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IFplbmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBDYzogQnJvc3QsIE1h
dHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgV2VsdHksIEJyaWFuDQo+IDxicmlhbi53
ZWx0eUBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQu
Z2hpbWlyYXlAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcw0KPiA8bHVjYXMuZGVtYXJjaGlA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gZHJtL3hlOiBkZXN0cm95IHVz
ZXJwdHIgdm1hIG9uIFVOTUFQIGV2ZW50DQo+IA0KPiBPbiBXZWQsIDIwMjQtMDMtMjAgYXQgMjI6
MjkgLTA0MDAsIE9hayBaZW5nIHdyb3RlOg0KPiA+IFdoZW4gdGhlcmUgaXMgTU1VX05PVElGWV9V
Tk1BUCBldmVudCBoYXBwZW5zLCB0aGUgdXNlcnB0cg0KPiA+IGlzIG11bm1hcHBlZCBmcm9tIENQ
VS4gVGhlcmUgaXMgbm8gbmVlZCB0byBrZWVwIHRoZSB4ZV92bWENCj4gPiBmb3IgdGhpcyB1c2Vy
cHRyIGZyb20gR1BVIHNpZGUuIFNvIHdlIGRlc3Ryb3kgaXQuDQo+ID4NCj4gPiBCdXQgd2UgY2Fu
J3QgZGVzdHJveSB2bWEgZGlyZWN0bHkgZnJvbSB0aGUgbW11IG5vdGlmaWVyDQo+ID4gY2FsbGJh
Y2sgZnVuY3Rpb24sIGJlY2F1c2Ugd2UgbmVlZCB0byByZW1vdmUgbW11DQo+ID4gbm90aWZpZXIg
ZHVyaW5nIHZtYSBkZXN0cm95LiBJZiB3ZSByZW1vdmUgbW11IG5vdGlmaWVyDQo+ID4gZGlyZWN0
bHkgZnJvbSBtbXUgbm90aWZpZXIgY2FsbGJhY2ssIGl0IGlzIGEgZGVhZGxvY2suDQo+ID4geGVf
dm1hX2Rlc3Ryb3kgaXMgbW9kaWZpZWQgdG8gZGVzdHJveSB2bWEgaW4gYSB3b3JrZXINCj4gPiB0
aHJlYWQuDQo+ID4NCj4gPiBBbm90aGVyIHJlYXNvbiBvZiB0aGlzIGNoYW5nZSBpcywgZm9yIHRo
ZSBmdXR1cmUNCj4gPiBobW1wdHIgY29kZXMsIHdlIGRlc3Ryb3kgdm1hIHdoZW4gaG1tcHRyIGlz
IHVubWFwcGVkDQo+ID4gZnJvbSBDUFUuIFdlIHdhbnQgdG8gdW5pZnkgdGhlIGhtbXB0ciBhbmQg
dXNlcnB0cg0KPiA+IGNvZGUuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhlIHBsYW4gdGhhdCBmb3Ig
dGhlIDE6MSBhcHByb2FjaCBvZg0KPiB2bWEgPC0+IHB0X3N0YXRlLCB0aGlzIHdvdWxkIG1hcmsg
dGhlIHB0X3N0YXRlIGludmFsaWQsIGJ1dCB0aGUgeGVfdm1hDQo+IHJlbWFpbmluZywgcG9zc2li
bHkgbWVyZ2UgaXQgd2l0aCBuZWlnaHRib3JpbmcgaW52YWxpZCB4ZV92bWFzPw0KDQpZZXMsIHdl
IG5lZWQgdG8gZGVzdHJveSB0aGUgdXNlcnB0ci9wb3B1bGF0ZWQgdm1hLCBhbmQgcmVjcmVhdGUg
YW5vdGhlciBzeXN0ZW1fYWxsb2F0b3IvdW5wb3B1bGF0ZWQvaW52YWxpZCB2bWEgLSBkdXJpbmcg
dGhpcyBwcm9jZXNzLCBpdCB3aWxsIG1lcmdlIHdpdGggdGhlIG5laWdoYm9yIGludmFsaWQgc3lz
dGVtIGFsbG9jYXRvciB2bWEuLi4NCg0KPiANCj4gRm9yIDE6TiB0aGlzIHdvdWxkIG9ubHkgaW52
YWxpZGF0ZSBjZXJ0YWluIHB0X3N0YXRlIGNodW5rcy4NCj4gDQo+ID4NCj4gPiBJIGJlbGlldmUg
dGhpcyBpcyBhbHNvIHRoZSBjb3JyZWN0IGJlaGF2aW9yIGZvciB1c2VycHRyLg0KPiA+IFRoaXMg
cGF0Y2ggaXMgZXhwZXJpbWVudGFsIGZvciBDSSBhbmQgb3BlbiB0byBkaXNjdXNzDQo+IA0KPiBX
aXRoIHRoZSByZWNlbnQgImludmFsaWQgdXNlcnB0ciIgZGlzY3Vzc2lvbiB3ZSBoYWQgd2l0aCBj
b21wdXRlIFVNRCwNCj4gdGhleSByZXF1ZXN0ZWQgdGhhdCBpZiBhIG5ldyBjcHVfbW0gdm1hIHdh
cyBhZGRlZCwgdGhlIHVzZXJwdHIgd291bGQgYmUNCj4gZnVuY3Rpb25hbCBhZ2Fpbi4gDQoNCkRv
IHlvdSBtZWFuIHRoZSB1c2VycHRyIHdvdWxkIGJlIGZ1bmN0aW9uYWwgYWdhaW4gKndpdGhvdXQq
IGFub3RoZXIgdm1fYmluZD8gSWYgeWVzLCAgVGhpcyBzZWVtcyBzdHJhbmdlIGJlaGF2aW9yIHRv
IG1lLi4uIEkgd29uZGVyIGhvdyBkb2VzIFVNRCBrbm93IHdoZW4gdG8gcGVyZm9ybSBhIHZtX2Jp
bmQgYW5kIHdoZW4gbm90PyBJdCBzZWVtcyB0byBtZSB0aGlzIGJlaGF2aW9yIGNvbXBsaWNhdGUg
Ym90aCB1bWQgYW5kIGttZC4gSXQgaXMgYWdhaW5zdCBzb21lIGJhc2ljIGRlc2lnbiBwcmluY2lw
bGUgYXMgSSBzYWlkIGluIGEgcHJldmlvdXMgcmVwbHkgdG8gTWF0dCdzIGVtYWlsLg0KDQpJIHdy
b3RlIGFuIGVtYWlsIHRvIGNvbmZpcm0gd2l0aCBVTUQuIExldCdzIHNlZSB3aGF0IHRoZXkgaGF2
ZSB0byBzYXkuDQoNCk9haw0KDQpOb2JvZHkgYWN0dWFsbHkgdGVzdGVkIHRoYXQgdGhhdCdzIHRo
ZSBjYXNlIHdpdGggdGhlDQo+IGN1cnJlbnQgY29kZSwgYnV0IGlmIHNvLCB0aGlzIHdvdWxkIGJy
ZWFrIHRoYXQgYmVoYXZpb3VyLiBJTU8gdGhlDQo+IGN1cnJlbnQgYmVoYXZpb3Igc2hvdWxkIGJl
IGtlcHQuIHhlX3ZtYSByZW1haW5zIGJ1dCBpcyBtYXJrZWQgaW52YWxpZC4NCj4gDQo+IA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIHwgOCArKysrKysrLQ0KPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtLmMNCj4gPiBpbmRleCAxMWE0YmI5ZDU0MTUuLjkwZDExNjNjMTA5MCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jDQo+ID4gQEAgLTQwLDYgKzQwLDggQEANCj4gPiDCoCNpbmNsdWRl
ICJ4ZV93YS5oIg0KPiA+IMKgI2luY2x1ZGUgInhlX2htbS5oIg0KPiA+DQo+ID4gK3N0YXRpYyB2
b2lkIHhlX3ZtYV9kZXN0cm95KHN0cnVjdCB4ZV92bWEgKnZtYSwgc3RydWN0IGRtYV9mZW5jZQ0K
PiA+ICpmZW5jZSk7DQo+ID4gKw0KPiA+IMKgc3RhdGljIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
eGVfdm1fb2JqKHN0cnVjdCB4ZV92bSAqdm0pDQo+ID4gwqB7DQo+ID4gwqAJcmV0dXJuIHZtLT5n
cHV2bS5yX29iajsNCj4gPiBAQCAtNjA0LDYgKzYwNiw5IEBAIHN0YXRpYyBib29sIHZtYV91c2Vy
cHRyX2ludmFsaWRhdGUoc3RydWN0DQo+ID4gbW11X2ludGVydmFsX25vdGlmaWVyICptbmksDQo+
ID4NCj4gPiDCoAl0cmFjZV94ZV92bWFfdXNlcnB0cl9pbnZhbGlkYXRlX2NvbXBsZXRlKHZtYSk7
DQo+ID4NCj4gPiArCWlmIChyYW5nZS0+ZXZlbnQgPT0gTU1VX05PVElGWV9VTk1BUCkNCj4gPiAr
CQl4ZV92bWFfZGVzdHJveSh2bWEsIE5VTEwpOw0KPiA+ICsNCj4gPiDCoAlyZXR1cm4gdHJ1ZTsN
Cj4gPiDCoH0NCj4gPg0KPiA+IEBAIC05MDEsNyArOTA2LDggQEAgc3RhdGljIHZvaWQgeGVfdm1h
X2Rlc3Ryb3koc3RydWN0IHhlX3ZtYSAqdm1hLA0KPiA+IHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
KQ0KPiA+IMKgCQkJeGVfdm1hX2Rlc3Ryb3lfbGF0ZSh2bWEpOw0KPiA+IMKgCQl9DQo+ID4gwqAJ
fSBlbHNlIHsNCj4gPiAtCQl4ZV92bWFfZGVzdHJveV9sYXRlKHZtYSk7DQo+ID4gKwkJSU5JVF9X
T1JLKCZ2bWEtPmRlc3Ryb3lfd29yaywNCj4gPiB2bWFfZGVzdHJveV93b3JrX2Z1bmMpOw0KPiA+
ICsJCXF1ZXVlX3dvcmsoc3lzdGVtX3VuYm91bmRfd3EsICZ2bWEtPmRlc3Ryb3lfd29yayk7DQo+
ID4gwqAJfQ0KPiA+IMKgfQ0KPiA+DQoNCg==
