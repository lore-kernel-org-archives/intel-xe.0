Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48815C04AAB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 12:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0291810E043;
	Fri, 22 Sep 2023 12:11:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4B910E043
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695384675; x=1726920675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MxNzs5gIk1TqFccNzM400eRophYat8RrtTlVesYuh3Y=;
 b=JqzR6VU2/ndTRfsKr6jESdLpS5LbajQLyLQsjM97Om8vQzLM7nsm3rJL
 LCW9/QUEClZbHIQnHJlNVYE/x3aYgS8XicQoxPEw1VPd59aWWei6MuR1A
 Kipy2uYBqSVt6bxEVjwBhosp+f/Kx9M4Xxg6exq0IINCJB1qz2kH4dhhA
 GgB/w3ezlq2M+f/h4970tpx+Gh3AhM/blNWqkatsPLYVeVW1DDPzSoJvV
 QWbH53tu+3T+bvizTzf3VSj9qxBSB8zc8d2gntM0VpKsSKwnqqTVxtg76
 BDaR03FsKY50kX8w7IGVaSINO4mNNf5wP5HGiqoYvAhqAaOoi17rsVRKx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361062319"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="361062319"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="817753086"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="817753086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 05:11:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 05:11:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 05:11:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 05:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqXwIWi8lV4/m8N6j2kt8F2aj3E/DVrqlCrlKNR2R5FpacxInYxLFn8RBTWuZuBvOP12h7SvZvX+OPr6msMsIIR+8ZSBG9y/hbz1Y59Yxew7v0hJO+oRDLfue4AV4s1sLU6GXDaaShFK2uDrFQPU4UFjR6ipVFWgPPaiAbh2TeEJfEcUKnbXlyLpYaEIzDV6FC1jU+kvc/JTuh96Gp9Q4C/mnSDjDPMnm04R5L8MU463HDS5mjJayg+Ov0NEgHCCfX+cI7dFRmI5F7Ogd6RF5K2RtiYWRiRnZVuMpuNU9YKlSvR9fPI6nRc9abzPxrzrS3Boa+lqj5eUzeU/aJyM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/Yrc3jee58BWvSnSVQo/v6FMBtRgu/SZ5pb0XpYVfk=;
 b=c0Hw9p7LRE4O4m5aw73yBwMYobmkxThJIBEV0Ku5na6JUYULqfu5ju5z0vAltqJ99h17kk09mKAJIqIXlcK22hixB1cN2aU4KYe6Q7dJEceQrMGCXd1dXdRV+HaDyX7iIUTk9qU7YAReYFzTz0ZROlijZq2/2VzDZ0Ls74JX+lv+L1rxouKDUtKwPZR1hEKDm3LGTENCKeLOelMHewwocfajYrNrJ8nK1ZsdkoWCOLjs9VPsjs4bicp33SJ0/jUMFRd06s2WrYhvpvLITPcNs4rIqiYVLvzvoSWFid4ycp3hDBJNxYFy2ldTEop2u5N019tU01ey6DPWUO475ArHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 12:11:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 12:11:12 +0000
Date: Fri, 22 Sep 2023 08:11:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <ZQ2EWcV+y46hKkDu@intel.com>
References: <20230921210800.170275-1-rodrigo.vivi@intel.com>
 <ZQ1N3V244SX9l71G@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQ1N3V244SX9l71G@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 0162b9ec-6097-48d6-d130-08dbbb6502e3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yog40M4Kk2esWouMwY8Kh6XFomZcPNkMFEschbVUQLNOzvGVJXwoQERyINmxARgqgS1wz3/aEOrFzZN8SwWdFbS2fH/23TpSFBG7I+M8d3C5kxnFKAGlo8RVaDHTpK3cnqhOM6Mh8dO4KdJ0UVBMT2/Iqk6ltlqsDskHJcl1D5vqh4bbGBfpG7MCAgbO8kUhm+y08F+k29rLyFw/yWVaR6zVkCrC3dp7voAhBDzTtiDuzUHjBoSPcn/2t1xuHh/GJfwK+KEX8m84EQWn21kFwBTjs/fGdq5YWReVbRZDKPfV3BsSHlKw9euo7u/aXtYq1AyNJULDMt15aX4XPSmYQkITuIuinQN64zuv7m5Y/8gKwM8dqBr6RTUOJcVCk/T3oSMTF4ylyu5Q9x7Cyp6RtrAv0fPI+aTavNebIn0aH98Vb7duqDtcabA++nudc7sbyL1At46ckU3A1yp8Fq6Nwdhh/nXwxvvczRkBw10RCRtM+4Q1gLRcu4SAwNYECmqI9h3F34CO1rP0A1xqgOelhmIkdb6FqCsAbkLjTkPVWHcHhzBQDH0m7650ocQCL9k6hlAXVGmx+C3TKVhoULeWU2a3Ct0fFywOEt0PeebE0uoqtKDrhtUpQZUt/ltK4fOg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(83380400001)(6486002)(6666004)(8676002)(6506007)(36756003)(82960400001)(86362001)(38100700002)(26005)(5660300002)(2616005)(2906002)(6512007)(478600001)(8936002)(41300700001)(4326008)(66574015)(66556008)(66946007)(44832011)(6916009)(66476007)(316002)(21314003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?46zqcaXKE+v6ADFcL5URelx76vXetRbCOQVYU6WAomB8IKwRYPwK4XWy8k?=
 =?iso-8859-1?Q?1RxlmM6Gjc6grzxKUDCZX1p3pTWP0aGFMOqDY34qqHzacTInBI+YpDr2yK?=
 =?iso-8859-1?Q?n1gcB9zWeLCQ7fDMwbWIKbRPiUhBoTXbLuMzEOqR5dTuF6HFtUtLpWO1NH?=
 =?iso-8859-1?Q?WAj4eBZWIBL6Kvkm16R97BcKlWxjJhoX2ZO8CHrDHlO8Rco/bCMmmRqQyk?=
 =?iso-8859-1?Q?1ElsnPsu9iBpo/CeQnFQWMjXtgz1SQ3hF255tAvQV2akdVvDQCsJSZCvce?=
 =?iso-8859-1?Q?mu4pVNZTAbZt+cgpzTVpqvwjZ9mF2zYM/SGQlBgPeu9/34PMkm7UwM2n0X?=
 =?iso-8859-1?Q?Rdbf/ptpXiA31CA6l4gxEXnSUAkcv+EPH9+y2w3lNtiqTX0n6aOOl1PyIT?=
 =?iso-8859-1?Q?5cwQGMDOz4n9bKasL/0HWRW7guhdeGl1vNrawko45ujzA75Vds0RULQHdT?=
 =?iso-8859-1?Q?zZpW6AN2ifAqtl76I/Zl9hIIAAGQWAeUqitFmgCgL1QcYMcK1Cvqr40ACb?=
 =?iso-8859-1?Q?RxaGC1zKmo1BxcZjcy/jtXTRYfdKdwoMFK3v6CWuOj3Ljf0BuRoM1/hM2e?=
 =?iso-8859-1?Q?5j7yPhIuC+q/kMSyUN52ocM8N8v5B2T4W1UJabCWL3dyCuvYXYH/8ym5hC?=
 =?iso-8859-1?Q?6xKZ+gAy+FIHHyA6rifEFBvZtX+4o/lJtnK9KHhJM4j3H/sBmp0uHCj++e?=
 =?iso-8859-1?Q?YXxrvfkTQVWXj374XzJpkqiHAT3uaPiiyZr0+3/n3cy2+cWrObEoN4j9j3?=
 =?iso-8859-1?Q?MLD4i1UFbPgNq0/VFl4RHZMZZOwHa4PmYlsndLNCTDPnHjMf0dZrIeB9jr?=
 =?iso-8859-1?Q?n4kYiht7OB8wQmgrWOuCMLfQIhBoTqlrI4/nq3VkTPtFNVFt6F3VK3bg+Z?=
 =?iso-8859-1?Q?BMhN5sjfH9hXvlHfpobSsTKKaJ9msZ5z9qdzvdize9zhFAB4hgQOGflMEE?=
 =?iso-8859-1?Q?NtgIjy2s9Ys5PtQZF2bLjlsgF5ZdRWa8FhMwOkZ/HgT/MzWE2I/c2GlM5V?=
 =?iso-8859-1?Q?8yEoP2Vtjjywe5F9JwCIuJ9jT1b7ayBkzOtKHf9gY3doKCdTv57XHubOrY?=
 =?iso-8859-1?Q?KClEk+IXGqltfqc5Qjm7hO+en4cOgFOq6Pe+xLmkjtBet1QcLKEiBNjz+j?=
 =?iso-8859-1?Q?eSpdh4oZHovDkWybIeMdwXcX8HMZY2fj0btIiB8TWtVEbNcvguoGyuEnH1?=
 =?iso-8859-1?Q?+SkmBsVJtCAN4zoPpz8ENB63mn/lBpCLLviAyCZ75MxNmDB1RO8UdrM3As?=
 =?iso-8859-1?Q?XOLTbfmhXd7XQkT5CQpRCitTXxQd1Cz5xjTlVKyY7WTYrDmPAR5wD+TjFz?=
 =?iso-8859-1?Q?htasbX+SUaxdq/MF00bUNlnotih16IrkVRVktcUkklbWjPwI7A1BRel9nm?=
 =?iso-8859-1?Q?zD802PVXZ4v2/a/mfiSYguyKGTL9XIvnP8FyVB9iScSWnu4hEXzTvA9d7Y?=
 =?iso-8859-1?Q?dkLtyRPOJ3qRxElf9taXxa32tWD9C8WsiYqWChALV1HXNiHTGuX8D00Fwk?=
 =?iso-8859-1?Q?qzXgzkg+kSazdt8mTQGLwIyWKlAzh+0oihp2YdyhxoesU+GeahvIYFnuL1?=
 =?iso-8859-1?Q?oTmuDUXDcJnyaBZuUwLZUltEgR9StscCoZtsrX9EhQowsUuuI4LkKXJNja?=
 =?iso-8859-1?Q?C0kr6kuAESgFIRS0ScVN/mkNpe3CVlqt07?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0162b9ec-6097-48d6-d130-08dbbb6502e3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 12:11:12.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I540faPDkO6gBlD+Z040DJnC8DWQJGwCXBi6l8f3CRyOnCmlOk6ToQ64XRP5cltqojZu1Ylg0AXYqYRSoXVX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 1/3] drm/xe: proper setting of irq enabled flag
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
Cc: Ohad Sharabi <osharabi@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 11:18:37AM +0300, Ville Syrjälä wrote:
> On Thu, Sep 21, 2023 at 05:07:58PM -0400, Rodrigo Vivi wrote:
> > From: Dani Liberman <dliberman@habana.ai>
> >
> > IRQ enabled flag should be set only after request irq succeeds.
> >
> > Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
> > Signed-off-by: Dani Liberman <dliberman@habana.ai>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_irq.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index ccb934f8fa34..f98aa1f06c8f 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -590,16 +590,14 @@ int xe_irq_install(struct xe_device *xe)
> >  		return -EINVAL;
> >  	}
> >
> > -	xe->irq.enabled = true;
> > -
> >  	xe_irq_reset(xe);
> >
> >  	err = request_irq(irq, irq_handler,
> >  			  IRQF_SHARED, DRIVER_NAME, xe);
> > -	if (err < 0) {
> > -		xe->irq.enabled = false;
> > +	if (err < 0)
> >  		return err;
> > -	}
> > +
> > +	xe->irq.enabled = true;
>
> Why does this even exist?

I had tried to kill this, but then I noticed it was needed
for i915-display.

@drivers/gpu/drm/xe/display/ext/i915_irq.c:

bool intel_irqs_enabled(struct xe_device *xe)
{
 	/*
         * XXX: i915 has a racy handling of the irq.enabled, since it doesn't
         * lock its transitions. Because of that, the irq.enabled sometimes
         * is not read with the irq.lock in place.
         * However, the most critical cases like vblank and page flips are
         * properly using the locks.
         * We cannot take the lock in here or run any kind of assert because
         * of i915 inconsistency.
         * But at this point the xe irq is better protected against races,
         * although the full solution would be protecting the i915 side.
         */
	return xe->irq.enabled;
}


>
> >
> >  	xe_irq_postinstall(xe);
> >
> > --
> > 2.41.0
>
> --
> Ville Syrjälä
> Intel
