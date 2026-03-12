Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDE106ACE5
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 20:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEDE10E2BD;
	Thu, 12 Mar 2026 20:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeQ884vd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164A910E2BD
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773347251; x=1804883251;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=dcCZLPOBAJs1XSHQZRFtK10VNyofnvhfHj/aPati8Tk=;
 b=eeQ884vdU2P8OOsDXiFRg8Fr80m4dYUdqzzgEKl17UQ/TFE6gWL/brZi
 Bw1rmNHiQW468VAK0yVTobQrjMfbN2nSgj825Pu/5qLkcAoZ43wGrrvib
 gYY5DIcqVNQAuPjbnl3UYzkinEBZhoxsIUPv0vlVuzdVXnazkq3gEPNtX
 aYiwTSPCKkhdqMnMQIApK4Cv7uGv9KVrYVYFNcy97ckf+92s1epdf7hnQ
 X70oGF0xLmYAKVBBXMIbYj+MlTYM6+nSEDnl93TFmut0luXpgIeO6h/7V
 XQw3KKNDtLBoH70JZBer+nOqKCnJRAfzUZSJFc6UnuynPS49razRvdGEa w==;
X-CSE-ConnectionGUID: 6g0LorlQTwiM3dFsbqmHrQ==
X-CSE-MsgGUID: roUMBs6DSqi9b56VanhbWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="84772365"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="84772365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 13:27:31 -0700
X-CSE-ConnectionGUID: HAEbqyLgTD+voKJi6z676w==
X-CSE-MsgGUID: pasmuioNQL24JTME0f1CLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="218720085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 13:27:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:27:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 13:27:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvPpMOBzc9AYYpG3zWu+2EhDPIKREfMEfwCa0gVEXzRnlY+neNlndU7WmfcAhOiqeyBB+kxRm9XbRoNcd3R3pVuFGfl+qRhsuTXj5VLMFu1lddRyUQbpk6xtn1fivzzS0Nnvu083Y+YVLy9e+5L8uKJQETqo9L4uobrcKJ8JgChWJWAONubXHB5L6XNrAW4renQd3oCNx+tn9KORUC3jPYhtaIzyyWJTXitPtaZyzxEY5dApZLTvUZOqNb9zFwXaLSl9N3DPJC+Kolj+Bw/omCdvfhtA/8/RFAOT5lOoy8WFxo7+1sO0HPIBXQH6qlsJa/l+YjXaIJdM4x9PjC6ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mivtx00Spkka4wF5GNE6laHiQiqyR5np/qr1jOKAV7k=;
 b=Yt5NX0gMotWBI82o8+EQ4XaUTye3uN9xfll3tCpLuD4lrz9gSr8XUrUOEGj7iS0nZRSt37g6qZeVON72F0aAR+5hLcK84JMqJDX3gQ48HDRfNvnYlppnzOrtvQD9cRUMCSEi4Dr13OyTqOQjz2mGS9QZGTI05GDInBeU4KY1WWJ49oSC0jJ6c8H1ez6+23S5Z/yx4TpJdQ37KqZJdxFQ6a+UxVTo0vKj+7Hx3hNduGAqGN9yQbrZ442U5upR5rSJg3/U+CPOXwq1L2G+pHopS4UV+5nd7j6il/+St9rkZk8J6GT8IhnaBydoU40dHvOQpnZ/KjZ3QIwjF9KAkj1+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Thu, 12 Mar
 2026 20:27:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 20:27:26 +0000
Date: Thu, 12 Mar 2026 13:27:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_drm=2Fxe=2Fwa?= =?utf-8?Q?=3A?= Drop redundant entries for
 Wa_16021867713 & Wa_14019449301
Message-ID: <20260312202723.GC4694@mdroper-desk1.amr.corp.intel.com>
References: <20260312-wa_merge_fix-v1-1-2ec6607f1e0c@intel.com>
 <177333976616.352407.15552402176346036526@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177333976616.352407.15552402176346036526@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: f80738c5-1e02-4fce-972b-08de8075c672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8TrI9QDXkVT3FXiWHJYw+7glTS+hGIvraTE9nJyIiZgyDfCGQ225PXk/97euqKd0C2hWMYX0KelndBxoxCGPOWrDOXAIvko0DGHaernGEI+alqlNBzlL7rCfEn/VRf6hfzcTzdUdkjCmKbYK7dRv6wX+33kR0jnqpAoMzfSWKH8eH+8TwvhCw2QuAoMS/hQcXGKWYw+61T76UDV5nMcM3N0jU8GpB1E+EKB0mhCVl/bM/Au+L2s+K/obF014RqyQ2hSCYqIBBuxWWQO+AXsmbPUCwRgGJBQz/KzkDAH6VRlHhyZBnlN6DSfnCQKmxykkYRkISusiwaZSvjlMwmHmBLdKjwBY/plR5ZVtKGf2YjKqMHcQM7xOGNkORo00C+KqzP39Vhn9pfOXyKEbbp+l37dnzO9f9Z5OD6yI16xmsHS9jehpZH4RioLQymR92BtH3u/WOxD3rk8yc86LpBtt34WNCgUCHQar56IaOHzjFC0OxKCO+Gh95WhhKRJGuxzlFEFW25VlFlc3x3kp6Cc0hXxoNN4uGRWlLUNobHNHDJHlMHGKI+XAkTvPSOtLoLHcLGAgKzxd3k/065NKvSEEzaKsBfkZ2ilLAyGSGbjZb/xRRWF64HbZjTrGLWxwU8IQF5VsMjPumqa45WJtapoK9Hx5+u7zBthZwi80oYNJWgEIOGLIkPyR+/YHWjqxAqpq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NNb6kyBPxQyn5wsYEuMaRMwZv0XpugvUANfig/DeuzOkY1uhvWcZASMnSTjA?=
 =?us-ascii?Q?+ek6IAUVADibDs0ACi02eLwGsv2Q1AyB2aLjKzwKWbAjwcj9Y9lik0PJ9z0v?=
 =?us-ascii?Q?NoquDCQlL+IVp+ZrVV0ca1wcY17bmRn6Oz+a3IhNs/ekK0fED7i4DZBnQw8g?=
 =?us-ascii?Q?EEPhZcSjc/pAvv0QRGElUuWwy0wg19m9jXfDVgKT2yLCtdOqNDnYlRM1KzfI?=
 =?us-ascii?Q?FfJJdyCZO0N0uOPiP3XUAfubfK9k+4zua8B1zag8WBBAduGD0/vkPSM7cdQB?=
 =?us-ascii?Q?kfzE2BLwTp7Ywx20naXzTSTvBziYnRgcXH+ntdtFuyrXloD1VgvLehqkSZDA?=
 =?us-ascii?Q?WoAZDACgIkH9LS2Z3REYv42eDed9pFtP/MNIT8e++Gpi/ZUjtsLpRoPKvTlG?=
 =?us-ascii?Q?6F++A5o0I9G2+R3xL4hetXbTzC3mWgkGA98E3ghxfEJrB3x+I7+iHj9+jR2i?=
 =?us-ascii?Q?qHKCORMLuNZGqb4MXn9ixj3hiek386AZN5/8YAeDKTYAGjA+yO+jODWBRwSq?=
 =?us-ascii?Q?K6T3Rxasr4WcwUDxerZdx3jz6jVvJirtvqCk1CckKAzC/iNQnQXKts/ceZeP?=
 =?us-ascii?Q?4MpdcTXI8KuCN0HtfhUGsph2dbpAMNylwxNWHd4+rMc+o4BHnzbyqor2uwCm?=
 =?us-ascii?Q?pTJ2noOpXwveKa7OBOSql0dHiMd36deRzfCceoFliW//qubQoXJUmoBFOptg?=
 =?us-ascii?Q?gNeBpaNgZesdbi2pKd/jgfeGcvneGqbJ1wkmp7L2kwlOQl4Aatyn7Yp9l4Y+?=
 =?us-ascii?Q?iSr9SlbfUblOweICEutIwMRaeAAkAov4/XWjZJzSFoScjo5BUxlkyxn7nftO?=
 =?us-ascii?Q?5TodjDNsKURBDXvxiJw/woASl6jXLs30rvI0cFax0h7pFjv4LIpoGAwRjHdl?=
 =?us-ascii?Q?wfhFW9G37O0mzyniBB3qoMXf67SHpzQuh3ThfQQEEqjlSjbym+bhK8gdOBbk?=
 =?us-ascii?Q?d2z2ldaELxuDYQhv22ZkH3uQS2RUNoLp3uAhQ/gXVPSynfacf+ZONR3M4b/s?=
 =?us-ascii?Q?bY9M0CB56L5MTTkNDfPc9Q51JHKDLu8JTemaXy+B3rRnTaOtYvGWGJbJOFKy?=
 =?us-ascii?Q?KEcP3bwLxH4Kya4Y5MfqlyRXE/stA81gbWxLa7KftRvgTgwCgYjoE1P5zln3?=
 =?us-ascii?Q?+L3ZNHbEmwQ8hQbWBvjtyGW5+1Hz762YxMitz2tmY7yPKV99lkgcjvsIU8K+?=
 =?us-ascii?Q?4x8/gEHfV1X6ldT7a0txhhzVInOibYIzEeO8Bmj2m0vohpTkCufZxTqOXETZ?=
 =?us-ascii?Q?NVfpYTq3obbzQFEJDYBllcrDbV7cYic81KpQQduFYk9CpIY6C8bg90A+cYud?=
 =?us-ascii?Q?lqgR8vioyF1x8uJJhNyvxGhvLQdwpu34FK1sF/c66fAp13VOBcIvqJ4zYR0J?=
 =?us-ascii?Q?6qMes+7OwqoXwrTv5IXetjS+NtljwimmzZAlozMrCmXqmSyGHv10s5SkBFYY?=
 =?us-ascii?Q?tO1az03GNyutzCcrNSCyUmKJBJbtG2iyB4c4CmzYAom4RD4iFUPXkKYRuotI?=
 =?us-ascii?Q?8G90kilkZJTkMja/JIwaBdVg/j19Bify3ScLw+nErh2di8L1QMWymsXnRT3X?=
 =?us-ascii?Q?7MosbHmijWk6v7zjdLsvyFvo8o0jLNua+4jRAIuoXcY78+3LbsS56p1mOmCj?=
 =?us-ascii?Q?H71b5/bCth2xy4L461uQgAvqAIYEFD/AFECFpQIa2eaUesorqA+LIyWBAuKE?=
 =?us-ascii?Q?4dWjAxP+8N4WHnUq/sFuNOxeF0AmqTh6xZJoZHqYxH1VtNVYkY4y/eiidb1h?=
 =?us-ascii?Q?Htx3je5B/+oOkXfcSF+btBCimdyCSFc=3D?=
X-Exchange-RoutingPolicyChecked: EbdGvRDRxNTzsjtHK/5X+EnGJ4LEFBr8WomfYy0bQOtKpYCEZ25oOkbfIwgMxc8I/Kuc1xIFdvnQJdqeoEwOWUS/j6iZqipqULZsVHz0YB7t5ZhgV7eLtz1eP7Nx0mKcIJ4jD0RUq7LYTAakW+BHvYb7xJjrICLnMXcB0vwSm7lpTmn+eG0RfylL/fIv8VZUeh4AfasU/ozMHeejP9cU0Pbeqs/bA/2SXkK9+xbKURNzUf21ImlvwZ0VJpeOQLT2YINXu8VAoasnsO+wsP25Xh5GcOmVXU5RXi8HzCQcoK4cZWLyrokjGH8ozu/szqQqMGSzSKkq8t3Te5VFknPpHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f80738c5-1e02-4fce-972b-08de8075c672
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:27:26.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWyEge59ZCV8ns5su7BGBVX/cH0FvJgbza3UqdIsh3sfuHF27zy8leeLqOCgGutaCbEiQhhGoF37ZdC6Ok5H4soN/D1JGsbeaTLgfT16a9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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

On Thu, Mar 12, 2026 at 06:22:46PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/wa: Drop redundant entries for Wa_16021867713 & Wa_14019449301
> URL   : https://patchwork.freedesktop.org/series/163135/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a_BAT -> xe-pw-163135v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (14 -> 14)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-163135v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
>     - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-2:          [DMESG-WARN][3] ([Intel XE#7433]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
>     - bat-bmg-1:          [DMESG-WARN][5] ([Intel XE#7433]) -> [PASS][6] +1 other test pass
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
>     - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#7483]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
> 
>   * igt@xe_module_load@load:
>     - bat-bmg-3:          [DMESG-WARN][9] ([Intel XE#7433]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a/bat-bmg-3/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/bat-bmg-3/igt@xe_module_load@load.html

It looks like the drm-tip failures were incorrectly associated with an
older bug rather than #7608, but this did indeed fix the failure.

Applied to drm-xe-next.  Thanks Sima for the review.


Matt

> 
>   * igt@xe_waitfence@engine:
>     - bat-dg2-oem2:       [FAIL][11] ([Intel XE#6519]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a/bat-dg2-oem2/igt@xe_waitfence@engine.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/bat-dg2-oem2/igt@xe_waitfence@engine.html
> 
>   
>   [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
>   [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
>   [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8798 -> IGT_8799
>   * Linux: xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a -> xe-pw-163135v1
> 
>   IGT_8798: 8798
>   IGT_8799: 8799
>   xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a: 3ccc0e3404591e404d0dee79406cd013f377356a
>   xe-pw-163135v1: 163135v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163135v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
