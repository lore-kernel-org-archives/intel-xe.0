Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22144C41513
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEE810E18E;
	Tue, 25 Jul 2023 22:48:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E010E18E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690325306; x=1721861306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k7cF594U7PxFxxx0bjTH0kYpF1/Ulr731J+XGWZcULc=;
 b=BRWZeHh4YtX521W3XWPjhhMjU4c6dQkI54/Id6J+Hf7QXBeGCDtCBauw
 jP+WEH2aG8Fv0fkl6ThRDE4WQiivyk4t4hzDRtXXsKlWo3iqwRAlIiJXS
 ds61+ksL3KGtkHdHoGerK6Cvs7wQCLG/eMekVm2k8cqi2lDT7SFNX1pAF
 lx5L+NuL12kus+Ln9dTgME6dxcsy9/2dpavPCZeiKGdO4uWw99dbJxsFt
 NyLd4aOoB2QDCIMsZqgXqbgQVJB8AsWJGSa9EiUn76vAtqb3JpLMJ59jj
 o61+1DUQ9e/y+iK9YCRYeUKsTF6YIAOdaBVGZg4s3e9Zq9j1vmOktqwDK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352763264"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="352763264"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761384368"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="761384368"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 15:48:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:48:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:48:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPmM9PJX9VnQT+rVl+uz6F9GxpWSLDFyO56CAVRJ58rE01T9Na6CNEspdJKNloHJA+tl8UNHXq8t1ElmSFl+zZ/rUgY0LSDlbagLyl89lQhsxKtPmLbCX8suhPYEgY7zb8mETYB3QqAJAyndrHH2dReCUna65gFSPX928o/qXwjzmmyzLOPqd4fYDxNzK7AvitjIj1XUD8f2cp173W36KRTMgvK2i2s2EU8w4IjUSxjY06b9P/KIRIsFzUpyWbeHCl08fotj7gIKCUfoOe+Ez5/oOOHM533/uNkpjqyUCZOLcWrrJQPXxBAQiuw9S6Ui0FMOSbu1VwCkQhF3hhPL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4roRdl3bF7jtPZ2JfajDB1rB6dKLQ4CLckZyVkRl2o=;
 b=Lh9BwerFfSvYtbMZWZAkC4l6RseTtX+RIPsyPVTotis7CwXv2lFqQzRIobGWYy3HLP5TG2m2s2ZFjJuc+05pZRd6oaBXhTOKd2FA3yXynCTOX4u8DFUcLohzwSKaGJy2Lneb9uRWPPJbPEItgtGlbVVajtnVl5h/EaZMc90sIWTvmUzY8OHxxkKOUN1wG9Lh0/ksFgnkkODR0aAhfruaso9LyuHWQHgLovyRaRga++xeMWp8lGdFnVuXJEHOfkCcR6yI32INQhT/nKGzbyVo8O7I4gM7nqQMy0wMpFPicQkGWEpCfSK6FYPEXKHcZA70kTMWm2rdq+U9/zDC2Lo35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Tue, 25 Jul
 2023 22:48:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:48:18 +0000
Date: Tue, 25 Jul 2023 15:48:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230725224815.GY209733@mdroper-desk1.amr.corp.intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725202836.3854908-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: a6383788-bbbc-4968-2b29-08db8d613d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51u5kLmY/sc6UwH2OHwrS1rfjbv2YfUBKVWD2f4mTU7+T9UuuL3FHBQ62SBBlxNkc+PyzQM7tNZluefh4j/azeXKtmFq/O3ti9VSHilrNewmkbm62tahasNDNRTLfObBB2ZhwGuBaSA75kob05pKMMjPKci8WxNonVt3UFGvEdf4CJQzzyHTJ2jSxdvyktjYimW/yKBdnpmsNwTpjI8AYrx1NC59V0Gs3mpi6UaaPejumXEvvhpRYLzqH4ZlJjXf/8Ez53bEToa+UbJxxGUTQ3j5c60QFB4eN1MeAz+8dJqSEIVa8VA/+IuGmbf1cLa84h4AkFF6pSeJWUq80wZA7Zus4mwbiKrEviJKWTiMdsQNA56xRogOU4tqrDe9rR3MAKAKGMEId8spZPsaXpFNFENIKSi0ou9d1tpUnfMg5t+IictEZkrvEjGMhh73dJDOJ2qQyEO6jey7oLLMg2bG8Q5ggqaCJM7SN/M15K/zBpSfGdTHMosvweztV/cijAYBerdZvS8hRwDOWKGgDvm+ddE2fx6YPx9IId5NfI9brWstHQEGR8G0bjiK9csZJxOU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(8936002)(6636002)(6862004)(4326008)(8676002)(41300700001)(316002)(66556008)(66476007)(66946007)(5660300002)(6512007)(2906002)(26005)(6486002)(478600001)(38100700002)(33656002)(6666004)(107886003)(1076003)(83380400001)(186003)(6506007)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hH9IGxBTpYjsLATJTc3/UKbYcU7+OjFlUt6r93G3zLbvzUu4OyOCPuTQsjEh?=
 =?us-ascii?Q?PgQH+UlbDGsRJ5GCjSXaD7FD6Eoevyi0LqWzcNbhFOFHdGKRHnMAX/dtyzPu?=
 =?us-ascii?Q?8osGsH1Dbn+RMysbd9hqTEOfutWbXk1ODJZh7ivWDwhKmGbUOxBpAjRCBxNw?=
 =?us-ascii?Q?DwJ0vJ6FOWdTUdzuxmndWHZIhiaHKpU1nRMMHvM1KP57F7JtZXfMpfXPoJ4J?=
 =?us-ascii?Q?jfWYD7Qf5LyVtwNwf5cMGToLaVmKIPzrDrgtjuTdrNF8dwYr2Fdbfwd/uqQS?=
 =?us-ascii?Q?ol873le7T4gqEemQ/ZeRwXNSSzR263iYePTAe0n3RINSPDjkArgO8hIESjKy?=
 =?us-ascii?Q?kfEYh7y5ozZKC5xNQlm6nvq+d4Zlmrp+DPpmJJmlQ0d5JMrKQP3A4xx0Ynns?=
 =?us-ascii?Q?0iyMEBfoKFTm1yErNWS0P2W1mhf/hrP/PCFyDCKSLqUZApQXjJ+62EjEMZKd?=
 =?us-ascii?Q?oyZ1TCeGqAzha7K3i/BFx3OPWykd4D8Ih9A3JA8mDuLC9VOSsFFwvPuBe50w?=
 =?us-ascii?Q?XHavF+LcX8EqgNxrQglQBrnbCpm/FXYkXsea+klPZjfIAMc3Ir3jPC7kjCUz?=
 =?us-ascii?Q?0e0rxQ23L/H2ZMw1Ky3UBwHvumS/57G3Pf73EggW6QRl9QsKLpgoNgYnraM8?=
 =?us-ascii?Q?uXZADgo0k5ZDPKOC7d68raeFegh24m5grs5UGtUI5nw63J9XE6oCh4BZTt1H?=
 =?us-ascii?Q?nx5g1nHOpTakFB0Kjr3yALJ7029krI1t528TZryDB5xdRxY1g5JEAs8YP03L?=
 =?us-ascii?Q?CHduge6KjReA3jX8ILCiNXHi0Ta0tfaZ+/T0H28qmbpbPVYAHdgnIcerd370?=
 =?us-ascii?Q?rnEihwI/QE5E53eHb9+nXc+YXycioT/piS1En+N+pgavjaTzmMIdPYDN/O+H?=
 =?us-ascii?Q?h18TgOedd6gQqQJE6sAE8O+/47joL+uPl0FrwHpelBD++xLLegPW4PS3wZZj?=
 =?us-ascii?Q?Z9zEayNsu2hB9s3og8AKDnjTg2xEnRu6vFo6mcgpdXOjgcTAUcRv+aALGGTK?=
 =?us-ascii?Q?6GL0EGr6rqCm5JanacgFbAmLUDDqSpd6ax4yEJ/uDS03ANojl0rDAbQoX7Er?=
 =?us-ascii?Q?1rKJlVhQVGahxjilBHMPoFWTIIHkWvPCZmEn4ft+O11KRwCM+Hdmy40q7DrK?=
 =?us-ascii?Q?ugE5N8U4RjKCITtc4ddN6wXNZQjHF8OUjz5jkiOBJwW1vpQMQOMnwwlWj5ol?=
 =?us-ascii?Q?nxAj3qW7i0LqMrOQWSV9paH3kvFeDC2flJql9fLeaYd+P/bR4HwRUimhzw8+?=
 =?us-ascii?Q?bOyd9lpdJsRErpk1uQngN0XoCzU4ldpsnxWLsYMLKk/YXAsnHoO1TM3pqB2H?=
 =?us-ascii?Q?s6kte3SlhAcP4fCEquUJNpLI3anfbubnlqIbJYUNI4FhsjS2Ypsl2/5UMX9C?=
 =?us-ascii?Q?670qOkHoxTFOV1zAdyyqGofkfBL4vqem7vEzu9PHgWyvfH+u87Z1CbrRW1uq?=
 =?us-ascii?Q?s0qLk5FVu1HSP+tNJlCriPlQfLy3S1fmlieocSZAWWSBjFRp605+CPHbIzYd?=
 =?us-ascii?Q?F24HW2y3W98Fu1isjeslJT5mdCNzXIznUIMYWFO61Z8brkGJLmTtsI2roq62?=
 =?us-ascii?Q?CJdxKSu7jpBwZx1H1qVxGD+gm9KSEqIR2L4rLNVbrteIPDztzV+95D5/YrXw?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6383788-bbbc-4968-2b29-08db8d613d45
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:48:18.3788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwL4XcT7s22TJSUAQcRcGlBOHvyOrXgqdOomYAUkSLfWbYtfEL3eEpJfghIOu+qBZ+1Lk22caKfDXVM6oN968ag+8l2T/yVf2+jzzGJcsoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] fixup! fixup! drm/xe/display: Implement
 display support
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

On Tue, Jul 25, 2023 at 01:28:35PM -0700, Lucas De Marchi wrote:
> Remove leftover defines. This is a fixup to the fixup, since that commit
> may eventually be promoted to a proper commit to avoid the need to
> squash it below the commits it depends upon.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index dd7568badb4e..3f7052fec6cc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -56,23 +56,6 @@
>  #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
>  #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
>  
> -#define TRANSCODER_A_OFFSET			0x60000
> -#define TRANSCODER_B_OFFSET			0x61000
> -#define TRANSCODER_C_OFFSET			0x62000
> -#define TRANSCODER_D_OFFSET			0x63000
> -#define TRANSCODER_DSI0_OFFSET			0x6b000
> -#define TRANSCODER_DSI1_OFFSET			0x6b800
> -#define PIPE_A_OFFSET				0x70000
> -#define PIPE_B_OFFSET				0x71000
> -#define PIPE_C_OFFSET				0x72000
> -#define PIPE_D_OFFSET				0x73000
> -#define PIPE_DSI0_OFFSET			0x7b000
> -#define PIPE_DSI1_OFFSET			0x7b800
> -#define CURSOR_A_OFFSET				0x70080
> -#define CURSOR_B_OFFSET				0x71080
> -#define CURSOR_C_OFFSET				0x72080
> -#define CURSOR_D_OFFSET				0x73080
> -
>  #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>  
>  #define PCU_IRQ_OFFSET				0x444e0
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
