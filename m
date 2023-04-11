Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F4C76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 17:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81AC10E5F1;
	Tue, 11 Apr 2023 17:01:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D9210E5D5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681232468; x=1712768468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VN90BfaG70qOZW8Hg5g/HEBxsc68W6k+PlbIbHsw5Kw=;
 b=bpgtH3yrjZZjGsHRdMGXC0mDJ/8F1tef7K0EwzfWo40eQ0/SJXgda0Ue
 AdD5Iqf1YEUBYwuWwLpuyHEiq4bTOiBV63pdfPRyiCry6fKD/Pch0IODH
 bzlLhviOU9k73f0SLcsdmh03FnenVz9eDhd3YuQNVVU6C3+Ch4VsAKGwO
 cQOOG3KqEDzN8yvWsORmkzHqm3dFnEqUsC7oklxTi3iEYh5/KZFtLx/h/
 rRaKk9KqthIrDSAwVnmAjcHotK0jTvzIbNoq3i/Y2IiKnNcedXxuvSW8s
 PW0JUeT0gcDSrIlG1NjFrgVkuPDOWxk0vfFt4+Zzy0oFheOFZ2yXycqQ8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="371526163"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="371526163"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 10:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="832403763"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="832403763"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2023 10:01:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 10:01:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 10:01:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 10:01:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7HLVVCaPOAIAK1Wabm1zXJRuqkhCE87zR96HZUcy6fwAH39832L1L2j+L+5nTco/bcqvUlSAsVM/EUuqCE6EbhLnhRLzQ1hy1/ttpr1/7+9bx5WSbbEPDXOMdlgMyfrpthZyHkQIoHrmV2wqj4a84EPXbtLbl/p9n+ah2HSc03nm4FvVwe3WmqLiKc+PX43di6+cx/rhxGXv6mKZ3tRNNJ1HM6RYqJ7XJJJP7BO9B3XRmQ55NDOXGfifOiUjxH5wEW/SuFWSxIh7zqfddrmCeN/9tEYhGdeb6WU+LSkTZQKMRFiBaIev9SuE/mdFDaSp9cV9MmfRP0kpuXuCkgwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPZm6yqsyFUKS5W1s40WO+5ns/Sk08KbfvIH4fMbg2E=;
 b=WAS6knQ9bH1AQk527Yn8fHUaALcUNQVVCgz7C1/oPhcAUN1tbsjMBkAl3DmY5DZLGIhgWTqohr1VlKBlk6IqsmB85pcTiMg8SWvXhm2OlMiuLgPknFX3uk68BEx2Z+yB5IBusp+10P2sYr9B5TRo7Bc8ZYVGtjRC/nqw6ljrFvspEYpRb1HAEBqYTuRMWAkmDIrwibkxpYpl4AnAXRF3GiB4ZVI0A4FpQQTMjBG0ZPQQ7PIWwQDCTzyiM9yM/vCXaAztVLst2JjSoQ++jt6KLEFOidNnuzGlrnoHatqHFLNSsLHN8LaHpCsDlbCnEExaJXN6WN0PsCySG80+mvKYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 17:01:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 17:01:03 +0000
Date: Tue, 11 Apr 2023 10:01:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230411170101.57a6nhdse44ynxxa@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
 <20230411070133.byyciicbo4a7z3qt@ldmartin-desk2.lan>
 <87leiyetsa.fsf@intel.com>
 <20230411152259.GW4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230411152259.GW4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 29318baa-7ab4-421a-6b62-08db3aae553c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMfbF/ZQiomPECw4wNyEGFOky3RIERetNm4sQu15jXd4la7SR+HeCMCYUI9UyLQNlcFgIkcbywdABuqCfwfCvkzhyo9sWn+3kgf/brFwvZGIK14A+DQob6PydFarV/Ui3j5+ZOn69Q60vJsYfvR0Pb+Z9aW7oTh66E8RR2+HRvIrYMBcfDTCYlZ1bhldf6FBgEMzA4mkK4FYfVRZFH5yQdbMpszyqDeiRBjPfANbEg+Om000rn36KEeAWYem3MHbJZr2VaerTzGTdIASMoeG2UTMbLUPfh6o7AzA3EktHG5LZUrk8jKsY5Pz6UyiHlxqy+Bm0kFgDIEFvusnmBJXXXN/62FKf0mC5Ut9QnvNnd0YIitkvrdn4UUSef7QVmqTgGAsvS5zvTu4DKfop30PnPc0GU2GSf6pdD1q8Z8fCeFgZ60LH2j6++T78N2LpdbK22LuITzQpwZYxthTM5XOAwxoPBTQX+ea4YljvLU2+rKgoIaT7IY9oG86AEGE724QpXIfAGQG0A5HnkoCXnTk3C89euQLMPk0D72vMNPW8MReKDYVeztWcb+zuE2pHVB3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(4326008)(41300700001)(38100700002)(186003)(66476007)(6512007)(82960400001)(6506007)(1076003)(9686003)(83380400001)(66556008)(66946007)(26005)(86362001)(6486002)(316002)(36756003)(478600001)(6636002)(8676002)(6862004)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BWZmf9kSvkpXaz66xIoINdP/f5qF7rqsVtwIVA5GEtLvcJ8SCxp/Q5E/jssm?=
 =?us-ascii?Q?+KbdcgGUrDNVu8r/1+IP15sytDq7g47Rpyh5yL5uVMHstaJjA14FiRCXTFnJ?=
 =?us-ascii?Q?a0xYjUGVhtFgslvLRohJz6Y7QTTMjG5PHNZVIe6hqcVBf7y+r9EduRdbJICS?=
 =?us-ascii?Q?IYKgqd2+2QhOCnrMYlm7uqy9nyOjIKnyw7okKJufEFkBNeWCKyi5TXTOywT4?=
 =?us-ascii?Q?mzTcidqMrCGXIewA2bvhpS7Ds6/SkQJ2QyOwh/gWwkhLcBjUC1JxPHaVdb5a?=
 =?us-ascii?Q?3RfSCXuAWf6uw8N9bVwVIpG/6yDYmJTyajJZ2lNygyk1F4nRse3Gh+av353+?=
 =?us-ascii?Q?BvWIcnYKdq7WAwaU7OJD3K9T5IR4C4l5T4RQQLt3o/HAj/qXuBTA+eZ/T/Ql?=
 =?us-ascii?Q?KaphpAPn+aO9SzBeTqysu1R27h++/ybExWLqZtVtPyYLaEXTubmDOTLLPuNa?=
 =?us-ascii?Q?at345tjMrLc6czMjudnQrVkFq7HyT+d8pQV8sec56N+VuwiNWCS0PjKu6mtF?=
 =?us-ascii?Q?6VCS82Z9lFa1jjwEzrPZb+Q6giTjaT5OCv27+PHz1t5W1XpVRIy+sH4F1SPp?=
 =?us-ascii?Q?7Tyk5Av7AHiJuxL70xpHAnnQKUU/EpEB3h9U7hkFQz1TGyooKIq1Jvv9CQCJ?=
 =?us-ascii?Q?bb8WEOoyqQ5K1GsfVLnqq7a3oCz8UMSYtvR9P/56KwpOYlt0fzh8Ab8G4Wmf?=
 =?us-ascii?Q?gF3H66xAbDATbC6jFW8mFTHe4j09vOYeFBQpD0npDiDueaKmZnra9yTOcOY5?=
 =?us-ascii?Q?i4Lz0v7c9d540FXGEYCc0iyQNmxAPic3Ux+VjOyzlwlrYT/pfRampRM4puE4?=
 =?us-ascii?Q?qWDNwJe140xF0Qa/6DnUb24AXSR0p4QbZ0bjJchFukOAq5TP5Fb+tWm5WFEG?=
 =?us-ascii?Q?6KZAGvbYsR6spzNWDYw7Zw9VxBJDeHihwTEr1GtK5abv+JYq2Iu96GNU9Afc?=
 =?us-ascii?Q?WZHbXFVmcQZAcTV78AKctt1GrTYBxDguDFxSeuDDU3ySNjpKR1da0u6Kwq0S?=
 =?us-ascii?Q?LJZUL2TPdaxC51q0DCQZEJln842GVMAwDlpneq4WYWHaa5B+ATX9U5tML5vj?=
 =?us-ascii?Q?H/+itGi9as2yuWomaSJgth5GQuN6xxxuwpDlOX4msLo3JyjMLYbKYR1CT1MP?=
 =?us-ascii?Q?YWOkx4gxc7is1sSjR5JzlCI+3VySM47Uj6JNsZBoDdDBKEasshIJX33qja3U?=
 =?us-ascii?Q?YvbJBl3erxpMBvecFSNFUt4zANbsJ5XGOiaokhBjwwsfMaZw0NSdUPoSr/Co?=
 =?us-ascii?Q?yydUUNI2hSL8KIO+PzlvoAGcF3NQQp9L5vCuW+O2JDzNFNm6NqDQzp/KPsTD?=
 =?us-ascii?Q?Ipuhq2HR4hHOAshrnfjeAiIFZZru5v33PIu1XF8U4/u2jF8e0NC9Rz+75Wif?=
 =?us-ascii?Q?D0JsRwscPqJKy+FWaO0gXw81Iz7LZdri2qhlSm7gTW6QnF7d6iUDcsuuMns3?=
 =?us-ascii?Q?1g8GfT2o6nOqlN2LnBYNIURmcnkhtMRqkqMrAUwzFAa6o5YeZ7Ey9hGeF+ZX?=
 =?us-ascii?Q?UzH77BhKj7mzwW9ZVRPKuQtKX4Ly7Kwck4oHiqO4BhUol9C38I6oXyBQa+ja?=
 =?us-ascii?Q?/SWtb2Lux1cXlZcaPPxXCpGacGjtH7/mJ/izJUugq38MgefiigYlTEKw0AHV?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29318baa-7ab4-421a-6b62-08db3aae553c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 17:01:03.3883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRJ2EbOkhkinK2aO+z/diJsQSNznDLSFeXLH3Xytsdp4pbWDHdsG8OFqk53TzdcZkG2lt+Ir1HpCVDqVYZNBbbLCopQ+k+VScO3jgw5JnkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for
 xe->info feature flags
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

On Tue, Apr 11, 2023 at 08:22:59AM -0700, Matt Roper wrote:
>On Tue, Apr 11, 2023 at 10:56:37AM +0300, Jani Nikula wrote:
>> On Tue, 11 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> > On Mon, Apr 10, 2023 at 11:39:08AM -0700, Matt Roper wrote:
>> >>Replace 'bool' fields with single bits to allow the various device
>> >>feature flags to pack more tightly.
>> >
>> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >
>> > but a  digression:
>> >
>> > for structs like the descriptors in xe_pci.c, this justification is
>> > enough as we will be maintaining several of those as they extend to
>> > each platform. Also the access to struct members is contained in
>> > one place.
>> >
>> > However this reasoning can't be generalized to structs like xe_device,
>> > that has one allocated per device. The gain should be very minimal if
>> > any at all.
>> >
>> > 1) Each place accessing one of these fields will have more
>> > instructions generated to use the right bit although in most cases
>> > the compiler should swap a cmpb with testb since we are likely just
>> > checking if the feature is available or not.
>> >
>> > 2) It also limits the ability to pass them by address.
>> >
>> > 3) We also need to be careful when changing
>> > bool -> u8 as they don't have the same semantics in cases like
>> > `b = true; b++;`, which may not be obvious in some cases.
>> >
>> > for (1), the pro/con should be really small, (2) we should get a
>> > compiler error if we tried. But for (3)... we need to check all the
>> > fields we are converting to make sure this doesn't introduce bugs.  I'm
>> > on the fence on the need for this change, but I'm ok with it.  I double
>> > checked all the members in the struct and didn't find use cases that
>> > would introduce a bug, hence my r-b above.
>>
>> bloat-o-meter results with both might be interesting, for code and
>> data. Does the data saving matter if we bloat code more?
>
>bloat-o-meter indicates that the code size reduces:
>
>        Total: Before=330210, After=325432, chg -1.45%
>
>Does packing these let the compiler combine multiple feature flag tests
>into a single instruction (e.g., HAS_FOO(xe) && HAS_BAR(xe))?

yes, that is possible.

>
>size:
>
>   text    data     bss     dec     hex filename
> 467248   66607     880  534735   828cf drivers/gpu/drm/xe/xe.ko.orig
> 458855   63394     880  523129   7fb79 drivers/gpu/drm/xe/xe.ko

but this really surprising. 8K of text?? That doesn't match what I see here with
this patch applied, but my config has more debug enabled (and had
display enabled, that I disabled to be closer to yours):

	$ ./scripts/bloat-o-meter build64/drivers/gpu/drm/xe/xe.ko.old build64/drivers/gpu/drm/xe/xe.ko
	add/remove: 0/0 grow/shrink: 34/6 up/down: 320/-257 (63)
	Function                                     old     new   delta
	xe_info_init                                1991    2039     +48
	...
	xe_guc_init                                 1426    1232    -194
	Total: Before=477778, After=477841, chg +0.01%

	$ size build64/drivers/gpu/drm/xe/xe.ko.old build64/drivers/gpu/drm/xe/xe.ko 
	   text    data     bss     dec     hex filename
	 775924  174199    3584  953707   e8d6b build64/drivers/gpu/drm/xe/xe.ko.old
	 775896  174199    3584  953679   e8d4f build64/drivers/gpu/drm/xe/xe.ko

This is more inline with what I expected: very small changes everywhere.
Not sure why they disagree wrt overal increase/decrease though, maybe
alignment. Which would mean the change is basically lost in the noise.

Lucas De Marchi

>
>
>Matt
>
>>
>> BR,
>> Jani.
>>
>>
>>
>> >
>> >
>> > Lucas De Marchi
>> >
>> >>
>> >>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> >>---
>> >> drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
>> >> 1 file changed, 11 insertions(+), 10 deletions(-)
>> >>
>> >>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> >>index f5399b284e3b..9ce6e348dd29 100644
>> >>--- a/drivers/gpu/drm/xe/xe_device_types.h
>> >>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>> >>@@ -67,8 +67,6 @@ struct xe_device {
>> >> 		u32 media_verx100;
>> >> 		/** @mem_region_mask: mask of valid memory regions */
>> >> 		u32 mem_region_mask;
>> >>-		/** @is_dgfx: is discrete device */
>> >>-		bool is_dgfx;
>> >> 		/** @platform: XE platform enum */
>> >> 		enum xe_platform platform;
>> >> 		/** @subplatform: XE subplatform enum */
>> >>@@ -87,22 +85,25 @@ struct xe_device {
>> >> 		u8 tile_count;
>> >> 		/** @vm_max_level: Max VM level */
>> >> 		u8 vm_max_level;
>> >>+
>> >>+		/** @is_dgfx: is discrete device */
>> >>+		u8 is_dgfx:1;
>> >> 		/** @supports_usm: Supports unified shared memory */
>> >>-		bool supports_usm;
>> >>+		u8 supports_usm:1;
>> >> 		/** @has_asid: Has address space ID */
>> >>-		bool has_asid;
>> >>+		u8 has_asid:1;
>> >> 		/** @enable_guc: GuC submission enabled */
>> >>-		bool enable_guc;
>> >>+		u8 enable_guc:1;
>> >> 		/** @has_flat_ccs: Whether flat CCS metadata is used */
>> >>-		bool has_flat_ccs;
>> >>+		u8 has_flat_ccs:1;
>> >> 		/** @has_4tile: Whether tile-4 tiling is supported */
>> >>-		bool has_4tile;
>> >>+		u8 has_4tile:1;
>> >> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>> >>-		bool has_range_tlb_invalidation;
>> >>+		u8 has_range_tlb_invalidation:1;
>> >> 		/** @has_link_copy_engines: Whether the platform has link copy engines */
>> >>-		bool has_link_copy_engine;
>> >>+		u8 has_link_copy_engine:1;
>> >> 		/** @enable_display: display enabled */
>> >>-		bool enable_display;
>> >>+		u8 enable_display:1;
>> >>
>> >> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> >> 		struct xe_device_display_info {
>> >>--
>> >>2.39.2
>> >>
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
