Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE8AC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 18:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9310E17C;
	Fri,  3 Nov 2023 18:59:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE22510E17C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 18:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699037942; x=1730573942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yXlkXDj6wDxL1m6/l9qN1RCml5E5PqWPOc6mXJj/n2E=;
 b=iiq1nS6PUSEhL5YsX02CnMEZH75YaB8p3oRoRT8xWBvIVjDuixl0mHN7
 d5t4mvOemEBpg1TFIcIbP6ZJYVEqY+qNy30nNQe5uWxLH5AbqduTRR8e9
 ToKV90QBQ9Fz9T2kaY+XVZAgPrS76TwvF4IF6FzCq3WLfGKU9Ai721NYC
 zqvg2oEAWoplged8alLPQXrBac4p7KvZUH+IfuzcdRx/CjgfkS/0Dg2Ym
 uzJJ+B5NbXdY232LrGEiXgqUoGSPCHnKjWP/GT/0MtfNMcViRr9Fp0F0Y
 me+x0AfFjIvujDmHeZFaL6A604nDy8zT7uVwtmdcMAV9H9fCq16xSlYWK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475237783"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="475237783"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 11:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1093152997"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="1093152997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 11:59:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 11:59:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 11:59:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 11:59:00 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 11:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmH2JHq/BJIB+AHRVhorjCkslJe70ZMdOYABI/1mG14JtU+JVSOn8zcHKR4ppcQTlmCQsB69tp7zZD8P4dqTRyTY+FxdRNwjfO5doQVvNq9laWFP07THegJni30S7HFow+9PMiU64FaHIlnV+Qc2WxBIACXAcTlBgMh/tRw6cv7in7HNl1s4z377eGvWL5VAPmkGj1FGKAY94jiPLV5IoqcM0DWa0QBnpINv3lO6RxVygtqUZJSc2RPxbvG5Ph4oX6nNn9myfqsw1D52FATxuuqYAxiylgBNQh7Dozll6KAoZmd/8yJZWUKwHm3WFOSxQYGB1bEJPuzLCH6ODzHxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inTDgv5yhXFAlYrYgBBj/OCftQhU2kG6joz0o9gOQN8=;
 b=VdjnGLfiJKmz16qyWZXKImBZM64BAg4hZkXcDc8cXWS5JbhTx4QbYf1v650Ww98EC/39H1CBYSEJspnkSaXZA2/i5wUj3+I55icRoISrS/Gwfkhru1heN+TV0JOwu3oqoSijBALzsWxCZj2g72S2xXmAr7F95nrsl0gX5nYIafe5cz5Tnk3FwBPA29q2J7MlDKR2WMgf++1ZJ+yLcoGR1pV/mrj0cztp4i4v7ypYVug7gY+j/HJubgvh5+8Z7YasmLBMZTNu78x55rNpm9wUeJ8yHUWlORqcTSQzJA4YZ4idgtLDbxPzbOKWD/wJjTYwItbRbdbLcXrLcq6IN/elyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Fri, 3 Nov
 2023 18:58:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 18:58:58 +0000
Date: Fri, 3 Nov 2023 14:58:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Message-ID: <ZUVC7Vb8UEo7+6i5@intel.com>
References: <20231103182922.909972-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103182922.909972-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a76667-b2b9-44f5-6f59-08dbdc9eeefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wf2ywWDV/0Qdasp4xN5T87yYSjjDjW4onTnKiF3HR+xhizGCFego8rt74qRKVUpBTmjugxPX1Hr2CShL88frt77Ie8+fRu3sP8zDY+rmghbSv8AbKebpSh6paKN6moPvzBGp0ZNPWBv5d02zuE+ICbzi8RmmGKXAUWZ1vfoZkaUMqi7XtipTsp0JH61xyodf2Rs6v82EmkDX0SnauPX98imkYPVrkWjIq2VYiLcbyee4Nh15xddnLWpkP3UGYZKeOvyUtpRhEUZuwjehf3a0vcIFqyxlPm7BXry+3JDDtM0JCTi8vkd9H4uIYAXms4CXr92I8fzvGcL9/I11pAP0T+V4r8ard/7sNvgU2uUH+qta32Y/pg+rbiPn0jNJkXhHPhHDk59CfxH16rIsgHe/WYGgdYGsWG5hH4GTMw7gyqWsy/zM/2+yavTIkp2MbAwAOiZkyKfSEZHlTQLJkalTpB1RJ6eWHaNHIdXm7waobi5rWm9tMCuo46HCnnjc4K8Z2LPuOkucLA+5k1rZ0hOZPhJajZtwi2HubOTl2F/H/JnmK1j0rKPdCRSl2wUZT+votzXGAmmIgzWU2YQNMGWUjmUSh2v7j9sPv+t9e4XKP5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(316002)(37006003)(6636002)(66946007)(66556008)(66476007)(478600001)(6666004)(2906002)(6486002)(44832011)(5660300002)(86362001)(41300700001)(8936002)(4326008)(8676002)(6862004)(107886003)(82960400001)(2616005)(83380400001)(38100700002)(26005)(36756003)(6506007)(6512007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/pgQvC722EivuyHkb9siUbPhMCYowEa9+/nl3a2LGmNkodFZPsyepJF5Ba/p?=
 =?us-ascii?Q?OijvjhziVRhe8eldhgML0dOcQlL92PSAqkc3rsOOTSzwCpX+/Ii/SKo19iNH?=
 =?us-ascii?Q?oRR2HyjR9ygSs/fRMxtGPyRqS4hCCq3zjSbVy4i+3hiOG9TKaZPSHUEuzu3I?=
 =?us-ascii?Q?ThqknqGRSCXzQ6czN6geMy4HAJMjDe6RoZrJRt7rPwj6N+kSLE7TIkdi5SOq?=
 =?us-ascii?Q?i4BFaO4wHoNIZUk9hVfhSxskmu/h4ykNolUzyqTvai+0wlc4vBja3zC3paDK?=
 =?us-ascii?Q?9MXb9e9qZPmXdWWT/yStsHuNKQS4+yufdkSgTZFKgq/bZP50jAh18VsXejO3?=
 =?us-ascii?Q?CE0EdY7fNwB7Q/kytuz4qdon8LD4LbovHIYb5DOohoTpSMMHkdt+YmjZiTRo?=
 =?us-ascii?Q?MreVZPIWBvG6k6ntvi8HABmYiWFelwPNJbWp61vbLNh/+DnGSQctyPBq5T6F?=
 =?us-ascii?Q?6rrLnb7NZIcPxLJ7517sIsav7abpCPa6r/gjj4rUSarRVDVeorkzHa6vOM6/?=
 =?us-ascii?Q?aCKewmyVOzwQ3+/d0EXTjlvonxwMd9GTrLrtROv12Jhu+cttJzpQMf8oOPYv?=
 =?us-ascii?Q?yAQWzrnJb/TZWev5EN8yytI791x94Ew+fXtjlZJhNPIxSLhI/3h9bt8rJfu9?=
 =?us-ascii?Q?MU8EPDJo19/Gi62JNm3FiPcBZqNCHh5PWIn/uzU3vE1yDcnPleqYLaoCkEhN?=
 =?us-ascii?Q?t4BDdB0aOnlrMUCXVnBqn6HPG/s5IX5BUyRtLDxSwhFHdqYuMPUsMAAhPS1/?=
 =?us-ascii?Q?BTwC8qhhJlZetRB60i8g3pldF22soe/9ZAcgKzierke5Ifqptd6l9gK0nwA4?=
 =?us-ascii?Q?f9wFsYwqmPgiDbH8mvrWZnma42SQLYAQKCk1DFKFLhxNWnw63kCdqlZqbRZr?=
 =?us-ascii?Q?i9G0e/39AjUQzdiB7v8CSzUEl1pyvgT+4fR+BZqEirvUl1DRAdEHD/84iTa3?=
 =?us-ascii?Q?vXYPE9gHip6dsWYLvOSpYqYPaWg8yab/1hdmFfSoNwMV7Chdim+oDwOasLos?=
 =?us-ascii?Q?c+gT0ibNlb2TQocB/Qkqbb8u91Itf9Nm0w/eReJJUxRKynPKhywOjchl5FI2?=
 =?us-ascii?Q?ay9MLOumEVKq9di3hJa0fMVOu1USL7EYAGgTtPm6V9ce1UUGaz6K/bFDDS/W?=
 =?us-ascii?Q?qYog+l+O2Zrci8nyrZbU92C3msxFCQVSbnUH/Cg5UuYQNICsWRaIjM1T0VdJ?=
 =?us-ascii?Q?4pdD1Hq9Hth3uDG33uTUcWhqlj+PlFD4qLdJ7iyYyi32LL1I/5eYOvYGT4ep?=
 =?us-ascii?Q?hcNiM9bls7YqIcAVFljY6yEEbyreKuLe/eTJPORaBQiFbpcmovbVbFt5CXbd?=
 =?us-ascii?Q?xUipXlmxMItTSck76qGsSRr5q/TTmo7vDSQ5gpLXxOoVaWbwXx6KWGMZHScZ?=
 =?us-ascii?Q?ZnglAk9ZdVD8901/OiZ9tseklecZ5QVJPbKpI+BLrWWpvEI7/EO3OV4oKSor?=
 =?us-ascii?Q?DR/15KdQX8aFOXRqGf1hAk9MQxS/UDPfVHtByGvBftIPkb0JuQ/qga5M/001?=
 =?us-ascii?Q?DCkPbQ44Hp+mTt0pMGQW1xKfoM9OgToEulBUkoJlvXJjEhqvrP0TaYQM/Jnp?=
 =?us-ascii?Q?cubgtrOmb2f/eSHWCj1+1+yiJtmR/N4l7+xdL0hU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a76667-b2b9-44f5-6f59-08dbdc9eeefe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 18:58:58.1096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDQ518HYQSSaHCVI5/mj599Nm0ZGR9i70n97Y1oDAezdgyGtv81w6uIhzRup2rfp9gIzeA73mpDUXGdZ1RwYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: clear the serviced bits on
 INTR_IDENTITY_REG
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
Cc: saurabhg.gupta@intel.com, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 11:29:22AM -0700, Jonathan Cavitt wrote:
> On XE, we have to write the serviced bits to the
> INTR_IDENTITY_REG.  Do so.

Please have a more descriptive commit message, explaining why
do we need or what are you trying to solve.

like, why does Xe needs but i915 can stay with the other code?
what bug, condition or corner case are you attempting to address?

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 21d5273d7e611..c5315e02fc5bb 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -232,7 +232,7 @@ gt_engine_identity(struct xe_device *xe,
>  		return 0;
>  	}
>  
> -	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> +	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), ident);
>  
>  	return ident;
>  }
> -- 
> 2.25.1
> 
