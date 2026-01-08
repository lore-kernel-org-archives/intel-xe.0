Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9C1D1D492
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 21:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CCF10E7C3;
	Thu,  8 Jan 2026 21:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dj/MWhIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758E510E7C3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767906412; x=1799442412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CYvKGnI6FybfkwF4L5+cItwNuGeMShtKI4tCbbKID00=;
 b=Dj/MWhIYVVz+wpTyF+K1D88KC31Ytopeeb87XlNt8+DiIdAB3LSyfHLN
 0fnGS/WwJyG04bMsz+Gor7Y3CLESbNBPbFm29+aIrSsoyW1GywXIet+SX
 VezUwat1yxGc5gs3pqSxg6HsnQBk/WeWMKz2iLDCT+mUDNHBie7MfBWJ+
 ExGmHBFa0yioxyXldLo/mSmHCfbGVsbNsYRvDNXJ9mzue2abgIawC/4r1
 SaycWBMGxTh/bPFKaG4V7FETOBHVCF/l//P+Hpqm5w20HFn+AJioHOgGm
 xwNaXu+Kc6q1I05YQ7f23UcqP2jgUh2wjS/tQG1+rxuGusjiUa2E3N8Dh w==;
X-CSE-ConnectionGUID: DukD9xg9RyO43YX6/GTFFA==
X-CSE-MsgGUID: LdXi89YaQw2JfYy3hckJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73149839"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73149839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 13:06:51 -0800
X-CSE-ConnectionGUID: X3ySTWqlTVKWSAIOZ45HOg==
X-CSE-MsgGUID: Q1mRNL4fQeiFan0+Mu0Z2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202431093"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 13:06:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 13:06:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 13:06:50 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 13:06:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+FmnxEymJ93bnIk45yw8BCXIY2V5vEZJYg4WhkDdVbsuC7aU1+BpV/6p4IbfaVW9UPzynVq4lqDO2F/zdQFKK6NOFhLzybF+UgwRJMRyuXh6jvVREfY0PLCURsKxn7mfLU7VN8xUnX6x6ALPL9IVKlky6674WONwY3N2j2pKjJnLzjBIKnQKCpU9LtGfh/3T/FR6YlacB5H9Ztfyhj1KARPM5dzapHO5AkyjeqWVhtrXcrRUERt5dIT1GwIu6jvU05p9+eGFHKJhRTWLdAle6G8GBCUahLq549QaOBKjOCakbTYruKKK3foECDTS0Fcu1Ej3IhGYd0zPpbIzYWzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu6XfiJcp34CLz/wmkXE23KU0keH8wcaoiLYMcLLl4A=;
 b=BefTHOVeLGB+hrmmtYQ2YzyZ7YSvA2RQ256sK5Wzl+i4U5ECHza4PBQi1kbEoy6j8+GjDWIpCwjHhRf4onxZy/hvwSuzCR/Lw9yFCfy6Tj0i0VmALhg7v2/OgUahFO16uB3TPTNYw196p96d36tHrGh1WNekNMD/mFCJMkAkzwKuPDgSRO4bCYGYwP9w0fDoa4AqmqchQ29guiJE5GLker74HjdKhvCklmJLxMlt4D6jZdPFmlB895grzZp9gBxoseSZucelLQLduLMLhd+zHEartm4tEi2hgM3HDep85wmATID3mBC7CQrQtPvlK+bZ2pXkvytRki1LFtlp5nJyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7721.namprd11.prod.outlook.com (2603:10b6:610:12b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 21:06:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 21:06:46 +0000
Date: Thu, 8 Jan 2026 16:06:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v12 2/4] drm/xe: Update wedged.mode only after successful
 reset policy change
Message-ID: <aWAcYyjjgE5kAIGd@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
 <20260107174741.29163-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107174741.29163-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb55c36-8192-4174-ca0c-08de4ef9d54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fOODZu6uBL987wl/Oqcrft4V5zOTIr4HCqLDNJy9J0GA0pBRIjzfhEeHfcpC?=
 =?us-ascii?Q?DgzZO9Y5d/AlZMAOvsqqOcrKEaAqhrDMvEYOmKKZfrbJChHAc93b7AWOY9ng?=
 =?us-ascii?Q?K9oxLtbOl9lUIZmwUkixB447NMDXUh+3frZa0ydYAUMIfjo8raS/8jNlIkZ1?=
 =?us-ascii?Q?+6DJQlECnifg5bLzSXMyD/z2EQ6eAncizy++XX8az/3LrI0rkW68xe8gKI21?=
 =?us-ascii?Q?HA/NghW04VMArA4NUFhgAXqXLkBnfmUYFwpCOtjicQ/Zj/nvpgzLcsANiG8L?=
 =?us-ascii?Q?x87ODlmurAVr4OylA34aJ2mYSWRqGsjc1w743BccEONvEhhi3W3rqVkIj1CF?=
 =?us-ascii?Q?Lke7cKQHUpOwabcXNYbbdMevyjYCk/ObRwPXBpuyXaDd3aPHJwWYmTU2DAXS?=
 =?us-ascii?Q?nuCkm1yxo79nNOAiNnfYqZDIbkjBEvxz+c2dYhnL9YJuwzjG2nmT6DIqKLfX?=
 =?us-ascii?Q?0zNsg8D633RBcTEvxf8r5fth5X9LtG4kzLzVhx4tEv3HMojHZp/B2eo5BiXQ?=
 =?us-ascii?Q?POZV0cW3vnSYkkzZ0a7oYAWnucqLoDugYTjIcAk0ETAIf0nGYYdWSiWwHttq?=
 =?us-ascii?Q?L6s6QI4xpWcjtuqpH+gOhnRm+SBGgIRZTTtgz1KJo3FRScJMXolwm2VSaOxf?=
 =?us-ascii?Q?NT4YoyDowjISmL1HS5TBLbmggiSRso517zN114W+1/+QRNy4CL+R8eWa9LUA?=
 =?us-ascii?Q?oimVZU4Xz6ZxvjmXHhPVDoQysvdUnrwapTkP8ii0ehtOEHwLmzclqPOILRw2?=
 =?us-ascii?Q?+t2p2fFWNp+I6L+tqvAfEvziGyIoFdRr29xW+HOhcLO51Ru1UiaBT9KLh7Yl?=
 =?us-ascii?Q?8B3/y8yki54JmRbyDg+WuMmMyzrIGlfImJB5pPX998SIP5Vn+btgVKJG37YM?=
 =?us-ascii?Q?ZROTwuOxOcXE5evum7CLzTwnRlT9cxzwJEOLLYSyRmYoaArwU9n+qjc/hwa5?=
 =?us-ascii?Q?9JBhpS4Bv9wVGSl3Z5qZ1YSfFUExkim9IZTttTOhyieVcMxlucVXBLgoUBpL?=
 =?us-ascii?Q?zhZFDW8GNbwSn2XmJ8i5D+3y993UkQ2gk5W1iwbgrC6+XdJ0R0ML9iq7i+eC?=
 =?us-ascii?Q?N5t9QgoUVJW1dA04QELYOtEeuxuAckQxk1dgQLStI1wCkAvvNCFCgITyOaoo?=
 =?us-ascii?Q?+SnrT2YIvmm1nCkADZi+YJ9evQ1BgIZQTQ4YNxxHPES6SniIjUtpS03uxajS?=
 =?us-ascii?Q?safDZPmsLJcYO9U3r8gJK2qnAHdIPFZfjlqLbjqwd5EVXa4IfPe1sCFgvmmU?=
 =?us-ascii?Q?9qx43Et8lPAUME8crSMDvPG3gv3Z3KBQeZkQ9T87aJ7IsEV6EFYvgvl8KInq?=
 =?us-ascii?Q?wMxBtEDwosNBgxEqBYbNBCUVIZH9RDu+pzy/hdv8py8x96Oj2A+9BA7lRPGq?=
 =?us-ascii?Q?FR0se1XpQ4hDqr0NG29FcpFypv5gwfsnkkxP1BKY6Xi8t/iNzMkd6ePk2qIB?=
 =?us-ascii?Q?nvjzKdkuE/Djb5oN4E3M8GNqPhEu2iPn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X8VL/MeCa1AWupVrHRWWrOD2QhltKSO2Tbk+MNYJmy9B8wt825wY9iYimL0p?=
 =?us-ascii?Q?kYvcnM6863OMqJkyTqwSZo3ZdwrQomx1sfq5nk+o0k/adY5E7POHbKZWry1+?=
 =?us-ascii?Q?lfdKmj+vKpF9qXHPMotTYJ8hBwId+XsfnnZSajRVT8LN28IKGVRms1nBCcpT?=
 =?us-ascii?Q?lIrb/hSNfuoyjbMM8yTXgn793NYoRBl+bSTrUyNeEnoe/M5JJ2gdQyyuGQkZ?=
 =?us-ascii?Q?NinrUAVJdGBH0lGzd29lQcjhreswVnsFoWqeg87J+YRBAsZPtj7s0GuyhIVN?=
 =?us-ascii?Q?DKopx/ijzBn6IAK20Ny9bTH9Z+wjsvgc7uXrrQzXNnOb7FkEhVtluaHM2XKK?=
 =?us-ascii?Q?WgcX9GOgULxlMlSgqyYc5PBmvu7G8vyzvS5K907+yC9UKyHyLUTdJ6uZjSPt?=
 =?us-ascii?Q?TvS8+BeRvLhX21cvuCAHcCzlim3R5+wEtTIGo1baXu5VaI+t7+Kgh8pbw11Y?=
 =?us-ascii?Q?Kw0NCmGT2wnp4mQrklLKJYCD0EjNK+jAMddiyN+NwJRlHqCUC3FkxJKlcPV3?=
 =?us-ascii?Q?GZmZwgMZXc0KcnmRqzphcu+QCj4phuAo/hCbYVNMEomqr1aLWtfkV4haL1ya?=
 =?us-ascii?Q?IyQbkx32FB+QMXd+4IKWYHT3bX9ebuCnURbceG/ZhTaI1lFj3ETiPWXk/CkZ?=
 =?us-ascii?Q?vPAufTfauUurqNJYu3dg1lb4pZzDt1y76dxN00594/ynawSZ0uETok7onTgx?=
 =?us-ascii?Q?yuE3rAG3+GuoBQMamAZ8jr7nuJDVSqj57EWuLhKUamYlV+ttHAO0TzJAS+7j?=
 =?us-ascii?Q?ZNa2hafEt3aTttYxM1e49ElINxBRQKOcvQGKuefBaeSGaZJ82t+sN7up3rqd?=
 =?us-ascii?Q?xDOLZFUmf63HOMHW9zJVmmAdp0dR6idLmw+a8zweTRKOXjUNs/bibx/zB3H3?=
 =?us-ascii?Q?MI7kCLkwHW2W5r/u+1+3n8H9H76AnpczyX2L8zMGPUeyhS4/EzvPhtxCU4xj?=
 =?us-ascii?Q?GAYck3uNJAFnVSqbN6brQowcyubRu5BelZdd57ri9BRCAbix82K8lR/Ie6xA?=
 =?us-ascii?Q?xumugjVpmHseEQP9XXksewOaLPkrEWN+P+9pSO+RmToLVcDdZGoS47henm1s?=
 =?us-ascii?Q?vMfmS/uRUXNTF3+qctZOxcuDLMDxkstj1VsAO8zBVlBqmuk4/PLAdj2kU/J4?=
 =?us-ascii?Q?v3T5LxVlUBIa1+eAwuX+7Meye3R75+0wM0VB/AlGqctnqXySmwfyGCIXuUBC?=
 =?us-ascii?Q?y6IOv05oNbNaC3BQ2R4mEL7bomQE8/nigDHTiCdRPagPmijovUM7T4yFBRGq?=
 =?us-ascii?Q?BTOZfiKlps8BRVAdia6Y5MLs1Lyea+LwUvUBj6n/DBDdW7R+/Rb3bzTiUh37?=
 =?us-ascii?Q?7JFzSizGz4mXjuyRNu5lxaX1HDSd1AfV8PlYpVAjJguTNjoODFyWknoDYI8V?=
 =?us-ascii?Q?UVlK/9zTamEg0ZK9imFORzIpfkP+gItHzhtwmiL1IIB1SswfAX3TV1JLQUWF?=
 =?us-ascii?Q?ZO/CyQdoXazdfVxSv3iiiTVOd9gLriLQi6IW2z5vD0UO28k5jzwhYz6PnkfW?=
 =?us-ascii?Q?GmSwb6KXLLF/i/T8p/CX56ZFKwiuLamiKp18y7GQU4qvfhMHOMHyLYUQRe8S?=
 =?us-ascii?Q?4Scms2pfHy10MbgsgQynDDOB0VNfQDfK/cDMh/Ja0gfghBmnI4ukmI1Vqfhu?=
 =?us-ascii?Q?LfEy0V8F9S4TVY9ZQmtEF+kf8b09RFo7uf2pjjEtK5Z2FeWmVdb1DTrAj02Y?=
 =?us-ascii?Q?wgk3VxtlDv8RZ2WziPvOoBSTQlEwoZZ6NyzNmLTandYZbWFh7Gq1aDPqaM7N?=
 =?us-ascii?Q?feLbGI6/qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb55c36-8192-4174-ca0c-08de4ef9d54f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 21:06:46.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUiUgt9NoOfVL2iCjyi7ppIz25cgUs6UpRihMUikoX14EjSC6d/O0k9ZkPIzoGvf9p6D+sfW/7dopyjJ9JZfKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
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

On Wed, Jan 07, 2026 at 06:47:39PM +0100, Lukasz Laguna wrote:
> Previously, the driver's internal wedged.mode state was updated without
> verifying whether the corresponding engine reset policy update in GuC
> succeeded. This could leave the driver reporting a wedged.mode state
> that doesn't match the actual reset behavior programmed in GuC.
> 
> With this change, the reset policy is updated first, and the driver's
> wedged.mode state is modified only if the policy update succeeds on all
> available GTs.
> 
> This patch also introduces two functional improvements:
> 
>  - The policy is sent to GuC only when a change is required. An update
>    is needed only when entering or leaving XE_WEDGED_MODE_UPON_ANY_HANG,
>    because only in that case the reset policy changes. For example,
>    switching between XE_WEDGED_MODE_UPON_CRITICAL_ERROR and
>    XE_WEDGED_MODE_NEVER doesn't affect the reset policy, so there is no
>    need to send the same value to GuC.
> 
>  - An inconsistent_reset flag is added to track cases where reset policy
>    update succeeds only on a subset of GTs. If such inconsistency is
>    detected, future wedged mode configuration will force a retry of the
>    reset policy update to restore a consistent state across all GTs.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
> v12:
>  - rename helpers to make wedged mode context explicit (Rodrigo).
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 70 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 14 +++---
>  drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
>  4 files changed, 71 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index db2afd60d8bc..844cfafe1ec7 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -254,14 +254,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>  }
>  
> +static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	bool enable_engine_reset;
> +	int ret;
> +
> +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       enable_engine_reset);
> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	guard(xe_pm_runtime)(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret = __wedged_mode_set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset = true;
> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	xe->wedged.inconsistent_reset = false;
> +
> +	return 0;
> +}
> +
> +static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	if (xe->wedged.inconsistent_reset)
> +		return true;
> +
> +	if (xe->wedged.mode == mode)
> +		return false;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		return true;
> +
> +	return false;
> +}
> +
>  static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			       size_t size, loff_t *pos)
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
> -	struct xe_gt *gt;
>  	u32 wedged_mode;
>  	ssize_t ret;
> -	u8 id;
>  
>  	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>  	if (ret)
> @@ -271,20 +321,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (xe->wedged.mode == wedged_mode)
> -		return size;
> +	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
> +		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	xe->wedged.mode = wedged_mode;
>  
> -	guard(xe_pm_runtime)(xe);
> -	for_each_gt(gt, xe, id) {
> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> -		if (ret) {
> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> -			return -EIO;
> -		}
> -	}
> -
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index d790129a06db..4dab3057f58d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -648,6 +648,8 @@ struct xe_device {
>  		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>  		unsigned long method;
> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> +		bool inconsistent_reset;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 2b47e897d2ea..7e1cb6093de7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -983,16 +983,17 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> + * @enable_engine_reset: true to enable engine resets, false otherwise
>   *
> - * This function update the GuC's engine reset policy based on wedged.mode.
> + * This function update the GuC's engine reset policy.
>   *
>   * Return: 0 on success, and negative error code otherwise.
>   */
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
> +					     bool enable_engine_reset)
>  {
>  	struct guc_policies *policies;
>  	struct xe_guc *guc = ads_to_guc(ads);
> -	struct xe_device *xe = ads_to_xe(ads);
>  	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>  
>  	if (!xe_guc_buf_is_valid(buf))
> @@ -1004,10 +1005,11 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> -	else
> +
> +	if (enable_engine_reset)
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	else
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e6674c760ff..7a39f361cb17 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GUC_ADS_H_
>  #define _XE_GUC_ADS_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_guc_ads;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
> @@ -13,6 +15,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
> +					     bool enable_engine_reset);
>  
>  #endif
> -- 
> 2.40.0
> 
