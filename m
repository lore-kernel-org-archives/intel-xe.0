Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850BAE77188
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 00:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1530410E3CE;
	Wed, 15 Jan 2025 00:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1k79TfA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D3F10E3CE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736901611; x=1768437611;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XEzTcc3aJ3BTtWISmTXHNbrxQLLOjxk6nJjMXd9OHkk=;
 b=N1k79TfAZhSCqLTaWFycPLPFHNV8dEt3sbGc99cCInpXX78MpQmT0lFU
 MCdsSrfKDjRB4RPIPdTdZpWcupk1/wHkVYVPKbh7gHzo0A7oRabpOaYqo
 jWHaJntNa9UFa6Ipi3yQVQZlUsrrjBw5tRhhtOePV8d5DZ/c2+CZ+dKYz
 mSlFfVUH1GMbRNyuFChtNDFL56z1ck9ugSGUXdjgVXeuBWtqmJ4IdGx5z
 0szciO21JREc919hlGm32JzluV1xZzsqyj9aTSi/du2P5m3xasmv1khup
 77MzGoFyzjLFz8mdDmD6AJsZVVIjysNZ/62lTAUu7QDz9Q/K2VMDsoo74 A==;
X-CSE-ConnectionGUID: 2lRB+qUrRHK3y89aFakhEA==
X-CSE-MsgGUID: Co1E+bPLRE6K3pWf9ccSAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40985580"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="40985580"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 16:40:11 -0800
X-CSE-ConnectionGUID: do9PBjvbQF2tamqVCCs0wQ==
X-CSE-MsgGUID: uUHxvVayRmGdjhiHY7Uzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="109929069"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 16:40:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 16:40:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 16:40:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 16:40:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLdCgmdInA4OFQn2I66hqZzbZUQcSkXcwKKOpSUu7kNrvL9nFhUEfOAJa+ijuypnOyShV+DaSwrXoI7Vzn5nus4GNShd1J0cMd95VF/EhKZOo+uqJydGq1VTWto7ypZGWcrJtbWMTACC/jNiPSsMN6pD1IN+z3m8/Tlvad1d9DjJBsi5Bv37Z7X5XgnNDuWNBANMAGHpQKZ1DMB1djzbARQNJ05uC2wk8KxP3tVCNlsqXEFn0eSzlQS6swjM0DHV36zvP3FLflBe79a4+fiezoVqD7smg0a4xBqbgefKwr+wvFX3rAVKmj1udLHXRkYN5N3U8O1iifYg2JKL0/TmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u3n40mWOYsOD48qbaQwKYTRqGvyHqoPHPcnhEhbiCo=;
 b=e8wkC2QHuK6zDR9clnDQRAbl1vmjI+xdgjXekEnVJ/4GtOzuMOZCzcMsdZJTFU8k4Hk14S0rYaWjp6KIXEtw2Kj61vnb/TIZBhgPL8OvlM54yQ7z+jVm9aeJVq+qhjS6wEnRXsrTqOvzTi/rcytT1CsHOHEOYV4GlWWi0bRKG3EmbecrWw0pssd2q7ii+ws7QeySFPNdaFJE8fjhFfoTd5STbwLnOWFI+cSprcDvkBo6+mKh1sSv0aDdB7R5bUOxaODymqd7WLpQmp74Y7aVwJKe9NZt8mOVZKr//dV6TO9NmSyhQEANOLag7VNAehGpUfVPURGG3hfkCFtIDHtx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 00:40:06 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 00:40:06 +0000
Message-ID: <300a04c9-99b5-44f0-a1eb-87ae4e1294bf@intel.com>
Date: Tue, 14 Jan 2025 16:40:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250114232443.1135355-1-rodrigo.vivi@intel.com>
 <20250114232443.1135355-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250114232443.1135355-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2dc8e8-3066-4f1e-67d7-08dd34fd2815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGlRS3Y4UlhNZ0ZRQXFaYnBWdmZMQ0hMZklTTnlEeEl6NU9SKytsN1MrVlZY?=
 =?utf-8?B?bFhRSVZTUGlUN1lWZGRyczhFMHAzbzAwRWtCTHAxTDRQOTNBWGRUbnV5UUo3?=
 =?utf-8?B?VUJxSndMWGdWS3dXbUFLVTJRY2hrQk5JSCtheXI4WUE4Q0p0ZkliL2lycnJl?=
 =?utf-8?B?QWx3cGFrd0oyR0RwREpzUWovTVhIb2JXR3VnRWxpdkdhSE9YVUVTdmVXbThj?=
 =?utf-8?B?cFQ5dmw2emdpUXg5eXc0cmdLalplRmxnbDJSTU5icTZWVHByVHlha3pBZUFm?=
 =?utf-8?B?VjRYTjlMaE5TNTNLdit6NUU4L28yQzFyZnVpTWkyMzF0YVRxQkd1ZFg1V3Rh?=
 =?utf-8?B?RENjK2MrVzBVa1ovLzVHMnFURWh6aUtwYjZ4VDhEQXdHakcxSnNzVWpjNng5?=
 =?utf-8?B?YWUvazlTOG4zUU90bTFRdUFieW5yU1pCTFpvNzRYc3lqMHRTSDYxUzJwUWVW?=
 =?utf-8?B?czBGRzRBeFI0THEzdUU0NXJ6aEhpckNCWkJJb01ERS9KVURXelJ2c2VISGg3?=
 =?utf-8?B?MEJHVnlMWk1KWlpMYXVyd2RQTEZveFJXQzBiN3RSY3lZM3V3b25yc0xaWnNs?=
 =?utf-8?B?QThIZzdHSE5NQmZtSWZzbGxiallxNWx5cWJzaGFUNE9FTXVqT0UrMXJ6endL?=
 =?utf-8?B?QTJFWmZtM0FoOXhkcHg5cGZHaHI2QUI4bGN6REE2WTJKUWR2aUxQenRaT21u?=
 =?utf-8?B?bzZlUmRhNy9TK0hsVlg0eUEvUTFGM3pMUWYraGlFQ1dhN25mVktOeUk5OGll?=
 =?utf-8?B?VnZvMzV0ZlF5RW14TVA3WUpZY3pGaE5PMVpoRHdWQVFveGxwY2RBeDhEOC9K?=
 =?utf-8?B?dk1FVkdUbGhSTVJhWkUzbFRqaVI3N0JyVnNRQTdGMGFETkt4cTlaekwxZ0NZ?=
 =?utf-8?B?N3Y5NTlvYlU5b2dqYmM4SDkyb0VqN3Q1bFh5bFpiSmhuUGFtU2xiUnZIQlE5?=
 =?utf-8?B?bjdka1J3cm4yVnM1SjNwSytOWk45ZEVHaFNtcnBDQ3JMODlUNU5WRERiK3Ri?=
 =?utf-8?B?TjRic3JlVXZaamx6TktKeDBVRytLR0FYSUlwdmlNSDkwMEY4VjR3UmRSTUlR?=
 =?utf-8?B?cDlMNnpSYW9pUk9neEc5NnRydFNRekRIWkR1VE1UM1F6SEt1dXpWUmYzdm9G?=
 =?utf-8?B?L0RLMUFSUXdlNCtaL0UvMHJGa2dIdnU1OW12OTlGbU5wZGJvRlo5aTFLVmdT?=
 =?utf-8?B?SjIxUk5TYUtZWnBQLzBTTk1aUjFaNWdPZElOeDVNeTcrRWN3Z3RLWkxJRWV5?=
 =?utf-8?B?elltc3o3dlU0NGxEZk92NlE2ZERiUlpldU40bXpOMWJDN0trcnorRmJOWGxY?=
 =?utf-8?B?d0hlWSthdGZPb0pTOGRubW9jL1pkdWIvR21vaENlbkdTUGprR01ob20ydkN6?=
 =?utf-8?B?R05iVmxFalhDSFNtMHg0MkthMExxdkQ1TUpNamp2cUpYV09rbW1UMWNxR2VH?=
 =?utf-8?B?VEZiTlhEQXJxU3JNTXYvNjFqUVkzNHZGM0prTWtRYWxmVXJzZCtHejNSWENv?=
 =?utf-8?B?Ykl5MkZqS3RGZXYvT01taWpiRUlQajlwczZnNSt6N0RPZDF5NUQ2dzRZQzlD?=
 =?utf-8?B?WWEyM3dJbUt3dHFnT0QreFdRVGVHZ3JoOHBvT0xxRnJva1ZPZUk1UTJHdmdz?=
 =?utf-8?B?TmRpR1orVHNsRzYzY1lQNHpUUXdTWXQyQk9aRllqVDlrTXhNSDNObGZ6aTJ3?=
 =?utf-8?B?Y0d1OFFYL04vZHNhaWlhdVBRd3RoT21VQ3dtRGYvY1Vnb1M4dUZXbmVEeW5w?=
 =?utf-8?B?dEgwd3VpbTE1WStkdEpoTUNXSDEyeTg3VjlSb1RFQlhDbzhEdnRlZFZmd29k?=
 =?utf-8?B?UnE1ak1GNHFxTjZ1M3NSc3AwUTlFaXh3NmRXNEdSMnNibFNRa1BUYkZKRzYv?=
 =?utf-8?Q?xCOnd+hDFBGm+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGROYTR4SjZMdjVWZmZBOE9ELzYwTURvQlExZDhEVytLN3E5dzJkTlpuZ0tq?=
 =?utf-8?B?bkxScEk4d2RQVVcyZmVVbHB3ZXA3SnlNQ0hMRnlvNGJ0aHgyWU5reCt1UGJ1?=
 =?utf-8?B?SHpFQjRnNXdoaXFxcUpkYzZUOVcrT1BEVE5lRW5Nd3JJaHhOMkhKWUxsRkdP?=
 =?utf-8?B?V3NRY09oa3Z6WkNyaks1M1d0amVOWVJrTXhDQkdsSVk4Q3NVb0JkMU9idjQr?=
 =?utf-8?B?dHp3TmY1d1ViNDVNRDJoYTN4a3ExVUVOS0dMM0JtVmtXTk1kbFJCR2NoTE1T?=
 =?utf-8?B?QjlYRk9kRXgrMFZ4MlN1TTNMN0YvclM2bzV2S1dwWGF5VEptZk9rVUNpWDRN?=
 =?utf-8?B?VmFwUTRER1dUOW8vaXhqcXVaYkhneHU3MS85MWk4UEFjbUJMcElLMDEwSlls?=
 =?utf-8?B?RkpYYzJmTVlCRllEWUJYZkdoclByaWl2QmFrVHg3djdxTUo2WDJIMjZ4SmJW?=
 =?utf-8?B?VkRSc0lMc1ByanVsdkxCMS9aTk0xeGhhVUVDUGlmd21oUUJYRDJ6WjJwam5N?=
 =?utf-8?B?Z0Q5bUZpZnA0eUZ0T0JwNk4zOWJuQWdRL2FzSnNtQXdUNklocjViY2ppMEFS?=
 =?utf-8?B?U3h0RzVtUDFHQVd5aW9DUFVCYjJzZE5sNWpNYTFqVTVISDZsS2RJT0U1T1Uv?=
 =?utf-8?B?YldaYzFEMDBxNlV4bFJuQ25mOE9lRTJFM2I0OFQrV0hjMm5XRnc2UisyQ3Bt?=
 =?utf-8?B?aGREQVlReDJMOHRNaGhLby9MYUR3NVU5MTVDL0dOWWRwQzlwNW1obWh1Q2dB?=
 =?utf-8?B?TE54cmQ5VHV6Z0cvQ1N0WG5PUTdLVVZDWFcrMEdSS3RwWGRsVkZDeE5FcFNV?=
 =?utf-8?B?QkJrQmQ5UHRyWWdVMjh3TWZpZHMxcUxya0J0K1MydDYrQ0J6SUxCV1RNa3FS?=
 =?utf-8?B?aUV4YmFUQUxxVzE1eEg5ZFZ2WUFGN1dLME01ZXV3VkpaQTJyMTZIVDBXQU50?=
 =?utf-8?B?RDcrRCtibW5XUy91ZGFkVFRhdTdHVGZSRlR0bWxBSUk5SkFCcFo1c0VTYjc5?=
 =?utf-8?B?dnphVlViZG56QlJtenNIZ2ZlNGpjL0pMS2w3TjlEWlNPTlpSYW5ibGtqQXFU?=
 =?utf-8?B?MG0ySGxWWkttR1pIdTVOK3Q0Ulh2WUJvUkp6ZXpIWlZsZEtza2pxOVc5WGYx?=
 =?utf-8?B?Yjl0eVFJMUhIQm9aU2U2eTBLME15Nlg5YmFHbVlLUjVYZmN5SXJjYms4eEtW?=
 =?utf-8?B?c1hheHV5aHVNOWxTT0VoMmFXUUp5YUp4RldIYUVSNmdFc3RKMVBvcXcxNmxH?=
 =?utf-8?B?UlJJbENNOFcvTzRIVnFZaXlsNUJjMlZhTU01QzBtQ3YyZytzYjNJYmlmdXpK?=
 =?utf-8?B?SjFPci9pNGw0VG1HUnRYQ3pyUW9HVEtjcGkwbWM0eHNCS3hrV0ROY1lYck9T?=
 =?utf-8?B?WnJ2bmxZV0tWMVJIdUM1YVBLRWFxMFpGbnU1R0dZU3RFWHk3T0FvejczTVJk?=
 =?utf-8?B?SXc4d2wzZVhqYVlhcHlXOW96U3hIaVZuRVZ0YmhUWndLZEtQeWg1T1NUWlVp?=
 =?utf-8?B?RW9KZmlwWGwwSFpIQlVQRHltODBuNU5TSmZ3NUhTRHE1Ky9UdGJMYjRHR2Yz?=
 =?utf-8?B?SUhvS0NTL21FdGtJZFJLVTVLVGY4THZ2SURlMG1lZEVHc290YS9QNHRBc2tN?=
 =?utf-8?B?c3U1cjIrTWxoTlRCWm45citOMUZmYVZoWmlWSlpiM1dCbTMyM3Z4anE0VEVm?=
 =?utf-8?B?UWlvKy80WkU0L25jMVZZcjh1dXoxOU5LVUNINDRoeko4TytIeG54WExyVXpz?=
 =?utf-8?B?ZUx6R3BtMnFxRE1PRDZ3TzlFS09XTmFlYjBkbVpLVVJRcnlySDVJUmwxSE5h?=
 =?utf-8?B?RENrTWwzaVdMSURGa0N2R21FU3dIclJxdVd2RmNENHhGbW8ySGtFSTBCbkhC?=
 =?utf-8?B?Y2dDYWZUOHdpd1poa3J5NDhvaThrWVhSdGJ0ckxKUmoxRU5ERkxqY0RkV2NU?=
 =?utf-8?B?dG5GZ2hobWxxVE9FdTJRZGdRSzRYZW5PL2V2aERod1MwVjBYTExjTW1ZS0Mv?=
 =?utf-8?B?cVhTT1pQL213QWdsaVhUY3hBREN5anRkYjFQSkZCcFIxZVkwRE5TeGpuYzYw?=
 =?utf-8?B?Q01jVHhLaGJ4TjBZWGFKTFJVZitLOTQyUnZBSEFVcVkwSWo2eEkzNVlWdWUv?=
 =?utf-8?B?V0c0ZHB0dEhKd2ZhR1FQWFRlbVBma2dPZmwraCtRaWJYaVFOU0FrWWFGaEZH?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2dc8e8-3066-4f1e-67d7-08dd34fd2815
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 00:40:06.1618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIEh7u6YVFbeTsBVjvsNff00zj0X7PfZ6o7hnQF4lYLeFkd80GNK05/YggQ0Ume0l3SgpdIpH4yaEYiQXtCeT4g+eGAOSAwcpzeoE6SxTGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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


On 1/14/2025 3:24 PM, Rodrigo Vivi wrote:
> Enable DCC (Duty Cycle Control) in Lunar Lake.
>
> DCC is the SLPC task that tries to keep
> the GT from operating inefficiently when thermally constrained.
>
> Although the recommendation is to enable it, LNL GuC is leaving
> it disabled by default on LNL.
>
> It would minimize the GT frequency oscillation on throttled
> scenarios, which could potentially reduce latencies.
>
> v2: Move set_policies call after wait for running state, so
>      we ensure it is not overwritten. (Vinay)
> v3: Fix English in the commit message (Jonathan)
> v4: Also set disable to 0 so DCC can really get into effect.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v3
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 43f9617baba2..e4f5db787e36 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -993,6 +993,27 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +static int lnl_enable_dcc(struct xe_guc_pc *pc)

Does the function name need to have lnl? There is nothing LNL specific 
it is doing.

Other than that,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +{
> +	int ret;
> +
> +	ret = pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
> +	if (ret)
> +		return ret;
> +
> +	return pc_action_set_param(pc, SLPC_PARAM_TASK_DISABLE_DCC, 0);
> +}
> +
> +static int slpc_set_policies(struct xe_guc_pc *pc)
> +{
> +	struct xe_device *xe = pc_to_xe(pc);
> +
> +	if (xe->info.platform == XE_LUNARLAKE)
> +		return lnl_enable_dcc(pc);
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_guc_pc_start - Start GuC's Power Conservation component
>    * @pc: Xe_GuC_PC instance
> @@ -1037,6 +1058,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		goto out;
>   	}
>   
> +	ret = slpc_set_policies(pc);
> +	if (ret)
> +		goto out;
> +
>   	ret = pc_init_freqs(pc);
>   	if (ret)
>   		goto out;
