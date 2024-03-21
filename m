Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A535EC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E0510F978;
	Thu, 21 Mar 2024 19:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmxzZPDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BE810F978
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050541; x=1742586541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kNskWt74Y9mVm4CnK1BngR1OM/GCvZ3gvZmUsnTAd+w=;
 b=YmxzZPDAa/lxkKL8hy4Oym9W9rY9hOMcjj9K4OP4tdtYj+e/Dyd3Klle
 y+/afYcXarWlVHMx9xAixH6k3UEJzpeFXYx7D0OSC6UBrl1cefZgmxDJR
 n5Fm6syfl99pTs1Ac/j419Aj9/g2l0XM1xBY1oWwQDwJFNGt+BtE+Lj4P
 3hOt3zTsiYt3aVxLD//5pS/63Hsq8HMUAJ1nAC7y/F+VM/Jdyv7fV/NAV
 a2cuzv3wRNlEnVbPUVicAFBe+zYnDDzVk88LjSIvuYYvomD1fQInYoLJL
 dz89RIJSA2OhwazmRBgynaJKD5yvUZ1C6Ycnaujj2yXn0iC+lDWnE1hNb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16710555"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16710555"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14680214"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:49:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:48:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:48:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:48:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feumzdYJxfkqMjfS2j/V2vqGrtIpsPdhK5vUnX00sg76FsqxPz3Ci33rJTnxl9k4NEQ64Rp0bg9/+7uJNiftq1fivp2HfOhkoH2RvbeFJvW+tt+HLZRf3cKVMXap9MYpkF9JJy6tN4amp1dyvXEHCWwPHfs0uH4i/PxeLlw9oo/U7CKWs2pr1hDFTPkGHug6f6k5QZWAB6zfClim3n6BN1ppGLI7So0hy12HXvC/gOEkhqvRXa48lkcNAgkW2hHxHQwaGTHwXvOdgV2sVl/ygOR96nR3/mxx0Q3hoHIclXejuizbBUPHDqbgez887rDs7e4IkgTviKfZpU1ixP75XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti/jryfaQFvj2ImbS81AEe2pNxggEpClW/3nAtFVxQA=;
 b=cIo8mZsl+8905p5YlwQyMVJ1Z+uSNz5wIXomDM1VARz025wrhGSNurDo3PIW+Y4c0J87YL1L9vLpEuSCmY1Kcf/SxDTeD1UJlmbLarV3uOxB9VEAIyBzVEn+6FYKjvxO+At1zz/rSyMNGH4B4MhS/cdNnKmBlYNv4fWkaDsoMT3/UO1S+Ybb+faXEjPq7l3BD2tm8EUibixCrLABil/ELJgDe7zqfk65rAMgZShaFVc07fgce9vfKSKP6LFHGZQORyT2ydhXYbDzvtZwI7oedqVP7/G55kD1mvD6Z8xMoqJrtO1MZzEqbNFOP1xAZb9S/2XAW5pQ8e/BGqfnJh3QRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Thu, 21 Mar
 2024 19:48:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 19:48:57 +0000
Date: Thu, 21 Mar 2024 15:48:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Add some failure checks
Message-ID: <ZfyPJYzIz22_SWs9@intel.com>
References: <20240321191219.243583-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321191219.243583-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b7cd6d-2b04-4da9-2c63-08dc49dff21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3p+/hN46QcQzPX8oSlMjqYxmN85LyVoTf22pyXFUySnIldQx43w5bxNPq66Izk2NMuP9EHEJ4tg3PH96dAIQi4QKgXmQ0wKY+xQYkOD7/xru/olP1BwC2KWyWG0gC0ZsEO+UomBMw70P3qbQ+5Jvx1o7QyQNaw5f7ogAEKpitHanCCmE17p7Ve+/ux8LnLDIxL3vRwzGVjNCyJVXKHCe3Q+8HMMykH8BW//EmkINa+rU/xpA0cXfB/6PZGGkP6TlxzKAPRfrQa6RnCfeUII8/YPWetuntpZzlI+i3dXntvj4F4E8NK50Ig9NDpDfu7vi9OlFxnjd9YI9Sip3hAAbA8mrrjDmFMbQrLo6d5QoeZPUukHACcZ65poTfJ8yIQwt4nfTiCqk6NIY732CTn0XVik2rtjGhqAgjtR/DUmuN8fnjr7D2AJNAPGNvdvFEHhnjS8BTZvaCan3v8NhnKRlVjp9M2SbBA9S+QMJvdPLYv+j652FySBzPq711sbwvLEO6Y22jBPX7ZyFSLMYXHiIJ6fXhaZ78ew3pLdfdfDcN50nUORFc6e/TrUOiKCcFLlg3lfUkeSf3eYjC01eRu8H0WEvxsGcVKh4IPM2p/5BdWoAVTdaQiAIHp0DWXy8G/BKck3L+6juPHaqk703qIlDwy8QbWKyDwWCGwL01qK2d5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+tc34j5uMZ8XKF519KlKl1tmuuBeSq6NtDsO/G4/KKuD/zO9Pjn2ts9vhCa?=
 =?us-ascii?Q?75PJEz/iPqZm4jRecCff7AyFF1yOR4KSgtpF4bifhYO9mDSw7vymIykJgC/M?=
 =?us-ascii?Q?Wz28z/CRWbRYbZqZfuF2qjES3rFka50roI2lRFM5O0spD4raGclRhhwW1gW8?=
 =?us-ascii?Q?d7rI/TSe8k9YdK84h+fWMZILCatzsm8BBSVa0Q/AibPMgleZcKuRMdHLw7fq?=
 =?us-ascii?Q?jfSiAsY4D2JTFnLcbOUfjUUhc1fbAFirOzNNlSdBQU2++ifoOEla8NoFs0hf?=
 =?us-ascii?Q?Ol0ACkswBNayFAD8hIAJNUMxn9yA8aKx//liz8Hgl6iuDTzJ078bwc6vlMgW?=
 =?us-ascii?Q?zf2YYs71ssjwuQzuSoSG6WbKmkRt+EWpmA+vMrljpHDqAdKy4NGYE8oYovrC?=
 =?us-ascii?Q?vA5uIeEIt7oDXu+A6DMrta0Cr/LfhkS2vgqSwGSV2jaiCGT4MKmGe4tRPjjA?=
 =?us-ascii?Q?O3PNr0O5sm68B9szRc3SS0FWX1HBcEtVxoEEXcBZHST63O+HCKEDqsjv4ZLB?=
 =?us-ascii?Q?72hZrV28c/o8kPy1zfhPlz8ObuToJFYNVXkQbtl5g2RTqAhAo+KCOyB+fxNt?=
 =?us-ascii?Q?eQFX0H0zxPVFHcym1pdGP2T6HCOpRjPncH7w+eUy4vTOodwVpnlw6Vgs6uYv?=
 =?us-ascii?Q?6SE5e8JcSB5X5bprTHhoGBBO7zkG7YgSXgqTZn4hY+CdeGehRzzupfF/1qYe?=
 =?us-ascii?Q?BWhl0qWBaiagb1g1p3eJ3pcDXrhqdKp3IzQT2H+7DwGEXzMbB4d3wbiE/lP2?=
 =?us-ascii?Q?u1m8+MSLS744L+5uAAKrVV/rKcEzatSK0STvqawEza2fUV9R8Q1RkPcvo//a?=
 =?us-ascii?Q?oFiJO83t4POQhKA85W/JH72FRQOMCsWPczFmM4UXNSZLti3+7vvvvkcuy7C6?=
 =?us-ascii?Q?x8He4E9xSRziAuhuu3R3E+ie6Bhxt31ub4TjECNs1t3l73Jo/iar4BRYw+3K?=
 =?us-ascii?Q?OzILx9Nq10DRNojxrX4fxjuVsspk3H6VYesLpYa2y1DopsGb/rG8Za3XJXzc?=
 =?us-ascii?Q?yiY3vGafOTfCJp4TSoZB1ZJWNoNjJKMHRCs7KdjZdi0CKXyt1rcuoujYEzhi?=
 =?us-ascii?Q?Ng4tSKjbc054tLobO3OJFGKC56+Xf9X0IJ2M/uTXVALpA4vZW946ERXhrhBC?=
 =?us-ascii?Q?hAjtZDK+hEVC1uzIxyleOgfGKzEI3qQbFXLHVZ9k3LcArU/5Y2+Lkuio50wr?=
 =?us-ascii?Q?MsQVyzjdTGMpDOdPZxu+SYgt/oM9erMt7hi9ZXGBHHsnFxoiKs5csMneddA6?=
 =?us-ascii?Q?pvXmgakO2kbxfevLh8suhWSAX4LxbjlrTigGz10tJm60MwVvzzhN0cXQutw3?=
 =?us-ascii?Q?zHNpTnxo9G33P4upcyI93TOcVSBCix/w9DHlKjVndawm8iXxiZ6NPqYCcUfk?=
 =?us-ascii?Q?J4C5LkS1k6mNYSdNeNc+wUI1Gc39l9MHwIREhlzvzaZ2dxVcEav+GLz24FdT?=
 =?us-ascii?Q?5kf8xOZpPqxA8GJxTX2RbwfMhLZLcohD4etBgLigMuC4/WoSTkgvw50f+yoS?=
 =?us-ascii?Q?2vJEckAoy+cof5R1ipwcP+CPgYzgfsN7YR9lgDCSDjbF/Vk6bZ5EIBfrf+rU?=
 =?us-ascii?Q?TC1M+hEVl9mwvOyTJsQOI0u4E/Z3g3z5mH3aM9DR2OA1eFCU7YC6fW/tXDs2?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b7cd6d-2b04-4da9-2c63-08dc49dff21e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 19:48:57.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSxuGntIPFlH+1Z05jAOZRz5EnJkRao/VX+59lC4AlbidLvHVunGE9OFJHz3tyhDnkUOdcZqTzJ/cYf5KmveYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

On Thu, Mar 21, 2024 at 12:12:19PM -0700, Vinay Belgaumkar wrote:
> Return failures from pc_adjust_freq_bounds.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 6dfae1c23946..9c110537d135 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -695,24 +695,28 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>  
>  	ret = pc_action_query_task_state(pc);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	/*
>  	 * GuC defaults to some RPmax that is not actually achievable without
>  	 * overclocking. Let's adjust it to the Hardware RP0, which is the
>  	 * regular maximum
>  	 */
> -	if (pc_get_max_freq(pc) > pc->rp0_freq)
> -		pc_set_max_freq(pc, pc->rp0_freq);
> +	if (pc_get_max_freq(pc) > pc->rp0_freq) {
> +		ret = pc_set_max_freq(pc, pc->rp0_freq);
> +		if (ret)
> +			goto out;
> +	}
>  
>  	/*
>  	 * Same thing happens for Server platforms where min is listed as
>  	 * RPMax
>  	 */
>  	if (pc_get_min_freq(pc) > pc->rp0_freq)
> -		pc_set_min_freq(pc, pc->rp0_freq);
> +		ret = pc_set_min_freq(pc, pc->rp0_freq);
>  
> -	return 0;
> +out:
> +	return ret;
>  }
>  
>  static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
> -- 
> 2.38.1
> 
