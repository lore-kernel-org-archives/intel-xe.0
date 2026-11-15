Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1A2606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgOf6z3z;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bIR2Uxfw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CDC10E860;
	Sun, 15 Nov 2026 12:06:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DEC10E860;
 Sun, 15 Nov 2026 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794744381; x=1826280381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SLyj83Pe3CKe9N3LQAx0OihrAW2FkB4W8hQql9NHvUU=;
 b=YgOf6z3z5gJCumcCIQ+krFczYy7DoYHpczUnX7fVvDS+RS3aL6QmZbhy
 28ElyWvQzTr9GGFe4U0rvUJAPJrnX7pfPSnS4Fa/Z/A7OWJ/Ih67QIhCL
 vKmkH6aaQ/KGSP2lUPgf74GNMFMRJwuNb8LcsE0S6/pU6WrC+tStfrgAh
 PJ/CMv8QClQ4qZX7su7r/iCfVUX1d9wPltkfL2IBz8Cbekh8Ekn2fUsme
 v0M2ABW7wtQ1RkVkM7gYj5ulPU6z1JMAjeXufOmjg8osh2DCpf0vrJ0+a
 IVgDTlgZFvxsvakYHmo+E0XBNATYnV1GI491ScDK186syjVfoWLPA6fg1 g==;
X-CSE-ConnectionGUID: NGVX6Fc7Sd6IrLJKsCnthg==
X-CSE-MsgGUID: aGS56RHERvijzcvFZVz1nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3390345"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3390345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:06:19 -0800
X-CSE-ConnectionGUID: A9D7LhuxRi2zhC7N/a16UQ==
X-CSE-MsgGUID: Odd9FbxUQ3eR4Ywt16ODgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9860749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:06:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:06:19 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 04:06:19 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:06:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7aXPESGK8fNfFamRZCzn8kgV6LsA9PDfnZk4TCimetj5Bs2aZSD9wnelJ+BBvUbYGWMy1WnmoFKoH7abrahI6dz/FPx0ntDWeCukPPAirct5AoTpH9OOKpPgmwM5wtPknr+nfpVsb01801gppNlcKaIKjcO0lYH+I9ZSXL/sZxd4t6r63S7bBjwV27H0hx7T9GGYgThcYWJCUFOx/0WBhh1EIcQSeOC5U9EM6ugcimozHo7NuuCdxjqwHLYdQ7gtSjiruOX+aAey+HHOpsew7yrvm3E4UVfnV84vLY9lt2DACNBbh7+bLjqe2ifNL1Hvgk1g6aZFpSGZlrOnE1bkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22lKtHvg2mzj1BJA3txHOew3UPmhTzWrv0BDyqvq3es=;
 b=aUPD5Qf+3c5WvUgvcQ1i/xlwCc2GWTKK9eHd54bHFegzgfBp5LRpEHE+y+9qBhKrYId7GKs1JQz/MrTXdMXLHJLwEL/ILAICFfIEkrMH3JKcbH8F5W3ejpQsUXwyrmMcXYP5YhKDM0fW03w0IB1lKrpCFansNrmY6kzJ40uEQwLfxQsp89FJchx1J8Kyg8JxtyHd797cqgmwd8ARNHhtSZojtyg2wpHptRm7CKUpwywaPIlz5luKBF0bDXFr7rlGraQHmZGXzwXlDOwlloYGbZbO08USbu3JG5hiqwCh05IAMOQclc6Krtm/MwOQZ7mISs/nKDWJFn57dAjBglMLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22lKtHvg2mzj1BJA3txHOew3UPmhTzWrv0BDyqvq3es=;
 b=bIR2UxfwWXpF377iJOHhDcSdJZ4Lpfde9YSG2qCKvnOu9PjSslm7fj3FSD16gY20Xbu4GIrMV70Bi8Bmy7kj0zxzTzWBpeJgJq/VGK6k66l0z5JBDfv8D2D1xxTc/V/L6WMqzimcfNQa3my9BfuJz9gd+AP0PIhP9Y6AiwXb4m8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by PH8PR11MB9805.namprd11.prod.outlook.com
 (2603:10b6:510:3c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 12:05:06 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 12:05:06 +0000
Message-ID: <7b272ba2-4e82-4dbf-aa8a-12a9c44f277e@intel.com>
Date: Sun, 15 Nov 2026 17:34:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/i915/display: Add the DP link layer symbol
 timing generator registers
To: Arun R Murthy <arun.r.murthy@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <uma.shankar@intel.com>,
 <suraj.kandpal@intel.com>
References: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
 <20261104-vlk-64036-dp-symbol-tg-v4-2-d06fe6c466a9@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261104-vlk-64036-dp-symbol-tg-v4-2-d06fe6c466a9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::14) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f1761d-51c3-47af-144b-08df4310afe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MqaBfql2Sdz46zoTUrbzttCnwLsyIdq233fwdibdB5XHa+b+35Hh8jZ3frQ9F8LMfa0KU/Ns4dZQRL3yILZpPgrqtnUquFFv3toXPygg0sADdwn842UyM2LAVW6y+zz3A0r9yAaX7yQOQfwwAZFBP/0Alt81mgiKjJHhADNHAsXvH9e2yfvHdraropTS11OtTB8fPeNfs5OoHLCYisP9ZIAOt5Z8Mj1/Qd7rbX0pIdC2BmNreub2Bc0lwRGI4ijcJIp65ov4LzxbuBG++SR28p0/pGD80jph7XS8qCtY6JTgXlRh6oSMeDTvQXkEO1x6DkK5SA/f+3y9aTwFcoJjQZmggLfhgFUCtXpCmzl2QOU9c0zhw+0CXTg1YbM2TpwSR0Kb9x77hRIlgGYZjwuyHURjEMlLR29GGledjFhMAiZaT6zkC68ZMTsL+Qc7zrmizavTI8FmkZQ+YU7VEGZzI+Jin+sIXL3wMOlpXTTf9H8OzZREbZyLGwT9l8tDVzOmSoDhXwIjE8lcVeLfCQV2rX7wlIfxsWlmzmZ/lBO2f0HggIMoYx9hNqUg2hRttTRAVeg9cG+uW0sEbvQfO6EzYStvl9XIso0IlavjC5t/xwXbLH8q4VjH3/0evdcEntxY+kju9Ohm7iw1ghDQX97YmKi2UWCvdUVw5LYFEJ8YOC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25hTEVDaDdVTVpXTVY4VjZyWDRTd3NFdVhxR3pjUEsyRC9NMVlIY09YTzEz?=
 =?utf-8?B?M21yTnZxeHR3bXo2K2tzMVlzMW0yaWtDMlBVUzAxd0NPeXM0K016SHFvNGp6?=
 =?utf-8?B?RmlRN3d5OWkwUXhXdjVjSHVqSDVNQjBOd3l5VlpuRDdHNUJzS2c1aTRRUU9t?=
 =?utf-8?B?QW1OL3ZEcHpiR01ndGI2c1dQK2hNYmliODdIWG1ZaE9DNjEzcXZzQThGWmp3?=
 =?utf-8?B?RCs0UVF4N0pzb2VkeTZpbGJvNXVTckxSUjBKOXNvUVN0YXhFWGVqWXA5ZDU1?=
 =?utf-8?B?dG5mSTY2amkzTHppL3MzSFYxVU9SQno2NkhpVXAyZi84d01NQi9KcHZWQWdX?=
 =?utf-8?B?b3NKQTgzcDFTTjE4cTV2MVlvR1FnSVkyMWVnU0VReUp1T0lWUUFac0NuTGh4?=
 =?utf-8?B?Snp1QnFDblR0Ni84SXFIYkxUalp5ZFNYZUd3UFo2K2NFY0NSRVpEYXFMaHNX?=
 =?utf-8?B?OUZwY3FLNFp2UklHVE9kZkQ5Z3NyZVBWUC8zeDF2T2E0QVZtTzMwL2FzMGxF?=
 =?utf-8?B?aVI5aHJQSTlOUDE0eEpHMHhUc1p2aEJyTGNodVAxNUh4eXRyVG0xWnd2L2ZQ?=
 =?utf-8?B?SmhNUkcxcVl2dlZpbXZwaXh3SEs3YUZFbzFBT1dWYVpBWmdCRmZFRkVEZ2Ev?=
 =?utf-8?B?eG80S3l3ZWNpamhWekNWWXQzYm9ISmZPdlQvWWVqV0xhdnJla0hIMmYvQnM0?=
 =?utf-8?B?clBnUWxrN0dDb25HeVl6Z3A3QjBpZUJmd3VQbmN0N2E5WEFSdW9CQ3p5UC9l?=
 =?utf-8?B?U1JJNlI0UFcvSW4yKzVpSUVqd2kvRWI4N2VhWnFXeXVuemxNTmc2U3N6Y0FS?=
 =?utf-8?B?dXRxUkZ4VGJrTmQ1aTk2a1FqZVdFSTYyalRKL1lud01sZGZzZ0R4TUxWOEJp?=
 =?utf-8?B?cFBoYm56Uk1pSjFXa01NTDNydTBRMlA5Y2R0bThNZ3RIWXdJWEtwWXRtaWIy?=
 =?utf-8?B?MUdmQ0h6bFNibEl4MlBGRVpQQzdsc3hjektDelpmV25TV1FqcTlDL2NNaFRy?=
 =?utf-8?B?bENuYUw1cEdSdGYvNVYyYUlESE8wVnpWUXdMTjZIeUZMTjdqMFJsNGxkcDNE?=
 =?utf-8?B?QVRQOFpLMkdiU3ZxemxXMlRIcUdqRmxEaXE4bkQ4azdHbG8yVHcrTDRQZ243?=
 =?utf-8?B?Lysvc0VDL2djZ1BKQ1YwMlVDNU9OcVhQRW1hSUxHbnNwaFY1Vkh4YVdwUFh5?=
 =?utf-8?B?TWRPODd1SVpEaHJaOHN2M1B0blJQNnpTN0FIQnlUTGltNUxIdjhJM2k0bXlZ?=
 =?utf-8?B?bkNYRDdhQzJBZDNNSjdTWnVvRUo0OEIvNUNWTjhTRWZaZlBGZmRCTDN3V2tS?=
 =?utf-8?B?SDgrZytpZHZ2MUxIdlFJbmlNMDR3VDYvV1krTkpjNW5RRlVCVlRscStxLzdJ?=
 =?utf-8?B?Sjk0MWQvcndTdWM2ZkpqY2xwZzVraFZLTjlYMnU3b2VYNnNRSzVZYTFUQTVn?=
 =?utf-8?B?dDFaWmVUQ25EMUluSGtPOE5Qam5RcVM1RGluNml2NytLcHcyTVNLdVA1STFq?=
 =?utf-8?B?UGgydy9obFVyWFFRNVpRSExrblppOGVXbVh5QlF3YUdSaXVjYlE5ZHQ2MTF4?=
 =?utf-8?B?R2tVaWhsaUFIemNZQnRhTkt1SHYyL1NOaEpHWERCL0ZSMkdLWUFzT25MOTVx?=
 =?utf-8?B?d1NhZTh2akUvNDNRRGl6Ujd4OW0rU1VRVWZMYjNWdjdXQ2pxNjVsTmVEVDAx?=
 =?utf-8?B?WktHa0srM29OYXYrV2w4TTZYZDFCaGZISTIybEUydE94MW5FblRURU5MOEJU?=
 =?utf-8?B?OVVYOUFPTkJzb1AvdUJpZ0ZtYmdiNUhDd3h2dXVXL2ZMSHNTaWVNekI4OVNL?=
 =?utf-8?B?bEswWVE4YnEzU1p6UG1nZTd5S0N3OGcxMWNaSlBsYVRvVWl6RW5UUnZlSlBL?=
 =?utf-8?B?alRWRXBuWmVUQjJBaEdNVGZWWU1xNlMrWmRqNS9ydGhUbm9oSzA3NjdrU2xI?=
 =?utf-8?B?UWZkQnA5WllJUXp5S0x4anJHYWRwcEk2MElYMnEvbUZoc2Q4UTZtY1lMc2Rt?=
 =?utf-8?B?MjBUNlUzMnlpN0F0M3YxaFB3dHpBMk9xemFveFBBakhJUWF3anZRY0g3clBj?=
 =?utf-8?B?WlNvS2Y4VVRiRU9Pbk1HeWRIaFUwRWNuNU5SNGZCWS9VeCsxRHdSazA3WjRr?=
 =?utf-8?B?YUhvd3BiMVlCMzdJMWcraFVMSy8yVXlSS3poOHZuMDh0UFRFUk1TWnQ0ZDVC?=
 =?utf-8?B?eWo5aWFrV2ZnejBMUlVzdnB6dXJHWW5aUTJpMDEyNjFuR0FFSU91Ymt1algr?=
 =?utf-8?B?M0JJVFpWK2NtZncxYVFZc25nTmNIVnVITzBucWkwM0o1Z01oZkJDeFNKY0tu?=
 =?utf-8?B?U1BsdWF2RXhKcDlJMjlhbTd6MkRRcHJKSlRhS2FxVVNNV0VtQjZpNUJoQ3Jr?=
 =?utf-8?Q?uzelplpCMEeuaS7o=3D?=
X-Exchange-RoutingPolicyChecked: BCXyMxwQHSpbv6wpUIoFzA7/aj7yHBoknaPpfewkGhlvkm0Y6r10YrsvlmGZM0vgg/ajT1KYr2tQktmdWYu9i9/VycLaafcca+4BuclPxR/2IV0pUnRr3VuBiQ2B7fKdPyPnMqZXVFYpM1ikhPzOdt29LX/omzuKy1nsnuRAUA/pDXWr7az38IN9aNS/Lr+F5j0gJrxjoBxgatbng8smLTMD5J2/HBX5mdxCzs3KXwMABgK9SH9LI9hqtnF7NzBA3Yh7l53PYMbyww8K6U0sj02p8y+DntgnAGL13ABcI496kQ8P0Aiw54U01YE9TKz6mNL2YmPS7Zibz0ArsKxYPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f1761d-51c3-47af-144b-08df4310afe3
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 12:05:06.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjEf+dc5HHfW15SJ9qQ8gJgQn8/tNO+lu38I8G0rF7NJ5DqjxVk7KuqL47bBQLSMhqeJQbJTVbRaYO9rnSt8p0+ysy29mCutF39fjZCNe6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 8:54 AM, Arun R Murthy wrote:
> Add the definitions of the registers of the DP link layer (LL) symbol
> based timing generator.
> 
> v3: change MMIO -> MMIO_TRANS2 (Suraj)
> 
> Bspec: 68849, 68922, 69961

nit: The registers this patch defines are on 74606 (TRANS_LLSYM_HTOTAL),
74607 (TRANS_LLSYM_CHUNK_SIZE), 74609 (TRANS_LLSYM_HACT),
74747/74748 (DP_LLSYM_DATAM/N) and 76160/76161 (_EXT).
Add those; keep 69961 for TRANSCONF.

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_regs.h | 38 +++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index bbdbc27629d7104c1f80baad44e710872214d42b..1a7badeb327977916c85ce88327ec496623d787b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -879,6 +879,7 @@
>   #define   TRANSCONF_DSI_PLL_LOCKED		REG_BIT(29) /* vlv & pipe A only */
>   #define   TRANSCONF_FRAME_START_DELAY_MASK	REG_GENMASK(28, 27) /* pre-hsw */
>   #define   TRANSCONF_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANSCONF_FRAME_START_DELAY_MASK, (x)) /* pre-hsw: 0-3 */
> +#define   TRANSCONF_DP_SYMBOL_TG_ENABLE		REG_BIT(28) /* xe3p+ */
>   #define   TRANSCONF_PIPE_LOCKED			REG_BIT(25)
>   #define   TRANSCONF_FORCE_BORDER			REG_BIT(25)
>   #define   TRANSCONF_GAMMA_MODE_MASK_I9XX		REG_BIT(24) /* gmch */
> @@ -930,6 +931,7 @@
>   #define   TRANSCONF_DITHER_TYPE_TEMP		REG_FIELD_PREP(TRANSCONF_DITHER_TYPE_MASK, 3)
>   #define   TRANSCONF_PIXEL_COUNT_SCALING_MASK	REG_GENMASK(1, 0)
>   #define   TRANSCONF_PIXEL_COUNT_SCALING_X4	1
> +#define   TRANSCONF_PIXEL_COUNT_SCALING_X1	3 /* xe3p+ */
> 
>   #define _PIPEASTAT		0x70024
>   #define PIPESTAT(dev_priv, pipe)		_MMIO_PIPE2(dev_priv, pipe, _PIPEASTAT)
> @@ -2332,6 +2334,42 @@
>   #define _DP_MIN_HBLANK_CTL_B			0x610ac
>   #define DP_MIN_HBLANK_CTL(trans)		_MMIO_TRANS(trans, _DP_MIN_HBLANK_CTL_A, _DP_MIN_HBLANK_CTL_B)
>   
> +/* DP link layer (LL) symbol based timing generator, display version 35+ */
> +#define _TRANS_LLSYM_HACT_A			0x600dc
> +#define TRANS_LLSYM_HACT(display, trans) \
> +	_MMIO_TRANS2(display, trans, _TRANS_LLSYM_HACT_A)
> +#define   TRANS_LLSYM_HACT_MASK			REG_GENMASK(14, 0)
> +#define   TRANS_LLSYM_HACT_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_HACT_MASK, (x))
> +
> +#define _TRANS_LLSYM_HTOTAL_A			0x600e0
> +#define TRANS_LLSYM_HTOTAL(display, trans) \
> +	_MMIO_TRANS2(display, trans, _TRANS_LLSYM_HTOTAL_A)
> +#define   TRANS_LLSYM_HTOTAL_MASK		REG_GENMASK(14, 0)
> +#define   TRANS_LLSYM_HTOTAL_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_HTOTAL_MASK, (x))
> +
> +#define _TRANS_LLSYM_CHUNK_SIZE_A		0x600e4
> +#define TRANS_LLSYM_CHUNK_SIZE(display, trans) \
> +	_MMIO_TRANS2(display, trans, _TRANS_LLSYM_CHUNK_SIZE_A)
> +#define   TRANS_LLSYM_CHUNK_SIZE_MASK		REG_GENMASK(11, 0)
> +#define   TRANS_LLSYM_CHUNK_SIZE_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_CHUNK_SIZE_MASK, (x))
> +
> +/* Data M/N value DW0/DW1 at the base offset, DW2/DW3 in the _EXT register */
> +#define _DP_LLSYM_DATAM_A			0x60024
> +#define DP_LLSYM_DATAM(display, trans, dw) \
> +	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAM_A + (dw) * 4)
> +
> +#define _DP_LLSYM_DATAN_A			0x60038
> +#define DP_LLSYM_DATAN(display, trans, dw) \
> +	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAN_A + (dw) * 4)
> +
> +#define _DP_LLSYM_DATAM_EXT_A			0x60470
> +#define DP_LLSYM_DATAM_EXT(display, trans, dw) \
> +	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAM_EXT_A + (dw) * 4)
> +
> +#define _DP_LLSYM_DATAN_EXT_A			0x60478
> +#define DP_LLSYM_DATAN_EXT(display, trans, dw) \
> +	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAN_EXT_A + (dw) * 4)
> +
>   /* SNB eDP training params */
>   /* SNB A-stepping */
>   #define  EDP_LINK_TRAIN_400MV_0DB_SNB_A		(0x38 << 22)
> 

