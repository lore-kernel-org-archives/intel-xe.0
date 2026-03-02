Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA7EB3641
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 23:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04EE10E5E8;
	Mon,  2 Mar 2026 23:07:27 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB3210E5E8
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772492842; x=1804028842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b8zP6TK+0ZkAjWzwZrN9hFCCQwSZuNfTIjg3Sx3T9Gw=;
 b=Hik3nmOVLZXKyK00CxPkKGfSS+RxK5r3B83lsLU/mTYyX76KR7SLkrjD
 mfykXQO/TuZTpUZSZaaV58pzJzvIPxV+GXCu9eR52oAJIu/+WaKOxu1l5
 UaLDnv4FiWVECJO+BG2I0QFuhX9qqqkunD3WEZZNTRvyohPuLbC8UrjZL
 ISLY4R+3kwpydKYhYWR7Jl/tWBalykrJ08Abum2r/7+iVQE4dLhRvX51F
 ASihWLs71l+tIIbX+YxWP5PAE6vl9NZyBL1YsRvqwx0L5JIM0VW1fIOE+
 vV3dad+6FxW6TlCDq3ypDV2qjWKvmyjLH5fQf2ZuX4ZxUlkKTLPMewzj/ w==;
X-CSE-ConnectionGUID: FF4EBCAlQbuWL6BKNmMEkg==
X-CSE-MsgGUID: KVeMD0D0R5igvcrwX+MVig==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84154231"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84154231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 15:07:11 -0800
X-CSE-ConnectionGUID: nFSw5/LzSnyko4wJQE9eJg==
X-CSE-MsgGUID: ZuMwSG/pR3GMlxiH1udLbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214960162"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 15:07:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 15:07:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 15:07:11 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 15:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR54TOEMGLD6cUrMf7d+eiGkGtEjsXsbX+UJiUEDxKbXtZs3+SEV6Bt+2idocEXvmtGUCtPtve5eH8yBXyBFg/kLRKQL9uVTqWYED+5SWezQQ3vb4ZQJOStb8MU5eL14eoXuJGNrdnu/GpSLHHXaC3bWfEqsRrGrBqJZ272IUJWcQHjALz5I2G0aVVtJMDeBDWeMmp5MkG8Lp7jiolVP3kO/3EUWRmXKlfr4r9WNdSK2BKMFuu0f9FlONNIqP/IUjd4GkFYsWnOfgsh1aH/SjXkeAUK+Tr/PCp+yilwMthBGaGtCOOeAul/Tuo10uuuY2+nwkzMJDAzP9KqM8RgiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8zP6TK+0ZkAjWzwZrN9hFCCQwSZuNfTIjg3Sx3T9Gw=;
 b=ZcWU7dvJZu9O3JlPoJVJRsQHiw58vb5v2VAgZUw1+j4DG6ShafjR2TneYFrXHpDoxZAHuDYWSwwrNVVG9ucBfHKDffprDn8Ty7XTi5EtPpFy+IPWZc6/MGSvM0+se5p7WZaYHVAZiys3SdWsqhO4O1l9HqsFGMOfKKYewVFRZsKKDp1sPHlq3uNikXHwGQBLWYrhlYt0tNxlUpwnu6p9DFTvArP5crrRYLHTGdLN9Jvmm7FAiIcrj7WjECnQ5gXqFdZVoe+hifDg2R357xNLQcrksKg/dM25Je0M+NsDEQioJECtOqbGiGrRU+CGVvvag4gujXCpfxJ7k544unBXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS4PPF8B2A2E830.namprd11.prod.outlook.com (2603:10b6:f:fc02::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Mon, 2 Mar
 2026 23:07:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 23:07:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Topic: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Index: AQHcqnEtmc97brNi5U2RgvFIjjvkgLWb2hMA
Date: Mon, 2 Mar 2026 23:07:08 +0000
Message-ID: <DM4PR11MB54568FCCFAA9BBED0EDC4C10EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
In-Reply-To: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS4PPF8B2A2E830:EE_
x-ms-office365-filtering-correlation-id: cedacc74-dceb-4d1c-57e1-08de78b06df2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: f7vyhZpnzoS7+RJBNYnNHabMSCMNuRuy98vIJf+8czThx80GplWzGNip6e/Es++PTdwuVC3IL4rvGLK465cgp0nZXcLgnbQ/sFM/c6XkaHlV/KSX01y+bWovZTPeACQ0TSnZsScM8QqODGgcmjY6ig/Q4TDPQ8TLgZipwLYV4XqcfI0BszCcLqQ2apPjHnA0xzEZTVwAHmBPk/XtVKPdFeJzmHbvVQdyvKHIfi/civqY1c45JhO51OKg0t5hhobDodPdnTBAzHyq6rF7h9hnKRY3iqKJjTUDOw+szqzP+pITcBpJAe5MvwG886BoYEnDHxoWLeNxd68EYRj2ZXEP9AMC1V0+0nAWZtjvxFOEVm86Q7RtF7sNlgmGOTdhgPv2M/eDRHvqJVNO/lt7wwa9juOsJfISCOJ7Kh8WncHz9b55OZY7M9PUekVNihvEJAVlXi60tpMmc4O2MCMIPhScXkQ8mJHYC3CTknAV+nBmOWQy5LkVseOVsFlLBBTxBv0on7m1FeOEUTJMHdCpkbur8f6cdT3bfGkVcMkwFudkr56dnsJYQxmtipNRlHQgNn+upQwwPSiLxD0Z8vJuzFeVQkbCz2ITXtkDU4J9oBqvClc8/QqwOpYcAaUt5OaD3YRcJVmnTuZBQ1xxvfo/pznEJz4dw0K0Wp1omj0bgHj0+eEGG1gwY+7gUb+Lpv+LcxjF2oOD+JWp/5JD1MOGEN+fx86caAUAvOuBg1ZZqGwwsLhKoj10O6pnXRP53cA9u9MoZR0ltdA+nSgjdfoCYJdQNYbNYkv5EuGk/o1G9DCI+7o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nmx5c3RNdXpMSzdlbkgwdnQ2UVdINnVtWnl4UkJtSUpDOXNER3hPTmNLZVVX?=
 =?utf-8?B?TmI0c0t0VCswSXFuR0Y2d2lkVXBRODFDeFdQN25raVZ4UmRiODVyY2srSVR1?=
 =?utf-8?B?anNBcmxOeGtJL2FvbzA0bXI4cWxCbHp4OHFOQnJjZEhEM1lENFk5STI0Uk9h?=
 =?utf-8?B?end3M0Y5TmtTL0R0bG5TajhSS1UxM0dyejViM3ErbGRRa2xUelhqaGhhbUc0?=
 =?utf-8?B?N0VEMDNDN1lwZVhpTkk4WS83VkpoNFoyQW9aV1ZoRHZTYklJVlBWelJDTGth?=
 =?utf-8?B?TG96TENPTGdwT1N4M3B1andLWEJHVlJTc0JwMk8wcUlpTTlSMFFpendURjkw?=
 =?utf-8?B?UGp6d09HZ0Rka3hHMHluN3hTVEZ3cmhsNmNkdWQ4NXBjVERBc2xlRE04Y3Ba?=
 =?utf-8?B?QnVMSnRTOEx6aTNhcHhkWEFCWmY2V2tKU3I5RlROWUJuUi9GNmlvb3VaNXRL?=
 =?utf-8?B?czM5WkV5ZDMwaVFjNUt5MnpXTmNsTnhvNVFsbjNTQVF1MEo2eEVVR0Z0dHY4?=
 =?utf-8?B?UStSMDJhWnN5Qlc3S1pvV1FyT1FOS0l6YXJZK3lraUhPWmk0WFdtV2VrdVAv?=
 =?utf-8?B?dWU0SVp6Rjliayt2VVJnRVhiUkliVDJMWDM0MG0yK2xkdXFVQUM2K2xnQTl4?=
 =?utf-8?B?Rkx2bUN1M2RYeUZrVW54enhGcjRDa3BXcHYzRUZXZVhnbGNwREZpWTVsL0ds?=
 =?utf-8?B?YlFNcm5qT3ZrNWtXa28yTFNlYXlVSkk5QVJTNm5iakdYdjNwakdZWDQrTDBV?=
 =?utf-8?B?MkloeVNnUTlMVUNtcUw0cm1Qc0MwUkZlK2xLR3YyTVI3WEIzekNrSWEySHNp?=
 =?utf-8?B?VG1aM2tCSHYyb1FGZjJ1eXZrYWtrYlJVaGZZV0pZcUxqQncwS2ZGOVpLWk84?=
 =?utf-8?B?SXdJU1Zka1IyS3h1NTFTYTR5WldsUVlmTWJqSFd0a2JxRFF4T1JSRUN5SXNS?=
 =?utf-8?B?VVRjdlB5N2d5bHhyQTd4Umpia2t5dE9mcGVWSGtNZXVzaVQ0RVY0cTEvOUVl?=
 =?utf-8?B?NkVXTUJLVjVqNkpaV2F2VVpQeTdmN1RwdG1YdUtITzcxLzhnOThpRFNPaHB0?=
 =?utf-8?B?VmFLY3VFeFRtQ3pNbzFsa1dTbENzc2w0eG0yMkNwNUhqMUZvMEZrekxVTlZy?=
 =?utf-8?B?TnNQb2VtWGxuZHQ3bmJ1YUJOb0F5c04xcjBKSjBjT0wzaDdETzZBTU0xRlVi?=
 =?utf-8?B?eTFDWllWTVNJdTQvajFUVmtYK1pDK09lekwvdURybG9OOFZFSG9aTWhDVUZI?=
 =?utf-8?B?YW9DUXNTamlJWkdrc2t1VVdiR3RFVExUNnRGSmxzZ3BKakU5T05ITmRyVFhW?=
 =?utf-8?B?d2dJZWpFQlJ3V3FzNzBZSWhseVFPOWNvWDlWZFFsN2N3T0pxd2liYXh5U1E3?=
 =?utf-8?B?ZlR2dnY1ZWdIZUdxVVltWDlOcmplR0dQL0Q2S3haNmV2SnU5enlHUWR5M3hY?=
 =?utf-8?B?MXRPNXRNMnM0SkVGK3IvbjVua0o5WGQxTkxvdXJmSmZSc1IvTUs2TVNXY09D?=
 =?utf-8?B?cmhDc2ZOMUhCMmpuVDN6eUNkNzlodE9TTnZJOHN3ajRPWHlsUDUvKy9iUkRt?=
 =?utf-8?B?YVA1QjY4c3VCajB6MVFmRmIrQWx5bWRaeUtITDdSY2dEVnBPZDdDTjJyTnVL?=
 =?utf-8?B?VG1Sa1RUQkhMTGI5ZEVJM1VQUXcwMFcvbUhMczJoVGhMWkMzUDB6M3UxMWhL?=
 =?utf-8?B?TGMxWTVoMy8wbG4yQnE2dVYzYWdnUFhqK29yYk1WWTg3MGFnbDRvdGJaRzJr?=
 =?utf-8?B?VFltRjJad2FVTFhlSjBnY2hCeWg0WDV2d0d6ZEsrUy92WHRJcnVTVS9VMzc0?=
 =?utf-8?B?MkN3TnhONGZkNlhUMEpjalZxbjBNMVZueVZnd3RKUzF0Nm9jN1JFcmMrZVZC?=
 =?utf-8?B?RC9qOGJOQXlyK3VtYXdOblFuZ3Q1Y0R5SWNmZ0FkV2NiOUxvYWo5QWh5L1oz?=
 =?utf-8?B?V1V3N1RjS2tkSUR1cnVEbXFwakxtQnNEM0l2TFNHckNOT3NoMUZSbHFaRGt2?=
 =?utf-8?B?MVZTYUpxelozVFdrcDFiOW9BTTNsTEwyS0JtWVVZTE1jWC9GYVBVMVRIclNr?=
 =?utf-8?B?MncrRldnL1N2aVQzcEV6aDBJR3ByWVZmTUZ6WDVVL2k4ZUZRTExkUkt4Wmlm?=
 =?utf-8?B?YXIvWFNRbndPYnVtRHhJYnlVR1V1TG5mUkFncGFBYzNyZE5SNjB6NVhlOXky?=
 =?utf-8?B?ZHV3WTU1NUxWaTNTQ3RiZzI2eUhVWHFobDFpYmpFVnJCTlFGcDM1aFZVb2p4?=
 =?utf-8?B?VHFCc1BIRzVPajRsVVNkZmdqeENyUVdUOHZEOVBtRHRaY0k5aTJyL3lrK0l4?=
 =?utf-8?B?bXdPRHN2NGR1aTRTZXhxUmhPK3JMd2NSRnFWOTBFTzBKQ05CUjhjdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedacc74-dceb-4d1c-57e1-08de78b06df2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 23:07:08.6898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xcOdlh69zisJCquJydD8nQuKpiMioFhf6ECjhChx5PPtsfiiF+MF8dBNAqVjrCZ9WCCb8OeHEje4DVNXtU18ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B2A2E830
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

T24gTW9uLCBNYXIgMiwgMjAyNiAxMDoxOSBBTSBHdXN0YXZvIFNvdXNhIHdyb3RlOg0KPiBXaGVu
IG1lZGlhIEdUIGlzIGRpc2FibGVkIHZpYSBjb25maWdmcywgdGhlcmUgaXMgbm8gYWxsb2NhdGlv
biBmb3IgbWVkaWFfZ3QsDQo+IHdoaWNoIGlzIGtlcHQgYXMgTlVMTC4gIEluIHN1Y2ggc2NlbmFy
aW8sDQo+IGludGVsX2hkY3BfZ3NjX2NoZWNrX3N0YXR1cygpIHJlc3VsdHMgaW4gYSBrZXJuZWwg
cGFnZWZhdWx0IGVycm9yIGR1ZSB0byAmZ3QtDQo+ID51Yy5nc2MgYmVpbmcgZXZhbHVhdGVkIGFz
IGFuIGludmFsaWQgbWVtb3J5IGFkZHJlc3MuDQo+IA0KPiBGaXggdGhhdCBieSBpbnRyb2R1Y2lu
ZyBhIE5VTEwgY2hlY2sgb24gbWVkaWFfZ3QgYW5kIGJhaWxpbmcgb3V0IGVhcmx5IGlmIHNvLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBTb3VzYSA8Z3VzdGF2by5zb3VzYUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfaGRjcF9nc2MuYyB8
IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfaGRjcF9nc2MuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2hkY3BfZ3NjLmMNCj4gaW5kZXggMjljNzJhYTRi
MGQyLi4xY2FjMDBjMTdkNGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNw
bGF5L3hlX2hkY3BfZ3NjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
aGRjcF9nc2MuYw0KPiBAQCAtMzksNiArMzksMTIgQEAgc3RhdGljIGJvb2wgaW50ZWxfaGRjcF9n
c2NfY2hlY2tfc3RhdHVzKHN0cnVjdA0KPiBkcm1fZGV2aWNlICpkcm0pDQo+ICAJc3RydWN0IHhl
X2d0ICpndCA9IHRpbGUtPm1lZGlhX2d0Ow0KPiAgCXN0cnVjdCB4ZV9nc2MgKmdzYyA9ICZndC0+
dWMuZ3NjOw0KDQpJZiBndCBpcyBOVUxMLCB0aGlzICImZ3QtPnVjLmdzYyIgaXMgYWxyZWFkeSB1
bmRlZmluZWQgYmVoYXZpb3IuDQpJIHdvdWxkIHByZWZlciB0byBtb3ZlIHRoaXMgYXNzaWdubWVu
dCB0byBhZnRlciBiZWxvdyBjaGVjay4NCg0KPiANCj4gKwlpZiAoIWd0KSB7DQo+ICsJCWRybV9k
Ymdfa21zKCZ4ZS0+ZHJtLA0KPiArCQkJICAgICJub3QgY2hlY2tpbmcgR1NDIHN0YXR1cyBmb3Ig
SERDUDIueDogbWVkaWEgR1Qgbm90DQo+IHByZXNlbnQgb3IgZGlzYWJsZWRcbiIpOw0KPiArCQly
ZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICAJaWYgKCFnc2MgfHwgIXhlX3VjX2Z3X2lzX2F2
YWlsYWJsZSgmZ3NjLT5mdykpIHsNCg0KQlRXLCBpZiBndCBpcyBub3QgTlVMTCwgdGhlbiBnc2Mg
Y2Fubm90IGJlIE5VTEwuIFNvIHRoaXMgIiFnc2MiIGNoZWNrIGNvdWxkIGJlIGRyb3BwZWQuDQoN
ClNodWljaGVuZw0KDQo+ICAJCWRybV9kYmdfa21zKCZ4ZS0+ZHJtLA0KPiAgCQkJICAgICJHU0Mg
Q29tcG9uZW50cyBub3QgcmVhZHkgZm9yIEhEQ1AyLnhcbiIpOw0KPiANCj4gLS0tDQo+IGJhc2Ut
Y29tbWl0OiA0MGU1MmVkNmM2NmNlZjA5MTU3OWRkN2ZlNDljY2QyZGUxMzVmNWM1DQo+IGNoYW5n
ZS1pZDogMjAyNjAzMDItY2hlY2stZm9yLW51bGwtbWVkaWFfZ3QtaW4tDQo+IGludGVsX2hkY3Bf
Z3NjX2NoZWNrX3N0YXR1cy0wNzE4OThiOGE0MDINCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0N
Cj4gR3VzdGF2byBTb3VzYSA8Z3VzdGF2by5zb3VzYUBpbnRlbC5jb20+DQoNCg==
