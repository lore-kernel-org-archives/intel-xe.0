Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D70CD042D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 01:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE5B10E455;
	Tue,  6 Jan 2026 01:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3hNA9ye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCD510E056
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 01:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767664512; x=1799200512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UsOS/4uNsdkUljmgitYMY2Neb6kqf7Ta/3/lXkxTs/I=;
 b=l3hNA9yeOfaXRQFLpybAPQlKjroeN/cKucXWCFNzVVtc+i/Lc2KcmHSA
 Xtwp2I4WvY3bNJ9JtJ97YqkpRhsEjZqC/Av0qMu39e6M+od0mZZFxFULr
 i29uvEsU7kfh9AAUcW29hvOXdrV775HQHkkh9Q8Daw1ZUmisNNp0kTiVD
 MFvZ3zSuigBVtjeSxAauMtnl8dDH4eTPIxRAMMBDtJWnNEJr8Rp+44AQb
 5NmmIBDJdaLJZz5/NahqkGDYYnhcHZGezI0TjFt6GWif6e66icFAJ6yGH
 IHaMo/CvN9QOzOFUWyHoI6x6dxrdnHyo+joN5F1HD2rYzRCctPEHQ+tjh g==;
X-CSE-ConnectionGUID: PcjuNAoTS82sEczkmBTE6A==
X-CSE-MsgGUID: pSbpjmRSQLia2yPsk9MH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71612339"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="71612339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:55:11 -0800
X-CSE-ConnectionGUID: gTYeMn2aT8KZklzA35uV4w==
X-CSE-MsgGUID: yyB8pPf8TE2Abma4bT2wig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207089983"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:55:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 17:55:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 17:55:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 17:55:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDjmYZsR0JhVjo0X1fI1QZwO0QVyXePhcY50SwYYDO3TAD/D3hOexkxaGUm/1uy1u59uf+jYeU0/7M46oM6x7G0oDfnOUovHbe3/jJLFkFzTCPvbNOVJIHKLfQckKDRZrMOTMqAZ/ibatH6ZWuFJptXm3ccjMoVj7xqyOtS7YonTTu0f61meJEH/ts7KjZliPllt2o3uqvKVb7hqmZvBoOeDyiTo+M60X96sEOm73iU1moN28KceiWZb7wdIfxT7HKd032VfiK+2qobeWvr2jshU2TNnJmgSxCWPAZJxZNp4D3Eo+ijQ5477t+uUMHq/41GspSQk5T0plqMXcRukew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eq0ChaxXoH2+WYLIZILB/e/L8Gi87gyJGkcLpeND4OU=;
 b=Ta0fs4ZwfuqopaEBFUT4w++BoP+WZDd056CxYNlQxnuElxgs2h+rwdkueLdixTRPgM4IpNRiyEDH9ARvgQKN0/bFeNjEG40Iwie+RqT7SxyPgrAXPR5WP2AX2OwqDYV1IK9dQvtO6tG40vZO/ituM/S1xqymhjeb33UhbvW8bEwVXLoAo2FnwbN05yzTgxhnb3gDgETIoq9ipRT2l9nVKVEPaKa3TT9XvwnKQJVJrEyoupAM66o+6GhCGkDnNbMEu2JzrxkBZ6ZiNp7QsDnjyt9ShO+azYOsiHVY+nC32bs6QIb7w+HAylu5WqxMZH+KIgZXfI1h9WBYZk7nSuWY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 01:55:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 01:55:01 +0000
Date: Mon, 5 Jan 2026 17:54:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/doc: Remove KEEP_ACTIVE feature
Message-ID: <aVxrc1dM5JZvXIPb@lstrano-desk.jf.intel.com>
References: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
 <20260106012920.2850975-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106012920.2850975-6-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d8820f-c326-4765-58fc-08de4cc69aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iDdPNWkDG5RkUjkOpZS6NkbIrh0Aa6BC9+KDeyuoAaCkcg0TzOAc+Ihx87BP?=
 =?us-ascii?Q?ZbIucmzhy/I/B6tINi3uQwkxd11bzlrY0RHjV7B+viswrzkZuJTo+LUOBE4b?=
 =?us-ascii?Q?zqhQScwTEdbA/AbKPRpT9OE/AfnajgE7c6Yr2HHVOF40PvRK2VKgY9FaRcT4?=
 =?us-ascii?Q?y+ECBpo4l5iJL+TdU2pXUevIZN/P9Xc3sTwnjP3Mbi8cIQRhLEB9JMrAr2DZ?=
 =?us-ascii?Q?jM+NGpt8kd6ZZRQJOpdSgYnHDIRJF3LCSIjs7bAlSj0WsYe7nIq7nwFspb+G?=
 =?us-ascii?Q?9aXA8jOv614qNAxabp6Cq83TB8ahsGIGbGdwB71Em2segcKV4f9vy5LRoFVa?=
 =?us-ascii?Q?qEGb2njX1Sz2l7bcSXDgrSA4DdogYlBmg6FPe8VLKt/8Q9dCHNAQgj3o29pt?=
 =?us-ascii?Q?tH3THZjycNuqKb5E7oerlL0grMMtzmNFkdH2zx6VjkjhBwGQBYG1knibuNip?=
 =?us-ascii?Q?U4tsY3HwDEU+9cq+YteOHQvhjWRaQGqZAShNQTTQePKx1TOs5Vxfd0jkpMTj?=
 =?us-ascii?Q?HN2s1wVy/G9eiPv/zqNM7TcGluDB+AAyPkrO9EhhggBJJG9snW3+TFVGCN3a?=
 =?us-ascii?Q?kT9eV9IQutcLxH629V6gxMRXMoFOo/9PuWDHI+un0NwfHXlMigpGktEBEyBe?=
 =?us-ascii?Q?hxTgduJED4d+gLsz4/htHtqjE5Y56IJJMRY0hSchfc1hzOC5LaghV9+JQ4aL?=
 =?us-ascii?Q?uaT6s2QV0U69MzXOzZ2GN1vY15+MUjFn3hmGIfKL9e+pyX9wowa8DNxVAMIi?=
 =?us-ascii?Q?H5PL4A704KNmDEHy5neblRR7OqUXuSbrCgE0ekRKZXPh9t0b1x13SDjz/S5r?=
 =?us-ascii?Q?Sa6qqq5EUa/xVHqxu90ZBOYs/nb2Mmm+iizS3xhMhTNTlI9JF2IZXD0oW++8?=
 =?us-ascii?Q?ORmOENmN/EeQM8Oub3GHGntY1Ca3XQ0w8Nppx6Nd/0Q1gYgBfSJ+4qAtwA/G?=
 =?us-ascii?Q?BtTQTCodd8aXWajcedGZwY89umDuT6Kkq5HGDPNl96XBVx9IKMehe1zEZyB4?=
 =?us-ascii?Q?MrUrnye25GtTOj4OETt6GqWAFviTD2IwoM+eLGhDx5bcDi6/sZrkF8jZgjgm?=
 =?us-ascii?Q?/2Oyi9mZcbGfzBQ/jZt3Vp2wR2xvD63Fjd19+hSgIClDSZgZLM1IPzSVF4UR?=
 =?us-ascii?Q?NTfBSQd73xvnPqjyM68QSQXyLOkoTxCZ+IsFDWjd7axBFTe+9yl42+BUFjqL?=
 =?us-ascii?Q?JF0AezBdhIEJV0tLrOhSG4w3XvnL84DcjIFqy75pjnbmeg9lAVKep5HX2c+U?=
 =?us-ascii?Q?E3Aqkb8FIizPIcVXREQdnOrPGdrWzl+nXJUashlkOpKVupw4Ejw081biklL2?=
 =?us-ascii?Q?ttBpToqp9p9ezGXmevqwtjxFQVrNfZ2tnY/XWqC6wqcOr3nYYk/SmOZlbP9Q?=
 =?us-ascii?Q?jdgYKc3CU8rxFtHy0nCxI/ubWS3aA7GBsUt16e/YCJTH8IuJrPQ6HLahrFpx?=
 =?us-ascii?Q?g+jHC5DHGlJJDWTUfpnixC3+g0HHEIN6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6fbylkNCVFV4IH5xO2le4+O/rjwvZ/2eZCpAmLAboMisKPyXV0HnTgW/GSI?=
 =?us-ascii?Q?IDW3Pa3cDXtWS/fWnrRE476147itUH0AjHpxOmcig2yRk8SuZYdRzsK+wo9J?=
 =?us-ascii?Q?o5gkHg9jiBZuYIYclmOnmngGZ9xbNzVQV7AFyUncrBsLQTXjNb1EWI4+2KBz?=
 =?us-ascii?Q?ZxLeVQG2VStmUojnCSGctwAmMTOVGvvXpJ8jds0fbhKrzNN5axe5Py5nBA7v?=
 =?us-ascii?Q?Zq9nytlkgXHhHN0QSUq7X6axiuBMkUp9XHjOoL2KCRYMQvD6m/D3+XMODoaP?=
 =?us-ascii?Q?um6oAY6pWvYPeeRFxT3dK+s1RRNEYQH6dS4Lo1m46A3dCSvoalKiyPnZtvUf?=
 =?us-ascii?Q?BUpDlVJF4TRO5uxjorivOjliiceuXeAVnfWf13yJcTeIFS+8Yj1PyvMGd+0y?=
 =?us-ascii?Q?SHSQnxUZk9iySyTbc5i2T4JK76o7t8aMORd/OY4/C5Z9TZvtcNuM7vbH6EPk?=
 =?us-ascii?Q?++hzzCNmEoN0ZTinJzKu/WN0KCMSC9sWmtaAG4v1eNg11+tLl1CC5vX5+gy2?=
 =?us-ascii?Q?aGLEdIivq3vPswQz4hpzx9cK6OfiNKXGa/x9hTh4brHDbbeCMsHhAO9Zinvv?=
 =?us-ascii?Q?aGcn8l29mSaaakA3Fz2DuZvozlW/Y/1GCfWbuuTpay5CbHmTQlCMrAARPRFj?=
 =?us-ascii?Q?3Nbq2ZtANVNY5GkNRfbTe+FDUtf/gGq7tfT506ROjYNWNPMedxyvzReBBykg?=
 =?us-ascii?Q?1ke9T/zom7CACv5bbFNOwQmRygjnTnYoCwnP98uw5czRtPRGDaHKlbMDeYyh?=
 =?us-ascii?Q?BEMfu6kUbZdiC/xPlsAV6E3G2uI3NdckUdRkyfjqxCZWrDNg8cT4ApLxYKkx?=
 =?us-ascii?Q?5rGYuv2YAfnYNBdH8o1QIrVQZkfx66gYBeD+7Bcwc53xm7HuGvzGHbZfioSB?=
 =?us-ascii?Q?dbvz63QdNNVBVzM140gT2NbgPBf472lqVSASPfU8b/KHFEMl+vW6nSRsezop?=
 =?us-ascii?Q?iFqNC0q4i520u5HQJqCq86vLySAhir1V41iAPda4tFFyBa1QJ/GpWKySJIeH?=
 =?us-ascii?Q?xkQhnLPOVAgSktw0auXb+9KuFRF5OCV1PzQlFLCJGEl5Wtl3tKx962FYePvd?=
 =?us-ascii?Q?AygTrM1h5OfHYEl2HYNI1iPVaHjWsIp3BUd8PvE065uFovZGzZAHmd0OJpf6?=
 =?us-ascii?Q?R305I7BtpHobZEPYwUCpmBKoJBjPGlmfOiHtoaG0v1rCfzp+enewxBlo7/lI?=
 =?us-ascii?Q?tjhclIpIJhkaZHTA7I980EK9+HGj8NeN/zIYxw1EkfYc5mAkPqXpD9Rz1vFu?=
 =?us-ascii?Q?kSOnT8E1ND2bE1F6brKTRttwwwB8g9cEMfqs5PY43gcz4ayd9k6BFbj/lWgy?=
 =?us-ascii?Q?/2up5YQd8SNJdwStlxVmwbLg6ha27RzjWeLFA7KHjWihkXP5Di/HGevfd5pr?=
 =?us-ascii?Q?woM1QrAdqrP0pV/M7+ovsTzwxlE+PM8xoMzy2PZ0NTUvlGKujGrQj1hK1tH7?=
 =?us-ascii?Q?4w0TfawTTms7f0xtL3QjkzEhM6hWmyc4U+fJVpD6oRzU5Vf3xi1573NpfwAo?=
 =?us-ascii?Q?5zR/2JIpWGUSGUdxNRKClTpVa4ZNL1LFvzSYQqnNDgnkt7KA2/IzSDd0zh5+?=
 =?us-ascii?Q?113Md/+xg9wfZiczRwtZICJrH8mxuj+VBW5qm3sLkBD0wknuouipLkhbfKBe?=
 =?us-ascii?Q?K+PU6N6VB4/fjQwXRNRWCo9Vtz+RUgyFu5QQcf927ySLydoW1a1Rbrxrlgrl?=
 =?us-ascii?Q?xZ3h+X2fHj45z1Egn1pnzs11Jy0QjVdf+eOXMnL6yAEoRokYMeIsN66pT8rY?=
 =?us-ascii?Q?jtWUN5fW9Az8Nhs97WUvoVISz3WBheE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d8820f-c326-4765-58fc-08de4cc69aa2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 01:55:01.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmlLV4z/zZfN3/IEUFvnBSv2+VNI+CUryQwERyTF/BNBU5KdCsMUSVeuCKQd33KIj1/sOPP/YYyADeHsjzYGKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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

On Mon, Jan 05, 2026 at 05:29:16PM -0800, Niranjana Vishwanathapura wrote:
> The KEEP_ACTIVE feature is being reverted, update documentation.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 529a40ca4002..b5737563ee14 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -84,9 +84,8 @@
>   * group is destroyed. The secondary queues hold a reference to the primary
>   * queue thus preventing the group from being destroyed when user destroys
>   * the primary queue. Once the primary queue is destroyed, secondary queues
> - * can't be added to the queue group, but they can continue to submit the
> - * jobs if the DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag is set during the multi
> - * queue group creation.
> + * can't be added to the queue group and new job submissions on existing
> + * secondary queues are not allowed.
>   *
>   * The queues of a multi queue group can set their priority within the group
>   * through the DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY property.
> -- 
> 2.43.0
> 
