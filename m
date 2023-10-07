Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A98E92FFD
	for <intel-xe@archiver.kernel.org>; Sat,  7 Oct 2023 08:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9F210E061;
	Sat,  7 Oct 2023 08:20:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BC010E061
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Oct 2023 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696666851; x=1728202851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1J+2Qzd4lWEUXI4XnfrMya7Q4JV+JAzQekljA0+i+yw=;
 b=D9lnkhT4PQLYe03VDDDpwyzRtCX0GF5xWUMrx5+H3x4vRTMVBF0wGHQD
 fxomxz8xy8J1oUe/S1BKl8wsNXb074vg8VetRlKFTnqmG1pohQNde0xy8
 Yc8FZsPzX6AMXs9kdFXDjmGnQKIoK8aE/p0jGkIkCymhNgGmH9WM6AYvW
 qGjIZOtS90PsoUV/6RDcLYkgcC0+Jr7NJQ/0zSJfSN0g6ZT7kfSp0cSUY
 t2nGprtc9gFjfda4Wapa0bIHl4Kr22LaRHbtFjhGe7bcFHoHADaRMoWPZ
 zUBHGaSamgPO+EW69hJjEenjeGEJcoaF/GjNmHvjefl3CNFHPL0RYD3wL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="5463132"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="5463132"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2023 01:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="822787956"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; d="scan'208";a="822787956"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2023 01:20:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 7 Oct 2023 01:20:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 7 Oct 2023 01:20:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 7 Oct 2023 01:20:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 7 Oct 2023 01:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbSr6VCi0Q85QB7OA5oVVY7BGoyZoMKX++nLyMygOzSpqsLedQzTPsVkLJYbH8mFLRygBZKRlwsMnKnPVJzutMTi7ia9o94GCxqxC9wzt+gSre5+QLpytJnPd8O9TeQ9OJ4CFMbSvYVowngZe2S2uQQnFIcLvr/2JgvJB1ZCdBSBAeB1Om3a+ZwKgIVq5hfrza7rYSSZNiKc7OV7p2ssfZA8hUg8TmVDAR6gJQWDR6topCl9rMOhFNtFD6NL7Em/SCEOnxu7246p9+bVRd9kv0G096hPgEUIWZVMuzP6aQV+tRFns4HWa3vw7g+0QEkV7akEDme5kzTwVnnqp95E2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chKKQaqRCHrMCiEqTgPjSc1AepSdK+KD/A5Va3WE0Bg=;
 b=HlhzSUAbA+qmFUr5Ie/xC3KnKuwvWHxFQkHK0Iq/TcmECuu4mQBnbJnl85d0oteJGQslreUqtjPhnrirDkANwrNXmbpSZmuXzRZ18SN4i86TnuL3po9dcWkQpSITuF+zg+CClYewBRxAR2eWGm0NNLw8eA3h4q8JCwrFvny+fvIPY3HmY0N/HD1TJ6LfRGrbN0pjdXmDqePeF+8JMBDaQ05at7rqKb6GN+EBr2X13y+RjeIA2h42vsBfJNldiqku06+m25R3HMdJxTxouNkiGklLnYDIGOc+xo62BY2oRkm19+MwM3yWJ1oEdotqbmQmK2yDiZo0YIRrb6JK+puwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Sat, 7 Oct
 2023 08:20:40 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e64a:36b1:582f:7415]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e64a:36b1:582f:7415%6]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 08:20:40 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 10/17] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
Thread-Index: AQHZ6wVBhkKlrYHdUkuLUlZMY6cC6LA+F8bg
Date: Sat, 7 Oct 2023 08:20:39 +0000
Message-ID: <PH0PR11MB5579234460182325F9DA50E987C8A@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-11-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142504.91652-11-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|SA1PR11MB6968:EE_
x-ms-office365-filtering-correlation-id: c93329b0-35bf-4367-a9dc-08dbc70e4a3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vPGEMb4jCrAlzg91YWnjIPGoFWa1lkmDctd60cGxvjS5ndNJApGt6SB1LhzW6vSTiX6c1KrkUTm1Fc5hY7Df83aajhPpTC6pTYaFZAKzjyVeD4LhJ65j/18JjMORmtMY3wCe9yhCTAxxDq8NewIY+VPdsnXS5XpzmE8fuGWbeL3ktEyTSoVuyhFmJeWO5vo/kvIdAgC1YdJIlmMC81dBTGuX4Z2NOMb1QzVQ3H5FCLK4h6vNPHa3UfvXnDAHQ0eimXlx99+B7qw3Vz7kyybvBiAqPDCu114NpoxAQbp1hy/ksEX43Y/RkDYfFTWaMErq1xVypDCwPeXmK855N1z2Ec0RiaTW4Z0jBCboO9wcjwfwnYVcj5+DVz+iUFQc8tpanDHLEQWtKbQvu/VKbaZSQCQSH38LQF8v9K1mWBNlcCm7MIoR7+VYmMuwYsaigH1lwGERGMehXqGGm5p8SKw/+w3nQwb5Bj+IxvwRS4GAIvJ1NWy+ZTIeXw0vCHiTfEFie46e//7xRkQTsAQTRBx+FYw0ry4l2+WlXR5ct5G3wQKPmULbpgL0WtrF6bcK7h1skiIfrRsG87WJL7BHtgRTpBA1jLEiZmoAxl900rowY7Fr3/Z92FjBPs0MID9vPe5A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(107886003)(26005)(76116006)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(110136005)(2906002)(83380400001)(33656002)(86362001)(55016003)(53546011)(9686003)(7696005)(6506007)(478600001)(5660300002)(8676002)(8936002)(4326008)(52536014)(71200400001)(316002)(41300700001)(82960400001)(38100700002)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qn9cgph+FBLZTmDuEUk0eyBmeYseU9rOvAfdZENd890o3hPnAyz+yEnIPTWF?=
 =?us-ascii?Q?zae8q7ulkwAAMCznuBbZJUHguT5af1+nJK1E51rJz3FiCDQ8QETWKlreMsM1?=
 =?us-ascii?Q?DnPq5TWjVTUODuKfsAw8/OhFr3NTzlXB+ZM5ADkCD699MlpzY48IKzw+wOUR?=
 =?us-ascii?Q?iR3g2ytrZmUi2oe4ns6da/Ru0Z22AkJXTlIdp6cr771lz1IuV8zispohl+XE?=
 =?us-ascii?Q?R9k/c1OxHpvTehwPC721W+2Q1v/rSf7wa18BZHrq4TEiOMipyCNMVUO5xcS1?=
 =?us-ascii?Q?lOw/Nw0PfT06S+3oSCxk7+a4jriN9oT20v9L/R0Xu3BjSurL7P/H0wp2Q9Iw?=
 =?us-ascii?Q?XjmVTknVTmbbQM06i4Irg96p3w+FfaFRCxr1K1enY+Xsk1G2w84PdwgR4aVZ?=
 =?us-ascii?Q?lwE4Dh+NwYh90+uD46o+hTVuQc4MdEDxOPdEtcKqHhe9k/AE+8AaMVb8/Q6r?=
 =?us-ascii?Q?OMJO6fCf0n9H9MMWBKTH3MohpEjXlyUrlmTExMsd/KPUjIOUK9HOFp+GB/O8?=
 =?us-ascii?Q?P+3zXHINDrcWuG+F6aUEX8XcFXPSDJjebrPpRLvKUCYrcLm8TkymmgPHf834?=
 =?us-ascii?Q?e+GI4m+pUpcWiuL519yjmrZfQviqagFsTHtIdAqi64XMtXA8Iyz38ru8LmNd?=
 =?us-ascii?Q?4q1CTes+QS2IzwwHjR5EFuNLAzzzFFED0UTIEUYLNFTzGzLDNMUP+7IgFJPr?=
 =?us-ascii?Q?kYmADKmpKQF9frJDeVZX2NRcRyJPziYvwvudJrfqTSEUVFtJsqsNyCZXnDIs?=
 =?us-ascii?Q?xKLkloaOUzuLSIsVQnPeJjJJ5a50fwvJSicAk5ZFkQhNm1zPdJGmtSgaLA0+?=
 =?us-ascii?Q?c141lo/EyObqBi1k4BT/ymsbyQxtX7IlhvzmZfpCfYE+anmaNz2LDKXPmvtn?=
 =?us-ascii?Q?As2l0P4azXVV/7E17Pxuh/3R5301HllnJAQVgnW1RbNYHYM3GsfT73dJEgTZ?=
 =?us-ascii?Q?/b2tz3IfwoQe0q91qXBycd/aI7vwqXdCieotwQCGRiinWxMDIHiR3kMY9+KQ?=
 =?us-ascii?Q?pNH+wdKN/hJbFGbncFErft3khxWIF/4v8GBLd+6ozH4mqvoMXYtC/G0UTHON?=
 =?us-ascii?Q?hlpn4Je6nmn/c2lGrzq/eAEavagUHm6FMBcK6ZOsPiSZ1LgFFDD81YGJ1HM7?=
 =?us-ascii?Q?0hVA/izbsLiIiON+odQj5/2GrPLIwhXbY+gZ4cz+0dmv+yQJqrRKQdDkSgik?=
 =?us-ascii?Q?2WOBZh3X5uaDcoJBK/Lt4/EkabkiwlERqI7xNcsHxwDSilRUJ5D+/y67x67B?=
 =?us-ascii?Q?+um4dGalGKtXKWOMfIjPjv0FTp55FKl6A9euhAurSOO367nI4n8T0qy79qDz?=
 =?us-ascii?Q?XU8UnHEz6h7wDGZYWaW4laz2XzS0o7ABvCU2aKSucQJWSy61oUeGPeVR/4dC?=
 =?us-ascii?Q?bnj0Hy9L2KDKLlZ+UtUrIMeDB2N0qucrQ1dLe8Z565Q0/ZA8tB2DzXGxV04J?=
 =?us-ascii?Q?fOwqCH6DWc6YoBMiSFzpok2MNySN8bO+17ZdRWWe76fFypYG/N2+VxcRnicf?=
 =?us-ascii?Q?iZpLnXxcbeLaVNzqK1SVrTkKJo3MoAGbOH2DmcZmKFCr7vdG3BKFsPaygzIC?=
 =?us-ascii?Q?Jkd1I+ATZpl+BaynfgzcPGDPwSxpLET1teh8rY9e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93329b0-35bf-4367-a9dc-08dbc70e4a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2023 08:20:39.1424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0x6Qw6hZ3l6Ve+IAKd84iuzxvuQABo2qg5nPQlfBUSQfVzvfVSj3y4FyFwjyHtCOk//fFzgbKIWVbMohsz6cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/17] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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
Cc: "Kopryk, Kamil" <kamil.kopryk@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "Chaberek,
 Jakub" <jakub.chaberek@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,
Is there detail descriptions for these properties?

Thanks
Carl

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Tuesday, September 19, 2023 10:25 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Hazubski, Filip <filip.hazubski@intel.com>; Kopryk, Kamil
> <kamil.kopryk@intel.com>; Chaberek, Jakub <jakub.chaberek@intel.com>;
> Dunajski, Bartosz <bartosz.dunajski@intel.com>; Souza, Jose
> <jose.souza@intel.com>; Yu, Effie <effie.yu@intel.com>; Zhang, Carl
> <carl.zhang@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH 10/17] drm/xe: Remove
> XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
>=20
> From: Matthew Brost <matthew.brost@intel.com>
>=20
> Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> deprecated in a previous patch, drop from uAPI. The property is just simp=
ly
> inherented from the VM.
>=20
> v2:
>  - Update commit message (Niranjana)
>=20
> Reviewed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
>  include/uapi/drm/xe_drm.h          | 19 ++++++-------------
>  2 files changed, 6 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 170d9d9c48d2..f70332986c73 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct
> xe_device *xe,
>  	return q->ops->set_preempt_timeout(q, value);  }
>=20
> -static int exec_queue_set_compute_mode(struct xe_device *xe, struct
> xe_exec_queue *q,
> -				       u64 value, bool create)
> -{
> -	return 0;
> -}
> -
>  static int exec_queue_set_persistence(struct xe_device *xe, struct
> xe_exec_queue *q,
>  				      u64 value, bool create)
>  {
> @@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn
> exec_queue_set_property_funcs[] =3D {
>  	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] =3D
> exec_queue_set_priority,
>  	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] =3D
> exec_queue_set_timeslice,
>  	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] =3D
> exec_queue_set_preemption_timeout,
> -	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] =3D
> exec_queue_set_compute_mode,
>  	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] =3D
> exec_queue_set_persistence,
>  	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] =3D
> exec_queue_set_job_timeout,
>  	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] =3D
> exec_queue_set_acc_trigger, diff --git a/include/uapi/drm/xe_drm.h
> b/include/uapi/drm/xe_drm.h index e39d66a65c89..fb7c3a8ac572 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -784,21 +784,14 @@ struct drm_xe_exec_queue_set_property {
>  	/** @exec_queue_id: Exec queue ID */
>  	__u32 exec_queue_id;
>=20
> -#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
> +#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> -	/*
> -	 * Long running or ULLS engine mode. DMA fences not allowed in this
> -	 * mode. Must match the value of
> DRM_XE_VM_CREATE_COMPUTE_MODE, serves
> -	 * as a sanity check the UMD knows what it is doing. Can only be set at
> -	 * engine create time.
> -	 */
> -#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
> -#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
> -#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
> -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
> -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
> -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> +#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> +#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
>  	/** @property: property to set */
>  	__u32 property;
>=20
> --
> 2.41.0

