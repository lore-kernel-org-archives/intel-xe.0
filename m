Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49694C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B6210E239;
	Fri, 24 Feb 2023 18:54:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15F10E239
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677264859; x=1708800859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=20LBhrb4w8ClrMY5N7euirgzOz34CGyha9F4xTWcA70=;
 b=XN0cPFAIlM4N9lGHqhV85OYHxrM90C8uvoYc/e84O4wawDpvQrghgqj8
 RkGJTl/el+Q6fMIcTR1hVWzkSNsB2XKkUzkQfUHG6t+4Fstqr7NU/9kUX
 Ixs4yB6uEwQss9rPt4iVeHAqQxLpkdI1PoVNNQMdFhhCX9URI183XRdI8
 gPRiWvNqYBq2he4PdcC6V+TOzopPZr4D+X4+8kcqSBl8+EXayLroX3Lxq
 QzIkSAb8+eARfQHDhCGpqoRAvQ03WCOmr4rPjCWj1rzKGymg4cXwVM9FJ
 6hxpRADo1ONtGYNg3tuhOBOb7Auv/vZSFPhwIemue2st4r3HcvkjFrDRI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335790584"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="335790584"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815838097"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="815838097"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 10:54:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:54:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:54:17 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:54:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeT9jiAvfCzffxLYiQVNDRW3dswSOp1sC5Zz4cGKuVwPVbwt4at3gTwVFVxlwcZsof+1IwgJ+8mlfETapTB3XlSs6Z8KYd/fvaAAAOfmicVPtWnjRqMREAnM4nJnwivpyf38pTSWOaI94yeG9aNoPiCqTm36hg4SpebvCvUMcoY5Oe20CUpLFivkzEj7ncA5zFZKphhx3BNHQ/KNvz0VWNngAddJ8wXEO/iWV9OnW07vm+qT3kW4lgKGvmtt4l0qZ1d7ARfj46Y2WMDq7d5Eq6+SAUpSxQh74+NblyCGBvhakCjSWan1OpKXVFhw3PZpN37uVA1GVyGHcq+u0/Dtgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8/f4t0J0sRJH4CpTjh8VYTyI1R/WwN635oK8tTUQno=;
 b=ZN32Q2ddLNXxcuGlUBm7lIanJqtr6U0+dXXPDBrZJJ3mRKHKs94D7quu2oVEqxMZDGxibKdIlQRoR4EQDE86PW14pYAW4XSmGXmKHGXj4nG2aBGhbNEQcsHqL60wFjPemdJCv3GaOu7lT5Ps75IfdXQDN+UnhOaCai9aLbEzbLiTv5yMxJt55Y7MEf/Hm7Wn3KJlMr1GgwRNC6UZUsb4WGnEkVzgZakLXikS1yxFbpImyVXQ29WAgBAie3eez7eeK1QaDpc7SjAjjQ1dH81RTu7zXX+WAvrAP7jZ/lvhxyGj7MRjkMRSikL4sJ7QZelkSjkgGhxfFANCJPaCb8LzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 18:54:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:54:15 +0000
Date: Fri, 24 Feb 2023 10:54:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230224185412.xj2zshw2mrtkshpp@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-7-lucas.demarchi@intel.com>
 <Y/j/2unKXBULwbTJ@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/j/2unKXBULwbTJ@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b75758-2504-484c-bfc9-08db16988666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rFmaqvc2J7tQhQ96gAHXOJysECJG05vMpQAYnv/Gf/JrR/t9YmyoJfd8TK+r4eW+Nx9hnQ7I2HXlFcDgEDWgxaKq+8iSwJb7rE/mTvk50E/Fn66ZDwAfRUdGZbIoz7pwBUi7HLDRXJ+u7280D2yh6xWWFjWWkdB71N59A0yJ4mDlYAHX6E2EB9BzS6tgo3NHQYcKWdJ07XYr5OSrwOFH42d6OdcmAXBGsCqRegFohjBNafnStxFvy+Hg4dkcEeQK6baumqs5ZlO9c51r9nOxWN3vAB99JtkjGCDBL+R/cCFRsRIlukSUef85Zvozcl9fyBIyZR42UXfS5druRiFudaWITOo+/Dc0AKldSF4VaM6YqcrpjFVlnZwsIM35TUp2sVghhTeHxLk3uIjoD5HvJfFhR8XkOHLE4wl4U1rOH/IAgk13NiuNh1bGRlYWMkp9U2eS3dMgm1+LnTu3re5xxqZJAUHokwBsIk+fheXFiKyBbDCTF8Hux+LfW/XZ6GUB2wWo0MjB2WQ/0ZRtbC0vuqI8qsZHjPErfdXiNacKVAZuoGDkynsjUkVxT22ntDxtrPcO6omf46gPSY5+aioORaG1SR5Ti0DR6f+uMgGyEntOGUc4uqSV8IJsF5cRTv5HRGbNslzXKikk7oMuIbVpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(6506007)(1076003)(6512007)(107886003)(9686003)(6666004)(186003)(26005)(36756003)(86362001)(82960400001)(83380400001)(38100700002)(41300700001)(8676002)(6486002)(66556008)(66476007)(4326008)(66946007)(2906002)(6862004)(8936002)(5660300002)(478600001)(6636002)(54906003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZR5IwwdbC8eQZ5jkC6Vv2bwuenz6Xhq2Y5qPPR6Q8P+V99bpf6JkoJ7+FM?=
 =?iso-8859-1?Q?Izo/pTrQfI9f2mS6wFteIINb5rdnwv8B1Vw5oxERTnEBZXL8DahArpHqAj?=
 =?iso-8859-1?Q?Dv6dBabGPCzooKBzlKzZQrl10SGGiPzzrZo7qA9xl5v2pvdW/H6NiUgdJY?=
 =?iso-8859-1?Q?WhweovjvbeoxoJzMM1rLdb7Jt6QM1EM0R8jVDrqfziPhK5L9xObwxEduJU?=
 =?iso-8859-1?Q?iF4lwKBXGrdAYx4pWTHvavPA7BTZV2K3xxnsuM5gmOMlmjYUSYIYpI9clj?=
 =?iso-8859-1?Q?ef+PicgOx1u2skWhHB/VUDLW5LEo8/61VI215uRjLyasagBCHjY5iHJbYJ?=
 =?iso-8859-1?Q?zifFia4VVb9DEc0idmZ3nKmm91WM7jcW/bhd4pOP/7N7TlcWR017Z7/Wg3?=
 =?iso-8859-1?Q?M9IRKb+vO48PhXDeMnQSzrXqA+SwYK879fcXpwxZM/UdLzjfC4TBtiXYFR?=
 =?iso-8859-1?Q?woorIo3DeHZNPdSewHNyKfPRkvdiJcGKxvMopI5CRYzhuy7kfejji4NDyz?=
 =?iso-8859-1?Q?+l56cpjlW6BmN+rpgqZu6iS4qcGyhxtp6qiasoBbkH59HgKxz48QMIHsI/?=
 =?iso-8859-1?Q?O/L1F9DmobW//n2uAiK+gA/tWxa6E6gUIr3FQU/VtCWlaplMvFzwJ+REtB?=
 =?iso-8859-1?Q?hW6XXK6FNrzZXYX/Ku8q8y15FD18qBqpHxA8T74t1RRSL+GKkFpNHQcn0M?=
 =?iso-8859-1?Q?l29sk7P31TPdj75oA4KjRfvlzCxA0UHPc+OBT3cvwqDBRhsFzB5igum2So?=
 =?iso-8859-1?Q?gN0Yzu6IQqCaHkmnDZLKj/4x0RpVgP1oBOmZ1UjWbZdq+2VgS0lix6ULP0?=
 =?iso-8859-1?Q?oYqh/PrnA+VDVr+kL1UxL95nQmuCvp8JgI20hL2iWDAQmqzei3KYj+euhb?=
 =?iso-8859-1?Q?OPkI/7D/lmqSG5sVAP+guDGMaykm5r0G3DacAqoXSCwYfP6FlqUPLMHPh9?=
 =?iso-8859-1?Q?V/p49gIwKw4nFDUIkpPOa2aKe53Ipu6LI80Xuds+878jK3bif9pQImHL0g?=
 =?iso-8859-1?Q?4Rr8OCEcG9Oz1XjgHkVAvCzL7z+Fm77LqY7ho8J0QL4IOH7Rdbe9+PsPLc?=
 =?iso-8859-1?Q?+8F/KoQU8PRmn0p/e2LMWCb/sUMq20Yz6+KTYtoiAcASVmPfkt+oNMPWcj?=
 =?iso-8859-1?Q?t4Cq1eUWZ80vqXtYw5Vknyx7wP9qRjocyfUuVCcgytEUAMHWiMTPjRmo1W?=
 =?iso-8859-1?Q?QJqzUCutTEvwCfGTsx05anf5cYnpAQ6pLz2VtEPH5VFQ07PX/IA4oPHLNC?=
 =?iso-8859-1?Q?3Img4fp9bdDXq61QZstwqLH4GbmfigU0EBTqVX3hpe/Xz55n99/eSy4m3T?=
 =?iso-8859-1?Q?MREnkW+f8K9Ud4ST5AeRL/VbpzNNIPRdQfAAgToPci8ZTonjGUNKlYKGiR?=
 =?iso-8859-1?Q?7FO8auRQ7MN37NwkJLdtZBXbeHs57KXVKn+823XoShSyjNhgJ8lpGyAZ2y?=
 =?iso-8859-1?Q?Z0Cgq+QorqPNajDbhlGuBxERQooYt6n2RB0TkiO3pvbtQWaRNGNiGceQUc?=
 =?iso-8859-1?Q?KIzCUJNUwtafjigVj/lEEgpB34SsVV88M1mhBpkl1pKzATTUpmc9hrVzbd?=
 =?iso-8859-1?Q?uTVp+c1y8NT3d6Zx+6pB0PCfnhRYhOo5FR4tkxrCeZk1E85lBGZcgVgjVd?=
 =?iso-8859-1?Q?23gKJvWawHz7duvE3BB/pr4fNO9kbmDG/qHaQyXpaRFgZhLjqttL5Kuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b75758-2504-484c-bfc9-08db16988666
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:54:15.0652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8jwzfKlFAe767LrBDexRYdzzSUQTHdwYOW1qVZ6ZRStlEy8/dN3QrtoKpC/bJLdZpuKxBZQ9r5DQVS/wBsgGhsvdlMKIGpenpbfcPJegnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/11] drm/xe: Remove dependency on
 intel_lrc_reg.h
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

On Fri, Feb 24, 2023 at 10:20:10AM -0800, Matt Roper wrote:
>On Thu, Feb 16, 2023 at 04:52:21PM -0800, Lucas De Marchi wrote:
>> Create regs/xe_lrc_regs.h file with all the registers used by the xe
>> driver. Eventually the registers may be defined in a different way and
>> since xe doesn't supported below gen12, the number of registers touched
>> is much smaller, so create a new header.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_lrc_regs.h | 17 +++++++++++++++++
>>  drivers/gpu/drm/xe/xe_execlist.c      |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_submit.c    |  3 +--
>>  drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
>>  drivers/gpu/drm/xe/xe_ring_ops.c      |  2 +-
>>  5 files changed, 21 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_regs.h
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_regs.h b/drivers/gpu/drm/xe/regs/xe_lrc_regs.h
>> new file mode 100644
>> index 000000000000..e8a13fa6722b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_regs.h
>
>This file isn't so much about "register definitions" as it is about
>"register offsets in the context image."  Maybe we should name this a
>bit differently to make that clear?  E.g., xe_lrc_offsets.h or
>xe_lrc_layout.h or something.

yeah, I like xe_lrc_layout.h. I will change to use it.

>
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LRC_REGS_H_
>> +#define _XE_LRC_REGS_H_
>> +
>> +#define CTX_CONTEXT_CONTROL		(0x02 + 1)
>> +#define CTX_RING_HEAD			(0x04 + 1)
>> +#define CTX_RING_TAIL			(0x06 + 1)
>> +#define CTX_RING_START			(0x08 + 1)
>> +#define CTX_RING_CTL			(0x0a + 1)
>> +#define CTX_PDP0_UDW			(0x30 + 1)
>> +#define CTX_PDP0_LDW			(0x32 + 1)
>
>I'm wondering if it would be more clear/obvious if we laid this out as a
>C structure rather than using defines?
>
>        struct tgl_lrc_layout {
>                u8      _lri1;
>                u16     CONTEXT_CONTROL;
>                u16     RING_TAIL;
>                u16     RING_START;
>                ...
>        };
>
>and then later just use code like
>
>        offsetof(struct tgl_lrc_layout, RING_TAIL);
>
>to find the offsets when needed.  This could cover not just the
>simple/common subset of registers here, but also stuff like per-platform
>stuff like MI_MODE, BB_OFFSET, GPR0, etc. that we have lookup helpers
>for in i915.
>
>Anyway, that's something we can think about in the future; no need to
>handle it as part of this series.

yeah... sounds good. I will keep it as is for now since this series is a
prerequisite fro the WAs I'm working on. But changing to a struct layout
IMO would be a very good improvement.  Let me also add an issue in
gitlab with that so we don't forget.

thanks
Lucas De Marchi
