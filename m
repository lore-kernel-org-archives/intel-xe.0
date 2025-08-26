Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E7CA0EFA
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 14:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B196110E66B;
	Tue, 26 Aug 2025 14:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P84Bvlqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF95310E66B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756218009; x=1787754009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CRfAomPWjJX4J/v+X0UXOCwMtxKbd/LtcPK0NpnJ6UM=;
 b=P84BvlqmhiKtVx2H1tKep5pYAtHvzd/kX5gsvm+Q/+8085CRr9k3fkq6
 Xz475zBkyVW+QpQG0zPDfXYZQezbj8ldCwtADGMhQdLsDVgyozdi/dJSc
 vOhXyoix1YqQ6KQSOwF9h//bol614BXQ5y3/8HXUVL9AnS+tOTkTZsoMT
 ti3gAvoWWcj2MtZ3gs09mPW9ezn/3RLfT6xrKNxN8TFjx1bDKtBRjx/Zj
 046lTlMu9DmiTuV7r6g0JefxMI8rMC7lFe+0OVUdJjlAqYaED4W3sx0+g
 IJdneV5O7AfJifz924Es3G4aYpRTVjhuDuxIyNotusp0X4PdZic8swA3h g==;
X-CSE-ConnectionGUID: MrK8SqqlSMym2tdvbmem4w==
X-CSE-MsgGUID: /NNEemrmQP6s0aHRh9AHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58376757"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58376757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:20:09 -0700
X-CSE-ConnectionGUID: LbQzgHrcSQ+pvF/0PQCbwA==
X-CSE-MsgGUID: V4mI4CmyR9mNVc3M5ztAtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169962032"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:20:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 07:20:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 07:20:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 07:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQukK8sHQNwyESMqH33f/NWTVFey2dUmHSse96wbvxfVYyBVnYSPxL8k0CnGX2CWj5wGmZxGJnReQXTV+zyC0eKKINTs83LSOeEq68/c3CWmGsT1bocPIQGrh4OAgs9jeQ7Tx/Guy59tJEoUqpQ+DLjXoa43nAAqyIAQ78NjWtU9vcYyYNskoZS4Ji1CS3c8/jm1CM1I9kfuVdkp8K3aj/girpvDnvwpj8vKXUUvIz+L55mfS4N39eC44jPsryKvcl/iXxPWq5uxP07Ju2yKeKPK8kz+c9OWn0Go7JG11yJNHB3Gb7o1YgHd1guqUGpt94ZkNTrWxBsLHrNP+XyMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8e3gxD3jp/3KYWLwZ5oLVH1UEYyX69+y0cDFaHuKtM=;
 b=XFEop2A/oDoQAqw3x6YGNYrpH9tbFMe4s8KOiErpp8t+G79+LdX22xqiNzCoGANWOg3IR7GUr9q+UIW+HYoLlWkY2HEeR3YBKJXYWInue2divalDmKhG/josCQ/RtMMjAFS7lh9vZEqOOAyooaPtDvNuVG+8SKTSa7zwIzO+FBaqQa4mJJQDpE9O+Kcf2AI7F9OwzWopmH4ngijlSnDjA8ZoyXzKRW3qwRhJVX/aV1fUVVS18SvVkFbhZldJSbC5wqxRAp1FeySxXLQwf0R7rOl23K4xIrW4gpwhLGWM49TItNMIA60BNenFa3pkFBCNorf1R8T0XMYIHutrE5/sBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Tue, 26 Aug
 2025 14:20:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Tue, 26 Aug 2025
 14:20:00 +0000
Date: Tue, 26 Aug 2025 10:19:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <james.xiong@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: early-return for SR-IOV VF in C6 funcs
Message-ID: <aK3Ci5wSvj4-JrWg@intel.com>
References: <20250825223219.1351786-1-x.wang@intel.com>
 <20250825223219.1351786-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250825223219.1351786-2-x.wang@intel.com>
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ad7f20-c298-4ab3-5e14-08dde4aba3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rU0ksuJnw8V6MRHcCdkDIHFB7t4UCFUAdk3eGRfCB6thhLjCX7/zEUm08fV8?=
 =?us-ascii?Q?dCKHW3u+J8VTOjCQHtWgjx9GTBB8p7xQhzl95rHXH/oS90PAkJcdNq4FddWO?=
 =?us-ascii?Q?Lu4LjFqUf6sbWpEA1So85e3eZIFr7FVho7z2k8eHZmY2jvyZif45lILbzmLR?=
 =?us-ascii?Q?gFeR+0locvIlwrDCa4eC8sUITh+aQcrM77HOGISOWASxBueaa2UCbXo+aWRr?=
 =?us-ascii?Q?cMi/E9dKQa9Ac3Md+BM1A6oVEloDD7F1PnuWCj7GTqh4hOgN1HGdvuZQWNDt?=
 =?us-ascii?Q?FHA02lrde1BluigxhOASdmyCSx0lLEtmKeEmZ0P13OLDL89H3NbpCllHdOGe?=
 =?us-ascii?Q?M6azqvrYH/Y/QfvcT9+Ew7q6kxxWhH7fJ/7c4vWPOFDwJ6DvCdL31C+vkC9l?=
 =?us-ascii?Q?Z312wZHzHqn+LqOhQY3vtz1dYPDdaGevf34W7bwoSfzXcM0b+zKfcsMpgRym?=
 =?us-ascii?Q?6IrNyvi4QxO8l4phnNWE3fxawLr457f0aJeQgiTyJfCNQoF7A2AbDtJSgAqH?=
 =?us-ascii?Q?qzG43HQIDzMUhm+w4qxQsrnN7AJVnEg1pnTveBnPDemiboyb3dY57zIbiFcR?=
 =?us-ascii?Q?8Aymd+lypZEpYuVuRbVD71/14MkRediWVjeSzKFvpHYjjbVO53guMiDe+IkU?=
 =?us-ascii?Q?OuYdmwacXVnbzBxdjYNzl4KSl2p9qFzEVOO2/TuM/H9oTfNMd3WVH86zzBUy?=
 =?us-ascii?Q?lK3yWruvDWE8Wspz3V2adifexsNmUB5EiSrcN6ehgD0eO8EnCzGUBnl/D5Co?=
 =?us-ascii?Q?3G+R2N4xVnwDF8rGHyU70Cyf/veVAHwaO17odZjq8mJWFXneLMI0mUeSGaCC?=
 =?us-ascii?Q?42H9zNYF+AGRfUr/CFcjUyS/O4dK4+UHXEM5SaBUvi0mC8vFglIEbOndYydw?=
 =?us-ascii?Q?qWfFDGiflKnJOvJHs1vDwo4qog/UiKWlK2m80iOc33wECsOKisoo1jT1xVK3?=
 =?us-ascii?Q?4to6ItZjZyNCZTbUNjqqcAEGcnP+IcbnzjU0+SDlyS+oea2thUXS9Z9F+sNX?=
 =?us-ascii?Q?nbNaa679UPwByRBZIRS+RtPY8eDPYSR3vI81uw8eJe5+U812qGBjNEjQAXZh?=
 =?us-ascii?Q?/oPxvOZdnkVXZjqj2lmTPhD9eMs8ctxo3wN3a2LC/tDmN7Wb172ASrTGkEIO?=
 =?us-ascii?Q?drfTGYpI/RbehxSonoX/mBbQSA3vm9bFVTUBVI5VXV1miIcG1hWtJkpO7hit?=
 =?us-ascii?Q?UPCq1YqM5bkldULV+6K6M73VakvHQkcpAY9kPmzMUDqpEaLlV2S1fNxE1nOw?=
 =?us-ascii?Q?YMWEhMF51seV+Zq2GdhX84Z4OdRe8qjQymjALfU0Kq2Q0fiuhUMCQsI/QBzI?=
 =?us-ascii?Q?uWFq6z4Nv47KDmfoaNtlM4HFPQf1YPlOXqIXC/Weo1fyRaKeSalq90qPb6dj?=
 =?us-ascii?Q?W1nIQHvgprIW/Zzfjc6A6Lf+nFsgRnxFe6nfh/TR7B3wMZZblSXkvamkxc8A?=
 =?us-ascii?Q?VitEp/fQJvc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QmV9wDfbKkrcN9vo/dDJ4gqzbq0wrF7Ze8TodVZaxT4POSWnEBs8/uRRrAWo?=
 =?us-ascii?Q?MSVjUMqJ+pya2AUW6qSvz1KVP6idMY4qZh0XCCcdJE9NbC47kL6fcIdfN5NT?=
 =?us-ascii?Q?5haGUDOGG1WCN52bNJwf9afQc98Hj7Z9qFmxX3wREmi+nVjnYuxgrE49ESt/?=
 =?us-ascii?Q?6AZLj9Cul2/yzsZpRRgRqN5dgvT0zzNSbhu5FmEI/ZliVA7ezQgjQz1U4jQV?=
 =?us-ascii?Q?eajXr1H5BMpgLkVRvU0uzr+77wCLia4XdjtNk/BOzqCHgWr8wIonYBTbd3r/?=
 =?us-ascii?Q?9SMhEbKHO6ODp+aHhleMQB1VlqO8QnLGG4s5zV5Y5vkB0P5is17X9Z2mI9z9?=
 =?us-ascii?Q?nOMdPmjif+J0jYCwJVQ3+CAgKpB0+FcBU2oFC5atdjmRZNjsLFPFgmuEsqRm?=
 =?us-ascii?Q?AmOwy5i15gdfXZFLhtmHPu8IzDGqmjqFFR1nkwbt8CzluwaFLdpZ6AYS1f6B?=
 =?us-ascii?Q?PuQdx3mLmIKvs08uGBE8eci+iv99LY3vMliQYtSX7Q2fzHNWbrAZPfNiKqX1?=
 =?us-ascii?Q?iU/JfoiXpgtm/2nvyViF4boFVvAGJeHqw6BFNVQjikrAxqNeOTYcKxIZuxyM?=
 =?us-ascii?Q?SL0ZJ0stbNJbELrgRf40yAuJrLsEEoZx1cJfBezPW9j8EXpC8jUkjI6OdlLy?=
 =?us-ascii?Q?n4TIGaWRZtnVx09o7sLRuVYg70Ccsrpqq/WaDwKl7cZFX4qrP2cJcu/Tg4mV?=
 =?us-ascii?Q?0lzd8ibRltivzBSi0eATYQFTjwrAlVbaH0TaiZjCY7I9Zqng/ZLDRgExcHjM?=
 =?us-ascii?Q?heD4/2aT3UphWwsu3Mw5GgfKGLINfbcq59/GLbVLYrmBmlZYG7Evn5vqVE39?=
 =?us-ascii?Q?W27AmSErVKzAvVo4ZKvFkIogu+w2BihpAUSF3Y6uYkMufmooMghQdbnVUPbr?=
 =?us-ascii?Q?BqmKYELFTJclXOa2jw796ghxju5i4Ev31vk6QymCfEecej2XJnbmrWDiqbV6?=
 =?us-ascii?Q?2AbktE48RQ8YoD14JdKjWG1iyIKTR5kaXi7HD0Ghfxh2YJyny4GudNc1R3B6?=
 =?us-ascii?Q?wDZftfUObKhkdo/KQtDSP5ysj6nHjdNkIuYBvMzLoVMpNOUZm9YqRDqCHKca?=
 =?us-ascii?Q?Vnc1VCaAYtRSI4rRN3uO6pRyUHNyBZUbF5OG9kHr1jql39hWJMFBS2nEO5MS?=
 =?us-ascii?Q?VwKZvv9QiFxo3KOA/HduQLP7R1bBQjv+AzxQBaewOrnx0k8V3D8Lg1spPvdO?=
 =?us-ascii?Q?qLJaTNhz0Ohri/bQ36u80ZJSqLLI3BZVlUhq7V0W7lJD797zx3CSYJI3rMSk?=
 =?us-ascii?Q?LaNOTsq//DKyo6fp8heXYRdKmsa5mrJjo0JgnoOLFyW4bNEG9gf5d7Cn+UG8?=
 =?us-ascii?Q?qub4hyAjrddDmtITsSqT+eiIa+J69xTM31HFThaHRGwrGcNsZTy0rq+O9Le+?=
 =?us-ascii?Q?MRlDlBMrJfQT3NNBWM/h9e2n77wjPxbLxi0uv8OABkhKjvcJFJKrWQ76pZgE?=
 =?us-ascii?Q?cMCZ4ezWt7/sr1+bL6JqanuHZiAY2NNLxV6Hzsc8wJJug40GZv4+ohucLv8b?=
 =?us-ascii?Q?lMlMyTabDyBCp4H97PWsQZHxPjGQM+x7lDHSAjDst5BEldwkbVD8St8n/ATd?=
 =?us-ascii?Q?G2mfCqIPftcJwuwjktticMjgEs2o4icGAOFSQ6Ye27LKI3nnKJyx6BRNUfjO?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ad7f20-c298-4ab3-5e14-08dde4aba3e7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:19:59.9391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5efxdiSTeS36OiCi4hbOPCKkiNbtJKJRhDoT6/tp6NfmjTlHFkaI8svcE88LFmWagcYgacLv2rzYJ27y7Sibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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

On Mon, Aug 25, 2025 at 03:32:17PM -0700, Xin Wang wrote:
> VF drivers can't access any of gtidle control registers. By
> returning early when IS_SRIOV_VF() is true, we avoid executing
> the assertions.
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I haven't suggested this patch. The only suggestion I gave was if you
really want to touch the xe_device_assert_mem_access that you should
do in a separate patch with proper justification.

The justification above still doesn't explain why you want so badly
to remove of move the xe_device_assert_mem_access.

Better to just give up on this and simply do not touch the
xe_device_assert_mem_access

Thanks,
Rodrigo.

> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index ffb210216aa9..611c506bdad1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -377,12 +377,12 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>  
>  void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  {
> -	xe_device_assert_mem_access(gt_to_xe(gt));
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> -
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +
>  	/* Units of 1280 ns for a total of 5s */
>  	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
>  	/* Enable RC6 */
> @@ -392,12 +392,12 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  
>  void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  {
> -	xe_device_assert_mem_access(gt_to_xe(gt));
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> -
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +
>  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
>  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
>  }
> -- 
> 2.43.0
> 
