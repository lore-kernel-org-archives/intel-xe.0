Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A585DC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C96410E05D;
	Mon, 13 May 2024 15:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARU9A6qH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FE210E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615050; x=1747151050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IWyAnIgpOkXGmEWtb+iURm4Jy1DkO+TxlOztkne2Jxw=;
 b=ARU9A6qHqVStzhuABh9eIUAGR3tG7Q55nqokanYwHrxBVZt9nJNBAp3O
 /17Scrfezl4kKB9bPLh1uVrJJICZpNOsi6YxXivk+eXMnWt0OkL2iRgJ5
 qAnXVbxnmixTXRDoIY9ZlXER7Lmc2eITHmu8Cn9KV8EuYGOYweI9EnkLV
 6gjKbKOwSikTjtVbl/zZAfhfgJ3Mk+X+MToPHk/PVSq3rxU2rYtjZ7Bos
 jrsrImzJqpBmDjhJpbObToh+PUSCZJWZ5WY1l7wknEFWR/JrooW52/+Pi
 y5XIrpYLQnku1ga1jx0RRDJyVduG4lwhaudoQKgbcIr/GVsRxwe7XfRdz A==;
X-CSE-ConnectionGUID: ccYwDoSjSv68JrXrwKtk3Q==
X-CSE-MsgGUID: pniMaGIcTTCKcgDQ2kzUrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34069655"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34069655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:44:09 -0700
X-CSE-ConnectionGUID: Cf2ArPGuQIKodppkCuG4lQ==
X-CSE-MsgGUID: dE7Gj5CaQASNJZbeCeho2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30493591"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:44:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:44:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:44:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2U6cyOrorcIdsRBM/H1zBDrTVQfzeb+ioxGKjw+OG82GYVjopLh40TFaZ5ZYKRuQ0o5HJ2h57UTFaZHx0+l5tRFBn+84cKQ3dXhapPLUifslJCrS3AuppJkMSgqe0dvtvm09vc1BMG2y/jVF5+EsusJY3hGvG9sc4lC2RxBGI2SyK4K/kM1FFj1DqH3Han9yQ8rnx1aonE1zB+/IDDAEOC4OW8rS05CMip0wZe3oXtI12Mh88DkSNVNjhbPyQdqyw/+7Lmeu+aJvLjwaMNmskYjeWOdgX6gpBN8IxBxaVeV78FtWs1TwItkXwoGJoAvtYyktnzl6q5UqjWNJqzjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/xAWnMEqYO6hcxTpOX7G8nqoxrpvzMCpaFRlK9o4Ho=;
 b=Euf+pJ+WMevp0joeXpJIx57sf5F0P7c2FQwbbQtK3fYgUTjlbAMudqsF/LXd5Hiol+/9oXHk1aRgZMC8+x6bo2UtayjAc8Hls3bjUSuX5WMrkybBzuXp7H5p/49YKhJeitshY3nut4M/MqH9gSYpqTTmXw6ySL6RK3JcogyL3iM6rIIcKCO9NZvbulC++tKu3FxmboVK6a+tl5sdjMV7X/WkRvq4yL+WQHgcmE4bOBHGsx5m2iJ0qgfVsGYG8vXsOEoPjEMwG4PA0/ybPNcrR1WD3PZUhpwxV8iPPn8OJ2wwAMRx5PyACV6dZy9IxIguYASvnJ+iVJcElz1LfyFhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:44:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:44:06 +0000
Date: Mon, 13 May 2024 11:44:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Fix xe_gt_throttle_sysfs.h
Message-ID: <ZkI1QS9B7mjJcN23@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
 <20240513084218.2084-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513084218.2084-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:303:b9::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc9e7e7-69bc-446a-ceaf-08dc736385a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hRPMlRo/mjwEQbaZakr6ApjPK9CuAnkskLzQmy01+oX7N0AQdU3OwCxV6qND?=
 =?us-ascii?Q?cvczvS+n2iasVT5gVPNLIWRjVe0CTgIO4hX+sZULoxgg3HaF2mgRGzjaaXFj?=
 =?us-ascii?Q?lE1DDEj1SOss6Ofsi1+AuOnhtjsl5EM+0zRGo9fsuMl03ktGomLlDcx3sqyp?=
 =?us-ascii?Q?GhqIfUuWqFO/QP4C2uP+J1uZdC/NKf4NuWu72cZz/xGd7pN/wUfj1GSMohzU?=
 =?us-ascii?Q?nuQN9Jp4IhySzwhneJ9hY8JfSwOVD1bjjdAgzGWv9FPC/w3R3W8T40E9EjM2?=
 =?us-ascii?Q?IXZIcM7oQ42p4uY4KjjzWjZyTxI6OJ1yw1LyZpgQkGwIzbfC/nyOJj4+m4ZY?=
 =?us-ascii?Q?cjGBMrlIXL0uTVgCFtvd0PkkP7A5DU4592OCF93jNqscRhu7ApwenY8QE6U6?=
 =?us-ascii?Q?2GY+mKsNGVsJr9Vm/FHsmjDMKi9NbRhR18RSrD50CVOwkBSUY6z6hItX9lFo?=
 =?us-ascii?Q?YvWW63m6N1KPSLor6ild6Pctc888m5REvBuOdtAvH9K4a3MLxsCjjiR9fL6q?=
 =?us-ascii?Q?KaV/w8iletrUNIhu1LK+svkENfAbsf6Gd46IuLggVPDXh51NVJ8QgF0z0E1m?=
 =?us-ascii?Q?a2Crwic4kdeIKxlvA9rVDpNgMFCM109FxzvFaC+bKvjZQNCC7VfeeZ63CZPK?=
 =?us-ascii?Q?wueddg4rbuwHjf+qBck8h/fxhI3v1Dicb0HUM1oHFMTH9MCYjFV/sM2KhCZY?=
 =?us-ascii?Q?/GBTOa+Ba7ThcNRGenl7oO7hWL5uUd/9DBTXQ0gDOGO+1m36lTHGe+mVMYBU?=
 =?us-ascii?Q?nXTD1uuOSc/Bpec4qizjD5D+wjZBz8Mnujk8Xxuo0/z8VCVqH7/A4wUZiYQi?=
 =?us-ascii?Q?r6XNGGEZ46HlMqfu+YuVxD493a8OMGY2aNaiL566EvzmkLuS1dTThVkzJnr1?=
 =?us-ascii?Q?AY5Q6fnzBTkUC6EX20nZdOHsR51WU4mLSTLrfqUgKjUVQtUQ4pUFyglHlihU?=
 =?us-ascii?Q?5J24WEF4Zvo9jRzYy/e7KjSewG+u/cuTYTF4PuLEBO6AVOs2xi6Iwvs57yKk?=
 =?us-ascii?Q?UGu2wsL+8U1C11mLi6IMQpDf/pwmLoukrF+scBy9aSGQgL7Mq48rCOIMTPUN?=
 =?us-ascii?Q?6hMYYdj6fAhK8J55VSEZ7YCSaLeqZXrJilcHiPhZUAXlFULpejYxqAGWrf8V?=
 =?us-ascii?Q?hphEnozmR10G2szNI2VQgnv6n9NiTK0yUmqgGp8PNT3c9XndkaMD1O8nq/2p?=
 =?us-ascii?Q?1XAP8suqTrb6g/zXo+DYQY8qKmN/y5CLOoeiYHXHUVL70opi2NL9WdNP6d2j?=
 =?us-ascii?Q?mUSwkR/btY5Pvvh7aPz4BNdYw/D+6JRxuBwVIUauQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7c2E5bhN+Ssqsh69lICf+zglxEX14JX07RPTGyiwX5UPb6qociYoWVB5PgGi?=
 =?us-ascii?Q?PEIxo77/DwIU2uX5brtZfxzve0pQavWAna5g8rbl5BAgkfozQ4iqcN20KhIo?=
 =?us-ascii?Q?P6n9faIOx5zHGbKw/cSeosMxyJa3Ligo0DIeTsvsfH0EUeoD6XhIEpHOs1fD?=
 =?us-ascii?Q?wPNXRlyuRTLKHwA2S6FZJCRgFbf92HuNkS+awH6Nragps4Hfl624Jnrlk3EF?=
 =?us-ascii?Q?rgQQ0zilvPct6AYeVGHNAa3eNc9EDV30laGHbJIHq78TgCicd67Pv+AmeFkk?=
 =?us-ascii?Q?Hay7/N9wwG1WLqNFtC4LlRMNjnF6fNLCShz1L/H/Oag5kfJ/jH6p7ou7bWlo?=
 =?us-ascii?Q?0QaKELFduGsKVSSaPcfdQbjYCQZdpME69+pQsZns9xhaRN5Q2onRT/dgp3p1?=
 =?us-ascii?Q?75bGhuhAD6odKNf8koYJL7fLr+XlBbjqy579M9IviaRb5sO45xT26o7F/fd1?=
 =?us-ascii?Q?/EhiShuAyoKoloXBPmyuwcYtLqoS44YZetSdbCxvTn/wGKqV+wLEgzpjuKhc?=
 =?us-ascii?Q?J09S8ZHgNot5w7BjpbcmBDydw9DAar3xHkTEPgKhnJ8CgaJE7kySyqBeNd6a?=
 =?us-ascii?Q?4rgcmMUrCPrkWtXAqL36iNn2IClHnYG26Tj7UohVbinb7LIZkCizo81Go1q/?=
 =?us-ascii?Q?L4z3S2wR+PxBusKBfQhebP7RgwAF6jeS95bHTwk+NzIrqDSdZMzrGsr/c1Y+?=
 =?us-ascii?Q?CPI6jit3nek8gtzMG0MmVgump+n7FFP7X30v5jSp4CrLP7I01w9tegXBAdBv?=
 =?us-ascii?Q?zmTWOz7HqluXs/LPg152fZJLJKA1967A7VcO61zl1UcNxm8UKCDKGFPsh7Cf?=
 =?us-ascii?Q?wggiVm8Eq9E1v6DfLztgiCglGTQ/1kkBnP0CMY7ZNN2MLRpkitiRxvuFmyLX?=
 =?us-ascii?Q?Oltqdj0XO9w5TLA3St9qnRW5FBHO1oeGdHy/EHd+2GaIsQmiLIqTChpkKYF+?=
 =?us-ascii?Q?Uag82LMHlbU0XcWUdtMSe4MAyxR8k5vVnqxu5sciAf3Zy7UE19WwNG4Gsj/e?=
 =?us-ascii?Q?B+9CVZ/cS4SxwxEdTdhQcGXevnfzHMyuBUQSZTlBqoLQ8klSWb/s4QEIk4xs?=
 =?us-ascii?Q?Vzq0YjGBVI5EtJzSxiLWR+OR+VyWmjSwV4B6LiNSg6jAJnw8XzwfeEBWwVCO?=
 =?us-ascii?Q?XLO7MPEIT6jeXeAnGu7tq+gufYKm/M1jCeDhpz2hzkdbk7vikpyG/+fOVpgs?=
 =?us-ascii?Q?LQlErKSYdIzaBBwfif3+K57qfxoWV2OkqbM5YpHaNjPZByvXgksQIS4uY4wy?=
 =?us-ascii?Q?+ySwOujQ7odsrUGUdUs9dGrngJFLm+4FG3yfsqnTyompCUDsM3HRvPOM/2hk?=
 =?us-ascii?Q?RT9ijR3VLwJsx8SZrpeivX2pCZpLyTSzktU/mIxrfjxnIiaz4U1AVpOcNHqC?=
 =?us-ascii?Q?/rcW5FS25KJA7YT715LVHRXxVLqUDrhbUa1akN5T58OaRzX/0xId8mj72HKY?=
 =?us-ascii?Q?hOqpw68uMdudSciNOOo+ccBg1ncrGw6XNaljhySiegDKWjdfcxLruy61kBhU?=
 =?us-ascii?Q?ixc+4WuyAlB85x9gYNENcV/kGSSOlmhBAnnTLLXG0D/QfFYt6DuMl19zZqMi?=
 =?us-ascii?Q?QyafEjbu1WXBVaD1MIo+0jPzJ7QdWeGQUDtB6O/J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc9e7e7-69bc-446a-ceaf-08dc736385a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:44:06.3515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arMnvZ4IOV7+3K8e7KaUgO7aPCpJHBcmCHPiPn1YtKukE5zOBWWkv/CNYVIa8fBGGjkIuQea6n6m6IhLHSbFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, May 13, 2024 at 10:42:15AM +0200, Michal Wajdeczko wrote:
> We don't need to include drm/drm_managed.h here.
> We don't need to comment final #endif.
> Also remove empty line at the end.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> index 6c61e6f228a8..335c402b51a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -6,11 +6,8 @@
>  #ifndef _XE_GT_THROTTLE_SYSFS_H_
>  #define _XE_GT_THROTTLE_SYSFS_H_
>  
> -#include <drm/drm_managed.h>
> -
>  struct xe_gt;
>  
>  int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>  
> -#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> -
> +#endif
> -- 
> 2.43.0
> 
