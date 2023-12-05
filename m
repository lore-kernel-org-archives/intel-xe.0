Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A77C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6DB10E07A;
	Wed,  6 Dec 2023 03:48:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF7110E07A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701834490; x=1733370490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z9Qez1O3PptEy6DQhwLl+mNgXL5OSK6GDL09QJWX748=;
 b=WF8RV0iAGyZqyYWDFvJlLD3f+KW0InEbCzLlnYKfITqHBNLXOoxp8isH
 1QZONCty4UrsyUn8pPtpYcb8V0OiOshy3OrCMvmJV5foBrxoFFXqjMiJh
 blUphnPxShjA1rxfXFDivVPKwnh0p7VxMyFoSCuE/nRb8C088w+m/BCaK
 xLEnZ/UwNRGlmkxIUbm808z2vJDB9zcfGD8Y4CoNru0RLh+IlaxJ4QmLA
 AfCDJ/VC6bBRmwUqvuQ3BR9i6P8D/AFGaRFamiQsIH3wqEh5i77KzdfpV
 mgJH0apRRQZAg8EEksQmTGcGY7d2CZrY6sZcBGyajDaeV3sWCWLxxjnp2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1093350"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1093350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861978122"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="861978122"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 19:48:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:48:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:48:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 19:48:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 19:48:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c01g4FBeIMHRSljTieZsoAGbhz7+dxB4TtVMxyi0nJ59b6q+9C5zQWD19xaBQbPhTjnkHbSrR166PZ9cNoOZ3rq7Ef8M+1iGUbMJ8KIfQ2ghc7ih3Tk4mOXLOTMqpyZSQlZqQoEwCPgpfabCHO98IhNALavxSwBqym74jNRjXWDaml4GUzgjlp8zcXzRqWqd5tPi5B5nOCE200A147IJ3K0vdSjRDoRmz11MAqyAcP9AWxr4o/+1jUFNrZUoC+2vZN4cBJtEEYoBxhVk4OBEIR3gZpfS7PVCLefoWs+YA+mZsMiVEIGdK+cG0mMDDb5G7uvLz+AiKEV4e1Icz8N+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18OBcjguyKcmV084NCyTpC1hy7uCLuZBfrzpRQ9JnNc=;
 b=A3wfnzODZiHY6osqWneF5+utXws5PSbkLCHKPts1uVNUCUdTYi+IIa+XG3RCpD7TqqpDVIMfslI4Y5w8y5MkJO3wC4VT8QgAHguOjWv/eU5sO7XbVqlRMk9xoS8F0cypRQTuzQNHGWXoq8M08tIF9MwS1A3PKAoFVCnm3dGo7v0o+bpNuaa6PwOHH/au8vUE4LpWaoRQWpQxqKCTerDQa2cj1XeIyzBYOA6Uc/wSZvLC/XMfRQzhbyr5AOyh4IA1o6S2qQMXNFVxmA4KNjtJZR/ebqZs/tWb2z3ShLP/3Eku25DZTwRA/Y+q8U/xYRzDaxfTOvft0t/aORM+nS50bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5449.namprd11.prod.outlook.com (2603:10b6:408:11e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 03:48:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 03:48:06 +0000
Date: Tue, 5 Dec 2023 20:47:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZW+MUazvwS1gzYR+@DUT025-TGLU.fm.intel.com>
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
 <20231206034130.7897-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206034130.7897-3-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e28cd0-9f9b-49ba-728b-08dbf60e280c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qshu1XmXtAsFGXpS5UUz/KJfGgraGmgLIrSQwhosLKqqqzA5RZ1uULxApu96+Vcr6jOLZ/SfpRnM16eyS5qSlWPR4fxlvujNzCzir1INxLdXiBDny/1cRYvpPTDbaoA4CQGNrwvwHDlsTFlVId23Gco4sIG4yVbpCOcISgaPbksrCeQUK6l7rTgOl4nzrcPcVjxWBMUI1zZHd6PUhaxFfBeefzd2Bg3gfl9oQmtMquwWxz2fvNuS1P3MuH6hJNtmctwuekSi4kv1os4YrbflO5HVE/LTDVI8+tfpNaAAwswB+V26xrzmcVRKHilyF0u3GHutBS2cQA3OQ/06Mo5Zz+osk6GV9pzgD5yXSIrhm6SF1SlfeK7KiALcFqUHhYKoe08QuqsIC7SdzUNtUlb2+i8acoLjwcRsSK5yTUgkggId8QXDv2XXq14nIASvvc64/ZrZOCrB9zZyFGGVBfPP9LWTg+AB7Ae6n00Kq+/bFVQO995U1lSlaEohQl7sco3gptlCUOvPvSh35Q6LeXxdLhBa3KviRuFodNQdap34wtucxTBbPQKkP8JazkDvvo39
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6486002)(44832011)(86362001)(478600001)(6506007)(6512007)(6666004)(316002)(66556008)(54906003)(6636002)(66946007)(66476007)(8936002)(8676002)(6862004)(4326008)(83380400001)(2906002)(82960400001)(107886003)(5660300002)(38100700002)(26005)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cUHiHGqg95G7pkbR2QAgnIuIpXzod9ZG6xEcL/JyKmVrrV7PXcjbTHX2eJzA?=
 =?us-ascii?Q?WulRLQr3oEaUiQN4eNdtkbqk1Cx59+w6+mqyOkmPq6YOQmK/qxZz5HliaUUc?=
 =?us-ascii?Q?epkOOgrkGuM3rbS+FWTmoufv4SLVs98fCjQ9Cv/3nxCHY1nP4a9c/BWdbK3H?=
 =?us-ascii?Q?Rk5p4eN4AcWR9ebwKtmXdXaPlc7qxAcYllkmEJ893KQp1i3G6+vbl78jlxru?=
 =?us-ascii?Q?AOjv7cE+JElbQ+3yaAUdXOb5p59ZQsoV2cg48YFwWEb/ev2IJgFTyZ0CVtR2?=
 =?us-ascii?Q?tR1YmCPCJ/2re43uW/RurMqQ/3TJr1aL3cbGYh2wQyXsGlDmhDtejCz6ChLE?=
 =?us-ascii?Q?0m2xVBxL9Ggx6qqsOvBXtImW1g6RWBJ0eqoXL8TDDsw9WhCyzKvXjA9ABs22?=
 =?us-ascii?Q?YVSG63tPJivxRF1OobTUv1+to6xJWAqd/BxdiJL5ZEOpPX+9D3A1rCfZDuc0?=
 =?us-ascii?Q?S7H14WkUb7idf/kfE3LcIKRBKdHkUocTCqqev5mR82LcHQ2oU7RdUByt/TAl?=
 =?us-ascii?Q?i+myKx6O8zIqgNuXDCBWGymjhofImc64n1euFXPrV/kqezGSS0ohgd5pajq0?=
 =?us-ascii?Q?lOXX+F32kd/Aq4eJQhvqghnzb61kcwhXAkQ8PKR7bJMxsyP6BKy2U+gO4Wjq?=
 =?us-ascii?Q?N09Ft6Abm76Jgdxg+1Utd+ZA9iyV9IyjoHJVwH6XcvAgjsb7gY0ZtdS49uHX?=
 =?us-ascii?Q?ntfREe3lRF443W/lQBv2+kfF5zTePRHRZesQL/NtcIyirM43nYwmdBDTdc3k?=
 =?us-ascii?Q?Qxzbfb+B+4mprwZtqQ3OR9TXwOkPw9tDmN/IwnLsmOpHLE80SqN/Ydgj4/6H?=
 =?us-ascii?Q?sJRdcQCQuBRpEbD70d9MDZTTwouXeRdiu2phf9qOoYvT/0PS6o+1eZWVf65m?=
 =?us-ascii?Q?tStSqKI9ut/TNDLiKwSAI0od2kd0RdTWaQd5a0I6PVV486YepO+L23/U3nNf?=
 =?us-ascii?Q?5TYazRgCHF2HpjEI73sod5DyrjGfD5YNNccEuHhzWoLF7s2gesuDdAdgCPzd?=
 =?us-ascii?Q?U+95czIIhHDXSqTIenDjxFA5ycOxG25fhIqSlxWbWEHjqcsjm4rSKQzkQo9x?=
 =?us-ascii?Q?mDMuSr/uys/ePlDMdRF42txBwIAcD9ywjzCpIGYHNYc9PUQ0rbkVSXnvqAIb?=
 =?us-ascii?Q?U6Q/R7ElML4ev+g6d3WVaV/LtA0mxxyatzAZWoxwC0ciwnIu8oAF+YU7uHu8?=
 =?us-ascii?Q?u6pUx+o5kTGK3KhmOv5T7b6aeVTkl9YlBOIgpuFpUtOn7spss1aSX3Sreytt?=
 =?us-ascii?Q?9uR9FhW0GIBN0jycyZiCTRB2wlhxHzYk0uQlKd9FHSfO2vrCnjyZj3oL4BWl?=
 =?us-ascii?Q?KcaoDoBk8+lD61bD+973sJ+2xTn+xlaNdjgTwOqeDafoMYAVWygTyl+Bw97o?=
 =?us-ascii?Q?nJYRxL4h3LrDzhG3LHHsWJwTSb4JY26SKCkC9Br6SOy3blf1cLwS364gVclT?=
 =?us-ascii?Q?TaPaCQEUdxnWIjKk7k07l6osaa0vQ0LzSNS9wtn68GaL8CGNStXlr7mjU7D8?=
 =?us-ascii?Q?0qwCFGa6QHIZzM5xP2G5srx9rXJJlJBgr1W59L+vKHeQkPCu2e52cLm7sfn6?=
 =?us-ascii?Q?vVKBcqruMUY6k3CXMilH18ncPjOikl0hhPyTN9eDrtmgMIL5O3r0PQX6Hx8J?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e28cd0-9f9b-49ba-728b-08dbf60e280c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 03:48:06.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VlNqUr7yK6QXbI88YXynZREv+h4DJcrfX6iwK88tPhG9+V/wtpg6m6NFpKRBrrBhi5KVR7yWK0R+L6G8CEl2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5449
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/uapi: Return correct error
 code for xe_wait_user_fence_ioctl
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

On Wed, Dec 06, 2023 at 09:11:30AM +0530, Bommu Krishnaiah wrote:
> Currently xe_wait_user_fence_ioctl is not checking exec_queue state
> and blocking until timeout, with this patch wakeup the blocking wait
> if exec_queue reset happen and returning proper error code
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 +++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 24 ++++++++++++++++++------
>  4 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..84ccf7242247 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue reset status */
> +	bool (*reset_status)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..dab41e99f3d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>  	/* NIY */
>  }
>  
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +	return false;
> +}
> +
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.init = execlist_exec_queue_init,
>  	.kill = execlist_exec_queue_kill,
> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
> +	.reset_status = execlist_exec_queue_reset_status,
>  };
>  
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..a42c3574cbec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -854,6 +854,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
>  
>  	if (xe_exec_queue_is_lr(q))
>  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> @@ -1394,6 +1398,11 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>  
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	return exec_queue_reset(q);
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of XE can
>   * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -1411,6 +1420,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> +	.reset_status = guc_exec_queue_reset_status,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 9f272bbaad95..74f72dad2d0b 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -100,10 +101,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> +	struct xe_exec_queue *q = NULL;
>  	u64 addr = args->addr;
> -	int err;
> +	int err = 0;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -120,6 +123,10 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
> @@ -135,6 +142,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			break;
>  		}
>  
> +		if (q->ops->reset_status(q)) {
> +			drm_info(&xe->drm, "exec gueue reset detected\n");
> +			err = -EIO;
> +			break;
> +		}
> +
>  		if (!timeout) {
>  			err = -ETIME;
>  			break;
> @@ -150,10 +163,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			args->timeout = 0;
>  	}
>  
> -	if (XE_IOCTL_DBG(xe, err < 0))
> -		return err;
> -	else if (XE_IOCTL_DBG(xe, !timeout))
> -		return -ETIME;
> +	if (!timeout && !(err < 0))
> +		err = -ETIME;
>  
> -	return 0;
> +	xe_exec_queue_put(q);
> +	return err;
>  }
> -- 
> 2.25.1
> 
