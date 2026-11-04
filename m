Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7C606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m232CkTo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A0B10FD7D;
	Wed,  4 Nov 2026 17:10:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7169810FD7D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793812207; x=1825348207;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=QnHjvKEgadiMDkjtFm7MaId6jTO8PAz1q3JPxf/U1yk=;
 b=m232CkTopHo4h4Hq94eRIdUlUIadBoID+iTj6Cnq8W8n97loTqPnVCMJ
 AYkL6k0BzeNHvmy//hdXe9RrWxyqfWm5KCZiyXx8HMoRB8eSW8h2DlcO7
 XV4iLVLitdEH9r2I6CoqeIUcelxq3H43UwHK/XAXTj9NwRKY9H5WUjUKZ
 6OziawxhoVqJyISCV7o66+FG/c4p1A39UTVO0j7hYcg3lcavE2hKUXK+5
 PLWnlvmI5y2J+8T4mi4CMi6fM9HlK5609uRJr23qFe1ZwTAnmBVjJDVJo
 6q4HcVmmY+p5qm5j8k4nuhzJ5JvSLy/6ZnhKWlvLjetI0zx6jG5LYCbh2 Q==;
X-CSE-ConnectionGUID: xXYwO9bAQ9KHxDneiw18HQ==
X-CSE-MsgGUID: cRV/eE/5Q5KLqgTpVvCPTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2450108"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; d="scan'208,217";a="2450108"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 09:10:06 -0800
X-CSE-ConnectionGUID: Ooxr8O3fRy6bH7QirXYvOA==
X-CSE-MsgGUID: uGJD0UC9RhK1QrVa0qo3Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; d="scan'208,217";a="6827107"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 09:10:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:10:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 09:10:05 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:10:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+9DUZRgE5HSrYKqOGZsw4+yrwYPl233krz0BqcKMEseNjiPh+GiPHKZbGaGoz9/fxXqrp5C1Nxb4fM0mEt3Gl4vN/IbgGYJTOgOIkYrm/S7p5mAgpUMCSlNyTW66k9Lt1vGUk4wfkl6nTVsa2D8KkwPdHRZiZE5VZ3Cx6JKOBNo2eBGGnbINU36FlusQAozMzMtIhAw1nQVdQyiYzBfmrMDOZyejcnWRkCdR8nLrTK9OKWVqWGLroph3UCRZiPI0prMDJ+/my8k5kwpqP+vCRhUreEb5XoZ6a5Yo+MsiRmi987bdn9XE2pTZZU+cl9g6/byFlCsmr1p0l03wLwT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bso0frRYMqrtxfH7fs3tAgSm4aOHk11SbUKDjVPiorM=;
 b=DUESNbGyhyHOtTuGxutKZbIVoT86dPbaoKPydJXXM3ap3tRq2hrgJ4e3zt6ENL3qcUGzUuvBoGj0gPuUztfi4qK/ceDJWeEqOAERUt2G/R9s12K+TYKrudh9MlciH71pD5jlFYl4wkiheo7Y51JHRxki2KQfs5Y87modpkqZNQUFelgrd9LO8sekAx917Gm1WZyRAjlSoFh3kQ5I7MyBiLlTNYPt00OyJrf51x6sCjXhqteNPDhhRmos2cJ63Q+raFOgGcQyBpxwNrcB1NmT4v98V8u5T5xrRw3Zaa3pqkBWsaPE9VT0WWaKWx765zE5YUp4RSVTh+hv3BPy+onwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 17:10:02 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 17:10:02 +0000
Content-Type: multipart/alternative;
 boundary="------------2CnD8M4QZfnOF3aIlM4cKovi"
Message-ID: <2be46a76-4c21-437d-8d17-85ed8151c3cc@intel.com>
Date: Wed, 4 Nov 2026 22:39:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/xe/cper: Add software error classification
 definitions
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <jani.nikula@linux.intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
 <20261029132609.907017-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261029132609.907017-10-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4a31c4-3664-4f24-a5fe-08df3a9676e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261022113327099003|11063799006|261022075727099003|4143699003|56012099006|261021123027099003|261026140227099003|261009223027099003|261102123227099003|261021121427099003|261028144727099003|261022105027099003|10067099003|18002099003|22082099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: +VbzdQHbe3hc06xje+HIe6kvibpvA7Dmbuq7p8JEdwpaGUoW/lwpIFIfHO3fcubxl7+pVuoMoAM0abQpEvQq6Jz7abdoAfdM4ZnJmC7RUfYyVzrfmMt4ki7k4Voq/FMo2PiZHuK+D5ebS8mJaOBcXJHNC8m/8HbHzisGhyJsz7wotUf/NA2UvUUMGceAn+pcFFyHD2eQeYUmEf2cOk6mTnvE479sl1+qHSpbrvLGhAQPFr1qerGf3omyuKbCcnfdpRZznajyXxIC0y8SbGvuewqB63usYam/mpGA7CByjZtDFYOW3RS03WY1fHxdxiPUWajvEQtwg4wjs2eMsQLFiAv1O/HcC07r340UGQ0/uPGBD0J9qmvJeTXs43JNZFesJcrvud6W0LhSDzeQ47ioNWTXMQ48vGOPDXLZ43bMoxBjMrZZf/R1UATz5IJV9R8TwUMY5GoYM10GnZWOvf7wdSykFX1o8DgTo7bmlLwrHPV2vQ/nJZD1wt12B3RSTsmGw7R3Su9mMwlzpSQghrr49vdojcBzioILKXiCo9Yy1gTIWLDCzegJVVVeccP6fQYooQwBZZ1/xYQEy3uWxp38ozCZ4xhPB+2b0RyReG0ORvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261022113327099003)(11063799006)(261022075727099003)(4143699003)(56012099006)(261021123027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFBMlpqV2JSR3Y3UXFmYnNlWTdWeFlQRnNkejBDMmNacnJCRTJlNVptQU1D?=
 =?utf-8?B?MCtZZHoxYXBmeWVwd3ovd3VNdDdCLy9WVTl0dHdwcnFkNTQwTVJ5UVhMUEli?=
 =?utf-8?B?QlAwbnN1SmgyaURlN0RnQkNSeWRtckVSVGUxUkptMkQ4MFhiRWVrVDk2dTRm?=
 =?utf-8?B?L05oVElGRXVITVpQMkY5akFadW4wdGU1MUtwZ1dLSWVDbmJIUS9GamkvLzJw?=
 =?utf-8?B?N2FSbEZrMFF6cmJ3UCt6SVhzdXBoaGhvbTNEY2FkVnhjSWdVTnlYVkt0bEYw?=
 =?utf-8?B?L01CaXhULy84Q2ZtNEVWZE9xRy9yRnU5Z0wrRC9QOWN5c3VTTnFzZDgwVU1Q?=
 =?utf-8?B?K1RkRFNVMXJ5b2M3RWhVMkU0djhVRGxPalRpZm92YzQ0VzV6MW1rTm9KeUEy?=
 =?utf-8?B?WGhBT20zSmNieTN1OXN4cjJkcS9jOHcwSGxCcmt1bC9Kb2lQZVIzZXMyNDRU?=
 =?utf-8?B?cUtuZ0ZBY2ZOZVV3dVl6YUx5YXJFbnVGZGZPaTFVN0hhWjJtbWFrVFgxUlhr?=
 =?utf-8?B?QTJDeHFoRllSd21sb2xCNEhuaHViRlpPZXpndFVjNlZUaWVGdm1BV2xlOXMr?=
 =?utf-8?B?L1MvS1Jma1JDQUJRT0QzTy9idlVYZzdienNhNSs2eXRPWm5lT1ZIWE5Dc05h?=
 =?utf-8?B?c0VLcEx0cTVQUjJCTy82bWJFTXhwdE1KK0NMeU5wekdsZC9KM2Q3Y0Q1Zjhn?=
 =?utf-8?B?aWpqMk1kdUtyM1VUalRERFpCcUlIaDEySHBKVTlvdkFSVnc0TlJhUEpVbDBR?=
 =?utf-8?B?aElwYnJvRGlrbWxuVWVPdU8wUk4zaUJEdDJyWTNybXJucmpyWlZYc3lqc1hy?=
 =?utf-8?B?SzBacGJ1dGR5UDJla2VOb3pRUDFuZy9jQUxqa3RtQ09sQVp6enc2VUw3VzJQ?=
 =?utf-8?B?RlY2YnV6NVNpZWYzVlhJcllYWDN2SjFZZ3RuZGdFRHpzWU1qbnpJTlFZWjd0?=
 =?utf-8?B?L3QzRzhOUHRtMFNVb0E2MHgwSFMrVzFIYm1seGxkWG9wQ09qUE1VcW5FRFpt?=
 =?utf-8?B?TVE1c3AvTnVVcEFINHZhU3VVdGpJeHdwcWpEU0FRZ1BzMUNyMmtZQTFPZ3Fv?=
 =?utf-8?B?UUZKM0RYYi9nc1ZpdktwNFZxcWltUGpjVGxacnBoUWYwUUQrSEExV2gybG55?=
 =?utf-8?B?UWhrNWhzNjlXZVIyTUlONXBKZDNOVUlHbkVjcSt4M0lYY0JYQ3doNk1HQVhi?=
 =?utf-8?B?Z2Q1enZPT2xJeU5GVGhaN3RBYW1DN2txZHVxZTFVZEpER25LdWtHdVp1Skg2?=
 =?utf-8?B?aDFlek4rL1RCTUFSWU53MEI3cXdldlRUU0cxcmhNbVd5QWlFMkxGYXRFdjV5?=
 =?utf-8?B?ZzljajAxeFB2UGUvRkNHeVhuWHFBRE04K1liZ21vNmprVXZwU2kvYXZWWUZB?=
 =?utf-8?B?aTZuWUs0T3pZWGs0OXBjSUNSVFYzaHZzRFNscmNYNTdLWUV6WWc1SDExSTBh?=
 =?utf-8?B?TzFabkw2SGQvWVN3eWJERmlPbTV1NXA3cWF1MWdQY2J1Q2M0ZS94V1BzT00y?=
 =?utf-8?B?N0pRZEdoSWNTWmVJS2tsQ1dNVzhCZW1zUGZzbDN5ZDRUMjBKNyt0ejJQNU9i?=
 =?utf-8?B?WUo3TVEzVW1SMGlaUzcxZFBOWFNBVDZFZndDVE5iNE9XS2IwenNhZDZCSjh0?=
 =?utf-8?B?UCtOc09PNUJPRkROVTFaK0pwd2xmbzU1czZnOWhlOUFXUTFyVmlyK25nRDFL?=
 =?utf-8?B?ek5qSEdRcXhFRFhIWTNvMFZHNWp5clFGa1YzNG5BWFZCSFlpek1JdHgzWkUv?=
 =?utf-8?B?WHd2alBKZTZTY3lIQjF4Y00zUWhkVnFrOXp5ck1uV3NGYjZZZjZCZGE5TWZw?=
 =?utf-8?B?aXM5SEhHMkMzdUg0aDJ0bW82aDZiMzA1dHJCclJCeldXakc5QlM1QkY1UDlB?=
 =?utf-8?B?d3VOeWk0SlBJdGM1NEYrdGFzMDUvRmg1bllQb1IrVU1GM2RnQVRZNGNKZ1Y1?=
 =?utf-8?B?cXhBVnJDeWRjb2Q2Y3B1aHVFNkY5cHA1TnBPZk1lV01VbWFzQUtaSTRqejRF?=
 =?utf-8?B?SkZob2IvbFZ0M1hzRStQdmdteEpDdndVRlQwd0NTM0poWDJKaGU2ek9UcXdu?=
 =?utf-8?B?RlVaaHpSa0FEUDRjVlFwMWNTcGpnaFFzSHBFbS9CTFM5UEJVMnJFREkwMERm?=
 =?utf-8?B?bEc4MU5lQnpuUVlwbzRBOEdtTkZzdVk5WUd0TlhVbWI0ZVNCK0NkcG5qRFJX?=
 =?utf-8?B?WnNLM3M0TSthY0cwRy9pdkxOa1pLQnhxVXdlMHE5bGt4S3F1MzVlTXBYUmhR?=
 =?utf-8?B?aEZKcGhRWGFGWlNFL0JHVkx4K2VBcXk5cjZHQUUzZlpTbGd2M1E0QWZnYmhk?=
 =?utf-8?B?QUs1N0NtbmJtUjVkNzhiaGdsYXhZbDJEQVdPdm92cjh0bngwMzBFQT09?=
X-Exchange-RoutingPolicyChecked: 3fZHWxavWmS5vmkj1tZamgZAzQl7QceZfvnVasyp9EgDPyas6TjMvN9XSLse5B69NZ5saY7sPnKDLmEJCCjg/LhNDG5xMIDagt/ASMglhfSKpM1AZBmZtIlyMqE9j1b88ECSccJKLZA2wgygiQyxAb1tuqiu7kC5sIaH+S5DQZzB59CAG6ogqRgBxh86IlzdM8uyfETu0qA3X/+zDUAmk+dvQ/tbgtZQv7Vd7/zRGspOXl8/OjGWB7O2ycKG/GShXZw7CTqeX7Sc2L74KWZtPO7+mBa3+Qy+oSvps+jOMAiXhUWGNhzWwImyFgO3sQwFjmxuHFYlhLswmPbYRh88Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4a31c4-3664-4f24-a5fe-08df3a9676e7
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:10:02.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpXiBeu5Y/J3hEe038lpMyxlfOkr067Rd7VDvvC+3bU5wb1DBdUwsD1837+7CzURFvbbij2I3sX3HhsoUKvgsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------2CnD8M4QZfnOF3aIlM4cKovi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 29-10-2026 18:56, Mallesh Koujalagi wrote:
> Introduce driver-detected error classification fields and a
> notification GUID for software CPER records. Store the hardware
> and software error classifications in a shared union within
> struct xe_cper_intel_hdr.
>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> v2:
> - Move union inside xe_cper_intel_hdr structure. (Badal)
> ---
>   drivers/gpu/drm/xe/xe_cper_types.h | 35 ++++++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 68e30df0440e..d1c38a96e05d 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -40,11 +40,38 @@
>   	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>   		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>   
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
>   /* Section Types */
>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>   		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>   
> +/**
> + * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
> + */
> +struct xe_cper_driver_error_class {
> +	/** @error_type: CPER severity: CPER_SEV_* */
> +	u8  error_type;
> +	/** @reserved0: Reserved, must be zero */
> +	u8  reserved0;
> +	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
> +	u16 error_component;
> +	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
> +	u16 tile;
> +	/** @reserved1: Reserved, must be zero */
> +	u16 reserved1;
> +	/** @cause: errno of the failing operation, or 0 if none */
> +	u32 cause;
> +};
> +
> +/* Same size as the counter-sourced error_class */
> +#define XE_CPER_ERROR_CLASS_SIZE	12
> +
> +static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
> +
>   /**
>    * struct xe_cper_intel_hdr - Intel-specific CPER header
>    *
> @@ -52,8 +79,12 @@
>    * All multi-byte fields are little-endian.
>    */
>   struct xe_cper_intel_hdr {
> -	/** @counter: Error class (severity, component, location, cause) */
> -	struct xe_ras_error_class counter;
> +	union {
> +		/** @counter: Error class (severity, component, location, cause) */
> +		struct xe_ras_error_class counter;
> +		/** @driver: Driver-detected (software) error classification */
> +		struct xe_cper_driver_error_class driver;
> +	};
>   	/** @first_timestamp: First occurrence of this error class, in ticks */
>   	u64 first_timestamp;
>   	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */

As mentioned in v1 , introduce these structures and its elements in 
patches in which they are used. Please refer 
https://patchwork.freedesktop.org/series/169692/.

Thanks,
Badal

--------------2CnD8M4QZfnOF3aIlM4cKovi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 29-10-2026 18:56, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261029132609.907017-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce driver-detected error classification fields and a
notification GUID for software CPER records. Store the hardware
and software error classifications in a shared union within
struct xe_cper_intel_hdr.

Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)
---
 drivers/gpu/drm/xe/xe_cper_types.h | 35 ++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 68e30df0440e..d1c38a96e05d 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -40,11 +40,38 @@
 	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
 		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
 
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+
 /* Section Types */
 #define INTEL_CPER_SECTION_ACCEL_GENERIC \
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
 		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
 
+/**
+ * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
+ */
+struct xe_cper_driver_error_class {
+	/** @error_type: CPER severity: CPER_SEV_* */
+	u8  error_type;
+	/** @reserved0: Reserved, must be zero */
+	u8  reserved0;
+	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
+	u16 error_component;
+	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
+	u16 tile;
+	/** @reserved1: Reserved, must be zero */
+	u16 reserved1;
+	/** @cause: errno of the failing operation, or 0 if none */
+	u32 cause;
+};
+
+/* Same size as the counter-sourced error_class */
+#define XE_CPER_ERROR_CLASS_SIZE	12
+
+static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+
 /**
  * struct xe_cper_intel_hdr - Intel-specific CPER header
  *
@@ -52,8 +79,12 @@
  * All multi-byte fields are little-endian.
  */
 struct xe_cper_intel_hdr {
-	/** @counter: Error class (severity, component, location, cause) */
-	struct xe_ras_error_class counter;
+	union {
+		/** @counter: Error class (severity, component, location, cause) */
+		struct xe_ras_error_class counter;
+		/** @driver: Driver-detected (software) error classification */
+		struct xe_cper_driver_error_class driver;
+	};
 	/** @first_timestamp: First occurrence of this error class, in ticks */
 	u64 first_timestamp;
 	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */</pre>
    </blockquote>
    <p>As mentioned in v1
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>, introduce these structures and its elements in patches in
      which they are used. Please refer
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/169692/">https://patchwork.freedesktop.org/series/169692/</a>.&nbsp;&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:20261029132609.907017-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------2CnD8M4QZfnOF3aIlM4cKovi--
