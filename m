Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1411C7618E
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 15:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89D110E0F6;
	Sat, 22 Apr 2023 15:04:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1E110E0F6
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682175884; x=1713711884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kS2K7GiyAmyXyUl6Pst+Fnz/VyZoATLpVLffmsOyUJQ=;
 b=hY+l71Asf+AhSUB6+EJYPNy4spntCVIVEeYALOnKsDPJijgaHivyabIr
 MSfdx+mItXbGt3iB5rYjNa9p5BeWnVcdwHOOTtIxFYuEnh96Z4FUnov6f
 112w3ofJXZgJa9gjR4qL17WOsevVIKOAv6hnBHM8/QCMPkdwLQ+1BV9r9
 t8YNxXW4Psg0RTKeW7URgBm5fSN1hoIpaYthWRDXJGI4t8pIqiYD9EUzJ
 cft1YSlU/vhUHiJXQ4/g2kFQ/9qB7S3MF3K94pAC6pF8Hf1qL93EQUVq3
 lRbeMGt6+DRfJr0Adj8TBZblfvtCmKz2qBLmMP80nDBP1EEMnv4TJXnbl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="374108409"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; d="scan'208";a="374108409"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 08:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="938798056"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; d="scan'208";a="938798056"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2023 08:04:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 08:04:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 08:04:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 08:04:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 08:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOMrlXioGwO8f3kfPEH3Lv1yyvwHwvmPD0NS40aX24Wi3KRdCDQKTCgtUYmiX9RGMLJzeFrfnxY30ioKBxGthU7Jm9LsSQOEGbRx5l1rNRqJFmdWVrETPwYKwMVM6/kgkGAy+Q9meVbQ+HD7h7KlZIW30rq6kv+zv6nizqvhx9RAsGvk9nvcL5XFG589i6BuFn0vCm3gM7oCHHscSXb9JBX7a5VpsZsAbR1cVU4qy6pANf6LJ+IhXmv/REgUJtSYmE1k3f76nadEVCJjULRP91wYxrgeAiqcsnTqx1Z8jovOVK+4cl6rWEP3ijxY5hrxVsUjz4OW70+1UrFaUlLhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jG7Z8RKyzZaQzudnfllu2KSmueV8GueZAVdkwg9GT4=;
 b=OKG7OfYGldGgOxdsMpXtntYXJ+2kQFaN1K89VMmTX+tCm+MuWncrGFi3F4nLm3YiIJ8zXbIi8RObd0mbFoVCXnMxHLGZOF/Wo0aM1YMWW0gGa9rb+rKWerNPo89Hqwn2Rx/sKJQGGLNKmEaaDk3wPLielKHWQAr8yxptqgQlB80BwFP6INPcJ6pCNfVuv4Y+/J5cKLD7IiPx5S0t562pUQOV4JSzpQMBYFWX/T78r7jJLQkyT/SJtP+YEifjISoF1YdmU3DGQ7FuHiJELoj1R+u5biv3d8E0wRAeEzHh/yQQq65GoXtI7qX8D6vfbQHsyfgIzmKnBxjUYGeiPhOnFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB4781.namprd11.prod.outlook.com (2603:10b6:a03:2d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Sat, 22 Apr
 2023 15:04:31 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a%7]) with mapi id 15.20.6319.022; Sat, 22 Apr 2023
 15:04:31 +0000
Date: Sat, 22 Apr 2023 08:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <doyj62mcoqu6af3phhrzgnbkkauopxjhszj6izsckwrqes7gi5@i4eia4jwrrd4>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-11-lucas.demarchi@intel.com>
 <20230422002648.GT4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230422002648.GT4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB4781:EE_
X-MS-Office365-Filtering-Correlation-Id: b78fd87e-96d0-494a-f7e3-08db4342e001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCaFp5L25f2KaY7WjBd8wxI3JXHkS+pTlGBo8aPKmKXDvZDDDBRCulxatSWXjSuPnVItFlpX0MRqQD3dnrWf0ylQiq/LTYtz+CistGCocgzrV7p0nRFJ97fyIPCv79Z5/e9c1pStBMb2VPdyuKBQv6nhsH5C7n7fxHAJ1A06A0BYYrLPqP49+XaboBYWK3mqLAPpKwkp38OaZcOfl1cNSlbpHcR7gliSozJzwF/w9vxLt4OeCiRK3inw6Q4Q3NNN/YY8HoPcEAovp/o5mhliEpVw9myCd6/q46vYMnZtqHgMzGudRVAoRDdDiKujbl5nF0t9UUNBV2L7DDy2Ri1QwL9GZvDt7jCaEzkoHz9QVlG/dO3SsSl/eb0HtZ/xpcvb5jH5komw0PX9/GLaezU/ocRsrt6KdIyghiMi1JRXpKsF0aSzM5+5a8YRTTorXycKxXwKaYw7/ltufhoWIM4/AdX5ol5/1xzfafawMYjtV+5KSfBeeudS0pxWX9kSwT4j3PNeOcpN0wQ1Gl5A4wcvaGybxqsBQCeg/CzVL5OooX23hgAQ05iL7CPvFPluxUfd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(54906003)(316002)(66556008)(66476007)(66946007)(6636002)(4326008)(186003)(6506007)(6512007)(83380400001)(38100700002)(26005)(9686003)(41300700001)(8676002)(6666004)(6862004)(33716001)(8936002)(5660300002)(6486002)(478600001)(2906002)(30864003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xwbgfAWN3qtBCIQpizeTmdsqItG5JgwQknYSreT6Hd3ZIlKNikKQRmNtKQts?=
 =?us-ascii?Q?OSreepiWW2l2zU+cUG92wqaNH2zEL+Pcbx78JNAAvU8ewwZursSQPF/V5+Y4?=
 =?us-ascii?Q?kziPhLv1a43fkSdlRyi1Am6fdj1XOo6nnyq+6uwFEz+/y9/Uef3rXLoNHdxa?=
 =?us-ascii?Q?l9x445ZzN2ufjRKdCE0h4dpSOBNcCD3j9SHS+QKEych816C/+OnoLt4LV3CX?=
 =?us-ascii?Q?bqOm3lU/3fRT7FiPgNqaOBWv8gr0C5CpYS37JcIBjKTKQpypyXMyjfzJcZd2?=
 =?us-ascii?Q?CIRLenSEl5g+pxGqXUdPuqwJUX+ZL2akCdgxhBOpkPuYiE1YHCkWUzdqjA92?=
 =?us-ascii?Q?UV1yj4Je9M4ggBItrc9fMEptnXNuLspxNjJ+LAjijPxQ8lrLDkzjYc9/Q1Gp?=
 =?us-ascii?Q?O/KBKAQ2ToBDsEU+3MSpOuzJkC3Yv1XUBfXa25/AQZmJPADiAnTq2AHC2CAB?=
 =?us-ascii?Q?aCaf4KTd9e/XkJ8bPT5XaGkaj4ib3crrxS3Brc/tXTJvH7wvOxS0qTI/wCSA?=
 =?us-ascii?Q?SIAP9HADBkENjE/Yw0FbtNF1RIZE9/QSE14BbYZkzYefAf3FmAjr+9z6q6Hi?=
 =?us-ascii?Q?PHD7EnfrTR0RmX2siIQzc124cPCDVLu8P/SJHlDVfQ/MJicY+bitG+FIUrZN?=
 =?us-ascii?Q?p31baBxANF6SmV2GFEM7sVn71I3Hmn4p7axt8tMZ5FQ/bPmOlyH8k90SKqcI?=
 =?us-ascii?Q?+Od3iX8TBZqgS/3VBbgp4qEjwa1NQxTf3lnHQxD9iJv/OHIV9aANr01yJR+a?=
 =?us-ascii?Q?Rcx8XvXqGXkcbnS17yRUK8P0Ke63OYJPziUqtPUlf30wQD6Z7NgwUDPgmf3u?=
 =?us-ascii?Q?hSoNcr64x+1j9IVbWDhxEjTImjqfJzAQ4EFuUC9j/xYbbLJ5YSQU/H7lLTcJ?=
 =?us-ascii?Q?WwNSn2FUvqAzzphd4xvUl+49/V3Ku2J0b53EVwwfJYJzz3aQf4EH5l+bV/R9?=
 =?us-ascii?Q?s/lOl+lzDYnwpfjwlGicI4++dunU/RiBNJlONIC5WFI1o/dlmzIEYszNmbZO?=
 =?us-ascii?Q?DyxGVRehmyCkkBGhbrq1nvUg6X/Luclzzlxpl95yKv1jGvNOx3fT6JDswwO8?=
 =?us-ascii?Q?EHcoiC+YBXAzDu2UnMrjueRgLHSwoRJdvm+iQvBWVPO2U5GO/faqctCZEhN/?=
 =?us-ascii?Q?s0UIQVeo2GPtKiGDdFvxGgAQKOSe3iUOcV3VpfUhK22q65rNVAVycvSDzQdi?=
 =?us-ascii?Q?eTWtk7WcILBJB7w1OQ4NkSGn4OAYXo1ozLIyh38WLW7Da26s689dzZCxNdWJ?=
 =?us-ascii?Q?jHwmP/mWqIoLNzsjRWtZDba0xN8PIr3nyhJYn3SSx71qKVERqEZCdG53HwH+?=
 =?us-ascii?Q?7+/xoEjWIQsG1sk8AzxluaPKJ3NUKHaPPZXSZkBUjt5PiVTnMb1+hWf9fWgF?=
 =?us-ascii?Q?n4olMzWc6/URlTUJiJ1hxkeIAi98x/G39lN8S/+ijZe0IKv8ghP6MzhUp8U4?=
 =?us-ascii?Q?AZsaYtIElufR01RGj5z/vrjP7SRR2xZLM9FNkkKWpqirnyHsuxeaMLoDUxxT?=
 =?us-ascii?Q?joJzAuPYwTftRv61wxpkQjYOBwCDrYKA/gVGi0sBjs65iGkCr54zH5i28Dne?=
 =?us-ascii?Q?745XnsNeweKBym2g981xd3XUZgMOAWymqJN+YTt7ttJbwQpLj+r9MELNiZ5m?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78fd87e-96d0-494a-f7e3-08db4342e001
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 15:04:31.0674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRFvXWoaaZUCBg4aZZMaK2RyS3p5Kj+OGItVlDcXKE5nvH83qlj0FwMgk/5u69KUV5PGhABSqjH2rnXiiSdzJPbBWI19SOSRgFfj9lw0Mw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4781
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/17] drm/xe: Use REG_FIELD/REG_BIT for
 all regs/*.h
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

On Fri, Apr 21, 2023 at 05:26:48PM -0700, Matt Roper wrote:
>On Fri, Apr 21, 2023 at 03:32:51PM -0700, Lucas De Marchi wrote:
>> Convert the macro declarations to the equivalent GENMASK and
>> and bitfield prep for all registers.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++------
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 53 +++++++++++-------------
>>  drivers/gpu/drm/xe/regs/xe_regs.h        | 12 +++---
>>  drivers/gpu/drm/xe/xe_gt_clock.c         | 17 ++++----
>>  4 files changed, 48 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index bfcb0e9a6d4c..938055f75492 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -22,7 +22,7 @@
>>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>>
>>  #define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
>> -#define   RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
>> +#define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>>
>>  #define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
>> @@ -54,7 +54,7 @@
>>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>>
>>  #define RING_MODE(base)				_MMIO((base) + 0x29c)
>> -#define   GFX_DISABLE_LEGACY_MODE		(1 << 3)
>> +#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>>
>>  #define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
>>
>> @@ -68,17 +68,17 @@
>>
>>  #define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
>>  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 1)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 2)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 3)
>>  #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
>> -#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
>> -#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
>> -#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
>> -#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
>> -#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
>> -#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
>> -#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
>> -#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
>> -#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
>> -#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	REG_GENMASK(1, 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_1		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_4		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 1)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_16	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 2)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_64	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 3)
>>  #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
>>  						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
>>  						 RING_FORCE_TO_NONPRIV_DENY)
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0908224737dc..4076d903b20e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -9,15 +9,13 @@
>>  #include "regs/xe_reg_defs.h"
>>
>>  /* RPM unit config (Gen8+) */
>> -#define RPM_CONFIG0				_MMIO(0xd00)
>> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
>> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
>> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
>> +#define RPM_CONFIG0					_MMIO(0xd00)
>> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 4)
>
>Shouldn't this be REG_GENMASK(5, 3)?  That matches the old shift value
>above and bspec 52453.

yep, wrong change here.

I will take care of the other comments below too.

thanks
Lucas De Marchi

>
>> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ		0
>>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
>>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
>> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
>> -#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
>> -#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
>> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ		3
>> +#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>>
>>  #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		_MMIO(0xd50 + (n) * 4)
>>  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		_MMIO(0xd70 + (n) * 4)
>> @@ -39,15 +37,15 @@
>>  #define MCR_SELECTOR				_MMIO(0xfdc)
>>  #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
>>  #define   MCR_MULTICAST				REG_BIT(31)
>> -#define   MCR_SLICE(slice)			(((slice) & 0xf) << 27)
>> -#define   MCR_SLICE_MASK			MCR_SLICE(0xf)
>> -#define   MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
>> -#define   MCR_SUBSLICE_MASK			MCR_SUBSLICE(0x7)
>> +#define   MCR_SLICE_MASK			REG_GENMASK(30, 27)
>> +#define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
>> +#define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
>> +#define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
>>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>>
>>  #define FF_SLICE_CS_CHICKEN1			_MMIO(0x20e0)
>> -#define   FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
>> +#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>>
>>  #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
>>  #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
>> @@ -59,12 +57,12 @@
>>  #define PS_INVOCATION_COUNT			_MMIO(0x2348)
>>
>>  #define CS_CHICKEN1				_MMIO(0x2580)
>> -#define   PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
>>  #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
>>  #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
>>  #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
>>  #define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
>>  #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
>> +#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>>
>>  #define GLOBAL_MOCS(i)				_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
>>  #define GFX_CCS_AUX_NV				_MMIO(0x4208)
>> @@ -131,19 +129,18 @@
>>
>>  #define	MIRROR_FUSE3				_MMIO(0x9118)
>>  #define   L3BANK_PAIR_COUNT			4
>> -#define   L3BANK_MASK				0x0F
>> +#define   L3BANK_MASK				REG_GENMASK(3, 0)
>>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>>  #define   MAX_MSLICES				4
>> -#define   MEML3_EN_MASK				0x0F
>> +#define   MEML3_EN_MASK				REG_GENMASK(3, 0)
>>
>>  /* Fuse readout registers for GT */
>>  #define XEHP_FUSE4				_MMIO(0x9114)
>>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>>
>>  #define GT_VEBOX_VDBOX_DISABLE			_MMIO(0x9140)
>> -#define   GT_VDBOX_DISABLE_MASK			0xff
>> -#define   GT_VEBOX_DISABLE_SHIFT		16
>> -#define   GT_VEBOX_DISABLE_MASK			(0x0f << GT_VEBOX_DISABLE_SHIFT)
>> +#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>> +#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>>
>>  #define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
>>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
>> @@ -203,9 +200,9 @@
>>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>>
>>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
>> -#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
>> -#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
>> -#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
>> +#define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
>> +#define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
>> +#define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
>>  #define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
>
>Should these be reordered high to low for consistency?
>
>>  #define   L3_CLKGATE_DIS			REG_BIT(16)
>>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>> @@ -225,7 +222,7 @@
>>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>>
>>  #define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
>> -#define   DFR_DISABLE				(1 << 9)
>> +#define   DFR_DISABLE				REG_BIT(9)
>>
>>  #define RPNSWREQ				_MMIO(0xa008)
>>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
>> @@ -233,20 +230,18 @@
>>  #define RC_STATE				_MMIO(0xa094)
>>
>>  #define PMINTRMSK				_MMIO(0xa168)
>> -#define   PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
>> -#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
>> +#define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
>> +#define   ARAT_EXPIRED_INTRMSK			REG_BIT(9)
>>
>>  #define FORCEWAKE_GT				_MMIO(0xa188)
>>
>>  #define PG_ENABLE				_MMIO(0xa210)
>>
>> -/* GPM unit config (Gen9+) */
>>  #define CTC_MODE				_MMIO(0xa26c)
>> -#define   CTC_SOURCE_PARAMETER_MASK		1
>> +#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>> +#define   CTC_SOURCE_PARAMETER_MASK		REG_BIT(0)
>
>Calling a single bit a "MASK" is silly.  We could drop this
>completely...
>
>>  #define   CTC_SOURCE_CRYSTAL_CLOCK		0
>
>...and dropped this unused one...
>
>>  #define   CTC_SOURCE_DIVIDE_LOGIC		1
>
>...and make this one REG_BIT(0).  Then in xe_gt_clock.c the code would
>just be "ctc_reg & CTC_SOURCE_DIVIDE_LOGIC."
>
>
>Matt
>
>> -#define   CTC_SHIFT_PARAMETER_SHIFT		1
>> -#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
>>
>>  #define FORCEWAKE_RENDER			_MMIO(0xa278)
>>  #define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
>> @@ -350,7 +345,7 @@
>>  #define GT_GFX_RC6				_MMIO(0x138108)
>>
>>  #define GFX_FLSH_CNTL				_MMIO(0x101008)
>> -#define   GFX_FLSH_CNTL_EN			(1 << 0)
>> +#define   GFX_FLSH_CNTL_EN			REG_BIT(0)
>>
>>  #define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index e6b81bcff91f..da1d5aa6cdb7 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -37,10 +37,10 @@
>>  #define XEHPC_BCS7_RING_BASE			0x3ec000
>>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>> -#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
>> -#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
>> +#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
>> +#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>> -#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
>> +#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>>
>>  #define FF_THREAD_MODE				_MMIO(0x20a0)
>>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>> @@ -90,10 +90,8 @@
>>  #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>>
>>  #define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
>> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT		0
>> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		0x3ff
>> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
>> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
>> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
>> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>>
>>  #define GGC					_MMIO(0x108040)
>>  #define   GMS_MASK				REG_GENMASK(15, 8)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index 1b7d00284535..384a47d3c3eb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -17,13 +17,12 @@ static u32 read_reference_ts_freq(struct xe_gt *gt)
>>  	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE.reg);
>>  	u32 base_freq, frac_freq;
>>
>> -	base_freq = ((ts_override & TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
>> -		     TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
>> +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
>> +				  ts_override) + 1;
>>  	base_freq *= 1000000;
>>
>> -	frac_freq = ((ts_override &
>> -		      TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
>> -		     TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
>> +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
>> +				  ts_override);
>>  	frac_freq = 1000000 / (frac_freq + 1);
>>
>>  	return base_freq + frac_freq;
>> @@ -35,9 +34,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>>  	const u32 f24_mhz = 24000000;
>>  	const u32 f25_mhz = 25000000;
>>  	const u32 f38_4_mhz = 38400000;
>> -	u32 crystal_clock =
>> -		(rpm_config_reg & RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
>> -		RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
>> +	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>> +					  rpm_config_reg);
>>
>>  	switch (crystal_clock) {
>>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
>> @@ -74,8 +72,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>>  		 * register increments from this frequency (it might
>>  		 * increment only every few clock cycle).
>>  		 */
>> -		freq >>= 3 - ((c0 & RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
>> -			      RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>> +		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>>  	}
>>
>>  	gt->info.clock_freq = freq;
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
