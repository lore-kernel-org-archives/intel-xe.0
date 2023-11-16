Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1434C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 16:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8335810E63C;
	Thu, 16 Nov 2023 16:39:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8944810E63C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700152788; x=1731688788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wyYOFykMohN8zjNbQY9i3VtutPGWSP/zk2oO99V5vJI=;
 b=lMXKbdkvvLRB4edS2CNWuLW4Ta+FpIeepc1zZR+Bj9H6RrmNoVjgVC1B
 eW0K2SFRaM5AWDCd+Lb+dS0r+mcsYuwqtyB/3xyeucCBnRCXHqnQMjpXW
 ixZz0uRWEoAXN05zk7O/6/2bFfY2YwWqF+H+fwXZ0HoXqo0Lxww0+lBmc
 09DcTK47emB1XzwE55eybKShM7aoluKO5+R82tMaTkKbjvr06X7D1zNZ3
 G7IPjl4Q/LumeNSXGCd7hgH8p+3pPWo4pVV0+ol5Uhk8hc4w3NWHWGFVU
 vgVmPlVdn8UniyrFIfz3ObJimZUEhnE7u3VLWyRRneiqNafLTPdqG/sgb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381519759"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="381519759"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 08:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="800211010"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="800211010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 08:39:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 08:39:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 08:39:47 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 08:39:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrvru4QyHEyyv3NWRJom48D6ObjT4qtHZ5fsyXa8FFLTQYdUUrcxnvSp1acxAegII1wrXswcS+TNFOK7jqeR5E+2MF1GIYyfDk4CcZUeLJ/9/o+p6+m6AqSmtx4ZqtSct5OfCyq5wMuIV3hNZS/uwiaSvziFpWbV6PF+mQIUi219baOZyORI956gVq8J0ac/U8ycthB3F5q74u9TJorbS8MQD4X8TFCuULTuPjO083Ql0xqTLfph3MbFjN56V1vCKkeXlx6d8E4QF0fGBYQjQwxxc8It3slf1OaVZGf8DvSkuIBTQtk884202cUU8/1IMJv03zhqdKceV5POE1UPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozGD6VpPEbKHDLOP7Luy8Jm+1zPtxxAzNQJ6N/e70zc=;
 b=mb/cbanBAOO8756zi7zJgMtk459zAxJUfD1KEOfG975Ok5kwSWkxLrS9uN4ihkyALH17qnkc+d8cte2b1YQTEcCjdh6gciVSmefzZpM2pmmiIqzn/TBIRRUaJydg9Rd+HVJNUeBGJ/9m72QP14L0eG9pW0xxxkGKSxwIOo14BzN///yfEx7aeht5/EN5GmNshnHljtP3zPR87EMngzKZyGzUE4kCglyRbJHzGy2VhgEyuE2tgJZnGpNyQNwgQbvz3kMDshC/Oj7T4TkvkDI6yl+FPqcguUz4Kw8dIDKv4Y+1rUJpP6Fvo9NL52J+So1MrRBBHNm5wZrqriMuzxZ8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8693.namprd11.prod.outlook.com (2603:10b6:408:215::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 16:39:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 16:39:45 +0000
Date: Thu, 16 Nov 2023 09:38:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVXjEcYT5ORu8EJJ@DUT025-TGLU.fm.intel.com>
References: <20231116151242.2125-1-michal.wajdeczko@intel.com>
 <20231116151242.2125-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116151242.2125-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0079.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 498d619c-a240-40c9-3b46-08dbe6c2a3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSyEocqFpcznhvUUxB1Dt3yAULClGRJAo4UIC6vAkOqrPovwsrPv8t3UwmgNuoTmHAFXRImi4VIdDDFXlutOnkB3QJFbEdcE78l6d7nu5+tPmS4lYeeoMqL5UOQHTd87RB7hE+zpHFIcAwylBu3yKUaK2twYbqoUsUA7fEiJI9lDC3Krha/l0Dojbl1jadfYKoAenGYUqImBz0zfY1/lmG6bwA8aT+wIxK+hD5iTXaae35xYCEyWTP/9Ey7iNOGr+tiAHOjaim24qCatBfQy9gEOjdSE54xH3HQM+mQj6zGQ9D8QP1ZIqriOtgzn1px4inY9KyVVwVlUVjOYYWNRbl6Taxj6eNeWzujTFtpJDy/CfX0bXopd2pz6shM9tr/MSi/Y1Ij45SMj3qbu7lz7vgPIgA2+S7XMxf18Xnw/Gucalu2oL3QXtqarsSbvGlaYNSC8pEUk00zs4GwT7Zsqh35u2z3pwoIfKINSz9LMt6UdSmqfPo/uykUZzyu5XIoQhIYzS3O83mnOEyLd2Uq6GvzcKieHgTiapWA6HvB4HQ6g1Vn1j5h6roSeZi+0vIzy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66946007)(66476007)(66556008)(38100700002)(86362001)(82960400001)(83380400001)(26005)(6506007)(6512007)(6666004)(2906002)(6636002)(316002)(6486002)(8936002)(5660300002)(6862004)(8676002)(4326008)(478600001)(44832011)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5//tSfDigUKAPWOLMMTxbf4yHZO7nNvqZTejq3tTNTsMF+MYYmWZiD3oG3A?=
 =?us-ascii?Q?Fds4MiPWrvYsTsukUioUONYINOTfiphQ2ZN0KRgubYHlJd7vaS+EgTA5p9Ee?=
 =?us-ascii?Q?t43gwx/8NquUY03F1ZXDzSyXRFaTuY+yk9iMjnIPh4QDPVc8FTYdskgt5EY7?=
 =?us-ascii?Q?YMWZ2AzyibziSs8QRK3it7Q2JEpBKn/h2QXezhG7IimNz7SOKJABvFux4dLb?=
 =?us-ascii?Q?NvIWUggN5XOYZZNwjs7WDH2Oq/wO4uB5bU7ALsuDwsAgdwElrGPB9xBr2jpT?=
 =?us-ascii?Q?KzJim0kzWTQpgJbModZVC8zdTJvcSNncblWWdE47DFRZSAXyxlWLNGZObpPh?=
 =?us-ascii?Q?xtomvAUc4I4h2wg1EmFbpj2TWTiG1+S+tSRsOR5NcmlGEInkO1uYue7C98gr?=
 =?us-ascii?Q?UtsL31N7/eevdj7pB1K1qlRs8YlMEdUDtMQfq1UvuooIc4JtNQRK4HK1g/So?=
 =?us-ascii?Q?4xJQ+I3PxUm0zfgLXoAaXweeSCPKxqrUoMJ+oy5y+mNwOL7KQ2ifnnr4UK0A?=
 =?us-ascii?Q?l+km1pfl1s0kZGfsAyXyMl8zue6FK00P9P0Q6LkGn6idonUPUDU7ba5wV+m3?=
 =?us-ascii?Q?tgxIbwedryOq7xyer6jGfCQp7LMEqDsgF7qvBjoW2N3/ygFYSXWRmSomkJ50?=
 =?us-ascii?Q?rE8fHtQ6DnGW5Gfvf949jCjIRXcKZlP0RR/WjjCL+1h5GNk1b1lqKjnuG++u?=
 =?us-ascii?Q?mrBq25BRyzlOts68nlm0fNn9Jb7rnVyVKLqSOuLSKSg9XEmGy4nLX+5AULmf?=
 =?us-ascii?Q?7KouPWqdGYRmuXFn3tP5LZuvnvRrtT3VI3ESSCjlq0HIkMU4u3Pxe6Z33uJ9?=
 =?us-ascii?Q?PhbT2cjtkpZiiYr6kjfOOQ8EcTe0ZuR+Ka65Ixk84OLNvjrORkvxniaSVOWU?=
 =?us-ascii?Q?fLQNoW2qjMGOIeCHG6oniAWCixiVhpuF3vbboMEhpr/czc92nk9Y2m3XIgRp?=
 =?us-ascii?Q?+CZf9UqXx2pS1IVuj7iJS+YzVIAGtc746xJL1D3ZPNkrKxDzUz9jt13PaJDA?=
 =?us-ascii?Q?K5qM7z+YnwJ1M+851PLod2HxUX5Wz6ATaKZzxLn5eXcvMuJU3O2/ZgXZKfah?=
 =?us-ascii?Q?qh2MDEIqxrbltpMZWaZguPnHIWyujBYahK2y+0JdugOvqzDONxvEVuSeJ0w8?=
 =?us-ascii?Q?vfYh9UpnA/Tkc/Wex9IJuCaNLl9a7gCE3DdPhDO48adozLvMPkok1cQxfH1Q?=
 =?us-ascii?Q?Z/CZLOdXBO408dFfbiEo3He3BqufJktsAHMWNENfywCI15DUySSs3TmhKZbG?=
 =?us-ascii?Q?EXgvTp5gSxPAYdt/G5tSGUKNRFFETy1zUu9ye+NeAqjlgi1evY5H3S58nIfO?=
 =?us-ascii?Q?TWmjqHw/X2jXahLEhfUhmbL5YqjYkEB7fFDfq+6pHJCYnT05cd0qzU/vI1bz?=
 =?us-ascii?Q?ODGUJ9SLrj81l6d3Z5H4W6Sg1joG5O1BW+OKm6wi+qTSWHMSOTZvi/dnfteg?=
 =?us-ascii?Q?ff2TAvj6xl410poQXgJwZOBf3kUoY711geMkHPS1jUQBIF1sR2ulZyk0WHzR?=
 =?us-ascii?Q?n1Uy3equiJTR8MMNmpER7MkcqBlR2sNvwyyZsPWk9eBlwIe40Vun8JLXBs3r?=
 =?us-ascii?Q?/qetT6oELcbcQNHdm3grsBU8rl7BOiz4mKXpud3Az6Dceua6dZdnYTnPKqVv?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 498d619c-a240-40c9-3b46-08dbe6c2a3a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 16:39:45.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKoaolz6RWdXH5tk/pokUFnNww1fUdKa1gFLfa8O5+wyPVIZxAKzgVvLTmU1cf/9VuoaC/2mnMCfAOQ3Yu7UYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] drm/xe/guc: Fix handling of
 GUC_HXG_TYPE_NO_RESPONSE_BUSY
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

On Thu, Nov 16, 2023 at 04:12:41PM +0100, Michal Wajdeczko wrote:
> If GuC responds with the NO_RESPONSE_BUSY message, we extend
> our timeout while waiting for the actual response, but we wrongly
> assumed that the next message will be RESPONSE_SUCCESS, missing
> that we still can get RESPONSE_FAILURE.
> 
> Change the condition for the expected message type, using only
> common bits from RESPONSE_SUCCESS and RESPONSE_FAILURE (as they
> differ, by ABI design, only by the last bit).
> 
> v2: add comment/checks to the code (Matt)
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index aa4af536c1e9..56edcb2b0e45 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -659,9 +659,20 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	header = xe_mmio_read32(gt, reply_reg);
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
> +		/*
> +		 * Once we got a BUSY reply we must wait again for the final
> +		 * response but this time we can't use ORIGIN mask anymore.
> +		 * To spot a right change in the reply, we take advantage that
> +		 * response SUCCESS and FAILURE differ only by the single bit
> +		 * and all other bits are set and can be used as a new mask.
> +		 */
> +		u32 resp_bits = GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE;
> +		u32 resp_mask = FIELD_PREP(GUC_HXG_MSG_0_TYPE, resp_bits);
>  
> -		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
> -				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> +		BUILD_BUG_ON(FIELD_MAX(GUC_HXG_MSG_0_TYPE) != GUC_HXG_TYPE_RESPONSE_SUCCESS);
> +		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
> +
> +		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
>  				     1000000, &header, false);
>  
>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> -- 
> 2.25.1
> 
