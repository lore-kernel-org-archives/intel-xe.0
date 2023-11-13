Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7867C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECC010E234;
	Mon, 13 Nov 2023 21:53:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147C610E234
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699912386; x=1731448386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3BbLmJ0MxjTTW7vOAelJIXUH7+EcYBHj2EbiFWvrLow=;
 b=BGm7rFWyOf6AJIa/LAbhWHvtbr/Omsr/vki7UVcMPBU7/6FoTMOnT1hH
 rE14pQCY7tbXunTl4iLG063QQECz8ZgaQon3JcYCTDn446riIb1h3Kpyh
 pyY9Y8diCwSi3hcpHPMgwUKEr18xkXAMtTt+V5NbE9qbBR5wpGA8FVphU
 02O5J3Y97pmn8dN6llUDJbvjKhW1BYWBydVorZEx1oBOTRpAQgyQj8J7b
 qXzoP6lVRPJi1JMqKE7JI+5jG6SS0obU7G7xQHqEbmUPzLFs2Qz3Z2lYr
 3oG+fY0BDrkhhRtouyB8uIu843zZLTPjnb+UO5zKjicU+88cG6uM4A696 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454812667"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="454812667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 13:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5581077"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 13:53:02 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:53:02 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:53:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 13:53:02 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 13:53:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyRRPX41pZg/KH3udpb2b3Zq7Yi1HnDA4aTS8r/Yg8yJ5BVwqDui7kRT0xmS2+5hArGLmRBWNFGuSAVqEQi9eqpEoW0RC90+/XYxGc2EX3O4ElMXfWfbtshwkb7ut4aKtLSGyi5OK2nfA1JNk3WSXnglxIlWGl1bdKPK4QPXI4PJ6djSPHML0zqWEAbfbUXn9jbjGPHI3TCvO20GfX4iWUDzFt6cLWz8XSBtQXcxFSpjp774S6fNW9P88QgBs0Stj0mxI02e9BdVNHTf65S81E76w9Q54u2O+OhwVcObOhB8ugpRjyT9nHOPuyr7YiVNDIm2VWQ/sErmrSbvSihU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BbLmJ0MxjTTW7vOAelJIXUH7+EcYBHj2EbiFWvrLow=;
 b=V1nNyeDxZg5rsDha4OtroDMwd5ZbA8UaAac/OwphWipVRxyXY7DY6DH3+vymRcD5tm3fBIRjzaWNXvGSrd5VXET9+e/hTxzv/ZuxH2ZGoup9XICRLWq/znJ3dpU5IuB6FgxbXMrVj6bGW8xGY8fmIWj31r9vJcordamhvIKk54sIx46aoD73KnSAXnX3iXF2uTXp+yVuNErGT/uvzOThfm6MuJfwqb8n0bA07MXH+HrUs5bpUNoBoUfFqRpjoiYyrbaKAxfqpzPfd99FzS8xIxBhnUDcIZIIdXRde6F/fTIHvVSxcuavOZjgntZU6ccgWtyFRP4V/fjjE/khP4sEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 21:52:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 21:52:59 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Maarten@mblankhorst.nl" <Maarten@mblankhorst.nl>
Thread-Topic: [Intel-xe] [PATCH 4/4] drm/xe: Implement VM snapshot support
Thread-Index: AQHaBnTl2GZDq+DBU0Cw427HsUR/RbB46pyA
Date: Mon, 13 Nov 2023 21:52:59 +0000
Message-ID: <5364dc3dca455d0944bc5e92f8aba4110417c299.camel@intel.com>
References: <20231024122256.19512-1-dev@lankhorst.se>
 <20231024122256.19512-5-dev@lankhorst.se>
In-Reply-To: <20231024122256.19512-5-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: 27333c9d-5354-4932-a110-08dbe492e727
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YE7Eu0+AxpbDJhcISyMjLcv0XbTnhXhTFwQlwZUWD1INu8gOt91kHmwUQia6EjCRXk/1j81BjHdesZDoV5FrofNpbvayHoUUaDMH6JcpSEJ3c3ezE2W8SBfyC/Zz7h9f2jlmbvPWavejCRkGhnRXVadcvd3pbGE9WCLDzdAkystWxvLFLPxxjppvr89WJfih+rU23d4FXXI+eR2rlKQosafYFXWBnqYUmphU5i02QQYflrDpB4dmyksBUWM5adyIG18ozbh7zmSmKzIY7Px9jlT3bxw5N5RLD+VsL9uDjqH5UXKQg3MYyefg3lq9H7/VByul5gATaHQIvqeZlaqi9cX6lC77FH4ohc7k6Nh2JfUxGz4yf7EvGauXwHnusXNLGZkr3v1GCOBF5KgsKZkiQqXD8XY6BX/iKym3/Hpn0GKx/sLnersdNrXhmAm2KnhBdQAeKfSJ9TdCDn77JAUFtXzbcb5R+qJd3R/hMhhUmirEPTH7D8g73qUP59T9wvkrkzrcd+hJ6h7h5zflcdBPyiDKIYUbakKtrhTri1p30qfcQPZZdc+kGb6gHoKhyQlSg3xKCx0us31yVX/I1ZE7a3bsYZjDik7hGT21QaIRtjX5fs8BlF823rkZmg3pUBdh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700009)(86362001)(2616005)(2906002)(41300700001)(5660300002)(36756003)(4001150100001)(4326008)(8676002)(8936002)(122000001)(26005)(83380400001)(316002)(6512007)(82960400001)(6486002)(91956017)(6506007)(76116006)(66946007)(71200400001)(38100700002)(478600001)(66556008)(110136005)(64756008)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTNhenBLVHc1bVhDa281VDhQNDZJQW1JbTdGVkswUENSRjJxZUV1a3RpejdB?=
 =?utf-8?B?Rkc4L3FtaVU1M01pM3BpV2tBZWZxMHZqOHk3UU1meDUwWDl4UGliTlpsUXpk?=
 =?utf-8?B?TGF4RFU4bmhydUN3eTIxaEZCeGFvN0lDNVZ2dnhURzBhSE5xQWtqVzFadUpr?=
 =?utf-8?B?MzdManNlanRMRWtsbnJWYzdXbGRJZEZXR1JhZXZ2bm1zSGpHQ016TExaeDIz?=
 =?utf-8?B?eFV3R05Jc3ZFS2ZIWVYzQzYzV2ZXTzgvMVpqbGxnOE5PVnFUdVd0UXpxTXA1?=
 =?utf-8?B?c2lvT2RlNlIvd3IzWEpCTzZwMGl5NThKOStlRlVBL2pyTm9Wci9rbW5XZm5o?=
 =?utf-8?B?encwb2JYSlJ0RDNsTnoxdDVObGZKV2d1d1gxMXZ4eWVaRXlXM3h4S3M5NDlu?=
 =?utf-8?B?bXNiYTVhc2JQL1FBNEwyZkRVMU9Md3hKMEhRYXJXbVRMUURnYjl1R2pUMTJw?=
 =?utf-8?B?MmdNbXkrTkJ4QXFTeVpKOHY1dXBmY2lTbzJlOEN3U0tnbXZ2UGlTenhNSWRD?=
 =?utf-8?B?ekFDMlN0eGoxMTg2d01sRmUrSGR2ai9CQk9qZFpJWFU1dVRtYU5pU2R1RUV3?=
 =?utf-8?B?V0JhcTM4bDhNNWMxWDdUN0x3eVRMNDA1QzU0NFZ2OEs5bWFFcStkZldVNmdB?=
 =?utf-8?B?NlgvaDB5a0hnVENFMm81ays3UnVQcS9MN2tacHVDeDdRSlpCOEk3SHdJbWdL?=
 =?utf-8?B?dDRRYUhPbVY5dFhuMUUxdWJ0N05nVUdzYVlhbHBGcEhzZ1JWUE5sV01wdDFU?=
 =?utf-8?B?RC9DaU9FUTZhb2F1Qlkwc0p3VnAyV2pFTzcrRVBRdGQ1Z01IUEpOZzVVZUg5?=
 =?utf-8?B?bG1HdXdjeGUyaFF2VjFtREI5WUxrU2V1WWwxUkxWUGQwMUU0c3ZBU29kL09M?=
 =?utf-8?B?Ky9Ha1BHdHFhT1JJTkxhbit3a2RGWFJ2UXFxeDZuV3JNMGF4RnhSY281aU53?=
 =?utf-8?B?R0dEZFhqQUx5TU8yNldHWnNaNnRBTDg3czI1enN3WkRDclZ0U0xHZmY5L3FB?=
 =?utf-8?B?ZFB3SmZZQW1QOFRwQW42Rkx0VUNFWHdwOHRwd01INHprRFBJZitGT2ljUWls?=
 =?utf-8?B?Z0QrakUyZ1JSQVAzbmhMei9UQjFYOEFOZERpbGtET08xM3R4RzYwdEJyVzZ3?=
 =?utf-8?B?eHBrenpMbmd2Y0JvV1FDczR5NkdjZElpSFlreTg3Mm5vVy9IWkdsL1dTTUxX?=
 =?utf-8?B?TldrbjlvZEtvdmtuL3NBL0FjWDI2Qkh1ajExME4yOGVrMHBTOVE3b1lHVGw5?=
 =?utf-8?B?ZGV2cW5XZkhyMmtQUUZVN2lZUHFSSGgrVVNRRXJINVEzaFptZmpvaDNYQ1Zi?=
 =?utf-8?B?WWJiTzZobllETkZOOHdKS2R4U2JGMUpObWtBbWFtQW9ra1phaHNiMlhvTGNX?=
 =?utf-8?B?Mkl1ODFYbjkxQndhcUsyemcrVVdFcU5oZktkSmx6bjNjU0NTcmhrQm9QWkNM?=
 =?utf-8?B?QjdNNGtOOTFMSXNYVTZWZjB1Z1Q4eEdDa2ZDUXdSMm1RbUErYTlBRjF5K3ZH?=
 =?utf-8?B?SGwrN05jVVBsNHBvUFlrN25FMjJGbHk4Z3NGWHFaazZBM2JGQkdwQmxKWHp0?=
 =?utf-8?B?THVlOTJvZGkzbnlmY0s4L0tUeWlyQStVbVI5WHAwdWp0b2lJYUFkaGpzQTlN?=
 =?utf-8?B?Sm1rVDhwRzZHSkdOQWNjSFRxRHgwTmxwczI1YmZ6djE4aTVpbmxZTmhqc2ov?=
 =?utf-8?B?OVVlaTZJOEorOVI0RERZOG5vWmRHUGl5cTVLdTZmV0kydWxlTk9KQ2NYVTBD?=
 =?utf-8?B?TjBuL1psRVJxYmRFejZBTExVZjN3bWx3UWxoMUpXNUNsaFVOZ0YxMnVrb2RE?=
 =?utf-8?B?YkdURUFUaSsyUzJXaUVpTWJPR2V4U2lHckFvSmUwSmlNTkFmd1JjVlBYVGNr?=
 =?utf-8?B?VmZEcnltQmxueTdhYkNWV1g1aVRTTEpRQnVPM1Jld0lZamtQMHliNE9OQkEy?=
 =?utf-8?B?WFZUWStLRHFqdDNrZlNadGZBU3l2YTdRVHlJRFg4eTRXcDV3ellBeFBLOW5N?=
 =?utf-8?B?endESEdEN1Q4bTQ0aVdmWFFPdjdLQjlxcHVMaWU2SFpIZDJzTzg3eWc0NjZ6?=
 =?utf-8?B?RHBZL3dHa3pPNGZqblVJZnhrWDh4WHVYK2hrbFRTQnJpelNzbnZ4UHl4SlJC?=
 =?utf-8?B?MEZBMkpGeS9iVHY4Sy9veHVIb3dMWEx3ZGxXeVplZ240bXN6MHlZMnJGYWl6?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA31FB9E69D43419BF0E4D3155F7F55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27333c9d-5354-4932-a110-08dbe492e727
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 21:52:59.7339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XlvX68JE5HIRihWXRJQQsAlFiURx78mLiTsAI0JL90C5WB31GLVTBCIWDXNo9N+E0yjxE74itnsKymTM1xYWhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Implement VM snapshot support
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTI0IGF0IDE0OjIyICswMjAwLCBNYWFydGVuQG1ibGFua2hvcnN0Lm5s
IHdyb3RlOg0KPiBGcm9tOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jICAgICAgIHwgICA5
ICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMuaCB8ICAgMiAr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgICAgICB8IDExMSArKysr
KysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCAgICAgICAg
ICAgICAgICB8ICAgNCArDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCA2OGFiYzBiMTk1YmUu
LjI5OGJlMTYyZWQwYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNv
cmVkdW1wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4g
QEAgLTE2LDYgKzE2LDcgQEANCj4gICNpbmNsdWRlICJ4ZV9ndWNfY3QuaCINCj4gICNpbmNsdWRl
ICJ4ZV9ndWNfc3VibWl0LmgiDQo+ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+ICsjaW5j
bHVkZSAieGVfdm0uaCINCj4gIA0KPiAgLyoqDQo+ICAgKiBET0M6IFhlIGRldmljZSBjb3JlZHVt
cA0KPiBAQCAtOTgsNiArOTksMTAgQEAgc3RhdGljIHNzaXplX3QgeGVfZGV2Y29yZWR1bXBfcmVh
ZChjaGFyICpidWZmZXIsIGxvZmZfdCBvZmZzZXQsDQo+ICAJCWlmIChjb3JlZHVtcC0+c25hcHNo
b3QuaHdlW2ldKQ0KPiAgCQkJeGVfaHdfZW5naW5lX3NuYXBzaG90X3ByaW50KGNvcmVkdW1wLT5z
bmFwc2hvdC5od2VbaV0sDQo+ICAJCQkJCQkgICAgJnApOw0KPiArCWlmIChjb3JlZHVtcC0+c25h
cHNob3Qudm0pIHsNCj4gKwkJZHJtX3ByaW50ZigmcCwgIlxuKioqKiBWTSBzdGF0ZSAqKioqXG4i
KTsNCj4gKwkJeGVfdm1fc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90LnZtLCAmcCk7
DQo+ICsJfQ0KPiAgDQo+ICAJcmV0dXJuIGNvdW50IC0gaXRlci5yZW1haW47DQo+ICB9DQo+IEBA
IC0xMTYsNiArMTIxLDcgQEAgc3RhdGljIHZvaWQgeGVfZGV2Y29yZWR1bXBfZnJlZSh2b2lkICpk
YXRhKQ0KPiAgCWZvciAoaSA9IDA7IGkgPCBYRV9OVU1fSFdfRU5HSU5FUzsgaSsrKQ0KPiAgCQlp
ZiAoY29yZWR1bXAtPnNuYXBzaG90Lmh3ZVtpXSkNCj4gIAkJCXhlX2h3X2VuZ2luZV9zbmFwc2hv
dF9mcmVlKGNvcmVkdW1wLT5zbmFwc2hvdC5od2VbaV0pOw0KPiArCXhlX3ZtX3NuYXBzaG90X2Zy
ZWUoY29yZWR1bXAtPnNuYXBzaG90LnZtKTsNCj4gIA0KPiAgCWNvcmVkdW1wLT5jYXB0dXJlZCA9
IGZhbHNlOw0KPiAgCWRybV9pbmZvKCZjb3JlZHVtcF90b194ZShjb3JlZHVtcCktPmRybSwNCj4g
QEAgLTE1MSw2ICsxNTcsOCBAQCBzdGF0aWMgdm9pZCBkZXZjb3JlZHVtcF9zbmFwc2hvdChzdHJ1
Y3QgeGVfZGV2Y29yZWR1bXAgKmNvcmVkdW1wLA0KPiAgDQo+ICAJY29yZWR1bXAtPnNuYXBzaG90
LmN0ID0geGVfZ3VjX2N0X3NuYXBzaG90X2NhcHR1cmUoJmd1Yy0+Y3QsIHRydWUpOw0KPiAgCWNv
cmVkdW1wLT5zbmFwc2hvdC5nZSA9IHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2NhcHR1cmUo
cSk7DQo+ICsJaWYgKHEtPnZtKQ0KPiArCQljb3JlZHVtcC0+c25hcHNob3Qudm0gPSB4ZV92bV9z
bmFwc2hvdF9jYXB0dXJlKHEtPnZtKTsNCj4gIA0KPiAgCWZvcl9lYWNoX2h3X2VuZ2luZShod2Us
IHEtPmd0LCBpZCkgew0KPiAgCQlpZiAoaHdlLT5jbGFzcyAhPSBxLT5od2UtPmNsYXNzIHx8DQo+
IEBAIC0xOTQsMyArMjAyLDQgQEAgdm9pZCB4ZV9kZXZjb3JlZHVtcChzdHJ1Y3QgeGVfZXhlY19x
dWV1ZSAqcSkNCj4gIAkJICAgICAgeGVfZGV2Y29yZWR1bXBfcmVhZCwgeGVfZGV2Y29yZWR1bXBf
ZnJlZSk7DQo+ICB9DQo+ICAjZW5kaWYNCj4gKw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
Y29yZWR1bXBfdHlwZXMuaA0KPiBpbmRleCA3ZmRhZDljM2QzZGQuLjkzYzJhZDdiZGM1NCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmgNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmgNCj4gQEAgLTMz
LDYgKzMzLDggQEAgc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBzaG90IHsNCj4gIAlzdHJ1Y3Qg
eGVfZ3VjX3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBzaG90ICpnZTsNCj4gIAkvKiogQGh3ZTogSFcg
RW5naW5lIHNuYXBzaG90IGFycmF5ICovDQo+ICAJc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hv
dCAqaHdlW1hFX05VTV9IV19FTkdJTkVTXTsNCj4gKwkvKiogQHZtOiBTbmFwc2hvdCBvZiBWTSBz
dGF0ZSAqLw0KPiArCXN0cnVjdCB4ZV92bV9zbmFwc2hvdCAqdm07DQo+ICB9Ow0KPiAgDQo+ICAv
KioNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggYjQyY2ExMDY5YzViLi4xMzQ5NGM4MWU5NjQgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0zMzI5LDMgKzMzMjksMTE0IEBAIGludCB4ZV9hbmFs
eXplX3ZtKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IHhlX3ZtICp2bSwgaW50IGd0X2lk
KQ0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICsNCj4gK3N0cnVjdCB4ZV92bV9zbmFwc2hv
dCB7DQo+ICsJdW5zaWduZWQgbG9uZyBudW1fc25hcHM7DQo+ICsJc3RydWN0IHsNCj4gKwkJdWlu
dDY0X3Qgb2ZzLCBib19vZnM7DQo+ICsJCXVuc2lnbmVkIGxvbmcgbGVuOw0KPiArCQlzdHJ1Y3Qg
eGVfYm8gKmJvOw0KPiArCQl2b2lkICpkYXRhOw0KPiArCX0gc25hcFtdOw0KPiArfTsNCj4gKw0K
PiArc3RydWN0IHhlX3ZtX3NuYXBzaG90ICp4ZV92bV9zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4
ZV92bSAqdm0pDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9uZyBudW1fc25hcHMgPSAwLCBpOw0KPiAr
CXN0cnVjdCB4ZV92bV9zbmFwc2hvdCAqc25hcDsNCj4gKwlzdHJ1Y3QgZHJtX2dwdXZhICpncHV2
YTsNCj4gKw0KPiArCW11dGV4X2xvY2soJnZtLT5zbmFwX211dGV4KTsNCj4gKwlkcm1fZ3B1dm1f
Zm9yX2VhY2hfdmEoZ3B1dmEsICZ2bS0+Z3B1dm0pIHsNCj4gKwkJaWYgKGdwdXZhLT5mbGFncyAm
IFhFX1ZNQV9EVU1QQUJMRSkNCj4gKwkJCW51bV9zbmFwcysrOw0KPiArCX0NCj4gKw0KPiArCXNu
YXAgPSBrdm1hbGxvYyhvZmZzZXRvZihzdHJ1Y3QgeGVfdm1fc25hcHNob3QsIHNuYXBbbnVtX3Nu
YXBzXSksIEdGUF9OT1dBSVQpOw0KPiArCWlmICghc25hcCkNCj4gKwkJZ290byBvdXRfdW5sb2Nr
Ow0KPiArDQo+ICsJc25hcC0+bnVtX3NuYXBzID0gbnVtX3NuYXBzOw0KPiArCWkgPSAwOw0KPiAr
CWRybV9ncHV2bV9mb3JfZWFjaF92YShncHV2YSwgJnZtLT5ncHV2bSkgew0KPiArCQlzdHJ1Y3Qg
eGVfdm1hICp2bWEgPSBncHV2YV90b192bWEoZ3B1dmEpOw0KPiArCQlzdHJ1Y3QgeGVfYm8gKmJv
ID0gZ2VtX3RvX3hlX2JvKHZtYS0+Z3B1dmEuZ2VtLm9iaik7DQo+ICsNCj4gKwkJaWYgKCEoZ3B1
dmEtPmZsYWdzICYgWEVfVk1BX0RVTVBBQkxFKSkNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJ
CXNuYXAtPnNuYXBbaV0ub2ZzID0geGVfdm1hX3N0YXJ0KHZtYSk7DQo+ICsJCXNuYXAtPnNuYXBb
aV0ubGVuID0geGVfdm1hX3NpemUodm1hKTsNCj4gKwkJc25hcC0+c25hcFtpXS5ibyA9IHhlX2Jv
X2dldChibyk7DQo+ICsJCXNuYXAtPnNuYXBbaV0uYm9fb2ZzID0geGVfdm1hX2JvX29mZnNldCh2
bWEpOw0KPiArCQlpKys7DQo+ICsJfQ0KPiArDQo+ICtvdXRfdW5sb2NrOg0KPiArCW11dGV4X3Vu
bG9jaygmdm0tPnNuYXBfbXV0ZXgpOw0KPiArCXJldHVybiBzbmFwOw0KPiArfQ0KPiArDQo+ICt2
b2lkIHhlX3ZtX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV92bV9zbmFwc2hvdCAqc25hcCwgc3Ry
dWN0IGRybV9wcmludGVyICpwKQ0KPiArew0KPiArCXVuc2lnbmVkIGxvbmcgaSwgajsNCj4gKw0K
PiArCWZvciAoaSA9IDA7IGkgPCBzbmFwLT5udW1fc25hcHM7IGkrKykgew0KPiArCQlzdHJ1Y3Qg
eGVfYm8gKmJvID0gc25hcC0+c25hcFtpXS5ibzsNCj4gKwkJc3RydWN0IGlvc3lzX21hcCBzcmM7
DQo+ICsJCWludCBlcnI7DQo+ICsNCj4gKwkJaWYgKHNuYXAtPnNuYXBbaV0uZGF0YSkNCj4gKwkJ
CWdvdG8gcHJpbnQ7DQo+ICsNCj4gKwkJLyogQ2FwdHVyZSBkYXRhLCBidXQgdHJ5IG9ubHkgb25j
ZSAqLw0KPiArCQlpZiAoYm8pDQo+ICsJCQlzbmFwLT5zbmFwW2ldLmRhdGEgPSBrdm1hbGxvYyhz
bmFwLT5zbmFwW2ldLmxlbiwgR0ZQX1VTRVIpOw0KPiArCQlpZiAoIXNuYXAtPnNuYXBbaV0uZGF0
YSkNCj4gKwkJCWdvdG8ga3ZmcmVlOw0KPiArDQo+ICsJCS8qIFRPRE86IExvY2tpbmcsIFZNQVAg
bWFnaWMgZXRjIGhlcmUuLiAqLw0KPiArCQlkbWFfcmVzdl9sb2NrKGJvLT50dG0uYmFzZS5yZXN2
LCBOVUxMKTsNCj4gKwkJZXJyID0gdHRtX2JvX3ZtYXAoJmJvLT50dG0sICZzcmMpOw0KPiArCQlp
ZiAoIWVycikgew0KPiArCQkJeGVfbWFwX21lbWNweV9mcm9tKHhlX2JvX2RldmljZShibyksDQo+
ICsJCQkJCSAgIHNuYXAtPnNuYXBbaV0uZGF0YSwNCj4gKwkJCQkJICAgJnNyYywgc25hcC0+c25h
cFtpXS5ib19vZnMsDQo+ICsJCQkJCSAgIHNuYXAtPnNuYXBbaV0ubGVuKTsNCg0KVGhpcyBuZWVk
cyB0byBoYXBwZW4gaW4geGVfdm1fc25hcHNob3RfY2FwdHVyZSgpIGxpa2UgaTkxNSBkb2VzLg0K
DQoNCj4gKwkJCXR0bV9ib192dW5tYXAoJmJvLT50dG0sICZzcmMpOw0KPiArCQl9DQo+ICsJCWRt
YV9yZXN2X3VubG9jayhiby0+dHRtLmJhc2UucmVzdik7DQo+ICsNCj4gKwkJaWYgKGVycikNCj4g
KwkJCWdvdG8ga3ZmcmVlOw0KPiArDQo+ICtwcmludDoNCj4gKwkJZm9yIChqID0gMDsgaiA8IHNu
YXAtPnNuYXBbaV0ubGVuOyBqICs9IDY0KSB7DQo+ICsJCQl1aW50MzJfdCAqeCA9IHNuYXAtPnNu
YXBbaV0uZGF0YSArIGo7DQo+ICsNCj4gKwkJCWRybV9wcmludGYocCwgIlslbGx4XSA9IHsgJXgs
ICV4LCAleCwgJXgsICV4LCAleCwgJXgsICV4LCAleCwgJXgsICV4LCAleCwgJXgsICV4LCAleCwg
JXggfVxuIiwNCj4gKwkJCQkgICBzbmFwLT5zbmFwW2ldLm9mcyArIGosIHhbMF0sIHhbMV0sIHhb
Ml0sIHhbM10sIHhbNF0sIHhbNV0sIHhbNl0sIHhbN10sDQo+ICsJCQkJICAgeFs4XSwgeFs5XSwg
eFsxMF0sIHhbMTFdLCB4WzEyXSwgeFsxM10sIHhbMTRdLCB4WzE1XSk7DQo+ICsJCX0NCj4gKwkJ
eGVfYm9fcHV0KGJvKTsNCj4gKwkJc25hcC0+c25hcFtpXS5ibyA9IE5VTEw7DQo+ICsJCWNvbnRp
bnVlOw0KPiAra3ZmcmVlOg0KPiArCQlrdmZyZWUoc25hcC0+c25hcFtpXS5kYXRhKTsNCj4gKwkJ
c25hcC0+c25hcFtpXS5kYXRhID0gTlVMTDsNCj4gKw0KPiArCQlkcm1fcHJpbnRmKHAsICJVbmFi
bGUgdG8gY2FwdHVyZSByYW5nZSBbJWxseC0lbGx4XVxuIiwNCj4gKwkJCSAgIHNuYXAtPnNuYXBb
aV0ub2ZzLCBzbmFwLT5zbmFwW2ldLm9mcyArIHNuYXAtPnNuYXBbaV0ubGVuIC0gMSk7DQo+ICsJ
fQ0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX3ZtX3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX3ZtX3Nu
YXBzaG90ICpzbmFwKQ0KPiArew0KPiArCXVuc2lnbmVkIGxvbmcgaTsNCj4gKw0KPiArCWZvciAo
aSA9IDA7IGkgPCBzbmFwLT5udW1fc25hcHM7IGkrKykgew0KPiArCQlrdmZyZWUoc25hcC0+c25h
cFtpXS5kYXRhKTsNCj4gKwkJeGVfYm9fcHV0KHNuYXAtPnNuYXBbaV0uYm8pOw0KPiArCX0NCj4g
KwlrdmZyZWUoc25hcCk7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oDQo+IGluZGV4IGIwOGM3NWZiZDhh
MS4uZWYyM2ZlM2MyZjQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaA0KPiBAQCAtMjMzLDMgKzIzMyw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB2bV9kYmcoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRl
diwNCj4gIHsgLyogbm9vcCAqLyB9DQo+ICAjZW5kaWYNCj4gICNlbmRpZg0KPiArDQo+ICtzdHJ1
Y3QgeGVfdm1fc25hcHNob3QgKnhlX3ZtX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX3ZtICp2
bSk7DQo+ICt2b2lkIHhlX3ZtX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV92bV9zbmFwc2hvdCAq
c25hcCwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gK3ZvaWQgeGVfdm1fc25hcHNob3RfZnJl
ZShzdHJ1Y3QgeGVfdm1fc25hcHNob3QgKnNuYXApOw0KDQo=
