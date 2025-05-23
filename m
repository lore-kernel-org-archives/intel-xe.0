Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB39FC3DA6D
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 05:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9B410E2AE;
	Fri, 23 May 2025 05:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdJ64OOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ABF10E2AE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747978505; x=1779514505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3rORX9Oxdsvm0QbDl2+Ap5GQ3wC14KxGOsth5KeF448=;
 b=AdJ64OOcX8lq1ykp0GWhJSlf8w7mlyL/t3chyrrvyS9ryxk/0lOhmnmQ
 YqoyBmyVIRLWsyd3q7e4raQB0zI37HGxXUftfI8bXKVDVZr8ys71446YC
 8JnnAKODQPurwQj4EK/7AN0nhv1e3KmfApTVnBNEhahiZbqDL4zAHNhfr
 Ha6mMXch5P6bu3PsCMKHFyt6SlmXrODz4N9lK2u+UTmmMIDsALG0Fd5g7
 ISQS8ufVHXUKuyr0d0pdrtCSHm8BLF/jfx9wDA/r1JJyp1tRo26RGq7Q0
 avAaURt8oJqcu7UEXXMTZFrZdJZKldkqqugQW1v0CCu11kEACMJtsRDYA w==;
X-CSE-ConnectionGUID: 8k2cL6EqRA+Ts8IpaYQ1+g==
X-CSE-MsgGUID: hvW5LFe+TZiI5zytB0biRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72554014"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="72554014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 22:35:04 -0700
X-CSE-ConnectionGUID: 1eCt/mkOSeiWqjEVGaBVPQ==
X-CSE-MsgGUID: QwTc03HXRUWhMsbYQaPvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141519350"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 22:35:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 22:35:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 22:35:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 22:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvqF+KXIrmsmbYPZNz4z84ohzZsnbriFO6XGX95Is4qwHFVyt8WrffT5Le7277ede749BZbz9PtDCOyc0boCFTEjaOOzGoKQc4QCUAOXmFLJJypEfiYombnGvwCFhNnhh8l0c5qixoKWUsETkT41a+Zh9si987LXF8JOuCbcxC2AlKcpJJ5nRjfPy6HiuwOgLpW/pyMR3iE8njLEsdsoKwl6CLWEykPCZQAwZH+KeiyHqtWQDTRYlnQ5K9hV0hJcppzuR5af1MPa71oIYnrR0Pdf/Hfylo0I2V3wC0soHYnAYiXfpcooLnhEGgsIt9DXTVPPHlz8Afunf8HDVC5Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rORX9Oxdsvm0QbDl2+Ap5GQ3wC14KxGOsth5KeF448=;
 b=Ny095bWOlLEqjT6O0XU7skIBIz7GmbNtyzGR/d0aLsCJ8tF9IVQvTy417t5AyOi6hvCk9qKRgFA22NGGR2fbAN8J1U0XMfAylehQT5dZ8s6xetojz/AxWpx3b2Ttk8uygiyfchEZ2akGyCmSKL5ChJHq+t+/NRd1m9SBfacXPZNgsvCjL4wjJfu7iR7Z8ZPY/SOEQQmVYzdGT3nOS9cYGo7uaCcDuESv9uMFTLBuj89AnnEy9IZU12Uhs0UFK6JGx1uzpyJhh61Tl7EvQt9JQRyBtR1FL5G6gQ1ALZ49K9k4qOtg7bVnbXMWp4qy6/Hlhz8eLRjjeGq7w8PrI+Y/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 05:33:29 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 05:33:29 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v5] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Topic: [PATCH v5] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Index: AQHbyvKpKB7g9EeUP02Qt/ItCLBmOLPfDGaAgAClTDA=
Date: Fri, 23 May 2025 05:33:28 +0000
Message-ID: <LV3PR11MB8695662472A2F378B9B894FDF998A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250522080020.2787294-1-satyanarayana.k.v.p@intel.com>
 <ebbae452-0a14-46dc-8e25-989c36bb0dda@intel.com>
In-Reply-To: <ebbae452-0a14-46dc-8e25-989c36bb0dda@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CY8PR11MB7170:EE_
x-ms-office365-filtering-correlation-id: 75997a71-803d-4ff3-54f7-08dd99bb5928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFFMVzZqdnArdFpxTGJpL1JjQ2RJNW9UZnlLSjRsUlB6L20rUWJxc3FUdXFS?=
 =?utf-8?B?cW5DaTd4QXFZSXpLUUh4KzB5bVFMcDV2MFdyOEhpN2g2Nk5Zbytsbko2djdW?=
 =?utf-8?B?Y0hYdkZ2bDVNYlpObGcyNVBxNmIyemNjUVNPM29wRkU1V2lrSXVkS0IrWVI4?=
 =?utf-8?B?OElBMnBXUjlXVk5WelBVMExVQ0FRS1FEa0FIOVdSb3NCRTJ6OVNuZVdZaWFV?=
 =?utf-8?B?UkNwbm5oRjNSeFlrVlQ2QjZGempxQ1hvM3QwdHlUY3p5N1ozMlZhR2NaM0ZD?=
 =?utf-8?B?Z3grdlo3U043QlBublNTSFFKK0pLbU9tRm1GSlVIZE9WR2V3UHI0anhTZTZH?=
 =?utf-8?B?L25hL1N1QXgrYTV6ell0NUhFVGFFQUY1QVlORm5mWmJVcHRMUU9CeitvSHlW?=
 =?utf-8?B?UGlLN3NJcmVUbmkrRXNuUkFzYTI5MGQ0SWhoWnhpMU9VWVRVZWdMS3diSUNV?=
 =?utf-8?B?TUdRT2VZQllGMGtNNTB3dHVNWkxpNlQrcnJTUis4aFROZVVua1F6L0ttNzV2?=
 =?utf-8?B?Q2F3bDNuamwwa2NrOTBCM1NsQTZFSnZBRHErNGZzc05Qbzlyc0hoNkQ3encw?=
 =?utf-8?B?WnBZT3psM1VOaW9qc1VpdkhlQmljUGdjOXNDR0toVGJhYVRzd0hYcTc0djNp?=
 =?utf-8?B?cythTDhPQXpRNWtMQ3ZoTG5wWTdUK2RkaDZHVlJtaWlaRjhZeEw4Zzk1Y0ZV?=
 =?utf-8?B?bHlBa2hMOGhrQTIrSFErKzJQbVc0Q2VucW1jYVJici96VEF2a2ptWXFOVU1u?=
 =?utf-8?B?RXRsekticXJlckZTQi9vZFl6YUpMNi85amsza0lCaU5VcWJOczFyV3Y2N3M0?=
 =?utf-8?B?WTNCWk53S1dVSHBoNVhLNUd1eUw4UW84VE04eHNpOTNYTlQzdm14bUUyTWFF?=
 =?utf-8?B?MHA2T2VpSGErOFVhTDh2SGU2cVAxTFB0L0paeEFoRnEvdU1qajhXYW9hRStG?=
 =?utf-8?B?QTl5enN0aHpORGN0YmlJY1cyTnNLNUV0RXhoQitKNklhYnJEN2hGODZBTTU4?=
 =?utf-8?B?UDVOakVkSnNzMnlFc1NXNXpRYUFtK3hiNWNGU0V5eit6WGg0cW53ZmVOY2VV?=
 =?utf-8?B?U1VYZVI4SkxxUkduR1Fvb3p6RjZMcFFxdWNtQlNxRTdDV29QT016RFVLd0JP?=
 =?utf-8?B?RTB3bzNIWWtVazlGWERvTmxWNVg1NmFFTmp1d0c0NlJXcHBXUU5DRXFmK1Jv?=
 =?utf-8?B?M3h6cm5IY0kwQWpsRmN1aEtIWUgyN3BmWTRzYnlGWVdPRSsyWkVOQ0lZZ0Ni?=
 =?utf-8?B?VGhGbXZXYy9tK0NZc3hqMXAvbjJadXp6SFpGVHhMQnlmbHFqanRsOEVpTVQ3?=
 =?utf-8?B?MXdkdnhnWEwrcEZ2VVNtQm5yVGpTWnlvbWc1dU9OeVlTbGozL3pld05qaUJJ?=
 =?utf-8?B?VFlwVDZoQnE1bG5zVlZhR1hkVFpUZnZQZGY0bzZHanY0ODE0S1hNTUZlMGcv?=
 =?utf-8?B?LzFkb056amQwRUtuRHhyd2U1NmJhU2FrSlFkRTJFTVc0SFltWXMvd3NWWDF4?=
 =?utf-8?B?NFV6NnVoTkpML1NnODVJVUQ5RjJMWkVkSUlRUUoxWkYyTFVENGMrbFdOZDZF?=
 =?utf-8?B?dGs2bGhGU084LzlPK09HNS9oUmRNVkhlMFZKeWFLQkxnQlVFdUZMK0hjN3hH?=
 =?utf-8?B?ZlpKMGZWdDhzNStOR3djNktrSm4rMFc5RGM1U05TeWNMNkJiaFNKczgxOWhE?=
 =?utf-8?B?T0hrS2tLRlE1K2NEOGFUSGx6YlUycWZWdkliL2RVWnFta3ZsS2N5VFhzQ3NX?=
 =?utf-8?B?N09TTlpvaEZZN0c1Nzk1OVQ0L1dHODI0SnBtQ21FVXhTQkJDTmZqWElOZ2JN?=
 =?utf-8?B?cE1teVdHQktIZi8wSzB0d0RmbVV5NFFzeHRqa3RhUjM0Y25UaFZtQTJNdEM3?=
 =?utf-8?B?UlJST3ZLRi9HRWJlZGN4NnBIanMzZDd6c2kxanJkRmxKU0dGRUcwNjR1TlNi?=
 =?utf-8?B?cFMwc2tCUFNzVnBlczYrNDBNeGs2eTFITTRldmIvcXQ2cEN0bGV0K1VWVTJi?=
 =?utf-8?Q?B7zrMfs+zkHVFdHIl5O/6HkXxJCCHw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UllmTGNzNlZ0SThLaDh4TmMwekNpVzZrcThhMS9NUzhjS3g4WVRjWi82MDVJ?=
 =?utf-8?B?U0wzeERja21JNzZSRUh2OUpnSXNEQlpCcE9CWDAwQWs4Nit6TXR2QmVDTzZ1?=
 =?utf-8?B?b2ZGRzB5Nnp2L3ZXWWY2SEtZT3RIRGNHSHcrOTh4T2FjRmxUZ0podi9JMlFW?=
 =?utf-8?B?VHkzTkdDRjlvUGY5MTE4UzRLRjVTU1l2VTNQQWRreWNzUFNmTFE0N2haNis0?=
 =?utf-8?B?QTl3ck5sRzdTNmd1aDM4c1BOWm1vV1BFdTk3UkcvbFEybTFHbjVGcTFuWllW?=
 =?utf-8?B?eGpjNS85ekNFYnNrb3lueTJ6eVA5WC96YzVnUnhUMm5jNHNteUZ0TWFTUVp5?=
 =?utf-8?B?QWRDOEVSLyt2WmpMZTQyZ0NxTEg3RDJ6SmlxSnU3Z2FpUG9xN0ExSlFFWjVq?=
 =?utf-8?B?U2hjSVRJTzdpdnhDK3VoTXd3RVhmaHdkMDJFRlBuUlpjVDFLMnhEUXYwN0JU?=
 =?utf-8?B?RGlsL2E1cDUxbDhadEY2elNPeVdqdWhwY0owT0FONjJsRkhvMDVSL0I2VTlW?=
 =?utf-8?B?cW1DenNqSE1IcWJIb1h2UmRMNEJzYnp0d2ZZVzRjVmV3RXd5aFozVmdGcEJW?=
 =?utf-8?B?NjVVQ3V3aHJDSTE4cEErcWxweGo2QXZXd1JqZG5TQkl4b3o5SlJZVk9vZkNU?=
 =?utf-8?B?QjN5M252QlF2L2RTNlpFV1NWL3pkWlpvRXdCK1ZuWFVaRHoyMzBTWXkrOGJv?=
 =?utf-8?B?WVpCTEErQXNaYU10UmtBRE9MZXU1L01FT0hFSmUvUUFxQVpMdnBYK0tqaElt?=
 =?utf-8?B?ZEtLRVpjUXh2T0NzL1lTUHpKZWVmVHoxRnhnU3ZtSXJEeUYvaXlJaURaRHdS?=
 =?utf-8?B?UWJLR3lWaEhKbmJZSnFTV1FMdVA0b1ZMcytuVDdhUE5FYm5oN0F1d1lEZlM2?=
 =?utf-8?B?VGpUbTNIRmhSVVpNZUlzdjZNVUxmZTI5Wm1zZndkc2ZFRkJubWpFZ0xQb3BD?=
 =?utf-8?B?QWFvR3R4MTQyREJ5NUUxeFEyd0VRQU1RYXFhbnphZU5tSHAxV3o2MkhVczA2?=
 =?utf-8?B?MVpPajVqbzVEUHB0MWF3UVc5TmZabDFlbVE0TXNmSjh1c0Q3SWZKWThwV3Q3?=
 =?utf-8?B?eTU0QWgvd1pvaDdIREVYMVZHZTVJQ002a3VITEMrWU9wZUVGZVhjK08zR3cr?=
 =?utf-8?B?VGMyaC9JNkk4YUM1Q2pLU3RRQ1B3bDlkcXZSUnFJbWRZdVVtdUM4dXQ1RXAy?=
 =?utf-8?B?dldwNHF4cUhZTEhKNlFjRkxjdWRZaVlPOEc3S3R4Y2Z2ZmVJRHpXQSs3NFRP?=
 =?utf-8?B?TkNzbXljSEZENXlvNmJoSnhZcG5zbEEzbyszdWN0YW5hOERKK3pHcURDbnhT?=
 =?utf-8?B?dVE1bTcvWElCRGlES3NSOFA4Y3p1bUsyVDBDaGRJREp3a3p4RWZzUndiMmhq?=
 =?utf-8?B?NkhVUGcvcktSc2RjRDg2STZndnJOcmxYTTBwSzJXdnNpZ2NVMFpmRml2L2Ns?=
 =?utf-8?B?YlJNQVV0dzlvR0lEbHdSNFZ1NUxXVWlvL1ZmZHRCdW1TU2U5RzdoSDBTTzdn?=
 =?utf-8?B?L0FLckVZSWhWRmNQUVlBZndMNUJJVnQvRzllUUM0VFJ5cVY5ZGcvS2dPazRl?=
 =?utf-8?B?TDJPdE0wUkhNRUh0d0NhKzhOeWQ1THpQcDNFK1lRdkJmUkNyOWwxbTZOcllH?=
 =?utf-8?B?TTNuZzVPVldJVUdoRk9FYVRhUjlET2hDZk0rMHRQcWVIS1p3RTg5NTJKcFd2?=
 =?utf-8?B?UjdSUHFIWmtKamcyVldZRDdBTkJpMkxSbHBYaHJhaWttbURVb3V1TGQ0bjVB?=
 =?utf-8?B?YWE0ZmxRbzl1NXZVSlA4UlNXclV1V1dLVFFFVmw4OHkrbXRBVnZRL0hlQ0pI?=
 =?utf-8?B?WlVSYVJteDdjSjZodWdONEpGbHUwQU9wZTh3NjV4b2llczFMSFAxcDBVOEtS?=
 =?utf-8?B?ajUxU0Yxb1RSdUVhZWFWZk1Kek44SDlYWnpEcXJPQWtQRzJ2S2VZSzRqZDNE?=
 =?utf-8?B?TTU5T3MxRGdDdnUrYXlVYWdqL09jdEVOcUdCSi9aVjNTejhTdkpFNE54QnV1?=
 =?utf-8?B?SFVUMkhRWkpyZm10MHpVQk9FZ3ZnTEIvUElGT2tEQWV6Z2FGMHBScllEaE8r?=
 =?utf-8?B?Z0ZyVnI3Z3JaOVpuU0ZWQSs0Wlppb1JyM2JISnVGcnV5elpIMVpGRjhIdXgx?=
 =?utf-8?B?VHBMeDhTWm1PZER4bldiN0l3cWZRWGJxN3I4YncwQ0tDK3NrY0NwTE02cHp5?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75997a71-803d-4ff3-54f7-08dd99bb5928
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 05:33:28.9868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/5yPTUtrohOHwmp48t5DPJNN5BIkk3RckRXNAB4Ww2KKH5O2aJOCpql0eoikGo64E2kazcrDXanySquT9+P7oGMXxSaA4yoQg7PSVzLcRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycmlzb24sIEpvaG4g
QyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjMsIDIw
MjUgMTowOSBBTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52
LnBAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
V2FqZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgTmlrdWxhLCBK
YW5pDQo+IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjVd
IGRybS94ZTogQWRkIGhlbHBlciBmdW5jdGlvbiB0byBpbmplY3QgZmF1bHQgaW50bw0KPiBjdF9k
ZWFkX2NhcHR1cmUoKQ0KPiANCj4gT24gNS8yMi8yMDI1IDE6MDAgQU0sIFNhdHlhbmFyYXlhbmEg
SyBWIFAgd3JvdGU6DQo+ID4gV2hlbiBpbmplY3RpbmcgZmF1bHQgdG8geGVfZ3VjX2N0X3NlbmRf
cmVjdigpICYgeGVfZ3VjX21taW9fc2VuZF9yZWN2KCkNCj4gPiBmdW5jdGlvbnMsIHRoZSBDSSB0
ZXN0IHN5c3RlbXMgYXJlIGdvaW5nIG91dCBvZiBzcGFjZSBhbmQgY3Jhc2hpbmcuIFRvDQo+ID4g
YXZvaWQgdGhpcyBpc3N1ZSwgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIGlzIGNyZWF0ZWQgYW5kIHdo
ZW4gZmF1bHQgaXMNCj4gPiBpbmplY3RlZCBpbnRvIHRoaXMgeGVfaW5qZWN0X2ZhdWx0KCkgaGVs
cGVyIGZ1bmN0aW9uLCBjdCBkZWFkIGNhcHR1cmUNCj4gPiBpcyBhdm9pZGVkIHdoaWNoIHN1cHBy
ZXNzZXMgY3QgZHVtcHMgaW4gdGhlIGxvZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhdHlh
bmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+IFN1Z2dl
c3RlZC1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+
DQo+ID4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4NCj4gPiBW
NCAtPiBWNToNCj4gPiAtIEZpeGVkIHJldmlldyBjb21tZW50cy4NCj4gPg0KPiA+IFYzIC0+IFY0
Og0KPiA+IC0gVXBkYXRlZCB0aGUgbmFtZSBvZiBoZWxwZXIgZnVuY3Rpb24gYW5kIG1vdmVkIHRv
IHhlX2RldmljZS5oIGZpbGUuDQo+ID4NCj4gPiBWMiAtPiBWMzoNCj4gPiAtIEFkZGVkIGlubGlu
ZSBmdW5jdGlvbiB0byBhdm9pZCBjb21waWxhdGlvbiBlcnJvciBpbiB0aGUgYWJzZW5jZSBvZg0K
PiA+IENPTkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT04uDQo+ID4NCj4gPiBWMSAtPiBWMjoN
Cj4gPiAtIEZpeGVkIHJldmlldyBjb21tZW50cy4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuYyB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIHwgMTQgKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyB8ICA2ICsrKysrKw0KPiA+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+
ID4gaW5kZXggNjYwYjBjNTEyNmRjLi5lMWI0MDg3YTI5NzQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jDQo+ID4gQEAgLTExMjAsNiArMTEyMCwyNCBAQCBzdGF0aWMgdm9pZCB4ZV9k
ZXZpY2Vfd2VkZ2VkX2Zpbmkoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJnKQ0K
PiA+ICAgCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICsvKioNCj4g
PiArICogeGVfaXNfaW5qZWN0aW9uX2FjdGl2ZSgpIC0gSGVscGVyIGZ1bmN0aW9uIHRvIHRlc3Qg
d2hldGhlciBhIGZhdWx0DQo+ID4gKyAqIGluamVjdCB0ZXN0IGlzIHJ1bm5pbmcuDQo+ID4gKyAq
DQo+ID4gKyAqIFRoaXMgaXMgYSBoZWxwZXIgZnVuY3Rpb24gdGhhdCB0aGUgZHJpdmVyIGNhbiB1
c2UgdG8gZGV0ZWN0IHdoZXRoZXINCj4gPiArICogYSBmYXVsdCBpbmplY3Rpb24gdGVzdCBpcyBy
dW5uaW5nIGluIG9yZGVyIHRvIHN1cHByZXNzIGV4Y2Vzc2l2ZSBkZWJ1Zw0KPiA+ICsgKiBvdXRw
dXQuIEJ5IGRlZmF1bHQsIHRoZSByZXR1cm4gdmFsdWUgaXMgZml4ZWQgYXMgemVybyBidXQgaXQg
Y2FuIGJlIG1vZGlmaWVkDQo+ID4gKyAqIGJ5IHRoZSBmYXVsdCBpbmplY3Rpb24gZnJhbWV3b3Jr
IHRvIHJldHVybiBhbiBlcnJvci4NCj4gPiArICoNCj4gPiArICogUmV0dXJuczoNCj4gPiArICog
MCBpZiBubyBmYXVsdCBpcyBpbmplY3RlZC4NCj4gPiArICogSW5qZWN0ZWQgZXJyb3IgaWYgZmF1
bHQgaXMgaW5qZWN0ZWQuDQo+ID4gKyAqLw0KPiA+ICtpbnQgeGVfaXNfaW5qZWN0aW9uX2FjdGl2
ZSh2b2lkKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4geGVfaW5qZWN0X2ZhdWx0KCk7DQo+ID4gK30N
Cj4gPiArDQo+IEknbSBjb25mdXNlZC4gV2hhdCBpcyB0aGUgcG9pbnQgb2YgdGhpcyB3cmFwcGVy
Pw0KV2UgYXJlIGluamVjdGluZyBmYXVsdCBpbnRvIHhlX2luamVjdF9mYXVsdCgpIGZ1bmN0aW9u
IHdoaWNoIGlzIGdlbmVyaWMuIFRoZSBmYXVsdCBpbmplY3Rpb24gc3RhdHVzIGlzIG9idGFpbmVk
IGZyb20NCnhlX2lzX2luamVjdGlvbl9hY3RpdmUoKSBmdW5jdGlvbi4gVGhpcyBpcyB0byBtYWtl
IGZ1bmN0aW9uIG5hbWVzIG1lYW5pbmdmdWwuDQo+IA0KPiA+ICAgLyoqDQo+ID4gICAgKiB4ZV9k
ZXZpY2VfZGVjbGFyZV93ZWRnZWQgLSBEZWNsYXJlIGRldmljZSB3ZWRnZWQNCj4gPiAgICAqIEB4
ZTogeGUgZGV2aWNlIGluc3RhbmNlDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+IGlu
ZGV4IDBiYzNiYzhlNjgwMy4uMTNhNDNmZTRmYjY0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuaA0KPiA+IEBAIC0xOTUsNiArMTk1LDIwIEBAIHZvaWQgeGVfZGV2aWNlX2RlY2xhcmVf
d2VkZ2VkKHN0cnVjdCB4ZV9kZXZpY2UNCj4gKnhlKTsNCj4gPiAgIHN0cnVjdCB4ZV9maWxlICp4
ZV9maWxlX2dldChzdHJ1Y3QgeGVfZmlsZSAqeGVmKTsNCj4gPiAgIHZvaWQgeGVfZmlsZV9wdXQo
c3RydWN0IHhlX2ZpbGUgKnhlZik7DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19GVU5DVElPTl9F
UlJPUl9JTkpFQ1RJT04NCj4gPiArLyoNCj4gPiArICogQXMgZmF1bHQgaXMgaW5qZWN0ZWQgdXNp
bmcgdGhpcyBmdW5jdGlvbiwgbmVlZCB0byBtYWtlIHN1cmUgdGhhdA0KPiA+ICsgKiB0aGUgY29t
cGlsZXIgZG9lcyBub3Qgb3B0aW1pemUgYW5kIG1ha2UgaXQgYXMgYSBpbmxpbmUgZnVuY3Rpb24u
DQo+ID4gKyAqIFRvIHByZXZlbnQgY29tcGlsZSBvcHRpbWl6YXRpb24sICJub2lubGluZSIgaXMg
YWRkZWQuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgbm9pbmxpbmUgaW50IHhlX2luamVjdF9mYXVs
dCh2b2lkKSB7IHJldHVybiAwOyB9DQo+ID4gK0FMTE9XX0VSUk9SX0lOSkVDVElPTih4ZV9pbmpl
Y3RfZmF1bHQsIEVSUk5PKTsNCj4gPiArI2Vsc2UNCj4gPiArc3RhdGljIGlubGluZSBpbnQgeGVf
aW5qZWN0X2ZhdWx0KHZvaWQpIHsgcmV0dXJuIDA7IH0NCj4gV2h5IG5vdCBuYW1lIHRoaXMgeGVf
aXNfaW5qZWN0aW9uX2FjdGl2ZSgpIGFuZCBqdXN0IGNhbGwgaXQgZGlyZWN0bHk/DQo+IA0KPiBK
b2huLg0KPiANCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICtpbnQgeGVfaXNfaW5qZWN0aW9uX2Fj
dGl2ZSh2b2lkKTsNCj4gPiArDQo+ID4gICAvKg0KPiA+ICAgICogT2NjYXNpb25hbGx5IGl0IGlz
IHNlZW4gdGhhdCB0aGUgRzJIIHdvcmtlciBzdGFydHMgcnVubmluZyBhZnRlciBhIGRlbGF5IG9m
DQo+IG1vcmUgdGhhbg0KPiA+ICAgICogYSBzZWNvbmQgZXZlbiBhZnRlciBiZWluZyBxdWV1ZWQg
YW5kIGFjdGl2YXRlZCBieSB0aGUgTGludXggd29ya3F1ZXVlDQo+IHN1YnN5c3RlbS4gVGhpcw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiBpbmRleCA4MjJmNGMzM2Y3MzAuLjg5Zjk5
MmZlYmEzMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiBAQCAtMjA0MCw2
ICsyMDQwLDEyIEBAIHN0YXRpYyB2b2lkIGN0X2RlYWRfY2FwdHVyZShzdHJ1Y3QgeGVfZ3VjX2N0
DQo+ICpjdCwgc3RydWN0IGd1Y19jdGIgKmN0YiwgdTMyIHJlYXNvDQo+ID4NCj4gPiAgIAlpZiAo
Y3RiKQ0KPiA+ICAgCQljdGItPmluZm8uYnJva2VuID0gdHJ1ZTsNCj4gPiArCS8qDQo+ID4gKwkg
KiBIdWdlIGR1bXAgaXMgZ2V0dGluZyBnZW5lcmF0ZWQgd2hlbiBpbmplY3RpbmcgZXJyb3IgZm9y
IGd1Yw0KPiBDVC9NTUlPDQo+ID4gKwkgKiBmdW5jdGlvbnMuIFNvLCBsZXQgdXMgc3VwcHJlc3Mg
dGhlIGR1bXAgd2hlbiBmYXVsdCBpcyBpbmplY3RlZC4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKHhl
X2lzX2luamVjdGlvbl9hY3RpdmUoKSkNCj4gPiArCQlyZXR1cm47DQo+ID4NCj4gPiAgIAkvKiBJ
Z25vcmUgZnVydGhlciBlcnJvcnMgYWZ0ZXIgdGhlIGZpcnN0IGR1bXAgdW50aWwgYSByZXNldCAq
Lw0KPiA+ICAgCWlmIChjdC0+ZGVhZC5yZXBvcnRlZCkNCg0K
