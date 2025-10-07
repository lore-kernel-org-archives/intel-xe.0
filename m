Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5256CCCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 22:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C4410E0F3;
	Tue,  7 Oct 2025 22:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goYVIlf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFB810E0F3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759877101; x=1791413101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6pNlbyzI789uff3v+xiNYqacNr9/yChr3aVxCV4ZpNY=;
 b=goYVIlf7SFlxqFWXSWbhQfu6KCVsAvJuVNrWEAugDJHqsu6fwERCitMh
 zKWdRWG1npoCVTHM5fZahnSDR146VBc6OCGnv8yppau1z9OoyrSXUpx0K
 8HuRy0CzFmXsi8fN9i79kIm2paP+/8tYxM1xqJwDeEMYIYQcOMeSWyYxG
 mT8USDxBH+eglDzlDBmWs+BDveDUV3biXGnOtzzV4+p2CZ+F0qMqVGvzC
 o1xzVWyKH8PB8QvVX9e54cLCjqDclVaRe3IlpXXaFB61Zi/723nDyO9sE
 AeiJ/M4qNt/yoLyNeFqltrdYqwrz7ABupixNQ/BAJp2+Pi+UzPDZb8pj1 Q==;
X-CSE-ConnectionGUID: 84xnd5QQRs6U7eviWb9n7w==
X-CSE-MsgGUID: bXUHaSh1QZyBKDRMborxOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="84688072"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="84688072"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 15:45:01 -0700
X-CSE-ConnectionGUID: TX6jHbiCT9GIVai6aGNsgg==
X-CSE-MsgGUID: i0EuE0JvQs2jxMIcWKgbFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179874529"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 15:45:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 15:44:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 15:44:59 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 15:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyFeTlu/HDmnSgIqx+3Po9W4IEGKsT9whfa7X+cqTraIviT82Hmb3/tefh2iqBeIbg5hhKv+zahjtkxtFeSEVMk3Zq8+r+kwBVp86CNsoTnnf+vmUXjIJw3EnomWOl/EWXJ1SIGgRmLgTqPDX7BKOveBvyF4tru1VCVPIX78TGc2tacQc8OrZVUgHRmidJxd7G+Qfgq7tg5D0VVAbZhaxv1M3DRr7dyqCm/POM+lusq5pfV7ZS44wHp13iYNubkDK3l5r9CZP76BWvdru9I0EZZlnJDo9E7tczaxSm6X0+GEGzLuTAS7riQDNdTN7H9D8kQSj4FCe8CYf9W1FFUXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWuf/oK6CR4FAQaVs6f3HNylessYZEknPmd+2sOSx3Y=;
 b=sp4WM199YQF9GzQzY1yvMdZIqVHY+TMqixHE1kwGwmsuPjdbm+nq6ncb2dAYjk//sB3Hd35wF6vYgm+q0Ow2mwvIh7iLXLK8+9nuxp7AH56/6tnnsfZtXOxB0lwvTGEvtJ+yBrvEP1ib4FYJ//D8dV4J8iX+H+uR+Y1/snnw6b+5dcD2syJXTcw29ujy4JAElUEY5g77BtaB85W2PxqXgVxwB9jEzAoLzFxfDwAA+f64X+ZoW5YRVB8VJ3wYlkEnV1n15lOThPo5gLY9I/qUuCURV14djbsIQxlBuVn0CVZX9QpSo2txAtBPhJ7C8W2wdawbhi/4XrvaVT2JlS/LZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 22:44:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 22:44:53 +0000
Date: Tue, 7 Oct 2025 15:44:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 03/23] drm/xe: Move 'va_bits' flag back to platform
 descriptor
Message-ID: <20251007224450.GF5409@mdroper-desk1.amr.corp.intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-28-matthew.d.roper@intel.com>
 <zovx5tsl5jbxl46r7dd6xhf7o2364fmszcnowp4tyo33zwy4to@akwerhv2x7un>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zovx5tsl5jbxl46r7dd6xhf7o2364fmszcnowp4tyo33zwy4to@akwerhv2x7un>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c6a4ce-3f11-44f0-71f4-08de05f32184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CWGR5NPsjrPqN3vcpLdleAk8OENB3ApBRZ9yhGv3XVVEemwq+dEE3qWDOrC3?=
 =?us-ascii?Q?d/bPEbWJe4uSK+LEiKwzzt7sAotnXW5jD7t8yNb+fmy+C58QNbKSnt0lSz+O?=
 =?us-ascii?Q?E5IpUjw77tw1KATlMwHaBwonfRtpfldiaHW0T4k08uqkEAmpoZU4ZsN7Hx4B?=
 =?us-ascii?Q?Ro0Zsrlt17fHdEPsJPalzLMg0l5cFbz5t1qYZWYzxxryFEO1jVqXueeHOsXy?=
 =?us-ascii?Q?fmK5ruq2d9683DsSK3SZzzArzvVqeHZnLvQjPwCrC6MPfa1b5088xjrtn/47?=
 =?us-ascii?Q?E0Yga0XBQ36hBYWJgAMjY7dtDGGjw/kBvseu6cPgQl87kuu44fCY6WrVBh1D?=
 =?us-ascii?Q?SyJXLet2eJbxzfB2T4qGFZjvREEqSMIzX4xWBV4jAOdmFsl22zffhtHnxEWX?=
 =?us-ascii?Q?EfUpSGrZdeOeBLzuAnCa0IgNb1gkongaQov/yuoybj/1D0kwk6tTdQ8S0xIB?=
 =?us-ascii?Q?WN9q+OZDCloN4ZQbrajdobtB4dwptZ5n4SVm8thPiE58rrASBJDCnJUjySgp?=
 =?us-ascii?Q?BnhDOZL/SWLUCR+k/bxY1vkhsdKmdacvzNRK+NtgewLTUQ8U64yW6V47sAAz?=
 =?us-ascii?Q?mSmnvfNa+c8bWa4xYX/DF2Id5DXIp2SQNMzF0zwemHi/NbTCXdBA2A0lX5D3?=
 =?us-ascii?Q?9n/bky+Ap0JK9gaTPE6c6W77p4kodEuQ6IY0OKj65grlvxVnl3XyKiIKiGNq?=
 =?us-ascii?Q?UHlRhK6nbEWBtMV26UcPx3L799JveqUuuyD36pY8RyORqOIBN+rWc50Mo7Ka?=
 =?us-ascii?Q?gH9SE9FS1ypYPPvDVngZsx+ew+YTmaujZvnozNyEXDD564J7GYGrvgeXpeoR?=
 =?us-ascii?Q?A2wGlzLEFNZWZJchTXDsIaiImpdp5j9h8ytXZYLdebGKseICCNQxFOUfPoLP?=
 =?us-ascii?Q?GCqfqaVVySpmI2PdTzeD46PrrsRbkEtBRRt6sKlBL7FIHPXAFbi6nPwJMvEE?=
 =?us-ascii?Q?CQWJijFQS+7tBxQip3rybUDzlf0FFUDVAUXOONbe28GBt19Lvw+bVkvwzXiK?=
 =?us-ascii?Q?Rd7Kny/ExuyMD2sxKTy+ygovZFNNvsiPkzR5u2iCHylN8n0BczEUkeNhJA7+?=
 =?us-ascii?Q?Fn0ITb7DJXMBdfS2NrxFIGuDKHXOpROiG2RHb3jKmQa1OgwWEqucD9tiOMor?=
 =?us-ascii?Q?/riugTc8BCAXZyDSq4uZ5UhZG8RZRypxPysr5byzCpsJIO1no8bDhXHcG7oK?=
 =?us-ascii?Q?j2PYYAjD8P2/QWZizSskKNlm1wetyq4terUVZccH8y5SEYSToFfWKHdzRmcd?=
 =?us-ascii?Q?Pxp7A7rsImvXPvaGDDXM2ygeHPmSx3cCJLhQg+9BZzemgXQeViGS9/WXcyX4?=
 =?us-ascii?Q?z1nYuuEkWs2lp6asjGH/3DJMuzcUTauduN/vTvZdSCHQcZjRI2y7tCNCj6r/?=
 =?us-ascii?Q?RjUryGF5A6eV+a87fIXsac3H53JBqmSsuuKAme1rxQC+tfIl7ru7qrTpLoVj?=
 =?us-ascii?Q?PJ9KbGni2ft08CHWSEt+55GkLpZqhYRE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5xTI12CE3DBQOuUlxNAa5gDRTvqlbJ/oYABExZk9zU+3iZJf43BLaWcSfIk7?=
 =?us-ascii?Q?DNav5ZystLh4qUdD0RPp+9+nC7m+Fzlp5+m+Rx7sW9RbJJKTD5qnUHcIBNZE?=
 =?us-ascii?Q?eXyITMeOiCMgQeezaqHEk03oHUiaEJ2BnvCUJM+l5DBrBtnaAR3JZX+PTjH2?=
 =?us-ascii?Q?FE3ttoIbk0dblewl2JGwFDoJl9GaquHBFRxg5elVYL2fkLBh8FdbMM8BT6B2?=
 =?us-ascii?Q?rOaMkDmEypm2k9jCVeUvD+AxAjvGh7pmt3EqXAQpnzXaYl7hiX4pC3FSPZWu?=
 =?us-ascii?Q?rQZ4vRl0N+AdyXMifaL+8nsv/6VUKXspiRdjqGmVcQDWj5za0fdfXg609WU/?=
 =?us-ascii?Q?8J91WMvSSIWzUuRlXkHldcxvfTbpWOQZF08AxKxjUmOKqpj4peIjR4JIjPXI?=
 =?us-ascii?Q?tuYPYtw/FD+WGu5N6qT8eHD4p6L5c89YGQ8r474htlgeT2/J8k4EgT++xvXm?=
 =?us-ascii?Q?NM3UwNwXfxoB7cpivoP6b0F4gzwbJOBT4ADsUUtJw33CcriEcPYxiXGzqFHS?=
 =?us-ascii?Q?zAHrRYx+weCE+c76E2Xge9w+n2FKElZBgXvoAlTbVdllcdh5OhWhGvAknktX?=
 =?us-ascii?Q?Gs0XIyo8y0+XyHTMwhp8Bb3aFB60MFeaji0FMo276LWKlh1nuAfEYpDEjJCo?=
 =?us-ascii?Q?Qe5QvdCtQksB8A/W/0Md2sQDAlm2eG8sLRSzKsYdoAkDw1RhbJlDTA0lQAJH?=
 =?us-ascii?Q?sPjXAHTm5aO3Q+5Ad2JHLvj4n0nNZeK8bzc+W7PENnSIjNqEcRFMsjGcfoMN?=
 =?us-ascii?Q?FJhbU/rc5tfJk8KtmagcZnYiWkbnDe1f9y5ivFA6Ak22og0NS9b9IqLyuN5P?=
 =?us-ascii?Q?A+khUmkXik1p7NzeCDV0MX4hEb805sOaFwVzvwDhMXErXL/N2k88jiDlTam0?=
 =?us-ascii?Q?1WOlxSbaKdvDD8DLHNBJocanF2nvWsvbn30lXoF86Oj46zQ7OrFM1dyunnYF?=
 =?us-ascii?Q?7SIyqgfKX6qZ328VeK/7yRX9NtnxBe03ASmXl8UwCE3Sqjl8D5xaNLyXRvcf?=
 =?us-ascii?Q?K6tFPJiKHOLdXxnkgp4TXoP2NgOHNYODZp1eP4yPQGC622Woi/PAx7F233gc?=
 =?us-ascii?Q?FJ6CfD739d99rQkrGvIGvEREhK3iUaJ4MeTRm26qW6HROWvq+dBZrw28udMo?=
 =?us-ascii?Q?4oLnPM2dxXYV+fT4g2eYxDbISQd7ypjfvfC9Oh3cXGI69YcJYDURoMUkNuKQ?=
 =?us-ascii?Q?fGb8Tfxi6CymJoh4i13X0kiDnug/e7fJ4+OWLtwfQC6mrNkbhnVypaiHEgb+?=
 =?us-ascii?Q?5Dwy4vfzIxb1+1XgRj9he8xfzs7H5+nGGPtltuff6oPDx4Tllx26Yxi9BEAL?=
 =?us-ascii?Q?EL4ZHcCEIXBefLqH5TqpAFnBsGQHAT/RE/Q97e9acKWNvJLamb4iG98/nkIV?=
 =?us-ascii?Q?43jrgnENC/jMaL1bC/s28lB1tb2HrZoFydmMQ1bEaJOSl9GJnprFgLrnkVB0?=
 =?us-ascii?Q?c8haI2RW/5vt7wrLwS3gicceMNSGuxeUUkzWB13DpX9XdiIYq+hQOkTRNsVS?=
 =?us-ascii?Q?Uun0XXaqqsFuPvhBLmtiEg/IYnCjnc4MiD1hoyLRqBtAq3ZgF0IFMFZPP1m4?=
 =?us-ascii?Q?flzKfJS1Y5a3PQ0MKdk4581hYgZf/RWgLrSEvdtY5/vZ9RRcH3fRG7diW0Nd?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c6a4ce-3f11-44f0-71f4-08de05f32184
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 22:44:53.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU/8yGgs8PE/HuTdt9LJqVT2WjEUtFizKtBZMmUfI3smKam2cdFH+iv7Qqw0x1/vCP6TKhVbDzd368jIdYjjKYjgkG5lKxOGQZ0Menp3ytA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
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

On Tue, Oct 07, 2025 at 05:02:57PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 07, 2025 at 01:48:33PM -0700, Matt Roper wrote:
> > The number of virtual address bits is something that should be tracked
> > at the platform level rather than the IP level.  Even when mixing and
> > matching various graphics, media, and display IP blocks, the platform as
> > a whole has to have consistent page table handling.  This is also a
> > trait that should be tied to the platform even if the graphics IP itself
> > is not present (e.g., if we disable the primary GT via configfs).
> > 
> > v2:
> > - Drop the default value of 48 and explicitly set it in each relevant
> >   descriptor.  (Lucas, Michal)
> > v3:
> > - Drop an outdated comment about default value.  (Michal)
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pci.c       | 21 +++++++++++++++------
> > drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
> > 2 files changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 3f42b91efa28..69ed987fef67 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -52,13 +52,11 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> > static const struct xe_graphics_desc graphics_xelp = {
> > 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
> > 
> > -	.va_bits = 48,
> > 	.vm_max_level = 3,
> > };
> > 
> > #define XE_HP_FEATURES \
> > 	.has_range_tlb_inval = true, \
> > -	.va_bits = 48, \
> > 	.vm_max_level = 3
> > 
> > static const struct xe_graphics_desc graphics_xehpg = {
> > @@ -84,7 +82,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
> > 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
> > 
> > 	XE_HP_FEATURES,
> > -	.va_bits = 57,
> > 	.vm_max_level = 4,
> > 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> > 
> > @@ -108,7 +105,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
> > 	.has_range_tlb_inval = 1, \
> > 	.has_usm = 1, \
> > 	.has_64bit_timestamp = 1, \
> > -	.va_bits = 48, \
> > 	.vm_max_level = 4, \
> > 	.hw_engine_mask = \
> > 		BIT(XE_HW_ENGINE_RCS0) | \
> > @@ -174,6 +170,7 @@ static const struct xe_device_desc tgl_desc = {
> > 	.has_sriov = true,
> > 	.max_gt_per_tile = 1,
> > 	.require_force_probe = true,
> > +	.va_bits = 48,
> > };
> > 
> > static const struct xe_device_desc rkl_desc = {
> > @@ -185,6 +182,7 @@ static const struct xe_device_desc rkl_desc = {
> > 	.has_llc = true,
> > 	.max_gt_per_tile = 1,
> > 	.require_force_probe = true,
> > +	.va_bits = 48,
> > };
> > 
> > static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
> > @@ -203,6 +201,7 @@ static const struct xe_device_desc adl_s_desc = {
> > 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> > 		{},
> > 	},
> > +	.va_bits = 48,
> > };
> > 
> > static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
> > @@ -221,6 +220,7 @@ static const struct xe_device_desc adl_p_desc = {
> > 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> > 		{},
> > 	},
> > +	.va_bits = 48,
> > };
> > 
> > static const struct xe_device_desc adl_n_desc = {
> > @@ -233,6 +233,7 @@ static const struct xe_device_desc adl_n_desc = {
> > 	.has_sriov = true,
> > 	.max_gt_per_tile = 1,
> > 	.require_force_probe = true,
> > +	.va_bits = 48,
> > };
> > 
> > #define DGFX_FEATURES \
> > @@ -249,6 +250,7 @@ static const struct xe_device_desc dg1_desc = {
> > 	.has_heci_gscfi = 1,
> > 	.max_gt_per_tile = 1,
> > 	.require_force_probe = true,
> > +	.va_bits = 48,
> > };
> > 
> > static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
> > @@ -265,7 +267,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
> > 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> > 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
> > 		{ } \
> > -	}
> > +	}, \
> > +	.va_bits = 48
> > 
> > static const struct xe_device_desc ats_m_desc = {
> > 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
> > @@ -303,6 +306,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
> > 	.max_gt_per_tile = 1,
> > 	.max_remote_tiles = 1,
> > 	.require_force_probe = true,
> > +	.va_bits = 57,
> > 	.has_mbx_power_limits = false,
> > };
> > 
> > @@ -314,6 +318,7 @@ static const struct xe_device_desc mtl_desc = {
> > 	.has_display = true,
> > 	.has_pxp = true,
> > 	.max_gt_per_tile = 2,
> > +	.va_bits = 48,
> > };
> > 
> > static const struct xe_device_desc lnl_desc = {
> > @@ -323,6 +328,7 @@ static const struct xe_device_desc lnl_desc = {
> > 	.has_pxp = true,
> > 	.max_gt_per_tile = 2,
> > 	.needs_scratch = true,
> > +	.va_bits = 48,
> 
> as a follow up, maybe do a s/dma_mask_size/pa_bits/, so it's easy for
> people enabling new platforms to reference e.g. bspec 70817 where they
> are noted as "Virtual Address Range" and "Physical Address Range".

I'm a little bit hesitant about making that rename, because the reality
is more complicated and confusing than that.  For example, bspec 53650
will tell you the physical address range of ADL-S is 46-bits, but we
still need to limit ourselves to 39 bits in the driver.  We were
confused during early ADL-S enabling because we thought the 46-bit
address space in the spec meant we should just set the mask size to
46-bits, but that caused a bunch of DMAR faults.

Rodrigo eventually tracked down a hardware architect who gave us some
more insight into what it all means at the platform level.  If I
understand correctly, the host physical addresses are indeed 46-bits
when MKTME + IOMMU is in use (HPA[45:42] is a MKTME key ID and
HPA[41:39] is always 0).  However that's only really relevant to the
IOMMU and hypervisor in those specific configurations.  Guest physical
addresses are still 39-bits, and when MKTME is disabled the platform is
limited to 39-bit addresses.

Basically the real details here wind up being a platform-level thing
that isn't always clearly documented or explained in the bspec.  Simply
taking the single value that the bspec calls "physical address range"
(with no other explanation) and plugging that into the driver sometimes
isn't the right thing to do.

dma_mask_size probably isn't the most descriptive structure field name
either, but at least it matches the Linux DMA mapping functions that we
need to call during init.


Matt

> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > };
> > 
> > static const struct xe_device_desc bmg_desc = {
> > @@ -338,6 +344,7 @@ static const struct xe_device_desc bmg_desc = {
> > 	.has_sriov = true,
> > 	.max_gt_per_tile = 2,
> > 	.needs_scratch = true,
> > +	.va_bits = 48,
> > };
> > 
> > static const struct xe_device_desc ptl_desc = {
> > @@ -347,6 +354,7 @@ static const struct xe_device_desc ptl_desc = {
> > 	.has_sriov = true,
> > 	.max_gt_per_tile = 2,
> > 	.needs_scratch = true,
> > +	.va_bits = 48,
> > };
> > 
> > #undef PLATFORM
> > @@ -584,6 +592,8 @@ static int xe_info_init_early(struct xe_device *xe,
> > 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > 
> > 	xe->info.dma_mask_size = desc->dma_mask_size;
> > +	xe->info.va_bits = desc->va_bits;
> > +
> > 	xe->info.is_dgfx = desc->is_dgfx;
> > 	xe->info.has_fan_control = desc->has_fan_control;
> > 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> > @@ -713,7 +723,6 @@ static int xe_info_init(struct xe_device *xe,
> > 	}
> > 
> > 	xe->info.vram_flags = graphics_desc->vram_flags;
> > -	xe->info.va_bits = graphics_desc->va_bits;
> > 	xe->info.vm_max_level = graphics_desc->vm_max_level;
> > 	xe->info.has_asid = graphics_desc->has_asid;
> > 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 9b9766a3baa3..796439571abe 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -30,6 +30,7 @@ struct xe_device_desc {
> > 	u8 dma_mask_size;
> > 	u8 max_remote_tiles:2;
> > 	u8 max_gt_per_tile:2;
> > +	u8 va_bits;
> > 
> > 	u8 require_force_probe:1;
> > 	u8 is_dgfx:1;
> > @@ -51,7 +52,6 @@ struct xe_device_desc {
> > };
> > 
> > struct xe_graphics_desc {
> > -	u8 va_bits;
> > 	u8 vm_max_level;
> > 	u8 vram_flags;
> > 
> > -- 
> > 2.51.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
