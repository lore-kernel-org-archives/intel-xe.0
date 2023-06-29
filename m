Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3482EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 04:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6DA10E021;
	Thu, 29 Jun 2023 04:25:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373E910E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 04:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688012729; x=1719548729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ne2tWNRRLaUIkYQ7+7/RdfljKpLOWsF342foH14SZqY=;
 b=I/bZWlg688pLv1TXfa+d5ugg/8iWlzgTB9S4uIXTJyK/Z1g8wtsD7SRx
 tXSBTqifBZhtmwCngfbsSr95FOYjojCBPOISxdz3DZOjQfJY00cqW5bjJ
 nMGb2mVatea6wqU5+nGxbq4JEvLT+lXkjuJrsLnCUiA6xfT6waVmeSQXZ
 I0ocBylexFrgtM9IjRuptokzTuElU78uYfBsky4NakMV1fVP5Vd0ggnNx
 gkp9pVIKFj6v7J8nwV1CwgvMwb36kMdWZBDlViM7PTosKK8T50Z2vpEVj
 cNeD/DPGNVg+hLhdOykp6+pykCSr8mVT31PIaXddwm7r0IUkymVk7FX3X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360868428"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="360868428"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 21:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="667375521"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="667375521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 21:25:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:25:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:25:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 21:25:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 21:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFxiM24c98j8ObkI/1NMxtFJSpgQGVjf2eqU+jpqNa5DIEgP8+0wfXtvwz2PPUN1tHICNOPRbXIey9kNSDhqOAK35j6EFXnG86xwfhWaO78ROAzApJmE1veRgX4mMGyqF5kb9bPiBNl0FwCsdEzKI9FVG/xRlpEwiUZ15gpBJ0uztqWxTX5zSZ9zj7nRxbClm66zMvnlDjox/kk/JTGIyqml6GDT7bnSaeP5a5e8oovJ3sGoulympaCuofHHlYQ1uvRQGXNQo6XILG46ZD9QgwEesIYc4lBAoFmM+wTYnVNkBUmE/g+JhLlVfPCZ0g+T1VnGKY2wJIeMSynaFQ6ejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmpstbGM5UgaTpjPx3zbQzeFP+7JhG6zFJclFmxbRgk=;
 b=YQ+zO0PLbZEUs+11LB/OH7oEzl7Xtu3ZcUkx3Y5yl2UGI43hmAFKM+5ixKX+tdK1wZXCxbY2G2XfhrS8vroinNpZ+LIOEeUIhKGjf90Ms0qpvb6QbHOt2HVrrdmQSxntykdeM0S4GLEkDQFkLBioxG5J1BFQ6DQzisdel8mEmIjaQ7xLV+fUUcUXORk0qYGcaKijwAjnopiR8eV+m4ZDalCih4ulEfS3QEj742T15D3FKGOvxEfsBzPY45XmjmL3G0Cea5/Ffr8d5sk53LMA4jJot7tDXG49JTr8htJdLVPi7TbEm/GDooTX2D5Ap4Vcur0fxBFDyMMuv7X9Oa/13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5625.namprd11.prod.outlook.com (2603:10b6:510:ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 29 Jun
 2023 04:25:24 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 04:25:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH V3 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
Thread-Index: AQHZqbWDz2uwvtLj90+9ncp+b6xQwK+gqySAgACEMNA=
Date: Thu, 29 Jun 2023 04:25:18 +0000
Message-ID: <SJ1PR11MB620426A38DE4B23AFF8CC0D38125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-3-tejas.upadhyay@intel.com>
 <ZJyYOxoB4imTrQsV@nvishwa1-DESK>
In-Reply-To: <ZJyYOxoB4imTrQsV@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5625:EE_
x-ms-office365-filtering-correlation-id: 663b298f-d6ab-4d15-13bf-08db7858d843
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Co/chT+//lxEkhBzh76HnD/iA7YDJXFBZb5US6AojwTGKIeeTs6QQ2TLDrOn8Jc94hPYy+K4r18fdCNJ94/GKgIZ5JCnG38VkAORWCRIJrX9dAeKuG+PXWncpsvTpvRUwyMthOrjxiEVADHqeJJKQSqdx3iMRv/+rLJ/WXeCyZ6uwGUutm0j+XPoxJ1PLeNE+CDjuYyQgDt5atwaQzJT82Mz+u7R8TGERK1DRSQO1AA81FO30FjieGzuAKyKb+ZwpeCrde30kVxuFVdUxov59+6pdxAFACG6tSRXRq6OuVBUc5CFk3c0fkSHJRz8CChM/JhacL/3AnA8Y8fs9Sq2M1wqdzIrhHXSTqxXaX+z3N12tYxweCXRrwyi1qnSIO0WxKY7objW+Nd1mn6uy7iijj5GLDOd75aoFlP0AzSBX7pUq7scSIzb41zLsEr8PZiJzqiMP4VTXI3ZGYxeZBffALYODVKm+X6IGs5uXfG2mq6xEjrCFyRzYFs5WtcQvbL+NsiyRjWk0l7OYfOQ2WwbzS3vHsbDRYEXvv2m5OqaqTbwc3nd/JERR3Vv93xUDIS2RU2oP5HLxuhhFFK9xqnfLCh2T54VSoO2JCcwPio2Hp+zgY4iqLtop8FcA7TjMAlt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(66899021)(478600001)(7696005)(83380400001)(55016003)(38070700005)(82960400001)(86362001)(66446008)(6506007)(66556008)(66476007)(64756008)(53546011)(2906002)(66946007)(71200400001)(186003)(30864003)(33656002)(9686003)(4326008)(6636002)(8936002)(122000001)(38100700002)(76116006)(5660300002)(316002)(41300700001)(52536014)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pikLbDLTNwjCuQjQrR/exYOFWs/n3M3EIK4lJ/SLp/WGBqkm5LSpDg1o70B8?=
 =?us-ascii?Q?X9cEumwKnZgpsewycDiohACkoRYjH4tMlBPDSkLeKGPumx/FIL+vgPfCI+ki?=
 =?us-ascii?Q?2pHjmcZbnBCahcK+sLRqY73b3jgwYJfB38L6qcGmVPGalFENGbBQ4TrLoPrK?=
 =?us-ascii?Q?K33Ww1FBdA724JFbbAf8i3nwHFs28aUhCV4DWJJp+Nji/MGMa7IRrinaidh3?=
 =?us-ascii?Q?BV4bXIS20L0nn0zPRA1gK+tdzX/D13wggsm5BSc/KHKCKtv94PyYhPoqY35R?=
 =?us-ascii?Q?a1uOsqhO2zUQxK3tDBPlFHMSUACYISzmGIL8RBf3jc4QcjZc4syeepJez3sA?=
 =?us-ascii?Q?HsH4rTAqDZRMNY8Q3YT0hDSbCxgiiDWj26IxYbW0o+rXZEKkROlb4Rzdp+le?=
 =?us-ascii?Q?DGyAapuDO78pVXpZFTW5KwLLVOTTVkCckFrteFOVKuRABmzWZlqiR2EuuZXI?=
 =?us-ascii?Q?5UI0CuHADiW3jiJtnOv0qqkksFpNelD63uwpKcRECIQ/IY/oSP6qmQBGakQQ?=
 =?us-ascii?Q?okj8t/FhqU5z6MoZfE2pZ0krIswJN6uklMD3zeVCID5HckQ/WICyxuM99B0a?=
 =?us-ascii?Q?1hLMqajfkw3XiZ1eogCtf9h7pAfQ//29bx968AqSTm4Dy39STS+bYX5OdCOR?=
 =?us-ascii?Q?6wx7tAnh3Jb05xO/Wmh4hpPvPMjKsKYuj3ral5GkK/o9IC32d7ZORJjcleEr?=
 =?us-ascii?Q?RMVM5+kLGHsNUdCimlGrdbDKgZZvMRWfpXE5/1ocgjkHw7K4LMHq0ND5NuEN?=
 =?us-ascii?Q?6wW7mucKjmjS2xcXKfhSUSQA2d1VTblLllSEdGRcXeXTv1Y25Habu6/sdGS1?=
 =?us-ascii?Q?y0KYgqYHJY7mr+5o79Xscxo9hupHyCFhcwMcyF4E93hFv4sXsykeie+bfPJH?=
 =?us-ascii?Q?Sr5o4vBPAIfQeDLYqFdDW3W7Kco1jtPvWDdUdhInhgytIxWZz5NT31yFzJvm?=
 =?us-ascii?Q?9epfIBY3U5P84KJkwVUMOgmvQT0k20p3LKbKBvtwkNZHseCQlT1TDZgFUhOG?=
 =?us-ascii?Q?dTz3YElKvZid6NavtBOhbmQcBD9rVh4NLXiULq7MDQR7UKFe/B2OJrViRM00?=
 =?us-ascii?Q?G5nkgxrESaGEuYb5ASwylbO98igg0I2a3mwxXYIS2mtAp0TZ79K2V2vCBY6G?=
 =?us-ascii?Q?rhs7AX1Q2UIKxDObz6T16HhzIHCQ55tjI2IpE6Cp9IzLTHZQc3n3WxNBh6r3?=
 =?us-ascii?Q?BYnJJxOCwx5d3d7fvjjaK1+3XLV4rsvkcR3HmJGrsGALtvDaMNQxeaEyPshH?=
 =?us-ascii?Q?4X2vuov0RDIWOnPqRVnaIWYt4/sEnA76+ntUERJshJXWmkQb7KhxXOUE69rF?=
 =?us-ascii?Q?zWOEx8IeYcDJ8fCNfDqPdTeW10t59yrqSNdnV6auVT9FN5AxTmT7mVCzlDUz?=
 =?us-ascii?Q?tnudBtxRb05imMps/UwgCH1jG0QFSr6gFPExZ80M29H7gyyEXfadqus8u//v?=
 =?us-ascii?Q?QV5dXTBYt5MEufJB2zu9zMiKqPY3LbuckiwztQaHEPG25ZrUVjdCMYv+fZ47?=
 =?us-ascii?Q?pN3xnGWaULGfSyRzuxHTTWwHp65y5WmB2Ffh2GBeFM0QAGQaUsrwrhPq8TwY?=
 =?us-ascii?Q?oR4C9Yhwbq4U5/1N9ZqehU10T398u9TByQlkuPhmyWiDTapnn5fQC/ElglLU?=
 =?us-ascii?Q?+clBkv38HOz4C6Ex4mYxbjr+i58VWyiwZlaojeYm/FOJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663b298f-d6ab-4d15-13bf-08db7858d843
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 04:25:18.3569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrkXNiWNRpfp7WzFCcFRdTdQ5tK4r0gAhves7hTcwVFPNJMmj/SpgLPZRQXH6M971UIwo/UKpLe/Z5xeeoKAPLJ2zZBjlm677JUMFvhPU0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5625
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Thursday, June 29, 2023 2:00 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V3 2/6] drm/xe: Add sysfs for default engi=
ne
> scheduler properties
>=20
> On Wed, Jun 28, 2023 at 05:17:28PM +0530, Tejas Upadhyay wrote:
> >For each HW engine under GT we are adding defaults sysfs entry to list
> >all engine scheduler properties and its default values. So that it will
> >be easier for user to fetch default values of these properties anytime
> >to go back to default.
> >
> >For example,
> >DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
> >job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> >
> >where,
> >@job_timeout_ms: The time after which a job is removed from the
> scheduler.
> >@preempt_timeout_us: How long to wait (in microseconds) for a
> preemption
> >                     event to occur when submitting a new context.
> >@timeslice_duration_us: Each context is scheduled for execution for the
> >                        timeslice duration, before switching to the next
> >                        context.
> >
> >V2 :
> >   - Use sysfs_create_files in this patch - Niranjana
> >   - Handle prototype error for xe_add_engine_defaults - CI hooks
> >   - Remove unused member sysfs_hwe - Niranjana
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_engine.c          |  4 +-
> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 93 +++++++++++++++++++++++--
> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
> > drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
> > drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
> > drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
> > drivers/gpu/drm/xe/xe_hw_engine_types.h |  9 +++
> > 7 files changed, 125 insertions(+), 9 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >b/drivers/gpu/drm/xe/xe_engine.c index 6e6b2913f766..33d1fbae560d
> >100644
> >--- a/drivers/gpu/drm/xe/xe_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_engine.c
> >@@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct
> xe_device *xe,
> > 	INIT_LIST_HEAD(&e->multi_gt_link);
> >
> > 	/* FIXME: Wire up to configurable default value */
> >-	e->sched_props.timeslice_us =3D 1 * 1000;
> >-	e->sched_props.preempt_timeout_us =3D 640 * 1000;
> >+	e->sched_props.timeslice_us =3D hwe->sched_props.timeslice_us;
> >+	e->sched_props.preempt_timeout_us =3D
> >+hwe->sched_props.preempt_timeout_us;
> >
>=20
> Shouldn't we be setting job_timeout_ms also here?
>=20
> > 	if (xe_engine_is_parallel(e)) {
> > 		e->parallel.composite_fence_ctx =3D
> dma_fence_context_alloc(1); diff
> >--git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >index 76bb6441e9c8..5f534f325823 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >@@ -12,6 +12,8 @@
> >
> > #include "xe_gt.h"
> >
> >+int xe_add_engine_defaults(struct kobject *parent);
> >+
> > static void xe_gt_sysfs_kobj_release(struct kobject *kobj)  {
> > 	kfree(kobj);
> >@@ -32,22 +34,91 @@ static const struct kobj_type kobj_xe_engine_type =
=3D
> {
> > 	.sysfs_ops =3D &kobj_sysfs_ops
> > };
> >
> >-static struct kobject *
> >-kobj_xe_engine(struct kobject *parent, char *name)
> >+static ssize_t job_timeout_default(struct kobject *kobj,
> >+				   struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms); }
> >+
> >+static struct kobj_attribute job_timeout_def =3D __ATTR(job_timeout_ms,
> >+0444, job_timeout_default, NULL);
> >+
> >+static ssize_t timeslice_default(struct kobject *kobj,
> >+				 struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us); }
> >+
> >+static struct kobj_attribute timeslice_duration_def =3D
> >+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> >+
> >+static ssize_t preempt_timeout_default(struct kobject *kobj,
> >+				       struct kobj_attribute *attr,
> >+				       char *buf)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_def =3D
> >+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >+
> >+static const struct attribute *defaults[] =3D {
> >+	&job_timeout_def.attr,
> >+	&timeslice_duration_def.attr,
> >+	&preempt_timeout_def.attr,
> >+	NULL
> >+};
> >+
> >+int xe_add_engine_defaults(struct kobject *parent)
> > {
> > 	struct kobject *kobj;
> >+	int err =3D 0;
> >
> > 	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > 	if (!kobj)
> >-		return NULL;
> >+		return -ENOMEM;
> >
> > 	kobject_init(kobj, &kobj_xe_engine_type);
> >-	if (kobject_add(kobj, parent, "%s", name)) {
> >+
> >+	err =3D kobject_add(kobj, parent, "%s", ".defaults");
> >+	if (err)
> >+		goto err_object;
> >+
> >+	err =3D sysfs_create_files(kobj, defaults);
> >+	if (err)
> >+		goto err_object;
> >+
> >+	if (0) {
> >+err_object:
> > 		kobject_put(kobj);
> >+		return err;
> >+	}
> >+
> >+	return err;
> >+}
> >+
> >+static struct kobj_hwe *
> >+kobj_xe_engine(struct kobject *parent, char *name) {
> >+	struct kobj_hwe *khwe;
> >+
> >+	khwe =3D kzalloc(sizeof(*khwe), GFP_KERNEL);
> >+	if (!khwe)
> >+		return NULL;
> >+
> >+	kobject_init(&khwe->base, &kobj_xe_engine_type);
> >+	if (kobject_add(&khwe->base, parent, "%s", name)) {
> >+		kobject_put(&khwe->base);
> > 		return NULL;
> > 	}
> >
> >-	return kobj;
> >+	return khwe;
> > }
> >
> > int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +143,7 @@ int
> >xe_gt_sysfs_engines(struct xe_gt *gt)
> >
> > 	for_each_hw_engine(hwe, gt, id) {
> > 		char name[MAX_ENGINE_NAME_LEN];
> >-		struct kobject *khwe;
> >+		struct kobj_hwe *khwe;
> >
> > 		if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER ||
> > 		    hwe->class =3D=3D XE_ENGINE_CLASS_MAX) @@ -109,6
> +180,16 @@ int
> >xe_gt_sysfs_engines(struct xe_gt *gt)
> > 			kobject_put(kobj);
> > 			return -EINVAL;
> > 		}
> >+
> >+		khwe->hwe =3D hwe;
> >+		err =3D xe_add_engine_defaults(&khwe->base);
> >+		if (err) {
> >+			kobject_put(kobj);
> >+			drm_warn(&gt_to_xe(gt)->drm,
> >+				 "Warning: adding .defaults to engines
> failed!, err: %d\n",
> >+				 err);
> >+			return err;
> >+		}
> > 	}
> >
> > 	return err;
> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >index a531aebd10d6..a539cf031c7d 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >@@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
> > 	return container_of(kobj, struct kobj_gt, base)->gt;  }
> >
> >+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj) {
> >+	return container_of(kobj, struct kobj_hwe, base)->hwe; }
> >+
> > #endif /* _XE_GT_SYSFS_H_ */
> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >index d3bc6b83360f..d0a5eae1bbb4 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >@@ -23,4 +23,17 @@ struct kobj_gt {
> > 	struct xe_gt *gt;
> > };
> >
> >+/**
> >+ * struct kobj_hwe - A hwe's kobject struct that connects the kobject
> >+and the
> >+ * hwe.
> >+ *
> >+ * When dealing with multiple hwe, this struct helps to understand
> >+which hwe
> >+ * needs to be addressed on a given sysfs call.
> >+ */
> >+struct kobj_hwe {
> >+	/** @base: The actual kobject */
> >+	struct kobject base;
> >+	/** @hwe: A pointer to the hwe itself */
> >+	struct xe_hw_engine *hwe;
> >+};
> > #endif	/* _XE_GT_SYSFS_TYPES_H_ */
> >diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> >b/drivers/gpu/drm/xe/xe_guc_submit.c
> >index 86c445903560..ecea38e9e639 100644
> >--- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >@@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
> > 	ge->engine =3D e;
> > 	init_waitqueue_head(&ge->suspend_wait);
> >
> >-	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> MAX_SCHEDULE_TIMEOUT : HZ * 5;
> >+	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> MAX_SCHEDULE_TIMEOUT :
> >+		  e->hwe->sched_props.job_timeout_ms;
> > 	err =3D drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> > 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> > 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> @@ -1136,6
> >+1137,8 @@ static int guc_engine_init(struct xe_engine *e)
> > 			     gt_to_xe(e->gt)->drm.dev);
> > 	if (err)
> > 		goto err_free;
> >+	/* Record timeout value, in order to show current set timeout */
> >+	e->hwe->sched_props.job_timeout_ms =3D timeout;
>=20
> Do you mean to set "e->sched_props.job_timeout_ms" here?
> Updating hwe's property based on e's property doesn't look correct to me.

In that case, how will we reflect what user has set as job_timeout as part =
of xe_engine_create? This is in default flow not through ioctl so it should=
 reflect current HW status is what I felt. Please comment.

Thanks,
Tejas
>=20
> Niranjana
>=20
> >
> > 	sched =3D &ge->sched;
> > 	err =3D drm_sched_entity_init(&ge->entity,
> DRM_SCHED_PRIORITY_NORMAL,
> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >b/drivers/gpu/drm/xe/xe_hw_engine.c
> >index b7b02c96e998..bd94155a28b3 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >@@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
> > 	hwe->name =3D info->name;
> > 	hwe->fence_irq =3D &gt->fence_irq[info->class];
> > 	hwe->engine_id =3D id;
> >+	/* FIXME: Wire up to configurable default value */
> >+	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> >+	hwe->sched_props.timeslice_us =3D 1 * 1000;
> >+	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> >+	hwe->defaults =3D hwe->sched_props; /* Record default props */
> >
> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> > 	xe_wa_process_engine(hwe);
> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >index d788e67312b9..7a8d275df6db 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >@@ -107,6 +107,15 @@ struct xe_hw_engine {
> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
> > 	/** @engine_id: id  for this hw engine */
> > 	enum xe_hw_engine_id engine_id;
> >+	/** @sched_props: scheduling properties */
> >+	struct {
> >+		/** @set_job_timeout: Set job timeout in ms for engine */
> >+		u32 job_timeout_ms;
> >+		/** @timeslice_us: timeslice period in micro-seconds */
> >+		u32 timeslice_us;
> >+		/** @preempt_timeout_us: preemption timeout in micro-
> seconds */
> >+		u32 preempt_timeout_us;
> >+	} sched_props, defaults;
> > };
> >
> > /**
> >--
> >2.25.1
> >
