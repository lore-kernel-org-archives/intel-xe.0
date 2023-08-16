Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70462C27C42
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 21:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BCE10E100;
	Wed, 16 Aug 2023 21:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C731710E100
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692221155; x=1723757155;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2pPaBDEPOTCX7veecV3RXDX/mvC+roXL0rnv0xi6zTs=;
 b=HvLy97p7IpJj3Co58pos0Y8fxBxDz6xnSn+YGZ6L6SFEJ7/WWCFoyBt6
 tkegBBWy5DbOhzBycUTs/rQRrFz0ZCtN4cCKnB/I3HEoZCOz+XAo/SLka
 p4GwG9DwS61h7467ts7N9ugzJf2EsJw5VWvXV2sK02ucTX6fIsyW+87Iy
 PxXluvFAoN4tVBBGgT8feqoU0O+REMfjbAYP2xMQ7eCEiioEEZZeQ6XUm
 jTFESVFrtbc6JkPeHb+JUPA/SR/lfXMGKiEa4qoPrNIx9ghM8LXeopkS1
 ymrk5oNALbQEH13vDPVuWUDN14C1jyyprBhXqzFMW6T6IlawO7m3fDsQI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376379680"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="376379680"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 14:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804383984"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="804383984"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2023 14:25:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 14:25:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 14:25:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 14:25:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 14:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvncEUJ8c9iuf0o9VgwlUycBgW4zYWwWEvrq4+a0BkNesiW/SjzSHNbS2VPwsRLDiXPMG/x96UCI2Ir1AYFQP46DHEcillAh3hLfOWJOcvGI8rU/Ly+Dwx5R7Qx0YxAn/1ZvgR4ECw+FryrlYaEnqhVNewiYXK46pI1mq4pY7nFAfcbwIhQm1kjurG09YSh75nLGly3axCc0B7UxstQ8Py+GfEFUDRiiFce2QNIMl4PRSNc4vOlwCiTp1VmZoUOK22ycJcwIWesuD56PqT+izw+TExi4xrjYqn+5UGeqC8x8DYjRKyMNzV+hpgnm+kZ+Vk4HU+ijx2Ed6Xg/Msp/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDsZij4V431d7BzZ+pPeBBntwPVhC8rVyjGgey6iVAk=;
 b=A2b9A9jMWo8bS/ZLzblMH9zKaVz8C6cvEkyz+rhmR/b4LSIXLGbWL2qc4Yf1fPTLDtKF+QRKW/J7CT4rkrj4Sgr6+AFvCvosVeIWQ4NamoSKt4GbtGBrEMgLhIko4zOUfh8nUf0eHArvFn0MYTBRreMp/M+/eTxL3fR4H2N4yAU+7PdG6UIpA0INBVxpxTY3ZB4X8yHzaqakWYHBtgeTQxiH2G/RVuhso/YiqGoCrPH+wmfgWuurg3eK76GGA57Iu0eEG4hcx554vs1KLUE29Zao1HpX0glXkp5hC+HQgVLns2nUszgGPKcusqeWt2jFm8kYpbHVtxcw2E6UfazGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 21:25:34 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 21:25:34 +0000
Date: Wed, 16 Aug 2023 14:25:26 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN0+xhX/2vgz2IHB@msatwood-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a548d3-80ea-421d-2652-08db9e9f52da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR0QjQO5rw/IiuwzKoRnk6N+Nij3d9NRuZO8HsZGgpWhFxCfdkE1DR0sEbA7A1fdzD5VDgsscRH7gGOSsZ5fCd4ST9DmzGDP0J5iBiEImGuzERhS9VYt00Vr4d6ZO/tyc9E00do+SnnUD2uJQ2ViYiTwArTPoNAmPRoUnnGQfoZe1bBEplGiHxpFx700gwBCaPba2zwUVTeQ71shVjO78DqIxKkenuPFNYOc3G9MBYDIJWf1l0zqRTO0SVp4ARBr+6Dyv7SBF93zGB+nRCA4SvjF2masRLNWcG1CtzS7CE8xR2qEQXZFv8cwcm8qWA37wtl6Xck8Lh3ER7PQShPAjDAVFb4xsD0duVZqxGukRuu9DywmTjFm+ikr/KBivTamV3VKuERA113W7aS4GVNLN0X4R7p20VYjhkoWKJ0SjytsItMCMtlWnn5zj3w2fzT/GQnyzpeCPRk4oprVVvCFBodSr3AZBDSxC8359dX0xh/Uwid9RabXBO8d5KLuSzJ3i4TTq+bVXqKM4u8ZAMXI3ueC7FcMBgF0+pIlbtAeZ2kr6WtLr/+I2gWT3Qnw10zE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(136003)(396003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(86362001)(478600001)(6506007)(107886003)(6486002)(6666004)(6512007)(9686003)(26005)(5660300002)(41300700001)(316002)(66946007)(66556008)(66476007)(8676002)(8936002)(4326008)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emwrTnJpUU9seXNLSGcraEJERC81VTZ1RkdtenB5WC9FM2o2b1o0UFRnSUVE?=
 =?utf-8?B?Zll3TmJXcHcrOStwWkg3S0JoMks5YlZSazV0Z0lMN05wVFc4ZEJEMndKNWpa?=
 =?utf-8?B?VTRRVy9TTDdSMjgrTUFPVjB0NVNJYzhPU3d4UHlCWjZHOEE0aWxxN0M1Rllk?=
 =?utf-8?B?RHJVNkVzVjVZM0E4VVJLUW5VVkJ3N0RyNXYvZ3QxaWZYVWhsNFNHcUEwSkdz?=
 =?utf-8?B?elFHN2ZKZnVvaUFXcURRVkpQeHFvTERici9jOEUxTXB6ckdBSlhBMmtHYzdY?=
 =?utf-8?B?ell4Wk1WdjZyeHNCM2x5a2NJM1ZGY0pNWThkNWJaOHpMWm5ORHMrUyszZko3?=
 =?utf-8?B?T2FCRDdObXplUytMbHlRYnpmSEJBZzFleVBKZFNpaWd6eWNoRUV1dDFETWg2?=
 =?utf-8?B?TXgySy9vMmV3Wkx4NnRoRGJJenJRQmJIc2E1d1lwbVUvRlRITm9Vdjd0OVpl?=
 =?utf-8?B?TkZuSk9nQmFsR1FIY1hIMWdWa1R5MmdQbHNHLzNyWU9SaG4vS3ZUQ1RFTGpx?=
 =?utf-8?B?em5QL0tkQXJOanJXRWNSVXFRbDNHVDBOc01OVndHN3BuVm5kTGlrUDJSQlhz?=
 =?utf-8?B?UGxYUzVHdklYQ1ZrdWQ2VWg5Y1JwMUM0Y2wwSytNWkt6TjI2RzA0U1NLSG1J?=
 =?utf-8?B?aDlIWllRSHA0b1plM3BrNTJwdnlTaURHY25WTmhtTTM1WVlVbjRHVXFuQzdv?=
 =?utf-8?B?Y2lQaWNkYUxTbWRndGo1b3VnZ1IzSjg1enV4T2pUK3RHV1ZoK0cydDUrVEJJ?=
 =?utf-8?B?ZFQ5RUpkMlJ0Sm00dG40VDV6U2VRdURVQ2lPbzhIUlg2MnN2a3lPVTFseTNy?=
 =?utf-8?B?a1ZXYVNvYitTcC9GNDRuekJhLzlIOXZ4TmJGZnp3YjVEZzB2Z2ZFYlN4bnRI?=
 =?utf-8?B?L05lQXREZEtsL29MVXdXajZGUndic2drNDF4YkdtL1NiSGV3QXhpUjVjejFE?=
 =?utf-8?B?TVBJVUZKVkpYVnVOUmxaZ2lJME1oZGtVTWJzNGV2OVRVU1RiTTdtWUR4Wmds?=
 =?utf-8?B?ZlBOMEpCN3pQTSthK1ZrWmhzbERCYks5bUx3eTRteWtFWjFsRU5RRCtPZUd3?=
 =?utf-8?B?WThMZnZBQm9MQXh4bUxaZG9hU0pBL1JyM0RObkh6NGxIejFxUWdTVkpvSUdY?=
 =?utf-8?B?QVF3ZGpQUGNpQ3pxaWNvR0dYK08yeDVWK1kyYkFWbGc3azgyNjhnVkp1SFRH?=
 =?utf-8?B?eWl3TjB0SjJoQnNyVVJIK3NrWmdpdEc5SzJPNEtPVTQrWCtMTGhLbkU1bUQ2?=
 =?utf-8?B?NjNiaTBOMzA3V21pR2RwT2pCNVRkNjNXMGJ1QlRJbXdBQlpYRHBsbFJPOFht?=
 =?utf-8?B?M0F1R1VkWXQvaXoyNks5THdOMXNKSzJDQzVHVVgxaUQwSG1UcGh0L3RIdzFp?=
 =?utf-8?B?bUl2WXJlMXZ0VHp4T0pIOVhqZmRMZTZBOHRSQlhic3lNWVZJbkV1WXVJWmhw?=
 =?utf-8?B?MjRtbTdUbVU1QUg2YUZBSWNkaktDWFg2c3Z0OUxKbDBySHl6eXNLelNEak9X?=
 =?utf-8?B?ZzRHWHFsTnJLUmh0cUlLWmswR2I3UFpoaVdjSkl6VzBOWTZYMWxxM0UyNUcr?=
 =?utf-8?B?UGVWWEV6dWVrcnFFWTMxdUFZUWxRUXRnMXd5UzNzOGwxNmxwWVRyV3paa2ln?=
 =?utf-8?B?UlRNdGN5b2J3UDNSRXgxMDN0djFMMy8rdUVDNHNvSzR1WjFFcHJiUDJRQzF1?=
 =?utf-8?B?alhyeWhuWFdRR0JNOHNYaHcyQ0hpeCtDOTBDUzVCQWdwS1Z5R1d6d1dmYXhy?=
 =?utf-8?B?UWcrdytPdG5mMVAwbFpQeGd1cFRxQkMyNFpKTHoxYW83cUZHQkZXK3J6dDAz?=
 =?utf-8?B?M2w1SEo1WS9ZRys1YldUN3FkcldHQlhZWGVNVEtYcktQUzNaSjF1NGEzTWtY?=
 =?utf-8?B?MWhDQ2VmQUVJSzc3M0o1dE1NZmJXaDdVK2lqZENDZ21DczlsV3pIeUhwRzNv?=
 =?utf-8?B?RXBFRjc2a2IxN3VrdUVrSk1SSnJ1ek9aSU94T0JUTWJ2TWlpTjZWbmZ6Yjc0?=
 =?utf-8?B?ekVxRjkxTHFiaVJybXpjNE1KcjhxZXNGa3ozQks1aGRnSmlKNzNzL3owbTYx?=
 =?utf-8?B?US9CQTErNndjYzhhcEllUi9vdlZhUlBjNjNtS2Y2SVVvaS9SQ3pyZmMvN3M3?=
 =?utf-8?B?MEQ0MmN4MDd2eGJVOTh1YUtJNDNqeVNUKzIvWHBjdFc3UWtqU3hwL2l6TTNa?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a548d3-80ea-421d-2652-08db9e9f52da
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 21:25:33.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujlCO46S7MbR/TrB9p6UcMDLwpZzyLIoI+X0Ol1YJbZ94voDzQNRoiB/fZZSoyMc0RvkHXfqTEs4iz/Tjo/N8Ys74Aiwh/NtrzRl7mW2UbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/15] drm/xe/xe2: Add GT topology readout
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

On Fri, Aug 11, 2023 at 09:06:05AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2 platforms have three DSS fuse registers for both geometry and
> compute.
> 
Bspec: 67171, 67537, 67401, 67536

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
>  3 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index c93d8f8cd93a5..ad7ae6a28caca 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -164,6 +164,9 @@
>  #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
>  #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
>  #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
> +#define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
> +#define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
> +#define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
>  
>  #define GDRST					XE_REG(0x941c)
>  #define   GRDOM_GUC				REG_BIT(3)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index d4bbd0a835c22..a8d7f272c30a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -65,7 +65,10 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  {
> -	if (GRAPHICS_VERx100(xe) == 1260) {
> +	if (GRAPHICS_VER(xe) > 20) {
> +		*geometry_regs = 3;
> +		*compute_regs = 3;
> +	} else if (GRAPHICS_VERx100(xe) == 1260) {
>  		*geometry_regs = 0;
>  		*compute_regs = 2;
>  	} else if (GRAPHICS_VERx100(xe) >= 1250) {
> @@ -90,15 +93,18 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	 * Register counts returned shouldn't exceed the number of registers
>  	 * passed as parameters below.
>  	 */
> -	drm_WARN_ON(&xe->drm, num_geometry_regs > 1);
> -	drm_WARN_ON(&xe->drm, num_compute_regs > 2);
> +	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
> +	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
>  
>  	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
>  		      num_geometry_regs,
> -		      XELP_GT_GEOMETRY_DSS_ENABLE);
> +		      XELP_GT_GEOMETRY_DSS_ENABLE,
> +		      XE2_GT_GEOMETRY_DSS_1,
> +		      XE2_GT_GEOMETRY_DSS_2);
>  	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
> -		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT);
> +		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> +		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>  
>  	xe_gt_topology_dump(gt, &p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 35b8c19fa8bf5..48fd698ff62aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,7 +24,7 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS	2
> +#define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> -- 
> 2.40.1
> 
