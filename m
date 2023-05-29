Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205DCC77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 14:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44B10E025;
	Mon, 29 May 2023 14:48:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF98510E025
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685371711; x=1716907711;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=apVsKZy3EaGaEKqUc552e02gfu0p4w9Bcu4xSc9NLRc=;
 b=a2wkCctt5OjXP950LNzK+v0Ik5DdwAUBuLQEdApCF+gC9XdWNCOEhi/r
 oXGzfHC7ZYAqYR4Vbxp0M/KirgBiSnYqBr/G/1pBoJwhi+FQrDnPF4sh6
 FJgS5nafapzNOVCm+aeWl0qCljFpDewpAHqS5v22kVQhKPe6mCQAq/ui6
 j1zRsRNNqaC4XG7ct5K5ybCe4w+I2KyiktLc7omBxkSRR5NdPxHJ1VO7T
 lAQqbykdzYTbANPf+VKn1y4UK+oipuqA5ii/x4lVR7i2PyLW1jaEcL/Ua
 Q+n19pSSiJJ5i3qxBtd4ZbQDkPIlSxfFTEj9uWgMFACIOtjUt//DrM5Yc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="418206166"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="418206166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="818457876"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="818457876"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 29 May 2023 07:48:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:48:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 07:48:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 07:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnMoHhmj2WKY4HQn98fYsbaJ+XC9EGwa7IXAhnx+FcCaz0LxTLoyOASjmFXlhhU7IU6jnbsbQCAAMZvxuf6HN9+K/Na+yq9dgwFJ4mgL7FU2UuY2Mi3InhR0QckiV/wt2Gn0HVvtbR6dTji7TZKJ5dQ9yjkT6Uz03cIIxb5nmwlbCPb2k0naptFdW5w54zFKGJxhdKrPUX6keridsolKWTJ+SB/3h6/1G2iCeJ6HTgDz+90ATkTvS0JaMm3HjxjAZYf3maulNYpytma9dagPylGrbKY6pAjeSxfmbCpK9KNCn1fZOiWYgaIM/2mdPEJOH3qJ5F0FcB8BsY2evZEmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apVsKZy3EaGaEKqUc552e02gfu0p4w9Bcu4xSc9NLRc=;
 b=OVxrCflY7iIuOWbRIFZg2miv4MRUzZ3mEgSEKcCT68scrgRfsnbnDlJvy3+Ij3lbc8TTUkoecsOTZT1Sj2ImUx0AMrlkcr2RCJSzHVKT7rftSmLOxhS8+0EhnK/Z4hRomsWH3G4nK1Ly3OzhsATKjBZYCmVKDCP/j0UhVhnuBfTVIzbOYQh27eQ4UATfWcPbMuSxYpVcLBLB4rj0aGJAdbf7oBYmr7Hm6GnyV7AkxlF8duBhxbmASLjNLHlnYDr03uxb9PZloaEDWXihGF9ExvLVXYd67hsroogBtwUPOZ+ap7+r5ZVf/HJgfVlou/oZZMCLntGJ+hLd20UgMhy1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 14:48:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 14:48:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
Thread-Index: AQHZkAUtFGZts1qe1EuhKbIIh8isAK9w+lSAgABe3YA=
Date: Mon, 29 May 2023 14:48:26 +0000
Message-ID: <5d211028d654a8d824e899a073fad9e530c13e95.camel@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
 <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
In-Reply-To: <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW5PR11MB5788:EE_
x-ms-office365-filtering-correlation-id: 261159f5-3318-4577-a1c0-08db6053c2a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ep8acwDIOdAsKptuR/YEnFOOTetSXTJARQG0I3DaAJfu6pKwdA68GmBb9w3YIsZJSGNxuv7fr/74zQAXtm+cCpnY5JA/zR9D877mwuW0tu0MS6Y8I2j8dk0ddB6fyVz93xD19Je+lHmJnoV5d3omdJapc76AKiNjv1gVAO96S4E3PPKFXKqrJ3kycAVsmVT6HW4FP1m8VkWh3fQaCfAdDpMN/PdDWuSZO1Lb8rvWnJZ7LUFNi+/Qrudc+Kgfb9OsKfoFuci3ZGI30Gj6K68H8stgDGVwFbjlAnI2TNtew8G2SIHia/KXxOUPhpn3017TWvruj+rgOUWMmhZpzDqeAhucLeF+ocjD179wYL2Cmete4Dri8o5qdv+8MSce1Q2rN99Y9ha5qsmSaEUjoa+l4c2ItVbYlKLht9zh0ZfzHup8wReG0gfVNME+LIa53RtunXR0yyMC8gFpi3YH8VhbOzv8QKeRDPuo6upLFiei47uZBQETyex8H0Qmma8R4bDklb4pFL7bRbeo1vUdbokVxWhviEZjGjI/IdOiYn8DrqK28DaWLDdAd9iUKvoM9nJsoLjypA/Eh8WpxdTeWHFQRpKNxJCxM4WJWCY+MuTNSTQLv9aPOOJ7EOLs3mciC4Yu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(186003)(6512007)(26005)(6506007)(6486002)(316002)(71200400001)(2906002)(5660300002)(41300700001)(36756003)(8676002)(8936002)(478600001)(82960400001)(122000001)(38100700002)(110136005)(86362001)(38070700005)(91956017)(66446008)(64756008)(66946007)(2616005)(66556008)(66476007)(83380400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWpHQ3VHcHJqSFJhNkZ0bEppaHhucmNENDVOSmRwUnFnamx2clZsTGh2M1dZ?=
 =?utf-8?B?Z2E1K0xWM1pOWkRNdHRhOGs5SVRXNE1zaHp6MXNMWG05QThVNEJ2QWhnV3ho?=
 =?utf-8?B?d0pxTG55V21XdW5RellhQ2gyZzh1b2xGSmc2K1NwcXc2NHdQbkRhUnMvQmd2?=
 =?utf-8?B?VnByM2hXV2pHWlh0dThHZCtxMGI1Z2dVUE9BUkNJcStVQ29SUVNJWUgvSnA4?=
 =?utf-8?B?QWFhLzhERHM1dXJ5bDZBbW93NFNWejdnUEFXRVA0WjlhSVZra250dkk3bHBJ?=
 =?utf-8?B?VGZ1cm1ieHNnNWpXZ0wvSFRZMTRVUE0rSlh3a2gzbnVaWC83cWFFNi8zYzVG?=
 =?utf-8?B?QUFYUCtRWHVjclZOUklBTlBOUG4xc3hreHpxMzlQa3ZEQnZESVEwZ3lvSDFQ?=
 =?utf-8?B?NWxUOTFwL3JHcWpJNENHV01OY2MxcDVyVmtrTjNSaC84dkFqdEVmaU9aY2Vl?=
 =?utf-8?B?VGl6RTVyMnBUSFNyZUhIaEtkM1N4OXVQdDlCZkplNngzYU9sRmo2VnRmQ1BU?=
 =?utf-8?B?ams4YUNQS3lkZk9xYjVyRWhiVUt1SjNFem1mWHlaZElWc3VEZHF1WVVIR2lh?=
 =?utf-8?B?MXM4Q09lTUZuTnBLc214bGt4YWtKYnIyU1IweHVmVGhyb3NqbzdTYnBoS1k2?=
 =?utf-8?B?a2VZU1pXL3U2ZEVybE9RalV2aVE1eWkzTitTZW9ZQU8rQXFYTnAwa0Z1Wkp1?=
 =?utf-8?B?cFFLeWxWNEFoWTl5TjBvVWJpTnV5Zkx4Ryt6N0xWNHFIdStWUHQvRnR2emtI?=
 =?utf-8?B?eFZuUDZXelArdFE1aG90L3ZNekhRQ3gvYVA5OXI4eGpDN1JtNkZXL1BqWlo1?=
 =?utf-8?B?ZHRraDZqanNkU3VjZFZYUkk4cVNWWHVyZmRDUWYrQmhDU2hsUXZ5U1lnNVVk?=
 =?utf-8?B?bGZwczVTS2h4YitrcUpZdjE5aWhjd2FzeFlzOHNJa2hGU2RxNHVFbkZFaXNI?=
 =?utf-8?B?TDhoN3hBK0RYb2hDbkwyd05jcW85UFBiOVlFbTBSUVNpMkhaUmp3b2VRUDRG?=
 =?utf-8?B?d3ovM2IzcTdJa0dqWk5ubWVVMUozYnlsOWxuNGtON1hsQVRMWmd0TFhBek9o?=
 =?utf-8?B?Qzl6R0dXL0huZHQwakRWNTErMUdROVZEbVVkSGdvcGlkVE1QSVYwY2d1bzRW?=
 =?utf-8?B?VVk4Smg0NHFIU3d5WklvZHlPeFVmZTBFekxHYmJoMXBZdlZpNktPbTJNQVZ2?=
 =?utf-8?B?eG9YR25aenh6N21nUHpESGtEeUVxMnhHOXpkeDhNL0I5NHpCeUxTU2ZBYmI1?=
 =?utf-8?B?aEdJVkdyWWF0bUpKY2d1bTkxYklZcHRIV0RXYWZwVVVnQkVMK2NxVzc4UDR6?=
 =?utf-8?B?aXZWY1NZWVQ0a2pQbnNlWnFrTFpJRVlCVlE0TS9SWU9QRi9tMVhaODhuZlRj?=
 =?utf-8?B?L2FtanRUSjdwc2M5c1NseDRFQ3pDRGJ0K002RGgwVksvQnQvMlRMbEdNUWsw?=
 =?utf-8?B?TU82akRhR0hQYVA4R0RJcmRJWWowRXJ2d25UdnY3NCt1ZXNQUnlQa2EzQk0z?=
 =?utf-8?B?MTk2Ykg5cGsreUdlcklXZ0NNRXZzS2VJKzl0Zks4a1g3SmdkdXdBbm5SbkFh?=
 =?utf-8?B?cWJVeFlqREx6aXI2cEg1cUtDWTFPMmNCS0JmVWM5RHFvU3B3R0IzQ1dJTTY1?=
 =?utf-8?B?MTlYYWErcjUwdjdoY2c2Vld1R3pYb1luUnlOY3RxZFJWMzd6SmwrZjRFcEZ1?=
 =?utf-8?B?ZE5Ma1lJU2psTnpjUTVoK1dtWnhxZDB5OVFRTm9NWWxhL3lGSzJ5NWtONnZh?=
 =?utf-8?B?UGJheTRCejdacU9POEFjVWluV3hlbGNCTmI2ZlVvSHp1c2dIUlBhVjZLV1lO?=
 =?utf-8?B?eURCbDF0aEc5aFpiTkFoQlZEdHhUVysxQUcrSWJWVjRabFRxUXFYckcwMEcw?=
 =?utf-8?B?cU1zK2E1YUpiRlB2dHFvS01OdDZPVUFERTR0ZDBYaFQ5OXZhUjVQSFk2dFZa?=
 =?utf-8?B?WnlFNFZVemh5empaOTQxTk9kNnFpYkgrMlNQM2VScCtoK2w4VFBQTHJBZlRW?=
 =?utf-8?B?S2JwTHlGRjZOcWpJa2Q2M050NVJSMXlFMTNjb2VUU1Q0MFBLSUVJa1greTJI?=
 =?utf-8?B?MGQ4MmNCVGRwSHpSWEQyWEZvdCttTUlMWnlVWW1rWGcwbkZIc0hGczErWTJU?=
 =?utf-8?Q?bcZyhmXMfSMCOODrgvlcTUgQ/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <953C746E39E075438B5B2386C70C3680@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261159f5-3318-4577-a1c0-08db6053c2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 14:48:26.7240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4deBHikzPamlVfjFOXxuQbC197dvhTjYLQr3ZgqXUz29P7bgF2raa387LvUS8rWIUOrbfk35WyKMjhU2cRfhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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

T24gTW9uLCAyMDIzLTA1LTI5IGF0IDExOjA4ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToKPiBPbiBGcmksIDIwMjMtMDUtMjYgYXQgMTI6MDYgLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6Cj4gPiBpOTE1IGludmFsaWRhdGVzIFRMQiBiZWZvcmUgZW1pdCBCQiBzdGFy
dCwgc28gZG9pbmcgdGhlIHNhbWUgaW4gWGUuCj4gCj4gSGksIEpvc8OpLAo+IAo+IERvIHlvdSBz
ZWUgYW4gaXNzdWUgYmVjYXVzZSBvZiBtaXNzaW5nIFRMQiBmbHVzaGVzPyBJbiB0aGF0IGNhc2Ug
dGhhdAo+IG5lZWRzIHRvIGJlIGFkZGVkIHRvIHRoZSBjb21taXQgbWVzc2FnZS4gV2UgZG8gVExC
IGZsdXNoZXMgb24gdW5iaW5kLAo+IGJ1dCBub3Qgc3VyZSBpZiB3ZSBkbyB0aGVtIG9uIHJlYmlu
ZCwgc28gaWYgdGhhdCdzIHRoZSBpc3N1ZSB3ZSBuZWVkIHRvCj4gZmlndXJlIG91dCB3aGV0aGVy
IHdlIHNob3VsZCBkbyB0aGVtIGFsc28gb24gcmViaW5kIG9yLCBsaWtlIGluIHRoaXMKPiBwYXRj
aCwgb24gZWFjaCBleGVjLgoKSSBoYXZlIGEgZ3JvdXAgb2YgdGVzdHMgdGhhdCByZXN1bHRzIGZs
aXBzIHJhbmRvbWx5LiBJdCBmYWlscyB3aGVuIHRoZSByZW5kZXJlZCBidWZmZXIgaXMgY29tcGFy
ZWQgdG8gZXhwZWN0ZWQgcmVzdWx0LgpBbnl0aGluZyB0aGF0IGFkZCBhIGJpdCBvZiBkZWxheSBh
ZnRlciB0aGUgZXhlYyBmaXhlcyB0aG9zZSB0ZXN0cyBzbyBJIHdhcyBsb29raW5nIGZvciBhbnkg
bWlzc2luZyBmbHVzaCBpbiBYZSBLTUQgYW5kIE1lc2EuCgpUaGlzIG9uZSBkaWQgbm90IGZpeGVk
IGl0IGJ1dCBhcyBpOTE1IHdhcyBkb2luZyBpdCBJIHRob3VnaHQgd291bGQgYmUgZ29vZCB0byBk
byBpbiBYZSB0b28uCgo+IAo+IFRoYW5rcywKPiBUaG9tYXMKPiAKPiAKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4g
PiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3B1X2NvbW1hbmRzLmggfCAx
ICsKPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmPCoMKgwqDCoMKgwqDCoMKg
wqAgfCA2ICsrKystLQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdz
L3hlX2dwdV9jb21tYW5kcy5oCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9j
b21tYW5kcy5oCj4gPiBpbmRleCAwZjljNWIwYjhhM2JhLi43YzczMjBlZmVhNzM5IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3B1X2NvbW1hbmRzLmgKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oCj4gPiBAQCAtNzMs
NiArNzMsNyBAQAo+ID4gwqAjZGVmaW5lwqDCoAo+ID4gUElQRV9DT05UUk9MX1NUT1JFX0RBVEFf
SU5ERVjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMTw8
MjEpCj4gPiDCoCNkZWZpbmXCoMKgCj4gPiBQSVBFX0NPTlRST0xfQ1NfU1RBTEzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8
PDIwKQo+ID4gwqAjZGVmaW5lwqDCoCBQSVBFX0NPTlRST0xfR0xPQkFMX1NOQVBTSE9UX1JFU0VU
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgxPDwxOSkKPiA+ICsjZGVmaW5lwqDCoCBQSVBFX0NPTlRS
T0xfVExCX0lOVkFMSURBVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMTw8
MTgpCj4gPiDCoCNkZWZpbmXCoMKgCj4gPiBQSVBFX0NPTlRST0xfUFNEX1NZTkPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8
PDE3KQo+ID4gwqAjZGVmaW5lwqDCoAo+ID4gUElQRV9DT05UUk9MX1FXX1dSSVRFwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgx
PDwxNCkKPiA+IMKgI2RlZmluZcKgwqAgUElQRV9DT05UUk9MX0RFUFRIX1NUQUxMwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8PDEzKQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9yaW5nX29wcy5jCj4gPiBpbmRleCBkMmZhMGI0YzhiY2MwLi40ZjNlZjM5MTA5YjliIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jCj4gPiBAQCAtMzcsNyArMzcsOCBAQAo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xfSU5ESVJFQ1Rf
U1RBVEVfRElTQUJMRSB8IFwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQ
RV9DT05UUk9MX0ZMVVNIX0VOQUJMRSB8IFwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgUElQRV9DT05UUk9MX1RFWFRVUkVfQ0FDSEVfSU5WQUxJREFURSB8IFwKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xfRENfRkxVU0hfRU5BQkxFKQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9EQ19GTFVTSF9F
TkFCTEUgfCBcCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9M
X1RMQl9JTlZBTElEQVRFKQo+ID4gwqAKPiA+IMKgc3RhdGljIHUzMiBwcmVwYXJzZXJfZGlzYWJs
ZShib29sIHN0YXRlKQo+ID4gwqB7Cj4gPiBAQCAtMTE3LDcgKzExOCw4IEBAIHN0YXRpYyBpbnQg
ZW1pdF9waXBlX2ludmFsaWRhdGUodTMyIG1hc2tfZmxhZ3MsCj4gPiB1MzIgKmR3LCBpbnQgaSkK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX0NPTlNUX0NB
Q0hFX0lOVkFMSURBVEUgfAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQSVBF
X0NPTlRST0xfU1RBVEVfQ0FDSEVfSU5WQUxJREFURSB8Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9RV19XUklURSB8Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX1NUT1JFX0RBVEFfSU5ERVg7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX1NUT1JFX0RBVEFfSU5ERVggfAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9UTEJfSU5WQUxJ
REFURTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgZmxhZ3MgJj0gfm1hc2tfZmxhZ3M7Cj4g
PiDCoAo+IAoK
