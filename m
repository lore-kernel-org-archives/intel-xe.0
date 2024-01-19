Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF065C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BC010E937;
	Fri, 19 Jan 2024 00:02:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1548710E915
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705622535; x=1737158535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=54HfTNPWHl9OWwII1S45vdtrhV4r5yIhmSGDi84FEwM=;
 b=mVTXfzDm5ShllC6qh4J7hwgh2+wXanxqjjP2ypcoP7bPEz+NQVf4j48g
 zX8eZUbzXQbjKtqNkXexXusfX4vaPUwyXBcLorhiWQHZXZZNOZxvniKeO
 aX2IZWfBKSoXwshV/O6qKtV9Wjdi+zV1gh/GOMXoOyfFYen/RZcWxNo5k
 HOs8U6F6T69vN2RBkDB/un/KbG1+E7bCs3WTffw8aKdIUYZ0dSzSLIPrC
 gBJcpdWUVv1ReS79T9Ig4vyYk0awyRj15mq7oxrj5Y1/ZaVACzKuJQi8s
 sBtofqzEImxwF1HtPxmd3IrWkvVWRs+3YyCn8EBn+d9gWKbnZIu5pMWh1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="464887607"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="464887607"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="760988998"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="760988998"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 16:02:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 16:02:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 16:01:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 16:01:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 16:01:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ny8hstN8lFLZzD4D4//0cHGaZnnDegEk6QUIlXtmFnq+OMrYzxreAifUUTHnwhsX5TBtqVYFepsLYfUjgslfbtWfXLDswFrSdiB6VeJUkOS5q1F1U2H8Xe3E7ZwDQvuhZW2Tw9zJq2UgFbbPsVo0TNc+qddxj4Hz5OisgnOAj4h7sbeqSC+e8XBIEAOP3i7vABSHOV/rdABUI+7RtAOWH6fPn2cJFXbC4LQWp9q8Fb+DKNklhpQlCG9+ERdzJStpee1rsMBKSviR/H5o70hSZlQ97oK2vQypRUX+P7qJoqf7hO2wa8CDr9E9k+f5aSA++hH+CUbLNxT68qg8wNDN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XTSAEbRLOHzQi6I745hkngJRCtPF3JGZrxIOVKTd+0=;
 b=Oa2LYFL+Ag/izULfrBYzO/mAkupkcRNZHhXzxyR5VwCy3WBqXdiHF8O6rYWkekv1IwYGxVFo/mz25MQ+fdtmikpqKNep4Guf/MGM7w8GYF/rJ9KIL40nkPZd6zlsed8xycGmFJ7WIpWSpkIqk2wYCyyyJpnYWGj9TO0xS4h2dL+sSsRqsdjw2jEOIeNK04hcRoVNyF1fi/AQ4q1a4Bdfbo/ckB2iAFLGVkeIbagTZmcJhv58lhUFKuSoZ3hc5hqT65M48V3gzkvCymMxylh+wr7FjmQjVbqJ9UrO6GH6IhG3ty/OZt+BEmQ64hKfiVHREXRkRW9RibbeJFQbvGtyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5566.namprd11.prod.outlook.com (2603:10b6:5:39c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 00:00:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Fri, 19 Jan 2024
 00:00:58 +0000
Date: Thu, 18 Jan 2024 18:00:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <btwgdt4q3v23was6z7sqmmcphfctbjjgteuy75j56paa3cohuj@zhjfu2jxokb5>
References: <umt5wovebemjsdu64vzskml7u6cn26isgxkgyzs7dyb4yjipwe@gnmq5lt6tf33>
 <20240118214856.399952-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240118214856.399952-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5566:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd26c5b-43ff-4c0f-6554-08dc1881b710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjPhCdpC5PQoyAjxI0Xqw4NDmj5Ykbaywk2Oe9CkvKUALp0JFW4fLsjxJLh1KreZvAW1B719Qm7/vcnTrZXsVq9p0q9SJr1WJ9vm47gswEYrPu4iV8eGrN70spiZFs00LQwp6mYs1N2aFA9cnOhbFs/TnUB0n6D8N8Di6gAGyPHqg51+6FXxJbLAroN6+iDbM94DzH7G2CUalsTtNaXIlHkZyP2nlsNzkM9Y2RdcDf/uLiTP+haBeJh1Yzk3mWM14JKEOdFJFg444ACD10f0ZcWDPR8B/FelBIhEdTU1XHNackG7YwbJMbKVV4OQfY5IbGFqXp79dDFQfoHVquu28aEa4sdOn9qrgswe6yjkUXzUkKjuHZ2pW7sQrBnZkj+lm3YGIBzC5JsgrWxoEOw4nITSa5gYPcEVpofFOHjRbCW/Ipo394I12/WEhxtdt30aN80ersnPT52sjHjW9hHptLm2SXsPJHfqAxCIt6uUwhp+2H8wUq6Ec8xYcpieujME9iWeJKcOlQmPRoOR44b2RTO+uMszWO+HTdHsLgvHQpgqPwv0+qIUrXRZTZVVyldu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(6486002)(5660300002)(26005)(83380400001)(478600001)(9686003)(6512007)(66946007)(66556008)(316002)(66476007)(6636002)(8936002)(4326008)(8676002)(6862004)(2906002)(86362001)(41300700001)(38100700002)(82960400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3POU4IoBwIYOF3RW+wvb+ENs/aWJz5OcR7PMXA+8QPVupdfGLdbaazyvTSpg?=
 =?us-ascii?Q?3zTLIIxVRdhwes289BUvA6OtXnd3CpqEfHwucFgxvzpPRIhbBbrk1MV0jdQo?=
 =?us-ascii?Q?nTFGpYLZ9q6VAC7rv5mBCSBpz7yChJq3w6VZG1TGjTxzRY1blY7xSRyZyiT4?=
 =?us-ascii?Q?QmwSl9FIL4vowjIZdUBBmx0/WwtT5Rc8BLeKvhp6kKH27AVFnC+U+TrTQUbr?=
 =?us-ascii?Q?y6+XRNYpEDZhQcsu6SLQpWcDMyDLbbumMtTAtfH4MrIhRnAS6YO0Jj6+BwTf?=
 =?us-ascii?Q?nuX3zVrwdMgdTYZytVWJPoRlKpg9tMRC7acaoLkzad8XL11rqGTi1ftg23d+?=
 =?us-ascii?Q?P/FFPXs0DSpKyvMpouCk+H3zs8huFul1tiaxNt8lwjRhB/WTexIlSG1OAxiE?=
 =?us-ascii?Q?O0t8h/6LsRAdy1/6lqpAqEqbboilnksud9PB7osfCzjmnNkNHFWIt4KR+pXv?=
 =?us-ascii?Q?+PHkdP9tj1TxJGhyr9lHMzBXi9yefwUFhoJpwQEMrQGUFBklU6MkBCgQke0v?=
 =?us-ascii?Q?Q8L2nJvFuD1xrXki6OK7tA5zdp02sNpNvICKiHKPfFenv659hqB7WzJajTH7?=
 =?us-ascii?Q?Mk91iEhl5eaMU5QXGbQgbXuGfXjvhgscus289naAUSNwBw7cBCAGjxYu8cJV?=
 =?us-ascii?Q?TUIFsyt6qLzdnKgfUWqUmLCSq9kYdKixhG7ldw7L9thnkSVtRepwjlNkVU4J?=
 =?us-ascii?Q?3oVzK75S2s/8cS5HcILZTAyDaQhyW7aaqz44hy4DdilgxmcUKbuInzdwY9kE?=
 =?us-ascii?Q?qfSuyUq57buYX2GRd3QpCh7nMC3y/YqI6iIhoEW5ps+oupx0gCyBbZ/uYt0P?=
 =?us-ascii?Q?Ny50+XJeR/l5uCeeuFa00Rg7cnQVjA5yW/h0/TPr9CvuS5r1GhVUOKtlHwcb?=
 =?us-ascii?Q?pENaT7KV67kodoVnI5DSr4SxcXw+HTxjvSmD7oF+Ajk+eUTHHvIe5Q/gkZpc?=
 =?us-ascii?Q?haroBhfPN03K+7DNqZ5kTNsNoD7u5M4e1pZtvpZJ9oik3FLEEiJhs/45DWdO?=
 =?us-ascii?Q?zR3fBzcv0JkZ8GuGQNt7bjfv4mN4PWOOt126f8JV2txlSEhoqM/pi5olGrHW?=
 =?us-ascii?Q?bTpbqRxYTJxwCoYCH6LJY9rWbXr+E8lPVv/wYGKSHGxZVpgOJ+Pic6lWAjly?=
 =?us-ascii?Q?++wRGQmeAAwCgucmDMk2bhmNPaiPQtJO/NngeAFbZe7/ltYw8GxjF3NfhRHD?=
 =?us-ascii?Q?GwAelTtDJdDAV9OdGN1OzZSk+K1fpXEcS1C8CwvvfB9hCztw6Nw1vmjmS6BD?=
 =?us-ascii?Q?B7kZpPXcCIniZbVXDT4rceVRriLSMAgfgcF9MW8NnCTK7AjXzuwidfT5aKA1?=
 =?us-ascii?Q?W5DUcNPprPZz8kg8Pe17VU3DhzYj0ZkgQrNHlXyJSPOzglTrQCfVI20dA7nF?=
 =?us-ascii?Q?qA9n9ChkJGYOGKUBiNgwr9F9KRtP4I4YnBDi8PzK6SPAkZbyIkHM7ELsZns6?=
 =?us-ascii?Q?45QuvYlbnNOIDN+SUvCXLu0HLzDa7QDjlz348+5dmW3lxOOqyVhkQ+1fIjpC?=
 =?us-ascii?Q?V0Fcdra89C0PBP1VfhVK5LDWTQQ6Wu1928pqOdrVAPVtGRlCXDsZ1NMG2EHY?=
 =?us-ascii?Q?xYTsVcKRwI4iVf0EaM/oIDvipl6JOS+RqRPN8/Mm+xVILWyf1GJQHB6oVvzv?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd26c5b-43ff-4c0f-6554-08dc1881b710
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 00:00:58.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5eMJrLB0abfFkw7jU5nCFTFcYIjzyp40Dsk2qdsCrS/inBRoaY2Ml9anUSthLsTZGwhZ7FZ4/XiA6H25aKwS+8qB1toR8p+QXl86jh/yVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5566
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 04:48:56PM -0500, Rodrigo Vivi wrote:
>This information is already present at
>/sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.
>
>v2: add missing chunk
>v3: remove spurious line
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas de Marchi

>---
> drivers/gpu/drm/xe/xe_guc.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 2891b0cc4f7f..576ff2c1fbb9 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -456,7 +456,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
>
> 	if (ret) {
> 		struct drm_device *drm = &xe->drm;
>-		struct drm_printer p = drm_info_printer(drm->dev);
>
> 		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> 		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>@@ -478,8 +477,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
> 						SOFT_SCRATCH(13)));
> 			ret = -ENXIO;
> 		}
>-
>-		xe_guc_log_print(&guc->log, &p);
> 	} else {
> 		drm_dbg(&xe->drm, "GuC successfully loaded");
> 	}
>-- 
>2.43.0
>
