Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA2ACEACCC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 22:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E01410EB3A;
	Fri, 14 Nov 2025 22:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iout2idw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555E710EB3A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 22:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763159250; x=1794695250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mX3kGSsxSly7Xdole6MgB3CI5+LEZTiX37x6in5vMvg=;
 b=Iout2idwTrv0AkSikGXTGq4zh9h7F1SzxVhmZIEn0qSlenL1IEhnGFuS
 cOQpmVo1GmkaT92NCAW51jQnhwV9cLpp68A532bTyTJpVgofzkXeSHGR3
 UErBZheekYu53goiMaVCyFVlaY/mmjpE4vMVnm2dgQdVyzYWjN7zWcqbM
 OyQ1VqI36XiDWWPHEZRCcKWgsZfAC4vK+xpU5iMQjZmbAoxjtMeJR6+hg
 mfDuomxmeTAmkOmQM9QQvnOVuHXsiqc+l4j0+FXEwb9OWEOYtK2MOQ/T4
 pc2JOd7qzNfUvk6+1Sw6Q9vbsZLbGc46U+i/7WwYCJPkkMRDMvn/7QiZq Q==;
X-CSE-ConnectionGUID: EvhTb7rFQzKPUsUlSI9PXA==
X-CSE-MsgGUID: h7KjwXqvSl2JCjcxeNrfdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="69107873"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="69107873"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 14:27:29 -0800
X-CSE-ConnectionGUID: 9MNkVQywQnK3oBQ7AxNltQ==
X-CSE-MsgGUID: f8afBG7FRSuOrVYskd1rVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="220766634"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 14:27:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 14:27:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 14:27:28 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 14:27:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzT66oiQjKV509NLjh2Zw4CCBrFNZumd27Ce9nG0iF2eBOp4L9Ag+oGxshI6UNTK34bHQok2ZV5fLgFtn0bIHO0sGsUycqUZ63q4HxIIo2XsxTwpkoPE0q4wJ2CTZUwJ3RMN178n5FtHrEgdcGv92VewOvx8cmXObQG9cPQ2H/OuyC49B14ffrAe3GkrRAXOfGRQnWFWMNbxzyIv56CEKMcbH+xAoMqopmEE43Yxrf9mXRR9VDwmHA1t3KypLOSVnyBuov08p9tOQc4Ni8cWMUmjLIe9obnKaHFcW6rDcTC0Ef9R9ueka/xEjwWsp/pQHBLqAk9QtH1ZUOiriCOKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P+nSvKcjxfIm0uYJ/TKk0PZxU9Ud/53UMAnwWRql+4=;
 b=uHnorFb9eamMUTtmXhJXkiCg791iAzjpDP8RVzd9geonVYgYUpad+V6/S9dDpPVKyPhtoA4fz+LHS9N21pKUBKZn70TOqdSYMcIkZ1GLne8iTfTStTuXCQh9ZIZ/L6g2L3s8J3v+cOqT/xIavp/dPTluuW2DdDOOadrxbWLciSp1gnNFmjhfSqKrfU+yOsYuD+K/sQiP51/f8g3B+WVZ7zyhte+Dta/84xNnNML7xoUOPmjeNUtPgawvNE/BQ1qhOHgazpD2HXgv67aVaOWVvs1SD89Q5ja0aNBEmdoU912Bta8THS+6s7+x2gq9/C+v3EF0d87HkWfheuHxr0+E5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 22:27:22 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 22:27:22 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe: expose PAT software table via debugfs
Thread-Topic: [PATCH v2] drm/xe: expose PAT software table via debugfs
Thread-Index: AQHcVZrtIn8G8e0i/kWs0IP+902BOLTyvR+AgAABvzA=
Date: Fri, 14 Nov 2025 22:27:22 +0000
Message-ID: <SA3PR11MB80469338119C7C10F4E88F0386CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251114191355.211862-1-x.wang@intel.com>
 <20251114221521.GU3905809@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251114221521.GU3905809@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|IA3PR11MB9062:EE_
x-ms-office365-filtering-correlation-id: 091f5434-49e8-4283-d964-08de23ccfb01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FjYxRs7J65UXwGPBkEO7tj11o5xg10Y0KKfdxRuJVyPhqph8A71JZIqjbC2x?=
 =?us-ascii?Q?MPTgHTPE4y/VKx9YFOYXddK0lYJxi2mesVxDaJX6V0nwqYRwzf/ooH35Mjyi?=
 =?us-ascii?Q?oqq/O7MsGS+So2Fe7zKyivL14lYdxxJsHv72XdPE/0qJPAJgK1TWUwGmzibK?=
 =?us-ascii?Q?K/z3c9SuElmu/91Lj+pNsd8gqeLV+QotPpJH4pEYcbdVeAdCoJidW1AzLtIp?=
 =?us-ascii?Q?YuNmEgiWCh/AyOP3yi+JzcnWe4nWv/65n6JyUJ8ETLcQasJwklUU2ZHI++wD?=
 =?us-ascii?Q?bmjFh08aPkp/TlwbHcv+Apiy/5ki3i+UoxZ2Hg6D+1rIC9+KLwDfpPuCf2pr?=
 =?us-ascii?Q?E84kr6LUUSpVD/T6daTgPzsKGsPNmbFZV9QkqnP1zxfYTJfXVYFGnrN1asZP?=
 =?us-ascii?Q?iDKbOEVeXCPjKxyGOjGga2zBRHjnHTjQRBQbFvuYcKL+v6NH/wX9BVXEfPEw?=
 =?us-ascii?Q?mbPFeq7e3g15uf6DJ2Tkkk/HsNj1+GyEChB/PA02dgjRx54AmORdaP9UQZu+?=
 =?us-ascii?Q?efOq1nR72t/x6R/5Z/+ebRGDrJ/9vJFufpmijOU2DTIft4xD/mpjOkquRr8o?=
 =?us-ascii?Q?TScZnaNloyp1k6cnrdXiKJ0AWDEPjWR9rBePCtCZ3S1khCBPIuMLMzseIPwT?=
 =?us-ascii?Q?v4UKHzT3b8DM+hdkM609ycpfGguvyUIowSqphIKTQKFEo2mc3tr/M56Ka/TB?=
 =?us-ascii?Q?MbdgElPfuSGXFkG8vrcuMrsaOvEyC0QaGJKCMJyWDbqJuJVu2H94awashcFj?=
 =?us-ascii?Q?+vD0wSd/sujO72wFAlMQWgUEvOVhPvGDK6SnTbXAV4ZBF7IBFl3ArpZV/O8P?=
 =?us-ascii?Q?9CvU5440gkUkK39U6RTcrXj6/+auZp3KxGWoIbjzMcMNI9NJScZR0ZOeN0IN?=
 =?us-ascii?Q?aqNPU30FxmhV7p4vPPx8xCCor1pG2sD0mRK9FG99XZ8r/W7b96CH4dnVmEuS?=
 =?us-ascii?Q?3O8EB9MfpTzV1MWfEjQRTzKrk6jEeBzD3Dh5El5zA79sDepzxy7gWaN9puD7?=
 =?us-ascii?Q?kunxut6ybtpi6bfDU4A0wCd3B44cXAW8LY06Zs+Zc6/jH9nBW1SySlnwTNOh?=
 =?us-ascii?Q?CxQeDDadjKd0OsXf3mHjgq1yr4PsVSc/GK9jnhprtHHx7UjMdwhot12zYqYC?=
 =?us-ascii?Q?Mn5ypHz0JZxli1yaF5LBD0Rfsj26al8y9QSBhpnBuz+pupPXmLXsgE+ftMLb?=
 =?us-ascii?Q?7RqTdS3gVlIjWsi0y93/QB6fk4ZNEYk4/mPCOU7ywdd6pXG4kDqnOPS/ppmm?=
 =?us-ascii?Q?QZBVsi0/ruqggh82iC//p0U7RoE8YXtZsKuZC3OlHESpOkNE3es5QxaMrPuH?=
 =?us-ascii?Q?TzFgTWbTJpOG6PmfE8CA2MexbOWhICJNYCcmzTGPGzYi/dCMbOZG86Bu+EZ/?=
 =?us-ascii?Q?5LJI56nBICStMgP+PBNNNqLRh9EQjPSstadOUxOVV/VINi6EUQKGnnLkjvmV?=
 =?us-ascii?Q?HnJZki63tUlS0tD67ucRfi0qjQt1PBMxZ5kY4VtUDZWdvKRPDfK3zQ7IJ8U6?=
 =?us-ascii?Q?9wiWUI0U4iwBQEm7OqS3JtgxX1s1RnRSLbXY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NKUK7J4MvnwhTA3mlMIKX1VVzHzw7fEz52sMbnKB+vdbKhwmr4yiwB9cIcU5?=
 =?us-ascii?Q?fv0mSh/1Ek+sH0gJ6IRN6KcY9Cifz9jm2rvU9EUXGb16QcRWrRzFg48jcB6o?=
 =?us-ascii?Q?pczLjgYVNpSPmHyWQcS9vyssGZyGPSqB8CiQwtmjOcatrhJr3P9IVjSQVzpE?=
 =?us-ascii?Q?3H+lxjvUxTgGc5dpN3T2babjLnMVak/h7zdmREK0aUpzEHofxK9htfAsn3AR?=
 =?us-ascii?Q?6Avoj+2WiSt6HiEahwGjO16yEJ2hI2BlWgK/F8Xo+piZHXJva61G91lE15cD?=
 =?us-ascii?Q?EjE45ZBvMM+EUSBj0HPOWkKBsy7NfiX1furlTfFB/8JVsy+hlxTLessm8oAT?=
 =?us-ascii?Q?25AtNAQ27kR7l/CU1/RdpG8kCIKUq7bMUtBGAZri7u1Oi/BOD/7QBc4Gmkwf?=
 =?us-ascii?Q?WsttSYsM4qYps3lQR6rRi0v1o9jdoM1b0GPYql6o+ZjkZQLnXamhkLvqAe5c?=
 =?us-ascii?Q?YD9MKZMBUIN2g6eZ4c/xbFrnCoXFRD31B1Y2ZLEsRasKrKWtWcd4Z5k1TmjY?=
 =?us-ascii?Q?rPxBtJcmM8tuEJz2EIAR7KMlPj406w7J7tSrSIagjD3EvVEVzBAZmGPcPObI?=
 =?us-ascii?Q?e0EPN6z1IvHwGGsOqc1N07s1gzuFUBTYm8JaL1NavYBDPY4rho0L5t7rfbDl?=
 =?us-ascii?Q?svE6hvFsFTvzDedBDu31iqc3GG1eW+MdgwVEC5fdli0glX2LbvMcFv/8/J8h?=
 =?us-ascii?Q?2HoXTdhJj1tQ/rVQ/MlfdBXl6vXCDRNOijmuscn282FYMivruEPV5Un9gDe9?=
 =?us-ascii?Q?SDSBLvaHXzO6Zlm6LhZHKTjwvKW9RTaC4LPbofijhCaiGnvExV1QVtP4rr6g?=
 =?us-ascii?Q?+8EuV1UsExgTgmoTcenbA8lCeH0QpKaoKwYwozF9h0FMHY1qmmYKRyBv5xdF?=
 =?us-ascii?Q?re+nj4RH1u/d/d1+txELMsvTU9tm5VpMhk0K11oli1nVqMXD6wEwcCV3W28e?=
 =?us-ascii?Q?dcnVaEQINdEsVjkVKIdikBRmuHoOy2qXfgiI51SL0InkIfb0dkX+aNwZB6Za?=
 =?us-ascii?Q?yy9n61CHKdKv9pnmRSf2phjUss0Lorf7ku2zTgIJ9ez2DtZ8SyCMW8qV4D2m?=
 =?us-ascii?Q?iSD8onjfYSvxfcLjdR6ehvgqP8q9XYX/+5WMmgvZJ2R3G80gvPVYvpOPa9Sp?=
 =?us-ascii?Q?V5ofYTYSXJqhSAAJkKQL8yjzfOS9Nv+PazDh89v6D8IfDdaSAG5Yo0+NrpJz?=
 =?us-ascii?Q?YolMfV1EZC2HsefjasXkS9idS7XkOqIYIQ0du2tYn/OC1bxssgMK88q6pKM6?=
 =?us-ascii?Q?MTCf0IyjyHdfuAq78k4mjnmrzz5EMbUdIMOO2vbf/gji9YmadTRjszz0VJx0?=
 =?us-ascii?Q?9W8709KMXU/bdUc6N21EytWfQPxT/prROEXRbNUspQI4R81mHhJBirNv8vNc?=
 =?us-ascii?Q?DIUp6EWV/QUoeIdbMcvHJ26pvmgBcTqLvNX2k/Nr9TYH+YIRcKcRh2Yz77GR?=
 =?us-ascii?Q?0+Putx+HIZvuVvxec9sGmQ6pUT6jE3NOCSNREXsEjM0nQrZIYrI0FRQtH+Er?=
 =?us-ascii?Q?e1jnI3HaCPAgHuXLBwTGUH2jvHuZmVoZqziHbtO4gEoxmnHtboVl0LbMQJs3?=
 =?us-ascii?Q?qHwU/vl5oTnOqAu9nT0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091f5434-49e8-4283-d964-08de23ccfb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 22:27:22.4575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9jNG7BvX+1w6p7Bg9IXEHTzgNRLW+rJ3ccvHPVr8fUBboh6csIrFTj8MfeNrvVBGEK/A6VHCiT7WdY95yJWrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Friday, November 14, 2025 14:15
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.c=
om>;
> Zuo, Alex <alex.zuo@intel.com>; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: Re: [PATCH v2] drm/xe: expose PAT software table via debugfs
>=20
> On Fri, Nov 14, 2025 at 07:13:55PM +0000, Xin Wang wrote:
> > The existing "pat" debugfs node dumps the live PAT registers. Under
> > SR-IOV the VF cannot touch those registers, so the file vanishes and
> > users lose all PAT visibility. Add a VF-safe "pat_sw_config" entry to
> > the VF-safe debugfs list. It prints the cached PAT table the driver
> > programmed, rather than poking HW, so PF and VF instances present the
> same view.
> >
> > This lets IGT and other tools query the PAT configuration without
> > carrying platform-specific tables or mirroring kernel logic.
> >
> > v2: (Jonathan)
> > - Only append "(* =3D reserved entry)" to the PAT table header on Xe2+
> > platforms where it actually applies.
> > - Deduplicate the PTA/ATS mode printing by introducing the small
> > drm_printf_pat_mode() helper macro.
> >
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
> >  drivers/gpu/drm/xe/xe_pat.c        | 87
> ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pat.h        |  1 +
> >  3 files changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index e4fd632f43cf..ec279f005b10 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -220,6 +220,7 @@ static const struct drm_info_list
> vf_safe_debugfs_list[] =3D {
> >  	{ "default_lrc_vcs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> vcs_default_lrc },
> >  	{ "default_lrc_vecs", .show =3D xe_gt_debugfs_show_with_rpm, .data =
=3D
> vecs_default_lrc },
> >  	{ "hwconfig", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> hwconfig
> > },
> > +	{ "pat_sw_config", .show =3D xe_gt_debugfs_simple_show, .data =3D
> > +xe_pat_dump_sw_config },
> >  };
> >
> >  /* everything else should be added here */ diff --git
> > a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> > 68171cceea18..7bb18f5d9b98 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -578,3 +578,90 @@ int xe_pat_dump(struct xe_gt *gt, struct
> > drm_printer *p)
> >
> >  	return xe->pat.ops->dump(gt, p);
> >  }
> > +
> > +#define drm_printf_pat_mode(p, name, pat) \
> > +	{ \
> > +		drm_printf(p, name "=3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)\n", \
> > +		   !!(pat & XE2_NO_PROMOTE), \
> > +		   !!(pat & XE2_COMP_EN), \
> > +		   REG_FIELD_GET(XE2_L3_CLOS, pat), \
> > +		   REG_FIELD_GET(XE2_L3_POLICY, pat), \
> > +		   REG_FIELD_GET(XE2_L4_POLICY, pat), \
> > +		   REG_FIELD_GET(XE2_COH_MODE, pat), \
> > +		   pat); \
> > +	}
> > +/**
> > + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table
> into a drm printer.
> > + * @gt: the &xe_gt
> > + * @p: the &drm_printer
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p) {
> > +	struct xe_device *xe =3D gt_to_xe(gt);
> > +
> > +	if (!xe->pat.table || !xe->pat.n_entries)
> > +		return -EOPNOTSUPP;
> > +
> > +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >=3D 20 ? " (* =3D
> reserved entry)" : "");
> > +	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
> > +		u32 pat =3D xe->pat.table[i].value;
> > +
> > +		if (GRAPHICS_VER(xe) >=3D 20) {
> > +			drm_printf(p, "PAT[%2d] =3D
> [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
> > +				   !!(pat & XE2_NO_PROMOTE),
> > +				   !!(pat & XE2_COMP_EN),
> > +				   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > +				   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > +				   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > +				   REG_FIELD_GET(XE2_COH_MODE, pat),
> > +				   pat, xe->pat.table[i].valid ? "" : " *");
> > +		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
> > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> > +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK,
> pat),
> > +
> REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> > +		} else if (xe->info.platform =3D=3D XE_PVC) {
> > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> > +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK,
> pat),
> > +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK,
> pat), pat);
> > +		} else if (xe->info.platform =3D=3D XE_DG2) {
> > +			u8 mem_type =3D
> REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> > +
> > +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> > +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> pat);
> > +		} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
> > +			u8 mem_type =3D
> REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> > +
> > +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> > +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> pat);
> > +		} else {
> > +			return -EOPNOTSUPP;
> > +		}
> > +	}
> > +
> > +	if (xe->pat.pat_pta) {
> > +		u32 pat =3D xe->pat.pat_pta->value;
> > +
> > +		drm_printf(p, "Page Table Access:\n");
> > +		drm_printf_pat_mode(p, "PTA_MODE", pat);
> > +	}
> > +
> > +	if (xe->pat.pat_ats) {
> > +		u32 pat =3D xe->pat.pat_ats->value;
> > +
> > +		drm_printf(p, "PCIe ATS response:\n");
> > +		drm_printf_pat_mode(p, "ATS_MODE", pat);
> > +	}
> > +
> > +	drm_printf(p, "Cache Level:\n");
> > +	drm_printf(p, "IDX[XE_CACHE_NONE] =3D %d\n", xe-
> >pat.idx[XE_CACHE_NONE]);
> > +	drm_printf(p, "IDX[XE_CACHE_WT] =3D %d\n", xe-
> >pat.idx[XE_CACHE_WT]);
> > +	drm_printf(p, "IDX[XE_CACHE_WB] =3D %d\n", xe-
> >pat.idx[XE_CACHE_WB]);
> > +	if (GRAPHICS_VER(xe) =3D=3D 30 || GRAPHICS_VER(xe) =3D=3D 20) {
>=20
> We should probably just print this unconditionally (or at least for every=
thing
> Xe2 and beyond).  At the moment we only assign a value for 20 and 30, but
> the code elsewhere in the driver that _uses_ the value is only checking f=
or >=3D
> 20 (plus other conditions like compression, which are what prevent it fro=
m
> being used on Xe3p_XPC specifically).  In the future when we have more IP
> versions, we don't want to have to remember to come back and update the
> condition here.  The value might not actually be relevant or get used on =
some
> platforms (the same is true for WT), but even when we don't assign
> something, there is an implicit value of 0 in our software structures whi=
ch
> could get used [accidentally] elsewhere in the driver, so it's still wort=
h printing
> out for debugging purposes.
>=20

Good catch. I'll drop the generation-specific guard and print IDX[XE_CACHE_=
NONE_COMPRESSION]=20
whenever we're on Xe2 or newer. I'll fold that into the next rev.

- Xin
>=20
> Matt
>=20
> > +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION]
> =3D %d\n",
> > +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index 05dae03a5f54..4a3045f74bfe 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);  void
> > xe_pat_init(struct xe_gt *gt);
> >
> >  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
> >
> >  /**
> >   * xe_pat_index_get_coh_mode - Extract the coherency mode for the
> > given
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
