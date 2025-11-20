Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6104CFA446
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 21:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634AB10E073;
	Thu, 20 Nov 2025 21:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llIjlHyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B6610E073
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 21:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763675592; x=1795211592;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=efVI0KKEag9ARm4Dmv9nkVswUbjtbDILXovBbZ8Uc7Y=;
 b=llIjlHylEnQMnBbk2wqDTrnFGYZqDh+4BibMyELEJixJP466E5W1C/Hh
 NPDRm+0mSGAGQ0khvR8jmrmzLzQRWfpy7KouIPm71jGayf0u9+wf8M9cC
 YXei2jAGZjc7MwB6x07e5zOPnhcwB1bXLIV+PAmh0M6I4UM3m7eWYXmyr
 xb/IyCUcKGqGZ4oPI57xfCEJ7bgxwE2XajiyWb+Z2kk0nYCysCXRVsSIw
 gnKbWwSvUCZN702Rev/VgxwD1Wh7iAMxRH9+juqWu7Zvk1phaiSigHItz
 IBNtarnnUihwTTSeJZrPhL9jhpJjE6PfTjo2CP2yl8gKa1qANrCkhp2oY g==;
X-CSE-ConnectionGUID: HSq8wCXYSZyc2SEktHsBqw==
X-CSE-MsgGUID: fMZrnRCYQmOyYDbZXm77IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69378369"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="69378369"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:53:12 -0800
X-CSE-ConnectionGUID: 0zntHApFR7GhhfuLcBddRg==
X-CSE-MsgGUID: G/4CQsCSQLyqELViygmAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="222436418"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:53:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:53:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:53:09 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:53:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn/PNaUN4Pq1XebB3uxM6Riyyx7vn361lgID3XWXAcTGFIFTi4tyo94JRGpuYLkbzDUBOhAI633tL9RcaWCMm5MMewtpV4+uekbZN4UnSIpAQbYOByI6hu1E15g5yjhiAMnoxsLjnQH0/67Hkb7K1Guc2TRnTtG1gOblLVB8iiV/yCUnqdf9cus8gEt3ZRvQwq765LBxxjWu3IZbIPlOzDJVx3BhiJerPNydci70Eh4CAax7FOiOrddbyixy9uTLpeMDS9qZ57/Q1K6BklYJxhzHLq+HUp40S10zWB9QTd18U3nkVHn2E28gbb2hKIqFGbjjy6p5X4EtVDmFkm063g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHuXZspVZQYPl67wsoVdA1H+avDWFp1TOLe9Q1Ah/QI=;
 b=YuHG3WlesIztYOqYBDa+PvsU/hfLyWaBtLs7UxyJq82P55v8ztye8m/hW6jdMi+V2Q6VS9kmlBoY9sOTapKknAPiOlhrqY/OTVFa0NB3rdb+AWCiuJgGvXpcoQ3hCm0d1y7/O6mr4SijJa6ucHsKUmn4eBWmxI0qEVEh2f9X41hS86o9Elo4CdKxIs0tdqzhOrNsdc6ctNdzEsl0hguKXPjx8LwXEVlkWUlHazD2+zAM4mVMP1GdBpPhuGKa6cOoK4uu0QnUMN8lACsoWbF0l6VH873lYLQ/gtIbAf1KJNhrDhJs3Y5xZ4K1IgTtncEP1jjQ+ms0sVazOsQKnxLTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 21:53:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 21:53:07 +0000
Message-ID: <49e4f27e-a921-458b-ac2e-d8e38d715de3@intel.com>
Date: Thu, 20 Nov 2025 22:53:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
 <20251120145157.6995-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251120145157.6995-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0288.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: afb08f84-e973-454d-17d0-08de287f303d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czJmaS85Z2p6N0dzWDZuZ3hxbW9scUxQRWVQSEN0U3JtMDNlNS9RenZGT3ND?=
 =?utf-8?B?OUlxUENDdDJWa2RNclh1M09yQVhHUlppWHdITkJXT2JDeU50aXlSdFBtWTdU?=
 =?utf-8?B?cngyanBPUjVyanBKaDEydEx2Z1l6RDNFOXpwUkdYaDVwdmFCM1hqQTNIYWhT?=
 =?utf-8?B?clJGdkU0cm51M1hOTmFLVFQvSWZOeWE0Z2lkSjFBWGFvKzkwOWVUYXkvbXhI?=
 =?utf-8?B?Q0dtemdaK1NYYzZKdjgwM1BFVUh4NHRvblpHbFB2MG13TkpnZWFlTkJJSlFm?=
 =?utf-8?B?Qnc5TElzMWdTRFpKaXdvSlNJVnlTZkh5RU8xR3dJcDUxcVVPMnVFU09rNDdW?=
 =?utf-8?B?WWhVYndsWDJwN3dBNlNzaXZ3dmJRa2g3NjZMWmhwS0ZQNHdEOTZoRHVSa3hw?=
 =?utf-8?B?TlhTTEJRYWE1eEtIZ2JZQWFGRXJaVURHNkI3eGVQT1VOQmxxNkExMFlZOGJ4?=
 =?utf-8?B?TURRYXRrYzBlZlU4dzZMS203TVM0MVVlL2lJcEpLYVdyUjNSSGV5c2xvb2dZ?=
 =?utf-8?B?WURRRFpRdlVZc3ZrWFo1VGJtSzRsd2JOYXY3UkhnRVppOGMwbjZEdll6dW83?=
 =?utf-8?B?KzRJcmpiRDBJTnFvVGxxTTkrVGtDdXRNOUFPQ3V1SGRaYmU5Nmh4SkFyaXpj?=
 =?utf-8?B?c241UU1ialRhOEExek5xeWtwRDIvVUdqMU5kSnlnNFpXOUwyTFkzK0lqeC91?=
 =?utf-8?B?M1pCMEw2OWJMRXRBMkt5bzRLaVZtazlNdy91aU1nVEVTNXlUUlk3bi9vUFlF?=
 =?utf-8?B?cUFSWnA1SHJaTmNvTXZ1akZ4Qmh6QzNYMnNzbmlMYlovQ0pzc2xoMVJlajln?=
 =?utf-8?B?R1NoeU8xYlBuVlFQd3NlS2NGT1JZa0xSdGRla2FxenNhMkNVWTQwNE5XN3Yx?=
 =?utf-8?B?R3l2T2FacmRITDN3amRHbm9hTVA4dWFVenp3b2VXTDlNdkh5U1BGdU5hNWhP?=
 =?utf-8?B?MHo2ai80YkRQSTBOc1I2eG0zYzd2UTNYQW1XY1hrVHplYWlPY1hCSmt0V0xX?=
 =?utf-8?B?Y0E0WVN1YTU1dFNUanNHb2hxSmVadlF2WUZLUHBwL3lPWW5ZN3BnejlnN2ta?=
 =?utf-8?B?dTJ6ZGhCbW42a3NWWmdvb1RrcHhncFBaeStNV0ZNaE1hWWtQVUtmOG1HVjVZ?=
 =?utf-8?B?RGZIL1NWTjJrcXR6NTJYZ0lwaERBSUpUdWhLd2kxRnNVNERjOXVOT1QrUm9i?=
 =?utf-8?B?clltbXpuZHpDMjQxdDU3bElkajhTaDEyWFZyUGpkdGY0eStHQmNNNERFV0E2?=
 =?utf-8?B?NXFLaGdKdlBTT2tpU2hMSzNyMC81NDhRZUNkMGJ1b3pUN0lUS1RQZ3drMjJW?=
 =?utf-8?B?c3BiVVFmcFNPQVlhQnkreWdTdEVUSk1seDBrbjFRWlNBRnRjRmYrckRPWnBy?=
 =?utf-8?B?aGQxa0ZCUGRQdS9SbUhxbzdkWkZ2N1FmRzFnOXRnd2JSOVJaaS9Uc0h5OVZ4?=
 =?utf-8?B?Smk1ai9zVTc1cFljMDArdUVGZnByNWNzdk1nTXl3MnBnbklsQmJBZ2RuelJY?=
 =?utf-8?B?TVB6TnhYT1RsYk5WOXJSUDFmMktraTFxbk0yeEExNitZcWdtdGZsR1ZDNUw5?=
 =?utf-8?B?bG5FdXJqdW1jY0xhblV1bkFqTDhuaXgzY0dpZVJkM09ERFJGanZZT1RHSFNY?=
 =?utf-8?B?MzFsWUtDSVFmeVd2S01acnBYTkdNdm4yc3ZkdGFTYkE3MnpKNXRRajY1TVhk?=
 =?utf-8?B?VkFHRHpoVFZ4akFjSTZjV1kxRkEvM05yWUxiUDdxRHBOb3AzNTRDcTJtMU9k?=
 =?utf-8?B?RTg2TEtoamVwSUI2elNDRVVLMXUrMnlsR0pPdFRQZThhckgwOFVYcGtibzRz?=
 =?utf-8?B?dTNmMTJCQU9Wc1pWRlVrN0lUU3ZtTlNYMExvY2tmM1FzWnFGRjhUMStZajhV?=
 =?utf-8?B?aUZHRmtiMVZDYlRycmVyUXdmc2tOWE1ZVlVXZE5BTmNZUDMvYWdvVVVRay9z?=
 =?utf-8?Q?ZKFGJSmwr4epEmU/XhZJjw+OUSl32ugl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVMTXlXcE9CRmdhQmYzcS9YMTVEaGYzMSs4TXlWb0FKd1BwOUxubnByR0pv?=
 =?utf-8?B?K01xR28wSTZOekNsY0FidHpnRDAxdDMvV1R1V3EwQ2R1VzBTdi9RUjRmVkhq?=
 =?utf-8?B?MitiZHpjcEppNTgzMWhLN3NJajByNlBoSUI3ZFRRUVVackRnei9CUGFsMTdW?=
 =?utf-8?B?bC9FMWNncjE0dlEvNmFqMXNrVmZLT3dDQWFwcnpqR2NjTHRNZmJnbVdTVVVr?=
 =?utf-8?B?VEJRd2QzTEozS0JiOUp1SCtIOEFUTXpWMzFmdmg4dDR4UWZvekFFUFdObkxR?=
 =?utf-8?B?YThYYmEvTEl1NEhNSGUxclNrZjVucnhUS0JsVUZ6V3RBNGFxQTM0aGQ1U2Q5?=
 =?utf-8?B?VWNVSXE1R2ZWMGNxRm0vK2NmMktPdVVRRWNkblFMRlJLTmNtZU9aWGZQQ2xO?=
 =?utf-8?B?U2NoZkhzcWFuWU1ubll0bWE3SXRsRmV6ZGs1SUhFWXU2ek1yWmhvY0piVVpn?=
 =?utf-8?B?VFVLeXB2a3lxY0FlOWlMVWtpUWlYeFFFTmhJdzZSdk1GMXRsazZkK052aXRK?=
 =?utf-8?B?ZW1UeWtTbUs3RVRpTUZTNWRQRG50azFqbXJ0d24zTUJmcmtHWHA3Z0VvMHNF?=
 =?utf-8?B?TDdTQWVFZzhja0Y4elZuRFhyVDhXS1hwSUxacUxRWXQ3NytYbXdTSFVzeDFl?=
 =?utf-8?B?bUNuQ1ZsODVBMTZKejVRVGJBSGdBcnpaVjk4ZDNDZDhlQysxaGIvdS9lY01j?=
 =?utf-8?B?VEkza0hxeXE1dnRMUjEvZ2lOdnd4SElIM0VtZU9NTGt5d2N1YTdJenRZbXNu?=
 =?utf-8?B?bmc5UmdmOEdmYUV5N29KZkIyRGZ0eE81N0lUV3B6aTZVWWVXVVpoOU0zNUhu?=
 =?utf-8?B?d3p3RjBWbUNJUmQ0VTNQMktzY0t6R2xUU3ZZL25SNGIxUHM3WXZpTXNPT2ZB?=
 =?utf-8?B?VG8vUHc1TUV5Skl6RmVtK1R2aVdlR2ZDN1lHa2ZhM2ZEV1U5Ny9sM1U1V0tF?=
 =?utf-8?B?YWdJV2xRNWZtdGUvcEM0bWV1OElKMDdrb0U2TG80ZDhNbU5TZjZmOVhoQlYx?=
 =?utf-8?B?N3JUaXhwc1JFdUMxZGpIaWcyOVhENWNsU2tjaTh1amtGSCswM2hiaGRqN2hJ?=
 =?utf-8?B?RU5GaXJ1Z1RWQ3E1ZXR0K3hvand4QjhaOWJQamVZQ1ljTXk0TzNiMURRUUxo?=
 =?utf-8?B?dElqemIrdFFiWWh1NTBvM3lBenFWUUU4eklDSElvWG1tQjFzV3liWFFVQUpr?=
 =?utf-8?B?S3BEOWZKdW9MS2Vxb2hRajQ0ODN5ZjFPbEhoZU1hN3Y2TzVaTGdKQlQrUFRF?=
 =?utf-8?B?eERTUXNoVXlqdVIzQ3hJMGVXT3BTdUNWZVB1Smh4UTQ3WWEzV2drVDNpb29v?=
 =?utf-8?B?N1h5ZDlRbkhJWjNBWHpaUTdvTlRwNHJnblVQS0JSZk1hTGlYMnpQRXk2RlVH?=
 =?utf-8?B?d0tNVnRsWGsvMGdEbmRiczkzU3NKU2x6Tm00Zlo1R3dXOXZBekNVdkVWbC9L?=
 =?utf-8?B?TTBaamdwcEU3TWVxclRXTkNRMi9KZ1IyaXNGdlJ1RE9PQm9rWmVKekI5NkNM?=
 =?utf-8?B?QS9KZ0xpWnNuRUNDdXg5SVFoenlJR3NvZDBVQTlidHIvK0xOQTA5dUNtRjZX?=
 =?utf-8?B?QVljcEtxTDM0a2xha1VaMXBWeXdZSXpHcmRWZElhYU9xaEZGR2NNdmpKRmtx?=
 =?utf-8?B?eUw4VHZFTTFTaG9abkk5ZjJsUFc2dVRXQWJlRlVaNEQ0Unk2Q2p4WkpEaXhX?=
 =?utf-8?B?cVdON3kvZGpHYzErVVdmK2dyQi9jSTkwZmJXZGk4Vm1MeWdlRDFqdGlmMllz?=
 =?utf-8?B?ak5KaFhNZ0lvS3FHOS90ZElndHZ2UENZVGc5NXZReTdwNzg1VWNNd2FSdWFN?=
 =?utf-8?B?N1Z5UHQ5SkprT3VUcWs0dXpPWXZSWEJraEwxWjFFQitzOXBTb3RtUHBqdFZi?=
 =?utf-8?B?SjdXWEZmQkpWazB0cWs1Nm1TTjdOMXJhLzZPd1p0MGZiSEI5Q2gvWWZwMFp1?=
 =?utf-8?B?S1lKV1lDWHMyNmlPTE5yaDUxWUloSlp1c3dZRzBrTVZVL3dHZzhvMGRacTV6?=
 =?utf-8?B?TysyUTFKT2owTE0wcWxycEd4SFdLcUxMT0MvYlNKOEZCb2EvQzZyb2IzbVNh?=
 =?utf-8?B?SjV4KzJjSFE1RytRa0QwSzVvcll5aElsT2lGSnBHRXl2bUFnUjJoQU5xMldi?=
 =?utf-8?B?WFk4QUd2YlFjNmtLS1pRUzljNDk5SzJUUkJUZ3B0NnpVcTg3TVFpT1RYZllw?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afb08f84-e973-454d-17d0-08de287f303d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:53:07.2400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdAMP0UTw/XptFKGIw7tNgSg6wrSF46Ec1ZWL1WH/WRXvu9SrUCKCETCf7PA5LL5U5v1dmrGOUCiwVdl3GPoq4bHNOKVb3kGnEFNkJSWVfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5247
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



On 11/20/2025 3:52 PM, Satyanarayana K V P wrote:
> VF migration sends a marker to the GUC before resource fixups begin,
> and repeats the marker with the RESFIX_DONE notification. This prevents
> the GUC from submitting jobs during double migration events.
> 
> To reliably test double migration, a second migration must be triggered
> while fixups from the first migration are still in progress. Since fixups
> complete quickly, reproducing this scenario is difficult. Introduce
> debugfs controls to add delays in the post-fixup phase, creating a
> deterministic window for subsequent migrations.
> 
> New debugfs entries:
> 	/sys/kernel/debug/dri/<card>/
> 	├── gt0
> 	│   ├── vf
> 	│   │   ├── resfix_stoppers
> 
> - resfix_stoppers: Predefined checkpoints that allow the migration process
> to pause at specific stages. The stages are given below.
> 
> VF_MIGRATION_WAIT_BEFORE_RESFIX_START	- BIT(0)
> VF_MIGRATION_WAIT_BEFORE_FIXUPS		- BIT(1)
> VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS	- BIT(2)
> VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE	- BIT(3)
> 
> Each state will pause with a 1-second delay per iteration, continuing until
> its corresponding bit is cleared or a maximum of 10 iterations is reached.

fixed 10s might be still not always sufficient for the test

if you're afraid of locking down VF driver due to test bug that forget to clear the stop-bit,
then maybe we should look for some other solution ...

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V4 -> V5:
> - Updated debugfs entries (Michal W).
> 
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 37 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 1cd3d8204c15..0f25091f4949 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bsearch.h>
> +#include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -1234,6 +1235,34 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  	return vf_notify_resfix_done(gt, marker);
>  }
>  
> +#define VF_MIGRATION_WAIT_NO_WAIT			0
> +#define VF_MIGRATION_WAIT_BEFORE_RESFIX_START		BIT(0)
> +#define VF_MIGRATION_WAIT_BEFORE_FIXUPS		BIT(1)
> +#define VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS		BIT(2)
> +#define VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE		BIT(3)
> +
> +#define VF_MIGRATION_WAIT_DELAY_PER_ITER_IN_MS		1000
> +#define VF_MIGRATION_WAIT_DELAY_MAX_ITERS		10
> +
> +#ifdef CONFIG_DRM_XE_DEBUG
> +static inline void vf_post_migration_inject_wait(struct xe_gt *gt, int wait)
> +{
> +	uint delay_ms = VF_MIGRATION_WAIT_DELAY_PER_ITER_IN_MS;
> +	int max_delay_iter = VF_MIGRATION_WAIT_DELAY_MAX_ITERS;
> +
> +	while ((gt->sriov.vf.migration.debug.resfix_stoppers &  wait) &&
> +	       max_delay_iter--) {
> +		xe_gt_dbg(gt,
> +			  "*TESTING* injecting delay resfix_stoppers = 0x%x, remaining iters = %d\n",
> +			  gt->sriov.vf.migration.debug.resfix_stoppers, max_delay_iter);
> +
> +		msleep(delay_ms);
> +	}
> +}
> +#else
> +static inline void vf_post_migration_inject_wait(struct xe_gt *gt, int wait) { }
> +#endif

we don't use "inline" in .c

> +
>  /*
>   * Increment the startup marker again if it overflows, since GUC
>   * requires a non-zero marker to be set.
> @@ -1270,18 +1299,26 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESFIX_START);

can we code that in some nicer way:

	VF_MIGRATION_INJECT_WAIT(RESFIX_START);

#define VF_MIGRATION_INJECT_WAIT(_HERE) \
	vf_post_migration_inject_wait(VF_MIGRATION_WAIT_##_HERE)

> +
>  	marker = vf_post_migration_resfix_start_marker(gt);
>  
>  	err = vf_notify_resfix_start(gt, marker);
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_FIXUPS);
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS);
> +
>  	vf_post_migration_rearm(gt);
>  
> +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE);
> +
>  	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index 2ed5b6780d30..66d5ffd0e371 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	vfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
> +				  &gt->sriov.vf.migration.debug.resfix_stoppers);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 66c0062a42c6..3ece00f74e46 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @debug: Debug hooks for delaying migration */
> +	struct {
> +		/**
> +		 * @debug.resfix_stoppers: Stop and wait at different stages
> +		 * during post migration recovery
> +		 */
> +		u8 resfix_stoppers;
> +	} debug;
>  	/**
>  	 * @resfix_marker: Marker sent on start and on end of post-migration
>  	 * steps.

as this is still a quite invasive change, can you post a IGT patch which uses these stop-points to prove it works as expected?

