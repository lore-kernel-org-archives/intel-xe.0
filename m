Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B587D59F44
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 22:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE89310E949;
	Fri, 12 Dec 2025 22:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kznShAs9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2CD10E949
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765576877; x=1797112877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VdJJGjj109xJIRNd3HOVQC1i8Uaj51D9utD6dwNkoBI=;
 b=kznShAs9GpHPe4tkLfjwN03UJZPG2il8trxv+S2R6zIyBALwg+2LE8yZ
 v6vHyQu4xJQaax/3HzcBP8CrSIoP9yD2MBiPyak2Hl8gf49IRDxJSiudB
 9MEoX+Ynq4kjSpMbnzH7PTGR3WMq827fZ3/Mv5g5fVadUZDj0xrODFDTj
 WLgCh6+yQ0hppTh4KDUD0CWHVK4muazrYcDXIg8PbwAGQ+vwsbgjkMCRl
 7XSZJywo+bE8s3ugpxbfTrLLm8NMnJmsw0amOw+RVfQeMx6+4/8rpyYxx
 ttJ9RMxe6BBQG4TaShVAK76QCT2G3EnPGUX22D69+GGpNKYWDqqW7WStD A==;
X-CSE-ConnectionGUID: bF+KK+YrTOyyglMq05w2XA==
X-CSE-MsgGUID: s3Usjhk3SzibIHtZYQABGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71431831"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71431831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 14:01:16 -0800
X-CSE-ConnectionGUID: GOVdGtmvTEyV3LcvbEs7rQ==
X-CSE-MsgGUID: Ww8PLRITT2Sf2l2dVPfzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197188802"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 14:01:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 14:01:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 14:01:15 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 14:00:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2NSKK8owxp0CxykHFnc/wyW0BgFRV3v/5eSqsIlI1QmdkTUnulyptLrtO4U36zlIzUsWx9gSwAWACx6O78uB9UwEu9D3WjX7nvwp3wYWElzUOZ6hgL+uMc0zM9z28BQzi6k11vUDp3IA3mrFmlIkSk0Bcvi+i7awZeg/5c+cJel/RQZrN+4jWPqJucJ2DW0FbKE7ns4wiS96sNjMU/i0xvn2FA5nFdAfhxy3tDrNUc+b5aeR5yNNKy6wFXy9GflrtHOTMCQXH9rwBZbDTzj+2za+MgCzc8NatjMwearedSyw1uOacomIwcSZCtPf+Fl7QuXDUUOOj+Ve/PngGGXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdJJGjj109xJIRNd3HOVQC1i8Uaj51D9utD6dwNkoBI=;
 b=RfNO7ufmigEuUH/+Xwflw1VXb8OjOGpsTccP8w75p2ryFSII39AwoyjYPsUlsU+XeTwKnwUpIXehR6LC+DfXXJzp1dGu5kV1uZNhl4UDTN46EI8TunxuwkuBYwSb/PArhTIYU/ESmL1qzI00tdr0nEdcGM1za8NgkYp9jkU7z/ES4uo6eAr2OQgbX0xg2g1BP2yNfVKd7H6lhMy38owVmKWju2KTKJz1SjC9btaEsBr7RarGxemH8dVDw2Qd4cZuYjonDiNIEGBq1LxpW/5F2aGN8QnoO6j8n+ZclJA52s3PE9716/hQU6x4CFkcjm5MhelLmqPzkkx7Z3JqvNw3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8319.namprd11.prod.outlook.com (2603:10b6:806:38c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 22:00:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 22:00:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 09/12] drm/xe: Add xe_tlb_inval_idle helper
Thread-Topic: [PATCH v2 09/12] drm/xe: Add xe_tlb_inval_idle helper
Thread-Index: AQHcTcUgntLb7SWKgUK+doFkPrV7/7TsSbmAgDKAQwA=
Date: Fri, 12 Dec 2025 22:00:47 +0000
Message-ID: <6d4c3bf62c20ab8152532512d54ef1b5c918f78d.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-10-matthew.brost@intel.com>
 <2bf02520f70c3068b19fea9bac1bb0a289f965ad.camel@intel.com>
In-Reply-To: <2bf02520f70c3068b19fea9bac1bb0a289f965ad.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8319:EE_
x-ms-office365-filtering-correlation-id: dd8d902e-c634-4059-ffed-08de39c9e7ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UWVEMGZJcEhKUTZMenN1WHBUVlBRcWVuWlRoSzk2MVZjNHQyeXBSUXI1WnNh?=
 =?utf-8?B?R25UM2F0OFpOQ3ZJMklaR1I1SElPeE5kbWd4TUdTSkdIVFVGV3RjbytCVVpi?=
 =?utf-8?B?VmZiUHlLTVdKeHFXSHJYbnp0eEtxVlp2dmpMTmt6ZDFDV3ZqQVpMSGxseFNV?=
 =?utf-8?B?dm5VYkt4SU9wa2EzUWdaaDNYYktPd21Ka3FJRmlvZ3FINHozN3B3NVZrSVhm?=
 =?utf-8?B?aWw5NitPWW9nbVZlMnBiYWlGM3FtMUtGYXdzWHlYUkpDR25sMms0WkN0RDhV?=
 =?utf-8?B?S0haengwRjVxR2Zzc2NjK1lYU1VYNXN2emNhNllNa2hmNFMxM29oTUcrT2JW?=
 =?utf-8?B?NTE3b2JUTkFCN292RGNBVm40U0pIY2o5VzBLVWp4QUFWZk1iUnBwUjErOVo1?=
 =?utf-8?B?ZGdsRlpYQkdReE8rOWdpaWpybGQ1aTREKy9PakZ3NTR6Y2EyQzFYcHZoUkFq?=
 =?utf-8?B?akU0b3Z2N040d1ZQMm51aElIQnNMdzlldWpZWWRUWE5Vc29EdUpjRTlscTVx?=
 =?utf-8?B?dnlWR1lJOUVaZHg2T3Q2Q25BQnNyZ0FORzhBQVhZQURyUDdJcENqV0d3VHoy?=
 =?utf-8?B?TSthYmxuQWFPOUZBVTJnVzlMTGNtbnJzRzBCa0hCS1ZrbHZ3RUlBNVdSYXRK?=
 =?utf-8?B?NU94anQ1VXNmTU9OUVRBUDBGQndKZUZMaUY5RDdYRzE3WmEwSE9rMmZOdERP?=
 =?utf-8?B?YVAydXJzbnFibEh6Y2FRNkpRaGdTMGRlZ3NlV2VsaFJxbTAzc242YnZyV0lv?=
 =?utf-8?B?UTRqd28xN0FieTBWcVZRSlNHMDJZU2hrV0ZVQ1VXblBNMUYyODllUnljeExN?=
 =?utf-8?B?L3lic1RwTnZQaXVVNktJWWJnYSs3V044dDlXSHUzZndrWm9vclJ2Y2x0Y3ZV?=
 =?utf-8?B?NXBjbGRSMVlZSFNkNnd4VVZIOGRVZ0VCVDRCZGF6QUl6azQzRjMrUUpMY0xW?=
 =?utf-8?B?SDIxc01uVDRhekVQNHVmaERsT1h5aVRpRk9lUzE1Rm5SMUp1Y1FOaGk3bS9z?=
 =?utf-8?B?UmxYdmpiWXlBYUExT0l2VzlKWm1IR2VDdFJseTFaU1VRTjhkaEh3VWkzMEVk?=
 =?utf-8?B?Z0lVMUJpRWVOdSt4ZUMyakl3aThsbEs2MFJjNWxuU2crUnIzVXlXcFpjeHNo?=
 =?utf-8?B?ZnhPRzQ1ckNpQkxySHpSSW1DdVRONEU0cVJMM1BxY0ljZEpvSXdiTlUyOUR1?=
 =?utf-8?B?V3lBU0puN1prWnFydmEraGhNSHAxQSs2QkI2TERITXp0SUxZd0ZiWURXTkI1?=
 =?utf-8?B?Wjc1WVRrWkIvcDFYQW1OMkZPdWQ3cGYwbEdhK2pWelJPU0p6N0lYWnMzWUVU?=
 =?utf-8?B?dmxGVWhhbUpmSlBDSUkxcG9oT0gyZGJVdEtFWDdlb1JCWk0yamMvclFFWXVo?=
 =?utf-8?B?RHBWT0owVTNMU3FWVElneDZ6VzVVMXAza3p2NlFBcmtwWFpTVWFVOXBocGRC?=
 =?utf-8?B?RTB0Mk9KTXl1M09nTVJvaWlneFZYT09zNkYwUThYa1p0K2c2azZnczY2NUh2?=
 =?utf-8?B?anpZMEJkYmJ3ZmZucnFLQVJqaXJIckQzRklEMjFXNnJwK0JkY2ZCb3BYckZh?=
 =?utf-8?B?cS9SY0wxVUNpNVlwU2NLMlFjS1NiTFRvWDF5dnh3K1EybUVxSDJ4aFVwTkNz?=
 =?utf-8?B?dDVOWVJDWnZYejVxbGNHMTlZalQxUWRIK3RzaTAzTndqSUxFWS82Tk1tM2VG?=
 =?utf-8?B?dWpqYWt0Y1FPZEhIUjlFLzlkT09IaStzcm9zaVBXMkdUUkdLS2dMcGF3TVdQ?=
 =?utf-8?B?NkcrWnA2WWRMNi9Rb0V4ZGxudXYrUWpra3FwZG1WemR5TGZ4VkVaUCtTYUUz?=
 =?utf-8?B?VlYvbG9XU3ZvdnU2NkJBNkQrZ09uZ3NoRlhidVVMclB0NlJkZ3hFbm1LOXhi?=
 =?utf-8?B?Q0lCb2l2ZHhiMU1pdlZDejhwS0JRYWJwaUdkUzFicGFWUjBTMVhOcFg0eGFP?=
 =?utf-8?B?Rll5Uk1XbkRXbE9uRGFTQWY3QnYrTlN5T1Q5MUhITlZPQ0tqSGFMOGgyZzhW?=
 =?utf-8?B?dmNPeGZpSFF1QnBvU3g4YWZaTmc0SjMrcHc0Z3R0c240eW9GcFZ0MEx6aWps?=
 =?utf-8?Q?Pkfs41?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmRIZjBaditnd2F1eWhVUWNGVzdVeC95am9COUgvM2NOTytJWXFKT2NaM1NZ?=
 =?utf-8?B?ZmQ2LzdzZ0tHWjFQM1pMRXZYcUZvbDMvWmZ1dStZRFE1dmJQRTJHY0JTb3FF?=
 =?utf-8?B?YnJ3UGdudnE1R0VWSjN4NW5jRytHWmtaUm5xM0NmRUYrLzI1RmFrK2p3WlFN?=
 =?utf-8?B?aXltcXRabEMxTGZiMEtSNFRzZzB4Wm1BOE8vMis5Tmp3S2RLbG5OTW5BSUxR?=
 =?utf-8?B?ZWM4VHJ5aGtDa0RkVXY5VjNIdy9MRG8yaDNHUFdkRGlqenk1RkkyaS85N2hY?=
 =?utf-8?B?anR0bTRlYkwrbmk1N1BGNDcrdDBacmw0TklwOU9EWHdpRHpwMzNtRkJudWp6?=
 =?utf-8?B?dGEwRDkyZlczeDc1MDcrTGJxNGxoVEhVZkVnYVFTS3lkaERVZGxHVWpwNlBV?=
 =?utf-8?B?cFNaWUxNcjdSaHVtdHhxaXJtbjBlYWxlQkloTVp4Y2ZCb01XWDJ2clBjdkNO?=
 =?utf-8?B?eGNCTDV1enZHZ3JveDJuQWNpM3VsVU15dzJhWlFSbS9GS3FjN0lwUUhEc20w?=
 =?utf-8?B?YjlLM055V0JSS1pwWmZFMWNVUmJqOGFKem5MajZYMFRzbk5oOTdhRzFGVTlH?=
 =?utf-8?B?d1RpM1oveHIrRTFFUjJOYVEySUhWMkxEcHZjT09SNnpRQjJIMko0VWNkc2d6?=
 =?utf-8?B?Y29uRzhnM0NBcks4bkpCVGRhUGRwcUx1Rk9SSmQ5NnJxK2dVeGp6ZWkxUkFS?=
 =?utf-8?B?K0dpcFc1VkVEVlJrakF2VUlPRHVRSGxOZ21PREhYV21TdmN5UHdaYkNjOXQ3?=
 =?utf-8?B?c3V5SC9HdGEzY29NRjhpVjYrQ2dpUkh4ZzhwOWovTEc0MTFDYjZicXJwVVd4?=
 =?utf-8?B?WEo2S0tna0w4OFVyVEQ4REx0a0tkU1RNVmYzelFrMU1Gd1hPcnBmWjFXSXBz?=
 =?utf-8?B?bS8reFBTUlJ2ejZEazF0Y2xLQU05dmxaM2pNZEhWcFp6QithWHhVSEdwSnFE?=
 =?utf-8?B?N3FSNXcwdUdwOUNiU093RU5nOGtkOVRMamk4MmNtOEROVU45aGNSRlM0OU16?=
 =?utf-8?B?L0N1ZXk4a3VVMjJjZUhqbGVUUFdNa1dDUGR3K0Q3NVEyOGtsYkUvN04yUUhO?=
 =?utf-8?B?Z2Jicmx0L3BuREFQQ21uUlJJQ3dPMWtBK3BrcXh5dzNIaHQ4bytNdXBOYmh4?=
 =?utf-8?B?YTQvaW9hU1RnUVd6U1BqZnRIcDNVaDRoR3lBQ2phcUVjNC82WWVaNWlRY09B?=
 =?utf-8?B?LzBheGdzL0lqQ2t6Nmp2U0lNS0VQanZkTXEyVXI5dW45SjJwa0dRZ0VQT3Vx?=
 =?utf-8?B?Zlc4dE5wam9pVXJtYmJJL3kwd1cwdXVFTFpHY2xhb2JHU25JUGVPUm1uaEJJ?=
 =?utf-8?B?RHBVTEZCQi9YekR2Zk91emNvbEVWVm90My9lblZQaXNGU1RMTFRvMVM1T3Fl?=
 =?utf-8?B?Vk1NSUJIRzJkSlF5SzdTcGwzTlgycksvR3hpdkJseWw0R2xxcW1PK2ZaUlFm?=
 =?utf-8?B?TW52ckVTU1dJR1F1eVZjTU0zdDBNOTlMeC9hSHQ0OFVWUnZlV0xzb25EeGwv?=
 =?utf-8?B?KzVBYVNHa0lmRnh5S01BaWFtY2tzSzhHeWNmYjNIUmdySGNHVDcxZVUwWU0z?=
 =?utf-8?B?ZU5KSHRqS2o0anRjYUxWUk41Q1VWVHZ5MDdublAxUUNtU3YvamRzL0oydU5j?=
 =?utf-8?B?NVp5OGg3L3NlWlZGMTJQUTV1R3Q2YmhYU3lpMGVDSHY1SnNLdVN3a0I2M0dp?=
 =?utf-8?B?TFYyNVJHSXZJS0YzSHFaazk1WmN1R1ZRb2V5a3hMMXF3SisyQW9xRXEwQUo3?=
 =?utf-8?B?REpsZmhlRExQWGhhUXBvNTdxSW13VnZxOGllb042MnZQdEczTzFHYVFIYnYr?=
 =?utf-8?B?VkNna0NqSzczend0K1Y4UENRVWhmZVFLMHF2MWFvWjU3SjlUNGtpZUdTaGJ1?=
 =?utf-8?B?VEJsNDJmT0tXZ2NPTGt3Tzc2WHFQcHV3WUdDTStiWlJvSVFDZUtzOFdMTmR2?=
 =?utf-8?B?eXdKczh3dzBPa005c2d4YzhFaWpSYmkzMmZzVDFDMzRwV1lRcjJGNFIydmlS?=
 =?utf-8?B?QmVKbUxVdEVCY0MwRkRQOXNBM2FMcUJ0UjZPVDRxZ2tMVVRqMVpvYUZvdWFT?=
 =?utf-8?B?SUdQVmdiNUdwVnQ0UTBKbTA1UjNBcVVnZ3RwbzN5WTBwcFY1MW1JdHdmbWIx?=
 =?utf-8?B?RXNaWHBqNzloNTc4dUZiVUlpd2QrWk9LNE8wbjFFL0lPSCtmU0hLWjFPcFlv?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <936D096EA9672D4AA9123F9006BCF931@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8d902e-c634-4059-ffed-08de39c9e7ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 22:00:47.3186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5i7fQ8HgQzCbOBI425MXpCzJNrkOnxEFrrFqka75QviEDqZjc8olNrALtHpqxH1+JsUsKUeGIKesxU5rTHNN8d8d5sB65WcJt7qMqABmO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8319
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

T24gTW9uLCAyMDI1LTExLTEwIGF0IDE4OjQ4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyNS0xMS0wNCBhdCAxMTo1NiAtMDgwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBJbnRyb2R1Y2UgdGhlIHhlX3RsYl9pbnZhbF9pZGxlIGhlbHBlciB0byBkZXRlY3Qg
d2hldGhlciBhbnkgVExCDQo+ID4gaW52YWxpZGF0aW9ucyBhcmUgY3VycmVudGx5IGluIGZsaWdo
dC4gVGhpcyBpcyB1c2VkIGluIGNvbnRleHQtDQo+ID4gYmFzZWQNCj4gPiBUTEINCj4gPiBpbnZh
bGlkYXRpb25zIHRvIGRldGVybWluZSB3aGV0aGVyIGR1bW15IFRMQiBpbnZhbGlkYXRpb25zIG5l
ZWQgdG8NCj4gPiBiZQ0KPiA+IHNlbnQgdG8gbWFpbnRhaW4gcHJvcGVyIFRMQiBpbnZhbGlkYXRp
b24gZmVuY2Ugb3JkZXJpbmcuLg0KPiA+IA0KPiA+IHYyOg0KPiA+IMKgLSBJbXBsZW1lbnQgeGVf
dGxiX2ludmFsX2lkbGUgYmFzZWQgb24gcGVuZGluZyBsaXN0DQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IA0KPiBJIGRv
bid0IGhhdmUgYW55IGlzc3VlIHdpdGggdGhpcyBwYXRjaCBvciB0aGUgbmV4dCBvbmUsIGJ1dCBJ
IHdhbnQgdG8NCj4gaG9sZCBvbiBmdWxsIHJldmlldyB1bnRpbCB3ZSBoYXZlIGEgd29ya2luZyBz
b2x1dGlvbiBmb3IgdGhlDQo+IHJlZ2lzdHJhdGlvbi9kZXJlZ2lzdHJhdGlvbiBwbGFjZW1lbnQg
b2YgdGhpcy4NCg0KUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0Bp
bnRlbC5jb20+DQoNCj4gDQo+IFRoYW5rcywNCj4gU3R1YXJ0DQo+IA0KPiA+IC0tLQ0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5jIHwgMjEgKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmggfMKgIDIgKysNCj4g
PiDCoDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV90bGJfaW52YWwuYw0KPiA+IGluZGV4IDdlZTA4MWI5NGY5MC4uN2FlNmI5Zjg4
NGU5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYw0KPiA+IEBAIC00NCwx
MSArNDQsMTQgQEAgc3RhdGljIHZvaWQgeGVfdGxiX2ludmFsX2ZlbmNlX2Zpbmkoc3RydWN0DQo+
ID4geGVfdGxiX2ludmFsX2ZlbmNlICpmZW5jZSkNCj4gPiDCoHN0YXRpYyB2b2lkDQo+ID4gwqB4
ZV90bGJfaW52YWxfZmVuY2Vfc2lnbmFsKHN0cnVjdCB4ZV90bGJfaW52YWxfZmVuY2UgKmZlbmNl
KQ0KPiA+IMKgew0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90bGJfaW52YWwgKnRsYl9p
bnZhbCA9IGZlbmNlLT50bGJfaW52YWw7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgc3RhY2sg
PSB0ZXN0X2JpdChGRU5DRV9TVEFDS19CSVQsICZmZW5jZS0+YmFzZS5mbGFncyk7DQo+ID4gwqAN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmZmVuY2UtPnRsYl9pbnZh
bC0+cGVuZGluZ19sb2NrKTsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBsaXN0X2RlbCgm
ZmVuY2UtPmxpbmspOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChsaXN0X2VtcHR5KCZ0bGJfaW52
YWwtPnBlbmRpbmdfZmVuY2VzKSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Y2FuY2VsX2RlbGF5ZWRfd29yaygmdGxiX2ludmFsLT5mZW5jZV90ZHIpOw0KPiA+IMKgwqDCoMKg
wqDCoMKgwqB0cmFjZV94ZV90bGJfaW52YWxfZmVuY2Vfc2lnbmFsKGZlbmNlLT50bGJfaW52YWwt
PnhlLA0KPiA+IGZlbmNlKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfdGxiX2ludmFsX2ZlbmNl
X2ZpbmkoZmVuY2UpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVuY2Vfc2lnbmFsKCZmZW5j
ZS0+YmFzZSk7DQo+ID4gQEAgLTQ0MywzICs0NDYsMjEgQEAgdm9pZCB4ZV90bGJfaW52YWxfZmVu
Y2VfaW5pdChzdHJ1Y3QNCj4gPiB4ZV90bGJfaW52YWwNCj4gPiAqdGxiX2ludmFsLA0KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZlbmNlX2dldCgmZmVuY2UtPmJhc2Up
Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqBmZW5jZS0+dGxiX2ludmFsID0gdGxiX2ludmFsOw0KPiA+
IMKgfQ0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHhlX3RsYl9pbnZhbF9pZGxlKCkgLSBJbml0
aWFsaXplIFRMQiBpbnZhbGlkYXRpb24gaXMgaWRsZQ0KPiA+ICsgKiBAdGxiX2ludmFsOiBUTEIg
aW52YWxpZGF0aW9uIGNsaWVudA0KPiA+ICsgKg0KPiA+ICsgKiBDaGVjayB0aGUgVExCIGludmFs
aWRhdGlvbiBzZXFubyB0byBkZXRlcm1pbmUgaWYgaXQgaXMgaWRsZQ0KPiA+IChpLmUuLCBubyBU
TEINCj4gPiArICogaW52YWxpZGF0aW9ucyBhcmUgaW4gZmxpZ2h0KS4gRXhwZWN0ZWQgdG8gYmUg
Y2FsbGVkIGluIHRoZQ0KPiA+IGJhY2tlbmQgYWZ0ZXIgdGhlDQo+ID4gKyAqIGZlbmNlIGhhcyBi
ZWVuIGFkZGVkIHRvIHRoZSBwZW5kaW5nIGxpc3QsIGFuZCB0YWtlcyB0aGlzIGludG8NCj4gPiBh
Y2NvdW50Lg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm46IFRydWUgaWYgVExCIGludmFsaWRhdGlv
biBjbGllbnQgaXMgaWRsZSwgRmFsc2UNCj4gPiBvdGhlcndpc2UNCj4gPiArICovDQo+ID4gK2Jv
b2wgeGVfdGxiX2ludmFsX2lkbGUoc3RydWN0IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsKQ0KPiA+
ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmdGxiX2ludmFsLT5z
ZXFub19sb2NrKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgZ3VhcmQoc3BpbmxvY2tfaXJx
KSgmdGxiX2ludmFsLT5wZW5kaW5nX2xvY2spOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBs
aXN0X2lzX3Npbmd1bGFyKCZ0bGJfaW52YWwtPnBlbmRpbmdfZmVuY2VzKTsNCj4gPiArfQ0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmgNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiA+IGluZGV4IDA1NjE0OTE1NDYzYS4u
NDRhNmQ5MTc3NDg5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJf
aW52YWwuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiA+
IEBAIC00Myw0ICs0Myw2IEBAIHhlX3RsYl9pbnZhbF9mZW5jZV93YWl0KHN0cnVjdCB4ZV90bGJf
aW52YWxfZmVuY2UNCj4gPiAqZmVuY2UpDQo+ID4gwqANCj4gPiDCoHZvaWQgeGVfdGxiX2ludmFs
X2RvbmVfaGFuZGxlcihzdHJ1Y3QgeGVfdGxiX2ludmFsICp0bGJfaW52YWwsIGludA0KPiA+IHNl
cW5vKTsNCj4gPiDCoA0KPiA+ICtib29sIHhlX3RsYl9pbnZhbF9pZGxlKHN0cnVjdCB4ZV90bGJf
aW52YWwgKnRsYl9pbnZhbCk7DQo+ID4gKw0KPiA+IMKgI2VuZGlmwqAvKiBfWEVfVExCX0lOVkFM
XyAqLw0KPiANCg0K
