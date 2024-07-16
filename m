Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A56DC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116EE10E8E8;
	Tue, 16 Jul 2024 21:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Il3GYDvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B8110E8F0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166134; x=1752702134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PSZ2pCrEXKhoVp1wcn4U0Cs/qrmnd6MRalR38HzM7xU=;
 b=Il3GYDvtQwU7QU5xqGdvT1jmq247zDmQf+lRXo45t4nSefWjPaSRNKju
 ZXOSFg8sTNnL1axp2NeO5qUpsCozaRcL5ehuHQWopMo8EweUdfWWxlP3L
 7H83vQMc0FyfO9/owa5qWtRMBywFKjn7k5u/Pq59koTbbByy/R/DY0CQI
 X8KpUaVhFpuLydUgDaQzWhMQ/yilA0C1ezT9aPms7daLBaiHbwmdn7OGd
 t0W/IKKP96eV+0F7Dx0L09LvQ2QoVqowO7pMDa4VeJcOs1efYSnDKgRR7
 CUU+jBeYgbswQEUC5NEdvkgUQ+Ffv06pRuSDTryKHlhYWIfC8+PDw6EZt A==;
X-CSE-ConnectionGUID: bKg+XSJ6RcSygPwhZJ1afQ==
X-CSE-MsgGUID: LGmXZDOMT06DiN+CAvCOrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29310402"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="29310402"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:42:14 -0700
X-CSE-ConnectionGUID: hnAHIFOLTWiOltJQwL2pkg==
X-CSE-MsgGUID: l/8tykhFQEKe867dVhwBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50514190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 14:42:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:42:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:42:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 14:42:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 14:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzfJaOlI/vvdzKSYXJxNKrLDM7yffaRUxtueYnvSxM47fYDn/swnbyY3jlL1+5msoFtoOFYJeiCvhwRA0dLDfGUb7woRwMeb8mIUolOmm7U/dF99C204Eu0upbXjgb1bzKYEPeYcRHovUh6lnCSb6dG8GQ20lEXddSy9lhnL1QnDpIwauxGJMCORBUhfQxbfXznmL6CvdLN4fJZvqtPCO1+6nowM2y3Rujf8sHBx23oaqFTjJK0eqMW+TF9NoYWuWGJHqJp4F3W+6tsMK7+3LOVLJ0UrckHddK+jKXOhnnM1qvoBF7Me3btdVib3irxkpGnj2rwtG+tySM7s3cnAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc8E/j2YetcFpSvigfSxT5NpD9Ceu2vDUEeLIgYLrdI=;
 b=CatTTKgMPIZoVt3jQyJ6n0KXvQxm7dvS14E0Xd1b/avmyyRcmk/m1/4H22EGlMCKCKd6pc5qKod6fICW5JIfZWjlrJ4v36ghKdUV3UiZUFJFudNSMnY0EC+pWWDJYvmWAuYwR6EvEoORbSqr+x0SQjKn7UYNX3QVPDz3q4f4R1QRMlFW0ts/K++cQtCJLNu8r85u71xgPAQm1h9lyTjMAdURmNhAkaIbJKkRqNNmxl3OBEIfU2dO8C4N+TUcRPQW2GEsqtAnQP+jMZRqm838r87T4HaktztO3q195mW+1E0pUPBqeAJZWDjyjXrhCwPU3LuauVqy+s0+dhS4UjPWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 21:42:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 21:42:11 +0000
Date: Tue, 16 Jul 2024 21:41:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Don't suspend device upon wedge
Message-ID: <ZpbpBMEy1qy4C+v3@DUT025-TGLU.fm.intel.com>
References: <20240716063902.1390130-1-matthew.brost@intel.com>
 <20240716063902.1390130-2-matthew.brost@intel.com>
 <CH0PR11MB5444BDE1386F1A76F9DEB7B0E5A22@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444BDE1386F1A76F9DEB7B0E5A22@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4626af57-5f4b-4db0-d93b-08dca5e02641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?71jemwPDfNPloyGwQw0NzcWuggfwRkJeekqccH3f60T3C7rk8t+8ehfW1oPD?=
 =?us-ascii?Q?C9JLlruvn4XYqtktkgWOqUtOQEWR2BBn6oNzccCjDfn5T9PgHywbZUq1LybG?=
 =?us-ascii?Q?uHNlkURpkOZYAjP0KN/070hbu+c23QXX9Nm+zIYF8FZKogdpgktN6kzZ0W56?=
 =?us-ascii?Q?A/lGNA9CnHzIjmWMk+WEV2YDlJ8EzmYcJf1DQ8YezF9oRTxJYkV20A0RYwwu?=
 =?us-ascii?Q?TYXxHlBsmlcChWfBy3lLaHuBfPUIk6hVUX+/nw0bthg12v62TL4jXVVO+tE+?=
 =?us-ascii?Q?A2GK9fsRlFg7QnBzIHSqMJUi8scRv7lFxv1jQQUAab6NnD8Mk3K3L78SuIA2?=
 =?us-ascii?Q?pRPTqfyagZglKsyVxzFjRGWxBkBu4anhawU+hrM1N4AMEq/s7PvZa56bXmn6?=
 =?us-ascii?Q?Y2OHVTBpnRa6uNdt73as7mXIVl8xFVvDzLCLdXEWNotQMd0eePZDRDcM46PB?=
 =?us-ascii?Q?7LNoEFeap6WjZCAZyaEweq5RnNJpg5MGsnq1B/Kz8MzLAwv4bmjJw53aEtGI?=
 =?us-ascii?Q?NZxyeakCsvPdnidCk1Do3M37pQ+XqCrUrNQMQXjHmcL5yFqZHqn8/RAYMC6s?=
 =?us-ascii?Q?0Iu4MzVGyqORpphmzZAsh76kdceawNCi+eNOdvSsk8GDFfrwGXWhiS76cRtI?=
 =?us-ascii?Q?yQKPFnrQhU97BysoVL4MKqu1scItkjtJtWKx2U4uAfOvX6pgspCGxYQVHub2?=
 =?us-ascii?Q?hA/8AFrwGSdCACUP6Boy8NIqt571Ga1elykpuEdoSQOAMKuSJUNCg9992ghz?=
 =?us-ascii?Q?KrBz6jBB0upslkptyzvTrOSo2T3o7O0JW7LSMU+v6+8qC1Vn+BzzMcAG01bJ?=
 =?us-ascii?Q?UgZChguEQBYl7A03npEEmXCnuuUMuyDBbT2oPp53hDrylquvrMlJC9LHGyvq?=
 =?us-ascii?Q?XiZufnjUV3dIaZrqZIVsY8qk7niw6hdltNo/mn+rRpoaLlJr0W4Y4i4oAk/W?=
 =?us-ascii?Q?NjTuOQSCa0Z9aX5Q1EDPDj7eXX8R8prGjwTM3Xb+W5rRMM8FmUOd9si1/z7X?=
 =?us-ascii?Q?TXmbRRu+MYS1KE6hCOAzezBeNaAwugdYGQwRcsdKas1OgyOIc4TbTd6aUUzd?=
 =?us-ascii?Q?ETALnzsQbvKI/oz9YPaOfoAs87N2OqIq68Nr7o6EV1xoGGitr6kw+RirswRg?=
 =?us-ascii?Q?UMfmJfxQaovX3dr8IZs8PalQTlK/l+1dWebBMs9qPyL781IiWm5AeE1LZZ8O?=
 =?us-ascii?Q?Kdtk2FZEAs7nYEpUwUyESLFccOo+AibMDbFGqu0Ct+milLg/QJRSeQ1Fq+Wh?=
 =?us-ascii?Q?emygZWp0Sl8RrLPa1MXcpHW6ajy8HBT/6FtZtiYoQKfWfuY5k1b+K3NX0EJ9?=
 =?us-ascii?Q?dSV3Px970J+kWwNGhjYxqzg2pLp4wDMiCYp9Q8NNTDJxEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGA5dZTubGLxOhY0QH4B+Sanz3Qj5PX2QU2qjRjtlZEp2csGMQxviJzFTQJA?=
 =?us-ascii?Q?BJOf4zSC8de9Yteiua4NooFCfFFz3SHA/OV4WBZo1AANBp60cyuAhHYQtT+j?=
 =?us-ascii?Q?XavbAUHM+QE9dTGjRaOssPd6ikh5l6BEPGSalazclSLywA/bX3nma5kLzFPs?=
 =?us-ascii?Q?xz19jEiKyJGrF+cl/XtbUWTOFqjGrpZL1UQQ6q8NuRS7XXYaLT6rpq2e7KBz?=
 =?us-ascii?Q?Rw2ZAGgekCAzV9h5NrTdApzwW3A2L7T8w6to3syM8qwQdVLmQGRlhGdVQzjt?=
 =?us-ascii?Q?dj/HEjeb4rkrnVxB28UfCqXZYrrjrEENDvFvxcmmXB2hNRvLA7JC2BFf6C7F?=
 =?us-ascii?Q?V9nV0b+ydjR0Og/x2lmaqIBWt+cxgAvaJgchqaxA7Wwxye5ZAl+lrfo3BqRP?=
 =?us-ascii?Q?zY3RCWWckRVs/sNjcuA7TnwC/Joszzh52B8mYEnx9PQ9brXOt+d1vheVa3CQ?=
 =?us-ascii?Q?l6krG8VyeR0ytjp70a0Qpu0YcileLJuYfv68tSpL3lHAPaoh1RQHGbiNqflw?=
 =?us-ascii?Q?Qz/6XM7OozXegXW6NyM9QiLBGQwZtxUeOirOD2VcH3v0CBy5Mw88Ma+6uxIx?=
 =?us-ascii?Q?FANlZRjatDWYoF3n9Z0ZpOjNVLw8YmWZy5ujkOXbzEHQHdWTm/MRCXjlSo0B?=
 =?us-ascii?Q?8Yoe4yUzbRcV6Tu62LrC4WW20yxBpMCeM/4OP07xN59dD/QgO+tru2xAcuiG?=
 =?us-ascii?Q?hZI5Ueikol74Tg0no0NTRDfPMbZPRtXCDCr4q8S8bhim8xOZo9PEpI+3xeXY?=
 =?us-ascii?Q?xsaMEZXRqh/OY/lLutR721FGqGn1XOQyVQ8eem05mhwbo9qBXUVuKVrExmaR?=
 =?us-ascii?Q?hbZ7Hj0nb1Hs+S2tngDba4oG8demcUdZq/S8FewRFRuuzg5W9Y3TMRAaRKwA?=
 =?us-ascii?Q?fpkanDtgWYL+SdKuIG74wh4B9PL2j5BwJjptNgGn5Nt/aZh5z2dHxpssrg25?=
 =?us-ascii?Q?HF+mY5qWp+DDIeW8W8ZokLcXViV3GCcoGuM9NNb8UCIrolwtKL0niv+JoVsR?=
 =?us-ascii?Q?O+C4VonJBbe7e3UQzgaqHtevHKnMPSodGuxHuFHhZ0fEgnY6Z7zmDktzw9rZ?=
 =?us-ascii?Q?1PdZ9pEKpiso2IRc7FsPuLBcpQxsRO9GtRYf7XnQ3Jd3a2Z3t+f23MhPc6oQ?=
 =?us-ascii?Q?iCc6HnSG0liff6p5G07aFWJmo4mibVDjYC3Lom595SsaXISGFm7xKhwhXals?=
 =?us-ascii?Q?OlonpFXGvsFh6hWx3AK3boSvkVicdrv38z0e5pMT2wSiK45HKh38lksZW9j+?=
 =?us-ascii?Q?J9wV/GKmwXKPECsEA6LdZGDc9ScMphclbvT/NhQEzYODxZf7g5JsHFDbi84c?=
 =?us-ascii?Q?OhFntNVfuXNPY8xYL6GeDxZlakJ6SfZaKZFGBkj0FrmS4qdcINJhI8a4bUqw?=
 =?us-ascii?Q?ZBINvdcvVEBcJaUYTwd7qJD9Fk1O+Kv9Mykub6pA5WdppyCT9o+pLCV0bHmp?=
 =?us-ascii?Q?rk8ipXTILa4U3cotCy4V1DL42jOWyOX710R994RU+O76/6rD6TGKPFpXAIbA?=
 =?us-ascii?Q?LYh5uxFmEMtq/9pql07L0Iui/NdEy5ICakjoa1CMlfjXbTNpz55rXmCfm7OX?=
 =?us-ascii?Q?Yn99gcpDmue7hlrNFSqxGcXygqU2zxNDYFWhQqy2dlxhETu1tCrbmXSU6bWK?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4626af57-5f4b-4db0-d93b-08dca5e02641
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 21:42:11.3839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkwrnT981u5U1plitT/sB2XitdtetmHIeiZGspOzoSMYgjWQlQNYWfrH4j0BGF3OUKXUxJw+UvGF4I6qApKuQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
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

On Tue, Jul 16, 2024 at 03:26:03PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Monday, July 15, 2024 11:39 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v3 2/2] drm/xe: Don't suspend device upon wedge
> > 
> > When wedging a device we shouldn't be suspending device as state for
> > debug will be lost.
> > 
> > Also this appears to not work as the below stack trace pops upon trying
> > to resume a wedged device:
> > 
> > [  304.245044] INFO: task cat:12115 blocked for more than 151 seconds.
> > [  304.251333]       Tainted: G        W          6.10.0-rc7-xe+ #3518
> > [  304.257617] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > [  304.265459] task:cat             state:D stack:13384 pid:12115 tgid:12115 ppid:3986   flags:0x00000006
> > [  304.265465] Call Trace:
> > [  304.265467]  <TASK>
> > [  304.265469]  __schedule+0x3c4/0xdf0
> > [  304.265478]  schedule+0x3c/0x140
> > [  304.265481]  rpm_resume+0x1cc/0x740
> > [  304.265484]  ? __pfx_autoremove_wake_function+0x10/0x10
> > [  304.265489]  __pm_runtime_resume+0x49/0x80
> > [  304.265494]  guc_info+0x6b/0xb0 [xe]
> > [  304.265538]  ? __pfx___drm_printfn_seq_file+0x10/0x10
> > [  304.265541]  ? __pfx___drm_puts_seq_file+0x10/0x10
> > [  304.265545]  seq_read_iter+0x111/0x4c0
> > [  304.265551]  seq_read+0xfc/0x140
> > [  304.265556]  full_proxy_read+0x58/0x80
> > [  304.265560]  vfs_read+0xa7/0x360
> > [  304.265563]  ? find_held_lock+0x2b/0x80
> > [  304.265568]  ksys_read+0x64/0xe0
> > [  304.265571]  do_syscall_64+0x68/0x140
> > [  304.265575]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [  304.265578] RIP: 0033:0x7f4254d14992
> > [  304.265580] RSP: 002b:00007ffc558666f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> > [  304.265583] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f4254d14992
> > [  304.265584] RDX: 0000000000020000 RSI: 00007f4254ebb000 RDI: 0000000000000003
> > [  304.265586] RBP: 00007f4254ebb000 R08: 00007f4254eba010 R09: 00007f4254eba010
> > [  304.265587] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000022000
> > [  304.265588] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
> > [  304.265593]  </TASK>
> > [  304.265594]
> >                Showing all locks held in the system:
> > [  304.265598] 1 lock held by khungtaskd/57:
> > [  304.265599]  #0: ffffffff8273b860 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x36/0x1c0
> > [  304.265607] 3 locks held by kworker/6:1/90:
> > [  304.265610] 1 lock held by in:imklog/547:
> > [  304.265611]  #0: ffff88810498cd88 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x76/0xc0
> > [  304.265620] 1 lock held by dmesg/1310:
> > 
> > Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 1e3d3a7e74d5..07aedbaf1821 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -893,6 +893,13 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> >  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> >  }
> >  
> > +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_device *xe = arg;
> > +
> > +	xe_pm_runtime_put(xe);
> > +}
> > +
> >  /**
> >   * xe_device_declare_wedged - Declare device wedged
> >   * @xe: xe device instance
> > @@ -911,12 +918,21 @@ void xe_device_declare_wedged(struct xe_device *xe)
> >  {
> >  	struct xe_gt *gt;
> >  	u8 id;
> > +	int err;
> >  
> >  	if (xe->wedged.mode == 0) {
> >  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> >  		return;
> >  	}
> >  
> > +	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> > +	if (err) {
> 
> If we aren't reporting the error value, we can probably just
> check against the function itself to reduce the size of the change:
> 
> 	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {
> 
> Either that, or we should report the error value as a part
> of the drm_err report.
> 
> The current implementation is still good, however, and this
> is just a suggestion.  I won't block on this.
> 

Good suggestion, will change.

Matt

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > +		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
> > +		return;
> > +	}
> > +
> > +	xe_pm_runtime_get_noresume(xe);
> > +
> >  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> >  		xe->needs_flr_on_fini = true;
> >  		drm_err(&xe->drm,
> > -- 
> > 2.34.1
> > 
> > 
