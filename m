Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBDFCF9C62
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 19:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284E910E05A;
	Fri, 20 Sep 2024 19:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEh9EZgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68F910E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726859365; x=1758395365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OfHCJwSVZyv1xLcoKGBTX+PO7n3SE0OrtZwHYIfl3jk=;
 b=YEh9EZgKZ7BWKRZUG0iAnmNug7qcae242XFAqDtyeQ/8qyp6POAmAp5m
 f0AmWry4eAzE3fEDzO3N7GIJqvC/IQalyqnv9Ljum/LGOtKTKQZZHCzHT
 Qo0MWjGgrlBfDrlSLAzrcjK0IwrPD9gihl58QYVE76MKLMHb5sovoyuq1
 ZEdYabqZseXvVVc/D7M3eI4l0/QTad83Wltx+9PbaSyQyWroAQBwwDOX0
 Tr4YinQoiXyay05HwcjKluUfwiOCu2qWXyAKXSDvKKm4X503BgSdb02pj
 QKgmlcwE4D3DyhYDH3puZDJaucU2FoXASmAzxpoKO/+s/XIOAiJ1q/xhs Q==;
X-CSE-ConnectionGUID: 5jhs6EdRRWa+SZLN6Aiv2Q==
X-CSE-MsgGUID: d9rw1RGfSUSmmCUwIzyS5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="51299212"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="51299212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 12:09:25 -0700
X-CSE-ConnectionGUID: u+qsY0ACTQmYaVurEoP0CQ==
X-CSE-MsgGUID: uL2uzUmbSSyM4UtDCUNX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70677153"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 12:09:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:09:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:09:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 12:09:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 12:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkhmuuaG8FR/d5fDg1JPKC4maLjkO+HTKuHEk1yvSj4yZ6vL5unrfskSoERXPVZgv0cC4LUXhmHjJ6nRqDbo4DBxFkIM9+Xiejl5NqLrAN4uMDSV6kHiYGaTEQ4oQf/n1g0FFeuIgRK01aO2G4X85/IGFsqJN7UtY9eu5cZ+vyM3Blafpu6ewxuOX8lvLae/qANNgbcz8d0AYprSMR+S1PYRXV56g8/qIdS4IK8WukDMeFeJMrWCDtQED/qqMkY2bODQWtP8GIw0kFOC5othVrnTLV6+m8BDB1Y18wqwvbaAW8WqsUaJHEyRxpFkBXBF8lPqjW1Cqo0k7GOXoIXwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggLPk92HRrq95z/ZiVn57dZ+qMsnue3O3+WdC/+1XkM=;
 b=hkvH8vOFYFsqRmglvI4d4LmUWnrwS1Otr/MpHwz+QxwlhAUTInvepGW6Kh1l82rQ8jkn1OeBSKvdPFBNu5grsIk6xKBKVhm+bbCQA8lP10mBygC6dUHQa7L/KyESkJYWKJwIDYt0t86lZDtv2iTqGSogD85vHScjf8vdVkb/fb2tCnmnYuIrNvVCpRKECJ2clLnWAFfuoKrsetUkuJ5JRrw/DyP8Nrhkz/Yax3Xl6NaUx508799qOFJ3aQ2NdWuOi4+W0Gx5lb/DZ0TcwvGG3ta530KO2zYSQMP04hKYkTH2XFRTSXEADwqnhT0tzTvUhuHYRyiz9CuTlkM5s6k/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 19:09:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 19:09:21 +0000
Date: Fri, 20 Sep 2024 19:07:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/guc_submit: fix UAF in run_job()
Message-ID: <Zu3H+GgPXAsRWQjB@DUT025-TGLU.fm.intel.com>
References: <20240920123806.176709-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920123806.176709-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e05548-6a5b-4ef0-d442-08dcd9a7bb80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PQv52rgpBFhjUpedhFmOeuhctMy9mInqMlipbY+lGIYJ6Ci75KSzkh2uhYA5?=
 =?us-ascii?Q?tJbAZFJqjCNE8uL91bUH+ImrLOR0K/2rKG5XvZDi/IeWU/4pXrs27x6RNh62?=
 =?us-ascii?Q?GObKWAlwgyjvhbc4D3mECdHyqB48lxR4IUd36Nlel2eSl1jkU80f/E8NmOAW?=
 =?us-ascii?Q?Y+QCgPAqOVaBW5cwlH2/cLxIrITZcq0Y6K3/YKcbdMYkjsbCtrABWkmSbuOz?=
 =?us-ascii?Q?SsBRspfrT/nc1bZ9W1RoI5wKQZfzj6lyNOh+Vk9iFCekW9pat+aCnqKhlGmR?=
 =?us-ascii?Q?yAwxPkJ0YyLySpvboE/PR4p7T685ZavzavyY24inc79JRPqj1kTTPuzErxTk?=
 =?us-ascii?Q?7cb89kWtukch4CNV81hz4MdSP6ptHdjCRgdhQwkFntJIz/oQ/ukeOPflhICv?=
 =?us-ascii?Q?DybYQ5Ra106lreNX2RWrhdXgfqB7etwlvOZ64YX79ERofOKCc+gIUxAbGNxz?=
 =?us-ascii?Q?PucyPDzqd9tKMhClFGkFe1BtuQtSSiLmT5Woz0yXAvSizbRsEUGuj1/IksiZ?=
 =?us-ascii?Q?RpyzaHXfMkgHHYSyvi1SSmiVSmZdLy6hRy5Km7VuE0/F5ey3SOlfQ+2Y+9Ii?=
 =?us-ascii?Q?rOiLI2ePuSBFBpvV0zZXw95UGIVRVVnb+9qCXris/XTDyPaipM+ySfYspxei?=
 =?us-ascii?Q?h9zOlTM/GKTzYgVY+b5m5NyyT77f5qg4ptWzP2923RokZe1FjZp8UsdoSsoM?=
 =?us-ascii?Q?WPkUmxhz3/fSDMtQGpUh1NmoPwXUfdCvQX0xofLFBlVrKC0UctSCZdPPTXl9?=
 =?us-ascii?Q?+ZDTnhuZoGlXKCUS1/qlV/JuyVOoX2iLY+YsO2WAkcx3EGB4MpwDHX5KsRzM?=
 =?us-ascii?Q?rAsp0BrR5obrcR/tUP8Qgu7DPR6kWE24h9hKK3ZAzpwloaAnpNl4Sod3ZRgA?=
 =?us-ascii?Q?BQZmLtAtgKklmx8FYbU9RXRtq00lQcdf5llm96g5WTYK95q6UFGD3EMso9Xb?=
 =?us-ascii?Q?aUUCjR/RUYL3Hn+8pWdJKLEQlceqTk5GMb5IPG5o+fDb24VaYLXyEtWs9zOQ?=
 =?us-ascii?Q?7e/4zEGSN5cTRhhwNHKAJWvl+pdKPXke0LTpLycLoh37MHEdfyatprMAxpVo?=
 =?us-ascii?Q?7asoYXkLIhDg0vmT1GgLXmD38Ozb27zTGE/TB5M7datA8ttsQ/cGeUOTD4JS?=
 =?us-ascii?Q?Ua5JC8dt3GntjdeysdZSi64Gv7Z4hfdtj5gG0eGM6pOi5EinL7x+Cdj+LUoZ?=
 =?us-ascii?Q?LeYo8bJs4TAHVRea7qfSqvDM83dHBXQfKQHSDzaBsesPd1gCfbId1xYtltew?=
 =?us-ascii?Q?K5f08yP8mMZDbt+4ZVJ5+53aEaMS68mVIq11KIQ6UJR1NoEL6FfAgzpvQgTB?=
 =?us-ascii?Q?sho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLBsNgPE0uyEeCnVJ98JFz05a/pSE/EBpwcYjX+5Wyuzo8SEeJZM9MojqMH2?=
 =?us-ascii?Q?JFz0ahYR1PHLCMfWq69lDMg2Cdf6GK2JNJC1wpOSO21LNXAR8Rzo8FqdL/af?=
 =?us-ascii?Q?Z019WSFlwpHsjWccn2YC1hVeMsp8SFEIoSl2WcSHi6KlyUPhHF+NTH2ilZh5?=
 =?us-ascii?Q?MdhWmnZojlauE1CsWMlByyazAV4I1nky9Q6SOL+M4zVDvX9G4QaBR8hV84p3?=
 =?us-ascii?Q?7IBZKqq2oEWd1T2S7vN1fIzdDhctRkf1Og0gCx2vdXrP+ipjIRYoc06EKdyH?=
 =?us-ascii?Q?uWaWKwbjiDRIGBliiyRak0GdwsGWg6hmpJ1V1lbEL/Bbaww0N5mKtuE7dgnt?=
 =?us-ascii?Q?Bupt0AxgkEquA6FVUi0QIseZSslAUC5agg8DG6cg4+4y6tFsRY4swabSivCJ?=
 =?us-ascii?Q?qDvlMi5yOFAlocIcymwjqS6lS5c1JCud5StNtKYlvp4TcvplVimwPz1oa5aY?=
 =?us-ascii?Q?Hs4Yb2ryk9VHfVOucXKywjrUwbr0RiKid5MyrTtG6e+jAq5PUgF/ZyybcZ0D?=
 =?us-ascii?Q?hvwfddA8qcCNiQFW6e6kq5zaY9gB2m3CyJSoN2JXHZQRejoVV5LT5FCUT+AK?=
 =?us-ascii?Q?AIRLgPYjoI9cC8tgugVLEkCgsYBY6flHxrYYgPD67Yskqx8tr0KSo1/Fmq40?=
 =?us-ascii?Q?HZMan/9ndWmL8Yl0Ks8Bgct8w4ITFINE69Eh5EuEJXIilXUTUoLXGux3atg/?=
 =?us-ascii?Q?pMk1dbC/TiSPQ+NYEhz48b/vDzQt1f0bYQ2hEUILGHhpL2sYzCCUnjyrbj1d?=
 =?us-ascii?Q?cMEhA9Z47mGzwNyEe3jFUHYN58wfr9mxZB6nvCK1BvEZsEZsZRApJSBx/Ymz?=
 =?us-ascii?Q?0BG7pozcjoQewkp+4cHex1Hx7HIVk7HZHW9zNt5+bP1+A8OaT18RhEii7kSx?=
 =?us-ascii?Q?IiiLVUUn81fJcDrQJl7an2c/HenK/Ez5D2sx62/QNonyxu9ZqDY5tRfbqKPI?=
 =?us-ascii?Q?2TdlYJUklYfBzYHARpoNVJrQ7lAiiAuemIaN+IdMWvwY0DfGV3kaeuDI8UkN?=
 =?us-ascii?Q?bGtKlK4gfhhWQs/+uitUBUUozbYBCR0eO29FfrYTGjo+bZ0g1m3eJf17bWpP?=
 =?us-ascii?Q?qGuCNvQvbWu/AR/r5o5MJtNe+VEjr0nAZYlKWHX7Nq3dN4S4SYsjgxxLhPhz?=
 =?us-ascii?Q?+ySePSsjWE+Uv6ayc/FdlQCIwu7GYpFW0bdNcDnEnmTRWeWw/X/7fy9njygP?=
 =?us-ascii?Q?Un9ZGx7VVBKJ3n+MDwdvmxN0kyEOYFcWFuVhdsgpHExmNt6YAo13oqf8a0vi?=
 =?us-ascii?Q?VpMYeE4SaaC+GkKkXH3t2KhwHnYrquj5xeN01Wy4tQx2QycDLysm0QEPbrNl?=
 =?us-ascii?Q?3mbUIcbBSASdH42aev5xvlOYQ+mJPUCfIWbDb4CXWN6D2n5FzyjCaXtQ2rP0?=
 =?us-ascii?Q?WPgB1PjT/y7K4+sCrrv0QZKVNdTOYwtzvsy8BNEg94TDA2kv/OKQe8KI2oaJ?=
 =?us-ascii?Q?sTAnRdnyx7qZdp3NnSwlWxwQq3Aw9Nhp6Erh8Fhj4Y95YLW+msALJ5z+0PKB?=
 =?us-ascii?Q?qfcC0QZ/IkWm0PoHZEy6fO7wR/fQwfHJ86DhDQ0SleqZG3wyzIPT3RO91HEy?=
 =?us-ascii?Q?l3Y5B1EzdrKhVRtj6pxG9qgqTe9IwB68pUq6F6PHVlQQB8y6klLOAojAoJx9?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e05548-6a5b-4ef0-d442-08dcd9a7bb80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 19:09:20.9588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t/PYWEIXtOl0BJtn8bp+5d8EiOEIQIw/vr98tlaXoPU53oCUG7gf0QkdPzlLj26AbaRhWEjkjQybPjwN+0DeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

On Fri, Sep 20, 2024 at 01:38:07PM +0100, Matthew Auld wrote:
> The initial kref from dma_fence_init() should match up with whatever
> signals the fence, however here we are submitting the job first to the
> hw and only then grabbing the extra ref and even then we touch some
> fence state before this. This might be too late if the fence is
> signalled before we can grab the extra ref. Rather always grab the
> refcount early before we do the submission part.
> 

I think I see the race. Let me make sure I understand.

Current flow:

1. guc_exec_queue_run_job enters
2. guc_exec_queue_run_job submits job to hardware
3. job finishes on hardware
4. irq handler for job completion fires, signals job->fence, does last
   put on job->fence freeing the memory
5. guc_exec_queue_run_job takes a ref job->fence and BOOM UAF

The extra ref between steps 1/2 dropped after 5 prevents this. Is that
right?

Assuming my understanding is correct:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fbbe6a487bbb..b33f3d23a068 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -766,12 +766,15 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	bool lr = xe_exec_queue_is_lr(q);
> +	struct dma_fence *fence;
>  
>  	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>  		  exec_queue_banned(q) || exec_queue_suspended(q));
>  
>  	trace_xe_sched_job_run(job);
>  
> +	dma_fence_get(job->fence);
> +
>  	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
>  			register_exec_queue(q);
> @@ -782,12 +785,16 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  
>  	if (lr) {
>  		xe_sched_job_set_error(job, -EOPNOTSUPP);
> -		return NULL;
> +		fence = NULL;
>  	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> -		return job->fence;
> +		fence = job->fence;
>  	} else {
> -		return dma_fence_get(job->fence);
> +		fence = dma_fence_get(job->fence);
>  	}
> +
> +	dma_fence_put(job->fence);
> +
> +	return fence;
>  }
>  
>  static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> -- 
> 2.46.0
> 
