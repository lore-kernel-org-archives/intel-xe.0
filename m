Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2BCF4BB93
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4910E335;
	Tue, 24 Feb 2026 22:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnNkaUXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2326D10E332
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771970755; x=1803506755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nBopxFdCugrX2NxsjOHWGJ0qKRhSMRBOeXgLF0nI+hQ=;
 b=jnNkaUXd+5dg1btuoFXOlBskORg6cB7fYzvyKiLbWO4hHglhr7Bcxn8C
 YbwQPuX2GFQveGtSjN8rbTMmLMzXSNR/m2swoAHZUsr7BcyfdLvZYEjYJ
 nNK8Kl2g1rXr4iFnCdZCpnN+E28lyNNefqVRMXoT8pDCPVy35x8AZarSU
 j8DLGznhRY4IwWzzSUHYE3JjKrukfZQr5JjmdFSza+vXCOJYLAmUOiffN
 T6E8OInqRp7faQLKvzRlgoCUm320Oasab1kx+US7il+1rIGDgSYdYYamX
 VEO3mnQ/ZhLzyi0FF7tzjF7GzoXW+/RSzj8PCPpG0erL/Y7WIr5ctcdoR A==;
X-CSE-ConnectionGUID: PIa78kWKTumuOQX5DDWJ0w==
X-CSE-MsgGUID: 8VnJkW7RQZCN7zbRWSWjdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76834520"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76834520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:05:54 -0800
X-CSE-ConnectionGUID: OpaFoVXOQSKuipK4i5+7Qw==
X-CSE-MsgGUID: whUrVEJtTD6m5sgwX+Ti6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="221032770"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:05:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:05:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 14:05:55 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:05:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuZ3b31z4e6yNKUUFFuKtCGmiGAbIRlsWPgWhFc3BzLAsEtcKJLyVwVdE+tswLnDKBg4+SeNIDFme/+GaAhQdANYnOAn7+MMBNA+NgoTP7dxJWtGcrZVDXi2t98VSr7FYs74Ajrjh0XSHcRqd0kh8JXQ9YvFdi9CZNQmY1HTnuxCzy47gZ/UWS/VYp/YRqRfYnjKroANF9v7lywUc3gpbTj2HU494skHF5HXYwr7RBsjFY7TLOsQ2LqGBR2ckvH2tkYD2OM5qP1IOAXXpoIzSwGNIH0Imig3QP5aSUdpf1wb0NCfmjumGw3AxAcIXE12XqQeWsQoCphWImlrPKxInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnHLUr2PIaWNA/9LDNwtD1zRsGtcAWAuTtLbbiTKqhg=;
 b=uD0G4cMQf7FZd8CiwgQAm9MNY91QONMIvPIizQbzRfKFQ8pjEyMyoWAGruB2mEhDZPjPo3RS6zquYLb78MRNTQBm3QUvJo6AUIv2riekkoXJJjjkVeRb2QlXw/+JPE7nZOVKRo19EErhKxVDcDs+uMQhORZa2ELPUrgZifOF/EdbRywBy0sOKWdF0YaX0oADQA1+OJuumBpNw7/rWy3L6PlMiAPWBnv7IsMnDyWGejjrzbzhJ7cor6oM8CDuRCuSb2NlrO3fszK31jB7dPvCP+PVi7MfpzsvoGdi8lKPjR5miEzYdpGToDWgFVkIzhk3ScKXeFizytgJcukpBBQwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:05:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:05:50 +0000
Date: Tue, 24 Feb 2026 14:05:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3] drm/xe: restrict multi-lrc to VCS/VECS engines
Message-ID: <20260224220548.GL4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224023354.182306-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260224023354.182306-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fce2cbb-d08e-4bd4-8488-08de73f0df02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Try8FSqp0229QIstA5qny0d55G9M3Hb3SfGlS+PAz4ei3sm/hXKPYBLgJjPX?=
 =?us-ascii?Q?4MIu3xngmLim4633JgkGUC+QedEUKm4UXe8eiTS0sbwiaL7d5jJ4FHmmIFSv?=
 =?us-ascii?Q?aFm+HE1rnAvZyuzake0iUntCsK9fQZ/uno+/LxmW/1vwVwX2xmpIKB8sM6rx?=
 =?us-ascii?Q?Bc/yzgbyqW0j6Z3iW5PJQKZd72QZ5G8MSnbnaoZl+Z+k+wVKGQFgtQiMT8CK?=
 =?us-ascii?Q?g5mAMwmHpGkJ29W2sDV9wG31XO91ys14G1miCJTCCrJZ33ir+sLPZxqbsoJI?=
 =?us-ascii?Q?gtrDhwAzM20Ch1qRryX5Xz0Pid/xAMzd6nyTtmLrcExjYK6ckkL/COaa1yB2?=
 =?us-ascii?Q?qzxPzYcM1is02GSfBEalnDCatj6K/yjYnDOa6YcayMCpitjifxihIIa8gslj?=
 =?us-ascii?Q?VhzArNtLKp43s7mhLFXTw80HMQodIy/6wj5U6lnGLnUXb9jszzWMD8i+nfUO?=
 =?us-ascii?Q?RjlQW8nSqFXBrv2TDSud2SEqa04wnAp8Rvis1QBHRFv1l2/1oamRSCNcbiwE?=
 =?us-ascii?Q?Z7mrJCRkeVb0JhkK+SZPhUoxbo3DSgpxmz6qZeNJc18KAO/5O6ZknGCLFDvv?=
 =?us-ascii?Q?iJFhSgaJkZ9SPeSc5EdIhfPlNJ6rL1GOEKK7Zb5JJCKibxdbobLoJEGuTUfM?=
 =?us-ascii?Q?ginBWLMihSrfQPsARSt7cZiWjDFx+qDE0zzqtuPFHx6vwUFQnr/puuBu/x3M?=
 =?us-ascii?Q?lSvHHfTrYOD1GpOHYEAPBHleDrG9mldg1qQpgYxBSvs8VYpuJ71cdvCwSLwP?=
 =?us-ascii?Q?7CyVmRfz5MdCrwuSyx270AlGnQeNultQk5xzVd8zGAcIAR7B/9Gi4Vce4LD/?=
 =?us-ascii?Q?t6AoMMGmGS/ChFQybdXbpT2Q1ZgLt/n3Dvu3Vg9AG7VoM4XZFwSrZhNmrCL5?=
 =?us-ascii?Q?iOnNL8RDtR4HEoSyZ5r76famjaWXufwbQYB6HILs0KMYj0iwcQetTxKumKvL?=
 =?us-ascii?Q?4BPjkWS8HhKP7GGk9b1RPPpQ1DlF2lKuj8dEBg+O4GbWefybYxS3WyBXgMeH?=
 =?us-ascii?Q?/e0IbLOF9Mji3Q6kjx7ICusJQPvX/GdqM2cPaG0eCC3whsjSlo//YGsJj58j?=
 =?us-ascii?Q?QDVPe0UzRAlI6aKYoY0uPU/IVQRO+qZ+oSlKCVH96ZZ6UIcmoEghxlbWi7zm?=
 =?us-ascii?Q?eyg1+JdqTPEd8rAOOXwf34ugeoezSlqg+fpE5trZTf2zIp/qq+u/0f2UOqbY?=
 =?us-ascii?Q?ZB+rp+umLPiwGBFbcp4xeRF/a2fQbpAkiY1dW66t0gTFwwm+FsB4ClYDm76k?=
 =?us-ascii?Q?SyQQdKtOevx6nZcsSXIliId981QenJIVFCs2VhiBQ4cfGFBz4vCGEx0rIbIi?=
 =?us-ascii?Q?A9C2rTHj9Ha8pAd8sbkKx/aD6QGGg6fK70pZG3E04s6neKJ2v9au4ROl3D31?=
 =?us-ascii?Q?f7a9LWowg5TlLXyQ0cazbibH9ultJatI93AEa5JdA5soidzW1D5pP/e1XB2L?=
 =?us-ascii?Q?bQQjN1RYiRZ+KVB2GYH5hshf/QsVNTxBLmHWostgJyz8T014weJzBXFT7wbZ?=
 =?us-ascii?Q?luHyZo35nh9HkgEvJyclszvE748Fu8/RGGB0mkazAUWGyou09KbeH6Rd6ZuU?=
 =?us-ascii?Q?RqeurjYC+ATmg56sb+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSKx5WlYi4Prc53wzsEq3XV3ZJlXn3coaOudEaV7IR1CruSeGq2/d9jmVejU?=
 =?us-ascii?Q?QvORisxuA5cVJzhkVy/86KwNG7D96pzMwcaLlX4dG6WeBbD87GnqLNIoF7Hv?=
 =?us-ascii?Q?r5XF5bKFMivd1g3gvgA21N0DUctpv/MPUBt8N4flJWZC8LuK7LIkNC0puh+T?=
 =?us-ascii?Q?IBgDeA1yz8SWjJI/T3YMcZ5J3N+uoewdAc3jzDuxkFQp4nd6LanWIcufRA2d?=
 =?us-ascii?Q?Z3Mr8jPE0xEJ6NcdFOfP6OMDUIPxqt/wThmr5aI5wa644WaSl9Ge0rt9JhPW?=
 =?us-ascii?Q?LxeVvYOtYAv97pfsfGUFW+hp5D5WHaNn2/WZX7GmsAhB4UvdTRbbQZ2HcBux?=
 =?us-ascii?Q?7KbaNIpMAimpIsB8rZUzCmvzL+RceUY5DGe/wVzx2kQh4mPsniBneLhNi+8I?=
 =?us-ascii?Q?QGSwBVvCFQMpqvx0kMBPamNT8ZAkctftMaFVuH8LiBkfpEKxvgCoaj0eoOzk?=
 =?us-ascii?Q?AYzBiAOu+FkiaMWjun2aBZwixO8gM3QLahbQR4H3pzwSfM9QRzHExOfkhweU?=
 =?us-ascii?Q?WZd+gjC/u11XiE5hOu1Z4phMGp4ZJjb42HsJ96VPLkMCM4QiKgNDiSNI7voz?=
 =?us-ascii?Q?av7nUYPvSWVnaboFwa3wPACLUtk2z6E41Sum6+MYC4pNNCFm7F4VcTizHpBx?=
 =?us-ascii?Q?YWsysG7bjn/d3AnaX8IPypbm2RzTTAFwuwDA61DcucQffoW9Wuc2OMd1ZJ0G?=
 =?us-ascii?Q?nSlN7M3GY9l3CrA32poop/fu7O+vMnX5AbxQIN2EhtnDGbaXpg5CHjeFeGa7?=
 =?us-ascii?Q?3ASuzEyhfoHxHX3hAtkjC66njlWOUtgUqoYzeR30RCt4oy5JLHSHxZo5lGCR?=
 =?us-ascii?Q?KxSy+/ZpDv+nvVHvIYhvm5yJyAPEC/MNN2/LRvcVLuhiXoFFjff+uM1S3m/g?=
 =?us-ascii?Q?cSPQlr3j9z5ntALTdi50Z+1Eq7GvwzFuBfatn9LCsF0X0W/xJ6ijW9zacbUj?=
 =?us-ascii?Q?skxcEvaxN1aRtxUIgK1aV8oXuaYBHbUimWTbygOCntV3DPOTKwqILjtg9/g6?=
 =?us-ascii?Q?2K6/SRBhWLCNt0uPjLVwjoZtRaoT2GgHE1mhzBrBEbf1f2opwfyZVL0Lks9U?=
 =?us-ascii?Q?wzCSaYn3vV85Vz8W+WM5ehaWUvSLNKqypnAWwODoW5ZVDi4M4W13Y8b7F7bo?=
 =?us-ascii?Q?kSOqia0AiPx8Py/9/ITiYGjXhIXE7voMAtflbK0UikllD3zXfszucBhy3D82?=
 =?us-ascii?Q?3HEEZEXRUs/EsFhse/ZkUy5ayMFd94tEP2m9rJ3TC2ikahg+IiIU2l5ZfqqG?=
 =?us-ascii?Q?fWj4zo5XfbN4Sy0Ep2IzYsPc+DgT/t3R1uzOMapNDwwPvecsZLZjUMdhOckt?=
 =?us-ascii?Q?Uiu68zgMMNvuYePltzcAV7W/UY406SrZDLWbQOXUlLkQDOZNcqh62raNTUT7?=
 =?us-ascii?Q?DLsW/qqkL3Y888fUEWBoG5LrAH4KkgBYVMgx/z0Mqy98S6Rlqfs7GK5A5poW?=
 =?us-ascii?Q?fHZntmfpvLTPOngKrgXXWHThwDjY2e3TzkIwRuEfyEgD9YBx5bSmkm0C+p6B?=
 =?us-ascii?Q?6nNP3q8y6JU7ifg300oH4mjhjDBoWpnGwSY/Xo3oumtrwzN2t+ng+DOa2vfw?=
 =?us-ascii?Q?ZOAa5i74UFE+qv6o4nawRJsWOeK4y28uFFPuPJ/xq/PB5tNGKro4ybPs+z4Y?=
 =?us-ascii?Q?GZh4SwQTxtEE1RoXvR3WADE8XIfRBd8ugSqZz1/YXOehdrv2eRExmyugZdTI?=
 =?us-ascii?Q?DZOaM06brrbYlwwrW2U98Li0H2T2/41ZcCsMiSJtHvTDUSn5HylxZ9C2/lA1?=
 =?us-ascii?Q?fAWZhOtwOZd7Dl6fVTuwERwDAVGygaY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fce2cbb-d08e-4bd4-8488-08de73f0df02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:05:50.6703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoNccokbjCxrhBqitc2LnOSiYuLMfqIobCCwCjpnEYOhBpu21aHJ0edafG3gbWlqqM2sgVYg+ATRYrEK+occV+DbtzSslarDePShzIJMWFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
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

On Mon, Feb 23, 2026 at 06:33:54PM -0800, Xin Wang wrote:
> Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
> VIDEO_ENHANCE engines only. This check should have been in place from the
> start, as the driver typically avoids allowing uapi cases that we have
> no userspace consumer for.
> 
> Additionally, the GuC firmware on ModSched platforms no longer supports
> multi-lrc on non-media engines.
> 
> V3:
>  - store a multi-lrc enable class mask in xe->info and populate from
>    xe_device_desc in xe_pci.c (Matthew Brost)
> 
> V2:
>  - correct the typo (Shuicheng)
>  - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
>  - remove the graphics version check (Matt Roper)
>  - input more details in the commit info (Matt Roper)
> 
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
>  drivers/gpu/drm/xe/xe_pci.c          | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  4 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f3ef836541e..caa8f34a6744 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -138,6 +138,8 @@ struct xe_device {
>  		u8 tile_count;
>  		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
>  		u8 max_gt_per_tile;
> +		/** @info.multi_lrc_mask: bitmask of engine classes which support multi-lrc */
> +		u8 multi_lrc_mask;
>  		/** @info.gt_count: Total number of GTs for entire device */
>  		u8 gt_count;
>  		/** @info.vm_max_level: Max VM level */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4..5abb29454d1f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (XE_IOCTL_DBG(xe, !hwe))
>  			return -EINVAL;
>  
> +		/* multi-lrc is only supported on select engine classes */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
> +				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
> +			return -EOPNOTSUPP;
> +
>  		vm = xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_DBG(xe, !vm))
>  			return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e1f569235d8a..fe63387d4077 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -194,6 +194,7 @@ static const struct xe_device_desc tgl_desc = {
>  	.has_llc = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),

Is there a reason why some platforms list both VCS + VECS but others
only list VCS?  The new .multi_lrc_mask is intended to restrict usage to
just the engine type(s) where we have a real userspace consumer, and for
now I'd expect that to be the same across all current platforms.  We
should double check whether the media driver is actively using this on
both media engine types or just one of them (I don't know off the top of
my head), and then set the mask accordingly.

An ioctl request for multi-LRC might also get rejected on a platform if
the engine fusing indicates that there aren't 2+ engines of the given
type, but that's an orthogonal check that's independent of the
multi_lrc_mask we're defining here.  Finding out how many engines
actually exist on a device is something that we can only find out at
runtime after reading the fuse registers for a specific device.


Matt

>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> @@ -208,6 +209,7 @@ static const struct xe_device_desc rkl_desc = {
>  	.has_display = true,
>  	.has_llc = true,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_s_desc = {
>  	.has_llc = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>  	.require_force_probe = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> @@ -246,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
>  	.has_llc = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>  	.require_force_probe = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> @@ -283,6 +287,7 @@ static const struct xe_device_desc dg1_desc = {
>  	.has_gsc_nvm = 1,
>  	.has_heci_gscfi = 1,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> @@ -313,6 +318,8 @@ static const struct xe_device_desc ats_m_desc = {
>  	.pre_gmdid_media_ip = &media_ip_xehpm,
>  	.dma_mask_size = 46,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> @@ -325,6 +332,8 @@ static const struct xe_device_desc dg2_desc = {
>  	.pre_gmdid_media_ip = &media_ip_xehpm,
>  	.dma_mask_size = 46,
>  	.max_gt_per_tile = 1,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> @@ -358,6 +367,7 @@ static const struct xe_device_desc mtl_desc = {
>  	.has_display = true,
>  	.has_pxp = true,
>  	.max_gt_per_tile = 2,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>  	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
> @@ -393,6 +403,8 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_soc_remapper_telem = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>  	.needs_scratch = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
> @@ -445,6 +457,8 @@ static const struct xe_device_desc cri_desc = {
>  	.has_soc_remapper_telem = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>  	.require_force_probe = true,
>  	.va_bits = 57,
>  	.vm_max_level = 4,
> @@ -459,6 +473,8 @@ static const struct xe_device_desc nvlp_desc = {
>  	.has_page_reclaim_hw_assist = true,
>  	.has_pre_prod_wa = true,
>  	.max_gt_per_tile = 2,
> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
> @@ -746,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_pcode = desc->skip_pcode;
>  	xe->info.needs_scratch = desc->needs_scratch;
>  	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> +	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
>  
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 470d31a1f0d6..47e8a1552c2b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -30,6 +30,7 @@ struct xe_device_desc {
>  	u8 dma_mask_size;
>  	u8 max_remote_tiles:2;
>  	u8 max_gt_per_tile:2;
> +	u8 multi_lrc_mask;
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
