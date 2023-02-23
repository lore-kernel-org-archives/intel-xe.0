Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA6C61DA3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 16:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7210EC7F;
	Fri, 24 Feb 2023 16:01:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA86310EC7F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677254465; x=1708790465;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:references:in-reply-to:
 mime-version; bh=duwMcHz8a3qYxpnZWTOq9NqCM2xvm5nINshuf7OtJas=;
 b=QyCfPWVZ4PRhDIP7qunfNZHwsNk7BmLRYGF22bM2qfAe2p6GSklaWOna
 fItT+bmWAbruiI/gOHbk073IzMEggtE2jYx1Wzau6uHdQsi0/J2V0j2cQ
 vLgoaVU5DO73Nyy6Te33iosmRoJLk/36hVKT7Lk39i169X+MmkYlyrTs4
 WL8V6xJtPige9x2FeL1iH1hk31I8c/kyoL9M2Pn1rILeRx2aPGcdeWEoH
 0ey0tIq6qX/YOVRnRIZbnAs6sD0ytBIANkv71NMjS3J4cYP7hucXkqoGL
 09UV/+1sxE64eqazAva8dh7FpP0BVVMMI+5nacgOCW1MXcPc6ehh12aFx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="331238441"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="331238441"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="846985502"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="846985502"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 08:01:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 08:01:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 08:01:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 08:01:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avXERIfIQdHQdFovUXzYdbGtel3OYG5ZJh7MC/f1FcoAS9KnLCC0oZCRbi4t+npL/qDnPKNkkHqiSXIdBUO66VqL2DS441/Daxv7ROEcHsnZ5CQnTTFLx0cAHSz6WQvht5W2HLiavr1jlMzdvJlAAV1yzuUcEtChNQ2j8uicT4o3qbzhB1Rgd63BxpLzx68ube0lODbv4UdrDxMP4YukWmHGRvI7yyT++xRN6wUd6Z9wzp8TFfh3Gs50IMhCx35e+Tpl6Auqx0CvplFGlFGNkGQ/Q6VJnNl44HsRUlfj67D3PVeF54RXLDu+S61f5hBdDBNjWkn5gxB2zeNSc93bWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lrs+AWwiphpY/+WOMLZPx0kZwXmaTyUkgW6rUxGOzKs=;
 b=ZL0jwsw22IMCcyWomUOFj+e3YwA69unzpHhYVidVNhpsgOJtOAOQ9R5WzaAb9s/1Owfz1We7EPbYtyvQZQzrvb2U/fHiDvbz6J6lB4aBnPiU19iP10FuTQH6Xqgl0o06mYPgMZn6RFQk8U/WILm9V20+UUTNwhVFrAdSt5Onl7CTWFA5VM42awpDCqfHepn0DrXSUBzSiuz3GATwUeosTj1whW96PuO8PPfraxZvYx/fzkLMl7mXBuw0epq4kWiRUF1pddymvJ5zrHG0XWD9V9XRvPxQryqjDlVxv7GgOQEkUBYBITlOpPW4dNcNaeEvBynUs8FbfWgiq3tIq3dV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:00:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 16:00:52 +0000
Resent-From: Matt Roper <matthew.d.roper@intel.com>
Resent-Date: Fri, 24 Feb 2023 08:00:49 -0800
Resent-Message-ID: <Y/jfMY9Sct9quPxx@mdroper-desk1.amr.corp.intel.com>
Resent-To: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 23 Feb 2023 09:37:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/ekSyrd7RY7jwSt@mdroper-desk1.amr.corp.intel.com>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-7-matthew.d.roper@intel.com>
 <20230223001119.qgn6rhszleezyngz@ldmartin-desk2.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223001119.qgn6rhszleezyngz@ldmartin-desk2.jf.intel.com>
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d58e4a9-1630-4aec-41b1-08db16804e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2en90uCWIF8ep5+XCgxOBYEvVSUoOByzMyMxm+VdHVMPlNfzIYdrxs8nhhtJjEjlBKjPaxl9xjWYrs9Aq8BmkhHF3Ken6Selg5gC9fdlUkx4/BLwyPrUgKngZfnjfHJ+/MdHedvR1qXjzdTYlDbS8kG6f9KKHE5UWD7t297OfY+j/r/1psGHmB2jLCsxm6LPKQPzlB32ywITsau+Wom8S+9yVxFPrbkhZTFPGtKA3p30NjHVsDdr3HdLzz6LW1jg4iPUeBLkD/e7Xwqb1IgAfCv9tTGVOFBmZQ07dg1JnA10RWqTb9yN2Bewahpo35Z9gsY+aDgyAwnfR9jzyABg1E7sWZLrCg6wlEWLFfqdCIpygOqg3SBMWoWiNrXFYhv2V+vYkg+osZesQmmvu4UuS/ts/uXIIoWIKi9QeYv8vZ/x3Ehgw5AR5Y75d5VhGvx9bINwqD7pnm2aChowHCRuuD9MvTaSgasLUG2Zk+VPwWwKZ61T2Ujxudib9k35qmJBmA7Ori90meKin+x7SXHZjdZ64qZ1wECA4TTVL5UtMQz22bdSKK3p0SfyHdLpR05IcpwP6RRuphw6rRy7cqj0LUXHyVZbvAwvgBQEZtv3f3Uub0GtUaXvE0qyojksz99zC2ct2WSXlnQE5Pu8bNPrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199018)(186003)(26005)(82960400001)(5660300002)(4326008)(83380400001)(38100700002)(8936002)(6862004)(41300700001)(8676002)(66946007)(2906002)(66476007)(6512007)(66556008)(6666004)(478600001)(6506007)(316002)(6636002)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WqILgRiC2u6ydCGF/rJNGmfTQ1FNTxQsDoQ7grqv3POz/lsB2OefqjLpdVX8?=
 =?us-ascii?Q?+aC5x9EVwZoEJ7ExmV/MLv496lZtXvhNR9jIjf6ijAlh33rmV3Hfz/xsg0Iq?=
 =?us-ascii?Q?cgJphe54CxiAk/rgY6wSR7X54h57g+XDVpwcXtHywgD/CdTPCibi7TVieF6/?=
 =?us-ascii?Q?2rqAseHfMZemGE0vIWwLbfBJcRTHYN7ZhbQGX7K+/wCVR5OHkCOd9cXOhp2y?=
 =?us-ascii?Q?/V/1wj15zObJHpTSBuhNFJdHgcbwLrJhz+UES9mQxA45JqZ1UoXEe/E8MWqv?=
 =?us-ascii?Q?1gLwx1M9tKvjUyqYc7xZIO0xDJ3OK8F29yI7UfnkVcY5bF49q7kCaOaKGyGS?=
 =?us-ascii?Q?/UGQ9r87T12tchKL8AseoHE7IDDse1fh0G9208FQVlM0eUSWEnjmiKMnrT9N?=
 =?us-ascii?Q?Wc4TvRYi1ts/NOXpII4o5Pd4EMXUa75+Sw6vciPeevF1CHb/qpxZmxNDInU2?=
 =?us-ascii?Q?UHRxe/N01kjZtTouK6nYa5Ppi/V4c0PFXODDGkAIdgyExF8vvpho9aEJzFOu?=
 =?us-ascii?Q?sorXvmJ+1rZy4a0f5VGGadnR/Zn0IoqTyPLc91mrG3chFob2XlkUBapl0lLR?=
 =?us-ascii?Q?QMBx3Glhs4duRVz1ScGHa/7B/CUxlsQOdjrjLezAjeTdckdXkumskH2cKlpg?=
 =?us-ascii?Q?yjjlii5qqg9lOQTbSWkG1ewWQU8UuJm/iuYMy4Y0J0yD53j6uyUT7Hp05UHf?=
 =?us-ascii?Q?D99xtPef/FjpkQDNjsirlb5qvmz895gkDIFwFSsMiCYXq/lLYkXA0n95Ws9I?=
 =?us-ascii?Q?WFTEmSS5dHQWHffE+1zq8JJMr++c63iCoXFXa4urR1M+DRkLycHzXMsRZHOo?=
 =?us-ascii?Q?H6/IMx+frJFnCO1PC1GW+XfQQ7PVx/UNQhiDfGgWMeLpf1RIPDcVONIGZ79C?=
 =?us-ascii?Q?UFzEL+X9w2kGL4AA0gQ+SO9zcJab2TkDbaYbl1J5eeIG4EdNvtfNWtXDgWPx?=
 =?us-ascii?Q?r1bnY7IBiej4NrdkGE//PZpRfOkEI8jRbEiNBQKGOcwLQfZXh+9XGhuGbJfY?=
 =?us-ascii?Q?0GvK/HlIZmjS2l10zU6d/cdmwmQPOgjW+HwJDzulVg2uB+N5i1l/6SHEGZDB?=
 =?us-ascii?Q?ieqNS3QcIxAnZgUmAzl8iTx4q90wTrypSk6u4k2qaX/0Vy06Ea0vkgFn3dZJ?=
 =?us-ascii?Q?iHn7NMK+r2I7lXSQLY0eFwzLT88kegt2nNmAriaJm1kywOsGFQnsY9VeKDcG?=
 =?us-ascii?Q?vT9IZ6t1EXyN7Z4qhZHSS3qxLMEUbfIrCJrq3ezHEZDe4Tz9ONMSG4wjrbNv?=
 =?us-ascii?Q?e/KepSr4CxY7x7haWkPJHe8XlwjPTSkaWeqkiijW6grbADCPSHLG99nnvLue?=
 =?us-ascii?Q?rboSQV0949v+ezYdMh0o52e+QSJcGNyruHt0VL5+uzW0sq12/fXXgZBJoJjG?=
 =?us-ascii?Q?h/aqLWaGTuoby0UluWaADTC8Gtk0+dfXW5rdgTQx3bmkW4bgHEiN/7LS0b9p?=
 =?us-ascii?Q?Ocr9cwKgnyZ/6/zPLeE9Vo1TS+R+2phrYuFNz2+jue0+yhwvyFEDYg0zc5zE?=
 =?us-ascii?Q?bPnbyZMdlxOiy5gHUUw/WaGTZhMztXLVGaen6pDKk2KR45FY3/yQsCHOnLUg?=
 =?us-ascii?Q?InZmci7KjIEQZapTdEYbCvb7blYU52nq3y+qeOhjywvTQjZXfZ8h5NqlrV3z?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d58e4a9-1630-4aec-41b1-08db16804e11
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:00:52.6635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RXt5ZEhoO1teZYnMMQRKzjS+S/OqHTX3Qhvmv1zwR5o49NVe/FfvJRVJw4RcA44Su0TLVI8qVb5zIwJcM00LMNO5Bh5U73pTvG6xhXRosk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/mocs: LNCF MOCS settings only
 need to be restored on pre-Xe_HP
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

On Wed, Feb 22, 2023 at 04:11:19PM -0800, Lucas De Marchi wrote:
> On Thu, Feb 16, 2023 at 03:17:24PM -0800, Matt Roper wrote:
> > Reprogramming the LNCF MOCS registers on render domain reset is not
> > intended to be regular driver programming, but rather the implementation
> > of a specific workaround (Wa_1607983814).  This workaround no longer
> > applies on Xe_HP any beyond, so we can expect that these registers, like
> > the rest of the LNCF/LBCF registers, will maintain their values through
> > all engine resets.  We should only add these registers to the GuC's
> > save/restore list on platforms that need the workaround.
> > 
> > Furthermore, xe_mocs_init_engine() appears to be another attempt to
> > satisfy this same workaround.  This is unnecessary on the Xe driver
> > since even on platforms where the workaround is necessary, all
> > single-engine resets are initiated by the GuC and thus the GuC will take
> > care of saving/restoring these registers.  The only host-initiated
> > resets we have in Xe are full GT resets which will already
> > (re)initialize these registers as part of the regular xe_mocs_init()
> > flow.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
> > drivers/gpu/drm/xe/xe_guc_ads.c    | 10 +++++++---
> > drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
> > drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
> > drivers/gpu/drm/xe/xe_mocs.h       |  1 -
> > 5 files changed, 8 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index d555d77cbf49..fd0ebfe7cae3 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -462,7 +462,7 @@ static void execlist_engine_suspend_wait(struct xe_engine *e)
> > 
> > static void execlist_engine_resume(struct xe_engine *e)
> > {
> > -	xe_mocs_init_engine(e);
> > +	/* NIY */
> 
> what does NIY mean?  maybe "nop" is more common? And... what about
> the execlist backend staying without this? Yep, execlist right now is
> not very functioal, but should we be intentionally breaking it?

I assume "NIY" means "not in yet."  That comment is what was used for
several other unimplemented stubs in this same file, so I just did the
same here for consistency.

Removing this shouldn't have any detrimental impact on the current
execlist implementation.  The programming here is only necessary to
restore after a single-engine reset, but it's not possible to ever have
an engine reset today because that was never implemented in Xe (and as
far as I know, never will be).

> 
> > }
> > 
> > static const struct xe_engine_ops execlist_engine_ops = {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 0c08cecaca40..a233023a6616 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -430,6 +430,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> > 					  struct iosys_map *regset_map,
> > 					  struct xe_hw_engine *hwe)
> > {
> > +	struct xe_device *xe = ads_to_xe(ads);
> > 	struct xe_hw_engine *hwe_rcs_reset_domain =
> > 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
> > 	struct xe_reg_sr_entry *entry;
> > @@ -464,9 +465,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> > 					  e->reg, e->flags, count++);
> > 	}
> > 
> > -	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> > -		guc_mmio_regset_write_one(ads, regset_map,
> > -					  GEN9_LNCFCMOCS(i).reg, 0, count++);
> > +	/* Wa_1607983814 */
> > +	if (GRAPHICS_VER(xe) == 12 && GRAPHICS_VERx100(xe) < 1250) {
> > +		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> > +			guc_mmio_regset_write_one(ads, regset_map,
> > +						  GEN9_LNCFCMOCS(i).reg, 0, count++);
> 
> calculate_regset_size() unconditionally accounts for
> LNCFCMOCS_REG_COUNT. Although this is just a "max", maybe we could
> remove it from there by moving the if condition to a function
> bool needs_wa_1607983814() { ... }

Yeah, good point; I'll update that.


Matt

> 
> Another idea would be maybe to extend xe_rtp to allow a FUNC() not only
> in the match but also in the action. We'd also need to extend it to
> allow that function to apply the actions. Humn... if we need it more
> than in just one place we can do that in future. For now this does the
> job.
> 
> 
> > +		}
> > 	}
> > 
> > 	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a54f7f82d04d..3766b77a0d90 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1267,7 +1267,6 @@ static void guc_engine_resume(struct xe_engine *e)
> > 
> > 	XE_BUG_ON(e->guc->suspend_pending);
> > 
> > -	xe_mocs_init_engine(e);
> > 	guc_engine_add_msg(e, msg, RESUME);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > index 3b48934d99d4..7e495d699295 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > @@ -507,19 +507,6 @@ static void init_l3cc_table(struct xe_gt *gt,
> > 	}
> > }
> > 
> > -void xe_mocs_init_engine(const struct xe_engine *engine)
> > -{
> > -	struct xe_mocs_info table;
> > -	unsigned int flags;
> > -
> > -	flags = get_mocs_settings(engine->gt->xe, &table);
> > -	if (!flags)
> > -		return;
> > -
> > -	if (flags & HAS_RENDER_L3CC && engine->class == XE_ENGINE_CLASS_RENDER)
> 
> do we have any other plans for HAS_RENDER_L3CC?  It seems it's not used.
> For any error handling part we could check size, table or
> unused_entries_index
> 
> 
> Lucas De Marchi
> 
> > -		init_l3cc_table(engine->gt, &table);
> > -}
> > -
> > void xe_mocs_init(struct xe_gt *gt)
> > {
> > 	struct xe_mocs_info table;
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> > index aba1abe216ab..63500a1d6660 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.h
> > +++ b/drivers/gpu/drm/xe/xe_mocs.h
> > @@ -11,7 +11,6 @@
> > struct xe_engine;
> > struct xe_gt;
> > 
> > -void xe_mocs_init_engine(const struct xe_engine *engine);
> > void xe_mocs_init(struct xe_gt *gt);
> > 
> > /**
> > -- 
> > 2.39.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
