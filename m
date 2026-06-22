Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97F3CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 18:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B369A10E7EF;
	Mon, 22 Jun 2026 18:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCGrHWD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2FF10E7EF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782152518; x=1813688518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lh6qfOGCLV4YxfliCjc12uxZo4QfJaykQ07h5/fGQoA=;
 b=lCGrHWD9o8srVfRGb9088g2M0VSDnLMMe4pXv7UFOhamKug58sYCUpxA
 05gJ3i6aC7MNF3OlYLCDK5dh16rRnbPES3cZ6zj2fvHpgSQqu62ixrbnG
 E9Nv6hdLkUSbEd1Qmnln6kclupvjk5hhtYOz8cvZsc4fVXd2OEGzB8h1p
 2tXqpNGx18u/dl0v4a9588YljRjvCELX4PG1BLZXJJcEu1HUGgt2f/GSm
 95qSEYKjJTEp5AA12CiezpO5TQlT2qSxCs5Y+2fjdAblLiY9yvcyx1TUN
 jsHfxfPn5YTrIPTi8aLsR5jtQaUbJjOmhQTzIZZAZV5cRxlFnvxszBGjf A==;
X-CSE-ConnectionGUID: 48yZEkqkTL6o+evqoapyUA==
X-CSE-MsgGUID: G9k50U67QUeUWAksRJ57Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86578056"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="86578056"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 11:21:57 -0700
X-CSE-ConnectionGUID: nlMCtKFqTa6d9If9+lltEA==
X-CSE-MsgGUID: ILQcMYEERTyHHK7PK71X4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="254284475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 11:21:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:21:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 11:21:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIMLkAxc6L7gGsTGWGPm7D8uSLPv8OU9ZxWWTeVMx+39TeWFix/hQZHQmijQYWi+Nd3tssTKFDpIlH6gcyXTo3RwTfg1qiuo/YmF7ThylivsHoXjxLP7OPKmum5bhkyuXj7e4vsGs8fNvnzLNoZvHWBctpp+aiKeAPNPyA0EygYYhvsPNBZvtlMCPAsJ6hTxYeh6IKq8NB8fh7B4wd7nBy8eJyQcLNdba4fCMkwH47l/zACdrynuoIjEB4fCnhKJs+a0nmJOJ0mVL6u3PN9t8heiC4rJe49jQQz7oJ8A+5bBar9FRUOnRei+IztRDNxDer43DIzsiORU8VWCJZF1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOqzuC2qJ68slPk0Cnp4LOvmaZoqghDsb4maL3OQnrc=;
 b=J3na80tDquyUnnvX0U5JvzaqlIuv02yLQjc1hobhVSd9RkvQzIb+UPDucuJvfhJ01oj4f4m8qA2ayNptcslAAgIfd6Bze20N5PE2OU0hYZdaUUEWqNch0J95rNX7Pm6H4rt/E5lwqlTQLiZQgxUuPeaJJDKbj+P+T6Mx2cBnYqKOhOP4QI10bMIk5yARkH9KZbjcCxLYVWUdGSLlg9ZrXoTfuErAc6KON9MShB27PVEi/kXIHqmjZvAZ15XZK6bC3QU24TZgISxhmTXLWj0FbxZNEIrUAyjKhTPCFPDa7+madaSqM5GGMSlBYHiWtL6PNTu2uB8viQxOqG/tTBnp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 18:21:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 18:21:54 +0000
Date: Mon, 22 Jun 2026 11:21:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: fix activity stats error message format
Message-ID: <ajl9QFaOvdepEzVE@gsse-cloud1.jf.intel.com>
References: <20260618112528.2354371-4-sk.anirban@intel.com>
 <20260618112528.2354371-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260618112528.2354371-6-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9db0fa-021a-4ca3-1211-08ded08b2334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qEhNDxHp+XUpoOb03q+sLDLUQeSJ7zBY5Ap4eRZ8EhfF5AIU/TGRBrjPEx6oEb7LhxR7hZ0lFhY3I4SwJroO0iIjiXLP03myIajo9ql9JWOt146kAURtEoexUFtdPS/l6/vwIjfwsah27YD0omsvWf59AJB+3q33YIbEx5+nI9RhGUnS0oDB5AyTjhlJTENHRZoPaujZvtdR+rXZCponeE7H5dxKCTy4dKn4whFF6kg2WJuyr51C9bysSCToNp1yL9bl5NbWHJs2tCNohtYrdZP/bzLNWNHFG5VhzRlv3jKBt9wIp07zts5efCkZMHR4Vs/lxQNAcYep8YLYCVyIyd2zo+oeH1K32yxopbUZtF3ADuP+NmMd85gz6gkDAn4y4DhxqlBwPbK+ehy4I8XAcQWqJMF+ZK4fy3O+qFz6Zl0frp2E3qHl0ZFZ88iqdD1d6C0RqFqrukPMVoHxjK4RGYaW2nhf3Oizg/sUXH75YkNjH4ACdNIPPPXTH65kvyC+CcML8/ongRL2Dj05S97dcWecz7pLYNeZCm0i7iOnny+qmIOhYdZ+fszftsQ/zmYBNNVkeS5sS64MpqQMdN3X2qXd0ETXBYgWNr8j44eZnAffnRWW6dVJSzdkNQk9GXzmKyxDm5GH2JvAX6CJSu3T9pGzwCXgpQV2N21F3vZD9zk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+WqqasVaNX3NmEI9AFuBajrOS6XXTtLIE4YadXSchjGTYeGtanvmGGK/Hdzk?=
 =?us-ascii?Q?akzu1dMVxQ2XgNQ1nny4R10M4689j1cdyiySE6jGPFKU0Mhgpg3EfEY+zttq?=
 =?us-ascii?Q?DXT5YhMlUU/Eda7ruCOnA19AdfwOM2TrgPh1VZAOl60XdheaoMEgJBkkkJ9v?=
 =?us-ascii?Q?F/H+CrnewEo5bFB3xGTkxTf8J0B8rMEKnB1kLuEeYyIzvxvUjGgI9R/x4SE/?=
 =?us-ascii?Q?g+jsGTu7sG7oB6A7UliEIYVmHYi0l/lQW14l3wgZ9PVaWNQfq4lvhdxr0evW?=
 =?us-ascii?Q?O4PPAsRWefLRjYx8CFSAwQl96WFyFY8Db6p0lhhdKGaxKt6qh078iUgz2y7k?=
 =?us-ascii?Q?OJhEQEXNc+BYP9MK5CK8XbWUbC/8deF/WTsZ+oUuMWb+cc0L1d9vOGSwhVtl?=
 =?us-ascii?Q?vBtZsyTmEGhBvZr3AquR8BYMQOGHXeVoN3/zpG/aQ4ajJrg6XX5JmLX7lFWM?=
 =?us-ascii?Q?zww9W+wWoc8wsZ6zbdqAstLP4mpQmk3AOYIrtWarisCWCDTUICNgCxJzF0Vx?=
 =?us-ascii?Q?aw7SDzPMvSYUlqn9btbSOkPnIsh7y2NWhdw38IXzkO8VFyMnzYEGtXg5g0Wa?=
 =?us-ascii?Q?XhijIa/lFHF5Dkpag8oJ3e/k7tqRwLMyrVbwyDQU/TeWbTPQl0t7yHspwR08?=
 =?us-ascii?Q?a+JzR/W5RxstmvF52bJaFAzqtpzUeNg+mlxK2o2U1FsFQossBdizEeRa+nQc?=
 =?us-ascii?Q?UKF7WAy8WJ3SbI4HkaiEFkDMcH9/RNXXUC8JS//q3JOVP8sJrkAwCaREz2oI?=
 =?us-ascii?Q?bfy7Vh/NJd8VhfHwLgKsvqiuA1aA1aM+ila89s4ZF92XJ3gM8YIEbkVkw/bU?=
 =?us-ascii?Q?qcFqVGyBvHtDJJBN9uCDjE52EXef4TRFQVr1p3WzeNBtGVl4cVM3ByjUtIPY?=
 =?us-ascii?Q?/kkIKKcUuONuRYx1/JKUbFG3WQy86KRhaZ6jRzAkta4gh+Fii1I5OwprCYkv?=
 =?us-ascii?Q?+jVzU7zvZXjPC1JOuClW9m7pGy59Olfx4toBvQxRj/kd+jBxyB0DzVF9iDnH?=
 =?us-ascii?Q?eFQoyEngGSiUV9D2CWxiIzzLLNPx096mOveNQm4GA61fie+MdzTbcoS5pjBs?=
 =?us-ascii?Q?uIQgUWpj5Fyg+8kA494JHUx812sVLoGDqTnxCesOLxfwxc3QLNFtHdbZCB6A?=
 =?us-ascii?Q?IH7rBHmebjtPRL4KA8XLPebsQ2V5q7zNMGpm8ffvaewyG0PzL09WQN8Ro9mD?=
 =?us-ascii?Q?QklhlbvR5Pd5g4PZEUE4aTAF6A/Qs1pTtX+OZoiBL34xJ8gglCLYKb4EX0Pd?=
 =?us-ascii?Q?vBLwoVvwfgPfq8+6UnfNIf+Y/yrmcnfxntc7kq/QAybs27Op0y37CZs4ZtRk?=
 =?us-ascii?Q?s5pqSe/OPTzOOC2UTWQQ2mTzeHG2r/8SzGDufFQJQSzxMLstm9F7L70M1GGf?=
 =?us-ascii?Q?ik8jE47MnfOvoPEfyirtv/aHgYXhACJL7WL9iSDO0ImjiPRF3kASPWGNfvpU?=
 =?us-ascii?Q?Z1asiYXITRABxu3scHW9TXrsdn3sqgcG7u6Ur1wZvTo66ni9dH2OMMjSZo/R?=
 =?us-ascii?Q?IG+0r6jIVSdC24lDznPHb7z6dIpJCLmAER3dumKEHVzgaGI+4vgbNXrUpvvn?=
 =?us-ascii?Q?J41Sqzo77hOQ9PHBkpFwqgPhnMVR/OVpg2ab7cTbHNlaB6OYBYpmFu0hPDM8?=
 =?us-ascii?Q?f12YHjbhj6jFbMNR9zDoEIMEQ/rSI2WqzJXkbOY/IfiTAdt2hY90xnLg8Fm7?=
 =?us-ascii?Q?eoa/2A5PibGxyJBzNGDH1Wjk62bWEno10A9Z4brd45o2LaCb4o6o3fXd/9Cw?=
 =?us-ascii?Q?UvDHPfTiaQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fcR7aa5kkhQSvnhLkYOUvl/ORdi/gJsx85wajitfYuQNitXM140jJybXT/+os83aMgPxrYhIEPCw5JRrbIQj8AWta5ik6WFHxERIOHpp+rqEaCaJx1RAYK85Ipqa1GUyL2ZNwGA9ckZqklOAW9ZWszQlCBE7cB9L0VaNKuPOncT0/hiiAfHIDdFaq9Q6I8ToCOVEu93PNGK5jOJO7Ke4dwx79E0RVwE4gVN4QcjM7EFTxJNINxbPUXcRnmDNzt2/f+7m99Ax/Kj8f0H8d0Bc6t4FoPAt3dKhrx36rY5zvApbcb1NhnFZVQOj08Dp8/O07UojY2BVyigCHG7R6IyjuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9db0fa-021a-4ca3-1211-08ded08b2334
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:21:54.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byW2gdXsz96ljKVYh2vzqzpHWBM4qx59skqvj2LzMhKaS9VdtArGTzHOKnDZk4JfqF0Au/ZTK6oUZXR8CfXj6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
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

On Thu, Jun 18, 2026 at 04:55:31PM +0530, Sk Anirban wrote:
> Use ERR_PTR() to print the error code symbolically.
> This makes the failure easier to spot from IGT,
> e.g. when the device is wedged.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 2b99c1ebdd58..f43ca1c76f75 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -473,7 +473,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>  
>  	ret = enable_engine_activity_stats(guc);
>  	if (ret)
> -		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats: %pe\n", ERR_PTR(ret));
>  	else
>  		engine_activity_set_cpu_ts(guc, 0);
>  }
> -- 
> 2.43.0
> 
