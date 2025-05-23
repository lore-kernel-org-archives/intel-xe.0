Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E809AC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 21:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0AF10E09F;
	Fri, 23 May 2025 21:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUuP1ANo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54F710E09F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748035330; x=1779571330;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eoLi3lVWjZC26qQNimMa7M9Oiuh+dHMlyYGuwqLQCqQ=;
 b=lUuP1ANoqLVpqSXjb1+ZDwnZ2tosb/Utk1M+HpJuYukIjl7lFUkDoq7O
 1JmyMsBPmYnSkXCqxzFCIFafACfv7NjjZUmEcjl3TI8e/klX5g3TtvK9T
 MLITdcrviHeQen6T6lISpoMSpCy2gXer81iy3qUjltGt9vWHN2IbcV2c+
 qj8lm/lpDASsDi4nnhPd8VmNA/d1k0yJ3/HvYUH/errrDctOjjE7dp97o
 iWZTqutg6dO4jhjDTPYi8qpMEK7ksEMmtvNcHSiRMG0dRVTuMIbNrt3a+
 ni8wZuJkAm/W/gtbinLXa1Ogi+wXqB5Q+OMwSM0Dy3DrvBWjrKc0oafxP g==;
X-CSE-ConnectionGUID: AKA5ewm+RoWW4b78ZNa/IA==
X-CSE-MsgGUID: HwGo6FngTp2+RIMtck3j8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53895071"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="53895071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 14:22:10 -0700
X-CSE-ConnectionGUID: GA2i7B/eQRKF9Kv+w+QVmw==
X-CSE-MsgGUID: GRKIRKYnTaam2mvT8XqggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="146167185"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 14:22:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 14:22:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 14:22:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.52)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 14:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHsAXLPWmlRlMjNxDb+VcN/FI1NEdoyeqgnP+EtBFT7y7e9Id6KHxq+lsyNaqjsySfI4Mlai8QXqD0GDr/Bns1j/jqYCFmE+m9MIb/No0qTf0PhwnKCXesgIrtIyekm04r0kawxIFVEf30GqYQj6ra7GUxQmKTcolhOTIYtV6Neaaf1wpggUYr0QZuFQqIofdc9B+nCrU7ccY/ETQem6icxyM1B3uDY3luVKvtFS8G+XKAiFRQ0F6bsPQZwoal7cEAvo8E6suqV3G9dsXSGt1C61ckg1oPKLSp8D6gYmT1ph2IAK175VTGMCr1T5QyffEtnvrbMtf4BO0+LCWTVuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ0i15UcaJR+K02t/SGh6MigV1EGUVnsiEQX0TuOLG0=;
 b=mQmghNST8jh8l9r5me47Y9pxyf3KVNjluhVxCH+A9nxd1QlHJSQgZCGsgdOOmMrEJzBKjM/9F4UElsr8t/W4+EKE8VGE8XkVbMkhwaoQzc8BDPa6EkDb8BzLGiIu7tXVmQbS8Prr299CDk5LDU2OI9TI1L7vbIv6uZKI3Gxm/+g0XINaN3+2ZJzX6umNYsTX0w3T4FHVxT//fxFmE7O3uhq+s3BXeeIO1Nox7RNFjSjiCgSHoVMSn19Dl026gjuYmjkc/qdGGGJ0P+3WdLwTlPSI+dcEBrpyzvTwWr4sklvavBtOhNfCHV56hnTTqpBlTKzu1/1VR2ipf44llOC+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9395.namprd11.prod.outlook.com (2603:10b6:208:55f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 21:22:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 21:21:59 +0000
Date: Fri, 23 May 2025 14:21:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/configfs: Add attribute to disable engines
Message-ID: <20250523212157.GU5080@mdroper-desk1.amr.corp.intel.com>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f66a7f-8ef5-4007-0252-08dd9a3fda9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?s1ffmnGYWbsCfgIfgrcM7WJ19Y6XRfh39AmainUHlBylGQkTpcS5A60dN+?=
 =?iso-8859-1?Q?bMlpjrsckWwqXcACCc8RipA4RYqy+fxx5Jdff3NDdfV4xMTecvgmM4EEpM?=
 =?iso-8859-1?Q?bWG3sXPYbeG2XO7AxR5cAkceDEYFRHvJgh0/k7dLAAQhkj5SwE6L+2KkRa?=
 =?iso-8859-1?Q?gZiNZbJ51+EbLVvEUYlP+ZhdYXtnAkqFRkvbhwm9ABRyDpXCB0rq4dZy6z?=
 =?iso-8859-1?Q?3jlyswCmerKows9nWdVo1JJ1xUicO3aNh1I4d7BUXAK0vc7u1oM4nstuAq?=
 =?iso-8859-1?Q?eVIzodsTjaq6XN+8noSmYrC2dNAnlYjGhSnbwpyY0iPWdtgtuHDbLjn347?=
 =?iso-8859-1?Q?qCgnTVGbKKpMW+HaTwpg78oVj4lRhJ+HjnwlfurzloMmo231KZn65uNvnJ?=
 =?iso-8859-1?Q?+hzyue2XLdRDqNOhk03l5j3hlR+W+IAwV17Um7cgjKSXBFQh/lxB5+s9pm?=
 =?iso-8859-1?Q?8FXy+Ja3xmAEd4z4AFvOqyPVdFVoeZqkfE9gOlpK60mRyNpdLWxNQw8eOH?=
 =?iso-8859-1?Q?8uc7JfR+6dFpLDrT/SK2fpsrhuAshmCDAko2yTLd9NMZ7YAfFZK1R2q7BQ?=
 =?iso-8859-1?Q?0CoWX8et4SMrC4iEMhRi8bz+7eT1rHfwQwerOaq4D/nTWZLl8goCcLfUrI?=
 =?iso-8859-1?Q?2I+N6JvYNUR3DbIL7wtCpjK5TEFNQW1Y8qi0C+sg4mA8+EDvIdG5GBgg11?=
 =?iso-8859-1?Q?+oxTGeMwMtE4O6wtqoAF6QLULbiAC470LkD0L6NYcznWqkFW+u6PKyrXf7?=
 =?iso-8859-1?Q?ZF7jsd/YEwiNXRIGmC1GKsJunE2Q4quOCxLUFUaEUgD4/XqIPphJhUnb/w?=
 =?iso-8859-1?Q?46DKWdJW1lNnl7YZjadTx6Sh+heT1C8cnTxPHRbxhMtqMalw8dCuaqYiDb?=
 =?iso-8859-1?Q?6jBTC5CWTb56rzZ5Jtyq/FFX1UeyGuT6ePBiYy9B0h7yzzfAcARLAeJChD?=
 =?iso-8859-1?Q?X7oIp51z8QxNqUIBTSPwm+UWWFLZzUF5Q7Lhmgq65djyI3GKu8C99uiMkO?=
 =?iso-8859-1?Q?E84tqQgX7QPCVNEw1x6c6acR/VYHfharRbPTJ0xnzFdc71dEWz20HwRsU6?=
 =?iso-8859-1?Q?mvrCj3AgyQxZVZFpG6FXBXLKcdX/PtOBfL63OUqfB6mdetqPXZ8TpvJmWI?=
 =?iso-8859-1?Q?e9oEC9mYG2smFxof/Wqs1BOQ3oKFex5MrtkTmLm4YXBaDKFbbf7WOIgJER?=
 =?iso-8859-1?Q?x/ykA7WQRgy3cJPe5B8UyLzby/ZjQXVZAQdgL9f2G5zSd78GM6ojSmwPq4?=
 =?iso-8859-1?Q?CIoZ7NIAv+N1KQmclSGnLJr9SdXoNlcXbXOJJO+fEYSa/cpB9SanjF13/T?=
 =?iso-8859-1?Q?yKTu21zYFJ4V9Y7kliw6jt31Tz7ATUQugcCqHF/Lk6kqv4p2BX0ihZge5L?=
 =?iso-8859-1?Q?B3Q0yuGghqdqjb+79yRKt1sMiOCWsJ4to8yx9hIOjHhYXaa5J1K7XH1Wqn?=
 =?iso-8859-1?Q?xUCSoygE3aXWeENRj1vCipsx11ctBwjHv56Pf0naCJhIsF78IvN613Y+9Y?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BnTqUcBbe7R3Oryp6eBo78e1KA06Jg6HUB/UQrs5Jt5WXC8mmEghqWya6O?=
 =?iso-8859-1?Q?TzBSlHknz7VBDCTWFgCugi02rw20MAy1NbMXX2TCK7fVlMXxeyvFlAMvks?=
 =?iso-8859-1?Q?JXkchhpeYZ0Zm1wkbL/V1nZO3jk069XEk7zctmJGXs1oQDFiAV2iOwRiki?=
 =?iso-8859-1?Q?onX3p8QKhONYYHh7WHNX2P9PfsOf9e6A+K/MkrACUjz4d0IqFUQpdyUXyT?=
 =?iso-8859-1?Q?BOb5v8gEnkmAaxJgCS0MB/sFVv5Q/T0x4Rp7321ZiIc+8OFqDEdwr1wmF2?=
 =?iso-8859-1?Q?PJPBoiIH3MDgPE5RnOcRJRkFuE4UNBAelYoZSkOsclordkEtoFGZbrJe2Q?=
 =?iso-8859-1?Q?1KZQP595j4/U1IV714/a29mhwivjFDx5MnTMODocHqN6cntXrrtIW1oe5K?=
 =?iso-8859-1?Q?P5Hv/GTAFcrOZNRwnejemWCFrH2YLv9S5LEP4rANJQjNigRtSFlGioymlc?=
 =?iso-8859-1?Q?0oqnvF4Nw5NqzMZxSvoE7vqnIBxM4iFLs6gZHjZSDK2s/COhEPOqq1LTIO?=
 =?iso-8859-1?Q?qmjk2dUe/cRaNjFytEU8kbriSfw7SxU7IO0urxcBBZT5c4Gq+n8JUSUxEE?=
 =?iso-8859-1?Q?oVEEaBiQouSGy7VAfnqOuDjwMji7fTq6ZRyhuzpH0lBs6fRtqGgzSktF89?=
 =?iso-8859-1?Q?YaYvc0PhfTxLbXEIbMZ9zimqfIU1jp85imSJ4+9VGOPUkBZSo9a/ij13QP?=
 =?iso-8859-1?Q?fGfDYrEkmI5TbrcdFEJc++oZEviWppVLJwr0cWQezNKx0geYuWrG5NsEhu?=
 =?iso-8859-1?Q?jYCyVoDbAwX3ejOOKLUG/ahNea9FKroXI1n1zLqhLViVkVKMKAW7zV2szo?=
 =?iso-8859-1?Q?dPwX5qtR37vwq26orB94853NMVCe0Je8uVhBNxiQUJrnXHwS5tp1bXCAeB?=
 =?iso-8859-1?Q?9iLJBgDadh8hkRAeAmDIlAd0I9vezC4kbYPzhQeBuFWYk8PF+h1Q/bmMmB?=
 =?iso-8859-1?Q?p0j/31+r1pcGLqUNkD8AxNddCQ0nZQN/Eyo3CfbDsq3PDgAHzROEi4T2Fw?=
 =?iso-8859-1?Q?QmeZ1EEudihJpIRzX+KuREOGLNM0ODQkrWcRAsio5NBibKmRTPv0ufT9NA?=
 =?iso-8859-1?Q?43qqpyPPZKMOkCCjaIo32O1/CJiU8nUNY9/t2YRmyL9wqueXg2ds1qxeVD?=
 =?iso-8859-1?Q?B6WorTov2TgyFymkygz250c5/qtXvwViJ/mTwyyBZD3w0k0E3sY1l29ecK?=
 =?iso-8859-1?Q?rQtaUJKMHPTYsED/P7kg3Y2ghsMi/ltn4ox60m/OcM1mGTl4qfYCtxvEdK?=
 =?iso-8859-1?Q?9VbJZA9icnj7+Ho5mySnNLUkmCU9zUUWUj3R2QHRYurGNooch22/lE5qvE?=
 =?iso-8859-1?Q?1q+NQ8ZCFMC4+NVe0FqEC//gcsFf4Cv829tf/ApE6Zv8/iRV8bZPZ4MQw1?=
 =?iso-8859-1?Q?+3J4BGZa/npzzeaz5wpoLpOQbDnxmf12A+CF0hV9/vz2Rwf41RYlj1QLz8?=
 =?iso-8859-1?Q?59ynNXyd6aFo0B0SbHqQ76oTMwQ2A2YQW6GMTi+KahKcnljPoZIZg1E/1v?=
 =?iso-8859-1?Q?P9mXWumWWpVTNW7fqdEw1YphBZz4QalXV8R1twCAuwOsQzoF3ZK+WQcLf7?=
 =?iso-8859-1?Q?Rj3NUWTr1pIXB1mRpqoE0EBeBOLSbM4sE8TLxxjqzR2V8thHbsTvrsXOjb?=
 =?iso-8859-1?Q?0YY5O+v4Zx3T97e6KewbvaCgEMZdm0F5wpEU9nktmKyqfY079sxAIHRg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f66a7f-8ef5-4007-0252-08dd9a3fda9b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 21:21:59.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdOG3kAkf68rtKcusAUwusQE443SQrt8+Uu6ZSBJHzbQ3L93S5/eKp9e6iL+2WbUglzdw+W+j4cJLXTb426wN5Z5Wns5o7Jj5XudTS+ETBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9395
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

On Fri, May 23, 2025 at 10:42:33AM -0700, Lucas De Marchi wrote:
> Add the userspace interface to load the driver with fewer engines.
> The syntax is to just echo the engine names to a file in configfs, like
> below:
> 
> 	echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed
> 
> With that engines other than rcs0 and bcs0 will not be enabled. To
> enable all instances from a class, a '*' can be used.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 137 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 11ca36f194bfc..b27bbe203eb46 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -3,14 +3,19 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/configfs.h>
> +#include <linux/find.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/string.h>
>  
>  #include "xe_configfs.h"
>  #include "xe_module.h"
>  
> +#include "xe_hw_engine_types.h"
> +
>  /**
>   * DOC: Xe Configfs
>   *
> @@ -48,6 +53,23 @@
>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>   *
> + * Allowed engine:
> + * ---------------
> + *
> + * Allow only a set of engine(s) to be available - this is the equivalent of
> + * fusing engines off in software. Examples:
> + *
> + * Allow only one render and one copy engines, nothing else::
> + *
> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
> + *
> + * Allow only compute engines and first copy engine::
> + *
> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
> + *
> + * The requested configuration may not be supported by the platform and driver
> + * may fail to probe - intended for debugging purposes.

We should add a note that the engine names here are the per-GT hardware
names for the engines, not the names that would be seen by userspace
(e.g., don't expect "ccs4" to refer to the first compute engine on the
second tile and such).  Also worth noting that the mask provided will be
applied to the remaining engines (after hardware fuses are considered)
on every tile.

> + *
>   * Remove devices
>   * ==============
>   *
> @@ -60,11 +82,26 @@ struct xe_config_device {
>  	struct config_group group;
>  
>  	bool survivability_mode;
> +	u64 engine_allowed;
>  
>  	/* protects attributes */
>  	struct mutex lock;
>  };
>  
> +struct engine_info {
> +	const char *cls;
> +	u64 mask;
> +};
> +
> +static const struct engine_info engine_info[] = {
> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
> +};
> +
>  static struct xe_config_device *to_xe_config_device(struct config_item *item)
>  {
>  	return container_of(to_config_group(item), struct xe_config_device, group);
> @@ -94,10 +131,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t engine_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u64 mask = engine_info[i].mask;
> +
> +		if ((dev->engine_allowed & mask) == mask) {
> +			p += sprintf(p, "%s*\n", engine_info[i].cls);
> +		} else if (mask & dev->engine_allowed) {
> +			u16 bit0 = __ffs64(mask), bit;
> +
> +			mask &= dev->engine_allowed;
> +
> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> +				p += sprintf(p, "%s%u\n", engine_info[i].cls,
> +					     bit - bit0);

I didn't trace back through the configfs code to figure out where the
buffer we write into originally comes from...I'm guessing if it's always
truly a full page as the name implies then we don't have to worry about
the sprintf ever overflowing the buffer?

> +		}
> +	}
> +
> +	return p - page;
> +}
> +
> +static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		size_t clslen = strlen(engine_info[i].cls);
> +		size_t numlen = namelen - clslen;
> +		char instancestr[4];
> +		u8 instance;
> +		u16 bit;
> +
> +		if (namelen <= clslen || strncmp(name, engine_info[i].cls, clslen))
> +			continue;
> +
> +		if (name[clslen] == '*' && numlen == 1) {
> +			*mask = engine_info[i].mask;
> +			return true;
> +		}
> +
> +		if (numlen > sizeof(instancestr) - 1)
> +			return false;
> +
> +		memcpy(instancestr, name + clslen, numlen);
> +		instancestr[numlen] = '\0';
> +
> +		if (kstrtou8(instancestr, 10, &instance))
> +			return false;
> +
> +		bit = __ffs64(engine_info[i].mask) + instance;
> +		if (bit > fls64(engine_info[i].mask))

Hmm, looks like there isn't an __fls64 defined in the kernel libraries?
fls64 uses libc semantics (i.e., returns 1-64 for the various bit
positions instead of 0-63), so I think this is going to be off by 1.
E.g., if I request "rcs1" then bit = 1.  But
fls64(XE_HW_ENGINE_RCS_MASK) = 1 so we won't flag this as a problem.  So
should this be a >= instead?


Matt

> +			return false;
> +
> +		*mask = BIT_ULL(bit);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static ssize_t engine_allowed_store(struct config_item *item, const char *page,
> +				    size_t len)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	size_t namelen, p;
> +	u64 mask, val = 0;
> +
> +	for (p = 0; p < len; p += namelen + 1) {
> +		namelen = strcspn(page + p, ",\n");
> +		if (!lookup_engine_mask(page + p, namelen, &mask))
> +			return -EINVAL;
> +
> +		val |= mask;
> +	}
> +
> +	mutex_lock(&dev->lock);
> +	dev->engine_allowed = val;
> +	mutex_unlock(&dev->lock);
> +
> +	return len;
> +}
> +
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, engine_allowed);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_survivability_mode,
> +	&attr_engine_allowed,
>  	NULL,
>  };
>  
> @@ -139,6 +261,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/* Default values */
> +	dev->engine_allowed = U64_MAX;
> +
>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>  
>  	mutex_init(&dev->lock);
> @@ -237,8 +362,16 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>   */
>  u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>  {
> -	/* dummy implementation */
> -	return U64_MAX;
> +	struct xe_config_device *dev = configfs_find_group(pdev);
> +	u64 engine_allowed;
> +
> +	if (!dev)
> +		return U64_MAX;
> +
> +	engine_allowed = dev->engine_allowed;
> +	config_item_put(&dev->group.cg_item);
> +
> +	return engine_allowed;
>  }
>  
>  int __init xe_configfs_init(void)
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
