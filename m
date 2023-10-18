Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF60BCDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 13:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B049A10E3E8;
	Wed, 18 Oct 2023 13:27:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC25F10E3E8
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697635673; x=1729171673;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rt/2moguGITPQMYmaCy4fBHvZEusWejiyrC48OEUZyM=;
 b=Xqr56XNV6zbd1D5gTmH2VLXm11P7aH97BfcfMadpyUz9Vp57ee1Wxp8M
 3Jswy3BeNYpQfj8vkw8FmvXnpSzkq45Nix+xt+K5+N17Lyk+WKgI6kfez
 F04I+Jm62cZJOs1b96DYMlPo7xLEExaZoRtEnzoML5E+/cksjMv8i32fr
 +wyi3tQ86M3I6pKQVdezmOo3qqLZ6rhsSIN5UztsjySnDQfEqH5bEd+6P
 itElFVlNIKF4uNaJG4t6VHWjzRLqG/CFFcZSbyFFSWtWb5DSRllXoFgj4
 EBUY/cOkA0QUFrsW46Qdn8mEN4DPpnHtRYZzycf7sNZl1RmSNuhHdZf9t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388874120"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388874120"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 06:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791620453"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="791620453"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 06:27:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 06:27:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 06:27:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 06:27:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 06:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+rw8HeanATXxzj6uXApqMpr/DnZGwfzGcKjSO1nxUhN5cjpISZAgw/KDsEKXtN/Npsc3v2YFAK3WXCR/6YX++0Wxg1kSkLL0ZuwQYumR4HOt6GE6kdOKkhjAFDqvwtjuS4A87sMfDM82JwSreRGa0Py5+FoOeUYucpqdZQH58ERV98h1c7En1J3RXVoERCR9tO9nbvGYqvjgm1jTMOuCBojJxbweZJx95UKLXl5qhXSI6DWlhzqzI0PARYEDgl5/WgqVQX+/xwOWXRf8/boBcHPr/2ngxTUiFW5wU96UdA7II2iIETj5p6lCIAQOHkADCfEZV2wU9kP9dLZkeTLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gxteb/E+/Ci3wRXB35HD4gzbRNGfdNC02ndJ0ES1DOM=;
 b=ZqGDhx/taFv42x6Kzvzcyq32ObvrQ+tRZBK77/AKikZ9W/UAzbAQpfm7UdONgvyHUJnC0vsT6MplVdmPvdfAW/dZDmAkT+C3UMdbxtgGC4vgPgoq1UL/zWlrTAwc0sK3ZJU24HimaLS0qT4iFooRLaHiT+qY6wpqDAwonabbNAl+o2trZHGlh+gdyYRxY7QTHc6TVCUg8xZcKvFP/dtvUsRuDbYRVKqbE8LuvHHvptMTWdtKgAbVAta8UoanpFYiW3HNxRgSsLK0ZxFBHEaBKRyoxb+4PPO7w1+XoTDic5UjCqFfFHuOR3D/41NwFmZrRBtiNlik0ocs377mf0aPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 13:27:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 13:27:49 +0000
Date: Wed, 18 Oct 2023 09:27:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZS/dUoMmee1mtnin@intel.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
 <20231018115826.3908905-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018115826.3908905-3-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5716f1-2344-4b26-de39-08dbcfde05ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oxe+jsnl0NoHaxhGndDCrY7cRwI9g5LXQT5lBT8kOpAim4SJADxZUDdbUPW1SH4hZHSRcSub/TFSPKpCHDMWVJcV0UxWaQ1o5QfnpjFJ32EuwOCJcCn5CCGnjneExtE5ytKP1ORImrWM+07JflZ0rEugnEScF0pbwmoP1TsRNP1xwsvAxITgMe7mRExmibb93762AW0xbpP9qTNpsmPL0+ZC56yACXU/IdQOPyPTQh3AJDq6Y8gzzrWLD4JyIaAvkdGug2E1FMTOn5KC37GuSnuxQ2I8gI4cYtO7bt73iRV01jITQ9eUkkcb7QLnOWrX4CHGXSkfknHQZwHVnxsMQGZGqDqlpa2kpzt4m6R+MJ+/wUx+16psDf4VNues9xFW/ufK7IsgIniMeBSyCtRBb5xDUqOFtNtsfw8xWDPRUjx/ji1RLRsm/o0ZV0hl84MisVph3gXqKzI1lq1qk8Th9ziGha3oDbkrYZr18oYXOSTnqar3qL3hb+/FFDQ41L+qiXJcsMtfMbFP/3bh4KF15kkabnSKzL37rYganauxbjwCbHNg6XNCUP+G6wLXWZim
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(316002)(36756003)(6636002)(26005)(66946007)(66556008)(66476007)(37006003)(38100700002)(6512007)(6666004)(6506007)(2906002)(2616005)(41300700001)(82960400001)(83380400001)(8936002)(5660300002)(6862004)(478600001)(6486002)(8676002)(86362001)(44832011)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk9vQWF6VUlzNWJlRGI3Tlh4dmFrMHpFV2p5aTdmVm4vUnVOdmE2L00vZWRz?=
 =?utf-8?B?Y2lNdVN5dW5QZ2xKUldWdjYvNkUwMHR0clZoRlpiNDBUYVBGYjBsNGdNMDhD?=
 =?utf-8?B?OUFXOGlJbFVCZDFEb3VvWVRQM0J3QzhEbUdtNll6S1NySmtRZ2s4QVVlaWt6?=
 =?utf-8?B?ZEdkUHpDMWlMNzEzQm1MbmNuTFZLQ21PdjZsbGh6ZFpHb2NjUHJCOXlqQVJD?=
 =?utf-8?B?aGs2MTFRRGlrNVRXM3djMGlBaE5HTlkyaldQcythT0RBRlJsRkdmTkowQkJG?=
 =?utf-8?B?VzFGL1BMVnptVEtWNlR0MXpqbSs4RjY2YjY5cGlpSW1Ocy9EWkVtRFBjM1Ni?=
 =?utf-8?B?YzB2VWxvSFFNUWkzNWFyYVdvdElBK3kvVFVKMHNmbHlhYWNBSHBkb25PTGI0?=
 =?utf-8?B?Zyt2enRzNSszT0hJOGRJcDBrQ1h0MTdRWjhBbVRLZDc2dmhOcUZNZVlYejYz?=
 =?utf-8?B?Z0FZbFVUMXRSdHhoQlk1ODV6dk5LMmpZUzJpckp1ZFJFRGx4dTVQOUxoZ1JG?=
 =?utf-8?B?NEVMbTJuV0RhNzlTdThDc0dCNTdyOUNHNGcwNjF0SEhaVmVtMmhpSFJLc2xn?=
 =?utf-8?B?Y1k3WWQxNnJCZkk5Q0VaR3ZMNkgyNis1T3dTd0xxaFVkWEFMYmlzbitiN2xT?=
 =?utf-8?B?WFMxL2E5OW9aM0V0Q1hZMzE5Y3V4WW9xNE1mN1BLWUhJKzFnTFJKNGd5R2dv?=
 =?utf-8?B?MkYvSGYwN01YdC8zOTBnckFTZnI0Kzd3eGRvK0J3KytWemRzSldIVGRkdnRX?=
 =?utf-8?B?NXdacHl0QlFSbUlYTkpLb2lHNXh2TW0wcDVMbzdyMVdDL3UzY3dEL3ZKR2Rh?=
 =?utf-8?B?cGlXVUY1aHVGdXBhRzMvV0s0dCtqWjQ5THROcVB3TkV3WFVDcytLdmlwWDVn?=
 =?utf-8?B?SlRYR0hJNkY3aEpOeVQvN1FlMkpITEtjRzgybHUwWHVhZUh0ZmFKSVYyR055?=
 =?utf-8?B?cUx3OXJZOCswNXZoTmx4VjVDNCtSTEUyRVl6YjFDVFlhYjlqSVRuc09KL1Jx?=
 =?utf-8?B?T1d5azhiMGMyS0wyWXo3UVVMOXdYNTJZcWFDSnhVbXZuVU1hZCtMVWdRNWtW?=
 =?utf-8?B?YUF5bms3bTc0LzZRMm5zdmhpVGZlOW13MUJtTklIdUt3L21aUFl0eTFaR2ZI?=
 =?utf-8?B?RHNlcmx2R0JoWDQ0aEZZSEMrcCtYbnFZR3EvWHRTWUhja1BHMVkveWgwb1ZC?=
 =?utf-8?B?TVM2RlNBcStNdkFlQ2Ircy9vTjdydkFNRXBuTmlyQXNFajlMYjdGTkJvUVJQ?=
 =?utf-8?B?Rkk2WU0vSWQ2VVBZNzIxSXhFYTd2ZjFJQXdDcm4vT2JXNlRHUkl4dWNBV1Z4?=
 =?utf-8?B?VndOOGcrRk05a0VHQmVtaTRyRmxFKzZCazl3dXJaYkYzVkVRZENLUFlDci9Q?=
 =?utf-8?B?V1AyUlpYTTROSGlscnRNRi9FQm1zU3NEY2ZUZElEcVRDYlliazB3b09kNEw5?=
 =?utf-8?B?NkFjQmRtNzEydk9QRGdoMUtFNzlaOU1KUHhHclh1c3M1SzNWdi9FQVhKbnBD?=
 =?utf-8?B?QzdiS0Q2QmVESHhWS1U0UXQrejdZaHEzbUtxc09Uc3M1VWRURklGYVJKNDBQ?=
 =?utf-8?B?Si9SNVZGL1Z3L0tHN0hiWnJZYWZjTlhmb1o3VlVxcXlDdUUra2FGZ3UvN0FU?=
 =?utf-8?B?VDhuWDRBbU51NHZIaHI1cjRhckpqeWVwTmFWcVliMFRqZHJBbS90QUZ4dy9u?=
 =?utf-8?B?dWhVcEtxSXVDOWFZNE1Ec3ZydVlMUnBWRmpnTEU4UXNLdTlLdjJqNUxnR2Zs?=
 =?utf-8?B?OVdZODkwTGhCb2F4UVFPYmVRVlEwZTV3azFXV3VXQTZWVnRnbFlwUEI4RVh6?=
 =?utf-8?B?SmE5NDFLa1AzcExSNjBDWXJydE1RYmd5TlRPK2NBNnl3WS9tSUZKSjZTRnVQ?=
 =?utf-8?B?Qjd5Mml3ekFUT0tHSWU4MGJLcDllQ1FwUTltcTNLQ3g1dklKQ3BRT0gydWJt?=
 =?utf-8?B?TDJVdmZhdGVtWkUyVTRybkJtdEhXeCtzdDdRK1lpcnJwNFlWb1ozVWFtdUFC?=
 =?utf-8?B?RXEvaVhXNURBNHZjdktwQjVOUWN6ckJ5VTcwaU1ZcGM3WXloRWpwV3NNQThm?=
 =?utf-8?B?aXJ3WnFVNWtqNEVMTzVJTFFOMW5PaU14SFhWZzRnV2JqZDczb3pWaTJ4Nzkw?=
 =?utf-8?Q?iiFD3+Str0vjz8EJ0SEz8wMgT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5716f1-2344-4b26-de39-08dbcfde05ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:27:49.5993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHfAmaJA73bDhe86Wlc0lkB0UmpnpbCkguCim+Opf0mmIk51bKan2BuvC8CRxnKC0Z3K6Cv7P73WnyvsX2IAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/i915: Fix uninitialized variable
 warning
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

On Wed, Oct 18, 2023 at 01:58:25PM +0200, Michał Winiarski wrote:
> When used with Xe, "val" uses as function argument name clashes with
> "val" used inside iosys_map_* macro causing the build to fail with:
> 
> drivers/gpu/drm/i915/display/intel_dsb.c:87:46: error: variable 'val' is uninitialized when used within its own initialization [-Werror,-Wuninitialized]
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 796b1b36dc598..8d89c8f700d68 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -79,12 +79,12 @@ static u32 dsb_ggtt_offset(struct intel_dsb *dsb)
>  #endif
>  }
>  
> -static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 val)
> +static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 value)
>  {
>  #ifdef I915
> -	dsb->cmd_buf[idx] = val;
> +	dsb->cmd_buf[idx] = value;
>  #else
> -	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, val);
> +	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, value);
>  #endif
>  }
>  
> @@ -97,12 +97,12 @@ static u32 dsb_read(struct intel_dsb *dsb, u32 idx)
>  #endif
>  }
>  
> -static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 val, u32 sz)
> +static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 value, u32 sz)
>  {
>  #ifdef I915
> -	memset(&dsb->cmd_buf[idx], val, sz);
> +	memset(&dsb->cmd_buf[idx], value, sz);
>  #else
> -	iosys_map_memset(&dsb->obj->vmap, idx * 4, val, sz);
> +	iosys_map_memset(&dsb->obj->vmap, idx * 4, value, sz);
>  #endif
>  }
>  
> -- 
> 2.42.0
> 
