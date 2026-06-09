Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8827CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 22:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB8610E3C1;
	Tue,  9 Jun 2026 22:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYJwozNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25ED10E3C1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781043171; x=1812579171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/GTLjRFN/t7eCiwJi8VtgRDDJqkIyJRE/POx/o5iIEA=;
 b=XYJwozNPCuaVCdGaGOkqL6Ubd7+8CEANZakK0/1EB6EWB4YKuAvgwAHU
 /iMHvWSG4TK8kzRxF3pMPMq7ae8jQtDZNof6tubdgxhV3ysHlaEaHLMp9
 wvUYPwKH9nbKuPEbV0BQjlqUTSFffq2kCoJ2cRIrbRv75W+nIhJulFe7C
 4rcTc1pMY435zQ64QMn4VY4mhVb4+U3LYH3oCMedc/352S/cdSjVp3dpB
 j2agDKwHvagRImBMxlLNouzUtgorCtT/DWPg6D4DIl4VHH8g5MgTcVAhI
 O5/q8PRrahRGFnP58uGriaBGuRaUuEkIG/145GmEVba/JD6JoOm7cupJF w==;
X-CSE-ConnectionGUID: FGcDeqE5TVaVo9r+XHXVIg==
X-CSE-MsgGUID: rXwYPyZJSHinwmr+LzUX0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80842201"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="80842201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 15:12:50 -0700
X-CSE-ConnectionGUID: y42MjfpVTdWrS5q9OsZqMA==
X-CSE-MsgGUID: n/zrlp+KTcGcrHIvJhrMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="241553657"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 15:12:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 15:12:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 15:12:50 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 15:12:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvcrcMu18o9O6bIOaf6dC3+EYhzXvL34UuD4R5LJdlS8YxTrdGv/y0C7eONtFazfmhOz/PydolaL/+nRiElhwC+6uUNEIw9QU80SIRwolSNkZQonNoLkEMS7OF1q3ZVAKkvN9nM8OB4IU5ni+JzEkARE2urXBFbl256kX6/OC2WKqmrD7PynAdKywYJUHau4SBWler/a834n1h0YK/gxTUHlTv+j5RN1p9lnW1b38EfHdqjdTMZdFaL0JeG4qNRNQt9B/5H+OQ5y2116A2pV2L9Of9VuvOVgEUAHOzKHk798BtvQebi+JtT7N+DhwXvMMumfvX6nnN3f4t1NCA3xrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GTLjRFN/t7eCiwJi8VtgRDDJqkIyJRE/POx/o5iIEA=;
 b=ERp97g67THWLBrWMEjsCGlAHnjzWtXaVI3k+dcsrblqqQVe2vPWAVrxKB4LHakpZmCEjvKQCuT694IVnprXGL8RW0ICOSZqPRFI5h4r3xzSnyz3uWOdDpp56APXQtr4pUgmkzmfuc2NWpqXo0IuqezBif99EZC4+5WtK4hA729Mt/IqBUtzFNy5lzMJ8sdNO8ppn2O27hQj7XWREiHcKHjZhylC6wgFRRTsLxnymZUSXDjJtPkPvc50BMp1+UzW8+oueaK+P63oTiGI38tcW14WWZR4BVEQB07CeqAS+WwEiaHoJf401NZP0jy7HIg14A7iD9PtJadBmQgSkACjk5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 22:12:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 22:12:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
Subject: Re: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
Thread-Topic: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
Thread-Index: AQHc9UIJDEi3+VGgN0OrNIKVwaZhrLYxYeMAgAVCooCAAB8LgIAADBwA
Date: Tue, 9 Jun 2026 22:12:47 +0000
Message-ID: <5b89cf04f1aecfad4636f31d1d06f7febea8d994.camel@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-21-stuart.summers@intel.com>
 <d0861102-2bd2-4010-90c3-fee01fe0f142@intel.com>
 <1ca4cf6934e72cca5bad61bc413c74a2ac9784ef.camel@intel.com>
 <d85a6d2b-c585-42c3-9d41-92d8d9ec0fe1@intel.com>
In-Reply-To: <d85a6d2b-c585-42c3-9d41-92d8d9ec0fe1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB6798:EE_
x-ms-office365-filtering-correlation-id: f85882ec-edfc-43fb-1a50-08dec6743ce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: B21F2SMjAFyvtmXvbl7bLle3iaaP/ZxrmhpcuFULE7g7c2jQOZu7MhUfOA4COVh/XhmleNdyJjY31oGCzXJ60qKwKjFSoTN6d/TDI4Nl9duI0snTPPIhiFOKFWGSpHZQQ9g7blZ4UkLJL4KVi+8oxJIgpXfgEfU5sw7rnCo4mciLtxV9sLVXXMftz/Mx3veU3ArpLHRLvXtO+Qo/4XgnhKXzN/qL7Qc46nvILgt0F6cUFzbQNyQY7G+EtSAS41EdXU419hppNcvE0C1v++3qqUvpCgc2MDDsah5bt1rpbvpo1crDFzZC5cwQ6MHOTRv2I/urI5rc0PynV9Vjrs06nAbePvKnKm32cdOgiaT76qeKaf+17Ouzw+nWWbVOfZV+xSxi48/kWlihC2wS7URcEfRyvqm5mPhNCgk0WvEhTT4Lk7C9FqE6PPGeW3Di3Eg7XhzUitfWbkBwREMnTOP71dAmByBYyuoC2yYAo2QrLX5pL8nfYe+fgqnnh1AjgSj6AK42kf1yAKYufXTjaSC7OqmNXELa5eQsRTG+KG3XymCUMDwb8Aj26EskaK9SFH5fNOxMUJyEXRPn6jiuVNt4ybOPHJHZJcibsvbPSY9wD+5JSx3XWngvM6BsBme9xRnuwEkO/+nexkipYV7OL1ZJFakU+o+EnzIsnS4ENjcCr+EKQOoUJlllguJUPiZDnSO0k44OIzM8da8id94EMlp1/MepkXCLbbu9cRLU+kJFXQjJCnyrpyz9cIUKZ+vMLI6W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjBnOWp2eHU1WW5TZVVmVW82MUxFMXY4MnhjQVppNlVOcGhTNllMcHZPTDFm?=
 =?utf-8?B?SitJNTZCU0M4cHdQZDhjanJlSldtaGh4WGZkeXRwWURVeWV3QzdZcE03Wm1m?=
 =?utf-8?B?cVZ6dEV6WDMyM1MwTjlBclZQaVR4cC9BR2Rvek1tcDhib1gyVE5VMmgxTDVH?=
 =?utf-8?B?bzJMYmZSSGE0NVhiWURvQURmNlhPRDR1eTdFY1lkdi9oUlZlK1VhNWtaRkZV?=
 =?utf-8?B?MHpjOGx4d1BUUnhmV3NoQ1REMnRmVGFWa3VFYWhtZ2ZIZ0czS25LdzRpMVNO?=
 =?utf-8?B?cnpKMWdTZ3FsL3RaZjlOeis5b2dRNUZHYnBZNmZwUGF0ekxtMmd5NE85cEN2?=
 =?utf-8?B?WW5HRmdtKzM2UVg4c3h1Sm9uUlVLbkgyT01vZWo5REcrRzhDbHUrR2E5a1dy?=
 =?utf-8?B?SGNzWmM1dnQyQXdpSC96bncwNTJndDliQjJoVmFhZDhhcTRTTlQrT2FxeE9l?=
 =?utf-8?B?UzhZVytJLzVlN2dIc0hlcE8xSzVlUVJEWWJKYndUSjQ1OGhmSk1pd1ZmVnlP?=
 =?utf-8?B?NXFKQnhKd3IzWlBPR0EzZ0FmVWJPZ3Z3Y3FnNTVwNVVYU1Y3UlpCK0o5SEYr?=
 =?utf-8?B?ejQ1SlJxYXV6VDdFY0c2TTEzUEJPblVFRjdZeU8zTElLa094ckg2bUE4Y255?=
 =?utf-8?B?Qy8xb3poQ3ZlRGxLc0FCMUxpV3FpZEhFVVB3TnJhZzFiRGJVYmZxOEtjeThL?=
 =?utf-8?B?QmxLNmg5b0Vya3RFa2VVQzA0YmFIMUlMRGpMaHBaTStDZnFjZWx6am9EcnBL?=
 =?utf-8?B?YUlxa3BGSlpsd1ZLS2YrZHVsWDNad2N3cGpCdVdpZnU5RlNiTm9vZCtHODhU?=
 =?utf-8?B?SktWZ3hmSldUREtpdVd3bmFLNHRRVVZlWHpoUjJOd2FyL2pXWE9pcUJ3RlIz?=
 =?utf-8?B?TlhxM0lFeUxnL2J4Y2xaNmZjMGRkUjY3cHJKbzd3V25GS0JSRWVSRjUvbmN3?=
 =?utf-8?B?ekRBcGNUbWw2SC9ZS1pLTWZQVWVLck5xSTc1a0R1SkMzQU1vdThXSURzVnU5?=
 =?utf-8?B?YlZ1dUVmazB5WXlhbUJzaHJ3L0llU1RHY1NpU2ZSTFVtWDE4aWNyMWxWYUFU?=
 =?utf-8?B?d2p5QlgydlNDWUZURU1BV3ZMSEthQm10MnQ1WHBJNHRqemdzME5JK2ZzQk9j?=
 =?utf-8?B?a01pMHhVbjNPZGdNdldHLzdzQVBSZnJ5aTFMUXE0NWtEWXh1V0RKL1IrdUcy?=
 =?utf-8?B?bXhFalppK2lCbnV2bmI4Z2QraHZ2K1hnUi83VmR5QlBOY0t1MVN6dVdGRGsv?=
 =?utf-8?B?QndLZkl2cjdPVnZlMzU1U2gzVXV4WkYvek4vMzhkaTZtU0ZxSWRPWHhmWXhG?=
 =?utf-8?B?ZHAvazZ5MithS1lmVlBsTVAxRU5ZSFJEdG9XMWlQamNaVUVKRjMvWlNUc2E3?=
 =?utf-8?B?MGcwL3p5NWYzS0JpVWMvSDI5NlJvSCttb3JSREpid25mSFlFNUlFQ3JhZGp4?=
 =?utf-8?B?b2s4eUlEZ29LVlcvM1BEOE83ZWRXbjdDZlR3b0hPV3h0YXBsbnoweDBvQlFK?=
 =?utf-8?B?TUdPbXlJU1BxZFNTVVdIQkk0dGtnYlo4bkEwOWZMejhzbGNuOVRKYUo0QmJB?=
 =?utf-8?B?UUlkTVFJYTNSenFUUk0wdU1oVXQ1QjNNaWlEczBTcjM0cmV6dDlsZm93TVUx?=
 =?utf-8?B?WDRDWlBFcGdVc1ZmSTdtVHZlYTVuMUNqWk5PU0dBbEpXUG43QUVySkF0cDVn?=
 =?utf-8?B?UkFJL21KYVZMQW1ZTUdwczVodHBBMXNzZDVaWHZvMUhBVkRXSko3c0p4djlk?=
 =?utf-8?B?ZDJDYXk1NmNDWDFUQlE0RkI5YXZ1dEtvVnpqWHlwQUxsV2pkVC9CUnlML3lB?=
 =?utf-8?B?VE81NDVaR3VqOFE3eFk3VmNUaVdwSndXT2k1NzNabzZYMzRzT21haStTall1?=
 =?utf-8?B?K1h0NUpKNzJlRHVHeVRtcnVGT3g0RmtBdTZEc0U0NE1OR0Z1QXpqY1JCMnBw?=
 =?utf-8?B?Mm93aFIwcGlBc1hhSDlUcDhGalVwTzRHbERtWnlITmlVVDBOK2ZVc3htQWRp?=
 =?utf-8?B?Uktyak9xcWFBUEQ1UVZFdXY4R2JUZUs1TEExRk42WFNSUHljS2k3Zk5SbXZo?=
 =?utf-8?B?bVVGeUVzZHlHZlg3VkxPRHRSL0lCaHE1ZzNLMTNLYkplTTNTbmljOUlZdUE1?=
 =?utf-8?B?K2srV0s1TTVjOGh2SlJuV3lCUWFtL2swSEFGMjN1Y2k1VTZkR0o1dFBDNmFu?=
 =?utf-8?B?UFNua2dhNm83OEo4TjJuTm4rUTc5Q1FPZTIrb213SUh2cDlzUk92UzdrcFZI?=
 =?utf-8?B?SlNZOFI3QytHMVJNMStWNmR6dVI5dyszUk1vNGJrVm9UNFBnZTcxdDY5NEVQ?=
 =?utf-8?B?eXo0dCtnSDZFYUVMT21tdkFTNDBtYUI5OUtBT3gzYnlMbmRndy80OUFkbFR2?=
 =?utf-8?Q?UXPlx9G/AWmZ7UMc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83A6001997E68247AFCF432734B166A3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DEOv59VplvcsCdPrVQ2LXXsO1inkmHR1Pk0AggC1ImmN6DJsZAFbltXvLb29qlOxoKlWxN9f8arwpn1INfgAm7PzeCZCHMJp9ot5HflHJjO38dUHYL+rMIEjbZoBpPB6kvKrxEiTq3nXr7M6Nl7u0InLy7hOLanAXrTr69KNKENpBUZ9XBMb/Rw0wISwXGUlyp583UvJMtdIcL/dga6SoEJCFOx+SLuq/6PWEMGSBzAciBmExSwZgAzkee409sEF85bmbHQ7i6oNmTf7nlfHkf3kCalxUHoJ5P3ou2dCH1l8LgzG3kJPec7cZWKvJbkTaH2nnApltrsEEy2fWlBIsg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85882ec-edfc-43fb-1a50-08dec6743ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 22:12:47.2557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3EAWvyTtGQ37bjb7pcvlSZ03LpcWbFvxjqL7mkelhJbh+fjJ+zzpNd+kaL8Dc3IqV0xWvR888muj1EYHmIlbvzfYP5KIqMz/8NRoGSSvKag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
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

T24gVHVlLCAyMDI2LTA2LTA5IGF0IDIzOjI5ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDYvOS8yMDI2IDk6MzggUE0sIFN1bW1lcnMsIFN0dWFydCB3cm90ZToN
Cj4gPiBPbiBTYXQsIDIwMjYtMDYtMDYgYXQgMTM6MTggKzAyMDAsIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gT24gNi82LzIwMjYgMToyMSBBTSwg
U3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+ID4gPiBGb3IgZW5naW5lLXNwZWNpZmljLCBt
ZW1vcnktYmFzZWQgaW50ZXJydXB0cywgaGFyZHdhcmUgd2lsbA0KPiA+ID4gPiA+ID4gbm90DQo+
ID4gPiA+ID4gPiA+ID4gZmlsbCBpbg0KPiA+ID4gPiA+ID4gdGhlIHNvdXJjZSBhbmQgc3RhdHVz
IG9mZnNldHMsIGFzc3VtaW5nIHRoYXQgc29mdHdhcmUgd2lsbA0KPiA+ID4gPiA+ID4gdXRpbGl6
ZSA+ID4gdGhlDQo+ID4gPiA+ID4gPiB2ZWN0b3IgSUQgdG8gZGV0ZXJtaW5lIHRoZSBkZXN0aW5h
dGlvbiBmb3IgYSBwYXJ0aWN1bGFyDQo+ID4gPiA+ID4gPiBpbnRlcnJ1cHQuDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IEd1QyBhbmQgVkYgYmFzZWQgaW50ZXJydXB0cyBhcmUgc3RpbGwgaGFu
ZGxlZCB0aGUgc2FtZSAtDQo+ID4gPiA+ID4gPiBleHBsaWNpdGx5DQo+ID4gPiA+ID4gPiBjaGVj
a2luZyB0aGVzZSBvZmZzZXRzLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBCc3BlYzogNjIz
MTYNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gbm8gZW1wdHkgbGluZXMgaGVyZQ0K
PiA+IA0KPiA+IElzIHRoYXQgYSBydWxlPyBJIHRob3VnaHQgd2Ugd2FudGVkIHRoZSBibGFuayBs
aW5lIGJldHdlZW4gdGhlDQo+ID4gY29tbWl0DQo+ID4gYm9keSBhbmQgdGhlIHNpZ25hdHVyZXM/
DQo+IA0KPiB0cnVlDQo+IHdlIGRvIHdhbnQgYmxhbmsgbGluZSBiZXR3ZWVuIGJvZHkgYW5kIHRh
Z3MNCj4gYnV0IEJzcGVjOiBpcyBhbHNvIGEgdGFnLCBub3QgcGFydCBvZiB0aGUgYm9keQ0KPiBh
bmQgd2UgZG9uJ3Qgd2FudCBibGFuayBsaW5lcyBiZXR3ZWVuIHRhZ3MNCg0KQWggSSBzZWUgYW5k
IGxvb2tpbmcgdGhyb3VnaCB0aGUgY29tbWl0IGhpc3RvcnkgdGhpcyBpcyB0aGUgbW9yZSBjb21t
b24NCndheSB0byBkbyB0aGlzLi4uIE9rIGxldCBtZSBnbyBiYWNrIGFuZCBtYWtlIHN1cmUgYWxs
IG15IHBhdGNoZXMgYWRoZXJlDQp0byB0aGlzLiBJJ2xsIGhhdmUgdGhpcyBpbiB0aGUgbmV4dCBw
YXRjaCBwb3N0Lg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gPiANCj4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+
ID4gPiA+ID4gPiBBc3Npc3RlZC1ieTogQ29waWxvdDpjbGF1ZGUtc29ubmV0LTQuNg0KPiA+ID4g
PiA+ID4gLS0tDQoNCg==
