Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967DBC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1054410E054;
	Tue, 11 Jun 2024 01:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQh0LtB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E548610E054
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 01:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718069790; x=1749605790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0o2E2bjyKipK5hf9VzqhuxllRVSI+IpQdtJTBdZx8J0=;
 b=iQh0LtB9t8hCw73dFdmUcnYcHSZhn/n2yQUP+/Nwo01MQEZzHbEE25/e
 0svh2xC2uPvV4qLd6l+vuipf1aTTUAvKt5TemaJkorRWo/HpD6O5ayhgL
 YbEZM7xtOSi/YA1K4VWDPzz6QgvBcIcLVvzT36CraiPwpUsbvSUgvaP31
 M1o5CFM9o8z0Tk1btSsdLIbHBg5yOY4QDyaQtQaiZ7Pjb3xFVfqkvJdA8
 QDmbyxXmokYP4tiP/+YKC1RqR9Mo/qpDbapfQwwToKGu1hr3WsXYsAavE
 esREYVBRWkzjMFGzZObalih+ILTw+fc5Hxd6DpTWeZB3E5pKhEp+rUL1X w==;
X-CSE-ConnectionGUID: IqFvhArGTlWHCFKw8Ej0GA==
X-CSE-MsgGUID: qigeraXtQfGsxgr/IfNDfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32242432"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="32242432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 18:36:30 -0700
X-CSE-ConnectionGUID: 5qtwIRIPRzC/DTs72cV69Q==
X-CSE-MsgGUID: mBdDU9oNScOuHeJSDl9IdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39099135"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 18:36:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 18:36:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 18:36:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 18:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6twgTbTwpw49m7fdkIQtmQ0Zo3+6Zi0j4LeMFa19vZfKwRywRPgHyA7wnfS4ZcOd/CQzGzPvbM5BDUIseXiAsrVHOkXDcCi82X71bUVPHu4kVjnZOZdMS6yje690d5MZwrOr/DvXRWb5mKGDJ0Yu2aaI4YjGOD5/SxhfXZfMlWqXiReITfNBiC3Sc1bVPOITW8a5bQuU2RSkTkOk3sNuAckPItf+V751Ll1/ipNvoaPK6pUpY31OJUdz3ZXyuFdtzcYVC5ORdUqbXkGuM0/ff7tVTFpjqNkIhQkT1+qgwLA+BpR+HFaTMT6Fz7KOkjLf7l1VpWWKYLbdlj5uHBZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GM1p50e/FoMgmPH7v/iaNvpoYkPgcTNkx5GB9Pjm6fo=;
 b=eCrdX/iCh4FCNxJYLJB5F2mNa9HermJpolwwpsrYQQx+xZj+blX+ZvcVlk1sctcTUZIko+cV+4uzGrreS45Lvgje8cYWWQIGanh000hIJBQs4AruHHdNm6rFnG1OYnctNb7WiTuCC6PxMHfkMn7tb5449FCzWyL184bU8UbN1tmizDqdbGH8J0FMms4LMDJEUYHm7wyouB0d/k67Hqx76BgmDeJlsJRreOcZ4FlwSaZ1XTuZ7z5fQ1Lp2MOtU1tDhBJr31mVHPfkS8Xfso1hJsmekW4j1CatIrFeVdOApLFRc/BYEM6BJfad+J0r3HgdRrgsmS7/8ZJ6grYi/ST/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 01:36:21 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 01:36:21 +0000
Date: Tue, 11 Jun 2024 01:35:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Message-ID: <Zmep+GwsBnhZzwJZ@DUT025-TGLU.fm.intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-11-matthew.brost@intel.com>
 <10e2758b-b446-4a5d-a51b-fbd1df688f13@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <10e2758b-b446-4a5d-a51b-fbd1df688f13@intel.com>
X-ClientProxiedBy: BYAPR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::46) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be39dc8-b42a-4fce-04f9-08dc89b6e5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dh4cDp7GKvIT6bSySzhyY8FqNXQMMtxPWOtuuaPnq2iyrMSLabo4MXzvHMr6?=
 =?us-ascii?Q?oW2StUrdSlWHpffjP/GhRhuXFMrHA46mdIZhDD5SnEtqsbseBlBktuWFOZ0d?=
 =?us-ascii?Q?eiJ0NnkSEFqFjiB2WG/TRcgChC01fHsUjsT3lJBBuOIB+w0nqaPV90l0jyWP?=
 =?us-ascii?Q?2URdvODU2qKuUb1DmVFutl8MH4RgvbHaOnhqA2Zf6ZNHPObijtsMPEpMkTvT?=
 =?us-ascii?Q?ZENp4Zm8WmkxctlGUWHW2YuDd+F9w3RxPPsEp50rCZHDbbsHw7YEYEZlOdc9?=
 =?us-ascii?Q?BfhRJgV/TRJXU/GiXpD9d5NZFrNbLADW02VD0Dl+dMXXw2Ir7dhnbeiD6tOV?=
 =?us-ascii?Q?JAUZDo3b9WujCHMi24bvFUJEP1jkqWQIxWN3smxcBGUD9m6fGR5p27mORFoA?=
 =?us-ascii?Q?nMZVX24DBCVrTWcQpRsRNrpl7lU4/zYgWBYa6vKN2mw3RCZqkLT6l5etc2G3?=
 =?us-ascii?Q?3bup7Vb45S4Zh+LsEtM2RZjjKHSYXwp1PTg2fyhKT8recLTxl0qx2iwQtjg5?=
 =?us-ascii?Q?GLqPRo7Fn8rvgjCYcBWGGkuAADiHYQKOcuGYEIVvLFCXY2w9QwX8H3pjTtZw?=
 =?us-ascii?Q?GGl9IPw+L6Hng76wN1snv1cB836irIHDUspnrdiL9h+cmhRvrG4k28/sz+rq?=
 =?us-ascii?Q?d2/lufw8OB4QSkk0alpDdL4H2CdoormBUFY0p5V86sFxkJ7RJIDlVHx8W2PI?=
 =?us-ascii?Q?e2AtL1I0L1mWUBgQYkIu+I/v4VPFMiraYdIlK7ZF39Bm3E4WgRqR5bPbrmly?=
 =?us-ascii?Q?PdQ2XZ7natsiwsFwNvvj4AqPCjLkH810XLZWEevAVXO2WSZP90VUnmkV5Umf?=
 =?us-ascii?Q?DNeTkA0+i1OKVotwDDLBQ2BXaQoeOYtN1PUGHc2H7qv9TYvZmEbFFIbY6PwF?=
 =?us-ascii?Q?qrEgfKHw6+wneltEIkENKl0qZMofQ+4iki9p3pdL7cGdOTEph4n3DTzN3NpX?=
 =?us-ascii?Q?99ZnmLuojm/WtSb6LJqxed0oY5DwGl7NNMX1ZqfIZQ+syCp1P4erFsUzLtXj?=
 =?us-ascii?Q?hyFov3kisb1GJHFxDb2iq4ZxsEUmp8u6ItEuAcRSyrQk7Wap8qxQF6Ig2gTx?=
 =?us-ascii?Q?267HnZlXNhzrdralZXpyZGv8fJi9EezkeUXA3LBPKyqjli5B1VV4sCf/Uxds?=
 =?us-ascii?Q?myZiPlnzOspFF7186jnFydF7HDcYHB3k3VUaxX54lsy5t7aJ2alRxq1GTBsv?=
 =?us-ascii?Q?igKZQ5iD4oeU8phZvoQlq5qAkVQCgHO5GPNzgY6/qZJ12gn2u13Tpmto8HB7?=
 =?us-ascii?Q?q/F4rOe8BWmciFHSzH7zgPU/6CsOYPP4Fz/jnmA01a9OuqvnY2JusYnliuIU?=
 =?us-ascii?Q?x85zV5vMKuyJm79DFUps7EXh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gt6UlmBtsMiIqaSfuL7wrBngf2pIR1hqCiE1QS69Oo7ThGLVhzxPilGIJ0sn?=
 =?us-ascii?Q?LDmdYL9qacTltEyRdt8nLbqs5IvHOneDpsgaYA7/dzahFd349CVneosnhb2i?=
 =?us-ascii?Q?a8/AoPNX995LSSNf7pi0Zfl9+6c5L8MDvRgeKWvskCUtPzhg237XeQmQPZnU?=
 =?us-ascii?Q?CMTgYYBTDPyxrsYlqPPmNq9we8fozgvRtC5DYxObVDqS7otVtFHNZqSSzO7q?=
 =?us-ascii?Q?MliE/5Pfmrtzsqe4sYC6YuMQ7iVwn4eC6ySKGuO3fPr0tDPQNT90oI4nV2PC?=
 =?us-ascii?Q?J7osdYzwubpKoG0aaSJh8sv5y+Jmq8W7HnU/V4NmkY51RsV+3ZbWYS/R/qIb?=
 =?us-ascii?Q?pADNWkGgK753tZ6oLisolsrs6H1BYJwriFC8zAoXGW3ZzjZaD7wivzVxN1sc?=
 =?us-ascii?Q?foQ6lLarWVl7JKzzCMMNWPUZ0t0rAOwDMaX2g9NLvx4ZN0eKtkZ/6Gd24b0e?=
 =?us-ascii?Q?90tIYg8gyaB2OS7D7T4/u1wAB48RPlgZmHTNVh2FfcI2nYXCGyxjJ8UcS5dD?=
 =?us-ascii?Q?nJD6Db9ESgECQSD90U6FNTZHWdkQLUXU52rC4NO/15ZfKs3I5ZUPRbxlF+2o?=
 =?us-ascii?Q?hi6D/NcyEcqOjGag6LRSZVyxBpfCqRaFXP9dGoCLrz2w01htCMu9llYPq3Si?=
 =?us-ascii?Q?sy7crTtRqYVjGLlSJjfQtiUfeRwKZ25SeLYy7Su5WY7nCDriX23BX5i33pEE?=
 =?us-ascii?Q?yEtRpOssAoirJNB02EryteN98OX1b/eo5Pj8qMoMomqc/GYALGjQR0EUO5Kc?=
 =?us-ascii?Q?lpKVNGI6SNr1Ktl7Bms6xUNkgEjERCwrsDxg53OGlnpDDLGWkge/L7yXzqLx?=
 =?us-ascii?Q?tFW0T5vKloWk9l7EWgYnmsZoN9bCtcJf8Fw1NiiT2uj7zEOD2beglSa3NCmM?=
 =?us-ascii?Q?PVlcDWq6w2Kjjfuio/IhENSiCn5CxZ6Ew9pFkwV7S6EMemrdDOagrnxtrHUI?=
 =?us-ascii?Q?3lNH1ga6eJGoQ/hyPDSe1He4Zjyu/YySxvdlLeT8yXktKhk2IDYzpJBOssrI?=
 =?us-ascii?Q?znhkoio5mEsNxGbfuf+rId7c4DIHr7QLFVpm+u7LGfe+mGzJ9Nw4je/5xhmV?=
 =?us-ascii?Q?xlIMyM3AgjfXcoCUvJNQEfap3nRHbe2TEup8dojtc3pFFRjtJDwsgE7w10jV?=
 =?us-ascii?Q?GVVOKDLTLAfMKdFB3y2mQl5E6dNBRmrqBMIGgpmgR0OutjCw05r9Qedu/PfW?=
 =?us-ascii?Q?v0n2/vqEvzHnWxahIKPXJGa+PG7H2toH0z7GjilCo2Dghz4tQOg9XnXRDalh?=
 =?us-ascii?Q?WB/Rf2rMbmMiqCF5LfgIa4oZiX2Qs5Ka6YLv8JAjYYpU2vttALXeV1sZd2Rv?=
 =?us-ascii?Q?WUm8mEIkVaV/AbQSrpOOt52FblWrt3cNSZF9pJqMwMPZVLVI1lZnlbJEzkXc?=
 =?us-ascii?Q?7WVtJWyquI0Zi9rV6a21JXFboUjy6RIEz3rslv2YLxd/FlV3Amn1SIb+PzgG?=
 =?us-ascii?Q?SyG6lUOKelaYoDwIciMVGLHUpQdgEVQr0aR0JbzUDvElg3P3YDbEjC6YYzmk?=
 =?us-ascii?Q?2BipcDi03dagB/zBN00ynDE2F4CgB5UrR9LbVsNh6ZKz/X9w38H98gO4guUf?=
 =?us-ascii?Q?Z11aDfEkhcv7oPbFmRIjXVr1R7WxDMZEYGB3+LGTpUaSPFKdYF+Homt1Nfu/?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be39dc8-b42a-4fce-04f9-08dc89b6e5e0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 01:36:21.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9GHS2p60OojWqVyrbTspBAiqYwSp9C1xKd9hnYPv3p/cH5D3rB9RpVmDhxosdzGKe14k2au+6Yia7SWkEgScA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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

On Mon, Jun 10, 2024 at 05:36:10PM -0700, John Harrison wrote:
> On 6/10/2024 07:18, Matthew Brost wrote:
> > In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> > scheduling enable needs to be toggled to properly sample the timestamp.
> > If a job has not been running for longer than the timeout period,
> > re-enable scheduling and restart the TDR.
> > 
> > v2:
> >   - Use GT clock to msec helper (Umesh, off list)
> >   - s/ctx_timestamp_job/ctx_job_timestamp
> > v3:
> >   - Fix state machine for TDR, mainly decouple sched disable and
> >     deregister (testing)
> >   - Rebase (CI)
> > v4:
> >   - Fix checkpatch && newline issue (CI)
> >   - Do not deregister on wedged or unregistered (CI)
> >   - Fix refcounting bugs (CI)
> >   - Move devcoredump above VM / kernel job check (John H)
> >   - Add comment for check_timeout state usage (John H)
> >   - Assert pending disable not inflight when enabling scheduling (John H)
> >   - Use enable_scheduling in other scheduling enable code (John H)
> >   - Add comments on a few steps in TDR (John H)
> >   - Add assert for timestamp overflow protection (John H)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 297 +++++++++++++++++++++++------
> >   1 file changed, 238 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3db0aa40535d..8daf4e076df4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -23,6 +23,7 @@
> >   #include "xe_force_wake.h"
> >   #include "xe_gpu_scheduler.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_clock.h"
> >   #include "xe_gt_printk.h"
> >   #include "xe_guc.h"
> >   #include "xe_guc_ct.h"
> > @@ -62,6 +63,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >   #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> >   #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> >   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> >   static bool exec_queue_registered(struct xe_exec_queue *q)
> >   {
> > @@ -188,6 +191,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> >   }
> > +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > +}
> > +
> > +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > +}
> > +
> > +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >   {
> >   	return (atomic_read(&q->guc->state) &
> > @@ -920,6 +948,107 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	xe_sched_submission_start(sched);
> >   }
> > +#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
> > +
> > +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > +	u32 diff, running_time_ms;
> > +
> > +	/*
> > +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > +	 * possible overflows with a high timeout.
> > +	 */
> > +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > +
> > +	if (ctx_timestamp < ctx_job_timestamp)
> > +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +	else
> > +		diff = ctx_timestamp - ctx_job_timestamp;
> > +
> > +	/*
> > +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> > +	 */
> > +	running_time_ms =
> > +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > +
> > +	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
> xe_gt_info
> 

Yep. Actually going to use xe_gt_dbg.

> > +		 "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%u, timeout_ms=%u, diff=0x%08x",
> Any reason to print the diff as hex?
>

I think I did this because the diff corresponds to a register value. Can
change if you feel strongly.

> > +		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		 q->guc->id, running_time_ms, timeout_ms, diff);
> > +
> > +	return running_time_ms >= timeout_ms;
> > +}
> > +
> > +static void enable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	int ret;
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +
> > +	set_exec_queue_pending_enable(q);
> > +	set_exec_queue_enabled(q);
> > +	trace_xe_exec_queue_scheduling_enable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +
> > +	ret = wait_event_timeout(guc->ct.wq,
> > +				 !exec_queue_pending_enable(q) ||
> > +				 guc_read_stopped(guc), HZ * 5);
> > +	if (!ret || guc_read_stopped(guc)) {
> > +		drm_warn(&xe->drm, "Schedule enable failed to respond");
> xe_gt_warn
> 

Yep.

> > +		set_exec_queue_banned(q);
> > +		xe_gt_reset_async(q->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +	}
> > +}
> > +
> > +static void disable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> Should there not also be an assert that pending_enable is not set?
> 

We can still pipeline those in the case suspend / resume (preempt
fences). We could change that in a follow up but could potentially add
latency to preempt fences.

> > +
> > +	clear_exec_queue_enabled(q);
> > +	set_exec_queue_pending_disable(q);
> > +	trace_xe_exec_queue_scheduling_disable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +}
> > +
> > +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > +		q->guc->id,
> > +	};
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	set_exec_queue_destroyed(q);
> > +	trace_xe_exec_queue_deregister(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > +}
> > +
> >   static enum drm_gpu_sched_stat
> >   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -928,9 +1057,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	int err = -ETIME;
> >   	int i = 0;
> > -	bool wedged;
> > +	bool wedged, skip_timeout_check;
> >   	/*
> >   	 * TDR has fired before free job worker. Common if exec queue
> > @@ -942,49 +1072,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   		return DRM_GPU_SCHED_STAT_NOMINAL;
> >   	}
> > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		   q->guc->id, q->flags);
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -
> > -	if (!exec_queue_killed(q))
> > -		xe_devcoredump(job);
> > -
> > -	trace_xe_sched_job_timedout(job);
> > -
> > -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -
> >   	/* Kill the run_job entry point */
> >   	xe_sched_submission_stop(sched);
> > +	/* Must check all state after stopping scheduler */
> > +	skip_timeout_check = exec_queue_reset(q) ||
> > +		exec_queue_killed_or_banned_or_wedged(q) ||
> > +		exec_queue_destroyed(q);
> > +
> > +	/* Job hasn't started, can't be timed out */
> > +	if (!skip_timeout_check && !xe_sched_job_started(job))
> > +		goto rearm;
> > +
> >   	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > +	 * modify scheduling state to read timestamp. We could read the
> > +	 * timestamp from a register to accumulate current running time but this
> > +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > +	 * genuine timeouts.
> >   	 */
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > -			xe_gt_reset_async(q->gt);
> > -			goto out;
> > -		}
> > -	}
> > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -	/* Engine state now stable, disable scheduling if needed */
> > +	/* Engine state now stable, disable scheduling to check timestamp */
> >   	if (!wedged && exec_queue_registered(q)) {
> > -		struct xe_guc *guc = exec_queue_to_guc(q);
> >   		int ret;
> >   		if (exec_queue_reset(q))
> >   			err = -EIO;
> > -		set_exec_queue_banned(q);
> > +
> >   		if (!exec_queue_destroyed(q)) {
> > -			xe_exec_queue_get(q);
> > -			disable_scheduling_deregister(guc, q);
> > +			/*
> > +			 * Wait for any pending G2H to flush out before
> > +			 * modifying state
> > +			 */
> > +			ret = wait_event_timeout(guc->ct.wq,
> > +						 !exec_queue_pending_enable(q) ||
> > +						 guc_read_stopped(guc), HZ * 5);
> > +			if (!ret || guc_read_stopped(guc))
> > +				goto trigger_reset;
> > +
> > +			/*
> > +			 * Flag communicates to G2H handler that schedule
> > +			 * disable originated from a timeout check. The G2H then
> > +			 * avoid triggering cleanup or deregistering the exec
> > +			 * queue.
> > +			 */
> > +			set_exec_queue_check_timeout(q);
> > +			disable_scheduling(q);
> >   		}
> >   		/*
> > @@ -1000,15 +1134,61 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   					 !exec_queue_pending_disable(q) ||
> >   					 guc_read_stopped(guc), HZ * 5);
> >   		if (!ret || guc_read_stopped(guc)) {
> > +trigger_reset:
> >   			drm_warn(&xe->drm, "Schedule disable failed to respond");
> xe_gt_warn
> 

Yep.

> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > +			clear_exec_queue_check_timeout(q);
> > +			set_exec_queue_extra_ref(q);
> > +			xe_exec_queue_get(q);	/* GT reset owns this */
> > +			set_exec_queue_banned(q);
> >   			xe_gt_reset_async(q->gt);
> >   			xe_sched_tdr_queue_imm(sched);
> > -			goto out;
> > +			goto rearm;
> >   		}
> >   	}
> > +	/*
> > +	 * Check if job is actually timed out, if restart job execution and TDR
> if so
> 

Yep.

> > +	 */
> > +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> > +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> > +		clear_exec_queue_check_timeout(q);
> > +		goto sched_enable;
> > +	}
> > +
> > +	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> xe_gt_notice
> 

Yep.

> > +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		   q->guc->id, q->flags);
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > +		   "Kernel-submitted job timed out\n");
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > +		   "VM job timed out on non-killed execqueue\n");
> > +
> > +	trace_xe_sched_job_timedout(job);
> > +
> > +	if (!exec_queue_killed(q))
> > +		xe_devcoredump(job);
> > +
> > +	/*
> > +	 * Kernel jobs should never fail, nor should VM jobs if they do
> > +	 * somethings has gone wrong and the GT needs a reset
> > +	 */
> Seems like the above two WARNs should at least be after this comment and
> maybe inside the 'if(!wedged)'?
> 

I don't think so. Even wedgingthe device EXEC_QUEUE_FLAG_KERNEL &
EXEC_QUEUE_FLAG_VM should not timeout. But if that occurs and wedging we
shouldn't issue a GT reset and rearm which is what the below if
statement is protects again. Also this is existing code and we should
change unrelated behavior in this patch.

> > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +		if (!xe_sched_invalidate_job(job, 2)) {
> > +			clear_exec_queue_check_timeout(q);
> > +			xe_gt_reset_async(q->gt);
> > +			goto rearm;
> > +		}
> > +	}
> > +
> > +	/* Finish cleaning up exec queue via deregister */
> > +	set_exec_queue_banned(q);
> > +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > +		set_exec_queue_extra_ref(q);
> > +		xe_exec_queue_get(q);
> > +		__deregister_exec_queue(guc, q);
> > +	}
> > +
> >   	/* Stop fence signaling */
> >   	xe_hw_fence_irq_stop(q->fence_irq);
> > @@ -1030,7 +1210,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	/* Start fence signaling */
> >   	xe_hw_fence_irq_start(q->fence_irq);
> > -out:
> > +	return DRM_GPU_SCHED_STAT_NOMINAL;
> > +
> > +sched_enable:
> > +	enable_scheduling(q);
> > +rearm:
> > +	/*
> > +	 * XXX: Ideally want to adjust timeout based on current exection time
> > +	 * but there is not currently an easy way to do in DRM scheduler. With
> > +	 * some thought, do this in a follow up.
> > +	 */
> > +	xe_sched_add_pending_job(sched, job);
> > +	xe_sched_submission_start(sched);
> > +
> >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> >   }
> > @@ -1133,7 +1325,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >   			   guc_read_stopped(guc));
> >   		if (!guc_read_stopped(guc)) {
> > -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> >   			s64 since_resume_ms =
> >   				ktime_ms_delta(ktime_get(),
> >   					       q->guc->resume_time);
> > @@ -1144,12 +1335,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >   				msleep(wait_ms);
> >   			set_exec_queue_suspended(q);
> > -			clear_exec_queue_enabled(q);
> > -			set_exec_queue_pending_disable(q);
> > -			trace_xe_exec_queue_scheduling_disable(q);
> > -
> > -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +			disable_scheduling(q);
> >   		}
> >   	} else if (q->guc->suspend_pending) {
> >   		set_exec_queue_suspended(q);
> > @@ -1160,19 +1346,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >   static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> >   {
> >   	struct xe_exec_queue *q = msg->private_data;
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	if (guc_exec_queue_allowed_to_change_state(q)) {
> > -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > -
> >   		q->guc->resume_time = RESUME_PENDING;
> >   		clear_exec_queue_suspended(q);
> > -		set_exec_queue_pending_enable(q);
> > -		set_exec_queue_enabled(q);
> > -		trace_xe_exec_queue_scheduling_enable(q);
> > -
> > -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +		enable_scheduling(q);
> >   	} else {
> >   		clear_exec_queue_suspended(q);
> >   	}
> > @@ -1434,8 +1612,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	/* Clean up lost G2H + reset engine state */
> >   	if (exec_queue_registered(q)) {
> > -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> > -		    xe_exec_queue_is_lr(q))
> > +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >   			xe_exec_queue_put(q);
> >   		else if (exec_queue_destroyed(q))
> >   			__guc_exec_queue_fini(guc, q);
> > @@ -1615,11 +1792,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >   		if (q->guc->suspend_pending) {
> >   			suspend_fence_signal(q);
> >   		} else {
> > -			if (exec_queue_banned(q)) {
> > +			if (exec_queue_banned(q) ||
> > +			    exec_queue_check_timeout(q)) {
> >   				smp_wmb();
> >   				wake_up_all(&guc->ct.wq);
> >   			}
> > -			deregister_exec_queue(guc, q);
> > +			if (!exec_queue_check_timeout(q))
> > +				deregister_exec_queue(guc, q);
> >   		}
> >   	}
> >   }
> > @@ -1657,7 +1836,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	clear_exec_queue_registered(q);
> > -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> > +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >   		xe_exec_queue_put(q);
> >   	else
> >   		__guc_exec_queue_fini(guc, q);
> > @@ -1720,7 +1899,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 * guc_exec_queue_timedout_job.
> >   	 */
> >   	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >   		xe_guc_exec_queue_trigger_cleanup(q);
> >   	return 0;
> > @@ -1750,7 +1929,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> Why the !check_timeout here and in the reset_handler above? Surely we do
> want to do all the relevant clean up if the context has just been reset
> and/or triggered a cat error? If this is because otherwise internal state is
> going to get messed up when the timeout check resumes processing then it
> should have a comment to explain that.
> 

The TDR is already running. The TDR owns updating its state at this
point.

Matt

> John.
> 
> >   		xe_guc_exec_queue_trigger_cleanup(q);
> >   	return 0;
> 
