Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC6EB3641
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 23:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662F10E5EC;
	Mon,  2 Mar 2026 23:10:16 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E435B10E5EC
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772493011; x=1804029011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MO0X5B5UXk1Hm3h9t1KHLs71bp1GgfPyUUxvrphsmIY=;
 b=eqQwGkl5Z3IruNK5JFeUp2eU57o2zVf8tpBgOeIXVGqWoxtUM43eBAqk
 4Tj/XcJ6TFNddvSjRFAVjE0ZQW/EJSYXR8A3vxfxuH9Ge0sWjFtEN2Cnl
 OLHfkbZk5zLHQmtF0ZOpr26fVa0/3EtbFpCPaV8sdoTmGY8idrf1Qo4qL
 MAQw3jeJAMu3aYrR7eTWAF9pReOSNeeJPzofwFuu1fgaS+BgET/Nd6o65
 pyDm1qTYF5ds2TxJBX3nm0NimGmlWS042/AT7ltXGpaNQtcG3AOsBGphD
 UrDcc3Ie5kT6RnQ7xc3le7kNrM+6Z9btd+RiQJ2CgNeyi8OYcoChcp1mo w==;
X-CSE-ConnectionGUID: RsX4g8GySX2yfkR9PbkrSA==
X-CSE-MsgGUID: XLvKTONJSw2nPUakn4G5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="98988250"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="98988250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 15:09:58 -0800
X-CSE-ConnectionGUID: Pm6sO7c3Qwed/pqRc4LvOw==
X-CSE-MsgGUID: I8Qw+kRITBaH4RnNefccgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215768138"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 15:09:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 15:09:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 15:09:50 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 15:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YclXpY6a5VN/d7mmiJhow3qv8fH8ROh6vfU47xc0NSxLesprPOyQm0S7NaQ4YqnL6e/W/NGm7/KQ13Z6DPPdkNO2JWS6IwSis/8cM79/95y6I5jSdYm+H5Rq3XtQvJ0RBGxHlj4sfTIKmuXCTmks3nMQiBSbIl+o39yvyKjINoIUEKSX9BzJ9F7H2vzOKgqJu7UAHaxAZj4hrBibQWeIn7jY94PGOiBuIiRtEOKVs/hwWZITbMwjBIFLwTt8DgmJoz4l7u7koBB6bapnZQU/Di2y1lA5usPK5RTV1prsXp8F0sjd1RdJt03jyxpmceLb1MjZOe4jv58FhoEd05Bp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AdpL3MYc7rhyNABtmyE8k/fEjk7LF3LcxxKTzVJgmo=;
 b=TxsaxNJwTB6nh6T3p8GbXhVyXFsbp1ZJozdtp4YZG3F+EQ52bw4o3o0TF6fnvhFoYD6GYHEdDSZ3mh2qok3/z/OlvyAWhBbLxmBQn/i8xzj1ob9cFFIdS0z3LzgUAVKC7mpmH+vnHNy+OwJQvxM9JR+3xHE+yKR1q/zO6g/1fIN6/k1D0BTBp/ID5D7CPhRPDuVtlyHNGma4D7qKh2Csd3eBqwdytjmk1BIuNLWtx57kKpn3y8s5FWesrsYUxvG/6nvcommGogvm+oowQmNW/XzkFRlbgOJrAmDiMSb58plT+1nJzoqI98QGXGYkU9az0okGBAGjj8nT2MPhx7IFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Mon, 2 Mar
 2026 23:09:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 23:09:44 +0000
Date: Mon, 2 Mar 2026 15:09:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe/multi_queue: Fix error path skipping group xa
 cleanup
Message-ID: <aaYYtVox5lyayXH6@lstrano-desk.jf.intel.com>
References: <20260302212447.208218-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260302212447.208218-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f83df4-5357-45d8-a3e8-08de78b0caab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: mq8Z45+V84KXCfypyndty/CDweWj+3zsWcCZroaPxft40cLe//WuWFbF4rxs8ex2nuXCz6BuR4T507cktn1A8LVKd40LLDjOlzUXMcATa0XC6WH+hNYTE3pv1sEcQwBc2fSGIWSIg0XqJ7esCf9QXKVNMNOBS/kXyRRobOGRvDfCgCGD1qMoIvks2dLG9JzWfMewIfBY8boIK+g3l+qcrkmzhPVG0SgNCLdRznHSXNjaQQbWBF22wcwsN/7y+aheB4A8PNWwymz2sMSKq2NNu89VCYsr9DyESxGNMDM0tpUTedAb4vhZRXHSK+AaMF49fs82NudaQbeYXnaNu9Jd0ODViKXW6xzNYg6YJslPoNjgXDBsqp4mXdV9T5O8fGhcidLkMogvHlSrUznLpH+CsHruvIDzgAR4VldPr6R/CF6H4sGr9PBimqJVFUNztwvCu+d9YP9zy2eA4iNk8QuWiB4+UO+NUUr1VYbBLOV4LjcLKu+QBNHoDtta52NNDM+FxeV/GbygRPkXAUOl/hiKq5RpVgQrqmcMRg8nFdzrQqVUGd/SgPy0XFhB4FlYw/H4nJv22OXIVFI0zDshhuM9PFpHyBvogjqI3C6sejxSQBUmfl6RvTwGrHOjoH2bqzV2xuMWDHA6Er5dJt36FB+gpO1mUPxcdc96xJPeSTh5b3kJH/EMS4pTX7oQez4dsQ7L3a1sKDQFX7xp5DGuW512zwyBqtbB0JjgUvJktB//bm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i3K5Y8qB1AC3XyKjuRO5IiWbxKe/nJ288R7rVZ5njD3V8padTNq4TjQvm3am?=
 =?us-ascii?Q?esHL0AKW1tuWCtuJv5Yxob8+i3eaCO5GOFYwhNL7/WKr0L3hBFfOfa5qwIT/?=
 =?us-ascii?Q?fa42qk0bP8N8BrlNO/vdBpVSWUJA4hO3ZoCJyofMkKtAP46r9S3HFfWGv1wA?=
 =?us-ascii?Q?id1a3DjFWcJAv89HPvBjd2eDmpK6nKsqCdbDVplJow8eKavJLZRXWAem1mvW?=
 =?us-ascii?Q?GyO6BEPiO7f2Qs2d0OF/E9Yunc2P+JH/l+dj+RBwJCxOKY06NHfog4yTT3VU?=
 =?us-ascii?Q?qiahkx8v1yRcSoXasnMHUaC8YMeqIKNrLuOOmbD5aOQupuQAsB7T76XZMcqI?=
 =?us-ascii?Q?ZM++78bwKXM/fEV0vqtABzNgtTOI6rEq/jrLtXI0Sed7KpKBPJAp6FtsgPW1?=
 =?us-ascii?Q?0ZLkGATdXt6g4A7UrVIS2RnpJXvQsikTqK6eMUgZRpdWTTka+zhMvE/SclpN?=
 =?us-ascii?Q?p0kFzHRJD7TVJVELaL9SWzR7elUC68KDt8I8uV1/2SlmPgQo/7/mlqegqfYU?=
 =?us-ascii?Q?XPwfLWfEs49+TBxxoiJL166Ks4XsmaK5KEKhsqb/G1QkE5plS4p5FiD/zaai?=
 =?us-ascii?Q?QXSD2uu+HZWhTYKZv8Gzct5whA4N6CWFnm0v7eF8CkywG67+CBKk383k1OZV?=
 =?us-ascii?Q?0ZbRmLIOsse1JMa4hN7RJgA19pJ7bAdWSjwXq1Kqhf44NkmkAtCpqn3mt5fP?=
 =?us-ascii?Q?5UdOOZ8q7O7/6/R7BPm5ZiJEaycz0ueE5qWEdDrGrKGKUAyMULnFbgFACgwu?=
 =?us-ascii?Q?lCCfRJHsDna0qX25s/5xKipAUAg6oFDArzSNPE4EBqhhwMnGH0cHBTMiRZOI?=
 =?us-ascii?Q?qi/czFHR+eJccMZoaWLUH4wyBQ2qkLlfvFsLTN8A85kxx/OjyTAjEFBxXGi1?=
 =?us-ascii?Q?Qpi9P/u1vuWCCzovIC+SYSC+spykRN2VQmiWXA/zc2W5/EZ73uzuHxgzaX4/?=
 =?us-ascii?Q?5Tdr06FL5SMIE81fnvplAFY/8ziR32mpZrGeg6G0inpg45btAMva/ty1NEoi?=
 =?us-ascii?Q?fjnN5QWWwC0dnHwAVCN/Ip0GRUzI60UHQtyYA4g+UFaxI5WxuYgge/2PPL46?=
 =?us-ascii?Q?GapKCtqr1d00ksPNOxqyasGiw3T0fLfgeByK7Z5COz5+qAOgyfHl9TMoMimh?=
 =?us-ascii?Q?vIDIhne/cS365qywsWWoGL+8EKWjJobbw26runCJ67xibDIYMHfz4zVqAk+q?=
 =?us-ascii?Q?bvQc36dEv4lxGxP/rPJWLpfMcIiy/bZaTb0qwrv5O5gUR5A0g7Zj+qTZrzLn?=
 =?us-ascii?Q?/sPJp2gs0sdqjxhhUfu4DLI9c+yj7JrkV9WeH3sm/ZIO0QWRCphVi0U51v2p?=
 =?us-ascii?Q?0BEDcjQ7dQ6kDrR//CgrFbynjB2yVjN0dqSUDnY/9ArNFvIw/8ii5r5owpca?=
 =?us-ascii?Q?alk/cWGrvT8uQyv1u1GVsRj4TfDmdU6mPsS4f9F27MLMPQoc5qH+w6aM2cSt?=
 =?us-ascii?Q?EBqLU9CAz4VBhQBSwyqs4fH5FY2pZDz8ZOLM0WGGxCcJrkXQ17rNqs0g9IqD?=
 =?us-ascii?Q?jm+51DGrIBK4RwYJD4ap0jeWJiD5ayxSyKHxqD90lHj3HicXHVQjbDcqeFt5?=
 =?us-ascii?Q?b9AHJ28ZaYAqyIR+y4fT06N+xArv7M5MJvAFkT4TXYRw7eb7WNFQeenTdk1d?=
 =?us-ascii?Q?tO7svwHpXI8kljBX9hu6xP3NzdnMdeOEH7/ctn+CQBJlrgEkE1AXv2h+vpXz?=
 =?us-ascii?Q?JLO7gfXfu7jQwhP2PBe65TeP1/FgSUUVQJnCBIOQ42PXrLr/wyOb2kmmpF9N?=
 =?us-ascii?Q?Sycze8tvK1AVJwpt7hjMs7AhDetNe+I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f83df4-5357-45d8-a3e8-08de78b0caab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 23:09:44.4472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSfJqZIaCV/okr0eZy1bpwxqFnv3WO2/c8C0KvcaerG+rx8zCrSgLPQZyGlPvghB5GsHEmVdx30uAYz2Ji4ycg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
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

On Mon, Mar 02, 2026 at 09:24:47PM +0000, Shuicheng Lin wrote:
> When xe_hw_engine_group_add_exec_queue() fails for a secondary
> multi-queue queue, the error path jumped directly to put_exec_queue,
> bypassing the delete_queue_group label.  This left the LRC reference
> inserted by xe_exec_queue_group_add() sitting in the group's xarray
> until the primary queue is eventually destroyed.
> 
> Jump to delete_queue_group instead so that xe_exec_queue_group_delete()
> is called and the xarray entry is properly removed.
> 
> Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1a7a4a37bbc6..fbe3ac399cae 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1298,7 +1298,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (q->vm && q->hwe->hw_engine_group) {
>  			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
>  			if (err)
> -				goto put_exec_queue;
> +				goto delete_queue_group;

This entire killup is questionable at best but the label you want here
is 'kill_exec_queue' as that step will undo the
'xe_vm_add_compute_exec_queue' step.

Matt

>  		}
>  	}
>  
> -- 
> 2.34.1
> 
