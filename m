Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783A7CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 13:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D03F10E482;
	Tue, 26 May 2026 13:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3z+jPe2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0058410E482
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779801976; x=1811337976;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PRCMGnmYlcIjST/rrYjEyb0+a7LCxd6TCBvFklhyqt4=;
 b=j3z+jPe22QzcuqftXaGCnqFuLwvaOCdeyIs8pjU6XP9pd8e1iOkSW48a
 /8hLoclineYe/4Fe5tojYDMTeaXeopm3vjfGxfJZol6sdEVv2wSBLiCvK
 iiKgSf0H9uq5sccXOODOLPpygnPH+DI130hWf75f6AHg3d8wZw0lTa40z
 GzQQdxHzMXOC7irS2YNGwiLRYpBhT/YWNBmvuhMPLGDzqVcIsKytUJ2GJ
 4cgP/akf9W2kzrP8X5Oz9MDfpGLVMcf9ItUsFzJpNjuGHHg+R1gcU7gAW
 Ud/x0aQ5Cqnd8U50VkHe7EO2xZe0eqCZLeR2ssMAVzGA6dMjAvy1e54xV Q==;
X-CSE-ConnectionGUID: QWn2mwoZS7eDR+c1UnUbhQ==
X-CSE-MsgGUID: JN57OfA4RsiRk86wevtVag==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84500344"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84500344"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:26:15 -0700
X-CSE-ConnectionGUID: BN26TktjTC60JguSsvi7RA==
X-CSE-MsgGUID: qPzvNfaaR1acf0MLpmY1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235567355"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:26:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 06:26:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 06:26:14 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 06:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3nuFu5dcvxTVKfrytqgBuwZtXZj41pMxFFgS3hY8yrt/U+zwHknetwK0wnPUhuefnQnnOjJWdMESj2DunyTyk9CkvRzuE6Pld3SqEU1mbw8fpHABNJoKZwejfT/U7a9XqWjG5yXeRngvQ7hI7VOucswF2NOdA5O8g80GATfeVejJWr1fff+1NZXVlnHKEEtB2qrLefgLhZmg8TVGWeKuSbCosDH0wue+80E+x+7Vsbj1dMP6kaN6qW5cCS4rI+71ofxa2xBXA7T6czWiNLLaiX00B+CcDgl4/LW8cUL+PfPvk8NfywN+yS24i6UHXeoiXGMa7qD1Corb17QVzJ8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRCMGnmYlcIjST/rrYjEyb0+a7LCxd6TCBvFklhyqt4=;
 b=XxTS8BGoxIZLDLFa4zKuU0RsFqtzWluj+5hSP8RRnCwov+MdWUFdi8yh5TEQTho0FCK+18pRJRO+mPUdjHtBXpOjZ6xWAv21A2dM5Ar2jKko1VExS+oAOiUexg1R74oYRQuTO+k7a0TOlDQfVejM3rFOF1SFhOa1utoViHxs34P5zwSlzgmuoqUsfG10S+SwZUC0FAWK785bHUkAxtsNio8NYE+tGC26qwl0YFJ/kDpfW0Q5dm8+qf5MjOudEY4aLt9at++5ROA6y8I69TVhdxLeWFr43LsnDxAPYFYg6IMIyi31egLxoCKgyK4udKoFuzt/ndA2qBVX9d3XrqSMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 13:26:11 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%5]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 13:26:11 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH 3/5] drm/xe: explcit TLB flush for context based tlb
 invalidation
Thread-Topic: [PATCH 3/5] drm/xe: explcit TLB flush for context based tlb
 invalidation
Thread-Index: AQHc7OmChaNz/BTW5kSiYW3zL1e+9rYgG0eAgAAsDZA=
Date: Tue, 26 May 2026 13:26:11 +0000
Message-ID: <SA3PR11MB76257D4D419D10F5E3F85531C80B2@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-4-tilak.tirumalesh.tangudu@intel.com>
 <6e2de381a46fc4c6c5a0038f8e848e8528bb938b.camel@intel.com>
In-Reply-To: <6e2de381a46fc4c6c5a0038f8e848e8528bb938b.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|DM4PR11MB6095:EE_
x-ms-office365-filtering-correlation-id: af6c84e5-755f-4c06-202b-08debb2a5a93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700021|921020|18002099003|56012099003|22082099003|6133799003|4143699003|11063799006;
x-microsoft-antispam-message-info: x/AeEHfDZGq2bMI+Penm5rbaIpIf4qH3R3tZcyZ5DO4QE78GuRmxqYCBY5AqLKbh93GGJckJ6nxyV7lxsjLrg3Yn1oKaV+CK3I6GiodeqJIyGd0Shv9E6FqAWlD9sLKfKhwFzm5Xc41z37lYOJB/qPdmvnPTu8jxkGCKGLko8giotP6J2K6vcw6x0bgKQoIIGN1/TrKkgKqcivgCaElkKJU2POiAxIKtPlpLesp7EvMhexfEXkddblTL/cTs4XUiPEQ6/vu2eFBDGj/D8/DFJiZJN1yaCz+sMZ2CfT0q0pnQRrmXf+5YJR1DglTPQzKJTTmso2fQg0QRIwZE3h2ZsnKoo1ZLZ0L7Hk0zUohmYr73pkVxy/SbYQKn3LNALcsbFHxWekUYASD4dB7RYC/nqF34z27hN2RiVkRAL4qS9XDi7r5IZm4Haxt7IBe7qziUfqhvLOSp/jAXZIf8fmfxv69SEhinRvrZLxaf0UjS2iqBynRe7YY3ElvIG17ZGNKVoClkBjJ9tUP664cnnaZhqhVjL4ob0/edsuJMbH3CsENy57jE55Bq04hRBIXnk7Lt11c9ZUIYYevGtPxHLvSSYUeJqn5nmDU2jybj4uqAvZjk5VPuLUP4kFBdmAPmEsUSySAcNA4vZ3AH1d+Jnm6WNHbRz1U39z4W8Jk7ihCDTiP+gGefUKzAIAupP4bLnfpdEOhvWMyDUxvgr5vaE3cVtRHQSyCkbtQZQUmRZec4xX+b7rqNNo3X8hT4VHMzHqhoeIgqNg6e0EXZNuy/UzSjOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021)(921020)(18002099003)(56012099003)(22082099003)(6133799003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGYvTEg0b25HaFFPa3Z5YVZoSGcxb1ZIeG5XQVZxTTZ6WmhBK0c5TklRUjNY?=
 =?utf-8?B?Vk90enpLMVdxanhzdTlXU1VGYk1QNmtPWENTYVo4bE9UaFRFVWxJMEJrUGVk?=
 =?utf-8?B?ekVveVFhS3c0QmZ1eFdVYzBlMjRnbUNWNGpraU1VdUdLRzlFMHUrUUdpTTAv?=
 =?utf-8?B?aDVjN0NzRTBxWk1LZ3hCaWJOZkg4dE5NQjNKRmphcHd0aklCU1J1N3NvTkZK?=
 =?utf-8?B?MDZ6ZGxiUzYva1RHZlpRd0FVWEdoV3RZNlc0OVF2em5GTHdyYjN4QjJ6MFlQ?=
 =?utf-8?B?bHJnRENIT0VjdXpWNTFiVjhmMkdZd25aSmlsTjRUYldnYkhFYm5GNW9jZ2c4?=
 =?utf-8?B?R0JaVDlMNmtpUnJsR0g3bHhPeElJbGswQ05UZzA5UUdoVEMvUjdRVi82SnJX?=
 =?utf-8?B?aXI0VnVqb0pTMWZzdHh3SXppMWZRS2YrNUNGSUw5UGoyUzFoS1dvR1dXMjNT?=
 =?utf-8?B?a0JmcXEyaml5ZlNHSG9RdEl2eVFKdjdlbGZxcUpHdnRUTnZmRTNrSjlpLzhB?=
 =?utf-8?B?VWtTUm1COTArOUtBeFJ6UjVmUFBrVzlQUXNpVGNxdHh2bXdoNGtZNmFhR2RM?=
 =?utf-8?B?K0RDVTAwYmZRdXFvU2hCcUxYODlrYS9HQTZHaThnR3FuQm94OTJhMUlheG16?=
 =?utf-8?B?MHA4M29Uc0xVY0xCZ3FydVVwVEZidTRIYXgvY2hqb3VuNnV2ekV4TnZ5WGNY?=
 =?utf-8?B?elRValAxMHJ4L2Iya0MveHBsY3gxYzFaN1o3R2V0UldheDRpYlh1YkhHQWpD?=
 =?utf-8?B?TVNtbGxmYW92UWVFaTdLakpVMUR2ZUowVlQwVVNERlFqdnEza3U5S1FaT2ha?=
 =?utf-8?B?alp4aWZkY1RYL2tyNGxDbEZueVVkb25aS29CelRvNHF6anBiNG5mVTFLd3BL?=
 =?utf-8?B?ZGprd2NteE42K0JPalA1MVZnblptYkhlazBGaHh1MGtZbGkreDU5MTdDSW5S?=
 =?utf-8?B?eE5xTlc1U0tDTUlEQWpacXlxL04vSklIdThKdnhxb1RFSHFWNjRLS0NUbU5v?=
 =?utf-8?B?N0c1NlphRUs4bnBkbzBBbFZPb2RzYzNiS3BVMStjUW1acFEyczlUWWpQUVlZ?=
 =?utf-8?B?K0dwdldmNm1vaU50V0luTXpndWZDWlNUNkRzeVJuRjVoRE41UWJ1Ryt2MHdv?=
 =?utf-8?B?K01JZEQ3MFhOQjVnSXVmMHhIKzY1a1FPRm0vdXdCdVR6bmpkNXBpUjI4Z01G?=
 =?utf-8?B?VTRCZkdZaXI5OTYvRkE3WEJOYmJRcENYb1FLOW5aTlk1ZDJubldya3hwQnh4?=
 =?utf-8?B?VVl2MWtOaEFoMTlnazVtaE5WN1QyQU5sS0xhWXl1UldrdHJITTZSRHFXeC9i?=
 =?utf-8?B?ekY4bXhOZVlIVGV1cVhiSFZ1c0VTcnk5UTByWG5aN1l6Ymp0Y0RTaE0rVkx1?=
 =?utf-8?B?a2RURU9KRklTR2p6SmxUaEdOTU9xUGFMNWVzZXJGeTFrOVNvd1BBaU51ekli?=
 =?utf-8?B?UGllSDJZMGhPNUkrdk4zbmlRV2dCK2taWHRKMEJHYnJQNVdWc3l3d3JNSFow?=
 =?utf-8?B?MFZBUzBvWHR2VGVHQVQwUFN3YVpodGMzSmp2ZjRYR3JKSzh1SFdzdFUyUGRD?=
 =?utf-8?B?RWh0d2tWckZ3YlNUOUNnYlh0aEdFR0Z4bXVHVStrMEs4VTR0Q0JKYjlOekhT?=
 =?utf-8?B?Z1d4K2ZDZVNHRWRuaFhkVTZjejhsalJrZFRacE13RTBlTlgrOUwrM3NOMFJp?=
 =?utf-8?B?dEdBdmpFL0dtd3o0eUJjR0FnekdnMFJjRDBIY0VwRGZrU1UzYk41bXFPK3FH?=
 =?utf-8?B?WFhmN1dlS1loY2hmbHB1Y2E4TFRXYWZTNnRZWmVidkVSWGlxZTVJS2FqRW5u?=
 =?utf-8?B?WUZTb01kK1hIL3haNFlxcXdCRmR6eGZNbHlUSXpHSlVRMlk3L3pOL3A4V1M5?=
 =?utf-8?B?M3hjSEY4YkxlakE1RE5yUUVwejNWYWd3eHVxWWxLKzhPUzBwZDhMQWdMNHF4?=
 =?utf-8?B?bnhsWXkwRFR2eS8rLzJiS3d1YW1nMVRGaytGenNCTVFqcGFSMjhxYkQzYnI0?=
 =?utf-8?B?TUtFN004TTB0QWJNV3BUbkVaTit0Z0JsZjVUYWZHaDk0Yjg0eHovRVlaTWI4?=
 =?utf-8?B?WHFReG9QaUdLY1JIQytVcHVtVTRUUzhXRHZFMFMrNjR6MFJPTnNIR3hoLzNh?=
 =?utf-8?B?b3FIcGlhc3FMTS9TajliRWxPaHAxTWxEK3UrdXFxOUxIa3VpLzRHWHcyWGpm?=
 =?utf-8?B?K3I1RnpTS08vVVJvNXhRcm01SWEreUVYbDNBNUErWTRyZ3JWYi9UaGIrRjlp?=
 =?utf-8?B?bmovTWN1WWdyK2FwaVUveURHTE1pVDczTkVIWVdxbTdJdlQwU1NaT0VRaWxp?=
 =?utf-8?B?QkliSEVnMzBKWjRGNTZsSG9yUHZKMjVlK1FhRFY2Q3kzaklrMFpCNXAva3Ev?=
 =?utf-8?Q?xRVbij5Pf7wWZZLTTzjxJG2rTrhc/e9KAbamib9pFKGO4?=
x-ms-exchange-antispam-messagedata-1: W3k62VT5PFOdKQce3j0BxMuI/xAb/xHQeM8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HnsMft83A79VzN+9WuCsGobYUmVRDswSqYbuTgmJM4CSawDBCedZmGe5E284sqIE2bqOwQSeslnKBzyh/7LFP5G1WeDTrYN3DFeCnD69yFFIW7ZZciKDF8v3H6IVmG1NwUktKHe87C8b59X+KJM8jNS4wpQ6UpudmxIGbAPqNWwzB8FZznwbro23lZJN/pTUvACKQh5aneWs/H0E4Q2kkIoB1mW/66Vp7YJ69E+ctiOP71YvtjZXc9y67VUmwalhWpTLyFQwUFdznFUUD0m1yUQKPqWz9hM7niDHNFMU1rhkaI42mfTZ8ITX/QGItW3iFp0myqy4PrmW2oLO6TMnnQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6c84e5-755f-4c06-202b-08debb2a5a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 13:26:11.5236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m5O0p2dtByOGg6CW8gqmW60wCtkWGUdIU3dSixNF/BtxjJdataw572f/r2zgfNK5xdDkKmEpBur7q9vANQSO9QDMmn5nah7IgnhI3xSGqkHTke0K5AEPinDYyEl3NtnM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBIZWxsc3Ryb20sIFRob21hcyA8
dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+IA0KU2VudDogMjYgTWF5IDIwMjYgMTY6MDANClRv
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRhbmd1ZHUsIFRpbGFrIFRpcnVtYWxl
c2ggPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+OyBOZ3V5ZW4sIEJyaWFuMyA8
YnJpYW4zLm5ndXllbkBpbnRlbC5jb20+OyBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+
OyBXYW5nLCBYIDx4LndhbmdAaW50ZWwuY29tPjsgQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT47IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVy
aW9AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIGRybS94ZTogZXhwbGNpdCBU
TEIgZmx1c2ggZm9yIGNvbnRleHQgYmFzZWQgdGxiIGludmFsaWRhdGlvbg0KDQpPbiBUdWUsIDIw
MjYtMDUtMjYgYXQgMTM6NTYgKzA1MzAsIHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5j
b20NCndyb3RlOg0KPiBGcm9tOiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2ggPHRpbGFrLnRpcnVt
YWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IA0KPiBJbiBMUiBwcmVlbXB0LWZlbmNlIG1vZGUs
IG9uIGRldmljZXMgd2l0aCBjb250ZXh0IGJhc2VkIFRMQiANCj4gSW52YWxpZGF0aW9uLCByZWJp
bmQgb3BlcmF0aW9ucyBmb3IgVk1BcyByZXF1aXJlIGFuIGV4cGxpY2l0IA0KPiBpbnZhbGlkYXRp
b24gcmVxdWVzdC4NCj4gDQo+IFJlcXVlc3QgZXhwbGljaXQgVExCIEludmFsaWRhdGlvbiBpbiBu
b3RpZmllciBwYXRoIGFuZCBpbiBQVCBwYXRoLg0KPiANCj4gVXNlcnB0ciBWTUFzIGFyZSBleGNs
dWRlZCBpbiBQVCBwYXRoIHNpbmNlIHRoZSBub3RpZmllciBwYXRoIGFscmVhZHkgDQo+IHN1Ym1p
dHMgaW52YWxpZGF0aW9uLCBwcmV2ZW50aW5nIGR1cGxpY2F0ZSByZXF1ZXN0cyBmb3IgdGhlIHNh
bWUgDQo+IHJlYmluZCB3aW5kb3cuDQoNCkkgdGhpbmsgd2Ugd2FudCB0byB0cmlnZ2VyIGEgVExC
IGZsdXNoIG9uIHJlYmluZCBoZXJlLCBldmVuIGZvciB1c2VycHRyLCByYXRoZXIgdGhhbiBkb2lu
ZyBpdCBpbiB0aGUgdXNlcnB0ciBub3RpZmllci4NCg0KT3IgaXMgdGhlcmUgYSBzcGVjaWZpYyBy
ZWFzb24gd2UnZCB3YW50IHRvIGRvIGl0IGluIHRoZSBub3RpZmllcj8gSSBiZWxpZXZlIGZvciBi
dWZmZXIgb2JqZWN0cyB3ZSBkb24ndCBUTEIgZmx1c2ggb24gZXZpY3QsIHJpZ2h0Pw0KDQpUaGFu
a3MsDQpUaG9tYXMNCg0KU29ycnkgZ290IG1pc2d1aWRlZCBoZXJlIGJ5IGNsYXVkZSBhbmQgYnkg
b3RoZXIgRklYTUUgY29tbWVudHMgaW4gb3RoZXIgY29kZSBiYXNlLg0KT2sgdW5kZXJzdG9vZCBp
dCBub3csIHRoYW5rcyAsIEkgd2lsbCByZW1vdmUgaXQgaW4gbm90aWZpZXIgYW5kIHdpbGwgZG8g
YXQgcmViaW5kDQoNCg0KPiANCj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LjYN
Cj4gU2lnbmVkLW9mZi1ieTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIA0KPiA8dGlsYWsudGly
dW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3B0LmPCoMKgwqDCoMKgIHzCoCA0ICsrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dXNlcnB0ci5jIHwgMTUgKysrKysrKysrKysrKystDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyANCj4gaW5kZXgg
MjY2OWZmNWVlNzQ3Li5kNWM0YzgyMjA1ZTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+IEBAIC0y
MDE5LDYgKzIwMTksMTAgQEAgc3RhdGljIGludCBiaW5kX29wX3ByZXBhcmUoc3RydWN0IHhlX3Zt
ICp2bSwgDQo+IHN0cnVjdCB4ZV90aWxlICp0aWxlLA0KPiDCoAkJaWYgKCghcHRfb3AtPnJlYmlu
ZCAmJiB4ZV92bV9oYXNfc2NyYXRjaCh2bSkgJiYNCj4gwqAJCcKgwqDCoMKgIHhlX3ZtX2luX2xy
X21vZGUodm0pKSkNCj4gwqAJCQlwdF91cGRhdGVfb3BzLT5uZWVkc19pbnZhbGlkYXRpb24gPSB0
cnVlOw0KPiArCQllbHNlIGlmIChwdF9vcC0+cmViaW5kICYmDQo+IHhlX3ZtX2luX3ByZWVtcHRf
ZmVuY2VfbW9kZSh2bSkgJiYNCj4gKwkJCSB2bS0+eGUtPmluZm8uaGFzX2N0eF90bGJfaW52YWwg
JiYNCj4gKwkJCSAheGVfdm1hX2lzX3VzZXJwdHIodm1hKSkNCj4gKwkJCXB0X3VwZGF0ZV9vcHMt
Pm5lZWRzX2ludmFsaWRhdGlvbiA9IHRydWU7DQo+IMKgCQllbHNlIGlmIChwdF9vcC0+cmViaW5k
ICYmICF4ZV92bV9pbl9scl9tb2RlKHZtKSkNCj4gwqAJCQkvKiBXZSBidW1wIGFsc28gaWYgYmF0
Y2hfaW52YWxpZGF0ZV90bGIgaXMgdHJ1ZSAqLw0KPiDCoAkJCXZtLT50bGJfZmx1c2hfc2Vxbm8r
KzsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRyLmMgDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYyBpbmRleCA2NzYxMDA1YzBiOTAuLmIyYjU3
ZTcyOWVhYiANCj4gMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRy
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiBAQCAtMTAyLDcg
KzEwMiwyMCBAQCB4ZV92bWFfdXNlcnB0cl9kb19pbnZhbChzdHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1
Y3QgDQo+IHhlX3VzZXJwdHJfdm1hICp1dm1hLCBib29sIGlzX2QNCj4gwqAJCQkJwqDCoMKgIGZh
bHNlLCBNQVhfU0NIRURVTEVfVElNRU9VVCk7DQo+IMKgCVhFX1dBUk5fT04oZXJyIDw9IDApOw0K
PiDCoA0KPiAtCWlmICh4ZV92bV9pbl9mYXVsdF9tb2RlKHZtKSAmJiB1c2VycHRyLT5pbml0aWFs
X2JpbmQpIHsNCj4gKwkvKg0KPiArCSAqIEZsdXNoIEdQVSB0cmFuc2xhdGlvbnMgZm9yIHRoaXMg
dXNlcnB0ciBWTUEgYmVmb3JlDQo+IGRyb3BwaW5nIENQVS1zaWRlDQo+ICsJICogcGFnZSBtYXBw
aW5ncy4NCj4gKwkgKg0KPiArCSAqIEluIGZhdWx0LW1vZGUgVk1zLCB3b3JrIGlzIG5vdCBkcmFp
bmVkIHZpYSBwcmVlbXB0LWZlbmNlDQo+IHNlcXVlbmNpbmcsDQo+ICsJICogc28gc3RhbGUgUFRF
L1RMQiBzdGF0ZSBtdXN0IGJlIGNsZWFyZWQgZXhwbGljaXRseSBiZWZvcmUNCj4gcGFnZSByZWxl
YXNlLg0KPiArCSAqDQo+ICsJICogT24gZGV2aWNlcyB1c2luZyBjb250ZXh0LXNjb3BlZCBUTEIg
aW52YWxpZGF0aW9uDQo+IChoYXNfY3R4X3RsYl9pbnZhbCksDQo+ICsJICogYSBjb250ZXh0IHN3
aXRjaCBpcyBub3Qgc3VmZmljaWVudCB0byByZXRpcmUgb2xkIHVzZXJwdHINCj4gdHJhbnNsYXRp
b25zLg0KPiArCSAqIFRoZXJlZm9yZSwgdGhpcyBub3RpZmllciBwYXRoIGV4cGxpY2l0bHkgdHJp
Z2dlcnMNCj4gaW52YWxpZGF0aW9uIGFoZWFkIG9mDQo+ICsJICogdW5tYXAgdG8gcHJldmVudCBy
ZXVzZSBvZiBvYnNvbGV0ZSBhZGRyZXNzIHRyYW5zbGF0aW9ucy4NCj4gKwkgKi8NCj4gKwlpZiAo
KHhlX3ZtX2luX2ZhdWx0X21vZGUodm0pIHx8IHZtLT54ZS0NCj4gPmluZm8uaGFzX2N0eF90bGJf
aW52YWwpICYmDQo+ICsJwqDCoMKgIHVzZXJwdHItPmluaXRpYWxfYmluZCkgew0KPiDCoAkJaWYg
KCF1c2VycHRyLT5maW5pc2hfaW51c2UpIHsNCj4gwqAJCQkvKg0KPiDCoAkJCSAqIERlZmVyIHRo
ZSBUTEIgd2FpdCB0byBhbiBleHRyYSBwYXNzIHNvIHRoZSBjYWxsZXINCg==
