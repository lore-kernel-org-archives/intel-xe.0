Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D9FF8860
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 17:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FAC10E861;
	Mon, 27 Apr 2026 17:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSecxZHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB75A10E861
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777310496; x=1808846496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RYdpN+xcHMzvYYyOG5l17dVEz0C0dPrb1Qk6EQSITy8=;
 b=SSecxZHJ3oW94nkOiYTbqIDXmhbrlOcelCn63xW/R13wjLtT7sjvi5m2
 prubW7qTWazUPNM8wEm/p48o66mo2qWAMp4Tgh7x+F7Olf977hdMeP5iS
 +VJsozaC+XXoZrJzTcpHo6lM3PyqoeBXSTOdRbnFRdtrZf4Ioe2vN7BQG
 nl+NRX5ue277RcFvaDNNJNv1uQXJerR8JQqczAFODOhaixbrzbl5rwOGu
 1V5FOmGtfoNyRoPuQhDkfO5E8iAPo2D5XsTmYSlPTEg61uRro7z8Jqcjb
 hVR2EWrKDy830uJkpuniGg/IXoieovCLXnDZ762REGz5wzWUI1JIjWGfa g==;
X-CSE-ConnectionGUID: GCRAn8fkQJqbfDiZlP+4ew==
X-CSE-MsgGUID: hL5MVZtFSpuyE08b1oJohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78190380"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78190380"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 10:19:31 -0700
X-CSE-ConnectionGUID: iK59n+4bRNClgsEh6KBq8g==
X-CSE-MsgGUID: eXImE+OdQ72zLtJtUw2A+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="227179385"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 10:19:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 10:19:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 10:19:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 10:19:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFDLYU642E9MGW9OwIAe36fzL2ht2aVABZkGHg/bpn70KDu/IMpZhlljquXACdKeU2kJIefjjJahdIMAmoFlhaKujHZ1d1ONkO3j3kL94zFWL3pX+GLhmOiSgexfS8pq26+6tB5lavhm9MfuDHHnO4UFb6xinFGPHfkPyBB279wNzlX7yFnmUJsLGbCOSjjnB0qXgvdjlHq/9BLhXxJ3O1cMQae87FdG8bUwYJCFHBLTZSHd6k4gDLOYC72lgDB4LZnnIJd6Zw2NI30u5sZ6ayueG4d3ifUk3oEhN/xQSN0oIv8CWB6OTR+a7xv/pIS5HbXwgHCBMrySli4huTTlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYdpN+xcHMzvYYyOG5l17dVEz0C0dPrb1Qk6EQSITy8=;
 b=kdBbGvPNq+7GJpuotsv2/uQS59XMvethW3G3d4k2czo3XwQ2Y/Din0mlWLJu0Pl28n4ZzmXNu4KHw6v26ZZKLT3axoMt7OtofiSBDMdI64f0vll9TeMQnuETZzfsT6tzlROYp51ptjtMqcQ77jen3twvGgYkwT7gx4czNiI0XSfKhaUadH5fPMzA9llTzp4C+UHwB88epgsp78bvaJvmVrIWrIz4PHhP/NDJzEgSF5QX72yJ4Zvz89y1H2k9xUTUJGCrz5+AIto+vLS/3KtYuqfot+nnZEmRUmyzce1pc9dq7ftc/gu/3lHNMOtGDD7NyKsxBrOALbk0g77s0ickew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS4PPFBF67129C1.namprd11.prod.outlook.com (2603:10b6:f:fc02::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 17:19:27 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 17:19:27 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 05/10] drm/xe: Fix name and definition of GFX_MODE
 register
Thread-Topic: [PATCH v2 05/10] drm/xe: Fix name and definition of GFX_MODE
 register
Thread-Index: AQHc1CwTfGQmleD6t0CHSFlwsYrLurXzKfww
Date: Mon, 27 Apr 2026 17:19:27 +0000
Message-ID: <DM4PR11MB54569CDE543187FE127472BEEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-5-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-5-59cc620a25f1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS4PPFBF67129C1:EE_
x-ms-office365-filtering-correlation-id: a2debaa1-7344-4785-6900-08dea48122e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 1NGXL8lSrusqYhH4nKu/2EfcUKaQzh9AISR/Alr8NyuedHsl511b/XZqVJRnwEEd4mdHCoRwcAL2K6l9+/uNOqunCnL86nGh+yPo2XvVzkbjGz956HQP6/jAX2RokOy6i+aN4TNjIpypOu+mdQ7lKjbF7Gjz0C8CiE643EFF4guAcuekX+hujV/vsJ3i2QmQWV7Kkvp2ES9xoX34wzPNrmgdRMKO1p5P10w4p6kHI69W/HuV6E7COlA2W0pCmK6ydq0EBh6Yiri18/1f6qPDFP2kUK3Qgp4rHnXUxlxfypxYBMoTT0hr7pObwSJr6/YRPR+UlcF+xCeeFk7VtaPsBP5lhnNbmS73m8S9ltrMtVJyhBoEZDe+4Ly9t7fm6xvBdwmLzt6hEEmjev6PrcnnWQvbRaNPbGMvI++tpa6Kx6CBJ5cmNAAkkZdsDNKqATpI3NM/tSUwSkkjq2ah1jL1kb0iGztaHeweOWliQUkYf0ju66waaPKWCP8rIiG3RkpAhVriNOLDyw1xCQkGapNVSevGkfOAr72dM6QwI+y/9lcs5j9d+s6ICFtlh8oqq8V+7Vg5PSW8yKv2elaB+G0K+nEMSkLvTebWsEYW85c83EqWp/IoMvEOJAGq2lHw4FqFpRkODyEA1BwW/rno2G9HvvfB/E/RtPJRnXwDZwAgtS6g+eO+X7CajEMhi9eLKdmSO8rH0sfb4vi4rGHNT35AZXnwEGttvOvASlImPeF+ITxKThwuMPQ8Z7hk4Wh9ghqfrlnw2CPyvcUEQTWZXaMxqA4h0Cm6+Mpy9abqjhtxxwo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3A1Y1U1NndYNXIzcUVXWHhvSi9iSnk1ZUFxZHQ5eFQwTWJiV2NaVWpCRFh6?=
 =?utf-8?B?MW9CWGd2dTZwR0thd0RVYnZqZE5tUXdEb3RCNXBZYmdMRldMdlJTSDlHaWln?=
 =?utf-8?B?RjdSdnRMOHMvUTB6aTY0cmlIUFpsOHZMRm9Sa2MzcHg0VW11NzFld2VJeGs0?=
 =?utf-8?B?ejRpVzRGa2FLN1pDTVIveU5QdUVWbmxvaFNqQURrRWxnd3NmN2RxUkw3ZVE1?=
 =?utf-8?B?QWVuVEs5MFVQQ0FBVU5nU20rcU04d05VeGVqa1JHQzZISUdqQTZZeVN3ZjZX?=
 =?utf-8?B?TnZmV3NPdE9HZ00veEhBY1NsS1pTSjBHbTNHelh6K2d2UjlZbWtHa0xpODYz?=
 =?utf-8?B?WDlEVktyKzFaakJaUnc3d2FOS240U0FTR082YVArYkFvOTFJZi9HS1RTeGxv?=
 =?utf-8?B?TUE2WVk2T2tkMWJ5L2daMm5vYWFYb0Qxa3J1T1lwQmVXeXNwbU9EdzdNVGc3?=
 =?utf-8?B?WCsvK2E0MmNmSGg4a0xscmFhcjJRdm9ISkx4a0FnbnJFQ3B5ZURPYTF1Ni9j?=
 =?utf-8?B?bXZDOHp5ZzhRY2cyR3VNOFFFZUlXNFFCV1ZKU1BmMmozaWNCUkR0SW84OHNU?=
 =?utf-8?B?Y2lNcmExbElkQ1I3RDBkeXNPODU5Ky94YjFDTUZpRHM1TG43VnNPcE9COE9D?=
 =?utf-8?B?VHRhNkZUNkMybTBTUGRuZngyT01uZE9Yd1pwRlFUU3R0bVFZUVBIeGIvRHZ4?=
 =?utf-8?B?bTM5SkFKeVROWUtTS3RDcXhFK09uKzVuWGtuTlJNRmFRN0QxeUc3ZkdxSGxw?=
 =?utf-8?B?Zk9kVFNtYVFxYitFWjA0VVRGQkUrNlFiaitKLzJpU3FvZDBzd1Y0ODYvVGtT?=
 =?utf-8?B?YnJ1eUxRTTZKSytqY0U0Qnc0MnR6K3pGYXdSakdIR3hlVXhqUEMvZ2JrUzZl?=
 =?utf-8?B?bW9FSlFLbGdVcGc3dWNQZ2pLWFZVVXRick1SWHYxRkxEbnFqMjN5dUN0UStz?=
 =?utf-8?B?K2tGM2JSU3ppbEZtdGVldTRHWXpCeERSNVlZMUlncTdoS0swaHdhYnFPbjlt?=
 =?utf-8?B?Vi9XdC9DTi9scWd0RTVQZnFhNXhNNlFuM0g0OFpKSFlITjFoWlFOUGhzQ1RN?=
 =?utf-8?B?c3NBalUzdjRXNDRwdzlPYmVLQzVUKzJBS2c4QXlQNEwyUmh2cEdHQTN5SXNU?=
 =?utf-8?B?aG8zVGd6dXhsVmIxcjRYRzlCRks3L2w1UnRIWWtjVEtzRG8rVXlXWUxRZDcv?=
 =?utf-8?B?NWRUVkF5Y2dLK1ZtN1Y0bWJBeUhYZlhhcnIySCswNkRqR2UzNmVlYTQzdkF1?=
 =?utf-8?B?Mm5JWUxSZjdMK3pqRXMrUENIdUlFMW9EV05PRnB2RDRCaFRzVzRhNHM4VFZM?=
 =?utf-8?B?U3VOQWF4a3ExaGdlRmUzengwQ3ljQWV3NkJCbkZESExxbzBXY2RXdXMvTG1S?=
 =?utf-8?B?eWhLUkdpQnBkbTZDZGJJTit5QzdzRkFBMzdEYWRKaU55bkxhek5iRm5mU0ZD?=
 =?utf-8?B?NytWUSsyejZhd0NQVm90cFNqZ2YwWEhuZlFMOWp5d0V5eHRDZHgwcm83eklE?=
 =?utf-8?B?YTVrNnMzWUJDc0RTTmNqQ2VPaXFtK1FZMCtPNm9rM3RXWW1ZdnNMS2N2V0Mz?=
 =?utf-8?B?YU5lbDlvN0JQbU1KS1BDSWR2MUE1YktxY09RdWlPTUs5TC9sc1hSUnZCRlBV?=
 =?utf-8?B?cFZNR04zL1I2TklKRFZlU1RRc3RqNzJaTDh4Z3l5d3VOdk10N3gzdFI1RjRa?=
 =?utf-8?B?a1gxVFVrbGw0dkduMUNiZWR5M3NXTUdsalpYK1paM0VqVDdXajNPL0JyK1p3?=
 =?utf-8?B?WmpYaEhuMlNNdUtmLzV1STkxU0RhSnFtenV2alNFTGMvR1U0bEJJcU5TTVlC?=
 =?utf-8?B?RVo3RElpbisxUzQvZ1grWTlycVkrMzRPcEpnNXNRYzRVNWo0T2JHUms5c1BS?=
 =?utf-8?B?bjVUdnhUSFk4aFp2QTg3T1hCaUJCRUlJM053eko5VVpsOEVFbythNG9KS2xk?=
 =?utf-8?B?RHhyQ0kra2JQaVNKWVFMQzk3RGZMcHNFeGNrbGwwRy9CV25LU05NampHZ2p5?=
 =?utf-8?B?TnNhQXc5T2dRbm0xUXp2aWNiVG5LWWloL0pQMkE1RVdmWC8zckFTczg0Zysv?=
 =?utf-8?B?LzROT0FMZVVwRDlnakN6YUFGZnM0bGRlYnVYN3d4eHNvc3RaU1JsbFJIVVVZ?=
 =?utf-8?B?MnBtMEdzMGpwRDhKWHVPbzRvTzM5VGpzT2d1eElFMk81bER6RkM1SUg5RFFJ?=
 =?utf-8?B?TnhqV1cvdzRWK2ZxNnR2akpjMnRpRUMvdTF5MlpTY0g5K1BQR3g0ZThFd2tl?=
 =?utf-8?B?VUVZZmNuR2l0M2hrM0VTeGM0SzNhdjFrTDNQaUgyTzFCN1puTTlmSVVxNW5P?=
 =?utf-8?B?QUtOdnNxMVZoalUydW91dkNyS0hTUUIxdmhsV1dHa0t0UWgybUFjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IN9MPcbMEY3uXfr5GAXin8Y+zpathvHUXJCydL/78CewVVkv5DxWQOZVYKn6HSPAo4DdAoJiAfH2wvv3VhIOUq0uLwSlU6ggGiWr4giXtcKQEW5MFgMup+h4ekR3PtV3GpcVzQDtkvymgrzI4AMy8jtx12E8sqcCnvoQdvA9gz4QBPKmGwJLN4FRxkaQCVqguGNarfHFoxegN/GXh17ZPsxfTY8Swb0x3QeCt6KBRSAIH54DMWDOAlcbthGxZ4iPjMzoS7Hp0kNQen2ltY3gAtfaT51sepjvr6MXOiOtgkdpIoDBSEaqLDiQhUFaJj2J/g9fMKuEa/0cBd7J+sX6sQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2debaa1-7344-4785-6900-08dea48122e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 17:19:27.5739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +t2253LUI2jDAWQuqmdP5pTo7nFKT0Pq60ec1Q9O+DTEqT4ppbM+U4OEIzwyJDamVlBljkXVmxOTqsh/aM4eww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBF67129C1
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgMTo0OCBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBUaGUgcmVn
aXN0ZXIgbG9jYXRlZCBhdCAkYmFzZSsweDI5YyBpcyByZWZlcnJlZCB0byBhcyBHRlhfTU9ERSBp
biB0aGUgYnNwZWMuDQo+IEFsdGhvdWdoIG1hbnkgb3RoZXIgcmVnaXN0ZXJzIGhhdmUgUklOR18q
IHByZWZpeGVzIGZvciBoaXN0b3JpY2FsIHJlYXNvbnMsIHRoaXMNCj4gcmVnaXN0ZXIgZG9lcyBu
b3QsIHNvIHVzaW5nIGEgbmFtZSB0aGF0IGRvZXMgbm90IG1hdGNoIHRoZSBic3BlYyBqdXN0IG1h
a2VzIGl0DQo+IGhhcmRlciB0byByZWNvZ25pemUvZmluZC4NCj4gDQo+IEFsc28sIEdGWF9NT0RF
IGlzIGEgbWFza2VkIHJlZ2lzdGVyICh1cGRhdGluZyBiaXRzIFsxNTowXSByZXF1aXJlcyB0aGF0
IHRoZQ0KPiBjb3JyZXNwb25kaW5nIGJpdChzKSBpbiBbMzE6MTZdIGFyZSBhbHNvIHNldCksIHNv
IGFkZCB0aGUNCj4gWEVfUkVHX09QVElPTl9NQVNLRUQgZmxhZyB0byB0aGUgcmVnaXN0ZXIgZGVm
aW5pdGlvbjsgdGhpcyB3aWxsIGJlY29tZQ0KPiBpbXBvcnRhbnQgd2hlbiB3ZSBzdGFydCBwcm9n
cmFtbWluZyB0aGlzIHJlZ2lzdGVyIHZpYSBSVFAgdGFibGVzIGluIGEgZnV0dXJlDQo+IHBhdGNo
Lg0KPiANCj4gRmluYWxseSBzd2FwIHRoZSBvcmRlciBvZiB0aGUgcmVnaXN0ZXIncyB0d28gYml0
IGRlZmluaXRpb25zIHRvIG1hdGNoIG91ciByZWd1bGFyDQo+IGNvZGluZyBzdHlsZSBvZiBkZXNj
ZW5kaW5nIG9yZGVyIGZvciByZWdpc3RlciBiaXRzL2ZpZWxkcy4NCj4gDQo+IEJzcGVjOiA0NTky
OA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmggfCA0
ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jICAgICAgICAgfCAyICst
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jICAgICAgICAgIHwgMiArLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMgICAgICB8IDIgKy0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAgfCAyICstDQo+ICA1IGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiBpbmRleCAxYjRhN2U5YTcwM2QuLjRk
NWNkMWI2ZjUwZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5n
aW5lX3JlZ3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVn
cy5oDQo+IEBAIC0xNjUsOSArMTY1LDkgQEANCj4gICNkZWZpbmUJICBDVFhfQ1RSTF9JTkhJQklU
X1NZTl9DVFhfU1dJVENICVJFR19CSVQoMykNCj4gICNkZWZpbmUJICBDVFhfQ1RSTF9FTkdJTkVf
Q1RYX1JFU1RPUkVfSU5ISUJJVAlSRUdfQklUKDApDQo+IA0KPiAtI2RlZmluZSBSSU5HX01PREUo
YmFzZSkJCQkJWEVfUkVHKChiYXNlKSArDQo+IDB4MjljKQ0KPiAtI2RlZmluZSAgIEdGWF9ESVNB
QkxFX0xFR0FDWV9NT0RFCQlSRUdfQklUKDMpDQo+ICsjZGVmaW5lIEdGWF9NT0RFKGJhc2UpCQkJ
CVhFX1JFRygoYmFzZSkgKw0KPiAweDI5YywgWEVfUkVHX09QVElPTl9NQVNLRUQpDQo+ICAjZGVm
aW5lICAgR0ZYX01TSVhfSU5URVJSVVBUX0VOQUJMRQkJUkVHX0JJVCgxMykNCj4gKyNkZWZpbmUg
ICBHRlhfRElTQUJMRV9MRUdBQ1lfTU9ERQkJUkVHX0JJVCgzKQ0KPiANCj4gICNkZWZpbmUgUklO
R19DU01RREVCVUcoYmFzZSkJCQlYRV9SRUcoKGJhc2UpICsNCj4gMHgyYjApDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiBpbmRleCAwMjZhMWVjMGM4NjguLjMzN2I5YjRlOGI0
YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gQEAgLTgwLDcgKzgwLDcgQEAg
c3RhdGljIHZvaWQgX19zdGFydF9scmMoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlLCBzdHJ1Y3QN
Cj4geGVfbHJjICpscmMsDQo+IA0KPiAgCWlmICh4ZV9kZXZpY2VfaGFzX21zaXgoZ3RfdG9feGUo
aHdlLT5ndCkpKQ0KPiAgCQlyaW5nX21vZGUgfD0NCj4gUkVHX01BU0tFRF9GSUVMRF9FTkFCTEUo
R0ZYX01TSVhfSU5URVJSVVBUX0VOQUJMRSk7DQo+IC0JeGVfbW1pb193cml0ZTMyKG1taW8sIFJJ
TkdfTU9ERShod2UtPm1taW9fYmFzZSksDQo+IHJpbmdfbW9kZSk7DQo+ICsJeGVfbW1pb193cml0
ZTMyKG1taW8sIEdGWF9NT0RFKGh3ZS0+bW1pb19iYXNlKSwNCj4gcmluZ19tb2RlKTsNCj4gDQo+
ICAJeGVfbW1pb193cml0ZTMyKG1taW8sIFJJTkdfRVhFQ0xJU1RfU1FfQ09OVEVOVFNfTE8oaHdl
LQ0KPiA+bW1pb19iYXNlKSwNCj4gIAkJCWxvd2VyXzMyX2JpdHMobHJjX2Rlc2MpKTsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2Fkcy5jIGluZGV4IGQwNDk3ZDlmNDNhMi4uYjQwM2VlMGI1ZTc0DQo+
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gQEAgLTc0NSw3ICs3NDUsNyBAQCBz
dGF0aWMgdW5zaWduZWQgaW50IGd1Y19tbWlvX3JlZ3NldF93cml0ZShzdHJ1Y3QNCj4geGVfZ3Vj
X2FkcyAqYWRzLA0KPiAgCQlzdHJ1Y3QgeGVfcmVnIHJlZzsNCj4gIAkJYm9vbCBza2lwOw0KPiAg
CX0gKmUsIGV4dHJhX3JlZ3NbXSA9IHsNCj4gLQkJeyAucmVnID0gUklOR19NT0RFKGh3ZS0+bW1p
b19iYXNlKSwNCj4gCX0sDQo+ICsJCXsgLnJlZyA9IEdGWF9NT0RFKGh3ZS0+bW1pb19iYXNlKSwJ
CQl9LA0KPiAgCQl7IC5yZWcgPSBSSU5HX0hXU19QR0EoaHdlLT5tbWlvX2Jhc2UpLA0KPiAJfSwN
Cj4gIAkJeyAucmVnID0gUklOR19JTVIoaHdlLT5tbWlvX2Jhc2UpLAkJCX0sDQo+ICAJCXsgLnJl
ZyA9IENDU19NT0RFLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19j
YXB0dXJlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuYw0KPiBpbmRl
eCAyZjU4MTZjNzhmYmEuLmJjNDllNDAxNjVhMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19jYXB0dXJlLmMNCj4gQEAgLTExMSw3ICsxMTEsNyBAQCBzdHJ1Y3QgX19ndWNfY2FwdHVyZV9w
YXJzZWRfb3V0cHV0IHsNCj4gIAl7IFJJTkdfVEFJTCgwKSwJCQlSRUdfMzJCSVQsCTAsCTAsCTAs
DQo+IAkiUklOR19UQUlMIn0sIFwNCj4gIAl7IFJJTkdfQ1RMKDApLAkJCVJFR18zMkJJVCwJMCwJ
MCwJMCwNCj4gCSJSSU5HX0NUTCJ9LCBcDQo+ICAJeyBSSU5HX01JX01PREUoMCksCQlSRUdfMzJC
SVQsCTAsCTAsCTAsDQo+IAkiUklOR19NSV9NT0RFIn0sIFwNCj4gLQl7IFJJTkdfTU9ERSgwKSwJ
CQlSRUdfMzJCSVQsCTAsCTAsDQo+IAkwLAkiUklOR19NT0RFIn0sIFwNCj4gKwl7IEdGWF9NT0RF
KDApLAkJCVJFR18zMkJJVCwJMCwJMCwNCj4gCTAsCSJHRlhfTU9ERSJ9LCBcDQoNCkkgdHJ5IHRv
IGdyZXAgdGhpcyBuYW1lIGluIHRoZSBlcnJvciBkZWNvZGUgdG9vbCBpbiBtZXNhIHJlcG8sIGFu
ZCBkb24ndCBmaW5kIHVzYWdlIGZvciBpdC4NClNvLCBpdCBzaG91bGQgYmUgc2FmZSB0byByZW5h
bWUgaXQuDQoNCkxHVE0uDQpSZXZpZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxp
bkBpbnRlbC5jb20+DQoNCg0KPiAgCXsgUklOR19FU1IoMCksCQkJUkVHXzMyQklULAkwLAkwLAkw
LA0KPiAJIlJJTkdfRVNSIn0sIFwNCj4gIAl7IFJJTkdfRU1SKDApLAkJCVJFR18zMkJJVCwJMCwJ
MCwNCj4gCTAsCSJSSU5HX0VNUiJ9LCBcDQo+ICAJeyBSSU5HX0VJUigwKSwJCQlSRUdfMzJCSVQs
CTAsCTAsCTAsDQo+IAkiUklOR19FSVIifSwgXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2lu
ZS5jDQo+IGluZGV4IGVjNDdlMTdiNDExOS4uNjBhZjM5NWQwMzFjIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jDQo+IEBAIC0zMzIsNyArMzMyLDcgQEAgdm9pZCB4ZV9od19lbmdp
bmVfZW5hYmxlX3Jpbmcoc3RydWN0IHhlX2h3X2VuZ2luZQ0KPiAqaHdlKQ0KPiANCj4gIAlpZiAo
eGVfZGV2aWNlX2hhc19tc2l4KGd0X3RvX3hlKGh3ZS0+Z3QpKSkNCj4gIAkJcmluZ19tb2RlIHw9
DQo+IFJFR19NQVNLRURfRklFTERfRU5BQkxFKEdGWF9NU0lYX0lOVEVSUlVQVF9FTkFCTEUpOw0K
PiAtCXhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoaHdlLCBSSU5HX01PREUoMCksIHJpbmdfbW9k
ZSk7DQo+ICsJeGVfaHdfZW5naW5lX21taW9fd3JpdGUzMihod2UsIEdGWF9NT0RFKDApLCByaW5n
X21vZGUpOw0KPiAgCXhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoaHdlLCBSSU5HX01JX01PREUo
MCksDQo+ICAJCQkJICBSRUdfTUFTS0VEX0ZJRUxEX0RJU0FCTEUoU1RPUF9SSU5HKSk7DQo+ICAJ
eGVfaHdfZW5naW5lX21taW9fcmVhZDMyKGh3ZSwgUklOR19NSV9NT0RFKDApKTsNCj4gDQo+IC0t
DQo+IDIuNTMuMA0KDQo=
