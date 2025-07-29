Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A049FC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 14:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F1210E268;
	Tue, 29 Jul 2025 14:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMBaaorN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564AB10E268
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753799887; x=1785335887;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lnF4OHcPmlGWyWirHJs7jCaSWj2dfYVdUQH4ftlF8zg=;
 b=EMBaaorNChk+syvPsbpuiXEOVHf7NvviPjo+nL/mmlLv2fMY7B9JZNpD
 y/Mw6qu7bifqxGv9TXsXkApQVUH5svZu829yep8nw84mBOvtH7wCHOkV/
 uLJOpzB4b29UidRk9vfj7Lwl0Da7Ta/5NtqtEKDA1hDShUX+CVnSy7QLh
 PdkUe1Ed7cmyhaCmO3TTYT5PqmJ3obaA3JNh2P28L4cW153jA1jgg/oU8
 ZvdvRQM8Qi5oS5MctuS+oYjlIG9xIm4aHkYJbAkqjy0LROBywgdzNti4o
 lWYTrEy3cXRYBsHqqbWnHzQXc/olcoc1P2aRmyndZUAQmP7TnSucCda6Y A==;
X-CSE-ConnectionGUID: Rll3gE46Q3qrH4nnOQAXTQ==
X-CSE-MsgGUID: o0bQ3/+lSCWbYkWqxikzZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56010126"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="56010126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 07:38:07 -0700
X-CSE-ConnectionGUID: COWIrgP1St6uq2ZlXUTaZQ==
X-CSE-MsgGUID: ma96diU4Sa2nJhVZ4+6enA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="161992974"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 07:38:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 07:38:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 07:38:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 07:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5S2ojZHAnK1deShN/toTgju5c4dZHc0Tto944tmFNFT06qPS2XTxRxcY2dXpxOAZnd/9VVTzvvE0G/7rY4XxhrhWSiO+e2g7Sm3DzFrO5TC7xS9W+jUkkC4jCSVXI6yE0japi5YRw5ojXLSHM3JbxUbpPVgR3JgzWEPlV+zSLBGOFbSbuB5yQst+HzGI0snUqBV0r1Xt0WGe30/A8L9F5uZ9qdDEk+Dv6m/M4BPrpB77ERWtYOEvhlZdZhbhi1znjkw2gjtUWydETXTdWrMq1CGtBY2EnbQPXqGw3IlPQfUsa4+l1bsW5MZ0d1vHHBn+4O0HzFKke5cf835AKDtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhutIiHb/p6ec1ZzmJxw7yiKMM/WZw+7JJLDRJbLHlk=;
 b=oWW8qrtMvEqiY8xQsQLdLoCr0TQGQAGqppAJDThOxKhRARJ8b5RJivrN66WAwbTSHrg3DNRTxc0f7VIj3vpuYmAAl0Vh+93Wz7g34Cd9zTrJFbCY/iWokFoRJRfi3IGJzYCOwrnFvdYSsmKVpYsD/Q3yJVVUiZlQK8V+OePjCgyD02CV+5ljWGyOxHnunGreKrJ0Rke1g165C0XzM1PO/fOxedGicEgrtOqzDx7m5FpFnRsXOkquQH10WqqzyU26ntNhQkojI/D5sdce4EDh6Ojq3xUE1SI3EbwIbkla110p01T6bIzwsQJdIpBO9pKERMm1UXUNBhIvhVM5LWP4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 14:37:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 14:37:34 +0000
Date: Tue, 29 Jul 2025 10:37:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Message-ID: <aIjcq41Hb1nUq3Wg@intel.com>
References: <20250728084751.4057124-1-balasubramani.vivekanandan@intel.com>
 <8ca6af6970ef166f66b6786f55156af876133ddd.camel@intel.com>
 <aIfJAvs2OZ5oS2ce@intel.com> <aIiBrqrmcs8eXB2-@bvivekan-mob1>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIiBrqrmcs8eXB2-@bvivekan-mob1>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: edffb82e-a60d-46b1-abe5-08ddcead74e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U1KWFUO6aP8mSrmGz5wfqVZee3VCLatgzILELqbCOMt7mFMNCstFWNoxzZ?=
 =?iso-8859-1?Q?ayrVbltiVDESCbM41ueA9PUwKyUiFy4wl0RGhZCWEv8xYALG205e1WDbIz?=
 =?iso-8859-1?Q?GgPLeyw6hb6epVO+aHYV29LUyt0leFWfBDtkQHLWbEgVP2M/SI1f4uuGfy?=
 =?iso-8859-1?Q?CjU3LUeW+DqCIRmE+rlH/MjHBvtxaPbw45T0kcypcW8XnEjGFcPCC/9Wn5?=
 =?iso-8859-1?Q?E8p79sFLrC6nUOUEaqr+YnH9bebK75HnWAirmWJ4vz6Fi+gnc+lmqrfH4j?=
 =?iso-8859-1?Q?6gCVWlULH6Xldv/L1P9ZngbXJ9wei/lRc8QbNnKnHpATELp64ieMhH1/Oo?=
 =?iso-8859-1?Q?fhtCCbzUwYoKM1YvlEAtHBeLS71AN8custoUaiV7x9m68jq/5/2oWXLk+B?=
 =?iso-8859-1?Q?oorpH8GhghEai0l6biZ6R1TjqVZlQnwWGh8L+H31TLeCq2JjPyjzzsa5CC?=
 =?iso-8859-1?Q?3B9rsRRYhlQhVdu6g52m9Z6Oi4TB2imfM0iyEoFAN0qvW1A2SrIlch1cxd?=
 =?iso-8859-1?Q?orucVJkVZusObMPqAEB5f5AJfyU4tRE1s+jri14U5b0Biz1RZjFqi9BioH?=
 =?iso-8859-1?Q?bgZuK1qHRvjiKVgNx74rvTMDILzrWscJsnvAEArXtPRbwvRyX+t+koN9AY?=
 =?iso-8859-1?Q?5O+gqZ3cbFbm5sGhbGAafQ4W0cOg7qPi3N89ES5M0QqsNVz9ng0esnjH7Y?=
 =?iso-8859-1?Q?TGdS0Z/GFovATT1QJnA0ahKqnyl2BQ/17P6ypjRLErvfHvvUsT4QbSv1es?=
 =?iso-8859-1?Q?pQjt2DnW8rBkq2V9w5gvtnGaTZsHcRzqFVVJSHU/Byk3Ym0l3us39yh5VV?=
 =?iso-8859-1?Q?wyMr5hsVMlYH4F5ouNlWJdsky4U8e8l/4RX6D0WDzmzRqVWzfvivKGcW/4?=
 =?iso-8859-1?Q?JHLXCrt3MyKwj9NdrVfKMPhkk22n6OOPsd+Kj9FOXmyI8+EFiInlRbz2I1?=
 =?iso-8859-1?Q?a4NT1s5EsOrLbO7p7WYc6PxtCtM7uDzW4SuV+UKWh4csMtYy14isYDBF3D?=
 =?iso-8859-1?Q?L8NIxOdxc9/BeK1GktC6J4vujbUSqAiSEuoMnrJeuWGVSZjgy8Ged9GMr4?=
 =?iso-8859-1?Q?iYXeZgOA/T7tXyac2TidSsB7YUJV/ytSfwwicXjUWwx/nCUZnXZNItqocb?=
 =?iso-8859-1?Q?HzFmeoSXys474Xs1asoG5sNKc4DjdPZISsLj4WjOF16av+ylzNJbIp3gTu?=
 =?iso-8859-1?Q?ylelKV3Im+3wmXUp0PQjxr9zkOUPQWN4fa9NMz3iXTfps/7rCF8HhYl0m1?=
 =?iso-8859-1?Q?Nx7/NtUUs8HxRMw9UP/cU26rAcEMjQfdZCLUcstV5PHwyG+I0upuKGL5jr?=
 =?iso-8859-1?Q?xDr0Y7O19+BKippHMe3r6orXxUK/aH7+8o1+5XB0HkcpoE0gGs2hcUn2+4?=
 =?iso-8859-1?Q?0ImHmESPmxkrxChhyvuAStuSSotZJf0x2kgnVw6cM7WIhjqk5uqy3FYtVx?=
 =?iso-8859-1?Q?w/FBKKJrTpBFdiHIZe6hOokwx/EqeIYwOEL4ZAupHNrDXrv1JCUILgQ4vX?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1u6OU/DVMUEunmLlgFfqdELJdeAZ5U9GsyIr8DHv+/a0U2MOf/eh8wPvK8?=
 =?iso-8859-1?Q?bBRn1Es0AOp54f4Vgg/FeSrdKnc4GecYM0gDB30q2Cgm/6j+VmSNk3XM2A?=
 =?iso-8859-1?Q?vMLJJrnmBdp2OYOvcf+gvtjbLyD2tLmntk+M3ARizNQ57+PB+72vZyHUta?=
 =?iso-8859-1?Q?EMk7pZ0uCJPlEOtKSR9TIvd0NawgZBJ1Fy96zIWUlGGLdbmCUO7BjsXsTv?=
 =?iso-8859-1?Q?xCRHF9AgRHYY/S5mZdYeiHnATEkT6N2mVBIA+BuxXCCuqKWCIWgAkwa/OO?=
 =?iso-8859-1?Q?VZ87QFQhogGAbjka8Yl8sY9add9lJ+WSZorAYjinQqw2n6LdGHJrtIHp4Z?=
 =?iso-8859-1?Q?JEFZBmbdyXOk4VwCHGSPQN4/YNdYM9JEWYUSSfB1O3eRg5tJdMXM/U09CY?=
 =?iso-8859-1?Q?Z7jY/g/C5PgJGCZ8XolnbzLI+FHTSmB81Mhtsdp8RPT6C+WzYSv/5Pqdg8?=
 =?iso-8859-1?Q?6CpRnVav+sSYrlyoyssIkhVrjBicfqLIZ8t6MS5AWTFM31C2LlQBOItvVd?=
 =?iso-8859-1?Q?oK9EopMMz8H/LJmGgMTxohySRYIDxLj9xIc7zB85bXec2P33Zd3HpKY0rn?=
 =?iso-8859-1?Q?bD36purNSH3GuwKHOLFqPfKeJbw3rvBNBU/ODa68lWvM9n9HXonIpNntJI?=
 =?iso-8859-1?Q?B7YUszX7J4X/1HNOPXXiWhys1b1ALA5CFzqQIA9iH5D1nRIaeQECbsK6Sq?=
 =?iso-8859-1?Q?OZO3XegJobyvM0AJNY4E68I+Ma7GG8XAfI9iS+k3CvcZ3f9Tk+frtB0Mv0?=
 =?iso-8859-1?Q?6gmCkNY+fYeQz4obXHbUd7F53mza20jhYdvbFsPWB6WnD32Mr8u5fh7ZRr?=
 =?iso-8859-1?Q?M9M8Gv/MgfxTt9HjibAq+fWt20qHQqNRY5yO1FQr/XPSP4T69yfefFUPKJ?=
 =?iso-8859-1?Q?uFARJZ4cDp71sp2cNi6pCU3UXeC21/DBfkEkOJHOqUSPRqLw36NaG55lrn?=
 =?iso-8859-1?Q?uxcuBYfXVzGHkNKwlgs1/pvJveXhZZkOYawIMUzeBXtsPwlWdLC6Eqw1Ov?=
 =?iso-8859-1?Q?ECsuxG2uFtaYiDZ8OfoaeKbgt/8JelGjt2f2btGbmbRRx8+QjjwMoiFfC6?=
 =?iso-8859-1?Q?XdO0b3FmmzXFxTThN0r0iKTbx+ZJrZi8brx3qAy5O8Ok2MXRSB4WfFh4ZE?=
 =?iso-8859-1?Q?ow7LA6YvxHl+tibOWSqj9dsctyzIrcFymvxVOTQc1Df3pZp+FplFQFGR5N?=
 =?iso-8859-1?Q?UtlIMeFwXXijsWrX0t3mJO1OY9yrX0F/DVMmG0kptiiY0dcyeprrlb44GW?=
 =?iso-8859-1?Q?j1DWRQUVppSlUUHEO8KzzEkYTKvs6Rahc+R9eyPZvQDsQdG6842NBPIGvI?=
 =?iso-8859-1?Q?alTXqdVSbk1FuvBENYjCMYiPGJMRkfKNRQelHGMfh/9EPrZUDnTXmn4nuv?=
 =?iso-8859-1?Q?BNNTUXs2yhn9JvAXLXUtFsxLy8MpIEzvh0RufMW+XC+bn1MEss9tMJRpVr?=
 =?iso-8859-1?Q?2mN58e6YuZBYZbBiYW7xvq3pyBjvBBgmb4L7i2pqa5A4fgyW67orb4QrD4?=
 =?iso-8859-1?Q?7KdOJBGF0dAbFDmZ2/Yqpivg6R34FDj53mpyi4sZh5itBfIhEizU0xdJE9?=
 =?iso-8859-1?Q?TpybiinIbKNBluJZOb+qRBcUoINFM+M3PY+R3Q5RYSQ/k8ydIQP90i0+DT?=
 =?iso-8859-1?Q?h153ZZ4HUF4esCqXrtRjJhi9XgH7MkzT3DTJgCYiNOiipPs/hxye2NVg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edffb82e-a60d-46b1-abe5-08ddcead74e7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 14:37:34.4543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Wu9pnhsX7Ir3QmVQCA/14+FGeNKfiFubCKa6lkucUwuk9lHDoOlyy2uTq8+XxSGC3RtQVY1urJBtvdsJ6tZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

On Tue, Jul 29, 2025 at 01:39:18PM +0530, Vivekanandan, Balasubramani wrote:
> On 28.07.2025 15:01, Rodrigo Vivi wrote:
> > On Mon, Jul 28, 2025 at 01:56:07PM -0400, Summers, Stuart wrote:
> > > On Mon, 2025-07-28 at 14:17 +0530, Balasubramani Vivekanandan wrote:
> > > > Doing devcoredump initializing before GT though look harmless, it
> > > > leads
> > > > to problem during driver unbind. Because of this order, GT/Engine
> > > > release functions will be called before xe devcoredump release
> > > > function
> > > > (xe_driver_devcoredump_fini) leading to the following kernel crash[1]
> > > > because the devcoredump functions might still use GT/Engine
> > > > datastructures after those are freed.
> > > > 
> > > > The following crash is observed while running the IGT
> > > > xe_wedged@wedged-at-any-timeout. The test forces a wedged state by
> > > > submitting a worload which hangs. Then does a unbind/rebind of the
> > > > driver to recover from the wedged state.
> > > > The hanged worload leads to a devcoredump. The following crash is
> > > > noticed when the devcoredump capture races with the driver unbind.
> > > > During driver unbind, the release function hw_engine_fini() will be
> > > > called which assigns NULL to hwe->gt. But the same data structure is
> > > > accessed during the coredump capture in the function
> > > > xe_engine_snapshot_print by reading snapshot->hwe->gt.
> > > > 
> > > > With this patch, we make sure the devcoredump is stopped before
> > > > deinitializing the core driver functions.
> > > > 
> > > > [1]:
> > > > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > > > Workqueue: events_unbound xe_devcoredump_deferred_snap_work [xe]
> > > > RIP: 0010:xe_engine_snapshot_print+0x47/0x420 [xe]
> > > > Call Trace:
> > > >  <TASK>
> > > >  ? drm_printf+0x64/0x90
> > > >  __xe_devcoredump_read+0x23f/0x2d0 [xe]
> > > >  ? __pfx___drm_printfn_coredump+0x10/0x10
> > > >  ? __pfx___drm_puts_coredump+0x10/0x10
> > > >  xe_devcoredump_deferred_snap_work+0x17a/0x190 [xe]
> > > >  process_one_work+0x22e/0x6f0
> > > >  worker_thread+0x1e8/0x3d0
> > > >  ? __pfx_worker_thread+0x10/0x10
> > > >  kthread+0x11f/0x250
> > > >  ? __pfx_kthread+0x10/0x10
> > > >  ret_from_fork+0x47/0x70
> > > >  ? __pfx_kthread+0x10/0x10
> > > >  ret_from_fork_asm+0x1a/0x30
> > > > 
> > > > v2: Detailed commit description (Rodrigo)
> > 
> > Thanks for that, now I could see the path, but now I agree with
> > Stuart below...
> > 
> > > > 
> > > > Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver
> > > > release")
> > > > Signed-off-by: Balasubramani Vivekanandan
> > > > <balasubramani.vivekanandan@intel.com>
> > > 
> > > So I can see how this fixes the problem from your description and
> > > looking over the code. I thought generally though we were trying to
> > > decouple the devcoredump from the underlying structures.
> > > xe_engine_snapshot_print() is grabbing a lot of information from the GT
> > > at the time of the print rather than purely as a snapshot which doesn't
> > > seem right to me - we should be taking the snapshot at the time of the
> > > error and the print should just be relaying that info.
> > > 
> > > So not that your change is bad, but I think it masks a problem we have
> > > in the implementation of that engine print. If we call
> > > xe_guc_capture_get_reg_desc_list() at the time of failure rather than
> > > from the print itself, do we still see the same problem?
> > 
> > Indeed the real fix is to entirely decouple the capture from the read.
> > capture should be done at the snapshot time.
> > Read should not depend on the gt. Although this might not be the only
> > case and we probably need some quick fix for now.
> > 
> > Perhaps we go with this patch, but mark as a FIXME comment and ensure
> > we have a gitlab/issue + VLK opened for this work...
> 
> I have created a VLK to track the requested change. I didn't have
> permission to create a gitlab issue. I have applied for access.
> 
> I believe we should have this patch to fix the order of
> initialization/release of the devcoredump. Looking for r-b if there are
> no other comments.

Please add a big FIXME comment near the xe_guc_capture_get_reg_desc_list
stating what needs to be done

> 
> Regards,
> Bala
> 
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > index d04a0ae018e6..ae48cd3c7bf0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -821,10 +821,6 @@ int xe_device_probe(struct xe_device *xe)
> > > >                         return err;
> > > >         }
> > > >  
> > > > -       err = xe_devcoredump_init(xe);
> > > > -       if (err)
> > > > -               return err;
> > > > -
> > > >         /*
> > > >          * From here on, if a step fails, make sure a Driver-FLR is
> > > > triggereed
> > > >          */
> > > > @@ -889,6 +885,10 @@ int xe_device_probe(struct xe_device *xe)
> > > >             XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > > >                 XE_DEVICE_WA_DISABLE(xe, 15015404425);
> > > >  
> > > > +       err = xe_devcoredump_init(xe);
> > > > +       if (err)
> > > > +               return err;
> > > > +
> > > >         xe_nvm_init(xe);
> > > >  
> > > >         err = xe_heci_gsc_init(xe);
> > > 
