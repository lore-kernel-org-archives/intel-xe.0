Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374B7C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57B910E131;
	Wed, 25 Jun 2025 19:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QE+06nM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514E510E7D4
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750878057; x=1782414057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kPf04OZRUlX+6WngwKsdVrthwp/TORgUmht84K6mwyY=;
 b=QE+06nM+GT/ofk1fAun30qnKgOAJcPHHCoDwOeJbiKRfHgdPP3EClQED
 JeKWQNlRh9pEcpNvqRCjdvm1wk4yf43vS/AxGtiMOcWUG/cm2TPP/fDHM
 BAsPXO4JqRpouzLz36wf6ojb/ZFSeDzV7Xv60lP5OcpS6ionOIzPXcXfD
 8npsQDvXPo9HqCodeJR5t9nIyIDcd//lPIx8L6XkaJA5fRm5c98Jr2Han
 gosuZgPtQh2tvPB2Ovvhh01NaKOTD5Bz5h+cb2Hd8I//tSvlttnro7kHX
 GBBnP9+D6mMYsfjIzafkoikG3sU+Nog9ZB3ym1tSo03Wi7BTzERQC96VB g==;
X-CSE-ConnectionGUID: cxafzgEwQTWF+xvn7+16pg==
X-CSE-MsgGUID: dvH3zcVJSYGk72CVjEfwSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="40777896"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="40777896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:00:57 -0700
X-CSE-ConnectionGUID: jTg2oiSMTtiBQS4vMWE9qw==
X-CSE-MsgGUID: jTUtJTKZSQiHzimkXZtxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152427806"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:00:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:00:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:00:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fi0np36SKwQA25w7DfFgP9bdnP/ykNBnT94efMxuyPSpmhxjus3DyjxgCIm5Gqg86AsNE8l+2V8uU/VVGjPR4Uy0wO3OAtJFf3zGSfeJ07hs4BbCrz25ta0tKaGmMoyl1vi0i2aV84xPyuv2OyLQGaLCAPShII5fmtGlFylgR1pPWE7E5Oh3djXguvTLOBTCeX1oteLq+t2w8W97RRa4Uv7zzLtcJ4jl+KIoCyRwv+c3o/M9RmD+FeWL01Nc9lawE7CiYQ08m0OdU2o6R290QOAn9UD+cGP1uZUPo/k7IcPw3Ec1JabrAu+3QhPvtGrrbl4WHx1Z62fHHe8bXmGsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPf04OZRUlX+6WngwKsdVrthwp/TORgUmht84K6mwyY=;
 b=JXlIHBaokneUwzRLTuRrM60lkRzKRuHU4kNwIcxnSUxHegoEgg4MEMYAYlbZCQFxEMDLJFMssXGwaYcHymZttHpzTXI/94zcdIGAzbkm0Q3uME0wR0+lFCJZNrt2VGsH+sLtn3QRiJhxPzvzPQm5/U1IRZk7v+FKxihHz+5PU+6ZcLlgbX0Cwikhz24ElIwHBIwctvqZ8yOyD7CjXivxJixKGAPLgJsNQIplmfOy5ekqg8WjHz7hjnOBWi+msXlKcs3hu9/KihzTUqppwgoNOFCBgri4J98PCjaAPdZb95GS/cnfdFKA1vPMPnl7/YuEA69CBLYroc7HJurbUBT2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 19:00:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:00:53 +0000
Date: Wed, 25 Jun 2025 14:00:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 02/11] drm/xe/sriov: Move VF bootstrap and
 query_config to vf_guc_init
Message-ID: <yaxaahw2iv4wkkbl6mtevmpkaaqehmekynxt2yogd3m2herkdy@qgcrphyg7lj4>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-15-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-15-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: cc02b7c0-07fb-4d1e-338d-08ddb41a9c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mqdc7EsVaZE3QJL2vOQ/w7XfkCS333UYBz8+/G/ISeaNk6JQed4nDoyzeG+k?=
 =?us-ascii?Q?oRtxXxfnQ1m4FkRQBt9yfh08Q3O3NGRoQ5szRXgCCgzsfBD2i8TdstCEtRrL?=
 =?us-ascii?Q?zTHIJqnnOkJTmT13Tsy9cmgO8RgM1HZp3G7JXbGzwziJ1LFXAUtKZvOFQyDp?=
 =?us-ascii?Q?CQEegU8a7TZ9PfgNHJYCPIILiNgMkUbG2f/etv7ae64TKU+Q6tzAlmSM2GzV?=
 =?us-ascii?Q?ti91pSET42z/phRwBkdFThiAuHqJOWpol1cgrTf2tZ/L0vxO0PX+U/FyeIuZ?=
 =?us-ascii?Q?qy7x4PiPQHBGprhSEXK1OvSCJS+B1+3AE98YyLiVEs2C/DFOaxSm35pPwxXt?=
 =?us-ascii?Q?xxDbxMjgNWuWNjU71PP2fNHjfHLY2wAY8jb0KBI88yBttzYylzIZaApkrcHj?=
 =?us-ascii?Q?PrE/UCbu0WT7T0cKDw6fhDQKqmkJcLIJagCne48o+azwi1ooQFlKyENPSTy9?=
 =?us-ascii?Q?APtBQqutNN2lzEorTGzMVVOiIhYM3CntLgpqlOQWHwRG1JpPJCziB9uIoIs5?=
 =?us-ascii?Q?vc7AmRcrYunCtkPZ+PhYhgH+7RBiswQ1PkXBMxnGuBfYT66iLgXbgiMkmLAW?=
 =?us-ascii?Q?6Gdck0ClFL2kZdo/Ogml1KhkqQmKf0AzS9UasOQqI3n2l908U/hQB3748G2R?=
 =?us-ascii?Q?8tlH3zZeRELnz4xPa24kOe651Vy8GgR6qgyBHgv8NVPp0Bmq1ioqYZvQv2W8?=
 =?us-ascii?Q?HCMTLl7KzdpRXXyMTasmofOClOIjFEC0RVg9ufNeWEanxG7V8B5dEUwWlRjX?=
 =?us-ascii?Q?Diz/3JjmTqjHKnoeQ6x4ZGWF2Q/BFHNd8nI25Pg10CBWZIp9MKetDJzTryN1?=
 =?us-ascii?Q?maVTSk8Ves2MS8txxrlxj2LTYV068fTWX2Onhnn5j2i+Ljq+SBru8sZRWJTd?=
 =?us-ascii?Q?Z8wSGNhCgcOupU3oMLjkw7VxqU9k85cB7bAgqKscnGrrt8ykQKPcuh612Grn?=
 =?us-ascii?Q?kGLYtFltH9esl8tqe92qnAe+bKrwd9rZ853sh29Yxu72GVAN11g3BM7w5lBK?=
 =?us-ascii?Q?Z2XL+bwVIAUoZ60PA2YU0SOFy4mH21ZA9yA0sVhzD7hZcNW6OMg7Lu3zynKm?=
 =?us-ascii?Q?5XCr+PjZPh0z8oveTmLr+qSO7PBIf2NJYMj7PZprNKx3nanBktayUhCC2Nxa?=
 =?us-ascii?Q?WWaik56wk8YfAXhJfHDprNLd5M/LhsPxVnTrNE7dR2crY+QYN3jM3x0+TMAv?=
 =?us-ascii?Q?byusR60mwUSXQx5AOMq1SaWF7ONfkGOb4/m/Sv+QFYNq3btSLlAObynM1VTA?=
 =?us-ascii?Q?aX9vyebaYeouuyZnaBWV1xRFSi94Rxf2ci0K5o9p6ZtYbd1xnI487NEfDYtS?=
 =?us-ascii?Q?Ptxe4mmmKfAIisp7WG4/AO6pSHbnOMXBH1UqF4T005j5lD1GJRs8ygmvR/Cv?=
 =?us-ascii?Q?C3HB97XPFawyBXitMvDHINWHeHUjFzGLwKnoT3TEz7N1Qsy7sodIU4FHfaFr?=
 =?us-ascii?Q?UB+rznvNnpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uJdbPrrYRzjRPT4j8sy4KFTqIhK+894UUt4WchQUy27JLQBXX7AA8D+30tOq?=
 =?us-ascii?Q?OoUdKqbNM9/in5lDdh8A5BN2s1+WVBg0lW31XGdPrdm1L8+9vmC/e3eVlqYn?=
 =?us-ascii?Q?DZdQ0c5dICcTq/qBatcRleX7h5PR5qfx+M/ltrtF/89eLTUz5FRZJUx68gvL?=
 =?us-ascii?Q?Seuf+jGHD6dk3XwMpMuPyu/Pv/xWP85Ap+BKZOsU/ff5eBUCvh6it+FQxlR4?=
 =?us-ascii?Q?LNCj8bAxRcaGc6EFcpwf0G+eGG2PDgMZu1UsjjoqjQTF8/ZLgofzHnxCh8Yn?=
 =?us-ascii?Q?pdWErAO0nsGAHADAHIAWwevtaspwvoG4hJkeNnpIITNTxcX5iqs8dfRSwlVE?=
 =?us-ascii?Q?6OAKH1cYLvPLtIP4Q1MrF4tahZeE9aDnfET0VS4NnFey55McO7qUsjDJ83mI?=
 =?us-ascii?Q?cRwkAeG8ktQyEKEdFazXo+Jq0CfZAeeJUdB6iGp3uxGEr9AcOTKORWT+K+5j?=
 =?us-ascii?Q?mAU81YNwK7ZDgMEqP8aQXfO+U4YI6MCtDyXbBjjnWH41XUhkqxUR8uYb24Mx?=
 =?us-ascii?Q?lO3PO6yxh5XQdgmp0RdjgZidb28DLAtgkNQrebFBm+iQoxiFfbfwl6U02Bml?=
 =?us-ascii?Q?rbs9viv5tflubG7kfCDribNiiOCBr3xxTJ5XqkbebrbR9+x0igqlGkS8tf40?=
 =?us-ascii?Q?2nbGbBE5wf0LkMuF4zk2eQr+NL7vKT5wMqa67vzhVyWxvlVSSh8krSakfW+q?=
 =?us-ascii?Q?bXAIMEbjczeLzktStaWWq1ikglvUOrzhSQ7C+1tJI4rGgNBh6pmzkt24yaRP?=
 =?us-ascii?Q?vR4X1Luag8I8g6B0EEZdRgq9JOF6Gi5b8qfqlPm1ceKyeC2vMHeyAcYFYJcc?=
 =?us-ascii?Q?FUsQwvjfrzueKerb3ZFdpN+LxpOUq1plaIemnFswXvcOez6I7GeLjEz4JvPg?=
 =?us-ascii?Q?pZndUYjIWxAoeqUelqN95U7zy/oJCa6hWxSVxxSIhpU5IF7wKbP+reYDj0y7?=
 =?us-ascii?Q?EhkfafChXXO0dBYV44PtsOOyl+k218y0KJi6Dx64zKvpnlZF2S0swCMXyJeO?=
 =?us-ascii?Q?NGcMYRNxnWa4BgHQACSjLlQhaFRbO0WLRZI/JQj83YuXPqKBl0r8ffbZq8Mm?=
 =?us-ascii?Q?YsGrJhr4y9qtaAUiaazyKQIztY1zFPpNV185mv3XEJO4bFQxqNx1POnvjhd7?=
 =?us-ascii?Q?iNAZQIvyx672ilXJKCj78EUf7LbKx31Rlqi6nSEr1Cu5Bhsxen2rVSSHeL9t?=
 =?us-ascii?Q?4312R1C0+OMcnpfinlhZxTjmeRzR/MWH745ut9FsTUAPDWGGyxAQjLkI7s4i?=
 =?us-ascii?Q?zqfif71ddvWMm5ZZwImvp/hvhZ8Drygv0/suhjnFP9ZrmD6smxCE2/u4qU5v?=
 =?us-ascii?Q?UDxX2KughiZCXkU+g+uX0KO1WgDfauCuuW3CVFwr4ckhqAebINmpEZQxz7tG?=
 =?us-ascii?Q?sKNQIeIG1kKXfilQ71OpkWhrNfo2xiXg3hX+aeh19pREvdRsHCWd4apTqRPu?=
 =?us-ascii?Q?k3Gy/fBv7LE8AO20H02ivnny+y+ONjIM78L9fKeoRAsY8SdxNSt0hna1VDkE?=
 =?us-ascii?Q?v4i+QgWS+W7XA5jfZVcHIYSraNpkDkEw56LYhmPQ3qowI85zgGK/MrFc4C2S?=
 =?us-ascii?Q?CAJs/BIqWKccxmb0fZwq+RIbdRsKXuKl20KvwC7M+AqCyRQLZAVeCxXAdbCK?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc02b7c0-07fb-4d1e-338d-08ddb41a9c0d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:00:53.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MsKOuQ1egFBCfUb32R21GZB8osQko8E3lAGknVHCNp3ZVFjKlLgpoxizEJFDCJhYcQm6BaxqN6Sg6dHVl5OdKUNoy91nJxJtd8/RBZQhsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
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

On Thu, Jun 19, 2025 at 12:49:01PM +0200, Maarten Lankhorst wrote:
>We want to split up GUC init to an alloc and noalloc part to keep the
>init path the same for VF and !VF as much as possible.
>
>Everything in vf_guc_init should be done as early as possible, otherwise
>VRAM probing becomes impossible.
>
>Also move xe_gt_mmio_init to the end of xe_gt_init_early(), cleaning up
>the init in xe_device slightly.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
