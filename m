Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D285BC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 09:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9650A10E16E;
	Fri, 23 Aug 2024 09:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyewyRi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164510E16E
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724404511; x=1755940511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LNj+pzILqeowJ7pGaQKYndDd+3nPLKvxWd0H0f/EPjw=;
 b=RyewyRi58gmqBI0NxBq485uOvta0O1aSM2irV3SpEd/wosh1xBPzCfII
 M98jvfp/qRPnW69iq46pp5x/WBx/8qtI29qAD370O8xVgqVRXrFj2l2vd
 yr/a0nBkMW6p87AOsixMzdswg7o13STR5Rp0yW8AGgDDQR49iD5LYRKl2
 pott5j2ogl/6JzjvGmYcEyIIGYCX/hltyHLXO5e/VrdnPk7UIYXEYWQIh
 OYqn7oEBwtAP7sSxmUSuijaEGF/XIdDVu2iswmosw4FDXFPSDTqo2CyHw
 RBnbFxlpZITJPJ2tH7aVO5qsbTjNqde+FNqXzrb0BMtUaJ5y9UY5Ljsw2 A==;
X-CSE-ConnectionGUID: dl/iIvqaRv6AS2Poc22BCA==
X-CSE-MsgGUID: KFAO029PTdGpuJv1ARpLXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40328104"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="40328104"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:15:09 -0700
X-CSE-ConnectionGUID: QAwgRfiqTuazhUGQhRVe0w==
X-CSE-MsgGUID: 7ZGN2SLSSK6Yu6qn1B05Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66670757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 02:15:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 02:15:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 02:15:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 02:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9KaZp1YsdRhrq//Lt+bbuhmqq7Pl4p/nAlgMR1ugd1rFczA97IJ0VV3iZLSJlF7k/WfsxxcKRMdo+tDFFXGjsE1DFNnLVwRcmpQVWsZLN8xjLm+mndoK3Z95gn2QfnGVgJaqzUoa4XvLs5WjSNRlJRVX5qfZtCbTNc+/lyuRYhq4xfCU4Ugf1rkR77xEXfGRpyPx+rG5daqz4x+8fHsbC6t2pu6As9OXnQ9gIIa/Qxpb/lhxxdtaCxyiPAcikslpRqt3z2t7ajWKp7Ki9yvBabEpmFPehNg2arXC86X3bM/S2InXcjQ/hM8QXQqHp9xZiemRAjpaUYcp5mRnKn+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNj+pzILqeowJ7pGaQKYndDd+3nPLKvxWd0H0f/EPjw=;
 b=FXe0VAmMvmKa87l9EV8nvUKIMbew0MpMGCfFEmbpN8UF2EwY5D4YBCaHalwv573tmor3eu8Bv2gY4tm6wZQm4VZGbSp4ZDxbvLGnnFCkSaybJdqF7TP0FqVrVkEavpQ7mbnFJ45sPeS9TM5fj3LkBCMWWE5nWp40j/lo5MCPQ2bP3BXLFTmbAZnhSJIclRZFQp6kHRTCO/ZMtiWejLjVkpElwVTOlgBrmAr5I9RuLjDhfeg1zt3ftunLfhX5aXzYI2wJtJ4I+ON31TMXsVX4UyOel+srLMiaytfKH82Ha68qDvI6VEzKBM0wafClt7//sV6j9ToWuDooTT23KSxceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 09:15:06 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.7897.021; Fri, 23 Aug 2024
 09:15:06 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>, "Syrjala,
 Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Topic: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Index: AQHa8yRxfJ4CHb70LEyCnWHhRM26erI0VNGAgAAbOgCAABrPgIAABssAgAAB84A=
Date: Fri, 23 Aug 2024 09:15:06 +0000
Message-ID: <99ee038d036eeb0b1e8c71a2e86c5df0fd7f0623.camel@intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
 <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
 <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <69f1c61b5d24b166f5ff3cfe966744c623969575.camel@intel.com>
In-Reply-To: <69f1c61b5d24b166f5ff3cfe966744c623969575.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA0PR11MB4656:EE_
x-ms-office365-filtering-correlation-id: 5927484f-cf66-4dc0-c083-08dcc3541411
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OXZUOUUvM3R2S244UFh3b005aWovZmpGZktzVndibkxuM2doMGR6aW1ZYUdV?=
 =?utf-8?B?MEtqT3RzWW1pMkRPRUlYNGQ0MEg4NStwb1Boc2RCQUhqWk5kNXdJNGRPTW8v?=
 =?utf-8?B?TXZ4Q1RuazVuU2VSTmxNTVlFOUl5b1RhTkQvM044amFoMCtuWTd4bDNTR085?=
 =?utf-8?B?TndrOS9VR2VUK3N5RnRZdmZaQnN4cFJNMjdaemVCS3Ivdk9OeFpuMkY2M3N2?=
 =?utf-8?B?c0x0dlBrRDRueVZBYU5xbEViTWF5MXlBTzBNaXBZZ0g5cmFvYmZkdUpYV3hQ?=
 =?utf-8?B?WDJvT0EwOTgvMmZPUit3MGZmZkRFRU9uOW03YUhqc0VnYU92Q2FMU3RjN1l3?=
 =?utf-8?B?NktSREI3QUMrZ1hXM3JiMHFvRVA1bmFRVEZoWC9kdUVmVFB0UDB2WHh2L3Jm?=
 =?utf-8?B?VjBSczFuMlZDMDEvaENBWVVJY0dnb3EzcWpJL2ZtMERBb1NZYXcrTUtldmox?=
 =?utf-8?B?RmdwMmo5WGU3SlpNM2VicTJvVTNZWUNCREltNFRxdTNXTFdWZ1VaWC8zS29u?=
 =?utf-8?B?SG03TlhJbnhOMGlLcDdnRnpKRmVVTGdqTHA4VldZWHVwOXd6eDlXRWlMY3VW?=
 =?utf-8?B?cEpXNFpkR0hNMFphWVN1SGtPWTIxY2xFZ2RTL3lOZTh0RUhEang5TFgvSEhG?=
 =?utf-8?B?VGswdDdGdW9aN3JkT3FldTc2bEVYVWk1N2twRmhYTE5Ta2RiQ3RSYitxUEE3?=
 =?utf-8?B?bStkV2V6VDRzaFcrV0xrZEtiZ2N2NGo5cjlYTlVveUF1RWxoRHhpNEpTYjd0?=
 =?utf-8?B?aWxQWEEwMDVsUTYwbFQ4Q2ZvY00xQ1BvMTMwTWdTS1FVbHg2TjB1QXdySERk?=
 =?utf-8?B?amFEeG5PY0UzTnhKNnlnbXIyZ0x0bWZiMlNNeGxTemhzSDNmY0ZGRGZyUUNS?=
 =?utf-8?B?NjA2Q2VGNGpmZS9PYUhKUUFnVGR2bXNRWENoU3R6VW1tL2FzMHBtb2NxVUFR?=
 =?utf-8?B?NGVydFc4YXlldmlzRHRJangvNmtYdFpDc3Jwc1NVTFZ3ME5Tem4vSVNNcXNh?=
 =?utf-8?B?S2NRTkZXN1FldUkzMVB4TzhobkRJbHRkNWhDbE5qbm5ueklyM0lIV3hrZVBM?=
 =?utf-8?B?V0p6VzVYQUhicWVwZnFRN1BPQTI1SVBSaEpQK1VydXVSSVZId3N6ODNkaWNM?=
 =?utf-8?B?MzhNdXdoMVdobzlQeHF4OWNFdC82aHZVSmhhNS9BS2VTdC9IUkoreHpsY1hX?=
 =?utf-8?B?bWo4enE4Nmw2cGFhM1RvaGxVWW9lVWR5T0RKRkZSMXNFakozcTF5MGtsR3Jz?=
 =?utf-8?B?SWhVdW11K3c1T3lXNFIydFgzSVl2UlVaN3Q3WGFLQ1ZabWtYdmlhTXV1SDhF?=
 =?utf-8?B?S29LWU14NXd2L2pKUnZkVDhTWE96OGp3U2JJeXdnNS9PYktUemFVRmpBK01i?=
 =?utf-8?B?cThBSzhzNm5lZDFGTVNFeTFNUG9FTEs5d2ZmRTMyNDV5d1hCd3pORkV3S2I1?=
 =?utf-8?B?aXE5eEQ3TDlEUDhFYlNiY3VvUld2WkMxNVlnREtYb3NvbjZIam5MYnBXQzBV?=
 =?utf-8?B?N1VHclRCZ1VWbFdKOTRuaEw0S3BIdkh0ZHZ5L08zUnBJeVV3QWRhZXZTMXBD?=
 =?utf-8?B?R2xFT2I0VVhoMFBLVVFPb1JlU3ExdzRobXZ1dWRnaWtQOUpkSEFEcTVKQlBP?=
 =?utf-8?B?a0lNdzR2QUdseCtFdmdrTlpncXZuV0c0cGNHZ25qaUNzRXV6a3c0UHpieDZY?=
 =?utf-8?B?ZG9OeEx4RnQveFpudDBlMHlmZGVibDZGclpBcExYUGJoTk9WZUhSQXRjM3JS?=
 =?utf-8?B?eExleklyN3dHRGJWaFhuR0Y1Z2xzUkcwNWV2VlVGNTdIRTBNZFVtNzVOOUQ0?=
 =?utf-8?B?Z2Z2WjZodjlhc3U1RFo0dUR3UFNMWDN6OWxjVTQ3c3huMWZLZ0ZDTXNReG9V?=
 =?utf-8?B?VkJhR0pJNC9ETUIyY2FYTW5BRVZmOU1ENmhBQmhveTZldWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjVGdjdnekJNbGdtMFRmclNQMGVCN2VoamdYZkZ4N0ZPMUtwZU9tRVlOVGxt?=
 =?utf-8?B?ckF6SGI1ZU5hNE90Z00yWFRjcDNPbk5XMGI4MVovbVYzY0VwSitqNURjZWR5?=
 =?utf-8?B?UkJkOXI4aDMrNnFnTWtIbVNBL01VLzdxTFY4YkVJOVFjRkI0TWhuRlVQTUFX?=
 =?utf-8?B?TUsxWTlHU0V1cjdaNnV0MHd4S2RXY3JrblNqaDFMa0lEa0h0bWp3emYzN2Nr?=
 =?utf-8?B?dmp4WlAwNjlXUWZRSHB2TXBWUXJyZkR6ektsUllzSlZYNTNQN3dTdXB5Tk9i?=
 =?utf-8?B?ZTNqUDNtOVBjSk5zU2NXUVAvZ2xGckQ5dm9WRVE0aTcwY2RPcGFGazFDOWhX?=
 =?utf-8?B?dVV0UkkxcTVZUlpQT21jd0VuRFAzR0YydUZSWE5pS3JKdFMzS1E4dWZJUTNC?=
 =?utf-8?B?R2tEZHpVOC9XS0pSRFVjeHJZNEpySDJIWS9sZ0VmeExKUlV1a0ZmTU81NnZL?=
 =?utf-8?B?d2dNWXh2dW1oL0FDNmlPUVMwbDFPYjhxTm9RZGJJVVNBempDdmFRVlFUdkpT?=
 =?utf-8?B?d0NVSTZIbGVJZHd5T3QyWDkzbklXdmdMeS9YYzJMS3MvaXBTVk40MS9uZ1BS?=
 =?utf-8?B?YlVKbmpMdDF3NElIeEs2bENPdVRCT1lGSFB2MUtxRXRtODYxd09IYndGYTl6?=
 =?utf-8?B?WFozcHdvd1I5QTIwd0lWQ2NnZzdKY0tPU3poa0NnMEZ0WXdGTVd1L3ljV0g2?=
 =?utf-8?B?bVU2VFpVU29SL2dxQndWNGgwcFpWSWh3ckwyQkNLdkEvdVdHVzJITm96K0ZD?=
 =?utf-8?B?czQ4OFpWS0hDSmZZRElaRHVBY0lhZWRvTzU1N2R0NFd6dysxanBRK2EwQUtY?=
 =?utf-8?B?RzNMbGVBeWYrUy9jYzlEZUZzajhRQWVNTU9Ud3Vnd0lFZXoybUttWjdyREEw?=
 =?utf-8?B?d2NUeE5sOUlLTWhXRzZWQ0k0ZjRORlpadDJCemZCWDlIekM3T0l6NG5PREdo?=
 =?utf-8?B?MGpTekFKNjJzZlNMRUJabUcyaGNwTjRlbUUrd0dZOHpTbWpMSGZOQ2RqUDAw?=
 =?utf-8?B?SEZCblBranoxekRlRzJoNFUveDFLekdNbGlKZTZINmhjZnlqU3FlTzhIU1pu?=
 =?utf-8?B?eUh6d1NLM1ROQzRkSDBLd3VHWFRPL3Avbzk4NXB5aEE5bTc3M2U3VU1pbFF0?=
 =?utf-8?B?bzVUbHg5NFN1STQvbGoxb1RkcFBLYXpDTmtxWFN2azA0ejJjSGJMSkpNRXF0?=
 =?utf-8?B?TkpsdTFpMmZTcWRLQlpLZmp4a2tSUmUyTWpqSEY3cVArTmJrM1Q2Q1AxMzgx?=
 =?utf-8?B?cTY4dGsvZ1pYdXBHd2xWTHlOdjExSFpuVzg4ZFR0ZE1jbFhqZG9JaEtDR0hL?=
 =?utf-8?B?aXBxL1hxRnRBS0dUTHdaeGw3cGhUV2cvbkVBKy9uT2dUTFpYYnluYVRzcnBh?=
 =?utf-8?B?eWU4VHcyRVpzZzJYUzJLb3AxV1d2MFYyOERlNng4WW5GRUE1SkxOMDNXWVZ3?=
 =?utf-8?B?ajJQWWhRSWZVOTNaeFdhRHRzWDNla3dHbjZQMDQrS0p4Y014bFM5YXpKZHJD?=
 =?utf-8?B?SVYvV2ZnZGppUkgwb2oxOGlEQkthWW1DZ2J5RlRObjZJMmsxeEhCa3BTUVUy?=
 =?utf-8?B?eXJsa0l5WFNYcEc3V3lXTzVaVkFvNkl3eDNYQXAwR0xXbEJoU1hxS3NLalda?=
 =?utf-8?B?OWFHb1pSdTVLb3lrVTZsM3NDMjQ3SVF4dmJaQVN5THlrZlo4NjBXM29GZGZx?=
 =?utf-8?B?MXl4SDhwUnpJWFJuRzdmak4wcU1lelZkUk1GK01hNFVabjBXQ1dSV0gvMDBV?=
 =?utf-8?B?cE9mOVFvNUxHdEJVYkFWZnQ1cndnVDdLazQrcHFRK1F3T3Ezb0ZwWWFtWXNo?=
 =?utf-8?B?WUsydzIvRHFna3Ntbk12d3dIbGVTaFpKT1poQWQ5b1NpMzd1V3JUK0RKUmor?=
 =?utf-8?B?NzZSZUtkSndNU0RIYkcwYVh6a1ZxWmRWdXQ1eWJIMVRaNHNoQXk5RmNIZDhm?=
 =?utf-8?B?QkZ1OFQ3MXpBeGF1a0lhTnd4bW9sQkYrRVZGSjROU0NWTDRyYWdmMTE2d2N6?=
 =?utf-8?B?NDNVNDJ0U0ZzVlZtMEFOeDhFUk1FU2hRcndSZklDK2xRd2g5K1EzOVJOS2Zk?=
 =?utf-8?B?Y0VPbDB3cW9RdVlWMU9aN0MxZnVzSW8vYkYzRmFiZStrY1Z2R1kxM0l3RjIx?=
 =?utf-8?B?N1VEbDJ1SC9RdkpZdE8xd3ExZjZGcjhMU2N4NWtYUE9tbC9PU1A2Ykd6ZXd0?=
 =?utf-8?Q?SPsQ1KQMl7WqjmLyRxc7wng=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B46644AF39F5D4DA694A17CFD707046@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5927484f-cf66-4dc0-c083-08dcc3541411
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 09:15:06.0722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0uSrkfOWZgtnj/RlBuDnJshbkx7B8te95lKrM5GQsUOBEq+ICCj/wB3WdIWYxrCYKl7MpiTe8P69cSSW4VMpPy8tIWQHwIHHPflTZwqmcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
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

DQpPbiBGcmksIDIwMjQtMDgtMjMgYXQgMTI6MDggKzAzMDAsIEdvdmluZGFwaWxsYWksIFZpbm9k
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjQtMDgtMjMgYXQgMDg6NDMgKzAwMDAsIE11cnRoeSwgQXJ1
biBSIHdyb3RlOg0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlz
cGxheS94ZV9kaXNwbGF5LmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5
L3hlX2Rpc3BsYXkuYw0KPiA+ID4gPiA+IGluZGV4IGFkN2ZjNTEzN2I0Mi4uYjJhMGI0YjVjNDVj
IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rp
c3BsYXkuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rp
c3BsYXkuYw0KPiA+ID4gPiA+IEBAIC0zMjAsMTUgKzMyMCwxMyBAQCB2b2lkIHhlX2Rpc3BsYXlf
cG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gPiA+ID4gKnhlLCBib29sIHJ1bnRpbWUp
DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIHByb3Blcmx5Lg0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqAgKi8NCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcG93ZXJfZG9t
YWluc19kaXNhYmxlKHhlKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+IFVuLW5lY2Vzc2FyeSBjaGFu
Z2UuDQoNCkkgTWlzc2VkIHRoaXMgZWFybGllciEgT2theSEgQ2FuIGRvIHRoaXMgYmVmb3JlIHB1
c2hpbmcgdGhlIGNoYW5nZSBpZiBSQi1lZA0KDQorQ29ycmVjdGVkIFZpbGxlJ3MgZW1haWwgSWQu
Li4NCg0KVmlub2QNCg0KPiA+ID4gPiANCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxf
ZmJkZXZfc2V0X3N1c3BlbmQoJnhlLT5kcm0sIEZCSU5GT19TVEFURV9TVVNQRU5ERUQsDQo+ID4g
PiA+ID4gdHJ1ZSk7DQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKGhhc19kaXNwbGF5KHhl
KSkgew0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSAmJiBoYXNfZGlzcGxh
eSh4ZSkpIHsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9r
bXNfaGVscGVyX3BvbGxfZGlzYWJsZSgmeGUtPmRybSk7DQo+ID4gPiA+IA0KPiA+ID4gPiBDYW4g
d2UgZ2V0IHJpZCBvZiB0aGlzIEFQSSBhcyB3ZSBkb24ndCByZXBseSBvbiBkZXZpY2UgcG9sbGlu
ZyBhbmQgdXNlIGludGVycnVwdA0KPiA+ID4gYmFzZWQuDQo+ID4gPiANCj4gPiA+IE5vdCBzdXJl
IGlmIEkgdW5kZXJzdGFuZCB0aGUgcG9pbnQhIFdvbmRlciBpZiBpdCBpcyByZWxldmFudCBhdCB0
aGlzIGNvbnRleHQhIEJ1dA0KPiA+ID4gYXMgbWVudGlvbmVkIGluIHRoZSBzZXJpZXMgcGF0Y2gg
ZGVzY3JpcHRpb24sIHRoZXJlIGNvdWxkIGJlIGZldyBvdGhlciBzdGVwcw0KPiA+ID4gbWlzc2lu
ZyBpbiB0aGUgeGUgcnVudGltZV9zdXNwZW5kIGhhbmRsaW5nIGFuZCBhIGJldHRlciByZWZhY3Rv
cmluZy9jaGFuZ2VzDQo+ID4gPiBhcmUgYmVpbmcgcGxhbm5lZC4gU28gSSBndWVzcyB5b3UgY291
bGQgdGFrZSB0aGlzIHVwIGF0IHRoYXQgdGltZT8NCj4gPiA+IA0KPiA+IE5vdGhpbmcgbWlzc2lu
ZyBhcyBzdWNoLCByYXRoZXIgdGhpcyBmdW5jdGlvbihkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJs
ZS9kaXNhYmxlKSBpcyBub3QNCj4gPiByZXF1aXJlZC4NCj4gPiBJOTE1IHVzZXMgaW50ZXJydXB0
IGJhc2VkIGRldGVjdGlvbiBhbmQgbm90IHBvbGxpbmcuIEV2ZW4gaWYgY2FsbGVkIHdoZW4gcG9s
bGluZyBpcyBub3QgZW5hYmxlZCwNCj4gPiB3aWxsIGhhdmUgbm8gaW1wYWN0IGFuZCBqdXN0IHJl
dHVybiB3aXRoIHdhcm5pbmcuDQo+ID4gSWYgdG8gYmUgdGFrZW4gbGF0ZXIgY2FuIHdlIGhhdmUg
YSBUT0RPIG9yIFJlLXZpc2l0IHNvIHRoYXQgd2UgZG9u4oCZdCBtaXNzLg0KPiANCj4gIldoaWxl
IHhlX2Rpc3BsYXlfcG1fc3VzcGVuZC9yZXN1bWUoKSBwZXJmb3JtcyBzdGVwcyBkdXJpbmcgcnVu
dGltZQ0KPiBzdXNwZW5kL3Jlc3VtZSB0aGF0IHNob3VsZG4ndCBoYXBwZW4sIGxpa2Ugc3VzcGVu
ZGluZyBNU1QgYW5kIHRoZXkNCj4gYXJlIG1pc3Npbmcgb3RoZXIgc3RlcHMgbGlrZSBlbmFibGlu
ZyBEQzksIHRoaXMgcGF0Y2hzZXQgaXMgbWVhbnQNCj4gdG8ga2VlcCB0aGUgY3VycmVudCBiZWhh
dmlvciB3cnQuIHRoZXNlLCBsZWF2aW5nIHRoZSBjb3JyZXNwb25kaW5nDQo+IHVwZGF0ZXMgZm9y
IGEgZm9sbG93LXVwIiANCj4gDQo+ICJkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQvZHJtX2ttc19o
ZWxwZXJfcG9sbF9kaXNhYmxlL2RybV9rbXNfaGVscGVyX3BvbGxfZW5hYmxlIiBpZiB5b3UgZmVl
bCBpcw0KPiBub3QNCj4gbmVlZGVkLCBpIGd1ZXNzIGl0IHNob3VsZCBiZSB0YWtlbiB1cCBhcyBz
ZXBhcmF0ZSB0YXNrLiBJIGRvbid0IHRoaW5rIGEgYWRkaW5nIGEgVE9ETyBpbiB0aGlzDQo+IHBh
dGNoDQo+IC8gc2VyaWVzIGNvbnRleHQgaXMgcmVxdWlyZWQuDQo+IA0KPiBCUg0KPiBWaW5vZA0K
PiANCj4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmICghcnVudGltZSkNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gaW50ZWxfZGlzcGxheV9k
cml2ZXJfZGlzYWJsZV91c2VyX2FjY2Vzcyh4ZSk7DQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKg
fQ0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRpbWUpDQo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2Rpc3BsYXlfZHJp
dmVyX2Rpc2FibGVfdXNlcl9hY2Nlc3MoeGUpOw0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9kcml2ZXJfc3VzcGVuZCh4ZSk7DQo+ID4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqB4ZV9kaXNwbGF5X2ZsdXNoX2NsZWFudXBfd29yayh4ZSk7DQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gQEAgLTM4NywxNSArMzg1LDEyIEBAIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWUoc3RydWN0
IHhlX2RldmljZQ0KPiA+ID4gPiA+ICp4ZSwgYm9vbCBydW50aW1lKQ0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBNU1Qgc2lkZWJhbmQgcmVxdWlyZXMgSFBEIGludGVy
cnVwdHMgZW5hYmxlZCAqLw0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kcF9tc3Rf
cmVzdW1lKHhlKTsNCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRpbWUpDQo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFydW50aW1lICYmIGhhc19kaXNwbGF5KHhlKSkgew0K
PiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9k
cml2ZXJfcmVzdW1lKHhlKTsNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKg
aWYgKGhhc19kaXNwbGF5KHhlKSkgew0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZHJtX2ttc19oZWxwZXJfcG9sbF9lbmFibGUoJnhlLT5kcm0pOw0KPiA+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRpbWUpDQo+ID4gPiA+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNw
bGF5X2RyaXZlcl9lbmFibGVfdXNlcl9hY2Nlc3MoeGUpOw0KPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X2RyaXZlcl9lbmFibGVfdXNlcl9hY2Nl
c3MoeGUpOw0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9o
cGRfcG9sbF9kaXNhYmxlKHhlKTsNCj4gPiA+ID4gRG8gd2UgbmVlZCB0aGlzIGRpc2FibGUgaGVy
ZSBhcyB3ZSBhcmUgZW5hYmxpbmcgdGhpcyBvbmx5IGluDQo+ID4gPiA+IHhlX2Rpc3BsYXlfcG1f
cnVudGltZV9zdXNwZW5kKCkgYW5kIGhlbmNlIGRpc2FibGUgb25seSBpbg0KPiA+ID4gPiB4ZV9k
aXNwbGF5X3BtX3J1bnRpbWVfcmVzdW1lKCkNCj4gPiA+IA0KPiA+ID4gVG8gcXVvdGUgSW1yZSwN
Cj4gPiA+IA0KPiA+ID4gImludGVsX2hwZF9wb2xsX2Rpc2FibGUoKSBpcyBuZWVkZWQgZHVyaW5n
IHN5c3RlbSByZXN1bWUgYXMgd2VsbCwgc2luY2UgaXQgZG9lcw0KPiA+ID4gYW4gZXhwbGljaXQg
Y29ubmVjdG9yIHByb2JpbmcuIFRoaXMgcHJvYmluZyBpcyBuZWVkZWQgYWxzbyB3aGVuIHlvdSBy
ZXN1bWUNCj4gPiA+IGZyb20gUzMgZXRjLCBmb3IgbW9uaXRvcnMgdGhhdCBnb3QgY29ubmVjdGVk
IGR1cmluZyB0aGUgc3lzdGVtIHdhcw0KPiA+ID4gc3VzcGVuZGVkLiINCj4gPiA+IA0KPiA+IFRo
YW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uDQo+ID4gDQo+ID4gVGhhbmtzIGFuZCBSZWdhcmRz
LA0KPiA+IEFydW4gUiBNdXJ0aHkNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KDQo=
