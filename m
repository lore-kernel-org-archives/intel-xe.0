Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3933EC04FDF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 17:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BF10E176;
	Wed,  2 Aug 2023 17:40:17 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593ED10E0E4
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690998015; x=1722534015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u2arrxE1Ip2rqh1RklWiBQf9pMixz54lrrK7Qca9UbY=;
 b=dBorkqAA/fK6cRBkbhLuAWM2kBXtld/i6C0rDwKk76SQdAsg8kSp6BLN
 x0C5CLe/bG5lJQCOm+M/f3NxM3su826bmXVdWF/J6roC1ppD99OuCwovM
 7ZtVzGZBN5LDj7E4fuY2dNmTkd0TTX9zOjHvjhZ2fP+ex4J1RiupyV2dQ
 oVJ51bTL9ZvQdf00KFL8SG7nNgrheMVj0n4E+Vl02y+vzhfgUuL4t+JkC
 AfRJWOyXIQ/ucgnsNyMAgvT6sZHWA8rorMFhIFwDJPmVqllWzYre3jcuI
 D0PXSnI6ubEu5Rb5oifqHWRhTUbmJg8tlPFQ2k7Uxi8H5LeVFUh+Nw5k0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372388779"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="372388779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 10:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1059919403"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="1059919403"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2023 10:40:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 10:40:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 10:40:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 10:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwbKJp+ZNxX503vHPn1xwMgjTcMXXbbuE8OwxjvJkmFbT3r3XB+4MzJkpdGXnD6NE8PXp+l/KvbH6QKHozJz21iaXddTT6xP6YM5Pk7X++pQEXMboeIeT6wyLJTms7BXD0Nk5vB0LOwww3ucTsbd7zWdE2S5vt3EiS8XvEsZnOHmZB4LwOeO+TZbxqLtgWOL6r1XSOD/EtT9f0krUwxM0iUCylWqRnwC0Agw2T+j/q7gvW7woyqVlbbfzmTb8avOWmaJeVIqFM0L+0B5BgVCj5MV3A2n89YpQPhIBvMSESqGLliT1YRDrrLzupIwLOizN3CHPa04DMhwQmE+1QhvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZNYJfXxPQ6hVYl+oldozVQc+DRThVcSuPtOdZwnXEg=;
 b=Zmugqq5t8/FKCbbt6jBPEw136nFsxwIVcz80PXxa2gj206h41FzDwt2olTz1JkY00qfOLkl/W2pCuty5t6YDN4SX41GHKf+jBXxGqaHJ+ytpFLRYbL4BG4pP+Fa2oBT1XHza0xbADSaV+xm+Wa0XsShgHTCJ5PpgpzJLJGE7v2EYZvBDC1S8NGXJwAZMdagofLV5b06NYjJIqcTVcMw1KJvebeMxxUWKjEdWNSvH3bg5wFcVC1bGUDMAFpO1zewV4os8ETC/h7vt1Eg89uqfyIbOkbi5ND0/zT15+JTH7ky6dbbKSUsIvYsyNlBj4FSDK1WMxtzhlyH83hqs9h/0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Wed, 2 Aug
 2023 17:40:11 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::595c:41fc:866e:3f63]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::595c:41fc:866e:3f63%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 17:40:11 +0000
Date: Wed, 2 Aug 2023 10:40:06 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZMqU9hgfESBgJAnD@msatwood-mobl>
References: <20230727220920.2291913-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230727220920.2291913-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: 243b7d4b-d83f-4fae-9ae2-08db937f8579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjWzvlbb50WCa4oWTFdinWEiL27sfs/4AzauXBbyU00SdXiWTa1rQ1W6R9zpsetINvov//TEigUalq9siqVsuRKhx5vvhWCiUQkjuZ8AUXgeij5gKCglDo1BAqCQlQ/MtTQU/xrvOasIeYHgyQPTC2mC896DpPj1ZWiWqkmUntL0CllE0pNox0mxXkPY7RujzqTcH72Ei7MO201yhaYrx/tjX7ze66T1ieOp+Xu6SRt30y8ar18RK+L2G/ahr7Rc0RXvJBk2sIuwLmFGLF3GN3LECtPFLnhjBKqLwlCP+Hrwp1d8FkjGg2XGq8IHjA0WlzyVlUGnY3XUPoAoOVKhCj75aOi/bNEuEU2ZZneNCaTPWWVe5v9+qqIGwIfz2wEwCHVZTJLyCM6HymISm1VF/7FdsjZ75XfJQuuo6XRiEt9YSln4cPXJEQVl07WH4UuuGv7uYT+uU8qDFOGcVjQ0LUId4ntfzv+Gj0HbP5Y7BVfOS+qlixMKHVjDE7nN7K07piTVlXAJDHzhVE/4+JDh8njXICtJlh9YXS4wagiGKufYKvnk8OHAf857RJ/AAIHb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(2906002)(86362001)(8676002)(8936002)(33716001)(83380400001)(6506007)(186003)(6486002)(6666004)(9686003)(6512007)(41300700001)(5660300002)(316002)(478600001)(38100700002)(82960400001)(4326008)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmtrL1AyaVN0YUdNMnBEVllTTm9JSVc5MzdJVUs3MVoxY3poOUpBaG0zOVdB?=
 =?utf-8?B?bk1lRmczd2lScjVNZ2ExWFprY2RzcHJqNkZST204ZXo4b1JDVmt4OEFEK3I4?=
 =?utf-8?B?cEo1VHNOa1UvRndHeC9KNE9zZFFnV013VUE5TWVFelZ5REVYTXBDNm1LRldU?=
 =?utf-8?B?U3dpeUNVOW1MM0VyVDU0S2tMODA3TnppYTlqKzVMVDlQRWloMVNGUW9kcmw0?=
 =?utf-8?B?bW9uQVFHaFZ6aXFMUldRKzZ0OHk5WG0vaGVHZUl0U1R1Qk1nYmYxM3BGSzNw?=
 =?utf-8?B?c0EybGJMTUk1U3RvT3lCdnNtRDVSbGhmYjhLNUw5RlRubmNMTHplQ3ZhbXpD?=
 =?utf-8?B?cTVraWxWa0dsc1pTa1pMWnVFMkVrUXB0eElFTWkvNnZiMlRocTgwTjB3bHR4?=
 =?utf-8?B?YkJPNCttRHRLMERPWU5mZ3RybVFiSklJeVBoWDZkTVFhdlo2QjZYVi9OVW1p?=
 =?utf-8?B?NVV1SVAwUldEYzBjMUpuemwwaFZxdlE2bk1ncFZGSkJNbnN2TE5MUCtYWWNn?=
 =?utf-8?B?MXIyZ0RoMjdhRnBJNk5IeTVHVGY1bkNTYVVhMjlucHNqVmxjS3M1aCsvTzI1?=
 =?utf-8?B?Y0MzL3ZKSjVhSWgzNGJuY0ljdDFrMHNWWG1TMkVZeExpZWZBYTlNRkZ0K1By?=
 =?utf-8?B?U051ZG5BN0FBOTRjTWs5NFpOZ1l1OTE4eVFPek9FaDY2bktzTWVhSHhPdFlU?=
 =?utf-8?B?bTIyZjU0T1QxbWVzWkJudWEvdW5GUkVmMFQ5eWhOMlJqa0xIM1VRN1JDbGZu?=
 =?utf-8?B?ckZrUnlqaGU4RHhVNHlvRkhwSzJodVIyUzZuVElKMVhaTHFyY2U0V3o1UUZu?=
 =?utf-8?B?N3lSOXh5TDRoVzlsaVdZK3M5a3dTOGcvUTdndHhIWDBKeG5COXcvVEx6dXhi?=
 =?utf-8?B?QTJsSVcwVG1JbEhycDIrMW1XeXhPSjBZK1NUUm5uZjFieHBFemQ3bXA3ZUNs?=
 =?utf-8?B?OTZaQ0NTS0NkYVJIR2h0RDlxNFBvMDJFNWhRU2lseFN2TXdsSnltdmh4NUdY?=
 =?utf-8?B?dEszaC8vaU1FQTZnbzYrNWVLY1FBS2FHTFFmZ3NBYkxIQmFoanZjT1k1TzdP?=
 =?utf-8?B?aUsvcS9YaDFpaGhybE1BeVNjcEdxV010QklXSWpsNWdMK2IwTE1TZHRLbUgx?=
 =?utf-8?B?Z2lXdmdscXV3WEZ0cE4xeksyWEVJZDlzRGlOZk5qRDN2MkpCSHRSc2NxdnBz?=
 =?utf-8?B?RjlYZVBUKy9pRHVZK1JvNjBhT0FGbm5NdzZISnFzL2FiUG9ZY0VGVnkwUVEz?=
 =?utf-8?B?MWFIZk5qUTBmYzFwTVd4WGY4SnJXQkRDV3V2MmRmdlV4UEIvQnhyNVF6RTZE?=
 =?utf-8?B?NWU0YXNSd1QwdVRMaUxMMCtia0x6b21SWWVDNDluRmVQMFpTcVZmSEhGaUhX?=
 =?utf-8?B?bThncUdNUmlrbTR6d2EzaS9JUGNTQmJrQzVVVjE5eHhCaEllRHg3ODlHQlMy?=
 =?utf-8?B?Rkw5U3NvNGF0cTUxUmxhVWtqL3ZKSTNML0NyVnJ4ZnE2RUJ1TG9MTHJFei9k?=
 =?utf-8?B?U2hBSXBRWlZSTlpESzBZVWEzeUFOeDJ0NGkycmlNL0VON2lzY3BvNXlJUG92?=
 =?utf-8?B?eTR2WEZFVVlaVSsrbWlLTGVSK3VmSGZkRDJqS1ByUzZrWEFtOUd6aU8zV3RY?=
 =?utf-8?B?ZVY3U213bHVJcFpVVlB5bmdyK0FBZkNjWUg2ZkpxdUVOeFBrZTBhazlWT0dO?=
 =?utf-8?B?T1NiWmxjeTFlZzAwM0c0ck1wSlpUNVpGVXo1Tmsrd0lGUFExVHYwSGd0Nlpq?=
 =?utf-8?B?czdReURlS0NuVVMvOEdHRGU5cTBpcXJvQTdObHNlNzdDOGtyQjZNTHM2RitB?=
 =?utf-8?B?c29RQ2Fabm5HOTh2MTk3dWw3Q1ZWWWVBWEMxWWpYdE05ZW9hUjhZVmNVQmpY?=
 =?utf-8?B?VSt2aVU3dkZXV2g1NzFkSy83TTh4aFMwYjlJY0xkL2dDZit0UjRqckx6SVpo?=
 =?utf-8?B?V1Y1SGdXdUUxUHNjYTJEbGJlNTBRRTZKSElLZVNEYzJ4ZlFlSzZwNE5wbG96?=
 =?utf-8?B?Q05FeDhqVnJyWjNGWXpTU2JIZnhXN2Y5Q0grTlVkakZXRER3RkhSVm5PUGEx?=
 =?utf-8?B?QXpIcWtxWUgrb3A0aklSTjZ2UVo0am8yeG03RFVHY3BuMUN6dHlCUGVxMmlv?=
 =?utf-8?B?TDZQell5RkN1ODZpUEpZRUFtTDA5VnFZVVphdlFnVU5wcUZnQTE1am5pZmQv?=
 =?utf-8?Q?gF0q8YhN2Ql+HnmbCA4tQtE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 243b7d4b-d83f-4fae-9ae2-08db937f8579
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 17:40:11.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXgOKVTdAUoLdnkRMi67ucOtGknRF3b+NP1Bx741nT/76PechLpfHbAYf9VkkZIFNwWGi9vO/1cX4bKdh+gfl9Qq2mje0AqABiFjH7DIf9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Wa_14015150844 for DG2 and Xe_LPG
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

On Thu, Jul 27, 2023 at 03:09:21PM -0700, Matt Roper wrote:
> The workaround database tells us to set this bit, even though the bspec
> indicates the bit doesn't exist on these platforms.  Since this is a
> write-only register, we also can't read back its value to verify whether
> it's actually working or not.  For now we'll trust that the workaround
> database knows what it's talking about; if not, the hardware will just
> ignore the attempt to write to a non-existent bit and it shouldn't cause
> any problems.

Bspec: 54040
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d654f3311351..c93d8f8cd93a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -328,6 +328,7 @@
>  
>  #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> +#define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>  
>  #define RT_CTRL					XE_REG_MCR(0xe530)
>  #define   DIS_NULL_QUERY			REG_BIT(10)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 21087f7a4609..497a8c05c715 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -498,6 +498,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			      */
>  			     .read_mask = 0))
>  	},
> +	{ XE_RTP_NAME("14015150844"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
> +			     XE_RTP_NOCHECK))
> +	},
>  
>  	/* PVC */
>  
> @@ -525,6 +530,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
>  	},
> +	{ XE_RTP_NAME("14015150844"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
> +			     XE_RTP_NOCHECK))
> +	},
>  
>  	{}
>  };
> -- 
> 2.41.0
> 
