Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD294C54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 16:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5664F11232E;
	Fri, 15 Mar 2024 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k49RNo7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4577B11232E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710518907; x=1742054907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B11Ur4jPvUGBSx3J2vcnCkXnmmGHqqKCO1YyK1fNQ/Q=;
 b=k49RNo7EgUKAou87pNL3CT4LLWAj0nCOy/z8punan23AY2gcdp561pEv
 Mvpx6Q4mEg1dEzKhuTOzjb9gp/b9hxICRNXCGj5HQ6RDHQ3TCWf0NjwQS
 4OE3Vk7PHB0wFA795X+TJqiYtQz0RyhMFPoQeTLPdGvPSVhZ8ibAZHNmi
 kIDLiWk5iFoQTAHVTrUgiBr055V1wFuIhwgVXQGBR/O/cAH15OMG1WVEA
 Oznnne/emWfy3OKDZn5AxvZxVZyhluD2/XhF9TFUE84WkZ0wquEIfbRrF
 zBM1IdusyLegv+2Oisah2T4ZhP9iZBrqO82h954csJLfw5UhrH7GyWE0M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="9229915"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="9229915"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 09:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="13123879"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 09:08:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 09:08:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 09:08:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 09:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZncI3bA4qj0tYOGMuRF3wTuVGoHeJX7CsdHVd1hHMgSUPnb7fRrAyPNgxksXFHMQLR3xyfpAE3LgGparCFYTwKua4gg2tlh7ZBLp9zrtGi9LH67gGMap5LtDHSvGuAAyNJ9XsSC6b0dghYMLlQxpx0fIvGIGQvdfbrhGBz5RJQGyIMl6VSPhFo8aY0hv/+ekyphJ2c0hTTZRmnoWQ3KEZ/T6/OMjiertZLoYmGFyHa2A6RUwuggeqJeeNGJ0khvyKWqcWSfJsrObTYXcbNehtwDK3rpFNz58Sil+MukIIFogmsHypEU/uP+ToKKouFLHG0sf/S4kBs7H03CTouUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8tCNhVwtxYSoqqd/BHBiW0g4RPSasHxTPcLhIPgZ/M=;
 b=Dnn3Igb/4r2QJGz0JAK6w+++eTE9Un40cf6d6UO6JdCbtCIASMz+mo8Hfo6+0ys9kMJKhMhNWPhIA/mhhkIk1fkYIv6Ph1wME12tgs2vkytWRwfwifpuYgBRR/PUzk05nEPzmkIIv7p0Ys5ZaAGF6qHvXMQu9nBvP/dakEl/HQvtN5nAHS7T/iaor0Ainl+FcE9CbNOXFQvNSV7dpA8QhHMqveqaWizKS8abe0dd5gb7uBI4DBzJOmRjjLM0uSgC4hr/5qjOM6iug0eAZb52hUcgd1dYIZ1DLz1UnrYxUXrVcVBhLT1sZQBoBRogLjD+hGQ2U75PPl/5rJ+tziFUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 16:08:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7386.016; Fri, 15 Mar 2024
 16:08:22 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 0/4] Spin of Reduce GGTT display pinning latency.
Thread-Topic: [PATCH 0/4] Spin of Reduce GGTT display pinning latency.
Thread-Index: AQHab4YC9sDLTkiKd0GtGVxTEJQ46rE5Begg
Date: Fri, 15 Mar 2024 16:08:22 +0000
Message-ID: <SJ1PR11MB61295F1816742929279C4DEBB9282@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20240306052002.311196-1-matthew.brost@intel.com>
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW6PR11MB8368:EE_
x-ms-office365-filtering-correlation-id: 91ca33f3-4c88-46e1-d27f-08dc450a2383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eCo9IpZ60ZhkbsobQYOr48V+gQIecMTZyMqWdHMpB3fxVrXtzqu/0Kk1Ma8jNxz6C4eDfiEOdEQNRq5bHObQgZ3jrWrdAMIC3eHBy8OCFR0BGCpZJoZrWJA3eLceGmM7R3Davksi7OeBFzgznTvAFl8Ue/Xtfm9AnOr0yLPlGRd3/5gUgGYK2SJwK0qv2m9pP7jr5oxmRUrauD4eNzF/A4buTRRoqO303sL0MoMeELfrcUarfHW0Hu4YGKiSGwIOfj/Eyc7EejHziD/Wt89P5C5bXAhIU7wh2NiK0HlUzh4Lradfs9SbmyAUS73h+GohB7PIS4pQhAygtQQCIvALF86lS4SjYD6wv5hfEbOq6AqdSlK1XIcHcJkBtuaRW1eNrGI6OT60BxfG55RYV5pr8buzfmrnz2OIP5KC7lZJOo6OVNoM61ZNetk9aA+f/Mky8KsbguQW4QS+gcsI5s6cIkEPvlCtXA8xOUbHjAXYMyYkA5PImj1LQ4HNzg5mtE6hvIXtrdSDmwi4PCfxbJMjzhEWHzKNuoWaGDtbci+islNLBJpKi6FKBIEUlWs8L1ZWQnkjZ0UTpoLvpYdsr9gfxXCtKDM6GZKqW2qhvzHGV2buN4gCA7egtlmLq6Qi1EtUXwUJJG5I9Q6Fh9eLdUsQrEtaiedt2kI7wZA4PAAa8oI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?84zGNDal2tVluXFUnKUyFf76m80IyN/Bzd2qAenkmezyvdkfS/NxWDZQuLr9?=
 =?us-ascii?Q?bZO81roCnGJzuT7hEN5J8VBRDdFZoTHTZpbL390H7yAW6tQtYILi7140Jou6?=
 =?us-ascii?Q?T9QBGGq5rVpvf25f8JD1eYHsIeL7z9WznJxz08sR/Go7z06O8UF2N9wp8xYn?=
 =?us-ascii?Q?X2IVlMFoUVtOJwsD0LFsk4NvJaFDCjByPGvAStFDar9gPlMNOyBCKN5ySkeH?=
 =?us-ascii?Q?iDieQggCbarLEyB0I1Gh+Uy6xutOoN1+3ZyWNntGhOEfiR73DJwU0erU8o9z?=
 =?us-ascii?Q?BfIve+GwHfGb5ETirl9pvi5XTaxMW4Sa3DrTrRi1Jox7k5wUtS9j2Ba3zebZ?=
 =?us-ascii?Q?TiRtloLxZGtPT1s2Gjj9r0dpVykrD8b5M28p0QneBBXLYOThqO/YfkgP4kme?=
 =?us-ascii?Q?/KYmz6rOY/cQtu830a+v8VKLBj4YK96dGOGLlxxdJBS50S76fk19G99ahYgd?=
 =?us-ascii?Q?XHPh6SCPATVJVFo8ksqFdET/ABFrNAN+5MA54ybT6Z9MbhKLrEUSQjfx9ujz?=
 =?us-ascii?Q?sCVg1jgccBj5EEuowa5fbT2yyw3t1yaMOnPXhR8gDFOJ0Ky/DhyPA6qJ68Sv?=
 =?us-ascii?Q?Jwf86sHSrOrDQg4BQiVvgdEmcRXG6xawXs5j1W1bxblGS3QXqy9oubmlIZE7?=
 =?us-ascii?Q?iA90MXBWDzssC2/qOvn/6ZJmMOxOSxwAd7dMSsfuT/APBgHxF9evRW7uG2/0?=
 =?us-ascii?Q?MSqdPX9qxOVT1fxgrhmxSCit7WAdbsqfVBO61CDiwx23fadlcAlY047Vsldc?=
 =?us-ascii?Q?97bnGczCypJVpf+wb8a9SQq3w475L3impfgnA+7O3taAsRuwivNT/qTeS/Vg?=
 =?us-ascii?Q?SmaWmsDrdsAHJCGAAQPNhoV5vjUdotg9pxH7Tjgnv5VU++bkOr3jGwxA+W7t?=
 =?us-ascii?Q?NKeSoasHXCrlGY5ijKJcllRbr1xmLNqCZ71cUR0tkj+3nQ4IWWEWHea0Lu6o?=
 =?us-ascii?Q?cFdOLAuT8TKiqlbtt9mEESGK8Vo+RFTC5APkXTt4N7LNQIq/MjddFuaL4awz?=
 =?us-ascii?Q?b1sSn7LNS/1krWUBEzDiCXV9yveAALI1HYqjFwPG2s6o+SCsaqR+w82iZQn2?=
 =?us-ascii?Q?jYiORmnywSd4N2WMTUIMgv3FaMO8Q39Ykrri03yUTbuoJUg7ivkbPheqNM+c?=
 =?us-ascii?Q?Eu7uDby6vBtbdJLzpO7qVbPlYuhixZx7a0xff3ukLO4vCIrD2v0uxMxQzQN3?=
 =?us-ascii?Q?Xizkg1I7+gVuFoxrxA0PkmvinyGOiPQ2f7je0Sljz5b5Jo4bl3j++xSXzfa6?=
 =?us-ascii?Q?nqurYKgkSNmQzeqB8hO79wCTonRHM0rxBI8TjeCM/8sVm4zzo+WR1Fn64l2/?=
 =?us-ascii?Q?G/li7tAzkKOlgnH7oMrYumZhGbVH4pNmqBvj82DxxscERhKiLDhAYLLaASL7?=
 =?us-ascii?Q?ivIZ1tpfxTjRlNBJEZ5T8njIbvhTyxXMCyVWV2H8vc7RZf2ygckSrax+ZX1b?=
 =?us-ascii?Q?dGcHWlNbH4RDMLa8qgCHJLewuiejQwduuGVLRNNjNb4u3jesIxvda1AX1q4j?=
 =?us-ascii?Q?Wo4pVK5U4PvrEM+zwUXDnWo8yrUeBrFc/+S3fvCkNavT6Bnynw2ZjrkKFCrD?=
 =?us-ascii?Q?aqzBd0HMRcjgbx7yD/jw7eWVvoG/Zo2rf4WYsPqtQS/yjg9Vpd5Z848aSMjr?=
 =?us-ascii?Q?6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ca33f3-4c88-46e1-d27f-08dc450a2383
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 16:08:22.7250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhD/CSakMAPuwjjoQlHvY0js1BT8GLLB5JBeeddybZYiak3HBOi/VuwWTZoQ715L9cPPAuljKMdtomL+mSoUqmK/RJTBPH34XJKLPRqEXxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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

Hello,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, March 6, 2024 10:50 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH 0/4] Spin of Reduce GGTT display pinning latency.
>=20
> Verison of [1] with changes discussed in reviews, mainly the addition of
> XE_BO_GGTT_INVALIDATE_BIT.
>=20
> [1] https://patchwork.freedesktop.org/series/130739/

The series needs rebase but seems to reduce legacy cursor update durations =
in most cases.

Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>=20
> Maarten Lankhorst (2):
>   drm/xe: Fix NULL check in xe_ggtt_init()
>   drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
>=20
> Matthew Brost (2):
>   drm/xe: Drop ggtt invalidate from display code
>   drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
>=20
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |  5 ++---
>  drivers/gpu/drm/xe/xe_bo.c             |  2 +-
>  drivers/gpu/drm/xe/xe_bo.h             |  1 +
>  drivers/gpu/drm/xe/xe_ggtt.c           | 25 +++++++++++++++----------
>  drivers/gpu/drm/xe/xe_ggtt.h           |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
>  drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
>  drivers/gpu/drm/xe/xe_memirq.c         |  1 +
>  drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
>  drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
>  15 files changed, 40 insertions(+), 25 deletions(-)
>=20
> --
> 2.34.1

