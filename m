Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C21C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D0E10EA24;
	Thu, 16 Jan 2025 23:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1skOeAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8991E10EA24
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737069009; x=1768605009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jy6hFwp9rfmAxkFH7gSf+2aSasUQZY3oVlaBtvvzphU=;
 b=k1skOeAkpd9Y3G0c1GX0JO9LiUtw2SoxmQHlENf+pvP+LeeyBLheIuvS
 sPs5E0PgX7BgnZGa5MczIoDzw5uKaiLT0X77dQw74rG0qRFQV6nMO7cfD
 8672MUkzp3oExacnbeixu/nROv8C/XjPfzNUY5Tgvk80RqcGiErQr7WcI
 QK3W97FnbfTvsjM7GIHw41ye89J9uwN29Kyl5cHlpJhNWCrfSfc54ECP7
 +Z5kwkqefK+qsJTYLaMK19IaG05EsdmJqyiZLwFFsGsUMvfECVFjbgWWD
 6xcKm0p6smS9c8q8gbjLm0UsxXGw39+Oo7Xq5HKB0zlMs7QTM8hQhpadv g==;
X-CSE-ConnectionGUID: 6qF2vPjCRB6SrIVs8aFGgw==
X-CSE-MsgGUID: 9IrXiMZ2SsyVDmeWuj375Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37174626"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37174626"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:10:09 -0800
X-CSE-ConnectionGUID: c/Hml8l9SKeFGw7m5HOa3A==
X-CSE-MsgGUID: HuZ5ZY/dQN+JLGk0dBeCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="105596474"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 15:10:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 15:10:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 15:10:07 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 15:10:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlmtzjSqQ5qaue+/CW/Hc3ta/M1iEH+nODobnWocQweBIHC9KvAHBw3WJmX83IU4W9w0yvdSfppGh43UEQRp95n1bGVC1LAyE4YC+oP4kWwDWTWaX4z7ajFvwrANQI9VdHqDKSaEjn5Xpt5czZg5hMDgAWoZQ3xGe8ui3EgIrbMg11lZLeo5qUJU38G8fF0qToviczq0r6oLkauy59f00RbaoS6Bdq729uuszL5ecrnWyl3FFVd0k1jhc5E5GickKEfuKEXOfFESAoIWdIILrvT2mCgxIUULp4m40uwxnmmb2MlCTRoiC3uKeYFEkFDjvG7/DGZSHfnS7hb+Aglh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o4qu0iAhtNO0QwrqMOlPwShP0YssA+CZK6EttPA1ag=;
 b=NjlB/WyQ1XLNosGFwVk7cd8AhYjnBCWIGWNxGOLCdqJp58qF6hvidG4eobKk+e5g2FiuQmanaDiyGhkPIXNTi+flYqoqIDE4Mzv/CDZXQM7BK8KL6b3bgCl3n2HiSBRtAgGZCRL7k5YFyvxjBeTmFyIZFTV3wvk+b/0EdZqrgex1IkSlCywIouW3Dq5PyxO/AaeQ5aDxkIPqAyBLPoFkQ1SSgMtz+kytTcHtAylQBHQ6B5mGNDzieszfbdXujYXuZZSKA8XQJKgzzePXi7QOaYKHrn2+mZ7EEU08luVhSR6K0cvxiXJVhfYWwt6XwRDVIaTFWzaoN4bp/C7QY1Jnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:10:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 23:10:05 +0000
Date: Thu, 16 Jan 2025 15:10:03 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 08/10] drm/xe/guc: Expose engine activity only for
 supported GuC version
Message-ID: <Z4mRy9d7leeoPDLB@orsosgc001>
References: <20250106075600.852080-1-riana.tauro@intel.com>
 <20250106075600.852080-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250106075600.852080-9-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa6220f-2f13-4cb6-6212-08dd3682ea0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUtXZ2ZudUpnMHF6dEY3d1Z3K2k4dURKcXVmWkVsUy9kTGJNd1JWbHAyTC9R?=
 =?utf-8?B?RWtLci80bWowVnRCYVNHT1NaRk5KSFJXclRuT0hzb2tidU12dWV6MlBkT0th?=
 =?utf-8?B?SlZVaTVCMCtZOUlCbWFHdUIvRmdVMzR4NUMrWkN5T0oydTlFSnF3V0hwdmVF?=
 =?utf-8?B?QjU0RnVSQWdqMDhoV3lpMldNYS9IN0NyVjJ4dGY1SWxkcEhrZWVyWlZpcURO?=
 =?utf-8?B?M090KzBEVnlPVnBoNkpRU1ovSjlJdHZURDdWUXdQUUlWNEVlWVQvSWpNNTVt?=
 =?utf-8?B?NG1hbnhyUE45RmZBeGxiUE04QzNSN3FPT2o2K240aWo4ZjhjaGFZeWFyUjRw?=
 =?utf-8?B?WHpFL1NnWDN3VEdvYURkMUdjR3ZNRm5HakwrL1Y4eUtpaDJuVjJ2dWl3YSti?=
 =?utf-8?B?ZkhVVEoxMWg1S1pTc1dFNjdCdjJRdjhiTkJKNDI3Z0Q1UXNiNW4vVUlFdHZm?=
 =?utf-8?B?bjZZOWd2WmY0bzVwT2F6MitmZ2xrZ0hnYTBxQWwzN3pMcEdOa2tmbldQN1Bv?=
 =?utf-8?B?SmlMYzBaejBLRDVRY1dTVWt2SzN3UURYblYrNjVrNkxZdDdjYm5jYWVOdDJK?=
 =?utf-8?B?Um5OcWlGNG9lOG5yTXRJNWpMS2YzQU1sbUR2cmRROTBrUFZ6NTh3VmszMG5C?=
 =?utf-8?B?Z05jRGY4MkF2U2dzMXRBVHJJSFIwR09BNWxFNUJobU1OZFoxUzRhZ1V4Z3g1?=
 =?utf-8?B?MVFIU1V3LzB0SHpnZTJ1Ukt5YURuQVpqMFJSMlA3eDRkbkpzRWh6NWtzVVI3?=
 =?utf-8?B?V1FIdXdueU1IRnBPN3hjeCtZWlZCdXpEZmlPbEVvZ0xWcTNJaTlDbTNHVHRv?=
 =?utf-8?B?RXpzNk12ZnJHOGZDUkoyTkRkVmlrY2RwQVFsNkYzVnVYMEZGb1J5VHlOQmhy?=
 =?utf-8?B?dkY3bk5NK1kyc09TZi8wNjlRY0dHQ2FsaUFKQWRnUUZYUDB5TS9mSkpmWGVp?=
 =?utf-8?B?NDBuU2R0SW5OdCtLUmx0UnJxRWVKQzlrM2JFd1BZakE2YUZOS1BXUHRIV2Nq?=
 =?utf-8?B?ZmFCMENJY3BhV2p0OStjd0Zvc2RQVzI3MGVDKzRtaHgyYVFXNlgrN0RtTWp6?=
 =?utf-8?B?T2s3OU1YZTdFZXlMVG5keEQrYWJtZUZMVGNLTU9ienNFZ3ZtdGg0WE42NXJB?=
 =?utf-8?B?bCsrbExUMXYwZnFkQlBsNG01QjFGUmx4b0JWd2NzcElxSkdnYUh0THVNSWZz?=
 =?utf-8?B?QXZEb1JOUXZENlY2ZXQwVXZRd3lneXJRYUM3TnpuNGhub3hFWm9XUE5RbkY4?=
 =?utf-8?B?eW9TZlI1WjJqQm5pNUEyVEptc202ZTdXK2o1R2dsNXpGNzRTRE9LTEJOVTk0?=
 =?utf-8?B?TGpMc1RHeXlrWjM1a1RNUFBSYlJCaTl0Zms2RUlOaW9TZWVTdFdIOUJqZ0Q2?=
 =?utf-8?B?UElzMUh2WE9wUkROWmUwS0ptME9EeWdiQzFVbDdiK0hVM0lXaHpJOStPaHlI?=
 =?utf-8?B?Yk5qZ0VEN3RrUzgxVGxPTUlBZHRpRmdwK3hMVGhyd280Q2d4N2l0NWk3Zmh0?=
 =?utf-8?B?dktqRkJ1cHk0RG1reitabHU3eldLMnRiT1BXa09oaEhzdmNBWi9mdkVkQk84?=
 =?utf-8?B?RUhkZ2sraCtWbnN5Qy9sN2Q2L2hCRzlTYXhNNmh6T0lMZDl4emJFRmxSUXgw?=
 =?utf-8?B?UzdseUt3NDdtVHVwdmYyTnUycmRvc0t0Z3NYQnl5TzMrMjJNcTE4bjVjaGNz?=
 =?utf-8?B?V2YxeURIUGxLak10SDNPNUpGNyt1ckFubWJCYjE4L3UrQXJ1V3g5WmZUN1Rx?=
 =?utf-8?B?K1ZGZko5M0pxYndzR3hPbHdqa2wvZHJobUR2SGQyL1BhVTVtWXZNd2VoNC9H?=
 =?utf-8?B?TERCbEppVWZnZldWNVo1dkRqUmwyaHBGOGxKeGRldEZhRDRUOE5ZZndhNXd6?=
 =?utf-8?Q?LdUkFH177paHK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJQWHFNMjhMV1VKSmNSeFozMjF6NkJTcDJ4S0p6NHpZMnFwbnkvQ1A1eHJ3?=
 =?utf-8?B?U0ErU2lNK3FRbURqdFpOZGR4R0NrbVRYcTltbDE3UlpFKytEdThobTVGZXMx?=
 =?utf-8?B?L1U1ZkFETFhJbDEzMk9rbXVrMFJJVjkvRDAzOEtRZW0vZVMya0ZFc2JDTExV?=
 =?utf-8?B?S0Q0UXpnd01rWW51eGxvY2V3SmhkQnh1eWxQVmV6alB5MEd4aWw2TUZyNUV2?=
 =?utf-8?B?UTM2bDYwNGpBOVQ5US9hSTArZDZxWlYwRFZURm9laU44aFg0RTdBV3hmUDhE?=
 =?utf-8?B?eWxmRjBPYW4yZ0htQllQVTA2VTVYdGlmQjd2dnZ3S0pKbFNvUUwwUHFqckhp?=
 =?utf-8?B?ZWVHUVFFSVZFVGExZW1LY1ZncTd3V0E0Q3NOSG1MbStRMnVOby9PSUkrRFcv?=
 =?utf-8?B?Mk0wQmVJYlJuSWJHSDh5NjdWYXFYbUFCK1RERlVIeVl6V2ZTNUlFU2RlaURB?=
 =?utf-8?B?VzhqSkxHUGgrelBJTDFQTERYc0NLVm4yYVlxY1N0eWNjVHBMVDRzMG5KREZZ?=
 =?utf-8?B?aFJOanJtdGpoWGdyMlFqejNkRVZXYmlDMkhyZHZKTDJOT1dhNk9jSDB4K2p0?=
 =?utf-8?B?aEpueDRac0xWTFd3ZlVhNHJ2OHBzWDB0cFNYUE83TkVpMTBhN2hCL0ppM1FP?=
 =?utf-8?B?QWJ1Rml2dGYyVndTSHR5NUthWjkyaktuVFZFVUNVbkdjc04vLyswVGtWZ09X?=
 =?utf-8?B?bFRFMGxFUHRoWVpreFdidm9OcDlsRll4RlhaSEpXYi8wT2lmaDFNenBXNThh?=
 =?utf-8?B?a3NyNEQ1SmpHejVPQ1BoaG5yYmZBTjN0MUwzNlZqQUV3VnkrYlNhWGJ6L3Na?=
 =?utf-8?B?RWkydVViMW50anB5QksyYjBFUHdFNkxzSURLWWVXdmxsWUVXdmg0WFhDbHlI?=
 =?utf-8?B?WnNwWXJxUFFjRG5RVk5MYjVuZU5yZEtIWGJnb1hOMVdzWUsrakw5ZytNWFAv?=
 =?utf-8?B?bUlBV1FzemcyUkdEbHN1V3lmZVdibG5iQXhNRk9NSCtXcWFXT3U5enU2a2Jw?=
 =?utf-8?B?N0dVQ0dUcVNsZkdhZENlT3UwWmNyUnpGbmU5WVYxMkRieDBHOWNDNlZxL1Jp?=
 =?utf-8?B?bWk3WSs5Z3k0QWRKaWZRYU5mQmREcnRQN09CQW9XamZucWtHT2VlOVhTcW1U?=
 =?utf-8?B?L2lQWVVTaEFBS01sODhOQmFIaWJyd1FUOTNqOFlVak1mUVJYYU9oaVV3dGgv?=
 =?utf-8?B?Z1RwTkg0QzdNVG03NzVLbXBjS25DdGFnOG9kZm5JL2UvQjlPUGM2VnpJUC83?=
 =?utf-8?B?ZEJDUmxRaGVCc0t4NjJ0NGx3eFZsdm5ETTNIM2NVQTdGQVptQllIeno5MkZp?=
 =?utf-8?B?Y1JwQ1NVdndzWE1ZWnhvTFZnM1R2SEViVDY2Z1lUajRPcWNMdjgrK291V0N3?=
 =?utf-8?B?S3VFaUhNYXUyQ3g0NkZjbHVrTTlLRUdXWXFjRVF2MlAwL3RJMjVsMEh5UTFu?=
 =?utf-8?B?ZXhVWEt0UlM3cFBaV1lJa3NlWlVFWlZ5M2Nob3I3VDArMXo2dnM5ZEx6eXVv?=
 =?utf-8?B?Z0xDemV5dUhaQzQzNm5zd1ppYW92T0hnMmpjaTFPVGVnWUlxRVRwYTErM25L?=
 =?utf-8?B?MXFOeWxia0VhQnNHdlRsMGRhd04wNE9NMGdOdlc4dnlvL0lOeEFxekk2ZXlq?=
 =?utf-8?B?eWdpWGZmaklJK2ErU2htTGhRSmlLNHRJU2ZIOC83NElkdEtkdzdTeEZmcnph?=
 =?utf-8?B?Vk9QT1E5YlhTeStyWktoMTN1N1V2cDFlV1JDZXErYmd5OTBLd2NRMUNOZHF6?=
 =?utf-8?B?Z1kzVzJ6eWRPWXpnWWNqMWU4ZDJuVHErajVuSXRRQjl0U1dwRzBtZjRVVXdk?=
 =?utf-8?B?L1p4enBQaVMyVlJzLzZ5S01MbDZLbFBzVkkxS1ZUQ1QyTlBlOTl2UDE4L2hn?=
 =?utf-8?B?K3BiMGhTRkRSV1paZjRCZ1F0OGE1T2RWOGU4NmdtR2d0Z0pNZktGZ1R4dENG?=
 =?utf-8?B?cDdWNlQ5RXhYWnJvRGJmRmtqT3VBd04yeHBmTWo4dVhySkMzY2g1V0dKVnpF?=
 =?utf-8?B?MGdwaHUyRm5tTVhZbEl0K1YrVmRjczNzV2Z6WVlrWWlYOVc0YWswMTI4ejBG?=
 =?utf-8?B?VWlGYzNCTmpucytNaGZzTlh3bnl5eXdqQUhLT1NDZFE5ZmpEa2d2VzcxUDd1?=
 =?utf-8?B?ODliSndWUWVleXlCS29nS0ZwZ3NOTzVodHJXdUhUYlEwTGdqMTBKcnpKUHRW?=
 =?utf-8?Q?bPCNAgicYo87nkseK/ZOeG4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa6220f-2f13-4cb6-6212-08dd3682ea0c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 23:10:05.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tcq6HXBcveSP/c3ZXSUltGax8t08A7Bf3beljOpgJsMbWfsfe3b2KYge9X1bttS7M48R8Kv9DtufISyrGTx0isFZEk4MtQvvTevT9GOi/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
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

On Mon, Jan 06, 2025 at 01:25:57PM +0530, Riana Tauro wrote:
>Engine activity is supported only on GuC submission version >= 1.14.1
>Allow enabling/reading engine activity only on supported
>GuC versions. Warn once if not supported.
>
>v2: use guc submission version (John)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_engine_activity.c | 31 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_engine_activity.h |  1 +
> 2 files changed, 32 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index 14950b42d1b1..5aea42f0cded 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -255,6 +255,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_active_ticks(guc, hwe);
> }
>
>@@ -268,9 +271,31 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_total_ticks(guc, hwe);
> }
>
>+/**
>+ * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>+ * @guc: The GuC object
>+ *
>+ * Engine activity stats is supported from GuC submission version
>+ * (1.14.1)
>+ *
>+ * Return: true if engine activity stats supported, false otherwise
>+ */
>+bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>+{
>+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
>+		return true;
>+
>+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>+			 "Engine busyness not supported in this GuC version\n");

A warn ON may be heavy. Can we live with just a debug print here?

>+	return false;
>+}
>+
> /**
>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>  * @guc: The GuC object
>@@ -281,6 +306,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> {
> 	int ret;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return;
>+
> 	ret = enable_engine_activity_stats(guc);
> 	if (ret)
> 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>@@ -307,6 +335,9 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	int ret;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	ret = allocate_engine_activity_group(guc);
> 	if (ret) {
> 		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>index 6cd435b81bbe..e2c2f1bb2b59 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>@@ -12,6 +12,7 @@ struct xe_hw_engine;
> struct xe_guc;
>
> int xe_guc_engine_activity_init(struct xe_guc *guc);
>+bool xe_guc_engine_activity_supported(struct xe_guc *guc);
> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
> u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
> u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>-- 
>2.47.1
>
