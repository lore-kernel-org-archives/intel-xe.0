Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AEDCF64B6
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 05:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9410E16E;
	Thu, 20 Nov 2025 05:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPfAA7Cp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2713010E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 05:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763616096; x=1795152096;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gFW/4FoGG3LCKWd7GPgnENeuos/yoyUIWe2rp5W1U9w=;
 b=bPfAA7Cp2k4HLgSaH2/qSSFpRPvXju58BwPpxVXEy3kxGAqiv1mtu+nD
 ud52zTszcDzZu2e2cSv6JvnA+LmI7CBVYZBzRAj78gdvJqKkHtPMzEXsT
 tHRmb4JZxw1RfE9dgKtIFfB5BeWeTE67pSJDE0WHZ8LMUmlZS2HnGTkoL
 QGaQufe3GHqfJzgqduvrabO3/UCFMDWiwlvMTyZT7vtXjBQzd/IaUmcrK
 YnT7QIEohTpA9NdlX3vs5LutaLq0IiCo5EtZDupR5WUm98qmgJl7olNHX
 8KrxHfS43OO3YUD1V19VhzVBi+g2fUUZeI8dCWSqAeRWPltrDjIi07gXY A==;
X-CSE-ConnectionGUID: lkdLkvjDRSO6T3wde3ouVw==
X-CSE-MsgGUID: N1yrX5dRQ7CdvoCKwuJD+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76281282"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76281282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:21:36 -0800
X-CSE-ConnectionGUID: 6lmxloNwTb2YeQjQBOULlA==
X-CSE-MsgGUID: be3vD/EJSIaDCP9s/1cweA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="190930459"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:21:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:21:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 21:21:34 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:21:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5gRkhEJxVSpvjpO8GwHhbXyQ0dMX6kPq8UbyZmv1LTiTbe9nJfkV5WJjRn7mRzNFkznY03cjoJOf2pfp1m40chg+K9wQfPkrKtr0eniDLXgMmm8k+GIlsUf92mLZKeHd4EOWc1S/ODbyXHEC3l7iUarXCs7LduwPcl/w+XGwx6CV2g0Gg7MfsuOIqmv9HXiW5xLl9h1SuNqo0fJdi7WscBpLnik5RpU8XK7W6MJutz4M+XmQoCMymhrxnK592csee7aUZx6ADmdwlnrVr7IBl50NNZbkEpvwERBaa0wC/Ta0UlDUglrLIruRNo8KF817s2SFJAB/RoleRiwf3cOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNlWvIMFHqKGQo/Jna1UWLChsjIcqEEDVRbetF8I3KU=;
 b=MQMYYfrPtYeT8dz37JFckm9JFcrFZnWG36w6WV8aJ6fYeeNZhs4ejGnf/FTtxKGkZfFy5vEPKytIqMk4teKmu6F9JOwGx60PDd3IuVY8XfcrKJf9HY8weH/GI2yj8m6k3QrAT1UVG1pn/0x4hvNT8Lt/RYNB/qx6UXqb1g0LUa0Yed3HilFFE40TH+n4R37sf1th3fLEiBN7mTFijGUlFx0QRblhwOzK5XYzSxCvRcE3WzartfIV31yQMoEG8hEwN1JtY49QM8Lg6bTwA3VUaB17D7EYbfDn7+4sRWsMjLBbRmIUvYQKe3LJpCO4ljcsOW8ekRSYY/Nx60WLlnokTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 05:21:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 05:21:32 +0000
Message-ID: <7396b97c-89eb-4716-993a-57a5a08d66a5@intel.com>
Date: Thu, 20 Nov 2025 10:51:25 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-6-riana.tauro@intel.com> <aRTQCoNGUf_D0f1F@intel.com>
 <291ca7a1-51fb-4f28-b1b7-1e4f9d12878c@intel.com> <aRZfkujQB1QV9D4v@intel.com>
Content-Language: en-US
In-Reply-To: <aRZfkujQB1QV9D4v@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: b385fcbf-d2c9-47dd-c8a2-08de27f4aa82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnJVNmJtQlFQbDNSTndnUXVza3hzL21XYnhyOUNxdzRtOWkrbVRZblJlUVJE?=
 =?utf-8?B?OUNnbHg5Q3JFZE9ndERCcTRQTCsrV1MwZnB4SGdVRnFHa3NSUlgwNE9Uak1N?=
 =?utf-8?B?V0V4REtjZDFzYUFiN2R5dWszUjUwOUJzSUVKQkZqWFZBU3VkWjBJN2Y2TEN1?=
 =?utf-8?B?emZnRUtPQzlDYVNXemtJakVKRHQwM3AvbW1Jc2lFSWlGQzJCNmZSc0FkSlFJ?=
 =?utf-8?B?U2NYb0FtSWhOQ1BYK3dxZEozbVdSbFlESFpSSkNNcEg4ekt1Z1BKM3lLbDVh?=
 =?utf-8?B?Tm0xM3hnYzlESnpDR3FxWlMxMi9QbVA5ZHBCVXFBOXhGL01nRTVUdmRZbUNu?=
 =?utf-8?B?M0NiWXd1MTlPZkRzUUp1UUlaMEhFNzJDV0xweUgyWjdpK1JRd2RqdVVNUDNR?=
 =?utf-8?B?MWFsMnFNU0V2d1RwK3IyanpPOENWanVpVjdTeG5pUDVPM0ZMelhSTFE0RElC?=
 =?utf-8?B?STNOV29DYzJJNG92b3c5eWhqVExmRDdSY2RacFp2YzZyYUlVZk92NmtLeDkz?=
 =?utf-8?B?SUpXREMzdXFtTkZQeWgwSVNVOExLdXVBTWIzWmNCZ1REZlNDSDJpRVRtM1pN?=
 =?utf-8?B?VWJwNEhaWk9MNCtWVytpSUxoTlp5ZWg3SDlHQ3k4eVoyWjFuWEY3S3JBd1Bo?=
 =?utf-8?B?a1pyaTIvb0VZaTZpSnVSTGhac1J6eEh3WGlNWTgzS0JqWEQ5NUs2SG5vaVF4?=
 =?utf-8?B?ZSt6RTMzK0wvV1p6ZjZYVFZrUzNHTjIzUWRtUkZJVXg3V0VKaDFyKzB0eTZo?=
 =?utf-8?B?cUZVODl5bUZEY3QzbXpUZFFsWnE1OXpTUFFPVmxLOVFOUWdBeU9sRzU1U0Jo?=
 =?utf-8?B?eVlyNXp1QnN4WDYxdzdlNzV1azJET2NsbWhlYjRWdlFySnk5cW1oZHJwS1lS?=
 =?utf-8?B?Qjd3aXBxa1hndUN0aXZNUlhYY1YxZWlKUlFIS3BFbnY1azF4K1Q0RXpZNTdl?=
 =?utf-8?B?NFdYMzZicjJlR2sxN0VqTTBxUG5FeEh4VkNCQVYvSE9LK1dyckpncUJrZHk1?=
 =?utf-8?B?SGtUYXRzdnhrZlMrTEdqam41U3NrdVF2S0V0Vnk0c3FtT2VnOTEwcm9mZzlk?=
 =?utf-8?B?dmpFclcrZ0wwdFRkSlB0UVg0OEZpckxQd1ZYdm1CWFl6NTg1eTIxOWYyZmFW?=
 =?utf-8?B?VkNUY25rNklxaTE4MUNmSlJVYnRIcmxScS9tTStqazFRMHJtS2EyOWRuYUUr?=
 =?utf-8?B?c1FGRzA0NzlZcVlvRDdRb3hMNjVYbmZvWGdzVnMwZHlndjRzTmtUcUtTMStF?=
 =?utf-8?B?NExTTnEwd0l1S2lHVDJjeHlQeHBkbkFYYzFkYWJQdDY3aUpwOC9Fc0tFQjVM?=
 =?utf-8?B?RnQ2cDk0MWNOcnR0M2FXOGMyV3phTkJFM1dXRWJTSXNFdnVmZW9yKzVXYkNW?=
 =?utf-8?B?TmpKTHBxb01sZGVEOW94Qngwb3RXbXJOTjk2Z0pJL1d6QUMwUzRiendpRU0y?=
 =?utf-8?B?WTFqTnlucDBBVk9Fd0d0clZ6VGd6ODRHSURUUzhvUkxaZTZoUFc3QnA3cGVO?=
 =?utf-8?B?ajI2L1dxekJpRXB2VC9qRDgzclpIZkZyNTNqaVdEVVlsQzBSWkhJQkp3NVQ1?=
 =?utf-8?B?bjJnNnNPWmZNRHg4aVk4ZlAxNm9lZFpDMmY1WDYzb0F0bGt1Z01IVW9SWGp1?=
 =?utf-8?B?Yi9QNDJiMFd1aDNzV1RVZDVCNmdNdnpBcmw2bW5EYWNmVFhiY2pXWXZhbFNk?=
 =?utf-8?B?M2hqaHJNeFFuUnduN3ozQWppRVdaYXBpQUZ4Sm8rNGFlbnpaMHMrOTFVSGlF?=
 =?utf-8?B?dFBoVUtCekU3SG9reUNoTHVFb0NBazdIMVdPb2tHemZQeWlmZk5YWXZndzVi?=
 =?utf-8?B?eEMyRU5ZSXJnM3o5UjVTMFl6blBsN1ExR1krMEZYeU94bG5vMVozYldmQXRS?=
 =?utf-8?B?OEdod0NiNlBTSjI2Z0IvWUFCOE9QVUs1K2xhbThVamhvUllhajVKc0RkUkk2?=
 =?utf-8?Q?26x8D3KENHDL/a+JTb0h65mYkk/MvcHF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkkxRUowbEVFdGVsKzRaWjFCMDlSYnVaYmUxQ3oyTU10elVOQ0J0RnJtZ3g0?=
 =?utf-8?B?VUUxNVBqeURoTm9maFNtTUV3OEdTSHJobzdiNnQzSXpneUJnQzJ1QVNtRXU1?=
 =?utf-8?B?alVUbTJxNS9LNFpxakZ2VHV0V01uQnc5aTgwYmFHaklPWXpKcHpCT2hwT0gw?=
 =?utf-8?B?M2tNdG1pUGQxWWpLVHUvVFhpT1U2ZWczM01UNUN1dHQyaVEyWWo1MzlFNDE4?=
 =?utf-8?B?NTZwTmNqZlkrQXUwOWwrQ1pkZTd1R3IxQ0lxWHhOS3c4dm5tSW5ldlduVWIz?=
 =?utf-8?B?RitkWjdVYlBOeGxKdFZZeXpCR3RjQjNtTEdkUTdGREtERmtZbU9heUpSN1VT?=
 =?utf-8?B?R3h4eVB5WkNqV0JubzFOSFBGelA2bWpEdXl3ZURkL3J2ZnRPR1Ftay9qOWdm?=
 =?utf-8?B?bXg4WEpONFo2cXNERFhNWTJoVkNuSHAvMk10RUlLUFdPS0s3ZVJtakRRQUk2?=
 =?utf-8?B?TkU4TnRhNHFMSjg0UGtLbG5UNEU5MjBRUHdIbkduaEc3SVJJVjkyL2RZSVUr?=
 =?utf-8?B?V3dXdTkzKzRoQjM2UE5WdkwwMy95NnB0T3FJLy9MbXNlUzZ2S1p1TUxHeEh6?=
 =?utf-8?B?azc1dERzN2h2WE85MTRpcHV0MGoxWDhOYkFYdnNhSjN4Q0pEaUtEYkROSWRX?=
 =?utf-8?B?UkdsN2tGOFlWZ0JmWlowOVdIQVJjektvSVhNaDhLRURYT1lnTitXbXZoSFFh?=
 =?utf-8?B?RE1EUjkyUmVvaHBSd2ZzVVNlQ0gyaGFzd3BnSE1QaVR3MFZxYjV2N1VmQU5Y?=
 =?utf-8?B?TnRYL1ZoVWZidVlnL3I3ZGxIT1hNZ3FuYVdjWC9IWEpwVW8vME9ScFpDR2U2?=
 =?utf-8?B?UmR1QThHZklPQk5RZDBzZjFwbHdYSDZaWEQ0WmtyS3FGblNNdUxlR2JJbmhO?=
 =?utf-8?B?TWZVV1MzUXV1ZHBwN3RVRjRLaDlzNSswcTh1MkdyNzZKRVhDMkQ3TmM0Yzhz?=
 =?utf-8?B?NlNoektZMW4vd1hwZzN2ekxWSWljaEh1VzdwMFZlME8wbU5XRUNyY0NTTjh6?=
 =?utf-8?B?d2RieGFnMEhkQUhvT1lxWkRkQ2NFTWtNUWhmNVIyb2hCcVlMT09QSCtVRGw5?=
 =?utf-8?B?bFZDdUdBWVdYVS9Sb0lKbU1YVXRBcW42WGMxRkc4SkFaWUliMTB6SXJrUm1E?=
 =?utf-8?B?RjhqU0x1WGdPSGhSRjlyRmkxOVZXc25idHBEOFFQdEV1c1hNSE05ckRZS0pS?=
 =?utf-8?B?Q3l2VFRCeFlYcDMweU41SVdET1Q5WFhlWXhyNnlQY21KdFJSdFh3dVZoMlVQ?=
 =?utf-8?B?K1NENXFxS3VzSDE4eWVBQTQrTHRlTVQyTnJ3NytKYzJ2c2tOZlVaaEdXdEtI?=
 =?utf-8?B?ZUVyUnFkRStCOXc4Rjdtc2V3SE5xVUJwYzlRK1h3R0M0UjB6Q0FPNFIrUVda?=
 =?utf-8?B?SVFEbDhHa3hkNGxxWXI3MG1FN2hLbTR2RDVhT2ZKeWhUT1h2UU1wanZabmpy?=
 =?utf-8?B?Y1Q3K1J1YjNNek5hWnhpRXBRL1I2TGxjb2thbnlndzg4UHEzUDMrT05lWUNq?=
 =?utf-8?B?Ti95bTRLS0JzU1pjczJqUTRZZWt3K0tPd1R6RnZCT09IYWp4RHBRdjRhRXp0?=
 =?utf-8?B?ZjhiWVg5YTd0dkJTdHpmZit6OTJtMGd4Nko0dFR4NFpMOUxGdHE5RFJxeDBk?=
 =?utf-8?B?dFR0M2U4WlVBWkZlOVNUeUhpazVpdnRmQ3E3dS9JbUU5KzRCM2JaWG9sdXFv?=
 =?utf-8?B?ekJZNHdnL2dNYTBlTXJnZmZvZWVwTEZLN0xrcDRkWXBNR1hsWjRBUnQzbWhP?=
 =?utf-8?B?MFpxV3FrZFNQUmRUaVpURU9HaXJPSEpUYjJrSTl0NHAvZ09xaTlhRGRiU2VI?=
 =?utf-8?B?VDFhZHEyLzNzVmVIdEI0VWdaLzdicW0raDJUNlBjdDFKNlJUcFRIUDFYZzY5?=
 =?utf-8?B?Uk1qdXNBTXUvaktSK0pTRkp6azFDTHQ3Vk1MVWNObWlxcXJJN1hRRFZOQzhY?=
 =?utf-8?B?SW8vN0Q2eXFWT1c4SGoyazl4Qk1KVGlXU2dMT3daUGRrdTF2cmg1MlBnN0gy?=
 =?utf-8?B?VU9VdElyaGdWOTJnaVBGYW05aWp4SjQ3eFhGSHpYakIvTHFYV2ZnNHlGbGZG?=
 =?utf-8?B?VXdlSEZUZFZQZm11UU5GWHZudVRaN1p2UC8wcW54OG9HcHJMSWlWY3JZVkNB?=
 =?utf-8?Q?Vko6gy6U/dR+rFbZ+hmbR3ZbN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b385fcbf-d2c9-47dd-c8a2-08de27f4aa82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 05:21:32.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLvyLGC1Fh5m2sP0fbHUxqn9tc0dmO4cJokoFxuZf2HMX7cP+kbCAHqDgt9tfe/jDulzGwt+/zbPO16RCR++gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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


Hi Rodrigo

On 11/14/2025 4:15 AM, Rodrigo Vivi wrote:
> On Thu, Nov 13, 2025 at 01:56:19PM +0530, Riana Tauro wrote:
>> Hi Rodrigo
>>
>> On 11/12/2025 11:50 PM, Rodrigo Vivi wrote:
>>> On Wed, Nov 12, 2025 at 04:03:39PM +0530, Riana Tauro wrote:
>>>> v2 survivability breadcrumbs introduces a new mode called
>>>> SPI Flash Descriptor Override mode (FDO). This is enabled by
>>>> PCODE when MEI itself fails and firmware cannot be updated via
>>>> MEI using igsc. This mode provides the ability to update
>>>> the firmware directly via SPI driver.
>>>>
>>>> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>>>
>>>> Userspace should check FDO mode entry in survivability info sysfs before
>>>> using the SPI driver to update firmware.
>>>>
>>>> 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
>>>>
>>>> v2 also supports survivability mode for critical boot errors.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c    | 41 +++++++++++++++++--
>>>>    .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
>>>>    3 files changed, 46 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index 92bfcba51e19..d41f07f9194d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -77,11 +77,13 @@
>>>>    #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>>>>    /* PCODE_SCRATCH0 */
>>>> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>>>>    #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>>>>    #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>>>>    #define   HISTORY_TRACKING		REG_BIT(11)
>>>>    #define   OVERFLOW_SUPPORT		REG_BIT(10)
>>>>    #define   AUXINFO_SUPPORT		REG_BIT(9)
>>>> +#define   FDO_MODE			REG_BIT(4)
>>>>    #define   BOOT_STATUS			REG_GENMASK(3, 1)
>>>>    #define      CRITICAL_FAILURE		4
>>>>    #define      NON_CRITICAL_FAILURE	7
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> index 3d9417911c33..d22fdd08d227 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include "xe_heci_gsc.h"
>>>>    #include "xe_i2c.h"
>>>>    #include "xe_mmio.h"
>>>> +#include "xe_nvm.h"
>>>>    #include "xe_pcode_api.h"
>>>>    #include "xe_vsec.h"
>>>> @@ -66,6 +67,11 @@
>>>>     *
>>>>     * - ``aux_info<n>`` : Some failures have additional debug information
>>>>     *
>>>> + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
>>>> + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
>>>> + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
>>>> + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>>> + *
>>>>     * Runtime Survivability
>>>>     * =====================
>>>>     *
>>>> @@ -95,6 +101,8 @@ enum scratch_reg {
>>>>    	MAX_SCRATCH_REG,
>>>>    };
>>>> +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
>>>> +
>>>>    struct xe_survivability_attribute {
>>>>    	struct device_attribute attr;
>>>>    	u8 index;
>>>> @@ -131,6 +139,11 @@ static void populate_survivability_info(struct xe_device *xe)
>>>>    	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
>>>>    	reg_value = info[CAPABILITY_INFO].value;
>>>> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
>>>> +	/* FDO mode is exposed only from version 2 */
>>>> +	if (survivability->version >= 2)
>>>> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
>>>> +
>>>>    	if (reg_value & HISTORY_TRACKING) {
>>>>    		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
>>>> @@ -193,6 +206,9 @@ static ssize_t survivability_info_show(struct device *dev,
>>>>    	struct xe_survivability_info *info = survivability->info;
>>>>    	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
>>>> +	if (sa->index == FDO_INFO)
>>>> +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
>>>> +
>>>>    	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
>>>>    }
>>>> @@ -210,13 +226,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>>>>    SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>>>>    SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>>>>    SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>>>> +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>>>>    static void xe_survivability_mode_fini(void *arg)
>>>>    {
>>>>    	struct xe_device *xe = arg;
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>>    	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>    	struct device *dev = &pdev->dev;
>>>> +	if (survivability->fdo_mode)
>>>> +		xe_nvm_fini(xe);
>>>> +
>>>>    	device_remove_file(dev, &dev_attr_survivability_mode);
>>>>    }
>>>> @@ -227,12 +248,16 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>>>>    	struct xe_survivability *survivability = &xe->survivability;
>>>>    	struct xe_survivability_info *info = survivability->info;
>>>> -	if (info[idx].value)
>>>> +	/* FDO mode is visible only when supported */
>>>> +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
>>>
>>> should we also make the version a file inside survivability_info?
>>> for explicit check instead of implicit?
>>
>> Are you suggesting that we had version in the sysfs and let the user check
>> both version and fdo_mode entry before deciding?
> 
> nevermind, I think I might had missunderstood the flow...

We can remove the implicit check for visibility and expose fdo mode 
irrespective of the version. The value would be 'disabled' by default

Is that okay?

But i think it would be better to expose it only when it's supported

> 
>>
>>>
>>>> +		return 0400;
>>>> +	else if (info[idx].value)
>>>>    		return 0400;
>>>>    	return 0;
>>>>    }
>>>> +/* Attributes are ordered according to enum scratch_reg */
>>>>    static struct attribute *survivability_info_attrs[] = {
>>>>    	&attr_capability_info.attr.attr,
>>>>    	&attr_postcode_trace.attr.attr,
>>>> @@ -242,6 +267,7 @@ static struct attribute *survivability_info_attrs[] = {
>>>>    	&attr_aux_info2.attr.attr,
>>>>    	&attr_aux_info3.attr.attr,
>>>>    	&attr_aux_info4.attr.attr,
>>>> +	&attr_fdo_mode.attr.attr,
>>>>    	NULL,
>>>>    };
>>>> @@ -301,11 +327,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>    	if (ret)
>>>>    		goto err;
>>>> +	if (survivability->fdo_mode) {
>>>> +		ret = xe_nvm_init(xe);
>>>> +		if (ret)
>>>> +			goto err;
>>>
>>> should we really fail the survivability mode here?
>>> Or keep the survivability mode with some indication that fdo/nvm has failed?
>>
>> FDO mode is only enabled when MEI path to update firmware is not available
>> due to some error in MEI.
>>
>> If initializing SPI also fails then user cannot update firmware in
>> survivability mode. Staying in survivability mode will not be helpful
>> since both paths are unavailabe. That's why added the fail
> 
> But then you also fail the probe anyway right?

yeah this would fail probe. That should be expected since both fw update 
paths are unavailable

Thanks
Riana

> 
>>
>> I should remove failing on mei_init instead. Missed that. Thank you for
>> the review comment. Will fix it in new rev
>>
>> Thanks
>> Riana
>>>
>>>> +	}
>>>> +
>>>>    	dev_err(dev, "In Survivability Mode\n");
>>>>    	return 0;
>>>>    err:
>>>> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>>>>    	survivability->mode = false;
>>>>    	return ret;
>>>>    }
>>>> @@ -436,8 +469,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>>>    	if (ret)
>>>>    		return ret;
>>>> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>>>> -	if (survivability->boot_status == CRITICAL_FAILURE) {
>>>> +	/*
>>>> +	 * v2 supports survivability mode for critical errors
>>>> +	 */
>>>> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>>>    		log_survivability_info(pdev);
>>>>    		return -ENXIO;
>>>>    	}
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> index 1ed122cf62f2..d887b443b397 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> @@ -37,6 +37,12 @@ struct xe_survivability {
>>>>    	/** @type: survivability type */
>>>>    	enum xe_survivability_type type;
>>>> +
>>>> +	/** @fdo_mode: indicates if FDO mode is enabled */
>>>> +	bool fdo_mode;
>>>> +
>>>> +	/** @version: breadcrumb version of survivability mode  */
>>>> +	u8 version;
>>>>    };
>>>>    #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>>>> -- 
>>>> 2.47.1
>>>>
>>

