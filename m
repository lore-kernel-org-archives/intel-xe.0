Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53B5C47DDB
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 17:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FF3112A5B;
	Mon, 29 Jan 2024 17:54:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A042112A5B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706550876; x=1738086876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IiI3oqa1lSrbCy11Vr8JzGG0Di15jBTBeQro2tLpDew=;
 b=HoDAVQ/XTmla0kVK+9OzT774VhxvIYQbQ1xFo6lKrtnGNP/ICv6qoMo2
 Zhw/49gchSTExKtmeARGZCt61IAfsoxT3DS/zepJrx31T5EyN9e43d+Nc
 dSLw7vIwMEa2FjGCHvOKh12r3J66wDISpt2hz2SEUn46CaOBxGIytXrd6
 d7bLIbApijdnPGc6QRwADpwHDfWJk8HFEhjPBbZZz9FKNQFS+JOGJWrVY
 hmlLJcemetjpg7EmJic42IhnJVKuBWvgzvFG6kA3WVTVeKA2JSGkEsvUs
 KEE820o+MflJlaJp4EtGIHWsrP36pylS9qq30UAH7RbGEZCw1fw2algsw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2856606"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2856606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 09:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="22172644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 09:54:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 09:54:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 09:54:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 09:54:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 09:54:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8nfdzwxhBZL75DDUd4mK8u6kloVkmszjMF7ozVMhY4Db7q/F3Lni/sl4x1h546cx+2YZH43udF4hS3e6/ADWf5I84NHk5XCs5vUme7n+bYxV/k+cGo9L5Yj+Gh+Ir2Q/GS/BYYCFzOqQ4tbKwX8prXTDlZDDJGBx0awl/U6uB/qA52nAdF46xP/vnmjyYJ8noLuH2yw5iTE8FT6s1n3dD0BM/U73R73bJ3lTt/PdVxDqPSLK5x45oDctJdGJh9tkwAsdLIMoYc8LZbR4tdXZwWvDryV5+GKq0q8tlxbv+89iIUqkhPGnm3X441sR2IQAg2xBsD8zWmZ2hQAUXE9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiI3oqa1lSrbCy11Vr8JzGG0Di15jBTBeQro2tLpDew=;
 b=TFB02hjXjv9LgX6arIyXm7q9RQE52iWMmldg4qkYgzHv0VTW5gGJi/oW+2iQGFJOU8aQxb/BvfJqIRdk2wqit56OcKieFHkK4KM/p11YAeBzz/8gVqtUViy8EsWGY+I2rqZu+WzANWQ6EOnMXF4FjgMlnQ7CmVeobTBGyW+4Utv2OFiPLEIpdmtIGuC6JZE9xHlPRnDs9kqjO9KEufoIO3wNI1XnbjIxh873cPX1/bhwiJdy8kwNSZZyaC45sxHCmIV+V/tYiCIwim6Ppl0/XAt2UhqhfPTnRpD9pJeqDwwXjVB2vygG9b4DpVU2bAVSYO3Wkb374blQF50KbcKB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB5489.namprd11.prod.outlook.com (2603:10b6:610:d4::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Mon, 29 Jan 2024 17:54:28 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 17:54:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Topic: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Index: AQHaTVU0tUhabWgp9kKY5rfrtsqlPbDmKcwAgAABYQCAAuqvgIAAAVMAgAgGjYA=
Date: Mon, 29 Jan 2024 17:54:28 +0000
Message-ID: <043020557ea305aa9e75ad2f855ce9c19bc47b09.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-3-jose.souza@intel.com>
 <ac8c0487457d8f6b7085f7fe9aec23472aff8587.camel@intel.com>
 <5749b3be988a6e8e6b2c5330d817e32abba44b4c.camel@intel.com>
 <83ca9d83fe5b8e6d9040c8989e17f5c0e18a5442.camel@intel.com>
 <a628246a5fc0667208594e4e683c29904e947b2a.camel@intel.com>
In-Reply-To: <a628246a5fc0667208594e4e683c29904e947b2a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB5489:EE_
x-ms-office365-filtering-correlation-id: 12fa41a8-9583-4d29-b4f2-08dc20f356b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4ejlE2Gq1n1BPTRcXclH9ftLsyxMs9tCeG7+fUtUaK/L7uABM9yGNs3dXHO6/cKBK4DGFKinvyCakBdS4ev+qzJ0vw383hI/Y6K/WoHdjFAvelLU+7KrLdsxeV33DwmrdVqiXmHcwoNdH1755gMbG7rLoOq1lwHYSbioDmQMDK6MTWCSo0PbvZR/sERvfr4HPuonKKuwrboeeQNoEyrZ9w+f5ZKopwleYBpKbuQvj/jTegPXLTmd8gGhpQwUQmzjEAlC3/30YTaM0lPM8NBGxyjUNJw+jlN6v4MaxUfiyqwR5rI0B+9pQHk10Es0cwIeC+30D0d28EuAOl0ifgnWxE1d3TSIS9MMzoVFoZA2JMwLN05b446Ote6zhf2UY6XQk5s4d5Isq7VyaB+52m9HA2bg5SB1NQCUOrRanunJlyr95Lt6trlaDkKuEAn43XViA9TWA4AdA1nz5htpTm/f16f4lyletAwMnCG2csnCxPE9tOnhsWzlffkNu2an56es+hKXEb5P/m4NUkhGkW+yVSyPMNeU79eCRt2fQ6PBnVrBAvel5MN0y1wHzSKHFryhG8lcQLDbi/DpKdXZ+7CnFlVE+4QURh0k0vyFx5mivdMHF2XYvaWi8Cw7RMphnUy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(83380400001)(6512007)(6506007)(36756003)(86362001)(38070700009)(82960400001)(8676002)(8936002)(41300700001)(4326008)(5660300002)(38100700002)(66946007)(122000001)(478600001)(107886003)(316002)(110136005)(66476007)(64756008)(76116006)(54906003)(66446008)(66556008)(6486002)(71200400001)(2616005)(6636002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnR5MEcrMWRPangybStuTUZjbXR6SEJNOTI0S3lEMmMwQnl2cXdGelFLRm1K?=
 =?utf-8?B?MGJGS0FlMEpEYnlIYjhJWlpZWDR1ZGRaQmJUdnRYZVZ6MnBidnRXOTQzQTBC?=
 =?utf-8?B?b2pZMmlpb0o3WElLeFl1YTNpeEp1OG42S0NVQi94TDkyZkJOQWpQNjdvL2px?=
 =?utf-8?B?eXpiRy9UWWlSUldBdFF4UnJmVElZa2kzclZIOVVaZUg5UkFRUDN5WFc1R1Nk?=
 =?utf-8?B?YnhCeU1naGcxSTVjRU1qemt1c2VnYmZIZEZ3d0JlajFCWDRrV29TS0taYnVq?=
 =?utf-8?B?cEFhdG80Y09vM1pqL0xqV0V2MmM2R3JsMWFSRCsyUXlOR3JPU0tVMlFXcFNJ?=
 =?utf-8?B?eThsQmFqaUdnWkZTRzhmSk1PK2xjYUdJeG1VWW9FUjdDTEV4cHF6Mm01NDhy?=
 =?utf-8?B?NnRkWnoweEhnTC9XMWQ3MVZrbFpmS0NWeTMrUG8zTVZVOUtOME5Ic0JadFIz?=
 =?utf-8?B?YVVKTVFPZnFoRS9RODhtZ282TTNhZ1Yyc0pDcnZXcGxQeGQvVm1YS2pQV0NU?=
 =?utf-8?B?b1JRd3Bwd01kZ1IxL0xyclN5QUNab3E4ejFtUDdhYUtONDJXdmxwVk8wUWtU?=
 =?utf-8?B?STJYaENlSkkxc0x1dVV2azNtc0RTQ0cybWRwZVEvaWdVbmJQTFNNd091UWhl?=
 =?utf-8?B?SitMNE5LOHU5aWE1ZiswRjJUYi9wOE5RaVNwanNxNzV2VENCZHZlRGgrU1Bn?=
 =?utf-8?B?ZURBRTlSb28wMDJFMlVhalFCcFNNOE9DZE5yNldyY0ppRDl2eTNSd2pMN3Zs?=
 =?utf-8?B?RVNVRXpTdnVmbm95QkhYSHlLSGRLcDdSb1ZiTmQ5YW1LekVJbzZhYzU2YXVz?=
 =?utf-8?B?SDR0cXZWU2FwWjJWQTc5VHRCTGZzQk1DNEhNbFBEUlRJZU83V2FlKzRXZC9R?=
 =?utf-8?B?RHNYTFFsUGFzWGlQclQwbzFwcDE0RXpqdUxPa216WWo3RGdJZkNWeDgzT0FL?=
 =?utf-8?B?VkptU3hDaFNhekR4eFZwWUFPajhTaUg3b1owd2ZpVkRFMkxHNWo3VVRGdGZX?=
 =?utf-8?B?bm42dzZHUnU4S25Nc0R0a1p5T3JYRmpibWRSN1ptVWFkbzZSYjc3cG9QNk1a?=
 =?utf-8?B?K05CcjVyTjV4UFZuS3UralRZcU5sL1MvaXRJclJFTGxjWk54azNGZjZ1MG9x?=
 =?utf-8?B?ZjJpczFheVM3U0pjY25iNmJnMXNuM1BXeEErTHg0SE1SWG5QU3BWTzhDd2dx?=
 =?utf-8?B?OFEwd2wrSHRyQ1FFTFJPcUFERTIySlhjRXdYcjNwTkNjNldJN3J5SzVzb0lv?=
 =?utf-8?B?Zk9LMk1QbmFac1l3d2pnb2I3WEtKUHVWVjF1c1A0SEtOVjZ6V095U1RwdUNp?=
 =?utf-8?B?azFlaXR5N1NaVHQya1RtVGFuVlI5WHBXYmdTcG9OQlFXR1RPRVkxQUpYcWxT?=
 =?utf-8?B?WDVCSUxQaC95QlV5NUtiTzBBVUtVdlNWeHc5SFVSSFVlcHlJZzVpUjVEVlFm?=
 =?utf-8?B?STlWNkxhQklMRmhlRHQyZjRoc2tFWFp6WWpHRHkzeFFiNWVsRExDWXFWZFhW?=
 =?utf-8?B?bm8wdDNrMk04OFhjMW5YWTliZHFYeTAzR2VVZTdMS0tYWkJsWkg1RkgwV0Jj?=
 =?utf-8?B?ZXRPL2RhR0xWZlBtbElKaXRaUTNTMTRZRm0vaXRpbWNWS0E3OUtVUzB3dWR3?=
 =?utf-8?B?aXVkQXFrSTdvUTVRcFhVcDJGaTBSeDlrRGRyUUZxOU96azZLVXFVVWdUV0hT?=
 =?utf-8?B?aXBQZEhxNGc1K1cveE9yNVluOHBKUS9rMklCNlZZWUlsWFB4K252M0dKNk12?=
 =?utf-8?B?RjNjdUZZM0hadlc2QzFtUVovYlZoZmpkM0VXNmlUQnMzMnlYZEFwdkNvYVR0?=
 =?utf-8?B?TEp0VDdTdzd3VHRBMEEyMXZFc04rRjF6V0J5MnBGeU11dFM3ZmFiZE9PQnlP?=
 =?utf-8?B?MWs0Wnh4OUR3d01ieHlHL29nYlg5VHdpVWpISmlYY3NEUllEUWRqZWRLYktO?=
 =?utf-8?B?Rk9tdm1Pdmd5SG5vS3ZNc0FrRGNScDZCbGF1aG52TmYvVHNoWUE2Qnp5Y2I1?=
 =?utf-8?B?bUNOSkZTdkluQVZFbkdHZk40VVYrVEEzeGV2V00wQkxOL1l2MVAxK3RPdkRh?=
 =?utf-8?B?blVYZHllVFF0aURIUWFyT1dsK2VIUng5RmJOc3ZIbXVPWTYvWHdpZ1VYSTVL?=
 =?utf-8?B?Y1p2eHAxbklFcTc5dmErbEpxR0ZMYUxGWDYxL3V3dDRHdExPTzFxRWtMd2E2?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AFEEA61855510418F7FC31A25DEA51B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fa41a8-9583-4d29-b4f2-08dc20f356b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 17:54:28.3065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D46jI9hrbQ//sPNjHQ8pLqPHItXjlGChZLAtsEdvpA1bQBLoRjzUh20xiAKaOsT0eVs0phPAAhphlA0tyszlUgx2cMImubAKDvEPQ6t+gVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5489
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

T24gV2VkLCAyMDI0LTAxLTI0IGF0IDE1OjIwICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gV2VkLCAyMDI0LTAxLTI0IGF0IDE1OjE2ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+ID4gT24gTW9uLCAyMDI0LTAxLTIyIGF0IDE4OjQzICswMDAwLCBTb3V6YSwgSm9zZSB3cm90
ZToNCj4gPiA+IE9uIE1vbiwgMjAyNC0wMS0yMiBhdCAxODozOCArMDAwMCwgU3VtbWVycywgU3R1
YXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMDk6MDQgLTA4MDAsIEpv
c8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiA+ID4gU29tZSBpbnN0cnVjdGlvbnMg
cmVxdWlyZXMgY2Fub25pY2FsIGFkZHJlc3MgbGlrZQ0KPiA+ID4gPiA+IE1JX0JBVENIX0JVRkZF
Ul9TVEFSVChVTURzIG11c3QgY2FsbCB4ZV9leGVjIHdpdGggYSBjYW5vbmljYWwNCj4gPiA+ID4g
PiBhZGRyZXNzDQo+ID4gPiA+ID4gZm9yIFhlMispLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNv
IGhlcmUgYWRkaW5nIGZ1bmN0aW9ucyB0byBjb252ZXJ0IHJlZ3VsYXIgYWRkcmVzcyB0bw0KPiA+
ID4gPiA+IGNhbm9uaWNhbA0KPiA+ID4gPiA+IGFkZHJlc3MgYW5kIGJhY2ssIHRoZSBmaXJzdCB1
c2VyIG9mIHRoaXMgZnVuY3Rpb25zIHdpbGwgYmUNCj4gPiA+ID4gPiBhZGRlZA0KPiA+ID4gPiA+
IGluIHRoZSBuZXh0IHBhdGNoZXMuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQ2M6IFJvZHJpZ28g
Vml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+ID4gPiBDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gLS0tDQo+
ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfCAxNSArKysrKysrKysr
KysrKysNCj4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCB8wqAgMyAr
KysNCj4gPiA+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ID4gPiA+
IGluZGV4IGFiNDE3ZjRmN2QyYTcuLmI0Y2RjZjFiMjA4MWEgMTAwNjQ0DQo+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiA+ID4gQEAgLTcyNywzICs3MjcsMTggQEAg
dm9pZCB4ZV9kZXZpY2VfbWVtX2FjY2Vzc19wdXQoc3RydWN0DQo+ID4gPiA+ID4geGVfZGV2aWNl
DQo+ID4gPiA+ID4gKnhlKQ0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oHhlX2Fzc2VydCh4ZSwgcmVmID49IDApOw0KPiA+ID4gPiA+IMKgfQ0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiArc3RhdGljIGlubGluZSBpbnQgaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoc3RydWN0
IHhlX2RldmljZQ0KPiA+ID4gPiA+ICp4ZSkNCj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoHJldHVybiB4ZS0+aW5mby5kbWFfbWFza19zaXplID4gNDggPyA1NyA6IDQ3Ow0K
PiA+ID4gPiANCj4gPiA+ID4gV2h5IG5vdCBqdXN0IHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgLSAx
Pw0KPiA+ID4gDQo+ID4gPiBXZSBoYXZlIHBsYXRmb3JtcyB0aGF0IHNldCBkbWFfbWFza19zaXpl
IHRvIDM5LCA0NiBhbmQgNTIgYnV0IHRoZQ0KPiA+ID4gY2Fub25pY2FsIGFkZHJlc3MgYm91bmRh
cmllcyBpcyA0OGJpdCBhbmQgNThiaXQgYml0cy4NCj4gPiANCj4gPiBobS4uIEkgZmVlbCBsaWtl
IGl0IHdvdWxkIGJlIG1vcmUgY2xlYXIgdG8gaGF2ZSBhIGNhbm9uaWNhbCBzaXplDQo+ID4gdGhl
bg0KPiA+IGFuZCB0aGVuIGRvIChjYW5vbmljYWxfc2l6ZSAtIDEpLg0KPiANCj4gTGlrZSB0aGlz
Pw0KPiANCj4gc3RhdGljIGlubGluZSBpbnQgaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoc3RydWN0
IHhlX2RldmljZSAqeGUpDQoNCldlbGwsIHRoaXMgbmFtaW5nIGRvZXNuJ3QgbWFrZSBzZW5zZSBp
ZiB3ZSBkbyBpdCB0aGlzIHdheSBJTU8uDQoNCk1heWJlIGp1c3QgdmFfdG9wKCkgb3IgdmFfbWF4
KCk/DQoNCk9yLCBmb3IgaW5zdGFuY2UsIGluIGk5MTUgd2UgYXJlIHVzaW5nIHBwZ3R0X21zYjoN
Cmk5MTVfcGNpLmM6CS5wcGd0dF9tc2IgPSA0NywgXA0KaTkxNV9wY2kuYzoJLnBwZ3R0X21zYiA9
IDQ3LCBcDQppOTE1X3BjaS5jOgkucHBndHRfbXNiID0gNTYsIFwNCg0KYXMgYSBwZXItcGxhdGZv
cm0gZmVhdHVyZSBmbGFnLg0KDQpJIHRoaW5rIGFsc28gdGhlcmUgd2FzIGEgY29tbWVudCBoZXJl
IGFib3V0IGF2b2lkaW5nIHRoZSAiaW5saW5lIiwgd2VyZQ0KeW91IHBsYW5uaW5nIHRvIGFkZHJl
c3MgdGhhdD8NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gew0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgPiA0OCA/IDU4IDogNDg7DQo+IH0NCj4gDQo+IHU2
NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBh
ZGRyZXNzKQ0KPiB7DQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc2lnbl9leHRlbmQ2NChhZGRy
ZXNzLCBoaWdoZXN0X2FkZHJlc3NfYml0X2dldCh4ZSkgLQ0KPiAxKTsNCj4gfQ0KPiANCj4gdTY0
IHhlX2RldmljZV91bmNhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQg
YWRkcmVzcykNCj4gew0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGFkZHJlc3MgJiBHRU5NQVNL
X1VMTChoaWdoZXN0X2FkZHJlc3NfYml0X2dldCh4ZSkgLSAxLA0KPiAwKTsNCj4gfQ0KPiANCj4g
PiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4g
PiA+IFRoYW5rcywNCj4gPiA+ID4gU3R1YXJ0DQo+ID4gPiA+IA0KPiA+ID4gPiA+ICt9DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICt1NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6ZV9hZGRyKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLCB1NjQNCj4gPiA+ID4gPiBhZGRyZXNzKQ0KPiA+ID4gPiA+ICt7DQo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHNpZ25fZXh0ZW5kNjQoYWRkcmVzcywNCj4g
PiA+ID4gPiBoaWdoZXN0X2FkZHJlc3NfYml0X2dldCh4ZSkpOw0KPiA+ID4gPiA+ICt9DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICt1NjQgeGVfZGV2aWNlX3VuY2Fub25pY2FsaXplX2FkZHIoc3Ry
dWN0IHhlX2RldmljZSAqeGUsIHU2NA0KPiA+ID4gPiA+IGFkZHJlc3MpDQo+ID4gPiA+ID4gK3sN
Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gYWRkcmVzcyAmDQo+ID4gPiA+ID4gR0VO
TUFTS19VTEwoaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoeGUpLA0KPiA+ID4gPiA+IDApOw0KPiA+
ID4gPiA+ICt9DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuaA0KPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4g
PiA+ID4gaW5kZXggYWY4YWMyZTllMjcwOS4uY2UyMGY2ZmU2MjE5YSAxMDA2NDQNCj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiA+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiA+ID4gPiBAQCAtMTc1LDQgKzE3NSw3
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbA0KPiA+ID4gPiA+IHhlX2RldmljZV9oYXNfbWVtaXJxKHN0
cnVjdA0KPiA+ID4gPiA+IHhlX2RldmljZSAqeGUpDQo+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiDC
oHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgc2l6ZSk7
DQo+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiArdTY0IHhlX2RldmljZV9jYW5vbmljYWxpemVfYWRk
cihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0DQo+ID4gPiA+ID4gYWRkcmVzcyk7DQo+ID4gPiA+
ID4gK3U2NCB4ZV9kZXZpY2VfdW5jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgdTY0DQo+ID4gPiA+ID4gYWRkcmVzcyk7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+IMKgI2Vu
ZGlmDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gDQo+IA0KDQo=
