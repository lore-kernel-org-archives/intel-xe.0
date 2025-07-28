Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019EEC87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 07:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1F210E491;
	Mon, 28 Jul 2025 07:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1nwICPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802FB10E491
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753688422; x=1785224422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a+qI6ktV6BtUPxq5v+nJgZXk2wcxYsZBrDl0yJ0l1b0=;
 b=Q1nwICPI+N8tPGnk/9xKEyI9W0HV3sq/TR2u/CNd67stU3hBTGl+fJQ7
 TRerqfqeJRpFVE5mWOEm0Edku7jgXq6uf/Jm2kor1f0eULGrkZIIej97I
 Yl1eW60wBiPwF2B4xA6VyfJFbNhxT/BA8+NUU9scp3SRe8L9Vw+/mgoeN
 LY2xFJaryYFN97MjCdYSRF0AjxiKVeHNgFSNmkGfMvWZmam4CFFna66TK
 0FMobkn994KViKJYAgmTrbIGm/9Rr+FyDMLvqBgtlINGXwkOxva6wsac0
 EQpPDqCVwOlTEtGpaWRv4qC5Q6cmYe7sml2x/D26mkA3zFzhmuquPZYa1 Q==;
X-CSE-ConnectionGUID: dC25D1BXTca1slIIP+2lSw==
X-CSE-MsgGUID: 7A6IKeCKQby2ZtbtzlKq0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59731944"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59731944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:40:22 -0700
X-CSE-ConnectionGUID: iebosYfgTTCIt248OKzolA==
X-CSE-MsgGUID: KXs+6RjjTbuZWVCTWtAZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="193314847"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:40:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:40:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 00:40:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:40:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYJDxxV/ZGfdOVjHw8WZt6p+T8QVn1NhckLPimYyscy+Vzre2ntPUMMh1iPueuOOQOPr8EQ4tPtOoKSnjkMYd6Suk0bLntsgSkSgZhJMs7mv+csMcy0bAuLqqPPgep4wJ63ffSzbQ5iemouwpvJAFoEetPdLmCN0LenhPp4m+QOls7psr4mfK5DKgiQACXlXPocd6cfOJD/z70vIrtCY+NC4BUqp3eldLiOioCKjVxMUWU6FwATgJOXMjmxbkfab0su3akfGBRomj6l+ggD2pOip5RFov1EXmNWJU9YWmprUDy6PTq24uQcO5rNcP3K9LIhPeBc/vdunKWeFc8rX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRcZYaC/qm1rvfCvl69H2rxpD85H9q2+v5ynXvxlQQM=;
 b=I3Ivp2mnBmxMiGEvzQIjcYsULuaQWQLvDaKu3EYjCo7iquEp66LYj3PSnBtioaP761hFFW92ivuacJA1J2eAKtOBJjYbowIFxWWDrN0vMDsGJZvxqipTDIZbXTF+pFKA+Gjb8dXHwnzztzYppH9U+OH1fYuNRO2f9C5xf8qZhBG+9kOgsXgYnbpLtcKUP92aJ0zEBkhju5V4/C5xwPYwRgbrB2MQ3jyx4qu/rLTacmpZiEdTTy1gcqzBLy7CbUAPnRkDuJxV2SPkvqNrXXl3GOzdDm8hxr+tTHltishFVzDK//gNLpAU3h/k8AzP8x4dDEAop65EYSeRxKpbe4GQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM3PPF1939049CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 07:39:38 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 07:39:38 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Thread-Topic: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Thread-Index: AQHb/4ghGp65Kqqr/kmADRMveFEnDbRHJOGA////87A=
Date: Mon, 28 Jul 2025 07:39:38 +0000
Message-ID: <LV3PR11MB8695EF712CA3683DCDD589B7F95AA@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
 <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
In-Reply-To: <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DM3PPF1939049CF:EE_
x-ms-office365-filtering-correlation-id: 373c2877-cfd9-4aab-19cc-08ddcda9e823
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0wOjvDxdN51bzNlGvdUtPJvsjZng0gy1qHj7gDyHza8QbWCgnXi0rP5tcd?=
 =?iso-8859-1?Q?QYXwqR4Z0uudHRnnEyLrhIvJxb4Evu6cuhYJhC/kAax07uqPlxjy94Rce5?=
 =?iso-8859-1?Q?LeEZ+vB24VwOgUXwq2xRc1MQcdE73XWlE5iT0StUe8SlpnNh4pWGGNZnZQ?=
 =?iso-8859-1?Q?eL6fxKzu7bDVa5BLFxsye7ZGa2Oyb5Vl+i3eGvn90ua6or5hYiwSEGiqxh?=
 =?iso-8859-1?Q?sakyFK8ZqZiyHez8QhvbQAa/AZaeTzr0e+Y2Y4UmqyLEgECH0L7zPZGIqz?=
 =?iso-8859-1?Q?ZWvfD3JOZgrw2Ist8CCUKa5je304SnLfo/1VPqwS70zttqdsRgoMc/Ta9c?=
 =?iso-8859-1?Q?iSU8zi98VkXmX8DlS3tzjzhwBFiIewhqPZTlWQwpDGzjnWtjqzsGvkzozt?=
 =?iso-8859-1?Q?OYXU50lRoowM47lyv8x2Z0GxnZdQP2YqJimDgXRwKqGav56lIwht0BiR8A?=
 =?iso-8859-1?Q?7RW7kAEwoml/C3uD51HHexEBWojnbe1GyCUb7YaA5sbWpIMOny98AybyaN?=
 =?iso-8859-1?Q?B71kdLbNk6fsIOYofZW5eI3PiQ4yVBu84Ik5Hd1t08pZ0yWTu+HJjZ/XQB?=
 =?iso-8859-1?Q?0JE9+9VYc2Sb9N6nCFCrLhwNqJrYE3ykjmi6/drJFergYMD0yJyfRvonQ8?=
 =?iso-8859-1?Q?lPmEu4Ju1taiJ49l49lOXxFlhgxMNxI2wzhDv+OHZ4BIRBXwd+yjoFJqZM?=
 =?iso-8859-1?Q?eVhLOqpKAuDRPicE0LhwtBDkQ8wRVLuLtKlnSMCmp3wIOY/gOnSqVGniyU?=
 =?iso-8859-1?Q?piWzdoauAno5yepsgOlQjiniAcQNGdhglMpA7eofD0btJquMerrdXDI5H2?=
 =?iso-8859-1?Q?oxMslnIVwtl5druHCFFvWmaMZwXHkttPCRG3M1v3bsZT/ChL6Z3CN1okNh?=
 =?iso-8859-1?Q?TPlAIrlf0RaucKzwUMWHERFToFCFjwt6XZ09q/GTBpwI56/OyZsGGyDiJq?=
 =?iso-8859-1?Q?tu/6NDmJlHPPaI3Lk3AAUqFBptHiUuekwSH8qTA/4tCFiYHAzzRo6ee1Af?=
 =?iso-8859-1?Q?bw6L56PZrduDTE705fx7LeyJHkZyZbrdpZwoUXMDPTVHcWcscU7hEykWpC?=
 =?iso-8859-1?Q?u44Rhf/v77yucE+1Eesx8pBWRmtF/KvVu3pqjmhYogFXPp6MuSZ3eSDrKJ?=
 =?iso-8859-1?Q?8Ca3UCtJBmkJ0akFOgbA6nJCITPiNG2GNwMqpzne1YDMMilrT2Cx7uOS82?=
 =?iso-8859-1?Q?e9BIeLoEhYDOfo0IhPX3ZE477vUORlA6SVvehbCsB8A1b4+PRBT3GXyLlG?=
 =?iso-8859-1?Q?5ACkO2qiXumgy53xCF48vCYRtDrsy6on4kgmS9cZCy4Ath3+1wuohF4iDW?=
 =?iso-8859-1?Q?6g71AGZAWU/6Fk2CR1mTAs3cRKP+e14Pzn9INcjh9Qr6lzcFupiC4pKP+H?=
 =?iso-8859-1?Q?IcunD2etFwjzzHDQDWTaXfeynW+6ux7YZyYhAWoYtcey6IZTg9/Zf2Lcv4?=
 =?iso-8859-1?Q?WDfqvWe7zRkFrpfZNusZs9hE86q746MKlW2dwNoSv+bUAo2h42H+9jKhEa?=
 =?iso-8859-1?Q?49gFtxWnjbJkNSyRmND8JBzmstE2Wu1l68tpwBF49QRw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uDxn9uJKK7Osybyuo7Iablw3c1tXSxjTeXL3hYlcToQbR72ivbxdwZvUkw?=
 =?iso-8859-1?Q?V1j00j7KrXEcRGB2yTNlmTvIZSy1ilcm4fTUjZntpOnp9KeAix7lpH+hZ6?=
 =?iso-8859-1?Q?dmLyIABYh7+u8YtJT8di4nsqS1XFFMP4HqTAso032/hKiiyUHevt7uHrsR?=
 =?iso-8859-1?Q?JtLEHhwC5Os4Y6NzenIyV7MF271xl+sa9LOdAjRL6hOYETUZjD5ii1T3C1?=
 =?iso-8859-1?Q?GGyFxTcWEzQc7nPHfYs8CI8Fl1zvMAlfj3kf8tz7Vwj2MNShWM0fEUNmyE?=
 =?iso-8859-1?Q?LY6J5ooXPCp/8YFz5sK6iKjM9frY/WA0J2eaMBDFXaH/yU3miDEbYhVH5T?=
 =?iso-8859-1?Q?sp5qULUpTeYh7wlK4kApuLJqjqyWiKuYH7PUMoT+akcDNhqIcK5s1P5RG6?=
 =?iso-8859-1?Q?4xfCe7YhzpwIopcbZAIGO7cHeYFwWlJOE6nMVt9PCnj8PNp6m5N3ZKtE7P?=
 =?iso-8859-1?Q?9W0ELbCy4zvLxaqS9rLkiodNQrk9riqzI6yC5YMOskk1rnot8dlFiUs30E?=
 =?iso-8859-1?Q?OZLu19xw6faWreKP5E/rOPuP7aRMsaiVZ+1f3N0/ZvavP7nQ0e2sht6Vls?=
 =?iso-8859-1?Q?kUEFjOnceR6axjn5COyfKF6yvdGBRTx/kmCNo2I1GLuvWu95lvGyb6ahrQ?=
 =?iso-8859-1?Q?CvpVR3GMk/04yd5yHRYHD7+ayS/EdCVMHjVypP8Rti5Tp2tYvfgSHUqjRP?=
 =?iso-8859-1?Q?nJ2j1BuBFHG+VzEboe8coM/5j+/yptS3OsaaXeP5qCj6NCkOFLnM5eUK2d?=
 =?iso-8859-1?Q?KKCsMeQX/0ukj1vSTUpnYN319cXTtC9/hBbI1fize5Nls1lIR5m5DS1alg?=
 =?iso-8859-1?Q?kmW7pMY8gUGR6kfwSBbQPSLSooqgB21ai6P4+l6BSuLsGWf6U+kPKnUvBD?=
 =?iso-8859-1?Q?YKkGju5slsBb8TWmhFz8IDaI8lttPOmfyMo7pLFab/gcmCQ6/q0NwOH+ll?=
 =?iso-8859-1?Q?u0j2YnktrYmZUdA/6FD68llJLXssm9R7EwWpItWckUuQP4GCOJ80B26U0U?=
 =?iso-8859-1?Q?CE4apJlZ95Xn4sQZIYTIpfrF/r4QorRWJUryICA8TGbewJIW3jMap1I3Rc?=
 =?iso-8859-1?Q?nSC60Iio+f62f0jHwS9ua6TP9Kp/lsjqdpAL76zUqm3HohDeLxP7b9VjAC?=
 =?iso-8859-1?Q?AYAt/jfzurqbyARvfbozF9Vo85DBY//UPbrnLF0hkmfKhXkNiruwPOgSgC?=
 =?iso-8859-1?Q?mioVGX1mHaFg6J1X7edqLjBkmN2fxVkhaOqete+j8h8STweN+pH2MKNDD1?=
 =?iso-8859-1?Q?B6bqXwExfYRdoCysWT3z5Q006UuwGK9QZoerGHistI/KG2J6MZCdhtWm/b?=
 =?iso-8859-1?Q?01Fnj0TKvbPLoN2908QEmol4EBFLhL82SNNftQoA6u6/0vu+WagKm9G3Xq?=
 =?iso-8859-1?Q?WhjRopicirTA15zuM8emDfuX200z/kLxuc36w0mRZzuU1SY26+ZFEaW81/?=
 =?iso-8859-1?Q?oPonSXt/Yk2Mu1GmHwjg+EN0YIZm28K/2xgKRk4iYcUBGra5J8CLzUxJ1R?=
 =?iso-8859-1?Q?U8udfpUST6WXPjj5rifqcVhemTFfSrFcD1/xJWuTNhM6FdYa6BS/KoDh4p?=
 =?iso-8859-1?Q?z7pgNBsqm96w7htCPmMBxQ2BLYVgPdbMz1mEcV2KreYTHgzeK0Gr39W+QD?=
 =?iso-8859-1?Q?DX4CCG+wyVSll30etdHHClbOZllKNzvWIEmPnDriLV5gB2FGnDLPKQuA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373c2877-cfd9-4aab-19cc-08ddcda9e823
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 07:39:38.3740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pe5uAKt6GQN3zxbU6EkQdHbdIMQqH8Wgj1TqPluF6QErqwKMVRHEx9z5S7DPa+Chs/TdYsBxRFOef8hMPbE6fO13OiJIhT+nTShV13cXDAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1939049CF
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, July 28, 2025 1:04 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Piorkowski, Piotr <piotr.piorkowski@intel.com>
> Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
>=20
> On Mon, Jul 28, 2025 at 12:10:02PM +0530, Satyanarayana K V P wrote:
> > The VF CCS save/restore series (patchwork #149108) has a dependency
> > on the migration framework. A recent migration update in commit
> > d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization"=
)
> > caused a VM crash during XE driver release for iGPU devices.
> >
>=20
> My strong view a revert, restructure to use single xe_migrate object
> that initialized on driver load, but provides queues for the VF
> migration needs.
>=20
> Matt
Hi Matt,
 We had agreed to use multiple migration contexts earlier during the review=
 of CCS save restore series.
We can take this activity as an improvement (if needed in future), but do n=
ot think we need to revert=20
The whole series just for this new change (The series was approved with mul=
tiple contexts).

It is a new change which separated xe_migrate_alloc() and xe_migrate_init()=
. Now we are adopting the=20
CCS save restore series to the new changes.=20

-Satya.
>=20
> > Oops: general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> > xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT
> communication channel enabled
> > CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W
> 6.16.0-xe+ #4 PREEMPT(voluntary)
> > xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1
> negotiated ABI version 1.0
> > Tainted: [U]=3DUSER, [W]=3DWARN
> > Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP=
5
> T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
> > RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> > xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF
> ABI 1.0
> > Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90=
 90
> 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74
> 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
> > RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
> > RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX:
> ffff88811a028c40
> > RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
> > RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
> > xe 0000:00:02.1: [drm] GT0: reset done
> > R10: 0000000000000000 R11: 0000000000000000 R12:
> ffff88811a029c40
> > R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
> > FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000)
> knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00005af31328c000 CR3: 0000000114534004 CR4:
> 0000000000f72ef0
> > PKRU: 55555554
> > Call Trace:
> >  <TASK>
> >  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
> >  devm_action_release+0x12/0x30
> >  release_nodes+0x3a/0x120
> >  devres_release_all+0x96/0xd0
> >  device_unbind_cleanup+0x12/0x80
> >  device_release_driver_internal+0x23a/0x280
> >  device_release_driver+0x12/0x20
> >  pci_stop_bus_device+0x69/0x90
> >  pci_stop_and_remove_bus_device+0x12/0x30
> >  pci_iov_remove_virtfn+0xbd/0x130
> >  sriov_disable+0x42/0x100
> >  pci_disable_sriov+0x34/0x50
> >  xe_pci_sriov_configure+0xf71/0x1020 [xe]
> >  ? sriov_numvfs_store+0x78/0x160
> >  ? _parse_integer+0xe/0x20
> >  ? _kstrtoull+0x3a/0xa0
> >  sriov_numvfs_store+0x10c/0x160
> >  dev_attr_store+0x14/0x40
> >  sysfs_kf_write+0x4a/0x80
> >  kernfs_fop_write_iter+0x166/0x220
> >  vfs_write+0x284/0x550
> >  ksys_write+0x6f/0xf0
> >  __x64_sys_write+0x19/0x30
> >  x64_sys_call+0x2bf/0x2660
> >  do_syscall_64+0x93/0x1320
> >  ? ksys_dup3+0xba/0x170
> >  ? __x64_sys_dup2+0x2e/0x1f0
> >  ? do_syscall_64+0x1a2/0x1320
> >  ? __rseq_handle_notify_resume+0x447/0x5e0
> >  ? trace_hardirqs_off+0x5a/0xd0
> >  ? irqentry_exit_to_user_mode+0xdf/0x2f0
> >  ? irqentry_exit+0x77/0xb0
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7e030351c574
> > Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00=
 f3 0f
> 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff=
 77
> 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> > RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000001
> > RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
> > RDX: 0000000000000002 RSI: 00005af318d7da30 RDI:
> 0000000000000001
> > RBP: 00007ffd34a107c0 R08: 0000000000000073 R09:
> 0000000000000000
> > R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
> > R13: 00005af318d7da30 R14: 00007e03036045c0 R15:
> 00007e0303601ee0
> >  </TASK>
> >
> > Update the VF CCS migration initialization sequence to align with the n=
ew
> > migration framework changes, resolving the release-time crash.
> >
> > Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Piotr Pi=F3rkowski <piotr.piorkowski@intel.com>
> >
> > ---
> > V1 -> V2:
> > - Updated xe_migrate_init() input arguments and return type (Michal
> Wajdeczko)
> > - Fixed review comments.
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
> >  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
> >  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
> >  4 files changed, 20 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index c8eda36546d3..5a79c6e3208b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt
> *gt)
> >  	if (xe_gt_is_main_type(gt)) {
> >  		struct xe_tile *tile =3D gt_to_tile(gt);
> >
> > -		tile->migrate =3D xe_migrate_init(tile);
> > -		if (IS_ERR(tile->migrate)) {
> > -			err =3D PTR_ERR(tile->migrate);
> > +		err =3D xe_migrate_init(tile->migrate);
> > +		if (err)
> >  			goto err_force_wake;
> > -		}
> >  	}
> >
> >  	err =3D xe_uc_load_hw(&gt->uc);
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> > index 90065d7d29ff..7e295ca00763 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_til=
e
> *tile)
> >
> >  /**
> >   * xe_migrate_init() - Initialize a migrate context
> > - * @tile: Back-pointer to the tile we're initializing for.
> > + * @m: The migration context
> >   *
> > - * Return: Pointer to a migrate context on success. Error pointer on e=
rror.
> > + * Return: 0 if successful, negative error code on failure
> >   */
> > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > +int xe_migrate_init(struct xe_migrate *m)
> >  {
> > -	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct xe_tile *tile =3D m->tile;
> >  	struct xe_gt *primary_gt =3D tile->primary_gt;
> > -	struct xe_migrate *m =3D tile->migrate;
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> >  	struct xe_vm *vm;
> >  	int err;
> >
> > @@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> *tile)
> >  	vm =3D xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
> >  			  XE_VM_FLAG_SET_TILE_ID(tile));
> >  	if (IS_ERR(vm))
> > -		return ERR_CAST(vm);
> > +		return PTR_ERR(vm);
> >
> >  	xe_vm_lock(vm, false);
> >  	err =3D xe_migrate_prepare_vm(tile, m, vm);
> >  	xe_vm_unlock(vm);
> >  	if (err) {
> >  		xe_vm_close_and_put(vm);
> > -		return ERR_PTR(err);
> > +		return err;
> >  	}
> >
> >  	if (xe->info.has_usm) {
> > @@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> *tile)
> >  		u32 logical_mask =3D
> xe_migrate_usm_logical_mask(primary_gt);
> >
> >  		if (!hwe || !logical_mask)
> > -			return ERR_PTR(-EINVAL);
> > +			return -EINVAL;
> >
> >  		/*
> >  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> > @@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> *tile)
> >  	}
> >  	if (IS_ERR(m->q)) {
> >  		xe_vm_close_and_put(vm);
> > -		return ERR_CAST(m->q);
> > +		return PTR_ERR(m->q);
> >  	}
> >
> >  	mutex_init(&m->job_mutex);
> > @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> *tile)
> >
> >  	err =3D devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
> >  	if (err)
> > -		return ERR_PTR(err);
> > +		return err;
> >
> >  	if (IS_DGFX(xe)) {
> >  		if (xe_migrate_needs_ccs_emit(xe))
> > @@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> *tile)
> >  			(unsigned long long)m->min_chunk_size);
> >  	}
> >
> > -	return m;
> > +	return err;
> >  }
> >
> >  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> > index 3758f9615484..e81ea6b27fb5 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
> >  };
> >
> >  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> > +int xe_migrate_init(struct xe_migrate *m);
> >
> >  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> >  				     unsigned long npages,
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index af43e04179aa..bf9fa1238462 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >  		ctx =3D &tile->sriov.vf.ccs[ctx_id];
> >  		ctx->ctx_id =3D ctx_id;
> >
> > -		migrate =3D xe_migrate_init(tile);
> > +		migrate =3D xe_migrate_alloc(tile);
> >  		if (IS_ERR(migrate)) {
> >  			err =3D PTR_ERR(migrate);
> >  			goto err_ret;
> >  		}
> > +
> > +		err =3D xe_migrate_init(migrate);
> > +		if (err)
> > +			goto err_ret;
> > +
> >  		ctx->migrate =3D migrate;
> >
> >  		err =3D alloc_bb_pool(tile, ctx);
> > --
> > 2.43.0
> >
