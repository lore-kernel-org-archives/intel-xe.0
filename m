Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB673CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA7C10E14F;
	Fri, 17 Oct 2025 16:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j31VfqMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDB910E14F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760717237; x=1792253237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oKzTsbB3YGH7cxRzJtYfV6w2sC5isEvvgcyRiSu9g0A=;
 b=j31VfqMumOhEmtYqhommQuoSrnNzpv+PPeJwuJ/uZUunUqD/y94DAqC4
 dihIO9mDyex+0ne7+KVLFDeIyWgBN3Frx7/rvL/UIy5z7t8q0VbaUhNz9
 qliPTcPYkaPAd2ZpNEFWBVe8Uwme7Qgbnjzs3j83u04dqKGvBnfdqEDWk
 szllLWb9cLil+ut9TRaVUMHP6eT+VrVjsSD94SK05nSMeS1Arm2BkNp9q
 vaYeca8BFvVoYP854AHRGtepqxEAcXvTxz6tEO2z3OMKBBMs3bxUkUh3I
 prc3f1CDjxijGK26jx7C2Xw4OgYkoma1jsIcYdoi7oxv4ATKpm9UeR3/7 g==;
X-CSE-ConnectionGUID: 9f8fjVMnRoCtWwtwJzD2ew==
X-CSE-MsgGUID: KN6+qRQzSiiR/aF/aMPEuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80376905"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="80376905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:07:16 -0700
X-CSE-ConnectionGUID: 3OrhvdPSRvygE0nmcT3KfA==
X-CSE-MsgGUID: ddH7vjeiSuCfcmvj9OQU3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182320021"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:07:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:07:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 09:07:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pb3KXorza+rmeFbQ0H4T4MpNBz9UMv5S+7YcYehMd5faGhs830lsbB7IzZK039H7dq3dE+Bvcs5M/S0yJ7SCHhEb5fDUOMt+kWTQX8/tJhe0L2o1qrw3Ow4HPFp0GpOQwolk9epiypqmTMgxpFGlf4my41CQL2Jgu4OkJUVO3Zim/Ha3eByETaia8UNSSY//OWwyvDgEjWJAVotQ7uwX/cu0tXT3I+sNxUBBpL9Hjr+YH07qhx6ncKDVxys+3XumykcYeNyDHSRSvuQiy7xvPsSWefhATQAGjHNyeIyI5gN+zsz5ruEeQfQ2umVYJnyiXRut1hEnq4ZxTW4h58qxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfLuCDW8fqyMlbexz9r1Vr06xgLRxn3mvnx5hT+McFQ=;
 b=OVpW4CB00zTCahHy8/wKFzFWM0bsRVOEZ53R0W2nA5iMhfaaHMZwtG/YUWl3HPs8yQVkzTzxgWIFzSDvCthTtGbbJIlMlHYJ0qNhrz8DH7eJYQoH+iogxDUSyIOsQtoIf6xd2/8I3pSNIw/re8YTATlp4+1mrIXn9mjN7zhWSQq9kVuYGGvmMDGu/5qD5bpAIeyKP/MVstg6gPPVPmp4WnpfcMvunGPHIBaOZn2Kbua6yooOcXmtydX+MnIKSZ1lzCR1I/hgKN5jiZh7oOgTjZHutnPBmQZrFaDZdWYpB54HEMGdRWQMqmIvuG1m0uVi/4Au0jWv4zLV9W/UISRA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 16:07:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 16:07:13 +0000
Date: Fri, 17 Oct 2025 09:07:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 20/24] drm/xe/irq: Check fuse mask for media engines
Message-ID: <20251017160710.GT5409@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-20-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-20-3dd173a3097a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: f6331645-a360-477e-d05d-08de0d973c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XwB48B5k32MNMAmaaOgP/YtFjgy8VKvShtOaLJmwMx/yRcbqAZxBrFVidKiN?=
 =?us-ascii?Q?Z3JV2n0IDYHE5hZscoUJkqqib5Z2JQSs6Z1t10T8McrE2ETgtY4mz/hzVlcN?=
 =?us-ascii?Q?V91uI1OoYyFeCMZR/BL68pPd96jdWywiCoYdD7ZTifnO2P3kihBvIc158ZLF?=
 =?us-ascii?Q?fWpZmrnmLnOKVQHg6czPjAf/iXhjTuOITux3ReirDhq+pz9gyJXUktCcymHG?=
 =?us-ascii?Q?7zL8rk1YTRiuhQHuIqEnbMloFE8xqdT6v5NnioWaKnnPKMDE1mH1k7HxLZML?=
 =?us-ascii?Q?KayTmXKxEK6JS0HQV/PwJseUzH79Xb7CnT5nfDtNRQhgSMiAvSrXL6bExF4h?=
 =?us-ascii?Q?t6mU29Kz4GloZiVNVFdJc4MTR63l4xlK6Q7cRDuvUw06nni0qfjPuk/n3t/N?=
 =?us-ascii?Q?avpa6md5Qz5VLbJbxulfXmXWT02pGL9DZdOQzp/+hvzuOwIQ+0ESZy1Cagni?=
 =?us-ascii?Q?vmZAr0wr/sUuD8yfQE8yFIaxGGc1IbN+KpUmKm+nQGVPJu4ihqUlrCwENpDm?=
 =?us-ascii?Q?cq5Y+Ch9RN/QH54Or66W68iGafEjBTYpbXiovq6HtW3IoVLQE2+z6Qm/Kc35?=
 =?us-ascii?Q?4Ppwk6wL7ypGuZUEC1Z3h5GB6hRiuqi4UQKSBsyNBu/sVRkwFxY9xO+LoPwk?=
 =?us-ascii?Q?8TORrAAXB1iFr6ereaSh8cJntHrClnPluIAvbuDIUmoGwxcCoKGp+CZMweQF?=
 =?us-ascii?Q?+TdZ4qJYR0O/s3y3hLh1gT2YIYB1XidhK2g6w89cZ0OeRDJNAuXnTA05CTa1?=
 =?us-ascii?Q?f9q1re9Z8vwvQ8FYCGNRvTHb6zX4TJq5txLnPJLoDo0s6EZmKt59BIUIKAIy?=
 =?us-ascii?Q?WLSHZZgp8AbtKbgfJrPTFW9AaV5s4VxpBAIpLAsqGUY3r9VfyTsLN73cKWZa?=
 =?us-ascii?Q?dogHXsJtJ4Qsp7EAsLbKhM4ZEvkUiT4NlS3ECw4sriNuowSSyBMKbfpIfBQA?=
 =?us-ascii?Q?Tn+jBF02dhG8Ly1eGFLxxjv3+DjcrJtnThOqOpXRp3C4oBQsz2NeSYdObwjS?=
 =?us-ascii?Q?SaXzaIO0cCYKI91N3tNSbj2sAn42v5jOz59tylZG0HclJyhQZYrUyWKXtN0e?=
 =?us-ascii?Q?AyewoDAjFB9XG4eFPlwWpo/aoDXy2YEK8pMenQ+zhl9dY9JvVdLxEadUSjiq?=
 =?us-ascii?Q?XXxEtIjBZongh6CyS/dPvHmqW2fwvaEg2iAMtJTb/fnaoYjFlWGmxmZmEUIu?=
 =?us-ascii?Q?8T4Pz39pxm2ZWlDpiodOGS0fuOhO9U/nfKzRydN9b37XAuT7c3ZEIAvPrw4Z?=
 =?us-ascii?Q?IvGuybDU76gnEZOATZDxfYXT3rbaM9JejxW6e8s3hPVLLSPluCQh8VoB7dJj?=
 =?us-ascii?Q?atTIG6/OzTIrfxjrRHt9STCw9FyKh3/FfhegHc6hoTM23s/lRYX5Z4cPE5pL?=
 =?us-ascii?Q?Oo5KBp1aslVxsBPp23ILpe3hoyQYCsoi+ZwpQFWYrN8+WNtcS78zYFCytrE9?=
 =?us-ascii?Q?kv+ZYTJKHUIke44QakRcVB+PKV5CUi2F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DefouF3QPpcwTvRZhJ6e1Izy0s5nm/WVuwUR3+x48VDXtrwDPmlV+dpdKUjp?=
 =?us-ascii?Q?jPSk/SwIS6aZkM5fNRJfUK/01+iJPrRwrM82A2+uivGvO194e2dRiwnQ+pEc?=
 =?us-ascii?Q?iUL2dtPauxI/JqHBYUOvhdH5eMcTJMBW2spO/rbbtH3OOZbv5C11qFHDqZ+U?=
 =?us-ascii?Q?7FMDxSXVg3AqKFuGnRi6q01Osb8N6OO0GptjftwwIXEGak6ccsyE7udlFCG5?=
 =?us-ascii?Q?dfNxL5Yn8hviFu5xTI1RFCjYGs6PZay8ea7vcNtjBOWeKSwPBHVcq0E/azAf?=
 =?us-ascii?Q?rdHPweneqdW9j968HQe29ymhLzRBnj/WbBNNmT2qkSs6dA7DCwqI2YbqEvW4?=
 =?us-ascii?Q?Ndr/cmYOEZPQTV7604DnmASMD8kvp3c8V6syncey86+ziVFywQOnKPWbh0nx?=
 =?us-ascii?Q?6ae+pdk9ysHnGec7jbt34QF7EORGAmjHjXRuWP7sXg+IlZEYwOvUeWxm59D8?=
 =?us-ascii?Q?9J1AiY0rV7Mxcmfi0w2ZQRSfuqXlMQ+hKckR2rUFlTEpfwdDfZYdKA/90Bb1?=
 =?us-ascii?Q?oqPysNyB7hTgVpue03HOsF3u3iR4S27sUQoY6CAHQDIaMgF6ezH4Y8keVM62?=
 =?us-ascii?Q?XKvAnJgquJ6vV0a6JjFnvXFuXcP5kG2ZwyAk33knkU8tqVCD2k8AcWYk0yH/?=
 =?us-ascii?Q?qrdt34vSUUGPuYUVi5rRpOLvQkiU005pJqC0OTTJKHBkZw8HBAy8t3HGl4ES?=
 =?us-ascii?Q?4bQbcPpASMTMrl4JksaD/gp/vvjvJcQXKbNXwfMQuc2Cc79HRanX7/t7/1bn?=
 =?us-ascii?Q?AyqR24rcvKSn7ZU6smvqOUVV8DTvQADssy79N3mCSfcoMVz4+YKMvrHUt8rQ?=
 =?us-ascii?Q?WkQjgyO5pXtjKq2OYncOS3jVgkiuW10CFWxaNeG5nnu08mfXR/vlyTToutg9?=
 =?us-ascii?Q?qVLXRW74S1X5qkDq5F0zoYXOJXF84UT6+aYOLbVctRVMkpSLJ6QlWe/414Md?=
 =?us-ascii?Q?GJXiRpVhhmZOfZKkSPuYtO5nmHOX31ifZDJ9cApYIUlIfAkkfJOS7Jbi9xS1?=
 =?us-ascii?Q?ozIaiY8dhDbQuWNBv65ZCrhH3fbAGLuLE44W8h8l2C4FjAFYk8A/X7quY0u+?=
 =?us-ascii?Q?p5HYibo524HX63xNFtX5amPDk6WYf2DuFZX/mNhveSzdYbQ4GB9eH82Q/r+5?=
 =?us-ascii?Q?rLwsyHQizvplx0PvpQHKQ0ITXXuYHuh8oelDp5VRia6yDFJ52zC0L6Ux0ehn?=
 =?us-ascii?Q?HTEq7Bk8Juy5CMZYLut0wus2oKWijx3NcfyObTwMBBmfpoxaCSZLwVsIQoak?=
 =?us-ascii?Q?CAexfIbWwhaWCLqUH9RDPEuWu3okreMbxXMnWxiDb129Z0xHhOI+MSz1ZE49?=
 =?us-ascii?Q?mu8MDIk2lfb7rOGRpSuDwJHxrBRKG0qdALpfqTxdqvxi0tdTgOmhEiqGH7qJ?=
 =?us-ascii?Q?jcTJ3YNiTQPqQAuViq8buV+bnPhxA7VDZwr+FbSyTYoYOxWqFt6alBb8y6E1?=
 =?us-ascii?Q?t6BtAIaLfm+G+hUtR5qvDDDp7/8UKlrsR68bQb7+5OmvnLAQxe/fmuwqsMuu?=
 =?us-ascii?Q?PCvUx4GZdzDnG3dZDhHx4FrC1Od0BAeqP9q4gV47VK30Amovvz2rHILZpZrM?=
 =?us-ascii?Q?Ge7fimAW6JyOrCpOP3/j9ZT3qwdQiLdf9AMhPt7TJ6t398An9GwxbjhlnG9a?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6331645-a360-477e-d05d-08de0d973c10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:07:13.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L6j7vw/2+TGeMiCG4RjLtfa4/0IzJ7Rm8jlIMqb4mebVKAYcVe0fSoMZW5VTN9z20KzV/A2Wf+yvdwz3Yo/QuEbiEdAhhx/XNBfTegrLhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
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

On Thu, Oct 16, 2025 at 07:26:39PM -0700, Lucas De Marchi wrote:
> Just like the other engines, check xe_hw_engine_mask_per_class() for VCS
> and VECS to account for architectural availability of those registers.
> With that, all the possibly available media engines can have their
> interrupts enabled.
> 
> Bspec: 54030
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_irq.c           | 17 ++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index f6117720963b6..815d5e3d22099 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -65,7 +65,10 @@
>  #define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
>  #define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
>  #define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
> +#define VCS4_VCS5_INTR_MASK			XE_REG(0x1900b0, XE_REG_OPTION_VF)
> +#define VCS6_VCS7_INTR_MASK			XE_REG(0x1900b4, XE_REG_OPTION_VF)
>  #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
> +#define VECS2_VECS3_INTR_MASK			XE_REG(0x1900d4, XE_REG_OPTION_VF)
>  #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
>  #define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
>  #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2108c86ed478d..8f2c8d3ae5f8a 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -205,6 +205,8 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	}
>  
>  	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
> +		u32 vcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +		u32 vecs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
>  		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
>  
>  		/* Enable interrupts for each engine class */
> @@ -215,12 +217,21 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		/* Unmask interrupts for each engine instance */
>  		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
>  			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
> -		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
> -		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
> +		if (vcs_fuse_mask & (BIT(0) | BIT(1)))
> +			xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
> +		if (vcs_fuse_mask & (BIT(2) | BIT(3)))
> +			xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
> +		if (vcs_fuse_mask & (BIT(4) | BIT(5)))
> +			xe_mmio_write32(mmio, VCS4_VCS5_INTR_MASK, val);
> +		if (vcs_fuse_mask & (BIT(6) | BIT(7)))
> +			xe_mmio_write32(mmio, VCS6_VCS7_INTR_MASK, val);
>  
>  		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vecs_mask) |
>  			REG_FIELD_PREP(ENGINE0_MASK, vecs_mask));
> -		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
> +		if (vecs_fuse_mask & (BIT(0) | BIT(1)))
> +			xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
> +		if (vecs_fuse_mask & (BIT(2) | BIT(3)))
> +			xe_mmio_write32(mmio, VECS2_VECS3_INTR_MASK, val);
>  
>  		/*
>  		 * the heci2 interrupt is enabled via the same register as the
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
