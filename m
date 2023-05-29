Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D56C7EE23
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 04:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0B010E027;
	Mon, 29 May 2023 04:00:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419E10E027
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 04:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685332854; x=1716868854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I36cxZCWPtJb6snhuvxOAVOTtqAZTVxqHBpdsf3vu8s=;
 b=cE1CC8lo63gRlmYLE2Pgn18UyOWS10+KaRLuSFeucVkW5YNboAXg6Mya
 uxIWTnTBFmuzgDZLWWQw7FSDu1S+O0TkpWH2mLu6NQ42oOqrtN+W3OIKw
 I1wnuTwQ/lSq1ygg92WCT1EsDd40lbW6iSrW5ZPIQrB4MNuziaMvaXunm
 +ZTK1F6SkXbFsexleSoCaBqKR9ArdbKABIcM/iEw4hpdFNFI9d0tP+pCv
 NUXJ5gqqjbqaIB/CCuzqTi6Vpd7PkC2kQnIKwwRYcllsyX2Evoux4IeCq
 7foYwq4oy878mbwVAIchdpuzuRR2UMUlNHRswoWp+rHc+rPN9V4sCYcjx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="344107603"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="344107603"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 21:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="770982286"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="770982286"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 28 May 2023 21:00:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 28 May 2023 21:00:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 28 May 2023 21:00:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 28 May 2023 21:00:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 28 May 2023 21:00:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfMb1IltNGbXLjWkC+6Jae1hJLoT5ynei49Lv7vzL68BLdr6irCJsegrAuwN7Nv1lEZJTaO9MUVQTJs+hsmCXUJKLe1WSPOms6snP4RJgA6cq1Hhqrkx/W9MVywvtbk6CIGxkjTB4bjHSUCX/0ALWTwFroyLXMNmgggUyHilfJHF3iHZpIki4zdYvplsDmi66tkm/06czjBGmRwqaJTZIJC0kGJo/7yiFgdeGJJx1r2/Q+ApC5vV0kPjwaMXNmSI9SHxje/3LvYWw7RWB0tTa5YdxifOI0k3V274Z8SlV/3Ge59Y5pwBmpk5pcuTB4vKYKtt4tVi2bELoyiTF957Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I36cxZCWPtJb6snhuvxOAVOTtqAZTVxqHBpdsf3vu8s=;
 b=K8sZaRIsMHyrgpNsLPNwmnOGbmVftrT1H8TI2udh9hfmxfGpPbXLTv7X1smze1p+jfUTntjh/zh1LwVuKElzwYI5rGawc9EZ/q4PY8GViK2M+/7azdTAZ6+ur5Go+7VNq8PZ/5FNOsnefcyTXWGhJEdyaCQnTBhoHiGsy1l0ObL5sMGiK/WUQ46f5OX/X6I5zwVfKy2oUcxxlXWpixCerEHuOQjrPLwGE35NsntJkpUfKntlvr0CIi4WbKM7hWTemiRGWAVhbk0E5GODH2fTb47mYOLGZJCL98qxTpT2BVu8XxeIQQOti57qvNJg21M1z355mwLiq5cFeddya41N9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 04:00:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 04:00:49 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
Thread-Index: AQHZjg3GEpQ52Tr3U0+LzA70gnJZCq9pnQUAgAcLEFA=
Date: Mon, 29 May 2023 04:00:48 +0000
Message-ID: <MW4PR11MB7056C0572BAD1B7EE2FEF0AAB34A9@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
 <ZG461NbVPLb7utFZ@bvivekan-mobl>
In-Reply-To: <ZG461NbVPLb7utFZ@bvivekan-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH0PR11MB5505:EE_
x-ms-office365-filtering-correlation-id: 49c54c3e-486f-4a9b-70c0-08db5ff94957
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v5iZQKnyQe2dx/Epu5/irnQh2UTmfl8TcCeMU6rWBeIjeW6mlXdY2UT38gvehpDu/FSgMUHgKej/bL2/k5XL+JzBO2s7AzU10etUfQdzeFD26Q+VgtBMLVAuVte40KjWTjoW+7KDqhMyPFZuybHC6G20fWXXncdjdtN8Nxgh1DJVoveb5QbWwnLHiw+DVAyzFRUt5dGKbK8vX4PdYGY76CS9idc+AcGdrmeiXcewvQ1kKDZY2RY6triOR6qzMdRQZpt34oAEKxODPgT+gUQq1xop1KFW/ZlgC517SFguPlfLCoAmjd15/aOU8X0jqjT2bRY1yJ+aNrRQ/fwu2Q2aLcGi5R5xE9t022APEdBoSU+i04//GGXSk8jw9MqQHyXVOJOHq67PEZSNGEHuruYiOAS4YmohgxK6lwWbhBPZbSU4na+7ylW3ENf7GObL5uXScHNHNnT2fyVZFu2W+KCooQPOLQdySUiNTP9HjA/0CKHLN8t3TMW4eIcshKxxEB7ofDQC4Rt9PCTxYqh75vIqioDs888fQWzhlOWjrUoQSb9D8Qfn3FRkK+PXzeloq8Cs94d6gQZuqyRWQp4aVNzNjg6XLhSAWS0CXVdyQ9mYav8IQ6YV+cRka/70YMbtaMEM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(186003)(33656002)(26005)(53546011)(9686003)(6506007)(7696005)(316002)(71200400001)(2906002)(55016003)(52536014)(5660300002)(107886003)(41300700001)(8676002)(8936002)(478600001)(82960400001)(122000001)(38100700002)(110136005)(4326008)(86362001)(38070700005)(66446008)(66946007)(64756008)(66476007)(66556008)(76116006)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c20vNUtaQTUralFJMTJtQkcwQm52QXJvSFhFbmkrWjZMZEtYTEd4TVh4VWdn?=
 =?utf-8?B?MzhqVUxsSGp6WDdtUEErNDNBVWdZV2VDQTYxM2NQaXlpaEpwL0swelNKNGdK?=
 =?utf-8?B?bDY2a21vdVJ5TzJlc1BQRXdJRlNubU1sYkkwdGpVS0RIcENYRjJCNGFEZ2J6?=
 =?utf-8?B?Q2tvUGNNdXFINWhXSE16YU9lSDNWaHJlbDdlMmFFY1J0aGMxUXhJd2NBNE0x?=
 =?utf-8?B?YW1ydzhrYWlxR3ZJaUZoV2dJL1FNMDFZdytiL2xSelV0VjRtVFVkU0ZCbHBV?=
 =?utf-8?B?T1dFQk9tem5FRlpNb2p6WlJ0K1BuUFdpd1YwUFpjencrenpIM3hmemtNd242?=
 =?utf-8?B?ZUhRWUpMa1lqMzUxMlBIejhpUHVVRGhYSFpkU1R0N1duYlVsVVpFaE5qamVJ?=
 =?utf-8?B?QjNyY0hmMmwvNkpXWFF0WlZDOWVQVi9JWVNDcjZMQzVaMWpieFhQN0hUTytx?=
 =?utf-8?B?U3c4LzNaclFza2JteHNqQm14N2dyOXEvQlRoY2YrY1dPRGdhZDJuYVJXODQ1?=
 =?utf-8?B?QWE5NlBLL093QXRlRDRnMnl2L0M4dElWbXp4S2J0Rk1kTE5ob2VsZVpQa1Ju?=
 =?utf-8?B?TG9IVVNFWmxPTHNnMUw5Nkl2Q1Z2cmRQUGN6NkdjOGZ1cmtmOHFsUWR5TTBF?=
 =?utf-8?B?aFlmL3VHNXdyWFhnZktBQ0lvbFVCS3lSOWs4SURhbmhFckNqM1hqMkxGRFVM?=
 =?utf-8?B?SzlyNFgzQ2c5NzA1djUyMHRUNFN4Vm1yOE43dXEyTXIyMTFSUUE3cEp3OWJI?=
 =?utf-8?B?ZWdJRXV5UGVLQVQrVXpQT0kyT1BzNm9GOVNXdi9wVFhaeTJZaDJ6b1huS0VD?=
 =?utf-8?B?RE4veTlpWW96V2dMY2JGZkEwWkJUNExUbHBpZTVhUm45RXowczhrdjNrM00w?=
 =?utf-8?B?U1R4aEsxQlhOaVoveVY1VUJlM3RnbEN6SkJ1cDlYeVBRZkQ3SVZVcndtaHls?=
 =?utf-8?B?b214NVQ1eDh4eHJmUzlRWkxkS0lrYll5M3J5VzJMbjk5aHFLSVlCLzdlVTZP?=
 =?utf-8?B?VWkxUkkwSjl1RXdTODNIaUw3c2JzWEZLY0RPSGxNc0w4SGFVVTAxN3I4TjRW?=
 =?utf-8?B?RnFWL0xhWnluQzZ5Tmt3YjNXVm5EbUZHbU03cmMrRVdVbllDQXVJYWIyOHVD?=
 =?utf-8?B?OWpUcmhDeEZ5cWxOUWdvTzBLd2kxNjhkTUUyU0tXWitSVW83RGZzZzJpK0xU?=
 =?utf-8?B?eTdQOFJYQllDRVBMK05oYjRBTjI4WERlS1BPdnFZaFJxZ2RyWDhnVTNabFNZ?=
 =?utf-8?B?amV0amcvRVduL1lCNGxBSnNlcUlsbmlLeWYwZE93NzBEQ3hYU0Rvc0FXVm9V?=
 =?utf-8?B?dUpQaXJDMi8vdTBIcDRpZklFQmxOaWVvalJmSjZ5N3U5RUtyVCs4MUUrdThp?=
 =?utf-8?B?Mm01cFdpVEVzV2RtRHBuLzZ3TE1ORHRudEx3TEUxZkxBZWg5VU9GdzlCRHlY?=
 =?utf-8?B?eWxhTEJWWFRHM1dteTd3WkRlQzRQZm1nNG5rWjB6T3F5djlHT1dnQUtKVXF1?=
 =?utf-8?B?QllpOGhVQWNMS2k4UVFYTG85UWxacWkwTmxOeCtnenNKNU56V2h0L0s4SEJK?=
 =?utf-8?B?c1BxQTV1NStPcmpiczdzV0QvMWF1Mzh0ZFdTNkFKY0lGcnhFK3NuYlIzbEF1?=
 =?utf-8?B?MFlxMXJYejJDYTY2VkZRNHF0ajdIK2hQYWNzS0NybVdGTTRXUTIwbitqMWgx?=
 =?utf-8?B?Vml1THhtZmRROVVHSGNIcElYeXIrWGc2dXVtb2QyQUFIMXJQc1dKQzM2STcy?=
 =?utf-8?B?RURJaHhmNzcxcnJXMll5bjJWR0FYMUkxdzF1RmYxYmExRUFINVl1aTdsbW1o?=
 =?utf-8?B?VEtGZHYwTkJtUFpEVERCUVZlbWM2TzhZUUhmWGFqRVFaRE03d0JydERURDVr?=
 =?utf-8?B?eU9LTmJXT2F1aFZYdE1seGovV3NvNEtDaERoZ2ZiKzJITVVKaW9KZHloR3Iz?=
 =?utf-8?B?ZW5yUEtYRnRyUjhnVGI1U3hReHpVUWdvZHNPWGJwUzR5WHhnS0FOek0xOGpW?=
 =?utf-8?B?dmhGSGpMTlo3NWxjb2c2VEF0VEw0NXZJaWE4S0dlYVJWaGtwWis3dmtkN2p1?=
 =?utf-8?B?MnUzdms0L1JUMXp5eE5iWVhtL05QdndkQ3Z5Z1ZwcDNIQUdmZWQxOTB5VVhE?=
 =?utf-8?B?TDJ5ZHRGQnl6U0dLbklvSzU5czc3SXFXU1RCYmtHUnREMU1BMUYzZktGUVNM?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c54c3e-486f-4a9b-70c0-08db5ff94957
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 04:00:48.4955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtcWh8CwpraGNvPr1KpbSVaTkL0PMITXG0DQnSCwVwoat95v583Lnp+QD/oRVe61t8mOVFwncuV32J4PulmQFh1bhVs004ugIBVoZnGFeMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pIDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+IFNl
bnQ6IDI0IE1heSAyMDIzIDIxOjU3DQo+IFRvOiBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1h
bC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIHYyIDEvMV0gZHJtL3hlOiBBZGQgYSBkZWJ1
Z2ZzIGZvciBmYWtpbmcgZ3QgcmVzZXQNCj4gZmFpbHVyZS4NCj4gDQo+IE9uIDI0LjA1LjIwMjMg
MTI6MzYsIEhpbWFsIFByYXNhZCBHaGltaXJheSB3cm90ZToNCj4gPiBJbiBjYXNlIG9mIGd0IHJl
c2V0IGZhaWx1cmUsIEtNRCBub3RpZmllcyB1c2Vyc3BhY2UgYWJvdXQgZmFpbHVyZSB2aWENCj4g
PiB1ZXZlbnQuIFRvIHZhbGlkYXRlIHRoaXMgbm90aWZpY2F0aW9uIHdlIG5lZWQgdG8gZW5zdXJl
IGd0IHJlc2V0IGZhaWxzDQo+ID4gYW5kIHRoZXJlIGlzIG5vIG1lY2hhbmlzbSB0byBjYXVzZSBm
YWlsdXJlIGZyb20gaGFyZHdhcmUuDQo+ID4gSGVuY2UgYWRkZWQgYSBkZWJ1Z2ZzIHdoaWNoIHdp
bGwgY2F1c2UgZmFrZSByZXNldCBmYWlsdXJlLg0KPiA+DQo+ID4gdjEoUm9kcmlnbykNCj4gPiAt
IENoYW5nZSB0aGUgdmFyaWFibGUgdG8gZmFrZV9yZXNldF9mYWlsdXJlX2luX3Byb2dyZXNzLg0K
PiA+IC0gRHJvcCB1c2FnZSBvZiBSRUFEX09OQ0UgYW5kIFdSSVRFX09OQ0UuDQo+ID4gLSBGb2xs
b3cgY29uc2lzdGVuY3kgZm9yIHZhcmlhYmxlIGFzc2lnbm1lbnQuIEVpdGhlciB1c2UNCj4gPiAg
IGZ1bmN0aW9ucyBmb3IgYWxsIHRoZSBhc3NpZ25tZW50cyBvciBkb24ndCB1c2UgZm9yIGFueS4N
Cj4gPg0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWly
YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrKystDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF9kZWJ1Z2ZzLmMgfCAxMSArKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdHlwZXMuaCAgIHwgIDEgKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gaW5kZXggODBkNDJj
N2M3Y2ZhLi5iM2FjOGIzYWI0NTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IEBAIC01
MDYsNiArNTA2LDkgQEAgaW50IHhlX2d0X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiAgCWlu
dCBlcnI7DQo+ID4gIAlpbnQgaTsNCj4gPg0KPiA+ICsJLypGYWtlIHJlc2V0IGZhaWx1cmUgc2hv
dWxkIGJlIGRpc2FibGVkIGJ5IGRlZmF1bHQqLw0KPiA+ICsJZ3QtPnJlc2V0LmZha2VfcmVzZXRf
ZmFpbHVyZV9pbl9wcm9ncmVzcyA9IGZhbHNlOw0KPiA+ICsNCj4gPiAgCUlOSVRfV09SSygmZ3Qt
PnJlc2V0LndvcmtlciwgZ3RfcmVzZXRfd29ya2VyKTsNCj4gPg0KPiA+ICAJZm9yIChpID0gMDsg
aSA8IFhFX0VOR0lORV9DTEFTU19NQVg7ICsraSkgeyBAQCAtNjAxLDggKzYwNCwxOCBAQA0KPiA+
IHN0YXRpYyBpbnQgZ3RfcmVzZXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiAgCXhlX2d0X2luZm8o
Z3QsICJyZXNldCBzdGFydGVkXG4iKTsNCj4gPg0KPiA+ICAJeGVfZ3Rfc2FuaXRpemUoZ3QpOw0K
PiA+IC0NCj4gPiAgCXhlX2RldmljZV9tZW1fYWNjZXNzX2dldChndF90b194ZShndCkpOw0KPiA+
ICsNCj4gPiArCWVyciA9IGd0LT5yZXNldC5mYWtlX3Jlc2V0X2ZhaWx1cmVfaW5fcHJvZ3Jlc3M7
DQo+ID4gKwlpZiAoZXJyKSB7DQo+IA0KPiBUaGlzIGRvZXNuJ3QgbG9vayB0aGUgcmlnaHQgd2F5
LiBJdCBzaG91bGQgYmUgc29tZXRoaW5nIGxpa2UNClN1cmUgd2lsbCBhZGRyZXNzIGluIG5leHQg
cGF0Y2guDQo+IA0KPiBgYGANCj4gaWYgKGd0LT5yZXNldC5mYWtlX3Jlc2V0X2ZhaWx1cmVfaW5f
cHJvZ3Jlc3MpIHsNCj4gDQo+IAllcnIgPSAtRUNBTkNFTEVEOyBvciB3aGF0ZXZlciBhcHByb3By
aWF0ZQ0KPiAJLi4uDQo+IGBgYA0KPiANCj4gPiArCQl4ZV9ndF9pbmZvKGd0LCAiRmFrZSBHVCBy
ZXNldCBmYWlsdXJlIGlzIGluIHByb2dyZXNzXG4iKTsNCj4gPiArDQo+ID4gKwkJLyogRGlzYWJs
ZSBmYWtlIHJlc2V0IGZhaWx1cmUgZm9yIG5leHQgY2FsbCAqLw0KPiA+ICsJCWd0LT5yZXNldC5m
YWtlX3Jlc2V0X2ZhaWx1cmVfaW5fcHJvZ3Jlc3MgPSBmYWxzZTsNCj4gPiArDQo+ID4gKwkJZ290
byBlcnJfbXNnOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgCWVyciA9IHhlX2ZvcmNlX3dha2VfZ2V0
KGd0X3RvX2Z3KGd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+ID4gIAlpZiAoZXJyKQ0KPiA+ICAJ
CWdvdG8gZXJyX21zZzsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X2RlYnVnZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0KPiA+
IGluZGV4IDhiZjQ0MWU4NTBhMC4uMTNkMmE5NzRiYzAwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9kZWJ1Z2ZzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfZGVidWdmcy5jDQo+ID4gQEAgLTEyNyw2ICsxMjcsMTYgQEAgc3RhdGljIGludCBy
ZWdpc3Rlcl9zYXZlX3Jlc3RvcmUoc3RydWN0IHNlcV9maWxlICptLA0KPiB2b2lkICpkYXRhKQ0K
PiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IGZha2VfcmVzZXRf
ZmFpbHVyZShzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpIHsNCj4gPiArCXN0cnVjdCB4
ZV9ndCAqZ3QgPSBub2RlX3RvX2d0KG0tPnByaXZhdGUpOw0KPiA+ICsNCj4gPiArCWd0LT5yZXNl
dC5mYWtlX3Jlc2V0X2ZhaWx1cmVfaW5fcHJvZ3Jlc3MgPSB0cnVlOw0KPiA+ICsJeGVfZ3RfcmVz
ZXRfYXN5bmMoZ3QpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgZGVidWdmc19saXN0W10gPSB7DQo+
ID4gIAl7Imh3X2VuZ2luZXMiLCBod19lbmdpbmVzLCAwfSwNCj4gPiAgCXsiZm9yY2VfcmVzZXQi
LCBmb3JjZV9yZXNldCwgMH0sDQo+ID4gQEAgLTEzNSw2ICsxNDUsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9pbmZvX2xpc3QgZGVidWdmc19saXN0W10gPSB7DQo+ID4gIAl7InN0ZWVyaW5n
Iiwgc3RlZXJpbmcsIDB9LA0KPiA+ICAJeyJnZ3R0IiwgZ2d0dCwgMH0sDQo+ID4gIAl7InJlZ2lz
dGVyLXNhdmUtcmVzdG9yZSIsIHJlZ2lzdGVyX3NhdmVfcmVzdG9yZSwgMH0sDQo+ID4gKwl7ImZh
a2VfcmVzZXRfZmFpbHVyZSIsIGZha2VfcmVzZXRfZmFpbHVyZSwgMH0sDQo+ID4gIH07DQo+ID4N
Cj4gPiAgdm9pZCB4ZV9ndF9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9ndCAqZ3QpIGRpZmYg
LS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPiBpbmRleCA3YzQ3ZDY3YWE4YmUuLjc0NmQ2NWM0
YWFjYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gQEAgLTE2OCw2
ICsxNjgsNyBAQCBzdHJ1Y3QgeGVfZ3Qgew0KPiA+DQo+ID4gIAkvKiogQHJlc2V0OiBzdGF0ZSBm
b3IgR1QgcmVzZXRzICovDQo+ID4gIAlzdHJ1Y3Qgew0KPiA+ICsJCWJvb2wgZmFrZV9yZXNldF9m
YWlsdXJlX2luX3Byb2dyZXNzOw0KPiA+ICAJCS8qKg0KPiA+ICAJCSAqIEB3b3JrZXI6IHdvcmsg
c28gR1QgcmVzZXRzIGNhbiBkb25lIGFzeW5jIGFsbG93aW5nIHRvIHJlc2V0DQo+ID4gIAkJICog
Y29kZSB0byBzYWZlbHkgZmx1c2ggYWxsIGNvZGUgcGF0aHMNCj4gDQo+IEBSb2RyaWdvDQo+IFRo
aXMgZmVhdHVyZSBpcyBwdXJlbHkgdG8gc3VwcG9ydCB0ZXN0IHRoZSBkcml2ZXIgYW5kIG5vdCBz
b21ldGhpbmcgd2hpY2ggaGVscHMNCj4gZGVidWdnaW5nLiBJIGFtIGNvbmNlcm5lZCB3aGV0aGVy
IHN1Y2ggY29kZSBzaG91bGQgYmUgcGFydCBvZiBwcm9kdWN0aW9uDQo+IGJ1aWxkLiBJIGFtIHRo
aW5raW5nIGlmIHRoaXMgZmVhdHVyZSBvciBhbnkgc3VjaCBwYXRjaGVzIGluIGZ1dHVyZSBjb3Vs
ZCBiZSBtYWRlDQo+IHBhcnQgb2YgYSBrZXJuZWwgY29uZmlnLCB3aGljaCBjYW4gYmUgZW5hYmxl
ZCBpbiBDSSB3aGVuIHRoZSBkcml2ZXIgaXMgc3ViamVjdGVkDQo+IHRvIHRlc3RpbmcuDQo+IA0K
PiBSZWdhcmRzLA0KPiBCYWxhDQo+IA0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==
