Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FBDC761A6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 18:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370EA10E03C;
	Tue,  4 Apr 2023 18:07:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3ABD10E03C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680631648; x=1712167648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pQHRuhaPSyfpbrA2Scbfdkw6Oj1n3CuTSLc+WlrBhLc=;
 b=QYinlFwqq8RE0vsi1tHfk5areptnEgDz8FTGrUnCaTe26j0zbqBu3md2
 fgYP9hvvcSlTpGl9kq0hvCAu4lq//CUFErKXnHH79+zSjJgcot0gYxdsa
 g3ZeUpoaZ2BaDYT1q/N1vE4fRMwzlHbBffTuLZJs0+jckjnxN6+W2Fd7J
 pqDEWiPHSNYyWMOdv/+cATpB59d6c8KZuYdKmEyPYn5yvDb1iaPkEnjFn
 iatYZEEOsFdzzmrXFaMKOkRm37v3x5X4QaabxmgyeuXiWd/3P6BCWZiWP
 Kbz7M2iOI03R8a6/oGwomipDIJBjhmqdCxyDxTDtJAmzvbpdxpjxCRaFV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428550040"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428550040"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686463937"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="686463937"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 04 Apr 2023 11:05:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:05:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:05:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 11:05:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 11:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5Y+QThZnzFAYH87GfMw2FwXQAZFTqVUVl3QzY7GqiF8ivzGS/o+mx2h76Xdi+nOQb6lqXf+mr8tijkXL9EinhdzEUqmzCfTj96r45fZ1lis6O0Xz9mxeYp00Y91sXiOgzMYNH3ChU/N9OUgZUIE7xqHJQuqykQ+kKSaHwuP4o0Q6aXkuE8PUx7olO6cQMysE6wUWGjHr0oiLmmDXKU/hvilDGM9VqUC1REt/cW1Ql+o5J5aNbhaEwUZ0RE5k5QUKFEoJbZK4y2JjvxZDzTR25JBMNeYBjIWFW+9FTj6/Ou2jB1ursfq97umtmgbQtRVsWQ7iDcaNUBbpf5QNwEUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzAcS/J75mtS5PATIVDBr7jpzaIIot6nvp/1OhjxO5g=;
 b=GphYrLXzhG/OPP8nzKXM4BB0mP/73fzH5e2sX3FHs8ERxrjbbh90SjAlbTw0/WkeRFpuBn8cXSnShzw7CCLLY+PzORJIbgPS7ARwIFRdKL5s53Hmmwo52x+aqH8ra3/gSpPq93LduEtfrSUqKT3gY73kG1Tvm+Q0yrbyTpVr3sD05BMsjq4ln5hIOhgCQLaKuRsBEFdi0SyZFOQuPhnRT+ZcnjRa5ceLX/8SVq8F1QYF2EctiUASuPd+ND+jjR4D0WeFjdBAMJtKPtuQJM44EH1obZJLmAKTtxbMAQFg9+1+GGmgljK4a/Ne46xc62IbRKA5+Otglexhah5t+tj3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7756.namprd11.prod.outlook.com (2603:10b6:208:420::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 18:05:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 18:05:17 +0000
Date: Tue, 4 Apr 2023 11:05:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230404180514.la4zvl3tkrgk3gql@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-7-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230331102419.521392-7-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0379.namprd04.prod.outlook.com
 (2603:10b6:303:81::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c211e55-066b-4b98-8bc1-08db353725b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWG9molm14JzX9peGqdAtl2ph/DWqI/ySwx77CoYzaDEh7VKf+AGseon89+U0WA+sQ1Etr+GbF/qgO96c3VNzlhoOpLuvKUXGHVac0PtgL6Ki3RK7DKvVCi/DszJMZYKU62oYdk0VJD5/rCasv1xC0nc6o/bv1GrRlbOmt9EVhm+oL9pa4+r3WjEFEd1mdV4fVObAg/VK05GwxArx8RMunfpmRX1BGn7CrRT5axIV6iAQETSxsec8gFuwQfAWtjYqMuA12G8EFdpz7eOjn9MjmSQrje/stiborV+1L2xDNlldVkEExL+iq9imcNyjXU+KB+MeQ8LGeFYJJJ5t3+mTefPviaWXMlqhm7DxyWrBLZxWlE3uX3JIaFmKWBVTVxecuX8IBb53wGLr3x8jcD195h2GgcZTUzr/sOek9RaqFKIbzuagARFK3+PX+BjWy+DbRnpDDmT8OL4q+0gV4RzBMoMY9FQ419LvVQJoz7mvnlB8nY8p9qbPAdBTZqWqvZ/ma73WBx19QhqppZT6/mz2RfQrkUcRbzB4pZFv8Tqfv9WS6OPpBrauvlErOaP1uez
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(6916009)(82960400001)(4326008)(8676002)(66946007)(316002)(66556008)(66476007)(86362001)(2906002)(41300700001)(478600001)(36756003)(38100700002)(8936002)(6486002)(5660300002)(9686003)(6512007)(186003)(6666004)(26005)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?udeSL+c+mWlmPOhqNyRJFEu73r4w6quSZ7D4ZpVI3ST8hHi+pmAORk/v92/E?=
 =?us-ascii?Q?2GOcy6hmGuRC+Bs01WfqjVhYx++349IVh1aj29u2VGKM046+It0ZPjpJ6mnG?=
 =?us-ascii?Q?rQujqs4D/Ydc1P9i5klmF4F5UsnVlSMAkMeDkAIA3t05THUXc9N4G29A4E/r?=
 =?us-ascii?Q?Vnb049hBawDU3VH3ChbVd97P4dS1+P9488USRn09X2OAvHXtWTWX7IfgSj1L?=
 =?us-ascii?Q?/bKe/XJNZrHr3aDvW9lgbE/h9Tbjbi6tSNgy8K1hSKud7QzYz/amqgUDcE2K?=
 =?us-ascii?Q?BXEASaZr7GLwJ5gbYbFvy7wKFE4v3iuRrD43DFX5gVoTUZ8yH9Z3YT4tgQ/J?=
 =?us-ascii?Q?7i7KBNDpUcsqrDQaLJDpiGoB3XIbiV1qOWOSKbFXQH1K5Yz184XkWVRmerDa?=
 =?us-ascii?Q?dcDBzjK0WZh3MFeggA2NUcSp4F2fXDPqssDjNvBfLYlUga5U1aCbEODBrf/v?=
 =?us-ascii?Q?No2OZWeFskfTzAL7I4STkJH92hHyunN1NLFS/LU7mKPU/DARf6FvJVam43qg?=
 =?us-ascii?Q?LChDdNKDvWThvCbVoztrK0EvxsX0XJKwpAykZzZlZFLCBeW75mRu1GF2A4+M?=
 =?us-ascii?Q?dsVjOnLLJbkY88LnfnMmH0vFBZsUZP0Pg9zBfVMidjDzFRphc6HrtMgzTZeP?=
 =?us-ascii?Q?8bjpukNF8Ks2euBz7o8TSegrSRkzrkYAWHIwle2Jya6cZz3oxqfDItcYfOjH?=
 =?us-ascii?Q?bNZNEeDFdOzmQEyNrxgOG9/b+cwxfPjbjOuRo9cpvHO1YmAPDe7eqYUTI6It?=
 =?us-ascii?Q?dbQuzJXdXFwve5M8VO9UwRmjGeWYUHxD4Wum0bBp77wsdHkdsOG/I20hsZ8x?=
 =?us-ascii?Q?3AhQGiPw9SgB/9J9bUpq/TlmFWkv3IXKvq6Yt5eSfn41mfZ2oDaV79fH8m3Q?=
 =?us-ascii?Q?q0UcFxyLUyp6S3VTfzN1JUN6gsMQUoZ01ia9DJgboLDhytrp54J6J4ZWGk1U?=
 =?us-ascii?Q?KXL1NNHIdnz02maERXZgw5g/Gg5qBy/C0IJVCCgZYRrBrm1y2AnSIjxU9mG1?=
 =?us-ascii?Q?jA36FyuatpakWXxOfYsInxHzJt8J3MI8Jg8EnaWjRm79WTXBtLOTZahA3g3l?=
 =?us-ascii?Q?TVPMnut+jLS1Sosw45wHRcUOcrBHdt9/gYaHgTVTTrj9nVCzDfF5eL8PKmWw?=
 =?us-ascii?Q?uUaCO9ygdOZ22qf85R9eLENFoLrLDR/S/BILfsAJCNNkkwLAX3gnqIFF5dLq?=
 =?us-ascii?Q?WVGit1lnRquo6DT31eyul8FdcerdIy5M7GcB/C+9hujjo5E/UItObSgUX1QD?=
 =?us-ascii?Q?U2UtHqxIaFtxRMoEprsokYoBs0uGfZ4xoiQioAFDj/kOixhHX76DRPqw+11/?=
 =?us-ascii?Q?Rec+D6J80BJV7QlxKo2ztYVC5w4Dvrm+kSaR3Hqe4p2DpZnFWn90jdFek94I?=
 =?us-ascii?Q?BXmRcjDyNn04DLZTtpqTb5CtaEsivF3n/FZdBtwmND4Pncvm+CFgPVYovv1g?=
 =?us-ascii?Q?P03A4vptiBEcNLUZ+P6jk56eI2hqCMcZkS+SzHs0wTcZYDbg5AL0BbB3iqX+?=
 =?us-ascii?Q?cR4coWWZRJUgK41lkMiL2dbZ4Cfe+MgbPizl2fbxM6i1Lfz0QA7QvtIzI6zo?=
 =?us-ascii?Q?yYs72l4KPLQfHGUXLYAZF0oUT06Rqp150kPwu8P4/kox4gAyzQ4Lk0SXba3u?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c211e55-066b-4b98-8bc1-08db353725b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:05:17.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH+RIFe8YaOu3+5D4dUEv9t+mozbo/LEjoLGmvHrF98ELvDem9bp9VEqCM84l2oGIEDRvBn7RfKa/GK8F5MMiUagKCFBY4Ac97iT1mYYlhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7756
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Fixup
 __intel_de_wait_for_register macro.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 12:24:19PM +0200, Maarten Lankhorst wrote:
>Create a dummy when output reg is null, this is required for the changes
>to MTL display support.

drm/xe/display here too. Or if you prefer to handle this as a fixup
commit to be squashed in next rebase, commit this is --fixup=<commit>

>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/display/xe_de.h | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
>index 9f92fdb4159a..ce42e2938a06 100644
>--- a/drivers/gpu/drm/xe/display/xe_de.h
>+++ b/drivers/gpu/drm/xe/display/xe_de.h
>@@ -70,6 +70,10 @@ __intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
> 			     unsigned int fast_timeout_us,
> 			     unsigned int slow_timeout_ms, u32 *out_value)
> {
>+	u32 dummy;

missing new line.


More commonly these kind of situations are handled the other way around
though:

	u32 x;

	ret = wait_for_atomic(((x = ...

	if (out_value)
		*out_value = x;

	return ret;

I don't mind either way though, up to you.

Note that in xe we got rid of wait_for() and friends though.
Do we want to drop this one too?

Lucas De Marchi

>+	if (!out_value)
>+		out_value = &dummy;
>+
> 	return wait_for_atomic(((*out_value = xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
> 			slow_timeout_ms);
> }
>-- 
>2.34.1
>
