Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099CCC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 13:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73CB10E5AB;
	Mon, 14 Apr 2025 13:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiGDVaVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F210E5AB
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744636859; x=1776172859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hQ/cbIBaotPDrN9acKxfknUGRhUMU9UpMLHP9ojsjKY=;
 b=hiGDVaVzDPfj5SbWZI2DRG6cvAQmFeTpM1M2t2YqMAsbfYibzoeluCD0
 iIqkU7RVRHBTMUyUxElHFI/t6clyyuy9CK6AqxJBdXmFQ7duDNlVCzGie
 /5OUZV0jaHS7uCYjVx+tihdOT/kB2H1vMsrifcJm24LQdav2Uc3e6DQRw
 0673peBKInBMWJzYn9VB5IkE+pG8tTWnGuMiaIYewbddjQvcakTBrWcvW
 +sltEa7IKZJOy/1YN80h955EyQ21MU7QY5AQkEl8uzbk1B2ufvG3VQM6N
 dMVxOqog6lYUmjaxsXN5P/X+dNXoOJreKPhNXT9gi+k+SV6nyUWIIW4n/ g==;
X-CSE-ConnectionGUID: 5tj4Mf4aSaGva++7Uz4New==
X-CSE-MsgGUID: NxEeXr3kSLKuBxUp3c1mrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="63509122"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="63509122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:20:58 -0700
X-CSE-ConnectionGUID: QcCMCSHcS8+Px0j+nK9SvA==
X-CSE-MsgGUID: /nN5NpwgSDWe1EDFwVZLrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134864079"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:20:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 06:20:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 06:20:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 06:20:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjZkKQa8NEFrhoLHFGYBlrh2cUE0quA7+DS58pcES1s1l0as5GZvfczZZqdFi6f73D+oi3pf4bWQilWxee2KUu0YDDV1gFkIEM6LgH3IO4fBje+tkyBLyXAs8TdlAXhPgzPSo/Bml59XkndVXbBNTlw3s4++NVucQtjwSSM40+3bJlYUQyjsHjr2nS9rCcNOpKQyQ1HA558cY5A4xJV8+ZHcke2nX+1h38vVZc033zRkEY7CTidn2ohrHrjedTJjJgYU4HWU09m3E09LY/tacQqo1BmILz3lkZ2I4qtvA0cqFUQc+FJl0cnHq1Cfr6W2pRXKCwnBpuvFZHJNidoCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ/cbIBaotPDrN9acKxfknUGRhUMU9UpMLHP9ojsjKY=;
 b=v3ORTAa/MF5kGdbnWRhT+MVoYceItzsONCrI1J0oiuyFf1sFO962Ei2/0Z3p27jRf4rcGjCgXc8M0y6mz280TRrnshHOIK2gMs21GrAt2AKbfsQwjxVQ+XMnoAeg23JhrIaszECDMW9d3O+9fFDJxelDPeX1DJePCY2JHO+jGBi2xmxCG9LyV2/W2XzVQmxUPNC4sq4ZgBWHfDB2mLYmeJfvqo7lu6L1GHLMMm9a44r+6A4tTKf7cR39Wiq0uDsUrzcXJe6m6vin1XzE/oHSxIheKMLRD97noSEWaCj/KOtUPsLqWul0y/TvBKYxI4+vq3bqQUsjU3BUYVHgqFmKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 13:20:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 13:20:55 +0000
Date: Mon, 14 Apr 2025 08:20:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Chee Yin Wong <chee.yin.wong@intel.com>, 
 John Harrison <john.c.harrison@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Set LRC addresses before guc load
Message-ID: <mxnwdbgv4gggnchxgyyvbvvjvfrqpl7w6kor6bk7zpe3bdfchh@omqdgc4ywofz>
References: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
 <Z/dYyioDSygp6STJ@lstrano-desk.jf.intel.com>
 <kewdxij7zovagst4d43xxi4ckckopppslirb4nisccdc7zq5c4@ch7iamwx3yrh>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <kewdxij7zovagst4d43xxi4ckckopppslirb4nisccdc7zq5c4@ch7iamwx3yrh>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 272093e3-cd67-4443-187f-08dd7b572ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i+TCptd1t1u9tB/R3sV6w8k8ufXHutZwORfkWQ9vN3QnFwpzpiOp/hmrztqe?=
 =?us-ascii?Q?jXzcEBxxBtvNNyFWSWXC35MRdM7/2CNgBS8yOgbR5qLenect8oJsAenFDDqn?=
 =?us-ascii?Q?TVK3Cn7Wlj8FXlz8J2on47IGCKcvTFJf8VBIYuPWLhYXWHvqtmFELQMnK4zG?=
 =?us-ascii?Q?d14k3CI/jqkVmZd1QzY6XPqIC0KzS5fct9Qz5hrcbj8Vhs9FvkK+f4e9bGaK?=
 =?us-ascii?Q?R4LycEEQ2JKAqgFUv1/EPkwiKj7AU4bBjc/puLadAyyukv8wSHpKl8AD8Bcm?=
 =?us-ascii?Q?Z8E+CnG8527Ijb6zV89VxvolqmdF5Sft11FSQVY/i0BK8U79lbZz8nW8A6RZ?=
 =?us-ascii?Q?ozPzNO32QhwGoAikmqD8CERLJ+lHaoaLrFGVNwyqqW0DqawkHqxlIeZb2dfH?=
 =?us-ascii?Q?G0t5cvaJ9G6f/nJ8k97ZRi2AWqlHT6IHZ07agv3LMkDhwxCAqioBa0MWQPYi?=
 =?us-ascii?Q?iGWiSsB9M9X/6JpIukH9BllQlgvOzUXbKB/9E06xUK+77ZAb3kju0dpyd62L?=
 =?us-ascii?Q?tIr93ZvjWnOgF/3jXzxITQVcVPcNcoENcm0FXvCPTSF4eh2/PDlXSZwPamfB?=
 =?us-ascii?Q?Ic96Ej9MmVShbjwA9l0OV1xiNrEDDOCLr1NVjPDOZ+PGvN+GYKOPVVDPncBc?=
 =?us-ascii?Q?FA4uomi2+ehrI4VyYq3keZSv0DfqmQbcXni9dEV99IJmMPI0IK7/hUqkQujY?=
 =?us-ascii?Q?Y76McwTv9Vs4oQzYZV79ZIf4LUwucknmshN+Ik9tMsRvjBNDzswxs6ACRH7T?=
 =?us-ascii?Q?QodIE/X4oBmZwM9MYLjH39CVxUDAd5dTambcYL8E+kT3yj7VD6TpY43gt6dP?=
 =?us-ascii?Q?+cJV7KYjQZXhcvC3T37w+NyJRBH2Zj51Xdtm0YomSQ6FlrISL6ldu8yxEYHS?=
 =?us-ascii?Q?wTjuNty9S90iGZgVjMM7X7A3VSkOWY/5dYyy6lbz/7Z2Vw+TP/swcfHR90Qk?=
 =?us-ascii?Q?iS+t0mjL17XaFQoZYQSTbYAYZTtfP0MNikksyCMH7sMNYPidxs8YGWw8KJa7?=
 =?us-ascii?Q?xq1csW3CJDi4FBEl4OoZ5r2MXgwH8pXBMretQW0YLumGwz/OI8tjLwX0h45t?=
 =?us-ascii?Q?TvZjo2NIm0WgusbQS9Gye0uRAew77huASfOIC0jL8qF1IMXFF3Ncp3JNpEpJ?=
 =?us-ascii?Q?AEQd4GEAJfmESkVwrSlDi09GFVFbzu+UTX/Hzzjk/AgbT0JYMF+yncb6uLk8?=
 =?us-ascii?Q?U7vAGAM5hN7y9J8EzqIz+bw7SgX+mgtnvjVmWeZckrfeWXet4TFou2prtPDB?=
 =?us-ascii?Q?DbKsBqo1gZuKyVVfzF5h/vAnUEhsU3xPAoxfwtTGWmFH1h/Whv0p3cqkhsaU?=
 =?us-ascii?Q?C3UA70ArMxNcig03cKRShdwUCxI7mBeJtRu51MHDiMpNDleOjeA057QuWRDH?=
 =?us-ascii?Q?bNy5VUf4cusMtCTXuCGpGNmeRoE+4o4yxOzqw4JwOBZjNjqY69KCSPLn4PYW?=
 =?us-ascii?Q?Z3o0AdH55vs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0oO5M7tiPCn3IuzF7dqaR9Ok50SlqIhDzWqu9TDrciCK3lZBkW/8/fy6oh0q?=
 =?us-ascii?Q?9D3hkWFMXgOaAmWEMKSglNSDAIb3HLELQ/++7TTheG/AvRfBGqfuoBGfjtro?=
 =?us-ascii?Q?Ciavzq3R3F21eLBMY5oxs68GC2Qqa59JDQXudELydfR/OkxcsNhWCu7cSl24?=
 =?us-ascii?Q?EUaXCwC2GXhc1aOAbqLJiFfju2TA6+rqLOhoc/nNPHuGfLSglDiCg0mUzkhL?=
 =?us-ascii?Q?SSfpleHzXMnCaNvlRzIWe545Tc6nJiWbo+vgguJJx8eu7jwbEHOxHrWbm14k?=
 =?us-ascii?Q?/7zQbjT1XiSzTbsSgdWl1M49UIcezblpXLqcGn4Pep3M/0F0p6jVRQ9iW8ln?=
 =?us-ascii?Q?KfHAHDP0G98I+aePfcU3tFXExhDRrkDK0BgTMpl+j/eX6xnqG9W10YDUlrM3?=
 =?us-ascii?Q?QO13PONkGFFtk9GFo3Rd9PlutH9c8sf2xewaq4EefMhlxKs0Cf9i7e3opZ3M?=
 =?us-ascii?Q?oBOxWYz+dtT+l0gRqYGt8+GxAed28FO0YHu8+HTrwM+ldJYbEv/8QwCjsVgo?=
 =?us-ascii?Q?YlEI866Q6xfCfjC//DNYrjGhLBWxCMT3LK5zewdfpJ6bjGL6STzdyzRVQRa1?=
 =?us-ascii?Q?Vhjo7Q4Rd+Pns9F7u+QvQs6j7GJQP6afhQgIvR+AcF7+BYdkA7pjkHrwRElM?=
 =?us-ascii?Q?EpBXvmJNnGZO8euvHKk3e9k8HjlMRuJU637EosvT0YmWMYCm0MzDfTiq9BVP?=
 =?us-ascii?Q?kE0vZWhyCS0IjgAnM8i8j3w+rRHd+C3MS0BBynl/Oe9Nn+t33MwEBPcV/+j+?=
 =?us-ascii?Q?z/TEQSC1cLlb96olGutUACBnuBYbZHqmpiDfVNnEPkcyPgOoLYIkDx9Jgxes?=
 =?us-ascii?Q?k5LMc1C74bBZDUM3O5FsF6pzQ4XVTcJEAGlnLXirzJebDwgnisWR+zhZJhtk?=
 =?us-ascii?Q?aAyK65aNUSa0f4qROa1xCZ35Pu15k4abiSgFgYW4amORgbTQgiqLeHZbrPQu?=
 =?us-ascii?Q?hbostEejdDn9Qc1e9ZVGJUhP9we0tCjQyg+U7F/hVZvf1MayW2NPyF+pd2Xz?=
 =?us-ascii?Q?aYc6sljKkcB/PxCFT1lWjmObw8bbuy2FCHJutBnKfN1oczANdwBaZG3O/uoo?=
 =?us-ascii?Q?kBanjHudNjlbuLMd1BdfRDK3LNm4RZetB7WX2xbwKN7M8twuUjxUDgPX9gM6?=
 =?us-ascii?Q?z09n6SRP5/qdSDc/bufu8PeDHI+QVK3dEtMQFKWd/nxhYxebnoc5r576rw6O?=
 =?us-ascii?Q?/wgkbs0LrhR7Jdw13cl2P/RIutTCMXQdyV06h5y5bc4+BkNQEdCj/OY492rt?=
 =?us-ascii?Q?prNieA8/6tTv3YM40PS0hnlyMqN2rhon28qmb36z1y8Iaf815Lj+ESEzZcEF?=
 =?us-ascii?Q?lYRslJ92QpB50+9H0jp44PXGmGFvipMf9mxYnyRryAn0pMAuYgQuT+FeZ8Y+?=
 =?us-ascii?Q?7F+MpHwuZlxrFxwSSjO1QI19kJBj/IEbdQA1Dk2W0uZaHxMnd54dBjo5C8Yp?=
 =?us-ascii?Q?sqN+A0dsKfaKHowAF1fZI0xjImV82pPveh0d93TSK9OZ/f6jRQboLtjDWlDR?=
 =?us-ascii?Q?QMWblMN1+jTACPd0toBXdfDaEUM99OqppoNhTYBbxhoB7TyidCuGSZFaIdup?=
 =?us-ascii?Q?OcwvknskiXUbZixMg+K7OkBSM6ANzEYSkQJ45vmgLsC6FxS2yrOTzNiiajz7?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 272093e3-cd67-4443-187f-08dd7b572ff4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:20:55.5343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP3L7liOiINdlqfurTbqzFNGLTy7LsALEMvueY3M2P0Ru05AiO4KIvlTJuk66Sqr94cdJ8mT2sJNQWk80XBeGUIipvsVmRdMioRZexqqjYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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

On Thu, Apr 10, 2025 at 11:01:41AM -0500, Lucas De Marchi wrote:
>On Wed, Apr 09, 2025 at 10:36:10PM -0700, Matthew Brost wrote:
>>On Wed, Apr 09, 2025 at 09:59:34PM -0700, Lucas De Marchi wrote:
>>>The metadata saved in the ADS is read by GuC when it's initialized.
>>>Saving the addresses to the LRCs when they are populated is too late as
>>>GuC will keep using the old ones.
>>>
>>>This was causing GuC to use the RCS LRC for any engine class. It's not a
>>>big problem on a Linux-only scenario since the they are used by GuC only
>>>on media engines when the watchdog is triggered. However, in a
>>>virtualization scenario with Windows as the VF, it causes the wrong LRCs
>>>to be loaded as the watchdog is used for all engines.
>>>
>>>Fix it by letting guc_golden_lrc_init() initialize the metadata, like
>>>other *_init() functions, and later guc_golden_lrc_populate() to copy
>>>the LRCs to the right places. The former is called before the second GuC
>>>load, while the latter is called after LRCs have been recorded.
>>>
>>>Cc: Chee Yin Wong <chee.yin.wong@intel.com>
>>>Cc: John Harrison <john.c.harrison@intel.com>
>>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>
>>Fixes tag? Anyways patch LGTM.
>>
>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: <stable@vger.kernel.org> # v6.11+
>
>Before 6.11 shouldn't be relevant since we didn't have any supported
>platform, let alone SR-IOV working where this reproduces.

Applied to drm-xe-next. Thanks for review and test.

Lucas De Marchi

>
>thanks
>Lucas De Marchi
