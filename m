Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1CC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 00:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62C10E75D;
	Thu,  1 Aug 2024 00:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjpKe2Jh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8293210E75D
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722471587; x=1754007587;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OsLhiIv1XzUSiCEd4dEdNQOy2lOGE7MONQlelW7thvc=;
 b=KjpKe2JhK/WrXzyxy2rsJohFZO8TA1JtY207sDFCPKN37fLx1KySDvF6
 /EFWvC2fTv9HPUy0+nTAvrGkHln5/DtfOtUcnt182Rl5L/YDgAmodDo2g
 9eoIiN6INEES3//vgAoKEazftVMA1S5+GpD371OeQQHqNMS2EVmTqQbEv
 FLrZb23R3SXSu0aSLljxh3wGS+BVPKybfSQ33dA3ZhwdJ0YeoDjltVbuN
 VtAAGgBeZHrCnON3BrT1P4CO2yJXORKDRZz0V91SXGhd75otvGuujma4F
 +7Y/OfaLm+8x7qugIjGym2C//2dYxR7Nvwy9xeqiyxSMPKk12G/+zAvAg A==;
X-CSE-ConnectionGUID: 8SYYJeb5Sqa5Cxw3/Oj9+w==
X-CSE-MsgGUID: duX/BtwZTPiWMkfxo+Gh8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20234905"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20234905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 17:19:47 -0700
X-CSE-ConnectionGUID: iYGGfAgnTMiGN7fp+k4GQQ==
X-CSE-MsgGUID: snKZeFrGRnyDDdq1bjadOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54821477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 17:19:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 17:19:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 17:19:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 17:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YH5YVEOiYXGtzUADMN2e7rCNgCfA8EHAjGLDJ0tMy7rsMc2nWR9r/hvXTJCLymN8aLkkjdOfON45eRLWmhXpOo4Yf3VE+rRodS65f7sR08ne+/ryXTmSxnQ6ZKqBBK79lQGrocJ+WQdoP4bYGo1yatfkGnaX3BDPELlvaKPlA5akZ/qpG9FJIjEBgz1WXi1O/S5QfriMLGhn7AjF36rLp30IyTcBn5REM3B8fZg8hZozQsYJKwFaTQJmkMlWZMSnfbqAqQvK8nqAfEQEp2TZFJmsg6qAPnAMENP5dzF4TkR9mFUrfpkqR/zzvcYxAZN5XGOkKE2wTG8b012rx3utUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OFJhhrAFoBbo5+ZuYzb4MKzcG+CJQ29e8NJZJKI7qA=;
 b=Wot8RlkyPzz+4HGunYB7BbRTX8bP9cHIlBpN7HrHYM94SpBD8T8djxmgdZb2LQeNL+lUXkJQKaB1WQGg3csVxHBNSvt2UAsoUzGqBoU+3xtNjvOj9wWoyYcQ1ALejtjH3Wwqn8aC9nL7JDm5sHCPUPmCcKpNLnxHBSANzm1xHnnlDHN7+PwaFzYicsJfT1cBpJqOJt2/YQ/u9U1Sp7XXzJe5RBQ8hOouCh8ddR4yphJxAwrxtRmhT1kSo57asrPjqXO7mrdvIhIDmds5+bhorSogUACVwcqULi7VoeoCxyWKVso11dOXjNtraZO0pIrBDmfHm33uOIAT2DBsBc75eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 00:19:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 00:19:42 +0000
Date: Thu, 1 Aug 2024 00:18:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 01/13] drm/xe/hw_engine_group: Introduce
 xe_hw_engine_group
Message-ID: <ZqrUaX1ejXihIJRu@DUT025-TGLU.fm.intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
 <20240731142349.4101307-2-francois.dugast@intel.com>
 <20240731223507.GG2685051@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731223507.GG2685051@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:180::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5c26b9-2121-497d-fd00-08dcb1bfa3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5fCf6z5bNOK54TedWoofJxIviYAwL0DTaftf2684ol8Yd6/9679gwyTA+P?=
 =?iso-8859-1?Q?5Aqa46oobY14krw3M0ELkPUdSGo5NLvRIoxETEOgpRNiStHTYB4eI2q1Pw?=
 =?iso-8859-1?Q?yyPjIsRgCe53pKpSDS50cuNW/HdLa8ocbtDcyPd5htKSeil8Tij0oQZw1g?=
 =?iso-8859-1?Q?Ow2ZGj9fg3bmQ/6kAosaRlxmfjGMIOlFDQ8mF2+LAJUVAs2r/g/eVKUwdl?=
 =?iso-8859-1?Q?+lYoy89b/htfD7FG9x5jZIDtB4VeCz+A0xlYWl+8gOie0tRKfudf6wvsJD?=
 =?iso-8859-1?Q?Q48UnERv7PUxC7exd++pBg+lcioSU+d73T7rusvcN5k9mJYFjZC/HcIf/N?=
 =?iso-8859-1?Q?nVu3QMSmmyUfFGqhHpWsNB2XVrY2dZ66xu2kOpE1GjDtiRNUEP+0HICj8Y?=
 =?iso-8859-1?Q?2f1oBf89Ie8wxP6J8/a0r700xv3FxiP+3frVUq3gkzPwFU8VY/13nCg0Hv?=
 =?iso-8859-1?Q?KVkAzPazXsKnwus96z2QFHALUXJmgdwmAr49TBUdWvIyO5TwJUo5RgtPHB?=
 =?iso-8859-1?Q?c37q/ybPx1WRCygPACNy0A6RkbYRsY++rpk8aLRVnBTBtGVIThQTCmAQpg?=
 =?iso-8859-1?Q?ePLD1dHRFosaCQwmwJGxsfOUc0MSzV/NOY+M0zqxxqFcf4q1nL+UgEGWK9?=
 =?iso-8859-1?Q?1MBPmc0+oSitYBmI+6D3rqCbg9ubfKsjYrVRSUxtQZ3OJk+lrC/dgzpYI3?=
 =?iso-8859-1?Q?ZiFGUu1WrIB2raTaffADoWhrD5ahcmfxqDYgyHrvFo2dZfYrUzeVQoxBlY?=
 =?iso-8859-1?Q?lyOYT1c741XYy9PbEbtAg4GdzxcERNRb2Sf+DvF1GN6gT6CFiaybTxGVsN?=
 =?iso-8859-1?Q?T6cdiUmtCZMBWTIu00bzSAaC1fgog9fBhXW8B4k1/LIxNncbcnKgMa8sE5?=
 =?iso-8859-1?Q?n5lFAnWAW8gEHQM79Fs21V+NhyJkcByjfI41JOyea+Hu88zx2Qtq9RH/2y?=
 =?iso-8859-1?Q?8jq91510nEGlrlLHdvgeBcuXpJs6ox7nqryrBeNnOGZeZ28JNRZ98fqNV9?=
 =?iso-8859-1?Q?YkMNfGfufYV7OArLwTbkHgg38lGX97s8qSl4sMc7hFeqjz+2ahh79V8jL7?=
 =?iso-8859-1?Q?wyJzyiELDvjv+DbtUINIuvPJGYc7YhchYyBZf2ToojWF4chNASCAclfZff?=
 =?iso-8859-1?Q?BfbvrkN2+WLeSSE4U/2tr51wXmzE9UEpf4lb/06ub7p4SmtITHBFXfJ+pZ?=
 =?iso-8859-1?Q?Y6DM8utFrlSZH38g+dZIs/fVr6QFD8a/4yyW3eX8F3/h5qKNhOSs+fuJMm?=
 =?iso-8859-1?Q?M3NeiKBgDN1Y9H/Tolq9iFPFEPafu1wLFQ/Anu+gxv4qa/VSiqc4uyh7b+?=
 =?iso-8859-1?Q?y1lrAbfC3kvkkgr+dyKbrsTYNA3JvgZbKoA6y95NSXy1YEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XXyfMfo0F4mQEZdvtOYL52gwdlLZE2lUcr3+Wu1Wg/Sa/s9fuZPdv5Kln1?=
 =?iso-8859-1?Q?fs2XOWIpFO8vhe5rS6D9TXv25QW9QeUjCVRl3iRTJuoTUxsm3X4ROYD+VJ?=
 =?iso-8859-1?Q?P0ArB4k+OS0yJtPA/nm5mJPUVym0unc/KCDaFyA/ajH+6UKfEkWXgDM7vK?=
 =?iso-8859-1?Q?S4UawWZn5K2H5/S7HZbOxs0xZf+Oh2WhDzda98L5Y90wHM2ZVlep4Uxt9I?=
 =?iso-8859-1?Q?EV27+DKUlfLLtkjbzLCwMCReeCQ2Xg1rNbg5ka1yxgMeKpBqC2KkV9l34O?=
 =?iso-8859-1?Q?IHZkw0MYyrWenmdR5jJazhHHZwRZnOQjV4sKr/xyfwJtKR6tYVFzy3twQi?=
 =?iso-8859-1?Q?iUOp4JdlpTderMPzLrvNW8K5QLrrTh3FDD9NibpIOzFbeJyu+INSUB2r4t?=
 =?iso-8859-1?Q?MfYOdDOIKUXLdj7TaiDGhBQtN6mgdL9nDZcH4ckm8eR3EWajOOdD+Nczlo?=
 =?iso-8859-1?Q?7esJX33XMT6Hqc/acU1KYpH+yaox8vqqGNBg36E0kP+yZP6JQ376gcN+xB?=
 =?iso-8859-1?Q?Y98SEVTj/egD+UQJck2ae5KzWWwA+IIrR0NjOk0Y1D4JN/Q1epJyHCyh2K?=
 =?iso-8859-1?Q?Lcg4ca3fmMbNbq3E1TEGv074PPoVoFquhGmeNT7DyDyn84x8W78KPhtYNo?=
 =?iso-8859-1?Q?4F+RbmT8iXqDC6bFvX8b5Rprw+TeLILwjKWtYKFVwcILR6o7skJGE35f8r?=
 =?iso-8859-1?Q?sNY8moHwUwFJ5eSF4O2GDKIImkovqsRpUQoe68cLO8+V3jjFTcmDX3zRO3?=
 =?iso-8859-1?Q?3GOSkcM2jl9+3nGALiB0OjvSJpfpzn39W6qxLdXjl63DytwOvrVYOpbcym?=
 =?iso-8859-1?Q?GtmmCjprHFHUBrKnkLeZk7iZ9pfQSDO0CSAUUrO/JdOrMXnO2Ks3DwvVmO?=
 =?iso-8859-1?Q?J5japKpfQN//jUOflKaIWSGptxjyn/wa1RZMoXK2Ry/UoPWa+RrHdcuKgi?=
 =?iso-8859-1?Q?kVMbnHXEI7WT9KYA5AFYIIhiWNGoBJn/XCGLPLXtvGC0MArbXs7C1sUpAy?=
 =?iso-8859-1?Q?cVcizmSNAlw+lxm3wB9i9rh5fYuOfioIXPg99/Hykd8tb7/mQT2jJ2sY2E?=
 =?iso-8859-1?Q?QoCpfCGRsSNnkrZyLLt+10mTx4MRCnazUcrO5Np5cNCyw+GSVFBp4SCJgS?=
 =?iso-8859-1?Q?3hti6cjcrzsTdAyDCgJy8n+8AKx1wec5V7V+xg/9lCSDula1NPCp4damh4?=
 =?iso-8859-1?Q?U0AMON1lUaT6OyQiCO8ZiWTS5cpC0WWVIG8kt5e3kF8B3QZVoFhhK3du0w?=
 =?iso-8859-1?Q?8aq3K4bjTgtljfCmVM/XpMr9Ul6eHApdJW6NAuhM6XcRcgL/XDBbmmdYAe?=
 =?iso-8859-1?Q?UpVF3iIfiVls7rEtzT9QNPn06UEwF4OKoN9NNiK9cYJlSi78uEf9kfncnp?=
 =?iso-8859-1?Q?regmS4Df6wd88evtE9k2i6BhLtNEjoUPjUygMTNdhRAD2fP719smvnPz1n?=
 =?iso-8859-1?Q?3A8OEUq6jVOKkKxHfoJqsiUw5aT1tNvXNy0vE7LXdF4tVNeuDYhkP9dW+Z?=
 =?iso-8859-1?Q?1qlCDtfP/PRTCDw0lCdNf27QIhPhKShIIQG+/N8+tNyU2Hrhs45ZHGLMZ2?=
 =?iso-8859-1?Q?hYBtILr1mSJelP0ou+Kp7rGYAWgN3UVXHdPD5npieIpeCMc6Bz8wCM0rk5?=
 =?iso-8859-1?Q?zOHLmiNvSrUsiG8zkzrI0KJzvHIenZ4QEU7uW8FBhmL/qgOGHotTTT2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5c26b9-2121-497d-fd00-08dcb1bfa3d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 00:19:42.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HooraetXYn5+ccE3elRm+PQ2J2cC8m4jHwyW6rnAB7DTyWsj1DU4X1iAhEfV4UZ+PdCzkwoiAQMarMg43bXf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

On Wed, Jul 31, 2024 at 03:35:07PM -0700, Matt Roper wrote:
> On Wed, Jul 31, 2024 at 04:21:35PM +0200, Francois Dugast wrote:
> > A xe_hw_engine_group is a group of hw engines. Two hw engines belong to
> > the same xe_hw_engine_group if one hw engine cannot make progress while
> > the other is stuck on a page fault.
> > 
> > Typically, hw engines of the same group share some resources such as EUs.
> > This depends on the hardware configuration of the platforms.
> 
> How do we determine what the shared resources are for a given platform?
> Are there bspec references that we should be checking to figure out what
> does/doesn't need to be grouped on a given platform?
> 
> The EUs shared by the RCS+CCS engines are the obvious ones, but is it
> really true that BCS engines can't make progress while another engine of
> the same type is faulting?  Wouldn't that be a huge problem (since a
> fault on one BCS engine usually requires that we utilize a different BCS
> engine for the migration operations to resolve the fault)?  Or am I not

Missed this comment about a fault. We reserve a BCS engine for migration
on a faulting device and do not expose this to the user to avoid
deadlocks on a fault, see usm.reserved_bcs_instance. We actually got
this wrong initially [1] and observed a deadlock while working on SVM.

Matt B

[1] https://patchwork.freedesktop.org/series/132465/

> understanding what the groupings represent?
> 
> For VCS/VECS, is the shared resource we're concerned about the SFC?  If
> so, then I'd expect there to be a separate group per SCMI / media slice
> since each one has its own dedicated SFC (and sometimes some of the
> engines aren't even tied to the SFC at all).  Throwing all the media
> engines across all the SCMI's into a single group seems like it would be
> overkill unless there's some other resource that we're concerned about,
> so it would be good to have some more details in the commit message here.
> 
> 
> Matt
> 
> > 
> > v2: Move to own files, improve error handling (Matt Brost)
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |  1 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c             |  4 +
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 99 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine_group.h       | 16 +++
> >  drivers/gpu/drm/xe/xe_hw_engine_group_types.h | 48 +++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +
> >  6 files changed, 170 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 1ff9602a52f6..b67ace7ed204 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -69,6 +69,7 @@ xe-y += xe_bb.o \
> >  	xe_heci_gsc.o \
> >  	xe_hw_engine.o \
> >  	xe_hw_engine_class_sysfs.o \
> > +	xe_hw_engine_group.o \
> >  	xe_hw_fence.o \
> >  	xe_huc.o \
> >  	xe_huc_debugfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 00ace5fcc284..f62992d0497a 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -23,6 +23,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_mcr.h"
> >  #include "xe_gt_topology.h"
> > +#include "xe_hw_engine_group.h"
> >  #include "xe_hw_fence.h"
> >  #include "xe_irq.h"
> >  #include "xe_lrc.h"
> > @@ -764,6 +765,9 @@ int xe_hw_engines_init(struct xe_gt *gt)
> >  	}
> >  
> >  	hw_engine_setup_logical_mapping(gt);
> > +	err = xe_hw_engine_setup_groups(gt);
> > +	if (err)
> > +		return err;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > new file mode 100644
> > index 000000000000..7fd10f0780ea
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_hw_engine_group.h"
> > +
> > +static void
> > +hw_engine_group_free(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_hw_engine_group *group = arg;
> > +
> > +	kfree(group);
> > +}
> > +
> > +static struct xe_hw_engine_group *
> > +hw_engine_group_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_hw_engine_group *group;
> > +	int err;
> > +
> > +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> > +	if (!group)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init_rwsem(&group->mode_sem);
> > +	INIT_LIST_HEAD(&group->exec_queue_list);
> > +
> > +	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	return group;
> > +}
> > +
> > +/**
> > + * xe_hw_engine_setup_groups() - Setup the hw engine groups for the gt
> > + * @gt: The gt for which groups are setup
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_hw_engine_setup_groups(struct xe_gt *gt)
> > +{
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int err;
> > +
> > +	group_rcs_ccs = hw_engine_group_alloc(xe);
> > +	if (IS_ERR(group_rcs_ccs)) {
> > +		err = PTR_ERR(group_rcs_ccs);
> > +		goto err_group_rcs_ccs;
> > +	}
> > +
> > +	group_bcs = hw_engine_group_alloc(xe);
> > +	if (IS_ERR(group_bcs)) {
> > +		err = PTR_ERR(group_bcs);
> > +		goto err_group_bcs;
> > +	}
> > +
> > +	group_vcs_vecs = hw_engine_group_alloc(xe);
> > +	if (IS_ERR(group_vcs_vecs)) {
> > +		err = PTR_ERR(group_vcs_vecs);
> > +		goto err_group_vcs_vecs;
> > +	}
> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		switch (hwe->class) {
> > +		case XE_ENGINE_CLASS_COPY:
> > +			hwe->hw_engine_group = group_bcs;
> > +			break;
> > +		case XE_ENGINE_CLASS_RENDER:
> > +		case XE_ENGINE_CLASS_COMPUTE:
> > +			hwe->hw_engine_group = group_rcs_ccs;
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > +			hwe->hw_engine_group = group_vcs_vecs;
> > +			break;
> > +		default:
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_group_vcs_vecs:
> > +	kfree(group_vcs_vecs);
> > +err_group_bcs:
> > +	kfree(group_bcs);
> > +err_group_rcs_ccs:
> > +	kfree(group_rcs_ccs);
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > new file mode 100644
> > index 000000000000..c2648f87f7ef
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_HW_ENGINE_GROUP_H_
> > +#define _XE_HW_ENGINE_GROUP_H_
> > +
> > +#include "xe_hw_engine_group_types.h"
> > +
> > +struct drm_device;
> > +struct xe_gt;
> > +
> > +int xe_hw_engine_setup_groups(struct xe_gt *gt);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > new file mode 100644
> > index 000000000000..b828d85d24cb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_HW_ENGINE_GROUP_TYPES_H_
> > +#define _XE_HW_ENGINE_GROUP_TYPES_H_
> > +
> > +#include "xe_force_wake_types.h"
> > +#include "xe_lrc_types.h"
> > +#include "xe_reg_sr_types.h"
> > +
> > +/**
> > + * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
> > + * engine group
> > + */
> > +enum xe_hw_engine_group_execution_mode {
> > +	EXEC_MODE_LR,
> > +	EXEC_MODE_DMA_FENCE,
> > +};
> > +
> > +/**
> > + * struct xe_hw_engine_group - Hardware engine group
> > + *
> > + * hw engines belong to the same group if they share hardware resources in a way
> > + * that prevents them from making progress when one is stuck on a page fault.
> > + */
> > +struct xe_hw_engine_group {
> > +	/**
> > +	 * @exec_queue_list: list of exec queues attached to this
> > +	 * xe_hw_engine_group
> > +	 */
> > +	struct list_head exec_queue_list;
> > +	/** @resume_work: worker to resume faulting LR exec queues */
> > +	struct work_struct resume_work;
> > +	/** @resume_wq: workqueue to resume faulting LR exec queues */
> > +	struct workqueue_struct *resume_wq;
> > +	/**
> > +	 * @mode_sem: used to protect this group's hardware resources and ensure
> > +	 * mutual exclusion between execution only in faulting LR mode and
> > +	 * execution only in DMA_FENCE mode
> > +	 */
> > +	struct rw_semaphore mode_sem;
> > +	/** @cur_mode: current execution mode of this hw engine group */
> > +	enum xe_hw_engine_group_execution_mode cur_mode;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index 70e6434f150d..39f24012d0f4 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -150,6 +150,8 @@ struct xe_hw_engine {
> >  	struct xe_hw_engine_class_intf *eclass;
> >  	/** @oa_unit: oa unit for this hw engine */
> >  	struct xe_oa_unit *oa_unit;
> > +	/** @hw_engine_group: the group of hw engines this one belongs to */
> > +	struct xe_hw_engine_group *hw_engine_group;
> >  };
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
