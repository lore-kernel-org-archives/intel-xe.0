Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C66F483D6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28AB10E15E;
	Mon, 23 Mar 2026 16:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsrgpGnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8934C10E15E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774284096; x=1805820096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6eQFBSEbggQcwoQKEkrhWNft3SGkfOAWMyQZ/VfwDZI=;
 b=GsrgpGnUmhkps5YYKhl8jxvYarE4GHfnpnXkL75plU++G6euuXX8aGWe
 xIwKy5Lp/hLFATF3dMwIYfPTZs3aeVx+WyH7dDy3wmK4MblSXBoQyk/Rd
 /z6mfoB3y6cQGL5f6aSdHH1bp3Ce18jC5IqZwoUmM/helz1ByPoJov4HH
 U5hhvVrg6j1dXqjIqes8Xzd03+NlJFWPVBvFqyQ4eMOIK/gECA6/8iFyH
 QM5N9juKs3nuARfdo9qOK26BFSZKS2I+B+i7bSZwRsLOjmak/DJpd4cc2
 xjp2/CvnGobqimf+3Rn/yEsuecwN6gFiZCDenuiDwpZqounUXcFTdEtUX g==;
X-CSE-ConnectionGUID: cdbFP9RsTSKMrGUZKrLpXg==
X-CSE-MsgGUID: zlNIJjXDQzKGgxF5BH3P2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79198292"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79198292"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:41:35 -0700
X-CSE-ConnectionGUID: pVpvuUjfRFyMMlLrOXQH+g==
X-CSE-MsgGUID: Tk6ysQk9SGuTzhXvCe3mbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="225779959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:41:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:41:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 09:41:32 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6k2DxiyyhrYth9JTj45k1f0ELeHBLOAQSpzpu44V38hGP3RGQcJiaRuuV518AoQukUy2CTrWyq63C0D5KQfKWPIj2idfj7ziBQMyLVm4HZjmNC4QFE1uKNAt/SfyJO67NJzyNXT6+2AWEJOZP0mz7gfftY6aIDLLfVmBY3pMtBWhxyzbZ0faISWuPZqshqTp0hUxIKZkJN0+ck8brj/7jRkyTHihvyWncSqGSRt4cr0sV9BBJ46WLKT36uBJi6+L76kMB3wnIq8KzT9KFeRzKYLNbH5NQKIjd/QTEK2NAQWJaWo7QKtJEIJ2YpA5+2CxgZoMf4s+H1X0fygZ9NzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM+NCQ2FvgUdvXiOy4QAdWgkx7Ot3coWAQYMMB2JKng=;
 b=R+Dja3Yx7g8KmLnFDC8N/uSS52t37ZwaL8go4yOSxjJEmuWT+KYiN4pp38ERhX39UtQTfGGHzB/vznl7/N+Ja/z+aGkZS5EIWXWuW79hD4T4k8WQLQMltFnw4HqR30ZRjMBlm58tLEs8BqXW9JDMMHA3rPtwUsM7WjwCaAewSJqye96sR5E8uTRb8VJF38E6Pv4agZiWkDHT6+Aetv4Se4f7R/OWSMo3Pl12JF7iASE5LuX9bq3cAYKtuCZLLQmRb6YJmyv+O39HtN0dOP752aRG0nZ8XfEkToDkZDKCfQX0VWHF8iLUUZX+hDUSOhO6pEATyRzev8tDDQzn4e9jwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 16:41:28 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 16:41:27 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
Thread-Topic: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
Thread-Index: AQHcutbTDwT7/IezNk6ghGwsY8sN37W8UGuA
Date: Mon, 23 Mar 2026 16:41:27 +0000
Message-ID: <IA1PR11MB641869B65AAAAC64304A5AADC14BA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260323151331.4043749-1-karthik.poosa@intel.com>
 <20260323151331.4043749-2-karthik.poosa@intel.com>
In-Reply-To: <20260323151331.4043749-2-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS0PR11MB7336:EE_
x-ms-office365-filtering-correlation-id: 47706f63-2acc-47d5-762f-08de88fb0776
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: o6exBHI+0VBNAkucDSpGh2UOTlmD0WXLcbsCa0iI/Nj0NTRRoGqnjFP/2Jo/0TCxCrobHNihc6IxMJm/IK1Xw4ZFTyzIjIR28FunyMHi0XAnF17ijJEoWomnikq2uGoY6uM6NR+PlbKhgs7LJ+rQxGQdkvU/JswT3Dtzt1q/5XsoVAokPCTn57HY02rHyP/rUMPPESRZb0FrAHGOTKdf2/tAL9OsIv32CYEDNJmAzWPdGTMDig9bZzArC+e+rDztGJ9MSDEJmgtRkgW1FfjpP020EHqqjWi9ClzUWoolYdZzUp+DgScnlUh9rJLMumsS8Ic+oLTXF0+4m/FQnektWhwdrp69Zyx1g8we3i+1A8ORLvi1n9pc6glVC9quw76PKxxW9Xl1d7ZBhFph705XEMoOp6r6GIshESDysVp/N3LwSdYGlsRmcMr3TB33ieWWB9Bxo3mMbrm31JQbV8DP5K6e+321MIgUt9PCJfXAf3QEZAOamO0BTwFSOrjxvAjrGURDIfoyAayCekbWKWVBn3ucVLMXVZhx2RuqEjfiRd1T/lqVns+61CoUlQCyxaSMWqtC/3ZCcnPBPjwPuuHb1x22G/X4ornyoLL0BxH+wQns4JTYv1gEFhpB5pVCwwkYr4PMiJEyyj9w4fmV4nl0RGNZRwFaFFeTnqIzcj4v7q6c0Sg63RaKOCE8HqB6CGxMU0itbjuIC84yZKEb37KI5Ux9BnDuICRq1d+5GolZPFq9/DtgvEFO4bHv+WE3KYwa+UKbqtJQliLxO9DBRClDGu1EEfg8fx0CX/p4Mbx/AhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2seotrSBNbGHwMrrhWDvlZIdVtztLhJ7W1Bh637B5OXvkMjAhgzORszMWAgb?=
 =?us-ascii?Q?JGkHlZyE6fScdOPEFogrTxa3rjOqf/9a+D4pHUBqGPSCxYTfiQcE2Jx1UT4N?=
 =?us-ascii?Q?duvVWbIQ0oGN/DfJC9+72bfhyQzH4t0yyJRK4pcxZ+NNhFjG66Td8QWWnoCZ?=
 =?us-ascii?Q?EwbA70k4fWr8vBOtocO90b8+l/aeJJNRzv7e3grjIzjosUREDwM/8e16G1Py?=
 =?us-ascii?Q?MjN4bgLX2rqpTRP1ULvvuMvHSUfyO8zrgzQ5jWaWtcCBz1nTL2zy4uYBRX/l?=
 =?us-ascii?Q?I6d+d9pwv+1AFuVPAUh175T+OgVfULDSsMU5iSKoZSiJ5EKDBz6jPxXRb99o?=
 =?us-ascii?Q?+Eivfah9I6uxwV5l/2rMdvCCZEbsCRoQFoOvt2FTO/0hrGBRQf4Lv9K5mfrl?=
 =?us-ascii?Q?bxN6e9P5XFv7UZD4n0N0OnKjETj7loa45yWloG7vfSne0Uw37bG8vVqYI4aQ?=
 =?us-ascii?Q?P2bXivXRqXgbkYIhi/+eVpS4iqDmTxYUVzXt5EE/BCr1r8k9AZ/XKtcFuMwE?=
 =?us-ascii?Q?O+I8KftcTgp/Q7uFIgYV1GfX60cZh+MH00vhz26YlOIktZ5heRDDyjlFOp52?=
 =?us-ascii?Q?ihTdJU3kBtwhwAlFbEedyCyqusJ4zLB582/xmdcezbxWBPZTNleTW6QAw7zQ?=
 =?us-ascii?Q?vN9kzar0gS89Q2qfnnPt7TMP5CGOcdOWzY63/ux98/NGzY9ZRasfyJZUA0oC?=
 =?us-ascii?Q?OLPYpLYMcIEbpRRe9WX+7X3o/wEwX3cW9R7ajjsO+JtxuYSW+E+Nm0AEvh6S?=
 =?us-ascii?Q?nxO8SjpSTZeJTZ7INQB+ko989eRxKS3zoziD7egvX+2FvcCjebIMtiSalBpC?=
 =?us-ascii?Q?SPHXzzD4zWNT879nXVMrT+V4mcc0TPpPZce3MykDXuF8DhSkYz3VcdweKXj4?=
 =?us-ascii?Q?0Ydu1kM87evs65AHFYflxlIHVPZVt0SlnnYaBq5NOnXuLoh9gO5FaLZSpD6i?=
 =?us-ascii?Q?YyZtIpVcA3aK+Wojj0k5ZXbX7M5yxoas9eYSHfcX92UDoFPlufFk61b3o4Mt?=
 =?us-ascii?Q?ssRpb0eGoRDiy5XoJiEUrBVd+vfn67X9yaS6Qvo1MFn3fQp5+dzf5glNUuPP?=
 =?us-ascii?Q?6VF/EojZwpk54kcZsDnDmQdvbvXInpyqagIcqpQERkZM3fWjnCqiV9mlgJ77?=
 =?us-ascii?Q?XBq9UDU60wHZ2SrB1EtDsNJ9+Q+Bflxa9UFNtyIDdKgYL6544NK6PsbPtquG?=
 =?us-ascii?Q?vAr/EnYaDFLTq97hznfXmhT+W96pDF6de2ODJV162pXtYnLVjK9M0pmxJij2?=
 =?us-ascii?Q?hbuXrGfvIDBcdTO9d+vA7BQcNOdzHH1349eaYEtKaZaNv58ox6fB2uMpKWNy?=
 =?us-ascii?Q?Zp4RV6U/PH5XgH2H/f1aSSbai0WeL0Ci4Zt8VBcwrQtEYvPrB03gDDzVwzXv?=
 =?us-ascii?Q?HF/xbtu+jid1uIM5yr4p+koauO+99eIGoppLV/NX9i81yh+7ZtM8JPnqLFCt?=
 =?us-ascii?Q?cVB3OptrWzpXD11ngp7aCUrT4ZIkaYk88YD6cda/DdErD5shZS3OpoTrx/dE?=
 =?us-ascii?Q?NbRbyZ5Bx0SLL/PbZdtPzLvYVhLWT8LSR2Gvm9vOlBcoFZm3yoYEQaPl3x9D?=
 =?us-ascii?Q?iQKU++geExij5op8ausCw1JHRlGckz6MWE+iRlZKdgahcPv5W/0UmjyMjmy7?=
 =?us-ascii?Q?YXl1f8KltLoCeyuAXB+HfD5F4QelLkiXg4W1tD7gfXd501+rDpq2eb2stkwZ?=
 =?us-ascii?Q?H/T+WEoQhV84UvldJQs2J58H/1KYAls0glVAAJrOtpSFQUXRUERBxgMg43wL?=
 =?us-ascii?Q?lvV9Mg3jdA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VCDlN0bysjcXpz6ENG3w9DouJzX7BsIammJUASOVNT0eBKeETPoJELwigZ1uel/+OPmqwSRhU5hB1NVzqb76FpKGcUff9ZqQziYlhuZPekm86AyroxKZ8hE4PkPHz7t8r8RzjXRtpVC06lwsVfvyTgi7REO0fmuxiEcKs6MCgAjH0taGTOctLzie5lv29W35YUk8BhqvBI/smrZoMKyRLZGkWuiuoGgKTLAbj/DWUWhhq6lUdqzjW8+G2s3GC4r5a9Ts7Pj++B96oxz/FGuhcrPmHZCodJBLYd5TjPq/uWRu5I5bLVSXazQho3AQg0SLr0RnjrR8bWE04rWcXtoVcQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47706f63-2acc-47d5-762f-08de88fb0776
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 16:41:27.6074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJ6sSA537tdviqO96gG2j0CrNdsAxnZYJNDLXljPGbgO1mYiqGR9XrLPEEQQxHtj9H5GD3MTibfDGix0c75g0mO0DKIKin90PP9+udqC6Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
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

>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Karth=
ik
>Poosa
>Sent: Monday, March 23, 2026 11:14 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav, =
Raag
><raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa, Karth=
ik
><karthik.poosa@intel.com>
>Subject: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version fro=
m
>PMT
>
>Add api get_pcode_version() to read pcode version
>from PMT telemetry.

I think that this patch will only support the currently define BMG specific=
ation.

Is this is for BMG only, the commit should say that.

>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
> drivers/gpu/drm/xe/xe_pcode.c    | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
> 3 files changed, 27 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
>b/drivers/gpu/drm/xe/regs/xe_pmt.h
>index 240d57993ea6..8a70e17912f3 100644
>--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>@@ -15,6 +15,8 @@
> #define	ENERGY_PKG			REG_GENMASK64(31, 0)
> #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>
>+#define PUNIT_VERSION_OFFSET		(0xA0)

Is this the offset defined in the for the BMG PMT XML definitions?

> #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
> #define BMG_TELEMETRY_OFFSET		(SOC_BASE +
>BMG_TELEMETRY_BASE_OFFSET)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index dc66d0c7ee06..1ebe622e947a 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -15,6 +15,8 @@
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pcode_api.h"
>+#include "xe_vsec.h"
>+#include "regs/xe_pmt.h"
>
> /**
>  * DOC: PCODE
>@@ -348,3 +350,19 @@ int xe_pcode_probe_early(struct xe_device *xe)
> 	return xe_pcode_ready(xe, false);
> }
> ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See
>xe_pci_probe */
>+
>+int get_pcode_version(struct xe_device *xe, struct pcode_version *version=
)
>+{
>+	int ret =3D 0;
>+
>+	ret =3D xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
>+				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
>+				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));

If the XML definition (and GUID) are rev-ed, how can you verify that the PU=
NIT_VERSION_OFFSET is also the
same?

It looks to me that this usage is locking this use case into the current BM=
G definition.

If you are not using a BMG, is this expected to work?

Will all PUNIT_TELEM ALWAYS have this information at PUNIT_VERION_OFFSET?

M

>+	if (ret !=3D sizeof(*version)) {
>+		drm_warn(&xe->drm, "couldn't get pcode version from pmt,
>ret %d\n", ret);
>+		return ret;
>+	}
>+	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n",
>version->major,
>+		version->minor, version->engg);
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>index 490e4f269607..8dd472049921 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.h
>+++ b/drivers/gpu/drm/xe/xe_pcode.h
>@@ -12,6 +12,12 @@ struct drm_device;
> struct xe_device;
> struct xe_tile;
>
>+struct pcode_version {
>+	u16 minor;
>+	u16 major;
>+	u32 engg;
>+};
>+
> void xe_pcode_init(struct xe_tile *tile);
> int xe_pcode_probe_early(struct xe_device *xe);
> int xe_pcode_ready(struct xe_device *xe, bool locked);
>@@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32
>mbox, u32 val,
> 			   int timeout_ms);
> int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
> 			     u32 data1, int timeout);
>+int get_pcode_version(struct xe_device *xe, struct pcode_version *version=
);
>
> #define xe_pcode_write(tile, mbox, val) \
> 	xe_pcode_write_timeout(tile, mbox, val, 1)
>--
>2.25.1

