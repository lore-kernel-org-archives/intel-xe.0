Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E2C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13FA10E693;
	Wed, 29 Nov 2023 22:20:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC110E693
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701296434; x=1732832434;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wVDMfo3lzcY23ZxqVwT89hiA7MwOVuSJnq0UMhHSwaM=;
 b=GQTbLvdHZF83IvxXLa1kAvI06vkKmnzyqt/97gVq1EOGVUjtr50I8jDb
 p+83r3UEAcD2KoKCKLOFJswIwc65650tMpNz3buYJ889dcGKnTmYU6Rf7
 3vOxTRUV9F1tiA5jSd9YIHFA/GXknPqRrhQNiZsrCu1wUegM6YMbrjOA0
 i9hNxSmwcPIjeMs6IgcmWBg4SmUoY/p9F+hxqFBylVGmq5jL8VbOVe8kv
 9CGYbs//JTZMekQy22TBzDX+EdYGJ0dayjUhao/HHEr6FLTR8DHNsG23O
 SoookUi/sa2z505TRFeWYPwVofU2MI7zjvIDPWB+Usb1x5NR8+PhRohnC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14791156"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14791156"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803432928"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="803432928"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:20:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:20:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:20:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:20:32 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:20:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfJbhfUm+Tk7xlDGLxH+KLVlK8g38ipIM/q3IZwN3EJ3sUelPuyr3aOqGdPiY1rHxNQbxj/lKQlu53wIJVZqvyZeV5OX8zmZaK2QnYQ0nkDhI/D624uLYfI9L9Skrw2ltt71z4b8ei+y/H39ga958xXHPwYKnFGfKyXEjPvJ+g+Z3E/y5MUzQwEf5qcUzOJzHbgO29iekZ5g/IP7o87YfU3fd3i91PTv4qES8g5g4yC//d+GA6E0PrLsuwcFhTOkwrqAYTsXitlxUV2yt90Eni/oFLX8VmUT4nN6obGjdFDgX6iCdluk0ADUmfqHbjLhj40fARfNwORJ4C3gQDp7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAPXQwblXQpGNBSEDql+RcO8f3SFt+ZwcK7e+SXuTdM=;
 b=R8E9WqRe/qvZJSwRE/EAEpBNoBf8z6N1sN67EnlUJmve7oXcOPV2+IM7pdquzMDTCybGYu68ajWIQWnlzbx4lPormQv7Fbv/4zPtLrvT7yMBhCwvxrhXwhoscevNDKpBwSy4PJosevrzKj8o4C6zHDNpoECcOrZSS6Bz0nhT8mkw5rA/THguiLo/++gQXQY0wYWh4ZedbwEitMPbNUxRFUmFKqVkFltv5cQKZ9ei0GlMOB16qKhzRWocJ3M0EEVTouDR2j/rk7K27SQSD/T5hVkbEQbuEO7rL6lbW0AGihOSeUat+tdF5ZL2KvLOAsCYBX3HiTO5KmMttGVxLNZHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.22; Wed, 29 Nov 2023 22:20:29 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:20:29 +0000
Date: Wed, 29 Nov 2023 23:20:27 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <ctavrro7oel2zx6kq34udtrtwbndtj5yfyfydkhurdfcumyxjx@qi4ml2yk3lwh>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-23-michal.winiarski@intel.com>
 <ed88148e-f38d-4e8a-8066-ae9ea9b983c3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed88148e-f38d-4e8a-8066-ae9ea9b983c3@intel.com>
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: c27123ff-5958-4a19-9d5f-08dbf129650b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yCrNoKWAc202RWqoQwMqjA5ovvJBaZSkOE9g1vqX6UDrsprT7/h1FXsMSYuKRKH2JhCQRWXcB8MwmFlSM184bX98+lNonJEf3/H4FGjXNh7bpmMl0apknpE6QF4hB2Mibgsv87xTuVaa7H+SbuIe0KJOOePA1JB0zbaUIlNJYHUEsT6UdDgQvC8NejhAJpj1MRqDnpAPufAHnG+CS/erl3cGCnLFBrpzaR15hI0KDWJ6RQp8B+S7eIiGgl3NLfcKwQdXhAPs6MxKsJmDsUPAa33veFax9VV5sraGegcfHjtrWPRD7eDyj0NFIaHVkMh3HuMlAVgJTBewTkPfHiRDpstXdwfhnvKn1RAblhZHMQoTJn1rUkN+VkaP38OiLq3B51ep8eGP08qb1N9YsYlhwvWp9mpTpaa0ntVgD/4mLzbiBra1xd5kqhGsDwzLxvz6soOmvLRqOSjlsn5OJwIKWf9bfk94qeDi65TRrdCI+o1qWzabiT41pUo9aGnmwu9Lqn+bBqq3aByk/4fOc41C0CwQwNbzbcI/rF/b1SuXRy/jvqvc5axXFs3/hs9+wOqcmZOt6jJKnxhwEdjxUgtVCGeqG4Oz7HA1f+5QorQz+ELaRQqbFo3ifbqZPDwxVMBMIKe7YZsv/RFk/th2bCFkLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(9686003)(26005)(6512007)(107886003)(478600001)(82960400001)(38100700002)(202311291699003)(86362001)(2906002)(83380400001)(41300700001)(6636002)(53546011)(54906003)(66476007)(66556008)(4326008)(6506007)(316002)(33716001)(6486002)(8676002)(6862004)(5660300002)(66946007)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Njk2cHpqUllFbjlWbml6dStWQ21vN2NXakk1cm1VWjlKOGp4dENGTE5wdzRK?=
 =?utf-8?B?WG5hQ2Rna1YyZTBPcmgrait2MkJkYTVCUU9qSmx1TGVkK1h0b25GY0U3MW9Q?=
 =?utf-8?B?VlBLNnEyd3VzNkdIRXNzcWFmc0l6ZFZxYzFYUkd5azRUNzNuTXBUR0YzSDdG?=
 =?utf-8?B?M2I4UUZhU1IyeThvMmdGb2xkRHRmR1Q1NFRrbVAvbmtKdm5mQndRclVkeXQy?=
 =?utf-8?B?NnFWcDR3Wm1iK1kzUW55QmdPM0VhVUlKZ09CWVhOVUJ2SlJkTWpPcUJRS2hQ?=
 =?utf-8?B?RDZxbWhDcXRiZUUxeU0rdHJCdXlEb3VyT3RVNUlTL3gvTFdhRnhvUktVdTdC?=
 =?utf-8?B?ZmoyTFZ0SGxFWkcwbVpjUnBYclE4TTRQNjIwMGtvTUFySytESDYwaGVvbnRM?=
 =?utf-8?B?RDdHV3piZzdsc29ZbmpXa2ovNHpGd3hKQ3hGbVIxSXV0V1Q0YWFLQUdTT2d6?=
 =?utf-8?B?TG1JbUJ2Z1hGWVJRQWh3N3ROTjRjYVFEVXlodm5Hb2V0bGI4eWc1SDQ1OHNX?=
 =?utf-8?B?RUtHOFBUcjNtR201dnZ6YVlacE5wUWI5S2RrSmdnZHIyQW5pdE1GZE1zcmp0?=
 =?utf-8?B?cDI2MXh2UGM0Q044SVgxVSsvYTVCM0w3ZDhJb3MvSXlQV0RUM0gxdXBRbTBN?=
 =?utf-8?B?aHdBQUdWZWQxaktSY1JrM20zWlJkUG1qRlhsTE1VdDJScWtKZWVSWGpzUFVt?=
 =?utf-8?B?dzdST0lYbmUzMVlrMHN3YTQyK2lINWpwYmNOSmhUbTNEa2xmNHNmc0dnVXNY?=
 =?utf-8?B?SDBZUWw5Rk1yUDJvVVVselJyR1hiYzdzQWxKcG5iSG93ckFCY09YRDhub0lq?=
 =?utf-8?B?ZnViaXBudEhZTUNrdk5lU0hPQ1dhN3ViNG1HWWkzdHNZZ1kxT1Y2ZS84eUdY?=
 =?utf-8?B?Yyt6V2djSnJhek1oK3Z3OXJjK1d5aGdOZDdVZWdRbm1hZEtVS05LcEtFa2RS?=
 =?utf-8?B?UEJDWmJLME1Zdyt3T3ExVGZuZ24rK3lidUJDUEJtL0h1KzdXVnU4RWQxaUh5?=
 =?utf-8?B?VWxEU1dqeFArdjI3bkhvOHVIR1Jtd3pZSnZqdUFmNXdZVXJKZy9WcDNLTUpu?=
 =?utf-8?B?NThINmhSbStVSzhPaFMxVkpOSGxZa1ZCUWJWVWFWYXFpNlZwWTVlOFpJYXNo?=
 =?utf-8?B?RnB4WmdITlo5dnkwSkJ2VFJFeXZsU2FQbkVJSG51eURJeHJuZmlqQis3S3Zh?=
 =?utf-8?B?a200aFlFaGgxMVlweWdjWnczcXA2dDZBVDNKbUNVZ3lwbU1ubVhLWU5ONXNp?=
 =?utf-8?B?a0xGTVRpdXlqeUE3RTJYMkI1Rk5rZUhyQk5NOFQrWnc0MGFaWVg5ek15ZUVq?=
 =?utf-8?B?bkRveG92WEx1cHhtMDZVSXg1Qkh5SzZmazI5UmlENTFwcVU5QnJCaDE2bWQx?=
 =?utf-8?B?dkdjY1hLN0Jvc1YwS1NoK0RDR1VOSFo4a0RPQUlRMTZZZ3FRYzc5Ty9HK3ds?=
 =?utf-8?B?M2NUTWVpVnp6bVZIeEZkMzhGVDBQMGMra2w0UHA1dGN5WjZiTVlvNUpmUGFK?=
 =?utf-8?B?L05MOXYvbjN0SE5zeXpxeEFiUnF0TUJIUi9iaW52NGJQNUt1VnFSVy83Y0M2?=
 =?utf-8?B?RE10NXFvSXdEZ094WEE0U3VPMkhNNEY5RmY0enpNbXNqY241M2lqMENSeWJO?=
 =?utf-8?B?d20rTzNKbkt3MmZDQ1g3UFFhMHVsbVNZRHF3RzI0akYvY1BPdDUxQkdjL0tN?=
 =?utf-8?B?VUdybC9SS2dBWjJZakplUHU4MUltd0F3VjhERGhEa0hDWGVDYU5IK25oMmRw?=
 =?utf-8?B?RlM0TEszbi8wVWJZZDdHQXlxOHdGM21vV1k4WmIrU3VNYVN2NlFwTHJoTHFT?=
 =?utf-8?B?VVFobEpHWURaZEg4b2RISExpQ01HSzBNSTFNYm8xUmlLMDQ4SDVJZFBjbDRY?=
 =?utf-8?B?SUVjdDd2SXBiZzBxOHNtT2N3K1hZb2RZTm1TZTJjeGJyZytVbDRCMU9reXB1?=
 =?utf-8?B?VlFSc09lcW5VaTlubzVsTUVreTVZL1FxdHByM0h3TjdvUG9HRm9RRW9pV1VD?=
 =?utf-8?B?L0x2MHF6SUtIZCs4dGNBTHVzT0RKT0JZTk5qbU5xVGJvTmJ2SjZjM0hwK1Bz?=
 =?utf-8?B?MlVzS0FLb2hmKzAxd3Aya0dOR3BEYUkzTjM1UXl6SWovalhBOXFJVWJpYlFL?=
 =?utf-8?B?NUhXUWxaNjBIbmxMeGhEQzlzRlVYcjdDeG1UQ20zMzRmZnhMejVBNHllSldW?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c27123ff-5958-4a19-9d5f-08dbf129650b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:20:29.5306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDQODF/NoA7AwPXw8dc89PdWpP4R9lbAoCJuZzsLBXiiqrAeaIDknkfQazt6Qe6O5N1TRtzPrgGwT2MWTpQU2e4gfs1FXM9bybR2BkqI+bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 22/22] drm/xe: Initialize GuC earlier
 during probe
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 01:48:50PM -0800, Welty, Brian wrote:
> 
> On 11/28/2023 5:16 PM, Michał Winiarski wrote:
> > SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
> > to access a curated subset that is needed to initialize the driver by
> > communicating with SR-IOV PF using GuC CT.
> > Initialize GuC earlier in order to keep the unified probe ordering
> > between VF and PF modes.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > v3 -> v4:
> > - Introduce xe_gt_init_hwconfig (Matt Brost)
> > - Init PAT before loading GuC
> > 
> >   drivers/gpu/drm/xe/xe_device.c |  6 ++++
> >   drivers/gpu/drm/xe/xe_gt.c     | 51 ++++++++++++++++++++++++----------
> >   drivers/gpu/drm/xe/xe_gt.h     |  1 +
> >   drivers/gpu/drm/xe/xe_uc.c     | 11 ++++++--
> >   4 files changed, 52 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 65e9aa5e6c31e..a236c36cdae3c 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -425,6 +425,12 @@ int xe_device_probe(struct xe_device *xe)
> >   			return err;
> >   	}
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_init_hwconfig(gt);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >   	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> >   	if (err)
> >   		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 964e76f931a28..d2766c2c58f0f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -297,7 +297,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> >   		return err;
> >   	xe_gt_topology_init(gt);
> > -	xe_gt_mcr_init(gt);
> >   	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >   	if (err)
> > @@ -336,22 +335,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >   	if (err)
> >   		goto err_hw_fence_irq;
> > -	xe_pat_init(gt);
> > -
> >   	if (!xe_gt_is_media_type(gt)) {
> >   		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> >   		if (err)
> >   			goto err_force_wake;
> >   	}
> > -	err = xe_uc_init(&gt->uc);
> > -	if (err)
> > -		goto err_force_wake;
> > -
> > -	err = xe_uc_init_hwconfig(&gt->uc);
> > -	if (err)
> > -		goto err_force_wake;
> > -
> >   	xe_gt_idle_sysfs_init(&gt->gtidle);
> >   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> >       gt->info.engine_mask = gt->info.__engine_mask;
> 
> 
> I've been wondering about the XXX above.  I added the line above that comes
> next.
> Should that move into xe_gt_init_hwconfig() as well?
> And replace it with code to read it from hwconfig blob?
> 
> I'm asking because I was looking at a change that would like to make use of
> a valid engine_mask earlier than xe_gt_init().

Yeah - makes sense, I'll move it to xe_gt_init_hwconfig().
Is that point in the codebase early enough for the change that you're
referring to?

-Michał

> 
> -Brian
> 
> 
> 
> > @@ -415,10 +404,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >   	if (err)
> >   		goto err_force_wake;
> > -	err = xe_uc_init_post_hwconfig(&gt->uc);
> > -	if (err)
> > -		goto err_force_wake;
> > -
> >   	if (!xe_gt_is_media_type(gt)) {
> >   		/*
> >   		 * USM has its only SA pool to non-block behind user operations
> > @@ -442,6 +427,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >   		}
> >   	}
> > +	err = xe_uc_init_post_hwconfig(&gt->uc);
> > +	if (err)
> > +		goto err_force_wake;
> > +
> >   	err = xe_uc_init_hw(&gt->uc);
> >   	if (err)
> >   		goto err_force_wake;
> > @@ -462,6 +451,38 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >   	return err;
> >   }
> > +/*
> > + * Initialize enough GT to be able to load GuC in order to obtain hwconfig and enable CTB
> > + * communication.
> > + */
> > +int xe_gt_init_hwconfig(struct xe_gt *gt)
> > +{
> > +	int err;
> > +
> > +	xe_device_mem_access_get(gt_to_xe(gt));
> > +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (err)
> > +		goto out;
> > +
> > +	xe_gt_mcr_init(gt);
> > +	xe_pat_init(gt);
> > +
> > +	err = xe_uc_init(&gt->uc);
> > +	if (err)
> > +		goto out_fw;
> > +
> > +	err = xe_uc_init_hwconfig(&gt->uc);
> > +	if (err)
> > +		goto out_fw;
> > +
> > +out_fw:
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > +out:
> > +	xe_device_mem_access_put(gt_to_xe(gt));
> > +
> > +	return err;
> > +}
> > +
> >   int xe_gt_init(struct xe_gt *gt)
> >   {
> >   	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index caded203a8a03..e9d6aeceb56af 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -31,6 +31,7 @@ static inline bool xe_fault_inject_gt_reset(void)
> >   #endif
> >   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > +int xe_gt_init_hwconfig(struct xe_gt *gt);
> >   int xe_gt_init_early(struct xe_gt *gt);
> >   int xe_gt_init(struct xe_gt *gt);
> >   int xe_gt_record_default_lrcs(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 13e76e6805ca1..123baafc9ec38 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -29,13 +29,15 @@ uc_to_xe(struct xe_uc *uc)
> >   /* Should be called once at driver load only */
> >   int xe_uc_init(struct xe_uc *uc)
> >   {
> > +	struct xe_device *xe = uc_to_xe(uc);
> >   	int ret;
> > +	xe_device_mem_access_get(xe);
> > +
> >   	/*
> >   	 * We call the GuC/HuC init functions even if GuC submission is off to
> >   	 * correctly move our tracking of the FW state to "disabled".
> >   	 */
> > -
> >   	ret = xe_guc_init(&uc->guc);
> >   	if (ret)
> >   		goto err;
> > @@ -45,7 +47,7 @@ int xe_uc_init(struct xe_uc *uc)
> >   		goto err;
> >   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > -		return 0;
> > +		goto out;
> >   	ret = xe_wopcm_init(&uc->wopcm);
> >   	if (ret)
> > @@ -55,9 +57,14 @@ int xe_uc_init(struct xe_uc *uc)
> >   	if (ret)
> >   		goto err;
> > +out:
> > +	xe_device_mem_access_put(xe);
> > +
> >   	return 0;
> >   err:
> > +	xe_device_mem_access_put(xe);
> > +
> >   	return ret;
> >   }
