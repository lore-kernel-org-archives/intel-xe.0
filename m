Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F4C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 20:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A1310E21E;
	Thu, 20 Apr 2023 20:55:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E2F10E21E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682024133; x=1713560133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5/ZQiOi8l3ZGmQd9AaFarpSp3wN8sMXoJiOYa8uyyX8=;
 b=Kpio14Q/Zopaz1jotMNvaUk3nsFsIzdpBlKR1a29skL7/7FWAA1ebT/i
 7XAYoohis5Q6iAvP6RFN+0cK4dK6SRUhjTnLtfbXQUuo+Kfk1ty+0NiZu
 yTleq172zKps61xc6ue0LzLjeYf5iBhdwEp/tHdV0tzGsMpJJcjj5YVQL
 E3Rh0SJYU/bxwYUZrSrOnUUxk/zoSTBGtmKuiQGQD+NIaibCpBHpDRYZn
 UHmxvLv9tE3nEfJL5FQG4I3ddJz9JAOrvFSePxPGj/J4Lb0BkSQv8M0/m
 keUh5X/Bpyz0j2wJtE69uvyolNMpUCFXAg9EMLh4qL4lYpKffN6Z8KMF6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348639307"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="348639307"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 13:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021699580"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="1021699580"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 13:55:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:55:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 13:55:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 13:55:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ion92y9LlgGklqgwQI7pKshFxHsxUYiodGMSrUGf01pGMk1eIwOHZV1Zo9f4LqpxXqKCP2DedTlJDPAVdw+alESYnK/eUUt/Rn22tro1598jLsF99jjHn+4oLDKMmqj8VqyIXKQiPMQn1aO91+e7UlsPBRotyXyPn+GFHsAQPZvdM/IHciJelzs+HLDtMTJybd7oj3PrWHogRx4ptmbbRhu60M5245wuRVPOMKyK20jlZExhjM0wuh3wVh28HiEU5VYMGJPQwwCfUbh85u8s4oCL1S3T3FmYVEYD9Ctxyc4ppWyacMnq+SD+qrwJJobNpWnGWzKSM2hQUts0jlPaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw8yRPJJ5FLBl/Cpl0di/Jgj67Wa2S8VKKchZ0BbIHE=;
 b=PjQL4EWjrzBFdgmT9ruSFs/BoUPn6toRxAetwnNXof0ZbIKqPWBqhZawUqzoY9mZ9t/10UV5KHCAlfYfZCaGEtSe5D7VOEwKTRMRovi/i601FIxeslXTeKGx4UYazPSCcoLLXUUIUpQKtalAGtYyQI3awjvE4RIdQHiLJcgvy/wx0mQsSRnP3pNsi2F0z6SNgHm4xvaUkfqSxzF0WPjGmOZsTwX95g9fBJJlFN3UvosSKoskZiLjAfs5tCNoaBUxh/cIyYRUfSDU8o4gmdk8tjMjDaJ1UFsTKv2KM79mqhItwAbEeyvzkYXyRCvwr3xYSFC164Wae+OGztXhdhFJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 20 Apr
 2023 20:55:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 20:55:28 +0000
Date: Thu, 20 Apr 2023 13:55:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Message-ID: <e7cmcmmxj7a74zsopyztqntrpqwlozrptsnrlsogzvxh7s5tuz@s7oxebcof36t>
X-Patchwork-Hint: comment
References: <20230419175501.155319-1-stuart.summers@intel.com>
 <87mt32x5iw.fsf@intel.com>
 <pofqujdm6esn74xfl2eiphxquupoolbqnttbnjs2hmqvtkwspo@4yqkzpqat43m>
 <bd0c3c5f95510690b45c55a0ed2f87a1b3e2bf94.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <bd0c3c5f95510690b45c55a0ed2f87a1b3e2bf94.camel@intel.com>
X-ClientProxiedBy: BYAPR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bc86c4-1592-4fd1-c463-08db41e1929d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5k5kRTvURGYV5pg+5iMmRaYDiOnsIlvM34V4EivG9wQG5bdNtDWln3eN3O8e9SekBm2Exiyo07HQGzzGrxjZqYY2+c4UPdwFS0MiTOtmO3Kwb2D3PBBashhA5blKy7Z8XQbH+ZhN4A7YBvOnsnTqF86DHKWfuVPSLQYad44k3dmq/DrsTo0LsjyRrdN+dXDQs7Cvzlh9egxbU4sky3SBZ2cwg80N6MyufdN/VboM+mRuGOlLyY0++1t/w2ywMlAA0frPv/hHgybjO6BgDTO9XySQUfgCxVeS0UX3U1OYpLdxZZTLI8PYm02Blz1G4qTRNpeg64AwAmUgk/IYF/n+a7HlUVL7T5ieCTgAIi6HUu0Y83sw05aBuaJ/BMFwKVi7mBevCFXwl5Hj9Y8g3Z3gtMrZWhXC2/JWZA21kGMCxFO6cZp/GKG5eDMIla9Z8I9i7Zi+YGTU/nymkIYbEy2R7oK6ISYnYAOLOZt8Oh134OC0SuM1ogv4TlWCiOescmqctWHtJcC28u5l8U7CXk1Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(54906003)(478600001)(26005)(966005)(6512007)(9686003)(316002)(6506007)(66556008)(6636002)(66476007)(186003)(6486002)(5660300002)(2906002)(8936002)(4326008)(6862004)(8676002)(41300700001)(33716001)(82960400001)(83380400001)(86362001)(38100700002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8PFlhDygvw+6bPj66OoLACW0w0QckYu3raPU9wCsUiiOIrSESMP4w8Unwt72?=
 =?us-ascii?Q?B1PEaEq5JnN9dihAGa+b3tLAyITvYUFAll82V1bPwtjFb1KTdOwHzcrTfzPp?=
 =?us-ascii?Q?sHxouBtv+TmX7677JJiISZMHaz4mhjKBYdfsnM28deGo5fc17EFY1GrUzUPt?=
 =?us-ascii?Q?py+YNplVHUqSwgEdu8aHKtHvg6qRtRSOfon12IlUa/9w4cWi/9Nghl/7si97?=
 =?us-ascii?Q?enhATOWk8qZQDg1XEyk6sLasFEsS/c14zVLT3js2qMRbOQn6w5jwUHGYgOVf?=
 =?us-ascii?Q?IDAxzjgqG8KgHPrg/UEGUxqL4MCVLYugSSz6CHgaEO5UQf5dq8lDUGnWEgus?=
 =?us-ascii?Q?icloqxzXdMeMprBwW/Tyn0SJrAYtDHaEjFStPENAMf9ntwqlzpmYAh0UIzcz?=
 =?us-ascii?Q?5mEwE5mH4IA55275wB0MxTt65nHLe7jtfb6jDfe4FH7Qc1FZ6DmvP95h59fV?=
 =?us-ascii?Q?aWdx3aZ5woaegGH9JgldR6wDNqQI6Rwx+bPgkh14+0skBaISYs9Dj+lHp5aH?=
 =?us-ascii?Q?CcgOLWDz3Hgh/E++5Ftz3tlSbeAkzaBc1dw2zgjgSZcGRI2uv9MJMN8EnKRu?=
 =?us-ascii?Q?pZt2VBGk/pK8wW7QRNLHLYRYWx8muG+5n2adqM0/0adCvUFRU+o2ZYrOTRlz?=
 =?us-ascii?Q?zkqHP+OopTXG4Ay/6Qw8QI3nQ0Y6N2NVTFpJwqxJoYLX2vO/aZTmuBe7pjgw?=
 =?us-ascii?Q?ZP1I4TB9gJFC/aEHl8M+bNz/hBl04vQDhuzSYGTySpniD8/+dvBu4UHiolCs?=
 =?us-ascii?Q?NrvRH3Ky9/IsAvRj2r/ojyFvN1+GZABvsUJ0Kr2uFxF6gku+XdAOQy9WHe5D?=
 =?us-ascii?Q?JjufiwFm7GurohtxNEE2cS1yuARkEWiX7368rnBopslHJ+HhodcI0H+YUmsn?=
 =?us-ascii?Q?TRiyHExAN3UkvgLcswKt1YpbtFZXgG+PpfTPE1SG16BaC5LvzgWPJznVqTR6?=
 =?us-ascii?Q?NO9O5PtzYafnQEFrq1tsP5W48GVGMsn+4hphqRC3PjKzwNbFgCB04ftsBYhK?=
 =?us-ascii?Q?DH58zuK4vliOF5Mqy7irZ/Tjhe9gC9bKHsnvPhGHbPqmuv0g2BqgEaDtQNIC?=
 =?us-ascii?Q?su0TEagWoqKOk6m7lKL6v/KBkrvq+D1AGerIkf/BcpnN5NUttNDDDFv8qs43?=
 =?us-ascii?Q?+kNSZ3Dkomm1vBtPu1+dYdT8Kh1Xc/qH/etpJCAJQMD0i5xHayrkVlOu86vD?=
 =?us-ascii?Q?7wm3fRmXsZKZ6SpwEoInD33q+nPzEk8FjRp14a+8mqCB4VB/YT+29vE/+XMb?=
 =?us-ascii?Q?0R8neFJ1EYNz5sQj2Pe5gigssDlOHrSwz7agc6cS/PJN8HYI7w5O4iKw8UCJ?=
 =?us-ascii?Q?f59CnVg+iNRr34Vy02pxWQ8zXuAYy+W5+XRNhhqYCRY4NTDUT5sjZDg9VF2l?=
 =?us-ascii?Q?HvdUmSFpkH8DrXZY9sKyqwEEGFOxO1EUkpR2+mIn/6D3JsNvqoSS6QbLKiRG?=
 =?us-ascii?Q?OYV9FHf+5gR5sC9rG5zfm663bdBg2MuYqBArlpUTwlyxCOMfToz3moFq48XB?=
 =?us-ascii?Q?Qi4DPtLQo3RBfpMA4gsdAmyLmzOuJVEhYPr5zzacEaoEFloyCgrSG/zG4YzD?=
 =?us-ascii?Q?8+fetQbSo4lrFqT5SIInffm6l1H1pgDK+WkQoGvYXRLhOxZ/AndbwdKpirrF?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bc86c4-1592-4fd1-c463-08db41e1929d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:55:28.8159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AV+/vafz6tpv1Ym7FivRV4xMpK+5zeb9yIU//qXPCffZvKLcWF0VlIkJS24vjVBhJ6Ue2AdsciKgUg9FFvR7GDac5GwcL5RNTqsJWa20WM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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

On Thu, Apr 20, 2023 at 08:44:12PM +0000, Stuart Summers wrote:
>On Thu, 2023-04-20 at 11:53 -0700, Lucas De Marchi wrote:
>> On Thu, Apr 20, 2023 at 12:32:55PM +0300, Jani Nikula wrote:
>> > On Wed, 19 Apr 2023, Stuart Summers <stuart.summers@intel.com>
>> > wrote:
>> > > This is attempting to take the best parts of i915 module
>> > > parameters
>> > > (minus the actual module parameters) and add to xe to allow for
>> > > better
>> > > debuggability and configuration in order to help isolate problems
>> > > on a per-device level instead of global module parameters.
>> > >
>> > > Note that I did review a few options here: configfs (not
>> > > generally
>> > > used by the drm stack), module parameters (we have some negative
>> > > history here), sysfs (not the right approach given the focus on
>> > > user interface here). Debugfs is used in various drm drivers to
>> > > configure various device characteristics. The infrastructure
>> > > being
>> > > presented here has at a high level been present in the i915
>> > > driver
>> > > for some years now, so provides a good starting point for quick
>> > > debug additions without exposing users to some of the challenges
>> > > faced with module parameters in the past.
>> >
>> > Looking into configfs has been on my todo list for a long time.
>> > It's
>> > something that often gets recommended as a replacement to module
>> > parameters, but the documentation as well as the existing examples
>> > in
>> > the kernel are, I think, less than stellar. Basically would require
>> > implementing it and seeing how it actually works.
>> >
>> > In any case, I don't think it should be dismissed with just "not
>> > generally used by the drm stack". A decent implementation could set
>> > the
>> > example going forward.
>> >
>> > The main problem with debugfs is the inability to set the default
>> > values
>> > prior to probing the device. This is where module parameters are
>> > handy,
>> > but they aren't device specific (and, as you note, generally
>> > discouraged).
>> >
>> > Looking at the patches, I'm not sure I understand what the
>> > procedure for
>> > setting the debugfs values before probing the device would be. Can
>> > you
>> > provide an example sequence on the command-line please?
>>
>> I think that for any solution != parameters is:  split the module
>> load
>> and the module bind phases.  I've been using that for a long time
>> since
>> it's a general solution for attaching tracepoints on early probe and
>> it applies to any kernel module (differently than e.g. adding a
>> "nomodeset"
>> parameter to achive similar thing). For a debugging thing, usually
>> for early
>> bring up that would be acceptable I think.
>
>Right I know we've done this many times with i915 without issue. This
>is the way we're configuring these things per device now. But it's
>still a good point about configfs.
>
>Anyway it isn't working with xe today, but that's why I sent this as an
>RFC first to get feedback.

yes, I know it doesn't work. My point is that any solution we've come up
with that is not per-module like parameters, means that when testing, the
user will have to split the module loading from module binding to the device
under test. See the issue I pointed where we discussed a little bit
about the options. The separation between load/bind is the same I
use for tracepoints that I blogged about some time ago
(https://politreco.com/2022/03/tracepoints-and-kernel-modules/)

For the approach with debugfs it would be no different:  first you have
to a) load the module, then b) set the options then c) bind it to the
device. But if you accept the split between load/bind, doing it via
debugfs is basically reinventing configfs.

Lucas De Marchi

>
>I was also thinking the same about debug... really all of these should
>be considered debugging features/functions since the driver should to
>able to autodetect the default settings for each device configuration
>based on various registers and per-platform definitions. Still, let me
>dig into configfs a bit more before making that final determination.
>
>Really appreciate the thoughts here though!
>
>-Stuart
>
>>
>> More context:
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/230
>>
>> Lucas De Marchi
