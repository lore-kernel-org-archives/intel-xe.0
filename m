Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF358C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B83F10E273;
	Wed, 15 Nov 2023 21:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8404B10E273
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700085551; x=1731621551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DnxodCJ8wfMlzzVJOFz4GIvJamUtmRQvweopMSg6WkY=;
 b=RY681aaUeClX7EDpB1mUngFtEuQ4ljCilCAizS9ggHasuf7LMPF8S1YP
 FazllkzLqG8e5HrJHJ+8ArCqFpWtgUijPDTuAaCajkm3zZIY2WMq6gqNw
 ZbcVAvwPdmqFCi4dcVAHGx3x8ojDQlXjOI4IPuJ85iF+Wkjw8OO1XLghK
 XzzSy133jmC1m7Jpco1aZZ0I8e3dzAuB7fmXmLUWdkp+cpxuJkqR5BHFA
 NEYSIlWP8e8GSfdg2Q5RB22OWmhJ/IR/W85VGJcetKTjJzt+5ag2q9SMl
 xWN5jNb5vtFDwIWa4u1oAVO0/Ln624NwGh690+Dgycj6W6lxLEkwrry35 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4082817"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4082817"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758630093"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="758630093"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:59:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:59:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:59:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:59:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRTkQNoBErecgVX7ptYBvOWkWC2CcwBqoQTNnZUtEFHBy9rFTsmwpjj1hbMsjLzKhnUnWGH4ei9Y6c7tEs6+gyKrNYtSwkolJt/NdD1n0HKMZffIohx2OjWFlI0cT/ozT+EtTEFFcEzc1pyTfYk0MOH69cFozkoHpfzmVPcMccFJVN7CIyxAO18UJzKSKjkwDQL9Ev4S+58jQnN93bM8SBW1wHzom4Oe3q1DfwO1+fm1JmJDwI904O9xBFZbdpwBrFJIjFQmi3Rd+CdtGYPz74snD8e8bq6Z+COhTx9NikmmZd+4blLhsiEPY51EkLEwOPMILDmvL9PH4ndKQKK8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgElObUTpE1FxyygCUsELUBma0f4ItCFunAk8DdX07g=;
 b=IhI05R2FyZ3TokCb6jVczrWJ45wwsKrLVMbhomSnydoKdIks3MyAIlXT69qWAokeWijFgEPdZ6DXVW+gmPzqSQk1VIHGqs7p2JKE76vUMw7IUVsg2dNrbocrm7sTjgTzj45hqnE5UuSXt3t8jflsYbdTnkkG2qd1T271KVRyutkGQ3dECFCRNzGQ6gPRmE0pp7KG7zEWSxO4tRLDVvKVpu7aK+qdd18415ZoJtVWroVPakCKmDhi8DtnUr1VZ/sNau4nV+Bks8yAXuxi4Ivz+FKU08H50+OFLIVbzY1gNFVsU8qfdLBqC/JmQLmFgvNCBpXqyzsUwMNJMxU+KgZ14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.35; Wed, 15 Nov
 2023 21:59:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:59:07 +0000
Date: Wed, 15 Nov 2023 13:59:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115215905.GP1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-13-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-13-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 431570a9-1371-46fb-8102-08dbe6261731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfVUiDAolFXCq48QOd3HOwi3RccGfxkV9/onZqkQjqxBstuMJjvgrYXrOPTPOWUlaEdyVF5ppGM7fVNDZ14OyF/n5wS6jDWuNGA3smvOKMyEZYQx7+Wf4XlotDx0W6iH7mD36DGV0jmd8QRmTCq6NY/UCZ6KcFzVwX2wOU8MU2X9/9+qUPKJcFSGIlGF8HXJrZVLUYHvmB/uuDSUijJwFNU18YUQZ84a7bBr0EUG83Sqdgk60KKQM0qR1wP1rlWk0jOmZpd96X2t41gF5sMBy2U/OkIQCrV7JTWEl2AdNVkiJVhE0IKJlh70WufOAlKUE0VPPjlWnJJkio9gfLMky3z4leTnLVNC8Rj94QicROJsysWBouUegEoLfKvSZ+SCGp+YR3XPAZ2dicdJB+j0uxvOsgHmIHnuH6+0ZKgabBNqgukyCoiaMWIQ8xs6HfURLUsi0V1Tvjs4zIVG2WHoYnWmPho7cTkyJHxJqvkE4HUDbLE5RhskKDH2rJ46rCBZPuuCdflc868nwDLAVg2couHARvHIR2Awm4rtT62LAVRJTXPMVgpsk0ByHofB9wgT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(4326008)(8676002)(8936002)(6862004)(6506007)(66476007)(6486002)(54906003)(478600001)(316002)(66946007)(86362001)(66556008)(83380400001)(6636002)(82960400001)(6512007)(1076003)(33656002)(26005)(2906002)(5660300002)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5uMjE5K1RRb2R4VmRRSWIvSklHelNJZDRNVjF3c28zR2JzeldSWGFRU2JI?=
 =?utf-8?B?akdzR1ZISUtHdXpERlV1dnQ5WDNIYkZUbjB0OE5nM3NmbUxGTFR6Tzk2OStr?=
 =?utf-8?B?SkRxQ1pzSnZVaTB1KzNqTzIyeGc5ZzhNSi92NDdKSkI0eVdBWkhscXdzdS9X?=
 =?utf-8?B?VzJ4MzN4M1F3VllCTnZab2RxYitHS3lOMDFWdkdtTlEyT2tWV2c2UGU5bU05?=
 =?utf-8?B?d2dMWktQdi9IR0tpYndwanhuMUZ3cG1jN0lLbWdOZE5wTmJwK1NBdUZJUzVJ?=
 =?utf-8?B?Z2EzN1BiSVYzSVpRY1hvekxvM2VHL01EVjZyclJ1bDdUTGdiYzQ1UHRHNzVz?=
 =?utf-8?B?N1ZYOS80ZFJpeXNmd2JYSVlsYUtqazZlZEthZlBmUHdQbzVXZTR5TWgrNjFQ?=
 =?utf-8?B?WW92b2l0cGtuTEpscTZCbEcwWGI3TkE0c2o0dmFUVlFRN2hVUWlxRTNPWHdl?=
 =?utf-8?B?cVAvZ1BiVUM3ZmlqV1gvbDVBZXBFQnl3TFliNFNaNEE3cmZaSVQxTXBZVkRO?=
 =?utf-8?B?ZFhQQUVaLzVpQ1o1bkZpNXhlaTVCT0ZtZEdic0UrdmQ1djlJNFdINVhBanht?=
 =?utf-8?B?eHF5MVg5UzZSZm4zd0VTaVcyUksvM25oVHpaU09qN09GYlo0M3RndHdweWRr?=
 =?utf-8?B?Q0p4NnU1NVhRL29sbVBPTWxtRmdpRUY4ZG1IOHZZbGxjd3FmdTZyRkhCUUpD?=
 =?utf-8?B?RzNMdDk5Z3NualRUMTJRbFNnM1F1Y3ZhVmFqdXpaWE0yYm50d3hkVVNNSEJH?=
 =?utf-8?B?dmFhM1cxY09OK1hRb3lDWGxXcStKM1JPVDcrL2JLMnJWNm9iMUp6YWJMVjZJ?=
 =?utf-8?B?dWNKcUJ6ZEQvWVlZU3ZRcTUxbVQ5TktSTFllbitsendDVU1kL0EvNm5XYzZP?=
 =?utf-8?B?WFdJSzVLZnYxdCtzYVhiMTZCVkNyb3IzOFcvQlQ3MGlNcHZNM252YmZoR240?=
 =?utf-8?B?TktEd2pXYW1GR3c3Q2wxMmc3RDN1ZGFsMWZXZHJVSlpORDFZOEpNUzBVdnMv?=
 =?utf-8?B?ajRJeG8wYklrL0RFUDUyTDJFWk1rL2pnbmo1TElkR1dLMkFSRE1zaVFkd0ZO?=
 =?utf-8?B?REU0L0VqazNSdk83K1dDbVRUbmlHY0JlejAyV3RNRStaNlRqZVc1RnRmTEdv?=
 =?utf-8?B?SWw4K29xNEN0TVlkeUpBQUY1Z3N6OTV5VkF5YnFPbmM0OTFFMU02LzdULzM2?=
 =?utf-8?B?NVhqb0U2U0NWVFJaUUsxV1NuUGd2NjFlaVAwZGlkQzBIZmtjZTlXQVFGcXlV?=
 =?utf-8?B?aWZrSmUyVFZIOW10MWpXemVCZ0FpSm9qbi84ZEZ5ZTJYUUlGaFdBOVZML28r?=
 =?utf-8?B?eUMxRm4xRkMvRCszL2NKNXR4MStibytha0FPMHdVM1VkUlV5NmNnT1k2WXdj?=
 =?utf-8?B?VWMyLzZWOUNJd1RLRVRmU3FtWXliVi9XcTBwNS9JUFc0dVp1S1dieGNHSHk4?=
 =?utf-8?B?bm8xRUdtWkM1UW41V1R0MENtZ2pVUjkxS1hoanhOY2Z4YWlYQnZDQmNoeE45?=
 =?utf-8?B?dU5Cb0M3dU9oQnRLWld1cWxENGYydzdNQzE1UGdIRkU0ZzI2RFp2akQ3TTFJ?=
 =?utf-8?B?R3RHZ0lpa1N4c0J0RC9DelR0cElvZGZMMVAwUlYvRTZIWHhsZFkrZUZZRlV0?=
 =?utf-8?B?dHc1a243MjZ4eUJXYTYwSGtBY1NDOWRWWjJoSkpaRWlpdXVlUzRZQURCdVgv?=
 =?utf-8?B?Z3lQQW1QZHFJQzI2Wk1zMklJbzFkd3BRbTFqVHZESkpHMlNwZWRxTGF3WFZy?=
 =?utf-8?B?WWxOZHA5UVd3ejl0NXVxMlV1eFYxTnUwRElDLys4bWxFWHRwdkV2ejJQSnBL?=
 =?utf-8?B?VXVpQURlWkNqczY0N2haeENNODZPNE1yVDNZM1RhUXNFZ2UrOFhRZDNYUTVS?=
 =?utf-8?B?aUw2YlVoaGw4RlIrYkZPU01KQ0Y1YWJRYjFVZUxsTWMyYTR4ZjV2L2thTGpw?=
 =?utf-8?B?ZG5uVVlDaTgwR0lmcTJwY2lLUHMyZCsvVldRYXY0ZklSY0NaZGdwY2dLeXM1?=
 =?utf-8?B?RDlCYy85V0pqL0k3Z1BJMXBHUEZ5NzR4T1JtaElrQlR0UFRUaGpDeDNYeVpr?=
 =?utf-8?B?ejdCZ3pIT1VyWkk1b2ZDZUh0QnpmL1RTTDY1QlQ3S2NyUnh4MnpEVG9Vd3dh?=
 =?utf-8?B?bXVma2ZUSFdzQi9QTVlrMitRNGlFNXFYdlA1cWRmS29BTEpqa2xST1hKWGZO?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 431570a9-1371-46fb-8102-08dbe6261731
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:59:07.6454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx5w1tv37pFWnBSIrjyC9eXttcq+ah4YkhxYdIN91+aWN8FqkP5g37BebNPmOWQzmwAVelf9imwG2mWz+IFPKIiiRTERn5uovA8nVJQ1OOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 12/20] drm/xe: Move force_wake init to
 earlier point in probe
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

On Tue, Nov 14, 2023 at 02:02:23PM +0100, Michał Winiarski wrote:
> GuC will need to be loaded earlier during probe. And in order to load
> GuC, being able to take the forcewake is going to be needed.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 +++
>  drivers/gpu/drm/xe/xe_gt.c     | 2 --
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a89b5a32c093d..fde597fe0b513 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -404,6 +404,9 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_ttm_sys_mgr_init(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6c885dde5d59c..c8e2689873c37 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -292,8 +292,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>  {
>  	int err;
>  
> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> -
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
>  		return err;
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
