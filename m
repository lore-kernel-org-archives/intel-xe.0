Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB53C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 11:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9610E192;
	Mon, 10 Feb 2025 11:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlEPDE5I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AF010E192
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739186247; x=1770722247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OGiqp3vJz7Cmnu4TL9ikYEQ0ifrBOdDubQPG1kLLBDI=;
 b=UlEPDE5IJKZZAUnMuP+Zt8tQW2dMHm3TApDSxhPF8YxafvZPINWmAlWx
 +lVQMC5OjwRAdhTLqn89OCUVyLJTU8Hc9JspRNmzCK1EoibU+7WDG6GNS
 a9Kp/Zgzq/H3y001NI3er6QEuLk7Od7lw/BlHGaQQI8lX+z5FYWxiYpwI
 neG//qbHMKGefNTO0p5A+Z+ujZ9DgiWBQtRXDlUc/GMjfoZcq2spSvC0A
 QpgjUMpaWxyBQKYmu1H1Cv3wVe0v01P8yWFkGkeZylOG77E6DJcqelUYm
 wnPIZG/1NkhTBDqPFO6ZMr2X92FQ5BtAW+9G5AApf2TwDbPQKH7q6w0YH g==;
X-CSE-ConnectionGUID: UCM/2ezHTJyJgYM2ECKxwg==
X-CSE-MsgGUID: kyFCrs8ETyCgB+y1e533Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39627635"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39627635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 03:17:23 -0800
X-CSE-ConnectionGUID: 2hjagYVyTK61Tn8WKUckeg==
X-CSE-MsgGUID: 31lgDF2sRk2CMOCwQITyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="111926644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 03:17:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 03:17:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 03:17:22 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 03:17:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq8abNHQAb9SYufU+2Qb8ov1oygvvDKTJXEs/ZE+RE23nG/0PK9I8krY4L7kVyPAfBT536kqjJWXIF3cx0v0tyRjTct77kcOXarj9O2VXkq04GenC4jNGzr/c0bXP73V9Exa5K6zJD9TCQmfJlhUyhbKjFJsUXhAizRKtGLvNVR8m3niO2BJS5/yQussWZx80tVlHJAZxhv0clrbzJJwqa6jHmv9+HwVS1NI52ywBj9hfdUubSJbixA6g6omt2suMcaGeY15R+ZgERxFfZhVj+vANJlaSkdhUg8n4xzTyoTwI5ov1OrsfaF4woC+YIis5bsYeX9KHBTnOCVj2gXuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLtMi5ZHaGq0tpGmm+JZFsYabBxPb8sdFNC0VZn9tlA=;
 b=oK5+mECIf2VoVSPPWqAWpThcpyMs6LPe8dIsKp7bAmoJ/rG6YwbXuKv7C6yA3LoZGvUs2Bg/VXHJOSGwRaX01Ui4TRk54anXqcdukrPgrCSZp1gUY6lHlGJeQkM9Slc0ntVblpsm2BOKaEtPrX2rg3Jv2u2DMiiV4syfToyikyTfDon4gP/9jMskEC1Vs9k2ik1Yu0FhqlC/IBJ9Zia4Lf49RbH4Cd9PEYTMvGOimgf+tD4vDgMzG03bJDdcBgjQ/BUqZsUliXWZezdUf61fZp3LT4MiARUcgJ8UlA6jsSQfYax9xyJFb5nzJzlG/6ItgMeJ/bk+xCwMKasMj94Qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:17:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:17:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH v3 12/13] drm/xe/pmu: Fail probe if xe_pmu_register() fails
Thread-Topic: [PATCH v3 12/13] drm/xe/pmu: Fail probe if xe_pmu_register()
 fails
Thread-Index: AQHbea7IxWCSSIFYQESbVO1fWUTrhLNAZuAQ
Date: Mon, 10 Feb 2025 11:17:18 +0000
Message-ID: <SJ1PR11MB6204502C062097C5861A989081F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-13-lucas.demarchi@intel.com>
In-Reply-To: <20250207221945.2878241-13-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB6168:EE_
x-ms-office365-filtering-correlation-id: ed90b37c-cc80-4473-5a84-08dd49c47b22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kSK7DcWT52j8qxVEIglSfHPm4AVJ9lw05Gol6NMiinnETrVhMJPrs0fdd7tl?=
 =?us-ascii?Q?Rs97+451kHOZcANGwoVDGvU+h/Ea02cfqG0DBPMHd6eBWnZD0Yq9zqNQ9NlM?=
 =?us-ascii?Q?PQVjAc8R3hfI29imKHGCdg50J46RePnzBHsX31GAzlYbqobekJtdPRlXDGsj?=
 =?us-ascii?Q?TPRj1kDNhZJ/cd1s+VXOu5YI6MJC3ndHfLSs8uefW7MUU7aG5QIINDCES3ZR?=
 =?us-ascii?Q?TyxPtZS5HKpOz2JiwR3wmbo/6MDCVDR3lkG2o8M06iQNbQrqf+lRgdlbNcNt?=
 =?us-ascii?Q?NGoYeCwJsM4EvLyoZsseK3OvnbJyk9KHOSbGo61hAvVbjqnbJNRDXLepQGEY?=
 =?us-ascii?Q?08z7U8LnihkPOEBi9Ig5Am++RBVY8SeNfxeWg4U+D2tVSFkCk7pMiFkLU4bJ?=
 =?us-ascii?Q?k3GH/YNuFxefVTlMjdgMZU2d3fs/EEhCadSYAcf/HxqSlMW2TZBpm/LqdoJQ?=
 =?us-ascii?Q?3wq5YfuIRTO4w5WIopGoHiLm0YLnf8/w3DZc5JzhZXgUQ1SjmaNyQ8Bip/gT?=
 =?us-ascii?Q?XGRiFcUuJ2fKkaefs5yuKwJKFb2G/+dBVRJ3OtuFnGvEvj0tKdnOxVt+DItb?=
 =?us-ascii?Q?hPh1ic8nT6Db0OVN3OX8pLaN+JnCuTgEabjaCywv9IVQ74pccVqh71PiWPxy?=
 =?us-ascii?Q?zLmR37al3j1mK22RYOhwEDwzITnTnO9rCNj6ICKPKRg5lK/lqFhj3mA+IXAJ?=
 =?us-ascii?Q?TzkQlGcL+AP9zorafdoYVHH2MCsFaIbiI8QLxUIe/6f7U+DWxL6QiRlj4qNm?=
 =?us-ascii?Q?3VLbhZPrct5eeg+iv7UZD5BwUXLn6nKfAh2C2d4MhTe7pkx80pT2rEnKkXSQ?=
 =?us-ascii?Q?auunkqSGHoEEQ1TTaNVqgpgMCD0BPL24XUX9zQwc9z2m7PDQ8Hwm6SzZrH7d?=
 =?us-ascii?Q?Iwtf4EFEVaO/0snKqAJH25gprPKST/t0S5N33kd6hPZm1Zncey7XpgFXyfVp?=
 =?us-ascii?Q?gA56BkZw+tgEftJxaJco0plYJzi5DKSaqa3c8Yz/88KrmI8o+JxDfMiJCwTr?=
 =?us-ascii?Q?McspWwXKMNMYNPhno/CDqpQ8OkK8HbDg2tjqMYQr+s9TluaNDyVbBVQpV3Pv?=
 =?us-ascii?Q?6Rs8rK01PbQr7kWHzWSWu+3eWSNbNLyUk/EC+sKeA3vGywanol8QXkEiRnxY?=
 =?us-ascii?Q?eGIL/P9Y17Z7GP2+2v8x0NVd97kRsbCh7sii1kNnLHH8XO7sLerExgJ1kZ5B?=
 =?us-ascii?Q?uCANQ3w7DcucUGBjhDaHnrSJTg3padx+cKKFZNWKm77hWSKj5xGef5nh67qK?=
 =?us-ascii?Q?p6RAh5FIbpc448ZyzBDGy+GZsLQ10gBdFWpgQtK6mbdsrw1zUv77N0E/zKvl?=
 =?us-ascii?Q?rYyQTPxx0f6KdrIuCJ7mCK9jW8cwylBX3btjs8RvPyFLvojK8eWzvt5fLP4R?=
 =?us-ascii?Q?I0X+ziR6vHmbsoJgfgfegMjqrw9oZh9Mb8k3S1hWHgkWrGahzEcImjM8olca?=
 =?us-ascii?Q?hXkg1tkx5kZLSpfueWQBJZMzfickzote?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GiIDrLti5RCW83YCyHTHvs+CmCelBW1E8Tv62vR9ppyeWusw4LKq7DKzAhdP?=
 =?us-ascii?Q?lc/3wdZfKxCL7dztf8Gss5EtFMwdi3pdYaiCWbK32dmUlRxcNz2XmZetpa9L?=
 =?us-ascii?Q?lQDOzl9sLyh1Z2fA8QUB+fglppI0UuhjFpjXjKv8mi5O7GcabUny0DkDeuXW?=
 =?us-ascii?Q?ibUKnlkm4078VwxUg3HJF7J+Ui2oEEgyOsbBuTxqPiiToKMfgLDo9PbS5Nci?=
 =?us-ascii?Q?ahMJYlEk/iXNIldSGPVML6ESLtz5s6RMQHNrYfW/ifv4MtOmwH147sH/XkBy?=
 =?us-ascii?Q?eyxGjUD5smkcgQWDr5FKJ9/1d7IYListtMHag1/OVWGvsKyk7md8ucNe4X0b?=
 =?us-ascii?Q?uET8H9zFbFRZ7LBHUAVpwtQvE+wi9wYNszgnexaJtwd63hfYC30xJ12puowV?=
 =?us-ascii?Q?wtAyOPD/vqKQTOeTUclAHrhOyrZKgOO7rEE6eJqj2n6gTrnk7Re1sRXyJB4i?=
 =?us-ascii?Q?BWhTH2N+/mUjE2AyJiahwMUlCaRpCG0V4F/870qYbHZvEfskpMk16Logk7Lq?=
 =?us-ascii?Q?qJPb7dFLStnqf+/1FgwYNYSGWr0bNkpFPuayqXUUk4tY0bLGK1VSucdxvgRp?=
 =?us-ascii?Q?A78NQfC9AsxGmHUihyy6f9ekBYzt2WUcVyIhZ7Di5C0n+F3uz88dkmhGP8H0?=
 =?us-ascii?Q?bQFyjXdN1jVJgjiU8ZPKn7tBPvCbEeysQ0XyH85CVQsexlJNajZ6ElzdGPiw?=
 =?us-ascii?Q?FhdJqaA4SAwxo5wqvgfL5XBAXvOu8xec0e3EhMUTqj41OtBoDEVhal6mGVlp?=
 =?us-ascii?Q?+FGp1jnR82R9QImGbiF1r/hWJO7tb2+zyz5iGqk4J7uxfC6KSSdE8u/9XLFD?=
 =?us-ascii?Q?UYKn2fSH6F25ffP2nFj2quljaQkz5apJxp6EBoiOhJKS/32ooUiHVzjMp1x6?=
 =?us-ascii?Q?QsDNqD+rVAMgPFusLvfD0fwDxdK6gJykYYmLCHtLprtHJ7h+mBiMO/xgmZE2?=
 =?us-ascii?Q?LPBZUurzDuM0Qd0bKnchGjrzDtxXriT5uwfuG/k6oltSQKXoZIvYRebWt9V1?=
 =?us-ascii?Q?JPSrBWlKa6X5ee7ZRS1vpsK8n/xzTN9qKJquKfvYIcPb4S9UUZCimhUrLw3t?=
 =?us-ascii?Q?/rVKs9u5k90DaufbRiBsYDhrajU7JL1riVWd+XV/CTWDLZx8Q3AAfbJ0RAOj?=
 =?us-ascii?Q?qkR15i5SDbxOuEY4Jxvw7KakmLWwE4oxT+YGCepr+iScgpIm90lwHwFFcNce?=
 =?us-ascii?Q?RpdlezyEaxETbf/GQWaP4ra+LJtL/3Zwb98akErmEX66Ek9qumjsmg8RRZG6?=
 =?us-ascii?Q?HbKa3ofDb0AeJ8D4R3VmOseFfOu+f/ZmSWi4bh7d2Nv66rrHSrKtVNMtZGAA?=
 =?us-ascii?Q?v5MMsYtyahbgkY3Ga5iFzCO6zFAA/Za1YIZN/9MS03C9LjXblLk4FQ2V/81j?=
 =?us-ascii?Q?uVQvE8QYHpD0OD/SXZgK9clha5MviG5hvwujE/B5E9Xi8LL8KSufguIWXc3e?=
 =?us-ascii?Q?5UGh4pTeyOFXHptaGKxdv2wddvfBj6uBGiPqWfU6m2Fn27juAyS8V4ITpZeb?=
 =?us-ascii?Q?yA4Z6RQKEDH6yeTCL4k0wUfdjTwNt8iA9DgilMekV+BM9ElBiVGTXkT9AA60?=
 =?us-ascii?Q?1Orntb3+iMBiO4EZFDG0IqZyIyBFq73vSe1sVBcm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed90b37c-cc80-4473-5a84-08dd49c47b22
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:17:18.4310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1xSDF+KXEYnLRRtsE3kNc/55FWohTIXgu7+Nx4C8hFffGxvSIv7n3jPB+S0pkHH0zEQpsu+ulyRpg+Ex8bKQeajwp39HYf0Xx/lYKl/tHys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Saturday, February 8, 2025 3:50 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Luc=
as
> <lucas.demarchi@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: [PATCH v3 12/13] drm/xe/pmu: Fail probe if xe_pmu_register() fai=
ls
>=20
> Now that previous callers in xe_device_probe() are handling the errors, t=
hat
> can be done for xe_pmu_register() as well.
>=20
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 6f90d74330524..002e066f5f288 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -883,7 +883,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>=20
> -	xe_pmu_register(&xe->pmu);
> +	err =3D xe_pmu_register(&xe->pmu);
> +	if (err)
> +		goto err_unregister_display;

This looks good, since now we are treating all errors as probe failure,
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  	xe_debugfs_register(xe);
>=20
> --
> 2.48.1

