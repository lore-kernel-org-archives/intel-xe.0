Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F3CCCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 15:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3A10E2E5;
	Fri, 31 Oct 2025 15:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS0bTMCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB9A10E2E5
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761925163; x=1793461163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ynbg0+wextwCgZ5rK16cmz3tVB4ykVckdKNvgsGT1a4=;
 b=XS0bTMCtTBK0SoXO/auoLMgvxDTDtvafWXHEjuYCd3c4YYwsXmUUdcgP
 4loIi5nZnUqLAq4Vn99qQvXtwKObuj//YW6du1Pj+2Yu0mJf0/koKk+VT
 tUUnfj0QiQWdu+YXN+qi5NG8oJINI2iXJjtaR1eOdGA6UluKEuBTQhUX0
 Jn+67vjRBRBSE7GmxdgVzZvoGTQKVG6bGlbIqNTfP28IxotMgOGvk3xv7
 nRMAQNn0ERIvYupZRzaJy20dI+tjnp7dnbNcmP/SqyagM6Pir93sU2KoW
 7MvfQWJf7Ct3fKipTT7WKJD3iPyTbDCOS2p1H7l6SjJN6D/LOjup/XmEF Q==;
X-CSE-ConnectionGUID: C2ShMeJxRh27BldOUsZ5rw==
X-CSE-MsgGUID: yT2T//+gRp++ThBIrcLmUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="66701785"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="66701785"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:39:23 -0700
X-CSE-ConnectionGUID: 2yS6JRltR4GugT5OHBWapA==
X-CSE-MsgGUID: 0S7DLKRgSR6m6sBQIj9w2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="217100250"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:39:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 08:39:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 08:39:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 08:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbVWd+TCgbN3Bi1c4JnU+wxLg2nCPjMqg0/hZ+yBSpPGlSZQ/g6IDFNNn0sYugemZ5PEdfBciYGoNOQMzyolTCpmgKu1Ea7fE4d6u7sAgbaqokNnBVcTi5DUn47NVHs0CVdLtKj0VY0HJJodCgycP3J3ZWfryjoRES/II2/2hlJJcChA7UWR10r0SqMKL9QGQfHRYHhGP7z7u6HvLOkRwvy+gGwV92mVu/avBNsSEDmJb8S7VLDZynga+rZ+9b7mDZJQsequ7VSRUjY3h1K40V+v9jHpLrn6CS94GDOr6tvnGM0AF61Bq6hdwFmaS5nxoAeYkd5hdhmM6X91mD9SVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC6dhvf9sBnQiWp+CADjSK2+vVu1K5Mvy2zzM2s5CqQ=;
 b=JWa6zVPqH1IFayyaoiP93eI3Cwxrk+fl+R9kG3VHCz695G4JBc4gLEN+hF8+ek2PRZv0jcbRudoM+39tgO2JbYCsIvqZgEhooc9YSiWV4g6nbrBy27nlOE4j+cJV4S6WPNdlQkuZ4Yyeg56iQej24famMQioLdqb4ANrJM7j8NX7CAmLmoyFobIcowdegOtFpkh0mlc0exQ8pTDQwO5mHYt4vuqfdOrRs7RvvciUfloqNjYkGRTjjGiezA6b9Ey1KgcDu6poVrrPV28kQYunOidGiVQXQk/ie2zCwMid90st7OG/hHbyJBkxCwSGpRkiIO1FLy7pRrTr0ERNWSUvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 15:39:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 15:39:20 +0000
Date: Fri, 31 Oct 2025 08:39:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <aQTYJbU0qtl1CMYw@lstrano-desk.jf.intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b100f3-159c-4e1e-8a6e-08de1893a88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g6VOprhB/N/0vhQTAVNTeFsembOvT3UpOJ+PyHba3bZQa6hTEDk+C5q4BZ54?=
 =?us-ascii?Q?HAw0i3FgXbAbzbkC7vIpfrbyIWRduw8txnYnskwQS8jjbFmkF+hwMhwbAdMV?=
 =?us-ascii?Q?/zWE3AryDpYFVnQn8I2JqMe6+DQc4KKdJ2XrMuaLq4gwHjDZ/PsfXdEsxj2J?=
 =?us-ascii?Q?J4ZPHS+zRSYzWqzJ+pbzkj/ABjzUK44CwERwUCLxyxqa55Cs6OZYKvzZO5fi?=
 =?us-ascii?Q?Op/GMBkm78+ci8lhluCtU5RbVpncLAKNZzbVAiUfhK4qjcXP1dYfisuWEN7Y?=
 =?us-ascii?Q?osa8/VMIBQOxqf2SAlpz7Ehz6VqB1DD1+soBWGlW1YYIfGcU9zJTI756OGPS?=
 =?us-ascii?Q?sCHKzaGzGCWGetxnxProUuWORkG/sPrbRCYafM1bXgQVEvCygfoAtn6iiSWy?=
 =?us-ascii?Q?4MiF843rB7o+V5dE6nrEVy017DJpUGrcBHgdiSTHYeDyXgdWh/9hZN51wj8S?=
 =?us-ascii?Q?zYmp7YO0aLhgD9EStHgsX5xb7Vyak5aIvelWA2Lxhfr939KeTlcE/7LO6cQA?=
 =?us-ascii?Q?BM9bwqFodzU4djicKoaFqUy9Q9Mc1DBb1tLL/xfn3rZ4AbOSIbZWJveCpe8k?=
 =?us-ascii?Q?PN4YudFckQsH54YcvSoTcJ11Rcgg2AYYdyXTcP5j3GpVJEPHLEgW1utF/h8V?=
 =?us-ascii?Q?7Nb0io5RNoJrYwtKEaXBkFXp1YTxAc3TodqGUzWW6lx5aIeFlWVJTCLsEnXA?=
 =?us-ascii?Q?kgdmc1NSSIPG1zyFN79aJLUDz3WF/FsTvT3CJKXAioeN9IVjVLtNA8VcuQQt?=
 =?us-ascii?Q?Ths2hUOXQO//+4FU4O+qhpSaTKadzCjF9vSaOWvt5x9Yj2EtDRMUWUs8T8Fc?=
 =?us-ascii?Q?4aWU0IdYHu1mn55X3nY3F2mz/5C8J+p4bbR0ecm5yUMbTpisOnGuiR1SIAHG?=
 =?us-ascii?Q?KVGg9lQ173U3dCoBnH7c93NP5B+AEWxq4+9XCmeXym8mbBI3IFi7+jPO/ycZ?=
 =?us-ascii?Q?4Sq8tEhwVldDJD67OWKJPSTkVT+MaX6vDcCDjT1EUbvf5S1XABvSvPRar4K4?=
 =?us-ascii?Q?AVWKQYochluxb3Rm35TdIphZz3a6AQpAVFsue2+BqgKOxVQNBG9GC2JV+vmQ?=
 =?us-ascii?Q?/p+dtBKVjMKarB/P8SmiVwyks6UYNCAY5t3a753Lz+TsggSvdgDE1fDYJjUu?=
 =?us-ascii?Q?H9NS1ZafSNekgEz7cqtIn4WI7lal4WOgN7xYZH45tJx8NxFkTDQRzkLN8UdU?=
 =?us-ascii?Q?2EJNvdV+LtMhXMo6ybntKB7CKUTkcEOtIHKRmq1TeSWehtB+4JN1gVDfST5h?=
 =?us-ascii?Q?xeLFTPw62jaF22a/JuKeRgxa0UtKn8B5zZaREA/VMzaaL58vxEoyowsjDKWy?=
 =?us-ascii?Q?QMOaP0aHC6du/oeJOPREx/vTGwQI3vyCw30frVwIS9hYJEY4hH2e3x9QZKLG?=
 =?us-ascii?Q?st+7yO1wErMrjmPr9GPwdhOb7zBZF3hreE/hRt/Z0Vl5kRX0wg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mgy2bp1sCZPMJnKAaprAeLAmbnuFIVn1S35h9y3TZU3T/V88/TTBp/yMWXm?=
 =?us-ascii?Q?rJFdTcGLyupmV+sNNG2f6tN3SvF3JCrzkQDZbvda7095jXAyYHwYxbr7tzCO?=
 =?us-ascii?Q?St25QgeneCwp5JNRC6L3lbprw7vlXT9y/kLRRs7YNVZrdrs2vXJ/O0K24xMe?=
 =?us-ascii?Q?qLcoh2sJ661G4T/u4lmYgRS+CxYvpakpF0/oOQCXpa3nwSXARkI1zjITaZvr?=
 =?us-ascii?Q?qxLkcoJT0SB6cwUnK5xhbderCOGDlg2vrmkQ4bKMkWa40fayv3EJGEz+Y7A4?=
 =?us-ascii?Q?gpwy3bsKQXhQTjvVXld2tLGb5AxDy8J9Lznn6a4K95I96vqF6Kzea8xHbP89?=
 =?us-ascii?Q?hJ4r2vQkwwPxtSGVdFui/vtYoZvl0OEdRVIxJwnmY7N8WxsWz0tezM+Dwtnt?=
 =?us-ascii?Q?fGlq2+P0MC74QvSyp5FM0TTdr/4vhNJW0Q38+HR5bW30ecN/qyWUav6eDsWY?=
 =?us-ascii?Q?8FBxiChAkP2HNZgFCL0asDD19OWe78qYThhzX5MfCTBLr7IwGLpuIyei6DYt?=
 =?us-ascii?Q?8SE7Kpzb8BHskyIkrssaDlnzPwmKeNhhlNFpSozEid/9jU1UL50uCcoGMM5i?=
 =?us-ascii?Q?6QY8KF8+YiNchSRIyJIMnogMiJwuN9J6OSSWEdMd3V/DbQPoTLtLgsoWrJit?=
 =?us-ascii?Q?kBxaEA/Jebx3V5NkR5Q4veXh6HDV0BRO9h6vJ/JP0JMc4Yq4MB+p1Zphg36h?=
 =?us-ascii?Q?nqQap6rblpOLFx4vI3VAAIsVNQqbkXTLK2Nhp6I9IWCUlhU9w3AbiRf2j8l3?=
 =?us-ascii?Q?PyoJpSjBVfT9BtX6D8dQnzO9JDEl7+YoadZI6RejWu+TXB2tabvQDSsKLeQo?=
 =?us-ascii?Q?cHlNIf3xyOnrvjux+tMFJXwcbHRYDzQJxzfJKPgZ7INn6j/1fRT3W3psNN5m?=
 =?us-ascii?Q?8XCHnnl/xnaRKnKtoJn9gE3ZrytF2cYNLUEgtmC6bh48Ubppn5Z37xDwhmX5?=
 =?us-ascii?Q?lH5Npo9hsIFFktygVnQtisUka8L/8LB9ghW00oaGBBV3CYnfrqkZvYepVSLk?=
 =?us-ascii?Q?og2vsa3LBjhAwKRWgh0vq83b3r+A9/XRzjbhAxuJ6LE1CJIKk7QEKLA/At7x?=
 =?us-ascii?Q?4KtkOL8maI/EblSH9RRHPsEzomLCZbVNlZP0fvsXOM1293nL/d8x9mWWgV+y?=
 =?us-ascii?Q?46QzLwJ8hBwtJnnw8pl5VTo/JoQmjukOzxTRXegFR73oxusXmqxLhWjbMgNM?=
 =?us-ascii?Q?trelEEM7GPbj+xM7w17fg877t5ZJhMZuociUEPGhN8a060VctwtEKF/o5Q8e?=
 =?us-ascii?Q?NLH+9LW3ithNeobX/Kx3kzBdWPgS1S4vhocmb2WQiDn3x2PcZPzYUcfazlvK?=
 =?us-ascii?Q?C3xJSTObcj3cKoZ3DaIPpzHxWqVFs9ibr5D+rH9cZR0JxCQygEPw5c8+4QIJ?=
 =?us-ascii?Q?qVnLQY7Upuz/oHJigoRa+d9iz5MoRK64iHhR6He6yWridLwPX9CKSFXqi/Wz?=
 =?us-ascii?Q?VOt51rqy50M5K3SKkkmoAX3iovpl36C2Rz4CB5T0bv0H29FaKan8niHDVOt6?=
 =?us-ascii?Q?sSI/vi8LuucjPWIkvjkHHBEsa5Jws7ezCj5LK6KI8AcA+oindOHHpL1y3XAI?=
 =?us-ascii?Q?hVh2gZ/xx4zSvFYCF8UzjiUg+bf/uImjhCiy5GZ0UFofUACsp7C/EnbuF3f5?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b100f3-159c-4e1e-8a6e-08de1893a88d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 15:39:20.3429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RpTNvGfc42tK4H4Q4Iexv6eX0Hl+AspGn9189iwmiJTwdEHUSWkL5ZDXDUjZ3SfbtaW7HyPIZw4N1vUB5wrKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
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

On Thu, Oct 30, 2025 at 08:41:24PM +0530, Balasubramani Vivekanandan wrote:
> When unbinding wait for any GT reset in progress to complete. Unbinding
> will release the mmio mapping but mmio operations are performed during
> GT reset causing Kernel panic.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
> v2:
>  - Use the managed resource release function to wait for GT reset during
>    unbind (Lucas)
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 89808b33d0a8..d0f8c40bc51e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -607,6 +607,8 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> +	disable_work_sync(&gt->reset.worker);

We recently made a change [1] so if GT reset worker is queued it holds a PM ref.

So if disable_work_sync returns true [2], I think a PM ref needs to be dropped here.

Matt

[1] https://patchwork.freedesktop.org/patch/682622/?series=156292&rev=1
[2] https://elixir.bootlin.com/linux/v6.17.6/source/kernel/workqueue.c#L4471

>
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  
> -- 
> 2.43.0
> 
