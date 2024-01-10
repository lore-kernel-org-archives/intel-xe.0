Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E762C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C090310E546;
	Wed, 10 Jan 2024 01:07:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05A710E546
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704848836; x=1736384836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gzpr/NPx2pCENm2MxoAvXTcJZSFQ6Ml4+XWtXm7s13s=;
 b=GuxWYH5tlQPjmWUGuAazJ6C6xpQaYqJ4lpRYW1ACE3K1U9NWj4Jq8oKC
 bC8DYUvejuDiCQJXMQpkctV7pFefUevGPgTKHiiX5kizEu70XtTafWBlN
 0UMT5JYrWXe98qQM5JjVUBcYSV4FAVtUmItnegNw4SmpJO+V+p+kyaA+h
 THk60dtmZ74r3VmYLuSfUitOPQvRKSQ2TiIcqLg/wrMT5fYOZyKM/M70o
 hHxjisavlyjB8ap4k/53QULSVmDdaKjS6id3HEsLQW1JBh+WZ8f8Lqgxo
 KlMvjx/k+gNWhhmcItqSQ8rev2bx8BbgEAfJ2YL4VLUOlwIJ+pzOG6Xk/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="19869837"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="19869837"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="30391392"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 17:07:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 17:07:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 17:07:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 17:07:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxOpbNLh05TZZdxMOEeSVpg2ESrTkBKQ4fHg10pWUhK4zVkFgH6ydheSO0/RwTu8IzCR81lGCISZqkd/QkvsLw9R15p676hoVDD1oKyaiepkmLPgkjFuAB8fWsHYhHVcAwTaLKvMcvwgIQ/WpPvBxUma87Owto/TAo1L8q0SdDyuxMNMQIN0e9AYT/0noSiuKmsBg8iLQrPTZQvAcBeBWCter+foiYbtNkV7ZL5j3q2pa+iyXzGlXIK3zh/YrcrI6GitKrW2inwT97fKz5vRr+Lmopsp12p9g000kycPs4nSlR5ObZ1ABaWwVHiIZDuXW9Y4CoCwR+1Iog7c7nopkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImeJ352S544ud95VEiJi5PIMEIkR3ljUIN3j3HfIe1c=;
 b=iuNsPOKhJspifqA3oEh7FsCdFuFXlqSev1P3coh+2MchhbERQlWWSs/FmqMt0NXDwC94/RMQXBuQeao9Tk0l2KzAhFVcK92ZlfC5o/Ue1lkRXWJ2i1kH5F83AGakQYKbaNm4jDU1vl5t4aWjygYgSLVF7qm5YT7iEorv8CjeypK3s7IQsZSFYN3+F/oUM+i+j51AnSQzVX4qnOvqI7toNWaBQKQs7IPHAxwL3L+ZYDVJbry2clBe5zMHduMFsR5BdxtfqxUiZ0PnQIqtbZmHzUrHSvC/E4mwAzfHYsMJzskpUbNxMZoPmh4C4kIYS2b+lpX9JxOA7hPJAj3aVUtpYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:07:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 01:07:00 +0000
Date: Wed, 10 Jan 2024 01:05:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Add build on bug to assert page fault queue
 works
Message-ID: <ZZ3tbZjm5+4MDM6y@DUT025-TGLU.fm.intel.com>
References: <20240109172838.1376015-1-matthew.brost@intel.com>
 <20240109172838.1376015-2-matthew.brost@intel.com>
 <5dde9f65-29c1-4d74-bf3b-83672546c969@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5dde9f65-29c1-4d74-bf3b-83672546c969@intel.com>
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: 147147b0-11a2-4957-db33-08dc117872e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sWoHLktm+hBbhPj9xZBTkaJsJSp6A0r4Gj8S40i5n45FP8ybF6UQanUFgq9ni5DOC0okPwv8e5SbPGjca9K8L0qmpPecEZ30PTuSugymkpo5NQIqVxzUhWSlk17mHyRMl6QMmQ4HvEb2koFtIdnCxNdrQiSVZxw+tRxwNs2NJEToMfNtmxP3G7CSSOo8rKozTaUUUL5jgz0uY5sRm9iV/pHSSDbO1sofaYCMhG65MU8oEHBFAxNaM83Uh0KSvcTr1wBl5PLhx/nkjFtVJoxCvef3SmeXoE1fe1lITgyfI2xoo1E6TWT70Vfv8A6dHzKJR7vxkPP08XEhBnwOod6fpHqmwKXnAbXYGPTPIP9voTQS+PMbN+ZSH5KeTU0cUarRYo72YxTzI9JIee+LjC2hhx7H12UNnS+Yr3jQ34i5E/5D64BCfYEyYj8xHCF7acfT1MVpiM8gJ4Y/c28W/PdkEV2OTWyXZuttZjMabQKIcYYhQWTa7ZmXojQIdjmMckPFD9j8BAYfgfrLInJHKNbfPwGdc66gKS4dX3pKtX/v9WQ/M2viPoqlebND46RUtQvh/lZ/TQNTTzYQf+y/nyIbfkuPxl84MpbA5HT7IyyN48=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(107886003)(6512007)(53546011)(26005)(6506007)(38100700002)(44832011)(8936002)(478600001)(4326008)(6862004)(8676002)(5660300002)(6666004)(6486002)(66476007)(6636002)(2906002)(66556008)(316002)(66946007)(41300700001)(82960400001)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xu1BHdm3BJqfFcsPWGYU2W03EgbvOvOlArERZoPXtiOKzEjc/flvxqqZo7QW?=
 =?us-ascii?Q?XqToUvfDqu/OSl9axQwBisinnqzs/IbSc5FNZ7mlh03TyoJiQfUcqF6u2wKC?=
 =?us-ascii?Q?VJdOw/DoUCmzHfGZDhNGb06CmvkMJjvxQtU7uwJpOKg2qwd51EZjAeGz7hIr?=
 =?us-ascii?Q?LXmJnlEW89SXh4pcumNQTETWbJrKmTTCRZJFqzFgBZKMA/V/NyVaU9ejhb9j?=
 =?us-ascii?Q?q5YBCX0+jbdLaUgvuGwSQsQbhWZcxLD6bNjIu76vJZhrWbGaQ3NmGBOA+PO5?=
 =?us-ascii?Q?D8nVb9Pjz5tTNsUo8SX7cga7IcUd3J64yb3BJY1stNMRFcI8jCjJ1eFX7qLn?=
 =?us-ascii?Q?Bfucn0CtHEBDGXY4QB6h7WDqYajFW6fIDukNLtlPG82aQ1VhU9ybAGi9pCCE?=
 =?us-ascii?Q?9xkZc1IqYoZcgSSjPj6iL7XZdh4U/wmIWKKoYQR4gtci71/EpUq5NcqzKTGo?=
 =?us-ascii?Q?Xf1xRTjC6BN6GqHNRsNEsxOo6Z6rre+cXXZfiRvpzZj1sjb2nY4zMQIug1JU?=
 =?us-ascii?Q?lnltEWss362fKjOP42HUFgQ385WbKcHEoZrMEG3uNk9jlhmErGBrXW5rQ6gl?=
 =?us-ascii?Q?716gi37OMGCzvc+kJgt7SOYbAKAesm1uoJkE1+CSL71oJ4J3yEOto7st+Kw/?=
 =?us-ascii?Q?ALWiviVXsjS366fKY+J2ydeyQ06plmmeoGcR/kD4714LvNpCelV8pzeey9S8?=
 =?us-ascii?Q?apHSfq26XhR6RboENGjZxSZGUgK0Jb3OlFfJxskmtHbYtSqEFFHTPdqDd7jt?=
 =?us-ascii?Q?l0zuRrlSLmMCPKhh+iPsyHlAnoM2J0WghPPJTpRMLcW77db2CfbDpn7yZvtX?=
 =?us-ascii?Q?I/FLdgEM7T3tTDp7CofhnFgYt9tO05tCqhoGXhFagBge2zeU3U9g95OhTTxr?=
 =?us-ascii?Q?WLQeEZaOuAoYTHh3vU1souPOROixfkfya9jou60x+7vXjlToTFNXBa3cUbqh?=
 =?us-ascii?Q?H+V86qs7Zcu6F+kZ0s+2CQNC2/xwpcvZC5AukoKavMJEydUc329Ygj/FtiZr?=
 =?us-ascii?Q?w28LF4oyl2MW7Q7gS8soMi1iyAnZuccQbqsaOB3eamT4xKhQbppL0pH8Hsg4?=
 =?us-ascii?Q?8TV/Af3utmzubvbZ9vwW4snMXzkPguhfPj49cQWoGMjh9mCEhc9DtO37S9ly?=
 =?us-ascii?Q?XT0fEh6iawyLJ4tR1Gp3IhmnIY0+dN42onl80bHebUaCNeWmA0qqE6RFqZEG?=
 =?us-ascii?Q?6xtGuWswVD6d0NCTbK1sr2LJvpIvf3T5es+w5DXIpVGl+gUuPjhAY9DQf9Oy?=
 =?us-ascii?Q?8yvVXrYgqqBcXYez7IMhnFQoDpq6KYOcCmNKEfhdsgki5WWUCqNc4LHHnyzP?=
 =?us-ascii?Q?wkyAoCnb26J0/gSV0h8E3gQ85yOVJIehc8jmgJIDtEtAaZF1ZxoD0MbICwdK?=
 =?us-ascii?Q?H+JrRwuNdi1RZwlr8JhObV9ByN0FjEHxSjQezHP/zEy6dpYUX7TptObzAsXg?=
 =?us-ascii?Q?8TFnCCngkMapSLwzNhUk9D4vEsL+QcotU0uMsBkE+fhyvOiMXF9goUbE84GL?=
 =?us-ascii?Q?Vl4NvLJTOyPzrgAQGTKcYwl+ww/eo5tc4VSpNwE+Jf7oCzLEdtVpBKM0Cc9z?=
 =?us-ascii?Q?25/d+hfI193v1y1Ukp26PU+JTkdCGSNQSjIuYOxt2C3kO/RGX+WJFLL731+9?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 147147b0-11a2-4957-db33-08dc117872e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:07:00.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPL5AydRH2B8YH9Ur1Dzws2cH8BdsLP9vn9H2eOaOf+WChPUgCXxVjAcGYWijRBnyhD8/gbZzmsdr0+pSJJ2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 01:52:06PM -0800, Welty, Brian wrote:
> 
> 
> On 1/9/2024 9:28 AM, Matthew Brost wrote:
> > If NUM_PF_QUEUE % PF_MSG_LEN_DW != 0 then the page fault queue logic
> > does not work when wrapping occurs. Add a build bug on to assert
> > NUM_PF_QUEUE % PF_MSG_LEN_DW == 0 to enforce this restriction and
> > document the code.
> 
> I'm a bit confused.   Number of queues is independent.
> 
> Don't you mean to test against size of queue in DWs?
> So this for the check?
>    BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> 

Yes. This the check I wanted. Thanks, will fix.

Matt

> 
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 4489aadc7a52..16cea47d9e15 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -328,6 +328,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	u32 asid;
> >   	bool full;
> > +	/*
> > +	 * The below logic doesn't work unless NUM_PF_QUEUE % PF_MSG_LEN_DW == 0
> > +	 */
> > +	BUILD_BUG_ON(NUM_PF_QUEUE % PF_MSG_LEN_DW);
> > +
> >   	if (unlikely(len != PF_MSG_LEN_DW))
> >   		return -EPROTO;
