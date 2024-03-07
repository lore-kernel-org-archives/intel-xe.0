Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8944C54E4A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 19:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56FF113802;
	Thu,  7 Mar 2024 19:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/6R2VoN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FE113802
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709838372; x=1741374372;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0jQveYIClbToSw/UIZbSUU0szXMJQWUiYy9n15vNnJg=;
 b=H/6R2VoNMiZrAkhMzWkHx9WIqFREmBOjc6YvoXRCp6tALWX28D4SqeSN
 XXk+rgU807VW3uGFxpEJXiM0wP42aMmcLc5bupmUqNdYknABDVTlTxD5o
 v0IKewhVF7GRkvZAsROsDwNLGjAcB4QvbKwAgbC0K0ESZW7pWHccKCcMW
 izfPXEwL9GOnX88zRgdXIBfkALaQDtZPxPHIUlOhAJbSJoHbBEATMlr2g
 I5UMhOZ0TdJv21FZp+JeTyehT/0JhqVnk3D1ECxb463qr6aqqFt27jLQM
 DKy6/IYDv8H0XffNk9etiYhpXna685xfY9KF14Iah+Q7zXUG30xEECaZn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15175689"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="15175689"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 11:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="41183858"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 11:06:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 11:06:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 11:06:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 11:06:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huBuc0XGRqs7ex7/LmLkNabADIIzW2NYuMmHEg2z10PnQC3GUGTQCym8/BsnpVpI1Dnofj6QrBX+JXLlVpK50a7Lh4SwiDIv0FUb+6u7BynRTvI++Y3o1x+CA1fzsArTGn08aOvyBySE5aT9LdzCcwJwKR6HorAgE9WiJjyQjg2q+aj9/wnswJFTHu8HQRPP9upGi0JemPHAqijkC7UFYvyUpWB5FhXQCigYGgSUlzBhfUaH3S4CowJf5NXJx3McX8Bnsv72wTkrDwyHzfRlyMkY8vSku0RBts8U7D11w6xiHLefawSA3RbOifmcZSnfGzaq3iAeafXK4NwXra5GpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19VEhFg6b78H3YJ9rxoWlQRzRw3+Q3hbDtFv+LTm9Eo=;
 b=SNZH7Yg7F73+lQC45CGmyvitgmB3jPcvD0D4d0AXq8bl9+cfu0qqaC5tT5zd3SGnaDssly5Byx4+A8H0PyUU8bUcaC/RIoGxbzGnde+C1R+kVqBnU9FFpKpukE+fD/lBF57b0g2Xp3gUVT1vqt8psSremLY7a8BjtpP7PhqAyYDFrXZVREo4mbEJC53HDDYo36Zz3vwGdMOiIiixVzipflY5WoricHTPerXVeG9r/lwN3jxSNYYnC2jXhyG+3pikfrP8f0q40I4Yypwxul0dRpoqtTd0HCBG5uDGll0dvh0s/9uRUEz6JYhVwepKxzrugm83rtcfHOx+735p5giBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Thu, 7 Mar
 2024 19:06:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 19:06:06 +0000
Date: Thu, 7 Mar 2024 13:06:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] Revert "drm/xe: Do not grab forcewakes when issuing GGTT
 TLB invalidation via GuC"
Message-ID: <wvb7c4c3ct4mnhpiqlrnyxetsrrbvqxfosmchyhs7ncljo5olv@cno3kytqrunp>
References: <20240307001105.161856-1-rodrigo.vivi@intel.com>
 <uovrap7ztb6mhbqfbw73yaslpqkhmt74kiyudzy646oukoii2e@ojksg6dxqp5b>
 <ZeoKncU_r_iyKtAG@intel.com>
 <4hoacashd7fylyggfhlwotu5klcnohdamvvrezbzjj2u6rwma2@rk2h2tmnue5b>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4hoacashd7fylyggfhlwotu5klcnohdamvvrezbzjj2u6rwma2@rk2h2tmnue5b>
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: b4914e93-7a4b-4889-3755-08dc3ed9a42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2FCQJ63ZuHUXY/upY4AHynQ6ZZPBBYsJnlBa2fbN2VyGPmmnfK45WKQFsPYgjJyw74YpsboZxY80id59Sl3tqyuTuOnyz4pruonWILP5BG1rU+rY1HpU8egEhJs7Ko1pG1XkjzgKXtkDdzXIpeMnFAqZ8dlm0bQHTGonyWkEJIuXDp5doz436Ua472yUTzudy3o9Lm+ccEqodXES+bh7CKwxwypyp5GZVkf6CqUgVOPspswnN3FH0a4UZN35kQCtwhPVP/XVl55R4hl45rKWrA9nsjd+tuNJ5zNhmkPsqLRTq6hiKxhMYMOlBPVDK3C8qGXifOloZe1md0VxZHhApZLPk7L1A5/TKvi9YsMLt7CYSogwbqzWW7Lg5bOiOSLg2oDOD7wJxYpK4poi7PGGxHk5v6r9Fj7dFTPsCmtamAQybBe0dWDUJdLskaEb78l4ZXXJ+/ymOp2rWDuuccmA7YVuKySjbLJqAFvZ+0apj9qC6vpR31uVz6sFoLo/ocgh3ZRysHivZZpE10FRFms5jE6Ac6qxwwQx7UimFMqfkNQ5h+1mN9EMw8jTZ1lRci7rTqH18Xa5Gc+0Ow9GUVBubLfm48Ok7gBSM7pruj7RwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IfiDIyaq6XN/CLRjXBHyTkBQ8ZkyxA1NwG8HWy8WpD8bJijlChsHn7Ipkgm6?=
 =?us-ascii?Q?ttuOOWqVS9t7Tq+VBMua1rTbDqZ4Hb2IoPdJfSSWm0Zpl2PoMehjyssgxNB0?=
 =?us-ascii?Q?7MxceHfIGscpbWllAkcaGdOgcHo6O8PriIFJuQu1ey9Ww4vOf9lUrWncMsh+?=
 =?us-ascii?Q?jFaO363OZ21UoYUTDwOZN4AaMzsglNqxMCkF0yM6AQKYqILJ1FQFZJOhZGIL?=
 =?us-ascii?Q?hUn7dKt2C87LSbZha05IkqLKh8ApRMdOi1QsRDM/Sl1QAFBAB/A8RbdoPSI0?=
 =?us-ascii?Q?z1iCP2UyH0u169bJeZqXUhuMBI1AeVa9GR1RJ1wgS75K9OqW7xjchcF7bkTB?=
 =?us-ascii?Q?K+74Xz2Mz4gEZXkYXHtnLe6L6JxfYfS5Ff5wU7oAs7TrYAQDlTlbGe5+WruN?=
 =?us-ascii?Q?mGaqKTnQ6jdtYN072bKlTj4bLPhxImRr9cg0nPlKkfTjWyZnBdzgVzZ82Ff6?=
 =?us-ascii?Q?xsWw4PguTbmxxzj+KnRD4A7Jmu4Dq7ChiyieWYs+4rbjT4ouCEuwq/rG58Fx?=
 =?us-ascii?Q?4KHqB+VOFUqLfUZpZS/NRfUF9SA6GbExp5ChHTL/BGMnPWfxY/VfZ79HMCyS?=
 =?us-ascii?Q?hMJnQA/ApRT2cRhaHH75ZMSonupzrWGNW5qdEm8nXx3XLVgq4UNHblNXdVRg?=
 =?us-ascii?Q?g+Vi7fZHu1EVZ7gekxtSKQHepWXT6jgKecLxWTt/zUbTIHCS1xyy5Qm3mRQd?=
 =?us-ascii?Q?GcgO9yPRNEr9WcnBr/9B59KnRzf8wicTUvXUKBSMpUYAh+Ylzce7vS02hDj3?=
 =?us-ascii?Q?l8Y5z7EeReIEsHqzMxMYz//+C1NOJ0QKt6KzLMNNereEA1NVKr2Hqwj+H91D?=
 =?us-ascii?Q?gOnirSs60frAI7dSP1lhQi5exNewg6+7FKM0vui3K0fxH8mpbakOEqnRMu+0?=
 =?us-ascii?Q?brnnRXebxp7Sr6s8cuRVSeBHPHPFxrdXvzzFV2STLtK90R4yZVGvxpXXTn8M?=
 =?us-ascii?Q?6tWNl+oYcZIYtO5xslI/+NXYtjilA4/L4ITqPNmPi+2EKaPPBiWRL9P8IfRf?=
 =?us-ascii?Q?R5Ju4iz1tXI/Xh+tqRCqUopnshMvEtrbv9MNjfiwrSmMTjlfi+NenA9QI1n9?=
 =?us-ascii?Q?HeTXE4zKl0u3AhuUmcvbMvT/T8kHx+UczscUVgeJQ8sbJHPcu7L0T4XzfwlX?=
 =?us-ascii?Q?uJDLfF+HgxF7qmh1BG3hAFQa9qP4TeVOhhBDK/jhg3vC2LzN8k/7bhU5SSSI?=
 =?us-ascii?Q?L+CVNME+cLJFT4BuBgFJvbqgr00GrKkLxbYhjQNUIoey/bOrlZlMvrvXwR6O?=
 =?us-ascii?Q?QvZTZ92JUCMMAkhunIpC5qxd83KUogcQBRlUCDRaTgfIv8vRU4pYK2SxgXdz?=
 =?us-ascii?Q?p1jQvpiZk1LeF92Idjt7b2vKX4LGHiT0tifEcnK0Bp2BwMDz81UGGcuxkbEr?=
 =?us-ascii?Q?SPF5iBMyltrfzR+VN8xDQrjQPK+1mYTdLvk1WZM56j5QI2QcpbVpOM2nmTxF?=
 =?us-ascii?Q?9+8BZH74aaMyTYbcxvxDYL1xzMCjABLp364h3dMxpiPklZSt4QpAfZ4ZdKyc?=
 =?us-ascii?Q?JS8Tiz7TBaDu5J+PIlSaaCvSHYX3+KlncqBep70ggT2SquiMQ/uby8iwYp4j?=
 =?us-ascii?Q?/mCbsTjp0pCcwhnRhAiNxgkArsFzQ/qioTpsCm/N5jHnYSQXj0KDXjnsylRN?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4914e93-7a4b-4889-3755-08dc3ed9a42d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 19:06:06.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFp7a1u/R8tOwZvRKByiuBoaV7op/qV2TJFt+Xsw6mNhVYtx8GNDl+Fz+StVFL+fUMq/wTT/qXtlGF8KLABIt74K72LJ0WoOAGmu8YLko2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

On Thu, Mar 07, 2024 at 01:02:38PM -0600, Lucas De Marchi wrote:
>On Thu, Mar 07, 2024 at 01:42:37PM -0500, Rodrigo Vivi wrote:
>>On Thu, Mar 07, 2024 at 12:09:42PM -0600, Lucas De Marchi wrote:
>>>On Wed, Mar 06, 2024 at 07:11:05PM -0500, Rodrigo Vivi wrote:
>>>> This reverts commit 27ee413bbc0b04146f4ee1c7444422bf18dafd47.
>>>>
>>>> On DG2 after this patch:
>>>>
>>>> [  439.105953] general protection fault, probably for non-canonical ad=
dress 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
>>>> [  439.117349] KASAN: null-ptr-deref in range [0x0000000000000000-0x00=
00000000000007]
>>>> [  439.124924] CPU: 8 PID: 7160 Comm: insmod Tainted: G     U     OE  =
    6.8.0-rc7+ #5
>>>> [  439.132669] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BI=
OS F5 12/17/2021
>>>> [  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>>>> [  439.145860] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 8=
5 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 0=
3 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
>>>> [  439.164609] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
>>>> [  439.169843] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 000000=
0000000000
>>>> [  439.176980] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff88=
818231a478
>>>> [  439.184121] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffb=
fff7563e5c
>>>> [  439.191259] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff88=
8185330028
>>>> [  439.198401] R13: ffffffffffffffff R14: 0000000000001000 R15: 000000=
0000000000
>>>> [  439.205543] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) k=
nlGS:0000000000000000
>>>> [  439.213634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [  439.219393] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 000000=
0000750ef0
>>>> [  439.226534] PKRU: 55555554
>>>> [  439.229256] Call Trace:
>>>> [  439.231713]  <TASK>
>>>> [  439.233832]  ? die_addr+0x3c/0xa0
>>>> [  439.237165]  ? exc_general_protection+0x158/0x240
>>>> [  439.241882]  ? asm_exc_general_protection+0x22/0x30
>>>> [  439.246774]  ? xe_ggtt_invalidate+0x150/0x260 [xe]
>>>> [  439.251679]  ? xe_ggtt_invalidate+0xa0/0x260 [xe]
>>>> [  439.256490]  __xe_ggtt_insert_bo_at+0x24b/0x720 [xe]
>>>> [  439.261556]  ? __pfx____xe_bo_create_locked+0x10/0x10 [xe]
>>>> [  439.267144]  ? __pfx___xe_ggtt_insert_bo_at+0x10/0x10 [xe]
>>>> [  439.272737]  __xe_bo_create_locked+0x4af/0x1080 [xe]
>>>> [  439.277806]  xe_bo_create_pin_map_at+0x40/0x400 [xe]
>>>> [  439.282873]  ? xe_uc_fw_check_version_requirements+0x496/0x900 [xe]
>>>> [  439.289255]  xe_managed_bo_create_from_data+0x38/0x130 [xe]
>>>> [  439.294934]  xe_uc_fw_init+0xe71/0x3270 [xe]
>>>> [  439.299317]  ? __pfx_xe_uc_fw_init+0x10/0x10 [xe]
>>>> [  439.304127]  ? __pfx_lock_acquired+0x10/0x10
>>>> [  439.308406]  ? __pfx___drm_printfn_info+0x10/0x10
>>>> [  439.313118]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>>>> [  439.318093]  ? __pm_runtime_resume+0x7f/0x110
>>>> [  439.322458]  xe_guc_init+0x8d/0x890 [xe]
>>>> [  439.326497]  xe_uc_init+0x65/0x1a0 [xe]
>>>> [  439.330440]  xe_gt_init_hwconfig+0xdc/0x180 [xe]
>>>> [  439.335161]  xe_device_probe+0x747/0x1060 [xe]
>>>> [  439.339712]  ? __pfx___drmm_mutex_release+0x10/0x10
>>>> [  439.344599]  ? __drmm_add_action+0x19d/0x280
>>>> [  439.348883]  ? __pfx___drmm_mutex_release+0x10/0x10
>>>> [  439.353769]  xe_pci_probe+0x168b/0x2f30 [xe]
>>>> [  439.358154]  ? __pfx_lock_acquired+0x10/0x10
>>>> [  439.362433]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
>>>> [  439.367158]  ? _raw_spin_unlock_irqrestore+0x62/0x80
>>>> [  439.372131]  ? lockdep_hardirqs_on+0xc7/0x140
>>>> [  439.376498]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>>>> [  439.381473]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
>>>> [  439.386196]  local_pci_probe+0xd6/0x190
>>>> [  439.390042]  pci_device_probe+0x223/0x740
>>>> [  439.394064]  ? __pfx_pci_device_probe+0x10/0x10
>>>> [  439.398605]  ? kernfs_create_link+0x167/0x230
>>>> [  439.402970]  ? do_raw_spin_unlock+0x54/0x1f0
>>>> [  439.407252]  really_probe+0x3df/0xb80
>>>> [  439.410926]  __driver_probe_device+0x18c/0x450
>>>> [  439.415382]  driver_probe_device+0x4a/0x120
>>>> [  439.419572]  __driver_attach+0x1e1/0x4a0
>>>> [  439.423505]  ? __pfx___driver_attach+0x10/0x10
>>>> [  439.427963]  bus_for_each_dev+0xf2/0x160
>>>> [  439.431897]  ? __pfx_bus_for_each_dev+0x10/0x10
>>>> [  439.436436]  bus_add_driver+0x29d/0x570
>>>> [  439.440283]  driver_register+0x130/0x450
>>>> [  439.444218]  ? __pfx_xe_init+0x10/0x10 [xe]
>>>> [  439.448507]  xe_init+0x81/0x140 [xe]
>>>> [  439.452188]  ? __pfx_xe_init+0x10/0x10 [xe]
>>>> [  439.456478]  do_one_initcall+0xcf/0x420
>>>> [  439.460326]  ? __pfx_do_one_initcall+0x10/0x10
>>>> [  439.464783]  ? kasan_unpoison+0x40/0x70
>>>> [  439.468631]  do_init_module+0x238/0x730
>>>> [  439.472478]  load_module+0x5ff7/0x6c30
>>>> [  439.476242]  ? __pfx_load_module+0x10/0x10
>>>> [  439.480356]  ? ima_post_read_file+0x163/0x190
>>>> [  439.484722]  ? __pfx_ima_post_read_file+0x10/0x10
>>>> [  439.489435]  ? security_kernel_post_read_file+0x6d/0xb0
>>>> [  439.494673]  ? __pfx_kernel_read_file+0x10/0x10
>>>> [  439.499220]  ? init_module_from_file+0xc0/0x100
>>>> [  439.503758]  init_module_from_file+0xc0/0x100
>>>> [  439.508125]  ? __pfx_init_module_from_file+0x10/0x10
>>>> [  439.513103]  ? do_raw_spin_unlock+0x54/0x1f0
>>>> [  439.517382]  idempotent_init_module+0x241/0x660
>>>> [  439.521924]  ? __pfx_idempotent_init_module+0x10/0x10
>>>> [  439.526986]  ? security_capable+0x6d/0xb0
>>>> [  439.531003]  __x64_sys_finit_module+0xba/0x130
>>>> [  439.535459]  do_syscall_64+0x97/0x190
>>>> [  439.539135]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
>>>> [  439.544282]  ? do_syscall_64+0xa7/0x190
>>>> [  439.548125]  ? lockdep_hardirqs_on+0xc7/0x140
>>>> [  439.552493]  ? do_syscall_64+0xa7/0x190
>>>> [  439.556341]  ? do_syscall_64+0xa7/0x190
>>>> [  439.560188]  ? lockdep_hardirqs_on+0xc7/0x140
>>>> [  439.564556]  ? do_syscall_64+0xa7/0x190
>>>> [  439.568401]  ? do_syscall_64+0xa7/0x190
>>>> [  439.572249]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
>>>> [  439.577395]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
>>>> [  439.582460] RIP: 0033:0x7f6c0f73160d
>>>> [  439.586047] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e f=
a 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 0=
5 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 47 0c 00 f7 d8 64 89 01 48
>>>> [  439.604792] RSP: 002b:00007ffd0ecad3b8 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000139
>>>> [  439.612368] RAX: ffffffffffffffda RBX: 0000565382a36740 RCX: 00007f=
6c0f73160d
>>>> [  439.619506] RDX: 0000000000000000 RSI: 0000565382a362a0 RDI: 000000=
0000000003
>>>> [  439.626644] RBP: 00007ffd0ecad470 R08: 0000000000000000 R09: 000056=
5382a37760
>>>> [  439.633782] R10: 0000000000000003 R11: 0000000000000246 R12: 000056=
5382a362a0
>>>> [  439.640925] R13: 0000000000000000 R14: 0000565382a38790 R15: 000056=
5382a362a0
>>>> [  439.648066]  </TASK>
>>>> [  439.650263] Modules linked in: xe(OE+) snd_hda_codec_hdmi snd_seq_d=
ummy snd_hrtimer rfcomm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_=
fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 n=
f_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag=
_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_mis=
c vfat fat intel_rapl_msr snd_sof_pci_intel_tgl iwlmvm intel_rapl_common sn=
d_sof_intel_hda_common snd_soc_hdac_hda snd_sof_pci intel_uncore_frequency =
snd_sof_xtensa_dsp intel_uncore_frequency_common snd_sof_intel_hda x86_pkg_=
temp_thermal snd_sof intel_powerclamp mac80211 snd_sof_utils snd_soc_acpi_i=
ntel_match snd_soc_acpi snd_soc_core coretemp snd_compress snd_sof_intel_hd=
a_mlink snd_hda_ext_core kvm_intel snd_hda_intel snd_intel_dspcfg libarc4 s=
nd_hda_codec kvm snd_hwdep snd_hda_core btusb iwlwifi irqbypass snd_seq btr=
tl snd_seq_device iTCO_wdt btintel rapl pmt_telemetry intel_pmc_bxt snd_pcm=
 intel_cstate btbcm ee1004 iTCO_vendor_support btmtk mei_hdcp
>>>> [  439.650319]  mei_pxp pmt_class cfg80211 i2c_i801 snd_timer intel_un=
core wmi_bmof gigabyte_wmi bluetooth pcspkr snd i2c_smbus mei_me soundcore =
mei idma64 rfkill intel_vsec intel_hid joydev acpi_tad acpi_pad sparse_keym=
ap loop zram drm_gpuvm hid_logitech_hidpp i915 crct10dif_pclmul crc32_pclmu=
l crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel nvme r81=
69 sha512_ssse3 nvme_core pinctrl_alderlake hid_logitech_dj ip6_tables ip_t=
ables fuse
>>>> [  439.739896] Unloaded tainted modules: xe(OE):2 [last unloaded: xe(O=
E)]
>>>> [  439.786092] ---[ end trace 0000000000000000 ]---
>>>> [  439.790733] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>>>> [  439.796254] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 8=
5 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 0=
3 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
>>>> [  439.815026] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
>>>> [  439.820262] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 000000=
0000000000
>>>> [  439.827407] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff88=
818231a478
>>>> [  439.834549] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffb=
fff7563e5c
>>>> [  439.841691] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff88=
8185330028
>>>> [  439.848835] R13: ffffffffffffffff R14: 0000000000001000 R15: 000000=
0000000000
>>>> [  439.855978] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) k=
nlGS:0000000000000000
>>>> [  439.864072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [  439.869824] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 000000=
0000750ef0
>>>> [  439.876966] PKRU: 55555554
>>>>
>>>> Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT=
 TLB invalidation via GuC")
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_ggtt.c                | 7 +++++++
>>>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 --
>>>> 2 files changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt=
.c
>>>> index 5e739513ab0a..717d0e76277a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> @@ -257,9 +257,16 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *=
gt)
>>>> 	if (!gt)
>>>> 		return;
>>>>
>>>> +	/*
>>>> +	 * Invalidation can happen when there's no in-flight work keeping th=
e
>>>> +	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
>>>> +	 * and GuC are accessible.
>>>
>>>
>>>aside from the null pointer deref, what exactly
>>>from this comment above that would not be true to make the patch
>>>correct?
>>
>>That's a very good question. maybe -ENOTENOUGHCOFFEE from my side...
>>my bisect took me to this patch that touches the RIP function:
>>[  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>>and I had to use this revert to be able to proceed with my work yesterday=
.
>>
>>But then, Matt pointed me to https://patchwork.freedesktop.org/patch/5815=
22/?series=3D130786&rev=3D1
>>and applying that here also make things work...
>
>
>well, that first patch fixes the null pointer deref, but that is while
>printing an *error*. The error is still there. I see commit


scratch that... I misread the patch. Yes, makes sense, let's get that
in.

Lucas De Marchi

>27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT TLB
>invalidation via GuC")  removed the forcewake without proper explanation
>(at least to me), and now we are reproducing the error path (with the
>extra annoyance of the null deref).
>
>>although that doesn't touch the xe_ggtt_invalidate but only ggtt_invalida=
te_gt_tlb
>>
>>So, I'm still puzzled on the backlog above, but anyway,
>>what we need is not this revert, but get this
>>drm/xe: Fix NULL check in xe_ggtt_init()
>>pushed asap
>
>/me confused ... as I said above we'd still have the error, just not the
>null deref. Unless the other patches in that series are fixing something
>more.
>
>Lucas De Marchi
