Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BEAC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 09:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9F410F7C5;
	Fri,  3 May 2024 09:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtzdpbhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987A10F7C5
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714729639; x=1746265639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N7twkRtUxOy65M/f/KFW4we1UqAuC1hm7AjdLmD7h8g=;
 b=gtzdpbhmNABX12G3CIWfIE65q7lvluKei0EbaR3NI8TeKAKSIm9KrgVu
 QTl0QFt+BuT7k2SmsI7PUmYZVkAmzGNIKC04+2mOXLekGGCfRBKZynxiC
 vtrPnVlrU/MmqwakdM+nIdYk+e655SP40JsVAfmSoz9hvTAiLHArKr3Ed
 HzQ7iUGytgmYjmt/tlNQAQ09SViPwKSxtBQtluYLCsf0GdAdYi2zQq8k9
 5QlalldC2fgcZ6BX3fQLDtq74s9G2jp8gB/dXxi+8VCf1FC40k0kQUH3e
 oSbDyDQ+WvgSXEklSh0KgqJkgkxgNyhflLvAWV2Poph1FfHdm9DOCEOMb Q==;
X-CSE-ConnectionGUID: 4JFtpde3TN+uzUGVNxDghQ==
X-CSE-MsgGUID: dZVZ8YvrRUqY0uylyWdTow==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10661142"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10661142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:47:18 -0700
X-CSE-ConnectionGUID: c2C5RWDWQ+aLtct1N0Qymw==
X-CSE-MsgGUID: zTAr5TTiQdyGwgpqE6metw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64856067"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:47:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:47:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:47:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:47:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:47:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jujWRJ6EKC4TwUqvN8oZMllUrvmAsCFozfPfmhBt7Q9yKXjbjpuKE2fOFi6b/MQCBuqSyaw2H25+Qwf9viLjfaa47o3ZryOG2gFALpga2ejkm294CyD/r07BXImWJOUN/70MvwbVO3cO08ldtDjZy538aj8RzR+KS+opiKODmwYS8hjzqw7MORiPXNIQi3SvN1rZXayY60VPFP1qD6gJu5k3iszs87Po9WXehRuMrxzohhStKBJLEpAT++b8LcXSb/K01BE4ChgAgJEFf1x0d/eTAbo85ZJvZF/kfX+F8lxkgZGJTkHDVMKVSs85lWv8IO5KOLU+9otXldsLnbXPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hvz+dqczBU40WJV1Uj/PQLJSYvlW4Ir8g9h2NYPAAY0=;
 b=Crb9/jymwh599N1y1IZ5bVOxRjfFmdwD5E985qJAXOq1/2ok7RUoJR2TQ0/Ar5RwMT0p7M2nbRejJX4zN28xCmPBqJk7QigRMn0YobokdsJR6O3qGsTrdSne8RmLTlsHJ60xQOEpl9h7J3NJaGzbylBA8xqYTw9wuqyLPTlfuELiyIfaZuwgawW3ozeU+O5VVdPTmuwWvwtgvQPKkGTc0qieARdih2tl+czVJ8uGXZy+dwXcnOevvOOms38c7grWLIKOmAB0mT2vfwzxHuU5igtmzJXonWUCOty4LAufKlLL+wWJY8Ga2CzzqbEWMNghe+BqLR+dobUBf8ylmxT0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 09:47:13 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%7]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 09:47:13 +0000
Message-ID: <6fbb932b-9525-4fce-9376-30f422da703d@intel.com>
Date: Fri, 3 May 2024 12:47:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Refactor default device atomic settings
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Brian
 Welty" <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>, Jose Souza
 <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost
 <matthew.brost@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CO1PR11MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db110cb-252d-49c5-021e-08dc6b560274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGxhdGsrQTdNZ1RvblNYZmtUdEppay9HN21MUnh6eWR2dnFVMDBuUVBRSmdo?=
 =?utf-8?B?cTFIbmowaGR3aVU3QXE3VTlVeDRhb3VCNlh4ckxqNTQ2ZlcweUVLMGVmQWFG?=
 =?utf-8?B?RmZJSVE3d1BwMzU4RmF0VXAzNlB4TDQ4TndTbURIRjc4UEVXTWJoNXREVG50?=
 =?utf-8?B?VFJoTlVjdzIxN2N0ZHhMMHREL3RCQmYrQVhkUEROUkJuMXQ0Y2tTazlCSFQy?=
 =?utf-8?B?aEgwMXBtNjVSTFFFVmZJbjhjUHNlQ0tPMVJMRmE5WVlSV0NaMk5DSVZUT0VB?=
 =?utf-8?B?Q0J0TVJzaG8wUWlXQmd6ZjVzT002N2JrV3liWjBncmMxTG80QWRiaUtyMy9E?=
 =?utf-8?B?dmxoaDQ1Vjh4QVNkdk5JM0ozbSs4aWlDc2tzWDB4SnpqR21NeFkvZmhDWTB1?=
 =?utf-8?B?Mkk2QnlyVnBPUURabmtTc0Fua0VLeEQ3UHVXTmlIelNjZEFuZXg3dGsxZFp6?=
 =?utf-8?B?eHNoU3pFSUVjQXRnWVI3ZjFNYWVWVGF0KzJSQ25FckxmL045SW1SaTY4emdQ?=
 =?utf-8?B?SDMzcUpaZE1vT01VVkhyL2pjL04vTjRPOU10RkRjNTB1Sm91UVAvaHFscHM4?=
 =?utf-8?B?Z1pJc3pZT2RYTDlVUVlQMjRDYldDWHRiRlJMU05rUlNheFRRV1ZrTGVqVGxV?=
 =?utf-8?B?UkEvZ3VNQ3RhWEVQclFubFlOL1RlTWdMSjVhRUx1VVNXSGlXRTNPaTd0cERx?=
 =?utf-8?B?bjRxSHhIWlJPZ3ZxVUNZUlZMazBodU9jbWE3R0JYVXZpdVYzNGNyNVRqa292?=
 =?utf-8?B?MXIxQ0djUFZOdzBUWGVRbXRGZ1BESjNWRXV3TzZNVDZHVGQ5Ynlwb1VqbklP?=
 =?utf-8?B?MWx1MXBoRG1PZEJpaW1WV3dpOWpqTFl2TTd5T3dsN2NrM1pwWElJclprdnRU?=
 =?utf-8?B?NmE1WjVxWnN1MUo0LzRCZmI4cDlRRDAvYzZHNHVNRWtBRTdVNzRCRm5KY0pQ?=
 =?utf-8?B?MHNyVEN2TTA1Uzc4OTgvNkRRcGpPQWwrY1hEVnpWekZNODhwTEUrTU1jK242?=
 =?utf-8?B?ZUVtL1RWMW4wNHJhVnJTWk9sYTZ4WXQrNlFoT1Z6RXY3M0NETUpMajk0TWpD?=
 =?utf-8?B?THMyb0RhQkhSRkVWamZrcWNUZWIvTHB3L3RFVjV4ZmRrUTMwUzdQNnZlbUQ5?=
 =?utf-8?B?R2wvdWJ5a0swb1pCaVNEdnJCS2lvWWRqSXpLSDY2TzlQV0JTRjVicG5rL1hS?=
 =?utf-8?B?SkUyK0pMQ2tadjRaaGdDYkxEdFRaeHBkZ2doQ0JTYlJsSkN3MitjckUrOVNs?=
 =?utf-8?B?QzgzSUxSb1JuVEVhZjdZY0YzRkErU2o0R2E4Z3UrV3JVWHN4UUZaUFN4R01P?=
 =?utf-8?B?eGZTeFZ4THJjZXV3dGZ2U0R3cm91WUhBWFFuRU5xT3g5OFIzVHRWdGV5ZGZF?=
 =?utf-8?B?ekhLMUJQcElGSDJGZXYxa3pneWo4T2dCN0QxVVRNYWx0OHdGc2UrSVJZRFhX?=
 =?utf-8?B?eURaMVdiaGFIWjVTaGwyYVNRWEg3QmtkNlg0UVoxYXVWRVZncUNlYXpMQVVu?=
 =?utf-8?B?aFpwY3RSZTArdVBXemRwRyszRTQ1OWFpbzhrT0tEdFFQdzZ0ZTdQZG5vMTh5?=
 =?utf-8?B?RXR1bkVTS1pIZk1wck9yMUZITE9CZjZHWFRicEoyRDdWNXo0cTNxUkJIYjNQ?=
 =?utf-8?Q?JpDZxMERj97gC+xnSgG5/vQiz9LsCETNaahULuk+m2G0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnpwRHRWaU9ETmNubUNGN0U4T3FlTmhVMTZTQUxNVmhpb2dldUxjWGJodzBC?=
 =?utf-8?B?bmlDcDBBL1BQd2ZxVkpNS1AyM29haTIwTFB2dlJpaW91T0VMejNvejY0dkxh?=
 =?utf-8?B?MkhHWWdxWDV3TDdodkNVekxINmpKQ1Z6NkZKQ1VSYUFIakl4a2lHY2xYUnow?=
 =?utf-8?B?am0zU2VqTVRESklKS0J3U2dXWjhVVHd0U1lsckpSa010eUo2Vy9WN0ZoWWZG?=
 =?utf-8?B?ZTV4VVYwNmExaXppUXVSbU5PaWs5eHpSQVFJaVAwT0FFejZFVU1wSTZtcjBL?=
 =?utf-8?B?MTN5ZVFwQXhlU2x1YzRmM1htVnhVZldhcFVxbDNnMWlWTFN5YWRNTnFZT2ZK?=
 =?utf-8?B?cFZ1NWNaVEs0a2poTUUzYitQaURkRG5QUExRTXlCZE1pby9UblBjY21COVA1?=
 =?utf-8?B?MUpGa3IxQkk3QmRzZjZKSTVkbmFVOXBXRll1Mm0zb1NoOC9aVDFwdUlqT0Jj?=
 =?utf-8?B?WjNEZmFVUGFIRlBQdjRCRjJGNktOaGUzOUwvOHpzbStEUGNudXErRTNRbSs3?=
 =?utf-8?B?MDZmQzJ4OWtMTkVMRGNndWtYSkZia0tPK0ZFbFJJWG43WExtNHFqQ09ibFFZ?=
 =?utf-8?B?SC9jTUgwYWZIb3ZEdzNXZFYvTHk4T2VTSmh3VUNobmpMNDZVWDRFNWs5amFs?=
 =?utf-8?B?UGJ4VVJadjZ0RU5FemNzdTdpNUZ5ME1WS0ROeEFkTmI1TTE3NDcxSE54RmVv?=
 =?utf-8?B?RzZ0NjVZYWJsOW5VblV6Zk8vMmk2eWJPU3VEZmFnNi9HNDg1c2oxdElSYTlw?=
 =?utf-8?B?QkhwVDJ5bkxEY3lLWWRNSDJsNUZDWEhoV3RVYWlxejZaV3pEWnlMNEZ4RStM?=
 =?utf-8?B?ZUtlVGl6ei9QOVRnUitRek0rK3BuOGpPTkYrVEhyeDVrZjNTU2pwdUlYZW1B?=
 =?utf-8?B?czZETTJ3NnVVK0hDakZyU0ZxditUQTRtNGlIcEEyOWFvb1ZiaWFXc3BaamYv?=
 =?utf-8?B?T2s2cjIrdTNhSXhlWGtJci84OXhjeHpaTHlld2ZoVHE0a0NPd1Y5ODhnYkNt?=
 =?utf-8?B?Zkg0eWYrVktBK0lyVVdBeDc1MFg3MTB2WVVKZ3FKZm1YSkJrMmRlQlpKNkJJ?=
 =?utf-8?B?ZEROTHUyREZxSVltMmdvbkZQa3dOVG14S0x4QmdUQm9HaVRucjh2REc2QWZL?=
 =?utf-8?B?RUs2Q0xhRm9NRGw5VXZxVzlDcTI4czlOV0hKbXM4VGtSbVlUNWNxY2xCdUJG?=
 =?utf-8?B?TFQwQngyT1FYT3VJYnpLSktMNmIwa2JzaWhpUnlMVXgxcDFoSnIxSTVRWkF3?=
 =?utf-8?B?UUxpakk2MklYTEFSc2NkMkZINHRqTkxpY0tUQWs3b21qb0cwbWM0bm1KajQ0?=
 =?utf-8?B?VW1jUEpPcDR1czJJaFlzRFpuekdxKythM2s4Nyt4M1BXSU1KekpzdXRoZ3Bv?=
 =?utf-8?B?MkxJa2dVNFRiZHQxeFBxa2NqY3JQaHN2OWRza2JvR1kyZmZtbVhoS1ZUS0Fv?=
 =?utf-8?B?dEF4SWhBc0pFelNLcGx3RTJkb3JPbXd4ekxjWGIvMTFZU0hKMmxsRncwa0Vk?=
 =?utf-8?B?dWZxTGNRSnFEVGxBYXplSVkyWFpNK3NHQzJkNldPZ3k0TGliUnhBUHUwTzY3?=
 =?utf-8?B?SlNaUFFxTVlJRHV2MnlmaHVRelhHR09RclJoczFJTkFQU0FxQ0l4MWE5WDRP?=
 =?utf-8?B?SlZxcFBJbUNUd3U4QVA4M0dVcE5KWWFTZXhTZ2xpcEg3TThEalhwMjZMY25J?=
 =?utf-8?B?T1RXNC90S3Nia0NZUGs3T2hVSG0wNXVOTUJ3SldSdk14ejNKdjRMQWJWdEo5?=
 =?utf-8?B?amZmQURnSjdzMzRhK0NKVS9ZeG9IRTNuRWhYSmJKVXQ1TEpWbVd4RjhrRkxL?=
 =?utf-8?B?bURFN2syM0JSSXJ5WG5hb0cwdEZsbW55Ym50U0ZsL1ZVUThYMTA5eEJnUWhC?=
 =?utf-8?B?cHpDNUphWEZRbzlOdVNsdjYzMVpsdFpwRkJxTHBkaG1mZlJsekVuaUw4ZTln?=
 =?utf-8?B?YUNIenNvcFZZTG9EM2FlakNXQjlKUGxmRGRvV2pBd1NJaW94NW1HNzZmSTJh?=
 =?utf-8?B?UjM5Uktsc0NVNmhzZnFxT2xicmVlN2V0L3FTOFE0ODIvQzFTWUlOMEE2SWtB?=
 =?utf-8?B?a0lUdE9kc0tDM2dIWk1wQnJvT3lDZCtMTUF1eEhVamhTaU5ZVHl4VDh5NGJJ?=
 =?utf-8?B?ZHJuN0tXUVR6NlBsZmpBY3BxNDMveFdGS0YyOExIbWtaaUQyMUZyZlBPTDlX?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db110cb-252d-49c5-021e-08dc6b560274
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 09:47:13.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNKr8qjZ+1/agdwSxEIOnlnqW2roVkEL/L2YocXRDoXGNZ74ABCWNihA/MwTju8uYBabtP5ijBCmaawasRpifNLYLNHkzgo5J9kNS36sMuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
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

Hi Nirmoy,

I've updated our Mesa MR for this : 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28823

But then I started to wonder if we needed to do anything at all with 
this v6.
The only scenario I'm not sure about is this : a BO is created with 2 
placements LMEM+SMEM. When Xe migrates the BO from LMEM to SMEM due to 
LMEM pressure, does it set AE bit in the PTE?
And then if promoted back to LMEM, is the PTE config DM=1 and AE=0 again?

Thanks,

-Lionel

On 30/04/2024 19:25, Nirmoy Das wrote:
> The default behavior of device atomics depends on the
> VM type and buffer allocation types. Device atomics are
> expected to function with all types of allocations for
> traditional applications/APIs. Additionally, in compute/SVM
> API scenarios with fault mode or LR mode VMs, device atomics
> must work with single-region allocations. In all other cases
> device atomics should be disabled by default. PVC needs special
> care as it doesn't support device atomics on SMEM.
>
> v6: Only check LR mode to determine compute API as fault
>      mode requires LR mode(Jose)
>      Set AE=1 on SMEM+LMEM allocation when a buffer is migrated
>      to LMEM from SMEM(Brian)
>
> v5: Fix broken atomics on PVC from v4 changes.
>
> v4: Previous assumption that device atomics should be disabled
>      by default on SMEM only BO was wrong as traditional applications
>      will not use such allocations for CPU atomics. So remove the
>      VM bind flag and the query uAPI and instead refactor default device
>      atomics settings as per VM type and buffer allocations.
>
>
> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>      Remove redundant coh_mode param from xe_vm_bind_ioctl_validate_bo().
>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>      config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>      Mention that PTE_AE will not be applied to userptr(Matt R)
>
> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>      Use XE_IOCTL_DBG for checks(Matt B).
>      Move platform checks with help of adding flags in
>      intel_device_info(Matt B).
>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>      Create query uAPI for this newly added VM bind flag(Jose, Lionel).
>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>
> Nirmoy Das (5):
>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>    drm/xe: Move vm bind bo validation to a helper function
>    drm/xe: Introduce has_device_atomics_on_smem device info
>    drm/xe: Add function to check if BO has single placement
>    drm/xe: Refactor default device atomic settings
>
>   drivers/gpu/drm/xe/xe_bo.c           | 14 +++++
>   drivers/gpu/drm/xe/xe_bo.h           |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>   drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++--
>   drivers/gpu/drm/xe/xe_vm.c           | 79 ++++++++++++++++------------
>   7 files changed, 103 insertions(+), 38 deletions(-)
>

