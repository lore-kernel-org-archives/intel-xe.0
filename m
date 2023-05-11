Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B710C7EE2D
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 20:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1ED10E0DB;
	Thu, 11 May 2023 20:03:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58810E0DB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683835422; x=1715371422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oXob5UCP+VMsfn/ksB/xqohzQjMsOWPss75UYsNI3vw=;
 b=TLrdXIf7ElLnGizXp97IHXqn0ArSGIW2ywnOrkbCwR2Xbhm0UA9zuuAX
 0U5rSnpvXrrsTyGnj7EM1U2lPo6jSKReNrJS7j9utN6wkxW4/0yIeuSMM
 P6R+c6ZqzRXrI3xYK93f8ucV1DivFUxZ0chKsBGaSUE07+0vYOE96dlKD
 1fcWqLqfKWpExYECswNq5uRCK8mBbXMWetZKNpwD6S3SGinThG9/C/+qt
 IZwrwLf2KqR9ECf/M9AYhw8mQCcLyXxQM1A5oBAAC+NbEEEUC7i2jV5xA
 G7HUGc3Wk1ARhFaUnf1V7q1VIAIVpuj8YENBtWq88GSpmD8dmi0BJDd9t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378753422"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="378753422"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 13:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874112221"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="874112221"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 11 May 2023 13:03:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 13:03:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 13:03:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 13:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM3ECp1vwebo9bk+oFVQWr+ZyuabGloEszTx+MM88USR/Ct16K370rx45HRQaTvfTauy4aKTbIll397kE0k5YlzyHBs1Kz3kYl7XDB8tF5DDXB93b2XVzLYv0JuDC3Y9Gd5G+66zeZ1E9rEqafUVWHMLtm9m96sm77/4dDgs7c2IGPROBOHW4UNgVOQVKO9fJdfeS7LeWdMs75sKVRfInhkjBBwDWw9XF8GO3XhjaoUvDSpOB/2wcoqZwkJhMaEkimRZhaY+yBDZ6+EdZ1QGdkWTMlGNK3gh0inIqiymz71fFz/MljqmV3MlQr0sCXeT7hj2QWqrKdYr9FpDHUyMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXob5UCP+VMsfn/ksB/xqohzQjMsOWPss75UYsNI3vw=;
 b=NprEBnH8J5Yie2b+61hs3+h7LSuMMa/vbzJJ+QN+XxYUsWgABX8f6OC3p0CWQzAlt3pEyLIf7O3VD60E6bq45c1J8iZtD4r3gx3R/qhhCwaMBL0xseEAn/V5UG2iLL6i9rLJB3FCia3a0Z+OL+b2YOk4HjEMOX4D7Y36/iOFJEkGag8jmK+Y4YOy7GLpKvJJRHFlehgr7fKw3wQBWh8279WFeUwjjCgZH3/KREwsH4NQFgR7Zkuatife2CONJcBPXVU0z4qZw+S57Xs8fUDVeGlWAf6f50IeETDFb1r5y1G6Fr7cDW97YjZkXSqvlhZM+ToaIGVbmw8J3kVmUnZodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BY1PR11MB8055.namprd11.prod.outlook.com (2603:10b6:a03:530::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 20:03:37 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 20:03:37 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
Thread-Index: AQHZg3lXlCg7AEmARk2GyxyIlQQR0q9VBoIAgABJ/YCAAALjgIAACyAAgAAh3oA=
Date: Thu, 11 May 2023 20:03:36 +0000
Message-ID: <a07d22dca00b723638da0db67dd7b797f1bdbcb0.camel@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
 <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
 <9d04fce692222624580527c6d07ea88460a32ca7.camel@intel.com>
 <oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn>
In-Reply-To: <oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BY1PR11MB8055:EE_
x-ms-office365-filtering-correlation-id: 9f7537a5-aee3-4793-d846-08db525ace80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hFOm1SXYGgfhiTePFATM/CQ21CW2hbqqoFovtRWHZE4388/iRNr46PPNebkfGCar14tmVxuolfUeinAjD6O5g+HoUEwTLlZZvd/6pRSlOFe+WE3c/U2Ib2IMS8wnZDkWjs0JfEtcd7znmBlSx03HnNsV3ec8eZvb8r5aW8/T4/GyPyPjKvtyYgqaHZRDP9bVXsd7Zb6dxascvmKdQNv8nrjL8aGZv466ynRFr1+HK3deVpwzzqfg1P6pAMIMPrCJSukL8cwFypPr6E9ixE9Wt5F47LlstxxegtNwoIjTX6LLQm+8eXf5XcZkLRToewOHZ7rsaIOwqMxrHzwq5kT1zWd1otOme4HukHJCvvbu8nxM2Kv5C8eqR60n7+JzEIY0rM47wuczI7AkWnj5oUttHJzfiVVpGhEvNS2ffAQdPiuQIUrPrB+a1Ot1bUqzFFzdoE/pUdct/HnxXJ1kR2KtwTkVkNfG4pI/Tn7AsNYY2kteYX0DZcc+Iz2RoAoD753Lfn4DCMowMcoVe8qlmmaysheQWlXJpBK1/MiCw90Ps2HXQ+89stF5Cq9U0/e7pxpkXTw5Nud2XTpFN1pkuulNy9qfkSPq8uecgfpxiM3hMfo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(2906002)(91956017)(76116006)(66446008)(66946007)(64756008)(478600001)(6512007)(66476007)(26005)(83380400001)(6486002)(6506007)(316002)(71200400001)(966005)(2616005)(66556008)(186003)(110136005)(4326008)(54906003)(86362001)(36756003)(41300700001)(38070700005)(122000001)(82960400001)(8936002)(38100700002)(8676002)(5660300002)(66899021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkFwUjBSd09kNWJBMFhLSmVmMU5DSWVGVStBd2VtQmdRMmhvMGZsQmNMc1VD?=
 =?utf-8?B?Wm0zMkU4NVlIY2ZZbHRMYTdkdHFINS9vTTh5YVZ5MmRPdzJmejFGSzVkNTZl?=
 =?utf-8?B?Z0NIQi9VOXlaa3lKWTlWeFRESUpNMnBONmt3Mkt5MUpnRTREK1FPRlIwMWZh?=
 =?utf-8?B?emFYS1kvQVg2M1pKaGpXNEo5d2I0Mjg3NmdVbmc1ZGUrcVFCZzlXSXFLV05B?=
 =?utf-8?B?OFlPSmRFenZ1aERlakFTSVd4Mk1aWFRDajFDSkFOUFFKV2hkQzM2M25NSUk5?=
 =?utf-8?B?ME5IWFBzdkd2TkcweTJhamRabjd1Q3lpSlVqUUVKM0E3dmNLQ3VJTXU4WE1i?=
 =?utf-8?B?WDlEVlFQV3BiMVpNTjAzUnBjN2xVVDRvR0VmNmJVVGlLRG4xNG5uYVRUZWky?=
 =?utf-8?B?TU5HMktCSEdjYmRFbTZQajFrUkhoZ1hTQjYwUjNOUkJCSlRwV2Q4Rk1wc09k?=
 =?utf-8?B?Q2VmVmVGOHF5Ny90dnhSZ0NteGpwWjFjSUZCQ1RkazdTUGUxM04zUFdkb0cw?=
 =?utf-8?B?M1hZNTJlMml4QlBtdUV5b1dXcXRwUHBrSFlUVVVvbk9zRHB2aENFQ0hFeTRh?=
 =?utf-8?B?eGJGc2NnUG90OUt1NGY4MHdoZTA4cFJXbmRINkxwcnpaNzVDSmI4Y2lMN1ZK?=
 =?utf-8?B?RnVUWGErcndVQ2NaTzZrMm0rT0xIaGhmalE4TkVmNWFENmV3V21aQWdqbXNH?=
 =?utf-8?B?elZjSVBacmpuTWtSVktBRkNVZWY5bTNRZEEwZ3BRcWdKQlZXRXhWYnhvb21u?=
 =?utf-8?B?ckhuVXN6QjhUYVJDYXEwWDhTaVovRnNtQ1RidzM4NU1KTllJaGZnUUZDZWhK?=
 =?utf-8?B?MjRjaFFneUNrWnpnUzJKNzJUV0pDVUFkc0VTRjNMZFJYTzZZbXdDalVyaHlj?=
 =?utf-8?B?U2U1QmFBSjFZdVNhbU8ySWpNV3I3czMvb3p5bnJhUHp6dXdXOG5DczIzZFhw?=
 =?utf-8?B?Skx6RjlGdWJ0dFZyTHNFNTAwdFBIQk02WDNOL2RGNlhmajNNWWdWVkRzYlRM?=
 =?utf-8?B?MkZHV1VQWkZzV244VCtUUmFuK1hRYytTRzNjWmc5d0crR0xlY2NhUkhYRlBu?=
 =?utf-8?B?UlhqQ0FCL01JSFFzSG1qeVptUlhvT0ZDdnVMallQT1UyVENEYWc2bDFERHBN?=
 =?utf-8?B?NkI0L0xSb2NSUU81eVhESGh6dXF1K05UMnBXNHY1MUFtenBzd25jWURHN1FZ?=
 =?utf-8?B?Y2NQVzZCRk40eCtqWHJPSFdjcWVBTkdqN2hjbFZkdnNuRktwUzQ1alo4RFVk?=
 =?utf-8?B?alRiSXB5Nngzc2ZWOWhTYmRDTnVFcmZJRWdsLzA1VFdMYXIvSGsxeTVpWHVq?=
 =?utf-8?B?clR5UGdNdEQrRG1mOGdiVFNQS3REM2VHVThHVDk0Vnp0ekVXd3UrWjROVCtZ?=
 =?utf-8?B?SUY5YS84cTJsYkZENXRZdkVmTmxwM3NqUXNQNWo1ZGZoL04vMzZZZmdJaDVo?=
 =?utf-8?B?aDZ5Mm14UFlja0l4Q2pQYkdETzdHSGZrRENmNUZwWHdCOVQyNnU0WmZNaVla?=
 =?utf-8?B?WUpqY2VaN0ZzL0VvaURBR0pPdHk5RkF1M1p5VjNNL04vSEMrTm5zZElMcUJY?=
 =?utf-8?B?aGRlT21lb1ZSOTZDVStOOWJicDVvNEJIa2xza2ZKV0lYeGkxQXdmSytvdlVY?=
 =?utf-8?B?dTFBWFVESEdVTzY4Ny9nS2pWMnFqaGhXcWZ1eDBManA5NTcxTUZjMitjT3N5?=
 =?utf-8?B?bk5Ddk96YWZDMU9mTloyS1l5cVFiM0JJc01BYTFCWDZIVWRqamFNRldRV0JS?=
 =?utf-8?B?N2JFSDhsVk1JYTdUaWU1WmE4cUtKeE1pN1Exb0RGWWppUFJMbzJCRlo1aURS?=
 =?utf-8?B?eVRralRrbUVlZ0grZjRzcytlNGYyaDRBUkZtRTlFZnZHWU9saFBnRDVPQ0RC?=
 =?utf-8?B?WmN0OEQ2OW1SbHdGNUtQS2lUY2VIUEZDSEY0UnFUZmFtUktDa0FMamt5K0dM?=
 =?utf-8?B?T2VlbkZzM3JWK0FnbDR5Mys3a0ZudDhlNzhIa3J4Y3pwZ1pOY1ByeXhnZWxZ?=
 =?utf-8?B?cWtGUkNvZXFUOStyVndwc0d6Qm9YRUMyUk5HZy9FMUYxc29lczlLSHlIU3BQ?=
 =?utf-8?B?WHEwS0tjbGhLaElKRk8yVTluVGZJbHZ0MFJwL0NwTWhiR3AyL0U3MzRQZFB2?=
 =?utf-8?Q?5Taf6cSLDpfP8qHz45PPgHUSX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09349D414DAED44E94ADDFA88D01B74F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7537a5-aee3-4793-d846-08db525ace80
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 20:03:36.7529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44vAxoH5RBcWcP1AZBxTdTSX3L2+5gIHDuxhnXwMJx2xwkkMuKly7siE+HqpYUO/iOOUyCcDO3Yrqjt06IYHXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8055
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA1LTExIGF0IDExOjAyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDA1OjIyOjM0UE0gKzAwMDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gT24gVGh1LCAyMDIzLTA1LTExIGF0IDEwOjEyIC0wNzAwLCBMdWNhcyBEZSBN
YXJjaGkgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAxMjo0NzoyNlBNICsw
MDAwLCBKb3NlIFNvdXphIHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIDIwMjMtMDUtMTAgYXQgMTI6
NTQgLTA3MDAsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiA+ID4gPiBTdG9wIHRoZSBkYW5j
ZSBvZiBlbmFibGluZyB0aGUgZGlzcGxheS1yZWxhdGVkIGRyaXZlcl9mZWF0dXJlcyB0byBsYXRl
cg0KPiA+ID4gPiA+IGRpc2FibGUgdGhlbSBvbiBkaXNwbGF5IGluZm8gaW5pdCBpZiB0aGUgcGxh
dGZvcm0gZG9lc24ndCBoYXZlIGRpc3BsYXkNCj4gPiA+ID4gPiBJUC4gQmVzaWRlcyBiZWluZyBu
ZWVkbGVzcyB3b3JrLCBpdCB3YXNuJ3QgY292ZXJpbmcgdGhlIEFUUy1NIGNhc2UgdGhhdA0KPiA+
ID4gPiA+IGlzIHRoZSBzYW1lIHBsYXRmb3JtIGFzIERHMiwgYnV0IHdpdGhvdXQgZGlzcGxheS4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFhlIHNob3VsZCBzZXQgcGlwZV9tYXNrID0gMCBhbmQgY2FsbCBp
OTE1IGZ1bmN0aW9ucyB0aGF0IHdpbGwgaGFuZGxlIG5vIGRpc3BsYXkgY2FzZXMuDQo+ID4gPiAN
Cj4gPiA+IGluIHhlLCBlbmFibGVfZGlzcGxheSBpcyB0aGUgcnVudGltZSBjb25maWcgdG8gYmUg
dGhlIGVxdWl2YWxlbnQgb2YNCj4gPiA+IERSTV9YRV9ESVNQTEFZPW4uIEl0IGlzICpub3QqIHRv
IG1lYW50IGRpc2FibGluZyB0aGUgZGlzcGxheS4NCj4gPiA+IA0KPiA+ID4gaGlzdG9yeSB3aHkg
dGhpcyBldmVyIGNhbWUgdG8gYmUgd2FzOg0KPiA+ID4gDQo+ID4gPiAxKSBkaXNwbGF5IGludGVn
cmF0aW9uIGJhY2sgaW4gdGhlIGRheSB3YXMgbGVzcyB0aGFuIGlkZWFsIChzdGlsbCBpcyksDQo+
ID4gPiAgICAgYW5kIGRldmVsb3BlcnMgY291bGRuJ3QgdGVzdCB0aGluZ3MgaWdub3JpbmcgZGlz
cGxheQ0KPiA+IA0KPiA+IFhlIENJIGlzIG5vdyB0ZXN0aW5nIGRpc3BsYXksIGluIG15IG9waW5p
b24gdGhpcyBvcHRpb24gdG8gZGlzYWJsZSBkaXNwbGF5IHNob3VsZCBiZSByZW1vdmVkIGFuZCBk
aXNwbGF5IHN1cHBvcnQgYWx3YXlzIGJ1aWx0Lg0KPiANCj4gbWF5YmUuIExhc3QgdGltZSBJIGNo
ZWNrZWQgdGhlcmUgd2FzIGEgNTAlIGRpdmlkZSBvbiBoYXZpbmcgb3Igbm90DQo+IGhhdmluZyBp
dCBhbmQgYWZhaXIgSSB3YXMgYWdhaW5zdC4gSSdkIG5vdCB0b3VjaCB0aGF0IHVudGlsIGRpc3Bs
YXkNCj4gaW50ZWdyYXRpb24gc2V0dGxlcyBhbmQgc3RvcCBtb3ZpbmcgaW4gdGhlIGJyYW5jaC4N
Cj4gDQo+IAk5NWRkNGRiYjVmODkgKCJkcm0veGU6IE1ha2UgY29tcGlsYXRpb24gb2YgZGlzcGxh
eSBvcHRpb25hbCIpDQo+IAk2YTUzYjAwYWZhMGIgKCJkcm0veGU6IEFkZCBiaWcgd2FybmluZyBm
b3IgIUNPTkZJR19EUk1fWEVfRElTUExBWSBwYXRoLiIpDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IEkg
Y2FuJ3QgZWFzaWx5IG1hcCB0byB0aGUgTVIgd2hlcmUgdGhhdCB3YXMgZGlzY3Vzc2VkLg0KPiAN
Cj4gK01hYXJ0ZW4NCj4gDQo+IEFsc28sICJYZSBDSSBpcyBub3cgdGVzdGluZyBkaXNwbGF5IiBp
cyBub3QgYSBnb29kIGp1c3RpZmljYXRpb24gd3J0IGF0cy1tLg0KPiBCZXNpZGVzIG5vdCBub3Qg
Y292ZXJpbmcgYWxsIGF0cy1tIChzZWUNCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvaW50ZWwteGUvYmF0LWFsbC5odG1sPyksIGl0J3MgYWN0dWFsbHkNCj4gcnVubmluZyBkaXNw
bGF5IHRlc3RzIG9uIHRoZSBBU1QgZHJpdmVyLiAgU2VlDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2ludGVsLXhlL2JhdC1hbGwuaHRtbD8NCj4gDQo+ID4gDQo+ID4gPiAyKSBo
YXZlIGEgd2F5IHRvIHRlbGwgdGhlIGRyaXZlciAiZG9uJ3QgZXZlciB0b3VjaCBkaXNwbGF5IElQ
IiBmb3INCj4gPiA+ICAgICBicmluZy11cCBzaXR1YXRpb25zLg0KPiA+IA0KPiA+IHBpcGVfbWFz
ayA9IDAvSEFTX0RJU1BMQVkoKSBzaG91bGQgdGFrZSBjYXJlIG9mIGl0Lg0KPiA+IGRldmVsb3Bl
cnMgY291bGQgZm9yY2UgcGlwZV9tYXNrID0gMCBmb3IgZ2l2aW5nIHBsYXRmb3JtIGJyaW5nLXVw
Lg0KPiANCj4gVGhlIGhvbGUgaXMgZGVlcGVyIHRoYW4geW91IHRoaW5rLiBTZWU6DQo+IGRyaXZl
cnMvZ3B1L2RybS94ZS9kaXNwbGF5L2V4dC9pbnRlbF9kZXZpY2VfaW5mby5jDQo+IA0KPiBJbiBp
OTE1LCBwaXBlX21hc2sgc2V0IHRoZSBkZXZpY2UgaW5mbyBiYXNlZCBvbiB0aGUgUENJIElEOg0K
PiANCj4gCXN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gYXRzX21faW5mbyA9
IHsNCj4gCQkuLi4uDQo+IAkgICAgICAgIE5PX0RJU1BMQVksDQo+IAl9Ow0KPiANCj4gCUlOVEVM
X0FUU19NX0lEUygmYXRzX21faW5mbyksDQo+IA0KPiBUaGlzIGlzIGhvdyBpOTE1IGRpZmZlcmVu
dGlhdGVzIERHMiBmcm9tIEFUUy1NLiBOb3cgbG9vayBhdCB4ZSB3aXRoIHRoZQ0KPiBkZXZpY2Ug
aW5mbyBzcGxpdCBpbiAyIHBsYWNlcywgeGVfcGNpLmMgYW5kIHhlX2Rpc3BsYXkuYy4NCj4gV2Ug
Y2FuJ3QgdXNlIHRoZSBQQ0kgSUQgbWFwcGluZyB0byBrbm93IEFUUy1NIGlzIG5vdCBERzIuIFdl
IGNhbid0IHVzZQ0KPiB0aGUgc3VicGxhdGZvcm0gbmVpdGhlciwgYXMgdGhleSBhcmUgYWxyZWFk
eSBwYXJ0IG9mIG90aGVyIHN1YnBsYXRmb3JtczoNCj4gDQo+IAlzdGF0aWMgY29uc3QgdTE2IGRn
Ml9nMTBfaWRzW10gPSB7IFhFX0RHMl9HMTBfSURTKE5PUCksIFhFX0FUU19NMTUwX0lEUyhOT1Ap
LCAwIH07DQo+IAlzdGF0aWMgY29uc3QgdTE2IGRnMl9nMTFfaWRzW10gPSB7IFhFX0RHMl9HMTFf
SURTKE5PUCksIFhFX0FUU19NNzVfSURTKE5PUCksIDAgfTsNCj4gDQo+IENoYW5naW5nIHRoYXQg
Zm9yIHRoZSBzYWtlIG9mIGRpc3BsYXkgYmFzaWNhbGx5IG1lYW5zIGhhdmluZyB0byB0cmVhdA0K
PiB0aGVtIGRpZmZlcmVudGx5IHRocm91Z2hvdXQgdGhlIGRyaXZlciwgd2hpY2ggaXMgd29yc2Ug
dGhhbiBzaW1wbHkNCj4gaGF2aW5nIGEgYGhhc19kaXNwbGF5YCBmbGFnIGFkZGVkLiBXaGVuIHdl
IGV2ZW50dWFsbHkgbWlncmF0ZSB0byBkaXNhYmxlDQo+IGRpc3BsYXksIHRoZSBoYXNfZGlzcGxh
eSBmbGFnIGluIHRoZSB4ZSdzICBkZXZpY2UgaW5mbyBjYW4gc3RpbGwgc3RheQ0KPiBhbmQgaG93
IHdlIHRlbGwgeGVfZGlzcGxheS5jIHRoYXQgdGhlIHBsYXRmb3JtIGhhcyBvciBub3QgZGlzcGxh
eSAoYXMNCj4gb3Bwb3NlZCB0byBzZXR0aW5nIGluZm8uZW5hYmxlX2Rpc3BsYXkpDQo+IA0KPiAN
Cj4gQXMgSSBzYWlkIGFib3ZlLCBJJ20gbm90IHJlYWxseSBhZ2FpbnN0IHRoZSBsb25nIHRlcm0g
cGxhbiBvZiByZW1vdmluZw0KPiB0aGUga2VybmVsIGNvbmZpZy4gSW4gdGhhdCBsb25nIHRlcm0g
cGxhbiB3ZSdkIG5vdCBoYXZlIGENCj4gZW5hYmxlX2Rpc3BsYXk9IG1vZHVsZSBwYXJhbSBuZWl0
aGVyIGFzIHdlJ2QgaGF2ZSBhbHJlYWR5IGEgcmVwbGFjZW1lbnQNCj4gZm9yIHRoZSBnbG9iYWwg
bW9kdWxlIGNvbmZpZ3VyYXRpb24sIGFsbG93aW5nIGl0IHRvIGJlIGRvbmUgcGVyIGRldmljZS4N
Cj4gQnV0IEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJsb2NrIHRoZSBmaXggZm9yIGF0cy1tIGRv
bmUgaGVyZS4NCg0KQXMgc2hvcnQgdGVybSBzb2x1dGlvbiBhY2sgb24gdGhpcyBwYXRjaCBmcm9t
IG1lLg0KRG8geW91IGFncmVlIHRvbyBKYW5pPw0KDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4g
DQo+ID4gDQo+ID4gPiANCj4gPiA+IEZvciAoMSkgd2UgbWF5IHR1cm4gdGhhdCBpbnRvICJkaXNh
YmxlIGRpc3BsYXkiIG5vdywgYnV0IG5vdCBmb3IgKDIpLg0KPiA+ID4gDQo+ID4gPiBJJ2xsIHRh
a2UgYSBsb29rIG9uIGhvdyBtdWNoIHdvcmsgaXQgd291bGQgYmUgdG8gbWlncmF0ZSB0byBhDQo+
ID4gPiBkaXNhYmxlLWRpc3BsYXkgc2NlbmFyaW8gcmF0aGVyIHRoYW4gdGhlIHNpbXBsZSAiRml4
IGF0cy1tIiBiZWluZyBkb25lDQo+ID4gPiBoZXJlLg0KPiA+ID4gDQo+ID4gPiBMdWNhcyBEZSBN
YXJjaGkNCj4gPiANCg0K
