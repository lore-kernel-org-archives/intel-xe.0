Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10DBC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 19:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B8310E04E;
	Mon, 29 Jul 2024 19:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1qiDcJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D099E10E044
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 19:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722279942; x=1753815942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=01EPEkMtDf2Yh4+xT9KXgHeZXPUEIl8+RhL9/wwUSVs=;
 b=H1qiDcJ/Kjt0sggHaUUIypcTV6pmWiXHj2jbQkE+R9YrfcoxHoe2/bVc
 nDKkYtRMXXXcEIJjrlShaSSr2yUPu9kwiQ9IxHPI8EJn0FuBaxuBpT0US
 w+4SQF60RtIgZyF+MZmpus0Ra26jPrUkt5kWXyQz5nlH4d7TvEXn2Ha8y
 T0g2EAsQJRstfc6YD8SeoQBEhQ7OPrnNtRhzpfKSNvuk4VyxkwcccIppu
 NIKew3knBqbu/+SMDbgiGJvncHskfzznjtyYty1M86O4ldoTLAcRW3oF/
 N0Obtv7D1lr63g9EDUBoXRJgSlkZNJyD0LPKUjU8E1reLlWhI4Qxldt31 g==;
X-CSE-ConnectionGUID: 5oxBLxzmR+O/qpgyKtcmfQ==
X-CSE-MsgGUID: fIhdzY1XSWeMKd2qfuo9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20207208"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20207208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 12:05:40 -0700
X-CSE-ConnectionGUID: aL7BjBhjS0OzA/6JJGnTHQ==
X-CSE-MsgGUID: ZDmuvY/pRUWo0p3SNAZ55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58393335"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 12:05:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 12:05:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 12:05:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 12:05:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 12:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiXvNxydlxtVap+kSVswOphSHAmDHbto6XjAP0bR7NXabhcwfMuf8GWtcWLiRAlaH/ITmnnvkmYv72agvtkzBolX3a3rD61sx82whR+rZko4SXqUcUwYwo3XFsUL3+GWUK7KOANu19ybtLKPrztfwOMRK5MhxYs8pIZIaVchhwuV/lrmqgKhr1VmsmlAeT+QiFi+h+LrjpuJUdge5Sw/MM9u6G/s+sh2uCxADFEKM4mTfji+p9KuAGW545zbV6VELcFEPZnmOfqyVDgaX5PhbXxv7A/WqOHRaN4noejHAglbivlTsaEPTRr/qVhXYvXj6U4h12tA/LtOFLZDKQ2ZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUsLXxzUyMjtMjgew+Nd3WIJTKkJHfaCflfzDwyix9M=;
 b=RAcvKI+JJruPm2To8HvfhacM9BneoZXddjPXP/oGsCwjDcj/MQR5rvZPtEVMr0pEAE+lp4Gj6zwJ5Di1ReJD/JV3Hw7+IAtzMiBcJzo/CanZ6hdFq1zLVvNH3VFdRoTUWO1tpgO43NfoRQ7QAK4LjQl3Og/bgv7uqO7mthpA8tyIq17Z/cXGWWQD62s2fOXtx7BnoKUdKu3n/vGkwOX+DSlveq6EjXwDvvKJX3eP6KtVdNO/kHLjQrpSdGPZVgfC1k3tJEeXbU6caWT70f/1VdA+3T8rVAbIerEZ2oFX74800e+UDU04BSVNdKmfyyW6svHhP9kiE1d91zMTpS3ebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 19:05:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 19:05:28 +0000
Date: Mon, 29 Jul 2024 14:05:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 08/21] drm/xe/eudebug: hw enablement for eudebug
Message-ID: <icykmctrrffrulnbf6tnvb2jxnsasejdkk3zxxysizdqn3fsok@qrfh2iyol2ii>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-9-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-9-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 761e12be-ed90-4d76-db52-08dcb00168c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OTOnQWOS3CvJILSl3Sy/zU04zrYCfqINcOC12jKy/js+2Cue5bfsX3LrytOl?=
 =?us-ascii?Q?KV8N1O84rb5jzG2orjl8UjfCusPBVnuQkDcBz2Otzn7ze7YiZKvxtJTGUpEY?=
 =?us-ascii?Q?6lgGGuaF/3dIx3weksj0abmis0hgYtcGmg1VCKW7BtYABcpkJY6wFo6gNXsF?=
 =?us-ascii?Q?M0SR++VP0GUkNuvKVqO9SoXr2GPOqr0Bbz83ALAkNpkLT74Yb0Y93whx3Vp0?=
 =?us-ascii?Q?wNZyKskjOhckA1H+NOYMDFfLLTQ/TQeq9Fm8sraXfieqZFds1BBxdWjQv3Cl?=
 =?us-ascii?Q?ov2IKQxWFU5gi9yVUFTMs50qxYaDR7e1HSofi7co9U1ocqm/e8gw2ABEAKnJ?=
 =?us-ascii?Q?SwGqLGGG9nOfpE9pLOhZPYSr27Bk3x8oJU1pIUKyQQgnf6qkMGlb1aY8tlAf?=
 =?us-ascii?Q?3kIYf34bkai51tEwfNfwdiBjxat9Vlj0hIYhsXCL3bnluP0z6BrfAwa8Z3pM?=
 =?us-ascii?Q?95kVerUKraUQH2qpN1EtxHLsAQQm7NIFCikMZB3XmPInGZd/S1m2fnXExSFL?=
 =?us-ascii?Q?72Hqq4ERQX+xscX/RpYbMbDE7JoEhW7JxoYQeaMNeYm5kBhAihfIX6ypRgbV?=
 =?us-ascii?Q?e1xH1TCCharHHJDrY2pSbzY1IqGzhla9KNk7YFCwOLSbfwQCseXoYkCdaVn0?=
 =?us-ascii?Q?EuPBE6naIxg5yILGpuIgiq7Sr+LABa/D6eLDfJuHTg9uoBySnBOQ4mqje0Kj?=
 =?us-ascii?Q?zs6AtVRIaGzUUbtCuh3xmjO7JHdyVW7cDrXTk2/3qNimOEL2JtCSP/1eRpXe?=
 =?us-ascii?Q?4EV10WA/ttmMiK1WejoBzDmNY+MmPOvhruAhBbF5glHUfWCEV637v9XfO2Is?=
 =?us-ascii?Q?dNL9xDiDSCXeuKYom4QbR5SXRFUbfxWzObCoFqU0Wd+f8pnRzbo5rK428oS4?=
 =?us-ascii?Q?DBidQ67RsOapM1oK0Xw99wU4nHRhFtHYEgh5JUCnmYawAAFzLw3+8X9Hy5fK?=
 =?us-ascii?Q?DJ9U6VF4HOZApn29xEbuowsGm7U3jSPzDgdT4/9rfSCCscnbayz28iSMQJzR?=
 =?us-ascii?Q?tPsouhJRYxQ4RAnPX+O8td4aDSuh43Nkg+0VkGi2Plax8H5HfSsD9IZI0bM2?=
 =?us-ascii?Q?hKYDT9r9xFABLQEwRqnUpK9dI9kTvGw9lVDyiSsQkokzvohBcNga+n4MzspB?=
 =?us-ascii?Q?+wNZTUCae1QEaP4WU0qYdEh5REQXrRYsZfdl71D6oYvstV9MH6WfbytI6W22?=
 =?us-ascii?Q?dPdK5gONouslpnGo3KgddjvsmVnwFyc8JLvir4YrZdsTaqxhD9RHMMgGSo4f?=
 =?us-ascii?Q?sfqeOIAFCNN5OO8iK5m9tYxhCH3vt1PLzasu6Sd/63wasqeXvzdYiUAJb8s1?=
 =?us-ascii?Q?TXdusohoS9fzzkVZgz0Epb9yXlLBpdvMsfAi4E25OJmrzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nxz6BUl446vEZMC4y227mhPqH5s9BFIFELCDbyFQp1hkTzK/rzs7i8aHwVKf?=
 =?us-ascii?Q?xd9JWwlkm6vi1R9+ZN+CkWr6LhHWnjApRapzwU9ZN0asOLCDA4nj3JCQBNMW?=
 =?us-ascii?Q?vTDXz7sDptEQfI3EfOhTk2m+TB8/YaA7jO9tGskjcg+TZKcBjyHl5Jfh+1ss?=
 =?us-ascii?Q?xMU6Z4qVm/vKu1acz3g2OHAerdYVLPKCsZr8EGVXoeAXbRAURnkFLTB3Lo/j?=
 =?us-ascii?Q?YnSC9cdU7r7t8ZqDNXXkUQfQ2q4F6C1CxpwfhIqPxGMkYw+b6M8NYTdVYTVq?=
 =?us-ascii?Q?c0+kVYlnwPzJgF0KWbh77P3FCTjrBLUkXkJIk9iCPcFp0mkFknzipqVtuc8O?=
 =?us-ascii?Q?ra60hsiK9t5e0WjFs6wVR8dXbypfIQPjEypPLk0Gxqt3Q4TL1MCoZedtsyFM?=
 =?us-ascii?Q?1gBPP8Ymyx+E7M2lNyoQ50PuQWB3nnonHLeGWeOeDOEZ6BhzMz3OKBGTg6Vf?=
 =?us-ascii?Q?JgDnrBjPZqkGzGjbeQUWLzlZ/rKaxlNbS/EZxIpVzOzh/AT+01+1pMItwUOG?=
 =?us-ascii?Q?fn5t4uLl8h54g4cKy/Jifa8z8T/s5hDgG1nAFG0MjW2ALeaW9OKbri/YVksC?=
 =?us-ascii?Q?fiRG0fnbVXFKeOOS7jdY4GP2YuIZqyhIwhc1ROlh7W+Im/jAvJ6C+NOsLaPo?=
 =?us-ascii?Q?/rWC6PpiBYo3NpodZWJE0r6TWLYWR3bYUmrPW9qM+sc0JwZCwuV1RTKoPo00?=
 =?us-ascii?Q?6AQVaw+uRDwbaF3dBUXssTpbtcCUnCaGFcrMF3HIvmHXKqZf8nZzr0+yzWRD?=
 =?us-ascii?Q?K3lwO7VNB7aZmu4N88j9oi4tls0ByvPnkazUQdGJIQMHeQU4/G6AxW+dwrmN?=
 =?us-ascii?Q?zLFnH+Yktq3HICih9uUdXgm1FNUbxQJqKoOXJ50Wk0nnlVfe7+2QowZFZRdb?=
 =?us-ascii?Q?VmT6vb/x2WgO2I6MY/GMnB6g/hjcSr3hUjI1J0RbcWHYCTT1ni2v1PJ3JgB1?=
 =?us-ascii?Q?PzL6DRcRCGhiBwmOil0n/HOqsLe4EEUO8COMQbG92P0x+DqkRHhquHLp8n2u?=
 =?us-ascii?Q?CiYTZFuwwvQeR0m8BxbDc4CzFT2Se82tU43VeUbxQ7CfCNjbDTPl/PpoDFSY?=
 =?us-ascii?Q?JOBKUqNDZyqOyPBb+Wan4OHkjsV7nqL7mDFwyt+n11AovP4H3WJ7a7BC7+ey?=
 =?us-ascii?Q?42IncV1jhI43UHfaYhGCr2ztWbpChw2Oxzu1Md++jvJ/n9FERBBG7KXmww1d?=
 =?us-ascii?Q?Mifbp4RCgA+FMlHDbaLw9ttpFBAB5oLeAv71NxB/CVE14VT3nG5C+6rcFZHP?=
 =?us-ascii?Q?9J9VYu+qKefE9lF96pZU5r7/J0slfn/T+S1aqBQ2LYq3ORttMJxpMMaivKVR?=
 =?us-ascii?Q?V4f4X4Lt3P+su4WtRdQzTZCbzHUnaxSQlRyckz2rMLNWkH67k9oFop/oxnf0?=
 =?us-ascii?Q?O6yagTLJeo6qhVgetI89n4TGGIhCDuSr37PvZCbWtwCro97Xx9OmJ4mc7kXm?=
 =?us-ascii?Q?EXeDXdnsostNqjvIfIkIxBIvjdxojnH+86BSAMJbPZWeLqQFlnvVJTstC0oF?=
 =?us-ascii?Q?aj0SwJspKSoKAXLaccnDKA8RL6kMyKGQPN94MA5exHvjDv6iJ255dnUmr1B5?=
 =?us-ascii?Q?f8n96dS3ISPEn84Epwmmzrbpzkq70gB1BpOR3TGIGcGRbAlUffWp02INw/bQ?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761e12be-ed90-4d76-db52-08dcb00168c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:05:28.1296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHvuuUtmoMJo+eUDUbA6Xx8tQU0/Ufdyzmi0DFNhFAR6tKkSRSNqvc070fIhj751pxx9uytQoT4TH9c0EuUu2t/ZezeB962vNRpb6zaSJOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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

On Fri, Jul 26, 2024 at 05:08:05PM GMT, Mika Kuoppala wrote:
>From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>
>In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
>and some other registers needs to be programmed. Implement eudebug
>mode enabling including eudebug related workarounds.

nack for the workadound part. See below.

>
>1) Enable exceptions only on platforms that does not have per context
>   debugging functionality
>
>2) Fixup 22015693276:
>   Use lineage HSD instead of per platform specific, be precise defining
>   graphics range.
>
>Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++
> drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 10 +++++
> drivers/gpu/drm/xe/xe_eudebug.c          | 50 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_eudebug.h          |  2 +
> drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +
> 5 files changed, 68 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index c38db2a74614..fd31f3fb2b4c 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -114,6 +114,10 @@
>
> #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
>
>+#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
>+#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
>+#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
>+
> #define RING_BBADDR(base)			XE_REG((base) + 0x140)
> #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 8a94a94d2267..96a59a96dd4c 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -425,6 +425,14 @@
> #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> #define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
>
>+#define TD_CTL					XE_REG_MCR(0xe400)
>+#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
>+#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
>+#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
>+#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
>+#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
>+#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
>+
> #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
> #define   DISABLE_ECC				REG_BIT(5)
> #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>@@ -450,11 +458,13 @@
> #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
> #define   EARLY_EOT_DIS				REG_BIT(1)
>+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>
> #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
> #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
> #define   DISABLE_EARLY_READ			REG_BIT(14)
> #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
>+#define   XEHPC_DISABLE_BTB			REG_BIT(11)
> #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
> #define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
> #define   DISABLE_DOP_GATING			REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>index db55e449049a..9611acedeee9 100644
>--- a/drivers/gpu/drm/xe/xe_eudebug.c
>+++ b/drivers/gpu/drm/xe/xe_eudebug.c
>@@ -11,13 +11,19 @@
>
> #include <drm/drm_managed.h>
>
>+#include "regs/xe_gt_regs.h"
>+#include "regs/xe_engine_regs.h"
> #include "xe_device.h"
> #include "xe_assert.h"
> #include "xe_macros.h"
>+#include "xe_gt.h"
> #include "xe_eudebug_types.h"
> #include "xe_eudebug.h"
> #include "xe_exec_queue_types.h"
>+#include "xe_module.h"
>+#include "xe_rtp.h"
> #include "xe_vm.h"
>+#include "xe_wa.h"
>
> /*
>  * If there is no detected event read by userspace, during this period, assume
>@@ -925,6 +931,50 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
> 	return ret;
> }
>
>+#undef XE_REG_MCR
>+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>+
>+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
>+{
>+	const struct xe_rtp_entry_sr eudebug_was[] = {
>+		{ XE_RTP_NAME("GlobalDebugEnable"),
>+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
>+			       ENGINE_CLASS(RENDER)),
>+		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2(RENDER_RING_BASE),
>+				     GLOBAL_DEBUG_ENABLE))
>+		},
>+		{ XE_RTP_NAME("TdCtlDebugEnable"),
>+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
>+			       FUNC(xe_rtp_match_first_render_or_compute)),
>+		  XE_RTP_ACTIONS(SET(TD_CTL,
>+				     TD_CTL_BREAKPOINT_ENABLE |
>+				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
>+				     TD_CTL_FEH_AND_FEE_ENABLE))
>+		},
>+		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
>+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
>+			       FUNC(xe_rtp_match_first_render_or_compute)),
>+		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
>+		},
>+		{ XE_RTP_NAME("18022722726"),
>+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
>+			       FUNC(xe_rtp_match_first_render_or_compute)),
>+		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
>+		},
>+		{ XE_RTP_NAME("14015527279"),
>+		  XE_RTP_RULES(PLATFORM(PVC),
>+			       FUNC(xe_rtp_match_first_render_or_compute)),
>+		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
>+		},

workarounds don't belong here. All workarounds should be moved to
xe_wa.c, which also has tracking for active workarounds and make them
show up in debugfs.

tuning and other non-wa stuff may be added separately, like we have in
xe_tuning.c, xe_hw_engine.c etc.

Lucas De Marchi

>+		{}
>+	};
>+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>+	struct xe_device *xe = gt_to_xe(hwe->gt);
>+
>+	if (xe->eudebug.available)
>+		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
>+}
>+
> void xe_eudebug_init(struct xe_device *xe)
> {
> 	spin_lock_init(&xe->eudebug.lock);
>diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
>index 44b20549eb6d..ac89a3d1ee1d 100644
>--- a/drivers/gpu/drm/xe/xe_eudebug.h
>+++ b/drivers/gpu/drm/xe/xe_eudebug.h
>@@ -11,6 +11,7 @@ struct xe_device;
> struct xe_file;
> struct xe_vm;
> struct xe_exec_queue;
>+struct xe_hw_engine;
>
> int xe_eudebug_connect_ioctl(struct drm_device *dev,
> 			     void *data,
>@@ -18,6 +19,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>
> void xe_eudebug_init(struct xe_device *xe);
> void xe_eudebug_fini(struct xe_device *xe);
>+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
>
> void xe_eudebug_file_open(struct xe_file *xef);
> void xe_eudebug_file_close(struct xe_file *xef);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 20c4fdf40790..0d8b871b47fe 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -15,6 +15,7 @@
> #include "xe_assert.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>+#include "xe_eudebug.h"
> #include "xe_execlist.h"
> #include "xe_force_wake.h"
> #include "xe_gsc.h"
>@@ -503,6 +504,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	xe_tuning_process_engine(hwe);
> 	xe_wa_process_engine(hwe);
> 	hw_engine_setup_default_state(hwe);
>+	xe_eudebug_init_hw_engine(hwe);
>
> 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
> 	xe_reg_whitelist_process_engine(hwe);
>-- 
>2.34.1
>
