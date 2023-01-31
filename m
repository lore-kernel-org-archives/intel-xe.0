Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06419C636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 19:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27A610E394;
	Tue, 31 Jan 2023 19:12:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED17C10E394
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675192323; x=1706728323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YGIudp6nK7ok7jTjGMjpjBnrnXg6eA2XN/s7wlAgHqw=;
 b=iJtZfy3UIS5FYAWbKjb9Z2FRgqohtoCxZNEemEj/58HSO6aVCHAX4Nra
 JFf8OdxZ0aie9StoLbbSG5c21kTxM7vQbKHvTOGw90AXIwMCt6QpyNVe/
 nBLjD2bwdJYkGfmJ5KdYWO8nxoQSkFDuzZyUtIt6DnhfTRwbx+7+jNONo
 6e4Y5U0nMeTJ2X/kF4ozl6FlW6tFwLuktH/uhhIDZ8SKdGCRQBpW9ucZ0
 9uuhkO5vd0164HiuYW0OFewW5lWjXo59bkiJFryqTlzJ+HBNlCBW48F54
 87xJ1pjUcxJe2n8F52CN0RWkaAlAEoSV9GTVpO2XK//eHUJLIwJZZfTiB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="330036487"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="330036487"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 11:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="773107627"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="773107627"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 11:12:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:12:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:12:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 11:12:01 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 11:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izHHQaN4Is9oTr24v9lrL1V3AQMQg0j3ckBRbsBajsqbZR8uG+pKBI4trkWbOz1sheOYf0HyHe/H4sN5IO7N51ArfwVJ7S4AwfqHKuEhGAa6NvmdqCaiwe2SlDPwZxVNZqKA7y2qApRuOs7zPrgnXUPYt4HRa20eNOboXmDo1nkaKrdwH9Ql8lkia5HCyesRFYA9bSsI3b7ZxwfrMN43Lqs9NYitFVTXcM79xz5ocuXfnKfQhz/ssUwazO176IfehrtjxlpkE0/Qt93dYQwGaQVf24jmq5sp5pvprZ1h90gnWmLKl/vNSga6nQLmTmMC8JO2fxnV1hD7eIaAsjJSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze/xRrVvR95q5EbqMj9CQceJ9myITNdBwF9zlIteCqM=;
 b=cHljn/WQt+wc0+D1DGhpHta4PD2ciy5XOgMd6PHW5vwFw4t3eslZNrLZqmHinu65iSlu3XujtC1OxMDD6TjFXfnrVD4A4+cac3Gzb70YVXbcqcClDBuuKxGwIi8+DUQ8ffakPfOqgeY90G63TeO42jo80rnUXg/9wWvG6wSyqzQMSN8k2wV49Ma80dJXCynvG1naIuiGTU4xIG3WOmmNy6hMvXleCcADGczhC58iY17GjW5c4JILU2fCzY/16T34AwADwTtYp+bmSl4eIIRpHqmgl9p+/auONuwokq+TBj1eIKwubQr6JqTSr4fcJ+Y99jECljF3FAGS/4MABuVsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 19:11:58 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 19:11:58 +0000
Date: Tue, 31 Jan 2023 14:11:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lecluse, Philippe" <philippe.lecluse@intel.com>
Message-ID: <Y9ln+qJWAntxy5Z2@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-38-rodrigo.vivi@intel.com>
 <Y8/9Sn1LAkpDW+Ex@intel.com>
 <DM6PR11MB45291BB4644955E0CED4447995C99@DM6PR11MB4529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB45291BB4644955E0CED4447995C99@DM6PR11MB4529.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 971fec4a-0ba9-48bb-690b-08db03bf05e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9KLeQ/+5we2VgLa3ML+/drmZE1FV2BJXcuDe8B9Tco7qBmUD2+b5VFUJdhwKNRsYbtkEriNTTjPtYf3hSzvfmOTvA+7sCg1siWyBoYnWHjraufFqDACnqRFNhREsfRAwjSViRh+/ehtnuwKqScTyESIqsFX4b/AbSsTPosY9fOW7NsRT3zJ2XoOIvR8ocaRazPfXP5x5cDPcOSidxhG9HcIwUQoFwlTGIvi+7i4ocjOhktZnVJYmMZQ31HB71r4VeyNtyQAMxCrKFfQYUtp2GVa5Lu/INTC+lg5ARI6Z6d8+kZDJx0Fu/8uHy+Uh2FV7lOz1h1IVixQVuEQlnSODblAIGKfMstFha/My70ZqJhkk2tH8DkbwLaFtAjg9GJ8nFhLHn+560Hx8TEWXAQibN0vTTm893cGuyd8gT3CKa+mOGxeE7n+bd7MN/ocZEIFK02ByryAT1Ue4iU0ho98OpyP3qiLxCBtFchPOyPrvLUD3DLwYRNcS6SLor9DDYKSuDGoxaaKLyZMue0LwnRDXNmWpYeGRUz0uaU6kBqxxpPTkOcQCmu/hXTdG5f+fFyi2Qeb/y5Qx3DhJdZfdC6w2Njquk+Tc/74tiVnRgBjO56DLLOxwIU6pxVLjbnBDtmiNZ60k76FbTrnIhvpUR2oydcyYnotHDFlpys8ZHAjy15doQ23TJb/1/LXOXoaX0HRB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199018)(41300700001)(66476007)(6636002)(4326008)(8676002)(6862004)(8936002)(316002)(66946007)(37006003)(66556008)(6666004)(5660300002)(6486002)(44832011)(83380400001)(36756003)(26005)(2906002)(6512007)(478600001)(186003)(6506007)(53546011)(2616005)(86362001)(82960400001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ce1p0AqEhGJJz2sqe3e6uHo6VaYHutwbZBNGQBteH6QohmrnR43bakBCOGYz?=
 =?us-ascii?Q?X/iL4qijWhU4Yf0fiUBCUrM1r5L4Fi7xUN7/d9jIzHvDXqYwZb8oHQuc8aOJ?=
 =?us-ascii?Q?3XFwQJ3f4zmH77XfCQa6MmnxIDnwzakDOCpDf1Vw7W6XuqTDt3XRdrOSF+jf?=
 =?us-ascii?Q?lrVliObYTy8Zr8JBXwJp7dmNKeCMZ8CIkwb/Ctb0PmQn3qn91uek9SYPWcCA?=
 =?us-ascii?Q?X+aB79iuBu2xfqI5tqcZEBk9DkTPY+V/V+iKqYPZW+dviJWu77i3uYlDwkLW?=
 =?us-ascii?Q?I7Xz+3/UFKXuoWVooz1zsg++mw88IGRwoWpfNwivQRB04XqWlxQCa3Q1mwM9?=
 =?us-ascii?Q?qcr22S4cJvEj6+af6Vqng34bfN8kZmK3nu9ZYFsYoMDB8mkrkQZAOIl864OD?=
 =?us-ascii?Q?+exNs4Qa3Jf6MmUYktalYoF9Vmr9ZLtZg2kZgYaq12asZOmwnVdpTB4Boy8n?=
 =?us-ascii?Q?F4K/+YPVP/SaB9DA/FrP931XXOzzrCSLI7JqUJ3McI6DDnUjytsZLveqCCd8?=
 =?us-ascii?Q?RJdf0d4Qd/UXXaBhCBFHNt9cQLxgdsgl4sp4Rz6XFNTRRvOvBZpBpcHfJCe8?=
 =?us-ascii?Q?0lZyN8e3fZ5fziwBM5EXGoGvdbaBcl4/+vl1d7i5CIUSF5OUqfl1/DMzawjk?=
 =?us-ascii?Q?r3Znm1tTOV16+/+iMXiGbVQFInG30ef35638HcuFnexOkOlznYncPyTQsnHp?=
 =?us-ascii?Q?uB5YqQP3g98GvcDz0WscZ3Oxa1EmZ4a481ntOtr41erthOw1m44l54fINDXL?=
 =?us-ascii?Q?0sbtKqQExmZLXVN7LSAmCAABR+qYOEmD0E8xTJgyGPRV7n6a6ww+puyvmBnG?=
 =?us-ascii?Q?Z5fI4hSj5AHMGyKWrtzDAheEwId/ewCaBmGeZNgAE+RFntZFf2EnY8OlY2Ev?=
 =?us-ascii?Q?cH+TXxFxXa9ClQk7KBP7veZ3Z+H6NW3WUMEcYEBrtjKAjV0N+P+9uH+Hhktq?=
 =?us-ascii?Q?E4wVZOuB664Lr9Sxii8ZNyXbd5F5tADYF8lF9MgLMnnYUdwov6Sw0BBYtvKf?=
 =?us-ascii?Q?Pb47h1QDr/rAi1qsycrnlZF8JgOLc918Js7iUP082tumDtnRHgnjo+otiYcx?=
 =?us-ascii?Q?FBSYfGpEHwGOxPoJRm03bDxS1l0pTne+vrLLn9IIGJkXZ2eMu9KT9zfU4crQ?=
 =?us-ascii?Q?ngwv8EyJh4M09IqYLpFTIqA/9fE4UkKTtoL4spKv6USV69nBdNDeyuxJgTKs?=
 =?us-ascii?Q?petphiA6sen/Lsvf0wMraVVv/JIaQhA9TMJHI2iTK7XxKUtQZvJDxI1x1X1G?=
 =?us-ascii?Q?K/B8l6dWtqXT4kXgwLFLcl3X3G2H3e1MqnOv/hgCclguw6U8HPagrgIlADHt?=
 =?us-ascii?Q?Kq9AWY6fhNE/rKmMpeErZvzwDEmzqxDSBYW09dKMREtmVNoovmLBE6xDcJWa?=
 =?us-ascii?Q?JvuB3SU+PXmD4N9BAkxvigbnX85blJrnQUB6x2Z0KT/I/Q50S0ZGxL0I5lwd?=
 =?us-ascii?Q?g5xjlAAuKSH6N3/3cnJk6T7ABoqNlAu0JicQeA217GMST7heyU3AcIr3cCeI?=
 =?us-ascii?Q?zA+f2KiObvwBhFdbPO54gxvoaAePlbMbTBzOp9igqZmChC+txBj+KNDhj1Sd?=
 =?us-ascii?Q?vx8bhAkEBe7FzqLx2Wvkc+HTln0bC90BbfWuo8QhuGaJVHyF/we3RFpCHFrO?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 971fec4a-0ba9-48bb-690b-08db03bf05e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:11:57.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY1Vk000skrlPEacfgBO2GeaTzWVvbEOtYplOQghwMIrpVqzXVcScyGUS6OlRCveabJSfgPKjaDyoW+w78Dn9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1
 instead of BAR2
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 04:25:16PM +0000, Lecluse, Philippe wrote:
> On DG1, BAR2 is not reliable for reporting Vram size, need to use GSMBASE.
> Simplify xe_mmio_total_vram_size to report vram size and usable size.

Matt, with this can I convert your gitlab approval in a rv-b?

> 
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Tuesday, January 24, 2023 4:46 PM
> To: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com; Lecluse, Philippe <philippe.lecluse@intel.com>; mchehab@kernel.org
> Cc: Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1 instead of BAR2
> 
> On Thu, Jan 12, 2023 at 05:25:38PM -0500, Rodrigo Vivi wrote:
> > From: Philippe Lecluse <philippe.lecluse@intel.com>
> 
> Hi Phil, could you please reply with a commit message to this patch?
> I will add on the next interaction or while merging it.
> 
> Thanks,
> Rodrigo.
> ---------------------------------------------------------------------
> Intel Benelux B.V.
> Registered in The Netherlands under number 24134020
> Statutory seat: Rotterdam
> Registered address: Capronilaan 37, 1119NG Schiphol-Rijk
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
