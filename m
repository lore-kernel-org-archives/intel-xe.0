Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04896C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDE210E9BD;
	Thu,  6 Feb 2025 23:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oxz5kTP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7383110E9BE
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884534; x=1770420534;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vh8ygxfdmlGKP8VfXcUFTt7bl2o8CaHR/NFVq/Fz2TA=;
 b=Oxz5kTP3Wb+d1+Xvv7cxolHl+xgH7uG6KOVnicFcA2F/M9pbAFSBsSaL
 BPfar7egJnUrqfiEmFhmO0dhsoeI3nwXc4Aw91Boed/zuLma3x6eJyrTU
 Y6kPEDMq4kftzIa6Ak73KFiwM7DISAPlZUFqGmxuJFfzN+GtwI1YLWgR9
 lqiVFInTW3lhBxGj5dWWUlGG/ariyEThXdwKd6AmsTqemwMs5HbUs5cdc
 owQUL3LUWNUmYCOVNGPDWVg2/5Ac3OxM9sdknqo5AQ0QQ+dTWKSbCK6nX
 H72vAG567G9Osg/ycSHrMRY7w7JfDyKrK08PxcUD/4jQJcXjX+3P0nx6s w==;
X-CSE-ConnectionGUID: gD6Tp6N3QbO0CNGhsCRBrw==
X-CSE-MsgGUID: DM5Ryhn1RkuuYkDkGGRRZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50947605"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50947605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:28:52 -0800
X-CSE-ConnectionGUID: UEkz3BfAT529NmUgeAoBoQ==
X-CSE-MsgGUID: FYMlLV1oRyKX6YFF/Cz2DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111135563"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 15:28:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 15:28:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 15:28:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 15:28:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBXL2/EDw7BRlNFkFUyPF+qHgX/8QVNweIf/Z62glfg3ky7Afsxvf9IHCJS14LHAKe+7x9IyCeOIDYaLR9gSgg8LCMH/2EcLwju8VprYREphsK8/KYJbot8V3tWxCxcVVq58tfK20a9/Sjoz6eTDZfvGYV/EQj4qt7CkOhzajZyZKiIm+ungDnFZfli9Md/XXi7+8ZhDyCzkuGpIC1gsjNcZ3knE3HMVzLIdSaAZas7s782I6lP7ArHLwzYiQZ4UWN8DQDcyioCsSaOlY7HRLByZ6uyDEw/SAqG9V+98FaBkrvWHNMnC0JHjMHAs9PWKKBaZ9/VGlug3fvn/xlTW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk+03W2BbpNdvweDgEybmiYAuDsNdf1KcVdit0X2KIA=;
 b=qWC6sZ5ycUciKd7AP8Ni5ysjKWd9edvhcEcOPUSqMqS0z/FUzefnRj3loyKs3ifGmZASYyrDvLUuuipmxvApGm/DYjCbaFlYOh0CO/hl6CYNvdhT2y++vGHLDC7NiDX/mTcxWPLCekiiYbElrD2j/ziEUykaoH/xbmG2GVb0M0hgb6LBY3cnZCA7PG/13BFUeIaoRi3TWqODgJFy9mcYCKauiXtz0u3ASmCOMrUH/KF65RvrpS+KGJ7XgJ+ONmjY0DqUGFYYohWVVloWtjVCQFZgETgly1BnyxNUsQwtm8kou02BRsNYYZ7hAvvZEE+iOuCFk5btcEaNzwNnUsNg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 23:28:22 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 23:28:22 +0000
Message-ID: <d9fb9b28-9875-45a4-92e5-d29afeeaa5ed@intel.com>
Date: Thu, 6 Feb 2025 15:28:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm/xe: Remove leftover pxp comment
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
 <20250206232333.2660325-6-lucas.demarchi@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250206232333.2660325-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee9473e-8401-4540-25da-08dd4705f25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFN3NzVDSmtkT2hXemZ5bmJXdkp0Zm1LVVVUZUdLOU9uVk1KeFNwSG9SWkIr?=
 =?utf-8?B?ZE5TU3p3ZWg1OFUxUXRDVlc5N0o2YVNhc3RhY3ZiZWc2RDdKWXZ3QXQ5R0ky?=
 =?utf-8?B?cGQ3Q0NvekZHUjZxaW1zS0lCK2xXYit6S3V1SThPWWUzajV2ZWNvWDVyQzg0?=
 =?utf-8?B?OEZBRkJBVER6RHNwS0RWNWFFVXpNVHNwY1ZwZ3RsVEJ2TGRWTDlsZFdTODht?=
 =?utf-8?B?VWdTb011dmlIT0E2d1pHN0NCWDRvVEcvYVhmbGJDQ21IU05EQnJWVFBUeGZ4?=
 =?utf-8?B?Ym1ZUG5wV1BwQ2tiS0IxcW9WdTNtdHdiSy92aFZtMHVoaXZJNFltaU00bEtI?=
 =?utf-8?B?VFIyZFZwaUpnOWxoN3doaTNkNi9XWW5LekxoSDUxaWFrL3Q5amlzSTVsTzgy?=
 =?utf-8?B?K3lDTk4yT2tpcGx5eG9obUdWWHk1YzdUT0xZbmJtemNoT0pnZDgyVHhXM0h6?=
 =?utf-8?B?K05Nc3BPWStFQ3dUaWtzUFlZTUMvbTV4MjkyUGtQbEtLNG8yZ2ExaU1vWnY4?=
 =?utf-8?B?Z3YyODF1bWFCdEE0N2hsOExXSnBXc3I5anBNWUM5T2VuQ1hVbk8vcVNzS1po?=
 =?utf-8?B?dXBScVBJUTZBVjVtd1VnQlRHenMzTXBNajYzRjFRNlpScFFMRTEyVmNKb1BG?=
 =?utf-8?B?M014SkxwOFErLzgvZ1VxRXIxeElvKzR6Rnd4Yis4QnB2d3pJb0JhalA4c2Fw?=
 =?utf-8?B?akFxUFZJekdIWVM0ODFjdjFKeUpTT1UzZnRqcitDUzY3SElLVk5VdkNCUkpv?=
 =?utf-8?B?ZUszUWx2U2dEOWhoU214VmxqQVViNW9MMWRVTXYveDBGandYUUh0dnY0bms2?=
 =?utf-8?B?eFo1RmFvR21ET2U5bm92cGpwUHFOZ0ZKNjRySng3dW01cUpJVTU2djlCMk8y?=
 =?utf-8?B?cy92cStMdXErNy9XenhObzBHZ3RZaUFjQW4wd3dvK1dENnNVZno4M1FzRzh4?=
 =?utf-8?B?UDFYMlpKTnBtWE9ZVmFnY2NrNFBsZWZSS2JlUlZvZXBvbitXNk1Tc2tYZHFI?=
 =?utf-8?B?QU94QmFWZERvMW9CYVNNMGV5ZWJOb0FOWExMaHlNWE9iMXRtbitSQklTNVR4?=
 =?utf-8?B?dnN0Y09pem5VM0NMWW1wVlpYZW54S0hReWhSN09Gbmg5UFRUdXEvam54aUN4?=
 =?utf-8?B?QmE1UHZkNGtFNjQwTnNsZkJqbG12RjBPbVFkNDRYc1Z2cDhFeTFxSjNSbGxa?=
 =?utf-8?B?V2V5dWxOQWhWVTRXdWt6bUZheTJkczdFMnpJT0RvYjVGZldxSE9hanBTR054?=
 =?utf-8?B?YXcwNkhvN2htUDhmWVJmOW1IVmc4ci9aZ3p0QkdOcVBITVMvQit3V0tRcGNp?=
 =?utf-8?B?VS8wbHRGU2JHbXUwWStzd3dUVnlKNFRsZ3hWc3hodDNXNmd2bzNTZFFIZThT?=
 =?utf-8?B?cWdHYnR1RFhDMjI3QWpXWFBscmJIeHVXVkR2dkV1RW5LNmg3ejBncjZqSnBE?=
 =?utf-8?B?czlacnpQRVhXblcrQUlXU2ZEeHgybGUvY3hhWlJWTCtMK0ZpYXIzQ3dRRFZQ?=
 =?utf-8?B?bFg2WUVCTXVSbHRSeU9Ca3NJemdvZzlYTGtWUU8ybzhTenNTOXkrVjc4c0NH?=
 =?utf-8?B?aVVaOWg5UDJVSDdMem56SjVVVDJpRTc4UWdLS1ZPRC81NzZNb1NmNjlCYnky?=
 =?utf-8?B?UGdJeXpTR2lSR3NEVGY2S0pORmdyTm1iek1zenBCZjZla3NaY0xpV3dLalpE?=
 =?utf-8?B?ckllMXN6cTljeFg4VTlyWSt6VkRrZFRTcU9SdjM0RlVMekduWEx3NnVsT3pE?=
 =?utf-8?B?UkVWV3VsNWkyYjNkRFJYdUczOVNXb3M4bWhkdG9WZFF2Qmhma3plYXZjcFlC?=
 =?utf-8?B?UktLYzFKZkpQcmhHdTNaQmlEdW5NRndEWmRjbkoxQmFkemFUVmZhQ2FrZnh4?=
 =?utf-8?Q?muJzPfACnuo4C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVqTWc4MWhBL29pVDVxR0pTV0lvZldUWUVweFR3L3JvVkZhNlZRUDcvbGhq?=
 =?utf-8?B?RitJZUMwamZrdDNtanNma3RXVmcyUGpNSUpOS0EydTBNSlRVek8zbW1LMVhG?=
 =?utf-8?B?SjBBS2g5Q2ZqbjRXaGszbDc3RHdUVEh0VWhZWndyQWNpWUxTTVNJd1pPT1di?=
 =?utf-8?B?UllQNGxYQ1hTOVRITE5xd3JlT1p4cEw1VTRlcjBLTm9ZT2dYT3hsZVJLWEc4?=
 =?utf-8?B?MSttQ1dMUzFJUnFLY2NLakR4dmRzY29GeEJHZ0dvUlBMZlAvaEFMOUNZd1Js?=
 =?utf-8?B?eklYVWdidm56c3dQU0hOdWYxTWFLTVE0N2htT24wWDlRV2FSS3IvS2U3SG90?=
 =?utf-8?B?VWduM283VjJkNVRyS3R3QitGUzQxZWdNMU40NytNZnUzelR4TkhCOEQ5TXV4?=
 =?utf-8?B?N1YyU3FvSWtydlNMTjJaR0VJaFI2RWlmODlIbmRJVVdJZnN0ZWF6azBtdElI?=
 =?utf-8?B?TjB4WDJ6bGZyWGkxckpqbDZhTFZoTDdhYkduUVliaE8zbGdaYWdkUzh2b0Rx?=
 =?utf-8?B?SktHSGZOeVY5dUdrdUdISnFWdXNIWklSakZPbXhOd2ZqaHR6SkNqZktHaWhh?=
 =?utf-8?B?TWF5cHRUMUtvL1V2czBRT2NIRVc3d2J0SFlvN1k4T3FSeDFxQllKcWVweWcz?=
 =?utf-8?B?Qm83SmlSZzJQV1c3UVNiZG9jUU90WmhXTjR5MGZlNjlLRlFtTmxUMFFKVEpq?=
 =?utf-8?B?cjFxTktiYS9iNFFPK0U1a1Q5MGhOcERhU1V6Ujdia0dHbk1sMTgxNXc4OFdQ?=
 =?utf-8?B?UjB1SWxpYU5PWHNYSWhaTm1tUFl6TWdTc3FjY2VRRWhUT1RiUFF3NER3cGoy?=
 =?utf-8?B?RUtUVjJ6cVhUL0J6V3pKN0tvcEJtNUxDZnZ1YnhwMXRsUHk2VWVvSXptbDlN?=
 =?utf-8?B?OGRKZ0ZLRUtTWkpyOGZCRGRhRjdwbVhjNDFrR3p2eWdWVGx1MFBHVEkzdWp6?=
 =?utf-8?B?aWNhWEJtcGVMam5ObU5DMTdaTm9qQkRpcUN6ZkJhTjh5WDE2YW01UFl3N1Bu?=
 =?utf-8?B?SlNrR1B0S1ZkWXFQQzNrUDRGbmhiZkNnN2kwNjBqVWRPNTYvQVR5eGNwWUxm?=
 =?utf-8?B?SjhjSGhGR21vaXcxb0JMbjNXRUlreHlldUVpeXQwS3puVnJPQXhvY0hqYXZs?=
 =?utf-8?B?U3BzblZTd3hQWmpsQWNxWDNZWU4wVnNYNk4zamVsOFgrUm55d29idy9Gc2Rl?=
 =?utf-8?B?Y2VWUzlPZ1M0c1hnclFlSEpGWlhYNlAzbnorVHNsWXpFTS8rV0poOU5KUHlX?=
 =?utf-8?B?encwc1M3QmhxTVY1c0pLZzA3bU9rUzZTM3AvSW1xZlp1QnZXc0o1YzhwTE12?=
 =?utf-8?B?OTBMRUNOZXVVQjlWaE8yWFVCT2RzZHhxdStDb2ZhWDIvcUNPUGFVWk43RVJw?=
 =?utf-8?B?QWthdUZLWkJkcmlaYzNWK3d4eExjT0hKNHQrVU1mQjBOSVU2YTd6SzNYUENU?=
 =?utf-8?B?bGdOS2JyRzN0UDFnWGpYdWEvMnZjZExyVCtTaGpjRWZySEI0dlhXVFl4OEtM?=
 =?utf-8?B?NGlKSmZGUEhyQ1VJZytWS1VzQ1p2WE9QODNtWVZVemMvS1d3clVoMDJHNUdE?=
 =?utf-8?B?WjVFM0dFUXdCMlNTaUJjWWRLQXhGWFRINzEzZXhLVzRFbHNVMS9oTzZGQ0pF?=
 =?utf-8?B?TUo2SldVckhyRjk3UGZna1JSNzJyRTFtUkJGS3JxaVpId1lnMHNyRGM4S3h4?=
 =?utf-8?B?UysyUzZTdms1L1djMnVsU3NHcm0rbjBybUw3SDNYQjRMN3F4a1BjajhyamZh?=
 =?utf-8?B?US9qYXZ1eURWWVJXb21YVnBKVXRaTGdrUHd1Z2R5QVhsK0x0bXoyTXdGUVJi?=
 =?utf-8?B?Sk0vcXJ5Tjl1RmVOTlNwUml1TFNVV1hqNHYySG4rdlJLMHpWNGwxcis3R3Qv?=
 =?utf-8?B?bEJuOHZwbGROM2pZUzZFdU9seWR3V3pZbXcwYUI0ME1NUFlaanNjajRFYkw1?=
 =?utf-8?B?dkE5Y0dLOFJrVEtubC96RmZYR1VqL0V4Zi9YenJ0YzhtM1cwYTVxTThHUkU0?=
 =?utf-8?B?RC9abmJDYVI0T0k1UkY4Q0R3UkVkRkRCYXQrL0xTdS9mUlM2b0ttOCs3bDMw?=
 =?utf-8?B?bWlRRnhVUHd2RGx5K0Z4TkJSVDVOaEFYckZueENKb0puaUlBcGppM2hsK3hW?=
 =?utf-8?B?UDA2aGFiNk02RVNJdE5TcWtxc2tTYXhsL3MzeXl2UkpQLzJoRXRRak0ySWc1?=
 =?utf-8?Q?8sBfO1vpU4dnV/YxapoEouQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee9473e-8401-4540-25da-08dd4705f25f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 23:28:22.4535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etD53+XGGRo6kzQWYj+Qh+w5xMBUteywEqd5KjwUN5M0U57pfWeBMp8okF2l+Ae2B5bdL9TP64rRnFtrcyUuK0ju+4c5EbSS9ebg3e708Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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



On 2/6/2025 3:23 PM, Lucas De Marchi wrote:
> Not being able to initialize pxp is fatal if the platform is expected to
> have it. Update comment after commit 9c9dc9ba4a00 ("drm/xe/pxp: Fail the
> load if PXP fails to initialize").
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Oooops.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_device.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9c97f88bc0455..90275531653fe 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -869,7 +869,6 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_fini_oa;
>   
> -	/* A PXP init failure is not fatal */
>   	err = xe_pxp_init(xe);
>   	if (err)
>   		goto err_fini_display;

