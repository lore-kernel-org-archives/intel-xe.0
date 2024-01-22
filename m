Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4D0C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154D110EB52;
	Mon, 22 Jan 2024 17:03:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA37010EBEF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943011; x=1737479011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Y3TepVyU87ZXD5uBG9cuhhqj8u05N6GIYnwIQzn8Zo=;
 b=bcUZ3rVKPq38TxotPAm6sUZClbebNKvyZUoNIiqVfDWKhkQ26oajdG3b
 hQAtPAYMgvFrSgTicPqg7uXvfEp1zWNdQXX6XB1NIc1okwZpbmEO3b7gY
 BX7hSVUUqVpnnvAbUOqU/KtdhcqsGYkSWK5ZJa2ox96UXBC+ey2mOLsVS
 3zolGfiStT+mgR1nVXdNBHh9u2YIj64dHh7KtU63I8vyGu9J2FrrkUq6Z
 iUiuKKGl2XPt5tashJHEGVnb6NmDkPVPbxuppWPKqCJvg7j0h6B8j9ZKh
 BEznG5WFMcdR0jLAdc6QNaYXgBlMxiRiqxwwDtz4IgCmUpyvORM9aZ4Dj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8019670"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8019670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735227433"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735227433"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 09:03:18 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 09:03:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 09:03:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 09:03:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 09:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnCzOSAH6cEvtbJgsHwzfmj2CSJSOHGMxWIGThqU+dka69vFDzARhudZ0RbzIOS2PJhPs5RKMJ5AUKNMTUXoT5E9yVPWKBpGDYfuekeBXZV/eOTQrndGglGSKaBgmza4YpZgU+gDf+Z7X+SL8124KFk79JJl9qKR4HZb2uX6of0liQy4I3nQY5OATP6qGOvdhih47vwJtHGT8eoltRuEXYItJAGEFQkxNRqd1jos43iVVPI+bO47U0aUT0HEQ3VYLRGS7xhpaCxHHu/mIQ9oQTNzrcfq9MzAMIFvd+h8EheaIg9gp7ttUc2lXn2jT0sjt4CLvTkxFSN9oVG5LrpZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vrq0d+UeoaBfeJTW8TUl3PxYDozu9paTYOFsjO4vGM=;
 b=kPrQQOhA1gnJKVip5ALeLkx/kwspoY4teWwsDCdGuLqA8YJwJ4HQctNOLGu08lj5S+MMQdPU0DEYqVVIw91jjzpw4xYIjKt8oe7WYmAT0JAv8Am5yuhCKM4LYyRHfqOv2yklNzNjbU5PalXyUSd4KfStGYu9H+SjPCxSyxZ1SWhIg6JtqLyT8zdBuOj5adfArBUYAAa9MrLVxwLpU0ObzRwDnMhCe2IlbnMtvnyTplTTcb2wAaJu4afENMyGlRisKemMhJiLBOlWi9JUlNqSdlgHZC0t8VH7jmVa44Ch18c1Gzk53oDLXFdtKjZLKet3zWwoYny4lHZWaK7MQT4AIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 17:03:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 17:03:15 +0000
Date: Mon, 22 Jan 2024 09:03:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe/vm: bugfix in xe_vm_create_ioctl (rev3)
Message-ID: <20240122170312.GA7083@mdroper-desk1.amr.corp.intel.com>
References: <20240121121946.3969513-1-mhaimovski@habana.ai>
 <170593713214.646837.11443518611024683760@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170593713214.646837.11443518611024683760@5338d5abeb45>
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 480e7cab-2d4e-41f7-8d39-08dc1b6c05bd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aT11TbCRa8AAfKPj5sCH+9PGyaNVL8/5JdetdgtGy4GfBUZqndP+Wts/PKPFLkneC/RtATxZ4/wXLyID7bSQNxeWnfpuNUrrO1rBqK19NuQmWMRboKqNyOXptAQ3wamCAVw08m9al6P57EvPR7r3kW3eE0auEl5ScEUkNLnX9iYPcYZapUIrNY6b1Xb/DGmiH9oj0ae2NRdXT9ayQY8hKx1Jbxf0MWAunDXiY2s/jZ6J8vwTn2BAKbnn2LM0C7uPFUyN2s3cLJVZuG5xlFZYWmTQEGxffK3FRwK+lvLL8c+IHjigmKwnMtA/hox1DC+EuaGQ8heYYORXRfpAk1cg2u13PXtc4GgvRIzSIYiSdl2M2bBgzm5xZAwnpfIp1f6fMM67Qb4vPM4LHj4tStRephPBiwtcHZnIIfpyHRWxewWpI693+hv+sU7EofiTxIBU0gTTc4lxWL5ohR0RVvsu7FbMHe4ZF7e70X1KGfiLBARxtcyPCW1cr0YsDuJCxIcQcwuVgl81S9kYjWqGRj2F3gLWc5U69B5FgOfPL9GtmhJRJJ7KPCMvFiGdkCEw+3gW56IhhAsX5mWDsmQg+RV9L7Gif1/t/5ebxWVwPW3ww/quDJ0xNpbwhg2cRddpfbfo/2ovYtjEog6lVk2PCq6BIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(1076003)(6512007)(26005)(6666004)(6506007)(83380400001)(86362001)(66476007)(66556008)(6916009)(4326008)(316002)(8936002)(66946007)(966005)(6486002)(478600001)(82960400001)(38100700002)(2906002)(33656002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Tjmi0atWnoQjP+8CnRQ01Q0LDwd2gYnxBOHy50sJwtLZ57ZeQeIKaZ8jvk3?=
 =?us-ascii?Q?eUGpqxjHhNu469C9sHcl3M4/Fp7u0cNK6NgvsGoMCtYuF5aLNNVjtXLscpQ1?=
 =?us-ascii?Q?8aHN0AWZe1oonHZbAnVhZCjTSoCjya1UJGCF5+SxkQVWaWxcRQEFvhm0KD11?=
 =?us-ascii?Q?mk/Q1XBbPDkqAe4N7PZDhmvgDlJkdscsGv2yirvzKqfBiobn5Rq1x1Yqoq1N?=
 =?us-ascii?Q?A/JAiQ8qQWdRVbW0DdL2G6/zkscgW3iGqoo+08CvEgUsoi7H47uVgABeaKxo?=
 =?us-ascii?Q?RiP/beCGcm3YGR7J2oDRps1Rs7cBDThqwbhRbBNr1NRWhdVHl+TF0Xx+PuO2?=
 =?us-ascii?Q?O+Lgz7Hi24tjYLonfUdsPRnFmKEVLujACLz4GYE/c9hqt0b+k2ou68lshprJ?=
 =?us-ascii?Q?E2oXWdUtWiAteehtUNQdnglhV6kKMvWCj4egAvqdtSQ1SvYH1P85X8UiP98W?=
 =?us-ascii?Q?hePzeCEuWXY8zm304gAEXGXsnTDX+uitVrt1VniAFsIeglhHm/mHl51F6KF8?=
 =?us-ascii?Q?O/Yn18sMoPpuq1U4mT+HtNUiJheS/4iQ9JsYbBFkDTSopIgVxeC8d81CGQJf?=
 =?us-ascii?Q?JdJfPLJ8ulePypIka56A0D+xB58IXQo8FWn+bqt5cOwUbDiFmalHWN7S4LEg?=
 =?us-ascii?Q?oS392mJxKFxzwWOKQYjKbbrr5+xVVWpXOtUclEAJpFN7d8ZIHKEdlu2M6APG?=
 =?us-ascii?Q?TmOYWUZHxK2OgGOER5ohy8qOmLkeQNKQEqgxb5tlJ9oGGCNDXQGWCOJSYIwy?=
 =?us-ascii?Q?wtOn3VXuwDlITjyZSscCtJ6HHEER1zM58dPBGS4c9ODgWtwVJNouYCbzEdLR?=
 =?us-ascii?Q?U1jNvpOb0JWpGNVE+VtXSCaLah+GXz3uePp4igzWZtQGPIcafy+KR4RIsiIE?=
 =?us-ascii?Q?PqTosxSr5IGN0FD6jiXmdiKJAb0Uspz0+mohT9/5DQtkqcFgcw6JLJPRo8iy?=
 =?us-ascii?Q?pfSw8odhGxSUHbrwQqNK8ICl81Kfbhvq6RTIOVCoW0eB0WfKrDKLk/idah6/?=
 =?us-ascii?Q?RtLO5NCZg4g7WERd2Op27cVa/y6SqF2DNnqlxsReoRtLUeYPNrFzhyuWtI0F?=
 =?us-ascii?Q?DDpt26HLH90hYPOVzk155Mbkbge6ndkUTygcJq0AyDb53lYq/aHKxsafoea+?=
 =?us-ascii?Q?0X2Umv1ODWwYCzhVAiN3k60O0S/jrrG47Nwt78GKI2NWPzORc0WbhaGrqz9Z?=
 =?us-ascii?Q?n//9psrk9TclQR28NWbe6E7P9HZxuVwW5fYCY19J1BFXNllTlkp89HWi06jk?=
 =?us-ascii?Q?qeMaKxEjeRs1zXCoIFBgBAemWLfi1KoxIJwd1lMru/QPjaQQUmSm81p7jUQN?=
 =?us-ascii?Q?jdntwaRcwBHxMsZhL3xtGuN2POP6An+lrMviVBwtG+HsHU52D7oXxrie4t7y?=
 =?us-ascii?Q?KjLk3OrCuIiw4WE9rPsyvdu/L/SFyXd30ZNRPOKsFpgfAedQ9DSdNi1bapTf?=
 =?us-ascii?Q?XaKAswongdDuF5uZ3Q90+GOv573QprVvMZP6s5oFg4qpC0eOwSWUmKVut5Zu?=
 =?us-ascii?Q?iBkmyr1zwhDtsU3+Yei19OOzDj1gEsXoKwQqx8Lml8571n1NfhqJr6Tru28q?=
 =?us-ascii?Q?/e0Ok8beyUh2s0VpTghPHs4h/N4zDGlJTQwm8V++AA4l+SSZrbBcvCMeO8Bk?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 480e7cab-2d4e-41f7-8d39-08dc1b6c05bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 17:03:14.9422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozNirTnDr7S9BMYp8C8tKTz2h7yETAYm8CqMbjLWa4hR4vTD+n+3cjR1xp7+R2aSCz6RqgFFQxSXs2fj8SJhfQaNNP8EtcAwi/nbFcRyv1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 03:25:32PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vm: bugfix in xe_vm_create_ioctl (rev3)
> URL   : https://patchwork.freedesktop.org/series/128984/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f_BAT -> xe-pw-128984v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-128984v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@twice-basic:
>     - bat-atsm-2:         [SKIP][1] ([Intel XE#288]) -> [SKIP][2] ([Intel XE#1130])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128984v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
> 
>   
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -> xe-pw-128984v3
> 
>   IGT_7683: 7683
>   xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f
>   xe-pw-128984v3: 128984v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128984v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
