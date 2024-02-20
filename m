Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE450C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 14:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656F10E479;
	Tue, 20 Feb 2024 14:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cj74Tw4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DE410E477
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708439614; x=1739975614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wQIgz6zmyq0o++8gfso9H9nrUbUZN6F4gZUToX45NiU=;
 b=cj74Tw4yAe6STnVStHBtwlNEDa1WXvCE1Aljcny1x2iSkOeodhV8WXL4
 97pJHy9ZxVaxfx6SDNtuc6HYAVzSGCm2krD7ENkWyu7Jkv6CN46ThkNk+
 ibHblYdNZ7zGkA6O69nib0DlVUjDZMC+Zh6q+zFrCvuKpC20dtAD8XesT
 sy5jg2o6jleTrvCkcZHGi8UxorWpqBo04WT0L7m9lVu/cW5YoeKVG0+Mk
 lhTD0uUQtC3Fv4A363UCuQyHbmB9lQjvYY35idcBz2/W1zLbffvKoEEH/
 ipsXDzRCXBzeXe2/+b17mSzU6DRxTX/p2//FNTRrASrEwkMJfdkLvfccr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="20076757"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="20076757"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="9434522"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 06:33:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 06:33:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 06:33:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 06:33:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 06:33:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITk6VXfJ2IaZEHVgw3yvznyLerYG3/pTrSYX27XSs8p6joqowBDF6bYS9iKQwEtLhXMnVIWIrqQ7CK42ai44Fob9rMvEomdI/c/Sgsu13mOc1oLmlGF042P5IHq1bR5L0YaC8i+8QamlQwegmkyJHUIhf/RxNH+3ods21kFtoQRwXrpm8gW7WnfcWaLf6RgPzrHiGf4lQXKJjeoNpfmHqr21RT9wfyJcCyCJTxHDzu/0u/XEGWfOPUhRqInZmTiaIoW6jQ5OsC5NJOy0eYsrw2W6A0ELwQOlZ2PXtKGCCu/b/1fIIueRgTNjM3reF7DWbia71KL+Rqc6ztWDc4Ktyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0A9r78cI6NMlIuB5+APaisnuxMeELb7IJca3keXcpw=;
 b=Z+zNGZ9P4+8USKRyrnmvP/7Iq2vOPz/7+YMt+hcce+NDNcJoYoKJ7LWZcShmTYOk0HPTIxfVe2uFWTNGjGSq3Qj911Zhl7qcw0BCx1MfrfPlSpYCZw496K1kzFaz7AVwtXBaXulCG18tEgxJ+3pRKRvGLkmiBi5f55JHn5Of8EaFkYRks+8L+DBPeTWPhuXz9l0qh+YAXbI/5hvAtNExSQE02jVx9X/8KJas5W8uYnF0M2i35Bfv21JgIqb6atG4Xpvlt3ooD4OAf7tmdT7hESZiSgWIZ3jJ/oT52HrpDaVnWacTd4Rg+Iv+m3dGmYkhTL1KeRciqjzCdSn6iFF5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:33:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 14:33:29 +0000
Date: Tue, 20 Feb 2024 08:33:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Dafna Hirschfeld <dhirschfeld@habana.ai>,
 <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: Re: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
Message-ID: <ngvfmndraoxpdiv4ty5ux7ocjfalsfvejnkxiqbbd4joylhend@q7nai4sxgkmf>
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
 <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
 <170843092294.13484.17436593152022385360@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <170843092294.13484.17436593152022385360@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf02a71-c1d1-46ed-b62c-08dc3220e843
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKhRo/s2AtMMtOANchXmvhvr/GjY1zhhuI2+7VD0mk6ovd1KbJjjmRfUjTfwqxlcMA0uPxJAhg1p/hn91WmTW7bRxM8nGtLjYEl8jWQqtO8D7xuq4mFaIrPoA1jOw7mHKADBHB1fzOW1XrJlyJvxPDZDqUtDujwIN1t2bvBPQbv3bGu+BCWh4g6mkOdfVCR24tC9WEAx29wYZjNF7RfoqSkepCOVAJp/9AUS9cv6EzbNrjudUFx0iV34LGWGy3lMYuUR0/y8udW1AJBeYYaVN/D6Rs09NRW9qukvPW2E/YipV3KWhpi51F4RxSeYayECn1nDI/eNW0LqHwHzl/qBrtQkUlDZ9vrzKY2MC68QlOvWUjGTTwqHCqc528EOhopgyIIIuNDYtTWAemuj+tKzjxGWObn8QSW80Ge96z0J2LDKg0NCbCrOoJiMuOP8CSk4XloIUzNq8Jqz9bWFIJD1yH0tlMbTHWnUtIl1n4knMYJtwfreX8vf0pemFGb/0XUhHKI1hRuSH2VDhPynFFcjEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CtEcaITYRXN2J4KEd416pKDy6uCY9u48B/u//BOoo49cHdjhhWPFLEr2aHPg?=
 =?us-ascii?Q?9okYSAhT6vjnXd/guQ48k+XBHDRJO+STc5Zx9KbhV44IEbKeJ8bLaOOnCsSE?=
 =?us-ascii?Q?C86TWdoDGQq2BftmXW2M6jKG3yh0eGWGjdovcpaYgtj8zP5dN8IgZBW8MQDQ?=
 =?us-ascii?Q?j/yB179kWCgKDagrsDAqGs43NEOZokeAQ+UeNqu8NzBwOh3Vk3Ge+Dnhgs+q?=
 =?us-ascii?Q?4/uQx7gEfAdhL0LMPNAATKIsDRyK9byZ9E6FQnxcGwhbdyoyzFjUPZxAhfAx?=
 =?us-ascii?Q?15eoPCz3OqQ49SiIMjyn4jkxjIKCp8NPflXK3zk/ReMwt7oeyy3JMH86vADC?=
 =?us-ascii?Q?2h8dtkPRmv1REPl13LBi5f+R1EzEfsgAo7Mjfw3Kzr82FFBGSuHGpCA1C3Al?=
 =?us-ascii?Q?bYanjBW9Md+AXrYtsJsNkopojutBOycx7dQ4JLubfpj/twaHL645luwuQNkM?=
 =?us-ascii?Q?990902pDm8y7BjDf/N7wESAE9fyFjLk1vVB1nDS8BkBPfYeIQbqHbAzPl7vN?=
 =?us-ascii?Q?5tldRboAR0Fi+ZXI6EJE+KTWXe7VpcQxE4SWwZV7IheZJENMACQnl3ui2gWw?=
 =?us-ascii?Q?bypNgkeLX+9O+Yfip0KBSlTidPekmlkjhh6tDbVnWOpFv7fXPIl4gjR8F1lL?=
 =?us-ascii?Q?ysWT8zJTeXM3+qKc55falYoiSAywd2WBrsmWDxW04+VWJOAKLPeHLJLgLC7n?=
 =?us-ascii?Q?BL0KLpRQ4iyjREd5CiTtBh4InzjzyGVXMKkXIOHj+ScfHwcB4nmgnDHW8Nn9?=
 =?us-ascii?Q?3Z707F0xyVNudoeECSfON6fz/maTMFO+l4DPT+By3/tvXpBZAN7JAtpB+l6P?=
 =?us-ascii?Q?Us6XQR4xzuxIxWj1UXaYmFdaGGEqL+II+4BL5Qn5nKjqB4nhZ4nqAFQd6d4A?=
 =?us-ascii?Q?yMLh5lCCu+cQSFoqsJ5JAxL5aEoVGBUbVYBgXmriN5rd5HlwPB4mRL6iJ9NY?=
 =?us-ascii?Q?Z9lUIFJM7brCfvxiBNUli+7z3InTegR/5MC0ajbIXQIDdPPBDkw8s9OQDsdX?=
 =?us-ascii?Q?8aAyBnIacaaVDu1UnE1elX+tnAIwJQV9UwFgy3XWrt+iF7y/rkPXXanJ8wTh?=
 =?us-ascii?Q?NjJmRAXdFSkjKxk3+IcR+wg4fbGm1PsTbWZIABz7Kr+4RC+QYEW8LyD0HiW6?=
 =?us-ascii?Q?hqPcjWaZ14ZQqHGIQj8S8PNls8y41oKgun57HupoXkHfuUWh2HBx3PmfiPCQ?=
 =?us-ascii?Q?Gr/I/U6PuYeLl0R7qfQ6Nzerb/P1pA3i7knNZ7EaGOO0EnZGc8kDuknWQJgz?=
 =?us-ascii?Q?GRtGkM/WWQ6AAzPo9ENdrd1x/TDnOwDIy9Dud92JyaFlu65stNxAvp6/lrY9?=
 =?us-ascii?Q?e802yD/UNMFtEd1os0b2c66yUsZXNj8+2AE+UufS4xcthYEreqplCaU2kLiS?=
 =?us-ascii?Q?OCxaRlIBOhH22zK6qQCvTr/jf6xXf/9oYHkOHkravFevs0W0oQ+Ec80rc0XJ?=
 =?us-ascii?Q?9fsXZK2etIyrCWjn3fjVc3t7ovmqIHlVy5GFfgOWfkCpjkwRVEYxgixnO2E0?=
 =?us-ascii?Q?kJkInCcBwEI2c95N5K7uqHb5KJI7VIanNUaSdsSemgjmDdY3hiI6LIDECyO/?=
 =?us-ascii?Q?TqFfgLmDrdAERF3+tjD+606hJeG2gSidZhhyDPe27+91uvKd9Uhbhfew/ghq?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf02a71-c1d1-46ed-b62c-08dc3220e843
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:33:29.8889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArYCPuNp+eaA0pV8WttzHLey0saJ3mZ78hF1avQAVVGBshkwyju7X9nfD9u01ukB0sDlEufbAFYCcl30Nef5RCmOMUsI7S8eT8ejNT8HDMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

On Tue, Feb 20, 2024 at 09:08:42AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-02-20 02:44:57-03:00)
>>On Mon, Feb 19, 2024 at 03:58:45PM +0200, Dafna Hirschfeld wrote:
>>>The feature 'grouped target' ('&:') in makefiles is only added in 'make'
>>>version 4.3. This cause problems in older version of 'make'.
>>>(Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
>>>in the source path instead of the build path).
>>>Avoid this feature.
>>
>>but it was used for a reason since a single invocation is supposed to
>>generate both the .c and .h from a single invocation. AFAIR when
>>implementing this, not using grouped target would be a mix and match on
>>having a succesfull build. Does removing it really work with incremental
>>and parallel build?
>
>FWIW, the root Makefile does what it calls a "multi-target pattern rule"
>trick to get the same behavior.

cool... TIL https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html

	Multiple target patterns in pattern rules are always treated as grouped
	targets (see Multiple Targets in a Rule) regardless of whether they use
	the : or &: separator.

So 

-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
+%/generated/xe_wa_oob.c %/generated/xe_wa_oob.h: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules

has the same effect and the rule is called only once.
Dafna, can you update the patch to use this trick?

thanks
Lucas De Marchi

>
>--
>Gustavo
>
>>
>>Lucas De Marchi
