Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C8D5B845
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 23:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D1610E584;
	Mon, 28 Oct 2024 23:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihKld7S9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE97910E584
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 23:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730156765; x=1761692765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kzbeo4u1EnLdHE3P2sZePVSMecaJF141TNqRj1J/fAs=;
 b=ihKld7S9Vp/eFVSQdZvL8wdMNl+lv1v4J22AOgX4s4WKiOv01l1Q+xgY
 PqcR3/b3YaQLtr/vy0UfiJRUZDv3kD9nCBtYwfLDjczE5759bQjbi7xcx
 Orym+Lx6ZHiXMSplGz6kNk1wlYRSTzT6R2Dtym3BgAzQlz9e9qmxCQs55
 R/BZj1uQer8qot4x/UYFnrJVpXip9RBaC8IX1ebTmUCjO7qXNftg5iB5Y
 gAoUbdHgpEA0vB3NrHP4JLYhzJ91tHfKm0hA9jNNjPyE2FPVu4t1rHPEI
 gHhSBoBdhgxAVOFdz6A9jT1HFfCFrA5gf8g9oldPyTDrqfSEAcXXUPiJt g==;
X-CSE-ConnectionGUID: 0E4cegz3TxWzpCN8vUCU9Q==
X-CSE-MsgGUID: qr+FPjfoQBacfCqDZWSFhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29677627"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="29677627"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 16:06:04 -0700
X-CSE-ConnectionGUID: BgyGXVlORxCm0eTl1y1H/A==
X-CSE-MsgGUID: sbS6UJ8/SZ66NJYNhnIY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="85716210"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 16:06:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 16:06:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 16:06:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 16:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhN4vdGrK9aE9CessDudHrvwcjlDZansfS7R37LFby52/hugDeNNlJSYlwLvPI+UV7F/AIaMAeOKYmkuhouYgYlSI5lmK7qlj5biBE4dNHrndkEG9HAXSPmZ137KA3oyXebSg3keIC1ftMdkw5bIXjwRhAtByuDmgMf5KxTMoiDGl0+a4OLKNNE3JodjpnVWjx684P39TSdDX+KivyCxW2oClrH0waAHAhEWlNyxmOcr+JuzXFv8QyeNgceTE4XnHlZtRIy9kg9YsbnqFqCi1wCOSEL+Dv+mBnYVd1ZaJ8ob+wwJ5YxcinKn933zg5LVm3LfJQum+t3u52w8HCNaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md+mu32VNnUgOBUmbbj/Ig3hfWABi+gGTYPCj8RhUxQ=;
 b=Qb3HylVeXgD1+v1GlLmvXyOFyUPwKMlNMKM62EsdGygPbc55+n5+TeUyIfi20vDMOIN4mJn0wQiyAgOTaTRH+lrE4OT254KKAkuXEJEYsUaHmoeSwv/fvTXRS/4XgRFmYhaChunCA+dk2HQRRhFgmL72yKvMzYobVAZAzhdquOzC8/Rahs7kUMFOe3q8vuNmogHQEA6i0cBX+FasO5bCcZC0wj+Ph3ksfIbmu0m+qaSxQgYdpgIerl4cQrSatLZy7TX1fE4tCusEQCS1bQcSrFaApnkROtZFhj8Ln/ggqMpdL084lGlkKZS3E+0EDgaryz8sOzyIBDB9J70R/Cu3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 23:05:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 23:05:59 +0000
Date: Mon, 28 Oct 2024 18:05:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <3navv64x7ubcunf4td5r3w4mvuzobt6omsrpgdvnij3vca4wwx@xu2edq74w3ry>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <ZyAJNgDg6H4V7xAm@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZyAJNgDg6H4V7xAm@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: d9214e1e-94fa-4f38-27d8-08dcf7a51640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8v4ausQyVI8cg5KUNevkXFwCYrU5HYvTmSBRiKJx4T4411Fij3umPYXFKkLJ?=
 =?us-ascii?Q?bCJ5b39HRe+qHnFPEa6zMRBzrW3c68OovQd2RzW277yfQ237d4R3PZlgUooX?=
 =?us-ascii?Q?Nc3VHaWsr2Vyhs/vv44HdG/lmKQaA1cpUVYcNbJtGXluJb9Rb1YGFsxA70R7?=
 =?us-ascii?Q?kAXsxkFwqg9qQkUdo8LOPm++HAv9Sk9QPLh86RP99kTdKLn55HBdh4MfOuKm?=
 =?us-ascii?Q?e8WaUL2nJh2Bu/uyygCb3VvbT5uRumh8nPJOqg63ln+P0FmoMy5MrErXx8Zc?=
 =?us-ascii?Q?cxeH0mt3Wu26Dhtf1NfhBEsvwfOgBwqk3mx/yk27YpNYcvQrTvaZshUzKjkl?=
 =?us-ascii?Q?bN4QNVp8Fw90HtSttKfqvRG0wtCT6zjwb8svMaLh6DhNylFaS4M3l8i1cnUR?=
 =?us-ascii?Q?Y8joIreUWG/2WB4nUn6RXnbs5vArjJ9ZXikpaNBQogCaXaZg2ar9q9Wetu1T?=
 =?us-ascii?Q?JM/nq1XIqHRv6XCoQRQROx0uXnCg/ctvpBXKXIq5OCn+J1svc8kGRfLv5Lyw?=
 =?us-ascii?Q?bayenGfbMa+4YqMY6Jo7itE0jsBCE5xmKz8hP9S5tBvAf4T3eJ2lvAyO+TcZ?=
 =?us-ascii?Q?ZfhdGjm0+WQz8I3oYoqPMJSL+yj68+LSGi7MCmH4dkvwubAWb8j4SgmwJ/Dh?=
 =?us-ascii?Q?75ij96DAOmG8qPzVgaBnMf58h0lZe7TxkXTdSbkU/FzN/paBeOs2GdsP3GXX?=
 =?us-ascii?Q?NwmD+BS+RDBBWTvj8hnS0JIDarh4VGqTMXYEcHbLONC/ZC+KZ58CH04/9hSD?=
 =?us-ascii?Q?kBnYZRHcJZZX6zD/V+xspSbhAynhTwJZnmt6m3jh3/TDvItLIx/5f1eq9Ds6?=
 =?us-ascii?Q?XGDSr8U2HfmX42WMop0oM65/1eZYPcgXhhly1N4ObjJGW5c7Z1jmGhil/zbQ?=
 =?us-ascii?Q?aGOG69lw/ZOwIwgT3uovwDeOj7FxY88tpDhOFdK8nOfHx0KthU2kXE7Jhux/?=
 =?us-ascii?Q?b3wV8KuErtfhjeDkwyYMsgqK2ry5JSYwazHF8lq2dE+FQY0e0JKpmTotr4wV?=
 =?us-ascii?Q?7bB+Hhw+c/NXq6mNtoAbixZZk/es0xvTn85PyZ9rsrn/iuZZXseMtVtWi/ln?=
 =?us-ascii?Q?OBhh+TfentWUIuyZVkOd1AGMl/yZ/UdEH13cRQTQ6a+NgNljos9prgVreRb+?=
 =?us-ascii?Q?za4cgAoiNR9XLOzwsApbhFFfhCEGBZRbX+41ZHw9VXxKd9ks6dsHs0q8dAEb?=
 =?us-ascii?Q?qQkssisUw09W9sgEQUYHjaWoLZ8M/aHWa+em3PZyube9JDmgWa7w7R5Afwcr?=
 =?us-ascii?Q?lHljO/p+C1D5fStVaFOo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8vb9O0QMsNSoq4d7s1/dZZw3veY9e/RzDNtFSkC43GYJ3UrUGBFCs8Hlr8tm?=
 =?us-ascii?Q?rziV8hrvpXSDXiArQ12CmxABqqn+sCDDcfTubF95TIzYtfEGJf7L+R3h6Y3H?=
 =?us-ascii?Q?LHt4FVLID+EPqH0Mf8MJTMFPXFm4oS2l1PJfoonuR/2ChGMNbo9KmZILdFKv?=
 =?us-ascii?Q?KH6HHUQ8V8X+YcPIYpuPtTwr1HlGqn3bdz2wWNaTHBQLVQL0wkgirtN3K2jH?=
 =?us-ascii?Q?DusqKbjQrDF4vBqk4GSIlncTQn0XfUXp9nInErzlIVxVuFo1igVoUTIOZnXz?=
 =?us-ascii?Q?W4LvxCssJojgiEoB/LVV3M/lC6eBy28Nw1SkPYzlYopzCfVNaPVVyquEKjO6?=
 =?us-ascii?Q?PtX7ZJWbne/RVKLQSliaWSzlHQt6Y07vOe4J1h2LGBoDuQR/UeSwCFv2j9aM?=
 =?us-ascii?Q?oM7RZmpznuUSXVApueGfgjeQyAx/4eCPL/uTgnqtiu42jMRoQkC9M94ZWeCw?=
 =?us-ascii?Q?/CCTQ88HiXueKOOdekLCPxhDhwrx5BxGtFFPWvFje4XwwhSjSpD1kXGMVqlH?=
 =?us-ascii?Q?MVpF6Oh2yBEig0wG6uNv/XUjczFD3Ao0K0IZfqeXpRO47nYWadnHnnkWHZpR?=
 =?us-ascii?Q?CQuJ3pxBc1vuLPAfzUZZW2pkPiNlBCxYyMdBUtsb1wvI9BMG18hmLkEqFDZs?=
 =?us-ascii?Q?2CjDH90mb6FSspcbLaeE90jR44I3huX/saGO6Lo/qLczu0wsAFJsVq8EnmVj?=
 =?us-ascii?Q?J0ACE8uK889AsdQFotzV02vxYWglf4RLbZG3radfa/NDUUsHSSDCslympJr0?=
 =?us-ascii?Q?lCwFhUgAaJdzzOLDOkD8jbxZmopdEyb3n1PmTNQcvA8mfmaRR8DVgUqWY6rv?=
 =?us-ascii?Q?/5vvom2JWPLbB1MLuOM+joYiO8QL2jo4FPfTnDPOta9pj8W4pXc0Bo1fK2Ur?=
 =?us-ascii?Q?Dowk9vcnJu6mA7of7o7bNBPZ5rsworq3YZxESTWB4k1eRNXaTONdQ/paetsG?=
 =?us-ascii?Q?tKZr+WzNEoJPlyqWXLIeY4dzm3tujbqfIcPn/7vhhZfmjXY0goOgqS6NuT3W?=
 =?us-ascii?Q?ccF9wmaXUfKWitcVNj+QjTITsCBSdt152Nzp63jMc8DkawwmyuVyse3t18P/?=
 =?us-ascii?Q?EJtOgVlVXRmuuAm7gcjneAW0/taU11GjDzIC84GCsjSwQlwEe1oUj6nDnzCn?=
 =?us-ascii?Q?jXMliQ4BL0tQUpbWwuzQdBVDLcayCb3RDtHKho2t3Sc3ABxnPafNCE15Q5CN?=
 =?us-ascii?Q?ZZTS14BPB7XO5Eb9GiWMWt6sE85nzYkyDfmNMK5mnaevumhgck8//IKOkTVz?=
 =?us-ascii?Q?HATJNgnNfsmklLbXE+KdQeHP0ubesAOIbiFn2Uu75aMWoc0Cil/dXgKTXfp6?=
 =?us-ascii?Q?7QhvxMcWxAJcwfiQK3d91PtjaVKVp5gh3mBspXsFhsi9Qnc1MpNmhzJzVTSo?=
 =?us-ascii?Q?XBZeSAlepalzHYeGx2xqxLM9gJ8CrjhGCPh8l7Q1IXXTvE4CFtnaiScR3VYx?=
 =?us-ascii?Q?fSrSZlEBsLuADs8VTYHg5YKc26j6U8PDbAz6o2Slz8ZqlsDLsaq3EchunTQ+?=
 =?us-ascii?Q?jwYRIbWVke+JTe0ptS7xbcgRm+UFchc0AfGujvtuhXfeOQBLSlibha0rGp/x?=
 =?us-ascii?Q?I/p5AJqEWuiK+1+QWzVmAe7nz382kqSnRD44RTM7mY5Ko5Lfi5+teTLKWJYL?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9214e1e-94fa-4f38-27d8-08dcf7a51640
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 23:05:59.6576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGV7r36jiTnUaRlb3MX+f0QF5t6ikunDKWgxYJKnrbrhxDmQVBWsQeLIiKjz5BCSPtZbU7+UNxb/tu2xvFXsNTn8QZM5JZaTY9Kbg73TF5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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

On Mon, Oct 28, 2024 at 09:59:18PM +0000, Matthew Brost wrote:
>On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
>> On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
>> > When the exec queue is destroyed, there's a race between a query to the
>> > fdinfo and the exec queue value being updated: after the destroy ioctl,
>> > if the fdinfo is queried before a call to guc_exec_queue_free_job(),
>> > the wrong utilization is reported: it's not accumulated on the query
>> > since the queue was removed from the array, and the value wasn't updated
>> > yet by the free_job().
>> >
>> > Explicitly accumulate the engine utilization so the right value is
>> > visible after the ioctl return.
>> >
>> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
>> > 1 file changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > index d098d2dd1b2d..b15ca84b2422 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > @@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> >
>> > 	xe_exec_queue_kill(q);
>> >
>> > +	/*
>> > +	 * After killing and destroying the exec queue, make sure userspace has
>> > +	 * an updated view of the run ticks, regardless if this was the last
>> > +	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
>> > +	 * query to fdinfo after this returns could not account for this load.
>> > +	 */
>> > +	xe_exec_queue_update_run_ticks(q);
>> > +
>>
>> At this point we may/may-not have the updated LRC timestamp.
>>
>> fwiu, xe_exec_queue_kill() is an async call. It will queue a work that will
>> disable guc scheduling on the context. Once guc notifies KMD that scheduling
>> is disabled on this context, KMD knows for sure that the context has
>> switched out and the lrc timestamp is updated for this context. It may work
>> well for contexts that switch frequently and may not work for contexts that
>> seldom switch or never destroy their exec queue.
>>
>> I still believe calling it from job free is the right thing to do. As for
>> the ~120 Hz updates, these are just memory updates, so not sure if it's a

these are io accesses. Buffer is potentially in vram so it's not just
memory updates.

>> huge performance impact.
>>
>
>I agree with Umesh here - unsure why it is a big deal to update the
>busyness in free_job.
>
>Also the timestamp counters can wrap and if they are sampled frequently
>enough a wrap will be missed.

I don't think we have any use case in which userspace is sampling once
every 200sec. Use case here is rather top-like apps that are doing it
once per second or so. Worst case scenario if we have a real use case is
we'd update it at 1/60 Hz rather than doing it at 120Hz per client.

I still have memories of these small but frequent io traffic causing
problems. See commit 59bcdb564b3b ("drm/i915/guc: Don't update engine busyness
stats too frequently")... internal iterations of that overlapped with my
conversion to iosys_map which were initially pointed as culprit, if my
memory serves well. I don't remember how frequent we were talking about
on gt park/unpark though. Maybe Alan does, Cc'ing him.

Lucas De Marchi

>
>Matt
>
>> If the ftrace is getting filed up, we could throttle that.
>>
>> Thanks,
>> Umesh
>>
>> > 	trace_xe_exec_queue_close(q);
>> > 	xe_exec_queue_put(q);
>> >
>> > --
>> > 2.47.0
>> >
