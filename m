Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CF7C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 14:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2216210E5D2;
	Thu,  8 Jun 2023 14:54:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5089810E5D2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686236096; x=1717772096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=12/SY5JvbRmvLYiv11yDgpnZLT40jj6e/YgJ1Dnv+ow=;
 b=kJNuF7GNxAVBfpV+7qte+v/W8n3ByM6dHMGRHTWj8ocGVKQD+xNwY/lB
 I2+B+X2PBQUC2gUeWx9mztvTQ8x+hG6ma2x5m4XCquUI3KOmNb1qLzqI8
 zUw3FAyYbxCcYOVPiDASPZCCFI+muTtMDJth9BPer9Fw/SYYC9AxKhOhb
 o3SU3Nlas6uHQuIuLLomumlWoQ1FqwUEKTBjVflr0UhTFHDo8rLK5HgQt
 zZKXUWyd7KBLZfdJjcvS2pLJSh/VAOJH4AL044ADeQfMsZImOtv1RhEQ2
 /0pgDrXV+GJoMPflWFod3vqWsf8LbH2MaWS5/JSKthJBLui+3lkqj8zNQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360675188"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="360675188"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713143402"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="713143402"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 07:54:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 07:54:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 07:54:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 07:54:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANnfj4li+bMK6P7HuxrCm1wE9guCGIyzUdaZ5nZCK06wnrQyXahqYhExXnQOQ3poSDCfb5wMg5mxG8ZZtjpKLa8uVCWT1kLP8J8ghy/afNR8CudH57CJdu7Y2wSiPHuyBEvx2VSEJxp2+n6zowxcLRI15P04XH4BU2te8sajEqpLhWnOkoP2udAoddJJ9woC7kgeitdaDqICatMIeCg6tThX9/3Krbd0WLz3UH/94GMQtuSZfuKNSo1YXhhNE5mf/x7w6FoJrwrn/2DNxQJeaKqJXpYIVURnAlmWchZQPOlO+5MqRqBc6gniimTbLTrZNgDm0uoZZ55pvtUzlcgLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qdgucy+/m4ms6cejYZe63MNMbTOYK1Kf53EMA0vd6so=;
 b=loDzmSlaEBC+ZVHVSfXYTadvONMmFOXEHxdZRIlj1++6xGjzdhougR7VT/p02RPQZ1vy8SmAGPZB5PyTR1xfxp6Fy9G0MVvFHjTe1uvrNyryHSg4mwQRh4xu3/ezOfhzs7nYzH2QGAXOnwYPOQdV4oKz//xBLFdidx0bp+zwHkkeDPEMWN0EHDf8VVxL/c3dh6g7we2lvS93nERL9iTu7239fnUgY4d3vHj3bUFOzAVH8ORCpzu1SUBSEVT8SSc6uBlTQAqsSUlpD068vCrjq/YFEK+3lVT3BfHFBDGnVXUecjlGS1LvK/g6NusMB52UtVdXyqHfUTTF4Q5eUZ320w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 14:54:54 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 14:54:54 +0000
Date: Thu, 8 Jun 2023 16:54:44 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZIHrtMEgVRgzv6jr@fdugast-desk.home>
References: <20230529123310.2677564-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230529123310.2677564-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 1094c173-6af6-4b46-1d73-08db68305164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lkX7qXG/xHSsg66fpGNjEJHUQ+R1iAbPBzxYOm9tfugE/+L0T6VYiYpzhrDn4JjlXXtbxjd8uDcT7mOGIXFFOq6EwvDCOz7jO+2MjA40TU3uS/G9Et2EleStJ2WZfynV99sdOqbpOhBx14F95jKdcH86wsA/KSnWcLDqAY9OMJgJ+Lq6l2shJWgDQuIR9Fg9dagC6Fmt65lEknOmgT7N1NznFsyJFcD8X5eJQ0vBUFtDpf/X4p25eBJSLVKc4pmYpq0/jyfnq1G0OYyhbzmriojv4s4PVBsE7MOeJpRQUDfZsSUd6jF9d39RWHSpdUWs3gL8hxme7qRT/C/XbZ6StsNfxa+qOcTyKninss2hXa4ol7dGfjRnvsW7g2/o2mnilbebFTK8DINnU8a02jwhaL9F/REue7gRwKZhWD/KwnOjVI/r23M2J+FzqnaZ1n1h85/lWYPbgvwai+9mFOR0OH0bmm5/aJFlWpuzbzLqWeZ+C1uCyKpuW4r+S7Z6CwEk83N9miBWH6rPh2SEo81QDhOru75mDaS52p+WXIe42ylNEp9Rg+paTeGZLa806I0G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(44832011)(66946007)(66556008)(66476007)(4326008)(41300700001)(38100700002)(5660300002)(316002)(6636002)(6862004)(8676002)(8936002)(86362001)(36756003)(2906002)(6486002)(36916002)(26005)(6506007)(6512007)(9686003)(107886003)(83380400001)(186003)(6666004)(478600001)(82960400001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVX/fVGLnLpv74aeKwzIzg6suIF8kc8v2qOjmTP5Hi+eUkK/1xps/xQFDpQM?=
 =?us-ascii?Q?qOFf+aKcFtOKcSFP9cDVSKc0UPE4d2dLelFU9/7tYXM3Mq0G/OSs683Go5b9?=
 =?us-ascii?Q?rnslWYPzktB2lzoLqWUTMSCnKdCol78NCFPHlMY1n4Xw/4OtxqgqwBMAg70o?=
 =?us-ascii?Q?MdhWXo78rnmpzCX/B/CDbLp/w0vWTAds5HebbSmM/sMAbNSFAHXnq0dORdaw?=
 =?us-ascii?Q?GauNop5N1eYe8SZZQ1vU8fZOoPU7PzdYOutyEckmWlaSBntB7zLOqbMevjbk?=
 =?us-ascii?Q?eFNXvl8J4mX3FwCN3R5yz8/ipjAuwo75Jgs0iOTlrQBFBLVc8vwXmh8xgwkp?=
 =?us-ascii?Q?QGg/OD0Qt4Ii+IrvNPLhqAJ8u0LgkV9VNhpz8JDAwhCwpPjbAJbPOuIREp9Y?=
 =?us-ascii?Q?veu8+ZsGTNhvi2t+bpgwpVVIjl5JUbwukPaqJM8OrSsPUtCQXG9T8509NkJz?=
 =?us-ascii?Q?9OhLelr+IA96F7+wJo5QUo4rpYxnUwP3ZP+uSezw243REAzp+HZnth42YTXN?=
 =?us-ascii?Q?LkowACdm65bUMyc1LqtsmDjEHNbN52fru/P32tfUGPJZHhzBwQbeKS/lgZhF?=
 =?us-ascii?Q?/rarCnjbSw9ue9Cen3y/ppJyysjZ/Kfdf39Hb5ha1BiNkNcDHQMMIBsOShCD?=
 =?us-ascii?Q?2sfhHJ7FVIUa12oTAKqBcvSiCf/x0zw7DpTQpRqqdNs/5R5ymZ+XrHPXwFio?=
 =?us-ascii?Q?aVKXAIPyG3jH37sWKrrtS3JFV23AQsoSNI+JgxZrEfxQVQIZqNqsXAQs4TFS?=
 =?us-ascii?Q?532HRuLmTVXbzGbo5EpcLMmnxw8gLVSTnw2PcYjV57rhA63KFft/3iEfSaks?=
 =?us-ascii?Q?wS9MD6sZwRxIvVOvP4A8Ed67z0rDbHFMG2n8jSxB+Yu2G3Si++lkRtyX5sPx?=
 =?us-ascii?Q?jzYi66Wmgoyv+S2ofKab/HoyKj+HUmiSe5GV9qxhkmSoAminEjDRtAX2fvPJ?=
 =?us-ascii?Q?a6IE7ff3UtE8bYkcXY5USzFJBfz/6lWt7AfuFI/B8cKA3++ISnjiDpf1uUyU?=
 =?us-ascii?Q?KkDTL+l1DkXy7EOb+fcn7PicrlFSAwBcYeij6eX70DPHRMT3+pmNm9he19c7?=
 =?us-ascii?Q?qCGDbYOJb0ktQ9B7/I/lxNiopZXSotUOyRfYoQdVTdSAMngHJgTrCP+hgr3I?=
 =?us-ascii?Q?ekMbAN03Xr8jAB/r/Ztt7tQa7tk9iVpLiP+3ofcdLARC0CJRpIlhpUigzhsU?=
 =?us-ascii?Q?4f3WZphMSqE9KoCttDvUfGnT1nZuPVpXo92ud0ZEOMOqy9QW2MtgLGvIxkBX?=
 =?us-ascii?Q?CXmCqp+lajFTboKn5vu2OmmfEBuRBd0jBgCgOc7CAXVyVqh5RYUHWzXnJh54?=
 =?us-ascii?Q?l2v/dhLJ/xORzcrrubSBR8q5XHEGNEE3NLEPfVkrMji2QMzhDQ3k4vgDYMFj?=
 =?us-ascii?Q?dO6I7h87J1FShxq1jjD7DwJtCm28T4VbPKPkmOBROmgqQsKJVGzwpGmRhtJo?=
 =?us-ascii?Q?cvIzLyJ1imHHDUcvlxpmj9x64Ouqp+Hj4Aw8UGvEryM52ZAOmTX9upJsFIg3?=
 =?us-ascii?Q?6OzWPO0+4YGsU+JJ93CO20NSbTCwHPAwFdRBNTXNMGOXC8qxNiHPLp+k1Rq+?=
 =?us-ascii?Q?lKyBJ9HiHgD+IzHqKylNGrQUPn/L51nyKoe6Uq76jH77BCtUxrfCj0Ujrg5O?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1094c173-6af6-4b46-1d73-08db68305164
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 14:54:53.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKcAyDmfwd2iQtHGmvASonzpU2NR8PRKh9njnKRd8LvbbqqnZ+0fOQKOqF2HfH9QJOhJTptfaAhmUuVi354kCqDU52+R3nPEHqMm1gGYPXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
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

On Mon, May 29, 2023 at 06:03:10PM +0530, Himal Prasad Ghimiray wrote:
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
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Rodrigo's comments were addressed. This debugfs will be moved to
danger_debugfs_list when available. LGTM.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h         |  1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 18eda5b1377f..626d5e9f0520 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -596,6 +596,11 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +void xe_gt_fake_reset(struct xe_gt *gt)
> +{
> +	gt->reset.fake_reset_failure_in_progress = true;
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
> @@ -609,6 +614,14 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_gt_sanitize(gt);
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	if (gt->reset.fake_reset_failure_in_progress) {
> +		err = -ECANCELED;
> +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> +		gt->reset.fake_reset_failure_in_progress = false;
> +		goto err_msg;
> +	}
> +
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 086369f7ee6d..2031008aa57f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -25,6 +25,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +void xe_gt_fake_reset(struct xe_gt *gt);
>  void xe_gt_migrate_wait(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 339ecd5fad9b..cf2896858d36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -138,6 +138,16 @@ static int workarounds(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int fake_reset_failure(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +
> +	xe_gt_fake_reset(gt);
> +	xe_gt_reset_async(gt);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -147,6 +157,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
>  	{"workarounds", workarounds, 0},
> +	{"fake_reset_failure", fake_reset_failure, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index b83c834e7ced..3e0e9ad4f0c3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -168,6 +168,11 @@ struct xe_gt {
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
