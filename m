Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8198CC6FA8E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470FB10EE4E;
	Sat, 25 Feb 2023 00:38:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D0A10EDC7
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677285528; x=1708821528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GhFA2B0MYss8AvRnP6EFzuIvKK1FS2QevdCRLRiRNu4=;
 b=gnszOoc+FJ/iTNlP3qz0CyXfIrWKCbCJkWgzCEip7Yrs+JRYjiq+QKe8
 JLVgF8jAaMUhon3ASBs7q19NW66sHilV6RENthSqIRcM1QucP3/nyGUSg
 Jh2sYtIzdYHPuIDyJ1BeD0iP9jArb/ws36KyzEOPwUaQDti11bcol03In
 WZG9Jz2l1ZCSzoCwGffpZ0a9Do2nXof5Hz6PyQV/rLzE2l9+T4Ml40YmL
 Ljfj5uu10gdWSejHrPqKkVfbyeKi+N0F5MqKWbGYu+OJtrZBU3FTGbKx5
 NH8NKcUEhojPz61Du7RfzitK3dUH/p3zBEQcR9Bak/pZRPFqsIuZF82gO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="333617419"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="333617419"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:38:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847128148"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="847128148"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 16:38:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:38:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:38:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:38:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:38:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr2j3ApiATOMcteEyctVldBE1TqB+QDDIvSEKz09m/fco06Qd3ODv9PU4g/NHJmE9aSCNerrBj3zldzUeYMsB2fzvyYWyCzz+xKnlX1YVby9ksh3voug409NDLQMB5l7PcM12xgKywFbaX6SrirRjPTIuQp5nbfODOyOyWfpO3382h4O4QfBphmGX1j2jJfMiM5fu5t4Jg3nNc7okwndIyIFviCcNKrFz7/itXZO7tkkPoqzcv+qgJwiKuGJ4KVJXyuz5dw5eBhpKhJFGMl6RFVoqz9IXE89koPox4aKHWUyv4ZByxynEUV9nGn7c20YCZwpzljJVmSlu3/r0I5U/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KX/7KU5okS+TjUs2e457bwlPBsu7R0otPj/cwrz9NLM=;
 b=DOmlyHqoyUwPosDP6x9p1uAMQxiRNRgFsUZbsNDyYsulC7h7JO7nftUVr846FKB5smxy7ul9SlxUB63YE3kv4NkN552Z83iZRsZsWVN7csDnx8DMf3VJE96vPtcfEvFqkEr2+70/YSmny42cRRxQd1QIEp83UGmp0XNZerSp6Q8KZSdSkXpoRQUXyvt19Qf3cQehAw2RtcRMqdIsx3rQMh3qT6LcSebO2zhbhbmTyZWPdqqUisCnT89PzhmmwpIg6ix5EZW4gAIteBKlhmpX81C/ORUusBj0w8xRk9ONxsE+tj3D0VAMDArvYoQ9CACi2hULB5vDll+zZxqKrFEKNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Sat, 25 Feb
 2023 00:38:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:38:40 +0000
Date: Fri, 24 Feb 2023 16:38:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230225003837.gdchoxlgp2il3np3@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-8-lucas.demarchi@intel.com>
 <Y/lXFhtKHQ+Cq7EI@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/lXFhtKHQ+Cq7EI@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1d4964-b661-4a5e-25a0-08db16c8a379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVonxmk7iVvp/FSaWuSXgnBGtH6qWarOZiupg7l3hV7b44mmzIeJIEFCW5CPLxjhhbMJjqw+VirHbZy4Bpu25TtMV/NqFv9tP64ZZOgvXRc22XJ+7ZFI7D0L8NB9vgM1W2R3jG0YCGilK7+omRD63c1XzhlnPMe1bzSApVEvJ1obQ59Xuzknvf5w3dHMj5/xwCSN9jpxWNY53X9N7PeQI9on+TxFEla5UtMWriXomxgjBBqPO3oxGZNC55p8loEO/lQ7qsmclVHqr565pqx6kwypvp8iH2aTdCiftMcXoM/oDuutbMuLBQHyQO0IpL4dhmTej05EPBj+WvclP1xBNlSxKvU9w2SeFict8NL594hOa6EIXRZPuNdeJ6FbPJKYz7Y8MFknjWRRcu5IQNLTU0DLQ4/q/SwKuJoVD6/eum50jNo7/XP3+DR7SZneHIaoVoCROVyfczDmbrLynV59Bx0KHQz6gWNJdQY3kfD584UM+Di86cOcdhdQeEoKP808LKtKB654oXJ5Q3sbSblgChhPEtOvJrPthTIBES2wEySlVPATVP/BsTT3tlwDhdN7x+sNGtBGq9gFlZsxRtfaFPsoL8+/M057tpGm6OI7SpXQPdU5YVlNNraV6PdYUc8EVqLHVJ8Z3VFrqpPHia/BJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199018)(82960400001)(38100700002)(2906002)(86362001)(478600001)(6486002)(186003)(6512007)(9686003)(26005)(36756003)(66946007)(6506007)(66476007)(54906003)(6636002)(66556008)(41300700001)(83380400001)(4326008)(8936002)(6666004)(316002)(107886003)(6862004)(8676002)(1076003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iJq2LUADxWCeiM1HVkH04DDGdswBTIuKyEMpfVdk5Tr2+dqeBQhnJ40iOy?=
 =?iso-8859-1?Q?8qXcNjuwVZ9D+kXsjCWt5TKA8hRq2VaF9BNExWYSNCZFHAuS7s5+7k6uq6?=
 =?iso-8859-1?Q?ZV88U0UWZsxb2OR7GZDdXZ56GPBFyYO/II6Zzop8JBDh9/lxKy8WXEHunv?=
 =?iso-8859-1?Q?FK2s0bf6O4h/Mhj/5zW6EyADDZcLXhICgCqrGcf25lwRHJR834qWJpfaNt?=
 =?iso-8859-1?Q?koA2pq2rpHdeJFaaoEFpPcwE54u4Eez0srrf0vt1DiLCtgSJ0T0ZRqcBuk?=
 =?iso-8859-1?Q?JSlol0QujXL6VG/2KHpPiFIBEEQ2hwniO6aNcyO/K7GUdVHfERr2TtLbVR?=
 =?iso-8859-1?Q?rGmNmvNdE3eZn/WfDbM59HhGu3Zi8RQFnkxwFiy8zVEii02YdiS2Kk7NkI?=
 =?iso-8859-1?Q?+cKYKG5HwLS+Ca7djNS+ZZV/J96h2HHfN9BzyiS8o/1t6qoTTvhfjB9QnH?=
 =?iso-8859-1?Q?qEDu59DNqlZZM26zq3PjvmdVRN2Ff8T6acsf6jRVYZ2YlvXOjAcBedIvA8?=
 =?iso-8859-1?Q?nQsI6tL1SYlJ1qIJhWWBMG2cUSd22g+Gp297Z5CuYxsi/baeKGhKs6fwaY?=
 =?iso-8859-1?Q?lKN8M0mm37XPbeGS6ay3c1u4EHpgVYbx1vKnqQOnqEK/a7+RqvCWskO82G?=
 =?iso-8859-1?Q?5DdbisMefiBIGaZrMc5WISuljGok795EMCswmTHgmMK+iR+WqiSdjVpJKK?=
 =?iso-8859-1?Q?0jRCTOjgLAYnRwRrX1fNsVTBf7cuHiDw5Nai9nMkZnGQZHq/Smrcug5fHq?=
 =?iso-8859-1?Q?Oc3hVdWk/641Po6sBRoS4GRXEeQ8mZILF9UpSD7Avmh2QKgEkc8DG2wNzU?=
 =?iso-8859-1?Q?7bDzuxZaXGNGSJLPKroTgZMl6LvfhPQxzm5jYlkrKbAxd/lZvMwB2xBFij?=
 =?iso-8859-1?Q?TzFo9TJ8P+wygWYlMIbL/ebxlihGo3SwPwUMx3XhCG+zheT9j6Vh3bPtVs?=
 =?iso-8859-1?Q?yrM+7d7hqu74jqvjq6Eor3tp06qcTVGRhjNZXmYw/dDyl2XmEJ9frspAWN?=
 =?iso-8859-1?Q?ti1dSy7VChT2E+I29Fn00HRkIQ24F40saDB0T+mqTsR4IKvgSciBtKauz1?=
 =?iso-8859-1?Q?7mxh6O2MBVYO+KevzyRy/gAotdAVw2UTcFWjKUYqGLqXuGAjaVeQMOWHvU?=
 =?iso-8859-1?Q?nrd4E/s3CRMZcLj6QHupWT2F2opLIR6UNMTZJ46gxvdwoEVx3ivygMBz+T?=
 =?iso-8859-1?Q?+xGzbxXizp4FJwp3b9goVHh/JKwYCjh8CsIzsCahwwyg80z63p+r6U21wI?=
 =?iso-8859-1?Q?h3xnRzg3IFCXjQre4abcDxWPL5rEKnabBYJoc15J4JIjofLdP9Eig+gn9x?=
 =?iso-8859-1?Q?/gcfQyC79RGoYyIthFHt8cfAdn2oCOP0HW1clSxVRte2JfNLZwDjXdNXz3?=
 =?iso-8859-1?Q?qYNWSBt9ZXMza5COxCFvXjYIjleK4sUixeaTWl0Txbvgb/wlfn6iJ2n0Vp?=
 =?iso-8859-1?Q?Pr+Ie6rl5Gm4RNIKxfFB2inSEZm/USJclN3XCVRpqR4V/JVNiSgUNzcp/6?=
 =?iso-8859-1?Q?FDbc4O6E2gTIin3SN9j8pVZuF3a6K25CAKT0Y/hnKxwABf3ZU3QdRPQAEr?=
 =?iso-8859-1?Q?4M8tF8zTiEOxEolr/ByP8zUmZVsL10Ey7Hp/6LUwxvQMVRYdqp7X3xDC3/?=
 =?iso-8859-1?Q?vrk+VnJDixNouDsmjlHEoGWGpxznTlzLVDRm+6+nFJKGjHp0tSRlU9XQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1d4964-b661-4a5e-25a0-08db16c8a379
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:38:39.7140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYOY+n34pH3LsDHpIuUfg/tf5IwYevYI6IVYeJWGK4fnJFvvlR5SUL23VisAtz7qkmMuRLyCcWdLhlp5A/zGcYoS2IjoxCMWN68Ha39gSSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 07/12] drm/xe: Remove dependency on
 i915_reg.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 04:32:22PM -0800, Matt Roper wrote:
>On Fri, Feb 24, 2023 at 04:15:43PM -0800, Lucas De Marchi wrote:
>> Copy the macros used by xe in i915_reg.h to regs/xe_regs.h. A minimal
>> cleanup is done while copying so they adhere minimally to the coding
>> style.  Further reordering and cleaning is left for later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_regs.h      | 111 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_execlist.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_ggtt.c           |   3 +-
>>  drivers/gpu/drm/xe/xe_gt_clock.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_guc_pc.c         |   3 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c      |   3 +-
>>  drivers/gpu/drm/xe/xe_irq.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_lrc.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_mmio.c           |   3 +-
>>  drivers/gpu/drm/xe/xe_pci.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_ring_ops.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |   3 +-
>>  drivers/gpu/drm/xe/xe_wa.c             |   3 +-
>>  13 files changed, 123 insertions(+), 25 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> new file mode 100644
>> index 000000000000..53f1ed54fb1c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -0,0 +1,111 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#ifndef _XE_REGS_H_
>> +#define _XE_REGS_H_
>> +
>> +#include "i915_reg_defs.h"
>> +
>> +#define GU_CNTL					_MMIO(0x101010)
>> +#define   LMEM_INIT				REG_BIT(7)
>> +
>> +#define RENDER_RING_BASE			0x02000
>> +#define BSD_RING_BASE				0x04000
>> +#define GEN6_BSD_RING_BASE			0x12000
>> +#define GEN8_BSD2_RING_BASE			0x1c000
>
>The three BSD defines here (and VEBOX_RING_BASE below) should no longer
>be used as of f86cbd81daa9 ("drm/xe: Remove gen-based mmio offsets from
>hw engine init").  Not sure if you want to drop them now, or do that as
>part of the later cleanup; either way,

seems easy enough to squash while pushing with no risk of breaking
something

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks

Lucas De Marchi
