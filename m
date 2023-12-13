Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD338C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 15:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63910E7D2;
	Wed, 13 Dec 2023 15:53:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B1010E7D2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702482806; x=1734018806;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VNy+qMx+Khy7OkFMX2wvtEIKNiiN1glGsGjueajiEGg=;
 b=MPf1XBoLLCc6gMQugoI4ZU7s0Nn8iT2B8L3DFBjUPpamIdfrwhH6mndf
 cHUYRF6W9T6FqST0JjQeITc7cPkH0601xleSwt3IMZj9DgDjJf30dfUWD
 2pcHbQpgw94z/723tgtTNUCxRXo5MZhKH3bAkIVgq/qDTvdONqZjVwHJM
 fy3ViFM0AxYlRtyi7YiPzB9JVwwis9mYMS/fVM+2sGrmURUBaKIYp0I9g
 vR1xeaZ9Gst7t3ESeyw/Vifv8XU+EI8saL8mg9omueIROqK2MbN+HNlAu
 Tp7zUCNu6/8YynXtNsjfpAjNMPv0r6uS22KGoCt9hmlQ2lf7ID9CkcB5C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2125441"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="2125441"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 07:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="750164176"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="750164176"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 07:53:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 07:53:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 07:53:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 07:53:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 07:53:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZDt6h7vqDOSjZAyXzFVwNdqlNZTjNQon1ylCjosuKSA5EtTxKhdQHnaQOFeKyQQYG+vwZaGU0wlut4+AqauXqRwLdgFCLpDEBGO5TmzTgs1ZQpjLR9ExOf+AmPkl4PvhfasSp0vzvUYnZOz8RsEM/cGgTvp6oYcY15Y6aPzyti8PP3rCTVpkf/JWYYJkqJ0uLUXn0aP09ITLWrJOoy//jJoQj0sMba2RQXNibWipEKRU9Zs6YqvCnrwbgYMB53SWVHIOW43bGeA3qf3KqWb5mCgmgXOBiec82PihsbKKTX5h3AaaoJiocPy8XcNvL01qJlZscqO+FCdSLcCtjsw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNy+qMx+Khy7OkFMX2wvtEIKNiiN1glGsGjueajiEGg=;
 b=dX68+5YC/ufYC3yHizWF0DAknLQQY4bza1nZ9A1efeGkngqiKVVDqy601RHbv0Madhp+9NT/LGIzgI/RTy6flLYcwE69cp/ht/M2iBqsFjobtvAkpHO9ZCdXu+TC/SeIHgDN5D+X8xAcOFLmQf/yDxbfQXT1h4A1GyzkDKc4sHMjUz5crZ+2Dt6SbdO+mssYN9+4rQBJkFlGfkxOBYv80vGA53YJUyPX6jLZEYHiXSjPa5X5TynOYpfikYAXFmPfuZDhXYOznK+LKTiI2Pj+bD9kXlayCEWrH8F4cj77OMFiV3KkMaX9mHXvtocnIFDxvr0KBdGISw4O4YWYvmyGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 15:53:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 15:53:06 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove vram size info from sysfs
Thread-Topic: [PATCH] drm/xe: Remove vram size info from sysfs
Thread-Index: AQHaLJEW6k7bMsZGREGjcpUHpTx/TrCmnHWAgAAR9YCAALFdAA==
Date: Wed, 13 Dec 2023 15:53:06 +0000
Message-ID: <5403be007f18a7df3e3dacb283794a4fb60185e0.camel@intel.com>
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ca95972f-2d5d-4fc6-bca3-e80f984e79cf@linux.intel.com>
In-Reply-To: <ca95972f-2d5d-4fc6-bca3-e80f984e79cf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|CH3PR11MB7370:EE_
x-ms-office365-filtering-correlation-id: 0a713b1c-5301-4f4f-def4-08dbfbf398c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYNw2LSdSYdQUAVdenbJFCSqiDJGioEF7lHHhOcJ8SMhx8wdde5kt6+6eUsp3lSmXq1h4KE7WZnfPMvh6KQV48OA3+/Vkr14TPXYf1M0ihKtcFbIWlzuDF3ZnASVCdChRkRepWnq8aJs1YZMOKTrA8IUOSr2z1xYe/+ecQr2iGR5oVv2b8+XY3I38NLhAakYGRBeC7nkT4OttUOzYTOt+xpkJGAMgYIbR9JfGjCuRBEhLmuNX25K5Z16/MUejUTrTOgmQjIq7NdErhErua8JEAv8tyHqJz+tXwYUK5Rt0BF5mPiIsUFa1854s7uuFnkT05Az4w1nGFqF1pt25Ow9vLI/+5PIY6b84ss8hlQJY9S/jd6rYx5TiX2amZFoLSu6sQk/wPrN+jYTorJ9dsV1lgbDmasCNSVu4uKJveypcAvFiKwU92PdF51GZOw4OAdMnKorirHH8kY9mlBkFDwzEgBCN9WndN5rkD5f3QyFJjJGXoXuc76NANIPvwtZmyaoU5Ku8Ck2+OX/UxiTX7/sVdNcUfuGuN7vyx8JZy4wrxNC0uAWsRARPEArMQRFvfcv6swHDjjVsfq9f35DmR/qhlmc8UPQ1V+6+f5rl8+rOKjre3WZ+jj3QkjOZC1TBx2Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(38070700009)(5660300002)(2906002)(4001150100001)(6512007)(2616005)(53546011)(6506007)(6486002)(36756003)(478600001)(71200400001)(122000001)(38100700002)(82960400001)(26005)(83380400001)(8936002)(86362001)(4326008)(66946007)(66556008)(66446008)(91956017)(64756008)(8676002)(66476007)(110136005)(76116006)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDRaVjQxTXl5bk5CUXVJcFJSYnlrcjBiNXRVS2pxdWhFZGFla09tai8raFk0?=
 =?utf-8?B?VW80bEdNNndYclVwMEVad1krS01UTFl2eVpkN2FXSWhpeStBQ21lVDZ5THk1?=
 =?utf-8?B?d08zU3VtMzIwczZ4MDhiL3RUcHQ2dkFMUk1ZYXBJMGNDd2t6akhjS2VXRk1q?=
 =?utf-8?B?ZVRscEVxd0N1MUFsRVc3NFVxemw0aFl2TXFSM2YvdXBWZk0wSTlvS3pEekl1?=
 =?utf-8?B?aHV2dXpQeEpJakJwdzVLR2RGZWVRck1tSUQrTDg4NDRRWUtja21CdWozZUNa?=
 =?utf-8?B?cEp0V3htVG9zRVQybEgrN3lpQmZSM2tZRy8yU25Nbm5zb0tEM2Z3QkF3Z1Bj?=
 =?utf-8?B?bCswY0huWXVTQ1R0VExCVHJNd1ZYSThvYUFYRmNzTGZPTDRqa0dJSFY3Qy9H?=
 =?utf-8?B?MUNrc0k1T1p1eUFnNDZoUHphZS8wUytqYTczNWFJdzErQzk4MUxrQ1F2U0VI?=
 =?utf-8?B?elV0cEFYYnV4bzhRWmxPWnJhdStpdExuU1paUW9UdlFDMG1NK3RCdWdlS0lJ?=
 =?utf-8?B?UU5vOXJlSXMzczl3aTJCbXVyMDUxbzREVVdjY2JIcC9mMUZ2a2VFWnd2Q0xu?=
 =?utf-8?B?bU1EZit2VnpHVGxKN1FxV1VWTkxDYVgrZlhRODJXVVdaNU5ueTRHV2tWaFBX?=
 =?utf-8?B?SkV2akFYSlQya2pNMDRFbkY2VmNZcW9rSjV3b0Y2RjV0UnpUVGl0Nk9qN2ZO?=
 =?utf-8?B?L1owYUNhb0c2a1lpQUUyTStGTHJIZ3pnR0FsRGR6WWtPNFJrVVFESkJpUTZo?=
 =?utf-8?B?Z1JROStuLzJkZXpONjhIVStNUC9OYkZJNjNlMHVyaXpHc3RzT2ZtNmpaNFps?=
 =?utf-8?B?TXMrQ2xGVVpnalhBb3ViNXZCNmxSbkd2d0trZWlPZEtxOHpSa3lqSEJuSG9S?=
 =?utf-8?B?cmlMT2xQdThOaVpFbUN4Skg2Yk91Z2YvV2p2eGdsOXkybjlSZVVUeVlLVFln?=
 =?utf-8?B?ajMvWnBHaFZHZmxCUno2SzRDRnVXSThtUnk0NjduWGgrL1k2SldseFJ5ampS?=
 =?utf-8?B?NmU3UndhOXAyMncrYlNURVgxbGh5TFdzSWdrU09JWUdEZE9wVDNTQXFFNnZF?=
 =?utf-8?B?ZnAxQ2xUb3hsdmh3aTRWYlpGSnljZkhDYnI3QW8zazNvY0FXaTkzcEdRcFkw?=
 =?utf-8?B?VGF3MExMMVpEV0VVR2NqQkMvd1JkRVJwQ2hQekpXNjJDeGF6Y2trRWt0SXpi?=
 =?utf-8?B?UmNwQzFVblVvSjFJRGxCMlZBSUg4aE1MNjZSd052bGkydk91K2x0VVR2TGVT?=
 =?utf-8?B?U2JFZ2ZwVTk5N2M4YUY1WCt3SlFJdWtUU0svaVhZTE52aXJ3VHgxejZFYlpS?=
 =?utf-8?B?U0w4VjhNNDYwVzNUUVJITENscUhuT20vdjdmZzR2YlF6MTVCckptZXIrT3FT?=
 =?utf-8?B?ODV1WFJNa1lHanZDb3czSTZic1Uvd08xallZci94RXh3aE1LeGYrOVFTNXFH?=
 =?utf-8?B?S2toUTdncGJ4NFRFOFhKYzBTWHJPdWRsOWFmTkdLa0tDTm12eDd0QTkvRDdX?=
 =?utf-8?B?RGxoV3BHWXo3UWNhbTEyS2tLb3BzMVk1S1VmR1orREJDYyt2dzh4dEp1TTRR?=
 =?utf-8?B?aVU0TGY3TWM3OEN2YTk5VkhJdG83amJERmVlbDN2UDJsa2U5SU14dDhZQngy?=
 =?utf-8?B?dTdWMHNHY1MycGFuS1JSMHhBbWUwcGRwTmVCa3RVbStRVHB2dFdIemZ1VGdj?=
 =?utf-8?B?dlV2czNxaFh6angxU3E3S1h1UmpGUFBmS25nQjFSSXZmeUZZcXgrUmtvOUox?=
 =?utf-8?B?TFlwVHE1bUZWQk0rbU9jVVFTY3QwajdEbWU1TnozZVVCTHhEcVNJbGJHalM2?=
 =?utf-8?B?YlBIcDIzSDhBckhsejNtR2FKVnlWTGh6MVZHRFpzUGxFMUIxV0p0eUhMM3BE?=
 =?utf-8?B?eFBhb3hPQXoyUDRXajU5VjliMktzQmNFSzNWMkpPTzdoQzNXT3lKTDRNc01t?=
 =?utf-8?B?eERyY2NGeWdjckMrQjNQSHdDYnZwS1BaV3I5TUpHYWg3akZZKzBjZDhEc3BH?=
 =?utf-8?B?ci8wWGxsc3J2MHEvSSs5SEpIZFRFL2M2a0JUenAxd3A0ZENwVDJ6RWN5ZlBj?=
 =?utf-8?B?SUl5bGhlNjBuOXgyWDV0ZnIvdStNNzZ0cGdodmJSVG0xOGFvdmhyQTZWZUgx?=
 =?utf-8?B?QndZdW9Md3h3R0hwNEVtU3lXTTVrWlVpcWpCU1g2dWRuWjY0bVlTTHdIMC9a?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <248E391ED7F2964F9F0297BE900D6861@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a713b1c-5301-4f4f-def4-08dbfbf398c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 15:53:06.1418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 585oAUXrJDddI6/stT1VwxKByJQec5kZmIBlPZmj2UOHe5kyzUg03SzVKXkG7F5gkYBy+YqoJJBz/O4M85oQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEyLTEzIGF0IDEwOjQ4ICswNTMwLCBBcmF2aW5kIElkZGFtc2V0dHkgd3Jv
dGU6DQo+IA0KPiBPbiAxMi8xMy8yMyAwOTo0MywgVXBhZGh5YXksIFRlamFzIHdyb3RlOg0KPiA+
IA0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEludGVsLXhl
IDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+ID4g
PiBPZiBSb2RyaWdvDQo+ID4gPiBWaXZpDQo+ID4gPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAx
MiwgMjAyMyA1OjUxIEFNDQo+ID4gPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4gPiBDYzogUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47
IFZpdmksIFJvZHJpZ28NCj4gPiA+IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4gU3Vi
amVjdDogW1BBVENIXSBkcm0veGU6IFJlbW92ZSB2cmFtIHNpemUgaW5mbyBmcm9tIHN5c2ZzDQo+
ID4gPiANCj4gPiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgYWxyZWFkeSBwYXJ0IG9mIHRoZSBxdWVy
eSBJT0NUTC4NCj4gPiA+IExldCdzIG5vdCBkdXBsaWNhdGUgaXQgaGVyZSBpbiB0aGUgc3lzZnMu
DQo+ID4gVGhpcyBwYXRjaCB3YXMgb24gcmVxdWVzdCBmcm9tIEwwIGFzIHRoZXkgd2FudGVkIGFj
dHVhbCBWUkFNIHNpemUNCj4gPiBpbmNsdWRpbmcgcmVzZXJ2ZWQgcG9ydGlvbi4gV2Ugc2hvdWxk
IGNoZWNrIHdpdGggVU1EIHRlYW0gaWYgdGhleQ0KPiA+IHJlcXVpcmUgdGhpcyBzeXNmcyBvciBu
b3QuIEkgd2lsbCBjaGVjay4NCj4gDQo+IEhpIFJvZHJpZ28sDQo+IA0KPiBBcyBUZWphcyBtZW50
aW9uZWQgdGhlIHN5c2ZzIGludGVyZmFjZSBleHBvc2VzIHRoZSB0b3RhbCBwaHlzaWNhbA0KPiB2
cmFtIGluY2x1ZGluZyB0aGUgc3RvbGVuIHNpemUgd2hpY2ggaXMgbmVlZGVkIGJ5IHN5c21hbiwg
aW4gdGhlDQo+IElPQ1RMIG9ubHkgdXNhYmxlIHNpemUod2l0aG91dCBzdG9sZW4pIGlzIGV4cG9z
ZWQuDQoNCkkgaGF2ZSByZW1vdmVkIGl0IG5vdyBzbyB3ZSBjYW4gZGlzY3VzcyBiZXR0ZXIgYW5k
IGVuc3VyZSB0aGF0IHdlDQphcmUgdGFraW5nIHRoZSBiZXN0IHVhcGkgZGVjaXNpb25zIHRoYXQg
YXJlIGFjY2VwdGFibGUgYW5kIHdvbid0DQpicmVhayB0aGUgY29tcGF0aWJpbGl0eSBsYXRlciBh
ZnRlciB3ZSBhcmUgbWVyZ2VkIHVwc3RyZWFtLg0KDQpUaGUgdGltZSB0byBicmVhayB3YXMgbm93
LCBzbyBJIHJlbW92ZWQuDQoNCkJ1dCB3ZSBjYW4gY29udGludWUgd2l0aCB0aGUgZGlzY3Vzc2lv
biBhbmQgc2VlIHdoYXQgaXMgdGhlIGJlc3QNCmFwcHJvYWNoLg0KDQpNeSBmaXJzdCBxdWVzdGlv
biB3b3VsZCBiZTogd2h5IGRvZXMgTGV2ZWwwIG5lZWRzIHRvIGtub3cgdGhlIHN0b2xlbg0Kc2l6
ZT8gU28sIHdoeSB3ZSBkb24ndCBhZGQgdGhhdCBpbmZvcm1hdGlvbiBhbG9uZyB3aXRoIHRoZSBx
dWVyeSB1YXBpPw0KDQpJdCB3b3VsZCBiZSByZWFsbHkgYXdrd2FyZCB0byBzZWUgYSB2YWx1ZSBp
biB0aGUgc3lzZnMgYXMgdG90YWwgbWVtb3J5DQphbmQgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCB2
YWx1ZSBvbiB0aGUgcXVlcnkgaW9jbHQ/IHRoaXMgc3RvbGVuIHBhcnQNCmFwcGFyZW50bHkgbmVl
ZHMgdG8gYmUgbW9yZSB0cmFuc3BhcmVudCB0aGVuLCBubz8hDQoNCj4gDQo+IA0KPiBUaGFua3Ms
DQo+IEFyYXZpbmQuDQo+ID4gDQo+ID4gVGVqYXMNCj4gPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0
aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZp
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMgfCAyMyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIyIGRlbGV0aW9ucygtKQ0KPiA+
ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMu
Yw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4gPiBpbmRl
eCAxNjM3NjYwN2M2OGYuLjBmOGQzZTdmY2U0NiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiA+IEBAIC0yMCwyMCArMjAsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGtvYmpfdHlwZQ0KPiA+ID4geGVfdGlsZV9zeXNmc19rb2JqX3R5cGUgPSB7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgLnN5c2ZzX29wcyA9ICZrb2JqX3N5c2ZzX29wcywNCj4gPiA+IMKg
fTsNCj4gPiA+IA0KPiA+ID4gLXN0YXRpYyBzc2l6ZV90DQo+ID4gPiAtcGh5c2ljYWxfdnJhbV9z
aXplX2J5dGVzX3Nob3coc3RydWN0IGRldmljZSAqa2Rldiwgc3RydWN0DQo+ID4gPiBkZXZpY2Vf
YXR0cmlidXRlDQo+ID4gPiAqYXR0ciwNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFyICpidWYpDQo+ID4gPiAtew0KPiA+
ID4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBrb2JqX3RvX3RpbGUoJmtk
ZXYtPmtvYmopOw0KPiA+ID4gLQ0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHN5c2ZzX2Vt
aXQoYnVmLCAiJWxsdVxuIiwgdGlsZS0NCj4gPiA+ID5tZW0udnJhbS5hY3R1YWxfcGh5c2ljYWxf
c2l6ZSk7DQo+ID4gPiAtfQ0KPiA+ID4gLQ0KPiA+ID4gLXN0YXRpYyBERVZJQ0VfQVRUUl9STyhw
aHlzaWNhbF92cmFtX3NpemVfYnl0ZXMpOw0KPiA+ID4gLQ0KPiA+ID4gLXN0YXRpYyBjb25zdCBz
dHJ1Y3QgYXR0cmlidXRlICpwaHlzaWNhbF9tZW1zaXplX2F0dHIgPQ0KPiA+ID4gLcKgwqDCoMKg
wqDCoMKgJmRldl9hdHRyX3BoeXNpY2FsX3ZyYW1fc2l6ZV9ieXRlcy5hdHRyOw0KPiA+ID4gLQ0K
PiA+ID4gwqBzdGF0aWMgdm9pZCB0aWxlX3N5c2ZzX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSwgdm9pZCAqYXJnKcKgDQo+ID4gPiB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X3RpbGUgKnRpbGUgPSBhcmc7DQo+ID4gPiBAQCAtNjQsMTUgKzUwLDggQEAgdm9pZCB4ZV90aWxl
X3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4gPiANCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqB0aWxlLT5zeXNmcyA9ICZrdC0+YmFzZTsNCj4gPiA+IA0KPiA+ID4gLcKgwqDCoMKg
wqDCoMKgaWYgKElTX0RHRlgoeGUpICYmIHhlLT5pbmZvLnBsYXRmb3JtICE9IFhFX0RHMSAmJg0K
PiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIHN5c2ZzX2NyZWF0ZV9maWxlKHRpbGUtPnN5c2Zz
LA0KPiA+ID4gcGh5c2ljYWxfbWVtc2l6ZV9hdHRyKSkNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkcm1fd2FybigmeGUtPmRybSwNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJTeXNmcyBjcmVhdGlvbiB0byByZWFkIGFk
ZHJfcmFuZ2UgcGVyDQo+ID4gPiB0aWxlIGZhaWxlZFxuIik7DQo+ID4gPiAtDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgZXJyID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZ4ZS0+ZHJtLCB0aWxl
X3N5c2ZzX2ZpbmksDQo+ID4gPiB0aWxlKTsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChlcnIp
IHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRybV93YXJuKCZ4ZS0+ZHJtLCAiJXM6IGRybW1fYWRkX2FjdGlvbl9v
cl9yZXNldA0KPiA+ID4gZmFpbGVkLCBlcnI6ICVkXG4iLA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCBlcnIpOw0KPiA+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gPiA+IC3CoMKgwqDCoMKg
wqDCoH0NCj4gPiA+IMKgfQ0KPiA+ID4gLS0NCj4gPiA+IDIuNDMuMA0KDQo=
