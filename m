Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6056C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 07:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538ED10E217;
	Fri, 28 Feb 2025 07:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aal5hPk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B542910E217
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740727128; x=1772263128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gnU4f4H0k5s7iSV0gsC0CusLVpH3G3VXw8Rwe481F9I=;
 b=aal5hPk+iXWI9qQox/v+heFsdGKAIZkcyCAbQ8E+CY68OxMunYEyL5Vm
 dx0fTfwwyudQqNC7n1GojYHLDgOzsUb1n0yukHaMRQnNktIdSpJDgg+kx
 CaGjhjEKw+/pLB8FZOYy9hhLzBGNCOBjaKCZvJ9w4HacdxFsmevMcFr6b
 Mhe1gnLT7vCVTsWvvJAw7xUa5gi1HQzoAHizTR+YN3OnqknLNgT4LPie8
 2QgsmSVhqGBqpWrMF452Om+UOVyk2nL+MmT8gu9VZKKyiqqwZxg5Lbycd
 jCZlrJayAXjM4lfoc10Hu0PlxIDDAKBXhut6k2dqxAai4Ob0935O58qky w==;
X-CSE-ConnectionGUID: tTrak4gJTaiBpYWeQCugsQ==
X-CSE-MsgGUID: fSLvj/XoT8uZcsu6WoQ8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40822505"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="40822505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:18:43 -0800
X-CSE-ConnectionGUID: SerucYkbSKCX8MJ9k0qXwQ==
X-CSE-MsgGUID: RULFuJqcQ0C/oEXruUX6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117290791"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 23:18:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 23:18:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 23:18:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 23:18:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpXIqKhct9d4LYtQYvQuvvQH45Qtt8bo5M4geb9/zDcEtrZ2vO3Rh1lHhHPXMLBtoNNU81nievr8pe+X8sF/bi0yT92suR70sNXPM9dKWkfyWwtdIcNfm2ShT9jT486HjHVEjLa9AhBkoHEs6Zi5qVWVkvTGx2DdYaFy4UCbaWE/Hz4bcPIM1nUSRiW8PdZB8gx2ZUoRfg5xDwoZNZA6h9ngqyi194JruhnMnUU7Vg8wKFHh0URxzPke3hHMiTE65wrL8uq8PnEJYwShapkXPQaOjPjlPG+Sy8Kqw5GaxQLuOUp5ZRoGiHHFMfY3jNhAYuslZ/XxX1EuZrhFOLwvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4tY1qF5UAuEF7TZkcYHDLXvMpERzuOMhPSNiwMrWFU=;
 b=iGnoKXSLFvAFXlQ9agPFFTirR4ujUy/+EsufOL86EqQmYA8qKEyl4tPR/EnXeoNkfi7q5lgUlZ757peNm7uIuurAxABHdOMNehW6jdO/oF8bo+zD2e6b044jCTlt1buB3OiyykJZdX9ljN2DHTKib76KXZEKLzQY07rthCpjfJ2QUNnZon/qJKKd+hlNdXDQlhuOwpaXPyAreN3O4RWq8uMLMil/TNjGDToUG1QujImqhY5KD757zABgIKhjoCb+TPpxpKj/26rB2p7UU0UtbWhwreTGpI7RXfDBQT6ZtNKJIqGIUYyBCPlURcO5pQ/zrrUv52dSl8l15YWizsEuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 07:18:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 07:18:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 2/2] drm/xe_device: Evict all the VRAM objects during
 device remove
Thread-Topic: [PATCH 2/2] drm/xe_device: Evict all the VRAM objects during
 device remove
Thread-Index: AQHbia1wgo9z94Xj6k+cPUUgC6iqQLNcToSg
Date: Fri, 28 Feb 2025 07:18:39 +0000
Message-ID: <SJ1PR11MB6204695937C005D8B356860C81CC2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-3-aradhya.bhatia@intel.com>
In-Reply-To: <20250228065224.320811-3-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB7496:EE_
x-ms-office365-filtering-correlation-id: 6ad2eec4-2d5d-418f-eea3-08dd57c81fd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6HZ0BQJNdozqj7xDq4pvWQb5Mm15je6J7l6JeP8LQfnbgTcHsrYXVDt1Zsxs?=
 =?us-ascii?Q?/8UaL6pQBWIg+16z3ktdb5mhMHm+3IWLPS42WdfLuuirl1Bx+ZNG4I5o1w4N?=
 =?us-ascii?Q?ilwgfqqnGh8iFxJPZKmoU2kaCIoLbMQQUqJem53MI7hkwtPKnOnUL6sKPBN/?=
 =?us-ascii?Q?2QMfKaiiZBNUkVS7E19/s+Z5Ib1ylMopdFR+h7slHwh9804TJJl1khGMI+bH?=
 =?us-ascii?Q?+Phw7jd5obj8zVkrsUJpFoGFAaJqsL4dZ/av21XJl1xPw/Sptvx1kF+/bOAS?=
 =?us-ascii?Q?mEojbwwnh/Iu31LHvJQhLlTs8gIi/kcPOVafLD77ACgB8VBisbR3OEPZ4bOQ?=
 =?us-ascii?Q?Kv0P+8qK/scsFVmA1JZ/AIB32g2e7Hlpzb+HAAp6lz1H2NnFKixj0hE9IQ8X?=
 =?us-ascii?Q?wJpn6UR72OIyZYKUQ95yzd+AAt8OhJxk6hmJAeVS3MiUwRcza7POcoWEFm2N?=
 =?us-ascii?Q?npdyrot17/fSqvN7/7RzTdBQzMN9TZp9WDtKzAzXZL71PrnZODhTu6s5Vqxg?=
 =?us-ascii?Q?gzDFoTv1CyqZAPZ7sKK6tgm4Bin1uOs7VRrMp5VOtqx7m/lTh8HBhU7uXY2k?=
 =?us-ascii?Q?OJUMQFRfAAuIXc/Dj9VH/YMUCJnAYEeIi+BeRNg3TgUPyH7lShQaPKMrn3Vr?=
 =?us-ascii?Q?BfFm+xfkTXSK+yzZG8XijnKIWTxE0E2mlFwZV6r11GjSQrKqGJrYc9f4Xcn2?=
 =?us-ascii?Q?T1IJ0PMPuuFL8cAsPfwJsU/HKOjTHC3T0iQPfPSPzdF6acz/tqgpAs9LLbAZ?=
 =?us-ascii?Q?6CcaHwdklpXcRY0PG0Ifm6LXS4a/I0DTF55YHdYpZo5t2DULXrrOYRvSJDjq?=
 =?us-ascii?Q?mpjmnBNLrHbgKCNNHLf/YH8h2gd/jq0KIjyp0I9TkSTJwMxVLylkb/mMdv1X?=
 =?us-ascii?Q?p252xieDHw+JUu5ZoRpS8Nf8U2/VORaLuMHpdccjeL1wndOkhpvBC7GefkKU?=
 =?us-ascii?Q?Pc7VEWtIHqU1sSJ9TgnIgOzbjXwaSXqctst6Kgzh/z7Psrpi3q33+LzaGMEQ?=
 =?us-ascii?Q?IoD35xwA3wNb+J6uHo56KhH4+Ugy8DC0/IspvYnj/JHvS8oGVbvPhMSwZ2aI?=
 =?us-ascii?Q?mDtKdI7Wphm5Tqih8hs/S1jsi8SW1/edT8anOwzd50SjijW4umBFe1EjyMWF?=
 =?us-ascii?Q?fvN+tL3ebtBOYhoXLS6cFsseXXO4TUl9h8n4Ko8nni2x695Rnvk+6/W0FcuX?=
 =?us-ascii?Q?3AZFz9sgex2PSuklwgohOxs+amrlMo6p8pln+8BgGhZBSDtLvUJDhISquFZD?=
 =?us-ascii?Q?7VeOaFH/GQ7Bs7Z4h0ASdBhK+dBXbjtzYQtU+ov86A3a2uk+ojPuA9ZbI3Io?=
 =?us-ascii?Q?eQgYpvORZ1Sc2GsMik83TAmAYTZCMKtYVI3UUARdgxW/ojtp+C1SInb5mP8M?=
 =?us-ascii?Q?wVl5TwpRAZ8BPf6/JCgmBJNgpaVhENWJqWC10Fu35ACnQ9t2QROUwXC+Q6LX?=
 =?us-ascii?Q?i/Uq2YDY4xLeBUXgMs6yAuOd0L/IRVe6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+KkDZ/NNXKU1PClLX334tadga/tDesyhK4PdyAZEgGff5BypKOt37pmyj0cX?=
 =?us-ascii?Q?Lw/8IibiPlLYG3tehtuNFBC9sxaiagq9/UPC+jDgXr20EgvbYzQoY/KqTLXG?=
 =?us-ascii?Q?2cSpF68FzOcxVXIaZEZVPw/qkNWuXsppxGSmHld94VZoBiDCNCd6IqUk95ZU?=
 =?us-ascii?Q?T1/iJujqCvdcyg+xD2GTCMA9ZncLlyaDaQYwirhDn1NW0NCL745JvsQsbtab?=
 =?us-ascii?Q?XULUt4Yq7B7QdiYJjx9TC9y3ow/uYdm/s7Isn71OScXkf3CEpnvVlCGDUt0t?=
 =?us-ascii?Q?0xAMhBUqKi8lJJfZEPGpOTktX7JQubmN+0FZn7ljCWPaPYxpN0gnMZQs+Z+J?=
 =?us-ascii?Q?El8ipGveyjQeDMkXj1Igmeyv0+JA/z7xhejsUFq2MUvmmCmd7nHmvWSh4wI5?=
 =?us-ascii?Q?SCG1TemaLCEujkVihIUjKTKKwb9DMry8V/DwBrfGp1gcbdmYF0OiJvscZEBj?=
 =?us-ascii?Q?Msjz108RCKjyf0SF2qzjApaRq0Vdla7zuMGT4bPdx2PP9V0DKWi8rk+5kyaR?=
 =?us-ascii?Q?iYsf11+MGk0BfaPJThBylEHHpVNSfZjh5LTqWkm+PleUJPE+/Vw6xD+S5K78?=
 =?us-ascii?Q?RKLb+6rjHyyri9HbZ+OjS3uSgaY/eXdpPoyCTiiE2vnoUkaTBzRWhXNdLLiw?=
 =?us-ascii?Q?zeamn/UHjudaOd2uXDAqm+K3ZGdsziNiqiM9iCaXvFDkWqrqUezAB+Q6b8Qz?=
 =?us-ascii?Q?wImJvAlbKVCnI2TFU7lI7BYFmf06/W0hZZ+H+BsAyTLVBkmwIc3ud3g+rFAg?=
 =?us-ascii?Q?Nqpekkw4kuDvfmjuaY24WNJh2eKZkajZIhMzkcyiW9AOvYBACgju67vco/rV?=
 =?us-ascii?Q?aT4NLpWaYrfmDuwYvHYWNlTRb3A9sNf9pF1uR7Up9jAsAznHCjP/hKPDp6wt?=
 =?us-ascii?Q?Ge3EiTmCtO+m8ZRNDGakYdNUn4SSuAthbsS/W7eoCwVBGMFfbjnrSw255yu7?=
 =?us-ascii?Q?sa45CzQIGlyWXA0LroQZmLMjGql9OfVnzm7bErgd9frGCKD6RFsS54Bxf2B/?=
 =?us-ascii?Q?yOrFSXL2NbPPvM3drJ6VcZS9k5x0XgAgXg/wbftWKY5YBubvrdEg6Q8L6WfH?=
 =?us-ascii?Q?IfFDOk3tgXZPouFlcy71gHRKJv9AyfBUaGueBf0pr4La5/64t66gAmMdub/W?=
 =?us-ascii?Q?xWks0urL5GxcAd8ELB9kXaOvWx0uN9B5LccXOfKvUMNtK63ZOxuxrk5m6UR/?=
 =?us-ascii?Q?xIXorS+DiqT0qwA/VohxdWWpShppm57fCYgIvr9qiXgaDZcsECwKDemrO41Z?=
 =?us-ascii?Q?uE33DXjpqF1NtsLf9Jb5JUn/i3gSGAlZaoT78H8ZzsTEnKG42OlxU7t5BtvL?=
 =?us-ascii?Q?67leaRubCrtZO1kTcyoCy1RB1uZbsKyk28MUkgq0st43aOacA9D/j+QwRe8p?=
 =?us-ascii?Q?x5jpQYynocyFd315HD+OzUSRgHEe2bwEskwNFePNDJrSLc2AeF5ONbwIxRYG?=
 =?us-ascii?Q?RuC9NibHF5v0Raon75haH+BC1UzmxARn3OphawQWLlM3soNeHIQ3bAwpd7P/?=
 =?us-ascii?Q?ngRRaC4N1CkDlLn4ER9skm4dyhxUAbUxhZGpgrZN/UWkShpJOOcosrL6XEfb?=
 =?us-ascii?Q?b0ToN+9DflTF4mmjvNn/c73DF3H6m/keSP33Ydtw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad2eec4-2d5d-418f-eea3-08dd57c81fd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 07:18:39.5502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfDE1mY+tcmEbJkzrO4JCldaFqWMxNjTyb9kP0Ral3MByW3ddsdffB5NgcIlWes31tRWs5ualigCeSSb36gDYn2R87u0edvgYS81+LZsQHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Friday, February 28, 2025 12:22 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> <aradhya.bhatia@intel.com>
> Subject: [PATCH 2/2] drm/xe_device: Evict all the VRAM objects during dev=
ice
> remove
>=20
> Now that xe's migrate subsystem is dev managed, instead of drm managed,
> evict all the VRAM objects during the xe device remove.
>=20
> The VRAM and TTM resource manager are drm managed, and so they are
> destroyed when all the references to DRM are put. When that happens, the
> VRAM and TTM resource managers evict all the BOs before their destruction=
.
> Since the migrate subsystem will already be finished by that point, the
> resource managers won't be able to evict the BOs successfully.
> Change that by preemptively evicting all the VRAM BOs during xe device
> remove.
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 9454b51f7ad8..ef293552db6c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -905,8 +905,22 @@ int xe_device_probe(struct xe_device *xe)
>=20
>  void xe_device_remove(struct xe_device *xe)  {
> +	int ret;
> +	u32 mem_type;
> +
>  	xe_display_unregister(xe);
>=20

Should we check if dgpu?

Tejas
> +	for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1;
> ++mem_type) {
> +		struct ttm_resource_manager *man =3D
> +			ttm_manager_type(&xe->ttm, mem_type);
> +
> +		if (man) {
> +			ret =3D ttm_resource_manager_evict_all(&xe->ttm,
> man);
> +			if (ret)
> +				drm_err(&xe->drm, "VRAM evict failed!
> %d\n", ret);
> +		}
> +	}
> +
>  	drm_dev_unplug(&xe->drm);
>  }
>=20
> --
> 2.45.2

