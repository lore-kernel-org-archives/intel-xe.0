Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8091C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 09:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80A10E88C;
	Fri,  9 Aug 2024 09:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1GNzWzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D0C10E88C
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723194715; x=1754730715;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hlPHEKd6ZvqTj0amPX0VfTzdJxyhEwcEivhEWH0ms1E=;
 b=J1GNzWzFbV2ShEtMMN8qLpBEdciE4ELfUev1pTk3YR7zVzFQ3PfeCkQ+
 tBsn0RrJa15Cn4V7Z2rlloJKwSzQaeboGSCIpVVqx8trvV9jcI5GeL81o
 0XX/QsKZLNNkAJMwEK2ZigKmJ4JhV0ju0wYFfHs9PIDSHA6ZfIKuBXF3I
 osi4N7JV3V0y6oa1JB2V9VQbMgKgt8H4jrbOjuknffqjokDv2pqVOn7Hi
 jaSfBC9DETUX7g/Ylyqaa0Lok3CAeZNcouu5jIbNOnpZNmQ4lUyO7vgLt
 M/bkXrSQ+HVZWqa1l9665YyfPQJJPhA/HZX12U7xDO5KftLD5KwpFc0yN Q==;
X-CSE-ConnectionGUID: gtFkXgDmQPWU/lI/9S+fww==
X-CSE-MsgGUID: XI9AoatLS92HZfKxYwyInA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32038700"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="32038700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:11:54 -0700
X-CSE-ConnectionGUID: xzS+mrAFSq66rIeoe/q3Vw==
X-CSE-MsgGUID: 7+rzwTb3RmOUDbkjfs7vqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="61909133"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 02:11:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 02:11:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 02:11:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 02:11:53 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 02:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAeGRQvsOoEET7gE2kdKLjaGt0hMpmN6XT7QDmXNRY5Vr3EPzWU2dqdWwuvgJYF6Ug/hN3H5wB7a5OA6/sJVreFFOc33dAu2BWDSszoRYdZ3J/Ojq+gpH7x6n26eJmrj9/HhCeJJkkcPZ1BpOSxxvWZnC6H6OVRlkpmuJsgFx+Asqw+NP276a2Pb7VXoTL/mpFyuwosB3yLsnkj9m39zXrPKpsW9qyb0PbJ5Ei5xsAxoz7jzsXm4fMGUuxvW4pXf/BXt1QsfQZwQSoA47q/1nPe3JTqniL3AFKzcKAWGANPtGHmlCC4Dh1Q2m/rPQzruKTAmMsiODEgkNdnlU9ACdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlPHEKd6ZvqTj0amPX0VfTzdJxyhEwcEivhEWH0ms1E=;
 b=BPrhjMlMU/eSKwaV2TFuH6jdd9NY//omlOSsRB+oqZMPucpB/IA6tZqW6VxkjfRddMKah8+fxWSfdtGEumNP3qZjZhlYDXbMZpoIN5IkEcMkbsezzpqYfqa/E4Pid1mfk1V3d2Sp6XNinF5ZB0oOyDTGl/XRVYP3NWA83svd8vXSVg0MqYJMvGeM60PJGmJDMnuuhqf0CW9ERT+v3+LiPVHbR6N9MdRBPc33kf9ZLUP0ZxKbRAMW7X08lcGRmIC6YwEYqUARV8Xgmkf8yPdoXKbuaZ8335OKY9laU1HzCh3KFAgBt58X7eYTGlVxWJE0KCof6MFPNM9lyToYLGSXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 09:11:50 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 09:11:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Thread-Topic: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Thread-Index: AQHa6XUSM5dvDthrZ0WoognIGtqYVrIdxbwAgADbCgCAAARwQA==
Date: Fri, 9 Aug 2024 09:11:50 +0000
Message-ID: <DS7PR11MB6197AD5C4DD4595F464E765C81BA2@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
 <20240808092826.585276-2-tejas.upadhyay@intel.com>
 <20240808195114.GE5091@mdroper-desk1.amr.corp.intel.com>
 <4a41b168-10de-432f-8535-a719d321823a@intel.com>
In-Reply-To: <4a41b168-10de-432f-8535-a719d321823a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SN7PR11MB7638:EE_
x-ms-office365-filtering-correlation-id: f5908ac1-218a-4287-6b91-08dcb8534d71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TU1XdEtSSXpINE44SHV6NDJpdkZPa0pVTkpFTVlhbFJQZ1l1MS9UallLWmt2?=
 =?utf-8?B?WUJKTjRuYlNjMEcvWmd6eVcrS1kvM29KTHVoVmdjaUlmUUNqUEdGYk1SOU03?=
 =?utf-8?B?ZWp0em13M3k1Y1dJK1VndXdxNk13c0RQQmErazRFeFRqdWo4eFhsYnJXcnlE?=
 =?utf-8?B?elRhOWlHeFlvWDNicDY3VEFRdVgwSHg4K21kaHlXSEg2OEN0VTcwMVhlK1gx?=
 =?utf-8?B?TzRBZEs3RXdPTXRQZmxUbW45YlQweHcydFZ5bGFPL3cySllIbVVNR3R6ZzE4?=
 =?utf-8?B?TW5QdEN1eUxNaWZWNUtKVWpFakJGaUxVdll5b2RuYTduZkVDUjI1YklKNm05?=
 =?utf-8?B?UHcramEwb1k2VXJKUThLRE1tSG1pYm5qNG5waFZTUFpUUGVFYjNDbjlqS01I?=
 =?utf-8?B?TENnaVIybVI4MWxyZUw1NHNQVDZFSnhqWnRoTVh1WEsrR2lGOVF6RWhkWnk4?=
 =?utf-8?B?Mzd1cjhiWTFBTnJFUzNNU3VtN28zdWZFRFdXMDhaZENNUk1Vd0tYK21LSkUv?=
 =?utf-8?B?VndXKzdVVHdLNEtQUDBLcGJXNVYvK0ZieTJoWHpGVzFSU1FRRGdibmJpWEwx?=
 =?utf-8?B?b1RMSTk5eUpPNldmS2VDVXFWeVVoeE1yKzdxSHkrRG15eTE0V0V3blVCNyta?=
 =?utf-8?B?bDBJSmlTdlpHTWE4clVaS2VSS3V4bGhmdlNzU0Z5NGZraGZEdktEdUtncWR4?=
 =?utf-8?B?Z1hNaDB6MXJ6WmNuVE5Na1M4N2w3WGNYUXQ2dnYybXBZbWZDWDU5NWUxN0dW?=
 =?utf-8?B?dmNIVjNuS0FscTRGSXZMdVArMCtpMUlUMWNFaEp2ZzJYSUJDVTk4WTExcWlW?=
 =?utf-8?B?Tk5WN1lTM3VHZEpCV3Y3enFBL0pBMWVHOVM5dmprN093NTI0VlU0UTJVUjRU?=
 =?utf-8?B?aWNvVjlsRmplSTd5amJBcnlmeG1zUFlhWUo1bzh4WUN0M3VhR3NWNW85Wmtk?=
 =?utf-8?B?dktSeTZGMDZ0MHJNbEpWN25tL1ZNYjhDRmQzVEpRYmFPMXlNMUtQZ2VDL01w?=
 =?utf-8?B?RTNzcXZaUVp0STd0TVZFZUpTZk5jSjd1SFo1dlpoUFFiUlpDSWVFQ0Zqazgw?=
 =?utf-8?B?NmVkMW1kV0pVdDl1RVAxR001bGlPRTNhQWVUY2lEeHk0Mmh0N1NhQVFTRENn?=
 =?utf-8?B?cERJVjBMMEFITGwzd25HYy9UQkx1Z0hPbmFCdkExRHE4V1J4VW9qbjdRN0lx?=
 =?utf-8?B?N3BZdnNyVVhmMll2ZW9SM2Rrb1lISE56cDRkUW1JQ3FOc0dlamYwTDlXVHZ5?=
 =?utf-8?B?QlJOd1llT1hHdFgzbll1TjZUb3hqZXl3RDNnL1ArL3lQQVN0K3M1eHhVOHY1?=
 =?utf-8?B?a3VZdWZiTnF2Q0FneHFoeGdmK3lTTE5RS1FRUWlUc29qQ3RzTjduNzFKaGRu?=
 =?utf-8?B?aHo3S0VRZlIrSTUwZVlWelNaQkl6Y1AvbGRsNFZMcS9DUVFyZFV2aURxRVl2?=
 =?utf-8?B?ZVZrUTJUWm9FK2tub3RqZ1FWd2sxMUs4WCtaQTFDVUxQU0dGbDQyRDRCRnNN?=
 =?utf-8?B?RXFxcnU1SFRGQzNBblRJSDJPTEJ4T3l4NXA2bWJCek9XMW00TFZlNnU1N3pH?=
 =?utf-8?B?NHpmMGY5ZklmQm9RQXF3bEYwTFAwMk8yZHV1TTZtaG5mS3JUYktuVURtRGZG?=
 =?utf-8?B?NmtTUzVFeVB5WWpQV3Jmd01yUXdyRzVUN2ZkTDVtODhsMm9zcjlHVStuWXN2?=
 =?utf-8?B?R1JEQmhSbXN3NUEvSW5QQ3JJaGRta2lxQXdkUlcyTXZCNHVWVklQcHhDS2pm?=
 =?utf-8?B?eTNqMVdPN1FvTktXL2RwZ3A0SXZ5SDgzdkt6ZExSdHFCZE04a2Z0OFVHLy90?=
 =?utf-8?B?SGxodGlTVVR0NU91NWNoWWZScU1CZHYyMWdsT2NOUkhUU3NaTDcrWFhWQldt?=
 =?utf-8?B?dytZZWpJSHZ2QlpuVFNZVkdYZEpLU3UwK0ZpOXowN2g3a0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVYxUmtLaW0rRkVCU21MSUdxc2poR2xaTFlOUmd5UENxRmU5TThmTlkvSGVY?=
 =?utf-8?B?MGpoYTBXMXE3NG52V0JwUmpTT2ExNFdOSzBMZTlMM0xyVk0yQXljNWRjcEhH?=
 =?utf-8?B?eGtLaDl2TnVuZXIwNVNDRFJKUTNuWmxJZ09EUGh3Wk5YYVE5UjF4Z09HWmZ5?=
 =?utf-8?B?UTVDM1hqTHlIcUhLWFpWSVdWUVVmV1pWOWI2elFqU1VvRHdOY21hOHVDSVNP?=
 =?utf-8?B?QUw0eXpxMzh4TGxCREtFcDJtcjYwdzAybG9HcU1tMjlZYm0yeTJ0SnNadWZO?=
 =?utf-8?B?UVBaT0E1Mm1BUFV0bDEwTWFTVmVKMWxwdE1JYmZhM1Z3TU10UVZ6c1pkN0pa?=
 =?utf-8?B?aUdrWDlPSzM2Y1lhTEt1aEFkRGwyVHlPZUFidFRyN1pqeGZPNklsRlQzdW5Y?=
 =?utf-8?B?RERLblVNejV6aGpUWVMzTmdGOUFwUURVa2oyNll4ZXBVWHlZYU5mTkhDU0tW?=
 =?utf-8?B?L21PWUg2YnFsMTlXUERpMEhJSkdTNGxpNUoxRTVQRmJiYnhPRjIwWU0zMFlT?=
 =?utf-8?B?MUJGdkdrVDZaZXFvV0x1WUFTelY3RTdnSS9kTlJ0ZlFNVVhJRVh6a0JVZVZp?=
 =?utf-8?B?Q0w3SW1sVkFZZHFXdE5rTWg4SVN3dnhWbHdCeWp5ZVR6Ym8va1F1ZlVHN0Jw?=
 =?utf-8?B?S1FBYUVjNm5KbHdqVHNhTnNVWHZWSndQQXNUZkhCeS94VXovUmdZNTZPRy91?=
 =?utf-8?B?QmlaYmdVb21jdXF1V3BzcTVLVHpJSHZJbi9ESXF2UkdicGExREVIdkR1UlhJ?=
 =?utf-8?B?L3V2K0xMRThOMHBWMWRYYlMxZmU0UHJRZ2h1YkxIbmRLWHY5a2U2WXAzdUgv?=
 =?utf-8?B?RTFoWktGcVdYazZpWVhxL0xqSnhoWlNXV0lWNm1RNWQzck5jVlZVMExJUTRP?=
 =?utf-8?B?cmpydkpkWnZIM3ZpQXk4Y0g3c29EVUl5MHV4MTlNM3JIamhuNitDdS9iSStN?=
 =?utf-8?B?R0FON01vRThmNmdXb3FtZ2ltZkNXeXRvRHNFbzljY2pHVmcxOTYzb2UzcUlk?=
 =?utf-8?B?SGwxYUlsbk50aHcrV1FLaHA4cmVWSE9RMjRNR1crcmQrUC9Ocm1JY3dyYWhV?=
 =?utf-8?B?aWJSOG42K0p6SXBnSHFrN3BhSEdUTHlRYS9HTCt5MjhHN2VhdzFhOUxSUDFk?=
 =?utf-8?B?SXl6U3VhUFhLTWEzMk0xbnp1MURiYmlSVk42VldSWkNVTG9laDV2YUlaN2hD?=
 =?utf-8?B?VGM3eTBwdG9WWW5UYVoyZ0dhT2FveFZzWENudzlMRnlVWVNwRzRydGRwM2hF?=
 =?utf-8?B?NjA2Zi8wNXh5RXRNc1ZBR3pGY0NxaEZNbFRXWUg4M1RUZk51U2p5QndwR1RV?=
 =?utf-8?B?RGM5WHRwNzlkRlArZStxWWd3U1VJN1FCY0NQWm9vdHpkQmRyWUs1UzhRUGl2?=
 =?utf-8?B?d2FwMUJmelVsSEV4a1ArbkVZOUN6NUJhQmhIUU8vNE1RaThLdlExWit3OGIy?=
 =?utf-8?B?Q056bnVxaFpjeDJZU2ptV0Z6eERJcXVYdGFtM2toR2VtUFdJYWdzTnJsN0s4?=
 =?utf-8?B?T3lRWHE1NG9xK0U1VGN3QXQyWk1iOEtNTUV4MVhhZFFHUGZMcUtkSVBkd3VI?=
 =?utf-8?B?ajV2TjlNVUIrMXJaVHpGYXR5bEJsMWpFa3VzdlczWGFqdVVWTFVjQzJnZkp0?=
 =?utf-8?B?OXZGa0hscjhGVVl0ZHZZVUVpTlJmWEduOGY2WCthb1Z3d3JCazFEcC9KTkE1?=
 =?utf-8?B?OXV6SFpKREQ3aUJ4ZGVqbXZ2YndMYlJ3M2MyQ2dmR29NUjJWcWNabWZFa2ZT?=
 =?utf-8?B?UG85K3pRNTZYVnIzRnoyUkx5RVNxeTVtYkpxNmYzdll4NC9KRWlMTGlGUnZp?=
 =?utf-8?B?YnBWbHJubE9henhndzM0SW9tYmVjeXIxWlVKamZKTGV2VmNRbUJSQVNnTzFj?=
 =?utf-8?B?THVzUm9JQU9UcmM0TXhrL3AvN1ZjbFRhZHI2ZWt0amZZMjlWaTdHWUFHKzhS?=
 =?utf-8?B?ZFdia1RMaTh0MUFsSGx0aGV5T2VncGtPWFNvNmJSQjc3OE1NQ2VzNURUM0R4?=
 =?utf-8?B?MXRHR09haitya3YyRkcweXpIZzRPdkRVbzZTd3IyS2ZsOERKd0l4cTZndXlr?=
 =?utf-8?B?NEV2UDV4aHVXOCtvVEtYMGpsdnY5QkdBKzJ5NndQRnJsLy8zRlRHbytmZG1K?=
 =?utf-8?Q?oi8wgeRdOsd6vtqrzAwdLgcKZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5908ac1-218a-4287-6b91-08dcb8534d71
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 09:11:50.0214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZEU6DDql2mJVONv/g6Nbxz2iQzW/s0cQulkmDssSmxiH84Lb1mmDQ77oWhzfe57c8RlEpLAKwAc46iBJEgMQifKfOvXT3o+OSX3mdvnaKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOSwgMjAyNCAy
OjI1IFBNDQo+IFRvOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
PjsgVXBhZGh5YXksIFRlamFzDQo+IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNoaSwgTHVjYXMNCj4gPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRybS94ZTog
SW5pdCBNQ1IgYmVmb3JlIGFueSBtY3IgcmVnaXN0ZXIgcmVhZA0KPiANCj4gT24gMDgvMDgvMjAy
NCAyMDo1MSwgTWF0dCBSb3BlciB3cm90ZToNCj4gPiBPbiBUaHUsIEF1ZyAwOCwgMjAyNCBhdCAw
Mjo1ODoyNVBNICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPj4gZW5hYmxlIGhvc3Qg
bDIgVlJBTSBpcyBleGFtcGxlIHdoZXJlIE1DUiByZWdpc3RlciBpcyBnZXR0aW5nIHJlYWQNCj4g
Pj4gYmVmb3JlIGZ1bGx5IE1DUiBpbml0IGlzIGRvbmUuIExldHMgbW92ZQ0KPiA+DQo+ID4gImlz
IGV4YW1wbGUiIG1ha2VzIGl0IHNvdW5kIGxpa2UgdGhpcyBpcyBqdXN0IG9uZSBvZiBtdWx0aXBs
ZSBwbGFjZXMNCj4gPiB3aGVyZSB3ZSdyZSBpbmNvcnJlY3RseSB1c2luZyBNQ1IgcmVnaXN0ZXJz
IGJlZm9yZSBNQ1IgaGFuZGxpbmcgaXMNCj4gPiBpbml0aWFsaXplZC4gIElmIHRoZXJlIGFyZSBp
bmRlZWQgb3RoZXIgY2FzZXMsIHRoZW4gSSdkIGV4cGVjdCB0byBzZWUNCj4gPiBtb3JlIHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMgbWFraW5nIG90aGVyIGNoYW5nZXMgYXMgd2VsbC4NCj4gPg0KPiA+
IEFsc28sIHRoZSB0aXRsZSBzZWVtcyBzbGlnaHRseSBtaXNsZWFkaW5nIGFzIHdlbGw7IGl0IG1h
a2VzIGl0IHNvdW5kDQo+ID4gbGlrZSB3ZSdyZSBjaGFuZ2luZyB3aGVyZSB3ZSBkbyB0aGUgTUNS
IGluaXQgKHdoaWNoIHdvdWxkIHJ1biBpbnRvDQo+ID4gb3RoZXIgY2hpY2tlbi1hbmQtZWdnIHBy
b2JsZW1zIHdpdGggdG9wb2xvZ3kgYW5kIEd1QyBpbml0KSwgYnV0IGluDQo+ID4gcmVhbGl0eSB3
ZSdyZSBqdXN0IG1vdmluZyB0aGUgTDIgdGhpbmcgZm9yIFdhXzE2MDIzNTg4MzQwIGEgYml0IGxh
dGVyDQo+ID4gaW4gdGhlIGluaXQgcHJvY2Vzcywgc28gaXQgbWlnaHQgYmUgYmVzdCB0byBmb2N1
cyB0aGUgd29yZGluZyBvbiB0aGF0Lg0KPiA+DQo+ID4gIEZyb20gYSBxdWljayBza2ltIG9mIFdh
XzE2MDIzNTg4MzQwIGl0IGp1c3Qgc2F5cyB0aGF0IHdlIG5lZWQgdG8gZG8NCj4gPiB0aGlzIGFz
IHBhcnQgb2YgaW5pdGlhbGl6YXRpb24gKGFuZCBHVCByZXNldCkgd2l0aG91dCByZWFsbHkNCj4g
PiBzcGVjaWZ5aW5nIGFueSBzcGVjaWZpYyBvcmRlcmluZyB3aXRoIHJlc3BlY3QgdG8gb3RoZXIg
aW5pdGlhbGl6YXRpb24NCj4gPiB0YXNrcy4gIElmIEkgcmVtZW1iZXIgdGhpcyB3b3JrYXJvdW5k
IGNvcnJlY3RseSBpdCdzIHByb2JhYmx5DQo+ID4gc29tZXRoaW5nIHRoYXQgd2Ugd2FudCB0byBk
byBiZWZvcmUgd2Ugc3RhcnQgaGF2aW5nIGEgYnVuY2ggb2YgQ1BVDQo+ID4gd3JpdGVzIHRvIHRo
ZSBMTUVNQkFSLiAgSSB0aGluayB0aGVyZSBhcmUgc29tZSBDUFUgLT4gVlJBTSB3cml0ZXMNCj4g
PiBkdXJpbmcgR3VDIGluaXRpYWxpemF0aW9uIChlLmcuLCB0aGUgR3VDIEFEUyksIGJ1dCBtYXli
ZSBub3QgZW5vdWdoIHRvDQo+ID4gcmVxdWlyZSBkb2luZyB0aGlzIHdvcmthcm91bmQgZWFybGll
cjsgd2Ugc2hvdWxkIHByb2JhYmx5IHRlc3QgdGhpcw0KPiA+IGNhcmVmdWxseSBhbmQvb3IgZG91
YmxlIGNoZWNrIHdpdGggdGhlIGFyY2hpdGVjdHMgb24gd2hldGhlciB0aGV5DQo+ID4gdGhpbmsg
dGhpcyB3b3VsZCBiZSBhIGNvbmNlcm4uICBJIGtub3cgdGhlIHJlYWxseSBoZWF2eSBDUFUgLT4g
TE1FTUJBUg0KPiA+IHRyYWZmaWMgd291bGQgcHJvYmFibHkgY29tZSBsYXRlciBvbmNlIHdlIGlu
aXRpYWxpemUgZGlzcGxheSBhbmQgdGhlDQo+ID4gZmJjb24gc3RhcnRzIHdyaXRpbmcgdG8gdGhl
IGZiZGV2IGZyYW1lYnVmZmVyLCBzbyB0aGUgbmV3IHBsYWNlbWVudCBpcw0KPiA+IHN0aWxsIGVh
cmx5IGVub3VnaCB0byBhdm9pZCB0aG9zZSBhdCBsZWFzdC4NCj4gDQo+IFllYWgsIGl0IHNlZW1l
ZCByZWFzb25hYmxlIHRvIGVuYWJsZSB0aGUgaG9zdCBsMiBjYWNoaW5nIGJlZm9yZSB3ZSBzdGFy
dGVkDQo+IHRvdWNoaW5nIHZyYW0gZnJvbSB0aGUgaG9zdC4gSSBkb24ndCByZWNhbGwgaWYgaXQg
d2FzIHRoaXMgdmVyc2lvbiBvZiB0aGUgV0Egb3INCj4gdGhlIG9uZSB0aGF0IGRpZCB0aGUgdGlt
ZXIgcmVnIHdyaXRlIHRoaW5nLCBidXQgSSBkbyBzZWVtIHRvIHJlbWVtYmVyIHRoZQ0KPiBwbGFj
ZW1lbnQgYmVpbmcgc2Vuc2l0aXZlIGV2ZW4gZHVyaW5nIG1vZHVsZSBsb2FkIChJSVJDIGd0X2lu
aXQgdnMNCj4gZ3RfaW5pdF9lYXJseSksIHdoZXJlIGlmIGRvbmUgdG9vIGxhdGUgKGd0X2luaXQp
IHlvdSB3b3VsZCBzb21ldGltZXMgc3RpbGwgZ2V0DQo+IHRoZSBpc3N1ZSB3aXRoIHRoZSByZWdp
c3RlciByZWFkIHRpbWluZyBvdXQgaW4gdGhlIGludGVycnVwdCBoYW5kbGVyLiBCdXQgaW4NCj4g
eGVfZ3RfaW5pdF9od2NvbmZpZyBwZXJoYXBzIG5vdCBhbiBpc3N1ZSwgc2luY2UgaXQgaXMgc3Rp
bGwgcXVpdGUgZWFybHkuDQoNClNob3VsZCB3ZSBnZXQgdGhpcyBleHRlbnNpdmVseSB0ZXN0ZWQg
b24gQk1HIGJ5IHZhbGlkYXRpb24gYmVmb3JlIGdvaW5nIGFoZWFkPw0KDQpUaGFua3MsDQpUZWph
cw0KPiANCj4gPg0KPiA+DQo+ID4gTWF0dA0KPiA+DQo+ID4+IGVuYWJsZSBob3N0IGwyIFZSQU0g
YWZ0ZXIgTUNSIGluaXQuDQo+ID4+DQo+ID4+IFYxKEx1Y2FzKToNCj4gPj4gICAtIFJlb3JkZXIg
cGF0Y2ggYW5kIHJlb3JkZXIgZmxvdyBvZiBMMiBWUkFNIGVuYWJsZQ0KPiA+Pg0KPiA+PiBDYzog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4+IC0t
LQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIHwgMiArLQ0KPiA+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuYw0KPiA+PiBpbmRleCA1ODg5NWVkMjJmNmUuLjIzOGM3ZDEwNTNmMCAxMDA2NDQNCj4g
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0LmMNCj4gPj4gQEAgLTU1Nyw3ICs1NTcsNiBAQCBpbnQgeGVfZ3RfaW5p
dF9od2NvbmZpZyhzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+Pg0KPiA+PiAgIAl4ZV9ndF9tY3JfaW5p
dF9lYXJseShndCk7DQo+ID4+ICAgCXhlX3BhdF9pbml0KGd0KTsNCj4gPj4gLQl4ZV9ndF9lbmFi
bGVfaG9zdF9sMl92cmFtKGd0KTsNCj4gPj4NCj4gPj4gICAJZXJyID0geGVfdWNfaW5pdCgmZ3Qt
PnVjKTsNCj4gPj4gICAJaWYgKGVycikNCj4gPj4gQEAgLTU2OSw2ICs1NjgsNyBAQCBpbnQgeGVf
Z3RfaW5pdF9od2NvbmZpZyhzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+Pg0KPiA+PiAgIAl4ZV9ndF90
b3BvbG9neV9pbml0KGd0KTsNCj4gPj4gICAJeGVfZ3RfbWNyX2luaXQoZ3QpOw0KPiA+PiArCXhl
X2d0X2VuYWJsZV9ob3N0X2wyX3ZyYW0oZ3QpOw0KPiA+Pg0KPiA+PiAgIG91dF9mdzoNCj4gPj4g
ICAJeGVfZm9yY2Vfd2FrZV9wdXQoZ3RfdG9fZncoZ3QpLCBYRV9GV19HVCk7DQo+ID4+IC0tDQo+
ID4+IDIuMjUuMQ0KPiA+Pg0KPiA+DQo=
