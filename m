Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68B5C7618D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 14:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830B888697;
	Mon, 20 Mar 2023 14:16:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318588697
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679321770; x=1710857770;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gm9BKuX2Ikrbylv2bBRohDwPOfHAzW8cnmfPqtsQGW8=;
 b=Q8xeiHnDz74pNjtMPr/3FmxukNPrFegkwLKbFocttph2PaL36VUxwygw
 /e+Z8APFVxn69Eo/ZpOkvgoIoo0LQ50nT4HK7vWLdZ6g9fSrFJUMwhPzf
 OB3Un8xFSpa+YJ20MtlIxmwE+/ogF37p0aLaXSyk6U93l9bLDEhRjjPJ5
 7UUjz4PwV0sQ5BCqtEbV6re116r82IuD1TCSK57dnCGBVp+SFeKCfzppt
 h9Rv5+60Xpadok72QVtTUu78rupRi6BQo1XxyEg8bUVJ8iIiaeCahtrH3
 RjJIKAY7U/JXbuPRCjsH9lLo0W6F6O91hfkLQEIJFuQL6kKaI90e7PyDc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403543801"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="403543801"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010495166"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="1010495166"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 07:16:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:16:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 07:16:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 07:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6M7pZUziPDnTVWZiwkomqfrJy8xBM2vG0xWMPvWaC6r/JDYwUQ56RHl7DK7RdFJG7yidC9llkmAzCRO5k0VQrueD46Lo2DisDRr0Rhu54TGwE0fBLiwAxdCOH2gsW8TdQ+dlk09m1f6Df8T1LlZITEqXgA72TiuIAg0B3NH/NfQlHX8E7C6FVfeE4ZgnvSSCXqWxtNAxr6M6GkDKLt0eoAO8nChEls/CRJ4pXM6GF3kAeHWR/m917+JQ5cyTSvfpXGULLez08cdDXw+E8oMQ9KQggyjJ+beDo0jLg8UaxhHcuT9aya2/wNDg63eHPmo6GLxVjnyWqOZxurGXps3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vrljjSG5cgUudBT4i93KpLmac9HqMR8dA3LCscx/uA=;
 b=DeTEvRTgETPtdUXfO2XsrqZGqR4ojXogDbIlTmpAfHrUTZbUuGAc4BZs8lhdLOO2w6PGhc2IK8YmBHh3eLV6s92C6WJZQW4ZLGGuc7jszqOTmXxbUQm6Sa0LsvS3F6COvGpfz8QnKEihx1z1UoCHXW8wu1LQZS6unLQVE0R3prS4b576YsZVko7RsUakVK3kg5kbYJ3rolmjzvXXVVGsyIR+0nEYMeqMm3ktn5YDaIauLbLx1Qs/0ZO8bmrtcakogit/+CGISUmOCMgUXV0StRDJ+86PDehRAcCARKHbz3GuRnf+0N+1L7KMXbD9kwFca6zIZoJaNdMHTnhY1Z2U5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by BN9PR11MB5353.namprd11.prod.outlook.com (2603:10b6:408:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:16:05 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 14:16:01 +0000
Message-ID: <0be67651-66f7-9e83-0c90-5c4e2a6bf363@intel.com>
Date: Mon, 20 Mar 2023 16:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-7-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230308101745.217120-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB7PR03CA0108.eurprd03.prod.outlook.com
 (2603:10a6:10:72::49) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|BN9PR11MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a40bc9d-1319-4015-1c93-08db294da1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MhImeOrGytb0gwEdBspmhs7GRrDEeLSE7Y6pR5FF5qUbmjrHcpzwuy81moy4ey9fSLJrygdlozWP9btRU3iJ67ipM6ISTwW2KHITJqbA4ENeQSeDwe/mL+XnwR7pP91bKdRaQdVd/v0+BzXOfjYVQ04oXef7IpDjI4oVWZhzpWripQkKSXh4UAMMTr5mWwEEKhFxjaCYZEzJrz++iRmwVjpf9pEL9bo92T9dCIV7GxbqU8AHYnnhjP93cKKeD0zfiI8UcF+0lhsl7tTjz6TotElUPuwxwX3tJ3UoalhITWpVTnVnlQDndHP9VFdYz3mGBfa0AZvfq2KoM+uVYsYiGkImt5rfs62A1XquS0ewj1TOxAUjVzvFlH293xIbhR9K88JtxM84qTc7r7W8EcNxZcXJCge23HAFjJd18oKB03OwSYf7FZHmvsSeSMXQ7Sl66REhTNfOuMIwFemKmBtC0Y1n/cme7RH9rZ/0iBI2XQEcz+DfUxw0yfIAb43GGnAMO15WDmRafSCPe4inqr49117PJTqn3zwwCiHaeOioXq9V7p1ZNpzasZnSrc2J9veRJ24/UrzsnaeaTxcTcGA8FrVCR79BSoon+hxd+CFN4dVXqR3vHPj2z1CDxu5ZbmuNW8OYYqlwMqSczvSAHVSM4+EX4atl2skmEE2J8clrf1FighnyE7aftjqNZcGZMKyr13Jx/5O+B4QvZzRMdmCN9QRtq51wsZCkjQMgL/fI38A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199018)(2616005)(83380400001)(86362001)(38100700002)(31696002)(2906002)(82960400001)(8676002)(4326008)(66556008)(66476007)(36756003)(66946007)(8936002)(41300700001)(5660300002)(186003)(53546011)(107886003)(26005)(6512007)(478600001)(6486002)(6506007)(316002)(6666004)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFtS0NRSHVBNFdpYXFJdVZWTTNPZWFWUm5UenpzODVWeFZJejlVMGhwVDl5?=
 =?utf-8?B?T0t6UmxRUTZJdDk4NWlwcXFWSWsxQXg3ZVdhdytsSElnVVh2TEVZWkRxd25n?=
 =?utf-8?B?STJMZUxEQk4rZUd0RFhyNm1XTHppNWN5TE9WenJuZlNiYnFqZlppaWNMaWRx?=
 =?utf-8?B?dGpiS2xZeDAyWExId252d0ljOEhYY0lpMW9vUkNDbWdsdzRFNGQ2TTBkdXVW?=
 =?utf-8?B?SXF0NmcyL0w0RGpob21NRFVreGNMWTcwT2RtelpoMDJVUjRHNlZFR0xOMWVH?=
 =?utf-8?B?SXk1eHBSemc5Z0lxUU5xQjErdURld1pDU0hxTjZOMHlMV2ZtNHcxRzZoa216?=
 =?utf-8?B?QndUYjNPQVRxUS9GNFhYYlFJTjk2cU1YNGI4UmlLMUhXSlpNbGRsOUtTZnFw?=
 =?utf-8?B?ekgrbGUvZnZ5UXlPdkpPVlNDbkQ4Zm5Gamo1VGlPUHVSZnJ5QTk2MHFSeWkx?=
 =?utf-8?B?UGRZcFlGcEN1UzlVRGJsdW95YlRFeGIvSVpsUXVRbkVZRGt2UkozU3lNaFJ0?=
 =?utf-8?B?TlQwSFhQMHNCSEo3aFpyUnBWWXZoSlQvT1JOL3hWQVNZNkpnSWUrcUFBU2Z1?=
 =?utf-8?B?eU9HZnA5eDVUeFI2d1RqM1pYQ3pRQjRxSGhabUhlQXBPUU5WcEwxZmVqcnRq?=
 =?utf-8?B?eDJJV3BSSlUzRGZKNU5IMFdvdkJzQ0xvaWVVdk85NUtvL3VYSGoxZU1jbHgv?=
 =?utf-8?B?UGZWZnFPaDZ0WHQvbVpFVkF5ZjJRUVY0aWpTQU0waC9adndiTWUvMTBuNmNy?=
 =?utf-8?B?QVdIVE5WSlA1YWlGRllMRysvaG02dlFOUFZFZzlIM0pvekQvOCt1ZXBaLzZ1?=
 =?utf-8?B?M285TU5PVGlEcE9MNEhKemNGcXhyOHp1VFQydlJJRlhpUUVkSHI3ai9zV3lE?=
 =?utf-8?B?U3U4b2lGaUlvNXJUdXk0YzNmdlBBT1ZkOGxldnpEdnY4VDhOeWo1WTZ3aEFw?=
 =?utf-8?B?U1hVcGM5UVI3MGZtUHhEQzVkZ2RtUlhLVzlhMW9iU3pHNERTdzlSTHhqT0xK?=
 =?utf-8?B?STZNR1gyWW85bjBvWklLM3M2Sm9UWDZHMGR6S0F3WUJId05DRnZsd1BRVkRP?=
 =?utf-8?B?YXBXTmpkQWhnelhwZ05WNWhTWnNabDFQMktYUDU5UGhzcDczVStzMmlmYWdp?=
 =?utf-8?B?RjhyVGluQ2ttaU43V2dLYk54NlpFY1hJdG5PeDZ4L005UXlneUduVnZhR3pT?=
 =?utf-8?B?VEN5WjBvc1c1THVIOGJ4SHpvL1dzUnJjRzZlOWRGMm9Gb29HWitxMnFsZHNx?=
 =?utf-8?B?eXlUVG9WRGtzMzAzaDl6aGxKdDMxM0ZlQTN3cGF6RHg5QlRnUXBlMUVoWVpQ?=
 =?utf-8?B?VGwvZXlYZHBvTnJYVkxZZ2dxNjFCcE00ZTZQbzBNNmtWNWQ5VENRSEM1NGRz?=
 =?utf-8?B?K1ljNDhKTVRxWUdycGhKZDhrL0xMNldhZFVRMDZHM1pRTExUeG15RFFMcmlB?=
 =?utf-8?B?NHFmSmF0MzZmazgvTkZmdVZ6N29aUWZVaWNZcGdYYkpEU2FRVnhQTVd1NjUz?=
 =?utf-8?B?KzJPdElYSytKZVR0c05vNCs4MDFoODFpOWE3ck51MllacWVkR3J4dnFBS0tV?=
 =?utf-8?B?QStrQytTNTVjY0VacGNjWDZDdEdTeEVzYWtTMzdjYnlKOUcxMVVHamFXS2xG?=
 =?utf-8?B?SU1IVDJMLzdmY3d4bm5NOWdlUUM3VGIzdzFhYWFJa2ZLaWl6ZnkvTVlrb1lN?=
 =?utf-8?B?L2k4SDc1MmJwQlhET2FsdEwvMlBJdUpSK01WcXVwSGV1dU9rSjJRZkNlODEw?=
 =?utf-8?B?K3FuZno2WVdPUGlpYzRBcGpRcW14ZE1WM0E4QlRTdEVEa0Y1M3A3bTArdFBO?=
 =?utf-8?B?US9VeVAwaVRRQkVXNlJrTUZGbjJrMENEY1JQVHhHLzBJVmgzZHJNWGJkVDBl?=
 =?utf-8?B?THNuV0NYUWVWUmV2VGJNSUlqZ0dvdm05OGtjNUc0N0V4V2RFQWRsRHhJOHp5?=
 =?utf-8?B?NzhlY2FWc2tEckxEQmNybjdMWWZ4ZFBDaUppS2xXWGF0czBKbDkwK2pxV2Rn?=
 =?utf-8?B?OStWYndQQWljT1lhMWh6MUlDUDk3NzRuR1RmYW8zWmUwaXFwdlNtWnN3NHVZ?=
 =?utf-8?B?ajJaSERWbzZpdlhnT0x4TFQ2N2NuQmYxclJaN1V5SDNZSkRSVDNjK05KS0Ni?=
 =?utf-8?B?M2FvTFBQRWFHTm5nRStITWdva25FT2xxK2hxWHZmdHRqTm04ajVoc2ZITU5Q?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a40bc9d-1319-4015-1c93-08db294da1a6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:16:00.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+rK20coSusMs4frJXonNk3+TVbOeXSjrEwVywpehh6/YBtwiR8ktMWDuy3bHrg5f0btIo0rCkpXfehQ1wOh+dIXb0luaWqq0lZAtjQ8upE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5353
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe/buddy: add compatible and
 intersects hooks
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/8/23 12:17 PM, Matthew Auld wrote:
> Copy this from i915. We need .compatible for lmem -> lmem transfers, so
> they don't just get nooped by ttm, if need to move something from
> mappable to non-mappble or vice versa. The .intersects is needed for
> eviction, to determine if a victim resource is worth eviction. e.g if we
> need mappable space there is no point in evicting a resource that has
> zero mappable pages.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 62 ++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index f703e962f499..8dd33ac65499 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -230,9 +230,71 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
>   	drm_printf(printer, "man size:%llu\n", man->size);
>   }
>   
> +static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
> +				       struct ttm_resource *res,
> +				       const struct ttm_place *place,
> +				       size_t size)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +	struct xe_ttm_vram_mgr_resource *vres =
> +		to_xe_ttm_vram_mgr_resource(res);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +Hi Matt,
I understand that ttm_resource_intersects() returns true in the 
following case,

if (!place || !man->func->intersects)
		return true;

so this line can handle it like this, but in a real scenario, is it 
possible to have a situation where place->fpfn==0 and place->lpfn==0?

Except for the routine that does the same check in 
xe_ttm_vram_mgr_compatible(), the rest of it looks good.

br,
G.G.
> +	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
> +		return vres->used_visible_size > 0;
> +
> +	list_for_each_entry(block, &vres->blocks, link) {
> +		unsigned long fpfn =
> +			drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		unsigned long lpfn = fpfn +
> +			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> +
> +		if (place->fpfn < lpfn && place->lpfn > fpfn)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
> +				       struct ttm_resource *res,
> +				       const struct ttm_place *place,
> +				       size_t size)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +	struct xe_ttm_vram_mgr_resource *vres =
> +		to_xe_ttm_vram_mgr_resource(res);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
> +		return vres->used_visible_size == size;
> +
> +	list_for_each_entry(block, &vres->blocks, link) {
> +		unsigned long fpfn =
> +			drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		unsigned long lpfn = fpfn +
> +			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> +
> +		if (fpfn < place->fpfn || lpfn > place->lpfn)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>   	.alloc	= xe_ttm_vram_mgr_new,
>   	.free	= xe_ttm_vram_mgr_del,
> +	.intersects = xe_ttm_vram_mgr_intersects,
> +	.compatible = xe_ttm_vram_mgr_compatible,
>   	.debug	= xe_ttm_vram_mgr_debug
>   };
>   
