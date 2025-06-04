Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDCAC5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 06:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5BA10E21C;
	Wed,  4 Jun 2025 06:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkO+sO55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD2F10E21C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749018993; x=1780554993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ir0WBY153m0EYErZ79u1YowQP6nmPkJmJQlUQ9IrLx0=;
 b=VkO+sO55VwKTU3ZGI/GH9vI5m8RiZF8NXvpp5YDicd0ihBBZhYsbiw8i
 AVQwO3Wv8YPkDeR0eqsHPVNrBlu/GYdIJAK+GjXwCmf8KR/gUNHIRcjWc
 qQf4OpIgKw0NbB4f7N54AVIyI5HPjOEtQ7mVVem0cO+X0mhF+trxtPP2Y
 GdqlRnOHPhgpZBjJs18xNSueLXVJyJg0EaQNGLNEgjJ5Sjh+KbwJ4xXOS
 XdDh7ppgEsSsdDnaD3PSVfqjpjwTX0GrRoJole9xK8veyThsTiZM7hDdr
 VxiWCdtkrQ0TIqv6ZSdM6ybeliNS2QwTHk46aVRSHcHYtc3uDAEZRYPZL A==;
X-CSE-ConnectionGUID: zERkenb3TEOMaMW5x1aWOg==
X-CSE-MsgGUID: MmgXEd4gQGWFmll+lONkpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68518264"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="68518264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 23:36:30 -0700
X-CSE-ConnectionGUID: b//23D64QB2KAZio24Q45w==
X-CSE-MsgGUID: GoNhITUuSpOFd61/kipv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="146037409"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 23:36:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 23:36:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 23:36:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 23:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjowToNxBHFrSkc4dicMSli/HjPhEsqAulpdgRPKHQ6P+B+bXVxl49z+XuTq5JD86V2oXP5L30h2Qbfljgx7dNDLgIjl2ji98gL4xtLkE+XHxZX2ZxhvoAL33jVu20IA7LpXdCIWp9S8uuYxFWYZ/jQW3er/EVA8Tkwhs2hfjgsYKvggX/usb+r/2VfsmPQQNknNgy43jV3HCo2Id6t+o+c+ocABctqomK6f+Oz4gLYASoiLYqlW7uLa859gIT1E10Lgz7iFuwM08Ifv5gbCbWW/dyPI5zzrr3nFvrPothxeABUiPOua7XprFU1YskH1wvnt5Ewwj4cnbhDXfypr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI/bcfcLwlCbzRHUbHoTJYVJd1BzdneLT0IHYd7cfb4=;
 b=UapWna1/N5Dhdnl4Z66DeIDgVylrKr8W1JCxAiihOjf374HX7eGVg8Uc7/x80ViYbc4MR10PgX3/ZvU7I2W6+N3hLg0plHhEv81u9gsq9J5cfBu5kCNcJbQi0M5EsVMhHcQUSyJI4tw5yd8WmQEwcRrivNK7+v7NsXKEvESR9475R1/STApVRaJSdwSC0HYe2Q/vLiZJx9ZUbQ5sRCsLJMH4LtB8IoZL90j3H7VoO4VjuiSzyVj+rIAX/CO5WgTwKVC4sUrnXZew++k/UasQPX6PQ33rcbDrc7LhKXsml6R3i7jU0Ty5twtDpjoVyZ/hVVJSMg8LagMJfitJs6tOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 06:36:24 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 06:36:24 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>
Subject: RE: [PATCH 6/6] drm/xe: Add Wildcat Lake device IDs to PTL list
Thread-Topic: [PATCH 6/6] drm/xe: Add Wildcat Lake device IDs to PTL list
Thread-Index: AQHb1LTWHtBS/S2jhUGZZh9HvIucnbPyjBlQ
Date: Wed, 4 Jun 2025 06:36:24 +0000
Message-ID: <SJ1PR11MB6204BBBEF782C29186F7F6A9816CA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-7-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250603182430.1016734-7-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB8351:EE_
x-ms-office365-filtering-correlation-id: 5d2e70dd-2c8d-4462-4d5b-08dda3322069
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rWggSjGVEjo6HlLRSbhP9/9e5M0qBAEGTwQYFd5DtdGz4VSpFc9BQoUYXref?=
 =?us-ascii?Q?AmLO57KjtU/t0Atpc/Y8lRGp35gENeHH1T4Fmi5siRc4yTjxFIKHmFMp7RaZ?=
 =?us-ascii?Q?/p/Y2d8EhHBz6Xw+nwNlsvmMZHcEfrHVzywB7ZfzjTEji2biJjsidNlmb48I?=
 =?us-ascii?Q?miJ+zteR5c+r2zjBLtt9ENtgAj+LRisi7yqyKxRCZ0OmKsWvduC5yNa7ehLb?=
 =?us-ascii?Q?XQ6eaZ8DERpTWKwYY6tj0G1h3wLTQQltF9BUgKuUXTR1xA8L8Yoeg76s8JJY?=
 =?us-ascii?Q?GjnCb8XwR8ohzVA0CFNzZrzrik6qwC0EvXa6Rw33v2AgU74o1IFIk/MYGuIN?=
 =?us-ascii?Q?eXtsAW8kzqefZpfUOLHCtdA5lR3Fx/8oYfry6f9T19jjzFKL9K9ivI5ot8+z?=
 =?us-ascii?Q?s+KP/G0WLwoMe+Qn2dMojRAPPa6ZqDQ5rxZukcR9gDRH4+3T0rDmPhZrR1Fm?=
 =?us-ascii?Q?LHUF+623km+QhKTUTCqilohOQIMaIfcncDkFF+NAgshXJYwHeqUye7S8sAZH?=
 =?us-ascii?Q?xl6WBgOiUXYkZev/KhgG14fWzB+g+VFuYvZeYk8G/yEJFa9xPfgLxW44+jQH?=
 =?us-ascii?Q?RNUhG+RIOrUSQnEH9/7v8vA1oFfYE2t+7FRY+QSjr025ZGYTpTN0hEBeM7gO?=
 =?us-ascii?Q?yGfDv7oNtlYrBW1D8++VGJE8e/e//lWLZ9bHjYEWA7caPlwXBKRoRtx5cb7e?=
 =?us-ascii?Q?mwe5clorZuGm/91NFJPdOgcxcJQOl3ntd3X3QbfKcbTISDFKMUsANgU3V+Cv?=
 =?us-ascii?Q?jMiEMbb7WIenry+Qkwh+0YdyugVFACMmRx6NGZClVtkqiFUhjGP7KHoXtyO1?=
 =?us-ascii?Q?0PpwujNmXm2fObj8rooXlH/iimvaYHV0yc/h7zayxFfIGvofv82RCzmkcRvG?=
 =?us-ascii?Q?4Na4zijcLvIQ9nZ1ASmsJ4IwxNgLbW0SYgduBLOghhcd4s0bGL/ysJd8OS2O?=
 =?us-ascii?Q?MN/JwdH9TDOzeaj0V3kU4y9h6hCff+TASVEyezer/SJW6nuJm7SGBHqsLsK0?=
 =?us-ascii?Q?6e5q/Z2GYw5ziP9FdNRtt7XmLb1Uf8L7ldKncSVh18TafNkHdVkijJFeasrn?=
 =?us-ascii?Q?c+KSE8haYEoE2COmH+caTIw7Kble+LtNs38u2tbt+gSW5PIhLDdeQSQgHW+p?=
 =?us-ascii?Q?FZaUyb8by+m9PWUWfpqmdNb26yv1660RIGqOLy2DS+NptP/7I0ZbdASILU7K?=
 =?us-ascii?Q?7knzzXX6YA34LUazb6nswsFMyc5NiS7OrhlH7hnugcWeQpfuiE+z5XsWyWQX?=
 =?us-ascii?Q?Zbyhh9uywGZ0ljYvtQawyP6hh8LQJpZsF3hwy+9nrDub9RU0W26BBKTn0Mc8?=
 =?us-ascii?Q?RynKF3WvQ/WYZAR2cxayUZFtWNFr2lZLe7KM6pfsLEq1jRS4mnpl5uTjT3Ff?=
 =?us-ascii?Q?Rx1cyDsd1BKUIv0LOqUOD8e/NZnbCJQaYw73NLP3JdOi1fF4HJF/cGPMVDtq?=
 =?us-ascii?Q?1SllSDpL0PXmBt0gbHDXnmnvJGlNSDspPo1mK4tIQ1I+cxdjtvJUFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2F8x6/nUN7DlQ5PwaecuxGFp9jVn6TrcNQj/mpKfze4E/u1j3WVhozEb8XIz?=
 =?us-ascii?Q?Ql201Gi8JIEbNuZy59W+LTmchSmbyPhzEKMtiV1gd/1TfxRkThNVMjteZBmq?=
 =?us-ascii?Q?hSDL4GLPFahfrUOmGqTe8HFLibMxXCL5itAFASlne/RM/2Gx/zhUKnTSpORP?=
 =?us-ascii?Q?3c2OAlIgHAF/oN3L7UiClJs8HHhywyGDTfK0eTBuKuwjKXZNtzKmhlOBzKP5?=
 =?us-ascii?Q?e3OcX7M0e36onVrW3YFXcziOLtzawpBYcy1iUHdijUE5Q1nWpMNekuVfXNtg?=
 =?us-ascii?Q?S2jldQCYCgbK4fEy162ZpKBaYG7DWNf5FNKoRe7UHsdvbmIQ3hLMK/k/dmvM?=
 =?us-ascii?Q?3mTthJ1Fs0ZO+FrUAO0K5jPcUw+DW+Rbnel/CML2k9qjSqo7+CSPYubZMfMl?=
 =?us-ascii?Q?980J6qCsXj6XNqRpj7Qf84ckJjPxcwo698jRlYxXzKVciF9n9yqT3CPMjzUw?=
 =?us-ascii?Q?WfErDVp4W0BGUHAqUyKYgBibawd51S2MBtaxbF/n5Uaf8k301fP1hLtB49ut?=
 =?us-ascii?Q?syYII9Dkwlfv26hHLnSkVr6UCvgU5FQCHGblIhwOnhKcG5wdBNGJh3PZ3tl9?=
 =?us-ascii?Q?BvqTGh2sUld2dKlGp2QSvNGWf+3LLHUdxgyWE5Nlqp7Y5cus7IRuwiV5owjc?=
 =?us-ascii?Q?gtu9jNbJenXXld4kYXUR+0WjgVWf24Toa99xKZRmWTc0sGhCXhyMFCLgzcIQ?=
 =?us-ascii?Q?z5YWlSxgf/KOmQ2TUN0PgRqbQkCx0E4JmN2z2NpM8XpLD7TnfU6hBwanr8yr?=
 =?us-ascii?Q?NNuRI7m2zgzJYQ+gq+yHXGKd6xdLq66cxLG44cYTFWLPrwZUz0WvkDgbn3SY?=
 =?us-ascii?Q?Az0nge1kvSiDU8g79VTx5zFhVTXXO03QEcOwhwPHZmYbHQil9hr83AA54/gF?=
 =?us-ascii?Q?pD9wyn/k78OnQ2Vua0u+c3khC0UBEnjDosZWlSJVxr97ZuA5O7qs05K6chh7?=
 =?us-ascii?Q?zDXxw2r99jca+bJp582WuArVhjcxW8UeS1ZjAY6WYRHqsyUA2YQQR9vwlQBI?=
 =?us-ascii?Q?BdcVOCPVroY7X5uMZ3kpicaM99Ty6TfEULIjwKfqVGdpDYfeoa75jKB3Vzi9?=
 =?us-ascii?Q?TBrr60BFubxrlagpw3tJN+fi0de9MKyLcm/tmh0aQgIkasli3PfC0c9s6I6H?=
 =?us-ascii?Q?OBYzfyqQmfEJMjij2cmHCjA0r2VpH2OA2mRtexf8xuuJxq+YD/rxg16DXEU6?=
 =?us-ascii?Q?hSuJrEzd6EelHJXfMU047Pb7yYOL6aMArAdAX2mLdIWtVNiDp0c14dneAsU3?=
 =?us-ascii?Q?eJDtPIeIsmRUEZhfcZ5+8LIZmfAj8QiFwxExcYxMDjCHcaWzUe0vJgcGdiAI?=
 =?us-ascii?Q?psYJwlYE/wR8XUFtwTyXF0EroqUYwbW1wL3ftd7v8hM9zyiBNbrggycxoY9Y?=
 =?us-ascii?Q?ZKbGYoyS98aqIG7wTbJZTYFNGYjJ3GPsaZuEjnYSyjAqeybohgTHN1jZLg72?=
 =?us-ascii?Q?EjNKGurAK/CKUCUwDb4uBJWjuPEM8CMB6KDNCOub04rN9rYjvINSvBvZB0MG?=
 =?us-ascii?Q?6pUbUgf6qRm/rItZg8eKwYsn4CsrCo19ocB8QM0fQ5lPF18C1UrevC3iludD?=
 =?us-ascii?Q?ynydXmMPm/AksziFuTbApDWGo+dl3VaMqGChWDoT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2e70dd-2c8d-4462-4d5b-08dda3322069
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 06:36:24.3793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Iypch7n9MX0w/IEvqL6Ebn3PAJxBZurCWEiqAJ0ZVNWoDFY6V1z7jkMtjWa9eRgMpbWhDi4rhYQ39MtbFBS5vHyUT+cbo32dk5BIgeeQGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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
> Dnyaneshwar Bhadane
> Sent: 03 June 2025 23:55
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH 6/6] drm/xe: Add Wildcat Lake device IDs to PTL list
>=20
> From: Matt Roper <matthew.d.roper@intel.com>
>=20
> Introduce wildcat lake device Id.
> Wildcat Lake uses slightly different graphics and media IP versions than
> Panther Lake, but can still be treated as PTL for general driver flows.
>=20
> Bspec: 73951
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  include/drm/intel/pciids.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h inde=
x
> a7ce9523c50d..258273e8b794 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -868,6 +868,8 @@
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -	MACRO__(0xB0B0, ## __VA_ARGS__)
> +	MACRO__(0xB0B0, ## __VA_ARGS__), \
> +	MACRO__(0xFD80, ## __VA_ARGS__), \
> +	MACRO__(0xFD81, ## __VA_ARGS__)

Matches with specs,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  #endif /* __PCIIDS_H__ */
> --
> 2.34.1

