Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904DD778AE
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 18:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3607A10E1C9;
	Fri, 23 Jan 2026 18:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhqRM+YY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804DD10E1C9
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769192843; x=1800728843;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8byFfOTzjXDph8XiN1oXhkeZz8wZsnMOyG9Aa5YweOk=;
 b=OhqRM+YYxzeeIScd2ooRhi2t23QZy0jrvHPJaUBdAZ//1NlZmkIWmq6l
 oIwIAWfIOv8boB6bZ7Rxm5iyGlSBdFF2hbLJHrSwnvE6Oq6xfvPDq3QY0
 uNZNCb21xk3kyx7xw0cL0YtgwkXZDDulOFJg3wLNXFlso1yXZsRV4oCWG
 26847WP7kdh7hFt0A4+AntUHzOZcZ+U0wJrJvNxXNeMlnthvG4KzsH2de
 j375PsfWZ4IJu5iitkB4i1hQfCdiSS6BuJfOMudTqTnol4QcMIdJOCTt4
 g1SmrKcW0j6PS25C7oUaHaS19VFzuhQWgxzCe3ThdDgm3rlZJI7iipSGG A==;
X-CSE-ConnectionGUID: 5oHeZGicSo24Mr6pLLkQAw==
X-CSE-MsgGUID: oDKDHtJ9S5qv7+jBh8G06Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81890937"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81890937"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:27:23 -0800
X-CSE-ConnectionGUID: YsdDf+dZTI2Q5beUPMwLXQ==
X-CSE-MsgGUID: OQqSgUouS4uTNg7BsalPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206203667"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:27:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:27:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 10:27:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:27:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGT+1+XOGJjmq0md8jVfqhvZ0iDkob7vW0IoXgCW7pv4v8IdBg8hzgttNsCRvO5UyGCnU/hjt0ptd4vR6DCRJyjc5aRuq8tFxLjNp1oA4tM3iix3bcNMyNPN1uckwHQRGWL14U+bakb+iloLKE1WZGA4Rdz7LVf+ndwboqhV40b3Urw1gJlsZl2D0MOT5EYLPTSnnFuAWz3SJXi+CHBRP0unwnxD2c0vAr2SA5+eS9UTvFZgDKLCVnUxO8+jMAtLRpkVqvXo94KvSA3Hn+m2kofqrG/ZnqaoDCL9yRnTYTy3LahNIiWtTm/crvob+f+ShaGtxqs6qzmRjEHSLx6LvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ffpNVyahenIo4PLp66j8w8o80E13fpei+w8Aodz4vY=;
 b=nUlBIHWqhDMlRf363OE0i02HS5QjYHW0+I2Jfzt7A6rD+Rw9+i8ICkR4+KCqJNdG6KBA3RbU1Vt+zv0159El+MnpZjbAdA+qaRy9ZbThrUdyh3J38b0798i/vmLuJCo+Iv+5imPRBg7po0FqFgh2sB8ULAD1ty0f+L3Q7OByN3SjAuPDgKU2ApYctk3C3QUIgjx7guQ9DhzWcV2pl8aCjy2uSW4s/PPHh0/bqPGs/rGDdwAJmsnr/a+/uJ3UDXi7T78ooeNsmDEOtpplDZQeGR2NK4IUF6rY2fQtnxM+hJe2ZDq40qJyCSWN1cmT8f5Vv2ElR/cNuzVjyavhET+nHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 18:27:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 23 Jan 2026
 18:27:18 +0000
Date: Fri, 23 Jan 2026 10:27:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/multi_queue: Protect priority against concurrent
 access
Message-ID: <aXO9hDjUr7MHolq3@lstrano-desk.jf.intel.com>
References: <20260121211933.3354277-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260121211933.3354277-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:303:6b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f5143f-bf92-41d1-7766-08de5aad0a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o524I881LJ02T45ONqjiLbaTs5OLLM6K1b3PYmXxAnsoa0JI5eNjZpjYd5Mo?=
 =?us-ascii?Q?Qn3CrnT5tKZoL0OkO94ot1DWDJTocpKGwCUG2in+tDqUvGyySdT+/JMAREOP?=
 =?us-ascii?Q?QEOxPTvLIMfCu69zM3aYKwKHua2mxCJ6q7mQd110WSRMXAhN0ez8sZlLa3rg?=
 =?us-ascii?Q?RgmwzwMfnDYf04WexMlhZpeW1cEChDJdh4JA0jT/vZNDg+PXOI5m9RF90CN+?=
 =?us-ascii?Q?zXIZEjiLaRvFcrMej8MEbG/3QeEeKHOcYEEMMh4mUEfyrJeDiGoS0gFbRvb4?=
 =?us-ascii?Q?KiNrt3HGhorXGnrJWKFfHJ2I3456NukgdDMniuZHLJ87vzpw0xuS9MUDQalS?=
 =?us-ascii?Q?Nw5UW5Gbpx3N83b6GYBtxtjj7mSTcMrECSGMSeXye1Ek5Wd/CkDPaGsy6soR?=
 =?us-ascii?Q?zYyRpG8W3kngc4jinu4UaO5AzqNK0b7qmWKE3ImO56W6kCz9FsyZae/3yjJC?=
 =?us-ascii?Q?jhZo9HU7u86lyxC9+HpWt563yJrDH0XLTuqGlXcMg0rAc13VPzcJ/pirbktO?=
 =?us-ascii?Q?Nhy+JKZYnMpQVy1dssBgyKLjRkwgd+z4P2xJYCoOw7AStbPh2utLf2UUQrDc?=
 =?us-ascii?Q?vXCD1/clfTLlpvjNDlARw9CGNGgilMK+XR//GgjOdkJ//JFb2TogzTiEBN3c?=
 =?us-ascii?Q?+Xze/nFIsYwPaR/LAewax3GHwiO8H8YVxksc59uTqAeaW9Engdz/o0I4uKuE?=
 =?us-ascii?Q?LbY90Ib9WmA9zt3LvxlN53AuI22Xz5ZtUJgSPP5t7RewWOsQR+kB78pXJtY+?=
 =?us-ascii?Q?DkItFVLLxwHi0is2Dz+PvNv2jrywzUU04xZTlXMVattUy+3mq1U0s38x4c7u?=
 =?us-ascii?Q?NGHPEtvym7j3n2+P+PGZtV21L9guGouefAcJGAy+hkTFGQjeru8T+1lFn0yC?=
 =?us-ascii?Q?oXdzk7Il37c9qYoXiBvLt8fJz4X6ssfv2F1gJpWX94hyrnAvm92G4NMtlfrD?=
 =?us-ascii?Q?ghNkxUwy47nTTFh2+nyOTrHDjYmlB3lMBHinHU33720ivYAZIvEFsGGbUbJ6?=
 =?us-ascii?Q?BYeObtY7TXyd7rtlfEj10XBqEXDgN5g44Rb3zlOthpGPE/8Ju+XJLtLNB3Jb?=
 =?us-ascii?Q?H4aJBkUjPcLXevWGifByD9Umo7F9pbBFXmbTHhg1LuuCK4lp7g08m3TrRU2+?=
 =?us-ascii?Q?RyzzDvvQTccl38lcXlYy7C0FSlrQ6Xz0iYg2IKDfrD8qhZGo099e/JoRa1N1?=
 =?us-ascii?Q?0W1155t0PjwhXpodvmyXbTyeHxZ42CNoYY1eeMwBSADmlUGM1WRVrYEUyXOQ?=
 =?us-ascii?Q?hF+47U+wTs+smG0mR36XgNBexIsYuvKMPMv//5XPSIq9y8JZMGfkq+KCQrSa?=
 =?us-ascii?Q?EE9I/AqG7VvfrH9NY7Yoaq7nW+wrLMLZG3eBlqZ/d5yL3GRRs+OLh1Lt1TK8?=
 =?us-ascii?Q?R2I4pai+1RKhNikZYg+ow84wguaqdt97HJ5BGUpNBPeWC+Qjxw+rZQtDxR6v?=
 =?us-ascii?Q?9j6g57dpndd+VjWPiGqODZfSWa6yEFXGh48OChfFvzZhxmjWmZCGM4dHg06P?=
 =?us-ascii?Q?zSkVkNYeBPgpiOMS/Cje/yrIbvZeS8lNeesFFQBbBXO3YBWCJlgZqup4fZCL?=
 =?us-ascii?Q?C5Cms35LktBIarP/U0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IaJPLl9JLI+m4YV/NMfdx3LTCokw/XR+eo7L+ec1aOQCkISLUT8ShwrFK2c?=
 =?us-ascii?Q?UY+rNAb8AAwnxIBb2dHL5IEJQMRzNQnbcQcR0F1CCpeF0rBklCEqffUuxmXV?=
 =?us-ascii?Q?6DcDzW66f0AmRrE2lYVabdXi2FCg5zS+VfAFI5XWN9JfRTWSvHxDFUYStJIg?=
 =?us-ascii?Q?d453ytZnu3y+ZAXidN2aG9mbwaSWrgX7I+0mFVCXAe5jHH32fPSzlEmrLFFe?=
 =?us-ascii?Q?XZrr/69ioJ44JOlzT88prWyLk1mT3MFy1dkgVbL7tJmM7NtcnlA+I7RxBhXX?=
 =?us-ascii?Q?0ZGqA/mp/doekBc5TbhcOBKPtJRNq5ynRLjpdFAvzIQjEzWc0PtL/KXV3rc4?=
 =?us-ascii?Q?6z00sIEz/4My0u8JsYTPl2ejyGiE1eO/6ip3mynjhw5Oah21Ccn8ieQhi1r/?=
 =?us-ascii?Q?6fpKgkFm+KT4hQbRRUAEquy+yNyiNsNL22usYldxtNDfjeNsEsS2y2vmuXJb?=
 =?us-ascii?Q?w5NKcPRtTXqb+WbydeDJIL0nO6WzxL24EU+ldjirQABPpecJ10h2RnzWJhxn?=
 =?us-ascii?Q?rBZTQim9YJTfx/dOyQ9yT6mrJI0KbKi6zUdrcdcCofgy7PZOyI8ahrnGde6c?=
 =?us-ascii?Q?Tf4tD66N1aB1arWUNoO9wOwPSHCJpaNj7YKVzMz1mYKYGjpidXnWjMsyh5+/?=
 =?us-ascii?Q?s91OlM8/hiBfpQm1C3aesd+BHyGp6Zx9/ib1oBeYB7HJbkaSXuMKkAPQXkYS?=
 =?us-ascii?Q?Rv7mDU3v7mfaIlqhl9rvyoK96nfHNCHl1vn7KHQDvMjuyUX+SAIqDJYwaJBL?=
 =?us-ascii?Q?nxlaaxrhhX0bb1fmLGBu9oSebd9DDYdRRCC8eebKwIfHMbUwL4ZPccDM5Zx5?=
 =?us-ascii?Q?oqXDHGoQ7etz1Wf98ZQHiZVjUhhrXvrcEoREsCXgicPLiP7XrGYmShhcosdU?=
 =?us-ascii?Q?BfcfsYBxExkLscuobMAVUWUGGerDuRe7BnNgQblCoRTkm2rgo5m30F6MA1c3?=
 =?us-ascii?Q?j7+tTxcsZeoebDfDgcJ+l2PyLaYD9v8juKx9mZRF0poaJcfYjJe5Z47DUutz?=
 =?us-ascii?Q?u71xj7J+YPXXffdlWJQdocE8CvG+kngBdsgjMHw5kuv57tFdPQPpIXfhNCRp?=
 =?us-ascii?Q?6jJyFXDKydDeCq/KSovrRXKsy+VP2h0DezkQRrmVuQ2MfOVz+gvyui6y2k32?=
 =?us-ascii?Q?zK5qeXe3gEQ/yJkBGXR+dnBWtRL5jTXkVxmPeub/IMDm57T9jUwLKxc/Cmfn?=
 =?us-ascii?Q?w3NNAIooVkFm82/I29Lne6u8PnQbq0xKbgLJNG1HNQWyObpFyYJIKmr2O97U?=
 =?us-ascii?Q?m8FOFaAYgaGSw2+UANHtWDM8TIbik4kJD9qBIhbMb28xeMtTGKlIJcrjSXDH?=
 =?us-ascii?Q?p3LRQqVNfKhENmeAFQ/0WF3pucLVIhiAn3gT4jnhcYO5hF+uig8d/PnSLkvN?=
 =?us-ascii?Q?/yBmkkDJKoSIQB5GLmDgJy55iMWRJbeG67rjBTfLqAnxdJWE6gL5obzoB0Uu?=
 =?us-ascii?Q?sR6mR1/+swBuwh7B8nzPlTRmntcHZq3LfrJEBhU5rhaWSk2snOf+0abM8mbF?=
 =?us-ascii?Q?KzHsAS1mIwR1kY4uYffJn2HGNkWx57/0iM+9mtmAPvaJ33OTatv0Y/MQYGbA?=
 =?us-ascii?Q?PdUlZcwk2EJqbQPAaAQMtYvmLXXKrXMowudKPXZfQfB/rY75RW4qd9zvn3Nz?=
 =?us-ascii?Q?blgBuabA8TVft1+wqa4I7jCkuZoBEbQRUEgWM3UQgPa2lXeRt8EC/BjPVfEQ?=
 =?us-ascii?Q?vDyH64MCz/X8s4SM851wk2FQVYUjnB8VE920y737oH0DAP3drg9tfYcjS4vN?=
 =?us-ascii?Q?vMYBxtXXijPeVMXyUwEsTK2haLvBt0g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f5143f-bf92-41d1-7766-08de5aad0a94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:27:18.8014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6VoHHwRXXCuQC/ladzNvnrIWOb9Ro3BxkbXbgP/re7eMKtAMe50YgujS6cs2DcvSBCJ9zbDe0+a34qXF+zoMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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

On Wed, Jan 21, 2026 at 01:19:34PM -0800, Niranjana Vishwanathapura wrote:
> From: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
> 
> Use a spin_lock to protect multi-queue priority being concurrently
> updated by multiple set_priority ioctls and protect against
> concurrent read and write to this field. Also, guard against
> compile optimization by using WRITE_ONCE() and READ_ONCE() macros.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 20 ++++++++++++++------
>  3 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7e7e663189e4..66d0e10ee2c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -230,6 +230,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
> +	spin_lock_init(&q->multi_queue.lock);
>  	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index e987d431ce27..ab6980aaa36e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -163,6 +163,8 @@ struct xe_exec_queue {
>  		struct list_head link;
>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>  		enum xe_multi_queue_priority priority;
> +		/** @multi_queue.lock: Lock for @multi_queue.priority access */
> +		spinlock_t lock;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>  		u8 pos;
>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 456f549c16f6..76dd3a204811 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -827,7 +827,9 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  		return;
>  	}
>  
> -	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
> +	spin_lock(&q->multi_queue.lock);
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], READ_ONCE(q->multi_queue.priority));
> +	spin_unlock(&q->multi_queue.lock);

I'd not avoid calling xe_lrc_set_multi_queue_priority under the lock.
This creates a cross component lock dependency chain which here is
harmless but a better practice would be just do the critical read under
the lock.

e.g.,

enum xe_multi_queue_priority read_priority;

scoped_guard(spinlock, &q->multi_queue.lock)
	read_priority = q->multi_queue.priority;

xe_lrc_set_multi_queue_priority(q->lrc[0], read_priority); 

>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>  
>  	WRITE_ONCE(group->sync_pending, true);
> @@ -2181,15 +2183,21 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>  
>  	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
>  
> -	if (q->multi_queue.priority == priority ||
> -	    exec_queue_killed_or_banned_or_wedged(q))

I'd leave exec_queue_killed_or_banned_or_wedged in its own if statement.

> -		return 0;
> -
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>  	if (!msg)
>  		return -ENOMEM;
>  
> -	q->multi_queue.priority = priority;
> +	spin_lock(&q->multi_queue.lock);
> +	if (q->multi_queue.priority == priority ||
> +	    exec_queue_killed_or_banned_or_wedged(q)) {
> +		spin_unlock(&q->multi_queue.lock);
> +		kfree(msg);
> +		return 0;
> +	}
> +
> +	WRITE_ONCE(q->multi_queue.priority, priority);

This should be moved under a lock too.

Plus I'd use scoped guard here for simplier logic.

e.g.

scoped_guard(spinlock, &q->multi_queue.lock) {
	if (q->multi_queue.priority == priority) {
		kfree(msg);
		return 0;
	}
	q->multi_queue.priority = priority;
}

Matt

> +	spin_unlock(&q->multi_queue.lock);
> +
>  	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
>  
>  	return 0;
> -- 
> 2.43.0
> 
