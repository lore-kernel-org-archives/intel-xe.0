Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62860CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 22:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F4E10E13F;
	Mon, 15 Sep 2025 22:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSr0+5ih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EB810E13F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 22:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757976374; x=1789512374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fpvJ1JaGe1eiGw2JZsxscitt1aSVofzMsR2WmuI9r28=;
 b=gSr0+5ihiP/cdF/Cmq9GkulLNSjoC0KK20JZgTkUKsxNR2Cku3nFYZck
 4yikdUbXDEfYzEvqq9wCL22bvIb+Zrc/YKYBnaOL2ngA/qn5f2n71CWzD
 SUTg+OEoReo29MfCT2WPN+wLYZOT1EGn7Ck8yOpaVuDkk04pajbJKUXYn
 zlRUTbksrUGGiMl5VOJ7KKJITf/rQt34S7q9sUxcScsXqCEm8tTWiI9YU
 fMe2HfHFdPViYxbsEJVfJ6s+GZxRYJzDGnNCUuUTh7RKEQuynQPSbXhlj
 FiCmXffJJoS3U48fjX6K2bH//dfmyhTrZZBdeCsZgkg38mAtpra/qYCLh g==;
X-CSE-ConnectionGUID: MICkOEmjRXWmcCSi9IiaQg==
X-CSE-MsgGUID: X3seXR/LSBi168sDcYe2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59943539"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="59943539"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 15:46:13 -0700
X-CSE-ConnectionGUID: qOLWb5hTQjeCkt/1B+1B0g==
X-CSE-MsgGUID: 9hofnRxHRTSovl7f720p5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="174382935"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 15:46:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 15:46:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 15:46:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 15:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmFVdI6IBMQY5EudxTQsJNPOZ3iHbxTcicIuiwFT7M47n7xN6fueQSclonz/Qacj83qaAe1N28a0OgPGDSMegQY08+0CZQAc2X5jcZs2uDVds01rwTFlvtVTEfd0MbVBIQvFTk/2V7KQUpFkq3yr0OBVc5bu1gE9rrsF5xiScPqRiERPr4fkBUxtXzzOFYUsXBuQf1GiTGhoh4MK3j5JNysoxE1TIKBDmFsxWiTexrFCr1QYdJ2wt+hnYiNxAasIZNKscgCyllWQ19DitJzfo33nsZtFfFvl52+QgwtjHl3xmpwSsMZkXM/FJsf4cFJVPDWr10z9XhbFHpYtLLMEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vDNdU+RLD0gchaN8JD3OWZy+QlvMMx/g2B/IgT20oI=;
 b=BDfn7pm8/LsJLhteA1MGw1pKHJB5seBHLe7wrySfdmZoJgbXhiePaS9MOc9xlqvh07lDoPYJSirLVC9dgk2PyMZBIhK4mV6eLLfytfnV0jRFa2MiQzsyHQvuBS0848chEybH3J9npsC/9sD445uRi7etXeG8FaLQtt8hlA0xB8C2kqOEYgwZ91uhsulyEsSSYNK6RrwcX9BABERg7B5waQTOv2uHejMB0w197wjjrY6u/gZ4iR71Zd9jg4akxeHYuCrXKWGiiCnL/VTlQ6UFHP/ztpBd4NhfbbQda6mehRoUdP3QVLQIa1bQCCsLqfddM1mozOi+qwmryBEP6Z/yaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 22:46:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 22:46:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v3 2/2] drm/xe/xe_device_sysfs: Remove sysfs
 unconditionally while clean sysfs entries
Thread-Topic: [PATCH v3 2/2] drm/xe/xe_device_sysfs: Remove sysfs
 unconditionally while clean sysfs entries
Thread-Index: AQHcJopwfSJY8BrVSkOQTPJgsNF8XLSU1O8g
Date: Mon, 15 Sep 2025 22:46:08 +0000
Message-ID: <DM4PR11MB5456147BDF6F6E1DDFA97E22EA15A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
 <20250915214716.1327379-3-zongyao.bai@intel.com>
In-Reply-To: <20250915214716.1327379-3-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB6881:EE_
x-ms-office365-filtering-correlation-id: 5d2d233c-d96b-4cc6-54c6-08ddf4a9a990
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?OeQ9N+vwQluHnOYydjAWunV5AZH3IfAZ5Jzl/ayzfG7IrXNYLhvZKMdDmzn7?=
 =?us-ascii?Q?L0r25Jko6jjjBCwJAOPs6/unlByfz4femK+BHHhhp4URbyUYcydpAOOvPD+s?=
 =?us-ascii?Q?1tyB7lcIi3KZxQ04FiOZ9NiSxAvf6PetIzhc+w4WQkb8MrKnEGj9qQR5xX2+?=
 =?us-ascii?Q?h49+PD8Q6XGQMY7Du/f3Oid8po+AuIuYWNA6VmsvoXH+Z/n0aTmeI/TJagzu?=
 =?us-ascii?Q?xLHCvFW6cDIbhmeFznZX5zK15rWUk7KllvhHLxnbJ4pL9jOZJA7yuA5NndHy?=
 =?us-ascii?Q?P5mw0oPO9ijGLc4KrfxRxH44r7V47aoS4hxnknuKvYKIRNZyvDgPO6IC0lAa?=
 =?us-ascii?Q?cpU3d6+WaxWkIGar4f7NjAAWJyGf+IDfBHl+Bg9XjjssWxDnEXXJMsOJRQZa?=
 =?us-ascii?Q?3ppx0ozbhq4n2OcLXsmCiwUXk12/Pyn4pvq9feljCs55TTYtQYbZFiMGzUvh?=
 =?us-ascii?Q?IzGIqlB0dquVP6nUpYbDIJL8ibRo0J+WkaNh0Jogo3R92dhHtuKkcjwHH+rY?=
 =?us-ascii?Q?UBrPr81ymd/53XSxMF6k7h3g6abILY2rmxnekqzQj54UCgslNuvbGAiWhCXF?=
 =?us-ascii?Q?mHzTokImYW8hjAB4h9D0YfE9jC5qPJPmKmPpajQ7Q4JEZxD64y/118hQdrbU?=
 =?us-ascii?Q?szpIAOL9C/826ZV0Y0ffFFtaN2HMQHGpIjjTL/pvkhsgStFS6NOUCWV/5LYf?=
 =?us-ascii?Q?Wu2RW4bJosFGsc+Eqbp5u9kk23xjD5IrKBnbPQ86RZcqt1sJqZivrKNNQrDL?=
 =?us-ascii?Q?592dZmwpkTLEyQIrI3P5gvNAPC1Iu6NYmnTdsb+jCoXc6MQbQZp7jjiiJc0r?=
 =?us-ascii?Q?4CxTDTYBKupcZSgcUJUYZvS8ZVap6ByS57aRSbw0lDXWcZ6iO2A+ohta2bAC?=
 =?us-ascii?Q?y9RPURBvv35KedgvuhzvWPLlzKH/XNPkFj+TnzdaYNRaDKB/NoqTk5szSCKM?=
 =?us-ascii?Q?/bpj9PtHSd3ZpjIOpYDrQdm6596EuNY0tscts1tVVVC+TZQ3KP2h+JL2fcX1?=
 =?us-ascii?Q?d4R1zmYUdYsGpPq/nv1ATTJZyM+BgpVdEMQWe2bIXp9lGsyZ5ZvJNlK6y2J2?=
 =?us-ascii?Q?pNs7CR5RWUXoiEVOBSwn1jvfXrcX6v8VZma96wnhJqioeFAcOXMbplvf4DLH?=
 =?us-ascii?Q?5MTjh8yW54Fy6+VaNsZqjF5wgFJuK6cyY8AEbZWPHraTbbKsZDvbqOy/XO+1?=
 =?us-ascii?Q?zZXyGNozjsyMfI8T7TM48Re2vYtNUx2IIoKJjxxSvTadumOGhmu6y1xJanZ0?=
 =?us-ascii?Q?34UgfpNKW54JjCEvZdEdl1eThgMdApZvbpGE+VBnFy8bXE+wNvqsLqTSXB0K?=
 =?us-ascii?Q?L5MMUOBCU5PAVUypo/RjcjjVXMFBiJY5UzsGnDdo3/spVGAHXeZq8Y1k/IQG?=
 =?us-ascii?Q?1v5MFdevPhFuEZvvm2kmv5rqUTqB8sI959kMl0RG3YgHQy+T+dR2bQidRK8q?=
 =?us-ascii?Q?QIRoViAr5PMsXkc/mOnx/zPcJ78IliMZA7SakwIxuoU429SUeh7IZ3sbg+DV?=
 =?us-ascii?Q?2jir0fHSicl0ZW8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IoBE52H5UmZbQHGghD4AJFdo4kydutMgBn+38u8EWCjHOTd/B6NqAcSCsiMW?=
 =?us-ascii?Q?0hrBVxkldiTh3L6SMxdSobfA9FLlEPyGaW0sozEdHnrU28coXJcfsuGtXQ1q?=
 =?us-ascii?Q?ZR9lTj8I88s4YmRAcgHvMNdvO/+m4vrXV4x2J6eFkqoXKLGD5A+07OwsSoWE?=
 =?us-ascii?Q?eiHBvZqDStIk2ESqyzEeN/i3w3DzwdaddjpWYN2/0pp0F1JJUkoqGtahXo5m?=
 =?us-ascii?Q?rUuuaGC2PuenFEEkLU0gMK5AfDXd3RH8mYX1ncKuTP7VI6UiF4MJOF5X9KDa?=
 =?us-ascii?Q?31u98lozsL0wLlgL1+L2mSddAyJHiQlliMbB1lMkytJGM6WPNFPDp7/XeR4n?=
 =?us-ascii?Q?kaLJdSbWXetNKXC4EOTzPLAo7awKk5XKNx3EcCaAH3kogn8gi6s+NPtVeu9p?=
 =?us-ascii?Q?rWQ8LcGIKHZA6Wo0nj/e5EO8wqpVFhgmgQOMbScDJuEUysf9Nn1bWBJweZLp?=
 =?us-ascii?Q?Cpr4SQEkuTXrDIJ0ob0lz8rnvRXRmAQtmKBoxMg1aZWLmb2ohm8e1dUcTxkz?=
 =?us-ascii?Q?wGlWL+F9eL+fMwXwMw6whoDFMMFLefgCY/YLmUdOQuDKQ6GZAqQfY2kBnsYi?=
 =?us-ascii?Q?DUPkb13KtAW8ZY8tkOeiZLR6nQ4F2MFexmVk5j5/Uv81C8iiInJpJZbmhgwb?=
 =?us-ascii?Q?JDnCvp7X7FU36KOQcghZYLQ2jCKuS8ShLVXBvSkVWWSh0X0GW5jz9YK4Bzte?=
 =?us-ascii?Q?ToFzludKkQ0ufLOneNi2wz2giFz2HqT29RlI/k24+UyS7xh9K48ycyDkZu/p?=
 =?us-ascii?Q?M8eLVQIVAXQGBCQW0h3/sN/3m83Wm/HaFVzEEyOpjGLFWK82r62PhCrTY6N4?=
 =?us-ascii?Q?h9FxVui84xsN50OxTyyGuJm+bQrGJJfdIvt0rFCuBMREaamgRopfe24Rl14O?=
 =?us-ascii?Q?BvL4U4V3sYxEpWelLOUzhk0YF478wc+Mr+51UktWZJR4HbgPExCon6W6gUfe?=
 =?us-ascii?Q?KPNzJrVqN5yyEeMw8DuhCOpuQ4a4whLvTUiDmYpcjhBJquQeQ5WfnPtXA2gL?=
 =?us-ascii?Q?aO4FZ8A8G3+O00Elzncd3vmvHNmOYE34piSKLitdpaItYsftuHB0fZAtrSw7?=
 =?us-ascii?Q?JMNE70is5zCHdbTjlxp8LdRUxU2kaQzdTJahDW6F7KxxN7YpKCpeD4H+MztU?=
 =?us-ascii?Q?r7f1jXBBo3EvRjK9Unbryj/J2VGIVCjz/WkJFvSlZon5bUvGvfo7b2P2/c50?=
 =?us-ascii?Q?gHf4ebEfU4avN0+NjvIOHW0LbH00BNGT+BH04yFnDzCU5LpqH0sdCIJQ+uJV?=
 =?us-ascii?Q?r+s+zhQfHKx8WPUhO4US2xb2TYe3vnsadR50ALDzXSAQuk3g4RrmSa5ev3Js?=
 =?us-ascii?Q?euAfzfOR6SDiW+n7na4K2zgnit53DpjZN3b8Elf/uyfmcGvi/oEytyOP37Bd?=
 =?us-ascii?Q?+aLz8dt5YaJpPXiteOlSuwcqtzuu/Uf/gALgJVpqTg/exq3CcmiHQy6oYbo+?=
 =?us-ascii?Q?v2yJLDNerLxysMfA0LnropUOMkbGJTrjHB7sbD0HtD3wtPL7Aawv1rAnc5oe?=
 =?us-ascii?Q?JKaQuK6zTAGL1EvbrbaA3d36R/zZzsdyIwd08LhNw/3CuF0MCF5FEPQ3zscT?=
 =?us-ascii?Q?7u8i6Cq4ACETFWqSTo70GllIq8r6J54/4HJtZCBH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2d233c-d96b-4cc6-54c6-08ddf4a9a990
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 22:46:08.7574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ga0S+0jPLzKTcrnt/x9+/EK7CyQEocpKZy0Q5eRDqripQBjaNNl4OGQQFw7diRWjhWQzEK1KqSTg3ZhSU2PmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

On Mon, Sep 15, 2025 2:47 PM Zongyao Bai wrote:
> xe_device_sysfs_fini() and late_bind_remove_files():
>   Adjust the remove order of sysfs entries to follow LIFO.
>   Remove configuration and status checking,
>   call the sysfs removal unconditionally.
>=20
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 32 ++++++----------------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index e5e3c56ea53c..693bfda1cfa6 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -184,25 +184,8 @@ static int late_bind_create_files(struct device *dev=
)
>=20
>  static void late_bind_remove_files(struct device *dev)  {
> -	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> -	struct xe_tile *root =3D xe_device_get_root_tile(xe);
> -	u32 cap =3D 0;
> -	int ret;
> -
> -	xe_pm_runtime_get(xe);
> -
> -	ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING,
> GET_CAPABILITY_STATUS, 0),
> -			    &cap, NULL);
> -	if (ret)
> -		goto out;
> -
> -	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
> -		sysfs_remove_file(&dev->kobj,
> &dev_attr_lb_fan_control_version.attr);
> -
> -	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
> -		sysfs_remove_file(&dev->kobj,
> &dev_attr_lb_voltage_regulator_version.attr);
> -out:
> -	xe_pm_runtime_put(xe);
> +	sysfs_remove_file(&dev->kobj,
> &dev_attr_lb_voltage_regulator_version.attr);
> +	sysfs_remove_file(&dev->kobj,
> &dev_attr_lb_fan_control_version.attr);
>  }
>=20
>  /**
> @@ -287,14 +270,11 @@ static const struct attribute
> *auto_link_downgrade_attrs[] =3D {  static void xe_device_sysfs_fini(void=
 *arg)  {
>  	struct xe_device *xe =3D arg;
> +	struct device *dev =3D xe->drm.dev;
>=20
> -	if (xe->d3cold.capable)
> -		sysfs_remove_file(&xe->drm.dev->kobj,
> &dev_attr_vram_d3cold_threshold.attr);
> -
> -	if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
> -		sysfs_remove_files(&xe->drm.dev->kobj,
> auto_link_downgrade_attrs);
> -		late_bind_remove_files(xe->drm.dev);
> -	}
> +    late_bind_remove_files(dev);
> +    sysfs_remove_files(&dev->kobj, auto_link_downgrade_attrs);
> +    sysfs_remove_file(&dev->kobj,
> + &dev_attr_vram_d3cold_threshold.attr);

It seems there is alignment problem here. Maybe due to tab is replaced with=
 space?
With this fix, LGTM.

Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  }
>=20
>  int xe_device_sysfs_init(struct xe_device *xe)
> --
> 2.34.1

