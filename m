Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F39C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 03:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEC110E6AE;
	Thu, 11 Jul 2024 03:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/ncwi3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9541D10E6AE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 03:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720669698; x=1752205698;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uAwPVGcwW2eYxdPnKju+l/2hL7lmKfdO/vNo3vJUVyg=;
 b=a/ncwi3b8K5rn3wqPZNl0n3dqHbGo8u8Qhdiwy64W0bJL9C2nPlKXg27
 RWLS9p0j+Wd0LTKOywafEDRSP90mtOGIEfqNFltvuU/bZ9VRaGdwpINd7
 BIYBf0RAJREthjlNMgfnPkALxa0CUf88BgDZdqzhV37so6lnGmaTcINby
 UHseOCDymvthTk0qDk6F0gBd2ULbZ1wyQrkPipH9UKSkg8gFzj08BN1RS
 liIYipAXdMnN1+bdUgw4z/1Kfn8iP1JlkfA6OZkEPQL4NMTKFPdsRoKop
 wrj3byBn2dj0iPrfOfjfUaaqLJ5JFYBOU9pmYjAr83qQNC4/XuB9ezdaG w==;
X-CSE-ConnectionGUID: r7tvoJfOTTe4+HG2cTawPA==
X-CSE-MsgGUID: JsNSAQqCT9efcBjDWLbagg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17975564"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17975564"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 20:48:17 -0700
X-CSE-ConnectionGUID: HxiWNq0wRMOeWihLCHf8UQ==
X-CSE-MsgGUID: egZ7FCrtRbqa7NjFQvkOPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="71646095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 20:48:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:48:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:48:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:48:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR9igYjevcLrWQQlNkuZHdKWikgwDhw8OLmfvGVQisO9vXhUUNe7vipgsGi/ItnOrgeG48vtYpJFVX2h2hqpHb1PLSZNevO+PA4GUGUph/Jr8AMuqqWqX7EtE8QOaN7I/Mf1UYHberXQtgXetiwIsPL76JS3IhWxk+1aa8eCaQaUlHTuECKayE9sKmzBx8oqoKwKKkVI/+Owd9y6v2nOoGEv7GCmCc1hxAljA4/uHuGVmpwPKa0ybIpEM/OZS8NLc7VnyoZqpMtYiiW9+Vsr5ONWYsD3JSBf5qzQDEL7Gmaomhr3nHWRHtoWI/QLN2F3WedGqDn3YPN+HdseZhCJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAwPVGcwW2eYxdPnKju+l/2hL7lmKfdO/vNo3vJUVyg=;
 b=lqcqaBGffDnUrT/7Ph1wU4mPd4k+kSmoCYOObxzokJ90v78qhzXztXuLnoyemSMW5QYdsw7NnMuGPx/u1i4emM9JPKtn0LcYWgEN3wCnIVC27AmL9mfi3cl/Ps7sRHqUSJEG6PVeO1w0HzTJ/ypUzgQGzwmX6EAbbaoP1iDhuTWaceeNyfmsoCBJVc16fDwikg42vEVqWaogz3KVMh8kQkd6Rm3UQHWIUVxGXPPPaF5HWjyW0IfLrILd/iBR4Dv5HyN8jiJiUewZ139S0FNy8+cRv6K3FqI1xq1WJNRCqP1T7a2sjj/dyclrjR3QyhniMtdzd+N9HL00nk37ch+Law==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Thu, 11 Jul
 2024 03:48:13 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::8169:b373:c3c8:e26e]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::8169:b373:c3c8:e26e%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:48:13 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHa0u8QkB0H+fkFSkS8lX3Nv9QJlrHw475g
Date: Thu, 11 Jul 2024 03:48:13 +0000
Message-ID: <PH0PR11MB5579CC47B8C295A89873715687A52@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20240530062509.1529357-1-pallavi.mishra@intel.com>
 <a2bc8d72b081ca1625cb87385c49dd7db0e25b11.camel@intel.com>
In-Reply-To: <a2bc8d72b081ca1625cb87385c49dd7db0e25b11.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|IA1PR11MB8152:EE_
x-ms-office365-filtering-correlation-id: d017148a-84ac-4458-04eb-08dca15c4a23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVBGSlJzVGRIT1Q0QXlGTmp3d3Bmd0tMOGh6MFlwRk5vMDFValI3cGRJcjNK?=
 =?utf-8?B?cTRDWXN4TWJmVnZjM00zWk9uUDlrajZxNXVMdVh1RkthcTd5KzBWRlRqRERP?=
 =?utf-8?B?eVJTNW9ZUk43QThqV04zUXVjNW45NCtFVTRwNms5Y0pId3F1Y1hpZ3V4Wita?=
 =?utf-8?B?aHRvbWUxR25RbE5tcXVWL1JDVWFhaFROV0V0S29MazBoSVpianFuNWM1d2Iy?=
 =?utf-8?B?cEJhNnBXdkdtdlkvOVdTYmVBTUI4UFdSREZyWURXdGwwRUpQczQzYTk1ZklC?=
 =?utf-8?B?dHJwUTN4Z0dYaTZlOFZ4a0crSm80aDQvV2didVg4bjdXaGdtTUxXUCs1QjR5?=
 =?utf-8?B?c1RlMElDWjc1aTQwL2pWa2F1RnlnTnZiUnFiSkl1NzNkb3ZlNHZWS2k0VDI4?=
 =?utf-8?B?SjNHOEFqbE9wRDRIVVBJZHhKU1lhNVlodlRKdGRiYjJ1aFFGbStzRWFCOXhO?=
 =?utf-8?B?VWk4cG9tQ2x4RHNhTXVRdndJM3ZWdHR5MU1zUklKVU5UNUM4bGthUmRLaDBv?=
 =?utf-8?B?aDllWTV5dzE1Y3B2eXM5bEFtZWFQcXk0aFNtSWJNcXllWUgzMXBRU0hCcHE1?=
 =?utf-8?B?TzllQVpwWjRJdDBycG9GUno1M2pqazJmM3c4ZHB0QXFHeW5mQWRPTzkzV1FY?=
 =?utf-8?B?QW8wUDFtUjRGSTFTOWpuR3c5LzdSdlV5RWxMRFFHNm5MT0Y0UndMZmFaTFhX?=
 =?utf-8?B?RUZYaDNNK2FOenNidzBldmF6NU1wUXN1TEcyTUx1Y0tXa2VtR3Z1Y1FXOU5l?=
 =?utf-8?B?TFRMS1J3MEFTMk5aUFVPWXZROTlpaTJ0dWdhOGdTUUVXUTIvVStYNjFBQ2xr?=
 =?utf-8?B?THBCMnpJNFk3OWdGVFptc0F2Y0NiN3dUQXN5eG1oUGljMXVDUWtRM1A4b3pG?=
 =?utf-8?B?RHJkTmtGZW05Z2Y4bDREbHplNzFmNk5TVGNsSFVRdlFZNXZVSTgvaEI1aEEx?=
 =?utf-8?B?UkpiUGtzWmVabzcrT0UrUHJHakwvQUo4Q3JnZy85V0VScW9IYjZRVHJmYUQy?=
 =?utf-8?B?S01CZHRvZktsRlZvL0ZtOUJNVytMWkNRTGJ1bjFLMzNKVFVseXN2ZG9kQng4?=
 =?utf-8?B?aTN6emVLL1VKVlZkbWFVSzJ2WXlHQTZjUmtUZGlBVTZyWTYrZVJyNzY4eE8v?=
 =?utf-8?B?QVRDQVJ5MnhJbHFObGxHMzZRSjdRVTRWR05YNUVZaGtHdHJGVTgycWlBZkx6?=
 =?utf-8?B?WVUraE5laUxJKzdHbStCQTNNa3JrTmRWaythMGo1TG54RDdaaDhBWXM0QW1j?=
 =?utf-8?B?Q1liSFVPcmR3VGpYQWxZRk5rejFWaHJTWGNnVFpXL0hyUFg3aWI0SmpZMnJK?=
 =?utf-8?B?MFduWUlEYmxYdHZDNGhKOVdwNDRiSGhDcmJGZytib2RnUktQdDNhMGkyNnNk?=
 =?utf-8?B?SlBib3M0aW1uanNXU1RvQzF1R0tmNFRsYk8zdDl3MWNkREtsVUdLUGJOU2Jt?=
 =?utf-8?B?WC9MV0lPa3VobnhLMC95SU9EK3V3aTA5OEVyYm9XeDJEOCtCZEVVanVCZHF6?=
 =?utf-8?B?T2pmdWs2RTZ1eTRoZ05EOEszRmgwU09CWXJCN0pCeEZ1R29XRTRQQW4rNElu?=
 =?utf-8?B?SzFYRmZvWjVTZllVWGppSGg4L3B1Ujdyc3RhakRCNVB4eUc3N0J3ZHh5emx3?=
 =?utf-8?B?YmQxdHNTaWtRTk9pcFhJSG4zM1JaNnVnNUVIazZVeDB6cDNraGRiMTVwNUsv?=
 =?utf-8?B?MTJHS2lKNWlnbDhGMXZoMS9ZQVRveG5HdVFhK1B3OWt3OFVzUkt2WGVYTTIw?=
 =?utf-8?B?ZGNzMzRHUlZ2L1BsM3BGdG9md3E4d0VRSS9vOXl1VVVXeU11M2hMcDZ0VHBN?=
 =?utf-8?B?OFFMbFZKUVlXa3crbGwxRC9UZkIxZHA1cUYrUWgyT09BTGxZc1NZeHlaUWYz?=
 =?utf-8?B?YzFKMFNhbCtsTmVoRXo1VkNtVytrdm1lRjQzVm9wZEh2RGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVI0bndhQXlqSDlEMERObElCOWNFNGFSS1NVTGoyTGxKZDlCZHBmK1FXNWNJ?=
 =?utf-8?B?NTR0bURoay9ESE91dHlkYVFlTWZpb2JZTDU1SUl5YkFRcWdkVjhQaXRMZzNs?=
 =?utf-8?B?czFMU2N0eWlTck5ROXFWU2trVjFpZTAzNVlNNDJCd2tTSUtQeVJYM1RzTVNQ?=
 =?utf-8?B?Q2ZWWEhaNnRPR045SWd6R2pXN29ZVXFtZlFrSlBQY20rVUJWS0RYSHFqWWhr?=
 =?utf-8?B?SlJ6Zm9JSUFWMWVVclhib1JoS0Y4YzF4RVJGa1RLcEE5a2NCOUFDZGRZZ2Ru?=
 =?utf-8?B?U2ZWS1krYm1HMnp2MXAyWWxRbTZ0Vjg2WWxCWmM4NC9BZGtFcENRdmhWL2lo?=
 =?utf-8?B?WE5xQ0dUU3h6VzloK1MycGNLM1V4TVAxeEszRlB4M3ZzUjhNbEhoYzEvV3Fr?=
 =?utf-8?B?dkdXMndBeUorRkJzYW9jMXBpSE5kQUJGRjJuR1pOcjlpdGw2WUpVemgxdEdN?=
 =?utf-8?B?OXIzTjFNaW5Cem9EaUNHaWp6cVF2VlBRbE1MQzM4WUVEVURjdVk3SWw3T1g3?=
 =?utf-8?B?SlZrSEFMNTl5NEdZaGpvbjBaRmZ3RkRzWjQ0TXRsVnNsS0pyRU1weEcrV1M1?=
 =?utf-8?B?Vk5lV1Q2Q2JUNWFUY2NTQlByb3RmWU9HakFvRExnUHBtbHUvaGU0YjlmNjVl?=
 =?utf-8?B?NmNONUN6eVZ5T0s3bGM1dUtZUHhNVElUbk9hOGJGMW5pVGtSNDFGQkMxZjZL?=
 =?utf-8?B?RWJDd3V5UDNZeW9WdFhvNUJFZjJHYytOZ3dnOGhrR0hpdGFWTFJxMFpxd09u?=
 =?utf-8?B?VlBGU1pubDZ3N3FDU1RhbUk2K1B1T2MzSVd5VCsrdlI3Q1hzV3hlRnhFbURO?=
 =?utf-8?B?dWxVdk5SOEtjeXJwL2x0NHVDMHJZajNGZ2gyY3ZqVzNuY3RhK2xGZExBR3U3?=
 =?utf-8?B?ZWR1eFNhMldyY3RjMnhNWkVodGp6UVFyQ3V2d09za0dRTXhQbktKZ1JOaXU0?=
 =?utf-8?B?SS9ldVJqdzE2ZE1TQWlGTW56Mkp4ZEZTU01ybTRNWHZiOW5yaWE2b2tVWFBF?=
 =?utf-8?B?SmVtbzQ1cXpvZGZEb0haWUthNTNhK2J6akVGeS8yd2w3K29Gek1QVDNMcktT?=
 =?utf-8?B?Q2NBTkZydXE3MjhvQVRITFEzZVVWZENOUWVuQ3lCekhtVGF6L0Z1Um9CQWtG?=
 =?utf-8?B?Zm0xZFRYWVA3OVN4VUlqSDZBQUk0OEpvempsb2lYcEVJSGVCVHpOOHlDUDJ6?=
 =?utf-8?B?NVVQOHkvTzhPQk5GRE82WDdSQm5qQnZnYlVibGdtWFc1MnlXRGJ1YVo2MlZE?=
 =?utf-8?B?TkZCckg0aFBNcXNvNjlFQXBhMlFQYnBzNlNUVHdUaC9mN3V3NmlTU2JaWlFD?=
 =?utf-8?B?K1lCWG9ick01bnBOaUYvak5CN0IzTGwrR2NEc1lza0NRbkZha1R0WElXRnNR?=
 =?utf-8?B?N2MwcDMwMG1qcER0UFpZbzRqK2ZvN0J1N2I1T2RMOUo1SWpxY2JJVVdvZjdX?=
 =?utf-8?B?MGZ2V2N0R0Zra0QvVFgxREwrK1AzTmhOMmo4Uk1IdUhNWDVZZHhpMGdlV1hx?=
 =?utf-8?B?dEtsVVJFZFJ4Mm1oQjhBbDV3Y3owSjBPRDVzcnJheThYS0VMQlFwVCtjZUlP?=
 =?utf-8?B?T0FoZnkvM3I1MlkvRlJmd0pzNTE5TWpjb0E4OEpyeU41Y1FCL0d6dVpSY1Av?=
 =?utf-8?B?VzdMUGp3aWpNUitrUnVhV3BHampXWExyZWVLYS9zbkExODlLMDk5NlRFSTMx?=
 =?utf-8?B?RHZiRnkvdzJLNzhmL29VZk5scWxoODhqYmUxVDV2L2l4MExxWWlITGVBRGJx?=
 =?utf-8?B?SHhnTVoxSHJDSFVRYlNzUXZ1SnVwMzdwaWxRa2dxaU42LzhUWmx2WS9FMFZx?=
 =?utf-8?B?cG05d0pEZi80Y1dwVGd6cGxWRXp2YjVlSmFjbDRTajVmZlJlbXdMVmliS011?=
 =?utf-8?B?RGNpRVQzQVgzZUMvVUplcCs0Nm9xZmNrR2VUbWpvWlR2YU5Bem93TGZsbVhh?=
 =?utf-8?B?c043ZEdsR29NaDNHZ0k3MmRFQmdBWDlZQUc0LzF3MnFyOWE0UFV5MGhiT1dS?=
 =?utf-8?B?d0dCWGVjWVUrWTFMZmtSNTZUbGQ2T0VFU3k3UHA5ajZXVTBSZ2hZSmdWck1m?=
 =?utf-8?B?c2lZVXNiQmVyM0ljOFprZ3hXZTFwemk3M0dXT3FxL3IxNEduVW9ZSmUrTktq?=
 =?utf-8?Q?BS68IWK5Qjp0DPp5jeIjim5cU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d017148a-84ac-4458-04eb-08dca15c4a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 03:48:13.2359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jno+chl/5p6TFOR6W7TsY+KC2wU+js8aVh8vy/wBFaFvLUzrZ30UyodDlkIpcYXRHf2Hv1fS84JEbyBOmW2iOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxpbnRlbC14
ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFNvdXphLA0KPiBK
b3NlDQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDExLCAyMDI0IDE6MzIgQU0NCj4gVG86IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWlzaHJhLCBQYWxsYXZpIDxwYWxsYXZpLm1pc2hy
YUBpbnRlbC5jb20+Ow0KPiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0veGUveGUyOiBFbmFibGUgUHJpb3Jp
dHkgTWVtIFJlYWQNCj4gDQo+IE9uIFRodSwgMjAyNC0wNS0zMCBhdCAxMTo1NSArMDUzMCwgUGFs
bGF2aSBNaXNocmEgd3JvdGU6DQo+ID4gRW5hYmxlIGZlYXR1cmUgdG8gYWxsb3cgbWVtb3J5IHJl
YWRzIHRvIHRha2UgYSBwcmlvcml0eSBtZW1vcnkgcGF0aC4NCj4gPiBUaGlzIHdpbGwgcmVkdWNl
IGxhdGVuY3kgb24gdGhlIHJlYWQgcGF0aCwgYnV0IG1heSBpbnRyb2R1Y2UgcmVhZA0KPiA+IGFm
dGVyIHdyaXRlIChSQVcpIGhhemFyZHMgYXMgcmVhZCBhbmQgd3JpdGVzIHdpbGwgbm8gbG9uZ2Vy
IGJlDQo+ID4gb3JkZXJlZC4NCj4gPg0KPiA+IFRvIGF2b2lkIFJBVyBoYXphcmRzLCBTVyBjYW4g
dXNlIHRoZSBNSV9NRU1fRkVOQ0UgY29tbWFuZCBvciBhbnkNCj4gb3RoZXINCj4gPiBNSSBjb21t
YW5kIHRoYXQgZ2VuZXJhdGVzIG5vbiBwb3N0ZWQgbWVtb3J5IHdyaXRlcy4gVGhpcyB3aWxsIGVu
c3VyZQ0KPiA+IGRhdGEgaXMgY29oZXJlbnQgaW4gbWVtb3J5IHByaW9yIHRvIGV4ZWN1dGlvbiBv
ZiBjb21tYW5kcyB3aGljaCByZWFkDQo+ID4gZGF0YSBmcm9tIG1lbW9yeS4NCj4gPg0KPiA+IE5v
IHBhdHRlcm4gaWRlbnRpZmllZCBpbiBLTUQgdGhhdCBjb3VsZCBsZWFkIHRvIGEgaGF6YXJkLg0K
PiA+DQo+ID4gdjI6IE1vZGlmeSBjb21taXQgbWVzc2FnZSwgZW5hYmxlIHByaW9yaXR5IG1lbSBy
ZWFkIGZlYXR1cmUgZm9yIG1lZGlhLA0KPiA+IG1vZGlmeSB2ZXJzaW9uIHJhbmdlLCBtb2RpZnkg
YnNwZWMgZGV0YWlsIChNYXR0IFJvcGVyKQ0KPiA+DQo+ID4gQnNwZWM6IDYwMjk4LCA2MDIzNywg
NjAxODcsIDYwMTg4DQo+IA0KPiBNZXNhIGFjaw0KPiANCj4gQWNrZWQtYnk6IEpvc8OpIFJvYmVy
dG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiANCg0KTWVkaWEgYWNrDQoNCkFj
a2VkLWJ5OiBDYXJsIFpoYW5nIDxjYXJsLnpoYW5nQGludGVsLmNvbT4NCg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogUGFsbGF2aSBNaXNocmEgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaCB8ICAx
ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jICAgICAgICB8IDExICsr
KysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gPiBpbmRl
eCAyNjNmZmM3YmMyZWYuLjRlOGY5YTYxZjBiZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+IEBAIC0xMDQsNiArMTA0LDcgQEANCj4gPiAg
I2RlZmluZSBDU0ZFX0NISUNLRU4xKGJhc2UpCQkJWEVfUkVHKChiYXNlKSArDQo+IDB4ZDQsIFhF
X1JFR19PUFRJT05fTUFTS0VEKQ0KPiA+ICAjZGVmaW5lICAgR0hXU1BfQ1NCX1JFUE9SVF9ESVMJ
CQlSRUdfQklUKDE1KQ0KPiA+ICAjZGVmaW5lICAgUFBIV1NQX0NTQl9BTkRfVElNRVNUQU1QX1JF
UE9SVF9ESVMJUkVHX0JJVCgxNCkNCj4gPiArI2RlZmluZSAgIENTX1BSSU9SSVRZX01FTV9SRUFE
CQkJUkVHX0JJVCg3KQ0KPiA+DQo+ID4gICNkZWZpbmUgRkZfU0xJQ0VfQ1NfQ0hJQ0tFTjEoYmFz
ZSkJCVhFX1JFRygoYmFzZSkgKyAweGUwLA0KPiBYRV9SRUdfT1BUSU9OX01BU0tFRCkNCj4gPiAg
I2RlZmluZSAgIEZGU0NfUEVSQ1RYX1BSRUVNUFRfQ1RSTAkJUkVHX0JJVCgxNCkNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBpbmRleCA5ZWVmNzg5YmU4OTcuLmYwM2U1
Y2M5MDYzZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBAQCAt
NDI0LDYgKzQyNCwxNyBAQCBod19lbmdpbmVfc2V0dXBfZGVmYXVsdF9zdGF0ZShzdHJ1Y3QNCj4g
eGVfaHdfZW5naW5lICpod2UpDQo+ID4gIAkJCQkJICAgMHhBLA0KPiA+DQo+IFhFX1JUUF9BQ1RJ
T05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiA+ICAJCX0sDQo+ID4gKwkJLyogRW5hYmxlIFByaW9y
aXR5IE1lbSBSZWFkICovDQo+ID4gKwkJeyBYRV9SVFBfTkFNRSgiUHJpb3JpdHlfTWVtX1JlYWQi
KSwNCj4gPiArCQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsDQo+
IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwNCj4gPiArCQkgIFhFX1JUUF9BQ1RJT05T
KFNFVChDU0ZFX0NISUNLRU4xKDApLA0KPiBDU19QUklPUklUWV9NRU1fUkVBRCwNCj4gPiArCQkJ
CSAgICAgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lORV9CQVNFKSkpDQo+ID4gKwkJfSwNCj4gPiAr
CQl7IFhFX1JUUF9OQU1FKCJQcmlvcml0eV9NZW1fUmVhZF9Gb3JfTWVkaWEiKSwNCj4gPiArCQkg
IFhFX1JUUF9SVUxFUyhNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsDQo+IFhFX1JUUF9FTkRfVkVS
U0lPTl9VTkRFRklORUQpKSwNCj4gPiArCQkgIFhFX1JUUF9BQ1RJT05TKFNFVChDU0ZFX0NISUNL
RU4xKDApLA0KPiBDU19QUklPUklUWV9NRU1fUkVBRCwNCj4gPiArCQkJCSAgICAgWEVfUlRQX0FD
VElPTl9GTEFHKEVOR0lORV9CQVNFKSkpDQo+ID4gKwkJfSwNCj4gPiAgCQl7fQ0KPiA+ICAJfTsN
Cj4gPg0KDQo=
