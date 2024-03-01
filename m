Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E1DC5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 04:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D11510EA91;
	Fri,  1 Mar 2024 04:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dndi5T4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0FE10EA91
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 04:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709267043; x=1740803043;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NWXMuMLSuxJUgUWbr4cnWUbT0YJ4vLSfmMKaLiYgSpc=;
 b=dndi5T4JPKSw2etNZ29xNWGTMqbDxLhJuIg3xw3haJ2sH4MV8X8I1+uN
 lmITrJ6xL4ecXeobxpPDUI6vn9yKtQ7GlkIvaOTcOPJvMtd+Kw0371sL2
 TqvzhnV0wKI7Ax1ZqS+YXAjLcWNeo3x3ijnQ+k13o+XGQzo5fx7tLiwbY
 zfVOLkOOoA6bnCXXVg2oh3PZ0Wazmz+l39JVsthrHhUdup6dWasrpAFff
 BGPP4f7ZWj4DESr8gl1o3eRR90KpZhsK+gyJfkaoGmvOZoAV2eBMDGRDl
 CFjWuUztEOyUBU3Tfvx2JQ7lpZ13k3BDL3yvk3jjn1DEs44i4IsabV2BE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15200835"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="15200835"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 20:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8487482"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 20:24:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 20:24:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 20:24:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 20:24:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 20:24:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egExgTifa4b50SFFAl4HudaOjZJ96iOx/BZiT9jK8R39jJxiOSrkA5LzAOj5tdkpbSWuQPDY8TAC6JfKqS/wpBuIv9s2tNEH/U5p21AddugF1DkHVi1Btn+ns3yJMu6O8/p063NOab10hEbSeCnRggzT4tJslVKUQZDZmWFkAdH1m4qscEFs/7E32/UhzVCwE+kOH1w/6Tgnft2mSpqLZBBBct0KbavprlnjelSPaowPzGQalV62C+KoGBxodOh2PeZl188ACCjuz4Ew/6KHwxYlTVWmtARBMTxRfyJA3YYterY2PcrwRDtNH5b0Hpu+TWd2jRyC2WpXpJSyIo8MOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xphZyXZBLSmLpvWda/eXNR6Fm5Zk8tPVCFxr3JJb8IQ=;
 b=Htun+ZGBWAsWILXuHsrlUNoX0BRar5BNnatPV9chVIL4wL4HARCTlwDfbYD/+9J48AQ5QI6LnIwNjcLKYWOMsQh7B3LxY/+xFl9nvrFpG9Q9fFHePV+dXYrZiQfIUaKX5qGyD4HKBG6gIJMZpNpBLJZp7SgulN1VkiZW+26GB3JnMeUwceq2FWQMrltbjuRwdX0xT8RQkYFdc2AwiDabrO6EhtEw8ap9rhxv/1uV2L8dn2TOjFL/YRqu675yPRvgHnvXmEJwU664ZU39cO6spjTIA55rlWXiSJDGg8JJa3EhwqwJQEpUkqaKXZL9gQGywM75ZA5iuMyn6FGan1SzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 04:23:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 04:23:58 +0000
Date: Thu, 29 Feb 2024 22:23:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
Message-ID: <dwiyoltiivl7fmbhwa7bm2yvknlcjnpsmha7vl23n3ljzz6buk@44p4h7ezapp2>
References: <20240225001448.81513-1-matthew.brost@intel.com>
 <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
 <Zdyw6OT/SDir+3Op@DUT025-TGLU.fm.intel.com>
 <2552f1145d30d79669cfae860abbeb361ce723c4.camel@linux.intel.com>
 <zsa63c56nccbw4hwbq4refcbpnfrxamxgqo4wjukykvu6o4cvs@cykqrhdxiuld>
 <Zd/VSucJCHVFbryn@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd/VSucJCHVFbryn@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbb70a2-a27e-4ee6-9158-08dc39a76a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lWBUq339jHUgseuomcIRHdPAhBYN29a7PHbL67Hj+YDaIm3TbfiLQ3vfd3XRSGKTBkrN7Z52RtLHbzkh4PkBfNaOScKxUs9i5mXoiB3i3u+duP7k68YPUjO1Jm9yvps8p5qNpHXka0smI2fuHF6YmLVcThie2St0fKFgGl5B4/dFPAV1bwpBb0gukaCc3WaekGq8Bv8O0aECUZCa+ZiHyg34LEE+z9B/ZKHJcrzpORAfjm1WGo8w/Vw30H52xtlIFTUS9xQLA60PPzOoXAYr5XgCSPKXkZeD2iw+ghNBh0T86Dd2JkQRIKO4FUhVtMsyzjnteDkoov6e1uO2VgDCsLaj2zevrUyhO0mNtJevHNWKKIwjMQBSz4n8bwUoTpWf7GR2gAgL42byTBSqcqoWewZf8jAU2spYABORNN5E+Wmk7TrHUhvP4VxeOvW5RNL3nt/X1LDRxgiBVuBa0QMr1IXKxNuiytRJKEEmKHoZFXceY6o/r8lLdOo5dGDaTTtcZi1fbJc95JJVW7Yxi4Nl1ykGEHx3BWM4IWEE5L9IVp8C5vmK97E4Ufc37yRVw7u6fQQfQQ6a8/Ol1FVqwiBtaCEMeZLXsIOd6K9lD/h8xnWpKJv862O/8ZEi54IQ2+iLmu/aB0NIWUjBpiu9Eg9EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+owwVV2v/uFrSVR2ELMYvduFThufnp4j4VfXESOwmOdZcKYXaG6wBYqn3a?=
 =?iso-8859-1?Q?QtzB8YJoZrH/rmE2if1X3DI1lv66NcAI534Y0r20oSEBNkWheIhMg2lKni?=
 =?iso-8859-1?Q?3o50VcS/zcZFBGymEdzjHibU2IXy4W6cmuMiJ/nJbGH9SEhJJ6pdPXeTJI?=
 =?iso-8859-1?Q?XtHkO0em1QyfYwI22ZM1qu9w6AOxB6N0on3FChK2RS5eTM5XbZHn5Grgjv?=
 =?iso-8859-1?Q?Z6OM49J8y4RvOZh4on7aVTjKY1YJ6duDGPTol+Ao+pc/qWVGpDu6znan2v?=
 =?iso-8859-1?Q?tfsNrEHsdndbCfUmrrZec7dG884FrED+apfYuBTfuYgXCFKnntXHIwWhaz?=
 =?iso-8859-1?Q?LfAD9mCuJDCsC/VFjhQc12RQhOgeDFc/DnzBqpnWCjUC3bGgNsAe+dCcN2?=
 =?iso-8859-1?Q?62u2ZFHXP8jjP3OQVfNQ05rdAZKqrJwl8+47ky7rmX79Qdr7+Bv5t9UlAi?=
 =?iso-8859-1?Q?7zC1T7v4NCzJL8evdEzsDUKpVwZi8P45mLyLE+M4r1jxtLI0k8H+7xsIcp?=
 =?iso-8859-1?Q?gU1VXSwbixyRAZt3DZY3A16VpkMRpzNPhyfojg28Jh6Ec2pp2jlWHBYVM+?=
 =?iso-8859-1?Q?TItJwflGOiOS6nI6IdA/seB7Obv6A1Bf0VcM6TkngLvYm2u170o1UUvI+s?=
 =?iso-8859-1?Q?wb0dvKb+/a9KkUwBlge0a64/xsNPDruT1tlsxi9fHH1lg0jE6qTMQZnbv/?=
 =?iso-8859-1?Q?Aga+kNMQx4EAwMPvH1W/JmwfSLegGKG0oWxqIeCI2XJH+sdEVWA2vHbeOj?=
 =?iso-8859-1?Q?K5SEg+3JsKqv3qq0WxyExBrX65e+OjB/xyPHpPgiIvKsXho+XfNdbmj0+A?=
 =?iso-8859-1?Q?dV1vgqns0wztnzuffqR+RNSB1HQ6rmhApGbLKNoSRN1pdAIDJt9plIgueM?=
 =?iso-8859-1?Q?jN/kIAyt72EyDJSocEuct1B50thtC6EC+xTPu3K3chC9gE9jaTftLGo4uJ?=
 =?iso-8859-1?Q?mAlwPe/U3NQhh3rA9His8AKfv5O+ENSP7IvcPMTYak0nMYLzTbmoljc92g?=
 =?iso-8859-1?Q?q4zhGpD4FmUsitmVZ/UFtZ6aWPN+kseQer4URtNa+tDZY648J1N6MYM/uB?=
 =?iso-8859-1?Q?/EA9kO5dOG17vIm4fdCP8wx0YbtqlGwS4yqoYoM743XZYwaim74PwTaTq8?=
 =?iso-8859-1?Q?Sevc9DYsUBTrotBBQ7K8WdrFHlHKA9tnVTAu3vd1Ba7DpEX7cElnVUVyiu?=
 =?iso-8859-1?Q?FhyKPrzQhrp9Ryt5jCulqaigYEZmcG1cOmgREKS7ibvvC5E6OFjgK2yZlG?=
 =?iso-8859-1?Q?AmRNvZN5jg7Q5LvKCt4tdxWCEiJ6zmswHLPNhmVersyXsLdfOW99BiYeJW?=
 =?iso-8859-1?Q?/u+6iZ0r2MMUwHyDIIGPEIC9B7pgPE0Pl8aUrWf2Eq82+iCo205bNOTH/5?=
 =?iso-8859-1?Q?OEoNunl+Gjv1NiY9Relu4oJfy6cRZPXqsEVfrW+gq330+idgi57uOCjUp7?=
 =?iso-8859-1?Q?Ld8mfh8rDw5ZVEWWL1Meb2UyhSs8yxWG1YlR4wHK30VjBmJMc41sojO/h5?=
 =?iso-8859-1?Q?VDOGsZFUIaNMGlMa/PdW2IYjup7nNaIFcqJ8CMuVIbjOJnO1A55XxJnBuw?=
 =?iso-8859-1?Q?2ZPA3JhDlBJCwrcnKipIpFWkSm/ifzQ5B74HpsN60F3n26LR9UTqysE15s?=
 =?iso-8859-1?Q?p+RFPqT6Gl4F6SRbsMO0payKiZy3ME+6T0CKQpaQyxxja04+4rvdgz8g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbb70a2-a27e-4ee6-9158-08dc39a76a4b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 04:23:58.6705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/Lhew73kRZXt1hMuujaEH0+EYEt6j/qLKSjYLc9GpHG0WqgRWuqgzGJAiBVPv8YCuhOXtuSuLZn1XD+nt2V+Hnp+IKOqJoeMbYHF0DRqxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
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

On Thu, Feb 29, 2024 at 12:52:26AM +0000, Matthew Brost wrote:
>On Wed, Feb 28, 2024 at 12:49:05PM -0600, Lucas De Marchi wrote:
>> On Wed, Feb 28, 2024 at 03:47:13PM +0100, Thomas Hellström wrote:
>> > On Mon, 2024-02-26 at 15:40 +0000, Matthew Brost wrote:
>> > > On Mon, Feb 26, 2024 at 10:05:58AM +0100, Thomas Hellström wrote:
>> > > > On Sat, 2024-02-24 at 16:14 -0800, Matthew Brost wrote:
>> > > > > Need to include io-64-nonatomic-lo-hi.h for writeq function.
>> > > >
>> > > > As I understand it, the choice of header here determines the dword
>> > > > write order on 32-bit systems that don't have an atomic writeq(),
>> > > >
>> > > > So is writing the low dword first the correct order in this case?
>> > > > Perhaps add a motivation in the commit message?
>> > > >
>> > >
>> > > "Cleanup some layering in GGTT" removed xe_mmio.h from xe_gt.c and
>> > > that
>> > > file includes linux/io-64-nonatomic-lo-hi.h. Perhaps it is better
>> > > just
>> > > to include xe_mmio.h again in xe_gt.c?
>> >
>> > I think it then makes sense to use your original patch, so that it's
>> > easier to follow for each subsystem what ordering is used.
>>
>> what original patch, I only find this one in the mailing list.
>> and it seems correct to me, following the "include what you use"
>> approach.
>>
>
>I'm also confused by Thomas comment.
>
>Let me ask directly - do you prefer xe_mmio.h or
>linux/io-64-nonatomic-lo-hi.h to be included in xe_ggtt.c?

sync'ed with Thomas and he's onboard with what's in this patch.

Applied, thanks!

[1/1] drm/xe: Fix build error in xe_ggtt.c
       commit: d0a5fb2e0a5abeaad983c5c5c52b88ccef3aaae2

Lucas De Marchi
