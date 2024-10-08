Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D39CEF172
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 14:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385F510E570;
	Tue,  8 Oct 2024 14:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4alNsSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74510E570
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728399350; x=1759935350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=icFe7/yxrVHEjmCbLl42dsGhKarFYXONvYIWeWBdkWI=;
 b=R4alNsSlixv+++n7Qw5NQ+j2t0XkKs6llOuSH1+XWX4OQ1yQS6ZPHER6
 Siq1Mt1rPZeb6aDvdtQJHRToIBqjvGIUNK8UP1vohJA7VgIgjI/O/xQGd
 EcmfA4KBzlXQpskwyKEErzNRtVlP8xBq/BKylEkH4KPwIVOrWd9S74k8d
 3SL210oaGf8lnVVhOYhv81XK/4+ZM/IpDQOm7pq7RIeZ79mwdg1AfWZnk
 lpDZvbh7DWxj9whqkOcQR7+WdsxYB20u2liekOBu7RpQnwDwAw77ZVqMF
 oVNS16q+MRymgBTjZ/TvQlbZN7HzFgSKQlMxqUbtceg+h3KQVfRnzHx1B w==;
X-CSE-ConnectionGUID: vIZCxEbBS5u1w0vhVAfUzw==
X-CSE-MsgGUID: Dq767KAeSBKST8P17V2AtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31304899"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31304899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:55:49 -0700
X-CSE-ConnectionGUID: WMoYXqNTRruhMemHQosJAQ==
X-CSE-MsgGUID: Nf0j7ds3RCmczxZ3Qyoyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75826108"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:55:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:55:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:55:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:55:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iqs7umXef9jmSjMCnwc+q8sLLhVy0knAGS0NVoZ8vgv1+dSNTstRoFML06m+CebE4BoesgHwhqyNQavGqHnW6AeJ9enK0wLRP4y9gOkUnLA33Zk+BcFJWuzNSPYl7b6GVi2Kw61GMhrpiMup0qtGJy/3ASaReM/1Wko2XEU5TV7UT+90zpczl1C64NP5JYs+X+PrXVlp5LM9IX15ziqqK2bqMZdNqVgjQerpwDd6PTNW2axiPfUHLoq1mir8nhTa2/MPmUDoNjGvS3YY5XzTR6Gk0GWesP6lDzF4mXFi9l1MCJFuU3piNEG/s57Lv+aVf/se8d11Al4ZX0S1xNZaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx/t0h1AdQcOEpLA5RW+Yjtfe6hZbrh2zxYbDoT0uxQ=;
 b=kWio1vCT6MV3qHlbCHtmsIf+1xJXIMWiytDEWYwPgB/c19cD8o4t3jNyWKfAA7h/RENiR6Ze38xHf9mJ3jFwwUhYKpP68+ulBXqoZChoMsj9FK15hHA6n6VxSvnlxs3DLv6KjWvZS7H49+QG0jnZgrjzM2UJblZbxHUHg2rbWNaDYReaRutejwuC9TVNA36d6xRugOFGwi3Lr+MR6xk3pwJmEn72DjYk2y5Mdlp5rMHIw5WmgZV9atmNJBPbY3SPsA0juQskXJtz95a1oN4pENT3+IPDh3zckd3S7OyftgVKBh00pRdT87KglWl2oD2+LauHsmBXD79Z0JcJtDIqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 14:55:45 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 14:55:45 +0000
Message-ID: <9585a672-7b7c-48c9-ac42-b13e3836dc15@intel.com>
Date: Tue, 8 Oct 2024 20:25:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/26] drm/xe: Add member initialized_domains to
 xe_force_wake()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: a910d915-d84e-4acf-b09f-08dce7a9498f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnZPTEZaVEZ0MTFLajkzeW9lMU93WFhudHdrWlRKbnJ1QjlGVFJCR21VRHdK?=
 =?utf-8?B?ZXBGL09lYWdjZVptNWQxVmtFeHVITXQvMmZyRTRYMEVKQllxSlBORWVnRXRz?=
 =?utf-8?B?M3BYRWRvVTNUeXJwOUhjOVJwNzNDRzdYc3pIYWhBOGk3MENlSERTaGJYc0c2?=
 =?utf-8?B?K2E0Q25HK0lIZGVXNjN6dHJPaDZuMmNmVVIwbDF2VUYrOFpaNWVLRk41WU9P?=
 =?utf-8?B?QTNPaG1aSjRPV2RMcngwSURoNnhwaTdWU0pXelYyQUNlNmMwR2VobjZGL0VH?=
 =?utf-8?B?L1ZVNVk4MzNRV1U4V01sQ3RYampKdkxpcTZZV1I5MTF4UDdsWDdES0VDeXk2?=
 =?utf-8?B?eFpjS3lxak9kT09ERkRQcUh5REI3c2xzb1hiblRZR0pkdC9rSFVkNmlRWFJt?=
 =?utf-8?B?MVhOa0NGWHFMS21WTGtpakl6eWRWdW5oN0NyUUJlb2thb0N0TEt6RkEzYkw5?=
 =?utf-8?B?aXJnN21jTFJ6eXYxSEw4OXpjdkJZcDNnS2g1eVpSVXNFTVNyNEN6MGtJS2tE?=
 =?utf-8?B?ai9KTE1wS2xOOUpQa3I4eHhnZGRPMFhTWlROYUtZSXZrWUxNQkFjNDVGcXpY?=
 =?utf-8?B?QjZUOHhjM3h1NlgySlB2REZpUGtrdDRpenlhak5pTVJyM05TdU9WUHNTK1Aw?=
 =?utf-8?B?bTNIemhBbS9QWlJTQXdTdWdNVTdiemN3dlB5SzJrdENqWCtxN1R6b3czSVQ4?=
 =?utf-8?B?ZWFzTTdCQmswUGdMYk9GWmFIbW9TS21CelJsNDJtRnBMOSt3alprV0NydHZl?=
 =?utf-8?B?ZG1FclNjcVpVc0dmUzMzY3YvaDQxNEJ5ekFVSDJ4cm5qR2IvQmp1TldlU0x5?=
 =?utf-8?B?K2JCa1lPZHJhRG9nYVFJQkRzbG10YVVjZmpwSWVqb1BqVXNpazluY0lVWFc2?=
 =?utf-8?B?ZTN1ZUZWTEFNcjhwYnhrMnoySHlFQXhleWdEb3NOZWNWaTZPeGJRU09XaUlQ?=
 =?utf-8?B?alpSeHVrUmx2ZWRIWnArYS9UZU1Fb21lZExZd2E1c2lGNFdNTVRPeHl1ekZu?=
 =?utf-8?B?RzJCQkhqVW82dG9Xa3FzcjZiOEFjZ051a0tPVS9UdUxYNXVWYzN6YVR5M1or?=
 =?utf-8?B?WmRFMlh1SjJ4akYrM25BZ0FPVUZRdWpOVHBIYitXNzk5ejJsZVdPWm9MTnM2?=
 =?utf-8?B?YnY0bGhwNGZzejlUckxhRUdtUWpsTnlDdW9wanBNTDFzOS9VNjJzRlB2SWUy?=
 =?utf-8?B?N0R4QjhrMGo2VHBLWjVVQ0xjM1RYTC9xaWlmbjgrbFg1TXVLUXpkcVg4VDky?=
 =?utf-8?B?YmN2eXd3WjRHZVRZTjBCUjhLQlQ4djROMkRwL2pFTXZQMHdTamd5RHpNaFg0?=
 =?utf-8?B?dDJRVXlYRVNVQWxRTTg5aEZNWUxBdlFlUEF1Y21LamIxK1ZpR3AzaVd6dE81?=
 =?utf-8?B?SG96dC9uN3RicE9IMFhHaHlXOW1HWXNWTzBYOEYrRGJUUUx4UzVrQVNSK2lY?=
 =?utf-8?B?S0dhR2lzQkx2TTVTem1YYUV4Q1JUeVR3cThpMzc2L0J3UC9QSTVmUVpZcitL?=
 =?utf-8?B?WlFJWEdCN1lCQWs1QUl6SW1tY0YyVXZmMzdRSTRJWVlkRG9ZbUEzRnJINXFo?=
 =?utf-8?B?ZU05M2QvN3U0YVZ5UE5DdmJGUnZQL1ZHa29DQXFtbjBnY0NBWXAySFNreVZ6?=
 =?utf-8?B?eThyWC9ldFBISGpHeUt4RTBGSklQU0dPREZTWWd2NTdIbUgranVPSDJvd1Ir?=
 =?utf-8?B?SnN3S0ZWTElERzRpbExOaW1tT0h0YlRqSEIyV0NEMkN4OWJzaDFwMDV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGliajI1UGdBMFZtWk5acnRLdGpTVDllTXFlSmQyMHdnd2xDSkNpdlMzS3pD?=
 =?utf-8?B?aFJER2hTeU1hQ09NVzFRbFZaZmVObGVSZUZDVkVuWTVZUC9XaXB0UWVQbGxl?=
 =?utf-8?B?VFQ2bHJvSkx3cGRBa3Bvb2Q5dlkvcktTVGU4UVdUK3BuaXA5U0d2SWtUajRB?=
 =?utf-8?B?ZURDRUJVR2tUc01Ia3lscWxlK3V0Y1NFb3paQmM4RjF5WVNZOWJVbUMzRzZt?=
 =?utf-8?B?SUVZS3RhUkdueFZtMlFlaGpJVVoyZkdhQ3grSFE4WUk3UmYxdVEyK0JrdEgy?=
 =?utf-8?B?NTRoY1YxNWhrSWk5Vm92SjZoUnVoZjZZbTU2V3JKVHY5MjNKMnJnSzdZWEZW?=
 =?utf-8?B?S0F4MGhiRCtvVVpxeDN0bTNvSS93ajZuTURwdEJlZUFHT0RranUrKzFuanJH?=
 =?utf-8?B?RlhiQ0xoWllwSENqb1M3cWJDUUtsVW5VMkxFZjU2UU9oclYwYi9hQWFOVXlq?=
 =?utf-8?B?a3RqVFdLTlRvUkFtRXNlL1BtemdUUCtJR2pnV3oxc21NYnd6MUtvSmRUWXhp?=
 =?utf-8?B?NjNLbkhkbEhXOGsySGVEVTNobmE4M1VVWHBKNFNqSlczd1dXWXZtcWs2TlFq?=
 =?utf-8?B?NldOckxocmprdTI0c20wd0lLOEVMRFNpRndlbzUzbmxCamQyZWh3RFZYdk15?=
 =?utf-8?B?a21rbFErRXhWN290TUJOMUtxZFQybmFSNjUrOEFCNjFRUlVrUlIwTlhVRFBQ?=
 =?utf-8?B?WC83ODl2amt1QUdmWDhjNVkzZHRyZ0lteXZkQklVWU1DeG9FVUkzQXhXK1Zx?=
 =?utf-8?B?cFpURExjcTEycnlWVXRxOFNoQTRpZE0vOE8zQ2hZRjE5MDk3ckVhb2wxL3FT?=
 =?utf-8?B?YUpsMkVMZ25XR2dhblRacERvZk1MNGhJOEVyZkp5aGpQUTk0NytyS2QrV0RG?=
 =?utf-8?B?NEZ5WjlPSnc5eC9XVTBoc1dkdUNXaituZjFFVHdJWm8wVDZTNW0xN1hJb0du?=
 =?utf-8?B?amFidWJSWTNZWk5HTFBKZ2w3b3pqRGIxQWdBQUUvZmI2RkhISi9yVzFpYjdG?=
 =?utf-8?B?dHhoRjEvbzJ1Vm05cFl1NHRpc2JUdFlOQzlzYld6bEtUWENvSS9Xc2ZIUmZH?=
 =?utf-8?B?aDVmd0VRVi9ZQXpKK2JIK3BRRDFPdk9YMUkyWGxMWlQyNE15VS91d3JzTUNa?=
 =?utf-8?B?VENWQXY1cjc2enR4NngzRGlEQ0JraHBqWmlLVWViZk0vM3BzYmN4RCtSMzJ4?=
 =?utf-8?B?eDA2THJLaTBVUEhZOWNrNUdreXB6aURXVU1MQ3JCbDQrRGZzMHpWbThFSzhM?=
 =?utf-8?B?YTNwSTZiNmJjTnpDK3lDS1VFcnN0OHhweklaTVNhczZTcDNqeGNJcU4wMTFS?=
 =?utf-8?B?VXdNYzNHMU9jcU9YTHE4VjFJOWNLbEV2TFVlVGdtbExSV0ZPbzJQZHlLZzVj?=
 =?utf-8?B?Zi9ScUovZHFuSThDL2l6Mk4yb2NFcEdmTGVJSFdidHc2YktHTEU4VHdIbDRI?=
 =?utf-8?B?ZUgvcVRmRlQwbHBNaFo5TE1FaUIzemJmOENONWxpVTRmZ0dUY1pGWVhuNkxx?=
 =?utf-8?B?NzlnRTRkSzNVbmN0ZmJQZHJ1NkxJYVZYU3BzRUxiS0d6Tjlkb2VuYSt0VTFZ?=
 =?utf-8?B?T2pxSHVLU2xUVVJ0R0kxbWxTUFMvbkI0UWh5TnBhOXFmUVlSUjJGbVVETTls?=
 =?utf-8?B?dEVOdENEbU8rQ0ZRMW0zV0srMzRDMWZ3Qk9qdEhKMFU5NTR3c2xMbVdKaFlQ?=
 =?utf-8?B?WnRWQXVZT1ZCa1FCZUl2SXM1YnFoSnVYdk5hVnZSWSs2RE1qNlhTTTVjWU5n?=
 =?utf-8?B?WFhOSjZlTHVxWXROWDdjV2gzbU91TWdYT2FuY2kycVE3dGdTT2h0MVZYeEFD?=
 =?utf-8?B?L0dNNXRwR1Z0VlI1RE1TZHk3NkxxRWZlYjNYcGpmM2ZUTDR2WCtJbFNid3d6?=
 =?utf-8?B?T3JUZnhJaGtMUkRzUTNIcFdweTk3M3VpT0RyTThYUVU0ZFF4bDZsczhSeFNj?=
 =?utf-8?B?ZSsrSzh0K0R3aUtwNlFhdCtQQWs1T0Q2UDVBSVVYSThtLzRKYWRZUUR1ZDhS?=
 =?utf-8?B?ZWFwRyt6K3o4b0F2elR3bTVobzcyOUpMK3hWTnNJTThxTjNEdUppRjVGT1Aw?=
 =?utf-8?B?OUZ6Wk1aZ0dVOVVSUXFpN0tBNlFIU0NjdStEQ2x0OUllL3BqRkJMM0Q3dFQ2?=
 =?utf-8?B?VVdBbzgyZmoweG1idU9idWxrSVFSQU9KOGFDeThZM3doY0dSUjZ6eTRJSzZT?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a910d915-d84e-4acf-b09f-08dce7a9498f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:55:45.2653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IyQW3UAsguiH9vUCAcsrMoKgNDmiyInSGi4wllWW5spkSQgxVSG3FzGkKJf32xcWxT4HSiK48pga9Cbbn1hAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
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



On 08-10-2024 12:40, Himal Prasad Ghimiray wrote:
> This field serves as a bitmask representing all initialized forcewake
> domains on the GT.
> 
> v2
> - Move awake_domains datatype change out of this patch (Michal)
> - Rename domain_init to init_domain (Michal)
> - optimize alignment (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c       | 30 ++++++++++++++----------
>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 ++
>   2 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..ac0419da7173 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -21,15 +21,25 @@ static const char *str_wake_sleep(bool wake)
>   	return wake ? "wake" : "sleep";
>   }
>   
> -static void domain_init(struct xe_force_wake_domain *domain,
> +static void mark_domain_initialized(struct xe_force_wake *fw,
> +				    enum xe_force_wake_domain_id id)
> +{
> +	fw->initialized_domains |= BIT(id);
> +}
> +
> +static void init_domain(struct xe_force_wake *fw,
>   			enum xe_force_wake_domain_id id,
>   			struct xe_reg reg, struct xe_reg ack)
>   {
> +	struct xe_force_wake_domain *domain = &fw->domains[id];
> +
>   	domain->id = id;
>   	domain->reg_ctl = reg;
>   	domain->reg_ack = ack;
>   	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>   	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
> +
> +	mark_domain_initialized(fw, id);
>   }
>   
>   void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -43,13 +53,11 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>   
>   	if (xe->info.graphics_verx100 >= 1270) {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> -			    XE_FW_DOMAIN_ID_GT,
> +		init_domain(fw, XE_FW_DOMAIN_ID_GT,
>   			    FORCEWAKE_GT,
>   			    FORCEWAKE_ACK_GT_MTL);
>   	} else {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> -			    XE_FW_DOMAIN_ID_GT,
> +		init_domain(fw, XE_FW_DOMAIN_ID_GT,
>   			    FORCEWAKE_GT,
>   			    FORCEWAKE_ACK_GT);
>   	}
> @@ -63,8 +71,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>   
>   	if (!xe_gt_is_media_type(gt))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
> -			    XE_FW_DOMAIN_ID_RENDER,
> +		init_domain(fw, XE_FW_DOMAIN_ID_RENDER,
>   			    FORCEWAKE_RENDER,
>   			    FORCEWAKE_ACK_RENDER);
>   
> @@ -72,8 +79,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   		if (!(gt->info.engine_mask & BIT(i)))
>   			continue;
>   
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
> -			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
> +		init_domain(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>   			    FORCEWAKE_MEDIA_VDBOX(j),
>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j));
>   	}
> @@ -82,15 +88,13 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   		if (!(gt->info.engine_mask & BIT(i)))
>   			continue;
>   
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
> -			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
> +		init_domain(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>   			    FORCEWAKE_MEDIA_VEBOX(j),
>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j));
>   	}
>   
>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
> -			    XE_FW_DOMAIN_ID_GSC,
> +		init_domain(fw, XE_FW_DOMAIN_ID_GSC,
>   			    FORCEWAKE_GSC,
>   			    FORCEWAKE_ACK_GSC);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index ed0edc2cdf9f..494240777d03 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -79,6 +79,8 @@ struct xe_force_wake {
>   	spinlock_t lock;
>   	/** @awake_domains: mask of all domains awake */
>   	enum xe_force_wake_domains awake_domains;
> +	/** @initialized_domains: mask of all initialized domains */
> +	unsigned int initialized_domains;
>   	/** @domains: force wake domains */
>   	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>   };

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

