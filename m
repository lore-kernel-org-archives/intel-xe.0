Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36835CD3427
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 15:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC30B10E3C5;
	Mon,  4 May 2026 15:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3YyQpHx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CC110E3C5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777909661; x=1809445661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B59y7Qli8ezV19f1u42p2Bm6O7jvRyduFM++pktSdIs=;
 b=O3YyQpHxAcRevZ7u3bT7BifD7LsBHTr1ylGMCLFWjds8VIqA2HhK80d8
 iU+4IIOozE3Y5uYJuLE3KNqPaqgxg0C5ipIkrduzIpRe21F1hi34IMepx
 hr8UgggxtM+4kdH8kVmXex50ZlhkfoNqImxUGiIil3Qv5uqedV4AW6Ri4
 qKEDTa28fa2LLnrg0WdDu8pp376TeiXP3EUpUJajqflUcG2T+WQkvNmMT
 YaQ3DsNJQKrUoDuW94/YDDNrPfLKE8SMF7SuHbUzH0uLN4Kw5zry3By8l
 zZtGC36Mty1UhnadEwTP+hoIiY3JFZvAJIP6VKhBiu7BBQc4KOu7QmEIE Q==;
X-CSE-ConnectionGUID: n6I0m7wyS9SacXgVJ64Ydg==
X-CSE-MsgGUID: rqT7GUBXS4GSjfY0aC5mEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66300235"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="66300235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:47:39 -0700
X-CSE-ConnectionGUID: fqzJxB9ISY2Bygf/A/Igqw==
X-CSE-MsgGUID: FR2Djbt+TnWHRrbifl43Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="235416253"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:47:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:47:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 08:47:38 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0LPPqIOldrzhjI5tmQYYpVnwznZczMdDxtuMQ8TAlGW1FsSMP5W6Lo3PYqGgV07BQYj7LSA/Is/PDI3CRxbmm4QWiKTzLa9S34Q3Z1MGdETIYmqlKPOCvdb2gQsw1qU0gj9Jl2WXdPXyEgR90dxBRcbMSWHr39Q8J5sFG8fmn7enapsUkxiG08RNLS8DJYIU+KlaRrZ7VQSwk6Lqw3o9fp4na6vxTQGdvb+PNtlsZRlarMQTXnH1U9I+NpNbWKrtr/oQ0AtzekqJAru8lwX82C/b3zXYTjFiSJYxeeQ0yN2cvrZEL2YKhWjt4amUTv8L9S6yHukirLXoxqRSZSRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGJVBKdXsmGRJ6q9lo6NwA/ME7wtmDNNSPCFPSxE4fM=;
 b=TjeK46coC3TAdIb6hxeS2yxnykHSHaO0XZW4mJBQpTdVm2AlMYcwBcZMTFv7K2ADtcvVFk8XYP1vmuYizFTnF5qs/Q17eUir21gBAuEYOTDhBJxdVBtce9+ZqbrjBD6Fa/epU5O9CEI6ns65WGlifWzPhX+vo5tiFwbCU53rLVjkISFyMY1PSGeUFnxHtoH4QvXGfb/Inogg/ApqG2aTBHy2H5cVSjBJRzZ7lD9s+OBSijfQliyJ21M/9LcKpICt+zK7o3lr3VrW3u/jRa6cjp/6Yhm7+NpHav4Oe6+JTOv2wqNmPL1kI/fHb0AeW4aT/6lhfZXBebHSBi6huN/q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:47:35 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 15:47:34 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>, 
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH 2/9] drm/xe: Sort xe_config_device fields and defaults
 alphabetically
Thread-Topic: [PATCH 2/9] drm/xe: Sort xe_config_device fields and defaults
 alphabetically
Thread-Index: AQHc24Cg/jwjkdurxUG8NyK5kb3jcLX9/nSA
Date: Mon, 4 May 2026 15:47:34 +0000
Message-ID: <DM4PR11MB5456B057842B07F2656BADAFEA312@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-3-stuart.summers@intel.com>
In-Reply-To: <20260504044348.209625-3-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB5190:EE_
x-ms-office365-filtering-correlation-id: 01e81826-1973-470a-292d-08dea9f475f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: qw0e6CrvaBxRfzTt7710JTFUbgtNPF31EVfrgpAG9ZkiVlYUhchMZ0VND8AZHPGRZeZCTg/+qhQ+5naGUa4cLQE4kiCAKV9O/Ilsf26ZMwlrXgsiyS45mpKph1+rkSrbdW0xcBQjMc+52MzPAeD2H/wi6rW3V/0DOg1pGAXUVNYluQZMOhgFHVZIFO2LA+sCwxiCnp6RfCu10zGqAMfaB5Iz/nq2/wA7J8/axgTIete2CUvU3diOs1+vBBV6FXS/DLrH/G9S9P+j+6bdLnvUFkJiOwJBfEiKZQb+QQ+SMSlXTCxtbxhrM4ysoEm5POKD00yBTBAd8MZ3+TrtVhpf3gj2s7j3ZDMUgS5dkFAmmWE3EY/4faASS7IodD8UWZgw/bT84FEskq7pSNlahsoIwMKrDNNkX4+A1JqjrxczRRrVOJ0sV+ZmvxkaumIp7dJRd8TtRfxEMjWwOrLrD2A6Si1n6a6ENnjf44+4Jh9MvdtWLL58KfEqiVc4FZzzD5u3E/pDp1txp9KaPnXI0vHGLvHrUQVBk0EdDZA0eCCGJ0CbhbIx7XegKG6X8petSOhpSmz8O8XTqrFO8xKF9U0svIcY/ReXhPbUMRTlnlhcJXydmWRdmkIg8qkFrhVgsV7z84gkSWuXEpjutNRk4xJi5+QVlLYJ5BZwHdIzS3VreJJzE2COfNbJX89citp7DNyA6/jRwcxH7RGarFAkxeP06g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cLgsygT1/8LZtAVQv6+4cxKj4hljC7o85CfVPMXtmkLf6agXUII3WdPJKUqk?=
 =?us-ascii?Q?MrmHH6Ad/CUs8RzBzGX16Q8r220DijbKUvm8x18Ie5xZmlAQLYyF2QrRSJMb?=
 =?us-ascii?Q?DE3xhvzW6NKYmSm75Gvo6O7UuIZh/6zrt3cNniYO6Z3KQ5NAxy4aLXDL841H?=
 =?us-ascii?Q?da+/lgZEaZSSLi2ARhJTZbWvnQg8lvA08KDGbTArg7EndkYyFC13FUK/dCLB?=
 =?us-ascii?Q?6tFutvdXZyAK2IenIu+KbDrGqJlIYZalG9uhrnYSE4XrNvUjHVSljAV8/mGt?=
 =?us-ascii?Q?HOGrznvwTWBI/d/jRfeoQawwG078it5LekBrM6bi8K4qRwkHNyyJtdK/IpOR?=
 =?us-ascii?Q?XztYGq8M6y7HPevbzxdgx6g9dAqbC7++xRPlSpU1PdpyblMpIGzUTtY1WIEw?=
 =?us-ascii?Q?A/lxDi8VgMnNTTGUQAIsYjs90ls1WZSPXbVTdiSDXNrmxKRFmkanx6Yy6+LJ?=
 =?us-ascii?Q?JyHnMF+F0tNtyiunDSaQK/gNchlkKQYeW3HgT/eBknG6syayIzYEAv+L6yPF?=
 =?us-ascii?Q?tnHLbbSUyNrS+paTevceBN2nHSQGVRfuPARjii+Y2sIVXrbiQXnnD0WCWzBC?=
 =?us-ascii?Q?6KTyNor9eOnyERojvMfdbzI0gflGyTTZdFv341rOfe+GHDyx2zSbH5s8BWKs?=
 =?us-ascii?Q?i/krxReUvZmdB71RKGtRMZh34G3R2qvvZ2Ph92nKfIIO0RDcOMfizczr7wIl?=
 =?us-ascii?Q?TAbhWDdXMG26jldqB55bXI61JojAaWiM0YoV4NtB2HgGCJj/CV+XdqvvltuY?=
 =?us-ascii?Q?96w2DaiEqLTzlVG9Sv5md5+1W3SHc9sNroJiG5CRyszXfZSQUCOJl29f9dTS?=
 =?us-ascii?Q?oZOvuDmEGOZfi5OjxiTCpiDAaK2LtIPDpTrJJ3Tl5+ex9sJWMTF4QafHKI+t?=
 =?us-ascii?Q?+dt8a0yqYgpyY9WY2rz+cYKvnW/AVaVTc1rfiog2fFYw4t9e9vGyaAAqJVBW?=
 =?us-ascii?Q?3W0Imt+AS6PgbWi8FR5sBfyMqJpKHixmrZ+IZSa8ME0h4acwNAaKoEVza9KB?=
 =?us-ascii?Q?+KUG8Od05r+ztFqE+1eQLEqOOX6FHcQTtWEt7Kxd+Ll/M7Wh9zzC3AyEPKx0?=
 =?us-ascii?Q?cTZelbLso2f+K3p3QicsR+nP4/SRvT2FRRHKufKwRTWfuApqIrQlc7s5SazX?=
 =?us-ascii?Q?aaFWALCIEDLyvRHkNIx898ZkUOL7yW8nlbUjCZ/Kb4bOYNwAQ+TRkJK3vTiV?=
 =?us-ascii?Q?dLBdrYG0qEu/i88eVuGFDt2uJ1p+hJlyrinepVU4M163mxKs60Ha+aByClmI?=
 =?us-ascii?Q?EnygGuuSWHChNNcxLVzVAyEvbOpS1Zmijw5IXZFP53k9ceP7xllybgdpGL27?=
 =?us-ascii?Q?EeIBbAxg96Kj0V6HXZ0rgqbosC5G2VLArBRGFiJt6lo9zwhBiUJuMtirvMaR?=
 =?us-ascii?Q?gixKRVfVLtyQswnQVbMKZkwgW0jV092rGBfEfWZSwNp8N8et9JTK8gnfLVZM?=
 =?us-ascii?Q?Dz+g4R2liMMJ+7iIFDBpMMFE/DxQ5PYByh9VslgXbiLx0q+s2y6SXF22zDtA?=
 =?us-ascii?Q?wqhkRThgSQ36KF8KeS6ZN+Qkg2MTGc0PAgkR2i1aFeFUAfUQWoQLT5evImFU?=
 =?us-ascii?Q?7/Y1FpRy/HZukNdc9sFSeDIQdTJ96TBCbAbP4nC1KD0VFWHurx38eeyLdm2g?=
 =?us-ascii?Q?olnJWSJQ/UScsdq0vrpkunzpiw6W7OFKKOCuFW/qzaBg7B7pfGLD6vcYnSkX?=
 =?us-ascii?Q?GRAdGSLvByMaX2HieQqdJ+4M0p8XQS4WaVANw/8NHp9LHx1JZa2tUZFDhb1W?=
 =?us-ascii?Q?6ZfczjE2tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wp2Ezvyzkw3gAUd7piZTqgYo9uuIGa4eHRwGBkZtN/JZpTfKRpVgkN0+1sfl1xZXgGqzOSR+k+vCtlKJNrxghZL5Fw4mQ4bpK2eVdshtevGlwEYNsMJ+lw+7J2Q5PT4k2BZXQdvgUh7YXFhM8y+uDNbUScztA6IIRr8uFKJW8HenPfBTxIZ4r4uRqU+dvf1M5eiZkGBBIfpNSU8/2wvNf/IItwoFmH9WKAI7o7nUPQG3/6bDTeKKbVhatoycWx7ARAlhMzAfAeuqbSTHCkuUZBHG9/Imj5RLZFX929nZu4QM3HNNwDx7g6Ui0oVz3bg9pRdwHFhWvRde40Zt/UwUMw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e81826-1973-470a-292d-08dea9f475f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 15:47:34.8611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zNGBTQCRupKEY9w0dOjGlToC0n6t0tm1MbALcfRvpzliNpPQgJt8iDwVmvPDDqeWzOYgPKYFso+gx+kRRpfpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

On Sun, May 3, 2026 9:44 PM Stuart Summers wrote:
> Sort the fields in struct xe_config_device and the corresponding
> device_defaults initializer in alphabetical order. Non-SRIOV fields come =
first
> (alphabetically), followed by the SRIOV sub-struct with its own fields in
> alphabetical order. Also sort the PRI_CUSTOM_ATTR calls in
> dump_custom_dev_config() to match and the documentation for each of the
> fields.
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-4.7
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 192 +++++++++++++++----------------
>  1 file changed, 96 insertions(+), 96 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 69abc69ec0f3..1e134057fae8 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -73,53 +73,79 @@
>   * Configure Attributes
>   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   *
> - * Survivability mode:
> - * -------------------
> + * Context restore BB
> + * ------------------
>   *
> - * Enable survivability mode on supported cards. This setting only takes
> - * effect when probing the device. Example to enable it::
> + * Allow to execute a batch buffer during any context switches. When
> + the
> + * GPU is restoring the context, it executes additional commands. It's
> + useful
> + * for testing additional workarounds and validating certain HW
> + behaviors: it's
> + * not intended for normal execution and will taint the kernel with
> + TAINT_TEST
> + * when used.
>   *
> - *	# echo 1 >
> /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
> + * The syntax allows to pass straight instructions to be executed by
> + the engine
> + * in a batch buffer or set specific registers.
>   *
> - * This attribute can only be set before binding to the device.
> + * #. Generic instruction::
>   *
> - * Allowed GT types:
> - * -----------------
> + *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
>   *
> - * Allow only specific types of GTs to be detected and initialized by th=
e
> - * driver.  Any combination of GT types can be enabled/disabled, althoug=
h
> - * some settings will cause the device to fail to probe.
> + * #. Simple register setting::
>   *
> - * Writes support both comma- and newline-separated input format. Reads
> - * will always return one GT type per line. "primary" and "media" are th=
e
> - * GT type names supported by this interface.
> + *	<engine-class> reg <address> <value>
>   *
> - * This attribute can only be set before binding to the device.
> + * Commands are saved per engine class: all instances of that class
> + will execute
> + * those commands during context switch. The instruction, dword
> + arguments,
> + * addresses and values are in hex format like in the examples below.
>   *
> - * Examples:
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after=
 the
> + *    normal context restore::
>   *
> - * Allow both primary and media GTs to be initialized and used.  This ma=
tches
> - * the driver's default behavior::
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
>   *
> - *	# echo 'primary,media' >
> /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at th=
e
> + *    beginning of the context restore::
>   *
> - * Allow only the primary GT of each tile to be initialized and used,
> - * effectively disabling the media GT if it exists on the platform::
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> +
> + * #. Load certain values in a couple of registers (it can be used as a =
simpler
> + *    alternative to the `cmd`) action::
>   *
> - *	# echo 'primary' >
> /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> <<EOF
> + *	rcs reg 4F100 DEADBEEF
> + *	rcs reg 4F104 FFFFFFFF
> + *	EOF
>   *
> - * Allow only the media GT of each tile to be initialized and used,
> - * effectively disabling the primary GT.  **This configuration will caus=
e
> - * device probe failure on all current platforms, but may be allowed on
> - * igpu platforms in the future**::
> + *    .. note::
>   *
> - *	# echo 'media' >
> /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *       When using multiple lines, make sure to use a command that is
> + *       implemented with a single write syscall, like HEREDOC.
>   *
> - * Disable all GTs.  Only other GPU IP (such as display) is potentially =
usable.
> - * **This configuration will cause device probe failure on all current
> - * platforms, but may be allowed on igpu platforms in the future**::
> + * Currently this is implemented only for post and mid context restore
> + and
> + * these attributes can only be set before binding to the device.
>   *
> - *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + * PSMI
> + * ----
> + *
> + * Enable extra debugging capabilities to trace engine execution. Only
> + useful
> + * during early platform enabling and requires additional hardware
> connected.
> + * Once it's enabled, additionals WAs are added and runtime
> + configuration is
> + * done via debugfs. Example to enable it::
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * Survivability mode:
> + * -------------------
> + *
> + * Enable survivability mode on supported cards. This setting only
> + takes
> + * effect when probing the device. Example to enable it::
> + *
> + *	# echo 1 >
> /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
> + *
> + * This attribute can only be set before binding to the device.
>   *
>   * Allowed engines:
>   * ----------------
> @@ -147,69 +173,43 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * PSMI
> - * ----
> + * Allowed GT types:
> + * -----------------
>   *
> - * Enable extra debugging capabilities to trace engine execution. Only u=
seful
> - * during early platform enabling and requires additional hardware conne=
cted.
> - * Once it's enabled, additionals WAs are added and runtime configuratio=
n is
> - * done via debugfs. Example to enable it::
> + * Allow only specific types of GTs to be detected and initialized by
> + the
> + * driver.  Any combination of GT types can be enabled/disabled,
> + although
> + * some settings will cause the device to fail to probe.
>   *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> + * Writes support both comma- and newline-separated input format. Reads
> + * will always return one GT type per line. "primary" and "media" are
> + the
> + * GT type names supported by this interface.
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * Context restore BB
> - * ------------------
> - *
> - * Allow to execute a batch buffer during any context switches. When the
> - * GPU is restoring the context, it executes additional commands. It's u=
seful
> - * for testing additional workarounds and validating certain HW behavior=
s: it's
> - * not intended for normal execution and will taint the kernel with TAIN=
T_TEST
> - * when used.
> - *
> - * The syntax allows to pass straight instructions to be executed by the=
 engine
> - * in a batch buffer or set specific registers.
> - *
> - * #. Generic instruction::
> - *
> - *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
> - *
> - * #. Simple register setting::
> - *
> - *	<engine-class> reg <address> <value>
> - *
> - * Commands are saved per engine class: all instances of that class will=
 execute
> - * those commands during context switch. The instruction, dword
> arguments,
> - * addresses and values are in hex format like in the examples below.
> + * Examples:
>   *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after=
 the
> - *    normal context restore::
> + * Allow both primary and media GTs to be initialized and used.  This
> + matches
> + * the driver's default behavior::
>   *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> + *	# echo 'primary,media' >
> /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at th=
e
> - *    beginning of the context restore::
> + * Allow only the primary GT of each tile to be initialized and used,
> + * effectively disabling the media GT if it exists on the platform::
>   *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> -
> - * #. Load certain values in a couple of registers (it can be used as a =
simpler
> - *    alternative to the `cmd`) action::
> + *	# echo 'primary' >
> /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> <<EOF
> - *	rcs reg 4F100 DEADBEEF
> - *	rcs reg 4F104 FFFFFFFF
> - *	EOF
> + * Allow only the media GT of each tile to be initialized and used,
> + * effectively disabling the primary GT.  **This configuration will
> + cause
> + * device probe failure on all current platforms, but may be allowed on
> + * igpu platforms in the future**::
>   *
> - *    .. note::
> + *	# echo 'media' >
> /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - *       When using multiple lines, make sure to use a command that is
> - *       implemented with a single write syscall, like HEREDOC.
> + * Disable all GTs.  Only other GPU IP (such as display) is potentially =
usable.
> + * **This configuration will cause device probe failure on all current
> + * platforms, but may be allowed on igpu platforms in the future**::
>   *
> - * Currently this is implemented only for post and mid context restore a=
nd
> - * these attributes can only be set before binding to the device.
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
>   * Max SR-IOV Virtual Functions
>   * ----------------------------
> @@ -256,15 +256,15 @@ struct xe_config_group_device {
>  	struct config_group sriov;
>=20
>  	struct xe_config_device {
> -		u64 gt_types_allowed;
> -		u64 engines_allowed;
> -		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		bool enable_survivability_mode;
> +		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		bool enable_psmi;
> +		bool enable_survivability_mode;
> +		u64 engines_allowed;
> +		u64 gt_types_allowed;
>  		struct {
> -			unsigned int max_vfs;
>  			bool admin_only_pf;
> +			unsigned int max_vfs;
>  		} sriov;
>  	} config;

Here is the comment from [1], which seems reasonable to me.
"
Does sorting struct members alphabetically here introduce unnecessary memor=
y
padding?
Placing the bool fields enable_psmi and enable_survivability_mode immediate=
ly
before the u64 fields engines_allowed and gt_types_allowed introduces 6 byt=
es
of padding. In the sriov sub-struct, placing the bool admin_only_pf before =
the
unsigned int max_vfs introduces 3 bytes of padding.
Could these fields be ordered by size to minimize padding instead of being
sorted alphabetically?
"

If we decide to sort them, we could add comments like below for the flags i=
n struct intel_device_info.
" * Keep all flags below alphabetically sorted"

[1]: https://sashiko.dev/#/patchset/20260504044348.209625-1-stuart.summers%=
40intel.com

Shuicheng

>=20
> @@ -277,13 +277,13 @@ struct xe_config_group_device {  };
>=20
>  static const struct xe_config_device device_defaults =3D {
> -	.gt_types_allowed =3D U64_MAX,
> -	.engines_allowed =3D U64_MAX,
> -	.enable_survivability_mode =3D false,
>  	.enable_psmi =3D false,
> +	.enable_survivability_mode =3D false,
> +	.engines_allowed =3D U64_MAX,
> +	.gt_types_allowed =3D U64_MAX,
>  	.sriov =3D {
> -		.max_vfs =3D XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF,
> +		.max_vfs =3D XE_DEFAULT_MAX_VFS,
>  	},
>  };
>=20
> @@ -814,17 +814,17 @@ static ssize_t ctx_restore_post_bb_store(struct
> config_item *item,  CONFIGFS_ATTR(, ctx_restore_mid_bb);
> CONFIGFS_ATTR(, ctx_restore_post_bb);  CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, enable_survivability_mode);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> -CONFIGFS_ATTR(, enable_survivability_mode);
>=20
>  static struct configfs_attribute *xe_config_device_attrs[] =3D {
>  	&attr_ctx_restore_mid_bb,
>  	&attr_ctx_restore_post_bb,
>  	&attr_enable_psmi,
> +	&attr_enable_survivability_mode,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> -	&attr_enable_survivability_mode,
>  	NULL,
>  };
>=20
> @@ -929,12 +929,12 @@ static ssize_t sriov_admin_only_pf_store(struct
> config_item *item, const char *p
>  	return len;
>  }
>=20
> -CONFIGFS_ATTR(sriov_, max_vfs);
>  CONFIGFS_ATTR(sriov_, admin_only_pf);
> +CONFIGFS_ATTR(sriov_, max_vfs);
>=20
>  static struct configfs_attribute *xe_config_sriov_attrs[] =3D {
> -	&sriov_attr_max_vfs,
>  	&sriov_attr_admin_only_pf,
> +	&sriov_attr_max_vfs,
>  	NULL,
>  };
>=20
> @@ -1096,10 +1096,10 @@ static void dump_custom_dev_config(struct
> pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>=20
> -	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> -	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
> +	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>=20
>  #undef PRI_CUSTOM_ATTR
> --
> 2.43.0

