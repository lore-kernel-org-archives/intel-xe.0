Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D997C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 07:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF910E03A;
	Fri, 19 Jul 2024 07:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtgfAyCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959810E02A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 07:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721372959; x=1752908959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A9CwwoSYGF7V4oXMO1nfpAjhhYB98w78JdhiTZ8ln3I=;
 b=gtgfAyCvgv0HOKduQ8eq+PFpDtiUKSOfGGXK99sV38bxyYvOC/zGr7ZZ
 LcKS0YYZzEnJlv28DIppz9IsNhAQatLo1SkiRLyQuWhDO0gRpwT2ijlKP
 bjSgVBpdRwhxsbNx/o0THPSzfDMD3MJt39rwGvy9pA/1kIS9l2qwJo36f
 U85jB8gVCEOcLyTc95SkiX43vFGxr9EhMTW49CKsDyqfeXYSw034shgIy
 CJFzj6Q7CHtJ5CUzBQ3uCSB4wrRy2GLk1ikwqU4pyDIUrdqm7gh5QNgv5
 Szx8rIqyHygrCYFWaAF8Tfsg+kvtX6Z86OhSiORYwfwuPW58qN/NwiblT Q==;
X-CSE-ConnectionGUID: RAsgc+X6RdyWx0MJFRZD5w==
X-CSE-MsgGUID: F5hJu8fWR3uhmsDjnXlH/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="44395327"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="44395327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 00:09:18 -0700
X-CSE-ConnectionGUID: CoBFEETHSs6BvPA9ZLRbrg==
X-CSE-MsgGUID: YmkbNI19SWmGsTLVmhvgzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51626845"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 00:09:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 00:09:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 00:09:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 00:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz4DaITW0EUcibF5M73ItmtY2KaSBatNqTHO+1d+5Y97+USvo7vZLYM3lpssyJKaEuakKdMM/wrwgXWMSeHYwhQLPjCE9KYKswz+kPOWmGtW8z/CRrEEjjNaJyqLbIt7JAkw8uWPe8JA7SDeL99VjZ2FTx1MA6MJbsSfQw99dNPgfeueEqynhnTHpWK5QumFLG7oJTSwRWlYqw/7OMUY9YcpNejozh3j6I9mX5QSOwSA2pKMCCfCbTbseJsaqnxdinWiGl2+TcHWgTt0AdYoF4VMQTfTqHDNqqEtmmXnNEioITo7rC5EzppgCgu8/puVhaaKMITDNpUCoRBX9Y9CgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwSkRlsSN5mkkG0bL0Dx2sWJ26iepuIyN46LDYmEjZQ=;
 b=nbvjReI9xiESnOIn3FW2c+Fv06ntpffjwthWMV8d/rvV+Nt63Db5/I8/0j3ymeRdJ51EGiUxI0BRGtMToC5y2K5M5+5gWJj8ZvrlzbpfmmyjrAv4fELmzPH7R/yF3l1e78Ojmcvro0B0jv0LxrAxJBJkdu4UGJMyn/4vpWKnPlbxz6LhyFZ7EQRcXmSJaQuC1z1hU2UjQkwAebzo52wA/AHCM6lpjjKAs+oY115twMwXXazNDcRFyegPCuSRhLA1y1Oep9gaZ011NdTk9ahEw9guu+lX2UoCB2FW++wQ6LQ6ekiNKE42l7MRbbDCpYPIfuM0rb//kBnU8Ok6as6IOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 07:08:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 07:08:57 +0000
Date: Fri, 19 Jul 2024 07:08:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Unlink client during vm close
Message-ID: <ZpoQ2aq8sSlElSzd@DUT025-TGLU.fm.intel.com>
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
 <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62048D1E37A856E52AE40C4381AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZpoNHwGU6OXxmpqJ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZpoNHwGU6OXxmpqJ@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: a04e7b4b-f961-4f62-bb4e-08dca7c1a838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RN8t3ckriHd3I5eCTkYnMxMuoBi61MdCQYDe1ylcV/seTn+WBtSpx6XzR+No?=
 =?us-ascii?Q?1bbokq4r0tioAKrF8h6D5xigJkY8638z7bO2RJs/5VrLF2A+2mFBdW814OHr?=
 =?us-ascii?Q?qNOZqgiZjfGagNNAQ48m4RReXRediLOp06Lbo1/DDT3/e+USM2RqCHVTnUVw?=
 =?us-ascii?Q?Lus5Pgs9D0dxwfUniZULXmdq+7C8qQCewQXMa2Fpi7HF7aqLxPVcsH+MCkL7?=
 =?us-ascii?Q?EDlFn1nIXBxcmIf84+e027xiw0F+xxxfldkkS4tml0nGEHStcYVbsvbGCTgf?=
 =?us-ascii?Q?pySyjP4+rWBhJZoKkqIcTWUuHIWm+v68zPs1E3I4LTkTYS8n163BJmxDNEUU?=
 =?us-ascii?Q?7GsenmlmUwHHzGRWnebo7k/TKVBXDZ2MLqyDVj00RWc1GOF7xd+BeN/2Apge?=
 =?us-ascii?Q?oEInmTSvLoLa7ddQ1ZJwal9Mx3M54JrtmV9btSpf1/BXza2LclAqH/68tLS5?=
 =?us-ascii?Q?Z3KheEmg/GHRVeu/XAaVqj58vEkLr/qh+PePkQ3fSahYTVt/XHIEJKMQPG9y?=
 =?us-ascii?Q?Vu422LgG87lVF060R2E4FGQAiPVvsFIr1Fa2RDhjNRoHmm+oPkw22y4TcfwG?=
 =?us-ascii?Q?8Q+eQdsE0uGTcYAwUyhsHPAkMx3XT11+YANUe5cceD0l/NUmyjbyGAYVmkQO?=
 =?us-ascii?Q?YWU4pl6DKb2p2mcJDDbA3HKMNNaq1jnRVQNMmuaC1RQ/mruZsoLli4tYaMZw?=
 =?us-ascii?Q?A6xvCq/pUrjuEXri9ZgQqTJiWR2W1ol3KH4tcACI8v3CLNr7HWKB4fbGNBEz?=
 =?us-ascii?Q?5U6nXjgpzE5+ObBtjTb1ElMrJv9JLMFxabcMG1d+6U1B1ug0Jk/OT+bOhkjW?=
 =?us-ascii?Q?APlnWBgHct0yfco/Db1v++lZls55cZcstwP4fanli4GdHkhWf0VW6HzI/WV9?=
 =?us-ascii?Q?9bMVklKU2nEK1ileIDU8sFS6TH1WHH6DN36NsH3iEdqMi1pZxlzmYAjZKsOK?=
 =?us-ascii?Q?qf9k1F63mCMerFJ9r2Zv0DjA86g49Vh0Eyw0TrBUhsMT0sUOWyga+9/ACBmR?=
 =?us-ascii?Q?+8kDwQwadf341v0IlzNWKxgprrmjyC06jEWSTODqa2kjWX7S2Zzla99UCoCX?=
 =?us-ascii?Q?5nzDyz7g24GwCzUz9nEv1CogypPoAKMG7NzBDmcoEtlF+PEi+h1p008lnshf?=
 =?us-ascii?Q?0TbL7VhZfJDvgg8y4Q1f3TJmgvlONZUeoaAI52+T1C817DuyBQn8kmmYv3fy?=
 =?us-ascii?Q?V0s/GgydHUfwhTb/yXQqFRoFNCxLZUY19sE0rgm3TO2xOse/0UiL3P7iIm4w?=
 =?us-ascii?Q?CNE0M1nLMdYuTK3zOgw26hXXJeMnoXHuJqAkXgs1iDKa9Vmz+LDaZJzDLeb5?=
 =?us-ascii?Q?CrI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N9ieWVqE3NDLLdiPA27wnlyIi3HKUPpyMjMhLkcoqJgRRPaUWY+CZ+Yofipn?=
 =?us-ascii?Q?Dt5qaUH0EuQG2hLOfy0sPJJxuVnPjaQ2Oa4nUOfEhCKuhX0tt31oLHP/v8rC?=
 =?us-ascii?Q?XTueG8Ye9gNExsL/je3mmOJmUZk5pcY1vptTsY/mc1MAs0uu1tbedFW8wRQS?=
 =?us-ascii?Q?2by24awRUjeoy6QUO9Vjn2KE48HLqmCBMoD1EGh+392YZW4ebDQIeIe/8SdI?=
 =?us-ascii?Q?YF3/F+0brqwN4kVCSoesxZhJNWFtiuXANGHtIDJKLglLvor6hWiGUkPAX7Wa?=
 =?us-ascii?Q?WBIUIKuqRr9k0qjQKbFFMFaoCAltFwrco/LU7jyJjeI/NADeQ/N/yvKa2pDZ?=
 =?us-ascii?Q?OgsRUs8gQ7Sw/oZSd2RbFAUr52SAruB3wZwKpN5yiGPPdm3jh67pF9cJcr9V?=
 =?us-ascii?Q?MSTlP9Sjl0l5sT/QJnOZjErcbnA2cpi8kFuO0h2Ab7713aDr12d+ZFw16ck7?=
 =?us-ascii?Q?RjXjtuzHgKjEdeDJtFpZKxckAC9mbxUKKIKE9QKKvrw/KzCeTzuB0cxRLjwV?=
 =?us-ascii?Q?36NC7SpCbbSwrlDYPDv0RsEUc8KCnq8Nl9yUUPxgpv/ZFAwvK1KDMaHZS+UC?=
 =?us-ascii?Q?HppFQqiFMUoKDB7B5a0Xhsrzu0GrqRj6dBfTEqwpSnHKvue58KrzXy5d09lG?=
 =?us-ascii?Q?3ZI8NLn00utq81knLJUDGzTwfKsnaanBhh7JuxDa2k6e1GdIi6uTDAwWYurZ?=
 =?us-ascii?Q?8fp5NEKgmMKNtFYO5DUEbtSIhYCI5Yob0SuDkDH0zpD3Ihxm/kBgi+Y4ykXj?=
 =?us-ascii?Q?X1oP448AYcdj3KOGki5lvI9+GipvvgU7V5NM7SF5LHaAgTz6/WJi/sgiTk41?=
 =?us-ascii?Q?YoNYAOQ35HJ41syDjn5lNAp3x/KRkoKi0XIxg3PAzCQu1BI5meLIoBkubUNS?=
 =?us-ascii?Q?MfTSvbEwYteiQ7uavWRJQN+cWyubGwT7Y0fitVORsjFm6nCUDTbFxmnGsyaX?=
 =?us-ascii?Q?JKXRpKGI543n3vhdeM3NCer3ptfDL8TmdFBnrFMnxvrXBq8o743c5wX3Z3OA?=
 =?us-ascii?Q?WaZAIG7O8yoV9OCO9MTcQR5s1uwD2qsSk/zgtyRfZnvBOeJDpeM78cwKTMZ+?=
 =?us-ascii?Q?b7tL/jqN2rGWXZu2+Hhz5E9qRjnDzl8Lqu47sCtTKFeTQyrfKBlQ2C6CPXiP?=
 =?us-ascii?Q?4oBvAVji5f3mU5tGPN74nooqTmaE5c7Cetp0kOEboGIRq5kFft8jZQZFTSNL?=
 =?us-ascii?Q?LSeCsFurXd51twtNYlAZd6vcNGzmWq/XRYCr8uobN2Mr09/K9OWkuwMQEjnz?=
 =?us-ascii?Q?yeZh8uR1DCI3EBGIzVdO49szZD3mv1+rKByaRXsICMTHJ10kc12Ar5c+AzUA?=
 =?us-ascii?Q?nVgEQWxqe3fQnr6eeYXTZm5bbyd9v0iwIHES3lQ57/XofU+C2w2X5ikW9Mwd?=
 =?us-ascii?Q?0J4DRskSj3xUkji8HJUuJIdXrLsr7vZv3LqM/EWxDk2MxBHYV4zewHw4k5M/?=
 =?us-ascii?Q?DjxMOonzxtlDVmD0wx/Q3KSRhTaZWvqEZoZV6ctuMviFwLdXXu4DMoanQ+EQ?=
 =?us-ascii?Q?+Ih/LEJ1JMQAtNL5bDTiFvuIma42bIKvPS/1v7GChZs/HjEsz26DBpLjs0+n?=
 =?us-ascii?Q?PDBxgXXdI1somtrghGxW6sPBn2Fqg9AeZAyAA9mHqfqYMYLQbQiLEkoOlsMP?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a04e7b4b-f961-4f62-bb4e-08dca7c1a838
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:08:57.3680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5OqeZ866qkuWSVsMofEZjcNwtxXj/ytqRUWt9dYGIjZHzd7AfOpgxrq39Po5PcFFhuCAmeOdIKFDPfnfvjDNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Fri, Jul 19, 2024 at 06:52:15AM +0000, Matthew Brost wrote:
> On Thu, Jul 18, 2024 at 11:08:42PM -0600, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, July 18, 2024 9:28 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH] drm/xe: Unlink client during vm close
> > > 
> > > On Thu, Jul 18, 2024 at 06:47:52PM +0530, Tejas Upadhyay wrote:
> > > > We have async call which does not know if client unlinked from vm by
> > > > the time it is accessed. Set client unlink early during xe_vm_close()
> > > > so that async API do not touch closed client info.
> > > >
> > > > Also, debugs related to job timeout is not useful when its "no
> > > > process" or client already unlinked.
> > > >
> > > 
> > > It kernel exec queue timeout jobs, now the 'Timedout job' message will not
> > > be displayed which is not ideal.
> > > 
> > > > Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
> > > 
> > > Where is exactly is this access coming from?
> > > BUG: kernel NULL pointer dereference, address: 0000000000000058
> > 
> > In guc_exec_queue_timedout_job() accessing "q->vm->xef->drm" after client closed fd causing crash. We cant take ref and keep client awake till jobs timedout is what I thought. 
> > 
> 
> Taking ref to q->vm->xef is exactly what Umesh's series [1] here is
> doing. I believe this is the correct behavior and based on you comment
> above, I also I believe it will fix this issue. Please test with this
> series. Hopefully Umesh gets this in soon.
> 
> [1] https://patchwork.freedesktop.org/series/135865/
> 
> > > 
> > > Also btw, the correct tag for gitlab link is 'Closes', "Fixes' is the offending
> > > kernel patch so the fixe can be pulled into stable kernels.
> > 
> > Ok
> > 
> > > 
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
> > > >  drivers/gpu/drm/xe/xe_vm.c         | 1 +
> > > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 860405527115..1de141cb84c6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1166,10 +1166,11 @@ guc_exec_queue_timedout_job(struct
> > > drm_sched_job *drm_job)
> > > >  			process_name = task->comm;
> > > >  			pid = task->pid;
> > > >  		}
> > > > +		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u,
> > > lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > > > +			     xe_sched_job_seqno(job),
> > > xe_sched_job_lrc_seqno(job),
> > > > +			     q->guc->id, q->flags, process_name, pid);
> > > >  	}
> > > > -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u,
> > > lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > > > -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > -		     q->guc->id, q->flags, process_name, pid);
> > > > +
> > > >  	if (task)
> > > >  		put_task_struct(task);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index cf3aea5d8cdc..660b20e0e207 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1537,6 +1537,7 @@ static void xe_vm_close(struct xe_vm *vm)  {
> > > >  	down_write(&vm->lock);
> > > >  	vm->size = 0;
> > > > +	vm->xef = NULL;
> > > 
> > > This doesn't appear to be thread safe.
> > 
> > Would you please elaborate!
> >
> 
> Sure.
> 
> vm->xef is to NULL under vm->lock in write while
> guc_exec_queue_timedout_job doesn't hold the lock so the two can race.
> If you wanted to be thread safe, the latter would at least need vm->lock
> in read mode.
> 

Let me be a little more clear here than my first reply.

Here is code you have xe_vm_close when a file is closing, I'll call this 'Thread A'

	down_write(&vm->lock);
	...
	vm->xef = NULL;
	...
	up_write(&vm->lock);
	...
	some time later vm->xref memory is freed

Look at the code in here guc_exec_queue_timed_job, I'll call this 'Thread B'.

1163         if (q->vm && q->vm->xef) {
1164                 task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
1165                 if (task) {
1166                         process_name = task->comm;
1167                         pid = task->pid;
1168                 }
1169         }

- 'Thread B' is executing and if statement on line 1163 returns true,
  before line 1164 is executing the thread is interrupted. 

- While interrupted 'Thread A' executes, vm->xref is set to NULL and
  xref is freed.

- When 'Thread B' resumes execution, q->vm->xef is deferenced and BOOM
  NULL pointer dereference

Thus the only way to lines between 1163-1164 safe would hold vm->lock in
at least read mode. This would prevent 'Thread A' from executing while
'Thread B' was interrupted before line 1164 is executed.

Hope this make sense.

Matt

> Anyways this patch is likely not needed based on my feedback above.
> 
> Matt
>  
> > Thanks,
> > Tejas
> > > 
> > > Matt
> > > 
> > > >  	up_write(&vm->lock);
> > > >  }
> > > >
> > > > --
> > > > 2.25.1
> > > >
