Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF6BC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 18:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A9110E982;
	Thu,  2 Nov 2023 18:41:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AA810E982
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 18:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698950500; x=1730486500;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=N2fhmcIe7MH+Sg9yFeAEC7b4HHtAtfza9Vyz7/Nte50=;
 b=bCqLbnaemwa17RfEgbPLBgqCMB89oNhbtTYnJPmWp6VIrZDmcGTx20J9
 cECN66GcTd9mSgEIzYSimKq4jua3bNh/TJPq60Icd6hC/N7c8gTqFeZAA
 /kfmytHOB2mbjcLQo8IInKWAhenjIC0428/E0Y53amgPzFLE/MvpITGPP
 goFGhmfESD6v/zRFLctsAg/g0hE4gSzCxPJrUOwaC8D9FnWIVp7Ehnp8v
 dtLR1bqfCS/TBWgViES6CpITWBf99rfxTgwpIIEx0mggjGnQYpIm3CJZ7
 IZDaRTmF0ZEzuF3owHzPYKTvKm29yCZ97DhmFZJVGwYKrFJq9jqTaOpjz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="475030773"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="475030773"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 11:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="905098801"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="905098801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 11:41:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 11:41:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 11:41:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 11:41:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 11:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVwM01sGJUGtOZaulfZ/p0e5IyWYQRxk+FOWyrKQfUjWkh27euppGcECsmrT0+lsBD6xhcMz32KCQeOYGMrq6zRZsuK5qY4nYWTvzSs4HVkVGS+hqiL311JjrUi9BYABVVm+GzkOkXMa7k4Ftvn089w16OBwPGcJ+6mSBOYARndCywZ5N+3njtMUUp+9hsmcnmIhVt3g/HP01gXUQ4Jq/aiGXo/xvFw+/cp9fOzelO1lZlew4TbkSloI/ofQQCT+VTIkc6M87aqws6yqCCxinNOrQAztonUvHsQl0W2TmrPUwA5epMuNZawm1KSiL9Pgcm+EqhKWsJInSvMINDL8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2fhmcIe7MH+Sg9yFeAEC7b4HHtAtfza9Vyz7/Nte50=;
 b=Mj9pADusERZBxwSAq6ShVItctEh9/537KCKzVSTxdU3xdNc2kEqFEFJzwXicgVgBZR3UdXEUEd9W5mSf7NRugBzDijeVYU6xrRVU0ED9r/RD/Xk3VA/PdvpHph+GHivcAWu6n7hNl+Kn4PM9gZ4vNyl5zm22amqweFNgQTdBsGfIoQDCja0H9GF01yXwHt/5jKMC2WgZbIoq1jhwmUAk0MBX6V1ROaakgAkEOJLhR8ZMO3K5V+lsjo1vs7DiVchnZjc9wP1LMt+HDsTbsONAwtxGriBLapuIBw8tRXKfklHq8TNKhdyxvmC9QFuJSuHMfZCO85XPIaN1/7Y3R8BQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.21; Thu, 2 Nov 2023 18:41:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 18:41:34 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode
Thread-Index: AQHaDR9FQ9iUkzkupkKNfE8iiuxKDrBnXiiA
Date: Thu, 2 Nov 2023 18:41:34 +0000
Message-ID: <1984105530cb00a1e782aea061e21f645bac5ee7.camel@intel.com>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB6542:EE_
x-ms-office365-filtering-correlation-id: 9839c440-911a-4e33-13aa-08dbdbd356fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dtys38pU9aG4BATp72AEtYh/p4sW3n3pqpWpZwX9PMHUhX9mEJtvFgAgL0sd5TqLHDxsWo5JEX49lEx+AU0o9mplUFze95NgI5FH9hQZe+iZ25OlgiDCaGO6h1t1iqwyH6rGOTt9RyVrMDp6XxZFNGvsnUioDw2o+r1LiJZCGf68vmzBNLPwwS6jOOin4er3hgeFMo6CzW7LKPv1NN56hvrSgKqUcsCqsxu9A4ZZ+3YZpO8UiRmNUFLof4fOwYV20vWnFz5P8w0itk+/Na4UyFTeb1LDel+JBdxwcigH3qdIQZ5mEScgJqj2fH9ZnO3XBQ9BVRbEA/jg6Sf3SH3ndIIlCfVK6xQoXFlK394jV8Wb2/LU+F0ipD55S/dMjWUZBoj3pVw0W1tPKPP9FYiFJoobWAUE8iKIKzd9OLDnEtIh0AtGDjDJhrr7YMofA+pYD+4S6EZsjyk1mCq4poqXpwfwrGJh9hyRK9omlpY0Td8z59wFL91GbIE0ICUmQc+XCys+NVYSyu34KHj34lxO91cQyjc2Ga65u06bjTn6akVYShRI7RO3HqhYPCP/xvTIkSshRSXd10gDGt6GqphiKsqqHumchoqDtmcOwJFJinM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(38100700002)(6506007)(478600001)(83380400001)(2616005)(82960400001)(122000001)(6512007)(41300700001)(86362001)(2906002)(5660300002)(8676002)(8936002)(36756003)(71200400001)(66946007)(6636002)(64756008)(66446008)(66476007)(66556008)(316002)(76116006)(110136005)(91956017)(26005)(966005)(6486002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1BVcnVnYko5a2g2ZXYzOU5CUW5NRWlSMytrajBtbW5UbGNFOVBmYysvZ09X?=
 =?utf-8?B?NGpHREVxVFQ1MEpueXBFSC9LWTBRcGM5MTg4UDhaKytwSnIramRyUW9uY1ln?=
 =?utf-8?B?cTZEZjIvdnczWTdHRTlDMWFTc2VKaGd6bUgySGtpUkVhdjFCKzdmdGdGTi8x?=
 =?utf-8?B?Z2hGaU52bWxwNWdiUHFQSFp6bXN3VytaUVNkZk5NZXl1UGxKMXAySzhjQkUr?=
 =?utf-8?B?ZzVFTzhxZkFnNWJDSnAyNVNZWThteXErZW12RnFVVjFvWFlKRUk4eVNwUEkx?=
 =?utf-8?B?OGhzbzdDUSsraDJmSnUxYU9mOUdDYnhySnJnYmJEdEtCeWlXcVlJaXZ0b05P?=
 =?utf-8?B?dndSak5jaVJQclo3TGd2a0VtNWxhZkpxUkxpQ2I2eHN1Q2E1NkMweTlVVDBh?=
 =?utf-8?B?WDhYOEUyNEttSElTRktyZmx1cy9DQWZ0VUtmQVNSRk9EYnFuNGxERzE4ZTk1?=
 =?utf-8?B?Vy9jTWxRQWsvcjJhTUFpVjQ2dDRWZkdDQ3JQcnZya2N0MWlvRTVIai90TmVM?=
 =?utf-8?B?dUVpRERCUEg2OVpEWm1HUGllVGRVU2t0TUpuT3FqWEF2RC94a1B4WkdQVzlx?=
 =?utf-8?B?RTVLbEJlMEErd2dmU0trSXpzMzloOHZoTlprU3BXbkxVN0ZHdXVrZmY3UlVQ?=
 =?utf-8?B?WUdDdzB4cHZOcDU1TE5Md2xwVzRJaFFyNDI0cVRkcStpSlg0c3NHclU3SnBV?=
 =?utf-8?B?dWwvdWVDZXhWQkRqNnlrT1ZCRk81N3FGQWZrZjRjOWN0M0ZqMFJHdnFkRzho?=
 =?utf-8?B?NFpBZFJLOURoNUErdHI0U0QvTGFXc0psMEplYnE1ZlQ2MDB1eWU0Y2lKdXds?=
 =?utf-8?B?QW9OYkxzK3J4QUxPVXhTMXdXQjB4cU8weEd4Z2puUDBDd2FqWkJRWWpHbmlB?=
 =?utf-8?B?VDFuSVNBVWZZUnpXU0F4VnpWQkFpWlVhYm1ERC9KVlNjZmpiblphNTloaDlr?=
 =?utf-8?B?eUdSTlM5d2IrZ1NoOGp1dHBHT2g5ZDA5TkhxY3JwK0d6L1M1NU5lU0phSmxV?=
 =?utf-8?B?cmFtR0ROOU1IbkFPMk5sMzk5WHg3N0xyMTFQL2wwMWlEM2tLSWlBS0VaMGpN?=
 =?utf-8?B?alkvOWIvRDhqcExzY1MvUVRwK2xVWkFBeWVyNk5KNGlsdEdtVDh1TGo4U2RH?=
 =?utf-8?B?RWJkZ3gyalJ5YW9idFdVRHp6a1B6WWprb1JsR2tiVDdzejVVbW45R3JZNGZq?=
 =?utf-8?B?UHY5bE9jSWdrTU9Sa2lEbmdHZC9YQVVZU0JPbGJRODd5RFlZOFZjVW0zVy9Z?=
 =?utf-8?B?SEtMbzl4M2JySHVnWFFhOTZmelZRVDhIMi9hWGprQ242VjcrSXQ4WUpEWGov?=
 =?utf-8?B?YVI4a2xNVkJpYUVod3hWUi8xdDFvS3owYStOOW84aGg0WFhxY3VqdC9Kay96?=
 =?utf-8?B?azU4Q0F1TzdCeVh2bW9FV0hCSjhKdlhndWVGdjVIMDBrQVl3cC8rNEpVSWsw?=
 =?utf-8?B?V2MzYmxrQmljS3VxTTlHYTBuTGhRb0t3d0c5RnIycTdXUzRSUjB5Sm1WekZh?=
 =?utf-8?B?OVpWWERReTl6aXJQQTBXbWp5a2p5OFN4WXNDYUlGcDFWc2ZZK3FqbzBoNWRn?=
 =?utf-8?B?bDRHTFRTcmdZM3BTYmZZa3JvbTdWNnZ2VmpxM01ZQTI1OGJHRGpmbFpKVTR4?=
 =?utf-8?B?OG1SZTF1Q1pWRjJRRTRVM0ZGakx4cHdyMitZczNRdXlGcnhLSmJxYy9CRzJW?=
 =?utf-8?B?aUliSHVFWFVPV2RncTdycksreURFTmZGdlk5UEV3V1k5MVFrS00rdGVWWjBU?=
 =?utf-8?B?SWZVa0I3ZEFyMk5QK3dLa25rbVpINHUwcFR0U3dlZFRYR2hkMFZxZlpSbHIv?=
 =?utf-8?B?ZzAwZlY5QS9zdWF3K0NBdWZxMldXM1YrN3Y5MGJidHRqc2NrcWoyUU9ONW9H?=
 =?utf-8?B?RkVmdWZ1a3B3NE1SQ3lGUks1VXlSQzBIUDdpU0NoTitQRHJSWDU3c1oyVlNt?=
 =?utf-8?B?N3FLYXRKalUvaDcyL00zQlBWTkgvbFVCNW5wMDNPQXJuTVA4U1dJbFlPTWZV?=
 =?utf-8?B?by9Wc3JmQnBzMURzRS92N0ZKTlRsbXZuTy92YzRRNFIzYTVuT0xPdjl0YUJt?=
 =?utf-8?B?cGlWU2RpdFNJNVFTbUgxUlRTWm9oZW1ZU08wazVvUDRTZEQrRk9CZWZWODMr?=
 =?utf-8?B?QkFtaU9rMmIrdU9QV0JmSXNtMGJwQmlTZFZBdHJoTW1KcmpFQ0FxZElwM3c0?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <997628C34F3F424E98F8A3219D08B9C3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9839c440-911a-4e33-13aa-08dbdbd356fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 18:41:34.6437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQaXPGgdfrEOC+k5PdsA7+nvO9iW4hsaa8bHQvzd8O4pfIJjsqeBkn6SBckE4Re+cSS8K3Ly1awCmqRcHAnadm8fiqzgIXjrwRMLJQvZCWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode
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

T24gV2VkLCAyMDIzLTExLTAxIGF0IDE2OjU3IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBBbGxvdyBzdGF0aWMgYXNzaWdubWVudCBvZiBjb21wdXRlIHNsaWNlcyB0
byBhIHVzZXIgc2VsZWN0ZWQNCj4gbnVtYmVyIG9mIGNvbXB1dGUgZW5naW5lcy4gQWRkIGEgcGVy
LXRpbGUgJ2Njc19tb2RlJyBzeXNmcw0KPiBpbnRlcmZhY2UgZm9yIHVzZXIgc2VsZWN0aW9uLiBC
eSBkZWZhdWx0IGFzc2lnbiBhbGwgY29tcHV0ZQ0KPiByZXNvdXJjZXMgdG8gdGhlIGZpcnN0IGF2
YWlsYWJsZSBjb21wdXRlIGVuZ2luZS4gVXNlciBtdXN0DQo+IGVuc3VyZSB0aGUgdGlsZSBpcyBp
ZGxlIHdoaWxlIGNoYW5naW5nIHRoZSBjY3MgbW9kZSBhcyB0aGlzDQo+IGNhdXNlcyBhIHRpbGUg
cmVzZXQuIFVzZXIgbXVzdCBhbHNvIGVuc3VyZSB0aGF0IHRoZXJlIGFyZSBubw0KDQpIb3cgd2ls
bCB0aGUgdXNlciBrbm93IHRoYXQgdGhlIGRldmljZSBpcyBpZGxlIHdoZW4gdGhlIEtNRC9HdUMg
YXJlDQpyZXNwb25zaWJsZSBmb3Igc3VibWlzc2lvbiBtYW5hZ2VtZW50IGJldHdlZW4gcHJvY2Vz
c2VzPyBUaGlzIGlzIHRoZQ0KcmVhc29uIHdlIHdlbnQgdGhyb3VnaCB0aGUgY29udGV4dCBjcmVh
dGlvbiBpbnRlcmZhY2UgaW4gaTkxNSByYXRoZXINCnRoYW4gaGF2aW5nIGEgdXNlci1zcGVjaWZp
YyBpbnRlcmZhY2UgbGlrZSBzeXNmcyBvciBpb2N0bC4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4g
b3BlbiBleGVjIHF1ZXVlcyB3aGlsZSBjaGFuZ2luZyB0aGUgY2NzIG1vZGUuIEFsc28sIGVycm9y
IHdpbGwNCj4gYmUgcmV0dXJuZWQgZm9yIGV4ZWMgcXVldWUgY3JlYXRpb24gd2l0aCBkaXNhYmxl
ZCBjY3MgZW5naW5lcy4gDQo+IA0KPiBTdXBwb3J0IHRoaXMgbW9kZSBmb3IgUFZDIHdoaWNoIGNh
biBiZSBleHRlbmRlZCB0byBvdGhlcg0KPiBwbGF0Zm9ybXMgaW4gZnV0dXJlLg0KPiANCj4gSUdU
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyNTg3My8NCj4gDQo+
IHYyOiBGaXhlZCBpc3N1ZSB3aXRoIEhXIGNvbmZpZywgZW5zdXJlIG5vIGV4ZWMgcXVldWUgaXMg
Y3JlYXRlZA0KPiDCoMKgwqAgd2l0aCBkaXNhYmxlZCBDQ1MgZW5naW5lcy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmENCj4gPG5pcmFuamFuYS52aXNod2Fu
YXRoYXB1cmFAaW50ZWwuY29tPg0KPiANCj4gTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSAoMik6
DQo+IMKgIGRybS94ZTogRW5hYmxlIEZpeGVkIENDUyBtb2RlIHNldHRpbmcNCj4gwqAgZHJtL3hl
OiBQcmV2ZW50IGV4ZWNfcXVldWVzIGNyZWF0aW9uIG9uIGRpYWJsZWQgQ0NTIGVuZ2luZXMNCj4g
DQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAx
ICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggfCAxNCArKysrKw0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuY8KgwqDCoMKgwqDCoCB8wqAgMSArDQo+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHzCoCA5ICsrKysNCj4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jwqDCoCB8IDQ1ICsrKysrKysrKysrKysr
Ky0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MjcgKysrKysrKystLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5owqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDIgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5j
wqAgfCA3OQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X2Njc19tb2RlLmjCoCB8IDIyICsrKysrKysrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3R5cGVzLmjCoMKgwqDCoCB8IDE2ICsrKysrKw0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfYWRzLmPCoMKgwqDCoMKgIHzCoCAzICsrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3X2VuZ2luZS5jwqDCoMKgIHwgMTQgKysrKysNCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfdGlsZV9zeXNmcy5jwqDCoCB8IDYyICsrKysrKysrKysrKysrKysrKysrKysNCj4g
wqAxMyBmaWxlcyBjaGFuZ2VkLCAyODggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Njc19tb2RlLmMN
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Njc19tb2Rl
LmgNCj4gDQoNCg==
