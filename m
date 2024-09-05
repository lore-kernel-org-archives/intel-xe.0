Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C9C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 16:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8A710E867;
	Thu,  5 Sep 2024 16:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HeT6upum";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B3410E867
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725554671; x=1757090671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MZUVXqlVQSGorRxctIDkEQX1kBz2O9jyX+cCtrWYb6U=;
 b=HeT6upumlgcT6/6XuIY5uTDhqy2gcTTFi+DVvFZ/pfAyO7cC5ph3EFHH
 3vKfOTzkB3R/59V/ewkZSobU7qKEsf/4LV9qno4/G3isVAGAd6eFuR0pB
 QUIUS4QOQ3WpCB39AfUEHv5Ud53iAsiKLeNmOP8vtk9J7486Zx2ChjqKi
 wESnbkV4t6cNF6IiyPnplixfAu9crRwGntijUjdHQmXIFb+3koDcI9jb8
 IJXYU5lm3vpDPVnUdJqlY8tjYxAQwsJaKBEL7ErVOiFjbUFlt3X+Pbw8P
 hcNSMyNn5UztiHGhb9NMX6xlrFH4Vo6V4WatfzotPHL8OrtyEhFa0XT/I Q==;
X-CSE-ConnectionGUID: 6awYMe4LQ5GtWFTb9WR+1g==
X-CSE-MsgGUID: aPgtg5KRTWCYU6do7xofpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41764476"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="41764476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:44:31 -0700
X-CSE-ConnectionGUID: m/jgoonzS3iPc4Av79U3vQ==
X-CSE-MsgGUID: NSLYzNMxToyWiob61x9LIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70473147"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 09:44:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 09:44:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 09:44:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 09:44:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 09:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7fyzHmD/EQDP9S81TyZGuekuet5iP1fWhe1+GamTf+JBpqykGLVxohcTGrJWUC4Vsx9QQc6gTet5w1tyINOn5Q50c9pzsUrgEa/ZChYDGb7Znd1sbDkLwmOISssljXj4HmEuUJR7HvFboPUjuYwRF0KQDjQAc9m0pq7/e4LU8AudM82T6D4G9KFShzMW+7UKCFJA37Ts8XbPQvnHRs9FVYjdTfwRI/CpjLt/YT8aEZLZQboxh7B1SxxGmaehRDfMNBuygCIyKUgrPP1eCqzMNl5aKjzbpsocFIdVAwQPclaBMq5XEeCG6oOFIubB6cJkXQPqcoNynivrlLpms8lwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuJrMtCM0VWSAPGmvj0dhLl46gsbB6bP+WF9vZLKHmM=;
 b=yay0HBlRCvbyS/5unppsz37VWo6HrD2xA7bUrZ6XFnpP3NGeQbMC4moFLajBeM3XoGCuysPTiQWV1/0G84YXo/YyGtrGVHZNxt1VZQAWTw8rS9z77OdPQw6I1YbrlYmp5QVSPIROqJU5bjVEu7jn+O882yjZ0cthwTIr1LqBuB6pMXmg7PBoYqaOTc+idfHWY7ODz+5uLjLFzJk+AJjU/lIMZUlWSL9h7yXp9nN1My61xomXIwb7gRkFURkhlg6Whi1iGdN6fr+Ibf7E8C9epd/CehnfAw27bv0VZT+5e6owrIpKCMeDoRJ/5cryjlGrH0ZqCftWM/xSWMa7MGEWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 16:44:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 16:44:24 +0000
Date: Thu, 5 Sep 2024 11:44:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Remove runtime argument from display s/r
 functions
Message-ID: <tsaiwhxdaoxqoftx34onq3a4nuvrpkgxko6mdiht6djb5gnb5n@khycsb3zqegt>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240905150052.174895-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:303:87::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0b9c6a-0622-4894-87b1-08dccdc9ffa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4sxfToF0VgBoSOntcpTfH9m9+9hmk+/Dpzr+PP4g9oDGcJGzbzAEJRhgT/WY?=
 =?us-ascii?Q?dFRfADz0L7Ki0Blz9ktZ5K24nmz96AoqlI4upl4SgFu2tCR5pLW7oavBr/eF?=
 =?us-ascii?Q?6U1of6RkMTcrSApu5Xlwqo2NG2Y3HT5wQCIgq0F645LYCuvNSRf0PU4NuA3V?=
 =?us-ascii?Q?ZBT/t4AZmjLXf8nAY6rUetcoVSTaQWDIJf/ktPjb+WBI0kjGiacMpQmBqHip?=
 =?us-ascii?Q?F+MDQ8gRgbUsNbUSgjoVm8ufTn3Y0RHMbBZ5s/mvMMQap03MvDlb3u1hrvYI?=
 =?us-ascii?Q?R4NnWeXgCubjecST0SbVaA3sMRx0DDSDul7hF7FjKtdF4KNKxk1gZn4lCMMA?=
 =?us-ascii?Q?Z4YO+Xvl3wX8o965c8149LI92fuOF5uAW0Z4S1p5zlXlkui6z3wK0aL5E+fV?=
 =?us-ascii?Q?f5uYUvaFirb1Kw6pbWYKRaKNLA/C3EhggYexVDgCAbYr3r38j4tmuNQd2T9T?=
 =?us-ascii?Q?RE7E6qwU5QEtVcdYQILV16a3P+wv+Y8G6QQermCl7aYxT0rKt5m5ajLgOzCB?=
 =?us-ascii?Q?XqTUFGajSuve3Io8MCj4UCTC/If1ZrMb7dVB9C3UAJy7p8opdZaXLRHg6u+C?=
 =?us-ascii?Q?I8MdDpUfvZ1vImZnaBR80afKBKHO0HJ0rjscPmR1y0SavfWX2zEAftvDJ5Ht?=
 =?us-ascii?Q?f8Lj2NWNoVGcnLppyn0uRiTcOnv2YhpWIURHiiF5ZK0SCaRR+IPHtaG/NrKZ?=
 =?us-ascii?Q?XXQ5h7n9N/wvziJRAynPnzcfMMz/3Gr/6DE2ow/waX34moM9XBODo+sXnVyz?=
 =?us-ascii?Q?B59KAs0wzeepU1ed3g+d0mPy3KAm5AA2dqMmGVYmE4F6wxzy4+krVzByCJ8q?=
 =?us-ascii?Q?tsAfFIvRumVAM2lQAzU+X2zlx+k+XiPOB99MP5YuOTaGcc9J5noNFtY/UzsC?=
 =?us-ascii?Q?tceyXDrBWzhto6xRQaqLphAjSnrLUp34mu2BbAnXxnEIJ0S8jx8bI2YA8gay?=
 =?us-ascii?Q?V1++LTRTXiwWNfA6WnH+Gl4Nix9jqxl3Mqlb0pXz3E3pjYRMOuY/nTmdJaxv?=
 =?us-ascii?Q?eYnzEBHCGH0vwUH02RVP0fhUA2uUNH0udYaDHSoX1pQFBiACSTVC0HEaUjZP?=
 =?us-ascii?Q?fzIOqmN0EnxgAIlwsAlGyuh4raTzEQMPX4DyoPec3uzjyX5r6gGFPGx3vkjU?=
 =?us-ascii?Q?9PEewR5fxJVZV3at/br2eJFXpkK5cNYSXKvnE9kzhW8irvx09X50wSp3XF5f?=
 =?us-ascii?Q?o3VI5gYcoOIjL/mB1R4/xuqjd2AHvThYn7WCWjmInbc0ho5GyR/zlihX1Ytd?=
 =?us-ascii?Q?0d4xBTIiw+ncgQAQ3ahtfTkZqEuewycOp7rGUH38DLhFbJeJ0V8ENcKhvms/?=
 =?us-ascii?Q?VIWgFgMudfqwP0WY7sXs2AsJ/saoEEUuNNpyozvjvX+nWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7HcVGGB568tIOaL6vnenaV25zIZHem88v0AVgOk/4kFiGQ8JkKhIarvU7ll1?=
 =?us-ascii?Q?WP+fKNSshyt36bVmxhoyCVzPOqEgXaxa3jb4y2ng0CgfkAVQsHQO5tZ5tZhn?=
 =?us-ascii?Q?m8U6UDebmhYjKwDueqkPJYIeYkVwazCtviRMsYSi2Qha6lgttoVdvUM/AHjU?=
 =?us-ascii?Q?LW7vPaPcwI4eloc81HE2qRrWAc/ey/M2qyVNpPGXd0n5AalhdJlDz2+yuXsn?=
 =?us-ascii?Q?ZDjKDz13tm2dYZj0Ii207YoumeMo3gy3EFo6kyIawj6jk+6eQxtaAgA6VeAP?=
 =?us-ascii?Q?djeqRdF8SRfJtcU+yFkZ/6QzmCzolSwb5rkD+taqkFWIvLYht2fQEm5MZvgo?=
 =?us-ascii?Q?J9dWGPG8n5sWoK8pVwomU76ZcaZCQHhmybh8QWyu/htM7edU+eeHp2srD7rE?=
 =?us-ascii?Q?Q7sCik+LHnp9cb9SyOufk7IMCzpFNz6Ni0Oj3/2zQK3ctojXg1exFF/9UVt8?=
 =?us-ascii?Q?rsylNYu4E7plLqs4gZnQ+kTykSgg/mS8jkKqPP4sWnXSug/l4ni4NkK1S2nq?=
 =?us-ascii?Q?n4eM6gnAdEVlyVg/7l394mVKAz1E5jV+OxxJu1el4Zyz4m6CCna4XsDWjfh5?=
 =?us-ascii?Q?mMhjzVsjyD40yB627KGctuddSv+NYawurnAg+10JJ7LN2qXAobtdMqLJBvLS?=
 =?us-ascii?Q?/X8FxQ4YNsRXqrqT7EdWOc5TDAbM5Vucb+0JPHMmlv28ho0eCpZIODjJ3h1T?=
 =?us-ascii?Q?pFQ0GhdQ9DVZm24Yb64haEStFtfOEtWYoZJ5tnA/NeZDE/Ezl0qI5kaTjZ0z?=
 =?us-ascii?Q?4aNAK+GzbIFn9HwHbAOpeGKNSkp54kLyy9ayKtGiQ0iCXxaSBPiR3OkGBelA?=
 =?us-ascii?Q?gbtcTaPh/Kmbw/L0JcCeOB7LeijoHaGFoDadOtBzjPb7SGfUxapnYbf6JWw3?=
 =?us-ascii?Q?gmhGIIqw3tpDl9gEec4tqHguYIjkd/ORKrXA3ASnx8etkIwrUFdr9fCu9xv1?=
 =?us-ascii?Q?sHnHcaqkGKdUkfoOHffdfHvktm/co5KfEYRqLCYWAMDa07PwQqFe8rkgCdpa?=
 =?us-ascii?Q?VKT+wJpCihPg+3pROssowxe57ahG/9ESXAll5uxlM5xxXia3mlTXRvQ299Dd?=
 =?us-ascii?Q?yeQ3A3n0YqGgrZsjVa1X8Sw7DBfd5EPUV00wmuAeFSGvCu0eJWsKDlNMB/fV?=
 =?us-ascii?Q?SoYOb7VJIeL/t4sPHz61gXVrTCSCM46uxEkBxcJLyRBq1zbkzs4YRnUQ/ffu?=
 =?us-ascii?Q?x4PtVZcqWda1JQLgs26VWmWV67owW9+NfJy303Z5RZ2koQ0XHDw1qcK5Bsia?=
 =?us-ascii?Q?jWBX1XN3M4IXdfsl1zbqQhczAjnZHSa3IHVc1509Q2nCiyoITHBkRVri4ihY?=
 =?us-ascii?Q?I3nLUwKOL8DJAxaliRE77qIid9cg21vexXcBoy+ZrhrXNwY4zraFj7JQHgqi?=
 =?us-ascii?Q?Spl+BmHjU/VN3ZWxnUJHcxgiyVYdfnQvjmPy6Jrcb/MfshuovfkwHtIwU33C?=
 =?us-ascii?Q?PuWVqsSRKH8et75whJKe0DLE5QHNvkS6M3sVs+gwTOq9/Q72ZSEbyOcascB1?=
 =?us-ascii?Q?Wb4Z0/HPiGCu5OsezFiZwIbOQVhcqHy3epUL34ZYl8f+nKz4UkIQ7qc0mqxE?=
 =?us-ascii?Q?hwgoFMhY6FkyWlOjdKnT4C6znK9gkhGg9BqMojX3OUFLdWBZvnhZYIkd4buE?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0b9c6a-0622-4894-87b1-08dccdc9ffa3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 16:44:24.2630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTxEKVJNOlhMtC7UglWM2g2Z7Cr/mVwIu3OFbf+zPfBmaA6eUfH+0ZxAKASBLAOlCS9xcjkfXCFMn7K1JlDMz46gnAi3As1I2ewEv+X5OZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
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

On Thu, Sep 05, 2024 at 05:00:50PM GMT, Maarten Lankhorst wrote:
>The previous change ensures that pm_suspend is only called when
>suspending or resuming. This ensures no further bugs like those
>in the previous commit.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/display/xe_display.c | 53 +++++++++++++++----------
> drivers/gpu/drm/xe/display/xe_display.h |  8 ++--
> drivers/gpu/drm/xe/xe_pm.c              |  6 +--
> 3 files changed, 39 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>index c0e9aa7a274f1..33071ac3bc12d 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@ -310,18 +310,7 @@ static void xe_display_flush_cleanup_work(struct xe_device *xe)
> }
>
> /* TODO: System and runtime suspend/resume sequences will be sanitized as a follow-up. */

not sure what the TODO means... nuke? or at least remove "as a
follow-up" and explain what exactly is missing/broken.

Anyway, unrelated to your patch.

>-void xe_display_pm_runtime_suspend(struct xe_device *xe)
>-{
>-	if (!xe->info.probe_display)
>-		return;
>-
>-	if (xe->d3cold.allowed)
>-		xe_display_pm_suspend(xe, true);
>-
>-	intel_hpd_poll_enable(xe);
>-}
>-
>-void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>+static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
> {
> 	struct intel_display *display = &xe->display;
> 	bool s2idle = suspend_to_idle();
>@@ -356,26 +345,31 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
> 	intel_dmc_suspend(xe);
> }
>
>-void xe_display_pm_suspend_late(struct xe_device *xe)
>+void xe_display_pm_suspend(struct xe_device *xe)
>+{
>+	__xe_display_pm_suspend(xe, false);
>+}
>+
>+void xe_display_pm_runtime_suspend(struct xe_device *xe)
> {
>-	bool s2idle = suspend_to_idle();
> 	if (!xe->info.probe_display)
> 		return;
>
>-	intel_power_domains_suspend(xe, s2idle);
>+	if (xe->d3cold.allowed)
>+		__xe_display_pm_suspend(xe, true);
>
>-	intel_display_power_suspend_late(xe);
>+	intel_hpd_poll_enable(xe);
> }
>
>-void xe_display_pm_runtime_resume(struct xe_device *xe)
>+void xe_display_pm_suspend_late(struct xe_device *xe)
> {
>+	bool s2idle = suspend_to_idle();
> 	if (!xe->info.probe_display)
> 		return;
>
>-	intel_hpd_poll_disable(xe);
>+	intel_power_domains_suspend(xe, s2idle);
>
>-	if (xe->d3cold.allowed)
>-		xe_display_pm_resume(xe, true);
>+	intel_display_power_suspend_late(xe);
> }
>
> void xe_display_pm_resume_early(struct xe_device *xe)
>@@ -388,7 +382,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
> 	intel_power_domains_resume(xe);
> }
>
>-void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>+static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
> {
> 	struct intel_display *display = &xe->display;
>
>@@ -422,6 +416,23 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
> 	intel_power_domains_enable(xe);
> }
>
>+void xe_display_pm_resume(struct xe_device *xe)
>+{
>+	__xe_display_pm_resume(xe, false);
>+}
>+
>+void xe_display_pm_runtime_resume(struct xe_device *xe)
>+{
>+	if (!xe->info.probe_display)
>+		return;
>+
>+	intel_hpd_poll_disable(xe);
>+
>+	if (xe->d3cold.allowed)
>+		__xe_display_pm_resume(xe, true);
>+}
>+
>+
> static void display_device_remove(struct drm_device *dev, void *arg)
> {
> 	struct xe_device *xe = arg;
>diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
>index 53d727fd792b4..bed55fd26f304 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.h
>+++ b/drivers/gpu/drm/xe/display/xe_display.h
>@@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
> void xe_display_irq_reset(struct xe_device *xe);
> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>
>-void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
>+void xe_display_pm_suspend(struct xe_device *xe);
> void xe_display_pm_suspend_late(struct xe_device *xe);
> void xe_display_pm_resume_early(struct xe_device *xe);
>-void xe_display_pm_resume(struct xe_device *xe, bool runtime);
>+void xe_display_pm_resume(struct xe_device *xe);
> void xe_display_pm_runtime_suspend(struct xe_device *xe);
> void xe_display_pm_runtime_resume(struct xe_device *xe);
>
>@@ -65,10 +65,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
> static inline void xe_display_irq_reset(struct xe_device *xe) {}
> static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
>
>-static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
>+static inline void xe_display_pm_suspend(struct xe_device *xe) {}
> static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
> static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
>-static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
>+static inline void xe_display_pm_resume(struct xe_device *xe) {}
> static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
> static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}

Awesome! Let me offer you a virtual medal of "making our internal APIs
suck less". Even if we still have that bool being passed around it's
well hidden in drivers/gpu/drm/xe/display/xe_display.c.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 9b1204db12c3d..960ed50e3a41b 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -123,7 +123,7 @@ int xe_pm_suspend(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_suspend_prepare(gt);
>
>-	xe_display_pm_suspend(xe, false);
>+	xe_display_pm_suspend(xe);
>
> 	/* FIXME: Super racey... */
> 	err = xe_bo_evict_all(xe);
>@@ -133,7 +133,7 @@ int xe_pm_suspend(struct xe_device *xe)
> 	for_each_gt(gt, xe, id) {
> 		err = xe_gt_suspend(gt);
> 		if (err) {
>-			xe_display_pm_resume(xe, false);
>+			xe_display_pm_resume(xe);
> 			goto err;
> 		}
> 	}
>@@ -187,7 +187,7 @@ int xe_pm_resume(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_resume(gt);
>
>-	xe_display_pm_resume(xe, false);
>+	xe_display_pm_resume(xe);
>
> 	err = xe_bo_restore_user(xe);
> 	if (err)
>-- 
>2.45.2
>
