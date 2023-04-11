Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FEDC77B6F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 17:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F9010E5E2;
	Tue, 11 Apr 2023 17:27:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3508910E5E2
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681234037; x=1712770037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i9NwN3uL3dMUVpNWmpYhF7Ri6kJAedRqqHU0P01FVH8=;
 b=ijYY8jHNoDPR55mMxPakieVZVo0bU8LpVsDCChKEEDH8K0sOWuGuCeq1
 y69yyY5CVcP5LtGLaT3Ui9AOtWT/4sDmB+qI3deU+3PF7ssRkiywjCZtj
 O+aKgd/9SyyY/0aqylv0wY0q+0UAy6xq/VKyapyBBPWHgYVUHfAEk6RTF
 wkEcg6qdEdLHn6Yj8LUBEN/Pa3FB+Bwk6XnYHzbpG9F2exTOzh8HTnIY3
 kHcNahar/O/b+cItsYxQjXNvMz5ItezGp51ra40nmcXD4qauBVb6DKEEX
 nF7cE7ndo/T4Ry/OgjWhfRDwtkhFJbFrkG91NgjSW8b5uGqK0Xe34MYkM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346357121"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="346357121"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 10:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="638908295"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="638908295"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 11 Apr 2023 10:27:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 10:27:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 10:27:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 10:27:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 11 Apr 2023 10:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqMJbhZjrskKYUYsJFj1i1gBxTHyd/QBDf7pHrKQ0xrlmZOhn82goHd/+y0HH2lSnrefvplR4+S0qTbEdRAAKcJDwjHvajVNhZLDHpbByw0/BVRqPC+PG1G+uFc+m6W2wcMoSB0h0NHPTdyIV8qGLZGjEoD8QTE64SIvR0pLTp48bUH2vMdPEz5xSzdj2U/c8UTGQUJujnMrcCb/uMlnYPMG4PmXy8zJtOmVuDmysN9Ih4PmDo7WA6XcUeMWX2EyHCrT+5abawLPLC0ccz7GzoXm5ZElxbLLIz6i8nK3qUffH1c2Y1XuhhVmRFtkR6gjQYVdZL4BFPuVy4ySISzFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcAmK+Phwd+bxu1nNFx9DnRrroiXq68aQp7BpPF+Z/I=;
 b=jcqJqUvIY2j02U9937aJ3hTZXkwBXVR5p7vcd9DjuBeqqVyqOIf7I9h4abRVeQEmGQ6Is6W5HMyNqsHh/R+3lxSETwSl+qRdUuOaDRPI1X7vpnbF/cQdBzoj6GyrohAYQqcCPsn9/PQ/m1pzOTa71GBMrtrQGRwWNqCNTvRU6MuG3ZYiNEq/tHdR8YbcQdvoOuz3TPgu74JpdZRvai5CUCFMUi186Jt8MYy1l0q2JeR3MhrOfDuRe/ZWwHpRCGrz5wQtBDFS1fC9r6b56y9ly/FBU9JnTBiX8o+H+I30alu+bbr84qZnIxxhRcwqbz3fFsOWd8KbqXC81+3n1kVvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 17:27:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 17:27:08 +0000
Date: Tue, 11 Apr 2023 10:27:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230411172704.GX4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
 <20230411070133.byyciicbo4a7z3qt@ldmartin-desk2.lan>
 <87leiyetsa.fsf@intel.com>
 <20230411152259.GW4085390@mdroper-desk1.amr.corp.intel.com>
 <20230411170101.57a6nhdse44ynxxa@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230411170101.57a6nhdse44ynxxa@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: f622f5a8-5549-4ba7-4793-08db3ab1f9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o483dOQIWtk5HWnHZQQRlzyYiGZT4xjlwAH7BcNt0xuwGZ7Zq9QLuIKEla6S3sRoKk+6v2CiN+gaGOEfYXBkingvzqXGR38c18K5r6/ZY+NWaWMYNDM0Tpcgdl0sT2FQwJ+bkc3HgdFDj2qUQdmPuPK30xh5vSc4Qd2ulabOw1Eb3dRkd1XvXLCd7oFQArEKjITizttp/j2mkXPBSdshLvBuhaHENtHz9E9QyzjeLcbxMtvStkSqc/qq3daMflC3c070GwKH6xuVnCjWPTSg2zrhCLBCWw0yoruSsOtFQ603z7HHDRQI6zSnoc8+WD2EzZQ1XhZT7yUgUK939ik6EhFy6RZJdI88PhlPHgdiZzx5cGWx31uJF3FiwUoXuAOeTmRX1Lvc3KnJIo6yOeTY10KQYUIjGDz/siaUJoapQ3popfIIeG19vgB2hZFt56Yiv1JehEdk563598eU/JWcuFH22ExnrF83g+z8LciOc6Ra43vhizOWJtR99MVSmpolE9r/S2bgPpKmF/52nmELtlwlg5K/TkFYJoCB946feDE5tulHyyxa671IoDUuAjJu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(41300700001)(5660300002)(478600001)(8676002)(38100700002)(6862004)(33656002)(8936002)(82960400001)(83380400001)(2906002)(186003)(1076003)(66946007)(26005)(4326008)(86362001)(316002)(66476007)(6512007)(6506007)(66556008)(6636002)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y13SBwlgf1LecsVmGvGHQPNTviD0qk25JdpnEL77L/XRauGo3+XA55Aeta8O?=
 =?us-ascii?Q?d5LZSWhcPOg1Xva4qojMsB4fnqz7/kJhaMra6/gNcLjGOWuv/xcqKXm1MlC4?=
 =?us-ascii?Q?zsJLOgXMlwEvA3ymuTBZcyLs2s1KYKuYsMkFUmYa58dOi1tCSmbjrVSSV+xj?=
 =?us-ascii?Q?ZRVqtxjwEK33pnyRuQRUaZpsIaYKPwQRUWnuyxvkHKz+sH0Z5oaYGSk50WM9?=
 =?us-ascii?Q?/ekeJ89JBv57ZCAFtk0nRDDE9YmbdCrEBo3k2OzJpPCZDzVCfebuESmDDL5B?=
 =?us-ascii?Q?iZeJLXZ9LsJKFvE4aJhAK3AhfS0XynTffO7/pAMP5D2Q0gxt4JSmmCc1wvxq?=
 =?us-ascii?Q?OnG4SQRkQvB8bUhVkMyuj7kEbVLWjtijmywDmjn0Gr98INS3FOa8HXuCUHPE?=
 =?us-ascii?Q?ZU0H+oVntRSoBcxUJXw/5Hc5RqbsGbLl+h93ySd8L0XWLnJiyeCvOyraVtIV?=
 =?us-ascii?Q?zkS5hR88a5IYpXsUAKsd6EaeMop8xUaD+lvw+TIX7eNGyIv1p5xEvOc6A+qD?=
 =?us-ascii?Q?AdOoML9EshmGszf6tma1FkkinZmMnI3M0z0EbNg7hbMNpKANFfANSGHnX2fp?=
 =?us-ascii?Q?1luiAJZwf8UCNjBYzVtBQQnwxIlrsjrfiOZcdFl7uQwbmjQaoQJWB5Dyz/VI?=
 =?us-ascii?Q?sSnFZOheUynKZuqIP3iWaobGZCAMY9wamevmVRACeZX5Ilg91qje3SxLNTDu?=
 =?us-ascii?Q?udD9CXgQ/SsaGHXG4aFjzPMmKrFiH4bE46yII65BQ6m79HdZAhNc4TArpTfv?=
 =?us-ascii?Q?I66N2jBFcvbGvqFMpW2PliePVzrr6342OpVTnNo37WkWXagZpCiWDwO9YUOq?=
 =?us-ascii?Q?lmqt2TnhPkOnqZ64JFBj4iOWSTTgZHQAEyBJsZiTnK7aTxJg0ZBgT+xg6MSI?=
 =?us-ascii?Q?Uap8TtEBuUng+ha69+nw/WPqFXVnwwfH5+q0IU/oHdVoi0CYFn3L8QgjXuh7?=
 =?us-ascii?Q?o7GDif7KqEbk6DolMITNB5SHUEhH4aA1fcWrVCmUpq6+cpFYFOtc5DijeuaW?=
 =?us-ascii?Q?bypJ/Qft0iyV26/dnFjdRbMvAxmPCdH/y+a3zJqPZrhlsI7XMNjA74N9pRlw?=
 =?us-ascii?Q?bb6po6xuIrWT01Y7zgmAhP+e0DrLN5lsv3ukH70p1FceRscUBaxVBwtYGuIm?=
 =?us-ascii?Q?CKFQezIt0KavbAS5qzEqurQcvzE8JzeX8+q0WA8tQ4WiHzz09f3jGV+ZQMi1?=
 =?us-ascii?Q?g8DutVIkHLAKYl5rW8kuRjiWncaArCeUjIbeSdZt8no5V0RhyEZVlM3KwD5I?=
 =?us-ascii?Q?gi/+EGcw23yd1OiW3tC9wi1CONROE8u4IxjyjP3ax2yMajUw/gk1KE7lfbdw?=
 =?us-ascii?Q?DIbsgSoNDlK8P7lXMFOhPstc0xcnHkvhOuLVHzf9wS8NEmyyGhUGkQS8ojL8?=
 =?us-ascii?Q?D2f6Q7JMxKAN1luzw4W6GzgKaA0KVmZq8GZS3weMLM0qfUmstbezW3xL2yP1?=
 =?us-ascii?Q?91BmCaFHCyoY9AbaIsPsEBRFmxoU3XXsreEUrbVVcvic9NztN3ienC1CAELg?=
 =?us-ascii?Q?9jgwAOFN0Oc1IX3WZa7byRuNARPS2kVWM50HC0g5wsRDnn2C7qpE0cl6FjLy?=
 =?us-ascii?Q?QpB2Xnh32Uldxy0y7l4s5C/3ehI2mNQ5H8ePuAh8zrb9KInee/Aly78XmOBW?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f622f5a8-5549-4ba7-4793-08db3ab1f9c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 17:27:07.8323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phN0Ci50I/eVTgZZc1T0kgt9amghVOHTDLRNNhoeSo6OMzkB11sEC3I8EpNH11PGpTEQOsrzyzR+kdt6G8qlGv3NDQveCD4hbVnhJkWvJX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for
 xe->info feature flags
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

On Tue, Apr 11, 2023 at 10:01:01AM -0700, Lucas De Marchi wrote:
> On Tue, Apr 11, 2023 at 08:22:59AM -0700, Matt Roper wrote:
> > On Tue, Apr 11, 2023 at 10:56:37AM +0300, Jani Nikula wrote:
> > > On Tue, 11 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > > On Mon, Apr 10, 2023 at 11:39:08AM -0700, Matt Roper wrote:
> > > >>Replace 'bool' fields with single bits to allow the various device
> > > >>feature flags to pack more tightly.
> > > >
> > > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >
> > > > but a  digression:
> > > >
> > > > for structs like the descriptors in xe_pci.c, this justification is
> > > > enough as we will be maintaining several of those as they extend to
> > > > each platform. Also the access to struct members is contained in
> > > > one place.
> > > >
> > > > However this reasoning can't be generalized to structs like xe_device,
> > > > that has one allocated per device. The gain should be very minimal if
> > > > any at all.
> > > >
> > > > 1) Each place accessing one of these fields will have more
> > > > instructions generated to use the right bit although in most cases
> > > > the compiler should swap a cmpb with testb since we are likely just
> > > > checking if the feature is available or not.
> > > >
> > > > 2) It also limits the ability to pass them by address.
> > > >
> > > > 3) We also need to be careful when changing
> > > > bool -> u8 as they don't have the same semantics in cases like
> > > > `b = true; b++;`, which may not be obvious in some cases.
> > > >
> > > > for (1), the pro/con should be really small, (2) we should get a
> > > > compiler error if we tried. But for (3)... we need to check all the
> > > > fields we are converting to make sure this doesn't introduce bugs.  I'm
> > > > on the fence on the need for this change, but I'm ok with it.  I double
> > > > checked all the members in the struct and didn't find use cases that
> > > > would introduce a bug, hence my r-b above.
> > > 
> > > bloat-o-meter results with both might be interesting, for code and
> > > data. Does the data saving matter if we bloat code more?
> > 
> > bloat-o-meter indicates that the code size reduces:
> > 
> >        Total: Before=330210, After=325432, chg -1.45%
> > 
> > Does packing these let the compiler combine multiple feature flag tests
> > into a single instruction (e.g., HAS_FOO(xe) && HAS_BAR(xe))?
> 
> yes, that is possible.
> 
> > 
> > size:
> > 
> >   text    data     bss     dec     hex filename
> > 467248   66607     880  534735   828cf drivers/gpu/drm/xe/xe.ko.orig
> > 458855   63394     880  523129   7fb79 drivers/gpu/drm/xe/xe.ko
> 
> but this really surprising. 8K of text?? That doesn't match what I see here with
> this patch applied, but my config has more debug enabled (and had
> display enabled, that I disabled to be closer to yours):
> 
> 	$ ./scripts/bloat-o-meter build64/drivers/gpu/drm/xe/xe.ko.old build64/drivers/gpu/drm/xe/xe.ko
> 	add/remove: 0/0 grow/shrink: 34/6 up/down: 320/-257 (63)
> 	Function                                     old     new   delta
> 	xe_info_init                                1991    2039     +48
> 	...
> 	xe_guc_init                                 1426    1232    -194
> 	Total: Before=477778, After=477841, chg +0.01%
> 
> 	$ size build64/drivers/gpu/drm/xe/xe.ko.old
> build64/drivers/gpu/drm/xe/xe.ko 	   text    data     bss     dec     hex
> filename
> 	 775924  174199    3584  953707   e8d6b build64/drivers/gpu/drm/xe/xe.ko.old
> 	 775896  174199    3584  953679   e8d4f build64/drivers/gpu/drm/xe/xe.ko
> 
> This is more inline with what I expected: very small changes everywhere.
> Not sure why they disagree wrt overal increase/decrease though, maybe
> alignment.

CONFIG_UBSAN apparently.  Comparing a handful of .s files I see a bunch
of UBSAN stuff in different spots between before/after builds.  If I
turn off that config option and rebuild I get numbers more like yours:

    add/remove: 0/0 grow/shrink: 13/5 up/down: 181/-108 (73)
    ...
    Total: Before=300434, After=300507, chg +0.02%


Matt

> Which would mean the change is basically lost in the noise.
> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> > > 
> > > >
> > > >
> > > > Lucas De Marchi
> > > >
> > > >>
> > > >>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > >>---
> > > >> drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
> > > >> 1 file changed, 11 insertions(+), 10 deletions(-)
> > > >>
> > > >>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > >>index f5399b284e3b..9ce6e348dd29 100644
> > > >>--- a/drivers/gpu/drm/xe/xe_device_types.h
> > > >>+++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > >>@@ -67,8 +67,6 @@ struct xe_device {
> > > >> 		u32 media_verx100;
> > > >> 		/** @mem_region_mask: mask of valid memory regions */
> > > >> 		u32 mem_region_mask;
> > > >>-		/** @is_dgfx: is discrete device */
> > > >>-		bool is_dgfx;
> > > >> 		/** @platform: XE platform enum */
> > > >> 		enum xe_platform platform;
> > > >> 		/** @subplatform: XE subplatform enum */
> > > >>@@ -87,22 +85,25 @@ struct xe_device {
> > > >> 		u8 tile_count;
> > > >> 		/** @vm_max_level: Max VM level */
> > > >> 		u8 vm_max_level;
> > > >>+
> > > >>+		/** @is_dgfx: is discrete device */
> > > >>+		u8 is_dgfx:1;
> > > >> 		/** @supports_usm: Supports unified shared memory */
> > > >>-		bool supports_usm;
> > > >>+		u8 supports_usm:1;
> > > >> 		/** @has_asid: Has address space ID */
> > > >>-		bool has_asid;
> > > >>+		u8 has_asid:1;
> > > >> 		/** @enable_guc: GuC submission enabled */
> > > >>-		bool enable_guc;
> > > >>+		u8 enable_guc:1;
> > > >> 		/** @has_flat_ccs: Whether flat CCS metadata is used */
> > > >>-		bool has_flat_ccs;
> > > >>+		u8 has_flat_ccs:1;
> > > >> 		/** @has_4tile: Whether tile-4 tiling is supported */
> > > >>-		bool has_4tile;
> > > >>+		u8 has_4tile:1;
> > > >> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> > > >>-		bool has_range_tlb_invalidation;
> > > >>+		u8 has_range_tlb_invalidation:1;
> > > >> 		/** @has_link_copy_engines: Whether the platform has link copy engines */
> > > >>-		bool has_link_copy_engine;
> > > >>+		u8 has_link_copy_engine:1;
> > > >> 		/** @enable_display: display enabled */
> > > >>-		bool enable_display;
> > > >>+		u8 enable_display:1;
> > > >>
> > > >> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > >> 		struct xe_device_display_info {
> > > >>--
> > > >>2.39.2
> > > >>
> > > 
> > > --
> > > Jani Nikula, Intel Open Source Graphics Center
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
