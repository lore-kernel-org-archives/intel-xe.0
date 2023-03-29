Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B239C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 20:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4E10EC28;
	Wed, 29 Mar 2023 20:12:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EB610EC28
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680120733; x=1711656733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0oS7dufRK1axCfvscQby1cwX9Z5tuKaYqAp7kJtqgLM=;
 b=QYI4XInpq6uTvp5ywmIEBqI7HgnayWYczmKvM3BB36++q1neeYywIAVl
 5tTQgpXMH9XZqQlloA0KL+5iVbmZMRFda8LoAjVmC/CH+hu+Is7oWSkOk
 IWIn6N3BO7+I5rT/sVte014KQbjb/T0KhXCLSGv2GP8/FHoVIWnfiILsm
 8EZNo1d8tJ/bGamyEzUccec6tqHrHnStTuRIIlCcyJJJcX4YILLVcAk2D
 Fmhd+3vMgyYV7BdOsJ080rc76WH+lVgM+Yvz+bSs5eSjLGh5Y9axQo2H/
 ExkMAgfNuTR3Gn8BXydmUuAhKJzuUT7CiKOXBLZ8/QJRysAOEw0Od87oh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403631262"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="403631262"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 13:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858634723"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="858634723"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 13:12:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 13:12:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 13:12:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 13:12:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 13:12:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgIQ+RtVUsU3EJUPfsQshykxRlWzM8GYp/gQ8QlpKGhmyZyn+GbeAA4XlxsCRXGcW1SkJ3nUrcb/tcdAja5+7cP1d7W2SQcQ8nIRvAs5/18ug4dXPkuanl5uzquF/f46+kqd8VsV4MQIQaBVBxmGGDOACyhmZEluW3QDmnQ/sa6M8DnCIfuTYRHrQvgXTfnzxQmM6R4tihXLJB90JBkKxwE+h3Zh/0zWZFIIoWwN5x7hkJvnTKqGkCYyIHQs+ynvPo71Hhxzt1A3W9e5Ew91IoiKIGBzwmT5rj/jAQtkqZ3EHbkIlFO+iGEAccj9YkXRapVF15H0zUV7ZT3lF0KYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBWp64UYdlKcyBWuY13Mi4fuSb+odZm7NsAMcAzimIo=;
 b=SrGaJsqBqasgDhY7vi8llRq9kA17SUFdBVnHeZD0ZFtIhi7Ym/eDs2mhOQP6qC0Sg+DSZetzt+veP+kflL78aqqPctRfxeLhRo17hkdSNXGgodxx421ir5DP7dfiQquse3MrLsebdEJPiyMFwO+ozknSU3FC+YaoSQF/qRznTS5jfkckWYaglZBbip/7PC52nf4hfgzH+a6K+k54DkV04z6W+xyxOiy8jR4GtccLDHBfxlyRvaVOtFQFicF/+Yxqs+Uletenp6Rs2eSLB8fFIXZ0QcAaxjS+9MaAP6x5GqFFNXtWenUH3wt34hNqTSfXB1nxrfWzAamKItCl95bhSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 20:12:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 20:12:04 +0000
Date: Wed, 29 Mar 2023 16:11:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZCSbjyHInE4wkKQ9@intel.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
 <ZB3Mn1atvjMFK29G@intel.com> <ZCSN356SJZFVB7w6@intel.com>
 <CY8PR11MB6940B98AB197C6940808DED4C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY8PR11MB6940B98AB197C6940808DED4C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: 1651b8d0-0029-47c6-3ff4-08db3091dd24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfFTQ9y8JkPF+QEnUOpR6dCEtbHbQxrNU175Ff3FzJK5hyJl3cUki27QlwDlkP5MvNJ8iWd62HggslJR38IS83WRX6WhRievdNxFWiC4QU74X6ZPVKaOkxVazXkgarJafSDdEYSXmn8yOpDxMQ+XOKqoXiORU7HDGOSkg/E99EsQC/Yc3e/3uA6/oHrWTzzoppAlcs9fnE1ye9ZN6UOV3U4s33es16bVSr7nZgN/o6pCAtXX9fE5SghBKCCjDSQ7b4T4QoZDktWyFLMS3vw4xjXTXkEBh0ZbIER/meHlNDyZ/sWHWE524JxQHCtNST6dXYgHaUNoLMSsY0xOmRvdZhOrHymtJ5BL9Delsne2pCTOldo8v3ksguz0gHib7/hrJszo6c5ZtA0r8v1pJQvQeDQ/i7iEQW1uYARBwEP/tfJvn1jrx/IeHY28L9NJILAZE2gVZ1p6WniWjKwdGMg+9InrxmdrLoe4a2vYCU32kkU3OFWBMmRWiuQH9mY+EcL1agTanMep84LyH26kTMl0D9Igf85VcIg8n54tUUlxRuyBJOL3M3ahyVqLKN1P0dB3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(41300700001)(66556008)(186003)(8676002)(66946007)(66476007)(4326008)(38100700002)(36756003)(2906002)(44832011)(5660300002)(86362001)(83380400001)(82960400001)(6862004)(8936002)(478600001)(6666004)(2616005)(6636002)(6486002)(316002)(6512007)(26005)(53546011)(6506007)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fj5g79eNdL5trP/bSLkbUNng2Sk/JQNwk7+W1i/+tyKKqFMcNGitMTR8UNJd?=
 =?us-ascii?Q?7d6UahM1MNJJfIoIJX306TkAkVMG+WFnO8nxX0htxD73m1AUv/1hS8cJUfK3?=
 =?us-ascii?Q?Ad6R8V2fBmiqZ96RNETeZB2zOwG9ifDyl/7l4uxgu6l6HEy86EvUHrSE18PL?=
 =?us-ascii?Q?VuQeWhLHHzA/DmGonRFH1I29vZg+jmrxIljfSwSzjl1Zg2WO6+BX5WgFvnWv?=
 =?us-ascii?Q?fggwglRGPsUkksfeT3vkR4YyPyJMVB+BbD6CHuN49VnA+XdF9RIldBlMmfpU?=
 =?us-ascii?Q?BtPVu3j69bg6A+ukVI5xHoeKrEaGMwKjghZ1k+Vs4TmUOmXx+nJjFlG3odUI?=
 =?us-ascii?Q?/UXIZUHCS0zZjwztXP50BfREZpRszX7O2p1KECEFnGjkT7H5opC+QDAFxxpL?=
 =?us-ascii?Q?VbGbNELslqc62dTSDhxLG6nnf7t1DeudBipZ0EY5GekCyZmD4V8/uFpcJDBy?=
 =?us-ascii?Q?k3tSsEZBDROfdwnN3fAjtn+O3or2ci0fAR9ipE0SA4LEBpPRNF3C0H8Iy0YO?=
 =?us-ascii?Q?t6qG+E1Ag+ifmGSertINodCzBNdYRmkHYkbHlc9HhvI6tSLcgqqP3T3Q0OYR?=
 =?us-ascii?Q?UrBiCKN9HZXZRr4ch3fOB0K1DjtBxyTfkyhL/gW/ptG1n6w2lvfTscPyVqYL?=
 =?us-ascii?Q?MH+rKDIdncBMjY7mgNLNwKxTCBFtR+NXQF2XSnzs5qNuvAyu1IuTzvVoAiUz?=
 =?us-ascii?Q?OBqe2hg9vSVwjYlhRBI8xsyG0etFKE5n3K1PVWl4gQ0ovL+zkDR9Msua1FCo?=
 =?us-ascii?Q?ohsKRt7T5KGP58ysr5NDfrq9Q2UtEnsZGdZ+eevwX5MV33ufFmlAe3YjIsMc?=
 =?us-ascii?Q?eFUoa5TYbT2Q9eAk2/fjZ1aQ3o/sXhKua/XgJzoM+YfkYBhWcSRkiQSYZLTm?=
 =?us-ascii?Q?zvL+H76NHCwHQAFiyrPzhgsgm3dePo263DLCcaxB3q9KouSd8sAzblQ+Xwvv?=
 =?us-ascii?Q?Dhhq++mvT4qEX5ybOSYlYaX3fHQRQI/U+qUZvTU9ysmIr2tZK/B9vKZIx9MP?=
 =?us-ascii?Q?ICPFd67Pracn5EzXv79331h+TPHhN5p4+LUrhsB2lqr3bRtuuXxel1e04PM3?=
 =?us-ascii?Q?uei1xfypV9X0zB8V6YkoGilXggAWFMq+8/dpzG5SR7SOKdCyMY25LiVbWhnB?=
 =?us-ascii?Q?X6TuXYnvuZMYDvCXKT0Jfe/emTulJ7N8siTd8JtOzXrwrpRy2cW0Pbm5XUMT?=
 =?us-ascii?Q?nZAfwkdWCry3/pW7O8Zvf+IloR3PZw8SWfOnTU3vEoSYOMPyMMxhAwZit7OU?=
 =?us-ascii?Q?z4HRPWOYZ4pA3OUYq3Ebe0PKvnd+8Yyxt1pWgJGtC9F0nRFejE2FqqMxdLY/?=
 =?us-ascii?Q?3zQxAHkpgDOEAaASwoodj6eI0HC/mm4jcy956/HehAJmkAAXK9/v8sK5aGX4?=
 =?us-ascii?Q?mh5GIaYUH7KYbCrKfmvBmOlg8QJW09qTSE4t2jRQvHnVQt8lVxZcxPcBS2md?=
 =?us-ascii?Q?MM3+Wla8B7xo/zSnuGiInCbO+0shwun/BjIRnaXn4I8am8fgTUlwUdj6UsAW?=
 =?us-ascii?Q?IJP7/fkazXKMZ8P9ukKYatTwELg+aVqkzyktg3zFVtB0Q4Be92sulYuRvOnp?=
 =?us-ascii?Q?ICUno2laoT5Pf2SNpcZUcxI9tWEPyE7a7k3tQ2zc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1651b8d0-0029-47c6-3ff4-08db3091dd24
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 20:12:04.3994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EF3uMFA3I0xNiVfVJOyaI5Mubi70MAYK+/WfDHpfzbYpHk4OREBwi3NjlJo1exN+J2lYIMRKyPd/wLTxW2gbiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 08:00:35PM +0000, Chang, Yu bruce wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, March 29, 2023 12:14 PM
> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
> > if guc failed to init
> > 
> > On Fri, Mar 24, 2023 at 12:15:27PM -0400, Rodrigo Vivi wrote:
> > > On Thu, Mar 23, 2023 at 11:08:58PM +0000, Chang, Yu bruce wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > Sent: Thursday, March 23, 2023 3:53 PM
> > > > > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org
> > > > > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to
> > > > > execlist mode if guc failed to init
> > > > >
> > > > > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> > > > > > In general, this is due to FW load failure, should just report
> > > > > > error and fail the probe so that user can easily retry again.
> > > > > >
> > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > > > >
> > > > > I have not tested this but assuming you did:
> > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > >
> > > > Yes, I tested on PVC and it used to fall back to execlist mode and
> > > > constantly print out EXECLIST_STATUS. Now all those are not showing
> > after this change.
> > >
> > > But now the entire execlist code is bogus.
> > > We should remove it entirely or at least add a parameter that allows
> > > that to be selected.
> > 
> > :( My comment was entirely ignored and the patch was pushed.
> > Well, I complained about dead code...
> > 
> [BC] I was thinking you were discussing to remove execlist completely.
> It is hard to make a decision in the code review.
> 
> There is a "xe opens" document, I will start a conversation there, and
> will @you as well.
> 
> > after removing the fallback we need to either add a paremeter or kill
> > execlists entirely. My preference is for killing that entirely.
> > 
> [BC] there is a module parameter "enable_guc" to go back to execlist mode
> 
> > But also I just notice that this patch actually only does half of disabling the
> > fallback.
> > 
> > When fw is not found we still have the fallback in place:
> > 
> > @xe_uc_init:
> > err:
> >         /* If any uC firmwares not found, fall back to execlists */
> >         xe_device_guc_submission_disable(uc_to_xe(uc));
> > 
> [BC] the xe_device_guc_submission_disable(uc_to_xe(uc)); and comment should
> be removed, can you please double check the latest from Xe?

Please accept my apologies. I was in the middle of a rebase+build when I checked.
I clearly need to setup some workdir here on my xe dev environment.

The only dead code now is the xe_device_guc_submission_disable() itself...

Sorry,
Rodrigo.

> 
> Thanks,
> Bruce
> 
> > >
> > > >
> > > > There is still other unrelated issues during
> > > > __pfx_ggtt_fini_noalloc, and need to be fixed as below.
> > > >
> > > > [  223.839894] BUG: KASAN: null-ptr-deref in
> > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.847211] Read of size 8 at
> > > > addr 0000000000000018 by task systemd-udevd/566
> > > >
> > > > [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted
> > > > 6.2.0-xe+ #4 [  223.864921] Hardware name: Intel Corporation
> > > > WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140
> > 03/03/2021 [  223.877365] Call Trace:
> > > > [  223.881707]  <TASK>
> > > > [  223.885658]  dump_stack_lvl+0x5b/0x85 [  223.891200]
> > > > print_report+0x499/0x4aa [  223.896690]  ?
> > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.903268]
> > > > kasan_report+0x99/0x1a0 [  223.908683]  ?
> > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.915210]
> > > > ttm_resource_free+0xe4/0x140 [ttm] [  223.921621]
> > > > ttm_bo_release+0x3e5/0x550 [ttm] [  223.927811]  ?
> > > > __pfx_ttm_bo_release+0x10/0x10 [ttm] [  223.934530]  ?
> > > > ttm_bo_kunmap+0x11f/0x160 [ttm] [  223.940775]  ?
> > > > __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]
> > > >
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_gt.c | 4 ++--  drivers/gpu/drm/xe/xe_uc.c
> > > > > > | 3 ---
> > > > > >  2 files changed, 2 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > b/drivers/gpu/drm/xe/xe_gt.c index daa433d0f2f5..8a436c95591e
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > > > > >  			goto err_force_wake;
> > > > > >  	}
> > > > > >
> > > > > > -	/* Allow driver to load if uC init fails (likely missing firmware)
> > */
> > > > > >  	err = xe_uc_init(&gt->uc);
> > > > > > -	XE_WARN_ON(err);
> > > > > > +	if (err)
> > > > > > +		goto err_force_wake;
> > > > > >
> > > > > >  	err = xe_uc_init_hwconfig(&gt->uc);
> > > > > >  	if (err)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c
> > > > > > b/drivers/gpu/drm/xe/xe_uc.c index 4ccf2b3435e1..70eabf567156
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > > > @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> > > > > >  	return 0;
> > > > > >
> > > > > >  err:
> > > > > > -	/* If any uC firmwares not found, fall back to execlists */
> > > > > > -	xe_device_guc_submission_disable(uc_to_xe(uc));
> > > > > > -
> > > > > >  	return ret;
> > > > > >  }
> > > > > >
> > > > > > --
> > > > > > 2.25.1
> > > > > >
