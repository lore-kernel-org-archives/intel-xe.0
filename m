Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E8E7E65D
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 19:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C163910E42B;
	Tue, 26 Sep 2023 19:29:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF3B10E42B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695756575; x=1727292575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jycu/ffE47dI84S/W5J5x+NPLKDr4a9Wc9JWJl6107s=;
 b=LhH8zOcJBqPZkDGnq+KtfKYF83xi+xE1x2+K9rRzZB4LEWkz9ltmG6ge
 aqnuZ5o6W3Pp+YdqoYBUcrDPNUiTRAoA97vU2zp96kNSpQPahsHzxlLFP
 UpOFX1uTSEdVBwgr0o71skI4kD4qwpn9/orJRH/yhM0VVIlyNpJFUHoqF
 psjcZK6nBkwS9aBW6LqKzvZnARN6ItVqLRn6yNYOIifYiLcriRPKdcJjs
 O56P577J3dw8i/iIgTQzXxfkNHuVHWmjKGmB6om+cB4Ui6QWUVwEeL76U
 XcIl7OVtV7WK2GjTLp4fcgwwa+b/cSTQQ+1TEXDsQFBk+6tNkHRRsQ8Ff A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385503421"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="385503421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698575203"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="698575203"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 12:29:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 12:29:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 12:29:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 12:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGzyM0ao9oiDZx/Pm1qQ04y5ArW250vja06JVGmSmmB5YcBZ9O14MYH54XoI0u6E+aGlWM0FaEv/IkZDNtCgB0g51SR/bGL1+jc3mrzmu6UTUeLrfp5FnSoICXpMUoUyG25lq244INAlqizzqQxpzde/I66yyhLr8un2Hwy0oAs00ETdSZgnJo5Uq12PRWsERPnaI8I97r5Q6n3BsQXkYQSMes13BRJjKHFJlCqQec1PdxNdMWP98/rMFu3diopOGgfANDZ5AHA/DWehtEmu9fckqeDJB3yGSuDSHKo30YtMIpQj/yd/JNuSh53TANpXpe7EHaG6fov+Dqa1Zqyhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TswWSci+fDGDL0u8x97bKY5+mQHLuC/vvEp5xUUyls=;
 b=Vhr5NgJWx+JoorBUlueOfdt3fRfCfXQQBhgGofJ4ntJpTSbxvsx7TdTqTHrzh48g6yRNZfbbvjvwAcJIAR8A9HkCnuSguej1xoWNHzty2F5NeRrmZRUj4VTdQQn/DUVrMorqE3TAYSKxmD86go2G6X9drC3vhRSK+31+SVg7ASdd5a0Ph+2dih8O3M5dEDx0k22oIR0IgsMVkcLEPCOoGOo8r/maEm1/6mFaBpw3P2E+XQeThKpJydXFEX8g1ozUxtfrXLRNlycuwcXr3YRjCojY5ipgt4feUWxn78XGnEfTVM64m4i2xAkoWub993cxjHM8pNOzz/hQptMrFur4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 19:29:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 19:29:32 +0000
Date: Tue, 26 Sep 2023 14:29:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <sb46n7yptnhev6c2izd442n3ghjniecgb7llo4h3y26dlvodch@bq36plym4vew>
References: <20230925132113.59900-9-matthew.auld@intel.com>
 <20230925132113.59900-15-matthew.auld@intel.com>
 <20230925220801.GR233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230925220801.GR233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 15782722-1bd8-4c37-6bc8-08dbbec6e8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCdW5IHYIOtj43Fx66bcc4NQU2yXFZtUAUcUkmbZ0xCYk3LD5fH+ObCgPBbJCeemJVtPkUooBmNsVeQJPnghq2+rb8stu1WBeFCGcmzhGpiCBN712kjUcxeiTmz18KIoDui2WCXO5LXTAHZm5JlUKJFY6rM8UeeKKf/uydBy5uPjJutBZX8WFf4BYmDZtGIcl1UjNg0Ks9HoaVrakBmSIrY9PyDNF8XwK8aLom5QKbX35339zEIZE84miX/rK9gXJ9w7L06GM38/S48Mp5JPdwJqRpKqA7L+TwRgWhCdHdNzTvcwbcPOXTWRrxvSRcZDbfQwGXx+w0ndQgdK+OZzzDs2q4bQDKjjj0Oiuz5IutOQ10sFGOWRDH3hdaztofQ3l2y8e3JRXzxLPQlbtzoOYGsjv60qI7qxHZSMfIKNGKnp4ADjrzNcZoRPTDBso4DtH2vbpgYSUvDKIixCx3zdfouyZdvJ87saXhp+k7fkJ0i5ZMpzLWfoA5MX5t7Ma1SBUwRLlZAfy9gcCDHRlIE61pRG0qTemlNMFDO25KGU47pqiKjp2B783ns5uTSnaodpmOCzaN4c2GmyxnSYcmyrug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(8676002)(8936002)(41300700001)(6862004)(4326008)(26005)(30864003)(2906002)(478600001)(6636002)(66556008)(66476007)(316002)(54906003)(66946007)(5660300002)(6506007)(6666004)(6486002)(6512007)(9686003)(966005)(107886003)(33716001)(83380400001)(38100700002)(86362001)(82960400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNC5vhZtOWLUAxIqnHCl4aVR153DUah6DHXi43rrxwTsOyMfu1AXyRBK64Zw?=
 =?us-ascii?Q?bpxwXVHmDRMBhbCv8APE1r6JAwjicCKpHje/ZduC0XXDQEQbQDWYHucoXaDh?=
 =?us-ascii?Q?SNiBH70pj0gtyHW8zM3Rekz5+90jzCO2HxdPxdyIDyu4Fq2b42alBW4f9q5R?=
 =?us-ascii?Q?8S/B2yHY/8hQGkVkzuHbbDDxrbCWmmuvUSqWqJuyFjoYVTWO/0JfQnret6kF?=
 =?us-ascii?Q?2yHRMdDejKUR3lJxNaxoPVg2cO8AfH+J1Ssk5VBZ1i3byBeRJlR40DlaPUsP?=
 =?us-ascii?Q?UwQt7ZotEbVkIU39AXQarvyfr7HoJeVsLBtbcG8TP2R0TF6JLqcjTtsH2/Nr?=
 =?us-ascii?Q?h7riCvhPTIWrSOjF824UKx2EbLzV1PPQokjsy4XDL6qU15c/KlaVe95RfU6F?=
 =?us-ascii?Q?I+NUm0VeCPayLHv8SEtkqXB+QN7pgC9PRzViyIe3yxLN+UZZDi+0niVvAiHO?=
 =?us-ascii?Q?Abb1UB33r9+AWA9SCSREsSkzyrEBXKS66E4KAJGVj8uxO4I8BcQcyEiPBwK+?=
 =?us-ascii?Q?ChFK4GCQ345yHbESJgpFkM+jI9Z8CxsNYO9lEyfkiMNMWwa7jj2qjWfwnpNr?=
 =?us-ascii?Q?wSOOHspgCaXH0cz4lXd9tVmoQ9QFx4iubJ74SUrh68nnjntzU2oxFgmrTAr8?=
 =?us-ascii?Q?rIn9hSKwl0S1O+0FZ3zr4cfdLGqFejO45Gq8/2i35BKAyvKhT1Fg7ptLs7sA?=
 =?us-ascii?Q?viLcK733pYrkWoYvPl74tEvc5D2uDYa9Zj81or2xTtVMJHL84/vYNm3slHSw?=
 =?us-ascii?Q?MnCA06cM0rr2/a59Ni/j8vFSxFI1H7QicqIDJEaYGlBUOuMuf3H7qOhEzHBd?=
 =?us-ascii?Q?5HX5iEkT3NxFuBSej9oKDvxqyWjBr0MQeGpLR9EIdlO45Q9jieeda4JRQN6+?=
 =?us-ascii?Q?zDmLrAtU921RtGU/wCQ9cPfwcIYinmu1CbkHDxKJK+JWmjwcoXghv48EXn6D?=
 =?us-ascii?Q?XV7joCyZaiuMu0hPZ+K3kztfrd7zW03tBcTUP8XA4yGbGsw4hFcnzDS9jeuo?=
 =?us-ascii?Q?k8Ah7akJLAdjga6yAPLQe6ITMtYItc3a7P9V9rc+BWG1pm1k67/N2ql5C4Do?=
 =?us-ascii?Q?i80RY/GdI5q+FCOGfu7bLrDt88UC0asXHRffg9Pdoji+BMbBoIuIAoXUDKdg?=
 =?us-ascii?Q?PI4rrmmYYs59Es2/NvH+eJRMffsnQLFHYo/nUwimUbjJ5dCyqltchh7boJLe?=
 =?us-ascii?Q?c+7zD0+dMFDe6jkmKCzHr/sioXhmloyx3YLVY8sBZV4MdzPYS6wZB8sm/9ui?=
 =?us-ascii?Q?u5W7h5kkk3Yd8fnsW14SomQRXQ46sH2bx8ri+7sExN3t0tFljz2ajjacir7u?=
 =?us-ascii?Q?AASPaHaszF7PMWUMY3GilQ7zk+LCsR0K2DPvX28HWvJkDwFv23sBeTorIohd?=
 =?us-ascii?Q?IAoKTAsSZ8EmGc0Innvhm3VNhTDT6yUCm4S/DCQpTdAADS1FDpLxryGmIzXs?=
 =?us-ascii?Q?fgTq7iEw88I9cSr3TwqIN6AD1H4MrYO5JzLkTMIiRf+wZ/qo3TV4d+TAr3aN?=
 =?us-ascii?Q?216MbWFQGFfoTTqg190UoDmFBjiPbXIJ3mQvvpAIQSnfr4KLQA65gsn96tYX?=
 =?us-ascii?Q?SJmWKikzR4cT+hqoeBWQIKtpZZV087KhZ340TJET4IMrSt7lBJRXewBKiArg?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15782722-1bd8-4c37-6bc8-08dbbec6e8aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 19:29:32.1765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf5fz4gu1bcjmM+BWeD64eQ/kLzDFFKvz05uziSdgbCfBpjIhYFiY5TqAJIwzDqiP5KT4rM/DZGDveM5B6k08bn+B8kn5duPZr/LW+Nk0Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 6/7] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:08:01PM -0700, Matt Roper wrote:
>On Mon, Sep 25, 2023 at 02:21:19PM +0100, Matthew Auld wrote:
>> In the next patch userspace will be able to directly set the pat_index
>> as part of vm_bind. To support this we need to get away from using
>> xe_cache_level in the low level routines and rather just use the
>> pat_index directly.
>
>It might be worth adding a kunit test (in a separate patch) that ensures
>every platform's PAT table can provide a valid index for XE_CACHE_WB and
>XE_CACHE_UC, which I assume are the two the kernel might want to perform
>lookups on in general code.
>
>At some point we may want to replace xe_pat_get_index() completely and
>just cache the indices for the "important" PAT settings at init that the
>kernel will want to use elsewhere in various places (e.g., something
>like gt->pat.cached and gt->pat.uncached).

already done in my series

>
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>>  drivers/gpu/drm/xe/xe_ggtt.c          |  7 +++----
>>  drivers/gpu/drm/xe/xe_ggtt_types.h    |  2 +-
>>  drivers/gpu/drm/xe/xe_migrate.c       | 13 ++++++++-----
>>  drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++++------
>>  drivers/gpu/drm/xe/xe_pt.h            |  4 ++--
>>  drivers/gpu/drm/xe/xe_vm.c            |  8 ++------
>>  drivers/gpu/drm/xe/xe_vm_types.h      |  3 +--
>>  8 files changed, 27 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 6b4388bfbb31..d3bf4751a2d7 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>>  		  0xdeaddeadbeefbeef);
>> -	expected = xe_pte_encode(m->q->vm, pt, 0, XE_CACHE_WB, 0);
>> +	expected = xe_pte_encode(m->q->vm, pt, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>>  	if (m->q->vm->flags & XE_VM_FLAG_64K)
>>  		expected |= XE_PTE_PS64;
>>  	if (xe_bo_is_vram(pt))
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 2002b6597dbf..1c447f1a4fbb 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -41,7 +41,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>  		pte |= XE_GGTT_PTE_DM;
>>
>>  	if ((ggtt->pat_encode).pte_encode)
>> -		pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
>> +		pte = (ggtt->pat_encode).pte_encode(xe, pte,
>> +						    xe_pat_get_index(xe, XE_CACHE_WB_1_WAY));
>
>Hmm, looks like this series is still based on top of Ravi's old series?
>I believe his series was going to get reworked to remove stuff like
>XE_CACHE_WB_1_WAY, so some of the underlying code here is likely to
>change.  I think Lucas was going to help with reworking that, so he
>might be able to help reconcile the updates to Ravi's series with the
>changes on top that your series is making.

yeah, new one is https://patchwork.freedesktop.org/series/124225/
I will submit a v2 today.

Lucas De Marchi

>
>
>Matt
>
>>
>>  	return pte;
>>  }
>> @@ -102,10 +103,8 @@ static void primelockdep(struct xe_ggtt *ggtt)
>>  }
>>
>>  static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>> -						enum xe_cache_level cache)
>> +				     u16 pat_index)
>>  {
>> -	u32 pat_index = xe_pat_get_index(xe, cache);
>> -
>>  	pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
>>
>>  	if (pat_index & BIT(0))
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index 7e55fac1a8a9..7981075bb228 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -31,7 +31,7 @@ struct xe_ggtt {
>>
>>  	struct {
>>  		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
>> -						enum xe_cache_level cache);
>> +				  u16 pat_index);
>>  	} pat_encode;
>>  };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index ebae0117f577..9d201bdb9f25 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -25,6 +25,7 @@
>>  #include "xe_lrc.h"
>>  #include "xe_map.h"
>>  #include "xe_mocs.h"
>> +#include "xe_pat.h"
>>  #include "xe_pt.h"
>>  #include "xe_res_cursor.h"
>>  #include "xe_sched_job.h"
>> @@ -162,6 +163,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
>>  	u32 map_ofs, level, i;
>>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
>> +	u16 pat_index = xe_pat_get_index(xe, XE_CACHE_WB);
>>  	u64 entry;
>>  	int ret;
>>
>> @@ -196,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>
>>  	/* Map the entire BO in our level 0 pt */
>>  	for (i = 0, level = 0; i < num_entries; level++) {
>> -		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
>> +		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, pat_index, 0);
>>
>>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>>
>> @@ -214,7 +216,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>  		for (i = 0; i < batch->size;
>>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>>  		     XE_PAGE_SIZE) {
>> -			entry = xe_pte_encode(vm, batch, i, XE_CACHE_WB, 0);
>> +			entry = xe_pte_encode(vm, batch, i, pat_index, 0);
>>
>>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>>  				  entry);
>> @@ -259,7 +261,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>>
>>  		flags = XE_PPGTT_PTE_DM;
>> -		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, level);
>> +		flags = __xe_pte_encode(flags, pat_index, vm, NULL, level);
>>
>>  		/*
>>  		 * Use 1GB pages, it shouldn't matter the physical amount of
>> @@ -454,6 +456,7 @@ static void emit_pte(struct xe_migrate *m,
>>  		     struct xe_res_cursor *cur,
>>  		     u32 size, struct xe_bo *bo)
>>  {
>> +	u16 pat_index = xe_pat_get_index(m->tile->xe, XE_CACHE_WB);
>>  	u32 ptes;
>>  	u64 ofs = at_pt * XE_PAGE_SIZE;
>>  	u64 cur_ofs;
>> @@ -494,7 +497,7 @@ static void emit_pte(struct xe_migrate *m,
>>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>>  				addr |= XE_PPGTT_PTE_DM;
>>  			}
>> -			addr = __xe_pte_encode(addr, XE_CACHE_WB, m->q->vm, NULL, 0);
>> +			addr = __xe_pte_encode(addr, pat_index, m->q->vm, NULL, 0);
>>  			bb->cs[bb->len++] = lower_32_bits(addr);
>>  			bb->cs[bb->len++] = upper_32_bits(addr);
>>
>> @@ -1254,7 +1257,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>>
>>  			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>>
>> -			addr = xe_pte_encode(vm, pt_bo, 0, XE_CACHE_WB, 0);
>> +			addr = xe_pte_encode(vm, pt_bo, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>>  			bb->cs[bb->len++] = lower_32_bits(addr);
>>  			bb->cs[bb->len++] = upper_32_bits(addr);
>>  		}
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index ddb4d9c33181..5686ed9be175 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -11,6 +11,7 @@
>>  #include "xe_gt.h"
>>  #include "xe_gt_tlb_invalidation.h"
>>  #include "xe_migrate.h"
>> +#include "xe_pat.h"
>>  #include "xe_pt_types.h"
>>  #include "xe_pt_walk.h"
>>  #include "xe_res_cursor.h"
>> @@ -68,7 +69,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
>>  	return pde;
>>  }
>>
>> -u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>> +u64 __xe_pte_encode(u64 pte, u16 pat_index,
>>  		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
>>  {
>>  	struct xe_device *xe = vm->xe;
>> @@ -86,7 +87,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>>  	else if (pt_level == 2)
>>  		pte |= XE_PDPE_PS_1G;
>>
>> -	pte = vm->pat_encode.pte_encode(xe, pte, cache);
>> +	pte = vm->pat_encode.pte_encode(xe, pte, pat_index);
>>
>>  	/* XXX: Does hw support 1 GiB pages? */
>>  	XE_WARN_ON(pt_level > 2);
>> @@ -104,7 +105,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>>   *
>>   * Return: An encoded page-table entry. No errors.
>>   */
>> -u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>> +u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
>>  		  u32 pt_level)
>>  {
>>  	u64 pte;
>> @@ -113,7 +114,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
>>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>>  		pte |= XE_PPGTT_PTE_DM;
>>
>> -	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
>> +	return __xe_pte_encode(pte, pat_index, vm, NULL, pt_level);
>>  }
>>
>>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>> @@ -126,7 +127,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>
>>  	if (level == 0) {
>>  		u64 empty = xe_pte_encode(vm, vm->scratch_bo[id], 0,
>> -					  XE_CACHE_WB, 0);
>> +					  xe_pat_get_index(vm->xe, XE_CACHE_WB), 0);
>>
>>  		return empty;
>>  	} else {
>> @@ -597,7 +598,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>
>>  		pte = __xe_pte_encode(is_null ? 0 :
>>  				      xe_res_dma(curs) + xe_walk->dma_offset,
>> -				      xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
>> +				      xe_pat_get_index(tile_to_xe(xe_walk->tile),
>> +						       xe_walk->cache),
>> +				      xe_walk->vm, xe_walk->vma, level);
>>  		pte |= xe_walk->default_pte;
>>
>>  		/*
>> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>> index 0e66436d707d..6d10823fca9b 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.h
>> +++ b/drivers/gpu/drm/xe/xe_pt.h
>> @@ -47,9 +47,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>>
>>  u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset);
>>
>> -u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>> +u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
>>  		  u32 pt_level);
>> -u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>> +u64 __xe_pte_encode(u64 pte, u16 pat_index,
>>  		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level);
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c53d5c1580df..28e6429488ee 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1196,10 +1196,8 @@ static void xe_vma_op_work_func(struct work_struct *w);
>>  static void vm_destroy_work_func(struct work_struct *w);
>>
>>  static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>> -						enum xe_cache_level cache)
>> +				    u16 pat_index)
>>  {
>> -	u32 pat_index = xe_pat_get_index(xe, cache);
>> -
>>  	if (pat_index & BIT(0))
>>  		pte_pat |= BIT(3);
>>
>> @@ -1217,10 +1215,8 @@ static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>>  }
>>
>>  static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>> -						enum xe_cache_level cache)
>> +				     u16 pat_index)
>>  {
>> -	u32 pat_index = xe_pat_get_index(xe, cache);
>> -
>>  	if (pat_index & BIT(0))
>>  		pte_pat |= BIT(3);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index c4d866840d6a..685c2179e533 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -340,8 +340,7 @@ struct xe_vm {
>>  	struct xe_file *xef;
>>
>>  	struct {
>> -		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
>> -				  enum xe_cache_level cache);
>> +		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat, u16 pat_index);
>>  	} pat_encode;
>>  };
>>
>> --
>> 2.41.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
