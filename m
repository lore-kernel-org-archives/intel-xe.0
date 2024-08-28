Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D201EC54751
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8871210E3EC;
	Wed, 28 Aug 2024 08:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhIxy+Ou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DC810E3EC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724835022; x=1756371022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NFiPoiHmCff8hOC9cXSCBf5CvlUUKa/j5x1oPxM1uHk=;
 b=FhIxy+OuzUuYZP5BMqtyjHxh6v8Xx/mJ0+cBWUdR1upkIERX7WluB5DA
 pS3jOYvlxwioBjM0sG3P60Vs3+L13WK4oIDOnI7zSpbJz32GU9WKhUKiC
 xU+dB/wQI2uFpqzu7vXX/PgU8wEJ9c+Hmk97vy4e6hxIxKgoM15Y1z7Gs
 /d5qFtn9Oi9mDBkoi3G+C5rsutK7UxfQQiiwu9oEjH/in1/Ft8ro1S/dK
 TWaRVBMesOSO3vl9G6AVrjsuQ3XmbCySQw224vsWBBUGVVNr32wfLaxhJ
 RmwL+mKmEaHHOzYqvEa3wMVaXpaDDjkopx4ID8PW/S2+hx0IAgIrWlFXy w==;
X-CSE-ConnectionGUID: +Hg8F2Y3RO6doAZVEVrCWg==
X-CSE-MsgGUID: mxfeLh7AR6efWsYCZOT2kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23532534"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23532534"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:50:22 -0700
X-CSE-ConnectionGUID: VTx49kGeSY6b6OQ77mX6uA==
X-CSE-MsgGUID: RXWezDCXQDy5zqLCGcsi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68040117"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 01:50:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:50:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:50:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 01:50:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 01:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1pIKy5345YOBXXAYSrLV7QEWiFRSC3sQrPHNIPTfyZTQg+EUjM2eC4L0WJWDVszlqgvKfJwgqXj5FqpA5rASpyz9k7aBnlGTj2lcUQVIgZXMP8ooMBqkaYkucXgCE24d9tiQyvtAjTdd133HZE2UyAUC9vzXCislTLj9XSXMYsPgeyY25F/nMRGGFThMNBMvXQFoiRpixvmjNk+t56HLKl+dCeAlTlbfYpoH5NoVIYZHtvETs88uHDbiyqJAO5Y9GssfGxy4hHw3rwxCDHRTSJ3ppPEL9lkDM0HdIsUC44+/pPrVwK8aFU3QO2CIKPrP35QwWD2bDTUqA20NvXWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS48hV58zzf4QI1+QPclAWmjZzOoUwF+vND67CiBruQ=;
 b=J4a+UyEBv5LQ+121rohqQK6TP0vpF2cKn3AxVvmgxbyFdIWSa9Bc5baOsUWfNL+J2BoV2Ta+EteQxv3OWNxNYRsuCDZ/8o9ZB7TwfaU+zU2H/yBFQkGTzRpy4uYZKJ9bwFBYM+8MblxY6E9BbbA0zyN/i+8e6AZfDEkfEq1y9a9P34EkyV8BmpYkx4m08Z3xtfuDDxOayqbCsCGKFFBSLZ+SM0i6WiQ1ruMX1lHlwAUV/urjm9I6sqFUutnZFvxQpt3h8aKPgGIpBsas6rbtply3jRn+Javzdd6P4gBcfNoYwC2eyNMi373n5yjJGgoZtUnWWiGzYLFHEAXWMdyBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 08:50:19 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7875.016; Wed, 28 Aug 2024
 08:50:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
Thread-Topic: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
Thread-Index: AQHa+SV7nDpFLxVM7EC6Cq1bOb36pLI8WbiAgAACbWA=
Date: Wed, 28 Aug 2024 08:50:18 +0000
Message-ID: <SJ1PR11MB6204CE8A6DECEAFB066E08FC81952@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240828085436.3604257-1-himal.prasad.ghimiray@intel.com>
 <SJ1PR11MB620461E80EF9E12B4181E06781952@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB620461E80EF9E12B4181E06781952@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5055:EE_
x-ms-office365-filtering-correlation-id: b7071a52-b80d-467a-ef98-08dcc73e71ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ESY9enXG8SZcXnWuKbT4tQPvZrtncqzBdUWWZanqc+I0yY9spExlsuTpREsH?=
 =?us-ascii?Q?bvbZKpVAifLEHLThaxadoT0Q1ml9UcLVHnS1d+gTN8BUQsKAwBa1cFjwaaGt?=
 =?us-ascii?Q?iLoQWEbC1lKvKnW3upGqKjT0FhhnRCLeZCoM+iHXcNoGZCgZnbHYe6zeLhsC?=
 =?us-ascii?Q?kkFsaWvEcvhaLp1fuaShPL9jTe0gETPnVAWsYHTmmElLWfE5RKpS97BsBL86?=
 =?us-ascii?Q?urfp37NgvEYJBEo2ibxKnnTKflimsTwOipfnYfaKH5DaEhsmFmN6KalMUQAN?=
 =?us-ascii?Q?fAjYFeVM9/Hlpuih8RtbsqCnZc4HQh+PWqfSd9VxAgjTM97NAvuKfPhglKCp?=
 =?us-ascii?Q?vWullin2WA44fkIW+EejCAezg2DTc0mLmcZPgcwLy0tkeNJg+wgzhPU5qajI?=
 =?us-ascii?Q?BPEjDbkpXqshl5A0TAlxgQ8TeCRWZD/XV7mH64dp8wmql5TMLTxkrNTQL7qq?=
 =?us-ascii?Q?YnWPRGVUT34SUs4Lk2nhwMUYczw1zFZTT3aDDqHlBBySxgc/0WhPGBc0yHn4?=
 =?us-ascii?Q?a5V9I+dygZv5VUM3S17B2hI333CFDkYwhzR0/9S3vraVVJmS8QQJx7HuIgRP?=
 =?us-ascii?Q?7+LNrWvGZaD6AHwbNetr1u1eD2L1bVfcTMlN1WsQg5oespbkAAcLGNv9rjgu?=
 =?us-ascii?Q?5x4L9w3ncVatEANGiw468vV1fK/jZxaR54iUw398pIUq4uShW0uRESiYZJY7?=
 =?us-ascii?Q?euNPpHNxcIm4L8KJwGq0zydWg1woIf4ujy3/sdlmsKSlj7O6Y+fhJ1+yGATg?=
 =?us-ascii?Q?O+W9+ORsQjblH/bIgc5SQ3FmSXN75TJ7OnrXZX38dkrlm1DPUXJUbQwMF/lE?=
 =?us-ascii?Q?HiprbTKt1MdJyYYr4T4NWOohAVX15vrfY+9Lw+Q2fvbu3f1f4fx6GgS2NDl8?=
 =?us-ascii?Q?Rf0F3nB75VDr8t3N9522ne6EKjGEdCfVfIxOvan1TZ4tyzrh/FN3V/Yu9Yp7?=
 =?us-ascii?Q?UIsKX/FCOnxuJ/TR+dqb1LEAuCpdAkWjfOyvVPv8TmYPlVbhU3O+NSvv49fL?=
 =?us-ascii?Q?Ig25sMHOmb/TyiWoqy5R/A8UK/pQeKIcdemGeqQBXFmkwjYmzTpkrdiIkmS8?=
 =?us-ascii?Q?83rk5zUsp8ip+ADw62jDvaU9M0UGOf0Ov91VRruPTzd0HYIF6jAcQaYqSUkZ?=
 =?us-ascii?Q?5n8Rot4OhPPU+ixeyPgoRJxnf/DmCsWQ/jthp1CGHgps8M6m7BLO2Nl+KWrd?=
 =?us-ascii?Q?mj9GRXokc/WJRRpUZx0TGbFiqWjKy0GTwWEXdQAZauhoDRgpyH8YTMFYhdKS?=
 =?us-ascii?Q?Y8ESDa9Ak8fXk5eRHOinxsCjRTmXBnHdQOqaBIdzThvzvjPyXC4WJAJErofB?=
 =?us-ascii?Q?dV6M/qQQtyigtno7g3EqNmTpEciFtZQzNC2aSazm4x0pFFhvms/Mz/ovMJpv?=
 =?us-ascii?Q?x/Phaq7MZLLUJd9ouoNslUMpf9rFnsk9COTE1CLX7QLab2rmjg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QZkMWHYKUouY6CrknWosuGTh9j6LuSfgV+JmL6j0oP9TEzN2vXe8pKzhMT0r?=
 =?us-ascii?Q?QQ5YGX26wKJlT7XIJzFeM/nE+dWJW71z+zlDQ9HM1Jc4Ut+d3bT5K6MN1GKy?=
 =?us-ascii?Q?N+FabeiBE7OBGcX7X0e+P4U7jKQmPL2BShNde7I04Le/4TAwDC3CNVpe/QE7?=
 =?us-ascii?Q?uP4CEfEtUCAHr6DzedtEx6OEoKywVelnajgbKaw1iY9bIohePMGDUy1HVbSF?=
 =?us-ascii?Q?4+bP7F2GplBvVefmh9h2uxscs16yF2ITF8Wnq6HhUMZQI5bMp2Ku8hAW3umP?=
 =?us-ascii?Q?SSkpGj1u/r1yuuqW1xmKR9Po8Sy6q84a6lm6hSt7YbLUnUx72hvfGWVbJQTf?=
 =?us-ascii?Q?RdpH9jZ8j0nxvJomV+WlZHqAXFtXwIFY7fgCOTboIor5KIwQS5M6NpArY8FD?=
 =?us-ascii?Q?eVkmh/rQ1d9w9XzqnLu3SV1JnKQF+7lsWxfZBYCYWn90LgVccaBy57erPz2u?=
 =?us-ascii?Q?AOw5cfD7oBsNpL1bpoRXkpMrYImqvPgHHSfcTYUOlVFDcx++6IOC/+jClpZL?=
 =?us-ascii?Q?dCxLgpzw2wl79n1Q21DQ8agTt5Y+oQZy5AZfeuHmf9AHamkt3drIqF5+5q+a?=
 =?us-ascii?Q?YDr7wgL7RufzWADVRndW//hvi7V1/+lS43mdEsMG44iopsph/RrIxzyVQaF2?=
 =?us-ascii?Q?ZtSn67amk94Npgt/eG99PegcOqvRA1/Kve0FwDkk8455d5lbpwwcS0KTGz6V?=
 =?us-ascii?Q?W0MCXHP9myh6LwF2mSlxZlkAZlemVsbKr6L5gpdQAt53eiIiS/6ASQncUZxh?=
 =?us-ascii?Q?ME3PLzPol4OFK6uEQymeZZoupJDo+BeQOvkWGjl5Rr1RHyYGeKuMpNjwDKE6?=
 =?us-ascii?Q?R0wcufQWoDTGhO8eUtw7NMl4auB0FkH89hnB57ARleA+XWryPGznCxQC/Y9D?=
 =?us-ascii?Q?eRX/UyeLwVHnllGSsScyFK2QYOroFfJ+YBh1SL30ay5KRKlqTPDS88mmLKSB?=
 =?us-ascii?Q?iv1EhiIMipavzqp+WswCqqmONKXnb+3H/tbK0RtZwDyb0Fn+cLHEmj7O4PP8?=
 =?us-ascii?Q?85HF9+1Jac64JblUtbSdYkBpwNtF9IBMqkKeDTil52raQt9qZ/P/yVvgoSnP?=
 =?us-ascii?Q?nPjK9kUGrY2rxIx5QEGVpwW9dNr0/raJF3A9lK4r22XkvYUEdAZI8Svb+HQI?=
 =?us-ascii?Q?7vrr5w73wnTYcy0ZlySONUEDLbtUUmprNWK1CUJI92AKA3e02jKsD9fJRF4P?=
 =?us-ascii?Q?fC0VrFVXjit0kKQCVz4hNwG2iJhHbmmHCH6RFWtrGK4uXHUysv106FtfbXz4?=
 =?us-ascii?Q?A7IVet//qQNJk105cM020joKYDAqadeO4Gfn4YLRlVxjKjPdIGiA3Nois/tn?=
 =?us-ascii?Q?wzVu4TgNw6N6zw6ho6+wnZbF+ZmN6/OuzNv5q2AkhTRBBk2nm5hqlXQ6FQ4O?=
 =?us-ascii?Q?2Uh23ua7vqIXw9KEsAx4uVyxugPgOaBtlu747NS3hq0oMboole08mJw6c6fD?=
 =?us-ascii?Q?47Mdg9gGg6rSSQylCxDP/pEKDNVuN0szhx+kbCjRRw+gNeG4vFYnBfr2saq1?=
 =?us-ascii?Q?p/csGsDCfaQO/SiDikOEVvgyJ76TPXXWtKFg6Gkn6QNa/7TeSEsQhztqXmlZ?=
 =?us-ascii?Q?yNlZxcVPMJ4PbkWZWcZefQl8R/dPXoBv7HL1iNjc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7071a52-b80d-467a-ef98-08dcc73e71ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 08:50:18.9152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MU6vXDifMfl0vzjuyCq2m2sioD0qc3Y8x63Kx70M+r8v4na4QWLYeMdFypiKziHdBufNtzbmsjtXGep4sEfQyYNY/TERLFB3X+u87a8aJJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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
> From: Upadhyay, Tejas
> Sent: Wednesday, August 28, 2024 2:13 PM
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: RE: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Sent: Wednesday, August 28, 2024 2:25 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Vivi,
> > Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
> >
> > Make sure that ggtt_node_remove() is invoked only if both node and
> > ggtt are not null. Move the null checks to the caller function
> xe_ggtt_node_remove().
> >
> > Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for
> > ggtt_remove_node")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> > b/drivers/gpu/drm/xe/xe_ggtt.c index 86fc6afa43bd..2fa8a22ebbf9 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -286,9 +286,6 @@ static void ggtt_node_remove(struct xe_ggtt_node
> > *node)
> >  	bool bound;
> >  	int idx;
> >
> > -	if (!node || !node->ggtt)
> > -		return;
> > -
> >  	bound =3D drm_dev_enter(&xe->drm, &idx);
> >
> >  	mutex_lock(&ggtt->lock);
> > @@ -328,6 +325,9 @@ static void ggtt_node_remove_work_func(struct
> > work_struct *work)
> >   */
> >  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
> > {
> > +	if (!node || !node->ggtt)
> > +		return;
> > +
>=20
> I think better to declare and assign after NULL check. Something like bel=
ow,
> struct xe_ggtt *ggtt; struct xe_device *xe; ....
> ....
> if (!node || !node->ggtt)
>          return;
> ggtt =3D node->ggtt;
> xe =3D tile_to_xe(ggtt->tile);
>=20

With that,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> Thanks,
> Tejas
> >  	struct xe_ggtt *ggtt =3D node->ggtt;
> >  	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> >
> > --
> > 2.34.1

