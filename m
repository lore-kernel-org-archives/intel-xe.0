Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65060C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 21:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B410E873;
	Tue, 21 Mar 2023 21:49:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671EE10E873
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679435345; x=1710971345;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i8ELLa/mLXeXtmFS17fC8PyaUXIA9aA5yNVZjoiE1ZI=;
 b=XA2EzxLJfXTSm5NLQs8h696786DHUsz3HxS1CBx9yWkUD4hXKiI16VdA
 96Cj/Cq7W9opmjEi2KzmkCQYHE4KlWjdk0jFu047Ezcf7l26BWFcGEoXM
 IxcqO44cyoRxqC8a0AjpethPUBuAwj61jCRO+IT7kIim9YekUp0dcvjMW
 PiRNV1sDegl8mpopzONCqhvTzVWd2nGVSkw5bsIdnEsPd8qdTlDbCT4oM
 BBz43TYGNo1QF88wcj3H/xSFrKrsIYHMx6vBVoj+wBEmyRMerGgAKTtTu
 km279cWhFKO0Az4zrRqZqEQlUHUgIuIQoAmUypTSxLz6bj9H3fbBbMrYe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366804069"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="366804069"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 14:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="855870892"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="855870892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2023 14:49:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:49:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 14:49:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 14:49:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLx8yWuv8cvKHH9bXFzmZYK3PIpRLCxuMX8zM8O3+hQCRyacBRLHXw7RjqYxUuiCp28lgkBqFACoIjgM7kEjf4WuEYHlrE9nTyaDZ0sZew3HoOEHFcZO3FesncAMulghRaOux8U4faRN1w1dpEu9LqLL/R/1diRddUubWHz3Wt6eSswg8lst9237EJ0ecI6yeKlgXrCtdQxgGnSYgPbaABuqjvfmEPV5Z66zm378J6yQ0u20TPQW1CiB2ZrqDcrnCu2YUwQruq7a2MFafT/oXdhuBcycVbcIGw9DcwOoWEq4OKzuMd10Ezl+g7y2fvILJWTzgHDxl5NazLAo4xUdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyPA+V2i2o76ZrEyUFJ4/zwTbMCzKgvxvlfuwkdjf14=;
 b=csuazKtEawJMIDL+DlcyYIMFoSnHHsY9L6nBjkJhSCUJb/S/taapfrOWMZlwr+euDrFMKVizfFLB0lpTF4gJ/9i1JVgcektT0HjHXdYpXpB0o93VAuSsAHTR9/7DAbGj7bv491WJijmOknspx/Vx3hOt6w5ig/a/2bXvbkU4B6chJUD+xtsNzb8ijitmjckfElZnWP6hfP7jByxhN7jXy2UyD70uhk/yk/5Or0BYi59qK6e19wN4HfB20Ppx8p/VvDk48nCLnAHSQ4l0ujul3xZewPUpWgbwLFWwbBefCbIxgOpWaec2hw/NsJ0BzTlCuZuvJbeFNLQqTnGTg1QcDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.36; Tue, 21 Mar 2023 21:49:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:49:02 +0000
Date: Tue, 21 Mar 2023 14:48:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
 <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
X-ClientProxiedBy: BY5PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5059:EE_
X-MS-Office365-Filtering-Correlation-Id: 095921e1-c920-426b-4a08-08db2a561576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSZJwEGF6ARVXeIMgfw51m2H/PhaqeNcgq0qAowR6F7wumI/LqfVBXY/2mmu+y8DX8V9P669+9IuF4S3yItmsH3481RfUH9dKf4XZLxwbuIfG4GFkK+TthPTuR1d7P4A6Rzo2hZMOZhbrSIMDcwSrsOrm7VJm3NdbapK/4cyWEFvR/1y7zlzZJqGb8849l+PagmlJCXRKfOSOuHFx+tEVdtIgunk/pe9GMjXa3wwsN9TOSaW/tzo/tTSOuzCxaNkCXGKsJ/vnEFcbLVQ0sVVxYzjRs7oWtepAx3ZayI3CRUZ9ymZH+mTe3ohV98YUrvv2pTMAEVbIqDoxHpz5VtrXlvvglyoIIO0eVqcJmnGmOhMRR6kbylUMPRZXPbzsqx8BQUgIe8phypiVjqZ7rUkSxD7/afdNfn13V3/s4bZorLaT7b4LibJTZazwu0tNEq9cp25aLxfc2r7lB/BJi+fshozw8I4H21SqI/vhC794dySar1uXwLoFpDv4VxQlR1HOn8gtWTuXaZcgbRnfH0RXjGopLnVFFzazXoi3+VL0LkulOI1Z8/8zVrIYFShL3KMfeSUdOxdNoVBYUbD8nGx72KgkF7exGjwctvNbEf+sBM03YZU9E+HOdqDfE44rDhZDDwdEHdpnYgzQBktxv7qIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199018)(316002)(6636002)(6486002)(41300700001)(478600001)(8936002)(6862004)(4326008)(8676002)(6512007)(6506007)(26005)(6666004)(1076003)(186003)(5660300002)(2906002)(83380400001)(33656002)(82960400001)(38100700002)(66946007)(66556008)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMPPwGmdEkdqJ8d406Tii2L4ducSUFeFyZPdL/ae/8RiRrnQJQSSwh1Q2Fth?=
 =?us-ascii?Q?4qXFX8jx7GE8X01LOY98dvrxY4KOKPW3/CyNYT97sfiHnkeJR9hSucnnKZQ1?=
 =?us-ascii?Q?1VMEz+wjITUXs9VR9QxytDfv6v7IBCIHh+x5hEi5lq3Yba3mzPoVtI/GroIg?=
 =?us-ascii?Q?BuCy2nKbBqvr/GmshTmRe58Wk/ZBCcNhgoOCdZfce4bqyRDw+WTunBv/kmm7?=
 =?us-ascii?Q?IYNJ2HwftZZIFgS69KvcLh/KYh8iMKWntMi6/OQHxj0BuxUH6nL54RYXFkqT?=
 =?us-ascii?Q?0WnhQsA6IfT5+JCFkCvqb2Ww9w1JCuuYNS5sLMfUPsXkmeX9uCYgpjuAm4fP?=
 =?us-ascii?Q?C7axfVMrcTEDWVWwQI9aWg9ZtdK5lNmOJ7GjXPQ6K3FTP7T0s/2PBU8T3wdH?=
 =?us-ascii?Q?4N2BuMwyV+bYQH9bh8zfdzpBjy/iB939iRSLcswEVDs8J+f/v2R9jvS45ZqQ?=
 =?us-ascii?Q?la+VWN0u0+XTkuRIT/eWARYQMZJnMflI9Bp31SkBW7UM72fiz8+SnhDOmHWx?=
 =?us-ascii?Q?Gy0wbp16FYn6Skuq1tsxOoHm9y103v6GTJZ4RlFK345oBT5GoW1AakZjrd1W?=
 =?us-ascii?Q?NZcnk4y08Q+kRDpN87wEy8xRRTsBhJFJXsV/DprQ8ymonTUKwJtiL2Dj82My?=
 =?us-ascii?Q?qTjuZqXZJqEVOWO3ZOFeM7d8lA+c9Z3agR5RAC59Y22PWvAaDoBbf+AgwGO4?=
 =?us-ascii?Q?IuNrcvxTlqaezcMiTu3RllmW3OZYLbIRml2fRtTENzPIIa1g3sux8gWU3TX5?=
 =?us-ascii?Q?x2dseH/7lLf/vFku0CEY6FF5IrOpEAdKFsJORDVLrS4eBY+2FlBYoS8Rud9b?=
 =?us-ascii?Q?wDZe3lnhA1oxDYXtcMFU9GG9gYyNpndVoOOAaqBzh6cu4jZLnmXZoGmb6ybC?=
 =?us-ascii?Q?Beb+X38gf2J/7iqu5iTFxjnZpWnkxVW8LswJqMaTmvTaGnVu1b2qT9ImIp0G?=
 =?us-ascii?Q?HQ1h335uvz+P0/73J4vzfxjlJxe1l2G65d500fy50wq4c2RezgEoJ9jJHPCy?=
 =?us-ascii?Q?/KcBoJKVhICDW3XhV79Uz6vHOj8q+sOM/eKpBaYJma9WcRqtcfeXEZ/DUiKY?=
 =?us-ascii?Q?AsCCZ9F7zswvcs2pPOtG9TVNmcW9w0wjqfulPfkEHYHvepBOblmCLX8h2KNP?=
 =?us-ascii?Q?76HR/luB+3u4h6OrZMTHOrNrYmUUjXx5ZDS682oUiq0FdmeuJkYDcVDa6HH7?=
 =?us-ascii?Q?R6GbFMH+Rl8eO6phalDp9la12UzFugf5b1RVZmNP8X1Ubk3zCFVa1gTkU+c/?=
 =?us-ascii?Q?e8kjsv6oZ74ms+RLCIT4QBTYL4w3Lo0NAN+z9KHdHh/K7wFdz7LSUzmxlSSL?=
 =?us-ascii?Q?co+fXvTyTzgzE4egrNxY9RS0Qcq+hFsbk/s/aeg7Ud1+ank2CBLTj42wCLQb?=
 =?us-ascii?Q?lNBG/Xuy003FzbjgqoRg8l96tsjhe3dsnOx6AiwiNIKqcOCrxNwoFS8VWIPj?=
 =?us-ascii?Q?JsZrAvpbtyBcIXi8tzcRuWX1hpuHBLe6+IzZgl92P1VBGaZ7Go2AudnLfvWc?=
 =?us-ascii?Q?NyJpfuA5uT2Xdd809bewPiihOz4gNdIHwNg+FIdIthsPMq7yHYZ2Ui9W4Xgo?=
 =?us-ascii?Q?38hulLgp+nsZ7F8sf2mZpKsMF9MpDwb2t/9AkS7+9vSau3HDAs56JHWcC7Ai?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 095921e1-c920-426b-4a08-08db2a561576
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:49:02.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIBacV+BM7XZIiLPgzADa1FDrQyAHzoL1PeWMnxcC6kJxxGpKqP3aHusj3Jhx7RQb/V2n7zCyZ2jxaVLLAd/1C+7xqMrIrWtTroxKlyancY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
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

On Tue, Mar 21, 2023 at 02:03:49PM -0700, Lucas De Marchi wrote:
> On Tue, Mar 21, 2023 at 08:50:59AM -0700, Matt Roper wrote:
> > On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
> > > Follow the new direction of firmware and add macro
> > > support for loading unversioned HuC.
> > > 
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > index e2e5f7fbe9db..3c522d970228 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
> > >  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
> > >  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
> > > 
> > > -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> > > +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
> > 
> > Why do we still need the old versioned filename?  Can't we get rid of it
> > completely?  There's no backwards compatibility necessary on Xe yet so
> > this is our chance to eliminate the version numbers on HuC completely.
> > It's not clear to me why we're still using huc_def instead of huc_raw
> > below either.
> 
> note the version is saved to uc_fw->major_ver_wanted and
> uc_fw->minor_ver_wanted.

I thought we didn't want to use those for HuC, only for GuC?  Since the
kernel doesn't interact with the firmware at all, there's no need for us
to enforce any kind of minimum version check as far as I can see.  We
don't even care about the major version number, which is why it isn't
included in the filename we load, right?


Matt

> 
> Later when we are parsing the blob we read the version that is encoded
> inside the blob (rather than on the filename).  See xe_uc_fw_init().
> I think the version check is still makes sense:
> major should never change and minor has to be equal on greater than
> the one we first started supporting.
> 
> The version in the filename needs to be removed, however the version in
> the table I believe can stay... it should basically check the minimum
> version required. We could rename s/minor_ver_wanted/minor_ver_minimum/
> to clarify.  And comments on top of the macro definition to document.
> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
