Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32456C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 18:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D310E5A0;
	Thu, 24 Aug 2023 18:04:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6542A10E5A0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 18:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692900287; x=1724436287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6R/LkFO7GeTL7s1b9W4PriVEGMxCbV7GmQlv8sG8n/k=;
 b=djgM/DEbKyWuVnk34sXPwF8hgeZ3kDpvjMALqMZ5UvsT5bMRyflB6dij
 ERGFNAkLv5qbl1pEO4UdGrINQBJjHJwl2GJivHO7Hvx7M7qmLNJd7zDbi
 FBlDA9Zj/dqdH806vmMArcbdM69cihVLOIH00DH5duCtBGjYaTHL+/9KS
 w6L6shoTKYOH4PlPg7NtLqQ+HasSarm82B6bcmf9IEZI7WNxR40UIl1Xa
 wWm6IIzanYmuzDyB7NEeonUIqowqOmUACrW9U51D0yf4mLSELfcAgO/CC
 lagzWEghOIvSexhlIzkI0o1J2VCzlqoNg63Is0yZCcyvWQK3ZHt/EoUvX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359518436"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359518436"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 11:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802645059"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="802645059"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 11:04:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 11:04:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 11:04:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 11:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=me3mE6XccnI2IwsfnbWPuGr9CJJRP/5xqwGcRrPCtMFExoqqiidP9kWG5+v7eOlIh/eVOma6+feTkt/rh7KpGwCZ9VJLeLaJx45PlhR7CgGah+Zjsx7NtYGIKymbc46CMcjigFBgz/Q0qxR3itu+3ZdA/nZLuvNNICj4n7q5oLtUQ55KPVX9yeax0nlc2LSynP70DZb5wfPbZliqsF0dmunulQfZ6FaSKzB0vAIINZhFB8C02uh9l2+WMqhL4YQfidty26WNOcKmPJYdcW9aS0GpOljlXdEDT69BUNstkIRzVMA/H/pRLcVl42U3ZtEAw+5ZEltaA3fLOL6VYxC4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fczE2oabP+UQAA3ESN1eXJ/47mS8/X9RZkGygP6CFFY=;
 b=DQ0OrGIroQugKy8lOqvqQVqX6VpCpBH+c4pMqee63vxvvKxK1BoB4u0qfkKmoVrLUS89nmQmaQXwhcVPM3WH04qt81bOUQi37gigvhAX+hdPzRdsoocIiWeax9VUiFop93xGqkN41NJEZ3bg7lDgGxeWm7jcissLXE2Am2ZiC71C3Sr8GrKCsbvlz8w5Asi4crWDLgHy3+lDi3bcFja58U9VbOluXEAlRmp3OBBaP1HjP0C3Qq/9PzMLKScGi07SNWJpB9jCda9hP90GmkLaGftTLwMIFrr96jgfynUpBS2GjD9wGm8PzobvbaQyALTP/YLwcvSjkPLX0ViZqpBcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 18:04:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 18:04:44 +0000
Date: Thu, 24 Aug 2023 11:04:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZOebuYalM/VSXU8H@nvishwa1-DESK>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: bb91f84e-aa70-48e5-f25f-08dba4cc9876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sceff5Qr36zVonyJryL3U9hRvyzXQ3nh9BfqBXkcbB18S2CFY4FsXwm0ybB2iwci2obVceTcLBQDP6T/N/p1rJ88VQdWUM4aX2NLHj8zul+5q7lP8MMjSNyX9LoLP8Becf+gJYeNymGVi5LbqHt5YzrBlkeIrPx76VAYLe9qSHjaFED4C0UuQvSCp3p5Z8+l45pn/7AQfPCKXWIJbHhxZGuHEOsY4EMSxP3KIVYq2SY9RaMr4O9VCa2Ptz0GWzzd08hoIMS2CFALjAzxCY1UNTs05jMO/NhLjChp56RLgNjVtXFV67yuJGwGZPdOr0Dx3ftkol9GPDoUvxFyXhYxc8oW/7oieiOYOiLjEsyc+nOF9ok9TNbDM9VpD+b5Gx7SL6nZ/MLj/rEyXuIswR9z6g+KPzEEXvGGtl7yKmwmOUeV7zv5vxGOIsN0LIxTgT+eezvrXl6KDLRVzdUlL6vIpBPY6ssUDgZuMyeAX1oqvQA35AO8Y5d+7iB+znRVRtpizELMXXaG1nK5rXSZqihrG0n4Qsuo8Fd2ZZM028aBbc6rsisBoaLJEp7X9LWOj+Hs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(5660300002)(107886003)(8936002)(4326008)(8676002)(83380400001)(44832011)(26005)(38100700002)(6666004)(82960400001)(66556008)(66946007)(66476007)(6506007)(33716001)(6916009)(316002)(478600001)(41300700001)(2906002)(6512007)(9686003)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Xon3Gps36aDoGMUvE4Y9ZrLqTRQi/ATfQNo3wWaaM0rr8p7y2dmpIMU3oEA?=
 =?us-ascii?Q?oAbciA3615QGmpmvKcRuvkKkbPMUMOLRbb8wB8yrL3oIuVfOeUg9Gk8Lrk27?=
 =?us-ascii?Q?FHoOu5Nj0+RIptPwUSSBTfOhUpDSbJZRJHm+JN3wGe7p/SGxZv9Bha1431/r?=
 =?us-ascii?Q?6k90X6wZOgRwJ8AjoxkWzzPUeJLWGrV38RyeKEuEd/uJ7C/gvCM6VLJz2CBI?=
 =?us-ascii?Q?nHx8j7X432zHKCEqNg1uqTrb0quiwkRI2ZHyZT0MJqp9mffkjHJgpW4BSSVp?=
 =?us-ascii?Q?N8HNd5QfVd8FCGtDnVZq/XIo5Mplkbq2tb4gB1r3Pis3i4SenGX6jKIMY0Bu?=
 =?us-ascii?Q?M0FEiBqg3zW5jmuSxMuQ6ldRCDa7lFVwVlkERN2E0Kmyn/UCHQz6sUjSllrm?=
 =?us-ascii?Q?Byf8ljsV88/YcNMpKeTXriK0O2ZKJxR6DjSGcHIxtn7tUvY88k4/41tBSkeb?=
 =?us-ascii?Q?Ms5Jn7pVAax72npAOM7PGadIxGDGiZE4cxxQg83vL7QPmn8BXUNGnikuVVgs?=
 =?us-ascii?Q?vEv0uyHwxI8Xf9KoBUbyJLCWlKR8DRHX+R7HwjLZcurtiMAtdnafbK4rPbXp?=
 =?us-ascii?Q?/XJGTuq8xAX7HqC/UuqHTsmKR1CJ2ODS5EU2ecJzIP3iO3/CTfz+lYJ4JEIL?=
 =?us-ascii?Q?BKAEsDPVVg4rKLLj24JKMAYM3Nsna5Bj204COwpEaZL0vXL0PpuSCgyrdKzc?=
 =?us-ascii?Q?mdU+fvxVXHJNlkWKfxiQnGxljV4hWm9yv05moPTD1UHoLz6daFDi7R4EyoMS?=
 =?us-ascii?Q?xWaJcmPY94SLXeFeTrNlDIPXlZWtj+5ylZuHy3FfQQkjdUgdL53RK9yVTFWu?=
 =?us-ascii?Q?77jtlY4Q4pXxqaGD8pw6+Ru0zpwFLJc1xFoWS97vM6gKEcZj9kxXYbZZQN9H?=
 =?us-ascii?Q?JxC95yz3VG02s8sipH2BuXnDOk4U+BaNwbZ78cTDY4/ZWBoFd/iEqzidqiCb?=
 =?us-ascii?Q?N1JOc7J5Gw3Ux2yTU1rewzQcFxfkKFzx9DRc/8rGCHKO8Bad2JI9wNalNL8Y?=
 =?us-ascii?Q?pr1AxlXs9EYwG3/xUv4RV3xFOLiBA+HhCk9ffEQvFO9nLTpAc0VDuCF6eKSG?=
 =?us-ascii?Q?h5qK29FH7eogIbuNocME0JzW0HujiIJrowVkio9E/dr7mjOi0cbQCP/TdCRm?=
 =?us-ascii?Q?BJiIaj4F+rxevjb2wgQLr7Sx6lG1bV7vyCnzKkgIJJssRPGA3ESp2fNcHlZk?=
 =?us-ascii?Q?qXjB7RvdZV+odvjuS0MRZCU/LwYHXWx25UotJY/pS8nG1yKhdwhdmUcj7AsV?=
 =?us-ascii?Q?3u4znuQdQxw4nY3WQiklvKKuK7ibUJpEpOSXRPCU7tyhtUL0R3Wgx/oG2yX8?=
 =?us-ascii?Q?hIUaDIO7eu68YfCZE6OEdrqzP+UmrIG88Norpv0XjnUmQzH0k6qb0kSrtEwT?=
 =?us-ascii?Q?wjEB/hQKAz31Xlo9fPH+3w+S9QSsVZ+LzuicAJvknCgXtDEjrO+FnHS6d28O?=
 =?us-ascii?Q?2ORWbcE5Q7AADvsCjH2oLdd0lh6ayEjsYMiSmc26rIM0j7nhA5OKi9UIuZPZ?=
 =?us-ascii?Q?5q4W9/BcQvgAJw7wRPZ7oFKsbHmLKlsNc15pOmmQzeoP7tD/wKnNvj7G1ntM?=
 =?us-ascii?Q?tIREXGkJIgKwyJi1cTgCufj6gTg7vFo3a923Jc7wwOqCKY+T0tf0dLzHTgIY?=
 =?us-ascii?Q?O0pQcAgnqB9jGM0bV54VQjs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb91f84e-aa70-48e5-f25f-08dba4cc9876
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 18:04:44.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGoeoqOnHU8cEW/wHaX3YK6WbZ2jgTHadpB+nPt2CffveoemLrBX4jGPa97ECw8KJuMvGSOnqT/Zxw2/s62l4XafgfQPFTBleL1J8RSQe+AVW0aBGCcxjzD6LSjObZpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/3] drm/xe/pvc: Add Wa_16017236439
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 04:40:37AM -0700, Niranjana Vishwanathapura wrote:
>Add workaround 16017236439 on PVC which makes even copy engine instances
>to use 64B transfers instead of 256B, hence making it bit slower than
>odd copy engine instances.
>Update migrate engine to use the faster odd copy engine instances along
>with the reserved copy engine for a better throughput.
>
>v2: Blacklist BCS_SWCTRL register
>v3: Use lrc_was[] and OOB WA,
>    update migration engine logical mask selection
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>

The CI.KUnit failure seems to be a CI tool issue.
I have pushed the patches.

Niranjana

>Niranjana Vishwanathapura (3):
>  drm/xe/pvc: Blacklist BCS_SWCTRL register
>  drm/xe/pvc: Force even num engines to use 64B
>  drm/xe/pvc: Use fast copy engines as migrate engine on PVC
>
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 ++
> drivers/gpu/drm/xe/xe_migrate.c          | 39 ++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_reg_whitelist.c    |  6 ++++
> drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++
> drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
> 5 files changed, 56 insertions(+), 3 deletions(-)
>
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
