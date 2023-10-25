Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88B9C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 13:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFA810E65D;
	Wed, 25 Oct 2023 13:48:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C787710E65E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698241694; x=1729777694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bTd6CHzO96QSvyBgRkujCLV0Hlm4wnDxTrJ0jzFgbbg=;
 b=NHE/iASMcJZWkQZRyUes5FNkbOLKYu6FTI3c9I8RyCmx0ECU2emEfif9
 /d0LstN2EWqC0eRdMi9O86BR4qYR/CIDLwtpegdPUFOvAzvfpsrkG5Py4
 NbNpugevD9giShoYzUYi1voeHy5p/+2eX2fl/eIxjZcrXachY1sgVVDcC
 kgUXkKtJQbtkWWCeADpXqveLe3kFDr0Ty9aaxSFzOoaLR8ZkGFnl5Ebje
 voBrbuxk+Iu5m0XT4pF4fLdfAnNNGdumSyKODDjPBX2T+AeGOsH2jIV/4
 ktWLVZR2p93z4AhbB5iomwEYVw9+cH57h/E7wMjJc/u1SSddM4OqtPJCR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377675416"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="377675416"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1006020844"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1006020844"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 06:48:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 06:48:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 06:48:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 06:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb97Vwa7WARDe/9tYBbf48ga4azQzPbBW3F2yJdkMx6uvP5Kff/EW02UKt+vXryGCYNdAEsqHRJVl9z9BeqGpxFCWlM4uvTpuieboO9p1LBhPyWvWMxDmYI5ciKjxbGVwIsDaALbaJVbqPnjPs3Oiqmyk2N9oT4FXdy1he48v860Ca10zDSXNjXsW0Q2dmboBkXjl937kcNaD0SG03UlYuhs6YlN5HD9L9gNciMUZEO/yPvzjpXFSOfDU9duHv9xs0og2rTWazedl0D0bti1y1Keq8AC/1eKyOq8E27bPcX6Lhk7Ap6uylkEHJwOB53Y5mzmJ5gJDkhe1OQ27KhtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbWslH+hWqVKCd8vQZvrgBxZiSD1fHedOQTvNr5hNdU=;
 b=H+fJChosKAgalxZ8paxFyzFpEg++1RPKwhIzx4yrcTQXxwrjr7P+7uAy1UonfgPh099FSdpdThJYNGBUFzl6Lb887qIL4vV+1b9DN46jo5GQhJBACZylhXE9k4Uoyk6hFPEA3nQn20Mcwo3eFWrrpXjUYvYc37H0Fptnc0ceCYNRXcwIhTo3Bi0T+Gvi0Cn0AFEeN6wQicfGgitvpAzc26/q466f7qrryoiOCeFWTYOBp0WAYq1QW9tHvDUkxKIOPrKeqkp3ymqiInaW5wuBSmc8DMh2yw4omu8zBjqqU6R8J5mFwEdi+GV08+pch7rwXGcMunbjCVDMcM9XKWcEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 25 Oct
 2023 13:48:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6907.030; Wed, 25 Oct 2023
 13:48:09 +0000
Date: Wed, 25 Oct 2023 08:48:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <dt7zwchu5mwb6sgrxbq7hcyti6dh5cermo4eqhoyjdcc3s62tn@jummbosmcllp>
References: <20231025104306.667700-1-jani.nikula@intel.com>
 <20231025104306.667700-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231025104306.667700-2-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 54282a0b-6c19-48df-de40-08dbd5610596
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jKQR+4P01X051FmBdfn3/gHd85B1xCfPJ68hnJjwfGrOUQtIQfIFWtkhWmvUUpMDVy5s2BRHm90Fb3EoKb1fKr3jO52b7ZaMY/x967X1ivef0+OuhVf0zDfO1RcVLgsYSETPEgvVUqGnoPEfz29a88Ag1ixBD+8tRzEf99dcyXJeMPJ8F0RCJKnnsEa+ARIUxuHhOLC3btErujzxwXSg7sEoLUv07urdmfk6IWdio0eO86hFLAMBVsr6I2cU9VcHoy2VbCaac98Si9uM59qsnU9Xvkj6rj/3M/De0HIU9PvpsuENs4DWs7BnE+TuGauP4zrGR6G0fwXIEZRKEIHUkHDYQOktvycpuMzucz7hcFOprGEwthcFe3N321nowbbW05HTa7AXPOgoCaaHwuFXqQNfCU4m/qFMsZg44cPTSJl5rTDiFwOPKr1krnkkNFJDdSzx5i1ye1VRb7NnyRbqEhajPk6yeNkqhxZQn7PSM8oBNg+85lsDpuYPvS1xHPLp958q8xTQxA05TAku/97vUWO6MTEuP0vFj40vX476OUU+H7E1yoKRCNTVDdbbY5qd0AQKhjyxp7it9atjc9vAe3kxe5GrEWMnGKG4jrX3Ek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66476007)(66556008)(6666004)(66946007)(6636002)(966005)(6486002)(5660300002)(2906002)(107886003)(8936002)(4326008)(33716001)(41300700001)(6862004)(8676002)(316002)(83380400001)(82960400001)(6512007)(26005)(86362001)(6506007)(38100700002)(9686003)(478600001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OEblBmTbc47ycLpRtQif9PIK7AcqM0gH7HPR1VLBqypGOiMy5DsspDEy5FYd?=
 =?us-ascii?Q?cVx1y1u9ZCxoyC05NFNlZMuc57Tanw+QSX3fSbwyPFktEKpjklsFCTC2ecO4?=
 =?us-ascii?Q?YMB1ZoVbA1NIM4JBeD9ZYvFmSGaDMkzMX4BmxLpljhLqph3PQZT26A0DEsDf?=
 =?us-ascii?Q?qCsCmdARj8H4vactYQ6F00AfA3E3F7jxjFeUGcFTcWGsN4QoKdjxU6Ae5y3y?=
 =?us-ascii?Q?IZnweDrmfv9DGR5oBME6esun9953a3l37kkIp3OmOTTDO+6xVONyie96YqdB?=
 =?us-ascii?Q?dv9do4pFjvLqOVXNDIkmoszAjHT11tOy5hIqB2QoUnjmueiUG+6qPaHnv1Yy?=
 =?us-ascii?Q?dLTfGbEuGe8CD1PBpth0yG4bXEriDj/fQrm1o/qoGAu/L2roL20KEZnArBtu?=
 =?us-ascii?Q?0bjgMfsMnGE+XXbb/lse48oBxE4K9Ay99rbg5hHugTcwIvr0fSirs1Zfu5uB?=
 =?us-ascii?Q?GB2Dwh0mGK7BctPHnm16VbQ5XqipFoAxhC0jAe1pW5g5uuboj+L+weyVpBFz?=
 =?us-ascii?Q?B8WquUKWGFYRGqdXyIQOH9hgkiGPCWBfWVotkQyc5Ah9wqieGfcOO5iNgJUq?=
 =?us-ascii?Q?icLYB//qN4LEMSRh6et3nqD7MSqCsC6bEtH5Gy9NEnVlNaUFYArCIVci7mUJ?=
 =?us-ascii?Q?yQYYHUJyJjgYYshn3uh+TqRB2zW1h+NfSlD6RwREa36Dk6HMsHfck0vYXG2b?=
 =?us-ascii?Q?Qvzhegdec+se8h3Pk8pZ2g03uuHsSaeJ/63lXRiENWlEl1lj87xOb284WIg/?=
 =?us-ascii?Q?UZNJ60m8gW9n3+EqL43ntiv7DH0QgZgPBAJHqqzUmqe4GRBjwl2ipIotiJbO?=
 =?us-ascii?Q?pkYGzuV4anRe2NWZysIp7gVNOqIkN36x3vUBBJB8FF/iWwPDoJ5dPsEfWmj8?=
 =?us-ascii?Q?98nFRSx4YJ7ncOXrxKlu6LZB7b9r6F6Pmz+on3+fiSGherxZkXXUCdGbWB8/?=
 =?us-ascii?Q?QYjJu9EQeunJe9ZVkcVA3RQml6FxFKn1DjStl6H0qaxe0Ee1BxuJzVQv1Ycg?=
 =?us-ascii?Q?GVTeDreadZ1fpLuGV+qZQ+d9AmAE/ZV4BBqOBo6Cygz+JfigBTjgEVcCoyot?=
 =?us-ascii?Q?OXc4uXe7s0YScUwddodKs3QTzhmCwjmguUXFlDPXcYGrSToTDxANMj238oLG?=
 =?us-ascii?Q?QC0dHdOZrA9gfzQXIpfmmlY3+HooKfgTIWZ/VlIv0xdL4of1mZGFlp9ERWyr?=
 =?us-ascii?Q?SoLZTkW5ZzBaeWQezOpVvFTmbiOpeOMFa+80cPGbCZODpKziMizwl067mVuv?=
 =?us-ascii?Q?ysiyi9+s/0/Hrn5LP8j4Bwl/ifwtH7SDTCA5ZNYMiP5uXt4mGb/vx1gMqwEM?=
 =?us-ascii?Q?HIEX16NQKtpgmURC9hjUJa0nDPdWicSASAREgEToDx6BV0TMlVUPlmKJC5oW?=
 =?us-ascii?Q?P9+5lH95hbsF6stuoaJUFT3fC+K1VF0I913u+A0qxEvs+4uqZv73DTOhg6/3?=
 =?us-ascii?Q?9VNsZuVLqkyYy5aHC081kGmwR27No77lBK3ooJMu9eDY3BFz3J93ptZUcEnl?=
 =?us-ascii?Q?flZCYKvwPkBc9yQWLXtPVWjrbney9ZgE0e+aj8Eb/Xlh1AlnN9ppeqee43Ja?=
 =?us-ascii?Q?Yj/v/tkBNr7awrVBGFTCu1fXEIj792qPK72Zf3DdGAixeiBiMltG5mkeKcOX?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54282a0b-6c19-48df-de40-08dbd5610596
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:48:08.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsdE2Or/3v7CdnWJrbxrV6ynOMCE7q3rapR5ragzdLF05skPLRulIZt8GxQr4ds6QtvFG+2smNv//rVBZdC2II1ShE1ehfDxGvmRHlcMTGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/i915: drop gt/intel_gt.h include
 from skl_universal_plane.c
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

On Wed, Oct 25, 2023 at 01:43:06PM +0300, Jani Nikula wrote:
>No longer needed after commit 94bcf876cb6a ("drm/i915/mtl: Drop
>Wa_14017240301").
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Link: https://patchwork.freedesktop.org/patch/msgid/20231011142704.985867-1-jani.nikula@intel.com
>(cherry picked from commit f17c08a6046f0c9383a61d7009216b0ad3369db4)
>
>---
>
>Note: The cherry-pick conflicted, but it should be trivial to resolve.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>index 6ce7dc419df1..188d53bb8594 100644
>--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>@@ -21,7 +21,6 @@
> #include "skl_scaler.h"
> #include "skl_universal_plane.h"
> #include "skl_watermark.h"
>-#include "gt/intel_gt.h"
> #ifdef I915
> #include "pxp/intel_pxp.h"
> #else
>-- 
>2.39.2
>
