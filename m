Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C0C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 12:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EFB10F614;
	Mon, 18 Mar 2024 12:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKc1SMVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6412110F61D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710763783; x=1742299783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+ychor4JYE+tqXytgm91M4QXj8nkpUBjf1w3+q9KtVg=;
 b=eKc1SMVj3CnxIIptksQBzXhtzA71ZZCSbnnmi294vCUbDIFRyTaJ5r52
 iVEUHmWclT3ogqcBUCIatWCkEHe/OP+/x1BHNnmBQN+sK4YyPxMP61RFi
 tw1sBJBPnVO+vAeltT5TGWTN56rR7pIoIsdqCtJbzhsC0FPJSsCIb5bzy
 ULqrJV2Mjghx/BEz1B/aBVO5JjhNX1x3RRjyHBzLIwL56uy10PdHXnK9q
 Ab4JNKgbBEN7Y3Lux9Bif1H0zSThiMrmLFNoyuOCleLlMuSKXsLhrC8uy
 FbDceCKf9WprrLh0C9C9TChuasDDegYeZ8LDY+yza56Y+C590SzTPBR3L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5701325"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5701325"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 05:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18031271"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 05:09:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 05:09:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 05:09:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 05:09:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 05:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCLPngDWdqMsJ8ce/mOE8FKP8ukRZV4VcpU8/XNQtkpEx2gCp07pLJJ6pmPiIBBDxVcLAijhfFFBrs1+IIfEBFRLhvwq9w9DSXLE+oXlUPWhGvNHGMbST7kMU2TTd20oCz8V5XLTFGcP5DK8J24rYCUX79yrjRMb9hNJfXOvSgJUaQGt+JgvRJPFgqtBtv0qWtJMM/igmJZU5wpY0/xkafS0+IfFMTtpsDIeCn4Cn5QMGEQuqiAQ+EjXu1xgECBIvZGZEyWQUX5qljeBqqZtGFbnQDx/EZBSlgMNx3IXZP3MDvTMthfSZDKiipF/KRm0LqQ5wfnrwTQA7XsJ7cDsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ychor4JYE+tqXytgm91M4QXj8nkpUBjf1w3+q9KtVg=;
 b=D1K0n6EPIWJCHbR5i29JdR4tTlFh4RSkUlNKbeVh9Kk/H6OtgLvdRDGOAF8nqNriHDweeRvSySV/X6Jqhvjn9jNOVM3wjrurF68DRVqnzPy2Wj0EnpXTnvo7/TVwYNx0rv3wqhCIM26j7z2kRHe95zMvBk0CfXa4fdxFMyv4nvEIVDkuWas9qGRSFu2quUxvKSoazizVYPtb9TEnmtr4HHhiHQQys77Fqo8QWFyJW8veBygN3Embb66+GdgpMmQyMfrSkd5ZPcW0jfOVxZ7Zv02Apn52pf7khjTIBTvuYkXgAYMj9ujXao98bhnI7z+m5NyhS3RBmCZnCyO/sk0t/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 12:09:40 +0000
Received: from CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::504e:40d9:e81f:2af3]) by CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::504e:40d9:e81f:2af3%5]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 12:09:40 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Zeng, Oak"
 <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Topic: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Index: AQHadb8LgdGdC44RVkaTSNkCpTqqArE3gYaAgAXtSAA=
Date: Mon, 18 Mar 2024 12:09:40 +0000
Message-ID: <37e37163450c4b5c41587cfa354500b7f06f4d20.camel@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-4-oak.zeng@intel.com>
 <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7730:EE_|SJ0PR11MB4927:EE_
x-ms-office365-filtering-correlation-id: 19ec2b84-f156-4ccc-e9ec-08dc474449c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gyLp7MfR2gbNjVe9IqBo0Mv/i5m6z0+fa5+5xdvs1pUl4T+PQ7fvRyHxH20NWlVuHXLqkQQ4IUhwwKse3Fg89ePwXAmGDKm14syie00S7mnNft6e5MNrUGhzJaRxkUldwXRUTNLPrPvF7k8r1yUmPqL0f3OvdNYQy0uLic4NJKJ+o3L4VSu6Ll1CXFoe0kZbhQ3GMKT5gXeWmbPT2X47+dx81VWe19uXNyRsv5gkImhMmU/BBRLDkLWYUsJNh0alf4w1lRRCqW10MERSCc771/HEGrv/+GQ+H+xcdpEGY98ELkK4qtN2TifSw20uluMIk/WcwxJROEpRLT+OXblQgZMc/8TvMF8QWlP2F5R48fOgtECfct//8ztB0DTACUlTQnmn9Xl9cuynRx37p2xWp06vxOCNUNPiAhf18PdIlWpBanAEfqqMTb0wueiH3a/hm3rtexjIN0gmWhbFJ0YjLBux1YoImFsSaYP/WuP763HcMydJNY9p/jt+qRQ3s+On99FGKhSm6bSBstMcmYmdPwUqQqXevkZX+YnqXyh4KWXzFhhS0MC1n6kE4WNYHdL1PUpPLHydhIBwrAvjwAmgCIy+3AQWXSlBTVakn/nl37jw4yIJcWKDDpHqpzjfup7C2Fl1b9WNJ0CJmKdChoE9XePfw1U9GTST3OkowP0YZtFChsImn8RC2c/jeHa+JirnY+p+pmgZvCEZ9qDNv2B6v3z3YNqXNdNUbpU9ZbMw2dM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7730.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXNNbS9Uc0FyVE5GZHQvZWo3dVQzTVEvdEZxWThPbVgwZHVraXR4NnU3R29M?=
 =?utf-8?B?RFRkaWVLMWdURXVxd3IrOGtZZmxmUHN6SjNUMEhwNWlsUEpPc3B4ZC9aZlF6?=
 =?utf-8?B?Ri9xdjR4ai9ReGFzWkNUbnlzaDBKN1p3UHlvTUhZTCs1RDBGb2ZNd3d5aFp6?=
 =?utf-8?B?QXB2M3Zhdmt3dml1dUE5aWlKUnNDVVZtTzJKbXR6aU5ucE51dHBLcFh4NzlB?=
 =?utf-8?B?aXZuY2lES3l0RzNaYUo3cUt2K3dtVzF0d3RRaWRwQnNiS1pqUXB6NUFTamN2?=
 =?utf-8?B?dkRQSmQxZ2F6eUF6WnFNVFIwdGtWR0dxK0w5KzNjVmc5UHVDSHJUbG1XV25y?=
 =?utf-8?B?RURXOGs2SGQ1b3F2OUpoOEo0Skh5UnBFSmQ0YUhuTE9XRDEyZnRIanRmYUVj?=
 =?utf-8?B?Unk3ckxPSk9LWk5mNVowaGIveVpqZitKRHkyOGZUVThmZUN0RXMxNFpvWVVX?=
 =?utf-8?B?MDlLbExvL3A0RDNUdzNxd3ZtNndjczBKd2ZDNVBFS1psY2o4c3ZPRSswTkhj?=
 =?utf-8?B?MXNaMFV2c3I5Ukd0QUp2UHAyNGxIKzFMVCtva0JPN3VrYVY3WTJ3ajYxbnc2?=
 =?utf-8?B?Nk1ZakxCRkZ2MmM1TUlFeWJQaS92ODVJQ251ZzQ2b05hSUtNYXhsNmh0SXd4?=
 =?utf-8?B?R2laQ0VSSXNpd294Ni9mOWpFTVlhSnJvaDk0dlN0eHJubUNUb3lRcnY3RlVI?=
 =?utf-8?B?MzhmQ1FtTHlUUkUvQTg1bUhBNEY1QlFxMjgvRG9zaTcwVElVeWxxSVBicWdh?=
 =?utf-8?B?ejBRdXNjS3dSL3ZQa0QyOTR3Y2VlTnpETlVrSWswRGF3VlM0OHpFZk05ZXdH?=
 =?utf-8?B?cnlVS0V5aDhLUVVoTFZYUkNtcTJteFl4N0FxR0tLVFNhTlNValFVVTdCdXZC?=
 =?utf-8?B?aFJ1ZW5BZkJXSlpvNytpNStsSU5RUy9aRnU0L05XdE5Gc0lzUXJidGVpZWxu?=
 =?utf-8?B?d2V1c2UvSDJNSW81LzVuaGM4M2MrS3dHK01IK0NKSmxOVXU0dVl2SmpxSWt6?=
 =?utf-8?B?TEVnaXc5TlJRYm5XaFBHOXNyZm12RVdQenRhQ0ZoejdMTVVTWndybmpjTVhw?=
 =?utf-8?B?UGM0R0Y1VkVpdlU0cTlQZHRrQ2ExdzNieDRGZnl0d3MvaDREazMya3FpYUVE?=
 =?utf-8?B?LzhCaXp6Tkhnd0tWU0RSeThMc25UNmFoamVKVjkxV2VRbFl3ejhCNU9OM2N4?=
 =?utf-8?B?VHFZYndaZFdONlpKU3drTWdDTFlzL0F5bDFmY0NHSmJzWVhSc25oamF5VUkw?=
 =?utf-8?B?SkYzcEhDKzZiWHJVVm5WMk1kWEhLUE11bjBQYWY3U2dFcXk5L2VObDhvSmlu?=
 =?utf-8?B?ZEVRZ0ZSbzJhKzZoWUpiUlNDK3pwWmZLbnQweGJjaHJtQkNUMVM2TFRQOXhH?=
 =?utf-8?B?UVRDeEh0ZTdzKzdpemswQWVROFkycWVLVGpzdnNnVW1KTTFueFBjZGZXYU5q?=
 =?utf-8?B?QWVtdGQ5TjFpeHNGcThwZXB4a3BtM3pGSi9DSjc1K3lOSUJEeW92SzhFTDdt?=
 =?utf-8?B?YzA0bXh3MUVSbGVKeHIya3JNa1ZzdTlYOENyT1JTbkpoMWVzdTFuMFJrY1Q5?=
 =?utf-8?B?WkM0RUpiendWK0xFd080aTFRdW0xUFdzNjJaNnUyenhGa2Nnc3BHRXBQOFFu?=
 =?utf-8?B?QkhlU2d6QXNWMEZmTncxai9vTW9mN0R6UWxPQTVkVS9lZmhJY2JLSCtWYnRW?=
 =?utf-8?B?Mm56MU5QN1ZMQ3paTStIcWNmWmc5R1FmekxCYnZyZlZCZVJPVXo1YXNUVFEz?=
 =?utf-8?B?eDgrTW1tYzR5U3ZOSTlIQUs0aUJSalFMZUxGMnlhcTNmdnIyYitqRmhTa3ZM?=
 =?utf-8?B?Z0hlOWlXaHQzQkR3MldpVXdiZjZicS9zMWtrK1RXOEpGcFNEUE1WWlJWVkhJ?=
 =?utf-8?B?MlFMdWZPdzVPcXZaU2JvVkl0UjliWWFmOXdBRjgxbjN5RG1UcjlDVloyNmti?=
 =?utf-8?B?cDlPa1o3cVoxUCtheFllaGJCZVVKdFZqcTU4NytTd2t6L1g3aFh3Yy9yZ2Nh?=
 =?utf-8?B?SGMwUXFCcVpOVEE2RHozK2dVRGlEUDU1ZmVlZGxFekZlWFEyZnk3c0wzcDVz?=
 =?utf-8?B?dGRrcElwSjNiYVFZWEdiVStCVm4zNlFCVUV2U1ZGMHNKUk5XM2xqblFJd1B1?=
 =?utf-8?B?aGVZdnljclA2YlNtUGgxZE9Cb1YveHUzNkxLTDZsWjJTTVRzRGMvdnhhTTMv?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF0993B0C8C5174D9D41AC7D3F0EC409@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7730.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ec2b84-f156-4ccc-e9ec-08dc474449c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 12:09:40.0562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJjlu0uOy8kbrywdg5vhE89UxAYj296a7LM98fAoT0mpn/qFesixGqclbDpgTfB7dyetBjAvt5xd5/CK1gBFDG163g+Ye4BEhNR1DC2UA90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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

T24gVGh1LCAyMDI0LTAzLTE0IGF0IDE3OjM5ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIE1hciAxMywgMjAyNCBhdCAxMTozNTo1MVBNIC0wNDAwLCBPYWsgWmVuZyB3cm90
ZToNCj4gPiBTaW5jZSB3ZSBub3cgY3JlYXRlIHN0cnVjdCBwYWdlIGJhY2tpbmcgZm9yIGVhY2gg
dnJhbSBwYWdlLA0KPiA+IGVhY2ggdnJhbSBwYWdlIG5vdyBhbHNvIGhhcyBhIHBmbiwganVzdCBs
aWtlIHN5c3RlbSBtZW1vcnkuDQo+ID4gVGhpcyBhbGxvdyB1cyB0byBjYWxjdWF0ZSBkZXZpY2Ug
cGh5c2ljYWwgYWRkcmVzcyBmcm9tIHBmbi4NCg0KUGxlYXNlIHVzZSBpbXBlcmF0aXZlIGxhbmd1
YWdlIGFjY29yZGluZyB0byB0aGUgcGF0Y2ggZ3VpZGVsaW5lczoNClNvbWV0aGluZyBsaWtlICJB
ZGQgYSIgb3IgIkludHJvZHVjZSBBIg0KDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFpl
bmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaCB8IDggKysrKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gPiBpbmRleCBiYmVhNDBiNTdlODQuLmJmMzQ5MzIxZjAzNyAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBAQCAtNTc2LDQgKzU3NiwxMiBA
QCBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZV90aWxlDQo+ID4gKm1lbV9yZWdpb25fdG9fdGlsZShz
dHJ1Y3QgeGVfbWVtX3JlZ2lvbiAqbXIpDQo+ID4gwqAJcmV0dXJuIGNvbnRhaW5lcl9vZihtciwg
c3RydWN0IHhlX3RpbGUsIG1lbS52cmFtKTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+ICtzdGF0aWMg
aW5saW5lIHU2NCB2cmFtX3Bmbl90b19kcGEoc3RydWN0IHhlX21lbV9yZWdpb24gKm1yLCB1NjQN
Cj4gPiBwZm4pDQoNCnN0YXRpYyBpbmxpbmUgaGVhZGVyIGZ1bmN0aW9ucyBhbHNvIG5lZWQga2Vy
bmVsZG9jIHVubGVzcyBzdHJvbmcNCnJlYXNvbnMgbm90IHRvLg0KDQovVGhvbWFzDQoNCg0KDQo+
ID4gK3sNCj4gPiArCXU2NCBkcGE7DQo+ID4gKwl1NjQgb2Zmc2V0ID0gKHBmbiA8PCBQQUdFX1NI
SUZUKSAtIG1yLT5ocGFfYmFzZTsNCj4gDQo+IENhbid0IHRoaXMgYmUgbmVnYXRpdmU/IA0KPiAN
Cj4gZS5nLiBpZiBwZm4gPT0gMCwgb2Zmc2V0ID09IC1tci0+aHBhX2Jhc2UuDQo+IA0KPiBPciBp
cyB0aGUgYXNzdW1wdGlvbiAocGZuIDw8IFBBR0VfU0hJRlQpIGlzIGFsd2F5cyA+IG1yLT5ocGFf
YmFzZT8NCj4gDQo+IElmIHNvIGNhbiB3ZSBhbiBhc3NlcnQgb3Igc29tZXRoaW5nIHRvIGVuc3Vy
ZSB3ZSB1c2luZyB0aGlzIGZ1bmN0aW9uDQo+IGNvcnJlY3RseS4NCj4gDQo+ID4gKwlkcGEgPSBt
ci0+ZHBhX2Jhc2UgKyBvZmZzZXQ7DQo+ID4gKwlyZXR1cm4gZHBhOw0KPiA+ICt9DQo+IA0KPiBT
YW1lIGFzIHByZXZpb3VzIHBhdGNoLCBzaG91bGQgYmUgKi5oIG5vdCBhICpfdHlwZXMuaCBmaWxl
Lg0KPiANCj4gQWxzbyBhcyB0aGlzIGlzIHhlX21lbV9yZWdpb24gbm90IGV4cGxpY3RseSB2cmFt
LiBNYXliZToNCj4gDQo+IHMvdnJhbV9wZm5fdG9fZHBhL3hlX21lbV9yZWdpb25fcGZuX3RvX2Rw
YS8NCj4gDQo+IE1hdHQNCj4gDQo+ID4gKw0KPiA+IMKgI2VuZGlmDQo+ID4gLS0gDQo+ID4gMi4y
Ni4zDQo+ID4gDQoNCg==
