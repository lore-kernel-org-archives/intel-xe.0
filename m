Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA67FC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905D810E157;
	Tue, 25 Jun 2024 21:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fc1yC0xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FCD10E157
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719352405; x=1750888405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rgpka1tMJYzVRAXw5JQkv80Sa8D+l+V7/wj+PYD9lPA=;
 b=fc1yC0xt8cCqXqyUwd8b/VEs+4QK75yB0nBGabP2C/y7zy3T3+98azFS
 Q/S1L6pi5nbqUX26/AlkFECTvkznbwC6uCHknBzJvRepDtQADUXseJlmV
 gOcVyYTDl+KdKmkQ4Rcrpr6B9RaBjsnvosMHt8itznTy0CTLBtYJ5Ui8n
 +DqL6sTgKWzTGRrWIdyg5w6Bk1cg/YImQIcMM2F9P0S/lTA7WWDlaS+Mr
 XXEmpv0gZZX6uUJ2rv8u5lqknn/YNQe0cmrvL3drvfV5c+LBFXG/R2rCO
 6QH3KDgF0+p8fK3jRpuWwzWPH30O8AvZX6QEaCfgBw+rCdXXFX1ADUItg A==;
X-CSE-ConnectionGUID: X0SXz1S6SCONRRu1d0G6jw==
X-CSE-MsgGUID: L8ZVIYeATtux3kLpF/elIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16626649"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16626649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:53:25 -0700
X-CSE-ConnectionGUID: mNb8uyR+SUqCUruJ2whr+Q==
X-CSE-MsgGUID: ISjMe0q5SNm/cD/yan9vAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="74546218"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:53:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:53:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:53:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0xXcjs4K1eXbrNWeJBNFsY4QEiWFUZrqrWWedaWDFoNlJoyrHws9tYsrQtYnxIC21wplaG+nTGez/Ye9WSM4qG5ruQQyD/TyU2Vur0Vm0zvZrqNeHiUC6nsSjRGRHWkTaeVenMiGN1Ys+ldJtp4mXRCmeaX86PZAjTbxOap5JW1InX6HaSuiRjagYI5zLrWXPTNrBvh4exKmPDE17KlfWpQdU+FfBGStv65py8wj8HPfo8nvvNvsr6N3InX9juYgkCr3T/wFCOfT7M7roCyepw5O6fVUUNhHg5IXHeaOh1yTcRH0ziO1f+73w+JCP1V4/Kdpuzz4MVa9yE4QGH3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+WflaWZzpdG+Vnxi8gvx+u1baVULpnzzQRaZIhz/+s=;
 b=K9sB2kMq7MW8G/1KfobbAMKLMQPmccCcSbbKcRX21i85fYsdaS4cAjAXsjCrI9aoqdHGa5imU3hzR7zk7USiwhAmN1JXBFr5M2HIXw6PB66jPCuVPc56tnGcu2qa6JPLUVViNfqYPD9fh5GjG7iQz1qJgNZxmr92Ly4N6TLTrReKrdGsBy3aRhVqfnEfAhELz/Mj1WV4gH/r8gCovami1VCxRwZMRcs9iXVo++iSawP9YYcwJsfhL8kAXc82EWUcDAc/xVSDrUIxrXSbJULrK5VDbGYAQ3UCwph82/hCwd1rFf5uh5z7wJ4O5UwwbMkawcH89vR1a7Sokf34TKDNKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 21:53:16 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:53:16 +0000
Date: Tue, 25 Jun 2024 14:53:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Jose Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/oa: Allow stream enable/disable functions to
 return error
Message-ID: <Zns8SpJfUJYMSYA+@orsosgc001>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240625201518.766925-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 876a18b7-580c-425e-9f4a-08dc956137a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmR1ZnJldllRV1hEZWdCbWlzQ0JYUTM2c3gvYjdETlNua1lpRGovcTQrMkZZ?=
 =?utf-8?B?T2F5OEJzQXVDYjN1UjhHZ3h0cnA3aUNDVFpyRk5NWi8zTnRuREZUbGg4UUVO?=
 =?utf-8?B?eW16NGdSdVVLY0ZBaGQva3JJWXdOZHRMREphQ3BObjExY096Wmg2eDZvSWcr?=
 =?utf-8?B?Q3pFUXBIV0xTd0Vic3d2VnU3Zmo3d2xwaUpoeEphbHpFVmpzdkNoMlp6M1NV?=
 =?utf-8?B?N0RCQWU2KzV4RjVGVFUwbE9wWTN4dlJXTUo3ME5FdjZpdFdsVUFGaGlEZ0Z5?=
 =?utf-8?B?WCsvTXZST0JaZzYxUTU3YUVNYTRiNWFnN3NaQk9pc0hkVFJJYVlzYjBOM2dm?=
 =?utf-8?B?ZFRCUUUvUXNjek1mWlBtSWNIMWZlUG41UmgybWdpd2dZdmIxOHAyQmpxVVR2?=
 =?utf-8?B?ZDJIRWpwWCtaeVFtUUxkTUtuL0JteFlibU04bkhxRVE2empLTWdnMGdpd2RF?=
 =?utf-8?B?bWJoWTJqbWFDeUpuTVRPTlhUTDVEMWlnZWpLRXBXT2hXR0c0UmZaZ21NM0dr?=
 =?utf-8?B?OC9wdUpoYlFQQ2dhS3lFdS9oOFJ6bENtOWJ5Lzc3bU43MHhHQ3ZIQ2JlN2x3?=
 =?utf-8?B?dUJsYkFSYXFYTytFVDJhRmVoeWdkWTJEY3llY0p2OFVyTWJVaGE1STRVZmRn?=
 =?utf-8?B?b3NWUitPL29FYlBDNWVFL2p6YnZWYXNHUFQ4NVFPS1ZoZGJyTVQ2VVlESis0?=
 =?utf-8?B?algvQndJa2JxT1ZKc25iTnJaTm9PTDF3M3RUS3hrTDJQU0x1NEtPOHZWZzBF?=
 =?utf-8?B?dGlnYng3YzJ0S0xJdzcyUXRqUEFSNSs1ZmFXYjRQQTJhT1RUWTlXREFiTnlX?=
 =?utf-8?B?NUU0cmN5Z2V5UlNIS2JCZHhneVVKSnp5ZURWMmU5b0ZUbHZ3Yk13cXRVOVJO?=
 =?utf-8?B?NEJyc1ovbm9jeVBDZFBmZDVoaXZkNEVKRWxHK1dlQlV4ZzREVS8vYnVMQ0xu?=
 =?utf-8?B?YThJWHMwbXZDdDFxdDZURkZ5alFXblFCR2FXN2t2T0ljWFJxYUtUdXFwSVRX?=
 =?utf-8?B?Q3BGa1ZZR0Z4eUtTOHNpZ0RrV1RCNVJwTkdLVUNIcXFGMmNkeUdycitZQ0JZ?=
 =?utf-8?B?Y3NVMURiNTJySDdkTUxzNG9jTExrcm9RVDdiWW5VdVpmSkpTZCtBWmx6aFMz?=
 =?utf-8?B?K3oxUkRWbjRBVm13MGl1a2NxbXp3SGxPOFFSczUzVDdVOGRlb3pIejJUMVAy?=
 =?utf-8?B?Z0l2NU1uamNVVmtuQ25kWEh5YWtuQW5JVzZ3UGVycEh1VXBGQ3Q1UkFHcjRj?=
 =?utf-8?B?OUVhU01hdktSNkNhb0prbTVSeWUxRWpOcUh5b01pdUZBanlVekt4QUN1djhx?=
 =?utf-8?B?bzJLR241QmN4VXBseVpCUUFkRDVYSVlWVzBLb0ZUZVNTdmRJbDVlaTlmMmFD?=
 =?utf-8?B?V2FTMVNiR1ZqRFk4aXFKTS9mRFliSHJ0ZTQ4SC8vNFV4TE11SllNUjBtY3BD?=
 =?utf-8?B?eU1NbjVGVDhhNXlTbnNuNG5TeTJXRjIvcE9JVVkwT0hxckhXM1BzNG9NeFFI?=
 =?utf-8?B?S1pTWno3Mi9nRDFTVmFKVUR6dG5PZ1czSXBtcTN3QVg2ZHhNU0VqaVhGWnpE?=
 =?utf-8?B?TDRkejFrbHVSUiszRGhDYTE0enBtZ21yaWNINkxwRFloUlo4eUxScGRuN0c4?=
 =?utf-8?B?eHFEL1pOekNLYVZFMCszT2xrVHlENytpUC9EK0l6MklSTElCNmp0K3M3MHNl?=
 =?utf-8?B?QjVGR0kzY0xZTjg3Z0VRN2kxa3RpNDNIOFlaNDJLeVZJdS9KZ3RadXE5Z01M?=
 =?utf-8?Q?cekZUVJhVC+K1CWljsL+hrHpENHIDy2KuuXYIao?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTljbG1ZNmxDTjk3dGcvWGs1cFViWlFrUUYvdFpOSHpqMDBORHoxemxCMDZV?=
 =?utf-8?B?dHZDdHcwV2tQcGZ0ZjVoNlNBUG9pT05SSEtuR2g3TkRPMUpHdEVvQnNYRkEz?=
 =?utf-8?B?RUliYTNCZ1l4eFlvZk9zeUZnTUszNS8zTFdUWUU3Mm5xd2lVNjg3STJPYnNE?=
 =?utf-8?B?azB0eDFJdkNtUnJ1Q3hUcVpSaWxxU3pjZjdQUHMyWjh6eDlNWFJUVSswR00w?=
 =?utf-8?B?MlFRMmwwQUhtL2JYaVhtUmxBTGxZcG5XMFkrbURZdXNjN1dIUExHYm5MRVNH?=
 =?utf-8?B?TXZlZ3JvaEl6ODdqS3pTS0ZYQWJWOTFzRXhhdVI1cUlFb25CSTR6bWthVGp5?=
 =?utf-8?B?TUwrVSt2VnlQTVgrdkxyZXFSMTlTZ0NzWmVubEJCTlF5ZzE4K0tQakR5RFNx?=
 =?utf-8?B?NlkyZU9UeWxUenFBZ3pzY0M0NWo1aHNlN2pRanVtQUJTYkFLV2JNWFAzN0NM?=
 =?utf-8?B?NUxycWkxTXozeXlRYVlLRHNuWEZFSzBtMEdSelZaRDQ2dDZmZmhnMzJGREQ0?=
 =?utf-8?B?TWhtYWpqdHpnQklCZ2xKbDlXdDBJTnZBdXBtVi9yZ3dzT25BME10OGVMRGoy?=
 =?utf-8?B?MWl5VDNRWGovUklrNnY3QmVHTlhKdlpqRGxNcXJWc2xsa3NUSDhxd1U4cElQ?=
 =?utf-8?B?VnA2eGFxdFBIQjFJamdjdkcweEZpc3hhQzNrQUdnVEU2UGJEVUExMkZKYXky?=
 =?utf-8?B?VU5qNis4NnZWNGxnY0R1Z2puckV4UmZuSG9ZQ0hPZVZiVFQwZGhJYy9mYUdw?=
 =?utf-8?B?MVBkVENtTEdVSitGMUtQclozMkFCRDhpaURJZ2xucm1XcTlLWjdlekQ5MzZ6?=
 =?utf-8?B?NHgvb29RQ1k1Z0k0MWpiZkRRVWtmcHdWMEU5SUdqZTBYRHpPMHV5QzVOekww?=
 =?utf-8?B?QmJWK214RTZ2c2hTRnp5RXpSSksrMnBWZzdvYWJqZ2w4MWhLK2tXL2l4SkxM?=
 =?utf-8?B?RmwrV2ZabzVSUDRCOWpVZlFubmQ0WWRDNTM0UEdVTmhLUWZBSFByNTUvbS9U?=
 =?utf-8?B?QXBTckhXNTVtbmViQk91T1lNRFdpKzZqN3lkaXlhTjliclZrWS8yTExqVGhP?=
 =?utf-8?B?U3BKbnRzZzJ5SmprODQ2eXdrMkYyOGhxeUthbkRyQ1dLcW51Y3RpaW5HS1Er?=
 =?utf-8?B?ZElFY3pFd2pGa3JsVmp0UkYydjBlUUFkQ2Z5aUFTWk55MVUxYWs3TnllQ3A1?=
 =?utf-8?B?UmcxdHpuMFpZd0h4RnM2VFI2WGRNUWVlVzVTK2V1Rlk2VEFsZ0ViNFBFTVJR?=
 =?utf-8?B?SUh1SjdGemVUV1RzWkRWbVdkSFQ1L3VOQU5KUyszeDFoRzQ1MTRlSkU3ZlFv?=
 =?utf-8?B?amR1TFc0Wk9kR3VzRjVvZjBkRERBazRuOHRUQ3UyMzFZVUVBVTRIQzA0bG11?=
 =?utf-8?B?U3AyNHdrdUVnamlUK2FDMHBvSlhyOFZHOEFieGN5Rk1jQnM2N3RmRWF2WmRj?=
 =?utf-8?B?TWVnV2NiZWtIV1R0SjBDQ3M2R2phNERYbGNQVG52aGNuc3ZEeUpzYzRjWkc1?=
 =?utf-8?B?UUZ6aCszank0N2xRbUEzdk92VzlmcC8rNVlVNEJJKzVuTUxZaXFFRVJxZDdx?=
 =?utf-8?B?cFJ3aHpESlY0R3RqemtNR2dOa3RwZ2xNcnhoTGUwWGlmMmRPeHFVQ3NLWmF2?=
 =?utf-8?B?SG9QWVRUZmpOVm9rTjUxVk05NXZpUTNJbm41OCtTd0c0QzhjVjRMb3JFL2dl?=
 =?utf-8?B?WUFDS24rZys1K2daUmttRlAxTitXTHVRZ0Rrc2hNbk5zN3czUGtwcmd2alVl?=
 =?utf-8?B?aGR2ZHZPdVUwVmZsQ3h5cS9ZbG9JckpQUWJMYlVvM3VpZFdDZTIxSExxdmF3?=
 =?utf-8?B?QlRvdnNrZFVoWGRReENxSWdpY1dDWW1LWXZHZm54emJza0hKQ1FTNTR3aU9z?=
 =?utf-8?B?Vm9JbE9OYzF3ekQ5c1RNWllEcHFxeEIwbmU3cE9pS2VnbVVXRzIyZkY3WjZp?=
 =?utf-8?B?c1hDWE4zL1owSDd4N2VTT21RVGRLTDFVaWxFOW91cG1KWHdNbmRWeFQ0aXFE?=
 =?utf-8?B?NXNmRDVmTmI4MTlkTUdQODF4WFNhSGVwMWFoWnhZVURNNWx3ZktlMk04UG9y?=
 =?utf-8?B?elIzQW51M1JFWkNvMDNmbHZHQ3RvQ1FWUWl3VkFtbFRTQzdMYzd2R01OVGg2?=
 =?utf-8?B?SHg5Nml4bkRQYXFncnhuMU5HRVR2ZU1VNmlrM0NGOTB0aTNjenhyc2t0dGRC?=
 =?utf-8?Q?PVEP3+1g91WdfCvQ2HPPcus=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 876a18b7-580c-425e-9f4a-08dc956137a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:53:15.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lh2DaZjBvC+9ZAZonNJ7fstR3Q/t9uPn30G31PuAjbP66PdKDY8st1XK0fNb9TCNuuGEEF48L+mCw7WgBrJDA9mRiFmuSH/mX84YWqA0MRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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

On Tue, Jun 25, 2024 at 01:15:16PM -0700, Ashutosh Dixit wrote:
>Stream enable/disable functions previously had void return because failure
>during function execution was not possible. This will change when we
>introduce functionality to disable preemption on the stream exec
>queue. Therefore, in preparation for this functionality, prepare this code
>to be able to handle error returns.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c | 38 ++++++++++++++++++++++----------------
> 1 file changed, 22 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 9263ae9a864e..a68659fd5386 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1013,24 +1013,26 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
> 		hrtimer_cancel(&stream->poll_check_timer);
> }
>
>-static void xe_oa_enable_locked(struct xe_oa_stream *stream)
>+static int xe_oa_enable_locked(struct xe_oa_stream *stream)
> {
> 	if (stream->enabled)
>-		return;
>-
>-	stream->enabled = true;
>+		return 0;
>
> 	xe_oa_stream_enable(stream);
>+
>+	stream->enabled = true;
>+	return 0;
> }
>
>-static void xe_oa_disable_locked(struct xe_oa_stream *stream)
>+static int xe_oa_disable_locked(struct xe_oa_stream *stream)
> {
> 	if (!stream->enabled)
>-		return;
>-
>-	stream->enabled = false;
>+		return 0;
>
> 	xe_oa_stream_disable(stream);
>+
>+	stream->enabled = false;
>+	return 0;
> }
>
> static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
>@@ -1105,11 +1107,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
> {
> 	switch (cmd) {
> 	case DRM_XE_PERF_IOCTL_ENABLE:
>-		xe_oa_enable_locked(stream);
>-		return 0;
>+		return xe_oa_enable_locked(stream);
> 	case DRM_XE_PERF_IOCTL_DISABLE:
>-		xe_oa_disable_locked(stream);
>-		return 0;
>+		return xe_oa_disable_locked(stream);
> 	case DRM_XE_PERF_IOCTL_CONFIG:
> 		return xe_oa_config_locked(stream, arg);
> 	case DRM_XE_PERF_IOCTL_STATUS:
>@@ -1432,19 +1432,25 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 	if (ret)
> 		goto err_free;
>
>+	if (!param->disabled) {
>+		ret = xe_oa_enable_locked(stream);
>+		if (ret)
>+			goto err_destroy;
>+	}
>+
> 	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
> 	if (stream_fd < 0) {
> 		ret = stream_fd;
>-		goto err_destroy;
>+		goto err_disable;
> 	}
>
>-	if (!param->disabled)
>-		xe_oa_enable_locked(stream);
>-
> 	/* Hold a reference on the drm device till stream_fd is released */
> 	drm_dev_get(&stream->oa->xe->drm);
>
> 	return stream_fd;
>+err_disable:
>+	if (!param->disabled)
>+		xe_oa_disable_locked(stream);
> err_destroy:
> 	xe_oa_stream_destroy(stream);
> err_free:
>-- 
>2.41.0
>
