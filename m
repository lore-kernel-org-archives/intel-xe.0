Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87273C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 18:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DCC10E237;
	Fri, 24 Nov 2023 18:19:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD7C10E237
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 18:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700849995; x=1732385995;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XW7mISpHU6/bb+LVTAz7KzZHgQuXpZvcJIt9IlmCGgQ=;
 b=kvARScnLshov97SdPXTfd43HLufwMSEJW41u0Sx841UjgNohL06J7LMI
 aYkCWmgMKpSVqAPnEbTF8CMxQxX+FgWl9ABXdRmtGi4VHEETC+vMPSfSf
 8S3kcSc6k6IuzLjVecJKEMGYiFnTFvN/mGLTZpZg1HcfE4p5MBg/Yr+2H
 RPZQX08OLGTVZnYNpxA+An5XZK7D6ffipjqO9HcKzSs/oz0Ht306IoT48
 JgIWeoNqOrtUJ6uTR6WmNWrg43SmVtJzE9HxtNWb54x1gjnJh/6pzw11/
 19lpWt+TiEH4nIToSLf1G0tTrDEjMrorflpKAVF3nWdelq6lzZyF/OFWP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="458945310"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="458945310"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 10:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="802207977"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="802207977"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 10:19:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:19:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 10:19:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 10:19:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceTeWPAXgkryF0i/a6d/UvgPiyMswK98ge3QrmB1uK7fuhOCwVgxdwoahX7NvBbb73N+Jj1FmlojWCvJ+gf7WjJFbgWuYdvVtLWXAelN/tjxy5Gt8Qbg2m8N8OFWavU027UUdgXdu7o7O2LNgPhCVzEVM5E5ap7Zt2hs3d4+TQocmNTpyGBEoLNqKko3p4I/esovwAVoGpHIGaWZOrDNZ5yS8qjUduVCtJTPjRWJoz+jZRxacjhlMit6lg/dV+hPFXyIw0x7klzEe2nPIqcwcAP4fsHZMauWaLY1JswyO3t/nFyiW5acq60ZVgEPQaKvT/PG6PwQ/IFJVQs1MiMl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XW7mISpHU6/bb+LVTAz7KzZHgQuXpZvcJIt9IlmCGgQ=;
 b=hD0GzvF9QCu3rwAoH4BvCk4oHwPNXX5xKl/Di8WVWMRvbwlB41mQU3FG2qm8ho7M3GukFeTpBeF0iFqEDltjRV1aFb2+Ui0MHwzemQoAXsb4LbNRtCQwoEEyZVbssdbjEUY0/eGBUtijfahmyjB5aL1xvQ5d/3cAoWRMbsRZrHXaIdzJzppzxJowuZ9xEt24Uh/+p8hRfViF9LOgBtTVMjsWx0D96kKzoZ7RWaTAfirLJtCALfDQIiP6ZWDOB0xhhoM45cStoOwoCQTEMF9Uu9twi7I+j5MvtJEnoJYVPhdwpYLSBr67GMrCEf5G2MFX1zBgsnQ4/6wRB46OMCHsKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 18:19:48 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 18:19:48 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 05/14] drm/xe/uapi: Align on a common way to return
 arrays (memory regions)
Thread-Index: AQHaHVGdCSGilLqwwUaxlSeoga10hbCJyvaA
Date: Fri, 24 Nov 2023 18:19:47 +0000
Message-ID: <3c34b03bd2bab567ca6891b095332a2f2b4ddc29.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-6-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-6-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4518:EE_
x-ms-office365-filtering-correlation-id: c35fb887-c7c1-417b-ce06-08dbed19f139
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dv83Pza98kBvRkPHgr8QDj+1Q0AxI1fk4LTCfwjjoRK1e0aZkrbV7j087Meoh/6n2yYs542ol0fdkFmvGds6zTsnKeYvvw6YLGlWVQD56M0kQkN78lENkuJ+jz5hTEHW9PETn8Z4fb6eTvmQbepzd420cBhLuZpeD9bNkkTZ9PhsFYx+CsILfJpm+3oTRaq+mQwG9/aV8F4B+XAmkJL/ZDiBq3AoWxvDbtb4bQzJY88IMTDiYugkzEzEkETVWPk8ONb1MCoQICL7sY+4IDP6OFu8Hc6WARMdSuGKLlJvW8T4hIwFz8N+ByJHNeCyR51KKJsK0cXoELqo/Mqyt9/34/Tn6cbf4fmZ3W18H6MDGVRLs1mQDMXTw7fkccGygBDMHXLNf5T6YcAiXDKIuUsXCNrp3XhxUh7SsbzM4xP4i2RqHAf5vp2E3D+r19hc5la5AmiZxgL0hxiCN53xwUYni9KHG40BNiKf3i7wELWKI8zhD8TjmUe5DubOG1yGR4ScHobqdfBVqEB/nIwAP7bKqjinJItKHJaL8SnnlvaAxAI6VYX2GmHBPJcPRLO1eJUECYhGVgnBOQUI4HQQjO3Ynm8/LQlfr3MlImFtCQzMy7iQCiQQQV5L6aluFt5Yzrgo9RCQfCwpCGuqQ5pdGWNaFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66556008)(66946007)(66446008)(64756008)(66476007)(76116006)(110136005)(91956017)(6636002)(316002)(83380400001)(6512007)(2616005)(38070700009)(478600001)(6506007)(71200400001)(36756003)(6486002)(26005)(38100700002)(5660300002)(4001150100001)(82960400001)(122000001)(2906002)(41300700001)(86362001)(8676002)(8936002)(43043002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjJaUnpDRmhLUll5RXBscFNkKzB0dWVsRVdSelFWcUxIeWpxdTU1UHpXNEsr?=
 =?utf-8?B?QkFwZjJlZ2MvWmM4Rmk3YnNQUFJSaEkyNVVHVFNPbU96N1VrNFNudDNSQnBC?=
 =?utf-8?B?R3dkN2lrUi9TRUVQUHB3d3FJOUZuRUhaWkdZZlRUbFh5S3FxUkpCUFl4cEF2?=
 =?utf-8?B?TlRPWGJaYTJ2NnZKb3F3QVF4ZjNyTnQraUtJY3ovY0RrMHZESndRdkRuYkJ1?=
 =?utf-8?B?WnRJY09MWnQ0clBCbFdRZUdLWXlxY2Izd1p6elBLV2FSSGZhTTVyQ2pQU0dY?=
 =?utf-8?B?MWQ0aXVyUlNVK3VlM2lsQTdpWGg0YXAxRDBBbmo5MDMzQ2VoWC9iQ2w1N2Fo?=
 =?utf-8?B?MFNZZm1kT25ZSUNBdmFpcTRGeExtQjQxK2QzS0ErclBBeVR6NmtTdHg5R3Ns?=
 =?utf-8?B?L0ZVdENjZmJzN0JNSEo4RGw5ZmFKdkVIVzVyLzA4VVA3VTF5RjVZa0l1R3R3?=
 =?utf-8?B?d04rdWJGOUUyY1l2dXdJRFhselNXak53VjBQamZRWTdzYi9aWTU2UUNKb3dY?=
 =?utf-8?B?c3VHVndWQjlpN1lCVXpyZy8zaFZxTmxqN2VTa0dYUW5FT3liR3pIR09tYzB0?=
 =?utf-8?B?N1FUZGo4Qmg1NkNLZERZTkJTL2IxbzJ4THNBS1puZVJ5MTc1eEVRb3hhRDE0?=
 =?utf-8?B?eVV2ektRdHRkK3UyQkZaNDhMQTZXbGZ3N3QvTTJXbG5YOS8yVnJ0dk9lSC9q?=
 =?utf-8?B?bys1QnZ0SmZuVzIvU01ZUGxRVGZEVGxWaEZFdnlMQ2JvdEJtNnUyZjk1VDVS?=
 =?utf-8?B?cnBqbW1JNlpjZGNaNmlYWXNramFoQkVyWFYrSVBueUw2Ri9QL0FQc3hFaWs4?=
 =?utf-8?B?b0kyNmx5NGM1OTBjRDBGZ2hmYjJaUG5CbXl3N2tvNWhLUzBrZmlDUUdvMU9R?=
 =?utf-8?B?N2F6TkptRm5iMitIMnBqSXBxNldZRzRCYTgzK0tOOGE2S3AwODQwK3V3WCsz?=
 =?utf-8?B?WmIzMWNQYmZZeFlNMjlVL2JLMS9ZVE1qUnlGM0FIekZOQVhCRnFJWW9Lc0R3?=
 =?utf-8?B?RGU0aEtJSjVsSGtwWnRrNjFjeWFkYUlkejhwVzZQRXJ4UkdGRGNyMG1namJE?=
 =?utf-8?B?VGpmSFVIR0dFYWlRVlRXRElVc0ZJWjRtYytseTJOMnBGRGJSdG9nUEV3OThF?=
 =?utf-8?B?YnBPeG5WeThLdWVkWHB0ZHZvQU9UTXhmMHQ4YU9pd1BNdXorUU4xczl5WDQz?=
 =?utf-8?B?ME5PQlcxS3ovb290cEZtdW4rOHd3UjJsNWgrN2krMUlCNUprTTJnK1FHWXl2?=
 =?utf-8?B?aWpJTHpQWlRyS0lqMmJVVUl3VjdRNTRleGd3UmlWNWtLb2pDM0orcmd6RTRz?=
 =?utf-8?B?WmFPTUVFdTBlbXBHOW5RVzNUOHBkOHZ6SG5ZeEp3TEhnRVRBTWh3NFlzVnIr?=
 =?utf-8?B?SEluZ3RJd2xZRU9ISndHV1lFNFhDekRnQmkrT2JrQlZVOHEzL2p4VVBCVVlG?=
 =?utf-8?B?aVo0SGtmZ3Q2enVTenI0Y2ZwYTJsUmxFcnlNSlFYQzB1eTFLQ3RmRDFYYzhX?=
 =?utf-8?B?WUtWbWlNMmdOb0ZvUmZuRFRiSi95aWtFWjJUMk5lRlhGSy9jb01KcFhWQzlu?=
 =?utf-8?B?SndtUGtWcXRNTzdrRVAvSFA3VzZhSnBQcXg4YVJhTEtBK2pudHpGazcvTWZJ?=
 =?utf-8?B?dWs1L0JkWndpZzNDdWZpZ0d3VE9RVGNPdDQ5aTFvMFY1eE1PMnNqMnZMcHQ1?=
 =?utf-8?B?N2pHcVZRZUY4MWhkc3BrRk1xSC9WclUzcERidFlhRUFHdjA3MHlNRnpBN2ZL?=
 =?utf-8?B?VC9MZ3F0RVh3elNJRVZPcmVONys3R1RDQmJaenhRV0JBVm1qVjFnMlZwR0hM?=
 =?utf-8?B?bUo4OEJlUmoxdXlJaTRjelVScTFDL1JURHhMM1JhcHN4SDBxYzJmU3FJOWFm?=
 =?utf-8?B?bENCMjNEZ3dFbXRMVjZvUzNjbHNUTER2SlUyMk14eVhmWWF6K2dCY0xIcUFm?=
 =?utf-8?B?T3lDNXFwOWlySmh6RzJKTHpsdDZaVjFYdnQvTXgrMGxSZ3p6dnBZb05vakFn?=
 =?utf-8?B?V0tPOHI3Q1FMUWJSVmp6S3NjOHh2NEdFV2FadzM3R1pGc1E1WGltenBnUElk?=
 =?utf-8?B?RjcwQlY4U0d6WndlVGhtQWRHTFVjRkNXazhvZ1REaWN6Zjg5aGhmNDgzZ3lG?=
 =?utf-8?B?eVBZaVJnQm5FN1VvemMyTWdIbzFnTHdUd1VjSUZ4WFhZNHhrVTVUZWpQbU00?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6811D6B5A0F164F810FD586A5010101@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35fb887-c7c1-417b-ce06-08dbed19f139
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 18:19:47.9680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uHDaV2/DK9l65Qpm57qIfZ/0T+oZPC8clpT+C23FWDQyPZIaAOcXEtk3dhPdtKuCCModaSu2tnvttHjY+NNHRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/14] drm/xe/uapi: Align on a common way
 to return arrays (memory regions)
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

T24gV2VkLCAyMDIzLTExLTIyIGF0IDE0OjM4ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoZSB1QVBJIHByb3ZpZGVzIHF1ZXJpZXMgd2hpY2ggcmV0dXJuIGFycmF5cyBvZiBlbGVt
ZW50cy4gQXMgb2Ygbm93DQo+IHRoZSBmb3JtYXQgdXNlZCBpbiB0aGUgc3RydWN0IGlzIGRpZmZl
cmVudCBkZXBlbmRpbmcgb24gd2hpY2ggZWxlbWVudA0KPiBpcyBxdWVyaWVkLiBGaXggdGhpcyBm
b3IgbWVtb3J5IHJlZ2lvbnMgYnkgYXBwbHlpbmcgdGhlIHBhdHRlcm4gYmVsb3c6DQo+IA0KPiAg
ICAgc3RydWN0IGRybV94ZV9xdWVyeV9YcyB7DQo+ICAgICAgICBfX3UzMiBudW1fWHM7DQo+ICAg
ICAgICBzdHJ1Y3QgZHJtX3hlX1ggWHNbXTsNCj4gICAgICAgIC4uLg0KPiAgICAgfQ0KPiANCj4g
VGhpcyByZW1vdmVzICJxdWVyeSIgaW4gdGhlIG5hbWUgb2Ygc3RydWN0IGRybV94ZV9xdWVyeV9t
ZW1fcmVnaW9uDQo+IGFzIGl0IGlzIG5vdCByZXR1cm5lZCBmcm9tIHRoZSBxdWVyeSBJT0NUTC4g
VGhlcmUgaXMgbm8gZnVuY3Rpb25hbA0KPiBjaGFuZ2UuDQo+IA0KPiB2MjogT25seSByZW5hbWUg
ZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb24gdG8gZHJtX3hlX21lbV9yZWdpb24NCj4gICAgIChKb3PD
qSBSb2JlcnRvIGRlIFNvdXphKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0
IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jIHwgMzYgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4g
IGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMTIgKysrKysrLS0tLS0tDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggMGNiZmVhZWIxMzMwLi5mMzIxZWQ0ZDNiMGIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC0yNDAsMTEgKzI0MCwxMSBAQCBzdGF0aWMgc2l6
ZV90IGNhbGNfbWVtX3JlZ2lvbnNfc2l6ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gIAkJaWYg
KHR0bV9tYW5hZ2VyX3R5cGUoJnhlLT50dG0sIGkpKQ0KPiAgCQkJbnVtX21hbmFnZXJzKys7DQo+
ICANCj4gLQlyZXR1cm4gb2Zmc2V0b2Yoc3RydWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucywg
cmVnaW9uc1tudW1fbWFuYWdlcnNdKTsNCj4gKwlyZXR1cm4gb2Zmc2V0b2Yoc3RydWN0IGRybV94
ZV9xdWVyeV9tZW1fcmVnaW9ucywgbWVtX3JlZ2lvbnNbbnVtX21hbmFnZXJzXSk7DQo+ICB9DQo+
ICANCj4gIHN0YXRpYyBpbnQgcXVlcnlfbWVtX3JlZ2lvbnMoc3RydWN0IHhlX2RldmljZSAqeGUs
DQo+IC0JCQkgICAgIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gKwkJCSAg
ICBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAqcXVlcnkpDQo+ICB7DQo+ICAJc2l6ZV90IHNp
emUgPSBjYWxjX21lbV9yZWdpb25zX3NpemUoeGUpOw0KPiAgCXN0cnVjdCBkcm1feGVfcXVlcnlf
bWVtX3JlZ2lvbnMgKnVzYWdlOw0KPiBAQCAtMjY1LDM2ICsyNjUsMzggQEAgc3RhdGljIGludCBx
dWVyeV9tZW1fcmVnaW9ucyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJcmV0dXJuIC1FTk9N
RU07DQo+ICANCj4gIAltYW4gPSB0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRtLCBYRV9QTF9UVCk7
DQo+IC0JdXNhZ2UtPnJlZ2lvbnNbMF0ubWVtX2NsYXNzID0gRFJNX1hFX01FTV9SRUdJT05fQ0xB
U1NfU1lTTUVNOw0KPiAtCXVzYWdlLT5yZWdpb25zWzBdLmluc3RhbmNlID0gMDsNCj4gLQl1c2Fn
ZS0+cmVnaW9uc1swXS5taW5fcGFnZV9zaXplID0gUEFHRV9TSVpFOw0KPiAtCXVzYWdlLT5yZWdp
b25zWzBdLnRvdGFsX3NpemUgPSBtYW4tPnNpemUgPDwgUEFHRV9TSElGVDsNCj4gKwl1c2FnZS0+
bWVtX3JlZ2lvbnNbMF0ubWVtX2NsYXNzID0gRFJNX1hFX01FTV9SRUdJT05fQ0xBU1NfU1lTTUVN
Ow0KDQpuaXQ6IGNhbiB5b3UgYWxzbyByZW5hbWUgJ3VzYWdlJyB0byBzb21ldGhpbmcgZWxzZSwg
aXQgd2FzIG5hbWVkICd1c2FnZScgYmVjYXVzZSBvZiB0aGUgb2xkIHF1ZXJ5IG5hbWUuDQoNCg0K
PiArCXVzYWdlLT5tZW1fcmVnaW9uc1swXS5pbnN0YW5jZSA9IDA7DQo+ICsJdXNhZ2UtPm1lbV9y
ZWdpb25zWzBdLm1pbl9wYWdlX3NpemUgPSBQQUdFX1NJWkU7DQo+ICsJdXNhZ2UtPm1lbV9yZWdp
b25zWzBdLnRvdGFsX3NpemUgPSBtYW4tPnNpemUgPDwgUEFHRV9TSElGVDsNCj4gIAlpZiAocGVy
Zm1vbl9jYXBhYmxlKCkpDQo+IC0JCXVzYWdlLT5yZWdpb25zWzBdLnVzZWQgPSB0dG1fcmVzb3Vy
Y2VfbWFuYWdlcl91c2FnZShtYW4pOw0KPiAtCXVzYWdlLT5udW1fcmVnaW9ucyA9IDE7DQo+ICsJ
CXVzYWdlLT5tZW1fcmVnaW9uc1swXS51c2VkID0gdHRtX3Jlc291cmNlX21hbmFnZXJfdXNhZ2Uo
bWFuKTsNCj4gKwl1c2FnZS0+bnVtX21lbV9yZWdpb25zID0gMTsNCj4gIA0KPiAgCWZvciAoaSA9
IFhFX1BMX1ZSQU0wOyBpIDw9IFhFX1BMX1ZSQU0xOyArK2kpIHsNCj4gIAkJbWFuID0gdHRtX21h
bmFnZXJfdHlwZSgmeGUtPnR0bSwgaSk7DQo+ICAJCWlmIChtYW4pIHsNCj4gLQkJCXVzYWdlLT5y
ZWdpb25zW3VzYWdlLT5udW1fcmVnaW9uc10ubWVtX2NsYXNzID0NCj4gKwkJCXVzYWdlLT5tZW1f
cmVnaW9uc1t1c2FnZS0+bnVtX21lbV9yZWdpb25zXS5tZW1fY2xhc3MgPQ0KPiAgCQkJCURSTV9Y
RV9NRU1fUkVHSU9OX0NMQVNTX1ZSQU07DQo+IC0JCQl1c2FnZS0+cmVnaW9uc1t1c2FnZS0+bnVt
X3JlZ2lvbnNdLmluc3RhbmNlID0NCj4gLQkJCQl1c2FnZS0+bnVtX3JlZ2lvbnM7DQo+IC0JCQl1
c2FnZS0+cmVnaW9uc1t1c2FnZS0+bnVtX3JlZ2lvbnNdLm1pbl9wYWdlX3NpemUgPQ0KPiArCQkJ
dXNhZ2UtPm1lbV9yZWdpb25zW3VzYWdlLT5udW1fbWVtX3JlZ2lvbnNdLmluc3RhbmNlID0NCj4g
KwkJCQl1c2FnZS0+bnVtX21lbV9yZWdpb25zOw0KPiArCQkJdXNhZ2UtPm1lbV9yZWdpb25zW3Vz
YWdlLT5udW1fbWVtX3JlZ2lvbnNdLm1pbl9wYWdlX3NpemUgPQ0KPiAgCQkJCXhlLT5pbmZvLnZy
YW1fZmxhZ3MgJiBYRV9WUkFNX0ZMQUdTX05FRUQ2NEsgPw0KPiAgCQkJCVNaXzY0SyA6IFBBR0Vf
U0laRTsNCj4gLQkJCXVzYWdlLT5yZWdpb25zW3VzYWdlLT5udW1fcmVnaW9uc10udG90YWxfc2l6
ZSA9DQo+ICsJCQl1c2FnZS0+bWVtX3JlZ2lvbnNbdXNhZ2UtPm51bV9tZW1fcmVnaW9uc10udG90
YWxfc2l6ZSA9DQo+ICAJCQkJbWFuLT5zaXplOw0KPiAgDQo+ICAJCQlpZiAocGVyZm1vbl9jYXBh
YmxlKCkpIHsNCj4gIAkJCQl4ZV90dG1fdnJhbV9nZXRfdXNlZChtYW4sDQo+IC0JCQkJCQkgICAg
ICZ1c2FnZS0+cmVnaW9uc1t1c2FnZS0+bnVtX3JlZ2lvbnNdLnVzZWQsDQo+IC0JCQkJCQkgICAg
ICZ1c2FnZS0+cmVnaW9uc1t1c2FnZS0+bnVtX3JlZ2lvbnNdLmNwdV92aXNpYmxlX3VzZWQpOw0K
PiArCQkJCQkJICAgICAmdXNhZ2UtPm1lbV9yZWdpb25zDQo+ICsJCQkJCQkgICAgIFt1c2FnZS0+
bnVtX21lbV9yZWdpb25zXS51c2VkLA0KPiArCQkJCQkJICAgICAmdXNhZ2UtPm1lbV9yZWdpb25z
DQo+ICsJCQkJCQkgICAgIFt1c2FnZS0+bnVtX21lbV9yZWdpb25zXS5jcHVfdmlzaWJsZV91c2Vk
KTsNCj4gIAkJCX0NCj4gIA0KPiAtCQkJdXNhZ2UtPnJlZ2lvbnNbdXNhZ2UtPm51bV9yZWdpb25z
XS5jcHVfdmlzaWJsZV9zaXplID0NCj4gKwkJCXVzYWdlLT5tZW1fcmVnaW9uc1t1c2FnZS0+bnVt
X21lbV9yZWdpb25zXS5jcHVfdmlzaWJsZV9zaXplID0NCj4gIAkJCQl4ZV90dG1fdnJhbV9nZXRf
Y3B1X3Zpc2libGVfc2l6ZShtYW4pOw0KPiAtCQkJdXNhZ2UtPm51bV9yZWdpb25zKys7DQo+ICsJ
CQl1c2FnZS0+bnVtX21lbV9yZWdpb25zKys7DQo+ICAJCX0NCj4gIAl9DQo+ICANCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+IGluZGV4IGRhMTBkOTQ2OTMwYi4uYTliYmRmMTQxZmUyIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gQEAgLTE4MiwxMCArMTgyLDEwIEBAIGVudW0gZHJtX3hlX21lbW9yeV9jbGFzcyB7DQo+
ICB9Ow0KPiAgDQo+ICAvKioNCj4gLSAqIHN0cnVjdCBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbiAt
IERlc2NyaWJlcyBzb21lIHJlZ2lvbiBhcyBrbm93biB0bw0KPiArICogc3RydWN0IGRybV94ZV9t
ZW1fcmVnaW9uIC0gRGVzY3JpYmVzIHNvbWUgcmVnaW9uIGFzIGtub3duIHRvDQo+ICAgKiB0aGUg
ZHJpdmVyLg0KPiAgICovDQo+IC1zdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb24gew0KPiAr
c3RydWN0IGRybV94ZV9tZW1fcmVnaW9uIHsNCj4gIAkvKioNCj4gIAkgKiBAbWVtX2NsYXNzOiBU
aGUgbWVtb3J5IGNsYXNzIGRlc2NyaWJpbmcgdGhpcyByZWdpb24uDQo+ICAJICoNCj4gQEAgLTMy
MiwxMiArMzIyLDEyIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2N5Y2xlcyB7DQo+ICAg
KiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIGluIC5kYXRhLg0KPiAgICovDQo+ICBz
dHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIHsNCj4gLQkvKiogQG51bV9yZWdpb25zOiBu
dW1iZXIgb2YgbWVtb3J5IHJlZ2lvbnMgcmV0dXJuZWQgaW4gQHJlZ2lvbnMgKi8NCj4gLQlfX3Uz
MiBudW1fcmVnaW9uczsNCj4gKwkvKiogQG51bV9tZW1fcmVnaW9uczogbnVtYmVyIG9mIG1lbW9y
eSByZWdpb25zIHJldHVybmVkIGluIEBtZW1fcmVnaW9ucyAqLw0KPiArCV9fdTMyIG51bV9tZW1f
cmVnaW9uczsNCj4gIAkvKiogQHBhZDogTUJaICovDQo+ICAJX191MzIgcGFkOw0KPiAtCS8qKiBA
cmVnaW9uczogVGhlIHJldHVybmVkIHJlZ2lvbnMgZm9yIHRoaXMgZGV2aWNlICovDQo+IC0Jc3Ry
dWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9uIHJlZ2lvbnNbXTsNCj4gKwkvKiogQG1lbV9yZWdp
b25zOiBUaGUgcmV0dXJuZWQgbWVtb3J5IHJlZ2lvbnMgZm9yIHRoaXMgZGV2aWNlICovDQo+ICsJ
c3RydWN0IGRybV94ZV9tZW1fcmVnaW9uIG1lbV9yZWdpb25zW107DQo+ICB9Ow0KPiAgDQo+ICAv
KioNCg0K
