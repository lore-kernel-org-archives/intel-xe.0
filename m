Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA63CC64ED6
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 17:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4946E10E061;
	Tue, 28 Feb 2023 17:58:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C0610E061
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677607096; x=1709143096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s6QzMVAM8Z4FWYX+opyvhdpDB6Njkjjc3T1W3EJ8bJs=;
 b=Ym5EUbe1loFc2AIqYwfcIJ9o2kWQ095PMwe7xOkfshGCl5+wV/KSdj6J
 s3+sTurhulvnPDEcGsPJXiqeIZvAn7IOqA1SsXaho6uVYpEFMZsMWSvQu
 HqqsmnOYzRaRA2uM0slbUkELQrsgxyMkC9YC8dcVCuiMhOnG0edE/h7hS
 j6iVBXvej/gGdK8EILzDhGx0CI+2h8+xq3LrYsC2CDTWM3Uhmf+Mj1Tg1
 47VcGqVceDYCRdvydxyeaYqPgEVfs3z7hITUvtyHAP1W9GlGRKaLpZeMN
 TNZP3Ur8Xv7qUCx00luyNkEyj74WfgcPNWgXa6Xzb0gkK0/gJhW75edgG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="335695665"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="335695665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 09:58:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="651685719"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="651685719"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 28 Feb 2023 09:58:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 09:58:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 09:58:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 28 Feb 2023 09:58:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 28 Feb 2023 09:58:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C859PBz3woG6NyBhM21rBtM4k2nA8U5v36gvcmiC215LYciOMw97IKejQUHfNQyg/MmB8lN1jqVO66OYnCfinOHWbAesbF64ugqGOdBCfk3q1Oive4zPAWeg8JZcLh7I6alqPI9vz9bhp75AHiEenFY5TEY/dRgN8L+2Ik7RTWCm1Al5jjnCMcm9zRA34BaiOaB2JcN+QEMs4YqhY5YfCJ2ECXmX1SDWrMyXuBlFaODwA6jgPzJBB99RothiHi7KZkBhS/eO85sYSwi56VSYds3YL84lmUWcwVj6LT/LfDu79hsgV15qscOemq9YpODq9VKy2MouvFqmLSiV07oghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tagXIXI1BUifHT7KCnSv3b50yNtdi/lWHQZEk1rJfZY=;
 b=FgNEHBXHIHl9F1RqptQJlDn3yZKa8zbJqeLUUKkqM52XfFsVoX7cm11O/3atwQPT+G7mAPu6OWaEJhOHXN1TiW2lMaH0aeSsi1nEJdmfefC13KZ943tHV+ud85jiH5mD6KOnQqCV6P9GT4Ln7eB3bi7yAgkr1VNt1Hk0pcHXwJWyl0na3Qu6XJ8mkaFxEjn3iwMOtbBJPer9VlwUxKXovzTqTb2S07VTjZf4fPiq2GNfrY1VTr2yFLAzDG/MUgbnDSjD6oVdsvNTaXm6VdiIONO9pNzBtbcQLxWPyOIxOhz5RysDPdtxMzz5g/JtP2qdtq+G8dsYWqeXcW7HJHSdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6191.namprd11.prod.outlook.com (2603:10b6:8:ac::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.26; Tue, 28 Feb 2023 17:58:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 17:58:00 +0000
Date: Tue, 28 Feb 2023 09:57:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y/5ApHFXGNUw02gw@mdroper-desk1.amr.corp.intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
 <20230228104137.80965-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230228104137.80965-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f36c06d-62b6-4942-a532-08db19b55453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecQ7DILiGZVHtVW6egktrh4yFRG0RoIBeCIuLKRxuyuq0AZ8srSKjb9VkRBiVB7bkTxAyBMjDDmNjL2Y9rWK1T6QvIBnnVe5wikdcCd/mey50REL+D+epMO4BVzVe8/l0e6v8LXfY5lawboFE6B4GlNO9qOowJXSzq5iKVL7FHfYUlTDHc7Zw33OBXwicWkrpEZv0fqkzd+I1i6P7he4Ve8U+5qvaM3j6aQa3j/zv/hxsRBvBkEjUeGe8U8lVXMv6ZO+BZGZwbED6qRLZnqA9pG+6xf9CSJy/qU/yLYjPvDpkDpRJzFztg/6ZawRNteum96o8UD4ZFYIjMXS6itkanHNzxI019Zfa8e75f5IK3qyevUKDJNARIL0ZtfnuZkbBo4hZZx3d8D2dm27DZQqQ50vctDbbH4nJhfbBU59RUbkPY+zDqL5kRpOxdaFPlYoBlP9H3+SWLuiBgBfm9cZ/BX75xIs2qG5RFeADzqUunITVqRLp2jU7jlqOD+vUZozkAfoBTZIOQXkNJcjbO3hqRSlEeo0zR95ENssaAJI3+wwDT27MHq/fudzdX5TDM7JWR/5MW7u17bAoNBgnNpOo0TsaPF+quPFwZFUaEFPzM6LLnfarZkmx7tTCaD2qdCA4JF2tPMJHRN9Bw1dKbISKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199018)(86362001)(4326008)(8936002)(66476007)(41300700001)(66556008)(26005)(8676002)(478600001)(66946007)(6862004)(316002)(38100700002)(5660300002)(186003)(83380400001)(6636002)(2906002)(82960400001)(6506007)(6486002)(107886003)(6512007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DiuSwQe2pamG/HHv3uM7JW6pr3IpK7pPw87dpaa2Q4XyWATTmqf0NNEpCgrL?=
 =?us-ascii?Q?0+bWv1I0gQoyue/wcd0hYbunYOF0/lHUX0SUDN46d7yngxcTCiWIh5Unfcpg?=
 =?us-ascii?Q?T1huV5e18jdWyodYURAw/YEP9WIWXqyByYmXNrhZvUMf9y+hLqsCNTnZmHRE?=
 =?us-ascii?Q?1JR56HvMRDfHq+9meXEVuacXc+2lbE0rbFWye4uQJ1vhzZryJB4yp+0HCN2D?=
 =?us-ascii?Q?C3/EO37M1oxmVaEcxXzGvmTZBxZSoulSEiqUVOiPFZ+BJ1zuvxRsoLCoJL0C?=
 =?us-ascii?Q?QaUSnTeFgw0kzRvq3jPoxuWlDdxb9FHUeqyvP22+AGNv0O3P2Y6uAs4Ayy2R?=
 =?us-ascii?Q?XBWfB9nEADrX/xjqtwaeFID1skfAld8OE6GhnJgh90igEPxpJocO7b8OvXym?=
 =?us-ascii?Q?+fvmtYO5+/heobgeU7PF52yeWUE6mmQkIebT2OUM0ujxmwp+KT5D7w5fSTv9?=
 =?us-ascii?Q?eABSUYO8MhOz+GK8YkhbNfIIF8hoxIx0EVNQCSSIgtLfny5Jz/pFnIsN6jh7?=
 =?us-ascii?Q?u/DilLJYt1W7HsSQbI7F9QYQFkHz1OgBSZ/ixA9lGXIxzBzoW85Q8NFSH5IC?=
 =?us-ascii?Q?0Qhxzltf/ZZedU6NiZwdd9ZF/Hpc9+Mnex4HJrqonckRPVXtBotVXmJsj32O?=
 =?us-ascii?Q?C0qErcQ5CFPSiotzq5iEGgKneYre41rSrs6LF5h0kVsArnqB709xYyAic74K?=
 =?us-ascii?Q?+tB/SxegHseOznRHSmJupzzgOYZ1k6YqHfMMDRelEMu3pKnZGKpPEjWGkAuw?=
 =?us-ascii?Q?2//0fxIeUgumMOfVFekbblfD0BpVGLS7bxyvUvfyN4QLqQCV6ZhGi2P02gsy?=
 =?us-ascii?Q?fnrs0RwmEv0EbDWktIaCjE8QElTuxm3hSa/c6fi9Pl+o6j0iiwHxiGwCRPK1?=
 =?us-ascii?Q?lz8FozTAanLWeNpbzgnD5Iobg23F/OEAxHax6FksixD7IeuEz3KBcF8hjBnG?=
 =?us-ascii?Q?0TMLaF3qnBsOYgzOwcVjc6cLIgP+D29d2VluYsA0/UmCLarQ2KuZUc9c42Wd?=
 =?us-ascii?Q?sSLdb943ZyW7cjrn/O2NG+gYwuq93yH8v8MT1N5aVGT0BygBEwSy/AlPbSp1?=
 =?us-ascii?Q?aI++5S/y+A2c8g32Udvhmd4uDAlAmaozDBXSzFjM+3eXafuhRrABlnvl1Hph?=
 =?us-ascii?Q?TE82ZgYJUEZjNkvtrtP0RQTSm9ysV4COnmbQ3rTYGpP5e1DS4OYpEaP/sScp?=
 =?us-ascii?Q?VKkmB28y2OKbAN3fUqirqVvh1VYPATirsq+gC10v197jIG5pS+aBSCr3DWgn?=
 =?us-ascii?Q?QNJA3jTtZeO0WD1OG55m/8tYMBjxE3JH4eniFrw+dkNMJTcPt8V1QRtHLqXA?=
 =?us-ascii?Q?zZKbZVftlUWwK20zog3UnAopk/aM0Ovg54vGJYlga8TCoa45gFdaSlbdtZCU?=
 =?us-ascii?Q?9DFxbrST5jn3WdCxs0qeA3TT0vJOMVa7JGHgYlercuYN8JwUVmmC/AnCdJGK?=
 =?us-ascii?Q?1DQ+I2EJT1FEgzMOuspQYX+pwQI83QOwkW5yarWBj4/jUInHkXqQTr6M1bEo?=
 =?us-ascii?Q?gP9OcQBnEDRBmgfrs6yNGcswEQBpPeuZhKl3nD10rDigfGVEdECyzlQdE0bk?=
 =?us-ascii?Q?lYMMDX3b5mQdWqva/tayE+epVDbxb+QcPsNd2WL0JogX28HVegVdVakGyEwN?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f36c06d-62b6-4942-a532-08db19b55453
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 17:57:59.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EWZKp6AyefA97dWQaa1U9qCWE3ho7I6jkV+GI/Jg0kmP+1OCdQs735nQo6ePQfYaVenDtfMxx85urn87viXBxzOyZNZ5SPgXBgFMhpFHL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6191
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/14] drm/xe/display: fix IS_ALDERLAKE_P()
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

On Tue, Feb 28, 2023 at 10:41:24AM +0000, Matthew Auld wrote:
> On ADL-P we currently trigger:
> 
> xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)->info.platform == XE_ALDERLAKE_S) && !(dev_priv && 0))
> WARNING: CPU: 3 PID: 338 at drivers/gpu/drm/xe/display/ext/intel_pch.c:32 intel_pch_type+0xce/0x2f0 [xe]
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/display/i915_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/display/i915_drv.h
> index da83a957dd86..06348cb03f44 100644
> --- a/drivers/gpu/drm/xe/display/i915_drv.h
> +++ b/drivers/gpu/drm/xe/display/i915_drv.h
> @@ -73,7 +73,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
>  #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
> -#define IS_ALDERLAKE_P(dev_priv) (dev_priv && 0)
> +#define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
>  #define IS_XEHPSDV(dev_priv) (dev_priv && 0)
>  #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
>  #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
