Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8B4E9D40F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 17:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED5E10E71D;
	Wed,  4 Feb 2026 17:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCbmTP7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFE610E71E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770227795; x=1801763795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=haPfpbAR990SAK/epnMFsixXNN4D+QJDAgtUe8KlkGs=;
 b=LCbmTP7BMHjZvsEH3oGuoiEJWCN7G0IJ9+klf1NIDxSaNcdvEpCwME6S
 BMotZubuYwTYLWrmvGJH27AMvkLOXGfTJh4xegKxHf40PZi9lFo0Nquc3
 W0HushBp6VuWrBRl4B0VUQlpwSZAF+ik3f5Gu9a+nFZdYi8OJMSp02GEc
 2horEANQLttSqqA6kRJrB+UIBkeIkdVzJmur54Xqymcyh2T0o7rF33iCJ
 YM2hp9IE86Ulj/r9vB6yXD0FRx5ChxS35jM5KFxFevA1O8BtrE6s3PzSy
 4gn5bt3nXgnVeJ0AmqvVGX6XLw5Tywi4id9XCYroa8yGBbpUAoBNRymLp A==;
X-CSE-ConnectionGUID: Eo2hhyqcTWKgf2HVyka/Pw==
X-CSE-MsgGUID: M/6RJZQvTvafyVm8dlYJ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71324006"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71324006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:56:35 -0800
X-CSE-ConnectionGUID: njjYvjpmRD6LcNm6BiApZQ==
X-CSE-MsgGUID: 3gIrbLPkRjyTcOt94cspIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="233161762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:56:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 09:56:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 09:56:33 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 09:56:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh39kvtUCC8zOV0k03vySTPKv+tzb2788+mcs9UQLWkWrbplcR39XrR4AgcPZku/7i5XJ8/MBVYKEnz/moagVtwgHQwLlN7tyFBWtCnVB1lpH6qT7HitvuwKeqDHWskA6nidXfRhouoY1XZw2Ug0F04xwngZJk7/IUT/SQVahvHPjYilTBS6tTl8x5GXhnIJAA+jC+RihR10tconiuxd/iwrFVxE16Ns2ZLBV4u9Kw9a/WPITNjfYLnPlj7WsGa9Lr+4tPlKDMarmk59CSQDp+TXzBYVzdU+ynp0YnJTW3f76y3MOx0CCTHYXFKSuVYSiSfqlP813Ve3hoqunich8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYeVsdhJQahrVP5t8yE1u3izCI6kU3sMrDn+K2r0y5E=;
 b=WDebFsYyvSv7Fhv/8onad0vZmV4r11NkJ0o3UA8QMvAVuk2h34tyq5ewJDIcYkYpQidcfODk6XIjMTwKkktzlXFIwZJ8Xu+IDgxti+JWrNQsRJWSgizQtSEF3Pn3ANLG4VcUVF13WWV64FSrRBViz8N2GzBsIrSS1SCX9JFFf2AZU9jMRyoEuPj7Edj2+yNX8t0AJUqtqbar6ggZRwc59/eHGS6y8zdldYCd53o69onTNEv6o+D9conEz8rK0+mOa83K1hdcej2j89jG9JXDbXFrVVkAlqScERNNLR1+s7wN9Hbc/EPS4vOa6FgYUIZsZOyMDM9DJjjgvo/+acQKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 17:56:30 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 17:56:30 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivekanandan,
 Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/reg_sr: Fix leak on xa_store failure
Thread-Topic: [PATCH] drm/xe/reg_sr: Fix leak on xa_store failure
Thread-Index: AQHclTQdnOvpfbxDw0ieE3IHltWLarVyt6sAgAAXUACAAAKEoA==
Date: Wed, 4 Feb 2026 17:56:30 +0000
Message-ID: <DM4PR11MB545681E5CEB4B02A40A58DAFEA98A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260203173639.1399354-2-shuicheng.lin@intel.com>
 <aYNv5BDjgbOPqOJD@bvivekan-mob1>
 <20260204173546.GI2174980@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260204173546.GI2174980@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH0PR11MB8189:EE_
x-ms-office365-filtering-correlation-id: e24fa5c3-cfec-4ca9-c1f4-08de6416b9f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?BdWDqr7pLP6G3Yv74T9UG/VkYNePzU4JJMl0swN7MQEy/oLYAis5Dw+SUnlD?=
 =?us-ascii?Q?07i2hREeYP8VujiLmo/rf8Kw5jH0s9XdNzWh4nzREVlGB41WZnkGeENNSyX0?=
 =?us-ascii?Q?iWznLMEuz5YV+4zSmXDAwyP/e9adcPsSnNJTu1T2imk07/zvtU+MtNKy9VfT?=
 =?us-ascii?Q?7lkCpS9Are+Kk5/LdyWn03bMrTFGyWGtjO0WVoq+JKA+zrTp/Mp8y11K93zp?=
 =?us-ascii?Q?O/8jLgU21LGjOldw0iniQM8CfrUNNuEz40xCZ6XoPnW6wTF9rOWtsZ4nZk2+?=
 =?us-ascii?Q?Q97lc5Jo9Y/i5WieyiWgTDYFYr1HfKsQ2BkCgIMePq19FlwWu7evbASB18Fi?=
 =?us-ascii?Q?2KcmYOdhOB/imhVyVLiSexztJ/DB16n+L86a4t4FwkP4bZ4J7t8ap98jlNQt?=
 =?us-ascii?Q?2jWgz1pZQxq6SFPqe/r/5xaS6xjIBB2z6KThg3sX6pvdY596b5J1u6z87wY0?=
 =?us-ascii?Q?D0f4mmRSo98WXj/nTxG6VtqpC92u6RyG1Ku4hfU0FmYUaYdOcnNqIB6HRR9J?=
 =?us-ascii?Q?h+f/gg+PvudgfS6BSA9b/RsZdAhUNR3Le2weTPUlDTukxrB0x/q06ceTJSEE?=
 =?us-ascii?Q?BjrrBeOZ9CZe1HHB3XnnBA8LYalbTegZnQ2WkfQZVt31MUNmhvQdzKh4xGEy?=
 =?us-ascii?Q?cLLRByQmrBMK6iYR8AhWy+JEpy9eZx5RdBcpLXQ5jm+g2asKFVuUXBafAI+M?=
 =?us-ascii?Q?FGrTlYgUx625YWewTgLN/hvU1MuTxCfpOl5amFpV3tHt809oVexyGn2IZscf?=
 =?us-ascii?Q?3AhWrDwXUto40FuslA8pfuqWqds/oKDQnxrgxYQtys811tNEe/4hbrThRB4w?=
 =?us-ascii?Q?+TeEwfGa6OmPaqBpIwmsU5ArKn9WfC+aI9Nb3jGb7A+7t9rfRdOLgjN8ntzP?=
 =?us-ascii?Q?w00m0xTHTCTMoDTvrE6oHH+nbOrmgJorq2bJ9+9CjNwqgBxDJwAf/8T3lP+t?=
 =?us-ascii?Q?YyO33wyolANcfPElftHH9ztAHienFyZG2jQmQzSoBVlCurqLUoVEylGQv9SY?=
 =?us-ascii?Q?WfIT8Dg+EbPY4zCJnRSbfEyZlhaN3qVGnDchj+bVPvORCAyn/J6ciOs8iJpO?=
 =?us-ascii?Q?RhNdP0HY51EQ8ZNWVpwn4F9No+houw+BoaaldAvrhqqs4jK13xm5F/arsPe4?=
 =?us-ascii?Q?bPg269IAkovB5V8AEyhe2I/dmNNjI5ifC5/O5hC88dTl5JgtXHQrEDt8GUyy?=
 =?us-ascii?Q?UuXNm5Vfs8OTmmEaicpgnzEBAVdkYmB0jpjDR+qTRe6Syc/JTJ+rq81FVa50?=
 =?us-ascii?Q?582mNtNXO3nbjh69H8/kVvkMDB4U0+8jp6WUHAPj7uGr4S3ztdTuCz0R/1dg?=
 =?us-ascii?Q?Zg4oFdWAaCETGzYXLFii++/2r+vJPAUH2Gp+GEneFyTCaRQoIF00ayrTnw0B?=
 =?us-ascii?Q?/lpUYX6NBeDIIjB366evt8TEt7W7cEjhDkAQmkUHb3yZUaT8RLmJnP11loei?=
 =?us-ascii?Q?Se37E8rY05J5d7rccw7QnenTlkrkN4nk0LLGU0khujnrNkf/xPfRhGrr2HXx?=
 =?us-ascii?Q?8ah9PgfdFK2l5ahiDKNBS4cgg/DNYObMW3yEpkUIhqMUK+WA+t5S/bxrx6vf?=
 =?us-ascii?Q?MPBJFXGHhNpwvvZQGVQLjpupF5E7bnJ+PlWC17dbhVnFCLI6G51MZQAJ5I0s?=
 =?us-ascii?Q?g2u4WFB1jJvig8H/IiqnJ84=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7wfkt/X02yH7MXX1yB9WZvXcFu6XTPgQFpf26JnBQMBJhD0yrteuOMX9e/TY?=
 =?us-ascii?Q?97kaXrzMl/mhexscs5cyN0gCAni5OaTd2gCSgCYIqYccxWYJ8aqrGE7Bc4Dz?=
 =?us-ascii?Q?Q6PIAekisYZDZnwnq4z0j/yJKE7o6djurcDRljd5mtBM178Ya8F4IRmUILLu?=
 =?us-ascii?Q?GHkN/eHAFa47VQSLiVu+8IVTjJ8FPbOz4Wk4jWIF5ZSYybZclStEGjO7rXMR?=
 =?us-ascii?Q?Z7cU5YVfpe1CDCcfiFkQBuhAQVe/YVnXfTr+mtV8OjVc5uVcgpw39e+tJY2I?=
 =?us-ascii?Q?B4dfjD7zFGEnq32Xqta5+y10tKHmOYJ7hS/wJrLPiQginc09BA7DpoowyToy?=
 =?us-ascii?Q?ke2SVlRwu0MYlpV8rYNC2yH+nLjmT5ahD+JyqE18PttdaEHDX4onVapkCBAT?=
 =?us-ascii?Q?FXUNhJbAw6SpymfnulVfDZifnvBbCINBnC31RudwoqBgnCbCfsd0TAt8qvG7?=
 =?us-ascii?Q?rS0oPVzUSyMwRVwvpDJrmUu5OBLzHofbx6MMX2YA55Jc2MOBShwWQGBSdU+2?=
 =?us-ascii?Q?ncIpT6aLsxYKb+gzRHuKVYZqGveO4cm+1yp88K2WHDL5VCZ7XXlERN+if0Ws?=
 =?us-ascii?Q?3Vg0IAe6s+2G7ClkovR5CBJT5Ck2B8bakaum5iIwspdK8tYHl78wWCs6j/Or?=
 =?us-ascii?Q?7nrQUXAv4Gq1KbANviIxibpAGFvOpvJlyn/5cS9Viy8CETi5TG/zjrOn28ZM?=
 =?us-ascii?Q?SsTBomVU6SJAepRCRVsG6cWzbfb3LBpZsbU8/8Gbv0R4KTI0TzonqoU8TO7K?=
 =?us-ascii?Q?spbzWsemxxRMkjTMZYry4Sqe/Ie742cLa49gJubxkhzBReqFUTujSN1OkAb2?=
 =?us-ascii?Q?3VmIKa4D5QNns8+FpNO/Bcytzft80RaZpxuS6GoWpuYRf3k8jBsEGDfd9GWr?=
 =?us-ascii?Q?X+6mfQLHiPfo2lTvOaqkrerdjo2NVO58o/9/NMoxSdHjzd40UXl1mGMvwDgz?=
 =?us-ascii?Q?OTTrsJg6KEgGBXqEBSNQ7aMUWbwmCk5N5jNiusRmc5+s8dSEyetKT2Z1T9Ll?=
 =?us-ascii?Q?PrLIp3UisYcwwL1TUMvygJCs1porFaEVEaKonkDTWyCeIUI0KQ/B/CQFcga8?=
 =?us-ascii?Q?1JL/S5s+L6guf5mVFOF+nHzeV7xYF3nY5BrlsUAFLwP33AoAKfsFEGsXMUeR?=
 =?us-ascii?Q?IHurtGmi70LIyGID6QdbDJE6nkzwgoI3ubXb/moLoNcUEyAtwybk29ju3o5j?=
 =?us-ascii?Q?Es9894OgQdqG55Ss5Y8CH0UhqoiTZJKfaMRKa2zfx9ySGa0qWBQn0DsaQaZJ?=
 =?us-ascii?Q?ESAVj3febl62g6NMIYF3OZSZIFNlOE0fJDPKDP5L6uVNtGFL5oHJ/f9yIkq2?=
 =?us-ascii?Q?DNm3wSCMLg9FPCv+rnAyvmJPO3GKuyS9MoU7l2acWrZnXljwIZQjM7VHHwdU?=
 =?us-ascii?Q?a+0CePPBSPLMCOGF0M/iUfCKHgoujamaapFbE9scBl2SDfTpAOBYTDwqZFpP?=
 =?us-ascii?Q?GcjdUakPJolf4C4sg5DHK2gLccg8DcliOfyuUWtYDA7mdGk+yNBJF4XBvhST?=
 =?us-ascii?Q?48Evi3fhxorwyjmcA2Vcl2y3+SEaYYhII6Z+1I9utE9VMbXasuQNunfzXqC/?=
 =?us-ascii?Q?RsRslvt9rM1JMVLuiclTjYts0/Xvw2C+5ftPGTUSMW6fyFMrXbcnILAqGNLh?=
 =?us-ascii?Q?bBY95JQ9t0wkhwrMoSeKgWOKtFlL09EqAruJJu+j6ZWap+RGgiNurZDYKMXG?=
 =?us-ascii?Q?UWJ08iVeoOPprcgIL3iABbnSbkkf1QXZr4c4OV4tklvLjsUMN51P9FNDAYrP?=
 =?us-ascii?Q?f005PXT+oA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24fa5c3-cfec-4ca9-c1f4-08de6416b9f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 17:56:30.4450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKIrCy6mMImzz5jGS7WJK7b4DcM9l5GO6QrkI6iTvuT0u2PjUHYFY4UKDR41heHskbeaR5/1Fisikx+BcvSUHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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

On Wed, Feb 4, 2026 9:36 AM Matt Roper wrote:
> On Wed, Feb 04, 2026 at 09:42:20PM +0530, Vivekanandan, Balasubramani
> wrote:
> > On 03.02.2026 17:36, Shuicheng Lin wrote:
> > > Free the newly allocated entry when xa_store() fails to avoid a
> > > memory leak on the error path.
> > >
> > > Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_reg_sr.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > b/drivers/gpu/drm/xe/xe_reg_sr.c index d3e13ea33123..ce3dab8a0f47
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > > @@ -74,6 +74,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,  {
> > >  	unsigned long idx =3D e->reg.addr;
> > >  	struct xe_reg_sr_entry *pentry =3D xa_load(&sr->xa, idx);
> > > +	bool allocated =3D false;
> > >  	int ret;
> > >
> > >  	if (pentry) {
> > > @@ -94,6 +95,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> > >  		ret =3D -ENOMEM;
> > >  		goto fail;
> > >  	}
> > > +	allocated =3D true;
> > >
> > >  	*pentry =3D *e;
> > >  	ret =3D xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL)); @@
> > > -103,6 +105,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> > >  	return 0;
> > >
> >
> > I would suggest create a new label above *fail:* which does kfree and
> > jump to it whenever pentry has to freed.
> >
> > fail_free:
> > 	kfree(pentry);
>=20
> I agree that using a separate label for the free is the more common idiom=
 in
> our driver so we should probably do that for consistency.
>=20
> Another option would be DEFINE_FREE + no_free_ptr for automatic scope-
> based cleanup, although I'm not sure it's worth it do do for just this on=
e
> function; we may want to explore that later as a broader cleanup of large
> sections of the driver, similar to what we did with force_wake and runtim=
e_pm
> a while back.

Do you mean __free(kfree)? I did consider it also. And I really like this a=
uto cleanup idea.
But it may not work in this case for below 2 reasons:
1. pentry is an input parameter, not a local parameter, and is allocated wh=
en the input is NULL.
2. pentry is freed only in failure path, for pass path, it is stored and wi=
ll be freed later.

Shuicheng=20

>=20
>=20
> Matt
>=20
> >
> >
> > Regards,
> > Bala
> >
> > >  fail:
> > > +	if (allocated)
> > > +		kfree(pentry);
> > >  	xe_gt_err(gt,
> > >  		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
> masked: %s, mcr: %s): ret=3D%d\n",
> > >  		  idx, e->clr_bits, e->set_bits,
> > > --
> > > 2.50.1
> > >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
