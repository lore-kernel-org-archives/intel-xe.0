Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24833ECD6D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 17:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB1E10E03C;
	Wed, 11 Feb 2026 17:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFdEWQcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3341C10E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770831882; x=1802367882;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=koa/6L8Ml8VLg8ZexFw6wyZTWVvAui10Bh5q0ct9nnI=;
 b=EFdEWQcxHS+uyTHhg8S9zgqFYMfpc8r95R5KBzMFTfgEoXyCm4gCkP1D
 IZIKBs5bTMlVFN4gAuZYN++s/KCQ6pYJJ2lQI37w7ZT+2sYAKfSk+vnrs
 U3Y7wo0xSgr7wDO8MSv/J3IisD0lbx59699i0gdYkRrh17s8dZXtLgrGz
 TtUnp9Mi9UQHxwfSr0nLcAgAyE/yiluqeRPs/gBtcOwmtHVq8DA5jwTy0
 ZnWDw9ExJ6TByE3EUWyO8rD8CEnxdLfm7KnNP5d+dIrZ8OORAEKWbXJqD
 7sRKQshPRBkscneM+02NAQA/Ar0THqQBX176epXXoDH09WgSWFxYYpYSU w==;
X-CSE-ConnectionGUID: 9yWW79oJTgO9FNuwIF603A==
X-CSE-MsgGUID: 2qMgjpR1Qx66DkYyHcptxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75834734"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="75834734"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 09:44:41 -0800
X-CSE-ConnectionGUID: F3KA+EGZQQmsPAVUzH0fLA==
X-CSE-MsgGUID: /cs7cc5+Q+CtL5Hf0V9o/A==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 09:44:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 09:44:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 09:44:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 09:44:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzVS2SVFPEGzik9u2v44uivYE3OtLteFKSIc5vuxl3CVkE0hW/Y0EJLd+8aVER2udtJPOPMYnK3Fb66kjfIhk1sOOO7aPJ11BgU+Ixo88IUpNnNOu/6jhcUK3SDqRuBwhmXMi9yY2F25ALXSS24Mz0h/7Ee3ycxpCBbZ4l9W5/cngq1z1x7RIkYr5EGYeaVRoaoK/XUD74qFVo2/+UvLoJ80LNLDf709HcwnQi+cNQKm9JlqSiPvrSkmh1CKCCYfqua/xDCXcyFrUBWpLrqBMRwNA72ceC7Vw8l3rU/bxbWy1gtyRerK3m+LOQFA5PS9EwkTC/mbA7Ri/cGDN5U6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oqQDlFi7tn87kMEZA6zbvssPBVaZWQPIVnlSs+7OoY=;
 b=jh1IIcdlzFZhaJG/vnnROciTra0Wgd8I1km4uk0KiH1ZM1SohzVu0z4sn4213zFoWpWhlQ0Pkt+HSI1Rn78tzsHPYhr88h4PDnBtZPOlFq1bWRsioRRqs7ULsDHhZrxdQtpEGEKInbNj882pj5l3LfFCFyPjOxn0jpXC4Nrp80B29S8xmWnNUNwiUMQ82UVYW/ew/MTATRsuhSsgUjNaxMqAKDDxF+5se26/3dHRaIfek4Z5tU1fkTool509pI8kjGZUWvy4iOBS9u8KFikJzWJSaRmjnRH+EnQMpfT0wqt6dDE9ZNU7ieZIQVs7J1rDxijFklBF/X+ld40z/iljJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 17:44:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 17:44:35 +0000
Date: Wed, 11 Feb 2026 09:44:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel
 internal VMs
Message-ID: <aYzAAT1XLIpPyxBx@lstrano-desk.jf.intel.com>
References: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d39799c-e3eb-4800-3a1d-08de6995388c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gTJQ2tx8sypsXLiaCBlXv8sLbIJft/ynaEKv48v7lH703D5hlP53Zb7lPm?=
 =?iso-8859-1?Q?y+H9qGPTTnMfxws5loxGYIO4OFhQGcQ9NNmcC5S92FSLk+hbe71Wq8m6vJ?=
 =?iso-8859-1?Q?AIPKBKXbb3iR7aJ+k8mniHpBSRHfX+6xLWeCAFwaL00WsYyJVYW/bEn3++?=
 =?iso-8859-1?Q?/ZxxEBwLVARHKFxPThjxazyrzk3QY2fM3FeQM53zk9yX3pwPHGJB4xjtGG?=
 =?iso-8859-1?Q?oyCB8GMGxptneUGmFYdSzGDoTo+NmxMb/c4dAnCCkx73ea/BkfK6cKKd1j?=
 =?iso-8859-1?Q?wa9fElgrha7r1vMARFxLEQ/szfNOALVeYK2R+Eewrs5fCG+uUptkt/OYP2?=
 =?iso-8859-1?Q?UsA2txSWUlJJ2gD8FCIwfm7BiZ3/hL4TGJyre2Z4vwj9OSlyjE1FM9QwQF?=
 =?iso-8859-1?Q?sjfuKbFcaCMWE6iO5p2DrTx3Dlv1aGtKPeoSAyjWnHZhgB3LWwrjwjcUdD?=
 =?iso-8859-1?Q?5ZWTOH9pLIeYHXr4a/Cac7UD1MLgpboJR7LEczYibCI4u32nyft8EIGDL4?=
 =?iso-8859-1?Q?ENGLDdqEHAWvpi7I8g9/PiCS2rHtlkOwpHnaa0jnJkEuefVg9FZQRSsvyT?=
 =?iso-8859-1?Q?hJ8sn8JryzvR0vB+YkGw0H6CREnmFEB4RVmMbamUuYyo1HrNyBpSiD/YVT?=
 =?iso-8859-1?Q?+KI2AzFufB9zj26dn5l4JbMVWi+H5/easEimdgyPXt1gd1TWg/z+nIQ/ln?=
 =?iso-8859-1?Q?rLBy/J+1uigeyagu7x8qi4Ui86JnIii6yMWOmjO0VmpfMQZoxox0XSqbSz?=
 =?iso-8859-1?Q?HLoQzJmL+Jlioofa0mf2+BLqmIbxqB7g3gBjc+QR+JX6cpKYDMt0UfVBFI?=
 =?iso-8859-1?Q?3QdmQUEgmz+PHy9R5gupWQFco4PmGc6eFz/61boNpVKwXYoE6mv/kzAxqe?=
 =?iso-8859-1?Q?jOZWE/+c456Y+lEmOFPpLjtRLfktt1RQwgU21+r2I8v9QH3c+fhvCp7+bf?=
 =?iso-8859-1?Q?Fgw0apC9HnRlrLCAeupr1bQLAEON6Nkgqfb2bFuYjctMqNYV4lk2dH30P+?=
 =?iso-8859-1?Q?MZ6sJWxSjZo7Y+Nbfb5OVtCyVApRuDuOEgfjTSspKHHLLfKf/w8yWeoGWb?=
 =?iso-8859-1?Q?BlITIknsMXc2iujrZZ8MguA4Hn9so6ilzPHDbvKzjx2f5pzCsYNu12moKt?=
 =?iso-8859-1?Q?u4wV0tV5xAOwtoLgzPcgQ5iyDhP+oBRzsDNqDhRXIrfPrzYBNgmCONnIGu?=
 =?iso-8859-1?Q?d9vevG3xkSAQWX1KX0gYadU4VspHM4XJmGcz89WhbHJ14jzKkbZW3ruoBr?=
 =?iso-8859-1?Q?vXAAnykZ2iZoczk+ASStEI0a9IffPEa0Km0EAPcIFP0iuK6iZN/ddu2nrJ?=
 =?iso-8859-1?Q?7LWPeotwJJxZ0Sx2mPghYBGL9Dc9DnTVeA9UMBCJUdhs1xDqgdj7wsjwcR?=
 =?iso-8859-1?Q?chMLAbZJXeAcgQwyViGWNPYGb6qy84o6AS3OCOoXCx2/T//BhejJLfcwEA?=
 =?iso-8859-1?Q?uhKpkgtBu2kRaUVP3ENApaTIJbjf5symyEWoDaWIRzm9UI55MCgZfVtg9O?=
 =?iso-8859-1?Q?wUJp6dxC/+eWxdHsHd+5f8vDnpP8HOk8D31gUCRLA/aOYzS3nz7VzlgoB/?=
 =?iso-8859-1?Q?0+2kvCtNTkVoyBLAlWzQRwgqpxp8q1s7CtJ/02maZHqHmrKpfvuPyH5pOO?=
 =?iso-8859-1?Q?dAJ7izWvy4peM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rcw7o9kZdfijnTAcKp3x6FYDZjVlKsPidgWo+KXDy7Fu0kbE3x5/cpACV8?=
 =?iso-8859-1?Q?l5sblX9yR+c5EZl1bvyf3GuJ0qnlwdYRbNqx5qshX/MUw7ol2dap7UcaHm?=
 =?iso-8859-1?Q?O1tkmlAv+YkpTLS7n/uqmUXKNr7tQI2lSOcg/NH5Upj3D6fOQ88l6cDhOb?=
 =?iso-8859-1?Q?/S6+sshensv78Z1xwKnP7MOY7Rf5uLNE7mBipPq61g/z8WkNNkwfC/Qlq9?=
 =?iso-8859-1?Q?MLZMZf6Av+Ju9PvXGF68Q4R0S4K/WV++Ar3fw386kPB0RVlk82qVtUGWKE?=
 =?iso-8859-1?Q?Q1+pjQQen3VcGgkGsPOfRbE3UWcOv6mPfVazYfpbVAQXef7wpvJZp1/SvL?=
 =?iso-8859-1?Q?slI7PQkQ7a4nqLKpz1NN2WBnJ541hY3sophZgfBxnOzj2WbaDAOdTS+7ug?=
 =?iso-8859-1?Q?TuVCRQEUQDvqKBz2u84qapS/2QQfmx/K3rtZxxdFiR9/CXhOJ/LKlNNhER?=
 =?iso-8859-1?Q?Kiio/znhSfDqdB4+BKYGhAOWpdTlvyoh+lHcX8w8lNVaX1bLxeqAzN6s6d?=
 =?iso-8859-1?Q?92VMKOQsJuFllWH1872uPc9QDt0tvnOcY3MDsIsSMUKnWkPmwsUUeBpjmu?=
 =?iso-8859-1?Q?4OB8tXn3L27/UG2uhFhLty+4Jqg5YFsjFPE9PQYioKVGQkTfI1SeNAs9Dl?=
 =?iso-8859-1?Q?RDR8msZLx79EuVCWHmok6i3T+OFcBRj8ifN9T8IsKrnU+oczgbFev6gUcF?=
 =?iso-8859-1?Q?w+MIL2OrUgn1Odm6MqRTrCJ4vOLKuQdMRZnKXToWVoIyG9k57h4R++fOnK?=
 =?iso-8859-1?Q?P3pdBrBoKXPb6oOySoTB4CUplYtUOuldro2mtkvfH90m7Px2sBozqim01G?=
 =?iso-8859-1?Q?5qc2RSWi8O89iP50epAZUHYgHoPEccyFBjsXNk6UlBgIiUk2nGDGoP8Ryh?=
 =?iso-8859-1?Q?1MnciQED9h2YnRG6YG+g0UqBMPZ4TApw7xd1Rg2PqFIKmnaSRSz2Zaem4C?=
 =?iso-8859-1?Q?vLjmEVd/G37eswVu5ZRagmGWOoiNfLjd3Ag4kN8Wn0H5OvbUp08NdkFGuS?=
 =?iso-8859-1?Q?9tU6NOVsfojcZCh3DjVpIULWv8dxEhpnujJjEleMFopGycMarCMDgJ6Ohd?=
 =?iso-8859-1?Q?Fcku4H5MLI0/xoCR+DLB++oR+g5Bg6pyDN0OnzRPVM9wOiKobAOqCUwURs?=
 =?iso-8859-1?Q?EImwtKfzUahi4kbu9pW9Gj/fIOqpHePG58ab1tgL54jAIzlp3Vf6V9v2lX?=
 =?iso-8859-1?Q?2Skn12NqK3Z6AXAgmLQmSPrWdj7mcs/jgKiABr1khkhJSaCi2a4OAVJGme?=
 =?iso-8859-1?Q?HCM+Srv+nSeyU9RsgpN+SU2tJr+pWuXwVFt4t7XuSnZfBsILgUzTI5dxZP?=
 =?iso-8859-1?Q?syno0ZOhCHQQxGiKJmlPJAmpgCpNFlRt81g8Wj4KVBTz32xka0JWfmEkAp?=
 =?iso-8859-1?Q?sz+B38ei+HL6BPEirNrSUnMlgw1dR3hyJ5l3cBU/9TCAHCxvhP8whndy0z?=
 =?iso-8859-1?Q?v7uChJQ/T92Koi0A5Og3rs6gyjJtSnwU/MFcR4MuIUYknb+zxAvfi6LFOI?=
 =?iso-8859-1?Q?Yzz1SvEHoCu7ylFGb4HuvTNXrtdNIzqWF/X4z+B8kdNnEdCkwS/KkDWylU?=
 =?iso-8859-1?Q?Sfblmras7fQU1+DlgEfhyunxL1x+0y1AdOf03Q99CX7WaSioGZKneB7K8u?=
 =?iso-8859-1?Q?MLwfO6i/UTi/qAyJ0Z6Nt49DzzRXhjT8OSVmnYK29Vx6Gst6/3qSd+Co3r?=
 =?iso-8859-1?Q?dBZ98aDBS4k+fOfz+HKyeJyyFByy+3h6iXHnDraYLzPETdc5MtR808CvUb?=
 =?iso-8859-1?Q?5LzmzUWKaB0AyYVgwOjDqomFi7LBlvB5PsHW+WnLcreET3s+iFdaOKeXPR?=
 =?iso-8859-1?Q?yAi5rOvasg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d39799c-e3eb-4800-3a1d-08de6995388c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:44:35.5560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06aWYEw5rYPr7TmZn6aINRdGaXgDFKhabQzX1ZDb5rwyQW6DMAiCH3ypLFvoKSHDHVaRgUmROwjrx+P0uXOfLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

On Wed, Feb 11, 2026 at 06:14:41PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> VMs created without an associated xe_file originate from kernel
> contexts and should use kernel exec queues. Ensure such VMs
> create bind exec queues with EXEC_QUEUE_FLAG_KERNEL set.
> Let's ensure bind exec queues created for kernel VMs are always
> marked with EXEC_QUEUE_FLAG_KERNEL.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8fe54a998385..708e8c7becf8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1657,6 +1657,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  			if (!vm->pt_root[id])
>  				continue;
>  
> +			if (!xef) /* Not from userspace */
> +				create_flags |= EXEC_QUEUE_FLAG_KERNEL;

This LGTM, but for completness we should probably remove setting
EXEC_QUEUE_FLAG_KERNEL at all callers too.

Matt

> +
>  			q = xe_exec_queue_create_bind(xe, tile, vm, create_flags, 0);
>  			if (IS_ERR(q)) {
>  				err = PTR_ERR(q);
> -- 
> 2.34.1
> 
