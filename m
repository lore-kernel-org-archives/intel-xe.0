Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB389EC111A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 18:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D2310E28A;
	Mon, 23 Feb 2026 18:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kdj+Xahn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11B410E28A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771870927; x=1803406927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oqz0LNLgXee+zoMBuLhDB+Adwz2Fhhvih404RQbnMvg=;
 b=Kdj+Xahni18qGtSRp9w70TKqLPRg4GC1/WAP4qTvqRlvvX5pTfx2y/Ng
 2btcDXCtduKtr9e0biofjCigb6FVbrNvCkb4LEUuZWhTWCNUtnCqIfn3j
 qOA0BlHXck/bpzIGCyYKHqZvYpD3nC90ijYiqHbDzUNcbrp1XzLHsh4t+
 COdcYHi2F/IqUoB+AZTZy6fOzrRYJu6XEtq+k93To3sm2J81RDvx7UQGL
 gOUY4zJKK4L9fiIkp+5dsq/zZAXFGDmicaACIPaCeALooaZD9D7dKz0mc
 NHUOvtUrex4j9ZNl16STXnZkTgGunKCGloiR6WfOdaKXuAHtpTTJTKoCK A==;
X-CSE-ConnectionGUID: XishJWi2QP2igVWU2CNL9g==
X-CSE-MsgGUID: hwsLCGc4QbmvGqo8nV9tMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73055347"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73055347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 10:22:06 -0800
X-CSE-ConnectionGUID: 3LEGjlNpRSuO+ZHtghF/hg==
X-CSE-MsgGUID: Dn3WfIl1Tn258/x9dVeqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219762255"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 10:22:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 10:22:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 10:22:06 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 10:22:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlazN2uIOk+vDvMVPnlRGm0wpmWevgYDVzGEo77/99p433ga3M8oMBADhQHhZnisAEYBWjBjHPzP1axiUc2KoHVwQJWPWpVDQ4m/47hZyPwGouRt8NXeKmvD7p8rDbXJTm2RZyrl/ijRsF1hEeBlS6u4EpmnBCb5vk73eZx/yYLHhjKI1HwUGUoQefGpArIAgCgrPD3KIpxoXh27lCmR3bcJYre1uZIgnrYc8WB465yiN48cF/2t43mWP6VWy5HNLHTGoRgiCKoGYFMWJnvCuEQJZIOsxIDYZaa4Fx2K97GyDjWrE+NnUrzcMld1GVPbOjCP1Dv0BR3vLgYa3aY/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hME/K8E0OVMoEFQoz903fd9sqvRhIa0SIxvlNrZ2XHQ=;
 b=WSHmxlNgXNtIXm2phdXaXigE2jqY4bKQdnbbgXjI/AwYii1urDbGcCz8l4Gi2lw6i5Z2Y1r+PmTKAvR1QTtpdhUHYXuqAL8i7lptyW3NVNE07bRWsiDZy2POdPph2QscJUlQwiRgDGaHBaNLVbvUS/o7QmmHmXIHBLetKxU+u8HVMz6L6D4J9IARwhuyNifKYulLVwDC5QpUowaVZfeNi6+jvmtNS40UJEED+2zYbBTKLbpa2PpHOP5qCpzUQjx52u45obMKISlvUjLuWJ85eBEc+2AJl8nsdSzopbjD6wbJ0dx5Nu5XKyUbqPD/GTxBBgmK7MhwikShaiteDyCUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 18:22:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 18:22:03 +0000
Date: Mon, 23 Feb 2026 10:22:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v3] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Message-ID: <aZyayQm83eeox4Wt@lstrano-desk.jf.intel.com>
References: <20260223175145.1532801-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223175145.1532801-1-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:303:8e::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f481213-e80c-4824-f744-08de73087199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?naWF/dFIblQbBFDNOYFRo8BV3Tmp250qUmQ6w7qOn+Pwml4FYykKweXLJVHe?=
 =?us-ascii?Q?P4mo57Ts57kMhWPMHFjcRWBXRMN+t+3uMfqhL5VphDRpLv6vhsqMmZsCUSWV?=
 =?us-ascii?Q?LvwmuS5GHyyILa/ZMs3WMfypuf3TRh2Lbvj1bVDZdNpl3gghhm6YAv71DIn+?=
 =?us-ascii?Q?5VsvciRlQ2Vw0icRSMW23Mn1Gw55wWTjRxtT/2RGD6pPnMG0KXaQmBMk+1lB?=
 =?us-ascii?Q?zjjW0Pf+2jqmevHTTaymyk5nXCBuDIGCMbXVPuCLlH9lVydxyKVpaiiBYy6A?=
 =?us-ascii?Q?d1tZsv50pYny1r2pq9LWpDlKxDy/ItpltpotnR9r2OHsY6mfnV1sqDP0dH7j?=
 =?us-ascii?Q?jX4OWyAwhLCLHoybaS5ky9xxYEv585U845cNbhdGn/H4ba+4cQrHrOBS92e4?=
 =?us-ascii?Q?IpszyiVTtUehibp/hQ7I4p4knuTc4MHGSSKzu/4uAe/6/NAQ/k5pIKG2fpeG?=
 =?us-ascii?Q?JZVbU8a7mzEMlaWtn4MX1+7E1JqoRthfHwK3p4uOx95x3spEim/SVmdLdFfa?=
 =?us-ascii?Q?XdOtDCUN0amsh1YlxJlm1W5VBWNwQUwQ8IL0GKbxvPkeSzE/t458smPNRS9i?=
 =?us-ascii?Q?BUOzxG4vI3OoBohMsWA1SZekejHLOozcanEVsuqYRsApsVVfgPoDhcNzaUtX?=
 =?us-ascii?Q?R39WB3UOlp3qsyYdYShG++JLoyY8BVp6hFaLyHwz4wp+8r28sIBf8ROin0+4?=
 =?us-ascii?Q?2/cqH9xujO8zza2MPHZOFzA9R9SBY3pSXPAHs6yF59XIVERL4SVYvzJ+L5Id?=
 =?us-ascii?Q?+9i4YQ0e5EYgCdoK/mNOyUCXWNznR//1JSHKSTw13f5jL/15SfKi+YP8GR6E?=
 =?us-ascii?Q?namn8j93H87j5zdh0PaaXwP3Va6Zk+KQTgiocUlZikoYUECHewwt8NYvDfOS?=
 =?us-ascii?Q?6jRjp8nImo9WXf/53Tc7g1Bl6wVqFx1PqQQDOiICnVl4mQ4Hwr64nDmPduJ4?=
 =?us-ascii?Q?mmVvAtL0Gq1Vqg2DO92yQG6jFxpcug8CDD2CWYBqZ6R0gvZYvJ51M5q0SwEY?=
 =?us-ascii?Q?zvsGxGhHKbU0Fd7oAtIwaglgGIeA7RL54AawlpLJeZPSm4n0wbymwM57TzsG?=
 =?us-ascii?Q?GcxG/hbj2mUqpTe6nQ+BOpGNgAl5fJAwr9cBpbdyJ0VAd5DjU+ALi/eU5SGy?=
 =?us-ascii?Q?lxhM3ldz4e9+SQsYPZZYi2kQ0NxXWvuPJKzLe0BLyz9agT6YCn76YHJz4qM8?=
 =?us-ascii?Q?UvnEm+FIXmL0MUsGt/hf4m1RKkQqotu479xf8lm508LIQb7bULTPcUWpB7sw?=
 =?us-ascii?Q?aTe8ZEzRZ8RhrHPPpqY3PloSXQ7hiINfSThu1bL9haF9dlxO9Y+ScIzuo+j4?=
 =?us-ascii?Q?Z8sZPcJ3SvJWg1kALrhNOgLj318idVPmYc1TdhxCFbcpBiD8F61iv9Ak6rIW?=
 =?us-ascii?Q?ZaZlzr8m+qDN1nnpFpgdAJc7A2YJYwIu7XbDL9aRuijDfYeF4zv5uZl5eo4n?=
 =?us-ascii?Q?cCDwI05FMugK4wlOkn9lDC9su4jdUfpdyMFXorNcE+hiwZFtI9YwPRQ+wSAK?=
 =?us-ascii?Q?1RtoPyz2I5afYqLW627SN1ATW2p5zQ0LNMqqu11pbNNFzfxoIbnFk/kV4qzk?=
 =?us-ascii?Q?+eQiiKsNJNJURpSVoe8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/OXLZWBZA303KNSebtHoKx547UQW7gvHz2IQLQ8lCL5FS1WlSO3haUwEbbyw?=
 =?us-ascii?Q?kHralfJa9Rtdi29cBqsYGX9nE4pduFWlfoaxpeG/xXmYx6rqSkY4FnP/OTnp?=
 =?us-ascii?Q?U9wOCMHdaJ06Du+C3v8YCU2wEepq4CD8Tjj/fyOLAKVhqU7vYgGqgJuE23dZ?=
 =?us-ascii?Q?lC6zxBAGuOGbjt6GLW0BDUmPVLgwlvm8c2NUW43vCYaqCEZ7RvWU9FuohIEo?=
 =?us-ascii?Q?bGkwl4ufcX3zQFgB7r/sDIcxQlMYyx3YfEYW2ZadUBvpF0Ewu0RX93YI8w15?=
 =?us-ascii?Q?w6vSAY99jKPafM2RqtzMlTsOz/FrHsnA3kMMFMidfCLPyaQYi7Pi2UFFv7nV?=
 =?us-ascii?Q?tzBO5i0O4QTbgmpMhb2D31raEBy8znwoT6o3/TNpQv101aicGB7aH/qZHffX?=
 =?us-ascii?Q?Yz7CKPyWtBQN/wsmKkeJoZ4eeWP5tN9FCq3K8a8jJ9ISnozWDWSEkYyNHtB5?=
 =?us-ascii?Q?SOF4eJ2wE7X/fnH0BXn6N6t4b/ObFKJAhsHPB94T4edVZnbVgwiWNukGanrB?=
 =?us-ascii?Q?zKMI+s8zHY6fcfP3hxTXdQ/rXu7IE32XlvT2zAZWtAe60F0ymWhfVf/iWaqr?=
 =?us-ascii?Q?UEjBH069hb2uOhobpMF46YoIvHd39zqeLHPx3MFM/IwR/QLg9HAGGzF4uS3d?=
 =?us-ascii?Q?drxmmB9WUE+Bk1FP+Un34LNxN3PZkv7+0acG0AUgGt8lmomdsR4QmdrjIJ76?=
 =?us-ascii?Q?zEBnnBL0XhCKZoIZhFhwaURQAeJRuVJvgb2fNqFabweTBD3zcKdwON8iVOEM?=
 =?us-ascii?Q?35OuNM5+cBhv93AaQRYV2gdJPkfw1MJYxHXhN8V3fJdiBR3gjk38Yw50OMz0?=
 =?us-ascii?Q?b485wJjxu+wnXcfWiQ8l8p0s7Q9gjR6LfPUk6oY57ZI4KwGUSjS0Y8VaCmd/?=
 =?us-ascii?Q?p3ReEjxLfxFWn/bfMl3hV4c6TuaJ4/27luoenO9Gnj+gzxiCSG31wO+M7unH?=
 =?us-ascii?Q?72dKMq0DyCOm8CcntJH5U3bJ+CDpvim5gBG52vEw6DwEl5WMO6ArdM6Fju6n?=
 =?us-ascii?Q?U2A/GuULMRl/5gzWSP+RuLfkN4M2Uoyp67uslw2hFtDh/+/cumMgvpbfS/x9?=
 =?us-ascii?Q?YliJk0NVp3QJkz8/J7lFnyAf0VWABLn+xyo4PSu88f1nIrAu+9GOwefbefbB?=
 =?us-ascii?Q?bXZ5bPT3rID4bOfJvJca7GGfOWX8StCkZ4ZoRnKHzEBob/Iq9WdTmkJRZlan?=
 =?us-ascii?Q?6CLbmUAGyoYZlWp5zussMeC2gi9fKr3wR1EnDsW/o5lkzVn9B/w8XyziCYUn?=
 =?us-ascii?Q?IkeS88QpnyUjmzw5VFA8auIjDBysJtbkXdxxgbTTCbkfo0TnTWcnRLVnrkN6?=
 =?us-ascii?Q?Gmls75oVkkMwMRl0dCJS8RCpTX6aYp4AG6zzt3fcGto80PWihgTtqDL0VNbe?=
 =?us-ascii?Q?B8i/sAYJif5xoXHVTBEh1TPw4aaBAxpjS4wlk5fyEYphczMeJTtcKF/SQRmC?=
 =?us-ascii?Q?h9aS97jaaxFTvGdxbkzovhum361mVVZDMTBDYSlS/eG2ApeiNeMsQC8gJd/Y?=
 =?us-ascii?Q?V68zyxfeQ/w/Artr79USvBZcwfui79nH+PNJ8GYg4tTidrXfe75dtOOPbEja?=
 =?us-ascii?Q?qAZG/3LdbRFgereSSjjtHuQfxuW9ogwAFpx5ts2tSGbM728Z7q9bHoMUSB0w?=
 =?us-ascii?Q?ArWBOFK5hzvVbHk6OyihbH8ZGf/gC1yEpaEFqCzxe3ce/NlyRWOmVbmr8PVX?=
 =?us-ascii?Q?gdI1pBCUPhzu8QDWeWBsQcb4xavC20KLjReOoY/am7BzIqHmcia+r6hQRsTT?=
 =?us-ascii?Q?JKaHdpq4nf7pz0eW07cdefkayK5RaFI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f481213-e80c-4824-f744-08de73087199
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:22:03.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 954vmMxKywQqB3wlaPb2xh8KqjTsSeLt5raciGR6Ivih5y9youRrdh5JH/5G+gBHs9zl1D7DsATFgQA5HHqF9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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

On Mon, Feb 23, 2026 at 11:21:45PM +0530, Varun Gupta wrote:
> When check_bo_args_are_sane() validation fails, jump to the new
> free_vmas cleanup label to properly free the allocated resources.
> This ensures proper cleanup in this error path.
> 
> Fixes: 293032eec4ba ("drm/xe/bo: Update atomic_access attribute on madvise")
> Cc: stable@vger.kernel.org # v6.18+
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
> v3:
>  - Corrected Fixes tag to 293032eec4ba (Shuicheng Lin)
> v2:
>  - Added Fixes tag and Cc stable (Matt Brost)
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 52147f5eaaa0..0c92fed6c6a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -453,7 +453,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  						    madvise_range.num_vmas,
>  						    args->atomic.val)) {
>  				err = -EINVAL;
> -				goto madv_fini;
> +				goto free_vmas;
>  			}
>  		}
>  
> @@ -490,6 +490,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  err_fini:
>  	if (madvise_range.has_bo_vmas)
>  		drm_exec_fini(&exec);
> +free_vmas:
>  	kfree(madvise_range.vmas);
>  	madvise_range.vmas = NULL;
>  madv_fini:
> -- 
> 2.43.0
> 
