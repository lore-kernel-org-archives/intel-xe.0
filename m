Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF800D10395
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 23:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792C310E9AD;
	Thu, 24 Oct 2024 23:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1xoeVan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0B810E9AD
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729811808; x=1761347808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Js7yXviismd7zB6PKA5exXkSyJB9F0nKBEqwVeC9MHI=;
 b=c1xoeVanYsSy5CTNpVJvRd/ofpkceOENQ0w0oZYBzuXFRl3TYunmfEgK
 HR+NzLweHzVYTyaHK5k4wGxhAYase5ccwcg1EFWi5RkvwiX6WOmTnXOIQ
 0l9oK8NEM3Gp9MD+pa+9ROvExy7mJhSEjfgHovgGbcmLo7yaYfjtk1+4v
 UZJ7Ecx+FV7f8j6a1sW8nYtuGrnka3tSOwAjW1nQ802JIrfKxgNfNXzJb
 RvSj9Ryi92yYrWEprYl5NxT82FCrBR+PJ1dmkQEj+tdOQF1jxT2kr0enj
 vsvZWLz/RjKfpsi6cDIl+nGygmoUIOxINm87HXS7PdqvJnGaTRfzMGlaZ Q==;
X-CSE-ConnectionGUID: QbiWSUbqS9uj1BCP4283IA==
X-CSE-MsgGUID: OzDyUFnZSqeSSEpG4BF9tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28924874"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="28924874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 16:16:48 -0700
X-CSE-ConnectionGUID: LlaFvssfS02l5CthVni99Q==
X-CSE-MsgGUID: EiTiybyERNm9Oq2eYvth2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="80847810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 16:16:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 16:16:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 16:16:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 16:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcG8xoLqVgZqzmTlmsZ3WrdrqBz7O8PQ+qgxPcQmEkn2DSXAiGXyJxXqQ1c9O6k2SVEd1VAFik02ttDLkUi+LhaIu47YKvMgFacjHyKOdJ3GHo/Lkhwi8E8JYDpro35EcDZk5fhn7hn2vf3wBR52P6JHb4peqtDGibjdIQVzr6MTOiWze9NmCPXO6pWqsRpQTHzZc7aSRCeh4m4ssxAn7NSOFzYCixUKZ8c9J3Bp+yVDy2HtqXh8H+2UfDVf/Sr9grcadNNiFz49naBtY9JCnLmurnVLqJNxUUWSrRzmDnFD60x7WUoyoYTGh7sZep4WrKHP/JF8jMs+jkUcJRgkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ch/cicukkt8716W64oSe6O04gAf3TCzwOdsjcYSJQY=;
 b=wpfUICMfhRNML05RcCjy/9ctbTHrzGfnVTsSj4cIVxYTM24Mp/I07D4sH4teQVkfvKtxN0txpU8hWZJ2BKM0dOlRUHlGUvpNjYBxZ57rgWgncobW3B7bEQLCLqhcXEecHodJ/JrVg/jinNG1F9gbxtupgElFPJLmFaf5tOfDeAjRBbVyCkALNYCmc9u+p0r1N8g3OT/SOwgGyCVgJ+dhDgqsWTgUO48cdA2axdPwuq/Vq7TtgBOn4YDPHge/M+eVWEs0Mlgl4z/OXQa7ASe/0ItnfflA+g3Z6XTBrdO8Y+murGsG/LD8ktQzusdB4gu9JzIWKdzvcnk0aHOJADN36w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 23:16:43 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%7]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 23:16:43 +0000
Message-ID: <1c4c3c04-6f04-4f7d-aaaa-9f0bf5ecee47@intel.com>
Date: Thu, 24 Oct 2024 16:16:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-3-vinay.belgaumkar@intel.com>
 <66bd2fdb-3f25-4177-bf73-fb786643e5d2@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <66bd2fdb-3f25-4177-bf73-fb786643e5d2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::14) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: e56f7130-ec51-423b-c573-08dcf481ec4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEIyRGNVLzlwbXVnV2tpNFZWQmlIMGlwWkZMM2g5a1ptR01XQlZnZVFXejh3?=
 =?utf-8?B?dW0rV1RLZEhJbncvbFVoZnBNYUo4UTRUQ2pxaVU1V09FQWNIZzlBdWV6cVVn?=
 =?utf-8?B?L2p6bWE0NFZHc1k3ZTAyK2VrWjZiR21WQVFnTmhQbGlwSVNKZnA0T0ZLKzRo?=
 =?utf-8?B?bE5yektxWTd1S0ZhMlRyVGpHL25HZlBZN2V2eDdUVjNMSmtnZ0FGQlJySmJh?=
 =?utf-8?B?UHE0VXN4My9yWlVpZjcvRlloR3dUbWVQVmEzSGIrSnNTRDdoTU9rNnQ5YkxE?=
 =?utf-8?B?aXFEQnR6WHgzVVRTcU5sUnQ0WDYrb3FQeVdVTU82NEpvY2FOdzlOQlZ3bnFu?=
 =?utf-8?B?LzFuU0FBRkp4ZmJOTXUwVmtnbEdIbnF6OUx0MlpuVHY3SktvMWMrajUxWTZk?=
 =?utf-8?B?dmpTelYrdnpNZHdweERyNFdscVRiWUFlVHRVMFB3Lys0SUN2cGpGM3UyT2dh?=
 =?utf-8?B?SkM0QXN6VEtoVkxMeU1VRnNWM1c0M1laMWF3SEdaZWJNc3lrdDlscTFyK2Za?=
 =?utf-8?B?eFdYdGtVc25DWWw3cXVsUWZxR0lKNXVvS21YblQ2Ui9uRXVRVEd5MEFEbkFp?=
 =?utf-8?B?K3V1elBPZXVtY0xZL3RPeXpwci91c052eHNBZDdMb09QMnhWYXgwTlVTY24w?=
 =?utf-8?B?aURzcTlSNHJmNDdyNUtuNWZZc1RWbmJlNmlhVnowUXFSRG9xVTVocDlxemZp?=
 =?utf-8?B?Tk9uSmFyeXpyNXhWeTFVSWkzNmtKd0Y5dHV5bGw1NUlFTDV1NU9PdG92YjEx?=
 =?utf-8?B?VGt6WXpJanoybXh3S3dKV2cySDBreENzQmlJd3NsKzc2TVR1ekN2RzFnOHp2?=
 =?utf-8?B?a08zdzZObFkyUlkrSlVJOEkwTml4ZkdJWFh1KzdoWHcvZXhVeWRHQWtDYkdH?=
 =?utf-8?B?R0ltQnhzWE9ORVMydHljb3VVUXVlaVNkK0RxbjZiaU9mbThKWmJrclp0R2Fr?=
 =?utf-8?B?YlNJZkFaWWdpNG5QeGpDTFRYT0Nyc051SjM5T0hpbVhJMU9xNlg2N1h3RE1v?=
 =?utf-8?B?NHZKOEw1WmU1Y0ZHUTM1bHAxOU1lV2laaTUyQlRxR0tvMU5EOWRCNVlPWkY1?=
 =?utf-8?B?dlpuNng1RERzVWR0TklhK3lRcWtOV0VRMi80TlM2ZWxyVmd5ZVVNTElQVjda?=
 =?utf-8?B?WXV1bWV4MklTZW9VZU56cWxKdzk1eG92N1lpS3NLcWJpQnFCV2l2dU55MGxs?=
 =?utf-8?B?SmR5bTNnbHNmbGtkQXkyVnJsbnNlNTl3TzBWY2ZWdDlLaVY5MWVhOUZHUDY2?=
 =?utf-8?B?cmFqWDFkUEsxbkVqendFOFdrZlM0T2wwRllzcHAraXI0c2tPaWdlcUpSeFh0?=
 =?utf-8?B?VWNoWlNuYVVzV2NVeUV1NDZtL1kvbFVkT1FublB5WVJjQ2c3ajd0Tm9EQ2NO?=
 =?utf-8?B?WG9GenpYNVQybm5GaVpyWWNmL1lRS3ZsbjNrN09zWU5QTWU3M0RmWjhOc2kz?=
 =?utf-8?B?L0RNSFFMUWdMSkR0QjVKVnhNOEwvWHRsa1p4d3paQ3BLa2owelIrT3hWWUJS?=
 =?utf-8?B?by83K1RnemFwK2tCZXNScHR4VElVNHJNTDVuaDVJbFRYQ090bHRxK3lVVHIz?=
 =?utf-8?B?am9sdithQkowSFR1dHE3V0tUME5YTjJNeDduVlJiZkRTNzFUa1JjaUhXVGt5?=
 =?utf-8?B?SVd6Q1RTbFdEV0VJOFNJWWNBT3ZNWHcwa3RFdlVKYk54dlNDcWRVakV0Zmpi?=
 =?utf-8?B?YmFZc1lTVEIxcXdJRGlpZWJ5RGJCckViVG9YcitQN214cU1MSlRNNFJ3REpI?=
 =?utf-8?Q?wCMPnCOKgS8311hBRe0Monx56EJNDv+/SqXDA62?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2UwRmtwOTNDckJETUZGMFlVc2Z3MTdCZS9SYUdsZUNON1EzT1BaeGVxWWFB?=
 =?utf-8?B?REc2TUFGbnF1dlRiV3U0UlcyWmM5b05CRjQ3SktkMXRqVEg5U01HL0ExSzZV?=
 =?utf-8?B?bTI3YWh2L3I5TVIyNlVmMXpXVHBsdU4wTGwrcG1jakRNaUdVOWVHTHBxUjZL?=
 =?utf-8?B?N0pPRDJtSC9QdlJZSXJhaXkxcmRNeHhxSDcxY3B0bWpISXlCbCtIMXhnL3Zz?=
 =?utf-8?B?dy9NWjJQZzJMRXZDckdHbmFscmJHa1B3UlFJY1dmbXcwTHhpVWZWNlFTUnk5?=
 =?utf-8?B?S1ZYTkY0YW15SDVYVHBSZWQvdWh1RTVSWCtiSVRsU0F0c0w0U2NQb2RubU1W?=
 =?utf-8?B?MzlQSmNpeTNrSW5WRm5OL3pQYVFxTnhROUFYYzlEL0c2UkgwQXRtc3B2dVRB?=
 =?utf-8?B?QVlGVmNTcDRXN20xa1FNREYzMDhoekY2dUwzc1FBY25TR1hiK1Q4T2RTVlQr?=
 =?utf-8?B?STJ6ZzVLMGhSbkl5ZExMZUtHcGovTWtYVFRuZFlCTFNYb3FMRGpsanhvUmEw?=
 =?utf-8?B?dUtrdjJZbVVXaUlEWFdCVll3Ritrc0NSaC9zbGkrRkYrODZTS3JBMDBSQ0Mw?=
 =?utf-8?B?WE1kUjBtTnNSWVFFLzV6ZllFMjcyR0xIR1YrNVViZGhGTUY5RU9qcUFTMElq?=
 =?utf-8?B?eEpoUTZSMUlFRndTaHNMV0ZaM3F4blpPUXBlR1JBWlNkblMzcm11Mjk4R1Zh?=
 =?utf-8?B?QnlnalY1VGZmV3RuK2hUaFZZWTRlY3hyUEhBMG9Gc25vNzltQmgrYWNwbXRW?=
 =?utf-8?B?QTlqUGl2OG16My9JT0kyUm1CMFZ5VFM2YTY5VEo5NWRhY081MElWRHQzWjE5?=
 =?utf-8?B?c0pMU2U4eUtRZXUzWTRtdTVSdm9scjlRVGs3Z1ZlL0JlOGYzY0pVUmpXWENL?=
 =?utf-8?B?a0JqZjBiRHJVbHk4aVBZQ3BUYjR2eTErZlUreVAxMnBIWVlnMnpFT3cydktH?=
 =?utf-8?B?aStJemVuaUtXa1ExRng3MnpkT2txelRYZ0dHcTlYcERRY1NLdms1UEtEbUZP?=
 =?utf-8?B?SlZCVTZJcXh0b293OWE1RUdFdGZrY25qVkpUbGNTNzVocUVRVFNwTWJKZE8z?=
 =?utf-8?B?amIzYVVFenhKMTZKNnMreU55M0lrT2N1RTZmVEtEcm5UcHB1a1orYnQyT1JD?=
 =?utf-8?B?VEQ4THlrVVdSR1psK05TTkdCYUQ5MEp5c2pwY0xUbkNuWGF5bHdwSFh3RzVJ?=
 =?utf-8?B?YlNPaHhJTXdHV0ZVT01SRmNpd0J3UG5NbkZoZnlNeG1TbzRpaTRFL0gzaFZm?=
 =?utf-8?B?ZEh6K3RpMXpvTnloQm1nQ01OL2ZtVURqUmJPQkd4NGJaRW92MmJGcUxBYjhM?=
 =?utf-8?B?MDJuT3BCOE5ncVJ4UlFEVkhEc2IyZlVqblNKZTA0VnN0WmR3bmlCOHhEemwz?=
 =?utf-8?B?QVZ5Q2d4VUlvczhDeWkycmN0NDFWSzVjUlZxMUJySVZkUWRJQTlad21mVWZq?=
 =?utf-8?B?ajBrcHl5N3JDTWpLMnY5SWM1aXhmeTd2MlM0dXFuVkRZdEttc2RPWTlJN0x6?=
 =?utf-8?B?M0wzN2ZieUwxbzI0dWJYUEtGNGcrMFNaRGM1bUt6NjNhSDFTZ2VZejlUdTBM?=
 =?utf-8?B?blZQenlmMHRFZjdxTUxWRStZSFl3bWlXaGNPd09iSThZSUFHL1pPRUR5dXFB?=
 =?utf-8?B?YlFLUWt1SWJvUmVmenM1WkY5Umo2UndrOFV1aTE5VkJ6ZlRzQ0g0TC9NR3Na?=
 =?utf-8?B?bEhQRmUvV3M1OEliVGc3K0tGK3FYNFRhVDNKOFQrb2NZKzdGQjVFeElSUE9t?=
 =?utf-8?B?SGRtVWl2KzZCdmNJRnBuY3pvWnM0c0l4Ky9meG1Wa3hrM242YTYvVWxhR1Rx?=
 =?utf-8?B?bHNvVW1XOXhHRnp5WEl3eXBZK0NoR29vT3NjTjZDMit6ckpud2dZRkJHRWZq?=
 =?utf-8?B?UG54MzVGdmRuSFZoeDZtMWFxNUczR1dmbHJydUpKQURjbTMzRFd3bWtFQm9j?=
 =?utf-8?B?VExSaVZyd0gxT1YzL2FBZ2JOQ0ZXZXdkWWNjVGt2TXNhQUdTY2FLYTBaNmFm?=
 =?utf-8?B?MHpuRktxVVpGR3JTbGY1Z0hXNWhVSWQwdFluc0hnOVVkSjlFSWx6MWJmMEdU?=
 =?utf-8?B?dEFXLzNMNWt0UFZjdUs1RmxvcysxRjJ0QUg3L1g1WXpyblNodmNaZjVVeWQ5?=
 =?utf-8?B?a1B4VndZWHJDQm9IYkpyTE4xSHN2c2dYSTByc3dWWW9TYWFwUWFyMUdGLzBZ?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e56f7130-ec51-423b-c573-08dcf481ec4f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:16:43.3568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvmwBU9HUy9sI74uYuKI22FO0rqVHA9JOjZkQ1DoH1pYMXSxmdCeUX0Kw3p2CA+e/8CBI8omGqqtCTLeldp3ZXblIZIWxy5qkgXOjHdPw1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
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


On 9/30/2024 2:35 AM, Riana Tauro wrote:
> Hi Vinay
>
> On 9/27/2024 5:53 AM, Vinay Belgaumkar wrote:
>> Provide a PMU interface for GT C6 residency counters. The implementation
>> is ported over from the i915 PMU code. Residency is provided in units of
>> ms(similar to sysfs entry - 
>> /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>
>> Following PMU events are being added-
>>
>>>> perf list | grep rc6
>>
>>    xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
>>    xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]
>>
>> v2: Checkpatch fix, move timer code to next patch
>> v3: Fix kunit issue
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c   |  20 ++--
>>   drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 172 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  58 ++++++++++
>>   include/uapi/drm/xe_drm.h         |   4 +
>>   7 files changed, 253 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 9b0218109647..7a190c49c573 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -872,6 +872,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>         xe_gt_idle_disable_pg(gt);
>>   +    xe_pmu_suspend(gt);
>> +
>>       xe_gt_disable_host_l2_vram(gt);
>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 531924b6c0a1..e0a12ac7387c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -277,18 +277,26 @@ static ssize_t idle_status_show(struct device 
>> *dev,
>>   }
>>   static DEVICE_ATTR_RO(idle_status);
>>   -static ssize_t idle_residency_ms_show(struct device *dev,
>> -                      struct device_attribute *attr, char *buff)
>> +u64 xe_gt_idle_residency(struct xe_gt *gt)
>>   {
>> -    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>       struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>       u64 residency;
>>   -    xe_pm_runtime_get(pc_to_xe(pc));
>> +    xe_pm_runtime_get(xe);
>>       residency = gtidle->idle_residency(pc);
>> -    xe_pm_runtime_put(pc_to_xe(pc));
>> +    xe_pm_runtime_put(xe);
>> +
>> +    return get_residency_ms(gtidle, residency);
>> +}
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +                      struct device_attribute *attr, char *buff)
>> +{
>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>>   -    return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, 
>> residency));
>> +    return sysfs_emit(buff, "%llu\n", 
>> xe_gt_idle_residency(gtidle_to_gt(gtidle)));
>>   }
>>   static DEVICE_ATTR_RO(idle_residency_ms);
>>   diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 4455a6501cb0..887791f653ac 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>> +u64 xe_gt_idle_residency(struct xe_gt *gt);
> idle_residency_ms?
it already calls get_residency_ms. Not sure if we want to duplicate the 
name? I can add that info in the function doc.
>>     #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index bdaea9ca1065..b1b38d245e00 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -11,10 +11,15 @@
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_mmio.h"
>>   #include "xe_macros.h"
>> +#include "xe_module.h"
>>   #include "xe_pm.h"
>>   +#define FREQUENCY 200
>> +
>>   static cpumask_t xe_pmu_cpumask;
>>   static unsigned int xe_pmu_target_cpu = -1;
>>   @@ -35,6 +40,11 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    *
>>    */
>>   +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>>   static unsigned int config_gt_id(const u64 config)
>>   {
>>       return config >> __XE_PMU_GT_SHIFT;
>> @@ -45,6 +55,35 @@ static u64 config_counter(const u64 config)
>>       return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>   }
>>   +static unsigned int other_bit(const u64 config)
>> +{
>> +    unsigned int val;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_RC6_RESIDENCY:
>> +        val = __XE_PMU_RC6_RESIDENCY_ENABLED;
>> +        break;
>> +    default:
>> +        /*
>> +         * Events that do not require sampling, or tracking state
>> +         * transitions between enabled and disabled can be ignored.
>> +         */
>> +        return -1;
>> +    }
>> +
>> +    return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>> +}
>> +
>> +static unsigned int config_bit(const u64 config)
>> +{
>> +    return other_bit(config);
>> +}
>> +
>> +static unsigned int event_bit(struct perf_event *event)
>> +{
>> +    return config_bit(event->attr.config);
>> +}
>> +
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>       struct xe_device *xe =
>> @@ -64,6 +103,10 @@ config_status(struct xe_device *xe, u64 config)
>>           return -ENOENT;
>>         switch (config_counter(config)) {
>> +    case XE_PMU_RC6_RESIDENCY:
>> +        if (xe->info.skip_guc_pc)
>> +            return -ENODEV;
>> +        break;
>>       default:
>>           return -ENOENT;
>>       }
>> @@ -110,6 +153,63 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>       return 0;
>>   }
>>   +static inline s64 ktime_since_raw(const ktime_t kt)
>> +{
>> +    return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int 
>> sample)
>> +{
>> +    return pmu->event_sample[gt_id][sample].cur;
>> +}
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 
>> val)
>> +{
>> +    pmu->event_sample[gt_id][sample].cur = val;
>> +}
>> +
>> +static u64 get_rc6(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    const unsigned int gt_id = gt->info.id;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    bool device_awake;
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>> +    if (device_awake) {
>> +        val = xe_gt_idle_residency(gt);
>> +        xe_pm_runtime_put(xe);
>> +    }
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (device_awake) {
>> +        store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
>> +    } else {
>> +        /*
>> +         * We think we are runtime suspended.
>> +         *
>> +         * Report the delta from when the device was suspended to now,
>> +         * on top of the last known real value, as the approximated RC6
>> +         * counter value.
>> +         */
>> +        val = ktime_since_raw(pmu->sleep_last[gt_id]);
>> +        val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
>> +    }
>> +
>> +    if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
>> +        val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
>> +    else
>> +        store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>>   static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>       struct xe_device *xe =
>> @@ -120,6 +220,9 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event)
>>       u64 val = 0;
>>         switch (config_counter(config)) {
>> +    case XE_PMU_RC6_RESIDENCY:
>> +        val = get_rc6(gt);
>> +        break;
>>       default:
>>           drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>       }
>> @@ -151,6 +254,28 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>     static void xe_pmu_enable(struct perf_event *event)
>>   {
>> +    struct xe_pmu *pmu = event_to_pmu(event);
>> +    const unsigned int bit = event_bit(event);
>> +    unsigned long flags;
>> +
>> +    if (bit == -1)
>> +        goto update;
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    /*
>> +     * Update the bitmask of enabled events and increment
>> +     * the event reference counter.
>> +     */
>> +    BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>> +    XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +    XE_WARN_ON(pmu->enable_count[bit] == ~0);
>> +
>> +    pmu->enable |= BIT(bit);
>> +    pmu->enable_count[bit]++;
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +update:
>>       /*
>>        * Store the current counter value so we can report the correct 
>> delta
>>        * for all listeners. Even when the event was already enabled 
>> and has
>> @@ -277,6 +402,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>           const char *name;
>>           const char *unit;
>>       } events[] = {
>> +        __event(0, "rc6-residency", "ms"),
>>       };
>>         struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -465,6 +591,32 @@ static void xe_pmu_unregister_cpuhp_state(struct 
>> xe_pmu *pmu)
>>       cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>>   }
>>   +static void store_rc6_residency(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
>> +             xe_gt_idle_residency(gt));
>> +    pmu->sleep_last[gt->info.id] = ktime_get_raw();
>> +}
>> +
>> +/**
>> + * xe_pmu_suspend() - Save residency count before suspend
>> + */
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->base.event_init)
>> +        return;
>> +
>> +    spin_lock_irq(&pmu->lock);
>> +    store_rc6_residency(gt);
>> +    spin_unlock_irq(&pmu->lock);
>> +}
>> +
>>   /**
>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>    */
>> @@ -492,6 +644,24 @@ void xe_pmu_unregister(void *arg)
>>       free_event_attributes(pmu);
>>   }
>>   +static void init_rc6(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    unsigned int j;
>> +
>> +    for_each_gt(gt, xe, j) {
>> +        xe_pm_runtime_get(xe);
>> +        u64 val = xe_gt_idle_residency(gt);
>> +
>> +        store_sample(pmu, j, __XE_SAMPLE_RC6, val);
>> +        store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
>> +                 val);
>> +        pmu->sleep_last[j] = ktime_get_raw();
>> +        xe_pm_runtime_put(xe);
>> +    }
>> +}
>> +
>>   /**
>>    * xe_pmu_register() - Define basic PMU properties for Xe and add 
>> event callbacks.
>>    *
>> @@ -525,6 +695,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>       if (!pmu->events_attr_group.attrs)
>>           goto err_name;
>>   +    init_rc6(pmu);
>> +
>>       pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>                       GFP_KERNEL);
>>       if (!pmu->base.attr_groups)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index d07e5dfdfec0..17f5a8d7d45c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>>   void xe_pmu_exit(void);
>>   void xe_pmu_register(struct xe_pmu *pmu);
>>   void xe_pmu_unregister(void *arg);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>>   #else
>>   static inline int xe_pmu_init(void) { return 0; }
>>   static inline void xe_pmu_exit(void) {}
>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>   static inline void xe_pmu_unregister(void *arg) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>   #endif
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index ca0e7cbe2081..1213d2a73492 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -11,11 +11,34 @@
>>   #include <uapi/drm/xe_drm.h>
>>     enum {
>> +    __XE_SAMPLE_RC6,
>> +    __XE_SAMPLE_RC6_LAST_REPORTED,
>>       __XE_NUM_PMU_SAMPLERS
>>   };
>>     #define XE_PMU_MAX_GT 2
>>   +/*
>> + * Non-engine events that we need to track enabled-disabled 
>> transition and
>> + * current state.
>> + */
>> +enum xe_pmu_tracked_events {
>> +    __XE_PMU_RC6_RESIDENCY_ENABLED,
>> +    __XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>> +};
>> +
>> +/*
>> + * How many different events we track in the global PMU mask.
>> + *
>> + * It is also used to know to needed number of event reference 
>> counters.
>> + */
>> +#define XE_PMU_MASK_BITS \
>> +    (XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>> +
>> +struct xe_pmu_sample {
>> +    u64 cur;
>> +};
> Is struct required? Next patch also doesn't add anything under this
>> +
>>   struct xe_pmu {
>>       /**
>>        * @cpuhp: Struct used for CPU hotplug handling.
>> @@ -58,6 +81,41 @@ struct xe_pmu {
>>        * @pmu_attr: Memory block holding device attributes.
>>        */
>>       void *pmu_attr;
>> +
>> +    /**
>> +     * @enable: Bitmask of specific enabled events.
>> +     *
>> +     * For some events we need to track their state and do some 
>> internal
>> +     * house keeping.
>> +     *
>> +     * Each engine event sampler type and event listed in enum
>> +     * i915_pmu_tracked_events gets a bit in this field.
>> +     *
>> +     * Low bits are engine samplers and other events continue from 
>> there.
>> +     */
>> +    u32 enable;
>> +
>> +    /**
>> +     * @enable_count: Reference counts for the enabled events.
> %s/counts/count or counter
ok.
>> +     *
>> +     * Array indices are mapped in the same way as bits in the 
>> @enable field
>> +     * and they are used to control sampling on/off when multiple 
>> clients
>> +     * are using the PMU API.
>> +     */
>> +    unsigned int enable_count[XE_PMU_MASK_BITS];
>> +    /**
>> +     * @sample: Current and previous (raw) counters for sampling 
>> events.
>> +     *
>> +     * These counters are updated from the i915 PMU sampling timer.
>> +     *
>> +     * Only global counters are held here, while the per-engine ones 
>> are in
>> +     * struct intel_engine_cs.
>> +     */
>> +    struct xe_pmu_sample 
>> event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @sleep_last: Last time GT parked for RC6 estimation.
>> +     */
>> +    ktime_t sleep_last[XE_PMU_MAX_GT];
>>   };
>>     #endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 2c5f258eee3a..3ef3926551dd 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1396,6 +1396,10 @@ struct drm_xe_wait_user_fence {
>>     #define ___XE_PMU_OTHER(gt, x) \
>>       (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
>> +
>> +#define XE_PMU_RC6_RESIDENCY __XE_PMU_OTHER(0)
>> +#define __XE_PMU_RC6_RESIDENCY(gt) ___XE_PMU_OTHER(gt, 0)
> Do we need both of this in the uapi file.?
> We can have only XE_PMU_RC6_RESIDENCY(gt) and use
>
> switch (config_counter(config)) {
>     case XE_PMU_RC6_RESIDENCY(0)

I think this was done for backward compatibility in i915 code where we 
wanted to support single GT systems. I guess we don't need that anymore 
for Xe driver. In any case, I will be removing this uapi for now based 
on Lucas's comments.

Thanks,

Vinay.

>
> Thanks,
> Riana
>>     /**
>>    * enum drm_xe_observation_type - Observation stream types
