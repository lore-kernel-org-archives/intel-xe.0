Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6514FD3176B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3BE10E2DD;
	Tue,  5 Nov 2024 17:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvzcpM43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B91310E2DD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730827593; x=1762363593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OFB7xETQxoKmlYK5/Yyp1e0on9RvoQ5BtQsp3HFJu8g=;
 b=ZvzcpM43AWnyEDXS8iXCKvZP8LAal0zfkyC3kvNAk0eWLu6WijgSw7JS
 lNSMpTlHo0GGlDQPJJNSXmHQTZyz3E82hidPArLb8JpLXr8RoCeiA0SF8
 Zp/6Ymej4kBDNPlzSi98OoTnXj7yWn+IWa4+nt5dWaoo3sBaStKZ+34qx
 Ed94uzyGCNBgOr+r7rPihfHhctRKwmfSMgFx6lHcROZNaHqmq3HbjkUyv
 5CqFAtwsvdxUlIIZKmHXm7Mbapga0002UBMAqRt1MsecF7zspKlBF79Su
 q6jYkLHAdogoqgmN3zOAGqOEuUTFGnUWbXAlMxHtQm+vAiJ1YaQrGGYJr g==;
X-CSE-ConnectionGUID: m5vXYJ7sQX6YKqxGXYVJ/A==
X-CSE-MsgGUID: 3QLxsa3sTu+ZxaA+B74p6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41963010"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41963010"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:26:33 -0800
X-CSE-ConnectionGUID: NDd2iG4/R9+P7QUSv0kb3A==
X-CSE-MsgGUID: S2OEIs7VRyWr45XYJGRm/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84211087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 09:26:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 09:26:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 09:26:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 09:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H293FuviPxhwx/bB3X7liYAdLcaLZ2/nIAZxaQAswvkKIyHS+d36Q7thqUx6LMBvHvg9AQ3dpEg2WYIepkjwrp34r/4U4QyT+EkmywepPyyLXcRGpoTNpPyJvIVR7lB8jbwIbR0DSwEhZUXABNm1xFtVOmPULonbC2hnnAeLeE0+jqJSLQMrmm9ONmocY3oT+7Xozxv0jUkloaWWjbsEOvCA2yezfwVMf9s94JUsADnbnkYoGLK5u6/jbJrbe1WXt8nt4poLDgJyBuqnBEBcIi6AUQdR5jwn9zBE0cYXPvNeLvsUMB3Y7ofRMEmpmwoFD0wX0ytG8gqatx0BCBFExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVirYTFiJVH6XutpZROVT2QsPxVG24TkZLHpIJJjsas=;
 b=r/HY/1n63FQxxxFBmWIS7G6stlHXUux63vEPSQCqWHbve0gBuyktAfyZX+YdVGUSyAz6mPz9+diG3720v4e7BArtdW0LG/f7sgio5XCbHQx8B1CM9o/2XlfLbSq8eaem1WxGmQIstZY1ek+gcE5RkK/5uZ7f6tVqrwDZzFTKWcCSR/Q6LheK2lfoNnGnONuV/RjSfhuSSaghD3wT4yhxC1NrB58dujlQp+6Wg4LeK/T7Mj1A7mIOMOzkEH9qlpVINHfuCu36Fs5Mo6YWlwhs3TSzRgFizgo+gIs0fVDnrZT7g8qgdCL00G4orB3xIldAx/wzdiu9DoNJm4GnJXGuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 17:26:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 17:26:28 +0000
Date: Tue, 5 Nov 2024 09:26:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/pf: Expose access to the VF GGTT PTEs over
 debugfs
Message-ID: <ZypVY0DtjRgRWiL9@lstrano-desk.jf.intel.com>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-3-michal.wajdeczko@intel.com>
 <ZylxciEFAXP749BX@lstrano-desk.jf.intel.com>
 <9928fbe6-c874-404c-82f0-3c0db4d6eea6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9928fbe6-c874-404c-82f0-3c0db4d6eea6@intel.com>
X-ClientProxiedBy: MW4PR04CA0354.namprd04.prod.outlook.com
 (2603:10b6:303:8a::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: a0265fe2-8601-428e-b4df-08dcfdbefb8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnFBZXdpTnV6b0lFdnMwV05QeVpsUlAzNWZxVW5KUHVxT1YrUjJTL2tYZEV5?=
 =?utf-8?B?c1dvY1F5amNhcnhpaUtxOEZ3UEkvVkhIeDgxeUJGOFl5Mmh0alF2RHR6SEp3?=
 =?utf-8?B?b3Rpa0JENlB1RkQzS0dacUZGVU5ab0ZoMW5qMVhzcHN1amdvWTZXbnQ3Mlha?=
 =?utf-8?B?eXhnOXVMNldsUHJGMitaVVFQemFYZGhaVVlmVVZWSmVTcXlMWE5pUlJwTGww?=
 =?utf-8?B?NnhLVDlBeTNLZmp5UmJHdlRod3JZcitoLzNqdk5KWkdPNVhDbkpkWXNabGlr?=
 =?utf-8?B?SHV0blR5a0VnNWhmK0U2QVRhY21MUW1GZUpsUWRDSFUrdTdxSjB0dTZ6RVZL?=
 =?utf-8?B?eVNKL2wrcmdsMzNUcEVxOHg2enlSb2c5T0JnVmVuMEF6K29JVHdNNWRJRGsv?=
 =?utf-8?B?ejA2bThMRDNrYjFNYnIzY044NXljbkdUWkNlQ0RWVnVxVDlHaE9qRDUrRldF?=
 =?utf-8?B?V3h1YWRrMU9NWXprLy9Kc2Zxd0tETWhIenNaOEhtVkt3c09QdXdrWWUydjUv?=
 =?utf-8?B?bjVMSHRZdWlPZFdrV0JEcFVRd3h3MkVmcHZLRTB4WGEySmM0K2dZOUpEQWNh?=
 =?utf-8?B?R25XUVB2TjNoWXR6TzVhUGpIdjF0WUpQMTZXYXYwRkkwZWN0Nnh4RmFGYkRZ?=
 =?utf-8?B?Y2xPSkdYTDFvaTdjdm4xYkRKSmRWME9GV0UxOFdWZXlvUDZhVzZTZ2oxcjRa?=
 =?utf-8?B?T2ZxRGg2N1d2MThPdU05THBmcGVIcXBvZDJxNWFZT09oVWNXejFES3FvbU11?=
 =?utf-8?B?VnZqdXBHNnVLM21wRVRXNEovSUJ1YkhTWStHZUF1VFpJTTJKRXllemYyRkhP?=
 =?utf-8?B?WUYzbUNTbmtYYWphcWhwZW1aV1VwRFRLaVdiczVHVkQxREdJSVR5QnlhY2Fv?=
 =?utf-8?B?MCtLK0VoT2xjQU9iZnkyZENqSEo4Q0xIWUEvSlNObWwrZk1nejNnTTAyQVRX?=
 =?utf-8?B?bmN5Z1ZuVERZTkdrNE9FUkdrL1JJQkxnMXJNYXlDSjE0NVJoSVhpSGF0QW5T?=
 =?utf-8?B?QmduTW05R0twemgxaEFMbFQ1WGFhTkwxUUxHa1FWdTA3UzhqTjlpRGVxeXVm?=
 =?utf-8?B?c3NXNHE3TDc1dHo5YmlBSjJHOW5LY1ZBdEgyeThSOUI3bjNtSHZ4NWp2UFJT?=
 =?utf-8?B?UHNVU1IxYzNLYU9mVko3VU9zVDkwM2RyQVdBSDZ6L1E5dFY3NnhIdmRMK2Nz?=
 =?utf-8?B?ODJ5enVMVDVsaTkvcENIczhKWU9KLzAwM3hZc3Y3Nno2bWFRaEI4VCs4cHRS?=
 =?utf-8?B?NXRQZXVQVm9IUW5naUZGQUFkNCs1cW5yN3FabmVrM09yQlFLK0d5RWlUSzRq?=
 =?utf-8?B?bC9WSzcrbGhxa0lVakFWRkNWOEUybEFFSTJ2dWplVEZsYnpHMEQ2YmVzb0xW?=
 =?utf-8?B?cjNNVW16QmxzLytsMEtVTW9NNDRRWmJ6UDFKeW5ETHZrSWkzN295K3JZYitt?=
 =?utf-8?B?VW9aQ3hvMkhaVkY5RUZ0V0loa3JPVmhIbGJiaFgzWHpreXQvSVZKT0g1OHJV?=
 =?utf-8?B?Z2FwTUtwcjVGZXI2WVhVKzdmazhYWVpqQmsvZ3ZRTWJrRnl2NmpMc3ZEMkU0?=
 =?utf-8?B?QUN1SEwyYWdJei9GUW5kc1dNTTNaRXZ3ZVVCOTNGNWMydDRwN0hXZmZzaXVy?=
 =?utf-8?B?d29BbWhvY25zNkdQbEo4U2tqOC9HQkRUS3ltV2lDR0NIc2dpaFlVUkVNMmJt?=
 =?utf-8?B?MFZRZS9PUXlaaUJHQndQd2ZJbGo4S3VvZkliZE5aSkR2cXQzNGduYWxRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpuMVNTUTZBVjh1dDNtaDBhSy9nd3lYUklJUWJubEJMMVBuNno5eksxRGJo?=
 =?utf-8?B?Zmhwb0VUa1Zza3Y1YjRkc1M1UWZ2THZPRHlYdkJsRlhsS1QzV0g2bTBETVZ5?=
 =?utf-8?B?bExFeXBjSGZBcEhhZXJXUlAxSTRCdER3ckpvRHpmaVR3b2JQMC9VbzJLRHdK?=
 =?utf-8?B?QlNvUmNTQmhnSmdYY1EwTHNaenlGdzJEZmo3bmNHV3FlUTZBYUxoT0ZObW5o?=
 =?utf-8?B?ZWpjanBySGM0dE5tV3BIVjB0U1l5WDVob3VNL0hqNW5QVmJYTXYzU2VCTzlp?=
 =?utf-8?B?UVBzbGdCdHhFd3pwRmRnWDVIWWRkU2tVcnN4YVhrVW1wR2U2OXZTVGkzSmtG?=
 =?utf-8?B?MTJPZ3VGMnl3ZHB0L3lOWU5talhnNE9ZWVQ4OWk4enBXQjM4WG5tcXNDQUZ0?=
 =?utf-8?B?TGtjUU5RV1pmdWw0UHpIY0R3c05iSWV3UldCMXBiTjlPQmF0YUUycnI4b3p6?=
 =?utf-8?B?VnhBZFpLOVNMTWE3aFJFYTk3RlQ1QXF1OGZpcGhLVmlTTjZIeUhvdDUyRWlS?=
 =?utf-8?B?SHorWklKTlVtTGh4SERNbFh5KzRsbG0rYTByU0RHbngvUkhUbG9LcW1YVWl4?=
 =?utf-8?B?c0ZEQThZaG5ibWIxaWpDWUZmRlRsL1ZOUHhTeWRtV01vNkhzQmY0Rkg1UDhz?=
 =?utf-8?B?V1A4UTk2V0ZvNGt6MzQrRlYyY3ZFVzhQamFSd1JPSUd3MFBnNzhaaHhHb2JV?=
 =?utf-8?B?UjFldCt0RVhpNUhYbmN2ajcvd3llK3Z6MWgxZ0ZCbDNwOVBZeDY4bzJLdGhn?=
 =?utf-8?B?aWJRWXRWVm41N0drbTF3Tkk5dkZ5NWlxTmpUUlAwU21hdW1CZW1hYitXWnlJ?=
 =?utf-8?B?UjVrL0xoSnJrbWZ0QVFveSt1VWlaTlVTYms5Sk91cWN0Ty94cDU0QkMzb1F5?=
 =?utf-8?B?dEdGVzB6VG0ycFVJMkIyaGtEaTdTMVJib1V3My9HSTQ1SE1WQzdUa2J6SGRK?=
 =?utf-8?B?RWFWd1pYRGlDbVpuK1hieDd5UUFTV3pqUjAxUXZCSUtJakhFL041bVNRM1JU?=
 =?utf-8?B?bTl6M3N3SDYrVjVTeW1CRHJpQnByUTUwcy9tSFI2YkI2UlJsWUI5cUZ6bElp?=
 =?utf-8?B?NHdxajhxbnowdXJRZkFORVlZTVBlTjRYa1BUeXFna0RSMEhGUGJvby9XVHZC?=
 =?utf-8?B?VHptWWVEQWtzNGtzV2JWWXcwbWZuU2VmWlFWakZtQVVxSDVIR0w1YkFZaS9n?=
 =?utf-8?B?Vjd2Tlp6SlNZaVRtNkNQTFdMcXNpZ1NCYTVkeGFONGZTMEZSY3ZPNUovOC81?=
 =?utf-8?B?cXlJQWRoTW1UWlBKbGdIdlRxbDJURmJSWVE1YUw3bk1EQ3g2Z2wrYXNZc3k0?=
 =?utf-8?B?bWdRZTNHU3N5azY1enNMYmttQngyQmVqYnlwUk8yVkFRSVJRbjE1VDJrMWpy?=
 =?utf-8?B?UmkxUWR6OVNrbTl4TUNrS1B2bk1NRHppWCsyOHJ6dEl6NHNpdU5PV09aMGg0?=
 =?utf-8?B?Znh5ZlpXYThOeWVPb2wvbkdvd1oydmRoWTcvcWplY1QwL1M0ZlhMWHhteExM?=
 =?utf-8?B?aGhlczJQL3kzM01NN1BidzI2b2czaXJHQW5tU0tZZTRPOG1tWTl3SysxWHI0?=
 =?utf-8?B?aW5KUkZ0anJ5azdaUjBNaUlIWFJ4ZTFlK2s0dThWMUFieXdjSkluRHpjdTdm?=
 =?utf-8?B?YnU2ZGNpZ1FkamczYXNoTElUUmhOQlA2SjJFU1B5eXB0T2Vpa1BsWm1Kd01z?=
 =?utf-8?B?SUpEby9Ccy9DYkVMVkxRUVNCZzlYRjZHbXo3UFhEdklLY2l6eTkxaUdUTndu?=
 =?utf-8?B?ODcrMmJHdWxEYlA2MXVoeXJtY1lWSzUvMTN4R3BUNCtoYkRGWC8yVFFtVlJY?=
 =?utf-8?B?a1FUNlY4LzVsa2duWHBLWGZpb1MyWE1GVEtrOHRGdmtwbUFUaS84YXB2NDNT?=
 =?utf-8?B?dEU4WitZOHVQbWQ1Z25sZUhxYUxkNjZtZ0t6VjdGMlI5V3NYQVFJVEwxU09U?=
 =?utf-8?B?T281S1lMdXdPQnVXN0w5UTBIUmhZejVYVDN0Y1M0aWFaekhiVkorNVFPMmk5?=
 =?utf-8?B?cDhhSzh6WURFSzk2RjMvcmJrSFBFVDRIL1lsNGFCS2xVM3NHSHRlQThKTnc0?=
 =?utf-8?B?WkYzeUMvbXltaVlpd2toRUdKNVp5aVo5dTltdS96Z0NaVGcxY0ZUZW5HREo3?=
 =?utf-8?B?dnJBbldxbUE2QmZtNXZwR0ZFQk5zQW5pSlEzU3FQMjBmMS8wRzVOUENMWjNU?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0265fe2-8601-428e-b4df-08dcfdbefb8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:26:28.8397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzQXqWcAB6sBFb4rruVp7aXL/OyS41x5tRV6Q8VuLu21WlTEe7CFaTdeqhjpHomu8CGjFgC3eEUrks3wvdCyig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7256
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

On Tue, Nov 05, 2024 at 05:41:40PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 05.11.2024 02:14, Matthew Brost wrote:
> > On Sun, Nov 03, 2024 at 09:16:33PM +0100, Michal Wajdeczko wrote:
> >> For feature enabling and testing purposes, allow to capture and
> >> replace VF's GGTT PTEs data using debugfs blob file.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 +++++++++++++++++++++
> >>  1 file changed, 62 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> index 05df4ab3514b..69ba830d9e8d 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> @@ -11,6 +11,7 @@
> >>  #include "xe_bo.h"
> >>  #include "xe_debugfs.h"
> >>  #include "xe_device.h"
> >> +#include "xe_ggtt.h"
> >>  #include "xe_gt.h"
> >>  #include "xe_gt_debugfs.h"
> >>  #include "xe_gt_sriov_pf_config.h"
> >> @@ -497,6 +498,64 @@ static const struct file_operations config_blob_ops = {
> >>  	.llseek		= default_llseek,
> >>  };
> >>  
> >> +/*
> >> + *      /sys/kernel/debug/dri/0/
> >> + *      ├── gt0
> >> + *      │   ├── vf1
> >> + *      │   │   ├── ggtt_raw
> >> + */
> >> +
> >> +static ssize_t ggtt_raw_read(struct file *file, char __user *buf,
> >> +			     size_t count, loff_t *pos)
> >> +{
> >> +	struct dentry *dent = file_dentry(file);
> >> +	struct dentry *parent = dent->d_parent;
> >> +	unsigned int vfid = extract_vfid(parent);
> >> +	struct xe_gt *gt = extract_gt(parent);
> >> +	struct xe_device *xe = gt_to_xe(gt);
> >> +	ssize_t ret;
> >> +
> >> +	xe_pm_runtime_get(xe);
> >> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> > 
> > + Thomas to confirm I'm making sense here.
> > 
> > So this relates to this patch [1] / Thomas comment [2].
> > 
> > You are adding memory allocations here under the
> > xe_gt_sriov_pf_master_mutex which renders [1] incomplete.
> 
> I was assuming that using GFP_NOWAIT and then on fail having a fallback
> to fixed 64B local chunk is fine, no?
> 

Yes. I realized after I typed this you use GFP_NOWAIT which cannot
trigger reclaim so this is indeed fine.

> > 
> > So you need to one of two things:
> > 
> > 1. Never do any memory allocations under xe_gt_sriov_pf_master_mutex. If
> > you choose this option taint this mutex with reclaim when loading the
> > PF. It is then safe to xe_gt_sriov_pf_master_mutex in suspend / resume /
> > reset flows.
> 
> well, due to lack of [1] there are still some allocations done during
> sending a VF config to the GuC, but hopefully we can mitigate that soon
> 

Yea I see one in pf_push_full_vf_config using GFP_KERNEL which would
problematic.

> but what I found recently is that due to recent GGTT refactoring, the
> xe_ggtt_node is now allocated (with GFP_NOFS) flag under that mutex,
> which may require another round of fixes
> 

Yep, if a xe_ggtt_node is allocated with GFP_NOFS that would also be
problematic. If you could preallocate the node outside of
xe_gt_sriov_pf_master_mutex that might work?

> > 
> > 2. Remove xe_gt_sriov_pf_master_mutex from suspend / resume / reset
> > flows.
> 
> reprovisioning (sending VFs configs to GuC) is only done as one of the
> final reset steps, and as long it's there it will require that mutex
> 
> alternate option would be to decouple reprovisioning to an async worker
> triggered from the reset, will take a look at this
> 

This might be the safest option as keeping memory allocations outside of
a large mutex can be difficut to maintain but if taint the mutex with
reclaim we'd presumably catch such issues immediately. No idea if an
async worker here would creates another set problems though.

Matt 

> > 
> > In addition to above, also never allocate memory in suspend / resume /
> > reset flows.
> > 
> > Not blocker here but just using this as an example to explain the
> > current SRIOV locking problems. Hope this helps.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/619024/?series=139801&rev=1
> > [2] https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/
> > 
> >> +
> >> +	ret = xe_ggtt_node_read(gt->sriov.pf.vfs[vfid].config.ggtt_region,
> >> +				buf, count, pos);
> >> +
> >> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> >> +	xe_pm_runtime_put(xe);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static ssize_t ggtt_raw_write(struct file *file, const char __user *buf,
> >> +			      size_t count, loff_t *pos)
> >> +{
> >> +	struct dentry *dent = file_dentry(file);
> >> +	struct dentry *parent = dent->d_parent;
> >> +	unsigned int vfid = extract_vfid(parent);
> >> +	struct xe_gt *gt = extract_gt(parent);
> >> +	struct xe_device *xe = gt_to_xe(gt);
> >> +	ssize_t ret;
> >> +
> >> +	xe_pm_runtime_get(xe);
> >> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> >> +
> >> +	ret = xe_ggtt_node_write(gt->sriov.pf.vfs[vfid].config.ggtt_region,
> >> +				 buf, count, pos);
> >> +
> >> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> >> +	xe_pm_runtime_put(xe);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static const struct file_operations ggtt_raw_ops = {
> >> +	.owner		= THIS_MODULE,
> >> +	.read		= ggtt_raw_read,
> >> +	.write		= ggtt_raw_write,
> >> +	.llseek		= default_llseek,
> >> +};
> >> +
> >>  /**
> >>   * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
> >>   * @gt: the &xe_gt to register
> >> @@ -554,6 +613,9 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
> >>  			debugfs_create_file("config_blob",
> >>  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> >>  					    vfdentry, NULL, &config_blob_ops);
> >> +			debugfs_create_file("ggtt_raw",
> >> +					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> >> +					    vfdentry, NULL, &ggtt_raw_ops);
> >>  		}
> >>  	}
> >>  }
> >> -- 
> >> 2.43.0
> >>
> 
