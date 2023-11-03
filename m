Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D700C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 20:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47BD10E199;
	Fri,  3 Nov 2023 20:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09D410E199
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 20:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699042498; x=1730578498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NxxibysYYA0BO9pHkPJ08k+SNRNx75pfqbV+ASHe7IY=;
 b=QO17hdfRabvi/T1Ii8tf2cdB3E0pdpLYG5utcS93nqhJtCdzKHO7jb7+
 CILe+HoiekVVs0A07aE9aGV+waxslM3g3d1q/KcHovD8Pm27rHxBe3uSq
 CTwYdPBXiWX5H2HB1ZRui3DzRKeKVS2WN/jI6QgrfYy4yS6or7+5IzK+G
 s/pYAQSPsWLAincOEA9Qmk359hddgb4hi17HK07DZCqGm2A84VM/8g3Bd
 XyNmqmGljXs32WKcbJ0hn/FA8W7Xcl4swenJBg/4xrHC89eIsu6RK30AC
 u/5DSQixuc8+P5e7suhZL3ib1sbBoE3HorrhNJCrtbnFOzK0SqFoCEyfB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392903699"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="392903699"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765355815"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="765355815"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 13:14:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 13:14:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 13:14:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 13:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6jfPFS3qx3DetphPrD/mQRQrnING95WH3MBE0EZ9kttb36p/OqGeWsOgCefvqxEG/B1pmR2D0BwLfmm2pnO3rW/UdLyterykCy9M/yIa8VAr5/xNGzmE0h+GxHZneCJogiGi0R1DbsLxBLBiNkG5SzVc9RUgi4d92HnYwn8RhTTkU5KcAzbqwgAirFYmsAv/qwdQ8M8tOjPmKnzX81f5vyV0eXBwkV4Dl0VqMoNpk0blWIDI7F0Xb8xS9ThXRiMTdau9Vsqz+ObxKKP22dd0+KOslNgPDv2oUdeycQ6NoCO8O0+pZ/sfG4d5XT1y7QGz4LqZfAPbmigO8SP6O6LWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opRFrUyCjObRBmA7GetWfhbQmeSmt9JwjrZ8f3qfOkM=;
 b=dONIRK8gKtJBxWszHsUsqZJOj8GZqgHXzPxrf3P9CxsybROTgErJxcfPz5L7wBJV2dhdwvibWHgnOuheSVWTiPuhSKfPYXt+hFsL71QoFVs1GTxJkGaQKNEPyj75xXILoJ5Jzf6CB1T6nxsAbo+FEgJH2+D9nVFN4W2T6kqze6LKOtnfM1TJnDs3eqqMQeUOlkbXk24dX2NuNNZWNQ47e96nAwvFrRKiI5SPikdFZx/zQFin137tqh+uRr8VKomQPiY99Tn74iPx3l6gFUSPz5m5Ro7s+F+hK77qPe1iHxb98OPTmrgHYD6aj9dbkGE2yBfXsZU8EXD+IPul5uiazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7317.namprd11.prod.outlook.com (2603:10b6:208:427::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Fri, 3 Nov
 2023 20:14:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 20:14:55 +0000
Date: Fri, 3 Nov 2023 16:14:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Message-ID: <ZUVUuiZHTDVKXRQ5@intel.com>
References: <20231103195338.912645-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103195338.912645-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d8abbe-de59-49b4-3408-08dbdca98ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U3F0FWtfEbIPZO8gPBDly4VqrxWGZ7YHye4ECvK6z4wMPXTB79R0iM4NulBvSbdZlSQ6A4W9YM1C4NkYJspOGPD/Iv1UuDka6YW1VIcJqYdn3MMaDeb1+Fzs9r5w6LXcvB7CeIgxZrs7irVaOWM2A8e2W2NDOgPoGXHb5UBA/BC31QiCGrkR/Yx6Nq6rZIeJZg9520V/nmU+GYg/Eit9c0hEhQZAFz0ON62x51pCyOnoT3ULt5we/Kp4j7+6oArYnGlzdI/Y497ZgLvDd8chl7DS+m7OyrxfSdznEKlFECTCst2qsXgxJq/ADBfvTGIA+z9aH8j2NGxT/hSCa66/JenE7LIDpjwKjXYZ2LzexI4JISU0JSTz23vDJXVzvuwSMsF45G9a/XCWCCQKvVEyEd6NXvj6fQDezTAL99i7thiME/gULE0+bWz06t/GCv4VWsrVkBz/sxm5tSw2FMO4mhZ0DESU2l5m5XCscyhO9TB5WZB6yzWqzqPOBJ+YnjlfdQtK/gSDmBxAZygYo2uGfe7Z5ADbaWAK9hIzS6WSgz88j4gOpPfBrRa362eIAVhV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(36756003)(86362001)(2906002)(107886003)(8676002)(478600001)(41300700001)(4326008)(44832011)(6666004)(8936002)(66476007)(83380400001)(6506007)(6862004)(26005)(6512007)(66946007)(6486002)(316002)(38100700002)(2616005)(5660300002)(6636002)(37006003)(66556008)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nUmkIPKBP+u3ebldlKNAOcfehtaCGnWtQ+WLX4tR1pOxHrvK410Zh4k1f3kO?=
 =?us-ascii?Q?XOiVEEcgzV0+y2E8B6T11HYotmPXlDZOAqK+sWeor7N2Dz75917BP6d1lY1G?=
 =?us-ascii?Q?Po+dOjBv0DwqsX2IZ7hd4t8m7dJWus0bbs/dmBiqtDj1fCcBH0M8AKBcXvbh?=
 =?us-ascii?Q?vTQRHeb14Yn/Xo7FmlQto9jW43vrMb8zSLkFP/u52tiPWV8hV4YIcIile5ho?=
 =?us-ascii?Q?wstPxYEmVBoSc/gQgq3r9qt9XAzYRKGKG9tlSEAZbHEc4MBTEkCfJUPHT58L?=
 =?us-ascii?Q?NkZ98PcBeJRwSsrH4c7I0475Ee97rJB3hSMUDfQBfF6M4+GmOCnJaAYkga8O?=
 =?us-ascii?Q?6USzFXDHaD75wq/vwDKmJJwevUCO/cwSVZvG7ufMvUd1PW4UErnPw2bJtrHP?=
 =?us-ascii?Q?0JpKXUiQH4bN0f2TcHHV0RdCMCtf1L4REEMCgakSGcYvRHLcvfrPSaP2j9UZ?=
 =?us-ascii?Q?eHQ1hgBHizwPeMe8sUL0aekCfL+DLgeH6kckssgAGO3ElmGGBjkE4ep6WjR8?=
 =?us-ascii?Q?JTA9Mm+ifXWafPmyLC4+gL2bio9UKeftwrkL40/TuA8sZJt7Q7OrS+G4qOhv?=
 =?us-ascii?Q?0Nfl3mCUU4DCoOXUKYb7Ef3DnpKtuNMsdaOWVCkrvWgP7xIe1LCbxIPNbmtX?=
 =?us-ascii?Q?FLYsFobG/JFeU+HoqUoGaG31nqNSJ04ZXw/HjuOgcdNv1IEPsoZdRp8r10HG?=
 =?us-ascii?Q?9epqCtxbGgCNSOpKR+o7K6UzlbU2KwnyWEYzNZk2XkQDmPPLVUHEzHWAA8S2?=
 =?us-ascii?Q?wjmhrCxPsSnN67m5rP5N1959kwiarNpxAXyzV7ZTHgS4KNhzt9NeTNHRr8Zr?=
 =?us-ascii?Q?0SBK9HYqBZWIP7OAxwXHqrYAW0HF7HvC1xsmlsW6HKTMQmVHXuVLdbNTQ4bU?=
 =?us-ascii?Q?+CHDObundIx7KvqqImBH/N74TgpqS7bYoVr1TsFmg4ebN1ev9b/cVHqgwF+s?=
 =?us-ascii?Q?474CfcPnpU/eeXZ+vcgGSGMMgQ1+NhXFVky3svk/P/8oGGwz6ttaG4IqfFAi?=
 =?us-ascii?Q?7EQYcauE3Ug2q/dw0KNa7X9uuV859iI8ohsPV1SD/J+3wP63796SjroG8br2?=
 =?us-ascii?Q?51JibSyiRjpPm4tMWbjtHbY6c6HRo30xa2puFkbzg/Uv7d5tDUaVtrG9iaR0?=
 =?us-ascii?Q?KJbN7YtiKC3L/kyZes1LwOnKX+lrTMe7T/LKDHsla4Zoxk08LCRre0F71eGT?=
 =?us-ascii?Q?FqC9RWErofKWybWzjd3a+MAyXd6qIZG8JXngT65gvwDlNaGR6wX7g0/fPQLh?=
 =?us-ascii?Q?8AfBYBqqPqM/wYra/5tXMOD/75ecnrRThvCS0Nf0UaOL6i/Njko5ke1nAq0+?=
 =?us-ascii?Q?j5fHzXDBa9ruWTG1bu4MEpL3AMhkX9qV42oNSKR1Xp/zd6p28RPw6iKuB3GA?=
 =?us-ascii?Q?uAidmOFdFN1kv6YAuLgQcF6nscB6XpsC1S8+IYnEvxpxltauY7MzKD8y0aLh?=
 =?us-ascii?Q?ZJuGCvom1rLp10S3Rqu0gsyjPPZRklK8/PRZ4wXnh5gjZzmzcf8fOas+0hnj?=
 =?us-ascii?Q?lz03Kg0IegAo9gKkpOtQNZPkP/6cV/2vDCsOeIqI2kr7wacavvPYXgVMo8Zw?=
 =?us-ascii?Q?g5421GeKTyqXWBkyXeNDWgR3ub5yAlOAt/GYzJWpVeKQOvjHO+xl3gYY4ubH?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d8abbe-de59-49b4-3408-08dbdca98ae6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 20:14:54.3349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps6iXYkkVdY2XyQxDsKpmchJeYBxodDReGv4DMRdBnf6ZsDDHL9yl/gY86eCabqfYGOy7DkkyLYqT6gudn72Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7317
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: clear the serviced bits on
 INTR_IDENTITY_REG
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
Cc: saurabhg.gupta@intel.com, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 12:53:38PM -0700, Jonathan Cavitt wrote:
> The spec for this register, like many other interrupt related ones,
> asks software to write back '1' to clear the serviced bits. Let's
> respect the spec.
> 
> v2:
> - Update commit message
> - Add missing CC
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Paulo Zanoni <paulo.r.zanoni@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 61350ed32c61a..af3765c3fc0e2 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -232,7 +232,7 @@ gt_engine_identity(struct xe_device *xe,
>  		return 0;
>  	}
>  
> -	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> +	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), ident);
>  
>  	return ident;
>  }
> -- 
> 2.25.1
> 
