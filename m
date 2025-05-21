Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B4C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 18:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730410E729;
	Wed, 21 May 2025 18:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvCDKNBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A1310E729
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747851147; x=1779387147;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J0H2vYlsZXubdYaCSyERig/ue/9chr28wsd5RBvhPkg=;
 b=JvCDKNBQTmPGsiEaJkMe0qjBMjBLAWzponV9ArWAl+4WxHGaa+Lv0ebg
 rXIrFDDu23v0k+8SmtEQJwMFDTkO+SdtrmyxdvDr8GDdryXz+UDzrp4bo
 QWSEJCnzUXG8WSMVhbgjeX7wUR9cydSU+ZPZNAdZgMqge2XvQZPgmpAQd
 kKsRzlVaKaaYYyuqcGQeDi50R5Lz/N5fWGptrG/QEev+l4ldMQNvUKsfD
 Qo9TcdQYniYiurmQkqZBzXq/FBsW+RUjNn5Uvp37wzFEBtdOm883tQMq1
 7d+cdh1iDt09I1ATslP7NQoqHIgGDlL2vL/sk16Lo8sF8gj7mIe2DZFoc Q==;
X-CSE-ConnectionGUID: kAwUeCPVQQ++auG19h6pdQ==
X-CSE-MsgGUID: +UvCVkz5QVeDGtoQxfuO2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60895066"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="60895066"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 11:12:25 -0700
X-CSE-ConnectionGUID: 7Vy+Fd+uSIStYyQbet0vMw==
X-CSE-MsgGUID: 3yb2UZHUTeuEP7qZNO7D2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="145163507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 11:12:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 11:12:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 11:12:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 11:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEApHb7RbxIgPmlJad5VMjLjn8BDS5MP5SF5iRBfDJdlE8Ynyp3O7xPs7JdIjWdfMxTebGBuR7ltaTResrCgYpEyFHiHbrbk2JQQP9Dck76gQokwRzA6MGnULj4zVluLAYbnuLns6I91szx7cJgHEDeMt+15kOBrXjbRIFjUp8nNLd5hITDSFV5IvS4cpNKlSLRkote45/lZKsS8mnMktF//SG+pnbrxqEa1n/ZrnD13ktG04WJW+8VT/K4WGQ2uu35iiQraChAcLzZh/4gMEnFEWcKd9mxo6rSPmmEWUMv+zurM8NVsmProza9Dfa/20wcVd2HwJ9Y02VPmL553ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDfdiI8QdMLjoWsobtNLgt74o3hnvyOvr2nKENFARKg=;
 b=aB+vMDREnpcVz/DtIrNZGN/VfrdOo2oUZbgZgOX+2W/p9ZBhth3t/2lUdxKNASdXLJ/me/nEGd1TkM7CldfEzsYIgjQDtZ6ssEgYBpXRR8+GynOZFilibd1Ua5EjHAEb6s8JMdaM6OlvrWVdBrB/VIvJ0Ljqu475WD05AaTwYBbdStAZRosMRcufirUEhonNAYWlPlecBnH6INjrrwx6XdfRUO3oXooHwyDL6AHDdqx629dIecTixR/MaZv4CmSXIqh5cAQYDy/o+NBqnEmXmALDwwbGrVLLDnGDbT3gGFvYwQz/GgNZR7vfcMBTvf8GA5U3NBm/2/PC5Eb4k2W0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Wed, 21 May 2025 18:12:22 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 18:12:22 +0000
Message-ID: <04ea69b6-3dbc-4f50-8f9d-d80ac5856556@intel.com>
Date: Wed, 21 May 2025 11:12:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add missing documentation of rpa_freq
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250521165146.39616-3-rodrigo.vivi@intel.com>
 <20250521165146.39616-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250521165146.39616-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 222816c8-d0da-43ce-d878-08dd9893082a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0tGSnpFRzRCY1A3OC9EMUdyaWRLVWYrM2hWcStCL0tiZSt5T2RZYlljQzdP?=
 =?utf-8?B?UmFqRDJBSk9jOWw0dTlKZzNZbFFXMXp3OHB3QjVpKzQwamp2aU1KWk9yRDlS?=
 =?utf-8?B?M2dmOFRuOW1WODdINmpxZmZ3MGgvT0xzNHRoY2M1LzFuTjhhU1V5Nit0YmU1?=
 =?utf-8?B?cHJMUjJlR21PSmxITzVmLy92Vk1sTEVNUDN6UVRydDZKMTNxSTNrZWxPdUox?=
 =?utf-8?B?YWp6MXNuQmZIY1liYlhDQkpBZkRqYzJIWmtEVXkzcDJNVGhLUWxKNlN6NEwv?=
 =?utf-8?B?WkM3aGgvRTVsNXlJbGgzQlAwa25YNFY1UW5FVm5YZVp1UUFQR1JybnFIQ0ll?=
 =?utf-8?B?TzlOOWpkenNUTXRPQVFBenlSb2JpTmZqdGlvQUhSRW9XSy9OSGxzZFhZMnZV?=
 =?utf-8?B?dGdzMDBYck1zYVE0dTQ0TXk0TjlnMHBkU3BUVzBpMVg3Vnc4S0NMOG5tZHJa?=
 =?utf-8?B?b1dHajlHTE9rZkpTV1paZ3RmbkxNY2x4ZnVFcUJJQVAyaHRBR3oxVmRZTGEr?=
 =?utf-8?B?T3VWWXlzVWhVMmdrOU9nZ2JPNGxuUGRXZUdSc3hBM3JsM1hnaEtYbVFaZktC?=
 =?utf-8?B?YWNiMzB6dEgwdFVkazdWS1NFK3NGYnRyRjNPS0JjemJJQmtKcDZqandZeGwy?=
 =?utf-8?B?bUJSQnZJSFpINmdoYzdETjh5RmcwcVZ5QWNDR1BBZnZtMmJPRXFzVGl1dGpY?=
 =?utf-8?B?MzNJb2JwR1ZtRU5QQmxTOVZPOEw3cm9LamZCQTl2N3dUNVR3Qk5CY0VIZ1lF?=
 =?utf-8?B?aHV4MjNaVUhZdFEyYko3MTNsQ2l4SVR0Qm5LNXVVWmN4SFh5NzRERm1WNjJr?=
 =?utf-8?B?U1NSd2I1Y3V6bUg3VUJWdzBReTUrVThFWTJOd3Q4bVhKNmxZeFEvRGFRZE91?=
 =?utf-8?B?eFRkRjB6UlA1QkJRZTNmM05mSW0zejhLWldnNytibnVtUENKeGc5VEJtUWZP?=
 =?utf-8?B?M1ErWHU2WEVlNlNYaGo5ZXVLcUU0K3pObGZBdjJCdVhFQ1RZVXl5SXNNOWF0?=
 =?utf-8?B?eGpCempPOGRsMG50MnU5MnVoeEJzSEJjTndQUDd2S1M5ZmFvMzBGK3lieXJm?=
 =?utf-8?B?L3RROEExbjVlSFRTU2RXUHRudWdaWTlpNzlKZmh1SEl2aWkxeUdPazZ1c1Bz?=
 =?utf-8?B?QzVNbWtoRVRrZFoyRkNZTlR5VkZFTkpsNWJ0MmZNTDNyU1dadDFscktwd2NP?=
 =?utf-8?B?SkNPRWVmTUxERXNDU2hTVy9aajhNUkhnTmJtVlhGaDMwcXdNb3FrcHo1MEM5?=
 =?utf-8?B?b3Y1UkcrK2svUGhXWkI0RTVER2dtOXVSU2NDSDVET0trM3I3TStsYmdtNEhK?=
 =?utf-8?B?SmIyZDMzQWRNV21hSzNVYlMrMXhMYzBzQnBmV2g4UkFsTXBIY1k4Ty92L0NQ?=
 =?utf-8?B?dWVoUk9yalJ4M3RJUnhWMzAyc3VUaDhwbzlOaDcxSVVHbWluekxkNnZVOFo2?=
 =?utf-8?B?VEg0RU4ybUEyelZ6Ump5VjE1ekcwdFprM2x4cWhUZlFBN0VjdlFCYzBtU2dK?=
 =?utf-8?B?aURVRzBlTHhKQW44eE80cjBsdmpES3gyTDFlNzNGQXQ5RWppZlliY0pxSGd2?=
 =?utf-8?B?S2R5MFk2TGNJOEVsM256bENBeU1ocURPSHR0SHN5WUhQekdCb2NzV2xVT0Vj?=
 =?utf-8?B?ZENjaHA3ZkRrQjZ2OGxLVnhSODFwLyt2a0Q4dWd5WGF2NlNFak9VRDZ5bUJv?=
 =?utf-8?B?azJBc1lDTm4xVjI0ampqUTJKVVZXNXowaGRaK2hnTWZCdDQ1b1V5ajdodUVO?=
 =?utf-8?B?a1RGSlpENmhXRnZ5WWJob1RtV0Z1R0hLWko4d01RNUZOTlI3ZGJLb1o3UjhI?=
 =?utf-8?B?emdwZ1docllsQk1Qc2x3eFNtQWxZcTNwNGdJWG9wc2xTZGdlSmUyWUppN3Yx?=
 =?utf-8?B?SGZzVjBlaDltanNCOStHZXp0T2FHNnkyMkZXYURnbVFHT2NGTzdpQjhmM0Fk?=
 =?utf-8?Q?PVlltosqtj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlFNV2c4N3lKUFdpT0llSkxGOEdmY1J6UUFZZWVWVWNvWFBKT2J2bmdOYnN3?=
 =?utf-8?B?TGttMUV2Ris4Ti9ZUURxSGtLenRUVjNiV3VXNHJ6TmhTOEswQlhWVVE5VVpF?=
 =?utf-8?B?bXZxeGpDWS9tNG5TcldTZVcyaE92OGdQNkFZSzlmdFNWQXhvaC9QZG5WZkhr?=
 =?utf-8?B?UVptUDQ1WGJmQmdHdHgxUGpGMWpxcUwxeUsyb0pSWXB5QWVhMDlJV1dDK1M5?=
 =?utf-8?B?dy9BdDdvWmRyVC9rM0VBQlJVMzE3N0tka3hHVTJZam1SMHZkU2xSbGRmQlpj?=
 =?utf-8?B?UmxMUTgwYlJBdFBENm9CSzZQVjVDMERFVVdXbFl4NUplRUluVHFKQXJOZk4x?=
 =?utf-8?B?RjMycERtZGRZayt5UWlaTHVBOVFKWVFsSGllV09uNW9acm5ycU9aWlZvdnZv?=
 =?utf-8?B?OWlQSU51aWUrajd6SVkvUTFoQTNaa1ZKUitWMEtySFVibjl2ZVpRSEdsY0tB?=
 =?utf-8?B?MHNwT3o0bDRJRUdrNzJERlh4L3lWbDdlenkzOVEvalg2NWZzRDEvVjdJeEdB?=
 =?utf-8?B?U2JTQUtIbDl2Z1N2RHhsSHY5eUZmVktQNU1QaXp5c09xWENnanlTN212R1pK?=
 =?utf-8?B?dEdRYVk3cFptK3BEMFpGR2VJMW1OZWxTYmhlbGQ0OEpmZUdUTDlhM0RERzdX?=
 =?utf-8?B?dEFTMzNwYXhuMTJLNFd5Zjl2QkhQdS8rUEhBcjdtWlExbmE0NVZrZUFSTkZ2?=
 =?utf-8?B?VmlFQTRSeFZYR3dzdDk0enlmRnJqMThJN01uTmoxMHNrYjRRNDhvZmdkNXU0?=
 =?utf-8?B?YmVud1dwTnhzVWF6NHRhaGp2Q3RiR01HOGxSSnFmZ2lseGk5NWZLUWo0ckY3?=
 =?utf-8?B?clNHb0dDb1NtcFdiZzE4Y3UyNmFlY1B2VlFhZHF6U2RqcUlvcWhCY3F5N2lV?=
 =?utf-8?B?c3NDYWJ1TmlGM2tFM2ovQzU0YldnUVJJS3hCZmJEUW9EL3hQeWtUVi9XMUVz?=
 =?utf-8?B?T1BNWVN3RTBXSEtFakQxbzRhUEEwbUhqZzN1ZzlsS0V6WUVvWVdxbkxEMFlo?=
 =?utf-8?B?Q1BuZGUralJEOG8xRGpLNGlZVTZUSjZsR05XblY0dlBRQ29zdDFMV0ZMS3ZG?=
 =?utf-8?B?VTFKMlJZVmJ4cHBHTm8vWUpxZ2VhRWN2Ui9HTEFLaGRyRGhaeWxVSHYrK0Y3?=
 =?utf-8?B?UnNKN1lBMVVZcHlIUEZXNkRvWmQ2cURObENlNFc5VDdheUQrVzFOTi9qSEhC?=
 =?utf-8?B?bzF4RnNvSlBnS09EOU5WSG1DdU5WRHY1d0ZKUjAvU3JuSGZubDlENVIzZVla?=
 =?utf-8?B?Q0J5ZUIrYkxPdGVRWkNnbXBiakI1MXpqdHFraVpKZ2xhcXNsRUhVYVgyWEVR?=
 =?utf-8?B?Y2JHQTdxOVlmUzN5eUgwVjZjVjdzL0RIMVF3alVvaHg0NG4rNVR0VEl6SDNz?=
 =?utf-8?B?dk0rb2hNeWFQRnhqQUZVSkFYcDZTYk9UZmRMak1LM3JTQXRHS3JmR1BKK0JZ?=
 =?utf-8?B?bmZqV0FUWmlvcVBJekYrQ251RkVqL1BSQzJJWjlqQXdJQnRmSGkzd2Qza1Rx?=
 =?utf-8?B?ODl0VzU5WlYvNGhlOFprRnl6RXg5Nk5XaC9vV2l2dEhhL1Axa0IwRFVnQ2ky?=
 =?utf-8?B?U2FVanhqVEpRK01LdFh3aWM0eVNzMDM2Zjc3Q0xqWFpUTmNoOWxnWW1EOEFK?=
 =?utf-8?B?dkNaYzNvNEN6cnREbkk0VjNxNFk0OEtrS3RmQTlObmVvdGxFOERRZU5WbU10?=
 =?utf-8?B?SlMyVDRnZjVQdlg2c1VKdDkraDUreURvSGhNUXllMDVWL0o5UTN6RXk3dlBB?=
 =?utf-8?B?TGJLNzNMS1NEaG13TjBXUWh5Tm0xNm5wcjNFN0NWdEpGNVZZMGt5QUNJTG5y?=
 =?utf-8?B?OEtEdkNlM3I3b0ZQb0FVY1VJZlg4eXB2aXdRdmFSbWNMcHhwQnR5RU5pRnE4?=
 =?utf-8?B?dFQyTkhkWlVnMkRtN2hDQytXbURHdklrNmdZVWNaeWZYVHZUM3lBNjJ6QVA0?=
 =?utf-8?B?Z3h3aElpNXRJeHJYeGlLVk10TElmVTErU3h2b21xZXl4TEtZRk80eEVUbnBB?=
 =?utf-8?B?aHUxWEdocmNyVjlWMDNZdHhNVWtiMVJvRnNPQVVlNjJGVEtYazJJRTF4bENs?=
 =?utf-8?B?bEh6SE9rN3BGRUVlWHUrRFdTTnQ2RnkzT2wzVjF4Vm9oQ0VSZEtCc3BlTzBm?=
 =?utf-8?B?TStNc0RrK0J2Wkg1dGFkUS8yRzhKbzNxYmdLb2YrdTdHR1ZNdEpqci93OExR?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 222816c8-d0da-43ce-d878-08dd9893082a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 18:12:22.4066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w91aaIKkTUvFxWNpF8l/2DpzRXBgzX1un0GwZnqSeFJL8IV+NMdHhqfHO3FkL+AkVv1r2I9RflHNxJUVj9jKkBGtHPNT5splu6NkamSBv9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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


On 5/21/2025 9:51 AM, Rodrigo Vivi wrote:
> While at it, already adjust the rpe_freq frequency, to highlight
> that both are calculated by PCODE at runtime.
>
> Fixes: c6aac2fa77a3 ("drm/xe: Introduce the RPa information")
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 3293d89f1386..60d9354e7dbf 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -36,7 +36,10 @@
>    * - act_freq: The actual resolved frequency decided by PCODE.
>    * - cur_freq: The current one requested by GuC PC to the PCODE.
>    * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
> + *   Calculated by PCODE at runtime based on multiple running conditions
>    * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + *   Calculated by PCODE at runtime based on multiple running conditions

Nit: Do we need full stop at the end of these sentences?

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>    * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>    *
>    * device/tile#/gt#/freq0/<item>_freq *read-write* files:
