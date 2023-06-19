Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A419AEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 05:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1786B10E02E;
	Mon, 19 Jun 2023 05:01:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8834910E02E
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 05:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687150911; x=1718686911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wEXCSKpvG8MH0GUurjCAzvlpvOKesZ2z3knTkS9DAbI=;
 b=eHvYe8TbFdVAYLn2Duy+wjlad6dKHypbWKkWr+KHO4Pm03K+KTXeCn8m
 u6O9QJ5Uydd5+/770i9rndqJDtM/vWlm1/CTS4nIMyVTkTsPsE6w34o9s
 bsREifjsbOXDZQVYPgfQYj2FFirIH3ZP0Ryjz5SLYEFS+/XvxTPO+UY5C
 zBIiHyR3rtIj9h6v5AY1ESWGMaQFjIOUvkKbDO9Zxvva9b0zXEv19zGi9
 TJRbKXq+DuwZANpSkGOm3PchUt+iRm2NEboSGPD6DodY907ga/+fclFMT
 TVndtpj9AyZMdzQJetK8jY58z089pZuixWycOOVLVZim279RexOeH4IPz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423205825"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="423205825"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 22:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="690959243"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="690959243"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 18 Jun 2023 22:01:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 18 Jun 2023 22:01:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 18 Jun 2023 22:01:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 18 Jun 2023 22:01:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpopfim+TOS61vpbxS1MWgpyOrkhq2azp8xC671IHvgd/LZEdUUEeapCRudLzo04QuP/BCj86FaBkgtJ8WnZpr3kcU3Lk8ev4pb1JP1QnAPsKM6gZ56qHvgkn6hS/IJ9GkP0XjSE27hdDMVClkBuJQGM8L/vAZ6SUCQOiyg0i9UUzLkW5dZvctldU3Peb2bJHcKVxaJGh+h/heF88Dd/yIjMR0+/YbwuHHR925S23yIyJ666IgNlJPQSflBXND0i/+WY7vlBD1JhulUjfoAHMesGTttyRSQW3+ii4OMTd1/nqDx/OrgFOHR+wWqyXUwwFC1MPVV77XOSupDFAmbcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxoGLbZf/X5DSUH73kVhPQ/JfN+Q60g3pNXK5fEf63Y=;
 b=fkheBGQdyenOz8RNN5CE44XxMxOEYcqcub2DSsWpxKOuawPb6wZUY7i/uJGf9pSp4sw838zCE2ZcM76z0S0U97g5aqAP2z7+8bJAO1bHSDFLq0DzxhoedSeG6vnbrWMnYVMJvdGnziGY5NYmKGpA3y6Qh7cpZ7IPk6LIlpqKbfa41/5ct/8vtcBdRkxzvmoPDtiQoBSbe7mdfVtGXYBEqL1k5buwDNqqNNfKfrzybYGQPpl3fO67Un6mVc5sWpX6fb7LgV/BvUM9Q2fxz7oEeJdOBAZmMRjaM5DxV3SVzNZLb90+x4fDDS7PZOwXP6vwjsal9Px28+fI7Vm8CzGjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SJ0PR11MB5616.namprd11.prod.outlook.com (2603:10b6:a03:3aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 05:01:46 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::e6e3:34e6:63b5:9cba]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::e6e3:34e6:63b5:9cba%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 05:01:46 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH 2/6] drm/xe: Add sysfs for default engine scheduler
 properties
Thread-Index: AQHZn5OxKKn5IfJOJEycMUexqZ8NEa+N5kQAgAOtYZA=
Date: Mon, 19 Jun 2023 05:01:45 +0000
Message-ID: <DS7PR11MB6197AC215DD38AD284EF93CE815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-3-tejas.upadhyay@intel.com>
 <ZIzInHB8NmkuwWd8@nvishwa1-DESK>
In-Reply-To: <ZIzInHB8NmkuwWd8@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SJ0PR11MB5616:EE_
x-ms-office365-filtering-correlation-id: 66eae53e-ded0-4180-b055-08db70824801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42oXJor2B4CuizjP6jMIC+vHOdmnJxhULFCDggZlC8xFxl5brHaojHBYIusS/D3epGNU+4d7G4LYVEv11nKoe387CqN12E95xiubDd6re0dimhe0oy4mXBYt/pbZK53TwF6QSe6ii1XL7OVMXoeQFInkhzJmmS31MmIRcA7PLwseRm/PiK/ziEy5YdWVXDTJ0KGwymFXrRNGrYEcsQQvXlAEGuTBvsRSw5TDVmwvoCmJGZwORP2MlCH3shAaMwsaPJc7037U7jgGPlCAhY3/IcTMIpBvvCCSJDBcYueKlMQfXzKY6d/mRT8hivzpVEhpx2uGI2A8+LTUoZud7nBlZEkgyHvXyX/hOsll6tsRhKfNgDnkTvmu15RWQAkZRDvr0QxJyUsrFcAk72zuhVN2HoOLgrRfyXE5xB0ueFMgT8pfUk/VilDtwywN9UHOazOy5tqeMSNdj7qUvWh6VDWh5mW0VJZMTaxoDY8VOQYEwDct04l3FKRSRUTL6RqHtnkk8SBuj4BOVZBNHl7KVSeXsRUVz2s8nDA713qI6TIXo1XW6xRPOkHmY/NSwtAmC6DlkZma/nVd4vw/gz1hv8fd9iV4cfyXf2BGaVKKBQ6wCsL6lnTf2BuBN9QWytOgzBKm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(4326008)(316002)(76116006)(64756008)(66446008)(6636002)(66556008)(66476007)(66946007)(5660300002)(8676002)(66899021)(52536014)(6862004)(8936002)(41300700001)(38070700005)(33656002)(86362001)(30864003)(2906002)(55016003)(71200400001)(7696005)(38100700002)(122000001)(53546011)(9686003)(6506007)(107886003)(186003)(54906003)(478600001)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n1XT4zFrmGZbpqlObackwHHoOKIBSPU71T2GGlgJjevZzBtrTkdrgb2NmVdn?=
 =?us-ascii?Q?sAVK9rFjIjeQtDz1nCW4MagkFt4Am563EjLG6TK25qt2mr4kkict+N4+SwpX?=
 =?us-ascii?Q?JTaN62/F2e1MD9uh+IMIYSfQjwZGUesn0W1Qi9cb61mYygSO5BsHqYUc5qjK?=
 =?us-ascii?Q?SD/F/G///FSXWckNCx51QQW9wMLUSiQxS2YMxbQFzIzPmm8/OiwyMmogh+hg?=
 =?us-ascii?Q?YD3yrUltciFGpFEI3Lxj88PaUtqeB+zYo2sj+Wt/WIguGVr0z8+u0RnNasjb?=
 =?us-ascii?Q?3o1DkJz1+uALMjn6+cLsTverffFLWDpW1icuuFNv2vv9YzMvL/4ZpJP2XoYP?=
 =?us-ascii?Q?rICNWECv1BUVtOEvVmuywkYQFNkr3T5wxm804r7ZvQKBHWInAWwj4S+YX2eH?=
 =?us-ascii?Q?j7V+TcvGGFO6bq2JzWFaF4H9Jq0rv+PcBFEejvNAoVIz7sadLxUSWUyLxNEg?=
 =?us-ascii?Q?dtko5JvxnlRI+cwErOQoipJqy3hjvCEY0dZeH+8/BeiPY8njQjkJRUlDlrEC?=
 =?us-ascii?Q?oZeYyYt1DqX1iv93hBHlJyzDtj64MT5C3VvkdRC+p/ib7JmqLV3b7CYXg3JK?=
 =?us-ascii?Q?/FoiAiRTSrZoXOZsPqgvIYOCt1CYbrrj6IdXw9aHJoVlQLPRtMP2K4eABCIA?=
 =?us-ascii?Q?0zV9bKQLkvetwDyhsnHWsuf+Nx9z3LXq6urP6vFeKA++22LLBqcfI5ldtDze?=
 =?us-ascii?Q?oN2kU0Jhl+sprN8mNgk2vB2YygrqI1rSe1fYQ7RrtdjEehpeqcgfqQaE3pht?=
 =?us-ascii?Q?fTmUKNLgMDWtJNuKYVFiUeP5vTuUAlu3CLO9HLiWUv+JcXOZuKLPaPTpGYuQ?=
 =?us-ascii?Q?63Q0Wi/fH3d8WsIOjfeAkoEaRjqtFoIxUoaJgD7RY/S+W4E3fwdoEBxoBX78?=
 =?us-ascii?Q?GEl8NMSpF2Zpnqx5xoRqsz56+c/Rh7H5N0NcnsD55R7+ZmOTIIswSYR0Uzi5?=
 =?us-ascii?Q?7n5l/9zwAc8TwY9smIYO5zzBILVw1Agt1svwbH3mOWB606HuyPfM0TFW01Mt?=
 =?us-ascii?Q?yQODWEykdJL6CXm9B33wy7j/Xd14CpEnF83gaQNrT6dP2TxtYzkkqdKipXOa?=
 =?us-ascii?Q?u9gyV+iM4C4l7My/XZ+vUhrEnsFKdPulg8JD3MXNAByvdOXUpOz45N37uOV8?=
 =?us-ascii?Q?9swWdKWbYmIIZtHN/uG4gDD5R7smic4Nma4kSzUCXus0oYlrOKObZMzyGeHE?=
 =?us-ascii?Q?CNMZgXyVst9ltlxl9zpMcYZfDlOrLT+jsw/runJaDvq8jzQC7YGLrsaWRLkE?=
 =?us-ascii?Q?VBGNDPayWFSU3k4/qFF8Iq7gRSuyDBAb/WsIUdGbH6XbCjjQ4y/TY2SnxIwG?=
 =?us-ascii?Q?JtgmqqEgJ69ErrvItpIvIx7hhRLdclTsMCgNn0tT6vyOoP8edZ1hP9jM9Vnd?=
 =?us-ascii?Q?xs+Xn+Ym+bDW1DsnIQgLXHRlF+PC8knJ2arGkR2x2C9PO5ogE8G/WH0W4+04?=
 =?us-ascii?Q?UENbm0JrJNJzdfn4QTdpmimO0KKLOznL+KPU2fXbI/tcJFrZbwM21sEuvziH?=
 =?us-ascii?Q?NvwODDC1GPd41vr0OcrLEPwyN6EdJKV1Ye3/ee8Vb0JKpSsBKMDmffouNpap?=
 =?us-ascii?Q?2f53/ofxjQWCGP71I4UGfhWlL7FGDh9d/bLFr5P6Cm5ZsKB6jnvdX3WHRHXn?=
 =?us-ascii?Q?jyEUkUuXu7SsmY035bCb8cN/8pifzp5AqDXHmOUF4x7n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eae53e-ded0-4180-b055-08db70824801
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 05:01:45.8840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1lJT7gbPwn5Qzk5SoGSUIhdZLfzIBigHrdFLTEwJyTZZcu2MgzyKe9hJwa6flWZE+GZQKR491crwx4TJooGIIwmHuvySbneEl8rZgZR23g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5616
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Add sysfs for default engine
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
> Sent: Saturday, June 17, 2023 2:10 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH 2/6] drm/xe: Add sysfs for default engine scheduler
> properties
>=20
> On Thu, Jun 15, 2023 at 07:49:29PM +0530, Tejas Upadhyay wrote:
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
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_engine.c          |  4 +-
> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 94 +++++++++++++++++++++++--
> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
> > drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
> > drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
> > drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
> > drivers/gpu/drm/xe/xe_hw_engine_types.h | 11 +++
> > 7 files changed, 128 insertions(+), 9 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >b/drivers/gpu/drm/xe/xe_engine.c index b3036c4a8ec3..e72423bc398a
> >100644
> >--- a/drivers/gpu/drm/xe/xe_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_engine.c
> >@@ -53,8 +53,8 @@ static struct xe_engine *__xe_engine_create(struct
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
> > 	if (xe_engine_is_parallel(e)) {
> > 		e->parallel.composite_fence_ctx =3D
> dma_fence_context_alloc(1); diff
> >--git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >index 7528cc723699..72809078bd83 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >@@ -32,22 +32,92 @@ static struct kobj_type kobj_xe_engine_type =3D {
> > 	.sysfs_ops =3D &kobj_sysfs_ops
> > };
> >
> >-static struct kobject *
> >-kobj_xe_engine(struct kobject *parent, char *name)
> >+static ssize_t job_timeout_default(struct kobject *kobj,
> >+				 struct kobj_attribute *attr, char *buf) {
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
> >+	err =3D sysfs_create_file(kobj, &job_timeout_def.attr);
> >+	if (err)
> >+		goto err_object;
> >+
> >+	err =3D sysfs_create_file(kobj, &timeslice_duration_def.attr);
> >+	if (err)
> >+		goto err_object;
> >+
> >+	err =3D sysfs_create_file(kobj, &preempt_timeout_def.attr);
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
> > int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +142,7 @@ int
> >xe_gt_sysfs_engines(struct xe_gt *gt)
> >
> > 	for_each_hw_engine(hwe, gt, id) {
> > 		char name[MAX_ENGINE_NAME_LEN];
> >-		struct kobject *khwe;
> >+		struct kobj_hwe *khwe;
> >
> > 		if ((hwe->class =3D=3D XE_ENGINE_CLASS_OTHER) ||
> > 		    (hwe->class =3D=3D XE_ENGINE_CLASS_MAX)) @@ -109,6
> +179,18 @@ int
> >xe_gt_sysfs_engines(struct xe_gt *gt)
> > 			kobject_put(kobj);
> > 			return -EINVAL;
> > 		}
> >+
> >+		khwe->hwe =3D hwe;
> >+		hwe->sysfs_hwe =3D &khwe->base;
> >+
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
>=20
> More on this below.
>=20
> > #endif	/* _XE_GT_SYSFS_TYPES_H_ */
> >diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> >b/drivers/gpu/drm/xe/xe_guc_submit.c
> >index b209e4c2a3a9..bc0ffcf9fb1c 100644
> >--- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >@@ -1063,13 +1063,16 @@ static int guc_engine_init(struct xe_engine *e)
> > 	ge->engine =3D e;
> > 	init_waitqueue_head(&ge->suspend_wait);
> >
> >-	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> MAX_SCHEDULE_TIMEOUT : HZ * 5;
> >+	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> MAX_SCHEDULE_TIMEOUT :
> >+		  e->hwe->sched_props.job_timeout_ms;
> > 	err =3D drm_sched_init(&ge->sched, &drm_sched_ops,
> > 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> > 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > 			     e->name, gt_to_xe(e->gt)->drm.dev);
> > 	if (err)
> > 		goto err_free;
> >+	/* Record timeout value, in order to show current set timeout */
> >+	e->hwe->sched_props.job_timeout_ms =3D timeout;
>=20
> But, timeout can be MAX_SCHEDULE_TIMEOUT which can be more than the
> max defined in the patch#6 right?

Yes, how should we handle this, any thoughts? Thanks for pointing this out.=
 I think we need to change default max timeout in that case to match our co=
nfig?

>=20
> >
> > 	sched =3D &ge->sched;
> > 	err =3D drm_sched_entity_init(&ge->entity,
> DRM_SCHED_PRIORITY_NORMAL,
> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >b/drivers/gpu/drm/xe/xe_hw_engine.c
> >index 68cd793cdfb5..8314429cfa90 100644
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
> >index d788e67312b9..406a1e33a05e 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >@@ -107,6 +107,17 @@ struct xe_hw_engine {
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
> >+	/** @sysfs: sysfs kobject pointing to this hwe */
> >+	struct kobject *sysfs_hwe;
>=20
> Whwere is this sysfs_hwe used?
> I wonder whether we really need 'struct kobj_hwe'.
> Why can't we just have kobject defined here in the xe_hw_engine sturcture
> instead of having a pointer to one. That way we don't need to kzalloc it.

You are right, its miss. I initially thought same and added sysfs_hwe and e=
nded up not using it. As container of does not work on pointers.=20

If we add it as part of xe_hw_engine then also allocation will happen right=
! And other reason to keep this way was to maintain uniformity the same way=
 GT sysfs is doing and same way its done in tile sysfs patch(which is on pa=
tchwork) as well.

Thanks,
Tejas
>=20
> Niranjana
>=20
> > };
> >
> > /**
> >--
> >2.25.1
> >
