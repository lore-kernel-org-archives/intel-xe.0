Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76152C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 04:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C83410E773;
	Fri, 12 Jul 2024 04:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNgv0KLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F1410E773
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 04:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720757720; x=1752293720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bCCyIubqSs+7YabyqNR72Ztx/F0/qyPoG0whHE0MeKw=;
 b=mNgv0KLAr+pjo+HbnzaedYpJcrpc+ehchDR17xWHL25EV3ClhHa0GI4k
 a+GQK+FzANTbkxVQum0nAOCCKJA09g1IiAq6qSC1weuFwXxoqS6uyHeLY
 +tYTXZ4AHgrtMTiHqycHeC3e5odyF8fjdI9K9SuxdvPlDQuufPwN3qmTL
 Boxqj1jPCWpuJNBQFx/thuP8m+kZcTzjv9eVjGRsxXB4X5mnFnTaDY2HA
 kTiL25B7S6RzxPTyABSLU2hBSseScPatmPYAmEjbAh2nOWoMVQqqFx9Zx
 oG6nHpG6rcN36dNku33jQJiJWFn96Ty8WI6sKFpyDzqHvDMJ1DPakCywX A==;
X-CSE-ConnectionGUID: QqgTRuj4S4iahILul9z3ww==
X-CSE-MsgGUID: NexanY/5SsG1U4EN4uJ1Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17892843"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="17892843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 21:15:19 -0700
X-CSE-ConnectionGUID: nUY7xCZgTmKqxaVk6Fy+6A==
X-CSE-MsgGUID: Z4hM+8WOSdyKx3wGhARFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48864064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 21:15:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 21:15:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 21:15:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 21:15:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMR8uL40ZLpvIFKKCKrMm6PO67nXuntp03WFVk9MA2NhfmP3K/AlZ2Q6L4CctDW9FMMIeBlkJQM3v9JI/sXxFrYXxIPocRHsMyldVDFjDDzkPDQtki1dRkA0RBpj6LR1gpnzGFIDLbzK5+qB6aXKRnZTkwDfM9hnPCOaufD77Za74akFiuM/4VYsDFClyhKulJrKjZU5iinWBMm87WY+M1x1SO/nbB2jSI7OXpWkt9lXY2DzVILO3UAujOXpFnjlGAZpiotSGoksbggP9jZlVO3zysARImYeduGnrFflox3AKHm0C8u18dwiHBoniR6oBYPiowKZil/0aXny+RR5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOGRDQylw7hIBOsktYdueoLjvJCQc+9cuGIC/e123Lo=;
 b=tRSXFQueRiJS/nHKRbfoKadZKkrmn4GK86yjXGerp9xPp5QbET8DzkE+Vqw5gbtIJHZteoNTcCSnEFPR+AJOQSzonQYmctYX9jjZfhPgUhFFOd4fGxbTYQ6ThR9GqeiW47OKOv7nMUG6P+qpZz8I8LGarY5Q3fNVR3cAyxCc1epbt9m+tXVpK93bTFicfal3zU1DSpd+actGj97+tx5pNfPXw/C+GOO0+zedymyF2D5cbKt/71xZ8XMN+HWjF4WbTEEhBl7tUJhfkQWkVK9bDlgfeb7YGIMNMTjV+LC8MoV215jA/Muyd1e2r7CKAUV/MoNlbDWAY5TbRaHI4c6Ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Fri, 12 Jul
 2024 04:15:15 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%5]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 04:15:15 +0000
Message-ID: <0f4f3aef-d998-4bad-95ad-e495b8a9e7bf@intel.com>
Date: Thu, 11 Jul 2024 21:15:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/migrate: Add kunit to test clear functionality
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <lucas.demarchi@intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
 <5ab88aebf91c7f7f35fd3a0d4601df80fde9f03d.1720689220.git.akshata.jahagirdar@intel.com>
 <c58509fa-aca4-47c7-b1a7-1ae2137ce932@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <c58509fa-aca4-47c7-b1a7-1ae2137ce932@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:303:83::15) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH0PR11MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5f7c17-86d6-4046-2fd7-08dca2293b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STBndEl6Tm9FNFIwSVdZMmVmNlhvcXB5Wll4dHJibnhTcm4xQU5oSllhRklx?=
 =?utf-8?B?Ri9aVStXOGxMVmMvRmFBTWQxYnc1K3hXK3J1N1JvM0owdVg1SkxrNDF4N2Iw?=
 =?utf-8?B?QlY3Nmw2Z05MTmdyczcxZXo0K0ZPTzcxSlY1cFhVSVAxSnoyQmZLRkJkZGxu?=
 =?utf-8?B?SjJDajMrclc0dU1aZHdMRjNSdlA3OUNlSnMxSXBMekVXK1lnVnA3VC9aV0pj?=
 =?utf-8?B?RGdVZjVibnJEOTFEcUxiZTRZSEl6YlFQK1NMbXpMTEg3OTVtemdFVlBaQ3I3?=
 =?utf-8?B?aXNEay9sM0pUZ3c2VVRXR1dmSDJwSjRTalRPVXdSM0FBN2RPNTIvMmwzTFI3?=
 =?utf-8?B?QmlIaXh1M1B0Y2FrZ1JtYjU5TDkyQWVaY2VnR21salF5VVZWa3U1cE0wKzE3?=
 =?utf-8?B?aFVTN1lwcEdSSE9FTm1Rb2cxaWkwalI3N2xMZjRWR0F6b0EyR3VTQjZrc0JJ?=
 =?utf-8?B?ZkQ2UnlQR28xTGFNZ0w5ZnFqajY0Wk5tOTlUbkR5dnVZc2h4bnArajdPZnlM?=
 =?utf-8?B?eHlNNjRvVHk1OURVMVpBWXdjN1NjeVJacXZwWi9ESXBxQkFFZUlRalJJRFRX?=
 =?utf-8?B?Ry82a0xsZHdKU21kMEpIU3Bya2JIMnYxMk9sbnlkZjJGazh6cmVLM0RLQ0hn?=
 =?utf-8?B?bkhjVmNFMWVxc2NtelBRaUs0UkgveGgxZ2FYMjg1U1hLallpRmNpczZ6VU1T?=
 =?utf-8?B?WjRrNXYwYjh4T09lUHRYYkpVaXdRMlJDTU9Ec0gwM3h2aDBJT3N5ZHpSVU1T?=
 =?utf-8?B?YVR2dis4VXZtQ1J4cVRFdDF0dGw5Z1dXVWhlOUZNOGxQdjVMRk8xUHhYYUI5?=
 =?utf-8?B?dUJzckFDaXhiOTRLMnJxVmdVdVpRblBjOGJqdFIyWXB2bkpYSDkvK3RJKy96?=
 =?utf-8?B?Tnl0bXNZREpJejlkVk53WTdldHJRcWdUWkxzTXg5dlUzRTg0WHhyd08wVDYw?=
 =?utf-8?B?RGw5dk85M2R2VW03aG5oMzFLUk9mSUk1SVFNUGl4aGdkSWJVWDNsQU9VSktO?=
 =?utf-8?B?Q0tJVXhDVjhybU8wYmYrRkpvZkVabTlhSC91dnZHMnVqbUhlZHRTcFBqQ1Zm?=
 =?utf-8?B?N2dibzV6TklOYS9mVXNSYWZxRHdWekFic014c1g5SXBuOHd4QWVMcXZyNUpB?=
 =?utf-8?B?S1NqVUpyUjRUVlhabXB0MnVjVElZR3JKWTVvaW84UmpRV2JuN1kreDB4WThl?=
 =?utf-8?B?R3pHaDhxL0hqbDNTZDZjYk1MWVlDNmhNWkhwVDFXWG93LzY4L2xtT2c0czJO?=
 =?utf-8?B?YUUrY1IwdElET1BNMkZMQklxQytiZFd1ZVZJT2VXUTBjTnpzYUtUbkUyRHNx?=
 =?utf-8?B?T0lBWStQWldXQXhFL1pXR0tQM3JvaDZNQTAyQkRPSzI3NW9vOFYvSHVTK0dZ?=
 =?utf-8?B?MHJkMVNlNG9RMGgxZ2oxeU9OQnBBa2piYnllL09DS1RoMStTNWZkSFN1bS9h?=
 =?utf-8?B?dkQ1cCt3bU05NmhJVE96enphRTRNSVFNSy9wZ0VCRjFxY2F4UWlIazh4bUF4?=
 =?utf-8?B?U2FTbnVzMk82N0F1WFVNVnVKS0hwYjdJY3RYRlBud2VBbTFxUUd5dHpnQ0FT?=
 =?utf-8?B?VGkzTzY2a0tZZVIwUmNJZmdNQUU2S2hhK25oeHgyc29RNTduMkE0aHZjZkhs?=
 =?utf-8?B?MFVXN3BBZUVod0liZHBYL1QyRUxSS3BHT3FDZEZ5ZmxaNUxYSW5qTU0rbTlR?=
 =?utf-8?B?dG9WVWY5RThzZWtLemlBamZIQlB5YkhidXdmbVl3S1RMQXdqVXVoRG9xblRj?=
 =?utf-8?B?Mk02dnJ5N2ZkTXhLMnN1a1NnMjJtRFBvc0tXeW5LUU5oQUxaQVB4Z0pBZXdP?=
 =?utf-8?B?b3d2THdGcGxjb2VPTTBoUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1lVWnRkalpOK3F4ckNwUWl6Y0p0dWdwMTducVNBenRTdThLd0luSHVwWGZK?=
 =?utf-8?B?K1RRYkhwSFJwRFh6anVNSTRlTFRIR0NMVlgzZUt2M0hUV1hoZUxDSjU0T1V6?=
 =?utf-8?B?eGdheUVTMXBUVzZFV3Z5aWN6MEYwUXlnTWprVi9YbUZEeXRneWRYYklqQVZl?=
 =?utf-8?B?Y0h1L3BqM2hsdGM5YXYvK1lTWW5iSEcxM2Mwb1R2WFVKMkplM0sydzhhZDF1?=
 =?utf-8?B?b0luazg4M2FtMmUwV3UzMjV4eWJHRWc4NFliam9MMVlYekxVMlNWb3c1UUt1?=
 =?utf-8?B?N2ZRVWlpS2JtQ21xTEFjTjJ4TnNERG9YbVAwMW1sYmtKYjlVaS9FYXNwOWI1?=
 =?utf-8?B?dlgyMUlsTnJCOVA5OXpCZDlOZzJVVlJFVnROdHJvV2VVRWVYYWZBaVBzNkRX?=
 =?utf-8?B?VUF1WkhFbkJuQ0lQL3VFL1NGUVE3YkcxOHY4VkZnSFpURXFaVGU2SWRicW9G?=
 =?utf-8?B?cXo0bDRmSTNDeUNkNldHNmQ0WXljZFlZSmtvQ1ZaQk51SnAzdXAyRzhsOTNw?=
 =?utf-8?B?dURmVzRkYmdkZzJBUmEzUGZ6RW1va2wvOTlUdVRKQXNudDZ3SDBDajZJMTBP?=
 =?utf-8?B?OTE4cHU2VURzRGJsWjZKVDBINFllMkJ0RGJUc3pDeE9jaHZVR2Z2blZBRDR1?=
 =?utf-8?B?RWdUbUM2bitZelZDdEJ4VjZ0SFZCSElsNW5Uc09QR2lYK2JXODNhZlFoNUsy?=
 =?utf-8?B?RTl6TGprdVVQYUFEVUxVa1d3YnI0VThkRnFROWZBZU9yYWcxMWVoU2ZPdnZT?=
 =?utf-8?B?NytlUVltZ1dwbDdvb0NPVHBiU0I0UWFtYlNXdjBTeEtxL2V3dklTVk1ERDNx?=
 =?utf-8?B?a0tidEVSazZEYWVITVRnZzJ2aCtpSDNBRXlsS2JoUURubmFmd3d0c2xSd1dZ?=
 =?utf-8?B?ZzhyWWZEeFRBZitaY21ENUpNVkx3U1o5MzhmY0Z3NTNCSGp4VnIwb2FxRFkr?=
 =?utf-8?B?K1lQMlpvYmk2Z2RYeEx3SzRCYzNURktkS0tvNHhCOEl6Yk80dGk4bHJTSjdn?=
 =?utf-8?B?WmJMdzg3QlMxM1p3aUxVRmVVRnp1UUtPUmpSZVJlbnorakdUaUVmWTg0TlVF?=
 =?utf-8?B?M3dsd3lLN0FxcWpxMjV6d25TV2NrQ053YmRSaktoTlBudkg3OHdTVGs1S1Rm?=
 =?utf-8?B?cHlTU215VWNRbE9kVXlGbktwempDNGorMmJWaDM5Y3hpTFRwVFk5TVR1NVlU?=
 =?utf-8?B?cVM1WkdiMmtXdkZiVEU0RTdlVmFzVHpzWkY2TGRGbjM1L3pmdTZqVVIrZi80?=
 =?utf-8?B?cnk1WDNuTVlOK1NiQXJkNGlTaitYc01yTWRzUUs4R29Yb3ZOTHZPakZpRFBm?=
 =?utf-8?B?T0o5N2cvT3JiaGVYVEZvVFVWcnBpckVtUDV2eDl5MWhFVWdYSFlLa3JrWkVs?=
 =?utf-8?B?WDRDM2wrLzhYd1VmNU5FYkx2M2FmcnN1S3R4cGJscmN6eFA2c0JVYktHNU56?=
 =?utf-8?B?cGJFMm54YXNLN2VQak9jYnh2N0wyU2lxVEJwSjd2d0gzQ1VobnNBKzZRWXNI?=
 =?utf-8?B?aUNjL043RDNweFpjRjRWRWw1UXJmNk9FME9zamlhbmJ6RU1GcTY2Y3kxb29J?=
 =?utf-8?B?QmF1dFlDV0JjRWdCVmRmeFJ0UElqNmxjL2sxdHZvdDNvVjNTMjRGQkwzTi8x?=
 =?utf-8?B?aFZRUndBS1Rpb0JuMWhDWVlwMW1FSHBpQUpNa2lNRld3MDRoQjMzdWswR1Nq?=
 =?utf-8?B?S2JyVzkzS1BYeGxVU2Qxb3JSN1grY0d1QzIza0pIZVhPbEVxaDFVR1lqTSsr?=
 =?utf-8?B?Y0tZVDVmTmZEenZYSmJoMFd4NDZ4anU1TUY3WTRkQW1XWDJjeGM0QU9sa0J5?=
 =?utf-8?B?ZSt1RzV5NWhKN2hadWgxY1N6elNvcE9BaktQWEUrREVkU3RZN3IwR001aXJi?=
 =?utf-8?B?U2t6V015V3E2QnhqWi9Dd0g0ZmV5S0QwREJrMHVwL3hmdElrZ0M2bTNCbm9v?=
 =?utf-8?B?azE4N08yYnZiczVCK0QrR2o3U3luQnJINFFmT3d2ZlRMQUcxSHRVU0hhM3lk?=
 =?utf-8?B?OVJQbDNOb0dUWm9oVHFrVzg4YW10cTFlWHozcmxkcms0Y25TWXR4N1JmdmZX?=
 =?utf-8?B?ZXh1cW8xbm5vU3FvNnd0ektGemNIRVhZWmtjS0RHUGZ2Qi9oOGRQUzRqN3Fj?=
 =?utf-8?B?c3Z3VW8wNHI4RVNPUTF4ZWplREhERU45NCt4UEJLNTEveWJhczlGbjI5ZlNm?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5f7c17-86d6-4046-2fd7-08dca2293b4e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 04:15:15.3592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz18SFnhAye36/Mtv/L8rMSKVwxV7UlJUbHzUOksJ+hd6AYYZ8GgRYNANy9iyNZf0hTw4uO81OKRo5goWn730jtfGscwfGKDWI3q+ElyR1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
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


On 7/11/2024 7:27 AM, Matthew Auld wrote:
> On 11/07/2024 10:18, Akshata Jahagirdar wrote:
>> This test verifies if the main and ccs data are cleared during bo 
>> creation.
>> The motivation to use Kunit instead of IGT is that, although we can 
>> verify
>> whether the data is zero following bo creation,
>> we cannot confirm whether the zero value after bo creation is the 
>> result of
>> our clear function or simply because the initial data present there 
>> was zero.
>
> One idea might be to pre-fill and release some amount of vram at the 
> start of the test. Then maybe spawn a number threads each allocating a 
> bit of vram (also various sizes) in a loop, each time dirtying the 
> pages and ccs before releasing it. There should be some amount of page 
> re-use to catch issues, plus is a lot more nasty with multiple threads 
> and varying sizes. Such a test can also be useful for lnl, just that 
> we use system memory instead of vram. Or maybe we already have 
> something like that?
>
If I am not wrong, think there is an igt testcase xe_evict_ccs which 
exercises similar testcases.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 271 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
>>   drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
>>   3 files changed, 273 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c 
>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 962f6438e219..6538c0e6b57e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -359,3 +359,274 @@ void xe_migrate_sanity_kunit(struct kunit *test)
>>       xe_call_for_each_device(migrate_test_run_device);
>>   }
>>   EXPORT_SYMBOL_IF_KUNIT(xe_migrate_sanity_kunit);
>> +
>> +static struct dma_fence *blt_copy(struct xe_tile *tile,
>> +                struct xe_bo *src_bo, struct xe_bo *dst_bo,
>> +                bool copy_only_ccs, const char *str, struct kunit 
>> *test)
>> +{
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    struct xe_migrate *m = tile->migrate;
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct dma_fence *fence = NULL;
>> +    u64 size = src_bo->size;
>> +    struct xe_res_cursor src_it, dst_it;
>> +    struct ttm_resource *src = src_bo->ttm.resource, *dst = 
>> dst_bo->ttm.resource;
>> +    u64 src_L0_ofs, dst_L0_ofs;
>> +    u32 src_L0_pt, dst_L0_pt;
>> +    u64 src_L0, dst_L0;
>> +    int err;
>> +    bool src_is_vram = mem_type_is_vram(src->mem_type);
>> +    bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>> +
>> +    if (!src_is_vram)
>> +        xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>> +    else
>> +        xe_res_first(src, 0, size, &src_it);
>> +
>> +    if (!dst_is_vram)
>> +        xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
>> +    else
>> +        xe_res_first(dst, 0, size, &dst_it);
>> +
>> +    while (size) {
>> +        u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
>> +        struct xe_sched_job *job;
>> +        struct xe_bb *bb;
>> +        u32 flush_flags = 0;
>> +        u32 update_idx;
>> +        u32 avail_pts = max_mem_transfer_per_pass(xe) / 
>> LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>> +
>> +        src_L0 = xe_migrate_res_sizes(m, &src_it);
>> +        dst_L0 = xe_migrate_res_sizes(m, &dst_it);
>> +
>> +        src_L0 = min(src_L0, dst_L0);
>> +
>> +        batch_size += pte_update_size(m, src_is_vram, src_is_vram, 
>> src, &src_it, &src_L0,
>> +                          &src_L0_ofs, &src_L0_pt, 0, 0,
>> +                          avail_pts);
>> +
>> +        batch_size += pte_update_size(m, dst_is_vram, dst_is_vram, 
>> dst, &dst_it, &src_L0,
>> +                          &dst_L0_ofs, &dst_L0_pt, 0,
>> +                          avail_pts, avail_pts);
>> +
>> +        /* Add copy commands size here */
>> +        batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
>> +            ((xe_device_has_flat_ccs(xe) && copy_only_ccs) ? 
>> EMIT_COPY_CCS_DW : 0);
>> +
>> +        bb = xe_bb_new(gt, batch_size, xe->info.has_usm);
>> +        if (IS_ERR(bb)) {
>> +            err = PTR_ERR(bb);
>> +            goto err_sync;
>> +        }
>> +
>> +        if (src_is_vram)
>> +            xe_res_next(&src_it, src_L0);
>> +        else
>> +            emit_pte(m, bb, src_L0_pt, src_is_vram, false,
>> +                 &src_it, src_L0, src);
>> +
>> +        if (dst_is_vram)
>> +            xe_res_next(&dst_it, src_L0);
>> +        else
>> +            emit_pte(m, bb, dst_L0_pt, dst_is_vram, false,
>> +                 &dst_it, src_L0, dst);
>> +
>> +        bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>> +        update_idx = bb->len;
>> +        if (!copy_only_ccs)
>> +            emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, 
>> XE_PAGE_SIZE);
>> +
>> +        if (copy_only_ccs)
>> +            flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
>> +                    src_is_vram, dst_L0_ofs,
>> +                    dst_is_vram, src_L0, dst_L0_ofs, copy_only_ccs);
>> +
>> +        mutex_lock(&m->job_mutex);
>
> This is not allowed anymore it seems. CI is also complaing about this. 
> See: 50e52592fbe791d96ec2cb431d158cc6bc495be5
>
> Not sure what else has changed.
>
I see. I missed this. Thank you! Will fix this!
>> +
>> +        job = xe_bb_create_migration_job(m->q, bb,
>> +                         xe_migrate_batch_base(m, xe->info.has_usm),
>> +                         update_idx);
>> +        if (IS_ERR(job)) {
>> +            err = PTR_ERR(job);
>> +            goto err;
>> +        }
>> +
>> +        xe_sched_job_add_migrate_flush(job, flush_flags);
>> +
>> +        xe_sched_job_arm(job);
>> +        dma_fence_put(fence);
>> +        fence = dma_fence_get(&job->drm.s_fence->finished);
>> +        xe_sched_job_push(job);
>> +
>> +        dma_fence_put(m->fence);
>> +        m->fence = dma_fence_get(fence);
>> +
>> +        mutex_unlock(&m->job_mutex);
>> +
>> +        xe_bb_free(bb, fence);
>> +        size -= src_L0;
>> +        continue;
>> +
>> +err:
>> +        mutex_unlock(&m->job_mutex);
>> +        xe_bb_free(bb, NULL);
>> +
>> +err_sync:
>> +        if (fence) {
>> +            dma_fence_wait(fence, false);
>> +            dma_fence_put(fence);
>> +        }
>> +        return ERR_PTR(err);
>> +    }
>> +
>> +    return fence;
>> +}
>> +
>> +static void test_clear(struct xe_device *xe, struct xe_tile *tile,
>> +            struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct 
>> kunit *test)
>> +{
>> +    struct dma_fence *fence;
>> +    u64 expected, retval;
>> +
>> +    expected = 0xd0d0d0d0d0d0d0d0;
>> +    xe_map_memset(xe, &sys_bo->vmap, 0, 0xd0, sys_bo->size);
>> +
>> +    fence = blt_copy(tile, sys_bo, vram_bo, false, "Blit copy from 
>> sysmem to vram", test);
>> +    if (!sanity_fence_failed(xe, fence, "Blit copy from sysmem to 
>> vram", test)) {
>> +        retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
>> +        if (retval == expected)
>> +            KUNIT_FAIL(test, "Sanity check failed: VRAM must have 
>> compressed value\n");
>> +    }
>> +    dma_fence_put(fence);
>> +
>> +    fence = blt_copy(tile, vram_bo, sys_bo, false, "Blit copy from 
>> vram to sysmem", test);
>> +    if (!sanity_fence_failed(xe, fence, "Blit copy from vram to 
>> sysmem", test)) {
>> +        retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
>> +        check(retval, expected, "Decompressed value must be equal to 
>> initial value", test);
>> +        retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
>> +        check(retval, expected, "Decompressed value must be equal to 
>> initial value", test);
>> +    }
>> +    dma_fence_put(fence);
>> +
>> +    kunit_info(test, "Clear vram buffer object\n");
>> +    expected = 0x0000000000000000;
>> +    fence = xe_migrate_clear(tile->migrate, vram_bo, 
>> vram_bo->ttm.resource);
>> +
>> +    fence = blt_copy(tile, vram_bo, sys_bo,
>> +                false, "Blit copy from vram to sysmem", test);
>> +    if (!sanity_fence_failed(xe, fence, "Clear main buffer data", 
>> test)) {
>> +        retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
>> +        check(retval, expected, "Clear main buffer first value", test);
>> +        retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
>> +        check(retval, expected, "Clear main buffer last value", test);
>> +    }
>> +    dma_fence_put(fence);
>> +
>> +    fence = blt_copy(tile, vram_bo, sys_bo,
>> +            true, "Blit surf copy from vram to sysmem", test);
>> +    if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", 
>> test)) {
>> +        retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
>> +        check(retval, expected, "Clear ccs data first value", test);
>> +        retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
>> +        check(retval, expected, "Clear ccs data last value", test);
>> +    }
>> +    dma_fence_put(fence);
>> +}
>> +
>> +static void validate_ccs_test_run_tile(struct xe_device *xe, struct 
>> xe_tile *tile, struct kunit *test)
>> +{
>> +    struct xe_bo *sys_bo, *vram_bo;
>> +    unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
>> +    long ret;
>> +
>> +    sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, 
>> DRM_XE_GEM_CPU_CACHING_WC,
>> +            ttm_bo_type_device, XE_BO_FLAG_SYSTEM | 
>> XE_BO_FLAG_NEEDS_CPU_ACCESS);
>> +
>> +    if (IS_ERR(sys_bo)) {
>> +        KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
>> +               PTR_ERR(sys_bo));
>> +        return;
>> +    }
>> +
>> +    xe_bo_lock(sys_bo, false);
>> +    ret = xe_bo_validate(sys_bo, NULL, false);
>> +    if (ret) {
>> +        KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", 
>> ret);
>> +        goto out_unlock;
>
> vram_bo is not initialized here.
>
>> +    }
>> +
>> +    ret = xe_bo_vmap(sys_bo);
>> +    if (ret) {
>> +        KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
>> +        goto out_unlock;
>> +    }
>> +    xe_bo_unlock(sys_bo);
>> +
>> +    vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, 
>> DRM_XE_GEM_CPU_CACHING_WC,
>> +                   ttm_bo_type_device, bo_flags | 
>> XE_BO_FLAG_NEEDS_CPU_ACCESS);
>> +    if (IS_ERR(vram_bo)) {
>> +        KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
>> +               PTR_ERR(vram_bo));
>> +        return;
>
> Missing bo_put?
>
Since, bo creation failed, we don't call bo_put() again.
This is taken care by the xe_bo_create_user() function.
>
>> +    }
>> +
>> +    xe_bo_lock(vram_bo, false);
>> +    ret = xe_bo_validate(vram_bo, NULL, false);
>> +    if (ret) {
>> +        KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
>> +        goto out_unlock;
>> +    }
>> +
>> +    ret = xe_bo_vmap(vram_bo);
>> +    if (ret) {
>> +        KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
>> +        goto out_unlock;
>> +    }
>> +
>> +    test_clear(xe, tile, sys_bo, vram_bo, test);
>> +    xe_bo_unlock(vram_bo);
>> +
>> +    xe_bo_lock(vram_bo, false);
>> +    xe_bo_vunmap(vram_bo);
>> +    xe_bo_unlock(vram_bo);
>> +
>> +    xe_bo_lock(sys_bo, false);
>> +    xe_bo_vunmap(sys_bo);
>> +    xe_bo_unlock(sys_bo);
>> +out_unlock:
>
> There is no unlock here.
Will change it to out_put here.
>> +    xe_bo_put(vram_bo);
>> +    xe_bo_put(sys_bo);
>> +}
>> +
>> +static int validate_ccs_test_run_device(struct xe_device *xe)
>> +{
>> +    struct kunit *test = xe_cur_kunit();
>> +    struct xe_tile *tile;
>> +    int id;
>> +
>> +    if (!xe_device_has_flat_ccs(xe)) {
>> +        kunit_info(test, "Skipping non-flat-ccs device.\n");
>> +        return 0;
>> +    }
>> +
>> +    if (!(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))) {
>> +        kunit_info(test, "Skipping non-xe2 discrete device %s.\n",
>> +               dev_name(xe->drm.dev));
>> +        return 0;
>> +    }
>
> So is there something else for xe2 igpu and ccs?
Yes, so there is another kunit test xe_ccs_migrate_kunit for xe2 igpu
that does data validation for ccs as well.
>> +
>> +    xe_pm_runtime_get(xe);
>> +
>> +    for_each_tile(tile, xe, id)
>> +        validate_ccs_test_run_tile(xe, tile, test);
>> +
>> +    xe_pm_runtime_put(xe);
>> +
>> +    return 0;
>> +}
>> +
>> +void xe_validate_ccs_kunit(struct kunit *test)
>> +{
>> +    xe_call_for_each_device(validate_ccs_test_run_device);
>> +}
>> +EXPORT_SYMBOL_IF_KUNIT(xe_validate_ccs_kunit);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c 
>> b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
>> index eb0d8963419c..49b9ef060ad3 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
>> @@ -9,6 +9,7 @@
>>     static struct kunit_case xe_migrate_tests[] = {
>>       KUNIT_CASE(xe_migrate_sanity_kunit),
>> +    KUNIT_CASE(xe_validate_ccs_kunit),
>>       {}
>>   };
>>   diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.h 
>> b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
>> index 7c645c66824f..dc0ecfdfad39 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
>> @@ -9,5 +9,6 @@
>>   struct kunit;
>>     void xe_migrate_sanity_kunit(struct kunit *test);
>> +void xe_validate_ccs_kunit(struct kunit *test);
>>     #endif
