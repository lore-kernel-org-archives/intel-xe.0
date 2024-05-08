Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E05DC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 05:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ACE113276;
	Wed,  8 May 2024 05:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UutNMjby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46752113275
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715146514; x=1746682514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U0WG5SpPEJ5srW8xfqfQ3zNFTfU7smJzBquOJ4MUm5I=;
 b=UutNMjby08yq5nXgW8PbO9xGVg2dM6CVwoaU6HVcTFIEQsFGzsK6vsY6
 ZXeJHTvwpEfs4U27bf6F/1v8xzJ2boiACqsNyLnUJkZ6kR827gr6LEvUo
 oqD92fobwxJx91KjE532oXVH/WDQU7F3RG7yimn3c2290c9w6GPTGc7JI
 OhmvrzJ/9sQLnJYFw9/ZoWMTOmKm5JCb23w+SoK5NpWKiRRWEqVAvfWz1
 N52rFohLSXN67UC7nqjzM3yz60gE5L+SoYLnq/sCdpmiJK4YvvkxHWPdc
 E/WzmonXL1IAHE+TvdWwUF4GVOQiMqu6MtYDuF2VpfIn+5AbFa92BSWOy A==;
X-CSE-ConnectionGUID: wxeMIrgUTLWb+MoccDwrjg==
X-CSE-MsgGUID: vWUfw4hGS2eqExQjEWLaKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28501245"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="28501245"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 22:35:13 -0700
X-CSE-ConnectionGUID: BiF/cbJVQj2UZrrW7YNHEw==
X-CSE-MsgGUID: 1PyiqmldQd2xcuaJ1ATbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="59616401"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 22:35:13 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 22:35:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 22:35:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 22:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yvhfsu+CF/ift1No/U2m+Z6MmPkM/GM/NZ9TL+XJXgREHlqUOvbXTMfTIk+/caBgX3/5aHwMIzQ5OtFcjtwP2K34SZRLBS6EpHIhdEePZx6aby3XQiM5m4+V8zWqD3oEGAz+1S9tt4GahT2Zi+87PSrFQCGbcG8ayh5cT+Bin7ytt9qNtyS7hTamDwrwyGfx6iOR5FKV7M4wdaTDcxjZoWLYloBv7vvjKO9/Z1OHalcHpXgd0w6omk6zoMwCXgcScDXVGTzBi4EZJgwjwdIdojV8XQeRjzpsVDzd2EoVe+z1/etaYOkTJXjwdActfvfpp4u+umy1t8S3z7uoHErDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptYrClEQ4fxaJfWCY2ekoNss/QLO/CslTt4GS6S171g=;
 b=bmAlOkux5Msqv2FtJ3eX4u1yhudpg3xzYs2LAyK8OAnT4l3IBLa+5S3Ks7m45lx2pQ9toRsPler0XxGCHsXVjiDOEqzSKbK/d3ohXmoQ1AIdnUG9oBVefGTAUfettXVMPWGyPfaflWWpAnIr7Mf00XDFDz4m22r7qPyZ65OjKh2Ao0WiYSIO32h22e/qQ2t2Ame3YV15JZqzjDES9jYaNd+Glb2R2oOWWHH20pH9DbRoqXWCcodL7WTzP9vib3SJomBlRrqCSP/yo3VMQY8hk1uLepDOz8xhvT4DutR5+MQiNYVdsT3i6/ZuekBUC9G5nMidxo99m6gpLtEJ56jprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 05:35:09 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 05:35:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: RE: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Thread-Topic: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Thread-Index: AQHan7gxOqMPaCmNxE6VGTrglXlfo7GM0peg
Date: Wed, 8 May 2024 05:35:09 +0000
Message-ID: <SJ1PR11MB62049DC9B7ECB01CF252059081E52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7480:EE_
x-ms-office365-filtering-correlation-id: 45ee033f-435f-4251-6923-08dc6f20a000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?DtI/tMQYHOVA7yPPATCsBf2ca5R87ipppOdEoTsn0oGLErHVuccC64QaaOfw?=
 =?us-ascii?Q?VKdulAD0tAnyJafc8U7hZ86melzPm+HOF3v/shIF4PUQHvjFGxOHCRVH1QTq?=
 =?us-ascii?Q?vtPlPMAcX/xM5FHZbqeHdr9jcVRnGx+l8s3nVuXyzC7h1go1++7B5H+6JGEg?=
 =?us-ascii?Q?oacSB5KDAUyRhtjn6D5AvrGDBh041a1JDp2ef/bYb7yOZaBOWy7mXHweaYiV?=
 =?us-ascii?Q?aEGLQzTpr350strma6JQqztYrmYx2xVLBdWbIycIwL3NJfhrBioYjNe8MoZ3?=
 =?us-ascii?Q?j0exnlFMnvGtwxFMmPnvEEcQ35qwWdooX+/5aJcYN59nyVBUeTjmyJeIqq61?=
 =?us-ascii?Q?HHCIbUEKcnWFacFg9JANwLdXtmSVu/hzwo51PprGvkJjj2lElVdXxTMNbJRA?=
 =?us-ascii?Q?tNHxiVfZB+5nnyDf7+mNgfYSyAewph86D1YJMBIIsdxWE1r2z8viLRq2K0CN?=
 =?us-ascii?Q?3hdwWofWJkhJT0WNQqGhjRc9luAYjfjR26B09+Onn/d4GsPff3JSxV4UMBDs?=
 =?us-ascii?Q?2R+ZqUkGdKA24+XYsewQ9smAtREHGFOG96Qc/Oyb0tzhQ0p3HM95hE3igX/D?=
 =?us-ascii?Q?YrL4VC0nuV+V0wYUxOrMANazV8JYmLOYgmepV5ZzfZ7hqhtxHt37CUMUhYhu?=
 =?us-ascii?Q?KBFgpeNdP/kwwdMMtbkzQYApxr59OHLWF2OC+np9ZLwfqpZvp3pMwEVXJwE5?=
 =?us-ascii?Q?d/5loX1UmoOfNVLQmL697DfPMJKRbpFIFSjww5C238yKslh6DzjE6RmQJozV?=
 =?us-ascii?Q?hl8DOBFaLgflEx0jn9T+KBtNVhagaRB1gHinXoxXqExby6uRrWvnra3mrM00?=
 =?us-ascii?Q?1xqZ37kZwe1Z+OJYzLcRHx9uVpe0xNkJ+/XB2NxeNTxKmgDYTd8fftBG3XnN?=
 =?us-ascii?Q?fk7b6tDNk6crSzIi6Atyhcl2XXe61J5W0ifx2bPtIPCdem5yF6t7YZVx6kg+?=
 =?us-ascii?Q?Yf0w8CVY2cQ5Yt/puQWoUspEBBfxvl9L3KH255jES4YNNnZ3gQfPKxxg/Bqs?=
 =?us-ascii?Q?rQ1dEBp/Cxw2YViWCaZeTwTTJpXJ8LHoH0opSxgzchsCDDjTCOpOO9FNX5Oi?=
 =?us-ascii?Q?HG7tcdOYWTzWbJr+SmbpsETftJBnCFq2pisvPHTUujzl8wg526gjiM3odjuS?=
 =?us-ascii?Q?jxxZZKriFbcCbZK/52dfFLUPVX7tchN+iD4WriAEbbt9Y3pkJRnHsK9E4Vjm?=
 =?us-ascii?Q?RXDbId4bbPwqDz0ccXho0QWam0a7Je8HL1a1zLq1R3QpNjNT7P6A4yNeOlsn?=
 =?us-ascii?Q?vLXYl54WieeM08Bu7Va6bXVEHzmnU1RxSxgquFDNcXuMlu9SQKpcB5FdDDMD?=
 =?us-ascii?Q?Jud8cZ+7ejkXOSY4UXluP+T2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OcSJqWOYkiDEg9rc+9tm4C/H4paSJ+ZavOe/wSKwPF7rlPVKjB6iIM3mReYp?=
 =?us-ascii?Q?HnDqDTFpVf6cqKLF0aMCoWJ7zQhdK19BkcoySR7m0aPE46rn99qTmKiKYK0V?=
 =?us-ascii?Q?q4NE3hd/G9DmAj4UuDiTSmWvYoxwtNSKiJUnz/cFwGpmELunKjDc2V6NSNRT?=
 =?us-ascii?Q?/RMo4CHxnCorFWR/oHN5zhZjBmEgGUpEpbh6qU5uZjw2gJJ7Ag1LtmqfAxVu?=
 =?us-ascii?Q?fNN6CWiqxZfQNwUGwFzU9Sw74nrHWT4Z6r1pRVediJLlmisyJyIPtIHQ9/nL?=
 =?us-ascii?Q?wKpjYKiRaJdwjn+kXb0zXc2lPbxv+d15uNrj6AnaK1rQ+CvKcS95xaTsgGnh?=
 =?us-ascii?Q?CsgMSR0GJyBRYQUQXowYCtDqqjvQGGWb7DNo8XyrVAOhip94ZnPgAAeFCRDl?=
 =?us-ascii?Q?LTlJj0zi/Fpnh9xC77ERdJSFoLWQkSgVtjMgcmoK9oM2xBelZdUMoebwcKmJ?=
 =?us-ascii?Q?y/XKoc/hRRPB5QzbR7Gpgj4WLznvYN3MnDb3KPXzeTMPYk+v+cTbjAO/Un7E?=
 =?us-ascii?Q?7m1MIS5sPgr8eQ0BgNw8VKEgOJANtuVoTdfBfJ/nOcTafFxWQ6/SKuBoLTOG?=
 =?us-ascii?Q?7j8bkXNl/znZrs62NKZhkD/M0Z1IleVWRKFLPH8pgIZK+bKq9ZnU+xdP1u2k?=
 =?us-ascii?Q?T0MOIi5XAvrnlZksMrnrAVK3coSPzOqLHbh5NbsJrKALAoNPu/EkN6SVk1SV?=
 =?us-ascii?Q?5Az3NTP9XR4F6ar0PKtxv8gFpFS2CM8KRmisq44FyrE4d5pF192BYtoGLUK9?=
 =?us-ascii?Q?R/uC65vjG2yXUy+LttPkpq/OyWIgyF819bl8/aXxD9Dw9FACoJxQQoLQBIE6?=
 =?us-ascii?Q?b18vlWmGJYCWZT8+WEemcxpXZ/OeblQi2Z7euZnR1AyESn+PHYERWTHni59R?=
 =?us-ascii?Q?188D7iltKXOfojXnqcb2CeZujqjtdhbvAnMrnEBlbVsauRVCt2N5uRwY39h2?=
 =?us-ascii?Q?lzdTjjvEPJxqq456lKzFS2rNM54enF3fugt3eKTzxtiBeMy3SGdKB6H9c8ff?=
 =?us-ascii?Q?h9bBJdAn1tsFPExAFhK+rg4YFxxpzNk9YhBPHundRq/jEb6b86HJblk0FqJK?=
 =?us-ascii?Q?4EFQLy3ZQ11scRL/28lUIFFVRWkqRlD7ChnyXQtNx7rxOmP5Wza/UEluGlTy?=
 =?us-ascii?Q?UwatsEpKlMLyD7LB93xxlN5qoOxI6U+vAGTuzhmnZuocsZV83tmv3m79HNKQ?=
 =?us-ascii?Q?7aLTs0nX/6ydn3z7TJ52CaUsWlu7tHBegVuXKlxyHsP7bDxKJrwZAluBxOMF?=
 =?us-ascii?Q?mMeZeIhkw+WL0QJo50Ipul6vW1TyMdkzI9CNs1o5KcNNxBl8N6dPhROeAez4?=
 =?us-ascii?Q?UN0TslG2a335lyEhUmcjkA8xxXmKnLfUCqVMS42i9e7hnVDsvyJ93qrC0jsG?=
 =?us-ascii?Q?1kHQjglJ30ZS0ZOBvje0RjUh+EoaK7/slt5aIPwznHhgC4/AVL3pFtkwTgw9?=
 =?us-ascii?Q?5FCgQa2+DIUmISE2nKk4DOsFBgGapq/Qu55l3dYHuYyJHX+GzfQR7ryvALcM?=
 =?us-ascii?Q?sgAvTBrEfXHTKqL5i5Fy7EoB4L9wucTxiixDbQWWvIQoFDvb/5mW4FbzDbL5?=
 =?us-ascii?Q?oti9gdP4ycWUi/QcmQGlPb9hy0Eb6U7I8gb/U1GN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ee033f-435f-4251-6923-08dc6f20a000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 05:35:09.3711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3p8JqkSlar/mKQubufSLcYLDWfF6m6lO1cJgh6EuFa/FqEiwdEMgEOipycIT7CeJtpmkn/io00mxkJ9mYszGaNALBcb/SltE4NubyCqrMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Monday, May 6, 2024 7:05 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>
> Subject: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
>=20
> Remove the min/max configs and change minimum values of preemption and
> timeslice to 0. The sysman teams must deactivate preemption and timeslice
> to assess exclusivity mode. They depend on configuring
> timeslice_duration_us and preempt_timeout_us to 0, ensuring these values
> are set at their minimum.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 38 ------------------------------
> drivers/gpu/drm/xe/xe_hw_engine.h  | 28 ++--------------------
>  2 files changed, 2 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index ba17a25e8db3..9bf7adb45eea 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -1,27 +1,3 @@
> -config DRM_XE_JOB_TIMEOUT_MAX
> -	int "Default max job timeout (ms)"
> -	default 10000 # milliseconds
> -	help
> -	  Configures the default max job timeout after which job will
> -	  be forcefully taken away from scheduler.
> -config DRM_XE_JOB_TIMEOUT_MIN
> -	int "Default min job timeout (ms)"
> -	default 1 # milliseconds
> -	help
> -	  Configures the default min job timeout after which job will
> -	  be forcefully taken away from scheduler.
> -config DRM_XE_TIMESLICE_MAX
> -	int "Default max timeslice duration (us)"
> -	default 10000000 # microseconds
> -	help
> -	  Configures the default max timeslice duration between multiple
> -	  contexts by guc scheduling.
> -config DRM_XE_TIMESLICE_MIN
> -	int "Default min timeslice duration (us)"
> -	default 1 # microseconds
> -	help
> -	  Configures the default min timeslice duration between multiple
> -	  contexts by guc scheduling.
>  config DRM_XE_PREEMPT_TIMEOUT
>  	int "Preempt timeout (us, jiffy granularity)"
>  	default 640000 # microseconds
> @@ -30,20 +6,6 @@ config DRM_XE_PREEMPT_TIMEOUT
>  	  when submitting a new context. If the current context does not hit
>  	  an arbitration point and yield to HW before the timer expires, the
>  	  HW will be reset to allow the more important context to execute.
> -config DRM_XE_PREEMPT_TIMEOUT_MAX
> -	int "Default max preempt timeout (us)"
> -	default 10000000 # microseconds
> -	help
> -	  Configures the default max preempt timeout after which context
> -	  will be forcefully taken away and higher priority context will
> -	  run.
> -config DRM_XE_PREEMPT_TIMEOUT_MIN
> -	int "Default min preempt timeout (us)"
> -	default 1 # microseconds
> -	help
> -	  Configures the default min preempt timeout after which context
> -	  will be forcefully taken away and higher priority context will
> -	  run.
>  config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>  	bool "Default configuration of limitation on scheduler timeout"
>  	default y
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..803555c601ec 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -10,41 +10,17 @@
>=20
>  struct drm_printer;
>=20
> -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
> CONFIG_DRM_XE_JOB_TIMEOUT_MIN -#else  #define
> XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 -#endif -#ifdef
> CONFIG_DRM_XE_JOB_TIMEOUT_MAX -#define
> XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> -#else  #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) -#endif -
> #ifdef CONFIG_DRM_XE_TIMESLICE_MIN -#define
> XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN -#else -
> #define XE_HW_ENGINE_TIMESLICE_MIN 1 -#endif -#ifdef
> CONFIG_DRM_XE_TIMESLICE_MAX -#define
> XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX -#else
> +#define XE_HW_ENGINE_TIMESLICE_MIN 0
>  #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) -#endif  #ifdef
> CONFIG_DRM_XE_PREEMPT_TIMEOUT  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> #else  #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)  #endif -
> #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN -#define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN -#else -#define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 -#endif -#ifdef
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX -#define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX -#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) -
> #endif
>=20
>  int xe_hw_engines_init_early(struct xe_gt *gt);  int xe_hw_engines_init(=
struct
> xe_gt *gt);
> --

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> 2.25.1

