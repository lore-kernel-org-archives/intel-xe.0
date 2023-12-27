Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E2DC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 21:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA5A10E091;
	Wed, 27 Dec 2023 21:57:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057CB10E091
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703714226; x=1735250226;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o499GGFJ50jM5BKx2lM33dIPdIhgrqNuZZ7fLLt0MbM=;
 b=FLVhi9llzsPbwHGlaL5QQYR1li91k6hNOG6U92h1ZwFZJJRlZtF2sHHE
 4UaoNlXRjsCugrs9tg0CxB+ccYZ4nJeZpmJDNsQePXPoas5s+/Kffu2F8
 APA0zf583a2A6kmnaZP4DKUNxadpmF8LPs1xcY3mMsOQfnv9Ses29k8qI
 zw5D7NFcMLNcs9B0RXSohQQTGhZUQ2yFuXWJJvhZdDssbCEfvwbFvMgXn
 XmZ/FChR+dZetD+aMtlAu41KIjpCTuwYw2sU0alnt31HysJuzslUbL1Pz
 oh6ZBwGCu33zDuPCr3qiqo6aNdH7Tc4ojIYYjMMgQ1cPVBIWirq99DeKo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="375976852"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="375976852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 13:57:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="26667122"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 13:57:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 13:57:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 13:57:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 13:57:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI3e8J8eCwrkVvBOB8gz3Kf/h6LFS84lyDhreVqYGcCgZ8vnJreUuco90/64lFOLBfl3HpFSmP7CM4oJNfymfgWTUtsPcZfIavEs4KE8HCpWuca2gvXS9SNnrflOIbIFjBZm8LKRLGFGUhBrzq1zT1hhnZHWvkdYzx6WI6Lx+qQ4kNAI752WurrUaf1JWNia4FWieVaty5/BePrM+bG2MlCdq7OVtPQGzJQyZOuDnDZjkl5Cfa8rdhiNJVnYwjTc4unaKjNbBBgg0A1xNB3VdeyRXO5abpJMVpe9Z/vskAr4BAPwfHZlryHeKopzOkvjEVIhVgJK7Pn2tj/sRSa6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/R7+kM1rQDZrCxNAPpFo7T4Qy/l5dVJyHFJ+ufbqkA=;
 b=WgxHh7iT8SFhA1xWdNMpsQ+rK9Yn2BU3/Bgu9OUGUx/iAHvZDD+35AUTyxVWopV2PPKm4xqG3biqYOf3DV2Ivy+jxxw94MWT/cmSMhGR8SI9CVzJebK8CtVpzVjUnSKsjH9xk8Iw0SakXMyNnFjQo1k16edV3zy3xYotWp3TbMpTrj0xePEe1E0NxAPJF3LXPA4r7obv+phKAO3rhlw0awxhcPtizMEQiXnGC4r+crzIZFdBfhuz/M2V2AyctlLZnQAclxB5o4ld53hXizxRCYZTdpieq8PmZydvZVnVJ/nml7CRsM/wNDbxxUL9UZXoqS+4rS3/662QBJ04R+8RMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 21:56:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7113.026; Wed, 27 Dec 2023
 21:56:55 +0000
Date: Wed, 27 Dec 2023 21:55:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Message-ID: <ZYydV0poSZ0fc7nZ@DUT025-TGLU.fm.intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
 <c777b06d-4323-4bf4-84fd-b06334c97484@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c777b06d-4323-4bf4-84fd-b06334c97484@intel.com>
X-ClientProxiedBy: BYAPR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 10885e18-f510-4a7e-398e-08dc0726bdba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0QH0c4D8UfzUCKPNg5oKi2erDjWQ9Iz50Bae79/gUN26tK5xFq1CrfykHLyczPHyv5mZu50FyZ1c/dU3mAN+q+5Gwec0uEKIWc7YwdSMejcKIhwS0/ajLFRPzBenqztTunxd45XkdveTgPHsb/1RV9XfPofBwORYnPZaBFouLF9U1mZaLyTIgnzu9JFPUC351RNdKSxw79ecUHXo0nALdUORARsBRj2kabMvKxo9QXiR5jt0Vpxqhcq+Rr1J4WXQy7PeKmxBBq2S0xMDiM3zWhxhspg/KerutEU++GMhfooMaI+G3KWlvbcdxGvkuo8Z6PhU4BRbO44LZYiXemW5Lqc+bfP7lOiUpx+8nGOlqkfVkOLZd2vbhHEy9V2ONJwbWEiZByJ1XgHpXIrB7WrVAtZbw8sWmMBBEVHWS3Tfmrgn9ekZ/9+4MaL8nXL7GSNNxOiXvb+aVtxK4ltiAsSSGP4hXNQLuuAJ4QL8+8bp0oP2Op20Ixmw35EAgQPGZod7nVCqC+K3xkzRoZcd/rNjzrgSR34RQBt2jdpk99x72eTAgRO9PpiJcAyNuA/Z2kwU+IOYFtdOUNiNZ+gFJn4Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(83380400001)(6636002)(66946007)(66556008)(316002)(66476007)(8936002)(6862004)(4326008)(8676002)(6666004)(6512007)(44832011)(6506007)(966005)(26005)(478600001)(6486002)(41300700001)(38100700002)(5660300002)(2906002)(30864003)(53546011)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nQCZEQQ2HGJ82gRyFES8yCgsdYWNUFBxezbpRvcctH38ghn787geqVea9C?=
 =?iso-8859-1?Q?UvjxoCBaC2XjdB7Elpvpz6VRsyB+uZ9GMwNKluGVfifRItZ+TZ19Ioc4UL?=
 =?iso-8859-1?Q?tv44SasBYj0sai6kTzjn76NkVzKePNRHQIXk6Q+0DTWs2y7t40SahJI2K/?=
 =?iso-8859-1?Q?Xgq8hSpOMFoCSJbus6wsCjhKJN2CcVq/TGdG+NkHAa3WMm7oSfaben6QmU?=
 =?iso-8859-1?Q?O8PN0BYTgS80JPAOHa/gdFNh7jYxxEAx4nkVWvZCLTzIWmZzrV9rHcLI/Z?=
 =?iso-8859-1?Q?WoCERRH3u2y+3k31U8X7vbt5rUdr4vykaJIM5Gv2olGfASzAml7/uLzVQr?=
 =?iso-8859-1?Q?CpHDNEUHTzdskXjOCYqeBa/7sZWlSa7goE15FRMH5NGh6Ev5lPmYRPpPPe?=
 =?iso-8859-1?Q?fNH9gXC3OaBtB+vO6JaHS6rPNl9suHz5tcKtrlB5/GPqSrSRylIfLPkTZ5?=
 =?iso-8859-1?Q?GEsngZOz7U00hVUCP4AGYdlV9jXD65LHE/obgXEQND80dacxKeOZHyyquB?=
 =?iso-8859-1?Q?17320dOT0u40wnHD6mW3CssVQNLEZI2KEBI43I4JiEzD5s/G3Y1Wm31Eix?=
 =?iso-8859-1?Q?gXuBmN1EyKSyXQ1pnWz+YfR+Zaa/FLl6Kl2fW5NrKmr+kIO4J5/F23Ir5f?=
 =?iso-8859-1?Q?JDbOU/ATCoPcm/aiQ4y/5m2W/tWntF+syF7JFyD8VAjvyVjcmAi3BSg2jj?=
 =?iso-8859-1?Q?56P32dQc8b9DMGo9yt0QnIeQYKvpT3vyPvx8V9+tmf9Zj4kdwNbidO1tb+?=
 =?iso-8859-1?Q?pDEyXB4n/p5WZOU0vi1ziqPstcO6x/mFlYZMHhWU3LmNh0/Ujz0dtb4oDz?=
 =?iso-8859-1?Q?rjtjbKURW7fE37TEVe7X+r9GcVg4C1/ZcNHKmpBL4/LGeS/+y1iOutj+iH?=
 =?iso-8859-1?Q?ZRFm3MJHN1rtHzGUCZmlC3kisPjnLCPtPKpvoEhb2pCH4jFdlglqrWfXYy?=
 =?iso-8859-1?Q?4TPfFWSqc/IcqL2wwUFPqyugvWfISYxW79dYPy5D3Azoq3mtsploSlwWv0?=
 =?iso-8859-1?Q?KdzmIRPbUjs9P4kBY+po5YyzQFCZO7pte1tUXDMZzHou7av47n8kkkwxKC?=
 =?iso-8859-1?Q?eF0Jt9SHz+QXHhRahPX7+8AaQdBleqtPVrIpkpI9o0ve4d7H0dIPvhGwCQ?=
 =?iso-8859-1?Q?BC4dnfVW5tFUbwJbNuvY7tAVVqXXvkZJU0xpKdZGgQKBm2ALZJFP03wuBA?=
 =?iso-8859-1?Q?rBgVURzR06waEnsXDQunPi38qmk5U9wXWZRfIh6u69Yy9MCMuPvaW4fYqy?=
 =?iso-8859-1?Q?c7NmJPP1TMtnw13frxnGhe+5fAuXukuBS1I9CpoSIsOIQQgo0eKjMpAKO4?=
 =?iso-8859-1?Q?u8tcp7KdXT7pKdf1QuQqcshyEHmIQcM8XYnapakKG6n643R18Qwkah4ZAm?=
 =?iso-8859-1?Q?Qwnk2SfUfEffOzF0d5Kj067oHTXlze30brz0JOQ/XYm82lg/mgfrsckk+V?=
 =?iso-8859-1?Q?aCApbB8q1cKEOmwi1srUW1tEawk2m+ylad4rp5m3YiBo5s0Gf97GBPdXlY?=
 =?iso-8859-1?Q?OZ29u72OB75afYqPI16LDAPuziWZNW1USDArBzPsyGTbtZuGbi3xyavDxY?=
 =?iso-8859-1?Q?LdrIlQdOtx4rvuD+O8jcjyYmZwnW5Vu5gTT1mv0zGdHJz29tYFEn6t5UR9?=
 =?iso-8859-1?Q?2/wp509gIpFvSZvKoBoItmWrQ9HHMWVtUg7p7F0ZBB8BtE02SKKSO79w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10885e18-f510-4a7e-398e-08dc0726bdba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 21:56:55.5268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGAzYTxLuw4nRrVbIxyi3LCuRzFSUSEbbzeLJ/0XOIxLtBrvkg9qAkJEci7iXVYSgojDC4aqOm83DOR5OhkmGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 11:36:28AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/21/2023 9:47 PM, Matthew Brost wrote:
> > On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio wrote:
> > > 
> > > On 12/19/2023 9:28 AM, Matthew Brost wrote:
> > > > The Guc CT has more than enabled / disables states rather it has 4. The
> > > > 4 states are not initialized, disabled, drop messages, and enabled.
> > > > Change the code to reflect this. These states will enable proper return
> > > > codes from functions and therefore enable proper error messages.
> > > Can you explain a bit more in which situation we expect to drop messages and
> > > handle it? AFAICS not all callers waiting for a G2H reply can cope with the
> > Anything that requires a G2H reply must be able to cope with it getting
> > dropped as the GuC can hang at any moment. Certainly all of submission
> > is designed this way, so is TLB invalidations. More on that below. With
> > everything being able to cope with lost G2H their is not a point to
> > continue to process G2H once a reset has started (or send H2G either).
> > 
> > > reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() will
> > During a GT reset xe_gt_tlb_invalidation_reset() is called which will
> > signal all waiters for invalidations avoiding timeouts.
> > 
> > So the flow roughly is:
> > 
> > Set CT channel to drop messages
> > Stop all submissions
> > Do reset
> > Signal TLB invalidation waiters.
> 
> Thanks for clarifying
> 
> > 
> > > timeout and throw an error (which IMO is already an issue, because the reply
> > > might be lost due to reset). I know that currently in all cases in which we
> > > stop communication we do a reset, so the situation ends up ok, but there is
> > > a pending series to remove the reset in the runtime suspend/resume scenario
> > > (https://patchwork.freedesktop.org/series/122772/) in which case IMO we
> > This path we would want to put the GuC communication into a state where
> > if messages send / recv this triggers an error. (-ENODEV).  We don't
> > expect to suspend the device and then send / recv messages. That is the
> > point of this patch - it is fine drop messages during a reset, not if
> > during suspend or if CT has not yet been initialized.
> 
> AFAIU one of the reasons behind this patch (internal report 53093) is an
> issue around the suspend path, so we do already receive messages after we
> started suspending. If I understand this patch correctly, we would put the
> CT in DROP_MESSAGES state on suspend, via the following chain:
> 
> gt_suspend
>         uc_suspend
>                 uc_stop
>                         guc_stop
>                                 guc_ct_drop_messages
> 
> Are you saying this is fine for now, because we always do a reset on resume,
> and that we'll need a new state when we stop doing such a reset? (not a
> complaint, just making sure I understood your reply).
>

I missed this path.... This is slightly different as here we do not call
xe_gt_tlb_invalidation_reset() but I think this does indeed current work
but that may change based on some work Rodrigo is doing related to finer
grained PM.

This is turning into a larger discussion as it relates to reset /
suspend flows. I see 3 different flows, lets talk these through.

1. Reset flow (discussed above in my reply)

Rough flow should be:
- Set CT channel to drop messages
- Stop all submissions
- Signal TLB invalidation waiters (this would be a change in location)
- Do reset
- Do restart (entails cleaning up any lost submission G2H, enable CTs, starting submission)

In this case we drop all pending H2G / G2H and the reset flow ensures we
recover properly. No fluhing needed.

2. Suspend flow (discussed above in Daniele's reply)

Rough flow should be for suspend:
- Set CT channel to drop messages
- Stop all submissions
- Flush G2H handler (just ensure worker is not running to race with next step, this step is missing)
- Set CT channel to disallow messages

Rough flow should be for resume:
- Do reset
- Do restart (entails cleaning up any lost submission G2H, enable CTs, starting submission)

In this case, between setting the CT channel to drop messages and stopping
submissions, teardowns of exec queues could be happening as this action
likely doesn't take a PM ref that prevents turning off the device (e.g.
user destroying an exec queue). It is safe to just drop these H2G / G2H
as the GuC will be reloaded. We don't except submissions here though as
those should have a PM ref. Not sure we have a way to enforce this yet
but could add something if needed. After submissions are stopped and G2H
handler fluhed we toggle the channel to disallow any further messages.

Also notice we don't signal TLB waiters here. I am thinking if a TLB
invalidation is in flight we likely don't power down the device. We
ensure this via PM ref counting somehow. That being said, if the device
is powered off and we try issue a new TLB invalidation we likely
shouldn't issue the invalidation (this is an optimization that is not
required).

3. Runtime suspend (relates to https://patchwork.freedesktop.org/series/122772/)

Rough flow should be for suspend:
- Stop all submissions
- Wait for all pending G2H to complete naturally
- Set CT channel to disallow messages

Rough flow should be for resume:
- Enable CTs
- Start all submissions

Rather than flushing G2H, we have to waiting for any pending G2H dance
to complete before disallowing messages as the GuC will not be reloaded so
we need to ensure the GuC is in a known state.

Here we'd have to wake the device on any new TLB invalidation too.

Does this seem correct and make sense?

Matt

> > 
> > Proper error messages will added based on these new states.
> > 
> > > don't want to drop messages but do a flush instead.
> > > 
> > See above. Also unsure what you mean by flush here? Do you mean the G2H
> > worker? I think that creates some dma-fencing (or lockdep) nightmares if
> > we do that.
> 
> I meant the G2H, yes. We've had a ton of problem on the i915 side with
> worker threads running parallel to the suspend code and trying to talk to
> the GuC (latest of which is
> https://patchwork.freedesktop.org/series/121916/), so I am kind of worried
> something similar could happen here.
> 
> Daniele
> 
> > 
> > Matt
> > 
> > > Daniele
> > > 
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> > > >    drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
> > > >    drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> > > >    drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> > > >    4 files changed, 64 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index 482cb0df9f15..9b0fa8b1eb48 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> > > >    	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> > > > -	xe_assert(xe, !guc->ct.enabled);
> > > > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> > > >    	xe_assert(xe, len);
> > > >    	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> > > >    	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > > > @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
> > > >    {
> > > >    	int ret;
> > > > -	xe_guc_ct_disable(&guc->ct);
> > > > +	xe_guc_ct_drop_messages(&guc->ct);
> > > >    	ret = xe_guc_submit_stop(guc);
> > > >    	if (ret)
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index 24a33fa36496..22d655a8bf9a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> > > >    	return ret > 0 ? -EPROTO : ret;
> > > >    }
> > > > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > > > +				enum xe_guc_ct_state state)
> > > > +{
> > > > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > > > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > > > +
> > > > +	ct->g2h_outstanding = 0;
> > > > +	ct->state = state;
> > > > +
> > > > +	spin_unlock_irq(&ct->fast_lock);
> > > > +	mutex_unlock(&ct->lock);
> > > > +}
> > > > +
> > > >    int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > >    {
> > > >    	struct xe_device *xe = ct_to_xe(ct);
> > > >    	int err;
> > > > -	xe_assert(xe, !ct->enabled);
> > > > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> > > >    	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > > >    	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > > > @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > >    	if (err)
> > > >    		goto err_out;
> > > > -	mutex_lock(&ct->lock);
> > > > -	spin_lock_irq(&ct->fast_lock);
> > > > -	ct->g2h_outstanding = 0;
> > > > -	ct->enabled = true;
> > > > -	spin_unlock_irq(&ct->fast_lock);
> > > > -	mutex_unlock(&ct->lock);
> > > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > > >    	smp_mb();
> > > >    	wake_up_all(&ct->wq);
> > > > @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > >    void xe_guc_ct_disable(struct xe_guc_ct *ct)
> > > >    {
> > > > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > > > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > > > -	ct->enabled = false; /* Finally disable CT communication */
> > > > -	spin_unlock_irq(&ct->fast_lock);
> > > > -	mutex_unlock(&ct->lock);
> > > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > > > +}
> > > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> > > > +{
> > > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
> > > >    	xa_destroy(&ct->fence_lookup);
> > > >    }
> > > > @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > > >    		goto out;
> > > >    	}
> > > > -	if (unlikely(!ct->enabled)) {
> > > > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > > +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
> > > >    		ret = -ENODEV;
> > > >    		goto out;
> > > >    	}
> > > > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> > > > +		ret = -ECANCELED;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > > > +
> > > >    	if (g2h_fence) {
> > > >    		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> > > >    		num_g2h = 1;
> > > > @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> > > >    		return false;
> > > >    #define ct_alive(ct)	\
> > > > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > > > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > > > +	 !ct->ctbs.g2h.info.broken)
> > > >    	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> > > >    		return false;
> > > >    #undef ct_alive
> > > > @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> > > >    	lockdep_assert_held(&ct->fast_lock);
> > > > -	if (!ct->enabled)
> > > > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > > +	    ct->state == XE_GUC_CT_STATE_DISABLED)
> > > >    		return -ENODEV;
> > > > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> > > > +		return -ECANCELED;
> > > > +
> > > >    	if (g2h->info.broken)
> > > >    		return -EPIPE;
> > > > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > > > +
> > > >    	/* Calculate DW available to read */
> > > >    	tail = desc_read(xe, g2h, tail);
> > > >    	avail = tail - g2h->info.head;
> > > > @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > > >    		return NULL;
> > > >    	}
> > > > -	if (ct->enabled) {
> > > > +	if (xe_guc_ct_enabled(ct)) {
> > > >    		snapshot->ct_enabled = true;
> > > >    		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> > > >    		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > index f15f8a4857e0..214a6a357519 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > @@ -13,6 +13,7 @@ struct drm_printer;
> > > >    int xe_guc_ct_init(struct xe_guc_ct *ct);
> > > >    int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > > >    void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
> > > >    void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > > >    struct xe_guc_ct_snapshot *
> > > > @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > >    void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> > > >    void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> > > > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > > > +{
> > > > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > > > +}
> > > > +
> > > >    static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > > >    {
> > > >    	wake_up_all(&ct->wq);
> > > > -	if (ct->enabled)
> > > > +	if (xe_guc_ct_enabled(ct))
> > > >    		queue_work(system_unbound_wq, &ct->g2h_worker);
> > > >    	xe_guc_ct_fast_path(ct);
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > index d814d4ee3fc6..e36c7029dffe 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> > > >    	struct guc_ctb_snapshot h2g;
> > > >    };
> > > > +/**
> > > > + * enum xe_guc_ct_state - CT state
> > > > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
> > > > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > > > + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> > > > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> > > > + */
> > > > +enum xe_guc_ct_state {
> > > > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > > > +	XE_GUC_CT_STATE_DISABLED,
> > > > +	XE_GUC_CT_STATE_DROP_MESSAGES,
> > > > +	XE_GUC_CT_STATE_ENABLED,
> > > > +};
> > > > +
> > > >    /**
> > > >     * struct xe_guc_ct - GuC command transport (CT) layer
> > > >     *
> > > > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> > > >    	u32 g2h_outstanding;
> > > >    	/** @g2h_worker: worker to process G2H messages */
> > > >    	struct work_struct g2h_worker;
> > > > -	/** @enabled: CT enabled */
> > > > -	bool enabled;
> > > > +	/** @state: CT state */
> > > > +	enum xe_guc_ct_state state;;
> > > >    	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> > > >    	u32 fence_seqno;
> > > >    	/** @fence_lookup: G2H fence lookup */
> 
