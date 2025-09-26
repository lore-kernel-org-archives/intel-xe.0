Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0CCAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 19:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5C10EAD6;
	Fri, 26 Sep 2025 19:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5dp5+BS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961A110EAD6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758914037; x=1790450037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dr7GXFsk3oErtZ54aTlm1HwK0sB6p+An6sR6TSNoPrg=;
 b=A5dp5+BSjCYJP/910tYryDIow07yZa0vb3zh/VvYt5I+ON2hnwGVKdcB
 ynUB9qLKxWAF8HZwSpyUIlYJWQo3TXNhoucnZue/OI/K+pFez4sQIebAg
 M4+thozaRMFU6KpBQfpn9CN0BbNA6qSQRF6wgrR3+p7kzN89sF4PjNmrO
 OIto8gXMFznQzOjUoAVWerU6iRYVIlois7Ydyq6sJS4FqcL9AcjJchFRZ
 inQ73J8cFfTlnejz7E6Xa2XsABewKQqLETyRq+kwWnHSfiMa9JW7jvNl6
 lbzMC1w3wxiTzrHxc4R0N0U7LVQOA1GMh3ZSvvh3yL462qhk17+2Z0vJu g==;
X-CSE-ConnectionGUID: NMNPQNl8QuqkCnRexEGFZA==
X-CSE-MsgGUID: zUhDdacmQZC6jKGL5MoOmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86697365"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="86697365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:13:57 -0700
X-CSE-ConnectionGUID: 6RrSj9rNSw+i88wQ5q3Hhg==
X-CSE-MsgGUID: E5vYhDnkQbi7fFiQUt+s5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="181992575"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:13:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:13:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 12:13:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwGAM3OMe3Igfl19qEYWGt4L+yMI1d+/PP4UFM9SOqg5VA/gsP2QHY6K9eVUDAr3n0CL8h32mk5Y/h3qYrM4n8P4Utu+4IUrIjXXeGVAKzuo3rDNInEAwqShwFGcyoEVPvOwFpongDJKWxIxw9ggsnQa5UFcbd/gzSpef26tQgrPhtHjuY16RDi2B23Rzt9zpNnDicBLrBhGAhi3k31PnzazgviNjyK2ivwI87v+wTq0EULfxhAGsgfHRl+jUV96zYDuuCheIaTtghygmQYen70kutSsSjQ5Vw+ICVJ1QNMYBA1jWJuqH+agba594i1B4+6DAaDLTMz2whW4GCSDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omsra7ztvqv3OMTCwL9r7Y/GYcNB43hA7DyEuNLtfvw=;
 b=zVVARsu2ExjLaaa/eJcJHqskEdUTh7SHufYlf37LCqx2tH+yGF0HHyon5B/hxVkzCSQ/Z+et2lxjRn9Ly0nSvj6HpfrPxO0/BhueJ4XkwjJpkxQhNLun5u5YzuhghuHGt4KUKAd19TgbHiZWy4RCzSHIsFn7Ib1ukwN2TB1F/jhI0TTLvEt5GkyWwiEERCgj9YOV8e3n8qrKeSmJIxAwT+tiD4s+WgEf7Bhq3sihOZmdN9RXqweoD441ELSIvMTJy9jclxNMgvyg+kvWBww2zimi0/6pyNwoqr9DWMf8gy5qtEB4fNj30E2dke7u4GIgZs6OmzRmJRixYZRVvEBlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 19:13:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 19:13:51 +0000
Date: Fri, 26 Sep 2025 12:13:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 16/34] drm/xe/vf: Teardown VF post migration worker on
 driver unload
Message-ID: <aNbl7fPKHCU56/xn@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-17-matthew.brost@intel.com>
 <04bfb230-94e6-43a5-a7f4-cb48652552dc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <04bfb230-94e6-43a5-a7f4-cb48652552dc@intel.com>
X-ClientProxiedBy: MW3PR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:303:2a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: c84d3a23-d5aa-4148-b9dc-08ddfd30d427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XFza87GFbnD1FDh+4mXYlB29pY5rcWfRe5y4nBEt6nkx+BEVzguVTm30hdtV?=
 =?us-ascii?Q?kvWn6TTipNltOl9wP0y/iu/mCZYW4Zlyvl+52MS53pORR9mnDHXyDjUVa4Rg?=
 =?us-ascii?Q?N58oKDg5j6B8cS4dUo6FfnC02z3eljHpjPw/Wz3K7pNp/K4cjTnpi08GZ6Zf?=
 =?us-ascii?Q?o/TpO/bYY3as+CN0/Wrok5t8RPJQAhUQbnljhfjQt2Q+P3UN0hmmd07x6sza?=
 =?us-ascii?Q?JzNyHciYmenoK+8nKQRSoq3NpN54eMV92/BMkJxuLcyzGJbkDMJdEU6+DkfE?=
 =?us-ascii?Q?CgoqUvD8eqow+adpdteAbtUdrKA0R6QDxDWE7I7ED5AJwU2+cBMfiJnpm69D?=
 =?us-ascii?Q?I8M76PCPvq8jMd10hdjBaKlw/yiC8aaYLeN58zzyczoEouk4fx5Yuvn1lf9r?=
 =?us-ascii?Q?FQ475Gd5Hq+bFfe+1bMP8dwg//HkTKqJvo4JEzHeXx/dO/WCepKt0XgFAtLG?=
 =?us-ascii?Q?YJzbWtPNakhP+m1qgQqKUCt6xZWBYSopYjY/u5Qubee4aiZCU4csQG0HLo8r?=
 =?us-ascii?Q?XAdpu5Pn5RnScR40myugKuFM/0mVVyrg+vDz3p+DWU2TUa/HuduM1Qoxv8h6?=
 =?us-ascii?Q?8nUP8GH7kEkGbptfDB1nsYbXebqZs9hpFLF+ZfFGV/Ygqd8e7m+R0UQWAqwn?=
 =?us-ascii?Q?XpfyW+uzc1Lm5hqfFNlnDl98mg6Z3I8d8h51e0fB6fDTsrTl1Sw1+GsjDtO9?=
 =?us-ascii?Q?kbJme6nUMzvkMVkn2Zt04/GMrWbdjisZhE6DsrFPRKJLyjwaEE0L3uktAgEa?=
 =?us-ascii?Q?BDCYBMnBtDL1bWguzN70dhStzcKijdd3VoSHKBlM8tMIJHHsU/Gr59IVlwoT?=
 =?us-ascii?Q?ZYtZuMwOe0iDFNKdogO/bvCFVmH3L2l5uFSKjvd42TkngoQg/rJWjKwx7K30?=
 =?us-ascii?Q?2SkMsHiNSz59m7dyjcqIQLDA0yBvF+vW2xGizAwh42uprTc8mzM8LEiOPkpm?=
 =?us-ascii?Q?LxMC2Tz9ubRpsNLKdiqexOUJGU/+p6vcuJRqI6jaj4ZMf7jHc4G1mx1EKTrz?=
 =?us-ascii?Q?ZvU2AnaSR/yZiJXOuuo5y9JJIuyiVLdpqpZevw3riuP8x0M5omE9HNc2UMEN?=
 =?us-ascii?Q?0tx27YvLT/vchvJIUCcofVpk8dxWro+NwwNofDQ69iKL6o/vwTz7hzTf+azQ?=
 =?us-ascii?Q?iQynjh0Ml17fjIqyZk4DpUrVKw92yMHWrQgPAqYgQ+/lovouvofHL5o9ZFnh?=
 =?us-ascii?Q?7Gr/o0gLCXzO0BlfQRcpcCsdndF6dJs0mdVakydLPZRrBfJKZZ5xh02Y/WmD?=
 =?us-ascii?Q?KPVg/kF51HR/UQP2cxrpj2LQjM1Sf887/Sr/P4xIMzTy1dFE3OfvZ2XhWVaH?=
 =?us-ascii?Q?nzTOP39q55x2tj9Z4mwfBVVnK39aCWsw9wCGJW+plCaVt27wweYNQoXvKEDQ?=
 =?us-ascii?Q?gWeZTP4TX0rbjszjTtUWU85od7Vn8j25s0YB9UFydFlfqm7NwArr26GJPLG7?=
 =?us-ascii?Q?wMwYoOtJPbkX+sCgwhSiq+ojU/uDxT2d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJfMNzzEygC7sjr31mUW3mLxUsyZWkd18ZRLzJfxWMg9r1uqm88SeBjSLjzu?=
 =?us-ascii?Q?7Dot3eT07pV/ekJEVd/NPxi3iM+3Pvbvn/O+rDXeET+uXtjWUaeklpGpKtuO?=
 =?us-ascii?Q?KqZgLr6BZchvTam0P3ioL6G2RkVH+fvb9/h304gOJRhTfpVEBsFM8tPNwP6i?=
 =?us-ascii?Q?W9nZJesKjpHRSPSQ17fso+OXx0XXtHcRsfJ0ImGba/tPKxWkxs2vTu5KrPCw?=
 =?us-ascii?Q?tYe8pZrFiwdCYg2qPL4nljFwJ11Nwa7N7KAavEAmApebYcYQx8VAef/E0hHn?=
 =?us-ascii?Q?8SlAvCF578vt78gyODw18bk5w3AdSkWMjQMAhh3XsHBq/Qiw3snb+m4jCx64?=
 =?us-ascii?Q?wPwVJ122vwGXhS4B/oBZI0PJqIXI/u17LayYujYrbfqoP61/MXrVL0/7WwzE?=
 =?us-ascii?Q?nZzgOtPv6qddwdL6yZ2iv1s3KSck/XAEpXTHhcvzmVsQEkBxPo1pcf1nic1I?=
 =?us-ascii?Q?ijkx/V4MOCNLHLgZAzFyD2KuX0RfNdWNmVTMqExQgNlpQRfwik4IMYDnlTkv?=
 =?us-ascii?Q?dKPlS0fTyBz/xYk4Yur4eZoVkkn03SkaLKE25QLMy/urwicFrYm1tRz8cZWd?=
 =?us-ascii?Q?TAMybnphGMzFzuz++OkVfX5RUHGo517ggPjvj+GRYrUI4qA/62OCleTH6lqC?=
 =?us-ascii?Q?mfCtpwwsNj2q6rA+3a+ixAwC4iDyIUAHT+bjRHvix6dx4yo+qHJj4eBc5LP8?=
 =?us-ascii?Q?wc/llOSnwKVmmxyxDZIkzgJWYIBjDL4hCHsJj6VV4Aj7zZAox8/dFjpKRDAd?=
 =?us-ascii?Q?uNzrMCihYTO+UQtZVj9daCERw6v2hZe0wG2nVcrIsg8w0vAU9rnB8vIZbF77?=
 =?us-ascii?Q?ACATCJCXHvci26U/KfDq4wCMZaAZLXi4Z5jU0nX66Wa7TEpuRHsNijpLyjGz?=
 =?us-ascii?Q?dzmw2z71BUzOL1cYiOexe8czs0oPATn8iWir10AN0FKmeRnp3mPS11cNOd4K?=
 =?us-ascii?Q?idX0pGUJ/UxNjcWOImPgH+gcIxyRa9kBY0nYRGnVhiq+M4972uiGbSldd8ey?=
 =?us-ascii?Q?JPcP/G7b5+0Bc0ym1X0H3VHaPUzQBk2TOkVJ1x4yZMWdno+l/z3eu6w6C7gS?=
 =?us-ascii?Q?UzdcdP+2+bCy6bYvSBLkVXVHVHhtFUrUAGpC/MRBC4RFLuIyVDG0FHDq4qBe?=
 =?us-ascii?Q?BaVPXEedKgXuhoALfbtHWsECrj6weZuRs9pYOVFok4znMUNpdKW0rnW+/1Ub?=
 =?us-ascii?Q?jhjgUS0EmD+bZGmiRbaP6rYsOqbSiamyh+P/oV6Py7zhAuHXq6XyRJdLgf8L?=
 =?us-ascii?Q?ggP9t464N0UTDEcDQ6W3DouxqHcmTGCOo5cBnAi4W+Qp7kJjWAvMoh9YNy8Q?=
 =?us-ascii?Q?+T5ioxvAKFhwrs2QdbzJsAKIA5JbrGlMXldJHEeb2vluI+BcTw/cCUT2wsM6?=
 =?us-ascii?Q?a2xhEkhHkR8QhxPo7yQyicqsdIu/VeH5iZrMb9c/qS7pl97BT79ZRGzYowl1?=
 =?us-ascii?Q?KsOT2Zp93xyrg3Qjt+4cQGxmsAJ9IkefVOw4rCYaxCWQgnqfrlhHn2d03TFJ?=
 =?us-ascii?Q?amvfarB9yKUmmn4erQWQE4zzL6lxuY/ANVS2bl2uGBMO5kYa+J7siLtuiL4U?=
 =?us-ascii?Q?pnIdQCFQx2YGOao2YBVwX5YTk+E9yEqqhzBnoRdUNveZ2eCRgbP0QcWk00oQ?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c84d3a23-d5aa-4148-b9dc-08ddfd30d427
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:13:51.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rq/ucjcUUFmPaoxKJaSN4Z7nEoXdm/5TLfcjCb4+M8OhiD+L2fyTnERHXnPEX7KQpOIM5uBc1IVweJbbz83UeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
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

On Fri, Sep 26, 2025 at 05:40:17PM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Be cautious and ensure the VF post-migration worker is not running
> > during driver unload.
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 +++++++++++++++--
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++-
> >   2 files changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 807fdced0228..4eaffad6ebcf 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -811,7 +811,8 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
> >   	spin_lock(&gt->sriov.vf.migration.lock);
> > -	if (!gt->sriov.vf.migration.recovery_queued) {
> > +	if (!gt->sriov.vf.migration.recovery_queued ||
> > +	    !gt->sriov.vf.migration.recovery_teardown) {
> 
> We're registering `vf_migration_fini` very early in the init. That means it
> will be called very late. With that in mind, is it even possible to hit?
> 
> During `xe_gt_sriov_vf_migration_init_early`, interrupts are not enabled
> yet. Doesn't that mean they are disabled already when vf_migration_fini is
> called?
> 
> Both ggtt_fini_early and guc_submit_fini should be finished by then; so if
> the recovery was running, it already crashed or errored out at this point.
> 
> So, maybe register the fini later? We need to `init` before IRQs are
> enabled, but for `fini` - it should be before `exec_queue_lookup` is torn
> down.

Yea, most this a bit later is probably a better idea. Let me look at
that.

Matt

> 
> -Tomasz
> 
> >   		gt->sriov.vf.migration.recovery_queued = true;
> >   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > @@ -1280,6 +1281,17 @@ static void migration_worker_func(struct work_struct *w)
> >   	vf_post_migration_recovery(gt);
> >   }
> > +static void vf_migration_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_gt *gt = arg;
> > +
> > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > +	gt->sriov.vf.migration.recovery_teardown = true;
> > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > +
> > +	cancel_work_sync(&gt->sriov.vf.migration.worker);
> > +}
> > +
> >   /**
> >    * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
> >    * @gt: the &xe_gt
> > @@ -1308,7 +1320,8 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> >   	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> >   		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
> > -	return 0;
> > +	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm,
> > +					vf_migration_fini, gt);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 61484c7c9a36..beb9978336bb 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
> >   struct xe_gt_sriov_vf_migration {
> >   	/** @migration: VF migration recovery worker */
> >   	struct work_struct worker;
> > -	/** @lock: Protects recovery_queued */
> > +	/** @lock: Protects recovery_queued, teardown */
> >   	spinlock_t lock;
> >   	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
> >   	void *lrc_wa_bb;
> > +	/** @recovery_teardown: VF post migration recovery is being torn down */
> > +	bool recovery_teardown;
> >   	/** @recovery_queued: VF post migration recovery in queued */
> >   	bool recovery_queued;
> >   	/** @recovery_inprogress: VF post migration recovery in progress */
