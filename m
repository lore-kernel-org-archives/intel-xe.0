Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF3D12674
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F197F10E6E0;
	Tue,  2 Dec 2025 21:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiIldRWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B4710E6E0
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711563; x=1796247563;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uH4o3KSSPNRwM9F7d4hf+7SL54KlL6KJvOfaXyrSlj8=;
 b=GiIldRWhOfL1KbXrAzE2fDM/EiO9lCWkTFutZnK1kzIlYKQ1/IATgpoz
 kKckKsjga5sAIvf6dJRPo92XMxEDmoQydTPSePPXjJn43PWSWYDVy9Epu
 MiQ7w0kYYN6WXerFTqeqFUrNApdPD5q+MAlwSrVpHbR8LGUy4DoEC2teK
 +bZlfYKvAdRcyvavyThRZmxoOTbs93wjnj33b/c/NyfUp/wBXptovIZHb
 KA696599+a0Hz0fzhlbG5gmfnG4JHJ+xmoVbZGIT75516Kc8MSWmyTNQg
 Z9cLC6UdQ9WgWNW1hfwURKKkmLea8IQaz+a17k478OfGv39qm01EqsxL/ w==;
X-CSE-ConnectionGUID: ewwB1BxDThGdvQNv47A/dQ==
X-CSE-MsgGUID: vUQkTP/PSNaArCs1ZI72dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66734955"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66734955"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:39:22 -0800
X-CSE-ConnectionGUID: iYmxguBnSKOkgYczvthQOQ==
X-CSE-MsgGUID: zlnQvnoRRSmObLSXVQSLFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199437472"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:39:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:39:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:39:21 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:39:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCUPRgATNdM/J9WiE7q9JQJvlwayw12rmWxFuN6D1F3TT36XBqYZOGRFpyLHIODscLNXaECHiwNtwiH3+o9ezdUYZ2Q8YdQeBYhpToe1oO8JdhRWvUf8OoL4A11e5npyPDz2KkwRteWEq7D7hkoA3PV2yAK9gB1Cjf2ynwG2gUX/6A/Mxnmmx1LLFSy9DKCKlImEkueFjpJW1dKR9/oYuvF0RhChFMhVsGFdpyauiuMvbB87X2xbWE74D6UmELihCXosnhMNSuDqJbZTsTf/QMs83Vscjkamb3gEWPBN0hkPBsE6asQdb2rXBU61/s1ltteBDhcjt+6qGVkxa5L8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COet2A204zuVeK3eJb97RxGFo1R9BvcHw44oy147Ekc=;
 b=g3TbN6MTfLYBaLvzYK6l4vaW6/wswqPnc5GlVDLMRefhZjwlbAjGG9azE3xnIFOiLtkwtNN0eeBmA3YRWsByXVgc7wvb7+3NJckMK0L6e8utMJXITpdjlT6SAgqzY//Bkg7KaVnRO3Wyok6JGvykFkmyfjElFyaHDpE3nuLE1HwAPT/75AhPiZg/M7JFBnJHtUYNjX5p5KW0YqmneK2uNBeR8sPs+gAqiOTvppkmoEMT78/06IuLCo3CPL+HwHgFw9mPaBg+psJ8YPIoDKO35Boxl7hT3/VciZ8JgwDrJVpXIxZETl0V3jATp314tmP60UOGbCo+mylaoXCTkmXYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7011.namprd11.prod.outlook.com (2603:10b6:930:55::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:39:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:39:19 +0000
Date: Tue, 2 Dec 2025 13:39:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 4/9] drm/xe/madvise: Implement purgeable buffer object
 support
Message-ID: <aS9chAd9GOAdDSxg@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-5-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 8037a92b-09e5-4786-541f-08de31eb4015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AL1AHWXcb2NbNgZQEeGkEEwLeHPHCv67ALoQzNidaCZrTCbASvyTz1XhRR?=
 =?iso-8859-1?Q?z1ZZ/Jiuza5KQqh377CibAiHGIkheLXHhn408Rw8ZSA6nIAYkNppeMc86Z?=
 =?iso-8859-1?Q?xw4r5yMYEZCter81HC/cw19lbZiBxudPp4NY9Xh3ThbG241bcxjXwfKP5c?=
 =?iso-8859-1?Q?iRBkAwXacEtSzQprM4FbJr9tYCyEKeVJpAp3w/w/fqw3IDg6LtWGswfFPs?=
 =?iso-8859-1?Q?jK1sbXW7AvDe/gydG6fRNshYwNTwd+EexXoik6BcNtYaw8UW1A5gxA1Rur?=
 =?iso-8859-1?Q?wiI/y+LWcpGo0Lw+YIX5UF/k4mR3p0vVsRATNgE1TZLQVGGC2mKN/CvwOQ?=
 =?iso-8859-1?Q?0S2lc+HUOJoaLCnHHcZSv2p/bOn220yQAKgAVlZbXIIQn6b3BqrVUomAc4?=
 =?iso-8859-1?Q?htZebHNOe4QiZU2Z9VslQwVCOvJFrlkP57GpL5ia8OFN483EjpCBssXsQj?=
 =?iso-8859-1?Q?46am5wN6IUCv1qqpZzV4FpjYTb8/wMrf58VuRYZ49hkjI62kKGLc7NVInd?=
 =?iso-8859-1?Q?NVMXafwUN45Tjvn8ko/LVbJBoBCMaO2vxPsPQ8qWsJ1l2O3l++OMyPMNQl?=
 =?iso-8859-1?Q?ZnZNOxJ7lXZfWW1UfzogIg71WkJJh5/HNTS3DHMeeFP2DnakHX/g27NP6m?=
 =?iso-8859-1?Q?Dyb4UDRkOCkR7hChsAjkPyG7z3DPVs6k/cpZzTI+bvSz2sRPtpcrH6O3I4?=
 =?iso-8859-1?Q?4hrtGwq252i5IDovrs/nSGzTvc509P0PGVkRhwHcYfwSufFbRFHgw89aUY?=
 =?iso-8859-1?Q?blsUTLzKxL9jEQB/dscRKWWriJC+Un9ab33+nZbmlpODS60uUuJ4WLjtMY?=
 =?iso-8859-1?Q?sVn03+fiClas9NX7pLgMLcMXfRF2gweUMg9HT/oQmvzddiWjP0HPGMaTVt?=
 =?iso-8859-1?Q?YE11XeajEQDBCnic4po5K5ONjWC6ldAy9Ju45YvKaIp0grvOxBl/epwh5O?=
 =?iso-8859-1?Q?DFzvVhu07aMli+VikmtrQPsleWfhMZUKqqNUHHThRlRECclAJqSKgArQH4?=
 =?iso-8859-1?Q?JLldiC1U3dqB2F0PNAgVLukdWIJQ1viSZbkg02ZyKkK4OPrJdtmcjnTgdB?=
 =?iso-8859-1?Q?1psXC8xqnyLXeD6jNlokknk1CP+ALMUyUlqjNqimHSOnwoPWD7745koobW?=
 =?iso-8859-1?Q?9Nt+YQAkID0nS0gsVtVxk0OqxEdbq9nrkPQ2heY23GvJJO0vl5YAXVf+ZR?=
 =?iso-8859-1?Q?kX6vF6mlfzdYSj7hHe+1AgKcu8uqt8sO2dazMbxX2q8JdI7ID8PNtFlPeF?=
 =?iso-8859-1?Q?SL4wHhBNMurQAc9m4B3G+y5OAoAbko167ePgsTgj5YqkqezwDzRiAC26jo?=
 =?iso-8859-1?Q?y5zVZBi98Bo62ylGIsmUekqyKUk8jJahyCZHgZW57CioEyT1lojbijPA08?=
 =?iso-8859-1?Q?uCc0CcaJHdVhHEUNltUWcs06IBvnkRQJ3oP/3rWpQa46XCn1Liz3X7bFIM?=
 =?iso-8859-1?Q?7R0fKO48P5leE2hHuwhoLjLbi3ZJwF6K/H2Q3Bdp1e5k3zX2y/ANV/WGuQ?=
 =?iso-8859-1?Q?kG7Zj/FHsIxrDOF9s0UR13?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MsJJmE3Ll8JYW6mbAUVQeDYDBa/6gR0LTQZhwcgb5IiokBIFomWuDPpxTm?=
 =?iso-8859-1?Q?RQVuSophS3ssKqi7T92WJzz7Mndd+79CoOiUxNDmvKhKPDq6mt5aMcQOhn?=
 =?iso-8859-1?Q?JCMG0VxkmcpE07uOR9UUPwMH7bWCw7jIqXiO3odS1E1N46QpIz11yUvJo8?=
 =?iso-8859-1?Q?PxsJFBWOHd8Dlw+H9SNvfAHGqX6i00RjglFObmvKuDajEl8ldEWE/PQ4M5?=
 =?iso-8859-1?Q?SK/YkZ658WM1khcwPJcd8z9inoxd7MHSSNQGPJNsHRwGvXVVUeLyr9Ij3J?=
 =?iso-8859-1?Q?/ltzcoVbNosZH4mXTppxD/JX5ANUv9dfkXoiu4ihHsKN8UV1dnjW3kCT/V?=
 =?iso-8859-1?Q?WYzibzskW0D75GnMejXcaGt5SZDwYHygnZ5kgbYBasQQBe/vyL8JRpSjFC?=
 =?iso-8859-1?Q?lSz8W70mtNZygo4DvN3V7y83IgFCwe2x3hjJrM4ewqEHFXH8Z1gZRIkE5G?=
 =?iso-8859-1?Q?50x8IH46ejAbf4HqIAPiCQpyr94GpM8wariiknSiG7pLMOWgpgyKufL2Mk?=
 =?iso-8859-1?Q?wHAkhA/+bHyEFuI8nQiy1ZIA6PkhM0Bq0cts8IiuwWNwwCKU/T8RNCycK0?=
 =?iso-8859-1?Q?gKiTBuTT2O4YE55JCTfOH5LYSEoCz1GUkezVN3TeHEyYAhaKNvqC9w9FaO?=
 =?iso-8859-1?Q?1M6KeqxqFpBn9NMJGDWmGwgs/hkFsgFoQTpHBKYd0+xZKo3zdW8aw9J430?=
 =?iso-8859-1?Q?sJ6bFsT6ullhMb1Te9hu/rXcJDc6Ohsy1HYXrMfWj9/+AJQJi7LKJEflZq?=
 =?iso-8859-1?Q?P97kjkPl0eybpMuf/KWASh+dCGwlcVjJiy236FUxH8ZS/UYLGpP/q+SBny?=
 =?iso-8859-1?Q?lvTh+0dArjXro6kkqQsu7WMzw2vY/c2UnNgJ0mbXwxRe4KKAc55a/fk1hU?=
 =?iso-8859-1?Q?kuqFFnndlM8pi37R0tqEO+k2imh+U2luiSLHuLJ+YxWrDRCu5e0AwBC8aN?=
 =?iso-8859-1?Q?biuYHALGGvvMVnwHHc/mNMklp6f4bKZtZJ9mdMt+72ukEdadh+ovcFb9n0?=
 =?iso-8859-1?Q?/ZRFrKCKkpO8B5DisS4N1CIVJplLWEUpB7Ma3MoyrbHu/FyIWdb1dxa0xZ?=
 =?iso-8859-1?Q?knzya7A2Uryj1qCzPVfM3LNnnpNDpu8NNDh8+bItZqiltFwbYapSYcVfXc?=
 =?iso-8859-1?Q?USZPYdHfxCgqo3uuW00Geq2Q7tIC1KhMGYAOTKpRxVHZLGfR9clAzfM6bP?=
 =?iso-8859-1?Q?DnLQpaw24R/cnbWspBKmnlBqvhC2WplqIqKqi2+C4eKwC5euh1XWSQkzyz?=
 =?iso-8859-1?Q?/K3Gs+MRmiOes9Ze4zfEWmNIC2hT990x9VEEHISkFTnLN8EZIq9X1RNZZs?=
 =?iso-8859-1?Q?/5pRfZI+vIEYoNiKLGMo4TexCAt/PWta4IPVK6LVPRTbwcMVtBKeXLmdP/?=
 =?iso-8859-1?Q?tvRfnv6fy6F67eaJ84R7V1XRR9CqoAHMNUTB1o3xdGKhr9VKec9eudTsZZ?=
 =?iso-8859-1?Q?oVXd6ZoVJnt0jKYairAERAoTCyy4hlWkcVtTp88itL0/yoef8J9Pks9BP3?=
 =?iso-8859-1?Q?8OHAf6OSVW9aaOJiluPSO5Y1zBfpsFc+zUyyVRfRZexwr9Tf9Zh/6SY4Uc?=
 =?iso-8859-1?Q?NGmKemoCqX2hnZgCxiFpxOy9JVgthdYVV5IKrbcUAnDFSlfaZrZgFGg4iY?=
 =?iso-8859-1?Q?B84VnfiMXSsYeE+ukc2rWn6F4z+y4TewbonFDdau3N6MKOomq0PcaD6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8037a92b-09e5-4786-541f-08de31eb4015
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:39:19.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pr+/hT0h24zdDozW1kkB1+M0ZCFeDpYzwi2pVziAmiAVWKwG9XQYCafF+ThuHL+kyckBG2DWPFm2OpI4hWi1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7011
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

On Mon, Dec 01, 2025 at 11:20:14AM +0530, Arvind Yadav wrote:
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> Add the core implementation for purgeable buffer objects, enabling memory
> reclamation of user-designated DONTNEED buffers during eviction.
> 
> This patch implements the purge operation and state machine transitions:
> 
> Purgeable States (from xe_madv_purgeable_state):
>  - WILLNEED (0): BO should be retained, actively used
>  - DONTNEED (1): BO eligible for purging, not currently needed
>  - PURGED (2): BO backing store reclaimed, permanently invalid
> 
> Design Rationale:
>   - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>   - i915 compatibility: retained field, "once purged always purged" semantics
>   - Shared BO protection prevents multi-process memory corruption
>   - Scratch PTE reuse avoids new infrastructure, safe for fault mode
> 
> v2:
>   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>   - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>   - Implement i915-compatible retained field logic (Thomas Hellström)
>   - Skip BO validation for purged BOs in page fault handler (crash fix)
>   - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>   - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>   - Add !is_purged check to resource cursor setup to prevent stale access
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 72 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 19 ++++++++
>  drivers/gpu/drm/xe/xe_pt.c           | 36 ++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c           | 11 ++++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 73 ++++++++++++++++++++++++++++
>  5 files changed, 193 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cbc3ee157218..f0b3f7a13114 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -836,6 +836,53 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  	return 0;
>  }
>  
> +static void xe_bo_set_purged(struct xe_bo *bo)
> +{
> +	/* BO must be locked before modifying madv state */
> +	dma_resv_assert_held(bo->ttm.base.resv);
> +

+1 to assert, but I think xe_bo_assert_held can be used.

> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
> +}
> +
> +/**
> + * xe_ttm_bo_purge() - Purge buffer object backing store
> + * @ttm_bo: The TTM buffer object to purge
> + * @ctx: TTM operation context
> + *
> + * This function purges the backing store of a BO marked as DONTNEED and
> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
> + * this zaps the PTEs. The next GPU access will trigger a page fault and
> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
> + */
> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
> +	if (ttm_bo->ttm) {
> +		struct ttm_placement place = {};
> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);

Do we need to the eviction to complete? e.g., wait on DMA_RESV_USAGE_KERNEL slots?

> +
> +		drm_WARN_ON(&xe->drm, ret);

Likely an specific warn on function or assert.

> +		if (!ret && bo) {

When would BO be NULL? I don't think ever.

> +			if (atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED) {

Can we helpers for madv_purgeable access /w an assert?

> +				xe_bo_set_purged(bo);
> +
> +				/*
> +				 * Trigger rebind to invalidate stale GPU mappings.
> +				 * - Non-fault mode: Marks VMAs for rebind
> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
> +				 *   and NULL rebind with scratch/clear PTEs per VM config
> +				 */
> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
> +				if (ret)
> +					drm_warn(&xe->drm,
> +						 "Failed to invalidate purged BO: %d\n", ret);

Xe specific warn on or assert?

Also maybe this function just returns an error if something fails too
and xe_bo_move would return that failure.

> +			}
> +		}
> +	}
> +}
> +
>  static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		      struct ttm_operation_ctx *ctx,
>  		      struct ttm_resource *new_mem,
> @@ -853,8 +900,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool needs_clear;
>  	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
> +	int state = atomic_read(&bo->madv_purgeable);
>  	int ret = 0;
>  
> +	/*
> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
> +	 * The move_notify callback will handle invalidation asynchronously.
> +	 */
> +	if (evict && state == XE_MADV_PURGEABLE_DONTNEED && !xe_bo_is_shared_locked(bo)) {
> +		xe_ttm_bo_purge(ttm_bo, ctx);
> +		return 0;
> +	}
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
>  		if (new_mem->mem_type == XE_PL_TT)
> @@ -1606,18 +1663,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place = {};
> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
>  static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct ttm_operation_ctx ctx = {
> @@ -2202,6 +2247,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  #endif
>  	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
> +	/* Initialize purge advisory state */
> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
> +
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
>  	if (resv) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index a054d6010ae0..8c7e5dcb627b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -87,6 +87,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (!bo)
>  		return 0;
>  
> +	/*
> +	 * Skip validation/migration for purged BOs - they have no backing pages.
> +	 * Rebind will use scratch PTEs instead.
> +	 */
> +	if (xe_bo_is_purged(bo))
> +		return 0;
> +

This needs a rebase as xe_gt_pagefault.c is gone upstream and replaced
with xe_pagefault.c.

>  	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>  		xe_bo_validate(bo, vm, true, exec);
>  }
> @@ -100,9 +107,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	int err, needs_vram;
> +	struct xe_bo *bo;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> +	/*
> +	 * Check if BO is purged. For purged BOs:
> +	 * - Scratch VMs: Allow rebind with scratch PTEs (safe zero reads)
> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
> +	 */
> +	bo = xe_vma_bo(vma);
> +	if (bo && xe_bo_is_purged(bo)) {
> +		if (!xe_vm_has_scratch(vm))
> +			return -EACCES;
> +	}

As discussed in other patches, move the xe_bo_is_purged check under the
dma-resv lock.

> +
>  	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>  	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
>  		return needs_vram < 0 ? needs_vram : -EACCES;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d22fd1ccc0ba..062f64b16a58 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	/* Is this a leaf entry ?*/
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>  		bool is_null = xe_vma_is_null(xe_walk->vma);
> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
> +		bool is_purged = bo && xe_bo_is_purged(bo);

Can we drop is_purged and just set is_null to true for purged BOs?

Or rename s/is_null/is_null_or_purged for clarity?

> +		bool is_vram = (is_null || is_purged) ? false : xe_res_is_vram(curs);
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		if (xe_walk->clear_pt) {
>  			pte = 0;
>  		} else {
> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +			/*
> +			 * For purged BOs, treat like null VMAs - pass address 0.
> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
> +			 */
> +			pte = vm->pt_ops->pte_encode_vma((is_null || is_purged) ? 0 :
>  							 xe_res_dma(curs) +
>  							 xe_walk->dma_offset,
>  							 xe_walk->vma,
>  							 pat_index, level);
> -			if (!is_null)
> +			if (!is_null && !is_purged)
>  				pte |= is_vram ? xe_walk->default_vram_pte :
>  					xe_walk->default_system_pte;
>  
> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null && !xe_walk->clear_pt)
> +		if (!is_null && !is_purged && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  	int ret;
> +	bool is_purged = false;
> +
> +	/*
> +	 * Check if BO is purged:
> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
> +	 *
> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
> +	 * zero instead of creating a PRESENT mapping to physical address 0.
> +	 */
> +	if (bo && xe_bo_is_purged(bo)) {
> +		is_purged = true;
> +
> +		/*
> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
> +		 * (non-present), not a present PTE to phys 0.
> +		 */
> +		if (!xe_vm_has_scratch(vm))
> +			xe_walk.clear_pt = true;

So the idea is purged BOs will fault if the VMA is accessed on
non-scratch VMs?

> +	}
>  
>  	if (range) {
>  		/* Move this entire thing to xe_svm.c? */
> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	if (!range)
>  		xe_bo_assert_held(bo);
>  
> -	if (!xe_vma_is_null(vma) && !range) {
> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>  		if (xe_vma_is_userptr(vma))
>  			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>  					 xe_vma_size(vma), &curs);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10d77666a425..d03e69524369 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1336,6 +1336,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  			       u16 pat_index, u32 pt_level)
>  {
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
>  	pte |= XE_PAGE_PRESENT;
>  
>  	if (likely(!xe_vma_read_only(vma)))
> @@ -1344,7 +1347,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	pte |= pte_encode_pat_index(pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
> -	if (unlikely(xe_vma_is_null(vma)))
> +	/*
> +	 * NULL PTEs redirect to scratch page (return zeros on read).
> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
> +	 * Never set NULL flag without scratch page - causes undefined behavior.
> +	 */
> +	if (unlikely(xe_vma_is_null(vma) ||
> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>  		pte |= XE_PTE_NULL;
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..3ba851e0b870 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -158,6 +158,60 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> +/*
> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
> + * Updates op->purge_state_val.retained to indicate if backing store
> + * exists (matches i915's retained).
> + */
> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
> +				       struct xe_vma **vmas, int num_vmas,
> +				       struct drm_xe_madvise *op)
> +{
> +	bool has_purged_bo = false;
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
> +
> +		if (!bo)
> +			continue;
> +
> +		/* BO must be locked before modifying madv state */
> +		dma_resv_assert_held(bo->ttm.base.resv);

xe_bo_assert_held

> +
> +		/*
> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
> +		 * This matches i915 semantics where purged BOs are permanently invalid.
> +		 */
> +		if (xe_bo_is_purged(bo)) {
> +			has_purged_bo = true;
> +			continue;
> +		}
> +
> +		switch (op->purge_state_val.val) {
> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
> +			break;
> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> +			if (!xe_bo_is_shared_locked(bo))

I think we need a complete VMA check here per Thomas's feedback (e.g.,
all VMAs attached to the BO must be in
DRM_XE_VMA_PURGEABLE_STATE_DONTNEED to flip the BO state). I think the
BO is an import or exported dma-buf we can never flip the state as we
don't know what an external device is doing with it.

Matt

> +				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
> +			break;
> +		default:
> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> +				 op->purge_state_val.val);
> +			return;
> +		}
> +	}
> +
> +	/*
> +	 * Set retained flag to indicate if backing store still exists.
> +	 * Matches i915: retained = 1 if not purged, 0 if purged.
> +	 */
> +	op->purge_state_val.retained = !has_purged_bo;
> +}
> +
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
>  			     struct drm_xe_madvise *op);
> @@ -283,6 +337,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  			return false;
>  		break;
>  	}
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +	{
> +		u32 val = args->purge_state_val.val;
> +
> +		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
> +				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->purge_state_val.reserved))
> +			return false;
> +
> +		break;
> +	}
>  	default:
>  		if (XE_IOCTL_DBG(xe, 1))
>  			return false;
> @@ -402,6 +469,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  					goto err_fini;
>  			}
>  		}
> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> +			xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
> +						   madvise_range.num_vmas, args);
> +			goto err_fini;
> +
> +		}
>  	}
>  
>  	if (madvise_range.has_svm_userptr_vmas) {
> -- 
> 2.43.0
> 
