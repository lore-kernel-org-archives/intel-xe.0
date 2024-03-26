Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B781C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 15:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C753B10ECAB;
	Tue, 26 Mar 2024 15:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZ4gKpfg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4FC10F071
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711468397; x=1743004397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KuVSWb0uZn3clofZRrO4mD9bC/yGtncmAZzVolIRBU8=;
 b=PZ4gKpfgrINzcgWMEg0tP7TVb4C7cCRTc+8vbpb/yVokWsdk2/vs3rr+
 8+lLDplKovXWLLr+Gx2ChYasuGMMdW+gscD4mFhQEJorVWrn7zMOA+LV9
 ob6HGg57YkiE5hl9vUL51EDdT7Q6wwGGRxXjdhRS7+ICaSO5m8x+sRBaT
 nEsfyuQrR7VkkIb27eZLXR3pqAi+LPmKYbJrzojFzIXALv6eZ4rgbGQlm
 SBHX8xNLmash4XLhz9JPrQN4UwRa0h3qvc9uLuJXwMYt6qU29VXWUMWh+
 MjETU1xlevqRbQj80YPtdg7luavWrzE7GXJSu5QX+96oqfSgM3ueTEOAh A==;
X-CSE-ConnectionGUID: AcvnyIB/T3eKLuZeSKaycg==
X-CSE-MsgGUID: Pj7jHcJoS8uzz6llm3zi4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10324454"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10324454"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16385612"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 08:52:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 08:52:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 08:52:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 08:52:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 08:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbVsGK9HhRCLZjHpZXqeD+tF/+wceFUvGQhDCgrBeS5KHl7cZLpbwSXYzTdZHN2IIO8QoKXVUa9FGPejfK8JKf9QUNUGSej+VqQ0BvOYtfjdEzjqLj4pp9+8MPm9v1gXOdhoxNVY2GB2SomlrLqguHA34mfjmldvhMnJPyS9GurrVj8Oub1y+y2tFa/TZ86RctR7Dt2kHhtl49tXl3DohRtkC6X79NgAVvSh1OI/5XpO6YU2yTH9OMy7/LQblhootZEBRvwA/2hHI67ZvTlZaoZHf41LFkDt55prPeUwLYZZ2iGkarRs7bQ7SxBYmGGSNChF2Fo/qoDVzHkhHvDJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuVSWb0uZn3clofZRrO4mD9bC/yGtncmAZzVolIRBU8=;
 b=IHSUCxpMmpxqBlt/DiDtgXyoWJvUGH7XkXwHcrrbFNpP1lwXwbn0Ev8P8Ryv31ECN4A7+sWBniz62fJdQuCYUFpu6HPwE/AOYSBBsABpT3AlrTLJEUo35O1h3DonqQZX2ZRS5/vyqm/1rbHxiCZC4CUYeEyrWyhsrtFWTkE7oaVw+dVcVWEPKuoiYRGRAvFPOdNAgqhweBaqIV1guLDKijBz3hhi1M4e8ejcYgtGvGdc1B3+8KRSgVGsJsH7ZnmIc9Rrz8MUz+EwOddT2H4b02vhl0YFLYgVLtwhAuCSo/EgPixLzGEklkJZ5gkxst5TcmneWjCK1Iy8v/1hq8fynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 15:52:45 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 15:52:45 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Topic: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Index: AQHaegrqUXaKghHnyUW/Q8HLczM2hbFEAAAAgAAb5ICAAC/WAIAAAkgAgAXl2YCAAANWgA==
Date: Tue, 26 Mar 2024 15:52:45 +0000
Message-ID: <beb3b7e6a062008afda7007ca40606f848a626e5.camel@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
 <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
 <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
 <ec7b3393368e3371228256785e9edcb0016425ab.camel@intel.com>
 <1226b37a-b163-4b03-97b7-863dc258dca4@intel.com>
 <91ee9ae7-105f-4cfd-8e80-4a3caac15fbd@intel.com>
In-Reply-To: <91ee9ae7-105f-4cfd-8e80-4a3caac15fbd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ1PR11MB6082:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s/8XbvAxdMlx2hTyHgiYb1plXeI865jiSOv+yjBJQ7+0mhzizQJLBzw/bsQ5IPbLtfTPhhmkFRKfa6H40kCksQkm79HV/XzdqkJUdfYJ2WWmLNLGYoFQ/EDu3QDToltuTGK99bTUrMiBN/G1Z5Ut+oprUECVDxmdJI4avNoO3wAto/JYmUcJTooR6ViZrWfeY9A3XKvz+sR/nlnNa+n8xrFpuVsROm5XfMsVdDswczAShwaFz5NCumjjTMMzc7JQRjJAmAB3E6DWli83qhGtcEEzfI/BdHcpS7JCN2po1BEvswo8AQKgCNwXEUhGPjThzrXW2BejMiF4y3BZGfz5582pabPVzr9O2rqvrMtLpePa9IsVDP1To95RbtxW2ovcE8YUw0s/PE3MLHHHGpM3y/m5LKQfmbIO20mxoHWS21COfe4p769rZV0bie9W8zG8MWgUq2uqwDcqPtS2S0wI7CzgMPABUvVnRRuenjE8j3ww8BP4nV4Dbtte2QHVMoMO85d/O+mePXJbZwXLDjxCDm4I65awl5owdJm5oTcqnrHW+0BvBYLxCAxPpbAhrvlqiD8m7Xk2ZkElQsWJ5tj5+hjtxtYo+DV2Cg2r6uTgVoI+Ikml+noZ0dwgBGREivJGWSAXIzeAWsFRV9+6Cq0LNHfzcjE+8DkA4dc1QEIkMSs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SklqRHZ4aTZGSTNQWDBON0FlNjlnWTVGcHNVK0FJTnlpT1VCNWswYVRaRWpr?=
 =?utf-8?B?SWZxdGYvUG9vQW9JNjl1czNHVkRNN3JxenNXT2lOZWN0cWcvYzNGdVl1N2JL?=
 =?utf-8?B?M1hxNHBWQTdtMUpFUjl4eFJJeVdVMFZlQjRrdHBxY2ZTcktnOHBwMGpRSDJE?=
 =?utf-8?B?VmJMYVFVbDcxQ0VmVlJibGI1My9SQTV6bFB0VWViTGhsM1Fjb3A2ZUozclVl?=
 =?utf-8?B?ZGpqM0d2QllxM3hXY05sUUZ0a1pHZHJLdGpiL01yNjh3QXZpUEh3aC9iUnlu?=
 =?utf-8?B?T1MrTHZndUU4R3ZjUDYzRGkrZnhadnVMREJmN1l4NUgvVW9ySTU2NEFHTC9w?=
 =?utf-8?B?WGJtYy8vendjVXhXK0NtV3FRMG1weE1lOWIzM1RoUUhGQ3ZmNWtKbHJ5SHZU?=
 =?utf-8?B?aEFPMUdtMnlqbFhCekp2aktMVldlM2NqQVRCNy9NM1NDVVRJRWRhSG5vRkFH?=
 =?utf-8?B?WTYrVE9DemVuTEk1Y1FKd0RtMVFFK3hrYklUN2RkNHc0OVdRSEpGVzBMbVJV?=
 =?utf-8?B?Wmhyb29UMy9VejdOY1Z2dTFVU3R3TG0vSThyWFBwTllmL1pWazZiTmlzZGhP?=
 =?utf-8?B?U1ZmSUc4WFI5SlpRdjRsUU1kTWgvWVlNQXJPV3NlUFFoZnIvbzcwOGlRNVRC?=
 =?utf-8?B?b2V0Z3Q3ZExINjFpVlN4TG1VT1U3a2pEUGhabDRBa0tSc05wRmtzeUZNT0dK?=
 =?utf-8?B?SHJ5cUJLVFo4YmY2aDk0ekV4RlRIYmxsWXpPeWxFSUVMZXpzSjNPZFRlQTha?=
 =?utf-8?B?VFVLR0w4RFhTUSsyVnlZcVdxSFRyOGl5M3VEOXM3bDBoeHJJZExDa0sySW4r?=
 =?utf-8?B?d3VqSm9OSU1HbHM3N3Jhc1hSSGRTY0Rlc2hKd0RYRm0vZFNIcmU0eFZGVys4?=
 =?utf-8?B?THExd1RsM1Ixdmg2ZTZONDVrRjZSM1daNUZrUEtCUDlJR3ZGVVR2R1krT3Nv?=
 =?utf-8?B?Tkc4VjZ1S2Y4MlVncnlBNzhxcndCdVREVFJjQ0J2VHFTZjhZSDNGSnFNRkZK?=
 =?utf-8?B?eHBRUmJ4UFIycVRsUGxpS3hHc3pVTDF5bTFydjNLN0ZNSE91aTZQNDNDbDIz?=
 =?utf-8?B?RTN2eU1DRGxkUkxkMVdYVHZKK0xOZ3o0OGlUeXAvWkMrazQwOTRDREk2KzBt?=
 =?utf-8?B?eURPK1QyeEsyeEZtVjRYTHJ5OXRNNDRMTjRyS2V5cnJtcjNPdjBxYiszS1JU?=
 =?utf-8?B?S2d5QXltdEppQjVCZ2xLS1Z2aTN3VmlaU0t5T24xRUtGRmgrWnVLekVJa201?=
 =?utf-8?B?S0Z2aWNsUFJaUnlTY2xVRCtwZlAvV2pFU2R2elU0NFVsRksyZXlhMVlTU3Nz?=
 =?utf-8?B?NlZDeUxhSS9PelYxVHE0OXFORWRaUFl0ZVpUNUxwMkpJeWdGVERNNDdTQUFZ?=
 =?utf-8?B?ejJ2eldHelJMOXo2MEdSZFFBRHFrTlR0d3dtSWd4WXl5YTB3R1g2QWdiK04z?=
 =?utf-8?B?V3Z3Tm5veVZOUy9yeGdPWlp0bzRrbXBSYmpmSVAwRFh0V29PNEluMkhKYXJv?=
 =?utf-8?B?YlJqSzRnSnhXakgzdmdQTXMrRVhGN2hvWUF1Qmx6LzJDb1p4OTRHOE5BcklC?=
 =?utf-8?B?bHVzcE5lY3hTMEhMcVBmOEtnMENUYkNZRHVJOHo1bVcvcXc5R1U5amg0THln?=
 =?utf-8?B?SjF5NTV1SGhnVURMYTRHOHZMU1ZNaEMrbzdvcXd3b3JxaVFTVGZPWTZtSC9Y?=
 =?utf-8?B?Wk1MMER5VkJxUHc2Mm9nUlAxQmhRb09zd1N0bmpvSWw5Q25XM2FjbEFZZnNI?=
 =?utf-8?B?NEZWaGI4RE85OVppRmg2SlA4TlJLTmtZL056Rlp4SU5rWUkyOXNlcG5IeGlk?=
 =?utf-8?B?NjlpYWJFOUpOSDB0bDJCMEFLcTZXUHhMbmZnc0J1bUZjZzRTbElLcndHaFFV?=
 =?utf-8?B?L3ZhakYxVkxuV1ROTi9mM0JhaEhkemgwcndnMVdua0laZVBLL0dvUDBHYmtD?=
 =?utf-8?B?S3ZaNGR5OEsrQ2FmSkQvSVJUL3YrYmlsa3NQbEtoWkxtY3QwWTlUaFdVZjVT?=
 =?utf-8?B?bW1uVnNzL2VtSWN6L2lSU1p5bnVjRCsxNUZjQm1Da1ZwUmRmMFBSTkdqOENa?=
 =?utf-8?B?SmRrVks5OHlaUlprL2g3R21oNW1zNlVwWjBETmZPTEdjMlZST29oUHpQWUFD?=
 =?utf-8?B?Zm9GVmJBS1lzTFFTdGcyeVJYblBPT1RabVlCQ0RWbWgvZFJhL2ZELzJTVWxm?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0998540593DA16468D49C2E9D99D50DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921792aa-965b-4e14-e3ac-08dc4dacc78a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 15:52:45.6752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nyl1qcKxpwY4UFloaABKsVKCX2QFJShpX96+YKdOegYxnKZrkWF/XNmeSCc3YhgOZml/sQ/ANsHFbMuD3AuAdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
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

T24gVHVlLCAyMDI0LTAzLTI2IGF0IDExOjQwIC0wNDAwLCBEb25nLCBaaGFuanVuIHdyb3RlOg0K
PiBTZWUgbXkgY29tbWVudHMgaW5saW5lIGJlbG93Lg0KPiANCj4gUmVnYXJkcywNCj4gWmhhbmp1
bg0KPiBPbiAyMDI0LTAzLTIyIDU6MzYgcC5tLiwgRG9uZywgWmhhbmp1biB3cm90ZToNCj4gPiBT
ZWUgbXkgY29tbWVudHMgYmVsb3cuDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBaaGFuanVuDQo+
ID4gDQo+ID4gT24gMjAyNC0wMy0yMiA1OjI4IHAubS4sIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+
ID4gT24gRnJpLCAyMDI0LTAzLTIyIGF0IDExOjM3IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIDIwMjQtMDMtMjIgYXQgMDk6NTcgLTA3MDAsIEpv
c8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiA+ID4gT24gVHVlLCAyMDI0LTAzLTE5
IGF0IDA3OjM2IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+ID4gPiA+ID4gPiBQb3J0IEd1
QyBiYXNlZCByZWdpc3RlciBjYXB0dXJlIGZvciBlcnJvciBjYXB0dXJlIGZyb20gaTkxNSB0byBY
ZS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlcmUgYXJlIDMgcGFydHMgaW5zaWRlOg0K
PiA+ID4gPiA+ID4gLiBQcmVwYXJlIGZvciBjYXB0dXJlIHJlZ2lzdGVycw0KPiA+ID4gPiA+ID4g
wqDCoMKgwqAgVGhlcmUgaXMgYSBibyBjcmVhdGUgYXQgZ3VjIGFkcyBpbml0IHRpbWUsIHRoYXQg
aXMgdmVyeSBlYXJseQ0KPiA+ID4gPiA+ID4gwqDCoMKgwqAgYW5kIGVuZ2nCoCBuZSBtYXAgaXMg
bm90IHJlYWR5LCBtYWtlIGl0IGhhcmQgdG8gY2FsY3VsYXRlIHRoZQ0KPiA+ID4gPiA+ID4gwqDC
oMKgwqAgY2FwdHVyZSBidWZmZXIgc2l6ZSwgbmV3IGZ1bmN0aW9uIGNyZWF0ZWQgZm9yIHdvcnN0
IGNhc2Ugc2l6ZQ0KPiA+ID4gPiA+ID4gwqDCoMKgwqAgY2FsdWF0aW9uLiBPdGhlciB0aGFuIHRo
YXQsIHRoaXMgcGFydCBiYXNpY2FsbHkgZm9sbG93cyB0aGUgaTkxNQ0KPiA+ID4gPiA+ID4gwqDC
oMKgwqAgZGVzaWduLg0KPiA+ID4gPiA+ID4gLiBQcm9jZXNzIGNhcHR1cmUgbm90aWZpY2F0aW9u
IG1lc3NhZ2UNCj4gPiA+ID4gPiA+IMKgwqDCoMKgIEJhc2ljYWxseSBmb2xsb3dzIGk5MTUgZGVz
aWduDQo+ID4gPiA+ID4gPiAuIFN5c2ZzIGNvbW1hbmQgcHJvY2Vzcy4NCj4gPiA+ID4gPiA+IMKg
wqDCoMKgIFhlIHN3aXRjaGVkIHRvIGRldmNvcmVkdW1wLCBhZG9wdGVkIGNvbW1hbmQgbGluZSBw
cm9jZXNzIHdpdGgNCj4gPiA+ID4gPiA+IMKgwqDCoMKgIGNhcHR1cmVkIG5vZGUgbGlzdC4NCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBKdXN0IHNvbWUgbm90ZXMgYWZ0ZXIgdHJ5aW5nIHRoaXMgdG8g
ZGVidWcgYSBpc3N1ZSB3aXRoIHRoaXMgc2VyaWVzOg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IC0g
Q09ORklHX0RSTV9YRV9DQVBUVVJFX0VSUk9SIGlzIG5vdCBhIGdvb2QgbmFtZSBmb3IgYSBjb25m
aWcgdG8gDQo+ID4gPiA+ID4gZW5hYmxlIEd1QyBiYXNlZCBjYXB0dXJlLg0KPiA+ID4gPiA+IMKg
wqDCoMKgLSBpbiBteSBvcGluaW9uIHRoaXMgc2hvdWxkIG5vdCBldmVuIGV4aXN0LCBhbHdheXMg
Y2FwdHVyZSB3aXRoIA0KPiA+ID4gPiA+IEd1QyBpZiB4ZV9kZXZpY2VfdWNfZW5hYmxlZCgpIGlz
IHRydWUuDQo+IA0KPiAzIHJlYXNvbnM6DQo+IDEuIFRoaXMgR3VDIGJhc2VkIHJlZ2lzdGVyIGVy
cm9yIGNhcHR1cmUgaXMgZm9yIGRlYnVnIHB1cnBvc2UsIGRvZXMgaXQgDQo+IHN0aWxsIGltcG9y
dGFudCBmb3IgcHJvZHVjdGlvbiBzdGFnZT8gSSB3YW50IHRvIGxlYXZlIGl0IGFuIG9wdGlvbiBm
b3IgDQo+IHVzZXJzIHdobyBkb24ndCBuZWVkIGl0Lg0KDQpkZWZpbml0ZWx5IG5lZWRlZCBpbiBw
cm9kdWN0aW9uDQoNCj4gMi4gV2l0aCB0aGlzIG9waXRvbiBkaXNhYmxlZCwgZXh0cmEgbWVtb3J5
IGNvdWxkIGJlIHNhdmVkLiBJdCBtaWdodCBub3QgDQo+IGJlIGEgYmlnIGRlYWwgZm9yIFBDLCB3
aGlsZSBtaWdodCBiZSB2YWx1YWJsZSBmb3IgY3VzdG9tZXJzIHdobyB3YW50IHRvIA0KPiBzYXZl
IGZldyAxMEtCcyB0byAxMDBLQiBSQU0gdXNhZ2UuDQoNCm5vdCByZWxldmFudCBhbW91bnQsIGhh
dmluZyBhIGFjY3VyYXRlIHJlZ2lzdGVyIGR1bXAgaXMgbW9yZSBpbXBvcnRhbnQgYXMgYWxsb3cg
dXMgdG8gZGVidWcgaXNzdWVzIHJlcHJvZHVjZWQgYnkgY29zdHVtZXJzLg0KDQo+IDMuIFRoZSBm
ZWF0dXJlIHdpdGggYW4gb3BpdG9uIGlzIHdoYXQgd2UgaGF2ZSBpbiBpOTE1LCB3aGVyZSB0aGUg
ZmVhdHVyZSANCj4gaXMgcG9ydGVkIGZyb20uIFNvIG1ha2UgaXQgdGhlIHNhbWUgc3R5bGUgdG8g
YXZvaWQgdXNlcnMgbWlncmF0ZWQgZnJvbSANCj4gaTkxNSBjb21wbGFpbnMgYWJvdXQgaXQuDQo+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IC0gY29yZWR1bXAgZG9uJ3QgaGF2ZSBzb21lIHJlZ2lz
dGVycyBsaWtlIFNBTVBMRVJfSU5TVERPTkUsIA0KPiA+ID4gPiA+IFJPV19JTlNURE9ORSwgWEVI
UEdfSU5TVERPTkVfR0VPTV9TVkcuLi4NCj4gPiANCj4gPiBZZXMsIHRob3NlIHN0ZWVyaW5nIHJl
Z2lzdGVyIHByaW50IG91dCBpcyBtaXNzaW5nLg0KPiA+IA0KPiA+ID4gPiA+IEhlcmUgdGhlIG91
dHB1dCBpbiBMTkw6DQo+ID4gPiA+IA0KPiA+ID4gPiBhaCB0aGlzIGNvdWxkIGV4cGxhaW4uLi4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFvCoCAxNTIuMTg5Mzg2XSB4ZSAwMDAwOjAwOjAyLjA6IA0KPiA+
ID4gPiBbZHJtOnhlX2h3X2VuZ2luZV9zbmFwc2hvdF9mcm9tX2NhcHR1cmUgW3hlXV0gR1QwOiBH
dUMgZXJyb3IgY2FwdHVyZSANCj4gPiA+ID4gaXMgZW1wdHksIHRha2Ugc25hcHNob3QgZnJvbSBl
bmdpbmUuDQo+ID4gPiA+IFvCoCAxNTIuMTkwMjE1XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dIFhl
IGRldmljZSBjb3JlZHVtcCBoYXMgYmVlbiANCj4gPiA+ID4gY3JlYXRlZA0KPiA+ID4gPiANCj4g
PiA+ID4gYnV0IGJvdGggY29kZSBwYXRocyBuZWVkcyB0byBkdW1wIHRoZSBzYW1lIHJlZ2lzdGVy
cw0KPiA+IA0KPiA+IEkgZm91bmQgeW91IGhhdmUgYW5vdGhlciBwYXRjaDoNCj4gPiBkcm0veGUv
ZGV2Y29yZWR1bXA6IFByaW50IGVycm5vIGlmIFZNIHNuYXBzaG90IHdhcyBub3QgY2FwdHVyZWQN
Cj4gPiBJIHdpbGwgdGFrZSBhIGxvb2suDQo+ID4gDQo+ID4gPiANCj4gPiA+IEhpIFpoYW5qdW4N
Cj4gPiA+IA0KPiA+ID4gTWVzYSB0ZWFtIG5lZWRzIHRoZSBJTlNURE9ORSByZWdpc3RlcnMgdG8g
ZGVidWcgaXNzdWVzIGFuZCBJIGhhdmUgDQo+ID4gPiBwYXRjaGVzIGltcGxlbWVudGluZyB0aGUg
ZHVtcCBvZiB0aGlzIHJlZ2lzdGVycy4NCj4gPiA+IERvIHlvdSBtaW5kIGlmIEkgc2VuZCB0aGlz
IHBhdGNoZXMgdGhlIGxpc3Q/DQo+ID4gDQo+ID4gU3VyZSwgcGxlYXNlIHNlbmQgaXQuDQo+ID4g
DQo+ID4gPiANCj4gPiA+IEkgZ3Vlc3MgdGhpcyBHdUMgYmFzZWQgcmVnaXN0ZXIgY2FwdHVyZSB3
aWxsIG5lZWQgYW5vdGhlciB2ZXJzaW9uIGFuZCANCj4gPiA+IHNvbWVvbmUgd2l0aCBleHBlcmll
bmNlIG9uIEd1QyB0byByZXZpZXcsIHNvIGl0IHdpbGwgdGFrZSBhIHdoaWxlLi4uDQo+ID4gPiAN
Cj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gKioqKiBIVyBFbmdpbmVzICoqKioNCj4g
PiA+ID4gPiByY3MwIChwaHlzaWNhbCksIGxvZ2ljYWwgaW5zdGFuY2U9MA0KPiA+ID4gPiA+IMKg
wqDCoMKgRm9yY2V3YWtlOiBkb21haW4gMHgyLCByZWYgMQ0KPiA+ID4gPiA+IMKgwqDCoMKgSFdT
VEFNOiAweGZmZmZmZmZmDQo+ID4gPiA+ID4gwqDCoMKgwqBSSU5HX0hXU19QR0E6IDB4MDE2OTMw
MDANCj4gPiA+ID4gPiDCoMKgwqDCoFJJTkdfU1RBUlQ6IDB4MDI5ZDUwMDANCj4gPiA+ID4gPiDC
oMKgwqDCoFJJTkdfSEVBRDogMHgwMDAwMTkxNA0KPiA+ID4gPiA+IMKgwqDCoMKgUklOR19UQUlM
OiAweDAwMDAxOTY4DQo+ID4gPiA+ID4gwqDCoMKgwqBSSU5HX0NUTDogMHgwMDAwMzAwMQ0KPiA+
ID4gPiA+IMKgwqDCoMKgUklOR19NSV9NT0RFOiAweDAwMDAxMDAwDQo+ID4gPiA+ID4gwqDCoMKg
wqBSSU5HX01PREU6IDB4MDAwMDAwMDgNCj4gPiA+ID4gPiDCoMKgwqDCoFJJTkdfSU1SOiAweDAw
MDAwMDAwDQo+ID4gPiA+ID4gwqDCoMKgwqBSSU5HX0VTUjogMHgwMDAwMDAwMA0KPiA+ID4gPiA+
IMKgwqDCoMKgUklOR19FTVI6IDB4ZmZmZmZmZmYNCj4gPiA+ID4gPiDCoMKgwqDCoFJJTkdfRUlS
OiAweDAwMDAwMDAwDQo+ID4gPiA+ID4gwqDCoMKgwqBJUEVIUjogMHg3YTAwMDAwNA0KPiA+ID4g
PiA+IMKgwqDCoMKgQUNUSEQ6IDB4MDAwMGVmZmVmZmZmOTIwOA0KPiA+ID4gPiA+IMKgwqDCoMKg
UklOR19CQkFERFI6IDB4MDAwMGVmZmVmZmZmOTIwOQ0KPiA+ID4gPiA+IMKgwqDCoMKgUklOR19E
TUFfRkFERDogMHgwMDAwMDAwMDAyOWQ2OTY4DQo+ID4gPiA+ID4gwqDCoMKgwqBSSU5HX0VYRUNM
SVNUX1NUQVRVUzogMHgwMDAwMDAwMDQwMDAyNzljDQo+ID4gPiA+ID4gwqDCoMKgwqBSSU5HX0VY
RUNMSVNUX1NRX0NPTlRFTlRTOiAweDAwMDAwMDAwMDI5ZDk3MTkNCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiAtIGEgbG90IG9mIHN0eWxlIGlzc3Vlcywgc2VlICdDSS5jaGVja3BhdGNoJw0KPiANCj4g
QWZ0ZXIgcmV2aWV3IHRoZSBDSS5jaGVja3BhdGNoIG91dHB1dCwgYWxsIHN0eWxlIGlzc3VlcyBy
ZXBvcnRlZCBpcyBieSANCj4gcHVycG9zZS4NCj4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGlu
dGVsLmNvbT4NCj4gPiA+ID4gPiA+IENjOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMu
YWxleGlzQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQ2hhbmdlcyBmcm9t
IHByaW9yIHJldnM6DQo+ID4gPiA+ID4gPiDCoMKgIHY2Oi3CoCBDaGFuZ2UgaGFyZGNvZGVkIHJl
Z2lzdGVyIHNuYXBzaG90IGZpbGwgdG8gZm9sbG93IG1hcHBpbmcgDQo+ID4gPiA+ID4gPiB0YWJs
ZXMNCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgV2hlbiBjYXB0dXJlIGlzIGVtcHR5LCB0
YWtlIHNuYXBzaG90IGZyb20gZW5naW5lDQo+ID4gPiA+ID4gPiDCoMKgIHY1Oi3CoCBTcGxpdCBk
c3MgaGVscGVyIGNvZGUgb3V0IGFzIGFuIHN0YW5kYWxvbmUgcGF0Y2gNCj4gPiA+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqAgUmVtb3ZlIG9sZCBwbGF0Zm9ybSByZWdpc3RlcnMgZGVmaW5pdGlvbi4N
Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgU3BsaXQgcmVnaXN0ZXIgbWFwIHRhYmxlIHRv
IDMyIGFuZCA2NGJpdCBlYWNoDQo+ID4gPiA+ID4gPiDCoMKgIHY0Oi3CoCBNb3ZlIHJlZ2lzdGVy
IG1hcCB0YWJsZSB0byB4ZV9od19lbmdpbmUuYw0KPiA+ID4gPiA+ID4gwqDCoCB2MzotwqAgUmVt
b3ZlIGNvbmRpdGlvbiBjb21waWxhdGlvbiBpbiBjb2RlDQo+ID4gPiA+ID4gPiDCoMKgIHYyOi3C
oCBTcGxpdCBpbnRvIG11bHRpcGxlIGNodW5rcw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBa
aGFuanVuIERvbmcgKDgpOg0KPiA+ID4gPiA+ID4gwqDCoCBkcm0veGUvZ3VjOiBBZGQga2NvbmZp
ZyBmb3IgR3VDIGJhc2VkIHJlZ2lzdGVyIGNhcHR1cmUNCj4gPiA+ID4gPiA+IMKgwqAgZHJtL3hl
L2d1YzogVXBkYXRlIEd1QyBBRFMgc2l6ZSBmb3IgZXJyb3IgY2FwdHVyZQ0KPiA+ID4gPiA+ID4g
wqDCoCBkcm0veGUvZ3VjOiBBZGQgWEVfTFAgc3RlZXJlZCByZWdpc3RlciBsaXN0cw0KPiA+ID4g
PiA+ID4gwqDCoCBkcm0veGUvZ3VjOiBBZGQgY2FwdHVyZSBzaXplIGNoZWNrIGluIEd1QyBsb2cg
YnVmZmVyDQo+ID4gPiA+ID4gPiDCoMKgIGRybS94ZS9ndWM6IENoZWNrIHNpemluZyBvZiBndWNf
Y2FwdHVyZSBvdXRwdXQNCj4gPiA+ID4gPiA+IMKgwqAgZHJtL3hlL2d1YzogRXh0cmFjdCBHdUMg
ZXJyb3IgY2FwdHVyZSBsaXN0cyBvbiBHMkggbm90aWZpY2F0aW9uDQo+ID4gPiA+ID4gPiDCoMKg
IGRybS94ZS9ndWM6IFByZS1hbGxvY2F0ZSBvdXRwdXQgbm9kZXMgZm9yIGV4dHJhY3Rpb24NCj4g
PiA+ID4gPiA+IMKgwqAgZHJtL3hlL2d1YzogUGx1bWIgR3VDLWNhcHR1cmUgaW50byBkZXYgY29y
ZWR1bXANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL0tj
b25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDExICsNCj4gPiA+ID4gPiA+
IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqAgMSArDQo+ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19h
Y3Rpb25zX2FiaS5oIHzCoMKgwqAgNyArDQo+ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0v
eGUvcmVncy94ZV9ndF9yZWdzLmjCoMKgwqDCoCB8wqDCoMKgIDUgKw0KPiA+ID4gPiA+ID4gwqAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3ByaW50ay5owqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAz
ICsNCj4gPiA+ID4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgNiArDQo+ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2Fkcy5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyMjkgKysrLQ0KPiA+ID4g
PiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHNfdHlwZXMuaMKgwqDCoCB8wqDC
oMKgIDIgKw0KPiA+ID4gPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJl
LmPCoMKgwqDCoMKgIHwgMTMzMiANCj4gPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiA+ID4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5owqDCoMKg
wqDCoCB8wqDCoCAyMSArDQo+ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2NhcHR1cmVfZndpZi5oIHzCoCAyMjEgKysrKw0KPiA+ID4gPiA+ID4gwqAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19jdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAyICsNCj4gPiA+
ID4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5owqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA2OCArKw0KPiA+ID4gPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19s
b2cuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTc5ICsrKw0KPiA+ID4gPiA+ID4gwqAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxNSArDQo+
ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZ190eXBlcy5owqDCoMKg
IHzCoMKgIDI2ICsNCj4gPiA+ID4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3Vi
bWl0LmPCoMKgwqDCoMKgwqAgfMKgwqAgMjEgKy0NCj4gPiA+ID4gPiA+IMKgIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmjCoMKgwqDCoMKgwqAgfMKgwqDCoCAzICsNCj4gPiA+ID4g
PiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdHlwZXMuaMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMiArDQo+ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmPCoMKgwqDCoMKgwqDCoCB8wqAgMjYxICsrKystDQo+ID4gPiA+ID4gPiDCoCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lLmjCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDQgKw0KPiA+ID4g
PiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5owqAgfMKgIDEx
NyArLQ0KPiA+ID4gPiA+ID4gwqAgMjIgZmlsZXMgY2hhbmdlZCwgMjQyMSBpbnNlcnRpb25zKCsp
LCAxMTUgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gPiA+ID4gPiA+IMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuaA0KPiA+ID4gPiA+
ID4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVy
ZV9md2lmLmgNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+IA0KDQo=
