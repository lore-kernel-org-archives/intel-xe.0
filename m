Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A1BCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4610E7CB;
	Wed, 24 Sep 2025 20:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMJzp8yW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76CC10E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758744129; x=1790280129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7QW1Qmqg6DmLS05JJkB5/XOp2//7PMaNABuTzgFJ+9g=;
 b=SMJzp8yWJOTIpFA3O2FysYUzGfrJK160pjrvEK8iA5uviateiNJPBlLX
 f65gvakFMTY+Q6JMzmjXvynb7g0vrUsAhpj9e29KSUGD4T4ZMu3r9QmoF
 lpgphxdMqE6HC2AX/wbzAvieLT0fJqgINGbWpoYAZ19C+0m9bGGmwNwuz
 VCvWb36CstYwfDJ+xbD/fJ3DX973XbPq8efeM6Hpsiwj/6MLJaLIjBGTw
 DVTXd8bWzXbxsA3Dd+M8+ZfTFTVq36rpnf8bDOnK7jIA1CHPXY2EOUfHD
 G3Zp8oQ5j0B9xje41gJA7/9FKcw2ZL978VI3y5pvYCycrwDk0QL7kIM1k Q==;
X-CSE-ConnectionGUID: t40VtYKOSYKGPN5mbQIiTw==
X-CSE-MsgGUID: On8fIV3RRgmUdmgalAwINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83656955"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="83656955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:02:09 -0700
X-CSE-ConnectionGUID: oVEcgZBtSzufuNqVDkaWog==
X-CSE-MsgGUID: rvnyXWpETE+/MrxCnsVK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="177555266"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:02:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:02:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:02:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpCRQNMF4ZG6n5lW9MZI8DTBZTQHMXoHOyBwm7diaD2iIs9Rdk92NNGO7jGnGkMMceqq8B8hvl84+CrkXsUK4IyznC1q11wGyR2A+On827sbAgddoQPRqPBMN05My8wYxyEZzZKvVu8B9mCT1yJSZ6nDNO/rAQpULIawK9tAYVfS8AjNqW9vZdRad+VwrWGLcpGH8V8n4AIt74PNxkwLJbUdvSgz3iyg2Pj3k9C19s/csNBixNWfyHylmRyaUVw0nduww3QzAeGMgOvBxi2JBC/V2+FCYMhHHdZt1JJHrxzeDZW1u9ado1eb9VtSvI2+sGJYDQgmbnZwbeugVMgozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SirrgmZ+CI91evgnBqlAMVeFMkRkKmcSf811YF1rHHk=;
 b=kKKgjTz9ENa29YOh/5hRHkonYzVYdldUeiOuAxMpsLirsJsprgq0UMLov+LCaCz1kAJdpudOCiSvd6+eWNiLa2dHuB21IKQeU74qWKYzJMv454ssTj8lhmSjwH5FEJAoi2Faw4EAgpfenfBu+RedBX5P1TfVDS07Gxbrh5f7AqQJXxVCJoxMFcwB5JpVL4qNeknBlsFeAXd65fOBpsUROwliNCo9K41S3IqipIl8mHkZ23aAvC5vWMLEFn1YS+PaVZoqXfFBwtBsTeK0mQ7/yKyajsd3R16ZbAxJDXneVMnUjQNGjcU01Hj5A/D1vE9hdLV/4+B7uu0z9cxCRU4O+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 20:02:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:02:01 +0000
Date: Wed, 24 Sep 2025 13:01:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 13/34] drm/xe/vf: Abort H2G sends during VF
 post-migration recovery
Message-ID: <aNRONhpLqohHC7/o@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-14-matthew.brost@intel.com>
 <0dfab95f-53e6-4e0f-8967-1dcdbfb8e63c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0dfab95f-53e6-4e0f-8967-1dcdbfb8e63c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 904ea56f-8a87-4655-c1cf-08ddfba539b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xZNMBDymRpdVPaAPUl6IRAVwAR2ai1glB2+Pygv/whS//7liW/2QUiZgSqpv?=
 =?us-ascii?Q?TJ8kBWCQMmI6uARwt78/cfJaxgIcqnBBnCHs2lGEV954kaI1MVVMh8wY7zwr?=
 =?us-ascii?Q?AnZ1TK4Trbzw91L+Y6QEoqm2FHnred8xanaLqvemAaWJtspjN65jSI+ilDIe?=
 =?us-ascii?Q?V0k5vM4Z76Yw7K3+9FYCWkFxnxCQmH2/uBqd+PYPrXYLfPhe9tCCW6D62wfd?=
 =?us-ascii?Q?JVRK24OA9y79JLfVd1jPpco8EqaCtpU+hd8JBJthrynMFv26hfKA4f77TA2f?=
 =?us-ascii?Q?c3sGn2MZ8liOjlkUnvJ2UIsN4aAhl1krwfn6+ITVpSJFengvI+tm1lFbRI1v?=
 =?us-ascii?Q?4xqp6FwL/qX7OR1WQGSFIqvnkycLulYzhBD4iS4ydK4RTrizO9cYiKlddB5z?=
 =?us-ascii?Q?XCEevFieDECxoYVPVAVKtia30XOhfXIM3vW6IRniuZkBBQ5RYd79SfWSde3y?=
 =?us-ascii?Q?TetzBwdOCz4YvYbKTZV2j42/78Bk7WzpighdSG6WXcZkwaHLr2L/FdT2LrRi?=
 =?us-ascii?Q?6+7bRD6T/eQ5mSI87+KMXFFQIi2YvzhAsj7U5rOVKJRpUtscT4Li3q9oIgmD?=
 =?us-ascii?Q?Rl0Z16fV8iQQB2fcv3QUul9RF7OFttTo3qjrg6Hd1izkhEbOk4MFB3WRU7Dw?=
 =?us-ascii?Q?vPHnmE+yp6ruuooRAyb41kbVbzLpmYw6R7337fSZsmz6YrBOweH/81GbjV9f?=
 =?us-ascii?Q?W3gyda/6Rtpiq95VGShLLYpWE4cOBqhReMeFuM6r+9UGSR5H4A43bCs4GNes?=
 =?us-ascii?Q?KLQ04krLMLHiDDKg2tSAMS26N+GCKxGhy54Gfd6JmHDGiJlW/tsTEcjYLNBg?=
 =?us-ascii?Q?zedeIkcUc+CJN9MJ9xrDDgo5EF4KxQoGGaKxp3HU4OVucbsq954faSDs8eKc?=
 =?us-ascii?Q?LtbSSgQNUk7FimSl6Zv/19mvvoRGiAuQb/ZGESIfuFsa/v44FPsM2Xw35wn+?=
 =?us-ascii?Q?3hg8dnRqI9gOyMWaYhNOB5GAbrvlyK9+RMclCv79uWEJhl9bfo+dMebhRAus?=
 =?us-ascii?Q?lHenn2KB2AWvJ9jqiGPASLaFZ4LvhrwjK+lXzsOcPtLrIoqj71ou2Cdb3Nh+?=
 =?us-ascii?Q?d762UQIfnhkR7SWHK+HmWDJFOIGzQyh3vSzw2wzvR9osNEO2CW/KQDh3GNhc?=
 =?us-ascii?Q?l4QBenOincO7G0+vrJKi23EfqmchkO+ij3kZVUbzxAYNpagmnQS/WsNpzfUd?=
 =?us-ascii?Q?nQM11R7H0whUOwpdbh5MPCJ0fRSvL2HvHat5aXbPmLkCXpuFdpH+LJQzaauH?=
 =?us-ascii?Q?/9JQkTlo2+LNAiiwIOzolHBSbXJ1ofTmtRpGzOcxA/jJxUcyOzGqubXb8inm?=
 =?us-ascii?Q?j0bl862uA7yfZzXfboLNDh6N0/zxY4XgJrgNLYOQhukYFgfckqBnc5JC0Zoc?=
 =?us-ascii?Q?O9zMkat03n3tOwZgx5ferRupC7fD7JzJCNF08RX3yrDeqUGtIVN/qjliatW+?=
 =?us-ascii?Q?LT8X1FPUB6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cjWjgGZ0MK2+7TJ1t7DtUnNt6q7QQRVybpXiwEF5DOC5HS9wcDafyzTKQJBI?=
 =?us-ascii?Q?ekdXP4Bu2ptJiMHv7AZFoOSxUWxCQKjE2kx1aK1H7BbwXpUDq4fKk2rtvmVL?=
 =?us-ascii?Q?NVRKH6SEuYN9mtqbTYaj3uuYX+PhPnH1/sqUTIHSGNqlBEd65L3T3Q+wM058?=
 =?us-ascii?Q?MFrJglPYMRa26hmRQ9KM+CxmDV6cQgvw5gTh/I1jI4TLepuGlwX5rTZ0lob9?=
 =?us-ascii?Q?3H8rxlANs8Frw4KHQ769rgBnjtqBGHOZ36t/JNejj6Lu18fWSPaHhm4me2O/?=
 =?us-ascii?Q?p+AklOUGkfwN/4xPYUOcRh+zTPewMFM4o6uvwqc45PTPsJsAga1HuqNaBz9D?=
 =?us-ascii?Q?rzwTrulaS3qoKVr2KII2KLOBfvPsd/tWuNXLow0/Qmjirz0q0ub7LH7x64y/?=
 =?us-ascii?Q?c9F+5OsT7W+ySHslUAqR0TJ1sHwBPETK7Flo6XnhLjGZJYOpeaWGJzm7Zr/f?=
 =?us-ascii?Q?IJTVLD+lbJiT3WYeSJoEoheKLyQ/4SqIajOgQ/S8lDUoiFbRWiPxLNFraSzG?=
 =?us-ascii?Q?5wlQiQH8kqruI+IxgNDTsCHqISOfv7nqA8eBiAdUc1dcXe5ShMNc4GZl9F6l?=
 =?us-ascii?Q?wjHRXEywZn6JuQDknaqIyDO3me1uZuOJhPKKAdUtbP4kABSWgwIAatIydzAE?=
 =?us-ascii?Q?OBS/wX9aJwHp3Ds21VsrKHDImFCZtPWeaIJYyJdBqG/TiUG5BUCGnBOmYd19?=
 =?us-ascii?Q?Cfg0XC7JKOzs7clXJ2BcaauR5xwOQoWQnVREApqupFvuD0r09Bn7w5uqnjKL?=
 =?us-ascii?Q?Uc/4Cec5p8/ntWX8OQ+rbpxrdcp8yoUqEkSVfFMXz5740KmdmjwU0xfEhxSa?=
 =?us-ascii?Q?EX/tu+H+pJiwuhEq6LVocpBIeJT5ZI1VZ+Tkv4hiG3R9X+QjXo8aorA/bY8l?=
 =?us-ascii?Q?mWo1FdXzlLxE2rwNWldcawn2d+qZQ+5hw22vFE9BfDVLN13MOycg+nmgGQ4d?=
 =?us-ascii?Q?lFov8mvWEwEDwX0CEyWy1uvcrH2tc3MukpLpbylX5M6mB41Kkr8HrCh0i99b?=
 =?us-ascii?Q?2wWMGSTOh4B8vRIH+vP3fVwJFmPfUxGfltD7DonW6dUk+6+cV2yzDmKj5jP9?=
 =?us-ascii?Q?/5k9JKHFZAfM4y4zOXcwf6Qqi/pPKGWstaExmEUmEquIIUsRy8Fk7L3/QM9G?=
 =?us-ascii?Q?/ohgAd1dBtdec2w4RcC6MRUsq6Kb3hfpplJ0ZFt00GtiIaIHDnpmeSPUV8nA?=
 =?us-ascii?Q?NPwOrsoFz53L6I2b2p3bA6eeMQ8BFHPPk/JwTsy2lBUuaiZxtdqZffHcGrSc?=
 =?us-ascii?Q?MdjAdCtYCViBrooX3IUqyu32hn7rS3pF+8UAcfrwOEHr5QTTvuKIz/Ogv9yh?=
 =?us-ascii?Q?tygWqYVPpcWt9pR9ByVU6+sFFvnUP4IGwRAMFqFDfjE8bzYHoAw/SssAr3Tg?=
 =?us-ascii?Q?rlo8wgl7mo3kwnnRCGfWLDZE7SEuQcrK6AZwhQDJ2xOn3YssrVLFmp9mwFOg?=
 =?us-ascii?Q?OgH97eY1pPZMqHTN3POUYaWPBZsicSYnOXqUqdQ/mtZlcGQWnHCBKeJsBbRA?=
 =?us-ascii?Q?ieBsg7hAzibLboI70rX5L4IshtuJJ44fS4y0w/RIeuRngDgDGjjG0P9zFXNF?=
 =?us-ascii?Q?53r6yrBzCt9kZXSSYopwlJK65g+jFhE/lukouy2tB8qsXmbYBjcJVDdL2CG+?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 904ea56f-8a87-4655-c1cf-08ddfba539b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:02:01.4627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Sid+qy07dZLZ7Vx5dX44ZMVqBb+N+NOUPAo9td71RmhD4H6YSZ9txfXZKSAfYXnXjRi3CM6lv7+SXdkhRi2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
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

On Wed, Sep 24, 2025 at 01:00:57PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > While VF post-migration recovery is in progress, abort H2G sends with
> 
> should be abort or give the caller a second chance ?
> 
> btw, do we care about extra errors being logged in such case ?
> 

All submission H2G are designed to be lost and state machine recovers.
TLB invalidation H2G are also designed to be lost.

If we have a case where H2G need to be relible,
xe_guc_ct_send_recv_no_fail should be used. I code that function early
in Xe, is unused so it probably doesn't work, but conceptually we should
be able to make H2G relible across GT reset or VF migration.

IMO we audit all H2G is a follow up and if there is need fixup
xe_guc_ct_send_recv_no_fail and use in cases where a H2G needs to be
relible.

> > -ECANCEL. These messages are treated as lost, and TLB invalidation
> > errors are suppressed. During this phase, the H2G channel is down, and
> > VF recovery requires the CT lock to proceed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 47079ab9922c..661ab1bf4502 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -25,6 +25,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_monitor.h"
> > +#include "xe_gt_sriov_vf.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_log.h"
> >  #include "xe_guc_relay.h"
> > @@ -851,7 +852,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  				u32 len, u32 g2h_len, u32 num_g2h,
> >  				struct g2h_fence *g2h_fence)
> >  {
> > -	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
> > +	struct xe_gt *gt = ct_to_gt(ct);
> >  	u16 seqno;
> >  	int ret;
> >  
> > @@ -872,7 +873,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  		goto out;
> >  	}
> >  
> > -	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> > +	if (ct->state == XE_GUC_CT_STATE_STOPPED ||
> > +	    xe_gt_sriov_vf_recovery_inprogress(gt)) {
> 
> this still looks like a hack
> 

It is not and is required. We need to pop out of __guc_ct_send_locked
during VF migration without taking the CT lock (calling STOP CTB).

Consider the case where H2G is full (no credits) and VF migration
happens. If we try to call STOP CTB this requires CT mutex which is
being held by __guc_ct_send_locked, __guc_ct_send_locked eventually
times out and tries to trigger a GT reset which is not desired. IMO the
flow of locklessly, immediately being able to detect a VF migration
happend in the CT code is correct.

> maybe we should either explicitly STOP CTB once we start the recovery,
> or if that's too much, maybe introduce HALT CTB state?
> 

We do STOP the CT as soon as we can in VF migration recovery but this
cover the case mentioned above.

> btw, what should happen to already received G2H?
> shouldn't we process them out when starting recovery?
> 

Yes. xe_guc_ct_flush process all G2H before stopping the CT.

> and maybe we should return different error code to clearly
> distinguish between our explicit STOP state and implicit recovery?
> 

-ECANCELED is the correct return code which the upper layer (e.g., TLB
invalidation) understand that is fine the H2G was dropped.

Matt

> >  		ret = -ECANCELED;
> >  		goto out;
> >  	}
> 
