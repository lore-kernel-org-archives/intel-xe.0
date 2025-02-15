Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9868C021A0
	for <intel-xe@archiver.kernel.org>; Sat, 15 Feb 2025 05:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FE310E154;
	Sat, 15 Feb 2025 05:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mt/atvPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1991B10E154
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Feb 2025 05:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739596002; x=1771132002;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GiDeWzo4XCE7o+h1wg4D1cryzlb+V15k3eJnftahakw=;
 b=Mt/atvPzCLDWGA+TdX/lf2ZZvEy5Pu171BKMbtCsPgHMo5Z1aPXI2jcf
 iaHzPtt6JsujVzqvjeHjcVmzgPf3xVroBCNyg5XkY4c5z1gysuMN7mlWT
 1HMs3wXrpt1D0jt3htriGd6BT/Yw+9WNMbyko3EzeE9AIo6TxhfCimwqu
 Is8RoWY6BDi5KjpbgsPvR7toV43goyNXmKOwtsTt17X+wkE7NxhjlIr7I
 ljmY4rbQ15KtGzA0Jghbz2on0C8797wzLBMYxJ5/dRREpYsOwYKkWcdOc
 EMRsXJTheHVqkWZtq7JllyYZSOn0BS3YDr4ajPhyNywuxaT7lVD+8/5lM Q==;
X-CSE-ConnectionGUID: Fg5PX3AYRY+IAY9MkMKkTQ==
X-CSE-MsgGUID: n7cTK5+fSziPEqF/IuSarQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43184214"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="43184214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 21:06:42 -0800
X-CSE-ConnectionGUID: vdlf6NbkS1ijjZN0HjlZfg==
X-CSE-MsgGUID: pFRdQulZR0CQyOrZ6w599Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113597188"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 21:06:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Feb 2025 21:06:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 21:06:41 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 21:06:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6L/sv9KeqiyG/xdfs8e+44M2balCayeVhGMy6+vnCA7kQ69yv2uawhESco6hvXMRcK5V0ayvMGARpZNS+GEAafpk5D3HDg+Ttxx5hbM7dSidMEZUymOL3XQIrELsAhOZxyCwwGhvZNllpmt8LuBM9Z0b4B6anoE9pBa7yyn8fnAQBXKHbqZ5TnqLdOFK1b/00rrJ7TcGNEMKNdvfidS7OowQT3Cw6u8bZqqgZFMXM+/xI/Ff3jeNZP4KS8+bhHJHjculL5c6FxOtVHiGRc9008WUFj6i7FDGsVNNdO1i31kZcmHOovznv8MOvWBvWxMrKLAp9Axr5aeZlEkqOzLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMAA9IWO81qTyZoUA52QiRmuDy9G07vINnRC3yEccDg=;
 b=CH7i+lMApgXho96fpR9Muc9im0hYFSVk7lcKFmEQq9MmOwLAEaWNJNBsFTi7qJAl3zkJjnJKJ2Z0FIkNPcv3e3gthfnFpsUZgJ8wtP18lyWMxN0+QPly0joRoOJ4PmjF1Kpp2+a76JQMmM1fMe6ImtWD7TuGYNeDUD+BydGZmemkA/hkoZOYqOlBTKdwDRKrbgHkHDzloGHoIhy58a29DuakWhb9A9U8qQULHDXNtTbB+myTLZQuFIfz9VA9swtMtoddJXhsWs648L840tybHlmXzfWW4i9VEEEtx78FGygdpSgKgzOLFIOAtMxEP/e1mhRfo+bKIdTwoQaTse5ESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sat, 15 Feb
 2025 05:06:38 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8445.016; Sat, 15 Feb 2025
 05:06:38 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Thread-Topic: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Thread-Index: AQHbfTEH7nHxaA97u0OwrpMd+mAzkbNGmKIAgAE7ZMA=
Date: Sat, 15 Feb 2025 05:06:37 +0000
Message-ID: <CH3PR11MB8434102DFC2FE2F8E89B717D8DF92@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
 <LV3PR11MB8695DFAC65F77AAA7A2E88DCF9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
In-Reply-To: <LV3PR11MB8695DFAC65F77AAA7A2E88DCF9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB7514:EE_
x-ms-office365-filtering-correlation-id: c62a2e83-840b-4f17-e180-08dd4d7e86dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DwBSIXqgQDHikpxSODQ6x9/p7hazaaIW2GTOJ77V41Hqz1KbN8R7tZoZ8BvO?=
 =?us-ascii?Q?CFPVybok1cKjBEIen4fjKendIKLYmogadzfxgR7JUvFwcRhpz80mnjXvvhgU?=
 =?us-ascii?Q?bnFmzQa6JgP+0Lu+2n4gFrYN+opYIhKVxHe7Clgbn67IdYUjgMx3rhedr5eI?=
 =?us-ascii?Q?NjFK0XtvivqUNo1uR9sFsqg/Dv+ulL5wYARquBh8n0jYjQs/lgjhpHMrDdC1?=
 =?us-ascii?Q?QQRqmncW9iesqhc8ipGB/WPo00h9Co1ZaGvzwy3wXxEzl1TFugU6IAsHJ7nD?=
 =?us-ascii?Q?ZwIew1OLee88X2ZmT6X+izel5fVlx03Kh5spplhBS1Bo2bNH2v6Bvnjuua6i?=
 =?us-ascii?Q?FdnSCNZbCoyux4D2n7P9xVOy+WGvF3a/+uk62moXnkeYqtI4NmuWHHBHWb30?=
 =?us-ascii?Q?gKuoPDJEoqOEkKyHEHraPh0NnxwGKRk5zMy7CVmbhJfzumGuCxQFwqKGMpwL?=
 =?us-ascii?Q?B91JiTZi0wZK9L2/1ka0Dovv8Gw+a5g+4/0VPV+oWwwnCV1LC+DyRFdAYR/+?=
 =?us-ascii?Q?F/5ncr07MK+GOAK2ivQOIKbWgtZvWWqXC0jbUVdwK37SCI3B8tkbrNKBrS52?=
 =?us-ascii?Q?Dz4Hugs5HrhoB16cFdg6g02nfd17jKjcUxP6fmig7mja2RQrroqyyydF0Cgx?=
 =?us-ascii?Q?d6NKPDdeVJWkf0hpP3AWDqzbGQzWUCiM9YsRyBwKTu4pRu/oFLkwnnGWmjmi?=
 =?us-ascii?Q?TpFEOqv+RuLn+Cwvedbh73doHGDsgPR0Yp4mPham7GR1wIey3VaLUZNMBMPP?=
 =?us-ascii?Q?UOgJ0qNDdmbuy5hcUFWqS3EBzRZEYAZzq3EHFLkf371Pb9Yulx8tYiO9QybW?=
 =?us-ascii?Q?e4PQa/SASZWfypnpe3CSuSPCKS/UJqY6pMaaOlnGgWSJwpunaftW/BcUCZ6W?=
 =?us-ascii?Q?BUOk2uzs3HxuzfVMSTrGAHMzzSH5J39wbu4WCd2+Ly9es0vFZHQWmXIr1hdV?=
 =?us-ascii?Q?iDEpBt1w5VjRXc2iFBCfgDlSCzxkVrz+niVvxYyVCzbqngtMxLS1bgFeTP5J?=
 =?us-ascii?Q?+5vG4w4jDs+AmJxac1Y4h39Qj1amr+WIJMyOf0VUrmX7kvp/aBRAs6OcdaGZ?=
 =?us-ascii?Q?7MC0InoHCjTcNuNF8Bz6Is6JmzLWFkjTC10J1hg+Ll5KMAftaOvFkSDP+4gF?=
 =?us-ascii?Q?3u5BrgWsbOploBKV+C9mMqR6VvFGbw3Nte7pt+7sdG7cf9G7jjsAT/QEZe4P?=
 =?us-ascii?Q?L5WbEU4Nw3yxp5VUuuCScnlEqBIRBSGdobXH8T1RteONB/CqQD9hTSUEM86S?=
 =?us-ascii?Q?hBtGbqgQ3s/hKgQz1n/LuZ0isvcrUGSlgSYhDvxTKucXGQzNmd4X92kgegmW?=
 =?us-ascii?Q?Zyr7Im5QgTY2Kesa6E9apqrDueS42xHrG00dUutecqjuzyCAmk3ZXIvgfFcd?=
 =?us-ascii?Q?E5jxH31chLLswJRyomuBwTlbFqR0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lhA7PavDOOdXpK1Aw4KQPKsTHeCsU4MIYoY1xs1oe9tzREdBbIFJhcJUr1nX?=
 =?us-ascii?Q?+I3CmVhoF/469PYZhqEXofQYODq1cX9OBOrGK0PMKp1WWkF60xFaxFDTZW4q?=
 =?us-ascii?Q?HPSXJAb33cL6OidBHX973lpuATFP421qkkKknaEaebAyRRNANANkYpaBPLui?=
 =?us-ascii?Q?fVGLOcGaeGH9tNj/vTd81OomKe/YAty5eF6pZ+ip0JYm1pf4sRfEDvP5z3os?=
 =?us-ascii?Q?79REQ/vhbfkLqJIE76i1bnIE5dO0TkTdPXU+pUSsMKytKiiFHiHKWKfv0oQs?=
 =?us-ascii?Q?x8TLTY8nl72R0rA9/6nEFPXv9pwPscXh46FAxV+mSYkrkkcVDjRyIRA33kkm?=
 =?us-ascii?Q?rAZ35GZrvGljzlrXHtCw5qYEuNiJKBNID7Tiob/Roil32DExnutW0T+FZA5G?=
 =?us-ascii?Q?3LQcjEQ827Je/uM/Mf78LMJRfdFnY6rmd6sloy2l2U4rNxJ/0wizzwS1K20g?=
 =?us-ascii?Q?X5y2e6S93CvNoN9AcOXTyqCw8F6cpGTktbjnwZ12X7Dern26AY+7PZpB0w/y?=
 =?us-ascii?Q?nB5h0+wip3q0l+qZZLkP3438czcBqw0/cH7SGrK68CdjfWODdkE8G9lvo8Us?=
 =?us-ascii?Q?jhFDuql14+XhJfEkqob6tcG/cWh5ioeRiaAIMX88KloId9hgLNnUOrz9M9MM?=
 =?us-ascii?Q?G+j5prwTIJiDzcimzJAfiEZ5GU4rfBzTk4X68KlH6dv3iKa1Zu3Ctms98xQe?=
 =?us-ascii?Q?01cmEhSjflG/7mAIpvQVGZnctrGhvdProt8hk4lGnI0b95yXfH/iXEmeXOPz?=
 =?us-ascii?Q?O9KSXd+tfVAG6QaiqMM9sGCvGovdhTq+y7spdeW/bssURwyK1tc768lmVEEO?=
 =?us-ascii?Q?3FOgkSvesSLesfo979EfYunQzKQowyo1tNL2bzRUNxcJISkp4AlfTcOrBeog?=
 =?us-ascii?Q?1vFJk6o1DOhC9XpNLOqmum3n98omDoPMKTcSQZ/PI3oP4XhOJEHKmqAWynbY?=
 =?us-ascii?Q?49CPqTyuKQ2f5r1aBRF7RuPV11ilAXjgzSvgeaapvw3OufbiiAo9fi4DsW53?=
 =?us-ascii?Q?36McCpx0MEp1GL4hMnwzAHyYCWvNh3xYIxEPFTst3GOl7BgZgALxCs0BsJOD?=
 =?us-ascii?Q?3ZxrPFA2B55gqSuyBaiZdzvG6BU8KkTJum5NuhZSJsVLLGtRkX9X6xaEu+hq?=
 =?us-ascii?Q?r6HlgmdK6zXypYd0PY2uZ/mNKsYjtkqNeR1wkytox23tDcD2wUwXHmN773md?=
 =?us-ascii?Q?F2XtQ60t2B+JDAlAx+eLQZB+2axq2ugmNcDfl4JGuIPjmOo5HROhdFxWeM4/?=
 =?us-ascii?Q?wwx9BZHgK7BWjrXOVLJINSgcnol9zMwictRXyvr69lVd8HtNxXAuLHenG4rd?=
 =?us-ascii?Q?pCbyeGd7qi5XfEJopR+eLomMfArGJxcuuaNxdbT4F2H2rpYkQ2TXeI71Ltdn?=
 =?us-ascii?Q?Xm7JRmVaJhputRWd6iCjpd/y0wBvwvOesIg8iyY7aZFTVPAiykXNAHU8c8GI?=
 =?us-ascii?Q?FaA4EqyFUUCGZu9o/gPWvh2kYlQFCTg19pU32Zy53Ea/XC5qWpSzmmBbiDlF?=
 =?us-ascii?Q?mExPpxmsehx7j6iUWUU2gM1vVQi2NBulqo9mpXI4dS/hcrckNmD/fm1h1F0g?=
 =?us-ascii?Q?jKrywjhRFWzV17RwGFiog7KGnEPwRFA+xG4bOb7jbVxqArrvJTwgcyfEhHqQ?=
 =?us-ascii?Q?3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62a2e83-840b-4f17-e180-08dd4d7e86dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 05:06:37.9877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Xn3jjXGkuO8JcJIxzqvITbIA0zll/Ou8m5FZpOD1Y2n56C8IXEJLL+HlV7jqMs6KnNdxdL3CU0sDwTZCx19ndcz1xtOQ/V2BB5FJNGXrr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
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
> From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Sent: 14 February 2025 03:46 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Dandamudi,
> Priyanka <priyanka.dandamudi@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; intel-xe@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Subject: RE: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
>=20
> Hi
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > priyanka.dandamudi@intel.com
> > Sent: Wednesday, February 12, 2025 3:02 PM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Dugast,
> > Francois <francois.dugast@intel.com>; intel-xe@lists.freedesktop.org
> > Subject: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
> >
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> > Add fault injection for xe_sync_entry_parse to allow it to fail while
> > executing xe_vm_bind_ioctl().
> > This need to be added as it cannot be reached by injecting error
> > through IOCTL arguments.
> >
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c index 42f5bebd09e5..f87276df18f2 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -210,6 +210,7 @@ int xe_sync_entry_parse(struct xe_device *xe,
> > struct xe_file *xef,
> >
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
> >
> fail_function.
> -Satya.
I already sent IGT test to validate this change.
https://patchwork.freedesktop.org/series/144708/
--Priyanka
> >  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct
> > xe_sched_job
> > *job)
> >  {
> > --
> > 2.34.1

