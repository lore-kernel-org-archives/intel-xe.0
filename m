Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BE7CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 21:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F1810EB7E;
	Fri,  7 Nov 2025 21:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLogvyDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5569310EB7E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762550470; x=1794086470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q/Q1P9tqAjWxHYUaqx5VapA+G7DOyTpnUa95WA1oUBg=;
 b=PLogvyDJVZ9VORvCV1F3G/kQuAi8dGDbjOLEyWkxdfaK3wJZN8xG38iG
 ukNgQINVKk3SoL6NLaC9DUTIcD90x5gp1Heb8FtZ5PIhxsrckMnEov3lC
 5uI26GtEXZL4WtPjeABVWl22imB/I2m0OZJxErgN125LWj8bZfHRjpERm
 Nkec3IQr6PtWvOhQnlwdVA92t7AEEoRKrlMzTCKpvtsgwao9dMzpL0psY
 1rbcS90KvT609RkLIZ8QVkErwJnJO1H7NPeWG0XPt356oIL0rYCNXNZsu
 FXCvpIamRU7E3NWA6412vUzVcr1RArHnJHlEvZWAkSZ0mku64WYEEWkid A==;
X-CSE-ConnectionGUID: ridzQUNQTKiyGuaur46c3g==
X-CSE-MsgGUID: R5O02titR4C0cXkU2xOuyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75817342"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="75817342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:21:09 -0800
X-CSE-ConnectionGUID: HOTQsP2SS+qhTZKJ/w4v5Q==
X-CSE-MsgGUID: N2IFqxMvRC+nIKQ8qhMCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="192490550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:21:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:21:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 13:21:08 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:21:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hweTbPZc7H9F2zXFysPty0xQ8XF5s7mQQvlqRPtRbppOP4eSYzaqOXbhdfeGOa2wzvbXQK7P9VDEmU9LykKpb0Xoe33cgUG5yrljyp41N60iKUcRvSuKcDHdA1o5uFfVzOJnT1SZ0AadBXEg7tL5UhHasVupU/SRh2RwhYqy+pgCUuYyzoYPsZxmHRLmOtNovT6ypfi566NdT9SuBOBfyRe7bAF3o37/nNmZUzjUOu4aDAlJv5ePda5E//wRlnaQQ4cRT4oaMViAMNsKWKX+VrGWB9O82+wbjFIAV3O+x/1a7owDff7qcoO4O4wPw8MdIAVY37xWLy3JHUqsySSXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8RtKcvlNnmuJ10S6jAF6ERy0wfARmnyRL0+tl5uFI8=;
 b=Xs4gN4UE3X4bJJc2LY5C1gRmY3zSgprirXZ2BX9LgsNebTa8t9cfjrDmjxNwC2C1+9aWKf/46qVh5ukxOJa+wpYrgybVweZkbigtGdYvua5J+XZCs+vrJ7E5V4lDWk8EjK2GuoAgtuhOAQg7Fb3zDYoprnuHJneUFsIcdWfbbfEkK7q+5Albd1XOTYq/fAZrEgy97XwsZgNjHEE1+SGkwEuEKtxGZ4OCsYm8QzxyBkaMdwStjkXwG1JGA+7UI+PKDvbMJNdK0KxL2tP/VtdWOXh/nG6MfxTWlZ14+SuReTaPBheQVnoWm6OJpFZcP4BimlxPwT9IoFNnM1bDWWZO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB9476.namprd11.prod.outlook.com (2603:10b6:8:266::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 21:21:06 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 21:21:06 +0000
Date: Fri, 7 Nov 2025 22:21:03 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe: Move VRAM MM debugfs creation to tile level
Message-ID: <20251107212103.bop2aqbtprsr747q@intel.com>
References: <20251105165905.3509314-1-piotr.piorkowski@intel.com>
 <280d1a68c928607f9c045ae7042f157c728622ec.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <280d1a68c928607f9c045ae7042f157c728622ec.camel@intel.com>
X-ClientProxiedBy: VI1PR07CA0244.eurprd07.prod.outlook.com
 (2603:10a6:802:58::47) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1e6c46-e039-42b6-1cb4-08de1e439034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVBkaVc3LzlVV3E2V2FEYlNoUkxUbktIK2FLSnRvSGtrRS8yNHUwbnV3NUpW?=
 =?utf-8?B?d1pRYTVNanRsd09oSjlMdnR4enU4dy9VdXU2OTJ3QkcyUVpxenYxSFIzWVFH?=
 =?utf-8?B?T3V1TCtHRk5DNndpazY5d2NYRk42YjIwM0xLMTZPcVpiZG5OaTBDZDFHV0Qx?=
 =?utf-8?B?amc3QVZCelVlbEZqRHJzaHREYk0wZW84dFZmT0dQQjVkMjlaaC9ta2J0eFpn?=
 =?utf-8?B?SFFEVjgzSGtoRlo0UVpGY3Rsc2FncDN1bUJnc0hPSVVWMWRGdW03b0Q4UUlv?=
 =?utf-8?B?YlAxRWxlb1ZjcHVBOE53WWNCZFkvUm4zUUgzcVZpUUhjMmwvdHlVRytzb1Mw?=
 =?utf-8?B?RW5ZL2gyaVNBNjU1WVpRN2JhMjZyTnpkaE53V2JjV2hRYjRDZ0F0bGpyTzZD?=
 =?utf-8?B?cjRoUjFNT01jWitPNEt6eUdJR0Y3WThFTDI5Qm5NMGRjaVVnOC8yUkFnUzJq?=
 =?utf-8?B?NkFaWE5VUFVPN2FBOUtoU1grMGFVRVdDV2w5dUgrdGZEeTR2UitRSVQ2d2o1?=
 =?utf-8?B?aUR1Y09OVXUwTlh6Wkp2NXBaVTYyWkhyM3VqeWpXYUFheEhRWWRuVWlucldQ?=
 =?utf-8?B?NXZINWtraGNDeGdtd04xVENoSlRROGM4OUJEYkxMZzdKaFFYVVZkMzVFL0Zz?=
 =?utf-8?B?M25hblB2Umk3aWFrWUJGeHNwdmttd1NiYUY5dTdTK0lUV0VveGFKU3JFdHVj?=
 =?utf-8?B?cjJ6VVMyNUFaako2NFRHSUwyM0RvMXEwcVYxMGFCcFg3R2w4czZpaGR3TUtX?=
 =?utf-8?B?MnBiM25KRHNzQVF5a1RSQXhicFdkZnRLalJINDViTkFRa2J0ZUpLR2F0ZFJE?=
 =?utf-8?B?Uy8yek5KYVlUOHNEL0s3S1VyV25nNGlPQjl4NzFOR1lOaDRTR1h0bXBhZkl0?=
 =?utf-8?B?K2dIdW1kQmRoK044QXNYb0tXWkxXamh0dzFwMTJrb2xyaForWDlIVHJEelRs?=
 =?utf-8?B?c214MmhZRlRNZUxpVTBxS0lKWnA0anFxd0FJMEN0TnpldDhRZ0VjcG1OMzI3?=
 =?utf-8?B?aHd5cGlJUWdxL3oyalFvWTJtNDFlekUxY1NzVy9taWU3SG05cDZKdGxob05R?=
 =?utf-8?B?M1Jmbytyc0JJUlB5TnJtTjAxeTZHVXNOT0x2UURnRWd3bnZqOCtzVk9oVVl6?=
 =?utf-8?B?VHdJcUZNejNaYUVRTHlOdFpwRjZhQ3ViMXpTY09zbFVVZkxSVkNlOS9SMSts?=
 =?utf-8?B?R3RpNWNTZjloNVpjMnJsV3VUb3NzTVNjMUN1Y2pRS1hlYXlFSFJJMnllK282?=
 =?utf-8?B?OXlxNGNsOVdWeklCSWQySGRMR2J5Y3EvQVA3QXh1OTN5VWh0dCtRQ3NRMEl4?=
 =?utf-8?B?VlNSTEhOVGgxT0s4bXl4UXg0a3UzNVNTc3pGMkwxZkJzLzAzZE03MjFPa3NW?=
 =?utf-8?B?SzBYUUdnRWE3MkdTRm4wTENGYW83dHA4a3NnSE5HdDllbmlieGRlR0tsZ3RQ?=
 =?utf-8?B?aVQ3VTNkeVRVUHlSWmpGWXcvOW5nUEM5Q2pFLzBaYmQyb3l5NVQwalIrNXlw?=
 =?utf-8?B?aUl4MUduNU5iYmVmRHpVQ2xOWkZNelgxeitjMTFTRytqU1c1ZVBMc3dyV0tU?=
 =?utf-8?B?NnlySlJ1Y0J6UmpvZktBYzRFYWpJT2VVQ1JGV1ROZzJWS2lMbk9KbG5YMkdC?=
 =?utf-8?B?Z1N6cEVmT3VOTG9mV1J3ZW5BZTNKUjBPNmIyWkJnWEdwN3hjK3Awd0FoUWF0?=
 =?utf-8?B?djIzQnZjY0FnNzBpamIrQjNCM3FGSnVWY0dnbXd1Z0lWVnZuYnFWY3hMWmY3?=
 =?utf-8?B?b1MySnhaZ1B4UGF2bzREZmRKTWxGWnRmQmxxSkZsaGFVK0RkQU5XeEdoRmR3?=
 =?utf-8?B?K203RWxrMjFqNzJLd201UTloVURLVitpUk5mNjlVSSt1MHk2ZnZueVBHTk96?=
 =?utf-8?B?RDY3ejcwVkZtMnp4aVJnT1lsYjRlbllxaC9yRVBuYUw3a281ek8rL1RlYWh0?=
 =?utf-8?Q?O232xja5oLArk64RZMrwtveG4sDrcvm7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0x2ZFk0Y1ZWOW5hTU9KeGFmSkg2MGNRWWNIcndlQmVPU0c5SEppQ1FsTTdX?=
 =?utf-8?B?WTB0NGtWTVRWMlFMaHdDbituQzQ0TVpMbVFQSmNTeXdramVmcVkzZDVySlc1?=
 =?utf-8?B?WG1SRCtHZHJORkR6TURwZzdlc3BTVmNTTXpuR255bGd1Q28wNlJWVW9kSWUv?=
 =?utf-8?B?cDRiS2RjM1ZvT0x2WEhTS0YwSUcwK2NQMGkyMnVvbklNU0FvWE9SaU44ZzJp?=
 =?utf-8?B?eTFMN3E1a2x3aTBpMmVHdWlNRllySytDT0wzMXR5RnMrbHQyTENFMExTT2hV?=
 =?utf-8?B?TzVZZk5CUUs1OVFhL1c2VXMyVytWWmZMTVZzR1dSTlRQSy9uR21XOXdEOVBn?=
 =?utf-8?B?OTZnM0NyM1oxRkoxZHkzVDNaaFUvOUQwdGd6ZkU2ekZFVUJEdTZaU0F0VEZh?=
 =?utf-8?B?WVVnSXZldFJCRVFkTEFuWWF1RkRqV3pVSVhncmVaN3NpSk5vMXNqRkk5MHVD?=
 =?utf-8?B?T2pSWDNqN0lhMVh4WkI4dHVYeXR1cUNWRnJSbTh0TUt2eE1GQzNQVUhmUkVx?=
 =?utf-8?B?NElYRkZ2U3dPYjZJOVlHNml0bmRuWWxwcEtuT1Q5OXV2dGNZM3ltT3JVaHBU?=
 =?utf-8?B?d3poSUpsVXJhNjdjWlEreHN1bUUxb0luQnQ2MmQzK1pBT21DcFk5c2REaUZX?=
 =?utf-8?B?Ym5IeWZxTTc3NzhTaU9xTTR2SmJMWG40WUdTUG5tSmwxOXBRMUFoVThJOFhk?=
 =?utf-8?B?dkNNL1liK1dBVDQyMGJrSDRuQzRsQXlyR0E5MHJDMzZra0R2R0NZSFJKbE1k?=
 =?utf-8?B?K1dSR2l6akx2LzRPS0NBVFZHOEFzWTNTdm84eFdRVlJraVFYa2dpT2s2MlZ1?=
 =?utf-8?B?Q3FtSnVCMDFObTVOT3I1RlUvYXFuanlEWW1kVWw1R1NYSEpobjcrNzF4ejJr?=
 =?utf-8?B?aGM5WlR4NFh3cG5qVThPdFcybkFDU2NDMC9UWnBrc1hLUlBLQyt1bEpaMWFD?=
 =?utf-8?B?dkU1SllYRDZaeWw2SHhmSHlXejVBaDArT1ZJVENPdHRhN0hZYnJLZkRPVXBV?=
 =?utf-8?B?UklRTHIySjlnYlowUEpQVDZqY25ualBQM2dXTDRjbit4V3JDc3RQclFpY1Fo?=
 =?utf-8?B?QkdldUpVY2JPeWNmdDJ4Z0VnZVA1czdPUmY2aS8xNHJrV0psZ093SXRRaFBQ?=
 =?utf-8?B?TjJpN3R6N20yOHNDY1pTZUlPNUxmdm5DTjIzUUppY0tiTGNTYWxHME9TcXd6?=
 =?utf-8?B?dStjUVdQODltVTJDajg5N3I5eVZJWjFqMnRHZHlrYXhMOWt5T3pyejF3aHpK?=
 =?utf-8?B?VlNQUFo4allWWjlXT3dZTjFSMnIwR1luTVFxNEVaeHh1NXVMZWJaeXM5TW9u?=
 =?utf-8?B?d1ZpVzMyU2ZZR2JUc3Q3RS9nV3NtQStNbzRMYWIwS2k1eHZSNW9sbnZ3bG01?=
 =?utf-8?B?dFU5NUlWc0FpYnNKeDlvUmNpUzRHd243eHhreFBHVnZnS01XY1BGMUhaRk1Y?=
 =?utf-8?B?UldVRVpza3RhV1RwZWdKR0FBSThBU0VNRll3MzBpV3MwMnJDOWx5c0RldUYr?=
 =?utf-8?B?MFdNTW9zRGpPSktPVVFGUkJ5UzBqOFI0ditxczE3akR3ZFFxaHZmNFhLWXpw?=
 =?utf-8?B?RXVmektPeUJibjJXWGhPanlObmJQTDQ4eWJzdERKSTc2ZFpXQmxCenBwbjNC?=
 =?utf-8?B?NE5tUDd4RldlREdjcG5NSG0zYS8vOUU2NUFHNXNNSmY4RUpqcHBFcDVjMU9C?=
 =?utf-8?B?dEx5Q2VJa09jaGNyenVwSVpGVDdLZlpDZk1aUlo2cVFkYzV2ZFVIQWQxT1dz?=
 =?utf-8?B?eFBGQTNzbEFEVHpRK1h3QnBUaG5OUGhaMlk5bjAwdzNIaERLekI1QVg5WHZF?=
 =?utf-8?B?K3ZXbTlmQUZnV0Nudyt4bU5QNVYxVG9qSW9kWGtLNUIyTk1YQ29rYktMY29h?=
 =?utf-8?B?ZDdTQ0FzbXlzMnJrWVZXanhEa09yNDhoa0ZzemM0Y0tjeXkzM1oyei9SdkhF?=
 =?utf-8?B?aHFCRWhCTW5Ybm83WFB2ZHdjeE5sWTZWcml1V29Makdic254LytDT3N4QVNH?=
 =?utf-8?B?b3FKUm9hTmpobmZjMzdBTndvR2c0SzNUblg0MmNnTE1mLzFITXNORkpVeURi?=
 =?utf-8?B?bnZ5VVVOSHk0dHZlTTdhREFFVUhzcnNzRkpuajB6TFdQK1M1MU9MQ2FianNJ?=
 =?utf-8?B?d2pROGtVczFjcG5IVHVQbUJUQk42aWd5UDdBKzBaczhMR2tlNXZtc081bEFn?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1e6c46-e039-42b6-1cb4-08de1e439034
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:21:06.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZY4PnAqkPLeJMH5EpnzyFlyI8uQPwY1OVj5htZQw4411N60zGhzqlOzW5PqXTdzMbTTDumiLmn7QR1Qn//frq8wAq/8CAL5iAPXpokj2DRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9476
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

Summers, Stuart <stuart.summers@intel.com> wrote on czw [2025-lis-06 00:16:33 +0100]:
> On Wed, 2025-11-05 at 17:59 +0100, Piórkowski, Piotr wrote:
> > > > > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > > > 
> > > > > Previously, VRAM TTM resource manager debugfs entries (vram0_mm
> > > > > / > > > vram1_mm)
> > > > > were created globally in the XE debugfs root directory. But > >
> > > > > > technically,
> > > > > each tile has an associated VRAM TTM manager, which it can own.
> > > > > Let's create VRAM memory manager debugfs entries directly under
> > > > > > > each > tile's
> > > > > debugfs directory for better alignment with the per-tile memory
> > > > > > > > layout.
> > > > > 
> > > > > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> I agree this makes more sense.
> 
> I do see the debugfs IGT seems to be hard coded though which is causing
> BAT to fail.
> 
> With that fixed:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Hey, I already have the appropriate patch for IGT ready, but I will send it next Wednesday
(due to the long weekend in Poland).

Thanks for review!
Piotr

> 
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_debugfs.c      | 12 ------------
> > > > >  drivers/gpu/drm/xe/xe_tile_debugfs.c |  9 +++++++++
> > > > >  2 files changed, 9 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c > > >
> > > > > b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > index e91da9589c5f..8ac78e560d28 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > @@ -375,7 +375,6 @@ void xe_debugfs_register(struct xe_device
> > > > > *xe)
> > > > >         struct ttm_resource_manager *man;
> > > > >         struct xe_tile *tile;
> > > > >         struct xe_gt *gt;
> > > > > -       u32 mem_type;
> > > > >         u8 tile_id;
> > > > >         u8 id;
> > > > >  
> > > > > @@ -403,17 +402,6 @@ void xe_debugfs_register(struct xe_device
> > > > > *xe)
> > > > >         debugfs_create_file("disable_late_binding", 0600, root,
> > > > > xe,
> > > > >                             &disable_late_binding_fops);
> > > > >  
> > > > > -       for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; >
> > > > > > > ++mem_type) {
> > > > > -               man = ttm_manager_type(bdev, mem_type);
> > > > > -
> > > > > -               if (man) {
> > > > > -                       char name[16];
> > > > > -
> > > > > -                       snprintf(name, sizeof(name),
> > > > > "vram%d_mm", > > > mem_type - XE_PL_VRAM0);
> > > > > -
> > > > >                        ttm_resource_manager_create_debugfs(man,
> > > > > > > > root, name);
> > > > > -               }
> > > > > -       }
> > > > > -
> > > > >         man = ttm_manager_type(bdev, XE_PL_TT);
> > > > >         ttm_resource_manager_create_debugfs(man, root,
> > > > > "gtt_mm");
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c > > >
> > > > > b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> > > > > index fff242a5ae56..b4a1929535da 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> > > > > @@ -110,6 +110,13 @@ static const struct drm_info_list > > >
> > > > > vf_safe_debugfs_list[] = {
> > > > >         { "sa_info", .show = xe_tile_debugfs_show_with_rpm,
> > > > > .data = > > > sa_info },
> > > > >  };
> > > > >  
> > > > > +static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
> > > > > +{
> > > > > +       if (tile->mem.vram)
> > > > > +               ttm_resource_manager_create_debugfs(&tile-
> > > > > >mem.vram> > ->> ttm.manager, tile->debugfs,
> > > > > +                                                   "vram_mm");
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * xe_tile_debugfs_register - Register tile's debugfs
> > > > > attributes
> > > > >   * @tile: the &xe_tile to register
> > > > > @@ -139,4 +146,6 @@ void xe_tile_debugfs_register(struct
> > > > > xe_tile > > > *tile)
> > > > >         drm_debugfs_create_files(vf_safe_debugfs_list,
> > > > >                                 
> > > > > ARRAY_SIZE(vf_safe_debugfs_list),
> > > > >                                  tile->debugfs, minor);
> > > > > +
> > > > > +       tile_debugfs_create_vram_mm(tile);
> > > > >  }
> 

-- 
