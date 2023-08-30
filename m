Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00DCC83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 19:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5419710E59C;
	Wed, 30 Aug 2023 19:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E9D10E59C
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693424447; x=1724960447;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=04drEVr8rWQqpmkHUmOv9RW8POrJbcd+NbUxIkAwNIM=;
 b=eUx4V+e6UPA9ZAYWx8oDemVnXRiXlIaE8kZqnk7J9q74HVJwFv4RIftU
 8Nt1Km+dbVtHwcQT3QiCgQ4l4rXohLvCAIzvPACOQA/Zu5hPy25a6drGU
 IuZrdXTmDa+t7EdqBUmtUbDx0UZKye6nbgES1CCdvccT1wrnpjQDgecLR
 PQDsqn0acrjz1bdWxeSwaS4A+VYIDeJAP+QxVPmKuJugovPG4aNRvGQDY
 7luMVB8OFWzv6o1ZiiCsEiLPWeFK1WwSYQ6/C73UA0MEQw1ePv2/frO4n
 HOLF3sx4fuX7Wf6tW80BN/xd83ZpyrnPtsfV1PVsORbPWvukt/MwGbmaN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442094286"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="442094286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 12:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689032492"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="689032492"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 30 Aug 2023 12:40:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 12:40:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 12:40:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 12:40:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 12:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASdqCdRm9Ob0dhKOMsZSGCPaE1o8E3Vof28TW/bZezsNN7oFetQmnzX85o8qGXelwfkQRWlXh9RFR/I7C/HSEE3z59HJyby8KzBlW8Va+R6KCNNLQH2N+lkue1uYfSB5wwzZBWH9ulPyyCSiYHUPO5a+u/WZQio9s5DBlftoPVoyBANOCi6L6jBGVg/gaQBVSyufq6h5DWJ03QLIMXVA+hhimONO2Ulf6QHTxgGQMsDP9MNlAXZqk/SeMCa3sO4t/BPX2oldxucVT9b0RAVumuPooKm3n2Ord1YiVuxBc3tyb4u0KuZS6YMKqlOsiH+Po4sA43Q+vx8w0LhZ7sKhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBhqWcLkqSwHJdhe94mhJagU+bA8iR6vQIY24PFMxuU=;
 b=RUyeiLqbHFK+lwNmIGwwP0amj0BKxBspUU1WqrNxLHgdy9ruY7V3hYACV4Xcgp9vmoWOXm6G29+h7qPtU0Ss38Bto+t84ZieS+EJ+EuTGvFcJ0OEgTnr/zhycx9EIq9i9z82dsi13VlmQdkwyJqxE4jIVoNwr7Wg6HJHzox1O47p2Kvczt216IotLZB3XKn848erhVMISVJ0YvW0hWhl67y+SIOrI14PiMubrzyUXR2zeMRJDm8lf5raHMOELkYXC9z45QDKHMjS+mGWSd01KfkWl+m4JsTRVtQ2EAO+0tId5H/V+wkMA7zCCmNEsltYfOAXgW9LNhEVCoyBnn1R9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 19:40:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 19:40:43 +0000
Date: Wed, 30 Aug 2023 12:40:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230830194039.GR1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-11-matthew.auld@intel.com>
 <20230829210839.GM1529860@mdroper-desk1.amr.corp.intel.com>
 <fcb77cfe-bca3-799d-ba37-17e426d02da3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcb77cfe-bca3-799d-ba37-17e426d02da3@intel.com>
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8695f4b9-2d14-4f37-8c1e-08dba990ff68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vm8ogky6233zgrQoqgZkmNVTkLBco5vzCgqmZMdF6B6/gqeQMDWhyKcRnEkoUVYnouDkAvOPqocQ/cK4DQaUNxGXLWYUzI/txztCqTKyPBc8NIhh/KdmiZ5RnCCQOr+RGl64/5jzDA/ituUhZ6ZWP5jCJ8zkRBtdvkI/hRm9SI7BVlwM4BTbuNwS3Y2zVuFGIjp3t3EIDajXjEsGX6zclFEf83uQjjh37kEPfzKBOsrmZD7uI6LEKJ6eo241K/uASgfEzwN07iCqw7Bd5cUFng8opBT3C0dnEaUmJWHiKl8xc5lwEGXqUIEbHxqW1f3OmQLvp873KwyZ3ktMXTHKW1xHXT0+yjjxvESQ0pPRw1tPm9yHEa1mStB9ktVQEajLvkWC3GuY1bFk2zr6Ma0MQjnLtYH9okx7ThKMRTmB9BIOZ41gJptkhuJip4k/acBzqgsZKsv9JpW3xClr/sMHfPUJqTHXBHDW+UdByWeWD30sZGOkd6mMbW1oW+SXHyMvNiSWl8ApWR/ctkrJJ4tm4mPLtJ+Fj4u75vjgGtz6urI83i/o3nUlTgBOzSpCGqCI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(186009)(1800799009)(478600001)(38100700002)(26005)(1076003)(33656002)(66946007)(41300700001)(6512007)(83380400001)(66574015)(54906003)(66476007)(66556008)(82960400001)(53546011)(6486002)(6506007)(316002)(6636002)(6666004)(5660300002)(4326008)(6862004)(8676002)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?edq1FXRmldttwZILQijQtOjhBZ617XbeA6mg/gbLJ/uL5zI9lTxH54FwTv?=
 =?iso-8859-1?Q?5cKiQj+B3wZn+6EV3frZ+GCuDMIhS6yM97TnBAmBQPgheU7ciJrfa2/SgC?=
 =?iso-8859-1?Q?HzVf1q+49D9PG4aACxizyUwGgjAspZLJS/5xRZoABsaiImUMei6fNgqlw/?=
 =?iso-8859-1?Q?7JnY+ePCJ+0toP8RRiawevNzfF/yM2lnFxFD3FJYguDYeIXelqlRLZGV4S?=
 =?iso-8859-1?Q?jie+91X0bmy2dfD0rU6/tn2s8gJ2Ji7grj3dJJD3aEaaHF6X94JTNntV2e?=
 =?iso-8859-1?Q?A36MMWMr6Xerb6KaEzscIMpb0tj2baPp4EyA9ilSD6hUagZtHYHwNWMKzG?=
 =?iso-8859-1?Q?WbDWEAS4ICcmyOpN91xG8DF0RnynjnsH8VUoCaE40++h2Llh7inVDaP08y?=
 =?iso-8859-1?Q?AB9XZsf91IEF82NHVmlCNdIR4oTjRo9QepVgo6BPmJoashLr8Pg/nErlPa?=
 =?iso-8859-1?Q?O1hr1Kr4hVEu2NZ42L+nb65oU0PRapA9xsIRSHya+da+W/NgiPqa+KTaQq?=
 =?iso-8859-1?Q?AQYy7rulIYy+LrBmWo1yzx4Dg1UluF6sEwXfMkr1QCKD985+0AUOaeuz7Q?=
 =?iso-8859-1?Q?i0K14jKrR8tFNLJ7ei9BD8ki7GXKWB50ccPlce9w8XiDMRX9+7sqmT7Nbx?=
 =?iso-8859-1?Q?2m2OZNNYJH3ruqdfIzdMu5Ua3KuWQTl0MgHH+6jSofg3erJYD7GwO3L1XA?=
 =?iso-8859-1?Q?4paIW8G1worEDsascbcPUrDQ7PIwuzhFSV4Lc78WRQICgXlUPwmAHXTwkG?=
 =?iso-8859-1?Q?u/MtEhD6JZtmioYiDvx0NRG449ee+l1hLghsCjiys5Kq5LXO0I2ByhvMl1?=
 =?iso-8859-1?Q?lg2N76ggqMxrT4+QsYUSHVD+GEifnMNit6il98d3TqXaxzMOe9IrozZZIF?=
 =?iso-8859-1?Q?KUuCOrNtAenQGBRYx50T8zzQS9SZb6Voo4uOc0ELEar7LK3VdKhmFov4Mm?=
 =?iso-8859-1?Q?wcnvHCM73ALt+JnRkiTz+xDB3AfFnmQCRkm8L6k4CMV7RHoix7BcYdJjzz?=
 =?iso-8859-1?Q?+bIEbmRiXIAM2A+tmy29NG5TtdJl2fSOfeG4x/S0YYNeI9V9gTLQgb9r57?=
 =?iso-8859-1?Q?JW3pvJtsmtaCMGOiTBccLERh4h25+o8cXZYjdu3s5UHAAnLzwzcqhhJ8Cv?=
 =?iso-8859-1?Q?fivSZxfg7hIPOoq+rseg2Inwvao4TMihF63lx4rLaM9eY/D6t8gjEoX+q/?=
 =?iso-8859-1?Q?x+rIZMRzzNcRBAu62Y91nNrFcI5jG9b939D77HwMQpjVr0mmNbh64T+Glq?=
 =?iso-8859-1?Q?XqI829/ybPG4CcA2xNPPiyAdi4HrMEacJ2qrQT9XhmPVjaTJa5GDKLCtih?=
 =?iso-8859-1?Q?lHouWRj0X1aix34osQpBs7WZWZMD4VfiQgzgSsYZ5+tYXh4Z+geEnHsr//?=
 =?iso-8859-1?Q?3qGHgegg/rLhrvR6jvgcbEzB+1BW89RoKPsEye0DVrHA2Dj+dFn/RuFg8M?=
 =?iso-8859-1?Q?Wzr+sVCi4BLbdZ8PCFN7uMIHQcqf5CRREMY/HtFj70eG4u1vhwLxAuJtKS?=
 =?iso-8859-1?Q?S6VlSATrw4URuPOdCjiw8AkpkW9LNXLejrnB5PZAOuJy9bece7QQEcZ8u/?=
 =?iso-8859-1?Q?Xx3wIPKmzAYY4qQG7G0nI5mTtWM0KgJUCSwq4dQIl6Dl61S4m/kDPAcD/A?=
 =?iso-8859-1?Q?LMCbsuFBlswI3pF9LYpy/2rSvotAkmgCMuGzvi+NfgobJgB4nvbIcm8g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8695f4b9-2d14-4f37-8c1e-08dba990ff68
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 19:40:43.0738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts0qCic56SaqvvAm11YwylCAZ5WKFcuLmyelrDEzYJ3+3ci0AxYMJcc/z0vtazq2ZCHMmZ98usoLW7kmg9juLVc3zqaxBKPUS47AlePpphA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5400
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe/pat: annotate pat_index with
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 10:32:30AM +0100, Matthew Auld wrote:
> On 29/08/2023 22:08, Matt Roper wrote:
> > On Tue, Aug 29, 2023 at 05:28:45PM +0100, Matthew Auld wrote:
> > > Future uapi needs to give userspace the ability to select the pat_index
> > > for a given vm_bind. However we need to be able to extract the coherency
> > > mode from the provided pat_index to ensure it matches the coherency mode
> > > set at object creation. There are various security reasons for why this
> > > matters.  However the pat_index itself is very platform specific, so
> > > seems reasonable to annotate each platform definition of the pat table.
> > > On some older platforms there is no explicit coherency mode, so we just
> > > pick whatever makes sense.
> > > 
> > > Bspec: 45101, 44235 #xe
> > > Bspec: 70552, 71582, 59400 #xe2
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > Cc: Filip Hazubski <filip.hazubski@intel.com>
> > > Cc: Carl Zhang <carl.zhang@intel.com>
> > > Cc: Effie Yu <effie.yu@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device_types.h |  2 +-
> > >   drivers/gpu/drm/xe/xe_pat.c          | 67 ++++++++++++++++------------
> > >   drivers/gpu/drm/xe/xe_pat.h          |  6 +++
> > >   3 files changed, 46 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 06235da647bb..53520ae30b33 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -238,7 +238,7 @@ struct xe_device {
> > >   		/** @enable_display: display enabled */
> > >   		u8 enable_display:1;
> > > -		const u32 *pat_table;
> > > +		const struct xe_pat_table_entry *pat_table;
> > >   		int pat_table_n_entries;
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > index f19f5d8dcd94..9e72c1b4b41f 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -4,6 +4,8 @@
> > >    */
> > > +#include <drm/xe_drm.h>
> > > +
> > >   #include "regs/xe_reg_defs.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_mcr.h"
> > > @@ -33,34 +35,34 @@
> > >   #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
> > >   #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
> > > -static const u32 tgl_pat_table[] = {
> > > -	[0] = TGL_PAT_WB,
> > > -	[1] = TGL_PAT_WC,
> > > -	[2] = TGL_PAT_WT,
> > > -	[3] = TGL_PAT_UC,
> > > -	[4] = TGL_PAT_WB,
> > > -	[5] = TGL_PAT_WB,
> > > -	[6] = TGL_PAT_WB,
> > > -	[7] = TGL_PAT_WB,
> > > +static const struct xe_pat_table_entry tgl_pat_table[] = {
> > > +	[0] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> > > +	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
> > > +	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> > > +	[3] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
> > > +	[4] = { TGL_PAT_WB }, /* zero coh_mode to indicate invalid from userspace */
> > > +	[5] = { TGL_PAT_WB },
> > > +	[6] = { TGL_PAT_WB },
> > > +	[7] = { TGL_PAT_WB },
> > 
> > Should we just not even include 4-7?  That's basically the approach
> > we've taken with MTL (which has 32 entries in hardware, but we only
> > provide a table of the first 5).
> > 
> > >   };
> > > -static const u32 pvc_pat_table[] = {
> > > -	[0] = TGL_PAT_UC,
> > > -	[1] = TGL_PAT_WC,
> > > -	[2] = TGL_PAT_WT,
> > > -	[3] = TGL_PAT_WB,
> > > -	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
> > > -	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
> > > -	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
> > > -	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
> > > +static const struct xe_pat_table_entry pvc_pat_table[] = {
> > > +	[0] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
> > > +	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
> > > +	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> > > +	[3] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> > 
> > Is 2-way correct here?  Although GPU reads snoop the CPU cache and GPU
> > writes invalidate the CPU cache, I don't think the reverse is true (CPU
> > operations don't automatically snoop/invalidate the GPU cache).  So
> > wouldn't this be just 1-way coherent?
> 
> Yeah, I wasn't too sure about this. The Bspec says something like:
> 
> Discrete GPUs do not support caching of system memory in the device.
> Therefore, the coherency mode that is supported in discrete GPUs are the
> one-way coherency mode with no caching of system memory inside the discrete
> GPU.  Setting Coherency Mode to 10 or 11 in discrete GPUs results in this
> same behaviour.
> 
> My interpretation is that 1way and 2way do the same thing on dgpu, so I
> figured I could cheat here and claim it's 2way and then we don't need
> separate tables or special logic for dgpu vs igpu. I can change it to 1way
> if you prefer though?
> 
> > 
> > By the same logic, once we add in coherency the TGL table above probably
> > isn't correct anymore for DG1/DG2 where we only have PCI snooping
> > instead of a truly shared LLC cache.
> > 
> > > +	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> > > +	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> > > +	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> > > +	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> > >   };
> > > -static const u32 mtl_pat_table[] = {
> > > -	[0] = MTL_PAT_0_WB,
> > > -	[1] = MTL_PAT_1_WT,
> > > -	[2] = MTL_PAT_3_UC,
> > > -	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
> > > -	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> > > +static const struct xe_pat_table_entry mtl_pat_table[] = {
> > > +	[0] = { MTL_PAT_0_WB, XE_GEM_COHERENCY_NONE },
> > > +	[1] = { MTL_PAT_1_WT, XE_GEM_COHERENCY_NONE },
> > > +	[2] = { MTL_PAT_3_UC, XE_GEM_COHERENCY_NONE },
> > > +	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COHERENCY_1WAY },
> > > +	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COHERENCY_2WAY },
> > 
> > Although this is labelled "2 way" in the bspec, the reality is that it's
> > a bit of a lie.  From bspec 63884:
> > 
> >          "2-way Coherent (GPU <-> CPU Snooping) honored only for atomics,
> >          else 1-way coh"
> > 
> > and also:
> > 
> >          "Except for system atomics, setting Coherency Mode to 10 or 11
> >          results in this same one-way coherenct behavior.  Full CPU-GPU
> >          coherency is maintained for system atomics with Coherency Mode =
> >          11, with no caching."
> 
> Ok, I didn't know that. So what should we put here for MTL_3_COH_2W? Just
> mark it as 1way? AFAICT 1way vs 2way doesn't really matter all that much
> from KMD pov, just so long as the coherency level ensures that swap-in and
> clearing can't ever be bypassed. So maybe all that matters here is that this
> matches the bspec, and exactly what 2way means for the platform we don't
> really care? Or perhaps we don't even need the 2way and can just mark stuff
> as NONE or AT_LEAST_1WAY?

Yeah, I like the idea of values "non-coherent" and "at least 1-way
coherent" for now.  We can potentially add an explicit "2 way coherent"
farther down the road if there ever winds up being a need for it.


Matt

> 
> > 
> > 
> > Matt
> > 
> > >   };
> > >   static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
> > > @@ -82,27 +84,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
> > >   	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
> > >   };
> > > +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index)
> > > +{
> > > +	WARN_ON(pat_index >= xe->info.pat_table_n_entries);
> > > +	return xe->info.pat_table[pat_index].coh_mode;
> > > +}
> > > +
> > >   unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> > >   {
> > >   	WARN_ON(cache >= XE_CACHE_LAST);
> > >   	return (xe->pat_table).pte_pat_table[cache];
> > >   }
> > > -static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> > > +static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
> > > +			int n_entries)
> > >   {
> > >   	for (int i = 0; i < n_entries; i++) {
> > >   		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
> > > -		xe_mmio_write32(gt, reg, table[i]);
> > > +		xe_mmio_write32(gt, reg, table[i].value);
> > >   	}
> > >   }
> > > -static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
> > > +static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
> > > +			    int n_entries)
> > >   {
> > >   	for (int i = 0; i < n_entries; i++) {
> > >   		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
> > > -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
> > > +		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
> > >   	}
> > >   }
> > > @@ -115,6 +125,7 @@ int xe_pat_fill_info(struct xe_device *xe)
> > >   		xe->info.pat_table = pvc_pat_table;
> > >   		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
> > >   	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> > > +		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
> > >   		xe->info.pat_table = tgl_pat_table;
> > >   		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
> > >   	} else {
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > > index 9ab059758ad1..e2fabde2c730 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.h
> > > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > > @@ -28,9 +28,15 @@
> > >   struct xe_gt;
> > >   struct xe_device;
> > > +struct xe_pat_table_entry {
> > > +	u32 value;
> > > +	u16 coh_mode;
> > > +};
> > > +
> > >   int xe_pat_fill_info(struct xe_device *xe);
> > >   void xe_pat_init(struct xe_gt *gt);
> > >   void xe_pte_pat_init(struct xe_device *xe);
> > >   unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> > > +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index);
> > >   #endif
> > > -- 
> > > 2.41.0
> > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
