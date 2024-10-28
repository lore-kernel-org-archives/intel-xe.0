Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719C0D5B846
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 22:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D110E1A6;
	Mon, 28 Oct 2024 22:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWpilNtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87F510E1A6
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730154731; x=1761690731;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8pJxdpBmXzwoQGfAoCmqcp9/6qcWGpIIv/L9t5zH3vY=;
 b=mWpilNtIhvAmc3kfKBooBD6Wno80KwWokA1eq3i110GShnMr2Wa7sOFq
 UwSCqN4kwF4yg43x6+rkAg8PGM6TZCxghxvxWtlUI7ZGm0XPGxq3Fa2R3
 sC97W9PJcm7bQF/KAiFx9YbE1LpD9N3EJBBKqIRZS1PHd8MDDICKkwuP4
 NtYclZ+JYCzWB2xG5QWgRaiG6tyk976CBPdHDPFEd7ZFBf3A8EK57IoV9
 IRLp8ZICqrlRagPUeWPyR7Z29o4VrKTF+bp5Wyfb417aRa7QcACKW9dvL
 b6ttEJSfBhcA3CKA2bQVv2K17IAZJDbFrNh/G3YWUWt9+4I5Rz+E1096m A==;
X-CSE-ConnectionGUID: NxX9wxKsQZSk8joPyxwRLw==
X-CSE-MsgGUID: /RRxCShzSPaIYkSE1c+Lqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47236673"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47236673"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:32:11 -0700
X-CSE-ConnectionGUID: 7T9cnnD0TxCmvPNaawOvDw==
X-CSE-MsgGUID: gz45fCTaQmuSZoWoFwCNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="112568052"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 15:32:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 15:32:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 15:32:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 15:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNdF9mZHJ/lb2CBavIdgpfoef7SQl74ygMaDq4GGWtg3OSBt8QESrOOG67eTD68KblqRzDeDA1l0JO5Lhuf1oXTZZM0j3GmUEvaX6V8a32tgL6tUHP/YXY4D+r5FdyLc35+WNNtQgBm9X6dFTYbAEPDGxNjP1bc5D/BYwzDdJOyAqJg4FegnjMmxwSaTJvdxfNgHzh7ygFR4p9stL4d2UdtIQG8BfXNfp5ksUJQsEMMW4t76Rku+0LeRL77CvHebT+iRoWawKT4qLZfP5bs9BlCKfZqOvBDtHgAIIkW+KPMzhapTYWqMSNQuCAdBVgWh3L7Is/gOFfFbEo/v6kkgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7cIQsp9v2TV6FQh1yykxnRLcWv2fa3Ho8AMUQLJtXM=;
 b=DuVFeJHiUS12yyauf6/VPHAOVtH8g+NEZN4qM7XKvfw30qdWTWMe0NT0npNQJpnqnyqGFiDXLLvd+DPfqrEv3kgoqIg28mXeIH+3ed4GkdnRNPM+mdmtNSedlLbOTn5MYE3f6vy8cU+k/1AmCk8nA3PBHNzjqCgtXaEz5gm4ebijRTHzULXYo5pIy1vPrijLs2uF5mNyZ3h2h/I6zgEaftwBcXT9EW/iNpgg3beVhFOqa60Jk3gfvgAEdB6D9rbmvbWoWX9fn0t9voXlYiQ64PMuCnIzIIvVbDwVwNJFGg7KPly8GRc0K/rAe0beH0V01RB09e3C2uhxDvrx0EsB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 22:32:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 22:32:07 +0000
Date: Mon, 28 Oct 2024 17:32:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zx/1BZ93nLSC1pFs@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc0e6d3-568e-4c1b-2abc-08dcf7a05ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i3nmCvl+G4dwKz93lJP2+vq6LGK19jdk0luCKNiYVAGHhCvkhhfzkIEMH++s?=
 =?us-ascii?Q?qJDD0LZBCM9zLHzuCim2TnipC/Ul2ZH7AYkVj3bQmtHJnQ+0xvPNX3JOmQwV?=
 =?us-ascii?Q?TZbxhFO6HdvBk88hOLdEIqas0Ie1kULmF7Qc1jCmLfbVHmNq6uiNM76XkZDj?=
 =?us-ascii?Q?M7uG3qBv122SQeJ7YDbqt1joAoZADZu/bmk8FK3CZ6SNSTiJ5h0Ta+Bm7kGE?=
 =?us-ascii?Q?wrSsxImt13GIWWe2j69IsoR49mK+EJv/kYxkxTkvT6edeQWk+SCl/4uQauYH?=
 =?us-ascii?Q?vW196AWOXc01NFESDMXLfDx9ezu6A0bxIqUBZigGDQQUkjPGyDAoZozFkK0f?=
 =?us-ascii?Q?1h4yL9coVkj4HbzowGZFA684QX/gHfPp6SMsT0zIP5L8JBP+4N78alctDfnc?=
 =?us-ascii?Q?lgpFrKSLkzdmE//gytxyXWXacmkYF49NGu6sgOqQ7G9Oaw9bfSTe07mQYoob?=
 =?us-ascii?Q?/u1Do+AnVOLzpNTkBLdebx+NI42Ov+FhTPc3v5IKpJGNeZFfEpH/msAzfKxC?=
 =?us-ascii?Q?pWi0xB5Riv5kuo951ALHauER99z6HG9M4I4TrukZ99jiw21uDT+UMo7hCDlS?=
 =?us-ascii?Q?c4rdSZ9gK9b4h2kup0VsY+RyuJUcWO31VrYZ4Xww2oW5KdEuvwYez8QCVXxh?=
 =?us-ascii?Q?nFGYauLrU3j803JCJOgOt9htP4F94avyW/PxQYXCG4ochbCgfa/WAqCMj3w6?=
 =?us-ascii?Q?XgOos/sK2aEUyQXCn0COng06etmXIXxV7Jb6gYnu4PXe94rlbErCePQuHGGj?=
 =?us-ascii?Q?uClF6drEC28gdm9HeaYk43Akx/sUrLdJuucTffQP7X97h6Uc44P44AGFPdyr?=
 =?us-ascii?Q?mtXc4YlNMtkLYSt53Q9gI/egb4DnofC5umt/H5EpyiYMALoZXtKtnfNb8alL?=
 =?us-ascii?Q?3agVRROvXY+CUG52jBLaKBE54H/tZjSQm65sJ94UD3T47WU8Wrq3cXZM+QLP?=
 =?us-ascii?Q?uhnqHg57UQ48Pre7tv+qcBvgPWrIat9fxU9u10r1ZVpE3xiwnS6O2BwqwJOD?=
 =?us-ascii?Q?qreJpX2C1sopmw++CMuDGqUK2bAg0f+AC7f90NnqxiEB+8C8oJA1sp2po9ut?=
 =?us-ascii?Q?cGNZbQXHYEWpxnM4UYudw0xMeDoJGpq/l4wfg4LXH6q/apEwKtUxS2fHLRVl?=
 =?us-ascii?Q?1pJndOLauCyZ1zgaKbuSxzuPVYWQEal4fsMEiDGLWmY6uQOprEruQLiPiAuh?=
 =?us-ascii?Q?q8UvFXyU9sWxgfbTOcYu/lpKBXzvMgu+MME0glzNpoxH3fVgKITT5EoHvt55?=
 =?us-ascii?Q?B7fDlPR7Hsj4BpQwDJLd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iWyKeJufMwRw0M6fp9KtOkFNi85iuivi9u0QRWHV9OLvbdAEkgFKp/ylLqch?=
 =?us-ascii?Q?7UwqKy/TlGXdD8MTjEFdR48+2LzuRSLT4N6riGMDr6idLLYnxII8FaU2Pj6m?=
 =?us-ascii?Q?8nF8/yQi04DiY8Wfg0MhwZxxaMzb8L/eSsmR88Ul548SgNEN0UQuLAWWBVPH?=
 =?us-ascii?Q?ZpRVhpP8+8UEz578CsFV+acBha5f17R69/eiWIYC1lWIoIg7R7bAeGp4HVCf?=
 =?us-ascii?Q?6x91kbezhLaUsISaRRqJhmuRas8OJ09Y/RCVdLBtyq2j3giP4PXT72keSccz?=
 =?us-ascii?Q?GAE0ruHW75B8Y5fRMuGBTxuQcYBfKVrAiuui+YceTpIRZ2jSQ8JpsRPyqFmn?=
 =?us-ascii?Q?TAoCb8kPCdtr+S8usCQBlvrDw1OxueRayyyNJWPWPc+RmvXEOGJYTDd7Y4UC?=
 =?us-ascii?Q?gtrfR2KQzmm9GFoI93cEdt5qeQALPt7ZLTMeLLAr6l+iPJIqXiNFvd3xjjpf?=
 =?us-ascii?Q?vTZtpXN6OvbJKeueJAeAUDMPoApTk9qZFOaxwcESpcPQh4+HLFl6b+O5Wtc9?=
 =?us-ascii?Q?k4ok2W/fu9qDa+8rfJUgRorHnUT8mYpj5s1b6JCDQq2CIvr7vIyzNGm5H5e7?=
 =?us-ascii?Q?8u8Jk3ydjz8W3MuRyj0jyPtDmLEOphxcxfhZHstw2Z0oYYn1mg2eyF95+uy2?=
 =?us-ascii?Q?E2D1qxPG48Aa6M+9NUwaJQ7J8hz/0lsi9nbtelnTvLq8sYgubFFMX8jvm7BF?=
 =?us-ascii?Q?/6+fbypmtrSs0Lf1+ZIoX5yd6xnGF4kjbcOgDQlRw6xb7D37nzJBu0hHdcPI?=
 =?us-ascii?Q?GT6OsaX36v9HJTMA87jMydQLpeBQGyZclFhQPT+xD+LlDStUuUMCWr8Igy0o?=
 =?us-ascii?Q?7Nx93wEVatiP1N8Ig7n80EeR+gTNuJ6WLhocfOpFct+vPoQ+iPR9VMwWoq+o?=
 =?us-ascii?Q?kuP6da+WA+sR96ZPwRiapab0XFV0ZXU01eOVDGHj8uQYRv2HqrFUwyWyf/Fq?=
 =?us-ascii?Q?lvllSWM3CzFg0++ynnilp6YSbGXXtQN2Ejhgyz7mg/vIoTN1gi3BSyXOIYZG?=
 =?us-ascii?Q?rjl7ka2rc97laqYZBaspHqUYzbkm5URYuEQocp9cdPBEV8scB47na3iZsrzK?=
 =?us-ascii?Q?vgkB8ugUcFFq5gs/aX7mfF9u8sCnITb/lHK9MnS2FN60ZzEzUnF03z6jwXVO?=
 =?us-ascii?Q?90WIn8stOAUVk1A4oBEX2RcZzgNN1QhbdNW+qJPaeFV5IcvsFQzsW8wMicuA?=
 =?us-ascii?Q?m6ZdBU4B9nqhdECBBeEPNmfMdlZKC0sHAXKkW5uF6uWV7xF58apZQuvmppbY?=
 =?us-ascii?Q?L2cS+XnT9vSrjgpCG4tswUB3s7YSTXNIIWfo/kOaS8Q4yzK7sEpbB2qaQ+iX?=
 =?us-ascii?Q?pweYX2atXGjvVkhT+nzK6gFRdgz+d7ktH5xzzxRdKcSoAN7OsrMjQd2vf9k6?=
 =?us-ascii?Q?EQ2VQA8BuwazZkY9Mb1V8Zyjc3FxW8KmBcr945Lpr+1kyb8hb+qGyCUrNkFx?=
 =?us-ascii?Q?dH/wMmYs4aV3/+BJeYnk8IeSIYB/2HpKC5X1C9GJabGXfcguirELgw9OV06y?=
 =?us-ascii?Q?lSHxADssw2HWsjR+cqmGzhqLNNtONXgTBMfAlI+m6Sy4bNOGhLY504zqLD0J?=
 =?us-ascii?Q?m+PlEa6EWSyCpGfopuZLwFpO1yfbkt94bCjncG4yJquyF1eKPxN9NkHfT8ZJ?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc0e6d3-568e-4c1b-2abc-08dcf7a05ae3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 22:32:07.3470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/5Ju6XLmbfjKr6rVeSKF77LEGsp1AlnQ1yRfxfbgA7qnfK91AWdSrJi3RYNvDFng5gp57k9rXScpZ8vA7IOA9LTkihJxCkQUM5lmJbS2/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
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

On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
>On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
>>When the exec queue is destroyed, there's a race between a query to the
>>fdinfo and the exec queue value being updated: after the destroy ioctl,
>>if the fdinfo is queried before a call to guc_exec_queue_free_job(),
>>the wrong utilization is reported: it's not accumulated on the query
>>since the queue was removed from the array, and the value wasn't updated
>>yet by the free_job().
>>
>>Explicitly accumulate the engine utilization so the right value is
>>visible after the ioctl return.
>>
>>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
>>1 file changed, 8 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index d098d2dd1b2d..b15ca84b2422 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>
>>	xe_exec_queue_kill(q);
>>
>>+	/*
>>+	 * After killing and destroying the exec queue, make sure userspace has
>>+	 * an updated view of the run ticks, regardless if this was the last
>>+	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
>>+	 * query to fdinfo after this returns could not account for this load.
>>+	 */
>>+	xe_exec_queue_update_run_ticks(q);
>>+
>
>At this point we may/may-not have the updated LRC timestamp.
>
>fwiu, xe_exec_queue_kill() is an async call. It will queue a work that 
>will disable guc scheduling on the context. Once guc notifies KMD that 
>scheduling is disabled on this context, KMD knows for sure that the 
>context has switched out and the lrc timestamp is updated for this 

ok. do you know what's that notification? Is it the cleanup that we
process at __guc_exec_queue_process_msg_cleanup() ?  (which is where I'm
moving the io read to in the other patch)

>context. It may work well for contexts that switch frequently and may 
>not work for contexts that seldom switch or never destroy their exec 
>queue.

why does it matter? it's only for contexts going away - for context that
are scheduled out the sampling on fdinfo read covers it. Note that this
call is not replacing other calls. If the exec queue is not destroyed,
the other 2 places should still cover it.

The problem with the case when the destroy ioctl is called is that q is
removed from xef->exec_queue.xa, so the additional call in fdinfo-read stops
working. It  then relies on the last job completing and being released before
a read on the fdinfo. As CI shows, this is racy and fails in ~10% of
the cases.

On a remote system I got it was failing ~20% of the time

>
>I still believe calling it from job free is the right thing to do. As 
>for the ~120 Hz updates, these are just memory updates, so not sure if 
>it's a huge performance impact.

it seems now you are commenting on the change in the other patch?

I think it's pretty pointless to do the io access when nobody cares
about that number. The user needs to be reading the fdinfo, probably
through gputop or the like for the number to be meaningful. So why do we
care about sampling it at a high frequency when nobody is looking? For
real, non-CI use-cases it should be as good as before.  The difference
is that instead of getting 120 updates of few cycles, we are getting
just 1 with the amount of cycles that got used in the last sampling
period.

Looking at the traces we do get a few low-msec execution time for
xe_lrc_update_timestamp(). Mind you, there's another race about updating
u32 in xef in a non-atomic way and doing it that frequently just makes
it more likely to happen. That still needs a separate fix.

Goal of this series is to make this work:

	$ for ((i=0; i < 100; i++)); do echo $i/100 >&2; if ! ./build/tests/xe_drm_fdinfo; then break; fi; done

I was happy when sending this that it passed. But just double checking
on another host, the issue is still there and I get this after 16
iterations:

Starting subtest: utilization-single-full-load-destroy-queue
....
(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
****  END  ****

which makes me think it's probably related to the kill being async as
you mentioned.

I wonder if we should synchronize the call in the fdinfo read with the
queues that are going away.

Another thought I had was to use the wabb, but afaics we can only
execute something on context restore, not on context save.

>
>If the ftrace is getting filed up, we could throttle that.

oh no, that is definitely not what I want. If we enable the tracepoint, we
want to see it, not artifically drop the events.

Initially (and to get a good measure of function runtime), I was
actually using retsnoop rather than using the previously non-existent
tracepoint:

	retsnoop -e xe_lrc_update_timestamp -e xe_lrc_create -e xe_lrc_destroy  -S -A -C args.fmt-max-arg-width=0

Lucas De Marchi

>
>Thanks,
>Umesh
>
>>	trace_xe_exec_queue_close(q);
>>	xe_exec_queue_put(q);
>>
>>-- 
>>2.47.0
>>
