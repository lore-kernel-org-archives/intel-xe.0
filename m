Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E815C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CAD10E740;
	Wed,  8 Mar 2023 22:16:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB2610E740
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678313791; x=1709849791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PKvViah0QisGiSKJkZVXQjMeowSIVmL+MxzmmkLcrXY=;
 b=c/BTCsbmoOFgSdUYz8DKNysNsZEZdgCLKQGhzo7OhxFsfp4OxgyeF3Dm
 ALBR2fOEe4+SeGjrHDzVM/AyCbb6zD1iyY8WElm/jMZcSZLk1M0w9h6qe
 AqmYhVORZBE3M+AzBonJPL0wudqWkXLqAw6kb3jrOp8kvoKX0JxcyVNmr
 08w0fvzbTaYnHf9FPGkmyLWpCNeIVM6rJsMJL5Hu8Yif3Qc2NC1VV+JWa
 u5yehji37mClCa7o3kFbOfcx1WxHdHii+bhbCfZUkOTjTx5DE9RoxW0NB
 1uQVu+4UPE1O10zBo2NGmy/mUuHUT8AWpjDWthVq9GRx6Rp630Wpv/p+2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422559359"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="422559359"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679503205"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="679503205"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2023 14:16:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:16:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:16:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:16:29 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHbpn/a5EelhxbP35+CFNHrpUgNI2R4yxZ9JlSlGmMpC3VxjigO30sXyYIBx8N8oIv/soE/Op2eTxH5oEZqDPEwDr0oDhUmFCfWU1/hOrztPjU5qonqg2wCpttgJnTcoG4M7AcEnVvrxoiK3f+4DFRyztESVBSgf2C4Iea0foZbr8CuCyMWTYZCFbfs9jk0WCTOt8mPf7wovh9DVkBO9M0bpoNCyDW8egjilcJxHgS3R15t0xHgo1EikEs4pZBPK/tTXlX/H/dMmzJrMzD9hxv2vDtlS+OE1NfIVPBpmHGIPz9e10pVBhBGEPcXoqxs/nYNTM/ak2v3u26kmLa8UCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4MmXZzvmq/Bcq4yPTX1wXIPuqEG2L0tmA3xVBEmy8Q=;
 b=F8V4K291+pb3gAkIFLIWWIwYKQkNHV1K86ZdhORH8rNatiA3j8zi+qewaC36fJmM9qeRDXTm7I31ukOSBKmkLyrG+R4JuT82NRKKRHx9e+Itjh+3ToOi49jhx0bGwWETHyodspO+izUfU+hFTJXmrPcaGD7D0IiEcX79CpaW0Z/O8W1Tw1XUYJEVvTeewzHDZBcVCbrmJ9PaCBk7ykL6JHAzeg/u/y32LgFX+Zc/Xt8OXMGR0uQe128SYe1tNEK/Ux2OxGTAoVb6iC+UNNb30OO2n/AAeap6Oeg1oPAPWjZMTsDDZHaV41ImwxGhpVM8++hAEDHETtomoui2SxpA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 22:16:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:16:25 +0000
Date: Wed, 8 Mar 2023 14:16:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308221622.GD1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: f91f0d86-1475-41e6-b380-08db2022c1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQmV2woeipDB6ZJ4bme2TMDfVgcOB52Bl9Xcdh6vgYpLMzaRTygDNi4VqmlSs7st4H++gbtaUyK7G6OR30NGFQ0dV1KFKDeBUipsrT9V7P86UKwqUuzMeA2CfIGuWsuTXEhmUGK6KAzKk3jhsa8/jSnYLwQcZRg6mlSpcj8pQFzs07Sq8h2kbPtOcFFniO6LCJOrW9uljxIWhqJALvfSBPogq8PksKsdi0uHUK79TcaSW5mWGeD9gh2diQHx0UfGSZuVAZL4Jxb50YlwwZav3RICNBzs321jtgarD6haiMYA1zb9IEQLDoCuAniDwSnOPxI3TBru7XYUm4MwjprLVV081hggykhS8UnZmLIkEJ34U6I67o2E6PHpVnpKxzeo2pZnn3gSC0tFrWNf5daVLjTI8qdxWoAL3ngVW26U2oDVOJLKeziCxHpheQedPWjdyBnfixaa7z1rparDQTKgoMAlKVBuNTrOWnyFY9LAEapsvOSTLdP46lqtQOe2/6Hjaqhvz6E3awfhTDVo2W1UKP93DY6jNo+IHB7DkWGLnbRhxsNllVTpUMjSXnkzCZbpsP0HUDLs+PMp/zJUduiDgn/d7ZNxnKNriDu/uuZov8u+PNb3gKG4E6iLyjwAZmJbShFhHLUIpFG8Tlzuq9v52g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(6636002)(316002)(33656002)(38100700002)(86362001)(82960400001)(26005)(6512007)(1076003)(6506007)(83380400001)(6666004)(186003)(6486002)(478600001)(8936002)(5660300002)(41300700001)(4326008)(66946007)(6862004)(2906002)(66476007)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SNI+ZqP2XL/7vczKP0sEn9uhGA6S6KL5SI+RZzIg39suSHc+OpIHFow/pNlC?=
 =?us-ascii?Q?m+SscD6BGfNkTlidpbbA2TEAMag6XvOuYTOPDk7fzeF1SbBwUQclV23cTatK?=
 =?us-ascii?Q?I78I7HYx9PrsyfY/pMicvBdjyCarl/c+7l98k9M7DyQoaenRVPWFW5sx0ylf?=
 =?us-ascii?Q?jJDlyMO9YhxFpbJakj/NNgmRqAKgjlqwEc94szzTqRDssmzj9xlq+gHAih9s?=
 =?us-ascii?Q?y2TcSUYfWtW9+WDoIoS13dmCqCWCkwxwrGSTd5HvGpxlF+vmanIUekA1SX+M?=
 =?us-ascii?Q?XmuIZjWLK3Q7DNcrQKifnfU87HSb+XtubehXfYZYipah4UlU2I5GJ4QkVvV/?=
 =?us-ascii?Q?QDq65pYMYwH2oKm+nEWsFbQfpROz4v3ifmtCpEB/8Rh7jWUSit2tSLsodXPT?=
 =?us-ascii?Q?sYe18IfxGLfq6csALipyV01TDVnYODWZD4sQ7JI4G3lVKNXdtpaZ4jfJPzXb?=
 =?us-ascii?Q?tS/BVY9gpTEL7vXXAQgHVIDu5vjLtnJC9had4qj+89iL0/lkrx7rRrtUnFoA?=
 =?us-ascii?Q?HK/V8uUAO0d+OOuxlN5J3OEefM8wUV8B5/40/aGIKKMvog5S0MlVoUU1PdRO?=
 =?us-ascii?Q?3yOUR/5lBl250U/TN8aBmPwa7aYrFP2JGXDzOX/M9RWf2UjcGQBe79mGLGf1?=
 =?us-ascii?Q?/wrreNxXXswIzfza4Sqxe9wxzURJyAMb32Al9u6sO/80YYUad1cEbVnDMwcv?=
 =?us-ascii?Q?w0Gvf/UWtVT+pKQEkODjxia85HPHMJiAIh0j+htJ1qGL2vl+6uyzkLhLluHT?=
 =?us-ascii?Q?w4P8gzKdjgflllU2eqXH1Uw6dwRiznYJN4mT7nlDLAIY6tS34OuCp7Iba5N8?=
 =?us-ascii?Q?iBj/MA4ci4OhOUI+IkHDW8d/HsbV+iZnnZO4tmwnqmmBC0/KGWBNTqFU8V6N?=
 =?us-ascii?Q?lgVx4p1HD8QY07glet2MABRk9KxcR+mUjmCvGgUkxp0EWF4qOU009OuglRzd?=
 =?us-ascii?Q?Swap7NPCQlsTcN8PyfCJBm53aiC+WOzKTdcmm1Fevmc2WKwQbppVeHjj9BVh?=
 =?us-ascii?Q?B3lciU06NKjPJXtB4MOm9QLRua6Febeh1diTlQ8OHM5vgeqicg4TZOu7RYBB?=
 =?us-ascii?Q?kDAIgF5UZpqw1+HtQHCbw8hh78H3hCPbGxVWGTWSupzVtNhzDkMGpOyIbf94?=
 =?us-ascii?Q?Hb2N0qqOb7z7fg5EUTrkWrF4DePVbgeAuPOf8E+b9jTjbwrwK96XJLGIrnJL?=
 =?us-ascii?Q?Lk7hSrLziCh5nL40J/WesRsWmRSLIeFmJHdUWBqxZuEJKeh6YgDrxqFvYZ6N?=
 =?us-ascii?Q?rZODi/Pi1PsLqKr1y60hEzayj+WuGCHBDogoXr8oMG8iY/k1j5mL3GE9lvUA?=
 =?us-ascii?Q?k1qeGv/G3cR+BzunZ0kLOjhihMU0gm9ozUFyrxjMfW3wQAvYH30fAlT7plnn?=
 =?us-ascii?Q?jWvwwHYnOECeSkyllznaI4uf+ev+64tHHlb7n3uLQcIo1A6vmHFIJl77aLvz?=
 =?us-ascii?Q?W/p8RwO2n9xJQBwFy1yHbaS+uFKFhVLL1nSylxYHQWkQoaPx1/EMYZNlA07O?=
 =?us-ascii?Q?lQMKPHkMUQm2IOi3S2Ca3jhPICT647+yWrD2sy5/aFX3ZEPBQNnGFgi22+7f?=
 =?us-ascii?Q?+VGOVlvnMAZDOuz77KLBe2L+V0DIj5/L1d+UsLwPd6V+ycY9ITc7QESF2Dfi?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f91f0d86-1475-41e6-b380-08db2022c1a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:16:25.4811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0nrATABuDb7Dvxxfy+FsAuKQMqE5ByOopLgksrL/MqCFUcwf/AHxHX2l5uEtuoOGWpVR7xiZ5PZ/mWraT7fHwuVvHgC9p3z/ug/fv4EpIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/19] drm/xe: Name LRC wa after the engine
 it belongs
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

On Tue, Mar 07, 2023 at 01:24:36AM -0800, Lucas De Marchi wrote:
> This makes it easier when printing the register-save-restore values
> to know what is the engine.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 343370b44506..daa433d0f2f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -318,7 +318,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		if (gt->default_lrc[hwe->class])
>  			continue;
>  
> -		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
> +		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);

Does the LRC sr's name actually get printed anywhere today?  I'm not
seeing it from a quick skim.

Assuming we do start printing the name at some point, we'll just need to
make sure the message is different enough from the ones printed for the
engine and whitelist sr's since they also use the same engine name.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  		xe_wa_process_lrc(hwe);
>  		xe_tuning_process_lrc(hwe);
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
