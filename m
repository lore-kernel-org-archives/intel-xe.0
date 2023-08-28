Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2946C83F12
	for <intel-xe@archiver.kernel.org>; Mon, 28 Aug 2023 12:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F30210E2A3;
	Mon, 28 Aug 2023 12:17:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0675F10E2A3
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Aug 2023 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693225038; x=1724761038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hi68Gmc5aSRNB+ul5mCiWydAT3AkxtMOkSWv0gAz8+w=;
 b=HflpFaZu8vYqxY1jypnyaGQSPJg6PVtUO1sOZkM/qfBUlkRcqHec/5hx
 EFHavqCq88ovXTbJpo55esYjwEngbWcud1pcC8pbH2ALcroROUuTL4jCX
 EJGlME2CbWylRCKbfWf98o0o4PsELMWTpdigkoHKUgJhdt/NngQan/ab2
 UliO18vRoC5L6wZMQrjtIcdexVp4sWv5uJ9RbAy+yhqkYgpPZ4wvzTLyD
 VK4IrQRQP69gCZA19v7/a0ae0OEsa+Ty72zvMpGCgQrMZovVHgcpHaUV/
 JX1TgZQrWraPMNzSBP/SvhFCwbGiW2jvHBw2eKeLKFcMQU+L4hMs4ElD/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="377813806"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="377813806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 05:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="1069009757"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="1069009757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 05:16:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 05:16:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 05:16:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 05:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgoR2Axm9r//xoY6ImH99Hp0Re2ImSghiBbfTNrIgU51oeN0GcBzFenilq5Xhlw3taQfPRsBl9/mFe4stI/3SBjl/RPJ1Km32kOIwx9vOf5hlIMyY3mbm1PKu2fKUtYC0q+iUidg/XJa4/xViAPPnSpZEL6Ki+zqkeAVvhEzhNNVOALUH+x/2OB8XuDRobsYDcX5WjAeO+KwgzGyOVA47lkMh1BgNlBAnvPwagI8l6H3FaZwuSUumPr5KBlIjaguUvYASHOpq8TBWLwpW9O5rbfmZushBoL060AWcLueQc3MRzPJ8lP91UCS4U/IsQRDJKpanucuusxYZe1eY+b7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAYjP7QTh3TrvX2lPSQlgOL7RKWIEhCNxdu60LEhL74=;
 b=QDTgskVXhaUA3mbpf0yXEXSwW4pPLbBhlMxiHFP2+ZuVRz7UCo0/6MLHUBC+stnAP2cM2VXHu9sGUCJ3LKn0MBGzvIgxWzljBNmYHn56wZQD3gsgeRqBj8oKkvaSPFrg8b03BWG5anfQqSrloVxdnQbQWzYHiWdyMbwCsl4YEmIVh44sbDltyB0joS6Ihq8AnHanJLt8eWkVdc4UJmOCU4cgdet9ARZ2AkSGd0EpfeuQlFWNdiqnV1+G5PQOs7iqqiEtxu+GGCNV09lhO96EQrcJ0FD7YqmqMLhfGGV4vRsHrvrJTkDVwwygACVYwPTjFwRbE/rs0aF++w7goZJXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13; Mon, 28 Aug
 2023 12:16:44 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6699.028; Mon, 28 Aug 2023
 12:16:44 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm suspend
Thread-Index: AQHZ1rH8xVpew1Twn0aVdibZK9Z5xa//U/xA
Date: Mon, 28 Aug 2023 12:16:44 +0000
Message-ID: <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
In-Reply-To: <20230824174618.1560317-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ2PR11MB8513:EE_
x-ms-office365-filtering-correlation-id: 17afe4ac-fcd6-41c8-a991-08dba7c0a513
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3hfTOhGSlNF22KtyQlYMn68VNfgj6SYlAevAP1WIeJr7vCi9D9VuEyieh/OrKZABFmp2cWzFAlQqSgDZ1kOCbIouPqvWgGpxo0NQ7OcxZcQCFRw8rjawro1pL3SZinWuzJA3xaRq9ux0EHOTxVSVZGQIGrn46RCUockeIEJygvYZX+IE7E35DoaRMEZzXzoEweA5v4SqSXtkMXB7ZcirlzkdQGfAUX1JhJ8P1z71V01Nlf8G1HYQUJyl1nfWR73QlMcKNo3L6P3+Gbsm0XQNF9p4EECnebRE+YKr6vR39b0Yh45bIYcaMnBoi2thhOJLcZAZjfosTebRg7/XA5b4dnecnlKj5Vfs2ii1OEbt8ciIri3blC8HpUJC9jcGGA7k05beuF1URvAO4Dwn6DMT9BwqZQkzf+Il0eD4fB3V9c+y/DazwZ5myTjgN3+LZAWTWaR2iKVIswea5S6FQVwg1Lo2nNd8gUSHhh7b8izBrs5WvNnspFqQm1WNdPijQeqzZdgClVoABWK8fIgUtKdf25z0q/+/985s+gFcyGQacb4fpCd+aEZ3i5VpeOrlqp0p1BeI5PPODqRWxlUyqGTwhXhq1dVU/Tlz9Kf4mMpPkiXuZh3Y53ri5deQBFyRVHo/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(186009)(451199024)(1800799009)(66476007)(64756008)(55016003)(8676002)(66556008)(122000001)(478600001)(38100700002)(2906002)(76116006)(316002)(66446008)(15650500001)(82960400001)(54906003)(8936002)(66946007)(110136005)(7696005)(6506007)(52536014)(53546011)(4326008)(26005)(9686003)(107886003)(5660300002)(83380400001)(38070700005)(41300700001)(71200400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lBSpRz6+XD5fS5ZLaslUyT0/hXqxJIs3qbYDHPG003sboLeKnkTGShyPo0Yq?=
 =?us-ascii?Q?8UDVlKhbousO5d32rS5bN7qy1taY3nJyYnWipFJGf8MjY9+0glBB20ckfWel?=
 =?us-ascii?Q?3spBRVfNv841vMvEt/r2Y7zAOx1KuZHDO5S6QS50ZVkwC5wr2BdnVIHKrkAl?=
 =?us-ascii?Q?Z/VDG4/8p16Wgyhz0zV61eYf08xBKW1J7AzFCq4UYw5S4WnsPfXm2A2zDeo7?=
 =?us-ascii?Q?ZjOEAm78YFKA21WEuTlykaoqLVIABjq+ZjFHWVCaReobM3rn9fy5ELYfFYWa?=
 =?us-ascii?Q?ePpqOBRQF7iJNqCv3GlVp3mRuPh+iuRiM2aDJjWPbRnQ5kicIrd7+DYUKe7d?=
 =?us-ascii?Q?8hR1RJkchhN8whwOwUkPVmfA1GG/VLVw/Dev1S8p3IHuz/lHk1ZddO17qtfH?=
 =?us-ascii?Q?1V0yNO2rQF88qw5Dv7qAES1m/G7jG0ncp2xBBijqcjh0JyRQur759j17P3yw?=
 =?us-ascii?Q?29RoonXQL743JM2TAH/Gs0jykKHLHFU57/BNqwg4k2PmJOucpg0faRbR7TvT?=
 =?us-ascii?Q?ExG+qcCcNekOIa8yP988AFxuCq8b4B5vmcIGZmGLpkwm70tCdD27C7/geuxQ?=
 =?us-ascii?Q?QRASk1JCawXUQs0i1K64qHdfMTv+wTipxTp0HDPKc5+szFSNbkzytcsVU3M5?=
 =?us-ascii?Q?bDq4M9sfc3QfEhqL6N9d8H13uS0VF4bKFF0e5s3vS/M/zTz1FTiNwqbn99Gs?=
 =?us-ascii?Q?HFlFmBqxqVVRh4z8apSYvsemIlRCNNt0z57HF2vqyUIbqaPphuNaF70Wxxvj?=
 =?us-ascii?Q?qVSoKZDYI/lxxEUeplWHclk9XqAUZZuNP8R33OBPIni/iaqb9hoYwvCTv/4b?=
 =?us-ascii?Q?ppzOok9cEyx0e5HmWq3vwF192yarHV0LmChFiqkzp8p6z99IFt8mCc8WfBe9?=
 =?us-ascii?Q?E52hkPq7naee7T5qAzo6tnPU4XeXR7bcv3HsSJebdSixdD1VB1WD/7MpumA8?=
 =?us-ascii?Q?UH/pTsN9BQjOgbw5VLj2RBuw1I5sgG4ts5tyyE0+wsUBFBuNukfOzeUUlSGg?=
 =?us-ascii?Q?Wz3kLp3ZhUnO2NwHwcURVAyoi5GBPyk0X3c4euhvD4ELsgGJOs07FbxSA0q6?=
 =?us-ascii?Q?zdUGENzLA0JX/9s38QXU8SVS2qURkq9MacrckuHxrNvcfBah+k05/QxETz2e?=
 =?us-ascii?Q?v4Auh+wW96bO0re+ITAywXYR0O60OYD7gFl8xpiqVZF9iTA/qXeBJ4SORC8C?=
 =?us-ascii?Q?dP/dMhjA5d9jhWwBgoPK0O7tVsAMYHVjwWdq1fHSiDID6j18dfcZXFUBca5i?=
 =?us-ascii?Q?hYUKdFBFNDYVMS3meaE76D6qlsVgFAKOcfkAD4QTVkgBThzLerKucstWTQ4C?=
 =?us-ascii?Q?9ggbdai3tYXlhWTyJ+iHAV62RPE7Jo6lMjJ0oDi3ko+i4dS2ZNMmS5+GxrRD?=
 =?us-ascii?Q?wwIpzfhsv9VJsBzpd8K2Y9rVNIqJoiflU5sl819BtZYhf53DyzF2l35z3NE/?=
 =?us-ascii?Q?0vedpCbI87N33sHIV3uCpPxbUTq82FstSofRhEJgj/vCVRNLmMcS8H75xgJ5?=
 =?us-ascii?Q?2zh4voZG6kswTRhreYR2Xqd3TK08II8Q6bYJJY09McqAgWieDeyJlA5Pb7l0?=
 =?us-ascii?Q?53rzUZq1EVfkfcKu52Yube01xQmM+Gk4yDskVB2c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17afe4ac-fcd6-41c8-a991-08dba7c0a513
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 12:16:44.8122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWI2NqHLcGjOXeOmGeUDHtRe8dh1RvtAdCocxvsZMPXkWEEGiWTQahJwonaqQ1HiW7lRMxFAFkIkuP8tXkde64FsPzrUGpW9ro9TS9/936E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Thursday, August 24, 2023 11:16 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
> suspend
>=20
> Release all mmap mappings for all vram objects which are associated with
> userfault such that, while pcie function in D3hot, any access to memory
> mappings will raise a userfault.
>=20
> Upon userfault, in order to access memory mappings, if graphics function =
is in
> D3 then runtime resume of dgpu will be triggered to transition to D0.
IMO we need a configurable threshold to control the behavior of mmap mappin=
gs
Invalidation, if vram usages is crosses to certain threshold, disable the r=
untime PM for
entire life time of mapping.
Thanks,
Anshuman Gupta
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 53 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_bo.h           |  2 ++
>  drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
>  drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
>  drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>  5 files changed, 85 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1ab682d61e3c..4192bfcd8013 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -776,6 +776,18 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>  		dma_fence_put(fence);
>  	}
>=20
> +	/*
> +	* TTM has already nuked the mmap for us (see
> ttm_bo_unmap_virtual),
> +	* so if we moved from VRAM make sure to unlink this from the
> userfault
> +	* tracking.
> +	*/
> +	if (mem_type_is_vram(old_mem_type)) {
> +		spin_lock(&xe->mem_access.vram_userfault_lock);
> +		if (!list_empty(&bo->vram_userfault_link))
> +			list_del_init(&bo->vram_userfault_link);
> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> +	}
> +
>  	xe_device_mem_access_put(xe);
>  	trace_printk("new_mem->mem_type=3D%d\n", new_mem-
> >mem_type);
>=20
> @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> *vmf)  {
>  	struct ttm_buffer_object *tbo =3D vmf->vma->vm_private_data;
>  	struct drm_device *ddev =3D tbo->base.dev;
> +	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> +	struct xe_device *xe =3D to_xe_device(ddev);
>  	vm_fault_t ret;
>  	int idx, r =3D 0;
>=20
> @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> *vmf)
>  	if (ret)
>  		return ret;
>=20
> -	if (drm_dev_enter(ddev, &idx)) {
> -		struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> +	if (tbo->resource->bus.is_iomem)
> +		xe_device_mem_access_get(xe);
>=20
> +	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>=20
>  		if (should_migrate_to_system(bo)) {
> @@ -1127,10 +1142,25 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> *vmf)
>  	} else {
>  		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma-
> >vm_page_prot);
>  	}
> +
>  	if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags &
> FAULT_FLAG_RETRY_NOWAIT))
> -		return ret;
> +		goto out_rpm;
> +	/*
> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> +	 * vram_userfault_count is protected by dma_resv lock and rpm
> wakeref.
> +	 */
> +	if (ret =3D=3D VM_FAULT_NOPAGE &&
> xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count) {
> +		bo->vram_userfault_count =3D 1;
> +		spin_lock(&xe->mem_access.vram_userfault_lock);
> +		list_add(&bo->vram_userfault_link, &xe-
> >mem_access.vram_userfault_list);
> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
>=20
> +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
> +	}
>  	dma_resv_unlock(tbo->base.resv);
> +out_rpm:
> +	if(tbo->resource->bus.is_iomem &&
> xe_device_mem_access_ongoing(xe))
> +		xe_device_mem_access_put(xe);
>  	return ret;
>  }
>=20
> @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file
> *file_priv,
>  	return err;
>  }
>=20
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo) {
> +	struct ttm_buffer_object *tbo =3D &bo->ttm;
> +	struct ttm_device *bdev =3D tbo->bdev;
> +
> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev-
> >dev_mapping);
> +
> +	/*
> +	 * We have exclusive access here via runtime suspend. All other
> callers
> +	 * must first grab the rpm wakeref.
> +	 */
> +	XE_WARN_ON(!bo->vram_userfault_count);
> +	list_del(&bo->vram_userfault_link);
> +	bo->vram_userfault_count =3D 0;
> +}
> +
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_bo.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0823dda0f31b..6b86f326c700 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device *dev,
> void *data,
>  			struct drm_file *file);
>  int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file);
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> +
>  int xe_bo_dumb_create(struct drm_file *file_priv,
>  		      struct drm_device *dev,
>  		      struct drm_mode_create_dumb *args); diff --git
> a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..cdca91a378c4 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -68,6 +68,12 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
> +	/**
> +	 * Whether the object is currently in fake offset mmap backed by
> vram.
> +	 */
> +	unsigned int vram_userfault_count;
> +	struct list_head vram_userfault_link;
> +
>  };
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 750e1f0d3339..c345fb483af1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -328,6 +328,26 @@ struct xe_device {
>  	struct {
>  		/** @ref: ref count of memory accesses */
>  		atomic_t ref;
> +		/*
> +		 *  Protects access to vram usefault list.
> +		 *  It is required, if we are outside of the runtime suspend
> path,
> +		 *  access to @vram_userfault_list requires always first
> grabbing the
> +		 *  runtime pm, to ensure we can't race against runtime
> suspend.
> +		 *  Once we have that we also need to grab
> @vram_userfault_lock,
> +		 *  at which point we have exclusive access.
> +		 *  The runtime suspend path is special since it doesn't really
> hold any locks,
> +		 *  but instead has exclusive access by virtue of all other
> accesses requiring
> +		 *  holding the runtime pm wakeref.
> +		 */
> +		spinlock_t vram_userfault_lock;
> +
> +		/*
> +		 *  Keep list of userfaulted gem obj, which require to release
> their
> +		 *  mmap mappings at runtime suspend path.
> +		 */
> +		struct list_head vram_userfault_list;
> +
> +		bool vram_userfault_ongoing;
>  	} mem_access;
>=20
>  	/** @d3cold: Encapsulate d3cold related stuff */ diff --git
> a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
> 0f06d8304e17..51cde1db930e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
>  	}
>=20
>  	xe_pm_runtime_init(xe);
> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
>  }
>=20
>  void xe_pm_runtime_fini(struct xe_device *xe) @@ -205,6 +207,7 @@
> struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>=20
>  int xe_pm_runtime_suspend(struct xe_device *xe)  {
> +	struct xe_bo *bo, *on;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err =3D 0;
> @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	 */
>  	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>=20
> +	list_for_each_entry_safe(bo, on,
> +				 &xe->mem_access.vram_userfault_list,
> vram_userfault_link)
> +		xe_bo_runtime_pm_release_mmap_offset(bo);
> +
>  	if (xe->d3cold.allowed) {
>  		err =3D xe_bo_evict_all(xe);
>  		if (err)
> --
> 2.25.1

