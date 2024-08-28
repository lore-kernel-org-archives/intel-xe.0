Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F1C636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49D610E5B3;
	Wed, 28 Aug 2024 19:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8xOBCvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3C810E5B3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724872641; x=1756408641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Jz/pG14czju0oIg+bz/C+KkJabMVxs8GWR9ISrOJdLE=;
 b=D8xOBCvkc26avJ9lZHVFWptNcnOPn95IWwyvWRDvBJ7aQxlrj8ozN0NV
 salWD9HJontJ7u0XucrsegknpxNo28sG63A+jMJk/PdQDoC0nN/8KN7sJ
 d/AULIsQL7ufAvaE3i7+H002/1bh7OD9Gg4EX6QfDjjosz+dOkeeVizYx
 ds51IKFjAZpZZCQBpcooo3tWV2HCNTiMU7l1PEiN9LFFsnO/UwlHnFoXR
 FRuJRSwymgo53setq0uzxXwaC4eglhNttrf284ItejRCsQ8bzRV9fieqH
 CRsyidBI0GdwWJupul/arKZCYTI2vyNfNDntTMQwezoCguTymi+ui4QZY A==;
X-CSE-ConnectionGUID: Mbdj0fR6QXWjjwk+sdc/0w==
X-CSE-MsgGUID: +Nl7GqPmTvC71PMrxjVPnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27305484"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="27305484"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:17:21 -0700
X-CSE-ConnectionGUID: +QSXBoYLTLafdMQNidksEw==
X-CSE-MsgGUID: HgC9eipjTuykQYB/lYjU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67998267"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:17:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:17:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:17:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQc1j3J3SHuXca/kHxKc+WtxpCyg5I8WexUjoPb6T2H4tPCaxYWpjc0MQLJUMmB4cVrt2DCmvoHxYqYWj9kcEpvwl7XTjMrYur1CDdHDXqT+vBD29CylfyCCw49rLvORWHBsyJDfqd6biNsLW67I7rMQ3mz3ewmrSdG+OSk4dvQ2T1nHIYZkrrhjX+9G0uEopJ34JSVoSiN/YN9aEquLLw8X287cXiB35UGpU1NUIapJ3lLS0FTO3+Tx/ml1hByl6mjnYZwO2SV1aD2VxLqLtnW6960TOMt6JayR7w6qpLDOGNlZ5lEQLIobHxckVGCpCNEwWihaaHk+ZoZfbaGN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2mWpGzyAu/LVdPeKZesdGjg5nwWzgjxFuoh/3VMnvE=;
 b=Gs/fgtj1sbpKRldJ/V4gtgRn4r34U178Nd5iLfyEld7MJZ/Yrn61QR58cG8tbus6rmxBCVWK0O3yzs8jVJQYA895Vy1Z8ScUA/SK14GVf8tGCB85UJRnRJ9zVRb+nzgH/DEptEx/lzPN4LglZaNbinRvrrxmDYoX4KY2c6bp5CE3/wPfw5+q0CmGLxNFghbXCPpSvbfHUwOPgTT372H3JLJRbsdAOGftWBCHJmH/C9UQSzioK9IFVabqe2DL6lQvGuAZNQljjwcEn9xKCAJ+C9xZjCPpWg/mh2hkP3Gf6Q8iJYI6vMJqPIepBc9SigVtwByXRPl77jAgX/zlGp2MzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 19:17:17 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 19:17:17 +0000
Date: Wed, 28 Aug 2024 15:17:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: replace #include <drm/xe_drm.h> with
 <uapi/drm/xe_drm.h>
Message-ID: <Zs93uthBqfP2J61P@intel.com>
References: <20240827091539.4136838-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827091539.4136838-1-jani.nikula@intel.com>
X-ClientProxiedBy: MW2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:907::39)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf84253-980c-4976-d24d-08dcc7960829
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IFZucidch+9KKb/s5EU6YSqgJoZNaiFF7eoAp7MOqTHyagatDwNvxugu8y?=
 =?iso-8859-1?Q?RqS3USP9mvlYlshfvjvlrSjV/iwFJhP5p2TPBbrzUW42a7SRBawUs6mo69?=
 =?iso-8859-1?Q?pcyg4Z/TAki0WNypyQjkDHBscauTUoKt368aG3ySaSYANurdJEnxIEMpuw?=
 =?iso-8859-1?Q?9XO1hBoab3JzSS3VAoYF6Z9VkTfTj7APy+RFjpQhlC0VLlNIUb5gIquZrD?=
 =?iso-8859-1?Q?EcMmbS/fsamfosVgc0XWDApfEazdjx4OCegJ9bGGxok7JvjGFrnZw676/l?=
 =?iso-8859-1?Q?nVwCzJhsRkSc++ucgx7TNsclw1dLbRDsXJV8noBe5v8pum4NyDYev80cKn?=
 =?iso-8859-1?Q?F+NPWg6Su+Ru7Y57DMqOPpl/90heflVsrdJxLbd3NEOA2SYSSQDu+DqNnn?=
 =?iso-8859-1?Q?KOiQoXbCTxIlrLsbQrNgKudseAonwehE0JU+Yi8PzxwSToMvY7xHxarHb5?=
 =?iso-8859-1?Q?kVSTOznpHaZZqaiDXVI5usWbvYgDi7toq170VTZXD9spZP6TICw1H7IFPr?=
 =?iso-8859-1?Q?S08z01tU/EMJQbk6EWvrvNvXmL0PlaZfRx28MXGrHpLsXtZiggUKNztezT?=
 =?iso-8859-1?Q?Z78cR3UjdeHrdwVsxyDAcoM3fbdYoSrwRgIwDDLm6FTRu6WlbyvFqrtoBT?=
 =?iso-8859-1?Q?doxDSWCetX3VanKnSumiaO10pL92ZDa0hgP65x3xd8sar2RWAeVqHr6kP0?=
 =?iso-8859-1?Q?C/o+h5rHk9fWQgPOoMU20O0EFas818UF1nmsNBT1s1Ou8SzZCVR05YG0Ts?=
 =?iso-8859-1?Q?l2ECarkpGk6EdVd6nRxHxTjJq7tf9tfYZIl66tTo/SHJXqYCSV3erXf/+g?=
 =?iso-8859-1?Q?xDQxvZfbRVUMqbY2+TORli5+cF3mn6dFoRldrMXxSawlIfVdo7d5V8m3FQ?=
 =?iso-8859-1?Q?2ltDC6nh/QMs/iq5YgjDsObQNvn2eEkjGvahlrD6TJUq/7hbx3C7IzWkwE?=
 =?iso-8859-1?Q?ecCu+2tZ7DNFDUY6CorNXSxqwf9LAKReoqJz0vP/a6P6aRjdvMbSmdjzw0?=
 =?iso-8859-1?Q?Vs0sm6SvJlOaBWhUCy2IgjKsU+MoCVcSjNNThGq4b4vOb7lk9xAnsJtUdP?=
 =?iso-8859-1?Q?r4UuH61tnB5h7Nl7VoWeKb+v6StTZ0Yjz+YhsEOY3atO0Ge3HmtkhkWjTY?=
 =?iso-8859-1?Q?NvOwOCCqqgdnSgvPk1GSx85yW4zvc/T3IR1mjid9jLmRMg3IQsxuc2TZxI?=
 =?iso-8859-1?Q?MfiF2pVa94j80k+r73Ty5PcbiL4GWS5c7ejoyjHu1tza/sJqzZu8QlGVmH?=
 =?iso-8859-1?Q?Q2dtrG2wNmbSDGFTPj20qmPJGODLoY0mEnrAs9JWQud/H+rPpKmpZWfhnI?=
 =?iso-8859-1?Q?tHbPqCqVzr0Q6ycB4S+F2VDLFlOXqqxMJVS7XgItwkL8WGiVEFwPnnEEOP?=
 =?iso-8859-1?Q?ZttGYlBSVdBKv7+fqftBsMnx0OVyQ9vQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TV2ZPc+gQanjXHMkOW0vM8MEnXcyPb6ksdiOm15FqIgM1rk1NtK+VxJC+f?=
 =?iso-8859-1?Q?GE7O7edr3NCnyNoH05zmZq6kItjvBXkzm4E7w+WRDx3CAd0aL3jtkAQBw/?=
 =?iso-8859-1?Q?jehgPik+Nde/O08Pa1303O+4e5lCux14+tVtt7Psxc+EN6IgnUx0yM9KvF?=
 =?iso-8859-1?Q?e817x5GpNPMKXPLTpoCc37Tq78/hxue0ftSxcua6NAJjbNkSshBic8DRfE?=
 =?iso-8859-1?Q?ai1oPDW5+Hkgm+It/5zMBtKXZgbZrR79HOH8s+wHvH4AT03RhuA7iURs6T?=
 =?iso-8859-1?Q?nunP81S+LGrgvlIaUW2f4FdFGnjGGxSrO/iX/oCv0vJeZv1N/93ufaowdz?=
 =?iso-8859-1?Q?//y92j+evr4EIUk4OZGWWKV9xnFt8PrQAk+8J9LwQKYaPJRVJuBrucYbZw?=
 =?iso-8859-1?Q?Anz3mGrfKZhp7AHfYTZBrWQ6XrYXKcuBf1n2g72sAWSYRP5zq+UqywjtqU?=
 =?iso-8859-1?Q?xLR7zvBbQuaYzhb+qsgOyN7vwixjVKLyyLXtOMcDaT5PE+eTEyOngRB+Lw?=
 =?iso-8859-1?Q?UR8TlS5KsIRKoXHLb6Or5QZpN/spFTs4sdkXdQ5EkLTuMP5hqvyoucyaVj?=
 =?iso-8859-1?Q?yDkyRXIGn9E9YRZjj6Bnc+fovHQaJuQIreDM6lUkZciVoPwyx+wa/L1Eec?=
 =?iso-8859-1?Q?XuixuOZNeB77MWOLTwrS7aIuu3yFo8+Ph1PtWDQ8GAfMjlepknD7T4qkmb?=
 =?iso-8859-1?Q?/BThSOkrcB0xi10ivapd0WWobVkhFOpAjOZOuvh24vfzia4g5J7b1dZZGR?=
 =?iso-8859-1?Q?6ntfHbv+vjCuruFjQ6WnfT/sJc21wpeBzXEMhhDyY5QTAxPkVc7IiNClds?=
 =?iso-8859-1?Q?VYBEfKqQ0hrnVZoKKA4llX6yeLK9YDTxQEvKAOrAAB8Zidg/rpxwepKahO?=
 =?iso-8859-1?Q?fd1ElvC0CabmIwSZmpupWI6KGbL/qqI8bd/JqI176YNX65/s3XFIpgjz7V?=
 =?iso-8859-1?Q?1cydvO5ou9ek+Oas4eVobJFnXAL/gi2zSUyY6AhLQ86wEhQb0gCnyj0nXJ?=
 =?iso-8859-1?Q?zfrhr3Ks77LCP6FLkemzfqmR/VkT3BszSEeJ7h6oqhS8Vs+Z61BchN6LDL?=
 =?iso-8859-1?Q?WayYXJFMhJ5xDT7FVcy77yL3p1xqSMjxqPYzoQf+Dc4ygXUdLmak5krn/9?=
 =?iso-8859-1?Q?sQUsPdh2k2fLnBEgIve9qn4GzPqDA5hYJfMHqQnug0gY2Za8BxfvctqScs?=
 =?iso-8859-1?Q?0ZO93POIev5PvpSvX0RJf6nzyCEQpjB4nhaAitZKKWdtxxJiEbVrNfHx3p?=
 =?iso-8859-1?Q?dtk75GgiQQJ8aGuwo3pDq6eBBpBEpgAgCVXeiLvCzrtu8P7TN0z67FmMtA?=
 =?iso-8859-1?Q?KGRFVWvpYnLcUTkoXpw5ctfyiERY5imIAPvpMmE3mjVGKQt8nQK70GGQe8?=
 =?iso-8859-1?Q?KeO3CwsvhV7yzhEimEN9CivkikFnDuVoZ9YxE7/ODkJ8YR11XZqYepBDpt?=
 =?iso-8859-1?Q?+WUQJbBU5GDRFJf6lAPlXknX7DKWwUQVsVcgVD5zWmWVJ8c1aSojRvDBTg?=
 =?iso-8859-1?Q?dnOIl+fwcbXQGkEB6NyUKl6NNPUj3vJwhPIGe7hFx6LKJZYreAC+DqP58p?=
 =?iso-8859-1?Q?OBCXDpYp3dcrEGYjRaAl7TLtnEQBh4xDbJ2bgS+pF79h18AD6bR2lDClHT?=
 =?iso-8859-1?Q?8bFiExk5fozlGrntP8tfg1f8ugUOYyf+GTU3RCjwcebrcjARmjyp8J4w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf84253-980c-4976-d24d-08dcc7960829
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:17:17.9029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itRFOAtuEwwaQCdGqVcLtpUIZ6jQaNC1f5g0hg8NH0RC6VuHAw/5Ur/ECMh+6kLcqbGOeIARNoyEooBuXLtYmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

On Tue, Aug 27, 2024 at 12:15:39PM +0300, Jani Nikula wrote:
> include/drm/xe_drm.h does not exist. Prefer the explicit uapi include.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c   | 2 +-
>  drivers/gpu/drm/xe/xe_bo.c              | 2 +-
>  drivers/gpu/drm/xe/xe_device.c          | 2 +-
>  drivers/gpu/drm/xe/xe_drm_client.c      | 2 +-
>  drivers/gpu/drm/xe/xe_exec.c            | 2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c      | 2 +-
>  drivers/gpu/drm/xe/xe_gt.c              | 2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c         | 2 +-
>  drivers/gpu/drm/xe/xe_oa.c              | 2 +-
>  drivers/gpu/drm/xe/xe_oa_types.h        | 2 +-
>  drivers/gpu/drm/xe/xe_observation.c     | 2 +-
>  drivers/gpu/drm/xe/xe_pat.c             | 2 +-
>  drivers/gpu/drm/xe/xe_query.c           | 2 +-
>  drivers/gpu/drm/xe/xe_rtp.c             | 2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c       | 2 +-
>  drivers/gpu/drm/xe/xe_sync.c            | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c              | 2 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
>  20 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 78a884ddd499..e91d4d00e004 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -10,7 +10,7 @@
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "soc/intel_dram.h"
>  #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 13db6c0530b3..cedd3e88a6fb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -3,7 +3,7 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cbe7bf098970..0fc93d100c8c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -13,7 +13,7 @@
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_tt.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device.h"
>  #include "xe_dma_buf.h"
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6db7e082d88..1a0d7fdd094b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -15,7 +15,7 @@
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "display/xe_display.h"
>  #include "instructions/xe_gpu_commands.h"
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 7ddd59908334..e64f4b645e2e 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -5,7 +5,7 @@
>  #include "xe_drm_client.h"
>  
>  #include <drm/drm_print.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 484acfbe0e61..7b38485817dc 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -8,7 +8,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  #include <linux/delay.h>
>  
>  #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e53937fafd14..5a9cbc97f0be 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -9,7 +9,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 08a004d698d4..1bb66db47265 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,7 +8,7 @@
>  #include <linux/minmax.h>
>  
>  #include <drm/drm_managed.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 18980238a2ea..6e4569aaf869 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,7 +8,7 @@
>  #include <linux/nospec.h>
>  
>  #include <drm/drm_managed.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cbf54be224c9..cfd31ae49cc1 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -10,7 +10,7 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_tt.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 4d4541e0b24c..63286ed8457f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -10,7 +10,7 @@
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "instructions/xe_mi_commands.h"
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 540c3ec53a6d..8862eca73fbe 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -11,7 +11,7 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  #include "regs/xe_reg_defs.h"
>  #include "xe_hw_engine_types.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index a78c92a44ec2..8ec1b84cbb9e 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -6,7 +6,7 @@
>  #include <linux/errno.h>
>  #include <linux/sysctl.h>
>  
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "xe_oa.h"
>  #include "xe_observation.h"
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 722278cc23fc..f291a1730024 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -5,7 +5,7 @@
>  
>  #include "xe_pat.h"
>  
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 73ef6e4c2dc9..28d9bb3b825d 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -9,7 +9,7 @@
>  #include <linux/sched/clock.h>
>  
>  #include <drm/ttm/ttm_placement.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index e78ba324dd18..86c705d18c0d 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -7,7 +7,7 @@
>  
>  #include <kunit/visibility.h>
>  
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "xe_gt.h"
>  #include "xe_gt_topology.h"
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 9628f9deb3c0..e9b67df8cfdd 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -5,7 +5,7 @@
>  
>  #include "xe_sched_job.h"
>  
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  #include <linux/dma-fence-chain.h>
>  #include <linux/slab.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index ca826aeb41ea..43b3b1d310de 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -12,7 +12,7 @@
>  
>  #include <drm/drm_print.h>
>  #include <drm/drm_syncobj.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device_types.h"
>  #include "xe_exec_queue.h"
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4cc13eddb6b3..a670de50cf4a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -12,7 +12,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_tt.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  #include <linux/ascii85.h>
>  #include <linux/delay.h>
>  #include <linux/kthread.h>
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f69721339201..d46fa8374980 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -8,7 +8,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_utils.h>
> -#include <drm/xe_drm.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> -- 
> 2.39.2
> 
