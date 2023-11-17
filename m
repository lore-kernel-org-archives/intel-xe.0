Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE3EC54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 18:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AF710E0DA;
	Fri, 17 Nov 2023 18:19:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFE410E0DA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700245189; x=1731781189;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0M+Z1IY/WM2MXUYuiByENHTVu9j//x+B1aTrS89TqNE=;
 b=VL0Zb/mHgjOm9QYlaFz8GRpMgvdfkiEYUx3jAIyNmgPpyH6lBymKoCcr
 +icW/eo74S4tUgLm3r7Gk0RxXQS9ug7d0gNx23wIzEnVYCjYq1mRInQXD
 uSKjDwirEl97l1ARZAMrGT6NKxWddsKubJjXgB4eCF7tbvj6F1WwnF8H5
 o1SIq3X6yKCbsv+kw8hMdnJWZs09GNg0NmAUbcHIwTlgtNabvK1xII/T2
 IcrbMM1T4ZEFs+ySG5oOLYfUA/BnXsSM2+pC81ZHZWxbrPtzZQJ650K4J
 +TkfmJiNQ48FZmA5g2lnitS0Y3P+qRJt3T294JHQvgVxYoS8IlxU3zI8o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371524101"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371524101"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 10:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="800569228"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="800569228"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 10:19:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:19:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:19:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 10:19:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 10:19:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqTKoqvo+v4kDRC5sF/8KCIAJImRiJnhVY8n9jg6ee+lQI2W9JSov98+cFAS1Wb+Q6LfjdPUGxrmrY8OECiygPCF0fRdAbjNQTUpohMzia3NwAzyrIos6w+wYyjj/YknGsiCMYIimwBtsfhfSXC1Khg9rt/U/6G1AJUv8fsXoTUGM51LiuEeecjcWIU5+zNigr92cuu1dozUZc8AUuZ5LEFe93KEyqHG8hp1AmUz2G2m8wIFK/T0NZRlCu2RH/4UXRLgNXXDWXh/+fzdqBKTQdgpHWzNJ5g99+2OW3Jli3t6e3nM2KC47R3vvyoyj5Z4APpSZfa3GDLYxrYsshBcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZluVSzrKYV4li2vE38zWZOJGwRNij6WqRbP8mDTT10=;
 b=i1KonJ7WIk7acfrtnAV5JD59mcHU7DwMpgC3pm0vhBiOifiyuW/48mGxiqYsIpw7OqXesElHIRKto6OrEORw4b8B4IuHM64nkOm26ZpARKM4pP5u2RtlbbG3e+Cg2F4qEFJDD1h7NhDLVm0+eAyf0Usr50GP1CxZjqnGCMYSFySiz+3Jhnb60Ucea/1Zhn+bbmvDsjjGqfvXMantHeyVdT5rfVqT1dWjslfxDEs99HbyBt8tuGJ7vjUGTyD76jUWO4qePT9ectgOeIN4Wp5okrIWYxbeNPSTnLHnfOBM+eQlm1b+1ADYkdYM9yoRpr9qcs2N2Fp0CcijbWiWOhl8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Fri, 17 Nov 2023 18:19:45 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 18:19:45 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH] RFC: drm/xe: Return correct error code for
 xe_wait_user_fence_ioctl
Thread-Index: AQHaGMk7G2Hqc0POw0CRPBZM0smeK7B+xjQw
Date: Fri, 17 Nov 2023 18:19:45 +0000
Message-ID: <SA1PR11MB6991B131E0CBA99A815D5A1392B7A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231116200819.29227-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231116200819.29227-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM8PR11MB5590:EE_
x-ms-office365-filtering-correlation-id: 992b3ddf-c930-4ec1-56db-08dbe799c6a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3S7a2sT1YqmqJM7qUtAT/mSLSmu+DhOIt812xTttPuwBSjQMjgDluTIDQhQCoV/NX3zjkigWz2vixwULuZT9WILlvCfw9EDGomfNhYxu8iXLc8bva27rlCm197+vq/Rbo9iftNGRod27a2H641Joa7iGYjWZvnxloKuLO7AhoWn4olNOgF6pEuOjU6wsJIVsA4obrL7tsnfMNu4oaYKmKtqSqpRuufuL/GaDuzj4tRG3cDaN+i1Vg28pAE+YF8U1cgYd20mwgt8jZaZZDcEoBHXcJKAE6eCIeZLZ6UdUjrpLmaQrSn40Q2kTP20fL6JrTXXu1FKnSBD0Xmj9XGumXYJZwshcZMvQvT2hSXocApy8NSPsloCPooRO/yF+u2zFuUp0AzjDAkn/QhVhJM+cfpozRIeoYkxVQw3Xc9tPOdfM+22Juu/31HIg6vOcL2NEHtMRxbn9vGm7gQojKz6/0EGRORyxtrWWGcG7AVRpQbxvAvQKmkgPYCMqiS9jsvIdiL3vMN3SAosupZO7Fg4AXwsiNIgHDGvc7LmoFJ5fbIJ35N8xSQqab61gUr9nGcg6pCYOa2jRwj4DmPbPI/KHcuhbG+yUmu2qIpeKC+9BotExkAvJRNDV+YpVr08kubQg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(30864003)(33656002)(41300700001)(2906002)(4326008)(8936002)(8676002)(52536014)(5660300002)(86362001)(38070700009)(55016003)(83380400001)(478600001)(6506007)(9686003)(71200400001)(53546011)(7696005)(82960400001)(107886003)(122000001)(316002)(6636002)(26005)(64756008)(38100700002)(66946007)(110136005)(66446008)(76116006)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OMVEIYTnfq3Y6VsxOrgg1p2pW1UkjZjnsbvnv+mtvFJvAyWl827kpo1MSpjN?=
 =?us-ascii?Q?9GQu+kHEouT559wp8RSd38rg9mwACwuFdUKsUnVUNPhIpdHi0xGZkERynSl8?=
 =?us-ascii?Q?Iu5krPxDoCVocE8CZVS5XhWL20s+yheS62hNGD/cLA+/khs/ZrYAqzqeBh0y?=
 =?us-ascii?Q?5QG4qmLTOKK6K9ZHn2UnYt7T0K45Ne0DluzcwykoAtVgzc8chfrGZL9rf0JY?=
 =?us-ascii?Q?l92nDi1lGHVBfa18XzMFn+S8zEkh+QihocRdzdutOsj+1f2466/7hO14rorF?=
 =?us-ascii?Q?dOYzslurHffdY4v52NNqUfr184JhCOhgdm5HK+L8NYVoHJ0/6DSE7E/QIM+1?=
 =?us-ascii?Q?FQ4YzEn9Di/tjam8PhCTWi/7kTyBSsnAkBNaW7Kkb77tFNE8XXy03lm0KoKW?=
 =?us-ascii?Q?r3kwEr9YJBtnz8/74VYiGNhb6+c/XxqILVQ09NIv/lp5CwRXrIKVxaUBDCQO?=
 =?us-ascii?Q?r2Y4lgNXTq38KvHJ+sDzvyaEhH/Lu7j/fqPqXlXrCwWAP5RhQTzZ1J4QkMv6?=
 =?us-ascii?Q?BGqCveYasJuxkmf4oqzuDTxUvKsZkztX3nObg1rD/Pc3AbUztUHiX2dAZ764?=
 =?us-ascii?Q?H5b54bAt5S5+mIqS8cpjWg9Sm35u8P9equPU8Vt5Xbg247+iARAlPnhRZsq3?=
 =?us-ascii?Q?BtE50yFxoHzgfUMA846tM8aPVd/4/Wz4U16q2cAPynnsUZF7RVZI5XzYy+Ip?=
 =?us-ascii?Q?ufnQMlt5kwggcY6tdCEjSjG4W6TDHfQ87RVj+ZzPmzl1IKLUBi4pFxZ2H+jW?=
 =?us-ascii?Q?BQ2EoDLOjPPoGtgJ4Iiim36rFGzOKVN7EW8ryWnvbfzkBAmkuqMEujTlI7u4?=
 =?us-ascii?Q?+DhiPesreRPbsSFPdpxjscOVyAuiqZkSlaX6dZ9rSt7UtXJH5b9EJY1TlaLS?=
 =?us-ascii?Q?+wGJsx2WVlZxOx+MSOF1wkXD97pBf76iZkKFJsL9Dy34KZRlYj02uGfnNBew?=
 =?us-ascii?Q?eFxckBS4sCBqrzqTxJtr4CZTIcA0J5lSLd057K/9kpLuUE4ITsi19sjPZVnr?=
 =?us-ascii?Q?D3JhFbwAHpZrhFr648UmjAqXhPcp0blrxsRTPnKccLADtNWRQcF1Gy5x0Pcc?=
 =?us-ascii?Q?KkJdEGxtZPZBYd/h4o9k/aFm2KO4ct8V23bcrctKLls21CQJ4JPWSun+fmU3?=
 =?us-ascii?Q?2lJzLe6dRZ5CXYtWcc6Tjn/LSpjHN33/KMzw65E6lLLGEUu8dhddJAahLIwe?=
 =?us-ascii?Q?yVytwW5pkyDdY524RkpyVZyae8intpTPZ72bzd2sD3kp1KANbaEioYYThPmt?=
 =?us-ascii?Q?q70mY7tEjFVkJE03ylf6nhY+v8IVm2/recb+mL2ZkkZePQdym7IvYxOqJeyz?=
 =?us-ascii?Q?TiVGQ0rAnpkafyOy/D8PeXMopVrxu6JAS7g0Rd9ylO7PTFDIeOHGdIKQuN6m?=
 =?us-ascii?Q?dMSUY0v4S8uCMOZ72nMQSDVRxMArjQZWeBW77b5dKfCTJD/LVE+xRsIUs/qV?=
 =?us-ascii?Q?0ia6PCG2qYo94EIfykhsUwZe2mplsvlZLjjlSH8jXT3nTfK4CPb1lds17HCC?=
 =?us-ascii?Q?tWfDcMSu3iT1knToDp2vOeXBjpKMN/8el8oJvQSTp4pj3svl1IUG5+YCPq8F?=
 =?us-ascii?Q?CARr0ozyNx/lRiH+Vts=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992b3ddf-c930-4ec1-56db-08dbe799c6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 18:19:45.1565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZsh2YO2iZIxJ64EEuzhoWMCdyT6oiDj8bnLOv8PBT3Unw5YHOUxV/Ei6S2dnI197w67sYfG/ysfr5+Win9Cuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC: drm/xe: Return correct error code for
 xe_wait_user_fence_ioctl
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



> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Thursday, November 16, 2023 3:08 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>
> Subject: [PATCH] RFC: drm/xe: Return correct error code for
> xe_wait_user_fence_ioctl
>=20
> return correct error code if exec_queue is reset/engine is hung
> remove the num_engines/instances members from drm_xe_wait_user_fence
> structure
> and add a exec_queue_id member
>=20
> Need to validated the changes
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c      | 24 ++++------
>  drivers/gpu/drm/xe/xe_guc_submit.h      | 20 ++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +++++++------------------
>  include/uapi/drm/xe_drm.h               | 16 ++-----
>  4 files changed, 50 insertions(+), 74 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e9e925c7353..de2d2f7303d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -42,21 +42,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  	return &q->gt->uc.guc;
>  }
>=20
> -/*
> - * Helpers for engine state, using an atomic as some of the bits can tra=
nsition
> - * as the same time (e.g. a suspend can be happning at the same time as
> schedule
> - * engine done being processed).
> - */
> -#define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
> -#define ENGINE_STATE_ENABLED		(1 << 1)
> -#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
> -#define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
> -#define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
> -#define ENGINE_STATE_SUSPENDED		(1 << 5)
> -#define EXEC_QUEUE_STATE_RESET		(1 << 6)
> -#define ENGINE_STATE_KILLED		(1 << 7)


Why do you need to move those defines to .h file? I don't see those are use=
d out side of xe_guc_submit.c

> -
> -static bool exec_queue_registered(struct xe_exec_queue *q)
> +bool exec_queue_registered(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) &
> EXEC_QUEUE_STATE_REGISTERED;
>  }
> @@ -151,7 +137,7 @@ static void clear_exec_queue_suspended(struct
> xe_exec_queue *q)
>  	atomic_and(~ENGINE_STATE_SUSPENDED, &q->guc->state);
>  }
>=20
> -static bool exec_queue_reset(struct xe_exec_queue *q)
> +bool exec_queue_reset(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_RESET;
>  }
> @@ -1681,6 +1667,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc
> *guc, u32 *msg, u32 len)
>  	if (!exec_queue_banned(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>=20
> +	/* to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
>  	return 0;
>  }
>=20
> @@ -1708,6 +1697,9 @@ int
> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (!exec_queue_banned(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>=20
> +	/* to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index fc97869c5b86..4a0566e7e9f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -8,12 +8,32 @@
>=20
>  #include <linux/types.h>
>=20
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
> +
> +/*
> + * Helpers for engine state, using an atomic as some of the bits can tra=
nsition
> + * as the same time (e.g. a suspend can be happning at the same time as
> schedule
> + * engine done being processed).
> + */
> +#define EXEC_QUEUE_STATE_REGISTERED	(1 << 0)
> +#define ENGINE_STATE_ENABLED		(1 << 1)
> +#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
> +#define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
> +#define EXEC_QUEUE_STATE_DESTROYED	(1 << 4)
> +#define ENGINE_STATE_SUSPENDED		(1 << 5)
> +#define EXEC_QUEUE_STATE_RESET		(1 << 6)
> +#define ENGINE_STATE_KILLED		(1 << 7)
> +
>  struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
>=20
>  int xe_guc_submit_init(struct xe_guc *guc);
>=20
> +bool exec_queue_reset(struct xe_exec_queue *q);
> +bool exec_queue_registered(struct xe_exec_queue *q);
> +
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  int xe_guc_submit_stop(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 78686908f7fb..5ee1062a4623 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,10 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_guc_submit.h"
> +#include "xe_exec_queue.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
>=20
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -58,27 +62,6 @@ static const enum xe_engine_class
> user_to_xe_engine_class[] =3D {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] =3D XE_ENGINE_CLASS_COMPUTE,
>  };
>=20
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =3D
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].gt_id >=3D xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
>  			 DRM_XE_UFENCE_WAIT_ABSTIME)
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
> @@ -130,14 +113,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> +	struct xe_file *xef =3D to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args =3D data;
> -	struct drm_xe_engine_class_instance
> eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =3D
> -		u64_to_user_ptr(args->instances);
> +	struct xe_exec_queue *q =3D NULL;
>  	u64 addr =3D args->addr;
>  	int err;
> -	bool no_engines =3D args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>=20
> @@ -151,35 +132,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, args->num_engines >
> XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err =3D copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>  	timeout =3D to_jiffies_timeout(xe, args);
>=20
>  	start =3D ktime_get();
>=20
> +	q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
>  	 * for everything. Could be optimized to have a wait queue for every
> @@ -203,6 +166,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  		}
>=20
>  		timeout =3D wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
> +
> +		if (exec_queue_registered(q)) {
> +			if (exec_queue_reset(q)) {
> +				drm_info(&xe->drm, "exec gueue reset
> detected\n");
> +				err =3D -EIO;


You also need break out of the loop here

And I think it is better to check reset before wait_woken, that way, even i=
f the queue is reset *before* you wait, we can also detect.

> +			}
> +		}
>  	}
>  	remove_wait_queue(&xe->ufence_wq, &w_wait);
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e007dbefd627..0bcd7914db36 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -132,8 +132,7 @@ struct drm_xe_engine_class_instance {
>  #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>  #define DRM_XE_ENGINE_CLASS_COMPUTE		4
>  	/*
> -	 * Kernel only classes (not actual hardware engine class). Used for
> -	 * creating ordered queues of VM bind operations.
> +	 * Used for creating ordered queues of VM bind operations.


This comment change can be in a separate patch.
>  	 */
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> @@ -955,16 +954,11 @@ struct drm_xe_wait_user_fence {
>  	__s64 timeout;
>=20
>  	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
> +	 * @exec_queue_id: exec_queue_id, must be of class
> DRM_XE_ENGINE_CLASS_VM_BIND

I don't think this is true. The wait_user_fence api can be used to wait for=
 the completion of a vm_bind operation. It can also be used to wait for a c=
ompletion of other task submitted through drm_ioctl_xe_exec. In the later c=
ase, exec_queue_id can be other class than VM_BIND.


> +	 * and exec queue must have same vm_id. If zero, the default VM bind
> engine
> +	 * is used.

The exec_queue_id here is a return from exec_queue_create api. Xekmd intern=
ally should be able to check whether it is a valid queue id. As mentioned a=
bove, this api is not only for vm_bind...

Also check: do we need a vm_id parameter for this api? Need @Brost, Matthew=
's input here. What is the purpose of the vm_id parameter here? I looked wa=
it-user-fence-ioctl implementation, if vm is passed in, we end up using a v=
m->async_ops.error_capture.wq (vs the xe->ufence_wq). I feel this is more c=
omplicated than necessary but I don't really know what is the use case here=
.

Oak=20

>  	 */
> -	__u64 instances;
> +	__u32 exec_queue_id;
>=20
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> --
> 2.25.1

