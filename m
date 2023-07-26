Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C459C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 20:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA65610E096;
	Wed, 26 Jul 2023 20:38:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE29910E096
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690403909; x=1721939909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6IBwEksHZ9jQIQhqRXDYAY0DwW6TXikuWW/FNoOzmyY=;
 b=WeDo1tXBvvggbQbPexDzegCTooZhDTCwRs2cBJCt/dNTb4v1MPqYoIX7
 iiJb2HP/JitKGJa6/yoekWHtpz16mM5dngkPBfnuQRgai4izni9Q6pwQk
 0mOpr95shWSIvFY/u2hOvhDKywS/AGLjOsj+bxXfeLbcsohgqiGb+sPFE
 IuerV74e+YmBRgnOm+Lo7pmm3gQ9ohunkl+SHpYivmsNjbuWoAhGe4FUt
 GVcyYNQfioNaERDUnFq5xgArb45wnWd2oumO2Q/5wegTU8uar9Abp0Lbx
 0ggpketxX//jHazKXPmhBcOLVijU8HomMAouzqxwUQvfGpQymNWotF/2v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353028133"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="353028133"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 13:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057361335"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057361335"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 13:38:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 13:38:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 13:38:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 13:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYxHyAaBES5eQ7MyloC2c/h9d1LAWegKJkARPwudnqc0PEjT1EcKvlbrY2Lwmu8i4dWjGPjXdbVHeKCnlCSVepScMYcDoI+CwiOZjMEh+mfb24OQVg8DHXZWIpaJcBU2FQIma+BwktumQeJj/UAXSBjrYdWNviKqvCbdfD+ZKaQh/YyntxWufXopgDBfO7Y7/VRYx23MN7cqxwI72b7rsjsddSKpog69XLEkfZQN98ItUZmNkUYQAYZsIyAHYCOwK7N7tzMoDrnnIeYqkNlPKdLroLkbmXViJOQHx7KXcxcyd3oB0k9umlx5drAsEZ8OShvWDTazwfTtIZ/VoIctqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypz+PeYjZz7NDvZrH37KxsrWIAZk1gqoQQYrgaX9gKY=;
 b=AURBLS5dBMK3MKVuhXPXFMc6yLAbjJRNbjIvv/nAvdkUl+OEDJydDLoxwLDGbXHrxGyeS0fQgqEzmIvJQspScn4Y72gMmyiN3GcDBklONvcbtew7hxll/TEpZSmkFI09CTo2zG6VhcepnHd2WThB7B3Hen/mRAzKDVXGoWqYT/IdrOyBMGsFyV7v4l625X51K+qC8S1/NfQbfzdsC7xrLg53PaFJsO7qI8C/mtnfaD+HTz4sfZJkfQyFzsBX+do7uSUA9zDA7wn817k6PZ2X45GOqmNJdCSYYvH+WiR7cjIuU0WI95cNd9qvvR3BdAXRRfnpZVx1xKvokvs9QCUnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Wed, 26 Jul
 2023 20:38:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 20:38:19 +0000
Date: Wed, 26 Jul 2023 17:38:13 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Message-ID: <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
 <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 9504abd8-0af5-46ef-54d6-08db8e183ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NQpF4qYzLp2lCQCliosxJpyOlfdS4oHQvQXDnAX1QG3t9Z457/UAODheX95PXruzgHk25f/bWOUZIhcjBfLZaZdGg1gvDx7mNWEeXNWZiXTg81UpNLQvHSC+tDto9kGDhWpIVZGQPGtLsADO1ssVVH/5lw4cv5UpGm8VXafR2x/2G4BK2RLzHxb/8L0GKiJZJexFtfKad+0JQbGArsEVpHVtWkUZGGxkTM4Mk3m3VJpc/PPASOCsuRo4GN2EvG5wBjn4Fevtpf4SCu5iNvw7k3RdnYNLnT34eAQBR+bz64gnmEsHMnF26tmvk9M3AYLeWExjewbM7L/1utHsMeMc8n5V6RKpPBI5rhU33SATmeTjz3kjiwt782inO7pQSgifzcb8kZYA6hCLRt+vnfZIdNDPCqhZCYkdAkTHiFt8AOKg64p7whA+AQGrqfhQBqdqeMlrfrTqfHqUYX9HbUBu6yqKan4LFaL62fbz1nLSqrapIK11z66ZcJhNp70BEJIR5RSsnHW2sd/97PYxbC/L/GhyPhMqLFkYiMuJ524iwg2uMRbdxQlB2fqNLS4FCZVU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(186003)(6506007)(6666004)(9686003)(6486002)(6512007)(478600001)(26005)(54906003)(6636002)(8936002)(66556008)(66476007)(6862004)(33716001)(2906002)(8676002)(5660300002)(38100700002)(41300700001)(4326008)(316002)(86362001)(82960400001)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OV3P6qtViQ3iUpkBHbRfmyYaQ41jZrLFYrSryMyAef3TIKZ4pzq49aBd72zR?=
 =?us-ascii?Q?Iswjk+tx4M/kWq6eMRaJnJmMbWZPoutH19tnKzLi6a8gjrYdxAnlSINHmYZe?=
 =?us-ascii?Q?1IjwpmznbZpLeuM5p1o9hLoTo2UPoD8trKOQeszuad2r/6Q9NyZhK0l67zUW?=
 =?us-ascii?Q?cIVM5O5qxAx5FJ1LOghq76xWkaGfklI5odcb1RMu0OMj/OsIw4a78w1QYT0N?=
 =?us-ascii?Q?uETnr4cG6lAvGYAypVJWHYtQIIN8fh6Dwm1e2vsXh+ZXbq7FlfoRpxOoRupm?=
 =?us-ascii?Q?gLYzuB0JE60luPWF+qKRQEeNApo5yRtM/MZ1ioFl4QwCRzmKLWjmLAOPA86X?=
 =?us-ascii?Q?E8clgMnRs2w52Lcpj1GJSe59WSav3YQ1q4PFCv1NKouT6ofZOJ/zRwe2mTa+?=
 =?us-ascii?Q?/FiNqb/GmBqVNynXwMWYNGVZxu9TOG/OpvSdmOHNV90EwQ91w6xTzFEnZuNv?=
 =?us-ascii?Q?pmlUHgZN6S2NkjeG8BH52cges8jE/Iu8a42yEm32yjYOczbD/mWeSuWQtkke?=
 =?us-ascii?Q?5Z/gdE9Fm+lfDOmlC2bRK3SCVImaYQ/3tqjmUQ3xdMQGnzH/6tOHXvxOA0kr?=
 =?us-ascii?Q?oJMnDvhOxVPkYbwc9tGF66B2GoG1fscWOF+q3whBPAmEPLXOqKeRrA2vt4ND?=
 =?us-ascii?Q?+jIozH48dPIzpxPFRw4RtYa06XNB7M113hgaWueyVAC0qEyqGgEQbodorKar?=
 =?us-ascii?Q?JXKpxaqI9VcDyWui5Pk+1rIQSouQevdrdKQqejY0DAF5qn6BZ+uVqiuP0D4n?=
 =?us-ascii?Q?Yo9bq0iJDCZuqXjz+wqSTu/E/CyfB7lzHNdPKEOYPZ1+cWpAyr4uWiGR0fPf?=
 =?us-ascii?Q?DNPYunJg7Iwy+RxRbD2PpCF9ov3aOBzjjBWS8h5TsXGgfpOjP5H4fzHSx672?=
 =?us-ascii?Q?kzvz7sL8wdSECZNlS0rXJlT7SUCDLd3GAqW4hPoLZmqRSsd5Wemgegm2k6Zd?=
 =?us-ascii?Q?+O7njPCn67103Wbfy6bn980zFUTUXR817nGTGwabfLgR0HjD4iu6jRZ6A/YA?=
 =?us-ascii?Q?iWTDWA1Q3GzhOVdYgqcffi/bdY2PlD+kMm0EoQTdxkKipwEI9kifI+K8vNBs?=
 =?us-ascii?Q?XIbliB6al42mc94E0zMPwD9Fdg2UcqMyOXXmAMzK90PLs9Wx+lSJIQdH2omi?=
 =?us-ascii?Q?t9NAy2HByUvwXDQR+ocYGqsuCRV3cpYeHsrcFsk/HfXBdBTMrneOmQem6P6d?=
 =?us-ascii?Q?5kP6DmTv9OaLZbRp9F5sa1ScUBNAL5OTysbG5YmAcVbBhD88y9Uu6sF5ynuA?=
 =?us-ascii?Q?/8eqoMnOfgRMU28tRTcStf1ZbAKoIsOGSPt4drIB7g5xGudMNG4oRw2rkOf7?=
 =?us-ascii?Q?VR4HZ9R/XZvgW1vvP5PrAiEvdSaajnDkXZjDBUhIlRJLRSZXpEMzvJyhQ43P?=
 =?us-ascii?Q?8kXlzdXxU5zo8R9r71HonjJyJILHYG99UkiyL2bptI3iliNxS4hezxKihrTu?=
 =?us-ascii?Q?ffhEJEwgF9EN8LJQJ2405xZAW+aaXUtWDMGP3zSMlt5w4ohTNRqtFq+TsjYu?=
 =?us-ascii?Q?cq2IGZ8IWwnmU3xVFqAb1Yc4+Rx2o/w+4fpCjL+tKto8leYfWQRHp1jnNaoa?=
 =?us-ascii?Q?J9tWu0PeZuY+Q8uaFKduCdStjuMCrDcjUA5qQIJItRO4LNSt55uix2fU2rZ5?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9504abd8-0af5-46ef-54d6-08db8e183ea2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 20:38:18.7810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYbyQd82/OQc/XfcHmRmNWpcLdEoy0TG07ttG9DQ1E+lNQs+hQ46iW6WfWOEVAhW0v5sUi3SnqMHr8lbDTwLCPVA3nvAeOjfs6obGUp8W8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump
 error.
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 07:37:43PM +0000, Rodrigo Vivi wrote:
>On Wed, 2023-07-26 at 19:29 +0000, Matthew Brost wrote:
>On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
>This might be an useful debugging information if the driver
>date is properly updated with a certain cadence. With this
>we know from which point in time in our development the
>driver was from.
>
>
>Make sense to have this, wondering what the cadence should be...
>
>before we are merged we should probably change the date along with our rebases.
>
>after we are in tree probably after the latest pull request towards the next version.


does it really make sense though? I think this exists only because of a
pre-git era. What's the problem with using the git short hash that will
automatically be updated and accurate?

Lucas De Marchi

>
>
>Anyways:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel.com>>
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>index f53f4b51233a..79b506dc2622 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -10,6 +10,7 @@
> #include <generated/utsrelease.h>
>
> #include "xe_device.h"
>+#include "xe_drv.h"
> #include "xe_engine.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>@@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>        drm_printf(&p, "**** Xe Device Coredump ****\n");
>        drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>        drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>+       drm_printf(&p, "driver date: " DRIVER_DATE "\n");
>
>        ts = ktime_to_timespec64(ss->snapshot_time);
>        drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>--
>2.41.0
>
>
