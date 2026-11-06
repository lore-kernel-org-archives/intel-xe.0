Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370E606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmMsxTO1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C4D1128A2;
	Fri,  6 Nov 2026 13:23:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0060710EA0B;
 Fri,  6 Nov 2026 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793971385; x=1825507385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6CoLrCa+7qzHkPDorxThPRVvaMhJadQvsYToVhvcAFI=;
 b=gmMsxTO1A06fsodicIl0fU0VryQtPJDjD4PvDWaAyXBex6LmxhwrVTg0
 C673IlTc1BZLtmt0YNyjgPDKbq6zvP4rpxU0kDkADg8tcgfvD6L9ceI+d
 JQgvNBpuaqryq6dDfhL+OifvDkImFo/UW8NeLpriyqITkG6bxMkL3UWV9
 /wAF6+bzgv2WfL4T0GyWOX9BUEAL391qO6ARLBFyigvcH1vVrMuWh3ZEZ
 11b4/rye3d19aBtTKVl6DnqYSPqW4Tnu2f+ZiI/xufscp2NfWDoBdLF2G
 KVCGo5cpOh5bCmKVr6QoteryTAW47M21Y5yC3BXBZqTDovcg+iDGIJ0+6 g==;
X-CSE-ConnectionGUID: s2oz7eFBRoGchSW1nNthbA==
X-CSE-MsgGUID: 40dWsDJVQrKGeskCNdYaJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2823758"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2823758"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:23:05 -0800
X-CSE-ConnectionGUID: IR9kWQaqS8Sd4hmM/GZFIQ==
X-CSE-MsgGUID: X2+1p3RfTAaa+PKF2IDZ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7177752"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:23:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 05:23:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 05:23:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 05:23:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juwDgBcBQzqFttxd+O2yRahufSA8rBSesenB/7YAPeEKkkcKAUNCvQAmdIxJnsRAhDGNUZR72F3rtFRCNdr//fJRnD1EVNHdE/3MvVmiFkSiMZUyZW9pI57UcIThLwY6ctXNUpx5xg6w8QzA2zORwpbKVJmZIdMSaHd9PopralDG3tgOgCnXn+JusQ7CCwpaJC2cDPEsNc667Tq3RTHSopHbacNM1gehLZQGHa+Yj0RyjYp/TDfExKY+fDpir8ztCCNb/CNDz+eStN8hwW3IiPWtXCka0hGb0kj7cnm7S1FAEsOsTm9DiZitNNzA4yjgSGjB2qpnO29IgUMt3tIDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CoLrCa+7qzHkPDorxThPRVvaMhJadQvsYToVhvcAFI=;
 b=Ze5QeU0dqR9WgnPqiEx2/GYMPtw6RXJp+CJYbiuPEd35mAoIEaQrPH1dOSocQvdRbBRdAIYMOPQwB3Cn9nyv3MjPL3N8FvWhrKJZrMp2hIuI4Q5Px9SsTVoqtLOnvBaQqhxEHfuyjAEuikHIyVzLRicwweKBfbPOREsTIj6lvdKEXkf3+tbBWOK/9e6+YfsFmzOrnNuc7daC9Y4mgTKrKobHG+VHU6Sz204qlgN+oxMTU3joa0O/1yHqU96o311Qk7IokVv8R9k1FK2jPtUWdywd0BwF3Kj5fECbJJp8rbFSYQmDHQxblGa3uwgJ7rztyqJ1i9us3RMBxwpIVB2c8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DSVPR11MB938433.namprd11.prod.outlook.com
 (2603:10b6:8:37a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:20:55 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 13:20:55 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v2 1/4] drm/i915/psr: Flush on cursor update also when not
 using Selective Fetch
Thread-Topic: [PATCH v2 1/4] drm/i915/psr: Flush on cursor update also when
 not using Selective Fetch
Thread-Index: AQHdarEpTQDQMBJsnUe4i1Pr5m69T7chDdWA
Date: Fri, 6 Nov 2026 13:20:55 +0000
Message-ID: <DS4PPF69154114F17E4376A39A3916D7D01EF762@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261102100051.272137-1-jouni.hogander@intel.com>
 <20261102100051.272137-2-jouni.hogander@intel.com>
In-Reply-To: <20261102100051.272137-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DSVPR11MB938433:EE_
x-ms-office365-filtering-correlation-id: c114b8d5-a176-4f23-1377-08df3c08c9ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|10070799003|366016|38070700021|4143699003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: tGuRq26HIGrucbFJSojQ6AdOwwwdGURgF7+Bru5yAN7y8BCJJN826c0FghIFvyyzYMgbC/8HzwwUSh8YKXGclI8mby6hERJEKaDCeDjHv/MfVzZhIa8ZCO5rwLOCrKLt6JAvn2eUB3qiLCfmHfov/BhmyHecZ1T+bMPBRlWgvWA/UAkgk5E1DhFokR/BpMa3BSZj7l1RtLXkOJ9wt/bGuZkdCXdzpKPHCAYN7rbpjHTAr6xwQypv0mIp4l6oT3E1syzg2LNLxsFgAj4hIUiMCw2spY8Js8OAVPLySu+8NfGNTWGI5p+vKg7rbwjLFXkANCf6Z4SeaTjE3s8REJSyYA3FgEPfHQNLgP7v3lEYsUv1e17Lcq3RDy6P2r+d5ANKd2++ESp9z/3TbvyrzvkFR4iokxOVUXJSWzCm6hCl18CVZkfX9wuWT22MpekTxxBtsRFnJjUZuJOCi3ZzoAk8pgtpWtIi+X7YeF0LCGydfDVXyWw1C79c8CZQJfxPqseG5asnOjdRPc3BlAcnnLZW6phXddcA2VTByl5bCT6QkdJJCLf38YSwUD/b7XJyRmWU6Qzha3+KobnifhALFCMieYzD+CTfZvsKLr2kbqWDXuAq1NHRkTXg5ybp6qhje03A78cih/hM5f9B4/ejJ/YsSkP+3HnxDD4rsmf8KuzDYCnaipl50RvceG1t1H+n3F5UoZ9df5r9h5g0rTRBhTS8YvHt8Y9yd5r5Kr4Qf1sooO8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(38070700021)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2o4TFZ4QURPMWJjbDd4ZVo4ZFBPa1hrNVoySnNRak5QQmxKSnpuU28yT0pL?=
 =?utf-8?B?TzJLY0VwMGZsNmpPckRzNEszQ0h1V0oyKzBZaUdvUDRFc09sSk9kbkp3Skp5?=
 =?utf-8?B?WVBBNEZVSkNqcU1oMkN3ckFUOUtEcWhId2paSlg5Wk12dThueUQ2cHgxTHpr?=
 =?utf-8?B?UUo2WFNZVVhqNG5aazM3QzIvbnhieG9IT2hIRDJLUWo4ZjlrWUNqRlFaR1do?=
 =?utf-8?B?TTVFRk1oRFVWbXFtdGVrcEZHNktCb3JpQWtJYjIyL1FpVkpZTTllNzVxMFZR?=
 =?utf-8?B?M1dZMHdyLzhDRWhJOUEzS2E3dFQ2aU5vV3d2UExpNUVseWRhRVk3eWhzcGhE?=
 =?utf-8?B?cnh5TXpnVWdHV25KSVVtSTlHSUVLV01mcmlRZytld3JrdmxHcnVxL0FVZXMr?=
 =?utf-8?B?VFEvOFI0dUNibXlKNWtkOCs5RjkxMjRDZEpRbVhHZHpFWjRHcnZBV3VXZW9u?=
 =?utf-8?B?bWVWTjdqcGdoa2ZIVW9zSzQ3anIxbTN1QjZkS0FlMUo2dHZhMUwybTJpeUgy?=
 =?utf-8?B?RG1FTTNqeDRGM0FpTWxzRWcxYTRiMUNjT2lURlFOTGZLYVg1M0VOUHZGUkhB?=
 =?utf-8?B?amlFbnVuRDRhaHhIVlNTSlBRQ0hJK0FnMzBxdEVvdjVnTDhpL2lVb1BZeHNH?=
 =?utf-8?B?T0NHcWtsM2RBN3Jlb0xxM2V1R1lSM2NhUHlBS3U5NmphQzk4S2ZCOEhIUXVi?=
 =?utf-8?B?REZaZVBubEp4Znd2QkxJTGw1WjR3dHZSOTJRdWxGRHJ3UE5GZDZRbnREd3JD?=
 =?utf-8?B?NDNYcGp2c2s0U1hOZ1MyR3V3TVhXYmI5L2RTem1ubHFnK21yWjFZbmdmSjZv?=
 =?utf-8?B?cG9qZWxsUGxhVzVLOVJtd3JZT2p0SVdZc2h4RW5ZcERuVENFdjlHUTgvQjFl?=
 =?utf-8?B?MDhNV1drVzBHZWtJc2FKR1pzZDYxaDJLL3hsNE5Fb1dpUG53NXZmSmp2VVZ0?=
 =?utf-8?B?L05lcmwvbzZDdGtNR2JmOU4rTUxMa2dGcXBGWmFqa0dLeVlqeEJQU2pYWWZQ?=
 =?utf-8?B?SFV2TmdYQUh0MUlUUDJ6L0pMYmlyOFY2Zm5zQXU5ZzRCVDg1bnlVSDdpMUlP?=
 =?utf-8?B?Yjcxa0ZFK2lIYUNJY1JmWUxEb3BGWThkTllqSDB3bFFHN2RJMVZlYm5yK2lE?=
 =?utf-8?B?ei9rS0FMMjltTktFYWsxRm96cTVKcUlQR3EvWEkyMGhqMG5STkMzamVKM09Y?=
 =?utf-8?B?dW1rVFJKZ0kzNlVacThtSzhYbFpEelNacUJHRlFOV1FMMkk4TGhBSEp1d29E?=
 =?utf-8?B?MENISkVlQi9kdlVnK1NvbThrOVpSNVhKNGwxV3VFVHJvM0tZQVVXdzVsQlZ0?=
 =?utf-8?B?WmxlT2E4UG41Y0hJeUhZajdUOGk4cjRuc0FDenUxTVVaODNHajZ6U0JOT29p?=
 =?utf-8?B?K3VoYVNMTWxtT0liTXg1TGFlOFBCd01NdEpSMjhpNkhWdXl2OU5odlFCUEVq?=
 =?utf-8?B?eE9nRGo2a2JKM21UR2xRN1AwbTExc2tYS3NuanA0RmZ6UjAxa1dwUERhWUZS?=
 =?utf-8?B?bUJmRitQeWFIZUM2SFM3NDJnS2xuUy9QWVZHQU5NcHZkY0RVNDNscUF1Y0cw?=
 =?utf-8?B?VVRmK2JYNDJNUHlsOWJ4VkU5S1JvL2MwV3BUMzNIUktxaDdEWGxTMGpMWVov?=
 =?utf-8?B?Mmc0elhwRjFrd1BvcmVXY2FFT2pmcUtvVDN3WGRGSjVsU3VNaVI2WngwSXVy?=
 =?utf-8?B?WEJsWXBQY3BQVnRKRTRBT1RuNmRuSkJCeldIdEhiZ1gyRk9ZeENUSkk4R2FU?=
 =?utf-8?B?dDZpSEZvTHM0Y216Y0lLK2RaWW1aOFhQZEJ0em1KQXJSeHhNSFJvWVdTNzRJ?=
 =?utf-8?B?d2FBM3F1QlE0bG5TWjRscWtldmQvcDhOWFdqRkxkcVdGWTdrcVpvRDJFams5?=
 =?utf-8?B?eWdXdGhlZUFrYjFEVy82bkJxS2VCenQrR0dZYjRSZTlCMExVeURiSDVxRTRv?=
 =?utf-8?B?anBXaGM5TmJBUmdJemc2N0hxL0V0QXU2c2g4Tm1Oc3ZxRXRvR2hsZy9GMnBB?=
 =?utf-8?B?L29jc0JjU3BMQVczNGFIWlpSRTZzZEZBeVMrVjczNllqUnF6L09YTkpocTZR?=
 =?utf-8?B?T2Q2Qjgrd3F5SCtSdjBnWlQrU0R1eHZNWENhM21yQ3Z3cmpzYklyUTZjTXli?=
 =?utf-8?B?MGN5YS8rWHl6N25FTWFCd1NSYXpPakI3N0g0V1dhUHhIeUEwQzg3cUJsSkYw?=
 =?utf-8?B?REdMRWlGdUkzb2tGSVVUNEJYT0RZT3BzeHJFRDFybGNpcVpOQ2VSdnB4N2Jx?=
 =?utf-8?B?YWRNdmJaNTJqaU9QbVZobFJiOW9pZ2VOcE5CcUphUUpvbm1LdmNPaW5zSk5I?=
 =?utf-8?B?UXlOSlExQkVtYmJRbnZOWGF2dHFpZjE0QkdoV2JHTVZYOWZ6UGw2dXpnbEk5?=
 =?utf-8?Q?zCsUakeGi5JtVaUDua933KNM9ue0ICZGboh+5VCENPMQV?=
x-ms-exchange-antispam-messagedata-1: QQxqYOClANwmew==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: obU7t3cCrz4zLmFdUrvxj9neo3jWbcJjCpdiytAf2uCElHB2z8TXfKHa0rBKdmBaJlj58OG14t1wZ34xMrABBG+on4xkMgAC1So5A7uY7IS7UfpJxfFeoMOBwyVJg/FYNqTJZfI/MZvskzqS48fkCQaWFstjbNH0MZhFGVKBwjlZoSG/c+ynK/tl1ELj7TxR0ETGKhAylCI6gFbNqq+h+dMjyH3oiK4FjIX+iITP9sW+xbHu1gQDhWN62Oa9u2R6oAuPlkJncJmY0dQo9lTcc0jTFwbzNmYLxj42zNIrgPYdnr3woFLy8KvEJe9z/qTBfLHP+r1/KQj0NF47c19DvQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c114b8d5-a176-4f23-1377-08df3c08c9ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 13:20:55.4686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwTDjtjpuOr6VN1ch0n10MyMQSj1H3VdxHWhU0OofZWv0TxvOg8HVcEu9wnTB/5oxE4fH2h+XL77W5+q6HWrlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB938433
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKb3VuaSBIw7ZnYW5k
ZXINCj4gU2VudDogTW9uZGF5LCAyIE5vdmVtYmVyIDIwMjYgMTIuMDENCj4gVG86IGludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyBOYXV0aXlh
bCwgQW5raXQgSyA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MiAxLzRdIGRybS9pOTE1L3BzcjogRmx1c2ggb24gY3Vyc29yIHVwZGF0ZSBhbHNvIHdoZW4g
bm90IHVzaW5nIFNlbGVjdGl2ZSBGZXRjaA0KPiANCj4gQ3VycmVudGx5IHdlIGFyZSBub3QgZG9p
bmcgZmx1c2ggb24gY3Vyc29yIHVwZGF0ZSBpZiBTZWxlY3RpdmUgRmV0Y2ggaXMgbm90DQo+IGlu
IHVzZS4gVGhpcyBkb2VzIG5vdCBjYXVzZSBwcm9ibGVtcyBpbiBQU1IgY2FzZXMgYXMgZW5hYmxp
bmcgVkJJIGlzDQo+IHRyaWdnZXJpbmcgUFNSIGV4aXQgd2hpY2ggdHJpZ2dlcnMgc2VuZGluZyB1
cGRhdGUgdG8gcGFuZWwuIEluIGNhc2Ugb2YNCj4gUGFuZWwgUmVwbGF5IHRoaXMgZG9lcyBub3Qg
aGFwcGVuLiBUaGlzIGNhdXNlcyBsZWdhY3kgY3Vyc29yIHVwZGF0ZSBub3QNCj4gd29ya2luZyBp
ZiB1c2luZyBQYW5lbCBSZXBsYXkgd2l0aG91dCBTZWxlY3RpdmUgVXBkYXRlcy4NCj4gDQo+IERj
M2NvIGlzIGN1cnJlbnRseSBub3QgZW5hYmxlZC4gQW55d2F5cyB0aGVyZSBpcyBubyByZWFzb24g
dG8gZGlmZmVyZW50aWF0ZQ0KPiBjYWxsaW5nIHBzcjJfZGMzY29fZmx1c2hfbG9ja2VkIG9uIGN1
cnNvciB1cGRhdGUgZGVwZW5kaW5nIG9uIHNlbGVjdGl2ZQ0KPiBmZXRjaCBiZWluZyBlbmFibGVk
LiBTbyByZW1vdmUgdGhpcyBkZXBlbmRlbmN5Lg0KPiANCj4gdjI6DQo+ICAgLSBLZWVwIERDM0NP
IGhhbmRsaW5nIGZvciBjdXJzb3IgdXBkYXRlcy4NCj4gDQo+IEZpeGVzOiAxMjlhNGRhMTE3MDcg
KCJkcm0vaTkxNS9wc3I6IFVzZSBUUkFOU19QVVNIIHRvIHRyaWdnZXIgZnJhbWUgY2hhbmdlIGV2
ZW50IikNCj4gQ2M6IEFua2l0IE5hdXRpeWFsIDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4g
U2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8IDcg
KysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRl
eCAyODg4MzZkNGE5OTNjLi5iMzc3MjNhZDU2YzQyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTM4NjYsMTIgKzM4NjYsMTEgQEAgdm9pZCBp
bnRlbF9wc3JfZmx1c2goc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ICAJCWlmIChp
bnRlbF9kcC0+cHNyLnBhdXNlX2NvdW50ZXIpDQo+ICAJCQlnb3RvIHVubG9jazsNCj4gDQo+IC0J
CWlmIChvcmlnaW4gPT0gT1JJR0lOX0ZMSVAgfHwNCj4gLQkJICAgIChvcmlnaW4gPT0gT1JJR0lO
X0NVUlNPUl9VUERBVEUgJiYNCj4gLQkJICAgICAhaW50ZWxfZHAtPnBzci5wc3IyX3NlbF9mZXRj
aF9lbmFibGVkKSkgew0KPiArCQlpZiAob3JpZ2luID09IE9SSUdJTl9GTElQIHx8IG9yaWdpbiA9
PSBPUklHSU5fQ1VSU09SX1VQREFURSkNCj4gIAkJCXBzcjJfZGMzY29fZmx1c2hfbG9ja2VkKGlu
dGVsX2RwLCBmcm9udGJ1ZmZlcl9iaXRzKTsNCj4gKw0KPiArCQlpZiAob3JpZ2luID09IE9SSUdJ
Tl9GTElQKQ0KPiAgCQkJZ290byB1bmxvY2s7DQo+IC0JCX0NCj4gDQo+ICAJCWlmIChwaXBlX2Zy
b250YnVmZmVyX2JpdHMgPT0gMCkNCj4gIAkJCWdvdG8gdW5sb2NrOw0KPiAtLQ0KPiAyLjUzLjAN
Cg0K
