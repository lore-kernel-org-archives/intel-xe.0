Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD888CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D94410E83A;
	Wed, 29 Oct 2025 20:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3esMbeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13110E159
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761769802; x=1793305802;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SJtYEJHej9zmGh3XzeRIXAvFUf/O/dzaChayRkhCfRo=;
 b=R3esMbeDZwDg5REJYDtLzcw1plYBZnGTSTl5d75OhFC9f8ZxAfeyvXLL
 jhkh4pNP9T/njxnY++3f8RUcvMzv3pSL6S9k8LQkMxLQ7vtvRrfWbwhAu
 TB0I5zt/Y3PrccGPqmm8urDIsgyTb4QOjWH3dwOI1EOxfAqfpFRRrvOnE
 zLtRmpfKllcLeEGSwWNMouPFOMCleRfNt0eH6tD43/HoUE8mttB1XICtj
 ELsHEOUaEDDkxnQXZzS9REd7BpnsXWUkQUMcOHOi0dG5hKzXEtFz8SWGI
 hsxRMup9+Xe0QU5d1VRxCbPNL+XbGSci/4uobkjvNy7ITc4lFzrxj5u6h A==;
X-CSE-ConnectionGUID: tcqva295Q4qIMnpBiNMYcw==
X-CSE-MsgGUID: WSAhhOtURUS9kue0oOkg7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74502910"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="74502910"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:30:01 -0700
X-CSE-ConnectionGUID: 77OaeEkbTx2buoKuZVGqCw==
X-CSE-MsgGUID: YkZK5K8lTqqK00ojHPzmmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185847632"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:30:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:30:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:30:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZH8rzvKUdVQq1yWr/sPQ81bzuS1oquAFUp23RYdDVtdSR9VCdZqDzhztlHe56cL35busEQMC49BcFAPdeTIBICqQ5D2+/y/GyibfO6N0LgCZKoc4/h1NbrI4PYHg2Ck6diZ8/xLIfQE5RQOIOwKmDkkw3l5OuoVjba++TN6Nmfhh+htpBxfyadCzzu/4RMSq3RDxmuEjZLHGLYIsjGVp4qUH7kgWGib8HCFba1lWPt6mfkyCD3/2k9SDrnR9o9JUR+JKA1YTxZSfl16wJeloZq1vfgc/X25DaazkNF9MY3c8Sq5vdXG4uWOYHqVYE3zCdEuMXBC+op4MHaTkpzhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJRvm9lWYnWT0nLuICx6YVtmTourhEVzLrxZ/t5Rf+Q=;
 b=skkFUTsVcoMQRaL6Y5sYg4rN358I4r8wBh9vZy/zRO/R6DaYjaBUGdiGhCEOltZceoNle+u2oN8gUUrQv4JypCS89hzIprhOMsqNS2NjiOfagceMYtDSB2vD70WM+sHlz5smNoa30ScP0XFQx52fsKj/AtL5CWQ8GGJjDn/3AN0oWyg7KgSPhrX9qpS5XesBdVulPadu927AbWGFYFy/UeIVEKINKnfMDEl6DkxaotRvbycdtEY09tcB7hk+4j32pFWkexx3XvpuGbbkDsBPdFR9Ht6ZLBCa1dl5RAJCS8LtLodjJo7jikHBkCBvIzox6tiCKAGl/+mwc4SdughC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 29 Oct
 2025 20:29:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 20:29:57 +0000
Date: Wed, 29 Oct 2025 13:29:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe: Add last fence attachment to TLB
 invalidation job queues
Message-ID: <aQJ5Qyb5HgaNc73L@lstrano-desk.jf.intel.com>
References: <20251027182737.2358096-1-matthew.brost@intel.com>
 <20251027182737.2358096-2-matthew.brost@intel.com>
 <0b0d40416b038f251c7b9437f4c4c7bc224f85a4.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b0d40416b038f251c7b9437f4c4c7bc224f85a4.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: 16de8d3d-85bf-40ce-61f2-08de1729ed09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?O8rC8HIBjCt7+vSLaMZli5TpGw7vw558ZZ66jFpkzj1qkJTDG7F1OCvn4m?=
 =?iso-8859-1?Q?hLrBSIgUX68mKpdLTvbP7Ii/b9Fv0QHdKGo+nqr0bjFddjFV6oH0TkbB6o?=
 =?iso-8859-1?Q?crmFvxffxcpLicl7XOogCYQXCh27ZhANKNoUrvgYpR2hawkvp+HH1+20YA?=
 =?iso-8859-1?Q?I8MI/IVb5UMoeTOtSRuZaLSyKiUMPehvoOod7wcX0h0nTLWDx6PXG5xgS/?=
 =?iso-8859-1?Q?AVTDnWARq5gzWta2O3/3JtTKRWihrtczVodc3wPgvd4FYDDFfMAl+KelU3?=
 =?iso-8859-1?Q?HXG04tEiTHDRNIslLy0F+UHHIQ38UUNC3w6axB2M9W0akZT2DajaY7u9BN?=
 =?iso-8859-1?Q?fN+IeerHudqsNJUlZnxXZ82rr9VHvHUV7BuRb5TrfCOEkT/Ek30GJumohi?=
 =?iso-8859-1?Q?IpzmOh/eBCSpcktiKkfoYZqtIOCuak2C4V5+rH2JlzRBvLzJvstk6BZSFg?=
 =?iso-8859-1?Q?QlNfd9QZUBIjgZ6PN69Jzgq0skJjlsnlObsbBwPbsJkocy+RUJhlif6AQ5?=
 =?iso-8859-1?Q?uBziHjuqLtpO1Uc+3+o1gFEyb5ZnLfLMOvYJqRaJoGbAgthiy6It6c1sdQ?=
 =?iso-8859-1?Q?FpyUZtnm3LY0CJHvf3dXQyyWw2m4YxpNDKMVGWHr19WiEVpl3ssh1eLKig?=
 =?iso-8859-1?Q?AYoFfMcf2gz/6Xf2wAfcHgG6Z/bSwt/9lhGFBsUopmtJi/ie1A8ur4giZH?=
 =?iso-8859-1?Q?v2zB6l9o4OFhRs84faJdZ+dNNskInLfvjFVAt+mXNKr60OtFIO8dFywPDF?=
 =?iso-8859-1?Q?cYCTLSoS6SycgofZtb9yYqp9vDG3EXvE0TxXE4OGGXQQ6Rx3A8RM9O3hsV?=
 =?iso-8859-1?Q?DtRN08FVDQmJhva1d2APAZHXKOsEb6yBO/ck8bAxoo+OypgHa4p98YWno9?=
 =?iso-8859-1?Q?HMECAEugnau5+3d7xExneHpGl7gtrNZdn462ycusAimuH1eBz4qYifDiaw?=
 =?iso-8859-1?Q?x1SCji9N8rZ+BBxmpaB/KsoWXHf7oN+6P/p7UmitBhbxOUS/k58cTr5AKq?=
 =?iso-8859-1?Q?tk2aUSzVSy2T4iA4dqO44V0yVtQy0K76BvFLpjQDcMtSo29SoW1xQRZ4L1?=
 =?iso-8859-1?Q?TrVmivIWJ26gBpfnzuEWhdfceELkTZcYlVLAPreygdhlgxgJl55r42peb7?=
 =?iso-8859-1?Q?1FaGn+hdTkDilnG24FuIn4F+V+laRxbLtUBprtMQ4ZFXNb3OjqC7xW2clq?=
 =?iso-8859-1?Q?D+w6X9e6MMSgQXjfX5Y2FrDNZps3YYFMMOtX24OtOLRIRtCgN/mf61r3+p?=
 =?iso-8859-1?Q?0NvyR4LUaBeXyFllmNzGorbB8p75jF2d+lLA+joz/6owgzKeR5NsQ6t+9s?=
 =?iso-8859-1?Q?djisIEfGKy4RIeZO23CpSIIgb0jPKEeFp9e1wHstgByw4m4eBZOKg5/p/8?=
 =?iso-8859-1?Q?bftWgMB94jwfxVBuV8nczqnGoDtx26+S8IcA866K9wXaK/cpLphNISqArs?=
 =?iso-8859-1?Q?1j3Z++xLJx/EZOhP5049+SvM5360/Ypxc2AYxUgWAUhMhSUgNDoaKnhgb7?=
 =?iso-8859-1?Q?42vrf7xjfYZ89WuzVhE0uL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?h6vsddjK34LMdIGnMXjtZ8+eMXtvh741Ra2wN9Km3F+mIsUu1spgm/D4nk?=
 =?iso-8859-1?Q?RLb/3Ac31UduuxpjIFFladpwzj9hJY35Wa1Fn/gTd8eOOpwjwIBNYw263J?=
 =?iso-8859-1?Q?dTv6doIc9Dx/csYjsHoHAdLJtWwSS2TsHw0vtE9WHaY154HMLHS44NpHWg?=
 =?iso-8859-1?Q?B5QGvGkM25/ILo30yZyStdmX7fghDKTy2FDPMF8+Tnux25dti0SH0PKGGw?=
 =?iso-8859-1?Q?EOSvFq7QH9cCBXnQiw63go4M6hPDIYoh0s32AskYIBBeYdqb7Ja48TPFrA?=
 =?iso-8859-1?Q?VbrkrpMi/BjFnKCL254vvDgYr2plwHk0o5QZIFXJYfpwFEFRHVnpPIUuND?=
 =?iso-8859-1?Q?Gs4N3gy3KxWAA+VtU3js3SofvWYB4Q7tjAm0Nj01rPjR2gnJxketzw9QBO?=
 =?iso-8859-1?Q?RlWQ9ICfQIfqo2O7p+rTq5LQt4FkeaS4wXtlZCpWKs6aQpe3TUtceTyaei?=
 =?iso-8859-1?Q?bCBJcVftZgwvdRJlEh3kfR9lim08Q892RcgTEMoCaIU+JHxrQPsrbOfhaL?=
 =?iso-8859-1?Q?CoyTlE+yjOo5iQJcyDd6sWgwqkixEjsmBIdrnn0DnqpFhRsa0tW23VVc2O?=
 =?iso-8859-1?Q?qg2FRvCkJhtxuxXJxPjyQnDZ6FwkdtCmovS9LjAfBIiABPIhJXUeCgwZ2u?=
 =?iso-8859-1?Q?a2kCl0uO3lOYM37kLFqxaFiX9fXD5s8zUjos88bDtqtlf0/P2d9WPCNShG?=
 =?iso-8859-1?Q?b/84oXghLa/3GqbRiuXxTedFCJPjtQDIBa3hCoODLiMPHaptjZxRXjI7HE?=
 =?iso-8859-1?Q?oMd9gIpmTmVDzFT9ckXSbAbuWFUCzGafcP4fAS8nOyRiwXZ/LmAVZlyXn4?=
 =?iso-8859-1?Q?nLcXnvK6IvER5mS5WRA4nrXpjClXQmy6Ka9pS7lOb5mVQsDmwqVYiZ8o4d?=
 =?iso-8859-1?Q?NWheDZVc1C9r/3IT2Zvcio9Mf4YFf87q0KXEazjCNqWokrDfR0NRA1HkWn?=
 =?iso-8859-1?Q?xQg2sGWA+h8LHM0nvML+eRomZKJPBSBO4GT8v/yLcUgB3cqDzT1k4eOCEo?=
 =?iso-8859-1?Q?p494+gL1iDKlbZndqjIu1+PGXYdtrrKmtyOzpsMPsYNQrCYAP3qbOo8RXY?=
 =?iso-8859-1?Q?yeYfTi85lSIJAEWM33EObKuiqA1jKG1hfeX1c5o1cYXOgHL7a76XSZqQfu?=
 =?iso-8859-1?Q?iunY8G3sR7vNl9qoi+8rWBA6tc5c3bGcKxgVxNqeM/HmSyA5I3ookS5WFS?=
 =?iso-8859-1?Q?x+nNGmlPgQvrGhHBgD0BcYutAcznfH9xhVKzr0akjmsgY1Q+WHduWc1ws7?=
 =?iso-8859-1?Q?GGGdr4XUzGbIaawv46d41ZpjVg+OkqITcrw5MW9Nr06DgvnN4TcNdQoPGU?=
 =?iso-8859-1?Q?oXeQDwhWvG2tykybYCJgpnX4I9EfOtUDvJPNLpr9yQdZlTJHAOcXz+xLWA?=
 =?iso-8859-1?Q?h5cPumWT1/79Z6paP4qHmx1uidP48NAd7eBIYhoYlGCO8HHJrFQYChe7k7?=
 =?iso-8859-1?Q?6avsmr69zYqSLTP2IYbJsIY8DK4Jj56fRoJ8cY8fkr6JYIEuQt/ZR5fdHj?=
 =?iso-8859-1?Q?LhARoygnrouCyI6xdSPkG0x9M3ETXQLDfMR+tXeDhRGInKDFUFAEB0Ebmo?=
 =?iso-8859-1?Q?m/hdQo8VpsX24iEgbd8jtWF5MvAnW77nN0ePV18lMh5p1HzA1CHqWz8mtu?=
 =?iso-8859-1?Q?m+B7VRpsLK/9vHgru+cUYFPXGODtoqVgxhN6pLfoHzHc270zrkeEO3xw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16de8d3d-85bf-40ce-61f2-08de1729ed09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:29:57.3255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSuMDkKR/LG3PQnMVIpUKhRTtCpwdQU5wPfgU9VKMNirjD7HWcjynfUhWMN3FAfPpkJWyj5Bxqy/2NZa28dwgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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

On Wed, Oct 29, 2025 at 11:48:29AM -0600, Summers, Stuart wrote:
> On Mon, 2025-10-27 at 11:27 -0700, Matthew Brost wrote:
> > To address serialization issues with bursts of unbind jobs, this
> > patch
> > adds support for attaching the last fence to TLB invalidation job
> > queues. The idea is that user fence signaling for a bind job reflects
> > both the bind job itself and the last fences of all related TLB
> > invalidations. The submission order of bind jobs and TLB
> > invalidations
> > depends solely on the state of their respective queues.
> > 
> > This patch only introduces support functions for last fence
> > attachment
> > to TLB invalidation queues.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > v3:
> >  - Fix assert in xe_exec_queue_tlb_inval_last_fence_set (CI)
> >  - Ensure migrate lock held for migrate queues (Testing)
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 105
> > ++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_exec_queue.h       |  18 ++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
> >  drivers/gpu/drm/xe/xe_migrate.c          |  14 +++
> >  drivers/gpu/drm/xe/xe_migrate.h          |   8 ++
> >  drivers/gpu/drm/xe/xe_vm.c               |   7 +-
> >  6 files changed, 155 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 90cbc95f8e2e..d7d00d4de93c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -376,11 +376,15 @@ void xe_exec_queue_destroy(struct kref *ref)
> >  {
> >         struct xe_exec_queue *q = container_of(ref, struct
> > xe_exec_queue, refcount);
> >         struct xe_exec_queue *eq, *next;
> > +       int i;
> >  
> >         if (xe_exec_queue_uses_pxp(q))
> >                 xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> >  
> >         xe_exec_queue_last_fence_put_unlocked(q);
> > +       for_each_tlb_inval(i)
> > +               xe_exec_queue_tlb_inval_last_fence_put_unlocked(q,
> > i);
> > +
> >         if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
> >                 list_for_each_entry_safe(eq, next, &q->multi_gt_list,
> >                                          multi_gt_link)
> > @@ -998,7 +1002,9 @@ int xe_exec_queue_destroy_ioctl(struct
> > drm_device *dev, void *data,
> >  static void xe_exec_queue_last_fence_lockdep_assert(struct
> > xe_exec_queue *q,
> >                                                     struct xe_vm *vm)
> >  {
> > -       if (q->flags & EXEC_QUEUE_FLAG_VM) {
> > +       if (q->flags & EXEC_QUEUE_FLAG_MIGRATE) {
> > +               xe_migrate_job_lock_assert(q);
> > +       } else if (q->flags & EXEC_QUEUE_FLAG_VM) {
> >                 lockdep_assert_held(&vm->lock);
> >         } else {
> >                 xe_vm_assert_held(vm);
> > @@ -1097,6 +1103,7 @@ void xe_exec_queue_last_fence_set(struct
> > xe_exec_queue *q, struct xe_vm *vm,
> >                                   struct dma_fence *fence)
> >  {
> >         xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +       xe_assert(vm->xe, !dma_fence_is_container(fence));
> >  
> >         xe_exec_queue_last_fence_put(q, vm);
> >         q->last_fence = dma_fence_get(fence);
> > @@ -1125,6 +1132,102 @@ int xe_exec_queue_last_fence_test_dep(struct
> > xe_exec_queue *q, struct xe_vm *vm)
> >         return err;
> >  }
> >  
> > +/**
> > + * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB
> > invalidation fence
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind for
> > + * @type: Either primary or media GT
> > + */
> > +void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
> > +                                           struct xe_vm *vm,
> > +                                           unsigned int type)
> > +{
> > +       xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +       xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
> > +                 type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> 
> Do we really need these GT asserts through here?
> 

I tend to be overzelous with asserts to catch any possible bugs, also
asserts by nature are self documenting. So yes, I'd like to have these
included.

Matt 

> Thanks,
> Stuart
> 
> > +
> > +       xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, type);
> > +}
> > +
> > +/**
> > + * xe_exec_queue_tlb_inval_last_fence_put_unlocked() - Drop ref to
> > last TLB
> > + * invalidation fence unlocked
> > + * @q: The exec queue
> > + * @type: Either primary or media GT
> > + *
> > + * Only safe to be called from xe_exec_queue_destroy().
> > + */
> > +void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> > xe_exec_queue *q,
> > +                                                    unsigned int
> > type)
> > +{
> > +       xe_assert(q->vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> > ||
> > +                 type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> > +
> > +       if (q->tlb_inval[type].last_fence) {
> > +               dma_fence_put(q->tlb_inval[type].last_fence);
> > +               q->tlb_inval[type].last_fence = NULL;
> > +       }
> > +}
> > +
> > +/**
> > + * xe_exec_queue_tlb_inval_last_fence_get() - Get last fence for TLB
> > invalidation
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind for
> > + * @type: Either primary or media GT
> > + *
> > + * Get last fence, takes a ref
> > + *
> > + * Returns: last fence if not signaled, dma fence stub if signaled
> > + */
> > +struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> > xe_exec_queue *q,
> > +                                                        struct xe_vm
> > *vm,
> > +                                                        unsigned int
> > type)
> > +{
> > +       struct dma_fence *fence;
> > +
> > +       xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +       xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
> > +                 type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> > +       xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
> > +                                     EXEC_QUEUE_FLAG_MIGRATE));
> > +
> > +       if (q->tlb_inval[type].last_fence &&
> > +           test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > +                    &q->tlb_inval[type].last_fence->flags))
> > +               xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
> > +
> > +       fence = q->tlb_inval[type].last_fence ?:
> > dma_fence_get_stub();
> > +       dma_fence_get(fence);
> > +       return fence;
> > +}
> > +
> > +/**
> > + * xe_exec_queue_tlb_inval_last_fence_set() - Set last fence for TLB
> > invalidation
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind for
> > + * @fence: The fence
> > + * @type: Either primary or media GT
> > + *
> > + * Set the last fence for the tlb invalidation type on the queue.
> > Increases
> > + * reference count for fence, when closing queue
> > + * xe_exec_queue_tlb_inval_last_fence_put should be called.
> > + */
> > +void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
> > +                                           struct xe_vm *vm,
> > +                                           struct dma_fence *fence,
> > +                                           unsigned int type)
> > +{
> > +       xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +       xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
> > +                 type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> > +       xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
> > +                                     EXEC_QUEUE_FLAG_MIGRATE));
> > +       xe_assert(vm->xe, !dma_fence_is_container(fence));
> > +
> > +       xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
> > +       q->tlb_inval[type].last_fence = dma_fence_get(fence);
> > +}
> > +
> >  /**
> >   * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
> >   * within all LRCs of a queue.
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> > b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index a4dfbe858bda..c4b95fad93f1 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -14,6 +14,10 @@ struct drm_file;
> >  struct xe_device;
> >  struct xe_file;
> >  
> > +#define for_each_tlb_inval(__i)        \
> > +       for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
> > +            __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)
> > +
> >  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe,
> > struct xe_vm *vm,
> >                                            u32 logical_mask, u16
> > width,
> >                                            struct xe_hw_engine
> > *hw_engine, u32 flags,
> > @@ -86,6 +90,20 @@ void xe_exec_queue_last_fence_set(struct
> > xe_exec_queue *e, struct xe_vm *vm,
> >                                   struct dma_fence *fence);
> >  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> >                                       struct xe_vm *vm);
> > +
> > +void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
> > +                                           struct xe_vm *vm,
> > +                                           unsigned int type);
> > +void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> > xe_exec_queue *q,
> > +                                                    unsigned int
> > type);
> > +struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> > xe_exec_queue *q,
> > +                                                        struct xe_vm
> > *vm,
> > +                                                        unsigned int
> > type);
> > +void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
> > +                                           struct xe_vm *vm,
> > +                                           struct dma_fence *fence,
> > +                                           unsigned int type);
> > +
> >  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> >  
> >  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void
> > *scratch);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 282505fa1377..b4185fee54e1 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -145,6 +145,11 @@ struct xe_exec_queue {
> >                  * dependency scheduler
> >                  */
> >                 struct xe_dep_scheduler *dep_scheduler;
> > +               /**
> > +                * @last_fence: last fence for tlb invalidation,
> > protected by
> > +                * vm->lock in write mode
> > +                */
> > +               struct dma_fence *last_fence;
> >         } tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> >  
> >         /** @pxp: PXP info tracking */
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 921c9c1ea41f..4567bc88a8ec 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -2333,6 +2333,20 @@ void xe_migrate_job_unlock(struct xe_migrate
> > *m, struct xe_exec_queue *q)
> >                 xe_vm_assert_held(q->vm);       /* User queues VM's
> > should be locked */
> >  }
> >  
> > +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> > +/**
> > + * xe_migrate_job_lock_assert() - Assert migrate job lock held of
> > queue
> > + * @q: Migrate queue
> > + */
> > +void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
> > +{
> > +       struct xe_migrate *m = gt_to_tile(q->gt)->migrate;
> > +
> > +       xe_gt_assert(q->gt, q == m->q);
> > +       lockdep_assert_held(&m->job_mutex);
> > +}
> > +#endif
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >  #include "tests/xe_migrate.c"
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index 4fad324b6253..9b5791617f5e 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -152,6 +152,14 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >  
> >  void xe_migrate_wait(struct xe_migrate *m);
> >  
> > +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> > +void xe_migrate_job_lock_assert(struct xe_exec_queue *q);
> > +#else
> > +static inline void xe_migrate_job_lock_assert(struct xe_exec_queue
> > *q)
> > +{
> > +}
> > +#endif
> > +
> >  void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue
> > *q);
> >  void xe_migrate_job_unlock(struct xe_migrate *m, struct
> > xe_exec_queue *q);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 10d77666a425..d2a2f823f1b3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1731,8 +1731,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  
> >         down_write(&vm->lock);
> >         for_each_tile(tile, xe, id) {
> > -               if (vm->q[id])
> > +               if (vm->q[id]) {
> > +                       int i;
> > +
> >                         xe_exec_queue_last_fence_put(vm->q[id], vm);
> > +                       for_each_tlb_inval(i)
> > +                               xe_exec_queue_tlb_inval_last_fence_pu
> > t(vm->q[id], vm, i);
> > +               }
> >         }
> >         up_write(&vm->lock);
> >  
> 
