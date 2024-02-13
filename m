Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2E0C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 22:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081D610E1B9;
	Tue, 13 Feb 2024 22:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSfD/piG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0E810E1B9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707862913; x=1739398913;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/17/eVNML9lpswlzWQe5h8yulQdGKRRSjmJirepTbFg=;
 b=LSfD/piG6oGgTgzLif5oWIL7bKqCBD2Z1XyT9dXKMF3r0MJc8cYR8WS2
 gVBQojOFMu7AsBhb0LlcdXE/0nQU9kV5IyD2KvvqluCCOIk4602keQzt/
 X/0kGSCw9deabhEoR5cXOTlbzC5tkxN97cIX8MlZgvoIGNr3AIe2BaT1X
 GydOAio79HuKSoBTPOEGuVFfHnnEzS988WnRMvEzJwyBm/KFNdoGfMHQx
 fDnYT+wlCMX+fGI0aFj0snmhC6Jr20Zl/Rtr+XNdit1ZecbWnGWAE1vBf
 P2q9oNgH0Jcwp9K8Ci6DV1Z17LQGihTQ7pKg/UfcqMtCmIFUDrRGU+8hc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2251332"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2251332"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 14:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3366430"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 14:21:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:21:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 14:21:51 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 14:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnlDR+yoE5Ww461hiSdteBXs+j1tvxwccHA87Jx3pn+vo8Bsr+878Ws/2KUhSLvX/cbA8rSTinUmGGDxHL4bLMUtXUrGc9Kvo+IuyMfvCcZxmTcMQS2jSXvTscl1JD1rpg6VdpeB4+Ls5Y/NJZjkT/r4BoLnWEoYg5B797JsZdKs4KBSWM1ctW/DRbHCC49p+KfwYf3uw1AaVilYfx/MbTVR64INQpAybhFgcdEU82zD3xlOhruWnUaTCPkrBXOah4txuJk7bVMyLBVz1MIl8MB9Fe+nD4XMm3gouOxq0pAyvNOe6JSq7gXVMoVXsqFxWuEOtQFeBKzMGTIsy0SKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2KOnA+/yTfHIfwKBGBTckcMZHmgyv0dA0armrGn3m0=;
 b=Y4lCAr4S3EGY/tSXT4CflFBq4Xb1xQGH+av2qKbuvd60uIyKBuKO4gM+Um3qo2lMOrV3isIEiWa45tX8TyYrRNZFDocjmaIr/jj06NIHjPZDvgAxC9EQnpPUdz8I0zJ0/aqsTiUfVBvzS7xE8z7L1JtSTXR7EN2V4T/GoR1yJNoX50LZ/53f90sncUHLehCVaObZ8Vm592HuWMBFmm+UOzFVCMwtbBK5j8H/LTc/eVzI8F2wEn2h+mGj60+nipKx3sad7LmncODY+r1RvucJvks2Dk8ihnx614fjEf567zab/YFpN2OGSURC7F08Z65fycFQ2a36wsxmZfo9mYpYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 22:21:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:21:49 +0000
Date: Tue, 13 Feb 2024 17:21:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Fix include guard for SR-IOV ABI
Message-ID: <ZcvreuJR1TjPs1_t@intel.com>
References: <20240213214908.1481-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213214908.1481-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 265b6539-6454-4429-8f1d-08dc2ce22c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYEA9PhiVM41cMS5b7QtwR+e9H2VRgqQfeYuHv9NWLh6FVqbH/UH2Zkn4DmqW8ZlZD98N4vhKMVKwTyXaQYYzPceFjKxjo+7NU3z2GuZaYNgfXVahRzsEJUeyFOJHJznUUEQx5h6gUPucYLzS+H2uF3dx99gk09Hq1YkNVjforhAf7rKx8MDX001okIkzw3oZub1UmmevRujOLT0K5I5+a+tWbqOaOpC+hSFBwMkq4ZGKXPSgXe3/DKrW2JfyWHaFdsDm6As2lDLhRGD2CjatbRLOwbZxc3nuDjNg0TL7omd28uPQVB5P30DbwRljCe7lSds9pu1VNoo6cRUOXMqj5UuLrSXWRAXY5VbrRebm9CGn3rhQYEcMgpN3it0qdMaLxJQApGvNA4GrAOgM3VHQii7WKLzv7zuOaU7nRNKdpM3ncIlarYTzsm1xCTbBMdB9MoT5Xj1bs3T3MQPPF4sIWOvnNPCAvY9hShZEn9zfEjEanHbIiuy/yZSQKqLrAlG5s9mLLrfb/N3LygMWYnSXJi1C3RhHzYJl+xtmeb8kwJS4C7k81KiPd5Tdrp6SPw2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(44832011)(2906002)(5660300002)(26005)(6512007)(6666004)(2616005)(6506007)(36756003)(38100700002)(478600001)(82960400001)(83380400001)(66476007)(86362001)(66556008)(37006003)(6636002)(6862004)(8936002)(66946007)(316002)(4326008)(8676002)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VeAlbuYFehD24jSLYkdtIj94DljiwBHczjhW34pRgtHf2xf98rtV2yAJDH?=
 =?iso-8859-1?Q?3+Xm24KO0dU4sZhZsVtiUYkCKpgSpgxA4oZawnmNLPyhbNxLH57UGXl/N+?=
 =?iso-8859-1?Q?K3LDl2DjvpYEQGE9pHJlVxV5w9yp8kP2m1gHOdqMg4YBJ7VMFUzxaFXOS7?=
 =?iso-8859-1?Q?YTyIQX1Nmkh2GHR+O3JQhyM38VA0l/xvcEITDZLGHlBR9JsBnaIb4S140o?=
 =?iso-8859-1?Q?olK7N56sA3JQ4ul4w9R2AsAXH2IWTo5cHmmUf7Bhs7zxisSBBG4wPUwyjX?=
 =?iso-8859-1?Q?xDv9Sl0qAYOV8Ii8uqzt6Oj8+dw6O0TWRxXNwx3Rbtae1BzrhuHRNlm66r?=
 =?iso-8859-1?Q?WGKJen0jwXicBsLrr1QEA6yIUple4mxWZzPTV1QRu4UjXS+TGZShyw+Cnh?=
 =?iso-8859-1?Q?ADY11kcKqt8h85ULqjwd7MYWlHkMIqrfxg8Yug8QIsCkQ8zsNWvx0ooMLi?=
 =?iso-8859-1?Q?W5S6+BjZQWVZAHjKkQGrSiDAnZl+QZikuDvuMwGdA2MLJj1n2f3bRTQJoI?=
 =?iso-8859-1?Q?xprFa7s0EcSLEg8zLaCJ+ohDpvfeBPWPFV68xNmdZ1oUIyXcVhzyXo6k7q?=
 =?iso-8859-1?Q?zK7XaOjBNtZtP1ZzN04s3KJEW60X31oe60cFuFR+SgE2QCW0vfLDuLlBsO?=
 =?iso-8859-1?Q?5V6s7TSHW9DpbIY91Ipg0PeME7dOYSRaeUSxA/eaD+DpYdsVVPfLhQ7p7Y?=
 =?iso-8859-1?Q?gzi7RF7VdtJa8xgc/tjoNGg8DdM+SNyJYxgT8lFx7EEwhyKLtfCL3Fz7Rh?=
 =?iso-8859-1?Q?ZAKe+LIS+LkMlLwBK5wKoqWeUmcM1RoztHkbWpt2OAf+ZsWWQBsRAa4y1p?=
 =?iso-8859-1?Q?P/gvF+bL2I1w2aiapwnNJ6g8ZOk8CasrrL6H9HPBnTC+dEGfGjp9EyUM2w?=
 =?iso-8859-1?Q?5KzBgd4CxRJXNClnDgZu6uf4XZKHJTDtM0xnfSRuco4j75Jh+WFJ4RK8M2?=
 =?iso-8859-1?Q?sj8U/N2VSilMGPYRmSd8pQWwW/UbGxHP61EMEtjhOMk7PS6APpaLctUhiR?=
 =?iso-8859-1?Q?2GBEOn8YlFaZSSM40Mq5T7b561+3uQjbPf/UcW3+UPTTONt1Wht8biIUk6?=
 =?iso-8859-1?Q?kl6ceP//NbzTx92jJnobuOHchF1c7hCNK5fNb3ywk5CpxNAicg6JCz3HUW?=
 =?iso-8859-1?Q?TH+nxeT83KxQXjALNTz7Fke0uC2w8ProWWaUdKpucjI7xgvJ+XeM/R7kZE?=
 =?iso-8859-1?Q?XFgU3B8Cz+PGyfPImnh0doUk/Q8T+WK4iAT7vejDOeWQtIhd8zO3QQOKBu?=
 =?iso-8859-1?Q?t9kc6dC2MYEQDzKedwntt3z9ApOFLtFfPpUPWHvjs3spMVjzhrd1IHtUSJ?=
 =?iso-8859-1?Q?22+mmopawzlDchxZYAtgARkWUQyrsQa1sfFwxkzNT1yOttDzAfNPFToRrl?=
 =?iso-8859-1?Q?LAJkfXh4Yon4K17gBsQoq/UCvtJ3xeLwTkqI3/EcYNeIxqT0psPx9v2QQ3?=
 =?iso-8859-1?Q?bEykt8keMKdgPMQYMTlvbT17Q0nBd5ldKJAxpX4hAmZdL7HIXi3R5nYidk?=
 =?iso-8859-1?Q?XftnKuIk5utNeMwvOJV8ltLwTt5xb5wLIhX37ywVFNjFyhgzRhcTAQ+JCU?=
 =?iso-8859-1?Q?xZGOnFsKwKrVHBCr7UkKJ3dlr7A73MBwlJyD+tHCumtu7jMiIzKM5Q4Qhz?=
 =?iso-8859-1?Q?IbiASyd7OrlUpPq92s5I0tqC+Jg7C+LsCIsYyNPVjSkcxDhO9ZjLqXXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 265b6539-6454-4429-8f1d-08dc2ce22c1e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:21:49.6327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvHejF4Dm2htwHVEc0hFFHN6sOe39gUrMNGnI578MKisf0r4GBXiA+dVYPSO0QY1wBZbig2Li/NwmtoWQa3PWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Feb 13, 2024 at 10:49:08PM +0100, Michal Wajdeczko wrote:
> Use include guard macro name that follows naming used by the other
> GuC ABI files.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

hmmm, I believe the ABI prefix should be avoided, but anyway
you are right. this is how the rest of the headers there are,
so,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 5496a5890847..fe7a93ce3aa5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _GUC_ACTIONS_PF_ABI_H
> -#define _GUC_ACTIONS_PF_ABI_H
> +#ifndef _ABI_GUC_ACTIONS_SRIOV_ABI_H
> +#define _ABI_GUC_ACTIONS_SRIOV_ABI_H
>  
>  #include "guc_communication_ctb_abi.h"
>  
> -- 
> 2.43.0
> 
