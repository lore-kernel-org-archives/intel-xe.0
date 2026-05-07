Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1856CD342C
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 00:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675D810EF0D;
	Thu,  7 May 2026 00:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyL/taCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AC010EF3C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778114124; x=1809650124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MdmQ7zqmf0t0bGhdWEAc3z1lhOjMPsgiuJt5R7xBp40=;
 b=AyL/taCQ/fpBiCA0aZmUb3tQ6wrYtLr2D3v0enX8Cua3R4w486nNoy3Y
 QCUEcskl9drFpv0nDcE3BDY+zl3I4IM06DLjR9E+U4LUTXerVYmfJPH0o
 u9/k/0eOHhQioiW/IzxCdXot3Nzy37gZEaxkdYdm2VLbgbyjdNIMITkPd
 RVqzNB1d1HxGFI9jjiPE1/8pIe31RafsT0OyVBrZXyFkdSXoqNMmETC/A
 m2k8fKRvtJOixZdGFwHrOmB/NgjxHJY439CwlfIR7JWnfArAbx9rO76SF
 +NxjVih6FXaRbUigKRShExjHqNe8AuQv8kTsr8vVn3JzXluS0Uzm0c6m0 A==;
X-CSE-ConnectionGUID: AhCK0IBXTjuocIxquqPGag==
X-CSE-MsgGUID: Sn4YNr5rT/C9KS1XALFL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89646267"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="89646267"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:35:24 -0700
X-CSE-ConnectionGUID: 4hKQ2z5hRmarKGoRX/yAvw==
X-CSE-MsgGUID: Bx4EjZ5pS1CdrzpRAdBVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259732896"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:35:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:35:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 17:35:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnuZmA2vjHACP5MPo74I1TopUzedWJdGv6Y7rPQqQ7m8/QEZgPRT8KYjj2lfInuYdkcclGHeUETO6PcxIWDmhpH4UC5YwEAYaiUtNE4xfsGOeR+vgfhLkfVkOTr4HH3ll1g0Pajt1dOIlg516xNgzBnPlo+FzgK4/Ywneq7u3fD8fApKjhhmUDUzxIABJsW1DKpVTEWAWl6NHQj5c6gtQJXD4jYJ2ut/xSTSm/oFVMaMXMoyndvQaGNy4sXcZoo0UyAsRwLdEWmUPMfYFvUP5iyPi0Msk0leo+S+I+C5cM+nleip0nZJt5o7emRIZ+W+FfuSnNw0Tq9Qi5mhxfNIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=locOJ/i3sbm2Xd+XW6uTqAVurNS/H1egyoOl785Mr3w=;
 b=QBPwSTZ2v5uvpNV1M84cwXgbkrpfVGUBhooGMyWoiHo9ebztFhr7KG28vVPUvcIx4AdwJMekIQV8ZxqFlvSvp2rhR9vnuRFIFxMLwy683LYXLeGyWisfa3ygDXlp9WeDfxkUJ1r4/wj7SQA5kk0Zfp02eWtgqrvAJBwDnNYn+Y/FpDmNqie6LiCGnQ1rPR7BS999uwFexrpHrFBYmqLMtGxVDArTr+QzR+wkedW3PNFq50EQEx9/tQdxkJpjR2TnMDkEIvLzMTqnY9DFsjZEfQ9JjMQS8NfYHbwnRVXZ6LTb/e/dPzU5rTVeOAWYLg5FNjch81GN5VKYFRCnpZjeYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 00:35:20 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 00:35:20 +0000
Date: Wed, 6 May 2026 17:35:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4 05/11] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afveRR-TNmiAdCFx@nvishwa1-desk>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
 <20260506223500.3769614-18-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260506223500.3769614-18-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9fa258-3ee5-492e-3d1e-08deabd084ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 9+y/zGTTVDJVhR6SwlkLTXNe0vcorB3RGA8kDljj0HbHu3fqjKM/b0BSr+ksUgvHEeKM1TUbrsVDnLUyBOg7NMFeRSYqLZuMQNjCrp5Kzy/M1TFPl8YeWymzCn+U8mxY8w/z2gJu2Gdq3pr+IvFGpRJvAMxwX4TH7anKsFB29HewFjfxC74iJ5k6qULrrRXEAsq5AaYyiFsXJxa4nq/aVp4qd71WwI0TjctqhZPlTbCqKXsqVf+lZprmWjs6sbxVSHhJkH1bXy+bljf8oxW7TjROFDUSRz2oe4Sn6HZ5c0cbtHF7NZjhcuwTbupCBo2VIr+E9md4/OCaF+XGEm6Q+MwOjrwxFZLu3323upceSHt+ERiKkqm52a72tEe0ZyKvnWyrtoZVQnMwPMeU+A7FdEKYDrtbb1wCvqsriyOecMKiMYNMmjtoKumsPewG6AOlrL3umS8fCdWpA5qZndBDUPTGTk/et/j+ah/xaBasdc7V4Fje6QWKLZxfhuzxwCaRpivv+/I2DMXl2R8YeIK9SyPg/tQ9vP0UZD2q3m9P3f4PD+0u8aHTTb68HMjG6oq/OEaaPMvNKPP26DuEWLkXB9xV8D98R8EhlvvrSYyiXbx4FFB11KXLCrR9hbLr+D37E7RD/yoPNSm5KANTsW5YHa9zEx3ih437GETZZWJQE6EcO7IUf6eiz9LlbkuMJiT1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YlHhQWv7icbmFmmtCksn9ppuuJooKc/LVhtKiEyT/7pBrBI7YaPFL7x7ZF5r?=
 =?us-ascii?Q?NhT6/J8i+1YkO4gsc6cE1V5DcTYzodwgBcN0/5+Z32sKuFqq+4PQgTaKffdX?=
 =?us-ascii?Q?+jJLQwh61OIIvJryolwc7HanyjpfX0KYB33ZuraGH2ViLJ7EFnBwi8m2oGHT?=
 =?us-ascii?Q?wKCCY113BWNStp8KMDTA1fc0djn87CGoecMLYEowbpXOt0UMEVW6lchGuAnD?=
 =?us-ascii?Q?NkHUAyoAmryQRJWwyR1+g5Ee+CXXf5AgjAd53xr88bMLwfaUglIdwjA9gyxN?=
 =?us-ascii?Q?BNFQLAkiUuSYGgcP2rqWbPF3aDGH8YvKTeb6gLKIgxK94HJWWis2TbK5ID29?=
 =?us-ascii?Q?Hx2Lw52GFYggUiffyL88kwAPqzwu5BrM7EdjlYycWQleLu4OVnfS0buxiWeF?=
 =?us-ascii?Q?NL370Aic7OEbKja2H1omrBKlLGKkH1I/9mJJWyHiLnoWauHbyAAKxM+UNmQc?=
 =?us-ascii?Q?mgYyOJW9HJhCpB+miTs/r+ZneGvtf8y7K3CgEjoz9ag4kqWQHCe+KOvv997A?=
 =?us-ascii?Q?jQuxerE94lSMEM+eg+KhjHZnOu4YEvW3HV0Zmif9twjUssHI7VmuUkj7YexZ?=
 =?us-ascii?Q?p/Ot3TR9y9hLas7lMVC4N3vHaNfbUSHiTDMIYfQc7DYdH5TUu1Dz6n3Bljkx?=
 =?us-ascii?Q?OFj1cITBlz/iX2zLfagji7jQMrgxzniae8qR1zLJKh94DDlUWx7+N7G6BZKi?=
 =?us-ascii?Q?MQIqnkeG8AcxhLOuWxNEg6+Os3OlKhoug5f8opdqIviA6smAmsLGhidt7Dza?=
 =?us-ascii?Q?p59vzcous3MQQVypH04toBjng3yWHV49bEUcl6XX7hSBgbTDQMK/VHe/ADCJ?=
 =?us-ascii?Q?ojoe2pMXBXjb1jkgGN/g8nCgmeiDe52ZfrH4OC4vDdwMM9ZExmlcpn/Xtqx3?=
 =?us-ascii?Q?Tp0Wp/9YIuOgK6L/MXKYvPo63qrNKNB5275sYB9FgpOxvNDHSYmXeEgI9ZxB?=
 =?us-ascii?Q?QyVrC2r7dlVSHfINpTh7Kdm/F0b/0guGR72yHmXAWfXeVv2mLkGHvvgXkhK4?=
 =?us-ascii?Q?AX6I3xZVp5ZCqN7+6qrRuq27so4cn8uFlAPTmklne6VzVFNrKT9cBgNxNovh?=
 =?us-ascii?Q?k31W5VDvj1wYXqw2b7yJA23tdLep3fpvq9nOcGSOyoBq8ozJRAqVjxpmRNwr?=
 =?us-ascii?Q?foaAOdRjj5irY4MTjKUCPGaysxWgN2lb6DJn3M+4bmLX8QO+XnWCp9UEIXnt?=
 =?us-ascii?Q?ogo7JkehDjYKTnUmEFnbXVGeklPEm7pUidh7rcE/DiRo2Ix+oEcsN60H14Rs?=
 =?us-ascii?Q?jzdBg5e7h3noHKb7B6GUxWux6AqAyTViP94DwYMHecRj8KVwjsHYlyYybD0t?=
 =?us-ascii?Q?QsdkCCc9aAVEmMDqkB8k/iRkZr/WWjiQIgCxYpxtbaNfZj4oryPARjV3ZZqK?=
 =?us-ascii?Q?iWM8b8F4KRTjWOrRy0+z5UGuKFdPkBx+hX3XX/+8i7an9nFEmJZXVH0C/OcR?=
 =?us-ascii?Q?oJyPxJDLbJleYhd4ZK7h2EbXVPR+jQ6/wip6iCBYN50C4YFG6pFUN4owAlwD?=
 =?us-ascii?Q?HzsFyeaffpTDUzLxTsXAEW/IF3alm/Xle9J+DVsU6hnrBmZfR86Nwjkp9pOe?=
 =?us-ascii?Q?14lCQKWyZ7R/f2wKhN7mHjxclsXFP9J4QmCz6aqpwUOzAXgPy/P8zRjqbw8q?=
 =?us-ascii?Q?2kr+UaCjw78g9y4LJoTo6ZueNsfvbu5y6MnHtMqOgQ1LVc6zU/C07vk47q12?=
 =?us-ascii?Q?OlQLMKSU4u3ouje+s1DZHaPuxzXLYpgWLZ1Ize314yFmO+6NCLPoOYV7vpBq?=
 =?us-ascii?Q?SDHmf+2VToGwVTZbHZJNShXNkwEsYgOLsx4xb8PaSZzfxISDNqtv?=
X-Exchange-RoutingPolicyChecked: IDnpb49nJ7E2fk6oISEhO3+tywDXhEJItjSMs2TFewwFGE8Xk2N0AKB5wU2KDDzJTqFk5zj72Iv3ty7WtWhJofoqSOUZ59vODvVref4IoODdPyJSAfZxBOaq6LoEsFvy8GzmabdbN5Yv/64r4Gv2cn1A5oEABKyHlxlkx2pNRuPy+NJRxffCNlXOIZGlQnp/ZaxEZTh7QHOBaAfk1Ha2Y5DpN4s3VTaOTfS6r2+AuXAzXgvTQB7HVReGdb9gyr1OKprRwtoE8PGatxHqSqM/I581HwBg4VRuATtMa53N04owdmpBPdc6CZwkeuE7aRcMPRfZPmuC9d0iB02V7m3mDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9fa258-3ee5-492e-3d1e-08deabd084ea
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 00:35:20.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dCIjBmFIj7SdxZsIkVE4J1rAoBTJknmd7pibEtBiOvTu19OtDgyUzYvDe068lgl918liOpbPHQZPud716qgPfLznhgWNTUjs/XlILi2m80tbzet7cH1Z+t7F3jLsxgf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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

On Wed, May 06, 2026 at 03:35:06PM -0700, Umesh Nerlige Ramappa wrote:
>For an LRC belonging to the secondary queue, in order to check if its
>context group is active, we need to check the LRC of the primary queue.
>In addition to that we want to compare the secondary queue position to
>CSMQDEBUG register to check if the queue itself is active.
>
>To do so, store primary LRC and position information in the LRC.
>
>A note on references involved:
>
>- In general the Queue takes a ref on its LRC.
>- In addition, for multi-queue,
>a. Primary Queue takes a ref for each Secondary LRC.
>b. Each Secondary Queue takes a ref to the Primary Queue
>
>In the current patch, each LRC in the queue group is storing a pointer
>to primary LRC. Both primary and secondary LRCs are freed only when
>primary queue is destroyed. At this time, all secondary queues are
>already destroyed, so there is no one using secondary LRCs. We should be
>good without taking any additional references.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Store primary LRC instead of primary queue (Niranjana)
>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>- Document/Revisit references (Matt/Umesh)
>
>v3:
>- Drop the reference logic since it's not needed (Niranjana)
>- Move lrc->multi_queue initialization to a later point (Niranjana)
>
>v4: (Niranjana)
>- Set lrc[0].multi_queue.primary_lrc in xe_exec_queue_set_lrc
>- Set lrc[0].multi_queue.pos in xe_exec_queue_group_add
>- Include primary_context_desc and pos in snapshot
>---
> drivers/gpu/drm/xe/xe_exec_queue.c |  6 +++++-
> drivers/gpu/drm/xe/xe_lrc.c        | 14 ++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h        |  9 +++++++++
> drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
> 4 files changed, 36 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 62a75c8fe72f..4647a24dcffb 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -275,8 +275,11 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
> {
> 	xe_assert(gt_to_xe(q->gt), idx < q->width);
>
>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
> 		q->lrc[idx] = lrc;
>+		if (xe_exec_queue_is_multi_queue(q))
>+			q->lrc[idx]->multi_queue.primary_lrc = q->multi_queue.group->primary->lrc[0];
>+	}
> }
>
> /**
>@@ -907,6 +910,7 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
> 	}
>
> 	q->multi_queue.pos = pos;
>+	q->lrc[0]->multi_queue.pos = pos;
>
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index b31525bd2a4c..3def999ce48a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2466,6 +2466,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> 	snapshot->ctx_timestamp_ms =
> 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
>+	if (xe_lrc_is_multi_queue(lrc)) {
>+		snapshot->multi_queue.primary_context_desc =
>+			xe_lrc_ggtt_addr(lrc->multi_queue.primary_lrc);
>+		snapshot->multi_queue.pos = lrc->multi_queue.pos;
>+	} else {
>+		snapshot->multi_queue.primary_context_desc = 0;
>+		snapshot->multi_queue.pos = 0;
>+	}
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2521,6 +2529,12 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
> 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>+	if (snapshot->multi_queue.primary_context_desc) {
>+		drm_printf(p, "\tMulti queue primary Context Desc: 0x%08x\n",
>+			   snapshot->multi_queue.primary_context_desc);
>+		drm_printf(p, "\tMulti queue position: %d\n",
>+			   snapshot->multi_queue.pos);

What I am seeing is that LRC snapshot is printed along with exec_queue snapshot.
The multi_queue position is already printed as part of exec_queue snapshot.
Besides, as multi-queue primary guc id is also printed, one can easily get
the primary context descriptor also. So, perhaps we can remove printing
these info here as I am seeing LRC snapshot is always printed along with
exec_queue snapshot. Sorry, for the confusion.

Niranjana

>+	}
>
> 	if (!snapshot->lrc_snapshot)
> 		return;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index d280e6572398..d0deb916e4f1 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -40,6 +40,10 @@ struct xe_lrc_snapshot {
> 	u64 ctx_timestamp;
> 	u64 ctx_timestamp_ms;
> 	u32 ctx_job_timestamp;
>+	struct {
>+		u32 primary_context_desc;
>+		u8 pos;
>+	} multi_queue;
> };
>
> #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>@@ -91,6 +95,11 @@ static inline size_t xe_lrc_ring_size(void)
> 	return SZ_16K;
> }
>
>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>+{
>+	return lrc->multi_queue.primary_lrc;
>+}
>+
> size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
> u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 5a718f759ed6..0a5c13ec2ad7 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -63,6 +63,14 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>+
>+	/** @multi_queue: Multi queue LRC related information */
>+	struct {
>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>+		struct xe_lrc *primary_lrc;
>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>+		u8 pos;
>+	} multi_queue;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.51.0
>
