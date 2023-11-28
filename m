Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D413C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529E810E57B;
	Tue, 28 Nov 2023 15:49:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B0810E57B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701186575; x=1732722575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JRBLIHq9ApMh9lq4YpZf6+QKtEB18EZ7/lqyFRx99Hc=;
 b=gZmahClSfS2VY9q1UcOB56SxW0vf1EX4anYw2i8tjIj7kJtd8Q3V+mg8
 MtmqzgGWLOGktfhehHcTDD7nLiRme3KTyqd3Gis63EUeHnyohkWq8z9jT
 BthUQ9cTzn6huzmpV2SJcs8ZtwMGthrA7cBSyS4Y/Mma/jD3buPkmYYH3
 Y17tHlTyeBYUrPmEuJXqpJuxEtG2WBYKe7oJ6ahrvCTcAD4aqSbM1kpux
 BnBXKtQbte/qFC61Xwmejswsrd7cTIkOkOrQxoNZQxQyCnGIWpXDMesxf
 Y4Qj+0r8S/myXkCAqzhR4eHGFFHZqo7NNbNuOrwdoAOJ85mRq2bSJpfzL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372322710"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372322710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="802982598"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="802982598"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 07:49:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 07:49:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 07:49:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 07:49:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n62m07dsd5XBfnyqTuY1lOdaRz4BH42DsrwxrZNtMdGE1HcopwJkl3xdS+U7RdT3ID/qTIYum1i0m+XwZwXMNBqaWj0XLjIJivxv2+uXFse3hQndtKT9H1Gvov9I1S47X7Uhb3vQuPrJgU2POWC7iTnIl9bQ59hUv9rg4aG5nc8/e3ZnMEtCiX5Mk/JSRExeq9mfjzReHjc4qR36gCFt2XZ5O0sWYJN3GX+9t3HgMTmTuEpfLBLYxgNQEXGClEkMgYiXWOss31zIS6EKjLMhHthogbLRG24ggFrlNFsaXgIT/5nQM5oGBBW5LpQHGpYJi9EaSN2YQfAPmxURtIrvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T25JAViG/fL9Js6iQQa+xCGodSJ6ptiWpFAWIoZ5fE=;
 b=FgnzZp+w/70HYssCsr4Yvm4L4e3WkV0ZfRdow7XI5GLS4GjYSgEr97wFtrzepXq11p/401bNXWDsoWIjJ4rCF80AcFNFTzGcLbHgZ3zgtHDIbfQdlbjwFZ8VfQ32mo0O6arwQMEVrEO8GLUZH9i0YwrichLSk4Mos5JSRUGL349+GWdku7ILjzKYF4gmL+Rp4RKY/l900CdnC6eiG96obaswr2Xl4LEmF6+04v7QEf5OnFF096s/LduPjObCM/jp1qMoSHe92rOWdrf1h4dhEDXPTdoojItdKPB91hmiVP12tiq4akAUc8TjuOz2vt7UNe6LuIphpjxQdyA6SP10VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 15:49:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 15:49:31 +0000
Date: Tue, 28 Nov 2023 08:47:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
 <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: b587cd3b-0e51-4b12-a767-08dbf0299cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qfznv938SO1xdJZJaRxkQjmvO8VbreePmrydVcP2cE1wrbEdkoOcy9CoVA2DJaIDt5R2/Rna7ofzSXGsYglUcFV4NSXLL7OuHqSdnoXKqFmdMNI51OBMn/DyM2DL+t6w1BaIlzubhMjhHv7W7ik6kOZl3MIodDOlPnYGOf/fPlWR1ztKNsdK11y/rSsppn1spABlPOJwzuw3X/RBOLAa23aXifqFn+5tVy/aReruR8oPgH47hAaJ8Ezf9tNIpcWUC1zbkveI9kJIt8KPJw2dFK6XHLS8togW2MBIv+iNpFhkkoni9TxVGZQHH4urzAH6U6xTpiHuCCCUGNdOhupOC/H0iFV+hl5Yn8mCLGcH2I+cntbEZnzwJGeEVae2zn1sM80uHxSMaIuB7HxEe4qIzXCL+ApGQPG5Gou/aE74nWJR1k823AYuOXQ8zKDOJh/MUZVEPaCeL4UKL5xXS1ygqxSVHnjj+dSYItoyznw4YFOtIKvQUqcJLivQJWdrIs1OUIgLh5XXrcmaLuIAK9MEI1a0chy76dNZLIJ1OgmhnTwz9EVRD7br11BwuYp65iq4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6512007)(478600001)(6666004)(26005)(82960400001)(86362001)(38100700002)(6506007)(2906002)(5660300002)(44832011)(83380400001)(41300700001)(8936002)(4326008)(8676002)(6636002)(316002)(66946007)(66556008)(66476007)(6862004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4/QQPTuWRPP9JJqaB5125CsOxuCEsSFKFoz/GCUlVPTZoMBCJ0yYRszPmKsT?=
 =?us-ascii?Q?1TGP8s4zwxwsPKqrgUy3r/idoIQebHQ23WRijZUBEGL/3TWPJ0TH7mPoCx98?=
 =?us-ascii?Q?tndUwNSt/xD4F0hHjajH2viDCwsZeZOCWavStXdD5vLPdosj0aONXq04UQUk?=
 =?us-ascii?Q?MHHryhW3V3UQhtUWyTz9e4bJLV0Y3avsj+lzbmK6T4tQCStl527FbzoL1FRw?=
 =?us-ascii?Q?VtxMYAFxDtmsEJirDiXLnsagiO3zYFqIgSHy/ldybLMthqh+RlSZPkemCGoZ?=
 =?us-ascii?Q?uN9kcEpGvGBsKfVEZROK1G9d+Bq7GSjEgCiOEKUsjn+CVe3yV/Ml8zVrRR11?=
 =?us-ascii?Q?6+xykQErj7SWY+/Ve8BE13+OO0ENtSG5EFdo3DDtrOZRWcMq43uBROXnve6w?=
 =?us-ascii?Q?XZLS9j1zfYuFOfhAU0ZeNy6yhuuyKAGu46klOHiLUANuR1zys4n9aEAQjCRu?=
 =?us-ascii?Q?ZSFLkVOep/Drfpmd12aJGHtLl4NDxI/lCO6rIxTYQ+Kxn7rBjzoMWvi8zTUB?=
 =?us-ascii?Q?vgaqLjGB+UyKxFQ+7ERDI048e3rS01y9yycqXuC81CA/mNHXMFXeFscNQof3?=
 =?us-ascii?Q?GuloW7wvslggR20oTurp2xhi1FJYlHQu5GAM/67prDltCqSTtzusHzGjnySs?=
 =?us-ascii?Q?g6cCHzOy7DlarJJzJHx7IFqScK0rCyxr9zWpChFgkEYwdkUueyHURGkaCI4A?=
 =?us-ascii?Q?J5fFIWGfKvkkbDMrWXmBQyvZ5wpydGaXspEFWaz60eN8bcfZ/ahzL3WU9kRT?=
 =?us-ascii?Q?MN7EfcQJM9FFiNJOqJpuwGL5xao9HCS3TrrVMvbxcsSF2fL5mplpCn4wK0FD?=
 =?us-ascii?Q?7pT26dGItKOcGS788jKEMuhrNfLY4er070+u+A3TkYXU3OhC4y+HXA6UrzmL?=
 =?us-ascii?Q?eJDzhTBzCEgAa2vozuvF2uQ6I077BCOLOcKCUSRP6li8sdyjhqosMjecqEVU?=
 =?us-ascii?Q?8tHm7zRtIToIUYHhDY+cNyJFJf7BlaCU+4Gcz0PNfNaQlN590FThXTETHZDe?=
 =?us-ascii?Q?ZwosD4ajecutbaS5/sZhRV2Z+b/v0RXVRoTJVPo5XMfxvpLfn1GUMbdd8M9Q?=
 =?us-ascii?Q?C0T0vFx+vMBzsNZZNHL3CHPXKZ/7VUBjrfP4iRwQlxtuf4KQXfFQiQ1NFvuX?=
 =?us-ascii?Q?9p1YU/2bdbHb9aO6j33aLf1Ef1jIJ+w8ANgZZcGg1CDn9DQqbI3jgsCP7y07?=
 =?us-ascii?Q?7D1O2VTYwsKBDdebzzANZtR0/PyYli8E7FuRVCiq+4d+j8dq7GmNbSzJwieg?=
 =?us-ascii?Q?w/1nZFjC58IWGHApGlAKueNkirimEGWaky1fLMeqzkf00KYlALvCO8tBCe3f?=
 =?us-ascii?Q?ceUcMG8Cu6bOfg8L8lBLVuxlcIUdYeX0ixF/4OZjjFi+LWiywutEH26r7w4I?=
 =?us-ascii?Q?RzGjZzUv4UkDbUHMh+yudeso4S+T45Eg/DO6x1R2O0KtgJxXVDJUZdfPvpB1?=
 =?us-ascii?Q?MF/UrOhhjjBxYlVDH8iaNZW/hwN72I3oWoOv3sO2kHK1SK/4DhqOgCmzNrLw?=
 =?us-ascii?Q?fttwbhZonQ+IK52zilR6BwCW8/lVEPp9Z8WBoinZr/71FlbENIOLm7E79kEC?=
 =?us-ascii?Q?uE5CauEelcwKEW4JbAFFjfnSB3kMMWenkEKv0E8IPdCJhYZm+twxYdbvTwut?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b587cd3b-0e51-4b12-a767-08dbf0299cac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 15:49:31.7570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYmfQQWuR1J9xwmhujuIbXJgtg9GjZMf/2oNHlU5AFL8+Wvp2ppzPcC4AatbB/nQlWUV7Yav+BG21icbY4DBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move wa processing to gt_init
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

On Tue, Nov 21, 2023 at 08:48:47AM -0600, Lucas De Marchi wrote:
> On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
> > Currently WA processing for gt is happening in early init API.
> > It also includes processing of WAs which needs filter based on
> > hardware engine by looping over number of hardware engines in gt.
> > 
> > However at early init stage hardware engines are not associated
> > with gt in software which skips processing such WAs.
> > 
> > Example WAs which will be fixed to apply after this change,
> > "14011060649",
> > "16010515920",
> > "16021867713"
> > 
> > Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 0dddb751c6a4..3d0f7b6f952c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> > 	if (err)
> > 		return err;
> > 
> > -	xe_wa_process_gt(gt);
> > 	xe_wa_process_oob(gt);
> > 	xe_tuning_process_gt(gt);
> > 
> > @@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
> > 	if (err)
> > 		return err;
> > 
> > +	xe_wa_process_gt(gt);
> 
> the problem with that is that if we need to touch any register already
> touched until this point, the workarounds would not had been applied.
> Digging the git history, I had added this commit exactly to be able to
> initialize the gt workarounds as soon as possible:
> 
> 	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")
> 
> And then
> 
> 	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")
> 
> Note that these commits are in the xe branch, not drm-xe-next.
> So, it was:
> 
> 	xe_hw_engines_init_early(gt);

xe_hw_engines_init_early has be called after xe_uc_init_hwconfig after
the idea is gt->info.engine_mask would be set by reading the hwconfig
table from the GuC rather than from a hardcoded table in the driver.
Likewise for_each_hw_engine should only be called after
xe_hw_engines_init_early is called. With that, I think this patch is
correct. Does that make sense?

I suggested to Tejas that we add an assert to for_each_hw_engine to
enforce this is called after xe_hw_engines_init_early to catch issues
like this too.

> 	...
> 	xe_wa_process_gt();
> 
> That gt_fw_domain_init() seems a very poor place to initialize these
> things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
> minimal GuC and hwconfig read much earlier") and then people end up
> adding random stuff in that function :(
> 
> So I think we need to get back to the original idea of _early()
> initializing what's needed. Then we'd probably need a few cleanups in
> the initialization sequence so the function names at least partially
> matches what's being initialized.
> 

I agree on that the naming of all of this could be better...

Matt

> Lucas De Marchi
> 
> > 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
> > 
> > 	err = all_fw_domain_init(gt);
> > -- 
> > 2.25.1
> > 
