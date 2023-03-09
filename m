Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E64EC61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 04:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BAB10E027;
	Thu,  9 Mar 2023 04:51:28 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C129610E027
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 04:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678337486; x=1709873486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+rIn6gnWb2hKnz3t8KAeGeYeuyFckMvre/hlHhFHxf8=;
 b=U7jPU6XKavKSjfegKgdRCtS3ED0EaRmdyboe40F+GrN/zC1fkKu4vFyp
 pfxAZ/ffupjpT4ws+5fS5SBIhKYRLb7qWHKMGxHRwVV/Ox83uEtsTplul
 3Mv5Am28lZtFaNxt+vdubKbBiltOT6hn5EHDGtykXW1JJzO5S11zW82FU
 6Y5JQmCBetdO0xuCC3zHF8MUuQCyjzOTeLP8d1ogHh5nHCk6v9iA37TjD
 lXP4p6zqjdXEQbJ4tcxy5BKE2SIyw/AsZPuD+FNXi/1Xwms/LqhjSoc6B
 shDJ7y9IUZijcjes8UWzOgZkv4Uysicmt1SHHUBvufLcR7+2Q9ZbndLLh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316747275"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="316747275"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 20:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787419899"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="787419899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 20:51:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 20:51:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 20:51:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 20:51:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 20:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK11PecHJp/HJMNJp/HXtUgiHzotIgKkQr5B47SYA/1oydrChOGP6bOuSGxZu8dqDuIh5IhmaY4pnr9dmonHlvhDCcU/dESDSOThfVg0QhjD16BZoMVtv1sfYWk4ko/Ez8mzRVwF8eDTvsZQLv2XCtH05dczdf93Zaot3hmaXWJzBJj63WlfC5dSArIf0mhBAaAq32XfT90ODmw0OH893gA988Fm2r092HXTIuu6TUmspAZJHkYzi/N6yA4FgW6MlyCeD/02JUDG2EE9ESDiFw8TnquJ5Hsj84E9xR1lBX5SwnXBrlR5MX0+PkkDfEygmNctUY1cIS7OvhOa1yyq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB0dCHIkBti2vTvhDny+PnNf0uwXhUSwBGs6ewM6NzE=;
 b=kLlR3EWEFgWtXg86qbvKpIVAxrKN1XIo2PHV8IC72EsTZO1KtCzIr0eZgciX70iV69gw5oekHkPOJiusCM7A6WS04/9BFyx9b2dspQLjJATQB260pTMgoPtKMauV+E2Z8QVYWryVtl+nEN33RqomZKpWWSa+uHX5ZlEB3F92flZTdjBIlflfJNqMZzk60ys7rBJ3kGMjIjXzNtqqImG+KvIxe2BiYrCsOBNW70M2hicdEO/IUA0HMW8DNdhtEUc4tIaiJaeC3u/xX+Uc4EAuEB0gXkuvHCP5Xj0D+WXsbal2L+1HuSMJtB/KujZ2RrnJPIyYAhFX6dw8lLhZdB1pfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 04:51:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 04:51:09 +0000
Date: Wed, 8 Mar 2023 20:51:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230309045107.kayv63tfzq6i4o2b@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
 <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
 <20230308224355.GH1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308224355.GH1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: a0679b2c-e642-4ce5-15f6-08db2059e670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25DVT5S5OuMrOXz57CACZpiYOW8omHdV5L07pvdQpm9iwwEWxT5U8q2IF5vjTgd8aaeyAR1i9sscMHZ/TlyDUSAMB7KNK+PH3pO35xlYfuGoyL2xfzb/Tp3HUuFFD09WHpUnZaAkQUiM8PpY8vrMEbgETh34xWZsNZvg9ZA/yTjFyHZRj1qdWfNsBJ5dNGwIh3WPyhMjlaAYHx5d1dgn4ujVF9UQLbXsg8cfcb9GmG2L2WhJBAQASek43En8vRjRPMK2DQDiBjUtBP83QIJrVGLRNBdTy8MZbaENxSjUB2sY+YpWv6haoq6XU+g9kSYXX1h+S5YxG0mftpheKFAgcFXoTU6Aip9MfSceyLGQ3JKtNx4meHRHql4pe1DDkYe11fai+fevsj0ptMQaZ/1npYnkGSVsw84XtP793jvEd3fdu400+QSiS7yIlfG8eCyQxhY2qB3+r7yxtq3eXW8TwFFRwKDBFpxQ3+1+v0MHmwEvXcB/LPSv4pYbBp6lVrxDXBaa1pxGony5d4EMpby7NqCkf0rlXdtXXuN0fi8cMB6OfRwQ73TOo0KiT3KrmCdCt1SMK4gIdQfKy64UerQePkhmR8IPE0970a3PTeizhdWQLTtvJNY8nJqn4dajMThfKV8fj85kZL1J7bDTPx/n6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(4326008)(36756003)(6862004)(66556008)(2906002)(5660300002)(82960400001)(38100700002)(86362001)(66476007)(8676002)(8936002)(41300700001)(66946007)(478600001)(1076003)(6512007)(6486002)(6506007)(316002)(6636002)(83380400001)(186003)(26005)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V/emPXtGGmjz27rFTX4RCJkNF8WKKfV9dBQu+vFQgooj+0o+Z2W7OQdHSeBH?=
 =?us-ascii?Q?8/wEghRjjcTTbqvyHuxeqshpro0yy5+P9UM6ZubIdE2iYQxEfP+UhjOSZZsQ?=
 =?us-ascii?Q?3dzOTgQxE+X8PqGdQjcoyshGo37faWk1sx2utU0fKiD67YbCzPJGYSSyvUV6?=
 =?us-ascii?Q?wc9+wyo+g17+J9uHehl9dCu/ffF9VDkn9xRsNBxJ83rxZVQKGJ6w/w8q6bP0?=
 =?us-ascii?Q?0ojTEJhQB49pXFToQOUdm+bZHBYN8LifCd/Mb+NSWaT3/LG1oH9+ZN3Y+GEP?=
 =?us-ascii?Q?mjRWgIV/l17dku67vePe/inqyRYyodlNcgt4YlWHLmCrK9B8n+WYIZr6Wu7W?=
 =?us-ascii?Q?gKY2rO4mTM8dgquDkxi9YhJvI2Kbeg2QX/iHMeSasJ/zmFLUL3NU6KDT9ARu?=
 =?us-ascii?Q?luR6hU1mGTLMGWAtVdZnY8LKBEbANHiE3KqR+m6YaNd3oe7sev0mNrkjbj26?=
 =?us-ascii?Q?eNVYCpzew3LUWE2JJl47zZtsSvK3K8bOOoZEX5r5CPIEwgdII9/PhDeJLTvu?=
 =?us-ascii?Q?cGrykH+Q17a9WVUguPA+uhKxefDSxcbOkV6T14YXfsYXAAmBUfNvFRWUKaZu?=
 =?us-ascii?Q?Cu/iiSt8CYLLpBCIMZQAa8FnQlrKWKjbnZ0jNOWhIyuNzc1wNYWPHEBtm2vP?=
 =?us-ascii?Q?e1OdabRxpeXOsgduiW5yPwNZ0wLS0vJlq1S2SxwwiHYAHgySvWJYEDxvt2rN?=
 =?us-ascii?Q?iGlXYVb5IsSciOoChngQa09RHnLIph6M5SOn+XzZm+4KcVKLMLgwtL16jBH4?=
 =?us-ascii?Q?pYKcv9aM1Jh2lHK0PukSFz3xtWQzPcR48RSEnK6YYWHTwqfGEgAJ1BHC2tTh?=
 =?us-ascii?Q?KVuy6jVKBn49MBnvLVygLxcmKTrLbKIrPXL0dcOLEaAHpJCJESTSU1TmKABj?=
 =?us-ascii?Q?RdHgWfjNcl3520BYqI4QQlZCL+WRGkCeOjoETq/eGvXaQAtbKhwU00zFg07U?=
 =?us-ascii?Q?WLzBXRczEyDSkSVDxbyzr0S6gw2oYRuw1ukHThkOT65G5A6jDUzJQJx//sjt?=
 =?us-ascii?Q?DmlngAp2eZNbnRu014u85rpdilJfZSEwh4JaYfkkcINKGqGFrd/m+AW0Oahe?=
 =?us-ascii?Q?RFCHR90cJ/VcIK/vC6aBCGBQAm/xNtKF4QUT2BBCA/ezLNzlhjPJtU4UWVXD?=
 =?us-ascii?Q?pNS/WUl/lAagWmoVDSN57Q2ZDDT/SJkjW07MxYSC7Kdq/s6y7xn3k6x1fKo2?=
 =?us-ascii?Q?cyweJRBV1qG+pMKyvB0KK40amkH+CDbJ+Zi386Sv6/sQuETencaS9WtB7lz4?=
 =?us-ascii?Q?Xv80O7cQraBcZvXpTHL9BUAJONgJ6Z7sPU8jDdf5D50qvaeIaobW+N+ICJui?=
 =?us-ascii?Q?glZFHmNlRlznAhXpG5oZYjHRub0PdgXJWbQgCE4o66nF8dAp296jWNFsm8Gh?=
 =?us-ascii?Q?IM/yc2p/Y5KS2hgIRyUbbUwAD+UlcbU8wjn3EEL0X6t6+2em6P1vq4zpvNyc?=
 =?us-ascii?Q?8veWZu9INZI4te/3pupyRthWJagyBRCRS6GbBhK7i//vA4rXlA5F7sCrOR9Z?=
 =?us-ascii?Q?CKrCYEwNS5ymZIUD6vEDliML7I5hh3Q+Dhtdonc5DmHYo3wJBr0xQmz8/Qaq?=
 =?us-ascii?Q?aLEgKEqWWsJVTtsr8YEnHv/Rgr4NK4zrEYK45G9Fsr7F8JrY7IhuI9tp27IH?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0679b2c-e642-4ce5-15f6-08db2059e670
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 04:51:09.5215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdvSttr8SjKVk4TL4KkNQLQymmruViHX+ektRQbuxqsg3+9TjncH1+1oMYL4gNymv0WZWxa0xfRKDe0G6UgTvoUvilktDXZ8XhGvQYo+yRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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

On Wed, Mar 08, 2023 at 02:43:55PM -0800, Matt Roper wrote:
>On Wed, Mar 08, 2023 at 02:20:17PM -0800, Lucas De Marchi wrote:
>> On Wed, Mar 08, 2023 at 02:16:48PM -0800, Lucas De Marchi wrote:
>> > On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
>> > > On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
>> > > > This is already used in intel_gt_mcr and will be used in workarounds.
>> > > > Add helpers so the platform-dependency is in a single place.
>> > > >
>> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
>> > > > drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
>> > > > drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
>> > > > 3 files changed, 10 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > > index a42061c4b9d2..694a79b40ec0 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > > @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
>> > > > {
>> > > > 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>> > > > 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>> > > > -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> > > > +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
>> > > >
>> > > > 	gt->steering[DSS].group_target = dss / dss_per_grp;
>> > > > 	gt->steering[DSS].instance_target = dss % dss_per_grp;
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > > > index 967f2349c67a..9fe06a46a400 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > > > @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>> > > >
>> > > > }
>> > > >
>> > > > +unsigned int
>> > > > +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
>> > >
>> > > When this shows up as a general interface, it leaves me wondering what a
>> > > "group" is.  The rules for DSS steering happen to use gslices on Xe_HP
>> > > platforms and cslices on Xe_HPC platforms, but that's just the
>> > > platform-specific rules of steering and doesn't automatically translate
>> > > into which type of slice would be appropriate to use as a grouping
>> > > elsewhere in the driver.
>> >
>> > humn... maybe I myself didn't understand the group meaning here.
>> > is group a generic term for cslice/gslice?
>>
>> btw the term "group" is already used in e.g. xe_dss_mask_group_ffs()
>> exported in drivers/gpu/drm/xe/xe_gt_topology.h
>
>Right, but that's just working on an arbitrary grouping of bits (of any
>size).  The definition of "group" in that case is explicitly provided by
>the caller via parameters; the function itself doesn't decide what a
>group is.


so.. do you think documentation for what this is should be provided and
be sufficient? Otherwise, if you prefer not to expose this, how should
we implement xe_rtp_match_first_gslice_fused_off()? Just hardcode it as
4?  I was trying to avoid the word "slice" so I used the word group as
it is used around this code. Maybe I shouldn't.

What about the following?

  /**
   * xe_gt_topology_get_dss_per_slice - Get number of dss per slice
   * @gt: ...
   *
   * Each slice in the GT contains up to a fixed number of DSS. This
   * can be used when the ``g_dss_mask`` / ``c_dss_mask`` saved needs
   * to be interpreted on a per-slice basis.
   *
   * Returns: Number of DSS per slice to use with [gc]_dss_mask
   */


thanks
Lucas De Marchi
