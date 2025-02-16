Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ABAC02198
	for <intel-xe@archiver.kernel.org>; Sun, 16 Feb 2025 08:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533410E178;
	Sun, 16 Feb 2025 08:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8PsrN7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA63110E178
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Feb 2025 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739694772; x=1771230772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r5igTWJUmktDmnvXiuFhgAkrFNJvnLe3GOiSWh2kKQU=;
 b=T8PsrN7f62lm963rbpKYp/l3watIXdNXRB5pQhwou+udoaxolT6SWyBw
 MO4YCrKh/hq0O+ViUxosqISjks+9+KSx/UrArZL61s1G3NV/UFMZRrIeT
 lnMPJrgMqTLiTqc49zbmNkI49V602lbGB3hP8QbC/YXZCpLUsRZ7UxTX4
 GNVLQjSTtqXruTxlYhXRHvlgCiRzN5xHbONP9dN12Ta2Y203x4dXp4d9E
 BbkR4+9PHLDsEVUdHJwc/e/g1LQwVn7T7bkX+as2p6XmT7F6epyeeAW/b
 VDPtpyJ80NHo6HX27ZU7B2BVtEiDHdorxaui1kSmmJxr4HyQ68KItsdkv Q==;
X-CSE-ConnectionGUID: QM6EKCVFTNmOfJWr0nuA0g==
X-CSE-MsgGUID: PRSUbcpvTz69WCqHcYv03Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="43230220"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="43230220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 00:32:51 -0800
X-CSE-ConnectionGUID: DwbuuKHRSrW2jKr6h9rpqg==
X-CSE-MsgGUID: AUGvOkypQ1WdA0UyXHaGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117982461"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2025 00:32:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 00:32:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 00:32:50 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 00:32:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyR9hU7UKr3fbB5o3CnK2QPr7uPW834ZGNSAnsMnCRu4yBBgGWgxD8z3RH/ECC+fCXJuW1d2lzmjNcf22QM87US3PGnDtCyWM2L9wtGsaAE/1rffTp0NdnEvUK1dzwJaYP6pSX5RlMPHwhuNNo2tNuUmEPMZE81Gxyq3RGChdlBZ5jGOzEM8IJXek7xnlGU4t49l29rTxKnKknh/dDDF/Q44lsCUKl0NrwumLnIhbigIthDpQwBbouhqMVgUbTqUEgcUc/zsWJ4EY+GzVFG3v/8VYPPE+iRqrh1Iu43Pd+AafsckTvNLU/TBVGAjTGXdVZ1zVsd4wLQXanxsjxYNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BENZ1RdX8DhS4CnGCnVeYDCw5qTAvYTIHewIiB1+j8c=;
 b=aKi5AKjxNy3Z4pbiTJg0kHyqmISN/xRR2l6qWzjQBqQRDbhvUhTi5g6TPv8e+arMgD2Zed4lZE4HFdNbjZK9nYoyytckvbnTGZC7ez9t4RbAGarnNalxDJciMxRAuvrK8b1Hn0UyMZesghZEdJyKoOKx1l8gKM1L3T1Fnx4Wn55UZPgxcyQkiJV5PEPWdbKmkXrPwmQl2P3NJv0iAdTwOJlMP5kfxLzN3GnX0YI9gv8wInw2ff9cHE2ePJfpgPXmPySy6ETJ7ZeGxERNYAGDE5HVKL4TBbiruA0f8JIp+8xwuOY8gXVdp8gYwljdPRkNmi6XkZ7CQD/qnbsVtPArwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Sun, 16 Feb
 2025 08:32:20 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Sun, 16 Feb 2025
 08:32:20 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Thread-Topic: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Thread-Index: AQHbfTEXZDDgt/A670u9EtCQD+rkm7NGmBzggAE8SYCAAcjbUA==
Date: Sun, 16 Feb 2025 08:32:20 +0000
Message-ID: <LV3PR11MB869532347BD5D7E4F17333B7F9F82@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
 <LV3PR11MB8695DFAC65F77AAA7A2E88DCF9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
 <CH3PR11MB8434102DFC2FE2F8E89B717D8DF92@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434102DFC2FE2F8E89B717D8DF92@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|MW6PR11MB8390:EE_
x-ms-office365-filtering-correlation-id: caa47c50-9bd0-444c-4e9c-08dd4e646dd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rtjLLT4R6QfqqjMNZ5+C1Ivgww6vQZqqoE1W4hzTZk8xWiSl6AivFyjzqA/c?=
 =?us-ascii?Q?6jmFGCmcUwzumZ45TYzhi8CeUhKq4Dvy7X9dl1IhEL1neqOZH1FNcU1ihsy7?=
 =?us-ascii?Q?vgk9Cu4YFR3XxnfHbMmKAFbqc3+8v8wBVJHLzVTHdh2wiImtR5XMY0TbkwZA?=
 =?us-ascii?Q?hukRRs2vTbcu27Z6om0uIYF4p8fnBLzsFPZrLo9BeLiumvgkuLzkdMf3lAcK?=
 =?us-ascii?Q?ChI27ng1BwlKWBGiSTKhyurncisBRlBms+jSbambUCli9b7xRTtghXrLBxBP?=
 =?us-ascii?Q?wbMFJCskWAzu0nFVNKlDgac7+qfwuL6OLs803GRAxwNDAEUtke43tFluYcuV?=
 =?us-ascii?Q?uN+AZPf+wqFG5vz/cLSMOsCqTaIfR76G6K6TxGVghDiFrW9YomdYeYBgUSlS?=
 =?us-ascii?Q?uYYERVPXHeCEC4vGCPEHqR30vnQSw8EUp5PetGhZoXtP5J0wo3GPhw25slSK?=
 =?us-ascii?Q?22rHq1HENr6TPwDzq0w9/Ic6iLDnRlg/t09u9v9FjrYOEqTR1BQfLdDk9ZFv?=
 =?us-ascii?Q?dWmgD80AEiyaHW8ADbqp5BN9LOq/4BDfO4ANqVYsxT38d9ErkuRfaKRlOWNp?=
 =?us-ascii?Q?0yzstKRRJxQVgqF+VFq5C1HclknxGWrza3T9UYgCuquAzrrJYuOy+bFVw5ft?=
 =?us-ascii?Q?mohaC6vvZYTLEPPv88WzL1AHA3cPUG+AcaR2heSxtTZjnXdYLuQ68TDK2nb/?=
 =?us-ascii?Q?t8Ha1CoIURDg2W/hl8kROwdgOs/DvZMZHktxHEhG6Dh7/9Kv6biq2zI3ObRT?=
 =?us-ascii?Q?Dv+1pTOG6NUPCySFFbsmXETKvkCGiap+KDOg1mUrdKCuZXrg4wpZRAu1BTE6?=
 =?us-ascii?Q?5/O5JeSCldx5H6Sh82gQoDV6zSScG90lz+hvTdVAFfB1p4Ym+7pqeM8aEoJV?=
 =?us-ascii?Q?RhCMwDabxVXeROAdOx/5mG09tjaXNvS3Zv5Qd99iMeASzDFMaBnUTZgHlYGD?=
 =?us-ascii?Q?SGDWRLSYgIH7itExKK9vxuiBFUFMVPij95pG7KcDsig6sMSywPljvrJfmBS3?=
 =?us-ascii?Q?DqxDlJUddLZ4SIlnNpyjrBrk8/NEncDM39Jo9g3A6g+9bL8pOw6OyuMIgI1Q?=
 =?us-ascii?Q?GmRb9j8b5XtHBlFScgOOvVT1mZlgoKmtRDVqoMrmt5yj/v3WIdF3t9mUUBm6?=
 =?us-ascii?Q?/9JYfBf21sE7f2QZL+JcaXrMDC6SB6NWtYBOXMfzgk3IuD7j99WCvBU7cAIH?=
 =?us-ascii?Q?+U8hm1lFgdt+pBHOCTvi4D+VsJwtJSNR9qhc2NlqI57KP+890WcGz5bvU0gc?=
 =?us-ascii?Q?ZklZZl92Ffk7ixJqz9kbKzoCS5707t4aPkrjppMjb/d3HX2ClKB0lCUxfRqu?=
 =?us-ascii?Q?ZsamFAgU6RJrHEsFeLxyqDMQaEaGoOO6OhtWqYurae0KpMVVewTtGRJwGJWO?=
 =?us-ascii?Q?IR8zMJtIT3tuLwosbrWNdjT/qjtd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3q3hEpmRFThZL0esd9Dr85WQbbmBhqTIhW4YzpenV9f2E7jceNiGGBlLlB6H?=
 =?us-ascii?Q?uHmmijS6IVMK4syprP13DBvdxCAU8pt/CjvN4700dhBnGmVZijsIf5JQTGMH?=
 =?us-ascii?Q?3auPl4OP0ccP8JvtOfL+ESlkoSX0CHsUDCGmjtgPtnqfh+JggpyeTFqTLsNY?=
 =?us-ascii?Q?8zVinoHGTa1B1ANb/tdRzz5PjFNvNxek330czlyyUbSUp+WKfR9AEFH67YhN?=
 =?us-ascii?Q?/TyDNEhqXMnzgBd3Th3qi8Kz4Xd/QJVRqzk3fRneBv/PAlEbWjWORMD5eMQM?=
 =?us-ascii?Q?p3l5tBMhL1aehj+2vjxMNDCRKlSxmMsaJuulYJn9pS782KwYItegbdHPGjtX?=
 =?us-ascii?Q?s+76ikfnuHMjWrnZKzhrxQglIdI2XMPPywN5IEDz8YDAYib/T9sHi3ggJ1lt?=
 =?us-ascii?Q?vncxAEwLK8Jm6OPSe98XylO6Tl0Cv3tgQzyE0yeR+kRGrtIV0xLEFueI+a89?=
 =?us-ascii?Q?0STmaCXko3JREw8HIyom7CrjlcmydFGJ6POpqCrtnOQ+5Y9nYa9a282LMGhA?=
 =?us-ascii?Q?R8ExRT7G/8MNpOEyz3JDiOHwJu4ObqRLtGWYfo4+78P9On0FBoe9cI2Wncgk?=
 =?us-ascii?Q?HzgKZqamS/4cOpbLykpmiYNWqgBbayHR7RQ+9TtWaueHvMRuMik09yMkOkZC?=
 =?us-ascii?Q?mZTnjhSikxIomdVF8hHhqmkxaL7xHVPzu+BYKTcc5xHaeP0+2bOBS7jDDzls?=
 =?us-ascii?Q?XD6wS/AM0rUX3btfdKM/1Gcstbl+W8yOeJIycsLkZJXhkV+/T26RtlB/+YYz?=
 =?us-ascii?Q?oCxVvMQW8e40vAVA5bA/b0sdjoGrT7rcncojZkNnXywngphAqDa0LIj94+K/?=
 =?us-ascii?Q?CpiildgqxOMK5K5i1YHJI85WC6BzwTN0HT3Vd7yh0pzVMXzUPKFCehu5yH/D?=
 =?us-ascii?Q?IbxkZhfjSYzQezJomnBObcs6CWsYX1oZbvhQQhdwfmIfVGZ7mQVnEEvc2e9e?=
 =?us-ascii?Q?n68MuY6RxYcY8gUfxWnDCHOrH0vdU+BAnlfPOywaS01u1uQs7PG08bceDJpI?=
 =?us-ascii?Q?v5O+/LT2yRi/1kSlGcffPkDGD1xymFNsI3URyU27wDX6Rq3nL2BSwTT2sTt5?=
 =?us-ascii?Q?NyAEahBruNzhbXCyw/C94LGvyRTlBfBYEHZS7vsAHLxYs8CLpKPofo73q4Mf?=
 =?us-ascii?Q?mfX6B2OHaY2QhTKcQG3hP+19MuT1TGDaHCpzS5wgplnciKCfklmkF50W4XJI?=
 =?us-ascii?Q?1KtypkT27VaBPFEE66VkJ1twWD+zdSo116ICZZmUuquYjaqNRm03SBHPgcCA?=
 =?us-ascii?Q?K9pJGJJ70cWjR46kAEBl6vGtKeZrS4njX6esc2XP/emLyyeqhTJnFT3nkvWz?=
 =?us-ascii?Q?Kf1o9BAGo+N3M59gD3HyLjrN6oTdoTLeIXmqhDxSI5pVHZty+Egg6FJl3LOi?=
 =?us-ascii?Q?XYgKJ4tzCSd4tP09wK+yrbyA2+mQpw+xFZVNe7beo3FCy2//CbwXcVMDVyDb?=
 =?us-ascii?Q?oc7BOc23WKsDYCcOY7/DCJh+8vWgQYsWrj1gnqLxXOW7akZiQlM4yQCEZu9/?=
 =?us-ascii?Q?WyzpGFIeGwLp+nmyHmZO3HUw5yXWV7pU3WcucqgkQzKWc4C29ZhbgoYPMuJb?=
 =?us-ascii?Q?ylVsUYUseztsNfElqbQPFjOn0VoMicLfzQAm237BJgXCRaDkZsd+Rx6dONw+?=
 =?us-ascii?Q?mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa47c50-9bd0-444c-4e9c-08dd4e646dd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2025 08:32:20.2367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1s1hoVcIsKbZb+hCUafgMjCHGJWMKwo5N7IPFmDHJT6UjRtMpmdjIKXaqWJu9ubQzIbAESG2SOcIeeMCzOjOclkuV5MQsbXXpsR/UbnaN1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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

Hi.
> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Saturday, February 15, 2025 10:37 AM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Dugast, Francoi=
s
> <francois.dugast@intel.com>; intel-xe@lists.freedesktop.org
> Subject: RE: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
>=20
>=20
>=20
> > -----Original Message-----
> > From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Sent: 14 February 2025 03:46 PM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Dandamudi,
> > Priyanka <priyanka.dandamudi@intel.com>; Dugast, Francois
> > <francois.dugast@intel.com>; intel-xe@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Subject: RE: [PATCH] drm/xe: Add fault injection for xe_sync_entry_pars=
e
> >
> > Hi
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > priyanka.dandamudi@intel.com
> > > Sent: Wednesday, February 12, 2025 3:02 PM
> > > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Dugast,
> > > Francois <francois.dugast@intel.com>; intel-xe@lists.freedesktop.org
> > > Subject: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
> > >
> > > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > >
> > > Add fault injection for xe_sync_entry_parse to allow it to fail while
> > > executing xe_vm_bind_ioctl().
> > > This need to be added as it cannot be reached by injecting error
> > > through IOCTL arguments.
> > >
> > > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_sync.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > b/drivers/gpu/drm/xe/xe_sync.c index 42f5bebd09e5..f87276df18f2
> 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -210,6 +210,7 @@ int xe_sync_entry_parse(struct xe_device *xe,
> > > struct xe_file *xef,
> > >
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
> > >
> > fail_function.
> > -Satya.
> I already sent IGT test to validate this change.
> https://patchwork.freedesktop.org/series/144708/
> --Priyanka
LGTM.
Please include IGT patch details in the covering letter. More details can b=
e found at https://intel-gfx-ci.01.org/test-with.html
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > >  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct
> > > xe_sched_job
> > > *job)
> > >  {
> > > --
> > > 2.34.1

