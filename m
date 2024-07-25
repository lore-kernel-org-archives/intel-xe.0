Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40A7C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 02:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEC110E12B;
	Thu, 25 Jul 2024 02:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXy2IpwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5F010E12B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721873501; x=1753409501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i2H967/3KtWkfs7GqgXV1iVmABvCvfGwLGIq+g0Gl8g=;
 b=lXy2IpwRbTkH/tDA0S94esJTHQzPU5//UgMsrEMqniJB6eGUDZQKCPOI
 Wqk8xnDoJgKte6wffclv3ULStS9Ybji+G2Oa3zrxqWEnU2SuI2E33Y0se
 21TlUol7QJ4rjBrXFDuHrPrsOHQYt/PxPWpDFosqZ0BBjfnJGrdu1VI6Z
 iqjNdy/WUJwTmV8N5c5H0lhCIldK9e/Tsi0DjjKxQSv91E5xtdYu3m1VE
 QnCgPXj5tDQ0Tz7LLyH6XtYL4Q78KpB1/E8GskerdDHe7xwphhrPVmMth
 zn9GYt7mFiWvkgMnUdCBcRq5fo6wDegwOLLkSNLlbL2WYH/hN7YFnIgc2 A==;
X-CSE-ConnectionGUID: jHGvViwGT+G/OroSavwFbg==
X-CSE-MsgGUID: FNBE45I/S0WpoDrzaot3pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30977603"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="30977603"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 19:11:41 -0700
X-CSE-ConnectionGUID: ssP4PNUpTrm8bm+1pXYekA==
X-CSE-MsgGUID: D0bVvfeMT1a1moIN4ndUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="52460468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 19:11:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 19:11:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 19:11:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 19:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhaDpi2jLrZPTNWLXhrKl2AmBpkhL866BbCI/rUQ3aC3QEsQk2cjkD5fygAjJ9gQhizwYYdpzvwl+muFGIpLJNDCde6gTrW+GBtwhEO3eYTV2hpEnN2nXr79Z+BhlyoXpTkhERCan9/lUoj9F/fk25uRQrW8uH/l/nc5/QM2vdcCXL/WG60gFNg08qI2ARNfHOlv/HZ+uXQHgvJv/S4uRptf22pxNsBjUPc+wTWY8vs/F1pxouUx8xIzSuHXRlBfb1N2HDq9SnalcZ2iCoDkt+VuaajcXN+MrM5mCksgpD7ciJktgUTGx43i+aPwSEBjYVQ+dUYjBBlAnhrk4IivRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2H967/3KtWkfs7GqgXV1iVmABvCvfGwLGIq+g0Gl8g=;
 b=OTCnokUxTL1aRCj61jFGT6hQTqbuaiRhty3MxyOfDE60adGKo7Qv+wSS6AQLsx9ON3fkzyM7Qp2oH/Ww5I4Q1tW1L+TLzdsDP+mjRPiEXLGrCJn8L8WSi0ldM/DLm2y6u2qEOQTfx1m0O0mjnGc9VKBBegyHe/wvXNIxB43FBBaI/IHhmj0wO0AgHAiv+BuegMOtY/zKt6I3sjHO875xM7HJ/UC5vliNDJhufQLH3HvGcwYs3iqJsAfU+qEm6moM+YwP2HQmoXCT6QVlrLnIEo3U6MP8+2DUI2lgXAddlDd1dotGKZ85azDRJKIGCqSciW+z+WHtAiEJ88iPechwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Thu, 25 Jul
 2024 02:11:33 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::8169:b373:c3c8:e26e]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::8169:b373:c3c8:e26e%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 02:11:33 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [Intel-xe] [PATCH v4] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [Intel-xe] [PATCH v4] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHa3VdFBeQv2nXtekmCbb6kfSWs0bIGsx8g
Date: Thu, 25 Jul 2024 02:11:32 +0000
Message-ID: <PH0PR11MB55790825A825CDF629E6BB6287AB2@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20240723233131.1122655-1-pallavi.mishra@intel.com>
In-Reply-To: <20240723233131.1122655-1-pallavi.mishra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|CY8PR11MB7747:EE_
x-ms-office365-filtering-correlation-id: cfc4c06b-6cc2-4c00-3d49-08dcac4f1ab3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UFlLcUYzUU1RVzlGY1ZveTVCN3BxbFBkU242WlBqUk91UWlERnliYXlUMUt5?=
 =?utf-8?B?SFpLQnRxWXVzRVJLeHNISjRpTVVlOERtdEpmOFBQeWM5QW1TTG5BVmxOajho?=
 =?utf-8?B?cElsUFY0cjFmb3M5aUtCWkVLOHBFeGtLcWh1c3lJTGlyK1FBOVRKZGdCTFJC?=
 =?utf-8?B?VXdqS2drN3dJQnlSeWFKSUJRQXlqeGpzQ3hqeEI1ZmsrcVhHc3VKV0gvWHNo?=
 =?utf-8?B?b2hmdUJKcnJobkZvL05CbHM5WXlVWEt1bzFjVUpzT0JkWXZPOVYrckpGUHJr?=
 =?utf-8?B?TWxTaXBkZVFVMW9DNGpiK0NWMEYvekVnQmNzOGlqVU9WN3h5R01wMmVEclpQ?=
 =?utf-8?B?NklPZGtJcnJ6azNtVDJyMzQ1cTFtUkpVTjZINlpwQ1o5cVA2NzgzRmx3UjBO?=
 =?utf-8?B?Q0tPTWFVSTQyUUlNSnN6dFphUUlsZ3RwNElJdmFGUTNZZFZZZmgwNk1CRG1V?=
 =?utf-8?B?MzJZUDZiOVdtZWNieUVFVnN2NUFGQU9GSzdtaDhWVDVzenVVY2xVaytsV3VD?=
 =?utf-8?B?TW9KV2hGUE94NVY3cGpaTCtpRUVVQmdIRDl0aUxINXA1aWZsL1ZzTnRQbWFO?=
 =?utf-8?B?MGJlMm1Ba2hsbmlWU0cvN1VRcTlqbkFRVUFyRjdoUzdoODBCSW0wS1NPcmJp?=
 =?utf-8?B?dE1NSGN1TElwalZRQ0tNdWdHYWFYczM1cjdQRmlVcHRRd1pxdW1NYUs1L2Vt?=
 =?utf-8?B?bm5CY2V0cHpDR1VaUzNwYmFQazlXcmtiZmV4bXRESFFKNUJiOGxCNzRBWUlo?=
 =?utf-8?B?YmVSQUl1YnRyNXZRWDJSaUdURHZSQkc2dmRoZW5uaktaM3dxWkxzQWM4ZGMz?=
 =?utf-8?B?cjVLUUdWeTV4blM0Rm9hNTFEbWtuUWxMMmZsNUxvNkRyRlAvNFA1OFZTRWhi?=
 =?utf-8?B?R3RySkdBMkVtcGxrK3ZpNE5YdWt3K3hDdnJDa0dxL3Z4a2duUmdBQisvWU9L?=
 =?utf-8?B?ZlM1K0hicDFiVE9UTjdRYStkMlhialBFYVJuMXdZZU1HTlhDOERoUzA4bzJB?=
 =?utf-8?B?TUdUeVBSK0FqY1RLODBvcmF6Qk9yVWJibTZKZFQ2ak9vdFBLNW1ZWjc4d29U?=
 =?utf-8?B?Q3ZodExxV1NhVXdkVU5LWXEweFVHTVFiU0NNblZqdDBYd2JRbm44UER2NnFK?=
 =?utf-8?B?N0l1aTZVcGxMZ3pZeUR4T3FmQ2Q0SjNhN0k4d1hCR2NwZnppRWR4ZjNsRkpG?=
 =?utf-8?B?QVNpUElrdWJ0VndrTk5tOHZFR3lTeHpUV1E3V1ZUcnlteWdQZFdCaGdVa29z?=
 =?utf-8?B?K01YdmVsbXpDTVRvMmlsdWZsMmhlclIvSGZzYzdDRkM0UmFzL3JLV2h3bWlz?=
 =?utf-8?B?M2JvUXVJTXZxYytkbWxzZjgwNEdZMSs4anRBc1I3ZjBTcEplejhKTithR1FT?=
 =?utf-8?B?SldjWFJaSkdPc1NiNnBNdTltOUxzZ0hoWU93dW53aWRrREhEeFMvZndjKzRu?=
 =?utf-8?B?eFlOV0oxcldXZ2RBVDlDdFNjbUdkRTNUOTd2aHlIUDNMVHpOanowS1JPTVFu?=
 =?utf-8?B?K1luYnBPNlQrRXJXMEdNT2g5UU9TNk44WTZGZTBxT1ZUdkM5NWJBaXpVL2tZ?=
 =?utf-8?B?WnpMaEdEYW1OU0YxbGJJT0RuR1ZkY0JqV09yL2NTdjdjeEpEbmd5ZktERlE0?=
 =?utf-8?B?aVVNaDZSVDRXMjExajE4V0hBS1JuK2RQK0pESGx3WkU2dVZUd21xTE9nbzgv?=
 =?utf-8?B?UWdTb3dwMTU1Z1FNQWdUb3RWK2FSMGkvNDk1YW9YOW1sTnNRZThQdVB5NmFz?=
 =?utf-8?B?Q2Z3NUFqSTJWWFJiLzh2dEx1eld4aCtmM0Q3NVJxU2t4SFVVVm0wZkZLT2dw?=
 =?utf-8?B?ek1kK1Vva3hwZnFvNE9MeE1od05ndVplcFFpbFdReW5nc255ZFBBTUZIRDl1?=
 =?utf-8?B?OGdZcjNTNnpZSXB0SHJnYk1zZnpEQmxmdkd2U2ZyWjIrb0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWRnbXNoaFdyOXgzeU1QQVFoYVQzLzFBU3IybDRJN1dRak1OajRBNFN5UDRr?=
 =?utf-8?B?eE92RFhhcTBsSEdGYk5OKzFGTDFvb283Wlc0OTg0TGRXWERwV0NLQjJqbm00?=
 =?utf-8?B?cFJqNDNXUFVWbUdWUkZZbFhvanFSMGhlVHNSeWVkRk9xZUxxcmIvNDBtbmpJ?=
 =?utf-8?B?UEx4VnpoTkg4NGJnaE4xNldqV0g1ZUVheDFQWmUrN3NCbXc0UUN6dmZacUlW?=
 =?utf-8?B?ZG54RUxWVWJqb3k1b0pKTUExL1hyNStOWThiNkdJeGcxdTEyQWphSzIrdkdB?=
 =?utf-8?B?YlJ5V29xVnFzUzNxNkJGNW43R0puUmJIN25VbkdEaDBLa3RkSDg4eFJxU3lO?=
 =?utf-8?B?b2t5eFE4NmhqczdCOWNGVG40a2JVaWhGekFWUHVVanV0SnF2amJxZExCQzlv?=
 =?utf-8?B?NENWSEZsajhNZHl4bEMrcnI1VllCU3RYRGM3bHF3cnNzZWpYMTNxZm85aGho?=
 =?utf-8?B?Q1pIOW8vRnpjTkpkaWRRd04rcXRpOXVPR0VEQUdNdzJsVkZlNVdqWXhGT2dD?=
 =?utf-8?B?RXFKenA5UnkrV2drNDg3UW41RFRjU2Zvbko0VWd0SFlKUXUrN3pBRjRGUW1H?=
 =?utf-8?B?OXVPVzBrQ25BQTlqc1orWXc4aVVaM2kyQnhmMGJNWDl1OFpnME1BbHpyNkYz?=
 =?utf-8?B?NytNQm5KK2tITDl5eWFQS0dHVUc1OHNjQUhhbmlZZ1pTbjRVaGJXdmVNN3RI?=
 =?utf-8?B?WGFDbGxXOWQ1Z0w2dHNoYm1XR1V4YnpRQ0hWaER6WHJielkrai9maWR3c3dh?=
 =?utf-8?B?UFladFFrUlg1K2g4WmxjUmlTZERZSkJ6WUZHTmdHZ1RwaERBOU9YRldvRUVT?=
 =?utf-8?B?b3ZGNkducXpQMDl1NzdUS084ZGNnU2xpbFlYUUZaU2FpVVY3aExrVWFoUTBw?=
 =?utf-8?B?UVg1NmROMUV2U2ZCQzRJWjlZZVdxdUcvMWU0VDh3TTMyOEJvbTlLdmRWeFV0?=
 =?utf-8?B?NGx5VSt2VytuQy9TbFhhN3ZJYXJKWnkxQUIyUUZuUnFwZS9RUE02TGNIVHFQ?=
 =?utf-8?B?Vy9ST2t0eEIvOFI3TVBKQ0o1Z3owZzhoUWhWd0U3M1loR1VTcmZUZWdGVExF?=
 =?utf-8?B?VXZDaCtLWkdxSG15ZWoxUGpCTzhiWUprV2J5bTU2SXpXNTlHME1jU3V0QWx4?=
 =?utf-8?B?VGUzYzViVno5MmV2QjNJQW1pY1kydmEvZ1ZZdFc4dVI0VW8xbFJZSjVPRWF0?=
 =?utf-8?B?NkNzWVBWamdVWnI0QUp0RkFsSHNkTVdXOStlaWdUbWpma0lVb05ybStRSWpU?=
 =?utf-8?B?RU5FMytybXZ3N1ROS25KV0wvU1hidDVWdW1tVCtTV0czVmNtU0ZINit4TEs3?=
 =?utf-8?B?SHlNcnhML1puNVVFVDZsVFJFWldEb2cwU2ZZYlNlRlczWHhObzFMSGZjNzlX?=
 =?utf-8?B?cVhybUZFSm9GTE1nVERic1lla0loTTVlMXpaL29hZ01Ja1AyQkJKQ1FmU1dS?=
 =?utf-8?B?dkhPendOdVExK2kwTi9xS2R0ZE1VdVhPcWNuNHVhM05kbGJ5ZHJxOWpGaWMv?=
 =?utf-8?B?dTlZK3NIZWtpRVRIOEVUUWgwSC94WlVQdjd3d3VXZFRIUGlCVEI0QlFnTW1I?=
 =?utf-8?B?eG9kWEhZZHlpYVJqMUpoNnFhWmxvNit1VEEvL2hadkY3azJsNmxCWnVrcGk2?=
 =?utf-8?B?YUh6SFhnMGMrK3Ezc01GdzZYYUlYQjZTeGVFQWlrN2JMM2IxK1NsL1VRcXdP?=
 =?utf-8?B?ODAwMGQ1MUdFZ1cwN0ZKSURLcGc0Vk5mOEZ1bWRtc2J6VDQxQWNwWFd5WmE5?=
 =?utf-8?B?YWpkVHFtakl6WlllbkYxSGRBSTBMNkxndHRLV21RSmozdmZFajIyWUlxd01I?=
 =?utf-8?B?clNoTFkyejVrc2RRSG8zSWU5aktSUkFrQWxMWVo0dTkxMEhkM1hEM2s4QUZH?=
 =?utf-8?B?L0w4a3JkTHlNa01XeVJTV3h6Q1phZzhYUm5Nb2cyTFgrbW52TTBDeVRlTmt5?=
 =?utf-8?B?cjhzZGVwTGp2OFl6RTVPRTZrVjZ6WGZnc3pXZnpkWVk2S295Zm5wUHVVSDJL?=
 =?utf-8?B?cWcwQUFkYVFnUVhFU1RObW5oTlhMcEZXV0FacEl2M0RUYURjeEJ4TlBhM2hI?=
 =?utf-8?B?Q3pUcEdHV1FQOFRjVGFqWEt2bHJKWDd1MVpxTGE2MTFpRmNQNXorSlFZL01Y?=
 =?utf-8?Q?jaIPX3K/ZP1cWpKgIU075sVHF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc4c06b-6cc2-4c00-3d49-08dcac4f1ab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 02:11:33.0042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+yJNRIBAT8hRjg6/h310pnC+SOUIf6PCSkcBTlQ1yrEBSzxDQQRpK+w5q6mqp/1DqlQNFz/4QJUGZWAG0ZLmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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

SGkgUGFsbGF2aSwNCkFjY29yZGluZyBvdXIgZGlzY3Vzc2lvbiwgYW5kICB0aGlzIGZlYXR1cmUg
b25seSBhdmFpbGFibGUgd2l0aCBSQ1MsIENDUyBhbmQgQkNTICwgDQpzdXBwb3NlIHdlIGNvdWxk
IHJlbW92ZSBtZWRpYSAgcmVsYXRlZCBjb2RlPw0KDQpUaGFua3MNCkNhcmwNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlz
aHJhQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDI0LCAyMDI0IDc6MzIgQU0N
Cj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogUm9wZXIsIE1hdHRo
ZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IFNvdXphLCBKb3NlDQo+IDxqb3NlLnNv
dXphQGludGVsLmNvbT47IFpoYW5nLCBDYXJsIDxjYXJsLnpoYW5nQGludGVsLmNvbT47IENhdml0
dCwNCj4gSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBNaXNocmEsIFBhbGxh
dmkNCj4gPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4gU3ViamVjdDogW0ludGVsLXhlXSBb
UEFUQ0ggdjRdIGRybS94ZS94ZTI6IEVuYWJsZSBQcmlvcml0eSBNZW0gUmVhZA0KPiANCj4gRW5h
YmxlIGZlYXR1cmUgdG8gYWxsb3cgbWVtb3J5IHJlYWRzIHRvIHRha2UgYSBwcmlvcml0eSBtZW1v
cnkgcGF0aC4NCj4gVGhpcyB3aWxsIHJlZHVjZSBsYXRlbmN5IG9uIHRoZSByZWFkIHBhdGgsIGJ1
dCBtYXkgaW50cm9kdWNlIHJlYWQgYWZ0ZXIgd3JpdGUNCj4gKFJBVykgaGF6YXJkcyBhcyByZWFk
IGFuZCB3cml0ZXMgd2lsbCBubyBsb25nZXIgYmUgb3JkZXJlZC4NCj4gDQo+IFRvIGF2b2lkIFJB
VyBoYXphcmRzLCBTVyBjYW4gdXNlIHRoZSBNSV9NRU1fRkVOQ0UgY29tbWFuZCBvciBhbnkNCj4g
b3RoZXIgTUkgY29tbWFuZCB0aGF0IGdlbmVyYXRlcyBub24gcG9zdGVkIG1lbW9yeSB3cml0ZXMu
ICBUaGlzIHdpbGwNCj4gZW5zdXJlIGRhdGEgaXMgY29oZXJlbnQgaW4gbWVtb3J5IHByaW9yIHRv
IGV4ZWN1dGlvbiBvZiBjb21tYW5kcyB3aGljaA0KPiByZWFkIGRhdGEgZnJvbSBtZW1vcnkuDQo+
IA0KPiBObyBwYXR0ZXJuIGlkZW50aWZpZWQgaW4gS01EIHRoYXQgY291bGQgbGVhZCB0byBhIGhh
emFyZC4NCj4gDQo+IHYyOiBNb2RpZnkgY29tbWl0IG1lc3NhZ2UsIGVuYWJsZSBwcmlvcml0eSBt
ZW0gcmVhZCBmZWF0dXJlIGZvciBtZWRpYSwNCj4gbW9kaWZ5IHZlcnNpb24gcmFuZ2UsIG1vZGlm
eSBic3BlYyBkZXRhaWwgKE1hdHQgUm9wZXIpDQo+IA0KPiB2MzogUmViYXNlLCBmaXggY3JhbXBl
ZCBsaW5lLXdyYXBwaW5nIChqY2F2aXR0KQ0KPiANCj4gdjQ6IFJlYmFzZQ0KPiANCj4gQnNwZWM6
IDYwMjk4LCA2MDIzNywgNjAxODcsIDYwMTg4DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZp
IE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogTWF0dCBS
b3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQWNrZWQtYnk6IEpvc8OpIFJvYmVy
dG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBBY2tlZC1ieTogQ2FybCBaaGFu
ZyA8Y2FybC56aGFuZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3Jl
Z3MveGVfZW5naW5lX3JlZ3MuaCB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmUuYyAgICAgICAgfCAxMSArKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfZW5naW5lX3JlZ3MuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9y
ZWdzLmgNCj4gaW5kZXggYzM4ZGIyYTc0NjE0Li44MWI3MTkwMzY3NWUgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiBAQCAtMTA0LDYgKzEwNCw3IEBA
DQo+ICAjZGVmaW5lIENTRkVfQ0hJQ0tFTjEoYmFzZSkJCQlYRV9SRUcoKGJhc2UpICsgMHhkNCwN
Cj4gWEVfUkVHX09QVElPTl9NQVNLRUQpDQo+ICAjZGVmaW5lICAgR0hXU1BfQ1NCX1JFUE9SVF9E
SVMJCQlSRUdfQklUKDE1KQ0KPiAgI2RlZmluZSAgIFBQSFdTUF9DU0JfQU5EX1RJTUVTVEFNUF9S
RVBPUlRfRElTCVJFR19CSVQoMTQpDQo+ICsjZGVmaW5lICAgQ1NfUFJJT1JJVFlfTUVNX1JFQUQJ
CQlSRUdfQklUKDcpDQo+IA0KPiAgI2RlZmluZSBGRl9TTElDRV9DU19DSElDS0VOMShiYXNlKQkJ
WEVfUkVHKChiYXNlKSArIDB4ZTAsDQo+IFhFX1JFR19PUFRJT05fTUFTS0VEKQ0KPiAgI2RlZmlu
ZSAgIEZGU0NfUEVSQ1RYX1BSRUVNUFRfQ1RSTAkJUkVHX0JJVCgxNCkNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9od19lbmdpbmUuYw0KPiBpbmRleCAwN2VkOWZkMjhmMTkuLjU0ODNkZWFhYjFiZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBAQCAtNDI1LDYgKzQyNSwxNyBAQCBo
d19lbmdpbmVfc2V0dXBfZGVmYXVsdF9zdGF0ZShzdHJ1Y3QNCj4geGVfaHdfZW5naW5lICpod2Up
DQo+ICAJCQkJCSAgIDB4QSwNCj4gDQo+IFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkp
KQ0KPiAgCQl9LA0KPiArCQkvKiBFbmFibGUgUHJpb3JpdHkgTWVtIFJlYWQgKi8NCj4gKwkJeyBY
RV9SVFBfTkFNRSgiUHJpb3JpdHlfTWVtX1JlYWQiKSwNCj4gKwkJICBYRV9SVFBfUlVMRVMoR1JB
UEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLA0KPiBYRV9SVFBfRU5EX1ZFUlNJT05fVU5ERUZJTkVE
KSksDQo+ICsJCSAgWEVfUlRQX0FDVElPTlMoU0VUKENTRkVfQ0hJQ0tFTjEoMCksDQo+IENTX1BS
SU9SSVRZX01FTV9SRUFELA0KPiArCQkJCSAgICAgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lORV9C
QVNFKSkpDQo+ICsJCX0sDQo+ICsJCXsgWEVfUlRQX05BTUUoIlByaW9yaXR5X01lbV9SZWFkX0Zv
cl9NZWRpYSIpLA0KPiArCQkgIFhFX1JUUF9SVUxFUyhNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEs
DQo+IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwNCj4gKwkJICBYRV9SVFBfQUNUSU9O
UyhTRVQoQ1NGRV9DSElDS0VOMSgwKSwNCj4gQ1NfUFJJT1JJVFlfTUVNX1JFQUQsDQo+ICsJCQkJ
ICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gKwkJfSwNCj4gIAkJe30N
Cj4gIAl9Ow0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
