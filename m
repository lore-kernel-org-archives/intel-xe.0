Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51F4E7108F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 15:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44310E5F3;
	Thu, 21 Sep 2023 15:50:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC1010E5E9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695311416; x=1726847416;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tVu0nIvwgSsiQ53VtKAPB0d5MA0/GjemUTTuPJaorV0=;
 b=TN6kcmKpr+1MPz8J6yeZFIYtP6YIjlpW8G8cB+4VrCU/nsYsA//vXvqn
 juUIbtqxPlNyRoAGgi87PSRum6OtPMiWaPze7R7YhPhJWdW9hkjCY6TeT
 BcP+hrC7aKc7LQJAgZWlOKZObbmw/p7/q4a5ejSnX4P+XxVeJaqn5ct4+
 xXTlJj5Bq9rQ5ExPHYoFcNsP+wAmx4DWOLSMpYp0z4v0iXAhbl11rZF1o
 3f0RtWiWEyjDRsHisZCwwTwjydmee9P/iFmcfnFGJrxC3Bvs/sNT6rdmg
 1P921SclkmQYR+mPiTHEE/avW4bgr/fn/0bs5FBVA3ga7tuA9wvnGIumG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="359940316"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="359940316"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 08:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817447874"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="817447874"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 08:50:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 08:50:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 08:50:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 08:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuDxUf+flZ5pQXWIEuB1Q5TB5AHn/LS135Sj2M+JHosDsv8oUSzyTZIBw3y5e+C8MikowhHR5d9+IO36QxNErSk4U9CljzB8v3hx2Vdofqz1iUyS07KXEGAYBYRPSB4+otVoVXBBQlWs+Cf8nG5Mhbebsa5R9CSPGK7/X+ckd+CzDbc/+wuuikDMbxDTgaINayilowM4sumHhP2F9gmlDIVc9ntC7tmJaCH9wMHe0H0U32N4Z9o3yVnnVDfHK1h5wKIh3N0NR+HEf+5f8q3aYQ05In4QQ83v2upi0lwhaywKD2+Cpw6d5C3MvOeXYDxN0AWqkqwHB3FLViCuEHjNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVu0nIvwgSsiQ53VtKAPB0d5MA0/GjemUTTuPJaorV0=;
 b=G60/bogqgF/b77OxCMA8JYGJqdtM8FD/Dyhb3S7CQwJuyAftVGNxBEqyarTxPdHocFhVNPTcu47b2appCh5hy0HDI4O0h07Sq62jWBJI4qC4KlUqxQOg9z+rKCDq2H31hoag5IPqrVIW7ExSur2qam0hOeVoNVji7HHDArGT4QFDWx7WV9KJb8qSMzaxKQ/WbKzDUMGVshbSCL84ijU/Ri2Jn88sUmw8HqK0aFM6XJKnI5y1KnUm6QcPghUwwb1ZCm0teWkgQNh8ot5NMTk/sUx71tDSsGpaTphsX1QX6VCED0rpX8lqrQ8ir3d1fVgaXOXUndk058Wo18A+VqFl/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Thu, 21 Sep
 2023 15:50:08 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 15:50:08 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference Clock
 updates
Thread-Index: AQHZ6/kgX36nKQVj+0qKNbSy1REPwrAlbqGA
Date: Thu, 21 Sep 2023 15:50:07 +0000
Message-ID: <6e8dc2efb800a305bb651f576d0ef22c5aea1cf0.camel@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-20-rodrigo.vivi@intel.com>
In-Reply-To: <20230920192940.135004-20-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB6718:EE_
x-ms-office365-filtering-correlation-id: 1471b8e4-3556-4a52-55ab-08dbbaba6e3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J6bbMjamoHerziUGRgyaPsshx8ktlDmSUXNy2/2G73tPscFreKs+XAkBamFUNy1WFNEmSaAqINvdE+mL6AX3oZsb0nLnnV5FDurb+8qA5qZwFtCkFpww1bUsX7b+ZUvcvKr66IGhlnm9ygtLRPQ9UvKzh8x8oIvr2k1icuz9wATCFSxLG4HoeDTinctOB562cS+BUZijCPO1XP72wAnzXC7AtVoCafJJ+2XsYxXQ8YreL/JLCXYbb5B32BSDkVzc6uy+O6XHxyfsyL4tT5aIt15XIQZOJqxUTK+eiYzIojYy3Mx9olxbfV9MC202gcEXHFRIjkl5Lz1vBhdHWHzcfH5qNmhN01exHGLiDYzmEH56jTJ4yAuHJGHVJIrWMYg1jGcvThVr5MWiFuzJZyD2poDh+HxdRmYZteZ5S4ovRho6Tp3fCYa4n4xdTztX97fyqP5d4l7L/kosl0d60FoK7QerPK5dnsXpCgveV3Bpxzu1954VG7Nt4KUAyUVDFiRuYDYwoitAL5CwNMWzziBGTea6I9NA0TOvxb40APXkb4lmro2LB73QFGyzkI6z3gm/jCWwkPnLUXpwTJAbl+Kpcp6RuOi4Ymi7JzR9F+xlaN0I5I3dOCjW1pOgikqgoR/4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(396003)(136003)(1800799009)(186009)(451199024)(6486002)(6506007)(2616005)(83380400001)(8936002)(2906002)(8676002)(6512007)(66476007)(316002)(66446008)(64756008)(66556008)(76116006)(26005)(478600001)(71200400001)(91956017)(54906003)(4326008)(41300700001)(110136005)(6636002)(66946007)(107886003)(86362001)(82960400001)(122000001)(5660300002)(38100700002)(36756003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDQ4eVFMYUIydzNhQXRKYzVQdlVpeDRqQUZqbTN3eXRCZncxb0pmOHhhSXRk?=
 =?utf-8?B?VGVCVi96V0JNYnE3MWNwVTUyR2N4YjgrMlNpVlBlWFd5TlU0S3QzQ05JUEpX?=
 =?utf-8?B?THUveStUUjdheW5VWitqSG1UUERhaEQ4MVJZTnpGQTlKN1EzQVJlMVNHeG9o?=
 =?utf-8?B?ZEtNbkRwQVZGTW1XNDNVUzVVMGlKR2pjNTgvNEJaRFJFK3ZoWUZCL3VVSDlB?=
 =?utf-8?B?cXRhaEhOcVdHSStvUk16ZEdqMll2cFE3UC8xM2phRkI4ZCtYRWkrb29GTkRM?=
 =?utf-8?B?Zkxad3FCdktCU3lNa2NDaVA0MlBTVTVTYWVnZjNoSUEwL2F6RzZvQnVWeUxU?=
 =?utf-8?B?cm5ROTd2c3I2NUJSRVRGM2lGTGxRMW1mSCtzM0F6OXdEelh4bFV6RUVwdDRM?=
 =?utf-8?B?MHBvUUpoWnUyVnlpNG93SFh4bVpvcHZ5UFZrd2NFWXZBZXNkZzhJWHJ4VkNz?=
 =?utf-8?B?Ym1YVzJvOUF3ZUltbEpFWlk4RUI4SXZwTnFlZ0RGRXcvYlZEV2NwVzNzditj?=
 =?utf-8?B?bDhHbmVzL2haUXMxYlhUelRET3pnY3AwRkV6MmNwaFRCWVpUdjEwektDL2dJ?=
 =?utf-8?B?a09wNnVTalZwcGFyTkdTT1BKay9nVGQ4amJ2NVl4eXRpTlFHWklYMTZmUXhT?=
 =?utf-8?B?bzJxUFY2TG1waU55UE5OdWpCS2l6QW5SemtNMTNnTmJOd2dOYWpOdGhEelhN?=
 =?utf-8?B?WmdSTUpMVnBBNW9UOXlUVVk2bWZyMUs3d3p6blgySFYwZkhaU0xOVzVWL0hw?=
 =?utf-8?B?eFRtTFNnMEE1elJxVkxSdHo2T3NRU0Rlc1hRYjBLdDlvcVZoMjM5SFFhTlQw?=
 =?utf-8?B?U3c3SWVITnphYkE2ZlhuSmp3aE5PcmNmNFlsTkk5bmVTRFdZaWE2Mis5UXFQ?=
 =?utf-8?B?WmQ5ZGt5eWpqODZ1WmQ4NDh6b2VQNnRkSGhYTWUyRWs1OFg3ejR2R0xyV1gr?=
 =?utf-8?B?ZkRsOHNLUlJOdWZvN04yWjIrTkxldWNnaExya2Q0RTg3ZGpLc2RWN0N3bGFw?=
 =?utf-8?B?UjZIVEZxM0tQalBUQTY2UFlNV0pQNGl4dmplTjVnRzNYZGJRanVCWk5yUStw?=
 =?utf-8?B?QTdMSjM1MERnd3hsNlhwK1R5a1l6YmR0amU1TVhWRHNkQ0t3VjZZQ1M2U3NN?=
 =?utf-8?B?Skx0U2hPNkMwb0Z5RXBjSmRnWnIzUkJDT1I4QjBUVlVITWNjclNEaStVbEFT?=
 =?utf-8?B?UXFmSVRlZTRaM1Q3TXI2eFNkOTVSOHNPMFJENVZWMmVuWjhiRkxtUDY5VVNt?=
 =?utf-8?B?MVFDckFnNzloRGxBa0RuWFhtemYxRkxKb3k3Qlc2Wk81K1ltL0xISytSM1lS?=
 =?utf-8?B?VXFKTGp3K0pkZ3FrNkhCVS8vWEsvakhJUUc4OElrNHBDSEdkZ2RHbVVqcDJn?=
 =?utf-8?B?OCs2WURJOXRTaU1MT2R1LytvaVEwdEZLR0o4MWhlZDdwZWpvVGFpQVc5UzhQ?=
 =?utf-8?B?Z3NuSDJFRU5PQk41U3hGeUlkbHlONWJwbkM4MG9NMWc4K0pldEtMUmVQVG80?=
 =?utf-8?B?ZEhreS90eXZtaFZWYmJrNkRydFdadTQrK3ZhSUJ3UWVOTUpjUjBRNXRIdEh4?=
 =?utf-8?B?MVpTMlVnaldVanBNamthaGJjdlpLRzBjQ1B2RFVEeERVcHJPdlRJL0R0UTRK?=
 =?utf-8?B?NWxrM1pQaElBNDc2SzFaUDZuT0tENWVOUUo2Uzh0SHQ5ZmhuSjZkVXlTTFNv?=
 =?utf-8?B?WG1lcGI1MytoQmFpb3d0TitKQmpNc29zK01oc2ZjSGxidDUyRndVYzZlQ0Nn?=
 =?utf-8?B?OXFtVGp0TlpoOXo3SlhvRGxjNjVvRzBRVTlaU1c1YXRsVVcxM0VEdzRsWER3?=
 =?utf-8?B?Z0xTWS9TSTBFdUJwYlJSYnNMOHVyRnR6aUZHM3hFNDc2VFEzakxvMW82cnVK?=
 =?utf-8?B?aEE3K3lTM3NodHZkRTJ5Uko1Qml3Znlid1laa2hScWtWVlRkV0RIcFE3ZHMy?=
 =?utf-8?B?UWVkVHd2WDQwd3FGUytHUTRZU09SYndXYXhJaktBY0tMbHRRNEs1S3F2eUFB?=
 =?utf-8?B?U1VYdE5CR0N1NTBmaTBwK0p4WFpYc0g2NHRoTHh0aXEwQXM1eVovNVN3Q3NY?=
 =?utf-8?B?OUkwa2xXTTBNS29yTXdYL2hiNi9MNUpWRlBzS1M0aDFHY2NCemxlYTNoTGZH?=
 =?utf-8?B?dWZ2YXkwRzZWRS9rSUowVWd3MnNTUk1jaVcxMHV5ZXdPTzJqTTkxTkkrajBV?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7D8E8D3C639F645850A6FA4E686E345@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1471b8e4-3556-4a52-55ab-08dbbaba6e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 15:50:07.9303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EASvdntVpmcBuBuiL7J0Zdf+7tPayU0Ino3BklCNsH5W+7E///DRmhvvxESqd1cqV6EED2DjMBsknYIPfr8T0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTIwIGF0IDE1OjI5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IEZpcnN0IG9mIGFsbCwgbGV0J3MgcmVtb3ZlIHRoZSBkdXBsaWNhdGlvbi4NCj4gQnV0IGFsc28s
IGxldCdzIHJlbmFtZSBpdCB0byByZW1vdmUgdGhlIHdvcmQgJ2ZyZXF1ZW5jeScNCj4gb3V0IG9m
IGl0LiBJbiBnZW5lcmFsLCB0aGUgZmlyc3QgdGhpbmcgcGVvcGxlIHRoaW5rIG9mIGZyZXF1ZW5j
eQ0KPiBpcyB0aGUgZnJlcXVlbmN5IGluIHdoaWNoIHRoZSBHVHMgYXJlIG9wZXJhdGluZyB0byBl
eGVjdXRlIHRoZQ0KPiBHUFUgaW5zdHJ1Y3Rpb25zLg0KPiANCj4gV2hpbGUgdGhpcyBmcmVxdWVu
Y3kgaGVyZSBpcyBhIGNyeXN0YWwgcmVmZXJlbmNlIGNsb2NrIGZyZXF1ZW5jeQ0KPiB3aGljaCBp
cyB0aGUgYmFzZSBvZiBldmVyeXRoaW5nIGVsc2UsIGFuZCBpbiB0aGlzIGNhc2Ugb2YgdGhpcw0K
PiB1QVBJIGl0IGlzIHVzZWQgdG8gY2FsY3VsYXRlIGEgYmV0dGVyIGFuZCBwcmVjaXNlIHRpbWVz
dGFtcC4NCj4gDQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
PiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+
DQo+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgIDUgKystLS0NCj4gIGlu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMTAgKysrKy0tLS0tLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYw0KPiBpbmRleCBhMjdiMTA1ODNmNWEuLjgxODRkZjRhYmRlMSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTE0OSw3ICsxNDksNyBAQCBxdWVyeV9jc19jeWNsZXMoc3Ry
dWN0IHhlX2RldmljZSAqeGUsDQo+ICAJaWYgKCFod2UpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0K
PiAgDQo+IC0JcmVzcC5jc19mcmVxdWVuY3kgPSBndC0+aW5mby5jbG9ja19mcmVxOw0KPiArCXJl
c3AuY3NfcmVmZXJlbmNlX2Nsb2NrID0gZ3QtPmluZm8uY2xvY2tfZnJlcTsNCj4gIA0KPiAgCXhl
X2RldmljZV9tZW1fYWNjZXNzX2dldCh4ZSk7DQo+ICAJeGVfZm9yY2Vfd2FrZV9nZXQoZ3RfdG9f
ZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gQEAgLTE2Nyw3ICsxNjcsNyBAQCBxdWVyeV9j
c19jeWNsZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJcmVzcC53aWR0aCA9IDM2Ow0KPiAg
DQo+ICAJLyogT25seSB3cml0ZSB0byB0aGUgb3V0cHV0IGZpZWxkcyBvZiB1c2VyIHF1ZXJ5ICov
DQo+IC0JaWYgKHB1dF91c2VyKHJlc3AuY3NfZnJlcXVlbmN5LCAmcXVlcnlfcHRyLT5jc19mcmVx
dWVuY3kpKQ0KPiArCWlmIChwdXRfdXNlcihyZXNwLmNzX3JlZmVyZW5jZV9jbG9jaywgJnF1ZXJ5
X3B0ci0+Y3NfcmVmZXJlbmNlX2Nsb2NrKSkNCj4gIAkJcmV0dXJuIC1FRkFVTFQ7DQo+ICANCj4g
IAlpZiAocHV0X3VzZXIocmVzcC5jcHVfdGltZXN0YW1wLCAmcXVlcnlfcHRyLT5jcHVfdGltZXN0
YW1wKSkNCj4gQEAgLTM4MCw3ICszODAsNiBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X2xpc3Qoc3Ry
dWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeQ0KPiAg
CQllbHNlDQo+ICAJCQlndF9saXN0LT5ndF9saXN0W2lkXS50eXBlID0gWEVfUVVFUllfR1RfVFlQ
RV9NQUlOOw0KPiAgCQlndF9saXN0LT5ndF9saXN0W2lkXS5ndF9pZCA9IGd0LT5pbmZvLmlkOw0K
PiAtCQlndF9saXN0LT5ndF9saXN0W2lkXS5jbG9ja19mcmVxID0gZ3QtPmluZm8uY2xvY2tfZnJl
cTsNCj4gIAkJaWYgKCFJU19ER0ZYKHhlKSkNCj4gIAkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLm5h
dGl2ZV9tZW1fcmVnaW9ucyA9IDB4MTsNCj4gIAkJZWxzZQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXgg
NDVlYzIwYzI3NjVkLi41MTU2YmFjODRmMjAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtMjQ4
LDggKzI0OCw4IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbiB7DQo+ICAgKiByZWxl
dmFudCBHUFUgdGltZXN0YW1wLiBjbG9ja2lkIGlzIHVzZWQgdG8gcmV0dXJuIHRoZSBzcGVjaWZp
YyBDUFUNCj4gICAqIHRpbWVzdGFtcC4NCj4gICAqDQo+IC0gKiBUaGUgcXVlcnkgcmV0dXJucyB0
aGUgY29tbWFuZCBzdHJlYW1lciBjeWNsZXMgYW5kIHRoZSBmcmVxdWVuY3kgdGhhdCBjYW4NCj4g
LSAqIGJlIHVzZWQgdG8gY2FsY3VsYXRlIHRoZSBjb21tYW5kIHN0cmVhbWVyIHRpbWVzdGFtcC4g
SW4gYWRkaXRpb24gdGhlDQo+ICsgKiBUaGUgcXVlcnkgcmV0dXJucyB0aGUgY29tbWFuZCBzdHJl
YW1lciBjeWNsZXMgYW5kIHRoZSByZWZlcmVuY2UgY2xvY2sgdGhhdA0KPiArICogY2FuIGJlIHVz
ZWQgdG8gY2FsY3VsYXRlIHRoZSBjb21tYW5kIHN0cmVhbWVyIHRpbWVzdGFtcC4gSW4gYWRkaXRp
b24gdGhlDQo+ICAgKiBxdWVyeSByZXR1cm5zIGEgc2V0IG9mIGNwdSB0aW1lc3RhbXBzIHRoYXQg
aW5kaWNhdGUgd2hlbiB0aGUgY29tbWFuZA0KPiAgICogc3RyZWFtZXIgY3ljbGUgY291bnQgd2Fz
IGNhcHR1cmVkLg0KPiAgICovDQo+IEBAIC0yNjYsOCArMjY2LDggQEAgc3RydWN0IGRybV94ZV9x
dWVyeV9jc19jeWNsZXMgew0KPiAgCSAqLw0KPiAgCV9fdTY0IGNzX2N5Y2xlczsNCj4gIA0KPiAt
CS8qKiBGcmVxdWVuY3kgb2YgdGhlIGNzIGN5Y2xlcyBpbiBIei4gKi8NCj4gLQlfX3U2NCBjc19m
cmVxdWVuY3k7DQo+ICsJLyoqIFJlZmVyZW5jZSBDbG9jayBvZiB0aGUgY3MgY3ljbGVzIGluIEh6
LiAqLw0KPiArCV9fdTY0IGNzX3JlZmVyZW5jZV9jbG9jazsNCj4gIA0KPiAgCS8qKg0KPiAgCSAq
IENQVSB0aW1lc3RhbXAgaW4gbnMuIFRoZSB0aW1lc3RhbXAgaXMgY2FwdHVyZWQgYmVmb3JlIHJl
YWRpbmcgdGhlDQo+IEBAIC0zODEsOCArMzgxLDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9ndCB7
DQo+ICAJX191MTYgdHlwZTsNCj4gIAkvKiogQGd0X2lkOiBVbmlxdWUgSUQgb2YgdGhpcyBHVCB3
aXRoaW4gdGhlIFBDSSBEZXZpY2UgKi8NCj4gIAlfX3UxNiBndF9pZDsNCj4gLQkvKiogQGNsb2Nr
X2ZyZXE6IEEgY2xvY2sgZnJlcXVlbmN5IGZvciB0aW1lc3RhbXAgKi8NCj4gLQlfX3UzMiBjbG9j
a19mcmVxOw0KDQpUaGlzIG5lZWRzIHRvIGJlIGJyb3VnaHQgYmFjaywgaWYgeW91IHdhbnQgdG8g
cmVtb3ZlIHRoZSBkdXBsaWNhdGlvbiByZW1vdmUgaXQgZnJvbSBkcm1feGVfcXVlcnlfY3NfY3lj
bGVzIHRoZW4uDQpEUk1fWEVfUVVFUllfQ1NfQ1lDTEVTIHdpbGwgZmFpbCB3aGVuIHJ1bm5pbmcg
aW4gU1JJT1YgVkYgYXMgaXQgY2FuJ3QgZG8gbW1pbyByZWFkcy4NCg0KPiAgCS8qKg0KPiAgCSAq
IEBuYXRpdmVfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3RhbmNlcyBmcm9tDQo+ICAJICog
ZHJtX3hlX3F1ZXJ5X21lbV91c2FnZSB0aGF0IGxpdmVzIG9uIHRoZSBzYW1lIEdQVS9UaWxlIGFu
ZCBoYXZlDQoNCg==
