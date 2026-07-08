Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C2AC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 19:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C984810E65E;
	Wed,  8 Jul 2026 19:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFWhwP1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42EF10E65E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783540149; x=1815076149;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+pHcR/yJjYN+z5lfNlOc//yOKp1nCUFpkHDu/fd+TLM=;
 b=GFWhwP1m+TQ+QxCG1iR9RfDtqy0upgruw7ImQ/EK/0bKpUW6wecGhSfH
 gALxe2qQHSKR1VpiB1PicOr6gB0bz2SgIdVULE5w6/kt/wwRY+uiBIO85
 GB3bpyi9MTq8btSdfwmAA+5UmjqjvFDCNnou5FwknkbO3xgVebzo6vGwR
 D5DLGoVvL541pk3myRf0rGGb/F6LfP9tf/1lrLjgnTSO8Z8PghsT2+JEx
 EvlplURqB/k4+VbxKayS8ZDNk0Qo3ZAnVY6AhWuzHQk2WfvKSUWxWzJC4
 qV40fa7Ko03Tggszj3hSnfUwkcQMKv9q7PbUyKofKIL5dCb0LcaKqWLzb A==;
X-CSE-ConnectionGUID: VAL3Q9YnSsOIESfUh1OU6A==
X-CSE-MsgGUID: vSPkQNhvTeOdm0VtZrCc+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101759658"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101759658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:49:08 -0700
X-CSE-ConnectionGUID: ik4qSLOhSUO/rxyVn9eTwQ==
X-CSE-MsgGUID: G83EVi3xSr25qvEnUTEcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="258250753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:49:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 12:49:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 12:49:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 12:49:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsoixycOGMmemwQVv6ID8IMWNCzuv4AA1d+mlcwfe9e0PLOT94UX4V6AQnBojTwgcfJx0G6ELLakO6ywVrvfIBgsgKM6HH9NDTpFABVF+L5dyz9vXOY924S6ohifTQUu6Ny3RS6mcKOZHzwz/B13fMr6FsCj/0L21+YQW8/I8uEXDNC5PA3mBJEfjOLCb84aiU5WiqT5omAEyCl1UtSsjw8ZajlvUbiwEhzm9IEWF41RjqhKXkkMRBfhzpwsvXXwtoNCQ1988ysX2Zve5mSfNDnnripnuhPO6BukRv5ZWVFzkc6tnRsUa9LvZnwZZMNEgLkXZd12pvbprwaS7gGsew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I+jMfM5WEpE67sU83bBNtdg+96yj/RAGeMW6udZA8I=;
 b=XvFE8eyaouCwCQmtUyT4MW5azXLYx+Vkkw4ZeDl21zsqO2xGPDfC5lniN84GZypoT36yfJVRYW2RJyebeS+ZywSy4UjfsKxAJHzkUOD4gLb/eBwh3KUOKn/efoYrDkpTLIYN/9c8egUuMqG8vhgwQMIaXy3wqpMxr3LeQAKnoBpmJbm6SS6NIPxUUCNcE+TzTTbHoAx0vZz9tiNyPounl3zmhKrZDuTS5cIqOSlpCw+Y5sSkq1kOdSHtkJJudA+PCYkPjqaTIRfyx6EPX2iUOI/QU3kyCWAynReqPLnXwnVzB0THxnIIV3Ex/azgqPqZJIJqAkTj9PcOoQD7MOyXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:49:02 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 19:49:02 +0000
Date: Wed, 8 Jul 2026 15:48:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v8 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <ak6pqsN18JAqB9kF@intel.com>
References: <20260708135110.4117174-3-soham.purkait@intel.com>
 <20260708135110.4117174-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260708135110.4117174-4-soham.purkait@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SN7PR11MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d2ace7-5102-4013-e938-08dedd29f59c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|3023799007|11063799006|18002099003|6133799003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: WKi1Ss/fxfI0o+ssmJbypRZrbBQ7G9MAOMFnNApfbWvPE0TCgvQCGO0L2dHYYOs50AAXUsMf034jvSO3ATI4lU44enr7rZPnhSqa3VKfX48JFI08M3HRULTHgMTcNzEP5SvVdZ57nseuzTEs5cmFE4n+llHoRoMTMbC4nArxUZDkXRl0/x84K9i4Blt/Q7Mh2ls6qJcFwNK2degukLKRyfoAy1jkCYiEhtI9YhVhG48JRIBsX9YAgoRkngVLzs4R7dcc0iTjfHD1/VIvX1DdZXIaDLPex+MT4NYSRwUy0GS4ePPeeri4WZ0TTHMnMaHKJ1vAbIVQVxMqWtctUAxBurB2PHVgw88bouHQeFTue54KGtzN9b+h7AQqfcp45a/NC1Q67u6Cf0uWcG2Wbrdx1gMZ33Z3qP786hUyarRTv5VXb385sT10Z/3kb1GziLPX6pJFdh+k5DArHAC3oWtsrqnJduZ16ABsdcgMFn4po7VyNZN91oLNXJaP561RYdkcXZMaW0cdlS/iNKQrwnLBXYETJjOcaTAPKuwRYfjifUiMeAw+UXjBw69dRdiPHemGIUTzMdDsMRf//phdzyw0tMcIfjeBxGkAt3QVeQYSBFJLrpfdszAYHWFS5EDq7P84obEBpUwNqD8dK7aRrh2St1GJYamRQMSZyVI36sFYNYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(3023799007)(11063799006)(18002099003)(6133799003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXzHd1McJiTGvXr/EnnLcxz1RalIjwwDcRQu0S/6ydVbCVu2ypNXnDpFnX8u?=
 =?us-ascii?Q?vtxxxfPY+5BN1b42ODuBVDt+xMoY+gWXU1VS1FjXRtgxHuuegjr6+25+Q2Z6?=
 =?us-ascii?Q?OPeXlVE8Ux5E+NC8M9/bONvlEorRpyXHSoV0AN9vtVKXlVBGdpbqW8H3jfhW?=
 =?us-ascii?Q?hPadBI6YpjpX2hG5WWAJoMM+4J/rJ5u/5zoj0/GFbF2GF4NTgETqjU+8Y2Bq?=
 =?us-ascii?Q?2Cs/wLfnH4/ctwb0aFlQ2+EDZE0qonC1oR24XtzD/g8Wdp3PvnTid5VrOxfl?=
 =?us-ascii?Q?fyPbs2J654fB7ZyYxs4kHiwS+28F27LMCiO9s/U29Ys/EdZHsoMSQ2w2JLt2?=
 =?us-ascii?Q?M/Ks+6BI9ary38SX+x7neiunJn39UeUNZDTJtYWKO/vPGeCPBMc0KHQYM3rW?=
 =?us-ascii?Q?6K5Lx/B85zuFEWSID31N5E8GW0GuO7ZOgAaynOxFZXhWq+VG+IO12P8tr65U?=
 =?us-ascii?Q?tQq2Ax7GxnC/WtplAJ3+srIT2FLp7xjTEv6WjcAZ1dmzHurKH9v5gmjjnTx5?=
 =?us-ascii?Q?bjwjG4JuAZ2Gao5C3CzTcn5vekjbEHsGHkjWnx/T4M4CnuCBKzhZTZIVyyZj?=
 =?us-ascii?Q?Z7jb+Leigj3s9ud3RljNonHHrXnOmVlt0V3vdHLz6k3n44BCnGXRG9v7uz0X?=
 =?us-ascii?Q?fBy2DCLB0IFkU8IED/KvL97JHm8/wllC70ejXW/uREBVSaby3lk+QUh8j59N?=
 =?us-ascii?Q?B8EbjJXl/0mgX2vRqyMBupPRf+w0bILsKerK6pTruJAUmQCyHRbSMy2InvnA?=
 =?us-ascii?Q?fL5aqO6DPoZtX6YKfs7qnfZTbFP5eY2LkRBA7Zp3gxKHY0k07pB81+17mHLH?=
 =?us-ascii?Q?9+Pg/M0mHYHWDA7ghsjNMEvEUS42Kr3aAoT2sImnH4HIjFpZbTqHyjhYhObp?=
 =?us-ascii?Q?wDoCYK8RQA8+MzJUA594y29oAwTaxlJ8bFNvshcT7ehRmRWu5zNQleMscCKF?=
 =?us-ascii?Q?NwlUq9uu3Dp71KPWPkAyZq1SPmuCMxIH3fCfRebVuwnTF0lwUYC4h+bUWnys?=
 =?us-ascii?Q?k1ekTQ/F08boxDteyV9kUBnvy2Uq+LuVZuY0Ntol4aNTZtIPgRL3pTK94Naa?=
 =?us-ascii?Q?g/OoeXRrohrRuoiMnKc3NAO15bXuhs7+nXPyuvYLtCzj4Q7Te6ICkBvDr8/d?=
 =?us-ascii?Q?uRsX+y93hLAjJsVVAFwbmWf63JSf0i++yRaxkim0v9pTJ6/fq7fZQSc/cNc5?=
 =?us-ascii?Q?lD9VLaliaTXN0u6IEFQr9UmNSOS1TBlAMHsxlIIGLeJfT2ipbi6D7hQAs5yl?=
 =?us-ascii?Q?AHKkBbLwfATGKZ5VkcwuZoojV7il5Mrl5enb6K5I8RcA2Us7aoiyu3mEBGYW?=
 =?us-ascii?Q?pG8mKMJLgh9WJZim+1j5J9CDIg2RgP6nEauCzuzAA7KgVu2VeObzum+s+ztA?=
 =?us-ascii?Q?PZmM5FzE3KrJCl5ZIUrsey1ivkHd8rdWM9TxaDPFnehLrYlQlaMebRTrpVpt?=
 =?us-ascii?Q?kwMndfBEvdQKvI1nJNzD6X/wKrESjGJx60NgOyfjE3fHuga9rhAOIo9CGx7K?=
 =?us-ascii?Q?OK5t1rRpYwPBIzJDcJBupEf0o/S8sM7og0q7wccHAmCXWyWqqSGDZKTfEYpj?=
 =?us-ascii?Q?HrSTEN9+ArCQT7T2ZBodRHWFO4zAsQP9XK0vk6KjO26mft8TTzRevZOTkUFY?=
 =?us-ascii?Q?r/goU/AQPvykwrMfOHux2y6AszVLrMSnLEwQWjQrwSc5cCtN4WXbf3uKa4GK?=
 =?us-ascii?Q?hKvlXjMtLQAv+PdCNSUu/TAzpB60gy0i//9q937J8Q44/phTpWuvcI08NaPl?=
 =?us-ascii?Q?iFaE/j5R0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: MGLWmvB9B+r8HK1Gk7ri3nOLjp4viSWk/QzsJy02nbbpJOal/8CNV81e2dRr2dIgr9g9ROFdYPNnAlCFtS+xvVdqOlNBwS9PTXxQJIU62Rvhmt8WW2upDQtxAPWollru/Lhi092n8woSBc24DVNTFw3VX58A4W7rItm7Sb0SM4/fURW6Xn0gbTMtLXFaRZc7ej/PnozVpARY6QAfmbL4OUuUUYbG+qAGMLOtOmWU40Oeuzv8qkpwb+Jo3VE6GbwriY7q4er4qpcptPtyHq01RBZmpf8hXa3LuA8vNXXumckG2u72iiiJCkudZ/vkU0/h8Bwtkb58TJYYHcZscC7gcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d2ace7-5102-4013-e938-08dedd29f59c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:49:01.9989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urc8dah3efqMNbHwb0nr97wfwFEQ+rpC/YG9CS50t52gn49Ck5hdEJFWAzQoey9eVZ2p5AFCGvGXIryNSW9Xkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6702
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

On Wed, Jul 08, 2026 at 07:21:12PM +0530, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
> 
> The interface is a single read/write file at the device level:
> 
>   $ cat /sys/.../device/gpu_health
>   ok
> 
>   $ echo critical > /sys/.../device/gpu_health
> 
>   $ cat /sys/.../device/gpu_health
>   critical
> 
> v1:
>  - Add enum for health status. (Andi, Rodrigo)
>  - Return error number instead of error message in _show/_store. (Andi)
>  - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>  - Return only the current health state for sysfs read. (Andi, Rodrigo)
>  - Add documentation for sysfs interface. (Andi, Rodrigo)
> 
> v2:
>  - Make logs and structures consistent with their counterparts. (Riana)
>  - Drop unnecessary variables. (Andi, Riana)
>  - Add correct KernelVersion. (Raag)
> 
> v3:
>  - Add missing blank line before #endif. (Badal)
> 
> v4:
>  - Add consistent "gpu" nomenclature to the gpu health indicator
>    DOC blocks. (Riana)
>  - Add Kdoc for gpu health indicator. (Anshuman)
> 
> v5:
>  - Rename struct fields to response.health, request.health. (Riana, Raag)
>  - Use devm_device_add_group instead of custom sysfs init/fini. (Raag)
>  - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
>    invalid-input log, and minor log/format cleanups. (Raag)
> 
> v6:
>  - Add updated ABI Date. (Raag)
>  - Rewrite DOC block with canonical path and cleaner wording. (Riana)
>  - Refactor enum name. (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

pushed to drm-xe-next

> ---
>  .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>  Documentation/gpu/xe/xe_device.rst            |   7 +
>  drivers/gpu/drm/xe/xe_ras.c                   | 147 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>  5 files changed, 245 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..9c4a713b8cdd
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		July 2026
> +KernelVersion:	7.2
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current gpu health state and allows the gpu
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that support
> +		the gpu health indicator interface for RAS. Reading the current
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values for
> +		the current gpu health state. Writing one of the valid values
> +		updates the current gpu health state.
> +
> +		The valid values for the gpu health state are:
> +
> +			ok
> +				The gpu is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The gpu is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The gpu is in a critical state and may not be
> +				operational.
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index 39a937b97cd3..d3a022362ade 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -8,3 +8,10 @@ Xe Device Wedging
>  
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>     :doc: Xe Device Wedging
> +
> +====================
> +GPU Health Indicator
> +====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
> +   :doc: GPU Health Indicator
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 74d5016d9ffe..5ae5cd5b3383 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
>  };
>  static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>  
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_OK]		= "ok",
> +	[XE_RAS_HEALTH_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_CRITICAL]	= "critical",
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
> +
>  static u8 drm_to_xe_ras_severity(u8 severity)
>  {
>  	switch (severity) {
> @@ -332,6 +339,140 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>  	return 0;
>  }
>  
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	const char *health;
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get health %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.health >= XE_RAS_HEALTH_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.health);
> +		return -EIO;
> +	}
> +
> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: get health: %s\n", health);
> +
> +	return sysfs_emit(buf, "%s\n", health);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	const char *health;
> +	size_t rlen;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.health = state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to set health %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: set health command failed with status %#x\n",
> +		       response.status);
> +		return ret;
> +	}
> +
> +	if (response.health >= XE_RAS_HEALTH_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.health);
> +		return -EIO;
> +	}
> +
> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: set health: %s\n", health);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static struct attribute *gpu_health_attrs[] = {
> +	&dev_attr_gpu_health.attr,
> +	NULL,
> +};
> +
> +/**
> + * DOC: GPU Health Indicator
> + *
> + * On Intel Xe platforms that support the gpu health indicator interface,
> + * the driver exposes this sysfs attribute for in-band access to the gpu
> + * health state::
> + *
> + *     /sys/bus/pci/devices/<device>/gpu_health
> + *
> + * Reading the attribute is available to all users and returns a single
> + * line containing the current gpu health state, whereas writing is
> + * restricted to administrative users and updates the state to one of the
> + * valid values.
> + *
> + * Management tools and administrators use this interface to query the
> + * current gpu health state (e.g. for telemetry/monitoring) and to
> + * update it - for example, to mark the gpu as ``warning`` or ``critical``
> + * after diagnostics, or reset it back to ``ok`` once remediated.
> + *
> + * The valid values for the gpu health state are:
> + *
> + * - ``ok``
> + *     The gpu is healthy and operating within normal parameters.
> + *
> + * - ``warning``
> + *     The gpu is experiencing minor issues but remains operational.
> + *
> + * - ``critical``
> + *     The gpu is in a critical state and may not be operational.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
> + * specification.
> + */
> +static const struct attribute_group gpu_health_group = {
> +	.attrs = gpu_health_attrs,
> +};
> +
>  /**
>   * xe_ras_init - Initialize Xe RAS
>   * @xe: xe device instance
> @@ -340,6 +481,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   */
>  void xe_ras_init(struct xe_device *xe)
>  {
> +	int ret;
> +
>  	if (!xe->info.has_drm_ras)
>  		return;
>  
> @@ -350,4 +493,8 @@ void xe_ras_init(struct xe_device *xe)
>  
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
> +
> +	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> +	if (ret)
> +		xe_err(xe, "Failed to initialize GPU health sysfs, err=%d\n", ret);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 6688e11f57a8..bbfaff8326cb 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>  
>  #define XE_RAS_NUM_COUNTERS			16
>  
> +/**
> + * enum xe_ras_health - gpu health values
> + *
> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still operational.
> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health {
> +	XE_RAS_HEALTH_OK = 0,
> +	XE_RAS_HEALTH_WARNING,
> +	XE_RAS_HEALTH_CRITICAL,
> +	XE_RAS_HEALTH_MAX
> +};
> +
>  /**
>   * struct xe_ras_error_common - Error fields that are common across all products
>   */
> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>  	/** @reserved1: Reserved for future use */
>  	u32 reserved1[3];
>  } __packed;
> +
> +/**
> + * struct xe_ras_get_health_request - Request structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_response {
> +	/** @health: gpu health, see &enum xe_ras_health */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for setting gpu health
> + */
> +struct xe_ras_set_health_request {
> +	/** @health: gpu health, see &enum xe_ras_health */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for setting gpu health
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> +	u32 status;
> +	/** @health: Resulting gpu health, see &enum xe_ras_health */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 6e3753554510..693c0ee592be 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>   * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>  	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>  };
>  
>  /**
> -- 
> 2.43.0
> 
