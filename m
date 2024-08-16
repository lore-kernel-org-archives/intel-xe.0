Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBE9C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 18:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E2110E815;
	Fri, 16 Aug 2024 18:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdRj9QaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CED10E815
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723831820; x=1755367820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I52yva/gdSEZvzYWwP+zRDCDqyVkRUKIzf/i9XZV8jw=;
 b=IdRj9QaK89/yvFtCdJD7IBG33mZLKEE8SUjUbginXld1fLQjMMC3R7ja
 nlytkTtNQv1Cw+wBkYk/3y+5yr+NNcrp7iV+j2HXJB+4NWDpV77rXTLrm
 62UIQU2Cap4rISAmdQlPwuD7iwVDbWrbrlKJtSNQngWrNbBPbXCafM7yi
 fU0f89hxR7aUOmxLFQd+Q73tAJgrRBuDQxB/CUZE0ltliebsugrVXrNna
 Lb5xmBfApFyrQJgY9c93jCpp0Hx2Qp7KlZS5lxGUbRyC9K36mAdZdBaJe
 8ST/9GyRCafLFEjYsGV3b5MVwTSaM+qKbmRGGvHVCdcSFRf54ha+Lg69H g==;
X-CSE-ConnectionGUID: CcON4m6CSEKHE+e6v4WOKQ==
X-CSE-MsgGUID: D0U08kvhQbG6I/I3Qw6Crw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21947853"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21947853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 11:10:19 -0700
X-CSE-ConnectionGUID: nWnBQ/UBRXWxAtT/vXqb4g==
X-CSE-MsgGUID: mS0L6FZlQJ+CJb4VOB8qGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59585809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 11:10:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 11:10:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 11:10:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 11:10:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 11:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7WEF3vFA6eHtG2PuOL69Q3uD+aKhMmTQKhTkDnannPgTjWRYguSmoUfE/+qKJdth7Qm5YnagdEVbcMRJiCJdPoZzPbKUi8A4fVJ1Du7wbbjrueKNDa1slnlpNyilU+kYH6qjCzYQcTEW6+a13oVcWolW1d4RDEf62qcAEKCU/zjh0MwRRyY/WZ6VNfe9C5QTB+6e003wbMHEb+c7oi2Yq1bWEwD1ns/o23GzNuzuunCYEd/q2CHSrN3r2kHKCHtBe24H0PcZTgsAGbj4FflqVhUruO5iXnotLQW6mLA/WX/Q/J5SP28gqhWeivCzDga4tFvuGCTzSobbX4SP9gtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWnOTYGc6uERcqlJR3E1ME2BCWJKYHWTmL5JJy1hxTM=;
 b=wOJmeMNFlaYSsxAWXJRUImAOHV2docLK6LoKVMd8JPd+bVnJ3X6SQO5UITJfXdI3PziQjEFWtcqB1yPx8ZrLHFlMjoclrfXfkxT1iLT8imZdzyPjnwOr1f9RwZoxx6WqzPGwS3+xGczlwQpP0ka+0JEQ4mBwCwKkSxDinPzgtKQae0pFPwNkEkSP8R11rPLmIdX7SZC2y6xLZF0Cf7PB/FJnPzpdSmxlger859u013ZK2Hwld2R7OfeEtTH5n3OQRBnpD96rsQXWbrjgJQEKmneGk2PHsLqMZHklLKnUvuIft5HzIgrb93VznrPPDGfklXNsAthvAAnJjdE7N+F2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 18:10:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 18:10:14 +0000
Date: Fri, 16 Aug 2024 11:10:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Message-ID: <20240816181011.GK5091@mdroper-desk1.amr.corp.intel.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
 <Zr5gTbtkpfqlGgsx@DUT025-TGLU.fm.intel.com>
 <20240815213837.GJ5774@mdroper-desk1.amr.corp.intel.com>
 <Zr622GVl0utsp1ui@DUT025-TGLU.fm.intel.com>
 <9417b5b7f55c9ff2283820b5afd94efacfeeebcf.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9417b5b7f55c9ff2283820b5afd94efacfeeebcf.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4953ad-cc77-42af-89e3-08dcbe1ead3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AcPHpa7cKJsY93mZcGYksfkJrFVNYcrSphhDOx9TQjJIVs4VZNXqSa9+iDne?=
 =?us-ascii?Q?nv9T+vGkWbM14AOjVwYdLYYWl4GTjOHoElzywb/Q4fAOjWmhLfnDVQSnub2M?=
 =?us-ascii?Q?oqzJJMC0gjzzgNDnCoMDmzGvqc1wlmiXp6bT7UeZN4soQg4Ng/kPEZvXcxVI?=
 =?us-ascii?Q?O1GGYHR5GIFImUJrF70unoLBHMfOKH1f9EjnmN4elqmkU9MdX09kOJ/8t4jb?=
 =?us-ascii?Q?0OJ+JCGKX1SkhFWc45TKx/uxUfb4UvlAaLsomvTsjOY/0sZ1z3igbmsReiC6?=
 =?us-ascii?Q?ScI7eUCkEiYOhwxOpSwfp48k4+IO4ZWBWpmDdoSvK75SB49GGAWCIny3hrnf?=
 =?us-ascii?Q?BOqxENg/O8R/rg9R7vEZt215PI41/pzAiUkZn4yPZaosYSN2X4BFqE5NNyn0?=
 =?us-ascii?Q?l3YZjjHyeWe4GDloYp+fM5JFTgCCLhSiNPbi2jdCt7TmzBRp1s1V8WW8MKjy?=
 =?us-ascii?Q?pnD7FP+e7+muHpafJTl9dhLTxrJ6GJ3ifL571tOpH4MQbt3GSkSx57lPxsE6?=
 =?us-ascii?Q?oiiIwZntJeERgR3pF7WU7BIOGmO7BwFRBXKqc/nKQ28PG+aO1wC3gEx53Bkh?=
 =?us-ascii?Q?JwxA1UqpPk60nfqKLRwM5ZcEPQjf8lC4OOSZ6Ypvtn4p69pXLlFRI51LvkrY?=
 =?us-ascii?Q?nPB712SDBS9VAkNGc/LSmyC44CmA4d/AfBE337CAGaETOgORbflD9H8f4Qo2?=
 =?us-ascii?Q?gEgnzxQR85+HonyoWvwmJN1lo6cU3zX47/37FJgYzZG5CyKI79iUesSWAogn?=
 =?us-ascii?Q?MgeK+lSM2sGq4GIVZpuLgZywFHihNP2FwbnfqErhVxGCnsFayJtPfWhNt6Wj?=
 =?us-ascii?Q?pHPbd3UL102LupKCH8tyzT1YPnoHVdDkYBH4UXxhIJH22ApD20IUUC8rnlMM?=
 =?us-ascii?Q?DJ64BBDldew2F01iMLlVmzoR53uj2SYY+NPMCCTOPh+H+8OCcGhKy9l7BpEx?=
 =?us-ascii?Q?D9yzUlcrtRBChSfYDPll1ubkJB0560oEAMKm+8uVUY72UKp6mDWTZEChqGpr?=
 =?us-ascii?Q?WUSbeObh+/aoeRb10Noqh14X3uxzq0s82B3y5FjYEnBar7Bc5RkugNaPEz4q?=
 =?us-ascii?Q?LMfWarGRWtZY9/aDV9wAnouQ4rCFSc8tmyFIHjoJibZTUo91S2zkfnozn6sz?=
 =?us-ascii?Q?az4xGgUaGgky6grtTDajhfa5oStJ9lfC/Pz6vqw2kjDeI+1HNQk6UG03AR83?=
 =?us-ascii?Q?qfA9FgVIrzd0LLGoWN8+lz1BnUSXvFHfmiy4SpzPhJ6bqTpYBQtppanFlGY8?=
 =?us-ascii?Q?BA+8c7J/KgnRJbGoKCBjXh5VYFbjshZBuB92sgMJ7Br6RPRw89M+XdDS+tTt?=
 =?us-ascii?Q?vkh1Dg9GaOkNpFxUTdiNWtbWRSpnOQwsEXyVN3AHRdKURg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6YoAQ7Dxs/ruNn3+tcuX6+Qg6ZD8BPZ5j9pu9xHVt7IaFrQjnmnaFv/8FXdi?=
 =?us-ascii?Q?PZAri8bLudG4E68h0eNdbiUHsjVVknm0+M4SMifCtJkFpgaKnKYaa/zInVGU?=
 =?us-ascii?Q?E1pvgabRLmN2dvc77CpvHPYX1RzG18uoyzHnOAYCKz0P01FBb/1ebx5dm07H?=
 =?us-ascii?Q?7cdIk762K6Bz9Rkgju0Yjsehg/H5kM3zm4k2kOmUNXxEsBUwueM01pxE3G54?=
 =?us-ascii?Q?8NeZcBLr1mB0el5RXVtsiLSYeNkNeeVYUm3vjE9PiqR9V1vkceNbIYUiF3Ha?=
 =?us-ascii?Q?qbPKuO4GkdtzdSDj66tcyz7b3g919jafPi57/JP70yN0VE6NV8bkVkRJJnb/?=
 =?us-ascii?Q?EMKn2XadNv+IcYtcC4YSXBIl2MYPn7sTGzgPPz4oHZsTSKn8qO5LdGdsMw3e?=
 =?us-ascii?Q?ZafcRjURimdDPfpoJYXcRwHeBxtKOlq+mGuwIvguCfnFKurKRUzH1bMqXtwY?=
 =?us-ascii?Q?mbm9nSh1tunhxovvJol8Juq4uI/oOEB1Sqwl3tKy2iDmbkXb6Iii08ygjRsu?=
 =?us-ascii?Q?99TdWDFvnfbh+KIJmBscwl5quIzQTp6BObGvX18Sqyc+yymZKMwMVUuaEFwu?=
 =?us-ascii?Q?L0RJrMhNftl8YxkA2Gco5otC0R1cMZWg6xglo1Mw3xjjLwo+jTfhUb5XrZDL?=
 =?us-ascii?Q?NN1/+jr0Aye+2us1rY/rZEqo6JQ+WnFTG3hwCRLneALHPywflBMZEY/Sn3Z4?=
 =?us-ascii?Q?GUuE3Psd3bilnbMObe4KFhKIVaYiwDguBw+OR7Hii0xqV/gM3c7J1Su1+tRd?=
 =?us-ascii?Q?5SxbynSv4jFupKXUDpURwt+2QtzVdTJlhSy3NIGnQ5hMzOm+ZHgrDPfPxiQ4?=
 =?us-ascii?Q?wnTBl+6IPW4TJ+O4aB+il2FqnY7F2OzAGQRrRuIfbEVA5+4V2vNUJphJlzHZ?=
 =?us-ascii?Q?7DPHvu83Gfj639qEXhQRikSnlXFGWQ/DUDJnoW7/D0+PPTnq3hWwiOqSFLZe?=
 =?us-ascii?Q?6J9q7d2y+JsyIQqQyArz+w14H0pbwJkWUVKWndapvgp2ou1qvLLuZaUFyQ18?=
 =?us-ascii?Q?w/eW0oYvqTzPr7uWBQfsO6BdxAmZW9WKpM1mIXF9CrwDC461nDLyoHp9gLft?=
 =?us-ascii?Q?ZKBn4un20s8J58JE+0vcd8PU19vO4aRIkLdyHVPDutm30TZJGKv/+gic1WkU?=
 =?us-ascii?Q?rhhdBtGcfkABgNLtOWA3vN+jdRpe0Zk27j7sXSv+tDo4sz9m46tr52e0or+9?=
 =?us-ascii?Q?5IHqYStj3rWMbGr9On8FkyxbA2NFQxqkDPCtjsyOVve4AHa+fenwjpmJnoK+?=
 =?us-ascii?Q?qhVsZVAKMus2ZIy1nKsCMSPbNGe44atcFP7bC/uAQxasWJV6X/HiDXhBX+Q+?=
 =?us-ascii?Q?ivANjftEuUs8PlGP3XOSGoxeoI+sdwmCDRGFbsCrPM1sylYFJBb2OXOy6gdA?=
 =?us-ascii?Q?lVf113gCS0DRCjNKScTqmlLlT8Izt+mRPwaDhju4TVWbYQORFRPxrXxHVT4C?=
 =?us-ascii?Q?FecyZyPTbyjEoRDnDjFqWuJBRvEFiSAwEpx7SI0nh7fg4yYUaUhRjEEd+SGN?=
 =?us-ascii?Q?k1pDa/SC8WrW5yvli88NOJXZcuW3vD8+UEZTh1/L6MtSDQAOmyjvZ2I2i6S2?=
 =?us-ascii?Q?jCGz9xSOD3TjCx0iLICMuHbj3b2u2c8Tz3TZkB/Ec0P52MKl++QcuHMBbsAA?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4953ad-cc77-42af-89e3-08dcbe1ead3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 18:10:14.6032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiiju8FTJ/BTYan+y02KznKSYwIomXy1dAuUDwzX0uFfSW+eR9YDshC2gULhxVLEssZpnlLbF6XPUOdZk4ms9m3YoYHox60ArRfUNeENQBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
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

On Fri, Aug 16, 2024 at 06:28:44AM -0700, Souza, Jose wrote:
> On Fri, 2024-08-16 at 02:18 +0000, Matthew Brost wrote:
> > On Thu, Aug 15, 2024 at 02:38:37PM -0700, Matt Roper wrote:
> > > On Thu, Aug 15, 2024 at 08:08:45PM +0000, Matthew Brost wrote:
> > > > On Thu, Aug 15, 2024 at 10:26:03AM -0700, Matt Roper wrote:
> > > > > Although the query uapi is the official way to get at the GuC's hwconfig
> > > > > table contents, it's still useful to have a quick debugfs interface to
> > > > > dump the table in a human-readable format while debugging the driver.
> > > > > 
> > > > 
> > > > Patch itself makes sense. Question though, would this be useful to
> > > > include devcoredump? If so we should code this with the snap semantics
> > > > for decoredump. See guc_exec_queue_print() for an example of this.
> > > 
> > > You mean include the contents of the hwconfig within the devcoredump
> > > report?  I don't really have a feel for whether anyone would find that
> > 
> > Yes, exactly - include hwconfig within the devcoredump report.
> 
> For current platforms I don't see a reason to add it to devcoredump but maybe for future platforms...
> 
> But sounds good to have in debugfs.

Thanks for confirming.  I'll keep it just in debugfs for now, but we can
always follow up with more patches later if/when someone asks for it to
be included in the coredump.


Matt

> 
> > 
> > Don't want to hold up the patch as I said it LGTM but just something to
> > consider and if Jose (or someone on the KMD) indicates this could be
> > useful it is easy enough to change to use snap semantics and wire into
> > devcoredump too.
> > 
> > Matt
> > 
> > > useful or not.  My personal use case is just being able to sit down at
> > > an unfamiliar machine and 'cat' the debugfs to see what the hwconfig
> > > characteristics of the GPU are before I start doing experiments.
> > > 
> > > +Cc Jose for a UMD perspective on whether or not it would also be useful
> > > to capture the hwconfig contents in the devcoredump for userspace
> > > debugging.
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > Matt 
> > > > 
> > > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
> > > > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
> > > > >  3 files changed, 70 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > > index 5125d76ccfac..8f95d3a5949b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > > @@ -19,6 +19,7 @@
> > > > >  #include "xe_gt_sriov_vf_debugfs.h"
> > > > >  #include "xe_gt_stats.h"
> > > > >  #include "xe_gt_topology.h"
> > > > > +#include "xe_guc_hwconfig.h"
> > > > >  #include "xe_hw_engine.h"
> > > > >  #include "xe_lrc.h"
> > > > >  #include "xe_macros.h"
> > > > > @@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> > > > > +{
> > > > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > > > +	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> > > > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static const struct drm_info_list debugfs_list[] = {
> > > > >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > > > >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> > > > > @@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
> > > > >  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> > > > >  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> > > > >  	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> > > > > +	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> > > > >  };
> > > > >  
> > > > >  void xe_gt_debugfs_register(struct xe_gt *gt)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > > index d9b570a154a2..025bad701556 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > > @@ -6,6 +6,7 @@
> > > > >  #include "xe_guc_hwconfig.h"
> > > > >  
> > > > >  #include <drm/drm_managed.h>
> > > > > +#include <drm/drm_print.h>
> > > > >  
> > > > >  #include "abi/guc_actions_abi.h"
> > > > >  #include "xe_bo.h"
> > > > > @@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
> > > > >  	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
> > > > >  			   guc->hwconfig.size);
> > > > >  }
> > > > > +
> > > > > +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
> > > > > +{
> > > > > +	size_t size = xe_guc_hwconfig_size(guc);
> > > > > +	u32 *hwconfig;
> > > > > +	u64 num_dw;
> > > > > +	u32 extra_bytes;
> > > > > +	int i = 0;
> > > > > +
> > > > > +	if (size == 0) {
> > > > > +		drm_printf(p, "No hwconfig available\n");
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	num_dw = div_u64_rem(size, sizeof(u32), &extra_bytes);
> > > > > +
> > > > > +	hwconfig = kzalloc(size, GFP_KERNEL);
> > > > > +	if (!hwconfig) {
> > > > > +		drm_printf(p, "Error: could not allocate hwconfig memory\n");
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	xe_guc_hwconfig_copy(guc, hwconfig);
> > > > > +
> > > > > +	/* An entry requires at least three dwords for key, length, value */
> > > > > +	while (i + 3 <= num_dw) {
> > > > > +		u32 attribute = hwconfig[i++];
> > > > > +		u32 len_dw = hwconfig[i++];
> > > > > +
> > > > > +		if (i + len_dw > num_dw) {
> > > > > +			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain\n",
> > > > > +				   attribute, len_dw, num_dw - i);
> > > > > +			len_dw = num_dw - i;
> > > > > +		}
> > > > > +
> > > > > +		/*
> > > > > +		 * If it's a single dword (as most hwconfig attributes are),
> > > > > +		 * then it's probably a number that makes sense to display
> > > > > +		 * in decimal form.  In the rare cases where it's more than
> > > > > +		 * one dword, just print it in hex form and let the user
> > > > > +		 * figure out how to interpret it.
> > > > > +		 */
> > > > > +		if (len_dw == 1)
> > > > > +			drm_printf(p, "[%2u] = %u\n", attribute, hwconfig[i]);
> > > > > +		else
> > > > > +			drm_printf(p, "[%2u] = { %*ph }\n", attribute,
> > > > > +				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
> > > > > +		i += len_dw;
> > > > > +	}
> > > > > +
> > > > > +	if (i < num_dw || extra_bytes)
> > > > > +		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
> > > > > +			   (num_dw - i) * sizeof(u32) + extra_bytes);
> > > > > +
> > > > > +	kfree(hwconfig);
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > > > > index b5794d641900..7df315900e1c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > > > > @@ -8,10 +8,12 @@
> > > > >  
> > > > >  #include <linux/types.h>
> > > > >  
> > > > > +struct drm_printer;
> > > > >  struct xe_guc;
> > > > >  
> > > > >  int xe_guc_hwconfig_init(struct xe_guc *guc);
> > > > >  u32 xe_guc_hwconfig_size(struct xe_guc *guc);
> > > > >  void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
> > > > > +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
> > > > >  
> > > > >  #endif
> > > > > -- 
> > > > > 2.45.2
> > > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
