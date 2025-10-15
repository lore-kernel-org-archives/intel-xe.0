Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D6ECCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E917510E8AB;
	Wed, 15 Oct 2025 18:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVg2zKcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B495110E8AB
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760551270; x=1792087270;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FHnQu45hPCdV8tk9TVjFF0VqlCVd9TQYhK5ixEWhbu4=;
 b=AVg2zKcdIVDtjetdWSpNTyMWTI3pmQy3XBINYEPS0OI4wlCEHWq+3gKr
 ydIi74ZcQmvyfzcjR/Z2OWEkY3Xe9dJaswd4TQmouj32YJfxdxGpL5PbD
 nxn+2yVTlSDQ7IxiH6NLNBkAovhq7A6t/TIhQbHtOTbjMCg7haeaZI+ZF
 wj5F3qwdDudQ5KdEfen3jfW3ZIqGNtVpgpmIyF9S3eEwdtxx+LfkwWeCs
 jyiAMYjT3/GoLfwZ1+eafQmkURfXwgt4dM1B3wHMRDt747vh2W3snCtUJ
 lv0CLk37ecwSkFHge1gKqQuYUnimBJigdrcu0KBha714G8moOvse2pZ4w Q==;
X-CSE-ConnectionGUID: sQYFbqbRT7WByB4FF4QSpQ==
X-CSE-MsgGUID: kru1/VgwSCevznvrym6/Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62664397"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62664397"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:01:09 -0700
X-CSE-ConnectionGUID: Sgby3HiqRAaBWyPC4cM16Q==
X-CSE-MsgGUID: Fnl+x5XWT8uYZSsuU1qV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182648016"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:01:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:01:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:01:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyFpKsjT3haxEdnqHTBjJQyz9m3psZCsZ+cFtdJT7eRWXXYF9K8WT6tQLuxMjEaJJbEjETduFYpl1OHUPMHRZSfBONR7WWy+5AJt3vFjU2LuCRt3YrTYfxbB3HM2bJjWzu8/NoHL2gLfeh2QdzjrPQXFDYp9yC49D6jurnbSh9mgrcyog2m1fz13eQ+Ta0rbbRzH8JniaaDWTMcWskrX1Sb+EJSxkUQtXSoS308RBfu4H6ef/o5O/AV3RMmivw4EZYI/ivjg3UcMFndu/ciImOnwq5b4n3FXhyYNUMfUux8i2Nq39z0JlmiZYMAJaGhiILd3jwKoA+9Dd2AcgWOnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHnQu45hPCdV8tk9TVjFF0VqlCVd9TQYhK5ixEWhbu4=;
 b=XlAy8oWx5lwG1V7lgDRzr6Zo1YIWedxwm8Mds3oGreNlM2UUUngC/R0z31EqD+14SpESifQTJOZoRys8qEz5/MsG+2zvF1amdUu7RtsiMfzdtwrMsiWb7alFvvm8XAYHSP1LNEvatWvDCOnBKYZpUE6O5IoduTd8VMvl4vUH+GTIJN5ojceh6W8NGQ35Ugmm3P2to+F6D8/Gdc6XvyreRPsztl/H6Jcrw3MuVG9q1s+NlSO2yHcew6G8BA+QUAuzWVz7TCI2h2EQ7UtndKFonbXtHwRQMnTbDq4pq6hUAbUJMFjHQhpV7RZ8ferMe+LvT/77PhlXHa/jeY2rDRSU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Wed, 15 Oct 2025 18:01:00 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 18:01:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Topic: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Index: AQHcPLwi64tkWwNSlUKp2dQn70WvpbTDctMAgAAPB4A=
Date: Wed, 15 Oct 2025 18:01:00 +0000
Message-ID: <14bbd55cc2e92dc8b70fd894a955e2785dc74204.camel@intel.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456BE10B3AFD01CA3AC61CBEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456BE10B3AFD01CA3AC61CBEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7922:EE_
x-ms-office365-filtering-correlation-id: 40d08200-0de2-456e-16d3-08de0c14ccb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZjMrOHlQRFIxckxzV2JSaCtoVG0yelQ2ZTdDeDM0L3p4b0svbzI1WEk5eVFl?=
 =?utf-8?B?Mkc5TEFQaytSNXBVbW1RelJCeWUyQU92REF5N1VzcGtCS0d5RG5oRC9Uekx6?=
 =?utf-8?B?ckJZbWczUGFOTHJVR3lnVHMyZTllZlpHYjJtdE9VWFB5OUxORE5EVHRmQmYy?=
 =?utf-8?B?dCs2WStVeEZwMkVHdGp2c2c2T1YzUjJFZXgwZEpyTW5pWVJRditjV1JEbVkr?=
 =?utf-8?B?NThSdHV5S2k3ZlBUaklPc082UWp2TS8vdUNoSjFXaTlZZThUTlN4MUNOU2pa?=
 =?utf-8?B?a3dzcFBHL1hxajVqb0Zpa3VPQTJJZ1ZMcDdXM1EzTGJNbEJvVFNzRjRWVHkv?=
 =?utf-8?B?TkdsdkcxT0dIbGQzcmJoa2s2N2E5S2ZLcGszdlN0bEZqMFU4eEIrKzFBSmZB?=
 =?utf-8?B?alE1U3U0aG9tNXQzN0pCYzNobk1lSHBWTU8rcDNVMy9xVkk0a1M5T2dnVnNo?=
 =?utf-8?B?WEtmZ3Z3emdGeW9NVDlLUkUzb1ZnN3o2VXJ0NC9oWmlPci9nczdiT1NPcE83?=
 =?utf-8?B?ZEpVc083TmRHc3FxcFJaQnVoTHJ5UjllSEJBZ0dDNTcwOGFjQ0NpWFJqWmFO?=
 =?utf-8?B?OUdxb2l5SmdmRk9CS1VCQ1JIa1lzSUdGYldpM0Q3WlVlVHdHdEZrZ3FzcmN3?=
 =?utf-8?B?RVkrWS9sZnpFeVdQUFhQblA2Nzh0aGtCTCtjRWt1OXRDbE5BMzlLa2VPTzd6?=
 =?utf-8?B?dmVzdVRyemQwYnBCOE40UWxpakRLN0hTZko5L2tMVzRyUURUNlBrWmtsS0Fu?=
 =?utf-8?B?RHNYVFluK0xqTU1nMGJ1V3lRMk1zT0NJT3hzS1FUMWF1d0JZd0pCRWlpNTgr?=
 =?utf-8?B?SnFJYUdKVVZ6ZmdCWWo0NDFNYnhPTW1DdTNhRGVNU1FHRklDajFmVzBjRVpu?=
 =?utf-8?B?NW91SjA1cnltTTRnMVdYL1l2QjgzMENSaDdTa21LNnU0d2l5L3ZjVjVudThR?=
 =?utf-8?B?TmRUblg4TVdSTzA2VUJLdGMrZ0FFNXRzS0hoL2hQVjVnZnVQOTlCcm9jZ29S?=
 =?utf-8?B?TnVJMVF1elBDUjBvUTkyVDRidlpwcTUrK0JBYW14VFg1QTVRdVlPRlUxUDl5?=
 =?utf-8?B?Zyt0WWYrY0htQlE0WHNod2lZdkJsdlEzK05wTTZwUUorcXhLbVgwb0swVk1Q?=
 =?utf-8?B?OXgwUnZGbS9sTlNVZEhuZUNBL3JYYXN1SEoydENaTGcxRDhRWHhkTmEzVmVj?=
 =?utf-8?B?bDBtdURFV0svbURvMmJXc0RINWFwZmRuRGp2cC90Mi9Od3c1N1BLRnNXbm43?=
 =?utf-8?B?MzdkYjBLUHhVeGE2TEpjT2tMb0FBWkJIckdTd29tZWxtbGk5ZVBBeFFOQnFa?=
 =?utf-8?B?QzlCTFJ6MFRDVGN6QXBPcHArRXdacTRiTDFRU2JhYUpUdHBEV2F5YVdDYXNX?=
 =?utf-8?B?VXc5S3duUmJVS0M5Mkw5NDNnL3AzSVk3cEt2NjExckVQMmV5eXZmZXdGUVU2?=
 =?utf-8?B?YW4rWnlqNm9tQXRyU2VZM2RtTVJEaURqbjlDeWNWM0lVTGNNTkNLNUtTWEdQ?=
 =?utf-8?B?VWE4bnJNWkFPZXphM1dXMDJyek5ZM0F3WTRLSkdDdVB4R2VISzhKREFFWnVJ?=
 =?utf-8?B?MUpUdEJqQndCRkszY1NKMjJjZVJoaVc1NldYRG54T21IeTVoMEtzN1BFL2VC?=
 =?utf-8?B?QmhpVU9JWVFTOXVxV2xwNTdWSzV2RlFDZm1STElnUk9kQUdWRTlRTjZoSW1q?=
 =?utf-8?B?cndYQndJMEl3MW9VSFBsN0JTOEZEQUhZR1VScVo1S0I4NFFta2duYXZTVDls?=
 =?utf-8?B?b2tqaDBPZ2hTencyTkkza1V0KzJHaWRFdUE5c1hFdTltT1pZcnpUVjhYRkpP?=
 =?utf-8?B?RWVyRWJva2w1MjV2Q2NXdmJLbEZHcDBKV294TjVrWDNqT0tEMXFJMkpzaUZM?=
 =?utf-8?B?eXZOb202c08wblhubWt3WFR5NUlHT2h5RzlabllCdjBHL3R6UjJUcHg4a09O?=
 =?utf-8?B?NURjSkF0SkNhUldYUnBCZTNSVWZJZDNqT3g3TmVMY3l2NkZFdlNLSERtMDBy?=
 =?utf-8?B?cWRCeUVvdStnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjVBYmdudGtsWmliOEYvUDUwNURZUzJFMnlIeUhNY0I4bTVsRE1BczdyMW1x?=
 =?utf-8?B?Vzd4cUdyTmtpb1FTQjh1MGRaZUR0TENEUU1zenF6SHpmcmd5OHFmblY2bitu?=
 =?utf-8?B?TkpwRXdWUFJCUlNmTXdoVWZwYnVoMWdRcVI5K0luU2xOVlRlTm42VThFZTVQ?=
 =?utf-8?B?ZDZUWTJIS3dzVktmZnJqbnVPaVVJd2dlWVdmOEdGSFBVSUFWQnRDeExoQkUx?=
 =?utf-8?B?TGRxdXg0SzhsZEQvSStVQ1N0MS9OMjNLMHB4UkRpeFR5Yys2OUROb3M1VDk0?=
 =?utf-8?B?UXNkZ2NFVG12L0ZTV0lNdkt2VVBDWi8zMkYxb2lrbW5sRXR5RXhwakxsVlBL?=
 =?utf-8?B?LzY0Sk04YkJROXlyaGszZHBVK2hNSEpqTGc4ZnlrNlE0UUViTFlkRjM3VHkr?=
 =?utf-8?B?NjhPaFpTYkJjMjl5clQyVW9OZmJiSnZYaEhHK0UvMGhSclFhMWpvZ001NFNY?=
 =?utf-8?B?bS9iRE9LV2ZRNzRZcVpEc3hDeDd0N1lLUlZJT0tlVTdvcTlyZ2VtNk9MWGdH?=
 =?utf-8?B?TkwxMFpMYXowN1lId2szcWdndnRuOXl2MWtVbWFHTVNqdlZFR1FBWXEvbUlL?=
 =?utf-8?B?ellxSVZseVVRZEFMaVcvZHc2R3MyUWNhUWU5WW12QnRRblgrWnd4anZtZ3l5?=
 =?utf-8?B?bitMNkI1UzJsNU1jQW9LZ0RHZ2Q1SjRnYmFFR0F1MnRxaGMzVUs4N09VRW5v?=
 =?utf-8?B?R29JZVM1aHNpMXUvZ2xQcUNZUmhqVzRRUDNNaEsraHBaMURjNHRHdldoVlNZ?=
 =?utf-8?B?RmlxR2RsT00rS2xOWVZsTkhFcVlYUGJlQkJ4NnNkbzdqaW1idndReXZQWENZ?=
 =?utf-8?B?eGtCTnA3dXVqTlVXU1hmbW9id25RdWJqTXZsK2pqbDZXQVlRRjVSSW5RTW50?=
 =?utf-8?B?YTd1c2k1M3BLMmtzZFN0WTk2OTJjTjhOSkxrYmpwTGlZYmJRZHZzY3htMTl3?=
 =?utf-8?B?OENJWW9KQU1QYUlKVEx6bXRBUXdqZ2xNbW82N2xrRmx2Qk9XNWZ2a0t5L0Ro?=
 =?utf-8?B?QkRaSXBwVnNscVlMVmNQT0xEbkk2amxKT2JUQ0xLSWdFdDk3NGZJazUvaVYx?=
 =?utf-8?B?aWtjcVFRMmRYWXRrZlRrcEhrUm53UWlLSjZNcDlZTWRSQVBCeG9FMmFnRm5C?=
 =?utf-8?B?dlV5U3BuUGJNWDViaWNlVlRkUk52Q1EzQVRoaW5SL1RPcndFOFJCOWlVWTBN?=
 =?utf-8?B?eEdHWEVIRW9DYnFLSERrYlIvTDlWV3dDdWdPK1dibHNoQmNiZHFmbExVK1Fl?=
 =?utf-8?B?OU12emk5MnFDSDVha01MOGpTWkJCeko1dEp2ekxPTnl3bEQ2VGhoVEFuTnI0?=
 =?utf-8?B?RURwbXlkK0dXN2s2RzVQR1RKaU8wM0JJeWtxMU1VYjNCdVQvSTBTNURscVZ5?=
 =?utf-8?B?MXNXYittT0ZoZ3VlTURsQ0ZKVFJ5YmU5ZzN3bUxJZEp1TlFmcTlSRzQwYjJU?=
 =?utf-8?B?Q3k3TlRwSjJvclpLdEF2ZTBjNUErRWh5MGRWVTFXZU9Sdm90M1crY0d0WUx5?=
 =?utf-8?B?eWZyNTluSXVYV2pGQWphMFk5eXBMVmVTZkRMM3ZJM0NLdVRTRHJuYmtOSVI4?=
 =?utf-8?B?c2E2ejR4WkNGeXZzQmtjUkd6dTR0T0ZjMGs2OWtqdlFiaytGMzIzaW4waktZ?=
 =?utf-8?B?QzJUU1Myb1pOclM3WisrNDBzTmIvKy9DaWdTdkZXbG9OSUxJY25ydEtBOGVa?=
 =?utf-8?B?U2NVei83YWNCb2lnbVBiNWlGbGNXNlNuU1VLSGtTR2JpUjZ4YUJCa1pGSzhV?=
 =?utf-8?B?bnhvZGdjZ2ZIQ1ZLOUF6UDE4S1h0TEQrVzBIQmgrOWpxZHdRWkVwb0ZtWW1t?=
 =?utf-8?B?bDBQMkQ2bW44OEh2Y0ZaQ08yWjFFQmcybXNpT3UvOExjNUozT1RsOW5mbU13?=
 =?utf-8?B?QnJyMnJjUFd5MWRCTFBIKzhVTEhvWCsyQ1lvc3lzVGd6TTVLb0V2eG1kNlA1?=
 =?utf-8?B?QWhTVXJvVWE1ZnFoY2wvUTZBL0RLSDlTV09ybWQweXRUTlNRenk5MlhRUy9G?=
 =?utf-8?B?NnhsZXdWTFFzNEQxNkZWckJtY25FY1NhR0QzRjZuaWVZcElTOEJvTDFXa2tV?=
 =?utf-8?B?ZEg5MTdzUE5MdUIwNmxMd25lU2JGSGpXRHFEVWN2UnJRcDhBQjgxV3RMd3Av?=
 =?utf-8?B?QU1yWTJUTGVyZXhkb2lWaEN1Mndrd2xUb0tib0VrQjdZbk5TZUVHd2owUWY1?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EC54C0B8FCEDE44A7AC9B1A1588E463@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d08200-0de2-456e-16d3-08de0c14ccb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 18:01:00.6176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jb5rlbaIFmNMG/ZZ0g6tp67epLj2947cmTAp/OOjiTIM9fzIkdM6XK3LjiCwW19KT0oP/aDDs4n2FLPAKJ/BG8/nIPYbmqHvZWFoFi4Ae6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDE3OjA3ICswMDAwLCBMaW4sIFNodWljaGVuZyB3cm90ZToN
Cj4gSGkgYWxsLA0KPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgcmV2aWV3IHRoZSBwYXRjaD8NCj4g
VGhhbmtzIGluIGFkdmFuY2UgZm9yIHlvdXIgdGltZSBhbmQgc3VwcG9ydCENCj4gDQo+IEJlc3Qg
UmVnYXJkcw0KPiBTaHVpY2hlbmcNCj4gDQo+IE9uIE1vbiwgT2N0wqAgMTMsIDIwMjUgODozNyBQ
TSBTaHVpY2hlbmcgTGluIHdyb3RlOg0KPiA+IER1cmluZyBMUiBleGVjIHF1ZXVlIGNsZWFudXAs
IGlmIHRoZSBHdUMgZmlybXdhcmUgaXMgbm90IHJ1bm5pbmcsDQo+ID4gdGhlIGRyaXZlcg0KPiA+
IGNhbm5vdCBjb21tdW5pY2F0ZSB3aXRoIHRoZSBHdUMgdG8gcHJvcGVybHkgZGVyZWdpc3RlciB0
aGUgZXhlYw0KPiA+IHF1ZXVlLiBJbg0KPiA+IHRoaXMgY2FzZSwgZGlyZWN0bHkgZGVzdHJveSB0
aGUgZXhlYyBxdWV1ZSBpbnN0ZWFkIG9mIGF0dGVtcHRpbmcNCj4gPiBkZXJlZ2lzdHJhdGlvbi4N
Cj4gPiANCj4gPiBUaGlzIHByZXZlbnRzIHNjaGVkdWxlIGRpc2FibGUgZmFpbHVyZSBhbmQgR3VD
IElEIHJlc291cmNlIGxlYWtzIGFzDQo+ID4gYmVsb3cNCj4gPiBkbWVzZyBsb2c6DQo+ID4gIg0K
PiA+IFvCoMKgIDUwLjI0MjU2NF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiBTY2hlZHVs
ZSBkaXNhYmxlIGZhaWxlZA0KPiA+IHRvDQo+ID4gcmVzcG9uZCwgZ3VjX2lkPTINCj4gPiBbwqDC
oCA1MC4yNDI1NjhdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+IFvC
oMKgIDUwLjI0MjU4NF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gQXNzZXJ0aW9uIGByZXRgIGZh
aWxlZCENCj4gPiAuLi4NCj4gPiBbwqDCoCA1MC4yNDQ5NDJdIHBjaSAwMDAwOjAzOjAwLjA6IFtk
cm1dICpFUlJPUiogR1QwOiBHVUMgSUQgbWFuYWdlcg0KPiA+IHVuY2xlYW4gKDEvNjU1MzUpDQo+
ID4gW8KgwqAgNTAuMjQ0OTcwXSBwY2kgMDAwMDowMzowMC4wOiBbZHJtXSBHVDA6wqDCoMKgwqAg
dG90YWwgNjU1MzUNCj4gPiBbwqDCoCA1MC4yNDUwMDJdIHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1d
IEdUMDrCoMKgwqDCoCB1c2VkIDENCj4gPiBbwqDCoCA1MC4yNDUwMzJdIHBjaSAwMDAwOjAzOjAw
LjA6IFtkcm1dIEdUMDrCoMKgwqDCoCByYW5nZSAyLi4yICgxKQ0KPiA+ICINCj4gPiANCj4gPiBG
aXhlczogOGFlOGEyZThkZDIxICgiZHJtL3hlOiBMb25nIHJ1bm5pbmcgam9iIHVwZGF0ZSIpDQo+
ID4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyB8IDEwICsrKysrKysr
Ky0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGluZGV4IDBl
ZjY3ZDM1MjNhNy4uZDJkZmJkYzgyOTIwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jDQo+ID4gQEAgLTQ3LDYgKzQ3LDggQEANCj4gPiDCoCNpbmNsdWRlICJ4ZV91Y19m
dy5oIg0KPiA+IMKgI2luY2x1ZGUgInhlX3ZtLmgiDQo+ID4gDQo+ID4gK3N0YXRpYyB2b2lkIF9f
Z3VjX2V4ZWNfcXVldWVfZGVzdHJveShzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdA0KPiA+ICt4
ZV9leGVjX3F1ZXVlICpxKTsNCj4gPiArDQo+ID4gwqBzdGF0aWMgc3RydWN0IHhlX2d1YyAqDQo+
ID4gwqBleGVjX3F1ZXVlX3RvX2d1YyhzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSnCoCB7IEBAIC0x
MDYwLDEwICsxMDYyLDE1DQo+ID4gQEANCj4gPiBzdGF0aWMgdm9pZCB4ZV9ndWNfZXhlY19xdWV1
ZV9scl9jbGVhbnVwKHN0cnVjdCB3b3JrX3N0cnVjdCAqdykNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
ICogc3RhdGUuDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAoIXdlZGdlZCAmJiBleGVjX3F1ZXVlX3JlZ2lzdGVyZWQocSkNCj4gPiAmJiAhZXhlY19xdWV1
ZV9kZXN0cm95ZWQocSkpIHsNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2d1YyAqZ3VjID0gZXhlY19xdWV1ZV90b19ndWMocSk7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc2V0X2V4ZWNfcXVldWVfYmFubmVkKHEpOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBJZiBHdUMgaXMgbm90IHJ1bm5pbmcsIGp1c3QgZGVzdHJv
eSB0aGUgZXhlYw0KPiA+IHF1ZXVlIGFzIHdlDQo+ID4gY2FuJ3QgY29tbXVuaWNhdGUgd2l0aCBp
dCAqLw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlX3VjX2Z3X2lz
X3J1bm5pbmcoJmd1Yy0+ZncpKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBfX2d1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koZ3VjLCBxKTsNCg0KSGV5
IFNodWljaGVuZywNCg0KTWF0dCBCLiBoYWQgYWxzbyBwb2ludGVkIG1lIHRvIHlvdXIgc2VyaWVz
IC0gSSBoYWQgbWlzc2VkIGl0IHNvbWVob3cuDQpJJ20gc2VlaW5nIHNvbWV0aGluZyBzaW1pbGFy
IGJ1dCBpbiB0aGUgd2VkZ2VkIHBhdGggYW5kIGhhdmUgYW4gaWRlYSBpbg0KWzFdLiBMZXQgbWUg
dGVzdCB5b3VyIGxhdGVzdCBjaGFuZ2VzIGhlcmUgYW5kIEknbGwgZ2V0IGJhY2sgaGVyZSAtDQpo
YXBweSB0byBnbyB3aXRoIHlvdXIgY2hhbmdlIGlmIGl0J3Mgd29ya2luZyAobm90IGEgZnVsbCBy
ZXZpZXcgaGVyZQ0KeWV0Li4pDQoNClRoYW5rcywNClN0dWFydA0KDQpbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTUzNTIvDQoNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gc2tpcF9kZXJlZ2lzdGVyOw0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gKw0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGlzYWJsZV9zY2hlZHVsaW5nX2RlcmVnaXN0ZXIoZ3Vj
LCBxKTsNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qDQo+ID4g
QEAgLTEwODgsNiArMTA5NSw3IEBAIHN0YXRpYyB2b2lkDQo+ID4geGVfZ3VjX2V4ZWNfcXVldWVf
bHJfY2xlYW51cChzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqdykNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+IA0KPiA+ICtz
a2lwX2RlcmVnaXN0ZXI6DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZXhlY19xdWV1ZV9raWxs
ZWQocSkgJiYgIXhlX2xyY19yaW5nX2lzX2lkbGUocS0NCj4gPiA+bHJjWzBdKSkNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2RldmNvcmVkdW1wKHEsIE5VTEwsICJMUiBq
b2IgY2xlYW51cCwNCj4gPiBndWNfaWQ9JWQiLCBxLQ0KPiA+ID4gZ3VjLT5pZCk7DQo+ID4gDQo+
ID4gLS0NCj4gPiAyLjQ5LjANCj4gDQoNCg==
