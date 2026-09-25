Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCFEC9831E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 03:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0488920D;
	Fri, 25 Sep 2026 03:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tafvdd+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB5D8920D
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 03:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790306520; x=1821842520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oHdPlqdhgrOyKOhFCf7KxhkRd/AWmUSi1Uguw4Mom20=;
 b=Tafvdd+CLdrxVGeIxWq0q/hF+m4TpXbYyorDsSFs/1uDrXO4IaNXIgwW
 LAXzdHPGMbFdPsid8ExWuJDZQJ1NpsYy86bcwxXCJU3ZNMUskXhwsMKBK
 TWnQuTPUIB6keApny3BjbYMUw/ZxC/y/qhB0JPXIyTQCOf7Mp12L+RQBw
 eMofnqrdf1xOH5hXS37nPS8EgGlXddj7tJT/DNSDLhiyJBXxW2riB8Qfw
 EIohUqOzeQGHV/vEJF2Hg58UsCgUh4Rsz0nrGaSqklE85TRvoC0NfyjBL
 iDIoTv4quVdEKtgvl2vczH/flgYQB3q1+bdHszRzoMkJlpkhu88L/rpOk A==;
X-CSE-ConnectionGUID: rYfI5eDbSP2lNg/XAqAXOw==
X-CSE-MsgGUID: dbK5ik1pQpCeN6yrLZcEcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90311414"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90311414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 20:21:58 -0700
X-CSE-ConnectionGUID: MzGS6XEkTqmm0kYKOgEbHA==
X-CSE-MsgGUID: d6b6oebdTxqhLPrdIP+++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="277375520"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 20:21:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 20:21:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 20:21:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 20:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRlYPX8qOnpCfMR+pCOH874kEWEIChgiXROSAoTlnYA8dM4nuVZ1t5b1B5watBqicR8TcOSdvudcfzsGZNp/Hjkk1uXO+w4mfruW5rNgqtymWMcJFUDErIJRomIBNC4zeYHxko20Vga/4soLcSSHBmqPTTcq1EiWMQK7BMCkABhGNeT1IN6eQwPMpFV6TeR9miZq9ZHgYT2iopyGKi2mdAbjTLS+CiIYOZBQ2PpJfqhghUd7IxIjZo6W2N6RYHvvjmAcLqvxEYitJw4NkKjt1IoPOlb/GRSOLmVUvekYeX5o1T20LgvvPXKG6ohRI9z186fGAGG3nTvOzJMDQ7a1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llg9kfDzxKySL9lgcyfbCFsVKJ7mFAOOHwdbkg2vrxs=;
 b=VNcD6kI9KW/AVi5NVDcFm0TRwJ3/EOuSQOnoIiCM7jRg5URCBqdvsOZphXOwvAYda8oDQ+PuKZ0mPQU7lSxASOsvDQzKzfJR05C3uARXcMECnDMvTakMN9o39dgqubCpscZP6VpQaBNQv1gfACAVqRzmwZX3jWvBO6qlckPZYvht9FXGIUDpTYl+3BF/l4bcY/EXknuU+DAJKiP/HeN5hyci/EE2WOt3H9CW/5k3dPGyMtzOa82icJCdys1eGAE5aivgVNc7RGnCDFgujeO4r7ZNsP+JPeJioLy502d09Uh2n3FDwaMLylLb0GkzqE86Baf+sFK+zQnJGEgymKYfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Fri, 25 Sep
 2026 03:21:48 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 03:21:48 +0000
Date: Thu, 24 Sep 2026 20:21:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 20/24] drm/xe: Add ULLS migration job support to ring
 ops
Message-ID: <arXoyqKgiTMQbgHY@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-21-matthew.brost@intel.com>
 <DM4PR11MB5456BA1AE40A76C8036B9C21EA832@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456BA1AE40A76C8036B9C21EA832@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: ff286f05-f73c-4df4-865f-08df1ab42246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|3023799007|10067099003|56012099006|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 71HmL9PHMYrg31gaNXn0EqoyhB4/rveYNy0R4sfLqnCdtD3/P+EupGrCBFEFT4lYT86GQRPwKVpX/uxtdZYvNaQSvXIgJzOIa9mDE7YcBPXVrmqBRRlhONJ+yCWjrPrV0o6Z/wUERJ37nUuFu3PNmzgk2iSPyJ8lSubooNN1aNEqB9fmr05+9IXdH7f2bk+Td7ZTQK+JfA+ISD9B81hKQ95bQfBTkYR0gewSqTf3s4AtT7WyKjg6Cb4rABeiYGgOOc/BFUdwmbsWsWhKya/QRqt6tHtbdHV/e+x8qYPDNRVUR2NoyNn+OOZ6rzTV9ie5kMfGm+KkvNjD2DdCR5UXsVUEQuSUyb7dxS82ImwxVZljsuip4BbtKq3WMvh3QBnBC4IX2aO2gZToWvcqxk/PquICCmxzmXT74gzigclaFzvN2xUJEbxzG//gq0dJpkjB3wC8nOtKCclu/XWo/qq7HEW1ZdoHg+AvUd3XWnkp4zpW/9PZwNnRn0X9pLLT0RPf0Rx/pxrD82A35/lW70QtnmMVJqwrRmWx2QCQwAzJ7sPovM6Lfw1+JLGgua/ShLCxBanYJKHKm/cLbccmSHaG4A/kHTzhDU/XVT5i8ksgE3D/tS/25eMgv7jplbccwNFG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jTBL68DlDfoMiE5KMcVmZMRfn0H9o30i2MF4HfGe6PfkFzWN3Uz2zkKueYnf?=
 =?us-ascii?Q?b2NSvA7DuUrO6y47MWHRu8BmG3pX2IEeD0lEUiFr3Nar5QA29rEHW7iyqxjb?=
 =?us-ascii?Q?Rr5bVEUDaAi3kwuknWrBqU+PGNRt2jO+qIOzVwvGCo25xOjfiV1k+BQFL4eL?=
 =?us-ascii?Q?8NoQxWfZ1XFup9ZgNZE+XJtHUXkE40q4E3WpBKufW6ZJ04at9L4QUuZCn3PH?=
 =?us-ascii?Q?EuHwaRp9bac1V5gyQZrPxN9e0kyh8Y7C8zun3D505ygl2zvfprRjaO5wi25l?=
 =?us-ascii?Q?xWBMH9qfux4Sr1Ju494BYW8oATRHUjkspzUWWcSdnJ9Oh/ouYEFAd7bAdDEd?=
 =?us-ascii?Q?4VJKlRM+SOL7YVcXXuc+NfpbEyaH4HAGPj5gLcxJg3aZj4UWM04xxmQaijtE?=
 =?us-ascii?Q?iJA1SopLBhpD+ZOH8Oa0PtGKI0Yn6LHCNc/xJfmQUlQgOOaABvfzxIc/0Qyo?=
 =?us-ascii?Q?/J9ishAmSjJS4bRCKV0HU709fI9LVXxJegzSSm3tRlZL8SkOPTLqGFzVJ7NY?=
 =?us-ascii?Q?xBJr40i2qLt5Q/BkUV2VB6ZHy4nRVgE5AwX8E7ycPzON2NoihPG011TTiiU1?=
 =?us-ascii?Q?n8RNFG0bdLneexb8V7EwHsKPU1nI+sVyPmLTv0HvgPpaTZbFnbjwtonCwvYc?=
 =?us-ascii?Q?ibB7mdAxS9ONDiY1B3+93CoWPmUhLs0xKY4vmMKeFMAHPVJqaJefybOmnTj0?=
 =?us-ascii?Q?q0aeeUBQeoFfoqXT1LWcbIAsG5Qi5WrJcXCKdzIKpzV0lNBoZxPiVcrqMf/D?=
 =?us-ascii?Q?ALKmKyksTJQzTSNsCsGpS/qyGKhaetQ2Wr8tFNN4drCIOydQtdBI+B2H0Tn7?=
 =?us-ascii?Q?DRNYg7fkag5x9uA1rVOY9qxe7nwPTSeUXj1LPGrApVd+pSRZoqrozhtUD4ML?=
 =?us-ascii?Q?Q1E7jmbbpVgKKYKqbdApvXdnM1Xk7Q9JzEi5Q4WvWILm4niHlLaEuNIq1yDj?=
 =?us-ascii?Q?RDGrSpCJ1YtSeci4OQkQ9yxfbSsNvKZZfDMdixtNX1xCenhMhaO1t4SsSIn6?=
 =?us-ascii?Q?yjEzp2UluPudNwazJ3iQjb6hNY+gLMBTTX/5pJUgMiYr0q0K1cLKcJ5w2dKE?=
 =?us-ascii?Q?OSnfOfoTbJHJfJfrN3GZGXRVO6fjHTQSBEn20Jw+Qh1SYtieOm3F4Nrzm9tv?=
 =?us-ascii?Q?bepQdCg+zPaCC0o+MgCc8texA3Q4BmWI4I/pgOcvcDto5V5nMX05tJs1VeJd?=
 =?us-ascii?Q?ec7gMjXMdlR4xGMymwxitEOgKWaH1InC9GzXut1SfjFZ8zaG1050VA7JdDXp?=
 =?us-ascii?Q?dtp5AeZxNhXTnGouKLHXTB+QzVrq5oOvN1i00TdmwD4Vj/2VBobyP1DqM6rR?=
 =?us-ascii?Q?wtc68ns0eqsC9eFudxUJbSpMXgSfMcR8uU42Va36pFZThNsw4TKmgfY5BqZA?=
 =?us-ascii?Q?1AaYIG2cpWAgIcAlTIX+Ex3NlsZnRkoMGdLNKNXx0BRtCc8lZlxbTps2RS4s?=
 =?us-ascii?Q?G10T/btRRIidbkxE4oSasnAeoeVXG4SNQNJMTSwUR1tSyMPJYYvOw2JTHCFu?=
 =?us-ascii?Q?m04abULc53wThvDnjBlbmHZGYv8z+ronDvTqudwkVcGwmc2F2E3WgX6KUhth?=
 =?us-ascii?Q?Qe+OG1Q7Q3kd7jAOtTnQp89MujOgs1rKXCKoKKnmT0n9s3FTSCoAvcDgX4eh?=
 =?us-ascii?Q?8DDHJTe9Cmm+J+B0cijIHpoqyI+0jANZwwPfjeACxLBHx9PwdfgAcpLyxoVt?=
 =?us-ascii?Q?TRHBkxWy3ZDi0Pmi5bTFKCyXdjF+JAJJnCo1Mbr2gHmdhfnU+Np27OIl6kjY?=
 =?us-ascii?Q?vLsd0RfTZA=3D=3D?=
X-Exchange-RoutingPolicyChecked: UJAFFQXGBg9wzUnWHtZT8O6DSs6Lph9uDOtYNlPyj3JnOaWlccM8nRcSEitRa46ZQPMSo/8t4tp1A9ANDnn5mGp+ugLeLWnh/+K02x6dbyP6Eh2taTaJYCXkG8prO4iHX8TvXn1LfROyJi+0zA15A3+vyUOdKyf7fjib38hlQXuRTfwdmGwQuWvzp9+us+6WGdb3uXxd6ZXHB0cdgigwpPBeHq3N9QwF2Kn1twc5ykyywtXPFlen09y9lIYK9B0z+GLzNdG7j0sneuwbOMMpBqP9+VKmxR+t9T55G22rlpSdGHQ1vrtD6C4aA5q/tyACngc0F0rYBHe+mJCOjDKkMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff286f05-f73c-4df4-865f-08df1ab42246
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 03:21:48.2229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2N9NLGo4smS+LevH8aWoet2CddBJxnehYl7aENJfYjV4VrAwGE2iMNlh45C2l8OGCfaXQOtcqrsBEKB3j3vnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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

On Tue, Sep 22, 2026 at 05:07:54PM -0600, Lin, Shuicheng wrote:
> On Fri, Sep 4, 2026 2:16 PM Matthew Brost wrote:
> > Add preamble and postamble for ULLS migrations jobs. Preamble clears
> > current semaphore for reuse. Postamble waits on next semaphore which is set
> > upon next job submission, then advances the ring tail over that job with an LRI
> > to RING_TAIL, so submitting it costs the CPU nothing beyond signalling the
> > semaphore.
> > 
> > A job updates the tail on behalf of a successor which has not been emitted yet,
> > so it cannot know how much ring that successor will occupy.
> > Pad every ULLS job out to a fixed ULLS_JOB_SIZE_BYTES, which makes the next
> > tail derivable from where the current job starts. The pad also supplies the
> > NOPs which must follow an in-ring tail update.
> > 
> > The last ULLS migration job skips BB submission, the postamble and the tail
> > update (clear current semaphore, write seqno, exit ULLS), padding the
> > difference so that it still fills a job slot.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Link: https://patch.msgid.link/20260228013501.106680-23-
> > matthew.brost@intel.com
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c       | 86 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_ring_ops_types.h | 24 +++++++
> >  2 files changed, 110 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 39a670e91ba7..f05b4276c8d1 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -494,6 +494,79 @@ static void
> > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));  }
> > 
> > +static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32
> > +seqno) {
> > +	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
> > +
> > +	return emit_store_imm_ggtt(addr,
> > LRC_MIGRATION_ULLS_SEMAPHORE_CLEAR,
> > +				   dw, i);
> > +}
> > +
> > +/*
> > + * Advance the ring tail from within the ring, so submitting the next
> > +ULLS job
> > + * needs nothing from the CPU beyond signalling the semaphore. All ULLS
> > +jobs
> > + * occupy exactly ULLS_JOB_SIZE_BYTES, so the tail the next job ends at
> > +is two
> > + * job slots on from where this job started, even though that job has
> > +not been
> > + * emitted yet.
> > + *
> > + * The saved tail is written before the tail register so that a context
> > +save
> > + * racing the pair can only restore a tail behind the register, never
> > +ahead of
> > + * it. The register write is deliberately not MI_LRI_FORCE_POSTED:
> > +posted, the
> > + * new tail can land after the command streamer has already drained
> > +this job,
> > + * at which point it sees an empty ring, parks, and can be taken off
> > +the
> > + * hardware with no H2G left to bring it back.
> > + *
> > + * The tail is published before the semaphore wait rather than after
> > +it, so
> > + * that the non-posted write drains while the engine is parked anyway
> > +instead
> > + * of adding a register round trip after the semaphore is signalled.
> > + */
> > +static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
> > +			       int i, u32 head)
> > +{
> > +	u32 next_tail = (head + 2 * ULLS_JOB_SIZE_BYTES) & (lrc->ring.size -
> > +1);
> > +
> > +	xe_gt_assert(gt, IS_ALIGNED(next_tail, 8));
> > +
> > +	i = emit_store_imm_ggtt(xe_lrc_ring_tail_ggtt_addr(lrc), next_tail,
> > +				dw, i);
> > +
> > +	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> > +		MI_LRI_LRM_CS_MMIO;
> > +	dw[i++] = RING_TAIL(0).addr;
> > +	dw[i++] = next_tail;
> > +
> > +	return i;
> > +}
> > +
> > +/* Publish the next job's tail, then park the engine on its semaphore
> 
> One question, while tail is updated and the next job is not filled yet,
> Will HW prefetch the stale ring buffer?
> I assume it should not be an issue, just want to confirm it. Thanks.
> 

When I changed from MMIO ring tail move to a ring instruction move, at
one point I disabled the pre-parser when I was chasing bugs here. It
doesn't appear to be needed - I believe the semaphore after this acts as
barrier in the ring prefetch for what I can tell.

Matt

> Rest LGTM. With the question be cleared:
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> 
> > +*/ static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
> > +			       int i, u32 seqno, u32 head)
> > +{
> > +	i = emit_ulls_ring_tail(gt, lrc, dw, i, head);
> > +
> > +	dw[i++] = MI_SEMAPHORE_WAIT |
> > +		MI_SEMW_GGTT |
> > +		MI_SEMW_POLL |
> > +		MI_SEMW_COMPARE(SAD_EQ_SDD);
> > +	dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
> > +	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
> > +	dw[i++] = 0;
> > +	dw[i++] = 0;
> > +
> > +	return i;
> > +}
> > +
> > +/* Pad out to the fixed ULLS job size */ static int
> > +emit_ulls_pad(struct xe_gt *gt, u32 *dw, int i) {
> > +	xe_gt_assert(gt, i <= ULLS_JOB_SIZE_DW);
> > +
> > +	while (i < ULLS_JOB_SIZE_DW)
> > +		dw[i++] = MI_NOOP;
> > +
> > +	return i;
> > +}
> > +
> >  static void emit_migration_job_gen12(struct xe_sched_job *job,
> >  				     struct xe_lrc *lrc, u32 *head,
> >  				     u32 seqno)
> > @@ -507,10 +580,16 @@ static void emit_migration_job_gen12(struct
> > xe_sched_job *job,
> > 
> >  	xe_gt_assert(gt, !job->ring_ops_force_reset);
> > 
> > +	if (xe_sched_job_is_ulls(job))
> > +		i = emit_ulls_preamble(lrc, dw, i, seqno);
> > +
> >  	i = emit_copy_timestamp(xe, lrc, dw, i);
> > 
> >  	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> > 
> > +	if (!xe_sched_job_ulls_has_batch(job))
> > +		goto seqno_write;
> > +
> >  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again
> > below */
> > 
> >  	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i); @@ -521,12
> > +600,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
> > 
> >  	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
> > 
> > +seqno_write:
> >  	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> >  				job->migrate_flush_flags,
> >  				dw, i);
> > 
> >  	i = emit_user_interrupt(dw, i);
> > 
> > +	if (xe_sched_job_ulls_parks(job))
> > +		i = emit_ulls_postamble(gt, lrc, dw, i, seqno, *head);
> > +
> > +	if (xe_sched_job_is_ulls(job))
> > +		i = emit_ulls_pad(gt, dw, i);
> > +
> >  	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
> > 
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); diff --git
> > a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > index 52ff96bc4100..ea4af321dd7c 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_RING_OPS_TYPES_H_
> >  #define _XE_RING_OPS_TYPES_H_
> > 
> > +#include <linux/build_bug.h>
> >  #include <linux/types.h>
> > 
> >  struct xe_gt;
> > @@ -14,6 +15,29 @@ struct xe_sched_job;
> >  #define MAX_JOB_SIZE_DW 74
> >  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
> > 
> > +/*
> > + * ULLS migration jobs advance the ring tail from within the ring
> > +itself, so a
> > + * job has to know where its successor will end before that successor
> > +has been
> > + * emitted. Every ULLS job is therefore padded to a fixed size, letting
> > +the
> > + * next tail be derived arithmetically.
> > + *
> > + * Sized for the largest such job, emitted by emit_migration_job_gen12():
> > + * preamble (4), copy timestamp (8, its size on an SRIOV VF), start
> > +seqno
> > + * store (4), arbitration off (1), batch buffer starts (2 * 3),
> > +pre-parser
> > + * bracketed flush invalidate (6), seqno flush (4), user interrupt (3)
> > +and
> > + * postamble (7 + 5).
> > + */
> > +#define ULLS_JOB_SIZE_DW 48
> > +#define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)
> > +
> > +/*
> > + * RING_TAIL only encodes a qword aligned offset, and
> > +xe_lrc_write_ring()
> > + * appends a NOP to anything shorter, either of which would
> > +desynchronise the
> > + * ring from the tail a job predicts for its successor.
> > + */
> > +static_assert(ULLS_JOB_SIZE_BYTES % 8 == 0);
> > +static_assert(ULLS_JOB_SIZE_DW <= MAX_JOB_SIZE_DW);
> > +
> >  /**
> >   * struct xe_ring_ops - Ring operations
> >   */
> > --
> > 2.34.1
> 
