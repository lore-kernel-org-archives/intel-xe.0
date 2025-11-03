Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7BDCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 18:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7AC10E201;
	Mon,  3 Nov 2025 18:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPAkcblH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4A610E201
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762193223; x=1793729223;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=017HOhBm/R3FH/7t1t1D5xr30fsJCN2U/4GYm+re/Sg=;
 b=IPAkcblHTpU+0/RPV9bpyKEyxiJidjRwx4Y8SQN+KLlJ5wOdzzuQX+uA
 0c10d8EC7VeA+IoBlFs/dKsYjl3lUVyzHQh1OWz+TT5tRFgjMUK9weGyO
 jQsTqCtaJsHVjSZ6oZvEKnvH6E5EFOa5PUCiWvPMtOaM+VCLtvRBDYWiD
 LNng+hBMxMuELlPqVuU1noPrbRaPo0O/ZT8csrcjd2C7ESVvpDDvfhBjI
 lzw8Ew8gcaO2VvoVssxt/9rmrNPRSXkmA0BBqvS2W4fJbLqKU2apm61R0
 lwt0E0+la7zm972qUd6omPuvKFGiVcHvAPgPME3Q+/Czo1AHjHJ8Xoqsc g==;
X-CSE-ConnectionGUID: GsVXie9kQcW1oHG7OAoj/g==
X-CSE-MsgGUID: +56z3pUgSGSzjjJzp99JVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64195018"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64195018"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:07:02 -0800
X-CSE-ConnectionGUID: o0ZCV4kiQ6qelTkPnuWw9A==
X-CSE-MsgGUID: ruA8GHhnTA+TVFSRDa4gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186620967"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:07:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:07:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:07:01 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:07:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4T7oihEa2CD0c6cdfTcW6y5W1kv7tCMHfKfg5aa0dUSLaYdjeRTksBkOWjLUGiFHIxTJPU6PpRv96GS8R4MEGS+QwzZ3GgpqnYmveOwDkFYhJjKOhOl7qirDMI/J0qRpLApNTdTK8iclBqwjNjWGG/YmkHETTcOJOQjgjlYDd5MPUmHovnoOJUB2Ppfrx+4na/YqS0vhT/82odSjnxVDr7c3SuRxwATEYVSRU9S/G5yBIAdXvQsChuqwMxwb3O69MDmeFgb9NSIP4i0I8g6IMUXD37tB8DIDugl8Fx3e0Qqk4Ga7ONlPPesn+LCJEBz4Ff0Yt0GffI1i9dqaeSgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrAWw2pG3O21Jxk+7R/OgcE3hsoOkAPnSbqdvEJiBS0=;
 b=gP/VQGhutjhfLhh6MycQrVruUJGVaYYTFAR1Sx0f+lfvfhDv2S9p4HWCRnmJSGLYmvdhh2fa10VbEi5Tmy6OuSUqf5ENHw7BhrN+E/rsyfvQPGPObIdTR5KBnDGDAM7xgk7vePwUbVCa3dfUdWMpsQxdu5pnAz+U7hHl2pUcdY5AfQvee0aAw3tjFZU5rwt/M8yGToNHuHP/T3vQb9I6PHsT/v3TJKb+2oKk+waAV8KsNlUGHGEaP4+gpjj825RRshlNoONFnMLhkO+VlQ5KVGZy8OyeepQ92bWYKMhmPtyH0XajoRk2VcSEUR2+JJHqnBBgCab1DdcpiElm5O2oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS4PPF7CCC4B437.namprd11.prod.outlook.com (2603:10b6:f:fc02::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:06:59 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 18:06:59 +0000
Date: Mon, 3 Nov 2025 10:06:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQjvP4ma43Y72JmU@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
 <aQaWcP/ykkycsx51@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQaWcP/ykkycsx51@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS4PPF7CCC4B437:EE_
X-MS-Office365-Filtering-Correlation-Id: 086e63e6-b496-4946-0977-08de1b03c812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UG4yuHii94shNQ7ynpVcoHEccHYJXfR3umb7FJsxvdazepzkahG+hl0vd3Ry?=
 =?us-ascii?Q?OXcpCiNWRj3gh4wC35an41z3E/YB4pqSSc2Mft99M/JKKj71gTPK+cIN+/zU?=
 =?us-ascii?Q?9g58AUW3ERKeO/lNFIPUNTA98r4UoQhLyrrhNBx/LDEaiepNI2RdQc39EfYD?=
 =?us-ascii?Q?qsaB1EZBIs0WfRvVPuKr66sxmMbfN3O4G33Jgq5CLItM46eagshvRTBq1rN5?=
 =?us-ascii?Q?gMnwyPGnZ6IttbJbWEQEJzUaNJCJ4X6A1IabGFV4SziOVqLgFL4wydJIJSBT?=
 =?us-ascii?Q?Q0t/UDhNG2widzErv5lzHv6y783VHHxRikZm/dUoJ6MByyljbHlRSOZ/eW7C?=
 =?us-ascii?Q?2rqqV0QQkl+yMwOHjfQIy0ItGj6d1ODJ8OzFMeNRykPZ7IFruzz/NjBjK8E8?=
 =?us-ascii?Q?syUMkzPOH0jXxbyQ7o9aLixXAKnNUBfwNHPbVqe/lJtL36BpT5QLg4x6AcyO?=
 =?us-ascii?Q?61/dCOP6+IoD1qD4t6p7UARCmNwIYxZU7w7cmKwIaFJ/2bsYUh8QyNLIuny6?=
 =?us-ascii?Q?69eHDmdszNeX2pBZTTIDXFzgjcQKmiLWiE7ZK7D5o7MOWzEH/081C6UOJqj+?=
 =?us-ascii?Q?pEkN65lFzTCO+0VWk3sUNTYl9vPEvlxRtiDeX6O62t3axlM4QIC1UmoTkVFA?=
 =?us-ascii?Q?x39lJ9W+ouVFay4+D4V7WqqEgFdyIDE0FQt/h4HNV6QhOcWyCGbFlLAOAKTh?=
 =?us-ascii?Q?yIQECeBT2YvSVH6Q6+64ntzq2mHACt5jp0O6FtLCHc1D5cUolQ+vdjkHfkqd?=
 =?us-ascii?Q?FFiCv0zILZwfN1LFodXRl7jmv2yU6rRorhyAvuTQnZRVFNPQqLlvKZR43e+T?=
 =?us-ascii?Q?YXcLi2MBP03Fg7kRzndYwePEZCwBDUkl8Za2GL4oVrwDOBLfC3i6JkqksK+t?=
 =?us-ascii?Q?rv+qygm1LENEeZuSnFrLXgbAGGKYrHVivCJoO+gbMNRz7GLbtUR/3bY9EDp2?=
 =?us-ascii?Q?Cfrq2fxlKNQoqruZW79X23KeZc+SiULiFiYrVWczQh/nazpgDhvzznI+xON1?=
 =?us-ascii?Q?mcBe549S58RqPPra1U0IEgApm4IPxbInk0beed5GQjKKSltcVX1Ltls/1LXI?=
 =?us-ascii?Q?0tPfuD1XfTTKFsHZI95z9hFkfswmBlFrtvF6vktrG0T85Xae3C5+YrQaeMMd?=
 =?us-ascii?Q?BuJZBOII/e1JhaCwvDfvMdUzalBcqY/TlzQMIzUtSmPWk+hbny20T/B0AxDT?=
 =?us-ascii?Q?kJlw5JM4rkt6s0tKxT3noaZq1kM5SqoB51zrFpGYsJoc7l4PPs7uSOSd1Sxu?=
 =?us-ascii?Q?A3wAeqc+kVTWscqn4VU80SvBXtKgJof/bIXxX1z8KMmMImhG1nVuWUCP9ZlH?=
 =?us-ascii?Q?4UTHjBfF2AQLefLGlT0FIwuDXdl25mNzrHgiBCioEsR7QuaHXnRDys+siEi6?=
 =?us-ascii?Q?4C67jqbqtXxAr9IDukKikdrq06qd/dmpPeG6ui8lOsq32DgGSPQdnZ/Vp1LM?=
 =?us-ascii?Q?F6zha/0cjkMgTluofA9x+Mp1T244t2u8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIjCEpN3zWLaw8fHidXUaN6ToPzD0JfCMevaxxdu7iTVpXmlJ4gBW67OXl2U?=
 =?us-ascii?Q?y1lUVW9kXgNzQl6HaMPjOgTTYjTVQVHUxPI5W3gJScPtVSlLsA09mZYfI0MQ?=
 =?us-ascii?Q?srRez9aNnnrTgj8ooNpD4Nqh93Rbz1oMb5d+DTAzLO2oRlhDGEfZB7lOeGRg?=
 =?us-ascii?Q?SBuLzpW3zt22/wh2bjo6+0xOGRJOQRNuhBKpgyeLsJSIDYFvR0L6E4BAKuDK?=
 =?us-ascii?Q?w39oNSCYvhpV0Od92YeHWaqttxMmP0p7X0jyCQEPQSurQck8bMMqHiKStPlS?=
 =?us-ascii?Q?daRX1CiX5j5TKReMgqp3WdZgA0IM5P/1Yo2xNEWvIt0I5swAWm+nzizF0olm?=
 =?us-ascii?Q?1uVvtpBaORqXwEW9wtF7UmUmWyk/6WQSzvqbFdEtdPs384m1j5fqEHaO3etT?=
 =?us-ascii?Q?QkzZXm8apFZDWuD1c3z1ZnYZrEmcz4NPk9Oja03KTECzXyrEwnFeariMCrSW?=
 =?us-ascii?Q?O8MvUznsaij+Rt3/FMBMWp/rrsJrSCD2PyLYNJiX1yj5rCtK3sHirJJnaV5m?=
 =?us-ascii?Q?4KFwy69TrEkO2gUEtAHtvF0oN/nWa3t9C9E9hNcIREF8u/j8PlDj9L11YfIq?=
 =?us-ascii?Q?3eKEP08h1v2Y+44yWZ8VvjJTc1VXaHAtWFT1nGfMglFr5nbZfdiZJb5ZL1Bp?=
 =?us-ascii?Q?FDrehanlgxQXCPXoIP8HMbWRAt9YMaRRMvu6loPlo5QKwU/nue7/itefCTUS?=
 =?us-ascii?Q?U5to6N7FKqb5PmBn1GXNi8UgSIsOsF/fRNHY01spFNq0c894E7v4dkVYvV0U?=
 =?us-ascii?Q?hdDnVMTSeO9KVDsyfn3I87itYGBNN9HBh8H1iyv+RAj0PbXEqIewASQA3J26?=
 =?us-ascii?Q?GCFOHKICXzwja7e/oBQre+r499WGABEpNgr+HK3ChpVEEJ6xPNwnuOLAs2zf?=
 =?us-ascii?Q?XZENDbXzbxVc1VpkcFocT35NL7hhIVaW8lTDyG52l4gEQP4vIpkhRKQg0ylk?=
 =?us-ascii?Q?fV1J25zM5qpkV45Q0DgoSCUJq10CmrJLqdtGz137YpVH/j9MLglaRKnOq/Rv?=
 =?us-ascii?Q?17V7xl7lWqNG8ml1ZTecPZJySL9Qij4pAZW+FPi3B6BEIHObc2E1mQU/v84u?=
 =?us-ascii?Q?5xLSHLZVvo7DtQf9CogM/J/g6iE3cw7tCAmj6IJQxcNee9RDX2wNviS2Lc7h?=
 =?us-ascii?Q?hWH/ZfD1oJwDgytiBTiqrW3VfdXye4xhSZ8gJtKTolJo1p8ZnPUlhD6e0UYY?=
 =?us-ascii?Q?NLzzdtieDL5fEH4VPcaMpiMDGPBYPVsKyHXOaSENMcKissBI0j8cFt9RyviY?=
 =?us-ascii?Q?NuCPDxoNe4G59DZ5pqSPOv+WMj1eSnvJ5JlmGuLQMxarO1QVQRkJhH4w8r68?=
 =?us-ascii?Q?MxSz7Xk/iUbqW4Z84+F/H95Y0dmN+nU0GyKJfEhS1UuHxCUS2efhlAlFBCNG?=
 =?us-ascii?Q?QGHWc2r0x22jUuLQPPfmLGa9/vEl0g9M/KSrP6YWSG/kNGoejt1wmaioSdCE?=
 =?us-ascii?Q?4XloiuWlq+BnKDV6J8Zgv/NDlLUJad08v1SU3NnK8vwoNGkhlu0jvt0UYvcn?=
 =?us-ascii?Q?2bFjsZR4KQJY7Yq2Sok09Q6KhktNiPphvkg/RuEQyBgO5U4NKRT1qirM7EHW?=
 =?us-ascii?Q?30SyqAXE3yGkIdI3W5O2R42ayRUu9EzeugOiI1g60RkNawLUchotpXe2/sqD?=
 =?us-ascii?Q?yMXVv3ZFIdxEhGCmzhvAhZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086e63e6-b496-4946-0977-08de1b03c812
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:06:59.1919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fs2Xpj1KhQmIuzECnXMvmwj7FA2I9++rxCz9uhtoJ1vxUYkd8bMzI+B2C5BNPqlm3bn41fQgIzJnJTpiPLv5oU5dI7yzjRE59O94vIYZB0uN6HVSE90Zk9JCEaCNO3NN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CCC4B437
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

On Sat, Nov 01, 2025 at 04:23:28PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:27AM -0700, Niranjana Vishwanathapura wrote:
>> Support dynamic priority change for multi queue group queues via
>> exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
>> the drm scheduler message interface for priority to take effect.
>>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 12 ++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 56 ++++++++++++++++++++++--
>>  3 files changed, 65 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 0264cab00fd4..98f8f1c7f13b 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -729,9 +729,13 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>>  		return -EINVAL;
>>
>> -	q->multi_queue.priority = value;
>> +	/* For queue creation time (!q->xef) setting, just store the priority value */
>> +	if (!q->xef) {
>> +		q->multi_queue.priority = value;
>> +		return 0;
>> +	}
>>
>> -	return 0;
>> +	return q->ops->set_multi_queue_priority(q, value);
>>  }
>>
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>> @@ -760,6 +764,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>>  	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>  		return -EINVAL;
>>
>> +	if (XE_IOCTL_DBG(xe, args->property !=
>> +			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>> +		return -EINVAL;
>
>This check looks to be in the wrong place. There are other valid
>properties, e.g., DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE, etc...
>
>I think CI is complaining about this too.
>

Yah, as you mentioned in other patch, currently only the property
DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY can be dynamically changed.

>> +
>>  	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>>  	if (XE_IOCTL_DBG(xe, !q))
>>  		return -ENOENT;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 964a0e6654c7..dcb55b069ed8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -241,6 +241,9 @@ struct xe_exec_queue_ops {
>>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
>> +	/** @set_multi_queue_priority: Set multi queue priority */
>> +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
>> +					enum xe_multi_queue_priority priority);
>>  	/**
>>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>>  	 * multiple times in a row before resume with the caveat that
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 5ec144c1c2dc..426b64ef8d99 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1761,10 +1761,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>>  	}
>>  }
>>
>> -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
>> -#define SET_SCHED_PROPS	2
>> -#define SUSPEND		3
>> -#define RESUME		4
>> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
>> +{
>> +	struct xe_exec_queue *q = msg->private_data;
>> +
>> +	if (guc_exec_queue_allowed_to_change_state(q)) {
>> +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
>> +		struct xe_guc *guc = exec_queue_to_guc(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>> +		int len = 0;
>> +
>> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
>> +		action[len++] = group->primary->guc->id;
>> +#undef MAX_MULTI_QUEUE_REG_SIZE
>> +
>> +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>
>Just to confirm - even though multi-group priority isn't part of CGP
>rathe the LRC, a CGP_SYNC is needed?
>

Yes, it is needed. I think guc will issue a lite-restore so that updated
priorities take effect.

>> +	}
>> +
>> +	kfree(msg);
>> +}
>> +
>> +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>> +#define SET_SCHED_PROPS			2
>> +#define SUSPEND				3
>> +#define RESUME				4
>> +#define SET_MULTI_QUEUE_PRIORITY	5
>>  #define OPCODE_MASK	0xf
>>  #define MSG_LOCKED	BIT(8)
>>  #define MSG_HEAD	BIT(9)
>> @@ -1788,6 +1810,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>>  	case RESUME:
>>  		__guc_exec_queue_process_msg_resume(msg);
>>  		break;
>> +	case SET_MULTI_QUEUE_PRIORITY:
>> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>> +		break;
>>  	default:
>>  		XE_WARN_ON("Unknown message type");
>>  	}
>> @@ -2004,6 +2029,28 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>>  	return 0;
>>  }
>>
>> +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>> +						   enum xe_multi_queue_priority priority)
>> +{
>> +	struct xe_sched_msg *msg;
>> +
>> +	if (!xe_exec_queue_is_multi_queue(q))
>> +		return -EINVAL;
>
>Minor nit, I'd move this check to the caller as
>xe_exec_queue_is_multi_queue is available there, then assert it is a
>xe_exec_queue_is_multi_queue here.
>

Ok, will do.

Niranjana

>Matt
>
>> +
>> +	if (q->multi_queue.priority == priority ||
>> +	    exec_queue_killed_or_banned_or_wedged(q))
>> +		return 0;
>> +
>> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>> +	if (!msg)
>> +		return -ENOMEM;
>> +
>> +	q->multi_queue.priority = priority;
>> +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
>> +
>> +	return 0;
>> +}
>> +
>>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>>  {
>>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -2095,6 +2142,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>>  	.set_priority = guc_exec_queue_set_priority,
>>  	.set_timeslice = guc_exec_queue_set_timeslice,
>>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>> +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>>  	.suspend = guc_exec_queue_suspend,
>>  	.suspend_wait = guc_exec_queue_suspend_wait,
>>  	.resume = guc_exec_queue_resume,
>> --
>> 2.43.0
>>
