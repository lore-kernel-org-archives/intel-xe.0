Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09276C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE310E6AD;
	Tue, 12 Dec 2023 21:56:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EEA10E08F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702418161; x=1733954161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=653kycn4dSbImGBHz7gvvNfhPGGnX1u04QIq1aX+xUQ=;
 b=kNh7USahtemaLbpYu95WHerWRy5YLo6ksK+YLtHbBl92wD8ZUsVvX3Zj
 nGRfk/vTac1ooXhXoRV9ohbjgI/wg+ghCfVUCiu4/mrX/u690QD6p1DOR
 smbJiJiotk8uMoBNvY8jBlYhOIXU8oZHMU5EG4HfYuf3XOsybrJGsEjLp
 ws3Xa5TCAtSQAgEsV4gIw2cwrbQPY7pL2bSn2sYGA1wn+L1NtqKai/l+D
 teXfVFJnszf2wPDVEQRMiOG4JopJSDgyYMt+AbQKUeNCE1rsR/25pwb+w
 /q7oaIUz6URW0gF6J7r3sj2odAaZpUFyG8P7i9EIyoKcB6XGPFx7hp+63 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="385287940"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="385287940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946937915"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="946937915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 13:56:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 13:56:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 13:56:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 13:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVMPmsPAdHGg+YW+ZFOd7cQ/8cMHu42LN8q6bUVilJ4Y2rx9p+Hl3frwoxTbstdyoRE7wDuGxKL0wa2I3i20fUBlBuoq3Eg2sM5oLSbY9C6e9rnQhaGYS1IqKJ3e43PGt34aua38ayyEokjQiN6HqDXLHgXKksSx/MWUWMt3HtZW9PsQqc41+QEBQwnRFTFWW/cLKY60JPGDlloD4KergItw+x0MRcM65clDyGmsqKRLmP/2olQMu10Wz40dLFxAxwnFrCNptoKAcZaRBMNPPyBGmsnXLim3nc3i5sYAEKYRVPJNBswbunHnaM+O/Yh9dKZQmkJRnZ9V5EbI23t8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IApmiLWuuJWLSG77mbygzpWt11ZA15s2a5nBw20kzTA=;
 b=a6fOt8++jcOizBUORvsLcjpsbcXhdUF3Sj2Whm4ZI0rkpD5xg8FN9EJcpxs1O5u+iZTij9bX1gH6QN5+KbGR7oDX+u/T8usdEie3bpxWA2eugWc613EzuJCsW8V1ngu6KMaWWEgOq5BsX6zSTfCb0XMiNq+k0M781kJaAO/DNetztMWm8aj1GE9HtkufYP+Xz0HCSYGSAivVS/5/fiez4FyF5ybUeYQegKX4hUSjj+SzAqYW6e5B6HprYyFFRITqgp719iATj6eZJralTk9F7HGBwAqFHsQ3jn30hELHD2Kn0huyiKz+7dkMOIjUagxHSUkXWpAYvrEP52ErCZCUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 21:55:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 21:55:54 +0000
Date: Tue, 12 Dec 2023 13:55:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 03/10] drm/xe: Define registers used by memory based irq
 processing
Message-ID: <20231212215552.GJ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b184ee-052b-45ae-d7d5-08dbfb5d1d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ke4LXNca2hW7NXZG24KvhVCEe4udqRrUNhGgYFQfKP9cb2+xDrux1xXzZBfx7Tis95gF7w1P79ZSQe3t8PkTYZqMjmvJPC23/P1a2qVuzI8bYx5lVSL1o+1G/mjRLnQHrElaASdTqsRzUTGqELm0PX2FphtS3Ekw9EflawGLR2jXaIedmoorSujlUgjJ1P681Mshyi6rBP2UPG8xthn1Pt4Z4szocjelUEaCXrTMDoMLQUrpYZ/t4QsEV0rs73Tr38+/1DC2uDdNXufyDKrvzaQQQOR0orQhTSv1c1im53ir7tgmxuSbt+PJOb8f2ueC7FpO5NnSA4nDe7lCzEFMd2Z9nBjKupqgr5/RVWmbli5e8sSq7RfesJj00e/KrdrVPMqihz/JdDxUYsPB218Jn5IxHu91lK5UL6WxvJD7IoD7FL6DghJLxcWrG2YEgMLa5jupnHH2Mk+wvG89TDakBIajFNRUK7ei4ngnOkMefZN2s1idcnZeoyiJwRPeoN6SJqo7u5XcEaxwXa+OuG9DmGhMDpOnwkUBOB15Uz3kqQhovW1LRjfxCffGyVLIqnA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(1076003)(6512007)(8676002)(4326008)(5660300002)(41300700001)(8936002)(6862004)(478600001)(2906002)(6486002)(316002)(26005)(38100700002)(86362001)(6636002)(66476007)(66556008)(33656002)(66946007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YMPytHqfaj+3VH2n5w66WmurVOuqI6JprzmCV6iQtLdRhJxXCXdDpRLPYrSF?=
 =?us-ascii?Q?go0eaLWQ0Lgsu//DIgNx4IE+DUke0Z7j2RsvGVLvISA4atiy3YITHFpAIfHL?=
 =?us-ascii?Q?+nE1SR6AQ9rMD4lciIs8w5MqspmqtLuPsArbVVpFaLceCJitCcN35suhX4n0?=
 =?us-ascii?Q?l0+ZrrucU1FpmSJ1enVilgMSoPTb7+1qqhw+UxesgHjGU1FEBzyQR0fHCzm8?=
 =?us-ascii?Q?dd94AAEGC1vs0ReMn8gEwqOHA2bLZ4oSwSixSsnjDhIMUyriAuuwXDDOyxaY?=
 =?us-ascii?Q?KdyR9yUnAH7craiKJkf6zVn24CDTFF1wXeULUC+YlwbwiW3gvhrPd+78CzBG?=
 =?us-ascii?Q?/AY0O9cB2arzx+e3gchvnziJVGLEW8AGev9IiLBJTapicZtgsw2sB0OgB+PN?=
 =?us-ascii?Q?eyCLn5dRsU0rCAEWgs3xoydTxsBCvRkZb3u9+DmAvKmwRzAC/KDHIMsPX5iy?=
 =?us-ascii?Q?YVkVS1S9zxLAz0w74iqdXMkITctcisKAoo2oSKCrEcJlzLBkS++PhXDzel/7?=
 =?us-ascii?Q?yQgrMrwC/Gg+iUNeOtopPjkiLLS/WNch2i5w889ZA4CS442giqKjWeQ5Si8w?=
 =?us-ascii?Q?cHr+fC4pa7+hVeqPAi/Qzv2U9bCC41LFqCkqMyN6/CHcTbKA7uM6Js3jsFh/?=
 =?us-ascii?Q?IddBrXKqZHkY6R/Oi2aroI+z1lYCeJGEMv57FPl7F0TkBDFQO23VKXqolub8?=
 =?us-ascii?Q?+sdMDt558PIjfawRuORAzchAfYhgUIUFHtU8S4+Xp7uZRL/SCX5hxf1cT/hY?=
 =?us-ascii?Q?1pUzyFeQepTSKYR2MzA55qe0pz05qfwaHFlUMhzDtX0V8nIvZ9ae+5PVE9Ic?=
 =?us-ascii?Q?O2/NglA0MmtQPZExsZfn3WfgXvFauCpV0udQD2hIJDY1J89O/uGpGItBGcBw?=
 =?us-ascii?Q?2EoAJYg2pxhtFILsxRoCMxhPFUphga2AvTVUzSOUIdBpItVGRpLKbeJxQfvt?=
 =?us-ascii?Q?h1YihW57W4IWu0RSLuH+JWPofVtd5rn5w0SDlOr78RnYiNWyUh8wFRE3nG5z?=
 =?us-ascii?Q?dYnUeDr+A0DT1W+4ASDtKz/aua5sBHOf4I0AB0OuIQf3lHV4dvGKzxJ8dJjh?=
 =?us-ascii?Q?bU6B66jB85rkOHmd9fmIwe/Bj7Jpyjx5q8smpDnhkAbLfgRASLFJcNbU7PH2?=
 =?us-ascii?Q?WoCppcgqQ1cCZISusGkZcZ9Od74V9p7POazb4k1iBH/+UOfAqFCzHhfvlrDb?=
 =?us-ascii?Q?R1uG7RM2Pkf4lJ630Z8HOZ+kwkwq/S7+TWfnHReYRKnAvI1ywTm6JBG62lNT?=
 =?us-ascii?Q?ixz0wTeG8eNtA/OxeJ/W5LnbghS52Wh0WrykodhD3InEzes4np7Oegq981s0?=
 =?us-ascii?Q?SseuqJEfPZzeSev0FKUWWnBWcKmklLT9TgKcfAy2P9u53dxrKlRrY+WDvk+9?=
 =?us-ascii?Q?XJaoocXNuvs+yAWS5mYXzt2gBPrA2lacH/SA/fn+TvR7SUir1t64skAATBCB?=
 =?us-ascii?Q?nCdtffZcujwySnYCvfdjLFWJrIaMugpNQv6LhEGKpVPLpgFf4laDyh6R0b5I?=
 =?us-ascii?Q?mE3fKkXz+qJlnBV93pKKWOn2eYIfn67dPALZyS7XxYGm493kK37V+5Gqq0WI?=
 =?us-ascii?Q?kQ35/l8ZRl3J2NYMCPDl2HINSkyWflYsSEj1DEH3+3o1/TLPvx08Pgr1NnLH?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b184ee-052b-45ae-d7d5-08dbfb5d1d5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 21:55:54.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S15bfLKycHgNFk8h5HErC9rMKgFKgsWen/g1rwd5/5dB2rK1HaSLTyMniXL/96v+LvbZSRFbGzNwekJu4x6SbJoe8swjNWqK0x+AYIMPT4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

On Tue, Dec 12, 2023 at 10:00:47PM +0100, Michal Wajdeczko wrote:
> The RING_INT_SRC_RPT_PTR register points to a cacheline in memory
> to which an engine must report as source of interrupt prior to
> generating an interrupt to the host.
> 
> The RING_INT_STATUS_RPT_PTR register points to the first cacheline
> of the Interrupt Status Report (ISR) page (4KB) in graphics memory
> to which all engines report their interrupt status.
> 
> The RING_IMR register has the interrupt enables and interrupt masks
> for an engine.
> 
> We will refer to these registers shortly.
> 
> Bspec: 45963, 45964, 45965
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Unrelated to this patch, it looks like we have a stray/duplicate
RING_MAX_NONPRIV_SLOTS definition that shouldn't be there.  I'll send a
separate patch to drop that.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 3942db268b01..5e15c707e017 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -39,8 +39,10 @@
>  #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
>  
> +#define RING_INT_SRC_RPT_PTR(base)		XE_REG((base) + 0xa4)
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
>  #define   RING_MAX_NONPRIV_SLOTS  12
> +#define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
>  
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
