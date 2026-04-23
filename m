Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA08F99340
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 07:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4F210E308;
	Thu, 23 Apr 2026 07:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Il8DnAWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEE610E308
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776929287; x=1808465287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=Il8DnAWxh4pS0Gzk7D63ulkBKZaHjR8dBLrr61JoiNrwS2vq+rFNtUYD
 mmi9z6raAUWpSEugpNyR9sdZYZ7h3zvH9TJRBycYbj3HH3KrdfmBunXCp
 H7BEuAkVFn+DtLbzMgiRBnfJesm3ysWTqUEQ9sDxeul5i6PCV84dLxSyd
 d0z6QsXSI+PVmJKugqg68Ebd/r+Q58PesgMBKcX13znlzNyvemtkXOf9v
 Or3PVrx7+Ttb0s3F/sAxAyEyFzaOb9/mxDPOnumArDuqkkYOk2eI32Jyz
 sGZZKEG/eIZtPYtgWll9iL1fUqCULqilJY+PeZchH9rtJtS8G3Io8UFEm g==;
X-CSE-ConnectionGUID: pxSrc5CVQpWoF71jeVvE0g==
X-CSE-MsgGUID: H97WjcI/QmCuh19CN4NWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77953937"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77953937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 00:28:06 -0700
X-CSE-ConnectionGUID: tBzSssgATvyNEYm/GqjD2Q==
X-CSE-MsgGUID: F8rBhGeUSOqVyYNL4AuO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="255879992"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 00:28:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 00:28:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 00:28:06 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 00:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5eswVStjyE1kA6X1NUL3lPfiB2qYBKBsP9w9edL104CLNF8xYE3TM+8RRiqIDddXpi52tlQePUXerUIgClf3prvtzalt60zjaTOieSEX2JixzTSdXoef28jo2WfxgqaDmd8aSYHPBG/R6jLDmwuiLOiCsB2rQDUt2BgtsiX2o42gDexPm8ktg2bkM8d2wVlshUDiw4V7hMa7wuQwEvZsQvb9kvQExOEfI8TLGyRBIhccz2Ro1+bxl4zEMhjMRDbW6iqcK+LPyIlAzFYOQ0MUMo7Hdf5s/Ta46Kg4Jb112pxZ3B6BTrHUKkLW7ZwR6oQNhWq6zK1oAoz5nny52ZKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=MyLg0iql0o/X1/ZycE/o9aTL4Zzo0pwFOozfuuii36rvJUVF/3HId9Mpjv6lTVgB7a96/b4pfRcZi8yVHFqvUrnjID6DeNp+TBmA1CpMGQttPLZhRAtvtNEJxnUy1Vq1pmhRi47ty2aCwWKn+SO4nY7vP5O+5FeHVj9metUa332j7rt4KEmjsLJw7lwCtKGlO51phpPU9ynKjMNwp3DgTYo69OcQ3eNWbxadHJuhtL510EjsKnTU9ZAFEB+cAyc7PNtORXtuX82eG3GRWPTP8uhtYfkKIyGX9bmsIz9qIMjpzj3UmZTJb44ii8Zpp6NdgYZiuVPJcXSGztQ7377jAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Thu, 23 Apr 2026 07:28:00 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 07:28:00 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Yao, Jia" <jia.yao@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Mathew, Alwin" <alwin.mathew@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v10 2/2] drm/xe: Reject coh_none PAT index for
 CPU_ADDR_MIRROR
Thread-Topic: [PATCH v10 2/2] drm/xe: Reject coh_none PAT index for
 CPU_ADDR_MIRROR
Thread-Index: AQHczi9l6XfDmlbUdE+xrL/4imC4H7XsSPxw
Date: Thu, 23 Apr 2026 07:28:00 +0000
Message-ID: <DS7PR11MB62717D1221C4E8C5E18468B6E72A2@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20260417055917.2027459-1-jia.yao@intel.com>
 <20260417055917.2027459-3-jia.yao@intel.com>
In-Reply-To: <20260417055917.2027459-3-jia.yao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|SN7PR11MB8261:EE_
x-ms-office365-filtering-correlation-id: cbdd423c-43cd-456d-9e17-08dea109d91c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: yQd00KwmC2GYQRIOrkUj+EtumD5/9/g3s4+peQIbARcQOONmgFnvwDSGqqBxRDkzGRrEKtTR4Vh1O+Zck1NEHr7TTeX1HljEXC8dc7jG72oqvp/zepzHl+hNYBslZRnP7CUJGZ/aJlnkBpOjo9PfMv0eHIrPIAQvRORuxC75XRSjjYeS0l+1SaRpZTZlw5N8qMpggmB/OJsX6K3cz8Svy804v54oDjRzIqWaOaExqW+hDVNo8pl7MiLu9JklB2Wxw/ZrdhGVlqpfHk6Kv4DlOT1qQrson9C3hEATmh5WISYfJRBtz/3WR5LrHXniJRzsfkWzW67+RDUMCZMYbWyqmc5j0DEgBSGtLw3OoeGdfAKodpIY3o2IvftTswC3+Sa7wPU42mQmRBw/DTabCvu1l9T7T9PefWUOsawr6cs3ufD8BUOD6r7nvsFzjeQTyQJ03g/glAdaaN8f64oTkGx9ehfEaZUOffXGc/E1LivP9KIfEOTCdFfxO9rw3TILatowvU9hFp3ketc9YGE/n+a/xS44i3Z8eepbTe9qbjthcGTjXXQV6QN607NuFYytt7BdL5ZILe+IIwlyuiEGekWk+LRTDvt689rLTBjcfuj5+jJrsUdu3iwhNd46wutu0SIFWViQgXCFgE1fpG9812TZze7Boj8wfS0tXt5eGw4a0dnuCNpEfqJu+5RmbFHuITjd558adZoQ8NgTl28CA5lZqY5dwN8FLyA+TK7Kqbd2nBlxehul4CqmtQhMC9rkZoIV5zT0+xHHh8QWipVrkroNQ2Bggdz/Vw2RawEtDj0fnZo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jBzuhQxHWgRavAs6txWMGQTlOqUkOfs+Xkpj0PN/QpMmPqTsOFJjwtGlbKbb?=
 =?us-ascii?Q?tG8sbRhZVWKdOI4FZ1172eYhSArbelrD1LOGTIB6rZm4BhGcsN9WoosLG2rj?=
 =?us-ascii?Q?aEOVXBHi7Ms1U4Mi6B5IaajUhAiFhsb7MR4t8IUmvi0AH46UTjNlhOk6ZsYz?=
 =?us-ascii?Q?Dh2c0mQOE+it6zhFvdFLf2cGJnm02ssum+czzaNS9FEYmDRcvypBa/fGM35U?=
 =?us-ascii?Q?A22Yg58qaB3NTZOIWWq9VPWXQMjEruPw8g6VIt997ZzwaeJXzqcW95V8VF4f?=
 =?us-ascii?Q?cVqgu+vPqcXhYEQoHH6KJF7R/rXIKjEMaEOED+qa1MgkYNFppQQ5HLDS/ln2?=
 =?us-ascii?Q?MWFdZJpxAo8d6kgkSjWs+kNo0FbeTDgrF4rKJqlm5whPDwz8dLE+1iskhpGj?=
 =?us-ascii?Q?CtazsOTvLayRCSA/7l2qxM+A8953/+PHZk1ecUBObl/KTj1CPJ6jlFBe9jdU?=
 =?us-ascii?Q?VmmkXAxs5SK2XWfywRqMDjNEwHfNHRRlEMYtC85DGbhdJp/kWSRHCPsU0Bnb?=
 =?us-ascii?Q?eWymrb7coCTFC56SaDx2syjBkzxV1UCBWnuquzGu8ZoxW18cLjABq05yK2aD?=
 =?us-ascii?Q?Id/FaODQd6ez5e79tCqdDSH8bTkXS07m+HhLLGGFZP1gO/5pHSLDhNDkK3e8?=
 =?us-ascii?Q?iV1uXEWusFP4AExrc6riFH3NA6NxWJaq0+rV6aeb1x9LA/fhOWzeZOlpciK3?=
 =?us-ascii?Q?0ZMgnM9a/sYcBkS6Wf6ZnIjMmji7jfbRe9R1AJ9hEvQVCuALXVoqVr6i+QK1?=
 =?us-ascii?Q?Vh9atgamJPg2cAFJwAIn+pVS3urC5oOc1XlDI5E66DQkLFq/dZ4SF/lBYloD?=
 =?us-ascii?Q?+ijEk2y7f46cnMbqr+YZXDOrBwpPWaSw47RAu1Y/yCJ9ZRlmHbxyN+1JO9Zx?=
 =?us-ascii?Q?fGUMJHPOpGuXgo/sXjUGD1BsUyeukwDs2A5gOerrgYJdXLNKCBwZNn+rd0+o?=
 =?us-ascii?Q?Nu55SPjLXv0vNlovp1sO8x4Tl8vcRJk3OyVfEBfcr/FYVp+VAsgTrnkdpSvw?=
 =?us-ascii?Q?lxEfu8MjRjQdfF/tl47cN5QX6y0zfoeNfd7vDwWyxEcp5az55wdELjE8Fgee?=
 =?us-ascii?Q?LtbxCuZKPTxvlFqLxY/NnhTXPSv4FzAKiMcfm1VwABOPfrPC3ir+g9KbtFPS?=
 =?us-ascii?Q?JtPyf3CArwmxsaia3KQnEbeegpL+3pC9KCTiRC1IwZcuSgk9CFVValz3jGC9?=
 =?us-ascii?Q?oHyIYQa4GoEcOL0ZGrXqgY9vGV++JqzzyqZoGhq2xfMxpotLdWE/HhViQvpH?=
 =?us-ascii?Q?PIrewpmjOZQIk8hw7M7FPJv3Ph7N0L8OnwUzBwsqod+yGh0MSTi0xi6bEW3t?=
 =?us-ascii?Q?lgQ6gvsQAS4kEKvm3X5Kk9vmOYn76W+ShYACu9oPJWWcSlbk5X/X1VypPZ60?=
 =?us-ascii?Q?o7pODhmc0lAT6AnOy7ZweSk5R/Hd0z1ojcXZZHU845mJvOsnavu7JWbND1KM?=
 =?us-ascii?Q?93+pg8DH7bZov78svWy6xD+0isU81HhNaHsBeD2pYpSTnVU7qE+GaCDwNMie?=
 =?us-ascii?Q?44rhfeMLCHK5e5PmoNbIkIpq4Qsqzy92oPngISfVfpsOfczZaHcndOf6YYC/?=
 =?us-ascii?Q?0KxM10a3PQIKseP7aH5T3l9FGoIrYDS8UqCY+NzQjMNDzad02jAQ2zYN5EtU?=
 =?us-ascii?Q?7nCFLKQXcfz0N6ugDPDjoEWKk+AbTgtdA6oWF/hDjnyRlgwMNwiR+z1JXBRj?=
 =?us-ascii?Q?WGajLHxzth82bKiFzxkACdqmwpIZ+OnVjrXMVqlmvKTVcsYNZms03mXRFHqF?=
 =?us-ascii?Q?zGBf7t8nXg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QHqEyTiZdshj7gB0wyYcVhGqa1qWCkw0DThgrv9v8Lu04UH90adCjQcsAzL2/7n7Ph81UZMtNT9+O12U6yV+gqkI0R4D5IVxz1C7P6FT4CblYtEFos25QOmY5x+iIQqupsrBS7lo7jTtSfJboaMq0+jh+YDQNMPQ2FLwEm5UmjFaNhkiqw6JMgCJigpXdNGnCsSCXdY2fNqgkDS44xUJd1sKuFae5Pl5pVL/t0p4zY0cJ4jTqf33Qlwt7Mm95Q60GGJeUlgIcMsE5eoYk088uQUco89AJ/P64YaZguPClllkCAKDGt784kLJntJsBPKPqQhoW9JHlwUVJvbv5AbGHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdd423c-43cd-456d-9e17-08dea109d91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 07:28:00.2194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gv4UHHuzWskGxX8/SiQbHg92oa69f7Xf14gNVMbO7fHMKD6lv7xsgOCDs4sbIhrkXGXmPxyWFnHj5mLCJLBzWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
