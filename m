Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1415DC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 20:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41CF10E46C;
	Wed, 17 May 2023 20:23:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC1E10E2A6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684355006; x=1715891006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TPtjErpGb2HUE6tQ2PSmqHqhPEHANKl5wRoKtN3fclc=;
 b=LNFnsLOiii2M4M5sJ9WYRkxPpx8T0Peb1uqzFd+s8rBedyQsIqPYJAmL
 2aiOBCgKg4l2Ihfz6LOQSyi4n86Pxj/6UQJ9kiAAhjCh1/kI/pYrpHfDw
 NkUh/cBT5LgrCxlswXkonEOSD9hYyVI1nMLNOrhFb/VEo969Vo8fdv8Hh
 I7b/G+7zMR+fLI5pJO0CsGK77ITMg/l+6bAV3BZVaUBHcUppfj2h98nUz
 DQcVGqO3luOobbxo+RXk7jjbzBpNdOSA5rsf1GJUrjBXyHSJ6Oh+5RuH9
 TQ8dyObHATwkKQvDQFtCy03wXqHSPA9ct+SatZ3nQDr+hCog06MX+WJpM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438210714"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="438210714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 13:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948396146"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="948396146"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 17 May 2023 13:23:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 13:23:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 13:23:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 13:23:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3pejlSEhNveyNwmZ25jJEQmZ2QNQCMpxyv6aS1BHT2BOw7cEgP2C3hfz2vdkAzLau87SH41HRRSCQSz7SShkY5A/3XuHwpS8BDf/ItMEMqT49eGA+qAK8C+sAVPAZlR/yYtMGtWoZrpEnUGzE5VuGMy7Ewq+AnCaaAF6S+DyvoTZGs5jxHYQ2OkS26oUMLWVGgXS/VZrr+Usy0mtp2S/1BKBKfrq5STiVcaMdWVVUwWlPDMgNtFqqD4mRIdRpjKAUH/hcHLN2H8Vm4GL/bj5UJdI5VePz2ahoFVYkIMKyAqrvr5jYpmKMYoJ0LI6Rwy+T/RGI0THlpKASVYmX360g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scjvQ7dAY/DWDq9nYgXqKPREuFj+pw35U2UGVrbUJBs=;
 b=Vs2gOwl1f13mNVFM4IIMSOaswwS8P+wIm4VVvE6W3nYiNyanK2Uvu/PM0qKuaLgrzhAwOBvNLvGUg0JL/ZgH3DwQnn5P+3qNE6junrgp1MopmgJE++SvyzmKVck34r0e+Qol4Qyzn/aFwx1X1R53dzHZTi8L3ZEgmQ/ic/kuI54ztuCbGHmRMrxGc+uTr36cX0jubK3skSZT6RJsDqHay11VaBrJHECZVtoKk34XZs8ORLe9axeYsusfES1bBFShLk1TFcubB0Q01vBv3lx4XZdlTVlUCHBj7TRcbCB3w8ZYAzwUZWWE985fPaQaOK/saLQIJ/P04uuZ0f5i5VJHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7163.namprd11.prod.outlook.com (2603:10b6:303:212::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 20:23:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 20:23:22 +0000
Date: Wed, 17 May 2023 13:23:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <mxv4x3arjisvb77y3y4wkqqhr5zy4sy4d3fgc4m3ee7poanqlf@pvcesrduhroy>
X-Patchwork-Hint: comment
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-6-lucas.demarchi@intel.com>
 <20230517175056.GR10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230517175056.GR10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 2415a03c-cf61-4c04-ae5f-08db57148f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwPreC9j6pcQ7AqkMGCQaOjoFkFBJXkHfYp0QLYc2QAFhqqMHHcP0nUQyWSGqdHjgCCeM0ubDy6f5Gep2WNEArod2L2JtCGYnsTVLXdRK2KedgwGEOGfV4wdjGy2/TKu9hMRhR8l34HSFcIXLzyK1CKkZnQ2R7z8ycxeefi+UX0zrKEn7D6z3a59S4Qw64ejBFUNc6GJNKR75D23/FTpvo8uBZMGo4Lc8NE0kH/ICx83HxcHF28A/PrsJhXd0bEDrF7q99lY7pyZMCrtcL/08E63/gWIr3uF1H7kjhFc+/1q61PxhS0tXS6kWyxcU9vypIO28v7/d3TymXQ++eZP9oQKA/sl5hMTt7Arvy91X0cOsULBdqaFcKRzkbPYw+GH5JYz53dNWpPKq3SFB1zQHJkklgq620AnWkt74V15ycYYJ8v6OwB1fjfeDJhA+pmhf7eN0eIMZ+BN/kCxvz/CmgCI7iJEcwvDJ4zEmJAWOw2EEMEAEenBZE8K9HQxw+LqjJMLOTtKTYMM597u31IzyEOAKe+kUbRuXTtLHhA+jaIg6o6FCB4NBZC4Vz8msY+wR9bdG1xvBQljZwpI1IvoeuE3y2rBD7XseyDviA9Z5jmrSogH19KYFDp4wyX/hLBY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(86362001)(6666004)(316002)(478600001)(6636002)(66556008)(4326008)(66476007)(66946007)(33716001)(8936002)(6862004)(5660300002)(8676002)(38100700002)(41300700001)(2906002)(82960400001)(186003)(26005)(9686003)(6512007)(6506007)(83380400001)(107886003)(6486002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2GDnyZhtNV/4Rs9s/9SU8FxTwLa9kKZ7R2j4XMR7tbpgIjAySHBRjXwQgrFt?=
 =?us-ascii?Q?PcgnMTKq2cCl4EtpqJKnIwKKbpEEbpZHFsSiRKXIYlA9zFrIKXJ8taRMbJFE?=
 =?us-ascii?Q?NOGiIzz8mvyY5Ms72OMvwkG3XWzIE3w+9kHIiwdt+kw7Zw1dxFfDPaGyHQd6?=
 =?us-ascii?Q?OjzcwaroSIJHbvNOlAs/FAmG4/3lbjn5W7V5LuydayVUGe3l/mwcYFJhmwiO?=
 =?us-ascii?Q?GttJ46JqQJSfe61EukwV8JRkunc4z/mcGynNWYPYgtXfYoOOqRKsYu8swrAP?=
 =?us-ascii?Q?IFtZHvOSuzljD1e9JlvwX7Hr9qnTZhexNbOi3EyTITU0EExJ1bfpw6hMEK9G?=
 =?us-ascii?Q?/aZNU1x0V+/3jb4eRunXYjBbCamjVzJY6zoATslcW2C5y2CWox3cGhqcEGg9?=
 =?us-ascii?Q?XcKlIUBw2vQArn2FheKwsJqQsNpuFXfEi70czQTUCX2rBQ3BS7dHNIh4Wrfs?=
 =?us-ascii?Q?gs8TPGnRi+BGDK4qom+kzn5X+tZkNH542UP82kUXdBe2rtj1BYrYGJRs4BE+?=
 =?us-ascii?Q?gTzDEm/ZdFmGv814SNSITrAW9sZLcILGk/fmhaCi3pBU0NUIWa454LUaR+b2?=
 =?us-ascii?Q?mEjwjioAfsPpgJ9pFP2ZoWBXN5u/uP0bcV1NBhwtCyf6XKnkkYZIxXWlYKcL?=
 =?us-ascii?Q?PZGfxRTm+p3eV4ig6L6rb8lGqCOC/P+cw6S1L+wO0v8xrPL/j/aVbRJnP1KG?=
 =?us-ascii?Q?Q5pSKPL8bkoYc7LwFTK32P/VfO4az2HlQBUl5zaqbQhfKUqEL0xzwOXxD4uR?=
 =?us-ascii?Q?X1TWERAwQiix32fZOzNBEGPkLXmgqs91g6MENAEjnZMQPpVlO2WCAQ/AIV5C?=
 =?us-ascii?Q?rYzblTzW4MIuccuYK912WnZm7mfx7lhvNSS2n2FBIB9cXvJfCurRQkZIMej7?=
 =?us-ascii?Q?rt7kt6YaiZ28RQmHZ9nBN4s74STEk9NkrTcdAy1zNhWmS12hB1ZUcC5O45wt?=
 =?us-ascii?Q?AOX39RANj1B1H+mXru7gq5PFm5n2HGg9LuNMFUOu1Wc6rKVz5Pc2wmH2RvRX?=
 =?us-ascii?Q?3SQ6+0HJlg7+0hLvtY8qsrlEQ1R5sK639HTuwmH680PXJS5JDv0MWu+Ifqvr?=
 =?us-ascii?Q?aTBRKbKZFj25aEOiIuTZxf3UhdKutMEBOC2lWIqlcb9yyFu6r41HaIDnBRiV?=
 =?us-ascii?Q?Ez3mEndUGpmZpgAOtvSxYB2cZrJcgm/c0M1JcDFX1m8T/gP9GS853iUkHvSu?=
 =?us-ascii?Q?IIhFQsa4yPfEmfym9UQxQYACZ5HlFFEBQxkuYmioUAjIMiy2MtSH/e1HrWuN?=
 =?us-ascii?Q?ikYgga8JOHrejKrAsD/VNLv3b8BFJJ7JMe6LMh6CCNLzY3w1geq9AoI/AL0y?=
 =?us-ascii?Q?MQggvjA7/FOU4+N0BHA7VsB3U1+T2n8TZS/eKm7gZLq/PAQLD++/nqxyHNKv?=
 =?us-ascii?Q?Hl6Yhf2aGpuWmiJjAvj2dpMPAoknBqJI/QwNHMJi+KLT0pSH+34/NRVhKQ6o?=
 =?us-ascii?Q?zUhoPT+5TWBzfF8BKw3xuqETTlysZaMiAejyv9yactjpinSaXIsxuMl4Vu7J?=
 =?us-ascii?Q?Na9AkMfaJdqDKbn23QfsISkOuOlDeVYb05Twy1G+m0QfzGCBHD63oNAxFKQl?=
 =?us-ascii?Q?EnItNaj3IqmLA39YxadJlKZ8IafskHxhSosWfez5hzRjn5PIOyIy+nTcm2V0?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2415a03c-cf61-4c04-ae5f-08db57148f66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 20:23:22.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8q9LCBL/QCYFLsKMxfdLMwpSKLQ+SOUEfKM/2+BRiXunidIWwwKJloLpiYK5wIylhjxOGmMxSt8NAYOeA0IjU8y3Tl5SiY7Lvkad/HdeWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/9] drm/xe/wa: Track gt/engine/lrc active
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 10:50:56AM -0700, Matt Roper wrote:
>On Tue, May 16, 2023 at 03:19:46PM -0700, Lucas De Marchi wrote:
>> Allocate the data to track workarounds on the device, and pass that to
>> RTP so the active workarounds are enabled. For later reporting purposes,
>> there's no need to differentiate the engine or gt in which the
>> workaround got enabled, so just use a per-device bitmap.
>
>Going forward are we going to want to track these on a per-device or a
>per-GT basis?  The workaround database has switched to associating
>workarounds with the IP block rather than the platform since sometimes
>they're needed by both the graphics and media IP, other times they're
>only needed on one.
>
>For example, consider a couple different MTL workarounds:
> * Wa_14018575942 -- applies to both graphics and media GT
> * Wa_14015795083 -- applies to graphics GT but not media
> * Wa_14016790560 -- applies to media GT but not graphics
>
>As we get more post-MTL platforms where these chips may get mixed and
>matched into other platforms, I think it will be important to recognize
>not only whether the workaround is active somewhere on the platform, but
>exactly which GT(s) it's active on.

My idea was that for tracking purposes the device-level is sufficient as
I understand this would be more useful for knowing "is WA X
implemented and active?" rather than if the action it takes, applying
only to media or graphics GT, is correct. For the latter, we should
really be checking the register-save-restore in debugfs to know if the
bits are being applied correctly where they need to be applied
(and for OOB workarounds  to check whatever the thing the code is doing
in that code path)


I may be wrong here though... need to think a little bit more or more
time to be convinced otherwise. The change would be relatively easy, so
may be worth doing:

1) allocate bitmap per gt/engine besides the global device one
2) run the rules together with the gt creation
3) when reporting in debugfs optionally apply a bitmap_or() for the
    summary view, producing the same result we have today in addition to
    the drill down

Lucas De Marchi

>
>
>Matt
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  5 ++++
>>  drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++
>>  drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
>>  drivers/gpu/drm/xe/xe_wa.c           | 36 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_wa.h           |  2 ++
>>  5 files changed, 55 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index f7f6a6a97757..ac6898a28411 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -31,6 +31,7 @@
>>  #include "xe_ttm_sys_mgr.h"
>>  #include "xe_vm.h"
>>  #include "xe_vm_madvise.h"
>> +#include "xe_wa.h"
>>  #include "xe_wait_user_fence.h"
>>
>>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>> @@ -251,6 +252,10 @@ int xe_device_probe(struct xe_device *xe)
>>  			return err;
>>  	}
>>
>> +	err = xe_wa_init(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	err = xe_mmio_init(xe);
>>  	if (err)
>>  		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6490a04614ce..b8d7864950c4 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -265,6 +265,16 @@ struct xe_device {
>>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>  	bool d3cold_allowed;
>>
>> +	/** @wa_active: keep track of active workarounds */
>> +	struct {
>> +		/** @gt: bitmap with active GT workarounds */
>> +		unsigned long *gt;
>> +		/** @engine: bitmap with active engine workarounds */
>> +		unsigned long *engine;
>> +		/** @lrc: bitmap with active LRC workarounds */
>> +		unsigned long *lrc;
>> +	} wa_active;
>> +
>>  	/* private: */
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> index a9e0153ff87d..b1e77055f9cd 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> @@ -108,6 +108,8 @@ struct xe_rtp_process_ctx {
>>  		struct xe_hw_engine *hwe;
>>  	};
>>  	enum xe_rtp_process_type type;
>> +	unsigned long *active_entries;
>> +	size_t n_entries;
>>  };
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 557e90d79f0b..fa37b1c0425a 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -5,6 +5,7 @@
>>
>>  #include "xe_wa.h"
>>
>> +#include <drm/drm_managed.h>
>>  #include <kunit/visibility.h>
>>  #include <linux/compiler_types.h>
>>
>> @@ -580,7 +581,10 @@ __diag_pop();
>>  void xe_wa_process_gt(struct xe_gt *gt)
>>  {
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>> +	struct xe_device *xe = gt_to_xe(gt);
>>
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.gt,
>> +						  ARRAY_SIZE(gt_was));
>>  	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>> @@ -596,7 +600,10 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>>  void xe_wa_process_engine(struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> +	struct xe_device *xe = gt_to_xe(hwe->gt);
>>
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.engine,
>> +						  ARRAY_SIZE(engine_was));
>>  	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>>  }
>>
>> @@ -611,6 +618,35 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>>  void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> +	struct xe_device *xe = gt_to_xe(hwe->gt);
>>
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.lrc,
>> +						  ARRAY_SIZE(lrc_was));
>>  	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>>  }
>> +
>> +/**
>> + * xe_wa_init - initialize xe with workaround bookkeeping
>> + * @xe: xe device instance
>> + *
>> + * Returns 0 for success, negative error code otherwise.
>> + */
>> +int xe_wa_init(struct xe_device *xe)
>> +{
>> +	size_t n_lrc, n_engine, n_gt, total;
>> +
>> +	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>> +	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>> +	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
>> +	total = n_gt + n_engine + n_lrc;
>> +
>> +	xe->wa_active.gt = drmm_kzalloc(&xe->drm, sizeof(long) * total,
>> +					GFP_KERNEL);
>> +	if (!xe->wa_active.gt)
>> +		return -ENOMEM;
>> +
>> +	xe->wa_active.engine = xe->wa_active.gt + n_gt;
>> +	xe->wa_active.lrc = xe->wa_active.engine + n_engine;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> index cd2307d58795..8edad4f92800 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.h
>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>> @@ -6,9 +6,11 @@
>>  #ifndef _XE_WA_
>>  #define _XE_WA_
>>
>> +struct xe_device;
>>  struct xe_gt;
>>  struct xe_hw_engine;
>>
>> +int xe_wa_init(struct xe_device *xe);
>>  void xe_wa_process_gt(struct xe_gt *gt);
>>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
