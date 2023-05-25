Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774F0C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 13:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BB910E160;
	Thu, 25 May 2023 13:28:17 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E3410E160
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685021295; x=1716557295;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=2eTZ9DsP8uS4x/KXt6U6hW/BBfdmpxB5998IXLA4zZA=;
 b=VW1RxmiGwMtQfm/OhtRYfY8miEhbGEwCPbxf61UvLH2f6FbCxOmWmuBa
 vOvUolwKiZiapp+DVxLzVn5UoIchxkPV9zYP85vPaOgoDwiibqPX503uZ
 JTm3R2zaEnHproxqIGcGMp1JsJHr1mSTIM99pczcZRO0BZacBJTl6soXQ
 f7vRKW45RPbBjwK50psy7igktmGWMVPNy2szcLaOkUtwGXPnxoQAnX02w
 a+XJG16519OE+pV/LUmSt4A8gCbHBbSlBATyJlawyndqqyNdmwtHYy9gX
 Ls8OFNZi8UB37CzJC0Ivk7KX8gA5K/zbGnfhbdFBo0iDgJ5DUJ6c4Ny6o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382131686"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="382131686"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 06:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="708005766"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="708005766"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 May 2023 06:28:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 06:28:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 06:28:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 06:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvlLdrUuik5A4I4pN75W1xEWgSJGZcG5mvHQnr+fn4jxE23pSFM5Is4dR9MtEazoWksobMLQkz2CtNWc2P/bKYorOoIuDVMMBurHey0qZrUHMPWNP2tP+TEV1rFKIjKleA0hoMigE9OI8cSb6qrlEw9Q+iUhPOtf4Jyp5WwKhrcPbGK3JNhmIf7skBT/4ICPOkDEiOOCuQStGTn/4sL1nrAPu7TbWYECstPYwJdfqfyrnW3eUslSGAdan2hXPU8XQtwuk747kRQXVYRaSC2xdZ77b/rvTJ1hKvucQIQ0VCVEiSH1wlHlS0djPea9Q2HjQoA96FYMiLCzspNSmUc/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eTZ9DsP8uS4x/KXt6U6hW/BBfdmpxB5998IXLA4zZA=;
 b=fleG/LBDFZR0l90soVARIDH7I/EJ+M/z29wG07OiwgItcsgjkp0Q9Tg68+0xAV1eVDeTSDdBfsBnyPWImWxgRiPO/9lwkNace5cdchQO8925DDNgSQjPZavx7kYciGwzVjfYB1W/FcG0xOlihxiVDBEGgHHOiEiz28EyIBKk87+O0GdDnss60qDyJ8XuLtuPYazx6PWY5K1MC+cYHA6Tn6q0YryBmoFWPwU5C7R4DhvUPDquHGtuAqDtMmrJJDQ9SojkCbS62tFTUA97lUw+ucD27oqsakIjmYgJf8fcfZ48tl0e0kD2cWMzg7jPhP0kvqH9qOt5slj2FRS7yr25lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 13:28:12 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 13:28:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "kode54@gmail.com" <kode54@gmail.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Yu, Effie" <effie.yu@intel.com>, "Hazubski, Filip"
 <filip.hazubski@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally invasive
 way
Thread-Index: AQHZjqwfKfiIn+DR10+1CO+1iyKMRa9q+zoAgAAA6gA=
Date: Thu, 25 May 2023 13:28:11 +0000
Message-ID: <9172b79a6c6549b354957ce72a078544e717cd8d.camel@intel.com>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
In-Reply-To: <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5216:EE_
x-ms-office365-filtering-correlation-id: 2dcddf46-c316-4f8f-b647-08db5d23e338
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uSMYIsrHK6FEA+exBb70rxRiV42N2vAf96Y8iXzp0+SxAsoWbjOPnvQiI4eak2SIC8BDwAd0Qw881s/7SvKr6JqWDzpSfhGabb2iOfAx0wYswVVtzv3qs3u81jxAiEySY0WSe2sK04LfmdN43SuM2oNFAdD+lNl9CpAjY32+S/d8Mxt/5JHDXoKmA/mpFXX8u7DHwiXJ2/0IgL08hwaFcS0UtT9rW7sGF5H5shPI+52Qxf7iQBFmys6qHPeFwducLB/o8rOuZwfoaEuD96xGl991cXkzPgX27A0X9vSevUA0CsE7c26gT2YcUXYH4hAnTLjLAwo4JQ/a1du3KYAMXw/W0OBf77KZNbLSXBovNeuI4xWHBT3p7Uj0iPFjvwfeTTOMnTBuIEGiQJwnIGWcLZ6VqBNjtAq8z/g/E4DEpBNs3nXrzmVtrkuczISNxwOSK5gqiTH/qkEQIrcL78EYQHb93nCaQzypfzB8BLeWraFeCfohdePV67pg099vubie9k8BNs4viADeMQbKOvbP+yyZzhaEIOxat74AvAIhwqO59CMGS/bpkunj+4+yU3f3a+q42eZTqn3orNnTHWmLRWH5UE+x+Mfnj8k/+M2KcqkKAw2d7qVkBqr7LEUNirj2ModyLNz4TIPclgHIspGtFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(26005)(6512007)(6506007)(5660300002)(8936002)(8676002)(478600001)(86362001)(38100700002)(82960400001)(122000001)(921005)(38070700005)(110136005)(15650500001)(76116006)(6486002)(2616005)(41300700001)(91956017)(36756003)(66476007)(66446008)(66556008)(64756008)(6636002)(83380400001)(2906002)(186003)(71200400001)(316002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjR5Yk92Q09TU3dGcFFyUUQxei9YOEpYUUdxTFFLTVQ1RnM0M3ZSbTh5QnNk?=
 =?utf-8?B?L2xWUTVwUWxxc3ROMy8vZllCay8xdEdRQW14bHZmckl1dlB0R0pSRThjT3kz?=
 =?utf-8?B?UlRtQ3N1d3laTXludERzNnJCZ1d4TUVLNkZJdHRhclRNU2lTZWVTTHB6NEVo?=
 =?utf-8?B?U1Y2a1VRMkdQNXB4TmNCRjB3SDl3d0NqeDVQT1dwOHFLTGg3a0Y3Sit4aXF4?=
 =?utf-8?B?UHYwK2p0b0dRUWxNcVRHNTVCVXZLNHFjR1l0VGxseGZGclljS0F6MTMxLzRn?=
 =?utf-8?B?d1ZCZDkxNzV1WjVsRjlDVDBHeEdLdFd3M1dQOVMzOGdCS0ZyWUo3bWpNV1Q0?=
 =?utf-8?B?anJRSno3ZTk0NmhDd2h4TW5jcjQ5Q3hTK2VjSUJJejZvUjdCeURoY1FLMTFV?=
 =?utf-8?B?YlEyY05xL3NkcktQOGlXUWxET2VWV0U3dW9sNStEKzd4UjhYKytFb1RaUHpa?=
 =?utf-8?B?U3QvaTJFbVVYR1k1T3lzMlFGREJzMytqZDVTUDZCQTdqd3ZWZnE0QXpJU25h?=
 =?utf-8?B?dTlrY01JY1V4T0didUZJNElTYzd6TDFOMGlhS3Q4Z3dXSVpnZlZWbWw3MmIr?=
 =?utf-8?B?MDM5b1F6eVB2TWdFMXppWVViRjR4QjBEazhtKytuTmFrSTYraWtCa2g1T1Nr?=
 =?utf-8?B?alZXZzhDR1dMREE4UXhSTjBFMnk3QUJTMENsUHR6ZWRZOG5YdXgyc2gxZURE?=
 =?utf-8?B?SFUwZCtvOUpIYksvMDNCMzA2Q3dhRHNoVXdmc3RBNVNpbnNmTHdqWnRnNk1k?=
 =?utf-8?B?SGs5RHFRT05qeVd1dGwvbU9HVnd5bXk3c1NzWjVKUm9HU2l5TTB3MGplS25I?=
 =?utf-8?B?bTJHdmJKWFgyMW1iaHE3SW51ZmRqOExZdWdleko3RWNaSGZ2TDFpOVdIN0hG?=
 =?utf-8?B?cVphVXZPK0ttVHlaRDd3Qkd3K1B6bTlIQTlHcDFQQ1kwYjdUcXdIZHdFbjNJ?=
 =?utf-8?B?NGdaWS9uL0FaSDRvMXIrbXpLbDlMUS9qL0NjUUlqbm1vVHhwak91K0hGZGtF?=
 =?utf-8?B?RkU2NzVsMDF6ampnNlR5ekZ3WXRndjdJL0srTVF0NFVDZDNab2lLc2oxTnl0?=
 =?utf-8?B?ZnBHZnZOOUZSNUlEeWE3ZTZiRHRmY2htS2hOMGFxcHJBbEo2cXVsd2pmZHZh?=
 =?utf-8?B?cnZveDRQcXRLRXF1K0YvMlI2RmZ5RzBhbVlIOEY0ME9VeThySHNkb3NPci9B?=
 =?utf-8?B?UUgvQTF5ckZ1SVlRN1lOai8zUEZsV05GaHhnS1B3UE1ldFZlVE8rZnlESmh4?=
 =?utf-8?B?MjVDWGJyb1lCUGpFOUM4anptY3UvRnF2OU9sY0F2Q2RMU0x2L1RCMzEwVUpi?=
 =?utf-8?B?QXVJcUFOQU91RnZocEgzdFUxQ0tNQTFVSW9IY2QxYllsMWYyT3JTU3ZKdkJs?=
 =?utf-8?B?S0xKSWhySGVvTXlKb3R4MHljcENKOWZBUSthdzViTG1SaThXa0VrKzNrdmhE?=
 =?utf-8?B?QkpEL0VkSVdpTE4rbW9icFR6dzRWM1dNZC82QWlFODMvbUtwRTdhR1ZneHlv?=
 =?utf-8?B?TWZTeE5GenExb01NalZpVVVldlN2TTdhTW5kUHFpczk2cnBzbStHc1N1S0hy?=
 =?utf-8?B?SlB1dEowVTZpVmVGbWpHZFdSZ3ZWSmdRbFBBbEJGNStyWGN6K3k3YzJaLzlO?=
 =?utf-8?B?Q2xrY1paNVFSSGJueG9iUlpBczh3b0V6c3FGUEVNdWhWdFZobVM4bVZaWUJi?=
 =?utf-8?B?a1pRSnJLVlRrcEhpK2pqcTZjeWs5aVcxL1U2UmhZMS9hRFcyY00vYnhiNkFS?=
 =?utf-8?B?OTBMYUdaTEhjRkxtaGxFT2k4S0ZOSHBwdVM1c0ZNbGZ2Y3FlRC9NQXdPNHZj?=
 =?utf-8?B?djZ1NDBRcVBWcE1GZTBuTmhtazRpZHlEUXJ4T1VwOFgydFhDYkhtL0FqNTVY?=
 =?utf-8?B?b1FRY1dOVUZFRWNFTHkvaW5OZ0orWjJ4VnIrNkR6bmhOd2xMQUxiN1BSZzNJ?=
 =?utf-8?B?NUl3YmRTYktiSk9CQnV3NldTZStwTDIzU2E4ZkR6YkFzcnlQcmlGckxRRzdM?=
 =?utf-8?B?aW1nUVVKUjFRNENaQ0tJZ2IvVUdxUWljaGIzdHY1SzNibDIwd1FTaXh3OUZ0?=
 =?utf-8?B?NE9DMEdGQzJGYlRMZVp3VFo5Vk9zdWVnL1N1dUV5TVpFa3BsOHhMVkVSY1V0?=
 =?utf-8?Q?CioP8QVa+0mhzgHJMrI7K/yuf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B22710A581ED1C4C8AC072342C1977A3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcddf46-c316-4f8f-b647-08db5d23e338
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 13:28:12.0098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EViar571tu3UUBSQu3JBsFUiud2sBRsZlKSLA9DAHcR7GXSsnt62SURbB1VKn56omYVTCuzLVOP8vj/CnWQy3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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

K0NDIGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20gKFJvZHJpZ28gaXMgb24gdmFjYXRpb24pDQoN
Ck9uIFRodSwgMjAyMy0wNS0yNSBhdCAwNjoyNCAtMDcwMCwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSB3cm90ZToNCj4gSGkNCj4gDQo+IFBsYW5uaW5nIHRvIHB1c2ggdGhpcyB0b2RheSwNCj4gQ2hy
aXN0b3BoZXIgYWxyZWFkeSBoYXZlIHNlbnQgdGhlIE1lc2EgTVIgYW5kIElHVCBwYXRjaCBzZXJp
ZXMuDQo+IEl0IHNob3VsZCBub3QgYnJlYWsgNjQgYml0cyBBQkkgYnV0IHdvdWxkIGJlIGdvb2Qg
dG8gdXBkYXRlIGludGVsLWNvbXB1dGUgYW5kIG1lZGlhIGFzIHdlbGwuDQo+IA0KPiBPbiBXZWQs
IDIwMjMtMDUtMjQgYXQgMTg6NTYgLTA3MDAsIENocmlzdG9waGVyIFNub3doaWxsIHdyb3RlOg0K
PiA+IFRoaXMgc2VyaWVzIHRha2VzIG9mZiBmcm9tIG1sYW5raG9yc3QncyBhdHRlbXB0IHRvIGRv
IHRoZSBzYW1lLCBleGNlcHQNCj4gPiBpbnN0ZWFkLCBpdCB0cmllcyB0byBiZSBhcyBtaW5pbWFs
bHkgaW52YXNpdmUgdG8gdGhlIG9yaWdpbmFsIHVBUEkgYXMNCj4gPiBwb3NzaWJsZSwgYnkgb25s
eSBpbnNlcnRpbmcgcGFkZGluZyB3aGVyZSBhcHByb3ByaWF0ZSB0byBlbnN1cmUgYWxsDQo+ID4g
MzItYml0IG1lbWJlcnMgYXJlIDMyLWJpdCBhbGlnbmVkLCBhbmQgYWxsIDY0LWJpdCBtZW1iZXJz
IGFyZSA2NC1iaXQNCj4gPiBhbGlnbmVkLiBUaGlzIHNob3VsZCBoYXZlIHplcm8gZWZmZWN0IG9u
IDY0LWJpdCBob3N0cyB2ZXJzdXMgNjQtYml0DQo+ID4gdXNlcnNwYWNlLCBzbyBleGlzdGluZyBu
YXRpdmUgc29mdHdhcmUgd2lsbCBvcGVyYXRlIHRoZSBzYW1lIHdpdGggb3INCj4gPiB3aXRob3V0
IHRoZSB1cGRhdGUuIFRoZSBvbmx5IHJlYWwgY2hhbmdlIGlzIDMyLWJpdCBjb21wYXQgc3VwcG9y
dCBmb3INCj4gPiBtdWx0aWxpYiB1c2Vyc3BhY2UsIHdoaWNoIHdhcyBwcmV2aW91c2x5IGJyb2tl
bi4NCj4gPiANCj4gPiBBbHNvIGludHJvZHVjZXMgZmllbGQgdmFsaWRhdGlvbiBhZ2FpbnN0IGFs
bCBvZiB0aGUgcGFkZGluZyBhbmQNCj4gPiByZXNlcnZlZCBmaWVsZHMsIHdoaWNoIG11c3QgYmUg
emVybywgaW4gYSBzZXBhcmF0ZSBjb21taXQuDQo+ID4gDQo+ID4gdjI6DQo+ID4gICBSZW1vdmVk
IGV4dGVuc2lvbnMgY2hlY2tzIHdoZXJlIHRoZXJlIHdlcmUgbm9uZSBvcmlnaW5hbGx5LiAoSm9z
w6kpDQo+ID4gICBNb3ZlZCBleHRyYW5lb3VzIHBhcmVudGhlc2VzIHRvIHRoZSBjb3JyZWN0IHBs
YWNlcy4gKEx1Y2FzKQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoZXIgU25vd2hpbGwgPGtvZGU1NEBnbWFpbC5jb20+DQo+ID4gDQo+ID4gQ2hyaXN0
b3BoZXIgU25vd2hpbGwgKDIpOg0KPiA+ICAgZHJtL3hlOiBBZGQgZXhwbGljaXQgcGFkZGluZyB0
byB1QVBJIGRlZmluaXRpb24NCj4gPiAgIGRybS94ZTogVmFsaWRhdGUgdUFQSSBwYWRkaW5nIGFu
ZCByZXNlcnZlZCBmaWVsZHMNCj4gPiANCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMg
ICAgICAgICAgICAgIHwgIDYgKysrLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2lu
ZS5jICAgICAgICAgIHwgMTggKysrKysrKysrKy0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlYy5jICAgICAgICAgICAgfCAgNCArKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21taW8uYyAgICAgICAgICAgIHwgIDMgKystDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jICAgICAgICAgICB8ICAzICsrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lu
Yy5jICAgICAgICAgICAgfCAgNCArKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMg
ICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKy0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm1fbWFkdmlzZS5jICAgICAgfCAgNCArKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3dhaXRfdXNlcl9mZW5jZS5jIHwgIDMgKystDQo+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmggICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAg
MTAgZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+ID4g
DQo+IA0KDQo=
