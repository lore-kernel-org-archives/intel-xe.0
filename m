Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFAAFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 13:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B39010E708;
	Mon,  4 May 2026 13:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5zZghTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824E110E708
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777903150; x=1809439150;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/wfKyOHUoWme+Aq13NFhNMfpiW9Djhb0E3XyFq1Whxs=;
 b=M5zZghTzNEZNplEbpO8RqBJHxvpfA+NPzaNDerJR3GmAZ/d4Zclf8X3M
 RZhW62FrqmsMxJyg7aNljCQgjI8rEqms/d+1B9pgiQO3vyAMo8xbAtXWH
 Dq5YhGspsKc40O7Y6TLl9Bcmm3B+Ec/ITxuu0qDjkWyPP3Kbk1Vl+eHXK
 +2a11tMDi5Gy/09E1/WqZZ6plJz5nw/aONzjykXQ/+6o+mkuGj0CyxQiZ
 URAT/6Yk0DHRI4SAunK6bZ1Fwt0sNwDmliRJ5lwJJR2H8kcSiVjaRlA0+
 QHa8MAkYKuoKzQc39nByic9L7D8RtU/iqqRSbQtw7BBFXzAUlH4QNTQiV w==;
X-CSE-ConnectionGUID: NXrCK++0QduR/+bP9FULUA==
X-CSE-MsgGUID: xdpXAsFsRwiuOlCTbxveBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89065840"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="89065840"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 06:59:10 -0700
X-CSE-ConnectionGUID: 5KmScbCASO2cfiHSqMswIg==
X-CSE-MsgGUID: SypEf6A4SduwST7LCx1NMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="237296462"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 06:59:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 06:59:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 06:59:08 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 06:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4m0+GNLuCH3vYatwNXCaRVGkjEyf7Vxdto94osfN8kzxs2vfH7IGc9O+s39YaIpQp4MlUXeRfJq320A59jKpcqAja0pkrZ9rBY0uTLzwE4RRZiXPhThPREbbDcPvo9pGJfsY2QXIDZiM5/+apO8gD/53eNfjeJ56ptzrWnWeSr4r85uE6t7qrPIp1x3yETca6td2lncKyFkKOIiAxd1SlLq62qQkx4A7ZdEUgoaG4w7CHRAqlsifLJeH5kmuJJDLSZqQ4WkJiCK2w9d5eEPt7ZRv3W0KrLM1bR4tAU9KwjeJcX7Cul+2IQ8n8iWrWji7Bsf22X2LfzYfXH/qFTFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l20Ns0uhD0kbNDQQGLQYRUfPxS1QzRndjk1+NV1Pi6A=;
 b=c1bFcBwn9iKAMuoGmWMLnGBwFVLAOPoaM1TkS8/p3UYlzRQCW/cTvQLFAOXE1TfyTTQEcpGy8mjWT6J+mhVoRulpWipPDLXQBRovqh5Vd/NNhiARZplldYI4EI9sWsMycYFELhh1HgldL4CNO2Oq6xGbjRcPF40XCFR17+dbz24kDd0nt+Jj8MeBLPyVHmINTL9az4PzBtNgIaD8XEkH5xKeBPRKwSlsZPa4sodWDsacVgNRpsoxbl+Z5EBN06Q3zB+JRz3/2hPEEqoXRLpk4X7/weTvGxkGIJHXWc3NDeTzXK7bkgAkskT6KlvuyrFTIfdDZ1tiHFQ0XB5KnaIWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB9323.namprd11.prod.outlook.com (2603:10b6:208:565::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:59:00 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:59:00 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <daniele.ceraolospurio@intel.com>, <shuicheng.lin@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Sort xe_config_device fields and defaults
 alphabetically
In-Reply-To: <20260504044348.209625-3-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-3-stuart.summers@intel.com>
Date: Mon, 4 May 2026 10:58:56 -0300
Message-ID: <878q9ze0nz.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0055.namprd07.prod.outlook.com
 (2603:10b6:a03:60::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a1d001-9566-4a79-67fd-08dea9e54ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: DpwlgzfnOVQzSowBz4y+g4CPjtctiaoXe2ZW7hOA4ipa/uIUMl4fxM4KuM7rl+XWtgwQnunU6yL2TXwTooH8PM8Ireos4FyOSpiSR3A1SCVUcyj+HCeKBMW7BXx1dg2Yu9Sn6jWCS/xPRIlKdCi62KrYomF6c+YlQVJL4W3vUFB57EPk4+nnmlRs3s+3hztsPJg88yiv6SVG/mBqKHluwmRiztYZhBpb2l2581j5IBYdSQVFskdkvOKLS3erIMroeBPPfaJgaSEzYKpS490RQvFor3ZEFPWAynAGdpNujnNMvPk+cXkGLDbN4f1M/BtdCm54hO9h2UIwJf6ghI0nAw8uamlUmso3Xj/uRj6b9RtmOEbUGQhuaFT04esUA9NDIWVkZG3yY13jouO8O76ubf2qc4pbunJNFfk6Yvs+BL2etmVXotxQ6XDUeVXbZYAH3ztupgJ8NCScSwilL0dm129SxGqbbMa63VNLPM7chN94ZW4QEoFlf5GzEvQ8+XH787rYcwtBzLr1zdHQylGD2XeMMvbB1aV1ukjtkDtoGhjVFJgQo43f2BazEA4LkJu8b21miacHoob85mrIEyzrg+8ZpOdfhJjnHvNRqzU6bE83qka7fKTBNt8K07CFH9zE6KQLcYb4KD/2csesaJoLYx8Aq1TMuOEZHKTFjVZj0VmSD2XQOE1e+Pe65e7Re3/c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fpVRnTnLtwmqeRSb7Wkm3PmThjWiq95JeYKRaNJ7DJOTW3rHM8/2YKiSAUK8?=
 =?us-ascii?Q?yecFuqrEdvdaoPcBOHeOdnb9NHJLquLritPtcd4HSOEmQLBw/p+IFRlDzfy8?=
 =?us-ascii?Q?jf6gxiK6JyqJyvLZvoWpnrNl+2Wti05L+zfVYcyfdz4d94ymR3ESjHmMNp82?=
 =?us-ascii?Q?ffH08w1Qygtqv158S/JOGfaZMdAfNW+LoYf3Ml4/4vlo8z8KQtQQ9yBfWKkk?=
 =?us-ascii?Q?QOYlWq3/LMRn+qN/Vrj5d6qZJyp6t5qLTwHD42MJ84UjLKvRNWu6LyvznFZs?=
 =?us-ascii?Q?SNdKIjWvWAPBI0leklnpLAxAIHEBXnUniH7gzCLNcMK4xNSskX3l5w7rRip+?=
 =?us-ascii?Q?j8e/NtM5iMB2kqRySc+tkpikb0jjcxwkIGeJEMOX996F4wfE7XZBLOAC1WF1?=
 =?us-ascii?Q?ngrgpC6ofYVC2Ac9c+b1GxJAWmvnLTcVqn/FLJTNVriJ8a+fP2I3nel7DlLy?=
 =?us-ascii?Q?3MPbUJE1BjDcGojhMgfLtxcWEYTL3YTbG+iEOG/wyev8IKDzFanI6lRZj18I?=
 =?us-ascii?Q?YJ1LD79etsZcjLBwUoWtwsOgHNzEU8NFkbG85UH/+ZiURbQyG22WHTAqFfSX?=
 =?us-ascii?Q?Fdu0uaotC52bG/iqg7/eqY03KGNC9kkUrreFEMYckKgJRDLKEiO9mqtfPvEh?=
 =?us-ascii?Q?hnLULi0+XkfkcjdzitkDICLvzq+gzBWRsPYEsEiTtoInjpzyjpf6SSepV74X?=
 =?us-ascii?Q?gQmxXvUT5+L2wNM2UzfhF/S76C6B4b+ARie3k8Tl+QhH/cRz/Z/apDw+b0Eo?=
 =?us-ascii?Q?Yi1c+pFnRxhTpzfbdoKTzqj+6pvSczfQN9s0fOqNNbjv0JYGqLLpEmK0GPAk?=
 =?us-ascii?Q?lp4Ay8LJnLze3lamjcup5EpPaZCjNQmwPP4OpoJAvQTHyS2aLQSZTdffQ3KF?=
 =?us-ascii?Q?gIz0WlnvgmUppxi7AvIV2EF9qAzclQ8f5QByamB3u7Pg0VMYAwYitKmceLqo?=
 =?us-ascii?Q?0H0hCyf+HJxZiJyqA18kB5VzR8cI8Xy04ULa678cys/DxR6O9wi+FAifFTEy?=
 =?us-ascii?Q?oh5a/0aVFV45K4Q9sif7tSoXeSXAIphVyX3ih+CGSnjDIFxPcnGYGp4kcP2t?=
 =?us-ascii?Q?3d01I3wOsgVhydPsFhT+IlzKwxTUBBxYnScfGv5r+LViV52tV9plinhhknBQ?=
 =?us-ascii?Q?bsLmLxKuclkztslGxrubJ1XjI1iBOYAECaG0kDy2uDsSv1smHFdf7yEmIfLO?=
 =?us-ascii?Q?XklPKJvW5HEgLAHDRT4eRSq+YTK4lU66MsLGzkUDLx9xL/CayENnLIu0vdRT?=
 =?us-ascii?Q?faBl+4pweH4KsjeAYFwUnX1jh2znG+ERkmyIUqN6nKDQ8Qyci8G/HWqoyOXn?=
 =?us-ascii?Q?xryTcfHQZcRq5nSbKMYgPQexyFtQuyYZxe86KGndQq5hi/2KLTVFPaCiv7z9?=
 =?us-ascii?Q?K5tex03hfW7jjoJ1YpAjFErHCNwXBPTyGvn3stDkSw4l+xcPtXvX4yyHDJdx?=
 =?us-ascii?Q?L4B98hD3lZMltv6hEIan0FZQFrygUlTXhg5uLUzt4nP69kRajJ6LHyv7wWax?=
 =?us-ascii?Q?3NlU3cRCZvoT7p/0sFjzJDcyYooDj2t3mSeesAQVkx8gMofPUQsgc4iWzwTx?=
 =?us-ascii?Q?bIFLgaeJTAUbAJuNVYbuM0IDa4Es5yHFXA3Z6h8/7S6x1OrVwejqjQj6R7mz?=
 =?us-ascii?Q?W0sv5IBstHdtS3AVKApSi1K6p5N8yF3AcoaweWWniyEJAVDu94LgpKzcDtP6?=
 =?us-ascii?Q?okiruPyyCF3Y85cy1ReGqLvwQ/HdCyVWbPPnLgZFqMVhKqDPOpP8YeZa6qFr?=
 =?us-ascii?Q?kD4h8O1hQw=3D=3D?=
X-Exchange-RoutingPolicyChecked: k1vHFF2Brmn9hf5tPekGhcVrHfZA/UV959z9yswGlYKTAHIJnQB3ivc2C1sDr+cNGCMCT7DWQ7XMf0O8f85sV3PkvJLUMYwzr3kf4Pn3JN1RMHkeSG56pyefAwyurXMrXp7exWIwyvpfryeTg7xF+EFhZ+8ig8TjS2lIC0x4Nx+Q6R8n+U6BaX2MoCR4PD9yOlU66d8jL9eeKiguiyOhv9pcGfZDoFK31vBIi4w9dGMr3ZGBgPgWt+XkIsDpNcNbU6jroqF4Uj72PQxI2yzgFY0w0kCwbALiCWR/8OpyxHWNKWIQwguq3wZLXo7vBvyXr3OwJmlPcKKtVXyl915VMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a1d001-9566-4a79-67fd-08dea9e54ac8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:59:00.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwuxbC9Hakfe9svdDplantLsuXcL1XHhbAJn1mYk8E7ldiSC964VL93BV7pUP7H2MvMYjBfapuCD1g7yG9tXCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9323
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

Stuart Summers <stuart.summers@intel.com> writes:

> Sort the fields in struct xe_config_device and the corresponding
> device_defaults initializer in alphabetical order. Non-SRIOV fields
> come first (alphabetically), followed by the SRIOV sub-struct with
> its own fields in alphabetical order. Also sort the PRI_CUSTOM_ATTR
> calls in dump_custom_dev_config() to match and the documentation for
> each of the fields.

I think the sorting alphabetically seems fine, but I'll defer it to
others to weigh in here on this decision though.

I guess we will not have many instances of that struct, so I guess
potential padding resulting from the sorting requirement should be
fine.

We probably want to add a note somewhere in the code asking to keep that
stuff ordered alphabetically.

By the way, for other people looking at this, I find it easier to review
this with: git show --color-moved --histogram.

Code-wise, looks good to me, so if this is the direction we take,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-4.7
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 192 +++++++++++++++----------------
>  1 file changed, 96 insertions(+), 96 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 69abc69ec0f3..1e134057fae8 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -73,53 +73,79 @@
>   * Configure Attributes
>   * ====================
>   *
> - * Survivability mode:
> - * -------------------
> + * Context restore BB
> + * ------------------
>   *
> - * Enable survivability mode on supported cards. This setting only takes
> - * effect when probing the device. Example to enable it::
> + * Allow to execute a batch buffer during any context switches. When the
> + * GPU is restoring the context, it executes additional commands. It's useful
> + * for testing additional workarounds and validating certain HW behaviors: it's
> + * not intended for normal execution and will taint the kernel with TAINT_TEST
> + * when used.
>   *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
> + * The syntax allows to pass straight instructions to be executed by the engine
> + * in a batch buffer or set specific registers.
>   *
> - * This attribute can only be set before binding to the device.
> + * #. Generic instruction::
>   *
> - * Allowed GT types:
> - * -----------------
> + *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
>   *
> - * Allow only specific types of GTs to be detected and initialized by the
> - * driver.  Any combination of GT types can be enabled/disabled, although
> - * some settings will cause the device to fail to probe.
> + * #. Simple register setting::
>   *
> - * Writes support both comma- and newline-separated input format. Reads
> - * will always return one GT type per line. "primary" and "media" are the
> - * GT type names supported by this interface.
> + *	<engine-class> reg <address> <value>
>   *
> - * This attribute can only be set before binding to the device.
> + * Commands are saved per engine class: all instances of that class will execute
> + * those commands during context switch. The instruction, dword arguments,
> + * addresses and values are in hex format like in the examples below.
>   *
> - * Examples:
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> + *    normal context restore::
>   *
> - * Allow both primary and media GTs to be initialized and used.  This matches
> - * the driver's default behavior::
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
>   *
> - *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> + *    beginning of the context restore::
>   *
> - * Allow only the primary GT of each tile to be initialized and used,
> - * effectively disabling the media GT if it exists on the platform::
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> +
> + * #. Load certain values in a couple of registers (it can be used as a simpler
> + *    alternative to the `cmd`) action::
>   *
> - *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> + *	rcs reg 4F100 DEADBEEF
> + *	rcs reg 4F104 FFFFFFFF
> + *	EOF
>   *
> - * Allow only the media GT of each tile to be initialized and used,
> - * effectively disabling the primary GT.  **This configuration will cause
> - * device probe failure on all current platforms, but may be allowed on
> - * igpu platforms in the future**::
> + *    .. note::
>   *
> - *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *       When using multiple lines, make sure to use a command that is
> + *       implemented with a single write syscall, like HEREDOC.
>   *
> - * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> - * **This configuration will cause device probe failure on all current
> - * platforms, but may be allowed on igpu platforms in the future**::
> + * Currently this is implemented only for post and mid context restore and
> + * these attributes can only be set before binding to the device.
>   *
> - *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + * PSMI
> + * ----
> + *
> + * Enable extra debugging capabilities to trace engine execution. Only useful
> + * during early platform enabling and requires additional hardware connected.
> + * Once it's enabled, additionals WAs are added and runtime configuration is
> + * done via debugfs. Example to enable it::
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * Survivability mode:
> + * -------------------
> + *
> + * Enable survivability mode on supported cards. This setting only takes
> + * effect when probing the device. Example to enable it::
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
> + *
> + * This attribute can only be set before binding to the device.
>   *
>   * Allowed engines:
>   * ----------------
> @@ -147,69 +173,43 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * PSMI
> - * ----
> + * Allowed GT types:
> + * -----------------
>   *
> - * Enable extra debugging capabilities to trace engine execution. Only useful
> - * during early platform enabling and requires additional hardware connected.
> - * Once it's enabled, additionals WAs are added and runtime configuration is
> - * done via debugfs. Example to enable it::
> + * Allow only specific types of GTs to be detected and initialized by the
> + * driver.  Any combination of GT types can be enabled/disabled, although
> + * some settings will cause the device to fail to probe.
>   *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> + * Writes support both comma- and newline-separated input format. Reads
> + * will always return one GT type per line. "primary" and "media" are the
> + * GT type names supported by this interface.
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * Context restore BB
> - * ------------------
> - *
> - * Allow to execute a batch buffer during any context switches. When the
> - * GPU is restoring the context, it executes additional commands. It's useful
> - * for testing additional workarounds and validating certain HW behaviors: it's
> - * not intended for normal execution and will taint the kernel with TAINT_TEST
> - * when used.
> - *
> - * The syntax allows to pass straight instructions to be executed by the engine
> - * in a batch buffer or set specific registers.
> - *
> - * #. Generic instruction::
> - *
> - *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
> - *
> - * #. Simple register setting::
> - *
> - *	<engine-class> reg <address> <value>
> - *
> - * Commands are saved per engine class: all instances of that class will execute
> - * those commands during context switch. The instruction, dword arguments,
> - * addresses and values are in hex format like in the examples below.
> + * Examples:
>   *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> - *    normal context restore::
> + * Allow both primary and media GTs to be initialized and used.  This matches
> + * the driver's default behavior::
>   *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> - *    beginning of the context restore::
> + * Allow only the primary GT of each tile to be initialized and used,
> + * effectively disabling the media GT if it exists on the platform::
>   *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> -
> - * #. Load certain values in a couple of registers (it can be used as a simpler
> - *    alternative to the `cmd`) action::
> + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> - *	rcs reg 4F100 DEADBEEF
> - *	rcs reg 4F104 FFFFFFFF
> - *	EOF
> + * Allow only the media GT of each tile to be initialized and used,
> + * effectively disabling the primary GT.  **This configuration will cause
> + * device probe failure on all current platforms, but may be allowed on
> + * igpu platforms in the future**::
>   *
> - *    .. note::
> + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - *       When using multiple lines, make sure to use a command that is
> - *       implemented with a single write syscall, like HEREDOC.
> + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> + * **This configuration will cause device probe failure on all current
> + * platforms, but may be allowed on igpu platforms in the future**::
>   *
> - * Currently this is implemented only for post and mid context restore and
> - * these attributes can only be set before binding to the device.
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
>   * Max SR-IOV Virtual Functions
>   * ----------------------------
> @@ -256,15 +256,15 @@ struct xe_config_group_device {
>  	struct config_group sriov;
>  
>  	struct xe_config_device {
> -		u64 gt_types_allowed;
> -		u64 engines_allowed;
> -		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		bool enable_survivability_mode;
> +		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		bool enable_psmi;
> +		bool enable_survivability_mode;
> +		u64 engines_allowed;
> +		u64 gt_types_allowed;
>  		struct {
> -			unsigned int max_vfs;
>  			bool admin_only_pf;
> +			unsigned int max_vfs;
>  		} sriov;
>  	} config;
>  
> @@ -277,13 +277,13 @@ struct xe_config_group_device {
>  };
>  
>  static const struct xe_config_device device_defaults = {
> -	.gt_types_allowed = U64_MAX,
> -	.engines_allowed = U64_MAX,
> -	.enable_survivability_mode = false,
>  	.enable_psmi = false,
> +	.enable_survivability_mode = false,
> +	.engines_allowed = U64_MAX,
> +	.gt_types_allowed = U64_MAX,
>  	.sriov = {
> -		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> +		.max_vfs = XE_DEFAULT_MAX_VFS,
>  	},
>  };
>  
> @@ -814,17 +814,17 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>  CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, enable_survivability_mode);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> -CONFIGFS_ATTR(, enable_survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_mid_bb,
>  	&attr_ctx_restore_post_bb,
>  	&attr_enable_psmi,
> +	&attr_enable_survivability_mode,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> -	&attr_enable_survivability_mode,
>  	NULL,
>  };
>  
> @@ -929,12 +929,12 @@ static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *p
>  	return len;
>  }
>  
> -CONFIGFS_ATTR(sriov_, max_vfs);
>  CONFIGFS_ATTR(sriov_, admin_only_pf);
> +CONFIGFS_ATTR(sriov_, max_vfs);
>  
>  static struct configfs_attribute *xe_config_sriov_attrs[] = {
> -	&sriov_attr_max_vfs,
>  	&sriov_attr_admin_only_pf,
> +	&sriov_attr_max_vfs,
>  	NULL,
>  };
>  
> @@ -1096,10 +1096,10 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>  
> -	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> -	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
> +	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> -- 
> 2.43.0
