Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50986D4A607
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 07:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E4710E805;
	Fri, 16 Jan 2026 07:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7I8udTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF6110E805
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768547923; x=1800083923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YmjQ0oO4G4BmZ1E/EyxLeRHFp/Zo2I8vceH1lKnHnfA=;
 b=l7I8udTKSd9IlQl2ttd6EC1v9cj4CUXDxcpoAIabqkmKSEK45zkDyDZJ
 F8F4+uxUm1CSPTNHfmA1by2wHVzNIXOH5Qm657R0b9M5O9P+N4DI47vuz
 s91q0EVFU5+XdQaCUvXUNihwyaSeJikkH0f3eSvGHxZesyNytLaM+7WRT
 dkatQjGo8wd6YuN8eLJk+1RsJ6qcoQVikTsTNmlCRtQoeDdrarcSwLKgR
 wYIL5oCBVDXapIldDkpBrDi1NWl4iT5zHbzJqSSKv3GQFnrIFaHkRL2Lu
 2MynyCY1Dzsi22Q8m7NVLyRGqe5+GtiN8yhSkDXix9nUhw9XFfVSJgVmB Q==;
X-CSE-ConnectionGUID: cTdYsV52Sy+/6wx/orcHzQ==
X-CSE-MsgGUID: vdjTg46dTVaSoTlXAyNEcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80581579"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80581579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 23:18:43 -0800
X-CSE-ConnectionGUID: Zm4fGcZDTAGZW5V63KBNLQ==
X-CSE-MsgGUID: E8PviwPNSwuXIS9R8gkyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="209654949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 23:18:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 23:18:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 23:18:42 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 23:18:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8AmzD+jwCaJnGS6xrvaj+M7qZsyMNdL297la69+lhC7MHEjQWSADrHRUPoEBcd0x2lKgeTzPabm+ILShqXjVHqeIxOHNbeZEWprl7gX7L+VrNQGst8KtC9LzyQRQ3URz+lR3T0dkYh+KtdaBdWzxI/oCsqQHOngrj/8q1BoInByotYL4JezItAKJKaGiWXir2XpkLIw0kfHbqxINeABZQegMlHxoRrX/Pi2XoYz9++YfDw31b6TtGenEsqZaFp/H94+MObVzEu+r3tuKgmNBhcU73Mt47/NtgwrREen3ljMREXoJRK6xZ1fybKVmPp24x/SEP6jV2v00fiDwkPd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNHF9uxPEdHzwIKHZM1/l0FhM3gEW8+Fc9PLEkI1Nqk=;
 b=NBfrOyFFdBvnD9RZn4qrOflPOihw+llrbHHaKUY0Tl8MFznEeL+8/An1ARZOmZz9aNX7H45SXXoxZ+dzMlotwxkTn9Ab+8LCvAPKlnnl/gLf8ecBTVmN2RQewTOT+qj9fEUwK3kUea2Hyo5qJJoUR3tWPO8Z/QHQVJ/vjplwo/meyEs2kNBz5bJVRbWah/ATkZmQJyX6zlOdOuQHn/TXwvqUJoJNpIhdw/m+9a5mmaLroExp6TWFSBr40MouW7BzrtsI/CLWyn/7xs792Bq1mpn2940EwknEbbhZ7409xqDmhssqZpWob31+Ta0FYS4RJ+pWMhyvPH2wNNRsfaSUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 07:18:38 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:18:38 +0000
Date: Thu, 15 Jan 2026 23:18:35 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Ban entire multi-queue group on any job
 timeout
Message-ID: <aWnmS2ZmTqNq5Hhd@nvishwa1-desk>
References: <20260113042913.3517169-1-matthew.brost@intel.com>
 <20260113042913.3517169-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260113042913.3517169-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3453bdf8-a002-49ee-9d3c-08de54cf7822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gN0WmuqHGGwpv07r1O9hwY52EERk5tmp5Hk1X7VU7Cu4rXZcWBJZy2WgmrXc?=
 =?us-ascii?Q?RjyKr5myjMEZvT4uWFexiB5/kou5iw47RkuGr5HlstUDB7qDsG5ncj4cRT/z?=
 =?us-ascii?Q?Mp8ZXTh7FJij7Q6yiOJYkoCo0NCqijAAwUyC8CmE9ejkGJQW+Np3WXVXJAeF?=
 =?us-ascii?Q?rJ3uWY4P/mZtG3VuPopevBRr4v+HqheNMxXrGvM1zdfK0NbYYBuewxTHkMMR?=
 =?us-ascii?Q?xjN1pX0tt4MIOqqmRQxAvlr3kaBv257AcwlIqZmXnTqxrXV9Pj9dH8iiojME?=
 =?us-ascii?Q?pfXl8mlSuWaUDp6Fh/GyIROZMxtMCiAZZd4HVxEelMrj+BDgVRxIufZuh4Sp?=
 =?us-ascii?Q?NtyKVgNFMV6V6sdcBZ/O7eSNT7QIe2Wij0+IP7QsZouLFQCscEKhsog1ayeT?=
 =?us-ascii?Q?gM2oFyY1sapbwXhz6D1Y+VTFTc3GB9CE4Kd4FCuWFmwia4M/TcgNeRA+e8m+?=
 =?us-ascii?Q?SrUMeHPP78v8hoBTddGB7H+UmBDDJO2HaF+b8JVv4kEBegfoKqgjPazlZqT8?=
 =?us-ascii?Q?u+v/6/3KrCKjDMpKzSHPJ/l+edGgVYL1tlyJ0M02y5tFo7S0VKbm4lbYc/Mf?=
 =?us-ascii?Q?NiZPDutgLVjsc+JL1Nad7Dw5EAWdzm6WwGT8SbkY+cU93GjRt9MKEcinf1Xu?=
 =?us-ascii?Q?FpQNBLSZtBbW1fToeyu36P9WrouxiCRjvjznev89+9329oDWO3+n4EgHmkKt?=
 =?us-ascii?Q?EXwWZQF+UZnIfnfoZEG+HKG/3/tzXo1IdufdQrG8FtZ0LOAAmHYxmvJMZ4gp?=
 =?us-ascii?Q?/hCDWY/knFJi8cyzQnXMrOTekA5pTHI15/qIVUiSImg4s30/ylPpZuq9sSfn?=
 =?us-ascii?Q?sHbL5/mi+ZLxljJtYBVX1nvvM8Sl6d4XGFXjaR1L6fvZvWUB4X5DbgTdJY4c?=
 =?us-ascii?Q?FqodT64viP914i7KLjX/jMox32tnhwljOFCwJklUI3chSjWWVL/i3zohiZS/?=
 =?us-ascii?Q?ZzhTCwCy0SYjQoKxqFBLv9TyooisvsmbSgQGXf30aZSWcC32UPuuS5ZfdaW5?=
 =?us-ascii?Q?nfxnWuHD/2vlqcDOP70fqxfLqZHILyYOydYCUgX2ugeHVajSgg4RD/I7mEEn?=
 =?us-ascii?Q?V2XDPuV4nZwlhFZvJRfAZuF1Pho7n/UmP3OI20LnLyOGOFCdtfjio6KT1f8O?=
 =?us-ascii?Q?rWSr7gqek0Hpu977d6p2G5UeGoQHapmOvlB3evhC4Bi1QEhjrceWzfD7Sd4Q?=
 =?us-ascii?Q?W81gEp0Ucn5o+osevsIn7//pmGi1rx0fvak2wKblO1+rsjk7tcchhth1yKeW?=
 =?us-ascii?Q?bCk1R3mcPuR2KMSWvwb2yoqPVI44+K5l6677Ow4pAZErlDx1ocH7uE8TNWun?=
 =?us-ascii?Q?N7cLvihSl2GPVvEg+iR8X4pGecmJrWAF2oYFHjo+d6Xapy68iEmBfxPcn22U?=
 =?us-ascii?Q?fJ3bncjSuqoEonhTl7Sovv0g/6j0nr5Onz6dfVXxpsAgBKmhdE54sGsWWLFr?=
 =?us-ascii?Q?yrjq/DjmArHi5yiqw07gfavNu1ctYdU2RhYRLcoMkYNSrTEmT4FcZZ8FSuyv?=
 =?us-ascii?Q?iAeWxBAGKpKu7UXDDZdkdSEUhdMfTzuStPdjcEmhlK3RPQ2DvRxiaBY35Ixk?=
 =?us-ascii?Q?l7bRNZBYMz4RANPlBZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMUbMDwokZN/Yz5t4TyGQgacVzdUVnqpkuKH9LaN5hIJR4FQ3WWnYiXXL8dR?=
 =?us-ascii?Q?skUpH8Roe0qNU0SiN/BUtNB/HmAxkIVhZKDcrswKNCUXdOOR4ShOZTmEOE6Y?=
 =?us-ascii?Q?tfBWkRv8T/DOI3URiJQZM0Zq8nO6gZJo08Ttik3s/7EVq+JQU5C1778Md+cl?=
 =?us-ascii?Q?+bjwc2R7DI1SDrEA/zJFMtTPN8MrEG+Wi1uNF/bTnTOM89RLFT4k9UVG64Gy?=
 =?us-ascii?Q?bQwY2kYPLGdPZ/gkmRfOdA5hykW0HuIusZKaelg63c88Y6steRJrfKHDZQxp?=
 =?us-ascii?Q?UVNBXGe5ccvIDgYAAFgjhuzt+mrAO3WJpSQlMrWmpAZ8t2V24ezP4hY20r1N?=
 =?us-ascii?Q?NdZd6sz8w4ZRGonDJiadvmCnrPzibXw1TiVkp/Ky81frqq89Yy9G4IV9bVlJ?=
 =?us-ascii?Q?NcgsJC0suwsYaVJzlZfiffwITpVCTWQLlp2vdgnryTVzh+Gafkc+Qql7/jGf?=
 =?us-ascii?Q?99Dv8h9HMD8fHyobon/KIcKYlF4lgNS8dYNI+d4Xonu6pAdkVp7+VPBdHClG?=
 =?us-ascii?Q?xjPdX4/O9eD4FPKiYGKuzFAk+sRR6zXtV+GQOBBe52l1E7M1OJAfBP43t24E?=
 =?us-ascii?Q?0GMO5NcQ6Yp/Phb7Qlm3QpK/XbbyWlG70ElgoLoPFWhlBaZ1+G/WstksFgGy?=
 =?us-ascii?Q?zJxIWKO1a4rHLcEq3f3OwF+VAMIzbCVa401x1tR4KriR6ZWRy4/mT7kFD6iF?=
 =?us-ascii?Q?SDiF8sz+Cj420jUcztvZJ15yLFH09WgCUAafBlxW2cxhrPLOuABa88J+CVmJ?=
 =?us-ascii?Q?9ZcG+bQi5pFw2OwjXVOhyRH0Ptxf8rg9/FC7w2wZ5vYONQmfVEhBWcxGfhBT?=
 =?us-ascii?Q?ObMFztAUNpoA8oyMANkaSvnGYpJZCZ7vETQl2WSOlSL15qpw5Ub0cS+LMQuq?=
 =?us-ascii?Q?N+ritumUIoh5JEFG+Myr5Nw9t0BkeJGRhBICGbKyZdTfR60PKxSydnd2RMFF?=
 =?us-ascii?Q?RIxpGShJE9jAbQxUY1Fhj5dNLy0qqidumexisxA/xNrsqAZUPyQXDt2KJfLZ?=
 =?us-ascii?Q?9BEamahNGeWehRJ+d7Xp5FHlRMndx8YVNDYhqGZrQAWX5EjEqdHdXms0rftt?=
 =?us-ascii?Q?BQcUdWopqKMt5XF7Yh4tr8cil/lEd66Yqquor7nm2GF7uzmh+4iUj4OXZZ0i?=
 =?us-ascii?Q?1dvnZyxCFpkI4gqRseKu8hyNi+gAIu5p3qkMbssHBtc1gjSsDiddHzDRXWwJ?=
 =?us-ascii?Q?1yHc+GKewjTOpoSs4q+huv7YsLXa0sdOC82yquW4aDB535IR41EYXz7J8n6V?=
 =?us-ascii?Q?9icTdW7VswekWq4lXjfnhLMW3RjPfO4JqBXSvveFl/fOEyTUCUPkqIwFpvjn?=
 =?us-ascii?Q?srLkP0AFn+iIm+kb9zyfSJ1WMga9uf67yHoiIl2aR+S9AcZr/ZdOJWGVFrVQ?=
 =?us-ascii?Q?ScqN2oeTyKGvbVF2j2JXGdwq3KJ2LY3qQXdbDzes1NTiplQ11yIxf61YA6jE?=
 =?us-ascii?Q?nhZYU6y9NAN0Jq98S1BOA6AI+zgo0ft1UU3G6oIEk25f4Eiv5ctt15DrtRxB?=
 =?us-ascii?Q?ZvFPtRa2kV4Q8NiMMpWKWZ+l7ysNpRUYp/CyJV+s1gyLbWkFGFpDTHoB8FVN?=
 =?us-ascii?Q?iRtR0srFh2pELxplRjzMX+Js+GDhYqnRBid5wB8zihbF13m6nr9f7ThvnYLN?=
 =?us-ascii?Q?fK29VVB7gY9IeXstxsA8HWvVwP3PvKrBpGzHrviQ2P1jmcI1PTEGoYkv8vgC?=
 =?us-ascii?Q?lmRzpQq5MW6kGP/waVdIA0CwVtAJ/vTsEvbVcbk/wIxue9bJMmo58VRp46zV?=
 =?us-ascii?Q?q9Db47Kgsg8vg4Xky+00KCtZ2HsTHhmukOpRBYOlkaG5d6m5dTLO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3453bdf8-a002-49ee-9d3c-08de54cf7822
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 07:18:38.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhzZGZUNkzhbjtRmc8jOxm0WW9hoVzXFMESCFnyXWQ2ADCST9Ewoncr3umobr5SeK82zuv/s+WJrdvQ1dTa9cX7ZyO/jtJEvxOtN2UpfkF9G2sc1T28j34dZTYXPTNIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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

On Mon, Jan 12, 2026 at 08:29:12PM -0800, Matthew Brost wrote:
>In multi-queue mode, we only have control over the entire group, so we
>cannot ban individual queues or signal fences until the whole group is
>removed from hardware. Implement banning of the entire group if any job
>within it times out.
>
>v2:
> - Fix CT lock inversion (Niranjana)

Turned out it was not the CT lock, but work_completion lock.

> - Initialize new queues in group to stopped
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> drivers/gpu/drm/xe/xe_guc_submit.c       | 103 +++++++++++++++++------
> 2 files changed, 81 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 5fc516b0bb77..562ea75891ba 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -66,6 +66,8 @@ struct xe_exec_queue_group {
> 	bool sync_pending;
> 	/** @banned: Group banned */
> 	bool banned;
>+	/** @stopped: Group is stopped, protected by list_lock */
>+	bool stopped;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index be8fa76baf1d..a11f3e572d25 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -558,6 +558,57 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 	xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
>+static void xe_guc_exec_queue_group_stop(struct xe_exec_queue *q)
>+{
>+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>+	struct xe_exec_queue_group *group = q->multi_queue.group;
>+	struct xe_exec_queue *eq, *next;
>+	LIST_HEAD(tmp);
>+
>+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
>+		     xe_exec_queue_is_multi_queue(q));
>+
>+	mutex_lock(&group->list_lock);
>+	group->stopped = true;
>+	list_for_each_entry_safe(eq, next, &group->list, multi_queue.link)
>+		if (xe_exec_queue_get_unless_zero(eq))
>+			list_move_tail(&eq->multi_queue.link, &tmp);
>+	mutex_unlock(&group->list_lock);
>+
>+	/* We cannot stop under list lock without getting inversions */
>+	xe_sched_submission_stop(&primary->guc->sched);
>+	list_for_each_entry(eq, &tmp, multi_queue.link)
>+		xe_sched_submission_stop(&eq->guc->sched);
>+
>+	mutex_lock(&group->list_lock);
>+	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
>+		/* Corner where we got banned while stopping */
>+		if (READ_ONCE(group->banned))
>+			xe_guc_exec_queue_trigger_cleanup(eq);
>+		list_move_tail(&eq->multi_queue.link, &group->list);
>+		xe_exec_queue_put(eq);
>+	}
>+	mutex_unlock(&group->list_lock);
>+}

May be add some documentatin for this function why we are doing this
list copying (ie., about locking requirement)?

>+
>+static void xe_guc_exec_queue_group_start(struct xe_exec_queue *q)
>+{
>+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>+	struct xe_exec_queue_group *group = q->multi_queue.group;
>+	struct xe_exec_queue *eq;
>+
>+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
>+		     xe_exec_queue_is_multi_queue(q));
>+
>+	xe_sched_submission_start(&primary->guc->sched);
>+
>+	mutex_lock(&group->list_lock);
>+	group->stopped = false;
>+	list_for_each_entry(eq, &group->list, multi_queue.link)
>+		xe_sched_submission_start(&eq->guc->sched);
>+	mutex_unlock(&group->list_lock);
>+}
>+
> static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
> {
> 	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>@@ -1411,7 +1462,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> {
> 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> 	struct drm_sched_job *tmp_job;
>-	struct xe_exec_queue *q = job->q;
>+	struct xe_exec_queue *q = job->q, *primary;
> 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	const char *process_name = "no process";
>@@ -1422,6 +1473,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>
> 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>
>+	if (xe_exec_queue_is_multi_queue_secondary(q))
>+		primary = xe_exec_queue_multi_queue_primary(q);
>+	else
>+		primary = q;
>+

The xe_exec_queue_multi_queue_primary(q) already returns 'q' if it
is not a multi-queue. So, we can remove the if/else here.

> 	/*
> 	 * TDR has fired before free job worker. Common if exec queue
> 	 * immediately closed after last fence signaled. Add back to pending
>@@ -1433,7 +1489,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		return DRM_GPU_SCHED_STAT_NO_HANG;
>
> 	/* Kill the run_job entry point */
>-	xe_sched_submission_stop(sched);
>+	if (xe_exec_queue_is_multi_queue(q))
>+		xe_guc_exec_queue_group_stop(q);
>+	else
>+		xe_sched_submission_stop(sched);
>
> 	/* Must check all state after stopping scheduler */
> 	skip_timeout_check = exec_queue_reset(q) ||
>@@ -1448,14 +1507,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	if (xe_exec_queue_is_lr(q))
> 		xe_gt_assert(guc_to_gt(guc), skip_timeout_check);
>
>-	/*
>-	 * FIXME: In multi-queue scenario, the TDR must ensure that the whole
>-	 * multi-queue group is off the HW before signaling the fences to avoid
>-	 * possible memory corruptions. This means disabling scheduling on the
>-	 * primary queue before or during the secondary queue's TDR. Need to
>-	 * implement this in least obtrusive way.
>-	 */
>-
> 	/*
> 	 * If devcoredump not captured and GuC capture for the job is not ready
> 	 * do manual capture first and decide later if we need to use it
>@@ -1482,10 +1533,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	set_exec_queue_banned(q);
>
> 	/* Kick job / queue off hardware */
>-	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
>+	if (!wedged && (exec_queue_enabled(primary) ||
>+			exec_queue_pending_disable(primary))) {
> 		int ret;
>
>-		if (exec_queue_reset(q))
>+		if (exec_queue_reset(primary))
> 			err = -EIO;
>
> 		if (xe_uc_fw_is_running(&guc->fw)) {
>@@ -1494,8 +1546,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			 * modifying state
> 			 */
> 			ret = wait_event_timeout(guc->ct.wq,
>-						 (!exec_queue_pending_enable(q) &&
>-						  !exec_queue_pending_disable(q)) ||
>+						 (!exec_queue_pending_enable(primary) &&
>+						  !exec_queue_pending_disable(primary)) ||
> 						 xe_guc_read_stopped(guc) ||
> 						 vf_recovery(guc), HZ * 5);
> 			if (vf_recovery(guc))
>@@ -1503,7 +1555,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			if (!ret || xe_guc_read_stopped(guc))
> 				goto trigger_reset;
>
>-			disable_scheduling(q, skip_timeout_check);
>+			disable_scheduling(primary, skip_timeout_check);
> 		}
>
> 		/*
>@@ -1517,7 +1569,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		smp_rmb();
> 		ret = wait_event_timeout(guc->ct.wq,
> 					 !xe_uc_fw_is_running(&guc->fw) ||
>-					 !exec_queue_pending_disable(q) ||
>+					 !exec_queue_pending_disable(primary) ||
> 					 xe_guc_read_stopped(guc) ||
> 					 vf_recovery(guc), HZ * 5);
> 		if (vf_recovery(guc))
>@@ -1527,11 +1579,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			if (!ret)
> 				xe_gt_warn(guc_to_gt(guc),
> 					   "Schedule disable failed to respond, guc_id=%d",
>-					   q->guc->id);
>-			xe_devcoredump(q, job,
>+					   primary->guc->id);
>+			xe_devcoredump(primary, job,
> 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
>-				       q->guc->id, ret, xe_guc_read_stopped(guc));
>-			xe_gt_reset_async(q->gt);
>+				       primary->guc->id, ret, xe_guc_read_stopped(guc));
>+			xe_gt_reset_async(primary->gt);
> 			xe_sched_tdr_queue_imm(sched);
> 			goto rearm;
> 		}
>@@ -1577,12 +1629,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> 		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
>
>-	xe_sched_submission_start(sched);
>-
>-	if (xe_exec_queue_is_multi_queue(q))
>+	if (xe_exec_queue_is_multi_queue(q)) {
>+		xe_guc_exec_queue_group_start(q);
> 		xe_guc_exec_queue_group_trigger_cleanup(q);
>-	else
>+	} else {
>+		xe_sched_submission_start(sched);
> 		xe_guc_exec_queue_trigger_cleanup(q);
>+	}

There is another place below where we call xe_sched_submission_start()
in the TDR. It also needs to be changed.

Niranjana

>
> 	/*
> 	 * We want the job added back to the pending list so it gets freed; this
>@@ -1962,6 +2015,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>
> 		INIT_LIST_HEAD(&q->multi_queue.link);
> 		mutex_lock(&group->list_lock);
>+		if (group->stopped)
>+			WRITE_ONCE(q->guc->sched.base.pause_submit, true);
> 		list_add_tail(&q->multi_queue.link, &group->list);
> 		mutex_unlock(&group->list_lock);
> 	}
>-- 
>2.34.1
>
