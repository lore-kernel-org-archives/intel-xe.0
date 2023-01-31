Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D117EC636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 13:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB57E10E02D;
	Tue, 31 Jan 2023 13:50:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493DF10E2BF
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675173006; x=1706709006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wFbI8J33TiyM1MZ/D7zcdDt+dSVAdTx75a2BseZjH2k=;
 b=O2LvLElaEQCRm3IPy5X/uR58DnMoaFbM5hO7qEVKV6z7YBbUiJlGHwyz
 xUVB3UH9perTq7Cg9tnyPWqocRJPiosDoFmoUuq0HfexbJ6WvKfZG3EtX
 WMjkLQNIFuqjWrIShG+jrefg1Iq8DWbRDucVO1/Y511gYuhbwHAsoGlCR
 1SeITacIO4CBEaV6nvYAixv+6LMDi/di6gsxt/TuGFHsGOkXHQQAzGnBD
 YxGCOJkWiYzoBh/L/pq4O8neG9fcmPuv339FGrecLpeSthUVhETUyRM6M
 YJGvwMTtmJaq8sOpnRQt9MynDY5XTibR0NG3sY2oIx+6fJojd/1ldNkSF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315803523"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="315803523"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 05:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641980348"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="641980348"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 31 Jan 2023 05:50:05 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 05:50:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 05:50:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 05:50:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDGLFcuakoDhpKxfbLYun9Qei4qqv4L/Sg4CiJeOq63ofGcukK0zFlLxrGcLmymMc6pgDm+p4lju37utvA81KMMJyTRs2mFb5r1kUoIVk6cO2Y5CQ7QRNrlY4ATVZ9I2k/ru9K7dWxY0uLFIfs9LcyVX90uWc2DQLCTsY81qV/sVAlyhp/CA6aeA3X6t+6KKQgxEAS6e+h8+LZK6ekkPLWZDyPTZZ8tM0meKAIyeaHq3XSVsQak9Is8Ea2apyzNwtLMdsSRerHmmRyv9ZpVupj2JkQIUeVOkfT02wGi0OY0bmt/Xe5fid3uVJ49l9Q28ZC0t9zNh4r5OU+p1RAKVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFbI8J33TiyM1MZ/D7zcdDt+dSVAdTx75a2BseZjH2k=;
 b=d/cGHzHa/XCmzZNxFsFTWBFLMhNSRGYtDcPd70UUxfy5D3mnlZ4LwomnToOD1UUOvOBjg75idy18A0S3f6PHm3yyFDLwfN4/62KTn07FIkUAbglk8A48D6s1gzKoN6qqJSle2oLDEfk1Z6moNh2Wh1/Y+MSK2W2NUNsQnN5C4fS3DJG2s/SPPeCqjINhxm5COi2kGyPKkMoUglue/i860AAnhW8qUJG+jgBLLzJlyKUs6hBNJ2bIIWw0oX6uYB+RjANDr9BZ13FDKpZRYjuIEtJuYGBHvyABjUOL7BAt5Boo6H5j24zfYT3KBiMEnJKaFSSQAT/KpIz4UIm3KCXn8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Tue, 31 Jan 2023 13:50:02 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::a11b:8f88:32ed:1828]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::a11b:8f88:32ed:1828%11]) with mapi id 15.20.6043.036; Tue, 31 Jan
 2023 13:50:02 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
Thread-Index: AQHZNMZgoxtTsMO+yE6am6PfoCoCAK64IHQAgABr0IA=
Date: Tue, 31 Jan 2023 13:50:02 +0000
Message-ID: <116ea3da679ea8a34379fb83e8edc6842ae73419.camel@intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <87o7qf2mll.fsf@intel.com>
In-Reply-To: <87o7qf2mll.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|DM8PR11MB5653:EE_
x-ms-office365-filtering-correlation-id: 813a2410-4999-4e5a-f648-08db03920d18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IfKvt09wrW1BoxVwi6mVbj7MP9MZX/MtqLmA9kPT8unr08BWIB8QeGlUxamHoWmz0YfCbYLhJXjCJGAnVLDGuo8r9nOGSzHdlMkbnWnLq/AzYWJ1HKJRVIJA7rMHMgM5LgocLz6Smf1WyaEkKse7kOGlcavbOLErbWxM9haZ4BYNuzjvlqG7HJRZmSdv+YL1KYayJJ3yz7x4i0ueT57DmO9FxhFgz0mp4Ele1axvBpQECqiN1xnmx12Jo+GH4D91vqdPYpejCRyf10qXe5duyta1PFdGAzlVOxsIz5TEXlRd7cRN/GW6/o7IlHSmfqoObRermKccs3REZyqdgF5JApr8hmmr/a9kqN544x0xnxSXYwIpOtUYkLeybc165NOQ8P0Wjxgw/FGgjNpdSUtjtACVQXfnEAeZVwq51aC0NUPUQA6S4FFZ4V67mO68olRSLasIJEdoi/o2nGu3iSFjgiHttBSXwyy6lx7B8M45djwVDSTLRM2Xa7PoV621sSYOIZbB4hn10DjqFUiyutWTzkbbxWCu9SLEG7WfiSPHwQNne1FJdBCZw27rl1gPtXIlzSQ1UcCTZRRxbkykyk4bFv/y33oVQ9aMY2YU1KJkT7kgYRHQudcK7Jpf8fVW0+2/B9b6hrgJ+94KCjCGAC5bca/xqHNr4H3Rt4dRdxKHs40AQV4lpLYDi/fAvJP5TPRoGFqWs4fDBjIGEyBFFICV6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(82960400001)(86362001)(110136005)(38070700005)(5660300002)(6512007)(6506007)(36756003)(186003)(26005)(2616005)(122000001)(316002)(2906002)(38100700002)(83380400001)(66556008)(66476007)(64756008)(66446008)(6486002)(71200400001)(8676002)(478600001)(8936002)(76116006)(66946007)(91956017)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXN1aVFNZ2RNQXlSdkREMEh4YWxEKzJDVDZocXlMd0NXcCtjdG1Wamg0YlY5?=
 =?utf-8?B?RUZrb2xaSnpsdXhLTSsva2RlRFdNNFhQT3RJQWRxODlMYjFIS0pZdUJUdjJB?=
 =?utf-8?B?OVc1M3hVbGwxTjJBcWVhVC90dFdlUlJ0Z3A1eUlhR1Iwa2FCSURMWWFuRktn?=
 =?utf-8?B?TUhDc2FlajBpOElidGY1NStiMkthN3ZBa2hJRnFtdXRiam5LVDI3R09ja0tN?=
 =?utf-8?B?ZzVVQzBjdEZ0Z3V1UnArNmRLdW5UV3NxOGt1VEtuaFhTUUs0aUpldytBbWxh?=
 =?utf-8?B?REhqcU9nK3RwNDZZNDgxM0EwM1lwb2tiRDZaUWpiaGFrOVhkTG56YUh6djlT?=
 =?utf-8?B?Sk12UmhveDRUZG9vT2RVb3BEcmNmdHFGTFBhYkZlQll2MjJHOXBPbER3WGIx?=
 =?utf-8?B?aEs2ZU53Sk9peE1IK3NaeEhrVmMyNjlGVkZKR0lobk9kM0JMZjRTeTZkSXVZ?=
 =?utf-8?B?c2pOdFlhWUh2K2dGMWRMaU5uSndrcmdlS3lNQW1RaEllWDhCb2J5QjY5RWJN?=
 =?utf-8?B?UlhDdmlYcW81c0NNZlNYTEhaNFA1eUxhMGlBZTFzbmgxZnZXNjhkU1BuaFVo?=
 =?utf-8?B?MkFxU21lcStPTHp0KzBQTkF5MUZVMzI4ZTBianVBRFBZcWllbThNSmJVTllH?=
 =?utf-8?B?aDVQSDF5UlFNMk04VDRNbjZqb2ZrR3FNem9qMnVCd0ZYUWMzejZuUXQ5cEpX?=
 =?utf-8?B?T1hCY2VoZ3BiYURoSm1sOThLZEF4VWxBS3RmRzEwSC8rK2JIdi9BMFdkVzhv?=
 =?utf-8?B?TjdlNi9ZSHBrYnBWd0xDOFVDbmZyb2FydTltaUpuQzVFK3RYTnhFSzhNOVFq?=
 =?utf-8?B?VjVzbHNKT0tsUmtSbnljaTJpYlp2ZlZFOUdJTDNlMzM0VTM5V1NOOFRySUVN?=
 =?utf-8?B?c0tnaURzOWloUWg0Z1BkdVlkQjArbUpNODV5Wk1QdXp1bHhNVnJ2YWFTL0RB?=
 =?utf-8?B?NjI0KzAxZGdEemlac3JrSFpjbVBkNlZIeWdXTEphbFVRRjZMNnUyMzdnbmcr?=
 =?utf-8?B?b0tUVmdhYnFHZzZWbjdNRnpub3UrcllScXFGUUsrb25oYXhYUWVJMDRtd3NU?=
 =?utf-8?B?ODR1Z2dzRDdWZ2ZKbmNqbDR0UXVFK0JFOXo4YTVId2hza3BKc0wyNEU1N3RM?=
 =?utf-8?B?WUZxR25sMGhYTnBUazJwZXRyT0hKOHhCZTZxcnV1SHlHdFZoVWV6WGVvSVRM?=
 =?utf-8?B?aWU1UCtOYjl6MFN0NGx0OFVFRDNiaUl5SFpIYlBkYzNaZzFXOVI0V1VDQnRF?=
 =?utf-8?B?eWthU1ZVb0FheG1nSENJNDJQcUs5aCtjZittZXZCd1dHR3N5MHZFRVFkR1BI?=
 =?utf-8?B?VXprNGc4T3p0dVFNWlExTzhmQWg3dmo2WFlOZTRKbTZSaS96SDR1R2RXRE1n?=
 =?utf-8?B?ODgrZlNqRGpZTExvaHdhTW91b1cyQXZlcitrZEd2YlFFemR6NU9iaElMd2dz?=
 =?utf-8?B?NXhmeVYvWnpsVW5teWg0VUUxV1d3ajFzV1BoVnpMT00yMjlya245V0o0M0hC?=
 =?utf-8?B?cW00dVdHOG40OElwU1h6N2VNbVF6TlJmZllTT3RjV3B5RTl4ZXUvcXBXdHJG?=
 =?utf-8?B?VUtPRS8yWWRoSTY5WG5Wd29xL0RkM1BSMlhaT1hzaytwMjZCZzhXdEgrdSsz?=
 =?utf-8?B?YUc0Q1g5MWZVOVUxRmdIbE9yYUlYSkxMamdTNFJzaDBDek1kVjB5NWs1bldT?=
 =?utf-8?B?cC85Ty9JeXJzcTdzNnBURWpMbmsxWTlpRGFjWjFBTjdDWjJUbEozMFFwNlUr?=
 =?utf-8?B?OTNwOUkycmFoMFZYRUhJWWNxYUppSW9uS1dhWmdQLzVQaGI5T3lEdnFKTjZp?=
 =?utf-8?B?c1FzaS92OEVXUjhsd0gxTDY4SXdFZTJ5eEw3ZlZSUkdRa01nZUtHS0FJK0Iw?=
 =?utf-8?B?dTNYRHZGN2FZUFJRbTQ1UXFDV1I1elhXNW1uN0kyTDN2MGEwQ0ovdTVKcDlh?=
 =?utf-8?B?cUhqVFp5QzJCT3JVSVdzL0VpSklxWWsvOUx2QmNrUy9aV1oyQnNGczNYbWNx?=
 =?utf-8?B?RTRTZ09zNXNoaWpxVjJDWjRqd1R0c0taQmEwQUR0eW8xNlVXcE14U2pTTGUr?=
 =?utf-8?B?d1pUWkpkWGplQWd2RDEwZmZwcXRRTWZMZGpjRG9CVUtHZmVlWmRYVHZtUGl2?=
 =?utf-8?B?MkxWbkxZT1h6SElxdDJTUENkcndMUVh0U2JLdUFxTVdPVTVpWjlBUVQ0UlJ3?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26D761681BE8274D835E07FC36E3CB49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813a2410-4999-4e5a-f648-08db03920d18
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 13:50:02.2592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIUKX2gfisCveNoJAO5Pc195Bsb2+W6ARugl7Ej1e7+exu5h7dtRlmHDLZ9hupRMrYGsXqjSMPkFvAW7fbqXCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5653
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAxLTMxIGF0IDA5OjI0ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAzMCBKYW4gMjAyMywgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+IHdyb3RlOg0KPiA+IGk5MTUgaGFzIHRoZSBzYW1lIGZha2Ugd29ya2Fyb3VuZCB0
byByZXR1cm4gTUlfQkFUQ0hfQlVGRkVSX1NUQVJUDQo+ID4gbmVzdGVkIGJhdGNoIGJ1ZmZlciBi
ZWhhdmlvciBpbiBERzIgYW5kIG5ld2VyIHBsYXRmb3JtcyB0byB0aGUgc2FtZQ0KPiA+IGJlaGF2
aW9yIGFzIG9sZGVyIHBsYXRmb3Jtcy4NCj4gPiANCj4gPiBTbyBoZXJlIGNsZWFuaW5nIHVwIFRH
TF9ORVNURURfQkJfRU4gaW4gTUlfTU9ERSB0byBkaXNhYmxlIHRoaXJkIGxldmVsDQo+ID4gY2hh
aW5lZCBiYXRjaCBidWZmZXIgbGV2ZWwuDQo+ID4gDQo+ID4gdjI6DQo+ID4gLSByZXBsYWNlIElQ
X1ZFUlNJT05fRk9SRVZFUiBieSBYRV9SVFBfRU5EX1ZFUlNJT05fVU5ERUZJTkVEDQo+ID4gLSBt
b3ZlIGZha2Ugd29ya2Fyb3VuZCB0byBscmNfYWRkaXRpb25hbF9wcm9ncmFtbWluZyB0YWJsZQ0K
PiA+IA0KPiA+IEJzcGVjOiA0NTk3NCwgNDU3MTgNCj4gPiBDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5y
b3BlckBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndC5jIHwgIDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dh
LmggfCAgMSArDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndC5jDQo+ID4gaW5kZXggODRhNzNlZWNjZDI5Ny4uNWQwN2UxZTdiZDUwNiAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gQEAgLTMxMSw2ICszMTEsNyBAQCBpbnQgeGVf
Z3RfcmVjb3JkX2RlZmF1bHRfbHJjcyhzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ICANCj4gPiAgCQl4
ZV9yZWdfc3JfaW5pdCgmaHdlLT5yZWdfbHJjLCAiTFJDIiwgeGUpOw0KPiA+ICAJCXhlX3dhX3By
b2Nlc3NfbHJjKGh3ZSk7DQo+ID4gKwkJeGVfd2FfcHJvY2Vzc19scmNfYWRkaXRpb25hbF9wcm9n
cmFtbWluZyhod2UpOw0KPiA+ICANCj4gPiAgCQlkZWZhdWx0X2xyYyA9IGRybW1fa3phbGxvYygm
eGUtPmRybSwNCj4gPiAgCQkJCQkgICB4ZV9scmNfc2l6ZSh4ZSwgaHdlLT5jbGFzcyksDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhLmMNCj4gPiBpbmRleCAzMzI1ZGUzZWRmNjkxLi43NDRiN2QwOTgyNjgzIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiBAQCAtMjg4LDYgKzI4OCwyMSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHhlX3J0cF9lbnRyeSBscmNfd2FzW10gPSB7DQo+ID4gIAl7fQ0KPiA+ICB9Ow0K
PiA+ICANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnkgbHJjX2FkZGl0aW9u
YWxfcHJvZ3JhbW1pbmdbXSA9IHsNCj4gPiArCXsgWEVfUlRQX05BTUUoIkZha2VXYURpc2FibGVO
ZXN0ZWRCQk1vZGUiKSwNCj4gDQo+IFBsZWFzZSBhZGQgbmV3bGluZSBhZnRlciB7LCBhbmQgaW5k
ZW50IHdpdGggdGFicyBub3Qgc3BhY2VzLg0KDQpBbGwgdGhlIHhlX3J0cF9lbnRyeSBhcnJheXMg
aGF2ZSB0aGlzIHN0eWxlIHBhdHRlcm4sIGp1c3QgZm9sbG93aW5nIHdoYXQgaXMgYWxyZWFkeSBp
biB0aGUgZmlsZS4NCg0KPiANCj4gPiArCSAgLyoNCj4gPiArCSAgICogVGhpcyBpcyBhICJmYWtl
IiB3b3JrYXJvdW5kIGRlZmluZWQgYnkgc29mdHdhcmUgdG8gZW5zdXJlIHdlDQo+ID4gKwkgICAq
IG1haW50YWluIHJlbGlhYmxlLCBiYWNrd2FyZC1jb21wYXRpYmxlIGJlaGF2aW9yIGZvciB1c2Vy
c3BhY2Ugd2l0aA0KPiA+ICsJICAgKiByZWdhcmRzIHRvIGhvdyBuZXN0ZWQgTUlfQkFUQ0hfQlVG
RkVSX1NUQVJUIGNvbW1hbmRzIGFyZSBoYW5kbGVkLg0KPiA+ICsJICAgKi8NCj4gPiArCSAgWEVf
UlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTI1NSwgWEVfUlRQX0VORF9WRVJTSU9O
X1VOREVGSU5FRCkpLA0KPiA+ICsJICBYRV9SVFBfQ0xSKFJJTkdfTUlfTU9ERSgwKSwNCj4gPiAr
CQkgICAgIFRHTF9ORVNURURfQkJfRU4sDQo+ID4gKwkJICAgICBYRV9SVFBfRkxBRyhNQVNLRURf
UkVHLCBFTkdJTkVfQkFTRSkpDQo+ID4gKwl9LA0KPiA+ICsJe30NCj4gPiArfTsNCj4gPiArDQo+
ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5IHJlZ2lzdGVyX3doaXRlbGlzdFtd
ID0gew0KPiA+ICAJeyBYRV9SVFBfTkFNRSgiV2FBbGxvd1BNRGVwdGhBbmRJbnZvY2F0aW9uQ291
bnRBY2Nlc3NGcm9tVU1ELCAxNDA4NTU2ODY1IiksDQo+ID4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQ
SElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIDEyMTApLCBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+
ID4gQEAgLTM2Miw2ICszNzcsMTkgQEAgdm9pZCB4ZV93YV9wcm9jZXNzX2xyYyhzdHJ1Y3QgeGVf
aHdfZW5naW5lICpod2UpDQo+ID4gIAl4ZV9ydHBfcHJvY2VzcyhscmNfd2FzLCAmaHdlLT5yZWdf
bHJjLCBod2UtPmd0LCBod2UpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICsvKioNCj4gPiArICogeGVf
d2FfcHJvY2Vzc19scmNfYWRkaXRpb25hbF9wcm9ncmFtbWluZyAtIHByb2Nlc3MgYWRkaXRpb25h
bCBMUkMgcHJvZ3JhbW1pbmcNCj4gPiArICogdGFibGUNCj4gPiArICogQGh3ZTogZW5naW5lIGlu
c3RhbmNlIHRvIHByb2Nlc3Mgd29ya2Fyb3VuZHMgZm9yDQo+ID4gKyAqDQo+ID4gKyAqIFByb2Nl
c3MgYWRkaXRpb25hbCBjb250ZXh0IHByb2dyYW1taW5nIHRhYmxlIGZvciB0aGlzIHBsYXRmb3Jt
LCBzYXZpbmcgaW4NCj4gPiArICogQGh3ZSBhbGwgdGhlIHJlZ2lzdGVycyBjaGFuZ2VzIHRoYXQg
bmVlZCB0byBiZSBhcHBsaWVkIG9uIGNvbnRleHQgcmVzdG9yZS4NCj4gPiArICovDQo+ID4gK3Zv
aWQgeGVfd2FfcHJvY2Vzc19scmNfYWRkaXRpb25hbF9wcm9ncmFtbWluZyhzdHJ1Y3QgeGVfaHdf
ZW5naW5lICpod2UpDQo+ID4gK3sNCj4gPiArCXhlX3J0cF9wcm9jZXNzKGxyY19hZGRpdGlvbmFs
X3Byb2dyYW1taW5nLCAmaHdlLT5yZWdfbHJjLCBod2UtPmd0LCBod2UpOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICAvKioNCj4gPiAgICogeGVfcmVnX3doaXRlbGlzdF9wcm9jZXNzX2VuZ2luZSAtIHBy
b2Nlc3MgdGFibGUgb2YgcmVnaXN0ZXJzIHRvIHdoaXRlbGlzdA0KPiA+ICAgKiBAaHdlOiBlbmdp
bmUgaW5zdGFuY2UgdG8gcHJvY2VzcyB3aGl0ZWxpc3QgZm9yDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmgNCj4g
PiBpbmRleCAxYTA2NTk2OTBhMzIwLi44NzJmM2U0ZGRjNzNjIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3dhLmgNCj4gPiBAQCAtMTIsNiArMTIsNyBAQCBzdHJ1Y3QgeGVfaHdfZW5naW5lOw0KPiA+ICB2
b2lkIHhlX3dhX3Byb2Nlc3NfZ3Qoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4gIHZvaWQgeGVfd2Ff
cHJvY2Vzc19lbmdpbmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4gPiAgdm9pZCB4ZV93
YV9wcm9jZXNzX2xyYyhzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpOw0KPiA+ICt2b2lkIHhlX3dh
X3Byb2Nlc3NfbHJjX2FkZGl0aW9uYWxfcHJvZ3JhbW1pbmcoc3RydWN0IHhlX2h3X2VuZ2luZSAq
aHdlKTsNCj4gPiAgDQo+ID4gIHZvaWQgeGVfcmVnX3doaXRlbGlzdF9wcm9jZXNzX2VuZ2luZShz
dHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpOw0KPiA+ICB2b2lkIHhlX3JlZ193aGl0ZWxpc3RfYXBw
bHkoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4gDQoNCg==
