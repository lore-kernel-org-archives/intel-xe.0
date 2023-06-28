Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FE8EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 08:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505EF10E364;
	Wed, 28 Jun 2023 08:03:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFED10E364
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687939432; x=1719475432;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AtDDVfxB5/YY5qEVr/brXeolqqS+auPL4WjXam/RtPk=;
 b=a5uwBVW+90ArsyOI8oKxJTczGvca346CXLxZBNmvtbw2GCIbH2D/YgnN
 2I8Eo3ZTw9j0zaKnt4Ks9hWlvq+mrWX/yo7uw8PQF0utETVL3+D7NRLcz
 SNh1LIFmh8lDY4ELcpYWjlBu27iqJtttNUsV7M+I4EHlzHenvMAw72xdn
 9NkHOamnzTk3mxZlK8gHYM2kqSh+DaMwifHWZFt5+fvZXvuls5h6O/Wa7
 eiyt4q86qFqkea4WDdntYUfvPkiJHb4I6Fx/DWCX3vTSgb3p3hFWM1Q+a
 a6P96acQxFqKzO8i1h//H/5MyNCMLE/BRvICPxdbBeqE0WjHjiVK5IVgu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364329702"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="364329702"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 01:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="720136041"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="720136041"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2023 01:03:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 01:03:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 01:03:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 01:03:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 01:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWQFdqmbDnnGh1Y663ThAjz5FJbCBsA9scPQD5x6sXK62g7f1azsbNCtZCprGfzpRZYkXYLAKbGdSx2W0/D7yVqK93XVmOSqxqnYZYQdFQM80sx+OVECWuyQ2rk+C6SD4RtVAujuDEwZhvb+Ak6dldP42H5A3AavBfai120rwdJTIA7XGm0RytdEch0ExMLDJgaLNbCujyqlGSKoj7OWe/fX7KxHOzjGYd0iUExAIyV9h0CDme5WcOhoUoEHGd/IP61m4H+gZhwJ/4COpB5s8yeMyyIi1sciHnxxJUigvtPc2kwfxsuynTu8ze7T6WvvBccXk2ZuPF4egxoVKzg8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO0shVRXdpo9LC8zq7ZwlfmcRdWjO7Do0WRQ3OroJk4=;
 b=g4FuMek2pc0AH4/Snr2qPILJj73Gh9GYWVC61m55Bw/kADOxOQ+Kb/snS/8gFdO7KOdawcJmpq8mN1Q1AP3YqC8hFaC5OsuHaastc1DOuz0Fmx7Qw/8Gh5qT9MP7mWrk8p6yoiDLki2i1ckHkd7TkBLqv9PPL+NAU6ttdPGvyUhu3mQy8OjBdkEtiZDbotvZfQf0knCO9KNk088ID96Hlh3tbIiSYNPLpMa+84np96l95xiUKGUAfAVSHvCQW8FVeSa8TyLPpmkD4DyMc2+cb0ucoLWWcXQ5Jf4bNXAkqQ3Ump0gcf9D7UsM3p8h6WAFg7kJdNFwrgNVnB/g0lt+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 08:03:43 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 08:03:43 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
Thread-Index: AQHZqBaFB9INw1IIsU+9uKhuXRKwua+f1wEw
Date: Wed, 28 Jun 2023 08:03:43 +0000
Message-ID: <MW4PR11MB7056A00067B1C823BC026482B324A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
 <20230626101648.3480340-3-tejas.upadhyay@intel.com>
In-Reply-To: <20230626101648.3480340-3-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA1PR11MB8491:EE_
x-ms-office365-filtering-correlation-id: 97182844-c4bb-45b1-d783-08db77ae3104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2g8FIhir1IA9lGHhWzcJ9Wvh9uM/m83BQTKxCdLnXyaThPhzuZkpWW6d4p7qYo5f1AYaYzaTkyT4GZiISvj8+YVUUBgNEGSaYJwUgolHzbteqE1pNgNJR/5UDKto86SRnqA10Sn3vR0mbzGSoU36HqjDdtOQ6qCvS0d+1hbDmYq5h+qm3z1lu9QqK2Kyizv18luxpYqO2BhSwT7uizljBpnXbffznwhwy2ZbMTzzICkmHq2yot8VHD32mDFbIMleRoAIVyDkqrE8YA2z5lYKZCPAHYM1zohwkbVTTZFozGQ3j7JcE9YyhrHuDtLS1z5vhxz8yq/tXJFywl/wwK9zU1houedSF2Wgjo66OtFh9cRvbmBPzmvc4hrpVXtqCDz+t6rOCgNwN3XwZDNKLUb+yjciiFuD6TLF5ElGOqyIvyNbR9XBj7XYGLKUFIpw4PthDRNtSlRy7Or8CLq11TiWWqU8n66jkzn/vPjC/ni20LbEhAC+sG88LAq1rfip8AeOVYinY0EgA+EQ6lC4SXiCiMgIci9EeOIhjqpLd3/f+Dgr6HLLULZKUgPTazz8whL17kSuy+Tqs262rmeRLnVJBxFobj1lyH7zKUtfxqe2wtcl5WEiMfEXYE0Sfv5KHPiE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(6506007)(26005)(2906002)(71200400001)(9686003)(7696005)(122000001)(82960400001)(38100700002)(83380400001)(186003)(53546011)(55016003)(41300700001)(86362001)(110136005)(38070700005)(316002)(66946007)(66476007)(33656002)(66446008)(66556008)(76116006)(64756008)(8936002)(52536014)(5660300002)(8676002)(478600001)(66899021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6aZf74t/o8qSoK045BKWm3R4wE73mdZUQGtK/KWdHAstQ+qTMyWOi2eOB9l6?=
 =?us-ascii?Q?wxAiOh4Zt4/e7oybvrTzTWBfWMG1eIROlB7HdZKfVWXSiNCID3xZFrZfU9oe?=
 =?us-ascii?Q?t0hehjr3WHssRpSeUaeOvaKu7adH0MB9C+KOeuz7qCS3e94jtJ2+rPHHWfng?=
 =?us-ascii?Q?+3j3ofnOPDvNazCue1UHGee9EUsdaZKXuy1R1kNFK0oEhT7DeXj5BMVPTPrA?=
 =?us-ascii?Q?8EfsE6NThDngxuR+01tzb8m8Fs/P4tDTG1rHYtlU+IzYXslmXxZjRgYLL1mh?=
 =?us-ascii?Q?7UUsQQY/tJBbsta69unKzMtwN+8Alm2bOo0eSjSK8/XcLU/6PFa28lMOMQ0t?=
 =?us-ascii?Q?7fay0q0sZfGPpbS2naJ9hOkaXl+5cmjCApIGB5N8KqkanpyD1zPVstEK5Kzz?=
 =?us-ascii?Q?HqwbfhnemPGSnzaVtVTiY+4KBmMk8oV1aHFdgQb3cZi0bv+Mpm9zfRKc1czK?=
 =?us-ascii?Q?Tx8xfFMIR9xRAflQqU6+/KtSggRgYtuH2QHIIYsFuPtnV9cYnFb9IzMoJy47?=
 =?us-ascii?Q?qkUE5L2wIadQzGDCO6nstuf7WdDpGbstRpZCfZ2ELfv5TS12lij+m593vBJU?=
 =?us-ascii?Q?DGWyE4z/hnU936eWfvyYO82u8ILZ83swI8lH5iDDamcW7vDrsXtOlp0Mfrl/?=
 =?us-ascii?Q?13Aqf+rL/qKPCATnegDfDBP6CTt/l/DwKzNWf9F7Zi/3caPABQMw2ZouIE7C?=
 =?us-ascii?Q?UKr83d23sMNgKLFCCuJSOdXCnevhHNaRhcPD+U7egcR4u+2aU6g6jHnCqnV1?=
 =?us-ascii?Q?txVs/ojc7uhSItl2XqxvGu9AwJ3AnkNqK9UnRexatvIi4iwbvEAVLvSO7KqT?=
 =?us-ascii?Q?EvPuqChw6bcRcnE83N3fG/fYbki0oB6k4tY2v4lDU1H4jvIcAUu8CCqX/vbw?=
 =?us-ascii?Q?A93w3xOg91oiMCp2q+JX5kmqaLmz6jyVSrcwT2ygiQZqS2aNPG6oO/96V4gB?=
 =?us-ascii?Q?bk+iCklbpozesy2bZ2D8Amtq9ev7KlIed4OqjIWQOo2CSatNL/2uYENvubI6?=
 =?us-ascii?Q?QgFjL5maH9xhek+zxAHj4EeaCaQ2LuwVQlJDWsjRfr9YGV8NfzhOpEOT6+lT?=
 =?us-ascii?Q?wbtaKd22ZTrRMNbmRI9dTjMx1NmLHw0ptq7ip4SrPsy8fHiSRu+OvN8FuCls?=
 =?us-ascii?Q?l7Gzlwm7ftRKMwKzbwJZFQZjX7P7tR/Z2gASaQcr88pWRFnapUQ/lViaoAbA?=
 =?us-ascii?Q?bnS3lGWwaWOlHdN2fqlabd26sW++jjHjRGsIlJ8TihSFQewyxcIWWIDv17H9?=
 =?us-ascii?Q?dzOL33b4vc20IeRxI7KIuPxuaH1OSwKzDAgn0gUYMkv37DDuhu7s4PhD43ye?=
 =?us-ascii?Q?1dQNcAy5yoyRt7dFjNJUY3n2m63kzqjDrWHm7aPeq3WV6ZP+io9At0mSNc6h?=
 =?us-ascii?Q?9Qr7G0aiTlaPZXVWr0wLzTt7Zqg3XoLioUHGgHK63AMsrG+/HJ2GpTKUJHPs?=
 =?us-ascii?Q?3w6cAK6fsPkfLdWfJToHdRnZ0i5AOnHjpDxNvuFglYh1WewcN02AsEKUaC0+?=
 =?us-ascii?Q?CP65JCwo+Q1so6ILsI0o8Y6YGw7jYJ+6ZgXaMse41R4jDdg+8sgtwzcp4sM+?=
 =?us-ascii?Q?QMBHN8CsY/7PvqD8Qq+43dTazKuL6nuYQRdUeZkAtMh+2riLToIfb6433YSX?=
 =?us-ascii?Q?Tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97182844-c4bb-45b1-d783-08db77ae3104
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 08:03:43.3299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otQqPrRZhPQ+9DZfAZnmmwcAZINnSunQFys6X8fbIqa0W9GIe9wO4M0E7c53OutEYkJdw+5V9ic/onTF0/oBqRJidTAAkQPnifA/JneVYsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engine
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Tejas,


> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 26 June 2023 15:47
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engine
> scheduler properties
>=20
> For each HW engine under GT we are adding defaults sysfs entry to list al=
l
> engine scheduler properties and its default values. So that it will be ea=
sier for
> user to fetch default values of these properties anytime to go back to de=
fault.
>=20
> For example,
> DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
> job_timeout_ms         preempt_timeout_us     timeslice_duration_us
>=20
> where,
> @job_timeout_ms: The time after which a job is removed from the
> scheduler.
> @preempt_timeout_us: How long to wait (in microseconds) for a
> preemption
>                      event to occur when submitting a new context.
> @timeslice_duration_us: Each context is scheduled for execution for the
>                         timeslice duration, before switching to the next
>                         context.
>=20
> V2 :
>    - Use sysfs_create_files in this patch - Niranjana
>    - Handle prototype error for xe_add_engine_defaults - CI hooks
>    - Remove unused member sysfs_hwe - Niranjana
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c          |  4 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 93 +++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
>  drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
>  drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  9 +++
>  7 files changed, 125 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_engine.c
> b/drivers/gpu/drm/xe/xe_engine.c index 6e6b2913f766..33d1fbae560d
> 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct
> xe_device *xe,
>  	INIT_LIST_HEAD(&e->multi_gt_link);
>=20
>  	/* FIXME: Wire up to configurable default value */
> -	e->sched_props.timeslice_us =3D 1 * 1000;
> -	e->sched_props.preempt_timeout_us =3D 640 * 1000;
> +	e->sched_props.timeslice_us =3D hwe->sched_props.timeslice_us;
> +	e->sched_props.preempt_timeout_us =3D
> +hwe->sched_props.preempt_timeout_us;
>=20
>  	if (xe_engine_is_parallel(e)) {
>  		e->parallel.composite_fence_ctx =3D
> dma_fence_context_alloc(1); diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 7528cc723699..43be5efc1865 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -12,6 +12,8 @@
>=20
>  #include "xe_gt.h"
>=20
IMO all these implementation should go to separate file for example somethi=
ng like
xe_engine_class_sysfs.c. It will be more cleaner.

> +int xe_add_engine_defaults(struct kobject *parent);
> +
>  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)  {
>  	kfree(kobj);
> @@ -32,22 +34,91 @@ static struct kobj_type kobj_xe_engine_type =3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops
>  };
>=20
> -static struct kobject *
> -kobj_xe_engine(struct kobject *parent, char *name)
> +static ssize_t job_timeout_default(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms); }
> +
> +static struct kobj_attribute job_timeout_def =3D __ATTR(job_timeout_ms,
> +0444, job_timeout_default, NULL);
> +
> +static ssize_t timeslice_default(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us); }
> +
> +static struct kobj_attribute timeslice_duration_def =3D
> +__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> +
> +static ssize_t preempt_timeout_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buf)
> +{
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
> +}
> +
> +static struct kobj_attribute preempt_timeout_def =3D
> +__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> +
> +static const struct attribute *defaults[] =3D {
> +	&job_timeout_def.attr,
> +	&timeslice_duration_def.attr,
> +	&preempt_timeout_def.attr,
> +	NULL
> +};
> +
> +int xe_add_engine_defaults(struct kobject *parent)
>  {
>  	struct kobject *kobj;
> +	int err =3D 0;
>=20
>  	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
>  	if (!kobj)
> -		return NULL;
> +		return -ENOMEM;
>=20
>  	kobject_init(kobj, &kobj_xe_engine_type);
> -	if (kobject_add(kobj, parent, "%s", name)) {
> +
> +	err =3D kobject_add(kobj, parent, "%s", ".defaults");
> +	if (err)
> +		goto err_object;
> +
> +	err =3D sysfs_create_files(kobj, defaults);
> +	if (err)
> +		goto err_object;
> +
> +	if (0) {
> +err_object:
>  		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	return err;
> +}
> +
> +static struct kobj_hwe *
> +kobj_xe_engine(struct kobject *parent, char *name) {
> +	struct kobj_hwe *khwe;
> +
> +	khwe =3D kzalloc(sizeof(*khwe), GFP_KERNEL);
> +	if (!khwe)
> +		return NULL;
return -ENOMEM here too.=20
> +
> +	kobject_init(&khwe->base, &kobj_xe_engine_type);
> +	if (kobject_add(&khwe->base, parent, "%s", name)) {
> +		kobject_put(&khwe->base);
>  		return NULL;
>  	}
>=20
> -	return kobj;
> +	return khwe;
>  }
>=20
>  int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +143,7 @@ int
> xe_gt_sysfs_engines(struct xe_gt *gt)
>=20
>  	for_each_hw_engine(hwe, gt, id) {
>  		char name[MAX_ENGINE_NAME_LEN];
> -		struct kobject *khwe;
> +		struct kobj_hwe *khwe;
>=20
>  		if ((hwe->class =3D=3D XE_ENGINE_CLASS_OTHER) ||
>  		    (hwe->class =3D=3D XE_ENGINE_CLASS_MAX)) @@ -109,6
> +180,16 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
>  			kobject_put(kobj);
>  			return -EINVAL;
>  		}
> +
> +		khwe->hwe =3D hwe;
> +		err =3D xe_add_engine_defaults(&khwe->base);
> +		if (err) {
> +			kobject_put(kobj);
> +			drm_warn(&gt_to_xe(gt)->drm,
> +				 "Warning: adding .defaults to engines
> failed!, err: %d\n",
> +				 err);
> +			return err;
> +		}
>  	}
>=20
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> index a531aebd10d6..a539cf031c7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> @@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
>  	return container_of(kobj, struct kobj_gt, base)->gt;  }
>=20
> +static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj) {
> +	return container_of(kobj, struct kobj_hwe, base)->hwe; }
> +
>  #endif /* _XE_GT_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> index d3bc6b83360f..d0a5eae1bbb4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> @@ -23,4 +23,17 @@ struct kobj_gt {
>  	struct xe_gt *gt;
>  };
>=20
> +/**
> + * struct kobj_hwe - A hwe's kobject struct that connects the kobject
> +and the
> + * hwe.
> + *
> + * When dealing with multiple hwe, this struct helps to understand
> +which hwe
> + * needs to be addressed on a given sysfs call.
> + */
> +struct kobj_hwe {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @hwe: A pointer to the hwe itself */
> +	struct xe_hw_engine *hwe;
> +};
>  #endif	/* _XE_GT_SYSFS_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 86c445903560..ecea38e9e639 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
>  	ge->engine =3D e;
>  	init_waitqueue_head(&ge->suspend_wait);
>=20
> -	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> MAX_SCHEDULE_TIMEOUT : HZ * 5;
> +	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> MAX_SCHEDULE_TIMEOUT :
> +		  e->hwe->sched_props.job_timeout_ms;
>  	err =3D drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> @@ -1136,6 +1137,8 @@ static int guc_engine_init(struct xe_engine *e)
>  			     gt_to_xe(e->gt)->drm.dev);
>  	if (err)
>  		goto err_free;
> +	/* Record timeout value, in order to show current set timeout */
> +	e->hwe->sched_props.job_timeout_ms =3D timeout;
>=20
>  	sched =3D &ge->sched;
>  	err =3D drm_sched_entity_init(&ge->entity,
> DRM_SCHED_PRIORITY_NORMAL, diff --git
> a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b7b02c96e998..bd94155a28b3 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
>  	hwe->name =3D info->name;
>  	hwe->fence_irq =3D &gt->fence_irq[info->class];
>  	hwe->engine_id =3D id;
> +	/* FIXME: Wire up to configurable default value */
> +	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> +	hwe->sched_props.timeslice_us =3D 1 * 1000;
> +	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> +	hwe->defaults =3D hwe->sched_props; /* Record default props */
>=20
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index d788e67312b9..7a8d275df6db 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -107,6 +107,15 @@ struct xe_hw_engine {
>  	void (*irq_handler)(struct xe_hw_engine *, u16);
>  	/** @engine_id: id  for this hw engine */
>  	enum xe_hw_engine_id engine_id;
> +	/** @sched_props: scheduling properties */
> +	struct {
> +		/** @set_job_timeout: Set job timeout in ms for engine */
> +		u32 job_timeout_ms;
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @preempt_timeout_us: preemption timeout in micro-
> seconds */
> +		u32 preempt_timeout_us;
> +	} sched_props, defaults;
>  };
>=20
>  /**
> --
> 2.25.1

