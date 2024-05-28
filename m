Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D045C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 17:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFAE10E19A;
	Tue, 28 May 2024 17:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKa2ry1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E176210E64A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716916834; x=1748452834;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/LoKHhwLCKn7bImAzQxCPZI2SAWHoC8Giz+aP4x41i8=;
 b=AKa2ry1ak3CAW/0S+FQQP3nukZy3bu6ZX+NE9g3wVQ3FX5hNwSuzAFqO
 0wXs3ErO4CjeGGTSMPuUAR5OvVkAMZJz0YKa6sT/e0qTl/jeYvWWxOozf
 zeB14NPCZWAvAFLVnFBzaMjz8YefNsArcyrcOG79vTtQE4/g2hCkCvH5J
 I4oFToH4MBp8F2Rpp9KjU73BFi1xOdyMj2acl+68L4JeaVOBYFPvBaAj0
 sRGduVHt/J2IrDQxaJmmrXhNDxmgklwi6HCoAv5/009lugXTUfTrg0HVK
 bN8O9UKq8kDIPXMNun+8WzhpvqZy8O90AHLY/b8GaTt+vFdZfL0EVboIk g==;
X-CSE-ConnectionGUID: ke+cY2kPSUCdyV1jy91UQQ==
X-CSE-MsgGUID: eR+K9cG6SSSdmMGXcHOr+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24695857"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="24695857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 10:20:34 -0700
X-CSE-ConnectionGUID: 6QU+buZgSMaqQxW90L6fPQ==
X-CSE-MsgGUID: Li+qVacLS3iQLnI6VdztVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39578019"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 10:20:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 10:20:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 10:20:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 10:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTg6fskCtBQNDW+ImMzbz7or8AI81y1oj1HDwTDWy9A/nICeNIRbZ3U8PgVfoAlj0hiYYj4wZ9DRrTSXHMEFzI2BH8x2GuS23uqurCF7m3kDLald+05CSiUHB89t0TOk7tuworeJfAV3SkbduUg8h1LWpf+r9bTBvUDOCMUdlawBatbC/HNCcN58bPwCUduSth3VsYxO3wQoijj/Qp2RJ+lx9Q8EjwPN4Ib0uDjGxmZjBivIo4C2l+9BySqjzVPa7As0MlqX46k+3CYGVNybK+pbhqNquRRnslLckzuIkjr4ddhXQF7/eeo+nheE6lE4LzZ+XbVg6PAYcl0n/7LcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/ixx5zc/6prdy53XFUExnu7k9Ox4wmYZ6kRC2iZVtc=;
 b=bHdWWoH7rfuSKNEcIGgdkPCCtzW9O461Rc0IhINT3i71omMAeLJOHgYZvCnsv5OyjSUsPSLB5sqaOy39U2B4wwGN2sJla5F+/U4AR7+ISJ09BdqM0O+BhxKC4553L3ZpSLSe+9NlXtftf3Pp1N92UAqoIOQPQ1yBG60swvQA+L1iyB8mgr8BLbaYupaY4EYjlU+uGbxog1qfx1OwsTn+DUiUfPMSuV6jEVx4jRP8ynCkhQ5OmEXF5jM4blXtlN5yVx2vMYAalKTElDNRw9HKBgEtLQucHqbEsS2NMx0gAkH6sYRUNfO9ZwL3YGMd2aofqeG3Ln855teO/cTiE7iBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 17:20:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 17:20:29 +0000
Date: Tue, 28 May 2024 13:20:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Farah Kassabri <fkassabri@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Add device CXL capabilities identification
Message-ID: <ZlYSWtHd8VSRUDll@intel.com>
References: <20240527084031.840699-1-fkassabri@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527084031.840699-1-fkassabri@habana.ai>
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a1e76a-2164-4b1d-a9f8-08dc7f3a7924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?S3dwGWZ8ybORTK22f1SZAIpNv8XjbNt4AJO5gtNkg04gdRjPG3guoTlxou?=
 =?iso-8859-1?Q?B7u/I74qjRtnYqmTYqso/v6JgQ2W/lvoGH/7FAmwNWoP7I0Y77a8jPc8Dg?=
 =?iso-8859-1?Q?C68Wapf/PNY3c8ZZifef8RDYeckEoEXddyLtw7/JMmQUqaeC61BvEKrz0q?=
 =?iso-8859-1?Q?Qm8PmvyGw1QejG2NMFnKCVBxYYE6iTU4kcS/Th/gqTQ5TLyoV9zOghH3PV?=
 =?iso-8859-1?Q?NkMqdC2e3sXhV1EQrUurdglqvmNH0OA0QM1b2FOcuIW2p1VR7FlPEhXOuR?=
 =?iso-8859-1?Q?YplYL/OSphNOkIShs+r3aLqn/GtNZuUXQ1WHYZUr4wKSzcJO5IFaCb6h44?=
 =?iso-8859-1?Q?jc64rqeesFhhYTvQzRgK8dpa+UqXkYhdxAFIIP0ZZPxbDPnwRFbmvrPDJ7?=
 =?iso-8859-1?Q?Ts5VHCUC4cWmkTZHM2pX5Ywvs2ayVnEPeTNpdcGz0WTbCPGM1LXEZd0329?=
 =?iso-8859-1?Q?irPpbXKS3gNNPV7Q13rctPj1b4a8UtEMBZTWYcyIuyB7K8sweUtWybxTXr?=
 =?iso-8859-1?Q?7nJOsQzK17yvY+OojCw98gtNXRp8vQdELSatxK8xBvkzAZgRSWChdrfvIn?=
 =?iso-8859-1?Q?BV6gNTKcf6fezJLhvNhfRUCJfb07mMnxrJ/mRLAZRAaanaQCJvxr8v8K/A?=
 =?iso-8859-1?Q?oFv3zhE5TgbSY/dcr4lxdCtkU3kyNVCItRlxhw3JNB4xPAa1igXDVBestu?=
 =?iso-8859-1?Q?qduQxKZM5H2EUgtRIzWog/ChCOKEZqJ5d/sOkv2alIrHlHO3JIu4PtyIG8?=
 =?iso-8859-1?Q?A/PIqxBTAEOVOjVjFauo2GcZjrKor00sPAR8C1udzZGCW2JEM0qfIz+Hel?=
 =?iso-8859-1?Q?tnDYCct2gI2X1sihzWcbmecGsZjzMnSJ85YJRAV/pQyDIO99EJJziPCega?=
 =?iso-8859-1?Q?nn4GnK/+7ekDhzXIGLB/zvSoPGabxeofVBaZmgB8q1uRZU02qf7mehtEnl?=
 =?iso-8859-1?Q?O6Tor7UqrXNoR/1vSn3t9bF3hOByBiwXbGUICCBpDX2l2YCUk3zKkInBwu?=
 =?iso-8859-1?Q?/ZhX5QHkh90Kb3nK1zk378vun6w/xunQmBsKo7fFRpX3qfF+3CrD3SsKhB?=
 =?iso-8859-1?Q?lSXKJ2CspFD6lQ4MQtIQRIS4iSf/mfHs+Hz9ThdDRyYi6+2woV5EgzB+9R?=
 =?iso-8859-1?Q?s85DeVkA/hxhd5uleSralgJBl3dsQmGXSVDkKY/pJE/a+OLSZFoOQdBYzi?=
 =?iso-8859-1?Q?mJOLtYwdbY7kxwqZJyXnw0A7pd64OmwzrQ7OqhcfRI6bVjSNEPrtWoCzfE?=
 =?iso-8859-1?Q?M6cReiBwZ2l46PVAccaJtUkJpIljoL0Kjjb9bzlh/KQHaKuuikxI9YxFUD?=
 =?iso-8859-1?Q?fbMPdoGc3AMeQN7Nd1NphByRgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?he6OpJuh8fESdSSHGF0dZq9fy+35g+LrUYYUTZJtmQMIJqH75LF6a1TBeK?=
 =?iso-8859-1?Q?uG9o1i3YpQj7nsdv6N1fbdNqvsYCtv1ckZpV0SZ7b/vcIQ6AfXH/Oq1syn?=
 =?iso-8859-1?Q?dLqHkS48JYiyr5gEygv6D1LHQN48dAUHN87+ByQN6Nmkwn8q+Hjm70fJjf?=
 =?iso-8859-1?Q?pMyyiYmS9WOOkQgeVHLsiVpdJt35Nem/Rb+ulFfTSchzqJa415zHqHg9CU?=
 =?iso-8859-1?Q?vTePVYCY7zCNerERA1A9D+RmIbn6ew1LTJ785X6F+W6tLph1Oapb3Z/J2u?=
 =?iso-8859-1?Q?l7XBfbLiSGKUl7sOPO2ubcomvw2dXQoDIRIrElQeTxFHjBqehzsh2n89v3?=
 =?iso-8859-1?Q?TEoPaDJZ6ZxZkma+WisJBHkZdcm6RNsULrebrl4cnGnO1y9WsH93k4J+wq?=
 =?iso-8859-1?Q?wPX6xJvad9sbTk3+ZaO0YOlJeuwvMFwxfnlFuQMKZ5nNX7ADM/1jq8PinV?=
 =?iso-8859-1?Q?2q2DCh0WxJs25VHlXArSp4MRvDT+8ysGrI2N5E0OhQMPB+/R+5tdpnoLt6?=
 =?iso-8859-1?Q?GPznaBX0WifAb5hi4SGBtSwqXb+Xbl6cspZCcA1ZFWDKkbgymSU0ovUK/H?=
 =?iso-8859-1?Q?aWmnoU0eh9ywg76Lj7U8yUY3gmbW7+BxOXFDGRWfKZjXYVPm61L2dEj4t7?=
 =?iso-8859-1?Q?xxFuXw455A9WsB9/izVK3SGNCResyd6MEb1pBZcTW7xYvkZMNrTEnjbG/d?=
 =?iso-8859-1?Q?2DHgR5A7PqM9eK3DfNx2Ezgj4cr8PQcQyZusbzrDwdojj8wEyOeg2qlKnZ?=
 =?iso-8859-1?Q?p02n3KMdZUfdYhhJWsLMzqFcib4kGIB0V83d46tonytvVzr6wz+GKmnXWv?=
 =?iso-8859-1?Q?6200aWlOX6Ix2skBFavO2vyb4HkGtM+pfNI9aZP9tStRmjP9LFBhFbSRhm?=
 =?iso-8859-1?Q?Vh1MJi7r2z9ccERSM3DruSAFcQfbRZR3oXOW31ywfpt4dfmjd5NGHkuMjl?=
 =?iso-8859-1?Q?6OJktjP0hN7NPlNZKotl36yGMc8vdBiKU/jnZuceNJcDhD3jVDJmx1mEGU?=
 =?iso-8859-1?Q?NDmSOH5dG+NcR+Cyfu8rD4KxFoNXAEwxKDJWESgzxtxrO9GophAErbkypO?=
 =?iso-8859-1?Q?9go7DYoYhmIv3ozdEmzWhwDCEpXPQ9hpqLELArrHo4O2G40a+c6N0Po1yZ?=
 =?iso-8859-1?Q?19L2NS40SRZwjLMeTZ/uP4hkFhToQZiaBcqdpT0IHIlMeu29MP6rp2zNvY?=
 =?iso-8859-1?Q?znM9+u4pVMs7HPtPjtmXOADcf3qCbp92usTNRwJhfp7pg243Ms5gBIwQAD?=
 =?iso-8859-1?Q?eKVzr4AQ/Bcl0GrD3736EzecDG22fRaTm295q+nILa4tW95wCK5Uy2t2dz?=
 =?iso-8859-1?Q?mOlH8P6Ji97pmmjOBAZK/CI0mfZKCYOYjiqVCyzv8PA1qHU3dLVxPcOwKf?=
 =?iso-8859-1?Q?Mp/0nFheVublI4XQQJ38V8BWbl8k9+603jOfZ7TzMWzYcgcsvtGwsltqWr?=
 =?iso-8859-1?Q?Je2efawKlSIZrH25WbMAHFvhWnSHY3Pm/LDJnb5OnVUp4+d64QVkEBEhgr?=
 =?iso-8859-1?Q?3mCKlVhTtGQyp+VJ/K3pp1xtsaxCGTZkZEkprbcbS2pSulSF/CcrOVA9Yy?=
 =?iso-8859-1?Q?Gfub8AfdfgCK5tXE2lGFPyFgUkrCyO1yhJvgp3sdSK+jg35qPqHDxqSiI+?=
 =?iso-8859-1?Q?DudOJD+Fq2DBymP/5ARXK5M6uzfsgXP2C8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a1e76a-2164-4b1d-a9f8-08dc7f3a7924
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 17:20:29.8879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQH+m52vWR1wfN6AzIuA/IIv7LTBAmx4Tn5B2Wx2GzJNGA4I9AcC6sXg08ei0xTIiWdB8pKcZBiw9FiwFe5YTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

On Mon, May 27, 2024 at 11:40:31AM +0300, Farah Kassabri wrote:
> As future Intel GPUs will use CXL interface with the host
> servers, this patch will add check if the xe device has CXL
> capabilities or not, by reading the PCIe standard DVSEC register
> and identify the CXL vendor id.

The biggest question of all, is why do we need this?
PCI also has a lot of capabilities and we (driver) don't have
to expose that. Why would it be different for CXL?

> 
> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
> Changes in v3:
> fixes following review.
> 
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_cxl.c          | 51 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cxl.h          | 13 +++++++
>  drivers/gpu/drm/xe/xe_device.c       |  5 +++
>  drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_cxl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cxl.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a5959bb7b1fb..65c0a0317ee7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -65,6 +65,7 @@ $(uses_generated_oob): $(generated_oob)
>  xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
> +	xe_cxl.o \
>  	xe_debugfs.o \
>  	xe_devcoredump.o \
>  	xe_device.o \
> diff --git a/drivers/gpu/drm/xe/xe_cxl.c b/drivers/gpu/drm/xe/xe_cxl.c
> new file mode 100644
> index 000000000000..78e4179e965a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cxl.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_cxl.h"
> +#include "xe_device.h"
> +#include "../drivers/cxl/cxlpci.h"
> +
> +enum {
> +	CXL_DEV_TYPE_ONE = 1,
> +	CXL_DEV_TYPE_TWO,
> +	CXL_DEV_TYPE_THREE
> +};
> +
> +/**
> + * xe_cxl_init_capabilities - set CXL device capabilities
> + * @xe: xe device structure
> + *
> + * Set CXL capabilities and information of the xe device.
> + *
> + * Return: 0 on success, negative value on failure.
> + */
> +int xe_cxl_init_capabilities(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u16 ctrl, cxl_dvsec;
> +	int rc;
> +
> +	cxl_dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL, CXL_DVSEC_PCIE_DEVICE);
> +	if (!cxl_dvsec)
> +		return -1;
> +
> +	rc = pci_read_config_word(pdev, cxl_dvsec + CXL_DVSEC_CTRL_OFFSET, &ctrl);
> +	if (rc < 0) {
> +		drm_err(&xe->drm, "Failed to read DVSEC_CTRL register(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	xe->info.has_cxl_cap = true;
> +	xe->cxl.dvsec = cxl_dvsec;
> +
> +	if (ctrl & CXL_DVSEC_MEM_ENABLE)
> +		xe->cxl.type = (ctrl & BIT(0)) ? CXL_DEV_TYPE_TWO : CXL_DEV_TYPE_THREE;
> +	else
> +		xe->cxl.type = CXL_DEV_TYPE_ONE;
> +
> +	drm_dbg(&xe->drm, "The device has CXL capability, type %u\n", xe->cxl.type);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_cxl.h b/drivers/gpu/drm/xe/xe_cxl.h
> new file mode 100644
> index 000000000000..82e36285c383
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cxl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_CXL_H_
> +#define _XE_CXL_H_
> +
> +struct xe_device;
> +
> +int xe_cxl_init_capabilities(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5acf2c92789f..04677c9ff10f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -50,6 +50,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_cxl.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -312,6 +313,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (WARN_ON(err))
>  		goto err;
>  
> +	err = xe_cxl_init_capabilities(xe);
> +	if (err)
> +		goto err;
> +
>  	return xe;
>  
>  err:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8e7048ff3ee5..323c3d57fdb8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -285,6 +285,8 @@ struct xe_device {
>  		u8 has_atomic_enable_pte_bit:1;
>  		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>  		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_cxl_cap: device has CXL capabilities */
> +		u8 has_cxl_cap:1;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> @@ -321,6 +323,14 @@ struct xe_device {
>  		struct ttm_resource_manager sys_mgr;
>  	} mem;
>  
> +	/** @cxl: CXL info for device */
> +	struct {
> +		/** @cxl.dvsec: offset to device DVSEC */
> +		u16 dvsec;
> +		/** @cxl.type: CXL device type */
> +		u16 type;
> +	} cxl;
> +
>  	/** @sriov: device level virtualization data */
>  	struct {
>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
> -- 
> 2.34.1
> 
