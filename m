Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D18C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C42D10FB06;
	Fri,  4 Sep 2026 12:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsgkcbcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1F810FB06;
 Fri,  4 Sep 2026 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788523938; x=1820059938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1H+B2Z0lraGtxV5kU31HylXWg1phJOVnXLbWdBIUvyU=;
 b=nsgkcbcGf432mriOr1S0PoyAce3yFYzOK2VlVnaHfj6eELrzTtC4I3JY
 w+OPP8TZyycuaN+rXuU+Vxk1seerj8JUPxBikjfGHP4Bp0RvP/DUQdZWF
 sspo/CfwE0OSJlsoWp+0bVgbBgEmvBBtOzAbzTgnlY9Op8Q/9vTOjDdSn
 aXBedt53qMMuL2C9lmBIdNuT/N9xD657pl8uJbtra51DOiJSZSZtR22pC
 bWQkBeFVfcSMW0hue8OgXD8HCLWdYYGCj066O5xGgHSU93c5vHa4HoEAi
 uAvvznXjNIUF9uu6lB9KTcOOX6sjt8m+1x5mmrrzKsKoPeXFZeuB+VbWG w==;
X-CSE-ConnectionGUID: yEMUFCIrT0qN5CeIqihDKQ==
X-CSE-MsgGUID: Ju58bWp2QyK9aThEFOfMbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88165788"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="88165788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:12:17 -0700
X-CSE-ConnectionGUID: AuB/wcWeTwm2LsXMdfCujg==
X-CSE-MsgGUID: kIUzxnj7RlugN52Y2rnwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="294906935"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:12:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:12:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 05:12:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is5z91BPUsJjKuGBmPoYmqmnGupEnA9bESTfN8454zLM7l0/atZN6ziHFuYJJFDMfEOv6HOQv9VGzfFG8Zo7TjFylfDXPHb7a+dYvkcsZTIn/lPT5XXirJtkNh0aWrMPiGP+ABqSXvCs8pNvOCMlCh7gaDgGe52b2wwrR+MHVLj694IFKi4G8K2B6e2lbJZvH3YgCA9NTzQsH1Xf2f8nRQ9uFn1Fat/WEiHRTgserMRCscxnxgPPBCMbb05B7Pr22mAHcbOBm9hX2NkjVpkmURy04ITux7WOhgf2NDIrNZUa3ag8oUnwLeHDKaZUqZgds8/riZ+Mi7BbctDY4x6VXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H+B2Z0lraGtxV5kU31HylXWg1phJOVnXLbWdBIUvyU=;
 b=No4Yra2SVTGa8DEZqoMLmUSlScnA4RBBvQQv77KO0ZDujkr9L6E0N3jGUDfr/ELgmYrotiZZvnh3ZHfuOzy5fxBrzJog6FT3C4+uU1zH/4QmD90UvHUy1KjsGktcMzTcGlHkpWUUre+DQ0cYRMuWOs1iHbzsGJFCDWMrnWlBNRSa8HK4ZmAF8lUgOpP3s7J7asPnFZpMpAYY0XKhGijyTsQa49yf7q744U5L7zK8+ppkAzlqlKsenk2zAD7sZS3v5szAMFQLbxlRXsGw7jGnMW5GQ+WsptYH0ZOvJsWkqhj97KEuiGanKdhR8bCoaVreUBNxAaIBCSkbx4no92NVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by LVUPR11MB9785.namprd11.prod.outlook.com (2603:10b6:408:39c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:12:10 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:12:09 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: Re: [PATCH v2 3/5] drm/i915/irq: conditional HPD IRQ resets based on
 PME capability
Thread-Topic: [PATCH v2 3/5] drm/i915/irq: conditional HPD IRQ resets based on
 PME capability
Thread-Index: AQHdO3sEsBGy4cQZK02xjP+DJU53qLa+MHwAgAAlxAA=
Date: Fri, 4 Sep 2026 12:12:09 +0000
Message-ID: <e305f861017d4387e874f28bedc55791af960b79.camel@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-4-vinod.govindapillai@intel.com>
 <37c640934163bd6849303500f4e7662e49b4d784@intel.com>
In-Reply-To: <37c640934163bd6849303500f4e7662e49b4d784@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|LVUPR11MB9785:EE_
x-ms-office365-filtering-correlation-id: 1145f05f-6847-40b4-3c6f-08df0a7dbebc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|10070799003|366016|38070700021|4143699003|11063799006|5023799004|10067099003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: /8i7KTSKCdZ3CW0m0qG9iku/uB8AijY9E/CbV+xKztDnp4OY5V3lJwvu+eDtdTKZHE8FCjN/OLOyPD1LR90z4f+KljxkFSroBl43uV43dfyqSwP5C/AY5KQniIuif9r/hbGVGRKqdePcBSjfLqCG3MLnkc/sCrXwS2Kx22jn6D56hhYYUCjD+Atj3fsUatl7/6Ovs7fKeC9rdFT7TQ1eyFPzm+KZmOReVxtY1Ek5EGKzVeWHF26EFG9KUek0SH8DGr6+ZmtxT4OYm1jXKYiBVGmWkOZx1BDJvcYSqqbJVEt1OvLTpAHLu2m7eF/BRYePVxW8CtRvJGSCibxJJV5+rwswpbNQVE7T+oLHnSavI4W7q9Mkw5Fsy6Xwra6TgLxMCj8+86Ht2QeOWxtC21PMH0hUZ/vxdfkIlqa837ba+aFOSiDpiOQIdKKk2+qiAH6w5OMe7eo2PJDWUzi8kf/tjGRl+ldTiu3yoLs21mDEV9Rj4JSTfZFbOZ9TsgYNxP+BQ4Dx81dV4xmvJPfEcwArMs+Iiw1c602sutLw4/ECxBeyFOTYAvMyaUFj+OldrbZTWxawZ+ui78bWDDJABQmY780jXPFfPAJiaNwKpIb3+iN/dXuDvhz1buct9dHQC+jP2EzjiUlFpna5bcdnNbXcLSYsqmLQBhLICbrqVbtBhoauq0TGeWWeX8dojzoetZXHEOZwasAgPm+u4YWrzpQ8uAeMrSigpaY/8ev2QEGj3gY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(38070700021)(4143699003)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2hHQXdXTzc1eGlRa0JqbHdXajlyT2dVM3Zjdm1xQmlOM2puZFJDb0NWR1c4?=
 =?utf-8?B?TmZrS3VlQzNwVDBDV2JwbzVVSExRVFJZcGpQZXE3RndRVzdlK3NlVEd1UFZF?=
 =?utf-8?B?QnFCWnpoRXhicVB4a283Z3BoQUFiWHNkaGVqVk5wQUVwaWg0aWtpdzllRXJL?=
 =?utf-8?B?ZWx0Z1BkUHA4N01rV21YZDRTdE1kVXYrWmtDckNvRmRweGhtdXZLVU9tQ091?=
 =?utf-8?B?NDR0MzltaFRIK0twdmx5WnBPWTNVTXhPL0dEZEhibUQzdjI1MmxsbHBUanJw?=
 =?utf-8?B?R1V4RjA2SnRGVjBJLzFMeVNUemw1REcyNGRoaDBHWk9UTVZEQTVzbFlTRWhz?=
 =?utf-8?B?cWxLbjl5RFFEeTdzODR1QzNFUWlUN0hHYVdRM2ZnMHR6cDRxTVlUdHpUK1NP?=
 =?utf-8?B?NUJJZUpHOFdsd3lHMlVFKzFINllMUExKUnV0TkdJUDVNK1ZYMWxDR0RKd0FT?=
 =?utf-8?B?REd2eUduWXRmWDlpc0NuWkJpVVdNRUx0R3RqVmdiN3FDQi9CZkF5UkZEdmdP?=
 =?utf-8?B?UWExZjROc3NRTlJHbVFiOWVWNlNLYXQycVMvWGFpN0R2ME9pZHlNNkpvQldQ?=
 =?utf-8?B?bzJMMTdoQ0VoMVlLYnU1U1FuREtDeXJ2YnZFekNuN1lQVDhCc0o1cVZpaFZa?=
 =?utf-8?B?eHI1aEZpTEF1ZGpkYWdzWkxaampYd3RGOVVpcndYTHp5dmh1ek1obWRBb0Ja?=
 =?utf-8?B?dG5JMzdWWFdEb2FzRWE0UmFZeGpZclgxSmZZbDBJSFp4RW4ySFgvejZlNnc3?=
 =?utf-8?B?Wkp3TWc3ZmxTZHlBbVdpODNlNkpGUERjclZtQnoxQy9ndXhlQkFVTTZhRnhI?=
 =?utf-8?B?d2pFNDYwVTVUVEthaHZORmJ1cktTRHdnb3lwMVk4RXRUSVhtV2h3eU4xOVJN?=
 =?utf-8?B?Rnl1ZmNIbDZXMkFVQTRkRHZYOTQ2ZXd2TjM3L25OQjJGcEl6d3g1SFFiZU1G?=
 =?utf-8?B?MXdWQldwTVJkZ3dhTThzQ0xnZnE3NkMwRFpxd0QwVm5SZkQwVTh5K29Kc2gw?=
 =?utf-8?B?bk5iKy85WlpEa091ZWlid2wzYVFkQTg5Tk9CeFF5ampnc2JDaVhDUlFKcFFZ?=
 =?utf-8?B?aURPbWM1ZDk5MUh6MkE3QXZVRzhvRVUvQjluc0NveVNsVkduWnJ5VUpVMFlw?=
 =?utf-8?B?M2ZXM0hxN2Z2VFRXd1RrK0czK3JYVFM1R1FHRWJYdm56TmpsSDArS3FMWjVT?=
 =?utf-8?B?RTY2OE5mQzkxazh6bU1PWC95b2lzaFU2MVVzbFpmeGk5MUVSdGFRRnJOTWRB?=
 =?utf-8?B?MVJIUmdmalNNSzlJWWlOZUVBSjg1Wmc3UmdBMzRqRllzQ2U0QTloOGNNSDlk?=
 =?utf-8?B?TFRyOWdja2ZaTFZYSkVnbkxJNnIrbVR5Tm8rVjRtMmhveWRYTTh2d2JpWVIv?=
 =?utf-8?B?WEoyd1RxWFNhTnozL3cyWkg3M2J1YUVqalh5MlVqbTRSUUU2NGtMVTlnUWp3?=
 =?utf-8?B?cUtmMGFZb3A3bjJDVjNXblNPeXRLK2Rra1c4L1FVb3IyNzIvYTlVVEFKQWFk?=
 =?utf-8?B?Y0xLVWxLNHNyTHVRL0lKWDF4c3RuRk1TOXc1bGc1Y3JadDRMT2R4amY4cEJE?=
 =?utf-8?B?SDd2M1llZnMyTWRzRTU2Q2Z2Nm5iM01Pb2dhQ29iQjJ5QWtPaFJPYW9EMWdT?=
 =?utf-8?B?T2d5SFpMajRXb3JqcnkzdVZLSEIxVHRIZGpzTHR5b3VpSVpkc3VtRGQxcHNz?=
 =?utf-8?B?QnA1MHB2akdnN21aaUlsYjd5REtzQmlMSCtTNXZnZTQwN1hLQTRYUzVqcksr?=
 =?utf-8?B?UDZ1dEo5SitURHE3YVgyNys0QjNKVStCU3FGby9aUkR1c1Z2WkNQbmlHSngy?=
 =?utf-8?B?bTkrOVNrVisyck5LN2EwRysxRFJTV0RKOGRPdE0vbkJ0VTUxREFKdTNLL1Jv?=
 =?utf-8?B?R1VFZXIxWHRUYkhFRWZ2UVBUTk1RT0wvNTZPT2tnYVlNOVRpQzF3aXMzWlZo?=
 =?utf-8?B?Vkpic3hSbDNodHd0S1VkUVlNY3h0ZHVFUTdMTW45b2c3RUN2d2xjSlIySnh0?=
 =?utf-8?B?a1hYNmZUdzlLcHRWSVd3VFFNMDFsYk00aUxSdTBJTldRMzU0VExUTjE3Vi9W?=
 =?utf-8?B?VG9zOHVHMEhOTXdaL2xvd0k3Q21DTDVQSDk0Qkhha1FPbGZSVmtLZzJISk03?=
 =?utf-8?B?ek9WcVlLa1crU1VycFRoR1M5cFBMY3NndTZSNDNFUit1dkEyUXVaa1BFNlE2?=
 =?utf-8?B?Q0JEZ0UvaWd5N0xEU3BFOWh0bng1bE5SV0JhR3RZUnFUaGlwSXU3L2NUbUJO?=
 =?utf-8?B?RTNlS015NGE4SXVhdVB5ZHYvcmZBc0Zabnk4czBOU1lEakJSVm5DVDhVNDMr?=
 =?utf-8?B?V05FalNTc1hDdmZOSUlCTlFZdlE0b3QvWWpOalM3MThsdWdYQktXZ3c0cUVS?=
 =?utf-8?Q?Y9vm0BHxd6jr802StSTNb2lIynHeIA/i/M0t6aBI9/GWI?=
x-ms-exchange-antispam-messagedata-1: qEqsdLBn8BDSs4eGy4kNdlF4qOjlWpW6fhY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE6E5FCACBE0B2448DB0FFC8C3BC3D71@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g+efws3WFa7WLWkdaNeToTuzmuR+Jxq8IVOjO7M8UT5pgSj/Sjyo/H6U4EuVjbULytGrkyJiWzMccY+pQWgufDu6MB4cZ1qowQKFUcrn2mQkp8/DKQBPsZ/Y1r9TUyoK6v6+gieNaXlIzVfef/MTFzwYFnlFuM2kaz7sJ9VZgnoFa8lQBRev4o3ZfwHN8znZlmzc3HNDH/gKDkqi/Rk3hqWu7AgLxYfDf75meng+bYxXsrHUb0GRRzirD3LQfybyC09uzHTgpH0BOv0575k3F9QGFxjrQAiIume9ZrN2kCjIyK6xLt2ZPQgjwl9maa4mQr9v0VuUkMAxNXca/GdC7Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1145f05f-6847-40b4-3c6f-08df0a7dbebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 12:12:09.6487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Br3xUOwhGzoBKE7s/dJYyiwRjg77KvCojt6w6C954HbWiVrA0FndC3BUTFVyjZz0MSuYKZGNWzKKadDA6PMsjBao+7DrtihlvRbBDHNfOf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9785
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

T24gRnJpLCAyMDI2LTA5LTA0IGF0IDEyOjU2ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVGh1LCAwMyBTZXAgMjAyNiwgVmlub2QgR292aW5kYXBpbGxhaQ0KPiA8dmlub2QuZ292aW5k
YXBpbGxhaUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IElmIGEgZGV2aWNlIHN1cHBvcnRzIGdlbmVy
YXRpbmcgUE1FIGZyb20gSFBEcywgcmVzZXR0aW5nIEhQRCBJUlFzDQo+ID4gd2lsbCBiZSBjb3Vu
dGVyIHByb2R1Y3RpdmUgYXMgSFBEcyBpdHNlbGYgd2lsbCBiZSBsb3N0LiBEdXJpbmcNCj4gPiBz
dXNwZW5kIHJvdXRpbmVzLCBhbGwgdGhlIElSUXMgYXJlIHJlc2V0LiBTbyBpZiB0aGUgZGV2aWNl
IGlzDQo+ID4gY2FwYWJsZSBvZiBnZW5lcmF0aW5nIFBNRSByb20gSFBEcywga2VlcCB0aGUgSFBE
IHJlbGF0ZWQgSVJRcyBmcm9tDQo+ID4gcmVzZXQgYmFzZWQgb24gdGhlIFBNRSBjYXBhYmlsaXR5
IG9mIHRoZSBkZXZpY2Ugb24gYSB0YXJnZXQgcG93ZXINCj4gPiBzdGF0ZS4gUE1FIGNhcGFiaWxp
dHkgd2lsbCBiZSBhc3Nlc3NlZCBhbmQgdXBkYXRlZCBzZXBhcmF0ZWx5Lg0KPiA+IA0KPiA+IEJz
cGVjOiA1Mjk3OSwgNTI5ODAsIDY4ODU3LCA2ODg2NywgNjg5NzANCj4gPiBBc3Npc3RlZC1ieTog
R2l0SHViX0NvcGlsb3Q6Y2xhdWRlLW9wdXMtNQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbm9kIEdv
dmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfaXJxLmPCoCB8IDIwICsr
KysrKysrKysrKy0tLQ0KPiA+IC0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfaXJxLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiA+IGluZGV4IGE1OWI3NTgz
MGJkMS4uZmM1MGIxOWQ1ZGRmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiA+IEBAIC0yMiw2ICsyMiw3IEBADQo+
ID4gwqAjaW5jbHVkZSAiaW50ZWxfZmRpX3JlZ3MuaCINCj4gPiDCoCNpbmNsdWRlICJpbnRlbF9m
aWZvX3VuZGVycnVuLmgiDQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfZ21idXMuaCINCj4gPiArI2lu
Y2x1ZGUgImludGVsX2hvdHBsdWcuaCINCj4gPiDCoCNpbmNsdWRlICJpbnRlbF9ob3RwbHVnX2ly
cS5oIg0KPiA+IMKgI2luY2x1ZGUgImludGVsX2xwZV9hdWRpby5oIg0KPiA+IMKgI2luY2x1ZGUg
ImludGVsX3BhcmVudC5oIg0KPiA+IEBAIC0yMjE3LDggKzIyMTgsMTEgQEAgc3RhdGljIHZvaWQg
Z2VuMTFfZGlzcGxheV9pcnFfcmVzZXQoc3RydWN0DQo+ID4gaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSkNCj4gPiDCoAllbnVtIHBpcGUgcGlwZTsNCj4gPiDCoAl1MzIgdHJhbnNfbWFzayA9IEJJVChU
UkFOU0NPREVSX0EpIHwgQklUKFRSQU5TQ09ERVJfQikgfA0KPiA+IMKgCQlCSVQoVFJBTlNDT0RF
Ul9DKSB8IEJJVChUUkFOU0NPREVSX0QpOw0KPiA+ICsJLyogSWYgSFBEIGNhbiBnZW5lcmF0ZSBQ
TUUsIHdlIGRvbid0IHdhbnQgdG8gcmVzZXQgSFBEDQo+ID4gcmVsYXRlZCBJUlFzICovDQo+IA0K
PiBQbGVhc2UgZG9uJ3QgYWRkIGNvbW1lbnRzIGluIHRoZSBtaWRkbGUgb2YgdGhlIGRlY2xhcmF0
aW9ucy4gSU1PIGl0J3MNCj4gYQ0KPiBkaXN0cmFjdGlvbiByYXRoZXIgdGhhbiBoZWxwZnVsLg0K
DQpBY2suIEZvcmdvdCB0byByZW1vdmUgdGhhdCENCg0KDQo+IA0KPiBUbyBiZSBmYWlyLCBvbmUg
Y29tbWVudCBsaWtlIHRoaXMgaGVyZSBvciB0aGVyZSB3b3VsZCBiZSBmaW5lLCBidXQgaXQNCj4g
dGFrZXMgb25seSBhIGZldyB0byBzZXQgYW4gZXhhbXBsZSBib3RoIGZvciBodW1hbnMgYW5kIHRo
ZSBsYW5ndWFnZQ0KPiBtb2RlbHMgdG8gc3RhcnQgbGl0dGVyaW5nIHRoZSBkZWNsYXJhdGlvbnMg
d2l0aCBjb21tZW50cywgYW5kIEkgZG9uJ3QNCj4gd2FudCB0aGF0Lg0KPiANCj4gPiArCWJvb2wg
a2VlcF9ocGQgPSBpbnRlbF9ocGRfY2FuX2dlbmVyYXRlX3BtZShkaXNwbGF5KTsNCj4gDQo+IAli
b29sIHJlc2V0X2hwZCA9ICFpbnRlbF9ocGRfY2FuX2dlbmVyYXRlX3BtZShkaXNwbGF5KTsNCj4g
DQo+IElNTyB0aGlzIHdvdWxkIGJlIG1vcmUgY2xlYXIuDQoNCk9rYXkuIFdpbGwgdXBkYXRlLg0K
DQpCUg0Kdmlub2QNCg0KPiANCj4gPiAtCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIEdFTjExX0RJ
U1BMQVlfSU5UX0NUTCwgMCk7DQo+ID4gKwlpZiAoIWtlZXBfaHBkKQ0KPiA+ICsJCWludGVsX2Rl
X3dyaXRlKGRpc3BsYXksIEdFTjExX0RJU1BMQVlfSU5UX0NUTCwgMCk7DQo+ID4gwqANCj4gPiDC
oAlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTIpIHsNCj4gPiDCoAkJZW51bSB0cmFuc2Nv
ZGVyIHRyYW5zOw0KPiA+IEBAIC0yMjUwLDEzICsyMjU0LDE1IEBAIHN0YXRpYyB2b2lkIGdlbjEx
X2Rpc3BsYXlfaXJxX3Jlc2V0KHN0cnVjdA0KPiA+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+
ID4gwqAJaXJxX3Jlc2V0KGRpc3BsYXksIEdFTjhfREVfUE9SVF9JUlFfUkVHUyk7DQo+ID4gwqAJ
aXJxX3Jlc2V0KGRpc3BsYXksIEdFTjhfREVfTUlTQ19JUlFfUkVHUyk7DQo+ID4gwqANCj4gPiAt
CWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAxNCkNCj4gPiAtCQlpcnFfcmVzZXQoZGlzcGxh
eSwgUElDQUlOVEVSUlVQVF9JUlFfUkVHUyk7DQo+ID4gLQllbHNlDQo+ID4gLQkJaXJxX3Jlc2V0
KGRpc3BsYXksIEdFTjExX0RFX0hQRF9JUlFfUkVHUyk7DQo+ID4gKwlpZiAoIWtlZXBfaHBkKSB7
DQo+ID4gKwkJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDE0KQ0KPiA+ICsJCQlpcnFfcmVz
ZXQoZGlzcGxheSwNCj4gPiBQSUNBSU5URVJSVVBUX0lSUV9SRUdTKTsNCj4gPiArCQllbHNlDQo+
ID4gKwkJCWlycV9yZXNldChkaXNwbGF5LCBHRU4xMV9ERV9IUERfSVJRX1JFR1MpOw0KPiA+IMKg
DQo+ID4gLQlpZiAoSU5URUxfUENIX1RZUEUoZGlzcGxheSkgPj0gUENIX0lDUCkNCj4gPiAtCQlp
cnFfcmVzZXQoZGlzcGxheSwgU0RFX0lSUV9SRUdTKTsNCj4gPiArCQlpZiAoSU5URUxfUENIX1RZ
UEUoZGlzcGxheSkgPj0gUENIX0lDUCkNCj4gPiArCQkJaXJxX3Jlc2V0KGRpc3BsYXksIFNERV9J
UlFfUkVHUyk7DQo+ID4gKwl9DQo+ID4gwqB9DQo+ID4gwqANCj4gPiDCoHZvaWQgZ2VuOF9pcnFf
cG93ZXJfd2VsbF9wb3N0X2VuYWJsZShzdHJ1Y3QgaW50ZWxfZGlzcGxheQ0KPiA+ICpkaXNwbGF5
LA0KPiANCg0K
