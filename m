Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C375C636D6
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 23:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D863E10E416;
	Wed, 22 Feb 2023 23:39:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91AF10E416
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 23:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677109179; x=1708645179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FmOGI95rz9TOvKl5amoNw0bfE2bdQDgDTq4+t5DRDb4=;
 b=eqvhms5DcXE7PZLbpGKIvbU6wJ/67J1G6YdrDskNBUQvpGqvOdJ33yTX
 1DmMZl81hfau3eeUAWGiPwoho/jngU6jjPU4DxbI2KtICsFgYI+VZriKr
 n5qE/ygEPWij1VRLGwdAIfviLUq6ip0og5xPN/6jQXPcCzKrNDMRTkfhN
 imsfd03/idweZ2HM0xj19FvW1nE8LaNfz3ndRoJUDRrPjTl1+b62uB6fR
 TYXVbAqeT7uPt5n9c0EbxYs70/urBXzlYmKG38m8QrgsXGVN7l5WwEhww
 Ong06DjJkXf2HnGNldUbs3xV0ZEtBsQixWbeCrEhFKRzGleGhUBtr/pcc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="333068199"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="333068199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 15:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674291149"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="674291149"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 15:39:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:39:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:39:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 15:39:37 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 15:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd3LttRTv1Rnb2aNtQsxiPdorDUYiBrsQfnEwVhjhjq5dAuuVOop9LyJzk1s1zKyrtSipRgDh1lZOXkQUbcOS3AJFY6dUWSSis59dD+pJ0HdgPq9hXiiw1D42+DZlRSYgCjyjbuf5g/l5lQ0lkYfImAbTy/4T4i2wLeh7v7OSQbEO6EUuYFcqz+adzxI6CgXhADiKuKUU3/98EYEWHKJwGgZYM6RUGELy11++TxEtz3ljuhEwvZyXyxYmOLfk3PC0I2uqTW0TaaaNGu5Hp6VFFMaoSsU7dOF9H65Wq8sVtNqUazICE0KFCnmeoikhQZxge1YK5E9iXCi0w5lCZGL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlm0POP7x+R8qIlKql5SDoAVD1aCa9neLc3V8CANdXM=;
 b=afrFzNV/TAYEwusBCeUOc757D8vr3YMLKo3OyIel8ZMh4ZdAxW/eJGkySCoXzJ/hjxKJmCl37Uqo5nGBatK+gex+sQbi1pkVzG2MLcjfV1ohbQ3yuVFxeTtv6JjXQZ6hwTmrjVduRCWvSk8zU+gS/GZB5b3H4wnYDd4uFUAvaTDyVfitO/FKI+dTpKDhspsgEHJLK8asRCki+jRqXORyDvviZu8mqyOewGMKmA8KMAGDUPqayKD9YVqg7QN4rkJ14yg49bX/RKxh8v10n5xABQEbAgVPFVxZavYSdcL7RcFY1pkCSX47esjaQgUd8c2++t+PoJ1RKlUlYqC9VIzo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5535.namprd11.prod.outlook.com (2603:10b6:5:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Wed, 22 Feb
 2023 23:39:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 23:39:35 +0000
Date: Wed, 22 Feb 2023 15:39:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230222233932.wnxzjpsubo53re2e@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: ed659e6d-e8ce-496f-f6a2-08db152e0e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GmNqgKyv2dfc+j+Ze3Wzs6ta+s4bUGDhipWMksTn7DrFkjsIHM8HH3fNiREmWxV/T/F9Pv8qw32inZCIeBZApmq64SWObTXa5Z6V3Zio8Sd6hRNfyg+jN7oP94xETwE2qMTgJsJNnHDestRxjd/DZZhhKxt7Rl+5goPFKanNXCAHjVYb4PcQRda7yb/9GIEMXOBFuzb7v+rTxxjjcDkGNLbFphg7YDrB6O5ZEONF6ZB3HitIvuQNgGLslLBdkmWgAbbk00MogCspkERW4VYM72GteDHQ+6eMNT1NJ7NoJRehh6cQbBnkAjBXnkKOKjoHA96KN7JUrAOlnQHcamZoW+bBn53Ri70afdmuT7Y6LIW/hky/Vmfwt5WjX8A6KwdFVsszOH3Z1t1se3Jf8PeryEA5DeXhkuPRJV65aKdqp50iMZC8Mj1to704R6fTK572TxYPZbrrho+gGRZr2JhMDJhf3bkWRFy+VGX0nuBS6BGywRl1AdKZhl93/jI0vJDM5GTGghKSv3VCLKjHSctO2LKN+Hd9fLUKkYm8gcDJZefKGxVdgeaWSCv9ARWCnPwRuFDRBQvYR4zhGtxEl6hPHr/1B0qFhizJnxNpNHEgL8YoU27PDt108BXp0mhvpxnowurn0lnalRt2PaHAXq3ILg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(83380400001)(38100700002)(82960400001)(86362001)(2906002)(8936002)(6862004)(41300700001)(4744005)(5660300002)(186003)(26005)(6666004)(6512007)(6506007)(1076003)(6636002)(316002)(8676002)(4326008)(66476007)(66946007)(66556008)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tsnyGqSkgHaMZRd4jpRkqvbgtAyy2yWnDJ5KyufoMyREHJbKupe1+6IihNxh?=
 =?us-ascii?Q?90OfhQ3t2YerDN9gprzCDwr6SYenpjw0u7kDyzNTI64lUG5y+6d/HDOvHcNv?=
 =?us-ascii?Q?j+VZQtWog3K4qb6pXuqwd8g800AOWTv/MjZmMAoUIcGkWhUxtBmyg8xs+mZk?=
 =?us-ascii?Q?HwvPwne5AdHbO0Wt3lELz+SJb9221CMpjBoQD6eGO0EAmcGZclSvFQQnPMCU?=
 =?us-ascii?Q?NAuNkXZhgFVSPIPWQFCmgywY3daRoh/x3MtRyS1SBWN9LE1HkfrAoSUm6WQ5?=
 =?us-ascii?Q?IQo4GMLodcVIwrQ8rnfcgahc3xNBOWgr3/vZ9XMaaNuugxJ3ARFA8lHJp6BM?=
 =?us-ascii?Q?UdDWAERAK2TASETheYyAvICyp7nRLeKEnwQLOg+SxRE3lzbBhDGoaBBhJQFz?=
 =?us-ascii?Q?eUX8GfRmQms/XK5/dXr6Vq0Osq4TtLuhsBZrAhEOwY47tdcsDbNpTv9Wexd0?=
 =?us-ascii?Q?tDqiSQ4mDsxqqRgfyqbg+9VHHYdeHwOm5451WGDzujuPMC1HX0wZEpsb60ze?=
 =?us-ascii?Q?4PS1UJpw5ahHXpZwLPPvmDElFzJvB5kpztvPvJXEAPgpgkEb4sfXnvbq5Jmh?=
 =?us-ascii?Q?SyZcw/jahgQrazzOWG8TYqYP/OF/Rv5FeaJ5zTbqbyZKoCTBgKGzv1mNffqM?=
 =?us-ascii?Q?xyzH4e3v/Zh61acC1qjtRZHLExOBRK2vuLt6FXJt4h0o3aXRLXKRP06+JR1n?=
 =?us-ascii?Q?dH0pW3gsVZSPYKqa7AO9F0x/V/6x7UyElUPhC9rERO9B9xwMZjsatM3+yhMl?=
 =?us-ascii?Q?72fNGeXKFiQ0Nd6wUNAFgVV7VIedfv/0k9LCzfjhrRFVmy4rqG5PfWejRlRF?=
 =?us-ascii?Q?mhqbPCjmx4kWBt/LJc4N71Kza6iFAhY6t9oddpTattMUlA8DIi84VN1DqlK8?=
 =?us-ascii?Q?vHOyFIm7HXBGo5ALeeiMZStCJPb71kSyBXXpFk98gBgzbus/UYMklDEkfYfw?=
 =?us-ascii?Q?67E64dyvlRipo4jsNVKcEwr0+8ZYP/z96uqDndDSib2aKlYeezsuUqDkNtOW?=
 =?us-ascii?Q?r8UHXaIiIuq7CZ4p8PiB2w2NQaCXx15zn/lsFcSPZuTIO9hAKRlzgtGCxhdz?=
 =?us-ascii?Q?a+6vTmeRghmM4ynM941T9v/QUMMnb/tQVeCAvq7+pEhB7E5OIGoWvJ/UVUpV?=
 =?us-ascii?Q?k/m4zyBqZSFxudoBlpJTDAx3h6CknUZAs+v+WofmDglEf7v/KKWZI6w9hvQu?=
 =?us-ascii?Q?lO3Vl5hXu7+ryKalE8JXiK0eIXAlwArUfGRA6zVwUe2LvGikwB0y2Wu5q2xZ?=
 =?us-ascii?Q?L5CE+XmJ8T9b9Q6nN73u+thGiic5w+zb1o1YI8LiYYsc/O9RoIEEGEuw4BJS?=
 =?us-ascii?Q?+My5P6Bl24y9c0XFosurk56ge3HVp1hpmCw9nMJm8qkfyu1HBJJZsmFS4yVN?=
 =?us-ascii?Q?d6/ae1FsRmJ6GUHhZdY3STGtnqUONK4Obtac1FmS2Zc6u67up51U5Z6Sv24w?=
 =?us-ascii?Q?zEIyCtossE3jENiGVelPCeUPYn/WDBbwpUzzd4JjHeJDxitUTzs17FHYCvnN?=
 =?us-ascii?Q?iVY7A2Tv2cYHmDMnX06Vj646R/EL74Kl1otNNQKfvLeY53o1cyZlOjLOLfv2?=
 =?us-ascii?Q?zBfNdB5KWLV5ztgx0dlwXxXV+t4ibar59w3zRRtJTkvarBW//2R+4E6areNC?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed659e6d-e8ce-496f-f6a2-08db152e0e30
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 23:39:35.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yk/NKRUujaVB2SaS7JAgKYgb5j0Xh6klbYf8YpwznhOGwDFLzoohPIBchNhXC56ITvbvY/RWPWX4h0hB4Y2FmwHWVuokhxo75QUYSMUzKLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5535
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe/mocs: Drop duplicate assignment
 of uc_index
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

On Thu, Feb 16, 2023 at 03:17:22PM -0800, Matt Roper wrote:
>The DG1 branch needlessly assigns uc_index twice.  Drop the second
>instance.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mocs.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 583e198af88d..696001f60259 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -352,7 +352,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->table = dg1_mocs_desc;
> 		info->uc_index = 1;
> 		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
>-		info->uc_index = 1;
> 		info->unused_entries_index = 5;
> 		break;
> 	case XE_TIGERLAKE:
>-- 
>2.39.1
>
