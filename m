Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9212CC54799
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C9810E094;
	Thu, 17 Aug 2023 20:00:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5231510E0C7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692302457; x=1723838457;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lwp2CaYkcDUzBZ22b+wXnz27KjxkCSCgVhTSVJZxMhI=;
 b=F9sShfh2zT1HHE+6WO0i22a4DQmRwDPKvMKwETLPYIVMoGCq1xUdyYcQ
 ePzfMGAstVo0TJTGosv0JFrwS+clJXXfd5UQZwAWmkXRw6C0Y4bpHUOMK
 33Y7hZ9BbUToBx/gU1KMbKWzS71pxtlyIbHYJlMWp6i/YWEnglbAKou7h
 l9GGridxH+vvnkNQUwhTvoqMBoj7uyWVkrVR1IpdxsPRX9wX+QY9jLd/M
 ibSkrgnBhiMbOsOnEfOhv1JMbaaOcdhGEztYYRZPX2dgMeQb0gsPWZqOi
 JoEUTtMkyEgjBEOSFsnWcb4ZcSJyk4RES0xGsJ3YW0c0Q+fyJ8THHlLcW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357884101"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="357884101"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858342948"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858342948"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 13:00:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 13:00:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 13:00:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 13:00:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 13:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0qhewIRUhU4CF9RRgN1S9kaMGjR4n4rYTssAJUxiAgy7vtkrzLFroUvQSGUuVB1246b00WCsanXhtfAladg2j6Hv3xsZMqw8i9tvyoR2IxmnJPbPLuvsbqyf0aCnO1AGQv2P7yBBqWDT04xflklmLXKBo5G7AYvvUqpqicvtXaVh6CPGCjWylj5FGvhYUPlXFFZzjfYvUrxBNk4SQyYXvOUoj1xQuTBbOh7OqRck1Gq13baIQQnFOID+yp/DlclPTBYwm/1rBHpfJUgglGG60XXOWNUPfGfiFMiVxHdpnDtCrTD+8yEM2VlrXyt7zNbO2s65ihwUGHaU8wgHFlUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LKOCvA4idKmOtI88oPOM5TpNlV9JI8a8Oltk75kV98=;
 b=VucdldPNHn4cb/M66hwNdMtqoYlrDNCnkcGm6X7PyyyQ1sDORzKSijMjkZ6Bb9Fhdddj8dd1l9dyaFi8wQTYZLrBzBHmHhRpWRZ7V/M4UwgIS84762JS8LbllTn19opd/fOXfToym4Ui3TMDy2wUC1bLYtlDd4c2kYlvtjr2mvIaGmFVIbogfwS+02ILUmMjz2+/rRkIykiYJwA/rqFf5kp6jNDdKi+Z+G4K3JPRxi/3vOED2ChfohvSzmJ4+uA4seiGogK2yeAuGM7Il8ekxDt71el3W2HTMJA4eCmlmE9R9ljKclJZjEB/hNzCN2khbBeXUorcy0c8xGF1DUr5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 20:00:52 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 20:00:52 +0000
Date: Thu, 17 Aug 2023 13:00:43 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZN58a6D1Woh0KlJt@msatwood-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 9281940b-5084-455f-85f5-08db9f5ca842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EfNa25FPNblE5Vt0b8hbiHAR8WeYYks4IXQ+HyB1oB0vfS+LmNG/a/jWmnVsy9UCplyeUVhVNNfafN/4LTZm7UbpA1XJp1EYInByNkIfrT6DKlVQAnvYLP2jaxFolqE6C0SJpqsdZkcOpGFK4/aPWU7Z0P9ElAYZAWl7ZoGNd+m8AskoRcVobE3X/tmWVQMJsw7IBQ8QW6IVfjd7Fd7p03+zkUL3SzrmS2wywbq7BXPaYyvA3xtuhz51yNGXRe54GEMbcLdnqiyS4iL2WfmejMYGJcyh/uY1rdcrvO9Qy8cl8Uq3oxTSIjjk4NsXqAcxQQHZoCwHPqVCw+lfRlevLL1yBe+luca/lrcWHJWL6d0re9l7uG35D/RAJnJS5pzPAg4aOxrlg6ztA/zKV8koZ44d0hpyv/aD+fMsUJAvk3Ppdc86wxB6C+XASPGJFtcyiYa5MZr176YpxwQ57SYINeKQSkkefQ6IlvH4D70s8aQaBBFMdtdNO01YpQ7cNkHrt3bohjI+d3yAu6Mk9Bdwk/t+ARmB0avFZ7OZfZKc0dD8zkIlP/oljxpx2rQVAIWa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199024)(1800799009)(186009)(83380400001)(66556008)(38100700002)(82960400001)(66946007)(316002)(6636002)(66476007)(478600001)(2906002)(41300700001)(8676002)(6862004)(4326008)(8936002)(5660300002)(9686003)(6512007)(6666004)(6506007)(6486002)(107886003)(26005)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVhibTVUbmRxZjZobXRTK1hXTC9vZ3Y0alZ2K001UnU0ZzQzbE5ydFo3ZE81?=
 =?utf-8?B?Vk1tQTNvKzYwYzA0RmdsUksvY2I2V0cxMit4NzlPbUQ4VUVHeHkwSVhyb3FD?=
 =?utf-8?B?cllSZEd2WnRmRzAweU0zRWRnVXp5OC9PeWh4bEJvT2hCa2xUNC9qeXVZOG45?=
 =?utf-8?B?Vy9wNFNTWkcrZ1cwUktSYW84N2JIaVJsRzU0eFRDdTNOZzlIdDhMdG5XeVds?=
 =?utf-8?B?OVRpc21ubGxkeElyMFd0S0FoeFdPYUVaTHhWbGttblBScEpJeDVpQnd0b0V5?=
 =?utf-8?B?U1NQR3NZbVhTOWgyQkkwR2NNSEgxYnpnZkZJRzkwNlZibHpUZ3pLT2JoQkx0?=
 =?utf-8?B?cmVRaU9rLzZmOW94WmhkcFIxMzd1b211bUk2LzFWV2NaSUFhT0h5NjBFRTZV?=
 =?utf-8?B?YTc2bEpnYXhYNmF0TjNTcWZ6aXNNdWZKNkQ5dENENEd5cEhTbXlMYjk0OXpy?=
 =?utf-8?B?U0VDbEpBR0VQUlRNSHI3YjNrQkZpZjVLbGJxTG9NQ3VPY1Q5OHQwUHRycnlB?=
 =?utf-8?B?LzJiQ3ZwWmU2aGFJbDM0MU9MeFJrYzZpOVZFTkd3YWVuNGhzZ2tCUjd3eTlv?=
 =?utf-8?B?UEErL1VsT0dFOWRMWWtVT3ZtSDhKdFdyR04wNUV2NlUvQ01HVDlydTNZL0J0?=
 =?utf-8?B?NkIrR1k3NjBaY2VCdm1kZmZHQkozM3hXU3pEK2E3Ui9Bd0V1V1ZoM1dIYlB0?=
 =?utf-8?B?TXlEYit6aE10VGRLRWltcHVRWVJUNlk5dDVqWGlWMnRTRys0N1VwQTJUZ2pH?=
 =?utf-8?B?MWRCQXRIS2thdmpDajQ4Zmx5SHhNdEd0elNDOW5UMnB0RVNuL0J6aVZyTFBj?=
 =?utf-8?B?L2RNQnNMdmYwNnBmblhxZWVkSk5rQnNDUEQ2alAxNVNrOVVaR0VuUUZNK1lh?=
 =?utf-8?B?elNrbytVMmpXaEJGSWdadWxocHNtcjJjRDdrdldoTml5UXF4RStQRXlZbkFU?=
 =?utf-8?B?YTNYNWJBWlIyM0NoU09KMWlmVVhIOHQ1WE5wRFdlcFFML2g1ZEllTUVaRHND?=
 =?utf-8?B?RnJub1hPWlNJRWkxZEY3MmhOLzU0VWRMcm9tUzMvbjhQSzB3UlM4S2VXU2JB?=
 =?utf-8?B?RExKZnpnRHF5RmZNOGRNb0dXYVA1WUw1RDVTRUVTYkN2NXA4TGYrc0Q3aWQ2?=
 =?utf-8?B?amlPZHQzN3BXSkY2bUl4TDhuWFFmZ0hCQXZmOGd3Q2ZObGlXYXpTS0Q0b0RM?=
 =?utf-8?B?RjF6MGFZUHcvWmhOdW1ORjB6bHVPaDR5S2craTg1UThxVUxxdU1vVXhFYWhz?=
 =?utf-8?B?clVYM3hCMmcxY1IzejRWSmpOMTArMjRWS2JRMkRQL0RQQ2V4eWhFWThXWElw?=
 =?utf-8?B?K0tUcFJ4MjZRR3RDeVFiL1UxSTJxbEM2OFpJajhRWVdkUWZBL0xVQTdEd1dj?=
 =?utf-8?B?OWN0VVVoeTFWekd1Smc2b1RSN3ZkKytJK0xsZmFwUXJLNjdqaWluZ3A1VEJv?=
 =?utf-8?B?Yk9KUTFpcTROY01mMzZIQ012MjQrQmJaR0pWaUhyM2p6anNPZmtyT0VmbTV5?=
 =?utf-8?B?R3hDMmtJcnpzZmhwMmZLWmxEaGw1K1FORjUraDgzZHYxOU50MmhuUm1UblZs?=
 =?utf-8?B?MDUyMGRzRnJ6UVA2ckp4bkNYdGF5cmxNdFJTZ2d2bUZPVHFtQU9UNmZmZkZT?=
 =?utf-8?B?aE9KV1FMVnFIVGhkQnQ0azgxVFFib3JaWWZSczFOYlV0bXFlU1JuUk5mVktu?=
 =?utf-8?B?MVJ6dm1GVDA0V0JRZDZPd0RoRVhYdW82S0ZDUlo4SGZ4SWFNNWdTQ3R2VHNw?=
 =?utf-8?B?N01zKzIzUjVQSHRmYnFXdnp0SXFsTlpONnc1clpGcXovT1dLMWx1YlVWQTU1?=
 =?utf-8?B?MzkrcitQamFwNHg5bmRCQlVHRHppVlJCWHVMaFBHYTVxWDlyc2VNZWV4VzNk?=
 =?utf-8?B?MUpjQjZuR0dKeFJYY0NWTG1Zb090OEttSFJXZ0lWYksrcUcyTlM2cTloMVc4?=
 =?utf-8?B?OVIrUzRTdWVXZlkydXpoVzBlTnlyYWtCNXBOdDhMOGo1S3BXOGdsdC92RnlD?=
 =?utf-8?B?VUIvWkhsUXk1empIUkNWeU4wYU5KZ3l0L2JPdTAyRnZqVGwrTkE4R0x0WTNL?=
 =?utf-8?B?Ukp0UmxXbDlVT2ZRUnhwNndqMFRrM1pkSWl4MEltdm9rdTFMK3lvbWdRN2pT?=
 =?utf-8?B?a21pRWlENTFpZU9QRHRqUFBrRFBJcFl5U2UvQitPUTFLOTBaSDRJQkN4bGg4?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9281940b-5084-455f-85f5-08db9f5ca842
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 20:00:52.1181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlhEZ+V2YoqcYDN0mtOs2UbQGsPR8tO43ua2fH6jF3mwxzFpujZXZkL1hHIKXIsJiyENnuiLoTwWuzJQOEyM8Npe44SuEFhtVs6ZKScadkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/15] drm/xe/xe2: Update context image
 layouts
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

On Fri, Aug 11, 2023 at 09:06:08AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Engine register state layout has changed a bit on Xe2.  We'll also
> explicitly define a BCS layout to ensure BLIT_SWCTL and BLIT_CCTL are
> included.
> 
> Bspec: 65182, 60184, 55793
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 76 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index a6479deb62376..896744d4e847d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -423,6 +423,69 @@ static const u8 mtl_rcs_offsets[] = {
>  	END
>  };
>  
> +#define XE2_CTX_COMMON \
> +	NOP(1),                 /* [0x00] */ \
> +	LRI(15, POSTED),        /* [0x01] */ \
> +	REG16(0x244),           /* [0x02] CTXT_SR_CTL */ \
> +	REG(0x034),             /* [0x04] RING_BUFFER_HEAD */ \
> +	REG(0x030),             /* [0x06] RING_BUFFER_TAIL */ \
> +	REG(0x038),             /* [0x08] RING_BUFFER_START */ \
> +	REG(0x03c),             /* [0x0a] RING_BUFFER_CONTROL */ \
> +	REG(0x168),             /* [0x0c] BB_ADDR_UDW */ \
> +	REG(0x140),             /* [0x0e] BB_ADDR */ \
> +	REG(0x110),             /* [0x10] BB_STATE */ \
> +	REG(0x1c0),             /* [0x12] BB_PER_CTX_PTR */ \
> +	REG(0x1c4),             /* [0x14] RCS_INDIRECT_CTX */ \
> +	REG(0x1c8),             /* [0x16] RCS_INDIRECT_CTX_OFFSET */ \
> +	REG(0x180),             /* [0x18] CCID */ \
> +	REG16(0x2b4),           /* [0x1a] SEMAPHORE_TOKEN */ \
> +	REG(0x120),             /* [0x1c] PRT_BB_STATE */ \
> +	REG(0x124),             /* [0x1e] PRT_BB_STATE_UDW */ \
> +	\
> +	NOP(1),                 /* [0x20] */ \
> +	LRI(9, POSTED),         /* [0x21] */ \
> +	REG16(0x3a8),           /* [0x22] CTX_TIMESTAMP */ \
> +	REG16(0x3ac),           /* [0x24] CTX_TIMESTAMP_UDW */ \
> +	REG(0x108),             /* [0x26] INDIRECT_RING_STATE */ \
> +	REG16(0x284),           /* [0x28] dummy reg */ \
> +	REG16(0x280),           /* [0x2a] CS_ACC_CTR_THOLD */ \
> +	REG16(0x27c),           /* [0x2c] CS_CTX_SYS_PASID */ \
> +	REG16(0x278),           /* [0x2e] CS_CTX_ASID */ \
> +	REG16(0x274),           /* [0x30] PTBP_UDW */ \
> +	REG16(0x270)            /* [0x32] PTBP_LDW */
> +
> +static const u8 xe2_rcs_offsets[] = {
> +	XE2_CTX_COMMON,
> +
> +	NOP(2),                 /* [0x34] */
> +	LRI(2, POSTED),         /* [0x36] */
> +	REG16(0x5a8),           /* [0x37] CONTEXT_SCHEDULING_ATTRIBUTES */
> +	REG16(0x5ac),           /* [0x39] PREEMPTION_STATUS */
> +
> +	NOP(6),                 /* [0x41] */
> +	LRI(1, 0),              /* [0x47] */
> +	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
> +
> +	END
> +};
> +
> +static const u8 xe2_bcs_offsets[] = {
> +	XE2_CTX_COMMON,
> +
> +	NOP(4 + 8 + 1),         /* [0x34] */
> +	LRI(2, POSTED),         /* [0x41] */
> +	REG16(0x200),           /* [0x42] BCS_SWCTRL */
> +	REG16(0x204),           /* [0x44] BLIT_CCTL */
> +
> +	END
> +};
> +
> +static const u8 xe2_xcs_offsets[] = {
> +	XE2_CTX_COMMON,
> +
> +	END
> +};
> +
>  #undef END
>  #undef REG16
>  #undef REG
> @@ -432,7 +495,9 @@ static const u8 mtl_rcs_offsets[] = {
>  static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
>  {
>  	if (class == XE_ENGINE_CLASS_RENDER) {
> -		if (GRAPHICS_VERx100(xe) >= 1270)
> +		if (GRAPHICS_VER(xe) >= 20)
> +			return xe2_rcs_offsets;
> +		else if (GRAPHICS_VERx100(xe) >= 1270)
>  			return mtl_rcs_offsets;
>  		else if (GRAPHICS_VERx100(xe) >= 1255)
>  			return dg2_rcs_offsets;
> @@ -440,8 +505,15 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
>  			return xehp_rcs_offsets;
>  		else
>  			return gen12_rcs_offsets;
> +	} else if (class == XE_ENGINE_CLASS_COPY) {
> +		if (GRAPHICS_VER(xe) >= 20)
> +			return xe2_bcs_offsets;
> +		else
> +			return gen12_xcs_offsets;
>  	} else {
> -		if (GRAPHICS_VERx100(xe) >= 1255)
> +		if (GRAPHICS_VER(xe) >= 20)
> +			return xe2_xcs_offsets;
> +		else if (GRAPHICS_VERx100(xe) >= 1255)
>  			return dg2_xcs_offsets;
>  		else
>  			return gen12_xcs_offsets;
> -- 
> 2.40.1
> 
