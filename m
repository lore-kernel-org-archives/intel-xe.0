Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF64FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 18:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58FE10E8C6;
	Mon, 27 Apr 2026 18:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAcMP+dv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89910E8C6
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777314609; x=1808850609;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5TmPWG0gxSKw/n6ZTqck4JwQ92ZHZFyQuu+STyhAY8s=;
 b=KAcMP+dvHOdkrb6MwHjaEyjo3YG5aDtefQMLkP70Oy3D+9dXCvxtIX4L
 e1d7mKWQdgaXMjjWvIh/xCQCSslYORpJ3M6oCkwprR6HZWugFwm1SO2BN
 hQd934PYhJhMa9foPH0ewTZBNUA+sGSXoYCVMiyy2kfwtBHl/9lredBs4
 TwS85PWnjZP68Kba0q8/95MDR50XaGOqbqnWjddL48uEXqOAqRn6VBOFZ
 qEslOLEDJlQ+0gjaD5wbWS3WEj4aAMpwEZG5RoyG+SmjHtjECHjQrn9ZZ
 XB9QOwjPhVLDwPxDbTL1qk7PS9cFC6PsoRbFhRe+wlUIne3wPvFfQ6f72 g==;
X-CSE-ConnectionGUID: FOLYGeDjSZ6Biap4cSeY2Q==
X-CSE-MsgGUID: Q+yKLgN6TSi4i0YH4yzu3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77375297"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77375297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:30:09 -0700
X-CSE-ConnectionGUID: 7kaNtcSsRDCA4m3rdzpidA==
X-CSE-MsgGUID: MwWB6h0EQ4WblSxvlTmZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="229170319"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:30:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 11:30:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 11:30:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 11:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izyUdFJWqYRNYccA9pkYTDHt6udwt2Eam/iiO9uGP/0yEH5kBFoUITSsh0F0h2PkYPhrqGZTL3hNn4CJ8P+qaYZ01hZpQIGRKen7xXmYkO5YlI2dWhzqnCENuU+6I5gqgEGtzEdSOG9xkF1KjPVxV3Dp47zFBZ4jEY7tR6V81VC48pHWnw+P9jUJMnrHzzPQ+AvAL7Of3NFb8piAeIScwaeetIw7sO1nQC9DLC2vIO+hgeNuZY+Y4ncdTZcFtoWYELsKc0UIneEnwnnPgEf4CfD85aIkAO7d4xmu0y71+6w3vFlkuMLUvILLgDo77GM900ESU7T6GfVUkDwohJ11Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TmPWG0gxSKw/n6ZTqck4JwQ92ZHZFyQuu+STyhAY8s=;
 b=Zjh6M99AQebOjmkc79JhwMm35yvP+ZroH0R+6Th9mMwEBZ4CoALx0i4uwQuXE3xWQM9D3gpARYqIQh6s2xhl3eUFkc4hcX3EmcMAOz3rd9pIgwYBeFkG+Nuf4th/llYW8OgZiyOEbVauCdgUByaOIQSX0Eleo2EaGwteXRZLlEH+kQCNxIjBkokWkFW4K8fcRtjltd9qlBF/0ZTHyooFHqFo8l5LpV17sxcnG0XY26ys8QccWHWwY0KyQA6SNrQZxQ/IG8fuMZrYoYDqsAcvo+VVvz8VnArFVxndmpEIEp5p/Q+clHcf0XdPWIrGnHiD5fQkoPLTSLZ3XWsTqqB+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH3PPF6D09CA9CB.namprd11.prod.outlook.com (2603:10b6:518:1::d2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 18:30:04 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 18:30:04 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 07/10] drm/xe: Move GFX_MODE programming to RTP
Thread-Topic: [PATCH v2 07/10] drm/xe: Move GFX_MODE programming to RTP
Thread-Index: AQHc1CwD//v8xUSlZUinEjYheXQ/MbXzPlQg
Date: Mon, 27 Apr 2026 18:30:04 +0000
Message-ID: <DM4PR11MB5456438FD5C0E3E53F5C0F06EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-7-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-7-59cc620a25f1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH3PPF6D09CA9CB:EE_
x-ms-office365-filtering-correlation-id: 928196af-243d-470f-d471-08dea48b000a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: c6JnlDu8pu0d2RehLUg7ICXk0gZT3mLV3n5mXOvx5uvCcI22XUEMqzKccguWQbAp2EymJMROUiT2LM21VLhYxhYal2em/z4SlqRHKKpFAZSEhUZc/8pg1t02F2bneEO1xgR9BFrddVafCmk/oDZsK50OpEyU0r3VIQOrA4Dwo8LaEZK44BCGq+rSy7VS+44aakrd7q7lwITpSNhflQDWj6x0YswgJ4c465eC1FuQ5Q++mgiqnOcqCxF/UFrkSaWVzznCmrofol77Z+75vPI50YMjhVQk4bmnw4lWBsbvxeBDcFORHzU1VLaYlrLFs+wn7E9LONSj28vY16+ngwZU0LS89ESnTWmgl5GCxWoXvHIvH6GIQZallDrTFLs5V1gJJVJouPtd5Ouw98eoGaVmBj4ggZQRue+gVNeZEL2VEBT+RBo7QeFbh9Ihf21Qs8+AsXkqUK5YNuGXQViWb269IKVWcFbKPsAUCxU/UTY/pbOZuBrJyN2+JVzzuMEcaLekm/U+ep2t7fJGU6BYV6zbiowp8KEb5Ohhe+D1ZF2e04/R/yYyps2pBz1WS1vXqanM+6z82s6qmn80kFxEw2mKPBb18tr0cXfaVIQpEz7nkCoNVD4iVMgf6+X3KQfztPv2RWYP/0E1M9PWrOnciTmhWuGLo04qdtOCwnbXd9oxoeP9NRQvfs1z/d0/7EUL8qLKVM/MhrfomSJ9wa/VgptBRsNK+h5MstCHjhWhlO5df/HKDCZ2Bk7BZtttdlJD5aMe8o/fXxyBeTIjOchPRJmZAdh3atFdQF++k9bs4LN/E14=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VURrQ2R6eHNoeWJsWUJHa2lDQXBnaTNmNHdSTXpqcjdoRkVOdEwrdkpySzlB?=
 =?utf-8?B?QjFXNW51VDliSi9ISUVUMlUxV0RvdVhyb1lZVjczazE4Y2pUdThHNW9BLzd4?=
 =?utf-8?B?QmxxSEJnYnBjajVZeVNQQ0lSREFlbW8rZWp0cFBwMTF0ZmlVOTg0dkZVem82?=
 =?utf-8?B?NXo2Z3NuZzdkdWVUSStPWlRCUEh5Q0ZtbjhpL0Q1NjdqRGY3ZFpiVlRpSisv?=
 =?utf-8?B?RUtQUWFwd2N0eWRmb1hOQkFEMHprL1ZZd2VEaVVVZEhjWkxIbGZCdk9pK1dl?=
 =?utf-8?B?V004eFBYQnlwRmVmUWZtdFdJaEJaakFDRzREb3lGMml3NEd6OWtZSFRGcmZE?=
 =?utf-8?B?Q3ltMmNUQ1d4U29hRVA4Y3lYYmF2bTYvQjVQWWdRd0JqRUsxSlVKTTIyWEEv?=
 =?utf-8?B?Q2xDSkRWbnVuaERLbjZ0QVl0NzlCR2RFRi9NSUVHYzR1WVo0aVRHdjh2RFhE?=
 =?utf-8?B?c2JVemt1RDlNeXRGcVVMVWZ2dnM3N3IrNUlpMDNtRFZseVhyRHNZU3NrdUhU?=
 =?utf-8?B?K1RQaVFMVzJ0NzNPQjNzemQ2bkhweDB5ODVwcE03WnJEaG5NTGh0N05lWGVM?=
 =?utf-8?B?Q1YydGRLZGF6cGk3eDhyTnpQaEkyazFYU3ZoaVhUVnRhanZVRGd4VldFRUhU?=
 =?utf-8?B?WjVOUmxpSnk4dGFTNThRVXoyZUNhb0tTWGZ6cEVzWWVURjhHWXRLanBCSEQy?=
 =?utf-8?B?UTZ1b2d1bVJzQ1YwQ2V2SkFFSW9aRzg1TGNGc05uL0RwRi9CWDltSER5eTVE?=
 =?utf-8?B?dVViUHN2TVlUSE1ld0ZaWjQxeHd5c01tMjR0aUVQQ3lpaDN4dXJYN2orR3Rv?=
 =?utf-8?B?dHYydFpQZEdyYzMxUEVZR2xxVVpBRFFYa0l2M2owNGp4anJmTTZ3Ty9xYS95?=
 =?utf-8?B?ZFFoNnVsb1lKc1FQQUZsbGc4ZWY0ZllVT3NlTlM0T1Q2SCtlVzdIS1orRFlu?=
 =?utf-8?B?UEg1cGhNT0FxN2VNR1NNOHhmZlowWktJU1JGN3NGaVQrK1pWeDJyclZ0bW9o?=
 =?utf-8?B?TXB4ZCt3VEgxM28xSElIRGpoSFFIQjlXTHlPUjgzOElpbTF3RTIxOC95Njl4?=
 =?utf-8?B?NGxlVkkxOTNJL2ppWEdVckhXYm1WRWN0cDltSE5mRkhUa0VBbTMxR3ZoUHBu?=
 =?utf-8?B?YmFVYTJ0cGFTcWlSTDIzUUVIemNQZEFkeU1tUEI1dnhnbWdIeEtEZFlFUEt0?=
 =?utf-8?B?R1ZNeDNPUXAzU0hMSEVNbStreDZnSGpYU3lNQTNsNXBqVTYrbWdHZHJJbExa?=
 =?utf-8?B?TDJmYzVDd0VCVlpUSThpSFk3Tm9XQkloMUxZaWpOaU14UTI0WVIzQ296d2hj?=
 =?utf-8?B?L1pIcGEzVlNvbTkxUGVvQ0xRZkNSY1pMRnZ3ZWxYUE0yR0lkS0NKUmxWT3dY?=
 =?utf-8?B?RzBFZllNRk5XbVhUMlBnU0traXpic0JPdkp2cnZDRjdVMzdJZHI5cHphN05m?=
 =?utf-8?B?TklLdmRWV05UVTQ5N1VSNVM1d3A4eVliTzVxWlpJd2FabkFsQzNoU2RGM3dU?=
 =?utf-8?B?RlNBQXVEbUVwdlR0VkxVT0hCVUZRVW5sc3d2elRFK29BZ1FoSytxT3JPMGpV?=
 =?utf-8?B?SDhnYkwzM0t1RnFMNjFKTXFTVWoyYjE0dlg3VE5tOFBpaFc1ZkUzaWpRV1Jk?=
 =?utf-8?B?TDVmUHg0MzQyWlBna2I5WnErVXRsb0trUk5OeEl2bGZWOC9UaCtyTDVNRlo4?=
 =?utf-8?B?YUIxNDhyclZacGxNcko3Q01vekt1NVg5TERuVFhGMTZpcUZJQTFudWEyQm93?=
 =?utf-8?B?a1djY2tsRUZzdW5BZjd3K1V6WjZKZE5IQTdvVUF1dkVrZytvU0JCS2tiNXRM?=
 =?utf-8?B?YXZwbmRHNmtwTGErSXMycFBVVnhtaEN6MGE3ZlBVcVhLakRjRk9Pb0NDZGNY?=
 =?utf-8?B?UXNuR1pBT0hiLzNCWXp2YTJ0RWZKODNkaFhicEs2VHJUTUJSeTd5anA5OWRm?=
 =?utf-8?B?MXVHQ1pmM1ZzdXV3ZmtRd2xRcWpJT3lnRUg3dWdVd2JNRGdUMDFDbVd1c3hi?=
 =?utf-8?B?dVlQcWt1MlFraFNLc3dlM1h3WWJTYTMrQ0NJbldKdlgya2ZESEpTNi9SVHBM?=
 =?utf-8?B?VlplZDNvTkJudW5BaVRBQ0JsVU1tZE5pZkYzK0ZWazVqNGwxcVZTZWVVK1JO?=
 =?utf-8?B?RVM1RGhNL2Q1OVRxQnhkTkxPWEZYQ1NGWnkxbFovZUdBSE81M1lkSzFCTDQz?=
 =?utf-8?B?NWRnSnlPRFhLUUxFS04wWVpRdzIzRStYTkdYVlFUbW0yMWN4SHN5ZUo3bVRE?=
 =?utf-8?B?UTlvdXcvMEIzT2JmR1A1ajR4S3FaZFd6eHZpMW9UN0xQOWkzdzFtc2lzeWly?=
 =?utf-8?B?UzBzR3d2NlNUUzlkN3FPdTJ6K1BLdDJWQXVPRmxibTFqYkFUWmpoZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N6k5OYbEACyeUnOZJR6yfdtCT4XIJVuvsw/XYwL/qPUvVr0hEgnH24gokElTchgzCYJnxNZA9pGtsSuEhPM7LJILbfrr3sVTO8HXA/6NLSke3Av7MYbWyseRImY5Gwns2YiUMtJoI2qcr2bqTavmyW9gnNBhKu+fd782BmeieD20y9O3xV/WfE/byzwSWh9mhVdEcefPswzXo8qJetbSoj3PlEV7ScTVXvkA3gRpvPTYano0k1Ge3XjrecIp3izg4KNIDUVXRTRTuB3fA/7Kd6bm7yDP8yokJR9eZaIKz+aFpHbp+eDpIg3z2k5r0qt/yHCX0VgGAyZUZjIR7cdH1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928196af-243d-470f-d471-08dea48b000a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 18:30:04.0852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlcEliYKBMGN6iGs7ojtVK6NXWskQ9g3Wn/3majl8dru1cVZqvs3hW+VcO54peXdJBWpousiFY67iOme2c6pGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6D09CA9CB
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgMTo0OCBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBUaGUgd3Jp
dGUgR0ZYX01PREUgdG8gZGlzYWJsZSBlbmdpbmUgImxlZ2FjeSBtb2RlIiBhbmQgdG8gZW5hYmxl
IE1TSS1YDQo+IHN1cHBvcnQgd2FzIHVubmVjZXNzYXJpbHkgb3Blbi1jb2RlZCBpbiB4ZV9od19l
bmdpbmVfZW5hYmxlX3JpbmcoKTsgaXQncw0KPiBwcmVmZXJhYmxlIHRvIGRvIHN1Y2ggcHJvZ3Jh
bW1pbmcgaW4gdGhlIGVuZ2luZV9lbnRyaWVzW10gUlRQIHRhYmxlIHNpbmNlIGdldHMNCj4gcmVm
bGVjdGVkL3ZlcmlmaWVkIGluIGRlYnVnZnMsIGFuZCB3aWxsIGFsc28gYXV0b21hdGljYWxseSBl
bnN1cmUgdGhhdCB0aGUNCj4gcmVnaXN0ZXIgaXMgcHJvcGVybHkgc2F2ZWQvcmVzdG9yZWQgYXJv
dW5kIGVuZ2luZSByZXNldHMuICBUaGlzIGFsc28gaGVscHMNCj4gY29uc29saWRhdGUgY29tbW9u
IGxvZ2ljIHRoYXQgd2FzIGR1cGxpY2F0ZWQgYmV0d2VlbiB0aGUgbWFpbiBkcml2ZXINCj4gaW5p
dGlhbGl6YXRpb24gcGF0aCBhbmQgdGhlIGRlYWQtY29kZSBleGVjbGlzdCBpbml0aWFsaXphdGlv
biBwYXRoLg0KPiANCj4gVGhpcyBhbHNvIGFsbG93cyB1cyB0byBkcm9wIEdGWF9NT0RFIGZyb20g
dGhlIGxpc3Qgb2YgZXh0cmEgcmVnaXN0ZXJzIHRvIGJlDQo+IGFkZGVkIHRvIHRoZSBHdUMgQURT
JyBzYXZlLXJlc3RvcmUgbGlzdCBzaW5jZSBhbGwgcmVnaXN0ZXJzIG9uIHRoZSBSVFAgdGFibGUg
YXJlDQo+IGFkZGVkIGF1dG9tYXRpY2FsbHkuDQo+IA0KPiB2MjoNCj4gIC0gQWN0dWFsbHkgdXNl
IHRoZSB4ZV9ydHBfbWF0Y2hfaGFzX21zaXggbWF0Y2ggZnVuY3Rpb24gYWRkZWQuDQo+ICAgIChT
aHVpY2hlbmcpDQo+IA0KPiBDYzogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5j
b20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBp
bnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuYyAg
fCAgNSAtLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYyAgIHwgIDEgLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIHwgMTYgKysrKysrKysrKy0tLS0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3J0cC5jICAgICAgIHwgIDggKysrKysrKysNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ydHAuaCAgICAgICB8IDEyICsrKysrKysrKysrKw0KPiAg
NSBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jDQo+IGluZGV4IDMzN2I5YjRlOGI0YS4uOWZiOTlj
MDM4ZWE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiBAQCAtNDcsNyArNDcs
NiBAQCBzdGF0aWMgdm9pZCBfX3N0YXJ0X2xyYyhzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UsIHN0
cnVjdA0KPiB4ZV9scmMgKmxyYywNCj4gIAlzdHJ1Y3QgeGVfbW1pbyAqbW1pbyA9ICZndC0+bW1p
bzsNCj4gIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gIAl1NjQgbHJj
X2Rlc2M7DQo+IC0JdTMyIHJpbmdfbW9kZSA9DQo+IFJFR19NQVNLRURfRklFTERfRU5BQkxFKEdG
WF9ESVNBQkxFX0xFR0FDWV9NT0RFKTsNCj4gDQo+ICAJbHJjX2Rlc2MgPSB4ZV9scmNfZGVzY3Jp
cHRvcihscmMpOw0KPiANCj4gQEAgLTc4LDEwICs3Nyw2IEBAIHN0YXRpYyB2b2lkIF9fc3RhcnRf
bHJjKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwNCj4gc3RydWN0IHhlX2xyYyAqbHJjLA0KPiAg
CQkJeGVfYm9fZ2d0dF9hZGRyKGh3ZS0+aHdzcCkpOw0KPiAgCXhlX21taW9fcmVhZDMyKG1taW8s
IFJJTkdfSFdTX1BHQShod2UtPm1taW9fYmFzZSkpOw0KPiANCj4gLQlpZiAoeGVfZGV2aWNlX2hh
c19tc2l4KGd0X3RvX3hlKGh3ZS0+Z3QpKSkNCj4gLQkJcmluZ19tb2RlIHw9DQo+IFJFR19NQVNL
RURfRklFTERfRU5BQkxFKEdGWF9NU0lYX0lOVEVSUlVQVF9FTkFCTEUpOw0KPiAtCXhlX21taW9f
d3JpdGUzMihtbWlvLCBHRlhfTU9ERShod2UtPm1taW9fYmFzZSksDQo+IHJpbmdfbW9kZSk7DQo+
IC0NCj4gIAl4ZV9tbWlvX3dyaXRlMzIobW1pbywgUklOR19FWEVDTElTVF9TUV9DT05URU5UU19M
Tyhod2UtDQo+ID5tbWlvX2Jhc2UpLA0KPiAgCQkJbG93ZXJfMzJfYml0cyhscmNfZGVzYykpOw0K
PiAgCXhlX21taW9fd3JpdGUzMihtbWlvLCBSSU5HX0VYRUNMSVNUX1NRX0NPTlRFTlRTX0hJKGh3
ZS0NCj4gPm1taW9fYmFzZSksDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Fkcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYyBpbmRleCBiNDAz
ZWUwYjVlNzQuLmNlNjUxZGE2ZjMxOA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19hZHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5j
DQo+IEBAIC03NDUsNyArNzQ1LDYgQEAgc3RhdGljIHVuc2lnbmVkIGludCBndWNfbW1pb19yZWdz
ZXRfd3JpdGUoc3RydWN0DQo+IHhlX2d1Y19hZHMgKmFkcywNCj4gIAkJc3RydWN0IHhlX3JlZyBy
ZWc7DQo+ICAJCWJvb2wgc2tpcDsNCj4gIAl9ICplLCBleHRyYV9yZWdzW10gPSB7DQo+IC0JCXsg
LnJlZyA9IEdGWF9NT0RFKGh3ZS0+bW1pb19iYXNlKSwJCQl9LA0KPiAgCQl7IC5yZWcgPSBSSU5H
X0hXU19QR0EoaHdlLT5tbWlvX2Jhc2UpLA0KPiAJfSwNCj4gIAkJeyAucmVnID0gUklOR19JTVIo
aHdlLT5tbWlvX2Jhc2UpLAkJCX0sDQo+ICAJCXsgLnJlZyA9IENDU19NT0RFLA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IGluZGV4IDYwYWYzOTVkMDMxYy4uYjM4MGQzY2Y2ZDNh
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IEBAIC0zMjUsMTQgKzMyNSw4
IEBAIHUzMiB4ZV9od19lbmdpbmVfbW1pb19yZWFkMzIoc3RydWN0DQo+IHhlX2h3X2VuZ2luZSAq
aHdlLCBzdHJ1Y3QgeGVfcmVnIHJlZykNCj4gDQo+ICB2b2lkIHhlX2h3X2VuZ2luZV9lbmFibGVf
cmluZyhzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpICB7DQo+IC0JdTMyIHJpbmdfbW9kZSA9DQo+
IFJFR19NQVNLRURfRklFTERfRU5BQkxFKEdGWF9ESVNBQkxFX0xFR0FDWV9NT0RFKTsNCj4gLQ0K
PiAgCXhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoaHdlLCBSSU5HX0hXU19QR0EoMCksDQo+ICAJ
CQkJICB4ZV9ib19nZ3R0X2FkZHIoaHdlLT5od3NwKSk7DQo+IC0NCj4gLQlpZiAoeGVfZGV2aWNl
X2hhc19tc2l4KGd0X3RvX3hlKGh3ZS0+Z3QpKSkNCj4gLQkJcmluZ19tb2RlIHw9DQo+IFJFR19N
QVNLRURfRklFTERfRU5BQkxFKEdGWF9NU0lYX0lOVEVSUlVQVF9FTkFCTEUpOw0KPiAtCXhlX2h3
X2VuZ2luZV9tbWlvX3dyaXRlMzIoaHdlLCBHRlhfTU9ERSgwKSwgcmluZ19tb2RlKTsNCj4gIAl4
ZV9od19lbmdpbmVfbW1pb193cml0ZTMyKGh3ZSwgUklOR19NSV9NT0RFKDApLA0KPiAgCQkJCSAg
UkVHX01BU0tFRF9GSUVMRF9ESVNBQkxFKFNUT1BfUklORykpOw0KPiAgCXhlX2h3X2VuZ2luZV9t
bWlvX3JlYWQzMihod2UsIFJJTkdfTUlfTU9ERSgwKSk7IEBAIC00NDEsNg0KPiArNDM1LDExIEBA
IGh3X2VuZ2luZV9zZXR1cF9kZWZhdWx0X3N0YXRlKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkN
Cj4gIAkJICBYRV9SVFBfQUNUSU9OUyhTRVQoUklOR19IV1NUQU0oMCksIH4weDAsDQo+ICAJCQkJ
ICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gIAkJfSwNCj4gKwkJeyBY
RV9SVFBfTkFNRSgiRGlzYWJsZSBlbmdpbmUgJ2xlZ2FjeScgbW9kZSIpLA0KPiArCQkgIFhFX1JU
UF9SVUxFUyhGVU5DKHhlX3J0cF9tYXRjaF9hbHdheXMpKSwNCj4gKwkJICBYRV9SVFBfQUNUSU9O
UyhTRVQoR0ZYX01PREUoMCksDQo+IEdGWF9ESVNBQkxFX0xFR0FDWV9NT0RFLA0KPiArCQkJCSAg
ICAgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lORV9CQVNFKSkpDQo+ICsJCX0sDQo+ICAJCS8qDQo+
ICAJCSAqIFRvIGFsbG93IHRoZSBHU0MgZW5naW5lIHRvIGdvIGlkbGUgb24gTVRMIHdlIG5lZWQg
dG8gZW5hYmxlDQo+ICAJCSAqIGlkbGUgbWVzc2FnaW5nIGFuZCBzZXQgdGhlIGh5c3RlcmVzaXMg
dmFsdWUgKHdlIHVzZSAweEE9NXVzDQo+IEBAIC00NzQsNiArNDczLDExIEBAIGh3X2VuZ2luZV9z
ZXR1cF9kZWZhdWx0X3N0YXRlKHN0cnVjdA0KPiB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gIAkJICBY
RV9SVFBfQUNUSU9OUyhGSUVMRF9TRVQoUkNVX01PREUsDQo+IFJDVV9NT0RFX0ZJWEVEX1NMSUNF
X0NDU19NT0RFLA0KPiANCj4gUkNVX01PREVfRklYRURfU0xJQ0VfQ0NTX01PREUpKQ0KPiAgCQl9
LA0KPiArCQl7IFhFX1JUUF9OQU1FKCJFbmFibGUgTVNJLVggaW50ZXJydXB0IHN1cHBvcnQiKSwN
Cj4gKwkJICBYRV9SVFBfUlVMRVMoRlVOQyh4ZV9ydHBfbWF0Y2hfaGFzX21zaXgpKSwNCj4gKwkJ
ICBYRV9SVFBfQUNUSU9OUyhTRVQoR0ZYX01PREUoMCksDQo+IEdGWF9NU0lYX0lOVEVSUlVQVF9F
TkFCTEUsDQo+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4g
KwkJfSwNCj4gIAl9Ow0KPiANCj4gIAl4ZV9ydHBfcHJvY2Vzc190b19zcigmY3R4LCBlbmdpbmVf
ZW50cmllcywNCj4gQVJSQVlfU0laRShlbmdpbmVfZW50cmllcyksIGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcnRwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmMg
aW5kZXggNzI4OTMzYTFjMzRmLi4xYTRkY2JiYmMxNzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ydHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmMN
Cj4gQEAgLTEwLDYgKzEwLDcgQEANCj4gICNpbmNsdWRlIDx1YXBpL2RybS94ZV9kcm0uaD4NCj4g
DQo+ICAjaW5jbHVkZSAieGVfY29uZmlnZnMuaCINCj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2UuaCIN
Cj4gICNpbmNsdWRlICJ4ZV9ndC5oIg0KPiAgI2luY2x1ZGUgInhlX2d0X3RvcG9sb2d5LmgiDQo+
ICAjaW5jbHVkZSAieGVfcmVnX3NyLmgiDQo+IEBAIC00MDQsMyArNDA1LDEwIEBAIGJvb2wgeGVf
cnRwX21hdGNoX2hhc19mbGF0X2Njcyhjb25zdCBzdHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSwgIHsN
Cj4gIAlyZXR1cm4geGUtPmluZm8uaGFzX2ZsYXRfY2NzOw0KPiAgfQ0KPiArDQo+ICtib29sIHhl
X3J0cF9tYXRjaF9oYXNfbXNpeChjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gKwkJCSAg
IGNvbnN0IHN0cnVjdCB4ZV9ndCAqZ3QsDQo+ICsJCQkgICBjb25zdCBzdHJ1Y3QgeGVfaHdfZW5n
aW5lICpod2UpDQo+ICt7DQo+ICsJcmV0dXJuIHhlX2RldmljZV9oYXNfbXNpeCh4ZSk7DQo+ICt9
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmggYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcnRwLmggaW5kZXgNCj4gZDA1OGE2MjljZDNlLi41NjIwODJiMThkN2IgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ydHAuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcnRwLmgNCj4gQEAgLTUzNiw0ICs1MzYsMTYgQEAgYm9vbCB4ZV9ydHBf
bWF0Y2hfaGFzX2ZsYXRfY2NzKGNvbnN0IHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlLA0KPiAgCQkJ
ICAgICAgIGNvbnN0IHN0cnVjdCB4ZV9ndCAqZ3QsDQo+ICAJCQkgICAgICAgY29uc3Qgc3RydWN0
IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4gDQo+ICsvKioNCj4gKyAqIHhlX3J0cF9tYXRjaF9oYXNf
bXNpeCAtIE1hdGNoIHdoZW4gcGxhdGZvcm0gaGFzIE1TSS1YDQo+ICsgKiBAeGU6IERldmljZSBz
dHJ1Y3R1cmUNCj4gKyAqIEBndDogR1Qgc3RydWN0dXJlDQo+ICsgKiBAaHdlOiBFbmdpbmUgaW5z
dGFuY2UNCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIHBsYXRmb3JtIGhhcyBNU0ktWCBp
bnRlcnJ1cHQgc3VwcG9ydCAgKi8gYm9vbA0KPiAreGVfcnRwX21hdGNoX2hhc19tc2l4KGNvbnN0
IHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiArCQkJICAgY29uc3Qgc3RydWN0IHhlX2d0ICpndCwN
Cj4gKwkJCSAgIGNvbnN0IHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSk7DQo+ICsNCj4gICNlbmRp
Zg0KPiANCj4gLS0NCj4gMi41My4wDQoNCg==
