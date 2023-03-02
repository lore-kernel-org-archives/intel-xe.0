Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99128C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 15:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C2110E107;
	Thu,  2 Mar 2023 15:22:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB7910E107
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677770569; x=1709306569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cYwomVDOSScjptMFpa/Cx9zTurG/d0CaEDgk8sUp2Z4=;
 b=k56sxUE3SPayc8kYPw9TS8qynPOiW3uKuqcTItY+IB3xwdc103VY7rsy
 Npbd9pcORUCnz9eUuUhQ18vpgZOYC0ghMSKEEURLPxA1zEQiDsX0CKYb2
 a2fKEdaVHNkdBkW3oE6RxQwo0knDGJd73Iy2GH/Zwo+aKVihaYvhSg14i
 7BcCareyjP3W/HaqzZZ5npXfzvnTUkwv1P0crybpjmopbDCqXq3FTuSd+
 FVwt1PLDrpp0l1ywvdM575AZnLt61U9v0pV61nCyNX5FJ6O+Nb27ycuDh
 Wt6pVUUMdYWWt/h/PKo5lp9/8fED8NYUUONvvnSw49O9n1KYnc1elw/yl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336268452"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="336268452"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 07:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="652432004"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="652432004"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Mar 2023 07:22:47 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 07:22:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 07:22:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 07:22:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzHUjd8iS7KthU1HRKIc7UY8DULTptQ2x8vT/A/Z8jgA7lpncqGwEnu1KLvoHToKVyAcYFY9r/G89E75avFNlYCKoN44cavNQttnj8jcj+2SuqB+X3ERKQgDrR7iXnhn1sCQmBOxoOQzBH3ZGxAWICzAXi8dUbOEIJ9pOlUEDaiYq17gS8yn/QvNWdaF8DzSt4Ss043XgLz7vQpEw8zGmIXPueicx6Ni2Aynma8A+PuVUA+pkeO02pRY43sK5djkdnnjxoB0lIRFRd9r8Zw5FbVWjoNqhhghZOi1cu27B+iS3ahBGHc2MOXhFmm2QqfGg11nu21xPRj5Hg9jHukPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVtN49qw/81ZPFkpYbmEy4iImydmXsen5CHi+qDY3KM=;
 b=CgL0dgH5aufU5iI8fwxf4dI7UUBuylIY3USu2xGu9A1NXNQTKudLIg4SeWeyyJ+CRGXiP7INAR8Xl0QAA5LO2Vhv6Qjr3JaoE9h3oVSqySlGKclp3/1yfof0GDddz9vfcN3kU/K/sptV5Y5IhvAEAit9iDlBoU5igKB6ktNnPc9Q4EHRKMvWoDtED3hgv9FIlZQu13PGZcPrmRhRxi4bjkhwtwo/nt5ijKBwFZJ7f/QenArL2vQYwkMUvpm7jaSdmwgW24b+h3Ku/iBnaVO6QAsuoA9CpEegofHIH4lhOoD29dgE18p7sUo3wjmuix6BS1tzxe1NImrazzlJolfo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 15:22:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 15:22:44 +0000
Date: Thu, 2 Mar 2023 07:22:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230302152240.zwxz636rrvm3ttac@ldmartin-desk2.lan>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
 <20230302013411.3262608-6-lucas.demarchi@intel.com>
 <87y1ofusbs.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1ofusbs.fsf@intel.com>
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b77650-8a8b-4fd4-5d4b-08db1b31f85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CaGJQtENmtZHYZ5+pdYBaNKTfo8PR+LCdT01ZLvB3YJ5yEqYGLIJ5hkIUuUp9CRRmihRIKxxMOZGdVEFtFuM8TgcslB7qi/JqIH7Co9uuoPWwLW2RHtpFApaiaCzS14aRXfALr2DfjSRE9uoB4U4DH1SHnJ5zWt+3ONlN6w8WA1BvF8n5ESxy2aBsn5FMbY5ux1sV3eL/+VZIsLsfiIthKQTBRttt9DV8qBnVwZ5Ntc2MpA9cMxCtxB32dsRvPTCspaKWFNLy/AopxSaPFpgFpT4NU8YE7CK56kVp9rhsGl34yF2oIZkXpVGxtoIbSTlILNBU3GwozTqtLreURBhAiYGv/4Bva2eIGgedJY6/KO4XHOYYwiDaasOIiKnD4ZV9/png11aOLCRfMQDHyMK5Bg4fm46+cI34mtGV+1EIz/bk1kPo/FgZES/JLgG0QkaGtLs3fim2enQdPH/rQhZKNOe3UhtvnBNIwtUVBqWwSWpKKEyBk6jaUP2sR0LvaXgcJJxiVO/DM2LdAuhgC7SNNpZimZTVytBXnDuzyrCxE4xEf+vzr8bj0e2Lb6TtJ8f8mnA1/WQ0+FUIih22KFQ0CEGUkOrQlCcZY3dko7jpe0/d4sBRxOah+pm6TJK7SyNbbRr8yTVhe65TJgN9mZlxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199018)(30864003)(5660300002)(4326008)(66476007)(36756003)(8936002)(41300700001)(83380400001)(2906002)(66946007)(66556008)(8676002)(316002)(82960400001)(6486002)(38100700002)(6916009)(9686003)(6512007)(6506007)(186003)(6666004)(26005)(1076003)(54906003)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qo16kV2BSZVzKPg0CSNWlun1V+If0AwVjKdR8PaHwb9PX97IIS2jY8WY1Meg?=
 =?us-ascii?Q?8er5E+vZdrZxo48PsypdbDKbaJzwBkABtLfRDbnmQG8rj5iozEUOn03NwTCQ?=
 =?us-ascii?Q?T9bX3Ka+rbiS4lo7QQYAKGmM2hxjz1GkyxywgF8psijZyXVYmgRu3oA6f2AX?=
 =?us-ascii?Q?v0KqYkNzdl1cQ5kl5or7sGOgpKE4bd/MLDSQY4beot7gV9A/Fj7qGH8jAOY5?=
 =?us-ascii?Q?4m6Vn4a7q6dLToOfwEVVZZXgU2CK+mYZNyMeV2Y0G7pTrSbDHNmFT/SVSD/Q?=
 =?us-ascii?Q?gnCzHRoUUo2BsAcSWPI1t6zrZCTg0p+CfRGSq/cuz3Lg82zva/aUrR+Gr0tQ?=
 =?us-ascii?Q?dWVjMziP+hl/n9/Xu5qAQsOq7QIkwbEHfbZ/H1LXIae9YC4yjrYzjbPajdqZ?=
 =?us-ascii?Q?+V3DtxR0rJbZkZVr7eFy2sOWMXnoKJL3ayCD/BWdYqccoQA1RA/XlIFv2KWP?=
 =?us-ascii?Q?ymbyjJhavjeexlXpq+LiBN++Ou9Top2n07DV9E3Dk0wT+HATIPUp/w/53yXJ?=
 =?us-ascii?Q?/17JLUgfdBboRDySbk5YEk/7H4gnPywNOk+cGcDZsnVBLx6uC2kmyqmEAKV8?=
 =?us-ascii?Q?FwPLF3mzgBCSwyDwjnCarpxzdX6B9Tj1/0Zzc9hkNLouzk/MUe2/DqvXzwN8?=
 =?us-ascii?Q?WJ+M5sYthLt2Ry9+lHgTmEbGhH9tPpW+U5BK23tSbxrKWceLUCcSSe0Fpndl?=
 =?us-ascii?Q?Nn3OPuQEp7z8AnENBFiT8P9tLlgASTv3axD372FkAchiTLOI0V/tKYutjbKH?=
 =?us-ascii?Q?ihQ2lJome/6p8zSWoTIHH2u78HOkME3rjQMkZsTIwa1j3gCuXvOoOTprMEGa?=
 =?us-ascii?Q?hwu/RwF1s0LOwn+ylVs/gUnFV2VWfpF0O7MXxAQxKBRDfgL/ldirsTJxAln4?=
 =?us-ascii?Q?sWeQs0fxeY8Ej82hn7V8yn3Ny4zIQOPwuRcY4vn0BH3wNJBhN4DgGLeTldP2?=
 =?us-ascii?Q?nyYy8PbBb/OphYUMsQ7XPIxp6r6Yec3crZc/ufTf0KaKvJE7CkzcsxTvvkHg?=
 =?us-ascii?Q?OGDQJl187yXrShLN9TarTvZ3WoefavcE8yjIM4+NbdBz6K7BhnZr0eFMDHfw?=
 =?us-ascii?Q?LmsdnFDfBrRiOz3f3cGq1Eq7vmC5LgAVsZZ8c1U9N7+GsriEfCxqtd1hJVrG?=
 =?us-ascii?Q?nXIt9uNW39bSAMpLiCNW/e8uQwaUDKu0cfZbBrN+s0sqnnvEEP2h/kGLyj/4?=
 =?us-ascii?Q?ijXZgnu8MOXfVuhGL9HTK8NCc0Zxe0H4MINp89l2LqeS7b7VYbPYhRTNUzf7?=
 =?us-ascii?Q?o2/MUMthrxdUBEoX0jsT2X3FKUyeyRtTXU8lDtEjxs92Q6ue8CGEp2SqOY5g?=
 =?us-ascii?Q?MYrTZJ6huF3IUJxNy19R5cv8HFazL26tS4RZDVi4Po8jEYumHBUuUm6tlgYN?=
 =?us-ascii?Q?TZH/XqJPzANLf4YMq+W9l7MrdzIWWta8ziFC+geiwDkEq1bK3ejyBpVLr/+0?=
 =?us-ascii?Q?3mSTsyfLFLhPpuBo+ETOfl2eA3hwOZ5qjbY0dwDP4F5rMoYwPFFBeUGQxs7l?=
 =?us-ascii?Q?ng5IUd/fdqVbv4GzIsgqung4E4IVx7l4Tl1/dtXwMzyJCEmleAi237b5w2F6?=
 =?us-ascii?Q?PIDppw+NIbKTa5a5+8mWCx5UcClPImCPaDWgS0oz5iM0eQN8/aHSm6B7gHZ/?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b77650-8a8b-4fd4-5d4b-08db1b31f85a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:22:44.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmyVSCQfcha+hVcCbhTgt/kqfbk5xvqsLLmt8swUcyxiHtnZs364Ve6d28/T2kuIlaqwqnS3T7//ZTkFshVHmLumVMVfgv2KHYepDnsTp0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe/display: Move device info
 initialization to display
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
 maarten.lankhorst@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 04:43:35PM +0200, Jani Nikula wrote:
>On Wed, 01 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Instead of initializing the display info together with the platform in
>> xe_pci.c, let the display part initialize it. The small disadvantage is
>> that the description struct is not automatically mapped from the PCI ID,
>> but just doing a switch on the platform, that should already be set
>> during display initialization should be ok.
>
>Have we already given up on the idea that device info would be a pointer
>to rodata?
>
>The thing that was always problematic for i915 was that it was all too
>convenient to go fiddle with the device info runtime, based on some
>arbitrary needs.

humn... I think it's fine to do that on initialization-only. We may have
a need to disable a few things in runtime if there are conditions that
block them. We may need to document some rules for what is ok vs what
isn't though, so people don't go and keep tweaking the info after the
probe is done.

Note that this patch doesn't change that. In xe_pci.c we keep in rodata
a "device description" and then during init we copy it over to the
xe->info, possibly calculating things needed in runtime (i.e. the desc
and info are not a 100% match)

>
>---
>
>That said, there's really no requirement that the struct pci_device_id
>driver_data members in MODULE_DEVICE_TABLE() need to be pointers to some

yep, agreed.  Also as we move to reading the features and IP versions
from the device itself in future we may consider just passing NULL as
driver_data. This has the extra benefit that is then possible to bind
the driver to arbitrary PCI devices by poking on sysfs.

>device info structures, at all. The initialization of device info could
>be done in completely different ways if we dropped that notion. The
>current macro "inheritance" in both i915 and xe is absolutely horrible.

we are trying to keep the inheritance to a minimum on the xe side. I
think spanning 1 or at the most 2 platforms is ok'ish and it's still
readable. Spanning all generations like we had once in i915  a
bad idea

>
>Anyway, going to block the patch, just checking on the direction here.


"going to block"  or "not going to block"?

thanks
Lucas De Marchi

>
>
>BR,
>Jani.
>
>
>
>
>
>
>
>
>>
>> This allows to encapsulate the display details inside the display
>> compilation units.
>>
>> Also use __diag_push() / __diag_pop() like in xe_step to handle the few
>> places where -Woverride-init should be disabled.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile     |   3 -
>>  drivers/gpu/drm/xe/xe_display.c | 114 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_display.h |  15 ++---
>>  drivers/gpu/drm/xe/xe_pci.c     |  90 ++-----------------------
>>  4 files changed, 128 insertions(+), 94 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 18257cd7227d..d1d255df74a1 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -24,9 +24,6 @@ subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>>  subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>>  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>>
>> -# Fine grained warnings disable
>> -CFLAGS_xe_pci.o = $(call cc-disable-warning, override-init)
>> -
>>  subdir-ccflags-y += -I$(srctree)/$(src)
>>
>>  # Please keep these build lists sorted!
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 34bdb2d60938..76e4fb6bd67c 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/fb.h>
>>
>>  #include <drm/drm_aperture.h>
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_managed.h>
>>  #include <drm/xe_drm.h>
>>
>> @@ -383,4 +384,117 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  	intel_power_domains_enable(xe);
>>  }
>>
>> +/* Display info initialization */
>> +__diag_push();
>> +__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> +
>> +#define __DISPLAY_DEFAULTS \
>> +	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |			\
>> +		     BIT(PIPE_C) | BIT(PIPE_D),				\
>> +	.cpu_transcoder_mask =						\
>> +	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
>> +	BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |				\
>> +	BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1),			\
>> +	.pipe_offsets = {						\
>> +		[TRANSCODER_A] = PIPE_A_OFFSET,				\
>> +		[TRANSCODER_B] = PIPE_B_OFFSET,				\
>> +		[TRANSCODER_C] = PIPE_C_OFFSET,				\
>> +		[TRANSCODER_D] = PIPE_D_OFFSET,				\
>> +		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,			\
>> +		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,			\
>> +	},								\
>> +	.trans_offsets = {						\
>> +		[TRANSCODER_A] = TRANSCODER_A_OFFSET,			\
>> +		[TRANSCODER_B] = TRANSCODER_B_OFFSET,			\
>> +		[TRANSCODER_C] = TRANSCODER_C_OFFSET,			\
>> +		[TRANSCODER_D] = TRANSCODER_D_OFFSET,			\
>> +		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,		\
>> +		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,		\
>> +	}
>> +
>> +#define GEN12_DISPLAY \
>> +	__DISPLAY_DEFAULTS,						\
>> +	.ver = 12,							\
>> +	.abox_mask = GENMASK(2, 1),					\
>> +	.has_dmc = 1,							\
>> +	.has_dp_mst = 1,						\
>> +	.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */	\
>> +	.dbuf.size = 2048,						\
>> +	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2),			\
>> +	.has_dsc = 1,							\
>> +	.fbc_mask = BIT(INTEL_FBC_A),					\
>> +	.has_fpga_dbg = 1,						\
>> +	.has_hdcp = 1,							\
>> +	.has_ipc = 1,							\
>> +	.has_psr = 1,							\
>> +	.has_psr_hw_tracking = 1,					\
>> +	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
>> +
>> +#define GEN13_DISPLAY							\
>> +	__DISPLAY_DEFAULTS,						\
>> +	.ver = 13,							\
>> +	.abox_mask = GENMASK(1, 0),					\
>> +	.color = {							\
>> +		.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
>> +		.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
>> +		DRM_COLOR_LUT_EQUAL_CHANNELS,				\
>> +	},								\
>> +	.dbuf.size = 4096,						\
>> +	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
>> +	BIT(DBUF_S4),							\
>> +	.has_dmc = 1,							\
>> +	.has_dp_mst = 1,						\
>> +	.has_dsb = 1,							\
>> +	.has_dsc = 1,							\
>> +	.fbc_mask = BIT(INTEL_FBC_A),					\
>> +	.has_fpga_dbg = 1,						\
>> +	.has_hdcp = 1,							\
>> +	.has_ipc = 1,							\
>> +	.has_psr = 1
>> +
>> +void xe_display_info_init(struct xe_device *xe)
>> +{
>> +	if (!xe->info.enable_display)
>> +		return;
>> +
>> +	switch (xe->info.platform) {
>> +	case XE_TIGERLAKE:
>> +	case XE_DG1:
>> +		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
>> +		break;
>> +	case XE_ALDERLAKE_S:
>> +	case XE_ALDERLAKE_P:
>> +		xe->info.display = (struct xe_device_display_info) {
>> +			GEN12_DISPLAY,
>> +			.has_hti = 1,
>> +			.has_psr_hw_tracking = 0,
>> +		};
>> +		break;
>> +	case XE_DG2:
>> +		xe->info.display = (struct xe_device_display_info) {
>> +			GEN13_DISPLAY,
>> +			.cpu_transcoder_mask =
>> +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>> +				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
>> +		};
>> +		break;
>> +	case XE_METEORLAKE:
>> +		xe->info.display = (struct xe_device_display_info) {
>> +			GEN13_DISPLAY,
>> +			.ver = 14,
>> +			.has_cdclk_crawl = 1,
>> +			.has_cdclk_squash = 1,
>> +		};
>> +		break;
>> +	default:
>> +		/*
>> +		 * If platform doesn't have display, enable_display should
>> +		 * had been forced to false already at this point
>> +		 */
>> +		drm_WARN_ON(&xe->drm, 1);
>> +	}
>> +}
>> +
>> +__diag_pop();
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>> index cb5298ceed3b..d1af8e3a5c0f 100644
>> --- a/drivers/gpu/drm/xe/xe_display.h
>> +++ b/drivers/gpu/drm/xe/xe_display.h
>> @@ -6,16 +6,18 @@
>>  #ifndef _XE_DISPLAY_H_
>>  #define _XE_DISPLAY_H_
>>
>> -#include <drm/drm_drv.h>
>> -
>>  #include "xe_device.h"
>>
>> +struct drm_driver;
>> +
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>
>>  int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver);
>>
>>  int xe_display_create(struct xe_device *xe);
>>
>> +void xe_display_info_init(struct xe_device *xe);
>> +
>>  int xe_display_init_nommio(struct xe_device *xe);
>>  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>>
>> @@ -51,6 +53,8 @@ xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver) { r
>>  static inline int
>>  xe_display_create(struct xe_device *xe) { return 0; }
>>
>> +static inline void xe_display_info_init(struct xe_device *xe) { }
>> +
>>  static inline int
>>  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
>>
>> @@ -58,12 +62,7 @@ static inline int
>>  xe_display_init_nommio(struct xe_device *xe) { return 0; };
>>  static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {};
>>
>> -static inline int xe_display_init_noirq(struct xe_device *xe)
>> -{
>> -	if (xe->info.display.pipe_mask != 0)
>> -		drm_warn(&xe->drm, "CONFIG_DRM_XE_DISPLAY is unset, but device is display capable\n");
>> -	return 0;
>> -}
>> +static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
>>
>>  static inline void
>>  xe_display_fini_noirq(struct drm_device *dev, void *dummy) {};
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 11dc0de66101..c4d9fd2e7b2b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -16,6 +16,7 @@
>>
>>  #include "regs/xe_regs.h"
>>  #include "xe_device.h"
>> +#include "xe_display.h"
>>  #include "xe_drv.h"
>>  #include "xe_macros.h"
>>  #include "xe_module.h"
>> @@ -62,8 +63,6 @@ struct xe_device_desc {
>>  	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
>>  #undef DEFINE_FLAG
>>
>> -	struct xe_device_display_info display;
>> -
>>  	u8 vram_flags;
>>  	u8 max_tiles;
>>  	u8 vm_max_level;
>> @@ -75,79 +74,15 @@ struct xe_device_desc {
>>  	bool has_asid;
>>  };
>>
>> +__diag_push();
>> +__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> +
>>  #define PLATFORM(x)		\
>>  	.platform = (x),	\
>>  	.platform_name = #x
>>
>>  #define NOP(x)	x
>>
>> -#define __DISPLAY_DEFAULTS \
>> -		.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D), \
>> -		.cpu_transcoder_mask = \
>> -			BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
>> -			BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
>> -			BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
>> -		.pipe_offsets = { \
>> -			[TRANSCODER_A] = PIPE_A_OFFSET, \
>> -			[TRANSCODER_B] = PIPE_B_OFFSET, \
>> -			[TRANSCODER_C] = PIPE_C_OFFSET, \
>> -			[TRANSCODER_D] = PIPE_D_OFFSET, \
>> -			[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
>> -			[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
>> -		}, \
>> -		.trans_offsets = { \
>> -			[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
>> -			[TRANSCODER_B] = TRANSCODER_B_OFFSET, \
>> -			[TRANSCODER_C] = TRANSCODER_C_OFFSET, \
>> -			[TRANSCODER_D] = TRANSCODER_D_OFFSET, \
>> -			[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
>> -			[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
>> -		}, \
>> -
>> -#define GEN12_DISPLAY \
>> -	.display = (struct xe_device_display_info){ \
>> -		__DISPLAY_DEFAULTS \
>> -		.ver = 12, \
>> -		.abox_mask = GENMASK(2, 1), \
>> -		.has_dmc = 1, \
>> -		.has_dp_mst = 1, \
>> -		.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */ \
>> -		.dbuf.size = 2048, \
>> -		.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2), \
>> -		.has_dsc = 1, \
>> -		.fbc_mask = BIT(INTEL_FBC_A), \
>> -		.has_fpga_dbg = 1, \
>> -		.has_hdcp = 1, \
>> -		.has_ipc = 1, \
>> -		.has_psr = 1, \
>> -		.has_psr_hw_tracking = 1, \
>> -		.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }, \
>> -	}
>> -
>> -#define GEN13_DISPLAY \
>> -	.display = (struct xe_device_display_info){ \
>> -		__DISPLAY_DEFAULTS \
>> -		.ver = 13,							\
>> -		.abox_mask = GENMASK(1, 0),					\
>> -		.color = {							\
>> -			.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
>> -			.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
>> -				     DRM_COLOR_LUT_EQUAL_CHANNELS,		\
>> -		},								\
>> -		.dbuf.size = 4096,						\
>> -		.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
>> -				   BIT(DBUF_S4),				\
>> -		.has_dmc = 1,							\
>> -		.has_dp_mst = 1,						\
>> -		.has_dsb = 1,							\
>> -		.has_dsc = 1,							\
>> -		.fbc_mask = BIT(INTEL_FBC_A),					\
>> -		.has_fpga_dbg = 1,						\
>> -		.has_hdcp = 1,							\
>> -		.has_ipc = 1,							\
>> -		.has_psr = 1,							\
>> -	}
>> -
>>  /* Keep in gen based order, and chronological order within a gen */
>>  #define GEN12_FEATURES \
>>  	.require_force_probe = true, \
>> @@ -160,20 +95,15 @@ struct xe_device_desc {
>>
>>  static const struct xe_device_desc tgl_desc = {
>>  	GEN12_FEATURES,
>> -	GEN12_DISPLAY,
>>  	PLATFORM(XE_TIGERLAKE),
>>  	.platform_engine_mask =
>>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>>  		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
>>  		BIT(XE_HW_ENGINE_VCS2),
>> -	GEN12_DISPLAY,
>>  };
>>
>>  static const struct xe_device_desc adl_s_desc = {
>>  	GEN12_FEATURES,
>> -	GEN12_DISPLAY,
>> -	.display.has_hti = 1,
>> -	.display.has_psr_hw_tracking = 0,
>>  	PLATFORM(XE_ALDERLAKE_S),
>>  	.platform_engine_mask =
>>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>> @@ -195,7 +125,6 @@ static const struct xe_device_desc adl_p_desc = {
>>
>>  static const struct xe_device_desc dg1_desc = {
>>  	GEN12_FEATURES,
>> -	GEN12_DISPLAY,
>>  	DGFX_FEATURES,
>>  	.graphics_rel = 10,
>>  	PLATFORM(XE_DG1),
>> @@ -256,9 +185,6 @@ static const struct xe_device_desc dg2_desc = {
>>  	XE_HPM_FEATURES,
>>
>>  	DG2_FEATURES,
>> -	GEN13_DISPLAY,
>> -	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>> -				       BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
>>  };
>>
>>  #define PVC_ENGINES \
>> @@ -334,13 +260,10 @@ static const struct xe_device_desc mtl_desc = {
>>  	PLATFORM(XE_METEORLAKE),
>>  	.extra_gts = xelpmp_gts,
>>  	.platform_engine_mask = MTL_MAIN_ENGINES,
>> -	GEN13_DISPLAY,
>> -	.display.ver = 14,
>> -	.display.has_cdclk_crawl = 1,
>> -	.display.has_cdclk_squash = 1,
>>  };
>>
>>  #undef PLATFORM
>> +__diag_pop();
>>
>>  #define INTEL_VGA_DEVICE(id, info) {			\
>>  	PCI_DEVICE(PCI_VENDOR_ID_INTEL, id),		\
>> @@ -489,7 +412,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	xe->info.has_asid = desc->has_asid;
>>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>  	xe->info.has_4tile = desc->has_4tile;
>> -	xe->info.display = desc->display;
>>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
>>
>>  	spd = subplatform_get(xe, desc);
>> @@ -519,6 +441,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		}
>>  	}
>>
>> +	xe_display_info_init(xe);
>> +
>>  	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
>>  		desc->platform_name, spd ? spd->name : "",
>>  		xe->info.devid, xe->info.revid,
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
