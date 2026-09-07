Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D229BC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 18:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5BB10E362;
	Mon,  7 Sep 2026 18:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQFtLgRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E1A10E362
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788805539; x=1820341539;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s7PR3uvQ/QmTTrs2+LL+JA/IO2sAw+cKqamBYpbYyAk=;
 b=OQFtLgRzM6byR+cO3dLj9InALq46f3TCB/lea1o/WcxWTBnaYIdn8uRO
 Qjg0P7fl/7TJpaueSf54uDzTxTVueL+x9JZdRsAx/m5lAXRUpr8iblRfs
 9zYNUwQa62Od0PDqidJ+6Stq7NZpQ/jiu6qFCs3UIHdIUrRZX8a46JzII
 TiXMzJr1mm9WETR18K4CR0jxdAS5PlwZp4ILdkMLND9GzuQDLvMiTbWOF
 sPVfAjEd+BsgV9VOCXC/yK/tUSXXpeUUMceaVE9+6FnhtIr1wACGMwny5
 YAdMkYdZpYlQ2zswTblalx3IdF/DGBEOVzWvu1/IH6jtLbduP2za1/2HV g==;
X-CSE-ConnectionGUID: QEWT1SODSjCBBYj70HFuDQ==
X-CSE-MsgGUID: lerMi0otRFGqlCdYIewi8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88144267"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88144267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:25:39 -0700
X-CSE-ConnectionGUID: D/8z/sToQa6QctRLSWqe3A==
X-CSE-MsgGUID: 6VYTJSLTS8aIznEJgQdpkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="269459138"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:25:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 11:25:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 11:25:38 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 11:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dgf4NzgfxtbHOf1TspedJI3Q64h5YPgkvTu4qJH4GhbOVkub7cqzKVQjqxTTBwHT6BtKXoLSwiKIi79O4u0VhN+QFdKqQwpGMj4WcsS9lOXw3VMSv6moAuTt6e+AwUkKoug7vV2CLleu+agCcWlypnFzbEAzSj93uVOfE04fP1qhppi1yEWnXxD7GxQsHHjodQbkvrGNRu3M0frJniO65rP+m2+ZRGZdvMuJqYIkom4jp1Em9owDi/2nKRnCwKk2Wac3mDYL4TNf2Ape+v97CSypj2IfImFqPb6woF8sNg8sw0kjtIzJPta1R0DXcC+FNMe7N+uJ6GJsLJh9wupuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvv02IvEdVu0D5Zbl2Ye+8Z9Kg44VPIX0tUjyjIrUmA=;
 b=Hb6Y6VwM9Fh+qAeZPc6bE3m7eo6ickog4Ku3Xj59fG606veSIq8886A9bPrfwuAVbgq96Vnvv0RBtHfx7Of/UHVFt9DYaHlja4G0MzBBzydlDHKRLoR2U8Y1UOKias34RO/gajESjQ7r/ZNnCAAho3LSbFCCoFyPKlo9w5zvqHu/CHCf4eGv7qUur/j0bLu7pRAqxZwTCkJH0AENdKbRO9pxq/Kcssa2Qg4V+9G/xlOgAfNsW9gjx/MOyZMrfDuLwkZeVdmUxQOqKnarnLy5MqVNAGZTFp6MW8QSrdkbB+zE1PKzFa/oqcPDLglC9lGYAVK0rZmcS5Gwe8RICqfY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY5PR11MB6486.namprd11.prod.outlook.com
 (2603:10b6:930:32::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 18:25:35 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 18:25:35 +0000
Message-ID: <8c546a9c-4c59-4345-b430-dba6eb6a2244@intel.com>
Date: Mon, 7 Sep 2026 23:55:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-10-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260907094706.1407436-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: d242ecac-451b-4308-99d8-08df0d0d68a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AqNsNrDojdlmOZFc6VeHk7WPPNWACbOQykFa3WaNJEXU4GK8Jy3BiJn+xehwIM3f2DXFWF8IuWcl37ot5B7g5cIThjt0nZssJzbFRRIroLBP1lIiny5qbi2EQCCTiNut9C08zZ8MHOmKOxFWbB1EZgYPDWkncWtj3kdmN+80YmobG7YQ7No0ePBXtnMkJM6+V4h1I3RBn2fFmwKlnWPlxoplOo0Kf9W1uK8JmSUcm4h2W/WWeY3azNDtJq9/PPyoEU00Smk8Mnyhg6Er/mZVX7O9k1BJmC8badZ3vfdkdbSrotf0vMCptfsfy+j52pU1IxlHUi5hRsaQ/LW3bRt5FjCVuB3d8EiOLVLYGtVsc8+cKmvb6iouVYWDYncT7e8N9cqnD7WJzh54uAJwT+pI1IYEql8Kgx5WCWjNNkQpU6yxHyWFnOtwvfDJbBIclt47FfkoXCfCWIrkkTqkpFM5mYs/5TWOSFGChck33DQz/0raf55eIf+HHdgvDqxCNHE3ryGJPedOaFCwbV6WfhPYYAKs7qN1DuqpwyjmVPPO5xo6aN9GZ9SEY96RWMR6/sT9qWsR7GtCg8xePb5kYtn/K80mq4I70HVC2f4/+oxGVRiNtHQZ6Twi3wvDNO6zpLunJGr9S887/UV761P06erzLD+vOt/hrCCHEOGeG7JcZec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzQ4bExBT0t3RGxMZHBPb053Qko3QWNwT0d0d0NmVVBwZENjMFVqUmx5dXZL?=
 =?utf-8?B?YnA1QmtYbVVMcFd5OThwbVNzcWpsOFdNU09xODFSSkF5b21qbTJZRTk1azZB?=
 =?utf-8?B?L1krUzVNU0tQbEtqRytBZWtRUzJYYmFkOGV2SHp5SUlnYzlMMU9HdjdFc010?=
 =?utf-8?B?bGM1ZVJPRE5ocFV4akhwY2t4UHJ5SXlzRjFPelcwcldXalR2T01mY1pQTnJO?=
 =?utf-8?B?bitCUVMxNCtNSHJ0TkpxdjdYMDBSdi9sRXg1YytzbUlPMDl3YjY2dms1R0JC?=
 =?utf-8?B?ci9KcWF2clpMa1NYWG1aQzBEZ1EzVkoyY1hzNTcxOGRwSjJnTGlDWjRtZjQz?=
 =?utf-8?B?QzBISnFpVG45SXhoYW5CN2dPbzJWYmNydkpBOVB2KzlsUk5jeG1FMTlhYXJk?=
 =?utf-8?B?YmwxWk5iVTFQS2graDdpbEFIM2l4OFU1Q01OUUY3NHRlaDdzNFY1UWk5T2NN?=
 =?utf-8?B?UTFnaURIcUpzVmNGc3hkSmpCd1NVZnN4QmVRUTlqWFlSc013YysveXBxVFM0?=
 =?utf-8?B?ZEpFL3BDcDNyRGNUSTNwV3grYnhUNXRzWkxLVUhaNjJBSjRveG5QdE5ZbUs1?=
 =?utf-8?B?Wjg1a0hJeHNZZy9IMEw2bEdJaDNHYU5ySno0eE5welRrbFBGVkpCSW1TeDNE?=
 =?utf-8?B?QjFMSnpLZERhVUUycjROT21rQmtHcFdCc255dXBxcllMZ012cDdNd1c1Z2Fv?=
 =?utf-8?B?NlJBSldsZ0xMaEJVRGZMNmxxRjhVM3EzWGZyaGlrOEhMcnJUbnNSdm1EbVBT?=
 =?utf-8?B?RHNVd05LeTMwdEt1enJidEdQWno1TytodDJ1aGVMSStNZmNPN2lGM2lZelly?=
 =?utf-8?B?QkQvRzVkRGljODVHUlZQMDNkSTZES1RBa0d2amtsSElIbXFhMEhGRStHR09Y?=
 =?utf-8?B?NURQdm5FTUs1b1NIZUMxMFhKenl4RHJHZGlWNi84Qk1JdnU5TDh3Vkc3TXZC?=
 =?utf-8?B?QklPaDFXQ045YWNZWU5zeDR5MmVCK0FKU0dvd1lsbDZIdUprWFdpVTJNUEIy?=
 =?utf-8?B?YjF2ZWM1N2w3TEdBT1Erc3RBNENtOW1scFNvMEVoK28rUE1DalMwTkNQc2Jr?=
 =?utf-8?B?VkZBMFJsRVpoUGJLSzl3bVhEUlJvNTVJZUFLVzJhQm1UQnJkRXBlb1lneE9R?=
 =?utf-8?B?ZFRvMnlLSmNRaVBVcmF5WVhva3FsYi96MXgrTXZ6SDdIWE5ueFUrQlpHN2lZ?=
 =?utf-8?B?ZjkxeUp4TU15aU1lYmE1UTBHZ1prSktPTFd5Y0lqNmVlZVpUZ2RmZGV2L0Ra?=
 =?utf-8?B?RnBCQlpld1MvQWFkYTIvOEVyWGVVTmhMYkVjaTE2dTFJaFhWdDZDZGtONkMz?=
 =?utf-8?B?aTBWcUliTS8vMmxERDRhM0UwL004bEtVMTl1OTRzdUNyd0tSZWl1cUpvc0JU?=
 =?utf-8?B?S25xWnkrMGtJSGpoZkxDOFBmdGh2eXd6QTRjUnI5cWpZeE0vbkI3YjBOQmpP?=
 =?utf-8?B?MExUaGdHRnZtVEtZU3RxY2xvUEI4NlpEYVlnUms1RlZCQm81V3pYdU5hVGxl?=
 =?utf-8?B?cGloK3pPR1p6WEJuNFVpZmtKMDZHYzFxODkza1NHb2pvanVFZUVzcDgyNWIv?=
 =?utf-8?B?SWVPbm9wWGNmSm1CRmRxNExyck5mUHY1bXVVWVhDSWRwc3dDSFdhYnVBSk5q?=
 =?utf-8?B?NzZpYStkNlZWNHNnOG1PQXRRZ3VXeXdLdzR6ZDVZTWxCVnE5dXpMS3V1dC9N?=
 =?utf-8?B?aUJnTnR1cjdZWjJSQnlQOW9CclZCalM3WngySGpyM0UzN1VpQUV2VFAwMDBR?=
 =?utf-8?B?cDhVNnR6Tk9WbGFvY0N1eEhhTG1valU0eFQ2dWVyeGhGaGNVcm4yTFlzSXFV?=
 =?utf-8?B?SzlxNUc2Nm94RUlSSTVtL0VzQmJWdXZ3NVN5NmlHNnRpT0Fya1dRUFJXV1c1?=
 =?utf-8?B?b2p1YnRaRERjVzVIRlZHUGZzaE9XSEgva0RzNlVHMFZrSTFkVWxkMU44V0Rq?=
 =?utf-8?B?dlV1Qy95bU16Z0ZreC84MzlMSzk4Qm9PdlphOG1Vd0hiMkN5N2MxTmpoRTZw?=
 =?utf-8?B?Njh2K3BpbzRDelgrZXk4RkE3anNHMlZ2NE5PKzhQTmVHQmV6UzZ1djZaMFRi?=
 =?utf-8?B?ZzdKVEFvbDB4aDVpT3NobTZ0cE9qdDN1cFZVL3RPL0RGUWFsaHJyNzVGZzlt?=
 =?utf-8?B?ZUFsVHYxSnVEMDFkbXNYOVY5OW4zY0pnL1h0T0hUZTBncHhyU2NvVGNNUnZV?=
 =?utf-8?B?cWdKenZQMHhxUC9WRlF4Z0NEY3JaT21scnMyK1lHNHJoam9kQTM5TFNvWWhE?=
 =?utf-8?B?Ymczak1DVnNYd3ZoaThsMHNTWDNNZG92SEthZVc4UlR3dEl0Z0hKSk9pNW9k?=
 =?utf-8?B?bnc0K2tkcjFyc1FDVzQ2VTROcVlZa09yZFUvdlg4SUZwUVdMSm1IUmpuMjlx?=
 =?utf-8?Q?7HICIt+LaEexpnHA=3D?=
X-Exchange-RoutingPolicyChecked: Evje0O/ON9yNYjzBbTAdYJtxp2i9QKv9S4Ib6+9vizqH09g/ExNIRvO+SPxjxeF4pw5toNg6ubw88zLwOM9ZLu365AQByo2HW8Vh1Pw/Ls/Aon0iWqmUTxIctvVa2ksl0JaDAX2mVZ0wDqLzELkXS6zbV0LxfnzAM0bsyRY1SJrMsGLoLNkS83lz0tSTY96OE0Hi4K8T4ntSH5Gvw4e0+28/mVb4BEgs2UJzHSoft+5mlyWzwzKBhbeTwYVB4aSOzK8rf86QAgzMGaiaf/Xg7Cdm+BeMaDXZMYximhLp0p2SdTA6F6dD2oMWxT2tAonzSeNYOewTkwIIv25MgZqp5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d242ecac-451b-4308-99d8-08df0d0d68a3
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 18:25:35.2351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yg2GfqSZUhoFj83GJxtv/2Uf5ecAj6+/Wj6QB3IWOkO8/lb2sM0fEKLUMTxpsDSGJEF2wjyqUJUmDmApx746puMHT0dGESYoUugfGRMKWq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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



On 07-09-2026 15:17, Riana Tauro wrote:
> Add support to query page offline list and queue from firmware
> during module load. The page offline list command retrieves pages that
> are already offlined by the firmware. The page offline queue command
> retrieves the pages pending to be offlined by the firmware.
> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: rebase
>      store total pages once per response (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 105 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             |  43 +++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   3 files changed, 152 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 94ffd0852938..648e46df831d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -326,6 +326,108 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
>   	return true;
>   }
>   
> +static void get_queued_pages(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_page_offline_queue response = {0};
> +	u32 count = 0, total_pages = 0;
> +	size_t rlen;
> +	int ret, i;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;

move to caller, single check helps for both get_queued_pages and 
get_offlined_list.

> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> +				  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
> +				  sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline queue\n");
> +			return;
> +		}
> +		if (rlen != sizeof(response)) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline queue response length %zu (expected %zu)\n",
> +				   rlen, sizeof(response));
> +			return;
> +		}
> +

How about helper function for below part avoids code duplication ?


> +		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i], true);
> +
> +		count += response.pages_returned;
> +		if (!response.pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages = response.total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned from queue exceed total pages %u, returned %u\n",
> +				   total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_offline_list_response response = {0};
> +	struct xe_ras_offline_list_request request = {0};
> +	u32 count = 0, total_pages = 0;
> +	size_t rlen;
> +	int ret, i;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		request.index = count;
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline list\n");
> +			return;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline list response length %zu (expected %zu)\n",
> +				   rlen, sizeof(response));
> +			return;
> +		}
> +
> +		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i], false);
> +
> +		count += response.pages_returned;
> +		if (!response.pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages = response.total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned from list exceed total pages %u, returned %u\n",
> +				   total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>   {
>   	struct pci_dev *vsp;
> @@ -1040,6 +1142,9 @@ void xe_ras_init(struct xe_device *xe)
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> +	get_queued_pages(xe);
> +	get_offlined_list(xe);
> +
>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>   	if (ret)
>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 20c74593ce05..7bfd86c9d135 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   #define XE_RAS_NUM_ERROR_ARR			3
> +#define XE_RAS_NUM_PAGES			25
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>   /* Device memory error categories */
> @@ -330,6 +331,48 @@ struct xe_ras_page_offline_response {
>   	u32 reserved;
>   } __packed;
>   
> +/**
> + * struct xe_ras_offline_list_request - Request for get offline list command
> + */
> +struct xe_ras_offline_list_request {
> +	/** @index: Zero-based index into the offline page list */
> +	u32 index;
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_response - Response from get offline list command
> + */
> +struct xe_ras_offline_list_response {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @total_pages: Total number of permanently offlined pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of permanently offlined page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_queue - Response from get offline queue command
> + */
> +struct xe_ras_page_offline_queue {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
>   /**
>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 590dd408399c..a96aeb11d061 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -29,6 +29,8 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
> @@ -40,6 +42,8 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };

