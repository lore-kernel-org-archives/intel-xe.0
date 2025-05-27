Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB30DC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 14:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1CC10E3E3;
	Tue, 27 May 2025 14:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkrCrb9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E81310E3E3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748354812; x=1779890812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hYK7vSlhLt81xfVreGM4BZs/RxwTdzxIHGaleKbs++E=;
 b=QkrCrb9l1pO/mO/PAU46a+RDppRXqfFQldAnSN2J5oQ6uk8mEmHsrnsb
 +E/bA5Sbk7dVh4oiB+iZgcWojEEMKZN9TLE1sE/9cWE0HgUDZQNiCxj3B
 /Fmzr5PUOPuwjYMP635uQjBgnMJ/GPSV4JHzLNIRL7QYkrk/EbDczQU6M
 4M7GDLnALKEIdLVd0cP0RtagBDCzZI1Mr6AEL9hk1g7QuD9bybJ6zrOW7
 OR5u9esdQ7DZ/66IT3Vgw+yvrVncAcB2XOrjEXpptIhv9ZQ9RLUk6Teyx
 ETahBJoTRS7I8w+LpWLp8kZZUyZz2e/GyS5gleh1oiwBR4AE/JL2ih0WT Q==;
X-CSE-ConnectionGUID: OSjtpxtLQAS35lPJZcb0jQ==
X-CSE-MsgGUID: rW0SVW8YRAOqu3oerFL9GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54140832"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="54140832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:06:50 -0700
X-CSE-ConnectionGUID: /PUnP94jS8OTJLqeOvS1Iw==
X-CSE-MsgGUID: jxAxr/j4QJe779xGfaZIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="148098640"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:06:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 07:06:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 07:06:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 07:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hulm1hds3qc67zXfvFvaKixSY2eXqF9P8Rzhi4/qZGvUtQ3duWvQffy171m1uBxZ0Qi+mKk3KcZkxuyL0FSQsYq1FaVjee5LPGngw0gEiiWM7VmMWS/BplwFA2uNg2lTqGjUoR3HcwRGx0YImBWUotx+e//rmbmBeaBqcI6y1lWFN6MyRL+v59ODZ8ms69KITqBE5iuAP2mAQNrtDQF+CjxLxpx4GQu5i0sU2SqdK0XC5upFopDWM6LLVtyJWmdWE1S3e5gR5VOA/DgMKbJATa/M1ulaU6ftZfz3IK/ugxOl8MqwNqHhZcYWU5y56rnM+Jj5B6tO/25a52htdsQaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbvDtvaJAmjB+7Fo+/BnA9/cwZds7ltv2JkLhfMXqT8=;
 b=V34/Mzx4cL6GDuY8HOg99Z9lRBc/9zoGo0ElQlRF7msza4aa3ybWbRZ4H9Yr6aOCXPe9/KCJhGfhO1+kzMZBj9gjeltWw2Xl2s7S5sE3ztAVYKjnZhqKUZG7CXwur7guv1NSGrD7EVTmo23Ls0lvaXEOBequhFltWUUtWD3MQu22MZRB+upDNcu9UG2xM23I67WvufE3Cq7oSu2WbJOzUWOEx/fCeNwOAffW+IHED1FP14YMLF/UoM4zRXaVObmkCCyh4AhSOThK98qG3eUyNBOtlOgjoovqD1nt6yn5Za8pGNBUGx7x8jrkik6zqE6YagWuqkOwgTJyv+CJItkruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 14:06:43 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 14:06:43 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
Thread-Topic: [PATCH v3 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
Thread-Index: AQHbyRSf8p9wLC8960eyjOCl/Q9dULPmjtkg
Date: Tue, 27 May 2025 14:06:42 +0000
Message-ID: <LV3PR11MB8695B095B796DA7C0A2C6244F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-7-tomasz.lis@intel.com>
In-Reply-To: <20250519231925.3196154-7-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB6346:EE_
x-ms-office365-filtering-correlation-id: 754e585a-3be5-4ca9-6792-08dd9d27b57f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Crc65Ak013BoiGTdAKAYGo/nMb069mhLZRB0s+wRvpEY3567bvsHerGeTO6F?=
 =?us-ascii?Q?T98vV446EOWkGMwc8ME0HBsxMDKWlcyXPf2Ad2NB0tqqj3ZxWslkvqOFdzyh?=
 =?us-ascii?Q?TF4iM/nXCiPfvF66XlOSdFACbgfKiF3LZHqdZN7aB0qlQOLinfmX4c4j9LOK?=
 =?us-ascii?Q?bpARnBGi2QtpS1vvlsr1iueRUtyM2j88celbxl78Kb15MocuWvL+6bm5xsQp?=
 =?us-ascii?Q?eSkDdpmBuivKFaeGSU6JBApTlij+9t5iVGAPbPLxbhXez2QCOos5SQL6U/A4?=
 =?us-ascii?Q?qCC8BPkcUng9FiUBuq0DOmwRsfDNbz3dcqtlPBh2Qb+vKVDu5HKwXDGG+MUK?=
 =?us-ascii?Q?S1B6UvSL30umJNVhU+cv6il2DUGG9hx0mjO7isAAQa7LEQ/9B9jD/zb+dBQI?=
 =?us-ascii?Q?SuHvD3DeVm7g7pgzEAeKkJYdPV475oePRfG4hUXHNRkZ17+fhXxIlTYmmu7v?=
 =?us-ascii?Q?Ry5tpsWlLUIwB0LhxXJHBso+cAE7d8dI/2cc4+vYCrvoQxK6xWrbFSO3HtYJ?=
 =?us-ascii?Q?HFjNOm/2zwfpLFU2PtnPTWZNKCZ6uFdTGANAkvRg6JEQbjvsISaClM370EA4?=
 =?us-ascii?Q?tK8nuaUBQgCKG0gqVjTCe7TdCBbtiGgvbDUF8hWeUEFxB6kWpbY+gSWFPqfK?=
 =?us-ascii?Q?R3524xliKfC8aDmjaG4D9bpGv5bxqemaJeLsCiWXKPTQy7cpaCI4kdJPBEwY?=
 =?us-ascii?Q?bG9LhTvErzoC+fEQd8XTIsOOEMcRfqYpsGETlXxvAaYtk++b0cbo1R+Qz1uf?=
 =?us-ascii?Q?brS6DOiupMZ6yT9IW+TA92zMii9mLD0/FuOweUplWX/j6r5k6atL+MoQNjks?=
 =?us-ascii?Q?zjfxbzfiMMQ/vkQ4htKmumuxz8XycTt/Zc8aqjgPxP/lKQagMiTfJdV7ayl8?=
 =?us-ascii?Q?cQnbp+03MJCF95qPgxGzF/b0lCj9XvBgBmmG8pSmgB+KSj+DvJAWmVnOOhHJ?=
 =?us-ascii?Q?FCDnZW48QSnM/5A6p+Q3SMPqy9eC9NZtAiveQplaOB7ds9WwU0SDb5D/w9Qd?=
 =?us-ascii?Q?ob9bl3L21rUQ8FxQ7qYyDtr3ZiY9SQrC24uLvwmJZx1zJWuUIcFtDa0UNi69?=
 =?us-ascii?Q?iTr39d6T6hd09reiF5B/lg61mXrHdgzRaor0NTEtnnCw5iCp7kgmw+2/wNX4?=
 =?us-ascii?Q?uDBsKZnikLGhfNBF/0Q96yuXMHa802ZMc9ak7QhkhS4xXyNMiMztCS7X5OcN?=
 =?us-ascii?Q?kiFf8ZuA5aLIDuPXM2V+mUwSahwCRvT7HEXDdDEtH5T4CU9JfvScabV+VOYe?=
 =?us-ascii?Q?DhALgfdNRXHiVhOoz999/xeVIF9cPjxlknjhyQPhu5LuXdWzKgnATfyCROmt?=
 =?us-ascii?Q?k6dfmIt5xQf1ogvV9dz2iEk7d7BBvJwNqRXfOt7XlipYokyOHEdlu/cMsEmA?=
 =?us-ascii?Q?5Lw0b1Tz8jxvw0t0sAnN9uhlLdEEvQo5EarHtKCjKv7gBMSyYfyXbpZmIptU?=
 =?us-ascii?Q?/gIl1o0qR9cIV4VCH62O+ywZbMbJkHWYb5N4EvTMqFT6UVmo5oyN2IOu8YOl?=
 =?us-ascii?Q?Hn6G1wUgOeuGwUE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RSEcl/RIprFFyy8pgai4zT+mFTAvcmYjLzAMI3GeiCdqyQeoa4+KlKS+fu96?=
 =?us-ascii?Q?NIxUrNp9nv01PWMr4WAPTeGRFj/+zhb4e0Yq0RgXsukBJ+oyiHYb51H7J053?=
 =?us-ascii?Q?RgScdrXS8QuirVyRdHPrOPhKHGKXO1WYZwMNEN2E4yo5pIf63M24XyyNS+HC?=
 =?us-ascii?Q?I4CWznwDP60oyovYvn95O48vk/DSUDFyyLvQDqqGL3f6Vinny6XBVnP2fige?=
 =?us-ascii?Q?nT/wDPMiLXkqH5E+4bMcHUA0jvoorJK8knMhz4du+d5FJsgkSf1gpkUZ1lPT?=
 =?us-ascii?Q?kYJWlVOzcdmGNTl20EdooyhMzysn1DY7nSgWGLEWm3tAC7K3Rb/Kg6b6daVI?=
 =?us-ascii?Q?N19Ryu0QEyvHuoiddJOqn3whuui28RcZ2rf23JIA6p7aMnuQLN6NmQcWsEIv?=
 =?us-ascii?Q?6x5g+QavYeZgVGFoM3OFel0bVpvNYabi/VT9Qp3GAgXcQBPzeLq9Br1vwRo0?=
 =?us-ascii?Q?3YN7ghj2a6J3ZHIIjLl+6E34j0pZqYnI5/EGMXc+FByWY8kxlKUaqWhZ9Tqj?=
 =?us-ascii?Q?ciz0Sy+z2rG4GoYmdboqmEhCYfOXpk49ZuL0X+AGOUKtnXtdxlaXSqgu2dyT?=
 =?us-ascii?Q?28QOhfshlwqrLTtkLKHKjQuVIz7wnwEJH5I0g0HLMY7HmBjg0F1pBEzUyzW+?=
 =?us-ascii?Q?aiAvIn0rKIbuHTtnhfApjMHz+z27EtK6gBVR9mvRKKx2Ir6T936KJoz6FpIX?=
 =?us-ascii?Q?SRNfqnmV5TNgL2qCiDjIv7RAp5n3bmNUFAlC8wg5DuwFgQ7/W/siuJLK5FMk?=
 =?us-ascii?Q?Gxesdq/ASgrOx8McWELsKMvFZFqaKVv1Zv1sDZMJiH54h1D6UPfdnNuLSFVY?=
 =?us-ascii?Q?uWc7YcWxnZC2abe83lbFUvvuHWooHx4VMLch2sqlJODiVglh8CeksKbtaS/L?=
 =?us-ascii?Q?lPYGVxk9x28Lttv/E6UpsfOlEndi0UXP7LxQd3KMNXLWo8DCn/nxtv2T/Qn1?=
 =?us-ascii?Q?WNro+n93xeRO3eC/HoWVQS5Oi2fGlUVI8vgfKVXmtplHZ+PXO5bIVSm6Ztln?=
 =?us-ascii?Q?TWqYQ7A91c/T70DnPNBIg6ein2A+bOsBZ6g/zgmD7ORQ5wZskfEH7ovbUwPe?=
 =?us-ascii?Q?d1xEO1mjPK/mG4kgfHIZktfoVIBMeS4IgJ/vTrgW+Sq7+BICHKYJUNoBxlGn?=
 =?us-ascii?Q?tBf2nLUUTcqJkv0p2TIKDsLAPDeLNMN2XpbOWn0bVSfQkLJtW4KyA8rvsg26?=
 =?us-ascii?Q?2KEA0jZ0u3K5rqAbyy0p3fwBGUEMUGsOb0MBffpOyrTjekInbf3VaFgO6C8l?=
 =?us-ascii?Q?Yq9NvM0Es0Q0RqY27/QvnRd4w4utnOHZmSuMOp8dQFUUFvVYbap00OCZF6r2?=
 =?us-ascii?Q?ras+cS5B3FsFtSyQO4atLczkgESIQHJ5KYGKJHZpJmw4bGT2ns56FmQlmfwE?=
 =?us-ascii?Q?RQZnABeTQGg/AyEUzGIqk8iInt/Y6+KWAm1OtUgxAMu3Di1a7CUcqe1fq5jI?=
 =?us-ascii?Q?Y8EcDP5CNHW5p+1nRBZsRqxbH+w6MPdDow5NckSISRmGxWwKStH5BNluLLFV?=
 =?us-ascii?Q?n7kgGqrEJCK8kUzMY3cY+Gh8+K4EgIruKHn+pCscF5QftpiH/VRQg1a9hnr2?=
 =?us-ascii?Q?1hErgMpgLnRf2iCJvwfh2xSR8ORnc9Nx8FGCw7TUdS3UOZascOA1cmSZ6JpY?=
 =?us-ascii?Q?3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754e585a-3be5-4ca9-6792-08dd9d27b57f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 14:06:43.0345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMoKPz1lZu5g7Hpip+ZMnTBmzD29Gx9MQJZjRFTJbiL0bJ8ujji3r899tZxqeE5L+qVGeWpq4LX9UsV/S7LlM1YezwAGrdivNPTj9SFhPa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

Hi
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Toma=
sz
> Lis
> Sent: Tuesday, May 20, 2025 4:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
> <piotr.piorkowski@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v3 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
> contexts after migration
>=20
> All contexts require an update of state data, as the data includes
> GGTT references to memirq-related buffers.
>=20
> Default contexts need these references updated as well, because they
> are not refreshed when a new context is created from them.
>=20
> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>   set_memory_based_intr()
> v3: Renamed parameter, reordered parameters in some functs
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++-
>  drivers/gpu/drm/xe/xe_lrc.c        | 35 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++-
>  4 files changed, 52 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d696c8410a32..9c3e568400e0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1051,6 +1051,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct
> xe_exec_queue *q)
>  {
>  	int i;
>=20
> -	for (i =3D 0; i < q->width; ++i)
> +	for (i =3D 0; i < q->width; ++i) {
> +		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);
>  		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 525565480aef..959ac9c5d39a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -898,6 +898,41 @@ static void *empty_lrc_data(struct xe_hw_engine
> *hwe)
>  	return data;
>  }
>=20
> +/**
> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT
> references in default LRC
> + *   of given engine.
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_default_lrc_update_memirq_regs_with_address(struct
> xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt =3D hwe->gt;
> +	u32 *regs;
> +
> +	if (!gt->default_lrc[hwe->class])
> +		return;
> +
> +	regs =3D gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
> +	set_memory_based_intr(regs, hwe);
> +}
> +
> +/**
> + * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references
> in mem interrupt data
> + *   for given LRC.
> + * @lrc: the &xe_lrc struct instance
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct
> xe_hw_engine *hwe)
> +{
> +	struct xe_memirq *memirq =3D &gt_to_tile(hwe->gt)->memirq;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_MASK_ENABLE_PTR,
> +			     xe_memirq_enable_ptr(memirq));
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
> +			     xe_memirq_status_ptr(memirq, hwe));
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
> +			     xe_memirq_source_ptr(memirq, hwe));
> +}
> +
>  static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  {
>  	u64 desc =3D xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7a99cfd0abe..801a6b943f6e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
>  void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
> +void xe_default_lrc_update_memirq_regs_with_address(struct
> xe_hw_engine *hwe);
> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct
> xe_hw_engine *hwe);
>=20
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 0f0d1a97ae1d..0a9761b6ffb5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -225,13 +225,24 @@ static int vf_post_migration_requery_guc(struct
> xe_device *xe)
>  	return ret;
>  }
>=20
> +static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +}
> +
>  static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>=20
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +	}
>  }
>=20
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
LGTM.
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> --
> 2.25.1

