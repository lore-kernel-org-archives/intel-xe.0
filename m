Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4C2D59D78
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 16:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C3010E08F;
	Fri, 12 Dec 2025 16:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crWOF4Wj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEE910E08F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765557192; x=1797093192;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5SCwzjRRSqb5uFOVGufpPauRmsN+DwEQWfKm83IgKao=;
 b=crWOF4WjSGjLWTDQJ7qHCDsxGowe/+2GfSOo55QFTDs9WHcZruINqJkA
 bMCXSez+aCel8l9XmbyRsMiio+ewe8OqbyFOZsRPB2crQEoXCXS+Sb1/j
 /GCATVbhwoplnnmo9LKmhiQvZ+IuZfaZ11BqNDRBKDuPLZCuesy+RpwEk
 /L5I/qS6/R0W+NpdtLQqk1lTUDRaa2f+AgjmRbGQAcq11HVcp9D9drwqU
 KtHJ5uYOsQXcuuQle5OxHa+fZ6zpAPwHyCtFz0el2fa7LgUs2iorvNeEQ
 w5VJj3Ko4mwQd8wwsCkA9k65ezXgQps07n+L0aZZjxyS4EzxWgvSbIWGF Q==;
X-CSE-ConnectionGUID: /Z9+8nqARA2ZXQ1oKVoGjA==
X-CSE-MsgGUID: Mj7VVruXT5ihC1mvZQXLkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78199833"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="78199833"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:33:10 -0800
X-CSE-ConnectionGUID: Arlc4tg6SXeJGLcwlQwFrA==
X-CSE-MsgGUID: OvfIfRmWQ/SB5YnAAqn0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="227796049"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:33:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:33:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 08:33:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:33:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fR8TBywCpNOUIM01Yj8D65lt7TCy/ajTrAn7WinQoXVeu99Vd29qqLg76/PbhwA3Xze+88BKsEJBjEFFHGSaXzT6ky+mo7E1zxrvZrhW/iIQFWqwTMiZF1bFP3tEqjuPjB98SBBuKadaEWPmx3Cdb3JAeu0aqd8YgyLbiTS/SgGYuFTwZCnp1TU7YSjHKS/Qh2j+jrF4qFP151l2Mp6TOnDswbXk4ulPJeUkY+HX+UgA27BUWEQcoZGbMd7WA8Zc4DNcexwzqDL1B6r1r9bDCYWAi5JXVg4y/UBqk+kbA8Pq+oEjlJEhHBSdjJDSoEJyR6x1hLkpA++SKUslAFWSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6328wKyAgQt49JFxpk/VaT6XUFWJqHz6rdEwTzxb4o=;
 b=HyPGw8EJb9T+3QZy7QF1Snx8YOyMiSVp9YA1xscIKB7y8kN/kaDjJBjOtfrZ0cnMlGooMv8E6QE5cHdCqAkknSUMLmIx5G4fqn99hDV0euHuuWEq/D07GKcLVZO5tHzontBUgMcbc1503StDW/s6psi1T+yKjMaivGqkwxtfotGi/Qhg/23nYZfPhTlzmaZ65oJEqilVSfHgj9Y8PD5nRxZxyNxk/rsdCBCWH0k4MoC9c/fxOFt4yjvg3EwrEivsDqrc2etMg6V2p9a7kpYtl7Wlt7w89PEwYG6+P+eaocyVZmnV9lX6BHphC3CQStUbHBVrKkWNlSzDEigXShhFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:33:07 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:33:07 +0000
Date: Fri, 12 Dec 2025 08:33:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Wait on in-syncs when swicthing to dma-fence
 mode
Message-ID: <aTxDwLgkmycUKk+S@lstrano-desk.jf.intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-6-matthew.brost@intel.com>
 <97f524d334045e0819cee861e6e7d21598509424.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97f524d334045e0819cee861e6e7d21598509424.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9f7308-2953-4a02-bfb5-08de399c214b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGxzTTB5NTZLUytKdVRyaXdJYWJ0VmRWTEUyMmlFQTN4YlJtMGxxWkNPdXRr?=
 =?utf-8?B?OHlRZHVYblJkTkgvL1VqRlNyTEtvV1F3Y3hJdnVHWitKOTB2cHNtNGlTRU5i?=
 =?utf-8?B?Q2N1MmtKdW9BNXFTWWJPbnlnWnBmaTh4aUt1N1A2ZC9xVmU3ZHVMS3duUlJV?=
 =?utf-8?B?bWNqQS84ckpja1RNQ3hMeUV0ZkNKVlYzRFNuajc1TXcrMTZXRUdIU3VxRVFw?=
 =?utf-8?B?d1JabjlVNC9pNzRaMkVjL3NZdlBjQVNTVWN3QW92TDhwRlR4MmFvQXpjUTBL?=
 =?utf-8?B?NkQwNGQrYVJSUlFDdGd1WmpjNmpra3RpY0t2RHhRSC9sS1NGeTBKV1hySnBs?=
 =?utf-8?B?cjhFcFM2Y0VoMnkvTmV5VVlXMWhncGdBckZ2MzBaNW42WVlicGxkTWxheFdq?=
 =?utf-8?B?RVczdC94VW4ySytUbDVreUpydmdmY2V3RjNiaDhUdzVQUVlmcHRSa1NPWDJn?=
 =?utf-8?B?SjhqVDNDMFNhMGc0Wk1WSGJoWndwYVg4d1hLYjNNeTJ2dWkwejhWZVR2Tm14?=
 =?utf-8?B?YUZrSXhBSkNES0RlK2xDVlhNd0VGbXlRdkE4cVpWL1FmRHR2TVovTzlCQXdI?=
 =?utf-8?B?eE44blRKcElyZDY1NGlRRXI3SE5KNDgwZ1JEZ1hJY3FCWDNjbWxoNnFkVytw?=
 =?utf-8?B?LzE2bElmZ0tDNGNSSVZmV0UxRjRuNXMwYkpudUlHYmJsK0Jxa1dsM3ZXNHdm?=
 =?utf-8?B?QXlhd3B6ZC9FVExiYkVzWGZIVXNXNmpzLytsVHVKVjlnL1RZU3BSSTJwdFhF?=
 =?utf-8?B?RXN1VmoxVmpJbHl3ZkJ5ME1mbUZmTHNNTGZVcGtPVkRLQmhIc0ljM2JHY3o4?=
 =?utf-8?B?QjZlSHpXWG5wbzg4aEZJeFdveUpQVGZPbkFzRVhNYmVnV21jeFp2Q0hJSFZp?=
 =?utf-8?B?bTNGNEN3bkdZUjVzV3JPemlSSC9mb1JQZG5seHVQRDlNR09HQ3loeGdYdmV6?=
 =?utf-8?B?bnlyc2s5NDhBWnJ6SkVSdklRME1GdklKR0hIajBxaTlNRjY5THdVaytORE9L?=
 =?utf-8?B?K3FKYitad1NkdDhhVmxLMk4zVVpvWWUwdERBbzlzb0p5TU4xcm5UcU1ibktq?=
 =?utf-8?B?Y1MwSHV1cUxiQkZtVjFQVWZRTVNaTVhUUjMzSWd5alRGVXJUR3pSOGVSdVV2?=
 =?utf-8?B?QitLV2xMMU4wL1hPRFV0Q3BOS0ZJV2J6WmEyVHlIQ3dxeTY4VzBCUDJmQmNH?=
 =?utf-8?B?amZXNzFwajdoclFsWkhybXQyMDhtMGMrR1dtMkNObTRrY05vNk8veXZ3NHo5?=
 =?utf-8?B?NGZTTk03VVRod05qTVdhTHZudllVc3krMG1VVVB0QVovQzRrZHVManlyOGJa?=
 =?utf-8?B?MXV0bXhDMFVEOFB1U1IyOUpmS3VUT0pQME5PejZ4TE5JcWhNemhhaEVzNmdt?=
 =?utf-8?B?bzZHV3hTc2RQWFkvRnBlRCtGd3pLYithZXFLSjZhZ1hHVGtnWjFwWjdkZnpY?=
 =?utf-8?B?cG1FK1FLNkdiejRLSG5sZUh2SzBINEtIVWNXWGR0cjJ3bDU0SlRtWUJpQ0cr?=
 =?utf-8?B?TWxiTFJpcFZQbVJySS9WL3NCTlA1VEJEclZUTHo5VnJOUVVFMlpHckFKQ0Jy?=
 =?utf-8?B?WnhwdE1UZ0Y1OW5helBiTEdIdC9ZYW4xVjVZcTBIUENoU25XWVRkZ3NKaWRD?=
 =?utf-8?B?QklMRWc1S0ZVOTBoVU5sNnExdjh3S00wMjY0cnJ1dUdaUjZLS21Hdk5IVXo5?=
 =?utf-8?B?MnpObTFIOHhxc1FSV3B3bnlxWFpGWERTK3RwdmJ1MExHbmxRVCs4MklMbllZ?=
 =?utf-8?B?Q0tnUmNYZWNvRUNHQWovYTRJSHppdk5YRFZZRjZiQXlpdWQ3K1RwYnV5MkxK?=
 =?utf-8?B?bEZjM1VTaW5VWnI4Uy90aTljUEpSY0hmVmlaWWJRb2hwQVFGNUxBMWZRWC9C?=
 =?utf-8?B?UUNPNXR4TzZVRTljbXhBZEpHRFp1eWhEM1RnYzhqNkFGbTBJVGFBRHVhdXVt?=
 =?utf-8?Q?rBDOa9N8lC8tgQWPpSLqsWoBDHB3xchk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1dOQ214azdKenVNZ1pYWTRCdjNHeUNRUjVRYkxFS3E3N01yemd0RmNNcFp3?=
 =?utf-8?B?YlJFekpydW9qa3pPa1hSWHNVNThqQ01uN2dOb3BvWVV1YU5FOUxDd3ZWaTFa?=
 =?utf-8?B?Wk5EeVVuSDNLTVJsK3dYaDVLTml3dTlBTzhDZ3dsQldVYzVyUFA4T09pV05J?=
 =?utf-8?B?YkNKRGVnS3A5WjcwWjFDVWlCWjZJd0NlR25Ta3haYzcxcTFGcmdGNXVya2JM?=
 =?utf-8?B?ZXhRbGlDWEo5aDROZkVtazc0c056bzBWWmhqb3JOOWY1N01zN3k1UHBQbURE?=
 =?utf-8?B?TDBWenFpcXJWaVFzWkMrZmptcnlFdUZCbzR0YTdWTjM0V2Y4TGNjeEZDWXV6?=
 =?utf-8?B?bjdhYkNUZ3B1eGUyTEdMVWhGa0lEcVR4SVEvN3Btc1REOGJJQ3d5U0hYcU9u?=
 =?utf-8?B?STNtUUFrRkxVak1jL1FwNG9Vak8rMmw0RktCYkdGTVBIU0VqTEo2eTRQM3pN?=
 =?utf-8?B?S05kdUlwdUE0bDNyUnhSRUNWSzYzVVllMGdJSEREMTNWLzR5bDZFcXc5bk5Z?=
 =?utf-8?B?NkZLYzJwOU1UQURMSjhhUTBaMThYVGJyV2FoblNwTXpZWkdjZVN6Zm9SOENC?=
 =?utf-8?B?b3htc0dVekNPQ295b21UQXplMmRIQTY4ajhpeXJxTit5UWVPbm1CSHRTMHFo?=
 =?utf-8?B?Vnk4b1llckIwdHhWMFBuZFdkNjdEaWdrQ0pCNzhuUVEyL1NvYnpjOUtKdnNo?=
 =?utf-8?B?ais4UkhyZmJZdXUrUnRDNU96ZlNqYzBIR0cwdlo2MGhUWEFsUkNLWnNNRGw0?=
 =?utf-8?B?RE9yckxSK2psRzNUdERJYllvbWVvcUhaNVlxeGZjU1NvK01kVnFIMDM2WVl5?=
 =?utf-8?B?azcyK0hpWkk4UGNmV1FYeW93MGFkbTE0bXViWlNSa2xCWVZmbWdMajA1Z2ZW?=
 =?utf-8?B?bzFGOEFqMmpQWE1qanFCOHBTb21ieHlNRHlRaHg3d0o2anE5Mjh3Z2d5clRK?=
 =?utf-8?B?SlV4L3cwSW1TK2pWeEpnWml2WUNlTVFHMUpFcFk1R2pQSXkrT3NEY1hhdkw5?=
 =?utf-8?B?Y1pERTJPdWFSTlFsUFB6VU5FeXFwWlgwdmxxZmVsblZ6cytJM3NVNnU1ZWY1?=
 =?utf-8?B?SEZXK2VsSS9Yc2l1ZkJhZjZWamYzajVMeWpTak5SeG8zZFRVV1l6TldJdEVZ?=
 =?utf-8?B?c3prR01tcXJoWG9QL2hOWEhZMDZPK2RrQ3Y4UTg1WXh3eGh4cjRERDFIV25L?=
 =?utf-8?B?eGF4SkxHeFFWVjNaU2d5d3FOa0IrVWxTdDU5V2pLVlA1NmRic2cwMW9WMnJo?=
 =?utf-8?B?QTVHaVRGRUExYlBrRHRVTVB6THM0ODJQbHNPVzZySnlFSlcvL21ZM2Y2TmRE?=
 =?utf-8?B?SENQMWlhbkVTL3NVYy9vZmRPLzg0aktveHVSVXJTTmhzRmc0NXdiMUJHSnRB?=
 =?utf-8?B?QjJQSFRIM3hHZENuYTZoSXNlQmE2Zk0xMFNzd3VxSjRGM09ibVlLWGZaMkNz?=
 =?utf-8?B?Nlk3US9KZ2NUN2R5YXNKNEVhdTlLVzhQemttYnljZk5Kc29UUldUUnRRQjVU?=
 =?utf-8?B?TkE0dXBPN0xWS2ZaOUx5NDVUUmd0aWFIZ1NISERHQVRKa2dWY1ZMMDlZZ3ZI?=
 =?utf-8?B?MjJPZmgreklmS1dhOEpTY0RFdlpsREVqTmxXV3NKNUV1bFFZMzEwTXJzREYy?=
 =?utf-8?B?V1dZOW12ZjA1cWlGdG0zUU1yRWNLQWhWSVBjalNnVC9jV2JiWWR5SDdNWktB?=
 =?utf-8?B?U0VscGJtWjhKbGJkZTJLRHVjMEhtSkI5c3NETTNGY3d2aWR5RE9IdmxxK0JM?=
 =?utf-8?B?eGExZkFlYnIxQmx4Kzl3UERYdWk2Y2dYYzJJVTFEMmFzbThqaGYzc1YxUXpj?=
 =?utf-8?B?SytmakRub3hKSEZQZFJFTGIvWXFrb2xkTGdYV0ZzQ1ZXZzNjRFkvK1BTSFdE?=
 =?utf-8?B?N1U1bzVmMFNuTlNzYTNWOVJ1N2RXdENvMFlUa2lVV1NLY1NETGdxZkF5Y3NQ?=
 =?utf-8?B?OVlpcFhmOXVPbm10SnB2aElCQ1lGblNOZlVRdmZDaFhxK2ErMm9wRE4xSCt3?=
 =?utf-8?B?RUVWa2tNamRRajRHcU01RlpsdjlYcnVIQWFVNFBsb2pSMVdIbEhNekxOd0tL?=
 =?utf-8?B?TjFaeDRHS0xZYmVJbFc5RjQ4ODFWUWM3dkVEU0pjVVB3eDhFUElSTkFEdEFl?=
 =?utf-8?B?OTU3L0IzNWs3K1pXcEdBTjJyZTAzeEwvSURpUnB5M3BGTkxFMm5nUmtVRElL?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9f7308-2953-4a02-bfb5-08de399c214b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:33:07.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDQf3JSyxi1m1X3stWoJ8j1XYzj6CZX6aQQUFLElFvwOjQEV8UCaSAxDrYXlLtYn4WsX66+2VYCrjALGVuvpQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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

On Fri, Dec 12, 2025 at 10:22:54AM +0100, Thomas Hellström wrote:
> On Thu, 2025-12-11 at 13:00 -0800, Matthew Brost wrote:
> > If a dma-fence submission has in-fences and pagefault queues are
> > running
> > work, there is little incentive to kick the pagefault queues off the
> > hardware until the dma-fence submission is ready to run. Therefore,
> > wait
> > on the in-fences of the dma-fence submission before removing the
> > pagefault queues from the hardware.
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c            |  3 ++-
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 34 +++++++++++++++++++----
> > --
> >  drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
> >  drivers/gpu/drm/xe/xe_sync.c            | 14 ++++++++++
> >  drivers/gpu/drm/xe/xe_sync.h            |  1 +
> >  5 files changed, 46 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 4d81210e41f5..5bc598ba6afa 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -202,7 +202,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  	mode = xe_hw_engine_group_find_exec_mode(q);
> >  
> >  	if (mode == EXEC_MODE_DMA_FENCE) {
> > -		err = xe_hw_engine_group_get_mode(group, mode,
> > &previous_mode);
> > +		err = xe_hw_engine_group_get_mode(group, mode,
> > &previous_mode,
> > +						  syncs, num_syncs);
> >  		if (err)
> >  			goto err_syncs;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > index 4d9263a1a208..35966889c776 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -11,6 +11,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_hw_engine_group.h"
> > +#include "xe_sync.h"
> >  #include "xe_vm.h"
> >  
> >  static void
> > @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> > work_struct *w)
> >  	int err;
> >  	enum xe_hw_engine_group_execution_mode previous_mode;
> >  
> > -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > &previous_mode);
> > +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > &previous_mode,
> > +					  NULL, 0);
> >  	if (err)
> >  		return;
> >  
> > @@ -192,20 +194,32 @@ void
> > xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group
> > *group
> >   *
> >   * Return: 0 on success, negative error code on error.
> >   */
> > -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > xe_hw_engine_group *group)
> > +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > xe_hw_engine_group *group,
> > +						       struct
> > xe_sync_entry *syncs,
> > +						       int
> > num_syncs)
> >  {
> > -	int err;
> > +	int err, i;
> >  	struct xe_exec_queue *q;
> >  	bool need_resume = false;
> >  
> >  	lockdep_assert_held_write(&group->mode_sem);
> >  
> >  	list_for_each_entry(q, &group->exec_queue_list,
> > hw_engine_group_link) {
> > +		bool idle_skip_suspend;
> > +
> >  		if (!xe_vm_in_fault_mode(q->vm))
> >  			continue;
> >  
> >  		xe_gt_stats_incr(q->gt,
> > XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > -		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
> > +
> > +		idle_skip_suspend =
> > xe_exec_queue_idle_skip_suspend(q);
> > +
> > +		if (!need_resume && !idle_skip_suspend && num_syncs)
> > {
> > +			for (i = 0; i < num_syncs; ++i)
> > +				xe_sync_entry_wait(syncs + i);
> 
> Here we're in the write-locked mode, right? Ideally I think we should
> just check for idle here and return a retry if not idle, and wait
> outside of the locks. Perhaps also always wait if there are pf jobs

I think waiting outside the lock would be okay. Let me try that. I also
forgot that xe_sync_entry_wait needs to be interruptible too.

> running on the engine group. Also we might want to include the other
> implicit dependencies as well, like kernel fences.
> 
> Although perhaps this is good enough for now, and this would be easier
> implemented with a scheduler?
> 

I think we could reimplement the entire sharing algorithm via the
scheduler.

It would be roughly:

- Switching to PF mode is a job that waits for all pending dma-fences.

- dma-fence jobs wait on a job that flips to dma-fence mode. The
  dependencies for the flip job are the input fences of the dma-fence job
  triggering the flip, plus a possible outstanding flip-to-PF-mode job.
  However, if the flip jobs are scheduled on the same scheduler instance,
  we wouldn’t need explicit dependencies between the two types of flips.

This is a fairly large rework, and the likelihood of me personally
having the bandwidth to implement this in the near future is low. Of
course, if you want to take this on, I can provide guidance on the
refactor.

So for now, let’s tweak things to something we can live with and perhaps
write down plans for a long-term refactor.

Matt

> /Thomas
> 
> 
> > +		}
> > +
> > +		need_resume |= !idle_skip_suspend;
> >  		q->ops->suspend(q);
> >  	}
> >  
> > @@ -258,7 +272,8 @@ static int
> > xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> >  	return 0;
> >  }
> >  
> > -static int switch_mode(struct xe_hw_engine_group *group)
> > +static int switch_mode(struct xe_hw_engine_group *group,
> > +		       struct xe_sync_entry *syncs, int num_syncs)
> >  {
> >  	int err = 0;
> >  	enum xe_hw_engine_group_execution_mode new_mode;
> > @@ -268,7 +283,9 @@ static int switch_mode(struct xe_hw_engine_group
> > *group)
> >  	switch (group->cur_mode) {
> >  	case EXEC_MODE_LR:
> >  		new_mode = EXEC_MODE_DMA_FENCE;
> > -		err =
> > xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> > +		err =
> > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > +								 
> > syncs,
> > +								 
> > num_syncs);
> >  		break;
> >  	case EXEC_MODE_DMA_FENCE:
> >  		new_mode = EXEC_MODE_LR;
> > @@ -294,7 +311,8 @@ static int switch_mode(struct xe_hw_engine_group
> > *group)
> >   */
> >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> >  				enum
> > xe_hw_engine_group_execution_mode new_mode,
> > -				enum
> > xe_hw_engine_group_execution_mode *previous_mode)
> > +				enum
> > xe_hw_engine_group_execution_mode *previous_mode,
> > +				struct xe_sync_entry *syncs, int
> > num_syncs)
> >  __acquires(&group->mode_sem)
> >  {
> >  	int err = down_read_interruptible(&group->mode_sem);
> > @@ -311,7 +329,7 @@ __acquires(&group->mode_sem)
> >  			return err;
> >  
> >  		if (new_mode != group->cur_mode) {
> > -			err = switch_mode(group);
> > +			err = switch_mode(group, syncs, num_syncs);
> >  			if (err) {
> >  				up_write(&group->mode_sem);
> >  				return err;
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > index 797ee81acbf2..8b17ccd30b70 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > @@ -11,6 +11,7 @@
> >  struct drm_device;
> >  struct xe_exec_queue;
> >  struct xe_gt;
> > +struct xe_sync_entry;
> >  
> >  int xe_hw_engine_setup_groups(struct xe_gt *gt);
> >  
> > @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> > xe_hw_engine_group *group, struct
> >  
> >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> >  				enum
> > xe_hw_engine_group_execution_mode new_mode,
> > -				enum
> > xe_hw_engine_group_execution_mode *previous_mode);
> > +				enum
> > xe_hw_engine_group_execution_mode *previous_mode,
> > +				struct xe_sync_entry *syncs, int
> > num_syncs);
> >  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> >  
> >  enum xe_hw_engine_group_execution_mode
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 1fc4fa278b78..127e26129933 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -228,6 +228,20 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > *sync, struct xe_sched_job *job)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_sync_entry_wait() - Wait on in-sync
> > + * @sync: Sync object
> > + *
> > + * If the sync is in an in-sync, wait on the sync to signal.
> > + */
> > +void xe_sync_entry_wait(struct xe_sync_entry *sync)
> > +{
> > +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > +		return;
> > +
> > +	dma_fence_wait(sync->fence, false);
> > +}
> > +
> >  void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> > dma_fence *fence)
> >  {
> >  	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > b/drivers/gpu/drm/xe/xe_sync.h
> > index 51f2d803e977..1c08f9ed9001 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -29,6 +29,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > *sync,
> >  			   struct xe_sched_job *job);
> >  void xe_sync_entry_signal(struct xe_sync_entry *sync,
> >  			  struct dma_fence *fence);
> > +void xe_sync_entry_wait(struct xe_sync_entry *sync);
> >  void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> >  struct dma_fence *
> >  xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> 
