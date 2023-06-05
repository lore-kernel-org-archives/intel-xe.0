Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09083C7EE23
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 13:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DB710E1C5;
	Mon,  5 Jun 2023 13:21:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D688410E1C5
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685971297; x=1717507297;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ynU2p8WC0FK8DUxjlG2RSnK4esCv4yrgFPJgy66efHM=;
 b=kFY4NqpxBYeOtkYqaSSyYjRJRhh7P8+SJFoIdwFEhZ+83+feMby8ryfH
 rzgYyxsh6ceWGFWqsOxMwpEpByCO7Tsf99vJlhQniwDasXIc8T1Ugjoul
 3l+p19nolqauaDLWE0pdEdUlr+sWMWsVQlWRvfB91pBMbMEW/d5CACjCV
 5Dq6CAG7AQAOfKHUUifGkuro7I3Y6I/wrsdSMIqyc/7dVXswZSylEJcgy
 N0bVKSAR2myBMcbEJUsfcJN6QQRUo4HkiJftJMRxbB9gEFBTrothe+te7
 P4ULxiWI22mQpQWIUM2eB6ipYc6l5NWexS93meLly1lWKpEX9P5Legjdw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359675923"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="359675923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741718451"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="741718451"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 06:21:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 06:21:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 06:21:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 06:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzCBvLWuvyjqDozMaqejK8n8YGGgot5zNlYopkkcl95SyNI9H4bCHTrtTiflqrE24INLEwm7fquuFVPRCxqnmcpBMJHHmiwxFz6z3Q6rpTE9bUeEQHyPjiyu8FM4Mx+0qPABjalTa2Z1vkxR/q33eZ2JBckrP33V4vvZ1gOOtumUtZPj+D7wEidAwKXTLC5ag9FWCVThxcGBLzDkcT965v6XV2WMRf8MIAe8UhP+6PP7vupNY5cjpTQs93dOC+fTrbYk0NhIwebNgltlg2MPgKlvsbTo46NMaW8BsQ2zMMIiBgp5Yfq0b78GVafPtUyst+yKGNbs9kfXAK8+Q1iBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynU2p8WC0FK8DUxjlG2RSnK4esCv4yrgFPJgy66efHM=;
 b=S2FS6EvGepgBl69NXyR04o3l9W4rbPZqSx1PoghDhb7enfK5TxOoav0ccvyczlMe9VV3w+LD8AoWpgCWlHuzhGfxtu7MlBpnikWfzv4GDEhbsnGxcwdBx9yYQ4M79PrGWXUWuQyQgX/CnEkm9dD8Cs7aGLsJZvcwmhOtrLMlQiHZgxHLuKPxamevgfni9w7GEEcHEjKH9A5AaTEEdAfM1L3vWZtHvOmJOptqYwiNFBqbUN6TkYc1X/W7btvbxl7k+qxL6maHrLaT+PxDmqBeHErUprV1sa4X6uMn3XZUppZzZjaFGszVGVPIJmpt26aH+NJx2Eok7UpblBi4n4cAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 13:21:31 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 13:21:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/wa: Extend scope of Wa_14015795083
Thread-Index: AQHZlaeKeCY+YmYoRU+ZwBXIi3/9ca98NfUA
Date: Mon, 5 Jun 2023 13:21:31 +0000
Message-ID: <e3485c78750f3ae03ce532bf28fc4a18e93184db.camel@intel.com>
References: <20230602231054.1306865-1-matthew.d.roper@intel.com>
In-Reply-To: <20230602231054.1306865-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5920:EE_
x-ms-office365-filtering-correlation-id: e9069e18-5281-43ba-9f19-08db65c7c6db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MMG1ubNnDCCKEukIKM/3kUum8Pn0QTkX+xbFwANYfxRqzrdio0WQW5lrvpYLPffvla8pNvWYFxNd5abZTKt911swSiKNneeYi33fno799RXrBHJjpBaiwmA3CVH58dMrpllIhdmok43WhHvXeahFcZ+OAh/wjxCos47HfHsc+jy83r5P+pzNnea4gPguWO5nXxJK+8MJ/sLbps5rL2yPjpjcUo3mDz5rsJ7yw+qmhixDX50Iy3R8XHapGzVBN3sp6zsuzqb9aYI2pScSygFyi6SueFqjO13DO5XcIYtIDron6owu7mn+lEBtZzacyyENzjDXd+BJ2IgokjLPN3kLA2msBibVuy0MYabXW4j3v3Zwy2GizBBIIJtwI+J0PjZ2Quc3+rzh8LwXeVWOfowNwgDZGfmHaRxfswuh4vRaz+5FvriSBANc+u+TXkS37di0HwNSkbqLOAV6n4mezuWyoTYDGKVX7uSKsSTbVVZjFRgAYcD6RLbS8YHBJl82Ce+hSnWI2He/r9G2eO869DojKC8fUvXer0fQvcmzJg+D4e6bOvE6ORj8ueWH0CxobvTVzgMTkr1jdlghHTxAte0W3IAh6SsskeBDLT07KPN3qNl2b/+gYyfqrMaDJHp8/4Fx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(122000001)(83380400001)(110136005)(6636002)(64756008)(91956017)(38100700002)(66446008)(66556008)(76116006)(66946007)(66476007)(71200400001)(6486002)(478600001)(82960400001)(186003)(2906002)(36756003)(2616005)(38070700005)(8936002)(8676002)(41300700001)(316002)(5660300002)(86362001)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1JWRGZmMmRDMVhWTkx4N1FFeVVqdEFkTXo1K0NBS2xtcThxRnVHTE5FOUNw?=
 =?utf-8?B?eTJvbmJ1N2FkNG0vQ21yQU1FeTE0TXY0R2dSMDBTdjlYM0g1bjUzVlQ4bmVm?=
 =?utf-8?B?UEFkbGZ6ZVI3Nkt4VitzMFhZSmJOY2s0cW03Vm1mSVdEQ0xtYVFUc2QxVzJT?=
 =?utf-8?B?RlhwdktwdU9sYXZpZ3VtNEdiaGppQ2YrcDBCaTlVejF6aXlIM1FCOTI4S0R2?=
 =?utf-8?B?eXRRU3FaZHhBcm5Nc0NIaG16NldmaFBIUFd1RmUzTG1GcTI4QUQ3MWVBZW40?=
 =?utf-8?B?YVFQS2RwTFZnNFErL1NOR3d1Y2xQckxsWE55T1hiMURQZ1BNRXRKSk9tU0Jl?=
 =?utf-8?B?d0l0UWFRbVl3QkNlL0pmdjFoZWJTOW1qNG5ZcnpTZXJwQ0oxaTdQelFDcmFH?=
 =?utf-8?B?MHJkQktrd3JJRCtYU3Z6cHJsMVVxcDdydHpqVHZDV1YxT2E0RSsyT0JmQlZq?=
 =?utf-8?B?SGptOXRnbFp2Z0ROUVY2bHpKdUFQSmM5cmNUVXA1ZTNWUEZZOHByQXVvYnMz?=
 =?utf-8?B?VjJXbTM4b2ZOT1JMNzc2cFhKczRITWtJYmdWeVMxYitJcFNxQkpMbUcvTm1n?=
 =?utf-8?B?aTJ0RWhXeTVPVXc2eTM2elpod1I5ejJzZGVMYXdNdW5CMkhsdFFRZ0VMRmcr?=
 =?utf-8?B?NzRwMDdYT1BnbTZGNFQrUTlqa0xsSUIyQjZXWFBKd05TVFhab1ErV09qUk16?=
 =?utf-8?B?M3VmZCt2S2liMzB1MGFpVlZKZTVkRElGQTJoSnJMWmh4bmZMZzhWbzExTnY4?=
 =?utf-8?B?M3NNSzRMM0FhWFZFdHhFZkxKcTRjeElDT2R5NTZzeGdheVJENy8rRHVjdHBv?=
 =?utf-8?B?c2RuQks4d3kwWHJyeUxaY09JZ2V1S2hmdGx5QTRnMlg3bEVIclFsakcyMmNF?=
 =?utf-8?B?WFZFaFJsakhTTk5RMFdaanNLemF6VkVRQXBIRlc4a3IxUzZHY1FPWFRQQ1FW?=
 =?utf-8?B?TXRYd0ZHd0FHOEJ0VTk4Vy9WTWxWeVdMRGJnOHFVbk95b3N0dHorYUtlbXBU?=
 =?utf-8?B?V3ErUmRQRk1UODFuaUZ4c0hpQ0FHMkxZbTJCTnBCZVI2eEhDZXd3d284MXlO?=
 =?utf-8?B?SzVhYWVtazZWQy9ORUZ3ZHZTcnZPRTlFbVlrRVJRWWxVMUxpRmhHbXJCcGZ0?=
 =?utf-8?B?S2dXNGNzbW1jZFlTZ2dJUEJUSjZqK29zYjlJa2k5TUIrUFFISW5YdmtYWU9M?=
 =?utf-8?B?VHRlbDZubVpKNHlwLzc0eTluTGFlL05ZOEV3WDh1N1VsNCtlOEVycWs4cXNJ?=
 =?utf-8?B?Qmw1bXhXYzVWbktTa09FTUxhNnVIUDljZ1VQRVcyZlVvQ3JvaXBabllyQWxl?=
 =?utf-8?B?MC9hR1pETUN1Rnk5VXI2cUZOMENic2pFK0lkZFZSM09HZ2hFZ3gwbkdlc2wv?=
 =?utf-8?B?ZzdBNVYwdFJXZlVna2FiOUV4TzhTTjNFS2VER0R4YkxMZVhIanVFRjhleXVx?=
 =?utf-8?B?M2RvTzdLTjc4VDY5ZUVVU2UzS2RYK0RlcFhyUENQdkZIQjB6SDNIUzRFb3lE?=
 =?utf-8?B?TzBrRkZBNi80QWFmOVl5a2V5SndQTUFnekh6YVM2eXZwYlpLTnNrTjBtdXJN?=
 =?utf-8?B?cUxObUw2dTNtQXpPRXkzUEpUS1Z0ZlRWTUgvalU5UzJBOXNMRzJRMEk2Q1Bw?=
 =?utf-8?B?bWt5OWk3dTNuNXovRXcvb0NmM29WbGN6NnBQVFRqaFV3T2dlbmxaQlQ5QWxz?=
 =?utf-8?B?Q3lEUmNNbmF6clFKbFpCZWhoNnRCWC8wQjdsdWNPVlh4aFRlNmZHSjk5OWNt?=
 =?utf-8?B?WmZGTi85RmtQL3RPbWQ4MDUrT0hlV2VpcUNHQ0dvTG4yTXlORDgyOG14UnZy?=
 =?utf-8?B?emx0dGw3dmJnUzQ2cnZTaFI5ZTZTclJBdUdTZlBtRWFwdklTTjZabDNkZG1V?=
 =?utf-8?B?SWUwMCsydEVadXh1VnliRkMwK1gzYjZYRHNlRDA5VHJJSjJKODc5VUkwcDRL?=
 =?utf-8?B?UE5uMWFNYURUeHdpSE5sNTZxTEJqNUJadGlrMGJNMFNHNVllMlpxcmo1NkhU?=
 =?utf-8?B?T3pOTUxmL1REYTNheUM0cXFsWjRuaU51ZHJYdXJuKzFvdW9VY1NuQjlDR1gx?=
 =?utf-8?B?Y2d4ZlcxRloyMHlMMWNqMGM2V29ORHg2U0syZHNsamgyZ2M1QS82T29OQWl5?=
 =?utf-8?Q?qcAtiyWL1RrTCaDJKtE8MOgCM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5F4372AF15BEE459DA51879106EF390@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9069e18-5281-43ba-9f19-08db65c7c6db
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 13:21:31.2233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5QUzMi/uWHlkeUwH40EMUVSbCG7N4ByTR0LZ4EFLs9Y/9NCfRva153eiFD0DieNh80OEoB6rYjyTWDxkhM4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/wa: Extend scope of Wa_14015795083
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

T24gRnJpLCAyMDIzLTA2LTAyIGF0IDE2OjEwIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBX
YV8xNDAxNTc5NTA4MyB3YXMgYWxyZWFkeSBpbXBsZW1lbnRlZCBmb3IgREcyIGFuZCBQVkMsIGJ1
dCB0aGUNCj4gd29ya2Fyb3VuZCBkYXRhYmFzZSBoYXMgYmVlbiB1cGRhdGVkIHRvIGV4dGVuZCBp
dCB0byBtb3JlIHBsYXRmb3Jtcy4gIEl0DQo+IHNob3VsZCBub3cgYXBwbHkgdG8gYWxsIHBsYXRm
b3JtcyB3aXRoIGdyYXBoaWNzIHZlcnNpb25zIDEyLjAwIC0gMTIuNjAsDQo+IGFzIHdlbGwgYXMg
QS1zdGVwIG9mIFhlX0xQRyAoMTIuNzAgLyAxMi43MSkuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3dhLmMNCj4gaW5kZXggZDk5MDZmMzI2ZDM4Li5lNWIzZmY2Njk0NjUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV93YS5jDQo+IEBAIC0xMDcsNiArMTA3LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVf
cnRwX2VudHJ5X3NyIGd0X3dhc1tdID0gew0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZF
UlNJT05fUkFOR0UoMTIwMCwgMTIxMCkpLA0KPiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKERGUl9S
QVRJT19FTl9BTkRfQ0hJQ0tFTiwgREZSX0RJU0FCTEUpKQ0KPiAgCX0sDQo+ICsJeyBYRV9SVFBf
TkFNRSgiMTQwMTU3OTUwODMiKSwNCj4gKwkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9O
X1JBTkdFKDEyMDAsIDEyNjApKSwNCj4gKwkgIFhFX1JUUF9BQ1RJT05TKENMUihNSVNDQ1BDVEws
IERPUF9DTE9DS19HQVRFX1JFTkRFUl9FTkFCTEUpKQ0KPiArCX0sDQo+ICANCj4gIAkvKiBERzEg
Ki8NCj4gIA0KPiBAQCAtMTk1LDEwICsxOTksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0
cF9lbnRyeV9zciBndF93YXNbXSA9IHsNCj4gIAkgIFhFX1JUUF9SVUxFUyhQTEFURk9STShERzIp
KSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKENMUihTQVJCX0NISUNLRU4xLCBDT01QX0NLTl9JTikp
DQo+ICAJfSwNCj4gLQl7IFhFX1JUUF9OQU1FKCIxNDAxNTc5NTA4MyIpLA0KPiAtCSAgWEVfUlRQ
X1JVTEVTKFBMQVRGT1JNKERHMikpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoQ0xSKE1JU0NDUENU
TCwgRE9QX0NMT0NLX0dBVEVfUkVOREVSX0VOQUJMRSkpDQo+IC0JfSwNCj4gIAl7IFhFX1JUUF9O
QU1FKCIxODAxODc4MTMyOSIpLA0KPiAgCSAgWEVfUlRQX1JVTEVTKFBMQVRGT1JNKERHMikpLA0K
PiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKFJFTkRFUl9NT0RfQ1RSTCwgRk9SQ0VfTUlTU19GVExC
KSwNCj4gQEAgLTIxOSwxMCArMjE5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50
cnlfc3IgZ3Rfd2FzW10gPSB7DQo+ICANCj4gIAkvKiBQVkMgKi8NCj4gIA0KPiAtCXsgWEVfUlRQ
X05BTUUoIjE0MDE1Nzk1MDgzIiksDQo+IC0JICBYRV9SVFBfUlVMRVMoUExBVEZPUk0oUFZDKSks
DQo+IC0JICBYRV9SVFBfQUNUSU9OUyhDTFIoTUlTQ0NQQ1RMLCBET1BfQ0xPQ0tfR0FURV9SRU5E
RVJfRU5BQkxFKSkNCj4gLQl9LA0KPiAgCXsgWEVfUlRQX05BTUUoIjE4MDE4NzgxMzI5IiksDQo+
ICAJICBYRV9SVFBfUlVMRVMoUExBVEZPUk0oUFZDKSksDQo+ICAJICBYRV9SVFBfQUNUSU9OUyhT
RVQoUkVOREVSX01PRF9DVFJMLCBGT1JDRV9NSVNTX0ZUTEIpLA0KPiBAQCAtMjM0LDYgKzIzMCwx
MyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBndF93YXNbXSA9IHsNCj4g
IAkgIFhFX1JUUF9SVUxFUyhQTEFURk9STShQVkMpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNF
VChYRUhQQ19MTkNGTUlTQ0NGR1JFRzAsIFhFSFBDX09WUkxTQ0NDKSkNCj4gIAl9LA0KPiArDQo+
ICsJLyogWGVfTFBHICovDQo+ICsJeyBYRV9SVFBfTkFNRSgiMTQwMTU3OTUwODMiKSwNCj4gKwkg
IFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyNzAsIDEyNzEpLCBHUkFQSElD
U19TVEVQKEEwLCBCMCkpLA0KPiArCSAgWEVfUlRQX0FDVElPTlMoQ0xSKE1JU0NDUENUTCwgRE9Q
X0NMT0NLX0dBVEVfUkVOREVSX0VOQUJMRSkpDQo+ICsJfSwNCj4gKw0KPiAgCXt9DQo+ICB9Ow0K
PiAgDQoNCg==
