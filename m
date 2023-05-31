Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0356C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 16:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A225310E102;
	Wed, 31 May 2023 16:23:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA0410E102
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685550235; x=1717086235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0GMYq5GUkF+u47QQP+WcrjslO/PPu3gP71pQOeDfq7Y=;
 b=kMoGqjRrwFOczKLQr3joncu/YROMIL9uB6nGVtbmf8uZ8aNVWKv7bCIt
 sOyQ0BXgqvQms2Kro4AxXsFPnTKU3vS7URmPrKzgHess/cR7/v5ugoAVs
 r9H+StvNlnTrn5qwcw+i9dHLmfTY3g1sXp4SsnfoFCDD/TGqWSawDjfk6
 lFUJyBASJqY6Ix/8uxbDdhsgsQKy6W2q5Eoc6WfnLB4Z8jRBHL6E4rRs/
 Vo8Gg+SviaJdGK1A5vS6LTSmKvWm8bQwuPQdrPHBqJtuN9Xpp7vz57Xr6
 vdPZrdd4r6sXxIX0+gYnqesNBT/F1BsnA3a/0KEvkiqoLc8cx/FvN5y5c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383553107"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="383553107"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 09:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710134096"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="710134096"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 09:23:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 09:23:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 09:23:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 09:23:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 09:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STuXZSsSGa7Zx7Z59L9+qac5xsbpd0b/rz1RNzWeQNmN1mKN/ZdjGVzj5TwZPvoe2QWaGMLpdLqkisPNmGrogJy5QNjIz/ivAQg/waghogw+psPm6Jw51eolQFh/t9gyL8T7zfGnQJlv0Qj1c/Oukr1/OxmRQmc02/8ewJIHo5Fsq2663jhK3JiXrcGac48QukIcwGT/ho4qASx83cPZwHVk/duowfO1yXrU+5X6jeUklXx5VKlO28X+NxPMKU1jf6miOKUVJ1XPzlOT20C2OHNLEGezJ6O3uZxCXJk/qGP1n0/IYFQ1tYfNHqB+a5iT5p2iaezM1YFZCGVo95BGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Sm8FZeBy0qaMBpNZlhl2kbPUh9KsoC8CjyPq3twvII=;
 b=WYpHz9DIiqauFYXhR3aEqLTO6h3dkP6LF+P82C21PrzTsVTUpOP6KwPkzhEeOKmVOC15OQ7NXt0qg2KaKPJvJ8nCqlgQBYGa7wVISp80CyIqRiq3XvMigyOo82Bq+e99jaKvcAOjZaE/+FckYQtJ4L+L6TQtb4bVwttteY/ymRvQGdTRKdoOkfkRDI4qOLptH+6B5YhbSu3fIMk4IyQq+O8k0eyK/+5XeoH/ScFAHBszv30dUcQQtX4KAujocZRBtrtVwcDNKSr2IxmKk8s297dQCv3el12vuIdkc4zN6aniP7cRBeu22qUMGfKyHdtiFbVykxCSVwE+vcJ15uxTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 16:23:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 16:23:47 +0000
Date: Wed, 31 May 2023 09:23:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
X-Patchwork-Hint: comment
References: <20230531152338.6-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230531152338.6-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: acf8836f-5243-431f-faa0-08db61f368f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n4F4WFfwX/2w6ZY9YtaH3m40NdrppSJEPWx83JohzX2+AN15PrilQh2s1TUyQP33KNNSzT1oFvC9FWedJVoIB0bOP/G/Gml5xYeyKa83VW0Jo2s9NHEGnTflPIMfQBxMdL0NPzVPzVGYCWNE8FfXjz0VvIjb5qYe1UNZ195cIpLb85VtsEtkeGcF6jP/YDhDkhTv3swsXN6gnTXwVcgc2/2P5dP6roSepQpEMT2graEIiHgQ6igo6F3qzRsUyj/a1ga/zzb5DVhH4MCdhPecPqsl05BZpyX2cTmaoYPDkNa/33E8ECVRGEkAATTTa344UjbRNza7ynp1uZ91TWB3C0d3Fa4BwP6Qnw89MA9eMs8yVibpHNVtVRG38QUkPgLBtWoUOjOteMcPvQQaQk+p6mlowOShinGExQxWUKZSIz2n76kgqpt/HNsBjWD8V4/M8Hrl45bKS8vtZQMFbgtf13I6POQ9A1qIcexZRhVyZJW2uSIaU5BOO5Hcq7XyCN/tVpQUUcbohP5WUGbLp0goQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(6486002)(66946007)(66476007)(66556008)(6636002)(4326008)(478600001)(316002)(86362001)(186003)(6512007)(26005)(9686003)(6506007)(83380400001)(41300700001)(6862004)(8936002)(2906002)(8676002)(5660300002)(33716001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JomQtzpgvXuuohlGLgua+hr034qBJqsK0+EaFVFO25NUFcF2cOSXUKgUHzq4?=
 =?us-ascii?Q?dIkETdDX8dg/ZCpYyZZkh4OtDzsFu1FkC+LF2Nso8I8FavMgaZ5EpfH59B7d?=
 =?us-ascii?Q?de29laSuFqTa3SABG3dkRXO9c1UPFxd/B+J9lZUy8oLEMcDNWjFi2l8J92AU?=
 =?us-ascii?Q?61AmQHvpZiQi8iuKT8DF4oJmkrj+Db/lGc0ZBFyahVnGEXHyJZEoJbaOjYGE?=
 =?us-ascii?Q?FWVvMjXj6yCqafnszFsQ8xYlARtDgLHfcnnzptE+fcEUVoMjOk8NUdqnEpSC?=
 =?us-ascii?Q?KuQY0vjWLO9h39qtb65xNCicgl4Vycy3naaHVFH4907qfkiiydgDG8nZwdM1?=
 =?us-ascii?Q?X98LpyntxPYyzAeqGEqwcj+UJEYWY3SBObgi0xYXhDGb2PUx96SXNCjL2Fof?=
 =?us-ascii?Q?pvFS3qfK+8diG+J4QkAgHCdE/FaGjasqVBxc4C8ceLqYnBCgsSqsI6M4Kkia?=
 =?us-ascii?Q?ggVQ17laVjFn1nJ9LVz129UH40sVj48ZQqVWzWrw7NZDYHizJ6zftH3oCZtr?=
 =?us-ascii?Q?Yr7r1d2bNw6p7OiDFONK/SpdA0tCQGNTHgpOwTvsSBJi02pnyBPpzINpkVpo?=
 =?us-ascii?Q?BTAUR+uLMghHhbgqxVHpLtXFeIte3drVbEj+4mVUUuWJ9Ch5Knb25Y60e4PV?=
 =?us-ascii?Q?9Av6X9yUStf5HB0kykFOuoHeCTMVkMksW0qDLCmBPb4Eifd3mbX/hZhIkbTX?=
 =?us-ascii?Q?oDT2wPr4JKb3WuaGU3zRhL/u2Qtj7pYqxlou5n3oLUt0Dc/nTOa1wirvPLYS?=
 =?us-ascii?Q?HAt0TmrEZLwQROQYIHLuHJGYx1jJauMODDGwIpRX0Wi3iulmSl27cCNfCO3F?=
 =?us-ascii?Q?K8o6IniEl7BdloAPJf7T5pwUxWdqyQbh3ze6G3i7sjLCTVYor5GOiwprM6oT?=
 =?us-ascii?Q?RtTmPbl/8NdmQlNs9Wx8Fi/FyRlpu1TKqr13Rkvk0wrhZzCe9p5/tooW2irF?=
 =?us-ascii?Q?8/RHDTfJx8vPx5cdehGInhL+FpfItOr6qLOp77yOM6NMnmFDsO9+HHbaoUJA?=
 =?us-ascii?Q?RwIjSH3YehYy0Y3PAcGjbkV9OgzyPWMGm6KwD7aGpTPkq+qwmuAepg1ubRh6?=
 =?us-ascii?Q?SiY4V1/FXeEgNWOQOGvyz6LpQcYAZKyYzDP+2YeUL/CgoK+uLXLsMFPOxnZr?=
 =?us-ascii?Q?k2p38JMfqLOeA4hiK5HAFeJKLj9/UijiwQX+Ugp72FSMJM8dUgqFmIU7hfWQ?=
 =?us-ascii?Q?s6UOf1ZW4VXn8wzXRROO4y6gs/Mev3aRZ8ni/lJHRorQZ0et1bsD/FmkvwwC?=
 =?us-ascii?Q?gfhwKsqmqGI5oujyyC1L9ICL25bYHj4pCKM1qckPzgOLlTyWHoYeCoQBjuZJ?=
 =?us-ascii?Q?UI1GXP38VNroCXNQvtRKmcI63+ECrDIjOKndK6UGRzRqs7RinnBbo3SN+SEb?=
 =?us-ascii?Q?CQmsNgOwN6Q0kqzjOX5huzAsh3KbtEl4Exiwh4OkOWR079Z09biFzuklka+c?=
 =?us-ascii?Q?Zf6q8i2JCNIufspPr4ZVgVoSYPGbua5NZ0B9hJ5lYvpeaY1o51oZx3dw4FcE?=
 =?us-ascii?Q?JMOvOUet3uNHOjANrBHPeH0CM9Zc6iL4P40gxmgRXYMh1kw+LpRBlzuu3WRb?=
 =?us-ascii?Q?+wwq2n5d1hlwXnVCySG0iRr70tlmzYwmCf+pEpEaWP5DFyAY7G4JMw3L4AmV?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acf8836f-5243-431f-faa0-08db61f368f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 16:23:47.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Did3tITywEdkZISAPmeGH0PQhcgDmDWyx1MNUNDL9LUN5gm/8VVcWLudQGz2lvR1zOMgpwX8tohF1GPUlxpkNrxSgqm1xvXVqiuczz1MR1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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

+Oded

On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
>This series addresses some feedback on xe_drm.h provided here:
>https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>
>It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
>likely break CI.

As I said on the previous reply, this is not going to fly. Now we have a
patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch with
*no recorded reviews*, doing things that already conflict with other
fixes that landed in drm-xe-next. Examples: the 32b compat for uapi,
the mmio refactor, the oob WAs, the probe refactor, etc etc.

Also, there are other fixes queued as fixups, which is still the process
being used in drm-xe-next. It's also where CI is running. Due to display
being moved up in the branch it's basically the only sane thing to do.

I think we need we are shooting ourselves on the foot and this review
process needs to be fixed / agreed upon before we create a mess out of
it.

Lucas De Marchi

>
>v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
>
>Francois Dugast (5):
>  drm/xe: Use SPDX-License-Identifier instead of license text
>  drm/xe: Group engine related structs
>  drm/xe: Move defines before relevant fields
>  drm/xe: Document usage of struct drm_xe_device_query
>  drm/xe: Fix some formatting issues in uAPI
>
> include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++------------------
> 1 file changed, 90 insertions(+), 81 deletions(-)
>
>-- 
>2.34.1
>
