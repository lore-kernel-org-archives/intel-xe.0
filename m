Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F05FD29FB2
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F6010E9BC;
	Thu,  4 Dec 2025 20:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+1GwXmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7439E10E9CC
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764878560; x=1796414560;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TchHqeBi1hSzWICzHRy4I6vrHM8ZwgIMGpxjKArLE20=;
 b=n+1GwXmVJR11HEvpOibltYyZuKquF081eFfHmMxRktVB8EEs1+qmbIXH
 6yCN3DK8vp3Xm/mPqtFfVgb+HzBc0dAElxiPQ7IaiYgnqFi1/O2Bs6VRZ
 0IDaDI4fQ/DKSfqSP8XyI1vFs9RgvpyvmoFsz2GzCk1IuKTvvN3WC5UHw
 kaLCfqi02uTgDaGAOmJIYY1c9LM2pTpmgctpQLNJGk69V1OFLQFlTEgu/
 RrJaYp0AEcwmQaU3eUuFFHEcPS9s+2GaV2DNiP0xX4ltHfWw5532b1RSC
 5rD7rjkeffwE6ulZbaWHdwvXsi2rrmcbI6TqrSyFtXENPegAVk339w448 w==;
X-CSE-ConnectionGUID: JJ6lXV9rSpeU6S7DHQAPXw==
X-CSE-MsgGUID: sHq4YuDtScmThI8RMMbWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84313679"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="84313679"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:02:25 -0800
X-CSE-ConnectionGUID: +TzUuaTiRW2FNJGR4f2lPg==
X-CSE-MsgGUID: 0QcHLG8rS8W0TX0GZe2sLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="225742823"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:02:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:02:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:02:24 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:02:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If0JPaudk2XyzorISKG4ikcQPZLvC5uYUoN+kYHO9xzd3mQSxQxVxJQRI0zyBxZ+ftBVuCgzjTXhAXh56ofFbhANkCkjQv9K2y86t2lQKUxQRvowrHJgn3aPMtuVVVVqcPx531qYNufLpq1z42/MGGAnH5ha33MigbZ8CCFitJi9gWFJz7hu0ZOrekFQEjhQwUvJ9UHl32PL/18lqnTBrc1HrtPraBqGj1Js43ufuhU7ZxIRayDgb9dHj3Mi+Ew+4Qn8cTJGZUOj5WeO9S64b8J4GWh75Z+Fg+eJ5gX5FqW6lJV6OCApwLnLamLZmtiHh1GS3oIvEYPxXE9OEG2Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps5A68/WiopdTpbwtu8uPu1rhqsJZzrXvrYlPGJmsxc=;
 b=JWJsNRZz9fp2EecctynORpHujMJs3Q7WFcp6eM6a3AVcRo+77O+OsXcSiHqKxLIjWXLA7Py1C26+FhqiNb5qcOoaazljAz0dVrP587vi+RPyLOBz5IE5CUiCo6rYJ2/iIkTzcA/inS8ftgoSvpQ/OtBM1G7FK9hGE/tqwqbDnKjMQgEUr7Nc0WiwdkEoQEBIgC13CE4RXE1KRH2mJ2hIkik36K3XsASTKSbz1D/8EoCGEv6ucfbEltESpkp2kVzxF085xP86I8O2hb5fFwZ7hIX1SfWpauElB4VgQoRPPCAZcdBX0H8GSslBtgGqg7UT/KT2jAU+1DNp+R8y8jTaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA3PR11MB9112.namprd11.prod.outlook.com (2603:10b6:208:575::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 20:02:20 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 20:02:19 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcXyjJG7EwvMuSJ062FpUI1FjWxLUQlpUAgAACXKCAACEagIAAMhsQgADmpICAABiGEA==
Date: Thu, 4 Dec 2025 20:02:19 +0000
Message-ID: <SA1PR11MB88392F9BD7112658CB358A1EAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aTDh3/SkCvIgj3yg@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839764A5C743C00807BE25AAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aTHNYbsoSJV/hNdx@lstrano-desk.jf.intel.com>
In-Reply-To: <aTHNYbsoSJV/hNdx@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|IA3PR11MB9112:EE_
x-ms-office365-filtering-correlation-id: 0e5acc01-b905-4300-e838-08de33700823
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?c6mVTewdobLEplS4l+BIGIuR3WM8AUG2XCbO7mDjbLKUfysVWETRnNetreti?=
 =?us-ascii?Q?LxYTb3KgjX3K6OXyR/SzhgLjci3r2qnvx4LO4dZ4pHNJUriJd1lqEPYvb5Gc?=
 =?us-ascii?Q?kc8+1PGnb54jMrmVLPow0ji9xnsow2iDWoe0oeergjbPSLRa9LH5IrFP+XAC?=
 =?us-ascii?Q?K38qBuNHHJ+dRklFMmE+zzkViexbMbXgjKc7sCKoc3WD7MBmnKmHR3Bv3Fb3?=
 =?us-ascii?Q?rrPJqk8CxDOS8sbrtcdYjw/7hnAnoC9b7pIJm+4xglLh6Q02+cnXin4vqsNs?=
 =?us-ascii?Q?o3aMyD/Su9OvNjqT67GnIn5cz218lz3CJyqxVFbpRMdkV/WMZFoK6SAhiX1T?=
 =?us-ascii?Q?GeHNJ2UEeZPf+auLvM/Z3YZVqssTHJOvxh5euZgxaE1Rd0vmWAu3imcdkN2n?=
 =?us-ascii?Q?6aV+Hgzu7Wuktm7Vy0JPqRUmKzTnkjpajL6AtKtNo8VMeXPyxe4/SLId3tDD?=
 =?us-ascii?Q?uKWwnNruS75kbpWfb/fKSIJWv2vSsBHX//h3OPQbt0qXdepkjzRA978rnjXE?=
 =?us-ascii?Q?NKTib7cNti4n0xFrd3uMh0CbjmfYna3uYBhqa+evXg0ilJfnjKeaFlx6d0PJ?=
 =?us-ascii?Q?v0H5zTKEZ6l1eErQ2inci27XyxfOdPNlRu7Jh6b+McF4X1VymBSV3FFfSNH2?=
 =?us-ascii?Q?CnJtauNF/QreW6fYxMRhpoZTfwNfJU9nCmDrVQA6eBVlg33fRHkV2V48AmKp?=
 =?us-ascii?Q?jYDnEACnOm3UKX1pSAwZKJHuu8xFaorJB6rp2Wmm3iUPEO8QglWpmvqQwNwT?=
 =?us-ascii?Q?x941cQJ4OEqrBb6rOzklYYq8q0Wxg2N5nzzAGTjO1uKGaEuu6JsopQLytAOj?=
 =?us-ascii?Q?OhbZPW0FcvtKuGYtP9CHhKCtXr2EDXIsJQefN9yPrnixRTcfAIIKMYjSGVnn?=
 =?us-ascii?Q?LpuehLD2Af+FBgaeo5CgI8QS9fWdCgDlZKmDUGIkC7oWwSYdfNZCHv34zFXl?=
 =?us-ascii?Q?h0cVJuUzi6kXH1aUJh+F7PJgf9TJ2NJGW0xSNoFXmPMrESfQMH4bJXk3HSMz?=
 =?us-ascii?Q?PeJWllXjbe6/NV0ZxirrWmq1G3TJdkqpdpyN69vMtGEZXxsdn0IBD5ltlePI?=
 =?us-ascii?Q?xns17NJEQ6LTkFe/vT9NgltWlzG2P3OvfXLgjHgAJ6i2dl4+hICDoHVBmIou?=
 =?us-ascii?Q?LQ4F+v0ae9tLp7/yQDzHurfro3BM6e1Dgt6RuKGC7H19l9jVsZyxFlMwOBJO?=
 =?us-ascii?Q?erwS+Bwp+VufQBx8u3SZRm5pCY2isNV6PuVvtwiuci3tjzE4m0JHHnn6wror?=
 =?us-ascii?Q?4epNzMCi1VtA72q1vTEMF80dICY8divdGEaO5JczfMv7+kyYHpew4xowomYj?=
 =?us-ascii?Q?dFZsHlRe6c8q7+EjdLzfhZaNus3ke9s6RlkWSHa5fgF6GbsBjREPEJtOPGaq?=
 =?us-ascii?Q?fLP6jg3jH5AZQaAwEEvpXnks1Q8CkBBDBRTBb+G7RONhLJJso7BMh0xCpQJZ?=
 =?us-ascii?Q?aJxcNfUQQPyQt+h3jYetIYSz65/L7uIEhIFwviCVHGYvfhKub8a7sT5xLkje?=
 =?us-ascii?Q?GgSRG9rtFsAeASL/MWveyfWrCe+Wd+ezdns9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XlQKJH/J22uojuA3kcA67I7Jsetk81LrtgdXjrEZgMTZ9KGzgXD3tbI+MFYF?=
 =?us-ascii?Q?kWPjBFhAnvqkeH56EMAN123+KTrSem5j/DmoVQd/SB1aaaVCu+Ml/YzSwxYG?=
 =?us-ascii?Q?KucScs9ZJJ5nMCTanaLh5IFW3q7hi2atydVt0vr05iJwkigRhfvzKCFujp0A?=
 =?us-ascii?Q?ol7Ly+jduMMyqEGRhpHRdKHDtbTjVBSwj2xFsw8R1l5N4CISiXoclTb845B6?=
 =?us-ascii?Q?z5u4ioA5ZVbPS34B9L/YVEi7KI6EMfkUI48G8WRRMGKMOcYplc+BG7ytRCQQ?=
 =?us-ascii?Q?eM5H8i7wnBSIqAgK2XlXBaKqBEuj1lpFaue1VvlNoa9P9ITiagFCWhSV459R?=
 =?us-ascii?Q?OgrUMkpJftAkgASCrqyNLZfFgfQGZ+mxYNCqLDmpBpycI65fe5GMmZogKYgO?=
 =?us-ascii?Q?PkKOFXNZJYP1rIIeNBj2llCxG3GZ/C8dFFWCPhoogjl8G7lGroT7Pmx5/9Rt?=
 =?us-ascii?Q?GNuXTEmoj7dWqhDvJtfKr0Bco01NtawFMGtkZXMT8e0kC3OBH1egw8R+hHRq?=
 =?us-ascii?Q?R2zyNvPlGbiDsjew7in1NuLFEMEvX3WUlTa38fvSnlt43JXFMTzCSFDYOvbc?=
 =?us-ascii?Q?ObQ6eXESNixpVQEv+0SmdWEcTDuEaGIC8OxCXlJOoLyLmXo0VXFRthjMWzcN?=
 =?us-ascii?Q?SH3i2ImKWx7TOvI7g7HKUhXl1JAryF8NawM/ypkeo+xpCGxmZnSmW5Dcpwo7?=
 =?us-ascii?Q?6LFQ+1U+HAAaQSZ7niGmfh3icFCGbr+wqUz+jL+JBXZTbmEfMUcxdIS6GgkE?=
 =?us-ascii?Q?53TmXb7PP5UU+OckAERfKFxs1DY4veJh2lQYkiJpa7zlk3trfj9KnwZvhWNj?=
 =?us-ascii?Q?85ZRqTGrUnqONLWWOLL4y5iujpLfBErOQt22m3W0F5lCkOiCF7Ef6rXmdusz?=
 =?us-ascii?Q?DmJmeS/BYns1TyDtF57lAq/Uc9UUQJKkvqj0FWGyqjAj0ZyaRxRIYauvdYyI?=
 =?us-ascii?Q?BK4vW/M2pkk7ykwQ/30VJy1T/LRQkBDRVkL8BXd+V5ZOvutf4Mt2Hb2Fo87o?=
 =?us-ascii?Q?GVDZGs9grKCO6hQECcbOKioKCfLfZZXsPe87b+ii1lbxhhPNc7xxPm1WUgPN?=
 =?us-ascii?Q?w+EjLblvPl1CuqxqG8XDF+OIH2YA4vJh9GQ6iDhGVa/fEZKMywF1VwB+bnYN?=
 =?us-ascii?Q?w+BzMGXdzZzVMlWsg8xGZ3AaePaL6sWLBSBpk/o7fYgv5kgoRqNyJi9co3Gb?=
 =?us-ascii?Q?wP7rcPu3zQAMYaAnjZY+UBxx4UhkLB31LhF1RX4JKOUxEGzBVrOhGxrWUyFR?=
 =?us-ascii?Q?AzgzPUTXIJYN4ynIO97Yaki5kV2QpKTF+CBdICYS/QFjdEfwQt6knfAZ93T5?=
 =?us-ascii?Q?Wt86fIGulWoGXlOHgZUDSl+KaTvKllzjEJiKzN9ksHM8QMaBJqQxrDksUsUE?=
 =?us-ascii?Q?cgGyQ4k94fyEGAfCX0nWYCG6f5HhTqagj4Jyq/jeFnd7nbq7ahkt1n5+rD8y?=
 =?us-ascii?Q?yDK/hmqXKkaTdXojVEjoeLg2CbshvFukTfRYrZllEPZZ9qoDLx2ozh5EvB9e?=
 =?us-ascii?Q?fQOcclH1CKjkHAPEs8DyYgXoPnFpFpRCkOe+wm7cSZ0E3WHDd9Juuohci+i2?=
 =?us-ascii?Q?K2rXHDoQ0eUBJ9I+dYgK6L9C3LtwvBcj89yTFx+W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5acc01-b905-4300-e838-08de33700823
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 20:02:19.8751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P56HodH4BdknVCT5TUA2UCjYSEQWDW8ZfgHgUjzdvjSJoaVIqHgZTpLu1LEoGXptQc1Q4Zdd2pKz6Z5eg1UrsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9112
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

On Thursday, December 4, 2025 10:05 AM, Matthew Brost wrote:
> On Wed, Dec 03, 2025 at 10:42:00PM -0700, Nguyen, Brian3 wrote:
> > On Wednesday, December 3, 2025 5:21 PM, Matthew Brost wrote:
> > > On Wed, Dec 03, 2025 at 05:22:10PM -0700, Nguyen, Brian3 wrote:
> > > > On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> > > > > On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > > > > > Use page reclaim list as indicator if page reclaim action is
> > > > > > desired and pass it to tlb inval fence to handle.
> > > > > >
> > > > > > Job will need to maintain its own embedded copy to ensure
> > > > > > lifetime of PRL exist until job has run.
> > > > > >
> > > > > > v2:
> > > > > >  - Use xe variant of WARN_ON (Michal)
> > > > > >
> > > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> > > > > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26
> > > > > > ++++++++++++++++++++++++++ drivers/gpu/drm/xe/xe_tlb_inval_job
> > > > > > ++++++++++++++++++++++++++ .h |
> > > > > > 4 ++++
> > > > > >  3 files changed, 36 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > b/drivers/gpu/drm/xe/xe_pt.c index 347b111dc097..833d6762dd8d
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *til=
e, struct xe_vma_ops *vops)
> > > > > >  			goto kill_vm_tile1;
> > > > > >  		}
> > > > > >  		update.ijob =3D ijob;
> > > > > > +		if (pt_update_ops->prl.num_entries !=3D XE_PAGE_RECLAIM_INVA=
LID_LIST) {
> > > > > > +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl=
);
> > > > > > +			/* Release ref from alloc, job will now handle it */
> > > > > > +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > +			pt_update_ops->prl.entries =3D NULL;
> > > > > > +		}
> > > > >
> > > > > Do we not need to do this on the media-GT? Or is issuing PRL a si=
ngle GuC sufficient?
> > > > >
> > > > > Everything else looks good.
> > > > >
> > > >
> > > > It should be sufficient per tile. KMD will request GuC FW per tile
> > > > and afterwards GuC FW will issue Page Reclamation to all the primar=
y XeTLBs, for GT and media within the tile.
> > > >
> > > > However, I realize that this means we should be disabling PPC
> > > > flush for media TLB invalidation otherwise, it will conflict and
> > > > do a PPC flush anyway. Will have to rework some of the logic to han=
dle this if so... Taking another look at this.
> > >
> > > Yes, that's a good catch and would've missed this part. Now I'm
> > > wondering if on upstream devices if flushing the PPC cache on both pr=
imary GT and media GT is really neeeded. If not, this might be
> small perf win.
> > >
> >
> > I asked Nekkalapu, Satyanarayana for HW perspective confirmation.
> > Media doesn't have any PPC to speak of, so, it looks like PPC flush
> > bit for media translate to a NOP so we wouldn't be getting any perf her=
e on upstream, maybe skipping a handshake at most.
> >
> > So, regardless of PPC bit enabled or disabled for media, it shouldn't i=
nterfere with the primary GT caches.
> >
> > Therefore, I will plan to keep this logic the same for simplicity unles=
s you suggest otherwise.
> >
>=20
> Can you just add a comment around why we only add the PRL to the primary =
GT? To naive reader of the code it immediately looks like a
> bug that PRL is only attached to the primary GT.
>=20

Got it. Will add in next patchset:
"Only add page reclaim for the primary GT, GuC FW will propagate Page Recla=
mation Descriptor to all primary XeTLB."

Will also add some comments near the MAKE_INVAL_OP_FLUSH discussing media s=
kip append patch.

Brian

> Matt
>=20
> > Brian
> >
> > > Matt
> > >
> > > >
> > > > Brian
> > > >
> > > > > Matt
> > > > >
> > > > > >
> > > > > >  		if (tile->media_gt) {
> > > > > >  			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt); diff
> > > > > > --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > > index dbd3171fff12..2185f42b9644 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > > @@ -7,7 +7,9 @@
> > > > > >  #include "xe_dep_job_types.h"
> > > > > >  #include "xe_dep_scheduler.h"
> > > > > >  #include "xe_exec_queue.h"
> > > > > > +#include "xe_gt_printk.h"
> > > > > >  #include "xe_gt_types.h"
> > > > > > +#include "xe_page_reclaim.h"
> > > > > >  #include "xe_tlb_inval.h"
> > > > > >  #include "xe_tlb_inval_job.h"
> > > > > >  #include "xe_migrate.h"
> > > > > > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queu=
e *q, struct xe_tlb_inval *tlb_inval,
> > > > > >  	job->start =3D start;
> > > > > >  	job->end =3D end;
> > > > > >  	job->fence_armed =3D false;
> > > > > > +	xe_page_reclaim_list_init(&job->prl);
> > > > > >  	job->dep.ops =3D &dep_job_ops;
> > > > > >  	job->type =3D type;
> > > > > >  	kref_init(&job->refcount);
> > > > > > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_que=
ue *q, struct xe_tlb_inval *tlb_inval,
> > > > > >  	return ERR_PTR(err);
> > > > > >  }
> > > > > >
> > > > > > +/**
> > > > > > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB
> > > > > > +job
> > > > > > + * @job: TLB invalidation job that may trigger reclamation
> > > > > > + * @prl: Page reclaim list populated during unbind
> > > > > > + *
> > > > > > + * Copies @prl into the job and takes an extra reference to
> > > > > > +the entry page so
> > > > > > + * ownership can transfer to the TLB fence when the job is pus=
hed.
> > > > > > + */
> > > > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job=
 *job,
> > > > > > +				       struct xe_page_reclaim_list *prl) {
> > > > > > +	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> > > > > > +
> > > > > > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assis=
t);
> > > > > > +	job->prl =3D *prl;
> > > > > > +	/* Pair with put after bo creation */
> > > > > > +	xe_page_reclaim_entries_get(job->prl.entries);
> > > > > > +}
> > > > > > +
> > > > > >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> > > > > >  	struct xe_tlb_inval_job *job =3D container_of(ref,
> > > > > > typeof(*job), @@
> > > > > > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct k=
ref *ref)
> > > > > >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> > > > > >  	struct xe_vm *vm =3D job->vm;
> > > > > >
> > > > > > +	/* BO creation retains a copy (if used), so no longer needed =
*/
> > > > > > +	if (job->prl.entries)
> > > > > > +		xe_page_reclaim_entries_put(job->prl.entries);
> > > > > > +
> > > > > >  	if (!job->fence_armed)
> > > > > >  		kfree(ifence);
> > > > > >  	else
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > > index 4d6df1a6c6ca..03d6e21cd611 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > > @@ -12,6 +12,7 @@ struct dma_fence;  struct xe_dep_scheduler;
> > > > > > struct xe_exec_queue;  struct xe_migrate;
> > > > > > +struct xe_page_reclaim_list;
> > > > > >  struct xe_tlb_inval;
> > > > > >  struct xe_tlb_inval_job;
> > > > > >  struct xe_vm;
> > > > > > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue =
*q, struct xe_tlb_inval *tlb_inval,
> > > > > >  			struct xe_dep_scheduler *dep_scheduler,
> > > > > >  			struct xe_vm *vm, u64 start, u64 end, int type);
> > > > > >
> > > > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job=
 *job,
> > > > > > +				       struct xe_page_reclaim_list *prl);
> > > > > > +
> > > > > >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> > > > > >
> > > > > >  struct dma_fence *xe_tlb_inval_job_push(struct
> > > > > > xe_tlb_inval_job *job,
> > > > > > --
> > > > > > 2.52.0
> > > > > >
