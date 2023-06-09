Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0237BC7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51810E140;
	Fri,  9 Jun 2023 16:24:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557E610E140
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686327870; x=1717863870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wjf8Wcfdo2iUK+0kV4KoDtNr9+kvQALFq/2rzFHhIko=;
 b=jYQI5L4AZ5t5mixjGN4xsZJncqEzdXjCboXe4e/O0FfC1gh6K8PbGQNl
 13T95uGAhLTHUtUWGWXu4PkGakBqGlmssUGdoxNEUEQ8Mbob0r1ebcSZ7
 F5+dhHY3I5wUi+zWgBuCIW75zDmE+aDLxnNmlZiqg1xULujRCGjut4OyI
 dHKYawsAM07tpclH0aXVq0dCYxsS9JnYR0CvLCOygl5/nsr5I9qJPSNPO
 0/Wgf8vf2Ay2UvVhfqbm/p+pXqRTsFJbs9FvxkYcToU2IMMvp4149J/Bn
 T/Kg6jBabIyO3pwiQP6KX6puY/+/IWdkt4FVS+ES94zOl3lUNflYDOw1h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="337270446"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="337270446"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 09:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775552027"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="775552027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2023 09:24:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 09:24:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 09:24:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 09:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWe9LcCTROqdniBMzUQiwM/AGuP3VUleTyNXp2jXpHbbK1gPKvR34wSkJDaaZwIVtpzrPxL1POrE7gbdAigyR5A9jQMieKwTxsKiTAW1HlYwLhh/jg3ynLUFC0MWQgDj0onA2gnUiortqTZJlPUB4GycpCS3YxD7w0aExMVIGJZOihJRhY4s+oXob3vQslvljvAfOQ7pzZbVU1wbeRuaLtFUmQ1K3m+vK4ScIngvsYs11Jh7SP/Eb5rqkvkxRNIu7noO9pM+vbTA8FpGiGeb24Y8Q4XMiIR6omjkdB6x7BSrOEy0Ru/JiQNsYRdsK42UcYLE1D97PUNeDBK+CK8vZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjf8Wcfdo2iUK+0kV4KoDtNr9+kvQALFq/2rzFHhIko=;
 b=TKKZn9+1J7QStm2K4CRMg5ileqBZD8kXWlXj4JnihOLPLwMXNvyIJbETsIPYqgm51n5YixYpsRJNZLDMJLHlPGigd0EFzZhy+g0h7RAFCBSer0lFP8RMFJjLCcXuEXROppNoZ8iPLmmvxQCNZn9dvgjaKW5KxdjEHNBoZkMzgN7AyNPFRHeco4yI5Lz+GDYvsG3GOprPGnpKPj4T+j0lFVCDnUNzeSZONv0RD1tQAElRP+FT1v4Uw+Ft2YX2lXJZzGda/0qi9IevqRulyOtWDiFfv/V1om1e0+aCmM9PCYAYj2EBD1WV6eMtyn5cblUVUxMj6HN4x3MJsz6L20a4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 16:24:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%6]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 16:24:28 +0000
Date: Fri, 9 Jun 2023 09:24:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <mwaiakgdxe7mkqs3ytqwj2o4me4u2rx2runf44q5lm2h34txkc@ljcnumpf7vtv>
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
 <20230609143815.302540-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230609143815.302540-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c8d843-d303-4ef1-c905-08db6905ff71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fq459WyOwDSI6cQrpYALjXpz22wiOHLz1DbO0SgWMfFTLMMXruNO7+70Luy4sMkBEZ+R2zktDuSNVT0VZlhglFwSJ9sIMu04seMJwROC5eBHTZq4pd2C59ItDeUVahd5/BoDQeJXkrHS/YmDmUZ4YdO2qYbWiAs796T7CMgGlLXRMmpPi34UGs0ab6dOQiZZu225Sr7IVZrh/EuoBhlF5R/Vp7nxHgOBh6gmRX2k4LWlAr3+5C5u6CMjf1yGeqBmsTamCnVarYwriTl4EPTug4eQy/WAIZD/xyCYSPoshrkd0wYr8y3com4FJ9JcMPYznZBVT+ATmqjJGiC1ixEsf95nXqUP1yRfqYq3oG5239sanjXjpEZ6kO2ietY5RF9haIDnWq7Zwt93lUjR6KxhoSQ0r0LRVa/apNI6mzqEK7lszBJ10k0rX0aA5WpK14sUl627luwP7c03Ohp1KCUzaI21A6Nh4Dr0Dv9U1j5ccIiJx6C3YmTTNgEI+m+fp1Hf/dhgfw2mbiurRumIs2Z/hCiTPMZci0zyllMq9u6+dreL/9ziB01BMPeCAT0fPMtx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(8676002)(66556008)(478600001)(6666004)(186003)(107886003)(6506007)(6512007)(26005)(9686003)(33716001)(6486002)(4326008)(2906002)(8936002)(82960400001)(38100700002)(6636002)(66476007)(6862004)(66946007)(86362001)(4744005)(5660300002)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FfLia5SsB6iqVsJSjqrsTP0HrjoRJp/rQY6BqPL6bR1p1dh3L3/hrPqTv0bS?=
 =?us-ascii?Q?rOY9TwnRxLChw9GrhpWJwQXcEnSCyXVI6/sGcDQUZypOBUBhST5AON+7rVYY?=
 =?us-ascii?Q?dqiiohX+uN/s/Ru7DYql3y/Ohuc8q5wWvBawFhsX54EFAwrM5633koia113y?=
 =?us-ascii?Q?1UbQH2fzm5ye76oDZiLV4gvDHaj8e62ad+73PqHPVak54sQH4jqKhGRIzga5?=
 =?us-ascii?Q?QE+TFLX2hhl8mnv4aftusCXWjPUgduYjBcCfhxNkKZSVANfe8lKX1Ma9Ibyp?=
 =?us-ascii?Q?5lckzuanXg+5RZpuQTHFHbHMv6t62buCeEIdu4P0VT1PYdOo9FPZe3NJSn3e?=
 =?us-ascii?Q?RRuDOnTZ0Rugo1UXJ2xGeyXdwZ4/ZDxL5KEnMb0mpgaA01+8GE0BmM5ne5xm?=
 =?us-ascii?Q?JcB8T0dZfOr+/S4PiXDpxXWAtmNao2/CY1BAXdF7NFu3SkUyaotLG0soOGwZ?=
 =?us-ascii?Q?KO+WqR1T5yscu+heqEULA7RaSxSnoOVg/anfyOhGRQb5RdOdF1SzJsznm9qY?=
 =?us-ascii?Q?UnjkVj3iPyfg+0/mtmqbzCcw8wZRb5uQSciQ7OQd/tVARfA8yIvANADWObSQ?=
 =?us-ascii?Q?hds2slA79TaomKyhJy8C0m/9ZYwrJvHptRLMIUVnEVL+OnB31IPp4Pfca819?=
 =?us-ascii?Q?UmV7x6DfCjVEMpYHmy8AFP36Zt3Vqx09yBOzxvumG0Q175v03ElkYUXaFr/u?=
 =?us-ascii?Q?9JRyahJddh+cnjR7Bm1sPZdDbR5jkPt2mpzYtaQAaL+A+dDooqTcdLPQ5/iS?=
 =?us-ascii?Q?JdWLdY1k98BzPpjDt6lsdvHFfs52Q9RQkGC+mItbjfdp3FQZmr+1xbXJtm+S?=
 =?us-ascii?Q?rvBn9DZ4unfGZKASNLPxXPYvhOFVW4fG8IFpFLgWyyVh2tfIk0LH2Zx74i97?=
 =?us-ascii?Q?7YsHhcipkwOCXHIRn8HqZxLWa7IrucBq9KBZDNA8AIRiHnXfDuhEE1S5on2x?=
 =?us-ascii?Q?85HJQJKeiklQYC7NoiX9IXUaEVK1MB/Nfy/izoaVyUxe4S0oyUx4VAlUnmCN?=
 =?us-ascii?Q?m9EyKsLEB4AP2Hlx8z+/9E+e0DCohTNk/oKMog4g68ZP1DCERFAaJ3FBwBgN?=
 =?us-ascii?Q?RNyepDZbo86yRJpom7/VLa9WBHu6tNsaQAWCtD9dkPJGCcQR60s6Lrpp40Nx?=
 =?us-ascii?Q?xiOYUqZRKXECfXERLfvbl4mA3qXTO5baDuPRKVjI6UbkWa0WYfWa6PD8KPVc?=
 =?us-ascii?Q?7+kRlECMWEej0PON0Igh/2F8zqIyJRE6iBsDXVN6cN77d7+DWSUWmT7gCxBg?=
 =?us-ascii?Q?bxplJg/Tg6qMCgr7G1vzLaCOCstoYdbmGdd42T/A9cQX/nYNEsK3bweHVDpP?=
 =?us-ascii?Q?+W2attlFgy5BHxBhQfwYkVcF7ar7quyizkajp3Iokk2IEBq3I7vCpC0ahsyn?=
 =?us-ascii?Q?F8FX9yuRKi4gPNHP/nVmb7REGLUs6JiEOlbtl4Was2HL07qtVdumN+nEKyON?=
 =?us-ascii?Q?rEaxbDe7Bk1WjnVzcddqbjs1lYri3FgM8W7sIcC3aGkYnNoTp6Z0bRnOf9bG?=
 =?us-ascii?Q?ODgOLXr2srAif7z/plwTautwWAHdeXF9ub9U2dY+o8BgRdoMHiGoeGepWijP?=
 =?us-ascii?Q?27o692aW3PMXFT/TDTsxXIm1XrCMvCh987SxGdqghYDAWq+KMTKLjCYtbrEk?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c8d843-d303-4ef1-c905-08db6905ff71
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 16:24:28.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLft2xq7xKeSPqquZ0i/cPHl0WvbsnhtEhjaPafXUDkvSpA/vPW3qKq+H6x9wXXSiB2yfCd9iEQ8gyLBX6Whb8rTpP8hGsS+IzsqzD7SnZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/reg_sr: Use a single parameter
 for xe_reg_sr_apply_whitelist()
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 11:38:14AM -0300, Gustavo Sousa wrote:
>All other parameters can be extracted from a single struct xe_hw_engine
>reference. This removes redundancy and simplifies the code.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
