Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD42CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4F210EFF1;
	Tue, 29 Sep 2026 18:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkKz6MN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815AF10EFF1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790707093; x=1822243093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uU7MGzkQQaRgf/aQ19dMi4eVm2aPvRV6w3S/1r6UeMY=;
 b=VkKz6MN6g4cCpqFqVd8w1XpFcYq+2Vl+wh5lhv0H4IbG4lgGhXzk6d1r
 bFV5597UZp6hTzYMsPgEIqsorJ5rd/awl3gXX+WOheRdDT9moKZdo+9SL
 0l2bC9bBQzRNcoj2sPa2eXUprCCuQ9a6ZXDJn8xXEzkiBj7Qw5ZLOR39G
 2yYIZStPnZFjwd6W2owiIWeHeMyxJeMzS78WSVcb9uH6NsVPHCxgN4uPI
 +tBFHjq+Rhv2Rjk5u5/+xzn9MnKVlAI6BR7xvG1bCQx2q0TeAzcRVoVmz
 SQDxKB/EWKEo1vgmH1BRa/QIdlnQvVO030j9Otqo+Jo5lLVl6icIPBXiW g==;
X-CSE-ConnectionGUID: dbAqrE0gQuuJ59BGmvZ7hA==
X-CSE-MsgGUID: /uEGc6iMSxm1XZOr69m0yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107822469"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="107822469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:38:13 -0700
X-CSE-ConnectionGUID: jGkJKnsnSsSU1MNK7nF2ag==
X-CSE-MsgGUID: q8EfI3n1QlG3Mt9qGyIzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274559994"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:38:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:38:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:38:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jroFtRISx234ITs8Nc5JP8o8UguuYgp1dhjOJAnsXLVL/EZsHi8ZXQPY+BZJietJRvINCA7xyLmX8o3srSauzlWNzVva/5km5YE1cetWSHFOVcdx5cXianIwm0SsJbslkFFmjbt0nGCap18qlq0jEswGSZHaPDBgsb5z7K4/boqdRC9yWvzSAYzCl5IIm6dPVmty65jZFf7xYv9h4QCfHviF5kWUiP5iMTmLkdvtVclXN/V/wK6lLVkMwl1/22/O8ufflyFum6gdXsrcAzTZ7TqzZV0982qUrQ4bTH1snfT+2YPWFt6bJpJIHiFJdNT3/byuNgXdDAHq0gZaE7E06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO2+q0MovrP0BT44ddXzaub2zs4u1Rg9MS38hLqhN20=;
 b=YWgIunx0mOqdtKXheQHUF/m+Ksc5MWY0/1RIouTDlzqh9GxTtjfAYm5mByMbmO3mpmaduXkPWmV7Mb3fAZvj5eLCAovm5atNAo/S1X014IKbrdYA2pc30Od6LBKWG9iFC8Mg2rD9fsF+YIKOCoQgCeq5awP7YsScX/OMCS5dxp/0oLiAhvjXrCSvFGjM5N+s9W6eO0+dPJKdpaNRs94FhrZyteRV0Gx6cdl//JVhBy+lgoPvqg5rgxSkOuUdAWypGqyRIhLt+cW++UnLhGvQtm18cqSmBKFF8+QFt9G7NFuRR1qQGlqCGP/K6IpOexGsy3Qs0AX/v9R664VI/ADjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:38:03 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:38:03 +0000
Date: Tue, 29 Sep 2026 14:37:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe/cri: Expose device UID through sysfs
Message-ID: <arwFfJ3duEmGhcTa@intel.com>
References: <20260929171823.3811737-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260929171823.3811737-2-badal.nilawar@intel.com>
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fdde8b-c2c6-41dd-d192-08df1e58cb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0WQXZoPzVt4M+V+YlcJNVQiRREwrdsVdShbJICTd3B7in4nNXerO7IGhE4Zed1Z7QTTIFK4M2jFsP7W/bh9WdpDWmj6uxw6LhNlFCsVq25vdQmp8bMd8bUg5hN+sEvNGekM9lqiNPwX2QnKLout7CVJX76h0JWhUImr1l6w0JBEJOTa3xQZF2nhZdDOT87b31ZMTnHlWknP3Vl++QRYwKlNF4PjyqTD1u7auxKJdf9h7d/qB6bc0SwS8QAmjTiInJp7vd7xBnoL7GX6ic75seokbArpR6SQt1T5at7SY364kyLK2W9wDfsC+MyGiFXPSXertBIxlQNer6hXgUCwUz1cH++yM7VVIZ/YnE/rAs5NGeXosd91rteQIe9Ywf5hBBysUkVlw/HCbkrhJ5NSaGdXwMqMI1m6mCoG9hwZX3+4U05mYMxPV1eq/Ql9U6Nk6f4LYFTfsurba65n2z4PXPMzUPpjerEr4uitDKwFz2JdF9a/CDATtk6NaTFDxdtJbdrsuVHhiVdxGiiaDXexJWBkpjlm/FFJO7DD7bDcX7IX6wJ7mTE8Owh2FJ5w0fIeRiMcjE4C0GqKB35msRElP4PKUpJl0LAhFAZPb2Cgl5D0MORdOtBMxOjNTICvj9gG2IA6T8un/dU5a6S9WRHJMLHgtoyiowu8CsNi623gw+co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xawu9+icd7xp1vFQ5DeCNmkvnS7IZp8eL/LAou1mSaWnYB6Q7bxZtxNi3NTa?=
 =?us-ascii?Q?ItOw4A5/rfy1kNRVKVpSPmR+WCtA6/98KLC7JljjpYlHiPMXBUgx86dTwA3L?=
 =?us-ascii?Q?TEbkJTIHbgZqdxqLqk55Bu5GNd8VXOTo57q5ijzBPu8j+hHpq2GOnVZo61to?=
 =?us-ascii?Q?xtyONwDyDOMWIWUEJTiRT/4eNh9QMCUI46Q9gpItkLocE0Qy45GPW30VmaZj?=
 =?us-ascii?Q?VA9kcEyUgVUprK9cyJENRW4jtqwyIwO4XuHMmCGVJmAGc2WP22a6jZDSNGLN?=
 =?us-ascii?Q?zfW8mu3ZD3kdyHueH9dYT4GVph9JyrfYBShuSPEY9gVi2tzeX3Q60fUv0hFJ?=
 =?us-ascii?Q?V3V7NAhhCVMBQ6rTkaRIGxpHk7/1eS0PbvXg7T1I4HS1m5S+QbYag4qtIUAj?=
 =?us-ascii?Q?jHXzU0CHfrrrNC2BGHbu68uvAtMWGz4K0HmxzFLW/oWy+/eipC6VGM1FYJzh?=
 =?us-ascii?Q?F93DtjjVOcGtP3KhxKR1XmrraXFnF5o3pmW0y6AgTA2M1GoMo3m+lLZh9ndX?=
 =?us-ascii?Q?WK6+pmocXVxDq63BU5fGhguERxuukQnl6YwR9g+mcSLOnQ9Hcd05neG2A93x?=
 =?us-ascii?Q?fZmjmrHYY31he2whhnr5Vw/f133XZ/IMF2mBUR+ASTaNQLJvna30wyGKot1O?=
 =?us-ascii?Q?19Eve9b7XNtqmBCYfKGJFBzbmxAqycke0byr2TnWYwg4gWKwrjWYvaUFCKOp?=
 =?us-ascii?Q?M+BWFlfJ4xEZmTtRG8CTNQiz0YiJW371gzRm4npnHE+dn7d54gdvi4Zn+0Bh?=
 =?us-ascii?Q?h1kvpJ8C2w5YoTp0ulfLbZPWsxmwwUVkZJ9hHBQyINKC27mBIUblT0sx3pTz?=
 =?us-ascii?Q?aYpWoGJzURaYBCafCc4h8RzoS6F1cbmh2AfwBtOgcs8UUZK5Hhdg1E0DUM0A?=
 =?us-ascii?Q?aiizWu09MHvTLQW50Y9+fzvNgClHUtm6HEs0Gr/5xlWOiUkzE2gRm/LwjYWQ?=
 =?us-ascii?Q?T1NGS5l+2PK+c89r7lBzXgN3njxPqissXxE6nPABQLfDPs/hx7UFTR4bCG+M?=
 =?us-ascii?Q?BJAVCSiFWzcqGts/+ncdXv/4AeznS+I4b40FSq4lmcKkyasdL99ogqcCYKck?=
 =?us-ascii?Q?5NSnl8/OV4LoxjrqcScxbxyvYOJKh2TrDGp/f+SBqkcDUkrnOmsBvdvoDQmT?=
 =?us-ascii?Q?Xi9jO2XChaBCprTAvRmq0TnmUyfXNBQH2IpM8Q72/Ukq8YDi99ztmOr96QGc?=
 =?us-ascii?Q?fRiklz/ppo8aGruaai2OHjB2r3PLnnrLXyW3hJK8zG3iRH6gB6UDcPdBYKQU?=
 =?us-ascii?Q?e7vZk36WcGOvlWwy+gYbydI1iq4ntZRq+0GV9gjkO6XFblbOUW0M2saxsOit?=
 =?us-ascii?Q?K8JcIvMOsODHlilDihXm8oPlTWb2j8MdYSc4z6QMeZQ1eR91eBbaPrSR6wF9?=
 =?us-ascii?Q?U0exy0CfZeVDrRKMN3IbolBCeuENFXhPQ87pMmR9OwfVxwK2/w310k/e5eSl?=
 =?us-ascii?Q?FlL9sDhBibjDG5dGfSHLAjf7jlKTmOvyFOJKKLPVGCQ4xi2rOEGvTQ8X5CBC?=
 =?us-ascii?Q?KIFZNPIxQA/W9fifVp7BisSswj1i/fDWBsUSs0Otnek/fhde9gEcgsBXB6aH?=
 =?us-ascii?Q?6L3r5XUYXr9KQRAJx40QPw/iKm2g/qpkDEpbFYKKsIYyCghsH/o7iVf1Y3Kp?=
 =?us-ascii?Q?mI+F4NJ7VfV4aQuY4BnnYisgLWmi023J3B5IQGwNl5YTrz67yjIJJPPxs6+Z?=
 =?us-ascii?Q?OmonXLEAxQ35aDhMR5h3fzySQqMJARmOnnA5OYOLsSx5QELaHi/L7JxoC7Ng?=
 =?us-ascii?Q?zzaEvrXH/l5YLzjzNuwX9j+uPWXy/kI=3D?=
X-Exchange-RoutingPolicyChecked: jsHRLWiyUBtxoyZ4PwyHoV81BSE1KkE5lALzvpQdZdjSN8gOecYqgBpb2ZBk4OKhGmNnPBr2BKBI6miEHrNnotPwEP2IEVC5y1v44sdgjZPK55dYeg+c2TczLZrYXPFnswByTD2F7T+GBwoZuiux5rvYAHsOmVvh4bwUWx8wYCZvlD58kOhDnib4K3Ry+A8nPDLoHvIg65V5L68gYpKTKLEwee+q4tVrNaxVQvHL0ujh2NMw694BVhedG2RK4k698UXkhiuQ/89JuFgGqKHy12J7dQsaZO0gu2aGBbuOqAcF0mT2pr72bplqAQT/NUTYhyewdd+O14X1F+b8JNZekw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fdde8b-c2c6-41dd-d192-08df1e58cb27
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:38:02.9067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgUOr0rc4aB0jHs9d1wCdeaxmd5Gh65L3DLhpdsXqZT9xDlYy/HzOevJxS37rcMMGdpAN8sU6mEWAhujrIDvNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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

On Tue, Sep 29, 2026 at 10:48:24PM +0530, Badal Nilawar wrote:
> Expose a read-only sysfs attribute, device_uid, that reports the
> GPU SoC's unique identifier.
> 
> Bspec: 53048, 53049
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>   - add has flag instead of platform check to determin uid support (Anshuman)
>   - Fix the DOC: section (Michal)
>   - %s/_uuid/uid (Joonas)
> v3:
>   - Restrict device_uid to admin users (Sashiko/Joonas)
>   - Address review comments (Michal)
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>  drivers/gpu/drm/xe/xe_device.c                |  9 +++++
>  drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |  5 +++
>  drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>  7 files changed, 65 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> new file mode 100644
> index 000000000000..4dc4afc3961d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/pci/drivers/xe/.../device_uid
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Unique 64-bit identifier of the GPU SoC device, exposed as
> +		hexadecimal value.
> +
> +		This sysfs file is present only on supported Intel Xe platforms.
> +		Accessible only to users with administrative privileges.
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ef4746b7b5d3..437485b5a0af 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,8 @@
>  #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>  #define   TILE_COUNT				REG_GENMASK(15, 8)
>  
> +#define CRI_DEVICE_UID				XE_REG(0x102008)
> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 44975e7823be..e1979bbcf7bc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -672,6 +672,7 @@ static void vf_update_device_info(struct xe_device *xe)
>  	xe->info.skip_guc_pc = 1;
>  	xe->info.skip_pcode = 1;
>  	xe->info.has_drm_ras = false;
> +	xe->info.has_device_uid = false;
>  }
>  
>  static int xe_device_vram_alloc(struct xe_device *xe)
> @@ -872,6 +873,12 @@ static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>  }
>  #endif
>  
> +static void xe_uid_probe(struct xe_device *xe)
> +{
> +	if (xe->info.has_device_uid)
> +		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);

for a moment I thought it was inverted, but looking spec and this function again
it looks right.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon


> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -879,6 +886,8 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> +	xe_uid_probe(xe);
> +
>  	xe_pat_init_early(xe);
>  
>  	err = xe_sriov_init(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..18783a286a83 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>  	.attrs = auto_link_downgrade_attrs,
>  };
>  
> +/**
> + * DOC: Device Unique ID
> + *
> + * On supported platforms, Xe driver exposes a unique 64-bit GPU SOC
> + * device identifier through the 'device_uid' sysfs entry.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu for the ABI
> + * specification.
> + */
> +
> +static ssize_t
> +device_uid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "0x%016llx\n", xe->device_uid);
> +}
> +static DEVICE_ATTR_ADMIN_RO(device_uid);
> +
> +static struct attribute *device_uid_attrs[] = {
> +	&dev_attr_device_uid.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group device_uid_attr_group = {
> +	.attrs = device_uid_attrs,
> +};
> +
>  int xe_device_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
>  
> +	if (xe->info.has_device_uid) {
> +		ret = devm_device_add_group(dev, &device_uid_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index cd9ed8ff2940..41f703a87916 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -179,6 +179,8 @@ struct xe_device {
>  		u8 has_cached_pt:1;
>  		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>  		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
> +		u8 has_device_uid:1;
>  		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
> @@ -265,6 +267,9 @@ struct xe_device {
>  		bool oob_initialized;
>  	} wa_active;
>  
> +	/** @device_uid: unique 64-bit GPU SOC identifier */
> +	u64 device_uid;
> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 28f37e034e02..032a08fe41e6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -472,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
>  	PLATFORM(CRESCENTISLAND),
>  	.dma_mask_size = 52,
>  	.has_display = false,
> +	.has_device_uid = true,
>  	.has_drm_ras = true,
>  	.has_flat_ccs = false,
>  	.has_gsc_nvm = 1,
> @@ -793,6 +794,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
> +	xe->info.has_device_uid = desc->has_device_uid;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
>  	xe->info.has_fan_control = desc->has_fan_control;
>  	/* runtime fusing may force flat_ccs to disabled later */
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 71068cdb3558..448bbe5ba1d7 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -40,6 +40,7 @@ struct xe_device_desc {
>  
>  	u8 has_cached_pt:1;
>  	u8 has_display:1;
> +	u8 has_device_uid:1;
>  	u8 has_drm_ras:1;
>  	u8 has_fan_control:1;
>  	u8 has_flat_ccs:1;
> -- 
> 2.54.0
> 
