Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B32C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 20:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ADF10E584;
	Mon, 28 Jul 2025 20:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHPdZd5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FB210E590
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753733272; x=1785269272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=femwK31Gf/H1HUCQOp5Vn5ab1XojWHSfzfcks58eLs4=;
 b=VHPdZd5bkMfR4KlZe2SOhXsXq5a64n7fQaNkjWnrSsyX0VjmJ16+h48K
 sEjiOw5X1ObrwoE7RztTjdJGSVqvkgFUqTTkql7xG0fekzTsvfYPw/Tma
 QfUDiG3vHR9iOtbN78TmE7dKBubFipx8NbLfVFnbLnQduY8ON3VqZwzFG
 Pxiko7qGIT981QiujdcrhXk5dKI4VUyJ8U14Q+/HYzlyGVDTY+/2Y6Xnj
 jCG8dnjLqH1Kxt1eBz91QEsBU48dKTOJcVXhEz0M5Z/okqNqwsdoTMopM
 TFM6T5M0ty0LdOGMp2t40F2nCC/GBjsLM9xyzq0U3TqhW9GPAfkxf7a1l g==;
X-CSE-ConnectionGUID: hnPFONUdS2mjD5J5qh+TXA==
X-CSE-MsgGUID: mbAHX5H+TQmDPWKpZgJJcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55930804"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55930804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 13:07:51 -0700
X-CSE-ConnectionGUID: nXtDPjPjSJiuICCnMUAA8g==
X-CSE-MsgGUID: f2zLQ3KEQQeT75fQ9/qudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162958625"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 13:07:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 13:07:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 13:07:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 13:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoqKoUeyRjyisJHBXM0pXaCCyWlI9vraZmX8JZWBsLE4MJLBIFaLBdTcB0sEOBrmN5nmi3eCnn7ZVFKLDbwqzDv5zcI2CQ/jRm2nv5tbvEnp+vbyzUQ8sWYVeILRf1unQtqzwFiP9jYjGJKpL5r1WWRxBpsqy1325Gwa8xxdX3JFqixvRUsfyKzS6kaBs80YlhVW40aDsrNAffHLfgPQdLl14FRvdJeRcOk6M19kIm1gnwLlOKBjTOuTZJc8kKIoFrTSTXuFxfSSj3+0QW++MrxO5qPk4viuFhff3+3WsrtRfVxAn0IjAasLCbFDxOFFvYuq2U3Kqmn1+M2uLhg9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp/nFEoEhCTPUA7lN6MjPmNWozTnqRlu8B1EpWcrHq0=;
 b=F7RGBeU8iw1iqvqi+Q3xO0drm9Be7BeRbCO1hAiOhUsfS7S2AstSzWFkAdsyWIU3Fl8/W8gWT7fH9FznHpuxMvu23l7W3MumF+ZD9bp62cD7WVFW1CdsQLGllRi4q6YYNvLbNq8c3bpePONpEWr4V97ZMV3mHKcVT3pZ4Ax1N3lOYLtli5Rx8fGHN8RBCCMF1DIkLHMLY5LhlXOReOeHf+oW8vJJ3xXBWwuJeKvWtxxQbh1VZQIJtZT4OoSFQ2ct3jreSLcd3G8DwncA+f7+Bh98hh7Cl9NvuNH+ZKACq6lSYWbJHkaVnsNJWOrYGt5Uj4qM9zoCX0LvxXusiGeMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PPF7C7D8332C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Mon, 28 Jul
 2025 20:07:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.8964.024; Mon, 28 Jul 2025
 20:07:47 +0000
Date: Mon, 28 Jul 2025 13:09:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe/svm: Migrate folios when possible
Message-ID: <aIfY/1kQlmeFRB5G@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-7-francois.dugast@intel.com>
 <aIQPyTnoaPEIA6zI@lstrano-desk.jf.intel.com>
 <aIeEwt6Kg4lPQCTz@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIeEwt6Kg4lPQCTz@fdugast-desk>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PPF7C7D8332C:EE_
X-MS-Office365-Filtering-Correlation-Id: 172889b4-ae19-49d8-f850-08ddce126bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?znKZv+orKLbyYwBMm0Il6+WXWjXojt6dQNwa9yfBdJelVACEYQI4h9Ea8Vih?=
 =?us-ascii?Q?WMWeN5ac7aAmvg1Py+LzYVLDFhSN0ImE6r2yT5sLLgyerqqttWbMH3BHnBHy?=
 =?us-ascii?Q?kiS9SbWDz2woghrv37j7ms2bZazm6kYchLVQPv5SbsdUKQO3+F0Q/pO+3n7g?=
 =?us-ascii?Q?E0RBQy/v7P2ux6SV+9gZkezLJQfR5c6brA+9t+QNtFsJLJ3UjRF/Yohr4t3y?=
 =?us-ascii?Q?VPwWvBUSWB2FuTNw1wwwn2YZprbpxjnPBIXJJYL8MkehoqzsbkOJ0l+YMktF?=
 =?us-ascii?Q?IaHhWiABdbFl1U27D1qvAeY4L/IvS1eeJBQ/Nn2RG0LX+6lbdObzoiS4iUGv?=
 =?us-ascii?Q?lHRvwpu7UG5etSfEixWb5SHRb32Nui5qE1kV+U1iv2YA7TTsdXNjXfU0hf+X?=
 =?us-ascii?Q?wR1FsO4hQUzr7MmURiqbLlGTUCqJM3lLNJv8TCLBVhsDoWd49+2/iniOrFFN?=
 =?us-ascii?Q?8SklPYbvxo+XZjCWGaNk7+1b51FtqLEffKZQorxw6lIQRthqTGSYw0G2KhWb?=
 =?us-ascii?Q?SzE8CBrEHtXO7fbcoInfdvF30vqZJBg6wcBKKYznPAQGhdkNMF6/3z0i0oFq?=
 =?us-ascii?Q?OrTzTNb2oTp3Vp4K788kGN8yjFP3vwLPWhaj1hHToLHTP6NlqJRsiwgoSkm1?=
 =?us-ascii?Q?9tiCd3YIzz9VhAfOFp0ZU5IEvogM77xHNtmAJg8kdOM0RZJsN6udz/ioelEq?=
 =?us-ascii?Q?ADrK5kIMRsZyjResp3Z7/iViTNdtj3s31Cm/Vbz9tK1tHqDYfDuckw4n633M?=
 =?us-ascii?Q?Dcs0CtjIQ5nSpjkpxk03+sDV9g5i6jJGTV51dOYgsom1bYIcff+Nn8h34P8H?=
 =?us-ascii?Q?RXmeaHkuUdITN/wWyGhDAgDxnMltD1n2VimP3QwiobA9wIoXNI2HcCWlIR9Z?=
 =?us-ascii?Q?vTMtPBek5BuueITIG/GnTOXfxVuOJsyPmdIGeGe7tFBSUdocNPnMjFcqdV+r?=
 =?us-ascii?Q?2Qb09i2HAuzkRH+vN+G9kIbtQLEjTzZ+Uu3yomKonKCi28JOUOKEEHojvUaH?=
 =?us-ascii?Q?5XKvoKRwpIXOL5KoUJUDViMHT/Xz9sK5BRuRc7DIKfjsQZAft2Szwcr+2Bd2?=
 =?us-ascii?Q?x4+0PmA4cuDbxgE93AS8CC7HDtrZ7Gyw9e6hbbVmVzyzxO46MY09kz73ckHI?=
 =?us-ascii?Q?xGH/ltvWoJqK4RRm3tHIUsMiMATov4qNd5ogZ09+rjC6wDnJo0HB/akzZBBO?=
 =?us-ascii?Q?yT8W/8LkrPaJO3+FbscS8pjQzjQvZg+4Pbs3PjEl9Zr61RKYphBIL5/3mYsf?=
 =?us-ascii?Q?rVUBs2E62n5mGxLtqfsxYfW7AZi0S+AnAQUlRhx1PntbgtS9bCcht5C3/lpo?=
 =?us-ascii?Q?iwAJlMfEe8k47PHDA17MMi48b0C64PFdAWjib/MY2zwxIBVGrNJztzoLWZn3?=
 =?us-ascii?Q?qvyaRjsfYttDYUwQAlRGXlvy6owR+h5qnw7pqM4eDxFPyNwuj/ZU/fe0bjeF?=
 =?us-ascii?Q?ftVLZY994P4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xpRaZpCW9sLWzVWJ8o+C/qlnqBIBcwrUPxxasyYKnwo9tjtjgH390t10Quoy?=
 =?us-ascii?Q?3y6RfHen2+LyB6MesfiZeU8t2tjMztCd74N9oXFN0cMlf4L2XiW2fpJ8xO+Q?=
 =?us-ascii?Q?8l3M2Tg7dVUhxROylzhfwITIlYcUw+SAgQLWkJ4KcHmVWcvzwGZhDtRhxhQK?=
 =?us-ascii?Q?R9f+HsDkyBcRbI+1oXKTTjfNDtmXnc8EIx/j1Spd2JKJy2XSCaSUKzAR2OPq?=
 =?us-ascii?Q?2IeffKtgGBAEmCveEry0Zo5xBpn4isQ1Fzzcz11IMbC3CKlntDGBlheccKZP?=
 =?us-ascii?Q?xvTpnk7jUa/2kMNPwUPzzdhpov7VliomGLwseQ3RKy00lNdETFcqLsGsYisd?=
 =?us-ascii?Q?EkEWgggYl8jSOy7s0jIMxeqfuNxKJZQG84EFAsCHAzlk24skRkxt0W7NI7WK?=
 =?us-ascii?Q?ZorTmkguOIJfjyD48dirth1M/HwLygF+q5xoqrWJ1HnExBOpL8qS8KzetbMb?=
 =?us-ascii?Q?igDWGFlBCq3p/O/oqUq0d5PwggOEkzhsXWs3ilil/mPaWncBrdR1VMG5z+ik?=
 =?us-ascii?Q?mTsoaUXpM3ALsbg4Xk88nX4wXfyUu6uQ/doI2U8upvUtP+0/hNluM4Ca6U1y?=
 =?us-ascii?Q?F/WRFMNQc2nIemx7b1AAmCNa/XS+yh/uLowWbDWo8yla+2mElo6UK3XH91uL?=
 =?us-ascii?Q?t9dsotBZSo3omAGjPXp4fq1pMquqTvocuqmWgW3+sMHT2x2VacQnIjhmHbuG?=
 =?us-ascii?Q?0YOyyhOpiwzroYYxWy/H8hqKOzwcLMIRyqLeBwZzokEfi7f2MDhhNNSg5WMU?=
 =?us-ascii?Q?U5+yj7JV7t9k9mWi78jhBkHgZO34iLaaQZrvqhj6AsH69ulLVRdTOYNL8wE9?=
 =?us-ascii?Q?+WN/uPEVIOT/rEA5nhzXofpnEqo/rBoUYBt7I2bgRpbGf4cr6+KF0AipYXwu?=
 =?us-ascii?Q?7o/VJvFiIxDsBhz1j4eVqQMPa3+FPRDg3qOB4b/mq8qm33GBet+1uaCwOZgb?=
 =?us-ascii?Q?jjW8mm7s04TTkI29XvfnZ1pEcmp2o7jJ3jDnyo2qbmvpYZ8gPiIe+qlVS/4W?=
 =?us-ascii?Q?qq0sRKtGqXDkGD4abyFl5ozVtS3dVsQzEtUVXwfQMmL/ADj4PFmm0Qvv4uEe?=
 =?us-ascii?Q?GAOxTDOFWvcqm/Crdy7Q4JKyamiFUWZ7t4fXJ0V+M3g5yRv/tXP5edK1BOcY?=
 =?us-ascii?Q?R/ManXEQ4sMzqo96I5jBUlsPfnySQEnO8BHCwa+ejzGvhbEHOVzroMIzxwi1?=
 =?us-ascii?Q?5cQNQIlxanfI3CN7MTfxuBeB8sPJFWw+rZGFniforNL8rRbKVorHH+XaCvDA?=
 =?us-ascii?Q?iKM8QFISMqkBTId0kmId3csVuRyU8hIRdGaOLPBWRSTmG0kazZwxiJOMGC/r?=
 =?us-ascii?Q?7H/RgOCFwM2v4IE4FL5y8u11rCIkjYJYcHziK55h9anuKh2GqP+D0Xt0eT1K?=
 =?us-ascii?Q?ZOgVbdw5RIQvKGkvSZumbDd1bEbJgEiRzVAPixi98XGkRlvILynVKnkwUhB0?=
 =?us-ascii?Q?U7mOgTNK18me9ddS7MERIiwxiWqRm3fqKFyXssH9o1PAUxkkh+lSVFNmmqLL?=
 =?us-ascii?Q?7smaOq122uXCoaMIYmm+S2fhqE5G0LmMOJ1ARTNe/d5jrn6VyMfUkHXpu6a4?=
 =?us-ascii?Q?2cTC8nrpEQgFpXTShfCgCvMYkITnJk1PjktlD7/TQC4lFkGUeRTLLEMlZRr2?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 172889b4-ae19-49d8-f850-08ddce126bc8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 20:07:47.1724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PAG8A1fPNuTVYBU8Fj8uRyLETFjHd3bTa0NXNpC+tJFOlH1ZE8UdTwc3BXYV4S4QCmVBWBwms4tf3pxcFuVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7C7D8332C
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

On Mon, Jul 28, 2025 at 04:10:10PM +0200, Francois Dugast wrote:
> On Fri, Jul 25, 2025 at 04:14:17PM -0700, Matthew Brost wrote:
> > On Fri, Jul 25, 2025 at 05:39:30PM +0200, Francois Dugast wrote:
> > > The DMA mapping can now correspond to a folio (order > 0), so move the
> > > iterator by the number of pages in the folio in order to migrate all
> > > pages at once. This will improve efficiency compared to migrating pages
> > > one by one.
> > > 
> > > For this to work, the BOs must be contiguous in memory.
> > > 
> > 
> > I'd mention since SVM BOs are a max of 2M and it is very unlikely
> > forcing to continuous has any negative affects (e.g., extra eviction),
> > it greatly simplifies the code, and 2M contiguous memory will enable 2M
> > device pages which is huge perf win.
> 
> Sure, will add.
> 
> > 
> > We might need a small adjustment to populate_devmem_pfn to communicate
> > contigous memory was found to drm_pagemap too as our driver can easily
> > allocate contiguous memory, but we shouldn't assume other drivers can
> > do so. This can be done in follow up which adds the 2M device page
> > support.
> 
> Do I understand correctly: change populate_devmem_pfn() to provide the
> information to the caller in drm_pagemap whether the allocated memory
> is contiguous or not, so that it can let the driver know when calling
> copy_to_devmem(). This way a fallback can be used in the driver when
> the memory is not contiguous (not implemented below because this seems
> not necessary in Xe).
> 

More so to know if it can create folios out of the return pages from
populate_devmem_pfn() ahead of the copy_to_devmem() call. Yes,
contigious inform can be inferred from examining all of them, but this
would provide a quick short circuit to know it can immediately create
folios.

The pages in copy_to_devmem() should provide order, so need for an extra
argument there.

Matt

> > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c  | 2 ++
> > >  drivers/gpu/drm/xe/xe_svm.c | 5 +++++
> > >  2 files changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index ffca1cea5585..59994a978a8c 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -200,6 +200,8 @@ static bool force_contiguous(u32 bo_flags)
> > >  	else if (bo_flags & XE_BO_FLAG_PINNED &&
> > >  		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
> > >  		return true; /* needs vmap */
> > > +	else if (bo_flags & XE_BO_FLAG_CPU_ADDR_MIRROR)
> > > +		return true;
> > >  
> > >  	/*
> > >  	 * For eviction / restore on suspend / resume objects pinned in VRAM
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 1d097e76aabc..2759db5f7407 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -382,6 +382,11 @@ static int xe_svm_copy(struct page **pages,
> > >  				pos = i;
> > >  			}
> > >  
> > > +			if (pagemap_addr[i].order) {
> > > +				i += NR_PAGES(pagemap_addr[i].order);
> > 
> > I think this needs to be NR_PAGES(pagemap_addr[i].order) - 1, right?
> 
> Yes correct because i is already incremented by 1 at this point.
> 
> > 
> > > +				last = (i + 1) == npages;
> > 
> > Then set the chunk here too?
> > 
> > > +			}
> > > +
> > >  			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
> > 
> > I think the match can be dropped actually and just assume it is true if
> > we are allocating continuous memory now.
> 
> True, let me try this.
> 
> Francois
> 
> > 
> > Matt
> > 
> > >  		}
> > >  
> > > -- 
> > > 2.43.0
> > > 
