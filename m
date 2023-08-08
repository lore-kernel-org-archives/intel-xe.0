Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F56C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 21:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB20C10E208;
	Tue,  8 Aug 2023 21:39:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A548410E1F5
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 21:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691530791; x=1723066791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l0kagl5bgQO3qZHvGlChDmH+uiU/9Z0Q37TXRMUTn+w=;
 b=IAutA9DgiQz0cVsYpMN5yE/OAbM/xqgngSL8UKNMQCufdo94DTPSJxcB
 j+S/aTpY73DRSyIM83kmv4yqzDdiaDnUUEGHyfqB1kFWAkCc+CfTAI/Vo
 IUp5dqszjKhNbeMPSETfkspY6MhoUnMHv3UDToRvSHOzL1iQks0EZ/bK0
 Uow26VfaA/pfTFIsCMHg1bRJoK0xleqeNXnQRRtHQt9PiBDDa5MQb4jGl
 eQfqq3EIzh8ipie5w+kBxJWeuBkKTBKJyxKbjgnlxy1CPUCoQMsQb26W9
 lBj/M1QSgWAAaIgZ0WvNJqmYXCrD9XmH/LT2Pzc+vUlXstEeyuSNlKM8Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369863101"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="369863101"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 14:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855260820"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="855260820"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2023 14:38:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 14:38:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 14:38:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 14:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyg+pS77CokJV6BY/cs01qrswxwuTLvPOH84tpk4WoMlsluXRH5Vp9NlSfm6v5ph6g8DREA3kCNU7FQb0SNfKwnHmjdwKWEpqHJzOfO0G2uMmu/merOnYTqQhVLoSk06ze6+tLUwJDAcRrhFY+u0PMhuqDxp0uMV/vX0eZ97ARIIr5Zil3koYEGiUVUecfrmxOmGfUQxhePnxQzwdFtVedNMt0ScW21brQyjs3Ah3vvqq1ksllO7shCtEp2Y9bk55zMdmlfrf0/fniwMothRXb0vzic+LIiRSWdWgPhkF23zCvgxT5zyAD9DD5fMPg5Yx5aXmhQ9AEdFxqcqL0P5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mbGlvAvGQXcuMglytf20hng5LS28OhJTIowTrQNpc0=;
 b=nLhTJfiIMEff7yIiethvgMe97rCxAXxi/as25IBdyMHAyJxC/5SwtxLTSLHsSUinHc/VkasCNyhor0vLkvZuzuPClZv340bpWarSClhfKODYRzw9W9YE8Oq7jnNc5nLF7R7xqSNgCdHPTxe4tZheVknpWeByxTHcFzdY2U7/v5Ex4SwTT/PFdcKionlxWNw+e1YfkaAHpAELWRkYsVMZZsAerFh/v8Y9XApNPQpU0PFWk32uXjjlClWWHKZxISwTA/vqFln0TleSEaek3HT+ru/lBmH+vePNQeG3Fh6HZDQgbKfoyLYv/dNrxq+SH62a7NeRcEbSuX5quDLIzY4pHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 21:38:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 21:38:11 +0000
Date: Tue, 8 Aug 2023 17:38:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZNK1vp3Q1lFULBV0@intel.com>
References: <20230801032748.434509-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230801032748.434509-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 725f59de-d890-4c36-5ada-08db9857c36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jT3AsyL2XkklpwW03q2hgwO9GG3LgX3WJXTSMcxFGtLlGGLLh7eds9tBQXRVpDyHinHhzgpKZ6swlE3e5nTOVvlBAamDo0w/spa2rHf93UomcP9gVjOi1KfGIivdhNLNK652le4emz/6p/1ToR2qD2Q4kqIFsnRh+osxlyFB3jrwTk5lB6RulKUc6X2SVFgNV5UZJlBugfpLHtey9uw/zhZPXvsTl/dbfVT5pT+YOeJgkM+FNv2D8FI8Iu8tyyZo39SjS+MH8CAyLAcVZO7Bf7jz3Jp+PG6p0gNEp09HT/JG8HWiyDETN3DXomDpc9/K5kI0RcGpbLSJ4cyBDUaZkPl5wb9VDQ1YlmgSZ63X8CoLeVQ2eyzkkZFSVO9WpdY4NzjG8IkQgvHEpj9WJt4xGAlacXM2jZ/huFk6gJ+KbOe5EeHhiCikTdEymtH784ApuX2kjxF7HE8JNZJ/GfZBbIfhcs5FY5kpCxNGp7uDstSyXuqI/eEeK6cx63smShLhKi++Mfx+4GVvQy86Z8dJHy4tDdr/n3jptw6igp3yb6QIvtDX0V81aUF3lqwTcrxNxjnWLpZo9UMMyEXwA9mDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(186006)(1800799003)(6862004)(44832011)(8936002)(8676002)(5660300002)(6636002)(4326008)(41300700001)(316002)(86362001)(83380400001)(2906002)(6486002)(6512007)(6666004)(966005)(2616005)(6506007)(26005)(36756003)(66946007)(66476007)(66556008)(82960400001)(478600001)(37006003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7+/kxgmvtyAzdAe24YxESd1gyZjXDmp62l0dIW1CCAGLTqv5+1nEEzoOfCnM?=
 =?us-ascii?Q?yJAtYb7Q/+VeezDWa5F2NAx+X+NBEhd1v76ZVEJgEmfXShYf5QxP4LZUDGqw?=
 =?us-ascii?Q?+oVaAirU76mCIAcRp6GX44uxMBbHwbgtAB46oVTA/GrVHSD4Q1VtyZXS1YmH?=
 =?us-ascii?Q?wWTC4UwrYY+cYWqc8UZ+lzZSuauYmCHra2XmmVMY7xfTcuqSrYXVhhMwxc35?=
 =?us-ascii?Q?UyyLm5b5psq88kY9kyQr7gwaslMMeJZ0PqLbMOObMnS7OpRMWwzHwnhx4WVO?=
 =?us-ascii?Q?qK+G9nUQoWwmhg4jVK5APcXBfBNt9Ewy7a13WJvGzjnhYTCb61hhj5mX0jTS?=
 =?us-ascii?Q?Y7scscpMhqnQfXbGrTwvIk85L2PCBbemrvsoMdKvFwZd4IhKRI4I6YFk8HXf?=
 =?us-ascii?Q?IGdO952rjvzPmNHOitwg0D8cPJ8zmix9/K2LsSTL0YQzjUgbYbiY5xbf6gti?=
 =?us-ascii?Q?jvJA1FF3+b+ubM5ibFcAjpQCJMAjNWmlsUN2876qBvl+NbaO/5FHjnwhWnds?=
 =?us-ascii?Q?vkkCTMaesECT5EhjzTcB5UftOqlFXxqeIv/GfS4C3PfHpZOubs4thItT8Ppo?=
 =?us-ascii?Q?FSOFcusMvzUCyzuM57AuhgA4e2ZAKQfPYZj9FeeES+IiMfXu0CvYMJYUzabU?=
 =?us-ascii?Q?9Y6ImGObWzAeuO8YeIGaMhegdMc2y34FqcY8yOkvtVf0njxfYaBeHYoFDfmn?=
 =?us-ascii?Q?FxckneaFhh5kYaONr8hdOf7qGtppHgcP+Kg719CU7UGSbrQSgeSqrkXRR2Tr?=
 =?us-ascii?Q?tvKXTrvCWvmK98MBYIREWf6R+kUcNebAloAfMuS+N+a500eWJkhdWIwQjsPY?=
 =?us-ascii?Q?9UL14havgxCyBwn4s4Pt45HX5uyvh/jS8S4DaTlq/b6/zGgAL7OQUPbfYTl7?=
 =?us-ascii?Q?Kv3g2PLAUAOuZ9/UaW5v/Q1Kr0X8S10F3Zj+LEsuLtv1qYEYZaLePUZYILWJ?=
 =?us-ascii?Q?pR+mCxjvn3Lg9VRem322dlBGnYo/m151Ij0tKT5Mbxqbcbp6XwqfQ9PZ0sBd?=
 =?us-ascii?Q?3OW0fzDFhbBNh3znYbp5IHElKAS8WChYT5G4DDbbkfQlsTmMMKP6OGaPfZoQ?=
 =?us-ascii?Q?lrc5WyJ6EvfPlZvEygSDC9TLJqFmfOYfg1Yimbmfh4xMPQhznzhE8nc0LxZV?=
 =?us-ascii?Q?JjTuux21BDJFi4X7OquCLD6oxBp3fQmsdC1BdbMdTdxlYQDAQtMrGcb2znvt?=
 =?us-ascii?Q?t7duCMSEaUbWQJdqbekazJRdQmTM9J3JljPhxwjmuRnis+hCX2XP253VU7np?=
 =?us-ascii?Q?kTRhIK7WxEwzHueupO1Vtv5OLjn1J9H7yQofAvIAopL+ymSw8TBsGs5hp9XN?=
 =?us-ascii?Q?f2LdhsYlDkaL1gUyMQpVrg+7GJIT6JZfyJCjjslO0qzjWUaTnZ4TB/7PZKd/?=
 =?us-ascii?Q?av355CGB3z/E2mx7+MhreUft7bVKx0MaFLvXXPTtl9c0ZaMAiYwENV+CcjAm?=
 =?us-ascii?Q?yZd8MrktKCjstR+11NsdKPu0MempVMdS5zX1j7905QZ5xgOYopMYJk94knCd?=
 =?us-ascii?Q?DSbmYR3EhXwLPPARIhwgNH9URZD5/o2SeGgQ3gbSfpFFYqBpZlcloWuDMMnK?=
 =?us-ascii?Q?qsYm8zxRjhCWI9z2qD76OSNqRqrasLsYPjZMGmtgKe2y9mgjtSeLUkMb+rew?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 725f59de-d890-4c36-5ada-08db9857c36c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 21:38:11.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPKWB5aqH7+lhHyu8iuTXPFPp6xrPl8TiJIBcNWsdCMNqjNdR34VGW5/4mx+8f3yaa6tl1LN8VdxRVO7iKOuyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] DRM scheduler changes for upstream
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 08:27:46PM -0700, Matthew Brost wrote:
> Fix the DRM scheduler changed based on feedback from upstream RFC
> feedback [1].
> 
> First patch addresses Boris's feedback [2] to not make the scheduler
> work queue run in a infinite loop, rather have it requeue itself for
> fairness.
> 
> Second patch addresse Luben's and Boris's feedback [3] to add a job to
> the pending list before caling run_job() and kicking the TDR after. This
> also includes a bit of restructure of the DRM scheduler helper
> functions that will be broken out into a different patch but squashing
> this into an earlier patch as fixup for easier repo maintainance.
> 
> Matt  
> 
> [1] https://patchwork.freedesktop.org/series/116055/
> [2] https://patchwork.freedesktop.org/patch/530655/?series=116055&rev=1
> [3] https://patchwork.freedesktop.org/patch/530652/?series=116055&rev=1
> 
> Matthew Brost (2):
>   fixup! drm/sched: Submit job before starting TDR
>   fixup! drm/sched: Convert drm scheduler to use a work queue rather
>     than kthread

should we merge them now? or should you send them first to the dri-devel
again and only change here after getting the final ack/review there?

Well, having them here ensures the CI on it... so up to you.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
>  drivers/gpu/drm/scheduler/sched_main.c | 87 +++++++++++++-------------
>  1 file changed, 43 insertions(+), 44 deletions(-)
> 
> -- 
> 2.34.1
> 
