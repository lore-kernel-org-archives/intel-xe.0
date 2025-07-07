Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1E4C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 16:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632F210E327;
	Mon,  7 Jul 2025 16:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/d+kSgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74F310E327
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905115; x=1783441115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oSG4/lkHHsx0zdB8XgdDff82VmoWQbES1iTdQSdvT98=;
 b=H/d+kSgGjY2zUDRzHMwkvRvve5tciH67EmMOlfS+gqlIY5jCb2tfX48S
 YYcTYXLcKEkbMe7nD9Lzwe77dpwICOG2tV9PEhy/5kMO5tOuJqjgQy8Eb
 ZSeM0lN3qW51SVr/SUrOTYsz1VvX5ux1pfuaW79aYP2tMqh81IpKgBA84
 am+Qej4NPu+vBseQBA/5qRIuYMp8AJ2mauzp+qCTWrneWnAnZ3ruai1m/
 yoUFQmz1AR06uK4nzUBTvGP0dZYVAw1aUcYV7lsumPvzJnKbOxD96HzuW
 uIedrCfPkj2g1qMEws1Eta9CtW85nXkbWs+M2fuvQCYQdBvoBEkmkSBrI A==;
X-CSE-ConnectionGUID: 8ut2SuI1Rn+pA5k3JCyO4A==
X-CSE-MsgGUID: Z5SPi/zpSri0mVRROyFF7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57933379"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="57933379"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:18:35 -0700
X-CSE-ConnectionGUID: ikXZLEDERDmmghOneSPj7g==
X-CSE-MsgGUID: +KVyKe5zTFuzLcmPZJe08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="154677701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:18:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:18:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:18:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSvxwmJ5MxaOluiKFxTClg0JhTINjC4Tv9r1urD2Hjr9RdFMLyMd9AjwKbi2mQKRwe97rPcXsmXZkh7qMthmPaAEJ6nofiZcLFVNCCShQafKhT8C3i+4BbrNHcTV2MeyQr1vWIvC9FEXgxjYJPYIrs7EyDS/n409LQnJ7jMrL4a6yXJFCWq99J+HOHflnukhIr+JCc/VNqlyf9bsC6DuwkBH59g/FcT6ag2GVqZX/LaKhc8UcRjdoy5rTih8DBapxso7NAqEeXD47EJZ6U07cLicK0z2GXj4U/BKFZCEwr/N07h5sIuipvLfR7kZ49v7RDTzi1+ZEyY8RuYzzWiwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/gmr+sbnpplHzVB5IKDaQOEy7lZJH+Cc+ysX4CSmWA=;
 b=cKNGgtnnSKCaA5wLtJXBPLD4kefVtiy7KLSmzBgblj8XQ6/QX73wMmEK6hUUA9cjqBNTkm4sy2w8IkMngLmoLUSPdEyy5WwjPjh0bzxAVgPFA68FAvYPerok4yp38G1cVtLeQTe97K6SXOydKmFR6Ll5h2p+u9DlMTA8cOIkFuQfUC+k1PioVHmXavcPpNdnpOJ5udhnpm6ohg9jRbGjbP03PgtKpH9gEfS707dJzIqmdf5krgXgYZRrVRy/j8SA4aKmtClbwjcwFbzZou/KC9CeoRExACmIscsee0gWWZa81uBEEpQNzaEEj6VVKd3/AVwQFWGcIz+RWAiJRDU4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8685.namprd11.prod.outlook.com (2603:10b6:8:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 16:17:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 16:17:51 +0000
Date: Mon, 7 Jul 2025 09:19:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/2] drm/xe: Extract xe_bo_is_visible_vram
Message-ID: <aGvzley8+8L6ivQV@lstrano-desk.jf.intel.com>
References: <20250627151307.23001-4-dev@lankhorst.se>
 <20250627151307.23001-5-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250627151307.23001-5-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc33217-5e64-4270-c813-08ddbd71d207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CYlM1TGb33OaSJ8ASMajk8iIasGAFe0AWjWAoTTAUAtlg8B8SQCq0CSMq3O2?=
 =?us-ascii?Q?UfQUF9AKZ8tfDzx93C/HmKIh2cHG027e16w83DYBeNBT1PGbPi8MMJQUeAMQ?=
 =?us-ascii?Q?CtfqF66D+iW7uNodyiGBqyJhETsxf0b7kWdddoIQYS51LqyGDa9of8HkvZeW?=
 =?us-ascii?Q?9AXiSmYHKWBf2QNLRme8PU/vBmPUfizv26ou7Tv0m6ceGTOuBvRq1H04F8jE?=
 =?us-ascii?Q?wOUn3CHHC9g+zMMT5WSHgfjX9BW/42nT7kGvubEtjN1fCbwxIjUQzSt6/PaX?=
 =?us-ascii?Q?bKExtKmOWB/2+63+pUqs+OqjLk95naL6doJpJVxtpOWenBEmzwe3jQZGzq5l?=
 =?us-ascii?Q?Tt7Ghcs568SOLxDyWcDDjrvzuOOyISPjTdd2tkY9VrTIclKdHK9uQEuwPtXu?=
 =?us-ascii?Q?urdIwnAv9fQk6u+xTVTVKLI5zHH4to4DJmU9L71RWZvu0PkeI4JskX/gNmRA?=
 =?us-ascii?Q?33PKXbICxdqPCAl3R85zAU4n8cutLugiuWagf9z9O+LlU/9HIAZBdi8xVZ0T?=
 =?us-ascii?Q?g4cY9IAkehFx0zdZl6BXUo7j73w/k9iSBEllZQfmRJzliEjE7t4KnouhWCo+?=
 =?us-ascii?Q?+45kaQ8RKgmph3ia7+8UFNCoX9EpnkWVgisXotV9qF+3PWEsBW4InjVB05z7?=
 =?us-ascii?Q?kEqYUmR0cFWz+osqmYzq7n/aCuecJhx2jZXqQYgCZFRdYXGpGQ71DsL7IxMA?=
 =?us-ascii?Q?pJmCSQ9XqltFO0HNqGAir7LlYwuXzNQeVvyK3hdyJhCZua1VP3IjomnnUpCB?=
 =?us-ascii?Q?Cq4RNzAURAYNVOhBHLwOTYnzDUggbAc7F1ujc90r6QRwyB8fPJev/4lmADI2?=
 =?us-ascii?Q?UNDmAaaMucF8iCQlkV6IcOOH/W5z6m6Tq8kW5ukVRhaKrlTDbrKjjGp9xGX9?=
 =?us-ascii?Q?ppB8lMKS4emSqfgTgUtnmMBaYDs97o4iNLbDUi2Rwr14ilFH05+maVlDivOP?=
 =?us-ascii?Q?HjQOQn8JgwH5xraiRbM20/B+nIvRlw7l/s4V1cFkzskZ8aJFw802mM8nCf6i?=
 =?us-ascii?Q?H3mvwwxsERP1v0ATzqz8FlIo5dERIona/3nXJdQtc1QlodW59V3PF7vxM7wV?=
 =?us-ascii?Q?IYsWm8sI4ZsCHiOG3b0XRycfetVfpjyIK1LBe9dBfRwC5nVvgPh7KUQf/YSL?=
 =?us-ascii?Q?muNPmqfY4t+dBhrqWpKYrEmerMglhP+tQJYUQQzRDEZbH0n47Jpqkmk2eoH3?=
 =?us-ascii?Q?5CSbecXf4YgvExDhqQvcUJXknQD/3LGHDQwyh/TR1MNcyssx48QPQGTfIyZb?=
 =?us-ascii?Q?X8DLoe0krzR6IKHRiDZA2XdFoFvl1B39fnkDVWxmelWXyoGtF8jao/rY0sFa?=
 =?us-ascii?Q?cCT6XYt/emgxiANpRJM8iSWtL012q0H0G2+5HF/ZMJh0ffAYt7pONJeqW8TL?=
 =?us-ascii?Q?s/ExQKL/9n9Fsl93fF4sfo9e80Q9IkPFp+70FRX/qYQqCtMWK+FyjBchOprW?=
 =?us-ascii?Q?s7aIAapEwD8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uy/OTtBVShPivLAuDAO7J8dHJgZRnVk9jIAmy9bhJIZbJ6sllyCm8b1roFFq?=
 =?us-ascii?Q?BN7KNNFU3Xx8oeCXz22UNUTabD6NDk0SBux51gcT7EC6glVww/py+5WZofu5?=
 =?us-ascii?Q?ONLVvSLiQbQbZUn7rZhLgSBMnzbGUAicZo2NKC/axG3CFJPIz3T99ubUiKgj?=
 =?us-ascii?Q?B04ysPoEyH67hT1NlI+KT3T27aJSfN/flQMwFaeb9Vg8RVzfJ0bfUyiyJvK8?=
 =?us-ascii?Q?Q2d2KLPjOo2z6ODUKiTjO42VPRjagayV+CPWNrAHXift8Ot+BwZ62LwhL0wM?=
 =?us-ascii?Q?nG9/MPSHV/+nMaSQFxZOG78iJxONvGeQAqp0KMbPy+++uwY/ST1I00DKbLme?=
 =?us-ascii?Q?qWaF7BRq2NjWdq3IMLeXi1XPI2vIQ02xHMYY50x70TWFUR+TDj1Nxr6Aw8Ey?=
 =?us-ascii?Q?VAMar2Jk17bSszoZ+BerXV/mjwvsB4PyFcMcax6xCboOEclvjt4YXFqsFiCs?=
 =?us-ascii?Q?RkmaMnWkBM6kLvaRxi1OXJ6/CccOsvJBxMUrYmscI154nteRszosOIBOCs57?=
 =?us-ascii?Q?o3g/HziJ2CP05tNsA6zzYd8JOalQwhCHkv6aBaATHsLAeW1iJPiZglPeO5wD?=
 =?us-ascii?Q?5cUWmaxie3fTZKWqoPaii8CmLmc9IrS8iAjFPltRXqYyVb/1v87x3hf82YLd?=
 =?us-ascii?Q?r+YZGdnW8x4aaTLO8C9huJ1w6s9wjcYstOlb03I9SnZh5rVowNKwib/7bSqf?=
 =?us-ascii?Q?Me9KAQgD4ld7R6CxCvFY0hQeiqFfQT1egAinvd8Nu7u61uNZf4mr7PoJw8iF?=
 =?us-ascii?Q?tvUZH59BYX8MyDHhZRgwMH3SqDqp4ANXELeOnXtI3sIlH/R7NcSmfKfn5LyZ?=
 =?us-ascii?Q?kWBpxvBLpcsMROa2I93aiB43VRyHhsVElE4Q1qGpFgmtuY20u6a40QK85a7N?=
 =?us-ascii?Q?ERXW+yt5nyk3TRrgw316GwNSTwXFUc7Zp5OfKCpgQmt6BHfNBjYGszcSI1uJ?=
 =?us-ascii?Q?nEEDAo8zguXLD4LEis7dQGxeCWcP6/1RpUaECbxEhvFJqR4Y2fLxT78BtsCl?=
 =?us-ascii?Q?6xfI+MvMDGUx6+IeVZvTb7LPxvxamfub9CJr3GsecU/njD430B80eemeU8TG?=
 =?us-ascii?Q?hR3ET1fjp7O0sV+EQOTSRr/yw3PW2zDJfjbHKo0uN1Z1fr6IuIhqF1bycIPi?=
 =?us-ascii?Q?WzDbILntyQ6m96hgCyT4rNIy6mezLbrD2ofXkvvwsAUAj2hB0UmhF44gf8vb?=
 =?us-ascii?Q?W6H5/dTlGdT9mGTtlm0wh8tFvL06Q3rolkzrL8appAVWBVONUlmlJabqoTGO?=
 =?us-ascii?Q?KRboHCp2cXV6sYq1x+GdC2KD01RzkxAymtbGFmYZZSbz8T/qiq2cMGUtY09O?=
 =?us-ascii?Q?yOgnx997aDZVbJkP+WZ2tDIB4cLaztwP31P91wb2VKoJGDghsPLmIllViwmk?=
 =?us-ascii?Q?qIBZGqkdILMR6+TTlIddW6S1ax/q0weZcFYox8F+vJykKp5dHjJsF8aepqcb?=
 =?us-ascii?Q?ujFx4FDAuVvcUlIOwb1vrextjdIuM+0WFn+4u+hiUeCIe+NDVqkzxKSUcl/t?=
 =?us-ascii?Q?QFk1phyE3Vf07n+78lQcY9wSfxbowa4KLb285MihMSZ0hVueB5LsD4Xmv7gl?=
 =?us-ascii?Q?qA04iP3kzKfO76tSquTyVC/lEG+BJ9zxHZaHSdQaXR8pu3bd+vG6SY/ede/3?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc33217-5e64-4270-c813-08ddbd71d207
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:17:51.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3APBXTIOG/e9ySR2JA2v5JfnIkX50xGIEofAne9rJSidXguLG2PskiiBJQpJEvKq9nmKonQqNqfrBG3mt50Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8685
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

On Fri, Jun 27, 2025 at 05:13:09PM +0200, Maarten Lankhorst wrote:
> This will make it possible to call from xe_display code.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_bo.h |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021ab..af312bc70d0fe 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -557,6 +557,14 @@ static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>  	return vres->used_visible_size == mem->size;
>  }
>  

Kerenl doc.

Matt

> +bool xe_bo_is_visible_vram(struct xe_bo *bo)
> +{
> +	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
> +		return false;
> +
> +	return xe_ttm_resource_visible(bo->ttm.resource);
> +}
> +
>  static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  				 struct ttm_resource *mem)
>  {
> @@ -1547,7 +1555,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
>  		return -EIO;
>  
> -	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
> +	if (!xe_bo_is_visible_vram(bo) || len >= SZ_16K) {
>  		struct xe_migrate *migrate =
>  			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 02ada1fb8a235..460cfc309eec2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -265,6 +265,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
>  
>  bool mem_type_is_vram(u32 mem_type);
>  bool xe_bo_is_vram(struct xe_bo *bo);
> +bool xe_bo_is_visible_vram(struct xe_bo *bo);
>  bool xe_bo_is_stolen(struct xe_bo *bo);
>  bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
>  bool xe_bo_is_vm_bound(struct xe_bo *bo);
> -- 
> 2.45.2
> 
