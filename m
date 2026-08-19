Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F206C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 07:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABAA10E0D6;
	Wed, 19 Aug 2026 07:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCID/ayn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FED910E0D6;
 Wed, 19 Aug 2026 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787123185; x=1818659185;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=PYH5nHo6n5uNNt6/kJbOUhvJQr7rtmCZpikKNA0FLFU=;
 b=ZCID/aynTOQGCQggii5M1xDNAR1GZbrZXZ3Gq/axBzIuwcqeBC+CkxP1
 JcZPG11Q8Y2F/Ipgmjksi5OreXRpdvjoGZDuQzL61nxz8nqDYUVp/BIsP
 AKt7qa/LUNdppG04p/jYrSmWFBc1zZ+cax+qhc2IAS4QjbPbbaVpEgtX9
 /H/6RY+xHpEva0t9AsguYpex0C0fG+M3vO5BR30lEEd+5MpeM4CI/ri9o
 5KCMxIrWYMj4AMiKqw8PV5Abetm3HVyklLMMSZIWQr3L4Lk13HweW1s76
 dlbZ0O3gSEWLK3Ucc4nh24iqbpBDxpO9f/e14tOmngUcUJlYavSU2hBDF A==;
X-CSE-ConnectionGUID: kh1x2U/bTmK/m+q8FRqDtg==
X-CSE-MsgGUID: VduSDU0URwmhW/9ZJCYB8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98293093"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208,217";a="98293093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:06:24 -0700
X-CSE-ConnectionGUID: UUYHtkc1Sgy3pmxz0LhnnA==
X-CSE-MsgGUID: tJWWAEu6SwCdfc5N/gDTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
 d="scan'208,217";a="268968693"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:06:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 00:06:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 00:06:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 00:06:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9/qEmkq5gPNNUr0cvVqDEnfjWy3lJlFG/lxXOyPJWxZOZiHQ9fNfJcSVuQtReKXHezd1aTpFwSRb5pQMj7TNdOD71mlGn6fPe3dyeNFnpJX7Tp96KgFu/BEBySk+ExMKYgioZrhlWy0cDFaZs4/p2MsAUofe9hbpbClUIUN/4/wbTr1/npBEPSifMc5cY+0BJccg67mkbxrJbI6bwyuqcjzZu1oaCgQoswYUa3sidBJGZ8/7qkQ5xD9QyZHcTON/qYlIAUrgSzk4Ctx7RTLTQC2a2Bl47Z4awNSKxeegYf43Ns4RTPihNHEKIdspurKD91vhmFAcKcudssCvg1mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYH5nHo6n5uNNt6/kJbOUhvJQr7rtmCZpikKNA0FLFU=;
 b=F7GHK1AXxCl/fv2ZgIrW4zto+lq86kKf+1OAnr3NPojqFXPV+327dgJPrrswslwa6HHvr/AVtODK7BoKfswS7YNdOGn3EuSn8CZzlUSv78fGeZwZzdhqB5PVQujBTI/Muxd0t+GZMlb2myGwzLeVaaJF8o3buwGgh0lYcZ3jHNSlQsdy97dXUxK6BagER3CM7fRXTcP/Pr8hkJa8b8ZQ3cTvZDsoO48K97Gnc5xyZlCocDj3OO8SGw1Wbnvcf7dbB8Qblh1sHU6x6fteq766Eal6ilKyQ4PpUdQBsc/JYoq6eKICw2PkVolRjXT/dVgfX5tXM++xCUarUnBq4Gxwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:06:14 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 07:06:13 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "I915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IGRvbid0?=
 =?utf-8?B?IFdBUk4gb24ga2VybmVsIGpvYiB0aW1lb3V0IHdoZW4gZGV2aWNlIGFscmVh?=
 =?utf-8?Q?dy_wedged?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIGRybS94ZTogZG9uJ3QgV0FS?=
 =?utf-8?B?TiBvbiBrZXJuZWwgam9iIHRpbWVvdXQgd2hlbiBkZXZpY2UgYWxyZWFkeSB3?=
 =?utf-8?Q?edged?=
Thread-Index: AQHdK85QqQ2MWIRtYE6VaZESe9u8lLak+cEY
Date: Wed, 19 Aug 2026 07:06:13 +0000
Message-ID: <SA3PR11MB8118052FF6870BD28FDDC548D0A52@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260814074106.92670-2-nitin.r.gote@intel.com>
 <178669928252.51261.16268159440334082079@61270ab9df2a>
In-Reply-To: <178669928252.51261.16268159440334082079@61270ab9df2a>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|IA0PR11MB7329:EE_
x-ms-office365-filtering-correlation-id: 09ff8299-9921-4de3-15cf-08defdc05b41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|8096899003|10067099003|56012099006|11063799006|5023799004|4143699003|13003099007|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: U6O9qH2u91Kl8wmN+Eyogx8dikF108QJzrlEc+Vj0Zb96DDtqticrT7xJJH1vJbp7vKTEyThJKa2wLDyEmWNy7MlHAZvGpKULCuMsOzSSaFOZJzvTcIGnHcLh3HchxgENk87JS8wDb555HktoyDOeCX1JLaMorI5rJK7U9KsU1zWabwVBAr8lAEONoYTEWYG3ltMyLuiTwosMqOiohuoToPjcIwls3Kd5a4CvdCvJRd9zYp3PjzDzzXGkbUGIfDytFbUTw1kZf3Z7e9EooCsVnSBByJba1GhBpnKEfsaWV7bwAxDrhod6yu9MuuXJu70vDsMpSIEG+eDI2wG+Pn77YEorii1SEul2+oJr8nwfzW6laa3I2r4OMkBV5l7GG3bZyzyOyOV69GkPMqEVW/wSaX3He9FiwE4NYEiaOfbAOti26buyrgdkXG8qCqRdDJahNnLDMBgbwUF+DbxbcCPToINT4pRG52CExEAx4BjmVIfgRopb03Z5mToq5289LEHmn49Z0oAJUeiuMyAXlIqNyrVnJtp+heh4RRHjbYZ1qnR34poTjAkQJNOxeXZqn7TP7szAZWnEMZYuHiAwqjRQ5O/mOVZI80N6HG6p1leypCxnBtjlBaqoLahuLTJXvq9s6mcS7z2JvKN1Co+FoDdDpqGCyqAZznVBx9Qle1bVYQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(8096899003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(13003099007)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzE0ZFRWOVR1YmoyK2N6RzhjOUhYRTUxcjczc0F4UUNtWFplVEFWVUdSd0Ry?=
 =?utf-8?B?d0xOMmt6ZTdJVXpnWGtwM0FvZWNML2RlUTVBaUx6K1YwT1kvbmxCRkVRa2dO?=
 =?utf-8?B?K1pjbENtRHZWc28xUlpsbU9nY3c0WUNCZmFwaW9IWGc1RlYvZktOZnEvQXpm?=
 =?utf-8?B?WnQ2WERYQXhER2lkeUpTM0Y0N2FoSkQycC9WdmFpSzFPaGo5c1VVY3hCcng1?=
 =?utf-8?B?MXFWN05CeE42dHEzdVYzbkhvRmV4amF5QnZYTWFSUUlLV2tNNGxlSXNjTFVt?=
 =?utf-8?B?YnhtZFUxd3ZyRjB0Umo2TUhIZnVaTm9sZEtEUnBUK1EwS25pVU9PK3NNNWNY?=
 =?utf-8?B?VUM5R1ZhYmVKSW9Ya05JL3dpNGRRODZjR1EvUjNzL3RpejFVSk53QTRrdDcz?=
 =?utf-8?B?dW5FRUNDYllwc1A2WFZCcUdpem5WRWdUVVFHRmVKK0ZjZ2FRVUJaTjBrS0Zj?=
 =?utf-8?B?b2c1MHF6NWlQMlZPQjlnYlZXTnVKN0U0dW9MMGhtcWZZYzRnSmEzS1lRdzg2?=
 =?utf-8?B?R29NRUl3d01EWXNFeHhpMTc2a1hwd1R3dVR0eHlROUduUDBML3Rhc2hMc0RS?=
 =?utf-8?B?KzRpWjFiMkh4YWdqNlRJbitWNHNyY2hIL2ZhZ2FneVJ4YnRwZVhvWWt1S0VL?=
 =?utf-8?B?SlJtclhpMjN2OWJtVm5WTnQ2bWtqTFh3bisycFEvVE53SUY5Q1Z4YWZTSjB1?=
 =?utf-8?B?WmFOWDEzdERWS3F3ZTQ5RE9xM29ya1JiOEdjcHpwRU9nRDhpd2lKdVlxKytM?=
 =?utf-8?B?RDZtT0Nlek9lMUxKRVdnN1dRS1BvSWNpZkNDVGJpaGE0SWxuYTVjSHpKMmpM?=
 =?utf-8?B?Yk1PMWE2czBRTXVFTGwzdWUyeDhaTUdRVGNjdm91Q2hVeGc5VFpFZ0dGL3kz?=
 =?utf-8?B?d3F5M2R1azdId3dwMzZQUFRESGMxTloxYVdmWGlQRFhWcDRTNUMraDlqTS83?=
 =?utf-8?B?SlFyOWZYNXM0c3BiZWovdXdLWXMrY0loZFdsNDRZWFFmRjdnVmtVLytLOFdp?=
 =?utf-8?B?UzJZL0ZFT2Q3TWxmNk95UGRjT0FmTHpJMDVmM0Z6K0luc0cyUHNNL0tYc1Er?=
 =?utf-8?B?WTltYytKYU5Ra1ovbDU5QXhsMnY5QlJuTkZ6ZWpnVFphczhNMnAwQkVZcjV3?=
 =?utf-8?B?S2h5L1E2N1RCWlg2Nnd5cFJZckp3VDdMd0dDNjJhckNFU0NnUStxSVRPcWNC?=
 =?utf-8?B?a2RLYTdObTQ1d0JYSEFtS3p4bU9jWkpDODg1NnpMMk1HczhBTnR2anhkQ0xp?=
 =?utf-8?B?TjJoTnZyTWJDdG9UQUlvS2JBY1IrOCtSYUpCT1FQajZheVpZd1F0eUFHYU5r?=
 =?utf-8?B?UjZEa3dnOU5ad2RUTDJ3Smc5QTNXQ2xEdFRGejN6aGJSUmFPUFhTSUVoUkpB?=
 =?utf-8?B?WDh4bHNRVVRkMlUrZzFnbWd4WHYvYjV1WEJ2VWNWVVlZWHo4SG5BTHdkQVpF?=
 =?utf-8?B?bEhaUmVyOXI3dFhkaFp1WllkVkFIUFc4cDdpUks5Zm0veXdqcTY2SjJqWmtv?=
 =?utf-8?B?bzZwSERXT3lWUUw3ZDZ3OWYrYjJTMXZqVEhFTDB0VW9sTlpXTVlqanJxUGZR?=
 =?utf-8?B?c1JXdGpKRlpoRWllRm5KTEJlbno5bkVLN3oyQ0RMMjNEN0I4WTZDZUVZWHJK?=
 =?utf-8?B?VEcvTExpN3VwOUpOSWRVT3dnTWJ4TlhwYW5LTnFSSHU2R3ZmaGsyTFpITjY0?=
 =?utf-8?B?ZjBXVmdDTzlwczJnVFVrc0ZqbEdXcWs0SlhtZk1DaFhzL3h3dnBjQklZRTlJ?=
 =?utf-8?B?RHFmaTVmRE1XUEEvUDFVTVZpT2NoaHNaV3hGazRHUXk4RURoK3ZKS3Z4emlT?=
 =?utf-8?B?ODREcG5KZEFtS1g1QUJSYlNwL2lPeHpJeVJCQkVFQXRTZUJoZFN5ZVNDclFZ?=
 =?utf-8?B?TjBhaFg5TzZBOWFUbXE1ditTSlUwblFpUDRZam9PeHZUTHJIMVA5d0VhckVp?=
 =?utf-8?B?N3U2WDhhRDlGWGprd3F6V2cvcCtFZ1kwU29UM2NMRmNjbVh4VTgwQlhCWFcw?=
 =?utf-8?B?MGhkc2dXYnpaSTFFM3g5TzFhb09tc1lSTTRvOE1CSGJHSHA0YUdKa1NaTlU2?=
 =?utf-8?B?enE3Ny9Ud3dEVDA2cU1zZHY5MGNBYmpTNjF4U2NNUHNrbnJITm8zM1hyTlBp?=
 =?utf-8?B?TkhsODJISlJQNGVhM1Y3NStIcHRuQkF1WUE0clU1SG9Cdkt1ODJpUDE3SDRq?=
 =?utf-8?B?SENqbjVnRlFNOFY5M3B1V2U2OXU1WXlWMlcvbnZGR3BEYTJUYnRvem4vTC9K?=
 =?utf-8?B?VHBHcXBKZEFDY1I1YkxNdHlVYkxCWDRTNHBCaVQrd0Q0UFFwcjdpQ2RaV2hI?=
 =?utf-8?Q?fIbwnXukKNMgFigRBH?=
Content-Type: multipart/alternative;
 boundary="_000_SA3PR11MB8118052FF6870BD28FDDC548D0A52SA3PR11MB8118namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: joDAw8T+AD/DBTwmf3Pt1HQ7FMFm+GYpRLNduDoGju6S4geptQV/3VRTeg3SmvkO7vKscpP6cL49VrwM81BpksF6Jku67p0Xm5MkD3gC+dmCO+OFvVCnKD1/10qwU02Yg2Y1jiBAaYeTBd19YFQKdUUnMvrTFtINuX/wFw2vZwDlNXKsZyG7SOi8rAWvaxUx4n9aQWR1zoEDekPLNKkbFvJavValgQ2AVZEF0+kMY1TCtqzT29aqQZmCQyWa9nV4Vtoz4PT81eOBuHoxAkX1KJ4pf5P3UT5XkZ79g5uoTMEb/UPKIqD1eM57mmYnVsLQ2vsr4lD1OWV1otYfY/rI4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ff8299-9921-4de3-15cf-08defdc05b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 07:06:13.8910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJHRVat/f1GB4RqoKD/ejEplVbYrPrKkuTvgNkcwUrHDvRMy+pDZexm8lQgikK7a1sVJfvCBnFWT0OvINuS1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

--_000_SA3PR11MB8118052FF6870BD28FDDC548D0A52SA3PR11MB8118namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ktaW5mcmEsDQoNClRoZSByZXBvcnRlZCBmYWlsdXJlIGlzIG5vdCByZWxhdGVkIHRvIG15
IGNoYW5nZXMuIFBsZWFzZSByZS1yZXBvcnQuDQoNClRoYW5rcywNCk5pdGluDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBQYXRjaHdvcmsgPHBhdGNod29ya0BlbWVy
aWwuZnJlZWRlc2t0b3Aub3JnPg0KU2VudDogRnJpZGF5LCBBdWd1c3QgMTQsIDIwMjYgMjo1MSBQ
TQ0KVG86IEdvdGUsIE5pdGluIFIgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQpDYzogaW50ZWwt
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc+
DQpTdWJqZWN0OiDinJcgWGUuQ0kuRlVMTDogZmFpbHVyZSBmb3IgZHJtL3hlOiBkb24ndCBXQVJO
IG9uIGtlcm5lbCBqb2IgdGltZW91dCB3aGVuIGRldmljZSBhbHJlYWR5IHdlZGdlZA0KDQpQYXRj
aCBEZXRhaWxzDQpTZXJpZXM6DQpkcm0veGU6IGRvbid0IFdBUk4gb24ga2VybmVsIGpvYiB0aW1l
b3V0IHdoZW4gZGV2aWNlIGFscmVhZHkgd2VkZ2VkDQpVUkw6DQpodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3MjE5MS8NClN0YXRlOg0KZmFpbHVyZQ0KRGV0YWlsczoN
Cmh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3MjE5MXYx
L2luZGV4Lmh0bWwNCkNJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20geGUtNTU5NS1iYTg1YTU0ZTNj
N2VkNGY3MzBiMTk4ZmNmMjc0MzU3OTI2MWMwZWFmX0ZVTEwgLT4geGUtcHctMTcyMTkxdjFfRlVM
TA0KU3VtbWFyeQ0KDQpGQUlMVVJFDQoNClNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3
aXRoIHhlLXB3LTE3MjE5MXYxX0ZVTEwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQp2ZXJpZmllZCBt
YW51YWxseS4NCg0KSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGlu
ZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQppbnRyb2R1Y2VkIGluIHhlLXB3LTE3MjE5MXYxX0ZV
TEwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCnRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUg
bW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KDQpQYXJ0aWNp
cGF0aW5nIGhvc3RzICgyIC0+IDIpDQoNCk5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0
cw0KDQpQb3NzaWJsZSBuZXcgaXNzdWVzDQoNCkhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMg
dGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4geGUtcHctMTcyMTkxdjFfRlVMTDoNCg0K
SUdUIGNoYW5nZXMNClBvc3NpYmxlIHJlZ3Jlc3Npb25zDQoNCiAgKiAgIGlndEBrbXNfZnJvbnRi
dWZmZXJfdHJhY2tpbmdAaGRyLTJwLXByaW1zY3JuLXNwci1pbmRmYi1kcmF3LWJsdDoNCiAgICAg
KiAgIHNoYXJkLWJtZzogUEFTUzxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRl
bC14ZS94ZS01NTk1LWJhODVhNTRlM2M3ZWQ0ZjczMGIxOThmY2YyNzQzNTc5MjYxYzBlYWYvc2hh
cmQtYm1nLTMvaWd0QGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0BoZHItMnAtcHJpbXNjcm4tc3By
LWluZGZiLWRyYXctYmx0Lmh0bWw+IC0+IEZBSUw8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvaW50ZWwteGUveGUtcHctMTcyMTkxdjEvc2hhcmQtYm1nLTUvaWd0QGttc19mcm9udGJ1
ZmZlcl90cmFja2luZ0BoZHItMnAtcHJpbXNjcm4tc3ByLWluZGZiLWRyYXctYmx0Lmh0bWw+DQoN
Cg==

--_000_SA3PR11MB8118052FF6870BD28FDDC548D0A52SA3PR11MB8118namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIaSBDSS1pbmZyYSw8L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQpUaGUgcmVwb3J0ZWQgZmFpbHVyZSBpcyBub3QgcmVsYXRlZCB0byBteSBjaGFuZ2VzLiBQbGVh
c2UgcmUtcmVwb3J0LjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJm
b250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vydmlj
ZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJv
b2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3Nf
TVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRoYW5rcyw8L2Rpdj4NCjxkaXYgY2xhc3M9
ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRl
ZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpOaXRpbjwvZGl2Pg0K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9k
aXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgd2lkdGg6IDk4JTsiPg0KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGI+RnJvbTo8L2I+
IFBhdGNod29yayAmbHQ7cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmcmZ3Q7PGJyPg0K
PGI+U2VudDo8L2I+IEZyaWRheSwgQXVndXN0IDE0LCAyMDI2IDI6NTEgUE08YnI+DQo8Yj5Ubzo8
L2I+IEdvdGUsIE5pdGluIFIgJmx0O25pdGluLnIuZ290ZUBpbnRlbC5jb20mZ3Q7PGJyPg0KPGI+
Q2M6PC9iPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcgJmx0O2ludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4g4pyXIFhlLkNJLkZVTEw6
IGZhaWx1cmUgZm9yIGRybS94ZTogZG9uJ3QgV0FSTiBvbiBrZXJuZWwgam9iIHRpbWVvdXQgd2hl
biBkZXZpY2UgYWxyZWFkeSB3ZWRnZWQNCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2PjxiPlBhdGNoIERldGFp
bHM8L2I+PC9kaXY+DQo8dGFibGU+DQo8dGJvZHk+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6
IDJwdDsiPg0KPGRpdj48Yj5TZXJpZXM6PC9iPjwvZGl2Pg0KPC90ZD4NCjx0ZCBzdHlsZT0icGFk
ZGluZzogMnB0OyI+DQo8ZGl2PmRybS94ZTogZG9uJ3QgV0FSTiBvbiBrZXJuZWwgam9iIHRpbWVv
dXQgd2hlbiBkZXZpY2UgYWxyZWFkeSB3ZWRnZWQ8L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPHRyPg0K
PHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+VVJMOjwvYj48L2Rpdj4NCjwvdGQ+
DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRpdj48YSBocmVmPSJodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3MjE5MS8iIGlkPSJPV0EyMDk1OGQwOC1mYzIx
LTVkYTEtNDBmOC05N2MwNWJkZDM4NjYiIGNsYXNzPSJPV0FBdXRvTGluayIgZGF0YS1hdXRoPSJO
b3RBcHBsaWNhYmxlIj5odHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3
MjE5MS88L2E+PC9kaXY+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCBzdHlsZT0icGFkZGluZzog
MnB0OyI+DQo8ZGl2PjxiPlN0YXRlOjwvYj48L2Rpdj4NCjwvdGQ+DQo8dGQgc3R5bGU9InBhZGRp
bmc6IDJwdDsiPg0KPGRpdj5mYWlsdXJlPC9kaXY+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCBz
dHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxiPkRldGFpbHM6PC9iPjwvZGl2Pg0KPC90ZD4N
Cjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxhIGhyZWY9Imh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3MjE5MXYxL2luZGV4Lmh0bWwiIGlk
PSJPV0EwOThlNWI3MS0wODAyLWZiNDgtOTg1Yi0zZjNjMjAwMzE4ZTIiIGNsYXNzPSJPV0FBdXRv
TGluayIgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIj5odHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNzIxOTF2MS9pbmRleC5odG1sPC9hPjwvZGl2Pg0KPC90
ZD4NCjwvdHI+DQo8L3Rib2R5Pg0KPC90YWJsZT4NCjxoMT5DSSBCdWcgTG9nIC0gY2hhbmdlcyBm
cm9tIHhlLTU1OTUtYmE4NWE1NGUzYzdlZDRmNzMwYjE5OGZjZjI3NDM1NzkyNjFjMGVhZl9GVUxM
IC0mZ3Q7IHhlLXB3LTE3MjE5MXYxX0ZVTEw8L2gxPg0KPGgyPlN1bW1hcnk8L2gyPg0KPHAgc3R5
bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+PGI+RkFJTFVSRTwvYj48
L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij5TZXJp
b3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4ZS1wdy0xNzIxOTF2MV9GVUxMIGFic29s
dXRlbHkgbmVlZCB0byBiZTxicj4NCnZlcmlmaWVkIG1hbnVhbGx5LjwvcD4NCjxwIHN0eWxlPSJt
YXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPklmIHlvdSB0aGluayB0aGUgcmVw
b3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlczxicj4NCmlu
dHJvZHVjZWQgaW4geGUtcHctMTcyMTkxdjFfRlVMTCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0
ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbTxi
cj4NCnRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2Ug
ZmFsc2UgcG9zaXRpdmVzIGluIENJLjwvcD4NCjxoMj5QYXJ0aWNpcGF0aW5nIGhvc3RzICgyIC0m
Z3Q7IDIpPC9oMj4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFl
bTsiPk5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0czwvcD4NCjxoMj5Qb3NzaWJsZSBu
ZXcgaXNzdWVzPC9oMj4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206
IDFlbTsiPkhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGlu
dHJvZHVjZWQgaW4geGUtcHctMTcyMTkxdjFfRlVMTDo8L3A+DQo8aDM+SUdUIGNoYW5nZXM8L2gz
Pg0KPGg0PlBvc3NpYmxlIHJlZ3Jlc3Npb25zPC9oND4NCjx1bD4NCjxsaT5pZ3RAa21zX2Zyb250
YnVmZmVyX3RyYWNraW5nQGhkci0ycC1wcmltc2Nybi1zcHItaW5kZmItZHJhdy1ibHQ6PC9saT48
dWw+DQo8bGk+c2hhcmQtYm1nOiA8YSBocmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9pbnRlbC14ZS94ZS01NTk1LWJhODVhNTRlM2M3ZWQ0ZjczMGIxOThmY2YyNzQzNTc5MjYx
YzBlYWYvc2hhcmQtYm1nLTMvaWd0QGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0BoZHItMnAtcHJp
bXNjcm4tc3ByLWluZGZiLWRyYXctYmx0Lmh0bWwiIGlkPSJPV0E1ZjJiZmQzYi0wYWMzLWZjMTEt
ZjBiMC01MmM1NWRiYjYzY2MiIGNsYXNzPSJPV0FBdXRvTGluayIgZGF0YS1hdXRoPSJOb3RBcHBs
aWNhYmxlIj4NClBBU1M8L2E+IC0mZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3MjE5MXYxL3NoYXJkLWJtZy01L2lndEBrbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmdAaGRyLTJwLXByaW1zY3JuLXNwci1pbmRmYi1kcmF3LWJsdC5odG1s
IiBpZD0iT1dBNmE5ZDk1MjQtNzBkYS1hZmM0LTkzZGMtYTQzZGYyODQzOThiIiBjbGFzcz0iT1dB
QXV0b0xpbmsiIGRhdGEtYXV0aD0iTm90QXBwbGljYWJsZSI+DQpGQUlMPC9hPjwvbGk+PC91bD4N
CjwvdWw+DQo8aDI+PGJyPg0KPC9oMj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_SA3PR11MB8118052FF6870BD28FDDC548D0A52SA3PR11MB8118namp_--
