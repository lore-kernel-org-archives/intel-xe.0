Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FE0CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 23:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3610E4D2;
	Mon,  3 Nov 2025 23:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iajgX2JW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D84910E4D2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762211221; x=1793747221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zra2+YWF/vro36zEewEric9htJb4/z6IC0XLK7cZIpQ=;
 b=iajgX2JWmUQw7Tk6w8AoYjlZO70pWolo7Bg6gjBSbgXoMUPP5q/RajT9
 rxIypM4g/S3X+gFWykNYRX8dKFJ17BmWlcytDUZqRF4vWsvGuvXrWbXlH
 CbnIxUw94kC+lYJLLnXZ7pAwyPCBpIIRQ+iT/VtznzLnFymfNVF1a4lTT
 sjByvb08f2SNB1sQgFnaicykThQHKi+CaM1kU0biYOZzv4YhN7ImeuMtF
 P55SBS1y1J+2yeAhQ2gy1Xa0Zr0TNOLA5VaqNc9/o9kkjWP+Wlwp3RaLd
 rdHXOrtlZ7B3+S7Thf92amzLabEDaT8JCGvvQUmpYSemFRt2nVHZillqy Q==;
X-CSE-ConnectionGUID: GSZrI2z3QA+69vn6SFQfdw==
X-CSE-MsgGUID: JPitrqA6Tqq+96ilhR2CqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64224738"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64224738"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 15:07:00 -0800
X-CSE-ConnectionGUID: TbzetNFtTcWOtcVSTLRJlQ==
X-CSE-MsgGUID: kIBXLQieQ3aPrAEmJW93bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187144950"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 15:07:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 15:06:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 15:06:59 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 15:06:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNb4wh5NlZInrUYyHQGqAMlV5vMLMtfOvTMgElFS6HWbTn+ER8ygY1tHdEQsFdWUDFfZdXJa4vTSxN09U/HfN3ob0gcUkwszGXGXwL7nqENSgYuBVTzWdvgDWbw0UPF3qcdPyW5vULAbYBuCWUkxjFOWlI2Gql+P/QLBiZ0yHXrEpfRhbiw3UCBKE7rm/d9vhiL0eD9juuYaFId2D4nEm2xndgX8yCMT3PZ60EKxdpBDeDMf10a5L8rPXo2ipSuwUzM3p3aPj3KOwn+J4N4w0StWza6oKoP4vVDDJn0MX95hdCetyZUugy1tTKH1cmGI1DyZDSjPdKp3bW/sa2JDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+77PTQFc9WABSbmiUBpBRJ97q+J5qDVWIlXEBTNngFs=;
 b=E+mHSwF8Y1T0Ca6vAN5NGhEKrtyrd8X+P9orq+9bxmRNKqbWWPTAsYUUqG71b6dQ5F0gdBAr3X7yaSggvPZZDA41q7VsZacmdzE+GMZ9ntYPZEplWG9FKHQXloofBvKODVl0p1tsq+4I52lmiT+qyMSaj01XP9/A/ycEIoLT8UVDPmaXCHnuDFc5INN8PNwjukf+xomowGbgHeECLOFIu7GNvu/w8OWsLA/x4bIacS/uYoqSnCnhjYBXVkfSlKBR/Js0r0C69W9OiVq+y6vXjxXW2H9mBLXjx/AtTJ+g4hvTH1snPivpB7Hlcegmokunmc2dsY8JczTMDlPcwHLXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 23:06:56 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 23:06:56 +0000
Date: Mon, 3 Nov 2025 15:06:52 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/16] drm/xe/multi_queue: Add user interface for multi
 queue support
Message-ID: <aQk1jDtuKlUHPP0O@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
 <aQeW37i2h0UdLkBx@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQeW37i2h0UdLkBx@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN0PR11MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 17af658c-78fa-4371-3efc-08de1b2daf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJ0b/FBatFtRsjJmz8ac+IvhLz2sgRV4sQ2BQ/8awIIiQz88v/XUiZVwmmWp?=
 =?us-ascii?Q?Od+ep35LZmU9qhLZkry+gHO+ZxyBSga20TvTprbQARS0lqy6pEbDjcVUU05G?=
 =?us-ascii?Q?9a9iSiUPmWBcihoci1p5YHnuazkXmDE8T8KWr7uVKlWmt0QByvvypTNmS0lc?=
 =?us-ascii?Q?EJQtyqj3p/wbZuC6Vmql9e1T33NMxk9gd4vIgIFpuBw8VYdLQglX+lvtv14f?=
 =?us-ascii?Q?ZKbo2mCkNpwhusAF3it2IFX3Qzwb7c/cnIaesf2EN0+UG/lnGGq4OKI62bmu?=
 =?us-ascii?Q?sIqX4raM+8Yr6su6/xy/SVyroj7jrb+oybj/bD/N4Syq9y/fEd8zdeu+FWAN?=
 =?us-ascii?Q?w6pxLWwZ2PWxieh/3gQskEEiG6AeTRV0S2fMKhz4aUMc/tGpCJklTRyRpHCq?=
 =?us-ascii?Q?KmClQiNN7AyQr9ihBc/qJnfugy7tt0ypGx3FcBovp2oW/NvsP28JFtrW7BC3?=
 =?us-ascii?Q?dyzzu7sW3bbZLo/10p4SzXlQWqmIqSZB55A7HVSR5/I2HbeCnN8k0M1yLqoQ?=
 =?us-ascii?Q?4pq5y9ArrmzhaRKtQXLiSNG98b8nQFzJt7AKik4jmC6RvLd8itHnb3pn1If6?=
 =?us-ascii?Q?Ccbb+77VCPYc6lykCkwHDVbFqIdxWcs1rHYKzE7pEKUoIdP+qdsKunRiMV7t?=
 =?us-ascii?Q?2y46PUzvVC7pXyT//vYN5OWZAeHPKeSQgRI+CgDEfU5mO2S2XJnTtnWv50GJ?=
 =?us-ascii?Q?uHrJi4ehxIVBtHjf9wOCghTyLdw4Qo+m5uVF0ml98Srv41Vo7Wpi+fvtkDAG?=
 =?us-ascii?Q?DsxZSMUbGZRKuFbMP3WFeeIOHTn8WY0Oi5HosyktL9Z1taK3tOioAab9gkei?=
 =?us-ascii?Q?nffL452spwZu1xEFw+NZ4cAkGkQK5ZgNVBZ0aq700Skt/LNT8Qd0ydMQ450R?=
 =?us-ascii?Q?OnBN0GjxHIWuWhVuomrp1B3cfmDy9hpP4/D+xJIi8gZmq+eDPVWxbIklxKgq?=
 =?us-ascii?Q?9i6fVEjWrtsIKuxEdKqR8XjNhDQGDvxRh1LOFTxlEwn99/IZai/SAiP9mG0L?=
 =?us-ascii?Q?gMYnpG+c3n9tLgELt/hA2pCtcovfq+WlNPMZ+VoKuxQuTOljmSdXNqhynkNg?=
 =?us-ascii?Q?fmAX56du3XL9NshimCBnJj2LzeoD96qacSZK3O/qHTAhFgBwZpWxPNOkSWUX?=
 =?us-ascii?Q?+bYUZ7uncS79X8a/FHcB0JbLyqqGZ7MLkdCi11C5nqCZZuPf4s4O8ccYs/Rd?=
 =?us-ascii?Q?KZurpe/fXh9AOZkQjyWqoqzNvsDdpPFf7y8iPq0I1B1TjnaXBQdlu8nVRD+/?=
 =?us-ascii?Q?qjdKEFoOJYekU8jTCTG4/xQvl5HCEc5ZZqn1eEqPRgad9uz+YrkmVfvJoGiv?=
 =?us-ascii?Q?HoRx45xxpOSKvvMChKeQrzF/PnXigHstjVryObKNtjqZ/VFuI8IhLG891h4R?=
 =?us-ascii?Q?mRRNBlFSFx0bKBHZrUiKarPhOUDoDRpyC52wia84uHUvdSABCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M9IgBiFJg6Q+ZpK9Hmm6qmOipLNreM6ylm3mUQpOxCig6W6htYc62M1N87wH?=
 =?us-ascii?Q?zlf74JZEQri7vBVqGdNpWS5tIV8RsmMKQopmp8E2sqluF2puzkJrKB2VRgy/?=
 =?us-ascii?Q?IWgeh/lFxjmvGYh96cGRWeTvQGS8NW4BMcCHqTVpVdj4NraUqE8DSiAtsFbX?=
 =?us-ascii?Q?CDXgg83UBPbo5aYwT5pJbtL3RLq0y9tScLfL/OE+KeM0v22TpgknySBMhyZZ?=
 =?us-ascii?Q?l0XRT4ZovnFKKmgfwC+Gt6/EgdfzRt2bsUSSJ6OhHcGVmP9MVxKKevxjbPzk?=
 =?us-ascii?Q?pjRqbIxkKrv3fR0PiQ5HoZElBbhTcRkzOe8g6r3kb5veN+bRBIFnKARdR7Lz?=
 =?us-ascii?Q?BliARkCFK39/hAOPQfRIf0MXL6f1GfjpiR6Nwk2z1C3YArpOlqD1ayA/x7Vm?=
 =?us-ascii?Q?VnOQAnUirmtysUssD0GQgGiTNinaHNx16WUee1DkkldKWspdqr+1G/H+X60J?=
 =?us-ascii?Q?ZIlBX6LNBPs5xUsg8RX1HU9QeLMw82uv38tNcQBFhSR4ZJ+jWHrl6X3NleRM?=
 =?us-ascii?Q?hzhveST/zWI9GZ+hQPEpKMAeaEr3ZwAU9FJCM1mE577nS8m+5T/e1zI5UUzM?=
 =?us-ascii?Q?aWdCp9nyfJVZOIPpuvI4f5rmDX7Jl3dR1yN5XBDuOk78hpcAcBgRVsT5tG48?=
 =?us-ascii?Q?ANq2pNOEzjFMBwxF7lhGYIH2Q3nARj+B0IQeZ+XEYt7pIPpTtkH89TPA3ooC?=
 =?us-ascii?Q?UrWCZpq0sm3L09Obh2XmiTHL5Ln/0Qyqjh1loCPit1CTXY0p77WS/qM+FqYK?=
 =?us-ascii?Q?WHZZcbLVPdnN/xsY1K2kk0rFC+n6P6BwxGxeMLYvj1J4sBWMoaWdToJ1RYL9?=
 =?us-ascii?Q?EINOgi5G/B/JG++MJA7mHF1Gxl8/NkVzrM4GpXsfZYMAWoGnqqs89qufUVZa?=
 =?us-ascii?Q?5emCYYiBK4I4W5LGD0TCirJ+G0rxxffXlLry4tyqkG2bPtLjzQNv0u8iJsLF?=
 =?us-ascii?Q?Zm6yEOdvWI105qb0MBH9wzAJqUD4TJvqt2GtPq3WuVJxjD5Xym+opOecJhRl?=
 =?us-ascii?Q?lHBpi9vT48f2xLgGn2JIt5JcsHvSx/3SXKPZSuBgesIzMQUX0IBAu9J3uNJq?=
 =?us-ascii?Q?xR56oTvgfzVMj/je9B7RfCh3HUI7Kd9hte7aroEeTTybpRarZWfTCWoZ9O8n?=
 =?us-ascii?Q?Mw1cUMXz+t1w55YqQCnfgho+8DSgFXHIvkDIvvO92jREYR2R2mi8YlYKu6V9?=
 =?us-ascii?Q?jgHV5cm8yuXirmq0RLefGo3iGjM1K34fmuupVyZpvO1n1WbJGqS/BK6yHjKS?=
 =?us-ascii?Q?qtb3Y+C0OTv8JjIV3i4WkbkbIci7vxnyixeXAW1dGCdnyeGA1x1UYkxi3Lvi?=
 =?us-ascii?Q?ziXVBP7QR7NqiVeFjx53qLNo1OuJybHFh6d6v7Zapvd3LDp1ZrM2zNJjj47L?=
 =?us-ascii?Q?2SEEgQyvtlei72E1w66b6UkbKeAJsyX+tvc+eEtwHNvvufo8UyK3cch0xRIY?=
 =?us-ascii?Q?bh7M7b80D/fUMqW4wz+YTM6gJAfV1l/yibe8L/T7vfvnZ9XaLpQEjy1TERhA?=
 =?us-ascii?Q?oLRAHmcEIUavkgz4Br37jUrBKIVveojjxRmT7X3sm2cUNmqgtARxuIKv5JC+?=
 =?us-ascii?Q?X2gC06WIM75kezGEOTbdjArKOOg5YC45US6muVTw/uVT6xMbq6pGdWULiS3v?=
 =?us-ascii?Q?Q39A+zZwT003S+ObXh25kt4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17af658c-78fa-4371-3efc-08de1b2daf57
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 23:06:56.4192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy6JpND+Ig7lqAbR1z+ccV41OXcWf5XjoEO/l6CmqpiTrivDmzu/kX94ENTkTiB+YP9kqJUxulG9t5j3CS2NjWh8tR6JjX78OAZoIw6uRktAqqpGvkwvV8np5RqyAxRQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
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

On Sun, Nov 02, 2025 at 09:37:35AM -0800, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:22AM -0700, Niranjana Vishwanathapura wrote:
>> Multi Queue is a new mode of execution supported by the compute and
>> blitter copy command streamers (CCS and BCS, respectively). It is an
>> enhancement of the existing hardware architecture and leverages the
>> same submission model. It enables support for efficient, parallel
>> execution of multiple queues within a single context. All the queues
>> of a group must use the same address space (VM).
>>
>> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
>> property supports creating a multi queue group and adding queues to
>> a queue group. All queues of a multi queue group share the same
>> context.
>>
>> A exec queue create ioctl call with above property specified with value
>> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
>> queue being created as the primary queue (aka q0) of the group. To add
>> secondary queues to the group, they need to be created with the above
>> property with id of the primary queue as the value. The properties of
>> the primary queue (like priority, timeslice) applies to the whole group.
>> So, these properties can't be set for secondary queues of a group.
>>
>> Once destroyed, the secondary queues of a multi queue group can't be
>> replaced. However, they can be dynamically added to the group up to a
>> total of 64 queues per group. Once the primary queue is destroyed,
>> secondary queues can't be added to the queue group.
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 191 ++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  30 ++++
>>  include/uapi/drm/xe_drm.h                |   8 +
>>  4 files changed, 274 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 1b57d7c2cc94..86404a7c9fe4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/drm_file.h>
>>  #include <uapi/drm/xe_drm.h>
>>
>> +#include "xe_bo.h"
>>  #include "xe_dep_scheduler.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> @@ -62,6 +63,32 @@ enum xe_exec_queue_sched_prop {
>>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>>  				      u64 extensions, int ext_number);
>>
>> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>> +{
>
>A little incongruent with xe_exec_queue_group_add/delete as those
>functions are blindly called + check if needed in function, compared to
>this function checking at the caller if multi-queue. I don't have a huge
>preference but I'd at least make the call semantics consistent.
>

Ok, will fix by calling xe_exec_queue_group_add/delete only for the
secondary queues.

>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +	unsigned long idx;
>> +
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
>
>It took me a minute to figure out where the associated get on the
>primary came from - it is from xe_exec_queue_lookup in
>xe_exec_queue_group_validate. Can you comments along the lines:
>
>/* Put pairs with get from ... */
>
>/* Get pairs with put in ... */
>

Ok, will add.

>> +		return;
>> +	}
>> +
>> +	if (!group)
>> +		return;
>> +
>> +	/* Primary queue cleanup */
>> +	mutex_lock(&group->lock);
>
>As discussedi [1], group->lock not needed.
>
>[1] https://patchwork.freedesktop.org/patch/684847/?series=156865&rev=1#comment_1257408
>

Ok

>> +	xa_for_each(&group->xa, idx, lrc)
>> +		xe_lrc_put(lrc);
>> +	mutex_unlock(&group->lock);
>> +
>> +	xa_destroy(&group->xa);
>> +	mutex_destroy(&group->lock);
>> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
>> +	kfree(group);
>> +}
>> +
>>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>>  	int i;
>> @@ -72,6 +99,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>
>>  	if (xe_exec_queue_uses_pxp(q))
>>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		xe_exec_queue_group_cleanup(q);
>> +
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>>
>> @@ -549,6 +580,148 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>>  }
>>
>> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(q->gt);
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_bo *bo;
>> +
>> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
>> +	if (!group)
>> +		return -ENOMEM;
>> +
>> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
>> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +				       XE_BO_FLAG_GGTT, false);
>
>XE_BO_FLAG_GGTT_INVALIDATE | XE_BO_FLAG_PINNED_LATE_RESTORE are needed.
>
>I believe XE_BO_FLAG_FORCE_USER_VRAM is needed too, that's new so not
>100% sure but I'd check the git blame on that to figure out if it is
>needed.
>

Will add XE_BO_FLAG_GGTT_INVALIDATE here.

Looking at xe_bo_create_pin_map_novm() usecase in xe_lrc.c looks likes,
XE_BO_FLAG_PINNED_LATE_RESTORE and XE_BO_FLAG_FORCE_USER_VRAM are only
called for user bos. There isn't much documentation for these flags.

>> +	if (IS_ERR(bo)) {
>> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
>> +			PTR_ERR(bo));
>> +		kfree(group);
>> +		return PTR_ERR(bo);
>> +	}
>> +
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>> +
>> +	group->primary = q;
>> +	group->cgp_bo = bo;
>> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> +	mutex_init(&group->lock);
>> +	mutex_init(&group->list_lock);
>
>See my comments here [1] the list lock being initialized here, but
>used/destroyed in [1].
>
>[1] https://patchwork.freedesktop.org/patch/684850/?series=156865&rev=1#comment_1257596
>

Ok, will fix.

>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->gt->info.multi_queue_enable_mask & BIT(q->class);
>> +}
>> +
>> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
>> +					u32 primary_id)
>> +{
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_exec_queue *primary;
>> +	int ret;
>> +
>> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
>> +	if (XE_IOCTL_DBG(xe, !primary))
>> +		return -ENOENT;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
>> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
>> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
>> +		ret = -EINVAL;
>> +		goto put_primary;
>> +	}
>> +
>> +	group = primary->multi_queue.group;
>> +	q->multi_queue.valid = true;
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +put_primary:
>> +	xe_exec_queue_put(primary);
>> +	return ret;
>> +}
>> +
>> +#define XE_MAX_GROUP_SIZE	64
>> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	u32 pos;
>> +	int err;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		return 0;
>> +
>> +	mutex_lock(&group->lock);
>> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
>> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
>
>To consolidate threads [2], add quick inline comments here around ref
>counting.
>
>[2] https://patchwork.freedesktop.org/patch/684847/?series=156865&rev=1#comment_1257594
>

Ok

>> +	if (XE_IOCTL_DBG(xe, err)) {
>> +		xe_lrc_put(q->lrc[0]);
>> +		mutex_unlock(&group->lock);
>> +
>> +		/* It is invalid if queue group limit is exceeded */
>> +		if (err == -EBUSY)
>> +			err = -EINVAL;
>> +
>> +		return err;
>> +	}
>> +
>> +	q->multi_queue.pos = pos;
>> +	mutex_unlock(&group->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		return;
>> +
>> +	mutex_lock(&group->lock);
>> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>> +	if (lrc)
>>
>
>I think here it is an assert if lrc is NULL? I don't think it can be
>NULL unless there is bug somewhere, right? If so, let's do an assert to
>ensure software correctness.
>

Yah, will add assert.

> +		xe_lrc_put(lrc);
>> +	mutex_unlock(&group->lock);
>> +}
>> +
>> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> +				      u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
>> +		return -ENODEV;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
>> +		return -EINVAL;
>> +
>> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +			return -EINVAL;
>> +
>> +		q->multi_queue.valid = true;
>> +		q->multi_queue.is_primary = true;
>> +		q->multi_queue.pos = 0;
>> +		return 0;
>> +	}
>> +
>> +	/* While adding secondary queues, the upper 32 bits must be 0 */
>
>State this in uAPI doc too.
>

Ok, will do.

>> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
>> +		return -EINVAL;
>> +
>> +	return xe_exec_queue_group_validate(xe, q, value);
>> +}
>> +
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>  					     struct xe_exec_queue *q,
>>  					     u64 value);
>> @@ -557,6 +730,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>  };
>>
>>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>> @@ -577,7 +751,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>>  		return -EINVAL;
>>
>>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> @@ -626,6 +801,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>>  						  ++ext_number);
>>
>> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
>> +		err = xe_exec_queue_group_init(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			return err;
>> +	}
>
>Any particular reason this isn't in exec_queue_set_multi_group? Or
>perhaps in xe_exec_queue_create_ioctl? It is bit goofy to have in a very
>generic function here.
>

xe_exec_queue_group_init() does group and CGP allocations.
I want to do that only after all extensions are parsed through.
As extensions can be at odds with each other ending up in error scenario,
I think it would be good to do allocations only after extensions are parsed.

This code will look much better after the below patch in the series.
https://patchwork.freedesktop.org/patch/684848/?series=156865&rev=1

>> +
>>  	return 0;
>>  }
>>
>> @@ -780,12 +961,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>  		if (IS_ERR(q))
>>  			return PTR_ERR(q);
>>
>> +		err = xe_exec_queue_group_add(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			goto put_exec_queue;
>> +
>>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>>  			q->lr.context = dma_fence_context_alloc(1);
>>
>>  			err = xe_vm_add_compute_exec_queue(vm, q);
>>  			if (XE_IOCTL_DBG(xe, err))
>> -				goto put_exec_queue;
>> +				goto delete_queue_group;
>>  		}
>>
>>  		if (q->vm && q->hwe->hw_engine_group) {
>> @@ -808,6 +993,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>
>>  kill_exec_queue:
>>  	xe_exec_queue_kill(q);
>> +delete_queue_group:
>> +	xe_exec_queue_group_delete(q);
>>  put_exec_queue:
>>  	xe_exec_queue_put(q);
>>  	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index a4dfbe858bda..8cd6487018fa 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -62,6 +62,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>>  	return q->pxp.type;
>>  }
>>
>> +/**
>> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if the exec_queue is part of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.valid;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is primary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.is_primary;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is secondary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) && !q->multi_queue.is_primary;
>
>
>&& !xe_exec_queue_is_multi_queue_primary()
>

Ok

>> +}
>> +
>> +/**
>> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
>> + * @q: The exec_queue
>> + *
>> + * If @q belongs to a multi queue group, then the primary queue of the group will
>> + * be returned. Otherwise, @q will be returned.
>> + */
>> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>> +}
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index c8807268ec6c..3856776df5c4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -31,6 +31,24 @@ enum xe_exec_queue_priority {
>>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>>  };
>>
>> +/**
>> + * struct xe_exec_queue_group - Execution multi queue group
>> + *
>> + * Contains multi queue group information.
>> + */
>> +struct xe_exec_queue_group {
>> +	/** @primary: Primary queue of this group */
>> +	struct xe_exec_queue *primary;
>> +	/** @lock: Queue group update lock */
>> +	struct mutex lock;
>> +	/** @cgp_bo: BO for the Context Group Page */
>> +	struct xe_bo *cgp_bo;
>> +	/** @xa: xarray to store LRCs */
>> +	struct xarray xa;
>> +	/** @list_lock: Secondary queue list lock */
>> +	struct mutex list_lock;
>> +};
>> +
>>  /**
>>   * struct xe_exec_queue - Execution queue
>>   *
>> @@ -110,6 +128,18 @@ struct xe_exec_queue {
>>  		struct xe_guc_exec_queue *guc;
>>  	};
>>
>> +	/** @multi_queue: Multi queue information */
>> +	struct {
>> +		/** @multi_queue.group: Queue group information */
>> +		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> +		u8 pos;
>> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
>> +		u8 valid:1;
>> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>> +		u8 is_primary:1;
>> +	} multi_queue;
>> +
>>  	/** @sched_props: scheduling properties */
>>  	struct {
>>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 47853659a705..d903b3a55ec1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1252,6 +1252,12 @@ struct drm_xe_vm_bind {
>>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>>   *    runtime PM will be blocked while queues of this type are alive.
>>   *    All PXP queues will be killed if a PXP invalidation event occurs.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
>> + *    or add secondary queues to a multi-queue group.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
>> + *    then a new multi-queue group is created with this queue as the primary queue
>> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>> + *    queue id is specified in the 'value' field.
>
>s/queue id/exec_queue_id
>
>^^^ to match names in structure.
>

Ok, will change.

Niranjana

>Matt
>
>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1292,6 +1298,8 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>>
>> --
>> 2.43.0
>>
