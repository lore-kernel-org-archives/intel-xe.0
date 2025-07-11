Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC1CC8303C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 03:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688F910E252;
	Fri, 11 Jul 2025 03:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfuTQICf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045CB10E252
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752204750; x=1783740750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yPzEi+7zcebXqj0+4/gNDlx7orwkrjYkFBiBEsU+ETg=;
 b=YfuTQICfS+Xnnj1zi3nFWYkGPy0PBf75Nh40UwYdQWQceWO3p7FCKxWC
 AQ1zRnoHHaFDQx9z4W0CwQ/DucBCibNPtx4fkfaNB1Yc1BrsFOuzRgD3Q
 hHcLe43RsZvrO5zqtX3CvYt4B09M2oiFRLvNYJ9sqTHA2ZfBKAyJeBo1w
 uQAWkPfcAUmC/BauMqxVIHO1Dfdw7CGq2prL0IySSEGzV4MWBz1OWqghG
 25k5aR6woIH1thewhOmTVOqxhjmDyawkcHnIukswLwolzseVxpDAhsfns
 JG2LJ3fovtycCtMTZ2uqX5B0nKFSYcie0agujlTRSQxR0C1I6At63gRTi g==;
X-CSE-ConnectionGUID: +ApDpzVqRnSUh/A0jqSLyw==
X-CSE-MsgGUID: PoCbFlq9Q+yEbvrM3yEijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="72079511"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="72079511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:32:30 -0700
X-CSE-ConnectionGUID: W3dNYBVkQF+AIE1mx0WWPA==
X-CSE-MsgGUID: Sp8QT/yuRmeCwxuZ16pfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156989319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:32:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:32:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 20:32:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvG8VigvNBUJQtNsl30qAQSYWsp+BU0Bl+VOYloDLa7LEOWupCqmRkX7QgbHIstQEGNXn7KAQg10Vv+mAr+iXf8QkdltU9lHGnFVlUCi9rJA3iACBlFIFZzqlrRunP+41DWeMKiW6hUfKv2saSM+2AQHWnGFVCZSG3U1/2rFf2LLkHMv/mXMyIFAxqFOi/ymAr/UiOLA6rG2Hr7eHaSTWBj3abVucVq8UxTTJb/yqWJEBjIGMdZFUZFHjUP8p1abIbhMU4bklrcp39Sob/7dl1Vb9rxy0gDIA0iB7gQyyCxUxDqUI7WI3L8raWWIgfyuEL/8f1X3l6m6vf4MgClMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv6q2gg5GsqE+T+2QqD9tI+LBUH6Tn9lLKnpmOzwGoQ=;
 b=VjnsIjaz9yxRkUNevKBQHDddYcc5vLPDhbPtlchh8FrVPWD3MWRt4sbSyI/cyTPsK4oUtb1knxoLpJ+drJhgmNA60dWaE7szrF9dooKI0a5doOJtkW7krJCubzV/8YqKV60/agFd4hCcc7KK42d4wQ1lTNwz3uizZrfQAdqJN6fytcBZb/QEwziizFgv4B5AsN0NVaH/d8tNq6cKKo/tXssf5qP7wKeM9GQp9tYDuyIMQpdOYbu4vnjNnGqFZHIkAjTJfZlCTqgVI4SX21OUkhYZKiFUn8TBEhGqnScX5fUGEbKvlpRHJ9Wlsjl+e2rjQ3RulUt9Oct01YlxPAKv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Fri, 11 Jul 2025 03:32:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 03:32:25 +0000
Date: Thu, 10 Jul 2025 22:32:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v9 4/8] drm/xe: Track number of written dwords from
 workaround batch buffer emission
Message-ID: <45fyfjrhyhikfn6rcnjva24ontgvvev6xsxgjjidit7z72ix5s@xixbs7r3slzk>
References: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
 <20250709105455.93902-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709105455.93902-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f47b9fc-2700-4f6c-f5e5-08ddc02b8dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HcdDqpcH5Dgg1KPFZxPU76rmBtKNFKJCdjNyPjPm7RUdD5jJKA3vvhinVmUU?=
 =?us-ascii?Q?a8ruX7cMhJ9MP00VRbF7szzLDjBkRSHMXXtmE1WX+F/56OAj6fldUoXkYT4c?=
 =?us-ascii?Q?g2cyIr0T4JQQJ5PCPtdIzS7rGgxpFYct3G5ii769BnvezHkPH4wYIimvwpij?=
 =?us-ascii?Q?CbrFWv9YGEi0kCudLgFv/DC1bkbL1HCbJh8by1CLIA10+PmQsCEbH+49u5y8?=
 =?us-ascii?Q?WNePZMY30h+xsx10GcgBkTRpVK6YI3YlBeD1vcQfUZKNetjxzIHv4gXMqF8Q?=
 =?us-ascii?Q?QCLVFDfvt7ycJOZ+0YRmPCiot7I0fCynL8ugXvU/7OqEzwGP54RwM5ALZi8A?=
 =?us-ascii?Q?4gzMV1u4jL6H3y8EaWgmOSQ+e1SmyE0/QFSw+W3qhclR4TDrAWW7LXfFVi8v?=
 =?us-ascii?Q?Nw6iSkUn7Ze9jpzeaO3QTFVRTlYTO8FONx/AVtfa+dZ5Y9d9IQgOSRdwR4+O?=
 =?us-ascii?Q?Thzb/mdS7yFWYpZzug5Aiu1//a01faBJZiRqTpGhJ5dUow8uNdc5u7/5RPXM?=
 =?us-ascii?Q?UAHdly8qiOscS5V4+zg7YMbqOGDnbEybO1c5tqsTwgz+PKKiko+c5o1e8xc4?=
 =?us-ascii?Q?/k3m3yFnIZJYVT8oEmW3vqFPPPJxFuSbHTe+QDjEuzozswxLpA8rvmcFML3m?=
 =?us-ascii?Q?9j8L5ILikFD/Hd4sqvzBV6KQRFdCXj+C7CUU0HV+ivYcH3JpvkzmfKSAj8nP?=
 =?us-ascii?Q?d6YzRPciMyHgGuLI/M+tArQ8/JvMcc5nAxA7/P2cCMcvxpZmXXhlauIjufsK?=
 =?us-ascii?Q?74Cft4B4+tLbpCP1JLAHAn6qiMlaWnMDS4yz4p1DZjNun5lofAXf2AjkbTJj?=
 =?us-ascii?Q?7TvNtcn04dZ/ICmYAFzJnkn/2vwjNHtyunJjNQybQC8Ah3zaeuelobIo+aOB?=
 =?us-ascii?Q?UX9mpqYgObK6Zlz+MisccmkLHsITAdobmgpHtvVnCrSiE7ZQX1uptobwe3dA?=
 =?us-ascii?Q?AJRdPux3KMqRE1xADAJsCvGKaKnzT/93WCyaU25ofrqha0ajUa11cDfMsq0L?=
 =?us-ascii?Q?EMWuYsxqy4Flz++QRX7f+kYIhdf2GtlNvbM8H+WAJIa1Nqu2j6BkCwGSqCjv?=
 =?us-ascii?Q?PUlTM+rphBe6foLFKlzYQA4189vFRLQHAGascuPqDOV3aW9blRmY/6W+nfvq?=
 =?us-ascii?Q?9afnCW3u9mAzO6oef8eOVGZRiJqkwOHt/G15GGGRA8V3CSc3gtUASjEXBl9B?=
 =?us-ascii?Q?i9ncKqoNzzIyVtwi24O/nxqrWcPI9LyAFAjASIFuJk3ua+1Op5+8WMBwm3sS?=
 =?us-ascii?Q?FsJ+53p0gkZnSawaAq1oKKxyvV1yEwL4fYRh96y+bTM/n+29NIuCoJV8I3VM?=
 =?us-ascii?Q?Z6UKDtXyMj2nTHcoh38Lxb2OxjwiJDIrmk5+luX6TjS2QvT8GzQUpiAxgtwT?=
 =?us-ascii?Q?p9wfCdr7dG4rqTvAMCkP35xIpFSzcnyIU7TG1ypGpnAbWkt4TfYveXDGyC6M?=
 =?us-ascii?Q?0Y+ae8w7Rao=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7DYKMeHmsTWevV8egcTUeE+XcNnJVYZfXLeBDNYlhGaqVIt7Wtx+D6DiSnvo?=
 =?us-ascii?Q?ji9Hxdd5nvymYcg6YRlBJn0emMFHKcf2qCA7OZ1LAJeu6A7e0sZWcYsJruLA?=
 =?us-ascii?Q?FHQ8P//scjLjDxyxB4EpSCVDNB2TnVkcuWb19nZVYQfFYV1zSZLXLBFrndyR?=
 =?us-ascii?Q?Ru63XRr18Kc+tXW3+VkLY0F1lctu0I2OzUkftC7HTALYGV57iLkJBaHdM5aN?=
 =?us-ascii?Q?hYbUcDT0DVynwUNo/VfKGYYkYiwOHLsuRSXyQaaxlVi+NtrctcVq61cYAlwE?=
 =?us-ascii?Q?sB1OVjp9TdMK0RlpU7BPOgbdvZwqz4y1bODoxEP0ye2c6ZjuNsXOwMCtNEoH?=
 =?us-ascii?Q?WcG6nDrxoEFzBOODLumBrqqmn7ihnPJjULkr7tdH77UKiCHD6B2dzyCLTTls?=
 =?us-ascii?Q?riH3ql95IG5ptnhG5RwmdcloG5OIH1k8xnqpqxkt9TPgJecC+c3qPEoRbJQK?=
 =?us-ascii?Q?ju93Moes7G2eNgttyjd4epd3c5i0opGu/6gagtvVOz0GhYsaub8vpdxwXb+7?=
 =?us-ascii?Q?r228/2PD/9JNiLVynK3aWazxo0X6Re4vPGjGckDa8iLCNswC8SBCIDmi90aB?=
 =?us-ascii?Q?g/zhDEVlPBrXOvRdNQI24NOkwoqeSjU2FU8ltIuORLN4zoQeBJEADqbXDJRT?=
 =?us-ascii?Q?b7HnpBrIOJ8n2G3cYOXejPvHMrExP6y9oNRUwMOfW4uVXz0NUqlk1avArWIz?=
 =?us-ascii?Q?lODT/pWRz/wdhC52RWkvAzXsbaC7YDb9orK8ftCWCroEjOK1f0zh9wj5YV5V?=
 =?us-ascii?Q?8+CxYG/tSAFkHWfkrgeT6nXIYDqv6K21tkiPqBqY1lGDiOQGBGcSPsxVC3Sm?=
 =?us-ascii?Q?7ngwYaDkj4eGklp/yTBiTtqDDIx7ID81EMT13Muw+3YPbvmi1aXaVJTQEtWV?=
 =?us-ascii?Q?iAmqfWmXCvBnrEX148LC6rGtWYcd2vzwFpUZQJnp/OITmjOz4MLRT1ROl/Lv?=
 =?us-ascii?Q?1knd+tbEAQPrqe5S2reyfJK8g1sezTJH3jEWkbE9wNqedhclUaNlvLaq5vvU?=
 =?us-ascii?Q?1OGtKyYhvFmNtbm8rthZb8cmJrrLDN3A5i4/TboMewuk22SZR8J7syElHmX+?=
 =?us-ascii?Q?E51L2e86HH55KaMQcI7pN09bOQa/h73QH4la9qGhbD8mgNOsSG+OG6kj00G2?=
 =?us-ascii?Q?8vD35TjipZf7C/UCPK1Zwfv3yLRB7Kj2lu70kml4GOaO0aUf1vs5DE2qry4U?=
 =?us-ascii?Q?l5ua96kGpPWEfZbFUmHfCJdJhvWnxZ1LGLaHvAHFjTPJI0B+tIhTxsBkodVv?=
 =?us-ascii?Q?NZM3Y0XJ0erRSyTb0tGFnGSDTjvoMn62K0qzcMeoNIGnaJQERlX2pYCMssv5?=
 =?us-ascii?Q?n4zozTvTixjsR9ZMeYdbNWbNEQ0rBHoTtFWOFwc63MaW9BYJocmHpXY3u2Fd?=
 =?us-ascii?Q?+Ck93uRsB7qTd7hw61xLypDJkpqZ7STv0YSjC5WZtOafUaZ0c7Rz5gYD7KZ6?=
 =?us-ascii?Q?mDWbOu0BokYE++4TrwAEDJhM/EBYJ92/MZuQewL9FdN1UqllZIWf7UZ1pZPA?=
 =?us-ascii?Q?pzMTcXLmkUC3lkMuj94N/tc3pVN6IikcXaAzp99IsdjxyvJNQ8uyMh3Yf9mw?=
 =?us-ascii?Q?2Ph0ArVQWAwx3g+gcLj1v/pvTgL768ZiJj0dWfw8+IGbeZ/k+9Cp2IARG40O?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f47b9fc-2700-4f6c-f5e5-08ddc02b8dcb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:32:25.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +roC8r+cpEB+3WcgNNR5MakqfovTdSYDA1xwclZFQU3ocxp2nkPyMu5nDK3giwQFqNsoAnhRk2ZUB1VKWCF58bIZuEQUo0dmW+PpOYtAdos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Wed, Jul 09, 2025 at 11:54:51AM +0100, Tvrtko Ursulin wrote:
>Indirect context setup will need to get to the number of written dwords.
>Lets add it as an output parameter so it can be accessed from the finish
>helper regardless of whether code is writing directly or via an shadow
>buffer.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 5d5b76f16829..229cfde91799 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -991,6 +991,7 @@ struct bo_setup_state {
> 	/* State: */
> 	u32			*buffer;
> 	u32			*ptr;
>+	unsigned int		written;

nit: since everywhere we use "len" for the number of dwords, it would
probably make more sense here. As well as s/buffer/bounce/ in the
previous patch... but not critical.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi


> };
>
> static int setup_bo(struct bo_setup_state *state)
>@@ -1023,6 +1024,7 @@ static int setup_bo(struct bo_setup_state *state)
> 			goto fail;
>
> 		state->ptr += len;
>+		state->written += len;
> 	}
>
> 	return 0;
>@@ -1039,7 +1041,7 @@ static void finish_bo(struct bo_setup_state *state)
>
> 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
> 			 state->offset, state->buffer,
>-			 (state->ptr - state->buffer) * sizeof(u32));
>+			 state->written * sizeof(u32));
> 	kfree(state->buffer);
> }
>
>@@ -1063,6 +1065,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 		return ret;
>
> 	*state.ptr++ = MI_BATCH_BUFFER_END;
>+	state.written++;
>
> 	finish_bo(&state);
>
>-- 
>2.48.0
>
