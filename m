Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A86C3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 13:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D055910E36E;
	Mon, 16 Sep 2024 13:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6UDF0Fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371B710E352
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726494277; x=1758030277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NSqlsiRAbsXrsp3aB8rYAcXIITH0tH4Ap27HJ2pUb3k=;
 b=K6UDF0FxheqyA5GM3nuUoQcPuzCTBImIHRlL4QB6BmLH5l0t3LVXCNCK
 L2XnFE/hQCCt5DBngtVbaZRXk2blJPtyQCB6KesBPJgGxe3Z2U+0AdiQo
 W9SLZ7eXx5ETBnQRF5OQGSY7eWaRXhQN6jFdiw5MF8gcOozhBq+BtFZx3
 uTTKGS18LjxL33RD0Clnrx9yDjNO47b+KVODWq9TH2HSUH3Gg/4MTJdo+
 lcTZxcZTxMoehmVd2oy/Und9EYQTLYMDQ3xuRGkF2hOiDvizP6V2nA6aT
 QyfWuDdZ4v704JCcICijvDZrgbSwC5GAULIFi9MQnurokhZ+xrC0S9YCJ g==;
X-CSE-ConnectionGUID: rstFyVEtTMafqadOcDnG1A==
X-CSE-MsgGUID: /kPSZ2XKTkyLw7JwZ9yUdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36664869"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36664869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:44:36 -0700
X-CSE-ConnectionGUID: 2H1hRe7JThC5Tey/yXt/5w==
X-CSE-MsgGUID: tNsHcWD+RtGKj+aoZmQ/Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68557960"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 06:44:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 06:44:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 06:44:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 06:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAAXYCb3+HQnsi+6aL7lV7wbJYJebFlxwF64GAeKKt4lNqJdYlqe9xd2D0AQDZAg2Vrw/4wMbkXPmFqB2jnGapgs1ge/RyTZLIz285zb+V8G/E1PKBQbRKNTB57wvUusBu7jdL6+RYARiS1NclVuWcVan2vea6RRBQTUy7+GKEvGZZqTOvh1qbs8BQ57em3ySWM9zdgyKLQnOW++dirMC1FdRqw8Ivhq/8X+Axx5XMcBw0Ahm5QVAH6UJ5K0DP0sMm5Sn7YbuFgvYOtYIrA9ddvcAkcGjW/W7+fMKCvFuJvOZkeJpOM3O3VV718R/f4qUWZ/vKZWaMFCvxraiZV2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQlFAgXqPhs2FEvO5JcrpAtncCMs2GZ0YYrI7HQU2jk=;
 b=RsufVTQhJC2jzmMwo5VLCtIJitgPJG8L9cbHUzFPKtVhaRZfePMS28N5Mb6eoMeQT72LU4uFEhyDvuLoa9RZ3ffQaW0yWr0SH6AbewJVB2sHhGC6FJAjfu+ozhOPo+hHHVSMw2h2DgL1k0uFiJYBYs1u2Bxa2MLnsz/toLWO9euZQEQeCI3VRSwE3L2RSXNlZHEFPm7wTO2kQx9uZanJHib2dRO2dFyIYaI96vwYSc1wq0co0KaKwEFYb0apsFIC1tN6Yee2BSWpGM0CXQV3DbgMT5XHFnzE1BDMRciYoVI6kp/eZWW20vC7iHwdl5I7CqFBWUWUHk4//kf54iA1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 13:44:33 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 13:44:32 +0000
Date: Mon, 16 Sep 2024 09:44:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/display: Do not suspend resume dp mst during
 runtime
Message-ID: <Zug2PvMXh8x_wM32@intel.com>
References: <20240912012545.702032-1-suraj.kandpal@intel.com>
 <20240912012545.702032-2-suraj.kandpal@intel.com>
 <ZuSi4sR6hWtBc-ez@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuSi4sR6hWtBc-ez@intel.com>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 8840cde9-4465-42a8-2bb0-08dcd655b1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MayNV2Zmmw/pthMbRcmD6YIweb8ojAyAUOtZXkjpWIorDjf2AD0AH+05aJtU?=
 =?us-ascii?Q?MmzcTo7qEOfo6GyPSPohZ4ouLLUd61xLkt63zh0QkVFcl/6fmOLd+v2RQ5pW?=
 =?us-ascii?Q?dWAJaLVIxTWwwbISCmxf5tKHFDle+edDS7jiXwetu2GPbV54XJqxpn3iaAfh?=
 =?us-ascii?Q?Jk7f57TDMSr+uswBxnGPSEZcgeBMiQZjFm4UaPN7r44Yc0BnnUWodlXP7yoQ?=
 =?us-ascii?Q?htDErzewg5OEBSrLXzJtHamUsgEvlgkOavmx5He1O9mWFEwILF5CNoCYPWXW?=
 =?us-ascii?Q?0ntK8EhnNAmPKIRg/EUtFksRPTK6WGIpK5GpDgysenM5SWNP3oPufVXPvSIC?=
 =?us-ascii?Q?8PXmsyH2+fCwzAfvYWDl7ZHz63daXWUd9qDFmlfMLn4XSWT9+81aj/1X9kP+?=
 =?us-ascii?Q?nBK5ArLZ4I7OjmGyhVwNq3ZZrH4C+37nNh2hkNkGlEkeLKjfMo0t0dkCrarN?=
 =?us-ascii?Q?P5IopD7qsipCW2u2aT/OX3BS/FnJ6CP/tKLwWow7uf9tZKxLQGi270+326VE?=
 =?us-ascii?Q?N1tuYvPoGJ7FdmuFtKzSEuMwFJiyr84u9vDUhiuZ9VtMVSW1I81MdnxN1XDg?=
 =?us-ascii?Q?sPP09BrMOzhOaoYkmN75LN93vk8LvyN59XsVqtzqfnf/lfr2NZzOuRQnCQHn?=
 =?us-ascii?Q?4lplF6A4cXs3Adr5mmpDFLr0943XoJrAthAzt8zOQCIHe4d5PrIaUAIOTdQx?=
 =?us-ascii?Q?nEh9I3gu5Mp8KL/uEicFF9gygBsStGTH6ssjERDmiF2ANexrF3qA9IGMlWO+?=
 =?us-ascii?Q?3n0eqiWVNhIikbkZV7HRd2L/iytQ5LjQ+WVIwTbhEpB4ugthMiguD3eRbX7D?=
 =?us-ascii?Q?ZUbEZ9KOoPXg4RMKeNtKWKyStGT274atzpL3bBRTXJWKXrqe8KrP2vJOHh9a?=
 =?us-ascii?Q?Ni5lssRNkYe2oJHWMgvVWBJcaJM5K49Px8rlEAhJmXO6kGM0kJHlMuoY51cm?=
 =?us-ascii?Q?mhDetcNONvjZsBCEhxG/+p2EM4nAAkigoH58gszMAYTZiLDw9f99nRhJ5fGN?=
 =?us-ascii?Q?QYSiUAI+79jFY56FBAUXgwhGmILeebhPumNmpzlIqGdok0ufiY5ah580E1pF?=
 =?us-ascii?Q?FqRHyVuroIqEmY/yZuvYiXnQ0ZmAqpfmSqGgIC1cZu8TpFZ0fQMMrLHZc68u?=
 =?us-ascii?Q?MUNR+KSMfdRNortgkXDkdJ/4ngAIprHGeSCNIaXGYwMlpSvpUbXBmIH66UY2?=
 =?us-ascii?Q?nGbzvvG2Ex5Hz6j8flCQKVQjbdUoosOzX9iAXqM1JjrVfwIQEVDJY+8YCtPX?=
 =?us-ascii?Q?1xs/9HbBmE3vhlwkRLqD96qYu6fLTuVNIRGEUEVnY+xF7ZcJ8r5H8gCeCNo4?=
 =?us-ascii?Q?SJk7A+wGV6ES9kIoVn9CafkTRz7IkNHUiYpViF0GsRoco0Yo7QE9cw6uZWLt?=
 =?us-ascii?Q?X49sZ9M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChwANGPGp9FGCj647cuWMM5/4Jthzgk3NQZBNQ4/s2TjJCEVx4Q/x7ePGude?=
 =?us-ascii?Q?+6H/39UD+UaPLMw3JP1RP8AUmUg/XjAlUv1EHT4OfXicQ92+4d/MapclPP5W?=
 =?us-ascii?Q?2vdRTQ8QtFjiHQg9Wm8QmMJ11zD+0qpk6yCPdSwu2Wkycrx16BnCifkuicec?=
 =?us-ascii?Q?p3cNZOJvQcR90hLznzrQvyzEXXoPTvMJNcgzdLc7CSrgRhCoBwTCxtamfPTk?=
 =?us-ascii?Q?4iq+14xXHTA6PCO8DqgUna/tBMhSSmiD++T8jInuCpy5Tk7KXW1oW9f1FE+x?=
 =?us-ascii?Q?9ba3oaouByQu82tke8uCTIndPHwBJ9pSdNGmGAjtljqKSNW2uKm2d2hQ7x96?=
 =?us-ascii?Q?Emq8o0k9XKrWvD2CeU6mJ/ULdbpoq2iPBfm9DsyXrCknLKAhnu3xII1tMBj8?=
 =?us-ascii?Q?uwKLiw8bk5l6RAlyu2lZJtJiIRkLooeJNLnHH5UwWmK4oy74GskqDeg8sXQ2?=
 =?us-ascii?Q?7s/N6QTVuJdzBDtvsOLaeP9X8qILp97xpGHDBfRdwqoVRuX1IYD5Hy6BNUfo?=
 =?us-ascii?Q?+y09iT2xKwT0Wo8PJf6wV6B1v+QIjN+VLWA284iv0K2CmX4mYCOHHmOzhL+4?=
 =?us-ascii?Q?kQhEsl8d4N4yilcFNhV3Yf842+o45Ue+S6wVucH8/D5HW7GphHYmCjfXm1KC?=
 =?us-ascii?Q?NwhV67a/5Vi2eOfVEX1X75IioFfu4qKl6OmASObew23D3/rRpX3q2Tiya06m?=
 =?us-ascii?Q?fjbUt3OUPdGoD5h0hPF34daHTJT6SbOaoUII2Xq0cBsz4uf5fQPmmH/6QQVL?=
 =?us-ascii?Q?3sxMz1U7gUiebkpXtJMsOisqTijty/A7FK2coiPXjjQyHtdYq4ZQtolnU2cm?=
 =?us-ascii?Q?2Px+UJF6t+DGx7DoCpWZd0Wo7VDg37eC++fAK4cVFRTGjPFLeCVmvF7cuUA5?=
 =?us-ascii?Q?zA/qb1t7SWT05F72j/fsIYXAp1f3UxwfJHML+blPy1xkuck7U1Rm4wpmHVDd?=
 =?us-ascii?Q?wTt8EEmTlRPpDxMmz1pedJYXZiLEtPhiW9MbikPx1k1xvzmVsmeWCDuFtWDp?=
 =?us-ascii?Q?M3nECNv+6V1BJ7306H4ZgfQ5YbtZg1Mfj1i498ZhAHFwhxwXMzmXP3hbmPdg?=
 =?us-ascii?Q?43rhx2qoOEvnBwuAQLdPxrdIrqF2+bctS0a2op8jvJD3MsE5sPsm4jidEcC3?=
 =?us-ascii?Q?KD7t9hBq0asTLqDN/SbccV6qQShGdqf7FlCjHi0hSqck3uAMMbGn5V/u8Rhg?=
 =?us-ascii?Q?lmhi9FG7/tmjkkVRT5A61C8lJYAiYS2jmLwtuVe66CBp4xwXXLPDJNroY+hT?=
 =?us-ascii?Q?J9b85aL+8yhcYDV6uyuh16qApINXgpruf9T7mMGJec6edZAV3edTJgcJUJG2?=
 =?us-ascii?Q?TUTyNRW7zQdnWVItPhDZVQpaZ/NkDNwcZE03Wh0nNPOt/M4Yk+Kb4xqdiaQl?=
 =?us-ascii?Q?ezq+DqgRqGwtkzTLo8N6xdytqLEKlANprlqT2bY5Z2d4uU/cNxgI2E0+kBPu?=
 =?us-ascii?Q?QAf22xrXt7kHMq1Bfrx9tRTSqUAnCs5arF3hmYVME3WTPZ9qcI/vapZFPuex?=
 =?us-ascii?Q?dHvAX4x1FVANzzuWCOhoJybUVSzsvrQxgXsA+A2iyj+0BlfEQW4OthN42sOP?=
 =?us-ascii?Q?K+QnTGASZoCStMHWFuYIgtuMpytcOdKSRgoGmdRhP8fnIMY1tkNjyb+Mqzza?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8840cde9-4465-42a8-2bb0-08dcd655b1f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:44:32.9528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jZgOD066q3grrdcurj0Hxcvcvqv22rV2vSWAZEpdQ9oESi5LRt3a9iF7lTq9l93iAUEQZYmXo3moGK9Xzar/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
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

On Fri, Sep 13, 2024 at 04:38:58PM -0400, Rodrigo Vivi wrote:
> On Thu, Sep 12, 2024 at 06:55:44AM +0530, Suraj Kandpal wrote:
> > Remove intel_dp_mst_suspend/resume from runtime suspend resume
> > sequences. It is incorrect as it depends on AUX transfers which
> > itself depend on the device being runtime resumed. This is
> > also why we see a lock_dep splat here.
> > 
> > <4> [76.011119] kworker/4:2/192 is trying to acquire lock:
> > <4> [76.011122] ffff8881120b3210 (&mgr->lock#2){+.+.}-{3:3}, at:
> > drm_dp_mst_topology_mgr_suspend+0x33/0xd0 [drm_display_helper]
> > <4> [76.011142]
> > but task is already holding lock:
> > <4> [76.011144] ffffffffa0bc3420
> > (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at:
> > xe_pm_runtime_suspend+0x51/0x3f0 [xe]
> > <4> [76.011223]
> > which lock already depends on the new lock.
> > <4> [76.011226]
> > the existing dependency chain (in reverse order) is:
> > <4> [76.011229]
> > -> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> > <4> [76.011233]        pm_runtime_lockdep_prime+0x2f/0x50 [xe]
> > <4> [76.011306]        xe_pm_runtime_resume_and_get+0x29/0x90 [xe]
> > <4> [76.011377]        intel_display_power_get+0x24/0x70 [xe]
> > <4> [76.011466]        intel_digital_port_connected_locked+0x4c/0xf0
> > [xe]
> > <4> [76.011551]        intel_dp_aux_xfer+0xb8/0x7c0 [xe]
> > <4> [76.011633]        intel_dp_aux_transfer+0x166/0x2e0 [xe]
> > <4> [76.011715]        drm_dp_dpcd_access+0x87/0x150
> > [drm_display_helper]
> > <4> [76.011726]        drm_dp_dpcd_probe+0x3d/0xf0 [drm_display_helper]
> > <4> [76.011737]        drm_dp_dpcd_read+0xdd/0x130 [drm_display_helper]
> > <4> [76.011747]        intel_dp_get_colorimetry_status+0x3a/0x70 [xe]
> > <4> [76.011886]        intel_dp_init_connector+0x4ff/0x1030 [xe]
> > <4> [76.011969]        intel_ddi_init+0xc5b/0x1030 [xe]
> > <4> [76.012058]        intel_bios_for_each_encoder+0x36/0x60 [xe]
> > <4> [76.012145]        intel_setup_outputs+0x201/0x460 [xe]
> > <4> [76.012233]        intel_display_driver_probe_nogem+0x155/0x1e0 [xe]
> > <4> [76.012320]        xe_display_init_noaccel+0x27/0x70 [xe]
> 
> could you please share the full in a link with me?
> I believe we can improve this. This seems incomplete...

Thanks for sharing the link:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/re-dg2-17/igt@xe_pm@d3cold-mmap-vram.html#dmesg-warnings266

What about something like this:

WARNING: possible circular locking dependency detected
 6.11.0-rc3-xe #1 Not tainted
 ------------------------------------------------------
 kworker/4:2/192 is trying to acquire lock:
 ffff8881120b3210 (&mgr->lock#2){+.+.}-{3:3}, at: drm_dp_mst_topology_mgr_suspend+0x33/0xd0 [drm_display_helper]
but task is already holding lock:
ffffffffa0bc3420 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at: xe_pm_runtime_suspend+0x51/0x3f0 [xe]

-> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
        drm_dp_dpcd_access+0x87/0x150 [drm_display_helper]
        xe_device_probe+0x8dd/0xbf0 [xe]

-> #1 (&aux->hw_mutex){+.+.}-{3:3}:
        drm_dp_dpcd_access+0x55/0x150 [drm_display_helper]
	drm_dp_mst_topology_mgr_set_mst+0x8c/0x2e0 [drm_display_helper]
        i915_hpd_poll_init_work+0x1d1/0x290 [xe]

-> #0 (&mgr->lock#2){+.+.}-{3:3}:
        drm_dp_mst_topology_mgr_suspend+0x33/0xd0 [drm_display_helper]
        intel_dp_mst_suspend+0x7e/0xa0 [xe]
        xe_display_pm_suspend+0x59/0xc0 [xe]

Possible unsafe locking scenario:
      CPU0                    CPU1
      ----                    ----
 lock(xe_pm_runtime_lockdep_map);
                              lock(&aux->hw_mutex);
                              lock(xe_pm_runtime_lockdep_map);
 lock(&mgr->lock#2);
 *** DEADLOCK ***
 3 locks held by kworker/4:2/192:
  #0: ffff888101546348 ((wq_completion)pm){+.+.}-{0:0}, at: process_scheduled_works+0x5bb/0x730
  #1: ffffc900005b3e48 ((work_completion)(&dev->power.work)){+.+.}-{0:0}, at: process_scheduled_works+0x35b/0x730
  #2: ffffffffa0bc3420 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at: xe_pm_runtime_suspend+0x51/0x3f0 [xe]

 Call Trace:
[snip]
  intel_dp_mst_suspend+0x7e/0xa0 [xe]

> 
> > 
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> > index e65e7d70f989..39da79069b5a 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -331,7 +331,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
> >  
> >  	xe_display_flush_cleanup_work(xe);
> >  
> > -	intel_dp_mst_suspend(xe);
> > +	if (!runtime)
> > +		intel_dp_mst_suspend(xe);
> >  
> >  	intel_hpd_cancel_work(xe);
> >  
> > @@ -444,7 +445,9 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
> >  		intel_display_driver_resume_access(xe);
> >  
> >  	/* MST sideband requires HPD interrupts enabled */
> > -	intel_dp_mst_resume(xe);
> > +	if (!runtime)
> > +		intel_dp_mst_resume(xe);
> > +
> >  	if (!runtime && has_display(xe)) {
> >  		intel_display_driver_resume(xe);
> >  		drm_kms_helper_poll_enable(&xe->drm);
> > -- 
> > 2.43.2
> > 
