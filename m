Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3166CC2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 18:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367F10E562;
	Wed, 15 Nov 2023 18:31:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0886910E562
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 18:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700073100; x=1731609100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v7pYZXYTHn0Dt84bCfaHG1w+c+rNKzfbwJYZplNaB2U=;
 b=LR0h6N87fSJHpNtVTTpPk9BmoF/1mpus5tTEyiSC9hig2ugsXuTWVlpO
 GA4C2c5bFWXl9iCbupjUoWO1svOPZ2HnvN0u/z7nEjsfUaDvY3cJlgxPM
 I2vssYvxK6JO8+b0gtWibZw7qIO3Q5V2p5qrlbJVFqQzlKXhwPzaX459v
 bCO9DZYI7kv7Ugr4DueVSWXdsKCxmLFeSdcQThYwxYQZJO4oTbHOXYnnv
 sE/DZ5H1++p+zcGtfgoZPGOZz7uAFkTSajH+tAXvEB8+BNLmrdGWtNwbH
 JdMTdVhu5/3Ns4kCEGmKwBYBfrkX6nvH7X/s+8VCIz3b0Ue+m5pIi0S7P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477148660"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="477148660"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 10:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855731448"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="855731448"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 10:31:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 10:31:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 10:31:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 10:31:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 10:31:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA/01HrSYJp1pgAEWVloSBEeWpa9Y5JywtJgwmI3lbC+wJsidLb4tYNjDI2maiJpgYOcDq879yHmgRBeA+QB5mjHwiDZHrq6PPhUevsjUDRJWBNdo9I8xErq1HuLFnXFO9bqj6JuOfuHJFJg0IJzlWNSy3Jxvaq4KLK80na4kqIRHIIHITI+9+bSlYN11tAEyXyby/X2WP+vXidMULKT55dCv+Ek64TBqX0mlalL0ioeqI2bFlSfCmGnZp14swzR+n0yBIMWslB3cwDoPHPGeA8MbcogY8gX/M3e8ri/W9ZzS3xfoKRK0zNvSkoq8sxZ1/RbCxOIRG73qnTVuNCHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbvnkXx0pN+lP/NR9xDXswgieEgfo0X/e5Q9Zc7OvKM=;
 b=P/KpI9bpRxj0VBuUsoVck0u3LE+0vae7VfLkodlGscdSrpDTDGxGpL8+yFnmOX1Q4LsZXaEaTyPksk53IvsdtmtyZe5dlppFB78IJ6OfKBSGP0zJJisn7qUP6OmobhO9YA49swW4O1LEKEDIXDMTa+zSPxTZj6MaqVUm0bjzhXBP0ZPG9agciWf9X+MEFcJXr4q4JIMwBXrdXr7HWx2fJEOLWUPNLk7hBm8v2jtBMDnbRLZSfyO1CSaGrmftaaik1VImPBK0b4mzhna0h4OvdojMzWXmf3Fc52leAB7WsQSMdky83A+MoWvBcW1EPi9JPhMEqn+r5iV7mUltbQVMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 18:31:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:31:29 +0000
Date: Wed, 15 Nov 2023 13:31:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <ZVUOfWnAi8Y8qhPF@intel.com>
References: <20231114220922.88268-1-gustavo.sousa@intel.com>
 <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
 <170007111735.1634.7618023957528021915@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170007111735.1634.7618023957528021915@gjsousa-mobl2>
X-ClientProxiedBy: BY5PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c6cf16-f3b6-4fa9-def6-08dbe6091520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oUGSh+BdezQPMiPKZy8TMv/uqCOgMzzqNHjGTxZBqXhcXekQf5r5HamMBk/rna1o0+f8AgXb8yLWab7ZHDZFdKkh5QbhR/y5Vob1j2fKNCQa0FR053IFOUIGtbxLXqLgVcZ+yxAWUEy1xprICG0OZJZUMwPjU3Nl2ly5Ia4YuImr9J2LmE25/ilsOBWkUsVn3bVBgOq0F2vtbcu1AUwJiWu4qhtPVvo1DYNqzjssohsDH6EY8X0Ruca783O+OMekwVnGE3pq+drHXOXUMDiKZ1t6SYl9tHjM+Q1TgAEjc3N61SRriYzydkgBcGP+soYi/FwXNvMThAJHYnDygnB1Pc/Cuc/Dlz7x9HwvMOOTfZ30PhaS3er0SPheM/pLoWcAtrtqnlCUnQ5DO1B0x5sOp4CCL6EuGNOblrS0n8j12OA0+GzObCGl4alw1CnUpo6XZIQgHHL9o7EnN0NgLxdOz7l8gIUubFpOLiAs4ZEIgStBfHUnXzOVXN7uJOQUzj1wX+2uweLGKpwNaawQy8R3Rjnux+XiSnq2DeXtcbYMXPfh/CdBev07NEFOO+N4HhApDmSIDvInjmJL0ECnZsKTQmehu0soMUio3kr+X9Z0pewJBsw0npvBVg/FQCjVjg5c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799009)(4001150100001)(41300700001)(2906002)(6666004)(6506007)(5660300002)(36756003)(8936002)(6862004)(8676002)(4326008)(44832011)(6486002)(66476007)(66946007)(316002)(6512007)(6636002)(86362001)(2616005)(26005)(478600001)(37006003)(83380400001)(38100700002)(82960400001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WgLnVIBz2zcMtPWWP+PxHwm9YCWCJ0mnQOzveRV5VB74TZh9b5+z6oXTVrNc?=
 =?us-ascii?Q?h6XkFdeoVnhoy+k8fWWNM6QJAiOA5clgdJhar1619Sr4blnvAIj1JKgAwzYK?=
 =?us-ascii?Q?M+ksv6PKWDNAkEiZaW8rEWspw/M/EevxzT0lQkJpwGN3Jr80cnHZplvv2+q1?=
 =?us-ascii?Q?GqAqhxcI+ZJhFO9HJXmxU6kCt+9wSU2jtLI834028m8UF46PvXMi8zTjFxCy?=
 =?us-ascii?Q?0ayitpRYEJlV+S2/9kS4Qxi13UAhn/c/FRH5hBwwPz0M4FuW26vIp33wx+cP?=
 =?us-ascii?Q?m/hGXk9EAfPDDOxA8szRS5nMum0V/YtvIko/y1ULYgmfWC3ziC45CsV6Xz4t?=
 =?us-ascii?Q?IIzkS8p+L0LuYc/s8A6SLVUU4P96fIvpdgYPc2uuAcMhDhMr74BdbV/J3BlD?=
 =?us-ascii?Q?zIQEY4OmSfWVfIgGL7NWMMZkUT1978DqIX6N6jRmzdccE/txIN866gw2rXxj?=
 =?us-ascii?Q?dO5J7/D8nzt88rELWIcLm1TbUuE820nWjwrnPbRui6rihnkabhe6wOt3VBVI?=
 =?us-ascii?Q?Yz4dI3FXr5wnVh8eYbRRQVYDeOK38hkOXuzSlAY3RxFe6c3LbMfCav6sTEq6?=
 =?us-ascii?Q?T9twHxDpXtkqoYMaWW6yofc+iG86ajVqHSPDqgFWX3w/vuW/FlITn/lC9fcm?=
 =?us-ascii?Q?Y8hDOpm5DAowZO+pf3TJgpZkgGAh9ULhYmKHHo8J7giIUkdZLNsbo4eAOCVJ?=
 =?us-ascii?Q?LtCgmz7mKKkofcx20t6l2PqnN8PSV2Lv3pOxrolM+Ewx9NV87RaR1gXS/FuZ?=
 =?us-ascii?Q?uwAarJs6ihhHVbqAUZi+7i3vsyxlUupv5hGKCCnBrtps63bCru0Qv/TnIiCE?=
 =?us-ascii?Q?m1nsxMSdTF2yBhMM7aQ9BXXK4Tq0E36cdXbf4TzV9qbU0VUQNtSyvKgMnK/i?=
 =?us-ascii?Q?Mi2sBsEUK1Rs0P4ClkbaCNMgdYEm/nM62uTxzXdDe/rB6HXPBoV2kVBea/Kg?=
 =?us-ascii?Q?uo2dbI+lWLagkrNVdewGh19ZfszANY49/ZR/7yAiDVCE7+N5NigQ2UznzP4r?=
 =?us-ascii?Q?Y6EXf5oDVWDReMGPahjhigfjvLSxrcKgJyFdY3esg4dE0KXJAl2pBz0vEabL?=
 =?us-ascii?Q?U5gt4xGgEU2wii9F1EBJVdPBb3co4UsCTAanupCVR+Mzy7zqo0Hxj9mSg2AW?=
 =?us-ascii?Q?wLXRsPfmsud4HpoJLPYlQrCaXd7fgMUkjXiUB1/wr9ci8YIkk8jHcWwO/wvC?=
 =?us-ascii?Q?JPf6q53VO1ag0nCZfvd25OJgRf0uRwewgC+qfiJftzOvfaBq99D6B7CfyE9o?=
 =?us-ascii?Q?AeKHgfTzGoaTDYT6OiTcFt+5kTjjT9U1OV4apgs0PTrKvJLe67qLUOz6i1Wp?=
 =?us-ascii?Q?PXq8WgoECziXQO/T+vOUP77+bCFXhlp0L4IkA2YF9sbN+NroN/i+XHwyAacn?=
 =?us-ascii?Q?KoXMzqaqIex565xqqYoHIi8mMPUD1dsZ2LB+J4wEC9IE/4HT794puU4/2aVW?=
 =?us-ascii?Q?rNWd9iR6YOgfvAWTDySJCylQsU3aQL9YAq34USR31BqAzGc50QJs5pWRhQ4U?=
 =?us-ascii?Q?aWgd4YEKjasXNgkBmBw6S9x2BXGFIN8Vk2kQNdvG4Ltg4np31XJch1hywkLO?=
 =?us-ascii?Q?91qnxgIqRuZJ5rMS/RNP2VOdBeddXXzpNmR6CrvSxgrkBUa7oxfBhUfbtIdI?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c6cf16-f3b6-4fa9-def6-08dbe6091520
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:31:28.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzuiAFDXe7joxYGqu0qEDaYiNkHd21R+c2N8UeSDBp0yVmL2LEvNdqaXa4AKjsW9ap77WSzvbyfwgDaHVpNzAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 02:58:37PM -0300, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2023-11-15 13:51:41-03:00)
> >On Tue, Nov 14, 2023 at 07:09:22PM -0300, Gustavo Sousa wrote:
> >>With the current implementation, a preemption or other kind of interrupt
> >>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
> >>interruption (specially in the case of preemption) might be long enough
> >>to cause a timeout without giving a chance of a new check on the
> >>register value on a next iteration, which would have happened otherwise.
> >>
> >>This issue causes some sporadic timeouts in some code paths. As an
> >>example, we were experiencing some rare timeouts when waiting for PLL
> >>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
> >>we found out that the PLL unlock was happening within the expected time
> >>period (20us), which suggested a bug in xe_mmio_wait32().
> >>
> >>To fix the issue, ensure that we call ktime_get_raw() to get the current
> >>time before we check the register value. This allows for a last check
> >>after a timeout and covers the case where the it is caused by some
> >>preemption/interrupt.
> >>
> >>This change was tested with the aforementioned PLL unlocking code path.
> >>Experiments showed that, before this change, we observed reported
> >>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
> >>reported in 5000 runs.
> >
> >good find :)

indeed!

> >>         for (;;) {
> >>+                cur = ktime_get_raw();
> >>+
> >>+                /*
> >>+                 * Keep the compiler from re-ordering calls to ktime_get_raw()
> >>+                 * and xe_mmio_read32(): reading the current time after reading
> >>+                 * register has the potential for "fake timeouts" due to
> >>+                 * preemption/interrupts in between the two.
> >>+                 */
> >>+                barrier();
> >
> >we are only protecting here against the compiler reordering this. I
> >don't think it will due to the external call to ktime_get_raw(). Do you
> >get any failures if you remove the barrier?
> 
> Makes sense.
> 
> I put the barrier here to be sure that the compiler doesn't surprise us, but I
> haven't tested without it. Maybe it is not really necessary indeed...

yeap, probably better without the barrier if it works.

> 
> >
> >Anyway, we probably don't need a full barrier and just using
> >WRITE_ONCE() for both would be more appropriate.
> >
> >I wonder if we could do this logic better and have a header / wait /
> >tail approach. In both header and tail we read the mmio and don't
> >care if timeout occurred.
> 
> Yeah. I was thinking about a something similar, but ended up sending this way to
> have a single place doing the register read.

yeap, same reason why I had kept like this in the past. but I wouldn't mind
if you believe there are other better ways. as long as we respect the timeout
requests.

> >
> >+Rodrigo, shouldn't we move this to a .c? IMO it's very big for a
> >inline.

indeed... although I believe the compiler would really ignore our inline
request if this gets called from multiple places anyway.
Iirc I had seen other inlines in the kernel with the same size so I thought
it would be okay. But also fine by me if this gets moved to the .c

Thanks for taking care of this,
Rodrigo.
