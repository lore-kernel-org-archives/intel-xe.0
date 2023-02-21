Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139F2C64EC4
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 21:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC6010E0C0;
	Tue, 21 Feb 2023 21:50:36 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188110E0C0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677016235; x=1708552235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tqpbjuaHB/o+boTGiYoyxpJOF1X612b86seJELfvtW8=;
 b=ao+6X1t3VUaO8wBLVGEy4LPCWQyg74YcK+EveFCHsVKU7wnKRce1FDoE
 SQntLit1FiPstiHTEU/kQ7Nral2lgAj7IhXRxxroP1tF4M+/sFZVtEcqT
 +sK3luhtuH66xN+hwDTHxs+QZyOirWXBpkIe3s8KQC/gxPaQJ+eNPiq9i
 Kfe8l3vzGpj0VGa26mrZ79cPSjbx1For+h5CvbhCLp3GmT7pjTQ8iE9Yu
 AHVLD52ciMqIdXvodV5lVkVOAEzAP6QfdTcgsBHy33WYC4YGxRAWeGrA4
 0phioGSENTFlLCOB8xpSD+LakzTyB7Ap7ab2sFT6k+t6DGm/vqcoARLZi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312391011"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="312391011"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 13:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814665899"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="814665899"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 13:50:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 13:50:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 13:50:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 13:50:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDSD2EsgclxUUz7yH1ReJAZUd1H/8TzDGjeLYeRBuD0Tc3uEEqBUaIEfzyDLZxIJcP4R+L7g/r3MRGM/ERNmbUbz0wuWAGpXJaShUx9Xai2eRy69mty6F0R4I+8VaOlLUV51kwZ3loQwI/f74dgtvYlZrdPK3LncHscfIvRKVZfajJVLp/JdbhVbMvMfJhAdUusilq+FonpmPbTiiHkA4wLTZAzaZd0FptWoGCj8hzDXyPY4Szxr5XMgI7/ndxvOWSjMgBfpYsPcAC95F6MnF5E4FRHpDr8ejAP1ZRZlMvygieKwkRrePZA/44s8enz5ZFa5Ui3PmgH8H3HTWISbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5II++76nE0teU1aXS5NEe65FtJYjkrabgNzrBKqRMJc=;
 b=nKYBdlsQfLAaE5lbjozC8Okqhg2Tzt1cyg6NozvwmmSHy/9sImduac6mKbN/A/Wyqs1u3mmDzBQgXQCxKTCWjOnq7m8tb8HGZ58ij5yE1QpUVylx1C9wxQYJfCACEDb4SFO5UHDxOE5TBTx9cMDHR+iBEVnqtKs1kMaW0yDjd+l8X3kEwRecq6rTnNg1WXzHD7m4ERDfJ5bosBRb4Hdve7qyh9p930xKN2NstjNbSOiHAPT/wvdtQDjMrA/8yCwsINo8dMS3oOFiL1uVIwIgfdHlP9wG3N9Kx3/CgtRrumCZyIDquCN3F9SHVKzPmqdMcNx/aqBnAlDiDKK5WlFSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 21:50:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 21:50:29 +0000
Date: Tue, 21 Feb 2023 13:50:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230221215026.ylqf23joyo7mpzdb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-12-lucas.demarchi@intel.com>
 <Y+/jaCK7TSG+qHa+@intel.com>
 <20230217223007.n5cwcflrscv6giid@ldmartin-desk2.lan>
 <Y/U6sPRqGl4Qo8sf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y/U6sPRqGl4Qo8sf@intel.com>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e90dd29-68a2-45b3-3b0e-08db1455a5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G535fqeZzr14Np5yY+k5bGXm6rxQacvPEULEmBRRbArmD0c9Wmb7PQ8lWWFJ1AK8SUf8lXApZmUE7z7cdBKdpRD3thQh+Eph8stxShQgpaRn9yrYZrKvNHD4G+CnCOEXSv2AFFJm6en93s8cM4brUXPAtgW2lWMgUCb/FXuS0eZ0V0THqcAzOwPS7VbobNXYLDIj6qd3kt+v9OI8MdMVJ9PoMQZD70Lb2lji3bP3ukIlJYfTgiizLZcvtM1UBbTSidKBA/D7s8kqkx7jwZzbB+RtHk5QYmfcu+UG9lEEoyc/KyXUnC9O9ITLM9vnN5lCP5U2Yw/y7vvRNY1oQdhgOt8/7Peb0IlDh30fP2YbQZj0LBfbW9SSR+QOZP7o/OkO3ji0qYOLNCOv1tuO2EIhZS4b1BxLssAAFKLNU7g+jNYV2a7qiixKtD6VyFIuC7MQGwWmPNtZY4JLIPGs0QUoX1Ek1Qgvx+UH4Qxq8/dOJpK7vqiFuLR/a2ZeURcEoj370xZgcc9Yu2ZNrZDTSRqSLs4BIrSfHVKgti+oAZXXHV8Q+M0SOYrmonPWG3UDNsAXS3eeTzv23vCNbDm7/ves50R22X5T59Dxkhb+o6zMcAPV53JHhmDWPiVQGFayqcII36nRSBhHycJ9qVL61WNRTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199018)(8936002)(5660300002)(6862004)(66476007)(86362001)(66556008)(4326008)(8676002)(83380400001)(36756003)(54906003)(66946007)(6636002)(478600001)(6486002)(316002)(186003)(9686003)(26005)(6512007)(38100700002)(2906002)(82960400001)(1076003)(6506007)(41300700001)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pVFF8gvpxSaNfGyke+eBtC9nBf32XsHYs7FTCvw7A5+kaoA61FZBTG0Z08Yf?=
 =?us-ascii?Q?/t87OPDoEpam3p5CH8dBNOODo655UdXpTcOJfOtgixZ1acsLoCfgJQv1ab73?=
 =?us-ascii?Q?MM64UJux6yrkRGOnattAD67t4Ar3+DGiEQnycwgWvnAuFKjs+3TYolc4VidH?=
 =?us-ascii?Q?+CYV/QSiBe3JKuXila7ZjVDaUQCeYDbzEjB/GI+uR32SXrk9EwNRSpZL/EH8?=
 =?us-ascii?Q?OhO1p3C7RHOUszJ34fezRMMuCrSYckQvVXHqm/HEnkoHOir/LP0K55X/NBKb?=
 =?us-ascii?Q?1e7NBoZOUVrMou0BpHMk2isbhJK7yzXcNGJt54UoJBZ9IQXVEHUiwtHV2KSl?=
 =?us-ascii?Q?HP/7rhz09j5w7rICMU2xv6S8LM1Loz/l+pC1YZHcMApiD+6lEwx7vsC99g0V?=
 =?us-ascii?Q?spXxCsliUZhIrO0BflfWWUmGiSh046cpB5jnYdXwOKlFlrlhovx98VklUpX7?=
 =?us-ascii?Q?eG0Yjc2ayKxEV0RKw1R6K53bW3OTyV5qQDtNztVEC4K0UXvDrbZtiBNNaUEX?=
 =?us-ascii?Q?51iz1z6MOn5RrBqOsOTIKWUuJTtSi80y0Jul2sqYCE8o3Fod2tbKLQwp2w5N?=
 =?us-ascii?Q?buAyT5V5F4TqHY4T+QD+sbMSPDfxxCta3HreVsnAF/JHXKua1ETrHukHCm2L?=
 =?us-ascii?Q?t7xkccipQ+7zbAidD6zpo9qIOBqzegFpmdrle2v0DvRz6w+reaUn2ZRGR9Vi?=
 =?us-ascii?Q?pXy8zbiPgtk8X8rweaQvN4kYVZopHYFdj35SOMWGCsg26bqKP9R9tRiNSkdy?=
 =?us-ascii?Q?kK15XiVxOQqewC4Q1Rkgh/3bHHoMymdJykNNWiq0ERiE9tt/fWuCSkWTz/3p?=
 =?us-ascii?Q?4S1O0oR1fO6QkZeUXo+J3JOpgwNFXkOdjZSQZCu4jUTas9LBPgi/fM0bDR8N?=
 =?us-ascii?Q?0qNWA8eInLa1dPnKOKe/yUrkNuxcdYViFyDHViAuhlF288mVlOClAh2fmR1g?=
 =?us-ascii?Q?bozkScSA1zOiktJJu2IDG/Gp1V+zl07NjbFvZVMjxV6re8+Y8SqWwSTAj0ac?=
 =?us-ascii?Q?bIXI2h5HdyL/2Bk2++d4heIDyecQCKQn/BFcpm3yoHBMhYgh5AFNjmTSwVPu?=
 =?us-ascii?Q?GWJBbDJ/Ocf0CGLORqxR5JvD+IZQppGnUjqdKk0pQoN3zs0VKDOdTDkn2599?=
 =?us-ascii?Q?GoAnuYSVSR+9lT/p5dGtLuL9ly8fg19cXz1Thk5Fv01CPr/Z9lU0zyV4iTBv?=
 =?us-ascii?Q?/YqAkFxshREv5+gFg5e7zRiajFlPjGuTCxeEqbe/MH+hTiSZYRc8Yfcy/h5p?=
 =?us-ascii?Q?tpGd6FHZYpwOc1uZdrRaJHu4wxbjhWOnV5IvIZNQKxVe2lpJqDHN1WiKZr7D?=
 =?us-ascii?Q?Gr0vTOdUa5SyPFDULlzfiDG79is+YqXAB0x8QxAtZC9fbNPy5ryIY1NmeQt2?=
 =?us-ascii?Q?KupVFqR2N1lA+47f33a8+hei1LkIgev+YK7jgjqYITpZcSaXi2JcNDFDCMLf?=
 =?us-ascii?Q?Q+DQC9994YV61N8Vc522VvzSD5ro8uGveeyxQt50npXBJzGxxWQSyxfjNRpw?=
 =?us-ascii?Q?NeUvz9OiYx3fe2haonHC5cX6SulXFJo/SR4KYZA8Jy7hjfJjdhixYuA6IkoO?=
 =?us-ascii?Q?HuDhacj0KL0Qtoqn+UT06XcEkUtOm1dpexCe8qBm77bsUT6jN5YhHZiTdkWD?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e90dd29-68a2-45b3-3b0e-08db1455a5d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:50:29.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlHxx3lhqACdTdUVGMWgSvQXm//BQetjhuT7whv7Xw+0ZC91WkOCLsUB/L8QbT6sbI4RBqxxgWMNrt8T/uledJ6ep+YO2gPrsFCR3s0xsRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/11] drm/xe: Use relative includes for
 i915_reg_defs.h
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

On Tue, Feb 21, 2023 at 04:42:08PM -0500, Rodrigo Vivi wrote:
>On Fri, Feb 17, 2023 at 02:30:07PM -0800, Lucas De Marchi wrote:
>> On Fri, Feb 17, 2023 at 03:28:24PM -0500, Rodrigo Vivi wrote:
>> > On Thu, Feb 16, 2023 at 04:52:26PM -0800, Lucas De Marchi wrote:
>> > > With the goal of eliminating i915 includes from xe outside of the
>> > > display area, it's better to use relative includes for the only shared
>> > > header, i915_reg_defs.h.  With this the build system can be changed to
>> > > stop adding i915 as an include dir.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/display/Makefile      | 120 +++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   2 +-
>> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   2 +-
>> > >  drivers/gpu/drm/xe/regs/xe_regs.h        |   2 +-
>> > >  drivers/gpu/drm/xe/xe_gt_mcr.h           |   2 +-
>> > >  drivers/gpu/drm/xe/xe_guc.c              |   2 -
>> > >  drivers/gpu/drm/xe/xe_guc_reg.h          |   2 +-
>> > >  drivers/gpu/drm/xe/xe_reg_sr_types.h     |   2 -
>> > >  drivers/gpu/drm/xe/xe_rtp.h              |   2 -
>> > >  drivers/gpu/drm/xe/xe_rtp_types.h        |   2 -
>> > >  10 files changed, 125 insertions(+), 13 deletions(-)
>> > >  create mode 100644 drivers/gpu/drm/xe/display/Makefile
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/display/Makefile b/drivers/gpu/drm/xe/display/Makefile
>> > > new file mode 100644
>> > > index 000000000000..eee576972427
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/xe/display/Makefile
>> >
>> > shouldn't this patch also be modifying the drm/xe/Makefile?
>>
>> sorry, while trying to resolve the display situation I squashed this by
>> mistake here. Next version I'm giving up on the idea in this patch
>> and I will just create a regs/xe_reg_defs.h. That will be the only file
>> with the relative include.
>
>But does this solve your main concern of the i915 directories getting
>included when display build is enabled even for folders that are not
>related to display?

no. Without a refactor on the display integration I couldn't find a
easy way - even if we find a way in the build system to pass the cflags
differently, it will break as the rest of the driver need the display
includes.

I think we'd have to introduce an xe_display and then make xe_display be
the "alias" for drm_i915_private instead of xe_device.  However doing
this may mean I'm doing some work that conflicts with what other people
in CC are doing.  I can try that later if it doesn't really conflict.

So... I decided to keep this cleanup only up to "everything but
display". To make sure this patch series is complete for that goal I
added a hack patch on top removing display. See v3 of this patch series

Lucas De Marchi

>
>>
>> Lucas De Marchi
