Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09674CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEA510E09C;
	Tue,  7 Oct 2025 17:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsmwrP+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259210E09C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759858779; x=1791394779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NCbynJ7W81y/D1+syXFIArGyjkt2yXeYqr9ytG0KA/I=;
 b=QsmwrP+YlJzVdtvVBDEDUh8CunvxqCkSNgj/kPlfDhKxIgvGibohdUJc
 mXpWThHpctzmhHBCvOZwnNIGbyHRULjWvI8pbMpyccXS02IjjgIIMAHqL
 ifwS4MjuRUaRhXp62PTU+ZMi7HxbYEfWolaTXVCZsyZ5SLHAW/fLu2d8i
 qqg5x5aLQbbmf7NZLLRv4WmAkgs293cI5X2oMs1lC+WI2dwi/sDOzWcFl
 trylL0LYuySK1ORqzDWISg4gp3QHwdAJ44HePplOwtd2ckNoj9O1ZGWLp
 vJcS/X6dgXgx68CdpYc6BQy1jqH4u2UPH3gzH8OCDz/R1OCWBBneOCbp9 A==;
X-CSE-ConnectionGUID: bpj7vlIFRbmeysOVLLr/cg==
X-CSE-MsgGUID: sM4jS6woRnqjeXhfyYf4YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72662075"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="72662075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:39:38 -0700
X-CSE-ConnectionGUID: +QlVcZUARiSveeE2lPXbww==
X-CSE-MsgGUID: vjY7tJKzRW+T1raVNVZLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180992695"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:39:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:39:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:39:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gxbg5sSRGRlYrVilBwIcI7K+a0iieR+as7LD6DxRENfDu/wEPFWIbAp59cDEGh5O4izLyzJ/mgrq6+jrUPFyTTVbUBPvj54vxOyOGPAxFOYKzme3boUOezOS1624EdsP5PXJwyJMo9EI2oHSO/pkCYvLMNYcCxdKyzkeejCHRFCc3s2PF6uqqBvw4UXxCbEipEvDSvVAIBsdhTQz5ekQJXWT4Sfve0fGqOzGQxYy8nEJfCMOe+qC0iTbmUZFb1BRVNzHalAhyIDQjf1OrnyZNXu6rw1Jt4xlycpKXb06cbdLfjEc5yMBH4fVdRFRONYu3TJbRPbOXlrHl64hLpSRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iOh9Zkox0YUx7x9JLMfjECYeXxn3zRImDfCUv6y65E=;
 b=u8gc4QtNIahyFBvrbw/vpuQVHc4Qa9ab7/Ms6mmFVUZe4xRU+IZCaJfYw40JChEeH2B1Pot7TTEINIMp5NwrbeuYAVICK5AWF3+GFCSAz/aIMdZJZHz470UakTcUytIe6teoZlzom+Zxfa061aQXEXLUhYLVRoI4ignJ3oBYLv5ldQAqJ5zpZPiy+oLHhoSCJ32+24n3powJm+RYS/qIebl+7F4SV6YshFpvRhBRS5w9uIXpsGUjOVjzhy5cN9oLhgc4dCXht9Zm1v1MXr3dQeMfu8ak1Vn/sSomuQ8Rq6Yi6xfBwyOTar9R6bpsY93aPe3zQNtBWbZ4axUjamaXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:39:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:39:30 +0000
Date: Tue, 7 Oct 2025 10:39:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 17/23] drm/xe: Bypass Wa_14018094691 when primary GT
 is disabled
Message-ID: <20251007173928.GE5409@mdroper-desk1.amr.corp.intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-42-matthew.d.roper@intel.com>
 <175949548299.1952.1705956699160081771@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175949548299.1952.1705956699160081771@intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b4bb75-aa5f-4b8b-ec81-08de05c87879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DzAZTey2pCpu2322BuOcvR6j4VWehlf9XbeBq1qJ5sJeB+bw2VtLMrTnh0cM?=
 =?us-ascii?Q?bhd2OI5oBX82fGhpqsP4EKNd35UIbMcyvwqCZpKJ9EB0d/T3KLzMrRYaQtH1?=
 =?us-ascii?Q?xhGwXqbuz8NyRa/hQaQgxLWgcNdsqLdsh8N/sJriq29EIZVbB4wBIeSC3AG2?=
 =?us-ascii?Q?4nYBMd+/fmG2IA93n533puPd/aZ8lOUqUxyt/IjVjGRL9zy6b9l+WNZvII3k?=
 =?us-ascii?Q?a7R1JIjiTozqgjsgTAfHr5LzgQXJJ7s5cC6TftN7zVDMFw/ET3vmi1iDHIeX?=
 =?us-ascii?Q?Rs5BtRrMPcXpOCTCvmGyJ1oK6AqMY87b61l7z9jHNYDsdeTnsKUks6mxUsIH?=
 =?us-ascii?Q?aFeheAN9SRRtF9CT3ZM/QCsZstyWtgV9BusRjQG6Zvgm/NBzm14FE4IDPFar?=
 =?us-ascii?Q?njCTKa8/cKu3LPtx5Uoq77fhmBkSeIe5EJhKqPa8hxphPFXcmimt7B8bXOdW?=
 =?us-ascii?Q?jZA4OkwCkk8Pg46yt4WJSAzzGswOMQU6RyqyMRCe2PgT3m9T0E3yjaGaPheZ?=
 =?us-ascii?Q?+0TJOTPUaBnkhrcAbVquGilxrnDe+p0aScC72TIkodeaxaY3b12a87bqBpwr?=
 =?us-ascii?Q?KVR+JnAYUq4MjhtpBP8MZ1NWW4O79vKqd9aXebf4+yWUbdrFrjU4n/gKSpw8?=
 =?us-ascii?Q?6BlvNMTc1HF/vWQmI0GwrVmoFvYCAl/AUuIL2JDIexJMNTa2gSxm61Ne3xXU?=
 =?us-ascii?Q?X52Z1LliffgH39g/KFvSSHgNetDHdQRp8Y53XwBNG2caAfNi2DYsPx9a5lFx?=
 =?us-ascii?Q?HgfpUGl/1p0HqZGgmPc1Z8Sidi8OdyKqwLsKLm9sZgBbb/49D8yAVnJtY9S+?=
 =?us-ascii?Q?Tm5lrN22VFpA305a8MJej6mxZ2p1k8N1B8AvGtuB9QRAr9uRHlVVfUHAGttO?=
 =?us-ascii?Q?3UkMtWLOi/ct20lhA9urqLicaLC6/HiQgaG01MgLVUHZHS4pp1pKqHZPoBRY?=
 =?us-ascii?Q?sUuZ7+e88hLya9QUdk+OD91djXnQs8/QDmyQ+rfzHvnxNhrITP6Lr7EHNfoe?=
 =?us-ascii?Q?Ra2zJy/6dI8gKvAJ9naTdWQ6zU4T+IDWg/Bdqm6qPVSZe0C5wpccFVxSOY+d?=
 =?us-ascii?Q?8LURK+qGDQactEc7EM8yX2Pk4Uw477q/28lhQTwwnYWSnOCoMbpjpUQhVcjW?=
 =?us-ascii?Q?X202taUsFKAIauG3zwxF2Yl2EA/UQp/TxkTzsGioA/Bs+W8U63vlxdxBN247?=
 =?us-ascii?Q?nfq67hoDJaK+uu0uHktOh39j4is7VAx8/SqB3tnlnE72hkD5dJQdzq4RGw8o?=
 =?us-ascii?Q?LWHVNVh7+rV/kjQInjO+31bQUEVHTWblJyi6eByL+KIcFaZpimtwW3cTP1xp?=
 =?us-ascii?Q?cWx2BLgKiZBSTLGypP3Z89b7LpZ/npMFzUNoKJve32kK9MvfGgNnUG8GGfMg?=
 =?us-ascii?Q?A3H1saJhgy/9tdw1ONXkMXnP9yLv4nYcu/4efkM654zVEoQB0X+rswOidgMn?=
 =?us-ascii?Q?bEvHQ8GJKNvLjWKdPZrBE+fJc3fqudNG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61x6IYg3RWaWVdFe3AJ4exeL8m5aOLG1CKExVRznmZjBPybDwxyZtcWwj2eF?=
 =?us-ascii?Q?Y3jzGqO5eOvSMHhaJ8z4T6/vnxtZozTN5K023bQjrsYTplWJVZQWz9mxxA+M?=
 =?us-ascii?Q?HHekNEaTJS7/vqTRODOMs61ZjUnOODMqRPuNrbsA8L8zIw775vHwqlIC43gT?=
 =?us-ascii?Q?IWVOwRpBZdhuDaCqL7R10VCjcQI04Ibo8GL7Sx74PipenA+EzEnz/bgndSy4?=
 =?us-ascii?Q?czjMAfXmNCwnJjx3Ngk7LTMgKUgp8dQD9b4JWpe1gbIYq4Eom3H9iVzXoeO0?=
 =?us-ascii?Q?yzf0ANjUy0Zc/v6iRgGCT4TxcKU5SSV7xzDu1iMeDQjCLn7e8y6ubtTUeU7g?=
 =?us-ascii?Q?HdjFzx2/CWloeNb3O+dEnKGLSjH6L4WC23tQbFNF6l5weMN5z40YfL8tvjXU?=
 =?us-ascii?Q?GDuoG4eJCzwJRwvaxpDliZ/1LyDAFb4B1RrSPSsJoCT5Qxa4bKuZJgHNFlHm?=
 =?us-ascii?Q?9tFrEsd1cUTOkwsQoR+7heCM5ZUlOIP5uy9rxhntfKqCO9TQFRwibdalgJ7G?=
 =?us-ascii?Q?O5uvU2hIUl07pmPg7L6JQbaNSRnZ3YhP3eB25pY3ZkF/TiRYttpcNmQfBvmM?=
 =?us-ascii?Q?u5xU5bhnniDMju2qQaA4eZTypgvFXBw/HRTXI1P8bnXax2pqzN4XXp1jZrvn?=
 =?us-ascii?Q?+4IZOGQJvIq8z5G2EVVyry31UZBFb/zHkFx/M61vNc1GL7rCJC7eYw01Kd+y?=
 =?us-ascii?Q?yPuBU7Zs8dqnmcFjAbfHH98xrNgmmsi1qB+9u/xlGO4hp1mWdcZoBIijxMNh?=
 =?us-ascii?Q?8TyIzinTO4mCYe9QsVj5KoIDTwwQHLIiO1a0dMSkZjawZb8Qdsd3uDsUWGxy?=
 =?us-ascii?Q?x6762675W4D7LnbXlGF/BIBSaPD/eUy4Axp1cMTMJdmTfXGJwk0sAHe37vHx?=
 =?us-ascii?Q?yBSXPCLvHTkKOO5EpLFx2jBFw0MOsykdLIMQz4nYuxVlxf0PDj4/NZTXoP6v?=
 =?us-ascii?Q?1bOBZsXvf9fR9OEzoqSkuLjirz8fXdftI0haDds4hdiden497FQYOosHfc4U?=
 =?us-ascii?Q?vr3cTe6U2oGDx6lHxDQxJG8NYJheojnyTaZZL8yy7r7Lk7yf6paXP7yPfrbs?=
 =?us-ascii?Q?3pdEoBheZTj0T+Fqck3ImrlAyX3tYqpz5tHUMLcZt+Q06axypgG3Hbd+fz2/?=
 =?us-ascii?Q?pBJYyzmfmwfjQnfthsQWkFRaE1QSoN59eabvX9+6uhdosiqLlaFc+4CKXMG+?=
 =?us-ascii?Q?dS6T9mgeRk37Ytl5J1qLqZQPwIkLH7FJijI5xoRy1Mm78XI1PQD6+GUKCrlO?=
 =?us-ascii?Q?4vQTRIzSi9j88MZvyh+6zey+WpLuVdDhTYjWJYidA7A5ZkFD+3+DIF0at8DY?=
 =?us-ascii?Q?XlIqjz0g8BwNDUJ/yr3ChBovgTH6AuZgqJj+pBb8cNaUvAAlZs8ajbs+/sZS?=
 =?us-ascii?Q?mj+YzLtF6VGuIZL84v1Ujgkrb/SsTGuNgZx0g+pTaumDXZbWh53XX4SAzC+t?=
 =?us-ascii?Q?1E3OFIlZYlsazkR2wn4MIyc8vlijKf1PdprJZySfWr5JGZf/Mib9YXRzOZSV?=
 =?us-ascii?Q?JlfQz0WlT7cu5+JuT41OfbYSfe6IhnnaCJNyt7QzZjTElv773S6VHIn+jzpQ?=
 =?us-ascii?Q?/i0J6Mhe60tCADJLUktrNlvCTblojmJcGYeO30O0O+vpTZXZ5wJxb3YZxifE?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b4bb75-aa5f-4b8b-ec81-08de05c87879
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:39:30.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfC0dotw/bCjvsajTmS14N188m2k62/2S4caX3FeZbtWedpXWhRtjNBS2Ouwmp6Ydoe/T8V77HAGIelCfx5LxHOdlwius7sNJoIuo2kyQiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
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

On Fri, Oct 03, 2025 at 09:44:42AM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2025-09-30 19:56:34-03:00)
> >Don't try to lookup Wa_14018094691 on a NULL GT when the primary GT is
> >disabled.  If the primary GT is disabled, there's no mid-thread
> >preemption happening which would make this workaround relevant anyway.
> 
> s/relevant/irrelevant/?

I think the existing wording is correct.  "There's nothing which would
make the workaround relevant" basically means the same thing as "the
workaround is irrelevant."  But I'll reword the commit message in
general to make it more clear.


Matt

> 
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> >---
> > drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> >index 83d61bf8ec62..dd69cb834f8e 100644
> >--- a/drivers/gpu/drm/xe/xe_gsc.c
> >+++ b/drivers/gpu/drm/xe/xe_gsc.c
> >@@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
> >         unsigned int fw_ref;
> >         int ret;
> > 
> >-        if (XE_GT_WA(tile->primary_gt, 14018094691)) {
> >+        if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
> >                 fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> > 
> >                 /*
> >@@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
> > 
> >         ret = gsc_upload(gsc);
> > 
> >-        if (XE_GT_WA(tile->primary_gt, 14018094691))
> >+        if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691))
> >                 xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
> > 
> >         if (ret)
> >-- 
> >2.51.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
