Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5C6F4BB95
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B75910E207;
	Tue, 24 Feb 2026 22:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQxgSAWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E0B10E207
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771971901; x=1803507901;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=sztiBBK/SgOOSCFeB8yDT2jrK1+VXjkUkVtUxrcCkxw=;
 b=JQxgSAWskXzDYwCeAoGhjN+xs05ztPfpYX6CDickjeAlIgSChdUSRHu4
 p/HZgC1Cq4Gf+6awOvR6JdqWtRi6wi8xLq3hasIOF9rAwsYUu9JAYfAC+
 ZxNGN7x3c8rO0z1pMR8E+khqzYu8DEp2K/Uf8cTIIMN8allhX17qs3EiE
 JEAzyEASWoZrLm1dIdeqjlvh0hmZ9ivh73E9CO72FisUUWZPp0fBxWY4E
 5JnKaX8ubNycG27Bq8JCCrvrglx9rRygrCiK9hgo9W5T1f93wmeDqoE+m
 DlJHy+x6+NRUnp28BzSt62+8T+cDbOzKjRT3XT49tY8YtyfW+iwUEAfS7 g==;
X-CSE-ConnectionGUID: kxczHy7QRU6chRQrUiR4AA==
X-CSE-MsgGUID: afJuYjZtSnKm05v/kSjYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76610721"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76610721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:25:01 -0800
X-CSE-ConnectionGUID: f4wfb3EgR5e6vMarir56Yw==
X-CSE-MsgGUID: UoRR5ioHR/acSroSDvvEGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="214226113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:25:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:25:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 14:25:00 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:24:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gurGXfKvebwSI6zi2C6RKKWvp+oMpHtt46rTh+qW59FJZg74CRCbS/B5dqlTzMddjh6SGIGcyB8U+3MSiIybw32oMiYnWi//+YjyGIaGhw13ebHdU4+Biz9B+tjTf4JdADFFCgSMZoQThbU8Lcx557qz+FtSayaTeaiSgP655RDwiVkm0utaiMoxFmqequ/Ml0tlirOzgKboREEq2369k/76EUSD6TZ9T99gUtSymWMNhbXbbHqgh2M1zfqz96quLaCNuuAQ5oe1VwyRg0RJrQMIGa1qUyrxevHHaYjHT543KZ7jutisCdf95Qoe6ZBQksDzq4GWOZ+9hsDH0MQxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QykxgxhxWd/9vi7Y7GOv2OIBWsKmP0p/d7yTR0foqjg=;
 b=iNa2HSlVGgAm/tRGvDErQSlT9BptDJwJSTjnjbqrgdR5T5ZDOjkY9q0Hpf7xQ1rsGSilUU+cbpL9kR+G4ha8sEiYPONbI81PosmCpgxcyL8Dt3UE4GoC8Cj11CZi+UgWpOecWfzvGKw/omfIOg/nw4TAS3QLztffFYufG3OG7RAl4+/JdBhLqZcUpcv0jfWYvXalWNCFvSPsgfcADPRMrJPut8DYSd32SwfK4M99kPEizcBxb22UUn9NONAhRUKbp23LlMaJqz7XvdFvdeVwk1wtg+hgsu2kk0oFnqpzhoC+Bb0ANEuWSoLftI/xpA6z4A07pUIjIhFyf8eti4bDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:24:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:24:52 +0000
Date: Tue, 24 Feb 2026 14:24:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Workaround cleanup & simplification (rev5)
Message-ID: <20260224222450.GM4694@mdroper-desk1.amr.corp.intel.com>
References: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
 <177196560610.283382.16016286757924731189@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177196560610.283382.16016286757924731189@a3b018990fe9>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 09557ca2-c252-47ab-89a0-08de73f387c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N69E6gnwpfCiEZLb0vH9E1frJSK9xZHOKfmqGxbdQzDmgg2oi/s1/4tnhovF?=
 =?us-ascii?Q?U/i4jnRM3qDbtaY+bfh6jsULqVnMQJtErI6j5SDOxDgPVd+DXyTeQt/FYbuK?=
 =?us-ascii?Q?NsgxYp1lwaQGUkndOFY8EH2BGfGEgHsa+6KQtMCKTiwwVHkdNutdWrrjxaKQ?=
 =?us-ascii?Q?vQ8TkJlbm7eUjeaz8o7zgvx9TKUhAlE364LrBGwd6djPg46Wx764zz4R7708?=
 =?us-ascii?Q?77EEz/HcFLIlZeeU9smDl17ylxQKojTdd5Uy6gTpH8ONtWDFSv20+ZwXuDpx?=
 =?us-ascii?Q?bBbMdPyyXIGLumKhk31gkjfsx/XnsklQxaeNZfkuMvIMqpQOQAgFoON0oV4N?=
 =?us-ascii?Q?JP28sqQsQxAsMpnTw3pFxDm1oXMEQlm0T0StsNxthX/iw3TKQ5UXXl1VRkYQ?=
 =?us-ascii?Q?uPtWMEHec+1eHyVpy9ymalsjK1l15Em1B0bNUhC8jKX5jkhIx9cym74FcHNg?=
 =?us-ascii?Q?3FNCZhBmz96Dr7+gu2c0s2Wu9nPjIuKM4ttvtku3Emm+31NzMUAqCbxNuTga?=
 =?us-ascii?Q?wkYZq5ZiX5Flak29Z5F8aGBi0KUjn0duKVzK39DT4FRXxdIeQiiOu86PJAvS?=
 =?us-ascii?Q?CnnPD9r9eQI8ve5llOeVOct+/a7VKlX4Y97vs6T81p4ZZXKKmpb5ouFzVNe9?=
 =?us-ascii?Q?EMOz7X9Xg+6HEJqOTfzN0HxHyJLt2V2pj7l0+wP3+eb6GCqQwYQx8vme8fyc?=
 =?us-ascii?Q?i68iU8dvVhX8ujB7Lej4hoUCzKUB78kF0BeIWGmMxC7NJn1WyxtSKGX5YTi4?=
 =?us-ascii?Q?4YhS9uQhUoUU+SiTTMjut3/li5B1+lF80R9tw/xiY0jx8RKSfVGVrlrnmvdr?=
 =?us-ascii?Q?Zo+LXOsPArSWCXO5pt68LuR9zXRWU7AyXI28AjcWyZKHFS7t1nWSwGzp1jPr?=
 =?us-ascii?Q?vreUeMiCDVoEXbwBtYhKzrkqOvDCLCIrwG/TlWlx9eKbIIN7dhUzmVdSrSoD?=
 =?us-ascii?Q?mDHcRZpsi8iEEGYp3zoBO8Xjw17EyGgccHKJmaUpuTsdUFIGSta59fph+Ueg?=
 =?us-ascii?Q?YojPLlkRTKr9E1P70B/ZIzHFEd/jwGf5bGWG6nIrVBKRdifBxjePQXVMwhx2?=
 =?us-ascii?Q?R0FR8nzcEs0H3EV2Hdz4yrTjq3OLytoVdxhR5Wq707rEsAEj5lfNNFfnig2x?=
 =?us-ascii?Q?2tibpMfSj92VxAXfw3/1qcVqA8CY4P6XZeohhux+qQSIv28eRZgmd4ZI0Oqx?=
 =?us-ascii?Q?ftc/1AjgHX610bGz5xLgwQv7G9Nk5nn8GrYiqMC2WeOpIgb0Gs2yEH5gD97F?=
 =?us-ascii?Q?7yeG/OGmqVAdsGu/6lOnOvfd2K38kxQ47ywA7tuq8YfHEJwbvdQyEZtLmKIf?=
 =?us-ascii?Q?pAdBVRpQcpJ2dsZAsyUg4uwW88wAZdYvrR1vljRu+LCD6vMCx2rGUOUZ98Bv?=
 =?us-ascii?Q?htl3/GGRjnm0HuKN2bqSWQf8GA+tTQesylsVjCOQmgsPpxqJQzfth3gkz63c?=
 =?us-ascii?Q?Hth9lwpmAW5ZZE6vGOAuMgvNcIGZlkpJtMB1kZmDmRvTSbb6fB0Yjt8zUWa7?=
 =?us-ascii?Q?P2oVb9qtPRvkuqT4nHmXmDLFVJCAADYmk68r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9z6U1yerq4Q+sZvXutVEi1TtjrBx+F5ZpX1W3yQv/EF6Slc9ZmOU/Q1AkXU/?=
 =?us-ascii?Q?D7URZF6Rd8f6DPNQC5vld5hsKtKAvFNXGuBr1uuqP+JVMy26QKzDXMcIaCqp?=
 =?us-ascii?Q?3ChXTAiV4ti7QccFrACmyPmejUrwzCajJ6CytY78Qf3Mzb2k5Ga43StYiZIt?=
 =?us-ascii?Q?KbLBxKce4SJ9fPpKqo3LMmDEKmA8MC5aOmyZEWCEb+4qRa9Gb7KUN5Hd/bA5?=
 =?us-ascii?Q?5/xpGbXMJjYAUL/KHsYMBySYX30VCkMLAmxyJMMb+/8ixjU8YWgsRqnAtYbA?=
 =?us-ascii?Q?qWBZenj5WnUBu+pq7fnTk2HSFNd+GFEFbO9ZD3aQ67hozH1yHhk3SM0aIcG8?=
 =?us-ascii?Q?lU0/mi+m+0BhFfjYLLlsymEONjsvuW6bR62M8qXNRZ9NSmvztV+ne25K2xSQ?=
 =?us-ascii?Q?GrE8nDjlXYqCTGZz8RVOLYlpCuPCtfph5uvSI/8Co1yikbsa7yCwHjFlA3m9?=
 =?us-ascii?Q?4cXFLaWBbTxJCcqnrYOxWTPZIIq/ZO8x/E/6qEDhMaS3/IC3ykGP1IYavkdh?=
 =?us-ascii?Q?dkX4RyNrxzN238VagO6cGcyfvr312EX+yfPX60FVv1gXfhINY+TX+myr7KbT?=
 =?us-ascii?Q?1d5o06IVkzwzWVBFdLXb3qPQB+kWbvapDXB65uuh/usfO7iVG1tymU+kXO/l?=
 =?us-ascii?Q?0oA7YwIQd4TGm/iHk9GZ1nX2Pk1h8pwZKjaHehYu1E8zpm7TwSFFbeHZhHLE?=
 =?us-ascii?Q?gIIKthuey63xBXwZwqdjDtFwVTgzJI3SsRzwRVWEKz0T+tIJwl5lT4zDfbXw?=
 =?us-ascii?Q?NJ67RCbNWMiMXzfOCvSRTrU6oNoUGjPoWlaeJ6pSa8GFtMTz9juXhcu51hYY?=
 =?us-ascii?Q?ak8yUhL/5MdQ8QQDFjXcz2t+dga3MjbtVU/ypbDRQfjRe9ifSbZ2rFAg/D7F?=
 =?us-ascii?Q?gyDFmQrgu9kFUHgzHLAmfJWZJKszvODrBsb70IuGQDN97q6BZxZnmbL9yXSc?=
 =?us-ascii?Q?ofnoPZLEaleU5d21gVP5MP2idHWv/9fx6sNFRMOLuMaXp+qu6WJCjv8ottbx?=
 =?us-ascii?Q?qp5iH9LXo7tzmiOrgt83P49L9x+KIqAbZgU5QNP2svyeghlD4N/RaG7q8AHx?=
 =?us-ascii?Q?ExUpHKZV5NtAB7DuYsIWF669dT8k3YyqzgJFBaV0oe65pMJfOrTe7EeKk+H9?=
 =?us-ascii?Q?QweAFPYskYolHDXzs/INse5lQx+9B4mKI3Fi/KOnGnZf2OJTNp63X6crRNSo?=
 =?us-ascii?Q?SVB0NVCKi67Ji9m+vAV/s0AU5vdgXA2X+WrCyvfz7e9n1F6GdfnQx8QKe5uE?=
 =?us-ascii?Q?Z58P/kRCIDUdU9pUENEBS14daRzlebELBYcrtnjaIvGAyPliejJp+xyxkMqY?=
 =?us-ascii?Q?Z5YjZUqLXJyJtYfJkbpB66GYzbEZRs2Wau3dIYgocn9+rNXOlPPeSjECJukc?=
 =?us-ascii?Q?AR0wBTtwXomoANbD4Amfh08r6YnXbOBtOPYr5HWeIj3myDUldBo9BuwQBYWx?=
 =?us-ascii?Q?5mgSXpT0ffWpRKjsWgOvoY50OLft7bavBdxy7OQWyaS+GwQAjdXD3ImG8oBY?=
 =?us-ascii?Q?c4HGPLP+6Z2rhSxSe8NaF9/HDKHZJJqrgIo1x9MpAOAAmVL6APLv3KHwPrGJ?=
 =?us-ascii?Q?R3RCH7o/SVVW/yiIXFMUx2yTLZigeOqr5lQvCQYCS+rqxlysxk2ChmcrO6v1?=
 =?us-ascii?Q?LQdCS3UMtighJ0kZt0hMX0qx5QsmLAnlbO5bmNyj26Kr65eXMZiOR/WfM97B?=
 =?us-ascii?Q?IVN/H4qH945sww4ID/oF8ibqOHWyNajgXoofciDQx8iCPhpTtY+Tu6NJe3Rp?=
 =?us-ascii?Q?Dbx5P0ykyM6ArVAssq31Oj0fDgMnz94=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09557ca2-c252-47ab-89a0-08de73f387c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:24:52.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhPMzyfFoDMAhfUqrzM4GAnqMIwSFhe9Qr2ferjCLcTdB9Z71ylqHaMYYNLzNz/x7YWBLvlMqduck7m6CtQPGGvnrWpDzoJ1rFjSX8CmVVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

On Tue, Feb 24, 2026 at 08:40:06PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Workaround cleanup & simplification (rev5)
> URL   : https://patchwork.freedesktop.org/series/161606/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b_BAT -> xe-pw-161606v5_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161606v5_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161606v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (13 -> 14)
> ------------------------------
> 
>   Additional (1): bat-bmg-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161606v5_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
>     - bat-bmg-3:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

<4> [180.346927] ============================================
<4> [180.346929] WARNING: possible recursive locking detected
<4> [180.346931] 7.0.0-rc1-lgci-xe-xe-pw-161606v5-debug+ #1 Tainted: G S   U             
<4> [180.346935] --------------------------------------------
<4> [180.346936] xe_multigpu_svm/13144 is trying to acquire lock:
<4> [180.346939] ffff8881645a3818 (&fence->inline_lock){-.-.}-{2:2}, at: dma_fence_add_callback+0x46/0x110
<4> [180.346947] 
but task is already holding lock:
<4> [180.346949] ffff888105441cd8 (&fence->inline_lock){-.-.}-{2:2}, at: dma_fence_add_callback+0x46/0x110
<4> [180.346955] 
other info that might help us debug this:
<4> [180.346957]  Possible unsafe locking scenario:
<4> [180.346959]        CPU0
<4> [180.346960]        ----
<4> [180.346962]   lock(&fence->inline_lock);
<4> [180.346964]   lock(&fence->inline_lock);
<4> [180.346966] 
 *** DEADLOCK ***

This lockdep splat has already been seen elsewhere and is believed to be
a real bug in dma_fence_chain_enable_signaling() that's just become
visible recently due to other changes.  Reference:
https://lore.kernel.org/all/7b3811c5-1086-42a6-8324-b7ec927a74a5@amd.com/

It's not caused by these workaround change.

Applied to drm-xe-next.  Thanks Bala and Shuicheng for the reviews.


Matt

> 
>   
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b -> xe-pw-161606v5
> 
>   IGT_8768: 8768
>   xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b: 189174b3312588d97dc467dca7cfb9dce42ab81b
>   xe-pw-161606v5: 161606v5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v5/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
