Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA2BCCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DB410E443;
	Mon, 13 Oct 2025 16:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKJVY/Ca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DDD10E443
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760371941; x=1791907941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ew8ILjijMfGM/uNRI4KDQv4QaYv8SSp+47reNgiQ46I=;
 b=dKJVY/CaE65fmqQQfOAZ63zSLrFKrCEDtzEBtsDbksBnDpNtBT/Icg0q
 WQei4BM0OTS9OZfx0zV6MjNKTZ/oeWGvq7c5KKFaLKIgcqB4xrcq7CX9e
 at5rACC0NtxCiJclFhTi5VGgbFkFFraGcjnalksg16nOFwf/gqvB2EWhc
 dZg3iD123WZ/hSordqNcKOfO1VzkB722Qmh4XcfnwMBp1uJ56Le0NKmmE
 gmVk/3nDNMp9trKIjQDFIHl8gtgVj2+G3rp/7BSQExU2TM+QbX33RFsn3
 cKh7Yt+jhaQ5hA3TEbN+oJ+W+x6ssgElWljNah18wEi3IkX6bqPnQ7MIX Q==;
X-CSE-ConnectionGUID: sTc4WO2nRjmJmOIHNt+TGA==
X-CSE-MsgGUID: hgLS1N++QjmqEMaj8S5iow==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="87974050"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="87974050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:12:20 -0700
X-CSE-ConnectionGUID: veuxuPFWRE2Wggq+xwcUYg==
X-CSE-MsgGUID: 4OV67dLlRKSqK0yugtDKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182061209"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:12:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:12:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:12:19 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRlIw+nLGipqSpfWDlUdjpWLG9Heyrz0f7tsSpF1NEqNKk1/Fz8qS3DycLN1pKpTT4k9sV3WgUP4ONzEdH52pJ4FpQIOVrwrsXV1Fa+w7Go3e93ChhAGMlLunk0x5+AhZm3iq0kmyWbYdRH3xIz62ONE8lkdTqKZtDawTIs6jxLmTnSvoxRmlGtz5ZMyY0c+w2I+h2tcJ7z3a95+9WOj+6aymoef6r6riUcx9iJ6Zdm0WY1XTtk9YCXxuUpgUxkWnqPzvYGC2VaezU8L1Wxxcp0PA9qF97gHYZPdQqn2pGJvFQXtWv//rRUExxAgfaNEEboydbRfzLNYsO4ryXSFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfydT4WX/Dd1RMBBKWP5eTPhxkFdwvWtehpCYgUYj5g=;
 b=rHAbIx8rvR94Lhg83Irjmpdn7iHH0R6OO4Hz3jQ0MOasm/Gw8+2UTy4CrqyhlqKzb2wne3Xp89+JbG/dRunS5qnvJI9RnFSRmIIr5db0SGLi3do28ALlS78xPsN91mL+RxFbBxTd4SVPaZvDEBnuoAYTzn8PIAwUwZI6xNTzb2GWTPP6yuBJtQJqpZlwv8uiIcmjY0VdTBHJ/ycevpNUCq8lpiAuySCCPYoOHy0OJpCY3jN1DjYOgcwebxneInrxJQxtqK0060f0/aBGl9j2CzyUhgEufRxE9I/SpwK1ONuHv3+7hINgD4P6beNBeiBLqsVqNbCFSUZ4CHfh49yLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB8810.namprd11.prod.outlook.com (2603:10b6:806:468::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:12:17 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:12:17 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/kunit: Fix kerneldoc for parameterized tests
Thread-Topic: [PATCH] drm/xe/kunit: Fix kerneldoc for parameterized tests
Thread-Index: AQHcPFZvc3/5zHPDn0ehGxwrazkZ17TAPviQ
Date: Mon, 13 Oct 2025 16:12:17 +0000
Message-ID: <DM4PR11MB5456D2EF79F61606445D2D36EAEAA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251013153014.2362879-2-matthew.d.roper@intel.com>
In-Reply-To: <20251013153014.2362879-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB8810:EE_
x-ms-office365-filtering-correlation-id: ca43643e-9c42-4e8e-9152-08de0a7347e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?MfGTXQX0uMG3NR6OPII8zE9Jyn3No2Yu21Y6vtrHDZdbG2cV0cQSYDn6WtMo?=
 =?us-ascii?Q?28XXcwJbdE7HPIPBG5zidrjaYCa/K0Hb+TrbwRtBbueT8guwh1ihyv2FlLy6?=
 =?us-ascii?Q?vpRwaC1uWeH0GeKkc8JpdnANTjMQQbiIRWQLcUrND2LDqKm2ZIjUksDjrjYS?=
 =?us-ascii?Q?g6RHghN9K7Ty0AlV8RBr7GC2Mfcz3LYwlvqqXGIjhqc+c0P7gHOMx4/Px7on?=
 =?us-ascii?Q?QFrpXtsUVqpuLshu8LPgED+KNH3dYrjaQiODF/ac6gzpK+mH+TT6bT9W9f/y?=
 =?us-ascii?Q?6ZUshwApKfw6tapDRzJS6NHOK7BrTQVjXiSdw/WtWbac21IcCYQLlQKKRqJn?=
 =?us-ascii?Q?T0xYC9DGd3bYkaU8XusDYMhCRb9p56s5MFN8+Y4tQcf59GBH+63I4VLOtS5c?=
 =?us-ascii?Q?bUh+dmeM8t6TzJxEzCGf00LpTqBsU3QbvfWgSSa2ciMpSBmlO8h7gwKf1NEQ?=
 =?us-ascii?Q?n4+M7QyvrYj4XJiuxSWkRrj6kybByEhocJhLBaOIl3fWwfNPVi+KqjrPaBVO?=
 =?us-ascii?Q?foWeFvdUDJjgyhnmBz2p6NgIOUkqlxhLvY4W1sBwNyobJ6md4CrMcwZk19MX?=
 =?us-ascii?Q?9vDXX9z6+GAOShM3IL2S2at4s0Lg2jftOJVvigf++Xtp0BICtWHAYsPOmENc?=
 =?us-ascii?Q?1Jxgct6dmNMsaVYsV6Xq4B9RvptWNgHA4YFlXSehfvzSuPOANqeZigdIPfWM?=
 =?us-ascii?Q?LRO+ZR0eroKHps7l3HQ1Rprpb6uzdHc+60qjeVhTqqSlvYCPbcZTL2XJE3PQ?=
 =?us-ascii?Q?dsrEC7QQRyP+GfIshWePh0sV4tjqecEozliIrrWcMxIOrX/6Ai898q2RWfcN?=
 =?us-ascii?Q?xu1lXT/M1r3s6yvYxlin41pKwHVa5q+U940zGg5GgEWyXGARrTvgljGUgpb+?=
 =?us-ascii?Q?QlajZm71vltMK16hiThfUJblgdBM3v23E4ucCCV0vszQ4iLfzX1QpP2df/Ak?=
 =?us-ascii?Q?GpUMFl7iQG1G02avyhO4Ioh82R6x5O2dLdWnLqnoXDr6dG5RmpPzCMPVi1B3?=
 =?us-ascii?Q?1qy348kFv5MQYkWxRFM8Ouz9ewJ7SgHd5QENoBBJykE5zIwEzQAjV31+KKH/?=
 =?us-ascii?Q?L/Eb7SvT9FPRYxoXYXGUw76T1k5y63iCqV1Iycsw+lFH2VRYCGiBFIAWjX2I?=
 =?us-ascii?Q?VDAA3ohE2nr5NMrkdiwQRBZDIXkMuGr6JmOtMASgL2UflDyd8zH+faySni9m?=
 =?us-ascii?Q?5XDoCbHjBzrBAr8Z28+66S+G+uYDUXJxa25490RPMbP11BiuObYDAp6mymbk?=
 =?us-ascii?Q?nQQ/mMa+RjZmLYq/1oMSkPxAbbZ2Sipl8MEsT7I7I4zWYlpFLGS1Io0vj4bE?=
 =?us-ascii?Q?RG8cji//PzKtO/OnW8Bj+2Nsc4RR7d+n6/HNCpJQmpvZM5Z8E6vF1VjXumDO?=
 =?us-ascii?Q?2Npz3FwiNlTZ13J3oiBzyqX4tpjqLnUkTMNZOR99mXiDTPHSXxTE9BB3GZ0M?=
 =?us-ascii?Q?ZOWbNTlBrqjcnR5fqePN6NDGLwoAt0w96bssX/jx76K3bRzUtyhoJDFQ8xXG?=
 =?us-ascii?Q?DCVs132TvkSUF+n01dSKP5/xO1i/RZFjVHej?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ris9puaU7m4Msyf8yEVWFucI2uiLrrDDvoaDSEQBVX3vOWOFy/rPkw4HMp8H?=
 =?us-ascii?Q?sMogfyKU6IZ1PMShYQO+1wY5OzSt4ytzJILSSMdFYcGJVDXaL35LxWC1Uwbh?=
 =?us-ascii?Q?PiqGYQbs5FaExKdj3tz7X8u7DDs32YCCKLkiAzI8k7iZstyifeHOHrsCVBSZ?=
 =?us-ascii?Q?CYbHtDA0PXky/uA3z8S+sYHz6iB7E9etAqMu3Rhc5I/xXwc1CjrYgX2ZPc6v?=
 =?us-ascii?Q?9Rh1VxcgpEmpFyaCHlA5NZdbbnuqYqbQwCjtrwD4tfwPqi5TsR/6C+2rMTOg?=
 =?us-ascii?Q?VSqVbxGEiwyyrtn56PtEYyQN+Ai1flB6M4du2Ted5ekEoqcu9+WGZHuzJiBN?=
 =?us-ascii?Q?HEWTPhPuBXMPD2mdk6V1pD9UsLhUq7qY5GnnZ9N68stMnQ+jKwReCC2QGzHp?=
 =?us-ascii?Q?p92ifO1AxO83LDlFvrVfELhz4xSKvIcyTnBc5LNUDcsF1nESu0y/HLze9g7p?=
 =?us-ascii?Q?AUKUwa9WaObhBnnqRFBGqTUIyONiD3BVXB0VN0AgFTfgHsJQUuoIqnSwSvYo?=
 =?us-ascii?Q?nvKvRWMj6W5TjbIphc/XFgH9mzsV6epcQm8MV8hK7WBKQVxldpWHEy4a2HFp?=
 =?us-ascii?Q?/IJF5S5MJyaoEaeDFQjikgGhhOUSjthSQS4lvKBadtV/XVSKkGKChiuxBLr6?=
 =?us-ascii?Q?Ssecj5olK7Fab3tuVHntPX2dMhm+kbC7FwoAHZTPYkSOPm1rGwP+J4IcVhkE?=
 =?us-ascii?Q?vhAlfRHnL2u+Z2/ULCIYXcIQdVHoGbjmGLSA6wif82naxMLdcLSOLJcamG40?=
 =?us-ascii?Q?zpfcP/5mm1mzSWlGCFf+TJGBqp6ht/fXQC9SIyg15pxbbX3M0/xZlevIt/yF?=
 =?us-ascii?Q?dqGDBKnXNU6t/epfle127yfkFnN2SVV6E8H7AVysnjEoufukd0JsDdDkgO2p?=
 =?us-ascii?Q?z0YKOyNUQp9uHVG+bpBP5IJxTHK+hx8jhP76JsAr/1d+rdXM3W7V247GqPsa?=
 =?us-ascii?Q?js6IiGMZGM4PNeRWdvg3yO66EOWBjcaftM4SszB42af86jRljCzwHgRtPBRG?=
 =?us-ascii?Q?XtP1VZT1yy0HCGlkOF9BKnRFQgLi7ytUl/hzAtXD3aGik7IXU7IN5/bJTy5y?=
 =?us-ascii?Q?BNuYx5H/3XQiHB5dFTmKMPV8Hv64NWySvhk55A+aN8OIHOUCHm9CKAS7zmVd?=
 =?us-ascii?Q?VV9OoiFO9VUcr7xO2RG27mH4kVto1u/XMtDfKuUDikcug8WBLwVsMtKbQbDE?=
 =?us-ascii?Q?aBaQSozRy19c28V4zgDTBfR0rcfbKvorvUSGpOmvMWLY4lGY5ytC8vXrtvif?=
 =?us-ascii?Q?QU9vHX9DdNFCRNy5rImCJ6GBWodCz+PZcokOLuz7B61WCy5VJtioNmnqQwWJ?=
 =?us-ascii?Q?cxd6sDtTj6MtV1ZbE7uD4r2PMqXR9lkuKs8V7UQIvMnsISRmKA/XL9FnceJe?=
 =?us-ascii?Q?xI6zRI3aDsfR5fadE897msLglPkJC4ehZyhIcAXykY9U9L/1Ob13eSTrozV3?=
 =?us-ascii?Q?yUXO3/gUJfd9uys4o8oPCIPnn32Q4CEa1OFDlB0cnLhoxq+ihOuPsN+5ZyiP?=
 =?us-ascii?Q?6v8OQHIVnNsT8ZpatAd2GSMOcN4hJ/hNETHh/pB7hwk6Y6vWSJRmCAOvy5gY?=
 =?us-ascii?Q?rvL0gHCtrhhYjxKRs/lNDfbuQOVgXzgVv6DdvfNC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca43643e-9c42-4e8e-9152-08de0a7347e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 16:12:17.6873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJ7NtUPSBIAXcuhNjNmhuu4om7AOb7qQqIQnialpkRYfjnRG9FQTif3PBQw40TKKZoNSGEJ2i/EEyGqAfELUug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8810
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

On Mon, Oct 13, 2025 8:30 AM Matt Roper wrote:
> Kunit's generate_params() was recently updated to take an additional test
> context parameter.  Xe's IP and platform parameter generators were update=
d
> accordingly at the same time, but the new parameter was not added to the
> functions' kerneldoc, resulting in the following warnings:
>=20
>    Warning: drivers/gpu/drm/xe/tests/xe_pci.c:78 function parameter 'test=
'
> not described in 'xe_pci_fake_data_gen_params'
>    Warning: drivers/gpu/drm/xe/tests/xe_pci.c:254 function parameter 'tes=
t'
> not described in 'xe_pci_graphics_ip_gen_param'
>    Warning: drivers/gpu/drm/xe/tests/xe_pci.c:278 function parameter 'tes=
t'
> not described in 'xe_pci_media_ip_gen_param'
>    Warning: drivers/gpu/drm/xe/tests/xe_pci.c:302 function parameter 'tes=
t'
> not described in 'xe_pci_id_gen_param'
>    Warning: drivers/gpu/drm/xe/tests/xe_pci.c:390 function parameter 'tes=
t'
> not described in 'xe_pci_live_device_gen_param'
>    5 warnings as errors
>=20
> Document the new parameter to eliminate the warnings and make CI happy.
>=20
> Fixes: b9a214b5f6aa ("kunit: Pass parameterized test context to
> generate_params()")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 5 +++++
>  1 file changed, 5 insertions(+)

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c
> b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 69e2840c7ef0..663a79ec960d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -66,6 +66,7 @@ KUNIT_ARRAY_PARAM(platform, cases,
> xe_pci_fake_data_desc);
>=20
>  /**
>   * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data
> parameters
> + * @test: test context object
>   * @prev: the pointer to the previous parameter to iterate from or NULL
>   * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>   *
> @@ -242,6 +243,7 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist,
> xe_pci_id_kunit_desc);
>=20
>  /**
>   * xe_pci_graphics_ip_gen_param - Generate graphics struct xe_ip paramet=
ers
> + * @test: test context object
>   * @prev: the pointer to the previous parameter to iterate from or NULL
>   * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>   *
> @@ -266,6 +268,7 @@
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>=20
>  /**
>   * xe_pci_media_ip_gen_param - Generate media struct xe_ip parameters
> + * @test: test context object
>   * @prev: the pointer to the previous parameter to iterate from or NULL
>   * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>   *
> @@ -290,6 +293,7 @@
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>=20
>  /**
>   * xe_pci_id_gen_param - Generate struct pci_device_id parameters
> + * @test: test context object
>   * @prev: the pointer to the previous parameter to iterate from or NULL
>   * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>   *
> @@ -376,6 +380,7 @@
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
>=20
>  /**
>   * xe_pci_live_device_gen_param - Helper to iterate Xe devices as KUnit
> parameters
> + * @test: test context object
>   * @prev: the previously returned value, or NULL for the first iteration
>   * @desc: the buffer for a parameter name
>   *
> --
> 2.51.0

