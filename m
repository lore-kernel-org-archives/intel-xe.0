Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDACC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C1D10E669;
	Tue, 29 Jul 2025 18:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1zAh/8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741C510E667
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753814469; x=1785350469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A8yyrS9N0AX8BCfeYEJDy6knMp4IyZOaYZlrHztrbzo=;
 b=Z1zAh/8MxAOS+sU0mG+Y7haafvAX4Dhd8Xa8dzZVDUdfPfVXIKU73P6q
 qCgUDQQRwpobN7lCADi3oI2rDmmoeugEylq22/KSR32a6BJmM64n+GUXD
 httcT28kN9NhAhBgTD6OruXsGpgfMMpaxZ326R7J+USjoX1KXaVYLsBnD
 6j4ffxRZVq+U1bfyrax433eYM75MMATZc5IIww8oAm6T7ytY5FuFjJcq7
 G6d79RyDj0OyIip7l0kB+5kRqgRmaPAYm3QZ8LJlbEW1dE9qkar3VOB6T
 jXDxfoLCUjNuCdOtujgCnIIsI9uhejMpwgwlHqsDRvAwJ3OkmKgUGsGkv A==;
X-CSE-ConnectionGUID: pgOKlimkQwatqi1YFPLs3w==
X-CSE-MsgGUID: SmlZ1oGpT9mCmP+cp5egDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="58723891"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="58723891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:41:09 -0700
X-CSE-ConnectionGUID: o4HUnx7QQVKOPrEsMKAj8w==
X-CSE-MsgGUID: pV09asXXQVWQx2IPs/7AvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163125434"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:41:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:41:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 11:41:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 29 Jul 2025 11:41:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWrDLj6dCHekAsn4W/ZP8L79XQEMx6uPccZ1MJXg30V9fgnbHYoFV7k/xeNzGtAOM7grfjULPxMhctLgb6YD5idjTPVgHpM+VyQZQiLcEom0i3qJCjomVINnnMgvOtmhFWLJSCZnzobLkz1LmoydIHLbzdRJWRkEaEDxeDHCNyRYOr3r22y+PCMzddmoqCJhsPxr69aagDL116Pqxsfp+rttx72eGbpiaCEtT8bWJNRbp++sgYWyyQwI4Qwv5SbGv/Of9mR2siHlVAr9UcTW5Rchtysbq9udn9WAme5MdT2NKCnLrydpyrCAXyqVUCqmMMesR9WmH6uY12kgjmaroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrC12fWv+iuvz4SAtRaOFGNIfqQ+pgBKNOExn2t9JoQ=;
 b=VPnZkADfc/JO3JAlIhAPMqGPDIs0sHWLEaNvTiNw2yeCYhCv/4LzPIQF9jmoGMzRzdK62EnxM3C9V5J0Vs0i8jS5k14eN+HzkXKuoBRc0bqRQ8rVlRENH6KYwq/pQLC1IifBceT8FQvvCNrS6sjv8wFsP8sZs/8TuwCiTw4fY68pVcKPBvyTaZGT6nwGuAJWtnlZ00JrvjuevTKc+qCwohmIzo6mPde9x7Fkbhh2lLhGybG7MrPi76iC+W7etcsG81GgxNNUMyIxS5gQOR6gjEOhTLx5cQ5LMGUg+GVOqWH+/NeBo84xDa2zgjq/YFg8BMVLH92b7LRGQPOdKI7Orw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 18:41:00 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8964.024; Tue, 29 Jul 2025
 18:41:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Purkait, Soham" <soham.purkait@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/debugfs: Do not register residency files for SRIOV
 VF
Thread-Topic: [PATCH] drm/xe/debugfs: Do not register residency files for
 SRIOV VF
Thread-Index: AQHcAKhqCqPTcbge7Ee1ygdOOj28jLRJa+Dw
Date: Tue, 29 Jul 2025 18:41:00 +0000
Message-ID: <BL1PR11MB5445886773D62D4506352692E525A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com>
In-Reply-To: <20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|MW4PR11MB5912:EE_
x-ms-office365-filtering-correlation-id: 5143f9e3-8f34-4992-5e79-08ddcecf7715
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gcK5CxQ2OozmOJJewYffwv8Pna1K9jgMpLYyUVOaDsXGJrmEuYSWg9SYhIp/?=
 =?us-ascii?Q?yhhRjZDsA77NrXQ64mlh2TQiDhaDlQU60RVwxQ16dQ1jpj9f759ikNLYwYps?=
 =?us-ascii?Q?ZwEhxDwDzS6mIKy6ZzbNbCYC3JsnVPLeIaOVbZz/LyCgTychFyqBa5Y/CvxV?=
 =?us-ascii?Q?helGPX+Hf8DPZfcl00vuX9suBn6R2VDhXhGiH7kLDp29xAiUdb6vw9YqIfz3?=
 =?us-ascii?Q?MS11fEi6zLgDzPQmAI/YX91TdKcGBeGfiFHQYRvAVQtPTMBijezJRVIFi+Ek?=
 =?us-ascii?Q?gFVtnourqT6qldIp16V2BA1XzQLcmMaL67v1tmoOBxFwvDfdVXphlhh92bQs?=
 =?us-ascii?Q?i6/SgR4E4J6RF5/M3OHqcjBq0bERDTyogdPQGFo43uVEPsHXmpmrJM6hpss/?=
 =?us-ascii?Q?JdGwbm/ELuH1V8iGLgeetsHgnOCzs9KGfyBHeYEv+S2FFXfHZbPItf9m6WEf?=
 =?us-ascii?Q?Ke0yqF3j+Ig8mLe0WoJlAJq4fG8z8BCKTwD/lXk7XQBe/OPBMLQoJvq9tkJr?=
 =?us-ascii?Q?/MPuHqN2PwkDHaboA2JO3gnqXH3rN9+3Izb5QuTujHeL2Sn5bWqcQHa+suFF?=
 =?us-ascii?Q?RLVhfBeSwvFaYo26twsldCLDBpjsH0Cxe2VdLtz3qNu6bTuBezGPcSSL4hy+?=
 =?us-ascii?Q?ZchmEPvwc1499vj0wTLeeXkqHSKvB50/0Xt1O3zQzYVY+w230G13smlV+/qH?=
 =?us-ascii?Q?uiSE75EPTq0/c/TQrvN+644W1Du48mv2LvjqO0HlV7CpfvrcYyPs1PJiNDzm?=
 =?us-ascii?Q?4gxK6UDc1vkHxMnMRKXWNy+39bqxbsIjOndAbqa/DaCC+c0atRYI7mk9ThEE?=
 =?us-ascii?Q?oba2Ta+UuBJ7Fcr53/28YYfnvU1+NZPKLwFnDjelrDYnztEWBqh7eqhNCUom?=
 =?us-ascii?Q?Fzz0CflcOIZlYR9H5/kvP0t3V8rRW/lH1Kthry9rv4cCQfXrihIFiBaTBtRN?=
 =?us-ascii?Q?JMAjywl5r3gg6Bt2eZftpfYKbKuA1T0sEz3KrvnFWzdFTBnO4RVIQRK24mwh?=
 =?us-ascii?Q?M3w86y0wktZ4JJTA4d8zJAjjXJIF5n0+mfYzJNKheNpjyPEHiuLRXgIkXDnd?=
 =?us-ascii?Q?vzED5C/ZcaIiAK7ygGNqdeLQsCN3znvHzCoYPZwcYwsLFn/wgsuKpXdpm02M?=
 =?us-ascii?Q?iCJbJpI1bJeSgVWJ3/NCbbkOdiATfROc/BamHnDS7+bDYwZP4GO/Qv9L3Phw?=
 =?us-ascii?Q?D5dhooBhmN2Pk+wTsAKMR6nM+a2TqjXunuIVrHfuv6mCqN0GH0eFyE42T8GK?=
 =?us-ascii?Q?HZaXdk5zGbWvXjioFZb/Iasl2R2ZOs4+IGXa6f4tvIwnss0pxw3Hk2awhaDp?=
 =?us-ascii?Q?rAT6AmNcVst0waUrx0/6ECYQz9eJln1+ClFcL7glGxmLVO8eAPxzGqGXB7nv?=
 =?us-ascii?Q?bmQDs7o3oj70TZReeX5J6wbQg7BMAed/m2oNZjJQ4HspxAzCr8RiRbRSiNpb?=
 =?us-ascii?Q?qKJYTyWdpax9AmbXURPn5XZjLXMCSh7pjoivTYtRE3VVX0+wD8IIHg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Jcnk0enH7qhvcwAGg0yUiYuAcHxJFPZS58utwf7CiFxTQ4wk2X9ugEs0dAe?=
 =?us-ascii?Q?23eTn1uqsSQ95J/DGGHm4KO5NfrkycXQZPfTCdqFFUaTQjAvm3f4gsxiTqk6?=
 =?us-ascii?Q?wJTvvwl5Uk1MvRr9OWcvFTscbwoq29qQW2S8kvQrABbrUeDHaiT3sVj7Ffkv?=
 =?us-ascii?Q?SV65/Mc+av5JKV3/Cton5223dwBWha7J4JJWqTACFJJBiN8mqZ1MB3y1r7k7?=
 =?us-ascii?Q?Nkrxq77RPh1OuVMKIJ6oaF5My8n1F8CfsTfyNsGUIikqTWEB6XAtdwwLNGPR?=
 =?us-ascii?Q?XN9XOF6gHWqhb8kqLfOZEpVtul9e1BdM4bCH0U0rDmefKBaN2sFTEuPpAtXe?=
 =?us-ascii?Q?scott98hSYcJq+DFBzS3kpHIfbK+7As4fp1BJaxpBtMEdMVufl8yB4LHeJ+z?=
 =?us-ascii?Q?4vmStpTqN3ECKzVXWI2cBbdzRp6A+Zq7Qtdzmkh2giUCx9xUpId3ViKmRqfc?=
 =?us-ascii?Q?5HjvALYghDTwe81PXROJLh/bDJmUpJfAvIQ2NssY6rDeEt2h0RWGcWnTjrs/?=
 =?us-ascii?Q?QkHZoIlpytOsKWLTYaFDIBeE4VjuvreJtmLAy30LZBPZWhtbqKirMzSxAyf0?=
 =?us-ascii?Q?ZsAtMoDQd7v2rJ75ZuG6AxT0eFNj2LTpMUjti009GWAikVXUJEpfSvuWbMV/?=
 =?us-ascii?Q?zetbUKTjFB81sunjeTksUJyJMYcv2Zi33zqA+scLs/E5fJRGpaAZ8QmjubF3?=
 =?us-ascii?Q?RwJEuDXjO/0Qo3lwgqyMuwoFTjksMpMd9CWtVPypm3a1bRTCQrs/EmylffNI?=
 =?us-ascii?Q?UYrD9fouyBD+AIHISx8D8iORMVnoc0hnAVKf25PETQzp9FBb7mciqSB5pu1i?=
 =?us-ascii?Q?hVIrLHU6IqLrcKgQe40BCdyZHwAcRXM0Cjb250c8JFurdOdjx6cFrTSrHmQa?=
 =?us-ascii?Q?bntwdIK2E+E1DJFJoIHaqtThULkrQX7lr80ManFBhRP0kfrCat1gHoLTWyZo?=
 =?us-ascii?Q?KRfrTKJ6cRkoVOy1gtIVL98biH7UxE5ithb1ix16AhhZ6EXo8fXHRxduMD6C?=
 =?us-ascii?Q?2Is1pZ0VDGnxmCZ2/TtYNaSpQGBf4UPqpyVAZbTTn0ZPm0Ea02ECEGAVMc8I?=
 =?us-ascii?Q?IKpEQbgkZFUlPvTfVeZgZkRiaZbUa51XlCp2mzaA6o5xkhXbKZDqL1As5007?=
 =?us-ascii?Q?JHHNUr3Y3jCOyOrCdOaeGfearXMDgK+DUxHU+zcMe1qdq/l3hcbz+2EZ0G10?=
 =?us-ascii?Q?RtXuKFgEcQRXSMtRuRqvE4u4wKb5BGTQEIWPULH/3TU0PJSLhOpi1S0IwMQV?=
 =?us-ascii?Q?cThwg35U7mXzWwa/MAt465DEDzxzeOvdSC/5zVDTjij47zYb5TFXxUGlhcAf?=
 =?us-ascii?Q?LM4HMyGtdtCyQWCnv0oznQUr8FNp6yzDJ2/gn/85/x9MmU9LaWVK8n2yR5Sz?=
 =?us-ascii?Q?jAhHmubV2iBAWFHGX0Iasw85v5LpKE3aLMU7CIQPi+FOTxkT0+Si/4kkyior?=
 =?us-ascii?Q?VPUPSLgSg/JaSEFcthQgBSqMGHuyBqERp8pN++u2usKXLER3vS24ogZWbjwo?=
 =?us-ascii?Q?AHQaiv2TzxA3TkKCz/iHMji8fsBBPOD9mDASxcdPKyShWmA+SXt0CYC8VD5W?=
 =?us-ascii?Q?895yMn/jzL6UR+M41NvMwAf2xHFfyVt84zKe1ST0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5143f9e3-8f34-4992-5e79-08ddcecf7715
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 18:41:00.7726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuMKE6Sazoc0rfc86wjD0jBIEb8zS3InThyeefRgX3gfqGygACZW8Hin0WH/cP74i7vAORB9KJUU0CXSdLvb10G5/nnGOJ4tOJ61GvwAD8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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

-----Original Message-----
From: Sousa, Gustavo <gustavo.sousa@intel.com>=20
Sent: Tuesday, July 29, 2025 9:47 AM
To: intel-xe@lists.freedesktop.org
Cc: Purkait, Soham <soham.purkait@intel.com>; Cavitt, Jonathan <jonathan.ca=
vitt@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana <ri=
ana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Sousa, Gustav=
o <gustavo.sousa@intel.com>
Subject: [PATCH] drm/xe/debugfs: Do not register residency files for SRIOV =
VF
>=20
> Registers accessed by the recently added[1] residency counters debugfs
> are marked as inaccessible to SRIOV VFs. That causes warnings to be
> raised when an attempt is made to read those files. Skip registering
> those files for VFs.
>=20
> [1] Via commit 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and
>     pcie link state residency counters through debugfs").
>=20
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and pcie lin=
k state residency counters through debugfs")
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index 0b4a532f7c45..53b89528692a 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -360,7 +360,7 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
> =20
> -	if (xe->info.platform =3D=3D XE_BATTLEMAGE)
> +	if (!IS_SRIOV_VF(xe) && xe->info.platform =3D=3D XE_BATTLEMAGE)
>  		drm_debugfs_create_files(debugfs_residencies,

It sounds like it's specifically these debugfs_residencies files, and not a=
 property of
drm_debugfs_create_files, that has troubles on VF.

I don't see a reason to block this, so
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  					 ARRAY_SIZE(debugfs_residencies),
>  					 root, minor);
>=20
> ---
> base-commit: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678
> change-id: 20250729-skip-residency-debugfs-for-vfs-4d707779fcb1
>=20
> Best regards,
> --=20
> Gustavo Sousa <gustavo.sousa@intel.com>
>=20
>=20
