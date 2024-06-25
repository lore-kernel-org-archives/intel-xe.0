Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BF2C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8510E6F2;
	Tue, 25 Jun 2024 17:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSGVsvSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7B110E2B0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719336291; x=1750872291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Ol9eGvCWDuz7Q8amrAqWLUIckZK01gX/XKHD8gi7uM=;
 b=WSGVsvSkYyrzRCTkEyRq4+7ZZob9BVbKLqTOwSYLl9Mb79SSgyegGI67
 N8/Pe0tcKxQPpCOGQtKPm5XbVA+WR7mRtQo1mKr03SMkLDfrvVeH9Gg7K
 vZiuReLdYK9yX0TfG2IobEbHgNV7jAegzXU1ag0JuHTR8cZRDlapNHQ6C
 oq5+FPl5IrYdiS/TMhroHNjL+ObGwYU7NyEJzwaxwnEjw8NezetpEuvSL
 R6qvK7ax5CJS564PgtsBBwtDssbD3QBYU79HbwAm67MFG1TNQzzodpZTX
 qCIljV90MZG7DkbEZszR376UH1O+BcTX3Fy+fAm9ZZpShsXruynMgzIIz Q==;
X-CSE-ConnectionGUID: +FgLyzvrTsCuXMwAbuwOjQ==
X-CSE-MsgGUID: yEIEfdmvTaSXS6YgNCmHQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27781020"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27781020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:24:50 -0700
X-CSE-ConnectionGUID: wMJMkQVcQHqHIGyi+rRCpA==
X-CSE-MsgGUID: TtEn3qzpTqKlMz0/kNToTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43695246"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 10:24:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:24:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 10:24:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 10:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=budNIr3u4sm1ub1eh3V51/mkov8rDyVz4DBJPhVnH7AxDLzNE4zOa3TXxINGPMQyXsRI8Zlofg4AW30N2Oue7mZKwlhbX70a6pg4Yutljrv/bQ06vq2rUALi1R00MubKxiQNK7RYtpgfuv+FcbvGuO2weqDIxpBa7GTq+SQ7oxDR9FCgmcLlIjXDGEfIIe6qionFbAEOe2/bN4XA+/r707SMUIqqpxBkVkaKX7QknnT8XfOejIRQ218hdHuZq/43/SjvE7F9eeX208V2l3b6u3e8mSRjG16gPfROgqFMgHBfit6ME29OpELII/oKoMQsAPAra+4Bx5c/deqvZx6aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3kAbYWu+1qvhxT81iTMlk+utBiutzjq1/N7jPVxwV4=;
 b=EQR0Qz/E8X2EPqMJujH56Ms8eZKzDW5OsDNOeeu6xStBIakw7Bl/+615uttOhK+A5N5JiDD9gaTjuU5jTUfNwKupr78e4STlDzaq6ecZGg/kd1GDIWsPoqJv/jrLYq8QYwWj9LOyo4Z/oAlLrJCUVwWgFxDANjPA5s7e5OTLBb7YIUXKcxwPuSRyBSmo06S6hKa56jOD62MXIgAVHAQNaGWXsohixqlmB/APf3BGA9G4yYLmBhMGvaXRBsmbDN34JAyXK/MYy1RsHOyij48mxFiuGUMPafAYumqZW4PdimDZved+x3az5h5hepEDV4x2ei9pHea4xba/g1gklxJOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Tue, 25 Jun 2024 17:24:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 17:24:41 +0000
Date: Tue, 25 Jun 2024 17:24:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4b34c6-bad7-4ebf-7b09-08dc953bb248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZIyPGhIi6cu7lFwkqhpnnbMFhmEYpP40AxMEE3v7wV92j6xx8XG/OK/ccwc?=
 =?us-ascii?Q?GItwbIVIaDc5kHtl3S085NwMj9ebTcBv57luxGi4OQ8cL4eaQvmb227iqoRj?=
 =?us-ascii?Q?+GyzIME3+kTdN9XAZcQmQ8tAnrX99arOyjDBvCvUg/Pk3H0CsXnNTqLFm0Xq?=
 =?us-ascii?Q?i50SL2s8aJ4dd0UN8+i49jeipoFRNEmEzqkAZ/SON2LoX8AqyHgExVkmBLDm?=
 =?us-ascii?Q?HHh/NNfii+Nlfz4CFgOUisHE+tO9LV3GhCapcrPSOYxECw9vgZszu29F569P?=
 =?us-ascii?Q?cO/jD+Vx3wev+AXuDrctELS/t9vQsaRqAmi13OJCeUNvXXv2hEX1nDOrjkMt?=
 =?us-ascii?Q?/NN+vn5QabU15/rvPiwA+pK2C/JfqvVlxqC5KFZt9VmlNIvcQqzHu824ONWr?=
 =?us-ascii?Q?J4t3AhvuxnZvbcpGL1fynWZv60xtlctWDW4AXD0X1rt4EeFSr6deTuSGrd3r?=
 =?us-ascii?Q?gqYWEa0ubmYd93ao8f0AamKE6l3Y9vI5DhNLHQhpIgY4ksSVrvWi89/n95Pe?=
 =?us-ascii?Q?cXMScEFTd869ZPKyA5EhfNYr6cAP0O18ttipon5rnER0JecApGjqnIPo/Ikv?=
 =?us-ascii?Q?6K3Og5+3lC4SJikrdkcQwEHQRygO8c36kw9fnMn6y7w2UCbZ+0x9HP+AJIcl?=
 =?us-ascii?Q?tqdISZ7fDfVGdWsqPyUFErGml0n55CZlTEJZF+JURSt+N+pBKhemuh+grWwm?=
 =?us-ascii?Q?fYvDyzjkYBLpu+UAOTw1F3hFFJ1jNjvUiXZJfGeL1TdLx4jCsE0tUko8kRpL?=
 =?us-ascii?Q?w8Yju62EenJ3fwxKKTIKvoRFIyevM5lkJ4ipfRV7fcPmedT6EdvfYr8TaaVH?=
 =?us-ascii?Q?O+8hpPtADkg0Xfe8C0QFOCb0IO7GoOnnxQNfUztjZJF/m48FdY+Bm3UzM/Sc?=
 =?us-ascii?Q?nCsfWa3uDc9u+TcXgmPcEaN1zzzt1wR4lpLgUhozpSbbtGM/l48mfTu5FSol?=
 =?us-ascii?Q?K5UovRq28yuRHTHCtSIcsc8srnO+fZw65E0XyUrH4N8bwi5Uu51++rnlDtH1?=
 =?us-ascii?Q?lEK9hf+ACA2oshatWe6GYDQnWwXJp3oa+sNfSBuMisq1K8JtiygKpU+P45H5?=
 =?us-ascii?Q?NRwBhV2s+yEYXEdsBREzlgdigelWVFwk1YsOqEAV9Bu5JLKtXG1s/e8vrCCV?=
 =?us-ascii?Q?oyxX7ttP3M9iJcBxx6zn4ga4aFg33mduOy2Wypqg44w1gdXOYqtg061NxMe3?=
 =?us-ascii?Q?YwGT+sj0nDM6LKVaGtouF7UojpnLXM6FtkV7YK6N59fYKmc1roH8PtTDQyOx?=
 =?us-ascii?Q?j+9bxw9iU10yj3ETyJ7xXnbacTqgjfkc3DYl3/OX/aAmpcXMh7PPqe8bpzRJ?=
 =?us-ascii?Q?HHDf5U2jRvMK21vtxm17/Oc7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DlOMK72nx2wNwORvA+P0LVyIjtCLU3fHSfY84dHw5lS56Ex81okcuMIMfmbZ?=
 =?us-ascii?Q?xxfHFD1OPDGzpGoIDDAwbjGLgQr8PDowFU39HM6n2yMip7cmUZTd0JO5gqnE?=
 =?us-ascii?Q?ohSrdauqqXG1qRkFKvKUSYbWW5Ip969FVIOKiC5fLiPhS0hQZTCu5vNVOvPs?=
 =?us-ascii?Q?gsGgk9a1DlWQRxF9nz7+Vge6A5hiMsFcvxkO19Px6ZgB39h39GfbItsfAxd0?=
 =?us-ascii?Q?NuGf6xo8qyxzQW9NVTrsGYCjemptjhJK0ueSRsYyem5pOUzvBxb/xM+tHIRx?=
 =?us-ascii?Q?8UcEocXU0/aRCvqMK8az5Ki3VxqRwG3lXBkorXJJNgk1uKushnlkhDzzIcZB?=
 =?us-ascii?Q?XJMCfRMYgwXAF3EIzKPk1Pnwx3DSyUjW1eG31FzZJmSN9zwOIp7uEFWBfbDR?=
 =?us-ascii?Q?cqusRbAw6UpdiECX7eW3yawTixBysS6HvUXVO9QhnvTMTjlGWSuIAvG2DttQ?=
 =?us-ascii?Q?E2mXZOm9lg4WIbw0n1QnPzT9ZS1MZRuKFKl8li10X04V5B/JAeb85cu8T5xS?=
 =?us-ascii?Q?AJsN59S7hVG+49Nxe68j7/OwgbEAziRFMfvGuWvOfUzEJN7m/d2ayAku+ucQ?=
 =?us-ascii?Q?e/vqdxHx1B15Ymr1PVI2Oj8KHSreUXosZ3aFquakiB8baMbru8ZUdZ/EnlSU?=
 =?us-ascii?Q?KNLFytq9i979mcv46YuaBA4iqXG46+C7tBVhonQll3lkftDvzLgIjALUdrG3?=
 =?us-ascii?Q?Yr6XIh+paT8oLF0jUlCXCkPxUgsXmg961BmLNr4vn4KoIlZkyBIIzp9dFSU/?=
 =?us-ascii?Q?EKOZCV0VCRA0o5z9f0Q252+fBqN2u6enkkH1WkKZtybEX9b7kdxsHg8wXBUF?=
 =?us-ascii?Q?txQnm/QCJap6A33JK78jfzao1AEu3zJOZ9xTwVPt88XUV2i9JAHLkpNMcAYe?=
 =?us-ascii?Q?5grZnic09EAYSkl/OH43nb4I0q3pbKv2jMk8Xa/Y7ceo/NjOkQtcaRNU+zvv?=
 =?us-ascii?Q?YzgY62xQtjOzZDvv1Fon/AtlV3W0Kc1Tl9+xsCceP2czz1gHSNtYHfKC5VTk?=
 =?us-ascii?Q?X4mR0z+Erx+q74GztZ5tib5xQq8upeqlvVZ1LWuhZ02QlPG1Q3HN3Qb96eYx?=
 =?us-ascii?Q?5gHgRqPKiprL1eHPGv0N8kSW7Sg9sh2x95AyAnfvF65pESOpT73IprbeSU/s?=
 =?us-ascii?Q?rdTAn9Wub8OPdBE1tUrHHe3nA/ZrRU5AzNXvB2c7a0Q6aNgCjP8v8Z4RWxwC?=
 =?us-ascii?Q?R9ZRMgL9cUdOoc1yr9HJWxf8ZZzQNtL9iyZ0xP7hrUS5Rl8+yKGi/erRkqvr?=
 =?us-ascii?Q?QfNzb4ahLM6GcM7K0vyigX+zEgBqm44M1M+MxyA5sJvryp7d1eQAtgMBdVSV?=
 =?us-ascii?Q?BTOagT3DVgDrL72flQcIIL9eyeTuPyT1VZJPCVpZDScwlQTItw8F8oLJ/E81?=
 =?us-ascii?Q?JKJHRucbXyLlZ47JjvNEWhRmWLoH64Bx6EH1v+74JbMEbNtUE3dwCap9j8y3?=
 =?us-ascii?Q?e/02gSyUgAdIpOnQ3zG+AKtn1nmG+TFWBwVkKN2IfUkELjvbebbKIlTrH1Ds?=
 =?us-ascii?Q?cMjVAt4IuwaaOuvUonNh6KU1uEDxkCL6/nKxr/XTis5Ox9EIaxYmyko1SHt2?=
 =?us-ascii?Q?Amb4zDUQF5wjbHCB+hglCYniUQ2EYc04x5ZBrfbojbDcflbVpyoKoRP41oTc?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4b34c6-bad7-4ebf-7b09-08dc953bb248
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 17:24:41.2713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UFhPizv+2WZDiOoLQHmOpfrDN5GwfuM8BDH8Q2eYhd3qUAbnGRfD/0CK8PcFx+3wQRBDctqdz6DnoGAp1wigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
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

On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
> Current code captures utilization at the exec queue level whenever a job
> is completed and then accumulates it into the xe file stats whenever the
> user queries for per client engine utilization. There is a case where
> utilization may be lost if the exec queue is destroyed before the user
> queries the utilization. To overcome that, record the utlization when
> the exec queue is destroyed.
> 
> To do so
> 
> 1) Wait for release of all other references to the exec queue. The wait
>    uses the same timeout as the job scheduling timeout. On timeout, only
>    a debug message is printed out since this is just a best effort to
>    capture the utilization prior to destroying the queue.
> 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
>    record the utilization in the xe file stats.
> 
> Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 4d90a16745d2..f1028eaf2d7f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->ops = gt->exec_queue_ops;
>  	INIT_LIST_HEAD(&q->lr.link);
>  	INIT_LIST_HEAD(&q->multi_gt_link);
> +	init_waitqueue_head(&q->wq);
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_exec_queue_destroy *args = data;
>  	struct xe_exec_queue *q;
> +	int ret;
>  
>  	if (XE_IOCTL_DBG(xe, args->pad) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  
>  	xe_exec_queue_kill(q);
>  
> +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
> +			(q->sched_props.job_timeout_ms/1000) * HZ);
> +	if (!ret)
> +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
> +

I can't say I love adding a wait to destroy IOCTL just to accurately
report some stats. If we can't preempt this exec queue, the kill flow
can take nearly .7s which would be pretty bad to block in the IOCTL.
Even the common case isn't great either...

Beyond that, this code breaks if the assumption of
kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
forever even we wedge the device.

Could this be added to exec queue backend code which adjusts on the
final destroy? e.g. Add it to __guc_exec_queue_fini_async via
xe_exec_queue_fini? Or does that not work because we don't have the xef?

Regardless if my suggestion works or not, surely we can do something to
avoid waiting in this IOCTL. I suggest exploring another solution.

Matt

> +	mutex_lock(&xef->exec_queue.lock);
> +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
> +	mutex_unlock(&xef->exec_queue.lock);
> +
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 201588ec33c3..2ae4221d2f61 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -143,6 +143,8 @@ struct xe_exec_queue {
>  	u64 old_run_ticks;
>  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>  	u64 run_ticks;
> +	/** @wq: wait queue to wait for cleanup */
> +	wait_queue_head_t wq;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> -- 
> 2.34.1
> 
