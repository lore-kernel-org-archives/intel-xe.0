Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EAAC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 20:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B700B10E51A;
	Wed, 10 May 2023 20:34:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729510E51A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683750839; x=1715286839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=55CQOsNCmo6TafnQl0ajGsAKPHvBDHo2jHUfRtuLpbg=;
 b=l1AckZ1uR9Q4DGs8snZyQTbe+8e94blYBKCkVa+5ImdNiB6AaqNdFsnM
 0l/tvV94ianlVehfnlGZoDs8RZAwB4la9mQwjN1t/NrUVYxC91SCn822h
 vESS9jYtceyGlf5qWZHRGfwoQ5M9ZmKpbgePY37MVzn4ELb/jIcrj6qNU
 vvUdhMC0NqPL7WJu7b/BG5+1vTjBUh4ftq4yHy1VmZmBq7iIR9O/+j5ax
 j6CSJg7AWJ6vf5bvBhnmq43rArOAW9z/oB3Gc8TgtCyZPM9w1n5nJB3Iv
 BO57XQMI4e9YF7UNjAtd8p+HNJwt0ZgCIezhNZb8tJv+SYwqVQcZp0ydZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330677316"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="330677316"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 13:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732283272"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="732283272"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2023 13:33:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:33:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:33:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 13:33:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 13:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBNModFgk5xHxQugilOCw5QOztYz4PeuKVx72OAX6bD5xnDm4x7kEpvl+ziWgw4iprcq6QmpgG8abqphfd8MW1xW8f97BGCxFd6q/42YiY6YQrYRSCBIpHF2GvtmVJGca7eYaXX7ZhbMn6HwRZA9Mf0wi+RSl2uZp2nLUCsZunzihNeO9Rt30YFQvpXkWC9W/CVMtcFVfG17nddR7h7j3WFjTa6tQB8HZUFjycIy/jC5e+ycgN26vqveLHa0lOme5vqPmcvvMqXPo4Td21v9myThTKpuhjWfibiXPLIHHY/blyXjpkQgGM25nt9LbuAgCMYRsYhYMtwsd1NLzMElZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VehSi+ppdaqrR/rwttaFKnZnHeLPAKLpjhNTvlVqmvA=;
 b=CmkuRzGfaTodupFAJD4qJsSJJL1kLEpG8fIq1IPTWda54R+3wLnIN3akGh6++LZwkyqX0MMtA/Q9/xL2en9ENP700vtDzqm/YcEFfAJ6J87Or4/qJMt5qkX1/Fr9m7982xCOn1a2ytTWgst3hnq1AJ4S+w4AvwNcUtY2fXh3X/zKjtu7UVWw8h37+1ojqqd0z1pcTbyezeXS/7k8EUE5zeXjIpdatilHB+3f8JQOWViOnheQfG/l7iTffPmRf4VHr8JH8y+kaca+nXnqlDefUfAsI/IyLzUuoYlYi1Aw0uOSggANJFSlByDgfzxBrWuKekbASvx29uGtZ8jbAVFhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 20:33:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 20:33:48 +0000
Date: Wed, 10 May 2023 13:33:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ur7eayak4dm6l46yfxwsmxfsrq5stmykjz7h3uoj53ght65fq3@lj7j73ewwn6s>
X-Patchwork-Hint: comment
References: <20230419213703.3993439-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419213703.3993439-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4b1c87-6061-4145-882e-08db5195db99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAzn9eK3PBRlPIZKFoOGr+1TEkwKhEpUqGhrKrwpvZ9MBSvtxh29q5LcUrtNzqWc/r7ub1E97fXwp3R0ujDEQUaccvDI/txK9yHoUSkbL+Zzfsixd1CqLIg3yI86D6KlRnK7hxMIga7Vs3zUljNInka7gXjPDus2k9gxO+k89t5rN2VJLM8ns2xcqdCsMVunfJ9l8SkqGaUUzONtov8rTPZcXhnlpgztu6036+oyIf+cVts0uLD+FvZLYNbxUEDcC7B0lpFeximu2MxE9EkuJBa0cVnx6BxHG+D3M2z+xx3k2vu84IuNMLKxsSFqbtPPl/NLg+I3qmYcVkaAZuAA2Hv8Ocy4F57VWJ0dKXdifKLVr0jwt5wUAF+xmpXEd760d1aye706EAq5Ewbi0vbWD9elMBAkpgwdQKOPUE/8fb4PqBx79s5ki8J4vmjE3uIheQiMjCXuxQRPILTQ6Q1z6D6uho4i9DwHtcr0V4pZLpHYAuYpeiRGlOM1dcB8Zz4/ri1DSebAXazZjCELu+mWpBV0RgfuwhKyw65vNlSFdLdKvCye7Bv3iX4d8rRKWzpu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(6666004)(2906002)(186003)(478600001)(6486002)(6512007)(6506007)(26005)(9686003)(41300700001)(82960400001)(316002)(38100700002)(33716001)(6636002)(4326008)(66476007)(66556008)(66946007)(6862004)(86362001)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOsXFDg+RvNQqIWP3+A2fAptzA50mfNBXEzxSmltjCsCXS1vK6PqqjcBhZ6T?=
 =?us-ascii?Q?vm9bCWo77brqz6qcZRsfwWosXpV+VVD9GcrYr02hbdmghhoPVSELucljV/TW?=
 =?us-ascii?Q?FyTD0B0qpDzEAV9exq6c6A7zQaC+N/ozbyBSDJLjkhKOwCuA9C/PDHNGmhfF?=
 =?us-ascii?Q?LYI2kXPRXGlrxVP2U/jxlrNUwA3LWyaeASCUNVv2OVQvyG37//fwKamLcgSz?=
 =?us-ascii?Q?1VzluRvZNBiYn1oupFTN4hkMhCCxgAUmkzuZGaz2NUDsNHKfJBxlvMkBJnOW?=
 =?us-ascii?Q?K/XzlYZxUo/B3mhfH+4X71efFBG0TD+1KaDRCsw5R8UeRtGfd6fwzHrjZdFf?=
 =?us-ascii?Q?uMw8ImMKSl9+ySTLtZBKOE4U1ABvhpNt+BVasylkxf+2IStHSFY3iJRO6iE/?=
 =?us-ascii?Q?3mrYjS3KtaA6yfE7gSJWz+pPJu0E9MKVOU5r+/H+A1uFEyN2pV91aQ720a8H?=
 =?us-ascii?Q?/Vv7H7OHxPg8lmcJU4nKdu9xrmr2OT0D92VOLr/ExX6VjmrnlMntxlQ9K+wz?=
 =?us-ascii?Q?csutYNHh1R1K8Ja514iE8c0omYsKiTYtdpllVH1M6zi6MG5uF8gQZRtGbEtu?=
 =?us-ascii?Q?r+3oey7nDGoEpCXZVUGZKi8EZvpOrSxxiE7eJwvQ5pY1QotJ3L5DfdA348tf?=
 =?us-ascii?Q?UC1zjcIzDjLwXODcd7nvqG3OkFeSKsyj4skvguBiA+Ju5lkTp2chATAzCtWz?=
 =?us-ascii?Q?WJqEjzyWheGm3wLC/jL09hWebIZW7ZYbYmhcGZSLXc5sDj8H1wkv9Kh9h4Oh?=
 =?us-ascii?Q?0uCcneC2b9MkUqpGji+s5PTkpYu8MnW0TAg9QNf24kIuLtbXKTfXR3axKFY0?=
 =?us-ascii?Q?XNIJ0Qmbzpbv13qNrHAuIHOyspwc0qrcDs5ZzJX2lW3DIC2xG6ZspA0bi+Fw?=
 =?us-ascii?Q?pOwS2/r8mLj5YrW5G/EFUTahlLwmytt4yv54ngTJ6x3P6DVf7MS4bpcUDVvk?=
 =?us-ascii?Q?bvNzzc+SraATXX+Ce340p+hnnRayuHspab5q8BMtxO/fsOXXyLyvF9M/JRRP?=
 =?us-ascii?Q?7GcFPhhOZjVjFPqsY3utDxSJWjiQaxcsCYwx6Wgordlf1y9rIf+x+er7GGCq?=
 =?us-ascii?Q?zx8NaoxZLAm3fsgU3+ez3kqWCKFlpxLrIgSU47kbxQeJkaU01Q9Ck/1ov+2p?=
 =?us-ascii?Q?H75IDt+vH2+vFTkwvAHmIQ3jzFtv+PbZ9Bk80+cuMHcayV8hmSCB61Qbm35/?=
 =?us-ascii?Q?qYoWAPhjkNhTDzLNmFonAZBmCJ4srJni2+nUY/vnz3gx1/S2KqaT08rR3Oa3?=
 =?us-ascii?Q?JQhT1IklFIb7idfce2SCFuzxgSQ+bi7lI+JSMyMQUm6ObZ2dwTWcPDztbfl3?=
 =?us-ascii?Q?kG5tE2c7iqfxVX0RPvvBSNRhTIqCosu8vq7yyD1KYTv2DBAyrk+t7hIvN6wf?=
 =?us-ascii?Q?D4vfWmNdzNZ+x9dVLJDy8xY/mgiRKlZ2J5xKZMTkYto/Bj70H9+4U25nz9PX?=
 =?us-ascii?Q?7I9cKWWUF98s9oEHZtIo79v6U//tvZcTOQ1kjxe6nuz+z77euNDm04eWhFIW?=
 =?us-ascii?Q?qvBlng6XFEgkrFFOX70Cmxa1EtSEwoMWHrDlQwPVa5NZafmsvW9bP3olt7NY?=
 =?us-ascii?Q?bgW/04on//GPK9Gz1t+a4asS4ls8vFG4NmPvf0FLj1sOxH1a4hqwXqAnBGtF?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4b1c87-6061-4145-882e-08db5195db99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 20:33:48.1440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUkbLCyQbdk/CrDfcJTOKu4aeWSaeYgmt1LXhwOo+IPB8+NUxqeBJVeqSONW8PyJzzcNeeFCuhGyTUyIwxFk7VD7K+sTeUQgie+cQnrfcSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/adlp: Add revid => step mapping
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

On Wed, Apr 19, 2023 at 02:37:02PM -0700, Matt Roper wrote:
>Setup the mapping from PCI revid to IP stepping for ADL-P (and its RPL-P
>subplatform) in case this information becomes important for implementing
>workarounds.
>
>Bspec: 55376
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_step.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
>index ee927dfd3eb3..bcdb4601c2f6 100644
>--- a/drivers/gpu/drm/xe/xe_step.c
>+++ b/drivers/gpu/drm/xe/xe_step.c
>@@ -60,6 +60,17 @@ static const struct xe_step_info adls_revids[] = {
> 	[0xC] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_C0 },
> };
>
>+static const struct xe_step_info adlp_revids[] = {
>+	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
>+	[0x4] = { COMMON_GT_MEDIA_STEP(B0), .display = STEP_B0 },
>+	[0x8] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_C0 },
>+	[0xC] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_D0 },
>+};
>+
>+static const struct xe_step_info adlp_rpl_revids[] = {
>+	[0x4] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_E0 },
>+};
>+
> static const struct xe_step_info dg2_g10_revid_step_tbl[] = {
> 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
> 	[0x1] = { COMMON_GT_MEDIA_STEP(A1), .display = STEP_A0 },
>@@ -118,6 +129,12 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
> 	} else if (xe->info.subplatform == XE_SUBPLATFORM_DG2_G12) {
> 		revids = dg2_g12_revid_step_tbl;
> 		size = ARRAY_SIZE(dg2_g12_revid_step_tbl);
>+	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
>+		revids = adlp_rpl_revids;
>+		size = ARRAY_SIZE(adlp_rpl_revids);
>+	} else if (xe->info.platform == XE_ALDERLAKE_P) {
>+		revids = adlp_revids;
>+		size = ARRAY_SIZE(adlp_revids);
> 	} else if (xe->info.platform == XE_ALDERLAKE_S) {
> 		revids = adls_revids;
> 		size = ARRAY_SIZE(adls_revids);
>-- 
>2.40.0
>
