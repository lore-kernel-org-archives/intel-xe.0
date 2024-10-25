Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CC0D149E7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 19:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BBC10EB77;
	Fri, 25 Oct 2024 19:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cukW5/v3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318B410E09E;
 Fri, 25 Oct 2024 19:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729884901; x=1761420901;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=B2CkQ8A0/9YOg5ARyksBT50SyMR9U4Ts+NaumM81lBQ=;
 b=cukW5/v3F3m7rvFM3r6B13e01ZY+Vh+pZaz/DPDSY10JlOYWxEXTAcA/
 14N42ukJfyzIXRiha0Dk/oQZfJOtBNgQ3J/q+lpLqW3DpGDvS7DN19yLu
 9r8FaAXSbGAPqvakUSE3yRpV53bwxR1e/HBvRhVTj1DCum4XyQsPWY/zh
 T7YDH085K5TzLyXmAbwCp8QB0ismPQbZ8RC0yXYe+Vd0kY3FDydhOUVRS
 kY2kxjGRRCM00/n18nSN3oVmyH0nscoeNqTdBbBV1rxIcNhvuMReMXwH/
 m4UWZkaKfDH7fm6cTDlIkPDX+KbLEBSSwD3GBa7zqrGZvx/NaWZwjH+uJ A==;
X-CSE-ConnectionGUID: Ag46LkJmTjSR948azweJ4w==
X-CSE-MsgGUID: sz7EB9Z9R3ivOhdcM5ATSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29463503"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29463503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:34:57 -0700
X-CSE-ConnectionGUID: If1bN508QI6cuIEEYT7eXg==
X-CSE-MsgGUID: WIT8VZkBQNGjzA8iYEIxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="85611296"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:34:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:34:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:34:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:34:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9PocnTB0Fkct43hrgJ0rZSXo6xcwTETa11z7KPQKPp5BOtilZW8quqifE+FJtkjrRZVSHFrBW4oZVteQ9N06OLlL9dgV+HQCQO5F2N0T9fHH93d6/fn0BIr+sLTQPDURs0JYBWULvXl+9iDcB1oE0+EkdBNLsw/Qaj5zHDm7n8Cww3+C+yh2Y9c4TCO5xwro1zbkr81PTuqjCIXN1KlzbGt15eOte9SbQDlO2PjSSCQ3zkVL5SJt8wEcERPKAm+6SW7xKWWhAF91LRa29E3vlJXrkOYgjSCF3FM6Z/ICDQU/2IjJLm44CAkYVb6Y/ptrw0y8VR/jL54xNJKn0bzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDSB8pg1YvYcAjBU/aa5d4mmxtwYcIvHmF+Z9IKPyfI=;
 b=KIdhwh26vxD6oiIGKVIbdjiUlVW1lf7alDPeGD2JPwUjBQIErt35urtFeB33XcmaBFtg+TVJUq5EsftJ5ZCeKfT7TaC7lXT7jpI80NSwLtzakcFNOuT/qccZHVL9zNOH3UlCsfbEDQD6Jz+6GFmR9dK7Gye3WeLS0f9YdXWZDjVXD+0BGOGwoWfLoWawVU7ENnjUx5lKKx7b0XtT3QS2rqIvMyYyU5Iozq/r3zGmeKhdmECFXok1ICWNTI/r2E6UzRkVrh3mSWkyY2ydE5XxHSfwptpRFPtQcotMIKYCd9kjiVCsAp99UVh8q7hMD5BxOL4+Fxl5H1NiYp2nrTEjyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 19:34:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 19:34:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <172962598117.1311842.12349682742896116811@2413ebb6fbb6>
References: <20241022155115.50989-1-gustavo.sousa@intel.com>
 <172962598117.1311842.12349682742896116811@2413ebb6fbb6>
Subject: Re: =?utf-8?b?4pyX?= CI.FULL: failure for drm/i915/xe3lpd: Load DMC
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Fri, 25 Oct 2024 16:34:37 -0300
Message-ID: <172988487797.1548.9744426427287404387@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: d59eab77-5ffb-4dc0-8efb-08dcf52c12d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVR3VWxiVHArbHlheERhNEJyUUFPMi9HbzVNNndCbjdxK2U4UGprY3hhVGpM?=
 =?utf-8?B?bGFnT3NDTDFtdkVtTzFEVlJDT1g4azg3Mlh3SUczcU5QRFlTcXpVM3d1QVk5?=
 =?utf-8?B?NUJIYXNDZHliMmkyb2w3U1RRWWYxM2xpZlhuMmJTUjluNE9DRGxxWWM2ZTlW?=
 =?utf-8?B?T1NuUTcyVDUwT2UxVDRRRk96am9sSFdZUHRjcy9KN3FhOEFGUklVSjQxSzV2?=
 =?utf-8?B?MWEySEhaUWx0SUYzYlFzQ0xhZlo5Vm1nbkc0VWtRbWhaOGx3YWVLNTdLVHdR?=
 =?utf-8?B?STdSRE9yei9wUjBmS1BCK2Focm5GellIcHoxMmVsUElSQXQwMmNZRzVieWxB?=
 =?utf-8?B?Q20wR2IyTHJZUmRPci8vN2E5d21VWW1jWURpYk5KNVAzalVCNHRKdGNBVXhK?=
 =?utf-8?B?alRjd1lMUEpiQmpITlo4YmNUVzRKSDh5R2VLdVJJVVRFUkhUSU1rbFpmUTBQ?=
 =?utf-8?B?bXNJREovNS8vUWRyVHlRSTE0bHJwTkNzdFErZjhpZVExVTVQRWJEU2hNWlB4?=
 =?utf-8?B?RldjSmVWWHVTUy9HanMzQVYvSk9mLzd0NE1FTGJjRWhJR1Q4NVVkOENqWGZM?=
 =?utf-8?B?TkNWMDlrQmZEZkJON1NpS2RvNWZ4RW5GV3VNMkwzeE80ck9NYUpmdFJTdTZE?=
 =?utf-8?B?ZThrUjB1MnN1NE4vd0lMSFA3UThYR3grZmJFOWRLMUVZVElzakFvbmVZS0VE?=
 =?utf-8?B?Zjd5RDU2Q25WOFBjZytHNkkvSWpVcENzdjk0ck9SQ240U3NBbkR0eWUwNCtE?=
 =?utf-8?B?RjVZWWUxcTZCUXVHYUNzQXBhdEYwYitRdmlBNkdIekxybG95WFJ4ZHlaNWNv?=
 =?utf-8?B?U1dmZ0hIdkNBejVYak1ybEVmQTZCVHVhNVN1cEhNUllQNTR3ekpkeExmVkZa?=
 =?utf-8?B?ZHB1MHBsaUcvZG1ac3FVWXJoMUZzTmlRRTR4ZUtWTzRxbFVFWVM3dllyaWxI?=
 =?utf-8?B?UTgzeld1SkxrZWZjenNtNVJHK2lNREc1UmVhNWcwaXVodGRiRU5VNGErRVNU?=
 =?utf-8?B?M3BSTVJmTUNaZnozRVpoWVdCMDNCQW9IMmNVUUk3WUo1YkZzbkdLejdDZkhq?=
 =?utf-8?B?ZTM5VXZhdEQ1TER2VEgyZ25tR3dyd3dyNkIyQUU4aW5pTkZacVZ4K1ZMNEpV?=
 =?utf-8?B?K2FXR2VhOU1iWSs2bllobm1hVm5qY1ZQYnFZQVk3bTQxSWV0TkI4RUFCNmk4?=
 =?utf-8?B?MzJ3TGd4eHgzd1NJblJNWHRYYkMrbVlyemJhSWcvWGkxYWZpb1ZMTGVSZ1lU?=
 =?utf-8?B?TkFpZkNNMlVvWlh0Rzg5dC8yd2o0Um5KczBUdmQzZUF0c0lBWFFJYlN1Y0NJ?=
 =?utf-8?B?c0hsVFkzd1hHNFJxVERxRTErcE9jaXVrbVkwcFhmeFZtSWgreHhRaVo4NWxB?=
 =?utf-8?B?SHJrKzB4WGlja2c5aE1QcFhyNThyOFVabllFd3hVQTdvMmpTeTh5OUh4bnkr?=
 =?utf-8?B?WHVRSWdtMlFUakkrc2NHZlBHSFhpclFWZ3oxdVllei93RElwVmd4K253ekoz?=
 =?utf-8?B?Ty9DVXF5K1hUdmtjSmFWYWFINXRHTUx4ZFptYlNnSG1FTnRIcHpiZzQ1MHlF?=
 =?utf-8?B?ZG9vQ2pkQ2RFOCtqNnhvM3RFWmVtWTV1WVYrZUpjZERJWmdxRHY0WlF3b2c5?=
 =?utf-8?B?c29abE1JQy82dkFJblhITENqeDJkdHFYYkVIUFpmVGZiUm1MYUlrWjdEOCtG?=
 =?utf-8?B?VFVlVDVlSktFWU5ZYXdtdEYzZDJSOGpXYzdtRlFpejdmZVhJRisxVVFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTNNQkdOeVJNc3AySHpWVmRab2h1ZzZMRUhTcm1DbmZhNHJ4VzNTNU54a1pH?=
 =?utf-8?B?TjUwbjJRaTFhRjdadEhaQ2VtT0R2dGc2NisxSnpzNVpCOGYrL3N3T3ZJeGcv?=
 =?utf-8?B?YUFNQ0liYnNrbVUrUkNpVkc3bTdRL3M4YVAvREh6OWwvVEtxWE1HRi9wODBN?=
 =?utf-8?B?d0hNRFMzNk0yMlNpaFVJZng4anZGd0dvRm05QUVaQ1A2TndVYU42VW94WXV2?=
 =?utf-8?B?cmFlMWlWb0I0aE1JaWYrQ0pyNGY1WHE1QU9hd2VxR2NnbzNZZTQyNVNTenR2?=
 =?utf-8?B?YS83eHU5R0RWNDAxQjVIVmtaWHhFTmRqT3ZBR0YyNTVuM0RhbjVXcGVJbDU4?=
 =?utf-8?B?L2l6NGZqaFY1TEhZRUtpaG5ITWREeVpISkdaSTFMZDFOSlhsMCs0NWV3Z0Vv?=
 =?utf-8?B?bHAwZDRuT0dNYnpBWVk3OGgzbGFnRmpYUERmQXpkOUhzYU0rU3cvL1BzNFdZ?=
 =?utf-8?B?alFORi9GZnBtczdaR0dHK0dKd0pVcCthaGk0MlpGZzNQbGRVNjNjSTFOMXhw?=
 =?utf-8?B?R0lldTV5YkVxdEFKRXdLRlY0R2NadmN3S1JRQVFyRzFPWTkzN1Z3NTlzT3pQ?=
 =?utf-8?B?K2xEUWt3VFNLLzlodk1uNnl1WFV0bkxNUW1pTjI1SWdJb3ZlNkRrcXlvNGRt?=
 =?utf-8?B?S1FTcGxPMDB0WEZta3dtL2VUUTgzaWRnM1RXU1pxQUhCeGlpeVpSZ0tSb09m?=
 =?utf-8?B?MGxrTUN3VzUxekdHbUFRVUpLR0NMaGV6bkJ0NWdjNXlIK2x2dHNvdVNUUlpT?=
 =?utf-8?B?Z3VIZ0VmaDBwYnlMNnlhSTkyQnA0aS9GeTNYazJBRVN0bzBMNUM5ekZxODRl?=
 =?utf-8?B?cXEydGRheHZRMGkwdDRVY3FsdkFyWW5vaDlKRGkvK3VaNFNkck90dVZiVGlU?=
 =?utf-8?B?c3dqL2ZteW8rUm15MGFKdGdRSDB5ODI0bDZ1WGVGYUZJaWZqaklZMk5RZDJa?=
 =?utf-8?B?RTNDOFVUZFdCQ3pjZi9WUW1JQmk2N3B4UTRjNlkxbEREVU8wK3JCNW5HZmpy?=
 =?utf-8?B?aXBNaHZRdDNwUTNUc1E2T2V6bXRkVXNabXQ2MkhjcTNPQll5Sld1UVBoTUpD?=
 =?utf-8?B?ZDdzcFovUjZYVmN1UEpLUlpJSFJlQWZWUzJLajZOV0xQdDMzbDhiV0RQUU9D?=
 =?utf-8?B?dzZHV0M5cGVoUXpsZTBBZWl6aFIvS2JxdEU5R25mQXVtT0VPYlI3SHJnY0pJ?=
 =?utf-8?B?cWl6bGl3NHZ3cm5Zd3o0OC83U2QrWXdHUEpnKzJWS1haN1pWWG9Ka0Y1MWI4?=
 =?utf-8?B?WTgxOCtteTYwNEl5Y3N4M2dzUTJ6dVB4MGdTS3BYRkk1R1BGZnJHeld1MzJP?=
 =?utf-8?B?bWgzMkpsVFRJS2l5emJHQVMwM0l6R1ovMjNTaXZ4RVhLWGpJTEgvbkswdWZq?=
 =?utf-8?B?RFRtYnErbXRPYUYxc1ZFdVMraDcvQkc0SFJBM25jYlhFREJLNEN0UFJSQjNB?=
 =?utf-8?B?dUJiOFBFR3h3WUhBYW1FWmpKUk01UHVldXl3SGF6KzJLYnpsMDQzaFFibnVq?=
 =?utf-8?B?U0dmUDNvQWpPRlJnTnozTnZTQWQzSEFtR1E0SmxkRnlUWURBcFZWa0ZwVUZP?=
 =?utf-8?B?T2V3MEFBMndMa3dVNWRXT0Y5YU5GVG03UW9oSXRsRDZJZHo1bTZXSWFXaXdr?=
 =?utf-8?B?UFg2L3lON1g0Vitlb1pHUituWjR0WkpPVldsTndrVTJpcTFnK1VIam1jOCtu?=
 =?utf-8?B?dXZodlhTNTI4c2RwU3plNmJycjdtbVdCVWcyS25iMXZKT2VLc3Z3VEl2alRD?=
 =?utf-8?B?cFZkeHFsVE9LMjY1ajRSOU5WMFQveEJOaUI0Qlh1M3BJcUxjMWJoSDd6bXhB?=
 =?utf-8?B?c2tKdk5QMk5LWUh0aFBVU2FjVUFoSlYvTm9vaERWc0FXRkg5OFJPL1pHU2Vw?=
 =?utf-8?B?MU01RXZHbCtNK2h2Z0lRdTBXUldsWEg3VDVLTzNmMkdodjVjbkp1RnM4TXQ0?=
 =?utf-8?B?WVlPaS9FcThGQklsc0JiQm9hV3EyK3ZQS2Y3NjZwM2ZhZGYrSEZOZUVKSjF2?=
 =?utf-8?B?Y0pXM0IxU0ZVWDRpeVpjOGtDM1dDVmFRcTRlWXdzQmRySEdrdiswN1VTM292?=
 =?utf-8?B?K0R5dlVpVzB6eVZjYkx3eVYzaVdUeGJqUGFDY3Y2Nk1kdjk0RVFMSHVvcWxw?=
 =?utf-8?B?SFVDRVF5bHd1a0pjOW40bC80VmRFUHBGSVA5RHRtL2xGM1l3L3dFVm5Mamho?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d59eab77-5ffb-4dc0-8efb-08dcf52c12d4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:34:43.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qk7VsGcLrAxlGSmDZYq3MHBgUgpaQwxfdRFDuQP+kxuGMg/8piz9JRhFtRcOrerhqWyS9n16aFpbdbnJfAPIXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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

Quoting Patchwork (2024-10-22 16:39:41-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/xe3lpd: Load DMC
>URL   : https://patchwork.freedesktop.org/series/140320/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52=
_full -> xe-pw-140320v1_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-140320v1_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-140320v1_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1403=
20v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg=
-warn
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b6=
9b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-c-hdmi-a-6.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe=
-a-default-mode:
>    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmes=
g-warn
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b6=
9b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-upscaling@pipe-a-default-mode.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-lnl=
-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-default-mode.html
>

None of those are related to this, since the patch is specific for
Xe3_LPD.

--
Gustavo Sousa

> =20
>Known issues
>------------
>
>  Here are the changes found in xe-pw-140320v1_full that come from known i=
ssues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@intel_hwmon@hwmon-write:
>    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2231] / [Intel=
 XE#2890])
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b6=
9b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bmg=
-8/igt@intel_hwmon@hwmon-write.html
>
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x=
:
>    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3194])
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b6=
9b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-b-hdmi-a-1-x.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-adl=
p-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.=
html
>
>  * igt@kms_atomic@atomic-invalid-params:
>    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2423] / [i915=
#2575]) +15 other tests skip
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b6=
9b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_atomic@atomic-invalid-params=
.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_atomic@atomic-invalid-params.html
>
>  * igt@kms_atomic_transition@modeset-transition-nonblocking:
>    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1701]) +1 ot=
her test fail
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@kms_atomic_transition@modeset-tra=
nsition-nonblocking.html
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ln=
l-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>
>  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316])
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124])
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2231])
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>
>  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-adlp:         NOTRUN -> [FAIL][18] ([Intel XE#1231] / [Intel X=
E#1496])
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>    - shard-adlp:         NOTRUN -> [TIMEOUT][19] ([Intel XE#1033] / [Inte=
l XE#1727] / [Intel XE#402])
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>
>  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2 other =
tests skip
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>
>  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#1874])
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-1=
80.html
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>    - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#1204])
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.h=
tml
>
>  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124]) +4 other =
tests skip
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>
>  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367])
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>
>  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel X=
E#2894])
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191])
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>
>  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ln=
l-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#2191])
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2907])
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>
>  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +2 other =
tests skip
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
>
>  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +27 other =
tests skip
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.h=
tml
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1195])=
 +3 other tests incomplete
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs@pipe-b-dp-4.html
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195] =
/ [Intel XE#1727])
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs.html
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE=
#787]) +6 other tests skip
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-4.html
>
>  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#373]) +1 other t=
est skip
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ln=
l-3/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>
>  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373])
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>
>  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2423] / [i915#25=
75])
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
>
>  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#373]) +1 other t=
est skip
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
>
>  * igt@kms_content_protection@dp-mst-lic-type-1:
>    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2390])
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-7/igt@kms_content_protection@dp-mst-lic-type-1.html
>    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#307])
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
>
>  * igt@kms_content_protection@dp-mst-type-1:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#307]) +1 other t=
est skip
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-433/igt@kms_content_protection@dp-mst-type-1.html
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>    - shard-bmg:          [PASS][46] -> [DMESG-WARN][47] ([Intel XE#877])
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flip=
a-toggle.html
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions=
:
>    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2286])
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.=
html
>
>  * igt@kms_cursor_legacy@torture-bo:
>    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#3184])
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.ht=
ml
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-466/igt@kms_cursor_legacy@torture-bo.html
>
>  * igt@kms_feature_discovery@psr2:
>    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1135])
>   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-4/igt@kms_feature_discovery@psr2.html
>
>  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#310])
>   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#301]) +2 oth=
er tests fail
>   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible@bd-dp2-hdmi-a3.html
>   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.htm=
l
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#301]) +5 oth=
er tests fail
>   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@cd-hdmi-a6-dp4.html
>   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.h=
tml
>
>  * igt@kms_flip@blocking-wf_vblank@b-dp2:
>    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#2882]) +4 ot=
her tests fail
>   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2=
.html
>   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible:
>    - shard-dg2-set2:     [PASS][59] -> [INCOMPLETE][60] ([Intel XE#1195] =
/ [Intel XE#2049] / [Intel XE#2597])
>   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interr=
uptible.html
>   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
>    - shard-dg2-set2:     [PASS][61] -> [INCOMPLETE][62] ([Intel XE#1195] =
/ [Intel XE#2597])
>   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interr=
uptible@c-dp4.html
>   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
>
>  * igt@kms_flip@nonexisting-fb:
>    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#3007]) +14 o=
ther tests skip
>   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_flip@nonexisting-fb.html
>   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-8/igt@kms_flip@nonexisting-fb.html
>
>  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#886]) +2 oth=
er tests fail
>   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-i=
nterruptible@a-edp1.html
>   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ln=
l-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pi=
pe-a-valid-mode:
>    - shard-adlp:         [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#3194])=
 +1 other test dmesg-fail
>   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pi=
pe-a-valid-mode.html
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe=
-a-valid-mode:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +2 other t=
ests skip
>   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pip=
e-a-valid-mode.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
>    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#656])
>   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ln=
l-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +12 other =
tests skip
>   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.h=
tml
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2311]) +6 other =
tests skip
>   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
>    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#2890]) +2 ot=
her tests skip
>   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-pri-indfb-draw-render.html
>   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.ht=
ml
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#2333]) +2 other =
tests fail
>   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>
>  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>    - shard-adlp:         [PASS][76] -> [FAIL][77] ([Intel XE#1861])
>   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shr=
fb-scaledprimary.html
>   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651]) +1 other t=
est skip
>   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#656]) +2 other t=
ests skip
>   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.=
html
>    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2313]) +5 other =
tests skip
>   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.h=
tml
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc=
:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#653]) +10 other =
tests skip
>   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-w=
c.html
>
>  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
>    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#653])
>   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-9/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
>
>  * igt@kms_hdr@invalid-hdr:
>    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#1503])
>   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-1/igt@kms_hdr@invalid-hdr.html
>
>  * igt@kms_hdr@static-toggle-dpms:
>    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1503] / [Intel X=
E#599])
>   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ln=
l-7/igt@kms_hdr@static-toggle-dpms.html
>    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#455])
>   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-9/igt@kms_hdr@static-toggle-dpms.html
>
>  * igt@kms_joiner@invalid-modeset-ultra-joiner:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2927])
>   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2927])
>   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>
>  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>    - shard-adlp:         [PASS][89] -> [DMESG-WARN][90] ([Intel XE#3086])
>   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_plane_alpha_blend@coverage-v=
s-premult-vs-constant.html
>   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-ad=
lp-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][91] -> [FAIL][92] ([Intel XE#361])
>   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b=
69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_scaling@intel-max-src=
-size@pipe-a-hdmi-a-6.html
>   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>
>  * igt@kms_pm_dc@dc5-psr:
>    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2392])
>   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-7/igt@kms_pm_dc@dc5-psr.html
>
>  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2890]) +1 other =
test skip
>   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
>
>  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489]) +1 other =
test skip
>   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
>    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489])
>   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
>
>  * igt@kms_psr2_su@page_flip-nv12:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1122])
>   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-436/igt@kms_psr2_su@page_flip-nv12.html
>    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2387])
>   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-bm=
g-5/igt@kms_psr2_su@page_flip-nv12.html
>
>  * igt@kms_psr@pr-sprite-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel X=
E#929]) +5 other tests skip
>   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-dg=
2-435/igt@kms_psr@pr-sprite-blt.html
>
>  * igt@kms_psr@psr-cursor-blt:
>    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel =
XE#2850]) +2 other tests skip
>   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-7/igt@kms_psr@psr-cursor-blt.html
>
>  * igt@kms_psr@psr2-cursor-plane-onoff:
>    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2948]) +1 =
other test fail
>   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.=
html
>   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-8/igt@kms_psr@psr2-cursor-plane-onoff.html
>
>  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2414])
>   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2939])
>   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>
>  * igt@kms_rotation_crc@cursor-rotation-180:
>    - shard-adlp:         [PASS][105] -> [TIMEOUT][106] ([Intel XE#1033] /=
 [Intel XE#1727]) +5 other tests timeout
>   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@kms_rotation_crc@cursor-rotatio=
n-180.html
>   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-6/igt@kms_rotation_crc@cursor-rotation-180.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#899]) +1 o=
ther test fail
>   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_universal_plane@cursor-fb-le=
ak@pipe-a-edp-1.html
>   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>
>  * igt@kms_vrr@flip-basic-fastset:
>    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#2443]) +1 =
other test fail
>   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html
>   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-1/igt@kms_vrr@flip-basic-fastset.html
>
>  * igt@xe_copy_basic@mem-set-linear-0xfffe:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1126]) +1 other=
 test skip
>   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1126])
>   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>
>  * igt@xe_drm_fdinfo@utilization-others-full-load:
>    - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#2667])
>   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others=
-full-load.html
>   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html
>
>  * igt@xe_eudebug@basic-vm-bind-ufence:
>    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2905])
>   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
>
>  * igt@xe_eudebug@multigpu-basic-client-many:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2905]) +1 other=
 test skip
>   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@xe_eudebug@multigpu-basic-client-many.html
>
>  * igt@xe_evict@evict-beng-cm-threads-large:
>    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#261] / [Intel X=
E#688]) +1 other test skip
>   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-1/igt@xe_evict@evict-beng-cm-threads-large.html
>
>  * igt@xe_evict@evict-mixed-many-threads-large:
>    - shard-bmg:          NOTRUN -> [INCOMPLETE][118] ([Intel XE#1473])
>   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-4/igt@xe_evict@evict-mixed-many-threads-large.html
>
>  * igt@xe_evict@evict-threads-large:
>    - shard-bmg:          [PASS][119] -> [FAIL][120] ([Intel XE#1000])
>   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@xe_evict@evict-threads-large.htm=
l
>   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-5/igt@xe_evict@evict-threads-large.html
>
>  * igt@xe_exec_basic@many-bindexecqueue-rebind:
>    - shard-bmg:          [PASS][121] -> [SKIP][122] ([Intel XE#1130]) +21=
 other tests skip
>   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue=
-rebind.html
>   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_exec_basic@many-bindexecqueue-rebind.html
>
>  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1392])
>   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
>
>  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1392])
>   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-9/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>
>  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2322]) +1 other=
 test skip
>   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>
>  * igt@xe_exec_compute_mode@many-execqueues-basic:
>    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#1130]) +18=
 other tests skip
>   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@xe_exec_compute_mode@many-exec=
queues-basic.html
>   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_exec_compute_mode@many-execqueues-basic.html
>
>  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
>    - shard-lnl:          [PASS][128] -> [DMESG-WARN][129] ([Intel XE#2687=
])
>   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@xe_exec_compute_mode@twice-binde=
xecqueue-userptr-invalidate-race.html
>   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.h=
tml
>
>  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#288]) +6 other =
tests skip
>   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
>
>  * igt@xe_exec_fault_mode@twice-userptr:
>    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#288]) +1 other =
test skip
>   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-8/igt@xe_exec_fault_mode@twice-userptr.html
>
>  * igt@xe_oa@whitelisted-registers-userspace-config:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2541]) +2 other=
 tests skip
>   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
>
>  * igt@xe_pm@d3cold-multiple-execs:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2284] / [Intel =
XE#366])
>   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-435/igt@xe_pm@d3cold-multiple-execs.html
>
>  * igt@xe_pm@d3hot-mmap-system:
>    - shard-lnl:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#3184=
]) +2 other tests dmesg-warn
>   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@xe_pm@d3hot-mmap-system.html
>   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-4/igt@xe_pm@d3hot-mmap-system.html
>
>  * igt@xe_pm@s4-d3hot-basic-exec:
>    - shard-adlp:         [PASS][136] -> [ABORT][137] ([Intel XE#1358] / [=
Intel XE#1607])
>   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
>   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
>
>  * igt@xe_pm@s4-vm-bind-unbind-all:
>    - shard-lnl:          [PASS][138] -> [ABORT][139] ([Intel XE#1794])
>   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
>   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>
>  * igt@xe_pm@s4-vm-bind-userptr:
>    - shard-adlp:         [PASS][140] -> [ABORT][141] ([Intel XE#1794])
>   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
>   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>
>  * igt@xe_pm@vram-d3cold-threshold:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#579])
>   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@xe_pm@vram-d3cold-threshold.html
>
>  * igt@xe_pm_residency@toggle-gt-c6:
>    - shard-lnl:          [PASS][143] -> [FAIL][144] ([Intel XE#958])
>   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.htm=
l
>   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-5/igt@xe_pm_residency@toggle-gt-c6.html
>
>  * igt@xe_query@multigpu-query-mem-usage:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#944])
>   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-466/igt@xe_query@multigpu-query-mem-usage.html
>
>  * igt@xe_vm@large-split-misaligned-binds-4194304:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1130])
>   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_vm@large-split-misaligned-binds-4194304.html
>
> =20
>#### Possible fixes ####
>
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y=
:
>    - shard-adlp:         [DMESG-WARN][147] ([Intel XE#3194]) -> [PASS][14=
8]
>   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@kms_async_flips@async-flip-with=
-page-flip-events@pipe-b-hdmi-a-1-y.html
>   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-=
y.html
>
>  * igt@kms_atomic_transition@plane-all-modeset-transition:
>    - shard-adlp:         [INCOMPLETE][149] -> [PASS][150] +1 other test p=
ass
>   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@kms_atomic_transition@plane-all=
-modeset-transition.html
>   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-8/igt@kms_atomic_transition@plane-all-modeset-transition.html
>
>  * igt@kms_big_fb@linear-64bpp-rotate-180:
>    - shard-dg2-set2:     [DMESG-WARN][151] ([Intel XE#877]) -> [PASS][152=
]
>   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate=
-180.html
>   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html
>
>  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>    - shard-bmg:          [SKIP][153] ([Intel XE#2231] / [Intel XE#2890]) =
-> [PASS][154] +1 other test pass
>   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-=
180.html
>   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
>
>  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
:
>    - shard-adlp:         [DMESG-FAIL][155] -> [PASS][156]
>   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html
>   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-fli=
p.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - shard-adlp:         [FAIL][157] ([Intel XE#1204]) -> [PASS][158]
>   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html
>   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip=
:
>    - shard-adlp:         [FAIL][159] ([Intel XE#1231] / [Intel XE#1242]) =
-> [PASS][160]
>   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html
>   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-fli=
p.html
>
>  * igt@kms_color@deep-color:
>    - shard-lnl:          [DMESG-WARN][161] ([Intel XE#2929]) -> [PASS][16=
2]
>   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_color@deep-color.html
>   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-8/igt@kms_color@deep-color.html
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>    - shard-bmg:          [INCOMPLETE][163] -> [PASS][164]
>   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions.html
>   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>    - shard-bmg:          [FAIL][165] ([Intel XE#301]) -> [PASS][166] +5 o=
ther tests pass
>   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ac-dp2-hdmi-a3.html
>   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>
>  * igt@kms_flip@2x-plain-flip-fb-recreate:
>    - shard-dg2-set2:     [INCOMPLETE][167] ([Intel XE#1195]) -> [PASS][16=
8] +1 other test pass
>   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recr=
eate.html
>   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-466/igt@kms_flip@2x-plain-flip-fb-recreate.html
>
>  * igt@kms_flip@blocking-wf_vblank:
>    - shard-dg2-set2:     [FAIL][169] ([Intel XE#2882]) -> [PASS][170]
>   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.ht=
ml
>   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-435/igt@kms_flip@blocking-wf_vblank.html
>
>  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:
>    - shard-dg2-set2:     [FAIL][171] -> [PASS][172]
>   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@blocking-wf_vblank@a-=
hdmi-a6.html
>   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-435/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html
>
>  * igt@kms_flip@flip-vs-absolute-wf_vblank:
>    - shard-lnl:          [FAIL][173] ([Intel XE#886]) -> [PASS][174] +4 o=
ther tests pass
>   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank.html
>   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>
>  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>    - shard-dg2-set2:     [FAIL][175] ([Intel XE#301]) -> [PASS][176] +9 o=
ther tests pass
>   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@a-dp4.html
>   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>
>  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>    - shard-lnl:          [FAIL][177] ([Intel XE#301]) -> [PASS][178] +1 o=
ther test pass
>   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@b-edp1.html
>   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>
>  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>    - shard-dg2-set2:     [FAIL][179] ([Intel XE#1204]) -> [PASS][180]
>   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@c-hdmi-a6.html
>   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>    - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#3194]) -> [PASS][18=
2] +3 other tests pass
>   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-=
xtile-to-16bpp-xtile-downscaling.html
>   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.h=
tml
>
>  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear=
:
>    - shard-lnl:          [FAIL][183] ([Intel XE#1491]) -> [PASS][184] +2 =
other tests pass
>   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_flip_tiling@flip-change-tili=
ng@pipe-a-edp-1-4-rc-ccs-to-linear.html
>   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear=
.html
>
>  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>    - shard-adlp:         [FAIL][185] ([Intel XE#1874]) -> [PASS][186] +6 =
other tests pass
>   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_flip_tiling@flip-change-til=
ing@pipe-c-hdmi-a-1-y-to-x.html
>   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>
>  * igt@kms_force_connector_basic@force-edid:
>    - shard-adlp:         [DMESG-WARN][187] -> [PASS][188] +1 other test p=
ass
>   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@kms_force_connector_basic@force=
-edid.html
>   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-4/igt@kms_force_connector_basic@force-edid.html
>
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>    - shard-lnl:          [DMESG-WARN][189] -> [PASS][190] +2 other tests =
pass
>   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-onoff.html
>   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
>
>  * igt@kms_lease@lease-get:
>    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2423] / [i915#2575]) -> [=
PASS][192]
>   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_lease@lease-get.html
>   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-436/igt@kms_lease@lease-get.html
>
>  * igt@kms_plane@pixel-format-source-clamping:
>    - shard-bmg:          [DMESG-WARN][193] ([Intel XE#2566] / [Intel XE#8=
77]) -> [PASS][194]
>   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_plane@pixel-format-source-cl=
amping.html
>   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-1/igt@kms_plane@pixel-format-source-clamping.html
>
>  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
>    - shard-bmg:          [DMESG-WARN][195] ([Intel XE#877]) -> [PASS][196=
]
>   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_plane@pixel-format-source-cl=
amping@pipe-b-plane-3.html
>   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html
>
>  * igt@kms_plane_lowres@tiling-none:
>    - shard-bmg:          [SKIP][197] ([Intel XE#3007]) -> [PASS][198] +2 =
other tests pass
>   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_plane_lowres@tiling-none.htm=
l
>   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-7/igt@kms_plane_lowres@tiling-none.html
>
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>    - shard-dg2-set2:     [FAIL][199] ([Intel XE#361]) -> [PASS][200]
>   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html
>   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>
>  * igt@kms_rotation_crc@primary-rotation-180:
>    - shard-lnl:          [DMESG-WARN][201] ([Intel XE#2055]) -> [PASS][20=
2]
>   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-7/igt@kms_rotation_crc@primary-rotatio=
n-180.html
>   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-8/igt@kms_rotation_crc@primary-rotation-180.html
>
>  * igt@kms_vrr@cmrr@pipe-a-edp-1:
>    - shard-lnl:          [FAIL][203] -> [PASS][204] +1 other test pass
>   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>
>  * igt@kms_vrr@flip-basic:
>    - shard-lnl:          [FAIL][205] ([Intel XE#2443]) -> [PASS][206] +1 =
other test pass
>   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-4/igt@kms_vrr@flip-basic.html
>   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-1/igt@kms_vrr@flip-basic.html
>
>  * igt@xe_evict@evict-beng-mixed-many-threads-small:
>    - shard-bmg:          [INCOMPLETE][207] ([Intel XE#1473]) -> [PASS][20=
8]
>   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-t=
hreads-small.html
>   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>
>  * igt@xe_evict@evict-small-external-cm:
>    - shard-bmg:          [SKIP][209] ([Intel XE#1130]) -> [PASS][210] +1 =
other test pass
>   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@xe_evict@evict-small-external-cm=
.html
>   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-1/igt@xe_evict@evict-small-external-cm.html
>
>  * igt@xe_evict@evict-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][211] ([Intel XE#1473]) -> [PASS][212]
>   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@xe_evict@evict-threads-large.h=
tml
>   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-436/igt@xe_evict@evict-threads-large.html
>
>  * igt@xe_exec_reset@parallel-gt-reset:
>    - shard-bmg:          [ABORT][213] -> [PASS][214]
>   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.=
html
>   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-5/igt@xe_exec_reset@parallel-gt-reset.html
>
>  * igt@xe_gpgpu_fill@basic:
>    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1130]) -> [PASS][216] +1 =
other test pass
>   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@xe_gpgpu_fill@basic.html
>   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@xe_gpgpu_fill@basic.html
>
>  * igt@xe_module_load@many-reload:
>    - shard-bmg:          [FAIL][217] ([Intel XE#2136]) -> [PASS][218]
>   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@xe_module_load@many-reload.html
>   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_module_load@many-reload.html
>    - shard-dg2-set2:     [FAIL][219] ([Intel XE#2136]) -> [PASS][220]
>   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@xe_module_load@many-reload.htm=
l
>   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-434/igt@xe_module_load@many-reload.html
>
>  * igt@xe_oa@mmio-triggered-reports:
>    - shard-bmg:          [FAIL][221] ([Intel XE#2249]) -> [PASS][222]
>   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.htm=
l
>   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-4/igt@xe_oa@mmio-triggered-reports.html
>    - shard-lnl:          [FAIL][223] ([Intel XE#2249]) -> [PASS][224] +1 =
other test pass
>   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.htm=
l
>   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-1/igt@xe_oa@mmio-triggered-reports.html
>
>  * igt@xe_pm@s4-mocs:
>    - shard-adlp:         [ABORT][225] ([Intel XE#1794]) -> [PASS][226]
>   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@xe_pm@s4-mocs.html
>   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-3/igt@xe_pm@s4-mocs.html
>
>  * igt@xe_pm@s4-multiple-execs:
>    - shard-adlp:         [ABORT][227] ([Intel XE#1358] / [Intel XE#1607] =
/ [Intel XE#1794]) -> [PASS][228]
>   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-6/igt@xe_pm@s4-multiple-execs.html
>    - shard-lnl:          [ABORT][229] ([Intel XE#1358] / [Intel XE#1607] =
/ [Intel XE#1794]) -> [PASS][230]
>   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-l=
nl-3/igt@xe_pm@s4-multiple-execs.html
>
> =20
>#### Warnings ####
>
>  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>    - shard-adlp:         [FAIL][231] ([Intel XE#1231] / [Intel XE#1242]) =
-> [DMESG-FAIL][232] ([Intel XE#3194])
>   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-180-async-flip.html
>   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>
>  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>    - shard-bmg:          [SKIP][233] ([Intel XE#1124]) -> [SKIP][234] ([I=
ntel XE#2231])
>   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-=
180.html
>   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
>    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1124]) -> [SKIP][236] ([I=
ntel XE#2890])
>   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotat=
e-180.html
>   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
>
>  * igt@kms_big_fb@y-tiled-addfb:
>    - shard-bmg:          [SKIP][237] ([Intel XE#2328]) -> [SKIP][238] ([I=
ntel XE#2231])
>   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
>   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_big_fb@y-tiled-addfb.html
>    - shard-dg2-set2:     [SKIP][239] ([Intel XE#619]) -> [SKIP][240] ([In=
tel XE#2351] / [Intel XE#2890])
>   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
>   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_big_fb@y-tiled-addfb.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>    - shard-adlp:         [DMESG-FAIL][241] ([Intel XE#3194]) -> [FAIL][24=
2] ([Intel XE#1231] / [Intel XE#1242])
>   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html
>   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.=
html
>
>  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>    - shard-bmg:          [SKIP][243] ([Intel XE#3007]) -> [SKIP][244] ([I=
ntel XE#367])
>   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-=
1920x1080p.html
>   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2423] / [i915#2575]) -> [=
SKIP][246] ([Intel XE#367])
>   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_bw@linear-tiling-2-display=
s-1920x1080p.html
>   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>
>  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>    - shard-bmg:          [SKIP][247] ([Intel XE#367]) -> [SKIP][248] ([In=
tel XE#3007])
>   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html
>   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>    - shard-dg2-set2:     [SKIP][249] ([Intel XE#367]) -> [SKIP][250] ([In=
tel XE#2423] / [i915#2575])
>   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_bw@linear-tiling-4-display=
s-3840x2160p.html
>   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>
>  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
>    - shard-bmg:          [SKIP][251] ([Intel XE#2887]) -> [SKIP][252] ([I=
ntel XE#2231] / [Intel XE#2890])
>   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-yf-ti=
led-ccs.html
>   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
>    - shard-dg2-set2:     [SKIP][253] ([Intel XE#455] / [Intel XE#787]) ->=
 [SKIP][254] ([Intel XE#2351] / [Intel XE#2890])
>   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-=
tiled-ccs.html
>   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2890]) -> [SKIP][256] ([I=
ntel XE#455] / [Intel XE#787])
>   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs.html
>   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
>    - shard-bmg:          [SKIP][257] ([Intel XE#2231]) -> [SKIP][258] ([I=
ntel XE#2887])
>   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_ccs@random-ccs-data-y-tiled-=
ccs.html
>   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
>
>  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>    - shard-bmg:          [SKIP][259] ([Intel XE#2252]) -> [SKIP][260] ([I=
ntel XE#3007]) +1 other test skip
>   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html
>   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
>    - shard-dg2-set2:     [SKIP][261] ([Intel XE#373]) -> [SKIP][262] ([In=
tel XE#2423] / [i915#2575])
>   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-cha=
nge-during-hibernate.html
>   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
>
>  * igt@kms_content_protection@lic-type-1:
>    - shard-dg2-set2:     [SKIP][263] ([Intel XE#455]) -> [SKIP][264] ([In=
tel XE#2423] / [i915#2575])
>   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-1.html
>   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_content_protection@lic-type-1.html
>    - shard-bmg:          [SKIP][265] ([Intel XE#2341]) -> [SKIP][266] ([I=
ntel XE#3007])
>   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@kms_content_protection@lic-type-=
1.html
>   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_content_protection@lic-type-1.html
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size=
:
>    - shard-bmg:          [DMESG-WARN][267] ([Intel XE#2791]) -> [DMESG-WA=
RN][268] ([Intel XE#2791] / [Intel XE#877])
>   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic-transitions-varying-size.html
>   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size=
.html
>
>  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>    - shard-dg2-set2:     [SKIP][269] ([Intel XE#455]) -> [SKIP][270] ([In=
tel XE#2890])
>   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_dsc@dsc-with-output-format=
s-with-bpc.html
>   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    - shard-bmg:          [SKIP][271] ([Intel XE#2244]) -> [SKIP][272] ([I=
ntel XE#2231] / [Intel XE#2890])
>   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html
>   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>
>  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>    - shard-adlp:         [SKIP][273] ([Intel XE#310]) -> [TIMEOUT][274] (=
[Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
>   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_flip@2x-flip-vs-absolute-wf=
_vblank-interruptible.html
>   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>
>  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>    - shard-bmg:          [SKIP][275] ([Intel XE#2311]) -> [SKIP][276] ([I=
ntel XE#2231]) +1 other test skip
>   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html
>   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
>    - shard-dg2-set2:     [SKIP][277] ([Intel XE#651]) -> [SKIP][278] ([In=
tel XE#2890]) +2 other tests skip
>   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-=
rgb565-draw-render.html
>   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
>
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
>    - shard-bmg:          [FAIL][279] ([Intel XE#2333]) -> [SKIP][280] ([I=
ntel XE#2231])
>   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-render.html
>   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.htm=
l
>
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>    - shard-adlp:         [FAIL][281] ([Intel XE#1861]) -> [TIMEOUT][282] =
([Intel XE#1033] / [Intel XE#1727])
>   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-pri-shrfb-draw-blt.html
>   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
>    - shard-bmg:          [SKIP][283] ([Intel XE#2311]) -> [SKIP][284] ([I=
ntel XE#2231] / [Intel XE#2890])
>   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-indfb-draw-blt.html
>   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.ht=
ml
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
>    - shard-bmg:          [SKIP][285] ([Intel XE#2231] / [Intel XE#2890]) =
-> [SKIP][286] ([Intel XE#2313])
>   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscren-pri-indfb-draw-blt.html
>   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.htm=
l
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>    - shard-dg2-set2:     [SKIP][287] ([Intel XE#653]) -> [SKIP][288] ([In=
tel XE#2890]) +1 other test skip
>   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-pri-shrfb-draw-blt.html
>   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.h=
tml
>
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>    - shard-bmg:          [SKIP][289] ([Intel XE#2313]) -> [SKIP][290] ([I=
ntel XE#2231]) +1 other test skip
>   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-indfb-plflip-blt.html
>   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>    - shard-bmg:          [SKIP][291] ([Intel XE#2231]) -> [SKIP][292] ([I=
ntel XE#2313])
>   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html
>   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2890]) -> [SKIP][294] ([I=
ntel XE#653]) +1 other test skip
>   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-indfb-plflip-blt.html
>   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>    - shard-dg2-set2:     [SKIP][295] ([Intel XE#653]) -> [SKIP][296] ([In=
tel XE#2351] / [Intel XE#2890])
>   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-msflip-blt.html
>   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>    - shard-bmg:          [SKIP][297] ([Intel XE#2313]) -> [SKIP][298] ([I=
ntel XE#2231] / [Intel XE#2890]) +1 other test skip
>   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-render.html
>   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>
>  * igt@kms_getfb@getfb2-accept-ccs:
>    - shard-bmg:          [SKIP][299] ([Intel XE#2340]) -> [SKIP][300] ([I=
ntel XE#3007])
>   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.html
>   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_getfb@getfb2-accept-ccs.html
>
>  * igt@kms_joiner@invalid-modeset-big-joiner:
>    - shard-bmg:          [SKIP][301] ([Intel XE#346]) -> [SKIP][302] ([In=
tel XE#2231])
>   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-j=
oiner.html
>   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
>    - shard-dg2-set2:     [SKIP][303] ([Intel XE#346]) -> [SKIP][304] ([In=
tel XE#2890])
>   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_joiner@invalid-modeset-big=
-joiner.html
>   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
>
>  * igt@kms_joiner@invalid-modeset-ultra-joiner:
>    - shard-adlp:         [SKIP][305] ([Intel XE#2927]) -> [TIMEOUT][306] =
([Intel XE#1033] / [Intel XE#1727])
>   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_joiner@invalid-modeset-ultr=
a-joiner.html
>   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-a=
dlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>
>  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>    - shard-bmg:          [SKIP][307] ([Intel XE#1489]) -> [SKIP][308] ([I=
ntel XE#2231]) +1 other test skip
>   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-continuous-sf.html
>   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
>    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1489]) -> [SKIP][310] ([I=
ntel XE#2890])
>   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane=
-update-continuous-sf.html
>   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
>
>  * igt@kms_psr@fbc-pr-primary-render:
>    - shard-bmg:          [SKIP][311] ([Intel XE#2234] / [Intel XE#2850]) =
-> [SKIP][312] ([Intel XE#2231])
>   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_psr@fbc-pr-primary-render.ht=
ml
>   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_psr@fbc-pr-primary-render.html
>    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2850] / [Intel XE#929]) -=
> [SKIP][314] ([Intel XE#2351] / [Intel XE#2890])
>   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_psr@fbc-pr-primary-render.=
html
>   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_psr@fbc-pr-primary-render.html
>
>  * igt@kms_psr@fbc-psr-sprite-plane-move:
>    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2351] / [Intel XE#2890]) =
-> [SKIP][316] ([Intel XE#2850] / [Intel XE#929])
>   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-m=
ove.html
>   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html
>    - shard-bmg:          [SKIP][317] ([Intel XE#2231] / [Intel XE#2890]) =
-> [SKIP][318] ([Intel XE#2234] / [Intel XE#2850])
>   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-plane-mov=
e.html
>   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-1/igt@kms_psr@fbc-psr-sprite-plane-move.html
>
>  * igt@kms_psr@pr-no-drrs:
>    - shard-bmg:          [SKIP][319] ([Intel XE#2234] / [Intel XE#2850]) =
-> [SKIP][320] ([Intel XE#2231] / [Intel XE#2890])
>   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_psr@pr-no-drrs.html
>   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@kms_psr@pr-no-drrs.html
>    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2850] / [Intel XE#929]) -=
> [SKIP][322] ([Intel XE#2890])
>   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_psr@pr-no-drrs.html
>   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@kms_psr@pr-no-drrs.html
>
>  * igt@kms_scaling_modes@scaling-mode-full-aspect:
>    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [=
SKIP][324] ([Intel XE#455])
>   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_scaling_modes@scaling-mode=
-full-aspect.html
>   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    - shard-bmg:          [SKIP][325] ([Intel XE#3007]) -> [SKIP][326] ([I=
ntel XE#2413])
>   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html
>   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>
>  * igt@kms_tiled_display@basic-test-pattern:
>    - shard-dg2-set2:     [SKIP][327] ([Intel XE#362]) -> [FAIL][328] ([In=
tel XE#1729])
>   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_tiled_display@basic-test-p=
attern.html
>   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-433/igt@kms_tiled_display@basic-test-pattern.html
>
>  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>    - shard-bmg:          [SKIP][329] ([Intel XE#2426]) -> [SKIP][330] ([I=
ntel XE#2509])
>   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html
>   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>
>  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
>    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2905]) -> [SKIP][332] ([I=
ntel XE#1130])
>   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@xe_eudebug_online@writes-cachi=
ng-vram-bb-sram-target-sram.html
>   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
>    - shard-bmg:          [SKIP][333] ([Intel XE#2905]) -> [SKIP][334] ([I=
ntel XE#1130])
>   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@xe_eudebug_online@writes-caching=
-vram-bb-sram-target-sram.html
>   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
>
>  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>    - shard-bmg:          [SKIP][335] ([Intel XE#2322]) -> [SKIP][336] ([I=
ntel XE#1130])
>   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-rebind.html
>   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
>
>  * igt@xe_exec_fault_mode@many-userptr-imm:
>    - shard-dg2-set2:     [SKIP][337] ([Intel XE#288]) -> [SKIP][338] ([In=
tel XE#1130]) +3 other tests skip
>   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@xe_exec_fault_mode@many-userpt=
r-imm.html
>   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_exec_fault_mode@many-userptr-imm.html
>
>  * igt@xe_exec_reset@parallel-gt-reset:
>    - shard-dg2-set2:     [ABORT][339] -> [TIMEOUT][340] ([Intel XE#2105])
>   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@xe_exec_reset@parallel-gt-rese=
t.html
>   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-435/igt@xe_exec_reset@parallel-gt-reset.html
>
>  * igt@xe_pat@pat-index-xelp:
>    - shard-bmg:          [SKIP][341] ([Intel XE#2237] / [Intel XE#2245]) =
-> [SKIP][342] ([Intel XE#1130])
>   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
>   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_pat@pat-index-xelp.html
>
>  * igt@xe_pm@d3cold-mocs:
>    - shard-bmg:          [SKIP][343] ([Intel XE#2284]) -> [SKIP][344] ([I=
ntel XE#1130])
>   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@xe_pm@d3cold-mocs.html
>   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_pm@d3cold-mocs.html
>    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2284]) -> [SKIP][346] ([I=
ntel XE#1130])
>   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
>   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_pm@d3cold-mocs.html
>
>  * igt@xe_query@multigpu-query-uc-fw-version-guc:
>    - shard-dg2-set2:     [SKIP][347] ([Intel XE#944]) -> [SKIP][348] ([In=
tel XE#1130])
>   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-=
version-guc.html
>   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-d=
g2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    - shard-bmg:          [SKIP][349] ([Intel XE#944]) -> [SKIP][350] ([In=
tel XE#1130])
>   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3=
b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html
>   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140320v1/shard-b=
mg-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>
> =20
>  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/100=
0
>  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/103=
3
>  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
2
>  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
4
>  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
6
>  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0
>  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
5
>  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
5
>  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
4
>  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/123=
1
>  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/124=
2
>  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/135=
8
>  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2
>  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/147=
3
>  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/148=
9
>  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
1
>  [Intel XE#1496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
6
>  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3
>  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/151=
2
>  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/160=
7
>  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/170=
1
>  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7
>  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
9
>  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/179=
4
>  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/186=
1
>  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/187=
4
>  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9
>  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/205=
5
>  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/210=
5
>  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6
>  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/219=
1
>  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
1
>  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
4
>  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
7
>  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4
>  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5
>  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
9
>  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/225=
2
>  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4
>  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
6
>  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
1
>  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
3
>  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
4
>  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
2
>  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
7
>  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8
>  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/233=
3
>  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/234=
0
>  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/234=
1
>  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
1
>  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/238=
7
>  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/239=
0
>  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/239=
2
>  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/241=
3
>  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/241=
4
>  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3
>  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
6
>  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/244=
3
>  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/250=
9
>  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/254=
1
>  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/256=
6
>  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/259=
7
>  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/266=
7
>  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/268=
7
>  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/279=
1
>  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
2
>  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7
>  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/289=
0
>  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/289=
4
>  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5
>  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
7
>  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/292=
7
>  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/292=
9
>  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/293=
9
>  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294=
8
>  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/300=
7
>  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
6
>  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/318=
4
>  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/319=
4
>  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/257=
5
>
>
>Build changes
>-------------
>
>  * IGT: IGT_8081 -> IGT_8082
>  * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-pw-14032=
0v1
>
>  IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbf=
dc18bb89441fc99a52
>  xe-pw-140320v1: 140320v1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1403=
20v1/index.html
