Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E05C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 08:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2452410E063;
	Tue, 14 May 2024 08:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPPR5NTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B32D10EA37
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715674093; x=1747210093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+u0d7xpx3LxEJpy/v/w7UUvJkPjdCoKpzoRIpglb9mc=;
 b=RPPR5NTHY6d7pVevWCSkCwImtcQZToJ4v85Az4YYbr2ufXNcSmSc+WWd
 tkgCByO1GEXwVBAPmmUDfq8Em8kbGWzjEg0Hx4I8GqsF3e9dos04fyCWc
 Pzw879JHv0ASYdJ9blMhzGAU/yH2hdS/+iXbc9sg9VpCX7KSUip2kOgef
 ocZfUn9HiYYxcORzmIkixPwaGMoeecj0QYCYNr1175SQXUbOfCpxAS5fA
 wqr4nnSfUCtzOk3G49oqgpmWO1+yWShq/KMDxs1lFmX3dwTeVtKCWlb9F
 3seyggdcwng1wOy3lOhvMQDbyNpGauopVAMpCnIxLab+85kmgzvbCllIA Q==;
X-CSE-ConnectionGUID: N0E4jSfpR4Oe06DAkBg+3Q==
X-CSE-MsgGUID: Z5F4sexWQc6g7FGVv3HjBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11586438"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11586438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 01:08:12 -0700
X-CSE-ConnectionGUID: F/j+7cmzTd2w/x41Gi7tBg==
X-CSE-MsgGUID: 3Ae859CVSt6P/s0kfzFUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30618580"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 01:08:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 01:08:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 01:08:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 01:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt72KImfxAIiA3vueg7ivzUalT1zKPWd9hLtI13FmZDg2pJn/EzEMlSDWkZoY+usx6YRtwS02WWeHQKGdfmK0oooCpHjYzUQm/VgMinzRoXjIqADIg+vKpCPzny50T1OrLqN4ndm5UasilTgkepjymTGRfEico4R8bkWKI61JpzHJ5H2q2spf6fuZlIZbrxo6xVDhnYII2/0dLpvIke/ibFaKClW8KucZllTIwxHfu2o2xIc57BzEp00fhIK981SbyEfepRTneG1lD0yfpWuK8MFWqWnQosO1Vd4+wxhJJN1kEGCnAUnN/409irDGGdeRoMZ29iSynLqNSlIz4rovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkPWvIIfyZRQ0j95uFDWaCSUM4HdZhL010if6BMJqQg=;
 b=LXHL73NcsC6bwDULyUYC1QlJ378T1BhZXoVySQNmzDM/le/j+6Goa7RONf8h2acOtVRlt0ibryCFKNHlaK/KkQo0IWeWWJGLiNl75w1/cJM5djfpCZSUTlFC6Rdkc160NFnwoju2cbMnZBnhf4BYpuPBg4vCkyKFnkgmLUVWbqvFa1PFTp3rKi+3PMrNKUv8U7v/zQzHVFJTIdtjqVjRrRWqRqzTE4m2ev4arbaXuvUcZVBru2XhR8MqZcZqWWWDvoQ966tofzOmxGHhEdz0h5ElAieCHcheUMbiYidyL8wk28qnLQYBx/jR0DgMRIIxWPzzHK6ZczHCBX4TTbpLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 08:08:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 08:08:08 +0000
Date: Tue, 14 May 2024 10:08:05 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/xe/guc: Introduce GuC KLV thresholds set
Message-ID: <20240514080805.2g6tbanqrgsvamso@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY5PR11MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: f39b621c-7c57-49c5-e47a-08dc73ecfd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2N2elgrRjVab0hqOCtWbHhOQUhKUGRoRTJCVkU1Y0h0TFFrMnhiSXhTOTk2?=
 =?utf-8?B?Zklad216djJkbzNwZkR5QUNFd29kMEhrUXIvN0M4c01NaWxQUmt4SE1MQkpG?=
 =?utf-8?B?KzVqOHNoYXNjejlkZEswSFhyc08wUnJEaEkrTFpoaS9heWdSc3hhc3E2Q2E1?=
 =?utf-8?B?R1ZNUm9DaHNLOHArU05KSFNQOUJmdmVmNGIxaWZSSzM0Q2VSbXgvRU1MMTJy?=
 =?utf-8?B?dUZYTGFYSGFuVm5tNTlPNGEvTnJJZndNM3hHbk5FbExGS1VTdURaMVh3bW1i?=
 =?utf-8?B?bld2c3JrNXI2bEFhaDViVmJWUGNYZDgyMHZHY0VmQUNnQm1uTTE0cHRTUW1S?=
 =?utf-8?B?TCtiVzNFNVpTRmxpTDB1cU8xVmFuSmg5ZzhVQjdqUWhzcjZSc3NtQ3F4Q0dS?=
 =?utf-8?B?MDY0UXpYL29WMmlRaDBEWHBOOGxFTTNoaG50d2dLbm85clUzTkRwcFdRcEt1?=
 =?utf-8?B?TDdGWTN6MmxFSXc0NlRPUGs4amM2dWQ0UlVJWXp6Ymo5WUdia2tFSDJWN0JN?=
 =?utf-8?B?Nml0VjhLems5czU4UGJTVW1XSXNXVTgzMkF3QzdDWmV2Rmg4UXRhVGJvVEY4?=
 =?utf-8?B?YkNGeE9FSG9aNHVhNE1jTklSczQyZm85ZFlTVVZLaWVFcWduRGMrazRDSXI5?=
 =?utf-8?B?WTJsMkZXSTQzSjU1TDJSTWQzSkppeEpxV24rdzZtTjQ0Y1pXU0lFNjRmNm5D?=
 =?utf-8?B?VXdjUzhxSHgydHBqZXhZd2lDZzR1dDJvYjdXSmhUWWNoQUJqQ2s4V1R0eFlp?=
 =?utf-8?B?VmxVZDg2dUd6UDl2ZXk4aXdtdFZURkRxRnNSRXYvYkpubG0vRCtSRDQxRzho?=
 =?utf-8?B?UjZtbCtwdWt4bEhyVzNwUTByNVc1blJQU0pQeXUwNVUrU2h4NDdPcUhWS04v?=
 =?utf-8?B?N0FVdzd0TVQ3QmxYM1ZVbWZLNGRDQXdWRVhsaFNFTWhaZll1NTVMT2l0SGhK?=
 =?utf-8?B?WDdkZFBaTFFVN0tuUms5QTVxbGRGdXRZWEM3b1MzZmNqVWQ5QWRqZzNWaGk5?=
 =?utf-8?B?engydGlLTVUzVmVDSTBVbXc5SWgzemNDWk1PY3RGd21TdEQvcjFORnpmWDJa?=
 =?utf-8?B?bjNNQzdqdjBzVVA0QlBoNFFnZlpIVUEveGtVQ3FjNTBteUYyeFFsSjJEUDVq?=
 =?utf-8?B?bmFMYkQwQnNRdDJGWndVL1JZRGZzSUJ4Tmk4SGxQNXBRTHFuQ1VjVHZMckxC?=
 =?utf-8?B?R05BUFhQWDZjODAzcFNPYlBaRkZZOFhDR3ZXa1hJMmQ5eTVJWHpUUFpFR20y?=
 =?utf-8?B?cEp5RG8zS1llZGkyeExsWjFLaXlBZUc4SmcvV2I0eWU3dFpJVzlnN2p4ZHVK?=
 =?utf-8?B?RER6ZEtIWDg4b3ZwdGpsNWZod2lsWVZwa3c0NWxiQXp3WEFwOWtRTTZkVFp2?=
 =?utf-8?B?SlUxVVhEbVlJdzNJOFA2L0dPMFpqN1RuSWRyaFJNN3l1ZWpEK1FTRUVzakY0?=
 =?utf-8?B?U0U0TDdoTDJvT1creUM3cmY0c0VyWVlyd0J1OHZCc0ZZNUpaaXlhVlpOWHYv?=
 =?utf-8?B?OWo2ZTBuTUVVWGtjbGlHUTBGSncwaU1GYSs5MDMrNk1CVlFWM1lvUUtNRmxF?=
 =?utf-8?B?TkYzdkFESGx2TXpRWWh1eDBVNVl0dnF3YjZKQWZJT3lHMkpKclQ1SVBGQnJO?=
 =?utf-8?B?Wld1VkJCNVh2SXFsMkVkN0JXZGRlSW4rR2pnRi9vdGUxbXMzN2hQcWhrLzB6?=
 =?utf-8?B?TW9NOEIrV2hxOC9MZ1ZjR2MwYXRjUmV4TE5ZSHpDbGU3Nzhpek9xb3pBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajMrdENPTW1TMldOcC9KczVibXdRSFFFUFhlQ2lPMWQyY3Vad2JNRjZRMjVa?=
 =?utf-8?B?akVyZitvOHBObmFEbEN1UlNDczhDRnBvUGFWcUo0Y2Vqak5wNWFiUDI4V2hQ?=
 =?utf-8?B?VHhST0R6Y0lpUTdkVklid1I4ZHIzcVN1ZUIvTXJ5SVA4a0NmdU9DOVVoQjc5?=
 =?utf-8?B?azVPUTVvSmZGVVlYVUZydFBHcUwyaWJnL2JYaWdFcFUvTzdsWkRGU1BGSFA4?=
 =?utf-8?B?a2FHQzI0cW51MnNBUEVmVnFwNjJ6ZllzT2VCaE5sTXBLRkJxK0RoUWk4dFZi?=
 =?utf-8?B?RW9FT0t4WkN1VzFyc2tzM1RtUzJWZ3haaDFJYkFGcVVZWk54N3pwMmU4Mkl6?=
 =?utf-8?B?blBXQW1iM20vZHR2MjdGcGdpaUFBZm5nZkloSjJnb1ljelNLWjYzQjdRcTRj?=
 =?utf-8?B?MXF3eWZqbGZYWjd1cWZlSlBGdFVkc0xtNDFNVmV3QlpYQmRDQ1l3MWhzTUtJ?=
 =?utf-8?B?RnMxcGJvY3Y5YWkzbjU2Q0ZkdzlsR3VxMm5ja0VWN1NxU0d5YUo5d3dSZ1V2?=
 =?utf-8?B?UDllaWozRmVnMFgrbzNPK1JhOFMrNkxpNkttNWhXRDk0ZHRpMDdMWjdsK2pI?=
 =?utf-8?B?cnNBdERIQnlYaUQ1TlNjS3AvQ1lySGFHUE1WR2JPUjZ2MzBJMk1BV25pcHZD?=
 =?utf-8?B?WkZFUnh1RDhJN1RXV1lxSklkcHU5R1ZCOEZyeU11cVZ6YytBdjVkaHJQU3F5?=
 =?utf-8?B?QVUybFFOMURrL3RkS1dQemlIWUVpRGovR05PQ1AzR2NLM0NkdGZWQ2VWSm8w?=
 =?utf-8?B?d213VXlGajlnMThUclhVNUlJRjhrMVNtOGk4TWQwUGZGTDV1aldVZEUxaldO?=
 =?utf-8?B?RU5sVk8yS0hlRXI0RDBjcjFLa051d2R0ZnlxMTdvOHIyZ3hteUFTcndEV2pJ?=
 =?utf-8?B?d3VmUEJVSjVCVGhjTWlMNEdwMlVrRHNJakYvenFPbTA2TDBMUXVDVUhBRFd4?=
 =?utf-8?B?TzN4dk5RamhaQ0xBQXlaY2VuODZaWG5xUDFCWnRXYlNkNVRXSHdZNk9kL01H?=
 =?utf-8?B?Slh6MXM4MHZ0YVQrbkF5SlVzUy9FMFBqNHB4c1RIRGxkZks5REpTdXpFZFdY?=
 =?utf-8?B?dThSSzZYRTluV1NpaXYxeFlmdG9EbHFDNENtSjJGeGRKT0h2emJzSk82L2lW?=
 =?utf-8?B?eldJTWtrQTBXNUJNMU5rUXJhQlVERXVDUTZaM0Z5aGxERXk5bXg3QmU2VU1E?=
 =?utf-8?B?S0FpQjNmbmZ4RTJKakxnN0FHWnB4aTd4OFlpOVJ1S0VxS3VoWWJZOXJTK0xM?=
 =?utf-8?B?a2pIOENRc1FoQ3V0ZHlmYXhUN2NkRHBhSmRYOUpqV2ZwWmNPd2R0ZlNCNEJo?=
 =?utf-8?B?UzRQRS9sWFlyRk5RTk9QNi9VbVJpcWNtSHZ5Y29PTDRsa2MxYmpqTU03SExV?=
 =?utf-8?B?dGY0ZVU3SU5MVEt2ZEZSUXArY1Q3RkoyNWJCaTFudHhTVTB5dlNQQUlmaUla?=
 =?utf-8?B?cXZhZTdYM0pESHprUFFxYm0zUnVzR1NPU0RaQ01NNmo3cmZXR2syY1FwamJK?=
 =?utf-8?B?UHYrT01XMlFCN1ExMXNlVk9QOWhpaStieEJDVExmd2pJV2JuYW11QkJCZUlL?=
 =?utf-8?B?VERuNXJYa1FFcnZtb1ZqOFZXdWxBd3FWc0VodzE2QUlTZEVsKzhUYUNOemlO?=
 =?utf-8?B?eHF2QlZac0JuWjhUSEJDR0FyUXhyU2hicEd4YUR4SDJzeUJsQnRNQjBIemxt?=
 =?utf-8?B?Wi9xdEplSlhoeTRGdlZpRVZCeHIvZjN5NTBHVUc5OStnWkVVZkR4dmFOYUZ3?=
 =?utf-8?B?WFR0RXdjeGluTHYvbnZmZGtIWmoxRHRIL2xSaWYxd3hFalkzdkZFQmVQSG50?=
 =?utf-8?B?ZXdXdkVmZEVSWi84T0tibkVzTWNyVi9MeUJvbUp0NG82Wm9yY1BEVXhHREZ5?=
 =?utf-8?B?OXo0Nk1kM3E2a3FUYkcvMExsbzE4VzdqUUJQWk9KYnlHSUUxV3VTVUkrS0dX?=
 =?utf-8?B?bXo2S1FkcGsyMFRWazlmbzJvWVB4WnVEVkZIZm1IMEhUTVI5elhRMG9iaXJv?=
 =?utf-8?B?QlpQVlVIcGgwdERIaWcyM3FTTWZ4bDQ3bng4SVBtWllBWjc3MjBxVlByazFB?=
 =?utf-8?B?TVQ2VU41enVpc2k1ai8rdkY0dzQyb0d3Nm9Sc3d3cnRDbFUzRTFLVjF0V21Q?=
 =?utf-8?B?MWtUSmphSjVJUVkxZXBLR0VwZFZiaGcvSjIyTlBFTTliYjRIcHNzeU1UbDgy?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39b621c-7c57-49c5-e47a-08dc73ecfd91
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 08:08:08.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VU2ofo+iJbtgm20UKx3/j9k3yMRZuV/w+WqFvztvCplj9h255YGlJ2wg+deAXZDQQtIauUZblxo6SDvKrWZuTIvKUKqjZSf8u0IAVus4B+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:08 +0200]:
> The GuC firmware monitors VF's activity and notifies the PF driver
> once any configured threshold related to such activity is exceeded.
> 
> The available thresholds are defined in the GuC ABI as part of the
> GuC VF Configuration KLVs.  Threshold configurations performed by
> the PF driver and notifications sent by the GuC rely on the KLV keys,
> which are not zero-based and might not guarantee continuity.
> 
> To simplify the driver code and eliminate the need to repeat very
> similar code for each threshold, introduce the threshold set macro
> that allows to generate required code based on unique threshold tag.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    | 58 +++++++++++++++++
>  .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 65 +++++++++++++++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
> new file mode 100644
> index 000000000000..da9ae10c72b8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_KLV_THRESHOLDS_SET_H_
> +#define _XE_GUC_KLV_THRESHOLDS_SET_H_
> +
> +#include "abi/guc_klvs_abi.h"
> +#include "xe_guc_klv_helpers.h"
> +#include "xe_guc_klv_thresholds_set_types.h"
> +
> +/**
> + * MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY - Prepare the name of the KLV key constant.
> + * @TAG: unique tag of the GuC threshold KLV key.
> + */
> +#define MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG) \
> +	MAKE_GUC_KLV_KEY(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
> +
> +/**
> + * xe_guc_klv_threshold_key_to_index - Find index of the tracked GuC threshold.
> + * @key: GuC threshold KLV key.
> + *
> + * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
> + * Return: index of the GuC threshold KLV or -1 if not found.
> + */
> +static inline int xe_guc_klv_threshold_key_to_index(u32 key)
> +{
> +	switch (key) {
> +#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
> +	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
> +		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

NIT: In my opinion, putting these definitions inside a switch (or in another case,
inside an enum) worsens the readability of the code, which is already unreadable by the fact
that these are macros - which, by the way, are very interesting in itself.

> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_key_to_index_case)
> +	}
> +	return -1;
> +#undef define_xe_guc_klv_threshold_key_to_index_case
> +}
> +
> +/**
> + * xe_guc_klv_threshold_index_to_key - Get tracked GuC threshold KLV key.
> + * @index: GuC threshold KLV index.
> + *
> + * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
> + * Return: key of the GuC threshold KLV or 0 on malformed index.
> + */
> +static inline u32 xe_guc_klv_threshold_index_to_key(enum xe_guc_klv_threshold_index index)
> +{
> +	switch (index) {
> +#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
> +	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
> +		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);
> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_index_to_key_case)
> +	}
> +	return 0; /* unreachable */
> +#undef define_xe_guc_klv_threshold_index_to_key_case
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> new file mode 100644
> index 000000000000..6a48d76924a4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
> +#define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
> +
> +#include "xe_args.h"
> +
> +/**
> + * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC thresholds definitions.
> + * @define: name of the inner macro to expand.
> + *
> + * The GuC firmware is able to monitor VF's adverse activity and will notify the
> + * PF driver once any threshold is exceeded.
> + *
> + * This super macro allows various conversions between the GuC adverse event
> + * threshold KLV definitions and the driver code without repeating similar code
> + * or risking missing some cases.
> + *
> + * For each GuC threshold definition, the inner macro &define will be provided
> + * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
> + * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
> + *
> + *	define(TAG, NAME)
> + */
> +#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
> +	define(CAT_ERR, cat_error_count)		\
> +	define(ENGINE_RESET, engine_reset_count)	\
> +	define(PAGE_FAULT, page_fault_count)		\
> +	define(H2G_STORM, guc_time_us)			\
> +	define(IRQ_STORM, irq_time_us)			\
> +	define(DOORBELL_STORM, doorbell_time_us)	\
> +	/* end */
> +
> +/**
> + * XE_GUC_KLV_NUM_THRESHOLDS - Number of GuC thresholds KLVs.
> + *
> + * Calculated automatically using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
> + */
> +#define XE_GUC_KLV_NUM_THRESHOLDS \
> +	(CALL_ARGS(COUNT_ARGS, MAKE_XE_GUC_KLV_THRESHOLDS_SET(ARGS_SEP_COMMA)) - 1)
> +
> +/**
> + * MAKE_XE_GUC_KLV_THRESHOLD_INDEX - Create enumerator name.
> + * @TAG: unique TAG of the enum xe_guc_klv_threshold_index.
> + */
> +#define MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG) \
> +	CONCATENATE(XE_GUC_KLV_THRESHOLD_INDEX_, TAG)
> +
> +/**
> + * enum xe_guc_klv_threshold_index - Index of the tracked GuC threshold.
> + *
> + * This enum is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
> + * All these generated enumerators will only be used by the also generated code.
> + */
> +enum xe_guc_klv_threshold_index {
> +#define define_xe_guc_klv_threshold_index_enum(TAG, ...) \
> +	MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),
> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_index_enum)
> +#undef define_xe_guc_klv_threshold_index_enum
> +};
> +
> +#endif

One comment above, however, the code functionally seems ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
