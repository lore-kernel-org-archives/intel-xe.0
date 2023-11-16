Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ADAC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6210E6F4;
	Thu, 16 Nov 2023 20:57:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985D10E6F4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700168254; x=1731704254;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XbBTEc3bsk8SmFJHoOzle7gVkIH9g/8re37ArSAh9eE=;
 b=fdd9jjNYkbTQZ97vjdnM9PkLkQaTReBCqBXCf0AGa0s2E8BD7MCKYDz6
 7qhMMp/ijnjbvMh+a00/xcLBHZHo8lapiXMMr69R0GnhzzTKf8lS42Vk0
 xZV5tAHAmbl40vuIDtZ07fQoUIm4szw4anfuiCEXbgmE/N1cY3NTiPuoi
 IWDYsytKigkXCr1TEYjOsMh5gPbeYc1Nq1fXrmr9/lD8hrn6eM2hUA2OL
 O8nZj6uL5/lVxkjmxdoEj+pP8F5hJ/EZmRRTgW2zpH0D+gin0X1urmink
 t7/ObSvDGaV1oN7nWDd63hy3WjNBdIL2y7CkS2Amtk+uJmzfu1X1Theul g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12730279"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="12730279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="889036724"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="889036724"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:57:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:57:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:57:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:57:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:57:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocdljZJ2IQTYNUJRiIUHJ9abxnSzDGZo6Lce6ecYLvu41FZTdR/+CvrfAX0q7nu6bWD6+r56GzX31vxy2KepS0OFVsz2dw3E7W++9ycCrAycO2Q50vdT97u87C7yHYI7NaWsIfLkJOjNkLKDtfJCql4YXFOAU/SibCNay8vH75a1I17Vq+THIUCJhAv6c/RHU7SA7x24/JAM9/0CInBwXhYf1EHOEemSLtsLCEMJzV/jgWzhXSsWb7pRdmVWRmX+4CqWl62lzbPsmLuEgwuMqswCJBorGKjX+jMX/S5J+OYCMw2KEndIYoK9ngGYIXxRhcNuKHXTFqqErETEyqJckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbBTEc3bsk8SmFJHoOzle7gVkIH9g/8re37ArSAh9eE=;
 b=Zr0YqpF/1Vih3qdc2ybtXVTvGXNol1PvqcTBt6SUCzE8+yGgya9xtfuKIBeu+h3X0k6h1eCk9/H9N6HRTsIzjLfaL1T+5h6iRdUJPR8WaOg5iwm/+JkeRhkpqaBR1YXNoiIxt4HiNEkFI9Tt15TbovbGZDxzFVuDRPXDKubuHxsTXr2mgSScgFTkha1GL5SQbgJaropASODLh74bmDjDVF6HnHLnYQyD//osFj3xZWpIU1dedecMfQUw86svouOKYF/IwVPYQYMCWZGb1aH7SP7UNlm+4oR4fxxyOOBjy/+2K0EJ4TTPsUdcfM+jz85q+OveP80kVIOwNsUkJAPI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 20:57:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:57:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 4/5] rm/xe: Allow num_batch_buffer == 0 in
 exec IOCTL
Thread-Index: AQHaGMTPuq6iJUvKvkKpFnu1oWYzJrB9bWwA
Date: Thu, 16 Nov 2023 20:57:19 +0000
Message-ID: <61575c71e42d739d6425f9f2c50cff23691c81ad.camel@intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-5-matthew.brost@intel.com>
In-Reply-To: <20231116194047.214330-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4912:EE_
x-ms-office365-filtering-correlation-id: 4d22377a-312c-4bea-44a0-08dbe6e69f52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Z3//kdT1S/b7Lgq1pUkZyJfsQOIdLFEAdpJvIITJdTOsvekT/1kqPtnKe1U5rPEcM14PMQbeBDALQ/FMPZ9OEFNkJSs1RKI/kXk/vZMZU7ljO47C/UyWwxMrQMUOhmjFDyaND24k+ZgikMJM7jfUZyZBYV9kJRJclNCe0BTZWUqKGU8FBtH3hNmyFX36chSCaBfoH6wINtxDmsfnwl/hdZByNS0oguMo82ZAAR/2j6Zafhly+eQ3pnRUimo5wpAMxivGmFf3Q/nV7A0zAEhp9g/yEakXODSh8a4gBMEA4yLVoccmwD3yZTjyrahyEyEmKoP2G4DWzljz1kbtR8SCeBSfdr+ZVePn1oSlyszoNNaoxqHb0ChHK1Q+3dUA7LMrtmotGFhY67Xwl1GttqV8b1nP8aEZglwdUIxGC30/cgtDDPdbszIvAiZBiO+n6FqhqtxNxtNxV5Wxc05ysbrM0JbilfiW/tOAJ4XXycOs+fTgGU8sHemn7djzbpiY5+ptcC6bt9ArUFwmImgCfLosHeASkmq+BGoQNSJI0OM6xQXguwHTrjnUWFCrCbSU43SFZxsTieMstz7xgPt4vXFQ90EkvDQu97pf7L7000ecC2zcZDIH04Mrz3KCByoa2Vs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6636002)(6506007)(6512007)(38070700009)(36756003)(4001150100001)(2906002)(26005)(38100700002)(122000001)(83380400001)(82960400001)(86362001)(41300700001)(2616005)(316002)(91956017)(478600001)(66446008)(64756008)(76116006)(66556008)(6486002)(66946007)(66476007)(110136005)(5660300002)(8936002)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azZpTHZhU3AxK3pMOEM3cFVZVGxMa3hrTzZXdUwxVlJua08vdyt5bzZoV05K?=
 =?utf-8?B?aFNUb1ljenRhY29HRW95cWNhWmxjTGZ5MEwyN1RydEJXWWRub1N4aVQ0SURT?=
 =?utf-8?B?MHlRVjdqdmpTcSt1WkEvWVJKdlJIdDJURlhhQTNjQzY5US9GR2x4WE1Ybkda?=
 =?utf-8?B?aUp1VEVNZmtLZDU2YkZqYXh4TU9BTHJvVU5JUTR1c1NsN0pEYUNUeng5THVC?=
 =?utf-8?B?TEpUekhhdHF0QitqaEhlNlRDdkthVjhwWlVHcmQ0bE9HckFJUm5nL0NLQXlM?=
 =?utf-8?B?dUNpYVFjRjg3WFlmR1JGa3dtSytsWWlyNWd5RFF3ZURvY1ZiS3JmbjVkdjhY?=
 =?utf-8?B?NDNBSFhMeUk3WCtZRVhzblJOdFdEWXU2YXpocm1tYzVLMXc4VGlrM25VUlJx?=
 =?utf-8?B?bWFDb3IvR0tDa0tvMDNPZTFsSXF2Z2RTc283M3FhOVRDaUh1dTh0Z25IUlhw?=
 =?utf-8?B?akNOUU9aZWw1OUdGQTIvbmc3SVN2ekZKRFFkcm9DOXBqeURwTlpBT2dpZEZ0?=
 =?utf-8?B?VTZaTXZERUozcVY0UGQyeWtCeW84N3ppeHgzSFlORmNYSUs4dGl6ZmkvNVJD?=
 =?utf-8?B?YUlwb2h2YWpqY1JLQWd0Q0p4Y2luc2xwanZlN3NqWFdkRk81d3JLTEhYbXhT?=
 =?utf-8?B?bVkvUVQybFFWeXYvNWFJYUgxZlFRT2UwM1AxMVdNRENvcFlDWnJrMmsvLzR6?=
 =?utf-8?B?c3FaeXdPcXZETVJibnNnRkRlZ1c2T1Z2TmNVcDFteUREb0ViSGViVldBcDM4?=
 =?utf-8?B?NVF6UisrZm5OUDFEMHhjckJ6eWVmdmpFQUQvdDRPTEpoSVdDRUlJL0F3THVr?=
 =?utf-8?B?eXE3TFM3Q3Z4WjRxU2dVbTBIUm1aMDJyZ0VKYXZRaDRsOVNJbGNxekUzbDBH?=
 =?utf-8?B?V2pwU2ljUUxRekRPSEJxVFlBY0toVFJJaSs4ZWltZEtVb0F5dkVoR2xBZmtL?=
 =?utf-8?B?N1M1RVNKSVJ4a2NOeTJWVVkzM3QrTk5ZQTVUY3lIV2FsQmgyY1hCOFZCclYx?=
 =?utf-8?B?VUhsMllkdlVVWGZJNktUNE42NXBOdklneEx1RjZ4cG82bmxMUzdNYVJWQ2E2?=
 =?utf-8?B?aHNDcFovS1l1b3dldU9HcDk0QXduRzErOFIrN0RlalNHUHBDQjMwczF1Vndk?=
 =?utf-8?B?TVdocEtraVl6NUpwTWUvY05HZzRyanNUUGlpcUVvRWRHdlJsUnY4UnZvenFr?=
 =?utf-8?B?c296U2MrTk9uTDZqQzlnczV2S1liU0poYzZtdytiNzRvTmdnSkRjL1dvTHNt?=
 =?utf-8?B?akNubCtLZjlvZzd1R2EvWlEvMm9HWUN0OHN6VHJXN0ErMnVqcTg2TEdISndt?=
 =?utf-8?B?MG9aOXd4VlJ0NzZuZXIyUTZKUFllRnBpMWZUMDhhMkxQdy9sclQwQ2swZjlw?=
 =?utf-8?B?bVpOTkNmcEpsN2ZtTnZMTjRzTXhQenpNMmpKODRPS2tuZDhndW4wZ1MySlpN?=
 =?utf-8?B?SmRQL2tNTEFzT1NrNmQyRnNmSld3WG5sMDd5MUV3WWxRSUZQNjRPd2U5b2Jy?=
 =?utf-8?B?MEdVQ2lpM1VKbjNzZFAyMHM3TzVqRXhZTFh3ZlNjdFRZekYwVVlPMWlhV0pU?=
 =?utf-8?B?Y2E1TEtKUngrZHh5eVZrRGo4SE9UTGdQQ2p6YkNqQ3d3NGlDQ3BXSkM1OVZ4?=
 =?utf-8?B?NUxhdEkxWDhPNm8xbWhmZjFNUDFsenJoZmxhRzZmY09wSWhheGpiRURQRDA0?=
 =?utf-8?B?ajM0aThSZU9GU2piQ2xBMldqenZmcjljSEFjeXhDRFNQaHZpcktTdXNmYndy?=
 =?utf-8?B?a1lETER3SG9hZGlLYUZZeHZUdE1ia3p0bDdiS3hhN0RNdE96U0lBMStOVkhr?=
 =?utf-8?B?RkpKWFYwVDAzbms5U2lUOUNMeDVOc2lxekdTVVUySlpzR0NjNDBhY1VQTDVB?=
 =?utf-8?B?Tlk2dnlNM2c3TnhjQ1drV3JQOU1WQ1NXNzJKZlYwNndHVEszT1BhS3lzaW9h?=
 =?utf-8?B?bk5nRExBSzNtclJhMzlJOWZJb0NuRTRTb2JyQ3d3QkJxbHRpSWk1dS9mUEd4?=
 =?utf-8?B?cHEzTTU1UHg2VktPNWx3MS9FUzB5WWUwTkZ1ckFZZEY3b0oxZmRDSTBqdTV2?=
 =?utf-8?B?NnpWd3M5azdGM1RITEpvTjJxQktuU3FvdGNuUzRJOXRWSXFaRWxlSG1BK0FB?=
 =?utf-8?B?R1dON3ViZTBnb1hVR0JJYTlreDZSS1Y0aUE3SHVsbC9ETDZmL1FHVC9ka2NE?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <067DD64DAE686E4CA400C836250EFAEA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d22377a-312c-4bea-44a0-08dbe6e69f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:57:19.2847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vXShwpiY9TyM4gvoZtXI9t+ZL3SIvMIpPbJuZZpbiJgQBl5IlZu1okamz1ZIMWp+bY3GIzNF+SZZbIG1FD/z9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] rm/xe: Allow num_batch_buffer == 0 in
 exec IOCTL
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDExOjQwIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBUaGUgaWRlYSBiZWluZyBvdXQtc3luY3MgY2FuIHNpZ25hbCBpbmRpY2F0aW5nIGFsbCBwcmV2
aW91cyBvcGVyYXRpb25zDQo+IG9uIHRoZSBleGVjIHF1ZXVlIGFyZSBjb21wbGV0ZS4gQW4gZXhh
bXBsZSB1c2UgY2FzZSBvZiB0aGlzIHdvdWxkIGJlDQo+IHN1cHBvcnQgZm9yIGltcGxlbWVudGlu
ZyB2a1F1ZXVlV2FpdEZvcklkbGUgZWFzaWx5Lg0KDQp2a1F1ZXVlV2FpdElkbGUNCg0KVGhhdCBp
cyB1c2VmdWwgZm9yIE1lc2EuDQoNCj4gDQo+IHYyOiBEb24ndCBhZGQgbGFzdF9mZW5jZSBmb3Ig
Vk0ncyB0aGF0IGRvIG5vdCBzdXBwb3J0IGRtYSBmZW5jZXMNCj4gdjM6IFVzZSBhIGZsYWdzIGZp
ZWxkIGluc3RlYWQgb2Ygc2V2ZXJ2YWwgYm9vbHMgaW4gc3luYyBwYXJzZSAoVGhvbWFzKQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYyAgICAgICAgICAgICB8IDIz
ICsrKysrKysrKysrKysrKysrKysrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19x
dWV1ZS5jICAgICAgIHwgIDUgKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlX3R5cGVzLmggfCAgNSArKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5bmMuYyAg
ICAgICAgICAgICB8ICA0ICsrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeW5jLmggICAg
ICAgICAgICAgfCAgNiArKysrKy0NCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiBpbmRleCA3ZDRkMjJj
ODFhNDIuLjQ5ODliYzYwMzhhZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2V4ZWMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+IEBAIC0xNjEs
NyArMTYxLDggQEAgaW50IHhlX2V4ZWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQ0KPiAgCWlmIChYRV9JT0NUTF9EQkcoeGUs
IHEtPmZsYWdzICYgRVhFQ19RVUVVRV9GTEFHX1ZNKSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+
ICANCj4gLQlpZiAoWEVfSU9DVExfREJHKHhlLCBxLT53aWR0aCAhPSBhcmdzLT5udW1fYmF0Y2hf
YnVmZmVyKSkNCj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5udW1fYmF0Y2hfYnVmZmVy
ICYmDQo+ICsJCQkgcS0+d2lkdGggIT0gYXJncy0+bnVtX2JhdGNoX2J1ZmZlcikpDQo+ICAJCXJl
dHVybiAtRUlOVkFMOw0KPiAgDQo+ICAJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgcS0+ZmxhZ3MgJiBF
WEVDX1FVRVVFX0ZMQUdfQkFOTkVEKSkgew0KPiBAQCAtMTgzLDEyICsxODQsMTQgQEAgaW50IHhl
X2V4ZWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRy
bV9maWxlICpmaWxlKQ0KPiAgCQllcnIgPSB4ZV9zeW5jX2VudHJ5X3BhcnNlKHhlLCB4ZWYsICZz
eW5jc1tudW1fc3luY3MrK10sDQo+ICAJCQkJCSAgJnN5bmNzX3VzZXJbaV0sIFNZTkNfUEFSU0Vf
RkxBR19FWEVDIHwNCj4gIAkJCQkJICAoeGVfdm1fbm9fZG1hX2ZlbmNlcyh2bSkgPw0KPiAtCQkJ
CQkgICBTWU5DX1BBUlNFX0ZMQUdfTFJfTU9ERSA6IDApKTsNCj4gKwkJCQkJICAgU1lOQ19QQVJT
RV9GTEFHX0xSX01PREUgOiAwKSB8DQo+ICsJCQkJCSAgKCFhcmdzLT5udW1fYmF0Y2hfYnVmZmVy
ID8NCj4gKwkJCQkJICAgU1lOQ19QQVJTRV9GTEFHX0RJU0FMTE9XX1VTRVJfRkVOQ0UgOiAwKSk7
DQo+ICAJCWlmIChlcnIpDQo+ICAJCQlnb3RvIGVycl9zeW5jczsNCj4gIAl9DQo+ICANCj4gLQlp
ZiAoeGVfZXhlY19xdWV1ZV9pc19wYXJhbGxlbChxKSkgew0KPiArCWlmIChhcmdzLT5udW1fYmF0
Y2hfYnVmZmVyICYmIHhlX2V4ZWNfcXVldWVfaXNfcGFyYWxsZWwocSkpIHsNCj4gIAkJZXJyID0g
X19jb3B5X2Zyb21fdXNlcihhZGRyZXNzZXMsIGFkZHJlc3Nlc191c2VyLCBzaXplb2YodTY0KSAq
DQo+ICAJCQkJICAgICAgIHEtPndpZHRoKTsNCj4gIAkJaWYgKGVycikgew0KPiBAQCAtMjM1LDYg
KzIzOCwxOCBAQCBpbnQgeGVfZXhlY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ICAJCWdvdG8gZXJyX2V4ZWM7DQo+ICAJ
fQ0KPiAgDQo+ICsJaWYgKCFhcmdzLT5udW1fYmF0Y2hfYnVmZmVyKSB7DQo+ICsJCWlmICgheGVf
dm1fbm9fZG1hX2ZlbmNlcyh2bSkpIHsNCj4gKwkJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0N
Cj4gKwkJCQl4ZV9leGVjX3F1ZXVlX2xhc3RfZmVuY2VfZ2V0KHEsIHZtKTsNCj4gKw0KPiArCQkJ
Zm9yIChpID0gMDsgaSA8IG51bV9zeW5jczsgaSsrKQ0KPiArCQkJCXhlX3N5bmNfZW50cnlfc2ln
bmFsKCZzeW5jc1tpXSwgTlVMTCwgZmVuY2UpOw0KPiArCQl9DQo+ICsNCj4gKwkJZ290byBlcnJf
ZXhlYzsNCj4gKwl9DQo+ICsNCj4gIAlpZiAoeGVfZXhlY19xdWV1ZV9pc19scihxKSAmJiB4ZV9l
eGVjX3F1ZXVlX3JpbmdfZnVsbChxKSkgew0KPiAgCQllcnIgPSAtRVdPVUxEQkxPQ0s7DQo+ICAJ
CWdvdG8gZXJyX2V4ZWM7DQo+IEBAIC0zMjgsNiArMzQzLDggQEAgaW50IHhlX2V4ZWNfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxl
KQ0KPiAgDQo+ICAJaWYgKHhlX2V4ZWNfcXVldWVfaXNfbHIocSkpDQo+ICAJCXEtPnJpbmdfb3Bz
LT5lbWl0X2pvYihqb2IpOw0KPiArCWlmICgheGVfdm1fbm9fZG1hX2ZlbmNlcyh2bSkpDQo+ICsJ
CXhlX2V4ZWNfcXVldWVfbGFzdF9mZW5jZV9zZXQocSwgdm0sICZqb2ItPmRybS5zX2ZlbmNlLT5m
aW5pc2hlZCk7DQo+ICAJeGVfc2NoZWRfam9iX3B1c2goam9iKTsNCj4gIAl4ZV92bV9yZWFjdGl2
YXRlX3JlYmluZCh2bSk7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9leGVjX3F1ZXVlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+IGlu
ZGV4IDRmZDQ0YTkyMDNlNC4uMzU3MTBiNjZlNWRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjX3F1ZXVlLmMNCj4gQEAgLTkyNCw3ICs5MjQsMTAgQEAgaW50IHhlX2V4ZWNfcXVldWVfc2V0
X3Byb3BlcnR5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICBz
dGF0aWMgdm9pZCB4ZV9leGVjX3F1ZXVlX2xhc3RfZmVuY2VfbG9ja2RlcF9hc3NlcnQoc3RydWN0
IHhlX2V4ZWNfcXVldWUgKnEsDQo+ICAJCQkJCQkgICAgc3RydWN0IHhlX3ZtICp2bSkNCj4gIHsN
Cj4gLQlsb2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKCZ2bS0+bG9jayk7DQo+ICsJaWYgKHEtPmZs
YWdzICYgRVhFQ19RVUVVRV9GTEFHX1ZNKQ0KPiArCQlsb2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRl
KCZ2bS0+bG9jayk7DQo+ICsJZWxzZQ0KPiArCQl4ZV92bV9hc3NlcnRfaGVsZCh2bSk7DQo+ICB9
DQo+ICANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgN
Cj4gaW5kZXggNWJhNDdhNWNmZGJkLi41MmYwOTI3ZDBkOWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiBAQCAtNTYsOCArNTYsOSBAQCBzdHJ1Y3Qg
eGVfZXhlY19xdWV1ZSB7DQo+ICAJc3RydWN0IHhlX2h3X2ZlbmNlX2lycSAqZmVuY2VfaXJxOw0K
PiAgDQo+ICAJLyoqDQo+IC0JICogQGxhc3RfZmVuY2U6IGxhc3QgZmVuY2Ugb24gZW5naW5lLCBw
cm90ZWN0ZWQgYnkgdm0tPmxvY2sgaW4gd3JpdGUNCj4gLQkgKiBtb2RlIGlmIGJpbmQgZW5naW5l
DQo+ICsJICogQGxhc3RfZmVuY2U6IGxhc3QgZmVuY2Ugb24gZXhlYyBxdWV1ZSwgcHJvdGVjdGVk
IGJ5IHZtLT5sb2NrIGluIHdyaXRlDQo+ICsJICogbW9kZSBpZiBiaW5kIGV4ZWMgcXVldWUsIHBy
b3RlY3RlZCBieSBkbWEgcmVzdiBsb2NrIGlmIG5vbi1iaW5kIGV4ZWMNCj4gKwkgKiBxdWV1ZQ0K
PiAgCSAqLw0KPiAgCXN0cnVjdCBkbWFfZmVuY2UgKmxhc3RfZmVuY2U7DQo+ICANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfc3luYy5jDQo+IGluZGV4IDAxNmQwYTJlYTViYy4uY2ZlODcyNGVlOTU0IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3luYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9zeW5jLmMNCj4gQEAgLTEwNiw2ICsxMDYsNyBAQCBpbnQgeGVfc3luY19lbnRyeV9w
YXJzZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2ZpbGUgKnhlZiwNCj4gIAlpbnQg
ZXJyOw0KPiAgCWJvb2wgZXhlYyA9IGZsYWdzICYgU1lOQ19QQVJTRV9GTEFHX0VYRUM7DQo+ICAJ
Ym9vbCBscl9tb2RlID0gZmxhZ3MgJiBTWU5DX1BBUlNFX0ZMQUdfTFJfTU9ERTsNCj4gKwlib29s
IGRpc2FsbG93X3VzZXJfZmVuY2UgPSBmbGFncyAmIFNZTkNfUEFSU0VfRkxBR19ESVNBTExPV19V
U0VSX0ZFTkNFOw0KPiAgCWJvb2wgc2lnbmFsOw0KPiAgDQo+ICAJaWYgKGNvcHlfZnJvbV91c2Vy
KCZzeW5jX2luLCBzeW5jX3VzZXIsIHNpemVvZigqc3luY191c2VyKSkpDQo+IEBAIC0xNzMsNiAr
MTc0LDkgQEAgaW50IHhlX3N5bmNfZW50cnlfcGFyc2Uoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0
cnVjdCB4ZV9maWxlICp4ZWYsDQo+ICAJCWJyZWFrOw0KPiAgDQo+ICAJY2FzZSBEUk1fWEVfU1lO
Q19VU0VSX0ZFTkNFOg0KPiArCQlpZiAoWEVfSU9DVExfREJHKHhlLCBkaXNhbGxvd191c2VyX2Zl
bmNlKSkNCj4gKwkJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gKw0KPiAgCQlpZiAoWEVfSU9DVExf
REJHKHhlLCAhc2lnbmFsKSkNCj4gIAkJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gIA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5bmMuaCBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9zeW5jLmgNCj4gaW5kZXggMzA5NThkZGM0Y2RjLi40NWY0MzcxZTk0YjkgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeW5jLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N5bmMuaA0KPiBAQCAtMTIsMTAgKzEyLDE0IEBAIHN0cnVjdCB4ZV9kZXZpY2U7
DQo+ICBzdHJ1Y3QgeGVfZmlsZTsNCj4gIHN0cnVjdCB4ZV9zY2hlZF9qb2I7DQo+ICANCj4gKyNk
ZWZpbmUgU1lOQ19QQVJTRV9GTEFHX0VYRUMJCQlCSVQoMCkNCj4gKyNkZWZpbmUgU1lOQ19QQVJT
RV9GTEFHX0xSX01PREUJCQlCSVQoMSkNCj4gKyNkZWZpbmUgU1lOQ19QQVJTRV9GTEFHX0RJU0FM
TE9XX1VTRVJfRkVOQ0UJQklUKDIpDQo+ICsNCj4gIGludCB4ZV9zeW5jX2VudHJ5X3BhcnNlKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZmlsZSAqeGVmLA0KPiAgCQkJc3RydWN0IHhl
X3N5bmNfZW50cnkgKnN5bmMsDQo+ICAJCQlzdHJ1Y3QgZHJtX3hlX3N5bmMgX191c2VyICpzeW5j
X3VzZXIsDQo+IC0JCQlib29sIGV4ZWMsIGJvb2wgY29tcHV0ZV9tb2RlKTsNCj4gKwkJCXVuc2ln
bmVkIGludCBmbGFncyk7DQo+ICBpbnQgeGVfc3luY19lbnRyeV93YWl0KHN0cnVjdCB4ZV9zeW5j
X2VudHJ5ICpzeW5jKTsNCj4gIGludCB4ZV9zeW5jX2VudHJ5X2FkZF9kZXBzKHN0cnVjdCB4ZV9z
eW5jX2VudHJ5ICpzeW5jLA0KPiAgCQkJICAgc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKTsNCg0K
