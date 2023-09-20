Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05E6CE79D0
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 13:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5869C10E4B1;
	Wed, 20 Sep 2023 13:34:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0110E4B1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695216880; x=1726752880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e7Z8frasybbkCzos1WZIzuLC6m7/fjuvRfoloaRuXSY=;
 b=L4YbX/z0HL9v3SDZD6GoA5LYL24WqnOp0wz7tt9U/60fel+6al209Gnd
 YbNWomOzMH8awWgdTQv1uwXhP+KSm40kHaMYWwdnWajy00r+A5QbtRm/8
 U5ZFDJONhRSo9qVibi/UonBkeXThA3NYC84mygymY/U167qztksqNP+8y
 pbCyQzEqaRpWm2Fy0iaqUG3JA3bcsleKkSsMGA0KzzKYT/WYkAzM7K/XJ
 6bLJe1UkN/Vj7dEWXa96m75l7dwfkklds18k8EYGGpv6JJjLHYq0mzQct
 +KuOQkgtoedqbrmTFsjizknWb272d4s3mQ1uKS/ftQxQr/IHSEUIoaXHb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360480399"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360480399"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 06:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816899536"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="816899536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 06:34:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 06:34:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 06:34:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 06:34:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 06:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R280LVcmHMBEhyQ9kgi9uyOL6KL78+v58KstWrsbsign6TMdNHqTnX/W8l4MsnT9cBGVNTaTvZsCac0dh3nJgjFr3wCbrwv38uh311RBWRP09yiYGc1aOoQfMkF2oYnYPbtBc0kdoEUs98PMY/kurrcV/zKE/hZP9EHBvPAUI/j4k/5fffVXk9L98dsN2C80eb8NoeKS50tAi65FGMe9S8sOwehgMFs8Fm7WdMumCv4Af1GZO5DgKdLjbbeeYgwH+KEKLAKUli4u9ZujSvNCnutQsC8zLG6qj6eO7lmEDrOwq8/vWWpmkovvpVqsBJwzrgk3h38Xk0IId5kyJMHqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TioXKgkOtoKvszABDaSNmtv+prZyQOodhi39Jsurybg=;
 b=mXG3+eH4YYpbKhVqa5fmvs7Zq6aloNuBt0vJuDNpa4qKVwt3aIMQVji9v6UNU/rP+Robz80Vv9lcePPJyBK9qrWna2RLUlv+lEaBP+RoLwbKcSDoHpHBB2nj/RQsrBM9ddE/fJSZb3BFurGoQwM31JBvUH4QcLUjmggD2u/sStSE+3pAAe1X/Bo+soKNTdUI+OcS+mRhvlMgELsK94kWvEiY+2i1O/fk7TflFG6Rj5n4GxHyfBbbZ3sYuJU9Ud9kwsiH2UAMW3cl12S5UNKEpf0po4AqMARVhxJbyVefH+CB1JRFEhL7r2xGHp/bpdzitvD9EjkPZcBFdKVm5JRuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 20 Sep
 2023 13:34:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 13:34:27 +0000
Date: Wed, 20 Sep 2023 08:34:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <j6v27ulal6arunhkdc2446a7br4apej4qg6aycckthhylcjidd@q5wlewsvkwbl>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
 <20230913231411.291933-13-matthew.d.roper@intel.com>
 <wnophaogmq2o3feqmle6yo74j5dmpqko6lfyvgjyjl62nis4be@2gi2jslmugcf>
 <20230919223121.GI233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919223121.GI233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad4859f-9b09-4443-d3df-08dbb9de4f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AaUxxMn7xncD9J62Ud3BgpLPWWCSrB6t2x2buhEd8PBRiToKa0xjMj4c1z4ME6An2fPoDka+XXSYNvrY/r1/oMAxeNd/n1GOhSZ7nXVPahekevV4yeE06daiWqEGFhjgkzEZzE335tBfWpXP36PY5juOmYSl4VYN0ZRXMeiTWmpAV632EkGoIaVyDAhPAn1vh3xFYdlzwhFDq1B0te4nOXYE47ce6pBtOQxJoGxW6XEyh3fEItpsGLS2VT/WQdbsae5QFl4GSFfW5l7nk8YsxecDeE1B2qXHEs86J/+PIk6NQbalQQNKcx9DWI37GXW7/YXRqCt/J5x0GLN7xcrns7b/fwtjk1fdw3ikYU4D8FZoI6KJBQ9fgwNDLsf9HSGWNhiKPKMdg2L87N/C05BWOOh4fuKkZajgo0hSP6zb14J/GoZVeqrJoJ/8h6CxOiYi1HvuopJZfg4H/L/qOOT9ix8f8MPFqvsLy7EDqhjux79fKyZtvDW8upP/J8OJKsVANfTb6uWMwu8Ls3gku2HDHaIYgwQJ1HTYfEFfJ33L8+0MAN2jwCeC4YT1ZpfSvj+L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(186009)(1800799009)(451199024)(6636002)(6506007)(6486002)(6666004)(83380400001)(82960400001)(9686003)(38100700002)(26005)(86362001)(6512007)(5660300002)(2906002)(41300700001)(478600001)(33716001)(66946007)(4326008)(8936002)(8676002)(6862004)(66556008)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hsJDF3VMYXIA6kQe/BMCjbT5mkNS8eSvBgLBAXMUP9HPtwOEUU+0oJbUPUpB?=
 =?us-ascii?Q?73S7hG1ZBdY80gTOxQ1QrRQ0vvUrzApRk7r9dFadbe3MxlHgrclJ4pLsaj3/?=
 =?us-ascii?Q?Nj6z2c8v5QQ2L45lp3hzQVDNzIn2kLjmUXwUzDRh8vAjOXU+d4eNRnr7/1zC?=
 =?us-ascii?Q?kNI9ihPzs/Vjo/58KlUxJhtXbe96mve6kx619pPXXQICCn8lKYbdJuUxnaKf?=
 =?us-ascii?Q?E8T/mEu2RAavG3OVzKfKKPmTeuflZvWnWyCI4O3TAT8q17fEFO4/0JGtLGzv?=
 =?us-ascii?Q?B1XcuKtVEAs/q8XidGp6Ml9Gb1d/+Lt1Ipk1fce4TOhdRU2Q8KdiUwF454w/?=
 =?us-ascii?Q?4c6P/zRpP7+4Yp+VG6Li46jwaglK+vAbA9GmMH7dvoDRtIDgEkWN06M16KvN?=
 =?us-ascii?Q?XLZTkA9EYFRJKhGchqI86DukhJE6JY1C0QawXefxl83dU7jgMMP/ACT5WfCa?=
 =?us-ascii?Q?+2x3D8SN8d06SCJQkaJPx6mWyzw2hHlRUUlHc/hpjf9kxVmewSCu1fJjNYNY?=
 =?us-ascii?Q?CBHH/5FSVftmO/ANxZNSmD3v8t+iXGEq5hTrxlVRwM5+hSg8kGJY9M7TMc2d?=
 =?us-ascii?Q?Z/IIU0Rv7kIGosRXwSzlKCBF4mvRqvfIHnmcSL50q9wt3GkOtIk0mTdFBb7u?=
 =?us-ascii?Q?WB6pGejeRDI/IF2fC3XckxmgUftIAlCQyh+lRG9Rz0A4g26EBD5l9Pf6mxJF?=
 =?us-ascii?Q?+O7lHhtjK2W28UBomHZJSN3pYb4you4RdYRKQQ2l/gb8i1KhBMwArGbTojzz?=
 =?us-ascii?Q?24mmx+bJlRhilU/qSbJZuK+/Es0iZENz3aQr77oIUa6tsjN1FID9eoudnoGR?=
 =?us-ascii?Q?ROzzCSahz7W31UF58lCSsUe5TtT8LlJwHvzXQbpA4ct8YzXiZHy26Nq0yWVE?=
 =?us-ascii?Q?mwGLhOU6yO9pYV43lnlX1GDrVN3oiElh+VDRNOmaDP6iOUZCttKaRERxYDq6?=
 =?us-ascii?Q?TvY/ajl+iZ1eIcH/ewpCVI9sVoctjuwi6YzGILKhTBFMQzZWOG+V3+qUZDJu?=
 =?us-ascii?Q?njnXE29CvhTTHRKfO+U3kYJSDoSviW0P2jK6VSNsUFY+vIYT614K07YyolvF?=
 =?us-ascii?Q?rIYLytFrMisV9KZ9PdeKHMjhENLEzeL+kOmeoQY99ZVbRjvYOot/7vWU8HlH?=
 =?us-ascii?Q?2YxqRmc2p1YfRyEFiTGHX94a4KIZBJhScirBOaZEYoftJJKjo/Z6jFbmq/Hq?=
 =?us-ascii?Q?SVU4tnHr6a8su5GVC8/ZEu/dOIwwO+CuTfegpaVPJ8qwfoqgsbzDw0i1ThNT?=
 =?us-ascii?Q?DgDm9IDOP6x+zm0U6mP1+dlFObaFNtyA3TFyQTjNlHJRPW7Fd0cE7hnC0lpa?=
 =?us-ascii?Q?NKegucsMdd8A+DEJUz3s1DEfFU84IxW8JVOEQ+rChRxjw9A2V/o+slOcE8Da?=
 =?us-ascii?Q?GDrgUIEEFNFo7KQBZMqhSVSk9rxLw7CbQfb/Qj6DKUBfON3TR6I9yPtzY5d5?=
 =?us-ascii?Q?PH7+gHXUEGgRv2IWNdNbaWfF7t6gXQ9fIGv/xtAJcGV/Uno34hnbjdoCiPdk?=
 =?us-ascii?Q?edEDHwK5V52/FzABkxAdVO9qiV5cyj7we1q/GUfcQ3+eTgAAI/E0n3LuS8ro?=
 =?us-ascii?Q?KrxKjytHGdkX3fjedZmpKbaJPHZFK58DvlF8sjWLq2esziirEFikkKXV8oLW?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad4859f-9b09-4443-d3df-08dbb9de4f92
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 13:34:27.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4yidCzXAGnZ1vM4eA59P9OaIBo4jpOTZwN0Gm/Qw5VQoZkTpJBRy5HXjUtIcK0JnMgc4e+wfQIhfNLOOl9KJori7KyY11+3H/CuJuqnWZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/wa: Apply tile workarounds at
 probe/resume
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

On Tue, Sep 19, 2023 at 03:31:21PM -0700, Matt Roper wrote:
>On Mon, Sep 18, 2023 at 12:11:10PM -0500, Lucas De Marchi wrote:
>> On Wed, Sep 13, 2023 at 04:14:17PM -0700, Matt Roper wrote:
>> > Although the vast majority of workarounds the driver needs to implement
>> > are either GT-based or display-based, there are occasionally workarounds
>> > that reside outside those parts of the hardware (i.e., in they target
>> > registers in the sgunit/soc); we can consider these to be "tile"
>> > workarounds since there will be instance of these registers per tile.
>> > The registers in question should only lose their values during a
>> > function-level reset, so they only need to be applied during probe and
>> > resume; the registers will not be affected by GT/engine resets.
>> >
>> > Tile workarounds are rare (there's only one, 22010954014, that's
>> > relevant to Xe at the moment) so it's probably not worth updating the
>> > xe_rtp design to handle tile-level workarounds yet, although we may want
>> > to consider that in the future if/when more of these show up on future
>> > platforms.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> The missing part to make it official as "tile workarounds" is
>> very small. Maybe worth just adding them here and avoid the todo?
>> That would be:  have a tile->reg_sr, xe_wa_process_tile() and where
>> you are calling xe_wa_apply_tile_workarounds(), just call
>> xe_reg_sr_apply_mmio() with the primary gt.
>>
>> But up to you if you want to keep it simpler for now.
>>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
>> > drivers/gpu/drm/xe/xe_pm.c         |  5 +++++
>> > drivers/gpu/drm/xe/xe_tile.c       |  3 +++
>> > drivers/gpu/drm/xe/xe_wa.c         | 20 ++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_wa.h         |  2 ++
>> > drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>> > 6 files changed, 34 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > index 39d7b0740bf0..8a93ab169e04 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > @@ -56,6 +56,9 @@
>> > #define GU_CNTL					XE_REG(0x101010)
>> > #define   LMEM_INIT				REG_BIT(7)
>> >
>> > +#define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>> > +#define   SGSI_SIDECLK_DIS			REG_BIT(17)
>> > +
>> > #define GGC					XE_REG(0x108040)
>> > #define   GMS_MASK				REG_GENMASK(15, 8)
>> > #define   GGMS_MASK				REG_GENMASK(7, 6)
>> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> > index 0f06d8304e17..ad3c08c4ff22 100644
>> > --- a/drivers/gpu/drm/xe/xe_pm.c
>> > +++ b/drivers/gpu/drm/xe/xe_pm.c
>> > @@ -20,6 +20,7 @@
>> > #include "xe_guc.h"
>> > #include "xe_irq.h"
>> > #include "xe_pcode.h"
>> > +#include "xe_wa.h"
>> >
>> > /**
>> >  * DOC: Xe Power Management
>> > @@ -86,10 +87,14 @@ int xe_pm_suspend(struct xe_device *xe)
>> >  */
>> > int xe_pm_resume(struct xe_device *xe)
>> > {
>> > +	struct xe_tile *tile;
>> > 	struct xe_gt *gt;
>> > 	u8 id;
>> > 	int err;
>> >
>> > +	for_each_tile(tile, xe, id)
>> > +		xe_wa_apply_tile_workarounds(tile);
>> > +
>> > 	for_each_gt(gt, xe, id) {
>> > 		err = xe_pcode_init(gt);
>> > 		if (err)
>> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> > index e0bc2b60ab09..131752a57f65 100644
>> > --- a/drivers/gpu/drm/xe/xe_tile.c
>> > +++ b/drivers/gpu/drm/xe/xe_tile.c
>> > @@ -12,6 +12,7 @@
>> > #include "xe_tile.h"
>> > #include "xe_tile_sysfs.h"
>> > #include "xe_ttm_vram_mgr.h"
>> > +#include "xe_wa.h"
>> >
>> > /**
>> >  * DOC: Multi-tile Design
>> > @@ -143,6 +144,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>> > 	if (IS_ERR(tile->mem.kernel_bb_pool))
>> > 		err = PTR_ERR(tile->mem.kernel_bb_pool);
>> >
>> > +	xe_wa_apply_tile_workarounds(tile);
>>
>> do we need to apply them here considering we will still go through
>> xe_pm_resume()?
>
>We do?  I might be missing something, but I don't see where
>xe_pm_resume() would get called on the probe path?

before we do anything with the gpu it will go through xe_pm_resume().
However indeed we may have WAs that affect the initialization phase,
before we even reach that.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> > +
>> > 	xe_tile_sysfs_init(tile);
>> >
>> > err_mem_access:
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> > index f45e9452ba0e..d84e67a9af07 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.c
>> > +++ b/drivers/gpu/drm/xe/xe_wa.c
>> > @@ -753,3 +753,23 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>> > 		if (oob_was[idx].name)
>> > 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>> > }
>> > +
>> > +/*
>> > + * Apply tile (non-GT, non-display) workarounds.  Think very carefully before
>> > + * adding anything to this function; most workarounds should be implemented
>> > + * elsewhere.  The programming here is primarily for sgunit/soc workarounds,
>> > + * which are relatively rare.  Since the registers these workarounds target are
>> > + * outside the GT, they should only need to be applied once at device
>> > + * probe/resume; they will not lose their values on any kind of GT or engine
>> > + * reset.
>> > + *
>> > + * TODO:  We may want to move this over to xe_rtp in the future once we have
>> > + * enough workarounds to justify the work.
>> > + */
>> > +void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>> > +{
>> > +	struct xe_gt *mmio = tile->primary_gt;
>> > +
>> > +	if (XE_WA(mmio, 22010954014))
>> > +		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> > index cfe685989524..1b24d66f9d80 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.h
>> > +++ b/drivers/gpu/drm/xe/xe_wa.h
>> > @@ -9,12 +9,14 @@
>> > struct drm_printer;
>> > struct xe_gt;
>> > struct xe_hw_engine;
>> > +struct xe_tile;
>> >
>> > int xe_wa_init(struct xe_gt *gt);
>> > void xe_wa_process_oob(struct xe_gt *gt);
>> > void xe_wa_process_gt(struct xe_gt *gt);
>> > void xe_wa_process_engine(struct xe_hw_engine *hwe);
>> > void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>> > +void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
>> >
>> > void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>> > void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > index 599e67169dae..f3ff774dc4aa 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > @@ -18,3 +18,4 @@
>> > 14016763929	SUBPLATFORM(DG2, G10)
>> > 		SUBPLATFORM(DG2, G12)
>> > 16017236439	PLATFORM(PVC)
>> > +22010954014	PLATFORM(DG2)
>> > --
>> > 2.41.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
