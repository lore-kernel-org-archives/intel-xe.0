Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A12DC678DF
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 22:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540E10E107;
	Thu, 17 Aug 2023 22:38:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A3310E107
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 22:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692311896; x=1723847896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fuCkV3TnEqqknr4ZxiEW2vllnY1G6lqZivr5Yfz6wDQ=;
 b=YmuLDi+FYAOiqcdPk/qtvhopxQAeAZjbZqALuoZ2JMDKyV4/f0ak8mkZ
 Db2t8SAqi+D47otQTVS+wiCU89nUmA7cQg5LtqMfClngOug1XPRhISqf6
 Pjqcf17iYMM1tXCRnSsZzSBVDDi3jbBjDvPUeHI5slyox+9EmB2wLE/7h
 ZEarM7NciwrbubZf895rjbqbqBe+5G8BC9wcqZ3H7rOVQEMQnp7TuJaKu
 FBskY25lkIiwUUkUPCUXHPqx6sd9wyqgcrubtss0GHNB/elcTUBDpjDXN
 Yk+yycX5kPnQ1FpU1fC93Ugw77QKfi+BP59ib0z9OEUjSEUYcee2kiWpi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372937386"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="372937386"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 15:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="684615872"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="684615872"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 17 Aug 2023 15:37:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 15:37:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 15:37:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 15:37:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 15:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJ6nf++2dl4mgCNLjg1VYYQItJ+1tkMc4iMs3MxKy7jyZ7G+xDunt6HvimBuD6x0SKiAtkStln2k7h8LDRh9GirJdsUeIc8szDODnHa3s6EfQGrxn0qlsEMm70PnUEc8DfhKp75ismQRPk2C/pwtNeRgPcFO84qC3ak6U0VgOGApv6h4/TaW32rrRhfsb5Iie99j7SuZksuxxI9SLNPVB/5CUQDCw1fVH43CgAdHY4PFrn5RHnrqlMO0l6/ttiIF7z1PDZGbJ+r4gQQp6LI+Q7wXO8uxyz3AKTuukqt/+s5sIM74m7MmQUgwddBeWM3wAbiOvELqBfzTSaJ1q8jgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXADBioKhF6YIRsmvEtFDcD19XYg+QtJCz+BBahTkqQ=;
 b=IhONNwzTK31vgkjHfPXgH82Bb0XDyZejlsdQ6cNuIPbBj1yk95o6SxnrF5KMLO5cMrtzbdEt8dRVXhtI9J6/Zg8kjrcqNXcZQqvDgCgERL9GE5owol+AAy2elvh/u+u58zb39Z8aasJhMI6HJKUv7JrOWqPoQ7TdaKc3nOOssypquzlKOB5qPCmRy1WPFP8AE0MqGuEWK43YjpDY1mZoDOUU++QDphsRgcnL6ueKxavJP0k4tuZLaXRnE2FgifiWBY4zQENMJPqYVuJnK8t2OLie13qE25dhUOWVXlKPllKxjrMotNilFuZ+LOj3XN5V5d43v5N70x1N2fKhhsyT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 22:37:28 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 22:37:28 +0000
Date: Thu, 17 Aug 2023 15:37:19 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN6hH51m/G/EdOcz@msatwood-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c3ff7c-9f67-451c-f671-08db9f72895b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qKlRxatkKLN2X3/vzWw8NH12R935YVpMqeTe08MHCxp1YEPWWwsrJBEvdT49Rr6fTZ2j48Vv0wr7tYgFC/baLfnY4pfbclJnmKjmoONWnfCwVe3G9VVfyAO3cWEVgk4sNHkoKwX9xEuJNjcjpG7Uz/KKN8LVJCGi0igHeBVuco1B91crxb8zViXobXIJTmlTwLwoZcqjWJwRDDDIJh6/xCvV0AbKVzEW/CmZEQ65Bkros4NIMzNtQ0hnhxUfxmLbfOvOXAVzTmx59d/4pC69mZPRWDRC0ljnMg+1kaDX0Sj7H50zmF6RwtJuq1c6PzCrTMmZJPqDrhD+k6Y7TU42tZhOYxrZgg0/piKEAY+Ehdul3RqgMRU/jMO70mOxpUnOMeWbQfj5Rjw5RHL+lEZlsXFTutKeoduk4crpnV3FLtWRstEBdepy0N48kB5PKooGClIXMVv8LFELC3mYZ3pG9tyM0fNDADrQJQSL3cNb4Q5b8VFcLNQcZ4wxalhw4XLhv3x23pt/U6WyFmyHVOnTMPv7aYcW4y4mf7lDBQNwoG7rjcX7JiDtxukxx/ORDYQ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(376002)(39860400002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(107886003)(6666004)(6486002)(6512007)(9686003)(5660300002)(41300700001)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(8936002)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWFUV2RKR0prdmRod3VmWkpQV3FQa2ZVUnJPQm1IdVJxL3czSzNYT2hEZ3Vo?=
 =?utf-8?B?Z3ZrTUR2S1hqWkF3dllnRkk4ejJZM2grVWFBUk5Ud3FZaXpHL1JQVHRhVHdQ?=
 =?utf-8?B?VVhSckROaXkwNFFTQ0puUHd6NlNOWUVZa1FQODZIY3ZmVXFSSm5EeE9Dc2kr?=
 =?utf-8?B?cUU2UFdlb1kxNTMybytReHJ6TXdPL09TdEVQZnRzSDBxamduODkyOEpvNDJv?=
 =?utf-8?B?c3hIMTBMNXh5WGtGMWtlemJVMXl0Y2FEVE5mSUFyb1JWY01zdWZNRUhVTVRN?=
 =?utf-8?B?YnhGQWpiYy84a3NzcW8wb01GdTJGUURnZFE4QkdhbWNVMTNIV001Sks2b2h4?=
 =?utf-8?B?YWFSdmNDVitLUWJ0SDR5UTJnK1VrRW9hNkRxeFZ2UzE0dWl0L2J2b1Vqd1R0?=
 =?utf-8?B?UUtFcHh5WG1PeVZRUEszaFN2VTJDS081V2t2cnlxQmhBdFZnZUd0aHc2L0dK?=
 =?utf-8?B?dVRxZTVrdzc3eWNQZEFsNUVBelIweVNmRERzeFh3ZGVwNzFRZGFLSHN5U3RL?=
 =?utf-8?B?eXROTStKUFUrcFNReHUyK1RYelhpckRSQ05rbjlvNVJ6Qkh6bVgyck1Jb3Fw?=
 =?utf-8?B?aHNYYklUQ3Q0c3Q0aGRsVzIyNHBtMVlJeEtUdnI5ZnorNGthUERubm5kUnhy?=
 =?utf-8?B?VlJ0R1k0RysreEVVMFRXbDNMVC9CZU9sWGVyaGczMEhscFlGV2paNEdpRGVK?=
 =?utf-8?B?S2NPZ0NoZkVQYmgySGx4cmlBTkpZejBJWmhGc0FrL0o5cC9FbC95U1VpM2V0?=
 =?utf-8?B?Zzluc000anpEa0gvVzhma0ZiR2xSaElMSHlPdjJneDFIdU1OcldtYTJEK2hj?=
 =?utf-8?B?OUlKakdTdEswTGRHMzFKbmJ4dERDdVhCaVU3TExHY1dBb3hVTGwvWFYrSTZX?=
 =?utf-8?B?OHM4ZnRjRk41TGl3V0VLZGEwN2tOZGxRWW10bmRhRXRWMW16TjVSVSs0dDdP?=
 =?utf-8?B?ei9uNjg5WHlST3dMUStSZk45alRhY2VwSHg0MGoyUGlqTkM1R3g3NDdqOTM4?=
 =?utf-8?B?Y0dwa0VOTldrdE91dnFrNENPS3RnZEVsYS9VUThVNHNsRkRNWTVCQVRRcjcv?=
 =?utf-8?B?QUl4a05ZR251aUhxSDNXbWJKNlNIbEcxSjdIMkFxQzlXOEhCcmpmRXU0ZHA4?=
 =?utf-8?B?b25KOG1PU0UyRWhCSnNYb2hodzVOV0VqVnZQc2MxZThnQUFQbmZaSTYyV0NI?=
 =?utf-8?B?NXRMZWxnVk9MSEd0bE85ZTQzOXNzZHF1WEtkdlNPblRrM1NrMFBpUDdnTWRk?=
 =?utf-8?B?RzB1TXVBMUpIYjRDcmJkYVNFeUdyV2JtVk5hQS90NGRGN3pSa2FXUW90cVVY?=
 =?utf-8?B?Vlpubm4rL2NrUE1jTURKSk9DcS80NHM0eHNFK1RGbkVEemgyQ1RLRjBYMkVo?=
 =?utf-8?B?UE11T2loSU9GNW01UXhZSjA2aG9rL0QrRkpFRys5MUd0anhiSy9Od1pZVjBn?=
 =?utf-8?B?UGZhSFdmNkRZd2htNVA3MnFuVDhqLzlYMjFmSzBkQTJKR05KeGRjZU5iYy8r?=
 =?utf-8?B?NStUbTFUN3ptRkZyTDdzOHJwQWxmWkZZMlRpVjlsRjMzdndQd1dMN3ZEQmtl?=
 =?utf-8?B?RjdIM2hxLzRmcmlFWll5ZTJFWDd4aVEreThRN0tBS25SZVB6UEJBTWZZdE5x?=
 =?utf-8?B?aXBMYmZiVm5sdi92cHgva3k5a3lmRGx0NDJWMlV6bVh4SUl1VGVsUG96ZUNF?=
 =?utf-8?B?R2MzWTRZWng2VEkxZGxsK1kzOHk3a1BLanpUd2QxN2I3dEtXU04rMFY1aXdO?=
 =?utf-8?B?cjRmSHcxTXV1bzhrUDlaUmZoOTJ4a09hQ0pvQW1Kam9GMFpOanpka00wanRQ?=
 =?utf-8?B?LzFwZk5uTk0rNzdQb3U3S0FBYjNDS3NzRHVONzZiVU9xaUkwWnJxb0Z6Rnl0?=
 =?utf-8?B?WUVNc1c3eTVUWmF2VnpKTVI0RnJ2UUM0QmNCVWFoVGNVWSs1amhLK2IvYTdv?=
 =?utf-8?B?L05RSk91NTVwNGdoUzNyK3VJc0c2elZ4MUlHYmNDVDB4UmR4VXQxT2dwY21T?=
 =?utf-8?B?WTdPRjVaQk4rSFVWZUNOZVlIWUJhWG8yL2liZVZ5bk9oL051WlpXRDRvck1U?=
 =?utf-8?B?MmxPSDIxdkNxWUdQaVY4OThodEpRNkVCUkN0STJoZU9rZzVLQmJLd2FJUm1P?=
 =?utf-8?B?UUhxZEc3SkpidGoxQXpKUjdOeEZKY29xL2V4ZTNRcm43U01kcnRrdjlyelZW?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c3ff7c-9f67-451c-f671-08db9f72895b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 22:37:28.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/jHpinWg2HaVoSD5b6WNUByteKIV+b/0XiFu5S+RhSkUPPfSUZ32f/FbbmsKx2jPdqeNn7V0YWyFLPrQfMrCGOzsEdJaKv/GMCmOSxHM/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/15] drm/xe/xe2: Handle fused-off CCS
 engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:09AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> On Xe2 platforms, availability of the CCS engines is reflected in the
> FUSE4 register.
> 
> Bspec: 62483
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c    | 29 +++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5bc6c7fa4759f..b8dde495b8a32 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -154,6 +154,7 @@
>  
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				XE_REG(0x9114)
> +#define   CCS_EN_MASK				REG_GENMASK(19, 16)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  
>  #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b8fcc6e985cfc..d2c358e711cb6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -529,7 +529,7 @@ static void read_copy_fuses(struct xe_gt *gt)
>  	}
>  }
>  
> -static void read_compute_fuses(struct xe_gt *gt)
> +static void read_compute_fuses_from_dss(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> @@ -556,6 +556,33 @@ static void read_compute_fuses(struct xe_gt *gt)
>  	}
>  }
>  
> +static void read_compute_fuses_from_reg(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 ccs_mask;
> +
> +	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
> +	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
> +
> +	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
> +		if (!(gt->info.engine_mask & BIT(i)))
> +			continue;
> +
> +		if ((ccs_mask & BIT(j)) == 0) {
> +			gt->info.engine_mask &= ~BIT(i);
> +			drm_info(&xe->drm, "ccs%u fused off\n", j);
> +		}
> +	}
> +}
> +
> +static void read_compute_fuses(struct xe_gt *gt)
> +{
> +	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20)
> +		read_compute_fuses_from_reg(gt);
> +	else
> +		read_compute_fuses_from_dss(gt);
> +}
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt)
>  {
>  	int i;
> -- 
> 2.40.1
> 
