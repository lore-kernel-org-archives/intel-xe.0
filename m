Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73AD59F44
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 22:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A637D10E972;
	Fri, 12 Dec 2025 22:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0SeS3t7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED5210E971
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765576980; x=1797112980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ng1+xXGkCrt7+8SCJUeey9e0revokZwKH9SUMmSBtds=;
 b=n0SeS3t7+9JKIQBON3i/MdZWaVmSofnt1qStFpwqc2a3NC/voF2ro2IW
 zL2ro9vwAF4yEJSVrJqlCyyo1PTWs2ao3MTYm6qLNPkI6dKv3mGIzVUO6
 qMS+sJCH/FLnl9qcnKvH6IQukVytN7nlZJIoSjGFLU7rjs9/maLuGTQ95
 d4ILd3PZzlipmVwfSctopmYO9xEbQVFn+jV3RZGXpKTGvzKUZhVGqfCgW
 4+5Po97ms7EfQcKgyxSdmvRgZgfJFulJWZWOifDHs8wv6bzTXQB/2LLzj
 agZgavRUGH//4FF7doHkP/kDTjyVY5uGYnfjboema4hQ0c/JT49hh2CWZ g==;
X-CSE-ConnectionGUID: 3d3yb/GAQs+vCItBxotgqw==
X-CSE-MsgGUID: bl1/ZoRTTJqiucT4+quSnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67467881"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67467881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 14:03:00 -0800
X-CSE-ConnectionGUID: S798nYcdTmqGpIUnuDOPoQ==
X-CSE-MsgGUID: OzJm++27QEWDQYegqo891w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="196948975"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 14:03:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 14:02:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 14:02:49 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 14:01:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIvkYLCR5OaHDYgBF5N/GK9DYv1QaNQPl9qF4CrR0cIjMOyHaknpppFdJmbG8515y9UfPHVZFZ18fo2H5wgbO56rs8jarLx31CAHD3tm7jlLeK7cHdRM8fddZg9YtxMqBM78FFPBtEHhe/vRZT6Ap9tvdw2D3YHh2euQSHz2NkO4i5li2qSeuRKxhZVq+c7Y+YEwWAxVKHuvx14WXITTlnfST/6rZPt1DKrjPJUN6wQK3Uhf56KkeYuT7s66g/pNBj/nu85DRMloPx7PVshnhHBHhuVm1cfg+N3JUHnTvH1N1ynMxHZm3ynnLJsxYEQRukUekvDP5X2a0ofUJfkkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k3EBt9JR0hnbwpgMpZVvhSPP4InB4nB3pobmJ9O26s=;
 b=rig/xSWUSwBOG9Txs3TVrO2mnba7c/tS+H3qpRvwlcXO9FyLoLbFplDYc+E2jLYxJa3lcXTIlqqZ/jyQwVAfRjyIDqmFQmZ+OMSva8G1wKGI/rqQW5IgWhJXkIjVb2zcinocpytmIn2AGEJnGjJawQKhED6guIf8qy8BimYffTtJhiDF2hh2XIi3bR9nP+aHScD1H85MmWQgnHB4Dj++NR6SrwStcTvbxVj1Xah0/fgAQWgiDRpdAdrKVXk5Dw1IwYsoizmMxr8v9EeW/GB8SgNIvvyG8FLea6IVJlTplJp1WmuxN9+MVfSsXNUxaPoaorxUCQcVM6sZLNxnmukwvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 12 Dec
 2025 22:01:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 22:01:32 +0000
Date: Fri, 12 Dec 2025 14:01:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10] drm/xe/uc: Add stop on hardware initialization error
Message-ID: <aTyQubQC/OXInleX@lstrano-desk.jf.intel.com>
References: <20251205180642.4005099-1-zhanjun.dong@intel.com>
 <aTbLhN9UCZt29bMJ@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTbLhN9UCZt29bMJ@intel.com>
X-ClientProxiedBy: MW4PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:303:8f::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9f4506-a1e1-43d3-a5f7-08de39ca0277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t3L0C9K3QfY2XEqTrrUilNdtNg7i0X7jrDX+oS4gY29UiTY0i7l6Xka4YVdn?=
 =?us-ascii?Q?I946zRGTrtPWr2ciMWgMcDYVxjF+b9kD6BCOEDct656GbUrZ9nsYG9myZUO2?=
 =?us-ascii?Q?VDYUySGhjHvDHKrCUn+Zu+x4Zb+3JMVmj6OIomNKedgkBc4UK2nwJIcF0LbF?=
 =?us-ascii?Q?vuf4V5pwxNSji+ZX4dORMcJCCQi8tZ5IFdMYVmP57p4lC5vSi1VbvcOMkXC+?=
 =?us-ascii?Q?7YlC7wxGV2y4elK5b/+3ONGbXnH9W9QazrOR0cOT6mzEOGlc1xeeS1I3pTDD?=
 =?us-ascii?Q?uUoPsY0A43zjF1C5uGLUQDZ4WIZr00MdayyOht7cdKBeUwWclfuukoMRoB3a?=
 =?us-ascii?Q?UatK7eG+mzgwW0//s3SfRP3vNnWmzyZasl1OIFJtI3KtxsRwAGU4b8BBqBAI?=
 =?us-ascii?Q?YNxg3g+kzfiG3X1jbmCkbOMEgzaOwEfbTNHSu9Y5/p5CbYtLKNTE9kQU7bFd?=
 =?us-ascii?Q?0ASf3RDv7FQEz2zIQqf3gLSdl58mIxzYAyLnchbEpmvqnrrd53VKaV5KvDLm?=
 =?us-ascii?Q?8kQq7wIx6/MpfNddAdwcw6FmvDDmy4Wtxue1j8kYH/nvdo56MS2nOZVLLH7c?=
 =?us-ascii?Q?AK9aGMxgG6Obyns+j+t0YoWyg13Hpn7vXG3GlaJDpP6O5EFp2kjfcpc7FIhk?=
 =?us-ascii?Q?ZLkVO4o4H5V5C4iA5X2rByB20NZvF8UDBSWCccCqEKDPPWIu/6LNpU9iWv+z?=
 =?us-ascii?Q?bUq9KsOInTcu+vuCoNwEGDC9U+rGmJD4EI/4gqplYTSf8pDpAdzDtkVmoQE4?=
 =?us-ascii?Q?CYmz+Q5IGOtaOPx2BZlT1SGpWNoSs7/ej3/KYgFTBgh0czu9rrD+aXCtbEPE?=
 =?us-ascii?Q?0XYMxWG59jbk84NE95b/w0nIn2qUIjflac5vgw61Xo8ZWx9yBCttopXttcgu?=
 =?us-ascii?Q?OCP3WNeBqPVfLpPYA/M2jtArn6vxs/68itAtDEUHjPnUuYPPwyYJD76vFEr5?=
 =?us-ascii?Q?P0wDB6soWOXGSkyhdK4HQtsy2G2jN3jRhwsJ8hItzTGFFeqX6MVXpyeJd20M?=
 =?us-ascii?Q?dZNu2gLgQzMaSR5KdwQ1mx602d1v699EQOK4DjVDr63OslVRS4MuvuUek+14?=
 =?us-ascii?Q?aUMAR/f2+2Whe4j0DfcpTeU0tgicPv7KmNC+Pt2+qMTeZmJPtqChMLd6ZeDF?=
 =?us-ascii?Q?YxBfgpRn6V35vORxvTgvxuTjMksYrr4jmYMd2WnNei9Wtjsxrxe+lfbsdA5H?=
 =?us-ascii?Q?PFpHYGq9tRBo0dril8um3lKisIxB7sXsSiUNoYi6+kofgy08DTo7/ytt7T2Q?=
 =?us-ascii?Q?dMJY1vwurkANCnXJv8ROhO4vTeNTnv0XZn9SamL0LuTU63+xrt3pm4meLH41?=
 =?us-ascii?Q?NGzNnNxRvg9Y3FSLE/Y16q/4NCHXl3lb1/LhHIazyJObznSJcqgdr2UTYR/7?=
 =?us-ascii?Q?wyg1rXVmcHxeVodaq2OTk9lc5Gz100N1B2DCBpIHhOpV1z2AOgi+sHph4ffC?=
 =?us-ascii?Q?34jBGc5Hc+P9XGiwBcnbAPeBYkga7EP82D18NoZb9MZ3GcXV5rwcog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGUR1t47YSfTJ46s/JtKV1mB7aZjDQX4Cru3l+d/SiLSkFcAr05S6ljEYgvP?=
 =?us-ascii?Q?TZWFHe3UU+8zK7NbukCtCfRauYTvzNf+o+oyjTEFgL36uy0eqAPVlNOOw1BH?=
 =?us-ascii?Q?HCTyztonBtykyMRIz4wpEr2z/XsHKdCSIViK4ET1bmYhJs8s9CASl/Qj1jKp?=
 =?us-ascii?Q?+x78qa/TAeCn38I5a7zK93a9+FrdZbOKGxmUavLzeBZnSCKru77AfUtUrXne?=
 =?us-ascii?Q?HNtVN2ZcR+MAKZXV1Td2swglQyFms5vGwD4Bm7qfDqV5AxZHswV2PoKy+iOf?=
 =?us-ascii?Q?cbd6eYBOfIIngnHNfoGMiIhKhmjaTJiLFZ5jyhdBN5nRh65byeod0GeWJPN1?=
 =?us-ascii?Q?WFOIUz3cflAMaVN+sJQHJQoHbPu4cIIq7Atveows88bjVfgKR2+UiZAuTGoN?=
 =?us-ascii?Q?L88t2o3dAe8ku6RB0cLzjXwXX3i27e5s1oo6SZzJnWZ0bPmzUM5pV7mtzhzx?=
 =?us-ascii?Q?CORKDOmk5JG9nm7bMkrVNHP7N5BeakyTdZ0z0c3AhgiYtBAiX3xAhSw0AMvC?=
 =?us-ascii?Q?b/Ivj5pL04lB6ouI3lDfF6YD/2nHJyOJMln4RoVeK/rBqKmUsvVJQDXCFIxG?=
 =?us-ascii?Q?8As+SId02rOflQahRtuvmTEC7fl+gqKwG3MDjjloTli2Zl830GrGmw88qlbH?=
 =?us-ascii?Q?cm2PyiY2Y2TGJjCRnOsdxN+yBXbFiMbPZPn6gja+Yns670NErHxUacw0XAcR?=
 =?us-ascii?Q?nELOI5ksQsbU202kzWiYHAArfNdQcpt3dqHhemaQs3iJyL4NbPHp3eOykuuf?=
 =?us-ascii?Q?qse+bZGPxjWfMmKTVz2XzD0L4fQCBQAYeVRGDT5jh2h7jWeEotAUbwP3w09h?=
 =?us-ascii?Q?rJZXOZwacKYbT4zamFaGk+3EZ67IKr8O+k8jXUPPLZerXz0UhQj96KfChmsB?=
 =?us-ascii?Q?ARWjUtP5QE2G6VcAz4shQ9FEMDHYS83AZPbiSJCJpm6Xoxb8Ps9NOhsRe8ch?=
 =?us-ascii?Q?aJAftmPPEwqk0iExLdWIga7Au7wiOXvEjX2o2UFusQYtLiXQwH9EJv5SnIyQ?=
 =?us-ascii?Q?ywhJD/MQLjNnbZS5YK/RQhL36BTc9AEOX1GaIZClC5lU5rh4DpIJWjm5hCVx?=
 =?us-ascii?Q?kaJrmuCOW8hYLZ3RDTX8GMiKd+fNemR1eZdb5R0BWn+zy8HMwek3zOiVWidb?=
 =?us-ascii?Q?v4CpADFfqOMJK05KBqFVSKxDC2m1F7lQLOalhoBZegZPl9WPbFp3zsnmDg6J?=
 =?us-ascii?Q?yhGTLf9l6+/yRXzwRqdWr75rajrtUaXyvzt2gI0byjQuiMzgvDktHGDboTwh?=
 =?us-ascii?Q?CtWTQhPg5VSTasA9ES22PLgJ4jaWDjWxbpWjegsVE1hAL37LDTofBcvWbPFx?=
 =?us-ascii?Q?e0OQEBWfX7ACBhAHJGuwBkMKlElHC50OfvtVdmeQ/KqYaWU1vE9nIsrLr1dd?=
 =?us-ascii?Q?y2Bam9sdm7ZCf1yfeu2d5R3W0WghCqLxcedGrH6zjiUbME9m8QfbqjbemUoO?=
 =?us-ascii?Q?bjUH1qlcFYwYeopkrdwlVvIj+QKoX4tvXvEEKVJlkR1eSlViiQq6waz/CRsV?=
 =?us-ascii?Q?6TKIIyLYK+o5kzhBUzgMjUUacUqNvm0mTVj2kwRP+/Ud/k2vXrDJmWD9nOnD?=
 =?us-ascii?Q?m2lB2lXEIaCbFRICVNqWMP3z1PPNGSy7TsRSZi/h/jXtZFsnpN0x2djHDg8i?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9f4506-a1e1-43d3-a5f7-08de39ca0277
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 22:01:32.3661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjz5c73f02+BMkRShNEQmhslrB0+kCPf2im5UtFExMJbVCvipuUSVd2ZtHeAIql7hES5U1ArBqoylvGKsmOlvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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

On Mon, Dec 08, 2025 at 07:58:44AM -0500, Rodrigo Vivi wrote:
> On Fri, Dec 05, 2025 at 01:06:42PM -0500, Zhanjun Dong wrote:
> > On hardware init fail, the hardware might no longer response, add uc stop
> > to clean up. At driver unload, all exec_queue items need to be freeed,
> > change xe_guc_submit_pause_abort to free all contexts.
> > 
> > This will fix memory leak issue like:
> > [  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 + 00007000]: inserted at
> >                 drm_mm_insert_node_in_range+0x2c0/0x510
> >                 __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
> >                 xe_ggtt_insert_bo+0x1a/0x30 [xe]
> >                 __xe_bo_create_locked+0x1f3/0x930 [xe]
> >                 xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
> >                 xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
> >                 xe_bo_create_pin_map_novm+0x23/0x40 [xe]
> >                 xe_lrc_create+0x1e4/0x17c0 [xe]
> >                 xe_exec_queue_create+0x38a/0x6a0 [xe]
> >                 xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
> >                 xe_uc_load_hw+0xa2/0x290 [xe]
> >                 xe_gt_init+0x357/0xab0 [xe]
> >                 xe_device_probe+0x403/0xa30 [xe]
> >                 xe_pci_probe+0x39a/0x610 [xe]
> >                 local_pci_probe+0x47/0xb0
> >                 pci_device_probe+0xf3/0x260
> >                 really_probe+0xf1/0x3b0
> >                 __driver_probe_device+0x8c/0x180
> >                 device_driver_attach+0x57/0xd0
> >                 bind_store+0x77/0xd0
> >                 drv_attr_store+0x24/0x50
> >                 sysfs_kf_write+0x4d/0x80
> >                 kernfs_fop_write_iter+0x188/0x240
> >                 vfs_write+0x280/0x540
> >                 ksys_write+0x6f/0xf0
> >                 __x64_sys_write+0x19/0x30
> >                 x64_sys_call+0x2171/0x25a0
> >                 do_syscall_64+0x93/0xb80
> >                 entry_SYSCALL_64_after_hwframe+0x7
> > and:
> > [  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID manager unclean (1/65535)
> > [  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1: 	total 65535
> > [  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1: 	used 1
> > [  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1: 	range 2..2 (1)
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > ---
> > v10:Add submit initialized helper function (Matthew)
> >     Call xe_uc_reset_prepare rather than set flag directly (Matthew)
> > v9: Rebase and keep xe_guc_submit_pause_abort name unchanged
> > v8: Fix __mutex_lock warning
> > v7: Clear all queue items by guc_submit_fini/xe_guc_submit_pause_abort (Matthew)
> > v6: As huc not involved in vf_uc_load_hw, roll back to guc sanitize
> > v5: Move stop flag set in guc_fini_hw
> >     Change to uc_sanitize in uc init path
> > v4: Add memory leak fix
> >     Switch to xe_uc_stop
> > v3: Switch to xe_guc_stop
> > v2: Switch to xe_guc_ct_stop
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c        |  6 ++++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
> >  drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
> >  drivers/gpu/drm/xe/xe_uc.c         |  8 ++++++--
> >  4 files changed, 21 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index f0407bab9a0c..3dcf078e111f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -662,6 +662,12 @@ static void guc_fini_hw(void *arg)
> >  	struct xe_guc *guc = arg;
> >  	struct xe_gt *gt = guc_to_gt(guc);
> >  
> > +	if (xe_guc_submit_initialized(guc)) {
> > +		xe_guc_reset_prepare(guc);
> > +		xe_guc_stop(guc);
> > +		xe_guc_submit_pause_abort(guc);
> > +	}

This should likely be in guc_submit_fini actually.

> > +
> >  	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
> >  		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index f3f2c8556a66..34c6e8a03013 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -425,6 +425,11 @@ void xe_guc_submit_disable(struct xe_guc *guc)
> >  	guc->submission_state.enabled = false;
> >  }
> >  
> > +bool xe_guc_submit_initialized(struct xe_guc *guc)
> > +{
> > +	return guc->submission_state.initialized;
> > +}
> > +
> >  static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
> >  {
> >  	int i;
> > @@ -992,7 +997,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
> >  	 * If device is being wedged even before submission_state is
> >  	 * initialized, there's nothing to do here.
> >  	 */
> > -	if (!guc->submission_state.initialized)
> > +	if (!xe_guc_submit_initialized(guc))
> >  		return;
> >  
> >  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> > @@ -1994,7 +1999,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >  	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> >  		return 0;
> >  
> > -	if (!guc->submission_state.initialized)
> > +	if (!xe_guc_submit_initialized(guc))
> >  		return 0;
> >  
> >  	/*
> > @@ -2418,8 +2423,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
> >  			continue;
> >  
> >  		xe_sched_submission_start(sched);
> > -		if (exec_queue_killed_or_banned_or_wedged(q))
> > -			xe_guc_exec_queue_trigger_cleanup(q);
> > +		guc_exec_queue_kill(q);
> 
> I believe this could deserve some extra explanation in a separate patch
> 

Yes, break this into a different patch. Which fixes the original
implementation.

> >  	}
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 100a7891b918..9308da2bd104 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -15,6 +15,7 @@ struct xe_guc;
> >  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> >  int xe_guc_submit_enable(struct xe_guc *guc);
> >  void xe_guc_submit_disable(struct xe_guc *guc);
> > +bool xe_guc_submit_initialized(struct xe_guc *guc);
> >  
> >  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> >  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 157520ea1783..60430d56c79c 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -173,7 +173,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> >  	return 0;
> >  
> >  err_out:
> > -	xe_guc_sanitize(&uc->guc);
> > +	xe_uc_reset_prepare(uc);
> > +	xe_uc_stop(uc);
> > +	xe_uc_sanitize(uc);
> 
> Why reset_prepare and not stop_prepare?
> All these guc variant functions are hard to follow nowadays
> and this combination seems strange and make things worse to follow.
> 
> Probably some refactor on the current names or a new wrapper function
> is needed here.
> 
> And why you use sanitize here, but the pause_abort on the above block...
> 
> This patch is doing a lot, in a single shot and without explanation.
> It is probably an indication that a cleaner refactor preparation
> series is needed here.
> 

The entire start / stop flows are a mess. A lot of this I copied from
the i915 early in Xe and appartently got a lot of things wrong. The
wedging code is wrong too, again my bad. We are getting bug reports on
this mess. I'm going to audit the entire driver now and try to clean
this is up.

I'll likely pull in code from Zhanjun in this process.

Matt

> Thanks,
> Rodrigo.
> 
> >  	return err;
> >  }
> >  
> > @@ -231,7 +233,9 @@ int xe_uc_load_hw(struct xe_uc *uc)
> >  	return 0;
> >  
> >  err_out:
> > -	xe_guc_sanitize(&uc->guc);
> > +	xe_uc_reset_prepare(uc);
> > +	xe_uc_stop(uc);
> > +	xe_uc_sanitize(uc);
> >  	return ret;
> >  }
> >  
> > -- 
> > 2.34.1
> > 
