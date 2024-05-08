Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7553FC10F1A
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 02:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0578410F2DA;
	Wed,  8 May 2024 02:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zdgeo6Lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB55B10F162
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 02:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715136183; x=1746672183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wc07fHnvQ8lguphcM++viZE1CwLFHPskYDbgU/Vix+A=;
 b=Zdgeo6LrbbwxmrXgYqdiH/kK7RAnGRTdC7tYhp3P0sLJgAOIN5510+So
 EWPPmNgjbA6v4kDA0KyWj+MoGnbrJuxhoQc+GwBdbZs2/qwFh7SLVMQ5m
 HQTD8RhoT8yvM86xXwH91L+F8/1SxSofvC7Q6YmSPYcX+/lLIlujMPLCc
 rRWnXjh4pekv9ScCnT9nr2mQU59O/tLTfdkKuIA6+41vzY8tVOS3M7Cg9
 Jdws9Tgp1yl12fvQWcHOKpoQkKitcEub4kKS7Qr4vt/bKxDQBSFhc4nEr
 aBSfbM31BjtjbTGli0oSrlwgPNezyS8kZrMtXT0NQs/TbhFLcf0ZpKJgK Q==;
X-CSE-ConnectionGUID: W7LBHXhfRjC7ZwKqP+Pn3w==
X-CSE-MsgGUID: fXYaxuUvQ0mOJMoH8ksejA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21530701"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="21530701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 19:43:02 -0700
X-CSE-ConnectionGUID: 1UnAWa9US9mC7dQL5pyRZg==
X-CSE-MsgGUID: sAP9Ubz/QQSY5YZ39ZD8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="28600363"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 19:43:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 19:43:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 19:43:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 19:43:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 19:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTrNy75iJ5Agc4s12+qEzrOzMBhGKQbUcwl8XmvOVX0bN7qggx3ZI825pBJihhVBprxWV5X9qUTq4ToiSLnkMKnV+h3F5k5+hPdir06zNULvDrTnQJRaAEr0NF+z71eKrmtXTWVe6lcTGfWGQYSjq7taUMN149OpQ8ELMfqAagwqJkNCmraEzg/ZH0jGc+4QDt9nAnV8mWjTExHIfjt5188SyZPhvWacH5BpAMZXmHANwjBX1Q/P3q8PNOK0VYb+oY5y+Ppdsqq1cspYx1yv+cjXrPZk/67smJI3TXY0btBoj/5F9nPYDUU62y08Wm8XjYYjWvq6yTdCkNUH4zmlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpCLA6BVDqaiO60fPpf03JGn++tmRo/D5o2307xSBRQ=;
 b=F9aA5vit4mMx1ArUXvEafs176TvIvLkABRyIJrUbXScDO5dU3GtjlNhUe5jaPYVCwbOhUbcCCMRIz3sl6JZqPrcgKb6cCcwlrXTmcWp+vMT3LgkHeDM968pMoigXwr4kR3D1t0e1oDMn+cZfTcURZTtETKhqr3x4sbAvcGBErXSRSafY9RWeMmVpKbqJKRMCp1wS9nRUE0ZnLLHiLz+oXE8UzAeBHWAEoP4ZjfyMZhJQA+ypu/ZR6jQjRm3brcq5YLNO5BiQS4fcjb68EFRCKIAg8TKqDogSu85pwE7ryZowbVornUo3w0bdISVivHWZ13N97KLQaiAzIwZFrC76Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 02:43:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 02:43:00 +0000
Date: Wed, 8 May 2024 02:42:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Only use reserved BCS instances for usm
 migrate exec queue
Message-ID: <ZjrmpDa05PSL6B1h@DUT025-TGLU.fm.intel.com>
References: <20240415190453.696553-1-matthew.brost@intel.com>
 <20240415190453.696553-2-matthew.brost@intel.com>
 <faaa56a0-8579-4294-ba57-fe63c1f429fc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <faaa56a0-8579-4294-ba57-fe63c1f429fc@intel.com>
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: d718b2a4-2fa4-4aaa-c811-08dc6f089321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TmNS+bIwp0iCj8lyfHrSweUDfXuvMXut4qBOtdtkEwq8Gq/tINNUA71Rjb2H?=
 =?us-ascii?Q?/jexN9pZe2WLQF4+YoVgkqpcVFZszdTybsUvZpcbGvs4hWaUF2JDNvSKvNJ+?=
 =?us-ascii?Q?FcXxCm4eP4OWJzf7zCh2pvt9pMC+d92rjTkrnAj9h6z4mVUnypeNnHJCD6LF?=
 =?us-ascii?Q?/oE3cRUpIYgcxQeuPJNdSIl6cFbk6f67l6hJuezT+/Ap1y/ZPHs17cj+1V9C?=
 =?us-ascii?Q?7HO6iSDK8VF7h6hmSR7Q26fSREtZhV04WTtXSWRgxItC/m62E3hMwwspnMnF?=
 =?us-ascii?Q?cCqRTLR0zeE9x67TR+7Ep2y8beaw2rbJnOf2VyJcI2X/VwXNOEg/gOZAbxym?=
 =?us-ascii?Q?Y7wpOTEiIHCzC9lZ5eobOQQWdG1E1eoODnjRAx/ikzmB4bHV0DL54dyNKR/e?=
 =?us-ascii?Q?Kuaf/bmkNY8pL0KPRTSqoQMXR1JHCHnKDIbf5866+LjefQKxblLD6Ii4KV+Y?=
 =?us-ascii?Q?4cN+oagz6ycjlspPDNRk6dKZceJ30HXEoTaWrvD9cjvt7j+Ol5WDQwdlfcgN?=
 =?us-ascii?Q?7nSK0QNtWAUDggbixZ3emdhl52e6v6OHd87paAUZm3LV0fCbcRKe5h6aFzgZ?=
 =?us-ascii?Q?Q7QyQxUWNQFFrUNkEYfs0yJanpRqzfHnUZdG99X0apl5UwTZzrP6ztdneOHb?=
 =?us-ascii?Q?QiXotRg6q3bobpcQZrTy0diGZZftbiZ4/REUSu72kgryUqbvW1Y5xADKNwws?=
 =?us-ascii?Q?CA3K7zVitbkyVpfFu8dpG0cvyzygjehlAVj6Ne2nnS3FmpWGeleQpVVDagEl?=
 =?us-ascii?Q?V4LGrbIh8GZS00jJwY03Z7wMntI4zRgEq5ZwRm0BCxH8/sCyBeK9O4VfvGC6?=
 =?us-ascii?Q?sX/3nKRgsBySNPyy14Jqo8PJCITqYUKR5F6dsE1RLEe9Kqrk7sZ16/s8yqZe?=
 =?us-ascii?Q?IDJ20jYJkhhzxoP4oR/C6KJr+JHke7u911ROG7zInnYuDpZ9gUc1bvRM0ZoH?=
 =?us-ascii?Q?4MgffzCzs6BaEzt5Z7EY8wnDrsZRmq3aYi4wTKe5lG1n+QBfBMMIHkoTMgnm?=
 =?us-ascii?Q?NSoWz3CC8DqdPm0s1mzdi9nOiXisXhLCRsdMjLTweTWzPrStiIklBc83Zp+H?=
 =?us-ascii?Q?AhwHSBvel6Ow/AqEJkECY0njPR2cPOXkJZ05/aCc83wZsC9l+8v+40QAdKu3?=
 =?us-ascii?Q?dGzJvTStRxy3RBs7PoSaWyjEPu318fuGqo/6XVY054B2lHJ1mMter0NearCb?=
 =?us-ascii?Q?KUGa4d9LXNCR0tWsoedxNwcfOF5w6kLxnNidqP50ACOw9bVvOM7GNlGNJkpY?=
 =?us-ascii?Q?yCpIkLjwDXbeP/AZODsr5nVJhcBuGIPRGVI/aNAOog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s46KMq+0D6FG+TGVQoklLxCLFeQWe50/hBcTNLu3SPzlsHB3/9+7spE+1N10?=
 =?us-ascii?Q?MlQPP2zX1TwSvtVUmkEU5OmD3iugUOp4epEpCCvNRzjG9rKBKIrzGuo+1b+x?=
 =?us-ascii?Q?auhWqIhlVuk782wAcZSLpgrlI95AO18zgYO3O51bMpAUuzxIrTxo1TGlQXrR?=
 =?us-ascii?Q?8qGPpCt3Q33HmHIuJe2Rw2dP1SkJpV5WrYwepPFtGj7XyNHJJeBYyB6OlIhZ?=
 =?us-ascii?Q?hSfLDlTWVx9TKa7q/Gb96F5jEIPmpR0VFNYkYWjH0bIHEKbJoH8S5ISwpczO?=
 =?us-ascii?Q?iBVL8022NCVvGZ15E9Ej4sbHCE5hFcsREkgwGZrNpQ/9MYVOrIJ92qpZ2t4s?=
 =?us-ascii?Q?y+7bjh7Vvi+OOXKCU9JDbtSGRdJNImPzFDbTa4tXUbQzDVEmI0wQxozNlEXp?=
 =?us-ascii?Q?oc43Tk0lcsB+a6Xq8Duk2FC8DKwe8/pgzxk6/+l9r7b8d035oWoRrHXR6zmI?=
 =?us-ascii?Q?ZfpMddak+SyV44zRL6cYnIb6wVNK6kska/+F+g8haCncF1ceGK5aWWuLbWYc?=
 =?us-ascii?Q?9WctDw94Z0ZVp96nZ/Mctt+pTMiZI8Oc3MWGnnMFwg1Urji/cAON/UBD2iIW?=
 =?us-ascii?Q?Q5GrgB74p4dFiU5dqW5OsXda4v59PNI2Sv2TShoh7m1D1sO1qPJS+TjIHvm8?=
 =?us-ascii?Q?ApQbcHSbG9Fpr6AFL0o0mdSbTcZ/NcEMYkv2w9pvFapqI+sGbKMctznwWx/F?=
 =?us-ascii?Q?v6YmgDckCuakJx4g92rIdoJMIQybc7bGv21MTD46CqpIU5AXueGaUIX7GROW?=
 =?us-ascii?Q?uciBdy0HRrXJt6LGikBiE8G43cZTeXR25pOXxNcfXWstcAgUmVM7CYryV+ht?=
 =?us-ascii?Q?H3mL9EOAKe5YB4cJos6RR+Wk8owaEQYxuymubJ9TlduZ5ad6vDQeYeelAWXa?=
 =?us-ascii?Q?Vaui8A9nCQYLT05eynM4lvjMmexk/EbB2fGZvw4LjYhPwHKSReyJmr6aNDjz?=
 =?us-ascii?Q?XIzQ/QAxFPLMsVqbFy/EhtyX1cKWmixaqbor4XIEwk2ThGmdojXErpQnhF9O?=
 =?us-ascii?Q?+x4GXsbgjyVnWD7bRakhDHoZHow2RhGXetbsjZJFvLJ0pUvCmswe7DOfvdWz?=
 =?us-ascii?Q?GdKkGy7XVQs2QqcCy/K/kpn1pboQUZMd62qIqqfWvrS9EktPF/HSD6ku9vbt?=
 =?us-ascii?Q?pLKi+ow2bR0EUPS42nwPnKBw2dL3i+JEr7R0Mk8EpzsaZE16SDiyPWsTpY/d?=
 =?us-ascii?Q?bhh7dDFHBMCON8ORlTn8Nt+3n3n5Etc9FDSq9W7/rVu9oVSCuzdx2c3SAmI2?=
 =?us-ascii?Q?M7znRVVafx+cuTqdk7Kir4XVO0x3RzSVZA3SxZL/ctuRE61vrBk5tiwlEonO?=
 =?us-ascii?Q?oKnwMrU2C/50R7kwvBB80jlZRVcauqvZGUTOekyiCTe2v6FBrXOFE+ziakZX?=
 =?us-ascii?Q?HZp/kdiPRvQIgkULo+g+ei+8hpnBSUGLhkJyTdxv4dPzrt7nd08u0+f7cyN9?=
 =?us-ascii?Q?EJhv9pvSnUXVnQqFsKjbKTyfnl2FEEnhe6knvpdjmPt7yXzmavRWudBt/vBN?=
 =?us-ascii?Q?risZBprWC2A7MUgCFtlIhVkjPE6jMEZy3JMWRmW+fCJhVrF9ttUPGISw2RXq?=
 =?us-ascii?Q?Tyz080/doHvdk/Ar6r7rybLNOrWxZf8dB/dq80cLPvX1e7mrBUCASqN0bGkf?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d718b2a4-2fa4-4aaa-c811-08dc6f089321
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 02:43:00.0584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Kc0NFz9ynwypGmM32Uc/v+LwwNqNxF3FdfJDe9S0sILslxLh342pY5OzFZEirXerfnosDeV8Ib6IF+4F4Hjzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

On Tue, May 07, 2024 at 04:59:25PM -0700, Welty, Brian wrote:
> 
> 
> On 4/15/2024 12:04 PM, Matthew Brost wrote:
> > The GuC context scheduling queue is 2 entires deep, thus it is possible
> > for a migration job to be stuck behind a fault if migration exec queue
> > shares engines with user jobs. This can deadlock as the migrate exec
> > queue is required to service page faults. Avoid deadlock by only using
> > reserved BCS instances for usm migrate exec queue.
> 
> So the underlying concept was always broken here?
> 

It seems to be broken.

> With the mask of more than one engine, the virtual engine still won't always
> pick an idle engine?  HW may end up picking an engine and

I thought the GuC would always pick the idle hardware engine but it
doesn't appear to be the case (I can see a clear deadlock before this
patch, resolved after). Maybe the GuC considers 1 exec queue on the
engine idle so it doesn't pick resevered engine?

We probably should follow up with GuC team on this but for PVC as a SDV,
I think we should get this merged.

Matt

> confusing it to have been idle?   Because the extra 2-depth thing is not
> being considered?
> 
> 
> > 
> > Fixes: a043fbab7af5 ("drm/xe/pvc: Use fast copy engines as migrate engine on PVC")
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_migrate.c | 14 +++++---------
> >   1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 9f6e9b7f11c8..c37bb7dfcf1f 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -12,8 +12,6 @@
> >   #include <drm/ttm/ttm_tt.h>
> >   #include <drm/xe_drm.h>
> > -#include <generated/xe_wa_oob.h>
> > -
> >   #include "instructions/xe_mi_commands.h"
> >   #include "regs/xe_gpu_commands.h"
> >   #include "regs/xe_gtt_defs.h"
> > @@ -34,7 +32,6 @@
> >   #include "xe_sync.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > -#include "xe_wa.h"
> >   /**
> >    * struct xe_migrate - migrate context.
> > @@ -300,10 +297,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >   }
> >   /*
> > - * Due to workaround 16017236439, odd instance hardware copy engines are
> > - * faster than even instance ones.
> > - * This function returns the mask involving all fast copy engines and the
> > - * reserved copy engine to be used as logical mask for migrate engine.
> >    * Including the reserved copy engine is required to avoid deadlocks due to
> >    * migrate jobs servicing the faults gets stuck behind the job that faulted.
> >    */
> > @@ -317,8 +310,7 @@ static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
> >   		if (hwe->class != XE_ENGINE_CLASS_COPY)
> >   			continue;
> > -		if (!XE_WA(gt, 16017236439) ||
> > -		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
> > +		if (xe_gt_is_usm_hwe(gt, hwe))
> >   			logical_mask |= BIT(hwe->logical_instance);
> >   	}
> > @@ -369,6 +361,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >   		if (!hwe || !logical_mask)
> >   			return ERR_PTR(-EINVAL);
> > +		/*
> > +		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> > +		 * PVC, may want to revisit if performance is needed.
> > +		 */
> >   		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
> >   					    EXEC_QUEUE_FLAG_KERNEL |
> >   					    EXEC_QUEUE_FLAG_PERMANENT |
