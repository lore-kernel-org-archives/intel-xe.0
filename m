Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FF5E92702
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 14:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3964B10E16F;
	Thu,  5 Oct 2023 14:10:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972EB10E16F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696515036; x=1728051036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W3PA78+w5HNJAdYhZIOnsbLgDuMp+FflFrajcgSGGzA=;
 b=K3H8dLOu4W50a2xu6P7A8nmLPXrnj9IiGdssduR1yy5UFofy4Esx5C6Q
 H16C4hW5evl/CBnjK4qGJAGq376NbpJIkGZg2LwjrEwh2qxu8MlYTXw1B
 2j2dYtrfdJvJcwxCw6MiFculyYNnuwjx1hVL0/lxQXfApeZ+5IEa6svy0
 rhFjkg9BkCxJksbt2d3a899jl//CzjzO4X43oyipp8mfOnUOAf+DYp9dX
 7MCMwE9m/erLtbW6oF5RHXTPHm7yx4ZWeXRh8BJDd/8KhoF5RYjkpLqJO
 8ig9/YrMc9HT1VSE534n+ovtJhM5N9Ar22OkxUHZQkR80qHmsdE2DBo71 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387384790"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="387384790"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="751782965"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="751782965"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 07:10:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 07:10:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 07:10:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 07:10:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 07:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULwIHPVHpr7ThlYGy3qt94xuILHEJ76ewq9OK0ClzxqRwzfLUtSzLAAt/J+qdYysuigGqxlu9piw4wrDYqGLubIpUV/CkpjK92h5+unK8T8Dfl1WhTiazS/kj9nkA0GWMxqQUAuqxH/OAE4wzPgCTwHEKZLCZn1KuXvs+LsG+u6jf8HTrc8decmQgmeODCWl3JCmy1rFPW8vW6Fr3DrwQ2Rk/7/TI2WZfnqXGNXIYHMJUmFQommGfli7L7OvLr6STeyWPA211yZp5bnd4X47VYZbXrFWxtHY7/ukxy5YfpJgKGu//96iOm/SXCxpKVd/gRkCBPzZSSu+H7pZuXhImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWEbd0ufjuE0MeGWlrXItu3SgllOBeVzGyN7drymoFU=;
 b=KNHRCcLb1InGv60Hq/xy4+ug5C4KrnMDxpgZwm9lmjE+qncJFiS4OmL8U94eImvob7nTmBxQra1iv8c9HqUbbHb8xBbt8G8NpT7cbGUaHIAgxpbdAal4h5E4evPVLsBHmUnz5tUJI19X+26y7UlbE0u3y8Vvh1R2YQYt0ycGdLZfUkPyhhjzkyBY89UrL3vIfAicym/7JMR1XdtQGsHZDv3u8uDIEjzradxRB8xjZp/QinFBjOsBKZ9w0Xky2pb6jOsoLocvJfyuUdVD72ubqD6pGI4GEU4UTtjQcbNnAzxhXVBUYT35qt3u31CmaKRTDQknQmfj6B3LO6v8Sl7yNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 14:10:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 14:10:16 +0000
Date: Thu, 5 Oct 2023 10:10:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZR7Dwya2Oy1fjG/g@intel.com>
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
 <ZR2SMB3j1wZ6Oxqc@intel.com>
 <SJ0PR11MB586601A1BB6CB8FD858A358A81CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
 <bkn4zknwieodhmi7actm3v2lstt53qvhud4nnw3k6sh35kk6c5@xmkkx5xfo4gc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bkn4zknwieodhmi7actm3v2lstt53qvhud4nnw3k6sh35kk6c5@xmkkx5xfo4gc>
X-ClientProxiedBy: MW4PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:303:8c::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfbe676-6c75-40e2-a656-08dbc5accc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsAy6GI4spDkzMbyjOyYkaGemdeZ28UeQAwPrVtzUOGAIqsViPDYWiIFhwE5rLGBmOSgpDp2LXoW/KolrxN5AH37r9DAkaEhRsHu9eHsM9idCctvbxeGmzdEjfAjEdEK1cklKjKhamZ7PTwh6e1124VhkaUvH9wevX6P380fp0EcQierVXsH+wds5ZyvjKcjc9jkVWqiQP066Q14AEzEhKDKwk0IZV0cvTYi4vHo9Owe4H6N/n/WtC5GR2kKqxlPp8hHHmVAzEy57cMXJseQmjjRSmtrzoczGrvaEbtddBgQpbqJv+UF7ICuRA59x6BfFOXxRXXfjOwMdP2JYY/F+x7IJyF9VhuVn/+o65AcvuIxRzjITYcyKgeUUzBhCzNyh0790M1kIICpCiCZpdSDw7z7sVKefcJUOzniT3IgI6zADgyhf3eKy/E4PaIrsJqGadpU93kdpMDYVFxP524HO1JiIAntmXIe3ol7eoe6dr+6hjCYssWnepJAqm20MSFTMJNQYMIdjRsCVsLZ1dooxmx/evLa9MdDujFSUjVAy1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6506007)(6486002)(6512007)(6666004)(478600001)(966005)(53546011)(86362001)(38100700002)(82960400001)(2906002)(83380400001)(26005)(2616005)(36756003)(44832011)(54906003)(37006003)(66476007)(66556008)(66946007)(5660300002)(41300700001)(6636002)(8676002)(8936002)(316002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YoqAJrAF369fsJC2XgRiBNXWsST+/R68Z9gREB5R9616PJiQ3iD2zEpYm8cb?=
 =?us-ascii?Q?EQhfsdBPtxUmXsumL/8oOMUZW8HzybFROIQmNBZo7EKTcaezrO+rZ8FgmEy6?=
 =?us-ascii?Q?WWV80d+AkK367+2xkgZz47C9gnuVHimECiCRcBtuWl3R0OIGO9VrBVXQkm9k?=
 =?us-ascii?Q?wG5X6fZ0vTwbHfc8/80B40WindK7N8XIYMqqbRPPuWstVj77rR/CnMuxCq+n?=
 =?us-ascii?Q?qg2gkXKx6iPk9j5/xSVqG2Bz+TR9utHthBzqS8ihxs+3eOQa5xstEEnGFXjP?=
 =?us-ascii?Q?bJwy2xAcjsm2yMK+NBjBacKMr1jmvISC3P5PMaB30hbMjQ9BmCJdg+SsL4Sh?=
 =?us-ascii?Q?c+RkygWeqnuY9GpRMLBm+Jd9VJeKWgxzLFmQN4NAK6dg39ExAiBLe1CmfCMh?=
 =?us-ascii?Q?wjGMv9GU/nKwsLy+n1Ovgr1T2u4y2oA4bjYcmJTmiPXwWMwja5w9I36rD92p?=
 =?us-ascii?Q?xofAaptMAhtXrwMJ+oMp7aDq0qsEpmgi27MjkYzCyJHkIhdtutMznn5d2gsS?=
 =?us-ascii?Q?9DBPDaICidtKb6wUF/dWkL3D0Zgoh+zzLTiwIAaenCOOGu+WBaNXO1MIgnDv?=
 =?us-ascii?Q?lH6IT6Hak5vvPO5tpff/LbN2yjpVChjlxdl3u/T3kPGTO89YPLDAz8G8NQDm?=
 =?us-ascii?Q?Zj6qe0pIIGSZmwt8V4LKDhd2LgdcFu5NWb9BXhlAyBImqVgj8dwEQ1NTB87P?=
 =?us-ascii?Q?Ya9au+y3sOCRT2bRPNT60E7I409LSublx/+XGBHBs8uAKTdbbsucHUWfIqFe?=
 =?us-ascii?Q?nCrDFaTTfWG/pWmu2u92NTdgJB8UWjgD/u94c7eiXbpqHUAZv8A/B0zHLUBq?=
 =?us-ascii?Q?gaj2n/C/jcmnd+RRk1ILL8giGXiGBlN3ftJGEt2oh4HBuU6omO2NjeB5tNYP?=
 =?us-ascii?Q?ej0UvQf/IR0OZeRfslm/xyn3jzyNabiTqi+70mKmlyByJ+gTKh8E6U8zOJMf?=
 =?us-ascii?Q?5ophoRZkMt3zy1M/69XWFaZWhdktpra12s8IPKBdlop8nH+ov+GwkIlWXByR?=
 =?us-ascii?Q?L7bX7jTIGWwh1f4AcFwUfRhe88tsHMZav/ZbQNJWGaGclbi1rVibHLWh6pPR?=
 =?us-ascii?Q?E/Zl2TxBbEO+orOxwOtuyaV6GTCkzfYEn2FxrRaDKf4eLkZr9OVyyMIaA4WB?=
 =?us-ascii?Q?wo5TS4bvucSGN+kuOWunX8LVVJ76oHcUaN22xzmDx2gMQOlNVxXEnus3cE3W?=
 =?us-ascii?Q?lC8QjpL3XodDAhJhSgAwJpnpQLJhRWzCnoRLzQbWdl83LvgkY/zSf08XQpJp?=
 =?us-ascii?Q?GqdIfcEIrgVMVBRra4gJkBxUntzcaTXBcvWSpx6zeH593OiUqVUsV5p+QZVD?=
 =?us-ascii?Q?2weeEVC9HAgh/i90IzzLoSzifDUxacEkq6g6QclCcOKde91bslqHvbPYfjaj?=
 =?us-ascii?Q?yJ/HAYhVnX9XFSxlMwvqnOta0IDLVntPjsoIfHuNujujv6f9k7dx7ndy/E3Z?=
 =?us-ascii?Q?3odqFSb7O67AyjHCPWUKWCEFWD8Z/kvM+w9QCgwqqUabsKtJ7f76Lw/7YhTE?=
 =?us-ascii?Q?Iu1394FJvuMW5gfE/tmASFyNh7GaM6UkMBLG/Yty3m5xdx31Vhp1oFO2LdT4?=
 =?us-ascii?Q?JWZyd93dIe3nZpXnLcEyB7cQjtaEuwXNkf5XaVnxzQoxg52NhDMqlDziE8s0?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfbe676-6c75-40e2-a656-08dbc5accc50
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 14:10:16.2751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZjNd3gCpuWtLNPDTsuS8V4ooUkJvYTFBe2ztjhDbJQq+hFC1i1SlTqKIvxnawhA0nHrbER5VldujIzdj8tTEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 12:38:11PM -0500, Lucas De Marchi wrote:
> On Wed, Oct 04, 2023 at 05:08:05PM +0000, Kershner, David wrote:
> > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
> > > Vivi
> > > Sent: Wednesday, October 4, 2023 12:26 PM
> > > To: De Marchi, Lucas <lucas.demarchi@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power
> > > attributes
> > > 
> > > On Wed, Oct 04, 2023 at 09:09:32AM -0700, Lucas De Marchi wrote:
> > > > Add missing static to fixup build with W=1
> > > 
> > > https://lore.kernel.org/all/20231003222145.4090918-3-
> > > david.kershner@intel.com/
> > 
> > I'm not sure what the protocol is here, I'm still fixing up the other patch that I
> > have in my series. Should we just drop my patch and have yours go in?
> 
> Quick fixups like this could be sent individually so we don't depend on
> other things to apply.
> 
> I'd rather have this as a fixup (as in this patch) so we don't have the build
> broken in any official release.  If 1 year from now someone is doing a
> bisect and fall in the middle of these commits, they may have to adjust
> their warning settings.

Good point on the bisect breakage. Let's move with fixup this time.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> And of course, we should make sure not to introduce these regressions in
> the first place.
> 
> Lucas De Marchi
> 
> > 
> > David Kershner
> > 
> > > 
> > > >
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > >
> > > > Also I see in the changelog a change adding xe_ prefix to the static
> > > > funtions... that is not the convention most of the driver follow and I
> > > > don't think it should had been done. Anyway, just fixing the more
> > > > immediate issue here.
> > > >
> > > >  drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > b/drivers/gpu/drm/xe/xe_hwmon.c index 1deb5007e1e2..734fcca9f71f
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > @@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon
> > > *hwmon, enum xe_hwmon_reg hwmon_
> > > >  	}
> > > >  }
> > > >
> > > > -int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum
> > > > xe_hwmon_reg hwmon_reg, u64 *value)
> > > > +static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
> > > > +				       enum xe_hwmon_reg hwmon_reg, u64
> > > *value)
> > > >  {
> > > >  	struct xe_reg reg;
> > > >
> > > > --
> > > > 2.40.1
> > > >
