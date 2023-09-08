Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90978EEB56E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 21:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AB710E127;
	Fri,  8 Sep 2023 21:28:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A56710E127
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694208512; x=1725744512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tqo3aS94LFTzdS5KSZpOD/KnFd1PHrGdnrdOEmxUc88=;
 b=dofsvBwdv8LTRoEXMppvaBdtLfhtm/vHIJK2/k58SociXthX2nVxnijA
 njfIgjJeZVNFYmB+2xxfYrgKVyQ3OAvC83rCStbyhG8bPwbXdh1Jahcn6
 HNBZ4stqF92ygUKzu/8tWAt7/LY6LOJRsEdATl3afQboQ8fOTj5YKhZFS
 UhZmDrl3BWe/E2cclATSlkqAJGMooYtlxsVStVy2tWnYAo6ADoFvnPcQT
 LVthvl9tuYGBgjr1ZI+7s5JIXe2hw/ey5jZPw/jh4zLdrxbUF91g+DMcq
 m9tNVU1Qf3yicTD8czF7AbcqtrYV4ofzFzL2v3lNrK/mVPGlw44iCYZN+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380481999"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="380481999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 14:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857548692"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="857548692"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 14:28:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 14:28:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 14:28:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 14:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVAdI8eVWRXd6M27rSAxtmTW7U4dcsJp7piZptOMisSuX7QpGR9DvlnxB7lKAS/0Qxs4Q/Ydf0PZd1ZYodx9OQXJfHzoFPXVw7zEbP0QNkKV3Liw3YgL4bfP5i51W/flzPSkZwKu+hDL5R7F5IBuTiXxyvMtWjekHrfG8FB6dp7swtr+C1/6nTqm5y3WrZOTp20WWtOIINYgF85kKhwlm74/umOGGTA+j9kDQM+AgJH4kBnEvJoWYiBxpdqIL4ZP13lFlayR5AR5zKXa/POV7P9MyzGO2RmYcipPKvNnaMX9Yek2X/MCrojhZbSyqsYEOwzF2HG8IpLpY8EjgBhG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OMk2zKctDBuxwb3MAzrD3XCMH0ekdbgI3tEd4M/KtQ=;
 b=N79WZPVLomJjmEFgc6JtD98E2uT12VyUnCDM7eZ+9p/CqhllNvqqQdYFcfpbLzmwYUJ7AwCYc+KSAG9d5lTA10FZprSTrQzzma7Jq2dR8dUU9RTNkMK48mcpqwVFQvp5JlkNp6XV+qaoBJ0T3ht7PAz4HOWSUuZBoy/TaRrBdrDm0UqEs0p7hSWvapy+9KEAnmDSoOJ5ke1qCE8lubp/FGPa3XWw2Q89SegOBOhs4JtE73nNcb+EABemqnLRus8PEzqg95FvZqi2TAI9l+h2NTOhHphE9pFb3JHEE5YsLkJawNmxdR6cAsAeO35xzco5lJDvRiGj79BLRmCAOe83Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.39; Fri, 8 Sep
 2023 21:28:24 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 21:28:24 +0000
Date: Fri, 8 Sep 2023 17:28:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZPuR8zorq32uh3Bn@intel.com>
References: <20230905141347.1027082-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
X-ClientProxiedBy: MW4PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:303:6b::26) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d27386d-1b64-48f6-3247-08dbb0b2881d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IuUnao5rtA/tBd0aoSh918YT9ZaJlZFw28PWWtjC+VB9ni5Y721SV9R/AnogcGG2V54fj5u2MKd6zJcM8Ah3LVe/gEh/OnKDVepqu9uHZUhPlGD3jhKOLfSX+uADzw40EYo5jOYoFFzZnzhnueWgykH0c6OsblktU3MD1+Marfx+e9ba4toIx7dygg7C3yemm7cnuBA3phu9xOWFJQWl+wqBeaDaXqIl5/PtGYrWg0OUnYwD2+rEyZxKdFwUrNV9cWqy4hGYICTPkxSlndSEuAW/diC22wLcHMY6hHT+52XFiT01JHfdo6liz0kIr58abtjnoLWunKUNGxs7NOxRhP1r3+WNy889XwN8mf0XbdCCb4LcB9wefqTEAPVmT4teX3AHnnGDiT4RsC47Gqb1PzcdmVuc5wPaazgJL31V+RyXZv7ldY0H+pl1S1R20tOKTB183aULh+pZcobEHi1hoYti/KbW/UlgDa8ZfV/nAGIz18wPW/qwsRmdEX8Ui/Oa9ZtMjUcmswGLSGfIcXvHQfF2XcJmsrnWAeor+pHHwbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(1800799009)(186009)(451199024)(83380400001)(107886003)(26005)(2616005)(66476007)(66556008)(6636002)(66946007)(37006003)(316002)(8936002)(4326008)(44832011)(41300700001)(5660300002)(6862004)(6486002)(6666004)(6512007)(478600001)(2906002)(966005)(6506007)(36756003)(82960400001)(86362001)(38100700002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ue4bzo4/Qx6wJNioa0bOn53u7SY3BzpSgxJtJ9Hr7DvA1P0qrXNVqq5OBV/T?=
 =?us-ascii?Q?gD1XqodDmPrOqHWkhHy/zI1TBM5snWpDsVk1NPEbmQIMUv07iLZh5f07DMmM?=
 =?us-ascii?Q?LMYl5huu1Esm4bZScOwO8rF1AoKISepnCMJoalaCvHeNdmDRNRjmrlve1U3+?=
 =?us-ascii?Q?vC5L7PM1G9QfgGy3Yy9ixMgNJQ3chkiOQ/f66HiAyDvmyFARXQQ7WQ2eYMtm?=
 =?us-ascii?Q?7I0Bie5W22MHrYU/Z+kaI1YfJ+rUnGaw0Er0xcORgftL3x5ds334GzVOjosD?=
 =?us-ascii?Q?rEJjPP/ibW73pDt26xE3tt23Bj3wWNA7ZqPjHNqJBURy8oiQD0zixaY7HFS+?=
 =?us-ascii?Q?IWC0iS4ESOavfmVlHHFXo2tlrZEXLTuw4iA9sUIGGmUDGuM6XmMiSIDnFPE7?=
 =?us-ascii?Q?bGjmU5e4lAaPwwcLlaDit5GQ4djmlwgYN+VNhnIeFEIPzFv3ZKPf5zFVVesh?=
 =?us-ascii?Q?uwbmOUxMZD9J4TUoyIzhkoAWtRKZtG7ri4/7XA7Jxd//mSF2kp9Lvuz+HKdm?=
 =?us-ascii?Q?oU0a5U3O5l92GCaTpFMqVr/bhT9MfS7oZSdZCjJ5muS5Brc/BmlcWzOPO70U?=
 =?us-ascii?Q?HdG+9YDQwelykYQlFIQvmQkpaEDCVscUbKIVbytYboslyTzx1bIMixYrMTp1?=
 =?us-ascii?Q?bIA0fut3PaxHrLk/kN7v+Mf9kLKO5X3/kh20pth+IDqi16T7P/d33Rp32DTO?=
 =?us-ascii?Q?mJ8SbwP4aSj9wy88R3A0EOyzWK1f/YSG3171HRdVPF4QN+NwOihkGT9NUUyU?=
 =?us-ascii?Q?5gb3djo9F79zyp/cp4ce88pF29Mz52IsjvzX/r9XKOXV7cG3UCzhcKIV0DLr?=
 =?us-ascii?Q?nLsuEWbrUgHOmnz9Gz1ipeljxMvAj0iuM8BaaZvtO5pweO+5QtZNAms8WhNz?=
 =?us-ascii?Q?4z5oXA17VlD9X5NjC2PHdNcwkDEZvDsiE4fvYCza4hJXMkkfLcSq+EIYy1CR?=
 =?us-ascii?Q?uHNK8Wo8FdAzhU5j4ZDJfxyRb1vmssOIiZZPfDMlea3ohdCWB24xNk1CxG27?=
 =?us-ascii?Q?NE2tkjTFx+sCDep45t5Kpb+6jNbOKYkOMOO82YshEmMqIz1LJyCwWe6X/EKK?=
 =?us-ascii?Q?lYl2elAvIrn241P8yGpftuhq+Q0qgPFkJKiYTJmT2YQr+6ecGHfNs17vHnlq?=
 =?us-ascii?Q?vUeVqe+uGGkeiugkzA0IGgVPbZQK4X9N6Pcf0/MIgNk1z+gkzAeGRZ39Cx0d?=
 =?us-ascii?Q?J6+FqMbbAPVbIS8da/V2IcWNIZ34FecbtikekXiZzkAykI23n7unUy9/aGmk?=
 =?us-ascii?Q?mN2vuvTYNh8sPSz5nV3NTEeiFb7PvpuBNp7MCfyuERiLbSvyojJofe/tHFf0?=
 =?us-ascii?Q?Hcxux7nR3p38PuqmLjrhfvqNuvbtl/nmj8cwC6Qsh7TqFz14IFjz8gIevPIC?=
 =?us-ascii?Q?9aEwdx9ha524EVwUCRGBaB48TkcDWRrEwBFBWtEIzoJRf3AqVjKu2LmeqHp0?=
 =?us-ascii?Q?ZtEm4AHvxHOOBaTBiEuAqQDVDTapq2CIjnjBJ0ZZSFKBUeLk94dCpzgABvhf?=
 =?us-ascii?Q?mHKoeElfKx3kKTcvogN07KMdshG2uYFi/ZZ7Az39+YlsRtscC76JIffd2ugW?=
 =?us-ascii?Q?9fldbLoUGyeJDzAxZqqlR7lHlfpA+sdmtyT3GGJM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d27386d-1b64-48f6-3247-08dbb0b2881d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 21:28:24.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrw4XyRveQ0xqnTKpOnftKbtLi8S6ZYdqZwgMgHqDMRrF8kYJP0r9dBV3x6JSHUUn2GFmmYpOTmkGn6+C3vG6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/5] drm/xe: drop unnecessary i915 display
 commits
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 05:13:42PM +0300, Jani Nikula wrote:
> Revert five unnecessary commits.
> 
> The rebased version with all the commits just thrown away is at
> [1]. That also drops "drm/i915/display: Make FBC check stolen at use
> time." which has become an empty commit.
> 
> [1] https://gitlab.freedesktop.org/jani/xe/-/commits/xe-drop-unnecessary-commits-2023-09-05
> 
> 
> Jani Nikula (5):
>   Revert "FIXME: drm/i915: display/intel_display_types.h random
>     whitespace changes"
>   Revert "FIXME: drm/i915: include i915_utils.h from
>     intel_display_types.h"
>   Revert "FIXME: drm/i915: revert the earlier mmio_offset change"
>   Revert "FIXME: drm/i915/display: Prefer i915->uncore over plain
>     uncore"
>   Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"

I honestly confess that I got a bit lost here, but the end result
makes sense, so I just force-pushed the removal of these 6 patches.

> 
>  drivers/gpu/drm/i915/display/intel_bios.c          | 13 ++++++-------
>  drivers/gpu/drm/i915/display/intel_display_types.h |  3 ++-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> -- 
> 2.39.2
> 
