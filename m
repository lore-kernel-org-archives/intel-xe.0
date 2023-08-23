Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F410CC27C40
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 19:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B036010E0E9;
	Wed, 23 Aug 2023 19:55:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B2610E0E9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 19:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692820521; x=1724356521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AdSL7YGBhdkJz+lRr6Qp6ZPh/sqTs7pXdzilTiULmUE=;
 b=bV3lka+08SHQphogFzRNyrCNPOhvcNMbheawgTxqFyhAW/qpdYC7KJQf
 gZE6XE72RwFKmHlKMJKcf2IdZprqNEsIU9aSurLfbnHI6e/xeNNPo+KFd
 x2JQSJGSggxn9Tq23DjWcL+aKkdVuWgL5liyWx9AgAXmOFlrcm4bvHVSZ
 nzSv/6p5ntVRtr0RWKXvy57sEwM18wZCcCc6UK/7/mxzT8WxA4W1VKVDq
 /k3GnHqsSXLQe/h8lEZSKvlJtdHtINnaVS+4r0lTZZFNAU2dx97WSY/z3
 e1XA0QgKgc56j8+KmdzI2AgJOg9p2v5wq9bYEmM9/MzFwLqVPU3/6LTiR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378011756"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="378011756"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910633045"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910633045"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2023 12:55:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 12:55:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 12:55:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 12:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0bDbXj+Rmbssefjp/pw8POvrZrxI8bBSQTJdHXTzd0HX+7pt1JLfXMGIZoUttCEN1ImIRd66auOZVjFdrr8/wS5m1vFQ5ErKI+5qo2RgVlAcnMCruTrs0rUU5b9WgdKYqX/kZCJShnfQlEupvRfyKmj7MVaGERK7u8zwagpThiDj47DxNoO8w36DRIzxPM9EAVCTyR23AKTRpb3NIeEMGh4YAbyX1mGz7qEEf2dav0HOoHnMQBgalPp7yx0aMAT0v42xO+klygFAEFrvnX49a6GOpJAhH3scyf0+piXJOjBAzOdVqPjGdWMXxnfmqSYvy1xVTlvcroWlZIYdlUZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fY8QC+bPYzEPSBbOipds5VikMI4umnKLC39i/89pDgQ=;
 b=TZHaCeU7gH7XkLk+9+xWNKs0Qahe4pPSCx8VEgfXFfY1e+AsFAmpHC9Yn6jeVjV/9fHD7T/f0bmI09ysG1IhdRSi4QybaSTFUVwtPSir0hFAXzHRNYkRYzqnIpnG7/HMLezJDb6xzcUCO5eiXhj4A7Eh56sFSTknSTf8pfU5wIOwwBizrCGnEpzJkjA5YiW844Uu7KNshDbhOAO7BXj1ZJNDTNrEWLl44qinTy6Wv8z2SW5oxMNJzLn5Q5Fxls8An7ewMO8sPUkA2sisEZ7wubdmoFt0vKyuJPk/eWGkuF5C7DN1U4ylxb3rj7LSg66VMJpbvhnFEKkbNPHCESPHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 19:55:11 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 19:55:11 +0000
Date: Wed, 23 Aug 2023 12:55:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZOZkHZfMPkbFdNMg@orsosgc001>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230808013159.38811-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:303:2b::13) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|BL3PR11MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 7199c779-dd8a-449f-f16e-08dba412dc3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+kRvaKG1yvEAjVTlx+9RWxCR6j9FTB0eiBT+uWcKHPHoffp1sPgJHQ7xJV4JqTpVhsT69nRCqjkRDRoyyd6CByG6fxHcq754ia49JqLggEQB0LO9YB9ULrDLkQ4YN0ExOdCeF3Wi/FgYKI/owTQAVnN+clCN67nGQ2+e7sGQKT0JeFrDbe1uQDN9k+9luJ+y31FO43xqHKHgPWcC4GN1K1AjTTAbJaJTyWNe7oYpu1u33XYjBjQApj6XhDv/mPLT72DRLx+8W4Ij9PB7AeGEC2RBcQ8rPga9vryXoWJYLJYSeeSuG0D1l/RRV7OLWxYHOJq4A60mwPHlkYTH+2OClYuaBkrjIhOJOB26T55RJGmMrDyIAULVnrtyEkQjODF/N/Yh+gBj1nxJn2WqDBURzICVuUr83OxnviP0sLuKbX2u2ytPXWy5XaVZsfKyJi7FjIJal6mYcNIRvmrSJ84iz8WR48wcCWYBNHDGHtPQoTOwR63nr9lorooBe/GQuvplrvU3icQKpMwxvMSi22VVx8tekQYJzOqQsxu9IV7p4kapwH79tYFX65XxZtN9z+q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(366004)(346002)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(6486002)(9686003)(6512007)(66899024)(83380400001)(33716001)(86362001)(38100700002)(82960400001)(26005)(2906002)(316002)(66946007)(66556008)(6636002)(41300700001)(66476007)(5660300002)(6862004)(8676002)(4326008)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXZJcStEMUZqbE5qamZlQjBxS1k2aG9YRzhHMEd2UGthMVlvblNBNXRiVS8x?=
 =?utf-8?B?YVdTNFlWUnRHbVQrZkFYREtMQU1wNStyTU1FTTZyQVhGR1A0cE96dk5Dd1Ax?=
 =?utf-8?B?SUNDeVRjN1FpTitvZlVYd001Y1V0MFZ5bTJ5cXlRcjhpdy9jc1krS3JrWm9Y?=
 =?utf-8?B?TVh1cmllcDJUZE85cmZTL1NZZ2VYMSt0aGVxZ1VPQ1dVRk9CNXdMZ2RITFZa?=
 =?utf-8?B?NTYzZXRSQ2YyTkFPWldyUi9jeGhwaGx0OUxzWnlvbjlzeG1WQXRjckpGdG84?=
 =?utf-8?B?NCt1bllhaGNkQlpXdkZBaWJCWHZJWXB2U2ZMSXg0Q3RwL1ZQOStQdkxQSCth?=
 =?utf-8?B?T0E3OHpmdU1jN0tST3ZpbHRoTFZmRVNGa2ZidUova2gwek1vMUlhOXIrNlFP?=
 =?utf-8?B?djJmcU9aUG1wMTdWK2gxbmdGUkF2OEh4Q2NSQ1l1RnNEMU50OG9YSmczbzZW?=
 =?utf-8?B?M3N0SFNrWW9kMzlac250OGx4UnNjMmd3empRbXBITnczSHMxUlJBdVVyWGxC?=
 =?utf-8?B?VVZSVFc2dUJQNzFmNmQySXBFVGR6b3JwUzRBN1p3R3dPcTRjYTQ0amFxd3BG?=
 =?utf-8?B?UkhOVm9wWlYzaXRlM0ZQS1dnQzZndzgycEFnb3NlQlkyL291MHhsVmxmTG5i?=
 =?utf-8?B?alZsc09qcWFMeXhaNUUvVlk5NnFYaGhnaHBDeWdPR1hsY2w5MjduTktUL1dV?=
 =?utf-8?B?U3Q4TGFGcktJbjUvdmNtbERtRlZIUURMQ0pUemZLR0ZKcThtZ3lONk56cDl2?=
 =?utf-8?B?OEdFWmdiRnNsU2lvK3JmWlNGSlFpWWNsZE9jc3hkT1NQTEkwT0dXbVFQclNo?=
 =?utf-8?B?Q0VLejZlWWRjRG5OMFBTTnFrU2dVZjRsa0xzczlXZm5CVmtPdG4vS3U5MEdp?=
 =?utf-8?B?N01lL1Y2VE1ESVhEaUd2bCt2SEJ5Zzc5Y2xVMjlERUpkWm8xQlhIVWdqSXdZ?=
 =?utf-8?B?N2VEOGdZTGdmRzl3bTRMU01MUjdLN0ZCUHk4ak5vODd3ZjJvdHlVZUplbUZS?=
 =?utf-8?B?ZmNROWlwa3JaLzRTdzN0Nk13NXdZN0k0c0JYN1lrYVBIMmJmQ254Q1N2c2M3?=
 =?utf-8?B?VnBwelJhQ2UrcVBqMkJjVDZVOFkxSm9mdzZCa1ZkNlVjUFJwNGU4NU9YQnY3?=
 =?utf-8?B?eXV6L2cyYXAvcGJrTWtkejF0dEl0NEp6RGVoR3h3eEtaQmMxMjhjSlU1cHc3?=
 =?utf-8?B?Lzh5VjRUV1grWndTdEF5YVJCNkVmOXQ2MG1vNldNZ01uLzBLWFJvNGRSVWZ0?=
 =?utf-8?B?czlkTjE3UHdycXFjcTZBOEtPNmxpcS91eStwbHRWa2xNV3Z2ZHF5K2dWUEp4?=
 =?utf-8?B?ZHZmaFRBaWhHOGVPeGJTbDVUV1NPV1k2c1MvMFdIbVRoK3pMTkNGU2t6a2Fz?=
 =?utf-8?B?TmNDOFYrcDN6VGFuWk5vL1BtTm40QVhETU5zdnJ3NjhOeGd4NU9ndGJkYUlE?=
 =?utf-8?B?NGNPWUdiUlRiVXVESjA4emFXRmFXQ1hDdmt3Y0x5WG9IMTYwOEd5T21sOU04?=
 =?utf-8?B?cVRnL0p5UmYvaTNGK0ttcVJBMC8wc2JneG05NC9YVmJKM0dSYTFrY0dNQXpX?=
 =?utf-8?B?cFUrcGJpb1AzWFlDN1orTTJHaWZEbkVMam5rQ2g0cHFTWWk0US9FSzlGRnhP?=
 =?utf-8?B?ZWZkaEh3c1Y4ejdWS2NtUEVWblo5c3dNWEF1Q3ppM0FBcGJWVXY1QlZUNEds?=
 =?utf-8?B?OHRHb1hyaDAzcnBhcGFjOW8wRFB0SnEzeVE4NHJ1MTlJVDNRV2VnWTRBQ0Zi?=
 =?utf-8?B?NzB1UjMvR0RQVDJlWktVb1NCR0xTWHRRMUJiZ1ROWmR2aWhUTWo4RVM0SnZ5?=
 =?utf-8?B?UVpZVkJlRTZaanhJZVhtdkczanUyTlVCZkFUaFppd0o2dHF3YXRXMC9OSHhN?=
 =?utf-8?B?cWw1Q0lpYmJlUVQ4NDRZYWtnL2tsR0tzWEpNSDE3LzJXN01SbnowVVNrd1ln?=
 =?utf-8?B?b3dBbzM2Y2JuaW9xMjB5RGo1aDRpcWZqQ2dIVEcvOGk3eE9TbHhoOVFpd0E5?=
 =?utf-8?B?cGd6cldkODJSK3ZHMlpQT3VXSnhYWXFrVFpremx3Z1ZvOU9pMkF3bGh4ZVdS?=
 =?utf-8?B?a2RDT1lJdUo2Q280Z2lXblNhOW03MytFVlJ5RkhINTYwN3MyNkNhQlIrK203?=
 =?utf-8?B?UmZzd21SQk9wVUdnVndnbW9nOTlYcDk0STdGazVQaVhML2lDZVZoeWNDMDBR?=
 =?utf-8?Q?jfH6c+iC1VY7fRcbZbyv8rs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7199c779-dd8a-449f-f16e-08dba412dc3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 19:55:11.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUY6K0ZH7fSRXu3KoT9tPBLcw+1sTQUPrtSLC06Y/tcrfp8THEXANoj1fwVrxgthNgFpbeMZufTR+P330RmK3SvepKV5KJeiAjX2JITWXSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/10] drm/xe/oa: Start implementing OA
 stream open ioctl
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 06:31:55PM -0700, Ashutosh Dixit wrote:
>Start implementing OA stream open ioctl and parse properties passed in as
>part of OA stream open. The remaining operations associated with OA stream
>open continue in subsequent patches.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c |   1 +
> drivers/gpu/drm/xe/xe_oa.c     | 240 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h     |   2 +
> 3 files changed, 243 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 3772ce1dd234b..37fb9e6772e40 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -115,6 +115,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>
>+	DRM_IOCTL_DEF_DRV(XE_OA_OPEN, xe_oa_stream_open_ioctl, DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index b98eeab8573d7..0ea5af549bdaa 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -11,11 +11,16 @@
> #include <drm/xe_drm.h>
> #include <drm/drm_drv.h>
>
>+#include "regs/xe_gt_regs.h"
> #include "regs/xe_oa_regs.h"
> #include "xe_device.h"
> #include "xe_gt.h"
>+#include "xe_mmio.h"
> #include "xe_oa.h"
>
>+#define DEFAULT_POLL_FREQUENCY_HZ 200
>+#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>+
> static u32 xe_oa_stream_paranoid = true;
> static int xe_oa_sample_rate_hard_limit;
> static u32 xe_oa_max_sample_rate = 100000;
>@@ -31,6 +36,21 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
> };
>
>+struct xe_oa_open_properties {
>+	bool sample;
>+	bool single_exec_q;
>+	u64 exec_q_id;
>+
>+	int metrics_set;
>+	int oa_format;
>+	bool oa_periodic;
>+	int oa_period_exponent;
>+
>+	struct xe_hw_engine *hwe;
>+
>+	u64 poll_oa_period;
>+};
>+
> static struct ctl_table_header *sysctl_header;
>
> static void xe_oa_config_release(struct kref *ref)
>@@ -53,6 +73,226 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
> 	kref_put(&oa_config->ref, xe_oa_config_release);
> }
>
>+/*
>+ * OA timestamp frequency = CS timestamp frequency in most platforms. On some
>+ * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
>+ * cases, return the adjusted CS timestamp frequency to the user.
>+ */
>+u32 xe_oa_timestamp_frequency(struct xe_device *xe)

This should ideally be dependent on OA buffer, but the i915 interface 
did not have a way to pass that. We should do that in XE.

Umesh

>+{
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	u32 reg, shift;
>+
>+	/*
>+	 * Wa_18013179988:dg2
>+	 * Wa_14015846243:mtl
>+	 */
>+	switch (xe->info.platform) {
>+	case XE_DG2:
>+	case XE_METEORLAKE:
>+		xe_device_mem_access_get(xe);
>+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>+		reg = xe_mmio_read32(xe_root_mmio_gt(xe), RPM_CONFIG0);
>+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>+		xe_device_mem_access_put(xe);
>+
>+		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>+		return xe_root_mmio_gt(xe)->info.clock_freq << (3 - shift);
>+
>+	default:
>+		return xe_root_mmio_gt(xe)->info.clock_freq;
>+	}
>+}
>+
>+static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
>+{
>+	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
>+	u32 den = xe_oa_timestamp_frequency(oa->xe);
>+
>+	return div_u64(nom + den - 1, den);
>+}
>+
>+static bool oa_format_valid(struct xe_oa *oa, u64 format)
>+{
>+	if (format >= XE_OA_FORMAT_MAX)
>+		return false;
>+	return test_bit(format, oa->format_mask);
>+}
>+
>+static bool engine_supports_oa(const struct xe_hw_engine *hwe)
>+{
>+	return hwe->oa_group;
>+}
>+
>+static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
>+{
>+	return hwe->oa_group && hwe->oa_group->type == type;
>+}
>+
>+#define OA_EXPONENT_MAX 31
>+
>+static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
>+					  u32 n_props,
>+					  struct xe_oa_open_properties *props)
>+{
>+	const struct xe_oa_format *f;
>+	u64 __user *uprop = uprops;
>+	bool config_instance = false;
>+	bool config_class = false;
>+	u8 class, instance;
>+	struct xe_gt *gt;
>+	u32 i;
>+	int ret;
>+
>+	if (!n_props || n_props >= DRM_XE_OA_PROP_MAX) {
>+		drm_dbg(&oa->xe->drm, "Invalid number of xe perf properties given\n");
>+		return -EINVAL;
>+	}
>+
>+	props->poll_oa_period = DEFAULT_POLL_PERIOD_NS;
>+
>+	/* Defaults when class:instance is not passed */
>+	class = XE_ENGINE_CLASS_RENDER;
>+	instance = 0;
>+
>+	for (i = 0; i < n_props; i++) {
>+		u64 oa_period, oa_freq_hz;
>+		u64 id, value;
>+
>+		ret = get_user(id, uprop);
>+		if (ret)
>+			return ret;
>+
>+		ret = get_user(value, uprop + 1);
>+		if (ret)
>+			return ret;
>+
>+		switch ((enum drm_xe_oa_property_id)id) {
>+		case DRM_XE_OA_PROP_EXEC_QUEUE_ID:
>+			props->single_exec_q = true;
>+			props->exec_q_id = value;
>+			break;
>+		case DRM_XE_OA_PROP_SAMPLE_OA:
>+			props->sample = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_METRICS_SET:
>+			if (!value) {
>+				drm_dbg(&oa->xe->drm, "Unknown OA metric set ID\n");
>+				return -EINVAL;
>+			}
>+			props->metrics_set = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_FORMAT:
>+			if (!oa_format_valid(oa, value)) {
>+				drm_dbg(&oa->xe->drm, "Unsupported OA report format %llu\n",
>+					value);
>+				return -EINVAL;
>+			}
>+			props->oa_format = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_EXPONENT:
>+			if (value > OA_EXPONENT_MAX) {
>+				drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n",
>+					OA_EXPONENT_MAX);
>+				return -EINVAL;
>+			}
>+
>+			BUILD_BUG_ON(sizeof(oa_period) != 8);
>+			oa_period = oa_exponent_to_ns(oa, value);
>+
>+			oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
>+			if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
>+				drm_dbg(&oa->xe->drm,
>+					"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
>+					  xe_oa_max_sample_rate);
>+				return -EACCES;
>+			}
>+
>+			props->oa_periodic = true;
>+			props->oa_period_exponent = value;
>+			break;
>+		case DRM_XE_OA_PROP_POLL_OA_PERIOD:
>+			if (value < 100000 /* 100us */) {
>+				drm_dbg(&oa->xe->drm, "OA timer too small (%lluns < 100us)\n",
>+					value);
>+				return -EINVAL;
>+			}
>+			props->poll_oa_period = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_ENGINE_CLASS:
>+			class = (u8)value;
>+			config_class = true;
>+			break;
>+		case DRM_XE_OA_PROP_OA_ENGINE_INSTANCE:
>+			instance = (u8)value;
>+			config_instance = true;
>+			break;
>+		default:
>+			drm_dbg(&oa->xe->drm, "Unknown xe oa property ID\n");
>+			return -EINVAL;
>+		}
>+
>+		uprop += 2;
>+	}
>+
>+	if ((config_class && !config_instance) ||
>+	    (config_instance && !config_class)) {
>+		drm_dbg(&oa->xe->drm, "OA engine class/instance parameters must be passed together\n");
>+		return -EINVAL;
>+	}
>+
>+	for_each_gt(gt, oa->xe, i) {
>+		props->hwe = xe_gt_hw_engine(gt, class, instance, false);
>+		if (props->hwe)
>+			break;
>+	}
>+	if (!props->hwe) {
>+		drm_dbg(&oa->xe->drm, "OA engine class and instance invalid %d:%d\n",
>+			class, instance);
>+		return -EINVAL;
>+	}
>+
>+	if (!engine_supports_oa(props->hwe)) {
>+		drm_dbg(&oa->xe->drm, "Engine not supported by OA %d:%d\n",
>+			class, instance);
>+		return -EINVAL;
>+	}
>+
>+	f = &oa->oa_formats[props->oa_format];
>+	if (!props->oa_format || !f->size ||
>+	    !engine_supports_oa_format(props->hwe, f->type)) {
>+		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
>+			props->oa_format, f->type, f->size, props->hwe->class);
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
>+			    struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct drm_xe_oa_open_param *param = data;
>+	struct xe_oa_open_properties props = {};
>+	u32 known_open_flags;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
>+	if (param->flags & ~known_open_flags) {
>+		drm_dbg(&oa->xe->drm, "Unknown drm_xe_oa_open_param flag\n");
>+		return -EINVAL;
>+	}
>+
>+	return xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
>+					      param->num_properties,
>+					      &props);
>+}
>+
> static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
> {
> 	static const struct xe_reg flex_eu_regs[] = {
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index 79f77f445deb0..fd6caf652047a 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -16,6 +16,8 @@ int xe_oa_ioctl_version(struct xe_device *xe);
> int xe_oa_sysctl_register(void);
> void xe_oa_sysctl_unregister(void);
>
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
>+			    struct drm_file *file);
> int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 			   struct drm_file *file);
> int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>-- 
>2.41.0
>
