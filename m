Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E232CCA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CFA10EBA1;
	Fri, 22 Aug 2025 19:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es8Kpfvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C12A10EBA3
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755892631; x=1787428631;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VsgAyAkabncd9VETreELCE1rSzui6ZM8iepXUgJ7IKQ=;
 b=es8KpfvyppUAgKUI7fBTqojXiAmKU21ZMaE5H3ZNi2UZfSRnoYKuuNYi
 xpJMn1Tb0erRiW1WJgey73xOMel0x9FAkRdbbvrh8yqsNwIeOUP608i7a
 haoGdcsVYQON8Uz+yEgSKbfJYJw2PwuL4I6LnVMgoP+z1DRh4o6nDeU/F
 0hjr6ys0svcdl+BoU0WpUSMxbMg9GoX9+t4IVaOTFHt3zFTVySvhRhXPf
 49mFq4vTJO6DD4GWhv3G0ZHuzqBfPwEtmygWwg0QOHD2A8y9c9ZGPvaOF
 tXalw3SXw75vfRMyHkkBXbT7R8/iGdpq7fSz8FVJH+9xZLvxz2gJNUyYf A==;
X-CSE-ConnectionGUID: SjosrH6CQKW20V7BPVoNpQ==
X-CSE-MsgGUID: oNTg8VUPRuu8L6xD2DI9rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58274012"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58274012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:57:11 -0700
X-CSE-ConnectionGUID: 7ftBpVpLSjaDwvlqzQu4Wg==
X-CSE-MsgGUID: Z5hx2bjoScm+YuuN+mf0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173057037"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:57:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:57:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 12:57:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:57:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMuX7IEnTvPfEKH9goPoHLrqMBKsmMRD9e45eMHV5N1Hy+thJJAmPPZDXTjk7IR6+6C4PD4t3L4TX/InQZ8qmLEKQedva9cStikX2dqII08705Jk2Oaosq+3uzcdigtSvzUCNIIbRbkToJLQp/j8eUd/aE6aaGgQEmHX98WAfqdzALLKNx3jP6dxBg5xHujQgFk37BAC97cRIb514vLUYQvSmjTDxWg9dvs8qBft/wjGY2fSIIOjCUKSghWkrqfASHdhn6K3dikVr8gEt6pD61Pwb81dUNSYll5emteZVWiBiD4+Wk5UGvuWRC7gm/S3jfq/Zp5fVsvUOconWziubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25BgwQ9yTGe+gphPV2kco/G8kI8x6VFXo6vz2UPURAY=;
 b=vaUbGew6TVGRF54cYtn6OYfwv8dE+aWE+sRxQsxMV9eoziBUqtbNTTtyA5hRV13+N/+H+GTGoPAQRnrBRxK1M+XRuTrZZlkuTaN3Bwy7MPMKT3HHGOwx4lm0hLxB2+CXPXtkmWrhsuEtoU/NZVGDf6apsF69zijZ0eySxTMcV7i8uv1jCa94wPtjYLVQuIV4qKs1OfiFlRg4A8KgO9LyxjxihSHqtnB5BSnc8QvylGCwV9TnExB1v16g9FfQohVzvQBT6/MzqHFUddkqU3E168vtko4Ygj4gLxjvvOPFS3Ts0dqNsp2z5OPOOuH8dv5ugjXuCQhymg1EaWkmBHhcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 19:57:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 19:57:08 +0000
Date: Fri, 22 Aug 2025 15:57:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <carlos.santa@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2 3/8] [ANDROID]: Add a trace point for GPU work period
Message-ID: <aKjLkUPXJnNJOmJ-@intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
 <20250822085932.2221054-4-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822085932.2221054-4-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 4855594f-8d64-42a6-6378-08dde1b61358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TFyzVJ8gGd5r7nf4skBqm4Llx3Rbi5fVU87Wqgy3xPCo87nLMxexbPE56g?=
 =?iso-8859-1?Q?Atb6IgczfuDoBa73HPmcFvcg8PnBqSgIn+Oq89Q8OW7J20625oKak1RmRS?=
 =?iso-8859-1?Q?6a77lgfI5YNSz/XvU18Oq38Gsh2d9buGiumeTbLBXpXeffBWPiLNNQxclD?=
 =?iso-8859-1?Q?99gWDxhxX+cerwLcOH5KNo3K+eix1RcwfVaILudv8JNOMoHOjxzCSKmtMk?=
 =?iso-8859-1?Q?17yhWl090KVs6NUjgPyAUCZ1ep4psvKr/LvlAytwPvcPcDGmbHC1FBCdoO?=
 =?iso-8859-1?Q?YNgP4HbW4xAl9MXJM7Gnrbm7SL0bQAvVECtqPQxun1/LKhiMFEKThtx2pY?=
 =?iso-8859-1?Q?r0HN8awEZKTlCuJLymXUtPAFxqeGlbFyAurs5AshGX3sPH9eUpAi83Uc7p?=
 =?iso-8859-1?Q?9V5OMCamu1i1TnL0Euls6ca2wVsf+DT+iSadlUKYR0gS+2+x2EI9zmQHmw?=
 =?iso-8859-1?Q?2TZUNfymP4hX0UVwYi93LkMFX6xD0AusyGSX3LOXDje0NV3DjYD/rKZf1l?=
 =?iso-8859-1?Q?QNAe9yJZkzEU/VRbFo3KAb6rACBPENg5tp50WVVNXaFJ1Jgd4Aw+5GVRvq?=
 =?iso-8859-1?Q?BGPTX3c77TVmi3GFBJpUXQaJjYeLSP0PH+A6RTNymBY4WE4mZHnAqguYYM?=
 =?iso-8859-1?Q?8B1Ic30q5LFiZJf8Sk6Pc7SW6vXN8K9N77pzwPr5Bby2AMmHF1lVI8jBwc?=
 =?iso-8859-1?Q?XReiI77AKWOXh906Mnd+Icqk8XC560hz/hYjKvoetm7eQPv32IFxvv/+MF?=
 =?iso-8859-1?Q?lj9mj2eMyOX2nULY7SBU1LcxIRYp9BeeUkvx27MNyO+v+EMuyMvCRkD4FF?=
 =?iso-8859-1?Q?mSGTYAUv4cRTIAv5dd4YuwaGrgbPWPQTbnlACkBbCyMXEYYJ/Rccrw7yHs?=
 =?iso-8859-1?Q?rdNnYZyElX9ejNQ2a3YLjtv4UlXJ/KSH9aet5N4cWDHnqyKuCZetmVTRsk?=
 =?iso-8859-1?Q?mZ5dUVHXHR7CUKWdPDMIwTnWrLkC6gu1elOfTp36bYaUA4Nt/3aF28l9CI?=
 =?iso-8859-1?Q?Q6xnk58wCJfOwykfc3EYZZumTHHQaU/Cs6gxMaKfm5MEZ1ZNankLr1+Ym0?=
 =?iso-8859-1?Q?RBG/8Uy6LtwUHIKOcqjtLxldDKYoq9F+eSGkTZGt5r1tC5+1wVTznLg0rB?=
 =?iso-8859-1?Q?L76+L5qJZdvAF0O2peMQCZf9vEJow292MLrfQuFk+7N3fms8EuTKpXEWbK?=
 =?iso-8859-1?Q?cu0xzYsSQ0EwS2ldP4vfXF/bVpdATDo2jZmYOhJl7iS/+Kz8GJMssF9o5Y?=
 =?iso-8859-1?Q?EDMF8zge7J3hW1MAFKgEcoIT/gT0V/TZI3G9bZA8aXSVf8VdC8pA12rQ+w?=
 =?iso-8859-1?Q?CNrhXomNw57olTTml96VRErLRyZ2uw/ghM7lC+W3HNGReHBi9rUbXFSZVV?=
 =?iso-8859-1?Q?YvfipZyML5GnvSb8lBx88DeVSqe0AOXfsQAvSwD6hsXzzNE5CXzNmojfRa?=
 =?iso-8859-1?Q?5zJq+/h+fXP74mgoy1N3U4G4dt85w6zplV/cyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XNC9E7Q2hOFLFlXMLlRnJUp0+yjhQk+kFK5FWDF+3LeyaN7+Xaylvmwfcf?=
 =?iso-8859-1?Q?2/vVveKht0CSrFJ0cewyx6/nNPBMQOy8fQVoscH+zHZ6AlheY8sHd2AmDM?=
 =?iso-8859-1?Q?UE13sQPdoOLWLuIgpooAXJiR2UtEBhARdWlGrv6iLEJr3DBsobVkrYl89C?=
 =?iso-8859-1?Q?TnchcZ3Q1zEWMUA5qlIv+cqQkTVIvMhFGu1bC1oTQeG/HBIi8vp2rTZFX4?=
 =?iso-8859-1?Q?UaX0EGZhUQ181deyZbReQVkVngN4Yr2JhNmbLYWgHe8KuEm1NBzHo6/biP?=
 =?iso-8859-1?Q?/oC7y3ctF2gBAunHUb/Ap41GgBlMjvB7OQdybCROBqYV6GnIbYFA55Rtzw?=
 =?iso-8859-1?Q?/oy3sjiabpRjZfe/DoLxuMNOCMWwIFZ0N2TBinR4KUkc/H49g883Sfg+ma?=
 =?iso-8859-1?Q?ArkCvMEYJV0sSJ0LUUrDyYn1f1yBCYmhvf5+DZbFSRhKOas59rbSYiqcvR?=
 =?iso-8859-1?Q?XQNGWBO/NcCwWSAIkXIPJRjuEXNqZVFU6fozcgQs/UN3AXwhjX3RmN4s0u?=
 =?iso-8859-1?Q?yL7MjebJy3TnVU3BgRF7pKoWe2ZOBImMSxxbk+O6snSLw5cwjO1ODvznZF?=
 =?iso-8859-1?Q?c4KES7di14Ih7+kVYwP0cq/RiD58m5Lu19ag9FGwlvFL3NDSb/qr4Ds8t8?=
 =?iso-8859-1?Q?A/ZdwfU1XDfrn1RudxoxzoIfpS/ejjxB2xd+Iuq4r1wi42bqzPdpoZSiXS?=
 =?iso-8859-1?Q?/iRd7yXYpK80FFJlQDnNUwfiN8vT+UJfUHjZl8P76rS7bW3ovafhqyW1GP?=
 =?iso-8859-1?Q?VyCCMxt1N2KYStIyZAXIJie8PjtxUxHd1JpJr+xkmdf6e9r1L7dmsM/Mcn?=
 =?iso-8859-1?Q?2w666QaCaZOGdWwnB1nmUvL9EKoim2QhPJDofhUaXpf+A35aKGKtssIGNx?=
 =?iso-8859-1?Q?0ptSrZhKxNvwJKHfttv6B5lBkHHWCTlv/XbLmKdGX5TaccT7tN01bMm6HO?=
 =?iso-8859-1?Q?4zFZDSeUWA4oMvkZCBejR9i0D4ukrZlb8fj7jvSWnVzmqXNWGrmAMmSPyL?=
 =?iso-8859-1?Q?AiCcCpNAFIaILqlKe6FQhgsgP9/ubnYveQiPk/kv9ppY9jbGiqMR/FY7VF?=
 =?iso-8859-1?Q?iEB/c4A3NpQRz/dPPDzHve3fSimfsFa52YutzK93TA991g0aisgxUlVSWM?=
 =?iso-8859-1?Q?J3zg9czjnvQ89q/dgld8vCP/c63pWD5G0a/ptjusEFZ9b9pWLSn8Ojiiej?=
 =?iso-8859-1?Q?VVIc0yWyE6lYZUU+ePdgZdUokmIYScIUj+wfVs1NW4zqVjvuqkk9oaIg/1?=
 =?iso-8859-1?Q?qVBk9uNC/+P0LocVpawmS6BSUlt2L9Q+6xbWarUdoJ5SIl9ZXSxVOVoUr/?=
 =?iso-8859-1?Q?ktm6rxtV+ChQdhhSe7HOgPuHEXV2AoAKX5n0iYaXnCEXgoMW+ePZCGeMl8?=
 =?iso-8859-1?Q?cUtjcmX3ksmuEzXexsh1bKxCKxq8kVmselAuwD5ewGiUYFxZeu6v/r4jlC?=
 =?iso-8859-1?Q?wuhaBQubMyKUbPkm3gFGJT1Xng6JCG3c6SbL0ZaP2otUgWfkZJsQ+TDRLS?=
 =?iso-8859-1?Q?gez+s/62Kd/Gb9jWAeNIraqq+btMzRln48J2sstq8JSdI2dcvqPWWtLfsR?=
 =?iso-8859-1?Q?PpzkZeiDcg0qYG1wwuop5NvHUNsEGdfIEeXybmxhIwhr/Q//eY82TJ3Ro+?=
 =?iso-8859-1?Q?3vhAXLQ0rUNHEIJniD+YEqynAIyEaX59i1uPBQm7SVQ2ls/GYrIW9i5g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4855594f-8d64-42a6-6378-08dde1b61358
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 19:57:08.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zILTjb8BKaCoxbORyKjcCJE/39Ak1BYM9iClbNKCgDrSoLKYy8UQVhXgKjO7TWOCymLefhsh852zS58YbYeH6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
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

On Fri, Aug 22, 2025 at 08:59:25AM +0000, Aakash Deep Sarkar wrote:
> The GPU work period event is required to have the following format:
> 
> Defines the structure of the kernel tracepoint:
> /sys/kernel/tracing/events/power/gpu_work_period

It is okay to add traces in the driver, but in a xe_ namespace.
For using such a bold name like this we need to add this infrastructure
in the drm level.

Please move this to drm level and include dri-devel in the proposal.

> 
> A value that uniquely identifies the GPU within the system.
>   uint32_t gpu_id;
> 
> The UID of the application (i.e. persistent, unique ID of the Android
> app) that submitted work to the GPU.
>   uint32_t uid;
> 
> The start time of the period in nanoseconds. The clock must be
> CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
>   uint64_t start_time_ns;
> 
> The end time of the period in nanoseconds. The clock must be
> CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
>   uint64_t end_time_ns;
> 
> The amount of time the GPU was running GPU work for |uid| during the
> period, in nanoseconds, without double-counting parallel GPU work for the
> same |uid|. For example, this might include the amount of time the GPU
> spent performing shader work (vertex work, fragment work, etc.) for
> |uid|.
>   uint64_t total_active_duration_ns;
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  .../drm/xe/xe_power_gpu_work_period_trace.h   | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> new file mode 100644
> index 000000000000..2de05f1b64f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TRACE_POWER_GPU_WORK_PERIOD_INTEL
> +#define _TRACE_POWER_GPU_WORK_PERIOD_INTEL
> +#endif
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE xe_power_gpu_work_period_trace
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#if !defined(_TRACE_POWER_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_POWER_GPU_WORK_PERIOD_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(gpu_work_period,
> +
> +	TP_PROTO(
> +		u32 gpu_id,
> +		u32 uid,
> +		u64 start_time_ns,
> +		u64 end_time_ns,
> +		u64 total_active_duration_ns
> +	),
> +
> +	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, gpu_id)
> +		__field(u32, uid)
> +		__field(u64, start_time_ns)
> +		__field(u64, end_time_ns)
> +		__field(u64, total_active_duration_ns)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->gpu_id = gpu_id;
> +		__entry->uid = uid;
> +		__entry->start_time_ns = start_time_ns;
> +		__entry->end_time_ns = end_time_ns;
> +		__entry->total_active_duration_ns = total_active_duration_ns;
> +	),
> +
> +	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
> +		__entry->gpu_id,
> +		__entry->uid,
> +		__entry->start_time_ns,
> +		__entry->end_time_ns,
> +		__entry->total_active_duration_ns)
> +);
> +
> +#endif /* _TRACE_POWER_GPU_WORK_PERIOD_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> -- 
> 2.49.0
> 
