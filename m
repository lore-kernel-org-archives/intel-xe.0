Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D368C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 06:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FC410F3D9;
	Fri, 22 Mar 2024 06:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCco5+J9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E83D10F3D9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711087537; x=1742623537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GNf1jJKVeW0JDllol7jPsARdQnfVruXZe/ZDFwh0rUI=;
 b=gCco5+J92IlPUUmeBa5dd5pSaQ5p1mjwZpl27EZNASv/7BJZTXjnM8W5
 ZtjuZwRmPqLf1GANMrZ8QjIqjraSM/YuUH8qzZgttoxp/6L1xouaFytiN
 vPHylcZVRlSGp+tEHgXD3prnmTwjjBG2y5LkORtC0BDFlI3UBtukXZxZy
 exAPSNzAxdJhTcrMuIoSGQIJex9MtCKfiBBqCL/mADmG8moPhXH4zxsIm
 dBTXbXqrVVr6G9kaBw6a7DE96cpUGxp1/2bBmxMXaldJCizFy9PvKqQOD
 qXeGkfNvxOs9AS3sHfEcuTWBln/pRnhHEJnlLJsjdl5bGNCaa1/64yLH/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6056101"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6056101"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 23:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19434081"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 23:05:36 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 23:05:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 23:05:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 23:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msirahF7eaZLgKvWKZ9fqUFRzpfGNZL2HOhnKbbaMUqWNe8Wmxah9i1mL3KBZZtKldoHa+yZi8H0Ggyq/dCrNQqv3auh0qSOVQAEYI6V5CKv5wTrEMRDkejfYCCsWW19iIZKCtFgsGp3VmRSloXXlb4n5e8UUikiM+I7V+CKze6uRNWA9iT3B71DV8I5G+HWAsebAGd2zLH83EbHXORQVjJ5nYSaUIL4b+rXZbB+ETCCLS15NlLD1qb8APg+PusF3thkLiEBTdq/ZJpXNdM7+TUWr9fCgY4zpEieDtoK+L3YH+n7pMupgQ/gW66x8dRs+kz4y5mxK65xC+obZ9wIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmbPs1Xg+NAjEFHSDVQN1TAIYa1B66iMu6dMvYUyJBw=;
 b=CvTv7Qcl929utwFeZq09Z/NzKbWfOR3fuj+UJt4IPQNzs+Jq/oC4T13DsJcieUPHY3ifSuiY3XPsGT0/QURT/KCdr767/RbbXxpEfkSP1dVKSehEow861SzcB4z4BFiETpGzYd5n3x2VfFeNsMk0p+4lgXqXiQssxDH0+oJYZIRxlZuUDTRP4apZFYTtAcB7YCbHg5VT94qbOcyxNMuLPRqq3tdGqGC7JcYY7DYH0USuorW0TpGE7vxQo6Y35ehKo1BX4MdabXUdiJO9X8t2iiKIYGaPY4P4uLUIGfRop0Qub1RYn5N7sSyPckM/CEWcfrTKUXfn+GzQRGUQ5iJNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CH3PR11MB8442.namprd11.prod.outlook.com (2603:10b6:610:1ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 06:04:32 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::4c82:4136:12c1:30f8]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::4c82:4136:12c1:30f8%7]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 06:04:32 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
Thread-Topic: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
Thread-Index: AQHae3u4zlqWKybIok2/wWHXOmc4SrFDOqjw
Date: Fri, 22 Mar 2024 06:04:31 +0000
Message-ID: <CY5PR11MB6211A336A3E832319D7C98B595312@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
 <20240321104624.2205317-2-karthik.poosa@intel.com>
In-Reply-To: <20240321104624.2205317-2-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CH3PR11MB8442:EE_
x-ms-office365-filtering-correlation-id: acadb277-6d6e-4f79-76a4-08dc4a35f134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cgc1ol+C6e1m98bT1ydkFwAnxAUwWSHg1qYWd3gECLsUX9LUkamjcVMF04ZxLUWfJkkIVEhVylSX3wKj3HVnUrrfQT89SLlFY6eM+PW+drjOraA9E7kJQ4Zor8yY4TtrrmEx1W6WvQXG3tkGdpU9jE7kq80suCIirmeGYknCAGxxT9VeIzITVQJLQ+MmKg1zvQ8bKOZVmHlyXlmHldFuCD9+s9kDPirxzfbbmIfNEzOMI3x1dEOohL4lEnN6boFFsz69QYMJaW2CwCKPi43eeMEOqTnQMfl1/1T+fQZnMvJcc3PbE0EPex/Jf0WS0KYaF9BRmVP9wPMyqcCsf5ho0K1lQabfMXcOneA2LcF7M51FSQE4srJpEggPV/XIx8ZD1rYhQg7VkFi0okDsBdTxwwXni2x9jFATBJc9dej9jyrMmzD6pbIgqmCFoXja47XN7CfpJC6MgpPQON85K2YCfxTRuTItVDQ8HQJAheTgp99MGTgPEp3G6sbWG3twl7TbvOjYTDx0rNCCkUWwFAclvxYvrS7LQ/k2yrmpb8SNiRVUW7jPnPBzcxudTxkouacCjWjl2TvRar0HQyjsG7ASe2KJcIoXybWTgx6XxvRBCmRhdrHjWBJ19Ep0bjjpaZQ1Jbcbjwgs9f9Ox3jrUKMiWYGefh3oMK4IJZkANpy58tLE45bo2Qiotou8M2LCzNBKnuFvn/k1NCayxVBQtPZ/yNRYQaqMxq1cU0lZjLh9fd0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OOLTo6WtCGsP71Hg/UjMiAz8UDv4fCRtfZ7csmbDHY07aCJ4pb00x/+ZNobn?=
 =?us-ascii?Q?9VEiI/+4cC959h3QyosLGqAy66m3K+F2h+QMK1irv5YyE2JZf/9NdQaiFIXv?=
 =?us-ascii?Q?QcMSaHvfrLGn3VXsQupeF2IfK600askejNSQsatZYUSOHACVP1F9uuz+q+3V?=
 =?us-ascii?Q?Fv/Oa56u2CCMHeHGM/OlqBeJM5hTG8KkEbSvttpkdZfO/+x7VSJPWCuYQ2gn?=
 =?us-ascii?Q?Na/PR9VjW3DmK7KRwZHlkLdFRZSTFVUzYZ8ODnbYHyFU/6mZX0euxuihItqC?=
 =?us-ascii?Q?MCtCJBFfF/FQ7lEWRjSkgolQHhvwq4sMDUp36SW1qxAD1/2AKvza1pT7fSNX?=
 =?us-ascii?Q?B7Iw3PvYX0mBKoqTomBhvONWDXO3Uvs6y+zU4yLr4kM4ws8qsDBNyHp5hvhu?=
 =?us-ascii?Q?SFl48txlmBw59LG5N4cUucuWIvy9bq/z3p2k6rlc1ytOib/s2SRdKpLmVrX7?=
 =?us-ascii?Q?kjqUBc0r94t35NaayGZ16br62p15dzgm9CBGccc8eIQRVoaC8mKiZfc/olPY?=
 =?us-ascii?Q?kS4atgT9cr4Y8fL5TwS3UrZNcjpCJYTfMB660X5/Rfk/YrK8FxXRJtDdDbIp?=
 =?us-ascii?Q?zm+u7k/jFeE2PFluUTw/D4Xy7ukMgQhbhadmBWV+1fvEGrXlSCQlAqmdCSez?=
 =?us-ascii?Q?Mny9esKoGDqvHFvzSXPAMHWilFKGlOmaDzk9YL2CWI4TH8XO7D8QrSWWquL+?=
 =?us-ascii?Q?Aod4wy4kw8Wgyr0vlIWcbuUvOu/0UbiyJMuWm5hBaW1+9TOaQTjCdBvLNevh?=
 =?us-ascii?Q?kr0WTw/2wUl4RtJz1XjcegEKs6WtwL/bJHhETHAMvGQMBCPJtZ1v0DnAj/pQ?=
 =?us-ascii?Q?VrdAoV611BSK8f26fvGO70gAAA6lP3BQFzgCvfeCcmD0Vfo2OKIwzCUTh6FT?=
 =?us-ascii?Q?99TJCPDMkYqorClinL9psbeqH2yLoIHnZL2vSe+tI3DFj0aEmFok3tk0RO19?=
 =?us-ascii?Q?cpFdZo7qhUjL/9HtlPeTk36cr131qdPjW8rxIj07ACPkFexPzKhOVCJFXo6g?=
 =?us-ascii?Q?V5ymBZMD10slb3IUfVOJ7TsGGDuO5A1owuylSB32MueD8PbChfVj4pKp+VvI?=
 =?us-ascii?Q?8jUYUlJAoSobIqgGy9UJLokDdWzKmJqs9F4ihx9QIM4VIJ8R1vPvtemzf+P9?=
 =?us-ascii?Q?v+RQ/cEZkYrxAF7TnOEcUSqCGeil4YilCfUm/thQy4MCCWWnMQ0C6cK3wtWE?=
 =?us-ascii?Q?ZiWSo/HkWwe5hN0wP1Mqbi1BhcF9fN9YELKlcvmJifHLZvlgfSyp2JTdvLt7?=
 =?us-ascii?Q?MWaUQPjtBGz8jjRW3Y6TS9kAI2DWiQ/Uk8fhHnWWDVn5tNwUKIYxKczlVi3g?=
 =?us-ascii?Q?ABoCVZkI7UQIT1v+6FYmGgvfNAEhLoa8mK/jNkr1zP3/zZ6sygBmGxoZMi16?=
 =?us-ascii?Q?uuGNX3SyvGxPZ8D9FbU6xnrcHrT9jSYBVLJIExAkUB9dEp68kKCz9F/H5Sgy?=
 =?us-ascii?Q?ZFPMDSlCUVtIoZZsqOJXtBpXRPq6CQLVG3MAkJp4ywRv2ZpNvYZWno7zhJkK?=
 =?us-ascii?Q?Fit5HhpBHhhFwya0sSgC0aV41hpvUjTTXpS0W3Da3IlsYjWhJ7mVTWLDf4o9?=
 =?us-ascii?Q?+J9I8w9Reg7cPP5+sNwLiZohuyPRrTUG9iDKiaFx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acadb277-6d6e-4f79-76a4-08dc4a35f134
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 06:04:31.9834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wa4bO8R7AgUSRi496EMcCXGUlhxWegoBgV5/M9aBGeVAlRDYPuY5T+5bfWcYERA16DBF5dfC2HDOqokOxtNcmCGvxyqQNP6o5cwszIx4BXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Thursday, March 21, 2024 4:16 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
>=20
> Add a NULL pointer check.
>=20
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power los=
t")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> cc650a92c2fc..5cb5aef16823 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	 * really lost power. Detecting primary Gt power is sufficient.
>  	 */
>  	gt =3D xe_device_get_gt(xe, 0);
> +	if (!gt) {
> +		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
> +		return -ENXIO;
> +	}
> +
>  	xe->d3cold.power_lost =3D xe_guc_in_reset(&gt->uc.guc);
>=20
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> --
> 2.25.1

