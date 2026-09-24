Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F3C9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 14:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604EA10F5E2;
	Thu, 24 Sep 2026 14:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM+9IKcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BDB10F5E2
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790259052; x=1821795052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5ClZ7VbKpmjHT2zO+bbYhOUU10jMv060PmWHKzBsZ0E=;
 b=aM+9IKcXKjFgERnxR34Y+7pEn+v1gzO6Q7J7TCrDr1WfHrmT5SwGtIcU
 aI5YPwaU7nUxk4nHwK1ClCokQLnVz2GjkC1i7UuztViFsI4wLf7KTorA8
 db1xQ+XasoKydANgGmwhEsoqoD8MgVkohYq6UDs32rnJiIOIQKkq7bWNb
 Ewb0ez0h0TwGu/8+87F3ZQY3x1dGppLnNPBZzYbWYSzc+qYwcDzC/zqNk
 Gh9Vmsi94nhTa/57p/qOF+XouOE/bPmrT8nmykNLYAji78wW0fouZDL3c
 Us+9vfHUGh8Fre651WQocdEZc5Z0/fg+gnG4dAHv8D7WXQqTOgKXDxP3r w==;
X-CSE-ConnectionGUID: cy6UT7VAT9S20UmXBpM5/w==
X-CSE-MsgGUID: QH7KdY4RRgmbvng1FgHtCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93749045"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="93749045"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 07:10:52 -0700
X-CSE-ConnectionGUID: 882TwYw2QGu7uxOIMrj+jw==
X-CSE-MsgGUID: EtY4uk1RTfy0vsycusiChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="274148376"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 07:10:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 07:10:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 07:10:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 07:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjRY1eUJ8utgy24YMseurIyq0huKfGmwsxpbxwU1PnIaPKSDcbJlpfJaaNiQg/jZfx+9Zgm2SBskrGfuHRumNlGi3BGGKJJ6fUqjlFd2HAWyRL6spQ1WYYzojy2Dl22L2tOPkS9To7Eb/3BeRWsg/LWrUZap4dykk2Fo+OgHf8Z5MSP8TbeIr+DywBUiqLLJCM7Dzsk3jzgD5X4p6z6V3DrlWe+u2Xg5utQu/PsZ6h4FzFFQVRyQ+ocVVBbP1l7y9izekFCZRuHfgKO2SPRDQ1ktYWxSiW3+1HtVehPDifcE+PTomK8Z98mScil0IU4wrpSNXK8EpyuaboMmN4A2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8AnhcmzHoDBHRwhtdeXmrJZBV9pZpKh+k8vY7XR4Xs=;
 b=F9I1JznHsth9Hn1S/63tbuWFQSwxwa50G403oJ4CL6zi4tyNYY4h99r/btgVvT+NbT7PoBt5K6Y9e4mqimOHHC8RePPDYEBQAdrgFHqwmbXJu6tV/DfRIBxswqBChx1cx939UskbqdIPdXed+yFExaW1xSTEbXQxHxYbCLxMCK8ytDyyvdx5GyuUmdVhRF4qPc9na6fxRubiVNudVZRVaHMae9BzyyDaLO1MtXK+btzErJJzLaon0gb+RU6+2DMJaLkMfcyby2x07hCaq/36vTmxXR9nVnFLi83x8b2j2A3+h3UZlh3dbXNxGxuQDwR7zhj9PYq3gcihFCRtZdoIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:10:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:10:40 +0000
Date: Thu, 24 Sep 2026 07:10:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v9 06/10] drm/xe/sysctrl: Fix mailbox header handling
Message-ID: <arUvXSSmW0UDViAu@soc-5CG1426VCC.clients.intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
 <20260924060900.146167-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260924060900.146167-18-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MW4PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:303:b7::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a65519-de28-4eac-fcbc-08df1a459d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4Lgg3OSpbEuHoPN0n/lh31lnS9YlEak70gYaiUBKaHxa8mEt6p/wm8QoeNWU3jQBDaFI+rl4/0cXwO+F5djjmGUr0VDBKjVbSA5PSFWf4YKW+vridlmynpTBXVdPIyM0TvQhrBBh1qGVtFP9jIXkufRjQFxl00MKxWHnZPQmRxECYVaOGWy+ZxgTX2mgLrs2xh3MmhTuljc7ylTVNt89uUHsLiGZLCvFJHi0kcb0Ag/USQVJ+6Kys8D1Fg9bDRCAst/3iUqcvY3u4X4xGY+qNoo4gVuaz0bdv90MkrHOgC8XTrLr+4AEDKf+OLBYVSnwJ7dxmUyO/mousYvZKIsywB5HIjeG7sWes49shaySqwESC4FQhHikvHtbR2C9HiKREc2ZxB4m3QlgPTrYf0e0O+tzXqotb/10ZbTTzRZ3itKcUt3C8EMKVxaCoRtPj8yko1qCUoyDGA+0SOQwAhcNWp6+L8K+dHanJoTeo4VudyJppJJVLaqla20ZqGEdRA1cimEEhGIRo9clN5YEnm6R3TB8WxYNMIUL44bC5Z5dQe5jBkaVsojt6mvBpIu6sVGqZ0PAjQ8v48o53uIYhLGamuNqxIkvy7AebtSMpUVjYHZbWf/qZjLWGDzjESGhgbJ7SygqwPOFKjZ9InNtm5SPHMUzlVgixqe2j518BRhMydo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG9lN09Wd1VHTFdtVU1kT3oxS3ZyL0VXS2phbjdLTXplZERQK0N5VllkdTJI?=
 =?utf-8?B?T0hBZmxGZm43c256ZnZMbUI3dzl5SkdBWU9vaTRNbE9tZHNpL0grcUNic0Rw?=
 =?utf-8?B?QU94ZmZBdnVqRitqQUJjOGxoRkZmeVovdzBCcEVtYnNkcWxwc3U0ckd6N2kr?=
 =?utf-8?B?OVVqTVhQUFp3SnQrcEFyR01TUXhCekYybjQwOWhJdi9mT1pSSW14Y2RuMUJn?=
 =?utf-8?B?MHRNVVNIbGpIOUpHd3R0SXQzRmQ5SGMyeE5ld21pV2hnZXJSa1RJd3lPWGZs?=
 =?utf-8?B?R25NUDRMTkxSbXZFbFBueTk0djZZYWhwY0d2NG9Zd1luSFVVQTlIVmphWUo5?=
 =?utf-8?B?RVpZNS8rVzJ0ZHJzTm1sZkZqTWlJUkJnd1d1STIySkxsa05IWGFmRjNyaEQx?=
 =?utf-8?B?QUZNa1VoSTFuRlhXUjFkcUc2cU13TWVKV29QSG5SMUtTemcrZmZpcUVRUkpS?=
 =?utf-8?B?eHN3Qk0zWjk2UlZ5QkNkdzJRMnlPVGVLcFNoemljYzdlMVNEb3lrK2p5M0FM?=
 =?utf-8?B?OUZuLzBaRmIzNkg4MTJKbGdKZ1FkSTV4QW5wOE5oSmFRWWNVMmlzN1R2Ti9q?=
 =?utf-8?B?Ky9ZZzE2dWJ0Rlc3UHRBUk03ZjFIRGdBOGJLZFFsSURscm9LVlBXYjg5TUh0?=
 =?utf-8?B?NkxZVlJCb1ZTL3VUOUFBaGtLb09sQ0xBNUJLVVRNanF3eFFPWjRvSllyVmFF?=
 =?utf-8?B?bUVWbDAydlhobHdoNlErK0RSamovZi90eXBIbkZQL3lSU3NLVHR2RnR3a0t0?=
 =?utf-8?B?WmFXVWZNTGVjTXpGS2E3SElUVXdSbFlHZXlkNWdJN1RPZmNnb3J1ZlFvL0Z5?=
 =?utf-8?B?VWh2NDloSEh1Z2ZXUE40dzJPKzh2bGdhbTNCOTJpZERWelR5NGlyMW5VeUdF?=
 =?utf-8?B?bHJaT3lIOUVXWDJhSGQvOUdWZXJ0eEdYNnpkaFZrdGlTelJ4VTA5b0NJU3dN?=
 =?utf-8?B?RFlQaE4zbmdrTGR2K2syNkdUUXgySUVYVjkxbG9VSm1oQUNBaTNWYzRDVGMy?=
 =?utf-8?B?am52RS9RakRBMHpjd3ZxbUJQUXRKa3FBK2lMV0ozLzg4K0JJa1ZoNVlEYTdB?=
 =?utf-8?B?UXJ3clFEN0Vod0JQSjFPMjdVYktoQyttcDRBUm5tN3QyRm1EbEJ6QVRLYmNq?=
 =?utf-8?B?N2Z5RXZGek1uNW1hcXYrMlVQaElMdXhUMGNJa1ZFak41MHd6WXUzV1FQQ1ZK?=
 =?utf-8?B?Y3AxbE5xMThYMC9nU3kzK2FodTdVa0xzbFBUNnM1MXMvR2JtTTdRRm0xczdl?=
 =?utf-8?B?Y3RMYmxvK1FvNWkzWVBSNjBtVVBDRFpReEVIN1Y5WWpwbWgyNzBPN091UkNl?=
 =?utf-8?B?UExFUUwvc0JldUEwZk5aKytlUVBOVlh3T2xua29LVjkySmVzdHFoaWlNUUNG?=
 =?utf-8?B?bmwydWR5SEhVbFJkS1QrTHN3M1F4UlZBYlBaRmtrUlVnOEpGUzlrOXQ5L2dT?=
 =?utf-8?B?TkpzaXhvbmhOM1VxL2xzS0s1dHZtMmxXbTN2WnIvVnRsV2thR21TVC9pbytF?=
 =?utf-8?B?MGJJZHF6U1h4VUNUZGRyZ0o3NnRsajkzWGg1UCtibXpyUURHNktvaDRiWno1?=
 =?utf-8?B?WEhQZWR6alJqdDNwVkdLTnFrcXNXNkhhdTUzMzZ1bjM1bCtuSDYzK0dxV1Vt?=
 =?utf-8?B?Nm9IUi90QkNtbkhCc0YrYTBYRHExVllLd3VHS21uT21BRVozTEZnZE9ONDVN?=
 =?utf-8?B?NEpiaVlEOTltbExYd1hNdDVuOEJnbmljRlpIZnplclhMaGlYU1BPVmw1R0Vv?=
 =?utf-8?B?VUF1Ukx6cEp5M2pFV3VQWkNxYnZrSzV0eFlvMndpNXE3OS9rUHpqd2UzSUFj?=
 =?utf-8?B?RGdjRHlyK1F0bHc3VEg1ZWJoUHFtWDk4ZEw1d3pNN1VUMFErbFRINndMS0Vm?=
 =?utf-8?B?Wk5NYVJtUUpuS3huSlpYNVgvV24xVDZBWnhnU29ocForOHpvdmZib0ZncU1R?=
 =?utf-8?B?T2RLRnI0TjZIR3pPTHEyRmpuZDY4L0lHQ2psS2cyMnRaWjllMEd0SVRSWEtR?=
 =?utf-8?B?WjRIY0ZLNFFWaE9qTlk5Nm5Eajg3YlBqT0QzYUFEY2d2UDRBNUVFS3ZnTVVu?=
 =?utf-8?B?amEvSWlPRGYrV3k1ZnhBZjJreElIazZ2WktyKzNFR1Y4UjV0RUp2akdSUWVX?=
 =?utf-8?B?RERqejFqOWc4VlVYbGMxNVhGclRFdTBxMERteHl5YUpvQVduT3VxeFFTRjhN?=
 =?utf-8?B?Um44aE4zd3AvSVM1VSs3cm9PVDBGYVNTaUpOZnNmTENYaFJpN2RjYm9lN3pX?=
 =?utf-8?B?bFRmSDFqV2hETTBHMjBIbXZ6SHIveWY2eXNvaU5SdnlsemxPelJmNG8yU3A2?=
 =?utf-8?B?c0Vacnkrc3ZldGRxRjNHWTVmNTEwRVdUNU9yTithc1VHblNrOWsvbFNIN0NG?=
 =?utf-8?Q?KsKg7hTrELGiDsh0=3D?=
X-Exchange-RoutingPolicyChecked: zdhgmoY9eXJM1bbF/Vpj1WeUyOUIEZOiXXm7jdLtzfdNU0DJFolMx7P5upE981zdovx3CnAdbRptdQEA1O017ewRBqe9nCANcklMIasguGFGe0zTgGvu6bvU1R1ya/RYsE239UtBtzpjbrlPyxGIT8QVWrqa2JAj07EpIc/sF3FPLvay/XAAbz+RGzdjB8K5veDB8fw5nR3jgo98PpYG23QSZyPXK36T7rmYKP2jzNqVQcrS+hn7TY3s6HkQ7wp+RjgeS1DXMqw3zY4a63iAdta+NndBtHluWX9iWv0pJVsSnsi9/dqMiXxYgQss8N5wEw3xpnbRhpf7ddkkH/Mt5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a65519-de28-4eac-fcbc-08df1a459d37
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:10:40.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIocY8J6VwDZxez6t7GaSGEujUNKav4eEe5hlY+wBKPqAijhkjU4XhMM352kzdgLMoUoZ96XNS0xAiCYPyHTvN2Zib3otps1hKPxu1ncHh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

On Thu, Sep 24, 2026 at 11:39:07AM +0530, Mallesh Koujalagi wrote:
>The mailbox header was defined as __le32, which required
>cpu_to_le32() and le32_to_cpu() conversions whenever it was
>write or read.
>
>These conversions are unnecessary because the header is always
>handled as a 32-bit value, not as raw bytes. It is written with
>xe_mmio_write32() and read with xe_mmio_read32(), which already
>handle any required byte-order conversion through the underlying
>writel()/readl() accessors.
>
>As a result, the header value is already in CPU byte order when
>used by the driver. Keeping the extra conversions had no effect
>on little-endian systems and could cause an incorrect on

s/incorrect/incorrect behavior/

with that,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>big-endian systems.
>
>So use u32 for the mailbox header and remove the unnecessary
>endianness conversions.
>
>Fixes: 1f95f618182b ("drm/xe/xe_sysctrl: Add System Controller mailbox communication support")
>Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v9:
>- Update commit message. (Michal)
>- Use fix tag. (Umesh)
>- drop __packed.
>- s/simplify/Fix/
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index 2fb317175922..2e4247914bf9 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -20,20 +20,20 @@
> #include "xe_sysctrl_mailbox_types.h"
>
> struct xe_sysctrl_mailbox_msg_hdr {
>-	__le32 data;
>-} __packed;
>+	u32 data;
>+};
>
> #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
>
> #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
>
> #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
>
> #define XE_SYSCTRL_HDR_RESULT(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>
> static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> 				  unsigned int timeout_ms)
>@@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
> 		return -ENOMEM;
>
> 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>-	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>-				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>+	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>+		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>
> 	if (data_in && data_in_len)
> 		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
>-- 
>2.48.1
>
