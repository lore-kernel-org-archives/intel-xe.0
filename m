Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D8C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 12:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1D10F08D;
	Fri, 26 Apr 2024 12:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilg8HSKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDFE10F08D
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714133731; x=1745669731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oyxkGZt59GeIVXyr4gUiUHDzS1QC8j5V018AiIwuUxg=;
 b=Ilg8HSKVXRdnFXAcNswneDqkT/i82uERmj49FR8gNGqolyVe1/NfxBX3
 eqZ/Evl3V9gALG9ypJUwxtjcfKy3HYOHhJM/S8rmypX6aKHELP+OMFPza
 in7ejxUJESrqRuKIJBx2zg5Hw53Nx5EmOpe69NSVlBK7n8paK67zMKYAK
 VllPDjgc/uUtUFsOH7K3LRhev3U7odVDEledsSn7dNzjkTWecoFrmRh30
 DaLfwOzzXzL1YIB64JOXznLmG1A/YcBmDDifCEDd240fgbeD56mw60ghM
 CjT6Ev/tFGaTh5i9o3rUN/fNVNksNq/2TJSYQmcJLFc0pBLcky5x2lZmV g==;
X-CSE-ConnectionGUID: t8i1bQqBRwOMBYrQNsw6ZQ==
X-CSE-MsgGUID: jFitFBqFQImbldgG99RHRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9980322"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9980322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 05:15:30 -0700
X-CSE-ConnectionGUID: 0oTFvDShR+27OTzXi7Cr8Q==
X-CSE-MsgGUID: eTNaUh2bS/qlw44doMWvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25903607"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 05:15:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 05:15:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 05:15:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 05:15:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 05:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkDK3ooQk0vAFoqRrkgQYhQUVuYqqkjYCYY9Nud6RTQxPgW+Iph324CVdoecTVgrwGcyfWZBGJtUO6vYxddxQrhake9e0nkr6cO4PKzd9h2U9Jz2msPkRP3l9eCwV9Xyk3MWmBGhX1cxjDdcqrlfQ9q0eYNAxqMP6Oie84XYWDYDZ6M8rFFACk08URYkvBuPbwsvOahX2/OfeXleGTnweY4sYclplWbrArnkAUN8Fa0SLQxWGWHO1TUrEpclaCIzTHOtlF6EbLDnKF4NKenBFf8Fm2QMDNML5DSy/MM+B8VyreOnc59TWD08VlJCtUtlnCETfMDRM/cy9EyXjE2zYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L91lLUf+dOzQHxoYVUXfKAA3EOmdwdvFWbObJiFWOAw=;
 b=IfLRYUqNzA4BNeZXSlwIFV6kt2/mZd+CyzFdbGN6GdzGhMI2zPFqH2Lu4xxFAMMibcwQAvwrEEVvHcJSC71j89YLoNLKZKPv2QT2iYZfuy+eITq+DpbaCLjjHiJdxoE8ZdXKxSQQ0tNBjT4I2jbBlQy2SPx4R4ApIKQFuyeM78jmm3zQrIRwFQ/9PlcKgJZDnjlkoR9qJsxQ5PuAIDHrwSeUcfpiawK119gsuVnyXJZ9kfBd69L5QGkj2nKIAeyfdpgxBUao3pGPSeatDeFEKTMtd7/3ew/YBp5mZoapRFHF6Uvs/Oqn+m+lvzV1JaZ/1XS57frG+4ljR5pePHH8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB7699.namprd11.prod.outlook.com (2603:10b6:806:338::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 12:15:25 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7519.023; Fri, 26 Apr 2024
 12:15:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Thread-Topic: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Thread-Index: AQHal70zvv+vbuTNkEyPRDhwQJNbRbF6VEaAgAAiN2A=
Date: Fri, 26 Apr 2024 12:15:25 +0000
Message-ID: <SJ1PR11MB6204069AD48E6C4380C3AA9A81162@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
 <20240426094947.2039436-3-tejas.upadhyay@intel.com>
 <MW4PR11MB70568A68757432E82F25933DB3162@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB70568A68757432E82F25933DB3162@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB7699:EE_
x-ms-office365-filtering-correlation-id: 0712dfeb-4972-423f-044c-08dc65ea8db8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?SraZxVaLpynLU+TlJbhN4c/NBqGSQh5oLMopCcl1oW2J3TANFPrhT88VluK5?=
 =?us-ascii?Q?sIjbh8KeKz5/b0ftfSk0uU+h969J+K5VOP5Tbm6yRcGmN5bXNurv7bjckEUJ?=
 =?us-ascii?Q?zJQH0woB9fp1+DTcHbr1D6iHGbdVnyzvBIIJwsfxEY80+SzhCN7Nf1oVEdeo?=
 =?us-ascii?Q?sGJZpnFC5QYeGovY48FMg/XRmFWm6D+kD+y+0WKEwaymzEy+JbmpkbPdE5ey?=
 =?us-ascii?Q?tu2XDz5XMkttVCWmuhYE/AUBTS4b0cC8JDpPu9P5HLzUT50s7/8DN+p9dCad?=
 =?us-ascii?Q?XcU9tYkx3VRGUgVAzHqlBKzOqsv4XanIuczSwiFJNIfgQoof+GQwMD2gaHn5?=
 =?us-ascii?Q?uWZn2sirkzCzQgrlkPZkZ3V0FRyjugM6O6Fq+PNhQhCAE1EZKG0i574RYrp4?=
 =?us-ascii?Q?OnspjCSGvFexATnbCpHcm+3ixJPyQsKElCXrWxBkH20VWslGhwGGeD25Yfkc?=
 =?us-ascii?Q?XP0q7XkjTq4+0hVmAWsRCQ//Ca0yJb3vZCDcifso2MVvaGnyLT2HW0TCm91x?=
 =?us-ascii?Q?hjAU/+bXhaXVNCWoDocls44rbrWQCRoCH4dmvZLmqNtcY4Q3Z40xgsbXzIP3?=
 =?us-ascii?Q?yFuC7Adnu9ERaE4ZA6bmFdGWO/egxLnk8UTCIyGqV/K0ZBR1CshGd8jqaRMe?=
 =?us-ascii?Q?1rQIAuZocb456xw1nDM2sf5uKh/2k/ufTwvQieJ21fd4sOYxbUD849jAA4uv?=
 =?us-ascii?Q?OcvoX0+9OtL19HNP2F6832qX07EUpAokRvPR7Ip9iozQD4HNuuCl9JW6hUGp?=
 =?us-ascii?Q?CreC7TsYPYSATunbLqgBzZ8bTbk923x9xhXNnlEvkirqHxED9Xj1Z0lBQvU6?=
 =?us-ascii?Q?vqFynMhTqj3R9Sdg1gf0ESDcYNjgtemXkbDxfM6LZMtnXRuPiCteKZIPuxEr?=
 =?us-ascii?Q?7Un2Qgkh5Tzg2V0nOxntJSWG2+O2YsCNebjlgJM4e5JdU81Y/FklV+/Fj9cA?=
 =?us-ascii?Q?uHb1sc4KnCHnMvTJFAq5XiuumAf/y0JUYpEtP06m8xpJPR71e2gpOoMdQzSH?=
 =?us-ascii?Q?712NuI8w4yQgyMoRfxK5E9uUuk+d6OVArRO+mGB/rtHOBGrQrBcELhfZLN/n?=
 =?us-ascii?Q?EtTbzQQnt9MoOR1A2m5bDqMKuWKS+AUILDPbY6tk3IaFZoY6XiWuHTnKrBD5?=
 =?us-ascii?Q?8c9RwvCmBNkJ/9ydgkdaHOu8ObAVDkErvmL5ijG6CUIQ5L2E8yrlHMk/W4Do?=
 =?us-ascii?Q?dHfrxnNyakbIpmNxP+4vDJQLo5xEKeGl+FzacN44+fIAwWsYYXH9Xn3hY8M2?=
 =?us-ascii?Q?xock/fK9epkTd2PmYpG9wRN07kGc27pW8a2K+EQaqFAGM1HCgrKACI0FIm3t?=
 =?us-ascii?Q?RAU7XcyqMhJp+TGMOHUFw9RQfMTlkB2tor+4zp3zZ9/7lQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XdWmHyHebvIYLS01hJdlaAPV5Dqxs+ZNbDWpE5pNyz+uA4EZ/5Ue9MnSqPMM?=
 =?us-ascii?Q?JWRZ0dNb+D1EIOjAnphiAMVol2jEm8Fl38UPuivXGONCCaOT3R5rab1YV/kf?=
 =?us-ascii?Q?g8CtfWKJvnQdLuRPpDxyJx1HdyAd2nuN1vhOOCznITtEoXG59EGa1i5NmZuR?=
 =?us-ascii?Q?YPk+DYYkVIXB6tty55bY9vSbjt6PACuM5UReCwzso3kg0IamtuH9eR0wkY0m?=
 =?us-ascii?Q?8JixDthYMYWt2Teesf46JsUpQD6ejaIlzT07jxVPwZZwjyGDLkbgr6xON2dP?=
 =?us-ascii?Q?n2N2efydPen4TfaxK4P0ewx7wkOjtzUUYbdeyco+SEHDmYyhDPU71eH7jNg0?=
 =?us-ascii?Q?PdZWPsSI4HzK7tUDNJLNznDAxQkeKbYfEY7dqdv0RHWqhioscpvvYex27WWa?=
 =?us-ascii?Q?2wppaMOcSE8/I+6f6Hel2nWN48rkY/2Rc7KRpyujxVo7mNGu/v3vBlFJPZv1?=
 =?us-ascii?Q?jTLRHA9M+mKOZcwXnEbJ6hV9pqStQrf/vVI+fbi2Unl1JKEGJMptXk00bJ4I?=
 =?us-ascii?Q?vfNz1yNtYOAqI6ooODozbOmS6Iifrphy11ZezDtnp1F4RaMft0yL1rj6nLiY?=
 =?us-ascii?Q?0zIZ55r+aW31bbhGLFx32ES37QjGfIzCvz2pJKhpBlTkg3Ka+HjdULSBMbey?=
 =?us-ascii?Q?6loCS2bl406nb6U3LkoPsxBRUT3qRRhFBH2IFov73rx+NI38wE8Xm/+ogWZ9?=
 =?us-ascii?Q?z/aSy0k9WK8Qgnpgk8YbYZLUyOFRGFKawmPMukKThQToegtgDhPpP+r9KXsT?=
 =?us-ascii?Q?1NRzt/NeLmb97/n00Yc6WVEEwyWxcnbk9tN2YMn/M7QkzrUrdS7YS7mxsdSk?=
 =?us-ascii?Q?YVL7gtb/EPgbwWGP8w6hvHBQ8ooNRDLlpRnF3xu3cWA9IAPCV4/x+FbSZXS9?=
 =?us-ascii?Q?m3B6gUhxep4QYri7ytzmuB5VdZZTgIyXFGG486z5c4Zl/AvA/3ShadWByBZb?=
 =?us-ascii?Q?MRBsDJFxBn1N4Ykf45ysmcq51dg3FwYyS5Yw13gXlJrnVLdneTZ1db24TIjD?=
 =?us-ascii?Q?jseDdhHuYV6NQU8DbrgWssSiJW0/kpKElAGgKKwdQINTsSFE5A4WQda+uM47?=
 =?us-ascii?Q?e+8eU+YgX7uZt+2N1AWI+XKYNhFRkf1oSy1fesufWj6S2vjlREsb/IXdpLos?=
 =?us-ascii?Q?Uj/Dv6Nst49RlDT/vY23tVaa+qfQ9WPUrxJGZvfMsTUGWYMxFeojc1vOAZ1W?=
 =?us-ascii?Q?rmsHuxJIV0izAbKBE5nzwPhwigr6CHlY/DSE3TV9Hh2KWRLqGb3FaYZMgVf1?=
 =?us-ascii?Q?vE1OMgnkG6WenSLFt9NOJb4Fz2TlCSjJlHfjX/mWbMjNH2i7pOd0Kbfy5Esp?=
 =?us-ascii?Q?1gufZWNbniit5+dDmYGTyzL/aY9SBFtzrMFTGoOiUSDPBjlmvvGoHLwfgj3m?=
 =?us-ascii?Q?h1tERgIHgy0aZY2ReNxrrbAeI0Wp53EwxXgeeoCZxrBc6/Ao1pqjZL13rLdw?=
 =?us-ascii?Q?LqM9wDmnIXk//J/sEa7DDJ+kxVxfW2dSfrN0QnJzASYqLnEKH2YqYV9tmvoP?=
 =?us-ascii?Q?wQaentM8nrg5EChzDKZFqxkCfFbM46g30vC2Ir1hH1PXIE5ij23k9T6Mh0sW?=
 =?us-ascii?Q?l1NnpCGNFGfIEY2kADcOYLdF/eIyUvRk/j2tvzahzbbSRJ6LSs6Ys0xgyVjN?=
 =?us-ascii?Q?FAqlPMiCIEpBy0PfUXz3chk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0712dfeb-4972-423f-044c-08dc65ea8db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 12:15:25.3682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pGJLfyGRAwGK3fqraYL7b1FJx0yazQM4AtwRK8e0hkWhwrfNRBWnHIiKyQBC8zbyBZ3JHY1jFIwY8hFxHeJ69FpbjqvN0cKWQAscyqF6UWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7699
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
> Sent: Friday, April 26, 2024 3:40 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: RE: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
>=20
>=20
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: 26 April 2024 15:20
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Ghimiray, Himal
> > Prasad <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
> >
> > For xe2_lpm Wa_14020756599 is applied to all steppings.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index c75946e70d84..d692eb69f231 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -697,6 +697,12 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D =
{
> >  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> > HIZ_PLANE_COMPRESSION_DIS))
> >  	},
> >
> > +	/* Xe2_LPM */
> > +	{ XE_RTP_NAME("14020756599"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2000),
>=20
>=20
> It should be MEDIA_VERSION not GRAPHICS_VERSIONS.

Typo, thanks, I will change this in next version.
=20
Tejas
>=20
>=20
> > ENGINE_CLASS(VIDEO_DECODE)),
> > +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> > HIZ_PLANE_COMPRESSION_DIS))
> > +	},
> > +
> >  	{}
> >  };
> >
> > --
> > 2.25.1

