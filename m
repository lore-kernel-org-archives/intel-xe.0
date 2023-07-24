Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9579EC0015E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651CA10E282;
	Mon, 24 Jul 2023 08:38:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B4710E282
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690187903; x=1721723903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ZzzJT93+Bn9GFG8Z7SGXFCJfvUM6Gk4YHp66Sw11Gs=;
 b=jqzwovsUGKw35FYBzlzqqKPSLfRLi9cMJC3FtBYEAxZCOY5sNjgL29LE
 ZdXlcreIffGw+6FRXm2Kyk3SO2IGwRo1FHSIL7OSNYXM0bNV6uaESHFJn
 hHKJLlh2TJqX/cwLGRl/L0642YUYEVvepTS2LUTmV2Q7WSkrj8Y3N0QCk
 kUuQbOs+oEUH62gvD7/E7VWk2GLUwPAq6EH4xq5CUWCockTYpdcjEnoNG
 VshsaW9IpN/ne/lRRQKulSoPYF+p4f7NSQhdfN3paOS/XYGL5iCuRgLvk
 C1r88kQSQrBCoY+rHJq1Joqnk9HoLoo1vfy7hZ0SPc/5osyS6LSaRVWj+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370985141"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="370985141"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="719587753"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="719587753"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 01:38:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:38:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 01:38:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 01:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9ODQJeZi39PYiB2Nz/RaWvauB2/xp3DieseeE/w23Bx+ePsrepVfF1CQB4cpSR7jVcWQ/ppo+y6BdlQ/Lar+cWeTAQ6FwQ2uwNUSMVVkowoinXRiTjEb1UXaplQvzD2cGc1moiI2Na3MpkfyfkRwVobKFxAZaRgKnQK1yNbZROuvkvCmQaujYWgBaoZ+eZXAe/3T2jpZaYX/8ZpUUH5SKtPJyJyhT7ZXW4/UPnDu+xuUR4AkY4ot/7qUfZhPBm7kB7GDMrXQCTBvI/+sNEZx4LkXgZLzVYwjA9pSONZCFEAsVopvB8RMTzSeBWTKHmJoiXXu4OsVPtvFP8FTjh48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+4QegBo2bQ4IW08dJM5dOxmanjQfj++aRhD01/ypos=;
 b=geoFFc8gCeG0ADeiC7y5qWm3qNGpzBZBSDCkYA1LayFqRxHk3RQYxFzUzplGAn2A/+NQOZUam/wP34WlE+KtSRHlnMMSn8smyB8WYE+9GywETnV5u41qA9hAwS7w/4onLsz2U41OsuUQr2xev2xd+tx1gy9kNCNO0N+mAELvGCdiD4YCtMBs3HrCTSMuscbgtOaiNUcgNVv8Qa7e41e1rA4Xdy9ZMaWuAfzLdAIuorDNZh+uxVDuA7nD7XM98pNR2iUsmy40ClT3iZiVGPEKaH0s6hzIght8/BDq+0SfRPmwdzGeE/3BObNk80Xw+GdzElWddiVou1YK6loaXBLHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5473.namprd11.prod.outlook.com (2603:10b6:610:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:38:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 08:38:20 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v5 2/2] drm/xe: Introduce fault injection for
 gt reset
Thread-Index: AQHZuydJWU+5GG7a20GL/cfQc8+ov6/InUGA
Date: Mon, 24 Jul 2023 08:38:20 +0000
Message-ID: <MW4PR11MB7056A016223F88A9DB38BA39B302A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-3-himal.prasad.ghimiray@intel.com>
 <ZLlgw5A0DebwmGqv@intel.com>
In-Reply-To: <ZLlgw5A0DebwmGqv@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH0PR11MB5473:EE_
x-ms-office365-filtering-correlation-id: 17edd39f-4ebf-4c67-a061-08db8c2155b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0dIwyY6PvVQ1kFf/KpFXOAjyUPHItmIVdDDm6YUM6RL0CoUTLJ5e5gYOIT60lq/cA0XQflwfqUf05tp65jX5t8fhUpZ40vI1gbKlBBmPCgSNNASOnhwmlkJOf6SVKQQBpdR/WiYmobYL3+MPzuMoHlzntdVNDRNvaHgzhHhDOZBQo8g1nJ7dlFMxu+/Ttuz48luhmyNSHD5foXbcVpAnaM9YFOIsxbQ0VvnIiD1w+4jUjL1CpDcHrN0nxQuGJGHUGUlqWq152yiKh2ED/G5osRCvKKjt264OrNC7IHzkntvIXi7UlDb3lLBrMN2PdIDUMZcOSfNgHuHhG3Uv2uwk5mOIowTJyHANo5x3giI4QEzn5LyAws5Uzm+tK2jDCIQRIb0INWd9E9wG9ciM6dTce27NTnKv/Ncb4lsmDwXd5HdODkF9HwiNWI6qDFlXKQH68CVeYNGI0ETfiNWKj+yE+EDWi64jWI0ng+cEMS7/1ae/3TzXhfYG48D/TQqF+E/HL0mEdo4SHnmNG3V8Ugv9hnjnOpqK4qLHhHx6NE2bqzHZugoGf6wfaDcEeanyAE9VkNw+2RuKktJ3RVhGblnSCOCFFa2WFK2UmocHKPJxGmd+Bw1MH2MTsUCWHGkymy1t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(122000001)(6506007)(26005)(186003)(52536014)(5660300002)(6862004)(8936002)(8676002)(2906002)(38100700002)(107886003)(55016003)(82960400001)(53546011)(86362001)(9686003)(7696005)(38070700005)(33656002)(66476007)(64756008)(66556008)(66446008)(66946007)(76116006)(83380400001)(54906003)(478600001)(71200400001)(41300700001)(6636002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V7g5fo2zr7Lb6aI/vcS+pV4mGa2pixjog8O3rnPVYI8M8YiU8i0k6F7bR3Me?=
 =?us-ascii?Q?67uowcEqWgnZ/MPSMGOJw1bDIEm0IPjEry1zdlD4VjW4imExgv1MehpHPgtP?=
 =?us-ascii?Q?ll14PQigYf6Si4+xa9bmf2Yvl5bqCdkvA5Zo4jtqu4IpRkwgY6jVtlrkENFz?=
 =?us-ascii?Q?1H5VQNWpDvrLITtkOfzabt5hDfQI1tjMDqQafPdU6AOebmhQRdROY4VTRPnd?=
 =?us-ascii?Q?isixI05b6yfIgoexkHyPLxPvAYhFtrD3DcDujEOo78R5jZihaUcVokcbY7ik?=
 =?us-ascii?Q?hVMd/uLJfI7kLvTxp3CZocJU5mejqzBTSItmndRK2QkWGNh1rYtFlXxFS5yg?=
 =?us-ascii?Q?OG19stFe2Z+DlV0n2aNHHqO1ivPxeTLlezgNXT5Gh5sp2VnpJywoP3GrNm+5?=
 =?us-ascii?Q?hcVIAl4Ef9GPx7NubONWXR9QM4MQRIorwUf9JhFaIjroPzb5c2aFhY+TXgZJ?=
 =?us-ascii?Q?YZDlwt0ry4yWR8AtAqQ6ZJb0SmLPU/v9QNkrYd+GLNncTxQBIpSyBR9zZwHq?=
 =?us-ascii?Q?uXEa1lmwH0jKsWFmO16CvTCXRKFzLhaGuDkxog71VtpOx45N63tOTSsi2Ck5?=
 =?us-ascii?Q?T6mwt5m2IBwn2JxKMiopLy0RBBBN1REzn8E5MjXJAH3b2Lu4iUUB9FK0+lN/?=
 =?us-ascii?Q?Gx+CYz23dfxpfDt5jARUST8G5OnHc3nMe5TGDMJFhm6sk6V7s0IWAksN9PcC?=
 =?us-ascii?Q?e/Ghnk0TR/hs5bOtrlQpowR5KyFhtRphQpe73p+Pu+Cy75xG9ribf39WKU/v?=
 =?us-ascii?Q?wGT4YK6+Yxs+pjtKxbvGe/ZK7n5p+GQSBrsnNxg9s6qvXtYqo5KY64rrGyNv?=
 =?us-ascii?Q?ezqxQSxC8wS62EzurJe8KO+5s+wvTr4pE8MuWVa5miqnj+qFVohOih437UJp?=
 =?us-ascii?Q?wp0eyPUgPNhaBT/Xy3DVaBTnoYx5yFWuJdNTzlVx4HDnRfMCNc/w7zjV7Ylj?=
 =?us-ascii?Q?7ZkP6SPs+zzUG7dzxI3ZY7oTg7WU7LwkEcay1q+CuHEPK25AYu9oLbldImhR?=
 =?us-ascii?Q?fQZVv6bJOsFel4U5l8ufe4Wy88WdYCxDZbKNVA6n+TvYMuPnmf7/KkPlMCdX?=
 =?us-ascii?Q?H62TPTWTA52s+op9/syJzYt81xNY2IpNrz7B6JFtm58dfFXJyoklDhE4oKuH?=
 =?us-ascii?Q?HD+/sVqbD3D3RmxuBPhofJtuR8F/ykj8YWhKJJmLxcBuTOEe5J0RkF4d31pl?=
 =?us-ascii?Q?eoh90jx1x+sb1yu6BIj0O5EEZ1Ro/mX1p8BwbbiS+ZYbWeN/v7Qp746eqkZJ?=
 =?us-ascii?Q?J20sjWEiLtwBYUaGfKYBHtfbiNMXbilLQs0q/cvrnu4eV5srksz+ilT+2Lal?=
 =?us-ascii?Q?pqtOqVKMGM13BAGlaiqF0IPHxYvZUY/0EMi86MEQrDVrUXUgTJLESPeEhyD+?=
 =?us-ascii?Q?aA3KCMjq36oZq6mUBUFqF1Zqn/qEZco9SXFi8ZeMhLkpdRgkBDv+sH7ZaEe7?=
 =?us-ascii?Q?SXZpAXCkDs7ZYWFJRqH+JjyT/pr/1jFvBP95Xze9eGvxPo2OsiC6yt5kNdXJ?=
 =?us-ascii?Q?pCekopizbDLmWH9zeTP5lQD8ASTu6EbztkUsXBdfEza4ihJq4gLaPKzWq+z7?=
 =?us-ascii?Q?dB5cVAWNPTI+zlSex5qjrFKk7KMhl7bwCKF1CVPRv8pEQZWQsTcdUzZfhb7E?=
 =?us-ascii?Q?DQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17edd39f-4ebf-4c67-a061-08db8c2155b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 08:38:20.2679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+L0tRdUntdlVNgT6CuUKGAqXRbbGr/5KXoBy3Y3gf9vaooEA4ekW+wBunwD9wEp3Nso/G5NbDQocK0UibFJ5JE12nVVUWqTIJMtPYgxOGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5473
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 2/2] drm/xe: Introduce fault injection for
 gt reset
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: 20 July 2023 21:59
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [Intel-xe] [PATCH v5 2/2] drm/xe: Introduce fault injection =
for gt
> reset
>=20
> On Tue, Jul 18, 2023 at 07:02:16PM +0530, Himal Prasad Ghimiray wrote:
> > To trigger gt reset failure:
> >  echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
> >  echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times
>=20
> why 2 and not 1?

We are relying on 2 times should_fail returning true.
1st to skip the check for xe_uc_reset_prepare(&gt->uc)).
and 2nd to send uevent.=20

>=20
> anyway, neat solution!
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks for the review.

BR
Himal=20
>=20
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_gt.c      |  8 +++++++-
> >  drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
> >  3 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c index 7827a785b020..08d5bdf4cf61
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -5,6 +5,7 @@
> >
> >  #include "xe_debugfs.h"
> >
> > +#include <linux/fault-inject.h>
> >  #include <linux/string_helpers.h>
> >
> >  #include <drm/drm_debugfs.h>
> > @@ -20,6 +21,10 @@
> >  #include "xe_vm.h"
> >  #endif
> >
> > +#ifdef CONFIG_FAULT_INJECTION
> > +DECLARE_FAULT_ATTR(gt_reset_failure);
> > +#endif
> > +
> >  static struct xe_device *node_to_xe(struct drm_info_node *node)  {
> >  	return to_xe_device(node->minor->dev); @@ -131,4 +136,9 @@
> void
> > xe_debugfs_register(struct xe_device *xe)
> >
> >  	for_each_gt(gt, xe, id)
> >  		xe_gt_debugfs_register(gt);
> > +
> > +#ifdef CONFIG_FAULT_INJECTION
> > +	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> > +#endif
> > +
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 1db4d610f2fd..370d4b96e616 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -525,6 +525,11 @@ static int gt_reset(struct xe_gt *gt)
> >
> >  	xe_gt_info(gt, "reset started\n");
> >
> > +	if (xe_fault_inject_gt_reset()) {
> > +		err =3D -ECANCELED;
> > +		goto err_fail;
> > +	}
> > +
> >  	xe_gt_sanitize(gt);
> >
> >  	xe_device_mem_access_get(gt_to_xe(gt));
> > @@ -562,6 +567,7 @@ static int gt_reset(struct xe_gt *gt)
> >  err_msg:
> >  	XE_WARN_ON(xe_uc_start(&gt->uc));
> >  	xe_device_mem_access_put(gt_to_xe(gt));
> > +err_fail:
> >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >
> >  	/* Notify userspace about gt reset failure */ @@ -582,7 +588,7 @@
> > void xe_gt_reset_async(struct xe_gt *gt)
> >  	xe_gt_info(gt, "trying reset\n");
> >
> >  	/* Don't do a reset while one is already in flight */
> > -	if (xe_uc_reset_prepare(&gt->uc))
> > +	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> >  		return;
> >
> >  	xe_gt_info(gt, "reset queued\n");
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 7298653a73de..caded203a8a0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_GT_H_
> >
> >  #include <drm/drm_util.h>
> > +#include <linux/fault-inject.h>
> >
> >  #include "xe_device_types.h"
> >  #include "xe_hw_engine.h"
> > @@ -16,6 +17,19 @@
> >  		for_each_if(((hwe__) =3D (gt__)->hw_engines + (id__)) && \
> >  			  xe_hw_engine_is_valid((hwe__)))
> >
> > +#ifdef CONFIG_FAULT_INJECTION
> > +extern struct fault_attr gt_reset_failure; static inline bool
> > +xe_fault_inject_gt_reset(void) {
> > +	return should_fail(&gt_reset_failure, 1); } #else static inline bool
> > +xe_fault_inject_gt_reset(void) {
> > +	return false;
> > +}
> > +#endif
> > +
> >  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);  int
> > xe_gt_init_early(struct xe_gt *gt);  int xe_gt_init(struct xe_gt *gt);
> > --
> > 2.25.1
> >
