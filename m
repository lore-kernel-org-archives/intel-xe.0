Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A842FC77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 21:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018F10E0F2;
	Wed,  3 May 2023 21:09:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B848410E0F2
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683148153; x=1714684153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iNSu8/RizWZljFd2+bcOFELmSA8fBp9U0t365qNqCQ4=;
 b=d1kfbLE1YDE0i0W7dGdI8zdQwgVTSQXFzKWnA6PLPqOOHYwElH1VSDya
 PPfjxlqcMEsiVUxo8t2005sCmixgnC8piboIVL1V5ZZa5CJdUtx2VOdla
 3qaEi8ALFkz/Ffggso0uYy86He4StuZy3ALP37oHoQFINCApeQS8yFqh9
 pyVpN/shKuPaZNfMHU1sNutqb2FlfNXbXnNkXAJiL8CRK23TjZPxaJ7iC
 BfUnYBkVZ5p2BYEtN1IGMzhG4cO7VvHZMSS0VKchQ6R3YIGCjUX6WFSYF
 GcLK99Vw/pMBzbyuKui5p3ERdg1xtwyse3wybBVzucTAeYWcM8eInAx5s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376835192"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="376835192"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 14:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="761642648"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="761642648"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2023 14:09:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 14:09:12 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 14:09:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 14:09:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 14:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mk+VKWz90cLfq2jPLiBFVceTBVyafZxO5FwK35Wn0i9gV4KiAdOQbtLcTdbRKGVraGUF1ZBZ3VDfBRlqu1c3LBq8I6Io98B4tw3jcpXgrIw6m3QKSqh2IGj5N+psSI6OPza1iKxSOwho3jF6QhmSPqwLklSjQgw3Ixa4ap1CXetGmfrS+4wX1bmTsmth0yF2/905b6ui4jtMysvcipuyf07LY/9A/GM1vwrtLNyZL9qFGEKCUCum9R1OdRp01sB5Lrl/unx1oVAgOGyaoB+1aDN+7+tDNiNbzCTKao885vfCTSYUK9e4Ee0RIms8lfWSAMNes8GdFcik02DRFwqreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsiVHuZbzpdOrSWbpUzPE4DQV3fCEDEluYt3P4lvRdM=;
 b=SrTXdVj7ebKxOwxQcBkk9TD/MuhMiU+/V/xAWQkSihEZ1R91L4c44N6CaH31Oii4YM6FpwYo4RBmLnHuK5w8M7RgzmVNcNf6n2QxZJLhQTYDY/UsldhPfDDtW8G+1dxH4embAuJ8LksTH67QgXjASzsvKaKVj2ZoOp0xlpv84sOIKl4Rf712wrKMGAnuX4AAG0ajJAGPKR4fYtplVUmDFzYMyX0wWh0+02qyaUcoBRScpv4DuRIiMh+RsqPIXvzrDD0XlBZn1hUq5DgnzDDumdoDKd3Bel+IBMqbV50f0olJsA+5eiZYMbdUOyC7fpC3DN6nbWDJ43mb9UfJw2u/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7830.namprd11.prod.outlook.com (2603:10b6:8:f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 21:09:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 21:09:09 +0000
Date: Wed, 3 May 2023 14:09:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <sbjtpz777so3cfrbbrybzj4g7v2pdatcme4o4yd7t3pzjv5zkj@ik32jnqbpzut>
X-Patchwork-Hint: comment
References: <20230503131005.1602412-1-jani.nikula@intel.com>
 <ZFJpdO7WW5miOo3s@rdvivi-mobl4> <ZFK5BjiwP9EyIkly@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFK5BjiwP9EyIkly@intel.com>
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 198cfc4a-1e90-4cd0-5b6b-08db4c1aa346
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sez2vpEYfEsjWWTcG53+LNSQyceh+kqWFleSzzIiVswT2MnyhYxNG5r6eHk1/fGPHv5UpOQBg631V17jXTx++PmNNppBvLeYeo6FF2jsG1faSAQJNPVE6QZttGa5ox378dIEu2KI6hL1MIgNlUOEjV4ExzVlRQ7YQd9IXSHIX3qWRCduYm670yJpAsnIBvP+73IP5zxy/G1IDZROLaoxH5O/wRTOxkLfDv5CSflkXG+ZGwFhdTyfkLLXjziVALFRFy6inMM4+mKubNe+LD/ybCUFkQbKM+83OBo4580qrtgp7daAJjRni44dPU1goPCAyuXTdhBM3GkRSRl1YrVSEio3FBFwuzfqSIz3ug4Q8qUijEjSD6SatLxCP8Vk3A+EIeY07Px2zt5m/0lIBB6ritrpdpi19XyvS+F8DpfZAf82hvFQ7rWuK8mW+TfiRexbY4ZCb6Bel8CNPeUJP/LRLX4SaHIQucWzE+XbONHRaIW0ZAlameULqp8KiOGfLS0WDy5yYd5gTZ1akauz25veL2CSLBv64RqkrU83j6nC81d1YKTSA/fybcjFtHhNUJG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(38100700002)(8676002)(6862004)(6636002)(478600001)(86362001)(4326008)(6486002)(316002)(41300700001)(33716001)(66556008)(66476007)(66946007)(82960400001)(5660300002)(8936002)(186003)(83380400001)(54906003)(26005)(6506007)(9686003)(6512007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xq1mo7jaS59X3ZgpjJvQ7dt3z2BZjRzyGRQaoI6lbsnb5tiA+OgyQgWg5xsu?=
 =?us-ascii?Q?hkGjGyyzMS9WcoFOHYhpBJ94ayFpm8qTBrc+l6ydX7x/235JF2xN+7maV7Xv?=
 =?us-ascii?Q?w+mvye2sS2y3vU2ah+W2GbUN9VAUBa7fdUqE3HrftwlmHWuQ7q/iuzrt5j+G?=
 =?us-ascii?Q?dcbrCPTeCKLTsGzKpm01GlhohTieC2KZLd9Ls8Vu6vPw4Vx9ITMzh3Zq2fbr?=
 =?us-ascii?Q?im0QMVMkJfGxKvVn+MjDU9LLCPPf1Dy8+rONv6nZP3pf7WPXyMXzivTzHnLp?=
 =?us-ascii?Q?vvAIloZRcnM64dEJutUvtQRKSkvxbV5IvBbHsVYH5pPMq9idKIrsaY9fw/JX?=
 =?us-ascii?Q?pdc3ePtdHzwSzU37etBvVfd51zsbxAbveUInCtQ5RHynqVBR2IWV4B3QN42P?=
 =?us-ascii?Q?8LSnjPYFFCCnF1DNerYjXf3UujqXXMkbo5BGKPShSIfXEsSTV3Qo9uNpKogw?=
 =?us-ascii?Q?2GHHCK5P7e/PQrcr22cB4s9V8/WTmb4JlXdOWkAO6RfuKlsf1cMuC8Ed5a6b?=
 =?us-ascii?Q?hjrPshH2ydhaQr/JsSVljPH2M6kt6kVhFv/jRC7h0oOwiBrWN192UL/stQVs?=
 =?us-ascii?Q?mCDyb05EgWwrs26zyMv91cUJO5A0PudVBMCJw0/gfC7AdM6QwgZWZ73f9rnj?=
 =?us-ascii?Q?rmHWOK+tfPLXhpUtD5wZbHdHoLqd0GZEzEsqVer4riC0MR2rdSqoxJJ/835l?=
 =?us-ascii?Q?glIhTnTekZwuS3cmewRZG7yLZpuDgTkxVfNjziTIwW0Iu1Q9ESxYuNOA/efb?=
 =?us-ascii?Q?sgBlo9sfWRQhuuhjAq3IFYaqC/S+BsuXKkRWsHAvHOqQigCJkS9ouSAN1L2h?=
 =?us-ascii?Q?NTv+DBXLPR0PWKEC6ZTG1u/nOCfHjedS5xZBbwMpLwNqEet2gkRThZJtxn+d?=
 =?us-ascii?Q?d0F+EMbVRZP2Kp9Hn71j2zVh52g9sLBE+m1OllovjnbPlAUc7ke9zrwVXQ7K?=
 =?us-ascii?Q?hMjmf8L+/o4Gnw7KT0046Q8Hpg9s+1Vc+sLcO1NoVQOycUqwX7o3bv4+QeMW?=
 =?us-ascii?Q?5g9XRlDPVxzdgicGaWrv1s4CI3k3RVjn3oxOZzTZ5s7gBWQfsHXxxKwgwGzo?=
 =?us-ascii?Q?+LAYvzT/XH6AfTPhi+Ucxg0Qliih/VAX/x0JTXIcmGhcb2hnxqtmb1lWbycF?=
 =?us-ascii?Q?lIEANHSGeOD+mpmUSykvtxqPLnilmj5WHQjwJQbS/yzbHdB1SaLnt+wgiThZ?=
 =?us-ascii?Q?I5OYyOtMc7OiBEvOqi0HApaNle7vJzk5YFBowqfPdi6XExb13UxfE6bouGIO?=
 =?us-ascii?Q?XFM+wUV8IHUVk1mWhpllZfNlcktWIfPi5kEQoBL27R68w/FZNosD8NzlWzKz?=
 =?us-ascii?Q?eK/Xlb3zLJMVOfN77VsNuISsLBBduPqiIU8/BUPEroNLQ3ZZND6Lm6buGSvB?=
 =?us-ascii?Q?4xMcdYteL8NM1vp8N7Db8AUrmk0lZ42r+i7OyLRTLJoVizHbSiByamNv9e3Z?=
 =?us-ascii?Q?57fGMu5WteKaeXSeIp3uh1MHPyPfEr/roUlGREaU+OND0ap6q3/7AkB3nSNL?=
 =?us-ascii?Q?P4/AVDRQ4RIOyCnsE11l3xmGuzPq/5/UHV4rHe2LJowSeFSEvfryZmGfuMgs?=
 =?us-ascii?Q?GwSrFg6fGWVQ+7DmbNmjFcWAsFTn02Z61alYN4rB8bSM4msNb6Q8CbjFZpPa?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 198cfc4a-1e90-4cd0-5b6b-08db4c1aa346
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 21:09:09.7028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02PcMXKxxLMWHtjIiXv9yrDnc8XZtpxUi5kaNU28MNpZg4+e9ABwpz0uPTad6QJ4QgQQAd46E6mAJcqpsM9ntxaYBQu/kdTy95NdzLF/5cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7830
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/18] xe&i915 display integration: add
 uncore and pcode compat layers
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 03:41:58PM -0400, Rodrigo Vivi wrote:
>On Wed, May 03, 2023 at 10:02:28AM -0400, Rodrigo Vivi wrote:
>> On Wed, May 03, 2023 at 04:09:47PM +0300, Jani Nikula wrote:
>> > Add intel_uncore.h and intel_pcode.h compat layers to direct the calls
>> > in i915 display code properly, without needing to change a lot of call
>> > sites in i915 display.
>> >
>> > The main trick or hack here is adding a fake uncore member to struct
>> > xe_device, which lets all the call sites use &i915->uncore as before,
>> > which we can use in the glue layers to get at the struct xe_device
>> > pointer.
>> >
>> > The fake uncore is intentionally struct fake_uncore in xe, so you can't
>> > really start passing around uncore pointers in display code, only do
>> > &i915->uncore, and it'll be the correct, but different type for each
>> > driver.
>> >
>> > IMO the trick and the compat layers are cleaner than what we've had
>> > before, and doesn't force using intel_de_* accessors for non-de
>> > registers in i915 display code.
>>
>> Nice clean-up.
>>
>> Couple comments:
>>
>> 1. I believe the fake uncore you created is better than convert entire xe
>> to match i915 uncore.
>>
>> 2. Does the fixup! as revert works well on autosquash? if so this is really
>> neat... I was manually removing the revert and reverted patches on the
>> clean-up rebases...
>
>No, this doesn't play nicely with autosquash.
>it is better to just use regular revert, then manually removing both patches
>on the rebase clean-up...
>
>result of some local experiments here:
>
>You asked to amend the most recent commit, but doing so would make
>it empty. You can repeat your command with --allow-empty, or you can
>remove the commit entirely with "git reset HEAD^".
>interactive rebase in progress; onto 78054149ebf8
>Last commands done (14 commands done):
>   pick 4358c97316a9 drm/i915/display: Add more macros to remove all direct calls to uncore
>   fixup 98a5b4a593bc fixup! drm/i915/display: Add more macros to remove all direct calls to uncore
>  (see more in file .git/rebase-merge/done)
>Next commands to do (348 remaining commands):
>   pick 5388ce02065b drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
>   fixup 6d8f5663eaaf fixup! drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
>  (use "git rebase --edit-todo" to view and edit)
>You are currently rebasing branch 'drm-xe-next' on '78054149ebf8'.
>  (all conflicts fixed: run "git rebase --continue")
>
>Untracked files:
>  (use "git add <file>..." to include in what will be committed)
>	drivers/gpu/drm/xe/
>
>No changes
>Could not apply 98a5b4a593bc... fixup! drm/i915/display: Add more macros to remove all direct calls to uncore
>
>---
>
>Then if I allow empty I have some bogus commits to get removed on a next round.
>if I --skip then the offending code doesn't get removed.

I wish git rebase understood a "drop" verb and git commit had
--fixup=drop:, just like it knows about --fixup=amend: and --fixup=reword:

Anyway, I think it works the way it is if you follow the advice from the
mesage above:

	You asked to amend the most recent commit, but doing so would make
	it empty. You can repeat your command with --allow-empty, or you can
	remove the commit entirely with "git reset HEAD^".

i.e. once you hit this conflict, you do:

	git reset --hard HEAD^
	git rebase --skip

from my tests the --allow-empty do not really work: they only play a
role if the "pick" action from git rebase leaves the commit empty, not
if the "fixup" action. If it worked, then the rebase could be 2 passes:

	git rebase -i --allow-empty --autosquash ...
	git rebase -i --empty=drop ...

Lucas De Marchi
