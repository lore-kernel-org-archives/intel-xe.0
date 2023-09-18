Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F90C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 04:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619710E0AB;
	Mon, 18 Sep 2023 04:53:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B93410E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695012833; x=1726548833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cPgu7tAEdU0gNjDlhAcVpcL7gzPeRh2biAXBt5Z+M+4=;
 b=lLxB1tZW5VedELsmdKMnLXqmvfa39dEgytIwnDKxZU/Onjuz6spfe1Ex
 Gl/ZY8PCuVsTValZW+XrpPLr0UEyyhFAw12cuEbWaboMxfJ0rbJq8w7qd
 Ek9QRmZ6QzDzIkONqODXd6t/jAHJG2yMprmkBkE2NiCpoSYYz87FHa8S1
 97zgRkcoGMdDF1fVDXDOqFB0YxnOQTzpt8vLZhIWNYzbjZWZfw8lP3Jj/
 72fFyNq65FIpf79oPXG0QhU4Naz8E0wLxbV+r3GL0/wq5Q3GxxpeTQcLi
 ELFODNhuxIxa/dPVlJfLrrg4Hd5Twg4v8X63HoJbf8syK63vJMKrmmp9e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359818477"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="359818477"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 21:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="722334768"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="722334768"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2023 21:53:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:53:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:53:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 21:53:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 21:53:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZ8AwO25wT3J6TxOch2ZxqlURRQuZYJa4b1AhOfqUHUFUSuw1UH3mY0Px9voCp1O/xpxmm2KAFvDWBTC7PwgLOI08rS1GBTDZb2QOl1ko4DEC5NWpAw00K+4aLW2SfX4B67mLzU3WCUA49hTIxoCVIVViG70rsXGpiUJXf7DnGN7kOFj0Q19RLEa/DcFN2IyBcFN+0IKYlJs4fY8YasJvipyLjNqqJ2qwoA2baznIyBC8Jyt5AyY/Nm+xUASBiG5N+TH2N/XaP89oZ5lsGt14+JfFahWhCrC5GuZwLC4XKvT2+DiOZ+L3C/FotpFCy3svKm3fjSnzXldVHob1IYnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNAw3t1Xs8sXdBTkg97L6qGd33v9MOHkoknC1/eP/JQ=;
 b=ffB7j1RLItBz6HFGiQhksLESprT/ORfpDqNDD+pcnb2Bn9ufDjVkSOM1or/HSxUxR+sY+gFaytxjeKecxC0wqitcQ0GFoFHTb93nyTI0gYDapGCv+mTyGLS0PXdl2F7S8H2PAXGWdXobdYgwK/qbWeTCaC2lJshqmkNl7OglFsYeLf1P0ad7WIL6gA2QqAxMXNEARrCLLORWgS/FEJj8a5Eq88BDFbj1Pf3/Gta0czfM/f1TzkuVhcq78ksAdAQJ1fyIe49g0vjA8JsL858Ht8JlXozHT5Dygi6BEPEJwt/wJIUWaJrPfDCHEdVgil4Tvvo3dT0QPSu/wVf4fxvFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 04:53:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 04:53:44 +0000
Date: Sun, 17 Sep 2023 21:53:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQfX1VGjfQk1/D6z@nvishwa1-DESK>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
 <20230915233445.2241554-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915233445.2241554-3-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e6460d-1a8a-4d35-01d4-08dbb8033c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwcINa4swpT87PRwmMvPVvgI8esGdEbo941P51Lps7xCVvxFcrgWaIYL7yp0XymxNFxE3XPd5GDd3YCyuXxLSaXLh4QOx4Xg/ljSWOo5ucsorG/UVfIrSEflPp6Po72C8ez8xQz2OD2ynGySKysnTOj+f1ZbajrQ2br2fJGJlKZYYG7xNjq13FgshUBXtT8hg1uGyGUnrcCyM40tWiM/u8DkX1U0BI9YT+X/UBDmmKdFeFh2HmeF3m+zeDy82cviFUgDb2vcKwVllCfXwdWtgU6UHL5dYWHZnumyGTW+2g+8EGZycfFtmncm/3CZmfPiBrHagSlkF3u9epV5/9NDrtdSHEzCsZv2Xc5M9219MP1caWLjMLH6ZCYmKM+hTo+RMzgv3V0q5FwnJAI8Z5H6OYYHlO5UJ/CHMy18IF5MSrQNuKWBk2POLNnPEpa2q3BOzePP7D1JE9XNO9HStJlk33xBrIUnP0graNroIGf7p/DLmYiiawMEJ3eioPGWyC61/p/6HC2tlsoP33eKFtnrs5rOHGTSNP4Jfet2+CvIoEhuWIv7ycQ0YjHG7V6TzEV1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(86362001)(38100700002)(82960400001)(26005)(2906002)(9686003)(6512007)(83380400001)(478600001)(5660300002)(8676002)(6862004)(4326008)(6636002)(316002)(8936002)(41300700001)(33716001)(44832011)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTYtSW/8KeykdcKkYTs0ANd92nmlElx2HRXm0oe+7y1Zu7Mpq2qUYU4Ci7JC?=
 =?us-ascii?Q?3W/w0QeVi6O5zrf2n+RZnzaSPH7/yj5Zn0LqgSa60d4KQtWy2fEIr3GNpcdX?=
 =?us-ascii?Q?DH6VY2ghjONE19m+ocbLnnu2X5tl/PhsmBkbnjk4dxxeQSndXPEGP7xp7QSa?=
 =?us-ascii?Q?68RurrKwNvqtDW9iMxd5WnpbrE4xGM2GMqIbp3qaAd7WZy2oorDgJ8mhWtV8?=
 =?us-ascii?Q?dg1KhpHJq9q+zccjezgHKwC3jKt0paz+pWam21R90rL6IGZq9NiylYbD6uI+?=
 =?us-ascii?Q?7QbaJDEogQeKMVAcg/3yFzOYk5HZV9aJop9OGJJn3E0Xh4AQuxUb4GxV5D2o?=
 =?us-ascii?Q?BmA7oe/8F/rk8dA08kzSGF+SSEBRR3Pftnt9LFd1y5ccKPJXEqEBwDez85+c?=
 =?us-ascii?Q?mm89VlPYPuZg5zYyUE9F4YnEqYk4WIcRcJfESeezFVg5g6XkLTtLEsQxAttl?=
 =?us-ascii?Q?v/mEEPsem6rYT8RQODTWn8H96SOB2UWEgXHilJgA7vS4RFyQl0861c+0iV1U?=
 =?us-ascii?Q?URqxnFsD5S52GvA05Nt0HheFidgRLKEL5QqlB+fdihEwy8YNu2/9ltKwCFkh?=
 =?us-ascii?Q?stPMTQGWJkbtkpVzbQJdODa/aHjOX72snVrjjjBoAC8DtHpXwQsw4P8Bhoyz?=
 =?us-ascii?Q?RoGrTQ76W5RP0SbhsVVj+InD13a0SZmkd2bQ7YJoiIL820MXb2JYsTbjijk3?=
 =?us-ascii?Q?E27Uvy33I6bWZd4oLLl9nwAfdJON48irooZ8h12KqGb2iMSZwqonppEJfX3J?=
 =?us-ascii?Q?B4zJaip+0wN/b2M2pAACJSpY0GlO+T9gb9aKG5ok0e8AV10sb9zEYtsNrNhh?=
 =?us-ascii?Q?XpXwXJE+tesWINb+oWmqH6kguWpnY48WM55UhzomxZVyQ3Kt09njTLvC9tBg?=
 =?us-ascii?Q?XFZmNFS3v//w9MRmYw1RGaO5CtiZcwBcSzojbIWXfVjxTJY5Qb2c7EXZpije?=
 =?us-ascii?Q?FyGAZjQgY62AmRq3TDCU9zrzCuBlaWxZjlmO9jz5ELPTQ7F8lG9xPpbtKk1F?=
 =?us-ascii?Q?w19b2i7M9fsYESSJmQPDDI44uTMD9rxNOQyQCqaNNH7IbU+VXzaIjsdhZ8wF?=
 =?us-ascii?Q?g8F9C2PqkeQpmlpa5+QfeNXOoAj6iJkhciyzlKiTdaGBpHc2lbuWZ215iECj?=
 =?us-ascii?Q?t19DV91fsEUXDVVKCjYbGXfGv75SsO0ZGJ6iLgxNlhqtmv9EyWU41fC9Eq5y?=
 =?us-ascii?Q?cm87W9RloZzBUIWojUIt9puXPW3a6yefxWkiCXCXstkchV6hg3O93Vn0+VCQ?=
 =?us-ascii?Q?xM1mBODpzjTO8x4tmO38zDzx7c0X5kdlaFFhxnhh2dy/wdDf89x3w1wjRiiM?=
 =?us-ascii?Q?8LfIREwn6FdeCYlnCFlOz2qK7kyj9jVnitSJIoQuTDyOlXU30wFMjf/HhvsE?=
 =?us-ascii?Q?0pGn+ZK16sqq2bsN+E66qWbvzNCKVyHjjuU7jCbgpJm4oB0zMWu8T8Pc+YjV?=
 =?us-ascii?Q?sy2RVNic7Lzzg5ukMEwGgWguNDyJFsYiWhBDyTXbwHUX5ZqS2hjbkB0+E4Xf?=
 =?us-ascii?Q?8h7Wx5gXOEtjpj3l+jkbXjrfKKOxduVnwxb45V+T5xgR3yCar/f4r4fBut+Z?=
 =?us-ascii?Q?hedfvaopZAY/VbaVXdpgEBEv9dkf88VVXiD54ZnsefhWa0lhMXOiAZGDBmh1?=
 =?us-ascii?Q?LYuU9iZ9nd6cA+cprIhAZx8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e6460d-1a8a-4d35-01d4-08dbb8033c9d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 04:53:44.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXKxDRCzxi/PgfFSIEWo9qOEMn7pw/xIVn75Gy89Y90Tx1EerARuVyzUFLWpLp6NVblcz1tDiPibXSeQe42wTouLNfrEir9Pt2cUVF/ZnuV+aM3TdFuUY9LXEj/AoOhj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/4] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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

On Fri, Sep 15, 2023 at 04:34:43PM -0700, Matthew Brost wrote:
>We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
>uAPI, deprecate the implementation first by making
>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP. After removal of
>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE the proper is simply inherented
>from the VM.
>

s/proper/property/
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>v2:
> - Update commit message with explaination of removal (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
> 2 files changed, 16 insertions(+), 47 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index eee64ba87d50..93d2f0591c34 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
> 				       u64 value, bool create)
> {
>-	if (XE_IOCTL_DBG(xe, !create))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
>-		return -EINVAL;
>-
>-	if (value) {
>-		struct xe_vm *vm = q->vm;
>-		int err;
>-
>-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>-			return -EOPNOTSUPP;
>-
>-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
>-			return -EOPNOTSUPP;
>-
>-		if (XE_IOCTL_DBG(xe, q->width != 1))
>-			return -EINVAL;
>-
>-		q->compute.context = dma_fence_context_alloc(1);
>-		spin_lock_init(&q->compute.lock);
>-
>-		err = xe_vm_add_compute_exec_queue(vm, q);
>-		if (XE_IOCTL_DBG(xe, err))
>-			return err;
>-
>-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
>-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>-	}
>-
> 	return 0;
> }
>
>@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
> 	if (XE_IOCTL_DBG(xe, !create))
> 		return -EINVAL;
>
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> 		return -EINVAL;
>
> 	if (value)
>@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		xe_vm_put(vm);
> 		if (IS_ERR(q))
> 			return PTR_ERR(q);
>+
>+		if (xe_vm_in_compute_mode(vm)) {
>+			q->compute.context = dma_fence_context_alloc(1);
>+			spin_lock_init(&q->compute.lock);
>+
>+			err = xe_vm_add_compute_exec_queue(vm, q);
>+			if (XE_IOCTL_DBG(xe, err))
>+				goto put_exec_queue;
>+		}
> 	}
>
> 	if (args->extensions) {
> 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> 		if (XE_IOCTL_DBG(xe, err))
>-			goto put_exec_queue;
>-	}
>-
>-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
>-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
>-		err = -EOPNOTSUPP;
>-		goto put_exec_queue;
>+			goto kill_exec_queue;
> 	}
>
> 	q->persistent.xef = xef;
>@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> 	mutex_unlock(&xef->exec_queue.lock);
> 	if (err)
>-		goto put_exec_queue;
>+		goto kill_exec_queue;
>
> 	args->exec_queue_id = id;
>
> 	return 0;
>
>-put_exec_queue:
>+kill_exec_queue:
> 	xe_exec_queue_kill(q);
>+put_exec_queue:
> 	xe_exec_queue_put(q);
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 347d28442701..f73b9e80b25a 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -60,12 +60,10 @@ struct xe_exec_queue {
> #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> /* queue keeps running pending jobs after destroy ioctl */
> #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
>-/* queue for use with compute VMs */
>-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
> /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
>-#define EXEC_QUEUE_FLAG_VM			BIT(5)
>+#define EXEC_QUEUE_FLAG_VM			BIT(4)
> /* child of VM queue for multi-tile VM jobs */
>-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
>+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>
> 	/**
> 	 * @flags: flags for this exec queue, should statically setup aside from ban
>-- 
>2.34.1
>
