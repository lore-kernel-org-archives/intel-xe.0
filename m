Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE6DC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 16:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD808949C;
	Fri, 24 Feb 2023 16:24:20 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642BE8949C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677255858; x=1708791858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DM63I3JGNVMNvRhLmtEmYXr43XT/7xmJ00CQPiZy0ns=;
 b=cTDhQGHJ2xljJwy19xuq1eTHfO4AS1oibb4reiSwhN3siiWm/6byWJgK
 77k4wf9yRd/JgJ91KUriUicl9fbX4pb4RC5bNqQH12brPG9Img2EdG1c9
 pnSTD9Qmd+Q3JfCH2FtsXvL0Eiy7+FCtdxGuol2IxINeN+l3py+UOC4c5
 RrP3IzoI7CRTU9DFYuX9C8KNX95FaUHrPBX6HwY6LfrBZDvTu66iqKljz
 LzExtOJAhmASE2Fic9uFRLzyNYkpGN5haNA3TbQVfaD43QuxKBhLMq+dy
 emIGwFjb8paMPWajKsZ0aiKieX5wfZyO1T0B0aOjBz6Cu34fWQeVgYIh2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396027017"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="396027017"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="1001875047"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="1001875047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2023 08:24:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 08:24:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 08:24:17 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 08:24:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTCqZQX7fyCw3CpgAeUJGTlhRAGM9yS/mf/QWCg/XgmqP+JWOWKmfujfwJKbterYUIrQGtkFQk0eZvftudINGIZHccq8AFprsCqJgM79mkvBiY42Gl33Ih50BhoL3XJkGG4RAM0/8Xs3HayDSnsdh8oj0WFs1qk1+Ju0W2sJLMMb2PvISZjUBkV8ubru1/6TpJmGXSazQxxxCmEmPD6VpAsI/L3BWS/Vo81AdMLvT9dIZBGXYRFz7Wxj7zXqJ/KqbkySCjvU8SlP1vsUOa+tbHOGKNpZm8Po65WNaVB2CW69h5z1TIjkb1AED0xTUzbEu5AFJHA6hdJiuk/FZnmmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGdW899O7GR3feIS6bja70Tf9qo3+kWlBu8HGhVt2SM=;
 b=axUD6CcUW3EUIKAWmiPcuP7BGJTsv1ocaYsYE52iL1/2OIjWarBzly8KzJIUtX3P/RyQxxBTiJzeGN3+j+8qllo8Dx/SQIV2y4CZpVFrO+W8lt3NUahVuQYmadHHvbM+ueRfLPxQZB4exMGZLhBYx67+KMwLJvs1kimABcHLScONzL8Ap0KTcCjnntW9fzsBNtBc/PLSPIVsQpfZb6PULD6gePJt4gAsur59vaI9Db/HknD/jNavfOnITawA03eMEWRtXeH9U1z3Yulpiu34Gf2BE64KGTyHDr90TfMTxRybTUOugYmKFaPpi0+/xOCa+riOwdCNu2nUAIdsbzSicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5487.namprd11.prod.outlook.com (2603:10b6:5:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:24:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 16:24:15 +0000
Date: Fri, 24 Feb 2023 08:24:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230224162412.74utfchfhwd3eq6k@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-7-matthew.d.roper@intel.com>
 <20230223001119.qgn6rhszleezyngz@ldmartin-desk2.jf.intel.com>
 <Y/ekSyrd7RY7jwSt@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y/ekSyrd7RY7jwSt@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: e6762c5f-437a-451a-f09e-08db168391cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6xZ7rmh12wf12cWun+Aqx9JYSBaHF/vmZsGrgzYmvJjDp0Y6CErDuY45HfxWFK5QR+hntBFDbidraAX9nFvrb8Rs4Vp2D6Ia20HqU5PvGe060MqVUO8XoTK7tozsQQbkZCwLIJC/Op4gwDn5UqgOf/CjwXOR1pqEHdBexdq31KkU/4PHitjUKuEFrpbvwr01LslJpe+Bss657WkBFnkB62ch+U1LTQsf00GUJ8yM33VR66typgyuArsvn4QO5pa4tCZtSGY6gpYFEP2YEauGJJjAaDhcKpQ9tfL+wM+HgeLed1mzyh87bU0ZsyPyo2AmSzI3Ck7j3DEfRdmOAJ+fgVcmjewURqOus2X0/pM9CVNrqgBl3CRuaEif+uf/VKkG6P0aZlT0O0gGr1aTrbH8rwiSBZTbJgJE+S87Va33QZcpF2VtyUVzMgTX8VErh5UDPLYSIO4IKRRbL02ZzeJWJBr608/ZG81Zmt8LdGIzasJvsSqj/P2dYfQ4WBQ7gKQQ1ebHkfaRThc6+/gJHfhkpVjdI5JfOEVGJu/qQAdJtVcKEr+Z+q5xI5AOBcpF9I42btGMfqVNYi9/nP+nnkwtFm6qthkGjs/3LKAPNNWAePW+rIzrarUg75IboSvJGvRvX8UIOR3rQSoNkulXL2WWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199018)(8676002)(83380400001)(4326008)(41300700001)(66476007)(66946007)(66556008)(316002)(36756003)(186003)(9686003)(26005)(82960400001)(6862004)(6636002)(8936002)(5660300002)(38100700002)(1076003)(6506007)(86362001)(478600001)(6512007)(2906002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s/LlIvMjEoplx4ZnIKz9E0333vDKVjIoSO0IqNJ3Hd8TarumN+ZVNCNWzYNa?=
 =?us-ascii?Q?gHBnRamkEetQc3Z2ZJSDlt2/QCVb20OR5bCxaUyfsb6DvbajLGn7a/ialdkk?=
 =?us-ascii?Q?381SfQtn087Mod58tWWMEnEy6Zdz6xs5e5XetVgv9H/q1GboYq7OeplQSapD?=
 =?us-ascii?Q?SsQCexWrmb3CFTGgpxfrz9yLF5yCizD9q6/yXLXsWOMpGgtSM7ZyDaDc85cR?=
 =?us-ascii?Q?BGxWaVzpKqLhet0yE+rtNoMz3C6yN7NZIatjCCUBztTUmmw1vF+KueWf9DvR?=
 =?us-ascii?Q?dZoyKiAwaKnhk70Ndb18XVP0lcgN1Z4I1TmgoyThyuWxz1go1rQncki76gwY?=
 =?us-ascii?Q?k2K6N3vva5sDUemZHuH+tSXY/ujIJGT6yGk2WJuHjaZ0qJe+FRQ/kuVycw6D?=
 =?us-ascii?Q?sWNxwuJQNFNnLivy8jj4Y/mvwV/3evvrr4IVCn4mpYWvLtD2oIg8TBehF6ce?=
 =?us-ascii?Q?cuqD23loeygPLzAT6rD/TpVoAOI07igpr3cXAeqpdhZqSXqiftTsTzmpbTzr?=
 =?us-ascii?Q?fyQwMTOi2CTzZuWMpHGLhgcnPfNaBbEv0T0jSGWWljkItgAo4eKwjqPI52Pd?=
 =?us-ascii?Q?a/Dhjbti3nOZGlCOmLc9BhGlSstlzQfRbGVvNL8bBB5TqjnlkWED00TP7GE6?=
 =?us-ascii?Q?zwe5YEPgwdRfaqbKtQd/EfL+dk4VOANgrxdIiV6iTo8G1HHj0lfcqy0/Y6Lz?=
 =?us-ascii?Q?zHZnIAbeeW/Wm5Pa7/YdNMFP8MHlP7B4rCaHVPhCyqgrozo9wwjjIdIZngQ5?=
 =?us-ascii?Q?cnhW6qCzQ3m1toIydqQbh0SOLLMT/LaZRAtcmgT94mb3ZgJQNMTgp05KYeHB?=
 =?us-ascii?Q?082ZHP87/Vs3EY7EG9/JmxnxPhh1DIN/lw3mVyYl/ul4v9B5EUoYFQAe9TKc?=
 =?us-ascii?Q?epqT7Oq7kbBqfw/Ukhl1ZZEFNxB4GJUwf2EnZnmHZBY3ocK5u3yWd7b2sL69?=
 =?us-ascii?Q?B9sLrd7toX0xo78Rv8zDEPYIqmUlvfM6mjj5ddePj5ncTZa0HWR72TvYKgt1?=
 =?us-ascii?Q?8pCdyOOmIDTOTC78MG62naUrkMrft5iNNSkGR/IRr/Qi/RIRZ/37AaanVAFu?=
 =?us-ascii?Q?cyVeFy1fgiPJ/RoYF7fy27d42HywXTnV6FqoQQiVwWZTST/gjikfgukd5M+u?=
 =?us-ascii?Q?9CmEIv7YwvLaSIuE/M0j4MITNY77JmdHDS3WmafKtwUUhnBGJT+tWhhHHJyv?=
 =?us-ascii?Q?/HkQ7WhNAjOYlgevkxBJA9/siwFyf5mXKbIkRNbNP1N/hz1M8pahWsmePU0Z?=
 =?us-ascii?Q?HBKZvApIQ50E9CQpH2SIe4KaxX9O5CYNMKxchYTCFXdmEZCymjOYRBEMT+BX?=
 =?us-ascii?Q?4D02K2Jjb2V9hjqyr7Do/Z5qG1d1nBDcSqyJSwVE1yQ2kTIuV98gwAmI3NiT?=
 =?us-ascii?Q?fFIg8ej9WKyBNr7IJLhKaBHHXClL40NwGuOPUUBi1Eih9xr/40HY/grfkeBP?=
 =?us-ascii?Q?oB7/YtbHlukGcwRxk9ykFkdRbcAJpfm0TMm7fZ5Z90S0Uw+4ayn8qULYzlRD?=
 =?us-ascii?Q?54AN0IbHRCO4L5oh3HpA5O9MatpU4w4L9YWKfX1jHIRXM1IGeKife5Brhhbd?=
 =?us-ascii?Q?u02wuHji+QFQ1Uemi8xMX+LM2wJ97s/d21T4XVceFfFDYWgWeEBaR3f0GYhx?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6762c5f-437a-451a-f09e-08db168391cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:24:15.1713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoKA7LGM0ioenqpCC/6ZoisxJtzm2wCtAF4C+3GnEQ3lhzn4AXXChcP5lCG3btfuz+qL+8LJB8dVjIbl+95MnBA27/sU/hEFwUoWeX2244o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5487
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

On Thu, Feb 23, 2023 at 09:37:15AM -0800, Matt Roper wrote:
>On Wed, Feb 22, 2023 at 04:11:19PM -0800, Lucas De Marchi wrote:
>> On Thu, Feb 16, 2023 at 03:17:24PM -0800, Matt Roper wrote:
>> > Reprogramming the LNCF MOCS registers on render domain reset is not
>> > intended to be regular driver programming, but rather the implementation
>> > of a specific workaround (Wa_1607983814).  This workaround no longer
>> > applies on Xe_HP any beyond, so we can expect that these registers, like
>> > the rest of the LNCF/LBCF registers, will maintain their values through
>> > all engine resets.  We should only add these registers to the GuC's
>> > save/restore list on platforms that need the workaround.
>> >
>> > Furthermore, xe_mocs_init_engine() appears to be another attempt to
>> > satisfy this same workaround.  This is unnecessary on the Xe driver
>> > since even on platforms where the workaround is necessary, all
>> > single-engine resets are initiated by the GuC and thus the GuC will take
>> > care of saving/restoring these registers.  The only host-initiated
>> > resets we have in Xe are full GT resets which will already
>> > (re)initialize these registers as part of the regular xe_mocs_init()
>> > flow.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
>> > drivers/gpu/drm/xe/xe_guc_ads.c    | 10 +++++++---
>> > drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
>> > drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
>> > drivers/gpu/drm/xe/xe_mocs.h       |  1 -
>> > 5 files changed, 8 insertions(+), 19 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> > index d555d77cbf49..fd0ebfe7cae3 100644
>> > --- a/drivers/gpu/drm/xe/xe_execlist.c
>> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> > @@ -462,7 +462,7 @@ static void execlist_engine_suspend_wait(struct xe_engine *e)
>> >
>> > static void execlist_engine_resume(struct xe_engine *e)
>> > {
>> > -	xe_mocs_init_engine(e);
>> > +	/* NIY */
>>
>> what does NIY mean?  maybe "nop" is more common? And... what about
>> the execlist backend staying without this? Yep, execlist right now is
>> not very functioal, but should we be intentionally breaking it?
>
>I assume "NIY" means "not in yet."  That comment is what was used for
>several other unimplemented stubs in this same file, so I just did the
>same here for consistency.

oh... I think this is "not implemented yet". Ok, so it's not a nop, it's
more a "TODO" if this is ever really done.

>
>Removing this shouldn't have any detrimental impact on the current
>execlist implementation.  The programming here is only necessary to
>restore after a single-engine reset, but it's not possible to ever have
>an engine reset today because that was never implemented in Xe (and as
>far as I know, never will be).

ok

thanks
Lucas De Marchi

>
>>
>> > }
>> >
>> > static const struct xe_engine_ops execlist_engine_ops = {
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > index 0c08cecaca40..a233023a6616 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > @@ -430,6 +430,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>> > 					  struct iosys_map *regset_map,
>> > 					  struct xe_hw_engine *hwe)
>> > {
>> > +	struct xe_device *xe = ads_to_xe(ads);
>> > 	struct xe_hw_engine *hwe_rcs_reset_domain =
>> > 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
>> > 	struct xe_reg_sr_entry *entry;
>> > @@ -464,9 +465,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>> > 					  e->reg, e->flags, count++);
>> > 	}
>> >
>> > -	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>> > -		guc_mmio_regset_write_one(ads, regset_map,
>> > -					  GEN9_LNCFCMOCS(i).reg, 0, count++);
>> > +	/* Wa_1607983814 */
>> > +	if (GRAPHICS_VER(xe) == 12 && GRAPHICS_VERx100(xe) < 1250) {
>> > +		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>> > +			guc_mmio_regset_write_one(ads, regset_map,
>> > +						  GEN9_LNCFCMOCS(i).reg, 0, count++);
>>
>> calculate_regset_size() unconditionally accounts for
>> LNCFCMOCS_REG_COUNT. Although this is just a "max", maybe we could
>> remove it from there by moving the if condition to a function
>> bool needs_wa_1607983814() { ... }
>
>Yeah, good point; I'll update that.
>
>
>Matt
>
>>
>> Another idea would be maybe to extend xe_rtp to allow a FUNC() not only
>> in the match but also in the action. We'd also need to extend it to
>> allow that function to apply the actions. Humn... if we need it more
>> than in just one place we can do that in future. For now this does the
>> job.
>>
>>
>> > +		}
>> > 	}
>> >
>> > 	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index a54f7f82d04d..3766b77a0d90 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -1267,7 +1267,6 @@ static void guc_engine_resume(struct xe_engine *e)
>> >
>> > 	XE_BUG_ON(e->guc->suspend_pending);
>> >
>> > -	xe_mocs_init_engine(e);
>> > 	guc_engine_add_msg(e, msg, RESUME);
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> > index 3b48934d99d4..7e495d699295 100644
>> > --- a/drivers/gpu/drm/xe/xe_mocs.c
>> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> > @@ -507,19 +507,6 @@ static void init_l3cc_table(struct xe_gt *gt,
>> > 	}
>> > }
>> >
>> > -void xe_mocs_init_engine(const struct xe_engine *engine)
>> > -{
>> > -	struct xe_mocs_info table;
>> > -	unsigned int flags;
>> > -
>> > -	flags = get_mocs_settings(engine->gt->xe, &table);
>> > -	if (!flags)
>> > -		return;
>> > -
>> > -	if (flags & HAS_RENDER_L3CC && engine->class == XE_ENGINE_CLASS_RENDER)
>>
>> do we have any other plans for HAS_RENDER_L3CC?  It seems it's not used.
>> For any error handling part we could check size, table or
>> unused_entries_index
>>
>>
>> Lucas De Marchi
>>
>> > -		init_l3cc_table(engine->gt, &table);
>> > -}
>> > -
>> > void xe_mocs_init(struct xe_gt *gt)
>> > {
>> > 	struct xe_mocs_info table;
>> > diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
>> > index aba1abe216ab..63500a1d6660 100644
>> > --- a/drivers/gpu/drm/xe/xe_mocs.h
>> > +++ b/drivers/gpu/drm/xe/xe_mocs.h
>> > @@ -11,7 +11,6 @@
>> > struct xe_engine;
>> > struct xe_gt;
>> >
>> > -void xe_mocs_init_engine(const struct xe_engine *engine);
>> > void xe_mocs_init(struct xe_gt *gt);
>> >
>> > /**
>> > --
>> > 2.39.1
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
