Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6539D172DC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 06:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7163F10E26F;
	Mon,  2 Feb 2026 06:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCmP2mji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6DE10E26F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770013805; x=1801549805;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=0hng7xjhjqJBm51k8BS1KpyoFss3A9nOQp16PAKQ5OI=;
 b=mCmP2mjijUvy50AdT/laG0N+I0yk/OSfsauY5wFmCqq7iUiLGR7tL1lK
 p/wCrWE/BKqIxPj3XGGXW4smzB3v/S1JpA1aXA5GcGEiaY4iMRPMRJn5I
 78jTUXMASzTy4z88ylnBebZkG4fQcd3W8Omz7YtH/gZ7iNKwwsjyvgTrt
 PV9Z6MAibxo5X7gacDPGAxuwehHpOPmzMlgAVGjKQa42Vo8RFC+Yf6w0h
 gh544pfII4hqQKzSWPEwhU7ethirjSvz4o9svLQVTUP9dWFrCnWdXMmS9
 Pjz6Kx4XmplQYEm3/9NIGfM2d7DpdVzT0ooKU0Z0hjJ/iKecrpC30EESO g==;
X-CSE-ConnectionGUID: St3ZvuNZQgW+XceOeeKx2w==
X-CSE-MsgGUID: +lEXYhJjTdicmFyUwBcPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81481687"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208,217";a="81481687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:30:04 -0800
X-CSE-ConnectionGUID: T5BFQFTYTiSqPQoqJKKwJw==
X-CSE-MsgGUID: u7pzJheOTCC4TNZfv4P/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
 d="scan'208,217";a="208954869"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:30:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:30:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 22:30:03 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:30:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjleZg41DTOeKxIHxsPJep4FhRRIo6Aa3nRPoe582m6fFEvZoS+Jk4JhyqS12gpOjul7TE5xVpygZJR4zWmFH34H3As7YdWF90gD9FHN9cCA452inWDXDJ1XPrM4M1c4F8tI8QE5mmPEP6OFXpXnlawT6rFqo2OQKhPnIS3MuK9IpnQQrIvCpaJWRuO9vYicFUKEsTGrJtCHw12d/dzTSv/5uh0snjFZMgJQ8OyR+hoThCa4pBS/HqCDfrwPI6d6ZVwaluqSMujjjZVscC3NakhsGZ7lUWwX+3bsGD/uQiUs9Ii1Pd3wH6kPk2kBwCxjLLaECWqxaPfQG1CssXywtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hng7xjhjqJBm51k8BS1KpyoFss3A9nOQp16PAKQ5OI=;
 b=FALZLges7RwUxNgl4/b6qQb/Hg4iN9eHWcUCMnDlwTgU1LTCG1Yq/upjmqHd6P7tVZgwZj8Rr3OuCujzVL3rk6Fgv4xlrc3RwFfzNNKQOR6DsVEm10Z0nIaOAGCRskGrKBVZ3QKmTtG6WvJicfi6qyIfZ+BulAHVZJG2TwJd4WpGs7s5pluhkCb8dxCp+UGEbIH28zwYYtsESEdSGFt1XASbyTysvJZXS5by9MlEy4gOhFOojxZH3UTViB4SCSDkHzUb0aalHgM0MwRngnuRd9OeNtG4+zfa/idagW1JAhiti2hw6qBikW3dVzHQisg++rhxsRQmLiw+LNELNHD/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BY1PR11MB8008.namprd11.prod.outlook.com (2603:10b6:a03:534::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Mon, 2 Feb 2026 06:29:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%2]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:29:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIFVzZSB0cmFucyBwdXNo?=
 =?utf-8?B?IG1lY2hhbmlzbSB0byBnZW5lcmF0ZSBmcmFtZSBjaGFuZ2UgZXZlbnQgKHJl?=
 =?utf-8?Q?v11)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgVXNlIHRyYW5zIHB1c2ggbWVj?=
 =?utf-8?Q?hanism_to_generate_frame_change_event_(rev11)?=
Thread-Index: AQHckDr/62Lnc3pa6kKFwWy80gx71bVu+jkA
Date: Mon, 2 Feb 2026 06:29:55 +0000
Message-ID: <cb224319592d04458257880b7e9e4a597de3a5a1.camel@intel.com>
References: <20260127124120.1069026-1-jouni.hogander@intel.com>
 <176959357950.199105.6867990403255035480@a3b018990fe9>
In-Reply-To: <176959357950.199105.6867990403255035480@a3b018990fe9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BY1PR11MB8008:EE_
x-ms-office365-filtering-correlation-id: e409941d-5c48-4d1f-21b1-08de62247b03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: =?utf-8?B?YXVkZWhUS1pnMllrQy92UXJIcXdmaXlxNmt0YWUrL3dTVWF4WUYrQnlRazlv?=
 =?utf-8?B?Ni9GWitkVi9TSUVHbTlYd0V3bHo4M3pMNVBmVHpuZFdtY0NpQlRUdjhCbjEw?=
 =?utf-8?B?MTl4QzVzR3FYZmpUdzhFcGtjVVVtZnVreFNzV2NzQjQ5NXVsM0EzejlTSFdh?=
 =?utf-8?B?cXV0QUVLZFdoTVBPekpSbmNtODhORno0LytmNXo5aW9KNUVOSjdVOU54M0Rm?=
 =?utf-8?B?WW55MHEzNVJ6QnduNUdNSUNaYldVVElFajAzUWJrd04zOTFleHVXbWZxT1p4?=
 =?utf-8?B?dFpFVXdCU0VqVzlRMitxaVdlWEprN25MQ0NqK21Td3U1SDVmMmpSVlJMY2ps?=
 =?utf-8?B?dGMxNytGV0Q3eG1UbFNPcTRZUmxnUHdYN0VhcWs1OGJFa2g3ck5TaHFVbW9U?=
 =?utf-8?B?Q2Q2UHRiSUpFUzU4RWlYUjlGNklTTjA5QlRZWndnV0lPTmNsY1hQTHZYeXpK?=
 =?utf-8?B?bGNQZFVnalMwMEJDcDFQOEEyaFdXeHlnWDB5NC9maGt4WVhtYVo3Tm5CTDJw?=
 =?utf-8?B?bjNpTzdwaW5haXVzU2VyQ0hFMU9RR1dkcUhrSTg3bVNmcWtIUi83azdlTVdp?=
 =?utf-8?B?Zit1aGhLV1BSNCswanNpVDM0UEtuTjJ6Sy81eDlHUndDVEt1V2V4alcyeHlB?=
 =?utf-8?B?d1VDMVJvSTBOb1E3S2NFam5PaUZMTzBvSVIvS3hiQW9lcU1qNVZFeEJES0w4?=
 =?utf-8?B?NkNHaFA3aHN0d0FVckVwZDkyUXhMZFBRVy9VSDV1UUtvZEZDNktCUktNZmcr?=
 =?utf-8?B?bVlxWE5lbWs3TXhLdVNWU0lQSVJNa0hHRDhsclpENXM1ZUw0NmZnVlpyVERz?=
 =?utf-8?B?YTdHbE9OV1gxYVJVQ2tDb2tRUUxaZHd1VTRIdnV6SzNSaXVhZ21CWTVtdGJD?=
 =?utf-8?B?L1pFajMrQmhsUkdTVlAvcGRQVmxDVWRuS2s5RVdTYVpvbTNoazEwWDdVZzJL?=
 =?utf-8?B?SVJveHQ2V2pEQnk1R0NXSEVaNGlGbXA5RG14dWNzWHVoZFczdnhnd1ErVHEw?=
 =?utf-8?B?c3VqdnR6b3AxY0diS2Yvb0ZZdGtvLzBSTFhTZVE4V2h0cDVwMHhKblcxVlN2?=
 =?utf-8?B?ZUJpbmlXNEJrWHdxWTlXVk1UK1VwWjBqS3krR09IS2xqTE1sWUMyR2phbEtL?=
 =?utf-8?B?QnpzNllueUU3cEl6SWxOYlNDcm5XU1JnbUxRalB2MmRwNXM1MkdpbGFMdnlv?=
 =?utf-8?B?UVVlRU5Pb0syWU1sRS9pSVMrTFJ1cmtOR0dIWEpvaXVFYU80SFlWSXdYZkhz?=
 =?utf-8?B?aEU0b0tBUkRFYmZlNXNSaXBBQ05wdnVNUHpicXhSSzlvU0NnRnVRaDYrVmRJ?=
 =?utf-8?B?S2lZeWVsUTl4VVJXNDJQK0FVU0ViVW11QW4yYVlONHgxck5tRnd0UkpreEpK?=
 =?utf-8?B?dGc3NE5iNWZWOHIwUGpGL014L20xTGJydlRHMndXUjNaMTJJTzZGalpLVzMy?=
 =?utf-8?B?RTBWNkQwRDV0VmlzVm5CVkd1cXFucDE4MkV5L3JqNWwvdUR6OUtiMExsaUVQ?=
 =?utf-8?B?dzBNaUQxZFBqR3dJakg4TGl1elR5YUVQZ0FhcXhmSVEyVHBUM1R1M0ZaR2Ez?=
 =?utf-8?B?QmdYaVd3cVZZbUdJaVFUL2F5KzJEZGdTTWEwcy9RZG9XZHNHZHM1UzZXN1dI?=
 =?utf-8?B?TG00OTFCY0RqdjUyNkN3eWNJUXBjcXd3YkF6eTN5cVdTL3MyaEszU1JQRUxs?=
 =?utf-8?B?MkZSVjRWTzE1Vno4bGdtUFpZWFBJUXQvWU9qWnkvUHRTRU96cytoVkJsSHZq?=
 =?utf-8?B?OVVYd3BZa0M0WmdhMnNRTW9mU080VGRXdFZ2Z0hrSnFnZk5xcEIxZWNvcTRR?=
 =?utf-8?B?a2toakJDdEdEZ3RhMFJpZy9sYmk1TlhkSXgycHRGQzJXUmRYM09KS2VlUG9x?=
 =?utf-8?B?dThOU2ZnMkNyNFNrMVNZU01KMExRUHQvdDROZ0hpamNTa1dlazdOVk1iOGRE?=
 =?utf-8?B?NkpFTkYzZnFVbjN2UVRJR1EwVDZ5UUtWTGxMclYxRmgwSkE0SXFqY1hLMkZU?=
 =?utf-8?B?dHlGeG1kODNINlE1UEhGODZ5UGxxQ3ozVlNuZnlpcHBjQTVwVENwdzY2RHpD?=
 =?utf-8?B?dGwyT283ejk2ZDMrS1FQeWp3dkhaL0IvKzE5WmhKOW5kTm81U3hOZGh0OG02?=
 =?utf-8?Q?CzrJbi9zrwNgFJgKiqIW3EQsw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(13003099007)(38070700021)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU9iSndDNEFIbTJ5NXplMFl5ZUtJcS9oajY5MkxXMkVMK05leE1DUnNtK3Ra?=
 =?utf-8?B?WGNLbXZ5QVd0ekxDOStaRndvZzhqeEVBclRsZVF2VVRoYndiQ1NPL1hiVDJI?=
 =?utf-8?B?dm42TXA1K2FUMk92cUhlUllmdGdXdGlZTytQRUo0WEtYdVZlcnZMbG1QZ1JQ?=
 =?utf-8?B?R0ZPTzhLOVp0cUpDYitRaytHeEF6aUxlVlVQS3RveU1YQjMyMzNld01CbEFp?=
 =?utf-8?B?b3dXb2RjN3Brb20zdVkyd1J1OHZJRjhZMWJReUUvTVRKbEVkTjgxUkNJZThv?=
 =?utf-8?B?MHlXNFBJSXpvemdORVRGSlEvd2IyMldXNmM5YWc3NlVBeERJb2xEN2dmQVlS?=
 =?utf-8?B?NnFXR3AyMzloT3JtUnREN3RObHFDNWROU1orOUFseUdUeGdZb2didUtLUXl2?=
 =?utf-8?B?VVZUSm53b3U4TFZHSElNQmNLWTU5S3FNSkRNcUQ3ZW9GMmROWGxzV2dwSGtw?=
 =?utf-8?B?ODdDaWp5d1VtaG5TQnVaNVlKemJ5SXh6STJqcHZ6dnBXZ2xDYUhPTHJCT1Vr?=
 =?utf-8?B?WUwrZXNtWEl2bThaSVVldEQ4Sk9lQXFGSUhNZ1BlRDRuUHB3OG85TzJCaUxt?=
 =?utf-8?B?WXp4azFieEhmRHJkYmhNZDZYb0VLS2ZWekVvemh0cmp5OHovaTdad1k4YUpM?=
 =?utf-8?B?VW4relZ6TFdTRVA2N1ZkbXc0OU14Ym10OHlValFtalcvU21LMFBiU1hSUUpR?=
 =?utf-8?B?OFRPWTQ4OXpacHNSMnRqNTlyNk9QU2Z4WFNmengyR3M2YzVYaXFtYTlOWENi?=
 =?utf-8?B?dVoxOTcyZ21telpVV1VkbWtHY1pTZ0xQUjkwaTRhVVFrcTQ0S3BUNlhiUjJm?=
 =?utf-8?B?WEM1dzJkOS9lRk1DYVl0SGR6Y0lXZFNoS0EvckljMGExSXN1dXhqTjR3OVBt?=
 =?utf-8?B?Z3ZiS3hVVS94STBtakl5YnAyV1BqMVh5Rk9ZSThMdkRwRkZDYXpvM3hQOHVG?=
 =?utf-8?B?RlQvZEI4UzJCQjV6a1hydFpzRnV1NlZ0T2o4R015cTlqTitFZmUvM2svS1BW?=
 =?utf-8?B?eXVBSXlNQmhWak5oa1I3YWhSTHFLTkJCWkJCU1EyN0FDLzlIdlZRTDQ2VkE3?=
 =?utf-8?B?VnJDM0xNUldvdlJnQlVBcmlEQkdQMGhVZDkrN005NklENENvZUhGWXJCZHJV?=
 =?utf-8?B?REJINXloT2FKa0JoMWxicW94ZFhiaHh2eTYxTmJSNUFmZHhpSWJzNTlrOC95?=
 =?utf-8?B?NExrUkhOd2VpNGlocWF4enF3UTJmcXRMbVQ2Wmgvc1FOZDJhdlVKUVJhOUNZ?=
 =?utf-8?B?N29DL2V3YzNVeVJIYmcreExraUFVY2ZtaUtXTzlRZUljUUptTXZwblRtaEJC?=
 =?utf-8?B?NlZtRGFyTWYyQmtmMFgrNmFxOUFEWHdPVllEbFZiWTRNRks3clpTQnZZcTIv?=
 =?utf-8?B?TDN0SWhzbUpiSzZEVXN6OEdRUE1vTVZiQXBDckZnS2VtUzJpYUdHSWo5M0I3?=
 =?utf-8?B?NXNyZ1JMNFltcnJnOXpPSmtkZHhob0lQd1c3QTdaakkvS2lsVkdYRDBtMVlK?=
 =?utf-8?B?ZHJ1TVNMZHNYQjhlYUh4dFBsdWUvbHlpSGFLQjJoSnNJVzdWUnlYMXlTT0Fq?=
 =?utf-8?B?RGFzKzRscmM3eEpEbnpoRlFFT2U5eDVCSFdEZ2RudWg2bWlhSVhIVDJRc3hX?=
 =?utf-8?B?Wm9XYjNOblpxb0R2cXIvNElZNGF0T1ZjMFRjWXNqQWNoeE9VdDdsT3dSR1pC?=
 =?utf-8?B?Sis5LzhBWDc4YjlNUjUvMjVZSWd5WVZwQjNkWlpZOUNCMEFhaXlPR1I2MzI3?=
 =?utf-8?B?UFlTNkJvdFJyb0dlZnM2TkJrMWdrSkxaaTI0MlVjV3NTWXlVc1hFZ3N0NEJz?=
 =?utf-8?B?dDVxU2syNU02Qm9jU3hFN3UyZEJrbHp6WUR6eUl4M2tQb0ZVaWtSeGhid2Fl?=
 =?utf-8?B?eWpRWjdLaTZXNGJXQVZ5d3JiU1l2ODk5cFpIbk1XSWhwVTNaSGFnSk0yZTh0?=
 =?utf-8?B?akpOY1hJZ09GSnE0Wi9tS3RMSTNSd1A0c0tsZ2FCVGxTYnNSdFVQZEFvNWxq?=
 =?utf-8?B?NFEzWFB3UFd5eUhQR1VucnRuVVNIUzFHYytuVTBRWmVOMzhpZXY1elpHVTlo?=
 =?utf-8?B?aTVScmFoalZFaDdPK20xNFIvenYxckptaHVKUXVkTTNGNWV6bGhRZTFVZEx2?=
 =?utf-8?B?bW5lak85TDh3MUd3eWNmeGNDOWdpYUwvV0xHUnJaWGdWLy9XVGhFRU9rNGox?=
 =?utf-8?B?ZFVGU2dDcTY3WlMrY3BGV0ZUTVhDWG5OTW44dlc5Ti8ydndGZnN2akU3ZmJT?=
 =?utf-8?B?SlZ1eWxTK1NiSXFsRG5FVUdLK0hpcHBHaFpQbTZ1Zjg2UUd3WnE1RXJRNC9F?=
 =?utf-8?B?dndhcm96NTJvNGJ4NkFlNUJuMEI3dGlNekxzeW13Uk9ISGFEQUF6RXYyWG43?=
 =?utf-8?Q?rEI1OAPXDn3H1D6NJdKtwRBuse5hjZI2PUANv6QfQ0E9p?=
x-ms-exchange-antispam-messagedata-1: mduJJsOubtA7P2x/Ku121nB2xx8j7lWGxfk=
Content-Type: multipart/alternative;
 boundary="_000_cb224319592d04458257880b7e9e4a597de3a5a1camelintelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e409941d-5c48-4d1f-21b1-08de62247b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 06:29:55.5007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHHCVMtCqauejtDwvSsMFTiqP17iFNmS6vMzxrBpjgVHlAi4U8pKk7QzW7VDOtt/L3pSaT/VTGcyxbDqYM2FZyA2Hdt7RwzU8P8SWpGX2LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8008
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

--_000_cb224319592d04458257880b7e9e4a597de3a5a1camelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQWxsLA0KDQpQb3NzaWJsZSByZWdyZXNzaW9uIHJlcG9ydGVkIGJ5IENJIGlzbid0IHJl
bGF0ZWQgdG8gbXkgcGF0Y2ggc2V0LiBTZWVtcyB0byBiZSBub24tZGlzcGxheSB0ZXN0Y2FzZSBv
biBzZXR1cCBub3Qgc3VwcG9ydGluZyBQU1Igb3IgUFIuDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVy
DQoNCk9uIFdlZCwgMjAyNi0wMS0yOCBhdCAwOTo0NiArMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0K
UGF0Y2ggRGV0YWlscw0KU2VyaWVzOiBVc2UgdHJhbnMgcHVzaCBtZWNoYW5pc20gdG8gZ2VuZXJh
dGUgZnJhbWUgY2hhbmdlIGV2ZW50IChyZXYxMSkNClVSTDogICAgaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzk4MzEvDQpTdGF0ZTogIGZhaWx1cmUNCkRldGFpbHM6
ICAgICAgICBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0x
Mzk4MzF2MTEvaW5kZXguaHRtbA0KQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSB4ZS00NDY0LTIz
ZWJiNDMwMDZiODg3MzYzYmQ2NjUzZmJjNGEzMjdmZDMwNzIyMjZfQkFUIC0+IHhlLXB3LTEzOTgz
MXYxMV9CQVQNClN1bW1hcnkNCg0KRkFJTFVSRQ0KDQpTZXJpb3VzIHVua25vd24gY2hhbmdlcyBj
b21pbmcgd2l0aCB4ZS1wdy0xMzk4MzF2MTFfQkFUIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KdmVy
aWZpZWQgbWFudWFsbHkuDQoNCklmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZl
IG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KaW50cm9kdWNlZCBpbiB4ZS1wdy0xMzk4
MzF2MTFfQkFULCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQp0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCg0K
UGFydGljaXBhdGluZyBob3N0cyAoMTIgLT4gMTIpDQoNCk5vIGNoYW5nZXMgaW4gcGFydGljaXBh
dGluZyBob3N0cw0KDQpQb3NzaWJsZSBuZXcgaXNzdWVzDQoNCkhlcmUgYXJlIHRoZSB1bmtub3du
IGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4geGUtcHctMTM5ODMxdjEx
X0JBVDoNCg0KSUdUIGNoYW5nZXMNClBvc3NpYmxlIHJlZ3Jlc3Npb25zDQoNCiAgKiAgIGlndEB4
ZV9leGVjX2Jhc2ljQG11bHRpZ3B1LW1hbnktZXhlY3F1ZXVlcy1tYW55LXZtLXVzZXJwdHItaW52
YWxpZGF0ZToNCiAgICAgKiAgIGJhdC1ibWctMzogUEFTUzxodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9pbnRlbC14ZS94ZS00NDY0LTIzZWJiNDMwMDZiODg3MzYzYmQ2NjUzZmJjNGEz
MjdmZDMwNzIyMjYvYmF0LWJtZy0zL2lndEB4ZV9leGVjX2Jhc2ljQG11bHRpZ3B1LW1hbnktZXhl
Y3F1ZXVlcy1tYW55LXZtLXVzZXJwdHItaW52YWxpZGF0ZS5odG1sPiAtPiBJTkNPTVBMRVRFPGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTEzOTgzMXYxMS9i
YXQtYm1nLTMvaWd0QHhlX2V4ZWNfYmFzaWNAbXVsdGlncHUtbWFueS1leGVjcXVldWVzLW1hbnkt
dm0tdXNlcnB0ci1pbnZhbGlkYXRlLmh0bWw+DQoNCktub3duIGlzc3Vlcw0KDQpIZXJlIGFyZSB0
aGUgY2hhbmdlcyBmb3VuZCBpbiB4ZS1wdy0xMzk4MzF2MTFfQkFUIHRoYXQgY29tZSBmcm9tIGtu
b3duIGlzc3VlczoNCg0KSUdUIGNoYW5nZXMNCklzc3VlcyBoaXQNCg0KICAqICAgaWd0QHhlX3dh
aXRmZW5jZUBlbmdpbmU6DQogICAgICogICBiYXQtZGcyLW9lbTI6IFBBU1M8aHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtNDQ2NC0yM2ViYjQzMDA2Yjg4NzM2M2Jk
NjY1M2ZiYzRhMzI3ZmQzMDcyMjI2L2JhdC1kZzItb2VtMi9pZ3RAeGVfd2FpdGZlbmNlQGVuZ2lu
ZS5odG1sPiAtPiBGQUlMPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhl
L3hlLXB3LTEzOTgzMXYxMS9iYXQtZGcyLW9lbTIvaWd0QHhlX3dhaXRmZW5jZUBlbmdpbmUuaHRt
bD4gKEludGVsIFhFIzY1MTk8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9r
ZXJuZWwvaXNzdWVzLzY1MTk+KQ0KDQpCdWlsZCBjaGFuZ2VzDQoNCiAgKiAgIExpbnV4OiB4ZS00
NDY0LTIzZWJiNDMwMDZiODg3MzYzYmQ2NjUzZmJjNGEzMjdmZDMwNzIyMjYgLT4geGUtcHctMTM5
ODMxdjExDQoNCklHVF84NzIxOiAzNzA3YmI0MjY3ZGUyMmExOGQ2MWIyMzJjNGFiNWZiYWY2MWRi
OTBjIEAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdp
dA0KeGUtNDQ2NC0yM2ViYjQzMDA2Yjg4NzM2M2JkNjY1M2ZiYzRhMzI3ZmQzMDcyMjI2OiAyM2Vi
YjQzMDA2Yjg4NzM2M2JkNjY1M2ZiYzRhMzI3ZmQzMDcyMjI2DQp4ZS1wdy0xMzk4MzF2MTE6IDEz
OTgzMXYxMQ0KDQo=

--_000_cb224319592d04458257880b7e9e4a597de3a5a1camelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <30F9CAB701775448BFCCDD5B77C15D18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjx0aXRsZT5Qcm9qZWN0IExpc3QgLSBQYXRjaHdv
cms8L3RpdGxlPg0KPHN0eWxlIGlkPSJjc3MtdGFibGUtc2VsZWN0IiB0eXBlPSJ0ZXh0L2NzcyI+
DQogICB0ZCB7IHBhZGRpbmc6IDJwdDsgfQ0KICA8L3N0eWxlPjxzdHlsZT5wcmUsY29kZSxhZGRy
ZXNzIHsNCiAgbWFyZ2luOiAwcHg7DQp9DQpoMSxoMixoMyxoNCxoNSxoNiB7DQogIG1hcmdpbi10
b3A6IDAuMmVtOw0KICBtYXJnaW4tYm90dG9tOiAwLjJlbTsNCn0NCm9sLHVsIHsNCiAgbWFyZ2lu
LXRvcDogMGVtOw0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQpibG9ja3F1b3RlIHsNCiAgbWFy
Z2luLXRvcDogMGVtOw0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQo8L3N0eWxlPg0KPC9oZWFk
Pg0KPGJvZHk+DQo8ZGl2PkhlbGxvIEFsbCw8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
PlBvc3NpYmxlIHJlZ3Jlc3Npb24gcmVwb3J0ZWQgYnkgQ0kgaXNuJ3QgcmVsYXRlZCB0byBteSBw
YXRjaCBzZXQuIFNlZW1zIHRvIGJlIG5vbi1kaXNwbGF5IHRlc3RjYXNlIG9uIHNldHVwIG5vdCBz
dXBwb3J0aW5nIFBTUiBvciBQUi48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkJSLDwv
ZGl2Pg0KPGRpdj5Kb3VuaSBIw7ZnYW5kZXI8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
Pk9uIFdlZCwgMjAyNi0wMS0yOCBhdCAwOTo0NiArMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOjwvZGl2
Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3Jk
ZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGI+UGF0
Y2ggRGV0YWlsczwvYj48L2Rpdj4NCjxkaXY+DQo8dGFibGU+DQo8dGJvZHk+DQo8dHI+DQo8dGQ+
PGI+U2VyaWVzOjwvYj48L3RkPg0KPHRkPlVzZSB0cmFucyBwdXNoIG1lY2hhbmlzbSB0byBnZW5l
cmF0ZSBmcmFtZSBjaGFuZ2UgZXZlbnQgKHJldjExKTwvdGQ+DQo8L3RyPg0KPHRyPg0KPHRkPjxi
PlVSTDo8L2I+PC90ZD4NCjx0ZD48YSBocmVmPSJodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzEzOTgzMS8iPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTM5ODMxLzwvYT48L3RkPg0KPC90cj4NCjx0cj4NCjx0ZD48Yj5TdGF0ZTo8L2I+PC90
ZD4NCjx0ZD5mYWlsdXJlPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQ+PGI+RGV0YWlsczo8L2I+PC90
ZD4NCjx0ZD48YSBocmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14
ZS94ZS1wdy0xMzk4MzF2MTEvaW5kZXguaHRtbCI+aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvaW50ZWwteGUveGUtcHctMTM5ODMxdjExL2luZGV4Lmh0bWw8L2E+PC90ZD4NCjwvdHI+
DQo8L3Rib2R5Pg0KPC90YWJsZT4NCjwvZGl2Pg0KPGgxPkNJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZy
b20geGUtNDQ2NC0yM2ViYjQzMDA2Yjg4NzM2M2JkNjY1M2ZiYzRhMzI3ZmQzMDcyMjI2X0JBVCAt
Jmd0OyB4ZS1wdy0xMzk4MzF2MTFfQkFUPC9oMT4NCjxoMj5TdW1tYXJ5PC9oMj4NCjxwPjxzdHJv
bmc+RkFJTFVSRTwvc3Ryb25nPjwvcD4NCjxwPlNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWlu
ZyB3aXRoIHhlLXB3LTEzOTgzMXYxMV9CQVQgYWJzb2x1dGVseSBuZWVkIHRvIGJlPGJyPg0KdmVy
aWZpZWQgbWFudWFsbHkuPC9wPg0KPHA+SWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2Vz
IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzPGJyPg0KaW50cm9kdWNlZCBpbiB4
ZS1wdy0xMzk4MzF2MTFfQkFULCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2kt
aW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtPGJyPg0KdG8gZG9jdW1l
bnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2
ZXMgaW4gQ0kuPC9wPg0KPGgyPlBhcnRpY2lwYXRpbmcgaG9zdHMgKDEyIC0mZ3Q7IDEyKTwvaDI+
DQo8cD5ObyBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHM8L3A+DQo8aDI+UG9zc2libGUg
bmV3IGlzc3VlczwvaDI+DQo8cD5IZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5
IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIHhlLXB3LTEzOTgzMXYxMV9CQVQ6PC9wPg0KPGgzPklH
VCBjaGFuZ2VzPC9oMz4NCjxoND5Qb3NzaWJsZSByZWdyZXNzaW9uczwvaDQ+DQo8dWw+DQo8bGk+
aWd0QHhlX2V4ZWNfYmFzaWNAbXVsdGlncHUtbWFueS1leGVjcXVldWVzLW1hbnktdm0tdXNlcnB0
ci1pbnZhbGlkYXRlOg0KPHVsPg0KPGxpPmJhdC1ibWctMzogPGEgaHJlZj0iaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtNDQ2NC0yM2ViYjQzMDA2Yjg4NzM2M2Jk
NjY1M2ZiYzRhMzI3ZmQzMDcyMjI2L2JhdC1ibWctMy9pZ3RAeGVfZXhlY19iYXNpY0BtdWx0aWdw
dS1tYW55LWV4ZWNxdWV1ZXMtbWFueS12bS11c2VycHRyLWludmFsaWRhdGUuaHRtbCI+DQpQQVNT
PC9hPiAtJmd0OyA8YSBocmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRl
bC14ZS94ZS1wdy0xMzk4MzF2MTEvYmF0LWJtZy0zL2lndEB4ZV9leGVjX2Jhc2ljQG11bHRpZ3B1
LW1hbnktZXhlY3F1ZXVlcy1tYW55LXZtLXVzZXJwdHItaW52YWxpZGF0ZS5odG1sIj4NCklOQ09N
UExFVEU8L2E+PC9saT48L3VsPg0KPC9saT48L3VsPg0KPGgyPktub3duIGlzc3VlczwvaDI+DQo8
cD5IZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiB4ZS1wdy0xMzk4MzF2MTFfQkFUIHRoYXQg
Y29tZSBmcm9tIGtub3duIGlzc3Vlczo8L3A+DQo8aDM+SUdUIGNoYW5nZXM8L2gzPg0KPGg0Pklz
c3VlcyBoaXQ8L2g0Pg0KPHVsPg0KPGxpPmlndEB4ZV93YWl0ZmVuY2VAZW5naW5lOg0KPHVsPg0K
PGxpPmJhdC1kZzItb2VtMjogPGEgaHJlZj0iaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvaW50ZWwteGUveGUtNDQ2NC0yM2ViYjQzMDA2Yjg4NzM2M2JkNjY1M2ZiYzRhMzI3ZmQzMDcy
MjI2L2JhdC1kZzItb2VtMi9pZ3RAeGVfd2FpdGZlbmNlQGVuZ2luZS5odG1sIj4NClBBU1M8L2E+
IC0mZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhl
L3hlLXB3LTEzOTgzMXYxMS9iYXQtZGcyLW9lbTIvaWd0QHhlX3dhaXRmZW5jZUBlbmdpbmUuaHRt
bCI+DQpGQUlMPC9hPiAoPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS94ZS9rZXJuZWwvaXNzdWVzLzY1MTkiPkludGVsIFhFIzY1MTk8L2E+KTwvbGk+PC91bD4NCjwv
bGk+PC91bD4NCjxoMj5CdWlsZCBjaGFuZ2VzPC9oMj4NCjx1bD4NCjxsaT5MaW51eDogeGUtNDQ2
NC0yM2ViYjQzMDA2Yjg4NzM2M2JkNjY1M2ZiYzRhMzI3ZmQzMDcyMjI2IC0mZ3Q7IHhlLXB3LTEz
OTgzMXYxMTwvbGk+PC91bD4NCjxwPklHVF84NzIxOiAzNzA3YmI0MjY3ZGUyMmExOGQ2MWIyMzJj
NGFiNWZiYWY2MWRiOTBjIEAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3Qt
Z3B1LXRvb2xzLmdpdDxicj4NCnhlLTQ0NjQtMjNlYmI0MzAwNmI4ODczNjNiZDY2NTNmYmM0YTMy
N2ZkMzA3MjIyNjogMjNlYmI0MzAwNmI4ODczNjNiZDY2NTNmYmM0YTMyN2ZkMzA3MjIyNjxicj4N
CnhlLXB3LTEzOTgzMXYxMTogMTM5ODMxdjExPC9wPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+
DQo8L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_cb224319592d04458257880b7e9e4a597de3a5a1camelintelcom_--
