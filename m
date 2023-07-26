Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0070AC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 15:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B0010E48C;
	Wed, 26 Jul 2023 15:34:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37E710E48C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690385694; x=1721921694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sT4KBn37sqXUakQC0PGbibKefFA8vfOPwztl0CsQppk=;
 b=X4nHUb4grwF4cFuXhmILw32Meb2n9DEN6DQ83ebDH6BNpkDZIUKLOHli
 r1HBTQ17osTgFFzykgxvr/UVfRA0Ml4FffyTIRkyvax3DuZ7aMYgG3/AN
 vxZeBsX89ekcPuXbdc4lhT+2qNThrQkf/+Wzn7LFCL8FKLC9GmyHFvk8n
 Ql4a3BYF+d3ZE/tVX79pSC6Y0wmG3NcbC5gOqoXQueh2qjUjOJUCQquWh
 eYHis8wdNWRONtgUb0sOjVR1tyBGAUTto6rK1+ugBBTlhbd0HJT4wXJ2y
 pxOUo75s0Ne6s0AT6xtoDF/vwbfLXEH9wGnn34XVWYlyUzGhD+P1Z+n82 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347662279"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="347662279"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726591242"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="726591242"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 08:34:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 08:34:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 08:34:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 08:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1vDMKUjR34ixUiAWHBm8MzZqi1pMuPE1KsTMRo56+7Khy4Mlw+vmiBcs9BCD3uzdW2lSb41URJotgCh3nJGGJcaxHJwRlzn66XHIYwEZYpk7do+cRmlzB0d6s5vYMH7DQ5rIPuFSl9I+VdTwsHB8Za6QddrxEnaxn6sEdSgYuEH/Ijd549T+z6vhY682GjmoNGQyw1dqKjGxTSHueypLRv2fm3AYzt1oSQ0Q6g8TPhMjkFKDQxW19iBaOPPriIA3xbXwvevk3rrb5aojtuLfrYhR3njq3zk/tgYR0E/HpTsC+wdA2lLWsT/9/ZOBw9m6KUSB2UR/s6o5mXHo2m/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GbQCpAk/vLeP5ebLTImnquILpLbqG86Nd2VY3S/aJw=;
 b=KWuotCoa5A9d2M4+sirBsF23ifx1EKr/hR20Df4H5aN2UTP8NJUuL23zxZF3kQ6MxiqrSDQkMySlBCStfywsvbUhTyFsQnqlBvRLhSkSPCCPhr+PsbT7vwIs3aEg5ADxPcT8rZWFmSxVqMW9JmcjYSHxLwVG4pIEfNP3I0bJJuIEkzXhaN4ndvKkWFxaF+KT+hMwOBkZI5eL1uURV7cIgWB00uO/ICmOfCvEb016s4HiSfWG/DfuG2mBgm+ooY4XqZfQlwdX8jSrFEgTXIb+/T/yJBbprZAldBewAqJmg1VAx+pCh8arTN2IbxzqH6sm2crcOVf33F8Aev2oBQfuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 15:34:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 15:34:47 +0000
Date: Wed, 26 Jul 2023 12:34:42 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <p6tbd6zpobjox7c4csaskoniivjz6fvsmqwjewymg4i2f2ol5n@xs5djegilaqw>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-2-lucas.demarchi@intel.com>
 <20230725224718.GX209733@mdroper-desk1.amr.corp.intel.com>
 <a4ig4q3ytypqnzssnymrxzwpqq2fovr2wonl5lfrqbxghnsobp@3b7vuuaynau3>
 <4dd56b39-6815-0308-3c28-0fa0e4456407@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dd56b39-6815-0308-3c28-0fa0e4456407@intel.com>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 37dba0d1-7a2a-4dae-f860-08db8dedd7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0uIUCIN+QwqRcWJPTFQvoQp3q6SuWK7tIsi7UXD6vp5JUQ+5f4QDlYpj6lBbvuHEiiK+SFdQKBGtfpIoDuXmXTgn6pnUbMnoyLNgXW4p8ghqwypcjTjuVmZwCeNbkmbim+RGNY5ZMNvu71X9BDiD7lkOkWsGkw/0a56Qhn4u5i3smsYHYxV/2EQAG/gFlrUFYHZgCbQg09RxXZHUpqdJ0jh1WevcP2C1wFPZ5fgMVGSOLm7dXxL7pj+Tz1na+bWp5z+eNIxjeTxUJ+yqC3QJzNnxic0qWQPR/zPudEbhbW1dqk3TtHHgRllCXhRwBcsnNerHJmoeh7fzij/8oG7Wpfy9Czczv8Tx/RsMqwSLKm1VNC6/tbZyRVjpwCS3zu6YBGTKDxXBO8nOZT5xkL7dHmqkMhmhDGdVJfxo1Wm1SsBf9HXrXo9sNud3hYS4GjcGWiHoZ//HuQy6ArrnJ35drwyoKK+MpsO3/3Zeu+ykK9gAZavwc24KmQ6fKXmwoBe/pi2g1PxixcVXhomUwCcctCO1OIQujF/NFJ1X3CSTwvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(9686003)(6486002)(6512007)(6666004)(478600001)(66476007)(26005)(186003)(6506007)(2906002)(6862004)(33716001)(66556008)(66946007)(4326008)(316002)(6636002)(8936002)(5660300002)(8676002)(41300700001)(82960400001)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/fcXfO5hzY+3LLr/jDLz/KebLPcM2OM0zfYKNr8+r0DuB5eZrGL2//CrJ/?=
 =?iso-8859-1?Q?4cbQDjeQA4lawuS3E9p3t/J973NEI7XCLwiQYeOJEPQZDQ/CSBS/1MSRNG?=
 =?iso-8859-1?Q?BwVTSLrNgfAC/UrM/GgCV5mTY+jCcHx77CFcOie08GAbOtbolVkOV2IJLS?=
 =?iso-8859-1?Q?A3HZWh7MJAFKGlItBWKa32156KYEJw8UiLyiaoI7rwhSrho6MEVbszV8T1?=
 =?iso-8859-1?Q?scWRI15JBAAxPOQ5H9XPPkxVCaiJa89zmMdWoB74QXXjVDcYKmBy4vUQg5?=
 =?iso-8859-1?Q?B/p8yNxbS2q8Yg7Zb/IvZR5hffPnM/2tF0F5snwOickWc2es/2krR1xv3Z?=
 =?iso-8859-1?Q?p4Psr7bIh2ItAOTf30HMrCCbUkdQbKZGhNarkMu0q2zCHazhSunnc+b8sz?=
 =?iso-8859-1?Q?L7A6qW4/vgsHfEgoHioJQKLKQksPfqqupfMBZQhK1xFP35iA668Ii9IYaP?=
 =?iso-8859-1?Q?7hzZEtvWfPIXx7+5dl4hFm4zhZPyJPb1mtKFFLWqqsRnzMYTYGzG1iLUOV?=
 =?iso-8859-1?Q?b6o5pHuOdATbUbr8/V7gNOKziwC91vPvMkOJx31k2qRtQvEkqR9WjfuMQb?=
 =?iso-8859-1?Q?phqMVo06dN91qY/Ydbu+4cwQIWDKfgNgwbrmKcUFy3c5z3WU+/Cuu9kfqy?=
 =?iso-8859-1?Q?7NIDOo6DVyK9kUcBfuQ03GwDt+3zZ60+QRRjv+JduKa1458zow/TduziCI?=
 =?iso-8859-1?Q?dtHlPgvtXKhlAdmb/fqwSWpCPRJw3m1ls7UGmXUJxeJ3PV19ybXg5rxcZn?=
 =?iso-8859-1?Q?9CE4bGUtuRFKkJEwzKiocx/CptRxj9/gmWSY30b6NgRoUR3sd9cTc0nvTv?=
 =?iso-8859-1?Q?chP7hLVis23EkkXbO1HKULCeQSe+BjkV4FcgMy1FiT4xha5888yIQlX9Ng?=
 =?iso-8859-1?Q?nhKkcjQ7dZxUsFiZzQjkspaToPdHTbMTmk1UeiSmmck79xVEwhvtQfLI6X?=
 =?iso-8859-1?Q?u5JnUXHWWPp5ISCbVprwmZjRFI+j5cZLVswvpkB7uR0V+ZzRcxEqORYKik?=
 =?iso-8859-1?Q?/pZZdnYzDvISa7NiidGUyILDg+GiqXopm0TnoA1t9DdOS6ckb/GOynckCX?=
 =?iso-8859-1?Q?gm2kuius4o0U/BeM3c3JdClTvr0fJikZxpYekYnxv6TzMvquaBs33+O3uU?=
 =?iso-8859-1?Q?/764EWn0H5bx7sW2Pmk77/maYfSl4v/b62xx5H2hxMtlVXy9GpfScYFEVb?=
 =?iso-8859-1?Q?53m94ejNEYg0e613CM879oFZKac64BRFRZeTlZTApoMnXyMXrxUYKfEGRq?=
 =?iso-8859-1?Q?XJpWFLPoLNI8NggzTuhMc/5i6HuOi+ehph+8eEEhYMg2NbWm0V9oyCJHqx?=
 =?iso-8859-1?Q?zU4m6yfKBMW6Bl4OqzPnXl9L7H7V3asK0L120mW+qYKpb05vtOaS/KGWjI?=
 =?iso-8859-1?Q?+NEZHILxVrBjhIiuCV+dmnK9obAnGeNfk1mvUklsmKzIvrW33X1KiXNf+F?=
 =?iso-8859-1?Q?wdvY3zeJ9dw7NsPMK2nIsuG+bd9ILHgw9OhS9sc36QwbZrjEsQrDEqsvRK?=
 =?iso-8859-1?Q?tQg46XZMIfBwaObkMJhwO4+hP9PWXXuRmH2uGJGxlOXY4bAEBCYfdevwie?=
 =?iso-8859-1?Q?M4gxafqv0FGuQv6CL9GOJ5NsuxeIUmsRllj1lSY0fefmk4poJshVilE3sR?=
 =?iso-8859-1?Q?WQMwjmdBnLRXDvPXLfrs6xx2OYQtc7tJu+KV8RGxGWQllbkBpLLqeo3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dba0d1-7a2a-4dae-f860-08db8dedd7c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:34:47.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1FwLTLiJuXzQprvDUy2HgIonU2FoIeHQvnLlRdINgWbzoUBCBmICVjbh2fdvKA9xQbHgrG38f9TjRq8YqyK38eWnBDtlHUiXrqVbJgBBuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Fix MTL+ stolen memory mapping
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 04:19:43PM +0100, Matthew Auld wrote:
>On 26/07/2023 16:13, Lucas De Marchi wrote:
>>On Tue, Jul 25, 2023 at 03:47:18PM -0700, Matt Roper wrote:
>>>On Tue, Jul 25, 2023 at 01:28:33PM -0700, Lucas De Marchi wrote:
>>>>Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
>>>>mapping"). For stolen on MTL and beyond, the address in the PTE is the
>>>>offset from DSM base. While at it, update the comments explaining each
>>>>part of the calculation.
>>>>
>>>>v2: Also change resource_is_stolen_vram() so the right PTE bit is set
>>>
>>>With a bit more testing locally I noticed that I'm seeing some warnings
>>>and crashes on driver unload when display is enabled.  I'm not 100% sure
>>>they're tied to this, but it seems like they could be.
>>>
>>>The first warning is
>>>
>>>   WARNING: CPU: 10 PID: 4710 at 
>>>drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:324 
>>>ttm_vram_mgr_fini+0x15e/0x170 [xe]
>>>
>>>which is
>>>
>>>       WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>>>
>>>From there things go downhill --- circular locking detected, slab cache
>>>problems, and KASAN use-after-free reports.
>>
>>I can only reproduce the warnings above, not the crashes, circular
>>lockings etc. They don't seem related to this patch. More below.
>>
>>>
>>>Without digging through the code in depth, my worry is that by just
>>>marking this stolen memory as vram everywhere in the driver, we try to
>>>return the framebuffer to the otherwise empty/uninitialized VRAM pool,
>>>even though it isn't truly VRAM.
>>>
>>>Maybe it would be better to make a change with less side effects
>>>elsewhere in the code.  E.g., add a "resource_is_stolen_devmem" that
>>>only gets called from the pagetable encoding functions to set the DM=1
>>>bit and not anywhere else?
>>
>>I think it would make it clearer about the intent since the stolen
>>memory is not actually vram, it's just accessed through the PCI BAR. I
>>did typed this all into new patches for this series, but it I still
>>reproduce the warnings above. They seem related to the small BAR
>>addition that added the tracking for the visible portion of the BAR.
>>
>>For stolen, it's always 100% visible. Loading the driver without
>>display (no warning on module removal):
>>
>>root@mtl: ~# cat  /sys/kernel/debug/dri/0/stolen_mm
>>   use_type: 1
>>   use_tt: 0
>>   size: 62914560
>>   usage: 0
>>default_page_size: 4KiB
>>visible_avail: 60MiB
>>visible_size: 60MiB
>>chunk_size: 4KiB, total: 60MiB, free: 60MiB
>>...
>>
>>vs loading it with display:
>>
>>root@mtl # cat  /sys/kernel/debug/dri/0/stolen_mm
>>   use_type: 1
>>   use_tt: 0
>>   size: 62914560
>>   usage: 25165824
>>default_page_size: 4KiB
>>visible_avail: 36MiB
>>visible_size: 60MiB
>>chunk_size: 4KiB, total: 60MiB, free: 36MiB
>>
>> From dmesg:
>>[ 3026.756075] xe 0000:00:02.0: [drm:xe_ttm_stolen_mgr_init [xe]] 
>>Initialized stolen memory support with 62914560 bytes
>>[ 3029.670666] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
>>[ 3030.009260] xe 0000:00:02.0: [drm:intel_fbc_update [xe]] reserved 
>>16777216 bytes of contiguous stolen space for FBC, limit: 1
>>
>>So the allocations that remain on stolen seem to be the fbdev + FBC.
>>I wonder if the fini order is correct wrt display and we are returning
>>those before destroying the ttm mananger. Cc'ing Matt Auld and Maarten
>>to check if they have additional clues. I will send the next version
>>since I believe the approach without overriding is_vram is clearer and I
>>have several other fixes/cleanups piling there.
>
>Sounds like maybe:
>https://patchwork.freedesktop.org/series/120310/
>
>I have been cherry picking that on my local branches, otherwise module 
>unload is quite broken.

Great, that indeed fixes the module unload issue.  I will add that patch
as a proper fixup in my next series. I think that is the only thing
blocking that patch.

thanks
Lucas De Marchi

>
>>
>>I will try it on TGL or ADL-P to see if I can reproduce there too.
>>
>>Lucas De Marchi
>>
>>>
>>>Or maybe these warnings are unrelated; I haven't tried unloading with
>>>display on any other platforms recently, so maybe it's a pre-existing
>>>problem.
>>>
>>>
>>>Matt
>>>
>>>>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_bo.c             |  3 ++-
>>>> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>>>> 2 files changed, 15 insertions(+), 3 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>index 10858fcf4f62..5379d8e5affb 100644
>>>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>@@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
>>>>
>>>> static bool resource_is_stolen_vram(struct xe_device *xe, 
>>>>struct ttm_resource *res)
>>>> {
>>>>-    return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
>>>>+    return res->mem_type == XE_PL_STOLEN &&
>>>>+        (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
>>>> }
>>>>
>>>> static bool resource_is_vram(struct ttm_resource *res)
>>>>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>>>>b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>index 21ecc734f10a..271b3fba4129 100644
>>>>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>@@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct 
>>>>xe_device *xe, struct xe_ttm_stolen_mgr
>>>>
>>>>     ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>>>>
>>>>-    /* check GGMS, should be fixed 0x3 (8MB) */
>>>>+    /*
>>>>+     * Check GGMS: it should be fixed 0x3 (8MB), which 
>>>>corresponds to the
>>>>+     * GTT size
>>>>+     */
>>>>     if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>>>>         return 0;
>>>>
>>>>-    mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 
>>>>2) + SZ_8M;
>>>>+    /*
>>>>+     * Graphics >= 1270 uses the offset to the GSMBASE as 
>>>>address in the
>>>>+     * PTEs, together with the DM flag being set. Previously 
>>>>there was no
>>>>+     * such flag so the address was the io_base.
>>>>+     *
>>>>+     * DSMBASE = GSMBASE + 8MB
>>>>+     */
>>>>+    mgr->stolen_base = SZ_8M;
>>>>+    mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>>>>
>>>>     /* return valid GMS value, -EIO if invalid */
>>>>     gms = REG_FIELD_GET(GMS_MASK, ggc);
>>>>-- 
>>>>2.40.1
>>>>
>>>
>>>-- 
>>>Matt Roper
>>>Graphics Software Engineer
>>>Linux GPU Platform Enablement
>>>Intel Corporation
