Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F39C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 07:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925FB10FB9F;
	Thu, 25 Apr 2024 07:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKKHOta3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FB910F5EE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714029254; x=1745565254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g5T40XKGd/RmaipD2exVr8ew58qZIq/cVHziepClNE0=;
 b=WKKHOta3rhMkoU0Agzv1u4sY8ZYfa7lPmh9O0gHsInOyEV90mUcSfO1F
 9EFR7R6XSYYCE36Tq27fFXqwO/OR6LBvicJau/Nyr7/L8lEpzwLkkkSKh
 ruBjTXKa5OX2LDBcOVeIcwd0GTDraCYKUxJ4xir4PbD0v+3Kfxb96XL/2
 x+xldYZLh8uKmzzRjooKv5Wj9B1I1NydaFcCxrzJ7cRJl/3P95NQ52l9m
 5qpvUyHl/ZxLhMnerWYANHZcMjoIwiMt2W6kh0uho5SV6Ud+vbK6YUD98
 zxHofVJhyGVobivTcuQlMBLbyqJHNKBNgA5sf+UpmNs5QBn7JDWIk0x6O A==;
X-CSE-ConnectionGUID: DHbRxq7XSbaHbaSfyi4JzQ==
X-CSE-MsgGUID: W11Iw9AwQ0mtar3TwGg7VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9914161"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9914161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:14:05 -0700
X-CSE-ConnectionGUID: ln9CON8/REW3YnEH/HgXtQ==
X-CSE-MsgGUID: A+67XNogQOuV/fGjk4rcFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="25064054"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 00:13:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:13:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:13:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 00:13:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 00:13:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFeCfpWpYZ5MaIPp4OgkMFncFJJZzG1ne8ItyniKxCpmiIrhM5Ym/hI6eq5HLh8M7wUkq7e3m200M4IHcdhGiwiTd4FmAtnT5yEZ8rHzDnX8xbGX/dzK19fU3YyrLAagicE1Z/MVvMA8Vabqw5gXig3aSaAAa8WGv63nKYAeZu31CJG8XHn0NwVfrfLJfVY9U4nrsS0+t/fJIqWu/sd8dOpBRoPFEzn311LBrXLUvC6SLnFCqJ8Arsy6m3E+uz0Mnkl7bdKsqM5JG52hmD5Ge6qPDjEJM5kc7JYuZRDBJ16/8OLEOqrm5j0EwCqjmSEDNFO64ImoU5E8+PFCTJbFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FReIVIYu9nhxe45SjUQw4kvsPVbCYRopiLRh+ERQd5c=;
 b=mz5NNwhUu6Mt0Yx8/vs5uZ+VdecmPqn2bas38kAyBKdT+VDYoDqd3WluzfNwA0/b7cXKRxZfu6BcB8z7+zJh65MHUfdCx5dWYx/bKVih3Y/A+datqhendvKOPaY7rcOF4s/sqcP+w4uPc59OVH6M6Ti1Qwi6tgbmSJe1R69GMCU29nQ0x0mv5jla83h0TOYGCTwgYK5RswimIY/yUVkMYVbqGYHZlLIzzVJpVJ1lGQnqxs/0A74lv9601rPkeZNP4KhKPiK338OwRgQi4KDpLJTFyWoYiIZr1BA8+Ssa1KfWtr3JIJndUMUmxJGwDdcECx303RXD+FKvZHvuhbi0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 07:13:45 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:13:45 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 5/5] drm/xe: Replace engine references with exec queue
 in xe_guc_submit.c
Thread-Topic: [PATCH v2 5/5] drm/xe: Replace engine references with exec queue
 in xe_guc_submit.c
Thread-Index: AQHaltUf2MBpGpWm9EiSec/NzV3s9bF4kSng
Date: Thu, 25 Apr 2024 07:13:45 +0000
Message-ID: <MW4PR11MB7056985A0B1937A401544B58B3172@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
 <20240425055522.1919005-6-matthew.brost@intel.com>
In-Reply-To: <20240425055522.1919005-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH8PR11MB6975:EE_
x-ms-office365-filtering-correlation-id: 60b6d8e5-4bd6-4cf5-b292-08dc64f73ecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?5z5QRYd8rCMr0qKEc3GoFo538JeQ7EjDLxCUdkOcP4MThmqsxiU1ieZAiRDz?=
 =?us-ascii?Q?EtYOyqiZWdfoy0cglJKeywrxk/dHEUo71NiuYYT5lufBan1G90PBm4WeA7Gt?=
 =?us-ascii?Q?kwRMgE17HeCc3+4t/ZCvVpoGoW9IU40YFYnPWNsVwEmYPdW6c568DOPvhv1r?=
 =?us-ascii?Q?GuMkBsyA1gGStJjGCFSQy2bkSLCvdqLvxufBmCweZlu3gYzUvoyVjcVZUtv3?=
 =?us-ascii?Q?mHmdM0Y3h0ona7quz+8sq6SZGHpDDmFCPll0+PVfDH79NU+SHG1KYiZsSWdg?=
 =?us-ascii?Q?DEBVBmkBG1yEqP89NlHPcRQSnQWHXVn0Ki3y71mBOGDeXmYl+4ilfUGcL+a9?=
 =?us-ascii?Q?SI4t9hWD3JYa1ZEkhKs2K4vua7KHCYM+uQ4PyQHtIR4e5809lqCzkbImLt+9?=
 =?us-ascii?Q?Ywfl2zdztAFaVC0oQA6a/JeJgQdy0IwATVRHm6qQdpwldzEZ4FfoUlOIgLy8?=
 =?us-ascii?Q?DhLLpq3WwmaWRmVJT9XrIWlNSsm5/mrtJkQOh67IzqiG8bAZTbdfKp7rUEZN?=
 =?us-ascii?Q?PKSTYznBXwQtUbuTSXbMFQsUIaBP+00RNO8CdfIOdhNMZrTcJyVpROqf9jaM?=
 =?us-ascii?Q?x5UaCE6kVvlBB//oRuZ19x2VXE7Clm9UchQFHC5SIsQWarGLJaw6Q/GVUuYT?=
 =?us-ascii?Q?zdfEvuT+vT6HpP8sPjbtNSHsbFFSsooXIHCCELGClGSyE77hTGKjresvRpK/?=
 =?us-ascii?Q?bV2McUDX1b/NUc3SLyqhbSDLkwb382ErCWyY48x+nmIKLSDrwNL+f5KAx5qn?=
 =?us-ascii?Q?1rQtWD5PYvVYBhPtu+e68tI4qVa0K0MsPf3tnNj3skNhd8BwRHTIlTnnJ0nx?=
 =?us-ascii?Q?z9efKMSQ/wXyyqz6VcgA8ekVfVJJcjK3CbjYyvwEq2iseEHWksHpC0DcZwGf?=
 =?us-ascii?Q?4mnxybPC5eDm2CylmwypIz0E42Igealna9tW+1Ra0UxtZZsv8Yl2O/GRkiWN?=
 =?us-ascii?Q?JQktYlaFWp30FLdHDwMb848ufReBDWVoEwulULLa0uQKPsaaJvtcM0u7XLJZ?=
 =?us-ascii?Q?KtYcxlsVU5h7L0NBjcOTkFZGO2BsIE0XVHjGS6w4I3M5zShTkXpW0agGcfy9?=
 =?us-ascii?Q?ffT24pc2pAPgkGKW1yCtcRPwX5lLySAcLMVqhedcKU8/ri9LB5Shp13XCrEZ?=
 =?us-ascii?Q?rMNx+M1V5ualQnXKXu+eQL9IUf8mX/4yBWDBHuvUODaqKs7QpQA8ebRldP+/?=
 =?us-ascii?Q?hbFSN8JMAliHrYDYkEs84pb5eYg6vh5wgobLbyJkcgPLeD6GFOD4VHQFeH92?=
 =?us-ascii?Q?Y9Ul/abTM/a2SDwkOi3hUvbALF/nhrEoo82YsQXncFRc7z0x4e7c2f8jWkjL?=
 =?us-ascii?Q?LKwFZS8rN4iJGzhvNAXLF3W4t4NI0eZR8Dwx2bq8La0PQA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3+H3fvDcCztPL5aFqPwoXimT5NJT38vjj1VuF3kcd78FSP0pAjlE/sFUGK8v?=
 =?us-ascii?Q?BDwy3L0sq1ws3yu9MTzek73mxKSYVMzw/xbrFY33572rgtEzDUfo56lI6mWS?=
 =?us-ascii?Q?DKmsfa3SeZt/Ve45qVEGEsqOhLvtz+sUp1xW04FXyyDOeaX647AFtX1yk02m?=
 =?us-ascii?Q?hFYYSKc+AUaooJLHpF/zsr7BzcYLBBRzXGkzdSbZDs+YrJIIDdQH8UgLqX3x?=
 =?us-ascii?Q?sDyS3dJRLzfVrwkVJxRUXEDCg820V/0laKJYcPVFxeyRz9fLRkGbt/r60PE1?=
 =?us-ascii?Q?us5kREuEctedg4HKBA5I23fYPzdQqwDRgIa9LuJm3oIrQqpnn618evtqUxvi?=
 =?us-ascii?Q?24iyT1Aq2be7uErXESQ641sri4zQI6RDdX2UB7WxBy+ELOajIaOwXfsyX78T?=
 =?us-ascii?Q?slIYSpKLBkw1PGCqtvBWm96+JGV2IoqRw+QW/TaZCpOfjziwnQyubdhF4GCh?=
 =?us-ascii?Q?DdtNabzErzR5K8H3mxGllCKSw4j5lDp0fjxEvvWC1VvVso0KRah4XcmfUGd2?=
 =?us-ascii?Q?nTSn7WVMLc9PvN4uIugxl9KAeW9tCfImoIPVCh42UpNI7NHPPm5h+5BXRJWC?=
 =?us-ascii?Q?gfyhUbteXxuzJXvdj0kdF3s/Sc8a5i8mfIoA8S//iVqpb7/WseQc4tM/Zz0Q?=
 =?us-ascii?Q?QYxLV42GbLirnvIRafrmS453mRlYnOK8Iq1GtguCrZkiOeDT0p39BbGbaQc7?=
 =?us-ascii?Q?lAWBcz8jJbVbSITGZ7nmqg5hSeihj4J4QJk8RvTWOw9ab1lpAEFIxkJlQoWS?=
 =?us-ascii?Q?MVr1aY+wc/WzfXY01hHxnVda8dmpyrKpzBi5sOSC9MzyQr7EG+DmvT1QZgPS?=
 =?us-ascii?Q?4BGVIzEmjy0plPp/Nz5pkXDiny6LKOtbbS8Ppfwnbdcc8Hx1FBAtUroN6GOE?=
 =?us-ascii?Q?OM6UyeoTeLK46tBBsxYJgk/ec7r/RZ3Ye9JjN2KbjIuUBc+Mh/7z66rDdsIe?=
 =?us-ascii?Q?D3MwNtRaR/SLd7GdZ5DabRRBEsa2jz0pW48sOlf4oxMFHNPLeXSF57sy66hw?=
 =?us-ascii?Q?lUNlKniDVrK8k4icGxWKc7b/DJXEns19zAFT2cRtCnzCTtaGvZ3RS6h3I1nC?=
 =?us-ascii?Q?zKrgLzvufh2yEL9BNMfZQK8NLzcCVdDA3+F+8BfYaDOAf1OhTaUIVz4tYpiJ?=
 =?us-ascii?Q?OPCDC82fHP3Bg0QZr6r+42UENpCRiedLzdtPAcsiNw/I7kMlQKln1fWC4O0I?=
 =?us-ascii?Q?GpqZB2vHUbud6AwkOct9N9zpuEKosbhs3Z7NOdtCRQRYP8yG7Q2mLkHZuaZ8?=
 =?us-ascii?Q?ZJjDsTcUI0EmaDgH1thdn8O2jaEBY4hhuCW+3UxtUvgPasdAonRXCLIpYq7x?=
 =?us-ascii?Q?n/qUeVYuF3vIrg4VDjEkwipV45UkZWuop+v9b4SnkfZ6HArEko5vd6WzjsOS?=
 =?us-ascii?Q?oQH8148gFZuGTq7Qxv0b39r0HbxXVojDH7gYYEzDNDP9HwbqSV/YaWxj5WNt?=
 =?us-ascii?Q?SmMczs4YlcVS6kb0kOE+FMGFhTltr0YY+a+pWOly9ZVW9QBEhUaY+pI8DXJA?=
 =?us-ascii?Q?6yDSmMpmrC9U8k1CbGVrGf96zEgAmHlt4d78olyhdHXKcnypOJ/BpC3vtfZJ?=
 =?us-ascii?Q?Mj/42xpoweeC+LmNyiLW/qdRNwBp4jksj3SXkn3C4UyodXL6NCiui4GmsQxl?=
 =?us-ascii?Q?dA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b6d8e5-4bd6-4cf5-b292-08dc64f73ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 07:13:45.2708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8nAeKk2L33F1MjWI1vqevTMPJxlEdQK6pJhzYJ28PXqlc80+WFtwOj/yRzi4HBOy81cISG3JBQgxFlflFYQgqvwVb4pjMi89XQDqt0QO5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
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
> Sent: 25 April 2024 11:25
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 5/5] drm/xe: Replace engine references with exec queue
> in xe_guc_submit.c
>=20
> Exec queue has replaced engine nomenclature.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 28c1b9b46251..5aa6ad540ef5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -426,9 +426,9 @@ static void set_min_preemption_timeout(struct
> xe_guc *guc, struct xe_exec_queue
>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch,
> \
>  			field_, val_)
>=20
> -static void __register_mlrc_engine(struct xe_guc *guc,
> -				   struct xe_exec_queue *q,
> -				   struct guc_ctxt_registration_info *info)
> +static void __register_mlrc_exec_queue(struct xe_guc *guc,
> +				       struct xe_exec_queue *q,
> +				       struct guc_ctxt_registration_info *info)
>  {
>  #define MAX_MLRC_REG_SIZE      (13 + XE_HW_ENGINE_MAX_INSTANCE * 2)
>  	struct xe_device *xe =3D guc_to_xe(guc); @@ -465,8 +465,8 @@ static
> void __register_mlrc_engine(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);  }
>=20
> -static void __register_engine(struct xe_guc *guc,
> -			      struct guc_ctxt_registration_info *info)
> +static void __register_exec_queue(struct xe_guc *guc,
> +				  struct guc_ctxt_registration_info *info)
>  {
>  	u32 action[] =3D {
>  		XE_GUC_ACTION_REGISTER_CONTEXT,
> @@ -486,7 +486,7 @@ static void __register_engine(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);  }
>=20
> -static void register_engine(struct xe_exec_queue *q)
> +static void register_exec_queue(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>  	struct xe_device *xe =3D guc_to_xe(guc); @@ -534,9 +534,9 @@ static
> void register_engine(struct xe_exec_queue *q)
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
>  	if (xe_exec_queue_is_parallel(q))
> -		__register_mlrc_engine(guc, q, &info);
> +		__register_mlrc_exec_queue(guc, q, &info);
>  	else
> -		__register_engine(guc, &info);
> +		__register_exec_queue(guc, &info);
>  	init_policies(guc, q);
>  }
>=20
> @@ -706,7 +706,7 @@ guc_exec_queue_run_job(struct drm_sched_job
> *drm_job)
>=20
>  	if (!exec_queue_killed_or_banned(q) &&
> !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
> -			register_engine(q);
> +			register_exec_queue(q);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>  		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>  			q->ring_ops->emit_job(job);
>  		submit_exec_queue(q);
> --
> 2.34.1

