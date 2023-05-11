Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC91EC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 18:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2368911F;
	Thu, 11 May 2023 18:03:41 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4F88911F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683828219; x=1715364219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q4m9fpN7b1UP5eqSjuRI9/4Ektc9mOd8DK92xU0Ajz8=;
 b=bbQJfeeOReQhwOOCmlXoxhAZ+qs4U9/cLB5n5iPzUVBHm60QWXl3L6cB
 j92O3yHwKzppsqRUQ7Pmf5NnfT3TTjUEnCuTAE8InStJp3WuvFv4yL4+t
 qWXLDAVsRGUbLyUZk96lUuW8ELme8MmtWRuXv3xdGktSPmXC4is+4qpDd
 9vYXEO3KpRVJKoqzC7+LRxF0rBuIsSEzSLGy9KWulN43V0jnRcnX/BHMq
 AJLnsBmSePrAmzffoX9lsL9ht0XYs9bfxQ+mR7XmvPPq3JywIzsBL7LPV
 PUV797ULFoPFo+1tZ4EWEnENkP6S29CQfRGrLSwk5oyIufW7kKY71TehT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330942076"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="330942076"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 11:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="699843434"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="699843434"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 11 May 2023 11:02:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 11:02:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 11:02:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 11:02:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 11:02:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sbl4WaZqiBpG1zk0HeQidKKBHt4UgocRDRgKGu7RvZAdwL5bm2IDPNjPBu/y1JoiS4NK1xdg6Z89aip3RyfcJUiq+hhqIQ2etKyFJnWcLYvsQjbd8AqPcyPGiZxhy4SfLGk8R0FPCLlRZYqwPdtF3spI5yQtyl+9Wha36AuvNq0+iILvFOpzv1p4eKV1GZvW0hJabSq7XQse/23pr4ILBxk+BtALV5lr8HN4+Qbdl0oCHoj8mTio9RpjtH5DS/Z7G0T3YB26pt6VoXG45sDuTqiZ5qZC6OgP366VCDMmBaS32ZXb34xSmL53MLDETTqcGXrsdMpcmk0m3l+c3pQa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1X2ATi8RWgGfYrU02WrfkVfbjDITATCRZXmqR1AdzQ=;
 b=ULUYHYf2cIOZlWBdK/LeKnpOMo+hyVpZ4jU3SLBLBI2MrO+t/dr+9gj5VK5xPiYSaKZOzih2mLFZDg6YqGioSQN54aFSriNxso5bIHLX0dj8xZ1vSu+ikQxZtxDHFXBkAaFYS22vcYNkXX7hPGO+1WNGC87s2MllDdAXooY6YNBKlyuqQqXjYQfWnLlv8mYVPX1aEACySOJ/CB+XGfbc1uRwkLDThE3B/oI5H/sKbjzJg9/NPhfETEPwIheVD7B9uwPSaABxe3LPFTsssrma2e/ujhGWlLbZh2bvAtJGimz2E5izKIAwc8uDf69thKD3hzWQufpAeTZaS1JbaKsaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 18:02:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 18:02:22 +0000
Date: Thu, 11 May 2023 11:02:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
 <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
 <9d04fce692222624580527c6d07ea88460a32ca7.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <9d04fce692222624580527c6d07ea88460a32ca7.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ced0bb3-89e8-49f5-9aab-08db5249deaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: naG98TZ3VkARWB9NV3MZ8jcQTODFgYOOvqlC2Al9uADnw+YpJdSDdqAN7VPDLuO7d5fZezFsNaR04DzhMGQV2lkZkzV92pQcFlQp2nRzHm1k0iigNlwigIg7V6/nSK3OHkcYJWZIZQtURzc064HznYDh9QUlvEI0XuPZCnfKmh1UwUMZG9qZc+vJdqkwf27irNuHi+hyjD8Cu5Kths3PjIKFGO8oPz1BwZ4rfydOBt0bwdL+wO0pmYfy6aXuGnBFGEwRPCZbDJMNo3CrGg534dcZiG3l1mGCeFDuigEXUxx4b/gBbL6p66vdhmaD1CSbM8BHWUAnWh1gwkhgJLHu0bInhT0oqaWxnPA+u5rlU8gusA6r7DpFBNB4h80QjCL0QF91i8MrT0IyzqOFr5ZpQBhobFPJ2eJCFIqYWBGMF8eDDfINTzrJEjKhDCjTTLhkPajjQJ/1PXE9s0i0cwBp+VdzhpD7r5L1VaOaiBu/HTyIVlEnCXfndPpy/KFuFt/jIPPGWDS/HRyKLAcbfcV48MJmkt12LglhfN2WgLtRW+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199021)(186003)(82960400001)(2906002)(83380400001)(33716001)(38100700002)(86362001)(6486002)(966005)(8936002)(8676002)(6862004)(316002)(41300700001)(5660300002)(478600001)(54906003)(66476007)(4326008)(66946007)(66556008)(6636002)(66899021)(26005)(6512007)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8EIK/F93CukCnixQduHZSJR40LMfCe5nFmSoFP4Axy3vMEmywwKKjIl65h0U?=
 =?us-ascii?Q?GcUTm3c8KqgYfVEgNuNkaWbb9ngxCXQu2/WyCgmHQL16VrC2vtF3wKABsswu?=
 =?us-ascii?Q?Nl9W+6Fp777TXeGnMB1bRwNE6CP+Ueotl9+hmDX9/cauoneddUrpsVr/SRcO?=
 =?us-ascii?Q?x9i247xpagvfqGrtLFILEK8PQ5Pewi78szc8G3mea3tP/OO9HHC9x/be4MDt?=
 =?us-ascii?Q?EUmQtozlpe/5WOkTGcH+CBqdptaA7BH7KFyPy3QYI2ZN/uSXUi0JO34nWwNT?=
 =?us-ascii?Q?7/Ees+3TjVcgQo/SS8jWum0CEzJjaY2Tu7Wl2DZbyaTCCQLLx2Ao6JPjKTRI?=
 =?us-ascii?Q?5oebOucZlGEFGaOy1wWNRx3TmviMM/ggTmubGi9OWl2IiLSsf0DwXFSWwp3U?=
 =?us-ascii?Q?yT8ehO8hqp4fO5zq6iWqJo0r7I9Bb4z/jrUW91/S6WM752kc29gZk+Hfe1Va?=
 =?us-ascii?Q?Src/5N1Uh1ciYNFv/LGw+mXQ9tzK7rKzC/sTlh4mbv8QAIByhEwl9CQjUJeB?=
 =?us-ascii?Q?DUOtWgquowhB8+zNl9WqiJVJHa+vAiMf3jCsjX57dHoEJ5UM0Be3vW1vWL0/?=
 =?us-ascii?Q?GPsQJmCiiFG3RVMI07qMdn19zpBRaekBUu3khdeT6Dv/thZIOyRJwBX4YIT1?=
 =?us-ascii?Q?z/TnRlr7iEVwbKy0FAOhl+EG7ty2naqKMsaWtYO5B3EPQA87w/wsrzh5SLu3?=
 =?us-ascii?Q?2tt3fRhcoS4GVpmJJBZ4rygBfx/Cp3qkCrrwWaF+9ykIwNhV0F0nSNbxOKs0?=
 =?us-ascii?Q?ZWbKKVXenldvrIs1uXFvnTrU+QriI4iFcSwPjDo1GaRS71H1urMfF9kJ6kj/?=
 =?us-ascii?Q?iYIvMMw9xvQ+ZNev2Ved0bPbIVqyQ9yY695L9mnr/I0GVYXkVW9RQBonXrjS?=
 =?us-ascii?Q?QQE9gqa0sYDBkdYaLHrLcOsmVBPkLi5uYTaAnqzTUXYA9TSrCIvU6AxwkEwB?=
 =?us-ascii?Q?ZdhviUudJHRxMLIig09mS1l+Xn82aQ6z+GHERe2x/NrXf8LlS+LI8bzwk9gp?=
 =?us-ascii?Q?h5270sG/1LnVLYV+imLWtu05kEFHkv9Jak3DkyIwuTEzZxuzpYRQ6gFBQ/hl?=
 =?us-ascii?Q?d+cp4EldlS+uMlJbcsu8zYQMquhULZAG4LAw8AdZ3BJcGpBeQKoRQzcK5/xE?=
 =?us-ascii?Q?CeaY79HA6+ZBp44msu/Ijd1lNiPLtqewm+G9SxGKykaen4QwbJ5a2hnBuH9Q?=
 =?us-ascii?Q?REyY4tuq4GOjz9Va1zhB8o2ezOYtPoCqXGQLoqjUg0cPar8Ula6tWMet+XDJ?=
 =?us-ascii?Q?kKBfLSO0o3ueEL0saziiQE9jYUx9oRxmEYKYI93/Ad7s1bpb3AKziAz6uQsr?=
 =?us-ascii?Q?Mccpg82EImn0j58FPTBmI0/NpbNiDWy6PIckv9B4cXzigQ4uOOywdabxDERW?=
 =?us-ascii?Q?eg0VwvCLB/ogKR32cEoaMlbpkHNhHO1Xbjy7yJoNUXgAGk6GGUOKmIpcGgkx?=
 =?us-ascii?Q?xJUxr87OsS9Hjc0E9VRZB4Sy1liMdq+ruHaJB8JnQPGeOBZAnwTlrsFsHchN?=
 =?us-ascii?Q?3lf2tPSOe6sHQD0a3rETVhhJ8OkT0xedx0Os0mG/6z9hMYfyVUtSvS7bMvU7?=
 =?us-ascii?Q?34gx3wGl7/1YqQRpZhoZUbRhynkGnx856rvqWePqYFa7Ei86IgSPhBp+q8BQ?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ced0bb3-89e8-49f5-9aab-08db5249deaa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 18:02:22.6757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLF0mX+aFSz78AY+04cWri86kn/wHHaC91OP7M+4IrxFeAtxELk2KZJWnF67JnqGasYNSlFFm3ZxJvnCq7ExfgKM708ZN9JHZZn/ZyjM9Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 05:22:34PM +0000, Jose Souza wrote:
>On Thu, 2023-05-11 at 10:12 -0700, Lucas De Marchi wrote:
>> On Thu, May 11, 2023 at 12:47:26PM +0000, Jose Souza wrote:
>> > On Wed, 2023-05-10 at 12:54 -0700, Lucas De Marchi wrote:
>> > > Stop the dance of enabling the display-related driver_features to later
>> > > disable them on display info init if the platform doesn't have display
>> > > IP. Besides being needless work, it wasn't covering the ATS-M case that
>> > > is the same platform as DG2, but without display.
>> >
>> > Xe should set pipe_mask = 0 and call i915 functions that will handle no display cases.
>>
>> in xe, enable_display is the runtime config to be the equivalent of
>> DRM_XE_DISPLAY=n. It is *not* to meant disabling the display.
>>
>> history why this ever came to be was:
>>
>> 1) display integration back in the day was less than ideal (still is),
>>     and developers couldn't test things ignoring display
>
>Xe CI is now testing display, in my opinion this option to disable display should be removed and display support always built.

maybe. Last time I checked there was a 50% divide on having or not
having it and afair I was against. I'd not touch that until display
integration settles and stop moving in the branch.

	95dd4dbb5f89 ("drm/xe: Make compilation of display optional")
	6a53b00afa0b ("drm/xe: Add big warning for !CONFIG_DRM_XE_DISPLAY path.")

Unfortunately I can't easily map to the MR where that was discussed.

+Maarten

Also, "Xe CI is now testing display" is not a good justification wrt ats-m.
Besides not not covering all ats-m (see
https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?), it's actually
running display tests on the AST driver.  See
https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?

>
>> 2) have a way to tell the driver "don't ever touch display IP" for
>>     bring-up situations.
>
>pipe_mask = 0/HAS_DISPLAY() should take care of it.
>developers could force pipe_mask = 0 for giving platform bring-up.

The hole is deeper than you think. See:
drivers/gpu/drm/xe/display/ext/intel_device_info.c

In i915, pipe_mask set the device info based on the PCI ID:

	static const struct intel_device_info ats_m_info = {
		....
	        NO_DISPLAY,
	};

	INTEL_ATS_M_IDS(&ats_m_info),

This is how i915 differentiates DG2 from ATS-M. Now look at xe with the
device info split in 2 places, xe_pci.c and xe_display.c.
We can't use the PCI ID mapping to know ATS-M is not DG2. We can't use
the subplatform neither, as they are already part of other subplatforms:

	static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
	static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };

Changing that for the sake of display basically means having to treat
them differently throughout the driver, which is worse than simply
having a `has_display` flag added. When we eventually migrate to disable
display, the has_display flag in the xe's  device info can still stay
and how we tell xe_display.c that the platform has or not display (as
opposed to setting info.enable_display)


As I said above, I'm not really against the long term plan of removing
the kernel config. In that long term plan we'd not have a
enable_display= module param neither as we'd have already a replacement
for the global module configuration, allowing it to be done per device.
But I don't think it should block the fix for ats-m done here.

Lucas De Marchi

>
>>
>> For (1) we may turn that into "disable display" now, but not for (2).
>>
>> I'll take a look on how much work it would be to migrate to a
>> disable-display scenario rather than the simple "Fix ats-m" being done
>> here.
>>
>> Lucas De Marchi
>
