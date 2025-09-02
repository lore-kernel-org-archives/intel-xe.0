Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB577CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 19:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D17E10E829;
	Tue,  2 Sep 2025 19:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKajSNMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ECA10E829
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756841648; x=1788377648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pkQzxgUL4cKmq9K3LdX93fPzJN+oGwfVx9k6jTUbMSc=;
 b=DKajSNMzYzhCBiSk83qx49XkAu6PFBVO9188lXVvsOzBM1ylPtqTzOvj
 S7sf23Wf22Pt2KXMSSUgfZyVx8QdK7w/jhwiiito6H46lEUR1G4jUMbTx
 D/guW3J3iYgv+F9QdumsxKa2FgWBv/LKty+KQVUb4O6gzRTP4AdOvVKUD
 wyA7RbUDju58vJpEVlxSLPAob/XsMwiuW66JeC5H0mU3e+qZU6lvcUt80
 pwn9moNtouaEej7Y5o3zbe9ZBbKGuyPZbdUTtIksXH0WnoQhoqfu7E9Ud
 GM8UneUYyEIRU/EMysjPP9Yrc6hQW+PWPaWTXKgj8FJgjPSzTV8wKIBOs w==;
X-CSE-ConnectionGUID: Y6GS2M4yRceoY8by/brGkw==
X-CSE-MsgGUID: m1qfJYk8TOengxNeE/fV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58164998"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58164998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 12:34:07 -0700
X-CSE-ConnectionGUID: Pjnh1YLzTkm3YwQZAhWFTA==
X-CSE-MsgGUID: CAO1ZkpKS3y+vGUIw1oeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="208576494"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 12:34:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 12:34:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 12:34:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 12:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzVqzJLdxMN77yZMfk5YLjE/NG+FQCQxdIiArP0RfYZzj4fTFLmcmr0vWWjDddZRop22mXXTsDVd+tF57J9gGxgBVlNdGofuGf5tjCeo54RnWpwXNhhPnJaY4uYalN6SprNBtfP2aPi0ih3QYM7RQ/m+TRZOnMwod73ZQZrtfKbf7zKROfB85uARMQEkkl9hWT2nsrpgDGSZlE6mBpAxL241JrOZGOF3SQK6VZUQh7wZHS9B1Csk8rOLIy7XRFTeiFWho4RLjaDsE/NrC9I7tO0JvBnj57VYbajukz3jBisoqLdcrSbOh7Ff8RUVvr3bTZWowPinxHtRDk6+hfHZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPxYXmdtnrz+knaaeWjlV5NbG7mfJn+aOX1bhQ5s3+4=;
 b=hC9G/ZWCV8z1/4UugHDBJp96+NwOjR15byz4jWic7nBHxeAx9DoD2SF1W/9kxNNDD10ePXIRKrgVQ3dUCGJtGfBZEw1saLUD08+fgMc58m75t2+UMPpLyULCQORv7v3ZPzPN/WFzBmDHxFNqTfgK8srvFyWLDytNLDJOadp0jdPGHb/5pzJZ47kNbwtWR+92SR5zjGc/w6S3VRhQjyoI198ib4G3PboIzPg4Fi1xYQfj5EIbenwGIjoEt2o2l9ZDf/GcRZQLhpxVwzZ9lgAupJFBvGOEJiijtfugS0BcjgXuPZEs5N0+UHF0UQwisYV9BjPIexN6vDAbospqVPLO7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 19:34:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 19:34:02 +0000
Date: Tue, 2 Sep 2025 14:34:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/kunit: Allow to run tests against custom
 platform
Message-ID: <gwaifbohn7ocyslucdwns5mlqywlzte74x6ngop3cqilxc6oo5@capvsl2qcxz2>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
 <20250829171922.572-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250829171922.572-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc69435-c9e6-4212-a6bf-08ddea57abcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jQbNg3BaAZQ5k+N000TRN2UggeiquGSPYV3BpCtezkWqeWmi7HqquiZSitnL?=
 =?us-ascii?Q?oqECBNtZAKVXyAGeQSQCu8Vbs1rnCZlAi1NVrFVCxaF0TAEp6arLZ7rTrr+o?=
 =?us-ascii?Q?YpWBcOkEaxAoRycjH3tMlFkkjFm5sV04iLaznw+IH7dJbFL5HzryRAfPabvK?=
 =?us-ascii?Q?bwdsjnswh11FBercuzJZk789XRQFyI5v2jrTpoGC+mh5mgcrBmyKFkTH8mML?=
 =?us-ascii?Q?hetRPw5p4t3XLg0Tb9x+yc1EXHa1S/Y7nb2mStF71dNBwHKMQhOZpYt5b5D7?=
 =?us-ascii?Q?xdZC1Cl8MaHrdn6adfeYk3xwDREeKVhlErLrFox8MgB7iyFDeBJ5UXcOr+xy?=
 =?us-ascii?Q?ratQuIMlKJLu8GKTIu5k6Z+Hpji+oGkL2QGf9ZZrT9sdX/B4SsFZJs+KGUq/?=
 =?us-ascii?Q?Z81phkgNBZ1vwM2bRF8RUDLKoGhBID2ks/8H8gkOsLr6efF0s7SXEDWSjC4z?=
 =?us-ascii?Q?N2wWx8ZQ8iE3YiRxaXby5rsUGzOzAyCr0nmQUQ+xBlKZTQTb9bTjGhvqooZh?=
 =?us-ascii?Q?JJfJMpRQNn52AL1Jc83j2deE5gxpZ6Ie26GuFkn7gOSDOZ/kkA/FtMf9ccfk?=
 =?us-ascii?Q?hbh/FbGP6VmhhoecQ1TGDrk2keOkDB+A7wT+YjAU6pXmom5Ugal6uqdlpc/L?=
 =?us-ascii?Q?Li5U9c2dkR7D0fNjkFSlMppnFFfVxsEqKnqjJMkgRRL0GmbEjWlI9rLhlxlX?=
 =?us-ascii?Q?pZrdPl8qVtTsTzSl3MMk/BVKprjNNh2d0YzIpABz7ZrR3RN8AjkdTbyVFNUP?=
 =?us-ascii?Q?UswUOrg77HDA4hBNfXWka7WFIdnGABpN2t4tTMm7lKY08ZsT0VCRE/Q1i+Gs?=
 =?us-ascii?Q?ckc5HfnS1ElTrlisf0/rYS8gnZo3TTum88Gi6iEmbqf8yZe0fs/NtQDsWS5E?=
 =?us-ascii?Q?UBFqMM4ma1WT5nTEJKdelRMYGb99cfIOUMiLhZTxDzAR5h1kZ/WTGXWqr7Ss?=
 =?us-ascii?Q?nIjTGToQPT7ALONKfQ01AXoKIibIutp/5FZt2A5lqEN4+DDmGe1uE9L5AVv6?=
 =?us-ascii?Q?VSAZjtQKwpz9XI6A4ESefi31TGPdvld9tDmk2dF6UHFMSo1bicu4u7MLOZih?=
 =?us-ascii?Q?qOP6GEb6b/hfJ/vxvsJXFKHs9Wk6KBafuCRAh2NtHLfVDbjRYqb1LWvq0tg3?=
 =?us-ascii?Q?VTEffrtGi0TEctMwogh6HGVz9lvaB55F/LXgYhGW2mz25Xuxq30mBeMcRHqZ?=
 =?us-ascii?Q?l7Htsgs4S4GlsoliMSL+Bo48QHQE87UdWq5fzwEvWIJ53dCHxVhpT/Io9bc4?=
 =?us-ascii?Q?K1nrrjaTms1jr5Gvav3hUDQHf2ch8ECCk0BJDEKXGwJIyFeAiRMXyDzh5ntp?=
 =?us-ascii?Q?HbxFePIhdqERuFNXMDFS7BKRhoxC7IfWKLcGoXS8SJrqGKVFpNa+n6UPDckP?=
 =?us-ascii?Q?+4WJdA/kms/RJOXmgPs0TpPwI4Pq3RlveN1bm2YkSTSJ3w69y2rLE63ts5n4?=
 =?us-ascii?Q?UuTKiad7N/w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mBq0CPFAsaZsxcfGr6ao7fR0ZmHMWt6FBwB1YY983obHttY8Sfcu4Pdg0/Lb?=
 =?us-ascii?Q?pjFTy/Zwu3HW6aLR9VSbnQuGx6fuH0jSE4P0nOqHb3gsPPk7el/D+2ZzV3t/?=
 =?us-ascii?Q?sWpQJRXCyiIaY8fkI1F/goycrfbQVFME7XTpXPwWLYwv/JpEYZBO8SnQbNrC?=
 =?us-ascii?Q?gQAKxbMDOqv+PhoD5U5WxFQ3dKsWrKm04PaQiXZGv/cl6i8faD1ilGy5+6ph?=
 =?us-ascii?Q?TpQXWWvGMaBjA8kITJBevLr+ZCf/pRGXxYfoK+ER3hmJnS8828gMMmfdvsWn?=
 =?us-ascii?Q?2GWAkQIhIIKojyRIiL6I40pglIZP+wucbR3bK+KdlvNk7r92XmoNuY1IPTQs?=
 =?us-ascii?Q?WdZNbvnwORf2n471GW+u1B/RVQeqsbttxFmdkoWfscIdh2O9dA9so18PaAoa?=
 =?us-ascii?Q?Utx3hmGfHkeYikO35WbbTGZfqPlfyZ3x6Xj1QTk+cRdw7V9/yLWhSGdMDBFc?=
 =?us-ascii?Q?Zm+USDtYPCod8LFSCPhZmuyrGG43I5ikF2tA8KhzsTkHrKk9rB0299fB/MTD?=
 =?us-ascii?Q?wm24pgNE7HDrg0zSMr088v3Strrvs9KneUR5Zt09OKfNhXRnmAvL2SDX62r5?=
 =?us-ascii?Q?EkvGR92jjWDu2Ph/U9s3EwnVsfLRLoedBlADsgcaBCaSLQT7V4p7OZBWQaYH?=
 =?us-ascii?Q?uEn78QJ89WpJsXEBInGPUp886w4nPBdqw5lqN8R/rCYCHtS8JSjyQ6RjK2AT?=
 =?us-ascii?Q?QkCuE2K7QnVX3nkZE25+BFOeMp72SmduNkK4fzugebCpnhJF/HQHYYGeC+2g?=
 =?us-ascii?Q?CZ/mqCU7vX4XSPWgB3AQInkF8fwtGHaZovtF0ur/cC1wXtXM5JU4UjgzrNmV?=
 =?us-ascii?Q?cG1/fwjvyeREYGC20RPs7FIz3YvmspOX6xSOKhP26aIVLWlp/tXDqQFtTTcC?=
 =?us-ascii?Q?9t0JqtmnMjMwFCwOZxlWX5K6nn+IAyal6iFe2BwVupTAwop8iEg9ReIcsG+b?=
 =?us-ascii?Q?Kef4CKGAf10qmNx3XhCxJ8OZpitx2yDS9I6cjwjuDJ+FBKEStZP1exd+dow8?=
 =?us-ascii?Q?GrsgnGt/hIb2UPw7MvXFUMDI0DqSpZW1KFKBO9WNXfDTABNASt8yWkJ8CUSC?=
 =?us-ascii?Q?hb0U0443oQYrqwPqtL7cwyNQsfKHl156i6o7QLq107ly4LfoZgA33qYQNTzc?=
 =?us-ascii?Q?tEcwS9GJ2KWLSzO63huIuTPxr3J3+hFEhcwNjWtdZ+92Sr90Lu/kX875VwU2?=
 =?us-ascii?Q?aLFb+S2OwInOxtyvecuQp4AFM8uuvtR+wxIfDp8K91Zbh+GKzkBN0bTN9amp?=
 =?us-ascii?Q?wHyMdMppKN+wR7jKkwvQzYYbNZMWHwkbywrIR8JCoiefzi88fVyT7VlB6IOf?=
 =?us-ascii?Q?AisQqUiB7tUsM0acIuMAHuLRMATGNUGCooUzJQTjPbDQ5TsuJrb3clzOJh2u?=
 =?us-ascii?Q?cuHgVuNxSemBzmvHaMbV9e3yKIiwUJlFunLSyzg5UNOwPmD9riRJIgMfnIFh?=
 =?us-ascii?Q?5FGDXpuVNapJfPs5wDFNZGArXpEB2GmMurGUgSlho/gCk0b5MOkIEMJ54ab9?=
 =?us-ascii?Q?ft1d2GPIpkbst+SAEwr6dBgrNEJK6816/bYWF37BzSlTjPHoQl3xJgdtbOHU?=
 =?us-ascii?Q?2xEtnzDyZBWQGaI10cZYQcz7oyvE4gnCgGJSZirPu6AmGSOaxmD9pKn/YV4R?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc69435-c9e6-4212-a6bf-08ddea57abcc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 19:34:02.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88qPUHUEgF367B+AJW6auX/FDjKnqk88G4qM0Iubzo3LTL95wqNnIa9Q97UO+vyakPO6i63kVZ0fsl+f9DSgvOXWWM3Tg7QphT+Z52MMn18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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

On Fri, Aug 29, 2025 at 07:19:22PM +0200, Michal Wajdeczko wrote:
>We might want to run our KUnit tests against not defined yet
>future platform that differs from the existing ones only by
>new GDMID versions being used, but otherwise it is similar
>to existing graphics and media IP.
>
>Add kunit-only "dut" modparam where we can specify GMDIDs to
>be used by param generators:
>
>    $ tools/testing/kunit/kunit.py run ... \
>        --kernel_args=xe.dut=LUNARLAKE:2025:2025 \

I don't think we should polute the module params for the xe module.
I'd rather have this in xe_test_mod.c and then it may call something
from xe to set the behavior we want.

Another option is just not to be a module param and simply inspect the
kernel command line. It should be fine if this is done from a test
module rather than the real one.

Lucas De Marchi

>        "*xe_[wp][ac]*.*_??"
>    ...
>    KTAP version 1
>    1..2
>        KTAP version 1
>        # Subtest: xe_pci
>        # module: xe_test
>        1..2
>            KTAP version 1
>            # Subtest: check_graphics_ip
>            ok 1 20.25 Xe2_LPG
>        ok 1 check_graphics_ip
>            KTAP version 1
>            # Subtest: check_media_ip
>            ok 1 20.25 Xe2_LPM
>        ok 2 check_media_ip
>    # xe_pci: pass:2 fail:0 skip:0 total:2
>    # Totals: pass:2 fail:0 skip:0 total:2
>    ok 1 xe_pci
>        KTAP version 1
>        # Subtest: xe_wa
>        # module: xe_test
>        1..1
>            KTAP version 1
>            # Subtest: xe_wa_gt
>            ok 1 LUNARLAKE 20.25(Xe2_LPG) A0 20.25(Xe2_LPM) A0
>        ok 1 xe_wa_gt
>    ok 2 xe_wa
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 125 +++++++++++++++++++++++++++++-
> 1 file changed, 123 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index f19b1a64128b..0ab3f71b0fb7 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -12,6 +12,91 @@
> #include <kunit/test-bug.h>
> #include <kunit/visibility.h>
>
>+/* defined as arrays to allow reuse param_gens macros */
>+static struct xe_pci_fake_data dut_pci_data[1];
>+static struct xe_ip dut_graphics_ip[1];
>+static struct xe_ip dut_media_ip[1];
>+
>+static bool has_custom_dut(void)
>+{
>+	return dut_pci_data[0].graphics_verx100;
>+}
>+
>+static enum xe_platform find_platform_by_name(const char *name)
>+{
>+	const struct xe_device_desc *desc;
>+	const struct pci_device_id *ids;
>+
>+	for (ids = pciidlist; ids->driver_data; ids++) {
>+		desc = (const void *)ids->driver_data;
>+		if (!strcmp(name, desc->platform_name))
>+			return desc->platform;
>+	}
>+	return XE_PLATFORM_UNINITIALIZED;
>+}
>+
>+static const struct xe_ip *find_similar_graphics_ip(unsigned int verx100)
>+{
>+	size_t i;
>+
>+	for (i = 1; i < ARRAY_SIZE(graphics_ips); i++)
>+		if (graphics_ips[i].verx100 > verx100)
>+			break;
>+	return &graphics_ips[i - 1];
>+}
>+
>+static const struct xe_ip *find_similar_media_ip(unsigned int verx100)
>+{
>+	size_t i;
>+
>+	for (i = 1; i < ARRAY_SIZE(media_ips); i++)
>+		if (media_ips[i].verx100 > verx100)
>+			break;
>+	return &media_ips[i - 1];
>+}
>+
>+static int dut_param_set(const char *val, const struct kernel_param *kp)
>+{
>+	char buf[32], *s = buf, *tok;
>+	const struct xe_ip *origin;
>+
>+	strscpy(buf, val);
>+	tok = strsep(&s, ":");
>+	dut_pci_data[0].platform = find_platform_by_name(tok);
>+	if (dut_pci_data[0].platform < XE_METEORLAKE)
>+		return -EINVAL;
>+	tok = strsep(&s, ":");
>+	if (kstrtouint(tok, 10, &dut_pci_data[0].graphics_verx100))
>+		return -EINVAL;
>+	tok = strsep(&s, ":");
>+	if (kstrtouint(tok, 10, &dut_pci_data[0].media_verx100))
>+		return -EINVAL;
>+
>+	dut_pci_data[0].subplatform = XE_SUBPLATFORM_NONE;
>+	dut_pci_data[0].step.graphics = STEP_A0;
>+	dut_pci_data[0].step.media = STEP_A0;
>+
>+	origin = find_similar_graphics_ip(dut_pci_data[0].graphics_verx100);
>+	dut_graphics_ip[0].verx100 = dut_pci_data[0].graphics_verx100;
>+	dut_graphics_ip[0].name = origin->name;
>+	dut_graphics_ip[0].desc = origin->desc;
>+
>+	origin = find_similar_media_ip(dut_pci_data[0].media_verx100);
>+	dut_media_ip[0].verx100 = dut_pci_data[0].media_verx100;
>+	dut_media_ip[0].name = origin->name;
>+	dut_media_ip[0].desc = origin->desc;
>+
>+	return 0;
>+}
>+
>+static const struct kernel_param_ops dut_param_ops = {
>+	.set = dut_param_set,
>+};
>+
>+module_param_cb(dut, &dut_param_ops, NULL, 0400);
>+MODULE_PARM_DESC(dut, "Specify fake GMDID platform to be used during tests:\n"
>+		 "dut=<PLATFORM_NAME>:<GRAPHICS_VERx100>:<MEDIA_VERx100>\n");
>+
> #define PLATFORM_CASE(platform__, graphics_step__)					\
> 	{										\
> 		.platform = XE_ ## platform__,						\
>@@ -64,6 +149,13 @@ static const struct xe_pci_fake_data cases[] = {
>
> KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>
>+static void xe_pci_fake_data_desc_nc(struct xe_pci_fake_data *param, char *desc)
>+{
>+	xe_pci_fake_data_desc(param, desc);
>+}
>+
>+KUNIT_ARRAY_PARAM(dut_platform, dut_pci_data, xe_pci_fake_data_desc_nc);
>+
> /**
>  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
>  * @prev: the pointer to the previous parameter to iterate from or NULL
>@@ -77,6 +169,8 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>  */
> const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
> {
>+	if (has_custom_dut())
>+		return dut_platform_gen_params(prev, desc);
> 	return platform_gen_params(prev, desc);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
>@@ -152,14 +246,14 @@ static const char *sriov_name(enum xe_sriov_mode mode)
>
> static const char *lookup_graphics_name(unsigned int verx100)
> {
>-	const struct xe_ip *ip = find_graphics_ip(verx100);
>+	const struct xe_ip *ip = find_similar_graphics_ip(verx100);
>
> 	return ip ? ip->name : "";
> }
>
> static const char *lookup_media_name(unsigned int verx100)
> {
>-	const struct xe_ip *ip = find_media_ip(verx100);
>+	const struct xe_ip *ip = find_similar_media_ip(verx100);
>
> 	return ip ? ip->name : "";
> }
>@@ -207,6 +301,14 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
> KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
> KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>
>+static void xe_ip_kunit_desc_nc(struct xe_ip *param, char *desc)
>+{
>+	xe_ip_kunit_desc(param, desc);
>+}
>+
>+KUNIT_ARRAY_PARAM(dut_graphics_ip, dut_graphics_ip, xe_ip_kunit_desc_nc);
>+KUNIT_ARRAY_PARAM(dut_media_ip, dut_media_ip, xe_ip_kunit_desc_nc);
>+
> static void xe_pci_id_kunit_desc(const struct pci_device_id *param, char *desc)
> {
> 	const struct xe_device_desc *dev_desc =
>@@ -232,6 +334,8 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
>  */
> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
> {
>+	if (has_custom_dut())
>+		return dut_graphics_ip_gen_params(prev, desc);
> 	return graphics_ip_gen_params(prev, desc);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>@@ -249,6 +353,8 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>  */
> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
> {
>+	if (has_custom_dut())
>+		return dut_media_ip_gen_params(prev, desc);
> 	return media_ip_gen_params(prev, desc);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>@@ -292,6 +398,16 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
> 	/* Nothing to do, just use the statically defined value. */
> }
>
>+static const struct xe_ip *find_dut_graphics_ip(unsigned int verx100)
>+{
>+	return dut_graphics_ip[0].verx100 == verx100 ? dut_graphics_ip : NULL;
>+}
>+
>+static const struct xe_ip *find_dut_media_ip(unsigned int verx100)
>+{
>+	return dut_media_ip[0].verx100 == verx100 ? dut_media_ip : NULL;
>+}
>+
> int xe_pci_fake_device_init(struct xe_device *xe)
> {
> 	struct kunit *test = kunit_get_current_test();
>@@ -332,6 +448,11 @@ int xe_pci_fake_device_init(struct xe_device *xe)
> 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
> 				   fake_xe_info_probe_tile_count);
>
>+	if (has_custom_dut()) {
>+		kunit_activate_static_stub(test, find_graphics_ip, find_dut_graphics_ip);
>+		kunit_activate_static_stub(test, find_media_ip, find_dut_media_ip);
>+	}
>+
> 	xe_info_init_early(xe, desc, subplatform_desc);
> 	xe_info_init(xe, desc);
>
>-- 
>2.47.1
>
