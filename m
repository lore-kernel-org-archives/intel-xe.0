Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EEEC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 21:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4FB10E721;
	Wed,  8 Mar 2023 21:55:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A282D10E721
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678312500; x=1709848500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pH7pMvGAmIHbTGFxe2v6drmiwymiQvF4ZJt+pqHevPw=;
 b=HDHUOqpJGWa2FPur2wcRMy+1XOwbuGhov26h3KURpU7ZyydnLNkeQffd
 4AvHGuLvLUmqfUTmvUHyCPD+XXB9yyHnPkyvwpBp2JqkWYTxNuvjd6UqF
 WhsJeyEf1iyAQsIoZpLflunQDpyUW2AsM88fZ64CQZOnEP4y8GWeF8t8b
 UVoO1eoL1dApxsGboXLr6v1cZ2VyExU8a4HaUP+3e9dPH3cySJaFcGMW5
 78Q2rkGJFHF87cFUS/+e8DaTGP++AUVa4qjH7R3//wtcUR+neb89nlthB
 budQuIp6SoK6WPh13+IaTESJv6J7sl056fOmA1BcEiwIjECCy4omxVZMH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333755008"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="333755008"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 13:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679496212"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="679496212"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2023 13:54:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:54:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:54:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 13:54:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 13:54:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCx8NmvDiAZx/Mah5M69lo4fFXdkI1A+jfeuWDhHBGXD9KAYw2gEkssQFP9/WQgRQg3DYT2vSiXeXJGt5xaBW0fC+2bjJNQnNfoErSWclffq8oezM85AhjmHhe7sig2yb7rV02hb3MtTxQ2pHE4yA+y5z2NPyCdBi7yR7AUlCCVoUKkQS2qzzQFSHfETUVzQ5pQ0X96cPRlDJ6nDGj7SB8CNbePJH5gzTYj6uTdMT1lf88qgkyX/sFRsrZnWSguM+cTFbS3dTBdSDdihwAXfJAOxJf4XwoxX0r+gSyJXFI5ACBwALLHOEvFZVjLc+Vw1F6q1qNtb+GK84hHOImGH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C7H/6RdG8W4LfI9OoHMvmMwKZvrW25DBQtnHOBzkw0=;
 b=a1KdeiSBt7PxyA0Z4jJTbZyADMkJyAxoHvHoH5hWzE8Dk2lxgQIluGRMiBblP/D9ge6rB+xBDZ3R4BaGEDDfud0GBrjAeGJEyouVtznDZ4eGLXbcuu+xOGEh1xOi8lDnP6jhJYvySJZ5QjBnNMhqtZ1PtgTacWLZGki1wPhOB/UDt0vGjBuXGkIuTCJh2e50FYujlvCTZLaEdxdnssfd5dySoJY0HJ8wNq5waAYm0ZUXeR9uqCKoP9VrcUa5Nla7ithc5JF7pmRRSdwV/EMKtS7ua5baavbSGV0x+zZBl5vvBxeQ16LTsBQLiA9iea3lfd3OL6+OGm1hFxPpG9jWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 21:54:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 21:54:44 +0000
Date: Wed, 8 Mar 2023 13:54:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308215441.GZ1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fd8035-d414-4acb-73d6-08db201fb9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MHeGDCRA0wDDlir4fBXu+GUwYBkoW1LDHHswW7PGpwlkMsS0ahO4Xtk4c8wbAea8gtJ+lX5T/mAWtRUJrQDTEwoBKedP37zilldw47Yqh/FJ2iS6fZcaqkEuGL1QHkvB9KcE9ja09tzYmGPvSwW80gEsB21Bjwlv0mxIcFzHk8r93x1/EgLHzDx0MNak9aGQtI9QQsw0UKL/+gntPS/HR+u7+wULBDf40zo2tSKso8ZLvPmIypaOuzrte/eAUls/W8coq7O4w1BNkcrPRGUnwvVy02ZvasmqctcUnenfvhRvvZONZWNIdNg1E/xZrCKpgtohBz7BWq2Z1lKa+uXW1OlJCOKKBfWdvSOckR+wUjHuwnM8UAvsF1V4EU3/Lh1DmW0NnKvuwEA99UUJPh9TIMLVfp9gdNxBw8Yddi1mvE69+genQw2Mp6J4UkKVx+GmZqErdByrokgK1oQ3ucBIaCCw/jAiRJ2vrf6Aq9iBPQMoITbopNkxflVGykEfuIbOE6vF7Xg+46aBpfxflgGF3WURZuHKqd/89sJ0uzVJiuiXDyGu0mIwPimlMFJzUdvD37/TN+xB37s3SOpg6S3Udm3xW4oreu7+6cMbNDVkCec0oSPam4liucBXldbdIxCCzm0N8hBaV30sH4uZKKndQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199018)(6862004)(6666004)(41300700001)(6636002)(83380400001)(86362001)(316002)(4326008)(33656002)(66476007)(478600001)(8676002)(66556008)(8936002)(66946007)(6486002)(5660300002)(38100700002)(2906002)(82960400001)(186003)(6512007)(6506007)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zsq4OCT3GRfZOn3MOcUBj82ZOWsv4pbMdPmvG4SJaHGI7rFfYRJV4lpPJNfn?=
 =?us-ascii?Q?PnCsiE8g4nRyzZ8vLqhsMt8jIVQfI4wFWU4xPj4fPB9BxXSBEwNibC6wZC1M?=
 =?us-ascii?Q?fexZrD/59jMh0mQ8N1sWfHftG/RWpAA1bG0nsk/wxdfumC+Mn8u8e6JC4GMx?=
 =?us-ascii?Q?wo6wWuT4/QsWuu37tDT39HdaEOS3ydOWu9NM288DSkIFy4gXHOCCUJDUj9cd?=
 =?us-ascii?Q?BkfuuUCAWjNZ4CtKGsnKspttZY2bNjeP5RJC4jgpLI4VFaDGoNqVDA/x5aPM?=
 =?us-ascii?Q?hfizIDdznI0Op9X1SNYmBtyo2No8j8ILMNXBBUK96vnQ5nU/iYXHTO/EnFHt?=
 =?us-ascii?Q?D+GBab3YVo/IRfmhkZOiqvPxb9mynGhwu9RmXPPRdCsq+VaNStOvC8fZOI4K?=
 =?us-ascii?Q?ARvkz14uVlsaOSeIxa29IQ150GaO6VB927WfDuPR/AyQEkwLi3ndPe7NmV5e?=
 =?us-ascii?Q?4R5xEM30DiDfYN9NbYRlZ1dkbhF0NsInEbLGdpbL3nbyaRuaMHMbKco1edW+?=
 =?us-ascii?Q?rsTERx9w3le036+svBBNznMd9n5deo/l6KAS25GqSZCswtkNXd3teZBPD6U2?=
 =?us-ascii?Q?9WCnKg5x8mRCzlNH18T77v2biuuPzxNMTzAYJSwDF+vbRvE4asiTkM3TaJbM?=
 =?us-ascii?Q?jZY2mg3l1EgnehGh/8TE33GY8T/4KZFfmS9QkZZhwBrb6o4VHvP37e4PDW5z?=
 =?us-ascii?Q?ERWL8ms+nSfp6BVfVi4K48iQtZ+S+m/7uihzCZ6+0BXk0bYUyMw+XfNk53sj?=
 =?us-ascii?Q?GDa5zDOpL9rU/H1J1U65nLOPKxymTLOz7uCR9+1MgYMyZKrIj9uzsor10qDs?=
 =?us-ascii?Q?xlZZMoBIlTS+13OIa0rHwbV4y17K/C+70mYsZT0/Ot2TmEHosdqkztdf/MFh?=
 =?us-ascii?Q?gyNSjdTOkwyjvnN8QwthPFV4+HdYZlb/2XxFdk4Bnle8XuEoL8AalCegWiry?=
 =?us-ascii?Q?BBYfIRNJfkQEVQAX4Vwc/M3oCjeIhdjEji5UMqtlCwJ0ows88H2pCkknGOZ6?=
 =?us-ascii?Q?oCHO8OfyPRIUsZHHOCwqDLNXifIfDoQGAY95cdm2iFrliAHK0HrCVR8pTpHk?=
 =?us-ascii?Q?KcyU3oWSgHVYerJf1gEPAxqyhYKBZsVBABV+yXAcTjrJg7x5Fdyli0cALz83?=
 =?us-ascii?Q?cWpGwSfvanrI7rlVSfFTpgKnFNNz74iPtEb2JOxa+MXh0NInIZyOrcXxngwG?=
 =?us-ascii?Q?b6ePTV2aSxPgdgoEsolYC2LIugPxrx1hWD8x2xe6xrn2yNOAu/BzonfLfNYO?=
 =?us-ascii?Q?3tlVHTS0gnQUoPmzufS9psOG2jTtvCR0VbGtPOJnYlJeLbYAPAQCbVqpzq3m?=
 =?us-ascii?Q?su2IRQNh1H60bYqF5ChPyhvwjYzWpHlNa+Zxi0SF6H76Gpsm+BcTBndQJ1Aw?=
 =?us-ascii?Q?z1RufR+EX6HAkdvqAhvbVVkTPzWbKm0ZlzWpBGsYw0XoWfIbdnjVAVbNqLO6?=
 =?us-ascii?Q?6VYHghWNt7QVR+ZGNVWRRretMxP9d7V+YUgH0N11MENefTgIY7TamtSOWI0a?=
 =?us-ascii?Q?FdmsDXWOuIxHuTt7GceDa3JNAM6c5VD/GP14DlyTzeSYij2NjIqSE0FnJ7fq?=
 =?us-ascii?Q?FIOfRIl5ncMW7TA92joD+0X3FFtnRbvKKwSXKGimTyKTGFmKUrTE3qbtEjCk?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fd8035-d414-4acb-73d6-08db201fb9f5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 21:54:44.0733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3dWcyobfaHRu4qeSkg9xGz6vpECdrL/1YPAZzm2sGftZL6lsqVxSoBJqiSl1gAsEWJg76X0OjHwY0OMVJaeu8leAmqUxHRwBXPd9fg7cLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/19] drm/xe/rtp: Move match function from
 wa to rtp
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

On Tue, Mar 07, 2023 at 01:24:32AM -0800, Lucas De Marchi wrote:
> Match functions are generally useful for other parts of the code (e.g.
> xe_tuning.c). Move and rename the single one available to create a place
> where similar match functions can be added.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_rtp.h | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c  |  8 +-------
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 5b1316b588d8..c04eca290ef0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -154,3 +154,9 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
>  		}
>  	}
>  }
> +
> +bool xe_rtp_match_even_instance(const struct xe_gt *gt,
> +				const struct xe_hw_engine *hwe)
> +{
> +	return hwe->instance % 2 == 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index bd44fd8bbe05..9bd2532442ed 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -397,4 +397,16 @@ struct xe_reg_sr;
>  void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
>  		    struct xe_gt *gt, struct xe_hw_engine *hwe);
>  
> +/* Match functions to be used with XE_RTP_MATCH_FUNC */
> +
> +/**
> + * xe_rtp_match_even_instance - Match if engine instance is even
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if engine instance is even, false otherwise
> + */
> +bool xe_rtp_match_even_instance(const struct xe_gt *gt,
> +				const struct xe_hw_engine *hwe);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 03c5b01a14e4..67539f9d70b4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -91,17 +91,11 @@
>  #define _MMIO(x)	_XE_RTP_REG(x)
>  #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>  
> -static bool match_14011060649(const struct xe_gt *gt,
> -			      const struct xe_hw_engine *hwe)
> -{
> -	return hwe->instance % 2 == 0;
> -}
> -
>  static const struct xe_rtp_entry gt_was[] = {
>  	{ XE_RTP_NAME("14011060649"),
>  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
>  		       ENGINE_CLASS(VIDEO_DECODE),
> -		       FUNC(match_14011060649)),
> +		       FUNC(xe_rtp_match_even_instance)),
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
