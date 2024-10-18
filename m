Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3713D3C549
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 05:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B7C10E0F5;
	Fri, 18 Oct 2024 05:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdLaE7FR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD4D10E0F5
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 05:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729227882; x=1760763882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4ckcTbfN0QVLDuThWJrheXHXRvCkyPH4wGXofSNSGGU=;
 b=QdLaE7FRROY1UvRisAsYIUJg3CFZV2ZrXmxNECYk16veL9eUW/0K81dt
 HewJFoeeritAbcRHla062DKlPWCD4oDQWiUivio2Up9xFuUVCU4v3hrr4
 0MJ7ZDDmqNCDX7Mx6pPKq6xkwYwhf772gCnE6FaPjxQBBFTy7HZumvtAJ
 LBzKf4QzK+9NM8a6qEmPNfiH/0jvxlD7R6ndQjgcqay+LT+pfDqq+JieZ
 uQd17vcb6Zh+IIkKl4g1MmaxBRKD7623hsXmNe7VoZKYDuBlq5mQqRJDm
 cJ4NkGN5GFCYKPrf4zHbXCOkNmMz63DIfMDBsD75CZ/J4HCrjZ6rZLKDr A==;
X-CSE-ConnectionGUID: 2kyBm28yRuqKBlc6fN6bJA==
X-CSE-MsgGUID: gWdcuHrsSDGYjWH4HPK9Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28627731"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="28627731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 22:04:41 -0700
X-CSE-ConnectionGUID: Gcx3ihUOQnmnftR67mKWqg==
X-CSE-MsgGUID: 4EwVlU6nRN6St6vzF2Ukbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="83835624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 22:04:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 22:04:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 22:04:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 22:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zke/fgiKEsVhilF9kzk9Y0mIMAxOouHfTgUwMqN7h/W5WJomsBk1CBeoLIa8hGbbwlYMrvqIXbiY8OoTcnuLlzQK94fmANwyxkLppsGUF8w4/S32kZwM1uVeDkGtzGCUts9v5Js1bnBr+JddUzEs4LFL5MH3EVGNfyNbUY7NKNRjfJXGoNve84YZInUfOo89PfO0kbGWYXL29p8i/Mnb/8MCsnNbasm3Dc138sxs4IAPWmyh9avdtMv6G7mi5/Zi+yFMF/afrlYW0e3vYhv0RXh/gYx4JfiTR8eUVc9+b9usUyhlbIirt9/oC3vWYLzQb8NhG47ltLSXK8MctUE+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ckcTbfN0QVLDuThWJrheXHXRvCkyPH4wGXofSNSGGU=;
 b=kKzXSBPRnced0MoxW4ldSMJVUlhOdVlOPZ7o0qQgwW0tKIRlY/Z5moJf7EFZjh4ex2N4Wg1JPJ/NxWD4N8SB15lCnZzjc8mEECjerdZ7VCCj3Vdt6wPXceXnY/sodnuD39FxlwVxerIXZKNPOwsfBa8vQsIZfEXIKIUgrpDiwMCPT6r120LNgm1EyXTleFZ4oTVz6zxXIncG1tlliztnpaSNsbuZUJaDN/y1/reHdxOKxf9pv2AYMKFd7rQLThbXi264TSXXvt+Z6foQTHURhLMzyvSPNSZWMUtGIhCuuvBCcQMakNkCvG37ZGLHqFanGA7ZCWMsA93tryjfKAe5Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 05:04:37 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%7]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 05:04:37 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Topic: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Index: AQHbEyrq7YQw4fCzWEaIpV6Ywf6aFrKJEpIAgAGdqACAAJO0gIAAy2jg
Date: Fri, 18 Oct 2024 05:04:37 +0000
Message-ID: <IA1PR11MB64675D48E2FBAE7A8BB4622BE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
 <20241016072436.261438-1-nemesa.garg@intel.com>
 <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
 <9abd8034-abd5-48da-b5af-ec2f24bb0795@intel.com>
In-Reply-To: <9abd8034-abd5-48da-b5af-ec2f24bb0795@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: a5271b8a-b022-43a0-8a8f-08dcef325d34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UTlGRmZ6UHoxOEVEU04zLzlDYlloMlUyQVNxMjJpeWZlQnlIT0dQZVJnY2hT?=
 =?utf-8?B?Um9jcTVjVTdpUHFkUFhJMENwWC9IVWNJSjJxS05ES0IyMjhDT1FiekpZcnVk?=
 =?utf-8?B?QmVsdXpaZEJuZzBVWnNpRFZhRTNnOXkramduRnRPZUY0UFJ5OS9jS0pBQmlZ?=
 =?utf-8?B?djRlOEdnaUhyV0dLakdJOWZpcjdhaTh1a01DYjFsM2ZESGQyajBKc0V3Ymkr?=
 =?utf-8?B?Mlg0T0tGOXVvOHM2c0RoN3kwdWpQd2hiS3RkWlBNYkhkb1pSU1VRSlZIV3Rp?=
 =?utf-8?B?T3gyZHdEbkZKMnJqdURSWjRwV1lycnQ4a2o5K2lXSVE5VEV6RFJPb0R0cmti?=
 =?utf-8?B?QjBGY1dBSFFWV096ckJKRmE4YjBYZ2Y5UGhHc0M4Y25JN3cvbmRkUko0UzFL?=
 =?utf-8?B?UjFuOXEvS1NsSnh2US9jTTQ1c3E5anFUWSsyM0thZ1JDMXJYQnZqaWVGSW9N?=
 =?utf-8?B?T0Nla0g4Tzl5bGdtcG5VUVpxeWMvcS8ybHJJS3dXdkVhY2R3SDhIcFB4NG5h?=
 =?utf-8?B?WXh4NEZDeW1PbWZaNW9EdHIwcTA2OEwra2NVaHYycUlHcjN4amU0YUg2YVcv?=
 =?utf-8?B?K3ltNUo3L2NaTkpjK3FGMFl4bXRvUkpwSGg4YVBLMEpIR0NoRXdScjgxMjJF?=
 =?utf-8?B?UllMVEluNzB5endsQ2tFaW9MOGxzWW1MaGZ4Z2xiZVoyYzdGd01JSUhiMUQx?=
 =?utf-8?B?ME5WMXBOeHo5c3Q5TlQrVUc0TU5TbHUweE9OOVpQU05ZSDhnT0RTbmJFWXpm?=
 =?utf-8?B?OXM5S290T0FDaVgvV1I2T09Jb3NNMlNobm9DSm03YUNXcDlNRXp2aEN3bWlz?=
 =?utf-8?B?M2hIRi9tenFzclZyU3dNZDZNWDY5akFRMHhWWHIzeDZzK2dpNGhtNDlPOWVG?=
 =?utf-8?B?Y0N5UGV3Z2QyZUdxdjFpeElJaFppanVDWkxpc0ZhT0g5NHJ0K3NrbG1oUnY5?=
 =?utf-8?B?T0pvbGc5N3VKTEZiTUtBYjAwdkFNQThlT1ZMa1N0U2M3Y09lRk5WczlMY3By?=
 =?utf-8?B?dnA4b211V1liYnQvQklXQys1M1k4YVErTytnSHVwcHF4dURIZkErczZDQnVz?=
 =?utf-8?B?UkdWSVZWZ3dDNWVHNFdJMXFZVHlXcEhEelJhUE9VMW5qSlhUOFQ3bzNMdUhR?=
 =?utf-8?B?NVRjUndCTk56OGlwZFRvSmJMbHZqSDd3ckJ5OVM2T1h4SGtwY0pyVnc0d3Fl?=
 =?utf-8?B?UDR0UHBFczFRUnRkalhMVklNS21lbTJvR1FvY09FNlljUTB0UUk3emgxbmpM?=
 =?utf-8?B?OTQxTXBHRFl1NEsxTHZkZFBENG9seWlRVXltZjRPTElPTlFYZ2drRXZrQUdH?=
 =?utf-8?B?ZXg4R05mRFkvdHU1cDJPMUpMbHVoNXF4bXlmZEM2ZVllWkFRNHFIVGxxNmZW?=
 =?utf-8?B?ZGFWSzFMOTBxOEZCSkxNcjYwcDVSckhGZVBVeW5TNGR4blpXVlRPWW9oNEF6?=
 =?utf-8?B?TU5jeWR4RVkwMlBXNG1DVnFyaXBUNXgwTklXcnc5WUxRc1VXYVZhb3Y1NVIy?=
 =?utf-8?B?cHV5Zm1scW1RKzFnSnZ1c2drOVNsQkQwNWJKYmhwWHl4STd0enVyVzBwTUd5?=
 =?utf-8?B?elBjL1QrbVBQQkowbXBSdzBhejVpRVRSVXNDalN5ZmxwU2R5RkdOdmsrZ09Y?=
 =?utf-8?B?TXp4SEp3ZG1CRXdBaVcwVkY5aEM3czF4Umd5UUdkWEdyc3VhQ1JkcngxNmJQ?=
 =?utf-8?B?QkVUcUhpR3JIVnZvNW93WjM0U0l5R1loRzVXMmNvWXhBSkFPVHA4N01tRGFz?=
 =?utf-8?B?ZVJGenhrY0VRa2xSU2Y5QnI3TWVNYnRxZ1BhWEkwb3p3a2tTQkVKSGpUY0Rt?=
 =?utf-8?Q?r7D1Y9pXGqP2wE571qluQiwd+K2/lzPgZ8I8Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXp1VWZ1WktMbmo3VkFvSEZpdjZhSnhaTDlUM2NNeVQrY1p0QkRkWlNwaUF6?=
 =?utf-8?B?VGp6dUlsa2FPMHlJVmlyb0dwVGlKcTZ5NmMxSW40a01oL2F1VDBVc0pkL1lO?=
 =?utf-8?B?RUhrQXh6OFh2SlJOdDJ1b2lQNWVZL1dsVXNvSk16Qnl1YlBhNDI0L1JLdDJQ?=
 =?utf-8?B?RzdZVEEwU0w4NU9zWVFmR1cwdVNMcmJ4NDlWRExEQWFiUisrdW1wajhQdGVm?=
 =?utf-8?B?ajZqdjdkeW1lWVFGWHhsZWRyYXA0V0x5eVNMZFhHU3QzSkRJZ3E5N2d3ZFht?=
 =?utf-8?B?WHhFa1JQL082V2JwMGhOVG9YMzBMUXJocXYrZ2IvSXhPcGRkeXF1eGc4cDVL?=
 =?utf-8?B?SFdTZFBwcW0xYVZ1VWdiSVZNc3pERjQ4VktmR2FpTzBoMVZZZW1vM3VNNlVI?=
 =?utf-8?B?STRTa2F2ZVA5NTM5ZEJkS0wzaWN2emNnQmlvUkhWeHhXdkp5LzBpSUU5VDNU?=
 =?utf-8?B?UExzalc1UHZYSVdFbDVRNkVGSHFXTVp6VWNSUVlCMVRiVEVocjd2S0NsdEQv?=
 =?utf-8?B?RlVXMHM5eG5pVEpQSFh4VVdObDdjS25RSU9kNWlLZ0RJVWk3L1pPdVpPdTVz?=
 =?utf-8?B?MHN4UlhjM2VJMVVGaStuOUdBeTVCVzN5Y0tmVjRmUkdsdWE1RUlORjlnazRq?=
 =?utf-8?B?ZlhCTzhQMXhnZW5IMGZWMTl0UFNHNDlXZzRXb0pxRDZ0US8rNkRKUEdWSXdT?=
 =?utf-8?B?V3p0OEdpSXdObWlINVVGUWZPb0dGVUJieVhicDdzZWE0Wm5rWW5rTWRIekgr?=
 =?utf-8?B?dUx2b0E2U01rQVdJcmFXVEdtejRhb1MyeXpOUWRaUmdrNmV3a0hJY3Z5R2pT?=
 =?utf-8?B?UXhLcGxSUysySmhTUnh2YldhSnM2cHhsdzdtNGlwSExjQXpDREJGbCs3Y1ox?=
 =?utf-8?B?a3lYazRkcjhOR3liY1FJSnRSKzkrN3NKK0syN1JHM2MzbXNPb2Q5UmpEUUVF?=
 =?utf-8?B?WWZOeU1CUnBCY1IvYWYzNjJsaW1jenZON2tmY0hqdkNDejB0K043aVVuOGY4?=
 =?utf-8?B?VHlZNFAwcW1rSENjVWJpRzVBUDJpa3g5RTJrSmxQamtFUzREZEVjR0NhVXEx?=
 =?utf-8?B?Y0Y0dzhWbVIrdjVJTTV5amZidThSZ3lhcnJQVTlNOGd3MmMxcHUvSk4wckh4?=
 =?utf-8?B?aFFMb0xlbDY1RWZ3L21XT0pHZXBIUi9vMjFYUnh3TGU5VkF2Mi91d2c1dXlP?=
 =?utf-8?B?UkdVdW1QS2tsMkVjb0JsRnRWQklhSUNLc2sxS09QZ2ZxZG1ERXNUSWtHVUMw?=
 =?utf-8?B?bUtLNWFPWFFKREdrUW5vSkFsalNKc044R2dzVmIzUkx0a2FwZUNjeHlsR0dM?=
 =?utf-8?B?OWpIeC9yQUI3ZDl6YnNUWjhUamJHWnlMWkJsUWdtL1ZQYXpQbEh0K3Izbmg2?=
 =?utf-8?B?OEJEMzRma0pHNGU3SUQ1ZFFwQ3diTmNBaXNWcU4vOU44a0NyVkhUWVRsRUov?=
 =?utf-8?B?YTJ3eDBhSldIWHdBSXllc2NSM1Z6OVJ4VVJIWTNtRVBlNHljRWRUZXpIblNP?=
 =?utf-8?B?N29sYjdJR0FlUkNVOEV4ME1PM29WVyt6WDMxdnRqdDdkR1FqbEpyMzdOMkll?=
 =?utf-8?B?bkh0NlMvR01tK2pWdjVwb3dLcnJhUmI0WU0xUVZaalpKSTNsYy9VOGRlWThX?=
 =?utf-8?B?UlBidEdIVWdLc3FJemthYWVRSnBMMVJyWkZyQzR1bW9aUWVXbHRUcDZ3MjIv?=
 =?utf-8?B?MzZoZzhmNjN4NVhRRDdvVlNQcFFIRWNzenIxNlRUZ3NqRUswZnlvbjQ0czU2?=
 =?utf-8?B?ZWpRbVVTaWZwMmsrdTJ5bU1qMENCMVphR3NwbjI0Z1pQT1VzcjhTY080UmRj?=
 =?utf-8?B?dlpKMDNjN1ZVaTl5UE1VNGphNFlHZ0ZoNlBrNG5KTTArbnlpeE1MQjJGeFBi?=
 =?utf-8?B?REE1eVpydVBCNnBLN2MyQTYwbm9LR0VtN0Z4ZTlTZ3ZqQ2N6Tk9oQ3lJeHhr?=
 =?utf-8?B?ZzJRelZqWU5LdUhzb3VIYlVrcEFHL0JDaG8zd2pKOHhXay96eDBqRFFPQkJE?=
 =?utf-8?B?Q0NEUkE2UEtEeElqR2w2bURReU1JbGoyRjdiKzVkdDhYTkFOVU0rb3VUWHNu?=
 =?utf-8?B?SG9WS3ZjM2xOTjdlMzBvdmY3WVcxVGh1NnpvcGtKN0ZQNWlzb3Z4ZGN4UktY?=
 =?utf-8?Q?26gxk3m25TkfqGDoo/SaMYsIp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5271b8a-b022-43a0-8a8f-08dcef325d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 05:04:37.0442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrnIRiDHc/WjvWEXTs3T/wCVcEAI/PCZETLmUhHaln2BvLuuUqPNRil5AejnrRWyv3LV6j7ZWBSf345kwsJxTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUG90dHVtdXR0dSwgU2Fp
IFRlamEgPHNhaS50ZWphLnBvdHR1bXV0dHVAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
T2N0b2JlciAxNywgMjAyNCAxMDoyNCBQTQ0KPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1cmFqLmth
bmRwYWxAaW50ZWwuY29tPjsgR2FyZywgTmVtZXNhDQo+IDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQg
PG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9p
OTE1L2Rpc3BsYXk6IFdvcmthcm91bmQgZm9yIG9kZCBwYW5uaW5nIGZvciBwbGFuYXINCj4geXV2
DQo+IA0KPiANCj4gT24gMTctMTAtMjAyNCAxMzozNSwgS2FuZHBhbCwgU3VyYWogd3JvdGU6DQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSW50ZWwteGUg
PGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4g
Pj4gTmVtZXNhIEdhcmcNCj4gPj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE2LCAyMDI0IDEy
OjU1IFBNDQo+ID4+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6
IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFU
Q0hdIGRybS9pOTE1L2Rpc3BsYXk6IFdvcmthcm91bmQgZm9yIG9kZCBwYW5uaW5nIGZvcg0KPiA+
PiBwbGFuYXIgeXV2DQo+ID4+DQo+ID4+IERpc2FibGUgdGhlIHN1cHBvcnQgZm9yIG9kZCB4IHBh
biBmb3IgZXZlbiB4c2l6ZSBmb3IgTlYxMiBmb3JtYXQgYXMNCj4gPj4gdW5kZXJydW4gaXNzdWUg
aXMgc2Vlbi4NCj4gDQo+IC0gUHJvYmFibHkgd2l0aCB0aGUgZGlzY3Vzc2lvbiBhbmQgdGhlIGxh
dGVzdCB1cGRhdGUgdG8gdGhlIHBhdGNoIHdlIHNob3VsZCBhbHNvDQo+IHVwZGF0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gYXB0bHkgcmVmbGVjdCB3aGF0IGFyZSB3ZSBkb2luZyBoZXJlLiAoV2Ug
Y2FuDQo+IHJlbW92ZSBldmVuIHhzaXplIHBhcnQgb3IgbWF5YmUgZ2l2ZSBtb3JlIGV4cGxhbmF0
aW9uIG9uIHdoeSBldmVuIHggc2l6ZSBpcyBub3QNCj4gYmVpbmcgY2hlY2tlZCBpbiB0aGUgcGF0
Y2gpDQo+IA0KPiAtIFdlIHNob3VsZCBpZGVhbGx5IGJlIHVzaW5nIHRoZSB3b3JrYXJvdW5kIGxp
bmVhZ2UgbnVtYmVyIGluIHRoZSBjb21taXQNCj4gbWVzc2FnZS4NCj4gDQpTdXJlLiANCj4gLSBB
bHNvLCBzZWVtcyBsaWtlIE5WMTIgaXMgbm90IHRoZSBvbmx5IHBsYW5hciBmb3JtYXQsIHNob3Vs
ZCB3ZSBjaGVjayBmb3IgYSBwbGFuYXINCj4gZm9ybWF0IGluIGdlbmVyYWwgaW5zdGVhZCBvZiBO
VjEyIHNwZWNpZmljYWxseT8NCj4gQ2M6IE1hdHQgUm9wZXINCj4gDQpJbiBXQSBpdHMgbWVudGlv
bmVkIHRoYXQgdGhlIGlzc3VlIGlzIHNlZW4gZm9yIFlVVjQyMCBmb3JtYXQgc28gdGhhdCdzIHdo
eSBJJ20gY2hlY2tpbmcgZm9yIE5WMTIgZm9ybWF0Lg0KDQpUaGFua3MsDQpOZW1lc2ENCg0KPiBU
aGFua3MNCj4gU2FpIFRlamENCj4gDQo+ID4+DQo+ID4+IFdBOiAxNjAyNDQ1OTQ1Mg0KPiA+IFRo
aXMgc2hvdWxkIGJlIHJpZ2h0IGFib3ZlIHlvdXIgc2lnbmVkLW9mZi1ieSBUaGUgcmVzdCBMR1RN
LA0KPiA+IFJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNv
bT4NCj4gPg0KPiA+PiB2MjogUmVwbGFjZSBIU0Qgd2l0aCBXQSBpbiBjb21taXQgbWVzc2FnZSBb
U3VyYWpdDQo+ID4+ICAgICAgTW9kaWZpZWQgdGhlIGNvbmRpdGlvbiBmb3IgaGFuZGxpbmcgb2Rk
IHBhbm5pbmcNCj4gPj4NCj4gPj4gdjM6IFNpbXBsaWZpZWQgdGhlIGNvbmRpdGlvbiBmb3IgY2hl
Y2tpbmcgaHN1Yg0KPiA+PiAgICAgIFVzaW5nIG9sZGVyIGZyYW1ld29yayBmb3Igd2EgYXMgcmV2
MVtKYW5pXQ0KPiA+Pg0KPiA+PiB2NDogTW9kaWZ5IHRoZSBjb25kaXRpb24gZm9yIGhzdWIgW1Nh
aSBUZWphXQ0KPiA+PiAgICAgIEluaXRpYWxpemUgaHN1YiBpbiBlbHNlIHBhdGggW0Rhbl0NCj4g
Pj4NCj4gPj4gdjU6IFJlcGxhY2UgSVNfTFVOQVJMQUtFIHdpdGggZGlzcGxheSB2ZXJzaW9uLg0K
PiA+PiAgICAgIFJlc29sdmUgbml0cGlja3NbSmFuaV0NCj4gPj4NCj4gPj4gdjY6IFJlcGxhY2Ug
LUVJTlZBTCB3aXRoIGhzdWIgW1N1cmFqXQ0KPiA+PiAgICAgIFJlbW92ZSBzcmNfdyBjaGVjayBh
cyBub3QgcmVxdWlyZWQNCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogTmVtZXNhIEdhcmcgPG5l
bWVzYS5nYXJnQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYyB8IDUgKysrKysNCj4gPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+ID4+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiA+PiBpbmRleCBl
OTc5Nzg2YWE1Y2YuLjJkN2NhNmU2MjkyNiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiA+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+ID4+IEBAIC0xMDMx
LDYgKzEwMzEsMTEgQEAgaW50IGludGVsX3BsYW5lX2NoZWNrX3NyY19jb29yZGluYXRlcyhzdHJ1
Y3QNCj4gPj4gaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQ0KPiA+PiAgIAkJICovDQo+
ID4+ICAgCQloc3ViID0gMTsNCj4gPj4gICAJCXZzdWIgPSAxOw0KPiA+PiArDQo+ID4+ICsJCS8q
IFdhXzE2MDIzOTgxMjQ1ICovDQo+ID4+ICsJCWlmIChESVNQTEFZX1ZFUihpOTE1KSA9PSAyMCAm
JiBmYi0+Zm9ybWF0LT5mb3JtYXQgPT0NCj4gPj4gRFJNX0ZPUk1BVF9OVjEyICYmDQo+ID4+ICsJ
CSAgICBzcmNfeCAlIDIgIT0gMCkNCj4gPj4gKwkJCWhzdWIgPSAyOw0KPiA+PiAgIAl9IGVsc2Ug
ew0KPiA+PiAgIAkJaHN1YiA9IGZiLT5mb3JtYXQtPmhzdWI7DQo+ID4+ICAgCQl2c3ViID0gZmIt
PmZvcm1hdC0+dnN1YjsNCj4gPj4gLS0NCj4gPj4gMi4yNS4xDQo=
