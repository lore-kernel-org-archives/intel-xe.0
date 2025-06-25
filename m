Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78140C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2210E751;
	Wed, 25 Jun 2025 14:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGxRfPim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6409910E74D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750862840; x=1782398840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JLcWVOHjA6AyPO009vPSkmQDmT/2lSNl6So3ygxo4ik=;
 b=kGxRfPimDnnnkymDigenb4mKJjSn1HavJgtdXZGsa/YnEQVUxRe8qiUI
 g+0fuSppx4jlaWJO79hghgE0qip3se5dOzDm1Vfw+jG2vh+1VkFl9gqFV
 bLSFIzwlFWiI9UC45kUxxUovgRphU5jHFtuDxzIZgvWMTKwDbNnz+Wg9q
 u3VtZxvzWy6lMNz1YipjOM6n3TNjjgT7Lw/+keQnRlQgPBo0dYbqc2e5v
 AoTexFBcIAYhNWlRaedGUVFJyy6k6RqvBsO8I4+Z+bg+EihJH7Z2ykrOR
 TXKKyh2/4XOx0NYHxA5D80dcq4YZBJAjhiHTq8iTRsLtvJ5iHZ0lwk3rF A==;
X-CSE-ConnectionGUID: G8muJhILR9+vg5T/zXyUog==
X-CSE-MsgGUID: 9b8CbkN/RK2Gb0bD2Rwaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53275648"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53275648"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:47:19 -0700
X-CSE-ConnectionGUID: hFKP7YLnQ3WfZoDiexvzoA==
X-CSE-MsgGUID: f1mZ2R3sTrO0ysINymNqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156636622"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:47:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:47:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:47:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USs/Kh27WGHcM8PgTTKpGhvDuo3pCSbf34B01GeST4Dxv6Hw2I9k5hn2vUPGogR+Y/SnoX/plMDQZBKw7WQaQxDantAP9MdSiGMgUQvt8zGexDMrqiPlsa/1Mptnni7mldqRx8AKuVtKKWL3s0s7KuCo46PeNs1yO8IPNhDSNkcMi47kle1MsDJHfxZKkrxazoDn/YUPhcN9ZpkdFZN5n0aLJjPey4qdXsc0P2DuWQ9ZjiqFwjvjjPtkBBV64xrhC7Jo+FmNlKyPDkqZqzIZLTjHYeA9JIGPY3H9VXgfl1hUz/G40rmfS9BxS4Ud32DegdXHCb5lPRISvKcb0v+WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOe/m74MMnutK/ek+eaUg/P8pH5YzEXA57WLVeOZylE=;
 b=pGh3PS9it8+xNfCLY0ghhYzJSwAAqy9VSV7ZaVNnYu6IKOzhz1XcoyuT16tlZEqSYk2G2wQIiIQVMnu6YyNjXj8/TFnwgQd9WuBuuLfZVNLardlftZfLmJBX1B/0C9wYFQ9nv2epdwPHCkRNsOMbsVi8Ig4nLSSSAWoNsa6GCEWrJdTeMvBjXv1I9to48nbGOK7ggma0RtMPe/WCUUdrEBT6TB8/f/mB/yt1CBVw8Gvjhs7A/l2EtVVvPWC55RPMwJxOFiJEVU5srgF/XsIuxr9pi46/dnfr3gbfum8hLZHfSa808XyWtCx96x2NY86NKGUKF4OpJPqmSf4zQUdqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 14:46:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:46:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Thread-Topic: [PATCH v6 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Thread-Index: AQHb5d7vBQZJL6MKC0qvTaEMRX1I77QT87kA
Date: Wed, 25 Jun 2025 14:46:49 +0000
Message-ID: <CH0PR11MB5444E60E76CB4BAFE1CF0CDBE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250625143254.3505218-1-soham.purkait@intel.com>
 <20250625143254.3505218-3-soham.purkait@intel.com>
In-Reply-To: <20250625143254.3505218-3-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8660:EE_
x-ms-office365-filtering-correlation-id: f5afd286-b73c-4006-f130-08ddb3f71df4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7053199007|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?0RE3Yn4zVdvwxNYrCx+tZq/8xuKPYomq0lr4ZspZo6tbYjXP/w0IMpl1MM0+?=
 =?us-ascii?Q?0idFGwy+SqfmG/OoDblykr/kq68oRgFFSwk0mm44iDYTLJS3v7XeGTEQg8N1?=
 =?us-ascii?Q?gQ/zbqOUTy//Tn0LudLW6qz9KTyEdVsjSpFMY1QNXsbMR40x/rji5X3Hqld/?=
 =?us-ascii?Q?dqnlLVWkAwxtdU19WtJnjA6JLSnCwVWRLdfrRSCkytzgnxCcs0u9shsetm0b?=
 =?us-ascii?Q?D5tYQkxk87LXG3k/0MrNGmTencggph+HSXPsXzFJsy/EeJmkawi7yp0tstDx?=
 =?us-ascii?Q?PhPhnznogTKaXxOJwlsKd6/HtzQJHiPpaD7heRQYr4nqZchgJenEJcNtahc5?=
 =?us-ascii?Q?osiDKr/UMTSy1xH8THPTRKal9sgVPmWCbG9eJ9V3x1uR2IX4iYhXH0RhYkdR?=
 =?us-ascii?Q?BuR4VHTX6TYQL6fG66GHmA+l/bWamnT3FpCpmG0S7P4PkUULhpcP/PqgD49X?=
 =?us-ascii?Q?Bp3IYbQVfIW3TOWsPerdQJzYY1ZQk8hEv5kXjS9j1Zqt21LTfiyTvZNGVqp4?=
 =?us-ascii?Q?OhhVjW4POKQMXRZ5ukL9D0xHw4sE0OiYVUPI2PWj7K0bTQBfNTmdnye11Klt?=
 =?us-ascii?Q?gELMYLDHCi0icMCVsJNodp5ETLh+GMIzJQ10wPZryzqSajmtGcXja+irgdzs?=
 =?us-ascii?Q?dbvmYtaaVMj4ZywYqpcS7m0UUU5ti68uXgjeLs1I7/DYZzLc0A2B0ezsiETZ?=
 =?us-ascii?Q?9UXhvQHnz49lWN4QAr4Pz7GAei5YOghjXFQDgLg7l9l+v3L3fQWI8AlT1QTv?=
 =?us-ascii?Q?K0FPSPaB2Kt0g6kwnrU1m1fs5wPhsFbHmQCu3Ep5PEdZe2+hIsNixIeDKQUu?=
 =?us-ascii?Q?tWntYML7vxKAP2d5owSTrf0wIErGH/TjJ905/vzoudlmUf734vCJ/04oThm3?=
 =?us-ascii?Q?NyNrXW2yP05VJ5MmKOCB//QI1LtoXPEcmGct1VRXijBbrzUzSrPg7/2XfvWQ?=
 =?us-ascii?Q?tq6kQ7Lr9kxuzR3Vmq8fiZoafyKduo0nunDKBixCVzmoSef0wsaS+MD9RT1U?=
 =?us-ascii?Q?arZ3y88ZrZTNWxJzwXY0bfRMMfPknhoAl8JhPCU4A9uv8RznjMi1mPYXkRWz?=
 =?us-ascii?Q?Hn+9CsXplgPVKr3fdEci/KCE9XsvNbMf5mV6abiNc1lysLfJqJsZlfd4ZR+z?=
 =?us-ascii?Q?bEKAHldJRVIEUoURQlLspH84uWK5Fv+UJ0ZQCvs+hCTAHDgGHSQlgjKWvLDK?=
 =?us-ascii?Q?8o2sUAhK3+fUBeTokJSU0ohrhFlRVzDGigFRz/O6RYHtgECSxfCz4aAiOo4H?=
 =?us-ascii?Q?UkUirfS8N6xmQ1WGHy0IIHhaHnM8xnsuG76xGp0itueMzCj+E01x5DynUpJP?=
 =?us-ascii?Q?zj/IlbbRI1YXSDy9CiMsZVVtLWn5hVcdbJ89keLuWLhHkRc5XlM0/ELShhC4?=
 =?us-ascii?Q?6ZW1k5Lvsh+xSsGYROwQbX6Fqt5tAsNAK5QbHzbRIyVeJjRoSRfokmd67kuR?=
 =?us-ascii?Q?ahnBFZw9AJmxFzE5JYC879kpaXZq6ND2Yi+/brJjUY59zTKPiLQQjyal2PbH?=
 =?us-ascii?Q?64QwPTzSjBq3QRI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B0CxVuaNd3YDzhvRdET9qpZznrV7aUcAxBaOGLueo7BIkcUplmSk75f9Hl4O?=
 =?us-ascii?Q?MHHTd0YA3T6u7UoKkWjTFdheTK4oYXlVDRZrUeNQ4brOJpVFYCOm1ZNzCh3A?=
 =?us-ascii?Q?L/wVK+wgeEiWQoQXThMxlGNF80+94C2gsyrJ8qe9q3Q7/HO6HMjBLWfr4RWG?=
 =?us-ascii?Q?MX8e9XydvIcKibtuZ8Du0NAVpma1+83sCxMMG/UJq3LiTut7x1oUDhq2kDcZ?=
 =?us-ascii?Q?Ild0QKsX9y7EffGhHQB2DDx6/HJTvTnucBfM4mgKus9vHaAyCanV/6lw4w0G?=
 =?us-ascii?Q?nP1nylqd/VYhiZ5L6kHDF0/UYdn5DWIoBi/GH/Oz3Yw3mxHMsLAQ6ViTD8HI?=
 =?us-ascii?Q?VgYwjR73M9uxVJThfFOE8keGLCL5qtQ35I2TBsrGz8aPXL2C8GVBTwWePHQF?=
 =?us-ascii?Q?37P5+sQEQBXRH/HMMx0fgm4YKwV+8u6cXgncOx59bFzgSL6tbmkLFOAR0r/R?=
 =?us-ascii?Q?CztV7KcoVEE9/6Yutwm8EQes4CTp59ih1Y0t2HQDn5rf17LKV7o+wuebdYeg?=
 =?us-ascii?Q?42hI5U4MVPud+qIdS6OTN9m9hZXMTHov4YzGLaxGEaId7iyeePA1uT+Tfc3y?=
 =?us-ascii?Q?OXLIRcukygEXZmvmTmWnthT8c+ebsBDtBtZsr7y8bD7CTVOLpNnUx0ptVEDC?=
 =?us-ascii?Q?BukE/B8azYIKLLJUPf6DnhihNgEDwkWJ0LnYX/Y7BQs/TzWvos251sDW2eMM?=
 =?us-ascii?Q?0GpwJtpsaJ6jLNobc4V2nx/kug0f0VV/O5mWnyEAE3oFUp4/4oirH/KsOwLk?=
 =?us-ascii?Q?q9jKEPvPyZ8KpOhy8XhMv9K9zuJ+5CLcMxKeem3jscvnZQu27GIq2d7anotH?=
 =?us-ascii?Q?iXcPXXX+fTNann09MilPflDkEZa8MKB8j0ZTwttdd4Paln3/Ros58rnUhmBy?=
 =?us-ascii?Q?Mr3dDCGFsdWKIiHDi4zmuiBQoNupLx/YE+DR2T2SMQbuAKztgLTEU7p7215R?=
 =?us-ascii?Q?QO/RXY9yZFUVIgzDblfuhrdfhg1iHElOvimFU4/1Yo56l1HKVGcDO/yJaeWP?=
 =?us-ascii?Q?iurmpEQF4LpyDvFZ0b7cBJrIBEqZH03NwPIVC8gwYAApilaUk/j3sHCGCWjG?=
 =?us-ascii?Q?iobKthCWqEN0V7EsTlf6M5Pwi7JeMAarn3xA0F1ZpNvm6bkK9JcXYvTFKqpn?=
 =?us-ascii?Q?YpmzvezrGqsCio53EqcC3mueN/3ob0GQzYUyDMqqvIOSI57cNGqMJOiwRb24?=
 =?us-ascii?Q?QaI74Kms0ToKEcPvPp5qPxBGxaIQThUV0jKtKl0y7u8KnqK25t32R09JMxw5?=
 =?us-ascii?Q?kzVaDxqLBAAlKT48L+57Vt9zjL08hPCidGu4V3yANE2oqbi5UyFjsGd+m+dk?=
 =?us-ascii?Q?b7y46aDh25IbY8UIPzQD+FN86djrOgn0jNzR/y03c6/GdRg/Z3QXzz6HEt1g?=
 =?us-ascii?Q?pQyZ644zebboyxzxFhBWWmMj9LihlbAlFI1mF652R7NzuVGvTPONtd54xIet?=
 =?us-ascii?Q?+HhaBvaWshEhNqBFcOArI1WJMP6L+D6GNEpoROq0TxCR9mUPzAzW0qSaj+12?=
 =?us-ascii?Q?iXRofcvssjPi56OqsC8ybE5SqTpg9Z7WMUXPiuBF2CrgnE+CAj8VU5nSflT9?=
 =?us-ascii?Q?knGlbUieTgQj0BetBhE/yejLxh9zga57tdB9X6C5wrAouztdWWVYLEfVLDm0?=
 =?us-ascii?Q?sIo3qhz/q38LP8YYrpDBBCC24A3FEJ2wnjgCm5gWRJir?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5afd286-b73c-4006-f130-08ddb3f71df4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 14:46:49.6689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yfIBSCsRIGYCWhA3CmNlu1CtiEdBo7mhimWdSxvmNyILQWWHPp27M7ijmAe+2twnuJyWNA61cnhFsEhFPaXsLWB/06wEXhQQOcSXp25Ksko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

-----Original Message-----
From: Purkait, Soham <soham.purkait@intel.com>=20
Sent: Wednesday, June 25, 2025 7:33 AM
To: intel-xe@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.c=
om>; Nilawar, Badal <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poos=
a@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Cavitt, Jonathan <jonat=
han.cavitt@intel.com>
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham <soham.purk=
ait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Nikula, Jani <j=
ani.nikula@intel.com>
Subject: [PATCH v6 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie lin=
k state residency counters through debugfs
>=20
> Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
> ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
> residency counters.
>=20
> v1:
>  - Expose all G-State residency counter values under
>    dgfx_pkg_residencies. (Anshuman)
>  - Include runtime_get/put. (Riana)
> v2:
>  - Move "dgfx_pkg_residencies" from "gtidle". (Anshuman)
> v3:
>  - Include debugfs node "dgfx_pcie_link_residencies" for pcie link reside=
ncy
>    counter values.  (Anshuman)
> v4:
>  - Include check for BMG for and add helper function for repetitive code.=
 (Riana)
>  - Use "drm_debugfs_create_files" to create debugfs. (Karthik)
> v5:
>  - Reorder commits to reflect the correct dependency hierarchy.  (Jonatha=
n)
>  - Simplification of commit message and rectified register offset.(Karthi=
k)
>  - Error handling and return before printing.   		    (Riana)
>  v6:
>  - Remove check for DGFX as BMG is discrete. (Karthik)
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index d83cd6ed3fa8..3f276d85c2ba 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
> =20
>  #include <drm/drm_debugfs.h>
> =20
> +#include "regs/xe_pmt.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_vsec.h"
> =20
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
> =20
>  DECLARE_FAULT_ATTR(gt_reset_failure);
> =20
> +static void read_residency_counter(struct xe_device *xe, struct xe_mmio =
*mmio,
> +				   u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency =3D 0;
> +	int ret;
> +
> +	ret =3D xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	if (ret !=3D sizeof(residency)) {
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +		return;
> +	}
> +
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +}
> +
>  static struct xe_device *node_to_xe(struct drm_info_node *node)
>  {
>  	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data=
)
>  	return 0;
>  }
> =20
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe =3D node_to_xe(m->private);
> +	p =3D drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio =3D xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2",=
 &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6",=
 &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8",=
 &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10=
", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package Mo=
dS", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *dat=
a)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe =3D node_to_xe(m->private);
> +	p =3D drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio =3D xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L0_RESIDENCY_OFFSET,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_RESIDENCY_OFFSET,
> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET,
> +			       "PCIE LINK L1.2 RESIDENCY", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"info", info, 0},
>  	{ .name =3D "sriov_info", .show =3D sriov_info, },
>  };
> =20
> +static const struct drm_info_list debugfs_residencies[] =3D {
> +	{ .name =3D "dgfx_pkg_residencies", .show =3D dgfx_pkg_residencies_show=
, },
> +	{ .name =3D "dgfx_pcie_link_residencies", .show =3D dgfx_pcie_link_resi=
dencies_show, },
> +};
> +
>  static int forcewake_open(struct inode *inode, struct file *file)
>  {
>  	struct xe_device *xe =3D inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
> =20
> +	if (xe->info.platform =3D=3D XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>  	debugfs_create_file("forcewake_all", 0400, root, xe,
>  			    &forcewake_all_fops);
> =20
> --=20
> 2.34.1
>=20
>=20
