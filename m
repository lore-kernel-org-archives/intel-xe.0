Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56604EB64D7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 02:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9010E040;
	Thu, 29 Jun 2023 02:29:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C062010E040
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 02:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688005761; x=1719541761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1/hFNUMr8q70GBkYlp774oB5RN40kmswWPKk3nvrsgE=;
 b=mJN0GpdHD9FBAp6MaZ3B3uzrNJCz549MdFcY14y6rKfpuajNX7/jvzLi
 dU01YgPhTX0kOkppxM1WnT7HOGgaH65r/E3iOFcmLNYZ/LYYFRWKgj6mU
 LL8GONY060LzYTpTReWSTMX/isdklBivZjz80roUW5K+Dt+8f2XzA3KjE
 yROk8pckZ0HoiqnS7ssBZ4RDSVWgXTeYm3hOuFXlJ2etG91/G9UlqSIhj
 hiD/X3kvCsvdfpKn7DO7ur1pCgWLq7n54ZT2PmGSo9wyybMbX+ZqoY/Zc
 b0B2ZrdJD/18+ezkx9qJVVTFlCpxARUZbow1mXTf77smBDVbV7arAhMKq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392729798"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="392729798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 19:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="717195093"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="717195093"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 28 Jun 2023 19:29:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 19:29:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 19:29:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 19:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQhCtwNNZfThel4pK4QfUYliyzi9CwlmU8CKw2iBNluTcA1XDx/EFOT1ziyJhhvw2Jr+tSbPZK4Q/u1/f8g3+S/ncUlgI//E0gNYNVZo2YFGt2hAeQzLJWxE3hr4ThRRbfDpbu9JScoa9Eb4nM2SrX5x1zliJ/Q/lYI3CLzaFio56b5pL0WoPeC+ZTxVYhiIO7IVZCFRGn0NM9iW6/QwV7xlucrMf1sGt/YO2VjWeVWdODaOZs2myqu2ivbTsXsntA+XBDVnaS6arAYKBf6Sp2x4eHpeDhijg5EYLeqAK46PmUrQFX6l1F8f4P4Aq/w5JRW/JQKZyPJaaFuQZnWZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q6GtBqy09tSn2YQOj61KsgYNg59yEqfZHn0yGIrBuA=;
 b=OztZ+UTd3F4ia92+d9f2QnLHmMF7WE8Ci8cz22nS3pXb8dHGk/mGdCucrN4cF0jPKYgd+A5aOtdQxkAiNiGCyJPpCC3HuGVyLN4DzF4WxodQDsRQgBLp1y4v2LeKJ8k0l5EbA35OAP7mm+dAzmAZh84PJrV0BpfjpLcMpOJ7lbjQeQTPAn5qcyKrFa2pags26CXbM9da4YSxumw1pJCKGpdJDRW0BEIl/MeUjl4wByi3UPFXemgj4zP2xFH5fRbPt6hshjpj6mM+Sv8Bq1VfufY0abNB7DiWaJU/6m9EcDUEdyVx8f56XJ4ODmdFMSxlBgHta2IypAmMT4ETd4neAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 02:29:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 02:29:14 +0000
Date: Wed, 28 Jun 2023 23:29:07 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <7tjqngk5gzar5a7mtd6xoyeyshks443c52cpeutzwq6qnhswiz@fl4z5qgkwv7l>
X-Patchwork-Hint: comment
References: <20230614200445.3363527-1-matthew.d.roper@intel.com>
 <CAM0jSHNkKHgyuSUAAHEurhGi2ufhgnyDod0fhaXjTgUFEh6arw@mail.gmail.com>
 <20230615202033.GX5433@mdroper-desk1.amr.corp.intel.com>
 <CAM0jSHOYkQi96+fBbr24KH0Dvkum7jq7D-_juz-sBBG+oLAUKA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHOYkQi96+fBbr24KH0Dvkum7jq7D-_juz-sBBG+oLAUKA@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c40d00b-8e57-43a1-52ad-08db7848a120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vd08KXw5IGDDSq9xQJiNmPmneqhxF3XEhI8BrEx9nkTnt1G9pIvfkcdfI4mYI7yBryez0brlYieGlEdlUgnx+3M1L1gpx0DboMbfCXOoZhG5JvaRlZ3nmG4I6vZwF8GixlNkzuk1bs4ddadxmMkeqrPGtwaRwyeAuk4LzQ9hPs2GH3EDX2R8NdTj+Kr7nVBO1VQMl6ARCMvIObnwnVu2BYZQpfJl6Kdpykk4WEOqO5fn1bykcOU8DHP5fDmqbxDsgundYva6s+0+6d+OJlAtXT1VaUBCCBCa8wGm4FoWUJqsl9YiFnkP639xuszJpxZI0uDmlpoYDFW6tqiQvPM2s4hfG8vzQSZA04RQxLxnNXSQiBl0whOjQDiDgDeGMEsxRE4e0ihoMheTBwXk3WG4SRdjy+qlWtluEzjqMfL1zij5ZmJXJKV8xRQeQZf8srre9XID46vAy+TlbidZdL9Zs0JaJTp6X+nA48uNdgJzDIQaYHwdGoUf3wNUHtD8w8zYsb3Py9kyQyHdpm9nlLk08/sucHDUgYmEOI+C68JLXSWNDpmQgac6MGnWGLDbjASYjKRlBqDiBQhWR3DOXQg0ZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(6512007)(966005)(6486002)(478600001)(54906003)(186003)(26005)(6666004)(83380400001)(2906002)(6506007)(9686003)(86362001)(41300700001)(33716001)(38100700002)(5660300002)(66946007)(66556008)(4326008)(316002)(82960400001)(8936002)(66476007)(6916009)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7/o46ENW1jCh2zP3hMa/9bp5HdsipyiL4ciq4BongP/IdzdeBLwIEEEIycuO?=
 =?us-ascii?Q?03fm34dt9QMexPQBj5C7SJLp2ItiRZJ2Y/PaCPSBC1WHiqscmn3fBDwkpwGJ?=
 =?us-ascii?Q?4A8YczgxnDELxpQpG/MD56wF9WoCQvCc6B1HdlCL/7E76GQOmXnh1JSkqkQC?=
 =?us-ascii?Q?8ULoCcmHxpyNevG4PD795BpH6nUXTXEaT5TSXpbM3Nibv+uev2b03Vc9S+4t?=
 =?us-ascii?Q?JufIybEdAB41ZE6fHnCdm/BmSiSBs7sfTgL4VuaBU76X7dmTDNZ0DbpH4IWr?=
 =?us-ascii?Q?ikXzoXDyTIwVHj6i3eYP3vbOwFh9YmhVoqBeR52LyipOjoxkamq6oVqm755k?=
 =?us-ascii?Q?zXce27lmCHG1i9COtG7/p8bJvwFFhAs5Ql6lSTbkyMJ7rLhP6LGHOEvbgYQR?=
 =?us-ascii?Q?sBbAqAs8tqr9IYfwnHcCQIoit+MgiHD8zN0sUgcZkYNu/zs3MGCDXA9f6afi?=
 =?us-ascii?Q?Nq4SgP/B9jlQ0HeO8OJTRDSB09uOI/6gP2ivBj4NxDwa9SL4bPJyh/at/z7p?=
 =?us-ascii?Q?qZkk3vXnAl0OFHGibswxKkR7WdkayvpZGAsPsMRj21fRaRZkBTLvzJx6L/Jz?=
 =?us-ascii?Q?Wwm3vDQvorDOMjphd5x7+1HkQUXz+r9WxyVNoeHP221HI53sri/H8ptNDktv?=
 =?us-ascii?Q?f+hglQmc5gnTY+0v7nQA7DTKn5FG1iSHh3nsbSMrXUo63T4a+SmTmm2WZFkU?=
 =?us-ascii?Q?uQJcAVaNoksMz/cJGw51JW2qyGM2UiiLrrbUc+sriX0zfvEnhnVJsl7GbK/f?=
 =?us-ascii?Q?BFIY7B7s3TOd7t4qKy/1QJD1YvimoUBMVlcc27So8AOMuRwT37E/ZdOMreiG?=
 =?us-ascii?Q?zQ38sf0WuXC78ZEYJdwlfoUNg3vomcBNgGHvoC3ps4XsWG/RzpQWhI9W/YSA?=
 =?us-ascii?Q?yJz/3OiP7pu8tyj9HOYep+qJlQ5MuKecnba48dnOBDmI6aYmzzzKtOz8x0kW?=
 =?us-ascii?Q?t+bQK3z2LecVcE2Y2A2LekUUIxQJ6MNNjiWZ3aH9mePz0JcFkqEzAuzi+jj6?=
 =?us-ascii?Q?HyhJlJAXgmtiBYiGcVR1ONeMUKR7fDE2wfzaH2dFxDNO3lHhGPrkAzzf2O1n?=
 =?us-ascii?Q?ZosAufLoQKeXm/HFPBwQ1aK7YM8sqP5dBJTlTtSZUqLLImaDpbfLSGQfxkVB?=
 =?us-ascii?Q?lXsHE9F9IRiwRJjJ4scTNc5Qz2wIf4z4mXnHXwPyJlpzHMzoYEM1V8Veta7x?=
 =?us-ascii?Q?7TRtDO8ZCI0C5+SzeMa/r0uIqF/V4lsrQZZ8AJvDy8DsRMaOsPBjOnEOZBg8?=
 =?us-ascii?Q?pO7KxsDYjnUGseg2+3vcTPT1eUGXxDCvgaIp/+t0brYfPLpCWBKM0cs3HyR9?=
 =?us-ascii?Q?zy7pMXIVtnoG5J1vgBnhxHmF41PfmqKXNwE01P4JbQkryYgnAD1d4MZqgmYc?=
 =?us-ascii?Q?f0o1RL2LA0LL/SJNkAZuenQRyfM2nHQ6sWS0lfrInqj+rFzZ3sL7DuyAE1t0?=
 =?us-ascii?Q?Qt7r6lWY7MAn+KS23876tjj1iDa4/mNAem7zUvk/vlCO9pBj/8j6iMqnw3Bn?=
 =?us-ascii?Q?2muN7oUshIpqKbhpF80c3wYVAWGG2Io+HVt+OC529QI5OLCFgrws8Wk6dqlH?=
 =?us-ascii?Q?BbBRQiqno1zID2OlStLUEwsbFDZ/yVzwYwNiIuVK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c40d00b-8e57-43a1-52ad-08db7848a120
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 02:29:14.5060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cZytSdpwoccTvYdTPT8CLj1Qz7Q7axpkQFWIxbNL7U1PlDdFnnzLMP867E0kvKGTEGCGOmbPf4IACqsA5Xa6zGXumorkBjuEXyBjqrG77A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Grab runtime PM over MMIO ioctl
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 01:10:49PM +0100, Matthew Auld wrote:
>On Thu, 15 Jun 2023 at 21:20, Matt Roper <matthew.d.roper@intel.com> wrote:
>>
>> On Thu, Jun 15, 2023 at 09:42:03AM +0100, Matthew Auld wrote:
>> > On Wed, 14 Jun 2023 at 21:04, Matt Roper <matthew.d.roper@intel.com> wrote:
>> > >
>> > > The MMIO ioctl (which is generally used from IGT's xe_reg tool) may be
>> > > called while the device is in D3, resulting in invalid results (i.e.,
>> > > all registers read back as 0xFFFFFFFF, writes are dropped).  Make sure
>> > > we grab runtime PM wakeref before performing register reads/writes.
>> > >
>> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> >
>> > AFAIK we should use mem_access_get() for MMIO:
>>
>> I thought mem_access_get() was specifically for memory access (like we
>> needed for a special workaround on some early steppings of PVC); is it
>> intended to be used for all devices accesses, not just memory now?  If
>> so we might want to rename it to something more accurate like
>> 'mmio_access_get' (and also add some kerneldoc explaining when/why it
>> would be used instead of the standard runtime PM).
>
>AFAIK Rodrigo is planning to add some docs to explain its usage. I was
>also under the impression that it was more for stuff like VRAM memory
>access, but it seems MMIO should also be included or really any device
>level memory access.
>
>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/281

I don't see how mem_access_get() would be the appropriate call here.
At the most we should have a dep in which when force_wake is taken, it
get a mem access cookie. Here it is really about "wake up everything, we
don't know crazy thing userspace is going to do".

In that sense, why are we not getting the pm when taking the force wake
rather than wrapping it here? Shouldn't a force_wake ensure the device
is not pm suspended?

Lucas De Marchi

>
>>
>> Actually, I'm having trouble understanding what mem_access_get is trying
>> to do.  It seems like it's trying to avoid using the runtime PM's
>> refcounting and is turning it into a boolean on/off instead, which makes
>> things a bit racy.  It's not obvious to me why we're trying to work
>> around the refcount design?
>
>I don't know the full history here, so I'm not completely sure tbh.
>
>AFAICT the racy bit is in xe_pm_runtime_resume_if_suspended(), when it
>calls pm_runtime_suspended(), which is a TOCTOU bug and also doesn't
>work if we are currently in the process of suspending/resuming, but
>the reason for having the check is to prevent deadlocking when
>pm_runtime_get_sync() is called from our runtime pm callbacks. So
>dropping that check fixes the races but then uncovers all those
>deadlocks. Parking that to one side, I don't think there is any issue
>with always calling pm_runtime_get_sync(), we just need to have some
>way of asserting at various places in the driver that we have ref > 0
>or perhaps that the device is PM active. But if we end up having our
>own mem_access.ref then there is no strict need to call into PM every
>time.
>
>>
>>
>> Matt
>>
>> > https://patchwork.freedesktop.org/patch/542124/?series=119213&rev=1
>> >
>> > But that requires first fixing the races with mem_access which is
>> > quite involved, so perhaps using runtime_get() directly here is fine
>> > for now. We can just replace the instance here with mem_access once
>> > that's ready.
>> >
>> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> >
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_mmio.c | 3 +++
>> > >  1 file changed, 3 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > > index f7a7f996b37f..5f4c8ae23771 100644
>> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > > @@ -19,6 +19,7 @@
>> > >  #include "xe_gt_mcr.h"
>> > >  #include "xe_macros.h"
>> > >  #include "xe_module.h"
>> > > +#include "xe_pm.h"
>> > >
>> > >  #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
>> > >  #define TILE_COUNT             REG_GENMASK(15, 8)
>> > > @@ -476,6 +477,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>> > >          */
>> > >         reg = XE_REG(args->addr);
>> > >
>> > > +       xe_pm_runtime_get(xe);
>> > >         xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> > >
>> > >         if (args->flags & DRM_XE_MMIO_WRITE) {
>> > > @@ -519,6 +521,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>> > >
>> > >  exit:
>> > >         xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> > > +       xe_pm_runtime_put(xe);
>> > >
>> > >         return ret;
>> > >  }
>> > > --
>> > > 2.40.1
>> > >
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
