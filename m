Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9AAC369B1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 05:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F40A10E831;
	Wed, 16 Apr 2025 05:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6ib1jYE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593AD10E831
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744782210; x=1776318210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vSjN91DuAaIoDQH/mv7tPlud/9F2AcdkL5Hq1hQx/oA=;
 b=l6ib1jYEipqNV79VxM1D/G2j7eS9NMl7I9zN9KjUWyibj5rwm+q2jFNE
 bxctYcTmaOGWY9ppw71YNjBSzx5iIT9whb38y5rFy+4U3+1A8EooNLwfC
 VOwg09ZiAxIZiQUn1ynRuG+8py3mIRCvXbxLILaKuqX/OYURGX98kMwzZ
 2e8RB0UG1J9LJzGicVqahgUgshSWsSUmH0/lvFnGkuUQIacilHbV9L+NC
 pXj957deodHT2XWFELZkaZbFSvfYVyJ8I/mFor2Hg7Fg/G2DrlS2DNAhR
 3Y/gU01WW7/uOJ7UqagmgBQ8o8T7LFmwGVbV0q60UHngwtHU6jsrJN3XJ w==;
X-CSE-ConnectionGUID: 5h3SZHQbRd62ZsUwU1XEyA==
X-CSE-MsgGUID: OEfnsHj1TI2B0MNZ3Q5eGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45546218"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="45546218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 22:43:28 -0700
X-CSE-ConnectionGUID: gaDKavXKQNaH4+cXDo3BkA==
X-CSE-MsgGUID: m4IzVn4HTXy8eSwubDjGbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130102402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 22:43:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 22:43:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 22:43:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 22:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy1xOT0yJPRpzXOA1gLylnmcPAbNrbZlNcAveH7+yN5bSXLEiLwaCfMTGjzLfyxUmUrrmLjK/26gO+c2wuWdfIZ5hdtmR+2rfCuNWLYdmUXdIJprpSOt6WSOrvr77+0rZh4AZE5mqMc2pVxohtRHl/+kl4SkWtxO8Kbz3D6NbwVCe8dnaqV/aA8jV760/2PGurUIn3nYg0TBBXEKVthiHtGy+r61ZxL0bscO9X2QF+fGzyISbCyCYGkZy9iQUQbFkbujRtQf3xSwT+QFOnVFX5h1+A9kpNYofxf2E9Sbw9ciEVw8dzHWpW7eBc0CikTctUvnaGvkPbgDBt5n0joVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXf5nHt4h2vhQ9wBvNvcz5VywcJur9fMwW/SORGgDlQ=;
 b=LA/ycsBnq9eoIwa4fd1Qm6oKRGBW+f7hvVh8GadIf9HtcxhYf12IEv7R807z6AyaJC8f3JbQlJmzjO9140Fkv+B0BhYqMLjmX/LNug33EnwHeHhYiZYRucGHOQE8TwRe4GdOy+GN2IZE0rXGBzl1aiwH1yFyV5ceZOPpIBiDqjs4n1bCXsg3y1S9USABuwiMpdylNF7VJeI4Yq63bL3fhpsGpxpg9rTqSPINsgvYDiwPM0mi86DZ9G9JlkGsnQ3157h9B+oynm3B2sEDBCpqH6kj+h4ndVQ/UtWqq/YyQC3FqP/OOcshUwnwuzUocdx6OjwnsGzBJhBwHthNQPlsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 05:43:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 05:43:22 +0000
Date: Tue, 15 Apr 2025 22:44:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
Message-ID: <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
 <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
X-ClientProxiedBy: MW4PR04CA0126.namprd04.prod.outlook.com
 (2603:10b6:303:84::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd5c55a-c15c-456b-0c47-08dd7ca999ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kwsR1pJR7lUApRNx3aw5BKk8IXK43hHLNtw08Mf+lTkqWqL+GxsyFkMuyr1q?=
 =?us-ascii?Q?CofB+EWuDY+fZaRlPqgMqBQS1G7FeLO8IK5UIafNxQNn7KEjP5Ef4bOjMlQq?=
 =?us-ascii?Q?PUVEfG3ucoNHy+TPvSjGieEDCJAovqGE99aOQMSRsy9Rk/YPTh4eaLc1BWJ5?=
 =?us-ascii?Q?teN4Y8p5XDSsE3b1dRi9IlhdPYkcuDuaMmvFn+X69q69mmR0Uwnbj6rnD8HU?=
 =?us-ascii?Q?2gHbg/DLLsBuKw3HTk/y6U3YQws6AmxnQyjAUUW0VOye/IhR+8fDwAI3b1Fw?=
 =?us-ascii?Q?1OAhxJlDvsLpqCRBB9w5JOQlVSLh2c+JrpFVdNh91o7mWkyeHU88QzzYa9dn?=
 =?us-ascii?Q?DkHc/T6N/PA42mF+37L0bizE/WeD8BCA67RJ43bJ9otgg8gQNxNB2x63qXuR?=
 =?us-ascii?Q?qvTCwaAp9CzItEQRXXRQyNPH3Fp4Oz52uV+1mCDLwyW9ORy0ECQE0RAAOpob?=
 =?us-ascii?Q?PzUeCrx+zT5HamyPxLaTnUUrGCtW5IMhx+v8UUX2yvLSitAJyxxYDcGYIBxG?=
 =?us-ascii?Q?5sHJ53PNzChTfhBKEpaWtpiPBYtfUVVqevQl4ZTM2PCFa4rnRR3LB8LS3aoA?=
 =?us-ascii?Q?YmnJQrGn1sS6tW9CNQ8Ahgna8jvFhiOo546TXwCB5DWBkrvBnA8PW8AMV2q5?=
 =?us-ascii?Q?Eg/k8iQoTZ7CdS5mLue5ZBB8MWa5GQ9ngPlbjnjeEYHK0u5JDw3RuxdMC5tP?=
 =?us-ascii?Q?ZhV44IYKnEHJj8yuQmFLw7dkTPDE9gIgGlEC2LSgohrqr1y4dpQyp3POLubM?=
 =?us-ascii?Q?mYNIdBjb2rkcjGXQtrp9TnkCO0OgjU4f1wwBf8ttv8EkI2nRciiELifgBzJc?=
 =?us-ascii?Q?ztFPDEjZhiFI+z1a2gKlkWkVaSmKPtyutstge9jcb9z2/+CwgbSgoGQ8QHW3?=
 =?us-ascii?Q?0k9zFyo1oBjrFbuedoNCGmQ2104i+0r9W6+YMvZpzpIW+h2Ir2sDs4omE3ji?=
 =?us-ascii?Q?vnTAk8QhE9nmH//6gKFh3o5C3MjUEcfyh81vdACJGm8FZl1Rim9599TvOHSh?=
 =?us-ascii?Q?yAJxNHpTWn1yL6K1hxMyAKqQnNPUwEs84kLPbhYXCLO51x4Zw6OrNbDsHxv3?=
 =?us-ascii?Q?RqvuKIv66uukhSH6PXtAUfugyWSGFgcracGhcyIr5e2RqZdvx4lPKbyCFDUb?=
 =?us-ascii?Q?GEQKgk+z7fYWeErCLjcgdiUkjrrlnqaah685QqSA5ZNfUskzOPvoGDTykmDr?=
 =?us-ascii?Q?98Fny9H3c7EqXZij/C7PHjZwU0D2ea2rnJMZqzpf59nEfJXoNMruh42SSRdU?=
 =?us-ascii?Q?Om+Pvqny+I9wFhx6eXUeWKt9f0XFYj+Kvgasq/V9FM4S7gmBfFE8Xr7YZYSs?=
 =?us-ascii?Q?3HMz4PAibry01mcByT+9GvkXght38F/qNsap/FMruzyfGZSBHAJBr+SsTAfg?=
 =?us-ascii?Q?qVe/xwet6GGTsznuuT2mjtkUnozwaWS9bGhTmhmbDre2QQuqI6w+hwvOzEIp?=
 =?us-ascii?Q?pUGv9ft12i0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lBWyTU0SNdSlNBoYuJimR7/Pn9ujWGvot36wODNnVGnjOSBwWdVF0jTr9Xv7?=
 =?us-ascii?Q?ugP9Ag2h0iW0SpMg8kTYfXv2jFVaJ+B8orPEfshh8gtkqex+dGVSoyzsH7eC?=
 =?us-ascii?Q?d3jYvNSwBdhmP388dalS44DhBQT1pXm/Ja71QA+SCc/Oivdt0b9u6vMPG3dV?=
 =?us-ascii?Q?AtXHx3pqKVPr409MRqOmJqfsdJww1L5PY1I/ecvmzZtSMrujf7Ju01CLDhuK?=
 =?us-ascii?Q?F+TiB6M2AvCKfXWn7FPDajuAkZ3P60FkA+xyW5OfST5Da+5Ni0V9SxLyteaJ?=
 =?us-ascii?Q?AQ38b4W2X1jbyjcoST1A5QfaUAaQEs1IQNw/F65csoc6516nqxhOBKo+VMKY?=
 =?us-ascii?Q?lkPbVumywlI3V28v1npm5viixnDXR5TMld3iqUbPfRfJs4buzMx4Y/QUbrr4?=
 =?us-ascii?Q?1RfaNU83baq48pay1acaD1oKOechR1FJUVS1eMp+HlzGMZOAGeZ5neBA4wqA?=
 =?us-ascii?Q?B8y1kQeqwz6dQyrfJa7ubF7aQQCq/5rh7mNPkDcgqGggvZlf1HYxgMQSY2mL?=
 =?us-ascii?Q?2hgk34dkW0/yl27WaJ0I1o+p0lFbaZ9oUi16GQcN730ixjw1FqqkOcUrc0EM?=
 =?us-ascii?Q?rza+h6Vsey70u9f5VPgM9bNaDmad2JzY33uILdCBaJVMI8+Kh58G41i9Tgxk?=
 =?us-ascii?Q?mh/V/ITPmR63DTmqR2tOirZ61hhX/yHpa+vVNPX/Wu7MqgaA0My9oM3wWuOM?=
 =?us-ascii?Q?F6fMhgNTUqkq1SNRbuguVszyRLS6NUEEewArXdiV8uDtEyve9sH07U3NpEn0?=
 =?us-ascii?Q?E6DhXjG/OS+s8ymJOpHIRJM58WIpxlDdSAkcN5Mqvp1ge4ujAx2ZQSf56yHS?=
 =?us-ascii?Q?bpoxi3LxYCl20cVugNscvXIoCg8uRT4lmoLkJFKe6b2Zj/fPsKH123SWJpSz?=
 =?us-ascii?Q?sj7YEiZ2GPE9x7vVgl6QNk4syidGS8OBzmehBpPZqleyp9EhzDgVG6Ga2o0/?=
 =?us-ascii?Q?ECl+YkG+5Fb5E7kJNtVNBjYIM6vNXXDEAGGql1KPFzb44pr033o8KSG53CTN?=
 =?us-ascii?Q?571Ymfu2vkmQhiEs0NxQyo05dKVOcJCvLjyPEsGbDmIjIgCVIp2TpD4ebYiq?=
 =?us-ascii?Q?FEpBhJJGMI6YA2JWZN2ywmEYoSNC1HestoI866FnLzXg0G3jVYhbSi4GNv1F?=
 =?us-ascii?Q?AvtjJdVQbOoWqcONN9ZDWBsxaIIXqqn//qPDO+mF87VW3bHMmXOrHeiVPPM+?=
 =?us-ascii?Q?/3wlsxZ/XZMFNIAHvOYBvudLaHzce2aRQfyxkfcFTkQYj2v6yaU69OWUGqOc?=
 =?us-ascii?Q?a+Jmq5o+AMKbH3yGTQCaXp0aFt2Clw4sTHMwnvkXvGzwpkZil54jOuqR4G8Z?=
 =?us-ascii?Q?ycMMkETcLreLqeUaDMq+izN+gPHN+hTqZdWhdNijBqvGQ9LawXTXryFHy8+V?=
 =?us-ascii?Q?dmuOQTSQPmkMz+z8D02jBqqEijBAvbGzdbahYHpS19yYWPY7BMqQgxXoBw3U?=
 =?us-ascii?Q?qGSWMZSzBFREUosQrx0evzU3GVp91ZA0aSpWnJzT6BDHlhWLKPRyVioKaRKq?=
 =?us-ascii?Q?dDMzy0nnrJ1NB8oyVzzAZ/fB1NgTcbmPCnKa4Klrp+OMywlDmaMDR7wwB7Io?=
 =?us-ascii?Q?auwRFVypMZMeLlgywb7f2kzAEQAcHVGV5U4fZ4qQtB0Jy0lKd0UThQXMbZuT?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd5c55a-c15c-456b-0c47-08dd7ca999ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 05:43:22.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D99JgkFhOXvwTvoxu4jfCAzRQyVESn15q/9l3eVAg8AGpLTx8awJorhr4Pjw3H+n2qf4Ve4cQuK+iPO2RMUqpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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

On Tue, Apr 15, 2025 at 04:18:29PM -0700, John Harrison wrote:
> On 4/15/2025 11:39 AM, Matthew Brost wrote:
> > Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> > of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> > callback as needed.
> > 
> > Some memory allocations are changed to GFP_ATOMIC as they done in
> > xe_devcoredump_read which holds lock in the path of reclaim. The
> > allocations are small, so in practice should never fail.
> > 
> > v2:
> >   - Update commit message wrt gfp atomic (John H)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
> >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
> >   drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
> >   3 files changed, 50 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 81b9d9bb3f57..a9e618abf8ac 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> >   	return &q->gt->uc.guc;
> >   }
> > -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > +				     ssize_t start,
> >   				     struct xe_devcoredump *coredump)
> >   {
> >   	struct xe_device *xe;
> > @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> >   	ss = &coredump->snapshot;
> >   	iter.data = buffer;
> > -	iter.start = 0;
> > +	iter.start = start;
> >   	iter.remain = count;
> >   	p = drm_coredump_printer(&iter);
> > @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> >   	ss->vm = NULL;
> >   }
> > +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> > +
> >   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >   				   size_t count, void *data, size_t datalen)
> >   {
> > @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >   	/* Ensure delayed work is captured before continuing */
> >   	flush_work(&ss->work);
> > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> > +
> >   	mutex_lock(&coredump->lock);
> >   	if (!ss->read.buffer) {
> > @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >   		return 0;
> >   	}
> > +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> > +	    offset < ss->read.chunk_position) {
> > +		ss->read.chunk_position =
> > +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> > +
> > +		__xe_devcoredump_read(ss->read.buffer,
> > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > +				      ss->read.chunk_position, coredump);
> > +	}
> > +
> >   	byte_copied = count < ss->read.size - offset ? count :
> >   		ss->read.size - offset;
> > -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > +	memcpy(buffer, ss->read.buffer +
> > +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> >   	mutex_unlock(&coredump->lock);
> > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> > +
> >   	return byte_copied;
> >   }
> > @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> >   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> >   	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> > -	xe_pm_runtime_put(xe);
> > +	ss->read.chunk_position = 0;
> >   	/* Calculate devcoredump size */
> > -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> > -
> > -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > -	if (!ss->read.buffer)
> > -		return;
> > +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> > +
> > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> > +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> > +					   GFP_USER);
> > +		if (!ss->read.buffer)
> > +			goto put_pm;
> > +
> > +		__xe_devcoredump_read(ss->read.buffer,
> > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > +				      0, coredump);
> > +	} else {
> > +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > +		if (!ss->read.buffer)
> > +			goto put_pm;
> > +
> > +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> > +				      coredump);
> > +		xe_devcoredump_snapshot_free(ss);
> > +	}
> > -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> > -	xe_devcoredump_snapshot_free(ss);
> > +put_pm:
> > +	xe_pm_runtime_put(xe);
> >   }
> >   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
> >   	if (offset & 3)
> >   		drm_printf(p, "Offset not word aligned: %zu", offset);
> > -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> > +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
> >   	if (!line_buff) {
> >   		drm_printf(p, "Failed to allocate line buffer\n");
> >   		return;
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > index 1a1d16a96b2d..a174385a6d83 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
> >   	struct {
> >   		/** @read.size: size of devcoredump in human readable format */
> >   		ssize_t size;
> > +		/** @read.chunk_position: position of devcoredump chunk */
> > +		ssize_t chunk_position;
> >   		/** @read.buffer: buffer of devcoredump in human readable format */
> >   		char *buffer;
> >   	} read;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > index af2c817d552c..21403a250834 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
> >   	if (num_dw == 0)
> >   		return -EINVAL;
> > -	hwconfig = kzalloc(size, GFP_KERNEL);
> > +	hwconfig = kzalloc(size, GFP_ATOMIC);
> As per earlier comments, this should not be happening while dumping a core
> dump. The only code which uses this is steering related. That implies we are
> reading EU registers while printing out a previously saved core dump. That
> either means we are unnecessarily reading registers during the print or we
> are not capturing state in advance and only actually reading it out when
> printing. Neither of which is good.
> 

Ok, I don't have bandwidth to fix that. I'll let this series die then.

Matt

> Rather than making allocations atomic when they don't need to be, we should
> be fixing why the coredump is not doing a clean separation of save versus
> print.
> 
> John.
> 
> 
> >   	if (!hwconfig)
> >   		return -ENOMEM;
> 
