Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4014DEB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 14:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0923C10E010;
	Thu, 22 Jun 2023 14:59:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08E10E010
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687445942; x=1718981942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UCoOPq3ZGTtw2qrtTASww4tqx6MLC7d2NmTzX4E2zrA=;
 b=PameH/QJtr6gbNdvQywhEkntJNx63WobNG7yYguuDL8cBYJ3edW8JSgy
 1Swr2Ws4Fme3bJtHPb4a1dg8OLKw0G+dz1OPfoOZq0kwua0zVF8lJOPT/
 k/PObpIEiwbLA38ghpU0hYXRLj3wqVIRusnWXPLTK5TrqX5HU/3puvDx+
 IQtcjGbOwgAmWtJoG4+zbn0u5fbqUDCbZ9d4EhOuCTtx1aZhJP/a4svYs
 2cePvAmKaSshAf0jgC6XRIdswBJKgqVh+Niqg83P3XrerYvuhXw2OMTH2
 iPFrSQlqCjFakKtJdJiraF7ZTUsTd+kN9kr+QWOrQE73oU3EHACf8od55 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="345262726"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="345262726"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 07:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="889081373"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="889081373"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 22 Jun 2023 07:59:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 07:59:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 07:59:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 07:59:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 07:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDTAjdaWGo8Fd6atv6wKaS36hoJDPEPZ7NUQK6Jb80PEjpSKoncBuYM/tLUKXmHxiRmBFOieOpqScA9cT0K3mOSNEQQrfNMoRQ+bhl0FTzgTSeUl0bZ/vVtEfvd2H5GMg48pX7MYVLn9WDrJjKpsG+99Ihi6Bv9KUlrKNGpXz+HKXmYjrEryJrpf63RLQ67qUhqT9bh0xmnMuSqRcz8m66vuYjF3L5zU5DFgaSEwZUmiNoCfB5w5KwGT2F7782hcb/Gs4vc+/RYrBzU+0crctvKoZxWNGW0B63edk3RAzhBStMX62O4CYoZhY93Qy+XR7vZCY47LdtGDyQSTPx2JIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbGyprSIuHzMAyELjpBWL63aTbMXK7nboJIfCciSLVM=;
 b=if9cpGxAy7jnALxNo1lPBnJFdtkWXSpy4syYfeNv5aFzlvuyzTokjglxNukojiyXUpNdzo5uDsL75phC8Gok47wzigEx1cF2Mp+yM26mfyiKw83ROja4wCAVnCcuYTiEwtsz2+I7PuqKrUFF7+0FoPIpbUkM41/PeIrqB5lqKApb7m5KRGBS7k4n26Apc0FbfgPDxIgCAv2OUey3F/PoLKrXi5mMgn1qR+FdFLfCWAl90vWIjQ1T5+tfHV136VGKZxxOdZhxOzuC01KVmrDgaN+CNFrv9krjZOis/QD4wswD78xz4knmDvzb4lzLGicFbkxOl6Kb5ekAfrcXuQv7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BL1PR11MB5349.namprd11.prod.outlook.com (2603:10b6:208:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:58:58 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 14:58:58 +0000
Date: Thu, 22 Jun 2023 16:58:50 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZJRhqoXCUm9IJkuE@fdugast-desk.home>
References: <20230615092643.3399572-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230615092643.3399572-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BL1PR11MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c28d14-d562-4d70-1dd7-08db733134d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iODHPUZlvt3VXyrQaDaD5ZcBazuNBCpCfZLLY4YhvrZprHySwR5ds2wN+j1OkQJlx4QvFuozsqO88q0yKIEUBC9UCF8ShMu0exV0kSrH09TmdC4z2RK5QFVXHZMJhUvn4v1+40vFspQI+Cr0IMjmvYv0sgneF97zV4XJsBD5RIleX+X23cKoT/caUe7AjKZzuwFgF5fN/36qvrTYj+0krOXim0fDUTujj+tt0ia3s1ZajyFgKb3sEzi1nB/xeHjh0i0XWWf0Y1jokrn+Fw51E0fW/4dBQUtbAX1cCYyVjQwY3Wts6Kdrmja65sca7zcSWcAejk4OSxtYcewxPjO1rfrDIhWuy0nXI3H/g8Wvmslq0WynYky05R7YGZfn5MOc6oRXMjv7YxUdzn0XpBKxZeLNP4M1/1cwgR8YACD4RIKRvVACBrFOgZyCyzNHYGM8vDcX4jzEHPKnsWN/bgn2yc2p/nWmKyKb4DDyDm5IzYc6H0Loka/Xp9AZGEDNFRrVpf6hMtRaVoy2ytqtOmLhuxyPYBwg5nMfXIQDtcQYfbPg92ujPpM5aOpiUNG/BhP+Mylw/p7I0GbcBpEnf4YGQHABtIPmtRUjxRC66Hs5urs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199021)(44832011)(9686003)(6666004)(26005)(6512007)(5660300002)(186003)(82960400001)(36916002)(6506007)(478600001)(6862004)(38100700002)(107886003)(2906002)(8936002)(8676002)(41300700001)(66556008)(66946007)(66476007)(54906003)(36756003)(6486002)(316002)(83380400001)(6636002)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WoQae//5GBPhFMNpPKzcycWKaVnV/ddoxah6wruiy3647aWvgVGfslY1pl6m?=
 =?us-ascii?Q?CVrXaG6fKMZiS+uAF/cu5OVj81yqW1ecGyBetxfwUXEUXeVh2wPgc+EKY1As?=
 =?us-ascii?Q?N7v0dzsq18iluSGpOUZF9i9wF8V8hYm+12TCcZKVuBjV8X53hQZ0EPH+3BqQ?=
 =?us-ascii?Q?WSVBnOpYkl5Qh96SD5IjogH+a79fctXlc6JzLYQCUEzDaWsSR8bOY8w2mE9b?=
 =?us-ascii?Q?0Yms4KzVnQqmY7+5jzK47D3T3x1Ma7iqRBvxmqZHHNY2BulEsGJ6vosztggV?=
 =?us-ascii?Q?g6FWE/oiz67baXntNTUtYN6GW0Z5kLGe++qH5+lIw7ZZdZn6/G5LmECJ4s6z?=
 =?us-ascii?Q?o5gX4Z3sJ3cc/IOqtvvw8WtoNXb9lFb523xwI5hWYffbp2e2684k1CnIqflI?=
 =?us-ascii?Q?ccUSitAiPicZIC+xMmdQqfX2npCHZg9o5ezSgCTUvraaN/fnVp9QsWs3W3Te?=
 =?us-ascii?Q?PqfE4jdltiLeweRB6WOmOQh56bgk96uB4fPuZyyCuhwXZ013CqqCpz8rHs4q?=
 =?us-ascii?Q?H191Y62dYCuskZ4Po/iP5vge+RrftXsyS8470Hp/RwvF0VISeC9ANZ92w/ws?=
 =?us-ascii?Q?5XhDZHpwasljgORUc9p6AHM//lepCnw14CUOwAjyIHqkglylMoUZtHHpauod?=
 =?us-ascii?Q?NP0tpu+TA/IiikrUOgOckdotisygj9+2BN1wqQdqMFHt9p2NnSUgKkwiw12W?=
 =?us-ascii?Q?HRsGRnikh1/f6JZ850jGfAEAYDzp5qmQXsfOCYs/TOcImQ0+vKSE6bqq7qCn?=
 =?us-ascii?Q?FdAnnN7tmRV/YrpIt4v8pTCE7vtCA46wdRyZG8fAwidbEEWODB+A9Y65HsN6?=
 =?us-ascii?Q?+CdlOPY6ksxiEzYnTEEuOjRAGuCI6j5g+l+KtsxxIv7Tx1bg7p7ztixGf/kc?=
 =?us-ascii?Q?KEkGZkEDhycSN3AybSFDrF6oi3iFxNA5rOkhVe5BMBvrGHJ+4bYtWFLiVjJA?=
 =?us-ascii?Q?jwHFQ/yOCjfjAxKmDsfOLNWbKs/8YyAFP65AaZ6EsRdPmJ+FPbRF01UWF0yR?=
 =?us-ascii?Q?3sKzTm7TWQjlkbyCnziV0IdYWuwbfGqJrohKOKdffi9GUr3o/GJc1uRMPdxP?=
 =?us-ascii?Q?qw5e0JFjxymBS2iqwc58FM7AM2pn0GjlZwSBLHlGwX+DFIZ29Qo2z3uC34zw?=
 =?us-ascii?Q?mGY0EgOPeu/583shBqJemB6JxPKSBt9wLg3W4N0B/rq4iwJ+ooguZqLP4TS0?=
 =?us-ascii?Q?qc9X9GYyI1xCr6ReltHtmgCgPAosdKmIZWOyFTVgr1e6P4s6Rk9Nr2sNWw1O?=
 =?us-ascii?Q?Yl1A4JTI6dswbY2zhQMOqUePXeVlXaJavIaQWh5rs1KNPkB/vUYcsRObyALi?=
 =?us-ascii?Q?L7gUT2xAuMx+gUg/hDFSaYDGzeCWYqaIL9lzK1NRoQRk82NoUBLH0kxjRnLQ?=
 =?us-ascii?Q?lX7qYNzwnwSngVibg89jIpuWfd1P+5i1/iYDo1wpSTkJSbL9BDEIOtx9tTFd?=
 =?us-ascii?Q?3SAVRd+Rk7crd5DzcqEaMBtPLgUGPIGMeiGrJDx9ZQewKdn38YJeN3cIRi5o?=
 =?us-ascii?Q?CcJlx0asABGCE5WIcvb52Ef+rjgTGj2T5REQR9pqWxwJitgQGxSQ63nwz/78?=
 =?us-ascii?Q?y9/sbKYVb9hQa/jlcpPmDo9OvN9rfTH67kLdFT48/ByaQ57EBK2uEMxDFKLM?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c28d14-d562-4d70-1dd7-08db733134d4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:58:58.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odwpRbi2h/LfV1W6mx7Z8Vbcaef727B7CX8XqsAh8WJojl6YF1DFtSexpdA/mOe6771Vv+VPiCkCwr4iXRUmIUbF6/dy8xdrshkzC/HzW/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5349
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 02:56:43PM +0530, Himal Prasad Ghimiray wrote:
> In case of gt reset failure, KMD notifies userspace about failure
> via uevent. To validate this notification we need to ensure gt
> reset fails and there is no mechanism to cause failure from hardware.
> Hence added a debugfs which will cause fake reset failure.
> 
> v1(Rodrigo)
> - Change the variable to fake_reset_failure_in_progress.
> - Drop usage of READ_ONCE and WRITE_ONCE.
> - Follow consistency for variable assignment. Either use
>   functions for all the assignments or don't use for any.
> 
> v2
> - Add description for variable.
> - Define xe_fake_reset(gt) function in xe_gt.c to set the
>   fake_reset_failure_in_progress.
> - No need to explicitly initialize the fake_reset_failure_in_progress
>   as false. (Rodrigo)
> - Return proper error code in case of fake reset. (Bala)
> 
> v3
> - Move gt reset worker call to xe_fake_reset(gt) which ensures
> fake reset goes through even in GT suspend state. (Aravind)
> 
> v4
> -Clear whitespaces.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h         |  2 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
>  4 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2458397ce8af..086317a4d91a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -497,10 +497,24 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +void xe_gt_fake_reset(struct xe_gt *gt)
> +{
> +	gt->reset.fake_reset_failure_in_progress = true;
> +	xe_gt_info(gt, "Fake reset queued\n");
> +	queue_work(gt->ordered_wq, &gt->reset.worker);
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
>  
> +	if (gt->reset.fake_reset_failure_in_progress) {
> +		err = -ECANCELED;
> +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> +		gt->reset.fake_reset_failure_in_progress = false;
> +		goto err_cancelled;
> +	}
> +
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
> @@ -543,6 +557,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> +err_cancelled:
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));

Not a big issue but the goto label is misleading as cancellation != failure.

>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 21d9044088de..22afae04fa3c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -24,6 +24,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +void xe_gt_fake_reset(struct xe_gt *gt);
> +void xe_gt_migrate_wait(struct xe_gt *gt);

This one is not needed, please remove it.

Francois

>  void xe_gt_sanitize(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b5a5538ae630..8d888153c477 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -138,6 +138,14 @@ static int workarounds(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int fake_reset_failure(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +
> +	xe_gt_fake_reset(gt);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -147,6 +155,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
>  	{"workarounds", workarounds, 0},
> +	{"fake_reset_failure", fake_reset_failure, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 99ab7ec99ccd..0b6e1df3ca36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -141,6 +141,11 @@ struct xe_gt {
>  
>  	/** @reset: state for GT resets */
>  	struct {
> +		/**
> +		 * @fake_reset_failure_in_progress: A bool to indicate a fake reset
> +		 * failure has been triggered
> +		 */
> +		bool fake_reset_failure_in_progress;
>  		/**
>  		 * @worker: work so GT resets can done async allowing to reset
>  		 * code to safely flush all code paths
> -- 
> 2.25.1
> 
