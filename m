Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CDBC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E187110E57F;
	Tue,  9 Jul 2024 14:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRJjfbmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121E10E57F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720536750; x=1752072750;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SeSZavQwtAM9A6GzmdZTn5+ZKhd5eLKjHxq6xrQZsm8=;
 b=LRJjfbmR7935Um4M4Qcgq79nmVOvxjpLJfjJ5IL699laHefYjRo0EiZJ
 SUNu4e5VlrcgkLW/b3z1Bsc/r+JDJDtsy45XQ+CBcwBYBEujbDFnOUdHc
 B3OVlKHfEgRZg9kIpey2VNYHF2SJLmRZKIcWmVAdke3jfksVT+wir3jdu
 QdwQ3Pm4A69NHW6rphMjtmLZGkD5uO/FkWaBChLmP+bYmcEpBMLcn1JDp
 v+oTSTdVst2AgmC7n75KCIV5EOSTEnjAhp9vOS9OVD7Xcupq7XjBLqenR
 75N23CGNb03lgZi0YXaNKDGK/FeLdznyKx490zh21g+c+a3iZHsf+1s4a Q==;
X-CSE-ConnectionGUID: 507csggLRYm7+E+EDAHziw==
X-CSE-MsgGUID: 28nUedTwT7Og8tek7o9YAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18003558"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="18003558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:52:30 -0700
X-CSE-ConnectionGUID: sgLlTEVzSoyClWWZZIqTEw==
X-CSE-MsgGUID: AILjedXpRdm8C/xg1b7WQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52817931"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:52:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:52:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:52:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:52:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:52:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0E7GXA+wxJTitKuOv/IAZD1wae1jTwmiUIMIjHkWoDmUSBvVl0yXlR6M4lwbVv+rx5RTKntvCbsl/N2FQsKznkHWkjo2QAHCMnBrg9MkoAAgnnGEBAU0OihxvUtuKTEJCHF36uRDnICf0hC5ayT2wg1EmusSN75hBEGtjf+v1wUffqDF1OvUcYf0BMYUpTplV4BeFYYl112BIQ+Y/JryoFS0nmaK8mX7CFkFJgcZuZNQEaQ8YUtwevkEo80DVNZRhhQDzG660ICDp88GkIfWRxFeMm6DQ/VZ3AF+mryZUa1khuXBuG+RPSbyI9V+KVTd1OY6zRMd5wbdU7E5v8/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIxWSXEEYZCdtvO8GZuzmGSC6sHOE/h1F5epxpcR8T4=;
 b=UHXxA08YkaqpzuFqI9jruDJI7gZFlcgnjKsCaweaMKvI30+fXzSabTn4wi0J36DHprazjIC5oZkZiY8RKzhLX4qLK6AU7bbZSCX9+iAOD0Djel3e4yxUhkjUglaC2cxdvI2WLBO16ayXrQF6CT6UvysFq7eTLEIeNhMu/1xIhZbnoBejYYaDfdXeyh8bkgzYHRtl7m1MWWaNC+Pt484vXeoC06XGv1Y8OdhwgUad1XU3ghYEMZCS4I+8phaZUPXOORlcPdzjBEYBrVGeSNKtdBHgvnMI05DN/bNtIUDHYA6pl36mN5PQq9MEkaa8JIuLbHkSeIk+IwObgLI4vXnrOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7380.namprd11.prod.outlook.com (2603:10b6:208:430::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 14:52:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:52:22 +0000
Date: Tue, 9 Jul 2024 09:52:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <janga.rahul.kumar@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code layout
Message-ID: <e4nrt3j4tq7tuoz3umqcyodyahdgevcf3rggysn72f7kcapdqs@ds7vo4t5gb2b>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <20240708111210.1154-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708111210.1154-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:907:1::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6e772e-30f2-4773-a28f-08dca026bd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SUuxTawYodQBzc5oH9NnO0jlo9UbiJPznXP4audwE10+rw4FsBhXYavUjQ?=
 =?iso-8859-1?Q?k65pHJ4mihzN445IlI3LiJaTYqNUHE79NyZzxPBy3LdpchMWW3UQKBHcU0?=
 =?iso-8859-1?Q?cAM3VRbCAnJXtI39ZaKIdiwAqWiq22bjeQl8GhLb+ex/Rm1ETuiXqKqzwG?=
 =?iso-8859-1?Q?gi9DdtlCAvwDVqiFJj51uwm7bf5+uDzAxiR83DhTctdHCR9pQo4C1gLcQW?=
 =?iso-8859-1?Q?rrwsIWqiIvJq+xD32AGiPcO752Uddje7KiQa57WHEEmuGBLfxQATh/IauK?=
 =?iso-8859-1?Q?x/Q7wuVSopURIauLTMfxhuT7uBaFk6kvnMNB08XKR5e7FX/l1IXm055l1c?=
 =?iso-8859-1?Q?Zhya3SNL52nt6zMvEB2U9nkj9SwZkfOVd7T9qu7wfMcSx/NZg15kMG5j6+?=
 =?iso-8859-1?Q?q2Lbkjs4H4Msbt3VRJDeJNUsM/eHLjxOXhr6lNrpeYCHgGcbqsyr3wFlVd?=
 =?iso-8859-1?Q?MJwzWepfGqzGuqtGqwR2SNnhtoezWZbtwDta8Mnm3j7To7hRPe0+W/VJcg?=
 =?iso-8859-1?Q?3OmEIlqCTLYMv0T63F1CXx9XaQ8kAK0lwPPx3Er4eI8+4RpxwvtYSK7qcO?=
 =?iso-8859-1?Q?qqRRuDuiUtxtgKiaS81oahRtsSyZAdIBs5LSCbyTgc+zzLAthVYWNG3DRX?=
 =?iso-8859-1?Q?HVGJ7HkpRI8R8eI0kfQi1cmWjOKH1sOLWPPmnwqMHJO36X6PToVIWbB/79?=
 =?iso-8859-1?Q?IpFlQlU/824oMWfj0/XA8XPDrRXGvRR87STGUxaAnSLXcIP063M+gohCva?=
 =?iso-8859-1?Q?piz54/2uph4UI4VPhS5LR1wk8iyRGslcMy6l5CCYYL+NcLr94tpoOAv+sj?=
 =?iso-8859-1?Q?HXdf1t35h6cHAi5aCjZXfFBv7rtD4OOxov/a+dHIQp8T8i92mdvDSLLbr8?=
 =?iso-8859-1?Q?xi/5CA6ev7B1OZk+JprpwEomzEewRbAJKiA4Ls60fxq7OSG7AV67PDHslh?=
 =?iso-8859-1?Q?SZhqZZK7ZWBqfHWrD6VaztX2t3zxqruJyf3C+R60Rg5cdB2lHRFJVDzoxS?=
 =?iso-8859-1?Q?fHI2Jig9ex6MYPeGHsX0RX8b2mXW3QUWMMjRCyXIG4QlymKx7BM3QS7hZj?=
 =?iso-8859-1?Q?0dN3xU5bcbrxD/Xp7zi3kpLqkzklTSSnhDZjRbiiYtU627815jxByIwfwZ?=
 =?iso-8859-1?Q?nmUSrSkA42eM9PntL9o+Qp4gez+3Ccfk2hfGY66z1SBh2qSkvA7O3wub81?=
 =?iso-8859-1?Q?HnhpiBDWSDlFNP2zeVA2WVoU7wUQUTx2j0DPRl6yjTYI4+x/mbw1Z04eb8?=
 =?iso-8859-1?Q?KPPZ0NzKkXXcJjWDArkIDGWZNmmzLJo8OHY6xkXN52XSaDhfrG4mNJHao2?=
 =?iso-8859-1?Q?MRMoJdmnpecDR6fM4kYcmCg4uvV06Yq2UNSU2dz/gNOHU1Z41QuYRxthiI?=
 =?iso-8859-1?Q?FO9CiOIWSH6hdUlixWXKnHh4rUCkmMtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V5+TmOmDHt0ER8NawayCDf66cNvlfyYT9LEAHKPaiQBM+llopZjK5fCxdD?=
 =?iso-8859-1?Q?/vvqqvw2x2WzNUMIunoTx1Sn0dDCnaQgl7guFhSGqD1iiPRGvD7ZNpHjRw?=
 =?iso-8859-1?Q?1TfLZ4U3sJXoiHf9lnysqigUBn1K1bLRlf6eujdFUshT7fYMKN3sEVrgp7?=
 =?iso-8859-1?Q?jQl4p43z257r/agk+YM66LZdgWge/cJP99Kcw85HIwnQWIyLQhAPJYTugq?=
 =?iso-8859-1?Q?XUo2ZStFNLAuO1cl7XsNx+v+eJuTH3rv8Fi5JHGASC0/ZWzkudh3UqTGQ7?=
 =?iso-8859-1?Q?N8CjpM+5hupWQD5JGe0mhnnMmZwqwYGs+Qzv5OWvD++bdCvObz18g/vSrl?=
 =?iso-8859-1?Q?5jJof8bY/oTuKZcZPG5dbfmCbWLVlSTygmAXDdajR1jbIV/9JlE+4/dRd4?=
 =?iso-8859-1?Q?wX98g553ylnlSbisBKJr3kW4lLdqhXRFw6qDeRe+/owDolv5JyecnNgara?=
 =?iso-8859-1?Q?MAvFZGFmNNzQDMsamqyzIcKs5NnRZiSJnD44XU2EyI95GEo/40uyG5S8BV?=
 =?iso-8859-1?Q?Ba1P1+ZxdEklxSZJaPG9s7/t8k0mhwY9WuMWiRU3uYQs706dtjjnqO6fFb?=
 =?iso-8859-1?Q?lAVA3NRXWWZxZVFAceFiD7X5xNVTIKXXdq3ibrs5YjmUPeg0/hGirTdaPY?=
 =?iso-8859-1?Q?m2qf+4gO50fIeLSgyaMpimL4j7C4r5BQBearE7Ef0Odon5LoelpyMeSSFq?=
 =?iso-8859-1?Q?lI0O9su3skW7pCMnYE5IJlv0BYdZTLOO5yZw5wRFkFf9hBIOTTpMh7GqW2?=
 =?iso-8859-1?Q?SW+/M5tll1c4p8MMeaW0FIAiHLOaVjkigxqhVXXyraQaRVh5gs1D/ahMQ1?=
 =?iso-8859-1?Q?lcT7Vo2iYnjz7t5IXG3iMXaC38YrmS4b5Ljpy4qvwI1EhCpSe/pT/PC3z3?=
 =?iso-8859-1?Q?DBuDLlGcjZ4AIJnvrx76oQnWpC9ZQJ7epzVYslJEKGnuC4We8PA43Nepzg?=
 =?iso-8859-1?Q?6j80ppqSaHtbE35fLlH4K0Ku6h9bOvKVv78Q6Irz+aeUGucBmFG2xfYym+?=
 =?iso-8859-1?Q?jpCJ9avtdU7vCL7d4q7r2bakz0aT9e6SA7c4wWjDR/MSLsWuLtQFbLIy8G?=
 =?iso-8859-1?Q?6cu9rthz1yudaHeLA8dbmrrWi/Z5Bw8ExxPwkN10e/NaKVdcIRJfXTvreH?=
 =?iso-8859-1?Q?UYzbRwYX54WDsQqqv4IubwmMlnil/7/IYA6T6W1np9jmUQ8paFhnvg0Asm?=
 =?iso-8859-1?Q?NRlGUyaxTh0c1OithpILTQ9uzMsj4er5Lc0jQfHhD3o/Gk4pUk5RnYZ3Pr?=
 =?iso-8859-1?Q?MSVcXIxtMY2HN5Y+JWH+rfHI7lAbDkOTmW+9mpjIg9VsEw6vVXVMpY6qyT?=
 =?iso-8859-1?Q?LU7gktmSFMle6VSEqXusqCzU77PlY2j3JYHVMK7uSH1dq1cEy4Uxk7wv+f?=
 =?iso-8859-1?Q?WhCuER1eQwINjIRPrBt+xNE7pOIJKJkq75rXmWmbYr9xy4IjA7sTs63oRu?=
 =?iso-8859-1?Q?Sx+XnQ7BE5lZuF/52g9LDEVbaHQ5/0+ZyeaytD/LN6CmWc5hBtJQt7shFe?=
 =?iso-8859-1?Q?sgHILA9CtmCyE23BI/hntiExjuwNyhHF/rWyg0EZfKUkJuz6sHiFuyO87E?=
 =?iso-8859-1?Q?IwO9sv6UkAItqR86TfTu+K8yXlTRxRc2UZXHr+pf3e9IK40VlnKJmL6TNa?=
 =?iso-8859-1?Q?JLvWWLNzVHmjggEI4lzsWZA1sTSnTVv7bE4X4Ul9ytWXuMeX39OGRCjg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6e772e-30f2-4773-a28f-08dca026bd32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:52:22.5503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VesJEAHAzIVw8BJbT9RYJ7xcCzZfBgaFfsACaz401Fh7rsrFj4z+MppeKSlUxq8ZGlx5xC+GYEXWhDyMZflkm/Y/roYn0exLMInfLRkrDs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7380
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

On Mon, Jul 08, 2024 at 01:12:10PM GMT, Michal Wajdeczko wrote:
>The test case logic is implemented by the functions compiled as
>part of the core Xe driver module and then exported to build and
>register the test suite in the live test module.
>
>But we don't need to export individual test case functions, we may
>just export the entire test suite. And we don't need to register
>this test suite in a separate file, it can be done in the main
>file of the live test module.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

+Matt Roper, +Janga

We ended up implementing the mocs tests on the igt side that can test
additional things like keeping the values across reset. Is there any
additional value in keeping the kunit live version?

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/Makefile           |  3 +--
> drivers/gpu/drm/xe/tests/xe_live_test_mod.c |  2 ++
> drivers/gpu/drm/xe/tests/xe_mocs.c          | 20 +++++++++++++++-----
> drivers/gpu/drm/xe/tests/xe_mocs_test.c     | 21 ---------------------
> drivers/gpu/drm/xe/tests/xe_mocs_test.h     | 14 --------------
> 5 files changed, 18 insertions(+), 42 deletions(-)
> delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
> delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
>
>diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>index 32ce1d6df0fa..0e3408f4952c 100644
>--- a/drivers/gpu/drm/xe/tests/Makefile
>+++ b/drivers/gpu/drm/xe/tests/Makefile
>@@ -2,8 +2,7 @@
>
> # "live" kunit tests
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
>-xe_live_test-y = xe_live_test_mod.o \
>-	xe_mocs_test.o
>+xe_live_test-y = xe_live_test_mod.o
>
> # Normal kunit tests
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
>diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
>index 4c1e07a0d477..5f14737c8210 100644
>--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
>+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
>@@ -8,10 +8,12 @@
> extern struct kunit_suite xe_bo_test_suite;
> extern struct kunit_suite xe_dma_buf_test_suite;
> extern struct kunit_suite xe_migrate_test_suite;
>+extern struct kunit_suite xe_mocs_test_suite;
>
> kunit_test_suite(xe_bo_test_suite);
> kunit_test_suite(xe_dma_buf_test_suite);
> kunit_test_suite(xe_migrate_test_suite);
>+kunit_test_suite(xe_mocs_test_suite);
>
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
>index 67c65e88c384..b344608abdbf 100644
>--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
>@@ -6,7 +6,6 @@
> #include <kunit/test.h>
> #include <kunit/visibility.h>
>
>-#include "tests/xe_mocs_test.h"
> #include "tests/xe_pci_test.h"
> #include "tests/xe_test.h"
>
>@@ -134,11 +133,10 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
> 	return 0;
> }
>
>-void xe_live_mocs_kernel_kunit(struct kunit *test)
>+static void xe_live_mocs_kernel_kunit(struct kunit *test)
> {
> 	xe_call_for_each_device(mocs_kernel_test_run_device);
> }
>-EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
>
> static int mocs_reset_test_run_device(struct xe_device *xe)
> {
>@@ -175,8 +173,20 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
> 	return 0;
> }
>
>-void xe_live_mocs_reset_kunit(struct kunit *test)
>+static void xe_live_mocs_reset_kunit(struct kunit *test)
> {
> 	xe_call_for_each_device(mocs_reset_test_run_device);
> }
>-EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
>+
>+static struct kunit_case xe_mocs_tests[] = {
>+	KUNIT_CASE(xe_live_mocs_kernel_kunit),
>+	KUNIT_CASE(xe_live_mocs_reset_kunit),
>+	{}
>+};
>+
>+VISIBLE_IF_KUNIT
>+struct kunit_suite xe_mocs_test_suite = {
>+	.name = "xe_mocs",
>+	.test_cases = xe_mocs_tests,
>+};
>+EXPORT_SYMBOL_IF_KUNIT(xe_mocs_test_suite);
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
>deleted file mode 100644
>index 6315886b659e..000000000000
>--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
>+++ /dev/null
>@@ -1,21 +0,0 @@
>-// SPDX-License-Identifier: GPL-2.0
>-/*
>- * Copyright © 2022 Intel Corporation
>- */
>-
>-#include "xe_mocs_test.h"
>-
>-#include <kunit/test.h>
>-
>-static struct kunit_case xe_mocs_tests[] = {
>-	KUNIT_CASE(xe_live_mocs_kernel_kunit),
>-	KUNIT_CASE(xe_live_mocs_reset_kunit),
>-	{}
>-};
>-
>-static struct kunit_suite xe_mocs_test_suite = {
>-	.name = "xe_mocs",
>-	.test_cases = xe_mocs_tests,
>-};
>-
>-kunit_test_suite(xe_mocs_test_suite);
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
>deleted file mode 100644
>index e7699d495411..000000000000
>--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
>+++ /dev/null
>@@ -1,14 +0,0 @@
>-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>-/*
>- * Copyright © 2023 Intel Corporation
>- */
>-
>-#ifndef _XE_MOCS_TEST_H_
>-#define _XE_MOCS_TEST_H_
>-
>-struct kunit;
>-
>-void xe_live_mocs_kernel_kunit(struct kunit *test);
>-void xe_live_mocs_reset_kunit(struct kunit *test);
>-
>-#endif
>-- 
>2.43.0
>
