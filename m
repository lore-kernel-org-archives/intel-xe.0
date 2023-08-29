Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F588C83F18
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 19:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C6910E48E;
	Tue, 29 Aug 2023 19:14:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3811B10E48E
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693336459; x=1724872459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oEAQnlb60tDxxFzyXhC3zIxaDB+fkT/tU971890jl1k=;
 b=nyHV3304NlRJL8zX7VzAPU6Cp/+LcMzGte/fIisNK12md+LYetGYecZJ
 wQz7ffnwxUqITSZ2Nm31VI0xriSXy80LEKV+v0T0HsAqR1CfWH+NMXW5x
 q1Xv4ce8Vpf7KE06gCtsqPM4ZX82+9RzNeGI/ZAE70BZWkikvCKDYWb0Z
 +lmhGvqm9aP1WXlv9fih1GgA91W++WWKTYxxnANqB1Oxfu50zjzjenca9
 4SI8RJ6XEOs+h8FJKLG2buTTQHYsUEK7sjmow62NrnVdbUBAKc+oAP8PY
 6tL7qffYV0KY+u2hYobt3673VjRVF8RKMSDLoUuxjw3AeP4snrwfKtEit g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355778105"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="355778105"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 12:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912522189"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="912522189"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 12:14:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 12:14:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 12:14:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 12:14:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 12:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HECcJwofjHp3w0byKX45As7rGSOCAYSvDivh4N8UrVHgTLjrc4Lo4fsHr3qdHsumR2RMlo+TEVnMTcXVEMC64VkM/knm6cr92JgfSO8OAp/ukR6RCWg2OGj/j8IXlzjgOh4o6n7wLugSeOoVIShpm55CQUViS6GwETX0ef41ikl61YFmZkNEothZBu3aNvxdhx5PIU5YEvIbJnhUpOlpl+eH1eRycrx7M/Fg1BTuw8G/4HEHumSKnsioOVrZUKpYdMF1BEKN2QkhFttZ94bv5LtvfpkrArRju4g79/wXE1i3BSnc7GNfNhUX17oy3fs4I2XgEuY9n21wTjZZliDOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ckbJCVJ3SigAiW88bBZ9jGOqSrQcArZZqRNHa/WjU8=;
 b=WJHNd+aXbf1tdu9vX4K0HF/Av9lTNkUkQItF32uA/fk8Cx2b7mzlAc6cSdRO9XT4u7MqN1PYBRjImJitVBGT5aIe3wfUpBNF0kcW35t1zMRFzxcFJmtynvTYfgtUNEkvX/MXkxMAZJ1K0l4Zh+r0pr2FvKYWXzBaFfdeE5YqZqCfUAk8Ae75t5Am7vId20WCD2I11ho5Uu9WNK6FeKHLFH4X5LSXyIzAFFJIJptD0LXfWVn8bPbe3F309dPJYP2g/uZTRK+HJ/Olazm6dCd8+1J1J3vHs/SiS2vk50XJJgWFA6MEe6KDNQdorqUO0FiJshYDGAXxzWxeiSe+s2rmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.18; Tue, 29 Aug 2023 19:14:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 19:14:07 +0000
Date: Tue, 29 Aug 2023 12:14:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230829191404.GL1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829162840.73444-10-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc30f84-282f-48e1-3a03-08dba8c41e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uim+cXMMZJf6trYU7edvZw+rp6KV7QmTNWdNxYp5EZ9ZHdWlXkKjpNeN09jyBZ8pAvmqu2PhrDi7kOaiXyMunfv2843DYAylIbLC4IIixf365dTEZU0kNAZhLu4fjIPK6GvIpPMZWcL/CdBPijvgVxcCf2cMyBLqPStHX8/2TAv66OE/vRYpAYqV3ExKVQxzBaZteDr9dtYjF4RWDInQLWL+AJvJ0P64qCg9sJ78cFHTjzt9DpDm57KVpVvCAwiv81fKnbXZ5yuDVEkeVteqBZpDab61cbByo1x3s4GnCZuM1qtU0c2h3wFw6Prbk9VO68O5WMwz72lOhDnLH0eDIkNM/PExU8HtbMPKR8TRO8ggdl4wa2qrAqYvV/OLP2yLDWW9MezVtGYjVz9N1GnUEImnWSCzJKRVtrzAkWpPA4yuzLbPi5lLRDz/OC6pu+cWFAR3ZCSFf5eVCTWGRcQzDdiX0knkuJ3QjZczKr0ZnjedL3AD5pyX5d0Jp8jm1aRVKSE3nMIe3wTGOXyQhL11LvWS1e/louhVz/2kLSOKoJXxDPebS4kDpskFmpiKnBhj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6666004)(6506007)(478600001)(1076003)(26005)(107886003)(83380400001)(2906002)(6636002)(316002)(66556008)(66476007)(66946007)(41300700001)(5660300002)(8676002)(4326008)(8936002)(6862004)(33656002)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1zw6vZu2ME+Jju9oF9lRyAriAvZOQnCT0iYEXG9kal8tlsIe3lEPvH6ugxk6?=
 =?us-ascii?Q?Lw5GOGqwXdnDW4uDUFDf86y0dBKxmdom03pyaOW8098Zj0VN5BCcp49FiqJU?=
 =?us-ascii?Q?hUaABQoVTQBDJ5hYJxwB/nMcZIsDoEa3YZTTmP3byZAtVXLsemWEmXxeTQDb?=
 =?us-ascii?Q?Vel5ZpJHQNagZqq6RpXBlh0OAPO3Z0p/ukOldhuKThkwEbNBW+8A4b134L8g?=
 =?us-ascii?Q?cyF24mtTpT84U6aJQhgkeH7RDpw6Zf2Qi1VjTnoHpRQlbTcFrRCA9U8BePmW?=
 =?us-ascii?Q?5YbDtLormaJknhHT4OPLmcT5VRWcuAMUn7Ifhdw2TBKqi5KMzbFej5WiX+c4?=
 =?us-ascii?Q?nsTC5RtY3TSAFkBYq2iriK54sgi6eQ3/J5Xc+pG8aEXWEI44X11YnWIlXeAA?=
 =?us-ascii?Q?GPSLsD33AuJ2lSmAfFxihJ5mSnAT+ONj8JTMbE8uGl5ew13gb3g+YtIm88P7?=
 =?us-ascii?Q?GTVoio0fhx4VfEZw1SKPFQRZn7SEkwqB0G91M+ci9M0Qk/GmmOvWJ4YvMdpk?=
 =?us-ascii?Q?xWj1CSAVnSJyYQ57yjuXHpvb4AaGSyWi4BCuryyggYVO+onuXiCWNyX1Zeje?=
 =?us-ascii?Q?61Z9lknvJQCaTFpcP58yhRBs+8kyNQEWfEFGnVUuWwR/LyQ4Kn4BaS1BuGsv?=
 =?us-ascii?Q?MZMxImdu69/CK8i22oA2xRnm/nMtkp2G7R1Ju66/UWcf3MSKDkyV1/Zu4DIP?=
 =?us-ascii?Q?5zLwy6UXtNMAaspRPDOBripPnHMCda69Qp9yTbM7I5AlcU4cuEydDhoBft4J?=
 =?us-ascii?Q?XcgcUdDbI+JNnm8t0KO8gu0A3NzqUH1MWBf79FodNFrKvOBja4ByDuoiXUHB?=
 =?us-ascii?Q?7QnRkM7CPf4HY3fcJwyoqTWJHjRzjOVF6kChzj02iEoLl9p47IF1cgjhEUNX?=
 =?us-ascii?Q?5JaZJXF6JnPLLlZWjoy8wHdyw3M1ZNlrcpJWFZjRtQqC36WfiQRkQqgueQPs?=
 =?us-ascii?Q?sjaSrw9D1WlPAVJjPpOgKRxYYK73IV9T+KaOcTeHZUwG6ybSnZrXxzH4yzKh?=
 =?us-ascii?Q?a+cSvpzE8VbVABcvIr3ZkWu/iZ1a32mMNinpfyBXjO5PyKhskhyA6+RljYje?=
 =?us-ascii?Q?NtihfxEiMhMjg+HHFYb+7ADpe3jH04h3YJ3pg3VllRNgexoSjn7CnYVCwPXr?=
 =?us-ascii?Q?Fde8LANHUotBkny40ORmyTUVQivl/KNomkSzZRfxHfVm8PEotrQmUNB2MBQ6?=
 =?us-ascii?Q?BlbDitVwcylokK9buibeOHUstXFZZ9rZCkHAfyAmyVqQYZUgb64UGCB99oZg?=
 =?us-ascii?Q?EKj2OHAt+watY75JfYd1UE198z5qhrhTXPzYVhIbpzhbDCXXVMzSYRQ0psLp?=
 =?us-ascii?Q?UvPNvq/DZ2nEU/7tsvpPoFsVsGckyCIGvzZUoiUDNmRPrIjtTWpI86JBGvwR?=
 =?us-ascii?Q?kH0YrDIcmo7U3gJKVgJXtut2D+hstmU5EjTtrHhGF+chOVUKUmlXHSn/pQ6v?=
 =?us-ascii?Q?NYaMp8d2DD5ljJrb9W1rwWq+7R4OsVVWKa4haieVtBBA81Sc15cU1DZpSJKH?=
 =?us-ascii?Q?lVP+f3tskEXtm8FDZEQdmniUPqYWkHU7RG5YPlkf0MDlgOiNFToJnW5YTJUf?=
 =?us-ascii?Q?TG0DggoDQGbeNFKoTX6hLiUxUBXj50ybcgwNtXjUkP5/9bLzkehnoKPkO+M9?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc30f84-282f-48e1-3a03-08dba8c41e29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 19:14:07.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bF7Q83ZViS5uGv6qwoDNTQEcWdrRYUooSW5aTChnKzJjvwzqNmcq1qYReKKkEdxtchqtSyuoaWFqXlMUV8M0KVJBsx5ZeU5eLURBBIBjok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:28:44PM +0100, Matthew Auld wrote:
> We need to able to know the max pat_index range for a given platform, as
> well being able to lookup the pat_index for a given platform in upcoming
> vm_bind uapi, where userspace can directly provide the pat_index. Move
> the platform definition of the pat_table into the device info with the
> idea of encoding more information about each pat_index in a future
> patch.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_pat.c          | 39 ++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pat.h          |  3 ++-
>  drivers/gpu/drm/xe/xe_pci.c          |  6 +++++
>  4 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5037b8c180b8..06235da647bb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -238,6 +238,9 @@ struct xe_device {
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>  
> +		const u32 *pat_table;
> +		int pat_table_n_entries;

This is okay for our current platforms, but we might need to revisit the
placement in the future (potentially moving these to xe_gt instead).
Although MTL and LNL happen to use the same table for both the primary
GT and the media GT, the table is technically a per-GT concept that gets
programmed into GT registers.  On a future platform, there could
theoretically be some graphics-specific and/or media-specific fields in
each GT's PAT table encoding that make the tables diverge, even though
the high-level meaning of each PAT index remains the same.  And then the
proper PAT tables could probably be selected from the IP descriptors in
xe_pci.c (e.g., xe2_graphics and such).  But we can put that off until
we have a platform that actually needs it.

> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		const struct intel_display_device_info *display;
>  		struct intel_display_runtime_info display_runtime;
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a468655db956..f19f5d8dcd94 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -106,24 +106,17 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  	}
>  }
>  
> -void xe_pat_init(struct xe_gt *gt)
> +int xe_pat_fill_info(struct xe_device *xe)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
>  	if (xe->info.platform == XE_METEORLAKE) {
> -		/*
> -		 * SAMedia register offsets are adjusted by the write methods
> -		 * and they target registers that are not MCR, while for normal
> -		 * GT they are MCR
> -		 */
> -		if (xe_gt_is_media_type(gt))
> -			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> -		else
> -			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> +		xe->info.pat_table = mtl_pat_table;
> +		xe->info.pat_table_n_entries = ARRAY_SIZE(mtl_pat_table);
>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> -		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
> +		xe->info.pat_table = pvc_pat_table;
> +		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> -		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
> +		xe->info.pat_table = tgl_pat_table;
> +		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> @@ -135,7 +128,25 @@ void xe_pat_init(struct xe_gt *gt)
>  		 */
>  		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		return -ENODEV;
>  	}
> +
> +	return 0;
> +}
> +
> +void xe_pat_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/*
> +	 * SAMedia register offsets are adjusted by the write methods
> +	 * and they target registers that are not MCR, while for normal
> +	 * GT they are MCR.
> +	 */
> +	if (xe_gt_is_media_type(gt) || GRAPHICS_VERx100(xe) < 1255)
> +		program_pat(gt, xe->info.pat_table, xe->info.pat_table_n_entries);
> +	else
> +		program_pat_mcr(gt, xe->info.pat_table, xe->info.pat_table_n_entries);
>  }
>  
>  void xe_pte_pat_init(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 54022f591621..9ab059758ad1 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -26,8 +26,9 @@
>  #define XELPG_PAT_WB_CACHE_1_WAY       3
>  
>  struct xe_gt;
> -extern struct xe_device *xe;
> +struct xe_device;
>  
> +int xe_pat_fill_info(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  void xe_pte_pat_init(struct xe_device *xe);
>  unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 791107dec045..24f2021aae22 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_pat.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
> @@ -553,6 +554,7 @@ static int xe_info_init(struct xe_device *xe,
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
> +	int err;
>  
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
> @@ -601,6 +603,10 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
>  				  desc->has_display;
> +
> +	err = xe_pat_fill_info(xe);
> +	if (err)
> +		return err;

Nitpick:  should there be another blank line here?

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
>  	 * version 13 or higher has an additional dedicated media GT.  And
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
