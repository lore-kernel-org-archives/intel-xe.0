Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84911C43602
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 16:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448A610E614;
	Wed,  8 Jul 2026 16:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvvg4VHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA2310E614
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783527511; x=1815063511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Ll03jeBIUl8wijg6711Ws3iy7Uu5cpplh+SmRyhsw4=;
 b=nvvg4VHYjSvmG2qbV80VHIB691WTApyVlL6cxD+36hK/B/Al6Sx/l5wt
 N3RtMQp6naRsqd7N+4qAKcLBvLrtjr7FPcIrR63xj0LHoEwQ9D+0iDaVB
 HVh5qU69BnCO5AnW8IoHXDPvXuS+Nyj4GV5FAV9nyeDzKnizl4Q94se/h
 c4HYF6rTgrcY1Cs0DnouBqksOdpRRgs5MdA2f34oMEgyjTKbJKuU/kbvX
 glCoheI4Zdhrr/ZLQxRjhtWJCg5OIiAtqPRkREK8x9FC52flDWPID4i16
 EB6w1hvzxyDPdFAOkQR9oXzJh3J4BpvCmNLdGENNLeNeXYBqEUv0HZoRw A==;
X-CSE-ConnectionGUID: QCwuJ1oCR2y/5tKd7AycLA==
X-CSE-MsgGUID: 8to+CHfESle7viwvAPXhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="106991525"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="106991525"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 09:18:30 -0700
X-CSE-ConnectionGUID: 5Ptoc/wxQSeLKPSiNqmTBw==
X-CSE-MsgGUID: VTFuz+l+TOeiXjVrjZ/O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="258629042"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 09:18:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 09:18:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 09:18:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 09:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZ/yh9naij/LWKb22ABKU+2hAGnehjlIUH+F5jrVq93x1sxDha3yz72NpZnmLNhHlZyF+T4yHuhUAj/FK8tYEc5trzFdWbKJ5Y9FLOL4qdMvYKVdumGhPWls6aXJzGBCt3MG1xRrUTHtlT06afttJbQYMUd0s8YDJ6qnw2duMaXZe8mXJRuknFDELlzWSAAuE7Pavt3MTRYFzDVb9yUv1OGoBVx7wtdJjwgy66MK0ueHL87GGOXwg+xw66GO/H5EP9Pgv1+5mnN76mhltoud3idQpmoIMBPe5LT45ZxL+oO9DQlprhy/LroKTFHVrz2jc88k3j6gaOJVg/re4rknPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvcuORsaJYZofH4ssrN0zlSuwKqGrNIOnIfIHdqPdAw=;
 b=IRSGgvy3JGVdizYqt/LnwsOEAr2OAw5sM79pOmr4gqm0Uex3yIHaeHl/YwJ86lLRMwnDwkUie+Ob3hV0uR8sAOzkJswHXCE7NDX0oZ7SyrwGkZy19KMQm3JaRblNr4dWcCd6xFPMEkfKsesVhfya1bqDRNwRwpm7SB5seVcxT/GQ6L6hxSLsxwFQ4H3rf/QGKbWMneEM9dsNaljgoGfxZS/S7oOa+QVUyXj/bTdKf7t9AO0ePl0ixdsz/nCfpVoIg28XtDJMD/WnBR3t3ZsD1HVZ8O1+oTeHtDzFizv75AJ/Aaytv3RTzjFOBEMpyqHcxjDBTx1rhtM0Ob7ilfwDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:18:27 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 16:18:27 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] drm/xe/configfs: Add disable_multi_queue attribute
Thread-Topic: [PATCH] drm/xe/configfs: Add disable_multi_queue attribute
Thread-Index: AQHdCZmYLSBYEz11b0ezeQ6mLvqU4LZjALaAgADL/cA=
Date: Wed, 8 Jul 2026 16:18:27 +0000
Message-ID: <DM4PR11MB54560AF13F7EE90B43E2F60EEAFF2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260701203805.3007798-1-shuicheng.lin@intel.com>
 <ak3EDcmH4KCEFP3a@nvishwa1-desk>
In-Reply-To: <ak3EDcmH4KCEFP3a@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CO1PR11MB4930:EE_
x-ms-office365-filtering-correlation-id: 1e394ccf-6806-411e-07bb-08dedd0c8ad3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|6133799003|56012099006|4143699003|11063799006|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: L4C3VG6E9xVVyvd11lq3pZopGqu2ePpod5GLMD8eRtJF3qRdrdMerLyF/WRFAW7LfCWMtpwbHCu4JeiSH0FVWfuEaAQZFSTFfGGTukaJjv0nfUEotloPI9AlVyokYd/bKxLMlD2C17VHsawT7u+hQJbHbJ0CFGE8PThiGFosQ0mcvTLPcqPqRAstZXq93EScKYhtAXardM7/bKP7jr5dJQ+HlyGileANFilcVhUpUQk52gM3AKCmG2uHo/MqTwjlCAPMAqRBDeiKmThnhgeEYqIiJc6JsimLVTW9y0QjzpaIsKAcVS+7eW1CRdfAt/eRZqs0Za5MGQ7H3f2K4oDeol2NwI1nMtYi1jLhfza44NhQKIWtzFjsIv5I5RfIFyYC9Y2K5/99CzllG7R1yyFfT/rxh1SsbHz62oxStJNy5+4sKmtXuS7v4P3XtNAwfqQNdxyQ6BiWYtXxNw7rgG4kfb6KYdt+G5196DAYwIde9TnH121OTAi3rglLpCMTLDDdLumpHqLsYe2JPpND870heJLBBxta6cZzY5++CcMP6fjH8BcyZO/rilzpC6SzHpfNlm7c9K4qQDXM89r/pniO8dQGPTH43qTIY7u98wMR56XPj07+/kRDWTR+ZExyGqOI2O75UYoiX5ackxZyTLWVUHHAQbc+gbGeqpCe54bO+vI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6GXcMfZ+w1Hkbzsn4hfpLEoRJxNUBxjNI9Fmrx/N9YsiYxIMIHgpKw/hltIN?=
 =?us-ascii?Q?wdA0ObZbVkOrdSRsqLyLI+5XZ63keakskU3U714mnc11o2VGKUShGpauVg72?=
 =?us-ascii?Q?rP46ZQh3SQODkxAYlkeU9+DsnC3PJuiXGQPRoBlPc6uNhUr3ASuJq8nhu3JU?=
 =?us-ascii?Q?qclGGZvuKU2h4qciwDuCSP7J5D9ddpMCMbu8uIsGSY7Pvbpo9o4455IswgYe?=
 =?us-ascii?Q?QJx1AZnLmILvzhPES7oBSkc0zkkoBrEFrKRgi0w9ntjIEjKMIAeb8RqdT6ca?=
 =?us-ascii?Q?9zprnI+0ZvL06u3JmX5dXBIdtjXa7fLwVjU45UhoCooQgoDtWM2taYpj9YTf?=
 =?us-ascii?Q?8+/i1aiZ8YlRxB/SOp5CjnitCmZBEUyHz92ETzrPvmAtB3CPedGCvFUEUkWl?=
 =?us-ascii?Q?/V90uFjmbAUzleK6ateA+Uxrp/8lMAh0ekCmgBs87LJbI580BIrD4amwg/S4?=
 =?us-ascii?Q?q76z/vHpX3aZz4zjUxwwhObMPPglfkqBMKHJTYNmvO5kpRTeVboACnOKecqL?=
 =?us-ascii?Q?2T6rp5gQxPykowPSQpAAPjH9LavLmucl4Mr+E3mH1zs0IIsZyIKRZnPf0Z59?=
 =?us-ascii?Q?JncOa3q90CuqDLCQqEq4HOV4spwpExro1b2s8tsnY7HcLlFphn0bAkylyBp2?=
 =?us-ascii?Q?lzDgYzvyg2koVwwEPPzqaa87EyxejwM/er89POONRTY/3maKlsfTG9UzhVWd?=
 =?us-ascii?Q?SM/AKwrL4TbobiQOIKX4IYwaL00OCz7Q7uH/tp7HlpogVfEnCYEUb9Tr+jJi?=
 =?us-ascii?Q?nKMUX21mMJvTgsGlRZlNMC+6ohLEBtiE9sni5kgsiNDY8zEARDcD7J0dDNVf?=
 =?us-ascii?Q?0FU6Hjt3ZDWNBJJK+nNdn5XKZz9H/XUlUMWLhgIUiuwYhr0wV381q4f6EAO3?=
 =?us-ascii?Q?Rz6Q0g32aVxnW8lwLk8odh+6sYlg82QJXQ1q8/8aM1iGwJzq5bSU8erz8BCX?=
 =?us-ascii?Q?lP529m1mQTMnNgRR+kdaz16goSmPhGq1cqo7a7lXc67p8BnEVm/mOfs49IXJ?=
 =?us-ascii?Q?CSJh8AhMNcOcfLP28ndUWIcRNiMo8h2FE7T175VFWqIc00yrT7K/phua3V0F?=
 =?us-ascii?Q?1KY6p/FkLB8hBKBB98edS9qoVev1+XHWbal/Yy7O1rzT5qc4jTHyhF7hWraU?=
 =?us-ascii?Q?aPJt6WCCnzPN9dwMV8kAzVzHbWy4NshsRdZZ5Dq3JPP9Z4hdIg3fiJrLTzy2?=
 =?us-ascii?Q?IjZB3X+/NkvPC64CO4s5KwPcKHG8anVGqSpV1lOhPe62VGyAz5t0Mso2qhwX?=
 =?us-ascii?Q?WtWONAb7WSSypiCrKHO+z69rBf1SdKOkqdpI31yknyHtdthr/US8HS9+dR2w?=
 =?us-ascii?Q?aYUU+rgoDc4h+5PfjWPU+LNZMdece0tdcJRnzajtDk1G+QyWfxa8UhYcOguw?=
 =?us-ascii?Q?L28bDAebN+ZD4Q+LhQnUyRt6eR0v9xwbP0X9uAL1bgglq7m0NE3wMi0JPJvj?=
 =?us-ascii?Q?zal0slDkZpaeYbwJxG+vg+FbOrq+ITLhlaSW2YW/fCzJ8XQK9cnoAkPUMtMj?=
 =?us-ascii?Q?nZjC0hxa0jiRbQm2qW5HFrmPQKeVi7oFcyeyOI6LlWE3bC6IYZIgJ1UmWjn+?=
 =?us-ascii?Q?jZR2KAJw4kA62lHe5ONNAKIB+YW0+t082P/HCbhSeQUbgXU/FTAUB0V4xazK?=
 =?us-ascii?Q?mji+My9TDTfsZbtyRs4npTZ5TLMlwJ/1lo/FyWB/pi1pa55FYJJcFFh0TcUa?=
 =?us-ascii?Q?kEEl8KOrDRqQZbTzG+k5Kz+Lgv0f7YClKRZtgTKTLtZ02jqzILDdvCZ8WmSA?=
 =?us-ascii?Q?vIV934Zt9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aSyBKNuZm2ujGmdoqvukTaqUG2fdhmQOZOre8/83+OMg0qdFxea/db0kk5KV2ZRMS3108vwTPNMIzOvujVhAxZ/7SB0M3xq1iRBloFUs4JiAiroDcVBIY9KEieRBPy5ZPyiCFKQ3uKS2r0Bn4ZVmGyJNAVz8R6sT7XI1npchdbVxnJGUisnFDOUaQuc2Jd7TjeKLkSKwetB/ivACqZtHhdtQfPY9H/YGgi74HgEcwaOUNWa5Ml1sGNvlw/G27jsfDEkEE/Sxnawr8tZxPN9VESl4XuCUKjhgjCfFJUySkrdEx7MqK2mxuy2gGcMny5dGx8WGHQ4RS/PGv5qlqXnDig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e394ccf-6806-411e-07bb-08dedd0c8ad3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 16:18:27.1330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TvCHIw+cdwGL7F6UYTJHw+QcnkGXfuYVcBdoKwCJqO07XGVs4ZjsnswY3prF3TBd3c4p/mePv223kZLaIUfg+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
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

On Tue, Jul 7, 2026 8:29 PM Niranjana Vishwanathapura wrote:=20
> On Wed, Jul 01, 2026 at 08:38:05PM +0000, Shuicheng Lin wrote:
> >Add a new configfs boolean attribute 'disable_multi_queue' that lets an
> >administrator force-disable multi-queue support on a device before it
> >binds to the driver. This is intended for debugging and for validating
> >non-multi-queue code paths on hardware that would otherwise expose
> >multi-queue.
> >
> >The hook disables multi-queue at two levels:
> >
> >- UAPI: In alloc_primary_gt(), clear
> >  gt->info.multi_queue_engine_class_mask on the primary GT so that
> >  xe_gt_supports_multi_queue() returns false and attempts to create
> >  a multi-queue group via
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP
> >  are rejected.
> >
> >- GuC: In guc_ctl_feature_flags(), set the GUC_CTL_DISABLE_MULTI_QUEUE
> >  (BIT(24)) init-params bit on GuC firmware older than 70.66. On GuC
> >  firmware 70.66 and above, guc_waklv_init() emits the new
> >  GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE Feature KLV (0x5001) via the
> ADS
> >  WA/Feature KLV buffer instead. Feature KLVs share the WA KLV buffer.
>=20
> Looks like we are not at guc firmware version 70.66 yet. I am not sure ab=
out
> coding for future guc firmware releases. Probably fine if the firmware ha=
s been
> already released to the public and just that we are not upgraded to it he=
re.

Yes. The guc firmware upgrade is on the way: https://patchwork.freedesktop.=
org/patch/738414/?series=3D169961&rev=3D2

>=20
> >
> >The attribute is rejected after the device has been bound, so it only
> >takes effect during probe:
> >
> >	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
> >	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
> >
> >Assisted-by: Claude:claude-opus-4.7
> >Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >---
> >Cc: Stuart Summers <stuart.summers@intel.com>
> >Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> >---
> > drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  3 +-
> > drivers/gpu/drm/xe/xe_configfs.c      | 63
> +++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_configfs.h      |  2 +
> > drivers/gpu/drm/xe/xe_guc.c           |  8 ++++
> > drivers/gpu/drm/xe/xe_guc_ads.c       | 14 ++++++
> > drivers/gpu/drm/xe/xe_guc_fwif.h      |  1 +
> > drivers/gpu/drm/xe/xe_pci.c           |  2 +
> > 7 files changed, 92 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> >b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> >index 644f5a4226d7..998272a007e5 100644
> >--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> >+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> >@@ -491,9 +491,10 @@ enum  {
> > #define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MIN_LEN
> 	1u
> > #define
> GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN
> 	GUC_MAX_SCHED_GROUPS
> > /*
> >- * Workaround keys:
> >+ * Feature and Workaround keys:
> >  */
> > enum xe_guc_klv_ids {
> >+	GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE
> 			=3D 0x5001,
> >
> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOC
> KED				=3D 0x9002,
> >
> 	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTR
> Y_RESTORE_AT_EXIT		=3D 0x9004,
> > 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING
> 				=3D 0x9005,
> >diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> >b/drivers/gpu/drm/xe/xe_configfs.c
> >index 32102600a148..cd94f0d80edd 100644
> >--- a/drivers/gpu/drm/xe/xe_configfs.c
> >+++ b/drivers/gpu/drm/xe/xe_configfs.c
> >@@ -237,6 +237,16 @@
> >  *
> >  * This setting only takes effect when probing the device.
> >  *
> >+ * Disable multi-queue
> >+ * -------------------
> >+ *
> >+ * Disable multi-queue support on the device. Multi-queue exec-queue
> >+ * group creation via ioctl is refused, and the GuC feature is disabled=
.
> >+ *
> >+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
> >+ *
> >+ * This attribute can only be set before binding to the device.
> >+ *
> >  * Remove devices
> >  * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  *
> >@@ -262,6 +272,7 @@ struct xe_config_group_device {
> > 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > 		bool survivability_mode;
> > 		bool enable_psmi;
> >+		bool disable_multi_queue;
>=20
> Why not just name it enable_multi_queue and have it enabled by default?
> Looks like that is the generally followed convention.

The enable_* convention fits when a feature is off by default in the driver=
 and userspace opts in (e.g. enable_psmi).
Multi-queue is a platform HW capability. It is on by default where hardware=
 supports it.=20
This attribute is a force-off override for debugging, so disable_* with def=
ault false matches the semantic.
Also,  enable_* will be misleading for platform that doesn't support multi-=
queue.
I'd prefer to keep disable_multi_queue.
What is your idea about it?

>=20
> > 		struct {
> > 			unsigned int max_vfs;
> > 			bool admin_only_pf;
> >@@ -281,6 +292,7 @@ static const struct xe_config_device device_defaults
> =3D {
> > 	.engines_allowed =3D U64_MAX,
> > 	.survivability_mode =3D false,
> > 	.enable_psmi =3D false,
> >+	.disable_multi_queue =3D false,
> > 	.sriov =3D {
> > 		.max_vfs =3D XE_DEFAULT_MAX_VFS,
> > 		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF, @@ -575,6
> +587,33 @@
> >static ssize_t enable_psmi_store(struct config_item *item, const char *p=
age,
> siz
> > 	return len;
> > }
> >
> >+static ssize_t disable_multi_queue_show(struct config_item *item, char
> >+*page) {
> >+	struct xe_config_device *dev =3D to_xe_config_device(item);
> >+
> >+	return sprintf(page, "%d\n", dev->disable_multi_queue); }
> >+
> >+static ssize_t disable_multi_queue_store(struct config_item *item, cons=
t
> char *page,
> >+					 size_t len)
> >+{
> >+	struct xe_config_group_device *dev =3D
> to_xe_config_group_device(item);
> >+	bool val;
> >+	int ret;
> >+
> >+	ret =3D kstrtobool(page, &val);
> >+	if (ret)
> >+		return ret;
> >+
> >+	guard(mutex)(&dev->lock);
> >+	if (is_bound(dev))
> >+		return -EBUSY;
> >+
> >+	dev->config.disable_multi_queue =3D val;
> >+
> >+	return len;
> >+}
> >+
> > static bool wa_bb_read_advance(bool dereference, char **p,
> > 			       const char *append, size_t len,
> > 			       size_t *max_size)
> >@@ -812,6 +851,7 @@ static ssize_t ctx_restore_post_bb_store(struct
> >config_item *item,
> >
> > CONFIGFS_ATTR(, ctx_restore_mid_bb);
> > CONFIGFS_ATTR(, ctx_restore_post_bb);
> >+CONFIGFS_ATTR(, disable_multi_queue);
> > CONFIGFS_ATTR(, enable_psmi);
> > CONFIGFS_ATTR(, engines_allowed);
> > CONFIGFS_ATTR(, gt_types_allowed);
> >@@ -820,6 +860,7 @@ CONFIGFS_ATTR(, survivability_mode);  static struct
> >configfs_attribute *xe_config_device_attrs[] =3D {
> > 	&attr_ctx_restore_mid_bb,
> > 	&attr_ctx_restore_post_bb,
> >+	&attr_disable_multi_queue,
> > 	&attr_enable_psmi,
> > 	&attr_engines_allowed,
> > 	&attr_gt_types_allowed,
> >@@ -1098,6 +1139,7 @@ static void dump_custom_dev_config(struct
> pci_dev *pdev,
> > 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> > 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> > 	PRI_CUSTOM_ATTR("%d", enable_psmi);
> >+	PRI_CUSTOM_ATTR("%d", disable_multi_queue);
> > 	PRI_CUSTOM_ATTR("%d", survivability_mode);
> > 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
> >
> >@@ -1225,6 +1267,27 @@ bool xe_configfs_get_psmi_enabled(struct
> pci_dev *pdev)
> > 	return ret;
> > }
> >
> >+/**
> >+ * xe_configfs_get_disable_multi_queue - get configfs
> >+disable_multi_queue setting
> >+ * @pdev: pci device
> >+ *
> >+ * Return: true if multi-queue should be disabled for this device,
> >+false
> >+ * otherwise.
> >+ */
> >+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev) {
> >+	struct xe_config_group_device *dev =3D
> find_xe_config_group_device(pdev);
> >+	bool ret;
> >+
> >+	if (!dev)
> >+		return false;
> >+
> >+	ret =3D dev->config.disable_multi_queue;
> >+	config_group_put(&dev->group);
> >+
> >+	return ret;
> >+}
> >+
> > /**
> >  * xe_configfs_get_ctx_restore_mid_bb - get configfs
> >ctx_restore_mid_bb setting
> >  * @pdev: pci device
> >diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> >b/drivers/gpu/drm/xe/xe_configfs.h
> >index 07d62bf0c152..d41f52bd66b7 100644
> >--- a/drivers/gpu/drm/xe/xe_configfs.h
> >+++ b/drivers/gpu/drm/xe/xe_configfs.h
> >@@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev
> >*pdev);  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> > u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);  bool
> >xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> >+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev);
> > u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > 				       enum xe_engine_class class,
> > 				       const u32 **cs);
> >@@ -42,6 +43,7 @@ static inline bool
> >xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return  static
> >inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return
> >true; }  static inline u64 xe_configfs_get_engines_allowed(struct
> >pci_dev *pdev) { return U64_MAX; }  static inline bool
> >xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> >+static inline bool xe_configfs_get_disable_multi_queue(struct pci_dev
> >+*pdev) { return false; }
> > static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pd=
ev,
> > 						     enum xe_engine_class
> class,
> > 						     const u32 **cs) { return 0; }
> diff --git
> >a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c index
> >4023700ff2a9..cdd096a37e05 100644
> >--- a/drivers/gpu/drm/xe/xe_guc.c
> >+++ b/drivers/gpu/drm/xe/xe_guc.c
> >@@ -101,6 +101,14 @@ static u32 guc_ctl_feature_flags(struct xe_guc
> *guc)
> > 	if (xe_device_is_l2_flush_optimized(xe) &&
> xe_gt_is_media_type(guc_to_gt(guc)))
> > 		flags |=3D GUC_CTL_ENABLE_L2FLUSH_OPT;
> >
> >+	/*
> >+	 * On GuC firmware 70.66 and above, the
> GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE
> >+	 * Feature KLV is used instead.
> >+	 */
> >+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev))
> &&
> >+	    !GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 66))
> >+		flags |=3D GUC_CTL_DISABLE_MULTI_QUEUE;
> >+
> > 	return flags;
> > }
> >
> >diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> >b/drivers/gpu/drm/xe/xe_guc_ads.c index c98454545a85..898ec2c6f015
> >100644
> >--- a/drivers/gpu/drm/xe/xe_guc_ads.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> >@@ -16,6 +16,7 @@
> > #include "regs/xe_gt_regs.h"
> > #include "regs/xe_guc_regs.h"
> > #include "xe_bo.h"
> >+#include "xe_configfs.h"
> > #include "xe_gt.h"
> > #include "xe_gt_ccs_mode.h"
> > #include "xe_gt_mcr.h"
> >@@ -364,6 +365,19 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> > 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> >
> GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
> >
> >+	/*
> >+	 * On GuC firmware 70.66 and above, use the Feature KLV (shared
> with the
> >+	 * WA KLV buffer); older firmware uses
> GUC_CTL_DISABLE_MULTI_QUEUE in
> >+	 * the init params instead.
> >+	 */
> >+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(gt_to_xe(gt)-
> >drm.dev)) &&
> >+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 66)) {
> >+		u32 data =3D 1;
> >+
> >+		guc_waklv_enable(ads, &data, 1, &offset, &remain,
> >+
> GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
> >+	}
> >+
> > 	size =3D guc_ads_waklv_size(ads) - remain;
> > 	if (!size)
> > 		return;
> >diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> >b/drivers/gpu/drm/xe/xe_guc_fwif.h
> >index 3fbda4798cff..971b850f2136 100644
> >--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> >+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> >@@ -68,6 +68,7 @@ struct guc_update_exec_queue_policy {
> > #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
> > #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> > #define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
> >+#define   GUC_CTL_DISABLE_MULTI_QUEUE	BIT(24)
> >
> > #define GUC_CTL_DEBUG			3
> > #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
> >diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >index 03362480e3e0..23ef2c7b6bce 100644
> >--- a/drivers/gpu/drm/xe/xe_pci.c
> >+++ b/drivers/gpu/drm/xe/xe_pci.c
> >@@ -862,6 +862,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile
> *tile,
> > 	gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
> > 	gt->info.has_indirect_ring_state =3D graphics_desc-
> >has_indirect_ring_state;
> > 	gt->info.multi_queue_engine_class_mask =3D
> >graphics_desc->multi_queue_engine_class_mask;
> >+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev)))
> >+		gt->info.multi_queue_engine_class_mask =3D 0;
>=20
> May be add a print statement here like "disabled via configfs" similar to=
 one in
> check_sw_disable() in xe_hw_engine.c?

Let me add it:
" xe_info(xe, "Multi-queue disabled via configfs\n"); "

Shuicheng

>=20
> Niranjana
>=20
> > 	gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
> > 	gt->info.num_geometry_xecore_fuse_regs =3D graphics_desc-
> >num_geometry_xecore_fuse_regs;
> > 	gt->info.num_compute_xecore_fuse_regs =3D
> >graphics_desc->num_compute_xecore_fuse_regs;
> >--
> >2.43.0
> >
