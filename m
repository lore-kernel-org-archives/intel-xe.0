Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B178CC7EE2E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 16:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED9010E580;
	Thu,  1 Jun 2023 16:28:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934C310E580
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685636885; x=1717172885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=73x9leY561PnqliLwRhr3SmNnDu5H3iWQlH+fNsHmAg=;
 b=CQPsaINWasmPeFh9T5Bi4lY43W4Ny4kGVSmrYyCkTQDkqLfZGJ8/9vMR
 y86IytfGOTj8Q5FKWVmOxOq/guNdcfmV1EhQUJmVUTmRRYfSF5mwrO8i7
 4Fhg4ni9HVA5PhwXw2LQdVzqaoEHc+dZedZbqAv161ggs/QRfrR+RG+R0
 6VVZiITWIuRuh2GxXFupM2wx5XtKD6Oz4Xbr4X8QpD1XGmPO/d6qU/czB
 akoJw9672opz48Dp3fvBECVstT8neb5QkK862vcFLDcX5tafEWe+x0gIZ
 jHlxQc7YtlMdyDUXVu07aXMZizok3dfzlrNJiaMWxRv01MpC8yZ9oWAns g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354464868"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354464868"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772490525"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="772490525"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2023 09:28:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:28:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:28:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 09:28:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 09:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNiCRPYDie8Mgm5mavzYBQslFDFgMvv3aOJUrE8d355sbAOsetKnsRpWs8y6/nXiuP0i5GBErrh7ogsyCEoeQlihIUI3neDd3pq02hIR2ijUCVaEFgcd1HtH/AG0kLDTe81z5/tRwet+YBbq3keMDao08UTmQoHW8zK72X91U4dtH7Ox71n5k2/+xcfhN8ZGNMxfI9p2u8vffinejCeKAJJBzXT0e1sMtJnidHuHvaqZVajgDj2N0KABMi+11gOd3cDGUb+/VWRflLj0M8uLM+xaAIB493uSj4JJTYsTuqIjWB6bTsn5LAPslhEXN0Wnd5+OUh8PvhjdSKHO44551w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdVUDPhwIKbgR3+/Q0dPTNARhug1jT2e65ZIJauGa2o=;
 b=jVnjJdMFFY9dNFJreKmhzYAwJJREfFgwugV1FmAPRtosbSXLJOaEODwrxgGH3OL+ySMWmORmmCwERAX1gUJPKKWyKzqr8GhwviN/V0supA4Fc0i0F5ynJRE0M/e9rXYpS5sTDXjjQTfh++rO325/kvrrbhnXn0o88ni2/Q2hh1wvG8qOiWPnc9byQ+Kd6QFM/RegOnUgBB83KcQVT6iYLM06KLStRv1pAqaHcfihCRezaz0ircVOZMc7kLPZVKnwJ2JSNLMpsMlHXskKiMHbBKLaet2qJII9im4o/nHTcc6HrgwfBbmY47ehzR4sVCTRp72c5/eUMhH17YfHyOJGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Thu, 1 Jun 2023 16:27:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 16:27:55 +0000
Date: Thu, 1 Jun 2023 09:27:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230601162752.GH6953@mdroper-desk1.amr.corp.intel.com>
References: <20230529150831.259733-1-gustavo.sousa@intel.com>
 <20230530170432.GS10045@mdroper-desk1.amr.corp.intel.com>
 <168547141788.51912.6080115137980636760@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168547141788.51912.6080115137980636760@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 320ce978-e2c0-4ea9-6c6a-08db62bd2703
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2JYOXUF7/H5DuFNYGIHGvIYGX/TDpKyVFsKh6aKOcR9lPUj3Rpi8hB6AtuPDD4Ch7dxLzrA90J9dyWufrbTrrqC6CBEbSfzysubLL3196QhGbZKwYEdmbqZgP0dWswlTlSt+B+HfzplyXfWordDFzDxlBWVWPjbKGIi3qidvror9o02Dbn0PNNczX1lyeQk8KNF5QCxlx5TahrsoQ33QfggyW5U1WR1lpk88DzCo8+flxIwPwKK7VptydwuJ68UH5uidP+cSMA00W8+VE1C4c8ywyF3YrwO3QxyrV/SzMpYOYHV9mhpfOAtG+h3O8WgzQPXcGC+13k/LfHjFEau8PIHfLafmjElaeaOvC2k+3ava/k9e7OW339CLpOi3Rz4zGz6jAcUlqwSNLCgEhObuokjnMdLGKL253xkPNBMQq0OfjklpUMWUTQo0sINAz4EjBj8uGqN4LroNKfJLCRAL7CFXYSBlpjP4s19pbI23fEj6H+ROAIu85C8uMfIZy0fwMitDfOPCyrJDZl3jWaToDR3poZ0fct6wVIObFbZzg/xOOccuK2SfXPR0E5dtG9UbcZ0jhDt4oSTgi6EvD6+ha3JzwGMR2DITdzvQ50yC90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(33656002)(86362001)(66946007)(6636002)(54906003)(316002)(66556008)(4326008)(66476007)(478600001)(6666004)(5660300002)(2906002)(6486002)(41300700001)(6862004)(83380400001)(8676002)(8936002)(38100700002)(82960400001)(6512007)(6506007)(1076003)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+vTSh1CAp/550gYQyan10DfIk/JiU9zrw5tgDBDXwI7ebgXErj3bBxTT7tJ9?=
 =?us-ascii?Q?uQUZCKarSRO/Tfmyjo38w/eDXWeA5o9ZSEGDMfT1b4HMyWCl4I69kfuCdxXX?=
 =?us-ascii?Q?ypc875kkIInvEH9LcXjv2+Y8PgFGewJlP+drWbk3ALWXnN8sZu8Qmz8RmU3L?=
 =?us-ascii?Q?+FIwdERXCp1bMriNLbkgawldKnp1bjmL0Mj/MeYXvPyJQw87KuxLoEwhZBlx?=
 =?us-ascii?Q?sU/Nb5QI55krdc1vNWWQIZI/E8/Q7Daxd21kxstPhLMO2Qe/LWxyvW7L4YE9?=
 =?us-ascii?Q?kdsjLRlr9O9aJSvXdTqJW0ne/2y/XAr89MNyZ2zp8aheCMEKTO5FUsHgTTZK?=
 =?us-ascii?Q?AYsTRFeZfQgYSWuMpz9b84RwiIRPUyhcWx3SqGGR3MOF3MO1bbpPa6Rl48OS?=
 =?us-ascii?Q?c0Q//QBK3SWKXtYicWUFgq31KhT5lSK8a9Zg8Giqj2RnBZ9U1Dt3nHEZfRj+?=
 =?us-ascii?Q?JqmurTvAFHwcyUCyYZ6n86Mnybtdfllc3wGvO4Di4wdbLCnQiwg4v1YXtCXj?=
 =?us-ascii?Q?wvvhoXiTsIuay4oDHh95G5VNINyiUhikbc/ECVHeQ1o5Ho5dGXKOs11MdeXs?=
 =?us-ascii?Q?Ty57hRDU5/AKjawHwW9xa4320C9AMQ9Q2fv1BSrCy44XhT2+69Spl1DPBlH/?=
 =?us-ascii?Q?FFFZuJW5b73cCZZEv/a20xA0MkwARu+X/AXmlK2D0pQOpXmJHuntDwxeLAbl?=
 =?us-ascii?Q?K+ankiPyJXM86lskvkqhIzHy7Sx4KTM4kOo1uy8G/2tfrAyTH8pU6c3zSnWM?=
 =?us-ascii?Q?D+z12bajkHfWQxUaI0htLQM2WVujsdGoEOydQUQr9Ctk5z6vWYWIdP4eG9YI?=
 =?us-ascii?Q?0fOdxnRsR1cy52k5LKpfgsRi2y08FFIhAPq0k89d3oEVde+GrPNGxVMg41Jn?=
 =?us-ascii?Q?lOUd16Bo5F3LIPMQIfkZ4d3YIGI5jsTwgvH1Xb/uE2Av8JHWu+rpuVxVZNDu?=
 =?us-ascii?Q?3fWzXwXtmannRQ7IIRqj6M9vb7qoapegyZ/nk/ghJ+H8Cxf1hDyrxykRGthP?=
 =?us-ascii?Q?sTuKMaKMO7GDninGJYKf5dkMkfiFdtG5eNEze1uBQpKnbZtBIUnaMwGfIKsp?=
 =?us-ascii?Q?BpvCpBd4/KmSJvzEiIzv+a9raDqwfwy4ckJiIK7NNjHi9QvuXEqY9gQU1a+G?=
 =?us-ascii?Q?fP8tixc8se3YExafYAmrz6zxotGRYU941eKixfjekunZEeBM30jasP6gwbP8?=
 =?us-ascii?Q?Hm3z4WF+q2c8rm5MgqCi2E44DijDOcN6TpK3RkzoHoKpDs3nl5NxCqnye+y+?=
 =?us-ascii?Q?I/h2jLmN6/A8nR4DIQ1PUQZXlkjUSWAk2s3mhq2hxB69aCfqxUlL1wXrgIxz?=
 =?us-ascii?Q?ETCQCnKiLIWpmCwuY1/aj35H4qvvo+Q+qv9zqFhbY21/UKG7Z5TeQul0iDeI?=
 =?us-ascii?Q?uFcfhHMGlFGMPr4xFHpmcpyR98pJ++9LZ8NhEH4495YKopI+XcxXUWO0Q/uB?=
 =?us-ascii?Q?fwB428O3jIz5ISRWoLJomnEduNfZB/9o81I4VY4I7pVFVhm+xvuVoqnhsPep?=
 =?us-ascii?Q?hm21eoARpX1WHlSCEEYDAJyVuL+ej54uXANvcmKRzm5TcjzZQhsh78+wuj2J?=
 =?us-ascii?Q?ImliBOWL1eHi88E8d4A8n/rl617Lt/CXlMPP8v+c9lXID6Kx/FQvDaeWgvII?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 320ce978-e2c0-4ea9-6c6a-08db62bd2703
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:27:55.0933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa/EPXtRNfDornpjdGkt6AVRz5nFHqpvYAOhKo3lBc2E+bTA2yQ/pPbFlmgQhJH3JeTxnittY1qP86IL6+rvi+/cm2sHoVRrhQw+YrgipO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace DRM_ERROR() with drm_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 03:30:17PM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2023-05-30 14:04:32-03:00)
> >On Mon, May 29, 2023 at 12:08:31PM -0300, Gustavo Sousa wrote:
> >> DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
> >> prefer to use drm_err() whenever possible so we get device-specific
> >> output with the error message.
> >> 
> >> Adding an "xe" member to struct xe_reg_sr does not seem very
> >> justifiable, since the only as of now is to register a clean up function
> >> and, with this change, print error messages. So let's just add a
> >> parameter to xe_reg_sr_add().
> >> 
> >> v2:
> >>   - Prefer drm_err() over pr_err(). (Matt, Jani)
> >> 
> >> Cc: Matt Roper <matthew.d.roper@intel.com>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_reg_sr.c | 14 ++++++++------
> >>  drivers/gpu/drm/xe/xe_reg_sr.h |  3 ++-
> >>  drivers/gpu/drm/xe/xe_rtp.c    |  2 +-
> >>  drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
> >>  4 files changed, 13 insertions(+), 9 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> >> index 24d9c73ef279..02ba95223d7b 100644
> >> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> >> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> >> @@ -90,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
> >>  }
> >>  
> >>  int xe_reg_sr_add(struct xe_reg_sr *sr,
> >> -                  const struct xe_reg_sr_entry *e)
> >> +                  const struct xe_reg_sr_entry *e,
> >> +                  struct xe_device *xe)
> >
> >I think we traditionally try to keep the device pointer as the first
> >parameter in the list.  It looks a bit strange to have it here at the
> >end.
> 
> Hm... But xe is only used as an auxiliary thing so we get richer error message,
> right?
> 
> By the way, I tried to follow what is already being done in this file:
> xe_reg_sr_init() kinda does the same.
> 
> Let me know if xe as the first argument is still the preferred style here. Then
> I can fix this one and send a patch for xe_reg_sr_init().

Okay, that's fair.  Having xe at the end looks a bit odd to me, but if
we're doing the same elsewhere then it's fine to keep this as-is.


Matt

> 
> >
> >>  {
> >>          unsigned long idx = e->reg.addr;
> >>          struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> >> @@ -123,11 +124,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> >>          return 0;
> >>  
> >>  fail:
> >> -        DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> >> -                  idx, e->clr_bits, e->set_bits,
> >> -                  str_yes_no(e->reg.masked),
> >> -                  str_yes_no(e->reg.mcr),
> >> -                  ret);
> >> +        drm_err(&xe->drm,
> >> +                "Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> >> +                idx, e->clr_bits, e->set_bits,
> >> +                str_yes_no(e->reg.masked),
> >> +                str_yes_no(e->reg.mcr),
> >> +                ret);
> >>          reg_sr_inc_error(sr);
> >>  
> >>          return ret;
> >> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> >> index 0bfe66ea29bf..3e337f174ae3 100644
> >> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> >> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> >> @@ -19,7 +19,8 @@ struct drm_printer;
> >>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
> >>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
> >>  
> >> -int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
> >> +int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
> >> +                  struct xe_device *xe);
> >>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
> >>  void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
> >>                                 struct xe_gt *gt);
> >> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> >> index 43a86358efb6..93067f4fd480 100644
> >> --- a/drivers/gpu/drm/xe/xe_rtp.c
> >> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> >> @@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
> >>          };
> >>  
> >>          sr_entry.reg.addr += mmio_base;
> >> -        xe_reg_sr_add(sr, &sr_entry);
> >> +        xe_reg_sr_add(sr, &sr_entry, gt_to_xe(gt));
> >
> >If we have a GT here, then it may be best to pass that down and use
> >xe_gt_err() above instead.  That will include extra GT identification
> >output that makes debugging easier when running on a platform that has
> >more than one GT.
> 
> Yeah... I realized that a little too late. I'll send a new version once I get an
> actionable reply for my comment above.
> 
> Thanks!
> 
> --
> Gustavo Sousa

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
