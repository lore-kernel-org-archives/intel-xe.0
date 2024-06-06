Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7EEC27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 16:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05B10E293;
	Thu,  6 Jun 2024 16:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7NNMuIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE8E10E293
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717691095; x=1749227095;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4bhiPFAABT5dbn5E1Cu1gDz8RmIdQTOEyFlHOaPHpKo=;
 b=G7NNMuIcUG/LMpH/mFimBnctE8oLJh2ab9CJyW8ZABiC2h+x9uKNOMAC
 Aq0vk07vJAj3amPpPFIgSBr7NufudzmDdQi5GSVQPZGLu6EBjoDEO4MRp
 5bu/q92vuF87gl1yl8p0rod+P0JEzp6hcJPMnl2tX651BkA942viwOt4W
 slncc9QknIa1L/vy6dS6j7qJFiA0NZCEoECTvTAPr0AUVI8rVjYfJl0t+
 dk2PBwI91umhySi+jtOwkBahcKOH5yM3QU24dGXWzSd6Dgtcmz5wiJlEs
 AqqXwnaolmSPY1jsg4gbEI+dcJdhOAzJQBpr7BFPpNkKXt0QDypfPIvNN Q==;
X-CSE-ConnectionGUID: sDYxYpdwS6OsyINzOocR1w==
X-CSE-MsgGUID: LGs0kwWtSh2QMc48gQJbMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14495675"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14495675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:24:55 -0700
X-CSE-ConnectionGUID: sVGKeeRpRQ+87Ly0EtcB5w==
X-CSE-MsgGUID: YVTPmJZFQ5G5sh1qCSFCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42949124"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:24:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:24:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:24:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9MVyIUPeSYeL/pfTCq5EJFordv2nS2UCTJptUJdm8QUsaAjH35zynVjUYRkvz/d7oE95wxJ5YT2Tm6Q5Bc1VhC1JleSHwqfh/shT5/9hNo0xvFG7cJPfo55tYD2czwTTiSyZz/1GDhGmEzA7A+lNcqkJ4q7jQpTm8BLkBL+bDmRrAX/o83gdNv5+gYUddRUgi0WiOinVvYBwkaGRreEsFiCnW0ZKhuyTP5oMLogcwa7jihFFgSLs7m/TvZD6Nr7RjrtqnirdZ0gfF+AFJr3rFOrzosqIXXY1stcKa9aDe+6H31K8mehoet0kPSSaClG7WVjeIBRsTOPkikZWxYZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H05M/qQEfXQRn5V8vBFS0n8qAiiJl8s2kN9tUPYZt/k=;
 b=kyXswuNyG0m8yOmgUGeumGreqO9n1eSQDR0J6QJhGV6tQ0x+xGweUJFeZI4Ky1I5iUVLfgEbQwENyzgRAqL1hpzBds2ZAfihiJhOoRUwvCFPPcBWg0kTEPNEDwRm0RFncmC+onDK7u2tyE9lH4MHyeDuEH8c3pfz6YYxRCOJ4hgWSTtmWy/V1y3fY5bSfjKyr0ysmGuI6wdXhhRJqKLEwPljqGoyhif3eFS2ge7g0N3Ar714ShAntEZo0xYUZfmzWX2IlTC3lZTG8eX9P0NR7tFAHzo6PgXRXUe6PwtAXwtaU8ThvD+HkNEa6KJ7mFVoJmYd2g3aWl6figSrubWVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 16:24:52 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 16:24:52 +0000
Date: Thu, 6 Jun 2024 16:23:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Do not dereference NULL job->fence in trace points
Message-ID: <ZmHinjM5340qkhpH@DUT025-TGLU.fm.intel.com>
References: <20240605055041.2082074-1-matthew.brost@intel.com>
 <ngmanv6726qo7ggl7w7eb2ifhox3mjvfcug74ljassq224hv6a@edjwmgcr7rmv>
 <ZmElG5XGOt82S/6m@DUT025-TGLU.fm.intel.com>
 <6ihxlf3wqtypk53fe3ppldnfw6nqe3qlji4rfpiwqk5szlvczk@h47lvwnjiyjw>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ihxlf3wqtypk53fe3ppldnfw6nqe3qlji4rfpiwqk5szlvczk@h47lvwnjiyjw>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc79ffe-d6db-48c4-fecc-08dc8645318c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?knysBrlermFCN8TYt+p7/KVspO5B8a6yzu+c+kpg8zjnGJoe4QYnN9Sm0v?=
 =?iso-8859-1?Q?vweiwOV7yAWvJ7KHorBHz4UxkyXLAjgM8VEPeTBRQsqC/DR2fnHEzRzOmB?=
 =?iso-8859-1?Q?fnAIjIg8nLX1nIZAHewWVqDY8CpfFo7BzVPBYtZhGSPW/RoxG11iVWvTYy?=
 =?iso-8859-1?Q?SvaHSNLj6t8zWkDB4jx14O+OwIHpvlzBaZICocvM5SnDdQ0qIJk5DgmBjw?=
 =?iso-8859-1?Q?Xl1LAUZ3k0EkiXODMMXttqypw8UDK+svD24EwGm/pFWhY5F+uY8or6I25d?=
 =?iso-8859-1?Q?HHJOCNpJ3yKgzWaicpoK1KQtgooNN0qUMDXhQX+fHIRUvJ/LwR/+k8VyoT?=
 =?iso-8859-1?Q?zlIBowsmME5/17fC0iu0UqR0K9uZlTw4dGtU7azE31SPOGTviLSTZPN5wr?=
 =?iso-8859-1?Q?DpDAHgv4mXqVdYZAiZWjXH1s9nOLRfO8pCYRRwMPd8+m7E13jBBlCcSic1?=
 =?iso-8859-1?Q?Zazrgb5MyGEyyI/ZQ51HUuyr069BXWuLYJMtqG71cAKZoCRO5vCkSCfOhm?=
 =?iso-8859-1?Q?bP0n44Rzym/C/I9hdzR2LDWGxRsrOj2852ck77oOYDTMNStZ2sgud65J3g?=
 =?iso-8859-1?Q?K35nSfLygGOC2fEFQ07n/OQ2pIR59Qef3wy0+kkUXV2DiBCSHu6RM5ga+T?=
 =?iso-8859-1?Q?4wJe2iFhJsUABeJ7JZuYQPWPq8JqewhnykjCZjVDAdnrzZX+dyYw8Bdk4D?=
 =?iso-8859-1?Q?PL+cX9cW91Zxv+SmAJNQDhrWLlm/ngb8t3tLmB5Py4Db9KvI7TPTlqtU+9?=
 =?iso-8859-1?Q?5gC9W/DMtI2er49oU8Rc88aQVw1k9vpbttdAqisMhTR/OQDa5hrftBBUDA?=
 =?iso-8859-1?Q?8kvhhgvlUXM7eVPF6d0Cnk0KWMfV6OIEc5JRuIXcu/FaVDHJMVo+uZIBdW?=
 =?iso-8859-1?Q?2el05AHSA3yqmk5jcgW+nmc9k7dwlYGgLerb118yi7HehJymGp2Aj/9xjw?=
 =?iso-8859-1?Q?8sih+B4RYhpqQo82bLvQHeaUlB3al8z3LIGZBjC009TnDkhKDJZPwmCioT?=
 =?iso-8859-1?Q?zaHHkoYtWz+1VZBt5yrrVGndGQ1/hijh5b61GlPbWhoHkXe2Ws1Vizrv5B?=
 =?iso-8859-1?Q?tNcSC9k41yye6gL9i5PLLKpFIRKJ0dw7XMIXtBwAeK34cf2GVODf4bv64i?=
 =?iso-8859-1?Q?8BFib7nW21JobVmOzOCkTX+/HbM3NSCv7oG1DXjse8BvuL4bcz5ZvSVGbX?=
 =?iso-8859-1?Q?3TB3we+cCx92gPjtvGNVI7Obl0EGfxcq1yHxBw3SCi56hPR/h9t/y8U1cw?=
 =?iso-8859-1?Q?CcgmsHBsPp3Ai0u4ux1DgG1v2Rc9AZksRu7rz2jCWABDnZAaEOyQCz3sfA?=
 =?iso-8859-1?Q?zK/bQkWq1AwDoe+DKK0NpkXmNDFNdgH6biaXKo5MbC8VV5Ja4c4T+SZnuE?=
 =?iso-8859-1?Q?2/ocrKEHFX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZlSRM4FQVu3dWUP6EZPLgMzGU7TdwcNOiEXIan5d8QQoiVMgos3ynRegX+?=
 =?iso-8859-1?Q?y1ISDob9TCvRytwLtDOTrMWFMectVgUHB8OwD4llh32/pmQiS4tpA9BIpn?=
 =?iso-8859-1?Q?7PZhc8gihqT6nnx7SfpwfNnoy1BezuuifxrWIQvvhxSZlp9OZSf04oiDbg?=
 =?iso-8859-1?Q?U0MvaX8fkvE0psmKCbcSGkO8ZTOQWyyk93PbjMKq2bbXLVwo8wb4NrxWLE?=
 =?iso-8859-1?Q?r+hhxsc+p40j8dUp8glnFBrImL9ho5prGyIOTnergWsHRu6hg67DOuuaHK?=
 =?iso-8859-1?Q?eZ062sb5ey9kAgXo2GPjPO6KWSmlQJrLL6/vVrF2t/+PGmMz4nRftWFQH1?=
 =?iso-8859-1?Q?XovfsLou92qli4YoIFil/4CmYKYKZG9li9kbXhn80KiCKYvzOA6dvC6g7k?=
 =?iso-8859-1?Q?Fb4XyO+5RIW7DS8D/gDlibRiLP8saC3I16f5FPguCNzPHkMl2vNfSKg10e?=
 =?iso-8859-1?Q?czTU4h/ojDdBylIZ/HMfE5MopsXM/dmgDvBEjMymvD0IeO7CI1F50sScwG?=
 =?iso-8859-1?Q?3ZqK8qF05mcLowzT47t1PUf1dUsxb45DJXfutqddELgiJYg3ti3QqptwYl?=
 =?iso-8859-1?Q?HwqyPdZEQ63X7I5qD7ynjY3urKLq0Qoms3LpCjsYawNm9WwLW16l+ytgVk?=
 =?iso-8859-1?Q?tLqhsadsYhHP3UhCvduluTpE62a5n92IfvHn4I7ZcGrpRuILsge3Xi/2rt?=
 =?iso-8859-1?Q?vrObC7pA+aC+eWYyOquLtQq4oorP6SI9lVz8xQ8dt551stskvDfogxzeg1?=
 =?iso-8859-1?Q?EDRl98Cu74y1Gs4hI7dNRTrGSnnrTTzn6iHNMUbGa1yA4kESGtbksYGf0z?=
 =?iso-8859-1?Q?tqUW+QffbPj8T1Te646hg7bTb4aU/mslNSPi0uxK/7lxjf/7eAC6Tkr/xE?=
 =?iso-8859-1?Q?At4TDpf1qFDzDEohHj0tGzVj0rjMqRBFY4UU5C+xCBQ+lfq579C+W9YwqP?=
 =?iso-8859-1?Q?nIfSeHiJIsgAqQwJrZZDJmemEzz0zWB/1a9jUyvnMSckKzn3SLJ9xXlmtm?=
 =?iso-8859-1?Q?TPFpkVHxS4ut+juYak+GQ65gAcVOL/tNR0ZWhpUPqUCiiaaOTufI+IJVLw?=
 =?iso-8859-1?Q?qsYO24xivjBSQ2UDkHcALKAeKoVy4EyaxJL1tyVfOklE9sIWfOArMnhb7E?=
 =?iso-8859-1?Q?G0H/CGzuR/e9jmJLzDR5IHWG/qhO08/JLfsfJzW52GNb03mRXFZ8Kh5WTw?=
 =?iso-8859-1?Q?tTotUcDDyjnIdnAbtGta0ZWPyLpAPD4NQwiQTR6VkpYi/cS+FApOJqBnt2?=
 =?iso-8859-1?Q?5ynNWgRdwtw3Byk7vXhonp54thCzYQ/ecQS/oXh4HdmsHki3R0wi+XRD4v?=
 =?iso-8859-1?Q?y23cfXY1ULfrnUNQ48WXblh0LUZWai4Up5zvlOTd8qezpeyPNT+afaMFxL?=
 =?iso-8859-1?Q?x+Bc0FieL0m9UOibXhCL9/dQjNqx0E5aNGajZxjFIBmM4Ror2pH6rv1Haw?=
 =?iso-8859-1?Q?Muh5PJ/fM4TsOzWAoULm0m3SDfHhNgZoMy9dQGE3Nho+a1ymkjr2DxGCpr?=
 =?iso-8859-1?Q?xCThp4Idiouj1vpL9VISMTifk/ofomtz2py2tFIKsSWFmIJi3HWYVmMWlQ?=
 =?iso-8859-1?Q?TO4aurADp7QZ8fluOdZh7VyRK/xgnWZkN57olProdFkWCpNDamsxQ7itGr?=
 =?iso-8859-1?Q?VzNo/lgI96Rt8a/6FV+mslW/UZge+WRNEO3oQizBTVHwLRFyoPOV8uBQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc79ffe-d6db-48c4-fecc-08dc8645318c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:24:52.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7W9iVRfLIvmXMwSWOuPdePoNEYnpD1YwMXxlSEaVQKFrgRa1TUItzQMMdS8OZz3cuJeHeNrBKXHb7spK3Be2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
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

On Thu, Jun 06, 2024 at 12:21:57AM -0500, Lucas De Marchi wrote:
> On Thu, Jun 06, 2024 at 02:55:23AM GMT, Matthew Brost wrote:
> > On Wed, Jun 05, 2024 at 06:13:42PM -0500, Lucas De Marchi wrote:
> > > On Tue, Jun 04, 2024 at 10:50:41PM GMT, Matthew Brost wrote:
> > > > job->fence is not assigned until xe_sched_job_arm(), check for
> > > > job->fence in xe_sched_job_seqno() so any usage of this function (trace
> > > > points) do not result in NULL ptr dereference. Also check job->fence
> > > > before assigning error in job trace points.
> > > >
> > > > Fixes: 0ac7a2c745e8 drm/xe: ("Don't initialize fences at xe_sched_job_create()")
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
> > > > drivers/gpu/drm/xe/xe_trace.h     | 2 +-
> > > > 2 files changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > index 002c3b5c0a5c..f362e28455db 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > @@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
> > > >
> > > > static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
> > > > {
> > > > -	return job->fence->seqno;
> > > > +	return job->fence ? job->fence->seqno : 0;
> > > > }
> > > >
> > > > static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> > > > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > > index 450f407c66e8..e4cba64474e6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > > @@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > > > 			   __entry->guc_state =
> > > > 			   atomic_read(&job->q->guc->state);
> > > > 			   __entry->flags = job->q->flags;
> > > > -			   __entry->error = job->fence->error;
> > > > +			   __entry->error = job->fence ? job->fence->error : 0;
> > > 
> > > we already include xe_sched_job.h in this file and even call
> > > xe_sched_job_lrc_seqno() a few lines above this. Why can't we call the
> > > function you just fixed? With that changed,
> > 
> > We do call that function above, it just is not in the diff.
> > 
> > We don't have a helper to go from job -> job->fence->error hence the
> > open coding here. I could add a helper if you like.
> 
> ahh... ok, I misread s/error/seqno/ thinking they were handling the same
> thing.
> 
> let's just merge this as is then.
> 

Merged. Thanks.

Matt

> thanks
> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > > 
> > > 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > 			   __entry->fence = job->fence;
> > > > 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
> > > > 			   ),
> > > > --
> > > > 2.34.1
> > > >
