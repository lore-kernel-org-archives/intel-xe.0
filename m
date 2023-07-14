Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B04BEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC7710E88D;
	Fri, 14 Jul 2023 14:13:02 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6E810E897
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689343980; x=1720879980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g9fFL+5U0esz8uRwleqgelqBKLppleStyGKk0PrGA+I=;
 b=i3ZzbPzV6ppHzrP8kFuyDiVAsCeNf49MFeJXpVg/hp9f12EmND8cDpzm
 WURq3B8z2qbmWNM6ItKVJbV5jyS9+lrPcYg5AL1USv9EnsSbKtu7XDL/d
 IDdTfp2Z2bHlRopyoGPMCfi8mlehdumobBq8gyAPxF3j7yR2TuQULEE0b
 xR6Edr9JmEHJSPCB8NROLY02SbchYXBgDOGrQRTfUsmsHMy5UbY93llgc
 eGpBPvTwpuMrdF3RRYf9nVx2GAH0vqQtXTzCpTbYWUGYJXKe04tZhPMDP
 z0kCBUApGERUXdQO+0LJq8vOyrjyjhYiurcbHhv1FrigJxb8JgzsqVo2W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="365522175"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="365522175"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="792457007"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="792457007"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 07:12:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:12:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:12:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:12:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4f5c0cJS9u9gZ+akcM6MgFkOlyAjkzpo/GqaBRJrI7U4voDkYbttNHk3vRuvH/FD2NmE4ZcgfFG1a6aEi48ajtv4gP4jlJz4zjrP+U1I3XJvaBY+fVzJvBJRNqGHIym+oeX2vSDvEVx55BZSU5fMRMVGAzhXvadOhwHuZFmC+86EueVqd6L5/rA06fGglqSfQzqrTrF/oV1U0YqS1MteEhQLZ5s0dHh0zp0wNV/mxAvOwIfzaf0VU7dx3B+bktbQ2AasxS1D1H8cPqAyqjGvg42I2vAKR71UgFejIZvzyjZnfuOgp5WiKOAfTyyDV2rJNwOxVga/NxvwFOJeva/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1lMpCcYzP41eUowQIdHwMLY1HKtutVJ86YteGBAXxw=;
 b=Y+uYl3VoK7byCfmpPv5lkKQqP2wrqPBgTS4tZVR3LFj6JjvChuKj7TziP6rOv21+Qo7CnZnC58mf2FbY0hU5/kxAtJtOo9LlHhndyKzqV6h5tNblmF/6PtjpuUEPcEAHLDt16tcRojq3IXItFeOXGYAgRN48DF+lgIlpkw/ArkOTDdH57CQby/xT36655o2JXpm3yiDVGBKdcAZJ4TUakDkoyJUutjS/ouTDAHpIOEsKhTrjLwPfbqFnRAF3zTi7Kx7E8PKyTy1yngP6SeB5sulrP+0oOa3c/78MymYQd8DJeGx76neB4qDQlSQ4a3DWJB3a8bkD0iLAISkToeI5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 14 Jul
 2023 14:12:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:12:33 +0000
Date: Fri, 14 Jul 2023 14:11:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFXn7dyuRxnNiJe@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 273a973d-ba4c-4603-3baf-08db84745dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0sAYpBV1Yt2J2AguhwWbtQ1EXgpkvrnzOS1WSLdmxjr0SSm+VPe1zoTgmjs1m27ijYSnNSZ6gMiBYaKbZLr+ZZzsdt4GRrP56l7tMyaPbIpEQGh89CPMRViMkw0d17DVvkXTp9HrpK0T2hryNTbfzciW+lHJV++74CdgP4c70TojpalzVSvqKDVch4/QLZ9gn0VLE2+8XrIOwwFzUvZBOubP/weRpo4FzkznFh36yU7IUwY4awEVuBvoVfNbh5AdSCi8I0WuIDXAISImTYIbN6r6ZlvAbp2DT9XhPO7Wi2TFob/p9f/vG4nv/F1ykVsTKx0cUL9JR9lRo82tliApKRTbG2i8SGwDDvPWB+bsBuX0DI+ZXo2izcer8n/bqOyNeFpFafF1vfEH07zqQG5e5xxvKmIkr+nYoiMHynefvQPKllojNXfv12La9Hj9c9rwwz+sGEsFoT31ZzGEF7FB6UtQ+BTci+/srIipeHORg/53Pq+GIL6AexA4fqSimFTTtFSa0shseLQ4ZQbLphz3F7nYKjrxQ754HLdzxjvhhX3MV5Xz6pEDQpOMa1yp4lC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(478600001)(6666004)(6486002)(86362001)(83380400001)(33716001)(2906002)(66946007)(66556008)(66476007)(9686003)(6506007)(26005)(6512007)(186003)(316002)(4326008)(82960400001)(38100700002)(5660300002)(44832011)(6636002)(41300700001)(8676002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4UfG4PGbYu9cCsrVnrMOlxpvxC27YILEcRzt86R9osEx5KGVU0Is215TaNR8?=
 =?us-ascii?Q?UPvh/L1IC0L8EWegdigS5BUz1Ltgh/QA9Y1x131xGqJxSeUgpewcPW7vKRxx?=
 =?us-ascii?Q?WNDC5Z2hkaZ+89YZBV72mkpiIAxyGy0HQy6TatidCw523Zk2XIC99xNtDcuC?=
 =?us-ascii?Q?BQ4Fc44odMsVBtWEB0dIIg1t5HvxJtIJ8paHeLtSV+lF1GD38TyCvMoBJe4s?=
 =?us-ascii?Q?4lDrny8pCrlA55zcDp/eLZmhiTQS1Oy/MW23dMAZd3q1t0P0xfEazvkfqdIK?=
 =?us-ascii?Q?wtBH471p8hMzKPDkO6y4kPULRKolRnB08q3jwY+SNs6e54F2Y9+DBmQUZ1XW?=
 =?us-ascii?Q?jQDIcgQm5hO6hH92rTd2YEt1J2KeY8HHvtVXk7vNovAKt2pjwJVUWOo1ix7L?=
 =?us-ascii?Q?xjh8rp4YY4w9hdK3uAtcVbBmTjqnjfFzmkR25H0tgdAMvBBiH82dvbJi41BD?=
 =?us-ascii?Q?X0ogAVYhqajCpK7hTOXUIX6EM5nAf6QudcTcUX8ewVA6ZlbTRhDaA4PXBax3?=
 =?us-ascii?Q?2CZpwH4UGh5pzHtgdXxDtpsowC2mgFY4LeHAz9wav/RUGs7/CRVkByCSVS1I?=
 =?us-ascii?Q?7hZI2rLtizNqaShyuG4T/iytgAlaR13zaJt4lKbT+XgnnCuCoJrhYsy3WZSn?=
 =?us-ascii?Q?Xr3yoTyslHR1WYa3RzrpM0XJvdofvglucOnHf6z3X2LmBU3ZZ80nK64A7iN1?=
 =?us-ascii?Q?Y47Y338m+06lhLHn+f+jbbt7Sf7oTLcXORYa+hoGlTjaZg32ySgxjWt9KwYQ?=
 =?us-ascii?Q?gFDmPwQU6OqHyi1bcPGCPOc7ZcaZel5N9TVjtpUGGiK/Dgr7j799maZ+YRa0?=
 =?us-ascii?Q?2BeCJ0usQpDTgUL9iVc+AYJxJx89GjyacERG+GLqkGnNEYuWFm+7Jf8rEcGZ?=
 =?us-ascii?Q?lyJIaxrGqUN5vA0KoIhiD+io9Gd0PI0lIxfhQ85hR5d4zSqZHkRlrG8T/9Jt?=
 =?us-ascii?Q?GFZt27RklaflGw+HcZsKKAHp5TrShRQZt3fYmYp0nB5jxmNMcxAfnmvEglNN?=
 =?us-ascii?Q?72iMfLP5+BCcgBiqKq8vYhAYreRzilcmEPIY4beaNdAd8ei/MxiJcbimKiGH?=
 =?us-ascii?Q?vgAXNVjwW19ooMeGnJ5JlFipLD7TsfXMtCLwlj2TKHtNtF/X/k6augLps2sc?=
 =?us-ascii?Q?eUAYZ+Wk2thgUcRmm68WYJS4XT+usuwracBo5wfPTS8ZklvMFDwnyHWsI2BZ?=
 =?us-ascii?Q?SqIDJ4tLWpVADeGOQ/F3M0OpGw7V2ticjL6xAgol34l3c7bsd9bAnL68Jxpu?=
 =?us-ascii?Q?9s8mB0oKZ9TxPyCU8kc2OZKjPV4thyRvIOM5zZISnV+itIOxcMfgwJOvfzv6?=
 =?us-ascii?Q?g87qeqxTRApfO0GqBDLMgVNpxEID0a4PjCVRuqA+7uTEPH/hbQnf35Evytqs?=
 =?us-ascii?Q?AZqnRRUPQE6ZlVtbbsqpWjmKgwfJIHSZCUa+OHw0Qh74yBaa20RWCOxJSNpO?=
 =?us-ascii?Q?KhPyn0KvHcxnjVQfXi/Iv+kGymjvSew9qMY550w345czFIQ5PWRSQJKWAyp0?=
 =?us-ascii?Q?tgILFXzbYcA+ikSJQ5iGCeOhTJKHy17+LBfCIKemet/h/EB69j1aNUuVxaip?=
 =?us-ascii?Q?B77T0eDZK/qxSMdffNiS+MgYxPnA2VUgjMuE6iFnrqeN/Lw5PLtw52Xj8y7B?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 273a973d-ba4c-4603-3baf-08db84745dd8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:12:33.0123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YZ0D53MOChjO/Zp/G/W3F7ZR6A9zctk2KIbjSFVpdv56pklsHGbdAgCdPJEOWt9+kYmFyTZezY4MDw04Jea6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8039
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe: Cleanup POINTER_LOCATION style
 issues
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

On Thu, Jul 13, 2023 at 03:06:07PM +0000, Francois Dugast wrote:
> Remove all existing style issues of type POINTER_LOCATION reported
> by checkpatch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.h | 2 +-
>  drivers/gpu/drm/xe/xe_lrc.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 5c827beaea28..a64828bc6ad2 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -132,7 +132,7 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
>  		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
>  
> -static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> +static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->mmio.fw;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8f25a38f36a5..ddb1b1d6d00d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -441,7 +441,7 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
>  	}
>  }
>  
> -static void set_context_control(u32 * regs, struct xe_hw_engine *hwe)
> +static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>  {
>  	regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH) |
>  				    _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) |
> -- 
> 2.34.1
> 
