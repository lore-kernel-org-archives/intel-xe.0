Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449B3C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1233210E9CA;
	Fri,  8 Dec 2023 05:18:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79A10E9CA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012688; x=1733548688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8eTHq97l8WnipMZyEsOnM2YPKCCGOPnIE8z2cgvXXD8=;
 b=E73fxEag1nGI+IIZVyy3RAQiSCVR+n9zkkgVBQwgKBbOsfApIbgtrNEZ
 8MpN7QXOjU8mEGso0Fqlx4ljMCv8YEveAqiqXaTwJReiEtWp5X4CSx0LL
 IkU7XnvqA9V3FmSeAoJOLQV5+wU3MHbLIqjfVpNduseMw3V4KNL59Qvcv
 vRd1ALbtd80UpbxwfnSaKKeWeyHqTIFyCJlJrcnaz89hZqhROdSWL1F2b
 1RHfH3cut8U4q9UI6YneT38afjrVnUjO5JRAuFieaefpzF5V79m62qVp5
 Itp1rREx8OWrguGR0r0g4oz2VfgDnvnSi5MBbYbxIvjA5v6czbrlsNu91 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384760309"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="384760309"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="862744018"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="862744018"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:17:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:17:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:17:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:17:52 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:17:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjUsfEthS08Hp/+0e39FqPpQoiLfx0MrxUyqqCksR0XIF/UQ2Vm9c/2R/p1gZrT7r6Lzns0tSWSiFAAomDbuEY96BmuBtW6G6r153CaTZrzEcCqVCSKxOkebngwfPeSHZSgDVWHfrH6iZ4ZZJwOsxCKHM2LMWo9nHUAYyBtbZm7KNSx4+UNYOI1DU43aTeZLbZVAPiIXI52eUU1/6K8LINuHJ7jo9Ci4sff+fHSJeaDhfRUpSf38MqNJKb58FHBlFzN9vowE2jhN9c65RzEMurW6N2o36YgqF6eIi0m6zNkWkFxoU0qhmjICgCYW44iltwVv7SNzLPOOpXfWf2ZJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGwaEmw16Wl2POifk4/oqDBzyT1vOt9vfksPP/Fj3Z8=;
 b=LDmnWtTZ/MkffyuVRKYru9HiZNGNOawKsKJ8pD7Ii5QDcbFdXHJa19miQtYg+o4jvs1NSkxUbTxyCz2o5H7hyKKIdZxS4HPphvm9SXul0IwZrPbgQF+jc7xA89Ezd2RUxiRUBqDqIxos5Pg1rxUdP8BpVI/Hmq0z28hLjaj2EVnTSHTmRnDsiDIKn5Dhp6KmDHc+yvaN8Kp7w/ORj33IzSU/vicxf3+LYk2TsktBGROYCYa5k6yXzUUh6F+8iMTU009iouh4bagHUep23ll8++oQgo8oYT2gxRhIjBzNzQJlfXgxZ5H9nH1Gbqq6+oNhv+tvWmvgB1eNUgNmooSoyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7844.namprd11.prod.outlook.com (2603:10b6:610:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 05:17:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:17:50 +0000
Date: Fri, 8 Dec 2023 00:17:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
Message-ID: <ZXKm-lm_BbzegovV@intel.com>
References: <20231206095318.30326-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206095318.30326-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: e014753e-f647-4811-1a18-08dbf7ad0581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCzwBZ9YJNPOY4Ttv+NqwRQnLoBAJdcxEMcR1bDEGHNtq2NFdMOztottLoxvAQtzDS1X4NoHjTdBrRLWvOUgcKpWmNd7lYdFyLSB461W4zlVXNOhZjNlFh5Vz9Z1AxrSlw43/ODAPyaLN9irJeIah3KEoXpvrtvA8XkAAFanotyE9szvtXMgKldQJxfKtxlVG2bn46yJwL5QPOFhiLfPruCboNnqdCtOp4JADEHerIxKrOXZ5xfN8PpQ7huv3WCkbj/mAfmj7lHzKqwdzYAvJN88SQ4Y1HSvOWrJxApTnDjrjZNLA3FM+Xjx4q8ombElnIiH1x4J6kHKxlXddJCGssSjHJCm8FNBQhGNO5qvOyzs5JT+ekR47u8+j7/I1Iq/bDm/Fv8sy90kSFTEUCbFy7bXMqGxGxJR8atVdzUca/ALx3fPKqEBT0G1J+vnWweGtg+qY3gpMveSLTv5XmlZedhlPx2r6kifQkMi1Xgf66nqA8w5jqTN8J4rUKJoXl+ME4vxGG9Hw8XNx+mgrudmRwbNPayMZVcGldRrWwTuf7qITxRjwD71EeGMl3eK/6e+nnsA5fOrWQ1ZD/pDgSEN+qKHVtUrSuo49l6mKiqthlPoNBAEjWLi2OYgW3ehew2o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(186009)(1800799012)(451199024)(478600001)(6666004)(6486002)(316002)(66946007)(66476007)(66556008)(6916009)(44832011)(8936002)(38100700002)(26005)(86362001)(83380400001)(4326008)(6512007)(6506007)(8676002)(82960400001)(2616005)(5660300002)(2906002)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJk55vutuxwDG+QIYCzqbw8OIM97PsQxfzL226syG2k8c+xqwV/fQWqBAbi2?=
 =?us-ascii?Q?k/X0y61MW90HebQx+Wku8JdoOul3VDNURZNmvYMaziQ3+ENzcgqHK1sfQgB3?=
 =?us-ascii?Q?2TmHUWVhriXPrVW4P+xldNkz6q25tKCJo1eY42YkCtYssKeA65GN3HgCTHLT?=
 =?us-ascii?Q?MPlfAPG6UxJKlIWfAkpLL7hbWsCqB2G/JqzWEPFSFTrSRX8yKgNrUg+jdnDj?=
 =?us-ascii?Q?I5K6OVlN9NnVL+N+uN5IVP6LTquZ2caz+kV77abVvbiqylBJwkuGI85a3DPT?=
 =?us-ascii?Q?Hw0b4/jXr3ehgeawjKTastmml4M8K8ukjoTqqZ6l6RDT7yCp1A9dSt+rLshk?=
 =?us-ascii?Q?bJoOW47DpF3dUE4J80F382BMcA99Ogje6+UOkLzkSpFOnjLKnosqlfxyMb6m?=
 =?us-ascii?Q?8E6Vn8Fm5i74U+syGnatqNeab8FpH9Hqjo+/gArtGODscrz6qwdOoxH4eU23?=
 =?us-ascii?Q?XKC8WnRwmojNkZ3uVzYFWWyH04GfqRYebJ7loU38BrORNubW9fN1rBn+voVz?=
 =?us-ascii?Q?DuHWrmAebiXVUQVv00LnEleEkPBPJ2Q+qsxsSSPbRb2KR2DSaU/jBoPOA5rX?=
 =?us-ascii?Q?OCiwU/ss1jvD+S3ZrDQ2WbafillQDDm42K8MUfp90RaI8Anc4VqCsciSpusz?=
 =?us-ascii?Q?IP7gIH/GdH0lmKtDpTy3jT8cwjKzBBfsHMTMqbMzlNsNqKbHVsc2Gc3YqKmf?=
 =?us-ascii?Q?IKoVe5V1p5cY3d3LJfZIm7uKJKeDb4RWNQyPURfiGN/vOHWnKwrgOotwjnVE?=
 =?us-ascii?Q?bn5rqbKFCLiRO+e9DWKkxVQvCDFIPwXH+Q/p1VTw/ClK0dZh+kTt68oIzGPX?=
 =?us-ascii?Q?GMuZ5p6W8ag6IDCXV8AKW0OUFFKsjXi8fvdmw13FbwI2BLdN58xg40fwaPSu?=
 =?us-ascii?Q?Uv3VhI3U0YbTvGG8UnSlwR4Mw+S6+gpvAIv+K93hXJIFg0zZp/lqmfIfGp2Z?=
 =?us-ascii?Q?beMPv3WzXDQgfAQ5DsX80Wyy6JZrUY66kqtDOxXMGH53z+ScNte9LrCWyTtm?=
 =?us-ascii?Q?Or/nqQ8z9dHSYT24W3pZRwIcDmq5hPq6SJ4mkVDChbVE5xs7zFAFvb9xWWEi?=
 =?us-ascii?Q?1mPKC4aw2VLbZwSXuG+U2c4gNBVADrSBOxR0AD3I7NFTkt5bX8V+oP8MZIzX?=
 =?us-ascii?Q?K/ZhDKBVonybbfUO2Ki1wL5hcLaNkbAQSuyyMkcQaEi9lLWf0Q87gsXpWSjQ?=
 =?us-ascii?Q?YiC7xKXiFbuNk0cOZjAji88Ima2wxYhyo88Ii8it0DD0Yu7Wlj+qkDlqoh03?=
 =?us-ascii?Q?oS6ObQGVQY0HH2bs4b124l62fnQQazxRPKXDIkwkdMvj4MDDx0l7WBA8y24A?=
 =?us-ascii?Q?7xfeYSC1bLYnE9gHDCndCM4xx+jzaTLFDO+KTnrSAkDSMdmIId51MQHpNi9+?=
 =?us-ascii?Q?b+EJnUD6xziju3P2TpJvL9IPVY/2WL2HWhnLrs04to432iPYL+6rZtpntSkd?=
 =?us-ascii?Q?6QbLdceYp0rbesaKPcKaAR2HX9QQZkUniBQsxsTNYD8EQXIdNOy+JqKjt7Zq?=
 =?us-ascii?Q?GbS0TZPn3c3x/oWnpUVXFey/KjUsfUY8KKhCOA/Vac/ouREe+NVGg8cRk7G8?=
 =?us-ascii?Q?gn98i8GXgvJocm0FKEcUUv4f5ksoF96T/0RpNcCrwH1LPveoolq82gjrtdwT?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e014753e-f647-4811-1a18-08dbf7ad0581
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:17:50.1269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jerGLKAJzNxDUDXrDtNUDmymMYWgi8vhVRzCBn8qigK+kVRKUJ8D0RYT2ReRLkqdeMKct6h0sOKJYxzxfbyYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7844
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

On Wed, Dec 06, 2023 at 03:23:18PM +0530, Aravind Iddamsetty wrote:
> Use spin_lock_irqsave, spin_unlock_irqrestore
> 
> Fix for below:
> [13994.811263] ========================================================
> [13994.811295] WARNING: possible irq lock inversion dependency detected
> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
> [13994.811358] --------------------------------------------------------
> [13994.811388] swapper/0/0 just changed the state of lock:
> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
> __perf_event_read+0xb7/0x3a0
> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
> past:
> [13994.811528]  (&fw->lock){+.+.}-{2:2}
> [13994.811544]
> 
>                and interrupts could create inverse lock ordering between
> them.
> 
> [13994.811606]
>                other info that might help us debug this:
> [13994.811636]  Possible interrupt unsafe locking scenario:
> 
> [13994.811667]        CPU0                    CPU1
> [13994.811691]        ----                    ----
> [13994.811715]   lock(&fw->lock);
> [13994.811744]                                local_irq_disable();
> [13994.811773]                                lock(&cpuctx_lock);
> [13994.811810]                                lock(&fw->lock);
> [13994.811846]   <Interrupt>
> [13994.811865]     lock(&cpuctx_lock);
> [13994.811895]
>                 *** DEADLOCK ***
> 
> v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic
> context (Matthew Brost)
> 
> v3: just use spin_lock_irqsave/restore
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> 
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 32d6c4dd2807..9bbe8a5040da 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -145,9 +145,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  	struct xe_gt *gt = fw_to_gt(fw);
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned long flags;
>  	int ret, ret2 = 0;
>  
> -	spin_lock(&fw->lock);
> +	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!domain->ref++) {
>  			woken |= BIT(domain->id);
> @@ -162,7 +163,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  				   domain->id, ret);
>  	}
>  	fw->awake_domains |= woken;
> -	spin_unlock(&fw->lock);
> +	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret2;
>  }
> @@ -174,9 +175,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	struct xe_gt *gt = fw_to_gt(fw);
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, sleep = 0;
> +	unsigned long flags;
>  	int ret, ret2 = 0;
>  
> -	spin_lock(&fw->lock);
> +	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!--domain->ref) {
>  			sleep |= BIT(domain->id);
> @@ -191,7 +193,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  				   domain->id, ret);
>  	}
>  	fw->awake_domains &= ~sleep;
> -	spin_unlock(&fw->lock);
> +	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret2;
>  }
> -- 
> 2.25.1
> 
