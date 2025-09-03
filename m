Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B241CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394C110E129;
	Wed,  3 Sep 2025 22:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhUW7Vkp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6987210E129
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756937205; x=1788473205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uq6SE/q+4n33X/1ha1NTqnKod6VGVhIULPZct+tZYEU=;
 b=RhUW7VkpiwG4L7PYqxcbdfFdDFjc9ARqcnwIJg8KY7j0LVWKVLR/LmJn
 BwSgmRlq8/iUBoCXCjZGQUV8lkOc9msyyXuMZ4GGac6DjPjc9POHr3d2P
 KgbPreRa66GThrZ7RpLYq+7BkeO9PHDBKOYu7Ext9KdnISVq9S+rZgErC
 OBhd3vIhYjweNjcESwHWdkqh9gPY52PjJEscD29eLvm12vKu9hclK2ZeV
 SMHoK7AE0Vk5FYSW/oj9vdORfSifB7vVgxu8Q0G7wZZ3agvWv5tufcuK7
 uIaqjW9MAp07M0hBD9QIFqhN2bDKx8NqSJzfbjVrNG7epFMB/g10WAnTY Q==;
X-CSE-ConnectionGUID: qRVhAFvOQTGj/D5uMx0Ndg==
X-CSE-MsgGUID: d78hycUgTaubWHzNKTuNWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59375922"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59375922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:06:44 -0700
X-CSE-ConnectionGUID: ivR4pUMRR0mFWA7sK051tQ==
X-CSE-MsgGUID: R4xAL9WORU2JTOVoh1ncAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171600135"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:06:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:06:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:06:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcOSLHUZ1pmX+qyNgurt/zaGJBcl7lgsjbUEA6n2PfQGI+EE888V8khbljShnwgY6vo/GMlxkWLnCAhFUFAwAog9LNgSJq4XcBeKtgn6FtHpFEX+zjrBWTZbUtvPIGQKuILxusbOpGc5wO+HaTnzABvIBDGyc1jAQMvBOi+2w6AQPgCFj8qOkzwNTQcIsOcBECGbLHhyjXNNmMh/Gqf63EGWlHE3ctlpoINNeSJJu0Z3o+h+3BxNMKLAAdoWQAzTHV8JGnjErJ6DIdZ9jw0OyCky+/A4dd8MbO4hI6JYb6QH2oOgJZtnC30P+qQn0mrksccFMt52Ftt+nbqe11CsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAOQK4E2RImQx/pVoYfJuUZZbnKNhcYc4naG4HOer2U=;
 b=UjJAhLMEkheF7evWv+RH9vSX+C1frOy4vwS/knjMB3H20ZxPRDs0EEYrQdK+R/qnPiA5YQMMLQ4fVzRbETpk2DLkwqlUUi1qyjDXv5p0DrtIBRxoX8gt/EOIOEFQZG7Cu9u6htkqpD+C/DCfj+EEKaBA5XA4nIpK8PgNT7Dywm4oQRTEO16JQelzMvJoYCEXp6nZw1UzECNMxMeGGOx0JV9ycLrVBKJHMWoGLb5iypo+wGJ8XrJBEfM8U2YbsxnHzDu/JaBuPq7HqfwD+lKtjSnUekv7DY66gsut5AIRY6Bsa+Y49x72H49e4hRQJ5dlP+gqPaulNVNCTzfr3pIMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 22:06:41 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 22:06:41 +0000
Message-ID: <464c9921-00d6-4186-b34e-f62960862167@intel.com>
Date: Wed, 3 Sep 2025 15:06:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add SLPC power profile interface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
 <aLHiMRvKPWQU6gPQ@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aLHiMRvKPWQU6gPQ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a7c758-8b92-4f0e-3d53-08ddeb362968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlDQU41aXpScE4xNzRwbzYvM0VselZLc2RSVnE3YWJCZk1sRzhtaXdJN096?=
 =?utf-8?B?U2xlWGVkZHI0bXlkMkpNdVVQaG1kRklZbHJDN2RhRlNOTllsci82Tld2THE3?=
 =?utf-8?B?LzZNV2RhUWdNbEx5L0VvNXNLblNueTJPMnJrdmx4VWt3bk5SSm9tZGpYWmlh?=
 =?utf-8?B?SzZTc09JMXZSWEJxZHZwZ3RBYnZiL3VodE5NQ1JrS1FwK0hEZU1mM0toK0VQ?=
 =?utf-8?B?N2FWaHIwK1UxRFJ5K2NtbVd4SHI1RWtpVkJRMktiV0l6c1ozOFJiOUsxWmZv?=
 =?utf-8?B?K1hlZnpNaXlxTGx3dEVFZVRPUmRjVE1MdzdaOWVHblpnRWIxSGVHS3E2dCtD?=
 =?utf-8?B?VU15MTdOZ1hqUlY0RFlOYm9xUVZMVUxFVmdGdndHVEdmaDJlNXZ0RDFWR0NQ?=
 =?utf-8?B?Tlh5QUtlUXFZRmpZQzBOaU1mVWRZZy9STS9aQnV6ZEZKZURMZm9YUmwxM3lz?=
 =?utf-8?B?Y01HSURMOVVtT042N1VrWUdMRUJVTHdMYm1XRllvZ0dsaGZuM3pUTjEwbzJO?=
 =?utf-8?B?OGdkRzdXdFVTajl6c245bnhWcTFNNzJueFc2NHhoOEdsbTVqVFdPK0FYZHJw?=
 =?utf-8?B?cCs3cDVoVkNkTmo3RjRCamVJbjVyV3lqU2JucjE1WVRsRUdoODY4MTd5Qks5?=
 =?utf-8?B?bmZnQ1JzZlVxS2tYTjFkSkZ2VXA3eXhGMzBKNFEzRHRsNDdNYk45UHovNW53?=
 =?utf-8?B?aVFXZmhtVDlaN0k0RnIvWVlBVnZqeXQyaE9EbHI3YXhqVEZVOHRRVHU2dDdk?=
 =?utf-8?B?WlBaMncrUjh6NTUwU0sweEFJTHBaRGpxWDVFT2dNdkhFUU12KzdPWjVUTlZJ?=
 =?utf-8?B?RzZ2WUw5SERTREoyN1lFQStYbnlMTFhhc3hZN21GUmdhZ2F2TXdKZzhxSVVU?=
 =?utf-8?B?bk1oOHFodGZYMkhWUlFaOU92dzVxQ21kM3VBSDBraEFHZ2dydDg5SjBsbkV0?=
 =?utf-8?B?M011QW00TmxSMDR4Ny8yTFVMdWIzY3d1T1ZFbitZTHFraXdkRHQ5TUpKMjNG?=
 =?utf-8?B?N0E5anhFQmE2d3FvWkFFMW4xdGQ1dVZkSVYxaitPK3Vna3hTSlpneHVXTlUy?=
 =?utf-8?B?NFcvSWNYQWZKTGlrc1lSTmEwQ2ZZN2FMQkIxazdhS0V2cHBGQmxZVXV5TE04?=
 =?utf-8?B?NS9Eb1FpODdwbXExdXdNODEyZmNpOWVFUGZiT2RCSFN3V0w0dHJMSjZaZS9S?=
 =?utf-8?B?S2ViTXhITXVaRmVUYmdva0RhSHVsbjFvb2I2MEVYSEZvWXFsRWg2RUFBdk9J?=
 =?utf-8?B?TzdBc0l0bGVIdnpHWVRpT1R6L1J2UUZ3NjF3SnVHSk91d2ZCMjRldHd4cG43?=
 =?utf-8?B?SnQ1aWNPUThkY3FjTHk2U0NjQ3J6bUx6aERqelU4NlFiS3M1b0hucW1pZTR0?=
 =?utf-8?B?UkRKNWM0MXh3L3luQ0kwdkdDQi90ckpMaTl2cHpXU0hqM1Z6NWJOZzdoL0hh?=
 =?utf-8?B?QmNkZFVmNEFHbVkyWCtROXdTNW1ZbTVvaHg1R3lRYkY2bEFTbGNYRTFYLzd5?=
 =?utf-8?B?aWIrN09jeEVWbTREaVEvSkMvYlFld2ZCdEMvQnNXdHU4YWRkTkoxVkhBeGYz?=
 =?utf-8?B?MWJEQkZGcTJScitqaEpWZ3lUcWw1RTZ1ak5VTXRmQUJQT0RYKzlsSFhWeEpo?=
 =?utf-8?B?UklySzZSdGxRMXRNUlFuMDM4UlowWW5seWl3M3VVYnFUOUlaWFozbGdvdmJD?=
 =?utf-8?B?cDYzR1FJL2lZRFJzK3J2NEVYQ0E2MzZFbjBoSVExZHhhWmdBY2VXVnVKS1Y0?=
 =?utf-8?B?dXFONG9Rd2oyNFludkZjR1k0akxRaTQ4bHRvU1lEREJqV0NEU2xQcFAvM01y?=
 =?utf-8?B?Z1JVTE9BUkhOcmRoV0FleTJiVXpVVWdTMGowajg0RlhoclUyRUxDMFFseG05?=
 =?utf-8?B?VjVXODZDaUpUZlBid0hJVHVIMStDWmVWWTY3VjJTamZiRjJ5aXRoN0lreFlO?=
 =?utf-8?Q?HL4Z7rRHoig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emcrbEVpV0Q3Q0RwMUxZQVduSnJzcjNvTy9vaUZ2dVRnbmsrS0Z1NS8zb09a?=
 =?utf-8?B?ekhQd1U2WCtDV05acTQ0K1FYc1RGL1l0MVV0T24rK2oxZC9abWl3UDd5aUZq?=
 =?utf-8?B?dE1YZjRpZ1hqLy9CSlI2WkJXdjQ4RVI4S0x4OW8vRzNQNVUyZ2NCdmJWQlY1?=
 =?utf-8?B?ZzFJT2JCOUVONENWcUoyS0FXbTFqb2FDUmZlSkJPTUE0cUM3WGpuSTBRSkRT?=
 =?utf-8?B?NzNwWHpLSVRNSWYra0ozYWFucDgwbFViRWlKWkVlVFZGZENhM1RxTWZvbG82?=
 =?utf-8?B?V3hiZ1FvdlV4ZDRJOGZmVkVadTlQM1d1Q3ZmMFRkQjFBbGZaZThZMjFuZ2x2?=
 =?utf-8?B?VGUweXJLL1lUcTJhVTZTamJuajh2c3huL0lFZDdJTHdRMDhJd3UxK0d0UWM1?=
 =?utf-8?B?Z2liRFM4YUV3OTI5ekpsd0grUjFGUU5lamJjV2VVY3VlU0JmT1Z6c3dmODhF?=
 =?utf-8?B?SGJHOXRyMHloUTFxNW1vWGVrVnhUK3l5a3U5RE45NWY3WkcwT2YzRCs4RXUr?=
 =?utf-8?B?dW1uakxkdjN5eEhTZGZETnhUOXVEOHFXV1RtNVVHOWFEbStWSWRvc0ZLMHhp?=
 =?utf-8?B?RDJDWFhvMG9IVGtPV2liV2FqRmlGUEpsMjV3S2pLakFaWjRRMVYvUnpiQkJE?=
 =?utf-8?B?UCtSVitIb3dmQ0Z1VVpGeUZETU5yY0V1MnRzMkVTcEpsODlJSDNpVXB1UEI2?=
 =?utf-8?B?QitoVlFNNG5hTWNtZW1zUGZEODM3MS9jTTgyN3h2Zzh0T05saVFRNTdaVGFF?=
 =?utf-8?B?bTN1N2EzWUFpK09HZ1pRa2RqTlNDZ3VoY3MxRElaRTBXREVpNHZmVWtTZXEv?=
 =?utf-8?B?ZW5mTTBNTzJUa1ZIVmJLY0k1Y3N5UmxpOWY0a2RWNVRVbThvUUJYSDhsbTc0?=
 =?utf-8?B?S2JITTd6ZjZXU0EzSnNVZU5yeHB2RlpvY1pVUEFFWTNEVmtnZy91MXBkMFRK?=
 =?utf-8?B?SGZKcGdlRGJFMFBRNGRTRWdYaUNEb1BQOVY1UGxPS2lwTGt2OXF0TVBRSks3?=
 =?utf-8?B?OEZzOVhqVUprR0dpcFVUVDV2MTRoOFdDaEkrcklUczBTSEg2TzJHdHM2M1VR?=
 =?utf-8?B?cUM2bjZObm44QnRKVy95Zzc3QnU0VjdVOFpRc1BTSlRUZWZHaWJEWkEvRlc5?=
 =?utf-8?B?MCt0ZldKVUd0Q3BraG9XY3VNQklLaDhMSGp3WDI1MDFvU29VbHc2R2c3ZHky?=
 =?utf-8?B?eU55eGJkWVgrbTJvS1NSZmVMZWwzSndVeUdoOWJBYk5ONmU2QXZGMTh1MEZk?=
 =?utf-8?B?OHY2NEZoZTlWR09Hc3EvTVZGOGNZbExRUk1ydzRpSmg1VEUveXdHb1NGNm9p?=
 =?utf-8?B?cHJneXlINzk1cGdyTktYeHZQTUovbGlJdGppNVkwVGFsK3VMSVY5KzJRTHJv?=
 =?utf-8?B?Mm90aS9IZEpTRlJ3UXlMcEQxUUl6ZUJCZjRvN1VjOUpjTTlLLzVVQlZMNEtE?=
 =?utf-8?B?VDh2V1F4Y2pEck93NlZGOXNqN0FPU05MbHRpV3llS2hzank5TmdkcG41eElP?=
 =?utf-8?B?aUxMUCtFaVJMazU1RWJhK051U25WVmd6UmwrcDZ4c3dURVQyekIxZWFGK1JE?=
 =?utf-8?B?ZmdtMFZYWUJxeGVlQjM1L1RySkE0R0FvSXlIN2xJYTFEWDJ0SUZTS0JoN1RW?=
 =?utf-8?B?NC9DTE5Sc1k0WWlmZ0Q2bmlZRE9rQUphY2MvWmRtWDdEUFhuRVpoYmZTbSs0?=
 =?utf-8?B?R3BRZEgvRVpFMmhVZ0dUOEJoZHlnVVhjRmpZRkpIemJpaFcvbWRDZExMWXJR?=
 =?utf-8?B?S1V0b3EzYTJTbG9tUFo2UVhmdGtNdld2SlRaSDl1VGVBbXBhTnVqaFVFcTBV?=
 =?utf-8?B?RkJlb2JRck9GOEpQQm85dklubDZBWkZUbkV3UTlLa2krWUlVREZacTZMVExi?=
 =?utf-8?B?VGF5MnA3a3RZTWpWcmt0MTRUTVM0WFJ5TytQNTVVQngvR0hRSzlHRmRUczRt?=
 =?utf-8?B?Q0E5c1FnYzBaQWZQRWZ3a1p2Um1JTEo4cSs1bkFyRmtpb3M1eGR0djRudTQ5?=
 =?utf-8?B?OG5kNElXOUJGVi9MeTN3V2M1NVd2Y0FGdzB3NVkrR3RlV2t4ampjKytrd3Ba?=
 =?utf-8?B?dzNmU0NlRUN0bmdhTFIwYWFNUS9DNTY0bTRhcGVQbklucFBKWndJV1hZTEw4?=
 =?utf-8?B?UGxGcE82em90OFlKSHdYTUNiaElZYkhZWVFKRXBiRnJOMmIwUTRoa0NDZG5m?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a7c758-8b92-4f0e-3d53-08ddeb362968
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:06:41.4142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8EK0/MnjCz/XFR4ltIrPCmuP+MYoNCqMlxSnmVTz19eMYkshZdaDTuwWlsPH4nI+Qi3WlSuNoyqTCgb+dREUo8onciXHcVBm/MeYRfxs6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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


On 8/29/2025 10:24 AM, Rodrigo Vivi wrote:
> On Fri, Aug 29, 2025 at 09:43:08AM -0700, Vinay Belgaumkar wrote:
>> GuC has an interface to set a power profile for the SLPC algorithm.
>> Base mode is default and ensures a balanced performance, power_saving
>> mode has conservative up/down thresholds and is suitable for use with
>> apps that typically need to be power efficient. This will result in
>> lower GT frequencies, thus consuming lower power.
>>
>> Selected power profile will be displayed in this format:
>>
>> $ cat power_profile
>>
>>    [base]    power_saving
>>
>> $ echo power_saving > power_profile
>> $ cat power_profile
>>
>>    base    [power_saving]
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  5 +++
>>   drivers/gpu/drm/xe/xe_gt_freq.c               | 42 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.c                | 37 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.h                |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h          |  2 +
>>   5 files changed, 87 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> index b28c8fa061f7..c1d16acbb732 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> @@ -210,6 +210,11 @@ struct slpc_shared_data {
>>   	u8 reserved_mode_definition[4096];
>>   } __packed;
>>   
>> +enum slpc_power_profiles {
>> +	SLPC_POWER_PROFILES_BASE = 0x0,
>> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
>> +};
>> +
>>   /**
>>    * DOC: SLPC H2G MESSAGE FORMAT
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 60d9354e7dbf..cf26004b1efb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>>   
>> +#include "abi/guc_actions_slpc_abi.h"
> We should think on a way to keep this only inside the xe_guc_pc component instead
> of leaking the guc slpc api to other components...
ok, will do.
>
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_throttle.h"
>>   #include "xe_gt_types.h"
>> @@ -227,6 +228,46 @@ static ssize_t max_freq_store(struct kobject *kobj,
>>   }
>>   static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>>   
>> +static ssize_t power_profile_show(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +
>> +	switch (pc->power_profile) {
>> +	case SLPC_POWER_PROFILES_BASE:
>> +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
>> +	case SLPC_POWER_PROFILES_POWER_SAVING:
>> +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
>> +	}
> perhaps encapsulating this in a xe_guc_pc function, or perhaps having this
> outside of the freq sysfs dir?
> or finding a way so the guc_pc can register a file in this sysfs but
> keep the entire flow there?
ok.
>
>> +
>> +	return sysfs_emit(buff, "%u\n", pc->power_profile);
>> +}
>> +
>> +static ssize_t power_profile_store(struct kobject *kobj,
>> +				   struct kobj_attribute *attr,
>> +				   const char *buff, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	char power_saving[] = "power_saving";
>> +	char base[] = "base";
>> +	int err;
>> +	u32 val;
>> +
>> +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
>> +		val = SLPC_POWER_PROFILES_POWER_SAVING;
>> +	else if (!strncmp(buff, base, sizeof(base) - 1))
>> +		val = SLPC_POWER_PROFILES_BASE;
>> +	else
>> +		return -EINVAL;
>> +
>> +	err = xe_guc_pc_set_power_profile(pc, val);
>> +	return err ?: count;
>> +}
>> +static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>> +
>>   static const struct attribute *freq_attrs[] = {
>>   	&attr_act_freq.attr,
>>   	&attr_cur_freq.attr,
>> @@ -236,6 +277,7 @@ static const struct attribute *freq_attrs[] = {
>>   	&attr_rpn_freq.attr,
>>   	&attr_min_freq.attr,
>>   	&attr_max_freq.attr,
>> +	&attr_power_profile.attr,
> we should not do this. We should only show the file if GuC PC is enabled.

We already have a check in init() function-

         if (xe->info.skip_guc_pc)
                 return 0;

Is this what you are referring to?

Thanks,

Vinay.

>
>>   	NULL
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 88557e86d637..c71d95959dd2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -79,6 +79,11 @@
>>    * Xe driver enables SLPC with all of its defaults features and frequency
>>    * selection, which varies per platform.
>>    *
>> + * Power profiles add another level of control to SLPC. When power saving
>> + * profile is chosen, SLPC will use conservative thresholds to ramp frequency,
>> + * thus saving power. Base profile is default and ensures balanced performance
>> + * for any workload.
>> + *
>>    * Render-C States:
>>    * ================
>>    *
>> @@ -1171,6 +1176,31 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>>   	return ret;
>>   }
>>   
>> +int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, u32 val)
>> +{
>> +
>> +	int ret = 0;
>> +
>> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&pc->freq_lock);
>> +	xe_pm_runtime_get(pc_to_xe(pc));
>> +
>> +	ret = pc_action_set_param(pc,
>> +				  SLPC_PARAM_POWER_PROFILE,
>> +				  val);
>> +	if (ret)
>> +		xe_gt_err_once(pc_to_gt(pc), "Failed to set power profile to %d: %pe\n",
>> +			       val, ERR_PTR(ret));
>> +	else
>> +		pc->power_profile = val;
>> +
>> +	xe_pm_runtime_put(pc_to_xe(pc));
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_start - Start GuC's Power Conservation component
>>    * @pc: Xe_GuC_PC instance
>> @@ -1249,6 +1279,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	/* Enable SLPC Optimized Strategy for compute */
>>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   
>> +	/* Set cached value of power_profile */
>> +	ret = xe_guc_pc_set_power_profile(pc, pc->power_profile);
>> +	if (unlikely(ret))
>> +		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
>> +
>>   out:
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return ret;
>> @@ -1327,6 +1362,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   
>>   	pc->bo = bo;
>>   
>> +	pc->power_profile = SLPC_POWER_PROFILES_BASE;
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 52ecdd5ddbff..5242bfa8aaa3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
>>   int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
>>   int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>> +int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, u32 val);
>>   
>>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index c02053948a57..5e4ea53fbee6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>>   	struct mutex freq_lock;
>>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>>   	bool freq_ready;
>> +	/** @power_profile: Base or power_saving profile */
>> +	u32 power_profile;
>>   };
>>   
>>   #endif	/* _XE_GUC_PC_TYPES_H_ */
>> -- 
>> 2.38.1
>>
