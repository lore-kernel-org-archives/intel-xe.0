Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FEDC61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 08:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B2210E17E;
	Thu,  9 Mar 2023 08:17:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8538010E17E
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678349859; x=1709885859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6zej+iFcP3bDRV+cfCBk1wdEZDsuUe/AOPKz3/DisEE=;
 b=e3g04P/wEOL1HPptgtaeo927xmyVBj2aVyOUYAocWMPvPYRi1IPwQfww
 Dnjivj1LfBfRCI55/ip27LyHTnMJxKBx46r+uY+U8Bjm4mz2gxZynQeRg
 LV1mE7JrbjuRyEzj4X3WZlpOUbGymp6spMyZC8jjD//+45fR5nXzZ8YTD
 yRZML842C5qLG5fwhNXRKD8DzknHqocKoKYu/eSUl2yYGPQYto/VeikfL
 Ev7ms2RfWKbhHbACfGEaaROwVxTVd5MItkIG68jTR49Ehvc8WYqaTGMKa
 vDi9PKbKf7gK4nB7enD9pHJi/MDNw8WsOxgANoYyF18tyzl4pTmFUhJ6N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333855460"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="333855460"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 00:17:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="801090068"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="801090068"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2023 00:17:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 00:17:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 00:17:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 00:17:38 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 00:17:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWQCboJvDNDYwN/xVpx9JiQVd7oFDCsA6R0w5cM5dc4veKu1L1ve410rINAJcb6DleVFXcHTXZkGW+ruBKBQB1YccbYCRfqcNAaWbje8IJoW3hkPXpk8zxiL+NfpTmwH0+ALctAPyaGzu9cKn566OIwg7YLj8H84QKB0BBu2DM98Sahuz6J9CZLgNTrCjDubzwXJl1A1PYYDcM5ZcRUKxioJEv4C9fy4AKDGYoc+peCj5LSW8kJw8sRG0ujX44Da2CeepgkWuwxDJxbO9CrCuSv0tMoTVp9dTmJ5eLAn8ps2R0OWSo5Q/gKlOPBwGRBmQA7uGoNcYUrxCbXGEoBJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iB/NZIxQj4sy8m7SjRDiwbPEodiyDrrnCA7OgR8HWj4=;
 b=WaWbQJ/rINfJCSyK2Zlk2KdudPMH/bC723wMxC+r0l5Ht3B2nDpK0l42vHfCeP9EQDXOG5v9oKkbyr8M5jp0vL4r26T6GEFdYBtlkV6107B5/a4fcPX/JoukMVJbJlfqQ/V7V+RPLGy7Mv78BdM6ztJU7VZLTrXLiRidf3iKDKsusmvadG9wGBUFxcDja0lt+F15VJlDdfTSw3bdj14tibXOc6T0/ulYHjHbq3w6V2OlGFxTglwFqzI+td5fYIf4+PuF62vdESLP7i8+oFW9qKp6NtSDEPhMECqITIqkyPbWM+ElvPn+9j+STlaXwnriUeUCXhJxWUc/snlahg+4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 08:17:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 08:17:35 +0000
Date: Thu, 9 Mar 2023 00:17:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230309081732.zi3nwprmf47tr3j6@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230309005530.3140173-1-matthew.d.roper@intel.com>
 <20230309005530.3140173-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230309005530.3140173-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:217::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: b2565a1c-1e50-4496-1b5c-08db2076bcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvHi1H3yv2/r8InEKPIuFNagxICU50h1G5iU3DWscyKVMLbHlAZAH8u0yYZx8zK/XG7dnFzPAIL4QTL8vxKB63Cl13Npo8jJ0f4YCJPeQ6AfLHl6PfiN5pd5utzBpRtdECdZ8CAJF3ViSb7ypyPrj7w8WT+E+JqsFAkj6GXMmSduexbh5F+kSoGNsdA5o3hSLoxewnGKZCUJ9H3i9Bv6kM/DmY1zzig8Pv7SvbwEpXH4HaOvRxkPMfXr82t01FmO/KLoPX8j5brUFj1H/hNdHT2BhWeDTRcYcNWYAomBnXQeXJ7o4VstFmiViFFdi73WFwtBAMDYu+0Anm7IDgDzuIfo4DBmPY6bGQrMcLyprzVDeKIWILz/u5Muq/CR8Bzj5pyTfn/JITLEeyTd4YSSIdK/9+jBlUCaNlckvsQlLxd9RoP05LxOCcooSRiEShBLD6uO+7nba351i63I0cMUcUIuuqgi3iZqOKAoz4ppiArx4UBxxr3wrWfh6RzB3zkmlUU3YmMiSYvRQiXDP7v9iFHP97QUh3Oh6SmounVrOClOYtIg3o7h7/9GDsaq2X7JTWImTHvJxCiZjNTnDiJGzfHatkkzj6rECvkSSUy+FMVXsisFgnEx51uBFTfYmMtIoMJ0VCmgg4xyNu2xCZ/VBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(36756003)(6636002)(9686003)(6486002)(5660300002)(8936002)(316002)(2906002)(66946007)(66556008)(4744005)(66476007)(8676002)(6862004)(4326008)(6666004)(41300700001)(186003)(86362001)(82960400001)(478600001)(6506007)(26005)(1076003)(6512007)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Juv+Dtz29HVwexD+t9WN/9uXmUhaTtKbMP1n6NOYkOuoKTS3LAz/G5MZ5Uo9?=
 =?us-ascii?Q?9OXz7Jq0XemiCJo9O40EGj+bns8rY8ogU/JHun2fx5zDyJo1FSH6qzarP7Rp?=
 =?us-ascii?Q?jKM/41RbtKTXNrI2tnYtTAOPpqZv7xCKxGF24EZPkKoKWkoqwK3hzYzrMuOb?=
 =?us-ascii?Q?umNMbEVmjtTZST+nP+iM0ue6Q5i5U1mL8chEq13bI84vdLc8evtK24kiTY/U?=
 =?us-ascii?Q?E6WubrzH2liq5dzmTB6a/OTjlpvOenK7pME+aof660ZWkL5wH8wugSuV7S6E?=
 =?us-ascii?Q?1oCdWWStk0HFk3T7BkNf6gJW5xf/1aLhNPOSFTqC6AHbMvTQM2Rk/j67vmni?=
 =?us-ascii?Q?AKK/4GkUuwMc9M0oBGf5s2OAT6A9PzOzp3Sn9HpBIebFnMSHqdTjfVajdvBU?=
 =?us-ascii?Q?NH0mf8vjbeZEsFD+wKAVetmxTRg9wHJf227hSqVmc86LAxnAYyiX12uyuiM5?=
 =?us-ascii?Q?wdKidKQ7sdlZMln8+psJ/r9APh9nTYOHWvwj2qDiinPQrYmicOrc04nTrZB6?=
 =?us-ascii?Q?JjrIq+H2bsTJ5ZoQW4oL8ESwu5spzPKHti4p5rQciKvgFw94OwLBV/ZLD4qr?=
 =?us-ascii?Q?RK74+oYMPqy2XkvBTyNioppWzYFfDa/e76sqkuMFlUkLnUthSOXZbfNQ3X+6?=
 =?us-ascii?Q?Kza8VUF5zgB45wqMCaLjcij2GmJBAZ+WR3gaGoxf1CijyjG+cjioiTx8WWSO?=
 =?us-ascii?Q?g6S3JOI+KmBm9CiWRZ5z7PSHsWzA2EKLy7+cCLtu8pgOFfc7kX2r/8Nx2CGJ?=
 =?us-ascii?Q?HROnzs8LavLqvKMFx0+MvAHzDZQMyj5rRnUGlsUPLT7A6d+1+NEgfZRzaKt9?=
 =?us-ascii?Q?ShV9MUhxRriWPPx/+3UVaBJRNLTh7jbWNrRj3SCUNWSP8GefBVv0Oyyrh6Sc?=
 =?us-ascii?Q?p3GsGzUkGWO3g8nN4FQLYrjIjNUdEGzgrqwJvlalZSojBlD/kx5gyLQw77Wq?=
 =?us-ascii?Q?MBbmxU7Ilw7xNlw5cGEaq1ZmGz2JVm/dCXli594dBXqoLTO6WBqHibu37s+Z?=
 =?us-ascii?Q?MGmLT7wKbOfo2mMQWBhpF45iDlkStbREJgyRQaTe1SnmcSTf8khxfV3ngFCN?=
 =?us-ascii?Q?oxpe1/Yra71ZT/VsS90kZ4GXYmv51AAnrZgpDU4GgMJMawCavzZDbgvsIrWb?=
 =?us-ascii?Q?6WxmzhlRuBEecQFOlHMYExzq9Hw8A9qH3Ym4hfo+sbYVrLirNKlsq5jCNlr4?=
 =?us-ascii?Q?JVHRD7369arAGblwqQXhEDPdszap0ki1a9CCUXALUBm7dqFfCvN/iDZ+b4A9?=
 =?us-ascii?Q?PnppGexOAelarKqYptgF/hXD0N6o7UvMRPmkqZVzAwyxJz2pm8n8lc9oiYLk?=
 =?us-ascii?Q?y64TLoYE2ydx+xgokrx5SNsuqJsbllX57wlTwV2pAokr81tuGoRKK/yH5EhZ?=
 =?us-ascii?Q?dQzR6tXV/NsaYJWEdop62vqQIpQJ97UOW0Rehc2NEgfwNapxB59tEHVWaRF5?=
 =?us-ascii?Q?9jMf27k+XEQnnE8erIANdNPjnjrjSJATIoJzdY9ul2NQWZKZTOaH9ywCar8X?=
 =?us-ascii?Q?Kox5Rb0V96UdaFzPg0cQ4+ROUskhSo/MGvIfL+4rdDFEnOsiVQ8TUAFfroBj?=
 =?us-ascii?Q?8+5yF8GJB7Pg0xQ2bRBiQV6FZYoDHmtK3syDPrMi/miEpxklwqiKQOP8tIz5?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2565a1c-1e50-4496-1b5c-08db2076bcff
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 08:17:35.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJrFbGTfQScVT80svChKfxDh/iP1j3GWd9s3GxGwXdxsxtA85nHJ4VVbdjYzs5lWnrcEevFbkP9M65YqqJ1lsQvK3Ege8WV6M9GtzTJLIVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add support for CCS engine
 fusing
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

On Wed, Mar 08, 2023 at 04:55:30PM -0800, Matt Roper wrote:
>For Xe_HP platforms that can have multiple CCS engines, the
>presence/absence of each CCS is inferred by the presence/absence of any
>DSS in the corresponding quadrant of the GT's DSS mask.
>
>This handling is only needed on platforms that can have more than one
>CCS.  The CCS is never fused off on platforms like MTL that can only
>have one.
>
>v2:
> - Add extra warnings to try to catch mistakes where the register counts
>   in get_num_dss_regs() are updated without corresponding updates to
>   the register parameters passed to load_dss_mask().  (Lucas)
> - Add kerneldoc for xe_gt_topology_has_dss_in_quadrant() and clarify
>   why we care about quadrants of the DSS space.  (Lucas)
> - Ensure CCS engine counting treats engine mask as 64-bit.  (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
