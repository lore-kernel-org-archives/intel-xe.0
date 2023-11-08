Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC699C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E44E10E800;
	Wed,  8 Nov 2023 17:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAE910E800
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699464389; x=1731000389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FzSm2iataDrqXEuPaZO4Xr8wAVDMG9bLjgwdwBehUDg=;
 b=RPpgvn3cL8yqdRIguOIylmesVuhCj25x5n800kz1A+wfe28uCdNz7ewy
 oVZD9ehjA8kWzaDpYrw359B6H+ed59dQXN/G+tFS4nHfqOZez8gzAMZi9
 z8liLtkG4nK8Ua/6ACf2BmlspxCn7j4F1+a8ozunIsNLs9K9nW6iIcJLt
 qM2tkLujAYjbCanmVEZrNSFjvp+7Wjf1zQq2WZBQL89Gc/a2IJyUSO7cl
 IKYW9Di2/WjsUiVBSmVeF26E2NuUy9ra/hi64v3aRVbJCEHFbJ0GLP3x2
 FiUM7a6GYJ2mnu917/BIg3wg0kkY7iTY6GqOn+KCOWGX9bmLERKjZJEMO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="476044070"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="476044070"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936582741"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="936582741"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:26:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:26:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:26:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:26:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cl1qMz9c4pcb6LqdmB/jbBX8HTE3tXDT8K6YKfwgvprL4Dt0yf5ILm9UzbJKGJVX2fT7iA1Sjsf51E/dNJhGml4gg/MjpXnUeRMK+AP0D8LlX/1YqBh2BrSALUWzhnJTMml2LKQakFT4Nf6IszFocb/x8V9vaB/Bjcnanq904O3jHNavSrn9cggT9Preujzri1blfFxTE0+XkQSalu5b0dTM5+W3fUmh/Tie7L1zle22AG+cZ8t6R+yPR/rI687wMN6Qcl4kLSsEPLnBzOGxZVXEevYyc5T1L0RdK3yqLW5ARboacgHQz7Ctz0drYN73H/uUdaD1jumMPzHEUlfvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUTb08JZniv189Z+K9mHuBUpImLJe3muVVLweDWHc5k=;
 b=Y4IiZO+XO72XKepBXWvQXOrEzVJfixi4kaewiihhk/RgdLhL7g19+T2wVqTBbhJli8Cs1EB0akAUdK9YBanGc5aENmWar9vdM3lkog3ayeHghMFznkbBN0ZN9adjSs/bcBGJt9JUJ5xGytE1fkSg6as89m6DzEfGUcRl0iSLlyfK3kArQwGzmz9dp2e0mA+ppbeYze0a7Qw1pwv6vj0mcqZtVEcd4zxhMriZ/ghtbX+S8pcMGd8uajGiLF0r45L9wsTWQpt8xSeWxHRscyVKWYI0h1AuFDu/wfIIjXBbC++Y5S8+CghDALUaP9zdTZn7jH9PTWcPTu/8QwdDxXkohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 17:26:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:26:16 +0000
Date: Wed, 8 Nov 2023 10:25:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUtiGBPk8N+ann2E@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-10-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6549d8-88c6-46a0-90c6-08dbe07fd046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbafojRe5lLJ3y69vKoScLRn1y5tHBSrnqXE7atC3EDzj2fXiK5XU5eKqHC8bXlA22ShJhvwcGteztcT+VFR2Kh6agDUyW0NyNCV/y1pJcV7CK2h46/k4qmy1fiYJcdwbtci6XmKNuBsbVmav5+mFLjsfx99kUvga5V4W3YtoNtCJ2mkMOAO9b0U6y2Y6nc7UbuN+o2lxQ7hgpt8emZly8AZyF7mYTxVrbA1uZnfXBTPiqRpSlKo8lx29F6+hF802PyV75CfUtsFX4Jb7evJXAUrkypYFZHA+WBk+bbBZRNqFYhQ5B8mUZ477CtjLYnw0a8WAwXkC/j4mKMXYsR0PPqKN5vdaR1NMDF5aF1IKklySM+EsyuX9HABuVusK7QGriO+n0NLPgGG43h8+885kRLgxli+skHhce4aJVwHCUC8AXcgG7wfV4srFrW6+TimA2mLPj8cmQjVsc8wRaUEcn9Xy5uToyNKAbne9vGInxf2CGksN5T9KDRJmPXyJBXgJSG5UgbX3U+6aMk/0v7V2G98DjcuNdZgm42pS1NQ0IQXFRrO2vrsViNz3mD5fY1l5EgqtcKwXHZcAqNcgJPZZ9swyOv2pHKpJxK5X7/FZQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(6512007)(82960400001)(26005)(6666004)(6506007)(8936002)(66476007)(478600001)(66946007)(66556008)(6636002)(316002)(4326008)(38100700002)(8676002)(6862004)(5660300002)(2906002)(41300700001)(44832011)(6486002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFJRHhNWlFVU25PQ3NxZDJwdWVOYjhQS05xditDbHdiM3FnN01yc296UGl4?=
 =?utf-8?B?dlloZDB6RWxLOFN1c0pEN0VoTmh5d014ZkRNS2twR1VZYnBTQlRrTW1ldmhv?=
 =?utf-8?B?MmlmNUZqMDRaWUZuMjJncTE0ZGxWdk1pTGZWczdzR0ovSndPYlg5WTlqdmJt?=
 =?utf-8?B?MkZORmJzZkdHckFycGdGaFBESFI0TzRaUmFpNENLRkl5aUFHTjRRanpKYnI2?=
 =?utf-8?B?YWhxT2FHQTNQUWF0MzBmRktVcWlXL3RVSVdLU3ROSUR1OGp3Si9QYkxlcFpF?=
 =?utf-8?B?TjBFTzRFWHNhaUZIdjI5YjQxcDUrY0psVGJqd0pwTnVlSHc4aWR2VnpRUWcy?=
 =?utf-8?B?anNwTm9PRUdtcFlJdGVhcGFia09aWFpMQ2lyV2ZXWGxmeCt0bktkUThCOEY3?=
 =?utf-8?B?TFhFdnJIdi9LZ0JxaUtoQ1ZpS1RHUkM1UElnZlRpM3RkczNmUXp2Z1kvUHZ4?=
 =?utf-8?B?cFJBVkV0anJSU3Awd3o0SlpoU0U3Q3B0WFFxbXlhREZUbEh4Y01pS284WjBB?=
 =?utf-8?B?VUVmV2hvVlUyU1lzYmNpU3o5NGQyYXNJUmNBZEdxOVplNDFHWXZNSFplSkh4?=
 =?utf-8?B?ZGdKcHFqQkZNbmlCSE53YzczNFcraXBTaG4zWGx6VG0zQU02QzdnSm1hZHhr?=
 =?utf-8?B?dTk1Q3pzWFlOUElTSm9KUTRaNlVHODVtNFFobWVoQ2pEaFZwT2Z4QWdRWjd4?=
 =?utf-8?B?V3VsSGxSQWswbDV1Z3hiSDVoZ1FzblVtRElnb0YzRVVlMStGRlEyenRyaHpB?=
 =?utf-8?B?K2hMMFR5OHZ5ZUluL1BjQkdsVjQyWitUWFdrdmtDR1NiMmt4ejFLMnBJWUpY?=
 =?utf-8?B?OGJDQlJEbGFKRTF2aTFLblpKdDNnS0xuYXp0YkVWU2gyRmJjRnhYSkdKRnN4?=
 =?utf-8?B?VTIzWVFRTFIwaWFuZ3dVZTE1VENtNWNreUZFQkpZZnJleHUrRUZ6bmhxeTdP?=
 =?utf-8?B?WENlRlM4c3lyRUhPT2cvMTJsTTdRQ05aV0EzRFd1eTRvZWptZGpzejRrcjNu?=
 =?utf-8?B?cnUvREVwa0dFMDVMZkV6SDJVbytVLzF5L3ZaTVI2ZjlBNWo0d3lCMWw5ZGkr?=
 =?utf-8?B?Z2NxZFV2ODZtMVdTREViWjhFa3NRYjA5c09CWUdTNVFGYWkzUEV3RTBBNWFv?=
 =?utf-8?B?UFJ3bUExQmJJU2FLMWplQ1ZrN3pvalMyY0xnc0RYRWxTZjZSb3pET3JBUDQw?=
 =?utf-8?B?VlJtQTlkZW1FVDRFZ1dNY3N6VnRUbHlFT3JZZks1MGx0bkFHa05TSi8yVDdX?=
 =?utf-8?B?TTUzNkczYlJocnRyT2ZyQnAyUVRrZkFkY0FpaldxdFcwQ2d3U2xjSk5HRTZX?=
 =?utf-8?B?V0dEMmJBQkR4dGloZWRKeTJrWmRlUS8rb25HZW9oSGFxMzhTZjNaY2FuS013?=
 =?utf-8?B?alBQaHFaeHlTakhabW9uMG5ZZkdYUUgzdTFscmQyV09uSmMwMHpwS2hRRHVh?=
 =?utf-8?B?ZXFjd01lVmtBUFBpNXlWa3FCaEVPWXlYN2ozQ2QvRmtlSVIyRWpMUnRGNUFz?=
 =?utf-8?B?bUJiK1FOTDE0QkRpaUhnRlhiei9ON1RiOEJ2R0lJQ2F6ZHovaGdoTy9SNExF?=
 =?utf-8?B?MVVvbUlEV1RNYUszaFY2WWJsS29wWjVwRGxJVE9DekN5ejY2M0JFME1CYjMr?=
 =?utf-8?B?bFpMTDhyWkVhSjRPSkltZGRoUXpBOGVMK2hScURZdnJkbU9menEvWHU1MG50?=
 =?utf-8?B?NjU1SHFOYk5qVXVpV3BlVEYzRGk0b2xkVEFBQndJaDFlRjJ1LzU0R1h5OEYz?=
 =?utf-8?B?bm5FcmFpeXV4U3JkTVFxK1pBZlpZMGU5YVgybUVRUDZBNjJQb0x1MmdSd2pG?=
 =?utf-8?B?dm53WHZQUHlVT1lhWUhJUkluSXUxNlM4VjhOTjc3WWYzOGMvaWQ1NWJoMWk0?=
 =?utf-8?B?TmU3dnZNOFhzY1E1SGMrNmlrcUF3WmV0MWJCK1N5QVduTVd1c2RhUXdURVBE?=
 =?utf-8?B?MjZpWG1WbjBCM1lyVXdmWkY0LzNTNlNTVUZzS1JwZStqc0pvTFVaaURUNDl5?=
 =?utf-8?B?RFBWNjFaQzZrWHpNMXQzdHdWT0dZVW1idDJSb1JKQlg3bjdBOXNac2htcTJk?=
 =?utf-8?B?YmEvUzltbUFIdTJmVzJrcFh3TzhpTlAyVkNsRi9kdkp5ZzFoOHBvL0NRMFJD?=
 =?utf-8?B?bjFPT2plQjRJV0V4UTIzWnBQUE4xNU0zMGt4K0pLYllEb3dSNFFpWlFJUE0y?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6549d8-88c6-46a0-90c6-08dbe07fd046
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:26:16.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Llj6Kfwhh8WSnK3EgIyYOVkJVcHyTnSuBe13CJq/KxqUvYNTzRghlaLA82X336gimL25LYjfzYUfPj9lwCWyxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5475
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/12] drm/xe: Introduce xe_tile_init_early
 and use at earlier point in probe
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

On Wed, Nov 08, 2023 at 01:33:41AM +0100, Michał Winiarski wrote:
> It also merges the GT (which is part of tile) initalization happening
> at xe_info_init with allocating other per-tile data structures into a
> common helper function.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c |  6 ------
>  drivers/gpu/drm/xe/xe_pci.c    | 10 +++++-----
>  drivers/gpu/drm/xe/xe_tile.c   | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h   |  1 +
>  4 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 53be4f0424c21..696f997bd2c93 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -382,12 +382,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	for_each_tile(tile, xe, id) {
> -		err = xe_tile_alloc(tile);
> -		if (err)
> -			return err;
> -	}
> -
>  	err = xe_mmio_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2aa74eab08232..87c45c6e08aec 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -25,6 +25,7 @@
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
> +#include "xe_tile.h"
>  
>  enum toggle_d3cold {
>  	D3COLD_DISABLE,
> @@ -611,12 +612,11 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>  
>  	for_each_tile(tile, xe, id) {
> -		tile->xe = xe;
> -		tile->id = id;
> +		int err;
>  
> -		tile->primary_gt = xe_gt_alloc(tile);
> -		if (IS_ERR(tile->primary_gt))
> -			return PTR_ERR(tile->primary_gt);
> +		err = xe_tile_init_early(tile, xe, id);
> +		if (err)
> +			return err;
>  
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f652..ea0cc84a0ab79 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_ggtt.h"
> +#include "xe_gt.h"
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_tile.h"
> @@ -71,6 +72,24 @@
>   *  - MOCS and PAT programming
>   */
>  
> +int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> +{
> +	int err;
> +
> +	tile->xe = xe;
> +	tile->id = id;
> +
> +	err = xe_tile_alloc(tile);
> +	if (err)
> +		return err;
> +
> +	tile->primary_gt = xe_gt_alloc(tile);
> +	if (IS_ERR(tile->primary_gt))
> +		return PTR_ERR(tile->primary_gt);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_tile_alloc - Perform per-tile memory allocation
>   * @tile: Tile to perform allocations for
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 782c47f8bd450..f35d943eed54c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -10,6 +10,7 @@
>  
>  struct xe_tile;
>  
> +int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
>  int xe_tile_alloc(struct xe_tile *tile);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  
> -- 
> 2.42.0
> 
