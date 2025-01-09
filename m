Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4552AE7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 23:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2B810EF58;
	Thu,  9 Jan 2025 23:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1JUTbm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB4110EF58
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736464964; x=1768000964;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LokHWwFVLAC0Fy7L8TfZ3cLXPU8FmRY+FyQlPZ6rYNA=;
 b=i1JUTbm9EVRPbVHFOgveJ8XJSl2hs2XReyL0z+pGLJvgnaGGG8abPXbW
 9VWKNY1YDemWPvCZM1VJB1xNsXvSds+QvcnqlcMBbySjFi/l0Ky7lFLcQ
 oQ2TG4b5ddcaVwpeZKde7mheCVWQ488Ng4clIRzWweEeHuNaI750lcnuh
 fa31+YElOrRpM4wjBxfDH4nPYd2kT8HvrOg3SgUv0v3/ySH4Xno7eD9CN
 znmF+VIVVQlwhscIWtjnWAVNRO/xJB1t81UGFf/nDJE5VRBu9NeIDU5tB
 6+1GHkw0BnnXR7HKETGmIFyy5zYX8wUtfpgR3dbSRdwPa5S8H9HCdco58 w==;
X-CSE-ConnectionGUID: He1HiSXbT/2Z+hcRogC6gw==
X-CSE-MsgGUID: rI+5+BJZS0qct7w9nkK+yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48112616"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="48112616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 15:22:44 -0800
X-CSE-ConnectionGUID: szHCbKbxR9K25qIe6cIsfw==
X-CSE-MsgGUID: F0Luz1bQTf+4phiYa3Qtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108175123"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 15:22:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 15:22:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 15:22:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 15:22:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmT3P0pODsIyMTlM8KOSYaMZ6MeJ9B0W3ni+nE9XhtGWZPLorG2kCTby+XR2NznvyMq2ysJPKgqiwkBB7kiKsohZXax4oOwog3KlxROnOYx1UXhZZHg12GFbF6O4rdwJlLJxjo1tg5on8GOG0Q5FtWmoJdc2g30FGjhPrJUmupMab8ZgdPZlxL7Atv7yDlgTDUL12qjZ1YYZTYasFxcFASLS3U2EBDs0lFQAo8uzUCHmdxso6pT+uYPVbvDVyTepcGhDOZtkhuFgZdH5ov+FCe6Zi29IyNXcRXtI0LPV0GLic0AmPWVjXtBJUpXPxyhvQlGFUfl4Z2VC6Eh/6f8CNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK+qTPckDDM3scnHDXVJbcQWUTJkrg+spUwT5+YbTZI=;
 b=t5VKcR2aoDeLiO4YpH3QQ7LuYYr+TF2goX7579In9frVrIX9+gNC57IjDESu6RwSzR6rstjGjdel4Z+WN8tqjCOIjsTIljeG5OmlAldaeshGVDZMP8Sz0YU+/HVdgMdAeRVYpPX69zHBGC7KUzff+LdxE8aLhQPv9vD1dwMyTDuFr6a4rJ0XEsbx12l4h9YrpmR00pzazgCHM/x+fRHj3qM6KSXnGQWwD5iiF31oyW6UeaCBdLAMG+WV0ECxr8uRYaTg1YWjgl8OkXhL+tQO8Gy7t7+qsljQjKReULKxluIJhqI0+o8uVgV0cXzp/b9+aVCOyS7rJKTMUuTqcTr/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 23:22:38 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 23:22:38 +0000
Date: Thu, 9 Jan 2025 18:22:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v12 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <Z4BaOYG7ZkyHGfE9@intel.com>
References: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
 <20250108175923.2160130-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108175923.2160130-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::20) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: ccababf7-cf83-4053-f9dc-08dd31048173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ke6kzwSxl2wMOZ6J6fqNjxtUaFEVkVEpoHmLMc+TYdySP5Cm8abspqBqSy?=
 =?iso-8859-1?Q?TZpXUcn9TCoyqdCWM76u/wnKf2O+6cAVvnKEalT6X1YQWhdh662W30tPHH?=
 =?iso-8859-1?Q?7pEC6gN6M5TPwI4xO1MyXp1gNZcpcBt3qeQKeegveSzz0wdqPZzyIRoD01?=
 =?iso-8859-1?Q?Vn2yOm4qEQD5jiiRehEAAXf+FGkzeVJ6LW6QM2EQvYDmC+CzwxHrykhhcI?=
 =?iso-8859-1?Q?yJ4NSw0L1BKFoo+6OauF8GXEVhlAoMypx3C38kxf65ctWxKdmiHWLhKK7U?=
 =?iso-8859-1?Q?q5k6w4GoSwSsJiEinmJ3IYhwv/oCmTHZ7mQwvbkFm4rIn9klJv6VVAgvJz?=
 =?iso-8859-1?Q?5XxYX0YnuhZLMPTh1zewyqYFoGnPgLqzgvaVwKVvRAurZat3kTZauXz5tX?=
 =?iso-8859-1?Q?XXkZ21tCI70HWYr+Wzmpt95/PEVwQQb1KxVBMdXo0jGfXd9pkzJUUvP6dn?=
 =?iso-8859-1?Q?YVgLSPn5X3ystrfvyXmn8S5XVzkohnTYS7Df5IB3pdAedBkoVx/N9dy4hQ?=
 =?iso-8859-1?Q?TbaOzPpIduIhdhgnRiodrDndrcZliotXK6Y37k/lv8lKv2MDiY4kRMK0wJ?=
 =?iso-8859-1?Q?TtQSVE156ig6KSiENJbEeztodD4gljDmw/UVJGDQsQJC7V6Lcv4nfbuKCt?=
 =?iso-8859-1?Q?TLoV7zLrvH0WaYDZYfiqKGrAdg5FHR1R8TiVpp+aU6s50LIcIZ6dZxnbvO?=
 =?iso-8859-1?Q?EWSVo90yALuXUAItd7f2y+d6Mi4Xp0WdStIwT+1dSV2SB2wTPXhxLLETLM?=
 =?iso-8859-1?Q?W9ZF/Mg2KVY7FMQXFQsV7acN3J9IsWaaiXeE89BiqPCWOqEavX6PMSkc2N?=
 =?iso-8859-1?Q?8DBfMwOXffyarwrUVgHgPnYQvTfpMXRqn1e+N2SW47pNdv3+u/zjzN1wqX?=
 =?iso-8859-1?Q?EiVWpePbqi8Io6JL6alXWw8RZjuk7ATSZ4kTTy8AqkMWiU9VOgPLJJ1hL3?=
 =?iso-8859-1?Q?LcAWBqoClIj/46vQ/dakvnmDyqrBff7PL7n3U/bvdiVzz8f/ycnvZzKn0Y?=
 =?iso-8859-1?Q?98AG5RDOYRD2pPUcPXENzqwRHiw7AwRY1f+4DRngT9kROnbV37MPITeVPh?=
 =?iso-8859-1?Q?XGHU0KAjhL+YfEqqKzFVIF59PNrMTMJe8ZVoTcCM2JuOQVgZ6AcpBIZ5cW?=
 =?iso-8859-1?Q?9O7Nc37/Bkw+B/72wh1+r6lePUsmhKCUx8s3grbcltVlEGmFFjbKpepgkt?=
 =?iso-8859-1?Q?cSCg4krnS1A9UClI9tUe/jFnvia4NjjVOVRJ6O3bGN1olRRh78T9Wu9ys4?=
 =?iso-8859-1?Q?9dNPweSk+iQ15Omd7mHK6SUXzqKvkWKDgf4tYCYCb3cPpfi1Gh3VAu2XH+?=
 =?iso-8859-1?Q?ocpYPEO5DBz3N02PNgRadx4gErPQiR11eMKPaXeapTaFUjO6iFcgX0Lbal?=
 =?iso-8859-1?Q?AMSzHM1YF5vsQ5JGhMvQ45kllwqGahhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P1HQ6YHF48B1RmCVcBxxJdj8sFrWN0trH8XQpoE6q9xsOdcCQ4Ods829Vh?=
 =?iso-8859-1?Q?6KCrOg6Oi430L0Vw5Twg2hLJpFanw/FW6w/wy5xjYfpnF9t3HtxyhSBkgz?=
 =?iso-8859-1?Q?FO/jW/8Dk6dnk1BrAFCY5WrEnPs4RsoS+TBEDfPFuJKLrbAj3nhx+K/Kjn?=
 =?iso-8859-1?Q?UqbAHnewgZExWKSq16Jfx5sLXiIISXpair4LI5sPi4prp6/EoQ3FACM1ty?=
 =?iso-8859-1?Q?PKTkGCaYJBVtBGkm/8lACo9cIlxITUBjIGCryi8rG3I45cw7PTQh7PAfXt?=
 =?iso-8859-1?Q?2RhSNsDR2lZFtrOEGdsdxl8TU0sxOXAGR6oqjRv0Kuh0vandRo0NiMQ1h1?=
 =?iso-8859-1?Q?Lw8fyTl/5EzuBWUlSjjHUWLwEB2oacMsOyXcSrpdBdDKueBTfNZ4v07HDF?=
 =?iso-8859-1?Q?Mz2ryt2gv0/nSL8WhakxpvZFueXQFXEl7rq2L3ftY3P0M/DxEgm+PRq08G?=
 =?iso-8859-1?Q?C6/Q3W5bJOe7hReBO2BZK6nlyp5xVgfngYU1hgJ77AB6Bt+Oi4X3hgMx+j?=
 =?iso-8859-1?Q?k3ZNT9ugzVPTQMPOUXjQUrY4jKfGkr2Lnbl82Da0rEXr0JoyIVzA3owc4A?=
 =?iso-8859-1?Q?wUUzQS8coIO2lA+RyK4a4zzs/JPjnZuQ1h7F3faqIHu058T9qQxpE/15mE?=
 =?iso-8859-1?Q?Yfcwotb8sufYB1twaQLi0ri0C5J4q9JQxWNv+jbUDj44BhCvakP+2n97yA?=
 =?iso-8859-1?Q?g6ZJ/MZgoNOSQWGynCFFMCY8+q3Fk+bJco/YLeI3Hj4m94Hxw7w+ejBglb?=
 =?iso-8859-1?Q?5xE214jaAJYbUZAHjSphjZJpY9PWOBERgpF6vWFzrjycBNJ8t8+FmoNWLz?=
 =?iso-8859-1?Q?RiFiHu6Tv63a1FscYyTujzgL4nPIPYKnBomCDSAmDgBpmwioU0KLaJ9ti/?=
 =?iso-8859-1?Q?ibJLwcKdJ6Jms7Jqgu50JmenFSx9G0csiI/VEkdGMj+4rPpf5ZFRSEyGdG?=
 =?iso-8859-1?Q?4ZcJPB4Ee15wv1YMu0epGiuaF8Vf8UcxRiUDBrD5rBX+H0AMsCwtpnrlZp?=
 =?iso-8859-1?Q?SjzSlODcaw4jLuWzmmFqBiPpeLRJZp37ymtx9vdR5iJXBmae+THygeRyxQ?=
 =?iso-8859-1?Q?AhzEwKEledXEaWQPE80TJVCO9hYBDOvgXdYJKeRJO9CcU+rQi/ZVKvjoku?=
 =?iso-8859-1?Q?ZC9gLxjcBY0aYprB5Jaf+x353fMQQLco0m4MNw2pcypgyJl5jvBQOuilwl?=
 =?iso-8859-1?Q?CXMgwzB3HQqzGOIsl1kcSyB9y75i6e6kuOwWz1BMMkEGry/dPIQ46Av1h5?=
 =?iso-8859-1?Q?8q894mGPv12aLnoD2ojFFNb6v2R8Ym0v81WoQ2tjUgaQpkhSBqT5cCf7A4?=
 =?iso-8859-1?Q?vLPqE4nsVZHwwCdCmGzzHwaHGxBR8PjkhGpixVT4ey6IJXtWZgowUxeUkZ?=
 =?iso-8859-1?Q?ZDe1WufUIOCWMU/S9evkgCQ0e6YHITxWJbKvyqijqyBoTJNeupUq3iKCIY?=
 =?iso-8859-1?Q?HJu1JswjAi6rBq4fnuGrqn4JS9SFEqHBMdeVuDeM9m+FY9CEszy28Rr2ul?=
 =?iso-8859-1?Q?x+sQKlF4iFs6zucCl6C8brEGYsKlfl7iThetzjB73s1pQzan8bpZhhT8Tn?=
 =?iso-8859-1?Q?mIHpEl7uQtposBeaOp+HV38UpYvtZd119McN4vAv8FUy1a6gOAav2e9PZP?=
 =?iso-8859-1?Q?fv5p63PU57B6oXx1LFrgp2CDcNgDgoiVLiwFPG72e9JlqBASVNqxUm7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccababf7-cf83-4053-f9dc-08dd31048173
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 23:22:38.0964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3owc69UeQu6PAUKek3fQelGHCxhHyVb7OrVSmLKcXsBnaJkR0rjv991rNAj6cisAIYmrE/sO4QxN0eKVAs4Ulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

On Wed, Jan 08, 2025 at 09:59:20AM -0800, Vinay Belgaumkar wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers. This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> The pmu base implementation is still from the
> i915 driver.
> 
> v2: Review comments(Rodrigo) and do not init pmu for VFs
> as they don't have access to freq and c6 residency anyways.
> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
> move drm uapi definitions (Lucas)
> v4: Adapt Lucas's recent PMU fixes for i915
> v5: Fix some kernel doc issues
> v6: Address comments from Lucas.
> v7: Define events per device and use xe_gt_id to choose GT (Lucas)
> v8: Use config field bits for gt_id as well. Use raw_spinlock_t
> to avoid deadlocks with perf subsystem (Lucas)
> v9: Fix checkpatch warning
> v10: Fix goto label in attr alloc and other comments (Rodrigo)
> 
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>  drivers/gpu/drm/xe/xe_pmu.c          | 615 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>  drivers/gpu/drm/xe/xe_pmu_types.h    |  78 ++++
>  7 files changed, 733 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..9f3d24a5d611 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -301,6 +301,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		i915-display/intel_pipe_crc.o
>  endif
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bf36e4fb4679..ca557c22c979 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
> @@ -760,6 +761,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_oa_register(xe);
>  
> +	xe_pmu_register(&xe->pmu);
> +
>  	xe_debugfs_register(xe);
>  
>  	xe_hwmon_register(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..bd1e72d318f7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
>  #include "xe_platform_types.h"
> +#include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> @@ -525,6 +526,9 @@ struct xe_device {
>  		int mode;
>  	} wedged;
>  
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 0f2c20e9204a..d3a9d4bc9bee 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -14,6 +14,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..5ff830e66ed3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,615 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +#include "xe_pmu.h"
> +
> +/*
> + * CPU mask is defined/initialized at a module level. All devices
> + * inside this module share this mask.
> + */
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +/**
> + * DOC: Xe PMU (Performance Monitoring Unit)
> + *
> + * Expose events/counters like C6 residency and GT frequency to user land.
> + * Events will be per device, the GT can be selected with an extra config
> + * sub-field (bits 60-63).
> + *
> + * Perf tool can be used to list these counters from the command line.
> + *
> + * Example commands to list/record supported perf events-
> + *
> + * $ ls -ld /sys/bus/event_source/devices/xe_*
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
> + *
> + * The format directory has info regarding the configs that can be used.
> + *
> + * The standard perf tool can be used to grep for a certain event as well-
> + * $ perf list | grep c6
> + *
> + * To list a specific event for a GT at regular intervals-
> + * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
> + *
> + */
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_MAX_GT_PER_TILE)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +	u64 event_config;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	event_config = event->attr.config;
> +	ret = config_status(xe, event_config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const u64 config = event->attr.config;
> +	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val = 0;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (!pmu->registered) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +
> +	prev = local64_read(&hwc->prev_count);
> +	do {
> +		new = __xe_pmu_event_read(event);
> +	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->registered)
> +		if (flags & PERF_EF_UPDATE)
> +			xe_pmu_event_read(event);
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_str_attribute {
> +	struct device_attribute attr;
> +	const char *str;
> +};
> +
> +static ssize_t xe_pmu_format_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct xe_str_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_str_attribute, attr);
> +	return sprintf(buf, "%s\n", eattr->str);
> +}
> +
> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
> +	(&((struct xe_str_attribute[]) { \
> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
> +		.str = _config, } \
> +	})[0].attr.attr)
> +
> +static struct attribute *xe_pmu_format_attrs[] = {
> +	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
> +	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_format_attr_group = {
> +	.name = "format",
> +	.attrs = xe_pmu_format_attrs,
> +};
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i;
> +
> +	/* Count how many counters we will be exposing. */
> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
> +		u64 config = __XE_PMU_PM(events[i].counter);
> +
> +		if (!config_status(xe, config))
> +			count++;
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_xe_attr_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_pmu_attr_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_attr_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
> +		u64 config = __XE_PMU_PM(events[i].counter);
> +		char *str;
> +
> +		if (config_status(xe, config))
> +			continue;
> +
> +		str = kasprintf(GFP_KERNEL, "%s",
> +				events[i].name);
> +		if (!str)
> +			goto err_alloc;
> +
> +		*attr_iter++ = &xe_iter->attr.attr;
> +		xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +		if (events[i].unit) {
> +			str = kasprintf(GFP_KERNEL, "%s.unit",
> +					events[i].name);
> +			if (!str)
> +				goto err_alloc;
> +
> +			*attr_iter++ = &pmu_iter->attr.attr;
> +			pmu_iter = add_pmu_attr(pmu_iter, str,
> +						events[i].unit);
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err_alloc:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +	kfree(attr);
> +err_attr_alloc:
> +	kfree(pmu_attr);
> +err_pmu_attr_alloc:
> +	kfree(xe_attr);
> +err_xe_attr_alloc:
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (!pmu->registered)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
> +
> +/**
> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
> + *
> + * Returns: 0 if successful, else error code
> + */
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_state = ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
> + */
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_state != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_state);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_state == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +/**
> + * xe_pmu_unregister() - Remove/cleanup PMU registration
> + * @arg: Ptr to pmu
> + */
> +void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	pmu->registered = false;
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +/**
> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
> + * @pmu: the PMU object
> + *
> + */
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&xe_pmu_format_attr_group,
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +	int ret;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	raw_spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (!pmu->name)
> +		goto err;
> +
> +	/* tools/perf reserves colons as special. */
> +	strreplace((char *)pmu->name, ':', '_');
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	pmu->registered = true;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..d3d91d00e50e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_unregister(void *arg);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_unregister(void *arg) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..29a2009f4d5e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +
> +enum {
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (60)
> +
> +#define ___XE_PMU_PM(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
> +
> +/**
> + * struct xe_pmu - PMU related data per Xe device
> + *
> + * Stores per device PMU info that includes event/perf attributes and
> + * sampling counters across all GTs for this device.
> + */
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @registered: PMU is registered and not in the unregistering process.
> +	 */
> +	bool registered;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	raw_spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding perf attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> -- 
> 2.38.1
> 
