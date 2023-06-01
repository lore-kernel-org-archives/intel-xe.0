Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875A4C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 19:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB6E10E043;
	Thu,  1 Jun 2023 19:07:35 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AA810E5A1
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685646453; x=1717182453;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gf8hVqvAhTB+dqrFgHJZ3LsWuUtm0tz3KgrhpLt5cEw=;
 b=dEKOFKbzsPG28e6VV7aqe937ocXz7eaV9TSqymPN5Ov19dn1xq/QHksI
 EJ0zpgPB5Eaj7uR2pHC9Eb1XPTVHNO/sdH9+aEZlhSpe3rRIfj6Bf1kNo
 z3IviFxWHUT882VktJbmdpUl04kEIq11PwfZObdZ/afJ09d0IboIU/KPS
 6xuMMEz/wzLOzAaJY8SZmn98W/KOKdQ0+CNmP8WG3xMp2YjmBhjJP9nKe
 GP4w6ATf0u8ccVaao8+CDxxf9ScA+ZSxNUxcPmNrn1kgeYPUpnru3ewnV
 B4Vip4Uvu+fyq5XdEZ2fR7eGbrVV2LM+KqNuDAS9IiOmecZih8cYujfr2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421470554"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="421470554"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777343293"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="777343293"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2023 12:07:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:07:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:07:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 12:07:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 12:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbU6uZwu/Ll+ZQevPXKEpLBmLv5cQeJnu4QaZ2gQvOMKxMvczkip1WMIVvBQIxE+li3hCPUScVDwFxkhHrJF2I4yWx20YAep9sht0IPCXmYmR89zGgbN+MWRWXpsmT8I64u8n0QSwjU2WZnJd4mLW3p35YqXdhR1yJei9GbdZAYbJsltpvKLEIT6lWijpehepJ7bBwTREW+YYTdR5qJubR9hryqjUEfu8UxYKwcDJx5HfaNkxzqmgrqglUqh25BTFQ6mXk09MNsUGo5y/CFmHRb9gdIpFtF1BrmBF1/Y2o8Zs9TN4Phb4bJG/s2K8yQ+4T4XLmx+ICl1F8cwo4ozjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxnMrq1QWLbdwnXsCD0tftx1LnlEN1IndA3Sk8Q0NHM=;
 b=ePh+8+AY6oCt9tTirzZHYawRB81WnZXP0E7+1ejWIw6dqseI6ecQ+fHorBAsvJCA0Fwf8BgkTvgMftUeS2KaXyuVd3jvRbBYo0/4NM6dQSIKiGet442BFdw4VSDAfN6mpD8j3fu0S9I8aN9cynHhnaM7OnE4vQearp9RKEACtfM5KuU7TpSJaXv4vt5lhmMkmi/C25n7zoHCnYUiQfnp5+9j4lFQBEJLvHJ8JniNVvbjKBa0QvaO7v/pSye+mJ88Jz6qOv2R+/tariicXupYKoz1DZjWMxCqkQq+b95IgOEpwLvwMHFRdp2PPvwVEegAIxUSKgACI0cwmwDJM3BXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 19:07:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 19:07:26 +0000
Date: Thu, 1 Jun 2023 12:07:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <cx5j6z54xs6hpv3zotjgorx2vrihjs3bi6a3fvhi2naxdkwup4@mzukz5k3gqx5>
References: <CAFCwf11ysbb2J8E9=T8F4V9pQgHMUhQzsjmvX43ZFiTCBGXfsw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFCwf11ysbb2J8E9=T8F4V9pQgHMUhQzsjmvX43ZFiTCBGXfsw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: c9309a61-fd67-49c3-f8b5-08db62d36ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0h8sixUuOFAV9GfakOgiis8+TtrOmPuEQNP7zOTqZkrIpT7AK4vt8GmPyDArhEwDLwSe4H/xmROazE4yZM/pyMeQnzmrVId/HJCEzY8nqn2fhlg7H+6Zr/nL7wvjuQX+YejW6Kj6i91+0i6L4DtpLRpR38fln4KoUmdiZX/28c/ByiWK5LuFQkGhW8JdGtTy5c7Kgv6LTK9q2klwdWEIXKU9lzibq1cwbqSj59sp34udOZRtxa0bcyI10fqkVPM4m8wHpcbt2PLlv2U093bFIZoR6oUY+6Q7zsFQpGdMSgNHVTv5OK5FnKeey5fUFoBQ9ufR/yRZpx7du9BLF5ljfyebbxrbOflfusgFJjIAH1PV6XPjddfjL+1YTpVo0grRktI15g0Yt2FDmETszfDE7BqGFZ0oLCuE0LJFs3yPyEY5F/ww/XJ/Z7U+/z7kmklB41QiRWe11ptNAqMkoEEFNMwOBOBt7hcdXNn7KJU07N0iAFJiWHH8QYSWiaJl8Cks5yRVpd4yBdlTmdJw82kiKLvwfiTBVILd+EKEixc6E+4g69N9T375oOPWcaSAs3Ky
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(5660300002)(4326008)(8936002)(6916009)(8676002)(66946007)(66556008)(82960400001)(38100700002)(41300700001)(316002)(2906002)(86362001)(33716001)(107886003)(66476007)(186003)(6512007)(26005)(9686003)(6666004)(6506007)(83380400001)(6486002)(54906003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AlPM7PdPl3Ci33iSvqsJjI/1XS/HgDO7byyK8z6kdz0c8aEZElFB2eb/le0A?=
 =?us-ascii?Q?dzmO7eobT7ojGanlIvOS+jI+/jmBGMKDoJ/MmvOQp4jz12axjx8MC3Hg0YW0?=
 =?us-ascii?Q?QNjlOF0m/irQ0Tz0IRsy+ZnJjRLomt0LIVfbQ8//cQSfI1n8/1PdEAHCZyM7?=
 =?us-ascii?Q?suPUlTmgoLrAyWpec38Oh0mcWOSpfJMEKEOzwsRCSfuBLAl6X0BKR+hemf2q?=
 =?us-ascii?Q?SPOvRoSRKxxOSlTF1469Cv3bcdz3SyLaSI+KbTPUIHVqHA1ChQgAcsbJYpeM?=
 =?us-ascii?Q?hsPIQpJkDQ44ZOR4v7opEAj9opS4x62AE5fLOP9CD4CnFNJmQ6TXhLdyIcaA?=
 =?us-ascii?Q?yqqVluYhPmk6Vue4ilQ1wuA/nzGhXU9fbzhFlR8LibeNsxvTuopjGpp+46mI?=
 =?us-ascii?Q?Igltw4mJt9IGiCVNnTVhBPHlmjICt4k6gvUCpc6snYrG7pfzWoZdIbrks6AQ?=
 =?us-ascii?Q?Xjq0tpgIVg+uNobmqYXFCkhJo4W4hRy9TPKM6TFR8xmpk3iCi5s764V6I+CT?=
 =?us-ascii?Q?vWP4fvQIj4Wd5/gYs2jxxshz5GE5bNFFXnKFYxgl/48kbox3F079Yuqb2OoP?=
 =?us-ascii?Q?SYSi5JDme5aULK5GTFshDupAgaT9950yZpg8Zpbe69HHYHC2Jh5OdFqAFyg2?=
 =?us-ascii?Q?qq1PnACvGsVg3cnKYRp3+ZVwhBJBbofOC943R0yfIiaUSyK7RELXYyzMGc7V?=
 =?us-ascii?Q?2jpqiyn2atdGqQerojNUmCKaKjfR6VguiEWxVzoTtm3YCzdrjxrqqcCoN28i?=
 =?us-ascii?Q?fcnOXtXX+xt/xL9nRCEXPSa74yVPPYwzcZ8VQA54nQQcZt6iUeumEXc90yIi?=
 =?us-ascii?Q?ZMY2vwhlr5BwXdWCJtX+lqRWVp8WYQn0pnTofRpTRTvdaqX8snPePe4t74Jz?=
 =?us-ascii?Q?9lWjDWnrYlE3BtRrMIy3GErCApRTYXkARI0LOrdCN/1UW3cV4uOUc+HvGPnS?=
 =?us-ascii?Q?YoiZh3YUUl/uwuaJ/GirAsSbFQvfDj1f5g7KHJUBckOC9F34ZsSSWltV++As?=
 =?us-ascii?Q?JXHxw6yW7u87yMn0uYx1aLVeTuBIjTJ/LbJJXEoGKg5+E4+RI/aX/bjFn+XU?=
 =?us-ascii?Q?ygaI57/cVwOknW6JeUs4vPoM+Xfg4O2pLXWXXl7WleDbe3SZUxhJJLa8dnGU?=
 =?us-ascii?Q?2JXtFPOnwz3dR5plj8GaCv1GSB34wFubqjb4OEQoPO21dNVWuaj4eP5dLGcz?=
 =?us-ascii?Q?BF595LwefMLYoZsIeu4z2/0OeB6Z9ghciyGRe4G2QFhyxy0mFiFA8OdxjYsm?=
 =?us-ascii?Q?INTntmJ6/MQ2b9ucqdhNj8beI8c48IyoJFZ17Ojtr9mr7v1d2kDoXaPVg7iZ?=
 =?us-ascii?Q?5oMKi9qmu0aUhhb4PcKvBwgxZw150VcY977KagQOb4demv2kD+NUpvRO6Att?=
 =?us-ascii?Q?0LoXVurF94+5q3oR5uyMZ5PFUOG9zP+zstv3H59Br0ZXGG3n8069ms228pVF?=
 =?us-ascii?Q?7+r2/vzhkX1Ubd/BJ24q3MLdegVHXHXgrKdOeTZ9Pp7NaifEo9Ki4D2L+ndc?=
 =?us-ascii?Q?nHJy6ZbNpkoUc4UF/7x6lKOdX1w8Xmaok3jkuBrNldwME6K2Jc1bY1aFjMXS?=
 =?us-ascii?Q?9MnQ63ZUVV7s3Yo/Wmpj5d1EDwusJzAljH+7pF2DSWbnhI2+QFDMCIo6a/rz?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9309a61-fd67-49c3-f8b5-08db62d36ff1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:07:26.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MG1fPX9DKSmseALBMi73QdTSq2NMIHeA4LC0FDJiglZxvLKEdfI56VewBRzPkZKQ9MD3W/pzJFbGd4YtR2Zd1g9ZhHIkMNeLLawkPG/WONo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Code review for Xe driver - Second batch of comments
 (1/6)
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
Cc: intel-xe@lists.freedesktop.org, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 04:44:44PM +0300, Oded Gabbay wrote:
>Hi All,
>Here is the second batch of comments, grouped by filename:
>
>General: Use of defines in the middle of functions is really making it
>hard to read the code. And it is a very uncommon practice. I can
>understand definitions of flags inside structure, and even definitions
>before functions, but just in the middle of the function makes the
>reader lose track of the code. I would like to request to modify only
>those parts.
>
>xe_vm_types.h:
>- Line 175: Either XE_VM_FLAGS_64K should be XE_VM_FLAG_64K or all
>other XE_VM_FLAG_* should be XE_VM_FLAGS_*
>    I would also love to have some documentation on what each flag
>means. It's not trivial to understand that from the code.

oh... and probably a comment that more flags can't be added without
spacing XE_VM_FLAG_GT_ID out. Should probably go ahead and s/6/16/
maybe?

>
>xe_bo.h:
>- Line 23: Where is the STOLEN define being used? I only found code
>that checks if that flag is set

there are limited uses of stolen. One place that uses it is the display
side, for example for the initial fb and display page table.

Could be added only together with display and was probably left over
when display was wiped from the branch.


>xe_guc_ads.c:
>- No need for guc_ads_regset_size function, use field directly.

true. On i915 the ordering is more intricate and there could be cases of
using the field before it got initialized. This is not the case in xe

>- Use define instead of guc_ads_capture_size.

even if the FIXME needs to be fixed na in which it would be similar to
the guc_ads_golden_lrc_size()?

>- calculate_golden_lrc_size() - you are calculating golden ring size
>for all possible engine types but not taking into account if engines
>have several hw instances. Is it ok ?

yes, we don't have different golden state per instance, it's per class
of engine. See the loop in guc_populate_golden_lrc() also happening by
engine class.

>- Line 452: not all struct fields (which are used later) are initialized.

extra_regs? they are initialized to 0. After the xe_reg refactor,
commit 748a140d5c63 ("drm/xe/guc: Handle RCU_MODE as masked from definition")
it's also simplified as the "masked" information is kept on the register
rather than on that table.


>
>xe_guc_ct_types.h:
>- Line 17: XE_GUC_CT_SELFTEST is always defined, why do we need it?
>- mutex lock in xe_guc_ct: same lock used for G2H and H2G actions so
>these CTs can't work in parallel. Is there a reason why this can't be
>separated into two different locks ? If so, I think it is worth
>commenting somewhere in the code.
>
>xe_guc_pc.c
>- pc_gucrc_disable(): disabling registers which were never enabled
>(lines 748-750).
>- Line 896: Add mutex destroy for pc->freq_lock.
>
>xe_guc_ct.c
>- Line 45, 50: Please use define for uninitialized fence.
>- Line 139: need to add mutex_destroy for ct->lock.

several other places in xe moved to drmm_mutex_init(). Maybe follow suit
here and in the other comments below?

thanks
Lucas De Marchi

>- Line 142: It appears that ct->fence_context is initialized but never
>used. If so, please remove
>- Although it's explained at the top, please add defines for offsets
>in the CT buffer:
>  H2G_CTB_DESC_OFFSET, G2H_CTB_DESC_OFFSET, H2G_CTB_BUF_OFFSET and
>G2H_CTB_BUF_OFFSET.
>- parse_g2h_event(): add default handling to switch.
>- parse_g2h_msg(): header variable is unused.
>- Lines 927: can't you use CIRC_SPACE instead of doing this manually ?
>- xe_guc_ct_fast_path(): problematic use of ct->fast_lock spinlock.
>g2h_read() can take some time to execute. Same for dequeue_one_g2h
>which also calls to g2h_read(). spinlock protected code should execute
>fast. Must we have a spinlock here ?
>- xe_guc_tlb_invalidation_done_handler(): it asserts that the ct mutex
>is locked, but I didn't see anywhere in the call stack of this
>function that the mutex is locked
>
>xe_guc_submit.c
>- Line 230: mutex_init(&guc->submission_state.lock); without mutex_destroy.
>- Lines 387, 396(!) and 399: please add defines which hold the
>calculations and use them in the structure definitions.
>- wq_wait_for_space(), Line 526: no handling in case there is no
>available space. Actually, it looks like this if statement is
>redundant since you check it again two lines after. This code is very
>confusing, I recommend refactoring this.
>- wq_item_append(): Lines 571 - 572 - Please add define instead of 3.
>Leaving it to the user to understand where this +3 came from is not
>helpful. Also there is no indication on success/fail, need to add
>return code.
>- submit_engine(): There is no indication of success/failure, need to
>add return code.
>- guc_engine_run_job(): maybe it's possible to merge assertions? There
>are 7 assertions before emitting the job. Maybe add
>engine_operational() which takes care of these assertions?
>  Also, if job is not submitted to the engine, I think this function
>should return ERR_VALUE to the drm scheduler.
>
>xe_pci.c:
>- Line 462: Consider using pcim_enable_device ? I see other drm
>drivers (drivers/gpu/drm/tiny/bochs.c for example) using it.
>
>xe_force_wake.c
>- Line 44: mutex_init(&fw->lock); without mutex_destroy.
>
>xe_pcode.c:
>- Line 278: mutex_init(&gt->pcode.lock); without mutex_destroy.
>
>xe_ttm_vram_mgr.c:
>- Line 342: mutex_init(&mgr->lock); without mutex_destroy.
>
>Thanks,
>Oded
