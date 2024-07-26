Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6274C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 08:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FC610E103;
	Fri, 26 Jul 2024 08:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtyYuUlm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720BE10E103
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721981829; x=1753517829;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fZppYmodQhqan1fFNKujNBTCXebo9DLHYkcOSp0a1j4=;
 b=TtyYuUlmIHwvUgitAwQ+9+sUp250isz/iZwEs79uFds/aLeVF7bvOgHy
 F9wDT9mGwOIE6jgyNtNrdPkhQ5VkpBRACPY84RSavoLuC8aRga5N9G+cH
 k2j3GeOwOJMkGsjXFClJK6ciTTn2rMHywFcwrG0p1kTtllwNn02/SdILy
 dW8/hqSqb3LtMZeAO2UAHXh2A98SFaRAO631CqMj0cGJ+UqCUUC91Zr3+
 TvO0K1Sqn7kNtZJgTsAGNxvyoQRDiMY26oQ8yytTXWIRAbYj0aZEVJN8y
 3Kj7ATsX4MruxNvf+EM3Q5MMZsBcC6jgsAl59Wo/TFES0u1NVAbULzlfj g==;
X-CSE-ConnectionGUID: RQvDTX/xRBSMnLiU8uaZ4A==
X-CSE-MsgGUID: rcIYav9cRFyedrVgCagUWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19612273"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19612273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:17:09 -0700
X-CSE-ConnectionGUID: fmQqj0EMQCSJ6z7A507jSw==
X-CSE-MsgGUID: UXiOvA5tTkKXviHz6sJPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58309174"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 01:17:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 01:17:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 01:17:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 01:17:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 01:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFDsBW5LPNvBpZkgHLZo7b+2XgE5FNx/5gcQdVbeqZqsvD7ox9AZLVN1IYfpTDTEM8JNdM/DaESKRDXkVZxWqzD85i4/revfniXLL02Zqvdexg8z/7uCrb6l4aRF0w3Dt2sL6naDfpzkFGeHHSgLq/HuJcFFswJykBPKnLky8kP5dHhbyLUfYwBH4NrU/8jENKg16+YxFPF/+hh0eKyk518PEbPnvTHk/9pDOlxJ49P50jEMZQtlmAHJI6pVfEZFoII9S7jHU+V0LSbIhVH6auiLzSDS7DuTyOF1HbwCQHHU4+/2jAr/kBI6ZZ7AJ68W8Ru6lLnUowGjN+Urts3ZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ubb4JdKd3bOLWzWEfFtdABkJoJIM7Imk3AmtlDNlfOg=;
 b=F2dS7LdZVQI4nrhGrKmCbuOX8pcxd9GyFtRaHToQW5Ooy5ejn607PIhs3GxKLq8ymQ/LoJfntOn/DFMJ/gAV8sncW+2+N1NpBdiB02BCj+4sfRoc5Br/gEK+sLSVCCN3kCMXgC3vRJePhqZPQ8PuHI/fgjXBACD/CmwhxQElY93Ui2d95qPPiaf3Tpl9ClBRbOgC7AMAex25t0UeRHR6bo6qKzZqA51IXvu05KTj28IdexcxNN8NwFxdBqey+fqzCHnb5uM9MVsKi2yANadV1iZFWuSPauG1TFM65F/vF7euvZgscLKX/+pEDPoSOK9+14UMsZbV2sbsLNRcHYiSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 08:17:04 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 08:17:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH] drm/xe: Take ref to VM in delayed snapshot
Thread-Topic: [PATCH] drm/xe: Take ref to VM in delayed snapshot
Thread-Index: AQHa3umuQzUdGKX3ZkazvZFBFiRxq7IIqlJQ
Date: Fri, 26 Jul 2024 08:17:04 +0000
Message-ID: <SJ1PR11MB6204C26850EE7C5D5D115F7D81B42@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240725232414.1958243-1-matthew.brost@intel.com>
In-Reply-To: <20240725232414.1958243-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8097:EE_
x-ms-office365-filtering-correlation-id: 078d6afc-5f9d-4d75-1282-08dcad4b556c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0IfShrujJJN105eiEwQCy05qNccxdSenb3RIbpUUQ3izD17AeCDP0Xv/BXaT?=
 =?us-ascii?Q?xxMx6GvXzMRlvr2IupLWdDdcq3GZKT+HAqETMsnoy549KSqMhucteShBaYr6?=
 =?us-ascii?Q?MataTCxJrKDZywcXGXNw0SPX50qaRzhlcLRAwMQOc46BR95nKIftqSOyKs08?=
 =?us-ascii?Q?CpyyW2K/IH51M+zXXRQiSrqr5/Vp+PNJ7h6oCzst16bx5OgmiO2mGfUZkFid?=
 =?us-ascii?Q?o5U+gO3Xs00szjKTMdWv9dZv3Qyn9m1qmvQUuftIeqo/6Eet+WEMJwTZCoCf?=
 =?us-ascii?Q?PuW6OJ9S+qe93jhlglvw/NLUexqVTCCdzU3BYof9EmpRvp5lMiRLieTWvkFz?=
 =?us-ascii?Q?0/YtMu+eu7YtwzLw9jZ2aAgDpGr1A9Lf19LNHLIOfggNhSTrhGgvhptC86vA?=
 =?us-ascii?Q?zg+GWUQkZFODjiMLGzSOBX6t2y8j+6AAXsM+kQeK+2awxkAunEmxrYQxaffi?=
 =?us-ascii?Q?7TDKujt0wmf5q+4KzmJxRyaiTbu9jRejhBgjU0OXm2wjwQgLo1TzRo6ncOW1?=
 =?us-ascii?Q?sGumq9Ms1rWIJEFgQGhZ4YXy+DrxZKjDt9OSY8iMOFvItnvsjB2tlk7ayU0C?=
 =?us-ascii?Q?VCM1FNXfPZxm5uJkoBjR+xAugF/R9sBMs1XKxPUneJx+QiqhZaKrwp4R3wFR?=
 =?us-ascii?Q?Tm8sGaF/wo57TIXmPWR6yk0j6rkFYbb4SzGCXj8Pw8yG40uTTQ0pNdQ+p5Nh?=
 =?us-ascii?Q?5L/iF8xgRSR5RvFAcqKWuK8/7nVYKSvnhFFQb0MRyQaryVEEptj9PuJPTKlv?=
 =?us-ascii?Q?Bf2FFcei7QbzheaFhHT+EsNDuxDX17Lh1p8VQNTJXYWEo5GqbUZDmyTq9cnJ?=
 =?us-ascii?Q?OfiuqwNtc+RYfmLCpZjmEVZFAzpOuZg4Ex1O/6zg5zYLOJVtK12vUMxVjJO8?=
 =?us-ascii?Q?3yw0w2ALJTHtoj/wVJJvra12r8qN4R7PQpTAVF0A/QsrKc4u6MpzKcrQ0RLL?=
 =?us-ascii?Q?SbUX1eQkyKY0PjEmWRL+oU9aSGv8UyeypsgRyM4LZR8Oak+arhsslv3R1So0?=
 =?us-ascii?Q?h4vyRtB6uD7u2JlhgUy4oCRuUE1yZ8qIpo1xQmGd0hCDPNAEdmi4yx2pEStp?=
 =?us-ascii?Q?npTyu2UQs3IwEVuq3PlMZnlwcR43SpFSk1IkICoHzVPk5crGIQyhM4z1bs8U?=
 =?us-ascii?Q?gyfU5fFsYBHKsiu/cHbcvC1/qrvm72R/vtPDgtt0pt7QOfCfH2s9J+7HQz28?=
 =?us-ascii?Q?o4COYrZc7/Gymj+AnyIBZ5OOJ8Vcow+tRVPZkRjuqfljLvIm0xg+WEpxTKW6?=
 =?us-ascii?Q?5FjRLA6pCPXwuEloc7ZtyE7jWduWD996t7oIYiXAjomL5hH16+w5y4KcJ+qQ?=
 =?us-ascii?Q?SeLbKx1S2fVIch4xc8/bki6OAKPBuJCRV292f0MtVMWQDNDZxcGkHJECAFJf?=
 =?us-ascii?Q?Z++SSPnTOqdNZVrFRExoRDMzQeUFWygTYEc6WUW6WxZ9WigtbA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WBjnSLqBxR4koJGXTqNV2adfz2bCFmtsSAa6UI9bB1arMlmLGnE4TgWllBwo?=
 =?us-ascii?Q?A0dRtmPf+vZyZKrk6gUKZKSooVHXpPXfMI9hXW7Vu/zFSkx9ROpp++LM0s+Z?=
 =?us-ascii?Q?EwGciFCJ0pHg0WOOA8ZwuCCP/xXLE2+9tBMTDHrhzF7VNZoyfSkumKpL1Btt?=
 =?us-ascii?Q?pdcxTdqcEpVvanIQ9pSpBKfglHEhf/1G61DyRlDSo4hOrQwfH1i4fyijz+aT?=
 =?us-ascii?Q?sdipD3MnbqfKoVxfdbFD4rSmKgjw0Eq0el6Z8+EHrdOqBgtJaqX5MxLzbCYA?=
 =?us-ascii?Q?N0rxTkFOKvxLviq6C7vYRAXcaMA/adT6PxzQqrkupZUFQC770EMOujSB8YUu?=
 =?us-ascii?Q?B3spZrP4jsN2OQNcVqVXanq2UVw5SqxKlYhqwpHDS2hV7pE89J2kI2xJnkr5?=
 =?us-ascii?Q?8qvr+Mk2EJnLdiAAn05yhoPXBSnzighrLJBa7AMfmhjKNE30zj+bebWukr9s?=
 =?us-ascii?Q?zCniUXkSIGCpXND9bFD8kiaE3nMhBH08eggRF2f7RQhoYDYzzf35HOXb9bje?=
 =?us-ascii?Q?zMP0RXZdgzDRWwFYuys48G1rrbTLgZv7CcktKEcYSkKr8VIE5MXvzrVsWeff?=
 =?us-ascii?Q?/R0HF5pnLX9dTqcpvaOkpW8yDEFeE0Uu65em3DAfAcjsTf9HzN0rwmCZGSmD?=
 =?us-ascii?Q?q7HiTtXaDWqEu9LfpFrRt+gh7oyBNv/M2jKmGAFQI8XRPkyL5BkUJbdDvRjy?=
 =?us-ascii?Q?5TLbZ6CY1jeRw1isrisb8dOG5e29xgMsPB36zu1qd1QNHlxTdwiTKMu8IuUO?=
 =?us-ascii?Q?X8KwdIKRgDc6GoVc2tOy0xCwSCDp5NZcN5Bg3/qBuv4Qo+UPRCKjCVWd/MQH?=
 =?us-ascii?Q?7vZhZ3PiUGVGZqTasPrzUMcpr8MPq962tf8TtQW5Nd+pD56hgSc3UmhzWtiB?=
 =?us-ascii?Q?56i5KLh//fzbPm1wj5YFdlluPYTpEHcXfN3eDd8p7Cgzrsb22Pa0eH4wIoAZ?=
 =?us-ascii?Q?TYKuXDx8QdiOe4bGxAfeI1FAmdLeIvG3tV71j0EyWwRV8IPaeSI4WEY8KuN5?=
 =?us-ascii?Q?2IEjWK9mP7zVtDlq58FJygNoiecEnXmRflPGIZ+V3udQ+fe+HFVRLq7OYpPH?=
 =?us-ascii?Q?DzrQyKFExUOLoloekFr4EnGmtBdU3Fg2LeGYoeZoUo9NYkDk5DFNlfDd8TBe?=
 =?us-ascii?Q?fZJwLv+PN70XFBjdqlDrwKBtWG0VdLb1iNYposU/pCa8w13dPYQmCaCSPTHU?=
 =?us-ascii?Q?PtexuV214USwcTF2mb2lUt97JrxNJYy6O0g+4pHtkrkg6qaYq7FHYbpvk71M?=
 =?us-ascii?Q?wtBOuvrjZM0HFXQC10dIujYVwwiZBjj8OAGuPNEAUbZ2xW5CDVOKF025DJNA?=
 =?us-ascii?Q?+46mvTgx0jwHffY9EVmSiW4AVO87RexRr5g56BE8EDc5bTAFmDg9aIB5b2c6?=
 =?us-ascii?Q?nDdevN0a0h/sKCDrfzaNiH4+yJnPhlhpIjcwI+pFh6KZW35oiECVXRI8WyZm?=
 =?us-ascii?Q?tB75yezL17JJvX2n6cQKm8GOu75oJxaO5jFRXr/5N1Xt/LP7y2MTNazBu2tl?=
 =?us-ascii?Q?8yG1evHoKo9JRYmp81dLVkwDXL4sNGiFHvwjJHYsUOhKmh+KlrBOWqN022i4?=
 =?us-ascii?Q?BwunqxqMei8C5IIS6BuujPhzqS6HjMkX4FrpoAx3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078d6afc-5f9d-4d75-1282-08dcad4b556c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 08:17:04.6863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RpkQnntjXrGF2veoQHtx/LveBumAmqAd2qR15NMVGHR1qzhXdw97EVH9dRukY4Ci5zSv2RzeLnLCz6CWShFfbkSH97Yla2yn6kYSRx0IU94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Friday, July 26, 2024 4:54 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>;
> maarten.lankhorst@linux.intel.com
> Subject: [PATCH] drm/xe: Take ref to VM in delayed snapshot
>=20
> Kernel BO's don't take a ref to the VM, we need to the VM for the delayed
> snapshot, so take a ref to the VM in delayed snapshot.

Can you please give some details why VM needed now!

Tejas
>=20
> 47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
> Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 94ff62e1d95e..9ef9b45a3596 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1634,6 +1634,8 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>=20
> +	xe_vm_get(lrc->bo->vm);
> +
>  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
>  	snapshot->indirect_context_desc =3D
> xe_lrc_indirect_ring_ggtt_addr(lrc);
>  	snapshot->head =3D xe_lrc_ring_head(lrc); @@ -1653,12 +1655,14 @@
> struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)  void
> xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)  {
>  	struct xe_bo *bo;
> +	struct xe_vm *vm;
>  	struct iosys_map src;
>=20
>  	if (!snapshot)
>  		return;
>=20
>  	bo =3D snapshot->lrc_bo;
> +	vm =3D bo->vm;
>  	snapshot->lrc_bo =3D NULL;
>=20
>  	snapshot->lrc_snapshot =3D kvmalloc(snapshot->lrc_size, GFP_KERNEL);
> @@ -1678,6 +1682,7 @@ void xe_lrc_snapshot_capture_delayed(struct
> xe_lrc_snapshot *snapshot)
>  	xe_bo_unlock(bo);
>  put_bo:
>  	xe_bo_put(bo);
> +	xe_vm_put(vm);
>  }
>=20
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct
> drm_printer *p)
> --
> 2.34.1

