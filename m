Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72803EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 02:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1CA10E39F;
	Wed, 21 Jun 2023 02:10:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700410E39F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 02:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687313452; x=1718849452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BSCcc/tkJdRJY18bOBwlBGixisTH/SJ3icGLMN1u35I=;
 b=cgwecPLTO7Sc5oIFQfSdQBZOEoOOCHoIwhYa9PeaOBqieWMt0NfalsfM
 /fBo7OPj87MPPFgroAV8y2mh9tjS4XGIpA/KEfO7MjlWt6jyTQpsh84fg
 K20XNfaZomL4myXPIEKprbH4ILmeqFzowJowTyYy+VTqhH9B5SM1d51m6
 JY3XurFXcd3fOB9hcePrCeqWxRr0UYsfkGAu4530D7josNQdwcriKjOc8
 vrqvGVl2+QC/2tCHYK3/+fI2xAdNx+GKpJ2dQfpjKbls/booT6xrkNVYO
 HzMD3nr6Nt8zk4k/RMId7tCgWf+lvWLYs7pg1qWV/saZbSRBxTx32rGvL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423704906"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="423704906"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 19:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="804174782"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="804174782"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2023 19:10:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 19:10:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 19:10:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 19:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0nlE0rbJG5r0twz1YBgvkxXQJYO3QkWYhO+utw4r0kGqLk141lA4nV5GSEayo+HldA9LRW/9POOqkUHUIy9SA6ZdoXY77SQAsD/Wu+TIGa7asRRf2mOK9P1shXE/LYtqbYlGtTBGJ4d76tY0pvliZ7k0CSc6/P8bVhlX61RsAiNxthwhVzoYvJuR1Y2wT1qULaacSrni+s32rrhGx8cRiw6+6x4nstK0ZZ6A/9M6HgaGxC0P91HANXgR/TX+bBlXFjAiXWuGYmHXb/doD5JT9XEtGWMHRXPzmtGuo9Um5tZVj2hmZwPDH9NuhFG1uySxaRK3pCnp6/XH7kSNECYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qLIwAsm4lsUpLiyEwlrq05yCX7I9dlwtqE7neWj2iw=;
 b=iTq7c0wtvijWumGhPnLSzKeLesAsvXS+hq6mZzvqO0EK5YMI2imOzGTsEGSs4vYUBycxprL5p4ppl2IwEOVlKokqKRhM/VforkY+iCv0xCCiex01VDkKbFfT6040ezbaK3I8m3yZM2XC1KTJmi2XFjt71mPlduwWm5vAKA3dwtNM3LyL5SEH976SY+QP6y95fZvbSM92NgD1kJRVrMEspGv4Szuq9XrCcJJsm/R49/w4FOpprg9gqjEki3jt6M4QNGcP3WYbMFmNSQbqZv5LvdkpKYs/MVuc7ZH+EDDN5d+A6KpAcL91P1s0nTYkb6XFmqY6YO35FTegwBifAMkYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Wed, 21 Jun 2023 02:10:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 02:10:45 +0000
Date: Tue, 20 Jun 2023 19:10:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230621021043.GC5433@mdroper-desk1.amr.corp.intel.com>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
 <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
 <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
 <oekkd7ikdekbxmqaumvffxxxmgimawic232muweq4c2vgjpd7q@4fkzr5dpx55o>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <oekkd7ikdekbxmqaumvffxxxmgimawic232muweq4c2vgjpd7q@4fkzr5dpx55o>
X-ClientProxiedBy: BYAPR06CA0067.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::44) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5b2e2d-9bde-493d-f629-08db71fcb90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MtiymGDR83cca3PP9WX9M/Mujk0zPerwCaWiFS35JHcsntx3q92AhIDZ5GvkIIsuUwApaiyXYjcWRqSi9WJAv+w7SDviORI0p+LL61PmUn1z+4ZGlJld8QXhedyAvNQd6bPp9Mky0DwlmFULP1OiZp45bvU1QRBJgLMISeNKM4GLETXrQktXm78otLRR6noMRHaoN6HwyepK9DGKAah7f2qxWk+fK5ccqC31aZRlGxs4r91TK5rVnjp+yAA/oOGshGsQFcWqEbm0qQeQYNxCF168QMfm7P+K5aYO3Vi/E9nlKdNnzIj/yHbAkvvsGckkMxLN0L9Ml3Mzu9FApzUBJgzdAeEtUhuv74G6AcdkGoyQ/RW3S2TxxEYFN2NHc2webI4R0NignUTiLpcITQfsbym9p1P5FqUKenUT82zQ6qVE/5D3EfaWPUjgqHwkE9Q6UFBAq6RbAZp+ZQXHqCCwsKyFd1yRm/kVBpa5PJl26qflOFFXOTHVigzEcL22SnhQeekPCMHhGREflbrNiSuW5CZQmVXOEIlxHoJiFvqHA8KXzbxvdec7/EvJigDeGHFp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199021)(66946007)(53546011)(8936002)(66556008)(66476007)(8676002)(1076003)(186003)(26005)(6506007)(6512007)(82960400001)(83380400001)(41300700001)(38100700002)(6862004)(5660300002)(6636002)(4326008)(316002)(54906003)(30864003)(6486002)(478600001)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/kdguUO6DMUbhchvGu1D6Pw8AsVbHom0q6OL5jJnHTN8/NoXJ4e4q4fzJEvl?=
 =?us-ascii?Q?eEaVpB4jp7Ltl6FZhFhmRkXqeBWoUmSgva0CqDGdPgTuQkRfH9TXlhTm3voC?=
 =?us-ascii?Q?rCS35+6Pg7F9QX8E1Ler7Tcgtn3yAD1QFVzspBlmtxOomKG6VH6QVK3rPYSW?=
 =?us-ascii?Q?gPYVv9XT39t4Ugjvtk6C6R4duI1q78zwFAV5EeOndl8u+rX2kXpjNEyABEap?=
 =?us-ascii?Q?cnSjitSaMII1piV/ABOCc0EZYscLbIwGn/wNOnSogRJ5MmH9cxuAxP7gp+j1?=
 =?us-ascii?Q?AgteglDJEkxr8NIu951N0W1/YQJTHssO33J95HSBLFuFmERL1ZsB2hgrw087?=
 =?us-ascii?Q?cFiTx46WO/jAXXN7JyoDR1pr5lUF3AaDQb4Z7Wtz9HvpXtWIL5PTuhDeH9Ns?=
 =?us-ascii?Q?Uy2feE1MZkY7d0zGOoi+Ru4Sj6nmuqEzfYoBCIeJqou6XV+hbFW5gqCIO39l?=
 =?us-ascii?Q?/oXqoAGN9zvTODlq+BahG2m0I660XqqraWN/iWoHHvPXjyvH2bnMxDtt06e+?=
 =?us-ascii?Q?jwggCVE+UXGvXxGYzL7QmQlyjVv3xK28QXdricvJhomEr4C58g5QouKxni2l?=
 =?us-ascii?Q?HL5lbqUJ7AirTWU4B7Kypq07RPMPoZaTUD5jfLGIbEBQ5mPllWVKlZeFdaXR?=
 =?us-ascii?Q?oR7IAbvxaGi0pkdSQqIg//XyqudgGW8zjqpMrS7hCEf3beNLtvpieE7v66Ss?=
 =?us-ascii?Q?+a4v4lCkkVO5YNdU6jiVPlDBW7jCvFfYx4RyoZTgL+WLQ0xqQnTWRWwsSoow?=
 =?us-ascii?Q?QWq+CdMXWZJ1JY663Q2r7jmsf8eugY6CzxYnXP6NWhR9JUWqeesw0sbiI8MF?=
 =?us-ascii?Q?WBjGlYyXuc/0XPTKtp7bUyHh/ghDnCwOsrluwsZ0oZ2w33jg+AAW8lTDi6va?=
 =?us-ascii?Q?YEcpUF9/K773ytUaVd/gD1WblSR9WJ/m8ttVmjfhBXSPYvOL848eqom99wrx?=
 =?us-ascii?Q?O7aPxnrIl73X7GvaGCqUjzn1866swQ2jTxkp+Su4cAkdPmvK5wAUtNms2wDZ?=
 =?us-ascii?Q?pXXv436jq4cr24zavcCoKcCwB5Q8v8giV8xb5XJofyJ1VCwVS0otIPBSylFm?=
 =?us-ascii?Q?hsy4FpsygpTGGSQJS+/ZHYYl5R0ngqVwATnvSuMpz2fW8zueLNRSCJmV+730?=
 =?us-ascii?Q?gRuJpJjj90wE46VaYXqfeDfjQ2wfBu9jfApIw1zsOIDxGoD63vGAgh1fwe+A?=
 =?us-ascii?Q?p3x8rF5tnL5q3aDmkxKBwLutdZtL4YW8oG0VQZ5kUQdUoZNIZb+pwtGRV5Ed?=
 =?us-ascii?Q?nrGDu0xgElgfEjCdZPBDizFq+9JJgCNCWFzhcZ+pZ3F4D+CWUFVMLWTsZfc5?=
 =?us-ascii?Q?gy7D8OMJ5BvjL9FfysPNAKpAcvhQNZupKpr82eoLZ6opwP0fJh/FgmwDjF/H?=
 =?us-ascii?Q?W0FJHE7XS5pfP0j0966x/2IhgKP16Jbu1hz2XmeU6N3ESfYVjUmsSSv15+Ti?=
 =?us-ascii?Q?U9alT6CMUpSPSzV7Z7g1ea7aGI5+AdtnV2RwZVaavjzUQ1MnWO2OG4zHmeVB?=
 =?us-ascii?Q?r/VxrvFEK8c+pWTiqrYva8B3Bxf/TldYqAoiKGy14Gs+K6CX0ltnp8vKVESL?=
 =?us-ascii?Q?I8CCrptk6fgDG/XScGHovvEUqcCUx6C0a+iqqeHNYOxgPKjaaMo5rzzrzcxV?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5b2e2d-9bde-493d-f629-08db71fcb90d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:10:45.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/eLJ/L8q8Dvs7NAg5ygkC82ZGkbRQG3iAOxQekccuvfB4Dy/PPPcTv60D+WZIBUNdPqqPAmHi5kmiLm4/Al/a6gem9E6j4A4dI8vaoU2pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 05:25:49PM -0700, Lucas De Marchi wrote:
> On Tue, Jun 20, 2023 at 10:38:50PM +0000, Radhakrishna Sripada wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > > Sent: Tuesday, June 20, 2023 2:28 PM
> > > To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
> > > 
> > > On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada wrote:
> > > >This will help debug register read/writes and provide
> > > >a way to trace all the mmio transactions.
> > > >
> > > >In order to avoid spam from xe_mmio_wait32,
> > > >xe_mmio_read32_notrace is introduced and used.
> > > 
> > > feedback given before was to avoid the exported _notrace stuff. If there
> > > was a justification for it somewhere I probably lost it. Could you
> > > clarify? If I understand the above paragraph correctly, it's due to
> > > the fact the xe_mmio_wait32() reads the register multiple times...
> > > why would we want to avoid the "spam"? If we are reading it multiple
> > > times, the trace should show it instead of hiding.  If we demonstrate
> > > there is an actual impact, then xe_mmio_wait32() should be adjusted, not
> > > the rest of the shim layer in intel_uncore.h
> > Unless I missed some whaere earlier feedback I received was on the usage of inline in function definitions.
> > Xe_mmio_wait32 I believe is loosely based out of __intel_wait_for_register(atleast based on compat-headers)
> > Where during the actual check, no trace version of register read is used and just the final value is traced before
> > Returning from the function. A similar kind of approach is adapted here.
> > 
> > If it does not make much value like that then I believe we can use a traceable version
> > But in case if developers want to have a stack trace for each tracee out put then the spam becomes even more
> > messy.
> 
> there was a chat last week about that... maybe I misremembered and you
> were not part of it.  The trace part should be pretty cheap to be kept
> everywhere, particularly because it's not enabled by default it's
> nothing more than a few nop instructions.
> 
> If we don't trace everything and hide some of them behind functions like
> xe_mmio_wait32() or intel_uncore_read_fw(), with no indication in their
> name that they won't trace, then when we are reading the trace we spend
> a long time tracking back what exactly was happening.
> When we have the complete trace, filtering should be pretty
> easy. Eliminating random traces means we lose information that is not
> possible to recover after the fact.

I could see an argument for avoiding tracepoint i915:i915_reg_rw within
xe_mmio_wait32() if that function utilized separate tracepoints like
i915:i915_reg_wait_start and i915:i915_reg_wait_end instead.  That could
potentially consolidate the repeated trace output down to just two lines
without losing any information.  We don't have tracepoints like those
today though.


Matt

> 
> > 
> > > 
> > > >
> > > >v2: Do not use inline for the function declarations.(MattR)
> > > >
> > > >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >Cc: Matt Roper <matthew.d.roper@intel.com>
> > > >Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > > >---
> > > > .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
> > > > drivers/gpu/drm/xe/xe_mmio.c                  | 80 ++++++++++++++++++-
> > > > drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
> > > > drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
> > > > 4 files changed, 111 insertions(+), 8 deletions(-)
> > > >
> > > >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > >index fae6213d26f1..036f3b963a84 100644
> > > >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > >@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct
> > > fake_uncore *uncore,
> > > > {
> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > >
> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > > >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> > > 
> > > how would you even know that intel_uncore_read_fw() is non-traceable?
> > > ditto for all the other functions in this header.
> > In i915 intel_uncore_read_fw and other _fw functions translate to raw_uncore_read
> > And its variants which do not include the GEN6 Header/footer which have the traces
> > included and hence are the non-trace variants. Unless I am missing something.
> 
> I meant "as a user of the API". There's no clue whatsoever in
> intel_uncore_read_fw() that it will not trace. I think the selective
> trace/no-trace in random places in i915 was a mistake.
> 
> Lucas De Marchi
> 
> > 
> > --Radhakrishna(RK) Sripada
> > > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > }
> > > >
> > > > static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
> > > >@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(struct
> > > fake_uncore *uncore,
> > > > {
> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > >
> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
> > > > }
> > > >
> > > > static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
> > > >@@ -129,7 +129,7 @@ static inline u32 intel_uncore_read_notrace(struct
> > > fake_uncore *uncore,
> > > > {
> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > >
> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > > >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> > > > }
> > > >
> > > > static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
> > > >@@ -137,7 +137,7 @@ static inline void intel_uncore_write_notrace(struct
> > > fake_uncore *uncore,
> > > > {
> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > >
> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
> > > > }
> > > >
> > > > #endif /* __INTEL_UNCORE_H__ */
> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > >index 78c7f839f783..ef2192a2d060 100644
> > > >--- a/drivers/gpu/drm/xe/xe_mmio.c
> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > >@@ -19,6 +19,7 @@
> > > > #include "xe_gt_mcr.h"
> > > > #include "xe_macros.h"
> > > > #include "xe_module.h"
> > > >+#include "xe_trace.h"
> > > >
> > > > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > > > #define TILE_COUNT		REG_GENMASK(15, 8)
> > > >@@ -429,7 +430,7 @@ static const struct xe_reg mmio_read_whitelist[] = {
> > > > 	RING_TIMESTAMP(RENDER_RING_BASE),
> > > > };
> > > >
> > > >-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
> > > > {
> > > > 	struct xe_tile *tile = gt_to_tile(gt);
> > > >
> > > >@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg
> > > reg)
> > > > 	return readb(tile->mmio.regs + reg.addr);
> > > > }
> > > >
> > > >+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > >+{
> > > >+	struct xe_tile *tile = gt_to_tile(gt);
> > > >+	u8 val;
> > > >+
> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > > >+		reg.addr += gt->mmio.adj_offset;
> > > >+
> > > >+	val = readb(tile->mmio.regs + reg.addr);
> > > >+
> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> > > >+
> > > >+	return val;
> > > >+}
> > > >+
> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val)
> > > >+{
> > > >+	struct xe_tile *tile = gt_to_tile(gt);
> > > >+
> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > > >+		reg.addr += gt->mmio.adj_offset;
> > > >+
> > > >+	writel(val, tile->mmio.regs + reg.addr);
> > > >+}
> > > >+
> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> > > > {
> > > > 	struct xe_tile *tile = gt_to_tile(gt);
> > > >@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt, struct
> > > xe_reg reg, u32 val)
> > > > 	if (reg.addr < gt->mmio.adj_limit)
> > > > 		reg.addr += gt->mmio.adj_offset;
> > > >
> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> > > >+
> > > > 	writel(val, tile->mmio.regs + reg.addr);
> > > > }
> > > >
> > > >-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
> > > > {
> > > > 	struct xe_tile *tile = gt_to_tile(gt);
> > > >
> > > >@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg
> > > reg)
> > > > 	return readl(tile->mmio.regs + reg.addr);
> > > > }
> > > >
> > > >+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > > >+{
> > > >+	struct xe_tile *tile = gt_to_tile(gt);
> > > >+	u32 val;
> > > >+
> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > > >+		reg.addr += gt->mmio.adj_offset;
> > > >+
> > > >+	val = readl(tile->mmio.regs + reg.addr);
> > > >+
> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> > > >+
> > > >+	return val;
> > > >+}
> > > >+
> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> > > > {
> > > > 	u32 old, reg_val;
> > > >@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg
> > > reg, u32 clr, u32 set)
> > > > 	return old;
> > > > }
> > > >
> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val)
> > > >+{
> > > >+	struct xe_tile *tile = gt_to_tile(gt);
> > > >+
> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > > >+		reg.addr += gt->mmio.adj_offset;
> > > >+
> > > >+	writeq(val, tile->mmio.regs + reg.addr);
> > > >+}
> > > >+
> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
> > > > {
> > > > 	struct xe_tile *tile = gt_to_tile(gt);
> > > >@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt, struct
> > > xe_reg reg, u64 val)
> > > > 	if (reg.addr < gt->mmio.adj_limit)
> > > > 		reg.addr += gt->mmio.adj_offset;
> > > >
> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> > > >+
> > > > 	writeq(val, tile->mmio.regs + reg.addr);
> > > > }
> > > >
> > > >-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
> > > > {
> > > > 	struct xe_tile *tile = gt_to_tile(gt);
> > > >
> > > >@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg
> > > reg)
> > > > 	return readq(tile->mmio.regs + reg.addr);
> > > > }
> > > >
> > > >+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > > >+{
> > > >+	struct xe_tile *tile = gt_to_tile(gt);
> > > >+	u64 val;
> > > >+
> > > >+	if (reg.addr < gt->mmio.adj_limit)
> > > >+		reg.addr += gt->mmio.adj_offset;
> > > >+
> > > >+	val = readq(tile->mmio.regs + reg.addr);
> > > >+
> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> > > >+
> > > >+	return val;
> > > >+}
> > > >+
> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
> > > > 			       u32 mask, u32 eval)
> > > > {
> > > >@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
> > > reg, u32 val, u32 mask,
> > > > 	u32 read;
> > > >
> > > > 	for (;;) {
> > > >-		read = xe_mmio_read32(gt, reg);
> > > >+		read = xe_mmio_read32_notrace(gt, reg);
> > > > 		if ((read & mask) == val) {
> > > > 			ret = 0;
> > > > 			break;
> > > >@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
> > > reg, u32 val, u32 mask,
> > > > 		wait <<= 1;
> > > > 	}
> > > >
> > > >+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
> > > >+
> > > > 	if (out_val)
> > > > 		*out_val = read;
> > > >
> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > > >index c06fcac2cc5b..02364ba9dda2 100644
> > > >--- a/drivers/gpu/drm/xe/xe_mmio.h
> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > >@@ -20,11 +20,16 @@ struct xe_device;
> > > > #define GEN12_LMEM_BAR		2
> > > >
> > > > int xe_mmio_init(struct xe_device *xe);
> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
> > > > u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
> > > > u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
> > > > u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
> > > > 			       u32 mask, u32 eval);
> > > >diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > >index 2f8eb7ebe9a7..a5d514c190a2 100644
> > > >--- a/drivers/gpu/drm/xe/xe_trace.h
> > > >+++ b/drivers/gpu/drm/xe/xe_trace.h
> > > >@@ -12,6 +12,7 @@
> > > > #include <linux/tracepoint.h>
> > > > #include <linux/types.h>
> > > >
> > > >+#include "regs/xe_reg_defs.h"
> > > > #include "xe_bo_types.h"
> > > > #include "xe_engine_types.h"
> > > > #include "xe_gt_tlb_invalidation_types.h"
> > > >@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
> > > > 	     TP_ARGS(vm)
> > > > );
> > > >
> > > >+TRACE_EVENT(xe_reg_rw,
> > > >+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
> > > >+	    TP_ARGS(write, reg, val, len),
> > > >+
> > > >+	    TP_STRUCT__entry(
> > > >+		    __field(u64, val)
> > > >+		    __field(struct xe_reg *, reg)
> > > >+		    __field(u16, write)
> > > >+		    __field(u16, len)
> > > >+		    ),
> > > >+
> > > >+	    TP_fast_assign(
> > > >+		   __entry->val = (u64)val;
> > > >+		   __entry->reg = reg;
> > > >+		   __entry->write = write;
> > > >+		   __entry->len = len;
> > > >+		),
> > > >+
> > > >+	    TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
> > > >+		      __entry->write ? "write" : "read",
> > > >+		      __entry->reg->addr, __entry->len,
> > > >+		      (u32)(__entry->val & 0xffffffff),
> > > >+		      (u32)(__entry->val >> 32))
> > > >+);
> > > >+
> > > > TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> > > > 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > > > 	    TP_ARGS(_head, _tail, size, space, len),
> > > >--
> > > >2.34.1
> > > >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
