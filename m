Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4644BC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 09:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0324510E662;
	Wed,  4 Jun 2025 09:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itiDbB73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107B310E74D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749029816; x=1780565816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jzK5tWtNy0i19Kx0e/zDbsFylXx9MZq/7NLvH/XTkss=;
 b=itiDbB733zxSyU9W1MYAQIFObgKYpsVy8LN46OkVEzvIRKff+GqNkIDq
 Pivo+CCqol7C2GoPy0js7jSy0yb352r0aCOYiLaIpixNCMu1u4cZ4rnuu
 F5EhH8D8ePkGjZoSdGquiPS6y94RhArNnKewP5J3YmRbz0Xm+EdwKOfSY
 yffaWmDSNNgiKGe9E+wkPucpVyzxouOx/HhsQpuy7d1KLQNMbQp8lLlmd
 HqCR/paAadf05n/jDjlbEtoqyZBGI7O2xRm8Buxm8Fumwi8M2GmDIZONv
 NIwn/SlMOvxq3A7EJT/Z2UCMm5YxzwhLDU/4R3xNfz+1DvbDElPnjaIdh A==;
X-CSE-ConnectionGUID: W/2rqbp1RQ+m3V05oJQ50Q==
X-CSE-MsgGUID: I/GwymVDRhGOStammMJv6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68537782"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="68537782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:36:53 -0700
X-CSE-ConnectionGUID: F38nyjhaSPWDKcvJMj5UOA==
X-CSE-MsgGUID: p4ZTQHDFRRyNLdySYwOv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="146106730"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:35:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 02:35:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 02:35:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.66)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 02:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSH0hb+ulB5py1djNR5BTQqXC63mT6bZ2y4gutUoVD4XxQdqN+o+2S4Uc53wJzeG1YGk/P8VW2H00WZGwr/YFB2hTn+zPIVDru5wZnAztPbY/VFMNxvcNzTBgnuQNfWeVV9M9p2w+5ec8jWmZshtFEpIigVlYUASBuGu1q72oyjwkIuzMyY/oCSEOe7MXkNZOUDya9lubHuB9SreU2CskXgGSQW4U7WECr0QvTYERtlhE71sWavF4/lhGoPCwKyUXFd8kTLQ6nP1PAlR1MQe4fZqqKgrIDFT5fQXPO51vFMOZJ4poBIBUIRfleIgbdbRjIe8spnFghhd7/BgaAp8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfCuhuNHbNVZMkWeadmunblwBhMfA2OGIe9nHGTtzSA=;
 b=PqFq4rbTmoDG58Ee7F+ar5hLEAKaLw/QxnUUBgaVftpNPvR/J8UebfsdqikWqb6SjvboVQsvwlRxcGxcgH06DAq95+minMLXxcWrA6xM+mJ+gWvEcuDgan6LhK5LW4xR69JLCO41ds855lbfCpSRBEDzf50tL6O1urozEiNRFNWUiCsoFe29YhtSMlm3RCMqvu1iQsmI/orarmnp9Sdqv2Zi8XIaUQaTgTi1b+HFN1cD8eRgiifuFBy4clJTA5w1sXs0+XHZqx8eNY7FBTiMoca8NuvqQwr+vybXLbT8YAPr6JPD4HwtNKR8YyUn2cwI0eg5frYrKS4uVn7Y/tg3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 09:35:36 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%3]) with mapi id 15.20.8769.022; Wed, 4 Jun 2025
 09:35:36 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
Thread-Topic: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
Thread-Index: AQHbwzarv0rDdE8l/0m8jbmN0G684LPyL7EAgACwiXA=
Date: Wed, 4 Jun 2025 09:35:35 +0000
Message-ID: <IA3PR11MB89871770D69C78F5F15A8341D06CA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250512123254.3332629-1-nitin.r.gote@intel.com>
 <20250603225846.GE5080@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250603225846.GE5080@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SA3PR11MB7979:EE_
x-ms-office365-filtering-correlation-id: 22d7691d-62e1-4487-33ca-08dda34b28d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Zwj9Oe8mNKPqFbEipPH4n8PEA46fy6BDICBgDhfgtrCGqUcOZDuDBe1HWnms?=
 =?us-ascii?Q?EaqmASpfPqIhi6PzjEeZC0nFt6tim6Ub+xrszi8lIKAE+RC+5hJtYXwSbfc+?=
 =?us-ascii?Q?fOl/AK+lhHFNY8ARziV4dfwO1wVhT5diZrY7cxXHm9w2/nVJZR7MD65kecBk?=
 =?us-ascii?Q?45U7xcUIqaXwNR71cx8iSOByJ4NUiLGXgHLNTI0UDJAj4IUiyfOkc7Qx41XY?=
 =?us-ascii?Q?08vTz7MsCkiT6d7hGuaCDZs3PoJloIv6l/i9GV4PWQcoQme56GGlVFyRNQVt?=
 =?us-ascii?Q?bf9/yEdR0VeNVeOOxBVF0soY7ooGmXKq71qei7Ln5alDfIDjFXL6V1Pij73C?=
 =?us-ascii?Q?1XjjmIY9UjsLwZt1RhZi7mSCh9v9dACFLQme9vViIOcm2s3szj8U8EA3ty2G?=
 =?us-ascii?Q?zmOtcxe8ugPHcjl0mrmBNta6PtjoiYGNf+C33avkQOi+8+vXNlgvJs31iXc0?=
 =?us-ascii?Q?dRx95kcpgv9DXr2ZpcjzpegpZbwXzwJ+wAXYtGNTrPTvFp6lBIJcw7vHG0DO?=
 =?us-ascii?Q?y161pYQHxDHoUocrTh4tXA7JzjeTyi7yGyFoweREJ35oqHoVCbyrF5ukI0jv?=
 =?us-ascii?Q?VzAwt/sZUluXiOXiHeuCrNHJEAmAO3O2pN6yvYor3xydtOntjL6kYo/wAUAL?=
 =?us-ascii?Q?Q8MpOwWdGt5CjW9FZyLbNTtm4brjQDMapygzO9ZFq+Gwz23UsxFAL1OH/Oo0?=
 =?us-ascii?Q?pqHyK3LAHE+pe2sT4q2YF+ZZMe4WcTrG364ijMVg480a3W9D0Vrs9pB8Snpe?=
 =?us-ascii?Q?12YjzDK7ApRV6rtbcXDq62zqVT2iUzoqSV1DWif4m5yBsiuIdFKkv7ZNcL1P?=
 =?us-ascii?Q?OmkcQ8N0OhShkq3oCxipuJSZRldUVkYzhvmGK5HnZcdRUb4u+68mV3pRx1Mh?=
 =?us-ascii?Q?MQ40IngMMxksv3QI4llRobWvBl/1IwxcWURi8a81/8R3B8WUQmDwZgAKhSis?=
 =?us-ascii?Q?OumfnPhdWB6qxMFAcXTirNxJKvkQiBux5LcPiiQGMjgfPYxPLhR6bIyfSxd0?=
 =?us-ascii?Q?JTyswAyHczVtc+aCm2e5dROXy0s+Z3gSnhD7FkSDzi331TU++aDOW0ksPNGE?=
 =?us-ascii?Q?k8WkZTW0dvfiJgoE+Ip1zxbxxMdGcWv+Dzhzop3Yij65QSncFixXlPFjK8Af?=
 =?us-ascii?Q?3pU7ZxZ+IRNSgP3znYneVDyoNwNYNHeUD1MMHHTgl+0yGx+qruyfO97a4AvK?=
 =?us-ascii?Q?Z8yKhUjUNznpI+rJUqZEgF+kpyxp3pOtYvn7zO35zQc5qALkDU+kdiBGWaxX?=
 =?us-ascii?Q?af/AuBeyIvhWbp9Zvuzsg5hziUWt76MerUpKiOQOWnU9c8vllQuMsOn+g+r1?=
 =?us-ascii?Q?VC5ZWWYYEgFSgmukG0q6Ee7fVYW3g7pBEy/DdPW6Y+GZYg24BTRfQ/edjWLw?=
 =?us-ascii?Q?TqFzGxARieblxY2ucHyLHA6aSuBWzWW43TEtVjqhFjoqlY6KoNm8CV0OnGCG?=
 =?us-ascii?Q?X9QFktgwZoGQsGVfNXpMI/1Qng8ygoqnOZMVFLeayXLBJmLgJYXtUxmeN45M?=
 =?us-ascii?Q?joJQaYOFnfqdxxA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ye3weSayDYJXGhzON62FjQ7NdYhL/s58MMZ+NfCSk2vXoh2+DM9Mn4OxZ9Rm?=
 =?us-ascii?Q?6VlafrOooV6kZmdapGpzCGHUKEyWISO//BAcMtNEfPk3ObuBv6IJgaxRzFhZ?=
 =?us-ascii?Q?pyeDp8Z+yP3Mzs1zs2P9nMq4RoXbYoLm3JGgmRjt3CmTHazWJkxj08mGHOUT?=
 =?us-ascii?Q?DBsQN/i/Q4/fGpWpYJe+AZv5j6R6uppGDDztOZgrTi4xzXU7wGgAUhwyEBTU?=
 =?us-ascii?Q?UNnhql8Ri3wmIYSUWCwR4Tu/z+rgIcuUTxMd73FMbPV/KWT9JgRpM83Woh97?=
 =?us-ascii?Q?zRkybCi/p2L9WEQHE7rgLUqvR4pz3tj02T8egsU0hLDReCryh8OtseVZMnGI?=
 =?us-ascii?Q?W5eeSOPAqKMXvRYGeE0A3FpNF21Z4EK49FSW2qQ7Rwoc+9vmXK69Thw40jN6?=
 =?us-ascii?Q?Iqu1UeA2awWabN/+9cjHeGptl4+V9JJrL/l0WLgMkRhKnV7I3lP2Nt4t/Q8A?=
 =?us-ascii?Q?xlrEZJskZFaeEvJzUl1wMgJvkxr0GWV/JZfjbSw98EmlOPp/lt+SnhmA7maV?=
 =?us-ascii?Q?DlywBAQqND7Cuva1wBNJOdjrsA/TmisWKeaHFPFZboY+zjZFNSraxs6X00sk?=
 =?us-ascii?Q?3CG4n2ayjQZKolOQU5Bnmvu0ho5A/8UYDJ6S6/I/tHqss1mkZZRj1GxGT6va?=
 =?us-ascii?Q?5d97LxplEBb2Y6KW6AEKEySQfgzFaKGTrUdwFoB9FQzbIFyaw9qvEr77dKXo?=
 =?us-ascii?Q?umQB36IRPklRoTUGDsPUAc8Se0PQl8Qoi4HLzY3I+q3X/IiK5aeC8CLO3B1i?=
 =?us-ascii?Q?KGRHnfw8wHC/39/apblmYaE/xrUFz73IyInzYE7VZy51qID3tWrrQEYc5Xe4?=
 =?us-ascii?Q?rznod2pjl31fcEyyyH25uD488aaD88kdQuVmPquCk3X0zIgyNjJ8+SKgpNUz?=
 =?us-ascii?Q?U8fRLuKVX531UTpFgREEQ+secBoOQttA0iH8Q2NfRIxsHrcg+3TExErZTSx+?=
 =?us-ascii?Q?VXtTu8dPvCwedDAVPkz+SlX8pqJYAgWM08gsV1sUMiwNncJmuCM5/SHU5Xhz?=
 =?us-ascii?Q?eq9flnZoirxUxJ0PKFJcVzGLa0QP+txxpIB3ocI/H67I14ibXo8MxRWUZeks?=
 =?us-ascii?Q?izeX8YP5/mf9ACT3hKiLr8BCFcFugwsU+AGWXKPaRMn1TcvESQxAM2fXx756?=
 =?us-ascii?Q?gRFJ8atpuF1GcHmztyDK98ZiQ19LsXhGDTCqhLa+b3exqEeGv9iPF0L1HTTq?=
 =?us-ascii?Q?4CwnQcgmmU5nGcm3nRz+KE5giZNNQoMiOi6hYuVqrG7n7T3zAGcmxqGjkynU?=
 =?us-ascii?Q?ka2X3p+k+PQsJ0Agn853dYO6ZU7BCrxlw7Hn2QKmQ06rRKm/n0gD5JNAeApB?=
 =?us-ascii?Q?ibvVA9bBeKS0zdx0hZo5dRX4B5e5K1zP8GU/YISk79LTqo32GUxs2WWMnxU3?=
 =?us-ascii?Q?uY0fwb5jw9JHeJSzx/4pGb0aSJJHoEO4ogJTw2BMdecADaU5tUn0cy29FJ1J?=
 =?us-ascii?Q?kFKr1LdiBNC8jjZWnalcRvhT34V8ZdJMBQ68s5PCaubp2/Lm1XmKK8QDwtpk?=
 =?us-ascii?Q?2ag24EXj1EhwuaWAZYOvgaDtqXdagAXEHvt366KyVmt95O6s+P2wTyIQKkze?=
 =?us-ascii?Q?Qi8rlc/7t5JgocgQ3BLkU23I72dR9Sjk50Hji8Jj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d7691d-62e1-4487-33ca-08dda34b28d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 09:35:35.8870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /h+aewtaCp+GruY5QK5xUQCp4jIDhyndT4Px6m40gPNbNi3BNVw1dcp48nVTo5RXNg52FcBAatAYyWbAaAzHOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
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

Hi Matt,

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, June 4, 2025 4:29 AM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: Sousa, Gustavo <gustavo.sousa@intel.com>; intel-xe@lists.freedesktop.=
org;
> joonas.lahtinen@linux.intel.com; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: Re: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
>=20
> On Mon, May 12, 2025 at 06:02:54PM +0530, Nitin Gote wrote:
> > Set DIS_NULL_QUERY bit of RT_CTRL register to disable null query for
> > anyhit shader for Xe3 IP.
> >
> > Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> > Hi Matt and Gustavo,
> >
> > On PTL, Default value of DIS_NULL_QUERY bit of RT_CTRL is '0' only.
> > Last time, I have incorrectly read a value.
> > So, this change is required as per request.
> >
> > Parallely, I will request to update bspec properly with default value
> > and also proper entry for tuning.
> >
> > Changes in v2:
> >   - Use xe3 IP and not ptl in commit title
> >     as this is  not platform specific.(Gustavo Sousa)
> >   - Update a commit details properly (Matt)
> >
> >  drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> > b/drivers/gpu/drm/xe/xe_tuning.c index 49ddbda7cdef..6f2f3428b12e
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[]=
 =3D {
> >  		       ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE,
> INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> >  	},
> > +	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
>=20
> I hear a bspec update is pending to document the default values properly.=
  But is
> this truly specific to 30.00 and 30.01?  What about the 30.03 that's in t=
he process
> of being enabled right now?  If this is general programming, then we shou=
ld really
> just use XE_RTP_END_VERSION_UNDEFINED as the upper bound for now; we
> can replace that with a real end version if some future platform eventual=
ly flips
> the default value (or eliminates this register completely).
>=20

Yes. I agree with you.
I will update XE_RTP_END_VERSION_UNDEFINED as the upper bound in new patch =
version.

- Nitin

> I'm also still unclear on whether we also need to be doing this on the
> Xe2 platforms too or not?  According to the note in the bspec, a value of=
 "0" for
> this bit isn't valid from Xe2 onward, so if Xe2 also has the wrong hardwa=
re
> default, then wouldn't we need to handle it on those platforms too?
>=20
>=20
> Matt
>=20
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> > +	},
> >  };
> >
> >  static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
