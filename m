Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E047AD3B9A4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 22:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DEF10E221;
	Tue,  9 Dec 2025 22:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7NJLdcR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E410E221
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 22:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765318731; x=1796854731;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HPBiInny7EJu+J9XY56E6hbJj0hBeFp/euht71FAbRY=;
 b=E7NJLdcRlc6fBC6/qJLOTDSHYgVZgL+g81hTZ6Z4b43DfAFM6+2fsff8
 ViBWUD3H/Poq2C7v/DjyVkRctb2KG0QmMbH5r8ojYZj21czr6sLYBDUWU
 GnBtaNzZBZf9Yl6Z3uRACCzZR0il/cwCHPpmLN4yB/1jicOCxmkbZaQPU
 uhhVhHm1woriZHds1gazIKo2YHP70WtBSBSQPOSqF4xG8U16EmOamaqCf
 03Dn2QGQ0Xsg9ic6/2Yog1qm/qB/zSgpOGBQd9OxhiZO0ggOYCQ1qE/TQ
 uADTa6cnzbBgtovpF/XyPULtlZKQeTkQ1HLkjCwlUlUdEvP3C0MfSM0m2 Q==;
X-CSE-ConnectionGUID: V6qoQNNTTW6rHgn1UdgBDg==
X-CSE-MsgGUID: 2kLt/rrVQ1W7m/psNm4SAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84891634"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="84891634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:18:50 -0800
X-CSE-ConnectionGUID: tP7DuHDKS2iW2lO+AXeETw==
X-CSE-MsgGUID: w++8EJwBRr2h7KnzOY1saQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195416903"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:18:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:18:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:18:49 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:18:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUf+Pfsix42wZ1j4Rjz/zKSlRpYcoMjufCbXpRs6A9pRlyBhA2X8DCH9hMm2V+KhJ7t2wwJpHIyPGnnfkZUE+zwpD5JKBTSKojwCvDfxi4LGQNAsmAIwPAsPS9wbQd7HAUyTBdk9BatOosyHJT39i3+lmbbu3g7YaBarn+YI3+67xNJ7XuVDSlfbl+n1yrYTbxaEXy/pFSlZSkhZtPZrjaskdCVMA1/ybG588EtIhIr5S9lK2v8ckmqoqzqhDAghiBoIDnpnpczdvCjxhMs/Z7wRuNkOc/sUI7O1qgP0Q/JZV9I/yaka/Dkf9of93snYnWaRr/pxi/tkFgQz+gFWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pfxd0ZtsLmy9/MP1Nu41LkwGJ+iivLNeCS4YxPw5SbM=;
 b=DvHVdzmmQ/UJBeJPVjhE6HjVHyJOckWjqnuc6Wbl6b1FD9SwlJI5DFNpedZrhU0WWlOSPEyW9vJuIJux9uJ09fgPYpYkiag/+EQEJsy7YzDeLViDlw/wKbOBBB0fSWQ1noAW7KkctLML2bgXRKGvwQgSLNd4SMfk3V7wqumWH/5nFktRJkoKKZT5J23Zcg3ae+5pUbnan2sUQnFc+bZ0q35ETsMyIPY8WK/ftkUF1uBritWRnsbRInkU2eK6FFCNp3c1cS1sqD4XGRksFoUKv58eixOJ6bDj9uVPgt2AJsKaOk6TEJBpuzyDSqPnoQOhl2TlcQHMDBCHm4FOej0s9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8571.namprd11.prod.outlook.com (2603:10b6:510:2fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 22:18:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 22:18:44 +0000
Date: Tue, 9 Dec 2025 17:18:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/xe_survivability: Redesign survivability
 mode
Message-ID: <aTigQCaBhfhu-LN7@intel.com>
References: <20251208084539.3652902-4-riana.tauro@intel.com>
 <20251208084539.3652902-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208084539.3652902-5-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e527c3-9ed7-4372-7e93-08de3770ea23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkFzeFN4dG9TZDdYU0k1cEhSL1JFdlRSY2dJMjJPeFI4ZDNqNmVLRHU4b3dx?=
 =?utf-8?B?U2VPTUYzc0JwcnJ2YzBrZmE5SU1STHpJTC9GRGpBaDJKalpvK3o3R0Jicmlh?=
 =?utf-8?B?ajJDMkdmS21paFBtNHorcmVlcTcvMlp6NEN6QkhpeDMvVEhQbkNMdklrcjFa?=
 =?utf-8?B?cGd1dDBpNTVjSGZiL1JIc25iclFiUmJjTTNJZFVoSmlIbFdGbGxTWDZ3bnlo?=
 =?utf-8?B?WERYcTJnVWE2R0RJc09aTS9mTUZHQ0poMHlGbVFGUGVRdS8rbzJKcm1oYXNz?=
 =?utf-8?B?TDY0cFR1TmplVmdxVHl4WENTaTNZdGQrZGw3c0MvZEFRQVNTM0E3Y29uOU9n?=
 =?utf-8?B?aVhIMDVCU25oZWdpNG93dHFEd2pJM055WVBYTXI2K0Q0SUMyNlhORjEvdVVU?=
 =?utf-8?B?TlVlN1hxNllDMS9GMml2N3MwdUZEWWl4by91Nms2OUxIVHgrYmh4VU9mOW1r?=
 =?utf-8?B?R0hITEtBV0xVSVFDRS9oWUcycDZRZ2ExbmsvTExnaHorM3l3c25HeDR5L09w?=
 =?utf-8?B?b1grMExtaGVUand6WHFvRlhkblhsZXlobzhWUnUyaTNNUUVUUmdsOTVuUHV0?=
 =?utf-8?B?YkhYbkl1UE1aRXRuU1FveFRTb2tiL1VrQW80RDI3MHAvOVM4TzNPemdDS3or?=
 =?utf-8?B?SFVuOEdyVzFidjNUWldWRFB0bEFQeHZ6SHVvRWIvSTBwQ2tiMi9ZV2RkbTRX?=
 =?utf-8?B?cnNuaFJzZi9nQ1NYMnk0RzlGL09uRjlQME1xOWthd20wWWtvR1JrL1RqYlR1?=
 =?utf-8?B?dWhzM0Yrb1dFS3gvTVNFU1JoaDNtcTJuc1pZVnFWN01GN05uSjZnODRGeFlx?=
 =?utf-8?B?djFjTWZ2L1NweEIrSXhQa2U3ZWtHZHlYOEY3VEl1K0xvTDFWZHFkeHc0Q05B?=
 =?utf-8?B?d2JkWDl2OERTNDNsMFN1a0NCU3gxcURybmd3RG5nSFUybjNvWVNONzNtZmFo?=
 =?utf-8?B?V2JBeXhrNTFramg0ZndJd2xxUnRxWGFXeElXKzRVTEZUSzc3eWlCUEltWkRW?=
 =?utf-8?B?WTFwcG1Geld1TmVESkJGQmJteFY0bXZaYjJYa0VKazRjZHdQK21Gdk1Obnow?=
 =?utf-8?B?d1pTa1d1RkVlY3dPWEM5ODBLeW11QTZSelhWSTBtRVdwTWxETzJDcTlueWYz?=
 =?utf-8?B?R0g3SUFZREZwcXdISGpMb2VxTEFYZzNYYVBpNHFkZHNZUmtnOW9SZFd3Mmc3?=
 =?utf-8?B?ZjhsUjNDRHdYS2t0RGI2bGx0dTV3cE5yc0pwcXpzckxRVG9WdFBRU0hCTTMv?=
 =?utf-8?B?YVgvcHlBc0Mwb2JCbkNWRWNtZzFnemdzODJTa05iSzR1NFpVNlYwYmVaVXV2?=
 =?utf-8?B?M2pTb3lwZzBtQno1aFZLMW1jUUVXb1MwQVArZ0lma04wYzI1NEI0c3UwVVJZ?=
 =?utf-8?B?RnAvVHhvbDM1ZWZvZlVPU2dBVVE5Q1Q2Y3NNbFVTbWxlT2hzL2FleUdWVWZs?=
 =?utf-8?B?dXh6YzBQSW1XNzVQT2dhOUVDMGJCSUUvZ1JiYk5VTXpTR1BRT1AxTytnTnY1?=
 =?utf-8?B?SkZNc2FNYXFLOEc4Y2dZTWdCMjNWc0lOcVZiTHVuU21RanRoQjdXMFZIRUZQ?=
 =?utf-8?B?N2ppbUJZQVhhSVp4dXBnYXZXNm5NVnhVMm13S0d1RjZvUnR6eCsvamx1bXQz?=
 =?utf-8?B?cUlZbVE3clZJa2Q3ZDVxV0o4amN3RHVJdWdSb1lMMEc5aHhsRVBaZlpFRUxn?=
 =?utf-8?B?WVJYUVBLZnhaUFdEQms2WU1MaVIrNkh3cWNNc0gwVjA1ZldEQW1LZHVUUVJL?=
 =?utf-8?B?UGJPQ2MyQ3pDSVRYVDA4NDNKNkxjNGtUSUtzenZ4NUVNL3Myc1VXR0dsaHlk?=
 =?utf-8?B?eml5SDMvNHVBdXFteTc4QXFTK2VqRXE2YkVFMVNWNXhCNjRnMnNkenlac1dy?=
 =?utf-8?B?YmRPeWZLVVRrY044Syszc1hYdHlzV1k0eWt6bmNGeWhZd1dPTGZLc2cvd1Ro?=
 =?utf-8?Q?qOX2MwXxpS1cT2UYFdC9iVYx0MMXQrLd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3J1cEUxZmZ2a2NmQUtrcmFmOEdHNTBUdHpFbWFSNzV0U1M5WVpLUEpyNFg0?=
 =?utf-8?B?VTV0QXNTOXgyNzJhWmphNGhKbkFBQVdBOGh3RXNtb3hsNHhIdDB4VjhHdUlL?=
 =?utf-8?B?SWVKQ05IOGVpRTFobEFscXB4S2hGODZZT3F3QmJINFhUVVI2ZFcxY1hwdDhJ?=
 =?utf-8?B?Z3lqU2NjUmtLakozU04vcHJLdGVnbW9SMEsweXZ6N1RIY24xYXMxVCtMUXRG?=
 =?utf-8?B?L3BMSEN5TFVJbUEzZDA2aXIzWVNhbzF0eVp4djdFRGxQdXFDSFZYanVldlFt?=
 =?utf-8?B?aHY3bkhxcUM3aWc5WmRvT1pCaTBTUkVta0Z2TDBIc1FlOVBTeUF2SCttbE5n?=
 =?utf-8?B?M1lHTTRFTjJqSGFON2hBUFpQWnM4STJ6dnlNbGNKbEp1SG1lUDBnOWJRc2FL?=
 =?utf-8?B?VUVvYlB2KzF1YjdBRHJaRC95cFNoRlpla3pSNS9IZnlqb1YyR3JWMUk3NHY4?=
 =?utf-8?B?R201QkUxckU0TkRDK2REb1JObUVBaUJOY1VzcTdFK0M4K1NRQncwdEwxWGc1?=
 =?utf-8?B?QkpLaklnYXhnbDZZZDNkbDZtSHM1VSt0blI3d3dQa1plL3dDS2xDM1FVbW5i?=
 =?utf-8?B?Y0xybzJ1MU1KVlRUb0d0SStSV2JoY3RvRlI0LytVNFNJU2IxTlZnUjBHMkpo?=
 =?utf-8?B?R0JrL1gzSVlkNFlIN0pIdGNRekFlTGl0MUluRjVIUkpHUVpPblRvanlJenJa?=
 =?utf-8?B?a1JRZzBqcG9NMlRxZ3phWkxIYkVQKy9Rajh4ZTY5ODVkZEY1eWN2a3N5VmZD?=
 =?utf-8?B?LzY3bWY5L2tlM25SaVJ0Ymd6c3dKVHZpdExFbU1Cczd5Ymg3M082R0w3cmQ5?=
 =?utf-8?B?aVMzNFdBZ0lOSnVyWHBYVnFNNnkrZTNSMDZldTRoTVhqdTZWMUdxNjdzV0o0?=
 =?utf-8?B?alpnVVJRNXRRc2h3T1BvRGlTWmlRaDNDb3Bta3NMQXZoOHhGdEZ0SDc0UnI5?=
 =?utf-8?B?NEp2T3BTWjBwc0l4ZjVzb1NIQmlOcHJqRFZuOS9rVDd1RHZrZElkcjlDclcw?=
 =?utf-8?B?a3lDQUFuWmhZTldDb0t1VU5CU3ZwUEhPYnFxSG9LS20rSy92TXRzYVIzTjBN?=
 =?utf-8?B?ekNXaUtIOGsrN2MwSlBXdDhlRFd2Y1VEUm1BeXVHK2R4c2pjWUdmSnZjNENn?=
 =?utf-8?B?aUEvQndOdW9adFUrLytFYmNyb1NBd0J4MEllSlFvNTBrVlAxMm5aMjJlOTNU?=
 =?utf-8?B?aERQR0hhdjBRRlk2OWtQS0VmTUg0Umh0L2swVTlnRi9HSGN5N0xTeVNTSmdR?=
 =?utf-8?B?YkJpWWlRbnRtTFZyK2UzSTZUc1FtVkpKdGx0aS9zZ1lwTlhTYWtuWjRhQ2ZC?=
 =?utf-8?B?ajNmYjVqUHE5dUZaWFhzS2RnQ2VjZTIxaGYzSWwxelFmclNheXdPM05qcjZL?=
 =?utf-8?B?UFQrQ2UwVk4yZ04wMVFZTnk4TC9tTUdEbEp5bEl5TjI1em5VNzNtdmF6cVZP?=
 =?utf-8?B?L05HWkZVTE9FSFlDYlNSejV2NFZiZGpMbUNhQnFiMExLT0tYbEN0b3IzMyth?=
 =?utf-8?B?V0hlS1JJaEtKdWFlUGtWVEVKWkV6TkxXWDRsRzRDMnBsYmdtQkFlTkFzbVZk?=
 =?utf-8?B?YTJzaTFNeHY1VVNBMmhIZWl3K2RPWnlCcXFXZXVLM25POVcydzVKbU5lS1hN?=
 =?utf-8?B?aHRPdFkxaVNyWks5ZXJpaEx4ZWRmTWlBeWN1aUE0T1plQllqVjQ3MFJvS2xw?=
 =?utf-8?B?Wmh1U2xsVXVUUVhRSzhVZ0VnK2JmajVOU1d5ejZpQTdOZFcvNW1TZjdnd1RU?=
 =?utf-8?B?aDM3ZXd2ekJ1NzBCK1YxbmZ2ck03SzVkM0U1cDJNNXBzRjhzNEFRejhuTSsw?=
 =?utf-8?B?ajNqVm9rWjhhSXZZbXNHZ1VmMFpBMDBMZFViZXNuTWV6dnV4Ny9uSmVhditx?=
 =?utf-8?B?T096UEdKc1IwSFVTUGNSdFNIcDBFbDBTZWZ0ajNVczE3OVRJMkhYQ1Rwa05o?=
 =?utf-8?B?WnVjZ2VabWZDbDYzclVxektkRXFtTG9sOUQreEtGZUtPREhXbUNxd05McDlC?=
 =?utf-8?B?ZHhwM1VueXpxZWR1TWc0dksvTHYrU2tUQXMrc1NVS2hVZFVkZDZkbDg4Q2xT?=
 =?utf-8?B?ZHcxR0RRL3NZbUlXSE4xaEJwcjdBMHh5ZlhWc0s0aTAzVytvckFoSkhJVXhO?=
 =?utf-8?Q?VIpPNYOhiJEXq2GEYjz1J9Hbv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e527c3-9ed7-4372-7e93-08de3770ea23
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:18:44.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80MpOU0W2AsKZEoGavKQk7nqK/JQLnGf+08OZs5GEp2qa48iByyAAyYvzCv+fjVsRsElRGY4hYpR0hfdYKJRSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8571
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

On Mon, Dec 08, 2025 at 02:15:41PM +0530, Riana Tauro wrote:
> Redesign survivability mode to have only one value per file.
> 
> 1) Retain the survivability_mode sysfs to indicate the type
> 
> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
> 	(Boot / Runtime)
> 
> 2) Add survivability_info directory to expose boot breadcrumbs.
> Entries in survivability mode sysfs are only visible when
> boot breadcrumb registers are populated.
> 
> 	/sys/bus/pci/devices/0000:03:00.0/survivability_info
> 	├── aux_info0
> 	├── aux_info1
> 	├── aux_info2
> 	├── aux_info3
> 	├── aux_info4
> 	├── capability_info
> 	├── postcode_trace
> 	└── postcode_trace_overflow
> 
> Capability Info:
> 
> 	Provides data about boot status and has bits that
> 	indicate the support for the other breadcrumbs
> 
> Postcode Trace / Postcode Trace Overflow :
> 
> 	Each postcode is represented as an 8-bit value and represents
> 	a boot failure event. When a new failure event is logged by Pcode
> 	the existing postcodes are shifted left. These entries provide a
> 	history of 8 postcodes.
> 
> Auxiliary Info:
> 
> 	Some failures have additional debug information.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: fix documentation
>     fix typo (Rodrigo)


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing right now, thank you for fixing this.

> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 222 +++++++++++-------
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  22 +-
>  2 files changed, 154 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 1662bfddd4bc..b6ff5da86a4d 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -19,8 +19,6 @@
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
>  
> -#define MAX_SCRATCH_MMIO 8
> -
>  /**
>   * DOC: Survivability Mode
>   *
> @@ -48,19 +46,38 @@
>   *
>   * Refer :ref:`xe_configfs` for more details on how to use configfs
>   *
> - * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
> - * debug information::
> + * Survivability mode is indicated by the below admin-only readable sysfs entry. It
> + * provides information about the type of survivability mode (Boot/Runtime).
> + *
> + * .. code-block:: shell
> + *
> + *	# cat /sys/bus/pci/devices/<device>/survivability_mode
> + *	  Boot
> + *
> + *
> + * Any additional debug information if present will be visible under the directory
> + * ``survivability_info``::
> + *
> + *	/sys/bus/pci/devices/<device>/survivability_info/
> + *	├── aux_info0
> + *	├── aux_info1
> + *	├── aux_info2
> + *	├── aux_info3
> + *	├── aux_info4
> + *	├── capability_info
> + *	├── fdo_mode
> + *	├── postcode_trace
> + *	└── postcode_trace_overflow
> + *
> + * This directory has the following attributes
>   *
> - *	/sys/bus/pci/devices/<device>/survivability_mode
> + * - ``capability_info`` : Indicates Boot status and support for additional information
>   *
> - * Capability Information:
> - *	Provides boot status
> - * Postcode Information:
> - *	Provides information about the failure
> - * Overflow Information
> - *	Provides history of previous failures
> - * Auxiliary Information
> - *	Certain failures may have information in addition to postcode information
> + * - ``postcode_trace``, ``postcode_trace_overflow`` : Each postcode is a 8bit value and
> + *   represents a boot failure event. When a new failure event is logged by PCODE the
> + *   existing postcodes are shifted left. These entries provide a history of 8 postcodes.
> + *
> + * - ``aux_info<n>`` : Some failures have additional debug information
>   *
>   * Runtime Survivability
>   * =====================
> @@ -68,60 +85,76 @@
>   * Certain runtime firmware errors can cause the device to enter a wedged state
>   * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
>   * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
> - * is indicated by the presence of survivability mode sysfs::
> + * is indicated by the presence of survivability mode sysfs.
> + * Survivability mode sysfs provides information about the type of survivability mode.
>   *
> - *	/sys/bus/pci/devices/<device>/survivability_mode
> + * .. code-block:: shell
>   *
> - * Survivability mode sysfs provides information about the type of survivability mode.
> + *	# cat /sys/bus/pci/devices/<device>/survivability_mode
> + *	  Runtime
>   *
>   * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>   * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
>   * to restore device to normal operation.
>   */
>  
> +static const char * const reg_map[] = {
> +	[CAPABILITY_INFO]         = "Capability Info",
> +	[POSTCODE_TRACE]          = "Postcode trace",
> +	[POSTCODE_TRACE_OVERFLOW] = "Postcode trace overflow",
> +	[AUX_INFO0]               = "Auxiliary Info 0",
> +	[AUX_INFO1]               = "Auxiliary Info 1",
> +	[AUX_INFO2]               = "Auxiliary Info 2",
> +	[AUX_INFO3]               = "Auxiliary Info 3",
> +	[AUX_INFO4]               = "Auxiliary Info 4",
> +};
> +
> +struct xe_survivability_attribute {
> +	struct device_attribute attr;
> +	u8 index;
> +};
> +
> +static struct
> +xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribute *attr)
> +{
> +	return container_of(attr, struct xe_survivability_attribute, attr);
> +}
> +
>  static u32 aux_history_offset(u32 reg_value)
>  {
>  	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
>  }
>  
> -static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability_info *info,
> -				   int id, char *name)
> +static void set_survivability_info(struct xe_mmio *mmio, u32  *info, int id)
>  {
> -	strscpy(info[id].name, name, sizeof(info[id].name));
> -	info[id].reg = PCODE_SCRATCH(id).raw;
> -	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
> +	info[id] = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
>  }
>  
>  static void populate_survivability_info(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> +	u32 *info = survivability->info;
>  	struct xe_mmio *mmio;
>  	u32 id = 0, reg_value;
> -	char name[NAME_MAX];
>  	int index;
>  
>  	mmio = xe_root_tile_mmio(xe);
> -	set_survivability_info(mmio, info, id, "Capability Info");
> -	reg_value = info[id].value;
> +	set_survivability_info(mmio, info, CAPABILITY_INFO);
> +	reg_value = info[CAPABILITY_INFO];
>  
>  	if (reg_value & HISTORY_TRACKING) {
> -		id++;
> -		set_survivability_info(mmio, info, id, "Postcode Info");
> +		set_survivability_info(mmio, info, POSTCODE_TRACE);
>  
> -		if (reg_value & OVERFLOW_SUPPORT) {
> -			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
> -			set_survivability_info(mmio, info, id, "Overflow Info");
> -		}
> +		if (reg_value & OVERFLOW_SUPPORT)
> +			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>  	}
>  
>  	if (reg_value & AUXINFO_SUPPORT) {
>  		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>  
> -		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
> -		     id = aux_history_offset(reg_value)) {
> -			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> -			set_survivability_info(mmio, info, id, name);
> +		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
> +			set_survivability_info(mmio, info, id);
> +			id = aux_history_offset(info[id]);
>  		}
>  	}
>  }
> @@ -130,15 +163,14 @@ static void log_survivability_info(struct pci_dev *pdev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> +	u32 *info = survivability->info;
>  	int id;
>  
>  	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>  		 survivability->boot_status);
> -	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> -		if (info[id].reg)
> -			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
> -				 info[id].reg, info[id].value);
> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
> +		if (info[id])
> +			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>  	}
>  }
>  
> @@ -156,25 +188,38 @@ static ssize_t survivability_mode_show(struct device *dev,
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> -	int index = 0, count = 0;
>  
> -	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
> -			       survivability->type ? "Runtime" : "Boot");
> +	return sysfs_emit(buff, "%s\n", survivability->type ? "Runtime" : "Boot");
> +}
>  
> -	if (!check_boot_failure(xe))
> -		return count;
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>  
> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> -		if (info[index].reg)
> -			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> -					       info[index].reg, info[index].value);
> -	}
> +static ssize_t survivability_info_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	u32 *info = survivability->info;
>  
> -	return count;
> +	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
>  }
>  
> -static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +#define SURVIVABILITY_ATTR_RO(name, _index)					\
> +	struct xe_survivability_attribute attr_##name =	{			\
> +		.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
> +		.index = _index,						\
> +	}
> +
> +SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> +SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> +SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> +SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> +SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> +SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> +SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> +SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
> @@ -182,17 +227,48 @@ static void xe_survivability_mode_fini(void *arg)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	device_remove_file(dev, &dev_attr_survivability_mode);
>  }
>  
> +static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct attribute *attr,
> +						int idx)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(kobj_to_dev(kobj));
> +	struct xe_survivability *survivability = &xe->survivability;
> +	u32 *info = survivability->info;
> +
> +	if (info[idx])
> +		return 0400;
> +
> +	return 0;
> +}
> +
> +/* Attributes are ordered according to enum scratch_reg */
> +static struct attribute *survivability_info_attrs[] = {
> +	&attr_capability_info.attr.attr,
> +	&attr_postcode_trace.attr.attr,
> +	&attr_postcode_trace_overflow.attr.attr,
> +	&attr_aux_info0.attr.attr,
> +	&attr_aux_info1.attr.attr,
> +	&attr_aux_info2.attr.attr,
> +	&attr_aux_info3.attr.attr,
> +	&attr_aux_info4.attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group survivability_info_group = {
> +	.name = "survivability_info",
> +	.attrs = survivability_info_attrs,
> +	.is_visible = survivability_info_attrs_visible,
> +};
> +
>  static int create_survivability_sysfs(struct pci_dev *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	int ret;
>  
> -	/* create survivability mode sysfs */
> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	ret = device_create_file(dev, &dev_attr_survivability_mode);
>  	if (ret) {
>  		dev_warn(dev, "Failed to create survivability sysfs files\n");
>  		return ret;
> @@ -203,6 +279,12 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  	if (ret)
>  		return ret;
>  
> +	if (check_boot_failure(xe)) {
> +		ret = devm_device_add_group(dev, &survivability_info_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -239,25 +321,6 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> -static int init_survivability_mode(struct xe_device *xe)
> -{
> -	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info;
> -
> -	survivability->size = MAX_SCRATCH_MMIO;
> -
> -	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> -			    GFP_KERNEL);
> -	if (!info)
> -		return -ENOMEM;
> -
> -	survivability->info = info;
> -
> -	populate_survivability_info(xe);
> -
> -	return 0;
> -}
> -
>  /**
>   * xe_survivability_mode_is_boot_enabled- check if boot survivability mode is enabled
>   * @xe: xe device instance
> @@ -325,9 +388,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  		return -EINVAL;
>  	}
>  
> -	ret = init_survivability_mode(xe);
> -	if (ret)
> -		return ret;
> +	populate_survivability_info(xe);
>  
>  	ret = create_survivability_sysfs(pdev);
>  	if (ret)
> @@ -356,14 +417,11 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	int ret;
>  
>  	if (!xe_survivability_mode_is_requested(xe))
>  		return 0;
>  
> -	ret = init_survivability_mode(xe);
> -	if (ret)
> -		return ret;
> +	populate_survivability_info(xe);
>  
>  	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>  	if (survivability->boot_status == CRITICAL_FAILURE) {
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index cd65a5d167c9..f31b3907d933 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -9,23 +9,29 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +enum scratch_reg {
> +	CAPABILITY_INFO,
> +	POSTCODE_TRACE,
> +	POSTCODE_TRACE_OVERFLOW,
> +	AUX_INFO0,
> +	AUX_INFO1,
> +	AUX_INFO2,
> +	AUX_INFO3,
> +	AUX_INFO4,
> +	MAX_SCRATCH_REG,
> +};
> +
>  enum xe_survivability_type {
>  	XE_SURVIVABILITY_TYPE_BOOT,
>  	XE_SURVIVABILITY_TYPE_RUNTIME,
>  };
>  
> -struct xe_survivability_info {
> -	char name[NAME_MAX];
> -	u32 reg;
> -	u32 value;
> -};
> -
>  /**
>   * struct xe_survivability: Contains survivability mode information
>   */
>  struct xe_survivability {
> -	/** @info: struct that holds survivability info from scratch registers */
> -	struct xe_survivability_info *info;
> +	/** @info: survivability debug info */
> +	u32 info[MAX_SCRATCH_REG];
>  
>  	/** @size: number of scratch registers */
>  	u32 size;
> -- 
> 2.47.1
> 
