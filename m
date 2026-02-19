Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D469E9A05A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 19:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A225310E0A2;
	Thu, 19 Feb 2026 19:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlGa5C6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E15510E0A2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771527609; x=1803063609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rpbJE2tAyG7bqNS+86WMjuILCZcsfbMFQqx1km+GKto=;
 b=XlGa5C6q3Ik55EYzXTOfONO2uuIuhuJRWRG/kFTHlC311c9Hr7Vpuxpw
 h9c0ecR48iYZzuiV6eZjdtsXl94pUb0Ie8J7DGgzOycHMgJcP6OsM2Ejp
 0qlUzSeCATY/l89O3vQmegECVGyr6CEdA7nhIzvPqEt/0eFdOt7xArtMe
 HVnsTkKnyiIVO6H0spvFEOVhoidBLMf95q8pp/sgVtdri7qYnf4pt01zf
 etxI91HGIvIBOLFe0ErHpLPYaQh5b4SV+VP7rbpdOkBFYLD5hrWP1qhOq
 4iyPmYBLgz+Q9TuIRVuXJe5Qv3/gDtC3fhJm/bMAS2xa62p0rrpOeGIAT g==;
X-CSE-ConnectionGUID: 7yGq5i+QSOOxu5UyOrQSYw==
X-CSE-MsgGUID: k66pvSM3RVGpNXXUQ+hWaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="98085419"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="98085419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 11:00:09 -0800
X-CSE-ConnectionGUID: dpFhnVm5TjedTCzyEInOyg==
X-CSE-MsgGUID: sqxieEY7QfyRBD+cBzC94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245204027"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 11:00:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 11:00:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 11:00:08 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 11:00:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w54MH3u1XsyHphPVcGQndoty6TV0m8O1UMm/cW8eSoKe+08YiRjuXtyT8pVNeb9H02FXWSWijDiPWAWQyneuBPUB8s7l3+dQV580rZXtXlbamG7sK8XlDRqLT+4gjHELokjkb2POF+kN/eRvdDvF5S8XOcbjH49vi6NqnSOzAd82vsjPPZ+ucmND6syxA306+ppJHV+oruMe1rvjTybNyOX4Q7K2PTrJovayKg/BybRTTDOuB/UOVy6D9yyAtPHoyWxxdaThbRyrcs/awNkaRvvklcPGQWc6Dkax3xQjREinrEwqgFqd1joeTGZyLsNQnxdi3VOO0i1PvQ4LyKr2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX0o1MeFf5NPdNESErpdwPc9GAOeb86QcVK+xFh7WQU=;
 b=YEcX4eSsdVOmMaJoQMZYhgNEYidr/VDlLZCyAcFOce839HwTt5iegYOin2PWmPPajbh/SVX7scbLsZ4hY9ESWxY3YEdQk106f5MLe9mfV+7RRRLGx3DuWG/XQXUBpjFyHqTDhlhjOvV7JqmR721gznzLEa3Gj2QGqv3zZ2wRoVLr/cLWELZ4oAOGYCkKEjhMkNY0SAWWt3saPdd1SwdiiYDGkdBj9bDFJGvCShETot+u1AwDe8DAlfL3zCKSaHbJH/EhSmpCmiqLxyDjTzyqpI6Ix+TiooUT1p9yp2B/IHb5o45t2ju+lhTlsrMBFIGylxjXeRGXsO+nTu5XZZugQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 19:00:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 19:00:06 +0000
Date: Thu, 19 Feb 2026 11:00:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/vf: Avoid LRC being freed while applying
 fixups
Message-ID: <aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260218232159.1726873-3-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e001e5-712c-47f2-aa95-08de6fe918ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rNcpx7ELq+QToqFbHp9JVXcxHTCmZzlmYRwUwkzbhFx+lXXRYt9NSP8RfNut?=
 =?us-ascii?Q?fmWzBCVyGTzVWcKMh9v63ury1deYi9HD6ZkYDop3ZDSbws4DLndf+JKeUrI/?=
 =?us-ascii?Q?B2GkE8PFjRPxH6d/mDIKeepY5FRBee1CseYsLILpY0bftKnD2gHMgfiTcgUW?=
 =?us-ascii?Q?YSzFmAv5i/kkCKgjBlkj4eeobruHVQyv1Jg4Bpvj2bMmR2zMbqZxIcjdZYcE?=
 =?us-ascii?Q?ZSrNATEhC/pKlqHItSRcTpC2oN14d3dvgT5PiEbVhArjFifeSPIKp67vDsyo?=
 =?us-ascii?Q?PYZbKxwuJsIhYi+EHlZPh3eKrEF3MRQ8BuQM5qMxusTKkOzXrllNPLvUbK+E?=
 =?us-ascii?Q?b/O9Hf9c7XZE+m3JWGquC5q3BA35EoqnzBBiDF16eSCsRvFJ1DGOZp00JlqR?=
 =?us-ascii?Q?3cDbLIq6vqv4mUzO/rg3/8EjIxMu2dSxQJlzfGneKgI2a8gZKVdjW3+hL9Wz?=
 =?us-ascii?Q?V8B78djIofFXfPQO8ZFF1ERJ3NtAkzvr7+zVIMbmxBgpJNVRlTJLqUqk0M6K?=
 =?us-ascii?Q?WeChT+bBxFry2ycSvWWvb8gvHd7l3OLvjeRQp6xhFqaZY6OhKYK4v7B4ApDr?=
 =?us-ascii?Q?/6cKHDCvK0zgWfEx3JNBdnjU6ziym0frQTqFnQ/u8xbLUoA+50P8BbL5KplT?=
 =?us-ascii?Q?c7omL873jgqDopaPJoZipWqcJXQUQKiG05DXBMJKRVjQoJG1E1X6DTr4vZy3?=
 =?us-ascii?Q?QoivfpOsVLTKvLVO3bRTTYpqybOpFbXBQZH8w3dFiGakhS0kfgbonx1eKOdv?=
 =?us-ascii?Q?0Ys8FghbTupwW1w5dPIebEFX/aMlY2pWgBmN6iwUCcGOYM45J90Y9COd7Rw4?=
 =?us-ascii?Q?yxWOQLyPdnNPy2cG6euczGycuA+hHdI8P4bp1LYGwPHyia604Dfq4E6UvmJr?=
 =?us-ascii?Q?7K+VF6JW0SzMYauGoE4zpdGb+/CdDZAqnW7DERW4khQn+bLgYZm0/i3vTG6h?=
 =?us-ascii?Q?AO5QGD5WOCggUneAnNj3qsTTp+zgAgAbXUUoajIz0NEa68+yQ1rV2r76dB0M?=
 =?us-ascii?Q?DlpWF/S4avGAfdZM5OJDLFR2h5C2kA0txFrv8hJKHfILeBpEmC8+sIApwAkJ?=
 =?us-ascii?Q?9/8wfp2Z2Eu5sV8bPJW16BurjFOMnVLNtTuLUcryuogLtnemAG0d2Tg87n0Q?=
 =?us-ascii?Q?/psxa+svZW8u7L11T3boVa/uweNChAAAdC3ayu11OMSgPcrTaOCz2rSMQ+9O?=
 =?us-ascii?Q?iXQVJry+k5H0L0bILTn8f4q3PHwvYylv3qTqYqoAxFyx7pKw6nzBk561Bb8s?=
 =?us-ascii?Q?CFeQnjbdRGL8Ifzfev+ptj929RognPk7zaleFke7H+QJqTDjjxqnlrxmCohk?=
 =?us-ascii?Q?eg9dkXmVJAmeSgOfHu1nUJ2AmKKojNROkoOcMhGGwrxNS8+zZ2ruHfAfyuMu?=
 =?us-ascii?Q?BDIoqOfYnyQoDzQgx5MMABh4nd1GFbnCuc/grlEGZzS9IATLIM1O7bnu9w+N?=
 =?us-ascii?Q?wkRflVHM1aVmEprsjxLb8WP7GOU8T3cFHRTdCk8VipKz6udSOMPTzQqUtqEx?=
 =?us-ascii?Q?UHZ4MaVN4WX7F0yVKmoI4Dnjt34MMllKe2Ci+LzJFB0y8Tsh670nRRWTuQwR?=
 =?us-ascii?Q?Ia3IVulVIiCovAHhRcs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nevNTTQVAHwfPhoPdOxPn1hezCvTYvTG1aNi8sg4uLCNKzNeTyGVXFZMQc3B?=
 =?us-ascii?Q?KpGzdXJiPemaeOQEQNFIv450RQ0TJGDoYV8kmza2ZBv5LkDRcfe2dmwM1B+/?=
 =?us-ascii?Q?mbjxCB3xMY4lvsINDBJZzynYJQPQPLsXM1J3mwtNtC9v2+WRnPUVb0fcgXOD?=
 =?us-ascii?Q?N8+md8dV3PzvxJoLBZFmpN8lNevyyTrCxQmEX78thLadcs4qwobu/LnFOIn0?=
 =?us-ascii?Q?HrH4AzKuD/tqv2xsOUCRyp0p67e/qg/RESDmJ8ySuHf26PtKwR+WNOYqvB3w?=
 =?us-ascii?Q?6cEdOoZUuvftGct5iY8UylcRtWBwob3e8O4tyNg9YcNO0dpm6PRZxG3RVrGD?=
 =?us-ascii?Q?Ef3/ux9CBsEGUHPsSgSZjbT2eUSZnlE2x2hTDa2SxuQYwCHmzN8qzj/z5wUt?=
 =?us-ascii?Q?bW/kGx2LLRq53tFT4I4uFPE9+Tl3dIaTy0oyg/Hu0gdKZt1N/lZiXQKEm+hI?=
 =?us-ascii?Q?hniM+3HtVxdy7Ly65CLSoXq6xBLVHWo2vuELq9htE4X1DuvQY7bUBkH2ZGba?=
 =?us-ascii?Q?2Kb3CzTkkOBtWs4ef2zACwFlXIrdng41cx/F2W9wikBf0SrivBt8FfnPRXbI?=
 =?us-ascii?Q?raPGmsOB6rcOaM3SazWtW9kXPOdRAzFvvXdDsP0XOkZwOYNUwMp96MRP4ywF?=
 =?us-ascii?Q?nBgG0uCbve1It5GLSEz6lB5DlaJEPMhLiN38tM5Djgz3XrO4lOc98jrXo2/G?=
 =?us-ascii?Q?dc60iXwKsTrmjEweGLtnR/PZSkuJe3TqIoSbvsCBUzxF5H4KLv2i/xmaL7bo?=
 =?us-ascii?Q?0pDKIl4hVczqKrm9P6nLKBCvNPuHI7ahGeFAaalyPNA33opt3xIbRDnKjFV6?=
 =?us-ascii?Q?jnnHHdBSBRoUIhYFf8hjHreezD9bd/t7Au+/EcqtpQg7XldZL5dl4yyrUlt3?=
 =?us-ascii?Q?GcIUgzyqyywGiNwyUjXTRKdu0kiej1j9I5y1/xnfJ+oC+w3dTUNwhJWInZw9?=
 =?us-ascii?Q?oGRUhcwySsp4CGGOAr1poGXCwSJ2I9v/fspQ788QKSAcWeJxYTspYcYXcU+J?=
 =?us-ascii?Q?Pv3s1LCf7N7JIikuRnwnhXZX4LiHo7/CzJaRTmGxx7K3kNgPsOGUk8MoBNVp?=
 =?us-ascii?Q?GuWI0KVAHs+I3WlAxIWDxldTIBLXD3eiDy0CLLi/buCbN424loECAFeZ4gs2?=
 =?us-ascii?Q?E1bZxYvdLYVfnmritQijVv+OPSIGBt+1yFUy+XhoHa80gnxVZwEz8xZr57Us?=
 =?us-ascii?Q?JUZbwhTyMANUxuKNIHYs51HntXYdWVCNJOQWwr5CldLCyaYHRtVHApicJFCX?=
 =?us-ascii?Q?mbAE5wFOKcfP6l1j8hqD7HC0bihiUgvzr9utaMcd/yEgMYO+3XhXHdUG7OlO?=
 =?us-ascii?Q?/1k2pWxHP6aUmjAlmxrcH0XXOvnk4MvBnd8h4ux9YeudvkLBXOzXEGyCMZfK?=
 =?us-ascii?Q?vx3TSXJpizGxALYpPUJlaTuGu0h2fDIeYLVOIPmZk6M8xOxmzur/9FPpKoCu?=
 =?us-ascii?Q?79I8Qf4f6ap34gd6rPziB5hstfvzZnF6w7WyUHlP71IOoEdewDztlJqbqrAN?=
 =?us-ascii?Q?tzR7iRXOKMIYxybJ0FYMcgEKl64r5vkk5kjXNnzfD+wif/Apixrs9QUbPLuU?=
 =?us-ascii?Q?H4Cy1ay4BxYZMhicOCWWFmpTWSQJ2bHMRu1/NC21BH5on6VUZInQ1Nci3Hq7?=
 =?us-ascii?Q?7ACaAJmcBGarbf62dluThm0NXOTpmNH93XgqEdWcgv4r9tSVncy2gxISI0Tx?=
 =?us-ascii?Q?vUIkUmj3MPzEc7xl55PxFOLZ1rsLvrmiE5OQdeIhInzetsZoehs5M2WGeW8K?=
 =?us-ascii?Q?htpXyvNdRRV1jwVk1Zv0skVYjqqQUUY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e001e5-712c-47f2-aa95-08de6fe918ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:00:06.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWkLSYKPFDG+Qk9SSYNKy3ECpeafaehv6HljjpJKW7ktdGlbBmvbKcZPqEDYuImjDFxUHm1bvQNvXtPXmtetZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

On Thu, Feb 19, 2026 at 12:21:55AM +0100, Tomasz Lis wrote:
> There is a small but non-zero chance that fixups are running on
> a context during teardown. The chances are decreased by starting
> the teardown by releasing guc_id, but remain non-zero.
> On the other hand the sync between fixups and context creation
> drastically increases chance for such parallel teardown if
> context creation fails.
> 

I don't see how this is possible.

xe_exec_queue_contexts_hwsp_rebase only happens if the exec queue is
present in &guc->submission_state.exec_queue_lookup.

 332 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 333 {
 334         int i;
 335
 336         q->ops->fini(q);
 337
 338         for (i = 0; i < q->width; ++i)
 339                 xe_lrc_put(q->lrc[i]);
 340 }

The removal from &guc->submission_state.exec_queue_lookup happen on line
336 in the above before. Thus a xe_exec_queue_contexts_hwsp_rebase can't
be executing on a 'q' after line 336 returns, then we drop the
references to the LRC. I agree this lifetime is questionable at best
(IIRC my GuC documentation explain this why this works) but if there is
a problem it should be fix with this lifetime in mind.

Looking at __xe_exec_queue_init, I believe 'err_lrc' label should
actually call __xe_exec_queue_fini.

> Prevent LRC teardown in parallel with fixups by getting a reference.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 42849be46166..e9396ad3390a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>  		lrc = READ_ONCE(q->lrc[i]);
>  		if (!lrc)
>  			continue;
> -
> +		xe_lrc_get(lrc);

This doesn't actually fix anything. The LRC could (current, in error
paths) disappear between the read and get.

Matt

>  		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>  		xe_lrc_update_hwctx_regs_with_address(lrc);
>  		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> +		xe_lrc_put(lrc);
>  		if (err)
>  			break;
>  	}
> -- 
> 2.25.1
> 
