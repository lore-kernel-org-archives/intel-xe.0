Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E4C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 16:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B810E293;
	Thu,  6 Jun 2024 16:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVG9K/HV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4D110E293
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717691150; x=1749227150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PciQNM2k7XLVQyu1sl800iV2vswn7tu67hggoKk46x0=;
 b=DVG9K/HVRafzU336Xz2yX0TsSfbhM51YKCk1oA0ertmRYAwmEMekFuR3
 IZ/uz1BpWHhwLQbN/N9SuxlW23eRtp1S8+9E54CNCj1Ex9rH3NFZ39bhl
 b1bHfI2cTEm1JIMHf3nuk8UnWhb+n5jh4P4ikPmLk4LvYZ2wPLxS1ny8L
 IFbqZ+BCvHE1P+WhjZPD3Fdb17L6YmhK07DoD3E9TIRmNkgMXLRjGjnVd
 oafW2af4bn9Dmm91geKautDWreA4oqPH0hJGYUFZ5CXhiRIytURyml7ab
 N9uJKkd75pNZcj/vZ04/HRuPcSILoEPKexTFpsbzoWBJyhoY0HrLcEQMc A==;
X-CSE-ConnectionGUID: 4F5P9xUTT3Wu9sdZKqGfmw==
X-CSE-MsgGUID: 3XrMEOLfSDy2JQe81L8WnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18167656"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18167656"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:25:50 -0700
X-CSE-ConnectionGUID: SxGOpQEHR4mUmbhNHRB1xQ==
X-CSE-MsgGUID: jaxQ16k9RjG1qedMcVvPGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38471315"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:25:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:25:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:25:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5raT8mq0gN0q9wfmnIRNVx6L9RABF1KEzJg7cIV6HqAOK/DHcDgbg0HCO5ODcAhTY5ZmEKqaEK9b+pr5HN880T+LKGCiQSxq/z4wwE3fDeWb8CWfgFddgObxA15hvF7XT5Ceir1fGIs7peEzFk8pgcysmXoINHPOkZxn4FzUTp6MCYqzUg/uywhj2nRKZ7seJ953QMUK5LKIB4CcV8SwI7T9Xww6zDejm5ypZYk73R1cBgHxLhHGFTZ135zWlLshueGm8f/hTNSVnbQ9qoaH/8Pzrcct09WzoGOrAbZxlFMUBUeLyMsEppO0grrwqERoH508V/J7KFibO6PtkoDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJJjIJSz/kSxGkgMArkQaAw+d5Eoqls6tXBD7etWfDM=;
 b=kzJdgW8JcbKNCJ0CL8TTU7C6NfZCXxvWJ7fdn+DnLDOFpbPR6VJKimAw+EKMdXxXi/q8+1j6T9GWZhbO0w8HHesI00X58UaDPMLZKAypPISqMf0qRV4LNx7wM+auXjIlwh5rolHjWMj8HVeY0GYHF816oBfGeFmdJrB3vYt4hzFww0R7084fLueZeAG/qQ3+EVkoMI9++vRnIBpq0giCAtFzd6FQd3UGHFrULZB5eNRxUfqvdERkGZNs3bz08HJss64nRGaXgHf8Z95NVWHKv6x+W6Zbu9SeHopzTU96tUf8F9Coh4wbKuUYbVKJU5uHL+bRRkCf+o99oyAHXID+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 16:25:41 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 16:25:41 +0000
Date: Thu, 6 Jun 2024 12:25:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Message-ID: <ZmHjAAFZ0i9Xg2-S@intel.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
 <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac1f387-89c4-4430-861d-08dc86454e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UbMz5Zykigo0jrZbBJggQEn8ILlYEqHA4PtoH2ZxVegoSoQs24Xc9Ourp8Nj?=
 =?us-ascii?Q?OWs6IREZN4iKIJ0o1HdQsi2zYg2mf5SITF2LVx08TkcZzRMZHwDC1wId6GvY?=
 =?us-ascii?Q?Epj61moQ9qUPfUFODAA3g8LCJ6Bmk/Er5Ndn81kekneHw9hDaILBj3BXhrFM?=
 =?us-ascii?Q?qF6LWwwXI6G1JpuR6dodC7wVySUym+Sem/1lrQU6miB7OGz7Vz2yYqIcRWWE?=
 =?us-ascii?Q?yoX8aptycYn0r55yf/f1dh6DHSHwOy0x0XHZWpx1dulw5N2nBefPuJr+abuc?=
 =?us-ascii?Q?1h3P6H8w0k8jkBS8I1gbSnGK/UGm0+SQhYN60uZUDf972QfgQDrTihUm/lQR?=
 =?us-ascii?Q?3r1JczeEnaMvFurCmWH6viy5yTNFHDQJtIKvLFcNP/KOfNKdw/E6/G8emtNn?=
 =?us-ascii?Q?PRD1NXUAf8kSmTdOzKhb2c3kR1z4gGaozHJLJtOlpnyURAnUHlHVkR7J0fxe?=
 =?us-ascii?Q?POsjiH6vDtGvUk/aEn+9YEcr7XCNX8w7lWHmzR3pghpCg+sRVeFkxiFOu794?=
 =?us-ascii?Q?YW8NvnUvxu7P0kDFXiGHOldEf7CJWHJ8UOYepuhIt2WusKQjdhlYKJZGWOnx?=
 =?us-ascii?Q?3+qfKOZD/WHLnGdySS9mYZ0hc0/fSRcBfEp/fiJekRABMwltPLR98dlb+3pH?=
 =?us-ascii?Q?/kH0ngPvrBAF9CTQ9irk3/VcvadkLRwjMswdrThAohBfD1y8xo/GVGNjXP2k?=
 =?us-ascii?Q?hpTtEn1qftlzuw+WEOh0WFGG2Eact+1vok3T+oWgdZ4mMu0gAA6DbdhuKf8h?=
 =?us-ascii?Q?Fhzp84wlJUjbzRAN/9SsF2x/WZ0zP4MkD7QdOkT3QtARvSFAhIYOjOu+PfNg?=
 =?us-ascii?Q?jL+kQ8KL7D3Fcx+cjTujNux77JW6JC7KPIZgW8219N6DM4TrTH8/gB0iJN5X?=
 =?us-ascii?Q?XUR9XQZz8p2scfbogGE3eWHpgHMQDu75+qnQftT2g9wFg0FDZkusdKxx15sR?=
 =?us-ascii?Q?N/c1MUh837mnnqYkvTlqvyxwGqGfHTE0eDI7/3MJly8EzED+z8OCAAbnqARn?=
 =?us-ascii?Q?YfvuwblpRc1yOeU3u4PMERII6QUtqhNfu+OfoeZe3pjaIubgOmrH0cPcyNdx?=
 =?us-ascii?Q?7FnnkruxioaQqJU+ZVlsVFc6qeSftbF4zUA2vwsnKqZWSbwBOz/Akns9a2tx?=
 =?us-ascii?Q?FXxrFdXKPMHFjBuRmUHzmbtGz6h7IMDrOTVwkIm9xgB1e4AlqnsNsTpR07Hv?=
 =?us-ascii?Q?2f+mbPT/8bLUpsbjCw2qw1BG09xwuHQpYvmCCAt6gXCPNHIttojs9lLQEdi8?=
 =?us-ascii?Q?00vQnnYClneZC6dHJ1Dr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ShF74kBdpu5HrytDZHxNLCa//ue452WNClyif0ZZQNQe8i04u5onzeRUodb?=
 =?us-ascii?Q?Ejqyep3DjQjgc1pd5iY6Rc91k6aSHbFNyGpeZnA3kMHQuMGpqXEkzrgXZyid?=
 =?us-ascii?Q?UtrSvURM6e9GB9NQiCOTmqCKCUX3zzz9zonPdmcxUthDHawoKz/C1flPUYEr?=
 =?us-ascii?Q?f99wL0cxSWWENSBqnrzA0t1A89rL3ZLzyHtc2qsV1DsaqSAxh0gWn9e55T01?=
 =?us-ascii?Q?hbzI2HXPkyDI72R0HVdzEE5HDXSOHna1uF+fjFINmP1rQzkz9D+kdnBiREXG?=
 =?us-ascii?Q?uer0qBN4B1NAQRsiXOqUjBnMwli0AY3XPR5o74MASHLVeBCkcfq3RazNfe8P?=
 =?us-ascii?Q?e1gYP3XxVwBFDQAwU+VQJKHNCFBt0aMOByEzpFHPps7TuVwhOYX+LAyrg2UV?=
 =?us-ascii?Q?gKlD+y+SuyKnClHSZvUmav3f4rI32AU3KiIWOzT03Ul4Xsj1EWEE9IBWkYH3?=
 =?us-ascii?Q?sMuruC6mRfU1/WuwUrn+jMUNrEbyNDDI+qljeWUhf2sJ5GEka9UGySximQDy?=
 =?us-ascii?Q?aCgt72mPwpZrp6xxEAvDo+yzorBA9VEw22+Qt3sKRhqA4OlsO8Em3WkFgfg4?=
 =?us-ascii?Q?tiIuKbFUU52/dPOV9A7iwttcAd/yAfFPcfKah+OVoGX1SeFLVNAu6zrj+ffa?=
 =?us-ascii?Q?Y3rC05diVWcHb6vdvAWe7jPAR3K7FX+UcUhhEchzP06gNjyxKca3BwEHSFuJ?=
 =?us-ascii?Q?ZnEX/jt9Q4HrGQOjoTA9bJdyTqx2xbc1GTocY4PUE8ryO4JOtQJy+fr2RRUc?=
 =?us-ascii?Q?8KXJT9P99Ga3f9twMyStsBWGC9LUJZxMDK40xnS9X2ATZa8VBzFCTwI2Ih6V?=
 =?us-ascii?Q?8LLUEyPg+kKllZAnnvU9tGG/JHSEh0ie+t819ForGGRD03o3XSpgKXUtmJ+4?=
 =?us-ascii?Q?DJKaX09cspwukng3y8BA2T1/RwVbQO0wfzHqCDJJSdrWnJQEK88ipr1V0fTT?=
 =?us-ascii?Q?+iuFRW5jYOCrlI2PqRikdx2jrKfCZb7d7lOK1bMf1RbQm6BN2mQHPKv79XEM?=
 =?us-ascii?Q?QlsKc8YR7ATX8pyKDKL1GZu0kPtNubrSZWayGMz/dORtRrGQGeUMAWON7bBV?=
 =?us-ascii?Q?Q+rJLvp5BHu7HwOxNrxiEvC1njDHaVnfTk/a4rkx88Kid+4ik6mVWN7fhTFd?=
 =?us-ascii?Q?Z8TkZBMrjnYxoaddd5/JBB4W6tSxNSCo0ZZPVyKxwgU5EPEWnHdYCs0WaUsF?=
 =?us-ascii?Q?5nFGee9AeXy4Z0llqDFv+Tk0NFnIXO/ksmZr42VMgNyWIztvPUA7N6YH1KHZ?=
 =?us-ascii?Q?mWlbT4v9KkzGUDSRu4m/Mo/ASEOtvrq3v0++BqbUS6WuPiKDkNv1zqfFvOx6?=
 =?us-ascii?Q?nzMDsg8sZ2EyPKVi/dklJfbpyKwXKMwoMHfoIV+rMsdeQ1VtjG8tY9uGqWfd?=
 =?us-ascii?Q?lQYKy/Y3qaEqyNtM5amPMsYca+ALbPSOIkvjQJ02y4Yx4TV8XVEk2xtI6w3y?=
 =?us-ascii?Q?eFGtc/0VcUIw80Zlg6Z7MzTKtrPRc7PTueGGYILwCxv4HLiiHbR1KgEm7k1x?=
 =?us-ascii?Q?sCkdRqbXSm2yEdW+IC99dsrmPGTiLS7Kp3O9sNKVxkhUJn+8CxBWY9XTZvqI?=
 =?us-ascii?Q?iiw3yhzA6eUoVIEzRn0Jl1NVygPr8hX4bF0aAFfh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac1f387-89c4-4430-861d-08dc86454e86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:25:40.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUXgoH/ChQS+9nT4qqoKZfVMD+o7Dij1Nx+ZkDSozIPCiHAtgI4qPsry0bZG5Ic4Lp7SmTMz9C/xlPBwe5DuzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Thu, Jun 06, 2024 at 02:11:02PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Wednesday, June 5, 2024 3:10 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
> > 
> > On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> > > We currently have debugfs support that allows the userspace to initiate
> > > an asynchronous gt reset on command.  However, userspace may also wish
> > > to wait for the completion of the gt reset before performing any
> > > additional work.  To that end, add a version of the force_reset gt
> > > debugfs function that operates synchronously.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
> > 
> > do we already have the igt changes that really closes this?
> 
> The IGT change that closes this issue has not yet landed.  It relies on
> using the new debugfs, so if it landed first, we'd be attempting to call
> a nonexistent debugfs function.

Please provide the IGT and the kernel patch at the same time.
you can copy patchwork or lore links in the one or the other cover letter
to explain and justify each other.

In the current way we cannot simply merge this because the 'Closes:' tag
is a lie.

Also, there's always the risk if doing the IGT in a later stage you realize
that you need slightly different and cause unnecessary rounds.

> -Jonathan Cavitt
> 
> > 
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: John Harrison <john.c.harrison@intel.com>
> > > CC: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index 66f897a9b6ca9..5e7fd937917a1 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
> > >  	return 0;
> > >  }
> > >  
> > > +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> > > +{
> > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > +	xe_gt_reset_async(gt);
> > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > +
> > > +	flush_work(&gt->reset.worker);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> > >  {
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> > >  static const struct drm_info_list debugfs_list[] = {
> > >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> > > +	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> > >  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
> > >  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> > >  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> > > -- 
> > > 2.25.1
> > > 
> > 
