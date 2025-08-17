Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B3DCA0EE4
	for <intel-xe@archiver.kernel.org>; Sun, 17 Aug 2025 16:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D15A10E199;
	Sun, 17 Aug 2025 16:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmmafxxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA89910E199
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Aug 2025 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755448631; x=1786984631;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T5s+qjyQeBkxe6vdyHf8TAEFbXaYoF74kskunMtQquw=;
 b=NmmafxxLGydlJypwHX7ORz9/+9OXmCWGDpEp/PmOEnRlei1nxhsFJY9i
 RSm913lZiTKsm7sDN0vIZKZDbVKWcC/znC1DtnCnJQ+LfFcVqioqdcqUT
 UFHOLv+4gIG9a0L3BRixOKqI9DONdlTR8KVx5UfAjLUHb44eSiEhMsgSH
 Z+GY1qkvNH6q20L3X/cHDHw5QWIHbUR8b8l1Qtz22xMKK9IBmid1mWQlp
 iZbpezpXeXLNkSY5FDsioEMRccctAXJ6/8uUYxAqvIst2pH/e3cvjL+b1
 Zwcq22FLdskPuJ39iXCYYLvNXTQtSkwQeQMGGfZJ/XiGs0MyIffxje6EU w==;
X-CSE-ConnectionGUID: q/+DzDVvSFSP2Bbbl3Tj5A==
X-CSE-MsgGUID: BDo5nWmBSg+1PyiroGBwEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75251123"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="75251123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:37:10 -0700
X-CSE-ConnectionGUID: ppAX0zuJRsOTc5yaODqs8g==
X-CSE-MsgGUID: 2Xbfcyf8TmmHCJPTtfjddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="198248462"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:37:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:37:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 09:37:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WS5r0YFUeh6PXMoHmSb32/uPNBm1hEMx5U0n3Sf1A1+uTg7wc/jp4y1ifT4Fiq5huKuX0ywi6SbiY4+rIZ3VPeTivVhiRhpoh5rCqeVLzBi2ipnkimKDR8bD4u3Xo8PUiLmg0QJUb02W8w+cGj8d9ZH9IHJhhWTUrhC7tSDydfTHcQYDPjSWMoITbIlzC+iyTZPosmliTpZNf9jJR195Zcpd0jlx3Bd9ENOCNhKAapYI2Ode+jLpBhVG6CzXTVxPaf/DswiYxjKrTpNMbkBGGU9LVwt7IyPJRw29irEE5FQFeB8l6tk8mW8v3yuxU72Pei9PCMCqeS3lpwuqx0AnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9jlcdIbFMbRoi9IscxQTGw5s5a9xtAt4QW/IPDul1U=;
 b=RAaW96uzYmwuRATpKH0i2Yd6+vxUa62fLzq2NAWZbtq3L8RONkxsgs4M8iBDChMukQum2LbyKUKidx8X7Zrszd/+5o2P9xm0nUCcZKmHgxKAWPZp+88RjbiQHbNlCFtpLOw00yEf0bvdqeCBTGFXY9fwP7X/YSj2hEnA1+r5gWBdQK4V/mwQjfVL0M6QAB8cMjdKzsrbjBXfw2qvijGX1fqhsjF2R6vDar3c54H6L9DV1umBMkJKkWaadutV1Yq/Vpdvoc0O/0Jmoowgbnr1brEsHsPuFd5eEJeUhOE88d7T5QOguPgTgHAeigywxIQ6eZmccPfoOcm+5/6R6WuDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.22; Sun, 17 Aug
 2025 16:37:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 16:37:02 +0000
Date: Sun, 17 Aug 2025 12:36:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: stuartsummers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <raag.jadav@intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Message-ID: <aKIFK2wGC8T6qarE@intel.com>
References: <20250813195428.140800-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813195428.140800-1-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 120e6621-86a3-457d-4ec3-08ddddac4b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tb+OiBROzy4Tet0CefRVj3ynQBEUJ4QkcE6WuR8GrmeqnB1g/AukfVfTyAV7?=
 =?us-ascii?Q?5LllSDPE+dL/KzoaK20VqZTLVky3Ms6+satHRmZx55W7Tr3jyR4GaefvkzCt?=
 =?us-ascii?Q?rMwaKV4/PaYHO28MGqq7nedc2sBFd4VRO6cBg71QJzDDkazW3vq7A5x1nZPw?=
 =?us-ascii?Q?UhM63W+ax71QgOYb1ge8+w4HVyyCOIb8y8N7HBHK9quBqqQMhWKcBmvF7+h3?=
 =?us-ascii?Q?GhNyDAQacjTrniDKKwVWEIF9462NpV1FIYPH05mbTXAQnB65Hse6sNtdJGXX?=
 =?us-ascii?Q?b5lcJbFD8t0GoNzbSJO1BlIW9KxJnDG3irBfo8duP3C2PmxzNWepZb7403mD?=
 =?us-ascii?Q?nnR3F9JI1hD9clfxKMQYgBEGuyfDRBj/tCwmg8MpKQooASansfQTwM0RcSLH?=
 =?us-ascii?Q?tadcfjsFdwNGqcux99lMPRU3QujKhJHECUx18jbB6UsrAjs8qlB9oJQ0RyFw?=
 =?us-ascii?Q?G+Ax5WMEBL6DyUvGi+IQbP9j27PTEWFwEGbszXDBcBGHBDtEJSV1bS7PluED?=
 =?us-ascii?Q?GWmCsPjcoInb6e8bqLqW6Qmpiy0oiUy/MCdnopkrfb9C6glP8HqS+ogVZ3o8?=
 =?us-ascii?Q?uP2j5VJYXdh0k0Xr69t7dQL1BKTqrm3pLgG6N7llBbAtNztm/N3AuFXBpcWK?=
 =?us-ascii?Q?7ct0X9wjXLqTh32OjQO18QU6PS1Q1xH7hS4+OOinawe/WfdLyyOtoTSHhLKj?=
 =?us-ascii?Q?ISpTkzXES6v1UODd6xSEXCkqEsreaa2o0a/xhGI3t6ceDJaH7OfQw5wBh9q9?=
 =?us-ascii?Q?xg23azaqV4BRx8KzYVlfm1F5Sdk0Nvgc218VXLXSBt23LX5mQieOtE+pegRd?=
 =?us-ascii?Q?dKLfiUMZt70llz4rUxWbRIHdEHU4+im0RBz0/1crfodBUV2PmXVkIwKM2tD1?=
 =?us-ascii?Q?mRTO2/nB1wkQHsjjrYDJL7fnLG85aE5Q5kCF7uoiNbM7E3yg3tTC1KGqa9tG?=
 =?us-ascii?Q?T4Hx1T+6phOSd+lPDCjRPxcY+aEM1rvBIfH1EMjmK4DMCR1AERT7naKM12uV?=
 =?us-ascii?Q?/m7O2LM3MbsAO7oerA7ZSzAbxEFuGV8UKtbZ205dZp9KbNoiCOrSSXD4B3W2?=
 =?us-ascii?Q?MLRxSPJ/fVfP7vNsVkhEZIgi5Pf1wb778qYpHEEmyLNrmIiJ0TfQhzp0WsA7?=
 =?us-ascii?Q?XmNAYu92ENQSnIa/tjcV0R2Hq1bAdCAasTIXvlrt1Rvx3L/cUlyho6kGe+8G?=
 =?us-ascii?Q?Zum+BJXe85zKzoIP5jVTPA3JGiZDuZrmIx+iO5kC+9VdlLi4L0LFk5ocDWDl?=
 =?us-ascii?Q?x7SHlup9U9czCmwhHGlWzBIUg8BNl0+vBoIW8jFXGaP7thMZmyiM+qqLz7L/?=
 =?us-ascii?Q?WbfI1R6+LZSE2yaG9WDKYzKg5Djg54zMrGdZtaS0s5LmqZs1kxooC3AohzqH?=
 =?us-ascii?Q?QcqL8oK+V8tK28tvP+4t1kkDNRehoy6qWq4WU47FTvabaUdQ6cu2xAbH81ll?=
 =?us-ascii?Q?dstJf66XRXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KRFfP+k8qY9vycO++CVaFM0LAxDIcs+8RGEE9BVupWPu07tIE9KkCw5BNJTD?=
 =?us-ascii?Q?sTf+GZgZs7PCS2x49OsLpBBtShJm6pdHAB+aiH0aQa0oCIoL6qeGkjpOZnA/?=
 =?us-ascii?Q?enG9FOVQVutW3BKcCTCNTpr2wJjHDumv+v0RTvH6Fjp8ame6ki83Xqef8Zyw?=
 =?us-ascii?Q?ACBtIBxOaNKdTwOowEvtDcwPywJYxd9a8kmb476sfr7gNoFsLFZYYOOnQ+ca?=
 =?us-ascii?Q?OnPQNYCOyh0HMEGKfjsim0r6f/7gxBcJksxKJa0raVJxDgLAvjwsihdWXolr?=
 =?us-ascii?Q?HyEgR8TwQPQBmuJqmozuuVnpWL+sbP8dbtbyvE7Hx/9bHLmSVQu3mykuXbc8?=
 =?us-ascii?Q?+Bi81mOQNWDpiVFSX5nQZrul77v0m2KDg0z7VbI2mMHehbN6WS0OwhXAZ71b?=
 =?us-ascii?Q?G4+FTmkdL0G/9eiUPCj/o8U8xjkrtKPJxJk4AOfp4n2S12jH39edOVZlPZDR?=
 =?us-ascii?Q?HiFO764QQTTjGnYvRWgBm6YiF8UHtOMXEuJYYxt9/McfrZUHxBg+Hd0jUdKJ?=
 =?us-ascii?Q?mgTXrXZ+k+q5+4lrSJN47GzjftuLl6TgoWtGiiSn9w9xrOtNpRWYF6HL+Vd7?=
 =?us-ascii?Q?O2obJeFdkYoRmNvAL6bKalaqOY2QHc8zkPbm55mKZwc07Gblfh7CPo7/gF3O?=
 =?us-ascii?Q?hkV2xPz6d5H6Ou9DPL/IEreEoDSicykykJbiDLWzyhJ82zYNzJTMJHL5Adm0?=
 =?us-ascii?Q?ywefLukzFHkoHHciaomdxbn80Jfr++WgpC8KMmfYsAlBvuEb0b5h5RllSdxL?=
 =?us-ascii?Q?cvhX9JsE7Fuc+Vf4V5TFrOPQwqgEkV2kv/mfTda8Tulufh+HhMISSLhc0rvR?=
 =?us-ascii?Q?I9d1FXlsg1aEJxqSJQdXO1DBYsVKIB5ojNNbXAg8xyCqNLlSBrzRNMyS9cd1?=
 =?us-ascii?Q?A9W6eCPhHIvl2bSjIahbJbGo5Ikc3Y7l5EY5iaWjkhufIWajrRW8TRuYQN69?=
 =?us-ascii?Q?cTK28Nlg4TbW6eW7VYjebXys+nINhCpEIijru5sFbGkxmP282Kk4U/wPMrjV?=
 =?us-ascii?Q?dbQGx6P3nmgLgAk+34ssxSYSZHFH+wBJTky+dgvQfA4oitJzz+KurFkZBKVH?=
 =?us-ascii?Q?QUhUmheLDAYUzgvwo8M7j/vAr+X4XWaYVhdBRhzLnYA5PY8K+AzDU6VfGEno?=
 =?us-ascii?Q?OISfKYYfzwsK3S1SgiTbh0n0JZpwDIabcKMp5JcqCWmhmlD2xmA2q7fNC5Xb?=
 =?us-ascii?Q?MqBko3b3aDqJoivCgEgy3YQ4o4yX7BtPE3sOx6Ie2gQ5fTXWg3IxBTEjy1I5?=
 =?us-ascii?Q?b9QgDJmsurXE5LeNwbiwohp/qV3c3QShO1y1VFFgddKUlbZIcIBnEEjIKO19?=
 =?us-ascii?Q?Ua2pHsXgWJGauxYYGf3I7OwkNA7Dwx4C+3C/evwXN8jB2kvnWi3ZcE/ocdOt?=
 =?us-ascii?Q?FA6YMIYeNwH05mb4x1yKx5m7UrYQ/gzIbHSqgck3WGLt/yKCjCbq7ARwPyqM?=
 =?us-ascii?Q?/dQktOkts52H2TVoLwTmeoKHBA3DUUx2WbBZOmAihuQjp+vhx+vcvSJbmGK7?=
 =?us-ascii?Q?SV5LibJ/I05MRifqLSLzgF9YYKFcWh4meUNmKhtJYVANSp8LzXfS//YxDdzC?=
 =?us-ascii?Q?ybF7IVEKNWMZNFV22aC6Ncfepwy7x1hrMa4a+wLV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 120e6621-86a3-457d-4ec3-08ddddac4b04
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 16:37:02.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCjohbxsEgVeKQn7dhzmPJhXwfeYoj1lg95LlyHYOc7giwc+LJsVePxYeto2vi0B0UFs/oNi5YXuQhGBnOHAEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

On Wed, Aug 13, 2025 at 07:54:28PM +0000, stuartsummers wrote:
> There are two registers filled in when reading data from
> pcode besides the mailbox itself. Currently, we allow a NULL
> value for the second of these two (data1) and assume the first
> is defined. However, many of the routines that are calling
> this function assume that pcode will ignore the value being
> passed in and so leave that first value (data0) defined but
> uninitialized. To be safe, make sure this value is always
> initialized to something (0 generally) in the event pcode
> behavior changes and starts using this value.
> 
> Signed-off-by: stuartsummers <stuart.summers@intel.com>

I was about to merge this, but I noticed your name seems odd.

(in both author and signed-off)

I mean, I could go ahead with this, but it is not like the
ones you used in the past:
Stuart Summers <stuart.summers@intel.com

so I'm wondering it is a missconfiguration with your git
and you might want to change... so, just let me know if I should
just move with this as is..

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_hwmon.c        | 8 ++++----
>  drivers/gpu/drm/xe/xe_vram_freq.c    | 4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index bd9015761aa0..6ee422594b56 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -76,7 +76,7 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	u32 cap = 0, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
>  	u16 major = 0, minor = 0, hotfix = 0, build = 0;
>  	int ret;
>  
> @@ -115,7 +115,7 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	u32 cap = 0, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
>  	u16 major = 0, minor = 0, hotfix = 0, build = 0;
>  	int ret;
>  
> @@ -153,7 +153,7 @@ static int late_bind_create_files(struct device *dev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap = 0;
>  	int ret;
>  
>  	xe_pm_runtime_get(xe);
> @@ -186,7 +186,7 @@ static void late_bind_remove_files(struct device *dev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap = 0;
>  	int ret;
>  
>  	xe_pm_runtime_get(xe);
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c17ed1ae8649..32a76ae6e9dc 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -179,7 +179,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  					  u32 clr, u32 set)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	u32 val0, val1;
> +	u32 val0 = 0, val1 = 0;
>  	int ret = 0;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> @@ -734,7 +734,7 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>  					 long *value, u32 scale_factor)
>  {
>  	int ret;
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> @@ -918,7 +918,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>  static umode_t
>  xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	/* hwmon sysfs attribute of current available only for package */
>  	if (channel != CHANNEL_PKG)
> @@ -1020,7 +1020,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  static umode_t
>  xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	if (!hwmon->xe->info.has_fan_control)
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index b26e26d73dae..17bc84da4cdc 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -34,7 +34,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile = dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val = 0, mbox;
>  	int err;
>  
>  	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> @@ -56,7 +56,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile = dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val = 0, mbox;
>  	int err;
>  
>  	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> -- 
> 2.34.1
> 
