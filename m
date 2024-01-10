Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F29C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 14:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E197110E047;
	Wed, 10 Jan 2024 14:34:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D92B10E047
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704897288; x=1736433288;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2EHNzkXpKM1ZXfLKZbtrgo6CKsLbPiyibCG/X7E0F+4=;
 b=LKDOFc3hOtgU+kGnzFCAowXHu8Hyi8UGQzQjmcwWPk7z9F7vxvkOOz8Q
 d5yc0CDmzI8DdGMmRNUyC0yPyVuADzxIjD9ScswfWQ4J6nPHIyaLSAbt+
 3BUlNNMIztKBJ/894Udw/TBB2SqUTpWhV57776WvH1TqGo85Rhpf/1fTP
 KFxajOvnrTnBJC0hpE+Km5bCnsWMATYtYuDeUUxMxCvK1KYaD6Kh4ShmN
 gdhOmPhkDmubta10q/bluaBCyDs/c/5ct3Xz9HAreizNzbEJbzsiyNFR3
 ZjR7MHwB/vYsO7yfA+pfS1Qiyn7BbItr/Po6J56xXOGujkzqx5K+uEQol w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="462823625"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="462823625"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 06:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="1029175994"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1029175994"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 06:34:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 06:34:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 06:34:48 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 06:34:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkapB9ZYbGrrwEK9t+y5yyipXT2HSfaXwlaULXoK7yyyci6cwQ4/DVTWevCKKLnZ6peYNwImgBhq4k1q1hyGBULFkAIFXXfLpWvdd7hTLnnjbeobvMeliTfsatA4Ys18eZaXUxMSiH04ORm+0sUdJA+aBjHu7WspyzV07cqgsj8YgzPWXov+L8N3TeWWJGHwdFQExvgWPK/V51qC7AoMUJ3CkuVbnVUB87dDc06sU5a7V8pptIl9VhA6w99dM4wioJYCLdR99rbp3Y+r7EBGmK0qrVLka2CukZGrUBkYkPmy/G9FW6/06LS1RPT2jvSpJ48q5jgW+dUYFbxb8S01TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfGLvNusOnkHr6NQ4TDDAWwV4XgPfpZLiHQelsUxH0I=;
 b=mE3da3GTI0AXJSfjKBY+2oIeQAj/SyWT3E+474m1iX1otp589os3+ApnL6U6r1PWhTH5gJO+0PmU7uzL2xpD9olJb5IEdYivQONoFSfrdW9nQRyPFcx3+Lp3gk2Kauz2r8tg8X3zKvw6A801ELQ0yfPXWTK5xilmlr7CJD5ULvxUvkdMlsf4WK73ydBZ4TrunEbnUbUeucWaXOMEfFSg2jKrXdf6SbbX4jr84quAjwySbf7z/ARWMm8Xjp6U1/fGB2Ti1x+jMLhM51nFH9qpwOOpRcF49+aUPo8EY80pWrduI4oIEECh1yIamkGDO5MVxwioVGStyxjWzK7B6OzeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 14:34:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 14:34:38 +0000
Date: Wed, 10 Jan 2024 14:33:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC 00/20] First attempt to kill mem_access
Message-ID: <ZZ6qtXjL09gPG1m6@DUT025-TGLU.fm.intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <ZZ4pXlyXImJ52o6M@DUT025-TGLU.fm.intel.com>
 <ZZ6kSCeaX4xutZYe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZZ6kSCeaX4xutZYe@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff11e64-b71f-4de4-4c93-08dc11e9463d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVbOguGf+JQIGmun93DkwzmNpwa/CIUWECGAKmMWEAOZaP9ewhjNL3gGkiG/2tOl6eMZsrNnJCDyx0uqfsGsE7W3xZh1Uo2QrP/ReaUNkalAT2jNLRvN2K0i/SNcOXXdXwH37TUBW8LnJGX184kiGXDwrkBp8tScaw7K8qMAK6TESBH2yipys91C0hnacCjiqzZKOmRkW+zD+fq/ojktxl9hO4aoICRSXNGXOFY37EH2PybYXlkp9nmJovkQ8um0yBnkocvjv10rMEF3z6AcW/7hUyiKjKwn1xQP64wumMHH0TUBRb+MN9YaQW9RCHfuRu84gakatJP7CUvM/WiEXVipfLhP5r88MV6IkPhENTT+ns+kZtGvFVnBjC3hCEri9C/JM6AQPt4DUD3OovuS5bvSCQjm74z5OOq0tXPSsGNJCgd6fgbnISlMaJYbLWYDrIVbcSistN5t3Lzn0DvUhpx6JakDqxqYfGWPKvEvD2dxFHcQYSE2ZBIUPXhbQJnKH1YCYLceItBI8+wm291SRQyOgXCsJtv3b4k6ba/JR7mJL14mzQwX2mX5lBK8ChDU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(8936002)(8676002)(6666004)(83380400001)(6506007)(44832011)(6862004)(4326008)(6486002)(66556008)(66946007)(6512007)(478600001)(66476007)(6636002)(26005)(38100700002)(5660300002)(2906002)(41300700001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HE4cLtNwCGL3qyeBwAIlr9hG+pGh0xydtxGKhtI/PpsTUjLA6L3ktdDaRZwb?=
 =?us-ascii?Q?uAM62QXXvIt1c3Kd/Kkvg3oZbe1bqKhsf0A+njwIPMrNdEM9SFjJG2LOjfuO?=
 =?us-ascii?Q?VRkLWbEtKJ/V4Shw/YsWbtveXo9ekL8dVRgaP9r4PzTrbRxeuYKN8qMiX3A6?=
 =?us-ascii?Q?g4t/uHkv1d1LoOTxq0sFWm+/5pHrxwTvUiU69hEYW7QOUX7JEqgA7UsPhhJS?=
 =?us-ascii?Q?agI9HON0CX7Ltw8V6rgF3dFu4jTbUvekwVYE6+24va2ii8WkJn9qnXmDYzfS?=
 =?us-ascii?Q?nPRd5z/Xtce3WrUAVu8Z4g5F/CjX+oQnobREHNOSS/4eWpshbMhfR/bS2xoU?=
 =?us-ascii?Q?IHujoNkZ3tyIA0d+sQApK+Ad0OKwCS2dWmCVVw5g9UZgu+ZHGRoSFgo37GvO?=
 =?us-ascii?Q?odlnWTgLHzpt7YVOidvkjMQX5yUG8ag0PZ6LaFik1/TMBk8kEtpWVnk3sWQx?=
 =?us-ascii?Q?gLoU76TVIRK1fY9phV8aeCEfVBJ/zCBVLcn/el2xp0OlYnz1DxwQuP96CQmo?=
 =?us-ascii?Q?CCNJNCjCz4v/1bK2LYivEj3Luv3pJc7mNHxDcGd8Cyl1eIN1Ts+bWFri9G7F?=
 =?us-ascii?Q?ACoXgu4m9BIaXLwhfCN09k9xMaVHNVuuSZnlxeSQAGmk/TnMLXUaFQj8fuP5?=
 =?us-ascii?Q?xM/dcXbI0DG/XDAS40tFrpL3aHuwjQzdt4fkvkNvVmfgyAGh8PMkapZQdf2Z?=
 =?us-ascii?Q?C6MZQdhdATeMbQhbXSQefftcFnDgRDDGWZ/77W9Sf9OhvFMaf50dwiiHUIRp?=
 =?us-ascii?Q?FD6amyEXUhf+1DlpeGq/N/z6hhumaRaYNlsxjXalkJOQCv/rJQhwIk+PKPKj?=
 =?us-ascii?Q?3MHWDFHAg8Z8zK6egmc9DONOpWn0TtLbVwlnGFCscPI57qpGwOhu/2jSMzvG?=
 =?us-ascii?Q?I05ZQkgvP7+m7GbJ6k7/uDH3msr4ZnBXEoNFcMBuyzrNm2oUfaPxs+w9+lpr?=
 =?us-ascii?Q?bh2Xf4gre4hGQz+Czl4Zo9wgkfWMOYLHtmbqhJ2RqrXRuKbO+SDPq9YgYB8G?=
 =?us-ascii?Q?fofaNMpsfLLC/+9h+st5BvjpzmT3AYVka6gxDI1thew8u5P9KjFMqfKz7vhN?=
 =?us-ascii?Q?K9w+DjbU8K4Xw7FQrumvGvzruxS5QTjafbdSGiodF6wikJGrOThZDi+neFer?=
 =?us-ascii?Q?YlP8rI2MtF60Jfkc0Mav3yMf7KBupugnPrXAxuFgswpjMAyu+Ok4EnC46o7p?=
 =?us-ascii?Q?k0SG1pD35KT85hd0jxU3TJt3jWH+RYsZc3MMPg2ZMEEYiT8LMsarQMP427S7?=
 =?us-ascii?Q?lFO1LwCqzHnuMflczMX2Bpc6viGRMu92fUU+1V/6WhTKfpi0QpDOM7kLimLs?=
 =?us-ascii?Q?QdQaIRtheOJskodcX5Q7dn0DHwuHsONR847YhzDahMic2+L0rU+N/V8S99Ca?=
 =?us-ascii?Q?LnSDKWk4jE8rFit12orEERT6KyaEUro+Kv6OwxEOMcz4In+b0nfI2Lgjy0/R?=
 =?us-ascii?Q?4UQCW/XMIH78ckODvQpLsuXbu1UCev8SfKOkAwc0GMLtOGOhjgliRRH5KHoU?=
 =?us-ascii?Q?F3Bnv1k0DEF6taWmUJ+NiMjVoPnlbUir7ZDQTBlwErq0+aIeUzXK4rAKUFaU?=
 =?us-ascii?Q?kRpLXolfZxzvPlh1t4mplO0dO3dgF4VbOXoNFfbj8/9xhgz/1Y2OAE58aHf7?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff11e64-b71f-4de4-4c93-08dc11e9463d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 14:34:38.4803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXAlOLAb4crBDqE2/fx88YPtU6xcSgqSseczFD2po28qNJ3U9lrwcXp+uLn2vrwErOVdPlqjwS8LFd43w5gI1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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

On Wed, Jan 10, 2024 at 09:06:00AM -0500, Rodrigo Vivi wrote:
> On Wed, Jan 10, 2024 at 05:21:34AM +0000, Matthew Brost wrote:
> > On Wed, Dec 27, 2023 at 09:12:12PM -0500, Rodrigo Vivi wrote:
> > > At first the mem_access seemed a good idea since it would ensure
> > > we could map every memory access and apply some workarounds and
> > > then use that to ensure that the device is awake.
> > > 
> > > However it has become a nightmare in locking conflicts with memory
> > > locking. The only sane way to go is to move the runtime_pm protection
> > > to the outer bounds and ensure that the device is resumed way
> > > before memory locking.
> > > 
> > > So, this RFC here is the first attempt to kill the mem access and
> > > have a clean rpm handling on the outer bounds.
> > > 
> > > Well, at this time we already know that we need to solve some TLB
> > > invalidation issues and the last patch in this series needs to
> > > be split in smaller pieces. But I'd like to at lest get
> > > the discussion started.
> > > 
> > > Happy New Year,
> > > Rodrigo.
> > > 
> > 
> > Hi Rodrigo - I haven't fully reviewed everything but noticed a few
> > issues to discuss.
> 
> +Auld, who was also raising very similar concerns.
> 
> > 
> > 1. LR mode VMs
> > 	- I don't think the PM refs taken for LR jobs works. LR job's hw
> > 	  fence is signal immediately after scheduling the job to the
> > 	  hardware. Once the hw fence is signalled, the job can be
> > 	  typically be freed.
> > 	- How about we just take a PM reference when a LR VM is opened?
> 
> I like this idea!
> 
> > 
> > 2. Tearing down exec queues
> > 	- Tearing down exec queues requires a ping-ping with the GuC
> > 	  which likely needs PM ref
> 
> would the idea of getting with the CT that expects G2H help here as well?
> (calling CT-expecting-G2H-ref now on)
> 

Yes.

> > 
> > 3. Schedule enable G2H
> > 	- First job on an exec queue will issue schedule enable H2G
> > 	  which results in a G2H. This G2H could be recieved after the
> > 	  job is freed
> 
> for this, the CT-expecting-G2H-ref would be enough right?
> 

Yes.

> > 
> > 4. TLB Invalidations
> > 	- Send H2G, receive G2H when done
> 
> for this, the CT-expecting-G2H-ref would be enough right?
> 

Yes, more details below.

> > 	- Four cases
> > 		a) From a (un)bind job
> > 			- Job can free before invalidation issued /
> > 			  complete
> 
> hmm... I believe I have faced this at some point.
> would the CT-expecting-G2H help here?
> or any other idea to cover this case?
>

Yes, and also maybe an extra ref taken somewhere safe that ensures the
device doesn't try to go to sleep between the bind job completing and
the TLV invalidation being issued. This also ensures the send in the CT
layer doesn't wake the device.

> > 		b) GGTT invalidations
> > 			- BO creation, should be covered by IOCTL PM ref
> 
> this should be okay then.
>

Yep.
 
> > 		c) Userptr invalidation / BO move on LR VM
> > 			- should be covered by #1 if LR VM take PM ref
> > 		d) Page fault handler
> > 			- should be covered by #1 if LR VM take PM ref
> > 
> 
> these (c and d) would be okay with the LR-VM ref, right?
> 

Yep.

> > 5. SRIOV Relay?
> > 	- Haven't looked into this all might have issues here too?
> 
> would this be covered as well with the CT-expecting-G2H-ref?
> or any big hammer needed of blocking rpm anytime that we have a VF
> maybe?
>

Discussed on chat, need to wrap my head around this usage but 1 of these
is likely true.
 
> > 
> > 2, 3, 4a all are H2G waiting on G2H. Perhaps it is simplest to build the
> > PM references into the CT layer? A lower layer but off the top my head
> > not seeing a better option really.
> > 
> > e.g. A CT send that expects a G2H takes a PM ref with the caveat we
> > expect the device to already have a PM ref. The receive can drop the PM
> > ref and it can transition to zero.
> 
> one extra reason to keep the lockdep checks, but that should be okay
> I believe. I will try it here.
> 
> > 
> > Thoughts?
> 
> Basically it looks that we need:
> 1. Get back the lockdep
> 2. Add a big hammer around LR-VM (outer bound refs at VM creation and destruction if LR)
> 3. Add an inner rpm get around CT messages who expect G2H back messages and put on G2H responses.

This sounds right.

> For this, do you have any good idea for the right places and conditions for the proper balance?

I can maybe send a snippet of code to the list for this and let you take
it from there. It should be enough to get us aligned.

> and to ensure that we don't keep holding the ref forever in case of never getting the response...
> 

Yep, this is where it gets tricky - resets / lost G2H. G2H only should
be lost on devices not behaving correctly which should eventually result
in a GT reset. We will have clean up the PM refs during resets. I'll
include this in a snippet too.

Note that this change makes it very important the KMD doesn't leak G2H
via software bugs - I remember the initial GuC submission code on the
i915 had quite a few bugs related to this. I think Xe is coded bug
free but this will be very important to ensure that it is.

> Anything else that I might be missing?
> 

I don't think.

Matt

> Thank you all for all the great comments and suggestions!
> 
> > 
> > Matt
> > 
> > > Rodrigo Vivi (20):
> > >   drm/xe: Document Xe PM component
> > >   drm/xe: Fix display runtime_pm handling
> > >   drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
> > >   drm/xe: Convert xe_pm_runtime_{get,put} to void and protect from
> > >     recursion
> > >   drm/xe: Prepare display for D3Cold
> > >   drm/xe: Convert mem_access assertion towards the runtime_pm state
> > >   drm/xe: Runtime PM wake on every IOCTL
> > >   drm/xe: Runtime PM wake on every exec
> > >   drm/xe: Runtime PM wake on every sysfs call
> > >   drm/xe: Sort some xe_pm_runtime related functions
> > >   drm/xe: Ensure device is awake before removing it
> > >   drm/xe: Remove mem_access from guc_pc calls
> > >   drm/xe: Runtime PM wake on every debugfs call
> > >   drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
> > >   drm/xe: Allow GuC CT fast path and worker regardless of runtime_pm
> > >   drm/xe: Remove mem_access calls from migration
> > >   drm/xe: Removing extra mem_access protection from runtime pm
> > >   drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
> > >   drm/xe: Remove unused runtime pm helper
> > >   drm/xe: Mega Kill of mem_access
> > > 
> > >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   8 +-
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
> > >  drivers/gpu/drm/xe/tests/xe_bo.c              |   8 -
> > >  drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 -
> > >  drivers/gpu/drm/xe/tests/xe_mocs.c            |   4 -
> > >  drivers/gpu/drm/xe/xe_bo.c                    |   5 -
> > >  drivers/gpu/drm/xe/xe_debugfs.c               |  10 +-
> > >  drivers/gpu/drm/xe/xe_device.c                | 129 ++++-------
> > >  drivers/gpu/drm/xe/xe_device.h                |   9 -
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c          |   4 +
> > >  drivers/gpu/drm/xe/xe_device_types.h          |   9 -
> > >  drivers/gpu/drm/xe/xe_dma_buf.c               |   5 +-
> > >  drivers/gpu/drm/xe/xe_exec_queue.c            |  18 --
> > >  drivers/gpu/drm/xe/xe_ggtt.c                  |   6 -
> > >  drivers/gpu/drm/xe/xe_gsc.c                   |   3 -
> > >  drivers/gpu/drm/xe/xe_gt.c                    |  17 --
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  53 ++++-
> > >  drivers/gpu/drm/xe/xe_gt_freq.c               |  38 +++-
> > >  drivers/gpu/drm/xe/xe_gt_idle.c               |  23 +-
> > >  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |   3 +
> > >  drivers/gpu/drm/xe/xe_guc_ct.c                |  40 ----
> > >  drivers/gpu/drm/xe/xe_guc_debugfs.c           |   9 +-
> > >  drivers/gpu/drm/xe/xe_guc_pc.c                |  62 +----
> > >  drivers/gpu/drm/xe/xe_huc_debugfs.c           |   5 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  58 ++++-
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   7 +
> > >  drivers/gpu/drm/xe/xe_hwmon.c                 |  25 ++-
> > >  drivers/gpu/drm/xe/xe_pat.c                   |  10 -
> > >  drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
> > >  drivers/gpu/drm/xe/xe_pm.c                    | 211 ++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_pm.h                    |   9 +-
> > >  drivers/gpu/drm/xe/xe_query.c                 |   4 -
> > >  drivers/gpu/drm/xe/xe_sched_job.c             |  10 +-
> > >  drivers/gpu/drm/xe/xe_tile.c                  |  10 +-
> > >  drivers/gpu/drm/xe/xe_tile_sysfs.c            |   1 +
> > >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +-
> > >  drivers/gpu/drm/xe/xe_vm.c                    |   7 -
> > >  37 files changed, 445 insertions(+), 391 deletions(-)
> > > 
> > > -- 
> > > 2.43.0
> > > 
