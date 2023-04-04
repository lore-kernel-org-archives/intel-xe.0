Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40523C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 18:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196D610E386;
	Tue,  4 Apr 2023 18:48:50 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744E810E386
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680634127; x=1712170127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LAJhanXmX+XpRuI+EJl5lveoPqQkszWK4ZqUuCxcSrk=;
 b=XX2nprhj3hJCQ5jX4zVYcywBvDUxZbaX+kqSnvmAqJny5Q7gHgCTod0u
 tY+yzRnzwO9uSDIWG1ruqkMW4K+nrw0uwEwpn6dNi0OEqr/qJkWuu+XDd
 rLMEOWl2J8F6KtKtb1by2lbCPmrdFYd3UnHMlFSWin0C5j38jpHAARoPT
 dGsEiz+YaXgx0uLPhuUKimNK0SLkdVYDUsfL0e2grtlI9RORCu5lWU2EK
 hJAXDcCMtRyrbVbK9tJsCLNBz70WGkEIJ8Lou/2uwQH1IKmk24qYxqaRe
 smNAi88a6E3V29//Oc0MMTCBw0HxR0dF8ukhZ1Ipp7Iad97i3Q1cCVoBg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370093922"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370093922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="1016213148"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="1016213148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2023 11:48:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:48:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:48:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 11:48:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 11:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwfCu/YcV+0rmFj4RR/qjuGFL7kRw0CiB7HSyfVXGrqhUGoYvYBFlJJuDZdgfSTIqdFitFUlLGqE21p1x/aAmtke+Gl03i39ipN2iJgw9qDVcJzJmGud+1toPBGAfJHpyx48rvgWGzHVG1SANhqTSS41Hn3osYwLdtH0LHZgjOM7fgXzGD6XxXtXUAdB+YLqOdkvBkguZMUdtdSuV6j0pvx05hSypCDGznkmGN5QPbAUoMg19yOlihBZdyRH2gFIoBNvitpux2hmn5kEUSxqsyslHKlLzentqyMSjRd864Xzk//86U5jxq9lgW+FYJVmJwH/QxqR15N3NhNJBapkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqz3c9chHFi8Z2wTmbgEgT3F2SPQRED+/DMq3XxWtKs=;
 b=WH1bshleaOMh7JgsWVy+Vv5LDPAQ9HZjj0aac7/SDL3rzcUozZja9poZ4WMF5FB6DWDE26SmvbleHlYNEbwkD+KwTrJ0LplDr0kFzEIPC3/OH8wChL/NggLyZCLmnCDjrfj2V85uvFFEwEICEPtS79DB0gmdcmnATHtDSyFsx7nOIVNvcI4JjW3PZWOynfg1uHUb82oIeWEGC7y+Oxlta2rQ4F1zTMZYuaggTRv6Ke2PB+9kowBf7o5zIrTbcxmIx+/2qzN+I2g/6u7ETJMQV2rxdeM+ePmmXda4Xr0ZSRIpN67BmxiGIxYoHnZjoKeAih92tJNdE3bl0i12T8PWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5374.namprd11.prod.outlook.com (2603:10b6:5:395::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:48:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 18:48:43 +0000
Date: Tue, 4 Apr 2023 11:48:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230404184839.qlbwgv7lvvbi76i4@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403222031.4255-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403222031.4255-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5374:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cb80a1-499c-4659-fec5-08db353d366f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zBcap91ymoUvoJkFwUSa2m3rRwhF9PTE86Hk53aRu8FVLwDVjjRM0jLaDTZctpg3XP2XhqINsSuGLyV0ubCGmCUtQmoVR7SYNdQ0tLW2QK5bD6fnu808SylWGttvSrF8INyitu96iyPMbM0NtsfMz294oHL77ZtWqjmvC80FJkmhmCXnq33BmlZXaAjeJmEO1tJaieLZLOJ3bD+JxG30cyHSkQziYLV1M+gfA8IUrBLWknIphD4DwUhPwN7xgHR5agLMQbuChiUjpJ8KoFMktVl+KGVY7uB5nqqc8jwlL5AE70w+QpHr6XnG/vPVgwDX/OJZl9jo566X3MZcWL0m7g/tG6EIgwmaD2HjRReV9BLwr/uX4uI90AnF5RFRCuKokmUgpelZIG/maOj4p1xIKJMzfnbkHMICGPwEimiE7nyUDkRTM/eJF8QZT8ICUhYlI8+/2xNYUysIXPphQ4DEJFVBSPMbMrTWbR4kb7e+bvis5BUIrKAqs0q6w82cwx6T6EVCddVZKMYjg/r1UL/Os7O1tNZqe5tm0BEQJ4ySt1+pgczaxBj0EZyphLgjQEVa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(6666004)(83380400001)(186003)(6512007)(6506007)(26005)(9686003)(1076003)(4326008)(86362001)(66556008)(66476007)(8676002)(66946007)(38100700002)(2906002)(82960400001)(41300700001)(316002)(6636002)(478600001)(54906003)(5660300002)(8936002)(6862004)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi9aVW9mK3BscG9ENC82Qks5M1I0K09yMGRvRXlUemVCS0d3UEZOVE5iM285?=
 =?utf-8?B?Z21sZVcyRlIvdmxzdzhTN3k4K3RubFlzME1SNFdCTFloOHhCLzJwK09aWkYr?=
 =?utf-8?B?M1k1Y3dRZFUzZHF6QzQ5Zk9QVlVNV1dSZDY3VUlieitzYitQc3IrTmc0NTht?=
 =?utf-8?B?OE5lWlFRcTBRcngyVmJlZlp3aVJUc1FnN2UydW4yYXZMQ29ESUJvK0V6MEdh?=
 =?utf-8?B?eU40c1hZbUE5M0lMb2IwSDhuS1ZQOVhGWGZnYmg2ajNqdHQ0czBOVUhBamUr?=
 =?utf-8?B?amtkWUhiNElMdDQ3UktGRy9YdmFNSE1pb3pqcDA2UXBQWlZlZlprZEdleXov?=
 =?utf-8?B?YTM5UEFzWFJ1azJkZHhuQjYxRkNkcUx6SE1rNGsvRVUzbDl6ejhhMHRpcHJL?=
 =?utf-8?B?M3RpNnpnMlVLbTIrV3JwOVVsSWRnSk5jdW5GK1pndlRXU2FEV2RBRlFVeGdO?=
 =?utf-8?B?Uk1OUmZJQ3hDY25obmFRV2hwOXNpZkdpUE04TUdrT2tFdWJPV0Q4NHpUTGFj?=
 =?utf-8?B?dk9XOTFaTERRRWtOYUZ6a2JaQ2tyQ2Z1V0NSZmZadlBQZHh6emRmMEhkc2Ur?=
 =?utf-8?B?RFEzOUsxaUZuNVlHalFldUVKeFRKTldaTkxweU5VTUg3MzZsNXVjOVdmbXB2?=
 =?utf-8?B?cVAzQm5FcWN2eDJPdThrT1Q3S2RyOW5ka0h0R21OeWoxMy9GOHRBUGtsVzVJ?=
 =?utf-8?B?QTg1RVhUOWlFaWU1UjhmN002eHUzbDBDZnVsR0pzSHpmaGoxMVYyQTd6NXVZ?=
 =?utf-8?B?TjZzTlpRb05oOUZQSnBVY3ZsNVZLY0x6a2xKNWMybHJlaGVka21McHpVQlpx?=
 =?utf-8?B?dFNaeXdGb0JNTlYxc3BCcG1jQlh0V2U2UG9XTnBZS2lzeTBjemduQU1YOU5y?=
 =?utf-8?B?a2kraG9lWnIxL1djNlF0ajFVOW1nbFUxVGZwR0gyMGFkaHlOOVU5Mm1oUWI5?=
 =?utf-8?B?V1N3VzlselVaYVF5VnNENitFZElOUnFha1dzQ1VUNTU3eXg1WlBkQ0I0RkFT?=
 =?utf-8?B?c0NjNE9SdU91OCtCMTBPQ1lhTWc1WGFoUGxFTWtueHFaS0o3VTFNa0FJemxa?=
 =?utf-8?B?MUJyWkdlaEZ3TGpJV0ZiR0hvNTNCZFRiQnVCOG80ZVBRNnQxMGFoR1BZelFn?=
 =?utf-8?B?cU1DaFUvLy9rN0NzNmkrb1ZteVA4QVJ5N3F6RnI0d01uc2J6MHF6QkNxTEx6?=
 =?utf-8?B?bmQxQ3Z1QzFtQitSd1AybTNlWEJmYjVHb2I0eDFNNWVTU1huRUJFTGtydU1o?=
 =?utf-8?B?TndteUlOMXhjd3JNMzRxdWRtQkN2dUtQdWgxSVYzUFgySWtFQWw0TkJyNG44?=
 =?utf-8?B?L0lxVjVhNFQ2S3N6VlM5MlZqY0dzNDlYM2ljWmhLUTJ5cVhKK1JlTDJaeEVQ?=
 =?utf-8?B?RDEvZ3V2SE9WRVhNZkJTNTlKVFYxK0djQ2c3NmFDS0VadTU5cWJFTFpCcloy?=
 =?utf-8?B?ZWpUUmt0SWhnckgvT25GU1lwT3dWSkdVN0J3WUk0ZDQ5SHFDUjBIc1BiaW1R?=
 =?utf-8?B?Nkh5M1dBV3FmekYwd2dHTmtWN2J5TFZwT0NVWmM3VzhvUmk3VUFpZEZDU2Fu?=
 =?utf-8?B?LzNkRU9VY3o0eWhoRkcvL3dpNko1M2hCYXdLSFBuakQ3VUplOFBQVlVrMFZq?=
 =?utf-8?B?ZnI3NFhBaFNtait5NjdqVFpudmFhc1I3Wm1zT2RrQ2pZL2J6c2xkT1p5TjFJ?=
 =?utf-8?B?WllMRjR0WWhRS0QzTEJDMllaQnZTZkZEajh5SlB2OTlhYW90RmdyU2IyN3Bi?=
 =?utf-8?B?KzJuUlRPSSt6ckRza1lDdURDOE9kK3dYbnFsbDZRZ0FTWU1CcDBCS2dSSVpn?=
 =?utf-8?B?R1dob204SE5ha2ZKckVkU3lxbWtWL2s2MGRvR3k2dnFLN2IybEpWU281TnZL?=
 =?utf-8?B?T3YzYW4xZGdMTDJsL283M29MVDZxa0ZhYVlRYkZubFFKZCtwNDFLeUlMQTZZ?=
 =?utf-8?B?ZTBNSzJpVFEwOXY4SlAvVDFxSkZ2Z3FXUjZzbGMwOXZiVTNqZ3RlSVlNUVVF?=
 =?utf-8?B?cmhqalFJNStZY01JZXFJaWN1aHkzVXU2WFp5OWlLalUxYTIwSW14U3Y3Ynph?=
 =?utf-8?B?dmh1NlF6N0VBNGpyRzZlYTZPak5UOWUrRUgrWG9qaC9RczN6WE1RZUQ1aEhm?=
 =?utf-8?B?WHZPNFBiOTJnMFJiQkE3TXUwY05Qam9SSDdtNktXOVBLSHBxaTRSSVViYUlD?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cb80a1-499c-4659-fec5-08db353d366f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:48:42.8017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5K+605L+kHjS4kEbUuWNPX0NU2vyDAubHUN9dudN9XYAukHQV5SCxgdwShbcJ0gyMRLe+Ss9wWWNnu+aGHzXIguBx6deuMNIF124gJ8vww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5374
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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
Cc: Stuart Summers <stuart.summers@intel.com>, Vivi@freedesktop.org,
 intel-xe@lists.freedesktop.org, Rodrigo <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 10:20:31PM +0000, Chang, Bruce wrote:
>Currently, unload pvc driver will generate a null dereference
>and the call stack is as below.
>
>[ 4850.618000] Call Trace:
>[ 4850.620740]  <TASK>
>[ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
>[ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
>[ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
>[ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
>[ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
>[ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
>[ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
>[ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
>[ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
>[ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
>[ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
>
>There are a couple issues, but the main one is due to TTM has only
>one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
>1 TTM_PL_TT each tile. The second will overwrite the first one.
>
>During unload time, the first tile will reset the TTM_PL_TT manger
>and when the second tile is trying to free Bo and it will generate
>the null reference since the TTM manage is already got reset to 0.
>
>The fix is to use one global TTM_PL_TT manager.
>
>v2: make gtt mgr global and change the name to sys_mgr
>
>Cc: Stuart Summers <stuart.summers@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                   |  2 +-
> drivers/gpu/drm/xe/xe_device.c                |  2 +
> drivers/gpu/drm/xe/xe_device.h                |  1 +
> drivers/gpu/drm/xe/xe_device_types.h          |  2 +
> drivers/gpu/drm/xe/xe_gt.c                    | 18 -----
> drivers/gpu/drm/xe/xe_gt_types.h              |  2 -
> drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h           | 16 -----
> drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h     | 18 -----
> .../xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} | 67 +++++++------------
> 9 files changed, 31 insertions(+), 97 deletions(-)
> delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> rename drivers/gpu/drm/xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} (52%)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 669c7b6f552c..7e19a15af3dc 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -83,7 +83,7 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_sync.o \
> 	xe_trace.o \
>-	xe_ttm_gtt_mgr.o \
>+	xe_ttm_sys_mgr.o \
> 	xe_ttm_stolen_mgr.o \
> 	xe_ttm_vram_mgr.o \
> 	xe_tuning.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index a79f934e3d2d..4fb9aff27686 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -279,6 +279,8 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_irq_shutdown;
>
>+	xe_ttm_sys_mgr_init(xe);
>+
> 	for_each_gt(gt, xe, id) {
> 		err = xe_gt_init_noalloc(gt);
> 		if (err)
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index d277f8985f7b..d9d1b09a8e38 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -116,4 +116,5 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
> }
>
> u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>+int xe_ttm_sys_mgr_init(struct xe_device *xe);

   CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
../drivers/gpu/drm/xe/xe_ttm_sys_mgr.c:99:5: error: no previous prototype for ‘xe_ttm_sys_mgr_init’ [-Werror=missing-prototypes]
    99 | int xe_ttm_sys_mgr_init(struct xe_device *xe)
       |     ^~~~~~~~~~~~~~~~~~~


couple of issues:

1) you moved the implementation to a new file and didn't include
xe_device.h, creating the build issue above
2) The decl shouldn't be here though. You need a xe_ttm_sys_mgr.h, just
like we have xe_ttm_stolen_mgr.h, xe_ttm_vram_mgr.h, xe_ttm_vram_mgr_types.h

Lucas De Marchi
