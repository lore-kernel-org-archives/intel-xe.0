Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F32D1D895
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 18:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF0A10E5D9;
	Tue, 15 Oct 2024 18:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRzVE3kO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8199710E5D6
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729016462; x=1760552462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hvaOYyscUV4Kq6JBJbcncbQYKnzYEILCo8kgvbumBcw=;
 b=LRzVE3kOuQhy2k/IiEx2cyBS4pVxrSA7LMsRfzZIzAASMCMqil1NA+5j
 aKvltYdAXaM2ejK1t9nILZYQYJB0mfq3ObbT00QadTHjEwfZp6yz7sdSg
 3i4/7D3TgRcD7yRhhRmctWLnlNMyg0txMNLPK+xAa2V0ldQ5TxwvbbGMQ
 TzOLGHZBUIZyWybF1NRCCTfEzcTqyiejQA9PjIvt6deH2v9od1p/eTu/s
 Xp74pU8vu1NHfbqgKZn0Co8vzvIJ7vvSWqSMsIpT6VLMpkft1nkCaM0JP
 abA+KOFpXMbluHHVwg9yhzo2YT3qiBm7RNeMHMA1oW49d5CLtEck3DS5p g==;
X-CSE-ConnectionGUID: uFew7P77TIi47eB/QB+85A==
X-CSE-MsgGUID: btVIWdtIRUudzhGOExatog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39554255"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39554255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 11:21:01 -0700
X-CSE-ConnectionGUID: KPspaUl4TbGOd5T7Fzma4A==
X-CSE-MsgGUID: LDbUa0iHQaaKJM6egBgMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108718796"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 11:21:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:21:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:21:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 11:21:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 11:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/Xoy75BSxkyq1G7g6swkYTKRn3X93xnw92Il/hQzwfAqNXRcubjGn6YQkSRXhw9QQLbVoxRyew1gRymJm0SGGcRhQVHud2G0lMTG8Cv6ug7yv24ylTfUogBhhtB9Po6Fp/RDc9Cs7LL35g0mHe0/V+UW7hFtLA8DzmJMZj/kHSJt9d7ZLMfe2sMD5Cu0Ks7bSgPs+kpitBXXLSzMHXyxDGdcMSdH+lMS0ZXMgrxrb87SyFmIX1pbrp+buTHFxqnNI1nwcm2v3Rtwn7RseRbFcUZJaD8d4TXBCWbBgUcMrPOe05sqmxDf/IHeWnDzjOPbPta/6WH3QdPZEPWNlXQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFX4tiGFQM9UJW1YURaZ7LHWUTZ7AX2fOdTUK/G3vLE=;
 b=ke22VCvEeRAqG8RFqB/e+Rny7UAgJnS7ntr/oTju6f5Bd74bPdiR4eO6rPN71vF9rkyC/jrv3RolArCDvRML6iPhLjfqo099lHhdtsYV0bI0XNq6nVCPB4lgSy5Pnc0Gh5gklto1erqEBPZRw0ctjlxO/Rz+4guFpDSveNoSza4DFBafChYYrweDZiI2fNzg/4oEDzJ/yyzRwiPhzanjdht/YimfheTfb9YcDJaeqRDX0H3bv2v6uyyqEUpD50v+mI+Wl3OfPWlplPPXkL41AHPJFblmFywsTw0XftHA4ijUbqsaUlZgQjSL4b+0NLhqSEGF2l77SiLOH0KbB7g+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 18:20:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 18:20:57 +0000
Message-ID: <1a447908-7f44-473e-be8f-22c3a3a56c22@intel.com>
Date: Tue, 15 Oct 2024 23:50:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/26] drm/xe/huc: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-18-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd8fe45-8803-4fa9-4c40-08dced461ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFYyZGRibFBhOUN3MG9zcUVkamlMZ1h3NXVsZFlkNjRydWxMaVV4U2c4cklG?=
 =?utf-8?B?MzN6VjBuZVJZZEgvdXh6akYzMFA0YVExSmFpeW1vVit4d1BOd3N1U0Nua3R6?=
 =?utf-8?B?Uy9lNldIc1RvZDdmajhielVxNUtsZ2ljNDIvVXJiUGVORTZLbG5kRVZ6bWRX?=
 =?utf-8?B?WDdIL25SU2Z6dGRXQk9EckZLV0dTMmR0T1IyS3RiMWFsTmRxMURhYW9hRzlh?=
 =?utf-8?B?NE5DUER1dVplY25EWVpXMGdtVDA4RzJ6WWJNSkMydm5zUDQxMFNIKzVueFZa?=
 =?utf-8?B?a1l1K2FkblltcEIwN0xWVVVFY0RnSDFtek5IU0FOZEpoK1hLbVRGN0kwbjQr?=
 =?utf-8?B?Q1V5aWd0QzFOUlhyNlpCR3hLMnZHa0owT3NPV2xQa0k2N01UZ2JCdjRIaU1P?=
 =?utf-8?B?WXZmODQybXIwdnFCa2orSUxWUDNSajJoMlBXeFE0RmsvUXBQQkNRaExIaHBp?=
 =?utf-8?B?YTdTK1Y0em1nQXpxR3RaZk0yYklYd0REbWE5TmNmckYzdlF2TzNia2lXcUcx?=
 =?utf-8?B?WDNkRGJTV0tiMDFJYVZyejVkWndJV05PYkpUYXEwalUxMmdiRDBZajNEUDF6?=
 =?utf-8?B?RjBjY3U2Y20rb3g4ZHV6bHU0OUozS0M2T0l0N3dYclBXMTEzODJDVGdlekEv?=
 =?utf-8?B?YW1hQnFHNU9lTTh2Tk51OUZsTHZDTTZ2VHJNTFFOY2dicWphRGxuM3lwQW1W?=
 =?utf-8?B?c2JiaHM4cTlSbm8zYUQzeGZLbldKbXgrVmVCUEJOOXN6UXVDT1d2RDFaM3hI?=
 =?utf-8?B?dlZDWG1wa2hXY2RNajhQaGVxK3pTb0tJdGdaOGpqMGxIVVozMU9GV0xGTnVJ?=
 =?utf-8?B?dDZic3U0cUNWb0JCa0UxWWJzZFNJZjdheVNOdXl4MDI5ckNiZmd4VTU0WkFa?=
 =?utf-8?B?eXE3bkJXdks4aDJGWkVyTWt5YkVjRGNXVHZDUG1PT2IzcnBOSVh5WDhYM0Jw?=
 =?utf-8?B?SnVQOWJ0U215Z1d1VThNWUl4clNwZ0RqV28vSzJoT2lsZEZRb0U0cDlVc3Vv?=
 =?utf-8?B?ai9qMWQ2eW9nNmZXam9mTEVyeVZqU01aRHpkV2hSb0pjZGhYSnV4LzE3ZGVO?=
 =?utf-8?B?Ulc4VFJFYUVUQnNsOEIwWU5oS2NKYmxNM09iNUg4ZldOdzVsYWY5b2FxVnRB?=
 =?utf-8?B?VGJ4elpMRmo4KzNMOTNvenkxNEoxZUpFSk41aEFhRFk5cW80WUw3TWNtRFdH?=
 =?utf-8?B?a3JBRll6amlpdFhXUXMvbHllK3dJQWkwcHp3eTM3bDVXY2ZMb0FnZWo0Vkhh?=
 =?utf-8?B?QnpTM1gwUXdacG9MdGt6NEUyWjloZEpNbSt1TjRTVzU1aUFPQStHRGNuV01o?=
 =?utf-8?B?dUhrYWg0ZnZLWGlWWEZlTE1RN0ZneUJvdVRTT0NxZ016M2kwRHF6NEdLQU1P?=
 =?utf-8?B?M25pa0VURzhqaWNNODVQMDRFREE4aW5pRWJxOWM5MXNFUWo1eTYyWlFOczBn?=
 =?utf-8?B?VW8rZFZoZE9BNHNVbDlzNzlZaEdaV0ljZ0RHcmVoNHd6SWFVUzZqbjFIdkR1?=
 =?utf-8?B?SW9nNHNpTHdTVVFGMS9iWGdSN1VWQ3JDWnBiTGZ3czdPeXRYWXZiUDZXU0Z3?=
 =?utf-8?B?RS9qMXBkZVhQajgySVhDZTExZmJLNVQrNGVzZGpTSVJ2OFc3RVgwS3NpTnZV?=
 =?utf-8?B?VDU3UUg1Rm1xZXZSV3ZpQXI5TTFSMm83aGtpU2lrczRGZE15S1RwbElvNUl1?=
 =?utf-8?B?QitQWnZiWFF5OHNWSnhQSC9Ed0VGZlJCUWdIckpUeTFHNlo3OHJobXJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1IzZTBKRlIvR01LcjYxeWNQb0RqbVVpcUFlalZiWXFyUFRTcUwyTjFGT3A0?=
 =?utf-8?B?T2p2NEsyczVCNVhJRGlkYWp5czE1eTB2Q1lXWmNsc0R3YWljM2t6SGNVdjBU?=
 =?utf-8?B?ZWJNUXlDc2FSZ0RDSkdJdVpzeUN2aUd5M3hpeU9HeGRvREt0MlAxY216R0VT?=
 =?utf-8?B?WDd0aktTeS8xc1g2ZFo3UEZrdmM3YVVaT29EMG16YlR4REZTQ0Z4MXlHbDFm?=
 =?utf-8?B?dXJDa09pb0NFTUk4R2pLa1FScUVUbzFibE9OWUE1N0tZbnJ5d2IyTFFhWEFE?=
 =?utf-8?B?eXphQUZnUEc1WDR5VC9KdVM2NkgxaDBzRE5xUlhZTHkrODlOS0hTZzgwZUsv?=
 =?utf-8?B?SjA4eXRIVzlNc0tXa1N5ajd6WjZ2aW9iSlhLa0pJMFozeVlQYkpjL2RuNklL?=
 =?utf-8?B?WkszQzUybnhGcUxZQXo2RXdjeEkzSWlIczZ1L3JnY1ZjSS9QSTM0bHVxbGdk?=
 =?utf-8?B?OWJPUkswM1Y4SGZnNVVCRHZsZWU2c0FDbHFxWll6RjJCVmF5RXFKQXNiVjMr?=
 =?utf-8?B?ZlFNd0NDOWJwY0RpNGVLWkpwQW9wNlRYcXBNbHFKN0NHYWRFaUtqRUcrN04v?=
 =?utf-8?B?dG1mT3BNcDVWWVFRUDdvVDlmSjFwRlNaQXFQSUhlM2lDZG5KLzdQR01jRndX?=
 =?utf-8?B?ME1iSnpkU1pLdktVc1lUSk0rRXB6TzYxRkl6d3ZpWU85dXhURGR3ajNQUnZR?=
 =?utf-8?B?WlJOWnBXV2pZYW5aczFkT2JxNXZYSHhOcmFCRmlQY2R3M2FkUkhCWUFSUUFS?=
 =?utf-8?B?Um96Nmp5QXA0UXRkdGhLTDRZek96WGFmbnpKMTF4VVdCNnRzRm1qSE5aOGIz?=
 =?utf-8?B?Skp2YjBpZ3NmdmtqNXVvcCtBMW1WQ2lwL1NNU3BVNHBXWm1acjNpYVpKblB6?=
 =?utf-8?B?R2pLQWlPTzNoV25weVUzSERLbzVFOU5abWtKaEptT3N4QUpvWFpXMmhxSDJP?=
 =?utf-8?B?Q3liOEYzTG1Fd0ZaSXh4MUZQMld1SjhlamVQaEdyQmhMNE1aZGIwbUVJUTdC?=
 =?utf-8?B?M2gwZEFTYll4UUs2NUhTeGhEcGdiWGlIR3h6MTFkenEwVzRnQk1NZ01MUTFo?=
 =?utf-8?B?UHhXRmlrN3BuR1E5K2RpeHFWcHJLZDRRUllvQ1RKV0ZGSmU3aGxJYVhXY0ZX?=
 =?utf-8?B?ajJ3SG1zaitBUmNKMXpMOXdBemd1cXN3L1ZFNXJNQmF1NkY4YkJyZ3Bkdno5?=
 =?utf-8?B?K3FMVndsZFRkbTdRaHNvRml2RDcrNjYxVERSbVJYeTBJa0RqdTRRU2hxOGZ0?=
 =?utf-8?B?RXppNUYvRjV4NUQ3UENPMHB1Q1JUVW5wSkhWY2VNTnpVdEY1Ym94QVFzeFZL?=
 =?utf-8?B?azN0aFFlc2NkaS9sakVoNTJSL0wySlR4Z1BpU0VuRUlQNHp5L2g2Y1BFaGc3?=
 =?utf-8?B?OXhGclc2YmRLSFJMbGk4NDJCNGVqZWVhU2RwQlR6WlhPQ2FoR1lQRGVXcHkv?=
 =?utf-8?B?TWdaN3IrZ1hacDFnNHBEaWU4OGF6YUo5cmhKSEFQYmxFUU9nQTI4MmJadlZH?=
 =?utf-8?B?bVcyYXRuSGZUcHlLbzNmUHZzVU11SzJpcXNWSEpRcVppQWdNbStWMEJCQ1Rz?=
 =?utf-8?B?eG05dC92UllkbC84TmY5Q1JROGw2K2FXcVYwQWd2QnQraXlqaE4vSHlONWJR?=
 =?utf-8?B?MmhzNlFyb1BqUmd2M1pLcmJPOURGMExDa3lZdWpGcmo4UmthdWVNTmsyT1BT?=
 =?utf-8?B?SkpCcGJ2SXI4Q2NpVyt5VFBrQTJHeEU3ZUZJTjVaR24wYU5Ub1JsVC82UUdv?=
 =?utf-8?B?VDJXdkdVUmRVT1o0anQ3SVIwZHFHTTdqbDl1THdLWU9GUXdmMm5xUmRNR1Jm?=
 =?utf-8?B?aTR1VXdkcjlHREJ4TStXSUhrZllBSk1sVEZRYkovejZlSk1IZjkrOHpjM2FN?=
 =?utf-8?B?RTNiZFRBa21IaGVxOGZyY0ZPUHZRV1lNZzdPWFlTZ2o3NUFma3RESzRuK09z?=
 =?utf-8?B?ZjZ2UEp5Y05YZDZ2NFhIczZhZVh1UTVXUVF0Z2xGZTlZa3o2eEI4b3I1b2JK?=
 =?utf-8?B?aDNzR1VmaG9YeC9hMWZEWUNGN2ZmQXJnYjRkMlF1WlVZbFJJRldZR3I1SVkr?=
 =?utf-8?B?eXYvcEVhSFR2SWxxTlVpZWExSlF4ZDdBZWVWc3kvWW1Bb25iaGNHLzZsb1BO?=
 =?utf-8?B?QkJGa0U3SHVtUXhiU1VkOWNlY0hhdHpLd0VPUlEvUnVNSCtoL0VLWFk5MHAr?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd8fe45-8803-4fa9-4c40-08dced461ccb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 18:20:56.9461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ov8xwtWpPF67vcXBR7C4rjyGG3MAMs+wyWHsITHGXYTgjnjW2vNzxzAOkEW245L2rrxqjgIAw97tfA1c+O4S9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v7
> - Fix commit message
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

> ---
>   drivers/gpu/drm/xe/xe_huc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 77c5830309cf..6a846e4cb221 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -296,19 +296,19 @@ void xe_huc_sanitize(struct xe_huc *huc)
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = huc_to_gt(huc);
> -	int err;
> +	unsigned int fw_ref;
>   
>   	xe_uc_fw_print(&huc->fw, p);
>   
>   	if (!xe_uc_fw_is_enabled(&huc->fw))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	drm_printf(p, "\nHuC status: 0x%08x\n",
>   		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }

