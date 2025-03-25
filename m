Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E192C36008
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 17:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19C910E3AD;
	Tue, 25 Mar 2025 17:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e615tHWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BF510E3AD
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742925364; x=1774461364;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6RJgbs88IW5iNR11HGyyWjv0LzunXhm1mm86tLLnnvA=;
 b=e615tHWzNDqqFzaJkJF9f0t/WytYZHa5u5olNzQbTCyf7ArAOdc5Ws1W
 UUGTsODmw1joLKfnvMl0RCTMbcWIj4dN9KhyZZn7c4N28I36U79bp3kPT
 z522wFR8ivnOmj3wT3KPUIlRb8JHavvzHKilP+7Z81/gA1A7ysd+Q31YO
 S8vkogQPDS/9NjapDND1UIvKhSEay+fXtaVFnAF8QQRFZXj6FRkx2Mmcy
 1uU8gdiWLhtKH8QowxJdD65pBSDoeaxdE+XwfxLcBkriy31j+d63qZhyB
 xZD0Fahif7YuyaQatFRPLc6Z0KhuAb/DWN0dcP/osazrN/3Go19XR3yYk g==;
X-CSE-ConnectionGUID: uGB4QrFnS+y3uv2Hq3GpAw==
X-CSE-MsgGUID: Y+5kl+LuQACoPf6S5fJx/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61712570"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="61712570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:56:00 -0700
X-CSE-ConnectionGUID: K0eyjoj9Q9OXTjUroqeJCw==
X-CSE-MsgGUID: HibuhAUhRlGkLHGyScYgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125388420"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:56:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 10:55:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 10:55:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 10:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLMz5W+tsKGIfYiM4ziRlFSorPglP/x0zBGAkKJirSAU2mLFsTtpcG2SItWDKzBDgqxMi40YllOna9rleD8Vm8ectuh1GMAfGtEPxE/y1BN8qQxGQfWqQEv1xm4wzO2+DyULOxr6JJfXgCpyu47+VdGcKNRXy+P/kPxnLlRVEHwWi3CiURHdMOcyJ6EZGlf73JjTXtWMGo/hsGco5foujke40jKh5Ib6uVPRjPExGZrsA8pVWlDeR31JKfimf6HkuE3YGjyO+MBFA7oQz6ynZk/4mCMscRwRW4sb59g9PwcnlhRAqHOTmdZnsA7c6fSL2f0/P9KexMEkKl9FrH3cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWgYxgQm2vnQpKgYYBL2Bt8dsjybAEm9DjjvvuavtaQ=;
 b=Qo6iYp1Reek5enbVeaeyI/JZzAaq3hzzIHy79+jQEPttk3Xk9TrggEgEMDUzHoY1UMz11dSe382Zt58WYixiSjKQdyH7CIgZ/u8Kq5v9Z2+qT452787Pnp84+azO8OvuJYe5Lz1Okx3wKK/A2m4nfhcu9Uz6uKFSOSD96Ji38sLVu7m1n4JZESJDtDfhrpDYOK6zV08MQ+WYKrwEeaJZUhcGz0bFqMymG6/FkGtfirsja5IpIK17yslfjQM076DtajeYnsaWm4/k13crG09LawfBMBb+vuewpG9efp6tLnA2I8UNzMD0OAcfi42V/pHvLGMmM0lfIdaloH6Nm49vIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 17:55:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 17:55:52 +0000
Date: Tue, 25 Mar 2025 10:57:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/uapi, drm/xe: Make the PT code handle
 placement per PTE rather than per vma / range
Message-ID: <Z+LucOigm7NhIn8A@lstrano-desk.jf.intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
 <20250321163416.45217-6-thomas.hellstrom@linux.intel.com>
 <Z92e9sx7PdSSl3p4@lstrano-desk.jf.intel.com>
 <f88fe5f8d716ddfccf240075c2a31ca7b350868b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f88fe5f8d716ddfccf240075c2a31ca7b350868b.camel@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: d595226a-f965-424c-a688-08dd6bc64868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JrqxOM20ogUPis5IOs8gLPNs8Yw6YotZ4E2xuISgUgufz25zuXmERunxpc?=
 =?iso-8859-1?Q?HeYC4+TamNSR9GpoXLLum8p7g2qGpLzRtui/MM0GxBwt46KdsH8dDSl74e?=
 =?iso-8859-1?Q?W9BTHi4i2DfLLi8X6f9Ntwv5hspXtxxYJI3dnrEsZAiQ0Q3ss3vLJxfVo0?=
 =?iso-8859-1?Q?AcOfJWU+eSs/bhRS0dtI+gTEiPHaOCGjSJUcDwUWxADwrLDfKqFW6PrmIY?=
 =?iso-8859-1?Q?7vVQz3p4CDArUX30g5GADltgaIDgChXd+Qci9ts+HcohsWL2ik1tR6w7nC?=
 =?iso-8859-1?Q?o/Wfpr1ytzqfe02AkxvpWbeCQvJpAUyfHO6wJVeovMYClUFeTDMBq+2roA?=
 =?iso-8859-1?Q?drBsdjvhLnipw+gf0Dof2RheHfVZ9RehZuf6r4On3fvB1Z2EDLBvojIhGn?=
 =?iso-8859-1?Q?KFT5Z8y3jxTPM75XfzItupfSv7Ugkpe0Sgggz/I5VXYiYAZ02g7JcmXdA3?=
 =?iso-8859-1?Q?lqewtiph+O2SuaP5j2WvLgEUNrHokdbGHrlVqswB93cfpBD6Xc2MfUQ/oR?=
 =?iso-8859-1?Q?3xYwjZSqEF0781qPqV5I4Vr+IhWHveGl8d8HnkejsUfRkQWduXhxrCXh7F?=
 =?iso-8859-1?Q?1qy9hBVwmrRNSIzRBD0HR9Zd25lPC7SInbgS3XbKzkRCe8aQepEfZIQSIh?=
 =?iso-8859-1?Q?5QPWZngK8sUn19fmZkhlz3F5+OnLJKZid2mcbYjk4WH8aiX+5XhN3/zUGX?=
 =?iso-8859-1?Q?/O8rVtdqj2NoPb9TODQbk/Jk5oEPcgCMWLY+la509/WublbvG/Lj3+pQlT?=
 =?iso-8859-1?Q?lMwhglx2aPdTmT7GkojiX2muzuubKfjdVWU3jx4QGcrWHYP8gl1szcxSbp?=
 =?iso-8859-1?Q?URsM0FvcsvpANddlDvn4qEZQgGjH3nt/E4BdWZlRgSQEL3eudYuLE1Hw5D?=
 =?iso-8859-1?Q?MI2jqtREs0vRy1WBQ7xsJj2bGWE/vZnlG3fE4hjtKABY+pIsrGPibLsnKO?=
 =?iso-8859-1?Q?h5bQx+9DrjYgCdu9TLtk26d5789Ix8gOM9nIsoL07WFUwH/HrrWp2QwK57?=
 =?iso-8859-1?Q?QWgVK2V99L3vzjiM/XcaCDAnsVpVoJpc2UHrTOAQ7xlKqsKypB3ezNgR93?=
 =?iso-8859-1?Q?IU/nr2Wh9ZddI0OnsqikDoNHIGlRMKHhi1Fhr8LXOujlHPz10Ur0/KXs5O?=
 =?iso-8859-1?Q?Irz5vT60UFerVhLapDyGoLRHkQ8+GMEe8DEXvqIZT696uC1L65XQ0zk8LM?=
 =?iso-8859-1?Q?5huS0TyD08lF/HG06/eeg4IIKGOWK7KXpBvtMtagKoGSxh9DHTdg1RYL4V?=
 =?iso-8859-1?Q?qPI1aoI8+yoc+U7gQQ6a4Zvu353n+ReaUhn2duC4lYlWZNZCIkhRV5Oh20?=
 =?iso-8859-1?Q?G8rOI3z2685nhkWcOLBqvszATlwW7LWZq5asW5V/zI9162P0s2bAaYF26t?=
 =?iso-8859-1?Q?lFMErXx7cD0N4vYkC0bQjsa5aesl9dw/SBmwZZLyj35P25GyH/0a0/K7kX?=
 =?iso-8859-1?Q?SLKV6pPh+TWV6Qdp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sK1F+229L0VQ2sODcevCZvJIhb0/S6bpwjJUF9qGzmpp1mhpg13Kkl9+HA?=
 =?iso-8859-1?Q?UrPDLDLGZa0vyI0KUMKgFIKCExncPlXfu9lARlv8/49hyAL0MNHy7CRCJH?=
 =?iso-8859-1?Q?LAhqmWQ3UnRQQmwjxB8/kJz6psPkok/q1mC7AMWE2Of5Z8yuEpgOdYos1G?=
 =?iso-8859-1?Q?5Hwidcc2eQXIUJA90lDcaLwYlJH5LXDcDDQDUcknNulcVhJ49a6YO/P4wa?=
 =?iso-8859-1?Q?1XWcAOuRSGjq2tTXXlPjB7rBIX2Uk5BTFhckWOLMAEoFU5GtTdEWEEnK54?=
 =?iso-8859-1?Q?8i3aw2GfhXaDZp3XAnM+5Df1NgLdGfWVUGxvBenVlnUSvbTmcJkN1n2GE3?=
 =?iso-8859-1?Q?0iNltQVfeMlxL3m7hdo62jXLvCpIJrHFRyFFzXC6FMJuU31kdDRwbQ9a3Z?=
 =?iso-8859-1?Q?TPbkY3r32/Nt7BisGJ39qsJ70lS5hLRKfZHrCs3+1NGD2mlNMaSOWqnBng?=
 =?iso-8859-1?Q?U5nDba34twSgcoy2jiLjaqrx76PzHw2vtks/+gRj4Wd82Jo/QH24SkBBt+?=
 =?iso-8859-1?Q?68R4NnhWjEW66OOMjkcbxgYPY4n3Z9Gv9c4xhhhnVijuVoniuubWpfTspp?=
 =?iso-8859-1?Q?ngewYJpv96uclQD9UQdOBBQR5davxoIeW7MbydxTGTWwiF2vqhlyymOpv8?=
 =?iso-8859-1?Q?XSBBhD8r4U38JDQ1lMncZUTtGdUIivL9riWGyJ5gMoOPHeGlW41/aB0KwE?=
 =?iso-8859-1?Q?7sngSes+hd+6QIdC5r9v+dHcFRW8jc5XJGLDlV4FFIUx4dXFoGN8gT1sUN?=
 =?iso-8859-1?Q?2qrlYFz0evQRraWZCILvSxlHILVxTvyeXhU2d3NpCEBpHbZM51/KZqRbkQ?=
 =?iso-8859-1?Q?U9YVokAbVhRo8dTwDD4uOKTsyN6pe5OaZG/Tu0BQ4lXtYXMgaZbx5+DNdl?=
 =?iso-8859-1?Q?uJCCRvOAOhaCJsDhV7s2W3Q2gsp+3bJ6Dgu1XfnLsYiT2NSiLUROngeRg8?=
 =?iso-8859-1?Q?c87dNJbIDzDK/FYxYoiXhqEgUnx/iPhmUxfLVL16Z+5/KC/mi45B3Ev5da?=
 =?iso-8859-1?Q?b6xlDnpRy9zM5TY1VV71sTH6+BV6k+hirgMVd9Sn+V7d5V0zqVdpPYVxdR?=
 =?iso-8859-1?Q?zowkqM+PiavnzywExJh49TbrVqsC1SAwTXopr8cfrnuukLrmEskNR5SY/7?=
 =?iso-8859-1?Q?CL9BtaamQYqXEBrfNBrWZeWh5qU1HxTmtTJPUDn/0Ij9aemJ389UbB6RH7?=
 =?iso-8859-1?Q?mAwlzTIIEpL5SPDCPiDGgw+rwGK2WV+Tct94eMtopMA9O864/cAEvBPPh/?=
 =?iso-8859-1?Q?IyPikYNMfdN7cSLSEFaY61PLKkT8b0IPRBKUa7Nsi48bf3EsV15izlVKvB?=
 =?iso-8859-1?Q?b2yxrQoDgl0mcMeqtYvNpyYrEu91oCix+mJXlXfhI/1Pm9eMXAAm+K4MFC?=
 =?iso-8859-1?Q?BS441oqJhFqZ+/N9e5lOOQcRQcWxaDqb3tPHzEtsy1j5pVmrg/RJYuurAJ?=
 =?iso-8859-1?Q?D3g/KQiH+HKfDk8llaXoMk5GpRpx2KDJ8SplYSJng+Pdg1bgbxjJhsDU0A?=
 =?iso-8859-1?Q?rMzqH74/Y+L+aPy0uMi0SsrSZl6DqHBv4IHtDurvzWzBlgvHtBzAXD6IEj?=
 =?iso-8859-1?Q?vo1X8LOeLQvHMJjXGk1KnjrjJgKaCBofVf1B33q7PJPKG3HEsvTTRrFNHn?=
 =?iso-8859-1?Q?Z5J8hFkQTxq8dsjn8LL99wTlCt1jp7jMxCx1Cx0x/zmvKqyzycSLZBOQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d595226a-f965-424c-a688-08dd6bc64868
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:55:52.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5457N6F3BuGyEL9W7TC7Kuoz695I3pG8iFRPVjZmJo/W73PBLtpx0Ixc6a9xEN8evP/AfSsvVZi5IeEDvW69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

On Tue, Mar 25, 2025 at 03:23:14PM +0100, Thomas Hellström wrote:
> On Fri, 2025-03-21 at 10:16 -0700, Matthew Brost wrote:
> > On Fri, Mar 21, 2025 at 05:34:16PM +0100, Thomas Hellström wrote:
> > > With SVM, ranges forwarded to the PT code for binding can, mostly
> > > due to races when migrating, point to both VRAM and system /
> > > foreign
> > > device memory. Make the PT code able to handle that by checking,
> > > for each PTE set up, whether it points to local VRAM or to system
> > > memory.
> > > 
> > > The UAPI is changed implicitly in that before this patch,
> > > global atomics required a bo with VRAM/System placements. With
> > > this patch that is changed to requiring LR mode, and
> > > if the required placement is not available upon GPU atomic access
> > > pagefault, an error will be generated and the VM banned.
> > 
> > I think the queue will get banned if I'm reading the code correctly.
> > 
> > > 
> > > v2:
> > > - Fix system memory GPU atomic access.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c |  12 +++--
> > >  drivers/gpu/drm/xe/xe_pt.c | 106 ++++++++++++++++-----------------
> > > ----
> > >  2 files changed, 56 insertions(+), 62 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 9d043d2c30fd..3c7c2353d3c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -2116,10 +2116,16 @@ uint64_t vram_region_gpu_offset(struct
> > > ttm_resource *res)
> > >  {
> > >  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> > >  
> > > -	if (res->mem_type == XE_PL_STOLEN)
> > > +	switch (res->mem_type) {
> > > +	case XE_PL_STOLEN:
> > >  		return xe_ttm_stolen_gpu_offset(xe);
> > > -
> > > -	return res_to_mem_region(res)->dpa_base;
> > > +	case XE_PL_TT:
> > > +	case XE_PL_SYSTEM:
> > > +		return 0;
> > > +	default:
> > > +		return res_to_mem_region(res)->dpa_base;
> > > +	}
> > > +	return 0;
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 9e719535a3bb..3ffe135c27f1 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
> > >  	struct xe_vm *vm;
> > >  	/** @tile: The tile we're building for. */
> > >  	struct xe_tile *tile;
> > > -	/** @default_pte: PTE flag only template. No address is
> > > associated */
> > > -	u64 default_pte;
> > > +	/** @default_pte: PTE flag only template for VRAM. No
> > > address is associated */
> > > +	u64 default_vram_pte;
> > > +	/** @default_pte: PTE flag only template for VRAM. No
> > > address is associated */
> > > +	u64 default_system_pte;
> > >  	/** @dma_offset: DMA offset to add to the PTE. */
> > >  	u64 dma_offset;
> > >  	/**
> > >  	 * @needs_64k: This address range enforces 64K alignment
> > > and
> > > -	 * granularity.
> > > +	 * granularity on VRAM.
> > >  	 */
> > >  	bool needs_64K;
> > >  	/**
> > > @@ -515,13 +517,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > >  	if (level == 0 || xe_pt_hugepte_possible(addr, next,
> > > level, xe_walk)) {
> > >  		struct xe_res_cursor *curs = xe_walk->curs;
> > >  		bool is_null = xe_vma_is_null(xe_walk->vma);
> > > +		bool is_vram = is_null ? false :
> > > xe_res_is_vram(curs);
> > 
> > So xe_res_is_vram is still per range / VMA. I assume a follow on will
> > change this to be per page? 
> 
> For VMAs it's per VMA, but for ranges it's per mapped page AFAICT (at
> least that's the intention).
> 

Ah, yes it is per page for range.

> > 
> > Patch LGTM though. With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Thanks. Does this hold for v3 as well? (I dropped the atomic UAPI
> change).
> 

Yes. The uAPI was most confusing part of this patch, reasoned it was
good but fine with doing that change in follow up after a bit more
thought.

Matt 

> /Thomas
> 
> 
> > 
> > >  
> > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > >  
> > >  		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > >  						 xe_res_dma(curs)
> > > + xe_walk->dma_offset,
> > >  						 xe_walk->vma,
> > > pat_index, level);
> > > -		pte |= xe_walk->default_pte;
> > > +		if (!is_null)
> > > +			pte |= is_vram ? xe_walk->default_vram_pte
> > > :
> > > +				xe_walk->default_system_pte;
> > >  
> > >  		/*
> > >  		 * Set the XE_PTE_PS64 hint if possible, otherwise
> > > if
> > > @@ -531,7 +536,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > >  			if (xe_pt_is_pte_ps64K(addr, next,
> > > xe_walk)) {
> > >  				xe_walk->vma->gpuva.flags |=
> > > XE_VMA_PTE_64K;
> > >  				pte |= XE_PTE_PS64;
> > > -			} else if (XE_WARN_ON(xe_walk->needs_64K))
> > > {
> > > +			} else if (XE_WARN_ON(xe_walk->needs_64K
> > > && is_vram)) {
> > >  				return -EINVAL;
> > >  			}
> > >  		}
> > > @@ -603,6 +608,31 @@ static const struct xe_pt_walk_ops
> > > xe_pt_stage_bind_ops = {
> > >  	.pt_entry = xe_pt_stage_bind_entry,
> > >  };
> > >  
> > > +/* The GPU can always to atomics in VRAM */
> > > +static bool xe_atomic_for_vram(struct xe_vm *vm)
> > > +{
> > > +	return true;
> > > +}
> > > +
> > > +/*
> > > + * iGFX always expect to be able to do atomics in system.
> > > + *
> > > + * For DGFX, 3D clients want to do atomics in system that is
> > > + * not coherent with CPU atomics. Compute clients want
> > > + * atomics that look coherent with CPU atomics. We
> > > + * distinguish the two by checking for lr mode. For
> > > + * compute we then disallow atomics in system.
> > > + * Compute attempts to perform atomics in system memory would
> > > + * then cause an unrecoverable page-fault in preempt-fence
> > > + * mode, but in fault mode the data would be migrated to VRAM
> > > + * for GPU atomics and to system for CPU atomics.
> > > + */
> > > +static bool xe_atomic_for_system(struct xe_vm *vm)
> > > +{
> > > +	return (!IS_DGFX(vm->xe) || !xe_vm_in_lr_mode(vm)) &&
> > > +		vm->xe->info.has_device_atomics_on_smem;
> > > +}
> > > +
> > >  /**
> > >   * xe_pt_stage_bind() - Build a disconnected page-table tree for a
> > > given address
> > >   * range.
> > > @@ -629,9 +659,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > > xe_vma *vma,
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > -	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
> > > -		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> > >  	struct xe_res_cursor curs;
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > >  	struct xe_pt_stage_bind_walk xe_walk = {
> > >  		.base = {
> > >  			.ops = &xe_pt_stage_bind_ops,
> > > @@ -639,7 +668,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > > xe_vma *vma,
> > >  			.max_level = XE_PT_HIGHEST_LEVEL,
> > >  			.staging = true,
> > >  		},
> > > -		.vm = xe_vma_vm(vma),
> > > +		.vm = vm,
> > >  		.tile = tile,
> > >  		.curs = &curs,
> > >  		.va_curs_start = range ? range->base.itree.start :
> > > @@ -647,26 +676,22 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > > xe_vma *vma,
> > >  		.vma = vma,
> > >  		.wupd.entries = entries,
> > >  	};
> > > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > +	struct xe_pt *pt = vm->pt_root[tile->id];
> > >  	int ret;
> > >  
> > >  	if (range) {
> > >  		/* Move this entire thing to xe_svm.c? */
> > > -		xe_svm_notifier_lock(xe_vma_vm(vma));
> > > +		xe_svm_notifier_lock(vm);
> > >  		if (!xe_svm_range_pages_valid(range)) {
> > >  			xe_svm_range_debug(range, "BIND PREPARE -
> > > RETRY");
> > > -			xe_svm_notifier_unlock(xe_vma_vm(vma));
> > > +			xe_svm_notifier_unlock(vm);
> > >  			return -EAGAIN;
> > >  		}
> > >  		if (xe_svm_range_has_dma_mapping(range)) {
> > >  			xe_res_first_dma(range->base.dma_addr, 0,
> > >  					 range->base.itree.last +
> > > 1 - range->base.itree.start,
> > >  					 &curs);
> > > -			is_devmem = xe_res_is_vram(&curs);
> > > -			if (is_devmem)
> > > -				xe_svm_range_debug(range, "BIND
> > > PREPARE - DMA VRAM");
> > > -			else
> > > -				xe_svm_range_debug(range, "BIND
> > > PREPARE - DMA");
> > > +			xe_svm_range_debug(range, "BIND PREPARE -
> > > MIXED");
> > >  		} else {
> > >  			xe_assert(xe, false);
> > >  		}
> > > @@ -674,54 +699,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > > xe_vma *vma,
> > >  		 * Note, when unlocking the resource cursor dma
> > > addresses may become
> > >  		 * stale, but the bind will be aborted anyway at
> > > commit time.
> > >  		 */
> > > -		xe_svm_notifier_unlock(xe_vma_vm(vma));
> > > +		xe_svm_notifier_unlock(vm);
> > >  	}
> > >  
> > > -	xe_walk.needs_64K = (xe_vma_vm(vma)->flags &
> > > XE_VM_FLAG_64K) && is_devmem;
> > > -
> > > -	/**
> > > -	 * Default atomic expectations for different allocation
> > > scenarios are as follows:
> > > -	 *
> > > -	 * 1. Traditional API: When the VM is not in LR mode:
> > > -	 *    - Device atomics are expected to function with all
> > > allocations.
> > > -	 *
> > > -	 * 2. Compute/SVM API: When the VM is in LR mode:
> > > -	 *    - Device atomics are the default behavior when the
> > > bo is placed in a single region.
> > > -	 *    - In all other cases device atomics will be disabled
> > > with AE=0 until an application
> > > -	 *      request differently using a ioctl like madvise.
> > > -	 */
> > > +	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
> > >  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> > > -		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> > > -			if (bo && xe_bo_has_single_placement(bo))
> > > -				xe_walk.default_pte |=
> > > XE_USM_PPGTT_PTE_AE;
> > > -			/**
> > > -			 * If a SMEM+LMEM allocation is backed by
> > > SMEM, a device
> > > -			 * atomics will cause a gpu page fault and
> > > which then
> > > -			 * gets migrated to LMEM, bind such
> > > allocations with
> > > -			 * device atomics enabled.
> > > -			 */
> > > -			else if (is_devmem)
> > > -				xe_walk.default_pte |=
> > > XE_USM_PPGTT_PTE_AE;
> > > -		} else {
> > > -			xe_walk.default_pte |=
> > > XE_USM_PPGTT_PTE_AE;
> > > -		}
> > > -
> > > -		/**
> > > -		 * Unset AE if the platform(PVC) doesn't support
> > > it on an
> > > -		 * allocation
> > > -		 */
> > > -		if (!xe->info.has_device_atomics_on_smem &&
> > > !is_devmem)
> > > -			xe_walk.default_pte &=
> > > ~XE_USM_PPGTT_PTE_AE;
> > > +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm)
> > > ? XE_USM_PPGTT_PTE_AE : 0;
> > > +		xe_walk.default_system_pte =
> > > xe_atomic_for_system(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> > >  	}
> > >  
> > > -	if (is_devmem) {
> > > -		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
> > > -		xe_walk.dma_offset = bo ?
> > > vram_region_gpu_offset(bo->ttm.resource) : 0;
> > > -	}
> > > -
> > > -	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> > > -		xe_walk.dma_offset =
> > > xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> > > -
> > > +	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
> > > +	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo-
> > > >ttm.resource) : 0;
> > >  	if (!range)
> > >  		xe_bo_assert_held(bo);
> > >  
> > > -- 
> > > 2.48.1
> > > 
> 
