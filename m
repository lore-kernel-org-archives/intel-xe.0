Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1263ED66B85
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 21:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429810E42B;
	Wed, 17 Dec 2025 21:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLSM7O6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6120C10E42B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 21:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766005504; x=1797541504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h1qHTXrahhwaz5oizMgNClwvOo+JLtvkhX11+278hd8=;
 b=BLSM7O6n+KWOvbygaDE/xCVG2TCXQ1BPNE8C5aUcyC3KaPsEh6nr2yEc
 IvUcAq9UqXvdKVkYZSQw7ZXFtoPCB1FtJymy4z+NpjqAE8ELTvvvDEOjn
 qJjotAUxOziEEZwcPPIETeH6P/1zi/6uNfhjvJkhkrJppbJElfmQsR+OZ
 fPNTSZAnK5ypg/swbPe3kQwfkoN0R3RQmt5H7CpeTP3+nW1/DHbDkVfml
 AWDMS22NHrh80p85TeD91jOVCtNBg9eI5BGFwChcrBAQtWfPyTgwhKqa3
 ENcRAPe1048r4A7BESbJ0Be1NNz3BZcxwr0mdWJF3Az8KXl58zAy6BLPz w==;
X-CSE-ConnectionGUID: wQkDWPaJQ62Lo5y4JmiSgg==
X-CSE-MsgGUID: 7mXl2zy4Rc6HAnL79pq75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67149284"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67149284"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 13:05:04 -0800
X-CSE-ConnectionGUID: zV+1p2aESlGOEK7A98MMlw==
X-CSE-MsgGUID: z18firsoT22BC3VBvETPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="197665663"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 13:05:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 13:05:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 13:05:03 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 13:05:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCEtWmDL4KGk9KNyn9zdHXSCO5eP6K3Vql/ag/n+NpkukLzjaXTjGxTHZVro2HASU3jHE6dW4JAcFLlClClBiPmY4oZpmT5qw9EFZ11ACh+mmtuKphZuhKdZSMCO0Hx/UX4wOb4TicuFyyRjKLzbLm+yR3z00CPoagIbVHSIp1jo7nbGQFrtJbAz8Ipx5nj0KYH4mwlTpzNU2mEqBY7Wng9uELht/YwEWjJVkeCGwcJUtBfBDpNrIbWxnvQTu3Ut8ruitOR8EHDzsbCnqAVoyR4Tikx7c38icC7RRdEGEVLh2N4ymHR+PLqGQ+zkkPGfX92EmvK6VGVQVD40TW8dtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUnuAHxxQS4KagqYr9fUK643aTbx9AfHUb85Wi9kUrc=;
 b=twt5+ipvFdFmb70lw9ncKqbOLCIowA+p/mzmiNFi012YvfXcdtKCtdO+JMURsWg0qEd0mjwzElU74ZsrRPoJO6Sj6GetSsypsdU3jcKM5iQ8wcqDR4gE7XFIj/JBMTTfB7Z1sykN56hn/b5eT4ZQ8HokHad3z7g/UUqN3hXXrMw+NVMIzeG4WSJ8eGq/DnODOVTnT9qcgYN4CSAsYYAOrkNIEtN0ys6PlGStrBoLdDV/j1WY04dXZa0JjBNg50+YaTsysYNS+T546uKA1dnuFr0j8mzr7GTpo2kwL+U6c8zrBTaPuT62C+9IBEzlMdWt0FFt4NkB38wmON4x3walfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 21:05:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 21:05:01 +0000
Date: Wed, 17 Dec 2025 13:04:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Tapani =?iso-8859-1?Q?P=E4lli?= <tapani.palli@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
Message-ID: <aUMa+itbatz90kRY@lstrano-desk.jf.intel.com>
References: <6f9d860f-f95c-4b3b-9d5c-1a0c295bcdd6@intel.com>
 <20251217132412.435755-1-tapani.palli@intel.com>
 <c4776b5a-3396-4c0a-89c5-7a8b21e93028@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4776b5a-3396-4c0a-89c5-7a8b21e93028@intel.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cce2bbc-341c-487c-5e30-08de3daff137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?In6RcddD07jxQ+pn+FdEmqVLz6ffSSpS5KZl5yv0e5RXzowVGPtO+7hpbs?=
 =?iso-8859-1?Q?a9Mv1mWWnajxstw5rVAsWygHOhyuaSqfy2i6elZLZv8fnOWTvVVq93yIf8?=
 =?iso-8859-1?Q?oDHDZY60UQlsMlQ4ZVZR8msjRfSZcIlF6gHoNPctvPelcwCmR7v5bpkjRW?=
 =?iso-8859-1?Q?10Bm36azNfSdoqBHoQ5MLb/NQcv4zUyLEj3Ie/isRHc/8hlXcLqCiydi5e?=
 =?iso-8859-1?Q?JGFksIvz8kmuKyV8dEX/Kzrk2Ac5Hfcb8CiBUW/G97LVjWaQl8QcogqVZS?=
 =?iso-8859-1?Q?LtrgHqNHA83uIVMJf9/k7esWpks1HVOnV+tjDtEIHt+viSOrcDH4IwiidL?=
 =?iso-8859-1?Q?2GOENJy4eN3Rc+0nqR0TvleN7MVCccmpI9Gw0/BEBA4mWQuLIhmLrhvv41?=
 =?iso-8859-1?Q?tqLkZCi5zIFWXYr/tuzHuMIC9RJanFbe85yY96NufiGT2eoCtSAb/kdVmK?=
 =?iso-8859-1?Q?KVBAYDY+ehfi+UG5PRmcdLDgbopTG6sVW0KSUcStBIaRvdjLuD6TBio+QW?=
 =?iso-8859-1?Q?WhG2PgszyLktXot5Ytd/g7FASCuS4sVt+7+nTk3k+tvB4ZV4uuJgViW6dq?=
 =?iso-8859-1?Q?oc5MYiUCuvzSmK+Z4b4ZsSQxj/cVUgcTwhMnKv+AZcsFoGghGKwCQa/5fp?=
 =?iso-8859-1?Q?aTuu7IFGd5gOlnyrqEhF0+QHhdtUP39Q74z4qH8lRzptJLWb5aDg0woRAr?=
 =?iso-8859-1?Q?WFXVy+ipiFvEWkMou57nyz4qBBiFUwPfvRUltDMGF0it4EEKZExlUmecU/?=
 =?iso-8859-1?Q?c3yIEs6lcdCPmc9KqhcDMJAhgqUoD6c1Mgijhmd2kna10JWisNAkxrkrj8?=
 =?iso-8859-1?Q?Boq/exPX9KxwxcRL7mhcDqWGpfx2LREQhx7/o9Wn8YX9sPhOENADPLpzHD?=
 =?iso-8859-1?Q?FisIRib80o5fDMcs+bYtvLGIdoXriBHmOsgLtCf5yx6VrV8bP4tqjhwBGi?=
 =?iso-8859-1?Q?XidsIPcW9z1xqZaSBdH/5VT5roPOyKyF18NHDZVLHJ/IN1Wf/QPA6WDIKQ?=
 =?iso-8859-1?Q?i6nZMmQjpA6+Zzqhx8P03JRQ0CVzfR4YGP5qxjUYH6WLQuIDA5uKYquKpH?=
 =?iso-8859-1?Q?jEDPTAC8A0bP8lqxQEdyR8iUmkfm/2DnFAkUDWlkGiRJ/GA3UQwgP15T0s?=
 =?iso-8859-1?Q?RBnj6KyTo5FIE+uRtryqdhMsCkb6Wz58AC0ecInRYnA/bdNwJlZAqbN0YE?=
 =?iso-8859-1?Q?9uIIcb1QJTuLBwyMt8VRPpibVUBVbbsqp70ak8KfeGpI1ckkieL5SGgLcu?=
 =?iso-8859-1?Q?SSV4aPWdkZm9Uhh+u6KaEdMRmkIHwQ6oazMT1S7wvLGOhkYYDWkarmJp96?=
 =?iso-8859-1?Q?eHV+mrqzHzZm1FWz5Uzdrh+ZUFBhtmTWUys5h/6UStxu9Cj55W451vD0oF?=
 =?iso-8859-1?Q?YOdW1+2ELYmMeyxipG8CAgghf6yZV8N43Sbcg8epZF/FxqExGmSkgM2TnC?=
 =?iso-8859-1?Q?HlJxJBCRTqDcqmztoie+38aY/vNKnuuqGZGOYDdytdoqfeip8eCQwLrQHH?=
 =?iso-8859-1?Q?uGGIW+iJuCgYvq7oFw81iY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nEE0rlcnThCn1b4MTJ4HlXS4dA0TbRxpxZ41vWVMkvjZOk0JQ+9MxF56v4?=
 =?iso-8859-1?Q?6bGzn7+bi0vZ8OKTs4qWAKVzIjJIo6ou9kwPIfeGBx2uIveK7gkF5MVO/e?=
 =?iso-8859-1?Q?4s2PE5xYTgZn7AB0INUl6RSbWNn4D7OC1L5h40yiokIWzr+1pEFjUrr+Rl?=
 =?iso-8859-1?Q?NxEdbMIn9b15eFDo4zKK4EX+vjqSP5JqWo5PwJINvAWl+YGzACgdfUwTSJ?=
 =?iso-8859-1?Q?KHafZ33dM0Uw7omp/cW/gLqJ3ygf/m0vD1/R4fGa0WBjs6BZkarGkrqGTQ?=
 =?iso-8859-1?Q?hampHObadz0tH4SMCQB8SBhFCd6e58NQvXPV4b3BVJx3Pdj30GvUJBVxg0?=
 =?iso-8859-1?Q?+S4Sle7cohGDqTFl/AM9S4OWG7hSB/+5HcmzeEqOBiRrvgJV6nYkuQlDVJ?=
 =?iso-8859-1?Q?PWU61cUfT5c0Onp6jWki2zvpyCB7joENEcSbYaKo1XHjNIcM+6eUrXz9/+?=
 =?iso-8859-1?Q?g4XqbfqvbqZuGjvIRnHZX1k7s+Uc2wSxRR5GByNWBg9vnyF4IO7uiuaE/B?=
 =?iso-8859-1?Q?jiH93S9F7LEcSbzCukkkj+3nLO8+RKC+UOs+E7W4sBP+XcPb7oL5ROIKsX?=
 =?iso-8859-1?Q?cdcelApqZBWG9kU/s24rBWFknmah75teO1fSxp38GkeQX8jqF/FVqpMA3z?=
 =?iso-8859-1?Q?rkhHBwsPjhm4HNc719sXCurhDitDlBpV47V9UkZJ9eY8OthJSLBCmnX2On?=
 =?iso-8859-1?Q?Glx0ZcdYhEp+9UGHaO1Lh0aZ7aQ+Z4ud5InDDlniMg3ZvH8po2gHAeTvCJ?=
 =?iso-8859-1?Q?M1i3FL0JPCl7MIKiJlIoqNEMGPg5PvcbqYI8x7K4x9oMmZZ19gU0wTUhpS?=
 =?iso-8859-1?Q?JJdEysKkPsJs+gcVfSA0G9ascTnZAqv0IadZS7FBqM/N6xOYcEOoB1SPOS?=
 =?iso-8859-1?Q?w7H5F13F30R5h8HTalZvqjCRVO4Y5fRkTwd4lEO++O4AVYkIaHWkaBIUfq?=
 =?iso-8859-1?Q?obYEgref5YSYuFsDOYGU8RF76afVbXgplPv0Gc1Qg08r9n7DVYzpT3Zc5K?=
 =?iso-8859-1?Q?Mzi2cInItkJl/QMihL+jVjAlrSkPkj7mQGujahRgw+tlKy14io/Ol98H1F?=
 =?iso-8859-1?Q?wgaSsxniQX+h1X9cs4XctNAEmJkuXBUKOWwtqifs5XuMO+amnO9RANLZvr?=
 =?iso-8859-1?Q?puwxgrcKeKEKRffw7vl0VaU4WeJFdfyhgPXQgfJd/zzif1xXXVWXNN/brG?=
 =?iso-8859-1?Q?JHQMCzP1g8wuhS/UuwVUVlDWiiocR+komYPpcxHaDSBWT0VIRLlatuCCZU?=
 =?iso-8859-1?Q?OWRMitxJSvMbFk9wzbmdVS9jEhVDFPxBlb3SYsgrWt8uOYmvCTiZm+G3i9?=
 =?iso-8859-1?Q?YQndyr3PSDaviqc0m2ez9ZQYsp95M0C2fpwPBfQDdZVO3/3K4Lbbj/0/k5?=
 =?iso-8859-1?Q?+7wVdYsEs2dNGJ7+pldpKlSPJuM5n92kOcXqyFoGRJTW7sqGhsvtz/jQeF?=
 =?iso-8859-1?Q?o3mX8aYn2AzrfxydX/u8x7VajQtHmdkpKOLp6nOWGKCK/jdfQr2F9kHJHi?=
 =?iso-8859-1?Q?GreGUi0xzquFw5lloAmJX5CWIcGkrJdsiwYk8oC2F0Nw6Yw0dc1EuiDcrM?=
 =?iso-8859-1?Q?YKWO48mEMA1/+S+AqjyPo1S8pTkdXNGdDAMVZFQccHpu9NcobjLzfjt58P?=
 =?iso-8859-1?Q?SD2t76u92Km4Mhwax1PZOyx/YbQxZrdfuQYGeEF18frxm3+cRFqvniLA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cce2bbc-341c-487c-5e30-08de3daff137
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 21:05:01.0771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THLuSe1Gm9hGS3mj9UlLGtcEU73jonWPrIKEgPPf4CJF9wjzOpiMnB/aEGqh0eoZ96pQ8IBWhwszr29aadsVog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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

On Wed, Dec 17, 2025 at 02:56:44PM +0000, Matthew Auld wrote:
> On 17/12/2025 13:24, Tapani Pälli wrote:
> > Helper function xe_sync_needs_wait expects sync->fence when accessing
> > flags, patch makes sure we call only when sync->fence exists.
> > 
> > v2: move null checking to xe_sync_needs_wait and make
> >      xe_sync_entry_wait utilize this helper (Matthew Auld)
> > v3: further simplify code (Matthew Auld)
> > 
> > Fixes NULL pointer dereference seen with Vulkan workloads:
> > 
> > [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> > 
> > Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
> > Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
> 
> To me this looks reasonable, but let's wait for Matt B and get his opinion
> here also, since he was the original author.
> 

It took me a minute to figure this one out,
DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ can set the sync->fence to NULL if the
timeline point is signaled.

So yes, this looks correct.

Thanks for the fix!

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Going to push this one now.

> Also thanks a lot for reporting, and fixing the issue,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   drivers/gpu/drm/xe/xe_sync.c | 10 ++++------
> >   1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index ee1344a880b9..c8fdcdbd6ae7 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -238,10 +238,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
> >    */
> >   int xe_sync_entry_wait(struct xe_sync_entry *sync)
> >   {
> > -	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > -		return 0;
> > -
> > -	return dma_fence_wait(sync->fence, true);
> > +	return xe_sync_needs_wait(sync) ?
> > +		dma_fence_wait(sync->fence, true) : 0;
> >   }
> >   /**
> > @@ -252,8 +250,8 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
> >    */
> >   bool xe_sync_needs_wait(struct xe_sync_entry *sync)
> >   {
> > -	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
> > -		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
> > +	return sync->fence &&
> > +	       !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
> >   }
> >   void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> 
