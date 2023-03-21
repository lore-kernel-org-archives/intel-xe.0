Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F25C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D39610E265;
	Tue, 21 Mar 2023 22:27:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FE610E265
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679437674; x=1710973674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=60Bix1OI+PWRvK0kGZDjP1Zbzp3mnrfA6FBX+O0FtNA=;
 b=C0zo+NqRtovVeagopfjB2yUDjwMWUTKlkVnQrHlBC2Ec7+8ASrAePLz1
 pJeRlofXrUr9LbuLATciXY2A1AGiyahdAGQOvr01UHk1zrSuvatVBbg78
 YkT8I0yBzxZJ6bHM1PP429z/DAoFDeKvlelV6TLn+H0bIiU7R4tOYE8qY
 QjL6g8oLm3AUnY5Eaa5XWPCV2vTq82+fhwoGEAl162eguC2c7QpGMcVJu
 jhX9Yc3QHqpufwpgMFiI/PW9w/X9Zy0GGUTB7Ql7KxHeSo5aMOfNWotp0
 lnMKmSlz3PEkcA65ddgAw/rXJYBgLypePxdVLmnbT/MnTl27FZXw6uiOn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401643856"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="401643856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="681653562"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="681653562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 21 Mar 2023 15:27:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 15:27:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 15:27:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 15:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG2prcColKAQ2ouMmksyoxAeMgqjtVDnHpw/aWU1U8Rk0GrgrIWtOvho4ZqF98M+wcKOTG/UJKIawOgKMbsitC9OgkLY7eg553nyx+ZKt3syMt/6E2Ub4A9iCWC2zdYLI5qOcMnu9lamx9Qgl8gyXp7eg/Mfmr5N8XbVE1w+cU9gIoYPF1jrYXWFEt2g5qKryzdgmMROUJNuFr934Dbohyv7N9hZvdkRyiq8Oe0On8MbvvRNxB/e1p/Ga4MUG+sqFElp1JoDaQ/699pl+OugVg/8dmrM2RRQMloTj1K4gx/o3KkTJ5HyClE4O6ixtSDIuZqx30JCRFEq1V5aBZ/SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsRqg7dVPoCgq9ZwZ+3iH00SluznCAkWh+VDVEvbVcg=;
 b=mi9q5O8Ovjh/tamzPVn4IcqS3nIVG0ki4Je8/Wr5De2v+YTU1bVivDwIw2/yZn07swU4lzHPsVx5BbET/dXozK4+Fkp9vFvRnU42JlY9q6cZ8EFwcA1lB3CAWiQfuCZGTtScShEVPaM0rpJEKI41wrDoI0B8ZlXE8pL3LKYlBl4b7tvxnyooxRb1heEa262sHZEaWQ8PuBeBm5QFAKgJLQlqyjYfHDYt5XP96C75CE2ZS6mVmiFD7V72/cYDW+OvOZIGdU4cN0tFt8OD1kYVQP8LTvqV2r7l2HSurY6tXjow15ALD2FHEkUwCdH73RWBruBb3v4u3+A+OEpHYRRWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 22:27:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 22:27:51 +0000
Date: Tue, 21 Mar 2023 15:27:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230321222747.y5dmwjs6wc4abe4z@ldmartin-desk2.lan>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
 <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
 <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: d6649a8b-9372-4d81-fb03-08db2a5b8199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02l2L7WxPQIiSktesX4p9Y6BR1a6XfNen4OYGolfQ3GXB1F+k7xvBdypC63sDtH8PGGrwSPEtVwJk43CS1p5RdCUK2n2RWKGcn5sP+XMJf05YN4CUiy3NUXPRIsoyWOPq5Kg0ur8ES3dSm3xEMljizVxI/DyWAb3BtycDQJBEbFLReGYp9lonbqNWohLzjIYcIYDc3aRA9gB7esIgKEzL0jh5YqqHagekrA2cDUbUsjzsBgBX64JvjOeYWRQqBopIw0uBF+H1sy37nKlWNUJE9tymtBcTbzDLd+sDKTZOfLPFSGUIoxt4Nbmv7Sl1oHxB5IvVpJ4GGJdy7IyHGQlwvbarDUNL3rmCZHjZc1qzNzQq0JJQZibo1tM1O3tZS0IUUmPRl+vyLBq1zkmf1hW9v/T7viFTmpFOL5Yl+dMsjVFQk4yrmWXLMJTX+BxW5i6lxchH4sDV0hTX2K17CoGXNVeNnHRe5f/w9ZvbHdRvC9JL0k87yDbT/IwKwwj9mfz4Xt9P79E8qDoWRQF8MgHhvblA+299hvqidy1qHj6/ZecAZRwJzmYLSyyxfj7H/zOIsznmaFQ2XYajTKLgCnxi6FI69zaYrdj1iacyAUI/ww1SEh/xYwzgsAq3v+ANpvD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(451199018)(86362001)(36756003)(6666004)(83380400001)(8676002)(4326008)(316002)(66946007)(66476007)(6636002)(1076003)(6506007)(6512007)(66556008)(508600001)(6486002)(966005)(9686003)(26005)(186003)(38100700002)(8936002)(5660300002)(6862004)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kUhF7ziwr0xs4Zmn1tbWPUT9pptLgOVnh4pIs/+kjLWtL38nzm6GzOKUMd0s?=
 =?us-ascii?Q?VZeWU+Kzws8ICzir3DWsNbz9XXpf3YmU2Yrk4SyLu+VUp3XfB2qcyfOKKji1?=
 =?us-ascii?Q?PYBKzc7p/Ak8eO3uJZxVueNZVbJNBrqW4H/yoZkxLzi6o6xRB+K++rBQNHmA?=
 =?us-ascii?Q?6GziQsAp2xxDqF75iTruE4P38OLipQ0hN1ywAu6JFn3OuvaBH7CwfOY3SANB?=
 =?us-ascii?Q?TLaF+pEvCw5VQw1bbuPgk5obVuLl5DaDMy+JMpsA3r8btYmJfvCRrRI77rUl?=
 =?us-ascii?Q?PqrLXhon4yxd/R8M9d4dMCg2UlZrfZlaefPIrPyPs11IQv1tXZ3WPRnkB1BH?=
 =?us-ascii?Q?kdgf98+xWWn4il2+noerr+JoynGXdnjq6aVgdoayhtLJd8uf0IhYyYeHFA3h?=
 =?us-ascii?Q?0qL9dtI4rqa7ItLSuMHyqirSo/9LYLKO7UPnzuIYUBh1Gy5WCh/JJtySnSYe?=
 =?us-ascii?Q?ThKZRZ4BILsHI4llGPHucYaPuz1XBi9DYYIjLRfc1UZu5H/KBAj8wFpH6upk?=
 =?us-ascii?Q?i5mYofOexpprJEeZuYFM+O4Oomx0t14gRK9jQTwOb1hX1E/7zlU2ja7pOfxM?=
 =?us-ascii?Q?CllYEG90DI2A/uK7AYO5o5iZ3f9v7nLTgPzkhhTvL6ETIxlMFeFm3Jqf+9sS?=
 =?us-ascii?Q?6oTpbxelVkzUpiP+c+6mAlQ1La/tnEdnumLKBjDP3XAF+7dlilqD+WZ3HXZu?=
 =?us-ascii?Q?QFOFqvh5mV0jpFWGsPg+pHEIUv7hfo2kb31qUWWa0068muYsEk7juOdCiM1A?=
 =?us-ascii?Q?tFpq6/jF9DSonse5dpSGxYeFtBPPh3Czoo6TKmc9GO0X4WtG5+8m5RwNCsZt?=
 =?us-ascii?Q?QpF9tavTpYlx7ZPbLEC4rQPqdMGEmsgwYfaGmPawKbEiNjv6Z2z5f7Y/1Pmf?=
 =?us-ascii?Q?u1A5Q4zheihYpatXhDTIbUP1yuUUUjhD/52aYRiKLM6Fkm92dj3hcHN4ASP8?=
 =?us-ascii?Q?gvMNu9p1WfOn6F02PsjCO44njLEsjJEOUP+Qn3F2amndM53O6RQRgsY2xWG9?=
 =?us-ascii?Q?rEMGplBHW7mWLmOzrUA78otTyfZTzKt1+LTf6XI2Sp339sVMga+7O5buaOF5?=
 =?us-ascii?Q?OAFhYsDgpRnyVp0dVbpudeI0v+eUEmR9NQBs/vWiYw7Z34szZPqBMmoWo4sQ?=
 =?us-ascii?Q?4o+uLSHdlwNYzvmWEeOpjYBLCZ4r9D8t89ZLHhMGOzUt/9te+paYK6Rz77jT?=
 =?us-ascii?Q?kCz4pJ9DShSLP3xQtmw1DP4jxyA59M2IVQFRUmZczRGeaZbFm/R6IgIem6dc?=
 =?us-ascii?Q?yoPWwXOjIxCpgq98TUlHMGw6OkSrv2fY+UPoA1OxlDamlL36DMh/H26ivF/S?=
 =?us-ascii?Q?id9B8JpwYtMpuYOlATK0+DG1J/WDklNrUIy7rbxve3+lCi+818x5CyH/viXW?=
 =?us-ascii?Q?N4sjzeWrlJouZd9yXp31cBI/4GPw5rzwVuvDSFGFMTA8YIz8ud/k89c/NBjf?=
 =?us-ascii?Q?JEt4h8wrSb2iCKntU3jmK32Sad6mXFXTmvFtOB+UBqZJ1SPVq0m6lqcgmCR+?=
 =?us-ascii?Q?Rn1lFM0UlqeEkwb6hjw/Kqldry9MLGBL5aM3fumRdCDApE51pbL8Y9un/2JY?=
 =?us-ascii?Q?u9m9rdxylHJ+bbZW+tbghJ5wVJWaa/hQ7sdaK9DdUWSfNSI5nCYYvBmqH4m7?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6649a8b-9372-4d81-fb03-08db2a5b8199
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 22:27:50.9674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48QwBQBEUyQIJOAy3SuQQj1XKpCYoam+KbPaX8+wWPIiwMnhR4dm2E5RKe01OZxRFZESRp4nWx1/YR7qdhN626n8yJFTCGmEQ7ZH8b+kwUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 02:48:58PM -0700, Matt Roper wrote:
>On Tue, Mar 21, 2023 at 02:03:49PM -0700, Lucas De Marchi wrote:
>> On Tue, Mar 21, 2023 at 08:50:59AM -0700, Matt Roper wrote:
>> > On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
>> > > Follow the new direction of firmware and add macro
>> > > support for loading unversioned HuC.
>> > >
>> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
>> > >  1 file changed, 13 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > index e2e5f7fbe9db..3c522d970228 100644
>> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>> > >  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
>> > >  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
>> > >
>> > > -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>> > > +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
>> >
>> > Why do we still need the old versioned filename?  Can't we get rid of it
>> > completely?  There's no backwards compatibility necessary on Xe yet so
>> > this is our chance to eliminate the version numbers on HuC completely.
>> > It's not clear to me why we're still using huc_def instead of huc_raw
>> > below either.
>>
>> note the version is saved to uc_fw->major_ver_wanted and
>> uc_fw->minor_ver_wanted.
>
>I thought we didn't want to use those for HuC, only for GuC?  Since the
>kernel doesn't interact with the firmware at all, there's no need for us
>to enforce any kind of minimum version check as far as I can see.  We
>don't even care about the major version number, which is why it isn't
>included in the filename we load, right?

GuC firmware uses a major number because
when/if it changes to a new major, it is expected that the driver
will retain compatibility with the previous version. So we could give
preference to e.g. pvc_guc_71.bin, but we should still fallback
to pvc_guc_70.bin. That is assuming there is a need to break the
compatibility. That should be avoided.

The major/minor is encoded inside the firmware and is still something
we check against for sanity checks.

For HuC, there is no expectation we will ever have a major update after
the first one is released. The version check is there mostly for sanity
check only that we are not trying to load something wrong, like trying
to load a firmware from before we removed the force_probe. Or from a
different platform[1]. From the user point of view, there is no easy way to
see what is wrong if the filename doesn't have the version and the
module doesn't check the version.

This follows https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
to the letter as far as I can see.

[1] talking about different platform, the >= check is because it should
be ok if a platform N requires the same firmware of platform N-1. What
should not be ok is for platform N-1 to require the firmware from
platform N. In that case we'd probably break the rules from the
guideline above and it's never something we are expecting to do.


Lucas De Marchi
