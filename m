Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D473C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 20:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E426B10E518;
	Wed, 10 May 2023 20:29:27 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3210E516
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683750565; x=1715286565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T4wu3xqhX/qnF0v/YcJaqnpZb7hmkanUlEArAOANaw4=;
 b=Kx/YUkt+32a/hrQCJQxcWTbVlwKNjwgv6pFLS7wnoDbNSSKWZ9zvgccK
 cSRHPlR8c2ZUWeLKCoyHWAWhOgiLi37u9aEuDuEg8ZIjGRw9EvUzX3/7y
 DxxOVL2YqsXtIHf+xgSuo2uTbIJ0IHtWPfGIKuiq4S97m7fvqahjOAlJ5
 3knpxzCKxIJTfdm7ATtrQ3AA9ZMQ1RT2f9qkpgbLdjopyaUpIAqyouLHZ
 5GZjXu2LPxzqfRl8qr50v/SjPy3mrLvGAAduz5BnRKs1gQKRJiwpunGiL
 FXIGSCB05eS/qwSw6oDX41MWFQMUsRsd4VEjZ8KrgjDwsqtnTOcgUQrUF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329932640"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="329932640"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 13:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823665650"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="823665650"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 10 May 2023 13:29:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:29:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:29:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 13:29:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 13:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj8wd1sPdM8x6r53rf2opLF3Q4q6vov0V5DhS+2BQeZtUCoeMFIK8RzFyjIcJ97u4wlBD+V0yEdYjkmx1aqF6RRt5WIUCKlacinq03Ay0BYIacafEZYMVDjg5KtZDMsbIWb6mCg6n8jLlEXx/nt526nR+9l5LS2f+WmmqNTS/XQaaXDHV68tcid2XInUo2JcuKTMeADLSdAAv8JQ9NXIDJPKQou3LhgB9Dd6XVZTF0GOuL7rVniQbso8OMhui2mM1ndTLPfQM3WHuhubCpnx+RKAwnI4PwV1FuE+QqvurQS4EXsBTamOZW6mwJ68u8A6pUyKa+WV/NyeSOrQRpOykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PGcefZsBsNJUlyoScr2Twv9QDuR/QWrEZ9ea19zIWY=;
 b=hXZF5upFi/ZJnPjFCZBjyWl0vBohqjDTs8LQwDvatC4RI6vKIqgUPj6RRmZuErihadlqDEpdC81Xnp/MzAHSKrNGkZbM7t8u9M3sFNrciyDimdgXnBv6sFmcNDE3hhaeKPJmnH+/GfYea2+Q60wgvHDUuqL3/xBkG0B9irx8kfYEwQZdKMjboSr1VXgNUgaToYkNLr25kC9LAS6KsfzOyx928yq6Gfjic2p1pTHx/P45kgwq6XN6iv0S5+Euh9FwmKk1A7lBLYnedc/hGdjMHLt7DY9mcBUO3iQT/G69NzWKxdVj26SDj3Meqxx2bG9qgIIHl6nvNmOVGRp3JXHRkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 20:29:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 20:29:16 +0000
Date: Wed, 10 May 2023 13:29:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ui4rcyti66dcl3qtxpt4qmqz4xfwsczi6ym4svtlyfhh5idlh6@eicqy7iuk4sc>
X-Patchwork-Hint: comment
References: <20230510154644.712030-1-jani.nikula@intel.com>
 <20230510154644.712030-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230510154644.712030-2-jani.nikula@intel.com>
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c18be1e-fabd-4be0-7021-08db519539ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0WuJAYtq9fMF1qFV/I7CzflUSYeJXS/BaIOp9PNCNUfRfGkHde5NbQPAq/OnCDyPOjI+JzMQIJ5s6/xCtRs6hEC4AsxH40fT9T2oeLm25ReaSF+3+5ACVydQuCddW2EOkNPlgqmMYrNrw3wQgbWV0KemZTj1NTEsHMYoPOaAg2hKybtuQUzsoq9ihRkFlcctC3yfIvAoKM3nu73kwdz4IrL3c/LcSZ1cLbiuh3QomUaI0e4PUsUuQojjS/+rKrx5tm3b69d+mEWvR8dPv7JJ/OvgDBuDF/3K/rXFUH91Y/+M9CDRuZ/tqQVEQNzRpRD1fenWfnDcMUqct9Q1Oj1fPoP5VZjYlhBG7cfLmBeXJ20YZ2kX8mA4BET0qj1TyuudjV1tGfVaYpPkY3dYK3scN/9KsSjfYzaLf4nPkkKfL4yz3cGAyS+6JiaPV8LPuzbOMmp47ThspYslwkrGEAgFgK+Kmyjag7XEIz30UaOL59HnnLecohIdCkGxK4wPoM3T+I9Reu+DRVeZVQgGbLWNQO1etZF8qPC2KP9fvAS/4OfdHdWR6gR/AqDdSbE1pac
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(82960400001)(38100700002)(186003)(26005)(6486002)(107886003)(86362001)(83380400001)(316002)(4326008)(4744005)(2906002)(8936002)(41300700001)(5660300002)(8676002)(6862004)(6512007)(9686003)(6506007)(33716001)(6636002)(66556008)(66476007)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KJhbMcknNY5GL71L+rbgYzH44ZoKcZ5KLoMB5dO0Oz1IWsGs5N9Bp05IOCVN?=
 =?us-ascii?Q?daVgG3qQDfpJl9K4+n7K1VcdkjjdUYoGFSN8+F1hKCsxrefxV3KDQF18JOoS?=
 =?us-ascii?Q?7Mi7Fdf/6BQVqrSgcE9Dh2NqiHGSkSNei/z8AlzIzoH+aRLpOdWvuuSWaob9?=
 =?us-ascii?Q?38hr3MaoU9thOZ0/NbKW7c8gjdhoLxRtiNmWs1pjn3fFxuSJieCki1tKglLB?=
 =?us-ascii?Q?cvRa2+mrFVCKTI2AaNywDObp+LV4LBjLdXfzpJIJvqiTkHYYJWcg/ruLecEr?=
 =?us-ascii?Q?HFEEyLNg9q/PJVI12U/xfmlARfA010U5DaIgqwHpg0grsofSrjUsMj/Mmq8t?=
 =?us-ascii?Q?f3X86pK9ZLWwN9fQJjZ8rJ0Fv//ruIpanVsAkNW/zxgHqmXDvNjPiMoZ7Pse?=
 =?us-ascii?Q?sdS7cvzdBTAMUFRBUvDxUuGlCHiDGqQwITRQtz5vbd8UxxhJAThgciRA19z6?=
 =?us-ascii?Q?cucr5SXo2+bmzNZI9RXoa5xlALfzivGOqJVg1g932BwPNK4o2BcWApE6uoZq?=
 =?us-ascii?Q?b4utwl3GD+oR/3AocJT2VpV3ujmtlB8JHMfBAmn6kSrasfu4GuVJkrumVK7L?=
 =?us-ascii?Q?yqYMFoI2kbboDMiNNBo2keDkVsRjH3CaDUTfvJlWWIpVJtVw/jetOoqH2KRR?=
 =?us-ascii?Q?0JV+kULP0CvUFqzXz9q7u01T3mjNgZX6fxfJQMjZZJ2a4fogcASFrwh8Z0aJ?=
 =?us-ascii?Q?78YdCCnHWgykCgvN6Bdz9AMlALzKxnlPrS88fHVYsupQsMO5nGdqz0lqJFsn?=
 =?us-ascii?Q?ugZqsoft643I8c4Ovd0R9jbMJLikrpaJRyUfp6aePM1qeujF9dgpRkyEoHGu?=
 =?us-ascii?Q?OmACFAcUrbj4h+ordwvh33TgvoS3tANDrH+bdW+GMh/TjyftUYX9pHgp4DAD?=
 =?us-ascii?Q?YJjOUfAiV9QUf3lDSnrz/wY0ZfbQxaCiFWlMmrXnHh3qbN7S7NNcIuevzAKI?=
 =?us-ascii?Q?HhHTefXj2xnsgwkpfeW4GRGgZsDz64JhCwIqtSm3ZKiDh+5XMdR2OscfxoNN?=
 =?us-ascii?Q?p30VyPSRDhJcq9dImlSN7YIw4CzdArDwuLc+WeByWDj7s6oYWb5+cmGOzsen?=
 =?us-ascii?Q?ks4FbayDXm+CfORDoa0yF1kppt1eRXhsHUB7dWQgEoRieaO/S/173HnOw5j7?=
 =?us-ascii?Q?4YJALU/ovHhY4cHZQckCmsFTwtbeAO5mKR9c+geNxDQb8jJrrlrA7E3DI+Wv?=
 =?us-ascii?Q?0uC9qS7vMQEuMnC/3kQLbzklRFIW2YfwUctxIKmOAM0rZmMM0JlO+L9whQjs?=
 =?us-ascii?Q?C+UzLrf7nSoElPUsnjnHEFX0EE2Meko91Nb3KSX6sT3ClfkZS+I1hm+KZPgA?=
 =?us-ascii?Q?O6e0rVOzhrQF0wQkS38s1RF+MSQjCAKl24RU+1QUuMZQ52szz6XwEo2OKffR?=
 =?us-ascii?Q?Xo09VTOlcXqmTRmwWHrd/QrYfGDh5JMPD1NDBs4nrOCPdBnNCY1WiXVjRM3H?=
 =?us-ascii?Q?hMp6uf/AE9hDkz9wPSrV8fP5UFxtCkCcpMvuKM3YuHXE/qjblRYQrTsjzoZU?=
 =?us-ascii?Q?If7tvlb7bQaECAkw8LwE9JhSsXVV6vvjSNzpdnTIDzTUtKvOguSKfDPWSKXP?=
 =?us-ascii?Q?nIsNIkxGMYWmu+D0n630h/YgDhQTQlXpU1UPrV2Q43npN+zl4AXua/mLjfjd?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c18be1e-fabd-4be0-7021-08db519539ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 20:29:16.8613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpLpzHZB13UIdr9rWK0YEdWgRxNhvMpbyPh4HhZ0J2Ukv80+iVtTxclJqC3M/CiCdmMnS/KURhVonxG9rjbyl+zuxM1QYrnq3Kge5J8OGr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 06:46:44PM +0300, Jani Nikula wrote:
>Currently "drm/xe: Introduce a new DRM driver for Intel GPUs" removes
>these lines, so don't add them in "drm/i915/display: Remaining changes
>to make xe compile" to begin with!
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/i915/i915_reg_defs.h | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>index a7c4101370ad..eac5a4141bfa 100644
>--- a/drivers/gpu/drm/i915/i915_reg_defs.h
>+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>@@ -218,13 +218,9 @@ typedef struct {
>
> #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
>
>-#ifdef I915
> typedef struct {
> 	u32 reg;
> } i915_mcr_reg_t;
>-#else
>-#define i915_mcr_reg_t i915_reg_t
>-#endif


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> #define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
>
>-- 
>2.39.2
>
