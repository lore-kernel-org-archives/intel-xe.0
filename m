Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80945CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 18:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433BD10E962;
	Fri,  3 Oct 2025 18:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZZynbkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1E710E962
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 18:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759517602; x=1791053602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oPv6QGzBe9rCf3+JKNeL9ih1lEyv33YkmgV33OlTxQQ=;
 b=nZZynbkgdYh9/KEOlQFhfuItJWA2qcL0oC0ZSITsOWCsAVdxiauyhXa+
 USCLpXk+AroiABt3fx+XDzh7PeXrZhXaCU+WljDod2O10FAnPFjem24xU
 5C/2c32oLt7+nEE8k7NcTyNFT8oVfkRmP4zFK7KBWV0KHPgBZpnYoZFqd
 9D00rpIfvZ8RRnkd1lsJu4K2EHycQssfkJrulNaFE0OBrXMeVMPACZZch
 6MF4ynOu8uElR5+1OIyqxjd6MAjVX60j1gLSyDniLubPqoupYsCC6Pf4W
 kYGqSUYRBJz+6x385NQIC8ABgj6ctnpGaRE+F1YzOY2brW4zsbksL4Drl Q==;
X-CSE-ConnectionGUID: faat6vRqR1uPo+9BJvwnfA==
X-CSE-MsgGUID: Iqjdov3hRR61f8puzG3S+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64418479"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="64418479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:53:21 -0700
X-CSE-ConnectionGUID: lUy1jWeITIGKeZmgY7fL7w==
X-CSE-MsgGUID: apSxFvRFT82+6Dn4iShBkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183633046"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:53:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:53:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 11:53:19 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NT+5PFsLQjbMSeP84Mp7ACN66+MJImrwYVwAuZbQovuLMCll4Soi2bOHpm6z8AlraBSM8ce4JCpwRVgWJIll/Xm8LbMMUAsY8RjA8WFGtx+rDN5fBSEzzDg3faRcQwtGeb7OOEHR0/68+17hd9jtrCSZrDJxNTxYxTQmILgEAaZCGrU5nNMDW5dtjcqO3/A1AMCfgAV74AiNeC+9I/Zzfee9Jo7y+3c4xonoQwsFRRHfsIWA0NE3R+Vn/KwlSz5YeuJ3HdP3A3zYMdHrR1GaZSpCehPOkRLQFKADpPv8xVyguUbVibjnJ7SCtKFGDW+3BrI1VQ3qkAMa7wQiK19zBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPv6QGzBe9rCf3+JKNeL9ih1lEyv33YkmgV33OlTxQQ=;
 b=g8+N+Jy3wjQynETg6FuVTatDOSWZnVG6Xt6tNfZ/VYnQtWCMDlNv5qoARDlG0NrSL3jSWZ3HdXPYRh0AumyAHnxG0t8GWnNmVgx87ZEkgn+L/W+GlwAbzhhwsLqhdjWJoqf7GfrHaGFwdKToHCJgXZlmkZ4l1Faa0+k4PMq1KFPEoKPJRYA92qTKHGsdEfBe1QkgxgyfGq5MS/tkx8USWmXZoPjBvGffn+4s/Pn4YGIGXRm7UUHpnUqKYSkwBgWuNomJy6FdeAG/6PYRjn0rgFnH5UCddxQhCO8+oreAApgS/K10KRUg9hwojzSsdYtjdOER5UmzclVoD2CeXiW5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV4PR11MB9515.namprd11.prod.outlook.com (2603:10b6:408:2e3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Fri, 3 Oct 2025 18:53:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 18:53:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't send a CLEANUP message on sched pause
Thread-Topic: [PATCH 6/7] drm/xe: Don't send a CLEANUP message on sched pause
Thread-Index: AQHcM/D5JhJkdBbz7kS1q78OLKM3aLSwxUaAgAAAzAA=
Date: Fri, 3 Oct 2025 18:53:17 +0000
Message-ID: <f2091115508ba9b1a160d990cddeff9d34edf7d3.camel@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-7-stuart.summers@intel.com>
 <aOAa8WLaXuvO94eu@lstrano-desk.jf.intel.com>
In-Reply-To: <aOAa8WLaXuvO94eu@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV4PR11MB9515:EE_
x-ms-office365-filtering-correlation-id: 29a8b368-f1df-4625-359d-08de02ae1db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RlQxdTRSSTlQWW5QQitQN1drYndLUXdQc3Q5MVhiZXY4ZENUSFJFd3J3cm5s?=
 =?utf-8?B?SFhsTGZGMXRCOWZHdkVrR1RnZXVOaEpwOXV1LzFXSzg5NmRHS25Qekh2cFND?=
 =?utf-8?B?VzNMbFZmZnZpa3NCTEZ4M0dubnVwWFVhbGZoK2ZMbE5YOUNMUmFxSlBvQlkx?=
 =?utf-8?B?dmRpQTViLzl5bmE0eUNlUWpoOXplREdyK0x6SnpEcG1kZW1zOGQvNUN5cUdV?=
 =?utf-8?B?d0x4cE9nT3hFNlRlMUgzV25qY0Q1M3FjTnhwdUV6dW1Jc29PS2VUVWUzVU1U?=
 =?utf-8?B?TWx6aDJPb2kzdW9FZFBVenJVb1htZzNrbWlVOW13TXZIcFRuS1FwczZFQ1pU?=
 =?utf-8?B?UTVHUWtYQkwxTnMwL01lcGFrN0EwaXFqQy9tY1Rmek9mazk2NDQyNTY2WUlV?=
 =?utf-8?B?dm9VZGtRcWMwbVhSYTVsNDdIVmYzeEkyZXEySm03RHQxTUhnck10blBYbmNt?=
 =?utf-8?B?amRCQlBIOGN5T050NVRoY21QUlZJbUV5MG1WelQxbnBudWlvR1VwNGlONFlF?=
 =?utf-8?B?WEFtTFQ4TFlCeVlLTFBwMTJtMExVQzRwc1I3WHRaUkREQ3N4ZWtqYmVGZFdv?=
 =?utf-8?B?YkRsYktQVVFGZ1hSSEUyRkVEM3dPWWpySFBnSUw0cW9IL2tVLzNpYkJsS1Y3?=
 =?utf-8?B?bytsUml2OFlaMlZpMVZZRzB0dERSZCsrNS9xVnZJZllrTVV6bHFSOGM1eUR6?=
 =?utf-8?B?TzZOM3UxblA2YlQzMnNnN0ZSWTY1OVluamNpZndFa1YwOGNsaURjQ08xL0Ft?=
 =?utf-8?B?Ympkcld5Z2MvUWpaTUF0amM1Q04vNWVPRnhINXpOSjZZWFlzbVk4RksvWlB3?=
 =?utf-8?B?SDBoUUdjMkVkM1hwZVdsaW5SWVpBN25aMFB5d2JnVUZIRzA2WXIySkp5S3pV?=
 =?utf-8?B?eHV5SHJDMDcyYllkeVdxeGpsdXVMM21Cdnh4S0JqK3FYZUFJMFl5bmlyYVB6?=
 =?utf-8?B?a2VETXZaUkY2bWRSdHhRRG1yWEZzVUdGdE9IUkhlMGgrbHNGMmY4Y1p1VTd0?=
 =?utf-8?B?OU5WbHFjL2d1M3lCUnFlZ1MrKzJGbFowNUxWNXUwTDNSNEUrblEvaEdjT3pm?=
 =?utf-8?B?bk9Ec0Y4N1RxZzRMbCtWWDExOWl2ZEpIU0duYWVVbFJtYzQ1QjdlM0NzUGZT?=
 =?utf-8?B?N3IwOFl6Wmtrck80MkVCeVdjUzBGbFVPNmQxeVo3enZjbm9xNXlRaU1PK1dk?=
 =?utf-8?B?YjhjQlhJTkVlaXRYT05yTWladFoydmVXeXNiNlpQWU5wRitPV1FmTE1rTkM5?=
 =?utf-8?B?ekJoS1locGw4VTFFSGpmZml5Z0pNcG5XUVN4MnlBYU1lRGpvVDQ3WW80cGxB?=
 =?utf-8?B?RFJCb2hlRVhBYTNpS3h3LzJwQnB6VE9xWGJCcUxTYnkrYUgrUmE1WU1QNWdh?=
 =?utf-8?B?eVEwblVnV1dXclFrdFNpWFJaZHVnbzVUQnJaMDhYbHlWM2I5cmN1VU1OUHl4?=
 =?utf-8?B?RkJZRmg3U2FXbW0xeWFMVDFDM1dtSGlwS09JSzJlOGkzV3NwVFlvellobWlx?=
 =?utf-8?B?ZC85N1h0enpnQnc4c1VZVjBJcVRnNEVtOXpSZFlvNDB6SXlYamY2ZGtJTWxW?=
 =?utf-8?B?dHUwOFRBS1NtWlgvWlhSN3ZpZ2Y0Z2dIOU5hVjRCS0FrUjZKR3pPTzN5SEgv?=
 =?utf-8?B?dnJ3TDZHRWtRU3NocGJlcG5LNWVyN24wK3JhSjVGeXA3elljMklKL3dFamJB?=
 =?utf-8?B?Q0hsZzQ3KzVCSlpMdFdqSEJGNWx4dW5Ea1Y1TklSTksyaC8zT2hYZUZrT0JE?=
 =?utf-8?B?YlV1Y0M0cXFER1BBRnZWdldKV2NIa1hvSjlsOGpIeFBPZUVZOVptbVJOVnRu?=
 =?utf-8?B?N0VGbGY5Nk9DTXhkZ1BaZjUyV3ZNR3g0eThrd21kdGc2ZE43R3NXUTRRTEhk?=
 =?utf-8?B?NHdqcC83UE95elcrTW55VXllTk4wK0dZNlJLNHlIczhaYTAyWHRvQVliWDJG?=
 =?utf-8?B?V25OV1lDMzVyd3hQUDdWQzFsT3JvK0pYdmE3N1FrNHF5QTFhSmV4UUZIamo1?=
 =?utf-8?B?VDMvNVlMc09iRHQyQjhLTjM0WnIyRWNWN2hqdWZCelNqSUIxU0tTbzZjc3Iz?=
 =?utf-8?Q?wJzbua?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTE0TEQ0aHRBR3dOS0lxbTVUQkcwZ0VERmZ6RHBma3d4MW03MG4xZTB5WnJj?=
 =?utf-8?B?QkpwMTEvaGo4K2htMHZ2MG54QnVId2dxWXZFM3BRR1AzVFZ1NURhTFdOQXBH?=
 =?utf-8?B?d0VBbWY1azlIZUI4enZ0TnpuYTMyZTkxa2tkemwrMXFaOVZVTFdlRE4rd3p4?=
 =?utf-8?B?K21kUFRnMVo5UjBSOTZ3R1Bmdi95dExyVndvSXp2N1RMNG4zNXN2dlBINy9k?=
 =?utf-8?B?cVZDY1NGT1JVbHBpR01uV3lMN28zRk1tUjg5ditySGxNQTMvYzdtTkliVE9n?=
 =?utf-8?B?bTA2Z2dMbWNweUhsVktTeGcxRDVzWUxpM3lzb09DY1VLQmpLWE1pYmVySEgr?=
 =?utf-8?B?ai9zSzBKNkV6YnFRZGdCUEswaDd4ekZrc0hOMHNKZHlQTk1yN09ZZW9HUEFt?=
 =?utf-8?B?N0F4Z2J0ZlkxallDeHFVL203bVZtb0gzY0xaYnhmQXIrNHQ2N2dNRlZRTldx?=
 =?utf-8?B?K3l1VmJXaEJ6cnFWVEJaQS9SK1lraExpRkJCdWN5aGdFVXVkNHd6R2Q3UEhS?=
 =?utf-8?B?Zk92TEtFSjJ5d2hSUzA5QjFGaDlXOEo2OCtLWVFLcU5MWW9SU2JFZGVuVlll?=
 =?utf-8?B?VHpKenBhUXdJR1hnMW1OZjdzZTJTS1NKQ3ZLekdWZWtlMFlhN1BiQ2dyNGxz?=
 =?utf-8?B?aVRlWUplZ2NwYURiMFpxUTdWT2lwdXhoZVphMTJwODNnZmRyOEVIbXFFMEYv?=
 =?utf-8?B?TWFlQ1h0QW5ISXMrbTd2UGZIUkk0enVJcDg0dzFXVEU1azhvRzA0S2FJS2o1?=
 =?utf-8?B?Wkw3dk9Pd3prOG1SZGk0ZnNIOEl4cjhRK0FXN1lwM1BPN1hpU3JNenpNRC9q?=
 =?utf-8?B?clRQUi9qTUdleXFQb3gwM2JDbVdaUGFtOFYyS0dIZWQ2aXNadkx6MjdURGJH?=
 =?utf-8?B?UTMvcmNaMzRrNmt3ZmhCQUROTWlQSkR5ZHFNa1YzWmVCTnlKUVBEMThxNG5K?=
 =?utf-8?B?Y0dtZXQ4cnVaMHkwL282ektrR1B1Zyt4SDM3b1ZuODVrbFlzZXZ2WXV6c0RW?=
 =?utf-8?B?VjB4N1pJZExWWFZTczZKK3E5ZGlwczFpZ0YzNWJhSDhiM0I3cEsza3REbENG?=
 =?utf-8?B?SjNQVW5OTnhlbmljMkd2bStNdE1wdHNGbEh5MGYrdDh2MEViZWFDb0x0aDFU?=
 =?utf-8?B?QS9RczkrMGhkOUpicDNUWjh5UHhwY1czSkpaYmR1K09OZERTSFZiSUpCeU1X?=
 =?utf-8?B?SEd0V0cwSzgybXd6cnVqNUtZOUdiTURSaGhabEd0bmJhSUgrZTRwVHpveHpy?=
 =?utf-8?B?NDkyaWhJN0ZJOStFaCtXZ1BXS3VXVUV5aDVrdUgydEw1bFI3N3IvUEV0NHhx?=
 =?utf-8?B?YmpURWcyV1ZxWDVlWmY4SlhiSzJLMTNzNnZ3bzN4S2pyRkxjeEZseERPYnRJ?=
 =?utf-8?B?UUtFOTdSZURyLzFUaHBlY0Z2aGZiME9hczNYUG9Ed2NKWXhDUDlJMkRUTmdh?=
 =?utf-8?B?d1BRWGZyN0swTGtxcksxbEY3M2p1WlpTbGFHTml3N2w2ak1uWVRUOE1FTk93?=
 =?utf-8?B?bGpieCt3SnVrWGVQa3JzWHRyeENzclYzRU8yTEtHMEFHSmJuVHQydmNDTndj?=
 =?utf-8?B?REVqZUZBclZHY3h1VzU5U2pUWW93aEo4Zm1KNFVmd0swdVRDSVFDOE02REJ1?=
 =?utf-8?B?YURNZnlUbnNwT0pCWVVuaEx5a2ZiakRvbVV1cEVveW1nblVxZno1amEyQ0pI?=
 =?utf-8?B?OFdSYy9rT1VGSFhtVDVsWmRLZUdMaTRkUEttV2xKUkU1Q3dicFBzbmxySGR4?=
 =?utf-8?B?UG5KdW5NUVJaTUhCRjZFQWxoTU00YmZIRnJHb2wvMW9QUlkrSnhPMHg1R3JK?=
 =?utf-8?B?RlBuY3pYZnoxSDdCRnhna2s3SmZOVkdTU2hZbmoyeHhKVklXUE9xdDdHR0ps?=
 =?utf-8?B?SkJTVU9PUDFEL1l4eGhYU1ZHUnUvaEp0RHQyc0J3WUlNNDN2bFZxb1NscWRn?=
 =?utf-8?B?UlJ3NnFwd0ZSY3dPcm9jZGJ0RlZsVEdiTkhaVnIybmVXUVg3aTFoVXdNZUxt?=
 =?utf-8?B?UXBlZUkveEhBajNIZDIwYWxpRFRweVczTTRCendJL2FSV3NUZUVTclU3V2FP?=
 =?utf-8?B?MytWamprOE9iWm5RWXBscjlKdkdDcm9uS3VBazJkVldqcGVzUG1UeGtmSmd6?=
 =?utf-8?B?ZW5DVzA0a0NMUDhSNElFcFE4ZkRlNDNaYnd0KzhVQ3lpQzQ3YW1ZWEZ2MnBQ?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41BDD3BDC3E96B47B5B1E0026AAE2C95@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a8b368-f1df-4625-359d-08de02ae1db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 18:53:17.8962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JUfng+wN4oJadPXEUBl3bS9y+L0gM3rWQKIKtvQvXQ1IcuIVSBAID8TRk0AlxVr2QgXqzq4mqtC319vdDCRH9aMYKw66q7Gh9cx1yMvByw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9515
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

T24gRnJpLCAyMDI1LTEwLTAzIGF0IDExOjUwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAwMiwgMjAyNSBhdCAxMTowNDo0M1BNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBXaGVuIHRoZSBEUk0gc2NoZWR1bGVyIGhhcyBiZWVuICJwYXVzZWQiIChz
ZWUgeGVfZ3B1X3NjaGVkdWxlci5jKSwNCj4gPiBpZiB3ZSB0aGVuIHNlbmQgYSBtZXNzYWdlIHRv
IGNsZWFudXAgYW4gZXhlYyBxdWV1ZSBhdCB0aGF0IHRpbWUsDQo+ID4gd2Ugd2lsbCBuZXZlciBn
ZXQgYSByZXNwb25zZSBmb3IgaXQgaWYgZm9yIHNvbWUgcmVhc29uIHRoZQ0KPiA+IHVucGF1c2Ug
bmV2ZXIgaGFwcGVucy4gVGhpcyBjYW4gb2NjdXIgaWYgZm9yIHNvbWUgcmVhc29uIGR1cmluZw0K
PiANCj4gVGhhdCBpcyBub3QgaG93IHRoaXMgZGVzaWduZWQuIE1lc3NhZ2VzIHRvIHRoZSBxdWV1
ZSBkbyBnZXQgcHJvY2Vzc2VkDQo+IHdoZW4gc2NoZWR1bGUgaXMgcGF1c2VkIGJ1dCBzaG91bGQg
Z2V0IHByb2Nlc3NlZCB3aGVuIHRoZSBxdWV1ZSBpcw0KPiByZXN1bWVkLg0KDQpSaWdodCBidXQg
aW4gdGhlIGNhc2Ugb2YgYSB3ZWRnZSwgdGhlcmUgaXMgbm8gcmVzdW1lIGhlcmUuDQoNCj4gDQo+
ID4gZXhlYyBxdWV1ZSBjcmVhdGlvbiwgdGhlIGRldmljZSBiZWNvbWVzIHdlZGdlZC4gVGhlIHdl
ZGdlIGV2ZW50DQo+ID4gd2lsbCBjYXVzZSB0aGF0IHNjaGVkdWxlciB0byBiZWNvbWUgcGF1c2Vk
IGFuZCB0aGUgY3JlYXRpb24NCj4gDQo+IElJUkMgd2VkZ2luZyB0aGUgZHJpdmVyIHNob3VsZG4n
dCBsZWF2ZSBhbnkgcXVldWVzIHBhdXNlZC4gSXQgc2hvdWxkDQo+IGp1c3Qgc2lnbmFsIGFsbCBv
ZiB0aGUgcXVldWVzIGpvYidzIGZlbmNlcyB3aXRob3V0IHRvdWNoaW5nIGFueQ0KPiBoYXJkd2Fy
ZQ0KPiBzdGF0ZS4gDQoNCk9rIHNvIGlmIHRoZSByZWNvbW1lbmRhdGlvbiBpcyB0byBtYWtlIHN1
cmUgdGhlIHdlZGdlIGlzIGZsdXNoaW5nIHRoZQ0KZmVuY2VzIHByb3Blcmx5LCBsZXQgbWUgbG9v
ayB0aGVyZSBhbmQgZ2V0IGJhY2suDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQ0KU3R1YXJ0
DQoNCj4gDQo+IFNvIHNvbWV0aGluZyBlbHNlIGlzIGdvaW5nIG9uIGhlcmUgaWYgbWVtb3J5IGlz
IGxlYWtpbmcgYWZ0ZXIgd2VkZ2luZw0KPiAtDQo+IGkuZS4sIHRoaXMgZml4IGRvZXNuJ3QgbG9v
ayByaWdodC4NCj4gDQo+IE1hdHQNCj4gDQo+ID4gdGhlbiBsZWF2ZXMgYSBkYW5nbGluZyBMUkMg
dGhhdCB3aWxsIG5ldmVyIGdldCBjbGVhbmVkIHVwIHNpbmNlDQo+ID4gdGhlIHJlY292ZXJ5IGlz
IGEgZHJpdmVyIHJlYmluZC4gU28gZXNzZW50aWFsbHkgdGhpcyBjaGFuZ2UNCj4gPiBmaXhlcyBh
IHBvdGVudGlhbCBtZW1vcnkgbGVhayBpbiB0aGUgZXZlbnQgdGhlIGRldmljZSBpcw0KPiA+IHdl
ZGdlZCBkdXJpbmcgYSB0ZXN0IHVuZXhwZWN0ZWRseSAoZS5nLiBkdXJpbmcgYW4gdW5leHBlY3Rl
ZA0KPiA+IGhhcmR3YXJlIGZhaWx1cmUpLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFy
dCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMyArKy0NCj4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGluZGV4IDU1YTUwYzQ2ZWEyYi4uNDViNzJiZWJm
YzYzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gQEAgLTE3
MzIsNyArMTczMiw4IEBAIHN0YXRpYyB2b2lkIGd1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koc3RydWN0
DQo+ID4geGVfZXhlY19xdWV1ZSAqcSkNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX3NjaGVkX21zZyAqbXNnID0gcS0+Z3VjLT5zdGF0aWNfbXNncyArDQo+ID4gU1RBVElD
X01TR19DTEVBTlVQOw0KPiA+IMKgDQo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCEocS0+ZmxhZ3Mg
JiBFWEVDX1FVRVVFX0ZMQUdfUEVSTUFORU5UKSAmJg0KPiA+ICFleGVjX3F1ZXVlX3dlZGdlZChx
KSkNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIShxLT5mbGFncyAmIEVYRUNfUVVFVUVfRkxBR19Q
RVJNQU5FTlQpICYmDQo+ID4gIWV4ZWNfcXVldWVfd2VkZ2VkKHEpICYmDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgICFSRUFEX09OQ0UocS0+Z3VjLT5zY2hlZC5iYXNlLnBhdXNlX3N1Ym1pdCkp
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBndWNfZXhlY19xdWV1ZV9hZGRf
bXNnKHEsIG1zZywgQ0xFQU5VUCk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9fZ3VjX2V4ZWNfcXVldWVfZGVzdHJveShleGVj
X3F1ZXVlX3RvX2d1YyhxKSwgcSk7DQo+ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
