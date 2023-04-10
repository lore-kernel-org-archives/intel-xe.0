Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5222C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 17:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACE610E251;
	Mon, 10 Apr 2023 17:30:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB48910E3F6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681147838; x=1712683838;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eCGOHnWgKVaPJbXOZz4ru/ol/RtKqruqk/ue9Jp5zZo=;
 b=fST6fciFTl9fdOc1uKG9JsXgNVbBdUBRr9ff4qA8RQqcBLWloSi/dkJe
 s7FCig/gJOiGBg84gUQQvY89NyJ0t8MgBCxcbP0r1idKQ3iCxaoagZzAH
 TLPWyl/h81qGiN54At1M+Oowzb0DEQZSQruyrNtxgRAbmJtb8FhP72vcv
 Zsl9ZClT+OzG6vRjIARLyRXwfhE5rKyZbdBVrNuLLKZNXj0lNz5Jra1TD
 wJpcDSPB44KpObqvPxyzCvNUEIpM0SCs5wNBCb+aSzfoHQEI616RpsNKM
 LivA6hA/4ZA+j4a42XRZF8WXj/bcoT7/hZ5OTy0QPCnjYOz/oeozIGafS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371252159"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="371252159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 10:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="812233392"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="812233392"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 10 Apr 2023 10:30:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:30:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:30:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 10:30:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 10:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmIp7DVyokwhkfEhNuWrp+c5BbxHT/vhtUwIysZX4FUOsZG/FjvULosrIPw/WDI7NMzABc4fcprLQKdcxBzIHT7CyxGiAm9n4yzsTrWOaaXQ7W+edG6XogD4azCKU40wn0lk1t841nL8fh4bdf84Dro5URhNVd7ReSSdr8qSna7uaD440/NPXGi2S8OxE4oee+DYdFxxzHW6Hg+OyvPc7rY+PAzWjM5IhvnUJdJFYjfMK23bQsdyQqvGUBtNhRswSxT1KBPXHWSZQ6mN4rNB3jPxxZUcqhw7Ke0Yb5liKvEY5XblKICX5qJsskOXDTQSSBhLwzGtuodAPzuRLLbDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCGOHnWgKVaPJbXOZz4ru/ol/RtKqruqk/ue9Jp5zZo=;
 b=KvshHRZsj2fDV1ihDEWCroFV73X0M/VWyjgVzSNythcl4UNfecymqv7iVfimWUfWiXED2lYy6hrkQb7/ZDb9ngUUVom/YNpxVl18UpsP/79pKut1crJXmC4yAWArVUMuuI35dD0kDy7RZ/bYt8M69aPMwRt/wFC/KQt/KRfn+KxPTLBhbfvJeKO/q2NDBVBACI157FF0kvpWe6Tbu67VKJCv+Zcm+IARleXPe80SLjfeEEdzwWFxVHgF9y5DnEVm9BzA288HuHQxb/JPYsMMpWpfLNh7wcbc/GW7uO0DQlpo0RrY04GD5khHbtb2tXXd2JXj5s4F5Q5sPSKwtVJL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 17:30:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 17:30:35 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable modular
 fia in TGL
Thread-Index: AQHZa8KFeRRXeEhHIUmahDgz4CMoRK8kujyAgAAHXACAAAbmgIAAAWAAgAACjwCAAABcgA==
Date: Mon, 10 Apr 2023 17:30:35 +0000
Message-ID: <417d123306357e101b6d7878dc2d3b0f809d470a.camel@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com> <ZDQteoVKCktzyNus@intel.com>
 <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
 <ZDQ+VkdmHwcZQL/W@intel.com>
 <e8ab12b22159466ae1fb606ecca2c4e4f02a0e12.camel@intel.com>
 <ZDRFRruHewZK26MW@intel.com>
 <e75c650e6996a7630c4b4301b95613fb02b62750.camel@intel.com>
In-Reply-To: <e75c650e6996a7630c4b4301b95613fb02b62750.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|DM4PR11MB7375:EE_
x-ms-office365-filtering-correlation-id: e87e5e80-4512-4162-07e7-08db39e94b1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ooOc668JrqxOemfIsmXIT1ND48o0w1mlep9FmK9mMVle1OJO6APXO+Z4gMY6QM1SfHSL/+NfSRAkRIsK+VDqW5qBau/2uMyXJVh2hJJPyw8rANDoxQKZsMHu7jqhpfmMAThBfl5xEvTgJBAfUmQ++W1iUwrcAIAUazV2lyTxnEUJlcqiRnY+5qc8E77VBj6qt1BdY62whm8puASAg0/xiBsAXo8jx974JtI3qqXcoOzFn5Kx6Sf0dUsUmmFC7AHia/OkMEX7nHaoXS7Srkc6mh53ofuTmd+cmQmACl7/01idx8idLAaOj7kgehty0RvHtypHAr9AjrkHCVazvzlc0nCY429l0wOTMEq7tlcEcS9Dw1kqNCnR/vL9TpsYV5Enb/nCEcWaTyyJuzXbVkyPuDUIf4CbraChjXnl74n86kDtPL/rVo0UcDj2NpuMM9PJb7lQFUI/jVs2M7H+LNQC5qG/rlEyjM5bjM6lF4h2phuIm+XQND/it1yg/Em2P68xNch0FA7QVZ51Hty8j9+tXYo7AaKDDtDbUv9oIl5HIS3d4InzPRUusUx5wBbelMUI/qqc9stfS//sUgupCwF8+QUDmwioPcu3k4LqHmoUpRAK5hEwCrK5/pkGsS/HG3Ve
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(8936002)(6862004)(6486002)(5660300002)(86362001)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(66946007)(8676002)(4326008)(478600001)(38100700002)(38070700005)(37006003)(316002)(82960400001)(122000001)(6636002)(2906002)(71200400001)(6506007)(6512007)(26005)(2616005)(186003)(83380400001)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjNZb1c2Zkt5SE1uNW5zQnlIVUpsSHhDVTJjd0tWYXpZa2JSYnFMeFgvUU1I?=
 =?utf-8?B?aEs3cGtpNTVja1huUmF2ZUgxbk1yMVpGZVRVdDdGbXBraWhLZDRMSUVKTGdy?=
 =?utf-8?B?Wm0vajBRbGNXeVN3SE9rK3Ntc2tBUjdySWtjaDVkN0kySmJCZUR0MVhEN0Zr?=
 =?utf-8?B?bnljZDU5ZGowMXBNK0FIemphUVIxakJqQkRTY01oZFVVei9kMDEzZlY0TkNi?=
 =?utf-8?B?cTlmaWZlWXhtcFZVb0dTVHMvUWNvM1E5RkRCMGNiekMwRXgyQWxwTkgwZHFE?=
 =?utf-8?B?S2MrNFVSZXlVbVB4WHdUSXBxMmNqLy9CMnBVTnArdHVLRWVHTHhaZ0pJTk9x?=
 =?utf-8?B?MlNtU3hZUzExUTUwejE1UkxzMVlSaklMUGVVMG53U3RCRUZ3MlR6aFp5SGM4?=
 =?utf-8?B?Q0NPeExmTWVIRUFYQ2FGR2hTR2pxck9peGc0ekdyQ1Budys2WWEvdVJLQ3Rl?=
 =?utf-8?B?bDBWaUZLVk1TdzRRSnBqSEZRUUc1eVlsRjVsbXZnYVoybFh6UVcyWXI4bGZR?=
 =?utf-8?B?RUgyakRIbDY0MlJJMndIN2FzSGE5WWJtekJVTTcrZzhBc2w0SEtQbHdaSkcr?=
 =?utf-8?B?OUVwNmlqM0w1RWhqdGptclRrRkM1K3JFelhmT2R3czIyMkwvQytac0N2enN6?=
 =?utf-8?B?N3YzNkxodUZ5U3hURldwUnhBOFFNTXlDN3RqZ1hlbUVORkFoaGpjSTBFcnB3?=
 =?utf-8?B?UWxPdklRQ2hoRWpheFJsYW81RGFLMXFZMnhXL1pKMUJDcE04TWtUbUptb2Vn?=
 =?utf-8?B?RVlOQXpQV2c4aldIVTc0bWoveFlsVHFBR2I1U1cxMzBXb1ZUSSt6VkxHakhC?=
 =?utf-8?B?TisvZTd5b3ZoVGFRRmExOXJNbm15a2pqTkR0WGNrSk1mRUhqaktpWWxKSmF0?=
 =?utf-8?B?K3FBeTE0WFNIQy9sVG40ZnBuVnZvUnB0VjMvcndQYTNKS1ZjWER6MTdRd2Zw?=
 =?utf-8?B?bXgrYzNYeFlpQWIrU1l4L0U2RHhla1U5RXhPNkZKSlJFeTdXZkNaUUhaMEVP?=
 =?utf-8?B?ajJCMFlrckxwKzl5MHZOZ2ZIMlpES0NQR2Nqb3h1UDFGa3IraFg4eTJMMklE?=
 =?utf-8?B?eVhTcUJTV1g2dlc3S3pBTzE4N0s4b3pYVFhuOGFNNk5MY2lsWGJRUHF5QSs2?=
 =?utf-8?B?RTRjMzRxMFlxWDZYVEVPOEx4aHNML3BxQzBVdzRBQzZvcXB4bndwd2lkSHJ2?=
 =?utf-8?B?cmVURmJBczZmcWtWUE0yQlJvMG85S2RkK0QzRVV5S3VvckEwbFFzOHpTSG9j?=
 =?utf-8?B?c29OVVhtYUErT2RQbTExQWp0MmN0WFQwWCtkU1dvNVkzN3VPRVp3NUdPUkpL?=
 =?utf-8?B?bVVkSk5rRDVXRVJLNWVzaVJUdSs4Qk43SUl4emFQSWc4amxTQUUwU25FL21L?=
 =?utf-8?B?aHRYSVV2SlloK3RmY0phb3RLUFd5MUJ3UHNQek5YOVFTMlJzZXZEVlIwa2ZD?=
 =?utf-8?B?c1dTcEFBdkNYYTNNQ0lUSTVvYVlpY3BYbENLOThnMFZHRkVITHFWR2FiM1Ev?=
 =?utf-8?B?d0VrVkpTT3pTVUV2Z0xsck5tRll0Wk0xNjJVTEVPams3RjJSKzl2V0NBNnJK?=
 =?utf-8?B?QitGa2hzalBwd1FxV2NFVDFZUjRtczMrZEdCbllza3kzMVpqWjdvVVgzOTBa?=
 =?utf-8?B?T2JSY3U5MElsTkFENktHY3pneEVIUW8wTnhTTkhYRnFCQjJUTDcvek9NQk5O?=
 =?utf-8?B?Tlh2RkRkaTB5OXpWZ1Y0TkR1YzBSV3l6Z2lUT20weGRiL0lra0VjbWxFdEJp?=
 =?utf-8?B?M1djaVVXeHZHckVQUDN5d3lLWkF3Vmp2aVp0YTBLcENVaW1vcnpkakhNQ25q?=
 =?utf-8?B?R3ZNYytORkZmQTM1QkQ2c211OWt1ZUQ4ejBUR2RGci91ckRrNS81UEY0QmRa?=
 =?utf-8?B?TEZPVDhtVFBaQVhoK3pvenZzejZsSzlUUGQ0UUVQRGh4ZTNXOXgwYnB4VFdo?=
 =?utf-8?B?bzhxVXErMmtZUHBMZzhnNTFrMTdEOGJtZ1dxMzVkMUpoTnh0QUtuNjlLNEZ1?=
 =?utf-8?B?Yk5zbUh6RWZiQVVoK3hZYzZpN1ZBUURmeGtMOHJpbXlMVGI1SldQWkhzdHZ6?=
 =?utf-8?B?dC9TMGpzSjllTk9wb0o2RVZIeDBqZFB2UWgxRjQwY3o0WnhCUG44V2crQ2Nl?=
 =?utf-8?B?bW5INnhwTlZMWUI1OVdleGFWeUxLN2VBVlJsNmZBOWxzTCtBYUhOY3hYNDlP?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D50F5726A3D5E142A3C02D6BDE0BA2AE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e5e80-4512-4162-07e7-08db39e94b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 17:30:35.3199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmBV1xLik4RUxyIkwPNsbH/S+HYjxcBudDq9F6j4upiEwtHTkhgtC5U9gTV1uN81MDhxqjyBdzxsOPFz3Lil3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDE3OjI5ICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gTW9uLCAyMDIzLTA0LTEwIGF0IDEzOjIwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
ID4gT24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMDU6MTU6MTFQTSArMDAwMCwgU291emEsIEpvc2Ug
d3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjMtMDQtMTAgYXQgMTI6NTAgLTA0MDAsIFJvZHJpZ28g
Vml2aSB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMDQ6MjQ6MDlQTSAr
MDAwMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+ID4gT24gTW9uLCAyMDIzLTA0LTEwIGF0
IDExOjM4IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBUaHUsIEFw
ciAwNiwgMjAyMyBhdCAwNzozMTozMUFNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlDQo+ID4gPiA+
ID4gPiBTb3V6YSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gVEdMIGlzIHRoZSBmaXJzdCBwbGF0Zm9y
bSB0aGEgaGFzIGl0Lg0KPiA+ID4gPiA+ID4gPiBFbmFibGluZyBpdCBmb3IgREcxIGRvbid0IGNh
dXNlIGFueSBpc3N1ZXMgYXMgREcxIGRvbid0DQo+ID4gPiA+ID4gPiA+IGhhdmUgYW55IHJlYWwN
Cj4gPiA+ID4gPiA+ID4gVEMgcG9ydHMsIHNvIGludGVsX3RjX3BvcnRfaW5pdCgpIHdpbGwgbm90
IGJlIGNhbGxlZCBmb3INCj4gPiA+ID4gPiA+ID4gREcxLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBzbywgd2h5IGRvIHdlIG5lZWQgdG8gZW5hYmxlIHRoZW4/DQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gVEdMIGhhZCBpdCBkaXNhYmxlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IHNvIGl0IGxvb2tz
IGxpa2Ugd2UgbmVlZCB0byByZWZhY3RvciB0aGlzIGluZm8gc3R1ZmYuLi4NCj4gPiA+ID4gYmVj
YXVzZSBsb29raW5nIHRvIHRoZSBkZXNjIGl0IHdhcyB0aGVyZSBvbiBUR0w6DQo+ID4gPiA+IA0K
PiA+ID4gPiAuZGlzcGxheS5oYXNfbW9kdWxhcl9maWEgPSAxLA0KPiA+ID4gDQo+ID4gPiBXaGVy
ZT8NCj4gPiA+IEkgb25seSBzZWUgaXQgc2V0IGZvciBhZGwtUCBpbiB4ZV9kaXNwbGF5LmMgYW5k
IG9uIGk5MTVfcGNpLmMgZm9yDQo+ID4gPiB0Z2wsIGFkbC1wIGFuZCBtdGwuDQo+ID4gDQo+ID4g
ZG9oISBJIGxvb2tlZCB0byB0aGUgd3JvbmcgcGxhY2UuDQo+ID4gV2hhdCBjb25mdXNlZCBtZSBp
cyB0aGF0IHRoaXMgaGFzX21vZHVsYXJfZmlhIGRvZXNuJ3QgZXhpc3QgYW55bW9yZQ0KPiA+IG9u
IGk5MTUuDQo+ID4gU28gd2UgcHJvYmFibHkgbmVlZCBzb21ldGhpbmcgZGlmZmVyZW50IGhlcmUu
Li4gb3IgYmFja3BvcnQNCj4gPiBzb21ldGhpbmcgdGhhdCBpcw0KPiA+IGFscmVhZHkgaW4gZHJt
LWludGVsIGFuZCB0aGVuIGEgZml4dXAhIG9uIHRvcC4uLiBvciBzb21ldGhpbmcgbGlrZQ0KPiA+
IHRoYXQuLi4NCj4gDQo+IEh1dW0sIGRpZCBub3Qgc2F3IHRoYXQgdGhpcyB3YXMgZ29uZSBpbiBk
cm0tdGlwLg0KPiBJdCB3b3VsZCBuZWVkIHNldmVyYWwgYmFja3BvcnRzIHRvIGRyb3AgaGFzX21v
ZHVsYXJfZmlhIGluIFhlLCBUQyBoYWQNCj4gYSBodWdlIHJlZmFjdG9yLg0KPiANCj4gQ2FuIHdl
IGhhdmUgdGhpcyBjaGFuZ2UgbWFya2VkIGFzIHRlbXBvcmFyeSBwYXRjaCB1bnRpbCBuZXh0IFhl
DQo+IHJlYmFzZT8NCg0KYWNrLCBsZXQncyBkbyB0aGF0IHRoZW4uLi4NCg0KDQo+IA0KPiANCj4g
PiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IFRoaXMgaXMgbmVlZGVkIHRv
IHByb3Blcmx5IGluaXRpYWxpemUgVEMgaW4gc29tZSBza3VzLg0KPiA+ID4gPiANCj4gPiA+ID4g
VGhpcyBpcyBhIGtleSBpbmZvIHRoYXQgd2FzIG1pc3NpbmcgaW4gdGhlIGNvbW1pdCBtc2csIHBs
ZWFzZQ0KPiA+ID4gPiBpbmNsdWRlIGl0DQo+ID4gPiA+IGluIGEgbmV4dCByZXZpc2lvbi4gQWx0
aG91Z2ggSSdtIG5vdyBjb25mdXNlZCB3aXRoIHRoZSBpbmZvIHNldA0KPiA+ID4gPiBpbiB0aGUN
Cj4gPiA+ID4gZGVzY3JpdGlvbiBhbmQgaGVyZS4uLg0KPiA+ID4gDQo+ID4gPiBXaWxsIGRvLg0K
PiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBXaHkgaXMgdGhhdCBkZXNjIG9uZSBub3Qgd29ya2lu
Zz8NCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emENCj4gPiA+
ID4gPiA+ID4gPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+
ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGlzcGxheS5jIHwgNSArKysrLQ0KPiA+
ID4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGlzcGxheS5jDQo+ID4gPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2Rpc3BsYXkuYw0KPiA+ID4gPiA+ID4gPiBpbmRleCA1ZmFiNWI5ZmJkZTBjLi4wMDAxYTlk
MDI0OTVkIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGlzcGxheS5jDQo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNw
bGF5LmMNCj4gPiA+ID4gPiA+ID4gQEAgLTQ4Niw3ICs0ODYsMTAgQEAgdm9pZCB4ZV9kaXNwbGF5
X2luZm9faW5pdChzdHJ1Y3QNCj4gPiA+ID4gPiA+ID4geGVfZGV2aWNlICp4ZSkNCj4gPiA+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN3aXRjaCAoeGUtPmluZm8ucGxhdGZvcm0pIHsNCj4gPiA+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgWEVfVElHRVJMQUtFOg0KPiA+ID4gPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBYRV9ERzE6DQo+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5kaXNwbGF5ID0gKHN0cnVjdA0KPiA+ID4gPiA+
ID4gPiB4ZV9kZXZpY2VfZGlzcGxheV9pbmZvKSB7IEdFTjEyX0RJU1BMQVkgfTsNCj4gPiA+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlLT5pbmZvLmRpc3BsYXkgPSAo
c3RydWN0DQo+ID4gPiA+ID4gPiA+IHhlX2RldmljZV9kaXNwbGF5X2luZm8pIHsNCj4gPiA+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHRU4x
Ml9ESVNQTEFZLA0KPiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC5oYXNfbW9kdWxhcl9maWEgPSAxLA0KPiA+ID4gPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsNCj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsNCj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oGNhc2UgWEVfQUxERVJMQUtFX1M6DQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeGUtPmluZm8uZGlzcGxheSA9IChzdHJ1Y3QNCj4gPiA+ID4gPiA+ID4geGVf
ZGV2aWNlX2Rpc3BsYXlfaW5mbykgew0KPiA+ID4gPiA+ID4gPiAtLSANCj4gPiA+ID4gPiA+ID4g
Mi40MC4wDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gDQo+IA0KDQo=
