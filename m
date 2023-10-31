Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51270C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 20:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5A10E5B8;
	Tue, 31 Oct 2023 20:09:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9012910E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 20:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698782974; x=1730318974;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=asKT3jYCuBd2V9Iy4D9frD6QexdS/CetDBoxnpbzgcg=;
 b=mcsFZkaUuwf43ZQasvaxzP2Bl52mGDMLVt06t7QQYKUQS5iW2tnjVART
 4QGSFcFvNb+mNAYETcjBtU8tsyB6gZLiq7VIDkpFDeFtNgCudf782g8I9
 Y3i8DVirEjMYCAYEW0Ti3Go5OY9S10ttBU1vpjInk0XANpS/ayOeupgRH
 4K8FTSTs+2HSo8h9bSFg/vrixBn1kXmF/jdXhPIXDLFEHJTLd2Ivd9qGo
 cPMpgixorQlZjP6s+bJ60zDDLonFTDyiVjDBp7BDXmVk3dP6f5QxNLf0b
 c1Q9qEcu10D92CVpu+flQGZWIRu9gHGTAuXUap38U1zqciwnz4mZN41UT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452657157"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="452657157"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 13:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="764349739"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="764349739"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 13:09:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 13:09:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 13:09:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 13:09:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 13:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba1DCm5H1sZJttr3ta+pZ2uCPQuh0M+mEzspieHqr6r0EKIMQn9cET3gAVKX7RXf+p45UQfSibsvmwftbG1EPjwEbZt++7L4wJYydDMh+dVbZZkqVIEtIuLEaEKhcg9i1uNUEeaB0oj3FA0h+k/48ZTfgD94huJnBJIaJP8BKSJ+4ro1qra8mGl6ovIqUNRAg4G7aWLgHKUUf7WZjOIOtRJ+yEsm1m3BG9V7giuasU/I9rjtf4rOihjEfrmuokn6Xq/NSi2EqZZOdl4vwn6xESsKPK/BWpIzD7LbJ2QA7sW/B/OwahJjcFummEtDmx20XC/J4OK4NvqXBo8bwsIEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjOEbau2mXrrVCRZtHii3Jr8lmNX/r3UzHxeuhhI91o=;
 b=dUGzY4xPj39AcU3HF9/5GdHrU0zO/BZHA2BNDYS+41uDOsSsJyCk6NB3W4SAxygXEpPCtOR2Zb3agkbAdbgdSkvugup2kWNL70EcvJvVkLfFswjdG3GVDo6N4nrtD6XI6sZf0rOSBjnQEQs0rHSoQtOpcfxrXOGtXmT47AK40q+KGHyuTpW9k8QvEfUxcczSHEjisJpadGIld20HRSVZoAr4eOhqjTucrFgQAZvwq1h9nwIKwkCsR89BtoBxOxDg942Dkwnb0ykF4xqw9i9BX+OiFrCMB8mejOXaNN/lS0IXG+kxUz6Z3I2GZFfLIuhJ8XoHBaFVjONCnY2GxFOExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 20:09:24 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.6933.022; Tue, 31 Oct 2023
 20:09:24 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Liberman, Dani (Habana)" <dliberman@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: use variable instead of multiple
 function calls
Thread-Index: AQHaDB+GhIv0mhTvtUeNGqB+92ixKLBkU4wA
Date: Tue, 31 Oct 2023 20:09:24 +0000
Message-ID: <IA1PR11MB64186FB75EF25B6A2552C5C0C1A0A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231031171220.594051-1-dliberman@habana.ai>
In-Reply-To: <20231031171220.594051-1-dliberman@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB5198:EE_
x-ms-office365-filtering-correlation-id: b52d2edc-e620-41b3-fcc4-08dbda4d46f2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bhapcZUUQWIZKmSR9d2cpn8jXqn3050O+DR3ylPrRMeCNpQTSUMHYqjVHv+cNKP3FVbVaJOaA5WijIEvJ5H/K+PT0wnOKJR8YtgcvX/AvwVq8MTPao+khHULMpl2Xzmc7qfTwDDMWYqtAz3YbwgvikzwxCGIQy7tNHzEQ/LxgWg86/SGr43joyb7bRxgvFCoZU1KgSKpohWSHCDZDnHqEIVZv4t48JqGpCl0okK9jVSEWsboV3yOkOu30iS3kDWGX5khTj4kk0k/mvjcbhSeniOx1mNRnKZA9inl9a5RpcOmkFVdwr83EaOa5Z8OtsF7oSWgazbs1G8SUdpoCsUyIWZJf8Fs2nK7kq32/EDFRsbCLjv9gkPp65q3/n8S3pVO16j5T3lCTfWtrROekMEckLEFYpdXrLxWgZtoElnKAsDgEuhzVarRUoys/IfSwInibg8jF3NOZrO0mYPTP6WbRyms5aQ52B3NadI/WvgFSdgrGAa8PElf0yvlRnAR+kMRiTaRLtu45ZRipaQJBy4VY+XaFcMR3OdIgyBGj9xvAkVBjZk5F0OU/cOKYo/OGnrMSUc3u+yw2nfBfVEYy1ujre7Pxc/eqTA2dl2+Ru/IIgZpCRk55248X/pR+0x2btnv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(110136005)(86362001)(2906002)(33656002)(41300700001)(8676002)(8936002)(52536014)(5660300002)(38070700009)(478600001)(55016003)(9686003)(122000001)(6506007)(38100700002)(7696005)(71200400001)(316002)(66446008)(66556008)(64756008)(66476007)(26005)(66946007)(76116006)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M70WX4sUqBJIuHFLCbRawk8yiTYBJJKR4pl2MlpH+bdw7h1gs6aHlTWdQPXQ?=
 =?us-ascii?Q?4S4+jR61suW7EIYE8/jQkYikVLKrSgmzfnx65h/Z3kbc3ouRcd2do6ejKBK5?=
 =?us-ascii?Q?DB/fud6+DbBHYkottGDL0n/nPA+dEdLPMmwe6WspOnAZ5AcF6PRspaiMAlRQ?=
 =?us-ascii?Q?zCijZL0V9DYzb6NhHdOsKpMel+KbR4/DsKgqynhlONtbK4tisj6iTlPWG0CM?=
 =?us-ascii?Q?8KWFSAYfOwhLJKYRVXQqpbHnPTlKXh5x5tF287NPXa1pN+rS8sjRgT2nZOe2?=
 =?us-ascii?Q?9NIoQ7eVFq/HGT6URMZHHVBOiOLH194FlgAFP4PNukwnfur59YhAr10AKrBs?=
 =?us-ascii?Q?senP+Ifr+ZpQXjy6I/mljXDOKIhotm8G0cBPdojkOvMCumN4R2BRzUxTNmuG?=
 =?us-ascii?Q?P7pu2T6tcgEpcF2D/1QMO5OSvsrhOnYm1ccRZ//Qy5uYUGKjkCruyewsxxIj?=
 =?us-ascii?Q?ZE3gbzywzkQDXSQFGt2Bsdq/mx9M9WphvFRIG9AFs3mzgE338G7maWLXKbfB?=
 =?us-ascii?Q?bObCRZSeOegr2xuhrMucDS37ZSiMJfgFM8K1guJ+dtNlsAyCV2q6t5fbaTqD?=
 =?us-ascii?Q?stELEjWewab3vmXGtbSA7PBjnVxaYvV07DzbnXxpsGIAPgAS7SYhu7olPDL9?=
 =?us-ascii?Q?4t33u17dFedzECF4bXuqct97+paljw/PJe8tPMZO5cGSa1TmEkG8xLtvrlnD?=
 =?us-ascii?Q?Zns5/pQKBmtzJIjopN8eldNhL6zSnGrKunWfgL7yHc8uRr9Yh0NI2kNBkcYI?=
 =?us-ascii?Q?7JlM5ssWBwesIaAWBD5bmWC8G3AOybXfyku58V5PJAqz2zpSgoIKAPrRwMmj?=
 =?us-ascii?Q?DfhVXKdniMKsq9LHzHSVwOE1383bvhXnEFPN36zk2TuCLQZsHU/RP+8Yy6iD?=
 =?us-ascii?Q?w5ac81A71qCrUZH2ENVikGa6M4/apz133aQ7UyiB1Mng3OwJEfLo/1nwK/n4?=
 =?us-ascii?Q?xChvFTKSg0ne5mEVOi52sltsEiAORM2DXH+xpnDEjl9sHdJP9zplRfH5VYFl?=
 =?us-ascii?Q?+nEPxxXV+L/Xo54u/M/4J+lQQNGgqvlmEn0ba0b8p2oDQrWIwj1Aww+5X5x8?=
 =?us-ascii?Q?8QIDgiDk63/y16s6xN3uz2MQRqi4WfpXFj6f7THSo/8Ap3CKi5Qp4nRDWcOX?=
 =?us-ascii?Q?WyWH381bqUKW+Zka8NwNnEcljrRHOMRSrNmk8tAlWvpauefGgDPMXkM1CIIz?=
 =?us-ascii?Q?cFt7n/dllBIPx3AahERzJ7Qla+XPSbti8/43cfWGihOiRcQlbt2xrYns1DS5?=
 =?us-ascii?Q?8oPt8xDalpf3uFsewPNha73ErNziqw6j4GRooGa7GZsOomyEiequ/9aedj6b?=
 =?us-ascii?Q?KtGY3H9QQD1hKjVEPdK6LKOcpb7CtI+53ucuR/QOhFFIz8DmOZlOef012814?=
 =?us-ascii?Q?FeocIMWmF5BDeC3oqSVXKh1UhJfI2hY7cUrfZ6xgdmc72CPNuwxXY0JkGiqq?=
 =?us-ascii?Q?szvwJisUI+1dcilHGh46koIWfxZKJBK/fXkUWWTZabvikgMpho13cEI1XPED?=
 =?us-ascii?Q?4Alv7U6XY2Tju+gehff+RypkMi7fb99lticUUAMAX7agXgksFJ5IGSkbZtNR?=
 =?us-ascii?Q?HC4hy4XpVOB8GtKjs+mJHjIcwLGlHulsu0oGBhw0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52d2edc-e620-41b3-fcc4-08dbda4d46f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 20:09:24.0610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/H1TS7Kl3Sghw/Eiv4D/C4+fcO+Q92QVSYvNQci70FXmWZ1LriLP41vTqtn2+PqONKUw6U6ls842XnKihgdRehq2xYLJiO/xKk0hOeO0JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: use variable instead of multiple
 function calls
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dani
>Liberman
>Sent: Tuesday, October 31, 2023 1:12 PM
>To: intel-xe@lists.freedesktop.org
>Subject: [Intel-xe] [PATCH v2] drm/xe: use variable instead of multiple fu=
nction
>calls
>
>Using function calls with negative logic was a bit confusing,
>positive logic is more readable.
>
>v2:
> - Update commit message
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec.c | 15 ++++++++-------
> 1 file changed, 8 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>index 28e84a0bbeb0..2de6c2c05078 100644
>--- a/drivers/gpu/drm/xe/xe_exec.c
>+++ b/drivers/gpu/drm/xe/xe_exec.c
>@@ -145,7 +145,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,
>struct drm_file *file)
> 	struct xe_sched_job *job;
> 	struct dma_fence *rebind_fence;
> 	struct xe_vm *vm;
>-	bool write_locked;
>+	bool write_locked, vm_with_dma_fences;
> 	ktime_t end =3D 0;
> 	int err =3D 0;
>
>@@ -196,8 +196,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,
>struct drm_file *file)
> 		}
> 	}
>
>+	vm_with_dma_fences =3D !xe_vm_no_dma_fences(vm);
> retry:

Are you 100% certain that this value will never change on retry?

M

>-	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
>+	if (vm_with_dma_fences && xe_vm_userptr_check_repin(vm)) {
> 		err =3D down_write_killable(&vm->lock);
> 		write_locked =3D true;
> 	} else {
>@@ -279,7 +280,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,
>struct drm_file *file)
> 	}
>
> 	/* Wait behind munmap style rebinds */
>-	if (!xe_vm_no_dma_fences(vm)) {
>+	if (vm_with_dma_fences) {
> 		err =3D drm_sched_job_add_resv_dependencies(&job->drm,
> 							  &vm->resv,
>
>DMA_RESV_USAGE_KERNEL);
>@@ -292,7 +293,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,
>struct drm_file *file)
> 	if (err)
> 		goto err_put_job;
>
>-	if (!xe_vm_no_dma_fences(vm)) {
>+	if (vm_with_dma_fences) {
> 		err =3D down_read_interruptible(&vm->userptr.notifier_lock);
> 		if (err)
> 			goto err_put_job;
>@@ -307,7 +308,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,
>struct drm_file *file)
> 	 * the job and let the DRM scheduler / backend clean up the job.
> 	 */
> 	xe_sched_job_arm(job);
>-	if (!xe_vm_no_dma_fences(vm)) {
>+	if (vm_with_dma_fences) {
> 		/* Block userptr invalidations / BO eviction */
> 		dma_resv_add_fence(&vm->resv,
> 				   &job->drm.s_fence->finished,
>@@ -330,14 +331,14 @@ int xe_exec_ioctl(struct drm_device *dev, void
>*data, struct drm_file *file)
> 	xe_sched_job_push(job);
> 	xe_vm_reactivate_rebind(vm);
>
>-	if (!err && !xe_vm_no_dma_fences(vm)) {
>+	if (!err && vm_with_dma_fences) {
> 		spin_lock(&xe->ttm.lru_lock);
> 		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> 		spin_unlock(&xe->ttm.lru_lock);
> 	}
>
> err_repin:
>-	if (!xe_vm_no_dma_fences(vm))
>+	if (vm_with_dma_fences)
> 		up_read(&vm->userptr.notifier_lock);
> err_put_job:
> 	if (err)
>--
>2.34.1

