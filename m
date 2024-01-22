Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DB7C47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311810E797;
	Mon, 22 Jan 2024 18:28:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06A510E797
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705948132; x=1737484132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GoUvBUHS3Z0h+jK7z6ZGTb0kryHslz103tQGAEmJejo=;
 b=YtIf7d6r5BXm4wZ7No45u9rVceeg2uLJDvTe1Lhy4dWa9BKCIXA0G2ls
 WsDARvjYwKfJ7t8PiTbOFbTbbikI/yTPQFV/1RA3CVRpPBqAwUcX22GHC
 RCLFOZ49uHWlFdtkRwdxosZDObE4uEPyc6k//y83Zu1IX6f8aajW6XRv7
 jaTfM6svmnJ1/+CfpvGGu2tooJWe7booOIdW+e1ITfWrqwl51ZIRhQL9g
 8Pui96I+myHhbOUV4iFJnVMmg7yTy5NwgtB4rAxDEG2YT7JP2asEEkHTP
 2QUe59Bk3fvlwxzc8DfYQZf283zfF6Ys9wYdj1b/TNK4yYQ6Y1PdxGAl1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8685227"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8685227"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 10:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="785757998"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="785757998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 10:28:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:28:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 10:28:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 10:28:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4T7VkwsU3M6A6O//utNgUGVe1ih+OcAr2zYmvAGXHX675P0wmrHwW/cG8UmCc0tc7u7O9WcaLOuLAKNzxPyrcjbBkF08zh5ycM/i0RmUl5Gljnb/PywiNbE0MKbdp3TURyGBGV9cIxz1sQ02E9JQU7MemFscWRuPBTbvLbvX3PzhWugPchjViaOV9IHzeDTnTEvNWKtHTnpcycWI5oNkl/49EPW89c3gSRuF9Y1MIUP+ZJHNFHIT3zNX9u2sIesg285l8kGPgt07q4TtNPAhqmrQKFpkxQFqV5fd/XdL2d9gEnfNh9lvV3nQUFiX9V18wc6a1ZN9n4eG4wH8JZ5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoUvBUHS3Z0h+jK7z6ZGTb0kryHslz103tQGAEmJejo=;
 b=DxKOWTZQ/APbwxC75yimbTvlNGHl1Msl7LjDdFymH1k6uc+bwDRuNAgCRiRjQuofUzpyJtQEXNm48kJdne5BGfWXERJec/IbEdTP7MDpemgYPUkOCISNWdvx2e8ila13wZRuBZvz8jFVTvp8mD1oj3mIzhM/drCClpm7r8o9U6tROcJWffXjEJhKlgDwUhtguzmNg/KYo2Izxf+buXsgCySwLiV38Pbcl6AoyMuVyNE8kVfzpuw+tV4MWpmW4CYCMYsKap7Y5UXe0n7Rvjc7MX+FJguD78M0EJDgUoZmCsRHLJH829kDnLMdkpGOE9UkGry/mHW7qY9XVeuW6Ew9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.32; Mon, 22 Jan 2024 18:28:41 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 18:28:41 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Thread-Topic: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Thread-Index: AQHaTVUzn8eR5aHqS0Gw+TXQ9At1RbDmJvoA
Date: Mon, 22 Jan 2024 18:28:41 +0000
Message-ID: <f787dab50690396e0cf1159da66321a85069009c.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7057:EE_
x-ms-office365-filtering-correlation-id: 201ca7e3-e4aa-4085-1209-08dc1b77f572
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2Bl3+y8L0UroqDzvALEsPDWG/IJDASTVYNQjxE8iNxBcpsu2fsAIWeQUFaqQQYFHaOAks+cQuFS6tZYeoHpkfjy4w2/bIOG0kl/7cjR/6VixrDcTnJjZC2nGXG+4BjNyCI/nFjJKvT/YDty0i3XD8e9f2go8+CU+NhCsbSsYSgeMNT17C9OIRTcjE2F6yE8SIG2phmY/w4kQW3RJXdzw/uznj4mkAWK/01umaBBOGXCAgyK9MdD2CtoteWBTazyXpapsI87FEPof+IMa7Crs9gcUpVuJfOWnqem5J1X0YCr/4/sdFaUKfddTR0Sqso+ZVz+3EGGltNqviONtuhBmMoJShTwcU0sDR+1wwxzXii37gqfIn62nxb3UGDcURsy8kAvcAXYLnOuvVy632rFHFSyNqoO07EyCy8EomypD8iXAgM4onnLWQ+0/EqzPhoFSuIl4lhFgsILDzQBTcoLemlqa3KJWt4EB2qAn1aOfAqS5mkePX3vboYd5ovB5X4yEjO2/yBB9E24B89HYPB+rI1EW1NJm6NiB7ZWgIOxry7Lct2uhi5BE59rA6tfJdLYzp+YhVPS+XEMGoG4M8NEIkO8M3K/Kdxvt3LP07EPeuio2VJkaHPpSwlAWO6qKT66
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(107886003)(2616005)(478600001)(83380400001)(6512007)(38100700002)(71200400001)(5660300002)(2906002)(6636002)(316002)(86362001)(66476007)(8936002)(6486002)(36756003)(41300700001)(76116006)(4326008)(64756008)(66946007)(66446008)(54906003)(66556008)(110136005)(91956017)(82960400001)(6506007)(122000001)(8676002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0Fyb21OZ0NzWTBlOGRZRE54MGp1ZjlPSzZBUGFnQmdhMDlPY2JRdGg3L1pR?=
 =?utf-8?B?VERMV0d1czNHK3FnY1pleGdiRUJIRnZiVEh6bVd5VDVJQmNSeFhOM1J6bGVN?=
 =?utf-8?B?M3BYNWFqM3dtbis5RG1qc3Z2M0xwU3ovSzJTa3VKcytBbGFDR2dGYnZSR0Vj?=
 =?utf-8?B?Smd4NVhGQ3g2cHArWUdQM2xRc1o5SHk5ekFSTkp1RFZTTk1DZHBDL2FvT0Qv?=
 =?utf-8?B?VzBKbDNHNEJ0UUk4dXBkTkt2WXlBZWR0U2QxanF5YVJLb3FiUENwRWRlTGF5?=
 =?utf-8?B?VUFXUExxdzI2Q05wcnhtVUNHK1U2VkpEeE14NG5BUVhCcHlWQmhjLzZlOTBI?=
 =?utf-8?B?MnN5aWRXa292bWxRY1EyZGJJRFp4ZHgzemNyK00wQ0wrZnBQWFlLWU85QmZu?=
 =?utf-8?B?czRhbzJYc2QyWkFKTVR4K1c4dDFwNUtkekpBMjI5UFNHUHV4OFFUTFc4Qkkr?=
 =?utf-8?B?QlRTWjRROXlaWjBWY2oxNVJ5NWVFQjdhay8vNnpmTUY1aGNOdTBuU25kYlFY?=
 =?utf-8?B?WHZ0cThSb2YyQ2p2Y3NMZmc3a1lXQkwwa1ZHeFoyaUxlcWt6aHFBY0RSVFJ1?=
 =?utf-8?B?eWtUM0lCUFlaNEpRL0pFcVh0YUtvMXNGOTkrNFpuQzdQWVFaV0JwWmNHbzY5?=
 =?utf-8?B?OTQ1bFpqNVJheEhrNm1aUStYZW9vUkduWkVoakxYUEllSitRTFN0Q0JDLzAw?=
 =?utf-8?B?ZmR3R0laRjBaMjRTWjhoVmgvY3hsSWNTNHFjQ0xLNk9SOW10SHRrQ1B1NDlX?=
 =?utf-8?B?NkxEOFRkS0NWWVVWM0FxamljNEJOa1NkbE5lOUFTL1dYK2NlSmYzcDlhalNP?=
 =?utf-8?B?d3BSVHA4cjYySm9idXFHRmgyVGVaZGlGQW01emMweTZYdjI4V3V6MS9SMno5?=
 =?utf-8?B?Uzg2bXo0cjh3L1pWQ0ZlcmdhZkFRc2tzUGJNOVloUlhMWmJoOFVBQml5VGZo?=
 =?utf-8?B?bWVnTVJPNTR4N1RYVytwZVBSRVp0ZFdXZEtJUDZXRHB5TWRtU1JtcXNGeHBX?=
 =?utf-8?B?MlRmZXBKZ2pjZWNYTlFhNzcwRUNKZ0gyY05XTjg5VWRnQnNQUVZKektmWFpK?=
 =?utf-8?B?OXM0RCtWY0JDWERrV3I4a0RuQ1NzRGxpc0FkQUYycVB1U3J1dGZuZWJ0dG95?=
 =?utf-8?B?cStkZGtMRlg0T2llbTUxV2wyK013NTJIL1MrSWtZM0hIdHArWVVJUFhJbjd0?=
 =?utf-8?B?VVUyYUY0cE9LMSs3R3dVUnI0ekxBcnAxM2kyRmVtQ2tBZFduaFdrOHpEQXcz?=
 =?utf-8?B?MDhJUUF6amprZ3pBcXcvQWVRYlRMNUt3WXV1V3VnUDRtait4WCt3WjRXZUE2?=
 =?utf-8?B?UGUzd0ZCSFFuamFUNXVFOFlXcEwxZG5qaHQxcTdLSEVPOEFHOUFLN1kva2ZO?=
 =?utf-8?B?RHRZbURDZU9ka1pLL2JSUlU2NFp2L3Zpc3RkdzJ3WS9CSXVSMFgyYXo3UGhF?=
 =?utf-8?B?MTJ4eTZKVW1SYnJic29qakpCZG54WDQ3QlBINmVhZTJ2L25Vcmh1NnI4Z2FO?=
 =?utf-8?B?Y216eHh1cGtvRFdDaDZhU2tSc3k4dmJYdHVxQTNpZXAwUDZGY0FsOGZUbUJp?=
 =?utf-8?B?UkpjWWlMNitjRXo1TU93MGl0VE9LdE5YOGRpMHU3ckQzL3ZqKzdQaFJsSThD?=
 =?utf-8?B?M2h0Wi9sZy9NL1gvREhKbUFlM056YmY1MmI2blBvVnJ5SWluRnh2R1lRdVd5?=
 =?utf-8?B?UDByZ0lKQXNOWVk4TjdhWjVKV2pKM2JzVXQyNVFXVTlIcjlpTUlVR0p6d2pz?=
 =?utf-8?B?OXhwSktwdGYwWWtZQTA5S1F3REUwSzM0TDlJQXlXSDh5SkZyck5jSkNMNmhs?=
 =?utf-8?B?WkwrZ1ArK2pTWE5yakpUMWdEWk9YV1lxR0svZDI4Tnd0QjMvU09RM1ErUkFK?=
 =?utf-8?B?dzNkbkk5VXU0cU12SlR5VVp6UCtmVlpIMXplejVIek1xN0VIS293bEtuSFlW?=
 =?utf-8?B?UjVzSU15Y3pGTVJIOTZMeWREMHZIZDNqY1FSRUNVSS9xSTlmU0VkV2xjcUFo?=
 =?utf-8?B?Ykk3eEZPS2xCVnp4OUU2TWMrejE1c3lyM0tsOXoyeWNWSys2WVVtWVhweW1B?=
 =?utf-8?B?NThyWkZkVWxLSUROWVRPdmV0WWJzQTkzV0I4SlpjMTQ3T3NLSk5TQ1BhYjBj?=
 =?utf-8?B?UWI0cTYzckRqbnorZmNBcnBrVmIvTTBVTFV5U2drSWk5TTB0aDUzMEIyYVIx?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <737BB4471AE63A4A88264D23EE918186@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201ca7e3-e4aa-4085-1209-08dc1b77f572
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 18:28:41.2359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66eewzMTvmDEY43bu8dPKKCpKzX8x6ItZXnPcapISvc4gg6CB24UEIiN2O84gMVlHbE+2w5LsyTC/E+wQh5BGjUitW0gf/ZHh69Bq0DGC3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDA5OjA0IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOgo+IFJpZ2h0IG5vdyBkZXZjb3JlZHVtcCBoYXMgYSBuZXcgbGluZSBiZXR3ZWVuICcq
KioqIEd1QyBDVCAqKioqJyBhbmQKPiAnSDJHIENUQiAoYWxsIHNpemVzIGluIERXKTonIHdoaWxl
IG90aGVyIHNlY3Rpb25zIGRvbid0IGhhdmUuCj4gCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Qu
c2U+Cj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMgfCA0ICsr
LS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gaW5kZXggZWU1ZDk5NDU2YWViYy4uMGMwNzM1NTY5
MDk0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiBAQCAtMTM2Niw3ICsxMzY2LDcgQEAg
dm9pZCB4ZV9ndWNfY3Rfc25hcHNob3RfcHJpbnQoc3RydWN0Cj4geGVfZ3VjX2N0X3NuYXBzaG90
ICpzbmFwc2hvdCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoc25hcHNob3QtPmN0X2VuYWJsZWQpIHsKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3B1dHMocCwgIlxuSDJHIENUQiAoYWxsIHNpemVz
IGluIERXKTpcbiIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHV0cyhw
LCAiSDJHIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ3VjX2N0Yl9zbmFwc2hvdF9wcmludCgmc25hcHNob3QtPmgyZywgcCk7Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wdXRzKHAsICJcbkcySCBD
VEIgKGFsbCBzaXplcyBpbiBEVyk6XG4iKTsKCldoeSBub3QgaGVyZSB0b28/CgpBbHNvIGp1c3Qg
dmlzdWFsbHkgSU1PIGl0IGlzIG5pY2UgdG8gaGF2ZSB0aGUgZXh0cmEgc3BhY2luZyBoZXJlLiBJ
CmRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiB0aG91Z2guCgpUaGFua3MsClN0dWFydAoKPiBA
QCAtMTM3NSw3ICsxMzc1LDcgQEAgdm9pZCB4ZV9ndWNfY3Rfc25hcHNob3RfcHJpbnQoc3RydWN0
Cj4geGVfZ3VjX2N0X3NuYXBzaG90ICpzbmFwc2hvdCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9wcmludGYocCwgIlx0ZzJoIG91dHN0YW5kaW5nOiAlZFxuIiwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90
LT5nMmhfb3V0c3RhbmRpbmcpOwo+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHV0cyhwLCAiXG5DVCBkaXNhYmxlZFxuIik7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wdXRzKHAsICJDVCBkaXNhYmxlZFxu
Iik7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoH0KPiDCoAoK
