Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D823C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95B910E2CC;
	Thu,  3 Sep 2026 16:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5AvoWD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FEB10E2CC
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788453067; x=1819989067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+us+NyPP0Xio64d1wYW8PDxIh9DycUmzl8nfKo0XROQ=;
 b=h5AvoWD1y4CD5Ri2Ee6qPiUnT66SqLh9AzqaFRvaEFZkFABRxtpmgsVt
 elhK25nPaCUdlDJbguygDOP1oERELC74ZaUuL5y9wZ5YUcMYW6X4DiZP7
 +8WCmxkXF7JRmo4rYynZ39fmsaZedC5MB03KTz8auH8afe7kHFeNjSvlS
 3iOoddmnPt3jnSHfbSxWAlra5ER1+PgA5lxNcjazCl3va43rYyde1mAr4
 7dX/5/xdzZdbOtj0ul5bqicIOt2Im2wdI8g/NPw3aRjwwK2z+QAd9t2Sn
 pQDkt71fF0AMjmd3/jf19WKsj5cWKpAZ8Z0JbZvshHvAAWgyOs4/VcbfX A==;
X-CSE-ConnectionGUID: E/GbjCucT1qO//1lQ4FqHQ==
X-CSE-MsgGUID: lvhDoLk+RiW77mmZSNbpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89064208"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="89064208"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:31:05 -0700
X-CSE-ConnectionGUID: A+CdJ/f7SGS+aiQrm8jW5Q==
X-CSE-MsgGUID: 6GpaevHvS8OQ+zt1sBz4+w==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:31:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:31:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 09:31:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:31:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEy/kq+gywoL0VppoHrPfNaNDZO5q54TyXDMeQtr/X/9YBp1eRp+SjwLNiNZcwhGpxgi80MFHugfb47wr+j1ZUvO386//ezKV4SiIIViyqKwdF4K8qqZC0EHVHzgDjB9UCz/h0tk+y5GR0chcfL8DwxRyqQIQ+lZehLuDnmDzHS6XOT06HgzUGM5Nor3ke2TvpAY60do8VBJJgdxAu90m8ptZ/UVqt5JTC72VAeHvJ2jnCQ7n9wBjix7UvAb4t8QmAFNt3Ea/cOrVjJnv8km0EMRbVVGBLA9R1FUuRG9w1iF1svcJuOIZA/sOBIdn1lNBaft6NephMezfYseRqcNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vmQbMgsoDA3LMK2xJlJL4C/W9nGcYnt3U6FLpcf8aA=;
 b=R+FHmqsxYRCPz+MMEJFCyvbxQRxuEjPQd3uU/W4y4zDU6BOCVKG/HaGagQx9X/xEXMBRw3qKmx7gTVFvL9Cog7quZiRZxdcSJZp6/xxZP1DUAp5fkF79C/s0tkWhw+lamsifQbd/Ae/W54xMgAzrEIHxISG0+icWEeWi1lS9Pe5X9rIMM7kK8USbfoWgSkWjZdrqVOJ1Iv1C9ZB0a5wxgf0MVcmvhVNtPIWEUPreLNMsi+roKW/BG9RV5F8h51A840yBu23JOPKRD2IEALwaWwA+5iyTv8m0p81V5iRGB2XJ1KKXu24iPVy51wEC5A5y6ZwZinb967S44y9ALv2gYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS6PR11MB454219.namprd11.prod.outlook.com (2603:10b6:8:4c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:31:02 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:31:02 +0000
Date: Thu, 3 Sep 2026 12:30:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <matthew.brost@intel.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <gustavo.sousa@intel.com>, <jan.maslak@intel.com>,
 <dominik.karol.piatkowski@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v10 00/27] Intel Xe GPU Debug Support (eudebug) v10
Message-ID: <apmgwallbRKwJf2k@intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS6PR11MB454219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbabbbc-42b3-4a31-4e09-08df09d8be7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|6133799003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Sv8t2PviVbDtiZds+xxuni5IZa6i2w1GH71QGrrq+p2M7k2rHKzxAInQHu7Xt1Fs3DLtl8qmKSmDRQtO5wMQr8QOPiXxNLDwM7blNcq4ZuuGzKJhDtV7Z1mHU1Xc4wt/lGR9QPdYNA313mKc/d9dS4ZbwB48YKp69GHH0hRRl93jZttoCqbc0aU624p7dURIJw/cwNH0p3sYCrYYhU/+nHGYVAbJrLR5wRA174NN/uvZAvQA2Cstbeib6e5kevWUevnyXb26Cgh0VHTNxmEVK+0oDWF2+mzcHNbBXRgt3hmzRXRo54rqUvuf+vaLAJDNIA2E/qFc6GK2kEJbcTjXjA6bIP+GzsUbjoB9gJO+Qu8BU4HF0QjFepwjLH+PLj7i632xgxkz7tBhxx98ZbxRPqF3LWlhtaxkYFU3SW3RIN4p3884fX41yf8Mmy1pip9yyLOLbmUVHFE+slKznAPYwbEzhGqiGZwJ97o3jSkebt2YakAeGPJfGt/VaxOKNseQQXBwTskqiJmx+Csc0EoUoQTFsbPld0TPR/TttNRCnN6U69HMRFCkUKW8VQ3NVWzYqXXMhr2hYDudCtobQ0H7cnrzdLA99y90Pn8Thr7IMMB574tSxZpVg0p8tN3mjG0Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(6133799003)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NI0bDC8QXRHAJQYRjVkvUHizUxETUvNHAX07o2j8lbgAAr8DWI6zo1h4P11r?=
 =?us-ascii?Q?y3llRNgcDt6dXRXlZcrhKcE6vG1+DpDhyzsQwRPre55Tkr3adrvG/j6HZqeB?=
 =?us-ascii?Q?V1tvIpww3XhvKPqibo+uAm3J93he2BlXefAfIQF6RzEffDGU9OgQIIUSd02r?=
 =?us-ascii?Q?7oNs2+dGNXCEw+z09cF0LxcdoUMgXnN1jYGog+SrY2Yc2/IK7I0cGrhTuMOS?=
 =?us-ascii?Q?gths0gEWioeYAslbeJ1UxgEPtfMj5+CgiLJX88EiVxx0n4Xt2A1No7QB98WV?=
 =?us-ascii?Q?U7wx7TbrX5ZxQlFgsblgdzr++A90xQ7WW/zv0elPgg0dz63rBLQgTJn/LDEB?=
 =?us-ascii?Q?OwS8KRY0GnQJlIeSK0XPbdkrvRNEEjrsLF6m1qDX5J0vZ7BIA+Yc2iC9F0mY?=
 =?us-ascii?Q?N3T1HTvorXg5uo5XGuHqTtL0ZlWooZKvHiCcHZg0orRX9K9LCk1PlNRjNtEb?=
 =?us-ascii?Q?Djk1+28tTuPD/S87Jb8eUuZQD52LjfRyF1OJMFn1Sbiji5Mep77eNZ165R33?=
 =?us-ascii?Q?WCezYFu1Um0ZEO04x2cjenOCr2MzSKLeeR2flV2JG1ZDYd+vq7UEG37a0nt8?=
 =?us-ascii?Q?uwNndSOXSXR/YqA5WNab2UdykoPNrgh6OCLCyvf1YrtLJ4glOCLu7Hz1WElo?=
 =?us-ascii?Q?LHJtSVKBQ4g1CKH9eX/g6LzDPCMJhRATiO4DTC6DXICUI4p37+832+Cxy4iE?=
 =?us-ascii?Q?GWceR0cFNZi5ezs59kFrTSJtUZM6n2hcwd9nYtm02ZOOzKpIkn6YEBv8KytB?=
 =?us-ascii?Q?HDXufLjMn3j0pbdJbQOhbwlfb2QpMhuCUZtl/rL/f8UOVwtqqSW5BORxj29+?=
 =?us-ascii?Q?kMXLp0YD/UuvTkHpAexRiK38uPHen27pS+JWmdUEkUYd0qNAoUTyNLCFyvK8?=
 =?us-ascii?Q?40F/GlHGbmmBdYzNdGJEhnirq05k1TbcwLJtBBJ8nRf+LDIalC+0s5Bm9GDQ?=
 =?us-ascii?Q?1qZu9r3nf7yKn4oOM1IMLQqlNyjyJoBqYo5kmV8D9yL5Zo2SkHm7ERVlCnHh?=
 =?us-ascii?Q?xwMnA8heC/oNd8eAn7BvB8kw+msPWoXzFkm0r6BYY9R4y8t/aZKEkd2l3WMZ?=
 =?us-ascii?Q?p+nmbMzBcT+AOINdvIUeK9Wzs/FfqJ2C6c0krxcQCjFAGWiqMQOSwJ6LjZ9f?=
 =?us-ascii?Q?tKvClkI+9XegXMiHSFjMt6MZ4OdaJWJXr3PVGrMjOfydK6Rm+DaTsRLGQPPB?=
 =?us-ascii?Q?E9eaDIaSKpRL3AIYla/naN0F7SBj/mnRpJMQAETdf5GI1OIyEIkYmmjhgSsn?=
 =?us-ascii?Q?dVNsbgNmwW2M8CRmJc7Dppq/e8YOZFEaqvOVo1m4ba2xxFCOvL+9vsdc2arV?=
 =?us-ascii?Q?BisHEgXSeE1eddDWS0VnmpyNX3Xjls02hNeEbc0GBfL3RP+uQ+5ULtDa3LoA?=
 =?us-ascii?Q?6uCPeCiX4efgDG9vccS38XJgF7/WTs6BtosMa97zoj6oreZtGmj05clyMkkf?=
 =?us-ascii?Q?XP1zqsjNso2H6znc41vouzgCZa8YPe6R9qPPZxzDo5bU8dHUIKrEG6j0GBs5?=
 =?us-ascii?Q?iB4Qv78uT4fQHNT7FC3qYhiNm+7SomWSBvS/yXRiW8JGWHp0FHWT91blGFw4?=
 =?us-ascii?Q?zlmrewb5vJZmXF0mU64D39Wiv5oU9KDNELCD3jGbM6lOb8TwZUpBaDz1zi9a?=
 =?us-ascii?Q?limVa8Ebu7y61hFH8kxNxvDI7YehR63BDGHG9HPPwMoXWD6jquhpuSdQu+Fo?=
 =?us-ascii?Q?oM2BoMYDLk+Gsie+G8cJeq23GOek7wJ3BSC0/WcYskkbzzWWD+iM80l/yZpR?=
 =?us-ascii?Q?/FIXt4oySQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Dgp/Wo2INOjWCEVOauVumZTyyVDFXZZSSozxSO75SXvWVuOsxeTkTDRLTjXjsWaXxDBTftz9hZGyFgctpY48aqT9VzxNiT0tbfTaMyW1pi3IVgKvhZpVRbBjf4U3Lv1q4odzsJOKe98hNhkpHNz+q/W1Nn9Vor2Q6PzP7S5Y10BFw9wIfHRVS13N/MpKaJkoaV9Z15AVobjgTQTbMHKkXKfgS0S5UEs5/SAM+rsqYnfIMGREt5xrOclEfuMtB3J+C6ByJ2buztgdsPDMGIUhX8Bi2vDsPSbw4wY0AMf7g66oYLADxziJtM8EV0S+9b/+C96C6gq2F8TB2/oWldYhxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbabbbc-42b3-4a31-4e09-08df09d8be7a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:31:02.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6cnt3lrfOpucUgRPVt0H5L0L7Oxmyj9rA7wWuU6j5p5kTFdlexgJ1WxD6KmYRD/+3fVa/NALzmkb/LkkE2Uug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB454219
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

On Thu, Sep 03, 2026 at 05:59:24PM +0300, Mika Kuoppala wrote:
> Hi,
> 
> This is the v10 patch series for Intel Xe GPU debug support (eudebug).
> 
> This series continues from the following previous submissions:
> - v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
> - v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
> - v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
> - v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/091645.html
> - v5: https://lists.freedesktop.org/archives/intel-xe/2025-October/097859.html
> - v6: https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html
> - v7: https://lists.freedesktop.org/archives/intel-xe/2026-February/115750.html
> - v8: https://lists.freedesktop.org/archives/intel-xe/2026-April/124147.html
> - v9: https://lists.freedesktop.org/archives/intel-xe/2026-June/128834.html
> 
> # Series layout: core and page faults
> 
> v9 shipped eudebug core only, with EU page fault handling split out to be
> sent separately. In v10 the page fault work is included again, but it is
> deliberately kept as a distinct block on top of the core:
> 
> - Patches 1-19 are eudebug core. This is a self-contained, functional
>   debugger interface and can be reviewed and merged on its own.
> - Patches 20-27 add EU page fault handling on top. They touch xe page
>   fault and SVM paths, and nothing in patches 1-19 depends on them.
> 
> They are posted together for completeness, so that reviewers can see
> where the core interface is heading and judge the core design with the
> page fault use case in view. Treat the second block as a follow-up series
> that happens to be in the same posting.
> 
> # Major Changes from v9
> 
> Page fault support is back in the series (see above).
> 
> Continued to work through Sashiko feedback, plus review comments on v9.
> 
> Core eudebug:
> 
> - Reworked the eudebug workqueues. Deferred ufence signalling no longer
>   shares the ordered discovery workqueue, and the per device attention
>   poller moved off the shared system workqueue onto a device workqueue of
>   its own. Both were sources of head of line blocking: a client's ufence
>   signal, which is what releases the debuggee from wait_user_fence, could
>   queue behind an unrelated client's discovery, and the attention poller
>   blocks on eudebug.lock across a gt reset.
> - Connection lifetime and teardown fixes: wake up after detach taking the
>   occupied event into account, O_CLOEXEC on the connection fd, hold the
>   drm_device for the lifetime of the connection, do not silently truncate
>   the target fd, and reject zero as a target fd.
> - Event fifo allocated with GFP_KERNEL_ACCOUNT, resource handles preallocated.
> - ufence acks: avoid double signal when the fence is not tracked, clear
>   the bind ref seqno when there is no debugger or when tracking fails,
>   and stop referencing the ack after dropping the lock.
> - EU control: take runtime pm around hw access, gate SR-IOV, proper
>   teardown when runtime is not active, and no warn on wrong context.
> - Documentation and kernel-doc fixes throughout, including the ioctl_lock
>   in struct xe_file, which is held across a whole ioctl and therefore
>   nests outside every lock those ioctls take. The security model DOC now
>   states which fd acquisition methods the ptrace_may_access() parity
>   claim actually covers.
> 
> Page faults:
> 
>   Reworked on top of 'Fine grained fault locking, threaded prefetch,
>   storm cache' series (merged). Added svm support and improved multiple
>   fault handling.
> 
> TODO:
> access_process_vm(task, ...) still has the possible race with
> execve due to mm changing for task, pointed by Sashiko.
> See the relevant code and XXX FIXME in xe_eudebug_vm.c, in
> xe_eudebug_vma_access(), and in xe_eudebug_track_userptr_task()
> in xe_userptr.h. The most straightforward way to fix this
> would be to export access_remote_vm(mm, ...) and then use the
> notifier mm for it.
> 
> # Supported Hardware
> - Lunarlake (LNL)
> - Battlemage (BMG)
> - Pantherlake (PTL)

Are we adding CI?

> 
> The code for this submission can be found at:
> https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v10
> 
> Tests:
> https://gitlab.freedesktop.org/DominikPiatkowski-Intel/igt-gpu-tools/-/tree/eudebug-dev-next

What about the upper level PRs and reviews?
Could you please update us on how that side of the review is going?

Thanks,
Rodrigo.

> 
> 
> Christoph Manszewski (5):
>   drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
>   drm/xe/eudebug: Introduce vm bind and vm bind debug data events
>   drm/xe/eudebug_test: Introduce eudebug live tests
>   drm/xe: Implement SR-IOV and eudebug exclusivity
>   drm/xe: Add xe_client_debugfs and introduce debug_data file
> 
> Dominik Grzegorzek (5):
>   drm/xe: Add EUDEBUG_ENABLE exec queue property
>   drm/xe/eudebug: Introduce exec_queue events
>   drm/xe/eudebug: Add hw enablement
>   drm/xe/eudebug: Introduce EU control interface
>   drm/xe/eudebug: Introduce per device attention scan worker
> 
> Gwan-gyeong Mun (5):
>   drm/xe/eudebug: Add read/count/compare helper for eu attention
>   drm/xe/vm: Support for adding null page VMA to VM on request
>   drm/xe/vm: Add xe_vm_svm_vma_subtract() to carve out a sub-range from
>     an SVM VMA
>   drm/xe/eudebug: Introduce EU pagefault handling interface
>   drm/xe/eudebug: Enable EU pagefault handling
> 
> Maciej Patelczyk (3):
>   drm/xe/pagefault: export pagefault queue properties
>   drm/xe: Support for xe_vma_unbind()
>   drm/xe: export prep_vma_destroy as xe_vm_prep_vma_destroy
> 
> Mika Kuoppala (9):
>   drm/xe/eudebug: Introduce eudebug interface
>   drm/xe/eudebug: Add documentation
>   drm/xe/eudebug: Add connection establishment documentation
>   drm/xe/eudebug: Introduce discovery for resources
>   drm/xe/eudebug: Mark guc contexts as debuggable
>   drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm subop checking
>   drm/xe/eudebug: Add ufence events with acks
>   drm/xe/eudebug: Add vm open/pread/pwrite
>   drm/xe/eudebug: Add userptr vm pread/pwrite
> 
>  .../ABI/testing/sysfs-driver-intel-xe-eudebug |   21 +
>  Documentation/gpu/driver-uapi.rst             |    2 +
>  Documentation/gpu/xe/index.rst                |    1 +
>  Documentation/gpu/xe/xe_eudebug.rst           |   83 +
>  MAINTAINERS                                   |    2 +
>  drivers/gpu/drm/xe/Kconfig                    |   10 +
>  drivers/gpu/drm/xe/Makefile                   |    7 +-
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h      |    5 +
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |    1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   43 +
>  drivers/gpu/drm/xe/tests/xe_eudebug_test.c    |  227 ++
>  drivers/gpu/drm/xe/tests/xe_live_test_mod.c   |    5 +
>  drivers/gpu/drm/xe/xe_client_debugfs.c        |  108 +
>  drivers/gpu/drm/xe/xe_client_debugfs.h        |   17 +
>  drivers/gpu/drm/xe/xe_debug_data.c            |  383 +++
>  drivers/gpu/drm/xe/xe_debug_data.h            |   22 +
>  drivers/gpu/drm/xe/xe_debug_data_types.h      |   25 +
>  drivers/gpu/drm/xe/xe_device.c                |   28 +-
>  drivers/gpu/drm/xe/xe_device.h                |   42 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   57 +
>  drivers/gpu/drm/xe/xe_eudebug.c               | 2514 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug.h               |  119 +
>  drivers/gpu/drm/xe/xe_eudebug_hw.c            |  730 +++++
>  drivers/gpu/drm/xe/xe_eudebug_hw.h            |   30 +
>  drivers/gpu/drm/xe/xe_eudebug_pagefault.c     |  722 +++++
>  drivers/gpu/drm/xe/xe_eudebug_pagefault.h     |   81 +
>  drivers/gpu/drm/xe/xe_eudebug_types.h         |  284 ++
>  drivers/gpu/drm/xe/xe_eudebug_vm.c            |  501 ++++
>  drivers/gpu/drm/xe/xe_eudebug_vm.h            |    8 +
>  drivers/gpu/drm/xe/xe_exec_queue.c            |   77 +-
>  drivers/gpu/drm/xe/xe_exec_queue.h            |    2 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h      |    7 +
>  drivers/gpu/drm/xe/xe_gt_debug.c              |  251 ++
>  drivers/gpu/drm/xe/xe_gt_debug.h              |   36 +
>  drivers/gpu/drm/xe/xe_gt_debug_types.h        |   22 +
>  drivers/gpu/drm/xe/xe_guc.c                   |    8 +
>  drivers/gpu/drm/xe/xe_guc.h                   |    6 +
>  drivers/gpu/drm/xe/xe_guc_ads.c               |   12 +
>  drivers/gpu/drm/xe/xe_guc_pagefault.c         |   10 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c            |   34 +
>  drivers/gpu/drm/xe/xe_guc_submit.h            |    1 +
>  drivers/gpu/drm/xe/xe_hw_engine.h             |   14 +
>  drivers/gpu/drm/xe/xe_pagefault.c             |  150 +-
>  drivers/gpu/drm/xe/xe_pagefault.h             |   10 +
>  drivers/gpu/drm/xe/xe_pagefault_types.h       |   38 +-
>  drivers/gpu/drm/xe/xe_pt.c                    |    2 -
>  drivers/gpu/drm/xe/xe_reg_sr.c                |   12 +-
>  drivers/gpu/drm/xe/xe_reg_sr.h                |    4 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c         |    2 +-
>  drivers/gpu/drm/xe/xe_rtp.c                   |    2 +-
>  drivers/gpu/drm/xe/xe_sync.c                  |   45 +-
>  drivers/gpu/drm/xe/xe_sync.h                  |    7 +-
>  drivers/gpu/drm/xe/xe_sync_types.h            |   29 +-
>  drivers/gpu/drm/xe/xe_userptr.c               |    4 +
>  drivers/gpu/drm/xe/xe_userptr.h               |   32 +
>  drivers/gpu/drm/xe/xe_vm.c                    |  491 +++-
>  drivers/gpu/drm/xe/xe_vm.h                    |   13 +
>  drivers/gpu/drm/xe/xe_vm_types.h              |   28 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules            |    4 +
>  include/uapi/drm/xe_drm.h                     |   89 +
>  include/uapi/drm/xe_drm_eudebug.h             |  416 +++
>  62 files changed, 7826 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug
>  create mode 100644 Documentation/gpu/xe/xe_eudebug.rst
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug_test.c
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data.h
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug_types.h
>  create mode 100644 include/uapi/drm/xe_drm_eudebug.h
> 
> -- 
> 2.53.0
> 
