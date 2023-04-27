Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B01C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 14:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F66E10E2AD;
	Thu, 27 Apr 2023 14:08:30 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6154A10E2AD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682604508; x=1714140508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rnYyiiYADNoIyAmhE6jfKZAfadmzRi1kUOvIA1EkyYo=;
 b=PuJ53jzADZRzRhyczPdY2zK2R3aAA92xx6G18MY5a/ovD6UChNmtot+5
 S2MpAq7+thkWbW7LN7EBM2ZEY857BwZY2Z2EpwQZHPtHDFsd+zEkJflIz
 E4OwaSmXyFAnHU8NPVjSD55N6LaYyMGqan8V+Vm/WgxX2C92hip9tAC21
 RViEbFjOx/W4rZbnO6Xs0+XzL776G38JBCCx+r1vtaINO0hIGvE8ULfsm
 CaqKJKrQ16a6kA4bAxZJsO8AOWaHXQ+LVPzyrvw7HxlzGbJzNasSSiyU3
 qz9e/EhMoqsFS/8RE5gmlCZDPHEb4KZq1EqNfnLSlZh1QSvRWv4jp9ouj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346212456"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="346212456"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 07:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940695174"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="940695174"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 07:07:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 07:07:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 07:07:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 07:07:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 07:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXN6w7FjlujaiQuczLmKO04m2FQj0koI6pf1nvwraH77RzJLeA5xpus0uEWQVMDbWjbBm5Asv4D0I5Y9SbTBBet2MWe6ZSlSNHN5NfsQpo+QGIPbw9J8T1jqxMd4w6fih0AXE+a1AVeak1CCRBW+uODjAYF1wMCfoxZWdSiPF/4kQ5EgNCXxewIknrvrOOOp1WpmcS3Q/TrIcLyynqts0LqwVO2naL6ym2acnYKNbWIMHxj10JU9M1S/8ueXGhP/uRqUzMextaz6O/BrOwC/nouUoSTUZa7p4AJTWin1TpRv7piIbBkcD8uRZWX5x8ctlZUwmcTHjFMrpLlT5VZZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIc9gNtW/Bt0G7aCTlzXESY9y27B313Ff++moo6/1sE=;
 b=Lhnf+cWenSnDs60joRABiUZc2KSW86a4SqpGNs7yTAbcmex9WFzz5SIfuesm0hBmvRyIJpYpTNA+HzWDk02G9+g5zO3p9q+9SioHNFPx057Ei0gbAjsQdBfeEvYIqo+0y4pwjr3uVCfxygCg2LpU1X3cTGX3iFudgdNidk8ObLCzZNdo7aqNrrHLUQRF1qwv5759A2a9m69rAGa7JpJ0B+53IjZoJtU1vcBjjvyzlVWtK1pV1cQJvbXidjWKqfUtRR7Y/u79W3Do40xjPj5li2J2USzYZmnOT/Cfa4odekUqY1qchn5U4xDGimGTo4TxCB1dBOuFB1gNvmdBhX5ouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Thu, 27 Apr
 2023 14:07:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 14:07:52 +0000
Date: Thu, 27 Apr 2023 07:07:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <swymsefc5a4q3m2wt3v6qyum4nmlqg6jj4s6fiyxdz5fyt7lak@rfzf6fhqw3k6>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
 <20230426213242.1315119-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230426213242.1315119-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da7fd1a-a0a7-4240-9d76-08db4728ca6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tbyNMpirs3k+K3OGdWKbALmgkxyB75eM0CHq3EQDbak71KgrERqJFFGuh+hL28WkJXolm9DBfXwa0Ah2tbO+qWVRTudJYblcGq9md2P3sum0e6oSEyarxUN4KXms/IuaT/aylw3bs+WfduFsN347nRpMhms3uswqHyX4aesUGLXwE2y3c2il2jCGXg1goOgnfefp6zkS/LTJd7OdwchIuOp0GM33cMmxvJiVx34r7XqfAs4yLETDGDATo2YXSpTRlV7+z/AMQOZt5MXqk25rIQCkNtYWCRoKYJyDjiBic2kmmeeZeqVL7DjP6/QWJXuEZojRshzv5+7pmg/bfjifO9wdxTM7kH+iN8Vzi1n+lCwJ+5rCmtmOHstwuUs2soB7duntUZAev+fT3fQ5QAfh5OkbmbeV7mrlY83Iis7hQJ3he4AtZRgDZRcQdnpRQIiN+PiOnpUFn3WnNhFYAM8Ekn0DADeDWolRJ3fsVkjXOGH185lhT7ez8yAuj/FSColI+wvEhI2rQWxDfjNzUqB+yBPw2EHVI34RiH1eZx1/b8rdvCVM81gJMajsCjqg4PBh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(8676002)(8936002)(54906003)(478600001)(66946007)(66476007)(4326008)(6916009)(66556008)(82960400001)(41300700001)(316002)(38100700002)(2906002)(33716001)(5660300002)(186003)(86362001)(6506007)(6512007)(9686003)(26005)(107886003)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H+YkV2a3E9dtKHLy6LPAq4OyxRqwiRoGwgHK+JHI6vEMFfa7xEgEJJzE2iAw?=
 =?us-ascii?Q?5N5E0z9pbbuxtB3Vf2TYvBueMd7AnNCNwVfSCFqjPOfN7FvFuyAQZOSf8ghZ?=
 =?us-ascii?Q?AOSY8by8hyzW76c10h5miiK/MOcR1DJy5bWzxxFYiyFQAbBx7oDk7NTJZ+IB?=
 =?us-ascii?Q?DqpmUnrdkqIQkaiSBlup150swiGlRNIdQAYP0y9C68IjuTyS0TPY9eXvAW5C?=
 =?us-ascii?Q?CgUKc+v++ftQfqSWbAtZIL+JHTT7gR1DbqFkPMS7oS5hYgakI+xeaLv+GMPX?=
 =?us-ascii?Q?g7AZJpLe25yiewN4bXbQVqjmKLHtQS5j8DLA5RktHvgoDflRHp7mt/4d15Oc?=
 =?us-ascii?Q?5oPfy8fwLihRH9HcvAQXx1iYUTZ4XknAOb6mLXrxkHYyXy/Qx7FASMUMzif0?=
 =?us-ascii?Q?73O4tGmR1+/yFY9LnbhQoXcnop9w8Pj8nPFHDorQt649/HAToDm/Hbsir9kO?=
 =?us-ascii?Q?LdP/gDS6nXQyFHRXF9nRyBqc6YU8Lryfn5UwUvethSaFx9bjbp8c1QAAzhGr?=
 =?us-ascii?Q?tFelh2TusRHxuYduiUqKqsVq1c9IEhLwYUBeF+D+QquP8ySEL4Aedph3SKQ9?=
 =?us-ascii?Q?b28CXwqXcM7KP0pLbAjOFmE383d28nWLSe/9Rx/0jiBPvjPj6tc3bZTs0Gh8?=
 =?us-ascii?Q?cJf3bMvwsjkfSo6MFkos5uDPZbV/4oUg2noDgwXlR8A3MLZfBw3nXfytj0lP?=
 =?us-ascii?Q?zE6eA09sC7KgObFZq+uon+e5bOwjjsThl5R3wJhtGsomWqe/DyCegvGmmnB+?=
 =?us-ascii?Q?siW7CvQxFvhnCs0NPSdR+g21oxu/53w7UNsON0uZ+TI/0qg4nadxSEU/hcZd?=
 =?us-ascii?Q?C5ez2qyx9kzFt3thnZO2DqxRzPRSsCo+LIk+u1krJRuqVBScRjKgHZDfl6Id?=
 =?us-ascii?Q?asIiiFGTUYqBHvGdggPbDkYD4oHRKyYJ07z35zWPZyMWKdhEDBQkbFCxfVLV?=
 =?us-ascii?Q?/+UQkFGSO2hxkaQVZBctvuTV9u/L+LC+GYGzGMLleAk2Pyxi4dUiIWYlM4e+?=
 =?us-ascii?Q?GuNpG4LuSJzESNBseW4w1yYIvuG6eSd8RFc7CtTPQwmo6Q5EFjanONMJU6ds?=
 =?us-ascii?Q?A+kkm7tR0PuJ0d4kDrGr7Jymumxu0hiCDdVW5pKNr0x0XxW7x6MtmJkAijjn?=
 =?us-ascii?Q?TMHS9Rwwc1e/uxR5aSBdnDoC3/yBTiz3YwoHIU1bHvWmkXmAJ2DodDvlsWxa?=
 =?us-ascii?Q?y7aCstOlgRShYk+QhMZvl9I7Eagoqx1Ik4N1XIHI/UwHDwjQBHNm9TmGqEV/?=
 =?us-ascii?Q?p9HPTsgzbtfkJMRx/xFKPN2LQEE9NEpTDyTMX76gcJU2/24/KxclNwyh8ctE?=
 =?us-ascii?Q?32U1GTZRBKuw660faPhJQva+6CeekydvKQibPh+kdnookCkpqnXn++AQ0p2H?=
 =?us-ascii?Q?ghtdc6S7o3pUEVNc/lEAYmXKhihplI0wPKGy1uPjfJvU48uLUeqorM4xc2uX?=
 =?us-ascii?Q?yOkJ92NyppCh285jXBWrJrEgUMge234BbrF72PrrEX4ewy/1wddIHPVWsunI?=
 =?us-ascii?Q?E0UDkvhhE/oZax/UjoRChcheqynjJPKTVYS2g+1ty2uFLo5FiUu36XBGMwjy?=
 =?us-ascii?Q?dZTsxmpWkOKpPlLUftTHaSsC+FL5Gg9ydo3ubMZFivvpA3C67o4XadPzybXB?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da7fd1a-a0a7-4240-9d76-08db4728ca6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 14:07:52.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BME50Ok94DztCKg5Q/n1YIxQBUe5EWo42ofSKtMONxUf6wnoEsefwzvrg3oftXIEUSQInQvr5vmo8po6y1e2FNpczrLlHdA02NR2n3fmYLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/17] drm/xe/guc: Convert GuC registers
 to REG_FIELD/REG_BIT
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 02:32:33PM -0700, Lucas De Marchi wrote:
>Cleanup GuC register declarations by converting them to use REG_FIELD,
>REG_BIT and REG_GENMASK. While converting, also reorder the bitfields
>so they follow the convention of declaring the higher bits first.
>
>v2:
>  - Drop unused HUC_LOADING_AGENT_VCR and DMA_ADDRESS_SPACE_GTT (Matt Roper)
>  - Simplify HUC_LOADING_AGENT_GUC define (Matt Roper)

First 7 patches pushed. For this one, it may be hard to review. So to
double check I didn't screw up the defines I created a test.c that
prints all the defines in regs/xe_guc_regs.h

	sed -ne 's/#define\s\+\([_()[:alnum:]]\{1,\}\).*/\1/p' drivers/gpu/drm/xe/regs/xe_guc_regs.h | sed 's/([[:alnum:]]\+)/(0)/' > /tmp/a_defines.txt
	<apply patch>
	sed -ne 's/#define\s\+\([_()[:alnum:]]\{1,\}\).*/\1/p' drivers/gpu/drm/xe/regs/xe_guc_regs.h | sed 's/([[:alnum:]]\+)/(0)/' > /tmp/b_defines.txt

test.c
------
#include <stdio.h>

#include <linux/limits.h>
#include <linux/types.h>
#include <regs/xe_guc_regs.h>

#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
#define ENTRY(x) { #x, x }

#undef _MMIO
#define _MMIO(x) x

struct map {
         const char *s;
         u32 val;
};

#if ARRAY_PRINT == 0
static const struct map define_map_guc_old[] = {
	/* Add a_defines.txt here */
};
#endif

#if ARRAY_PRINT == 1
static const struct map define_map_guc_new[] = {
	/* Add b_defines.txt here */
};
#endif

int main(void)
{
#if ARRAY_PRINT == 0
         for (int i = 0; i < ARRAY_SIZE(define_map_guc_old); i++)
                 printf("%s %u\n", define_map_guc_old[i].s, define_map_guc_old[i].val);
#endif
#if ARRAY_PRINT == 1
         for (int i = 0; i < ARRAY_SIZE(define_map_guc_new); i++)
                 printf("%s %u\n", define_map_guc_new[i].s, define_map_guc_new[i].val);
#endif


         return 0;
}

After building with -DARRAY_PRINT=1 and -DARRAY_PRINT=0, running this
through sort -u produces the diff:

diff --git a/tmp/a.txt b/tmp/b.txt
index 38f397c7a10c..3e613d584e62 100644
--- a/tmp/a.txt
+++ b/tmp/b.txt
@@ -1,21 +1,19 @@
-DE_GUCRMR 278612
  DMA_ADDR_0_HIGH 49924
  DMA_ADDR_0_LOW 49920
  DMA_ADDR_1_HIGH 49932
  DMA_ADDR_1_LOW 49928
-DMA_ADDRESS_SPACE_GTT 524288
  DMA_ADDRESS_SPACE_WOPCM 458752
+DMA_ADDR_SPACE_MASK 2031616
  DMA_COPY_SIZE 49936
  DMA_CTRL 49940
  DMA_GUC_WOPCM_OFFSET 49984
  GEN11_GUC_HOST_INTERRUPT 1638896
  GEN11_HUC_KERNEL_LOAD_INFO 49628
  GEN12_DIST_DBS_POPULATED 3336
-GEN12_DOORBELLS_PER_SQIDI 255
-GEN12_DOORBELLS_PER_SQIDI_SHIFT 16
+GEN12_DOORBELLS_PER_SQIDI_MASK 16711680
  GEN12_GUC_TLB_INV_CR 52968
  GEN12_GUC_TLB_INV_CR_INVALIDATE 1
-GEN12_SQIDIS_DOORBELL_EXIST 65535
+GEN12_SQIDIS_DOORBELL_EXIST_MASK 65535
  GEN8_DRBREGL(0) 4096
  GEN8_DRBREGU(0) 4100
  GEN8_DRB_VALID 1
@@ -27,20 +25,15 @@ GEN9LP_GT_PM_CONFIG 1278272
  GS_AUTH_STATUS_BAD 1073741824
  GS_AUTH_STATUS_GOOD 2147483648
  GS_AUTH_STATUS_MASK 3221225472
-GS_AUTH_STATUS_SHIFT 30
  GS_BOOTROM_JUMP_PASSED 236
  GS_BOOTROM_MASK 254
  GS_BOOTROM_RSA_FAILED 160
-GS_BOOTROM_SHIFT 1
  GS_MIA_CORE_STATE 65536
  GS_MIA_HALT_REQUESTED 131072
  GS_MIA_IN_RESET 1
  GS_MIA_ISR_ENTRY 262144
  GS_MIA_MASK 458752
-GS_MIA_SHIFT 16
-GS_RESET_SHIFT 0
  GS_UKERNEL_MASK 65280
-GS_UKERNEL_SHIFT 8
  GT_DOORBELL_ENABLE 1
  GUC_ARAT_C6DIS 41336
  GUC_BCS_RCS_IER 50512
@@ -85,10 +78,8 @@ GUC_WOPCM_OFFSET_VALID 1
  GUC_WOPCM_SIZE 49232
  GUC_WOPCM_SIZE_LOCKED 1
  GUC_WOPCM_SIZE_MASK 4294963200
-GUC_WOPCM_SIZE_SHIFT 12
  HUC_FW_VERIFIED 128
  HUC_LOADING_AGENT_GUC 2
-HUC_LOADING_AGENT_VCR 0
  HUC_LOAD_SUCCESSFUL 1
  HUC_STATUS2 54192
  HUC_UKERNEL 512
@@ -96,7 +87,7 @@ MED_VF_SW_FLAG(0) 1639184
  MED_VF_SW_FLAG_COUNT 4
  PVC_GUC_MOCS_INDEX(0) 0
  PVC_GUC_MOCS_INDEX_MASK 50331648
-PVC_MOCS_UC_INDEX 1
+PVC_GUC_MOCS_UC_INDEX 1
  SOFT_SCRATCH(0) 49536
  SOFT_SCRATCH_COUNT 16
  START_DMA 1

Which was indeed intended. I hope that helps the review.

Lucas De Marchi
