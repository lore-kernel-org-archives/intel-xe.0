Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAC5C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF73410E1C2;
	Wed,  7 May 2025 20:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWnBxOyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E5010E1C2
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650190; x=1778186190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DgZuf63Q2Xgxiju3mIN12tR67r3J8k98tM2wxs82oX4=;
 b=dWnBxOyLUhqvMO7h7gk32RqFABKEG8MscuI6VAq+pl/+bABTzgw2BMXi
 1ov+Ykf1PWyDZd4zagf/D979QXRjOBjE1ijY27UQr4MF+xzrKOQlB4nC8
 wLTHcIhuAs1KHvUBL+/3MtdAepIw4CXTwiWoZaBGTfXMwJZc1+MnvxNRZ
 vc91F9dpeWmbpXzP06H/SoOIpJ+yWNDl8IYpgyPsBNojHY2K9wEpAp97z
 zEJq8+5qFuDJmgtZHpT8IHjsY+w5Azf+h5nGiKKiYl5g/NlBC1newor1Q
 ITrKSrDOAIE7xA66mplmrlER0iRL0HyTqYpUiwV3lVj/9dwNog4lsgG5u w==;
X-CSE-ConnectionGUID: ggDhhSBGQ3mXwtBoPBSDSQ==
X-CSE-MsgGUID: 5wHzGlLuQZKkvWxg8rBARA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51062665"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="51062665"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:29 -0700
X-CSE-ConnectionGUID: c47jUkn2S9mcmrqeKCXciA==
X-CSE-MsgGUID: IntGQcFmSvCqoJjw/viVSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137002461"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrlqI42AvM7/2QP9aEqyOeq4jIygvha6GwYqSq0G3cxOLoArdmXZQ7FltCb/FBD+5EOn+YzzZMqbNap5EtyWuaV6vAFYB2nf9q8Mp9p/oORh/+14/7KOAY5022Cfcfi02AD8GLZrffAGgaS01o7whhF3URGwYA6dH7nA4K5qbXWEda2ufLeMSgB6jgOFiCAFK12mCY+YSY38nzK0qTttq5LZilPTZ+139V1hkkysYseCxX/Sh6GgmX3cvUA1oAE7s8ilC3s2YFjUlRDLxKBDMYHL6WRZjDAPsM0iNbDog1U+NWUG+4YV1162ChI1Q+jtzr5X94TH30fg2ewSdTUiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnjVimoiew0Nl2HO7TvuOPh6A42X1qr+RFjMy2OSWV4=;
 b=QGwLmBwuoi9OHPFvCjYqwp6V1Ptz401lMWcHh0yutMCoLOiEZCMOhhAxkOm9eUedhodviot/KRZj/ZKsCoUQZBWasJq3hSymh5yf4CrCcWOM6lJ0dpG/d6tvVIx+YfGVO5DMGe9a/DzFdua30MRx6K9SpGUuHo+DwoRS4/O1F6am6cftGeJv6MJrYa02uEIa4+P3OO43+9Lo03fBcNJrPkkYYSB6+ubMcUCRs+gtuVVaRqR7UuVPQlRfpOAZXvEvWi7AW8ivjnm4ozLdwtYOMfipNm3ud+zvWWOhfbQgerCxHj0Meou1zgJwVUjceb0FO5XsIEUuMMWdcy9nXF+OPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 20:36:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 1/9] drm/xe: Add properties line to VM snapshot capture
Thread-Topic: [PATCH v4 1/9] drm/xe: Add properties line to VM snapshot capture
Thread-Index: AQHbv4ymRHaAmRiQ3E6SRgXZoL5RKbPHmwTQ
Date: Wed, 7 May 2025 20:36:25 +0000
Message-ID: <CH0PR11MB5444E0B1A5BD5E0E0FBE2E8FE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-2-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4727:EE_
x-ms-office365-filtering-correlation-id: fbf564ab-78b1-4f65-5f73-08dd8da6d686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?BqgiSL3Mjy3Qx/mR4jBeOuF0M1OOV74PPPRVQH8It+Ut9z3hA7vclcpvd5?=
 =?iso-8859-1?Q?zeRU18bK5JYFxMO61wCjceGaK8aMW3mVZvm9/fwdKjQ/jhafXV6+AOOTpK?=
 =?iso-8859-1?Q?D/e+pM8bGKPGu+6LN4xNjA/4g1UfXWWPcZpddRGhmroF/TduDnRA3adxP5?=
 =?iso-8859-1?Q?l8jRXXevGPIpHYIAns5v56SHLg6tRijta05flKof3PJTvFeVHAoyFNa6+W?=
 =?iso-8859-1?Q?GJb0zfU40hbmPW2AbP9AfuRT7oEj6zUbm4qMs4JNaYaN5YkRkF8wjVrRFg?=
 =?iso-8859-1?Q?mpBSJxd5yPqsNBjt0rYVeF+F42QHT7xf6gSok1sr8yhedhAk4rTjEEImuA?=
 =?iso-8859-1?Q?sMK48+IQ9O55pRTsoe5r/A4AOdxBuWrxFtpwnCRWonvNNDuKoeDGUVmPOZ?=
 =?iso-8859-1?Q?MlXZ9Uj7/Yn06iQvhaumVSjoxOTHWtkybUIjnQ7d4muqRaEl9DKv28ywii?=
 =?iso-8859-1?Q?Ipof95b0hrVCa+susyS3T3ScWxmL77oe6ODVFdRttNKctRSgyzCsiW4mW7?=
 =?iso-8859-1?Q?bEQcHs9T8Tc735Qvb2rNr65wChFXTFoRGTu+eJHK0Cs7DzbKyoT9bDgtbE?=
 =?iso-8859-1?Q?LLYeyReHsyaIhqBl1TRoas9nCnNBjRwRFXjByXxRy7p87oM2tLuZcNZtbo?=
 =?iso-8859-1?Q?WQ150cOci7ozqxdLEKpuq0IMJ12T4HmlxG/xhhY7U/B13a6fLsa4bjKCRY?=
 =?iso-8859-1?Q?JoTk2RrNcHyN3zeB8FnOTSt0lFb1h5ULn2OrQy0w8RncW91DNIQKwVsqhE?=
 =?iso-8859-1?Q?mLacxzhdVSNu7aft9/vc9RgmHcmrdIZOaZg/0QZkVwgs9zX7FDDGkVdSL6?=
 =?iso-8859-1?Q?Yc0e/2YbwWNooxwtK1xfZJvECt0uc/BQSSmfzuopytICQrUKo1VI7uVr/o?=
 =?iso-8859-1?Q?DnmLdpk06qSBF/02FRLD4ktPJUuxZhUR+HJlHsplcMXnWEVtUdxwoPudlj?=
 =?iso-8859-1?Q?eWs1lHQsmoRF5qhrVaDh3oKhFmihKLjhwav7HVQJ1Db5XHJZpvBsq5QKZh?=
 =?iso-8859-1?Q?eb3+f1lDadu4PHNLmP/7deCXPLNG6uVgAs5+fIY7e+42EhsUa6scMlw+ah?=
 =?iso-8859-1?Q?MY29KF/bXvB3k8MXDAsQQLDL9zdEv53Pf5k20+o3py5Sr39QhkeLCxvvfY?=
 =?iso-8859-1?Q?/NrcGZrhYfoY6+mOKmD94LyxWwbnHje4M6OjlKBRtpqQfiTmFguiy+lmWn?=
 =?iso-8859-1?Q?boS5qoetAsjKzsKXFWrtqPzBzy4vPSrvStxw7W4VsfFkZ2ADONCI7k91bc?=
 =?iso-8859-1?Q?FTZhQEPrD9klc+N7zI6Hp6lXSxl8kj4xYdQlEZTJkvbbPS/30xxk6t0w5A?=
 =?iso-8859-1?Q?Qd45fK6yD0HShQ9fSUeSg88tk2qiXZ9SNXitoY6Ss5Y9swaCvqhgJ7i7vg?=
 =?iso-8859-1?Q?zaTf5JsrFBzT+FvYoHjvzox2RhKhriP2P9oDgZ1gN98g9NQM5avnQStg4E?=
 =?iso-8859-1?Q?n/j3N8aVRXuTfY+KD1+kSnSfbgNLcgq2TmZehMHRPtWJnhpMsAtsQDa4Ra?=
 =?iso-8859-1?Q?LbnzWYcBtyf7mEEb73vYA6MIRayF9gnkMduDu9j2wSHYCWIxFFm8+pciIp?=
 =?iso-8859-1?Q?C7sXgFo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YP+zDbiO0xKRppjeNOu5OAL6ke3wl/mSbgMtjJfB/FKOBpdCq6JT1ERdjy?=
 =?iso-8859-1?Q?U90F2bXD8njVTZ5Srz9P1IxafAofayOlNc0hTiS/W+koP+a/Q+K9LGBp6M?=
 =?iso-8859-1?Q?gu8+5WekZfE5fA2dPa7x18x9oiaJFXFK6KXvr7PyK+flF7oHkKpATMDUWD?=
 =?iso-8859-1?Q?UC76G4aoUl38/B6S0YoLn47dlLXgojrugOWCrERKjLDO0ZAdUIOlCuWBDn?=
 =?iso-8859-1?Q?gcQgON4Dk9QT9xElqPGBwpCkXAfGvq5Fp6HCjkKfhBH8avgCKYB1DnzekG?=
 =?iso-8859-1?Q?lg6xqqI3QdgFKGJR8zBAytUY5LSEIaK2eMsFfRivwh5mtDL7zOdyqDek3M?=
 =?iso-8859-1?Q?mDxBEgvKXetKXrtPTE+8OXm5/R/Mz+P2Rp6dYC0Y9qUbg3JU0Go3RLeQzd?=
 =?iso-8859-1?Q?4meCgdlO9oX2VTEONkseV7dafVOKB+3kxxFA7mH5H3evYsiTxT7Gx6SjAv?=
 =?iso-8859-1?Q?82WPEJ10dzL9HreU5BYRMm/WoLCp0cjkq0dD2vAY88N9c9/vj7V7fSMBIQ?=
 =?iso-8859-1?Q?jQPKYFQ/W08FB1kzehJ/6JPyksIeP4y/oXjsqZw2m3xJ8xw0RwzAatsIAj?=
 =?iso-8859-1?Q?9iyofQfpPK2+mFiFvD6bo1FIFeV1olU1R0cG4Qx9KYdrIeV/Qj2ldxdqHL?=
 =?iso-8859-1?Q?616ZJXZeSV7gu6fbq3nJWr745B2ALpg35p+lcyiX3W9d2Eyr7EzWt+qxsT?=
 =?iso-8859-1?Q?LnADFFpBQN83+ODBW9nvhS26Q9vjv5EDBX/P9TDrB3a5JWtmNrUu8qspeH?=
 =?iso-8859-1?Q?2HKrKDhY1K4lZxx3cVwlg7iqGVKQlSt4Lvu/jkVZze/wMaSQQJKqKgSUon?=
 =?iso-8859-1?Q?fyQwCXjlVvW4e91UPreYKLLG/L3E0XoUSzFy8OWpc/Ghn91ol/k35Lr5e/?=
 =?iso-8859-1?Q?hcV87k8bKJn5OfUASyAdar9lxZbpqnzecu6WtvX3Am/IZTezP56qD68Z0X?=
 =?iso-8859-1?Q?8BQSc0SDxRq8PqcWzaKZUo0oopV1kISVqQpyTWna7jYlDMQULboXUttLzx?=
 =?iso-8859-1?Q?RaqW+C7etWAuLKwdrtOnUa5A4ZSHxe66CcP323YKELeo7yzElBl25Wq7vA?=
 =?iso-8859-1?Q?88+tmg9pizWwTjsaQr2PQBm/0/qsy/ryWtg42X7xEWrtB6FzMr3/GXEVvV?=
 =?iso-8859-1?Q?Hd7uSW++SEzYS+IcdEqaFlZ72f0F38N5kg83OGFwCc+RmqFaAYfj0pubc7?=
 =?iso-8859-1?Q?VtGdAt/Vhx8qHng/80zK7cB/dl3BQNuAyrW4ja7GnrVywkNa34VekYtJ3Z?=
 =?iso-8859-1?Q?xOpNj7kQgelxGO/lxEQ164TmVjvTUFYWCG9sP4vsYz5JgSX7FAhUl8dcng?=
 =?iso-8859-1?Q?pq5MrwOPwBpugDacZBSWWQxXV+LNa9eK9Iizzbsl86sERR4RcDZEBKj5tI?=
 =?iso-8859-1?Q?BB67AUEpFaroMp0OHKqWaA8BbqqLDYYCmHV4JhcaK8CB50IBKJoSR9WDYq?=
 =?iso-8859-1?Q?VWZ/vumRPawPXduEzh3gEt1qzvX+LGD3QvuXTTyI/O+JpgzGxszM0RQPTi?=
 =?iso-8859-1?Q?7xeXhnfnUMyZhPY7MDNgWBh0x39VQyyZHfS3QtBaCwoSPbd9J4yo0VZLHW?=
 =?iso-8859-1?Q?qKwHMpBuXN/hL9lhmpqpDzYToTOwuDYGDszBbwMXKlk4WEOdxoJD9hirJs?=
 =?iso-8859-1?Q?k0bB5O0+47i491U7EvoRf+jk/95lHyiOiA?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf564ab-78b1-4f65-5f73-08dd8da6d686
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:25.9456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HLVRiEJoVN39C94n9zJL2np6hYjq42ls8ukblshyV+QmeM+ocPRkGG+sfNN9j0z8ZHOWD4k2hJbaDGdynaYHR2RFDGmUyLRqCQ1o9mkT3kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 1/9] drm/xe: Add properties line to VM snapshot capture
>=20
> Add properties line to VM snapshot capture which includes additional
> information about VMA being dumped. This is helpful for debug purposes
> but also to build a robust GPU hang replay tool.
>=20
> The current format is:
>=20
> [<vma address>]: <permissions>|<type>
>=20
> Permissions has two options, either "read_only" or "read_write".
>=20
> Type has two options, either "userptr" or "bo".
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 79323c78130f..ddeec681f71f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3727,6 +3727,9 @@ struct xe_vm_snapshot {
>  	struct {
>  		u64 ofs, bo_ofs;
>  		unsigned long len;
> +#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
> +#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
> +		unsigned long flags;
>  		struct xe_bo *bo;
>  		void *data;
>  		struct mm_struct *mm;
> @@ -3767,6 +3770,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struc=
t xe_vm *vm)
> =20
>  		snap->snap[i].ofs =3D xe_vma_start(vma);
>  		snap->snap[i].len =3D xe_vma_size(vma);
> +		snap->snap[i].flags =3D xe_vma_read_only(vma) ?
> +			XE_VM_SNAP_FLAG_READ_ONLY : 0;
>  		if (bo) {
>  			snap->snap[i].bo =3D xe_bo_get(bo);
>  			snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
> @@ -3780,6 +3785,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struc=
t xe_vm *vm)
>  				snap->snap[i].data =3D ERR_PTR(-EFAULT);
> =20
>  			snap->snap[i].bo_ofs =3D xe_vma_userptr(vma);
> +			snap->snap[i].flags |=3D XE_VM_SNAP_FLAG_USERPTR;
>  		} else {
>  			snap->snap[i].data =3D ERR_PTR(-ENOENT);
>  		}
> @@ -3849,6 +3855,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *s=
nap, struct drm_printer *p)
>  	for (i =3D 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[=
i].len);
> =20
> +		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
> +			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
> +			   "read_only" : "read_write",
> +			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
> +			   "userptr" : "bo");

Many of the future patches end up modifying this drm print statement.  Mayb=
e it would
be better to add this print statement as a separate patch at the end of the=
 patch series, once
all the potential sources of modification have been introduced?

I suppose at that point, we'd be hitting various compiler complaints W.R.T.=
 unused variables,
though, so maybe this is the best option.

It's just a thought.  Either way:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
>  		if (IS_ERR(snap->snap[i].data)) {
>  			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
>  				   PTR_ERR(snap->snap[i].data));
> --=20
> 2.34.1
>=20
>=20
