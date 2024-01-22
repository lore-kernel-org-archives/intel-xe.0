Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509D9C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EF010E1AF;
	Mon, 22 Jan 2024 20:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FC510E1AF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705954320; x=1737490320;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Cs4I6nR+oipQXnhsOn4xcU4cyGplMOamK4RsRYujQh4=;
 b=YdDsZ63M1HCZdIsnqaHcXYPb6F/cvYja3G7UDaFV+uDdKFFdvvs8pcHu
 H19XD1wBB31skeqW35dGs80tJbs9zxSmnyQvRF9MXyzDnGHEgUikJZMS1
 +khI4dQ96JzO+6WbXfpik9OJ4bffNezlo+0yaUaq9nJIIFb04llJ3UIrx
 s9Z/0PAUKZZD1zEriVABgb12NZMnZHViIfah9nRQL0y24O1Amq5XRriSv
 X1CBtEH8+FaoD3NUHwG9hZBJJlisILweIUAcpO+rw8JOMGsc+h5H1ZLFJ
 Rjc7Yy6mhwBaFFtWwO5PRtgMvh13E3X/eLxfVKtajKYckTG/LfFjs8Eb/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1202141"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1202141"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:11:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="785784573"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="785784573"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:11:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:11:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:11:57 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:11:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3PS+yIsPVMB4aFjY4B8TmWMD6jhAluk9J9kPrF32z8wIIQgtVthrs9GE0wdFtpyHiSXNrUCN2n701LiCNGHl1p6IKqeKOmAZW9Rvf4Fow143zA/9hG/pNyWGnY/eEWMKoRQ/seJGRWFyWY2ISLljoqfrMh2yIalyfan9wExMvd1+IreOdNvXqU+D52VAM3S05m4OFduuVK3fgHoBrq6qhhjZU7iTWsxmJvXveEFrtwXxVwl6QkkveqCC4iPMPB6ubMnXLX3XwhrLAIbBZyMURG4bhDqdT9gXjZfwYCfUHW48EcC7R297P0t1TXO12IuoE0taA5kbrnMsvylxmcUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqXXmi7HdlFcbXTGJIk3CGXt+5KB1FLYIlkal2bM/nE=;
 b=jx5fds1WloJegcS8hgrujzuPcL7VbtmjbP0vJYA8FxEv8ecFapD7FwCv4nVem6YQlVa6BHh8AhyBmrvAS4fjVpBJ+EjHPRWOsdGJ25aw+TFVlAs4u/gBD81yCEiBoRcQ4UaJQQS5RtsZmnEqHSn8EqxBftqv8G7heDqRwkx84O7haMNvwI8JEXwH6O37tqV5B0T18H/sd+hhz9SjM2Bfk3aFy41KozQXVDOXHe9tEDTPgobKNcNzJ+ZLvZXGeGDB/MllD1O375h21UJ7K8mq7AKi3KhzPXnVocOURmDNINazqzms/pGwcPGfLYhUBAzBkvXAqzBM0p0WJkvm3lrG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Mon, 22 Jan
 2024 20:11:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:11:55 +0000
Date: Mon, 22 Jan 2024 15:11:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 5/9] drm/xe: Nuke xe from xe_devcoredump
Message-ID: <Za7MCPKPvfndug9K@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-5-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122170445.108856-5-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e8f097-7c24-4c4a-ac03-08dc1b866156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUI/aAu9Ua6uEqyNNg8HOUZN0OV6XTZyZQejHYgYqY4cQzkpqzmUL+AZh08+MSnmP4MniMGH1+AlcX4utf9yCsLlieaoSQ3Ni3W+AjvVBGAsZcY/bm7DK4UtI0RvWc+dJ9Kgkq2J30LJVTW139GD1g/48/DW8yi6F5HVKvjD6wWKnyRs9eHIbvIlERJvZp4r8ZxKzww7bqPDTijBxdetoYDPuQAw9UBXgrM78VyI85NOrJYAYTVEq1baLw6Uc+5UfcOpY4GGW7Ul3nkMgePiCeV4vDc87Wbha7oKdS4o5sLCvuZ5whEXDLPhL5Cs3AY7VsE/gCSQG4aZRahvlqp2lpdO85l+iO2lf740xOFGVbdhpP4yhnrTfkcfa+I4Hb8ZsTzZqBo/sae3z0RWvCfsfkpZSQuRXZrbfEHs1xSF1IDecQXoE4ZUhJWrgVEd8L3n9E9NavmcLCJIlkCv6dtba3N26N4CZBeYiiSSQBld901QMimvhtkQolIbF4Pw+vY+qEDa83kLbGqLGHXO3oW6sm7ILSQYwd5jghojWz7nu+pTtZxeYIbGiGHj5MvyOu8E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6666004)(6506007)(6512007)(2616005)(26005)(82960400001)(36756003)(86362001)(38100700002)(41300700001)(44832011)(83380400001)(5660300002)(2906002)(8936002)(6862004)(4326008)(6486002)(66556008)(478600001)(8676002)(66476007)(66946007)(316002)(37006003)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VZYbva/XQagxxCH6QscbCU1FdS3413ck3e+bgl07CzXw5PB9PJ00pSzkTz?=
 =?iso-8859-1?Q?ba79d8htfEIpbpqzxUD+LsjNxM4op0HCCfPB/hm3h0NPco1L+8nOVF2CoJ?=
 =?iso-8859-1?Q?0V1roGrDI/KR4/S3WVv/VS5G02P6s+z3SJwvb9Cvinh76olHQbTZfhZczO?=
 =?iso-8859-1?Q?Cl9k44s4HRKfXzojs93JSF4DjC+zBKzXKHKhgV2O7WCm3gZuMu4UfuV99B?=
 =?iso-8859-1?Q?s5s3pKaYxAzr/5Yhz4NR3YM69fTy8ig3wjrK1Ff/PyXDH/1I6HhEZBdyr5?=
 =?iso-8859-1?Q?dNFxU60/Z85jT0bwBYY+8b97Ml4Fj9cLcK6Kht6+HO68DaG/aX5Yj6mjmC?=
 =?iso-8859-1?Q?ikKBBhTa9FhOadmjul1J4KaMBMuKWDv4aCnyqz67MY3nodcPli8oKTb2b5?=
 =?iso-8859-1?Q?SvDWDLRdKJgNYTh6DkFKM46GysNYpu1fXRit162DOGz1aokKhDwH64xpSX?=
 =?iso-8859-1?Q?UpRSZGe9QVi43gko59weLxXmeJJD9jneoCDCNa0WjTW7IhvfiRiI5zab8/?=
 =?iso-8859-1?Q?Q+adnQSVuIVlKfU2wBWnCkWmD3tFktB3BPx8Ykdw1+F4mxjeLOKrizC0KZ?=
 =?iso-8859-1?Q?Ipo6IisaMxq2Rr6A5FTFExoFpRURUO+AeswgMdUHhX1Vl+X/73ZPjwL+VH?=
 =?iso-8859-1?Q?aQ0r3ngPUPJgD40YwFmoI0D/1DWIO8je4iY/gL3fyjoABJe5wEZ3Yne1f4?=
 =?iso-8859-1?Q?4iA5eokMkHb5K/jDxXcNRItuOP2jxTVi0DiFDw9oGI44bR0CgHJzc6nUUs?=
 =?iso-8859-1?Q?BEaFgV8YWRIkZAExd7K6vjl2LgqHGVUyMg5gLgRwCW3cYf3pb4Q6Yt41MA?=
 =?iso-8859-1?Q?Y1blyftwzqdmYJG4lWaWcAPzOr+aNQc0BJp4g7hjXU7NWd8so1jgr3CYiI?=
 =?iso-8859-1?Q?7wvE3PLUhN/L6keoptD/2ypMqxKelryf3hwE2V2yPt6WofIux85u3Mn9Qu?=
 =?iso-8859-1?Q?R/3xRQ5fUXr1ELDC9NNNj8HdWdhFEqrcxKdnwvL1BM2JOYdlF+UApDvE5R?=
 =?iso-8859-1?Q?eGR4gH4qNZt6M1BsXh6X5wMmCBwbF22lpMjpsCezvCTMLRrPEVHZQl4wcF?=
 =?iso-8859-1?Q?g2UGCGHQrjerhVpHZsmtRnYrYLtxFy/YbcaerqtbiuOi86jbqiBuwlWghN?=
 =?iso-8859-1?Q?CaMVRWTHPYA/oFXNfrlgojjURus+19StIjfiFrY+dBattXKE/hzWUfBjh3?=
 =?iso-8859-1?Q?sVA5mptCTwLdGosYcMO3QtMUC0iyW2ZrgG8Dripeewp5QvSiNthhRZ4kcj?=
 =?iso-8859-1?Q?4NTwcwmLB526p4VlEQvkEnVPqwdVWB7mG+q3Q2wsOWbShpY9XbrNOU2RNG?=
 =?iso-8859-1?Q?Dnfs6zc960MD40juxAfcHWUfHWc8aQ1wDcSJ/PYyVD8wmAqrTAJ8HxnLLB?=
 =?iso-8859-1?Q?8i+Y+sdnXxMyH5CqV6svj/aZCvLT0oFXkwOD60Zj/JRmSf/baJ1TaR4k2y?=
 =?iso-8859-1?Q?wXIfZr7UYpKKx6IK1HfGqjVF9HMBcgh6rLblLcPYuLpoMBnlJ+tQoLrtuV?=
 =?iso-8859-1?Q?O62zU/lTuZZMvICffU5+3N4tsiznSB6Kw5zoNuWfYHaJsZPGlerqUA7PWe?=
 =?iso-8859-1?Q?zj+epC1KVqMTN7v52tKvEgXqqJVYP0yp08IGbhBb+m8br2vbSt73BGO1EQ?=
 =?iso-8859-1?Q?+N7wSw94d27EXuy5VRrMxXp8ZNctidkg6I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e8f097-7c24-4c4a-ac03-08dc1b866156
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:11:55.4194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdhZLAhIIurY5uCcNixnCMwnLsIDBK5R+5W02ZP3eUvXX2yBfOBAg6ihS6SM51olqqN8laRaOUI8EOBV50IHnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 09:04:41AM -0800, José Roberto de Souza wrote:
> xe is never set in xe_devcoredump but if xe_device is needed
> devcoredump_to_xe_device() can be used.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 --
>  drivers/gpu/drm/xe/xe_device.h            | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 9a12959ed6b14..d259119b2c980 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -47,8 +47,6 @@ struct xe_devcoredump_snapshot {
>   * for reading the information.
>   */
>  struct xe_devcoredump {
> -	/** @xe: Xe device. */
> -	struct xe_device *xe;

good catch.

>  	/** @captured: The snapshot of the first hang has already been taken. */
>  	bool captured;
>  	/** @snapshot: Snapshot is captured at time of the first crash */
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index ce20f6fe6219a..781a1aa164ecf 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -35,6 +35,11 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  	return container_of(ttm, struct xe_device, ttm);
>  }
>  
> +static inline struct xe_device *devcoredump_to_xe_device(struct xe_devcoredump *devcoredump)
> +{
> +	return container_of(devcoredump, struct xe_device, devcoredump);
> +}
> +

But now this is kind of duplicated with the coredump_to_xe that is in xe_devcoredump.c
itself.

>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
> -- 
> 2.43.0
> 
