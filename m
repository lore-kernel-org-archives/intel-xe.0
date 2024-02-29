Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE0AC5478C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 00:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE8910E045;
	Thu, 29 Feb 2024 00:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDgMT5hA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95DD10E045
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 00:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709167931; x=1740703931;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zZVSMZ+krwTVclizEWbwXE+BCOg87nFSNx2pvWV098s=;
 b=VDgMT5hAVuyORJoZIWUDETmylvP/ZTIh1E85ep4rm+mNaZSkXS3+eLVO
 oMYA9IdP9YtXxRU+wIakOHLv+bZkp7YfSVfzPIPPQq6qt1FuVGl/1p9QN
 18JLkhn/DWyzBnlFyU9gJhqR/ffvrSutjZev65EZ9YSq4m78ATLBxGNLW
 J7vXb1IqKogHL4kNSgm4bBM/40Ivq5mKGxMTQGkhn8hyULTu55RKzbzaB
 coYwNukotu4GnpzdH1t3n8OlaAK8gh8BdD1U+zJb7Rv1Gz44Wk2sgnwQj
 xIKqjx7a9TYqmtAUUxU7SGlsfKjkB0gnaLNG5DFIu2inZPd3PRHaNqp8l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3459253"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3459253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 16:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="8181113"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 16:52:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 16:52:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 16:52:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 16:52:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0a+HC0pSmBoWR0ubuCMS+km2/vJCm4I6ILlmeTwoM4O/hGgT/MNLmyn9aBwkvajNuSnmQ/jbB4k9dnHrmmI4RQH6/jg68vKPK7NV1AFV+rhm+IVBE5sERpsnKJWMONNuUMZi8n5uD92CWFr7OFWRriwhHYtPXMpdGw1zLcJjgSDMF+8g+Uvf11HnDytK43j/Plh7nIstOloeP5FtX4Bac6vAA6BnCDxO2DWOc82gc+lW3vnzDUh00EWsq2ZhFzclCo6XplZeFefBGOOon0ngSeJ0PDcVNWEjZj+lK6K3fSTeSfIa9WDF2vb8OpPvSn7+IdOoYe+3HejpjPRtBL2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls0OlI4S5QBJHcz31Kv4vwu2Weco/PrqHzVvbU69IMg=;
 b=nccTAt0dhV+d43csZuG8zKye8LUJVV6jhip7vLaFkDZ1n3QBExvgSKkm/PErUlk68/j0ndRb3Wk8MJFA4/Uv8tKJUAzyWKTyKV+0la6VLuGfOZfxgUbqiz6RIm/lNngT5YCDcwZ9l1TbvD0/QNUYpVTe4n5UgumehTaxoeNwMxuAgMp3dl6f6Ps7TcI5tYqSPJcFdtNjRBOZ/qio/tdAM1RdQAEE4qKzkmmMaL/osCo0xq7/9yFxfinEEyL1bZOYpDRloLD460Igjws9ZBitRCCr+xKEotx6nvk/swEPuEptOTv3v9Ds4ZhmyxXFcvEEfyXc60VCZSAVVUEJ2WSGyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 00:52:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Thu, 29 Feb 2024
 00:52:06 +0000
Date: Thu, 29 Feb 2024 00:52:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
Message-ID: <Zd/VSucJCHVFbryn@DUT025-TGLU.fm.intel.com>
References: <20240225001448.81513-1-matthew.brost@intel.com>
 <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
 <Zdyw6OT/SDir+3Op@DUT025-TGLU.fm.intel.com>
 <2552f1145d30d79669cfae860abbeb361ce723c4.camel@linux.intel.com>
 <zsa63c56nccbw4hwbq4refcbpnfrxamxgqo4wjukykvu6o4cvs@cykqrhdxiuld>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zsa63c56nccbw4hwbq4refcbpnfrxamxgqo4wjukykvu6o4cvs@cykqrhdxiuld>
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 4166f7bc-d358-4018-d12c-08dc38c0a6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wz434b57FKWl/haJUh0G2ZPnG0Xcz8VnRkwFjsIL3MgUxs98aKqdnfKwpaYygY73xVDwR7apSPV8DCulkP8qnu7VIjqeW6mJS8tSW5ViO95TrpZdvd4kBo1WNJMcArBiOE5WTNehcq/Fvcu73wh8y9sVQFhI1dLOjhxL0bHy7gRJcBQAlLe4tR+OLj3gGzKKhI6MC6w9mqQmAtC+lCa5Y1upy/lndS3cUoAJ6/ScNS97Y/8lLx0vW9RLGRvlSk9OL8aIX6ZvQSESywMv8RxxinvWHvje6VM8dWfhyG61nW1fLjO5opCzfc34BIR3XskQy/RBxktdamkK0SOCjqz+vTUPThYx3AWXo/jBP9XW1Z5OI4tBePIgIiFXctKMOxLqtLZNPPdVqx1uEVC3WMvF49UNgkf4ApUOzrcu4yEvhv87ooQlZwSnAj5+0Fzm0I7w0L0WwSV3r4xs0yfRRpQ/X0zt57CU9T9Xtj7ko8BAR0IdFOaDTs4SB+12120WlzJu+b/+LA7NXXKSU8Uzocr0JbxkWJ68H9ksw+UXzcydpbHIxw6viv2Lf1DifdSfJyoeXOJe5hyyg0NtHLVCpBIAcWzfwgDep/dPdKqlJPVOeOtzZHg483GlHUJKCWR7Xuom
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ERK5AV+l+TG/9FeOzz2rJzfdNhkAtpuPsHqk3Ac3LSnRu2Jv2HZwCZCIZ5?=
 =?iso-8859-1?Q?Pvv2MBlOu4xJO1JqOjItZclCn+dTqQgRO5jO2NfbO8iNd2pJzAFSdhJQnz?=
 =?iso-8859-1?Q?VZTfrkzdozx2keCNfmmAsmjCQFt8CUSLli5+b9esIHiW9NM4S+juRkeNx9?=
 =?iso-8859-1?Q?sacdBd0ZJlRPCmUJnCI7SxzlSuINDWdg/TAIAd4EoblnfZ6yLdAGODxrS3?=
 =?iso-8859-1?Q?wGGRhf8eX0Vv5x4UkmLSBS3M+kM3UMEOn0X2BeAlQp6ps35CxxUD+MMlpH?=
 =?iso-8859-1?Q?y9Gv+5oj1C/kfi5px5Nay/NqZ+D3HjFG4ugfpAK7/7CCH4t2QTajpLYMMu?=
 =?iso-8859-1?Q?e1PAsb0F7iMrXkECD9lNjMt6ZW+86d17Oxeb2Ow5N0eNF2QbZEOikkmYw4?=
 =?iso-8859-1?Q?LVjKbNclJazYADCNUsN4uorduNeicH8mEhUTbzZMTwaFmTcapETkoLrnR7?=
 =?iso-8859-1?Q?ypwQ7xI4nouu4DmwySdRkanqO5ydMiFOIhdyzfiu9kYRCYrVTJTb1BrReL?=
 =?iso-8859-1?Q?oM6PEPWjK5JdNyb0THCdYUOIIxYq1cRgS5o/qWDAtLLmXxsP4qVIQs+v+f?=
 =?iso-8859-1?Q?lwKy20Te0ehQq+tyVmNnXaa3k1eDILDA30e2dE+6eLr8SsesADHfCgK3zF?=
 =?iso-8859-1?Q?nvlyCkfosX+eYCZDIlY2KJWwcyiPO453nqngBRWTefpe0uCsFcdctdST/u?=
 =?iso-8859-1?Q?WTyWv9rXfsTj8EbZ8GzXvcBW/ia/B4K/baF5HDSk1W5RdqspMenYHow8A/?=
 =?iso-8859-1?Q?GkS8BWxsyO6pBA6dxu4GXFToVA90c7hCbGwP6n6LI2UaddifVOFWNQaiNr?=
 =?iso-8859-1?Q?rfrCi4yDhfuCL6ZsAzKsFM5coMSZiPgzN5i+hJPewLqny4fnWFzkoB613D?=
 =?iso-8859-1?Q?pwWvprrc21JkBQq8z2UT9U4t+HfI7HUXNRbIOiYxMWkn/79EsEfgsQwGMp?=
 =?iso-8859-1?Q?NmSpA0X7qQ2/d4n4RQ8omm6cphINPfSob3/78lkOz3bpU5n0r5wMwDfykc?=
 =?iso-8859-1?Q?uVTo8uWnUhRPnT4HwFLh7pOdBQs+V2A258sPyycShgvS6aKwTo3e4XCK9G?=
 =?iso-8859-1?Q?kofekzdzuQO1hUeJUMRWryz1NXEqNLbhwlL86mKHHrYNc9Axfyo7pLKV2g?=
 =?iso-8859-1?Q?s3zJYXqXXkaw9BydPMtPOobwmFnHdtAa5FV2jDduafIewhNwT2oBNjrj0A?=
 =?iso-8859-1?Q?2vYKmwwGvoIIcboNdJ/2uZx0WhhD4uxQXqoI1N+wYpVSEAHPb9tqfzxg+b?=
 =?iso-8859-1?Q?NkSv5ygfCaNhwx8mmA2yJ3KwXy3sz/DV8YEQ+6Y4Gcaa7GS+0gRwBA0OPu?=
 =?iso-8859-1?Q?bPjpf6XMWxw6X9HMBWreImIX95/k6mqKV+rcHDrNBDGz9TbO7EMEZsAhYV?=
 =?iso-8859-1?Q?HTLGNUKB67gruHdaXuxsmk+XTx8UPUgornLsfopLqLRnBdcfUC8P4nrbBP?=
 =?iso-8859-1?Q?LVoIEJo9U08mlh1WOrXqoq1M1K8PkuMO3QjrxguB1fIhBjxfkiFeIQmTAk?=
 =?iso-8859-1?Q?CI5Nt2hPXI5jTSbA3oF7rFXpPwhh/g9q9wy6VIUZcfiaiHhJwonWsHHpDa?=
 =?iso-8859-1?Q?usu6iso3qnv2F43L9QAa9ljuVJv8gFInVmUrYq5QLbnGvea6l1n4+Aw3EA?=
 =?iso-8859-1?Q?jCUO7DO7UkUOkBA9WtRc9wBxarB8TlcAe8KPCESzcOBMXVmcURq5+zhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4166f7bc-d358-4018-d12c-08dc38c0a6c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 00:52:06.4046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKq5LELT20IwOZL/KRnHFdbikAHOBSrgnoPK5Kn2OaRo3MvXep/lSFeXA3KPJ0iJHF+gK/Aer3HqgJPv3bsIeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Wed, Feb 28, 2024 at 12:49:05PM -0600, Lucas De Marchi wrote:
> On Wed, Feb 28, 2024 at 03:47:13PM +0100, Thomas Hellström wrote:
> > On Mon, 2024-02-26 at 15:40 +0000, Matthew Brost wrote:
> > > On Mon, Feb 26, 2024 at 10:05:58AM +0100, Thomas Hellström wrote:
> > > > On Sat, 2024-02-24 at 16:14 -0800, Matthew Brost wrote:
> > > > > Need to include io-64-nonatomic-lo-hi.h for writeq function.
> > > >
> > > > As I understand it, the choice of header here determines the dword
> > > > write order on 32-bit systems that don't have an atomic writeq(),
> > > >
> > > > So is writing the low dword first the correct order in this case?
> > > > Perhaps add a motivation in the commit message?
> > > >
> > > 
> > > "Cleanup some layering in GGTT" removed xe_mmio.h from xe_gt.c and
> > > that
> > > file includes linux/io-64-nonatomic-lo-hi.h. Perhaps it is better
> > > just
> > > to include xe_mmio.h again in xe_gt.c?
> > 
> > I think it then makes sense to use your original patch, so that it's
> > easier to follow for each subsystem what ordering is used.
> 
> what original patch, I only find this one in the mailing list.
> and it seems correct to me, following the "include what you use"
> approach.
> 

I'm also confused by Thomas comment.

Let me ask directly - do you prefer xe_mmio.h or
linux/io-64-nonatomic-lo-hi.h to be included in xe_ggtt.c?

Matt

> Also see some more details in commit 9a6e6c14bfde ("drm/xe/mmio: Use
> non-atomic writeq/readq variant for 32b"):
> 
> 	writeq() and readq() and other functions working on 64 bit variables
> 	are not provided by 32b arch. For that it's needed to choose between
> 	linux/io-64-nonatomic-hi-lo.h and linux/io-64-nonatomic-lo-hi.h,
> 	spliting the read/write in 2 accesses. For xe driver, it doesn't matter
> 	much, so just choose one and include in xe_mmio.h.
> 
> Aside from the "Fixes:" trailer, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi
> 
> > 
> > Also note Jani's comment. We should use "dim fixes <hash>" to get the
> > fixes tag correct.
> > 
> > Thanks,
> > Thomas
> > 
> > 
> > > 
> > > Matt
> > > 
> > > > /Thomas
> > > >
> > > >
> > > > >
> > > > > Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Closes:
> > > > > https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_ggtt.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> > > > > b/drivers/gpu/drm/xe/xe_ggtt.c
> > > > > index 5d46958e3144..717d0e76277a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > > > @@ -5,6 +5,7 @@
> > > > >  
> > > > >  #include "xe_ggtt.h"
> > > > >  
> > > > > +#include <linux/io-64-nonatomic-lo-hi.h>
> > > > >  #include <linux/sizes.h>
> > > > >  
> > > > >  #include <drm/drm_managed.h>
> > > >
> > 
