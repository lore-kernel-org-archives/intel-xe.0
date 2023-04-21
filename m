Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764A7C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 04:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0962F10E004;
	Fri, 21 Apr 2023 04:15:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E508310E004
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 04:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682050532; x=1713586532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5pWIAl4Gov5EKT9Ige9gjTPLFQ2c50QEbgh3vCdrp/s=;
 b=a9c06MTQuKG1Vbj+7apn/HYU3cjlMjTcTBP6dmx7OhlX7icXrRo2Q8b7
 /khKsczG0lkGwqkvQw2ztjceHQDOKl3iFDIWNXIYTt2w9xEIVWIkvpn6e
 su+FlOjnd7fh7De68Gm3dSM1G+38pSoqZCgi6EcDDCi2Ixs+GvXGSNBHW
 huIqG6iHW8Nmw0LZ4kpGCxXgCxGVvM6iRZPAUfiBILWw3YXdWEBu6Ourf
 zNI4830AfKj1axLmPfFQCUEUYVnIP8tN36iJpFb8TKDontCsg3MVwIA6v
 NF7X1BPd6iJHT7haZ2hPL7FHh06uBS31M+SC021DshwwAj4qVyBG5mIuQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343401698"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="343401698"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 21:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="694838104"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="694838104"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2023 21:15:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 21:15:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 21:15:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 21:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivWCZ0BDxFCewiPneBIcrMZm5QwskAqrXtIhKk4/76fUiDo/nzR63lFQMJmaDBEZkET5m1LEE1PNAW8qRW+mTip0MkcHtUhkx4YqxpQXhnI1W39HIoGt1rNFz2fBBtLSIEXHPCcf5DeuDeOpelhZsV5Ccs96BzAZNUVse+3Bor6rXzsKxJEYE3ooNkgoucvVTH5RtO62XTi+kVNksiNWA3FtXynlhW54I3ELnlczLZYis0lT/WhjpQnzOjdWR5EkjaxgKCe/0HrQzhV5MTqqbbWt0iipbZlUV+XSzv/HIjDBJPV7QA9Ga5Qi88/lI0foTIEIEMKY/7uCJmD0vp/0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pWIAl4Gov5EKT9Ige9gjTPLFQ2c50QEbgh3vCdrp/s=;
 b=BKiSd8bhtPTyfBSz4dLUFsngVsv/eBLDZ0d9kPbxQlfYr2VuSFzmI4nILRV64WLZKJ8Dgt9wnEHFfHQb6sCco5SfAcRsNcDVQy0oYZVj/uOEcOL3emsn3gMb6+J4qjJdfKMaWB3ETxoxsv+u3TTkiMz5Ty5Q7ZTfLxPZoqfGTI30BRJDeD1KOkTN6c4zdt89OvzqqZYbta30uSAe1nqOurLASzksFbK1UvsLCPja7/d1SJkYkuItzJgQGWZL87StVJiyI6uqROw965jxWXiFy73wUGe8uMg0zzDOAfGbsUP8jCapPhGeqarRcylTh15+3IKavu+UwhZabKr15amTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 04:15:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::401d:5396:cf8d:5d58]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::401d:5396:cf8d:5d58%9]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 04:15:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
Thread-Index: AQHZcugUsD4YBqxjN0C5KffvW75kja8z8FuAgACchACAAB8GgIAAAygAgAB67wA=
Date: Fri, 21 Apr 2023 04:15:29 +0000
Message-ID: <c7731f23e645097e41a55260252b8480af2bce08.camel@intel.com>
References: <20230419175501.155319-1-stuart.summers@intel.com>
 <87mt32x5iw.fsf@intel.com>
 <pofqujdm6esn74xfl2eiphxquupoolbqnttbnjs2hmqvtkwspo@4yqkzpqat43m>
 <bd0c3c5f95510690b45c55a0ed2f87a1b3e2bf94.camel@intel.com>
 <e7cmcmmxj7a74zsopyztqntrpqwlozrptsnrlsogzvxh7s5tuz@s7oxebcof36t>
In-Reply-To: <e7cmcmmxj7a74zsopyztqntrpqwlozrptsnrlsogzvxh7s5tuz@s7oxebcof36t>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB5505:EE_
x-ms-office365-filtering-correlation-id: e440e2e4-961d-4d0b-3a81-08db421f0ae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0TMP92SmG5qsLBfubID1M38nDIwzU3NtpsuNNfT2VkuZj5qmoUeGpTAiBlaIBXVKn7Q2nNb1Z77HxAD+7Pykl3oByOh/gGHzCOQR2mIInxh+EQon0T5XPmLkCw40Xjff9+AgkUPSawWSxChx0D5CH3KmGI2U2JtZgxgWWwQxTuw4QC4VQGZD9PrD47WhR6zkSvl8g33XhyIGvjJV1qj03W5cctpeGYFcZrDKl3efJv1WgY0T1uh/C91vb/yg+SZDmynxM1XtQFSRIAEW4xbRTCpzHvrCWa+BVNUAK8XhvagnCfHPmaxP2+13Xr6tW/1i7xLikH0Z3gkaePz+sotviFQ+w5C4G5S0bafojpv9VuE101ZXcDwFSHUUI5g+pzh3wFw81Qg50P8hCdTP1OuqAh9rhAoFB5rOVfSqrTFftLI87h/oBoR2887PoLR/tQoIUUT6p2M0Qi7Oh3xv8QMpeKGhr6AP8hBDYcwkvj7Oaz/QVXQFhvmOwFbThywubEh4p/3CFy2geOpnduPwJmGsBnyyHj0VPHue8uG4Bu+0Hn6jn6fbHwYYc1ispS80MyO9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199021)(316002)(91956017)(66476007)(64756008)(37006003)(66446008)(54906003)(6636002)(76116006)(66946007)(66556008)(4326008)(966005)(478600001)(6486002)(5660300002)(71200400001)(8676002)(8936002)(6862004)(41300700001)(2906002)(122000001)(82960400001)(38070700005)(86362001)(36756003)(2616005)(6506007)(26005)(186003)(6512007)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEVMTjBwTU1RK1BqVmxadzI2YWFYbitKWTFOUXc1ZFBzY3NHS0ZFSnM5MkJI?=
 =?utf-8?B?dGM4RnM1VjBrdFRTSmdHaHFyMndvOUFpYTV3b3ZDeWxHL05MVzR6cHN2R0ZX?=
 =?utf-8?B?UzdDRVc1a3RVemQ2SFhEZXZnZ1pUTC9jczlUb0VpNC9IUEhTZ3Q5V0JPRm9B?=
 =?utf-8?B?SXBvWjlUTVIxUTVBcDV0YjNkUzhHWmJueWNLSUZrVFIyTHljUkx0UFNNRGhp?=
 =?utf-8?B?cVBrUDg1RmFhaWdaZXJjRGpiNFMybUxqLzI4U2lSZkVBZ09UWUFvVmpISHlo?=
 =?utf-8?B?anl3ZldwZzJkWXVvdFhZN3ltRlF3NHRuZE1LQWFoOGsyeFhxN0hXc2pKbDRZ?=
 =?utf-8?B?Wk5hdW9RNnJudGNIZ1J1My9OZ2pHU3BmcWVxZ3oxZ013amM2VExtMzFrL3Ry?=
 =?utf-8?B?Ylg4ZXBWcFc3akx0VDZYemprRThYUjFzZWhZcE14RGlHZGo4MVpjS2VhbTJF?=
 =?utf-8?B?ei9MZXkwODUrd2l0c3I3NStWZEx1bThGdFVjV0FvZjJxZVdLby9MZHM5anR2?=
 =?utf-8?B?cTNHTWo5N3BBUFRWeGo3NVU0NnpOR1N0Z1g1WjZobUc2a0FjR093a2ZXL1ZG?=
 =?utf-8?B?U0RLQ0YxTEFUN0duSWYrVis0TjlZQllPSDJ0K3lZczQrcHRPbzErVDZsbzdC?=
 =?utf-8?B?UG1xMnBJa3BMbjJ5bEU5bTJ0NXV2YWkzaFRULzB2bDBTZ1ExVjBFWEtJaXR0?=
 =?utf-8?B?SXFhQzl1MllYb0taY3NpYUFaN25uL3JieCs5VFpZMENYUHM4ekV4Z1FvWjhy?=
 =?utf-8?B?YWFmZ3A5aE9na3VmTE01YWlMaENlVHVqaTJyaGc4U2ZuYnlxMWRtTkQrNlJp?=
 =?utf-8?B?MmMxOWIxUG1Jc1psd2ZGUHgycmhpK3RuYThHZjFWWkVIQ3NtNmxSS1RmQzZP?=
 =?utf-8?B?WkJwU0hOK1ArbEg0OUhySHAwc0hsb0VvMkJ2RDRQZ3FLNFJ4cTZnT3o2Zzlo?=
 =?utf-8?B?YjZLblZEaWRlRCtyOURiR3c0N1NTeW45M3o0MTFNV2JiclZOb0dnWWZZMWpa?=
 =?utf-8?B?cFFiYmFWMzZ5YzlaRUlJSWJzUGZOVXJPYW0rbXZCdHQrZ1Z5ck1GaFIrbk8v?=
 =?utf-8?B?K0NWeDVNQkZLTStDWHpsNmpLd3dkTTFiTkhOcGduSGRPMnFKdm90QU1iOXdj?=
 =?utf-8?B?WU03emdqaGJ2NXFpVGRmSHFwcUpva20zbzBRcEFQem1SeUhVOVpVaU8vUXNp?=
 =?utf-8?B?akd6d00xd3RrSkM0a3N6VWMxV0wzZnE4M0dSVUFMVDRuT1p0NzVQNEpISHhU?=
 =?utf-8?B?ZXAraFlGV1JKVXduN1hwbG5TNlFmeVJFbENSQmlZWUlrblVvZkJYejM1Y0RH?=
 =?utf-8?B?Y2Z5Rkpub3BwZXY2YWtXd2xvWGppeDYxQVhCNjExU3g1K3ErUHIzWWsvWWRC?=
 =?utf-8?B?UEcwNklWWm5yUGxnNVBhT054REJkWldQcXFnbm5jck9nOTB2dXE1RFQ3TUZV?=
 =?utf-8?B?VVJZZVg5cmxGUjJtaXloSGFGcjMzTnZFeWhXa3VEN1BmNlI5N1ZjODdzSjJ5?=
 =?utf-8?B?aWlGR0dKL0d1OW82VUJPK2k0RGl4OFp5OU1VQ2ppbXQ0MjQza2RqVFduNzZW?=
 =?utf-8?B?eURIOVUwc29lZXdOd3dLR2VtTzZiTG92dUM0NGExUHVSYmZVdWVmcW1pR2or?=
 =?utf-8?B?SURjWnR3UkovU0ViWWVzV0g0alRPSGUyaC9nblUyQkJ3NTF4bWpmY0FnSjdI?=
 =?utf-8?B?MW5WSXd6QzBKU3ZNd2g2cWFtTytOamoxRXFad2pJRGltZmE2aGhLZXZ3QlM0?=
 =?utf-8?B?TlJMSUtOVEhPL2ZIbXc1YmtiQUdXYnl6MHVkVE1uRDNWeHV6NTlCT1BGNS80?=
 =?utf-8?B?WTdmQWppelpJSSswSHE5THhMbWdyYi9RWmVtYWJ2eTR5TGtvV1c5MGo0V2I1?=
 =?utf-8?B?TmhDOTV4K0p5Wnl5Kzd5RWk4a0JXdGFudm8zUjlqT2wrR2ovTW5RRUJvWUZT?=
 =?utf-8?B?VTZLU0syYlEyRXJCY0J1YW5HVk1pdVBmUzNUS2RwNDFseGd6cHNYWFBKTURB?=
 =?utf-8?B?NGo5dFdOd0d1dnlTajZtZDVVVStOQUNvbUEwYzFkWWViSEg4RTVtWmNFaXJh?=
 =?utf-8?B?ZThCVU1GT2ZKMVBicXpnall4R2FuRUY2TWNDUG1HQ0ZOdnEzRm9XUmZwMDM4?=
 =?utf-8?B?ejdqeUR5MlI0MVFhUktPci9yMzR2dk52Smgyei9wd01PZWZxdmRZOXJKK0VQ?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D7E85CD0C22254D828CE643393E47DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e440e2e4-961d-4d0b-3a81-08db421f0ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 04:15:29.6803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZXYcRtbVmwS6HFJE8bELffEWFOBLgk5+FVCc5JIdnTai9+F/HDRqtQE7ZQrhvjKDk2hcK9Jak/yW4Og/orjCYWaF7HRQVPCH4ZpnHueZFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTIwIGF0IDEzOjU1IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgQXByIDIwLCAyMDIzIGF0IDA4OjQ0OjEyUE0gKzAwMDAsIFN0dWFydCBTdW1t
ZXJzIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMy0wNC0yMCBhdCAxMTo1MyAtMDcwMCwgTHVjYXMg
RGUgTWFyY2hpIHdyb3RlOg0KPiA+ID4gT24gVGh1LCBBcHIgMjAsIDIwMjMgYXQgMTI6MzI6NTVQ
TSArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgMTkgQXByIDIwMjMs
IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gPiA+IHdyb3Rl
Og0KPiA+ID4gPiA+IFRoaXMgaXMgYXR0ZW1wdGluZyB0byB0YWtlIHRoZSBiZXN0IHBhcnRzIG9m
IGk5MTUgbW9kdWxlDQo+ID4gPiA+ID4gcGFyYW1ldGVycw0KPiA+ID4gPiA+IChtaW51cyB0aGUg
YWN0dWFsIG1vZHVsZSBwYXJhbWV0ZXJzKSBhbmQgYWRkIHRvIHhlIHRvIGFsbG93DQo+ID4gPiA+
ID4gZm9yDQo+ID4gPiA+ID4gYmV0dGVyDQo+ID4gPiA+ID4gZGVidWdnYWJpbGl0eSBhbmQgY29u
ZmlndXJhdGlvbiBpbiBvcmRlciB0byBoZWxwIGlzb2xhdGUNCj4gPiA+ID4gPiBwcm9ibGVtcw0K
PiA+ID4gPiA+IG9uIGEgcGVyLWRldmljZSBsZXZlbCBpbnN0ZWFkIG9mIGdsb2JhbCBtb2R1bGUg
cGFyYW1ldGVycy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBOb3RlIHRoYXQgSSBkaWQgcmV2aWV3
IGEgZmV3IG9wdGlvbnMgaGVyZTogY29uZmlnZnMgKG5vdA0KPiA+ID4gPiA+IGdlbmVyYWxseQ0K
PiA+ID4gPiA+IHVzZWQgYnkgdGhlIGRybSBzdGFjayksIG1vZHVsZSBwYXJhbWV0ZXJzICh3ZSBo
YXZlIHNvbWUNCj4gPiA+ID4gPiBuZWdhdGl2ZQ0KPiA+ID4gPiA+IGhpc3RvcnkgaGVyZSksIHN5
c2ZzIChub3QgdGhlIHJpZ2h0IGFwcHJvYWNoIGdpdmVuIHRoZSBmb2N1cw0KPiA+ID4gPiA+IG9u
DQo+ID4gPiA+ID4gdXNlciBpbnRlcmZhY2UgaGVyZSkuIERlYnVnZnMgaXMgdXNlZCBpbiB2YXJp
b3VzIGRybSBkcml2ZXJzDQo+ID4gPiA+ID4gdG8NCj4gPiA+ID4gPiBjb25maWd1cmUgdmFyaW91
cyBkZXZpY2UgY2hhcmFjdGVyaXN0aWNzLiBUaGUgaW5mcmFzdHJ1Y3R1cmUNCj4gPiA+ID4gPiBi
ZWluZw0KPiA+ID4gPiA+IHByZXNlbnRlZCBoZXJlIGhhcyBhdCBhIGhpZ2ggbGV2ZWwgYmVlbiBw
cmVzZW50IGluIHRoZSBpOTE1DQo+ID4gPiA+ID4gZHJpdmVyDQo+ID4gPiA+ID4gZm9yIHNvbWUg
eWVhcnMgbm93LCBzbyBwcm92aWRlcyBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQgZm9yDQo+ID4gPiA+
ID4gcXVpY2sNCj4gPiA+ID4gPiBkZWJ1ZyBhZGRpdGlvbnMgd2l0aG91dCBleHBvc2luZyB1c2Vy
cyB0byBzb21lIG9mIHRoZQ0KPiA+ID4gPiA+IGNoYWxsZW5nZXMNCj4gPiA+ID4gPiBmYWNlZCB3
aXRoIG1vZHVsZSBwYXJhbWV0ZXJzIGluIHRoZSBwYXN0Lg0KPiA+ID4gPiANCj4gPiA+ID4gTG9v
a2luZyBpbnRvIGNvbmZpZ2ZzIGhhcyBiZWVuIG9uIG15IHRvZG8gbGlzdCBmb3IgYSBsb25nIHRp
bWUuDQo+ID4gPiA+IEl0J3MNCj4gPiA+ID4gc29tZXRoaW5nIHRoYXQgb2Z0ZW4gZ2V0cyByZWNv
bW1lbmRlZCBhcyBhIHJlcGxhY2VtZW50IHRvDQo+ID4gPiA+IG1vZHVsZQ0KPiA+ID4gPiBwYXJh
bWV0ZXJzLCBidXQgdGhlIGRvY3VtZW50YXRpb24gYXMgd2VsbCBhcyB0aGUgZXhpc3RpbmcNCj4g
PiA+ID4gZXhhbXBsZXMNCj4gPiA+ID4gaW4NCj4gPiA+ID4gdGhlIGtlcm5lbCBhcmUsIEkgdGhp
bmssIGxlc3MgdGhhbiBzdGVsbGFyLiBCYXNpY2FsbHkgd291bGQNCj4gPiA+ID4gcmVxdWlyZQ0K
PiA+ID4gPiBpbXBsZW1lbnRpbmcgaXQgYW5kIHNlZWluZyBob3cgaXQgYWN0dWFsbHkgd29ya3Mu
DQo+ID4gPiA+IA0KPiA+ID4gPiBJbiBhbnkgY2FzZSwgSSBkb24ndCB0aGluayBpdCBzaG91bGQg
YmUgZGlzbWlzc2VkIHdpdGgganVzdA0KPiA+ID4gPiAibm90DQo+ID4gPiA+IGdlbmVyYWxseSB1
c2VkIGJ5IHRoZSBkcm0gc3RhY2siLiBBIGRlY2VudCBpbXBsZW1lbnRhdGlvbiBjb3VsZA0KPiA+
ID4gPiBzZXQNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGV4YW1wbGUgZ29pbmcgZm9yd2FyZC4NCj4g
PiA+ID4gDQo+ID4gPiA+IFRoZSBtYWluIHByb2JsZW0gd2l0aCBkZWJ1Z2ZzIGlzIHRoZSBpbmFi
aWxpdHkgdG8gc2V0IHRoZQ0KPiA+ID4gPiBkZWZhdWx0DQo+ID4gPiA+IHZhbHVlcw0KPiA+ID4g
PiBwcmlvciB0byBwcm9iaW5nIHRoZSBkZXZpY2UuIFRoaXMgaXMgd2hlcmUgbW9kdWxlIHBhcmFt
ZXRlcnMNCj4gPiA+ID4gYXJlDQo+ID4gPiA+IGhhbmR5LA0KPiA+ID4gPiBidXQgdGhleSBhcmVu
J3QgZGV2aWNlIHNwZWNpZmljIChhbmQsIGFzIHlvdSBub3RlLCBnZW5lcmFsbHkNCj4gPiA+ID4g
ZGlzY291cmFnZWQpLg0KPiA+ID4gPiANCj4gPiA+ID4gTG9va2luZyBhdCB0aGUgcGF0Y2hlcywg
SSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHRoZQ0KPiA+ID4gPiBwcm9jZWR1cmUgZm9y
DQo+ID4gPiA+IHNldHRpbmcgdGhlIGRlYnVnZnMgdmFsdWVzIGJlZm9yZSBwcm9iaW5nIHRoZSBk
ZXZpY2Ugd291bGQgYmUuDQo+ID4gPiA+IENhbg0KPiA+ID4gPiB5b3UNCj4gPiA+ID4gcHJvdmlk
ZSBhbiBleGFtcGxlIHNlcXVlbmNlIG9uIHRoZSBjb21tYW5kLWxpbmUgcGxlYXNlPw0KPiA+ID4g
DQo+ID4gPiBJIHRoaW5rIHRoYXQgZm9yIGFueSBzb2x1dGlvbiAhPSBwYXJhbWV0ZXJzIGlzOiAg
c3BsaXQgdGhlIG1vZHVsZQ0KPiA+ID4gbG9hZA0KPiA+ID4gYW5kIHRoZSBtb2R1bGUgYmluZCBw
aGFzZXMuICBJJ3ZlIGJlZW4gdXNpbmcgdGhhdCBmb3IgYSBsb25nIHRpbWUNCj4gPiA+IHNpbmNl
DQo+ID4gPiBpdCdzIGEgZ2VuZXJhbCBzb2x1dGlvbiBmb3IgYXR0YWNoaW5nIHRyYWNlcG9pbnRz
IG9uIGVhcmx5IHByb2JlDQo+ID4gPiBhbmQNCj4gPiA+IGl0IGFwcGxpZXMgdG8gYW55IGtlcm5l
bCBtb2R1bGUgKGRpZmZlcmVudGx5IHRoYW4gZS5nLiBhZGRpbmcgYQ0KPiA+ID4gIm5vbW9kZXNl
dCINCj4gPiA+IHBhcmFtZXRlciB0byBhY2hpdmUgc2ltaWxhciB0aGluZykuIEZvciBhIGRlYnVn
Z2luZyB0aGluZywNCj4gPiA+IHVzdWFsbHkNCj4gPiA+IGZvciBlYXJseQ0KPiA+ID4gYnJpbmcg
dXAgdGhhdCB3b3VsZCBiZSBhY2NlcHRhYmxlIEkgdGhpbmsuDQo+ID4gDQo+ID4gUmlnaHQgSSBr
bm93IHdlJ3ZlIGRvbmUgdGhpcyBtYW55IHRpbWVzIHdpdGggaTkxNSB3aXRob3V0IGlzc3VlLg0K
PiA+IFRoaXMNCj4gPiBpcyB0aGUgd2F5IHdlJ3JlIGNvbmZpZ3VyaW5nIHRoZXNlIHRoaW5ncyBw
ZXIgZGV2aWNlIG5vdy4gQnV0IGl0J3MNCj4gPiBzdGlsbCBhIGdvb2QgcG9pbnQgYWJvdXQgY29u
ZmlnZnMuDQo+ID4gDQo+ID4gQW55d2F5IGl0IGlzbid0IHdvcmtpbmcgd2l0aCB4ZSB0b2RheSwg
YnV0IHRoYXQncyB3aHkgSSBzZW50IHRoaXMNCj4gPiBhcyBhbg0KPiA+IFJGQyBmaXJzdCB0byBn
ZXQgZmVlZGJhY2suDQo+IA0KPiB5ZXMsIEkga25vdyBpdCBkb2Vzbid0IHdvcmsuIE15IHBvaW50
IGlzIHRoYXQgYW55IHNvbHV0aW9uIHdlJ3ZlIGNvbWUNCj4gdXANCj4gd2l0aCB0aGF0IGlzIG5v
dCBwZXItbW9kdWxlIGxpa2UgcGFyYW1ldGVycywgbWVhbnMgdGhhdCB3aGVuIHRlc3RpbmcsDQo+
IHRoZQ0KPiB1c2VyIHdpbGwgaGF2ZSB0byBzcGxpdCB0aGUgbW9kdWxlIGxvYWRpbmcgZnJvbSBt
b2R1bGUgYmluZGluZyB0byB0aGUNCj4gZGV2aWNlDQo+IHVuZGVyIHRlc3QuIFNlZSB0aGUgaXNz
dWUgSSBwb2ludGVkIHdoZXJlIHdlIGRpc2N1c3NlZCBhIGxpdHRsZSBiaXQNCj4gYWJvdXQgdGhl
IG9wdGlvbnMuIFRoZSBzZXBhcmF0aW9uIGJldHdlZW4gbG9hZC9iaW5kIGlzIHRoZSBzYW1lIEkN
Cj4gdXNlIGZvciB0cmFjZXBvaW50cyB0aGF0IEkgYmxvZ2dlZCBhYm91dCBzb21lIHRpbWUgYWdv
DQo+IChodHRwczovL3BvbGl0cmVjby5jb20vMjAyMi8wMy90cmFjZXBvaW50cy1hbmQta2VybmVs
LW1vZHVsZXMvKQ0KPiANCj4gRm9yIHRoZSBhcHByb2FjaCB3aXRoIGRlYnVnZnMgaXQgd291bGQg
YmUgbm8gZGlmZmVyZW50OiAgZmlyc3QgeW91DQo+IGhhdmUNCj4gdG8gYSkgbG9hZCB0aGUgbW9k
dWxlLCB0aGVuIGIpIHNldCB0aGUgb3B0aW9ucyB0aGVuIGMpIGJpbmQgaXQgdG8gdGhlDQo+IGRl
dmljZS4gQnV0IGlmIHlvdSBhY2NlcHQgdGhlIHNwbGl0IGJldHdlZW4gbG9hZC9iaW5kLCBkb2lu
ZyBpdCB2aWENCj4gZGVidWdmcyBpcyBiYXNpY2FsbHkgcmVpbnZlbnRpbmcgY29uZmlnZnMuDQoN
ClJpZ2h0LCBidXQgdGhlbiBhZ2FpbiwgdGhlc2UgYXJlbid0IG1lYW50IGZvciB0aGUgdHlwaWNh
bCB1c2VyLiBBZ2FpbiwNCnRoZXNlIGFyZSBpbnRlbmRlZCB0byBiZSBkZWJ1ZyBzcGVjaWZpYyBz
ZXR0aW5ncy4gQXMgc3VjaCwgdGhlIGV4dHJhDQpzdGVwcyBuZWVkZWQgdG8gc2V0IHVwIHRoZSBm
aWxlIHN5c3RlbSBpbiB3aGF0ZXZlciB3YXkgaXMgZWl0aGVyIG9uIHRoZQ0Ka2VybmVsIGRldmVs
b3BlciBvciBwb3NzaWJseSB0aGUgQ0kgZGV2ZWxvcGVyLiBJbiBib3RoIGNhc2VzLCB0aGlzIHdp
bGwNCmJlIHZlcnkgdGFyZ2V0ZWQgYW5kIG5vdCBzb21ldGhpbmcgd2Ugd291bGQgd2FudCB0byBk
b2N1bWVudCBhcyBhDQpub3JtYWwgZW5kLXVzZXIgZXhwZXJpZW5jZS4NCg0KQXMgZm9yIHJlaW52
ZW50aW5nIGNvbmZpZ2ZzLCBwb2ludCB0YWtlbiB0aGVyZS4gTGV0IG1lIGxvb2sgYSBiaXQNCmRl
ZXBlciB0aGVyZSBhbmQgZ2V0IGJhY2suDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBMdWNh
cyBEZSBNYXJjaGkNCj4gDQo+ID4gSSB3YXMgYWxzbyB0aGlua2luZyB0aGUgc2FtZSBhYm91dCBk
ZWJ1Zy4uLiByZWFsbHkgYWxsIG9mIHRoZXNlDQo+ID4gc2hvdWxkDQo+ID4gYmUgY29uc2lkZXJl
ZCBkZWJ1Z2dpbmcgZmVhdHVyZXMvZnVuY3Rpb25zIHNpbmNlIHRoZSBkcml2ZXIgc2hvdWxkDQo+
ID4gdG8NCj4gPiBhYmxlIHRvIGF1dG9kZXRlY3QgdGhlIGRlZmF1bHQgc2V0dGluZ3MgZm9yIGVh
Y2ggZGV2aWNlDQo+ID4gY29uZmlndXJhdGlvbg0KPiA+IGJhc2VkIG9uIHZhcmlvdXMgcmVnaXN0
ZXJzIGFuZCBwZXItcGxhdGZvcm0gZGVmaW5pdGlvbnMuIFN0aWxsLCBsZXQNCj4gPiBtZQ0KPiA+
IGRpZyBpbnRvIGNvbmZpZ2ZzIGEgYml0IG1vcmUgYmVmb3JlIG1ha2luZyB0aGF0IGZpbmFsDQo+
ID4gZGV0ZXJtaW5hdGlvbi4NCj4gPiANCj4gPiBSZWFsbHkgYXBwcmVjaWF0ZSB0aGUgdGhvdWdo
dHMgaGVyZSB0aG91Z2ghDQo+ID4gDQo+ID4gLVN0dWFydA0KPiA+IA0KPiA+ID4gTW9yZSBjb250
ZXh0Og0KPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwv
LS9pc3N1ZXMvMjMwDQo+ID4gPiANCj4gPiA+IEx1Y2FzIERlIE1hcmNoaQ0K
