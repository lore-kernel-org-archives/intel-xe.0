Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E89DC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 16:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA57910E725;
	Fri, 28 Jul 2023 16:15:49 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725E710E725
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690560947; x=1722096947;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3pwlQLrNav6Mjo3lUOXpsylfQ9yCYvOC4HRo3ead/EE=;
 b=n3q1Y0zAvOBqKfJcxroANM9oyjAeZYqhHcA/kwhyxuU+6wZ+YMBt5Il6
 X1pUu+imVKTwni22gDkZLjIStrRtdVbAaSgyJXE4YHBrEjnSUxVFqTjGg
 0ttQ97xRMreVYX/YntnVQmqqWZYe+wc7xxcU2fSANn+2WMqEq0aGK/xTz
 j2Xfyxpsx+iC2Qe7SebA2mqy+1WQx/vLbvLZ2xMAG23qn4xTI2jfR+Qc1
 KETs0koX4jtRtjAVfQzS+8X0GXNxrWQggCTlhNDiRy4sivT1TkcCMyy4U
 XLupxDMBdrtWsVi0rBMZoDjGJoBF/ao2Ml8IDuyK7hb9/CwM6mxylyW3v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434913986"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="434913986"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 09:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730838195"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="730838195"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 09:15:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 09:15:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 09:15:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 09:15:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 09:15:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd3jh/s89hQ3YELIpnUjJs1uGZvnuxl3KQCvUV/Epa/Ji9c4UjWqrdqkVxL0VdPmiDfbgFGQSIij6IN78rMhHETKclAJPNLhCGKC1FKBA7tdKpgoNFqWf9yu2qW6FwCvMXC54/1Gkt1kNyLP5Z6/8QqcIyTdeNDe+ECNCRblrnk7ZQuDsHsSb0ayYROpnJzIw+71jmaAO0jeu0DugVrJ2O5vjiHwyMWcirw1GIbJqPk51/VlBANfKzM+7ctNiL8D8WeFe7GZydCWXYFqIzFzPm8pw/mPnNPLEKrF0jhLeFrQ3QrpnSr2iK/Meq0QFt95V3lpKVBlgMMHxaZuEp8fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+Ld5JjLs4b+o90ShJRrmYjcNXU2yenvx68jErz9uxk=;
 b=YPZTWbEPvChMn+wD2G6h6z4q7eachyQ9AAb/hl5wpWNG8FBYdexZBz13kE3sH8UGPeMJIESag/XVrJgq9KtLDW86bWxT0oayrZCeKxmMdirhORSmU0XsD5abrgfbq1N0WKqOEtbznpU5SZsxtTg3DnzunnbHa+q9bNJRrl68se9S/9iA6lmG1Maww92B8st2I1eITZzAzcRd57TpedPCl/JiVW2E/XCVG9mnze60qHcK6oPC3dYwsuNye83KVuH+RtHTfMFK1URQPY2CWqis1MXs+tv5pEiPhghyFbXdrd6bzW5SKoNWzO8scUcS6RUS7xCPo+P9xgPo9hHP/P39NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 16:15:38 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::18de:a383:8dc0:3cb6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::18de:a383:8dc0:3cb6%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 16:15:38 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 3/5] drm/xe: Fix the runtime_idle call and d3cold.allowed
 decision.
Thread-Index: AQHZv0UPfjRYooQ2/0yTFzoxUjk3yq/PXaMQ
Date: Fri, 28 Jul 2023 16:15:37 +0000
Message-ID: <CY5PR11MB62115CE0B44425213E21ADF09506A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
 <20230725221159.354618-3-rodrigo.vivi@intel.com>
In-Reply-To: <20230725221159.354618-3-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA1PR11MB7174:EE_
x-ms-office365-filtering-correlation-id: f52c608a-0684-4fb3-6a92-08db8f85e181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W2OtOLme3ASN60SGoechUeBh2t3OAfAt/wvVTP44o6m9PfE7sphE9nEnNV00HeMVb5Dfv+xlLlIsF/BXxBqWjk8Ysi2CsO80+j8iKWjk3sq8k2uc2ykJJ62aeFOlp4RaG7C5boMYKlT1dgIhYbBq/ojWepWk1H8VpztnQt/hASNd/pdzdclnQ+72XA0fEZbLuK/CXKEl9LnCwStlKW3wQvfZOD5zn0m3Jg0v+l7Ordm5hX9tEpnrWJR70saW6bFxV5ytpSMsss/P0U4uM07UPMA5sbohnOAyQR2blSxU3GmKKgzkFcG758HL3kyyfgnj9i8af+a0kPbuhxuDUOrW1dzRM5Pvw3+jHkPdRZvzkTyLcEIJim/A1I8Hh7knyIoCBt0RLliuJ18kQIq04ksxepRG7RGUtGl+E3JT8M61zdcUgYGdwNDyv88PGKh58yE4uKBSmzjh/FfrXX+HiGB5qW58kVyeXtEXumTqAlsoozOtdPG2VPjmHUl/KLSuoH4vyTwVvnUpH0Y+siLpFVtjHn83/TdzIIxp/t4ifdYo31LcRmtVDVTQZqmw5CzZVefcG2konOwtbCgKRwqf68PNilHj+NgjoExPSl8pnWHl9B896WjX4x0LocAnVGMWQGoOcF454Ho16atFp3oS7xcpOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(55016003)(110136005)(76116006)(71200400001)(9686003)(122000001)(478600001)(7696005)(5660300002)(52536014)(82960400001)(66446008)(66946007)(66556008)(41300700001)(64756008)(8936002)(316002)(66476007)(8676002)(38100700002)(186003)(53546011)(83380400001)(6506007)(26005)(86362001)(33656002)(2906002)(38070700005)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ikxE7wy2/pVbAOfFYtkaH9uVcsPyJ/+dDtIuUJAGcTBOq+0ZKv7BP4d6pd9D?=
 =?us-ascii?Q?Ap/+cx+bhTo4UqZcyMrgvR5GZtKjayg6JcEw8fhK8awjhJpRUcBGWAPIL7bu?=
 =?us-ascii?Q?5tJQdNFQlx0gst3I2APd2BzwIbZB/NuvcGn+VBd9etZn/EVMRWWlxxZ/dtb8?=
 =?us-ascii?Q?HA3mDkRRTk4AOIgQl09SQy4Dg8Nr9JQCBFmxgfYldSfHVpMYETP+mYEVfVUZ?=
 =?us-ascii?Q?FNI7Zm4eRoSF+tkTGaC6d0rloI4HB1J9PmPZsKsw4q5w7/K4gMkPnkcw/3Hn?=
 =?us-ascii?Q?ZMq8M09/LUZeQqQZD3VKGZKq4Lpw5shEjAGBPA3KE4rOFqh/q+be72d2awet?=
 =?us-ascii?Q?HvPE6NhjcS1V6Sze7EHxROF3132WDz9zVJWc7XnwxYuocegeiK83OcsfnC4w?=
 =?us-ascii?Q?s8J7dY7zCUnvOeiiE3RfwZCZeVGytKmLJ/THX6VJzpKfkzcN4yJON2rsn4n6?=
 =?us-ascii?Q?55e8Qu1tI+AYWi12c5kxlA2WW5Oj47uN43klpMqkVtspruYe6eLStq8UExmB?=
 =?us-ascii?Q?R0rswmdKIo80qkHDYS5JtV69grFEXYnMrjtq9Ok18+c9KJlvbFPD9YB7BMiq?=
 =?us-ascii?Q?MY8+BviKcFewr3c3bHlrS+Pw4rbClziqRr+B4CUtDPrjT+kfKuWoqWHTGH9z?=
 =?us-ascii?Q?1OnktpI67KkuJRO9wnk1MYysf6dSx7c+7HJdS7qZdlg6/Ox/tkj+5bV4Ly1m?=
 =?us-ascii?Q?G4j0czN5Pvj53Uym/oeGvyRqYmUNojsU9UnkrgyExd+jn6/4B0nZnZwE3rZz?=
 =?us-ascii?Q?VeGCY+NTJqSrrfWvfSjBOI6u3GGofEaSBCg/GKGlVRZaOPB+kPEmXKENaXBE?=
 =?us-ascii?Q?CLBPcTuu5/ajE3A1pkxblAZVU5xemUhcROJkS1lzjvl6Wlh1WoI7Q+cPa2fA?=
 =?us-ascii?Q?QwQwaniIkkpPOpwycFK6k8DGFQa7r6/TLhL0vsTMTWv982uQ87L2rEgDEX5O?=
 =?us-ascii?Q?O6FslbCTNF8prL2h0tZp2FIDe0ETdFdSy3duHT89xAdF6OypOgt09XS1BX9o?=
 =?us-ascii?Q?+sAvNdJ3Rikg9oI+RolS1zQzcjOWxUbWXSXiRpDVABBqw5sQf0tO0kV4QUnv?=
 =?us-ascii?Q?knbpMj0Vge1N5TvET/mSau/irXYVRtxPntaEdyNm1/TeppYuTMOXE7icI+j7?=
 =?us-ascii?Q?9ZTQZo/7W1/v7MqovIiNNDQNdgjCn8p06wbegiL+Wqj40ANxwIEJ9RJfZiGe?=
 =?us-ascii?Q?tgEgobEreoIGKSf25AeOXmlFa6Tj0FKWlZQrhY9MWUxb3By70gadEAq2B66e?=
 =?us-ascii?Q?I9ZjcyM4Uf/APRyHdsT5Jpd7j9MxNN81C09AlCGDsGsZ5zNsllmC/snq+rJ6?=
 =?us-ascii?Q?UNXJyV5cxMDUZ0YgG/tNY5tjWQe3u89Ejr9iTNksIB4LTdk4HPAmXVL8ybKc?=
 =?us-ascii?Q?ipUnzI3NpUzth+D3PX9coM6N32u9WZzFuo84Sd03YDeWNYUyYyDGBclH1Ise?=
 =?us-ascii?Q?U/LOCm2nioTiPiXDBIBcf8kHyUb0QhoHzWmyJo4fle06LerTtUFR6kO/Usrl?=
 =?us-ascii?Q?JeDoazhgRMN4tnxyIRwgyOMH2boSSsEaNHf5J2o0qEQj2u9T63q/916cOR8Y?=
 =?us-ascii?Q?NsfiTRqx2388zUHijpTV8R2olz2VFd3mFWv88eJY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52c608a-0684-4fb3-6a92-08db8f85e181
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 16:15:37.9387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uc3JWvvTPrfKiGv1bsBvasGeqJDVcWl7+lAyBYOR6qN3EvzVTgYeG6Ltf2wOSh7Mq4cMVcXWDpc0WwXc5zdJAtNhuXio7GjOXQhwV3diibA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe: Fix the runtime_idle call and
 d3cold.allowed decision.
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, July 26, 2023 3:42 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH 3/5] drm/xe: Fix the runtime_idle call and d3cold.allowed
> decision.
>=20
> According to Documentation/power/runtime_pm.txt:
>=20
> int pm_runtime_put(struct device *dev);
>     - decrement the device's usage counter; if the result is 0 then run
>       pm_request_idle(dev) and return its result
>=20
> int pm_runtime_put_autosuspend(struct device *dev);
>     - decrement the device's usage counter; if the result is 0 then run
>       pm_request_autosuspend(dev) and return its result
>=20
> We need to ensure that the idle function is called before suspending so w=
e take
> the right d3cold.allowed decision and respect the values set on
> vram_d3cold_threshold sysfs. So we need pm_runtime_put() instead of
> pm_runtime_put_autosuspend().
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Let's keep this version of patch aligned with other non-drm device drivers.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Tested-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> add6f7975b82..834d87d98194 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -144,7 +144,7 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_set_active(dev);
>  	pm_runtime_allow(dev);
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	pm_runtime_put(dev);
>  }
>=20
>  void xe_pm_init(struct xe_device *xe)
> @@ -300,7 +300,7 @@ int xe_pm_runtime_get(struct xe_device *xe)  int
> xe_pm_runtime_put(struct xe_device *xe)  {
>  	pm_runtime_mark_last_busy(xe->drm.dev);
> -	return pm_runtime_put_autosuspend(xe->drm.dev);
> +	return pm_runtime_put(xe->drm.dev);
>  }
>=20
>  int xe_pm_runtime_get_if_active(struct xe_device *xe)
> --
> 2.41.0

