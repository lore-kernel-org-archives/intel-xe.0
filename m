Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6797AC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 14:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166F410E487;
	Wed, 26 Jul 2023 14:46:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966510E486
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690382778; x=1721918778;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3B3tIl4OzCPWY9WRUxWvtM2v+HHenNYHTFfFOOKtoNc=;
 b=bo00MFQaIXFb/0J52xAbX2HSP3dwYQY+46PGbwPrO4lm74Vf1pmjvHwy
 AVzM/NJJ/T0AJbmdNL+C7JwMUoR6A0z3LprLHZxhcRlZHQwyEeRj+lTFH
 xhwKp7iaLJ6kkxH362BPhehuZu3elLgOj1lGL4De1ytHTeM1ssmVEbwh7
 9eJBJGRHVHPBTrk9dtQLbB0GkXdxn40cn/E3XcMOR8mU+fM8EuINcHtNH
 B4D5KB4OhT8Wj1OQYXA4RstschkP7oItZtoexsguB292V13OKliAK6c8C
 7qf8lVWvUGz2nWFz/l2CyNaDRSNZZh8Vp/KiAymyyIMX8Wsdh7BbBw+iX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347646275"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="347646275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 07:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761681186"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="761681186"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 26 Jul 2023 07:46:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:46:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:46:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY88WuXzqew3u6OhTXkZPPfArooOtvS61WP5UGI7bJWUQN0uNxrFvBZ7JotcHa2jYUJ6umL45btrDTSPS9Zvv3LB99P8l3SyHJfmGHfYlStBTtJ3wYstDiHqmNs5jBO3nl42InzP4ckKDVR5DqRfPLNTZllYZbXrf9Po4BCiumJF9lxsDaUYyGY/PWnSYjuh5LJ5zYdfqsHj1UwHr98rHZ2J+9pMXaQr60X4WT002E9ZPISRXHLQsafVMkI6Q3wU7dtvgpxxVbittmc8JMi7dingXgVtJ5O1X9JN4tskNzW5NpeWAlH1fzBbsaCZ7twMFx3cGXeQ+zcornpYh/r9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K66xsvZsPzlCEB8yzXymtWAV1sMTDAxLqoCs/scRtmA=;
 b=BIJJ+AgQm1dhAj5cOjM0LwxejAAKe3NRN5GV4NxSL+ystQJrUluPuWBihYEczIQHDrVXdgWIECzQiboUfanjkHyreFsCCjnzSPVFaX+wNpXEwq0tY2MzPb2xMPdEphSXABGxtTFvsbfnxZi51/3WdyjD5Ru3Em8EDq2K2/ryYKhnOKn2/uclFeLKoJkU574w8aVnjjwDhq431MN2BtNFPeAQb59xwPqU6UIodKfAjSTKHPoCHp1hFHGcC5mlnMGolhFZuANmUSvYv39mtplQRmK/HbJ89mHJ6hUcRqH/on318L1SIGE7wHeiwPsNWfAMUYqYAJLSC4neQ+D1ckb4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 14:46:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 14:46:14 +0000
Date: Wed, 26 Jul 2023 11:46:09 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <w6r3nlsddl4euiug2b2ec7fgds2md767kiye7fpa7ip7d4ktin@gof5474xjdbl>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-5-lucas.demarchi@intel.com>
 <20230725225515.GZ209733@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725225515.GZ209733@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: e261a739-f410-4c27-1122-08db8de70fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/Dzgblj1qOIIqC3TWnEzpLt1qVzGknrBnj2O34M5gWRhbamtmVjS5pNcLcVAd5wghKn8g6KwZEgQ3rYramNSgJA4rga/ieUQN9vcZb5/cM2lLiF1UPzGuE7Y6a9LB93tLNp0XYslX9K6SRPxligBMVW9NQtFDT0eVb0fJ89qzYGZL3kWzOVHwJBsW2q6DtEsos5x+B5w5jcIqMdNkgC7AFXt/++cILPbi1rYhZqTsgYKSe5UpDaGqDwxD9+etgu97Js77DKBLW1tDon+GWSQMxy4yiM8/98JZU9ITozpzumAOVZ3kUsqXgiEye4nIT9ovK9x8aodQntTHlrrzr+FKxCHoincLhGLK0XnfZ+lpqrvX2tPlz0ChbUgXtjaz6vzvaeAxP/7JF0NSE/WIpBmX157d9KbmerKnC+pY1rGDNCBIHLB5spWvAQZ5xBCxWdoR6rgxYEO1KOEWuYazawdFTFqYy+xpCVF/MHyWfK7UR5bb/3zIksjAuTqpX+u3o6b93+6gpJe4rWrX4jk3pJgKvxSgg5vU5QOJZ9buBpS1dGCvgMBW2MziY21NhE9kBt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(6862004)(8936002)(8676002)(5660300002)(41300700001)(316002)(6636002)(2906002)(4326008)(33716001)(6486002)(66476007)(66556008)(66946007)(6512007)(9686003)(26005)(186003)(6666004)(6506007)(478600001)(82960400001)(86362001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1uZT+yTqlEDb345xNTOLYd2kPXcF+yeI3j7D0/ysYOXHlrJvmr6KT5Su4QuZ?=
 =?us-ascii?Q?fOj1fn8AcpZvS2m4bg+WcxA1njeeGME1AVdhH9BFfcqtl8LrxeHqOB7CQw1i?=
 =?us-ascii?Q?Q1kNQXOrSp7ZfAsVIOY35bHG4SJKnGVGSzKJvDGm3YBifwTCul13XNjuc2aJ?=
 =?us-ascii?Q?9bkvWLocrgwyoxMEFKI6JiXy4rAVo1olZ5RH538ejPSjpbKc3Ek4YdgMcIws?=
 =?us-ascii?Q?i/o6fpJZKr2Vcp0glOsQj2j4q8wnm7LBz+CVfY4+7cZtUFMzDbOZlKWtMAtw?=
 =?us-ascii?Q?3SnZ3JPaiFY6psxEfu4xAf4oT2rlln2+TmErn0lLfxSOMn35Yl1iUjcj1h3Y?=
 =?us-ascii?Q?qX8UYYgNZ6d4zqymaUMwai11EFhz5BfBu1qtFyeFyqPknGafCOL5zry0iot4?=
 =?us-ascii?Q?AysFv7c3sQTMQQyLwYyRroHR1BgpJ827kJfSQrdkVo2s4udc6hgwTzuftwdz?=
 =?us-ascii?Q?AezsUQz1eXFpWs/3dUrVsfelyHNZScQdtrBd6+gllWuw265c3Gt37V9864v8?=
 =?us-ascii?Q?A4+L4QXxPq4f7tLNizqNelsml9mSbHT+dElH/gNT94W2WF8yUZgWZOaSFuUw?=
 =?us-ascii?Q?z9FKGmYeagDsxS+L8ZvF/vWNgiIAAzN7iJHUwc5LWfrMQFJNrFxPCGzliEDG?=
 =?us-ascii?Q?AiUnJu/fHkIQZ/7X1ymN+fIxdIpsAI1v8a4if3kYgnm53iE624guS98j8hsD?=
 =?us-ascii?Q?mq/TddujRb86p3Kh7yH7whnC7nmqx7msc6xHKTFlaeo76ZOWEcNT5FgtfNr/?=
 =?us-ascii?Q?X8yUb9jExU517GFAtYgNr1WKYYTlJKtRl86j7Inl6bdvhpxDBSlAnogMUJfB?=
 =?us-ascii?Q?OUnM2xciukuUtGHncDZ0xjn+XzTJjq5L8cpXi0w8yYnQFxddkKAJ6EdzYfKb?=
 =?us-ascii?Q?0QifnhWoM/+8/NC+lSIupVUEZYmVOrrdF+Pqd6NiJImeC32XGVrI3nIZZuJu?=
 =?us-ascii?Q?o3JnLGGqz1BnbplSK71LrC7MpuT6UOtN0dvK3xPLYSB+bJUKnWF+BQr5uA40?=
 =?us-ascii?Q?xu54PORORa9pePKlgnpdhYhpxeKo0fcujV8RcZvrM4DHZ5LmJDQhmpIVgMsa?=
 =?us-ascii?Q?kcSyy0dIaCDEtAf4EE6zpTw9+8xknYSXMO2erQHTOYeljxwi7c6p+N6MXudD?=
 =?us-ascii?Q?Det/ORk+/CCzrMUyyDALcJPuzvUdx7Lcfjvi38waF8E8j4eLbaYhCxPIwMx1?=
 =?us-ascii?Q?XtSyYxYphB/ma76WHmCA8igzAL7E6QkeDBOFh3Nfy6T1EcbLwpMZ+Z5OOqoD?=
 =?us-ascii?Q?XCotKJhuF0oIDrd88KIqBo+vbuIAa9hwpfWEvEyABwDwS5NG78Bf6Vl+mvrs?=
 =?us-ascii?Q?27KQ+vU8Ndl+hA/AzoBQEfRPYsRQKpqLsSGoZ5W0TqJ/bGeaRb342DNvnjoS?=
 =?us-ascii?Q?qUArvbpi4P+cU1qzeaUiT9gab8CgiN9iQU+Zcr6cp+h6JT4PpOeHbZLur6Uw?=
 =?us-ascii?Q?EoHyXelWSuSU84idkA1918Ssk6+FMgO/niBL12OQHcySMpWPmzETpl4rj7rK?=
 =?us-ascii?Q?JJ8Y8EEy0/BIvUulyCx30zXFzJS1MxydrjIVwFwnh60HxMbSTxSax9ZqEVLm?=
 =?us-ascii?Q?wqLlvEcdt8hNtbEL7tJEAKPrdocKo8W1XZD4o+vXnzsc0T4YDm/VlAb2yWwm?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e261a739-f410-4c27-1122-08db8de70fa6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:46:14.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYFD07nkRhpR9mye0IseiUzSYLQF4bm94l7GgUfHq2KfrjtBQvd37cT3lI0HCVOtWWrDxiU0tb2zS7vwDsL0hkc2KHZH1bcroOeo36FjxCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Sort xe_regs.h
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

On Tue, Jul 25, 2023 at 03:55:15PM -0700, Matt Roper wrote:
>On Tue, Jul 25, 2023 at 01:28:36PM -0700, Lucas De Marchi wrote:
>> Sort it by register address, but  keeping a few exceptions when a
>> register for a platform changed the address, but has the same
>> functionality as an already existing register.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_regs.h | 56 +++++++++++++++----------------
>>  1 file changed, 28 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 3f7052fec6cc..0b3607e0ba1c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -7,9 +7,6 @@
>>
>>  #include "regs/xe_reg_defs.h"
>>
>> -#define GU_CNTL					XE_REG(0x101010)
>> -#define   LMEM_INIT				REG_BIT(7)
>> -
>>  #define RENDER_RING_BASE			0x02000
>>  #define BSD_RING_BASE				0x1c0000
>>  #define BSD2_RING_BASE				0x1c4000
>> @@ -45,36 +42,15 @@
>>  #define FF_THREAD_MODE				XE_REG(0x20a0)
>
>Looks like there are some registers that don't really belong in this
>file.  We'll need to move at least this one to the engine register
>header at some point.  Actually we should probably move the *_RING_BASE
>registers as well.  But that can all happen in a future patch.
>
>>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>>
>> -#define PVC_RP_STATE_CAP			XE_REG(0x281014)
>> -#define MTL_RP_STATE_CAP			XE_REG(0x138000)
>> -
>> -#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
>> -#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
>> -#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
>> -
>> -#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
>> -#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
>> -#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
>> -
>> -#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>> +#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
>> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
>> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>>
>>  #define PCU_IRQ_OFFSET				0x444e0
>>  #define GU_MISC_IRQ_OFFSET			0x444f0
>>  #define   GU_MISC_GSE				REG_BIT(27)
>>
>> -#define GFX_MSTR_IRQ				XE_REG(0x190010)
>> -#define   MASTER_IRQ				REG_BIT(31)
>> -#define   GU_MISC_IRQ				REG_BIT(29)
>> -#define   DISPLAY_IRQ				REG_BIT(16)
>> -#define   GT_DW_IRQ(x)				REG_BIT(x)
>> -
>> -#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
>> -#define   DG1_MSTR_IRQ				REG_BIT(31)
>> -#define   DG1_MSTR_TILE(t)			REG_BIT(t)
>> -
>> -#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
>> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
>> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>> +#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>>
>>  #define GGC					XE_REG(0x108040)
>>  #define   GMS_MASK				REG_GENMASK(15, 8)
>> @@ -87,4 +63,28 @@
>>  #define STOLEN_RESERVED				XE_REG(0x1082C0)
>
>We should also make sure we're writing hex in lowercase consistently
>too.  Again, that can be done in a future patch.

yeah, I mistakenly added this is uppercase in the previous patch since I
copied the value from the other register that is also uppercase.

>
>>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
>>
>> +#define GU_CNTL					XE_REG(0x101010)
>> +#define   LMEM_INIT				REG_BIT(7)
>> +
>> +#define MTL_RP_STATE_CAP			XE_REG(0x138000)
>> +#define PVC_RP_STATE_CAP			XE_REG(0x281014)
>
>I think it's better to keep consistent sorting rather than trying to
>keep registers that moved between platforms in the same place.  Too many
>exceptions like this ultimately leads to chaos when people aren't sure
>how far they can stretch the exceptions.

Agreed, but we probably should write down the rules. It would be good to
have some rules that will allow use to eventually convert this to an
autogenerated file. However we have the following situations:

1) Regardless of moving the engine bases,

#define RENDER_RING_BASE		0x02000
#define BSD_RING_BASE			0x1c0000

would we leave them spreadout through the file?

2) When the register keeps the same definition and just changes the
offset for a new platform, what to do with the bitfield definition?

Lucas De Marchi

>
>> +
>> +#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
>> +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
>> +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
>> +
>> +#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
>
>It looks like this one should be slightly earlier (0x13800c < 0x138020).
>
>
>Matt
>
>> +#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
>> +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
>> +
>> +#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
>> +#define   DG1_MSTR_IRQ				REG_BIT(31)
>> +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
>> +
>> +#define GFX_MSTR_IRQ				XE_REG(0x190010)
>> +#define   MASTER_IRQ				REG_BIT(31)
>> +#define   GU_MISC_IRQ				REG_BIT(29)
>> +#define   DISPLAY_IRQ				REG_BIT(16)
>> +#define   GT_DW_IRQ(x)				REG_BIT(x)
>> +
>>  #endif
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
