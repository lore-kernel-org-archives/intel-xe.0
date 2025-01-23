Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0ADC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 10:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FA310E7C7;
	Thu, 23 Jan 2025 10:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqGsWWbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87510E7C7
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737628615; x=1769164615;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RW+MFu72HD2klUJm8pHVEE2qhzR3Zuo4DZs58mZCuDQ=;
 b=nqGsWWbUD9Z33v8bBECXMSsBFutYqLC1rTaWvt4dknmoSkMb3FC1HTwp
 ekOvymDKTQYiMp52t01jrL4r1a7Ng1BuzMJB9YF7bCuJenMkaiGSaWVip
 2g1niZlNZPLFDIqT6L9wBXHEU0p/PaKldF3PXjsUiCe67Q6Su4TOO1TP9
 F99ZxIEg8JfNrJMyAE1speTChnm3ZJe+vTeLeOYhH0un1vXSbmKSgS6zO
 xoGYKr95lYCUAKKfCh2MPQqkWUImUXua4ZFUAqAsBWndpmNH8McJTykuc
 F/YItf+RHPTWzMNmK73cjcJ6BGRLgWxsg/wglbolpwMjqC3RJM4V7wA9e A==;
X-CSE-ConnectionGUID: BXAtZsXkSaaQE3R7jWKOEQ==
X-CSE-MsgGUID: uF+FTftRRACc/GiwT1b3Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="42050524"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="42050524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:36:55 -0800
X-CSE-ConnectionGUID: pVLkG999QNWrrsrtzRkKxw==
X-CSE-MsgGUID: 4F3t0X4DS+mo0MVaVdDvPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107267901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 02:36:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 02:36:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 02:36:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 02:36:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvmQ06ffBRi6ow1i6O+CAyJQOZI/Pyh750c38sDL2vooIo5fj+2NEVb8EKNcGca2I0AwMJOsnLou0bYRyFd35+c4dAaaG1vqdIPCHPk0rTPv17D2fa4AyYjV1DOUNTHcM2QdCCK27G+PiFeCszPC+Cheu2/p4wM7pyvr3mtfBA0yagkX0+G/VmpsVgdqr22rRoUMN7NhRwswHXt3uvJhha1OjRLMszOeNiaJ7RRux9FavmpG8Uo3WB8z43vXVaVEky0iTtKFCoFFZkzdrjv/n6mztQ2LeEi9odEiIgOKFJcmnAaFFZt0QIppdqHwFblNeHSDkWKxfGK0HhKEgdMjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tItAGtSDvIplP9drWHc7VUmCwmNNoTROU4jQSw7rxg4=;
 b=ARljtt0QaS68QvUmjK/olw4Kjl5ksjxkxjeq34xCWrDqR3RR3r1WbXFVIhZ3mKAezCJYprptjlZIfa0+j/TYjWiH3gBd4xzZVramZy9eVTKnxB2yRyxjbu53upLKEx+r/fy6FqFXlmgFISkkmyKwPVZSgKHBf5SK/yWk8MjBRkQ2s4pHpudsJGNPACrtAGqov0VcDjlCMVgA2pRm36mKw9MwI3A2mMmyGRbsO2Nwfw8SxJyzp0HkVkdbEMpJeFPmjpbvWnxXyvuFZbdt7RMEQp/1HBMbB4xswO2JDNH6CngprI9ZumutgAFGf+UzrHdwEeqShFIoo7SNc2l5s6qhrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 10:36:11 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 10:36:11 +0000
Date: Thu, 23 Jan 2025 05:36:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>,
 <lionel.g.landwerlin@intel.com>, <carlos.santa@intel.com>
Subject: Re: [RFC PATCH 4/6] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Message-ID: <Z5Ibl_Lc_wyFeV8C@intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
 <20250123011513.362430-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123011513.362430-5-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::21) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4d1564-cefe-48e3-00a0-08dd3b99c0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7LuOFGg93oncj35BGlxiItkssR9CVZTTKVfM7+Rvp9xn77/4ahBeVVVwLk?=
 =?iso-8859-1?Q?NjZvRvY2ooF2QCpXI95q1gZj5KKiEIttcSojFemg+Nl0Dg0akSBgYjkSzM?=
 =?iso-8859-1?Q?d5PaETx3drv+TqwCeu9njFhpQdJudQ+jiYyAI2bwmJARytmmrxQi+jyfPq?=
 =?iso-8859-1?Q?MIx0cQ0VwcZEEG37hWtzSlUeW+OT0w9A06av2hFC58lZ2mTEWe1RhFBZGO?=
 =?iso-8859-1?Q?Yq2wJkfwCDXVw26P9C3/gm+ZEh9Ezy2z80H70dGouFzQ6BfX6oeXudVLO9?=
 =?iso-8859-1?Q?Wz1whJ3DdvU60dPGIAWMdwJ5WdJdjoIGIvvztzqh9tNKZiweA9W+gP8ud5?=
 =?iso-8859-1?Q?FAeulaXPSV0xSquu9QmBk1hZdPLACKqOjB1mcEkZwQsnDkDuZNQXCaG/u+?=
 =?iso-8859-1?Q?T4aXi47JUeP5F9Cwx4go0GV61J2fD5HiswHMPBAyqC7a2yTfOuhTOfTn80?=
 =?iso-8859-1?Q?dlh9Kv0sZzn4m3HPGty0GSS1zo6WUipDI4H++OxiOFBHJr6345svYqb6Z4?=
 =?iso-8859-1?Q?zJ4eCeoO1xmL1TnOGnuNkUAITLffkDG085KcE3JZ/6EZCNl+oBN96sfa8V?=
 =?iso-8859-1?Q?qOWk8Cf5PIxqwMxoARHmWAdoxotam7n9KUtaClUPhOF3c35SxBzeNV5VCb?=
 =?iso-8859-1?Q?s7/r/VTfQq/6HW8F0x8bXYITNC4lVbF3QrhzON/XQ6MmY6CY2Wt4iYRz8J?=
 =?iso-8859-1?Q?j+EXPaAzMwy8424rYbFdfgH+Y8TUNsgtp2ipZoInbGoVMNTbrrQubZ+D7K?=
 =?iso-8859-1?Q?V1ZkrlEq61EQtRnQSd6oOjPj3edbg4+tbXllpoiYuoFb+0gDSL1Yl+hH0o?=
 =?iso-8859-1?Q?Fn3CDzmf1DA8TfQ/FnA027STFUho9NJfGqPpuVPZgerA67dpz2h+5YwEJR?=
 =?iso-8859-1?Q?9evto/3Mjs9pCygxXwU/6Iuf7/60xtKZa2wUmfKGdm5ZWTxz/y03SVwW8f?=
 =?iso-8859-1?Q?KHHOny0qicsdRoU69y/hK0kdokYdy2mV0esGtY/5BJD2+jVqDZDd1ecb/c?=
 =?iso-8859-1?Q?CDrlyZLZ5aHqyKeNhQEJ2Vv4Eja6P3V6pkR5fKZ2m5+UnzMW9yk6u0xZCE?=
 =?iso-8859-1?Q?i/OfQhyMjjW8BkWKUkE0daVDaEUoMroEdEQ6oMA/5Ouc2X7zTlJqx258Iz?=
 =?iso-8859-1?Q?zs8XUAL9gSH6ZhK3GjMZlkR93QIQMugNC1bM9Wmv1rJi+889+KH+4JgMB8?=
 =?iso-8859-1?Q?uhtdad3hBnJFyEMDPlC4szZw6uFIW3XIRTSRQiFBFdiQUW12mkMEQ6GxxW?=
 =?iso-8859-1?Q?SiZhN/8bEiAAGXnWMy/YOiOg0QZQAXjjFQDBwx8TbJ6ixyV6QubqAdXjZI?=
 =?iso-8859-1?Q?Ol53b3cOulqo/xAFdjyf3yJJ9K/kPAEwq4psl0gRhFah0GP/NRkEmMId8R?=
 =?iso-8859-1?Q?9Zgm9YWLUy4YAcFoeSvugtj0t5xEVwTsUJaBfGN8ALQw/8dF1wHNQzHUD5?=
 =?iso-8859-1?Q?/f2YWt4v+C2h9OUD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YmkCoL+hse/9YURYHA3ItIB9MmfqVynEdMX/0GllMBj9lLhR0ypw4qobKZ?=
 =?iso-8859-1?Q?U4vOjcNqzuHcB41x2Y16LlDgSGvE45wz5iaJqONqjbWIvbPujbpgDEGHaU?=
 =?iso-8859-1?Q?YcvSRHe2LxN4KgL/d2F75pSsg4ItsrZyul85PEDBzkjPdV2K0nEu8gl6e+?=
 =?iso-8859-1?Q?fl29Rwo997z2RGAOSa6jffACrprTFLX9LADrhCx0VQuT2H1J3cKpyw9gzn?=
 =?iso-8859-1?Q?C2fP9KscFokTJFyqmHvSmK2UdJ6oQDYNlaR186GMAF2hMHPAPfoMZP0qu+?=
 =?iso-8859-1?Q?kvieyrrdJGHCOVl5WgMB5DuZERs/2yAuGZJW/Olwk/EOMmJMhTboAYbzj4?=
 =?iso-8859-1?Q?t5ETiO1SoL9AKf397s6Gi+WKWnAfYjOnX38aRaQwBCBJ/B1r7YBqbVv/Gz?=
 =?iso-8859-1?Q?IxL9Ya0qMMc+9lRZm/e/Zo0p/N4EMZFO7PsmD0y6lHZhSNaN58hb0CxKKY?=
 =?iso-8859-1?Q?kFSClYQiq3r3cc/CN3jPrA15m8UojG8e4T7EdgYyoaMOajPk9kao1AM0J0?=
 =?iso-8859-1?Q?1cJN7B/++m6Z0SUPGnPpqe/Q2+g9MU72XVbuqp4F/4KpOqcnRkYKhPe3Qq?=
 =?iso-8859-1?Q?QhtELd0qbSWnqWLUn2qwzpWiCqlYDF73abItxIrjNGuBu/oLqHFTZibZa6?=
 =?iso-8859-1?Q?lFvvDfLkWTTI/gxV8i39IiFFyZGePr7l1kBJ3/JhDVaRHCbG7wR7YMVpJI?=
 =?iso-8859-1?Q?EC0UKnD8bVTF/narIb5hZR8GoR3ePkKwGtEmj6xdzCK/BQaKFrAYNd8JBn?=
 =?iso-8859-1?Q?qb715ukSksDvC5xZXr0R/9zQUiiw7zeBpb+2r4kzj3c8MnE5A7tiYLzmN5?=
 =?iso-8859-1?Q?5u6cwgmjVjMGjpQPbwdbE8SuKHQa7OOMDD3rAK0QNAgOa1UXWbaS4rrEK5?=
 =?iso-8859-1?Q?0wtuNNkb6Qz39o+rCDXoWE7XHf4JikkowLE9H33LQmfnxyVUtkGv1lt+qg?=
 =?iso-8859-1?Q?P5uzVemcKCCjq9lg1BsW8ZkfGC+OfaNTsBNjpAgK9FNmCzA9u0BJAIWTaU?=
 =?iso-8859-1?Q?7X/jhGEYF8VAMjkSxOu4lCpPe1Mb1OSP7n/U4x0A5JsvxgcZY8uUzZ6yXj?=
 =?iso-8859-1?Q?ixlaqMqW+1t3rg7zPBCeJ6HoSmbd6swuegq4B1g3RkN9qWJkJAzGVVJGW7?=
 =?iso-8859-1?Q?ChgzXNK+MUmUC4tqLmApA7T48DEO4NrbwdCQLZg7ekb8T+MCMoM7hsZomk?=
 =?iso-8859-1?Q?GiLMryJ48O4SXACK8A7CXGj0342Kbr1liZoiogix/a/VOYFC7IdRzkDAgH?=
 =?iso-8859-1?Q?btP9htuIdpbiKlENmlcQumvivi7v51tDZ427HKbRMMeSeyLJo1UeK2aorj?=
 =?iso-8859-1?Q?XJbnCKe/Sk6xd/VdMhyxDG/GEcdkpp1WARbCY5QT6oQxvx6Uw/jXe/HLn3?=
 =?iso-8859-1?Q?dAywPtvVX42L31JPUvjeMuEKj+XH6XSNgolm3ZVPUHy06Ds2wKirF7iLOP?=
 =?iso-8859-1?Q?04iDimJ1PdgLcbZjMj3PRn2eID5wgNF+LR4U8QWog9FwfNbO9wKh96XmwO?=
 =?iso-8859-1?Q?xdl+/f2fmD+ghX4XyyWdAvTNpxQzsKY1H6dPyVHsdR2F2jaX3WUnHB7Gvu?=
 =?iso-8859-1?Q?GVSB1RQxim/PKbb2JYf1oUkd206k8WDoXNCPYkYD9bjFVq1RQlfsaqf+CS?=
 =?iso-8859-1?Q?ESGb9Pt5tnjtQSS1raPn+n33BBpl6Os1DtLc7eS4oIxSSUt/WZNNknTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4d1564-cefe-48e3-00a0-08dd3b99c0f9
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:36:11.1892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WigwpOi9kGbWpoVATwOqzbApGEEZLQTn0lenkJ9cBRD+j1p3P/cTJUnKHyIph6nwcftA9pqNqoDbx26C/3K0CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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

On Wed, Jan 22, 2025 at 05:15:11PM -0800, Matthew Brost wrote:
> Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user pointer
> to populate the exec queue state so that a GPU hang can be replayed via
> a Mesa tool.
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2160330ad01..0fe8c2e8b022 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -204,8 +204,12 @@ struct drm_xe_ext_set_property {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> -	/** @value: property value */
> -	__u64 value;
> +	union {
> +		/** @value: property value */
> +		__u64 value;
> +		/** @ptr: pointer to user value */
> +		__u64 ptr;
> +	};
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -1137,6 +1141,7 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		2

Will mesa need a property to read and know that this is supported by the
running kernel?

>  
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.34.1
> 
