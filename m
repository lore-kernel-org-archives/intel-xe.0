Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEB6C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 21:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC110E031;
	Thu,  2 Nov 2023 21:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4E010E031
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698959798; x=1730495798;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Nbl9vZ0tJIE5qUa8zZCaTpGosFWNiBBrFx7YgPpxG/8=;
 b=CydZbqItKB9pJU+EZVpQlOFYEF7eEM7nVxgODwss/vq+IxHDCFVg7dhG
 Dq0bfXSre/yuet7VnDtbYq77nkHBV5JIs8D8G+Kr2cgV5U8dMqhFTaMiz
 4kzhx1zY+9mB7ht+jepQfp/cD6GGGsBKP7VuwFljkTlT3VKvG9oS6swKG
 jKZgOFVgt1/soiz2Y7KcSTVWTocXUWftvwluqd6THGZ/D0qydJ9oqlxSc
 MJSQ13Q81L9PNI+vW3ga706isUUo1LmGkL5iIH6kJDKO+tueAwuvje9/i
 anKjNrIJ2v+pyAa8R4F4DVfoHOYyiMkm+BJelhxdjHtG6GLhinpFtXsGw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368170876"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="368170876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 14:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="796396396"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="796396396"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 14:16:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 14:16:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 14:16:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 14:16:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwgNwe4CboZ1+7fsu1qlDcpjyXoDo1XaUBWQbWEhs2m5U/DHzfS0dopjmOJKf7NdiPE4o8iVZBcVwc8t2ml8znEBPD0q2OM9boy5ptRJjdZl9x6v1A0zJbHgDMUf1Mcap4RB/NC1q6N9eLL7nxTjHgwj/DkGR7kLq2F94z898gGLx8ng2cYiqwkP9RgllTObKhonhy1Ln79ZCAWnipoQNp3vbHAZmYAGqYFkh08AhJ3ojN7UURgCn6vdSbJSsZA+At37KlQjQstk46a9O2f+13MZ9xjW2F/4B85B1BjsfjvuJULLTjzKPlkTa8DIA8V3wBlOZLRejK6o3A20nNLX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbl9vZ0tJIE5qUa8zZCaTpGosFWNiBBrFx7YgPpxG/8=;
 b=DRdc+BSjc3Wb0dqpVfHEgvL0VKeVCvBMHrFK3h4fayGWhpsZkvghOUIISSTLgpxsdMUzM2FkehHQPNXdwP8euXgfAouQyD/osooHhOvkFkT3wvLF2HzYU2RBCIrOqzgOdx4J9qr7gtLHbpoPKpDEH1mUFwxmbqKYgtmuxYqTaGu3rCTVpRNO3OrTrew0uR+EY+7yK5e3hhlNHHg6Zp9pE8L0nyB3kmi3XpQTtYyd/clD/ZotH57sL2N1GQm7anFO9XjKEIpPjtr1y+lNqr/fzEfgJYwzVB54nGpoem/kD499rDsvGya2lAnbk5A4bOzNpBIszbCZVjgFzyXeFDnRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 21:16:32 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 21:16:32 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>, "yu.bruce.chang@intel.com"
 <yu.bruce.chang@intel.com>
Thread-Topic: [PATCH] drm/xe: Enable scratch page when page fault is enabled
Thread-Index: AQHZ24nC4YyM49zYNUGuJQ4+kh3yxrAFICYAgGLMeAA=
Date: Thu, 2 Nov 2023 21:16:31 +0000
Message-ID: <63e06faa698e8a545bc3be8d4d8d1806a9c14147.camel@intel.com>
References: <20230830213403.16127-1-yu.bruce.chang@intel.com>
 <b180dc20-c2a4-b38d-654b-5a47a1fa2d62@intel.com>
In-Reply-To: <b180dc20-c2a4-b38d-654b-5a47a1fa2d62@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB7070:EE_
x-ms-office365-filtering-correlation-id: 00d9ea89-adea-447d-6c77-08dbdbe8fc70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GATmnnAn71sQqgLCs4ppGbQ6qz3KsmA8EYifphOr054hl34VhWl88VWII7BvcMQS39JhXCQr/zL8ANUZeEAQmwWW6PS/E3OLYSBAMdJcAdOCsM6p2WbdOxdeaDcgr6SiJptQ5rDsOG8VSZT5YlmnoV/uH6kI1JlkCP5b2QsKdXyNNIedZIByv0cnyhfRemo8p1iANC6j6jCrLkZF3/jRN5Xq9xRd2WT5bhUDT0Umx1Zh2D+vOpcb9KGIjgU5QOVycb0YXacl9rX/2/gz+EbGVm2+lHdURvQjH1IYGH9oOtKQj7/figo1QTLAtLQ6SAc+2fWPxS3hC9Bufy1M8vva/jBwzZQI25gtzngQIP2iTrAG9UqyTXB1Pt+haSY/+XN6gDQP/KB5G66YrYaUkJHzAjc+q3J/zXNjot5YFKAsHpt4kUtPdoAqP2lhAkT+GII81QpOYYqcYZcGQxetmKrlPAwfQ7xp7DxRmD/y0JHgur1Z2Y/gsozo0XlJ0gNWEGjCJF0lI4n/b5YZJQi+ZMfUBLbYsua5naQlV8HWkQvXbqOCNpJXhRG1KWNL2V3Xjtl+VcQBloxsGif0BFcKxKoCISqsXAGxgOKVwJAe7MTYayEwWYS9Ub6F57FMpuSPT2F9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(8676002)(2906002)(4326008)(8936002)(478600001)(41300700001)(71200400001)(6486002)(64756008)(54906003)(66556008)(110136005)(66476007)(66446008)(6636002)(76116006)(91956017)(66946007)(5660300002)(316002)(66899024)(53546011)(2616005)(107886003)(26005)(83380400001)(38070700009)(82960400001)(6512007)(86362001)(122000001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDVVcW9hcSs5VFpOZkFlYmhvT1ZQMzhoTWxhd3BUTGx6K0ZmNi9xRjZQZEg4?=
 =?utf-8?B?VlpKZVFXRzJvRFpVb25PYTArVjdVYjA4cEhaY1poMmRYYnhOekZsTlFEZEx1?=
 =?utf-8?B?MDZwRDNpdGt2dC9lYkZtUHVWSWNURk5taTZVWmNMalZDUHZGdUJnUEFuTStC?=
 =?utf-8?B?cVF2K3AvbmhqZklPVkhUQVBGOUI0SXZSTFNTMG9mdXFxMHdZblB3MG8zQzhW?=
 =?utf-8?B?a3UvZ1ZLRVI3NjdVMTRwUFBJd1RIdGRKZ1FpMzBZRXFqRlJ0Zzh1cE03MkZv?=
 =?utf-8?B?UFZ0VzBqeE9FNTBUZnBaK2RJdGRUdmNkNGJtSzEvRTRQUXhYQkxTMFpsbmlC?=
 =?utf-8?B?S1FwQ2k1RVNZNTk2c3MwZDRaK3ArbXhmQ2F4dERwZlh3Y0UvMEk2TFNMT28r?=
 =?utf-8?B?N3pWMFhNM09ieUJTdUhUZFAvNVdGM29WclZLRzl6SlJveWFtdzlON2FKaWFo?=
 =?utf-8?B?cEtCRFF3KzdZTGpVWnUvRlh4Z1JMb05ibDRUNG9hNXlNTmFibkdWY29zYXky?=
 =?utf-8?B?R2RMc1NGSWZFLzBOYlUzUk9YY1pzclNLWXovbEh1cEcxZnVBaUVTNDREMGQ5?=
 =?utf-8?B?QTZEZTVZbVlQMWo5QnI3WWliK3g1U2VjMER5cXlFTEZiRFNvYktLM0xmNWRZ?=
 =?utf-8?B?WndOZm9SaTg5TUhONkZJZGRtMjJPSWtQTWdGeTBnbHhqeDdkSTdtb1AzVjdt?=
 =?utf-8?B?YmltV3FWQmt1Z1lUR3ZId01ldWRtTjhuVVEwMnl6Rm1qbk9YbXh4b01lOG1p?=
 =?utf-8?B?eWFvUFZodXFVZmE0NWh4VW9idEdvQUJJOFptSjVpRVEyOUU1MExuclA5RnN3?=
 =?utf-8?B?cDFFYm9mLzQ3UmVPYkZYRnlTV2N1Z1BuMFZwZy9zejRUWStKTEFmYjk0c1R1?=
 =?utf-8?B?VmlPNEZ6c0gxTmt1Y2wwM2JDUkkvU2dIUHQ0YWR3YVVHLzJ2citDSlhHanh4?=
 =?utf-8?B?Q21yelBoZDI0SHNDOGxwNXZ6amFWRThZMGFIdlV3bGhFVlNiSjVSeFJGV1E3?=
 =?utf-8?B?WnVLVVVkM3BBZ1hKMk45Q25ySi9idXhpUnVNTGc2OHUwMHJZb0pTbC84N2F0?=
 =?utf-8?B?ZW1ZMjE0eERjMTl5ZEw2OHZ4TzJIaUwxSWFMMldwQkgrNVZNaG1WcWk5aUpr?=
 =?utf-8?B?QjV3aW43b1dnSFQ2QmlMUkw5bEp1bEtIdjI2enVsV09ZbndZdzJXY0gzYXhQ?=
 =?utf-8?B?K0xUQmVNZnVVanNHVFhLNXJZQnA4R05jelByTVRuMHFIV0VjRFFLdmI0WHV0?=
 =?utf-8?B?L1d6UWVOdUhwL1ZtNFUxV24yU0svVmNYRWpYeTNEbVM2cHM2ZGcxVHJEMi92?=
 =?utf-8?B?c21RSHM2Y05DRVpIbmZpV0o5NWtRNk1nTEVYRy82UUZmNStQTjI0cU1HZmJX?=
 =?utf-8?B?bWdlRndjcXlxOG5qclR1bmNBalJna2hkb0t3NUxSUmJibTFjaXVydzFWbEZn?=
 =?utf-8?B?YTgrWWRiRCtQUXFxMUVFS1ZUNU5SUUtTVUxMM3FNUUVjMzZaU1NSV3U5RTJl?=
 =?utf-8?B?SmxDZXhTczl6S21mUE43dk43a2RNeGpKWjhKcWtscmdDMW5jMGVYb2hteEcy?=
 =?utf-8?B?QXUwNzBURlkwVFl6Yzhkc1k2VWo2VzVJZXBCODRJRlF5aVV5c1F1UmJFdmdz?=
 =?utf-8?B?cG5NYjJncXdad081NjdMMHdIUmdJT1JnWDQ2TmllRllFTXU0Z0lEb0NiRG9N?=
 =?utf-8?B?LzgyZnhVZ0czbk9KMGozUGQ3RzF5QzVVYVIvV3FQZ0pEcCt5aWpoQm5DUTRx?=
 =?utf-8?B?UGpxNDM5cHBjY0JrS1VVcmZjOGxVUDF4ODNHVTJvNy9XR0tzNU41VG9FOGts?=
 =?utf-8?B?NTVGWndhVXU2QUNNbjk2UVA1N3YzZlNLWWNGUDJxbmpyZXQvK1djL1BWbWUz?=
 =?utf-8?B?eUlHRzdFZUxtSm56bFZBRVFTOE5FeklTcGRsdDgzRDNMT25PMUhLWTJ5Ritw?=
 =?utf-8?B?QTgrVVpKaFdheXZqQ2RiVGZEUWFKdjBEbDM0TXFyQTc3aGh2aFhUV0Z3NzRZ?=
 =?utf-8?B?WHVsVHFNZUFTaDlDQUN6U2pOZitpR3RKNEMrZ08rRUNTMXhGS1EyMi9pMENs?=
 =?utf-8?B?ZE9WSHlQWEJFbjNDa2tQSHBWQ0kvTHg5QzdZN3dacFVjSjFpek9lcXp2UUFS?=
 =?utf-8?B?Z2NHdWNhQWF5K3hLS0kvQk02WUFBSmptUDg1ZGtONDBWelpVUUNTejVGY1hX?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B5E5B1D4C535A4F9F1814268E8552E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d9ea89-adea-447d-6c77-08dbdbe8fc70
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 21:16:31.6619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPaZRgH2oJ+M2SgTXPcnxJ5QtUWUA3vLafjtylrzUoq5EtqqlE3UpYOyvfERyzxlq+VarE8yhbtl82xtJ7dboYKH7+PBy7TUMtW1z2oPqyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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

T24gVGh1LCAyMDIzLTA4LTMxIGF0IDE3OjMxIC0wNzAwLCBXZWx0eSwgQnJpYW4gd3JvdGU6Cj4g
Cj4gCj4gT24gOC8zMC8yMDIzIDI6MzQgUE0sIENoYW5nLCBCcnVjZSB3cm90ZToKPiA+IFRoZSBQ
VkMgSFcgaGFzIGEgbGltaXRhdGlvbiB0aGF0IHRoZSBwYWdlIGZhdWx0IGR1ZSB0byBpbnZhbGlk
Cj4gPiBhY2Nlc3MKPiA+IHdpbGwgaGFsdCB0aGUgY29ycmVzcG9uZGluZyBFVXMuIFNvLCBpbiBv
cmRlciB0byBhY3RpdmF0ZSB0aGUKPiA+IGRlYnVnZ2VyLAo+ID4ga21kIG5lZWRzIHRvIHNldHVw
IHRoZSBzY3JhdGNoIHBhZ2VzIHRvIHVuaGFsdCB0aGUgRVVzLgo+ID4gCj4gPiBUaGlzIGZlYXR1
cmUgY2FuIG9ubHkgYmUgZW5hYmxlZCBpZiBzY3JhdGNoIGZsYWcgaXMgc2V0IHBlciBWTS4gU28s
Cj4gPiBvbmNlCj4gPiBFVSBkZWJ1Z2dlciBpcyBydW5uaW5nLCB0aGUgZGVidWdnZXIgdW1kIHdp
bGwgc2V0IHRoZSBzY3JhdGNoIGZsYWcsCj4gPiBvdGhlcndpc2UsIHRoaXMgZmxhZyBzaG91bGQg
bm90IGJlIHNldC4gU28sIGluIHJlZ3VsYXIgcnVuLCB0aGlzCj4gPiBmZWF0dXJlCj4gPiB3aWxs
IG5vdCBiZSBhY3RpdmF0ZWQuCj4gPiAKPiA+IFRoZSBpZGVhIGlzIHRvIGJpbmQgYSBzY3JhdGNo
IHZtYSBpZiB0aGUgcGFnZSBmYXVsdCBpcyBmcm9tIGFuCj4gPiBpbnZhbGlkIGFjY2Vzcy4gVGhp
cyBwYXRjaCBpcyB0YWtpbmcgYWR2YW50YWdlIG9mIG51bGwgcHRlLgo+ID4gQWZ0ZXIgdGhlIGJp
bmQsIHRoZSB1c2VyIGFwcCBjYW4gY29udGludWUgdG8gcnVuIHdpdGhvdXQgY2F1c2luZyBhCj4g
PiBmYXRhbCBmYWlsdXJlIG9yIHJlc2V0IGFuZCBzdG9wLgo+ID4gCj4gPiBJbiBjYXNlIHRoZSBh
cHAgd2lsbCBiaW5kIHRoaXMgc2NyYXRjaCB2bWEgdG8gYSB2YWxpZCBhZGRyZXNzLAo+ID4gR1BV
VkEKPiA+IGhhbmRsZXMgYWxsIG9mIHRoaXMgKGUuZy4gaXQgd2lsbCBjcmVhdGUgb3BzIHRvIHVu
YmluZCB0aGUgb2xkCj4gPiBWTUEsIGJpbmQgdGhlIG5ldyBvbmUpLgo+ID4gCj4gPiBUaGlzIHBh
dGNoIG9ubHkga2lja3MgaW4gd2hlbiB0aGVyZSBpcyBhIGZhaWx1cmUgZm9yIGJvdGggcGFnZQo+
ID4gZmF1bHQKPiA+IGFuZCBiaW5kLCBzbyBpdCBzaG91bGQgaGF2ZSBubyBpbXBhY3QgdG8gcmVn
dWxhciBjb2RlIHBhdGguIE9uCj4gPiBhbm90aGVyIGhhbmQsIGl0IHVzZXMgYWN0dWFsIHBhZ2Ug
dGFibGVzIGluc3RlYWQgb2Ygc3BlY2lhbCBzY3JhdGNoCj4gPiBwYWdlIHRhYmxlcywgc28gaXQg
bWF5IG5vdCByZXF1aXJlIHRvIGludmFsaWRhdGUgVExCcyB3aGVuIGRvaW5nCj4gPiB1bmJpbmQg
aWYgYWxsIHVwcGVyIGxheWVyIHBhZ2UgdGFibGVzIGFyZSBzdGlsbCBiZWluZyB1c2VkLgo+ID4g
Cj4gPiB0ZXN0ZWQgb24gbmV3IHNjcmF0Y2ggaWd0IHRlc3RzIHdoaWNoIHdpbGwgYmUgc2VudCBv
dXQgZm9yIHJldmlldy4KPiA+IAo+ID4gdjI6IHBlciBNYXR0J3Mgc3VnZ2VzdGlvbiwgcmVtb3Zl
IHRoZSBzY3JhdGNoIHBhZ2UgdW5iaW5kLgo+ID4gdjM6IGNvcnJlY3QgZXJyb3IgaGFuZGxpbmdz
Lgo+IAo+IExvb2tzIGdvb2QgdG8gbWUuCj4gUmV2aWV3ZWQtYnk6IEJyaWFuIFdlbHR5IDxicmlh
bi53ZWx0eUBpbnRlbC5jb20+Cj4gCj4gSSBrbm93IFN0dWFydCBoYWQgc29tZSBtaXMtZ2l2aW5n
cyBhYm91dCBtZXJnaW5nIGFoZWFkIG9mIEVVIGRlYnVnZ2VyCj4gc3VwcG9ydC7CoCBCdXQgeW91
IGFyZSBub3QgYWRkaW5nIHRoZSBzY3JhdGNoIGZlYXR1cmUgcGVyIHNlLCBpdCdzIAo+IGFscmVh
ZHkgaW4gdGhlIHVBUEkuwqAgWW91IGFyZSBqdXN0IGV4dGVuZGluZyBpdCB0byBzdXBwb3J0IGZh
dWx0Cj4gbW9kZS4KPiBQYXRjaCBpcyBzbWFsbCwgc28gdG8gbWUsIHRoZXJlJ3MgZW5vdWdoIGp1
c3RpZmljYXRpb24gdG8gZ28gYWhlYWQKPiBhbmQgZ2V0IHRoaXMgbWVyZ2VkIG5vdy4KClJlYWxs
eSBzb3JyeSBJIG1pc3NlZCB5b3VyIHJlcGx5IHVudGlsIG5vdyBCcmlhbiEKCk15IG1haW4gY29u
Y2VybiBoZXJlIGlzIGFkZGluZyBzb21ldGhpbmcgdGhhdCB3b24ndCBiZSB1c2VkIHJpZ2h0IGF3
YXkuCklkZWFsbHkgdGhlIEVVIGRlYnVnIGZlYXR1cmUgc2hvdWxkIGF2YWlsYWJsZSB3aGVuIHdl
IG1lcmdlIHRoaXMuCgpJIGtub3cgdGhhdCBpcyBhY3RpdmVseSBiZWluZyB3b3JrZWQgdGhvdWdo
IHNvIEknbSBvayB3aXRoIGp1c3QgaGF2aW5nCmEgcXVpY2sgbm90ZSBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UuCgpBY2tlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNv
bT4KCj4gCj4gCj4gPiAKPiA+IENjOiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPgo+ID4g
Q2M6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+Cj4gPiBDYzogTmlyYW5qYW5h
IFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4g
PiBDYzogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KPiA+IENjOiBN
YXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gwqAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jIHzCoCA5ICsrKysrKystLQo+ID4gwqAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMwCj4gPiAr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrCj4gPiDCoCAzIGZpbGVzIGNoYW5nZWQs
IDM0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiBpbmRleCBiNmY3ODFiM2Q5ZDcuLmJkZDg0YjEwOWU5
ZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiBAQCAtMTM3
LDggKzEzNywxMyBAQCBzdGF0aWMgaW50IGhhbmRsZV9wYWdlZmF1bHQoc3RydWN0IHhlX2d0ICpn
dCwKPiA+IHN0cnVjdCBwYWdlZmF1bHQgKnBmKQo+ID4gwqDCoMKgwqDCoMKgwqDCoHdyaXRlX2xv
Y2tlZCA9IHRydWU7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdm1hID0gbG9va3VwX3ZtYSh2bSwgcGYt
PnBhZ2VfYWRkcik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCF2bWEpIHsKPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRUlOVkFMOwo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGdvdG8gdW5sb2NrX3ZtOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmICh2bS0+ZmxhZ3MgJiBYRV9WTV9GTEFHX1NDUkFUQ0hfUEFHRSkKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdm1hID0geGVfdm1f
Y3JlYXRlX3NjcmF0Y2hfdm1hKHZtLCBwZi0KPiA+ID5wYWdlX2FkZHIpOwo+ID4gKwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlJfT1JfTlVMTCh2bWEpKSB7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1F
SU5WQUw7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGdvdG8gdW5sb2NrX3ZtOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+
IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlX3Zt
YV9pc191c2VycHRyKHZtYSkgfHwKPiA+ICF4ZV92bWFfdXNlcnB0cl9jaGVja19yZXBpbih2bWEp
KSB7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiA+IGluZGV4IDM4OWFjNWJhOGRkZi4uNThlMDMwOTU1
NmEwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gPiBAQCAtMTI2Miw3ICsxMjYyLDggQEAgc3Ry
dWN0IHhlX3ZtICp4ZV92bV9jcmVhdGUoc3RydWN0IHhlX2RldmljZQo+ID4gKnhlLCB1MzIgZmxh
Z3MpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKgwqDC
oMKgwqB9Cj4gPiDCoCAKPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChmbGFncyAmIFhFX1ZNX0ZMQUdf
U0NSQVRDSF9QQUdFKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoZmxhZ3MgJiBYRV9WTV9GTEFH
X1NDUkFUQ0hfUEFHRSAmJgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgICghKGZsYWdzICYgWEVf
Vk1fRkxBR19GQVVMVF9NT0RFKSkpIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZm9yX2VhY2hfdGlsZSh0aWxlLCB4ZSwgaWQpIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghdm0tPnB0X3Jvb3RbaWRdKQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGNvbnRpbnVlOwo+ID4gQEAgLTE5OTgsMTAgKzE5OTksNiBAQCBpbnQgeGVfdm1fY3JlYXRl
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlCj4gPiAqZGV2LCB2b2lkICpkYXRhLAo+ID4gwqDCoMKg
wqDCoMKgwqDCoGlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmZsYWdzICYKPiA+IH5BTExfRFJN
X1hFX1ZNX0NSRUFURV9GTEFHUykpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAtRUlOVkFMOwo+ID4gwqAgCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoWEVfSU9DVExf
REJHKHhlLCBhcmdzLT5mbGFncyAmCj4gPiBEUk1fWEVfVk1fQ1JFQVRFX1NDUkFUQ0hfUEFHRSAm
Jgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXJn
cy0+ZmxhZ3MgJgo+ID4gRFJNX1hFX1ZNX0NSRUFURV9GQVVMVF9NT0RFKSkKPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+IC0KPiA+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmCj4gPiBEUk1fWEVfVk1f
Q1JFQVRFX0NPTVBVVEVfTU9ERSAmJgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFyZ3MtPmZsYWdzICYKPiA+IERSTV9YRV9WTV9DUkVBVEVfRkFV
TFRfTU9ERSkpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlO
VkFMOwo+ID4gQEAgLTI3ODMsNiArMjc4MCwyOSBAQCBzdGF0aWMgaW50IF9feGVfdm1hX29wX2V4
ZWN1dGUoc3RydWN0IHhlX3ZtCj4gPiAqdm0sIHN0cnVjdCB4ZV92bWEgKnZtYSwKPiA+IMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+ID4gwqAgfQo+ID4gwqAgCj4gPiArc3RydWN0IHhlX3Zt
YSAqeGVfdm1fY3JlYXRlX3NjcmF0Y2hfdm1hKHN0cnVjdCB4ZV92bSAqdm0sIHU2NAo+ID4gYWRk
cikKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdm1hICp2bWE7Cj4gPiArwqDC
oMKgwqDCoMKgwqBpbnQgZXJyOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlX3ZtX2lz
X2Nsb3NlZF9vcl9iYW5uZWQodm0pKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBFUlJfUFRSKC1FTk9FTlQpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgdm1hID0g
eGVfdm1hX2NyZWF0ZSh2bSwgTlVMTCwgMCwgYWRkciwgYWRkciArIFNaXzY0SyAtIDEsCj4gPiBm
YWxzZSwgdHJ1ZSwgMCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSX09SX05VTEwodm1h
KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdm1hOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgZXJyID0geGVfdm1faW5zZXJ0X3ZtYSh2bSwgdm1hKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV92bWFfZGVzdHJveV9sYXRlKHZtYSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIEVSUl9QVFIoZXJyKTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqDCoC8qIGZhdWx0IHdpbGwgaGFuZGxlIHRoZSBiaW5kICovCj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqByZXR1cm4gdm1hOwo+ID4gK30KPiA+ICsKPiA+IMKgIHN0YXRpYyBp
bnQgeGVfdm1hX29wX2V4ZWN1dGUoc3RydWN0IHhlX3ZtICp2bSwgc3RydWN0IHhlX3ZtYV9vcAo+
ID4gKm9wKQo+ID4gwqAgewo+ID4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQgPSAwOwo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5oCj4gPiBpbmRleCA2ZGU2ZTNlZGIyNGEuLmRkZDM4NzMzM2NkMiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uaAo+ID4gQEAgLTIxMiw2ICsyMTIsOCBAQCBpbnQgeGVfdm1hX3VzZXJw
dHJfcGluX3BhZ2VzKHN0cnVjdCB4ZV92bWEKPiA+ICp2bWEpOwo+ID4gwqAgCj4gPiDCoCBpbnQg
eGVfdm1hX3VzZXJwdHJfY2hlY2tfcmVwaW4oc3RydWN0IHhlX3ZtYSAqdm1hKTsKPiA+IMKgIAo+
ID4gK3N0cnVjdCB4ZV92bWEgKnhlX3ZtX2NyZWF0ZV9zY3JhdGNoX3ZtYShzdHJ1Y3QgeGVfdm0g
KnZtLCB1NjQKPiA+IGFkZHIpOwo+ID4gKwo+ID4gwqAgLyoKPiA+IMKgwqAgKiBYRV9PTlNUQUNL
X1RWIGlzIHVzZWQgdG8gc2l6ZSB0aGUgdHZfb25zdGFjayBhcnJheSB0aGF0IGlzCj4gPiBpbnB1
dAo+ID4gwqDCoCAqIHRvIHhlX3ZtX2xvY2tfZG1hX3Jlc3YoKSBhbmQgeGVfdm1fdW5sb2NrX2Rt
YV9yZXN2KCkuCgo=
