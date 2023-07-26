Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3883C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 21:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C27C10E4C3;
	Wed, 26 Jul 2023 21:58:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEE010E4C3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690408700; x=1721944700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TYBOVYl8yRKZs4RxTFgShSUBygyJbXLZGb0YW+kGRms=;
 b=hl/Kk5rwFIKDvSQrwgycBWZ6a+lIkJyE3zfwXbs2znwQMVGd4SeNruow
 FuxR2PDxi8GiRB8QFwtJmt5sbAiW6vECOBYC3SDnROmwzOafGcJjbJQ4r
 4/sMvZCFA33tTrH4Y6gj18plAYrqORQGm46Vimpw8DaaQJCyCKcktSnVE
 /BK0WUSUCu/ifMNyTGRI5xH6dVwfxOM/aXD+/rt08atZTvyWhrpU2dn8z
 m7IcyPiSf0TEfXZpNKq69LbEGsZfEHHfe6wZP350z5gBKzf1P0BTvLHNL
 DOEW1D0iduLIchtD+svK9xAAooneCBhLpZM3tFfTAvrhhSMqijuiS6faR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358138243"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="358138243"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 14:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="703901552"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="703901552"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2023 14:58:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:58:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:58:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 14:58:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 14:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEhZjvaGd2nC5LS8a8x8rNpExgATVDx0zHT6y7iK26zeQRoAlIxM0nYEEeWDVY3vqCTCWwgqr2No4Qd+c2y11omrMZSVwczAetHpP4OPelE2irTDitbRp9T7h/W7XNx+nkVWfh6GjQ/ciJafvR81Pu2bG2+lqsaFGgerI/+bkPjnsqSloufn8b7nhdYjC5XXohAQ3gsUXOU+caYPLjSscNoDAQ2t5klbnDt7U4Pm3jCjJFDio9DkWVtyi92Zztw8Vik8xMyx8QeqF5kA13ETFv92Teg+Wj+iuEYwnOk7pRDAmd4QwmDVfsxGiOy9LCzecs2d+iA7QEwSwLlvOx3PCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KDKlV8xo2gxfMdLuGzK8nXPOlBscXP6+tg/Ovy0KFk=;
 b=bRqnNL1cAwwwIR1x+wLe79XJHMX1G4GuJ/1pGx360AIyfI6vjc/BhyN5RYBeNYLMI2zOAr031ujBsKcNJZSDXpx0LLgyCImkOS74/0wgJbTNL7zXawRG1uWK0Da/6OlQTugfxi6TNVAFyZhSABN0O4udPbLbUswp8z0OATdq0GhENZ5dFTUkPLqBzpw5LNVWIS9yoBFWF5fQgRkY9LSoFXHJYloszRun9XYl8emj5GzuRdBPmyIXk+mHKrdubNXwTCj/NZaPOwFw9Lo0UawFnL6gmxynKIcy2VQTGroYXQ6VmNJAoSX5WH6mBy33jfVBEQ8tOEP+MAxgH6k7kzKnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 21:58:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 21:58:06 +0000
Date: Wed, 26 Jul 2023 18:58:01 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <gfkhtmyxmaag4s2z7ux4a5lgx5l2ad2f6oohibbpvcidn4xngi@vfyqjexmrjwd>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
 <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
 <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
 <ZMGRjCuCVkXezCty@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZMGRjCuCVkXezCty@intel.com>
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df06fe8-83c1-4113-b491-08db8e236476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyRLVn0iSXI2S/rW7L7HWXJIqblQFMZNsphQGTYzs4zvz1jriUsj8DaDlamKoHYEY+Du6V1pC5eHZY4OkxDMv3qoYn2EFSAleRBEpNlkE3XeJepfNVGXCXPXYibdZdkysz3OK+Yl1XPxaPosDR4LQ6sbGOlAuu8OIvQaadXiQC+2Kbu7BF1tQGQC+g9X+Hnew+yrA6B8JJa5OF01u7JvjyG6T3hukm78oShXfeOaD6SitqVSPj7FicSv0q0AKjyLAsiVyj0UawfTU3Jz9X43C/4s48FFIYnXPgT/T17bgmy+QAhcB5zEYxN4GoK5uirMDGYaxr3Mlb5CtXH9nw9oghQHFy80jq6xnqo7+xwDL7DvrdJIgSE+txQP9O1y+YyJycfprAHZAhic60XMO+VNqlHm/g+YyzEoUK3JJBctk4GA/2TBYWb2pVtZU/UDWMqz5gx2Paa7EdwzrkOPJyFmMZsjrzHsRRP77fau1y++VgpUbONxtHO/1Gsz2zL7Q56WkF+eXGV3JaNJuvgfkJzFNFkCOqY5D/4lg/CUYhUWDPq5JHZaMH0eCs84Td+siJTm0+gwqsAlVovkB7obx9Zf5XNsplzWxru1TvaNbNT19KBY4ZA3bEYjX0wNvCxFggsO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199021)(186003)(6506007)(26005)(83380400001)(6636002)(66556008)(66476007)(6666004)(66946007)(4326008)(316002)(5660300002)(8676002)(41300700001)(6862004)(6486002)(6512007)(8936002)(9686003)(478600001)(2906002)(54906003)(38100700002)(33716001)(82960400001)(86362001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u8rdxV9T4bibrhrDU5AFoyj5wMM6N/tnkp+tFO4WrBK4c3YihEb4m+Yq9RUW?=
 =?us-ascii?Q?CbwO10QcscxlV681co5XJNs7XN8qYstzuweyQv55wxNDVq8XWRsa4ZTpSPPf?=
 =?us-ascii?Q?yHR5lZG0HD3W+SK2ySK/GcHrtAa5WGlc2kYRMrWq2kNLUnS5xl44YuCsBuWQ?=
 =?us-ascii?Q?VVPzzw/taLtmuU8fQM8S/0pqsrnWn9bsI345hsQaqTUDNxSXbN0VD3+xUzeh?=
 =?us-ascii?Q?kd/HF3+g4rgkLniQGnrOGFxy1Qtp17Ew4TNt+qHf55Ow0D7npSF1n8f9QKG3?=
 =?us-ascii?Q?ATb2bnoQojXFzampFAqrm6KzAwghj6Yn5XfvAb8fbpw9WaBSmDbsl/SyZVoG?=
 =?us-ascii?Q?imhkJQgFnKgGfHXlS97VokN5vFtbFeQMEfTJ7FG1TIsD3czTKBgArzKr1u//?=
 =?us-ascii?Q?VD/BJzdqzLmWLsJntF0DQRcQbcCvWQS4gLOMqNNTCo9Kuxyo2RBLqCofdx8w?=
 =?us-ascii?Q?TWsPxgFFdJEkHwjLBUnOlxAVu/cKpLRIessU7Evio5GXVNy+r4GTS8fYI3Sm?=
 =?us-ascii?Q?FFM7CH9EyOTjCkv+syxm5p+JEkDWu5Duj/WW1TXR83gRfFmPA8+gtSUfDe/E?=
 =?us-ascii?Q?yDxmzeb2lO/ZwkEKriosDBuphMxrf2rSXuqGhZgfEIylea76cFjr3FI9zyka?=
 =?us-ascii?Q?i/QNV6/2mCC1/ASFkKoGoNedjsrqlahVk08q+oT0C/nUi39K9jPmQEUtd8xR?=
 =?us-ascii?Q?uXTfsIZExz2SsYSIydCVvvCvVGT8u5uoSm4MnP8AdbxCk3W6uRvCL5TebICP?=
 =?us-ascii?Q?bMQMobir04htzUzlecd+0I62HCePBY5A6ZX5Uqa254RKQBSefFCz2zWTSA5f?=
 =?us-ascii?Q?PHP+sfKdFU3vs9ud2KEw3gWYUBO/6Ffyk0akbiwbIYXOIQ/6f8cvwnfnbcB4?=
 =?us-ascii?Q?LCNvu87bl5lx9t9ZoBg5gx7Dcf3sJgjbGoL2RDYmEZvTUKA1aThICjwGCpBL?=
 =?us-ascii?Q?aPJXL+2k4ZIpToah1T13MwuQbp3HQHCGBsbzaPlJuvmtAgO2KbuWkpVpS+3V?=
 =?us-ascii?Q?XawrvddHvM5rj47IOBMst6iwB0kMKZpDtM/f2ZmNbtQCKljWywnRCYtY0Zyq?=
 =?us-ascii?Q?eB735bvH1uR2BccS+wQgbd3vQM3ZPcx6DpFh2zo+p2bAWzKOzJu38eKdwcKP?=
 =?us-ascii?Q?iW/wN+EsAK6EyPChVEajT1SWDWFzWL4EUvRm+KqL/1HgwezaTnDIkOT7No32?=
 =?us-ascii?Q?8UwyuEkjNLXRXQYN++YCr2T0oWIzhUTS0cOJ4N8/8GH71keOf3qNCPta9Jn1?=
 =?us-ascii?Q?+R7byNlfYj+P32ot2WwQ1k01IAZkCxieq/dZffFHXtGBv/93F0LzwZrdf5dp?=
 =?us-ascii?Q?s/R9eEHHJbF7pAcrvhSecLU1SlEV7+VSaotOHwDAr/IEU8QKNgguzy40Vt0r?=
 =?us-ascii?Q?3IW2OAvqcg14N5uxFlo0HyrnAzKpE7M5UMmG1HYO5eTXz1gus1ab8WbH0pIv?=
 =?us-ascii?Q?oQ/lsQhp+V49uRWJt2HXwhQqyG7/DlmI7jq4gPo6l+Y2pE40TCnpVq8Orn3y?=
 =?us-ascii?Q?PrlXtA26cDuZ/784aSnWc7aGrPKwbxFN0PyZ443KymORckBbGKNoJmrW5ewI?=
 =?us-ascii?Q?jh0jaYS4xIPtgQHEONU/KoTjFznU6J+EFlqG2cYv4aGO/5hwsuA9UPWap0Ny?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df06fe8-83c1-4113-b491-08db8e236476
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 21:58:06.6572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/07EKvZ4Fw2K4JSte/MsZXaqKzWzag2xAfaeJbavMmMfSQjtyoCDOIcBq5u6RxWbItjZnIAav/qkhSqWFOa4doGyFp2Zp6CBrFt1CaJXjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump
 error.
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 05:35:08PM -0400, Rodrigo Vivi wrote:
>On Wed, Jul 26, 2023 at 05:38:13PM -0300, Lucas De Marchi wrote:
>> On Wed, Jul 26, 2023 at 07:37:43PM +0000, Rodrigo Vivi wrote:
>> > On Wed, 2023-07-26 at 19:29 +0000, Matthew Brost wrote:
>> > On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
>> > This might be an useful debugging information if the driver
>> > date is properly updated with a certain cadence. With this
>> > we know from which point in time in our development the
>> > driver was from.
>> >
>> >
>> > Make sense to have this, wondering what the cadence should be...
>> >
>> > before we are merged we should probably change the date along with our rebases.
>> >
>> > after we are in tree probably after the latest pull request towards the next version.
>>
>>
>> does it really make sense though? I think this exists only because of a
>> pre-git era. What's the problem with using the git short hash that will
>> automatically be updated and accurate?
>
>well, we still have the drm->date to fill so we need to maintain it.
>
>maybe we could do like nouveau?!
>
>#ifdef GIT_REVISION
>        .date = GIT_REVISION,
>#else
>        .date = DRIVER_DATE,
>#endif

Sounds better. I don't see any value on DRIVER_DATE and having to update
it. Just setting to some dummy value when GIT_REVISION is not available
would be ok

	$ git grep "\.date\s*=" -- drivers/gpu/drm/ | grep 2023
	$ git grep DRIVER_DATE -- drivers/gpu/drm/ | grep 2023

Tells me nobody really maintains that.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> >
>> >
>> > Anyways:
>> > Reviewed-by: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel.com>>
>> >
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
>> > ---
>> > drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
>> > 1 file changed, 2 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> > index f53f4b51233a..79b506dc2622 100644
>> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> > @@ -10,6 +10,7 @@
>> > #include <generated/utsrelease.h>
>> >
>> > #include "xe_device.h"
>> > +#include "xe_drv.h"
>> > #include "xe_engine.h"
>> > #include "xe_force_wake.h"
>> > #include "xe_gt.h"
>> > @@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>> >        drm_printf(&p, "**** Xe Device Coredump ****\n");
>> >        drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>> >        drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>> > +       drm_printf(&p, "driver date: " DRIVER_DATE "\n");
>> >
>> >        ts = ktime_to_timespec64(ss->snapshot_time);
>> >        drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>> > --
>> > 2.41.0
>> >
>> >
