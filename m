Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAE3C531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 19:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20D610E3D5;
	Mon, 27 Jul 2026 19:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cClktGif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A9210E3D5
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785179518; x=1816715518;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AwRHax7XHvqMEEvS1bB4+sysAmCqLRrBiBpUpA+8ijo=;
 b=cClktGif6hmUCz7JP4azADiEyp+KY45Gj0AVIgkwQpb4qzwZiD37lh2O
 fkjob5IAkv14Ro4L5AmC4aMTo/CE3t6ODy7o5tuLZ+f9l/hNi7kHhMRju
 ABORnAafb8rkyw/TUIVCiR/M5rGFpJhWja1wiB1sw1et5vprhu/8P0NEz
 ukOT/fox7T9V5ngx8AWTmBc+/nnrK73fn8pa9ZSZeKz2JZs1l7E8xnQMj
 V6Q86qQc4ZX/x0nw/al6yRQk0/LWoSuw2sqyTB0mGnlD0G88MyYDi5qxv
 qN/5EDrihWh1UsqiQ+9wQaTjb8jAc0S5Sj+UDbFp9Vgh5Ym790aysksuP g==;
X-CSE-ConnectionGUID: TGXQ4lUOT+aYPWMjqVKJBA==
X-CSE-MsgGUID: rJFQ4I9sQ4WmQnhlwe555g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108550979"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="108550979"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:11:57 -0700
X-CSE-ConnectionGUID: /euH5Ll0Rsm1Ek2lnRN7WA==
X-CSE-MsgGUID: oQeaHbOYRQSubZAjQT2v/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="256818174"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:11:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 12:11:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 12:11:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 12:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGhWcnJwgOYaZGdWlSiVxB1rk4YUKysle7maJmGM5zlfJ1C7OADfPLDm1CVj9xFMCNeN6cv02PfkGw301ULygJOX9OIXgXE+iX/hjTpa5NffX1PGkq6Y9QXhK6dvvUhEQhhxeTAP7MKmSjADz1PEV7Yex/N2RgIdum0EA2UXgRJoGci77FT1Mxzz0wM3JwTd3ZO0FZkQpJJRnvx+/20O4830E8lhgpb7jmJb08NiPfNxfNXE4kweaLP8vJTaPu/aWCM846cubct+S/nCfceTCwo8qyMKK+OQ02K84yPlNttq+5y0GsScF5xkJx9YGKzx0ztd+wPqwJdqFKDqH/pUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdCX9oRo03HFaLMKbZZDqoAZk//gJxNjFLuyUJUVc0U=;
 b=wlalhjTL7BhcC/7jB1KykQ4z+3FmYJukSAISBAVOlqgXX2pFxJWBL+X8IBIUxF93oSQJFanu6JMhaL7uURwxH9KiCLo1L8gaI53tIefaNM+TaHEoM+iEsIJGZTXLcQNWUTJhTlzvqPe2MEpGW491QYWsc+pxmzz9pYRbV6xBOvy0cWDxrpBi6bO4BGLrPHBnVYq2xuRL9shCr8rBT1yyJhz7xJC5DRDI7Wktp3WerWpGh4F7c91rMUO7Debyb2GPC38EXjJP+5jNrGcWQL9iQx8+R7vFdxJnVJZ6pim6KBYXOkpG8ims8SJa362BE4lNPLVE1vzHiXIfz6m3CqWQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:11:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:11:54 +0000
Date: Mon, 27 Jul 2026 12:11:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Copilot
 <223556219+Copilot@users.noreply.github.com>
Subject: Re: [PATCH v8 03/12] drm/xe: Thread prefetch of SVM ranges
Message-ID: <ametd1SyOn1/EtJC@gsse-cloud1.jf.intel.com>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-4-matthew.brost@intel.com>
 <ameMGby_tJBIi0Lv@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ameMGby_tJBIi0Lv@fdugast-desk>
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: c0dd61a4-1e33-4057-7ff8-08deec12eb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zsP8bDlY9lUDs75hz2+cy+YNstLJLZM8btvVUW3nQjy86aLNVvrsQHXH80iKwEiMOoh/MP93pT3CqWMjQqxLVXJRYuesoHrtKrL3cfgw+IOEZ+WiXxhNq2pxF8TOvhF32lguD2u64ishgzM67cpGgfXYF1wqSOVdQF/xQsLM6KzMLmmHRJlb92ZWjGCkNKwDZ7kni31VzopaXqo4B1mll7iZ85NiTh/J3SHmg6WbSF7Mg2+F6S/oqkDM1lxvEqn6Nx3LTgYDA5ZHJQok+YfFZTPLg6QS0nsOC7ye/8cR6Un9CsL8ohy5qPotH5IhVh0iopU9TVJSvYnHM5erP7WMCKRmmGceytmj1G9ErXTXmNMeiYnrp0IYNt2qT0BJ+pnXVKykBL6KIg7l6i1USnZ4oi5viOPEl+ezhEMS5RuQbKbz9k2iMy0kXhaZ1d9X6JfU9aOHwVh1I+8d6zN6dTdprXHPhpYP1fNI07p0ABvdFkppIBFrKM+33DkE1b96c4VXhHuqb/oYXJBUpkrV1iIN9ptRH1jXC34fWuS4fc9zHD0ja8+fN+v6wF43hzpHO7h/94qy6EgMZTWC2ZgBNvT6XMrn8ing4ExtOVb9Rlb6G4HhLY47fmt1gpt2t8u0bqUchARgMcg4Hq9KS3QvjmlImIr8eK01svaWA8Q0GbIQlvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7K6RUC4l6ctgXj0YvKkDOn7jFMLQ2rTCIrPk+xdaZBZyzCn73et8Qdn4rP?=
 =?iso-8859-1?Q?tbSTPN7zdHbGMAZHgjvHwiaQKx4WO2gbSIJ+930pDlqA6yP1NUwAOoJDIG?=
 =?iso-8859-1?Q?jNbaYhHfi48hossaiz9qoiFx04mkrqoKNrNGEKGGZ24KrKpq3IBnVyxh1w?=
 =?iso-8859-1?Q?oHZt9O20RTD0ovh2iy4eXhfHhA5tuEUS+xvkCkzO++c4cdjqFihpA+FQnp?=
 =?iso-8859-1?Q?VtIbN4iK0luxu/rLMGSojDelHZn+xIdp0wKW3RuqmxIp/I1HpB+KSAmpFE?=
 =?iso-8859-1?Q?n48L70oZFG/YOiXDXiaVcjiI89OGF6AuZQscaZQqAEVfEeJylJI0QBPEE9?=
 =?iso-8859-1?Q?7Ek0iRvzc6lW0pGOhaWLXyz8dnAUSIOdBaeC6Qs/HuquAiBmpriNHSYoSy?=
 =?iso-8859-1?Q?x4KrDRjTwfcffwfLhNLGoSdCBiNZPH9mm9fwni7IiKh/cc+Bgml2lbaI4V?=
 =?iso-8859-1?Q?tcIIbKkX6JA7b7ssYmbjwbtsLT1Hh2uRKPW6D5LpKhL22SBQNseCegwYyL?=
 =?iso-8859-1?Q?PLCoHsnWOuejQo86X6o4jW+MDrP1lq3Kqsd/beSHgfenhCacb25E2Op8X3?=
 =?iso-8859-1?Q?fCIS9O4j0ooYqCh23DGJ7PQwjT62IU2rJ77PTaK/IsbXCg1Ck2uIRMie5g?=
 =?iso-8859-1?Q?LOUiOjXJ10I1/tBHXLbVKuIIMjuJ8HBLbacjdxgfsprWpcwOzH+IqXjOnR?=
 =?iso-8859-1?Q?1UCGvPQnQ/1ZTUbnS0+qSj9HtWaapBidrVrT3jxZnohoGCaeRAOp4BhqLT?=
 =?iso-8859-1?Q?l68sX4TjLccUU55F67CXkYReFYVZ+yDfTHggodGKITM1+B4V605s7lmfK9?=
 =?iso-8859-1?Q?SW1hy/Qu2kyL+BFCfwhNAReSi+zq354bseqTvQKTRzweqr9ITsespgOF/m?=
 =?iso-8859-1?Q?zqJAXhfCosDdbA/cSxubDbT4DX5vF5RjwSXJ3jf+0jdV23+9O2rGecKrwp?=
 =?iso-8859-1?Q?Uzra45TeFSFQe3TJHs9DQ7dX8eZ4eKIji4ehzEvVU7dGaJxpvvbdN5RqZY?=
 =?iso-8859-1?Q?vD47sHJh0aI26H3ajI4PX1sHkAYDHR9auRZD+5oS9+i0WrHIV6tBmIqRl3?=
 =?iso-8859-1?Q?xIK4Ts2Vkaj1zUHaBuu5aHsJCnsVtFIlFH3EnaePDUVqROPQCLzat1gg3X?=
 =?iso-8859-1?Q?1k2X/0U7f8lRs5sWfSc7w1kIU4X7iFAlFT7Wmnil4UpXynLdI+Pu4qJYcz?=
 =?iso-8859-1?Q?IBoW5MjYgmh1piIeBypMhdggQZAmQpZLp9TDKUovZ9B2i4pEeK5+JjrdD8?=
 =?iso-8859-1?Q?AB5vImyVmwkWg78xqwonKna+i+v/C/sDc7JApuY/paXm39a22hI51NvHeM?=
 =?iso-8859-1?Q?TSH3wT0W4mo/hwBGSbtV1w1pQv2Mk9nxmxQvtMnyQvjsn3PxnG0xOa7c6n?=
 =?iso-8859-1?Q?OcphaUXxySPxrpm1RKXQuYBSczHHdg9ZodXn9HEPJE76h7wa61zZYNHJdL?=
 =?iso-8859-1?Q?ongn8irla9yHF9bA0OmzRwUlOyt/pwr280gn4lgnRgxrE2WWp/GJ5fkrtK?=
 =?iso-8859-1?Q?Zboz9it7Tql5qKZMEhpN2GAWfp4vTr0bazPAXAwPZakx4eMRcFs5k8ZeV7?=
 =?iso-8859-1?Q?Fv+rGgiHyIgx8SZysm8/VMbb9n44IcvI3LoDPXWlnKeOU+Fjd80E+JLzYn?=
 =?iso-8859-1?Q?V2zWTeXRM3na5u6Apkm7o5VDTh2dqO8bsGzHQdlfix1+xjRpsltlPMC1V0?=
 =?iso-8859-1?Q?bnpMMgCZO6XC1gF9JMsX0NSf3sRQcur0ogtfDicf3ILVEWLJ4h5fDTkgae?=
 =?iso-8859-1?Q?LrCz+LqlmvZMAxr7tNMkwv3TQAp6F+HVoQxZtAWY3wIwSmZ4oYvgB5Yi4c?=
 =?iso-8859-1?Q?voFmNLZhoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: WUnCpEinEJYmtB7YKCbGPTldIGjfO1Fgstfi0iE/6LSwilpWbwtL2qTboyxG7aORi+0aFy6cVqy2Yrh01Q3SFJ836fUEXf544Bujoo8mxKRNdjNCzOxhX4qV78/J3za1joEzDChrzgYOr9afozYVZmlKMb+wMbY2nmMS2FyowdbNxaaKvq+GNsykuZSEzUaMi4h8vb4Z3vCG8jSXuNMdfsSsSsNgTXqllielrUKaob4cVH87cwatUAEL2XgSqiJuKDfisbZF2q+BwXr+OlMRSYNuoWPCipj419cYFmNHhGAz4TRK9g5ngL1STkGMKYcmS+VH2DsOw3ML1cjunctF7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0dd61a4-1e33-4057-7ff8-08deec12eb7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:11:54.0390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piy50myWtSli14qCMx22kR0yPqwUA0EToBLl1/LLgyhlOJIBjq9jrmCAkub+B2UOrCGbUySmaqShfNEuISAUWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Mon, Jul 27, 2026 at 06:49:29PM +0200, Francois Dugast wrote:
> On Fri, Jul 24, 2026 at 04:25:52PM -0700, Matthew Brost wrote:
> > The migrate_vma_* functions are very CPU-intensive; as a result,
> > prefetching SVM ranges is limited by CPU performance rather than paging
> > copy engine bandwidth. To accelerate SVM range prefetching, the step
> > that calls migrate_vma_* is now threaded. A dedicated prefetch
> > workqueue is used for threading so prefetch work is never mixed with
> > page fault or garbage collector work.
> > 
> > Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> > this patch on drm-tip. Enabling high SLPC further increases throughput
> > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> > of these optimizations are upcoming.
> > 
> > Since the dedicated prefetch workqueue is not shared with page fault
> > or SVM garbage collector work, page fault servicing and garbage
> > collection can keep using a plain down_read() on vm->lock: there is no
> > risk of a blocked reader starving a worker that a pending writer is
> > waiting to flush, because that flushing is now confined to the
> > separate prefetch workqueue.
> > 
> > v2:
> >  - Use dedicated prefetch workqueue
> >  - Pick dedicated prefetch thread count based on profiling
> >  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
> >  - Fully tested
> > v3:
> >  - Use page fault work queue
> > v4:
> >  - Go back to a dedicated prefetch workqueue (usm.prefetch_wq) rather
> >    than reusing the page fault workqueue (usm.pagefault_wq), so
> >    threaded prefetches and page fault / garbage collector work no
> >    longer contend for the same workqueue. This removes the need for
> >    down_read_trylock() based lock avoidance in the page fault and
> >    garbage collector paths.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> 
> I believe we should go with "Assisted-by" instead of "Co-authored-by".
> 
> This also applies to patch #8 in the series.
> 

Yes, that was an oversight. I fixed somethings on the tip of the series
and had copilot squash the fixes into the correct patches and this got
added. Will adjust.

Matt

> Francois
> 
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
> >  drivers/gpu/drm/xe/xe_pagefault.c    |  29 ++++--
> >  drivers/gpu/drm/xe/xe_svm.c          |   8 +-
> >  drivers/gpu/drm/xe/xe_svm.h          |   6 +-
> >  drivers/gpu/drm/xe/xe_vm.c           | 147 ++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  15 +--
> >  6 files changed, 154 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index b8d1726c0513..159ee16ee6d5 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -307,8 +307,10 @@ struct xe_device {
> >  		u32 current_pf_queue;
> >  		/** @usm.lock: protects UM state */
> >  		struct rw_semaphore lock;
> > -		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > -		struct workqueue_struct *pf_wq;
> > +		/** @usm.pagefault_wq: page fault work queue, unbound, high priority */
> > +		struct workqueue_struct *pagefault_wq;
> > +		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
> > +		struct workqueue_struct *prefetch_wq;
> >  		/*
> >  		 * We pick 4 here because, in the current implementation, it
> >  		 * yields the best bandwidth utilization of the kernel paging
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 80196e874e06..fd7ef0718153 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -303,8 +303,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  
> >  		err = xe_pagefault_service(&pf);
> >  		if (err) {
> > -			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> >  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > +				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> >  				xe_pagefault_print(&pf);
> >  				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> >  					   ERR_PTR(err));
> > @@ -318,7 +318,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  		pf.producer.ops->ack_fault(&pf, err);
> >  
> >  		if (time_after(jiffies, threshold)) {
> > -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +			queue_work(gt_to_xe(pf.gt)->usm.pagefault_wq, w);
> >  			break;
> >  		}
> >  	}
> > @@ -376,7 +376,8 @@ static void xe_pagefault_fini(void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> >  
> > -	destroy_workqueue(xe->usm.pf_wq);
> > +	destroy_workqueue(xe->usm.prefetch_wq);
> > +	destroy_workqueue(xe->usm.pagefault_wq);
> >  }
> >  
> >  /**
> > @@ -394,12 +395,20 @@ int xe_pagefault_init(struct xe_device *xe)
> >  	if (!xe->info.has_usm)
> >  		return 0;
> >  
> > -	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > -					WQ_UNBOUND | WQ_HIGHPRI,
> > -					XE_PAGEFAULT_QUEUE_COUNT);
> > -	if (!xe->usm.pf_wq)
> > +	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +					       WQ_UNBOUND | WQ_HIGHPRI,
> > +					       XE_PAGEFAULT_QUEUE_COUNT);
> > +	if (!xe->usm.pagefault_wq)
> >  		return -ENOMEM;
> >  
> > +	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
> > +					      WQ_UNBOUND,
> > +					      XE_PAGEFAULT_QUEUE_COUNT);
> > +	if (!xe->usm.prefetch_wq) {
> > +		err = -ENOMEM;
> > +		goto err_pagefault_wq;
> > +	}
> > +
> >  	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> >  		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> >  		if (err)
> > @@ -409,7 +418,9 @@ int xe_pagefault_init(struct xe_device *xe)
> >  	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> >  
> >  err_out:
> > -	destroy_workqueue(xe->usm.pf_wq);
> > +	destroy_workqueue(xe->usm.prefetch_wq);
> > +err_pagefault_wq:
> > +	destroy_workqueue(xe->usm.pagefault_wq);
> >  	return err;
> >  }
> >  
> > @@ -495,7 +506,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> >  		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
> >  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> >  			pf_queue->size;
> > -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> > +		queue_work(xe->usm.pagefault_wq, &pf_queue->worker);
> >  	} else {
> >  		drm_warn(&xe->drm,
> >  			 "PageFault Queue (%d) full, shouldn't be possible\n",
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index cc36addb4f4f..6a470a02fee7 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -148,7 +148,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> >  			      &vm->svm.garbage_collector.range_list);
> >  	spin_unlock(&vm->svm.garbage_collector.list_lock);
> >  
> > -	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> > +	queue_work(xe->usm.pagefault_wq, &vm->svm.garbage_collector.work);
> >  }
> >  
> >  static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > @@ -1051,6 +1051,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> >   * @tile_mask: Mask representing the tiles to be checked
> >   * @dpagemap: if !%NULL, the range is expected to be present
> >   * in device memory identified by this parameter.
> > + * @valid_pages: Pages are valid, result written back to caller
> >   *
> >   * The xe_svm_range_validate() function checks if a range is
> >   * valid and located in the desired memory region.
> > @@ -1059,7 +1060,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> >   */
> >  bool xe_svm_range_validate(struct xe_vm *vm,
> >  			   struct xe_svm_range *range,
> > -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > +			   bool *valid_pages)
> >  {
> >  	bool ret;
> >  
> > @@ -1071,6 +1073,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
> >  	else
> >  		ret = ret && !range->pages.dpagemap;
> >  
> > +	*valid_pages = xe_svm_range_pages_valid(range);
> > +
> >  	xe_svm_notifier_unlock(vm);
> >  
> >  	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 0d1f1107af5f..46be2e5c6f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
> >  
> >  bool xe_svm_range_validate(struct xe_vm *vm,
> >  			   struct xe_svm_range *range,
> > -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > +			   bool *valid_pages);
> >  
> >  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> >  
> > @@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> >  static inline
> >  bool xe_svm_range_validate(struct xe_vm *vm,
> >  			   struct xe_svm_range *range,
> > -			   u8 tile_mask, bool devmem_preferred)
> > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > +			   bool *valid_pages)
> >  {
> >  	return false;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d7e6644df4bc..7eed38b78e5f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2525,6 +2525,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  			struct drm_pagemap *dpagemap = NULL;
> >  			u8 id, tile_mask = 0;
> >  			u32 i;
> > +			bool valid_pages;
> >  
> >  			if (xe_vma_is_userptr(vma))
> >  				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> > @@ -2569,9 +2570,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  				goto unwind_prefetch_ops;
> >  			}
> >  
> > -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> > +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> > +						  dpagemap, &valid_pages)) {
> >  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
> >  				xe_svm_range_put(svm_range);
> > +				xe_assert(vm->xe, valid_pages);
> >  				goto check_next_range;
> >  			}
> >  
> > @@ -2586,6 +2589,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  
> >  			op->prefetch_range.ranges_count++;
> >  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> > +			if (valid_pages)
> > +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
> >  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
> >  check_next_range:
> >  			if (range_end > xe_svm_range_end(svm_range) &&
> > @@ -3151,16 +3156,80 @@ static int check_ufence(struct xe_vma *vma)
> >  	return 0;
> >  }
> >  
> > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +struct prefetch_thread {
> > +	struct work_struct work;
> > +	struct drm_gpusvm_ctx *ctx;
> > +	struct xe_vma *vma;
> > +	struct xe_svm_range *svm_range;
> > +	struct drm_pagemap *dpagemap;
> > +	int err;
> > +};
> > +
> > +static void prefetch_thread_func(struct prefetch_thread *thread)
> > +{
> > +	struct xe_vma *vma = thread->vma;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_svm_range *svm_range = thread->svm_range;
> > +	struct drm_pagemap *dpagemap = thread->dpagemap;
> > +	int err = 0;
> > +
> > +	guard(mutex)(&svm_range->lock);
> > +
> > +	if (xe_svm_range_is_removed(svm_range))
> > +		return;
> > +
> > +	if (!dpagemap)
> > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > +
> > +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> > +		drm_dbg(&vm->xe->drm,
> > +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> > +			dpagemap ? dpagemap->drm->unique : "system",
> > +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> > +	}
> > +
> > +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> > +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> > +		if (err) {
> > +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > +			return;
> > +		}
> > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> > +	}
> > +
> > +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> > +	if (err) {
> > +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > +			err = 0;
> > +		thread->err = err;
> > +		return;
> > +	}
> > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> > +}
> > +
> > +static void prefetch_work_func(struct work_struct *w)
> > +{
> > +	struct prefetch_thread *thread =
> > +		container_of(w, struct prefetch_thread, work);
> > +
> > +	prefetch_thread_func(thread);
> > +}
> > +
> > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> > +			   struct xe_vma_op *op)
> >  {
> >  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> >  	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> > -	int err = 0;
> > -
> >  	struct xe_svm_range *svm_range;
> >  	struct drm_gpusvm_ctx ctx = {};
> > +	struct prefetch_thread stack_thread, *thread, *prefetches;
> >  	unsigned long i;
> > +	int err = 0, idx = 0;
> > +	bool skip_threads;
> >  
> >  	if (!xe_vma_is_cpu_addr_mirror(vma))
> >  		return 0;
> > @@ -3170,42 +3239,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> >  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
> >  
> > -	/* TODO: Threading the migration */
> > -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		guard(mutex)(&svm_range->lock);
> > -
> > -		if (xe_svm_range_is_removed(svm_range))
> > -			continue;
> > +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> > +		(!dpagemap && !(vops->flags &
> > +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> > +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> > +	thread = skip_threads ? &stack_thread : NULL;
> >  
> > -		if (!dpagemap)
> > -			xe_svm_range_migrate_to_smem(vm, svm_range);
> > +	if (!skip_threads) {
> > +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> > +					    sizeof(*prefetches), GFP_KERNEL);
> > +		if (!prefetches)
> > +			return -ENOMEM;
> > +	}
> >  
> > -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> > -			drm_dbg(&vm->xe->drm,
> > -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> > -				dpagemap ? dpagemap->drm->unique : "system",
> > -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> > +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > +		if (!skip_threads) {
> > +			thread = prefetches + idx++;
> > +			INIT_WORK(&thread->work, prefetch_work_func);
> >  		}
> >  
> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> > -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> > -			if (err) {
> > -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > -				return -ENODATA;
> > -			}
> > -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> > +		thread->ctx = &ctx;
> > +		thread->vma = vma;
> > +		thread->svm_range = svm_range;
> > +		thread->dpagemap = dpagemap;
> > +		thread->err = 0;
> > +
> > +		if (skip_threads) {
> > +			prefetch_thread_func(thread);
> > +			if (thread->err)
> > +				return thread->err;
> > +		} else {
> > +			queue_work(vm->xe->usm.prefetch_wq, &thread->work);
> >  		}
> > +	}
> >  
> > -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > -		if (err) {
> > -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > -				err = -ENODATA;
> > -			return err;
> > +	if (!skip_threads) {
> > +		for (i = 0; i < idx; ++i) {
> > +			thread = prefetches + i;
> > +
> > +			flush_work(&thread->work);
> > +			if (thread->err && !err)
> > +				err = thread->err;
> >  		}
> > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> > +		kvfree(prefetches);
> >  	}
> >  
> >  	return err;
> > @@ -3336,7 +3412,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  	return err;
> >  }
> >  
> > -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> > +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> > +					     struct xe_vma_ops *vops)
> >  {
> >  	struct xe_vma_op *op;
> >  	int err;
> > @@ -3346,7 +3423,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
> >  
> >  	list_for_each_entry(op, &vops->list, link) {
> >  		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> > -			err = prefetch_ranges(vm, op);
> > +			err = prefetch_ranges(vm, vops, op);
> >  			if (err)
> >  				return err;
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 2f5f74fed9d2..68588b624212 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -556,13 +556,14 @@ struct xe_vma_ops {
> >  	/** @pt_update_ops: page table update operations */
> >  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> >  	/** @flag: signify the properties within xe_vma_ops*/
> > -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> > -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> > -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> > -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> > -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> > -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> > -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> > +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> > +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> > +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> > +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> > +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> > +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> > +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> > +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
> >  	u32 flags;
> >  #ifdef TEST_VM_OPS_ERROR
> >  	/** @inject_error: inject error to test error handling */
> > -- 
> > 2.34.1
> > 
