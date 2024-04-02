Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B31C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCB810FFA9;
	Tue,  2 Apr 2024 19:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je65HQvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B3D10FFA7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712085272; x=1743621272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BdXGvi7jZzn78m92+fOCHMKVp1MszH5ionwJwJ539+Q=;
 b=je65HQvg0daX6r6HPlBda49yKFpxSqt+kxn7O1TKXd6fYT/j+//RUtY9
 od1Gu77SuznGKEOZ4T8uR91efo7XsMjv+juioI5pwXoSyYW0RoV3A/hSL
 YzrjAxI5zugF2g7tLRFc2yOP5uRXBpUWnvYCDNe93syZRmd9wcUI1ykjS
 p3BJsohHhxkP/fNUFlZcgV67aniAiwZQGlj6pQZP0aCM3mKT1S1NFIN3x
 KnstbshA3XhedQ2/ujiYbyvJAb0QtS1w+mFlh8seSbsEMFaoiwGHBAH7m
 ZoaoRWZTWtfKfMdPbRRx044re4q4hsU6M5px79nWqvhjJpJ5Mxaq8PJm6 g==;
X-CSE-ConnectionGUID: S9e7IFsvR0iNJ6Z997QjkA==
X-CSE-MsgGUID: /k1NTLBtTY6B+Cs0YIyuvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11114005"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="11114005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:14:31 -0700
X-CSE-ConnectionGUID: P7auNxpzRgiha17b+owYvg==
X-CSE-MsgGUID: e8JAZY+RT7iiqerTAaFSlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22919095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 12:14:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:14:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 12:14:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 12:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBDos7oXS/H/o5pXeQupAeFRGBkXiqjOaLBkN4AYajg9Mm1HVOvVVl/XTsLIFwH5BSmQYgRAXbOf04ZQ/cUiiNgwKfySm0znN1q5OmjCuRxhDR17+M01QnFx75zHhAqS2trX5J3qLn6Kb/UrdDe5GL7i6S60SiWExfneVc/TuFLT9zwoTqrTgOl5DTKwG7O1ZFCe8zhV8lrPJ8/OY8YsAoRN3r16gKmCQT26oJ5a341xIcDbpUIIQCTRmWNkMOXpSnC7Qde7Rh9IGCRelmHaeKRIhHzwrbe9wYqEjJelUH9+JyAvQQnsGFxgdkPH2+84yoebI2Or/+5CCZSY0VRKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmgIde68MBWJePLTHnwmI0tdMNQ15aTBLpX0ioglerY=;
 b=lRF3AGABVr7QekX8bGCX+2iz7lihOFewWwJjdjs0zLGUTBkqjY7wdOpqk68+Mt8rfqJcDO6FwpiTH76XqMaCdauQLqjGAovVxTEgMQkZR/MMu3em5jJsjP5xOrE4YE7UsHY2D3dBL/VANiFquYkUVT/I9PFU7Pmzxnk8FoKN3VXd0vCDNikKclYPagp969DOoyChI3uenfMSp6n+omSglcHPB8kqQN0OOW3w/3zRVsQ3zHXqhbsIeRAoIQ6+CgZgNFfs5WSEdkXlRQ9m2m33kNJwEA/EAwNq39TNpBLrzfnR1DSXEyoWZxmQCBZ5CRReE94AaTsiKQ3dkchBtFhCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 2 Apr
 2024 19:14:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 19:14:28 +0000
Date: Tue, 2 Apr 2024 12:14:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe/xe2: Add workaround 18033852989 (rev3)
Message-ID: <20240402191420.GE6571@mdroper-desk1.amr.corp.intel.com>
References: <20240401163806.3821128-1-himal.prasad.ghimiray@intel.com>
 <171199487053.1135732.17844246980782187420@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171199487053.1135732.17844246980782187420@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4766:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0N/f1kOlRwQewmR6o0TnKbb6uZP6mrx/iHpxwGVMIz+8BuENZhKEs4AErJvyKeyk//bql5UOVjKjJla8uOTMl9f6Ty+iCRQvt6TFQaciqi2p0JEM8qUufz3+Myx+nua0I8jij0fM1AFRMkJPN4k0V2c1S1u2QuTkvGYxtmKYXH/FeBHxUYiqc/kR6IrYk+nM07bVi1kJPU3IHVt1Zawl46zKnNFIPmoXFT4B1kYGwxkBhMw6TsmvLpJhjesLWXjlzvUUF5BQoRnEfp5sHTMg9/ryYs59SHaTjSdjLaRQN3s6pPslF2BuN31covICRgt6EFnqJdbgqhJC3V7o4M82CkJh9/AEHDM6EiYkOX6MUGjBffY/qWK1XlgB7iqyxRXprqUhSxK1nGFYnsZy5pCobEk520XhJaXvPZG3y1Vh8DLZOzzkhY6fqwziPs3wJRYVnCBc3n8kg3CX05oyHHWdPXvYoakfP+wjpviM/rnW8SAMlDADcNWuQ20OpJPPJ0pKQ1ukLK2PqWbXWldSZLG+UGeyjd7izwfSzqdg51aBE0JYavHai/CiCSoBbJhvGn60mgZd05HWI6K0b+ERiMZsGhl7x9IwSt9xAyylYMu16Q8b5iyqsVdzWP+7FUWMYuCs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J5xM44NJzTeMTrua/KmXm0i8dWxpXkmRwYuawQn6DRJ4L3HQ9n5FuxBLI02Q?=
 =?us-ascii?Q?0E0vsd9Hg3/CKWWz2oQHwc+hZ5rDrFGssyZhBCvR7vgmWmA73HE14tZTsFrD?=
 =?us-ascii?Q?8ou76xMHuv/yNfk1/ZTn9WUOtHbZbS+tO7363wMhjqotpr6qUf12eYTOYcRG?=
 =?us-ascii?Q?SImZmItGxm9xa5NXz588ZH2LgOJKcj1Nxs/0xGYquEN19qJ2tsdD9GAUcvLM?=
 =?us-ascii?Q?zFia440EfBMcAv6svTTsRNLOEZnVkOLJxJFuuTjoF9+Zt7klSsut1PCi2soJ?=
 =?us-ascii?Q?c1h4vMhNg8EtnMsjgKM8gm5UyvZ6Oeo8zhbzjQqvqOdYipP2klezmznIw4+Z?=
 =?us-ascii?Q?RvHOioDqYKWdQqdwS4aon8mcIhiz+qZ3T25bpuVXbnfPQlsD1T2qjfPwuukz?=
 =?us-ascii?Q?obQEaXz8pj35b4/bgTEpTiH7VzG9HRlmP0Irsj38+qZB/Ai+zkM1IPUZXby+?=
 =?us-ascii?Q?ccElsGB9b8EYq4HR972cg9C8cJ2DaDpSygOpSQAWBePJ3ugdXM/xCTybkPqR?=
 =?us-ascii?Q?TCIsAoHRNcSWRXwC2lQTgUpkzBmFY4BpLdfSfbtXqYIxHrXDFmX+dAOvxkE0?=
 =?us-ascii?Q?NkeSHOPCTyhwiKIA3Wrpvxr0JUNqC91hxz4FgeIYrq7j9+QanLR4sRbQpQG4?=
 =?us-ascii?Q?e+8X60umiWnN7tg6PHQPu+AOhUj1bHHl30WJ2w7kZMIFVCkLnQxGSSCQyIdC?=
 =?us-ascii?Q?9g+9Imzkrwfq367fbuPfDyPnTbGI7mMRk872DyGyL5EXguzzL7RUo2j1bKDF?=
 =?us-ascii?Q?7x6YjKfTw3yeWeHWrQLWeA/lk00fCuyO4WhYN0ZN9ZBY9IC95W2UjIxTs3HX?=
 =?us-ascii?Q?rfp+ItsR0dactG+nnwtdiZG3GaqcQWO/ZZ6v3zYO9o0qeCaiYTO2fQ9nIW/E?=
 =?us-ascii?Q?5UwTqiIpmmgazQMrDSX9rjRXujUn3IxKnnoJ5obq2AwRyNHdyqTDAgkoxI0Z?=
 =?us-ascii?Q?IEZNWbYiJDWCBuQ2SNUc0JuBR7k0UfmEnpq4FuU7kLSGKbw6YpSQNSKnnc62?=
 =?us-ascii?Q?a3SkYqQ67aCea1PMZdgst8SOW4jSW+cd/NBPMiu6cxRRSsFcWMvURPMF0BGH?=
 =?us-ascii?Q?aZxPq5ouzgaSPqoUfq1k7kRr+09H7rpksry1KPIZfRhkm8O6jfDHLWS2SoME?=
 =?us-ascii?Q?RUIBU3bF9W84L5SEgmy7vgkmE180uO+9oH0Jmhfl4Rb+lEIwraWPDptRcVQm?=
 =?us-ascii?Q?TJp4DjsPT5lDk6P5rzKQypwSpo1Bbtu/ihX3ahOP++O18T7DKZdTl1dGPtkI?=
 =?us-ascii?Q?caPD/ifZdAnj7H8+u5MsaO4sryBenU2dXXhboLJ79lKO18o5J1MzNnC/vNCH?=
 =?us-ascii?Q?ldEoCdqseL5zOqjD6ICfm/EfOXG5C8BcH641IW2b69ras/KnF6XptHWrZXI7?=
 =?us-ascii?Q?FPQPpkdyyAiRZrV4E3NK/U9bpqPEabGpd6XSplAor+p94pdsq2SjKlYH2a7l?=
 =?us-ascii?Q?MkDjMnnlrcI57zd6oF8a955qEmazDos6tdeJJtTBxYts2AV7aYn1Hwjq5P1C?=
 =?us-ascii?Q?8wSAFoVqTzV+5VsiKBQEbd9YjsdoqSqs7h2RN1uksQdG6KbzZQnWQUj7/3Qe?=
 =?us-ascii?Q?8J7ZN/+xj4zpIUm9h4kYr7GJBBXoF7z7TGrWVKxbjIlMMWpleiV8D3hA4r2W?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1863fc-6c2c-4d46-5a71-08dc53491e08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 19:14:28.2750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1bZV5Fzoz4HyQ3awQcWbcN359newi+R0ZRcjcilykmWjLd9d6v78Yqz5RZAeXanI+sgfZg6d/eXK7YM0D5ImFkdL7pO+78bOz9/3Lygk/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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

On Mon, Apr 01, 2024 at 06:07:50PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: Add workaround 18033852989 (rev3)
> URL   : https://patchwork.freedesktop.org/series/131881/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1021-a585b19932157f2c96293bf00288968ada86d435_BAT -> xe-pw-131881v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-131881v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>     - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#288]) +22 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-adlp-7:         [INCOMPLETE][2] ([Intel XE#1458]) -> [PASS][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-adlp-7:         [SKIP][4] ([Intel XE#1177]) -> [PASS][5] +54 other tests pass
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@xe_intel_bb@offset-control:
>     - bat-adlp-7:         [SKIP][6] ([Intel XE#1457]) -> [PASS][7] +131 other tests pass
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_intel_bb@offset-control.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_intel_bb@offset-control.html
> 
>   * igt@xe_module_load@load:
>     - bat-adlp-7:         [SKIP][8] ([Intel XE#378]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_module_load@load.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adlp-7:         [SKIP][10] ([Intel XE#1177]) -> [SKIP][11] ([Intel XE#455])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_dsc@dsc-basic.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [SKIP][12] ([Intel XE#1177]) -> [FAIL][13] ([Intel XE#616])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - bat-adlp-7:         [SKIP][14] ([Intel XE#1457]) -> [SKIP][15] ([Intel XE#688]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_mmap@vram:
>     - bat-adlp-7:         [SKIP][16] ([Intel XE#1457]) -> [SKIP][17] ([Intel XE#1008])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_mmap@vram.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-adlp-7:         [SKIP][18] ([Intel XE#1457]) -> [SKIP][19] ([Intel XE#977])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-adlp-7:         [SKIP][20] ([Intel XE#1457]) -> [SKIP][21] ([Intel XE#979]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457
>   [Intel XE#1458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7792 -> IGT_7793
>   * Linux: xe-1021-a585b19932157f2c96293bf00288968ada86d435 -> xe-pw-131881v3
> 
>   IGT_7792: 80ee6c6247595a92389a56d26d4905ee74e33c7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1021-a585b19932157f2c96293bf00288968ada86d435: a585b19932157f2c96293bf00288968ada86d435
>   xe-pw-131881v3: 131881v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
