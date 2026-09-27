Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B2C9832F
	for <intel-xe@archiver.kernel.org>; Sun, 27 Sep 2026 23:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CB710E707;
	Sun, 27 Sep 2026 23:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wn7GoFWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84CF10E707
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Sep 2026 23:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790553296; x=1822089296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5MgJsBRjMiNqkz+rk9L2oDpbZkQOcp8kXeImY+ilXto=;
 b=Wn7GoFWcaakX1Hc2z7CGDf/iuyqLzO+dd20tg99rudLFd5qGbKjjJqTU
 CuJKMPq6khWqX7ksV5d8mPmUl6Iy603npT/KbzgvG4JkwdNN+3BBG6Wzu
 oXki5d6zXxrQEQuCsSVRfa8bQegz4RsO/uai66K8DKM+3dp85eoVAFsxW
 D3ugTqB5V6TzrxCjUmUu6bAf2dpMGs1jTOhVoxmVwHj2S8VCbgmNs8rE2
 mte5i9LPYyymyyqYPpap2k3zcWz8iF8zdrx2TCjD9S2sxDQ0o5wCn6Flh
 rBJXYCEoU5GYtTQ3Q8F5NRxOXJzkoTtmoNypWEQaS1vw70MMOLWPs3h9k Q==;
X-CSE-ConnectionGUID: ytlq09ddQJOulzcdNp8vww==
X-CSE-MsgGUID: KQr2oa4nR5yjP6aZz9Dnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="93741482"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="93741482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 16:54:56 -0700
X-CSE-ConnectionGUID: 0LUXNvS7RHy5eGPM4hNq5Q==
X-CSE-MsgGUID: P+dvW7dSQF+tKOysWxiJ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="275016860"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 16:54:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 16:54:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 16:54:55 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 16:54:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsLgH0/FsD0ZyOxGIMk9bccRei68G4tWh+2yzXSj9C4XVPoW82PRpN+skzK6TxCiw6XjxfHD5zNmW7dGm1LWFlWzXz6guL/8F7cG/NPFGwZa0wCEODdsT488S8Q1xRpdrmOFeBgj2MbXfTpZQQDrlzvfAgr1Kj6A/fWszVUm2eEDvigzQLY+OlsgpyoO+pbnvZWt5lbfC+u+VoMXAckp0AJ+VbnbU/4iVJMw2GK7ugjUf+iWCs6WI/wDvZYjEtYdf5fdeA9sXmTm+TwAQNpDE86Naqz4hid/lQM/XxBotMRCGhMhfZVlnQ5/CXMy+Jw9vm5pMOlFNes+V+fNj5+c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQnm4ZR9RrbJELJpMauIfXXlq6LCIGfTHNpeKrRMQIk=;
 b=excnJE8wMI1i8Hn5FQOepON4YqeYgZJVzQiZHOnp5aNlJ56HF9KwNXBfj8RUQMwy/b9rkVbMe9YmiYllCRuzbJmVKtDJDgMGYbAv4iu94qEm/bLV0VyQCcdEAD2ReetJhTe0qw8MFYTTuo9thzHzjWfvtPayFoe8zU8S6OTZH7zaHZuq/NF9iIkBHHgCUiQJmn/8xzaCNdZBVVHLiHi6tk0u11c5bnxFVwl89MI1B8tciDNEkhcWg/5xPQXsN+gi3cRFrpgZ2/0SRPce02WM2r88oS9hLrNUxxvyfBXP1y2VqOrtwA/jHP3dWEJVM1e7RvX3LCn52EvotUh+/XRqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 27 Sep
 2026 23:54:52 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 23:54:52 +0000
Date: Sun, 27 Sep 2026 19:54:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 2/3] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Message-ID: <armstjBvo4_fVAkQ@intel.com>
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
 <20260925135521.1804299-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260925135521.1804299-7-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW3PR11MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: e481b87e-5273-4534-df37-08df1cf2b872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZT4AtgNZRgdt8F742htNCzKvy2EjXuyfew2jtf4jPM+OcpRpU3BqwiOjjmZUAc0L9kgX5YKxkzCsENmrbU6X+396j5xE5yFFry1KosAyKKlFT7ouIG49WGL3TL/l+Ie4nxNzNmz7cPidy4+jsU5JDCxgqX617swq1agNf5VwLnGxSGY60XCAP1ByNkogM1wXRVLJE5AzEeiXId4AJV6j/0BFDBCxo5acIXdyAMSUhvIuuZ/HBSeO1TnnnCDgtT2+1Rf1l6ZNnehzTtlUrjmUCXVaQQ8NKXeNEgQSpijcLbK+BXQfQY6FnMd+IMNbBnKa6znhvQgIrn/emei6emeEB5jUYM+pRSEtSl2wy8MIf3lRbBCK8R+ZJAV02iaP9e+44m12+kMIQlMvmqlMeQUOehEx2g1ETfNHaIabn0GZANMS2bsf0TjK1zGeGOWr9XvayLrBZ8R9zFVC/GX34xYaI2t6iUG8P+cK4UqhixMxEx9yToY6zjOK2H90fShshxRGqBaLHf9Vb95EilmZ6NQcD3HPQjBVgoVh8K2pwbbB4z7KeqZEzwLoqd8WCOzlaZ+J9ZjivBG2GiKPFOuhJJeGHC9DFPkaLBbaLtJCjSmTqSwqqz9Gy0RASRGGBV2YQdGdt94Uo4zYRVNNyBFovHrINr0/47ywviCceCa72mOWWAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLGE7HRQw/MWlhwywrVei5K/wRgqOFY18zfbkDSwfx23j9ovNd/LQ2fTo5mp?=
 =?us-ascii?Q?sUijftf7mNhN7Vuyq5uwW2Ch9AImwXuZ5Q6WmOLa1GTuqzzbQJoHiPlfVqr0?=
 =?us-ascii?Q?7/cK2Z4DhR0OITeWC3+AuzRhjCv3I4lw7WI/paq25f/njl3g6CtHDwOXuYbY?=
 =?us-ascii?Q?u4ogidqW1RZqSZ90DGz1bKahSP7LMUWWhQq97XUzzh7mcNvl7OfPhSCHlGEy?=
 =?us-ascii?Q?mkCy1HBk5ZRq3wzsIze0ESC6UFbmM7IQWMO7O79MILpqp6Hgc3C4jrM1MsCE?=
 =?us-ascii?Q?VpGUq+/Gp16jIrzIDtmd7VjGZh+kD12y5xFDEUiq3/SMrcEm1lG1/PRa81qK?=
 =?us-ascii?Q?afqho+p9zQvC2QFuJp9l7FM/3PGlmoiu2nZk0+1KH23LX+QpDYK6J5+XTVkR?=
 =?us-ascii?Q?8iEymt9L3az28HbagmGhpq2qMWrp6xVinC/yGx8jvDtjL+W015gPZL3O1aVs?=
 =?us-ascii?Q?xDfy54Xwl/lgFmPVwMj7LgQRdpNH8jSN2NCh/BUpTQowOgFjiGe4M6pJskeh?=
 =?us-ascii?Q?Go5qeoJmBp08OvZFkqgA7z4LcLYAN0X1YaXl2hUr4bPGQV2jdloIqkEoXuTv?=
 =?us-ascii?Q?3xRRFSmfYElG8j2NHFJAJjdy2eYAJAOo36xpb35fIH2akzUM7scRCn/Vgmm7?=
 =?us-ascii?Q?FU31tFb1r+NCJn/xL1M6ArVmIGAvADqdRqcPAvZ842uv4PlsBM4UW/japQ1h?=
 =?us-ascii?Q?jKP8+SJxiCUHRGC/F4UZzt3EQJV5jEWgKTI6JtWE94ARas0CgSrHhL4n11in?=
 =?us-ascii?Q?UuAvD4wFP0kjfH92MRGmrYuWYicVbBuygYnCn5lnRGUweDMCUe1bdSkKzGQQ?=
 =?us-ascii?Q?pPFXONoaaGFU1RtlyWwGlztVjSrXgcmVoirVD1HktCebh/nKiuuVy2O1e4MY?=
 =?us-ascii?Q?OB+8Ziyt9yYxI0dZjyqWRb75JFc01LQRfObRYxcP8NiCD0T5zu1uDnEDwYKr?=
 =?us-ascii?Q?irbBX08BIkCCQ+FWfe/YPw7kzgizfApKK8dd3odrN8eTp8ypcZJzVW6l0chF?=
 =?us-ascii?Q?M4tx2vBcegVA37gIep72f7En4RfMLSd6nvilGUOGmDS6WtYZ4SD/PKFUmMDB?=
 =?us-ascii?Q?GfsEcviuLZiHT27wADXkiaolbtkA7HpX+c/XcGCJOLMYrsELquT31mCdUxI6?=
 =?us-ascii?Q?sKYr6eR9a6bQGrO9Ju8k3aAS1nTyZHe3LeVhvd3dIjCPpTfmLimfTmx+6p0B?=
 =?us-ascii?Q?F25i29Qkws4bw2KSaiMOfG8wC79ybWoJVzWH8mtM58iyF1OZpSDnfQXEnwwc?=
 =?us-ascii?Q?bNURyV2u7s5XSdz13okTtMLqyZ0SAunEGZxE+b4PLQpJDT3Mm52D+UIj/k2X?=
 =?us-ascii?Q?zdKAvNkJyUcimtnRg2NhoK9MfVjdn0UESCrL4HdIDctQR8WmpuFhBM2DOBxq?=
 =?us-ascii?Q?ixzVfb0Ps/9CjWBbM3mWDlce7rOCH02cL9sUZ4ojGbUMI10NCvsJ44UTe8vJ?=
 =?us-ascii?Q?Ydw1HMWhln7N1DQRFBNRx+I9JtTEYV0v7cYvXfQ+inLr/k7uhoi+dtMCGluM?=
 =?us-ascii?Q?pLQbRW59+wgQ8NqyObJnj7GUWd7O2YcrFI/ZB0cyKrrQ1IofIyXjkjDRCWLf?=
 =?us-ascii?Q?IiI1EwvHNZNMy1qWfmqYpoHb7iXRqSUc9HNHAmdz3dYm5NPwKq57Ou/7/8pB?=
 =?us-ascii?Q?QqBhu8BUJYk9Es7+oiF58PphJnIodA61059y90SH2eKglM1vg7j7LxUxqdNh?=
 =?us-ascii?Q?sjNuHpJ2GvsvrJKJaAGGvlqTNtRlyCfTjHVBo9PdRuiVbb56cPGxzGIzom8u?=
 =?us-ascii?Q?pySGqfyMBg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Qk48p2dB7WjHkiDBkdSozzKhJuXGyILHoKyjiWoFoK3+1aNJnl7RFqyoWUU/7OTutF1QgaRG5vtFRzuWFom74O0h6nTTTjrson9wrcCdnhVe0AcONzfr8JEzYo3j3qe2KMHa2PoBhJpubbv6G1lGQ4uFinUGkD/Id7LxU3SSVYl6t/P0w8XauiYe0U3kfaupdvKX6fxv5Lnsex3Z8kQqnkjJkY1OVx6/M8vEMSRsjQIUKbFPvD9TJycd1gsJoqpARylkag93ilwmsyQabcdJKfSoN3Q8xeh4x8XmA+iorkWC+mDXqvfyBvHqgVV084TsTL9sjLIJ4SKzh8It+jEP8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e481b87e-5273-4534-df37-08df1cf2b872
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 23:54:52.0131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpdzDzDDkEvlfzw7bYHuV0A7i5BqO6bYdYLEnpxjGlS2WhEWbK0cfAdsmZgcpQWtoPfYIdoQC6re6Z/hm+2Grw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
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

On Fri, Sep 25, 2026 at 06:55:22AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add debugfs interface for exercising System Controller's RAS error
> injection command, used to validate RAS error detection and recovery
> paths.
> 
> Command details:
> - Group ID: 0x02 (diag group)
> - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
> - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
>              > /sys/kernel/debug/dri/0/sc/ras_error_inject
>          cat /sys/kernel/debug/dri/0/sc/ras_error_inject
> 
> This command requires the diag application to have completed firmware
> boot and initialization (late-bind loaded). Both cat and echo are
> rejected with -ENODEV until xe_sysctrl_is_diag_fw_ready() reports the
> diag firmware as ready: the readiness check is done in .open(), so the
> file stays visible under sc/ but is inaccessible for both read and
> write until the diag firmware becomes ready.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v6 (Rodrigo):
> - Reject non-zero offset writes for ras_error_inject entry
> - Account for mailbox header size when validating input payload length
> - Refactor token parsing to simplify cleanup and error handling
> 
> v5:
> - Add per-entry locking for debugfs accesses
> - Add xe_pm_runtime guards for ras_error_inject readiness checks
> - Simplify ras_error_inject write-path flow
> 
> v4 (Rodrigo, Anshuman):
> - Gated ras_error_inject on diag firmware readiness in .open()
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 152 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 ++++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
>  3 files changed, 186 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index dfd614e7e54b..10675cd774ee 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/uaccess.h>
>  
>  #include "xe_pm.h"
> @@ -134,6 +135,153 @@ static const struct file_operations xe_sysctrl_loopback_fops = {
>  	.release = single_release,
>  };
>  
> +static int sysctrl_parse_ras_error_inject(struct xe_device *xe, char *tmp,
> +					  struct xe_sysctrl_diag_ras_err_inj_req *req)
> +{
> +	unsigned int nfields = 0;
> +	char *token;
> +	unsigned long val;
> +
> +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
> +		if (*token == '\0')
> +			continue;
> +
> +		if (kstrtoul(token, 0, &val))
> +			goto inval;
> +
> +		switch (nfields) {
> +		case 0:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req->ras_block_id = val;
> +			break;
> +		case 1:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req->ras_sub_block_id = val;
> +			break;
> +		case 2:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req->err_type = val;
> +			break;
> +		case 3:
> +			if (val > U32_MAX)
> +				goto inval;
> +			req->params = val;
> +			break;
> +		default:
> +			xe_err(xe, "sysctrl: too many ras_error_inject arguments\n");
> +			return -EINVAL;
> +		}
> +		nfields++;
> +	}
> +
> +	if (nfields < 3) {
> +		xe_err(xe,
> +		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id> <err_type> [params]\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +
> +inval:
> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
> +	return -EINVAL;
> +}
> +
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, const char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) = NULL;
> +	struct seq_file *m = file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	struct xe_sysctrl_diag_ras_err_inj_req req = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	u8 resp_hdr_only[sizeof(u32)];
> +	size_t out_len = 0;
> +	int status;
> +
> +	if (*offp)
> +		return -ESPIPE;
> +
> +	if (len == 0 || len >= PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] = '\0';
> +
> +	status = sysctrl_parse_ras_error_inject(xe, kbuf, &req);
> +	if (status)
> +		return status;
> +
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  &req, sizeof(req), resp_hdr_only,
> +				  sizeof(resp_hdr_only));
> +
> +	scoped_guard(mutex, &entry->lock) {
> +		guard(xe_pm_runtime)(xe);
> +		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->status = status;
> +	}
> +
> +	return status ? status : len;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	bool fw_ready;
> +
> +	scoped_guard(xe_pm_runtime, xe)
> +		fw_ready = xe_sysctrl_is_diag_fw_ready(xe);
> +
> +	guard(mutex)(&entry->lock);
> +
> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
> +	seq_printf(m, "Diag firmware ready: %s\n", str_yes_no(fw_ready));
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id> <err_type> [params]\" > ras_error_inject\n");
> +	seq_puts(m, "  cat ras_error_inject\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct file *file)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = inode->i_private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	bool fw_ready;
> +
> +	scoped_guard(xe_pm_runtime, xe)
> +		fw_ready = xe_sysctrl_is_diag_fw_ready(xe);
> +
> +	if (!fw_ready) {
> +		xe_err(xe, "sysctrl: diag firmware not ready, ras_error_inject unavailable\n");
> +		return -ENODEV;
> +	}
> +
> +	return single_open(file, xe_sysctrl_ras_error_inject_show, inode->i_private);
> +}
> +
> +static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_sysctrl_ras_error_inject_open,
> +	.read = seq_read,
> +	.write = xe_sysctrl_ras_error_inject_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_debugfs_entry *entry,
>  				      struct xe_sysctrl *sc, const char *name,
>  				      u8 group, u8 command,
> @@ -173,4 +321,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
>  	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
>  				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
>  				  &xe_sysctrl_loopback_fops);
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
> +				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
> +				  &xe_sysctrl_ras_error_inject_fops);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 6a8284a424c3..2554848e7484 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,10 +14,12 @@
>   * enum xe_sysctrl_group - System Controller command groups
>   *
>   * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> + * @XE_SYSCTRL_GROUP_DIAG: Diag group
>   * @XE_SYSCTRL_GROUP_CORE: Core group
>   */
>  enum xe_sysctrl_group {
>  	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +	XE_SYSCTRL_GROUP_DIAG			= 0x02,
>  	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>  };
>  
> @@ -55,6 +57,35 @@ enum xe_sysctrl_core_cmd {
>  	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>  };
>  
> +/**
> + * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
> + *
> + * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection
> + */
> +enum xe_sysctrl_diag_cmd {
> +	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		= 0x7E,
> +};
> +
> +/**
> + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request payload
> + *
> + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The mailbox layer
> + * prepends the application message header before sending.
> + *
> + * @ras_block_id: RAS block (subsystem) to inject the error into
> + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
> + * @err_type: Type of test error to inject
> + * @reserved: Must be zero
> + * @params: Optional injection parameters (default 0)
> + */
> +struct xe_sysctrl_diag_ras_err_inj_req {
> +	u16 ras_block_id;
> +	u16 ras_sub_block_id;
> +	u16 err_type;
> +	u16 reserved;
> +	u32 params;
> +} __packed;
> +
>  /**
>   * struct xe_sysctrl_app_status_req - Get application status request
>   *
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 9ad3c40de97a..8ea6e1f29ddd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -68,6 +68,9 @@ struct xe_sysctrl {
>  
>  		/** @debugfs.loopback: Loopback test entry */
>  		struct xe_sysctrl_debugfs_entry loopback;
> +
> +		/** @debugfs.ras_error_inject: RAS error injection test entry */
> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>  	} debugfs;
>  };
>  
> -- 
> 2.43.0
> 
