Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AA5C67861
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 18:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F3910E532;
	Sat,  6 Apr 2024 18:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8kzCRP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27D310E532
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712427884; x=1743963884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S1Z3cmzOqGB1ZZM6y+PlNXezyQq47YdVkOXjedhbGx4=;
 b=b8kzCRP1G9jia+EIBySmJP51Gh1+G3tfGHPyhoLFd8tUfd66hQ+bhUAX
 +yitG4BYVgOPocxLDl++OTaikimBVQoITGjfaKmEqOfMwZc8o4nKx2qyF
 FVbH7usOnzDtk6NYbupH12YaH8idXuFpmrt8WRNM/WiUMk0NGDfPJacEe
 BlqNmvq2ZQhjYf6W3ZvamB/iqvWRDWK0o5TVtiNBnPDK8ylb3YGLOpLcy
 q6TFoYQ4MJxYaAFGWig8OohFxpuqXaDD0mSwRTQq8JYEFx16hGn/zzh1Z
 WHbzh4XfPKq2wECNPORc98MD1hIU42D3pcPFdn3V22VhMEyVsxCrn2LAL Q==;
X-CSE-ConnectionGUID: jYd0/3mSRG6Fsf0hmTSRdQ==
X-CSE-MsgGUID: 9NGrgaRXSrKN+2zKwF7MPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7926995"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7926995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 11:24:43 -0700
X-CSE-ConnectionGUID: NZZ/8szzT+WBZQTWYslTkw==
X-CSE-MsgGUID: VhHYyQWsSCyX34eJVzXQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="56948046"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2024 11:24:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 6 Apr 2024 11:24:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 6 Apr 2024 11:24:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 6 Apr 2024 11:24:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 6 Apr 2024 11:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0vo3/q4ukuS5Q6iHhP8cToJl8aKgEM4b1M8f0XXZTHwUDcbMPJBVOCBvkPLHhW04jjdNqdl19JWpgySTR+NfDyRFzlbg2v9HYc78xPjqDKLuGrB19HliVKDsM2/qGKWpXrgRcoobvG7KP74/v2pQanu0oYPPs0JtVjd6f/iOefBGyiIbSJ7cwEgLYysNEMPlGAO7AUPpKCAFV5She+miOvoWxhwXomru0+MCNHipcY93l0B5yyYxC2qfOJKITPjzpiMwldJuP3vavG0RwW1+4EeG8tHG4x30x4UPXER76IC+uhjZNp1g9QgNg7/glH7deCfpEdFiHl33rhJhl6MFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DExfGwf6zMIh0BCPAzlEecxKZlvY2in93/TJl0Mjdk=;
 b=A2J3KvqUWPSfJZ16D7emgm+woV+CtGMQqdCCFFHHC3ZdwkAOMgrr9FDudF/MVTa0Op+8DrvnJSBzYRhpwH282/umnGyJ5RC5PcXXaSpwuu3aGYBQjft4LAPF3+KeGfI5FWBwttZHTV0Jl+Pk65ASm5dl1OqmXK+/nKf10rgMJVoh8JWnJo+buWM2R32Yt160xtsM7XOCi9MaSFnvRG67BpktcCzO/O08M8h7+aiDQV6bAeqZGgBNQ0yzFIrsGUr+Ehfs4IWg2H87QbMWmt/19bMjmHTxyJGHi9BVq2t09ELZA2GJMiUC45ynOJg7Yy5TyfulofwfsPvX5EtHjj/3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Sat, 6 Apr
 2024 18:24:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 18:24:36 +0000
Date: Sat, 6 Apr 2024 18:23:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Use drm_device-managed version of
 mutex_init()
Message-ID: <ZhGTI3/n2GzyV8Iw@DUT025-TGLU.fm.intel.com>
References: <20240406143946.979-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240406143946.979-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6092:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /WWG3uFp94rahb+sbrGyAlVIBuPIcODa6fUomBgN9uU+ngBEGd5CKNLYiRbirX799VZcW9Fn5A71nGc6wBJ/cBXd7lvVqXiD2oJpUNQuOxSkrHt2ddyc7F6Kwote49joH2WMaJcrTxIqkGBWVndJGJay2Jc4tFEdkTicE7A6Z4k0dr/Lt8VCtqpCgXZ/J/INBg1Nyg24MZWAW1E+G+ONrtpEuLz1wJr/e1RN+rUejWkpUZPO1b41ymUAvG41A/cXS81e28A/Js2MqLTYd4GJvtJjfOdP8yhy33IVo9JaDe/bdMYivh2oG0OkNKKIwH+h0HQ/sDJYQJN+wsJ2fmMIvXuAsNHD3VB8/djtf/cdE+ttnHT6qrAcM0tU2QSvOW95IeeRXvJdgCImKI+GZivvRtsNxdCR0PevxXakPjS2b5ct/W0E3kt28uFDJA6lBTdkqTlYn132Jqn+MFkIGZ2uKdOcdvTP4VEVO77q3HjWfnyWpPcpTKc3GrfdOHN4HdNyl6LCCd/KI1cfDX+Tn0hTdkyxZkLk+IZSe+1xIVkGSAwC7jedArzqCLPHMem4WfZ/ALz5RTyicXuPdNO9Tp7O6FPHKZTU/WE6mVdesTI0iS45OGn2D/NzN0oOVm7/jfpR0P5a+Ve/8rvrB83aciAc2sO7J+aoPyi8ZHSWr+McWrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pmMx+0lwtVGOaO4UpLZ20LWK25/gzEKsoFh5bq5f0LnBz0d68U+7sCE9BRUA?=
 =?us-ascii?Q?Eont9FcMSXtWQ8NWnKieC19tZEdhenhj3mw5TRwc8nN8NtO2QnxZKlczPFiK?=
 =?us-ascii?Q?5bfjzGwS6xpTSoM/WMedi746xjWYqSqRY9R6qDqg6IZQNByfe5MvoZtlRoJw?=
 =?us-ascii?Q?03r1eKLACxxZjMLtKLenqnjnAugL5i6lZlM+475VkkKtc65NPAAcmvwgjwd9?=
 =?us-ascii?Q?U8i91eD46WjjDKN4UtWNQWw0d3xHfaoAEFjuqJ229LQuKQle2v9pfCFhd0AK?=
 =?us-ascii?Q?rTeqorTjrcWUFe+wzQ1L0RMzfmsKCptvS5zrMjOdOwVvPjqYPGHZJnOKYpoM?=
 =?us-ascii?Q?Fj2Hn2irCf8UMuYaDqJfBNYUHNzxfd9BsVh0dLiS9hspmNoIQz7dQjPk48nY?=
 =?us-ascii?Q?0UyV6+TVWgU1ot/n48aqEMoF3L56tF664nXXnvUkQA06ExpTHAhe6bQyWF33?=
 =?us-ascii?Q?hwp36mYGrIVS56Y0SX2JARdjzO4Ivk7BiL/JWA9NNaz12MbqIno1mVLs8K4Y?=
 =?us-ascii?Q?PbXQ63B2KnAkzV88Fox2tCsRGCd4tleWtuZshxg80RnkV7aE1eYmjtMxda1R?=
 =?us-ascii?Q?qErOkMbHtSwThAynAjrG7HInoGFtXzeJm7avqdsvxlNsHLsR/+bdkorvvbsO?=
 =?us-ascii?Q?vo6Cyj7GKWeRgnwYMZ5LVTv5mQpvTrcl8KMwdJm9me9bIg69ZA2AxzVDQynz?=
 =?us-ascii?Q?CilaoDUZn3kejWxKMwvSd3eKej1i/XOCXs/54qIgAmexv6Geol6JUt68Tn1p?=
 =?us-ascii?Q?4YoWC5dh9+qK+3RfWAiTlpxsr86iBw8L6wbuib7eGqK0qzTwAOeaUJjIfMm0?=
 =?us-ascii?Q?WLax7YGDN5Krc1ymMCgE3Wm76SjXJMg/hj2gnnw1L/7DsYDIeHgwxLbb3bAh?=
 =?us-ascii?Q?BI6KoVbe0gIH5uwH5VBSk/I6WaaUGLVVR7PbGK/iRf2VitUlllR8pKalRqk7?=
 =?us-ascii?Q?1+Uv2Bc3+ZcteUZadTP3l5GrowMiXmj2R5sQ+uSZ7cI69W/Sprszp8LHu8tH?=
 =?us-ascii?Q?T34b+4ZsA3CWs4Js46RIylul6yGF2GtfFaA5XAkn8jNDDArBNIdFazHRelHr?=
 =?us-ascii?Q?2YCATfOVJWM3GO0LMq25FGTk+28FgC4dYHX3/+KQ38G8uK3/RHjc9bRUr8XL?=
 =?us-ascii?Q?+Gi2oByQHyMnHlWREA+3ZvKQzLx1hrke0V5mHdHiENOBVd/NCzqMuCx0wqV0?=
 =?us-ascii?Q?c+rP7hoRP0Pob6/zpshuAHFivsFhC/ZBmNS8kCnoQTIyyCMzj3xJG0HXcLZj?=
 =?us-ascii?Q?PUV3jQe7vWraP/YGlD89PJwHw1VCcoofxvmfzPe+nr1zdr2AqqZxisVvFBew?=
 =?us-ascii?Q?9zXHJEUWswgbZBqDoPFcajl0D5QRFFIPmQ/Zer2RgyKp5XkWzyZgzR5/qh9E?=
 =?us-ascii?Q?yVOW/S5vApOf9LVRJvR+VwcHA2NpA8z74TqWQM/1oq+Anvt9tsvvf531IW3K?=
 =?us-ascii?Q?wLcRQ8Yx90Z3K3vSvymBrbvuPW3+EIj8nmDag6SbMFhOyXVrQQ/1CGqLuCuO?=
 =?us-ascii?Q?64XloWhmzrz2JnxHUmEggsDmnxEb/1Eq0rgZOj8+c/17QDm9NN7t72kQqAJP?=
 =?us-ascii?Q?52gNkR425erD2dMS1GYvPJqtYdDG27V45aTGrvlXYI+OenQXdfhveIHi7T2a?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec41d56a-06d5-46c7-e2a2-08dc5666d0a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 18:24:36.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INbPH+aefAdPtW+ro80277yLtI+MvEAAg1gz1YNqOMPBF9CFPykQwU0LnOwUyiibpIsAZxIa5MQDdFlUKjXVaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

On Sat, Apr 06, 2024 at 04:39:45PM +0200, Michal Wajdeczko wrote:
> This is safer approach and will help resolve a cleanup ordering
> conflict related to the GuC ID manager.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c30bd9ac8c0..4c444fddfba6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -238,7 +238,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  	free_submit_wq(guc);
> -	mutex_destroy(&guc->submission_state.lock);
>  }
>  
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
> @@ -263,13 +262,16 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int err;
>  
> +	err = drmm_mutex_init(&xe->drm, &guc->submission_state.lock);
> +	if (err)
> +		return err;
> +
>  	err = alloc_submit_wq(guc);
>  	if (err)
>  		return err;
>  
>  	gt->exec_queue_ops = &guc_exec_queue_ops;
>  
> -	mutex_init(&guc->submission_state.lock);
>  	xa_init(&guc->submission_state.exec_queue_lookup);
>  
>  	spin_lock_init(&guc->submission_state.suspend.lock);
> -- 
> 2.43.0
> 
