Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC937C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 06:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8690D10E8DD;
	Fri, 24 Jan 2025 06:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="La6MxG8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B4410E8DD
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 06:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737699398; x=1769235398;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V6kxEWjbhkw0LKFElvxYJSMknaO+tfXgv+216yrM0Ew=;
 b=La6MxG8i1laOuR0wUTQlB2pdLAB5KJFU5IBW+MjhoHP6hoz7oyu0Lp7u
 Jl9SO+D/yxerkOvTnoiMPRa9wvqh2ODI/7lvUPtVe7tuDZgbzuxurNq+9
 pSH/P2PuQCSbvlTXVfcPqijcW/I+gvcnutRajNJWJwH3d0dDcVs6BP8LI
 PWCixoUCA0mg4kHp4p6PkzfcrRvRDNA3bL7IKOiB0vzfLXKu3Jgy35q0J
 +W0VijPOlOMfdw2yFvzs2AITCsF6QIX1C0owkvydM1zli5n0irfsj/QGc
 oKcX+pS+M+lgIXCcGmK5+6xix0MKlqnX/bjWs9wnyUXdlPdhBiTfqAceo Q==;
X-CSE-ConnectionGUID: ZdordxkWSvqP96+sw45pwA==
X-CSE-MsgGUID: zqwAU4eoRkuSEmBhd0dlQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48888810"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="48888810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 22:16:36 -0800
X-CSE-ConnectionGUID: +Sex1fLJROKyxoO2y6ml6Q==
X-CSE-MsgGUID: xCVqjhZ1RPCrNraeb/k7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138561151"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 22:16:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 22:16:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 22:16:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 22:16:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XseRU7t/yBr41/BMb0hWcoea3oesbQkNTpUcuTd+qVna/HTgjgm4py6KvJZmzVUdM5UHsbnvezvAXWqP9gbFl8hyA0OyU4sdhMaTS2FSV3Fnvpil24AAOkl/mmzifsxtNr7/WszEbPb8pYiiWjSFElrbIp/CJG7YQWfFLjf/VD5rRjyXLFKvw+FcMMmS11PkrmL65LB5T8SF3VHvHMNmsMVT0wKM9PdS13el94wVTnZjVSKUQ8TtAbPlG39XLaT1uXTGCmqdneGCqEGKp+8sy5I0i6VbzY371FDvHoJIpI/8b1lax9B1Tz6Uabg4C46NVUGR2OJwv52X+jI9PvOXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p71WSSm9bIAOVAS/PKTA1zuQfmzzdQYxJJyL8TBW0Y=;
 b=R/IwrRzABWy9HW/DXNa2KrzPuiVE5h1G7jLXUIXS4AMriOiUVwkKy6xu5ZdaEUxAZoEH+nZI4ybgFio7mq//5mulKsRv6hNwpYo6eoTRfsYr5QLL/ysKnC0SZW9PIvMNHNXRuWzbtAn9f0bVDOz1ccH5guKxwkzEovra6nDyLPD/LUNGJI2aXoMrz8M86LrlEpiARhBIP4IwKj4xe96VLtRy+mI2fV+M3plAQ5rAxaFZQuQHCV1It1hY8FsKvw63vQmxi3bMCDCKsxUHTEnPBiZJlCnBalU+Q6d7TzSMSue45d7W0JXZEs2XHDNfdnJ/IbX7fc298HItfzp1bYoiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Fri, 24 Jan
 2025 06:16:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8356.020; Fri, 24 Jan 2025
 06:16:12 +0000
Message-ID: <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
Date: Fri, 24 Jan 2025 11:46:05 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
To: Raag Jadav <raag.jadav@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
Content-Language: en-US
In-Reply-To: <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 5234c778-3e82-4292-4904-08dd3c3e99fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUlEMHQwOStuN1A3a05HTXJIaG91YW9Ha1VMVG1iU0crZndUQzgraTllaUJ5?=
 =?utf-8?B?MDQ1b3VXUXhFRDJYSmxWcGlhUUgrbmhWT1lhb3BEVjZBS0pNU1FtajVYWWg2?=
 =?utf-8?B?VHRSdFZwTFVjbDczZnRibkpJcWovWGdCemlwamhyeUtLeFdVSnBWbnZSNDJ1?=
 =?utf-8?B?SWJGeFpJNWV1eHhYN3daSFBmdjdwQ001bUtHY21Zay9LdXFpeDhIUEcyYWZO?=
 =?utf-8?B?SGt2Z2dLK3JaaEhLRUtBSkt0UXNOaVB3eVJNQ0NtYXdFNC9qNkVCOGFjMURP?=
 =?utf-8?B?cE9pVWdjRDZKLzJQS3NkVDdIZjNXNWRsWTBCbGt4R2hJRWh0RHdLYmFVSUli?=
 =?utf-8?B?R04yVlBGNFpNTmJBUjFkTDlUN0k1NFdQRDczRXY4eVNUOEVjMjVaR0FiUXRP?=
 =?utf-8?B?dVRNV1lZZlozcGlFbmNzVjRZQ3kvc0pWdkJvUzcxZTFVakpKbHcvZnV6RnJ0?=
 =?utf-8?B?N0FBYjE2NkVydzArZmVBS1RqR3psekNYNTJyRFlEQ3JDWlUyTEhNOXo4SW1K?=
 =?utf-8?B?ZW9BUFZoUkpJK3AxcWViRENGTXVsOFZhNlRwRFdGWm05RlhtQ1d6cUw4TGYw?=
 =?utf-8?B?b0JZOXp4LzRIdXpwRHNWZ0psd3VZQkQ3cEZtcDg0SXV1alJBMWNEZGFoOWVq?=
 =?utf-8?B?OU9XcldiUlR0Mk03T0Z0OWpjS0d0Z3ZJdVVCVkZobGVpYzN3K2lzaUxCVCt4?=
 =?utf-8?B?RFFnby9OaStmQVJMYW9PSjQrajg3MGg4QVdjV1JDN09CcUYyZmlTc2s3K1R3?=
 =?utf-8?B?eFYrV0tiWnZONllXdVd0eU1kcGQ1QnpwbFJzNEMxZW5BZGtyY3FtZkVXaWFz?=
 =?utf-8?B?dkliQ0R1dDJSUDlSS3BCckJGQmp2SkpSaWRjNkNCdHpFUnEvYzRFVGliWWJQ?=
 =?utf-8?B?QVVSTGl0ZCtRaDJhSDNXV2xqd2Y0TnRIYmprbE9vdXZycG5NM0tQSk1pNWcy?=
 =?utf-8?B?TTlUYUo2VzNaWnlheUxvQ1JscjRXU0p1RWlId1A3NzdwajBuN1M2dmYwNDky?=
 =?utf-8?B?WE84UnM4Q0pXL3drWk1hRjFFakJ0UkxBV01BQzdKQVYraENyWG1oYjdmRm81?=
 =?utf-8?B?ak1BbXduY292UGFpRitZTnFXMzh0b3RKNlB2RnlpSDQ5MEpVaDJhSWloWWZs?=
 =?utf-8?B?VUZuajFYZ1ZpdmpsNTl1OFQyZ2xFUFh5dUJWNEdzUkNmU2tYWVBjZFVkQ1Qv?=
 =?utf-8?B?Q2JyanNZSEliSmZpdDZLbVlDdGhkQThQK20yZDBlbnJoWG9SaGhma3hkR3ZH?=
 =?utf-8?B?U2h3TFRqT09pRjJYZlBmN3ppVjVUckpYdVAzRHJtZXhrY0NoMEJodVVjZStL?=
 =?utf-8?B?VE1zR1NXT1BKSXhqZFR2eDUrR1FwQkY5TTRzN2FrZ2IwYXRGY3dBK2kvb0NH?=
 =?utf-8?B?Z2s2ZDFkNUM5ekY4VVBoYXYwdW9Hd1kwMkdkTmtZU3FzMGtBTEpVdXJmaUxI?=
 =?utf-8?B?N2JxMWI0dEtQejRHa1I3dzhiUFJ1OTErV1hhb0ZSeUVFRUxZKzVGdUZiRDl5?=
 =?utf-8?B?Y1JSd1NVeUtZSVh5cFJySDMvN1haekhBUW5lQkRqZ3Ixbzc5SFpDS3ZqSzRD?=
 =?utf-8?B?UGVGcTVxNWgxdHlHT1Exb1hoZFJ0VjJHQzVVT1RsdTJ5RmFUd2IvVXRsakJx?=
 =?utf-8?B?c1Vhbmsya0d1WHZXOU5DWnpvVlBiNGdJelJTWXdXemdLQVhFcURrNXFteCsz?=
 =?utf-8?B?RENsdEhDQVdWSW9VdUJvN1lrbnN5L0ZjbHk3OG0rY0I3M2RGOWlwTnAydTh6?=
 =?utf-8?B?UDY2N0VmRWtvWk9FVjB2K1FFWGRFbzBLemVxNUM4bnFCMmxNbCtlQmRyMnU4?=
 =?utf-8?B?TTFnNkFIdjZ3ZUZ2U3laZWpPQS9YcWRrOE5DMnZMK3ZRV1IrQXpyT3ZXY0Qw?=
 =?utf-8?Q?ZJK0p4/b2w6iO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnR6M0g1ZUh1L1QrUlJaNys4c3hkWWR6MHkzSER0cVpQa25wc1ltb3N0NThj?=
 =?utf-8?B?RWZIem85ejZRbHNRTmVkSWtjMllDN2xzMzl4b2F6ck5rWms4cDJZdTdjMDJS?=
 =?utf-8?B?TGFydGN2d0pBZ1plaWZJZVFiZDFrZk8yd05OSWxwNCtpbmFQY0pjdHF4NHQ1?=
 =?utf-8?B?WXpTTHdVQ1pRNk5MSEhWT3ptK2llNmlXbW1MalJVczlId1VTWGdMaldrVDY0?=
 =?utf-8?B?WTdvdHdKL09oSEJxempFRytzVzB5WUJNblFSN3c3TGhmTmcxczNla2pQV1cz?=
 =?utf-8?B?K01SajlxSmd4UllVcnVGUklDakxyTGZQYWx0NVR6bWJQNmRSMnB4bzFtVFJK?=
 =?utf-8?B?R2JRT042MDVqdERZb3hycEpmNGpQVWloZUNXMkYra3daTm1hY3JQMTNFbUNC?=
 =?utf-8?B?NXJDeHBIVjJBMWlJR01TTzNZcmdKUFEybzI3aVFuUlY2UUNWN0oyYkpkZU9Z?=
 =?utf-8?B?REhUUXdqNHBYVGdRS0ViWEVXR0MybVBRWUx2NG95YVh3cW8rcjc5YSs3WUVw?=
 =?utf-8?B?dkFxYnVRaFJJVmxya3NtK1BlN1pNSi9MSVdrTXp0cnQwVnpvVnl1dlhiUWw5?=
 =?utf-8?B?elhtZ2Z4ZmkzMlY3OFNldXNmY0xaQVNXS1QyalA5RWd0b2VmQWQxMmJPK2hu?=
 =?utf-8?B?RUMvUE10czYvM3dzcTJIS0VIOUt3cTRiS3BGR1RqU0p5eDNNMHFRaElDSWp1?=
 =?utf-8?B?MWJud1N6emZYMVl2TVhWKzJFUTUvMGxrN0xlSEp1V3k3dG50OGU0Mmx2Tngv?=
 =?utf-8?B?ZjhRRGovRkQ5NUFGY1pSZVFiOUY0NUxEL1NLSVFEbmRWZFp3Uy9MWjRjN0g3?=
 =?utf-8?B?VjBJRU9wODNLeUs3VnR4VENVdjN4aHNrVkR4bkl5M1M0ZDZCVk9sZldDbitl?=
 =?utf-8?B?cVZpd3dBYXd6NGw1TEhoeFd5djdPRThmR2VpVWJJemJMZDBoNUI2NExCeVFh?=
 =?utf-8?B?UGJJenMvdXVHNkdha1JmRnA4L2drSmp4YnQrbWd2SG1TWVZEMTdGZ1RFVm5z?=
 =?utf-8?B?YmdHcGcyYjdONTVIUGROQTVsOFNOSDNwMmlYRFNtV2xRN0lsZURNaXduK0Nj?=
 =?utf-8?B?b1hQNzFxOUFaRDJrZ2xzVnkvL2xmSEZjVElzQzlTZWwyT3Q1Q2k5ejh4Mms1?=
 =?utf-8?B?NmF0RFM5UmJPNGpEN0YvNHFWVXhBZU5CYThhTThwNGxuWTBZOFowRm54b2FQ?=
 =?utf-8?B?OHMzQ0UyQ3VLS0h2VUJFTjNDNGg4RGZLZFo4YXNVcjlHUHFXQmlCMzhyZkZ4?=
 =?utf-8?B?SHErMmpHMDk5OEQzYlpraGNRSHJNM2NNa0NULy8zRG5WS2hqaytTNGcwdHBU?=
 =?utf-8?B?dUZGWEU0dlRYLzF2STBYOG9hQi8vSWxmeUFYckFZQ0hQVTM0Q3d5eFpFOGIv?=
 =?utf-8?B?U2pOZ05OZ2VmY1FXamJkWWViS3VKL01jK2xYWnVUZVRNYTlNN21BcW9UOWdq?=
 =?utf-8?B?eHRXWHJnZmtHQ3F3ZUNwNllSc3dNU3E0d2ovM1FZV21FdE41UWQ4OHNnK3JH?=
 =?utf-8?B?OGFObmFERGFzejUzWVhBN1MvWTFIaHZxeHdLTUZzM2M3dVhtMXlqVnY5ZkVr?=
 =?utf-8?B?d2MvV3dVR2JTUzVwWE5xS3JPdlk1dVVnOGlVQTlnTmNDOWphMHhZM3RHMzEv?=
 =?utf-8?B?YzRKZ1JPbldqUUpSQ3g5MmV6OHFNUmVrMkNwd2tKWEdxQVRzcm0zU2FsTWl5?=
 =?utf-8?B?NFA2eU16UlNtQWZQYlc3MmhHRUcxcDF5dzR3ZW5ldUNHR3ZuUmVjS1RKMCs2?=
 =?utf-8?B?cUtXUnhMdVhqVUsvUC9JZEluRXpBZldrZVJ4QWpkTCt0ZlI5bDM3b3YzbVhO?=
 =?utf-8?B?OElzL1p2SVEwa25aNC9nMGRVSHZuUGhaak1PRG05QkdTQ3MzTDU1MXJuRDBQ?=
 =?utf-8?B?UVdHZG9XcXVicmYycWp0TVJLcVhKY1RLZVhBVGM5RWtlcll6SnJ2eFlVM0RU?=
 =?utf-8?B?dExTYXFXVzR5RjE5M0pWZXE5S2VpVS85UFJ3aFpZYUMyb2VVWTFYM0pEcU96?=
 =?utf-8?B?YUVVTGh0TEVVWW9lajNBZHJ6NS9vaDdLRVF0Z2FFRVY2c2dKOVk2L1YzYVpk?=
 =?utf-8?B?dEpjOC9kZmNoMkJOV3dLd1U5WXFZa0F5VzNZRTRXT0Yvc3hTVUNoL2F1cVV5?=
 =?utf-8?Q?aYtN9otUClkKleiyRdr05Yc9f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5234c778-3e82-4292-4904-08dd3c3e99fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 06:16:12.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyuNBqoayaI+qP2pfSNydzzbQO7JpsAaVvwv5oiDRZQYdAOGiq6C0zRe19blbrugRqZmC8kEOtNDC+53p8KDCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8701
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

Hi Raag

On 1/23/2025 8:21 AM, Raag Jadav wrote:
> On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
>> Hi Raag
>>
>> On 1/8/2025 2:54 PM, Raag Jadav wrote:
>>> Add hwmon support for temp1_input and temp2_input attributes, which will
>>> expose package and vram temperature in millidegree Celsius. With this in
>>> place we can monitor temperature using lm-sensors tool.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>    drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>    drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>    drivers/gpu/drm/xe/xe_hwmon.c                 | 63 +++++++++++++++++++
>>>    4 files changed, 84 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> index d792a56f59ac..998cfb0ee1a6 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>>>    Description:	RO. Package current voltage in millivolt.
>>>    		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
>>> +Date:		April 2025
>>> +KernelVersion:	6.15
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Package temperature in millidegree Celsius.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>> +Date:		April 2025
>>> +KernelVersion:	6.15
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. VRAM temperature in millidegree Celsius.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> index 519dd1067a19..f5e5234857c1 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> @@ -34,6 +34,9 @@
>>>    #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>>> +#define   TEMP_MASK				REG_GENMASK(7, 0)
>>> +
>>>    #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>>    #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>>>    #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> @@ -21,6 +21,8 @@
>>>    #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>>>    #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>>>    #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>>> +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>>> +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>> indentation.
> 
> It's a git quirk, you won't see it in file.
> 
>> Also you are using the same for DG2. Should have a common name
> 
> Just following the conventions.
Did not find this convention in the file.
BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix. 
Doesn't seem right		
> 
>>>    #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>>>    #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>>>    #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index fde56dad3ab7..5b5c844adf4a 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -6,6 +6,7 @@
>>>    #include <linux/hwmon-sysfs.h>
>>>    #include <linux/hwmon.h>
>>>    #include <linux/types.h>
>>> +#include <linux/units.h>
>>>    #include <drm/drm_managed.h>
>>>    #include "regs/xe_gt_regs.h"
>>> @@ -20,6 +21,7 @@
>>>    #include "xe_pm.h"
>>>    enum xe_hwmon_reg {
>>> +	REG_TEMP,
>> add to the end
>>>    	REG_PKG_RAPL_LIMIT,
>>>    	REG_PKG_POWER_SKU,
>>>    	REG_PKG_POWER_SKU_UNIT,
>>> @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
>>>    	CHANNEL_MAX,
>>>    };
>>> +enum xe_hwmon_temp {
>>> +	TEMP_PKG,
>>> +	TEMP_VRAM,
>>> +};
>> Can't the existing channel enum be used here?
> 
> Nope, that'd break the indexes.
@badal/@karthik Are multiple indexes for the same channel okay?

In the current code, for dg2 only channel 1 is exposed for power and 
channel 0 skipped. Something like that needs to be done here too?

Thanks
Riana

> 
>>> +
>>>    /*
>>>     * SF_* - scale factors for particular quantities according to hwmon spec.
>>>     */
>>> @@ -84,6 +91,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>>    	struct xe_device *xe = hwmon->xe;
>>>    	switch (hwmon_reg) {
>>> +	case REG_TEMP:
>>> +		if (xe->info.platform == XE_BATTLEMAGE) {
>>> +			if (channel == TEMP_PKG)
>>> +				return BMG_PACKAGE_TEMPERATURE;
>>> +			else if (channel == TEMP_VRAM)
>>> +				return BMG_VRAM_TEMPERATURE;
>>> +		} else if (xe->info.platform == XE_DG2) {
>>> +			if (channel == TEMP_PKG)
>>> +				return PCU_CR_PACKAGE_TEMPERATURE;
>>> +			else if (channel == TEMP_VRAM)
>>> +				return BMG_VRAM_TEMPERATURE;
>>> +		}
>> Common code for bmg and dg2. Can be moved out
> 
> Again, the conventions + easier to add new platforms this way.
 > > Raag

