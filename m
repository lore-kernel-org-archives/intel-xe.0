Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF2FC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFE410E330;
	Thu, 16 Jul 2026 12:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoheCOJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62E810E330;
 Thu, 16 Jul 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784204975; x=1815740975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dzYc45rdp80pH++TytOqAcOG1XP+ArNldZarPPybIXo=;
 b=WoheCOJvtb9tvyd+tczbNq4H75orDW/97c6mvZgkLVMyRY3aS9FWve+4
 hf3KyP8jKyeh7zEIw8HM8DMQYYHaWAMVUlSxpN+tR8ImxpnYqFlTRi9Zj
 nv5PRZqhYziwWE8i2I4nMVzfDYPDb61fwjDi0PXRdrueSF/U6qp9XNpbC
 shQX3I0CUN0sUmW+1Tv/6tg9klRpSA+nfxXX7DWJUvXYlTsr5Rq/b9EDn
 c9DkTuiWwENpIn3ejKdQp/Bw4iOV/xxuYenu6YWjE7BPSXP6nBYeXZ/DE
 4JH2pwJGCg7JbVcCwKA9ttDiuphhDWEYGpTaNdni2wvUaFdvDbqmNSH67 A==;
X-CSE-ConnectionGUID: 9lbgCjElQ+uKFwKm9jcOMw==
X-CSE-MsgGUID: TeQPPNkWQImFS1X7Kkzpxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83982982"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="83982982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:29:34 -0700
X-CSE-ConnectionGUID: Xvt6/6fPQtyAKOaW85f0bQ==
X-CSE-MsgGUID: fTtpdLZpRUeeEvHOOWNX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="257133959"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:29:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:29:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 05:29:34 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:29:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlhO/+tQzHQW6AFI186XGb7ot8qU9vjCvVfW3PFNNTh+g5AcwlyUPY0zVvLFrH4XaxOOwhiN60vmLFBMS84xohWVWxzPWx0S4jeUXl54sOZOrKTfPg0Iar9yK5kh58jnvYWq+7IkD0e4mesAgRvPfbVcpei3ZKhTSu3m0zcVJfnKsku9Ji8i/3VKwAgLr7TQmQ+LQMa5uo9rYtarT1VhqilbwE31yx1G7gKCnMpdT9wuw7MDCHFLoFvpiroe98Ib+akFmYB5v/9KccANNL+DQ4pdGjbMariFlAxZHoJzJIHI3sD9r7NAsL0VmtWikaUE6SYvncQb+88E1wuD2ZjMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzYc45rdp80pH++TytOqAcOG1XP+ArNldZarPPybIXo=;
 b=R/kVKbNEN7mLWK+tHIYNBjXHhUzH4oS+uVAJ0ml5SxBT1Rt8BnesVDGGbJB8IKjDZEmO5WOCX0kuhzKehhk7YYCp/+NZQ+2EbjyWv/kHG1Ic/SfVrxqxfzPY8V/HT3DNkfeoML52dHPKmykqk+xnUQ1uk5nytinDTtT5PDJb9Z7mIiaPvt0b3weoyuWkMgYmV+Y2IBnM1btepKKQgT0sqrcie7AxAIAlw5MHdrIZjnBqtE1GhBZbPP4VzDPEvpbzKevgM9mZ7iykliMIP/aBIC6SC3xhd0NeSeb6JifPb5q3aqGvR5oalKYdP0xhyo6kL/y+GrO20nDQzhf6nVIuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 12:29:31 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:29:31 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v3 7/8] drm/i915/vrr: Return from CMRR compute config in
 case of PSR2 enabled
Thread-Topic: [PATCH v3 7/8] drm/i915/vrr: Return from CMRR compute config in
 case of PSR2 enabled
Thread-Index: AQHdE4FGUVeidF77h02jMc8/03AwJ7ZukPWAgAGFIEA=
Date: Thu, 16 Jul 2026 12:29:30 +0000
Message-ID: <IA1PR11MB63480F3F524DC9318ADDD7EAB2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-8-mitulkumar.ajitkumar.golani@intel.com>
 <79756ac5-c326-4459-bed5-8867c07666d0@intel.com>
In-Reply-To: <79756ac5-c326-4459-bed5-8867c07666d0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|PH0PR11MB4775:EE_
x-ms-office365-filtering-correlation-id: 05b21e84-8ee2-47ee-1f6b-08dee335e2b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|10070799003|1800799024|366016|38070700021|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 9jlduYnkQ/mkH6FDImd4yIIGg12xRFTYozy7NNiEDxnYAPMquHluBzz4uGQ7cVKHdq/I+Wz0p/8G4NHZKAA1Vg2s3scruEUnihVdJmJhP1QymDP8OtZPTyJBImGy1DHtj98LH81PaworkhkTYyjpvk6+MfmOuGKCTJ+wLeYRgwQ6J3xMMJff+KgNd8hJZcxRezvrgkBOSun4aNFAftSa30RbJax2tERiaua2F4cLkIOT4csBh89a9/Nq6nd0klCpTaz/DJOhClemzS3rYFm58K0Q4QxhE2mFFCSCquX5rwiWHSPNfo01jubyAKh+Z7dOCSXw3tMg+l0D7CARGiMTXNy6JeJzhiWIAFlw/aU2dH9H+s57ywKkRrw0RrLoyQFz4W+QtWFn9Ed2v17VGx/Hi8RH9fGjCMkRwk+zvvJdagrvgHypG7thS7sG4mWiybusWYbh+MIJuAQ9fmF5trAQmDAUztThdVFRu64IZHHGmm50vRol6GOkz20f18YwU93+29Q0BhYgQ3UOTBa9kGwyeubgWMNQFQVwqgf6NgjHhj6ShS0yXbBDmzyTdi1CPK6gQDJDoj9KW/+cT/fNDvW+0eOpTKZ3ted4IJw32cwM5JuXQVrmgT2mTcuePuvMgMCb7asi+yNWsB+PsyrNJcVXhqomYfbwxdBd9wXeWewY4Q8DXdMpELHAVMx8cCIKEWAF5H4g59PqYdHJQXcYB/tDX/LUo91QrCPWw7SkvxQ7KQ0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzBQbW9XTnJ2NmxuVTFOdTdjeG1QVTZDUFZzYS9BVkg4emhudDY1aENoTGFV?=
 =?utf-8?B?TzFUb0Y4SW5LcDMyNStQTjZZSmozOWttWGJVUUdCUTE3N3BNa3VrdS9ISzl3?=
 =?utf-8?B?ZHFKcGZ6YUdYRUE5NEZCWVF1QzhyKzJBZmkyOFI2elltMEVkVG1ySXc2cTRE?=
 =?utf-8?B?TFhTdkhsL1hmRWYzb2FZeEJZYzNYeldzMXI2U0lyWERrTlBWVFVrVWFKa0Iw?=
 =?utf-8?B?dnhmQzhJSnRVQ0E0VU1aMEhjeVhReWZ1VzFlbXR1d21jbjYrdVZBZTF2MUN1?=
 =?utf-8?B?dFlLVEVlTXlWb0NqSGZNc1VyVXdhTDRrNFBvU0pZdW1WeWxxcitSMjYzV0Mw?=
 =?utf-8?B?NVc5aEtRcDluSnNORC9IZ1MyZ3Q4MEFYMzJhWkp4QXcvSkIrR1Z2TFFRUjBy?=
 =?utf-8?B?L04zNGZOVTUzQjJxNHBsdzdnTDJKT2hLWmlSQnVPWlErbWdPRGx5T3RneWdL?=
 =?utf-8?B?cllxU2d5Q3NydTNBVHEwc2VsN3V6TDAvWTdBVjNIZzNuNno1UmlLeDhzQ3JZ?=
 =?utf-8?B?cHBJd0l3OUJwZ1pTS1ZQMTVFTmZLa1lHR1BKdUx0TFU2Z1dpOU03VmZ2dmlz?=
 =?utf-8?B?M3MrWE91MjNMQjM0RjhjWjdFcUhTTSs2ZXo4OFhyNC96MHN1WkVHKzJxTU8x?=
 =?utf-8?B?T2dPN21tdkcvZW83Z2J6YVQzTmpkQkxycXZkMEZYbGRFMUZGelRkQi9xN0lj?=
 =?utf-8?B?dEpBb096NVdLc2ZOclErS0h5WDFCd0k4VitGMG9FNnFRcVFndDFoYjJSQ0w2?=
 =?utf-8?B?SXplUVZqWUFxZnliZjloR2hXS1ZIUHNKN1Y3amhXZzJySW9NVmQ0NVU0K0VD?=
 =?utf-8?B?cVpNVHZJYVkwZXBjaHBMS1I4Wk1pWTFweUp3RVROcDBEVDhaRTgvV0h5aU1I?=
 =?utf-8?B?WHgyN3pQME4wcENOVFZQNDMvb3ZlMERjMWdFcFl1YmxpNDd3U29JSW5HeE9K?=
 =?utf-8?B?S0dqT0p6b05mY2IvRlFoVVNQTzFvRmpxVkNSdkEyU21RRDBWU0xyZTFHdWE1?=
 =?utf-8?B?cThJMUhxRnBDYXh2MzFncWxiQndoRmZDb2dvMU15Z0kxSUs2cG1qZlJjUno3?=
 =?utf-8?B?ZnJOQjRxRzhjWEUzSk51THFISnBzRVBBWkIzT1liekxDbGx5andocFc3VHBC?=
 =?utf-8?B?NXUxSVkwL0YwZ2E5V2s2S1lGaGxDcFE1WldQQnlzbkxoNzFTbjBGQTFyb1JN?=
 =?utf-8?B?T254OEo2REJTUTJrODE4M21UcFBjWStxV01UUVVrMU5ubTdmb2J6bEFablov?=
 =?utf-8?B?NUV6alc1MlFYalZwYWpMZU5jd1pySFBLNUpocWtkRCsveWI4RXZrVitBM3o0?=
 =?utf-8?B?ZUF1bkVnWi9kUmNNWGJLSGVZRTlHVDkrcnF0bExZbnRWSVBPTERFQ1R0Qzh1?=
 =?utf-8?B?WUpxR3g0WnAyUmVvY08yQThoTVloc3NIbFpmYzBLN3p4b3c2bm1QdjlMUkN2?=
 =?utf-8?B?M3JJWVdOVkpxamhIMzRQckJSaTJ6Q0xPSXlOcjR0UGkzK2JERC90WGZwY3pI?=
 =?utf-8?B?OERnSjA1NDV5aytRalkxRHNlc3hqZ2ozMHFybUJsSmdpbHU3cGJXeW9KSi9T?=
 =?utf-8?B?R0o4K01BdE5LWjlYT2l3NXd5UU5DZEZXc1I1Rnk2Kzl5b2VwRmVRY2xYeEZv?=
 =?utf-8?B?ajVtYWRYS2s0eE9zR2RqMTIzVTZNbHVyZ2xpbVBrODc3eFVjcG9Oc2h5RjE4?=
 =?utf-8?B?NFN3SEd0RlY3NVlYRmRwSzV3d21CaWVnR1NJVUV2TEVjUXZaaWlNaFJRYXFD?=
 =?utf-8?B?cTlkRnBHcVA1YThGdmlpYlFKVm1rWEFHYWpDT1psOXUvcWR0VDJ6MFBIeVc5?=
 =?utf-8?B?cHZ0MzBxU240MjRkc0oyUkZzNFcrU2ZXU0c3QVpPTEhubi93cGZSRHpWRXZE?=
 =?utf-8?B?dVhRN0F0R1c2ZGxJQ081TXRZWXpKSklnaHNuMmhWU3BrbmdjdTNhNkdpNWtk?=
 =?utf-8?B?RWVRUnlWcE5YZ2IxeHFJQXZSWnRGbDdwMEtiNFQrWTJwNVlBYnIvSmVJV3B3?=
 =?utf-8?B?dGh0eThqbytBZzFrODFVb0lERFA2bWVlYUNITnJHeEZDaUgxNW5majJvWjdx?=
 =?utf-8?B?VzlQUHlYQXN5UFFKY000VU80TUcyek1WMkE1N1hEM0pJRS9TcEJ5Z21LV0xP?=
 =?utf-8?B?SXplZVN1L3NIbkpZM2lkVWdkY05qSWpmNzJVRUFCYmxiLzBEQVNXZHQ0VVNo?=
 =?utf-8?B?MmpoS3VlNGdhQ05CeUdjdmcrazV5NGpnNG05eFBtTFozMHVEQTkrUHdKcnls?=
 =?utf-8?B?b3drUk0xM1dDMWY2UXBwcE52MmFNMnh6UGh4S1pSb3RRZW4yTXpUdjVYdktz?=
 =?utf-8?B?QzJyNlJPMFpaa3hKazJJY3pKMUMvMkJMOEZ4aXhFb2lzSlpTL2M4L2F3UWlC?=
 =?utf-8?Q?lu04gBnQ31xb0D6b+u9GYsyK3oFd7o2lRkQnZ5Ztckuda?=
x-ms-exchange-antispam-messagedata-1: kxMeqvhS+hqj5if/9AdirhOFEM8IQ/N60tQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kVJyxo0cDlZDzWlYUDrL8oQTTvY2nJibQzd89r1z7wb/ZOI4PqVJ3dVfc1zPE9LtOzIC9hxabnwpz5ifoYeyOXu5mmxCrRcVEgs8chCTdr3RRHZH87DAmvhts7zwgZjEx+neiaHbPo6c8Bvy5ZVA0N51/p2TsYisBtElXd2eVvAYMmanqXIk+PhduxBB2t5ngNK0geFve5FAvGnSEcAaULD0SqFhMRryZpksQ1uN9Hp/aePJluV9+lKzU/3aXrroLg+Yr1MIQoX3g4ylgsKlJSGj6gqlDM/TtBVR5Ads0ZvFY1YnoAoh9Ell+J74BwNt7aR7PhAgui4ACAP0l0zmVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b21e84-8ee2-47ee-1f6b-08dee335e2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 12:29:30.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1roVo0G2TW76H2oM1QJyKCNpicYXqULqTblkLa87rcXHg5ksRLPEeU6P5GbuRX0260Q+aTbhGv7xG9CPqSqO1XI21Qg9enO4aHFXoTkqpUMhyqFOJFHO49a+l/DsEnM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMTUgSnVs
eSAyMDI2IDE4OjQ1DQo+IFRvOiBHb2xhbmksIE1pdHVsa3VtYXIgQWppdGt1bWFyIDxtaXR1bGt1
bWFyLmFqaXRrdW1hci5nb2xhbmlAaW50ZWwuY29tPjsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2Fy
LCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47DQo+IE5hdXRpeWFsLCBBbmtpdCBLIDxhbmtp
dC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA3LzhdIGRy
bS9pOTE1L3ZycjogUmV0dXJuIGZyb20gQ01SUiBjb21wdXRlIGNvbmZpZw0KPiBpbiBjYXNlIG9m
IFBTUjIgZW5hYmxlZA0KPiANCj4gDQo+IA0KPiBPbiA3LzE0LzIwMjYgNDowOSBQTSwgTWl0dWwg
R29sYW5pIHdyb3RlOg0KPiA+IENNUlIgaXMgbXV0dWFsbHkgZXhjbHVzaXZlIHRvIFBTUjIsIGhl
bmNlIHJldHVybiBmcm9tIENNUlIgaWYgUFNSMiBpcw0KPiA+IGFscmVhZHkgY29tcHV0ZWQuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXR1bCBHb2xhbmkgPG1pdHVsa3VtYXIuYWppdGt1bWFy
LmdvbGFuaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Zyci5jIHwgMyArKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Zyci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Zyci5jDQo+ID4gaW5kZXggNTJmZTQwZmRiZGIzLi5jYTNjYWM1YWE2YWIgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92cnIuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJyLmMNCj4gPiBAQCAtMjAyLDYg
KzIwMiw5IEBAIGludGVsX3Zycl9jbXJyX2NvbXB1dGVfY29uZmlnKHN0cnVjdA0KPiBpbnRlbF9j
cnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiA+ICAgCWlmICghSEFTX0NNUlIoZGlzcGxheSkpDQo+
ID4gICAJCXJldHVybjsNCj4gPg0KPiA+ICsJaWYgKGNydGNfc3RhdGUtPmhhc19zZWxfdXBkYXRl
KQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+IA0KPiBUaGlzIHdvbid0IHdvcmsgYmVjYXVzZSBw
c3JfY29tcHV0ZV9jb25maWcgaGFwcGVucyBhZnRlcg0KPiB2cnJfY29tcHV0ZV9jb25maWcuDQo+
IA0KPiBBbHNvIGlzIHRoaXMgdGhlIGJlc3QgZmxhZyB0byBpZGVudGlmeSBQU1IyPw0KDQpBRkFJ
SywgdGhpcyBpcyB0aGUgc3VpdGFibGUgZmxhZyB0byBndWFyZCBQU1IyLiANCg0KdGhhbmtzIGZv
ciBwb2ludGluZyBvdXQgdGhlIG90aGVyIHByb2JsZW0gd2hpY2ggaXMgYWN0dWFsbHkgYSBjaGlj
a2VuIGFuZCBlZ2cgcHJvYmxlbSwgSSB3aWxsIGxvb2sgaW50byBpdCBhbmQgYWRkcmVzcyBpbiB0
aGUgbmV4dCByZXZpc2lvbg0KDQpUaGFua3MNCg0KPiANCj4gPiAgIAkvKiBObyBDTVJSIHJhdGlv
IGNvbmZpZ3VyZWQgdGhyb3VnaCBkZWJ1Z2ZzICovDQo+ID4gICAJaWYgKCFjcnRjLT5mb3JjZV9j
bXJyLm51bWVyYXRvcikNCj4gPiAgIAkJcmV0dXJuOw0KDQo=
