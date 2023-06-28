Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E660AEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 19:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C581510E0BF;
	Wed, 28 Jun 2023 19:11:08 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ABA10E0BF
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687979466; x=1719515466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NauEdMl0RfQWueYMETpohPzOUfo4XaN7F9RCB/HjojE=;
 b=KAS0pA7zhDtsvKxDGGG8+4wyiHsRKsiCOsDK8DIxENXmtjXjx/e1zCzq
 +8r0ZybGix0TP9qo0/SXZDdSfOOa/LgSECKRshyIhARiJ+wEfJwZt6y32
 +zrN0lF8lzIBikcFnStdbsX2lGGtFduCslAQl7dyREvoCKfjvaM9iHHN1
 Q9+DLkIdf89pYlZKQBCleDN5EaI/h6V7wNTiDxCbKDWSdkph4OzeJpBTh
 4ypLmksI0Eb107PJkCe/sKIX8ou/QO7h5oX9VO8pcTm3hsMkeVQrKTk4W
 ZeW0pHo6khiltEdp8BIZZzMGQjFAaFKssVi4XISTn+SuZNCrf+vUdG1ev A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425606995"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="425606995"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 12:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="717072627"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="717072627"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 28 Jun 2023 12:11:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 12:11:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 12:11:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 12:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVyJXGBJ8sohNvb2Od0Zk7Eu5ZLeO40uDCFGzuJs8gJ0YNyq4CjadfzFHKJUq29uAZryWlJdzE85VjCLmNKbgfEXL4LP09CZYGzYSGfmlhM5EFh+8cmZr6hxas7vzo+JFMnBDz9tLg1vWxsPJGmsylhjX3p0/fLX3kYXxIEZB4qwiuIRYcOInnDNYS3d805koFeUnQCTFCJirFiyAkm4aW4bXV8b2OwzGObeTFiRUeI3tjfEWeDZz2QHeodgqKTvsTYTMjL5c2I407eQhjhLdFgCLYHTL/zwH8ek5CyKt6mr7kFNl3V5od96vpP9KHo6YprqShuKAqkDpWyhcMBlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGVF23hcTVb7eCWc7z0gkjBKUvHBJwWwonaVIKLhf1A=;
 b=D4fySDgull3vRfeCQQgOrBcgBNsJgv9wqWvVkG/ebOpNDS0necUqfgB3hoNBQrS6l2SWfZDUFZ/rUti7u6Sh+g93bmz9yXspoTgn8TBguw191zuyCpdMHbvd4BNxNb493rkuCz5wqxh89v/SxbAvVTIsKvCgTsAplY9eQiF6pwJgNlayEdE3fdpczVBitBGJL7j8+/0e3jtc4cWkz8/BS/s7nCtegX0XDes04dT/IEVmXd5QyZzNZUQkgxuZjG9rktfKF2xTbxOgsbi3v+zQL4BCckYmyW76IPGDkWC4fpV9cm+Eh48Zf0jP117BiKndbB08pa7+Yh/hyg/bXMAYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 19:10:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 19:10:58 +0000
Date: Wed, 28 Jun 2023 19:10:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZJyFm6tXY8GlJQ+/@DUT025-TGLU.fm.intel.com>
References: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 564ce892-3f7a-4ae1-be01-08db780b67ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpHiY7TZ0+XU0FDbz63popx3lgAspqgv3hTMQ6oEKOwJzLJ0jPSiZaGRO9cGo620T6cTIYs+L4rDA3+oXE6PLUVG5OhpPbiu7l7Cai6z61XxWti8askR6hx7avnTYadLPq9apBgTSIuLsli8tTJPqOPfJOIV8WZUkVS7EMOwZRxWPGZPAcwMkRhTWBVASr3/X/fjJhWWz132kbbI0VoVDMRjf5XHXem+IHk+2WA42iHjS1xzUsolX5IGOZ39jD04OV9rpM0xO3D3KDU3q+SHm5u2uOIBkU3gZxaVdhECJ/7L/sRqsD1eXMzYg3Fd743ilvOS4ZlSEBovt9qBkh2/hsk/Ji/ju8vTWRwNTiHL/NLO7mO2sj68jYI7wJpM/AjFgK/+26tTK67IafOdF6Q5EeJDlP4MPJmeWVZBgrht4ul/OHd/UZZegFv4jjExjSgrxBHOAbWcuVoJoVAOBk9xFjAKDZBz5ddA18WOltPKoYasjkKfRgIP7qXR8amhFEYcPucGNnM86pfLNwuGb3ZoiVpNC4eO3leEtlxjEReXuYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(5660300002)(66476007)(26005)(6862004)(2906002)(186003)(38100700002)(107886003)(6506007)(6512007)(83380400001)(41300700001)(44832011)(66946007)(66556008)(8936002)(6636002)(82960400001)(6666004)(966005)(8676002)(6486002)(86362001)(4326008)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFdBjk1b25VSTKCj0ENzRsd7rn/PsD1X7tmS4GO47JUkPOJSVBjdytdqYKdL?=
 =?us-ascii?Q?u9nfu7ZRAXP6f+ZcjLwb6Is0HH5DcvSdrQC9fY1zxTNOZ6T+qDulwppweUfc?=
 =?us-ascii?Q?u5Zl6yAT5GtYStCXbFNjPxWtT0wRK7w5BlIX6AyJ39Fh69l0WD+kC5Y71fkY?=
 =?us-ascii?Q?awdPYYalbARDjAbqHpJz8r+7ZPa9FDUvPfMcC+0+yCiy29P2Z0wFOsGGPVnj?=
 =?us-ascii?Q?x/7S0pQrOD2/uPtIdZo+GHaGQ8BWCbpRlgtreJNzZDvbMGwCXyCseAM1A2tv?=
 =?us-ascii?Q?/UAJa8ToQMHfw7KOcws/yc0rHtS8Jgq+Ox1Tf24pIsU1+cNy1epZq8Jou4Kt?=
 =?us-ascii?Q?gqjRHg1QwZbHm4cqqXcYzjWdUK7hJSsY12kb9uo4Y/TayqToAyJ5M67X4zq6?=
 =?us-ascii?Q?T9+6dLEeE3LhOQHUq+ow3kj2bfsqp2W5pbiKBk9EuvbZYehBldHCfObM15sZ?=
 =?us-ascii?Q?jSWqH4KGGKWHaR9OTqmF+SHY2AyWBnQ6Sh8FFDThyOhsgHmY4PFYS3iSxyx7?=
 =?us-ascii?Q?/UwGDozfju8lBoFNi2W9LQYtCQbRHOOUF8+mI5yihbi1eGl4mIORXBV9Av7R?=
 =?us-ascii?Q?4xQj54eOfTZSFXgoqmIuux7AQxthIualJEtTkC4gnG6wXmzOR+qYhoQLMe+e?=
 =?us-ascii?Q?DC/478DOszUDiZH4QAlS3WKxQEgUulNgOF4fg27hSgCGr/ie3xGSny5JWSrO?=
 =?us-ascii?Q?xbqYi8hG1ReWiAac+uFNoeFval3qSsA+TKConF93KJE/7wF37zApWgVO2FuZ?=
 =?us-ascii?Q?pMA6FGFAyg9JzgwaXyDudG5z7i8xeqhU84y4RY3FB442vppDqF7JqvlDVlll?=
 =?us-ascii?Q?c9oZUCxrKtoAhQvcgZCTryTr2t5wF+otAdhhnCinQfU1F9UwdrLApGJIvNpc?=
 =?us-ascii?Q?gDjFu8xI5jeoyLrCMZhPLoTJJjV3uGO1mHYR1+Z25Akn7ayI0D9G6IuG0Cjx?=
 =?us-ascii?Q?FW45c21p3et7jjSZBPRlY9R6c5dp64gwfNHun1dAuLyC8FRRJzNozFejyozD?=
 =?us-ascii?Q?7D4qC71NBQbH1TzbnW6Nm5AtrJj3zDGtcg5D0VSFeXlaAfsjFBRIJQ6/xuJ2?=
 =?us-ascii?Q?iBA75jTalVfleWhUHjYGC+/IPXj5gXgEhB8O9/KUMX0fUP4uSjaXcA14wUmg?=
 =?us-ascii?Q?oapmcfqYaJN3VVVbdnguJDWJ4eek8KjrC9IDRecbuKPPC1sG4SQe+I2v195/?=
 =?us-ascii?Q?DPFBjZr6MHIyMPfiu4De8mNJpVFbV/tOuaUvtHr7RA9j1qwaNYI6A4u4KIQB?=
 =?us-ascii?Q?CD1eqoFImXh9E8anb9qDbYpEwnpg7/rmFSPmvu0FtOOabKfb20ZyqTFzLbH8?=
 =?us-ascii?Q?iqTetiBniDKu1PTe8kNtO9MSSb4s9o1o8gTsSpTtpCgnw2vnXSft+ju8IOGV?=
 =?us-ascii?Q?bQZwbeCzRQxdb23/5PNaNtLKZWndNoRb9hxvvE6ZLlaJu2ZcVYqliUQR1U1d?=
 =?us-ascii?Q?xFJVjpbiD6/mw7QjZczqqp96GHQbBl21wjk+v9hEiPYDwHfzzrnbbl2IrPnK?=
 =?us-ascii?Q?KbfNr2XIkuTBzvgZahSTUqPyVm+Uxz/WclvfYmleEIEnPaZBK55xcV2PE3Ea?=
 =?us-ascii?Q?y0IznppJZKSfOCJ3A7zHEIY2RdKhXNsUhVu2xHZOm84i0XJuNDHw4q7ASZT/?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 564ce892-3f7a-4ae1-be01-08db780b67ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 19:10:58.5340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjMwvVQehMyMXVXw0EFflqQueOZlLMnkf3WHpvinlfAnA31wN3xgFpaxdDWEqB2BZEjUXTYFsObe++GPKwXlYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/slpc: Start SLPC before GuC
 submission on reset
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 05:16:42PM -0700, Daniele Ceraolo Spurio wrote:
> The SLPC code has a strict 5ms timeout from when the start command is
> queued to when we expect the reply to appear in memory. This works if
> the CT channel is empty, but if the channel is busy there might be an
> extra delay that causes the process to exceeded the timeout. We see
> this issue when a reset occurs while userspace keeps submitting,
> because the submission code is re-enabled first and it will start using
> the channel to service those submissions.
> To fix this, we can simply start SLPC before re-enabling submission.
> This has also the benefit of not allowing submissions to go through with
> an uninitialized SLPC.
> 
> Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/375
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 43f862aaacbe..8a9857c78309 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -802,14 +802,10 @@ int xe_guc_start(struct xe_guc *guc)
>  {
>  	int ret;
>  
> -	ret = xe_guc_submit_start(guc);
> -	if (ret)
> -		return ret;
> -
>  	ret = xe_guc_pc_start(&guc->pc);
>  	XE_WARN_ON(ret);
>  
> -	return 0;
> +	return xe_guc_submit_start(guc);;
>  }
>  
>  void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> -- 
> 2.41.0
> 
