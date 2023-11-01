Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA34C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 14:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7F10E708;
	Wed,  1 Nov 2023 14:33:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941C10E708
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698849186; x=1730385186;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=KfaFNfJO2XL0MQ+yuvFryfg4QTYJlLWZEgXFwlKILok=;
 b=DPBxz1BXH5xWbJWKP7OVwuCjAuk9xM4lG69yAbvNAdT0rY4U2u3BfVKN
 K8fyqSn4gLuOpbH1B8Y4Z4rkeuIsqLc5VRpgZjoaDBnYo7Xp3vQTPdUYB
 49mEmfTlzwKrS9WukPn3SyCULOFX0kuwGaSnoSr36T+0K9tIPrxfh3iOA
 8TyP0I02XmaA1wYuYuqbYUoIMu9e6HwMEX4FT0d/6EcLk+nigOGSjfWvE
 Nsj4C2BhmlDKwB2q6e8WshhS81uPxzA+AdJmq2aLHCazv+9jS1ynln/SI
 /us4e/qhVtTrM5kt7Xd2kFYV07CaTVBxdZrexMvGXoUgEB0MlalM3rfF2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368708266"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="368708266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 07:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="9057803"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 07:32:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 07:32:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 07:32:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 07:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBMYNc4SKTOMC96S0/iHkGqztvhXlONBfhnRSSuG/a67usaCd+nlJ1fdH4pd72HnyO3ZdryNqi0Pl2eRJaBUelqRtMIhdz84PONa8NIRz6Mh6/gTTcr8MBOvXx4M/7eL8ws5p2fNfdLLv70ELlC9JW8OKuKZ/TsHTdlhUleKb/EithWk3G6rLrwJnHDc95z1MvYtApOaZrhiKffOU4Hhjpt3gI3APcjpWqqqBUMi85miSSj4M9qp+V7I2WKuMZ9N5LRxJXSCjpLz8l5QTMe9JXaK5DAGlXqZR2cJICvO8xuI9VVtnbwkAfeByyVPhqfd9jNlmTxtES1uuknbyc1hNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfaFNfJO2XL0MQ+yuvFryfg4QTYJlLWZEgXFwlKILok=;
 b=Vyl5HAAcOtkjnnPVdvhqNHs74YZrxHs+WVwcy9NOuBw46vYG/vB/Cbu/7IeMg8oXClAeEi6BBZBysaqSGzrEiCO5YuTsRq5Xw3vOgw8CjsWIzNNLCnZ5+O5sEqEAPs0+wpYQc4fGOD6V+0wFLuiE/3fWTBgTOMhi439TmMZY1efB6D7Vem3yn3gYU92uPlY4tXYMA2kaAIReTsxGbkNOfJuFcOIsqRfkyWufFhPBlJqz7wH61T52/UclnhmzI/7cNaQpACHO+B5PCQKbmHMuom+fMgSeq0j2mBR+G3aiYu2U7hnHyKqNTc9V0vGim2ZDvAT/O6Zu/4grU4EXAJo50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 14:32:53 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 14:32:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Thread-Topic: [2/2] drm/xe: Fix pagefault and access counter worker functions
Thread-Index: AQHaDEzKQCRtLeDuvUCssGMR3S6v8bBkgXaAgABkqYCAAKHeAA==
Date: Wed, 1 Nov 2023 14:32:53 +0000
Message-ID: <d1ecb65f9b360b8a4bd332bdf24d2e0badd78df7.camel@intel.com>
References: <20231031221510.29355-3-brian.welty@intel.com>
 <336cc01975710b80646905be5e9337e6735cc67a.camel@intel.com>
 <7214aa37-3a10-46b4-b410-a80fa6eaaf08@intel.com>
In-Reply-To: <7214aa37-3a10-46b4-b410-a80fa6eaaf08@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4662:EE_
x-ms-office365-filtering-correlation-id: 88127f21-f2aa-48b1-3b1f-08dbdae76e9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4rygNznTFMuljroxh4O5dvQ6FIj9NDJ8Tw+X4aGDUKyQ7+LceAmNiKbGNp4IKbUG5YIzYDLR3bdaQ2tcNc2SR6nw254NfUfXfN2GiFjxzR3Id1o50U1pDjbB4VYSNN9+tUaeIuG/HACV2RjJEXC/0wUUXgM/vuwTYVoi562dUm9zM9aFYQTH6USpO8B0LMuM4mUTSTgS2oZvoOCzRDKo0j3fZOG/+L8/knwXY4ySrd2dY4ooc3v/oa+lGj5f70YT7CZsz1rpG+2nU8uSGOv3kol+8x69uLAI1a3xcDepa5TMQE3387imk3aO/PyitweIBPpM/reTJMxZbrnjkL7BGh0sOg+10wQ++15oSo10/ckvN7p7OHpf9utORO0J3YC7GbCQvkBRP/9FG2K7eJj2WgWSKPESeYqNh5XaqG2Bz7MzW6mn7ZWe8lCG6iGObL9BPJSeYeYGHoSIRbKXUzZiSMdueGv4TvpugxlHFG7src6bO6nmrR8utqzYs960wJCtpjhL/L9+kjOBJ8e9EWLDjvjXn+uG/u1+qm9T1igbueDAEwwTawi2IXaQZBaWpH8CJIUJdRBjJ8UmNnt5mnPMxPSl8AfKOBfzl04ykPk5lwc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(4001150100001)(8676002)(8936002)(64756008)(316002)(110136005)(66446008)(91956017)(6636002)(41300700001)(26005)(6486002)(478600001)(6512007)(53546011)(71200400001)(5660300002)(6506007)(2616005)(83380400001)(2906002)(76116006)(38100700002)(66946007)(66476007)(66556008)(82960400001)(122000001)(86362001)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHJ6dUFZbVY5S2pjMldJeHNpMXJyRklSVGoxMGhxZ210ZldDMWpwQlBqWWl6?=
 =?utf-8?B?MFVua01LaEorTkJrVTQyU21aRkszRENvaU9nQVQ0ZFlCeWNSWmd3Q05xSVBn?=
 =?utf-8?B?Q3RMZkROVlZCcERsSlR6MEkzandsZlgrT3o1dWxLcThZdnAxRDZTYjQ4TVNE?=
 =?utf-8?B?cTdna002RzlyY2h3amxULzI5Yk5yaENmcG5LOFZ2WlBBcHhqbi9lTStINzJ3?=
 =?utf-8?B?UDlsNi9aYTJCV0tuMkVZRFRrb1BqaWFPc3JNQW5peWcydWxIUEhzUy82Szdv?=
 =?utf-8?B?ZXFTSHZVa1U2YVJGZlVqY1N1Mk9pdzFMcUtIOHNTcWtwUkphaWsvdDZSVGVT?=
 =?utf-8?B?U2ZLMmh5SEZLcW1xYkx1dG1ZV3Vyb2IrSWV3djJSRGdIZ1VkKzNhUE9CMmI4?=
 =?utf-8?B?OWNYVytyT0p1Y1lteGZuMUVmdUEwTHhHZkllRmJwbkJrcTJSTmQ5YXQrbmxx?=
 =?utf-8?B?T1paSjdnTDlFTEFtMGJ3a3BFTnkxZmc2WTF0eG11a1BHMVdXcTlraHU1Z0V6?=
 =?utf-8?B?M3VjRTljVS9XbmVONHpEY2VJL1BIeEVROTBQNktBQ0RtTm9RVjJNOHlRNERX?=
 =?utf-8?B?eEtKeVF3R1Ryc0dtOHBwTVgwRFo0WTl2bzdLVTN5bkhBVWxaR214Q01seGFs?=
 =?utf-8?B?WnA1Qys2Z0JTZE16SUNjYlpyRVd5TGd5RmJyM1d6N0RlY3F1MVJ1U3NWTVFs?=
 =?utf-8?B?dXl5OWE5dkROYm9kcTc5M0xtNzJKdzgxN05TTENwdGp3bXh6bXNsT1pJRGJ4?=
 =?utf-8?B?WlhZZkcyUWlGUHFXbG1sZWRnZDVMQTYvU3llSXRwOU0xSFNicDd4a3pvVDlB?=
 =?utf-8?B?aThlT0FQRlFUaGVGRTVmdThocTF4UmhLK3NQTzZKUWU3L2RnVnpFaXFmdG1N?=
 =?utf-8?B?STJpNGxhMm9rTVluMU1UK1VQWDRRZEFnbUZwR3dGVDNLc0Yyc0FocTJua1Fy?=
 =?utf-8?B?bk1obHk1V3ZSMzZiaC8rdVIwa0JSV295YTIxL0trdXhyOG1GNDMrNHZNUUEv?=
 =?utf-8?B?ZXZYd25hTnVkSGFiS2hzTTNkRGs1cGZFUVNqTWkzRXFMTUd2U3RUUGtDdG9H?=
 =?utf-8?B?eW5CN0kyYVFvWGlESHRmUjRJSkVHbnlDekc1bW9wTDYrTkZQaVZzTnYzVUF2?=
 =?utf-8?B?YVFRRjRnRzFWSFdxSk5mcXJMQ0FxREI5QnFqUjFpVzJKRDJGRDJabFZwTjBL?=
 =?utf-8?B?dnd3TmFyVGNZMmpnWC9VcmQzRkRWSSt3dGNJQXdlVUhqdktGRU5odldnR2c2?=
 =?utf-8?B?YjB4UVlEVzVPZExhMi9YZ1o1eWpBT0NsZTRHbm9uazlsUnMzQTdnNzQrcEk1?=
 =?utf-8?B?OFdEeSttTWV0ZjVmRWhUd0pjKy9aMnVDVnF2cXhTbmpGK1hKVi9KbDRvNWhy?=
 =?utf-8?B?UW5JZTAzcEtvSU85dGhPZjliREdDdkhyN0NWSmxuNEhndy9xaWVIV3MyRko0?=
 =?utf-8?B?U3dZRE9jeVFPMGhnSGZ2bjhoeHJ4UmpGcGZ1WFdBS2hjZTVBQ2NxamIzeUsz?=
 =?utf-8?B?N0t5Y0VGZ2VFNnQydU5wZm9ibG80YzI1MVFFZVc4VUZva3VmVXNlVktZd3d0?=
 =?utf-8?B?eUUwckIvVGFqWVQ3bmx0WWVrajkrRjg3UUw3OEZsQVBHNG55WUxHSU5qcHBp?=
 =?utf-8?B?eDFVYldQckVQS250OGxBb1kyK09ncjgxcGNWVjVjUDFPK3MxWG81cFgxcnN4?=
 =?utf-8?B?eXpyMTVNT3FuR0ZoUXJ6STkyUjFGZ0lWUDZGNUJuQUQ5ZjduV2FBaG9zN0c5?=
 =?utf-8?B?Sm0yOWN5eklpVVpUNlllQXp5U1psdEFmMEpLMWpSaFdQZ3lRRFBpS1ZNU0pK?=
 =?utf-8?B?Yjd1a1lLUVkrazNRWXJiNGFKZDMzaXFyS2YweW1scDhBY0RSbS9zRWN1TXJ3?=
 =?utf-8?B?bG4rbnJvTGhNTFJtWldiVUV3U3BQUUxOUERPaG9DVlE5bVRnbXpLTC91aDJz?=
 =?utf-8?B?elJMQmpVekpLWFJYdlpHcSthcDBxZFQ1cDVZT20yWkQ4Qis3Q1Q0bDROVEUw?=
 =?utf-8?B?K2dyelFjZ0ViZlcxdWovRXpCTmUzWXFReGYrbnZqMk9tclVodTh1Ylg4ME5N?=
 =?utf-8?B?VzZjV2pMVkdLTy82VmJ2L1l0cCt6WSszU1JpbkZsL3oxaXRoaW52cTBubnJS?=
 =?utf-8?B?bEJJanAxZ0J6alUyRW1vWlVHU21tejA4L1o2KzF5VHkxT2FkN0ROcW54NG9q?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51C11D6D5784D54493EB989565685034@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88127f21-f2aa-48b1-3b1f-08dbdae76e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 14:32:53.0905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXZdhevQeR0h/VH5B8I5wS2HOyfCd7/nSNqWqAKRZ5vKUvoNlMguhsQ0kvdfkN/ndhTFDUeTw7FyZ9jeNd4iz5shkn5hsFiAQS/4KyaYrJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [2/2] drm/xe: Fix pagefault and access counter
 worker functions
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

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDIxOjUzIC0wNzAwLCBXZWx0eSwgQnJpYW4gd3JvdGU6Cj4g
Cj4gCj4gT24gMTAvMzEvMjAyMyAzOjUzIFBNLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6Cj4gPiBP
biBUdWUsIDIwMjMtMTAtMzEgYXQgMTU6MTUgLTA3MDAsIEJyaWFuIFdlbHR5IHdyb3RlOgo+ID4g
PiBXaGVuIHByb2Nlc3NpbmcgRzJIIG1lc3NhZ2VzIGZvciBwYWdlZmF1bHQgb3IgYWNjZXNzIGNv
dW50ZXJzLCB3ZQo+ID4gPiBxdWV1ZSBhCj4gPiA+IHdvcmsgaXRlbSBhbmQgY2FsbCBxdWV1ZV93
b3JrKCkuIFRoaXMgZmFpbHMgaWYgdGhlIHdvcmtlciB0aHJlYWQKPiA+ID4gaXMKPiA+ID4gYWxy
ZWFkeQo+ID4gPiBxdWV1ZWQgdG8gcnVuLgo+ID4gPiBUaGUgZXhwZWN0YXRpb24gaXMgdGhhdCB0
aGUgd29ya2VyIGZ1bmN0aW9uIHdpbGwgcHJvY2VzcyBtb3JlCj4gPiA+IHRoYW4gYQo+ID4gPiBz
aW5nbGUKPiA+ID4gaXRlbSwgYW5kIGlzIHVwZGF0ZWQgaGVyZSB0byBjb250aW51ZSBleGVjdXRp
bmcgdW50aWwgYWxsIHF1ZXVlZAo+ID4gPiB3b3JrCj4gPiA+IGl0ZW1zCj4gPiA+IGFyZSBoYW5k
bGVkLgo+ID4gPiAKPiA+ID4gVGhpcyByZXNvbHZlcyBpc3N1ZXMgc2VlbiB3aXRoIHNldmVyYWwg
aWd0QHhlX2V4ZWNfZmF1bHRfbW9kZQo+ID4gPiBzdWJ0ZXN0cy4KPiA+ID4gCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiDCoMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jIHwgNjYgKysrKysr
KysrKysrKy0tLS0tLS0tCj4gPiA+IC0tLS0tCj4gPiA+IC0tCj4gPiA+IMKgwqAxIGZpbGUgY2hh
bmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiA+IGluZGV4IGFiNmRhZWJiZDc3
Yy4uNjNmYmE4M2MwODM5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfcGFnZWZhdWx0LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2Vm
YXVsdC5jCj4gPiA+IEBAIC0yNzYsMTAgKzI3NiwxMCBAQCBzdGF0aWMgdm9pZCBwcmludF9wYWdl
ZmF1bHQoc3RydWN0Cj4gPiA+IHhlX2RldmljZQo+ID4gPiAqeGUsIHN0cnVjdCBwYWdlZmF1bHQg
KnBmKQo+ID4gPiDCoCAKPiA+ID4gwqDCoCNkZWZpbmUgUEZfTVNHX0xFTl9EV8KgwqA0Cj4gPiA+
IMKgIAo+ID4gPiAtc3RhdGljIGludCBnZXRfcGFnZWZhdWx0KHN0cnVjdCBwZl9xdWV1ZSAqcGZf
cXVldWUsIHN0cnVjdAo+ID4gPiBwYWdlZmF1bHQKPiA+ID4gKnBmKQo+ID4gPiArc3RhdGljIGJv
b2wgZ2V0X3BhZ2VmYXVsdChzdHJ1Y3QgcGZfcXVldWUgKnBmX3F1ZXVlLCBzdHJ1Y3QKPiA+ID4g
cGFnZWZhdWx0ICpwZikKPiA+ID4gwqDCoHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgY29uc3Qg
c3RydWN0IHhlX2d1Y19wYWdlZmF1bHRfZGVzYyAqZGVzYzsKPiA+ID4gLcKgwqDCoMKgwqDCoMKg
aW50IHJldCA9IDA7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJvb2wgcmV0ID0gZmFsc2U7Cj4gPiA+
IMKgIAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxKCZwZl9xdWV1ZS0+bG9j
ayk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGlmIChwZl9xdWV1ZS0+aGVhZCAhPSBwZl9xdWV1
ZS0+dGFpbCkgewo+ID4gPiBAQCAtMzAzLDggKzMwMyw3IEBAIHN0YXRpYyBpbnQgZ2V0X3BhZ2Vm
YXVsdChzdHJ1Y3QgcGZfcXVldWUKPiA+ID4gKnBmX3F1ZXVlLCBzdHJ1Y3QgcGFnZWZhdWx0ICpw
ZikKPiA+ID4gwqAgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZl9x
dWV1ZS0+aGVhZCA9IChwZl9xdWV1ZS0+aGVhZCArCj4gPiA+IFBGX01TR19MRU5fRFcpICUKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9R
VUVVRV9OVU1fRFc7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoH0gZWxzZSB7CgpZZWFoIG9rIEknbSBq
dXN0IGJsaW5kLiBJIG1pc3NlZCB0aGF0IHlvdSBkcm9wcGVkIHRoZSBlbHNlIGNvbmRpdGlvbgpo
ZXJlLi4uCgpPayBubyBwcm9ibGVtIGZyb20gbWUsIGxvb2tzIGdyZWF0LiBUaGFua3MgZm9yIHRo
ZSBwYXRjaCEKClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPgoKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC0xOwo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gdHJ1ZTsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9ja19pcnEo
JnBmX3F1ZXVlLT5sb2NrKTsKPiA+ID4gwqAgCj4gPiA+IEBAIC0zNTcsMjkgKzM1NiwyNyBAQCBz
dGF0aWMgdm9pZCBwZl9xdWV1ZV93b3JrX2Z1bmMoc3RydWN0Cj4gPiA+IHdvcmtfc3RydWN0ICp3
KQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGFnZWZhdWx0IHBmID0ge307Cj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gPiA+IMKgIAo+ID4gPiAtwqDCoMKgwqDCoMKg
wqByZXQgPSBnZXRfcGFnZWZhdWx0KHBmX3F1ZXVlLCAmcGYpOwo+ID4gPiAtwqDCoMKgwqDCoMKg
wqBpZiAocmV0KQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+
ID4gPiAtCj4gPiA+IC3CoMKgwqDCoMKgwqDCoHJldCA9IGhhbmRsZV9wYWdlZmF1bHQoZ3QsICZw
Zik7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICh1bmxpa2VseShyZXQpKSB7Cj4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcmludF9wYWdlZmF1bHQoeGUsICZwZik7Cj4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZi5mYXVsdF91bnN1Y2Nlc3NmdWwgPSAx
Owo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2RiZygmeGUtPmRybSwg
IkZhdWx0IHJlc3BvbnNlOiBVbnN1Y2Nlc3NmdWwKPiA+ID4gJWRcbiIsIHJldCk7Cj4gPiA+IC3C
oMKgwqDCoMKgwqDCoH0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgd2hpbGUgKGdldF9wYWdlZmF1bHQo
cGZfcXVldWUsICZwZikpIHsKPiA+IAo+ID4gU29ycnkgbWF5YmUgSSdtIG1pc3NpbmcuLi4gZG9u
J3Qgd2Ugd2FudCB0aGlzIHRvIGJlCj4gPiB3aGlsZSghZ2V0X3BhZ2VmYXVsdCgpKQo+ID4gCj4g
Cj4gVGhhdCB3b3VsZCBiZSB0cnVlIGlmIGdldF9wYWdlZmF1bHQoKSB3YXMgc3RpbGwgaWRlbnRp
Y2FsIHRvIHRoZQo+IGN1cnJlbnQKPiBjb2RlIGluIGRybS14ZS1uZXh0Li4uLsKgIGJ1dCBpdCdz
IGxlc3MgcmVhZGFibGUgdGhhdCB3YXkuCj4gU28gSSBjaGFuZ2VkIGl0LiBnZXRfcGFnZWZhdWx0
KCkgbm93IHJldHVybnMgdHJ1ZSBpZiBpdCBkZXF1ZXVlZAo+IGEgd29yayBpdGVtLsKgIEFuZCBm
YWxzZSBpZiBpdCBkaWQgbm90Lgo+IAo+IE1ha2Ugc2Vuc2Ugbm93Pwo+IAo+IAo+ID4gPwo+ID4g
Cj4gPiAtU3R1YXJ0Cj4gPiAKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dCA9IGhhbmRsZV9wYWdlZmF1bHQoZ3QsICZwZik7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAodW5saWtlbHkocmV0KSkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByaW50X3BhZ2VmYXVsdCh4ZSwgJnBmKTsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZi5mYXVs
dF91bnN1Y2Nlc3NmdWwgPSAxOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRybV9kYmcoJnhlLT5kcm0sICJGYXVsdCByZXNwb25zZToKPiA+ID4g
VW5zdWNjZXNzZnVsICVkXG4iLCByZXQpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfQo+ID4gPiDCoCAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmVwbHkuZHcwID0gRklFTERf
UFJFUChQRlJfVkFMSUQsIDEpIHwKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oEZJRUxEX1BSRVAoUEZSX1NVQ0NFU1MsIHBmLmZhdWx0X3Vuc3VjY2Vzc2Z1bCkgfAo+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfUkVQTFksIFBGUl9B
Q0NFU1MpIHwKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxEX1BSRVAo
UEZSX0RFU0NfVFlQRSwgRkFVTFRfUkVTUE9OU0VfREVTQykgfAo+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfQVNJRCwgcGYuYXNpZCk7Cj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXBseS5kdzAgPSBGSUVMRF9QUkVQKFBGUl9W
QUxJRCwgMSkgfAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoEZJRUxEX1BSRVAoUEZSX1NVQ0NFU1MsCj4gPiA+IHBmLmZhdWx0X3Vuc3VjY2Vzc2Z1
bCkgfAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oEZJRUxEX1BSRVAoUEZSX1JFUExZLCBQRlJfQUNDRVNTKSB8Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfREVTQ19UWVBF
LAo+ID4gPiBGQVVMVF9SRVNQT05TRV9ERVNDKSB8Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfQVNJRCwgcGYuYXNpZCk7
Cj4gPiA+IMKgIAo+ID4gPiAtwqDCoMKgwqDCoMKgwqByZXBseS5kdzEgPSBGSUVMRF9QUkVQKFBG
Ul9WRklELCBwZi52ZmlkKSB8Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBG
SUVMRF9QUkVQKFBGUl9FTkdfSU5TVEFOQ0UsIHBmLmVuZ2luZV9pbnN0YW5jZSkKPiA+ID4gfAo+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfRU5HX0NM
QVNTLCBwZi5lbmdpbmVfY2xhc3MpIHwKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoEZJRUxEX1BSRVAoUEZSX1BEQVRBLCBwZi5wZGF0YSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXBseS5kdzEgPSBGSUVMRF9QUkVQKFBGUl9WRklELCBwZi52Zmlk
KSB8Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
RklFTERfUFJFUChQRlJfRU5HX0lOU1RBTkNFLAo+ID4gPiBwZi5lbmdpbmVfaW5zdGFuY2UpIHwK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBGSUVM
RF9QUkVQKFBGUl9FTkdfQ0xBU1MsCj4gPiA+IHBmLmVuZ2luZV9jbGFzcykgfAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxEX1BSRVAoUEZS
X1BEQVRBLCBwZi5wZGF0YSk7Cj4gPiA+IMKgIAo+ID4gPiAtwqDCoMKgwqDCoMKgwqBzZW5kX3Bh
Z2VmYXVsdF9yZXBseSgmZ3QtPnVjLmd1YywgJnJlcGx5KTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNlbmRfcGFnZWZhdWx0X3JlcGx5KCZndC0+dWMuZ3VjLCAmcmVwbHkp
Owo+ID4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiA+IMKgwqB9Cj4gPiA+IMKgIAo+ID4gPiDCoMKg
c3RhdGljIHZvaWQgYWNjX3F1ZXVlX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncpOwo+
ID4gPiBAQCAtNTQ0LDEwICs1NDEsMTAgQEAgc3RhdGljIGludCBoYW5kbGVfYWNjKHN0cnVjdCB4
ZV9ndCAqZ3QsCj4gPiA+IHN0cnVjdAo+ID4gPiBhY2MgKmFjYykKPiA+ID4gwqAgCj4gPiA+IMKg
wqAjZGVmaW5lIEFDQ19NU0dfTEVOX0RXwqDCoMKgwqDCoMKgwqAgNAo+ID4gPiDCoCAKPiA+ID4g
LXN0YXRpYyBpbnQgZ2V0X2FjYyhzdHJ1Y3QgYWNjX3F1ZXVlICphY2NfcXVldWUsIHN0cnVjdCBh
Y2MgKmFjYykKPiA+ID4gK3N0YXRpYyBib29sIGdldF9hY2Moc3RydWN0IGFjY19xdWV1ZSAqYWNj
X3F1ZXVlLCBzdHJ1Y3QgYWNjCj4gPiA+ICphY2MpCj4gPiA+IMKgwqB7Cj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoGNvbnN0IHN0cnVjdCB4ZV9ndWNfYWNjX2Rlc2MgKmRlc2M7Cj4gPiA+IC3CoMKg
wqDCoMKgwqDCoGludCByZXQgPSAwOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBib29sIHJldCA9IGZh
bHNlOwo+ID4gPiDCoCAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrKCZhY2NfcXVl
dWUtPmxvY2spOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoYWNjX3F1ZXVlLT5oZWFkICE9
IGFjY19xdWV1ZS0+dGFpbCkgewo+ID4gPiBAQCAtNTY3LDggKzU2NCw3IEBAIHN0YXRpYyBpbnQg
Z2V0X2FjYyhzdHJ1Y3QgYWNjX3F1ZXVlCj4gPiA+ICphY2NfcXVldWUsCj4gPiA+IHN0cnVjdCBh
Y2MgKmFjYykKPiA+ID4gwqAgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBhY2NfcXVldWUtPmhlYWQgPSAoYWNjX3F1ZXVlLT5oZWFkICsKPiA+ID4gQUNDX01TR19MRU5f
RFcpCj4gPiA+ICUKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUNDX1FVRVVFX05VTV9EVzsKPiA+ID4gLcKg
wqDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldCA9IC0xOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gdHJ1
ZTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzcGlu
X3VubG9jaygmYWNjX3F1ZXVlLT5sb2NrKTsKPiA+ID4gwqAgCj4gPiA+IEBAIC01ODMsMTQgKzU3
OSwxMiBAQCBzdGF0aWMgdm9pZCBhY2NfcXVldWVfd29ya19mdW5jKHN0cnVjdAo+ID4gPiB3b3Jr
X3N0cnVjdCAqdykKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGFjYyBhY2MgPSB7fTsK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiA+ID4gwqAgCj4gPiA+IC3CoMKgwqDC
oMKgwqDCoHJldCA9IGdldF9hY2MoYWNjX3F1ZXVlLCAmYWNjKTsKPiA+ID4gLcKgwqDCoMKgwqDC
oMKgaWYgKHJldCkKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsK
PiA+ID4gLQo+ID4gPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBoYW5kbGVfYWNjKGd0LCAmYWNjKTsK
PiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KHJldCkpIHsKPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByaW50X2FjYyh4ZSwgJmFjYyk7Cj4gPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fd2FybigmeGUtPmRybSwgIkFDQzogVW5zdWNjZXNz
ZnVsICVkXG4iLAo+ID4gPiByZXQpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB3aGlsZSAoZ2V0X2Fj
YyhhY2NfcXVldWUsICZhY2MpKSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXQgPSBoYW5kbGVfYWNjKGd0LCAmYWNjKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmICh1bmxpa2VseShyZXQpKSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRfYWNjKHhlLCAmYWNjKTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fd2FybigmeGUt
PmRybSwgIkFDQzogVW5zdWNjZXNzZnVsCj4gPiA+ICVkXG4iLAo+ID4gPiByZXQpOwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqB9
Cj4gPiA+IMKgwqB9Cj4gPiA+IMKgIAo+ID4gCgo=
