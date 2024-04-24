Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F059C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 20:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AE91120C5;
	Wed, 24 Apr 2024 20:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmQOp9FV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027031120C5
 for <Intel-Xe@lists.freedesktop.org>; Wed, 24 Apr 2024 20:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713991805; x=1745527805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CVZ+cuwpHqGtrFgQ5XqAvUnFH6iAF/jMqBfuqvdD9ls=;
 b=KmQOp9FVEgIHMdL+7EFb+zMAEKjJdXC5SYv0mvz9hL7LOVEEjoBsynyX
 mAMrh5TqcT+k1IHNAzU+ZWTc6KhOsZLpqBgwaH/z/6zBww8N0u/oQL2sf
 kEUUpK+SevldrAn5Ru4cjaW/3YTZfbjKYG6e3VJ97mnKrB0gjQ+iNVfCR
 k2iSUtjHhudQFhtFIAU7yOTfL28vsc139nE8pVyNBiYSP+Gs6hLwZw41v
 v26TUnfVd5NF7Dk8htsrHSCC9hQJSpuK0hvKx5ftXv7MWWQU5g579OLYM
 GcjHx8pN7MSbB+72jYp/MKdE8O0f1rLnO7JgDfCwcqEb2ylpMg7W+AIgX A==;
X-CSE-ConnectionGUID: NlMcgQtvS3CtEkxDrE6stQ==
X-CSE-MsgGUID: H+rjtcqBQdqJ7k/MegjdwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9497751"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9497751"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:50:05 -0700
X-CSE-ConnectionGUID: Y4CwCACITtq0/0M30c68Rg==
X-CSE-MsgGUID: WQ2Qai7+SAeDe72JUFEMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="29631186"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 13:50:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:50:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:50:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 13:50:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 13:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL6Lz3+R7tgSPS9EXoKSg8mrlxVZ8CPgpKOsQkmxPXUHKx9ElBtKIauBST+mvpiE2i5FBA9Cxw1Ft/JQK/GkcI/pVCT7cqIiWqfrv0nuIxnYBq0RlzxzmMjWJkqbupeJragqOBR0jNC0d6+vpdbVrxTNQSz+B7RjQ3vcPdvb3hrVhhy6FzEG1wCjBu8cQ4VNHxYJpiGPlutQ/sK0IxFhtTdpKvSSnnJApKWA0lBYqqGEcja2O9r6JId6yr4KX14lZxfPCAFb8Yr+425ubpf1SOc3GwCnZaIOg2TucEi6ppEgpA0sEEUOVo+DJiLYrO6ZWeYGQ/EeZWgHt9K6SIMS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oaop/aSny8vKFCdKSdhelinnQLzsVeyTmLp2bjL5CY=;
 b=dF2BuYfxnCoee2G2NAekQBI0qODlUe3EH877KpXIu6MFkUJyPOtYKho8UrT9YQxqNfCqdmGvETNVb3iRbf7jDxHcQ9BggXA5yD2dHD3zuss9n3hzF47T8/7lM0J4GntjBApd86YleMM4A2JJebe7mEXjbaXu0zp/HyGopeoTLKIeltz7+lB5qsrm1FTEQREQyDzSRIxAhNvx3GyOxzMgrYsMElcjh30o4sI73VGJPgwJ5AbG/xpiVvTRA6g4WmsRgGY5ADr4Mwc0Wy+U1MhK8eMgkNndGc+q76AlkHCDgsEwvkKCWM9peQXsp28A2tCYaEUxPceKIbMf9SazxdjtAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 20:50:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 20:50:02 +0000
Date: Wed, 24 Apr 2024 15:49:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Pre-release GuC firmware v70.24.0 for
 LNL/BMG/PVC
Message-ID: <5rudshnr2uoevsufqntr6s5jxko4au57b62s2pdbdw2hel34mz@vtoxpa2klya7>
References: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e60e915-7ecf-4e4c-0f79-08dc64a01c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/rL8It9m8Wgg5PT4Jc8He2q03LmbIEEwm0tSZo2QUGN7Vb05RzVUeyLVgDkY?=
 =?us-ascii?Q?5YTXkfjvBLHFM5GceR8rGhpvZP0NfuuwZ/Ldl5FuJQAc7Qg3Csukyhantn1S?=
 =?us-ascii?Q?CfAcWpW2pWBzly8ZiRlJjtmIAU0ITzl/m6g5GjEgG1LBZHwKVmZXLKu2uFI5?=
 =?us-ascii?Q?H3eNaX7HoxC/0+0UiWhlGNL5YImqlOdukVWMxvGn1g7uZzyfkgmzCXCOjRqB?=
 =?us-ascii?Q?PaTKhYHPYG2rjMjQPN/FkwTpVjmGvOSqGymtZ39l+LC6Gi/ZGbXc4EB+cwS8?=
 =?us-ascii?Q?uGdaxQbl6mAY+12AUdcsXqlmd4n/gltFoS0UdQk9r7IV1XVLCFnDI8qb6/g8?=
 =?us-ascii?Q?CojuU+9gYQewsNe3oEeOdYp7S687a2IqBYsxGTIMtdWqOH1N6fqweW87kTyj?=
 =?us-ascii?Q?uhy+50Aohk98coT90lZzqukB2jwo50X6bB3GbF8v4fJL4ZesF5fkUbAWRP/G?=
 =?us-ascii?Q?hf2/eLv0OZk05li8Plmsz3639kTlXEd+/cf1zbEJ5Khuu5ZFayofGIu+uoli?=
 =?us-ascii?Q?eu63slMxjOxRmiEI4k/GG77ud4GChiRDBoxO1VlnXXZ0BnwJbtRz5eXBisoi?=
 =?us-ascii?Q?l9Nq3npgtPn5Z0o5nmYKAmkNzohiQPMIhe25M6M3LH2rDS144qP838b35hId?=
 =?us-ascii?Q?CkdJjj7NTfC+vwXjb/W1pz2MexqV44g+/t7HZIUV5dnfzsQwKeiEGl5EMQw9?=
 =?us-ascii?Q?s+2RirMApM6jGhx7jWYS+CdboIl7C/kaZLgdBBl6KGC9YltzbfEbrSSDUHJE?=
 =?us-ascii?Q?fnNscFlXtlP3BC8Al8VVyzf63n4PWnsvdag4S0jM/l87vUlS6m+8+S2H+290?=
 =?us-ascii?Q?Cy7u+kV1bfV79HAdGfciENW66pJO17/3HmDkeLtZzB4ShiX19aFAUQ3jq8Ir?=
 =?us-ascii?Q?mudSpUxRD415vqbVyuKwlx3Ae+sw2Ogq+gDH/3lrxCE49PTR6mK5wUVUPOel?=
 =?us-ascii?Q?aQ9QmRIaQ3HZB6GE+/uZqCWZBeiIkP2uhidkRtoYqW02/Q+ga9ZWJjXFLEe+?=
 =?us-ascii?Q?hjxFUAIeufHs9s77utXij9PbSKcwiQKKv3oPHZBca+Aj6mvetL/nyRhLop7J?=
 =?us-ascii?Q?ig6/Gdu0pnbWtpZVVTcIBhrpxmBO+c23kjOIgDCobaIpJw7n59QsToyD8tEl?=
 =?us-ascii?Q?tO3tR7hMKm2YJ4PGmpKhqmqVv7d9K1MqW1WayVAi1skRFbQHU4iBLykXoaJP?=
 =?us-ascii?Q?uIiaAmM6G2fKV4kWxJ3HoQsT2smJwuHrHbOCu3TxJNCYu22Szgx0HU19vEd6?=
 =?us-ascii?Q?fZhxx8TlPhnTx4dAWMCk4OVWabBZ+6kskfORQmDPoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IFw3ZN0WfI+6Vq/g5QQcTah7tlh25RTOCJxhMtzY++xaRU6fkOMsOG1kP+mf?=
 =?us-ascii?Q?YrO5KNWzr24BoZv+w73j4F+MeoaEk6mGDWIYMjiM03Iht9930CheAf5COgYm?=
 =?us-ascii?Q?NK0nKYZ381dzRsidiqVX3BDDhiZngLQuY8Ybcztz3CdSAOA/7TrVaDKxahkS?=
 =?us-ascii?Q?gDz966ylD5ZAeYwcynB8zhNvcnFIwDEWdOHZTGym62lHRy0XHOBUj/uHlIpc?=
 =?us-ascii?Q?QT+qVvU0TSivNQ/JkfDI1B2+WpJZQrqdqCMvs7c4sN7G9P2OZtQqs3eeD47J?=
 =?us-ascii?Q?cTzMKFb2DlFic6U+LHOFiDYdGDyIMR7zDNt4mOsup6IYxBiXrl+sSMZH0/hn?=
 =?us-ascii?Q?XSS+JqDARlLQkcF63Z07OO6kZrVFneVBJznCaw/wibSS2bY19Bsq2/OSp0wV?=
 =?us-ascii?Q?uhW6YK326SiL25KcJOrb7gthYNadU05pMiD2WFMwNLpgvuefMuWRe32TVW49?=
 =?us-ascii?Q?T7dRyRvxH1Zapi4LRLpRpXU+ugOVDJkGYXIFuL19kufmnDM7cFQ3wSalD9vv?=
 =?us-ascii?Q?mkvShl5fI48oFmuMMeyiaqPSFtloymY0ZJ8qqj7nGZh1XX7L9czFYBZVMWaS?=
 =?us-ascii?Q?FKfJOgnaF4wGE1DcSkt+e5GrlXEjApiIRbNHG0eG/tDv3b2ImIvJN440rge9?=
 =?us-ascii?Q?zweZ5ZBpB+7MwmHWzd1DqjxfwXfqx9MRiqHf9aspXFg78rwnY8/dCWxPcRpt?=
 =?us-ascii?Q?xhzH9gB5h2n39vGWWCaK5+Ir1foI0cf6sEyWUkwbwXQEW+4zKeWsQttrNGII?=
 =?us-ascii?Q?ofrScaus4rTiJfEt/DOWikmMpKRom6GhSJqdQAdNVAYPnKa/yfm15QKs0UyJ?=
 =?us-ascii?Q?glMyWdNS1G+NWW6WedO8j63M202mEy4/6z8fxzfYaZXqyCtBw8KYeniNk3za?=
 =?us-ascii?Q?1XCLBEo++GI0VvNgfYi5s2SRFazQuaZ1SSxjiRRkRuv4vyI04gs98lHnhvaq?=
 =?us-ascii?Q?+hLXLoN9Y/SH1uTVlaqFEBKCmJdhWh5Oj1MrgxxA3Z6DsAsN7GEcpYJOkJWa?=
 =?us-ascii?Q?kUz1bC0IpQRr7ZpxetzCGzQC7rC44cUcHYKCmXc7mcmuiE3oe8mLMlYJH0rd?=
 =?us-ascii?Q?Je7qK0gxXa1/cV5AhPlkoU/70nO5WplDU13WM68P+Fi+X5HmkYIz6+y7dO+v?=
 =?us-ascii?Q?i6wi2TUvyBzNu22WaHjyqmYdTBYb8V/RlxoJUywEJl8CJjx1zugy7eyFH4IK?=
 =?us-ascii?Q?ogxUkRATMMV+/dDlQ75VXx/mLf2bXgHBo6+QF5UNKNTlKzIxCJkKhwVCkcem?=
 =?us-ascii?Q?onW6VQs6R0a5QgNKacY5lCwDYB1uMlqFFKA0irCeQGzYQQnzGB+k6GMWyJTy?=
 =?us-ascii?Q?M4p6qAdPpaMd+t/U3TEB5frRAzP7plcH2FyR/lhUAFzxcZSaSwL3Ai8YZgAK?=
 =?us-ascii?Q?JfAXij1m6Zdc6ZEhtPHPMCv/PBg6fRtKZODYyaPtJTqc/QNi4OTpkhXQ2JDQ?=
 =?us-ascii?Q?q0mz6Q42UBRUVLetbfKjY65GrzBtuwefuN2GBysrYL+lCFfqWJvWeitZZh//?=
 =?us-ascii?Q?peqYfzMkTA61ihNdUoj2w+3Bpv/C/aurrE8KTXKX7C66yA94DIGSU/zs1NOF?=
 =?us-ascii?Q?A8CwiQSve3ogUgdazd2uTzsPecMMJlHwnvMoluYN7d8AI1h/gdgYbYZrl5HK?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e60e915-7ecf-4e4c-0f79-08dc64a01c89
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 20:50:01.8825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ibzjro8ifCzZIyK7ABZoY6WJUa2ruwN9HmPer1t94JHhqX+UHdB/m01fmE0hxABCdRbwr3px7dOLgBnNKLIzb76STbKbMIcopWwgRYXviQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

On Wed, Apr 24, 2024 at 01:32:54PM GMT, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Update to the latest (pre-release) GuC version for LNL and PVC. Also
>add pre-release support for BMG.
>
>UAPI version 1.10.2.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will push this to the topic/xe-for-CI branch once we get passing CI
results.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index f27e96c47baa..ed819f1df888 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -104,9 +104,10 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
>+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
>+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 20, 0))	\
>+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>-- 
>2.43.2
>
