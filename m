Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9A5C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 18:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C926110E156;
	Wed, 11 Jun 2025 18:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUqpIgRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26B210E156
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749666242; x=1781202242;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R4fAWY1iaLACsNUXfYQfkKkqaWoLz4Vpws9IK3nX1xg=;
 b=MUqpIgRGDbltvhQne939h7VpGyXPJicXHWs7n/uLJj+p03cZLe3I6WIP
 KmQ5INZVQcf68elQaFz0fTbtkNq/kjPeJNAgEfWqHA++Gv6Drm4aBAjDG
 ey3OWuIXl8noyphKof0VaC4VsxxgBUYpTDoabriG6z4mG7ktLJpRTDA1z
 jfnngxsuYXM6Qo7yqGaKYCen6nokKXLKU4HyFuyaV3O2w28ke4McjWPrm
 r1W237zinSpcDuT33U/jhgQF5w8RcOmwE8+yxQfG5zZ3CzdaOaWqdmBI6
 IuQn4yEQuqZOlmCORI4spl3mYPLHFYGLFYvYf6hLCS11+E4BcTbuVagqP Q==;
X-CSE-ConnectionGUID: aEahJfi/SJaTK8gT5w5yrw==
X-CSE-MsgGUID: meY4DSH6TCuED14sy3/Qaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74356406"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="74356406"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:24:01 -0700
X-CSE-ConnectionGUID: HT/5mQw+RyW7PNixJczHvQ==
X-CSE-MsgGUID: /sbKnU9DT/yuCYyIB3BKtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="151070519"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:23:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:23:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 11:23:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpoTP7D2SBPiFu3lDtbHxX3STrZQeDK5DyDUv2NRSBwaMDPKyw+mvxns8uSArsdnD5Cxoc7rKFTRsy+bUfgaLG0lTmqEOOvg4yQdmWHUQxEjkV9ih/z3lfKhUL6t68w3UsKkzDukTYdUHUMcraB8uh3Z8q7INu5chICXEz/K8q7EHu3jgRooDov4mD4z1KLnViRbeSLMk3UjK5QBQECZxTPd063PyBy2ZsbsXPfkiKhev1j/gmv+WvEGnsFbek4mkZvwVeVaqR9645/nQYfZawbuYunxOBMIGsY5A0Ket1/XAt3IndseuV2KOhHVnUGoePfLMxlv+pW1ub49cE3+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HowWUNFKWd3vfPKfwkjF0yNR7EchIDq9D2yQlKhxb+k=;
 b=cz13k5gZhZbAOUaR9X9adfLuJPK/UZRrWwk03UjwPSDvoyRI/+dy1rxz2fTToe1NGYt/oI/fNDFeJQXlWYeSwHLVpidPCVDVYv/LjEA2V6kIZy4mC2BK5qMbTCx/y3u+/dwEqdvGJ0x79PgOKpoYNCzHX1d/j81THNNx2JxKJfLdnBnVo/38NbEArBRSHYAxQEgexL+Ivg30PZHiEVxoQFouDpWAmuP7nd4TS53bABhVt3OjBqrNCn+pBTdKwDDIISAMjPSR6QdBREtoRrjLqPJG+5UQru424dtBgc0K0rWu+7CByzkgeO6sB8VaF9KNCABTPzHD47lNDtfXGLweNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 11 Jun
 2025 18:23:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 18:23:56 +0000
Date: Wed, 11 Jun 2025 11:25:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <aEnKG6LYzYE7f3eK@lstrano-desk.jf.intel.com>
References: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
 <7c4a125a758c00a506927cb3549736c1eb9d3886.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c4a125a758c00a506927cb3549736c1eb9d3886.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: b4da2e52-c009-44ae-ea0b-08dda9152066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xJkGPUc3TFmdWmAGtkKjLf2hMEwvAZZsSbqPpdXu7JhsUmOltds9duhUCY?=
 =?iso-8859-1?Q?Xd6TV+2lS84wUX9bhuKAXlc6BXShhr8JDI91sTxjfIhSkOtgRXPZuC4MLl?=
 =?iso-8859-1?Q?v8WtywlCRs1p99nmWE6kp64i4zqyaZZKeYhB+VqjoW0KnyZNVRBbP32s+2?=
 =?iso-8859-1?Q?M01ICYBXUdgYaQ6mEtgxSEST4SD3M/QAc30PljJNgKwBQN8/AZRbzfVoWf?=
 =?iso-8859-1?Q?F8cBFX8EoN1kg+Et3Eea6l88PveWd/tZq9kMZ2D/YsnI5bCIYJsZR3X5si?=
 =?iso-8859-1?Q?Vhiu/Z/pntaZS33raVemOVCWs0B8i/+J5ghYt8TkBw/4z28Rwu76+IKEfv?=
 =?iso-8859-1?Q?lH+lnpU0ipvS6rfh/VG2mbQ1sQhDR0ILZRtXPJOKpHIiQlg58Mai4KqtEb?=
 =?iso-8859-1?Q?GCviqepy4ZpkdXrm2g0UPwteyQmma79zzfOOLCQYx0eBAPQqSnFTnuaMGN?=
 =?iso-8859-1?Q?ifDP4Kv5PTnmwfHKBa1wUTRCOiLPWzSPHnGnwZ5T8qRPKdHR+2Hl7IdRFH?=
 =?iso-8859-1?Q?ViFtvpCCDyFSku0NL4hkaio8ICezWwc3+h1a90bl7GJeu8bURDpLPfsN7Y?=
 =?iso-8859-1?Q?CTs//p+qXpHcU90c/j+T/9va/0LTkwZ4DC2g15SSk48SjRiwNcCuFpZH+a?=
 =?iso-8859-1?Q?s+x5MfA17431xnIrzq+cTA1IMoPTw5UkR8HnlxvYwb8DkezJbPLiDyIf41?=
 =?iso-8859-1?Q?7RdLlZ0+gd4M0ChvOk+BP5Euug2GM4CX4zFOQP0O7cl7d4JrmzQYE+ykCs?=
 =?iso-8859-1?Q?K9uh1DDZ20fvRsB5Ju/1+8BvOjykc3b6W32SWfajM+AIWu1HniNU+iRe7b?=
 =?iso-8859-1?Q?r0Hy5gbjFP5VgY680tCKxAEscirie9I/EKzZhCjZjYI7E4bAcq+prb0N9Y?=
 =?iso-8859-1?Q?ISLx7b6oTsCg0FwR6KFvRKFEIsz2tzx7KWoZZW8sSlat7n3btOjNswTxnS?=
 =?iso-8859-1?Q?e2B2IQjZUIXMFNb2xyNUFPJ1veQ35A6a5Qm1Ym9JbXtG/Iz/RBq4aaIInp?=
 =?iso-8859-1?Q?v9Fxr3oLXjIUYIm5XdeMJyT/sE7jmjvh4cGxBkNMMcb4AwimJSR9TtvBxQ?=
 =?iso-8859-1?Q?TNqQBhyPy80wjeRyEymDXkR6gfmeQw6F18wccgLkjAqjZAbZiARU9cdF7M?=
 =?iso-8859-1?Q?wkfXrp5wW0pBIgt3u8AYkezHpooom3Nwli4kV2nDkge5prVKb6hT7cxeBC?=
 =?iso-8859-1?Q?rYRuL91aUoRl59gGJ/eXWMqS5ZhAomLW8xnxH+xu7Tt/GVtFz71sT+Aajt?=
 =?iso-8859-1?Q?BLH+bq1edJM1njVeM29/kqZPf8jd7iHiBiefugHE2RnZtHByA9IpXWjT4y?=
 =?iso-8859-1?Q?PbMfaxT6/qcOWYPhrUFgDc4yCSLyC/zoQvy7jFZdx0AIqZ0fbmJ/tYdTZL?=
 =?iso-8859-1?Q?YmsZ7GkDcFnEinlOfn/6/kc+OTdRUjURQqWHcH3mf1BIq4DJnqr/YfJxBV?=
 =?iso-8859-1?Q?hO2vy+IPg/TFlZosc+I59MgRosUIYvXxMk81e235vOSk4f8V0o836NJOuU?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UTmztZXeXzQJa1HZ7gZSLCql9Dn6P1lKrwVpqFUdi/q0jgIdbQAEGjy+1C?=
 =?iso-8859-1?Q?GAQfyhEHoU8VcS0ma8IWfRkfhn5vL7WfvSrL13Z/imcklP4K9hAOLR5gDZ?=
 =?iso-8859-1?Q?5RXWoKpSzakhBMW+ccC0dvBCOjMyoK/lVxnPCoK4v21awjNl6iTqR3b5g8?=
 =?iso-8859-1?Q?d16FZxll4i/eJyKBah0gpXa+FpDjC25w0TjCHEb/1y65FzssjxbfHOOLdT?=
 =?iso-8859-1?Q?+aHGBU+JXkYqrVDLNntz4wLvDgAr2wxo3AH1gxVtes3Y9pX35x+9vPcUNM?=
 =?iso-8859-1?Q?3XfTZEnhhmzoPk8Ep4zDZk/vy2YPL2tgGKq89o5Uxt98i0DAgy6ICEmwj3?=
 =?iso-8859-1?Q?wPWyrmN4tU8ZpV5x+7MCPkkDBmSOc7MsNsJB8eFLCHvfP1cDIHwCOpHoLA?=
 =?iso-8859-1?Q?K+T9YaorHDHU0/KrnKQvIMnFI3IXPpPcjW86KOV60QasJKWq2yxbkPo2PO?=
 =?iso-8859-1?Q?ngWh9uAxwhSxIYc9a+eiffW9eWbE3oOikFScNoDZDzELYE4zc7UUESnL0m?=
 =?iso-8859-1?Q?mGIFD53XNvfbso4EymUZedWXVEpCB72h1nASy82Op99Ly26iHf0n4bNYtW?=
 =?iso-8859-1?Q?QLDT/2vOFGXT8r69L3rs8hL2euyD7GedzebbeP9oGVKSqnrcK58uBreGkP?=
 =?iso-8859-1?Q?EVXWzGJisZKijuCxJWaPASOcEEJIpCNHE0e3izDjQNFYKingBw8Nfzz2xK?=
 =?iso-8859-1?Q?C2r+FDdjsIn+IGQzRrW//4HV7FhSsYFs/msZKfXV4sBkEIM/C7uHEWt3XC?=
 =?iso-8859-1?Q?bm6oPlkQxLWhruSESLAUIWbybyweo5lzlUD45x7Mt/xJlumydk1Y3yQEYS?=
 =?iso-8859-1?Q?Zt/ctSgXotBVZqrd067CBY3KTS+8Iqkz2nT2o2cLPdeNVGGH09AzQ65pHm?=
 =?iso-8859-1?Q?gHK6oMbBQlUNfOCkABX9gOyl38xVWeA/iVH57MbJ7VAKXjp7ybNLsnpGes?=
 =?iso-8859-1?Q?FxUl99nINl04Aj7Pc0rwsSWi2SgAGExw5dNYM8lI1Q/FoDz0Kt7HXpEGIZ?=
 =?iso-8859-1?Q?oog8pbk1IRalISpSzDuFbflvnTP0zhxsJJ7IIB0lH7/APbUPgQ+ufs9IlE?=
 =?iso-8859-1?Q?8reYSgXCSKfeWZBF16UJYBfxg/igFjn+JkvzJijun/F9gKMLgMr+C1z9zn?=
 =?iso-8859-1?Q?rMRxDFYB0QCdwFxmqz5byTAF6C151BuMtKj+xajFYyAxsWEMvkX7aU7pe/?=
 =?iso-8859-1?Q?tnrK62e0at7inyvqG302RQnRSzpYmtiiGfAXlF0rUHf0TbHRXT/XnRTQnC?=
 =?iso-8859-1?Q?O5B+7Z0h2ffyqlyMIAirIVjX7mxByyAkjKQW9I/MQ7otvCQuDOeVLQWOYg?=
 =?iso-8859-1?Q?ebDgSKFHKfpwdN9ZZlvzChjSHRedguDjhdX9hRiNmWAsACM+H2GgoMbEEi?=
 =?iso-8859-1?Q?ILKCENW6AWjtk+XkG7r1bq+IfUqB5W666+3qlvwzsjcinXVv11IHC0EiEI?=
 =?iso-8859-1?Q?z+LesASb3KxDVbVlwa00jPWukO7nv9tciJ/0BycKpebBX0eHzPzlpUpqLo?=
 =?iso-8859-1?Q?tVSn6dHAaohUsvkPEMiDe64Fk3SHbT0RsduLnyT9gOfOR4KQ08aYuFtMSz?=
 =?iso-8859-1?Q?Z6q5S7klmo6uJ3vQF6BUfQsHYNK9LL0i5clpxTYHGoXVFg3fABj8V7YiAu?=
 =?iso-8859-1?Q?mrTUhj0Fnj3OlJoU2wGttgkb3NFPtiW+iT36guvYRuqWDZiCTQw6tAfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4da2e52-c009-44ae-ea0b-08dda9152066
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 18:23:56.1523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHHpJGEAwKt90iFEDgoS697AoZzThQHqtbnB4xG8Jw6gjeEWMHP3gKuKXwgivkuAQY8DXAo8eFYcQhlPZDrGDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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

On Wed, Jun 11, 2025 at 11:56:25AM -0600, Summers, Stuart wrote:
> On Mon, 2025-06-09 at 09:46 +0530, Himal Prasad Ghimiray wrote:
> > Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a TLB
> > invalidation for a specified address range across GTs indicated by a
> > tilemask.
> > 
> > v2 (Matthew Brost)
> > - Move WARN_ON_ONCE to svm caller
> > - Remove xe_gt_tlb_invalidation_vma
> > - s/XE_WARN_ON/WARN_ON_ONCE
> > 
> > v3
> > - Rebase
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  24 -----
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 -
> >  drivers/gpu/drm/xe/xe_svm.c                 |  43 +-------
> >  drivers/gpu/drm/xe/xe_vm.c                  | 103 +++++++++++++-----
> > --
> >  drivers/gpu/drm/xe/xe_vm.h                  |   3 +
> >  5 files changed, 75 insertions(+), 101 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 084cbdeba8ea..0111ee59b81d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -440,30 +440,6 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt,
> > struct xe_vm *vm)
> >         xe_gt_tlb_invalidation_fence_wait(&fence);
> >  }
> >  
> > -/**
> > - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT
> > for a VMA
> > - * @gt: GT structure
> > - * @fence: invalidation fence which will be signal on TLB
> > invalidation
> > - * completion, can be NULL
> > - * @vma: VMA to invalidate
> > - *
> > - * Issue a range based TLB invalidation if supported, if not
> > fallback to a full
> > - * TLB invalidation. Completion of TLB is asynchronous and caller
> > can use
> > - * the invalidation fence to wait for completion.
> > - *
> > - * Return: Negative error code on error, 0 on success
> > - */
> > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > -                              struct xe_gt_tlb_invalidation_fence
> > *fence,
> > -                              struct xe_vma *vma)
> > -{
> > -       xe_gt_assert(gt, vma);
> > -
> > -       return xe_gt_tlb_invalidation_range(gt, fence,
> > xe_vma_start(vma),
> > -                                           xe_vma_end(vma),
> > -                                           xe_vma_vm(vma)-
> > >usm.asid);
> > -}
> > -
> >  /**
> >   * xe_guc_tlb_invalidation_done_handler - TLB invalidation done
> > handler
> >   * @guc: guc
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index abe9b03d543e..31072dbcad8e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -19,9 +19,6 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt
> > *gt);
> >  
> >  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> >  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > -                              struct xe_gt_tlb_invalidation_fence
> > *fence,
> > -                              struct xe_vma *vma);
> >  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> >  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >                                  struct xe_gt_tlb_invalidation_fence
> > *fence,
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 83c63fd7b481..3fd2d63c73a2 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  {
> >         struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> >         struct xe_device *xe = vm->xe;
> > -       struct xe_tile *tile;
> >         struct drm_gpusvm_range *r, *first;
> > -       struct xe_gt_tlb_invalidation_fence
> > -               fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> >         u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> >         u8 tile_mask = 0;
> > -       u8 id;
> > -       u32 fence_id = 0;
> >         long err;
> >  
> >         xe_svm_assert_in_notifier(vm);
> > @@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  
> >         xe_device_wmb(xe);
> >  
> > -       for_each_tile(tile, xe, id) {
> > -               if (tile_mask & BIT(id)) {
> > -                       int err;
> > -
> > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > >primary_gt,
> > -                                                        
> > &fence[fence_id], true);
> > -
> > -                       err = xe_gt_tlb_invalidation_range(tile-
> > >primary_gt,
> > -                                                         
> > &fence[fence_id],
> > -                                                          adj_start,
> > -                                                          adj_end,
> > -                                                          vm-
> > >usm.asid);
> > -                       if (WARN_ON_ONCE(err < 0))
> > -                               goto wait;
> > -                       ++fence_id;
> > -
> > -                       if (!tile->media_gt)
> > -                               continue;
> > -
> > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt,
> > -                                                        
> > &fence[fence_id], true);
> > -
> > -                       err = xe_gt_tlb_invalidation_range(tile-
> > >media_gt,
> > -                                                         
> > &fence[fence_id],
> > -                                                          adj_start,
> > -                                                          adj_end,
> > -                                                          vm-
> > >usm.asid);
> > -                       if (WARN_ON_ONCE(err < 0))
> > -                               goto wait;
> > -                       ++fence_id;
> > -               }
> > -       }
> > -
> > -wait:
> > -       for (id = 0; id < fence_id; ++id)
> > -               xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > +       err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start,
> > adj_end, tile_mask);
> > +       WARN_ON_ONCE(err);
> >  
> >  range_notifier_event_end:
> >         r = first;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 18f967ce1f1a..a0c70698265a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3842,6 +3842,68 @@ void xe_vm_unlock(struct xe_vm *vm)
> >         dma_resv_unlock(xe_vm_resv(vm));
> >  }
> >  
> > +/**
> > + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation
> > on this tilemask for an
> > + * address range
> > + * @vm: The VM
> > + * @start: start address
> > + * @end: end address
> > + * @tile_mask: mask for which gt's issue tlb invalidation
> > + *
> > + * Issue a range based TLB invalidation for gt's in tilemask
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64
> > start,
> > +                                         u64 end, u8 tile_mask)
> > +{
> > +       struct xe_gt_tlb_invalidation_fence
> > fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > +       struct xe_tile *tile;
> > +       u32 fence_id = 0;
> > +       u8 id;
> > +       int err;
> > +
> > +       if (!tile_mask)
> > +               return 0;
> > +
> > +       for_each_tile(tile, vm->xe, id) {
> > +               if (tile_mask & BIT(id)) {
> > +                       xe_gt_tlb_invalidation_fence_init(tile-
> > >primary_gt,
> > +                                                        
> > &fence[fence_id], true);
> > +
> > +                       err = xe_gt_tlb_invalidation_range(tile-
> > >primary_gt,
> > +                                                         
> > &fence[fence_id],
> > +                                                          start,
> > +                                                          end,
> > +                                                          vm-
> > >usm.asid);
> 
> Since we're already doing the refactoring of the svm and non-svm cases
> here, can you also refactor this so we have something like:
> invalidate_tiles(tile_mask)
> 
> void invalidate_tiles(tile_mask)
> {
>     for_each_tile(tile, tile_mask)
>         invalidate_tile(tile)
> }
> 
> void invalidate_tile(tile)
> {
>     fence[i] = invalidate_gt(primary)
>     fence[i++] = invalidate_gt(media)
> 
>     for_each_i(i)
>         wait_for_invalidation(i)

You'd lose a level pipeline with this suggestion. The can write is quite
intentional - issue all TLB invalidations to hardware, then wait on all
invalidtaions. What you suggest would issue TLB invalidations to each
tile and wait invalidations from that tile - if you have multiple tiles
you delay issuing the invalidations until the prior tile completes its
invalidations. This could be cleaned up with helpers but regardless we
want the pipeling in place.

Matt 

> }
> 
> invalidate_gt(gt_type)
> {
>     invalidation_fence_init(gt_type)
>     fence = invalidation_fence_range(gt_type)
> 
>     return fence
> }
> 
> Thanks,
> Stuart
> 
> > +                       if (err)
> > +                               goto wait;
> > +                       ++fence_id;
> > +
> > +                       if (!tile->media_gt)
> > +                               continue;
> > +
> > +                       xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt,
> > +                                                        
> > &fence[fence_id], true);
> > +
> > +                       err = xe_gt_tlb_invalidation_range(tile-
> > >media_gt,
> > +                                                         
> > &fence[fence_id],
> > +                                                          start,
> > +                                                          end,
> > +                                                          vm-
> > >usm.asid);
> > +                       if (err)
> > +                               goto wait;
> > +                       ++fence_id;
> > +               }
> > +       }
> > +
> > +wait:
> > +       for (id = 0; id < fence_id; ++id)
> > +               xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > +
> > +       return err;
> > +}
> > +
> >  /**
> >   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a
> > lock
> >   * @vma: VMA to invalidate
> > @@ -3857,11 +3919,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >         struct xe_device *xe = xe_vma_vm(vma)->xe;
> >         struct xe_vm *vm = xe_vma_vm(vma);
> >         struct xe_tile *tile;
> > -       struct xe_gt_tlb_invalidation_fence
> > -               fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > -       u8 id;
> > -       u32 fence_id = 0;
> > +       u8 tile_mask = 0;
> >         int ret = 0;
> > +       u8 id;
> >  
> >         xe_assert(xe, !xe_vma_is_null(vma));
> >         xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> > @@ -3892,37 +3952,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >                 }
> >         }
> >  
> > -       for_each_tile(tile, xe, id) {
> > -               if (xe_pt_zap_ptes(tile, vma)) {
> > -                       xe_device_wmb(xe);
> > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > >primary_gt,
> > -                                                        
> > &fence[fence_id],
> > -                                                         true);
> > -
> > -                       ret = xe_gt_tlb_invalidation_vma(tile-
> > >primary_gt,
> > -                                                       
> > &fence[fence_id], vma);
> > -                       if (ret)
> > -                               goto wait;
> > -                       ++fence_id;
> > -
> > -                       if (!tile->media_gt)
> > -                               continue;
> > -
> > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt,
> > -                                                        
> > &fence[fence_id],
> > -                                                         true);
> > +       for_each_tile(tile, xe, id)
> > +               if (xe_pt_zap_ptes(tile, vma))
> > +                       tile_mask |= BIT(id);
> >  
> > -                       ret = xe_gt_tlb_invalidation_vma(tile-
> > >media_gt,
> > -                                                       
> > &fence[fence_id], vma);
> > -                       if (ret)
> > -                               goto wait;
> > -                       ++fence_id;
> > -               }
> > -       }
> > +       xe_device_wmb(xe);
> >  
> > -wait:
> > -       for (id = 0; id < fence_id; ++id)
> > -               xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > +       ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma),
> > xe_vma_start(vma),
> > +                                                   xe_vma_end(vma),
> > tile_mask);
> >  
> >         /* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> >         WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 88d6c0ef89c7..acd3fd6c605b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -228,6 +228,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm
> > *vm,
> >  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> >                                      struct xe_svm_range *range);
> >  
> > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64
> > start,
> > +                                         u64 end, u8 tile_mask);
> > +
> >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> >  
> >  int xe_vm_validate_protected(struct xe_vm *vm);
> 
