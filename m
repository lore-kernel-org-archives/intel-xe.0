Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE4C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 12:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E7310E009;
	Wed, 20 Dec 2023 12:51:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFA310E009
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703076695; x=1734612695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nm5TD4+C9+Y7FNNpec8TsOI4Vjqs0P+ABvGFQngyMio=;
 b=HwTHKVXpp3sCBm5rplFNoeX7CtUuybYhAVjScJv+Vfyk/nf4ZTQzsfTq
 7FoRYGbOg+KiPMPYlHBSxqFtfq3nPW/n6AuZU2ClNmbRE0SVhN1PSTYOY
 raszv3m9oFIpGCuhyobCa1goVGeMqWq9yBaASDel0R2vj2jCl6y6cgz/z
 HK3GuffUqinAXPrAMoCqjA68iF+R1SFfPg9Z9A4zuIcH/pCkSWbvp6ct7
 w6ubNTKdknTrcr+WiOeFEziaLKL1j3GHQ1DC3XLM7tKt61xT9tVxR7n3T
 71vYQfC8nw7pfx4xYbb+trXna3RaUU27/Dx7jtHAIvJ/eXk6FO2O9pxAa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="481996350"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="481996350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 04:51:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="17942937"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 04:51:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 04:51:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 04:51:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 04:51:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grzVdfitcm18xKsyi9fqgHvr1d4CQXlobwKG577tpd2iLSUGqZdPGqqAG3PpbNDLY/gwdSd/CbQSIOqdFTOeOC3dXOvhox13O4+SrqwFiJRbKav/wDfRnx5Q7o/1YwEiROSyVJwLHxHfDPHgLYJBsqLY0rw1FBjSywSG/ljV9PmJLhi1gbTsiSR4fGMF206Dz07hmqF0v1+Q0LDlPANcQimDLorRyfT10dIcN2XPBbaguWi2603cyGo70HqHHqa5sAM0JjsBq/myjfmCbaiU+VVvA8HFz3iLFxhqaqNgUOkO2h47MzwNhVt2HOcgARqIcQIEh7DSJO5AIt3NvmFunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gVxaogt51RiFuK/atQ4XQp5tjbbmN/6285BlgJb7tQ=;
 b=j9A//Pc84D7TZx3cCZ5jkqIowGaVuUUK/zrIaymsE/GVhA9phsQrtreUEMgEvDDmcp/a85doD6C2sQSZW/BlNYt4PEXv+c5Vr4OoPtVdMJZo6kBl13HWaZvcsqljmZgs6SUwUtMYC+JwkrE3y1/gCuWfuqFStx2Bilf4ss8VxmTHPbO8Ii3+wFa6BlGBjJVVQQZkQf+toLaKYjbYcv9QlDwghx13M/b+TqxLK0qpgyIohvWtzkJA1DzKYULfL11k/UwRUkwWbrMmGioQbW0EIFXG4psWyBLSJwnbrxAAORYLUXojW7/EBWkl1FybTlkpGRDT+05swpEdala81HduGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 12:51:31 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 12:51:31 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>
Subject: RE: [PATCH] drm/xe: Add wait for completion after gt force reset
Thread-Topic: [PATCH] drm/xe: Add wait for completion after gt force reset
Thread-Index: AQHaLxS2OW3P7XCHAEyvZnQ954M1drCqjWIAgAANrgCAB4ygMA==
Date: Wed, 20 Dec 2023 12:51:31 +0000
Message-ID: <CY5PR11MB62118022C5A132ED232853F39596A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231215051541.2536859-1-karthik.poosa@intel.com>
 <ZXyCGMbgOXZBnYYa@intel.com> <ZXyNkit45DB5dTHr@intel.com>
In-Reply-To: <ZXyNkit45DB5dTHr@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ0PR11MB5072:EE_
x-ms-office365-filtering-correlation-id: 4f8e3845-9248-44b0-96cf-08dc015a63d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmK4UsYmWx+O2qOZ/VSf+G3hvjGWgtrLeOTwLoKWIOhWRULeLo/SycIF2fa59eMfcTuSqFoTCg/3Mf3k7FaoFzvpql1dTlWiDVTraQa5pdMGdrgKNvIuCgfYKircu22r6FV85GwPD9RVF9YfTAOg5lp5F/Jjmgrj+6HQOVERJp3qBcW8Q7AgqNENAmC4lUFUT9IC88te2Lbb1+CRkEfJAwpFfyxdW4FVFRNrEBO+xfhcOl+0zrfMUMdAn9YrY6xQSA2addQQ1BSVrlz6RjG2BfwXvrYxMikC68uPB/5Vzq9vNj7fLGSnVAn4g/wfqsfz3XPpQW4uGE8YSRmmSZyEIvUBq8U6CxDZNNpWZc/KBZZM11Wzk9QmpMTO7Wi71CZhyoz57AdIa+MGAlzNikJmLHlE48RdZsg+Gf3he5ux0HVFIDjEmIVBoAq61eakdaqf1mkfnA+e3tDTh91B/2HzoNCJvq5n+5zcAQ8KyGYRbPrl1bI6p8+8dhnXb8GB/EUmsiQH2ALXyI3903NhA7mhzc89d4jBff23VeeoUoKXMUtDDVLSgdYSJfFmFG8FwZuAkNrQ3Bsojk32kRT3OXAjC0Wd+KcgEfA4W5TM3+kdZ8xxw2CqfM35DGW8wtb14Hmq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38070700009)(55016003)(4326008)(52536014)(26005)(83380400001)(53546011)(9686003)(7696005)(5660300002)(64756008)(6506007)(66476007)(8936002)(6636002)(110136005)(66556008)(66946007)(76116006)(8676002)(66446008)(478600001)(316002)(122000001)(38100700002)(33656002)(71200400001)(82960400001)(2906002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TGR+me74opjhZYrMwTjcmshl6fQ/9gaTBmid+LZwxmIK816RUb6WfQfJ+Rzw?=
 =?us-ascii?Q?sMLpKnxiCQIJHZxQwVmF7melcDplnyqB6MTbIqUiRLG44kX4hsm4BDAXHvfH?=
 =?us-ascii?Q?jW6xtWPaf4StavxYLVPS8vTnu0mec7YXb+R8U3XOic5nKu/7d9epZ8uk9B/p?=
 =?us-ascii?Q?Y0iIAw/mu/mCEbD5iyju3WUD62qlWzI+Ona1NL2IPkUEqP9GHtsKIaxRwQYe?=
 =?us-ascii?Q?magRPCmHNJPHoEd51RP/Ku6N32qJFp3V7zOV43sldziKauImWa/tOLlL72xg?=
 =?us-ascii?Q?MPZuNAcYVTP/uCkLnhcbKmcA1C7K2JBUrwVibh4LM2DPf3w5n/fiB1o+rAq4?=
 =?us-ascii?Q?4hjjBKRuXZIUZ+Rf+m1tnV1WWCyKtPJEX15MgcRHGSmv/Xym3gLqDToY7GlZ?=
 =?us-ascii?Q?dzepACXatzWx921Kk8LUzLe0LIMTbsoLM9EzaolfKolq6AxvqDbc+6uJEbgV?=
 =?us-ascii?Q?kaOWMj4LjeTugs5GgWdWx5e3pBDJk4J2PlO3P7ne+4xPR6n7X9krYMsbXBLF?=
 =?us-ascii?Q?PK9JK6ddxVvTpkwNP0z9A0qikZYrdgTVrKmn/dSoanPDx07YK0N3oQL3msuE?=
 =?us-ascii?Q?EMS7g3TjFzijo8csULDoIunajkNEfasSWwa/87edMjK30EPeYeZ7d4dm4m5Q?=
 =?us-ascii?Q?cIMHFPs6rymkMvJVYSCjJ6u8v8X892qf6i64V801jujrIMoQPxzyi/flLzon?=
 =?us-ascii?Q?4tyDJyuj+gv9VAsFyH4ivN5H58PYKagRrIb1JFTPxA+YtYoa9qbgYhokHdCh?=
 =?us-ascii?Q?TIo/OmICNXE12JDlaSQHICvifenSNlQCzNROb4cZa5jNchwAqjNb2/FFxo8k?=
 =?us-ascii?Q?4foarUg3VbROn45JPOpcZqi11KluHpoYeNv4vQo0reuwoDSO9g3R7qDxG9gi?=
 =?us-ascii?Q?YXFILH4qYf9o6+FNOlpc79lsvgvH4xi7o2dpUikJwgMVEA/1c6YdyrTZaXp5?=
 =?us-ascii?Q?KSvXZVa+FEgrsGVOqDfVIh0VOPd0DTifbcNqVKNVKJo8aVWmmd6cLhx3PJWv?=
 =?us-ascii?Q?3jaeaJ6U84O0+w4b3l4/4xAJAXejUSPs1kGNTz8c8GBr3gkPDGtZNEZ3ReOy?=
 =?us-ascii?Q?gkhaSY7CrGCfAgcly2W/3oCSagMRgh818TtxmTjQ9BqfcuLZ+ROOTIPlKdjX?=
 =?us-ascii?Q?ftVvlGZg+3xbPzrqlSvj/g+dFayyY02Rrw9pvf+7L7F2LOjl3PHLLb+ipfE8?=
 =?us-ascii?Q?gPE9y9eiI5FPbEvd2Tq2j2ePbdR3cX8dVaWCtWFcjNUNDCNCt/xA2HwMnOqm?=
 =?us-ascii?Q?RGNOwdIqiRU7LYpuH5Ue2lPD+HidkR1SAEIGgay+Oz6vTd3Q7YSwmhp5Eoxv?=
 =?us-ascii?Q?UqpNCtT6WqC6JgsjIfuoZtui2ijnmRHdS6r3kmH9CrY47d7+NFbhAZqBPY3F?=
 =?us-ascii?Q?+oOJJGSerpXD1T8n21Xie2lUIUvjRBQ9sGx7+EK1LsbSccyEptM8JyEIvW2/?=
 =?us-ascii?Q?dGSI/mZu/oGcSBnbE64mDmBdc4pPTzHWi0LuKUsoUI4xH9jkl8cGFxGSZieE?=
 =?us-ascii?Q?7SHFXmyqmocW1tmyjHLSnDBSJwFG0HrzUHpWRxr82QgD1zSJaNGJ2SCkx2bG?=
 =?us-ascii?Q?tKSC4nBjqatNK8C6YeDE4yMbSUQsHDejoO/fnSII?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8e3845-9248-44b0-96cf-08dc015a63d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 12:51:31.3093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYUKjdKbna3jcU+YD5mb8A/yP8r3ZoQb/Uo694iKUVXTRqjGwTAQdNjUy0arlXcZDfb2XNg4zIZ2UczmlDMn1g66qyG4bI6yqfC5LjnE7J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5072
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Friday, December 15, 2023 11:02 PM
> To: Poosa, Karthik <karthik.poosa@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Add wait for completion after gt force reset
>=20
> On Fri, Dec 15, 2023 at 11:43:04AM -0500, Rodrigo Vivi wrote:
> > On Fri, Dec 15, 2023 at 10:45:41AM +0530, Karthik Poosa wrote:
> > > Wait for gt reset to complete before returning from force_reset
> > > sysfs call. Without this igt test freq_reset_multiple fails
> > > sporadically in case xe_guc_pc is not started.
> >
> > \o/ I knew I was missing something there. Thanks for finding that out.
> >
> > >
> > > Testcase: igt@xe_guc_pc@freq_reset_multiple
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c         |  3 +++
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++++++++
> > >  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
> > >  3 files changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index dfd9cf01a5d5..eb7552b6dfa5 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > >
> > >  	gt->tile =3D tile;
> > >  	gt->ordered_wq =3D alloc_ordered_workqueue("gt-ordered-wq", 0);
> > > +	init_completion(&gt->reset_done);
> > >
> > >  	return gt;
> > >  }
> > > @@ -647,6 +648,8 @@ static int gt_reset(struct xe_gt *gt)
> > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > >  	XE_WARN_ON(err);
> > >
> > > +	complete(&gt->reset_done);
> > > +
> > >  	xe_gt_info(gt, "reset done\n");
> > >
> > >  	return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index c4b67cf09f8f..49b30937a28b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -23,6 +23,8 @@
> > >  #include "xe_uc_debugfs.h"
> > >  #include "xe_wa.h"
> > >
> > > +#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5*1000))
> >
> > 5s seems to much, but anyway, this is a debugfs function, so, no if 5s
> > fail, then we do have bigger problems.
> >
> > perhaps we could get the timeout as input?
How should we get that, I guess debugfs or modparam, sysfs will require a u=
api user ?
Thanks,
Anshuman.
> >
> > anyway, it is better to have protected like this than the current racy
> > one that we have.
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> ops, let me tune down my over excitement here.
> We need to address the feedback from Badal that was given at intel-gfx ml=
.
>=20
> >
> > > +
> > >  static struct xe_gt *node_to_gt(struct drm_info_node *node)  {
> > >  	return node->info_ent->data;
> > > @@ -58,9 +60,17 @@ static int hw_engines(struct seq_file *m, void
> > > *data)  static int force_reset(struct seq_file *m, void *data)  {
> > >  	struct xe_gt *gt =3D node_to_gt(m->private);
> > > +	struct xe_device *xe =3D gt_to_xe(gt);
> > > +	unsigned long timeout;
> > >
> > >  	xe_gt_reset_async(gt);
> > >
> > > +	timeout =3D wait_for_completion_timeout(&gt->reset_done,
> XE_GT_RESET_TIMEOUT_MS);
> > > +	if (timeout =3D=3D 0) {
> > > +		drm_err(&xe->drm, "gt reset timed out");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index f74684660475..6f2fb9e3cfea 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -358,6 +358,9 @@ struct xe_gt {
> > >  		/** @oob: bitmap with active OOB workaroudns */
> > >  		unsigned long *oob;
> > >  	} wa_active;
> > > +
> > > +	/** @reset_done : Completion of GT reset */
> > > +	struct completion reset_done;
> > >  };
> > >
> > >  #endif
> > > --
> > > 2.25.1
> > >
