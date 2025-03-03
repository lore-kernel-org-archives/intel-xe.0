Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD127C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 22:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88A10E4E1;
	Mon,  3 Mar 2025 22:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOhmMDBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9F010E2EE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 22:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741040203; x=1772576203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vDzSO3F5KevppE6s2s0rbbe36QzPOVNqUiUhRDmc7RQ=;
 b=fOhmMDBbjrIWMwSqAeIY6EuSynqMQE6oRIZtStxd7sHlY8l2k16+R1GK
 G2uX8fW5/8h265+Ws9V93FWhbiKCiHUh45UQ+FUSm3DvSYCWQ6+X6T3Xg
 4Wis7gwODzWzgGlFrPtgWg68aG064YYomcHPRjRAIhYnvRAQ5iC+Ig11w
 3OqbSaU91mhSSezVOa/5sOOo0PNz8isITidrB0V17ZjduScrSbM/mrSbd
 o22iOyZk+CM6QjlZsiCeSdwPiUS8hxT3LSE3MuknkCe4ZG9knHtwWg2S7
 ISgFrAh4VmvtrDmxcRPtRpjpUZTPVBxK5qn99Gg8wQusp8mo0KoR7MKDP w==;
X-CSE-ConnectionGUID: ccJE436KQ2+Nk4TXbVd9IQ==
X-CSE-MsgGUID: t2MQAz7rQ0OKQzIIK7bjIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59347551"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="59347551"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:16:43 -0800
X-CSE-ConnectionGUID: QRHUp9CDSJ26iwXi8/gR4g==
X-CSE-MsgGUID: yh+FyqBLSf+JocO1LUG10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="123126728"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:16:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 14:16:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 14:16:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 14:16:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6YxNtGbtds4/FWfTJLGC9xVlwPPtyKQxaLwi0ehmdKx6DdXFd7TBUwvZR7IF2CKnpAb+xOLrpEvV1N7ullTUjtG8TaNvSahih4deCtwVAOlzV1NU9ZZ8ZtWHq4SJiqrbFvhFPHdhIeGYrYWYPoMdMGVUU0WV7fFy5lzvFBw/Fgr8xtvsl49bJAhLLJnb1QVUw5+lbO+vZGyPRUH5zXUBs+UiGdReUeOEHoSNkx5tCDRGHezloLC20Go4wM0/f4H62cyKTm8hxa1nD+/tvZWlFhi/VfVU7jdPX82wnO7uHm9+nd0PFVmxK47Yrd9nW75IhTyKnp1a5neFclU45X5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWEtIuJ+dPVdIsp5TGxyqMY6NMNPnqfbOE4j9ivNK80=;
 b=sK/zsUCd+sPeM0msieT3wy8jlbi/QgzcQ2ff1m0aUW7zweQ+KqQXwjrLgGGmoOGXoQYXXmdSJLDF+GGxttkx1hxy0enjFgmW6rouzepmFzstH46kjjFptgbafXm9Q+p+o2qQ/dhu8bRZgUdJTx2dsbY8H1OQDecAF4xV+JSoq8Gd5Q29jTzLutdhowWO7GYPDO1ASEZahUNxSIiPgw4HT7DKyWpMSo33MDiWWcLFbLL5ovxBXwDYfse0CsBer9/MVOrg02e8vcDtOEVkoDVG9xI8SSxi6z1/dMtordFUBMS8y8kS/l0WsBDL1m9p9w8D3v7ybnnmYOz9OMScWIBTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Mon, 3 Mar 2025 22:16:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 22:16:12 +0000
Date: Mon, 3 Mar 2025 14:16:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/vf: Stop applying save-restore MMIOs if VF
Message-ID: <20250303221610.GD3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-5-michal.wajdeczko@intel.com>
 <tmzge7vvpcxer337bmxkrzuo7rdlucextkqpbusai7fovo35e3@feqiccsayboz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <tmzge7vvpcxer337bmxkrzuo7rdlucextkqpbusai7fovo35e3@feqiccsayboz>
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: de76b6ea-87f3-4d35-8d6f-08dd5aa10205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yl1wTBPp/g7caO90/fEgbW9YFefsj2dkUF/WdJN3qLf1vjii5HgSWiA2pW1b?=
 =?us-ascii?Q?0fQXGFGFEZ8NeSD0KTJeKiBYJs/g9aywakJpMqAu8lwEui6jB3OKsGaEMt1I?=
 =?us-ascii?Q?/2pWCQ9T4lmGIpea7vMz1VEa0YAuQ9gaRvh2/JPltGnxbIa/I4dG7XNjkLQq?=
 =?us-ascii?Q?jH8rJWMJZR26Xjwxs4kXI1Doj5BNAWrsAcNj7w1SISbGQpnh/RLoURHFhtcG?=
 =?us-ascii?Q?zuCcPDkKK0R5q6KvB/zwY8DZ4vymYH1GZb8VdbJa0VH1J0gT8zpMhvII4wSb?=
 =?us-ascii?Q?otbqG+CvHQakSWcZW8luO0NhTIyF+4M3UshAM6CED6LUs8aovbGenzL0Qjv/?=
 =?us-ascii?Q?1GeSrVLsjOlLlHWEN/a3KQY7lDUhMiIdaB78TfFFfmf5PRhwABQ/I8vfr74T?=
 =?us-ascii?Q?VPdeLaKY3GqDV6UacW/1rqB+nudxu0elE+2sqwIjj2d2dJvmlKGf+slx+9sn?=
 =?us-ascii?Q?pu+WY2WlyXm+0KvCYOmNFzbU6PozhWV6oQjuoq1sXvx6NzhWVyRE5yne3ESC?=
 =?us-ascii?Q?21blKrXjVvdACyupFr5p+RfBCuJx9Fs5t3sKPQpWRk91yLtKzwIjll+BOzDM?=
 =?us-ascii?Q?cAAQcLnDbIpAmBGnlm3j3a1c8ZfZQzI2WJ131ROF3/ploz7KOzAg2Bys7wKq?=
 =?us-ascii?Q?6sG/7fMpSM6OrmtNDt8qVauf7PUKzomig58UiNKOar942DXL6s5t9i8er/fc?=
 =?us-ascii?Q?pjerQpp384nxacwe5DwFI3/xtACO6+SipX0D394jt7JNYGWzSn3cxXbMXN2C?=
 =?us-ascii?Q?SeWuH/3U6fVTBTBIDzgFl5jusgjZs0T9EyA87+7ZOhBQUFpHw+taDTYq7547?=
 =?us-ascii?Q?kUL1/hUB7q93H9RQYO0j2mZrdiyq4MMrLZH05eXR4YM9TlS5bvkclpKwlaEW?=
 =?us-ascii?Q?zWXpNLR2jkH97KQd+o8wSLtPYJuczWXvmNUeUo8ukjkD4+yL0g1MLgvyT3Dd?=
 =?us-ascii?Q?p1It0MVpkJ9Gm884jOQ8EgoBJuKpTt8ZLzzBOHsv5tP6BBm2v+3H2Ss3UJiQ?=
 =?us-ascii?Q?wtni1qUPXW0srufSf0eiJ2hn/k9d62j1YJEro0fgra/tb50dRieL5U5dxjcq?=
 =?us-ascii?Q?JA6k2TbJcy64lp5wnmMPpP84uP+WQZh5ingG8dJOTFsdHT3gFoT6vYO6rkCP?=
 =?us-ascii?Q?CkT0LGDDY6uXKk1onn5HI2U3is3q7oIGu/reV05yHCJyYZF1+UlwKpKFGTai?=
 =?us-ascii?Q?GH0nALD0toKqvaKFnQqVKK1N5tQjZ2yTMYaiJd8iUNZRRu/yuTsThCoIok6X?=
 =?us-ascii?Q?Ixlltr/I0THEhns1Ryw2vGqphPgXneeINscVcg8mSgQ8qtMKDFMKr9sOy60+?=
 =?us-ascii?Q?U5+JVNx7ZVZqbMqHbFMQmoDQZjPri71ihXQYO1wQK21+L7b8yiKUKroeZGiE?=
 =?us-ascii?Q?HInCkFJMsFKxgHLhMZ3C1g8BkQLY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTCqCLTPW0cyymVlQvFSjGxmpVuG929Mt4yXWogMjtbDcxsDdwTV7nICBo53?=
 =?us-ascii?Q?eDdoFVF+LxoJPeEyNoJkWINWnJbN5EhbKk4CpFUUJT6WYTJxXNk/dAt9cCLR?=
 =?us-ascii?Q?wor60FZ2ZoNU9e+1XnztiPHtXodr1Bkty4zp4mUIThS5xI7M5GP+LEUMcUxE?=
 =?us-ascii?Q?H/XrAgNX9KIVRSmR15u/ch7s/dnk3PhuMmU+bwXmEUniq0RBJyk8PmGs6zPC?=
 =?us-ascii?Q?GX+DNyoEY04WAzyKYi35OyOZcLR38avdAsAcKoNHAASxGoI5LWMR61mx+hf+?=
 =?us-ascii?Q?i/ysVx2GICabsuXpb8gukTA7V5a6/RJPBHodS7pmmtsI8p+Vn61cEdr9dFp0?=
 =?us-ascii?Q?BiG2rK8GpShLuFImUJmml4K5P37/3hYRFkjOCf1l6YWKQHpVvhckr1pfK4Rd?=
 =?us-ascii?Q?xWED8ImlPkNLnuDBiQ0/7en428VP9WuYJm/ZMAK0iHvRDM2L1rgjv2SQSz5Z?=
 =?us-ascii?Q?XWZcxBy6hjXBzMxJk+s/b9Cz/0c+2ocFz5wzp5RU2tbfd1mzYw5c2RsORrcN?=
 =?us-ascii?Q?RQV6Vhhm5XyS9IBYhEg3W5M7tYxYwstp/+v5NIei+pngnHe8qg3ybgROYEnB?=
 =?us-ascii?Q?hywMbEwEXpIVB51y96jiugUmsPXhQIdVeThxOtN3pcwwiYyqlqaP+Q4N5Uo3?=
 =?us-ascii?Q?FNVa8VZtFn0iVCM+sMDaKiSb2ySK5uYN5Lnk8d3SpzOTH9yEZzehH835fRKp?=
 =?us-ascii?Q?UFPh0bjY/DzifKRPuZBoVYvF7OKM+LsIHm/MFmsy+Ar/cy8KD6jj23ezTPJm?=
 =?us-ascii?Q?I3Tc8P0o2153hr859SFUnuzBxHzrHVLXtrIQT02pUQfFhU3T6tLDusxtBQL6?=
 =?us-ascii?Q?gvwNIrg6/NZJFBCSwTfHhwwj71tMZ8Z204ntAWozigFsbzJIZswX9kGQLz8g?=
 =?us-ascii?Q?/U9sGacQi7nX5WjOCl4zm1SUPa9wRg9hFJhUD+CdPvbDHo/o0s7gGBhpI08z?=
 =?us-ascii?Q?/OA1ILm6UVLEjBRU5I1CQnzx6wB5R7qtSDbO9eDQtjOYWXu//4caLC+FwrVa?=
 =?us-ascii?Q?/puZfKrrpt8mjFZ/7c+BKUQofxddSxdvVDSbeAKCsAAXL/JaLMFdd9TmlcxW?=
 =?us-ascii?Q?JH/+FwkzGwXIDW1SiKQgMVZSPcmrKd7s3MvfIOCVwMOqwiB/+arbuKzxnRKP?=
 =?us-ascii?Q?EdO+6VkMXkoT160vpfjJPxM7zvrDAxgTqNG0LnTNgxWu2UVtF+6VC2u8/hDl?=
 =?us-ascii?Q?qIHCaXNcrEXQLJ1bD1vmBKOnEnRIaMyyet3uY8WZL3lCYllfNQZQx88N5ff0?=
 =?us-ascii?Q?mzPyssNz7nNCv7Fx7FpE1qCjhZTxZG4Uo0z6QkJkf6pLH9UfeXV6dmiPGlYs?=
 =?us-ascii?Q?w+n8IUMXKfRBQietsPzM9RTDfm5cfooina9bKU5RaxJcMOKqgNGO7UG0fnFD?=
 =?us-ascii?Q?fm7MoNzF5CqrLonOHyA9lnKG7yzdChLCD3gmR5xqOELGamwK86dWWo5gEDOT?=
 =?us-ascii?Q?lIlbEZDlp2QO3TLcbAD2sXlQ4cfjRjlQEmGKRFqifoZY0RO9jLVVaX5pnNmg?=
 =?us-ascii?Q?ppKlA5eT13w5tA67Li3ywx5FXVGU4jgKf58sP8uCdPrkTZ1WIADE1cAQXvDG?=
 =?us-ascii?Q?WkvCIzBe4iVpAuHXa0o9DFq8rfSIrqbkhnN7hi3m/GtFwzWqS+EXZct4PGqM?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de76b6ea-87f3-4d35-8d6f-08dd5aa10205
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 22:16:12.8280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mskd5YrUt+GUjL8c01uevpOyA9OhECw04r8WY5Y6AnaFA/AzAdG9u0+aFRWNA0JnJJUP+GzmlHjDLL5xyasoh+fvmOi2SZVXZvIhoK/W8z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Mon, Mar 03, 2025 at 12:09:50PM -0600, Lucas De Marchi wrote:
> On Mon, Mar 03, 2025 at 06:35:21PM +0100, Michal Wajdeczko wrote:
> > Currently we are blocking processing of all save-restore rules
> > by the VFs inside the xe_rtp_process_to_sr() function, but we
> > want to unblock that to allow processing of the LRC WA rules.
> > 
> > To avoid hitting WARNs about reading an inaccessible registers by
> > the VFs, stop applying save-restore MMIOs action if VF, without
> > relying that SR list will be always empty for the VF.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_reg_sr.c | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> > index 9475e3f74958..fc8447a838c4 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > @@ -173,6 +173,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
> 
> couldn't we simply have a a generic xe_reg_sr_apply_gpu_job()?

Setting up batch submission at the points we're doing these MMIO writes
seems pretty complicated/awkward.  Also, depending on exactly the
workarounds are trying to do, it might be important to get these non-LRC
registers set before any batch submissions happen.  And even if we did
do batchbuffer writes to these registers it still wouldn't change the
SRIOV situation --- there's only a single global copy of these registers
in hardware, and that copy is managed by the PF, so the VF
can't/shouldn't be trying to touch it.

The LRC workarounds truly are a different beast where we're just cooking
an image up front that will later get restored on context switches
(independent of PF or VF status).


Matt

> 
> If we still need to filter registers, we could probably add tags to the
> xa storage... ?
> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
