Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EAEED622
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0624310E68D;
	Fri, 15 Sep 2023 17:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3910E670;
 Fri, 15 Sep 2023 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800043; x=1726336043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3lQHinyXf0mToPMficoxp51VyOVbGtMtu+cCS12Ecis=;
 b=QSufoGgEKXiM9YZhqO+Ax2WwT/nF58UsM9kUesdU/Y0fLoDs1U4Aq2h5
 wFGT81Hu0hXtz12itjNEJQuYeS0Lp9FRpl4egLiTwHxP5bBl7KYbOFltm
 p9UUftT9bHBI3BlWtmTcCFDAT0u9M9DQNffYWRftlnZTLrPtDt/Hb3a/g
 53OEkCW2BK44EOCsCG3ScRPQ0mTl+lx2XNBF3Oq4MVCzk6I1d83VZfCui
 4gx65h5AIvGbiJACtT+OjwI96OaLcfq5AT8qSk/o/mb6WgpdJBOUSNArB
 vm2RFXMbVmK9+QRW2jPcj8DITNBCFpZhJPoFFbvJ7qkPn4oLDd5HiThJ0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445779372"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445779372"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721773616"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="721773616"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:47:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:47:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:47:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlbMiuSPMc3gxmdpjN28TLVFYtZ/bJWChFFNTTKcgOJyz+cQV8aNcOl6LeYF2U8O4peOKnE+SJW3lo6cEN1KuIAWW5WLr7C0nWtqMce0Lk7OT43dGkyGFa/qmbawRRZobAo+JmrXU3kCsMqjl4Aj5gzyL7yo8jY1OKDVJxW/dK880suJX0+h6qVHhYQTUPCXVuqW+iQAkIy3wTrCT+4taKhVtGzlTFwja48Sa/7DTIJWO5g7Pn6e4fkFqW9/BehFWVEm2jwlDVp917SQr3v3B+2b2yMsfct+JdVJmoenw5UfC3czmqmHd3sQPfSAXID8fU+CYQPeH9yQFDqJLjLk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KrRIGArEfSspfQr3JWlkmYDhsriBs3YwX+cy61knUw=;
 b=dgJlCDPzfE0b8WqDn9DWnyX0NKeaTtlyLLd8OdSf5S+St92eQGhwJTNWhesXkSZy6uzvmbmRmWEN1S3JY2zD+HEv8oqP18ZVD/pwdT4lrcD5HST92XlwB1M9/Z+EgVEsXL9FFuFWONL+PC6b5xPJ0XWMtZ/9tf02k2AKcxChLTToexxo1rh26cJDOnS1FuMllkmGEIVvSILswjaszIuQhd5lZFO8Yosz17AuEA6UVchma0vr/BosWx7qKFuedvfNc/JyGSYH3+gkXo75ZfqgpmrliXFmdIL9/LIJxtLPaFN1/Quhrz0oYRFzWbY1YpyI4O1LJ9XLqUcSq8/u0awRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7293.namprd11.prod.outlook.com (2603:10b6:208:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 17:47:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 17:47:15 +0000
Date: Fri, 15 Sep 2023 10:47:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915174712.GD2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-3-lucas.demarchi@intel.com>
 <20230915174346.GC2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915174346.GC2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 426dddcd-51a3-47ed-04c4-08dbb613cc71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiCc0ieB9TanaQmcZizjcFkzm3HRDLjcEIs1fh69wYZBfQRXUoX9iQkHsmTILoG/lvLwjHWoTiUAthG1AcqFymAqajjTsn1ek7tM2tdX228lUyBIjQQqLddM16O62wkQ9TpEJQ7SZuIC4SALi5IVuBcIqQMRxvwVLWtqp2LM015iT0I4ZIb9P+4ZAqBFSGrCG50yiNkV+zFif1URdypkePweftu1EEJKmuYGo57qOy+ZvvzfrShityDU4vrr/47+teCUPCnj7Uyk2+HUyhRlVZXJjU4R9TdTJiQLYEnCwb/RJdKgqXLBpXqoXqBb7Jiix6GDWtF1jgMHcJVSDtCaHQGz0TVQCTTjdIcALaH5NIwRpM69ilMwBJWOCc/QMw61WpGy6GIUBBjEr9oEivaAz/w9lNfQ0uZKt35IhgqjidhKeoVEwesR7NwGYAjxCjRv+jNJU6B4r4c6yPwINwjNQUwRGr++np/k3S6uq8WRSdyPi+XOgFFAOQE7seEHFE0ebBLAMPbZwTJDllp8VLS82256DXLJwbBk2wIPPvIFhczM4tgFDpXQ0t+ZZJlcxjl2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(186009)(451199024)(1800799009)(38100700002)(33656002)(86362001)(66476007)(6666004)(478600001)(41300700001)(1076003)(26005)(6486002)(5660300002)(6506007)(4326008)(316002)(66556008)(66946007)(6636002)(6862004)(8936002)(6512007)(450100002)(8676002)(2906002)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4CNpgzqsYxMrQkrYvf8sS5a/siZwLU9gQ0o1lUqBuEQS0vTyczoweRWlm79F?=
 =?us-ascii?Q?A6k0cKjB2ZFQfPfYRTLSgWfM1B1EMXObsE2EM1T2+9Ns3Lq46cY4rHdZUpci?=
 =?us-ascii?Q?Ua9ynP2t48CKOjg0P9fQNHHC//zFBge7inqnqMTsLiLe6CYCgNulUojg25WH?=
 =?us-ascii?Q?hpZMEvuKSbg+c9wq2CJawrHs/FK5omRh/y6PK5QGXIBEbQZvIYD78YTLy3eR?=
 =?us-ascii?Q?zQaA1arZE028/Y/BtUu+ReGpsmP/EwGt1cAFU8khgcraBkLGjq5jKuc5bq+C?=
 =?us-ascii?Q?LevOwHnzChoC9kK0XDM7GgFHsdEEiAcR94AGJdHpLpS/FOUDKAMuBN21k307?=
 =?us-ascii?Q?XWuhS8OafvHMTOjL4VLpDO9v11fHk6lJPOXn18SU0Eu4cKd+Q36g7qH7jUOl?=
 =?us-ascii?Q?l9ufCSVqYTjJSoFpXDUXqv4hvlHF2HoQYo+Cghq3yB3OFRlvBKU7yXrvHK70?=
 =?us-ascii?Q?9Dpga+N3AOzOIYT2r8u9r9YihgGuqznb67a3YyL7ul1asUqZhuG5y988kCkx?=
 =?us-ascii?Q?vWwN214VLaFLJuIWmToPkgjJ8dMvwCQAzngGRjiWOg/78uZ08Ogo3wTjalgc?=
 =?us-ascii?Q?5+jqMlOMKGg31vG0CSYa/aJX1R9yE9Zp6vDQoTtEG1j2jxxSTGPq1Cr4Jmyc?=
 =?us-ascii?Q?cnH7ZvCORwrjCZ83OP7+i1HNTsjTNaYTQB9g8MrImh054cpqWz/aYMBZmUAU?=
 =?us-ascii?Q?A9EqsBWAyAQzsvdopKPDr7BEmy5XP9SrtawjAshJ2A4996MIKpnUqkzfJALz?=
 =?us-ascii?Q?jSi7YXosfRJSVE2lJernT3F5JsvM0l4wdAlCw6bKCiom0t+W8etECQELVwQO?=
 =?us-ascii?Q?CcHdy+RTnnwlzdznIy0ltjA1dfpWSYBEHLm/aG7Mp18EJjE1JLDSFLQip0bi?=
 =?us-ascii?Q?Fhr/UvZk5uiX6YY5ALg1rn3sHLSNFXc95IMi7OiYPsR2CICcL2N7BfiHfaH3?=
 =?us-ascii?Q?/T2ZoJ3EbIMH0f48IQzo2Ab4zmYH4v0b5lLmftQVXecPQugSNqMduRHjf31X?=
 =?us-ascii?Q?0h+Zwy85WYex6E1Etqjtjuqq9EICDU2mkL3kQxDAMwxTUrQZzLtAFuOOCTn0?=
 =?us-ascii?Q?GWXVnbNEz3s8W9529Aky08urYnXQlwLD38L02IVQziaZcWYM/PJSUTd8vvTa?=
 =?us-ascii?Q?KHsX7op4EMzqpYFUogZzgVf33WCdjXV1wUrtwTJ/jCh1PXjcAJt8qATkRRkb?=
 =?us-ascii?Q?sdpQ5o7YC5r79t26IzK4R7j3vjcXOAfin5uWIOGbDHZbVVNd3GRwrmSQEqc1?=
 =?us-ascii?Q?BklHZPF3MI9037P63RyDwOL7GyJV0urgRBxhDCDKwrErvOwrZrLuH6TO/5Bn?=
 =?us-ascii?Q?R11yYA1xUteyuLrwsZw0x1bkbbQpluKK0iE+ZYybfBb/qcsU/KVDEfkmFKOW?=
 =?us-ascii?Q?TjGgvipfRC/p7P1DPz8HXMSY2ijrV0/nobXa13+XqABxsHZRZBkfNUsOEY6c?=
 =?us-ascii?Q?cDw7lbl3pf7keYDPuWsq0A4k16Q0RIc4gFm7YwB62IwtfL7Cv0cnzLECIA+n?=
 =?us-ascii?Q?VY/uX4fFOQOZg7x7bgQhPwgIDHw1eRhxUMy9UmVJG+m8dKsHbD5ZPiztGWJV?=
 =?us-ascii?Q?3wSaq0IALpdwBlPE2hYbBAfa3wVWWMqG0ugqJFOeLmkmKFaX8eBQxjn12wiB?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 426dddcd-51a3-47ed-04c4-08dbb613cc71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 17:47:15.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bzlqxu9A6EPoasB+4it2PWPWEUT5Y9g4Ri9GLTzB4dHNEBd8NDVW9vBLu1Bus/LuN2hGcx9nkZYtOHgwczj+7p+FjN4PM1dF3tI9AFlgJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7293
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 02/14] lib/gpu_cmds: Remove prefix from
 gen7_fill_binding_table()
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 10:43:50AM -0700, Matt Roper wrote:
> On Fri, Sep 15, 2023 at 06:23:34AM -0700, Lucas De Marchi wrote:
> > This function is used by pretty much all versions. It's odd to have a
> > gen7 function end up calling next-gen functions and it's error prone:
> > when adding something to e.g. a gen8 function to realize that behavior
> > breaks previous platforms.
> 
> Even more confusing is that we have a gen11_filling_binding_table
> function as well, but Xe_HP still uses the older "gen7" variant.  Maybe
> we should incorporate the gen11-specific logic into the single
> fill_binding_table function as well?  It looks like it only gets used in
> one path (which winds up being ICL-specific, not even used for EHL/JSL
> due to lack of media samplers).

Hmm, I guess the signature of the gen11 function doesn't match since it
takes separate src/dst buffers.


Matt

> 
> 
> Matt
> 
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  lib/gpu_cmds.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> > index bb35204fb..648451f74 100644
> > --- a/lib/gpu_cmds.c
> > +++ b/lib/gpu_cmds.c
> > @@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
> >  }
> >  
> >  static uint32_t
> > -gen7_fill_binding_table(struct intel_bb *ibb,
> > -			struct intel_buf *buf)
> > +fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
> >  {
> >  	uint32_t binding_table_offset;
> >  	uint32_t *binding_table;
> > @@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
> >  	uint32_t offset;
> >  	uint32_t binding_table_offset, kernel_offset;
> >  
> > -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
> > +	binding_table_offset = fill_binding_table(ibb, buf);
> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
> >  
> >  	intel_bb_ptr_align(ibb, 64);
> > @@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
> >  	uint32_t offset;
> >  	uint32_t binding_table_offset, kernel_offset;
> >  
> > -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
> > +	binding_table_offset = fill_binding_table(ibb, buf);
> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
> >  
> >  	intel_bb_ptr_align(ibb, 64);
> > @@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
> >  {
> >  	uint32_t binding_table_offset, kernel_offset;
> >  
> > -	binding_table_offset = gen7_fill_binding_table(ibb, dst);
> > +	binding_table_offset = fill_binding_table(ibb, dst);
> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
> >  
> >  	memset(idd, 0, sizeof(*idd));
> > -- 
> > 2.40.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
