Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323A6C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B7110E245;
	Wed, 15 Nov 2023 21:31:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264B10E245
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700083905; x=1731619905;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MVKMttgTRuOyK1Lrqu98hGTq3AbeWWgZdQUfR7NZiIk=;
 b=iwcCoHJMhnI64W5+T7TcDZM9zji5neqKRrZjoUZvbUq6mWBpdZtjnzkJ
 4vpbJX7InZFN5pgiUq8WRGEJWHLKb4I8VeOPSz0Um26xEsVa4bsT00Cg/
 Eiacppcy4ZON5vfnE9Y9+evPnX/mV3HWxz+qPSiDKjTcP5Js67YDVcGd8
 rSHgxUqetARIocHe4/klQfbOGIQdL236RtwC6xYi0ESVdG8r49RfIUW4Z
 18D2DByU4rV+QQAk46yE9d/09S/ss+z7TBmphGy6Ms9DPxuXXMZQGIMg2
 0nFMWEn/gMOUu1kDa8XApxJWLeLOZ+yK6dAeN8WqE+67xxxQJ96ptaC1n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12513001"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="12513001"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758626077"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="758626077"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:31:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:31:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:31:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:31:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLuhDGxA7XVYXYoaJTzXaeiR6oJWBLNyphzRI/6TdMhxj7nbRN71yhRyUpdKjAQcHsVtafechFPpiVaLadV6aa6FCmJtP9G/k5BHlizbfApRkYBATGUgXkmFa9twWCcsApBS7I98bJkzOO7Py11FYYI539IhB2b0U5pNEZQOm4gSJ3oeGrlNSUpcDmkNXREAVGAkvQvA3z6Ru+9vORrs2o6aDc6in3W/t4eBBhE4yySrdlOj+jpaQ7X0n/Fg+3i/8QgFLoIHzkJj2XgNENdd8wOgoeYW3EtmM5WIY8POXBNufWKFaRI979PougMgs4mZJpEczJPLFwZIf61bV2e4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARPCjWmGXjhjkdTOG4Oic0HahoNzt61/FgjPog3kRAc=;
 b=nQgmRc1/ojYhDJr0XCqyiuVjUaAskbXxLgvTLQ/aW8UtI31m+Fx4PHLFXCO+xdl42MdVB2oH9RT/bfOucwRr0iSCw8SC/Mj+iy+OpoyRwiPYdDSmgvWQoJ4+rwPpesZErK1FxaNw/ZSfsYN4BOi16qLxsNEV94NpJBMRYevqY0ffE5Zuh/8PGASP0Nk5QTx7WyerMTfvlyO0wXjHOyvTh4HjxjhQrVnUQYgHOV55S7DcYjuNrHhithJwRBTnYm7HWquGf07pVO3pGVNOyPD7ECGdgpogUI/Hg/i4JdNvwfqnl1vhf3W08DuOay7le0CIoAX9wMKelgzJnZhmmDpk1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 21:31:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:31:35 +0000
Date: Wed, 15 Nov 2023 13:31:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115213132.GM1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-10-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: e652cd60-5122-4567-1ee0-08dbe6223ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCKO9C7NsSkBLTL3ri567qAjki5vSGt07Kt5lYJivcofirM+iQ4KZiI4K4HFLAIVjBFV8mrL3EGWAOUk5Ce9WFKWtNRSA+BleyiJBcYHvxNGrfuaxTqHXGB04BFN1Vg2DjsvBdJckJMjVO5qv9XTtTq+2UtIA1ZB2Rcmsl2U7MPQbW28hPohsQALQBEhnrqCJf5vw0jlGUoQ+MdpOwofuYMtZ2D6YTHCK460FCbRDVzeYAf87afFb/kd04kxUouoUp3V29YocriJ2oZiaQERcSo9KT77YCuzvTnwlOtqa1ziM6E50puRTXNNV2k1/w2SmeJendDJfuFSt6c0hKyYtHe1oOCb7jRkTsap53eX6NMHKb9Yd8zIP1hHmomflZ32VBdHDIERl/fGKWeC+ry8cbjhs1s7T32ohFFSiBFQ57ivDOmJNyyrpamv105JAMFLP/dfpv2OfvVNxKdP+3Dib8yMxrU9FYevdgNtRalm7uZnXKmsbKP2z70LmJR5fJNnvKvAazzA6VQF0T+Kg8cMRPh5nTT71oUouFr9v9U3NIoBuTobRnV8AiVw0zQpz86D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(478600001)(2906002)(6506007)(6512007)(6666004)(33656002)(86362001)(5660300002)(6636002)(316002)(54906003)(66946007)(66476007)(66556008)(4326008)(6862004)(8676002)(8936002)(38100700002)(83380400001)(41300700001)(26005)(1076003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXdNdFV1QUNwdkxNdXJoeVBKMkR0aEU2YUxUQ2FzY0dGNFpCRkE4NzVGY1Vr?=
 =?utf-8?B?bGxxb041NUg3UmxXMlJ0eUgrQlVwNThpL2Z6L0tubGdMdW02c1hyMzhFMVNO?=
 =?utf-8?B?REUyLzg5L3RBQWtnM2NHTUVobDhFam5ScFhsZUlhYzFMTm1DaWMyY0Q2TFZn?=
 =?utf-8?B?ZnNzZ3hzRUxBMXVoVE1VcllGU1dxKzJjWHpYQ1VYdUh5dnZ3L2xUbVQ4Vkda?=
 =?utf-8?B?Q25LdUNhdW4zRUNaRVA5aUpsWTl3bDAvUTFwVFk1RVRnYk5iZFFGV1BZbGI4?=
 =?utf-8?B?a2JJeUkyZ1ZRczcwZHIrV3hNV0tON082VUc5Ly90cmtucjM5Tm9xZXA2ak5h?=
 =?utf-8?B?RzNvdytDdTNzVDNLS09mOWN5TEVpUXdTeGk5ckZlVGxGNHU0OW9kNlgyVnZF?=
 =?utf-8?B?S091M0xpazZmTEVIcXFKRldSaW5SdFU3emk1NEUyTzEvMm9SaG4xdFlZVTFS?=
 =?utf-8?B?Yk81UHM1VllOeWM0M2JWV1IzNmdFd0RnT1ZoUWRlWndSNG93MTI3N2kwRmR4?=
 =?utf-8?B?YitzalJTVlZOYkRNT1RFSXlhZ0E5enVsSno0emRCVzdHREN2S29mNmU5bEZO?=
 =?utf-8?B?YThqZTlRNFNrWkk5Ylc2SkdZdjhhaThnVGNXT0ZMQUxOQWQxbzdwdVNOOFdT?=
 =?utf-8?B?bCtObFg0VWtRUUlvRVhoSlIwSDAza1k3TWdMY3ZnbmFCWm55L1YyalRQb1pj?=
 =?utf-8?B?c1I0NlFycUFJUVE4TXZaWElmbmQ2SURuS3QzZDB0K0lTNE9xWVhxa2RXVmh5?=
 =?utf-8?B?S2RMRkYxV2l0b1I4YUVRa1ZZVjczRmNOTm5lcW9qYTlxdy9vN25QRUI5cWx4?=
 =?utf-8?B?cllReEpZMktDeVNyNWswWDZmVmRyZmRVOUdWUjk2c01uOGM1K1hMbTYzV3Na?=
 =?utf-8?B?TmdJc1dBZitBQjN0bmJScnl6RnZuMk9YZlhXTDNhR3BhaGJlYzBGYzlTU1Bk?=
 =?utf-8?B?N2QwSURsd3RjbnFHQ0pQWnRhVklra2JoeEQrSDNzL1JBSUY0NTJKSlZlY3JS?=
 =?utf-8?B?RWpRNWVIT1QybFJxc0tmVENSOWdWcFJmUVVhQVU3a1cvQWNGVi95Zzd2dnRm?=
 =?utf-8?B?Zjl2VGhTTXBMRlYyWFRNU1BFNlBBRXJ5TXM3QkxDY0xqbWZVMCtpZHg0aFIx?=
 =?utf-8?B?UEJSVkNjQUxqVkk3QkxNTW1kdW1IRHFtY0FJeGxBOUJ1aC9tMndkV2s1OGNJ?=
 =?utf-8?B?ZEQ4ZWdZZTU0d0p6Z2doMFlXYVFJRk9Rc2FPZ3FKRnI0eFVLRE9NVG5jVnQ5?=
 =?utf-8?B?MklWK1gzcVlSL0gwb2h0MmV3cW4rR2p4Tjg3MzB2dWlTVTJTaGJ4ZzFNNGpl?=
 =?utf-8?B?RHNQQW5ZaUtERFRCc0ppZktRYW1nTWJId0hrRVZTc000cTdvMU9JMS9JSXov?=
 =?utf-8?B?dVJUclgxUWNZRzVqa1FMMGtoeTJSS2NFaXY1Vjd5MzFzdFZrdlhOalR5eGV3?=
 =?utf-8?B?aDBEbkNwSzk1eUx1SjBHMmRNS0JoVm10NkxKNWp5MlR1WUtHZWtqejFOS2ti?=
 =?utf-8?B?bzVkZ0lFL0ZONGU5djFNbEN1Y1dyNklKaGxobitHR1l2ekljSUp0V05KRTVP?=
 =?utf-8?B?TURWQnRjczVPQWxPWWZCdXZMUTRXa3VGeUFGZFVXV0d1YTA2dWFOMjJQc2ZI?=
 =?utf-8?B?U2NvVmtzTmlQR2JiUWlyZTgyRnZJakFZMURSNUtOdkFZT1BJdGVEVlpXNWZF?=
 =?utf-8?B?ZEVNd0RSZEkrN1JyTW81SEJ1bTRiK0tYTjdodENxOTMxQzRBTmYzbEYrRmU3?=
 =?utf-8?B?RXNEYzJXZnJ6MkNHTExlRXFJcHpNcG1lTlNlbFh5Y21OQVRwdUtJVWNXUzcx?=
 =?utf-8?B?TUJFN2dlclNZTlprWnYvb2FNQmR3bWd4K2tCc3BIRkJTWnN4Z2ZPWHlVSzRP?=
 =?utf-8?B?dFcxdDNndExUQitpT3FmMHRUTTMxbE5DNFRKVk41bDVneVQySGtyQTNuQlpC?=
 =?utf-8?B?QzYzdnpWTHQ1SmJaTDlqSFVxYjI3NVI4YlFxS05PYUxBUEd4WWdkaDA4Rk9F?=
 =?utf-8?B?SWpQWmVMaHBENHVxYXA5ck95VnNEYkVnNytHVVlvdFlYVU1lOVZCNi9FdWxz?=
 =?utf-8?B?dGhEYU9mbGFVNnZjcVhJczBmVDlXZ01Yb2d5cTgrclZyVzZ0RzZFQkMyQ09n?=
 =?utf-8?B?Y1JESEszbVRyVk9qU2dYYmJjUFdCbk9hN3htSzJkQmluT1M3aHlFZ2I2cXdT?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e652cd60-5122-4567-1ee0-08dbe6223ddf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:31:34.5705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIaIsHNb/fJKlBeLC/4tZ8Dj7ehxe0J/77jjvU6lGcyZnYYv9VHBsnpeVUJbaDIjtWZcr740plYi493lKfjzj3pm6S7WkFFnKxO5y1yeGPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 09/20] drm/xe/device: Introduce
 xe_device_probe_early
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

On Tue, Nov 14, 2023 at 02:02:20PM +0100, Michał Winiarski wrote:
> SR-IOV VF doesn't have access to MMIO registers used to determine
> graphics/media ID. It can however communicate with GuC.
> Introduce xe_device_probe_early, which initializes enough HW to use
> MMIO GuC communication.
> This will allow both VF and PF/native driver to have unified probe
> ordering.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v1 -> v2:
> - Add comment to "early" variant (Lucas)
> 
>  drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_device.h |  5 +++++
>  drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
>  drivers/gpu/drm/xe/xe_mmio.h   |  1 +
>  drivers/gpu/drm/xe/xe_pci.c    | 22 +++++++++++++++++++---
>  5 files changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3a98e7b502190..6fe669fdf1c0a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -364,6 +364,24 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> +/*
> + * Initialize MMIO resources that don't require any knowledge about tile count.
> + */
> +int xe_device_probe_early(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = xe_mmio_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_mmio_root_tile_init(xe);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -382,10 +400,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = xe_mmio_init(xe);
> -	if (err)
> -		return err;
> -
>  	xe_mmio_probe_tiles(xe);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c4232de40ae08..b80230c631068 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
> +int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
> @@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>  
> +#define for_each_remote_tile(tile__, xe__, id__) \
> +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> +
>  /*
>   * FIXME: This only works for now since multi-tile and standalone media
>   * happen to be mutually exclusive.  Future platforms may change this...
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index acf6dfca0bc46..8eb19a4bca9c6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,10 +15,12 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_tile.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -375,10 +377,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
>  
>  int xe_mmio_init(struct xe_device *xe)
>  {
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	const int mmio_bar = 0;
> -	int err;
>  
>  	/*
>  	 * Map the entire BAR.
> @@ -392,12 +392,16 @@ int xe_mmio_init(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> -	if (err)
> -		return err;
> +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> +}
> +
> +int xe_mmio_root_tile_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	int err;
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
> -	root_tile->mmio.size = xe->mmio.size;
> +	root_tile->mmio.size = SZ_16M;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
>  	err = xe_verify_lmem_ready(xe);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 9f1a25cfd2cf0..74976af15ea60 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,6 +21,7 @@ struct xe_device;
>  #define GEN12_LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
> +int xe_mmio_root_tile_init(struct xe_device *xe);
>  void xe_mmio_probe_tiles(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c50cc3f7cbe06..a1026b7ee4727 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -537,10 +537,12 @@ static void handle_gmdid(struct xe_device *xe,
>   * Initialize device info content that only depends on static driver_data passed to the driver at
>   * probe time from PCI ID table.
>   */
> -static void xe_info_init_early(struct xe_device *xe,
> +static int xe_info_init_early(struct xe_device *xe,
>  			       const struct xe_device_desc *desc,
>  			       const struct xe_subplatform_desc *subplatform_desc)
>  {
> +	int err;
> +
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> @@ -554,6 +556,12 @@ static void xe_info_init_early(struct xe_device *xe,
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
>  				  desc->has_display;
> +
> +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> +	if (err)
> +		return err;
> +
> +	return 0;
>  }
>  
>  /*
> @@ -621,13 +629,15 @@ static int xe_info_init(struct xe_device *xe,
>  	 */
>  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>  
> -	for_each_tile(tile, xe, id) {
> +	for_each_remote_tile(tile, xe, id) {
>  		int err;
>  
>  		err = xe_tile_init_early(tile, xe, id);
>  		if (err)
>  			return err;
> +	}
>  
> +	for_each_tile(tile, xe, id) {
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
> @@ -727,7 +737,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_master(pdev);
>  	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>  
> -	xe_info_init_early(xe, desc, subplatform_desc);
> +	err = xe_info_init_early(xe, desc, subplatform_desc);
> +	if (err)
> +		return err;
> +
> +	err = xe_device_probe_early(xe);
> +	if (err)
> +		return err;
>  
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
