Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B87FED2C7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 04:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951DF10E41B;
	Thu, 12 Mar 2026 04:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iItD8dCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425A710E41B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 04:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773289934; x=1804825934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JGDweLhgJdZEpADAS8K5UEF977VaUcAQ1yfsN4/o++A=;
 b=iItD8dCJ5eghPkjIgaIcfmgaeT5Xr37XKbjI8BQ23jaZ2BroBPb8xaz4
 FC+p8PFPDw4estmwP0sjqHouEmyj9y/HMwjldv6hKOLAk/6ziGecS+t8T
 G3oBMtPOnmuS0bqHE7sWqMm7x1J/N/89waXbvQKvmOGC09CdzFU7+o+Or
 KajdRmRh3AqO0TgjpT74dnauDUJsI/Lki8R7ItyKLvLGqsRRpc1jBKLMl
 04/LveObJvUfrRgr5WUhgAgHhYMQaD6fJxY308dL15aezR3Ul5B0OnCzG
 nWcEz+P2WhtCFKSJa+Luha0ZmnAhJAtOkHKJeeryDNauHHNBTvHiHUnh5 w==;
X-CSE-ConnectionGUID: ldomy8CmTmiySZf+tLE97g==
X-CSE-MsgGUID: aK+X844MSsCTj/JvkzUxjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73565063"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="73565063"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:32:14 -0700
X-CSE-ConnectionGUID: nZQTJg6jRYeHXTwSqgIYDQ==
X-CSE-MsgGUID: Vpwxf3vMRYSiOjEWDV291w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225138667"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:32:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 21:32:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 21:32:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 21:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEQbQRm1vU90P6iOw42bDRl24kQkWqtIhLvUS1uunS2VPnZvsd6KbeOynD8IBwuCHvh2cPC7ZJcetihnxX3+e5ok66M9kFrxLg2S21YcV4dTBz/6qoob9NuqAqZko9DuznKTXeQCNrcAwOFf2NS5KUhoo1WJjvEZLjlMkiqvoWWGFH3opz6n9nrPPFnr/33CKhwLCF9/y3AhnmYYT+/AKIrxODM4TZY62CUoOAvI4U835t0DgZeTmlcMZsKCn6YnFHTVQB4G/2qpnVbJWPFmmrAt6BuUDnvuI5UV+J2gDdC6tDhOpMvmTiE5S4BNS+7HS9tushzp3Ik1ltVCCl3ogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDZC+B/RvZ9+coplQ4N0CLhxkQ9ywOYDY68/pKIevE8=;
 b=KXUQy2zs5KHt93tQb3Ga3+W+Lb/MMIYninU6i8RgdJApv2rf3JyWUIEVZ4OkKChGWSFyBTXXNim4DbcVMMq3hpHlA3YhYTADyQIeg/aKUWRE26RQu/XwPL/30IUSHtqanHL+0FbQVThdaNqLymbaOWcg2KGBoylYRSg8yAfoti3MklBhx+qgBfs395uUCxTitY3sG4W/IAbHuRHJKsyr2308yPBWawG9gQo3Ze9QX01XYCJbkuzbipkKA8cLde4hg7Pxy6uaUcuYwNtzSkAIrCHstBzfx10uqy7n1ya/EpdQggMhNu6jYmaFq3p8ekdDtpuNIIBYnTrzqNBOk86RZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 04:32:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 04:32:09 +0000
Date: Thu, 12 Mar 2026 10:02:00 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: "Anoop, Vijay" <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v9 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Message-ID: <abJBwDWYy/1Y3xIq@soc-5CG1426VCC.clients.intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-12-anoop.c.vijay@intel.com>
 <99cdff33-f6f3-4075-8787-d0456592afb5@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99cdff33-f6f3-4075-8787-d0456592afb5@intel.com>
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3d2843-5f8f-4f72-6bd1-08de7ff052f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: WAuIOSKYFhRCsh/pwQSm3xESldQ4nts6xQpxSKdZ80WlNa7yYg6GkX9iL8+7Z1Pl/w2GnBN2TRPpQaKzHxUXdTapc0WyhoOF8Je7wPPCI7qBfS2UTPlo7kBhUVjGrv21w4Wj3ZMysWuHyMLR7YxRpPfzkYTiZMBIaup94W8BdQKmNLmNF77gOmZT/7F5cpuRZlY58fvuWORZajlJ5Sub9YKJFlVWXzVUZyBDnZf+VolYMR4oIfQJmt5IYJEjqAHvVvgVKF2Co5ATsy07PDCtgVR93UahJEBVGqgfk3nGG/2Pa3UxtHBTQL7fH6nxHJ2m0llWS1iwMj2zWxZvPqNoO/lzlmgJJF8+pzQhVw6qkduGr6Kz57xjr4og29JomcOoKD/0Y9wxlfNwM2mzR/1sQNXru6R76qSWf8z7OhEluTzXG43r4BmfVoZzBTwTJlqTHWCEOANPQG6qFMlRpmc87ewGrsv3ptn5D4iKoksnvNiYomXfEgzzc8wj/R2zmolArrcw8FbKcja/s0SihWdZc5EWhAzZHBku34fHC28wSSgf/+Zrs60U7ayfeknIpHo/bEX5MR7sTIA1twb2cs4BQnvFE8SEJ58ECoD/cg0cOYfcA0jwQ1a4P0LB5iMGO6Yzu0KiInIaA5MaNfOx/430g41JW3JymPGCv1BHRU2CWXjBIyjicY5MoQ+Jp40PaLfs9hZICHBaKqPMDrcxMpjGfhxK0IkIEsEpVh0PhwZfulU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZwSWFLZVdjZXN5clBxOE9kV2xaZXNZL3JpdE9QeGhzVEhzZXh6VllnM1h4?=
 =?utf-8?B?U2ZzREkxYVIra3FMOGlLbk5WbFRFaTliMTZqczNhdnJ6NWhuUFZWeENlcnIw?=
 =?utf-8?B?L0U1T0E2UHFkVmx5ZDBSUUYxNGw3RmFjR1VVUFVYWlNKbjNpSk8weVc5WG1K?=
 =?utf-8?B?cWxDSUlkZFpxeXU5Y3pBb3BBOVVTaU9oZ2xVODlncVpQemllVTQya1VZUzJz?=
 =?utf-8?B?WGwremtpci9FWURudHRnbjdRZXBYYzFqSHdOWUtYWXJ4T0pReWp2ZHd6bFh5?=
 =?utf-8?B?cGdJVE9jWHFtaFYzbndNV0lpS3VmSWozYlcrMTJwaURobUhBZm1pZ1Fuam1p?=
 =?utf-8?B?d1FzU1BWSExQbFRKaWNoNXJsQVAzRGNhYnJnZDhaK1pkS01TSnJaYmo3ckgr?=
 =?utf-8?B?TXVPREFsekYrQngwdGtsNlg2eDU2VW9RcVpwT3dvNkRzRmxhZnEwdHc0U0Nq?=
 =?utf-8?B?bVJIUHhGM0pOYXkrY2xteVZKMEpHSy9ZWnFHU29RcUJFZXk0dTJrNVMzbE00?=
 =?utf-8?B?UVVQREdxWFNleVpHT1ZRcGg1TEVTaDRXMmt3TFU2VzhrVmtYV1ZuYXpwcUtQ?=
 =?utf-8?B?M0d1RU0wWEVGcm96MG0rRFJ4UE9XUXFldDAxRzg0NUkyMklHSzdMV2NUaXNC?=
 =?utf-8?B?L3NjMGRGRGJCcG5MR2ZTQnp6UDdvK1ZUSzA5Y25SSHNDNzUrU1dCTmttVVB0?=
 =?utf-8?B?SnYvSUVmekZQcWhmMndOaG85MHVYcWRLc1JmQWhDc0tOL2xHV0I3NHFqK3R0?=
 =?utf-8?B?Rnd0aGdRbjJzL3BUWGdld05ybzYxZWRHRnNiUS9HeHpOanVtdlRmT2w4akhH?=
 =?utf-8?B?OU13N21mOGJKUkpBUnJpTElsRko0S0doV1BZTk1lNDEyb2FXWGZwUWNHMklN?=
 =?utf-8?B?cFBMbzlHSWwvNjNHSWdkSk1WU1QxckVQbDdDQ2c0a1VEdExkL2lmVjVxZVl2?=
 =?utf-8?B?WVJXYWhyU2thajFpV1puRjV1UVhwdlFJTnl6aXovYitDRmRlOVRUb2R4MEpv?=
 =?utf-8?B?U2JxTkFIMFRiL0x2QzhEYlp4ZzgyTlVZSDgzakpJTk9Nak91SXhYaEloU21j?=
 =?utf-8?B?akw0YUZQQlBpMCswNnJuRENkMnA4Rk9SU1lIMTJ5cFd1MUxJRkVnckhMQTBr?=
 =?utf-8?B?bFdya09qSng4MDZMdUN2cEc0ZzgySnZFUm1pd0RTaTJGZFc3U0hwQnhzQ1NY?=
 =?utf-8?B?M2hMYUNHaHB1S3hOeUtKSFAyc2xHUGRmK0k1TDhicEp6MmlLU2FkRzJrZjdF?=
 =?utf-8?B?R2VQNWQrRlNPcWRUNnNNb1RLQXdPOVE1NGVOQ25tZ3Q2cTl0ZVdFbDYwSHRa?=
 =?utf-8?B?cXh0cDNxV0VoSzBQWitDdS82STI5NFNlT1hiRW4wRTNZNnM5UnlkMmJYaHFB?=
 =?utf-8?B?dGExYS9GejJ2TzdlOHhVNFloTmczSU5mcElVT3hwaUVBd05nclAzM05Ja05Z?=
 =?utf-8?B?RTNiQ3dhU1psVVplVjF6ZklSbVI5eTJwRXlCVXJCSk5OMm92TEtRNUpFbHU0?=
 =?utf-8?B?Wm9TaVZveFFmNytkaUxTSmYyOEFJNGdEcDl6OUFyMnVVR0lxdTlVM3ZIeGRD?=
 =?utf-8?B?Z0lycUhSYkZxM3J4bGU5a2x4cHNmSlZDZGtKZEllRWZJNldMWUdrUHNWZU5B?=
 =?utf-8?B?VEpBVlFFZnlvRmdaV1hVMTl1U3dLMk9XVlJaT01oNWVwcWMyTzAwZFRLakFQ?=
 =?utf-8?B?RDFabjlrRXpKN2pXdlBSaFExamI0cFdGcVp2WnExT0dLdEhxSy9hMG8rdFAr?=
 =?utf-8?B?MThCSGV6SjhGNGl5ci9mRHg1ZEVNY2hDRTBRdWt0Rk44MlRPV0dJY3ZnUE5X?=
 =?utf-8?B?aE9KY1BaR1d2Y3l3WHVIUW1rZmtSK2xuMXFvZWFhYm9JRVdYVjhKWUU3VFk4?=
 =?utf-8?B?K3JoMTNTOXF4Skgrek9kcitrYnhibitrU3VpWUV4eFlzanBFTFplTUhFSWRy?=
 =?utf-8?B?YVE4RjBPRHRhMCtid1B1R1lKUHAzSGIvTFJDa2VzOS9DcXpWSHpPRENDSHc3?=
 =?utf-8?B?NStqb0dQcDkrdEduZk1mMTEvb3lhYmpraUFiT0pXWmlCL25yNWZKNFNtOWZV?=
 =?utf-8?B?Ym43aGt3UHl6V2RDYlpBc2xjMXAxcjNNeWFUNFpORXR4L0tDS3NZbjkxZHB0?=
 =?utf-8?B?aUVmc1pqazM4U04zWUNIN1dITndnWUxIRDJrNHZVOFovZW9Zb1ErK2dMUXgx?=
 =?utf-8?B?VzR2bTVSMllsaWdKUnZDSm9TeTBEbkxuYXl0dTIxekZMZTJjRTlYUm9TWFFk?=
 =?utf-8?B?MzRKSFg1cy9jcGZpSGVJbHdaK1oyWG1paW9DME5RWnEyTE8xelVUWTc0TnQ1?=
 =?utf-8?B?RFArTzZKNWNQcDhLa1JXUXJsKzZyUnFIZzE1NFR1MUdIZXl2QTAwb014NUU5?=
 =?utf-8?Q?rBKdpwfuNWZXhi0csvArJOGg4yN0CKEZLB+EV?=
X-Exchange-RoutingPolicyChecked: t7gJ0x+HY8CfP7hVN/Q1KxEKo5RK9E9KvA3AcXlFGumro7XNn3R/htppU9pusRGh5je33jz4h64/cBN0EoilFTqjJ7mCxO4QL44TUJbf4OdGHF5XZk+O9MCQt3C5+XTuC3KeAeMATigCnZaagQz5ahKFHhNiZsNoPFVzTYZ/dgkj6aqopxOcDzpaOmhv7LugSYkCgT+++P5jzrWqNfkMD5MExeDTedQmBHgq8DGXleMw0IdyrPOd6mIX8RVHM/V6St4kmmW3/519OVGs9cVX3uZtTMchkJSzNc/2zDhbygzNengCh2tN4IRx7Tn7/EQIpvc9CSjvG5UNVsZS4Qcvbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3d2843-5f8f-4f72-6bd1-08de7ff052f1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 04:32:09.7187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhem99iWJHA0juKmGa4MUnHO7sOvDxmCaqoxAt2BJWnziZUdjJu9FYQRdnYDwhw2hQh9BdytVG2QNeL/xQ+RdlapmUmrfBQxgXmi0ZB4Gcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
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

On Wed, Mar 11, 2026 at 04:29:58PM +0530, Riana Tauro wrote:
>
>
>On 3/10/2026 11:53 PM, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Add initialization infrastructure for System Controller subsystem:
>>- xe_sysctrl_init() and cleanup handler
>>- Integration into xe_device_probe()
>>- Makefile build inclusion
>
>The description should be a brief of what the patch is.
>Mentioning 'makefile inclusions' is unnecessary
>
>>
>>Initialization flow will check platform support via has_sysctrl flag and
>>configure mailbox region through SOC remapper interface
>
>punctuation..
>
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v8: (Matt, Michal, Shuicheng)
>>- Fixed include order
>>- Added VF check
>>- Converted runtime checks to assertions
>>- Added sc_to_xe() helper
>>- Fixed kernel-doc syntax
>>---
>>  drivers/gpu/drm/xe/Makefile     |  1 +
>>  drivers/gpu/drm/xe/xe_device.c  |  5 ++
>>  drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
>>  4 files changed, 109 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index f63fdf80055a..76a86818986a 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
>>  	xe_step.o \
>>  	xe_survivability_mode.o \
>>  	xe_sync.o \
>>+	xe_sysctrl.o \
>>  	xe_tile.o \
>>  	xe_tile_sysfs.o \
>>  	xe_tlb_inval.o \
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index e77a3a3db73d..c70d4ae413a9 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -65,6 +65,7 @@
>>  #include "xe_survivability_mode.h"
>>  #include "xe_sriov.h"
>>  #include "xe_svm.h"
>>+#include "xe_sysctrl.h"
>>  #include "xe_tile.h"
>>  #include "xe_ttm_stolen_mgr.h"
>>  #include "xe_ttm_sys_mgr.h"
>>@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
>>  	if (err)
>>  		goto err_unregister_display;
>>+	err = xe_sysctrl_init(xe);
>>+	if (err)
>>+		goto err_unregister_display;
>>+
>>  	err = xe_device_sysfs_init(xe);
>>  	if (err)
>>  		goto err_unregister_display;
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>>new file mode 100644
>>index 000000000000..2751fe25a6ff
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>@@ -0,0 +1,82 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#include <linux/device.h>
>>+#include <linux/mutex.h>
>>+
>>+#include <drm/drm_managed.h>
>>+
>>+#include "regs/xe_sysctrl_regs.h"
>>+#include "xe_assert.h"
>>+#include "xe_device.h"
>>+#include "xe_mmio.h"
>>+#include "xe_printk.h"
>>+#include "xe_soc_remapper.h"
>>+#include "xe_sriov.h"
>>+#include "xe_sysctrl.h"
>>+#include "xe_sysctrl_mailbox.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+/**
>>+ * DOC: System Controller (sysctrl)
>>+ *
>>+ * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
>>+ * responsible for managing various low-level platform functions. Communication
>>+ * between the driver and the System Controller occurs via a mailbox interface,
>>+ * enabling the exchange of commands and responses.
>>+ *
>>+ * This module provides initialization routines and helper functions to interact
>>+ * with the System Controller through the mailbox.
>>+ */
>>+static void sysctrl_fini(void *arg)
>>+{
>>+	struct xe_device *xe = arg;
>>+
>>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>>+}
>>+
>>+/**
>>+ * xe_sysctrl_init() - Initialize System Controller subsystem
>>+ * @xe: xe device instance
>>+ *
>>+ * Entry point for System Controller initialization, called from xe_device_probe.
>
>How about suspend/resume?
>

Right, forgot about that, thanks for catching that. Suspend/resume is no 
longer handled within SoC remapper. It must be handled by the user. The 
telemetry user does not need it since each access to the registers is 
preceded by soc remapper configuration.

In system controller, that's not the case, so we should add hooks to 
suspend/resume to reconfigure the SoC remapper.

Regards,
Umesh
>>+ * This function checks platform support and initializes the system controller.
>>+ *
>>+ * Return: 0 on success, error code on failure
>>+ */
>>+int xe_sysctrl_init(struct xe_device *xe)
>>+{
>>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>+	struct xe_sysctrl *sc = &xe->sc;
>>+	int ret;
>>+
>>+	if (!xe->info.has_sysctrl)
>>+		return 0;
>>+
>>+	if (IS_SRIOV_VF(xe))
>>+		return 0;
>>+
>>+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>>+
>>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>>+
>>+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>>+	if (ret)
>>+		return ret;
>>+
>>+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>>+	if (!sc->mmio)
>>+		return -ENOMEM;
>>+
>>+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>>+	sc->mmio->adj_offset = SYSCTRL_BASE;
>>+	sc->mmio->adj_limit = U32_MAX;
>>+
>>+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>
>Let's use devm or drmm. Not a mix of both.
>Sc is specific to device so devm would be appropriate.
>
>Thanks
>Riana
>
>>+	if (ret)
>>+		return ret;
>>+
>>+	return 0;
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>>new file mode 100644
>>index 000000000000..d5d8735038ae
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>>@@ -0,0 +1,21 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_SYSCTRL_H_
>>+#define _XE_SYSCTRL_H_
>>+
>>+#include <linux/container_of.h>
>>+
>>+#include "xe_device_types.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>>+{
>>+	return container_of(sc, struct xe_device, sc);
>>+}
>>+
>>+int xe_sysctrl_init(struct xe_device *xe);
>>+
>>+#endif
>
