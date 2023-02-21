Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4FDC61DA3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 21:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5879C10E262;
	Tue, 21 Feb 2023 21:57:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6E10E262
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 21:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677016657; x=1708552657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2cG1ptRjUvOr5aulYR+UoWOIqyOt8jsyJqtoDcwCI3c=;
 b=aBztWkIPxHi/G0WseH3ENzmNwVtypOKzAnf571GnYoS5XCozlLJf/f5M
 2fhYcii/dR2gAHRVBZLq+HUfOdVpa06/e47fUhJUySiBxOrqBDgNls1/q
 7jVve2nevYFkzVlEcS/6cT726kHsxqT/tlP6pbyYj6OgJBnyt4bVeTY7R
 Pm4sT4gEc9BaSIgTu+BB8OdXOgQz8KOefEPq8+k2/GrEosfOYg90l+5rG
 9i2XXvQ71mS43CxzNfSHLtlLF/O1c/4eOj/bpKfUOCZID7h1wWgVA1WGT
 kEh+cqrwLKUE7O+ayKBdK9MbphdxAxbllsQTX00wykiGjHRk4/NecCC0z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312392394"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="312392394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 13:57:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814667803"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="814667803"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 13:57:36 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 13:57:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 13:57:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 13:57:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7y8r72zatGR76/lJJH7KKDTKbBa750LSCCFkV1+NUJP9LVQKEfp6k5a/FIxdJa1Xo/IP8Nlb1/ZHlvSxfluu0v0EAigZWlipeuQdw7F4XAS6Nm5KxIQstLd6MaojBEngPYhRWgJOq9ao0zUsR+KUXOVToXwfzHD6XkJN1PkLQrRa4ZB1E1yNa9YdrNvUbb70N33khPj7zlmYl8xzxyUf8ubII+HN/9ZFVxnXPCzC+tu9ENMQQ06HRgRilWeNsrbcFrdfqnlyuH/TolppnHdcf7aiq6OpKGLZRchg6jQ2Sn7ZhFSytD35mf23LAyyCelAKHvWHeLgQl4JSxP9qo6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gVJ89DIU8mnKQJOOlsiMw5Jq9igLPeYDkA7v5RB1ts=;
 b=WBatlT2dkPdVyup3q7Z4Mc0G5ZKyE+0EpKPK82+5Y7tDhi0psNFjkIJIUsUBC2LrU4UY27diubqZdoN6aYYQxPTx/m0Q/SSha5eQXOGL4tx4wjC7/JmF6RYyaIBDiE/+7qMVXmfOT/9dwENiCQIQCI+OUMlcUAqimR7bBgptO0q3xGTw1HFgaOKx2s4KWYlvRUuETaXp2/KVAAHQSR1nALVXrhHBbdm1K2v7Hw0MTaz6ylIJxZHaN/swtaufkts3XieJupKKsVRcC/NFeKJ1n5D0Q9o7NSs5S0ySIps0fSc9JnfwPzD+Bso7xRGVG7tnBBZ8yC2PBGJtFlkFHrbMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 21:57:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 21:57:33 +0000
Date: Tue, 21 Feb 2023 16:57:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y/U+SKoaTsW0o9/w@intel.com>
References: <20230215102845.278677-1-matthew.auld@intel.com>
 <20230215102845.278677-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230215102845.278677-3-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ee3e21-78e2-4cdb-9e2b-08db1456a2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UP17WMG5iC47TTQK9gAPjCpKMa38nhXX3iKp/nCFVZzRn2T/REcWX7FlnxuZ5/wVjmLDrTwGfHXcojOoIvaBFJBzAgP+PC6pPBdCHO8HuSRbf4MvZcMeXYx823enSoEvkdNywFMqzuANXAwl+CEd439zpBelSKY+1V3/QEmSrSggJ51e9XOqaIEUIjZA0OOdfIYJes/X5H7zs9D0G0ZbjiynPpfKUM8tCQ/LmuuaHqXjtaReUtGrv+BuZR0LiYd8Kksl7NAYrfWVyteLgiiGFhvLuqMGsSWubLwm2CtfNZerpuMR/myJXDpQFXnabf6Q949RDe95KIksdFffCr+6q5PCSR6kQv3hUFRRtF5AY8DKv65T6OO3H6CPBhbry4bcwVFhsA5ZxcWQSNxG2utsxFYxLi1q7nzz/6o55q9eSVx9rB7syqFZUU2RsrmdFUQQqnJA1FFtXFjq98EgMImqNQhiuzQi6MXai5569gZb+aXsWvyM9+2xSholaT/DEyM/1XAnoIAdscld2DCbU4fpBmtKcL5ub2wpen0bVzSbb7aNn1/vnQPzPfanB1nbwyCVMsixnICl3lK7IRMYH4JHCGiQgFxTaOBIrXFGMF5Cfc/wJZkxDEnFex15etm+HLFMbTT1XuSAq9h46RTXBPNeQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199018)(66556008)(66946007)(8676002)(66476007)(5660300002)(37006003)(6636002)(316002)(41300700001)(4326008)(86362001)(2616005)(83380400001)(6506007)(26005)(186003)(6666004)(6512007)(6486002)(2906002)(38100700002)(36756003)(82960400001)(6862004)(478600001)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oFj+2g9f7VKozx24rnMNMKwff3JMGzTarksRN89BxZyPj8wEfdcIdPEef+Ev?=
 =?us-ascii?Q?95GZYGe/mxS3shCyXa1ZN7GS0Y25dZ3vCQlqHTpJHmGEDh2tLWXZTg42ssLM?=
 =?us-ascii?Q?UeRNoF2KkQbXM9iaGhO+uIhOeG6cFSiAxKrWW/SZAPE2zmxHmg2QPL6cOal+?=
 =?us-ascii?Q?av3Ge0SlNGOAnCBCFcw7MATFYIARstRv1oWKksbTq0xYfWB3/r/OypSx80UF?=
 =?us-ascii?Q?wqbhW5dLX2PkyVKHkg0mU2Yzv97Do1MIG8IGAjKUIgdmwBjB6ijdKI115KQ2?=
 =?us-ascii?Q?g8C9B711KTVcaJZmpooa7iJmdQnYSBA2qOhAhieX1R2zTDq04G8Wl3veKg3N?=
 =?us-ascii?Q?FZr7RDyi6HeI0B9eO8zp9ww8mBAn8rVR5s6lVZyzdcTA9WfjF6Jp7mUzYLc8?=
 =?us-ascii?Q?j0xAkYB0sdAMSU5Bk4wd9P/YAxunTL+AducnHLoVsY8lkmsSgLcMrXI9jeNw?=
 =?us-ascii?Q?qvEEyBC8WxWKPKTtbs63MzAIDQ2VC2AFZcogSiU1NRMCglfEMxnbgz76BLQV?=
 =?us-ascii?Q?weffWYRHwC3V/7CFonUOj2RqOMHVGXDEomTT5L4U5XKi3Q2FdX8uP8FikJZG?=
 =?us-ascii?Q?ZChjWSjn6+4X61L3KTDYGEZP7bf6dhZN6SLFR/6Oq61VYm//qul+2IPrNgq9?=
 =?us-ascii?Q?ovGEDWfPMS+qXqihdjCLgGbFVBZQpErrcpf+u0m3CzZeByRchDO2fzdPFmQt?=
 =?us-ascii?Q?8L7Bfh4HdLbfGyq4fwmGM+YZeOaOrTPO+yf1UUENamCcvSsWTOtrD6aW/iNK?=
 =?us-ascii?Q?c/w2u8ROPmtzNh35GDkDAfP0Gu2C9pkkxZjg6YNUIyyv9IxoK+65F9H+r/MZ?=
 =?us-ascii?Q?cRw0gCi6hxEW7xWcy+/niinL2wY/z1S64NFCIQ3JhV2xIGbIe9cCkqxeFC8C?=
 =?us-ascii?Q?7rZjEW2vQjo6ERWxCfLYGmS2ztEmLDc6rEM4C64N7tqCOFyH0NNCZIKwj0iM?=
 =?us-ascii?Q?7c76W+UW/7+hfwi72vzbYmzgFwLPd7AmM/PU3MrVq/+qnUb0iyHg+GImGe53?=
 =?us-ascii?Q?cOpJyrCXt8W55o72+/JDaMeHP56qNfrVR5PkLiWP+wn3ZKO9iUrZPH+YW8mD?=
 =?us-ascii?Q?9WBZnPRncPEcVFF6TAZ9//piQU9HIPr8WFDCiFfqBuKF6YftU+7yLTvotjTb?=
 =?us-ascii?Q?b4ouMC7YlbQck6ewOaJRBYQ6ZoydAR2H3UYbxuPMn8qlV8mCFg9Lc30jbOca?=
 =?us-ascii?Q?eDheDokAAdpFIy3P3oBmi4KuN2y+l1X+eq2GyWVrmFXsEXaaEDZhIeEv5fPX?=
 =?us-ascii?Q?cpb/sx5bKtyluD9gXlxBP7GfkP6PNugwaV/xKth7qggc0H1fib5QTNX4EZSo?=
 =?us-ascii?Q?vC3tpGzYgE4eGkxhKkRsrWA4Vtxj18jwMWkN834h0rSaM2rZjj148fRTPEen?=
 =?us-ascii?Q?m5Y4dICVNoeizBleu2JS8OE3TS9G7WMefyup8MycbnyiykkmI3zxnGmMl7qw?=
 =?us-ascii?Q?L1tjb0sK/Sz3dVSfaw2OOm5Ud15la919xRYAOV9jj+HN3pYGaL6D8QsjQj4d?=
 =?us-ascii?Q?6F3Zd93VqpeVmuCEplNb2ZCq56T1c9dTAXcCZ9a2o0UVHYBqSXl8zHwp1CvQ?=
 =?us-ascii?Q?PlkMvEhPcAPi3//TccjPRC9RL6RuRZLZRg4npzXCJCi4gyuROu7aWp8V/Rk2?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ee3e21-78e2-4cdb-9e2b-08db1456a2bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:57:33.5973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDpr7zKns/uaeG8oHnCvVTAsG+nElLO1wg1ilxyg0ByMO6Ygqtqs4i9TYvfqxhThhph2V+hyHYpYBB68Icy4xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/query: zero the region info
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

On Wed, Feb 15, 2023 at 10:28:45AM +0000, Matthew Auld wrote:
> There are also some reserved fields in here which are not currently
> cleared when handing back to userspace. Otherwise we might run into
> issues if we later wish to use them.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Lucas De Marchi lucas.demarchi@intel.com

series pushed...

> ---
>  drivers/gpu/drm/xe/xe_query.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 6e904e97f456..f9f21bd1bfd7 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -115,16 +115,13 @@ static int query_memory_usage(struct xe_device *xe,
>  		return -EINVAL;
>  	}
>  
> -	usage = kmalloc(size, GFP_KERNEL);
> +	usage = kzalloc(size, GFP_KERNEL);
>  	if (XE_IOCTL_ERR(xe, !usage))
>  		return -ENOMEM;
>  
> -	usage->pad = 0;
> -
>  	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
>  	usage->regions[0].mem_class = XE_MEM_REGION_CLASS_SYSMEM;
>  	usage->regions[0].instance = 0;
> -	usage->regions[0].pad = 0;
>  	usage->regions[0].min_page_size = PAGE_SIZE;
>  	usage->regions[0].max_page_size = PAGE_SIZE;
>  	usage->regions[0].total_size = man->size << PAGE_SHIFT;
> @@ -138,7 +135,6 @@ static int query_memory_usage(struct xe_device *xe,
>  				XE_MEM_REGION_CLASS_VRAM;
>  			usage->regions[usage->num_regions].instance =
>  				usage->num_regions;
> -			usage->regions[usage->num_regions].pad = 0;
>  			usage->regions[usage->num_regions].min_page_size =
>  				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
>  				SZ_64K : PAGE_SIZE;
> -- 
> 2.39.1
> 
