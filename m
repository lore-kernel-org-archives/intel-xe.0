Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED2C4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 05:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043E31120CA;
	Mon,  6 May 2024 05:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8JoY7sq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA63B10E63D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 05:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714971781; x=1746507781;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9N2hOtLiJ0qx5kHqgIZDrZgXf/ZQSJzfRIrhTmAn090=;
 b=C8JoY7sqbMEluSYoOlpaspP4Xk5FeRrrtOvOhNWMWIjia1dH+Ppzmc80
 IGYnkNIIra6Bk46s67ZdZwnulziN/thJWLdpYg8msojf13CSgVnsrDe1b
 n+gqEziFu9qRKm9C4p+y0xdTVfAVE44hlc5vZw/kW+cDmWhXyiCXqDSTJ
 Mg6jTMtQT2QYE8dVSuYdeI9jJOZ7zsqD57VJtTobVYPxWDW5CAuLBaweP
 IOVKRXjaf2oEtER4n3ByzPYguooANuAJ+A09Sd6BInAziFEeS18j1ICS4
 yud2Fhd30ph8Qwmn2YyKjLvpUGaNHzaY3ZQdVZgWz4sOuw33k7Voo+Khh w==;
X-CSE-ConnectionGUID: 8CPzCPutQHmkAcXLhw6IQg==
X-CSE-MsgGUID: FnAg81vIRhGRC2kgPrG6dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21856067"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21856067"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2024 22:03:00 -0700
X-CSE-ConnectionGUID: Bhddm6fXRD+PRnKzCQhfrw==
X-CSE-MsgGUID: HNqaLdpJSrKL3oO3/oxsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="32718931"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 May 2024 22:03:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 5 May 2024 22:02:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 5 May 2024 22:02:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 5 May 2024 22:02:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 5 May 2024 22:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkjg6QIDl4RkERnQUyrsBKHVj/F1YSXcOSnm38FvSBYpRwQRzv4Qj2oKjIsQPRyk0bW4g1LP8rpeBPtAeIrJMHz/hn0EpBNtn+s4+knt4e+KUYF0nA8Ic1ASU1HLnug6aEsJwJZ9Tf15iMMll9HxDhOQXttGPZnMopvHdBd8fgUUWL9h+Cr6JWDiYWgiuIBJj4lvbZw7A9OG15uYt09iWHzwj7jHCqkerKx99dFbKfpx8N7LS0yyQlIeYJP6aJ4RkpTM6xXbrmRkn0ozT8pM/snRgUmRm8j4Wb67A8UXZfpYIoOPNpOMz5NT0IYSCPqVfCaN1AyIMOsO97jNucvTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDWF/zJI9O1cO63/u0kb3wauAcFy5LB/8FMaxCT0Qug=;
 b=C28M/h2uMXEblmui4NXKfzY+XORNmcx0Cc6d/VM2FVUOdBMDj6Yo/YZUwJvlNm+a/vTrOqr7YCcZO81mEKQ+k55Bqqni87N13wvbLtMER+drcY+DqsLwh3m7iQkc+WJaP6xDB8MhxTG5zFjGKAY+JKoMAiuY84Rm/gwC8sXluC/8j9wGZOmQcS86A9JmLlKwxJFY7uHElJsvCMhqhvZFJSj8LutJuWkfWxBmc6zbEsJErvU800Uqvym7Bxe0rU6VLw24aPyGLChTnS5eJnSgnzRFtaGUW++sbrMHALhTarm/si+ssKxVsJMSaO5qg4Ewj8MiNvvSZ/FnITIbGKlfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:02:57 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 05:02:57 +0000
Message-ID: <53a3518a-01ed-41a1-bdd1-90ff367522b6@intel.com>
Date: Mon, 6 May 2024 10:32:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Dump Indirect Ring State registers
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-4-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240504233503.16095-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5d9198-2d92-4e22-f060-08dc6d89cb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTRSajN4bzB3djNzc3dPeVZFRjhmUVBES1JSdWpwWGdwYUtma0VUYk1kMXQv?=
 =?utf-8?B?cVBBdHhsNVQ5Q29NYkxoTk1VNEQrajg0YTd0MDhPN1R0eDdSQmRlTWxUVnFn?=
 =?utf-8?B?REszVFB6NjlLdXgvUS9qeklDcUh6TDIvSEwxWTYzYkhFWW43T1ozQUV2dVJk?=
 =?utf-8?B?a1pVaGNTSlBqN2lCUWFGRUkwdVQyWEZMdXJhaCtZSWhFKytURDZNOFVzRHFl?=
 =?utf-8?B?alJkK0U1YW4wK1lhRHdJRlBjYzRRa0FLZ1dldk93ZTdwRmx5TExyeXlrRHlk?=
 =?utf-8?B?cllIdW5xMWEzL0s1aDdrMjRPQWR5RTRZMDNrWEZ6L25ORWZybWhuZkxrMWVF?=
 =?utf-8?B?bktEL1E0YWVFY2Z4ekpaRERMSmFBNk9USHFnc1o4YU9qOGFtd3psdUxyNEQv?=
 =?utf-8?B?TkhERktoK0ZNK2lZZEN1RW9VdEc2eC9wUzY0TEt4SktXWGtFaEg0NFEwWHg3?=
 =?utf-8?B?WDhFQktOQjM5SGNvdlhUMjJBM3ArZjlWQmFBNnBOQm9kZ0dZdmo5MlJBZTRr?=
 =?utf-8?B?TXlPYldYUS9XU2xLMVM4dlpjbElIeFNSUFRJTjFPRC96ZHk2L09qbG1aUVVD?=
 =?utf-8?B?QlpwMWVDQms0RnNyVGJKeFk1OFA2QzZSRjJ1Rm9FVDVMdVRJdGNNUzZxZmNI?=
 =?utf-8?B?MU5wQjlMNXY0aGhnTEJLZWZMK3pqbURaNUxxZ0d5bmpnMENQdGRxMXg4dk9T?=
 =?utf-8?B?M1RvL2tDaUVhZGdodFpKU2o1SXpOdkYwVC9ZRC9LTkM4ZkpwdmduUmQvc1gv?=
 =?utf-8?B?VDZFSXFyS2o3eEdiU2pER1ZsclEraDFUS3VWQWVnWjU2RDUwdW93dkVXM0E3?=
 =?utf-8?B?RTFwUWc2NU83cXFRdDFjVlNrcnhrVW9DRHFmODhKS0k2bDl3Mkord1NkMjZE?=
 =?utf-8?B?RHVkRzdEQW9Ea1ZLSzU2T3NrdjVsT0pPSXFJWkRMQUs4WG9WRW9wUU0wZzBB?=
 =?utf-8?B?b2pjY01ETUZXYXR4dStFN1pLRDZJUlh0MTgvRE9oV1M3NGZ3czRYSGJ3aTVa?=
 =?utf-8?B?cW5rcWRxTVhFYVhQZEwrZ2NmTkQyc2FvY25lV0dSOTJWTXJONWh5bVAwZVJE?=
 =?utf-8?B?NHQ1Z3FZd1dLQXNLRnQ3cHRjcTlwcXFlczV5OERUd3lBZFZnUk9JL1MrSFhs?=
 =?utf-8?B?SjArRlJUWTlHeE1lUFpjS1Q3V1NmeFB5M2s3MXV0c1hBeWpUUVNBQmdFa2tT?=
 =?utf-8?B?VG1GL20rMEE3em1OZkdJdCtNcG5DTzlRNWJ4NjcxNWNzS1M3NXpwRUpmajBK?=
 =?utf-8?B?VDhRMUlWNzRUcWg3WjNIcmVtR2lKMmR0eHh0cWRUVGJxbDJxcUUrRkxWSzhx?=
 =?utf-8?B?RHZrMG1XaE1KczZMLzA5Q0lYWDNqSWlMMkl6RGVIV2g2aWxhK28zWEtEVGNo?=
 =?utf-8?B?SElGb0NuMHNTLzgzNFMwNS94cEhObzlqV2RsSHdVTldqb2NrWFRDNjlwWTR5?=
 =?utf-8?B?SXhlSGxRQlQxYmg1L1dUeHdhMzRNM2g5a0VlbjRDQ3R6L1V6Z0dKemc3U3hH?=
 =?utf-8?B?bGdiRE51Qi9RcXVoVG53QjVPMzJ4aGFCeC80L3BJQ0piNzB4UjlkeHFNNXJh?=
 =?utf-8?B?MmZUMEJPanBDZm5va0VSYlp2ZDNFeWF5SlErMS81RjlGdGJTZm52WVhWcnJJ?=
 =?utf-8?B?YitJRi9UMnhVOENDc0FVUGJvS0krNXlxMnlJa3FQYmNnUUJlcnBiM1pqcVpU?=
 =?utf-8?B?STZGZG03N2xBMkhIV1pma2ZXL3BiMzlheW9UQlkzbE5tTWNSVWkrSjZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ellqWHp1ZkIyYnNQWWV3b0RSa29xSFk2Wlgvd0dTUVVTUm9TbE81ZFVxZTZM?=
 =?utf-8?B?WnlzNjdhcHlZMExGNWlaOGhCbm5EWlYrRnVjVFJjMy9pVGdDUXFGQUNpN0ww?=
 =?utf-8?B?KzMvZDJNVlN5NVQ2elFJaUpTV1Q3TDZZUFh3c05zZlBpa0hTUE9vNTN3Ri9m?=
 =?utf-8?B?OFlmNW9CTXdwTDhGSVhZRVZxRytzeGtpMnFLdVBkaER0cjl6NDdyRjRWanYw?=
 =?utf-8?B?amxFUi9ERzV4V0hyTXI2SUlQbDA2cXFtU3Y5a2Q3bWlhZ1NTOThjWGZnaCty?=
 =?utf-8?B?Nm15a202ZGM2OTc0K290eDF5cVBveFpUaXRPdG94UjNJM0kxRTVnMmp5RHBz?=
 =?utf-8?B?d0EyZmM2WnlPTEpZc29oTUFVOVVyRk5reGRnZUNPTlpHSDJSd3kzYUxlaitm?=
 =?utf-8?B?bERnWHE1bzNWRGZiM2d4UE03MHVLbzRpdXNBeitjRnZBRCthZElPbE1UaEJM?=
 =?utf-8?B?V2xEUXd6ZTR5bmxLSjUySHptWDgzKzRXQWE5c0FuZHVmTXhaejF4ZVhvOUFp?=
 =?utf-8?B?WE4vYUFTeDE2YUZ1b1RsWU1WODBOQzZyZzQ4ZnNURjRUT3Z3MzBQblAxSHAv?=
 =?utf-8?B?K2JONjhDNENvK3RNZGMzL0gxdWhpdVFjU0RobUl0V2QwMXdzQms4alh5bkRI?=
 =?utf-8?B?MDFpYnd2S1JnM2sxWHFueThnMldPVkpSaEJyUFd6Rzlza1cxcTR6VUVPNGo1?=
 =?utf-8?B?TWhNVDZSV3U0UG5lcEtqaUJOOVpIZlhVQlFPQmdobjhQNVVSZ1hxSlRrSnd5?=
 =?utf-8?B?Q20rQzN1bGR6SWdQUjRlSjEyejBSSmVDZi9zVjgxbnhzSjlYTWNmNm0zaG1E?=
 =?utf-8?B?L1VxTGN1bExxZEJjU0hNaE9GSnZpTFBjODBDM3YxY2MyVUhjaldocWY3c0hX?=
 =?utf-8?B?Nm5lVGRwT2JRdGVsbU92MStQNG5pN011UTZPWldhbWU1NU5lcDVodE04eFhZ?=
 =?utf-8?B?dEFLcHV4U3BraFphT2Qzb3YzeTBQMmliUG5KQzYrMFRGdmx1OVNHNG0xQXpI?=
 =?utf-8?B?VXlmRzQ5ejlGVEIxdDQ0YzdCS3h1bTloNUg1cHY0aStseWRubVF1T1dDSVFp?=
 =?utf-8?B?L1FJSURRRXptdVZWRUNKWEtPT3MyTVdyMVpnNG9GSTk1YVBzZ3lVSGMyVjls?=
 =?utf-8?B?Qlk4WVVaWGxEQUllMmZ4LzNiZ3U1SFk1VHRsZDdGRjM0NnU3ZENnaWZ1emcv?=
 =?utf-8?B?RnEyQTJJaVpVRldGT1J2R0RKUW83UGFtVW1GRjN2QWswS01ESHdsVENtaHdV?=
 =?utf-8?B?aVRGNkpPUDEwV21hNTk4bnJaQVQ3MCtIdVpjRlBnalgrUnA0M0RQaEdOU0JI?=
 =?utf-8?B?c2x4dnplY2FIbzJDQXFaRUhDaVM5Z1lkRllFMHZ6aDhVRmJqZitBSS9xdERZ?=
 =?utf-8?B?NEFVZWVSZExQc2ZGMTlQVkp3bktFWWloNGJsdUVoUTZoZXF3dGd4dnRFaXhp?=
 =?utf-8?B?Q2V5UVZXeDc3RVUxdW5xZkRyTCtvdjVjU0hmQ0gvN3VEUEJ6cS9NNUE4TzZR?=
 =?utf-8?B?T1VQbGtxbUV6Z25ydEdIZmZVeE9WU0JmekR6UzJ2SUprR0xReXEyUVVzeGtq?=
 =?utf-8?B?UXZnTUpJbFVFSnZxVkdwR2pDS3R6SmQ4MnlsdW5PVDVLNzIxOS90dTV4dmdJ?=
 =?utf-8?B?d2EyR3k2K2lDaVRVc1BFcU8zTFFZSStucHE2VG1tQ2lDQzZuWnJsR3JlOE5I?=
 =?utf-8?B?YzVDckhJSGVYVU9QakNXa1FMWmZLNWsvelh4bFAzYkJKZ3dHYldFaUNrTW43?=
 =?utf-8?B?OUErMzRMd1ozOUhraDczRUE0U1F3VE1wazFYWWFMb1BLRDRXam9aWkZwVjZ3?=
 =?utf-8?B?YzhJb1lLejF1ME1GNmwrU2xUcER3QUxqdWdFb2VjSmI1N3lnMUJjZzlZc1dC?=
 =?utf-8?B?VXFESlJ0SXk2VWU5cmo2MWpXOG45NWRJdXIxMU5neE9CS3dZUStXVjdWVDVU?=
 =?utf-8?B?dG5xWTdSWDNHeGV0L0VzT3FtK1RaTjVGdExCR2M0TzZpaGxId3YrcUdoY21s?=
 =?utf-8?B?djF5NlVoaGtjTkZZSThwZE1QR3lzQVMwRS81NWpCVWkxU1I3THErWm5KQkJZ?=
 =?utf-8?B?U3ZiZTBielI4Tm1FWnd4Tkh2Z1UyT0dJM2laODV1Zko3WFZKMnFYa3pMYUFB?=
 =?utf-8?B?WDhNcWFMNmF1cW54UENCeVBJczJUMmRxcDVqd2hvUWdLblV6dnVyNS9YVC9O?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5d9198-2d92-4e22-f060-08dc6d89cb31
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:02:57.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n4JjzWodLxlB3uvY0aj+gaom1pbpRLWVsxUjh515Ydocq33sjCqjhLsF2i/2ZovTaxs8pfn+ugyJvI3hAX8M2UGpH7M7GvLkfcMZjs+gMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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


On 05-05-2024 05:05, Niranjana Vishwanathapura wrote:
> Dump INDIRECT_RING_STATE and RING_START_UDW registers.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>   drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  4 ++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 260a44f46f7e..263ffc7bc2ef 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -55,6 +55,8 @@
>   #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>   #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>   
> +#define RING_START_UDW(base)			XE_REG((base) + 0x48)
> +
>   #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>   #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>   #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> @@ -110,6 +112,8 @@
>   #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>   #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>   
> +#define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
> +

same as previous patch.


>   #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>   #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index ec69803152a2..45f582a7caaa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -908,6 +908,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
>   	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
>   	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
> +	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
> +		snapshot->reg.indirect_ring_state =
> +			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
> +		snapshot->reg.ring_start_udw =
> +			hw_engine_mmio_read32(hwe, RING_START_UDW(0));
> +	}
> +
>   	snapshot->reg.ring_head =
>   		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
>   	snapshot->reg.ring_tail =
> @@ -997,6 +1004,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>   	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
>   		   snapshot->reg.ring_execlist_sq_contents);
>   	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
> +	drm_printf(p, "\tRING_START_UDW: 0x%08x\n",
> +		   snapshot->reg.ring_start_udw);
>   	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
>   	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
>   	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> @@ -1010,6 +1019,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>   	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
>   	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>   	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
> +	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
> +		   snapshot->reg.indirect_ring_state);
>   	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
>   	xe_hw_engine_snapshot_instdone_print(snapshot, p);
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 9f9755e31b9f..5f4b67acba99 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -189,6 +189,8 @@ struct xe_hw_engine_snapshot {
>   		u32 ring_hws_pga;
>   		/** @reg.ring_start: RING_START */
>   		u32 ring_start;
> +		/** @reg.ring_start_udw: RING_START_UDW */
> +		u32 ring_start_udw;
>   		/** @reg.ring_head: RING_HEAD */
>   		u32 ring_head;
>   		/** @reg.ring_tail: RING_TAIL */
> @@ -207,6 +209,8 @@ struct xe_hw_engine_snapshot {
>   		u32 ring_emr;
>   		/** @reg.ring_eir: RING_EIR */
>   		u32 ring_eir;
> +		/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
> +		u32 indirect_ring_state;
>   		/** @reg.ipehr: IPEHR */
>   		u32 ipehr;
>   		/** @reg.rcu_mode: RCU_MODE */
