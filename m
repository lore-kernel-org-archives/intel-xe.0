Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CFBC369D5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 03:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635D910E224;
	Tue, 29 Apr 2025 03:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFWI5oqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5692610E215
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 03:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745897363; x=1777433363;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C6kbmM6JBBNOKa++bG1TiPZFmDbWiVylYPSDB2mnp5Y=;
 b=GFWI5oqWm0Q2m2cqxVT7kRHEH7V6LgHQWSYJ6ZyPIOh1N5pwmvBkfdAL
 euZhOFKKGP4ZFAvQQMtbwNryHCpza+xdL2isjK4gWOAE2NmjPWJrNryum
 l59i92NB/OeSMfgDtiPYtBl3T1z9xiC9UFeMbRlVcwRMTLKXKQ2rlTtec
 HGkgjDkc9IhSWQF5gLMHLcypRZNBtFz5XoSof3W8c6rqZVykkPn6ooeTb
 zEc4KuNl1v+1FYUnQ0Q0WjVDLSIjFlzNAVmLhG309DA6seYFEA3ryf4AK
 RDOqY605EnyXj8K75azOnez1GrjX+6H4wEZEgEX+sH9v0ffnmObx0ECaZ A==;
X-CSE-ConnectionGUID: BXh9a2OoRneqK6OlbOxX7A==
X-CSE-MsgGUID: wheDLQr3SmqrcdqCVrVFQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="46746354"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="46746354"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 20:29:19 -0700
X-CSE-ConnectionGUID: Pf8qPMQtT7OnthTTKN+xbA==
X-CSE-MsgGUID: N+xwu14yTtmJEqv8VBfHFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="137736242"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 20:29:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 20:29:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 20:29:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 20:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVbYsyqBHMkCuYXSymRYBH0NQngZsAVS4zrDWasyYHctA6eDKaM9ztlBQwa3HalHCoyuu8oW3akOawOIUK37SaY9nW3o6TwguQwX4iVHwjPF8B32R20GqUoF5/0+g8FEAG1K741KqTg9hcj1LhVJVM/llRAUrVFLqj8iKTLT4C4KbjLWFFjskqs71HF/rz1id82lP3ZViPiq0OcQkkIhAUEuRaD5O7ZmBBa0vgw7OC6DLmzeR6n92l9LVx6uaurVpNNjGXHc3QI7RZnm5crKGOgXEqcteuj/oJTDj5BcLVbQ+09I7ZTjPPKowaIXnFAeS8MmGuDmVzR/Lq/UxlXalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPaJn2f1dFF1ZdUWg3hnu70zdQwYZ2wKgKIN/TvNqoc=;
 b=NEEZd317xfuWwnP836YrNCTbaXFjiyfStgiRrmj7mLHQRFEh4VWgSQZcLIuJ0z0SUA224dgOJVzR0TOtbw41h5BZEr8DDTVcmx8jT+4dw6555grFaeMOHdn5IyfrrKj8kGMqrJPrO4QxGDv/R89fUU2sFxm0EMjk1Vy7QaWDXjxDYRH2L7PAKrnckFSugxcZLiXfNyFcNm/bIipROVTyAihSKEJTMI5QDajFAsW5P7X/ZDKpxgcYAG7V45ptah+Q7DRkWOml3W6Gujo86MC/huTqm8bk+Zq9FNzqsnQ4NdO3DiqjPxztOLwh8aVPabBotqJqQx9074t3pywPlxNACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 03:28:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 03:28:43 +0000
Date: Mon, 28 Apr 2025 20:30:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: Fw: Re: [PATCH v2 3/3] drm/xe: Add WA BB to capture active
 context utilization
Message-ID: <aBBHvQJOUcIMuDGc@lstrano-desk.jf.intel.com>
References: <aBAlAnLxLXBK4dwx@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aBAlAnLxLXBK4dwx@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 42504cc9-30b8-4805-5f59-08dd86cdf193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IX9uwMDuT9xl0hz+Ny+Kj6yw8tm81QXoWR3r1FPTMzqUZXHWCBzBmFfsS7RS?=
 =?us-ascii?Q?fSRbk4yyVs6tFH/vLr9mz6hNSQyArOF0tkLt791GW+r7sncH4kz8zquT3Y71?=
 =?us-ascii?Q?uWjtuQvb1hWdhh8sXW0Yw2IWOTRrkMyjMui+/e6vEsV7JP8SPUppaov4ekBu?=
 =?us-ascii?Q?KPPE1gyLVoCFHaDbf8NVuD/WlcRALLhCiq7PqcdONILfirw3n1XRyS79wZQy?=
 =?us-ascii?Q?qHVr7id8IBO8dHdvu6gPFfkQJr3T0iWPWRAu2CWVnMcztJj4fUaTSA47sosA?=
 =?us-ascii?Q?cc6mnNOU2Ix4I2PL7Wc+sLqdUld2mLHh8vJsPadZzvNLRV0p2wiFNwkO+nxs?=
 =?us-ascii?Q?iuqfOhzn0jlk4tdMwJCpjsA/JKM1xxj6b6SBL4VGFn+vpsgRxI8b4IxZiCvY?=
 =?us-ascii?Q?onSlwQ7P8bb6jaC1/kokPB7u2O+6A4iFyil1g3jQXV4z0HOBTldKnfnFPjlt?=
 =?us-ascii?Q?ja1VJQeSddpZCOOsQst7UBBUvG54R8eQRDu2mc6RPDcnDANkuE1T2+QzZupP?=
 =?us-ascii?Q?GVY7D29g42wZ8QdhK6/TOpCkaXqX1LYfj5vNZAsF+GBR1eHOzY1ktQIKcHtP?=
 =?us-ascii?Q?lwqm16slCkBW/2Xl21zX9c6Ax6pDKiCOzUImt8FM+LlqK69085zihsK5GSmu?=
 =?us-ascii?Q?twEwMuIjA/rPwTLO26Wq4/+yQPZwmSat4xWobU4x+whR7cG6Ql+91Wgi7mpi?=
 =?us-ascii?Q?F45zqjOTKChPIpCh+PfFZb9mGeRgEc4bmgmpDhfXVKoUM33j57bBFDkrhItk?=
 =?us-ascii?Q?3zJReyR4mwlMCCsEZj/efX4NUpfX3G0mS1ON2z1256BOa90oujOCypRmQUB9?=
 =?us-ascii?Q?UWpCjYsxJULcvSxEweuKewDk9HKiMQ1btX61TbAg4C9gLFo+oMJvhXl5U7CH?=
 =?us-ascii?Q?VlIQqNJocH7Ac8YwmAdW7JlpmL3q9FbJElxBvFPxjhygfsTwB0CGSH1bpp2I?=
 =?us-ascii?Q?vvuyu0SfQ5z6/nyROW1q2VV2qZIi5SkWPmOsk+TerQJ7AXYoQlADEBa+VKIH?=
 =?us-ascii?Q?8/3OThBNFY7liJLC50nIHfkJryCVMqfyy9m73Vl3zvKrmjKtGfFUjzfzHaHv?=
 =?us-ascii?Q?t1iDbXYVeaOV0i7qguOtxPBnrW95ijpW35yYs7sCT2J5nuWZZYWW7yRTttab?=
 =?us-ascii?Q?VgTOZDIvZG+Y4eTLu+AkHXlaOxH+TQIjMsS6VL2/DzZhieKpT0Z5JC38YjVR?=
 =?us-ascii?Q?HDKrBxJ+z4XpVd6L97oEXZFknpnbJeBGwRRi/MILI9b7KE5wJrmDEcftLzjO?=
 =?us-ascii?Q?Wuv0XAKHcDMdT9Js4KzT0ty4Smi8geoSpmKQXut2JYo9u97rUZ/kQTTf1qix?=
 =?us-ascii?Q?cHphL5d7VZHnlPHYt+VjEI1S6FB3j/6Kq5wkEGnj0N5wUCW4Z3P0dB7pFqNW?=
 =?us-ascii?Q?VMy/1geBXA7BSDdPXdkyDKWOGb9Qn7uJtj5EFGYmz5aCP4cJnaqRk7ri5V5b?=
 =?us-ascii?Q?pEwtl8Yxeew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+Vm/dvLpNozyEoVkqS12fPc7AZiPpcRcvEZLdmepzE4H7lSkk+azD8EecRa?=
 =?us-ascii?Q?hQzbwxUttR2KECRXIs7SpEOpAlTF6E9bFNXAuHrPh9Y7Wb5KB/4Jl4eLMeaf?=
 =?us-ascii?Q?QE5GEfc1V5qHR7e9q+EiaJTW2ZJ5yDn8rFO+6VaRvnEJXnqTqvTBa5njQ4rE?=
 =?us-ascii?Q?WtrQRRGCW03JNla5HeRSLNN7NFKzykGRKbMl4a6uywNyGRriYAt7o7Jzg9hb?=
 =?us-ascii?Q?WtQEjYbMdcYQn9jw0XjC+KblzzgXvA5TOc8V+tuJGnHpovHrzYqmPcg+okJh?=
 =?us-ascii?Q?tGIymFY5hGWW/IJWLOqoGYJNqMtdWbyKR+v0NP6s+SDELtSaIdsSdJbqNyTC?=
 =?us-ascii?Q?5yeBQfomt6kq6GQqbCqAsIgnhqIKGtPGj9Rfxyn6GKgJ3Di8vPb0zH760XUN?=
 =?us-ascii?Q?Bp52ajb6eqyUspFaqJ4uz+fEqeX6FvXDSpy0UX/2MZPEQnVxkbsHEz2mKTlw?=
 =?us-ascii?Q?X5A7Hv63epvBPad2oWZunlaDmraDh+mm1jxvgyl0FywSxGhv31hVzIciB4nW?=
 =?us-ascii?Q?Jq4xO2pCtBbsLDC3PuDbAKKbdOZYsVdYOdA/1mvOeJq2gAbND1D8lH2Jnk6t?=
 =?us-ascii?Q?bZiEgIicN0igiF4PMxp3jBragBN0/knanv2CdBIK78iY1aZnxAYeaeqcJIlU?=
 =?us-ascii?Q?EHF2lEXEdWzbue96zwb0QE9nEULQPwPfxb2Rux78KqhlEVXFc9ZrFEiLZcMU?=
 =?us-ascii?Q?g6zLlKWs7V1kzcIBULNVg9QnhhVKTFGWSh4XrnE8Q/Jpk2RTeZy1abD+Xpfs?=
 =?us-ascii?Q?bNhKHvWROkKhFopv1hUBk9DBS5kL+0tn/a4V7vtzK3sPffZ6aqljX1j89W2Z?=
 =?us-ascii?Q?NrMd+/CVNBnL6r12Qo5oOfaToA6q12eLeJg8fILrlM+IsoH0zKeffbgSf1J6?=
 =?us-ascii?Q?L6vu6ZucRzOyghk63rTCCgWIXreuklTe7fezWrpzzNY8SNXjuU3bpLvsPSI/?=
 =?us-ascii?Q?JDRtac+n1wp79pzc6FgNojvEdDMZXjBba0yBKEauGYe/lyDKFxENIZNpaJTD?=
 =?us-ascii?Q?t6jC1W1t44FHpwKd65sPuTft37FFXMHNzYyOdz3doOS3/suyuXb1dkBK44cn?=
 =?us-ascii?Q?JscyKQH8s+H1o1Deem81oqGzQgMFSP2gGBui7y0IBCmnxpLvu+0+AsrcTKtZ?=
 =?us-ascii?Q?N/1gXxtV/YsnrGDO4YVQuB2E8Rz3zRuk2yEhHyRYvnsfVS+yFhtO/2m/f/Bj?=
 =?us-ascii?Q?85MM4NQa6jQPaH7o9kYNU4xvqwKZM/IEzdK+//xY7o1F81ISH7oW04vMlRUK?=
 =?us-ascii?Q?4vr9ICBz8r+YGOLkfEp/O3XiqFeL71FIEtKZuxspFi14F0t2BGgO6xmFZtyA?=
 =?us-ascii?Q?qqC3o1JPSgCI/soGqUI4P0SIwipi5nxqKX6C+Suddhmr2R/4/QOa+Z98EVV/?=
 =?us-ascii?Q?BL+yTm7Wn3GJkXTPgqtXKiSiatycd0N3BhchuHPZay3a/8qBH3IHeGTndVai?=
 =?us-ascii?Q?W4ttxQkH8lDqWwBleXvsUrwV/IJwdlr0RQ+oft4/A3lXBY+XHs+I+6RNrZgs?=
 =?us-ascii?Q?+/uU1VyX0vJvUxqHBQBBjddnf1xlGelZlQ2KciGk7ZKRAwkO7YOuKMGrAQit?=
 =?us-ascii?Q?hN5qqpyleQyJH91DZYz/We6moR77lK6f87rygIOLC08AjzF/8amKfnsfTd+9?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42504cc9-30b8-4805-5f59-08dd86cdf193
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 03:28:43.7952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHs8HGenURLJn4brbu7hLuYwZPsksbfoM1Pxwh2pFiBhV0zZa0eYxd0RBhRKpoSF0FKvglatUg8l9mJkvoMDIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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

On Mon, Apr 28, 2025 at 06:01:54PM -0700, Umesh Nerlige Ramappa wrote:
> Resending, since I forgot to add the list
> 
> ----- Forwarded message from Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> -----
> 
> Date: Mon, 28 Apr 2025 16:58:37 -0700
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> To: Matthew Brost <matthew.brost@intel.com>
> Subject: Re: [PATCH v2 3/3] drm/xe: Add WA BB to capture active context utilization
> 
> On Fri, Apr 25, 2025 at 09:54:52PM -0700, Matthew Brost wrote:
> > On Fri, Apr 25, 2025 at 05:29:51PM -0700, Umesh Nerlige Ramappa wrote:
> > > Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
> > > of the context, but only gets updated when the context switches out. In
> > > order to check how long a context has been active before it switches
> > > out, two things are required:
> > > > (1) Determine if the context is running:
> > > > To do so, we program the wa bb to set an initial value for
> > CTX_TIMESTAMP
> > > in the lrc. The value chosen is 1 since 0 is the initial value when the
> > > lrc is initialized. During a query, we just check for this value to
> > > determine if the context is active. If the context switched out, it
> > > would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
> > > Note that wa bb will run after the context has been restored, so reusing
> > > this lrc location will not clobber anything.
> > > > (2) Calculate the time that the context has been active for:
> > > > The CTX_TIMESTAMP ticks only when the context is active. If a
> > context is
> > > active, we just use the CTX_TIMESTAMP MMIO as the new value of
> > > utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
> > > for the specific engine instance. Since we do not know which instance
> > > the context is running on until it is scheduled, we also read the
> > > ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
> > > > Using the above 2 instructions in a WA BB, capture active context
> > > utilization.
> > > > v2: (Matt Brost)
> > > - This breaks TDR, fix it by saving the CTX_TIMESTAMP register
> > >   "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
> > > - Drop tile from lrc if using gt
> > >   "drm/xe: Save the gt pointer in lrc and drop the tile"
> > > > Signed-off-by: Umesh Nerlige Ramappa
> > <umesh.nerlige.ramappa@intel.com>
> > > ---
> > >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
> > >  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
> > >  drivers/gpu/drm/xe/xe_lrc.c                   | 167 +++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
> > >  5 files changed, 177 insertions(+), 2 deletions(-)
> > > > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > index eba582058d55..9153a7cd2ceb 100644
> > > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > @@ -62,6 +62,10 @@
> > >  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> > >  #define   MI_LRM_USE_GGTT		REG_BIT(22)
> > > > +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) |
> > XE_INSTR_NUM_DW(4))
> > > +#define   MI_SRM_USE_GGTT		REG_BIT(22)
> > > +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
> > > +
> > >  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
> > >  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
> > >  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index da713634d6a0..cc698136a6f6 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -43,6 +43,10 @@
> > >  #define XEHPC_BCS8_RING_BASE			0x3ee000
> > >  #define GSCCS_RING_BASE				0x11a000
> > > > +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
> > > +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
> > > +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
> > > +
> > >  #define RING_TAIL(base)				XE_REG((base) + 0x30)
> > >  #define   TAIL_ADDR				REG_GENMASK(20, 3)
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > index 57944f90bbf6..210be0ef12f2 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > @@ -11,6 +11,7 @@
> > >  #define CTX_RING_TAIL			(0x06 + 1)
> > >  #define CTX_RING_START			(0x08 + 1)
> > >  #define CTX_RING_CTL			(0x0a + 1)
> > > +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> > >  #define CTX_TIMESTAMP			(0x22 + 1)
> > >  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> > >  #define CTX_PDP0_UDW			(0x30 + 1)
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 089b195e2635..a78acec1a358 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -24,6 +24,7 @@
> > >  #include "xe_hw_fence.h"
> > >  #include "xe_map.h"
> > >  #include "xe_memirq.h"
> > > +#include "xe_mmio.h"
> > >  #include "xe_sriov.h"
> > >  #include "xe_trace_lrc.h"
> > >  #include "xe_vm.h"
> > > @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> > >  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > >  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> > >  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > > +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
> > > >  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> > >  {
> > > @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> > >  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> > >  }
> > > > +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> > > +{
> > > +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
> > > +}
> > > +
> > >  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> > >  {
> > >  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> > >  }
> > > > +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
> > > +{
> > > +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
> > > +}
> 
> This also looks like it's unused, so will drop it.
> 
> > > +
> > >  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> > >  {
> > >  	/* Indirect ring state page is at the very end of LRC */
> > > @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > >  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > >  DECL_MAP_ADDR_HELPERS(parallel)
> > >  DECL_MAP_ADDR_HELPERS(indirect_ring)
> > > +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
> > 
> > This appears to be unused.
> 
> oh, you are right, will remove
> 
> > 
> > > +DECL_MAP_ADDR_HELPERS(engine_id)
> > > >  #undef DECL_MAP_ADDR_HELPERS
> > > > @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> > >  	xe_bo_unpin(lrc->bo);
> > >  	xe_bo_unlock(lrc->bo);
> > >  	xe_bo_put(lrc->bo);
> > > +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> > > +}
> > > +
> > > +/*
> > > + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> > > + * context run ticks.
> > > + * @lrc: Pointer to the lrc.
> > > + *
> > > + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
> > > + * context, but only gets updated when the context switches out. In order to
> > > + * check how long a context has been running before it switches out, two things
> > > + * are required:
> > > + *
> > > + * (1) Determine if the context is running
> > > + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
> > > + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
> > > + * initialized. During a query, we just check for this value to determine if the
> > > + * context is active. If the context switched out, it would overwrite this
> > > + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
> > > + * after the context has been restored, so reusing this lrc location will not
> > > + * clobber anything.
> > > + *
> > > + * (2) Calculate the time that the context has been running for
> > > + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
> > > + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
> > > + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
> > > + * engine instance. Since we do not know which instance the context is running
> > > + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
> > > + * store it in the PPHSWP.
> > > + */
> > > +
> > > +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> > > +{
> > > +	u32 *cmd;
> > > +
> > > +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> > > +
> > > +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> > > +	*cmd++ = ENGINE_ID(0).addr;
> > > +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> > > +	*cmd++ = 0;
> > > +
> > > +	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> > > +	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> > > +	*cmd++ = 0;
> > > +	*cmd++ = 1;
> > 
> > Nit: Rather than '1' can we have define indicating this is a special value.
> 
> Sure, will add define.
> 
> > 
> > Also there is a small possibily (1 in 4 billion - I think) of a race
> > here. It is possible than an LRC switches out with a value of '1' and I
> > believe we'd read garbage from get_ctx_timestamp() ... Is there really
> > not another register in the LRC we can steal a bit from?
> 
> There are, but the ones that are saved/restored during lite-restore is
> entirely hw implementation dependent. Looks like CTX_TIMESTAMP is NOT
> saved/restored during lite-restore and also it directly relates to this
> feature, so a safer bet.
> 
> Other alternatives explored
> 1) ppHWSP locations that might be updated on context save. These are not
> consistent across platforms and are disabled in some.
> 
> For 2, 3 below, Ref: https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/alchemist-arctic-sound-m.html
> 
> 2) Vol 8: Page 57/64
> If we look for anything after CSEL_BE in the LRC, then we would need to add
> logic to traverse the LRC to find the right offset because it is engine
> specific and also platform specific. Can be done, but not a lot of ROI
> considering the probability of hitting this.
> 
> 3) Vol 9: Page 39/730
> If we omit support for media and copy engines, then we could use upper half
> of PREEMPTION_STATUS field. Needs more experiments though. This doesn't get
> restored at all, only saved. So we could just write
> something like (ENGINE_ID + 1) to this location from the WA BB.
> 
> > 
> > If not, maybe we can live with this race? At minimum we'd need comment
> > somewhere explaining this - at worst we'd get some bad stats or in a
> > very unlikely case get false job timeout if we switch the TDR to use
> > this new code path.
> 
> I asked around and got some suggestions - like check HEAD/TAIL of the ring
> in the LRC and that should tell if the context is really active.  But if
> HEAD != TAIL, we still run into the same issue of checking validity again.
> 
> IMO, since the probability of hitting this is very small, I would go with
> the current implementation and like you said, add a comment describing this
> race.
> 

I think getting another persons opinion (e.g., Lucas) here might be a
good idea. I'm not sure what the maintainer view is on accepting
something that we know can be an issue into the KMD.

Matt 

> > 
> > The patch / design LGTM to good me though.
> 
> Thanks,
> Umesh
> 
> > 
> > Matt
> > 
> > > +
> > > +	*cmd++ = MI_BATCH_BUFFER_END;
> > > +
> > > +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> > > +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> > > +
> > >  }
> > > >  #define PVC_CTX_ASID		(0x2e + 1)
> > > @@ -921,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >  	if (IS_ERR(lrc->bo))
> > >  		return PTR_ERR(lrc->bo);
> > > > +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> > > +						  ttm_bo_type_kernel,
> > > +						  bo_flags);
> > > +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> > > +		err = PTR_ERR(lrc->bb_per_ctx_bo);
> > > +		goto err_lrc_finish;
> > > +	}
> > > +
> > >  	lrc->size = lrc_size;
> > >  	lrc->ring.size = ring_size;
> > >  	lrc->ring.tail = 0;
> > > @@ -1026,6 +1100,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >  	map = __xe_lrc_start_seqno_map(lrc);
> > >  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> > > > +	xe_lrc_setup_utilization(lrc);
> > > +
> > >  	return 0;
> > > >  err_lrc_finish:
> > > @@ -1245,6 +1321,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> > >  	return __xe_lrc_parallel_map(lrc);
> > >  }
> > > > +/**
> > > + * xe_lrc_engine_id() - Read engine id value
> > > + * @lrc: Pointer to the lrc.
> > > + *
> > > + * Returns: context id value
> > > + */
> > > +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
> > > +{
> > > +	struct xe_device *xe = lrc_to_xe(lrc);
> > > +	struct iosys_map map;
> > > +
> > > +	map = __xe_lrc_engine_id_map(lrc);
> > > +	return xe_map_read32(xe, &map);
> > > +}
> > > +
> > >  static int instr_dw(u32 cmd_header)
> > >  {
> > >  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> > > @@ -1792,21 +1883,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
> > >  	kfree(snapshot);
> > >  }
> > > > +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
> > > +{
> > > +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
> > > +		{
> > > +			RENDER_RING_BASE,
> > > +		},
> > > +		{
> > > +			BSD_RING_BASE,
> > > +			BSD2_RING_BASE,
> > > +			BSD3_RING_BASE,
> > > +			BSD4_RING_BASE,
> > > +			XEHP_BSD5_RING_BASE,
> > > +			XEHP_BSD6_RING_BASE,
> > > +			XEHP_BSD7_RING_BASE,
> > > +			XEHP_BSD8_RING_BASE,
> > > +		},
> > > +		{
> > > +			VEBOX_RING_BASE,
> > > +			VEBOX2_RING_BASE,
> > > +			XEHP_VEBOX3_RING_BASE,
> > > +			XEHP_VEBOX4_RING_BASE,
> > > +		},
> > > +		{
> > > +			BLT_RING_BASE,
> > > +			XEHPC_BCS1_RING_BASE,
> > > +			XEHPC_BCS2_RING_BASE,
> > > +			XEHPC_BCS3_RING_BASE,
> > > +			XEHPC_BCS4_RING_BASE,
> > > +			XEHPC_BCS5_RING_BASE,
> > > +			XEHPC_BCS6_RING_BASE,
> > > +			XEHPC_BCS7_RING_BASE,
> > > +			XEHPC_BCS8_RING_BASE,
> > > +		},
> > > +		{ 0 },
> > > +		{
> > > +			COMPUTE0_RING_BASE,
> > > +			COMPUTE1_RING_BASE,
> > > +			COMPUTE2_RING_BASE,
> > > +			COMPUTE3_RING_BASE,
> > > +		},
> > > +	};
> > > +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> > > +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> > > +	u32 mmio_base = base[c][i];
> > > +
> > > +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
> > > +			    "Unexpected engine c:i %d:%d for context utilization\n",
> > > +			    c, i))
> > > +		return 0;
> > > +
> > > +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
> > > +}
> > > +
> > >  /**
> > >   * xe_lrc_update_timestamp() - Update ctx timestamp
> > >   * @lrc: Pointer to the lrc.
> > >   * @old_ts: Old timestamp value
> > >   *
> > >   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> > > - * update saved value.
> > > + * update saved value. With support for active contexts, the calculation may be
> > > + * slightly racy, so follow a read-again logic to ensure that the context is
> > > + * still active before returning the right timestamp.
> > >   *
> > >   * Returns: New ctx timestamp value
> > >   */
> > >  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> > >  {
> > > +	u32 ctx_lrc, ctx_reg, engine_id;
> > > +
> > >  	*old_ts = lrc->ctx_timestamp;
> > > > -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> > > +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> > > +	if (ctx_lrc == 1) {
> > > +		engine_id = xe_lrc_engine_id(lrc);
> > > +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
> > > +		if (!ctx_reg)
> > > +			lrc->ctx_timestamp = *old_ts;
> > > +		else
> > > +			lrc->ctx_timestamp = ctx_reg;
> > > +
> > > +		/* read lrc again to ensure context is still active */
> > > +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> > > +	}
> > > +
> > > +	/* If context switched out, just use the lrc value */
> > > +	if (ctx_lrc != 1)
> > > +		lrc->ctx_timestamp = ctx_lrc;
> > > >  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> > b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > index cd38586ae989..a62d0b8ca8a4 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > @@ -53,6 +53,9 @@ struct xe_lrc {
> > > >  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update
> > */
> > >  	u32 ctx_timestamp;
> > > +
> > > +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> > > +	struct xe_bo *bb_per_ctx_bo;
> > >  };
> > > >  struct xe_lrc_snapshot;
> > > --
> > > 2.43.0
> > >
> 
> ----- End forwarded message -----
