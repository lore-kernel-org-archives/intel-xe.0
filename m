Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097C5C48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 21:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B76010E637;
	Mon, 26 Feb 2024 21:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kra+Tt2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF18310E7D2
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708983801; x=1740519801;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MxGwLUqZfa0wmd4npy+0Bhq3nwPYt/9BukZCCLFkAYk=;
 b=kra+Tt2NVPm1I6sG6DE/+pa2BoPFuQzAzVTK/ynhvOAbcOPTIqLwwvmX
 hdQQU6g6D9+8mgCGAzBos7uUwe/5Gaov6+dIb207LgBaWqiVVcMH2UGnd
 wRWeeKcSAgnlUAt7lGfREiiv21d4d1pFsSrJBGdE85CqaPA7PODrYNyY4
 KLIM9rqKTJWo2CxMNqmFclTDBAP1OkAKPK1UoJ5LpKeGTNqB+mR4Yz7R6
 SOj4c+8aBHaEAJwWPNdVpFjnlSfihUDhgD79SejLpg7kGDYUvF9Do6Fsr
 EYGIe0QbNZ1E8NhtpkboldjN9BK+cclhKncKfxYgX9Kq5vY0/5nae4Ds1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3415143"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3415143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 13:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="7025672"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 13:43:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 13:43:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 13:43:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 13:43:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 13:43:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ne56HueuER8fGuQ48ak+SUmRvUrGHeZqck5m+BiodsatDpksJxNvOMMUNqTP2BjiVFeSZ8rbjw+D3zbs60ZvZ+cXBdhqZuMAYTxrz9cWcezd5R0FmNb2cmr6JfyTxhX2GkwVzcQ5AKjgkHum450875cuRiDjjnQSHmJUvotKkNVsGEzoHz0A+hEGGbu6vh0Zdo7dBg84OabQapQ/qF9Ks0heLVORt11FLUtT9JCtUF01GpZkOgFORaCwmpmSwSrhZ6VDu30owzQLf1yXIFvNW0G5J/jqhF0ijh9sewSr00v89OdL/SkKA1iY/4Q3PjEHuSrK9vg58HjwzpkvRvHtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NThn0lIFdrHOAUGzdpoA3VL8zQvOCd8JFFkujvELCaw=;
 b=FPdgftS5vplYipYt/Qo/lb+jubtwVWnMGuUVPHgv9bmyQ1wJ2WYsVfYI0OtCNkQAqhgkH5hPc/WzRxIlpn/e7sqFYaFAAdzdmc9vldRmXdYqRh4I4y9FpJFnqfJCp18Wg7IRtTr1tOv/jm4OUpjoboRZ6CX7kIhtadzQryhLOqsnR2ZRZqi1BXPYrWfWt7jh3u2zSj5ZCItfZZffe+8StFeLnQRE62WoNZS4nf8wWBG/9mqAkIc5g2YzIeNugrn7P6LkHAg9tggAd/WsUTwVpiKgKRVxDB4jOATOIYwuUI3l9J/xLG+FWDHnLNu/3uidi2EKf0Tgik/9ljLQPx4lAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 21:43:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 21:43:15 +0000
Date: Mon, 26 Feb 2024 21:42:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 2/3] drm/xe/bo: Allow eviction of unbound local bos
Message-ID: <Zd0F0J5nPVQjmxIv@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226164455.10179-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3e7173-1cc2-4bc0-29d5-08dc3713f00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KBqkWtbZRvOSCPvDVqsl+AgkSmpE1LBIpVeVjUg+hSGnDnuc1z2u0H9vVLmCT/herqywwbeeGz/Sj+Qy5JzR4qu/1PHcaTRkMjiccWxoe15pMyiupNLXg/7zpjD5tWPl5O5zxqRAu2znETL8Y0WMNX12Tq9y6jg/7Oh8LzYBcnWSgL4WsoL41NZJ9pg1HRRUWfqGSnWIsfYmANDUbFXgrEoCy/iOMIU83koPOBRaPpAsa6qP8cPzekZ8UZoyb/U22kZoa6g2eTpe8Mvn6FX7PeSmd7uGCUJuncd3zs1MsfXQRK2bKlPrsTfCJmANpvXPQrbg9bTNJbO99yeVWAmAzeSNGExhtatuCwwpDINaq/NcQ8vJsEfTvCHy0TC/67mmAjosrToj0Kx6aTCN85HHrzg+o9++lLe0JZSB4Ekhzc7HqnXzGvaRGGHUvvxeefdKsA49W/icHnHhV7q1gmbMu2RvTUjhhAfJoxJyde/AkSy4WfiJqZMLdR5IhlFraY7AZ51PJgHxqonYv0BtNTLY7/k9SqHK/UNESo912/4JoQKuxXngHLdSqm3m7kuR+jBy07FERPAiSnG/FbA5F+OgiYuTT8U4oXVvtglvf8X6xFoC2ot33W4deau6Fke/XqXoCjmbsGuLe2sGbjxnWtb/ZvTPQ28D3dTdXLxLc0YOfC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Wy121dI/I1MNNYMlxIu8+u78TCEYxwPiVvfZbnye0ziWTbvnhL/nlkcwwT?=
 =?iso-8859-1?Q?3t+I3FvTZC/bmrTOOC0FoaKxGMnftoP+O59oQSAWM1sTCUNl6WbkhKSeKE?=
 =?iso-8859-1?Q?Un1WkP10bfd7ln0zHvM4AbxA188/XIQiIW0gomw0gWqlItQM6uG0BSRmqs?=
 =?iso-8859-1?Q?eUy8MjS95apXKS42qt0XHdJGff/tJZ0DLRc0BsQK7THZpfe+BeQVcrWC7U?=
 =?iso-8859-1?Q?hYsd0p927YcITs0PY5hVpabHtI5RI99bgk45Js3+ZYtGwHEu5+5ywFkFAj?=
 =?iso-8859-1?Q?53pHXlyEKPLYRZNb2y0+ABlIpcstX8GaoQa2p9NE1q0sLW6dcAa4mPgKEw?=
 =?iso-8859-1?Q?yTl8oeB7h4Z6NWaY70eAiRGQvDUWnm8XCt+4OQGDPneoWGiblng/wreoex?=
 =?iso-8859-1?Q?qf6nS+pETX2tz1rRB20GCrh7fb3PikYvYsr0/rzzVglViEFWPTbOl5ZYlb?=
 =?iso-8859-1?Q?SOseGIDxP6UdHVJ586FWD9BXePtZNxWeBDrVEH3ooXCijeM4qwAKPNmRHS?=
 =?iso-8859-1?Q?swrpsjiLwAn5TwwugNpo+SqFrmyJ1tGkhIiRir2Pt3nqk1BuYoCtcpB1d9?=
 =?iso-8859-1?Q?H7yBWQvDXIuSOft/RzRzamR/XHJQ6RVtsi10H/O5OxNwaxn0i5g1Y1utyj?=
 =?iso-8859-1?Q?5jiA0TJIKmVGzpmGefz7uYoKRuig7QNkMXA3khuje2tVsyL/Pr6+O/6XPV?=
 =?iso-8859-1?Q?hhw7vqu2RP6tvu4M/RsJHd6wnawi1NtQFCt84RUqr8jSIN0bKhP8WLG9N4?=
 =?iso-8859-1?Q?Kmcc/lkWmHX4JxVoi9sk4vzv2hDZKZCpepYG0mC/JRbBM2nrxEzS8+ZVVZ?=
 =?iso-8859-1?Q?GnRG8dvR9ux1HF07Jq+Y2hq324DgbgKPo7yEwz7+gXO0bNvRnax36z22gj?=
 =?iso-8859-1?Q?d34Xecfxqn+axC/zdrbFBEGTZkGHuM+cecD2GJB8GWF378cIptu4iHKL7F?=
 =?iso-8859-1?Q?b4FuCSH1NE/7AsQ6WGzfEOWR13cy6ZE5ji2tDDV7MtnSvt8ffe+K2UOIon?=
 =?iso-8859-1?Q?wSzQrJm7o8s94pdJ2eDrQwCUaNTTqqNGvsT+49/imdhhdhbErawJwczgch?=
 =?iso-8859-1?Q?3zmpnG9OxuK0kaE+CEs2Xf44P9i/E7JGZyyFA6y4Nv86NR38mQVP7TAcm+?=
 =?iso-8859-1?Q?OkXsXl8RPeUJzYizh9br6jlGg/8CNwtYx99Pfs9D7BzgDDUTYTPgy2MxVt?=
 =?iso-8859-1?Q?EIlx08FkgKR5rWP6aJ0pGthmM96fYKAzpVV+Pw/O85yODza4QhzZqTfvWa?=
 =?iso-8859-1?Q?jdAMIgYKlyOEzRMCQyz0Ulhev2IpgIYUMBw5kRIsBZfGz+U9rlytq9I5hx?=
 =?iso-8859-1?Q?4o7ad7soKLQqMTDeT+dmMbgO3Ci5B5adprj4tcAbmfZW996XEhzkf4Wxth?=
 =?iso-8859-1?Q?ozq8ADafR/WMWBHJ4kEgMZsQHdypC+uddrKl16F9ZGMvAM0uUxBIrsCcdD?=
 =?iso-8859-1?Q?hbfBNaHFPeDWpsC5s/gqGpvzY8x83jY93MJrWBTbMYzx6zylxNZZ8mmpsD?=
 =?iso-8859-1?Q?Drls7VRKuf8HP4kD8d6t1eCu1bRpAXhj4T3wS2d54yMKSWJ1juCCljslZ6?=
 =?iso-8859-1?Q?t07KC2W+ZEeMDvwxTNPb+3+oEATX2KtcaucN5FVGL00sd0SFt7yrTdKnCT?=
 =?iso-8859-1?Q?ynloUBINtJDEe9GJHYvMW7uAoHgSqiwuPvEEZbFmxZ/Jn1lAgBbUzsDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3e7173-1cc2-4bc0-29d5-08dc3713f00b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:43:15.1835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fv45CueBuJ0bikikJfxC8PtLFAYA1UoC8UBf8oryPCFldoTHepMSiEvGQnfefBChoPPDbF2bCYug3vN7PGxKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Feb 26, 2024 at 05:44:54PM +0100, Thomas Hellström wrote:
> Local bos that don't have any gpu_vmas set up are allowed
> to be evicted. Support that.
> 
> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 143d93632253..2931b9030503 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1057,10 +1057,15 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
>  		struct xe_vm *vm = xe_bo->vm;
>  
>  		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
> -		    vm->is_validating)
> +		    vm->is_validating) {
> +			/* Not bound to the vm? */
> +			if (list_empty(&ttm_bo->base.gpuva.list))

Do we not need a lock here? Maybe add drm_gem_gpuva_assert_lock_held to
make that clear?

Matt

> +				goto allow;
>  			return false;
> +		}
>  	}
>  
> +allow:
>  	return ttm_bo_eviction_valuable(ttm_bo, place);
>  }
>  
> -- 
> 2.43.0
> 
