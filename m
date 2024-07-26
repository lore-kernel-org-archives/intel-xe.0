Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F0CC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 19:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3D910E07F;
	Fri, 26 Jul 2024 19:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqsyT7ZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22910E07F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722020442; x=1753556442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZwiFetj7RFpkkASyhJDJkbYX9qDdT14xtBSEB4x+LAU=;
 b=SqsyT7ZRA7Ww/WbJpQu2u6CVP7NQFItN9L977bXB5fTz1EgsNxMp+c/R
 ftfqzZxzJttECM397q8FCOW6QxPbsjO3RZmK/IDQYl4ivNxygYbzlMWtb
 4qX4C++GqTlGqnPcvhCitQHJM48iJd7YAfa0XGm9gbtSFhESDL3zJZ/ZK
 DHwqsP/qsYyR0SQWHcduOb8VJiJhhTk4I20YjIu5ElKc7AKR3ahG18uLs
 uLAuwLV1cRjQ11BmhzLcyDXTQUYrNYHtPd/4StAINmupYh6kODeu+WRnx
 B08Ey0EHorsHM5NuN0vsk+Z0WQBkb4U605iTBgd1A6pmi70946sduFVXp g==;
X-CSE-ConnectionGUID: zU1FvSYZTPaS9UfGj+0aag==
X-CSE-MsgGUID: t1P4o3aARHWJDVowBPO+7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="22740610"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="22740610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 12:00:41 -0700
X-CSE-ConnectionGUID: TNbv6qPqSzydSBZ4XBg27g==
X-CSE-MsgGUID: 4SxeZ6zxQwq/7gIQtXPQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57645074"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 12:00:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 12:00:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 12:00:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 12:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwnbuwubX4ULSB9LynizpgoNW6FDshE9rJlS4MgmLDfC9HpQ5NLrjHLhIT0KdfkAfcrnOAqqUsCIlbaP1p+YeC0Q6Prrxzrbza7cs3d5iyv7TNLYkkerD/0aPbWXabNHtYOX2hSByrBVtTC19hlLu3LAp6ruk0KjbdoILG/uigee3voaV0iF2eyqMBHOI+59J9TKyt+Iiac3WpuCpCxR5TdBjWM3bqa50pHS1UsIJmy2jmTR8n7BwhKiH6fexxl9NAWxPSW3ySOgBxN1chjL8kVepiNcQ0WQjulrZ/yqJqgRGO4sFVnW+zCDWotNIkou0ZfLBPUWCOp4jM5RFcAt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQpQRjZtH6IhoSZp1P1mt5cf1jVwQjb1g24K7b65cBc=;
 b=B53oFvkmJBrwTuXPpHFcE/yDA2W3CuQsJ/UiN3MkJcVjNp/1tQtAeeM8iYeZphYirlvSNV5FruJ/EWo+zB2fa3yAv+s30hchVBlV69JKCL1ZYfrtCTNJgsXyg2C9jMlXHMwpRf3TCpq+kpnA/WkJZ+xQbYOru+/9/8T3YaNpxe6oKrfmP1Ryl9Eurq7jnT0yy8H6qmsBLdmFDfRyoVymQMJ4RWxlvV1KULZ6jBmNbflOifXM8kLWTyRjfC+DAdVvn3SCr7yns9mefkcBJSyTJ/GdAemsMLIJqy0y754jZMXsvq1NJgRq6emqyxcpcQiQbZii3FfqJV/JlGK/6Lo03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 26 Jul
 2024 19:00:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 19:00:33 +0000
Date: Fri, 26 Jul 2024 18:59:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 14/21] drm/xe/eudebug: vm open/pread/pwrite
Message-ID: <ZqPyHmU7GaFCfGdN@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-15-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-15-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 814e5649-edc7-4cc4-5903-08dcada53a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BxwAgWsjKOVVWBxhaIgTV6XtmzFE6X+Kp2xxZHlYL+vB2tfSqDYehSxb1dln?=
 =?us-ascii?Q?lVDQxBh1EByJwD7uroiHRC4KsX60M26N0xx4AwhhvSPlwqW/XKAbUvkKcWED?=
 =?us-ascii?Q?u0VUGLzzy1UJbxDrXQGgF0yrnq0I2SnuCL6GJFE5+KmV/368MgjLded54CLI?=
 =?us-ascii?Q?APqLKK/D17yvL3TdN9+2qTCAq2NZOnabVuEYyPRf6YqSXqDKoydkZfFjm7Xy?=
 =?us-ascii?Q?H7qyKyGGJOjs83jIJHogrfaQTyJRSf2zWh5r9vEyikSYhITsmV+fj8JhtqYI?=
 =?us-ascii?Q?qYjDd/COz3E4/QCxcTlyusfFFtvS7jO0jSOoZw0rwCvpgMllEq5e4KVLCbtn?=
 =?us-ascii?Q?NY5VgR99Q6ak6jdXPvtTSK3cYBp5mcyZFz7n/1vVE1noZwYPLZGebwH+9GFd?=
 =?us-ascii?Q?6sQ84z2ZHQgGyr91vdSYNaMsIQQxkIJCZobxv02Ah0yVL0rhRqp5PyNSl5wT?=
 =?us-ascii?Q?14Zb6grdjb8tpvYztKqD8W40RnwNg3NS/BRuhCRLpINEZsm9iLVW0ngXTOBH?=
 =?us-ascii?Q?IN2gbwTpL536dsuGfNzDMI0EDl3qTicOsKg2KVd9cXzQkfEyNfRneeIZM2+W?=
 =?us-ascii?Q?+AGvq+GE2FqVvUiuS3E3IR7t16pQmTHUMu4lVb34JqcbcutNt81YHfWB9LgV?=
 =?us-ascii?Q?XGqXjTuPZrON5HyExsxmksGQ5AAO2g+7I2kOD24mkCzHqamdk6zuds3LWOE2?=
 =?us-ascii?Q?xNyXGDXMN7PEX2a+MM2nWHVn1NaEDOhmI5YC9FEnwPvljoWXq7PichSF+ao/?=
 =?us-ascii?Q?hUEJZdMMFuznfJ10p3BwDBd2byHO0LZ9PnmCE7+dOHYXIWxGE63WU9wnl7nU?=
 =?us-ascii?Q?B4dpTNhsP5w4kOieuxFZQcMd0qt4hbFTKkU5rzaidNvYSH+8u+NFHqQvx1Zo?=
 =?us-ascii?Q?0IXVmNMdohwPTNzm1mhlQPQIZcHU2MGvbe62ydYKCJgkCJFi9jqJQ005rGXi?=
 =?us-ascii?Q?+EUztdbqXJvpOEEjhgh5YbwPKyZ4AKEc9D0QXTEQMnKNO9kMUay0sR5+n2RH?=
 =?us-ascii?Q?LVNpYRKr5FbL58VHpW5HjfrrpxqHNEK6JMitI1JDCgVVL98zDSRFoxRPKdMc?=
 =?us-ascii?Q?NXSZuWs42OhUSmIvkYIOABNavsHzHg3jSRSjGClGRy8GPNdOXbv3N7E00g9m?=
 =?us-ascii?Q?frpu7NBwojjcfkpR+rAP3LGaNlK+bqv4MFE4aQrV55Ih16fLH/W2qU69NjSk?=
 =?us-ascii?Q?yeGNyjfCrIKH62uOnCCM99M7iCbjoRYdQb5X3iFVmgAnC2HYjOxeexibOUUT?=
 =?us-ascii?Q?Q9N6+o9Zh2USPqpi56TKd4gllXoL06B4PLmGL+mAMtq5EMkdMu4Iypyzf7Ek?=
 =?us-ascii?Q?U+m/I27518ktPvb+MN/fztlzOl8GNpHuHNzY3UCDt9sHqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1bgOZV1XT07N2AU3yZVXfslkVufU39j15QiH+xkFjBvNWZh1oM2RNFzF4evo?=
 =?us-ascii?Q?SyfnlyodiRtYd0E+iHq1xhDdmizVWHd2lGih/Pw4PTONJA6NqZfN6X4MOj1B?=
 =?us-ascii?Q?lXW8d/F/qwIhqcUgeQgI3V/nF+OBDcBn1/I7JfLPBx1Nq/szRVMzlVEkQ9vN?=
 =?us-ascii?Q?FCZfAcKxVLr2KnUPCOS0WgaPzZ8OSJt6lIKA5xObb8M8mJS4rFPnz20qXOwt?=
 =?us-ascii?Q?XAybzLZ/a4KyONfEmuX+WxUIQ1yu5I2+ox95DP6JCD+AekkF1BpPsn0joh8r?=
 =?us-ascii?Q?dV9C/Oxz7BYWPhjiex2PJ3/j6JgdOYLWf99WDOlpNhsZ+XW1jrabw/FvfQKn?=
 =?us-ascii?Q?9STWhsER3YckMKy6b/LRzPHRF3rPnCnNDhryaDEj5BCtyG5MpCYP7vyfCixd?=
 =?us-ascii?Q?mtK99IQA4GOCte9aYs5zbMWtYX69qwyGqi/7OuKtd9ab/ZUSz2+e9tetN7le?=
 =?us-ascii?Q?DONq5ErtUar6ViUd7NwG2HxrzyYGLeQU97h7eboGeSYTZPe7arkUlxyM5+KA?=
 =?us-ascii?Q?fVczhjLU0khs6oU+wzGs5PLtKG4E/0B8mHwKryJLXBXWZFyve6/zi5XSO+Je?=
 =?us-ascii?Q?x18u5FI7FP6S5BfETUt6HNueJwUWlGJGdqFExiaK5zUTMzq+7OkrYAlAX3nR?=
 =?us-ascii?Q?w2LRODJZYaviP43Ti9sE8S/QghvVhlnHhQb3WgSjh2U4ZakXafAi/1SYY4yx?=
 =?us-ascii?Q?k1hnVcLfURqaWp0HSHWLJPW/9Ebe0GWYGkUA65B1U1LROkXUfqIs5SDkjIRP?=
 =?us-ascii?Q?t7k9EQXknXOWeTWVBOu/1yfpjuKLbWZWZxC7v39qrp16n6D5ROg2ABYMwF7D?=
 =?us-ascii?Q?js7wHuHxIJA6XGpV2+D/JP0d0Y+PhAvg4TXNwqvPIBWNz1giOalWeMyOpZ1h?=
 =?us-ascii?Q?5NMNjCSSuGuSUORLrbBUiDoiH2fCkiPv4g3ODCVIXK95cmv7vpghW7DG3j8W?=
 =?us-ascii?Q?/d3fNP4inT3mEUnGbHIPTY+2IQNaU8OrVCOFcXn3MPrdxkak5bZsWxq5xiiT?=
 =?us-ascii?Q?zDtYWAvuDEnrfXNFtPTFyl722zhod2fDCzC3An/9feOnr8h9K7lwtYw+9S3d?=
 =?us-ascii?Q?wmPrig/xwFNj6ZrfLUGdrsbRszCCYBazu2uBWzgrno4GTRzcxz/HNmLRNPUb?=
 =?us-ascii?Q?XCHvv+SvwHil0DE9hEbZzS2jRuj5KzBPHN2MFlULfHV2NYsLdjwQChT8i5yu?=
 =?us-ascii?Q?SVpnKLB6bvR0cGOsxGdLLEsVWwBhBYsfc92UPBDXCFdIzk2jRJL5sWIWdzVN?=
 =?us-ascii?Q?+JxCjAVz9uNaRHT8Hlkf2xHyUbb84y41Lfvs0GyrpDtzwyMgwAqT9/IMm+9H?=
 =?us-ascii?Q?6S3LuditVidDX8keHjPe2cHk0m75mXJZDl9/mhbvixQaOZ7AO7U+ugJxcVeY?=
 =?us-ascii?Q?jTx4T+pG8tT2hsujeoWR6t+5BUAXGpzyVo/k6odjDJvoKNRcA8LNnuTs/J5u?=
 =?us-ascii?Q?Nfiru9Y8yebQMzsdDnpouuf2PUfH11tfr2y57uzw31+RDpnr+rHbUImRXnjR?=
 =?us-ascii?Q?mcwstD/gZ2DOLkzbi0KVE19EAO4TlpcKKIPS5IMqOSZDR/JW7VHzkQhdSkai?=
 =?us-ascii?Q?q+y9uGZVg/SJd7aFFp4dYXQ51X6Ijvcu8QLr/geaawqpHZLkwRpgNnHjm5Q8?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 814e5649-edc7-4cc4-5903-08dcada53a29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 19:00:33.8453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0EbM6jAo2Yh2IlEOBJfj4NSZCEO7jy88l3wRZcXqmvNKgNYEF0n32oojGDCLRvBznXxMTAznvI2Mgnf7cZKoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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

On Fri, Jul 26, 2024 at 05:08:11PM +0300, Mika Kuoppala wrote:
> Debugger needs access to the client's vm to read and write. For
> example inspecting ISA/ELF and setting up breakpoints.
> 
> Add ioctl to open target vm with debugger client and vm_handle
> and hook up pread/pwrite possibility.
> 
> Open will take timeout argument so that standard fsync
> can be used for explicit flushing between cpu/gpu for
> the target vm.
> 
> Implement this for bo backed storage. userptr will
> be done in following patch.
> 
> v2: checkpatch (Maciej)
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  24 ++
>  drivers/gpu/drm/xe/xe_eudebug.c      | 470 +++++++++++++++++++++++++++
>  include/uapi/drm/xe_drm_eudebug.h    |  18 +
>  3 files changed, 512 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 546bb7cc2337..0d688189a2b3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -520,6 +520,30 @@
>  #define   CCS_MODE_CSLICE(cslice, ccs) \
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
> +#define RCU_ASYNC_FLUSH				XE_REG(0x149fc)
> +#define   RCU_ASYNC_FLUSH_IN_PROGRESS	REG_BIT(31)
> +#define   RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT	28
> +#define   RCU_ASYNC_FLUSH_ENGINE_ID_DECODE1 REG_BIT(26)
> +#define   RCU_ASYNC_FLUSH_AMFS		REG_BIT(8)
> +#define   RCU_ASYNC_FLUSH_PREFETCH	REG_BIT(7)
> +#define   RCU_ASYNC_FLUSH_DATA_PORT	REG_BIT(6)
> +#define   RCU_ASYNC_FLUSH_DATA_CACHE	REG_BIT(5)
> +#define   RCU_ASYNC_FLUSH_HDC_PIPELINE	REG_BIT(4)
> +#define   RCU_ASYNC_INVALIDATE_HDC_PIPELINE REG_BIT(3)
> +#define   RCU_ASYNC_INVALIDATE_CONSTANT_CACHE REG_BIT(2)
> +#define   RCU_ASYNC_INVALIDATE_TEXTURE_CACHE REG_BIT(1)
> +#define   RCU_ASYNC_INVALIDATE_INSTRUCTION_CACHE REG_BIT(0)
> +#define   RCU_ASYNC_FLUSH_AND_INVALIDATE_ALL ( \
> +	RCU_ASYNC_FLUSH_AMFS | \
> +	RCU_ASYNC_FLUSH_PREFETCH | \
> +	RCU_ASYNC_FLUSH_DATA_PORT | \
> +	RCU_ASYNC_FLUSH_DATA_CACHE | \
> +	RCU_ASYNC_FLUSH_HDC_PIPELINE | \
> +	RCU_ASYNC_INVALIDATE_HDC_PIPELINE | \
> +	RCU_ASYNC_INVALIDATE_CONSTANT_CACHE | \
> +	RCU_ASYNC_INVALIDATE_TEXTURE_CACHE | \
> +	RCU_ASYNC_INVALIDATE_INSTRUCTION_CACHE)
> +
>  #define RCU_DEBUG_1				XE_REG(0x14a00)
>  #define   RCU_DEBUG_1_ENGINE_STATUS		REG_GENMASK(2, 0)
>  #define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 5dcb7c9464e9..aa383accc468 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -8,7 +8,10 @@
>  #include <linux/anon_inodes.h>
>  #include <linux/poll.h>
>  #include <linux/delay.h>
> +#include <linux/file.h>
> +#include <linux/vmalloc.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> @@ -36,6 +39,7 @@
>  #include "xe_wa.h"
>  #include "xe_force_wake.h"
>  #include "xe_sync.h"
> +#include "xe_bo.h"
>  
>  /*
>   * If there is no detected event read by userspace, during this period, assume
> @@ -747,6 +751,17 @@ static struct xe_lrc *find_lrc(struct xe_eudebug *d, const u32 id)
>  	return l;
>  }
>  
> +static struct xe_vm *find_vm(struct xe_eudebug *d, const u32 id)
> +{
> +	struct xe_eudebug_handle *h;
> +
> +	h = find_resource(d->res, XE_EUDEBUG_RES_TYPE_VM, id);
> +	if (h)
> +		return (void *)h->key;
> +
> +	return NULL;
> +}
> +
>  static int _xe_eudebug_add_handle(struct xe_eudebug *d,
>  				  int type,
>  				  void *p,
> @@ -1199,6 +1214,8 @@ static long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
>  	return ret;
>  }
>  
> +static long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg);
> +
>  static long xe_eudebug_ioctl(struct file *file,
>  			     unsigned int cmd,
>  			     unsigned long arg)
> @@ -1219,6 +1236,11 @@ static long xe_eudebug_ioctl(struct file *file,
>  		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
>  		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
>  		break;
> +	case DRM_XE_EUDEBUG_IOCTL_VM_OPEN:
> +		ret = xe_eudebug_vm_open_ioctl(d, arg);
> +		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
> +		break;
> +
>  	default:
>  		ret = -EINVAL;
>  	}
> @@ -2829,3 +2851,451 @@ static void discovery_work_fn(struct work_struct *work)
>  
>  	xe_eudebug_put(d);
>  }
> +
> +static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
> +				   void *buf, u64 len, bool write)
> +{
> +	struct xe_device * const xe = xe_bo_device(bo);
> +	struct iosys_map src;
> +	int ret;
> +

To make this clear vm->lock is held here in write mode, add lockdep assert.

> +	dma_resv_lock(bo->ttm.base.resv, NULL);
> +
> +	ret = ttm_bo_vmap(&bo->ttm, &src);
> +	if (!ret) {
> +		if (write)
> +			xe_map_memcpy_to(xe, &src, offset, buf, len);
> +		else
> +			xe_map_memcpy_from(xe, buf, &src, offset, len);
> +
> +		ttm_bo_vunmap(&bo->ttm, &src);
> +
> +		ret = len;
> +	}
> +
> +	dma_resv_unlock(bo->ttm.base.resv);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
> +				 void *buf, u64 len, bool write)
> +{
> +	struct xe_bo *bo;
> +	u64 bytes;
> +

Here too.

It goes for any functions in the EU debugger which access the VM state
with this is lock held. Good practice and self documenting. Helps with
reviews too because I don't need to think about questions like 'how this
is not race with a bind, exec, rebind work, or page fault?'.

Matt

> +	if (XE_WARN_ON(offset >= xe_vma_size(vma)))
> +		return -EINVAL;
> +
> +	bytes = min_t(u64, len, xe_vma_size(vma) - offset);
> +	if (!bytes)
> +		return 0;
> +
> +	bo = xe_vma_bo(vma);
> +	if (bo)
> +		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> +				void *buf, u64 len, bool write)
> +{
> +	struct xe_vma *vma;
> +	int ret;
> +
> +	down_write(&vm->lock);
> +
> +	vma = xe_vm_find_overlapping_vma(vm, offset, len);
> +	if (vma) {
> +#ifdef VERBOSE_VM_ACCESS
> +		drm_dbg(&xe_vma_vm(vma)->xe->drm,
> +			"eudbg: offset: 0x%llx: vma start 0x%llx, size 0x%llx, offset_in_vma 0x%llx",
> +			offset, xe_vma_start(vma), xe_vma_size(vma), offset - xe_vma_start(vma));
> +#endif
> +		/* XXX: why find overlapping returns below start? */
> +		if (offset < xe_vma_start(vma) ||
> +		    offset >= (xe_vma_start(vma) + xe_vma_size(vma))) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		/* Offset into vma */
> +		offset -= xe_vma_start(vma);
> +		ret = xe_eudebug_vma_access(vma, offset, buf, len, write);
> +	} else {
> +		ret = -EINVAL;
> +	}
> +
> +out:
> +	up_write(&vm->lock);
> +
> +	return ret;
> +}
> +
> +struct vm_file {
> +	struct xe_eudebug *debugger;
> +	struct xe_vm *vm;
> +	u64 flags;
> +	u64 client_id;
> +	u64 vm_handle;
> +	u64 timeout_ns;
> +};
> +
> +static ssize_t __vm_read_write(struct xe_vm *vm,
> +			       void *bb,
> +			       char __user *r_buffer,
> +			       const char __user *w_buffer,
> +			       unsigned long offset,
> +			       unsigned long len,
> +			       const bool write)
> +{
> +	ssize_t ret;
> +
> +	if (!len)
> +		return 0;
> +
> +	if (write) {
> +		ret = copy_from_user(bb, w_buffer, len);
> +		if (ret)
> +			return -EFAULT;
> +
> +		ret = xe_eudebug_vm_access(vm, offset, bb, len, true);
> +		if (ret < 0)
> +			return ret;
> +
> +		len = ret;
> +	} else {
> +		ret = xe_eudebug_vm_access(vm, offset, bb, len, false);
> +		if (ret < 0)
> +			return ret;
> +
> +		len = ret;
> +
> +		ret = copy_to_user(r_buffer, bb, len);
> +		if (ret)
> +			return -EFAULT;
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t __xe_eudebug_vm_access(struct file *file,
> +				      char __user *r_buffer,
> +				      const char __user *w_buffer,
> +				      size_t count, loff_t *__pos)
> +{
> +	struct vm_file *vmf = file->private_data;
> +	struct xe_eudebug * const d = vmf->debugger;
> +	struct xe_device * const xe = d->xe;
> +	const bool write = w_buffer != NULL;
> +	struct xe_vm *vm;
> +	ssize_t copied = 0;
> +	ssize_t bytes_left = count;
> +	ssize_t ret;
> +	unsigned long alloc_len;
> +	loff_t pos = *__pos;
> +	void *k_buffer;
> +
> +#ifdef VERBOSE_VM_ACCESS
> +	eu_dbg(d, "vm_access(%s): client_handle=%llu, vm_handle=%llu, flags=0x%llx, pos=0x%llx, count=0x%lx",
> +	       write ? "write" : "read",
> +	       vmf->client_id, vmf->vm_handle, vmf->flags, pos, count);
> +#endif
> +	if (XE_IOCTL_DBG(xe, write && r_buffer))
> +		return -EINVAL;
> +
> +	vm = find_vm(d, vmf->vm_handle);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, vm != vmf->vm)) {
> +		eu_warn(d, "vm_access(%s): vm handle mismatch client_handle=%llu, vm_handle=%llu, flags=0x%llx, pos=%llu, count=%lu\n",
> +			write ? "write" : "read",
> +			vmf->client_id, vmf->vm_handle, vmf->flags, pos, count);
> +		return -EINVAL;
> +	}
> +
> +	if (!count)
> +		return 0;
> +
> +	alloc_len = min_t(unsigned long, ALIGN(count, PAGE_SIZE), 64 * SZ_1M);
> +	do  {
> +		k_buffer = vmalloc(alloc_len);
> +		if (k_buffer)
> +			break;
> +
> +		alloc_len >>= 1;
> +	} while (alloc_len > PAGE_SIZE);
> +
> +	if (XE_IOCTL_DBG(xe, !k_buffer))
> +		return -ENOMEM;
> +
> +	do {
> +		const ssize_t len = min_t(ssize_t, bytes_left, alloc_len);
> +
> +		ret = __vm_read_write(vm, k_buffer,
> +				      write ? NULL : r_buffer + copied,
> +				      write ? w_buffer + copied : NULL,
> +				      pos + copied,
> +				      len,
> +				      write);
> +#ifdef VERBOSE_VM_ACCESS
> +		eu_dbg(d, "vm_access(%s): pos=0x%llx, len=0x%lx, copied=%lu bytes_left=%lu, ret=%ld",
> +		       write ? "write" : "read", pos + copied, len, copied, bytes_left, ret);
> +#endif
> +		if (ret <= 0)
> +			break;
> +
> +		bytes_left -= ret;
> +		copied += ret;
> +	} while (bytes_left > 0);
> +
> +	vfree(k_buffer);
> +
> +	if (XE_WARN_ON(copied < 0))
> +		copied = 0;
> +
> +	*__pos += copied;
> +
> +#ifdef VERBOSE_VM_ACCESS
> +	eu_dbg(d, "vm_access(%s): pos=0x%llx, count=0x%lx, copied=%lu bytes_left=%lu, ret=%ld",
> +	       write ? "write" : "read", pos, count, copied, bytes_left, copied ?: ret);
> +#endif
> +
> +	return copied ?: ret;
> +}
> +
> +static ssize_t xe_eudebug_vm_read(struct file *file,
> +				  char __user *buffer,
> +				  size_t count, loff_t *pos)
> +{
> +	return __xe_eudebug_vm_access(file, buffer, NULL, count, pos);
> +}
> +
> +static ssize_t xe_eudebug_vm_write(struct file *file,
> +				   const char __user *buffer,
> +				   size_t count, loff_t *pos)
> +{
> +	return __xe_eudebug_vm_access(file, NULL, buffer, count, pos);
> +}
> +
> +static int engine_rcu_flush(struct xe_eudebug *d,
> +			    struct xe_hw_engine *hwe,
> +			    unsigned int timeout_us)
> +{
> +	const struct xe_reg psmi_addr = RING_PSMI_CTL(hwe->mmio_base);
> +	struct xe_gt *gt = hwe->gt;
> +	u32 mask = RCU_ASYNC_FLUSH_AND_INVALIDATE_ALL;
> +	u32 psmi_ctrl;
> +	u32 id;
> +	int ret;
> +
> +	if (hwe->class == XE_ENGINE_CLASS_RENDER)
> +		id = 0;
> +	else if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> +		id = hwe->instance + 1;
> +	else
> +		return -EINVAL;
> +
> +	if (id < 8)
> +		mask |= id << RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT;
> +	else
> +		mask |= (id - 8) << RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT |
> +			RCU_ASYNC_FLUSH_ENGINE_ID_DECODE1;
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), hwe->domain);
> +	if (ret)
> +		return ret;
> +
> +	/* Prevent concurrent flushes */
> +	mutex_lock(&d->eu_lock);
> +	psmi_ctrl = xe_mmio_read32(gt, psmi_addr);
> +	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
> +		xe_mmio_write32(gt, psmi_addr, _MASKED_BIT_ENABLE(IDLE_MSG_DISABLE));
> +
> +	ret = xe_mmio_wait32(gt, RCU_ASYNC_FLUSH,
> +			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
> +			     timeout_us, NULL, false);
> +	if (ret)
> +		goto out;
> +
> +	xe_mmio_write32(gt, RCU_ASYNC_FLUSH, mask);
> +
> +	ret = xe_mmio_wait32(gt, RCU_ASYNC_FLUSH,
> +			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
> +			     timeout_us, NULL, false);
> +out:
> +	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
> +		xe_mmio_write32(gt, psmi_addr, _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> +
> +	mutex_unlock(&d->eu_lock);
> +	xe_force_wake_put(gt_to_fw(gt), hwe->domain);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_vm_fsync(struct file *file, loff_t start, loff_t end, int datasync)
> +{
> +	struct vm_file *vmf = file->private_data;
> +	struct xe_eudebug *d = vmf->debugger;
> +	struct xe_gt *gt;
> +	int gt_id;
> +	int ret = -EINVAL;
> +
> +	eu_dbg(d, "vm_fsync: client_handle=%llu, vm_handle=%llu, flags=0x%llx, start=%llu, end=%llu datasync=%d\n",
> +	       vmf->client_id, vmf->vm_handle, vmf->flags, start, end, datasync);
> +
> +	for_each_gt(gt, d->xe, gt_id) {
> +		struct xe_hw_engine *hwe;
> +		enum xe_hw_engine_id id;
> +
> +		/* XXX: vm open per engine? */
> +		for_each_hw_engine(hwe, gt, id) {
> +			if (hwe->class != XE_ENGINE_CLASS_RENDER &&
> +			    hwe->class != XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			ret = engine_rcu_flush(d, hwe, vmf->timeout_ns / 1000ull);
> +			if (ret)
> +				break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_vm_release(struct inode *inode, struct file *file)
> +{
> +	struct vm_file *vmf = file->private_data;
> +	struct xe_eudebug *d = vmf->debugger;
> +
> +	eu_dbg(d, "vm_release: client_handle=%llu, vm_handle=%llu, flags=0x%llx",
> +	       vmf->client_id, vmf->vm_handle, vmf->flags);
> +
> +	drm_dev_get(&d->xe->drm);
> +	xe_vm_put(vmf->vm);
> +	xe_eudebug_put(d);
> +	kfree(vmf);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations vm_fops = {
> +	.owner   = THIS_MODULE,
> +	.llseek  = generic_file_llseek,
> +	.read    = xe_eudebug_vm_read,
> +	.write   = xe_eudebug_vm_write,
> +	.fsync   = xe_eudebug_vm_fsync,
> +	.mmap    = NULL,
> +	.release = xe_eudebug_vm_release,
> +};
> +
> +static long
> +xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
> +{
> +	struct drm_xe_eudebug_vm_open param;
> +	struct xe_device * const xe = d->xe;
> +	struct xe_eudebug *d_ref = NULL;
> +	struct vm_file *vmf = NULL;
> +	struct xe_file *xef;
> +	struct xe_vm *vm;
> +	struct file *file;
> +	long ret = 0;
> +	int fd;
> +
> +	if (XE_IOCTL_DBG(xe, _IOC_SIZE(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) != sizeof(param)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) & _IOC_WRITE)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, copy_from_user(&param, (void __user *)arg, sizeof(param))))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, param.flags))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
> +		return -ENOTCONN;
> +
> +	vm = NULL;
> +	mutex_lock(&d->xe->files.lock);
> +	xef = find_client(d, param.client_handle);
> +	if (XE_IOCTL_DBG(xe, !xef)) {
> +		mutex_unlock(&d->xe->files.lock);
> +		return -EINVAL;
> +	}
> +
> +	d_ref = xe_eudebug_get(xef);
> +	if (XE_IOCTL_DBG(xe, !d_ref)) {
> +		mutex_unlock(&d->xe->files.lock);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&xef->vm.lock);
> +	vm = find_vm(d, param.vm_handle);
> +	if (vm)
> +		xe_vm_get(vm);
> +	mutex_unlock(&xef->vm.lock);
> +	mutex_unlock(&d->xe->files.lock);
> +
> +	XE_WARN_ON(d != d_ref);
> +
> +	if (XE_IOCTL_DBG(xe, !vm)) {
> +		ret = -EINVAL;
> +		goto out_eudebug_put;
> +	}
> +
> +	vmf = kmalloc(sizeof(*vmf), GFP_KERNEL);
> +	if (XE_IOCTL_DBG(xe, !vmf)) {
> +		ret = -ENOMEM;
> +		goto out_vm_put;
> +	}
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (XE_IOCTL_DBG(xe, fd < 0)) {
> +		ret = fd;
> +		goto out_free;
> +	}
> +
> +	vmf->debugger = d_ref;
> +	vmf->vm = vm;
> +	vmf->flags = param.flags;
> +	vmf->client_id = param.client_handle;
> +	vmf->vm_handle = param.vm_handle;
> +	vmf->timeout_ns = param.timeout_ns;
> +
> +	file = anon_inode_getfile("[xe_eudebug.vm]", &vm_fops, vmf, O_RDWR);
> +	if (IS_ERR(file)) {
> +		ret = PTR_ERR(file);
> +		XE_IOCTL_DBG(xe, ret);
> +		file = NULL;
> +		goto out_file_put;
> +	}
> +
> +	drm_dev_get(&d->xe->drm);
> +
> +	file->f_mode |= FMODE_PREAD | FMODE_PWRITE |
> +		FMODE_READ | FMODE_WRITE | FMODE_LSEEK;
> +
> +	fd_install(fd, file);
> +
> +	eu_dbg(d, "vm_open: client_handle=%llu, handle=%llu, flags=0x%llx, fd=%d",
> +	       vmf->client_id, vmf->vm_handle, vmf->flags, fd);
> +
> +	XE_WARN_ON(ret);
> +
> +	return fd;
> +
> +out_file_put:
> +	put_unused_fd(fd);
> +out_free:
> +	kfree(vmf);
> +out_vm_put:
> +	xe_vm_put(vm);
> +out_eudebug_put:
> +	xe_eudebug_put(d_ref);
> +
> +	return ret;
> +}
> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> index 1875192e92bd..df79eafb6136 100644
> --- a/include/uapi/drm/xe_drm_eudebug.h
> +++ b/include/uapi/drm/xe_drm_eudebug.h
> @@ -18,6 +18,7 @@ extern "C" {
>  #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
>  #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
>  #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
> +#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
>  
>  /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
>  struct drm_xe_eudebug_event {
> @@ -171,6 +172,23 @@ struct drm_xe_eudebug_ack_event {
>  	__u64 seqno;
>  };
>  
> +struct drm_xe_eudebug_vm_open {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @client_handle: id of client */
> +	__u64 client_handle;
> +
> +	/** @vm_handle: id of vm */
> +	__u64 vm_handle;
> +
> +	/** @flags: flags */
> +	__u64 flags;
> +
> +	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
> +	__u64 timeout_ns;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
