Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A7606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FA3i/dNk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9A010E0CC;
	Mon, 26 Oct 2026 07:07:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC3F10E0CC
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792998417; x=1824534417;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8yQ3/AcM2fokPwhYq0NYpGFIc89wGwoHqTLm2eDJBY8=;
 b=FA3i/dNkh4ReBu2aKD73TNDiu0Ocj+Nb8MbjHYFcjbs10srLbZoKhEmE
 FEn7DNQqRm2wUhdqbwJnbdF+qyfoDnNtBXOM+/3HSgFob7m5xQUYNCfzx
 5S+njcovcL0ad6M2MINi/XnUU2RtZ4f+PfQWRXJr8UKZcT66KlSD7bsn7
 ytz6GwZC+pgymLqZbJl+7RyAkcMgePEW8JaA7voILSNIZ0HnRUL7FVQqo
 8SrogeiV+6lLn09J/uK+5T/5AlF1EyW2u6xY6FmL+J5hdmM7+ziJxZhAc
 05QjQHO8RQvBaYcY2oZTtvKR6uau5aJHOIUoX0yCOBgUuR2gUyXp79/XZ g==;
X-CSE-ConnectionGUID: HMI3t+10Qv+CeQJpnvj5Og==
X-CSE-MsgGUID: omUg4WLYTZa+cQPwZ5AqoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1556226"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1556226"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 00:06:56 -0700
X-CSE-ConnectionGUID: zJigcUnkS2GoMyIUF6svxw==
X-CSE-MsgGUID: fK/UCXxgTyaFuRDk00PQ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4208381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 00:06:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 00:06:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 00:06:55 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 00:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hds/HESxkRP85id0puS1zZD13jlSAKc1MieinO4UU2oNMGER5nwLsPvsKnOlCDSoTbsA/soz+3Q2kIOsSaWkVVoBoOuz7Ah6ZiBzUuUm2bY8C86s10yJ8WBiVa1EmKKaqNtV0KGsH6cDoCNnytdKOYOn0z1BFq6xh8dSyvkW65isg0twojRxCJYn2+xUrbJqTEJYa+Xk4PvbqpisjeLI5fUjdKR6hnoMGAE/QBVvQC/3IIIMRY889zx9GSQSsGGVvN1fWed5Vs+4KIQyd6yMSVPFiN8vBJYCj98DMwXqfI5h8SEcBnQLdxlTV6dCyLGU82LU/Aid2UvD2buEl1MJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QujZVkJw3NFxWa4BkzZpL9aSHrtj2WVfAFlR3ayyGkQ=;
 b=DPE+yRvsYddBjw55yHSXFJ84DFQ7IH54dFmRuyLQT7rOL6c3Q5RqIDr1xWSciEbgD05WTMcGy2/eEmi5r22Ibi4KLz8ZOwgBBbiU1Gd3UX8XJX6qj8gIAop35pIJcKFKHkQ+f5y425miAmnclfzGGy3MHKD6j914Dd16R93th1fcfT0sqtvcr07oChQXobMPEnSYGIpo0A6xTAKNc1j7j7eMXWkrGmFj5AajXREcy6qitw7nqt3WJIMGqy5Wjp+vDHhUXsR7U2KMBuqRg/b4lZRYDIeqDvVIZuFDYlrzKDVbs2lZHEGA+JaJGziuNcdmWq1rCNGMoj0zDqACCjqK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH8PR11MB9976.namprd11.prod.outlook.com (2603:10b6:510:3d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:06:48 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:06:48 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
 devcoredump
Thread-Topic: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
 devcoredump
Thread-Index: AQHdYinRVibngg3/H0+1XRc2odR2m7cPa1Yg
Date: Mon, 26 Oct 2026 07:06:48 +0000
Message-ID: <DS0PR11MB8718FE2B22F02ECD15FD408581612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261022132957.2479469-1-naresh.kumar.g@intel.com>
 <20261022132957.2479469-7-naresh.kumar.g@intel.com>
In-Reply-To: <20261022132957.2479469-7-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH8PR11MB9976:EE_
x-ms-office365-filtering-correlation-id: f869a03f-17cd-40d2-d1e3-08df332fb3ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|10070799003|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|261021121427099003|10067099003|261009223027099003|261021135927099003|261022075727099003|261022105027099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info: 5T+9caeM1n1i+GhLDwqekphk95oyewGJtoQZK/OAqDAVFsITqrJcuif1VzHWPeyk7YJsCg5ap61GOTmu4wwg5EE5B7Q60FNYeazlWKWyUe8La+z/PVtdLytmg4/9g/4Ge5At8zHc8qF0QxtDIe/iCnhQcXTe/8icmuAtmXMlTRqlpN3mDwAFDDkA1OGovKCvoHV/Ehxe6Pp5fAzEnCJJ7VI4bxazXBhwGvqZ5n4kS9XGy6oK3mW++ZKRD3bZzxpEmDYlJM8L/llpHIxZyYpb0D42PZasBz68Jr6zadB8N/3xNTch9gJivySl/+0mO+J7CDDVJ2qoYD8bO62wskKaZ+KEcZ3YkGN3HHoPCTj71yATyPiig5MNTqRY97RYCN/ZIUjYKqxFpqO5rAy6kwik5C4u/WZCv3TUWUxqRJWkdH9UnnvG9jS5REOAD6ZKBNKgGa47HkScJ/eTqaIPh2xVtaqREwRXrVYX5SM/+eyf414cL8sHb/usV6PZ0cvbG1GPT3DI+E1IA4plsYyi4v2XlJ6qRlo8365oEXvO6zR8s00A44DabRRYeKrMEptrvq1c7nNNABfXc0xwRYUu6vdkPEDH8eiEo+zLyxkVmQc2WDIeSralKGlhcCPDLIX3yMz8nNcCyOBqji3XkeIQYUbP62i1A4+0Kg/zWlPfXk2T04XwaF2scM4XRZTMGt96yn6sEk60Ocr3PEvGQLC9m3lSveVC47HT+uwxBfXDVgT2RkQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(10067099003)(261009223027099003)(261021135927099003)(261022075727099003)(261022105027099003)(261021123027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6aIXKT52xuMaZGhwwWFv2G6Nw2KI8ADYbRUN+Of8qLSO51Ailbk/8yqGTe?=
 =?iso-8859-1?Q?/S+7s10y193UUPZ8pRgUemgtIP8I5vgYmEnaImNaEG+Kt9AtRKYuzKs8Dg?=
 =?iso-8859-1?Q?/THQqGMAtCf6VfML0urML8rdk4d6eG6ttHyGXBjQ3R7UkCgHGhaTlqHQtJ?=
 =?iso-8859-1?Q?F7QxxLpwvl41t8PC6ZgcAo4Wp9yTQghAFtpS69mUcusiNTRWp39/yiMqGv?=
 =?iso-8859-1?Q?R97MRdRRhc0rKRGDAipRE44RAats3Clbl2Q7GMn0lHSdpahnkeyj89jDsd?=
 =?iso-8859-1?Q?l1bd32OPJGtnZPrmBG8kl5gsmfBJ+jvcaIcqGhwJYed//qaSJZbfxq4lcF?=
 =?iso-8859-1?Q?pR0FfKLs4+3vxyogW5fqmkmf0UgLJ6D4Y/TrwXLU7XQEUZqclhKibrjJie?=
 =?iso-8859-1?Q?9FO0EZQ4KPGXbx28oo9lI/pYF9vNDYbCkJFdpmbzwTypWerZeSLGZpdp7b?=
 =?iso-8859-1?Q?ppmY01vTZlt3oeEKLuB+86UcMEAXBWuK2YZ6bUOC80vvrTKHT9k0tSlinO?=
 =?iso-8859-1?Q?FEN8xLhwNW0IdcVEPbb9pLlvnvIkn/EwFPAGZhfBSER4/FH25zSNw8lxI1?=
 =?iso-8859-1?Q?46aQvJbwfdAGPgRgaQ+31tJcVXQXbRnkeyfgbrixkREuGu/YaGH3ibPO26?=
 =?iso-8859-1?Q?E0Y/oWxvmJfggaCLTzO5cSHkA/FuwP+kf5VbpoShLILrChzj0ZaatIx9A1?=
 =?iso-8859-1?Q?HjrpMR90PDkVQoiORYeAhF0/I+tK8kePPzfOhagp7RS8LiPxlhgy25rIta?=
 =?iso-8859-1?Q?voPKlsnoQ7QtEwJL1p+EwOnn/E0N4Ts4KVU41xSqvOVRQf99LTojfNgnjV?=
 =?iso-8859-1?Q?JDNwGdZDkto/zMglgg9yodRnaLYQU+Wh7PB386i29LyRSt2Mv8cNtGZqPy?=
 =?iso-8859-1?Q?9bCfvLP9j7KXOX7lvzRAjMp+s8fJzNVFhof0nnUt1DYI2qVeL7Z/VjNH2w?=
 =?iso-8859-1?Q?Pcl1fYUf3HSUZcLm4qgEhK/UhQdaHWjvQLAh1LqLw+uSOW4z0loAF/BkTc?=
 =?iso-8859-1?Q?jyCg4BTk07JPIELYkPdxFF0vaRw2z6UiSMrgmjbn8e+YyfTFLYIyGhvkvI?=
 =?iso-8859-1?Q?Ts7JU3y8gE2TefeFK6Y9vXqJIsqLsgr51DBTKLnJH5siGFRR1I+FXsQwE0?=
 =?iso-8859-1?Q?uiWuVW6D5sFuP9iNM0PtsQU5r7ifR+13BnC/Ie0xu9TEjtcuIO4lg/6R3w?=
 =?iso-8859-1?Q?qIA9uxbA4u+5lzyA9sEoDPAn1xGbMPoKyHsASf0LqvQcBIAW1ZUG1INSGK?=
 =?iso-8859-1?Q?ol6/MrGmyejpTW9PwJzXmW4hHl5JlHR4uR3kjKQ64WWAPzV4QgciS2QHsd?=
 =?iso-8859-1?Q?XpVIjwHv2sMlljLcSp43n0/IHAUFAfmn1XdFoIUWe9fGJ1XdAHWK8vkQy6?=
 =?iso-8859-1?Q?3+KMJY7OcKdMxDGsZvXTGRZ3i4R3b+ERF78d/RLEEPfwwPeFeLz3SE69BJ?=
 =?iso-8859-1?Q?6f+SjHsmRyI3a8mXzJoPyr38vYqXBbD+1CC+cZEQMDX+JOQ/UXz6TZTLXA?=
 =?iso-8859-1?Q?Hu84pvkU2+2+PMTWPa/vxSDJIFvk2pk5tua2pzRuovmmKxijTq4kir0V5c?=
 =?iso-8859-1?Q?JK0pQprGwKgpTDRvjgxlFic+7PdMP9Lg4XgDA4FpDq/zgPq9xxIccOZP3w?=
 =?iso-8859-1?Q?hcU001TgvbGQTqKu37B8ICs0qP7Zd/0CpXjZblLK3T7k0YrGmkBtqPpuCZ?=
 =?iso-8859-1?Q?ZJDwVy4T/BisG7s51MYHbHMUIkuNaJGQiAaVy3NlER2zFaUrgGEAr83I1K?=
 =?iso-8859-1?Q?NWp8Vdp98rSkecXiWJLAtxDwSjCMZ7Lq4gaVh02TTHuNI4z2SDzqmSsbIL?=
 =?iso-8859-1?Q?BNqt87ZWIGeHovBEvPcvQplNYjNNo/HLLOBIEmguYittufREKyby37Fuq6?=
 =?iso-8859-1?Q?K+?=
x-ms-exchange-antispam-messagedata-1: 5TW/hU+Jkgb5nw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e+nrKl3KachZ9wlT/2g+GV5i1l2zGhRt5tIQMjgWswkbpHF5Jc3sFYn+KfQzoOvMKrjJ5NRuiXWQeHclwsNncOSImuVlzuSW9jt2IfoQM/KlqRwVjABWNqKIFU0dKRSjbHyX9kE8pK8Rt+A+oPZryUp8jtYMjHV68bXSpXyHOyR0c1PyNrEQCUQb7trFdNyiHHZqDQRGN1AQsdv0utMaII+43nTueZCczdEudtEudAYUVS0q4ifWsu4L62LvIKHlYBlN+VafPkMp1cnlL3hncJlvL4N+yFNsO/ddawDrpsZmlThyf5Gs/IeUGFPf523SPrEtOZ8M0e01B92rlVDioQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f869a03f-17cd-40d2-d1e3-08df332fb3ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 07:06:48.0944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mFfwiVPqQr5jYEO9NiSVl2lr32f1xiLNEygXPpE1mywGwSOD0nqp6vY3e2/9kJT0OiUbRteXhb5/D3n9xObiaMVEpRHShOipxJhfON1I1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9976
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 22 October 2026 19:00
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
> devcoredump
>=20
> Add L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions and include
> them in the devcoredump snapshot as a node status section.
>=20
> Extend the register descriptor to mark MCR registers so the snapshot code=
 can
> read them through xe_gt_mcr_unicast_read_any(), then print and free the
> captured node status registers alongside the existing dump sections.
>=20
> v2:(Sashiko)
> - change L3 node registers as XE_REG_MCR type
> - identify mcr register type from reg.mcr
> - As generic capture function ensure VF check this will not execute
>   on VF Mode.
>=20
> v4:(Tejas)
> - Add L3_NODE type into the enum as changed/added in initial patch
>=20
> v5:
> - Rebase
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 +++
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 32 ++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++--
>  3 files changed, 40 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 2e4cb4957479..55f0eee4e20e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -454,6 +454,9 @@
>  #define   L3_ESC_MASK				REG_BIT(0)
>  #define   L3_ESC(value)
> 	REG_FIELD_PREP(L3_ESC_MASK, value)
>=20
> +#define L3_NODE_IDLE
> 	XE_REG_MCR(0xb0b0)
> +#define L3STAT_LBCF_GFX
> 	XE_REG_MCR(0xb128)
> +
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 9f2f46e40012..1c80cc6c3b6a 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -28,6 +28,7 @@
>  #include "xe_mmio.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> +#include "xe_gt_mcr.h"

Place correctly=20

>=20
>  /**
>   * DOC: Xe device coredump
> @@ -73,6 +74,7 @@
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>=20
>  #define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
> +#define XE_REG_DESC_MCR(_reg, _name)	{ .mcr_reg =3D (_reg), .name =3D
> (_name) }
>=20
>  static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] =3D {
>  	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
> @@ -119,6 +121,11 @@ static const struct xe_reg_desc
> xe_dbg_gam_pf_reglist[] =3D {
>  	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL,
> "PAGE_FLTRPTQ_TAIL_GAMCTRL"),  };
>=20
> +static const struct xe_reg_desc xe_dbg_l3_node_reglist[] =3D {
> +	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
> +	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"), };
> +
>  /**
>   * struct xe_gt_regset - Struct for register descriptor list for GT
>   *
> @@ -139,6 +146,7 @@ struct xe_gt_regset {
>   * @XE_DBG_REGSET_RPM: RPM register set
>   * @XE_DBG_REGSET_GUC: GUC register set
>   * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
> + * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
>   * @XE_DBG_REGSET_MAX: Number of debug register set types
>   */
>  enum xe_dbg_regset_type {
> @@ -146,6 +154,7 @@ enum xe_dbg_regset_type {
>  	XE_DBG_REGSET_RPM,
>  	XE_DBG_REGSET_GUC,
>  	XE_DBG_REGSET_GAM_PF,
> +	XE_DBG_REGSET_L3_NODE,
>  	XE_DBG_REGSET_MAX,
>  };
>=20
> @@ -172,6 +181,10 @@ static const struct xe_gt_regset
> xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
>  		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_gam_pf_reglist,
>  					ARRAY_SIZE(xe_dbg_gam_pf_reglist)
> },
>  	},
> +	[XE_DBG_REGSET_L3_NODE] =3D {
> +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_l3_node_reglist,
> +					 ARRAY_SIZE(xe_dbg_l3_node_reglist)
> },
> +	},
>  };
>=20
>  static void xe_dbg_reg_snapshot_print(struct drm_printer *p, @@ -262,8
> +275,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
>=20
>  	snap->desc	=3D reglist;
>  	snap->num_regs =3D reglist->num_regs;
> -	for (i =3D 0; i < reglist->num_regs; i++)
> -		snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist-
> >regs[i].reg);
> +	for (i =3D 0; i < reglist->num_regs; i++) {
> +		if (reglist->regs[i].reg.mcr)
> +			snap->values[i] =3D xe_gt_mcr_unicast_read_any(gt,
> +								     reglist-
> >regs[i].mcr_reg);

The requirement calls for reading L3_NODE_IDLE once per groupid (0-7), and =
L3STAT_LBCF_GFX once per every groupid=D7instanceid combination (8=D74 =3D =
32 reads), each explicitly steered via the MCR selector and labeled Node[gr=
oupid]/Bank[groupid][instanceid]. Isn't it?

Tejas

> +		else
> +			snap->values[i] =3D xe_mmio_read32(&gt->mmio,
> reglist->regs[i].reg);
> +	}
>=20
>  	return snap;
>  }
> @@ -345,6 +363,8 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>=20
>  	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss-
> >gam_pf_report);
>=20
> +	xe_dbg_reg_snapshot_print(&p, "Node Status", ss->ns);
> +
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>=20
> @@ -402,6 +422,9 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
>  	ss->gam_pf_report =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->ns);
> +	ss->ns =3D NULL;
> +
>  	xe_guc_exec_queue_snapshot_free(ss->ge);
>  	ss->ge =3D NULL;
>=20
> @@ -602,6 +625,10 @@ static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
>  						       other_gt,
>=20
> XE_DBG_REGSET_GAM_PF,
>  						       XE_GT_TYPE_MAIN);
> +	ss->ns =3D xe_dbg_gt_snapshot_capture(gt,
> +					    other_gt,
> +					    XE_DBG_REGSET_L3_NODE,
> +					    XE_GT_TYPE_MAIN);
>  }
>=20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump, @@
> -653,7 +680,6 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  		if (job)
>  			ss->job =3D xe_sched_job_snapshot_capture(job);
>  		ss->vm =3D xe_vm_snapshot_capture(q->vm);
> -
>  		xe_engine_snapshot_capture_for_queue(q);
>  	}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 34f224a6751f..6cbecad43c42 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -21,8 +21,12 @@ struct xe_gt;
>   * of the register to dump its value during coredump for debug purpose.
>   */
>  struct xe_reg_desc {
> -	/** @reg: The register */
> -	struct xe_reg reg;
> +	union {
> +		/** @reg: The register */
> +		struct xe_reg reg;
> +		/** @mcr_reg: The mcr register */
> +		struct xe_reg_mcr mcr_reg;
> +	};
>  	/** @name: Name of the register */
>  	const char *name;
>  };
> @@ -105,6 +109,8 @@ struct xe_devcoredump_snapshot {
>=20
>  	/** @gam_pf_report: GAM PF report snapshot */
>  	struct xe_dbg_reg_snapshot *gam_pf_report;
> +	/** @ns: Node status snapshot */
> +	struct xe_dbg_reg_snapshot *ns;
>=20
>  	/** @ge: GuC Submission Engine snapshot */
>  	struct xe_guc_submit_exec_queue_snapshot *ge;
> --
> 2.43.0

