Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B85CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 19:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C62610EA12;
	Thu, 30 Oct 2025 19:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntwkqdwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700B10EA12
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761854116; x=1793390116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SjHVV0c5F8J9OONXk7OkMemKfSr6162OnlnS+LV/6GU=;
 b=ntwkqdwoirnCC1Wsip1P6ehvMAu1M2NBMOJb0IwTSjW8/lFWMV61v8+a
 h1fNWRGXUTT5/n0e4xNNN3qDEDSU0S6s2ARRj1LpVkKMDW19kO7DmDO6d
 jnhtwVmgSVQkEIwq4cVPn/tOIRTAit7eLmGAZFddrPUJu/bNNpro3Ac/h
 21u+HVz5Jy2XDY5FskpK3gZ7RuiKCwmGXeqLPI5PKRI/Kb532SGJNxFUs
 3IZ16McdWyNhb+Enn2k/NvS+lQG7z+kfBqVF8fW3pK+AGELquDWH9+jVv
 WiQS1+v+M6x1ZH8Q//TauZJmMriRabCP6JxFY0J6gAS+wmv1eDUp3pUfP g==;
X-CSE-ConnectionGUID: 4fPw4mS8Sjmq6N0EoW1mLw==
X-CSE-MsgGUID: AXWmYVujR+K7W/s+xXGAIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66622406"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="66622406"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:55:16 -0700
X-CSE-ConnectionGUID: 2J8tMAb2St2sk8/C13tG7A==
X-CSE-MsgGUID: OPvi3LyXSdiRoNzTkZVwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185315161"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:55:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:55:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 12:55:15 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVWf4nhE7Kab15hib83Qbj51iuUqO0tVFppW7uHVD7Lr5hpAmew8Llxv/ybOA8pF1k5021h3o28WX67ioqPuS+QX/H5KJSZt7LCP7iYex0FEck1stveKdrjWO7DGagGDVOAFy+rQgnAkxJ+73oHMaIyySVat72yF40nqP6jgNA6oOX/qLkcVvGiISkw/JVVl31VgzUrrw9gkNFX6Z/tbPdrA9+Il9UC01beXWU0095cs/OGj0V0Hhc/1bII0ppRbLsV6sNcYbob5E8xVWh324y+UoY/WMEeS1PWM/fb6b6UFZIxWekHeh+yjB4/vxG8TSYw47ivoMlBXeZ58rHUE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcW98yEhwXLJGiQG6QTrpAJKQPz8pDnLEtj4ALBi+FU=;
 b=zFvkrrgpu1Jakh6ZQXv68pVpBSdNaujeyUMNAcHUAZK8+1zb1yPWKUfm7R/sjBphZeMm88ipCAQJsrVcELDqd6DrheWtK0YkAgfgCmWuDvUrElIGxL1AeuAVcOOjRPNQB5JECcUK/X6X1n6pUWKunm8VX2Z+U5MuYEtsmuuNX7DKl0c32rNrAXcUxjoUIvYBcAS9DeBqMNjRqrxIb1Pv4NIqoHqdynK9NWN/pB+DV3fm2tvzanDaRVBPM1ihYT1sQWMK8weR40Qty4UTlI7Bjfo6xrtw42w71B4OTDxT1vg13YnoyagLtGv62tZ5TrErK61562khR4FQ6UkLS8vjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 30 Oct
 2025 19:55:12 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 19:55:12 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Thread-Topic: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Thread-Index: AQHcSS1gdKDGQw+bP0WTfr2LZRDRC7Ta5BcAgAA1jsA=
Date: Thu, 30 Oct 2025 19:55:12 +0000
Message-ID: <SA3PR11MB8046353AE0BBAE6A4A804C6F86FBA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <20251029233959.778689-1-x.wang@intel.com>
 <20251030163538.GT1207432@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251030163538.GT1207432@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH7PR11MB7449:EE_
x-ms-office365-filtering-correlation-id: 7f5b737b-bfd8-4ab7-1a94-08de17ee3cbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xXdLXYeToc4ncL5mXg6VurrsShpwjjv43h/5YMqbKvu2x/YAX1UTgIJD9iPf?=
 =?us-ascii?Q?Kh4XZEGRZQ3ms6N5MReZIFSr1Nvj9FloIuQPKEMq9cuIMgNmRI18q3vRNS14?=
 =?us-ascii?Q?fqKZE4nl4R/6FUyGelygSdKC7w2XqGSRZmAAajmFxS6UBTYr13dk55BiHAEV?=
 =?us-ascii?Q?6XovLfGA7q2PnmrI2WjGNh49vsvq9BF3z01ZC0AtH6ira++w/UJz1DJ5q9YA?=
 =?us-ascii?Q?t6dw1N5ao8JpKX+Dpo4EOuht2DZPK277aVyBodK3Gms3ZtZrfDL5wDVvpQeF?=
 =?us-ascii?Q?lTzzbEc9oPMEI9pvo9nERNlaUj9k/XFIYfi+GFVWWQOPSURsLXk4nfF9jr7/?=
 =?us-ascii?Q?JoopUEqpuvPjdohKSLiYyURx0SWxS4RSgiXJrXHLZGzgXZLGTV98lgf9eSOY?=
 =?us-ascii?Q?5nigSeKW6vyxcmbljiaaaF9LO2q3zl3o0pWxg6+llj+GJWbbxgg+W1Twazoj?=
 =?us-ascii?Q?Zu28MTHevBLtbvKu6qb0V/Ttu5BFMXGZaivdENMSeDfk5oSuFMACKAOeBU3o?=
 =?us-ascii?Q?b4e0NaBaqWd2PVSU09RKap5vCtMtb18vtWEblZn9DBCHJ5OgX83Lusptnpe3?=
 =?us-ascii?Q?fwe9Yj2clTLBxeO2nSxHJy0cd+nn/yT/nh8DQE/hukQgYOMqoRH4cejcKivf?=
 =?us-ascii?Q?4yvACsxNCpNU1zB0iQNJEorrygU03G87NsdIvi1EbegAgU2U5oAQSV4GFzAQ?=
 =?us-ascii?Q?uGz5jeerLiVhGs9ja/EtZCZRWmT4J+Ch35qx0A2qP4jPCeUpHOo5Kpnxtf3t?=
 =?us-ascii?Q?swcZxmKr6x3yygb5FGgIpHaK8rXoaZl9Z5c2WAiV29XWp9OQZP/Fr4XaJggy?=
 =?us-ascii?Q?NZfw5oejeSOYt4Ox6U0pcRaleZ6v+iE5nMQlaTXmGc8EpO2yZf/TrFruWXu/?=
 =?us-ascii?Q?46xiv6eAdFicj8WkV+ZORuIlbf+FFmbG9DRJ7lAaPSP++p+3dOVBJLMVWLn/?=
 =?us-ascii?Q?TDU7ktRl8gLtBijmYzGuoLcIRkBxJoY98HEp2IpO+UiLM8oePEOmtBjXY7Uw?=
 =?us-ascii?Q?Pe8RmZtiwELloMDt3qndc/Ws0/6UyzJrxsv9aw5sydxkHqOxDuLtiQoY0RH4?=
 =?us-ascii?Q?HxE5FCDnkj7KJm3/hmPo1pdrPZUS3KjcXpYsxx6xiIT+UiQdJyU1TnnT/sqR?=
 =?us-ascii?Q?GFEWDIK4PCIsg9EfU6blhCtQ+lCQYbqvJSPPf7VfXW3JP+sZmpQDfFpsl6hP?=
 =?us-ascii?Q?qRYG6aIjyDR0VXCi2aQHlnDmxdY+d5/pFk892NPL9vftuzP6Z16TVZhft9SD?=
 =?us-ascii?Q?oqZwt61pe+TnK059TOTmB2rVIlljzzXSUNoLnOmlUmXKxdijukU9Xc7N+tAH?=
 =?us-ascii?Q?JZS1ntgffnX7tWQaqCIOlip/t8N/Xa2r63hj8QqMfWGVclGhW9RRK6ZVvHug?=
 =?us-ascii?Q?bx2Y7yOUPXwCDonjhliv/I0ZtT1pX4Hw0TfN3JRep5l9hWt6ZjUH/7m4ZPAf?=
 =?us-ascii?Q?DK4EEWLMVXM+AyBfs5jdBksWw/Rjuri2xFkE4EflA7lsSbqCgeMkwLBgijhg?=
 =?us-ascii?Q?XiDQrWUH9rYKRO5WRsZa/dzwyuRZZ2ekaqlp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sYeQlGkh0dyVBbkvRqXLpUpTpiZNz3Jykm8asplnFZwDjFrUWHdL1LhLNwAd?=
 =?us-ascii?Q?qaCa4LPyxYCb4N0T465asyoI3pARS+mymyKDYjwA7WHjwiwVvUdSSJxk25ko?=
 =?us-ascii?Q?deOv7MEaMrhESNRk+4e6MZKASQqR0JGNBd2MrILnGxn3Q1eh0T3DnP7ID6tt?=
 =?us-ascii?Q?CMiblT1DBkd/hzBQ1Cckr0Mu49xSfF34DrklrzIiteEewslJroPmkjzO5zaR?=
 =?us-ascii?Q?H0ejQXkBldwu4ZN31w/TFpfOlv5gHttZi/jp4INDwFqNvyWq+ukLedLwDk2Y?=
 =?us-ascii?Q?hozLJImh2wu4REP7kqx8HuWsTDoP4fcoJUV+DKYckvMoxUNJ59MKjKEO8oBk?=
 =?us-ascii?Q?Sij2ZibXDlCPYysEVQuIBoFh8zXuptCQVyljVkdMj33FKyfNCSRToQ826CuN?=
 =?us-ascii?Q?XiAqI2CG+oHzUzBOAsnFmTcaYw+L6oPlQw38wuGX9k55t8zD6cOHF+EB7k+X?=
 =?us-ascii?Q?Ov81dx4rogJ5GNKNmWqHh89pPEQZi10sLztWqbK14+Mnc98RQzOK/SIwU6/+?=
 =?us-ascii?Q?r2yG8tcTajNYki2CnBqg4KWuOi3AugcpkIol81c6P2rIT0ZSDxVOtrvIIFx1?=
 =?us-ascii?Q?Egh4Ry4DZt8I58EAa9KngxkudHIkWSTnuEs0FFPif9eYbbdq7/seMoo+1KBx?=
 =?us-ascii?Q?PEwDI9uJDH+qexTqTeZzTdNyqNejPwr8A6ZUTQEhLoJbikMsI2Kq7wGuE3og?=
 =?us-ascii?Q?91eVmdRvfqbX0syBRBWCVco+jntavwpS1Vqfe/EetvJsZid8kX8NpKdVLx8p?=
 =?us-ascii?Q?XoaqhS26XHeyOWEunKEpb6bWXmHPtqakR7MpqUjxNcfiTUHMUi7RoeWFCLiy?=
 =?us-ascii?Q?dlSnkuvW9eZ9m/krl+/3HOkENcqlJvhnjT4X981IObtCU3u2KujnFjl/c4Eb?=
 =?us-ascii?Q?1C4Y50J9lxkxdhmTxBjYBzsjpzbtT1LtAR979WFKva0lwNeIRKDxryBixo1z?=
 =?us-ascii?Q?smFnn53EL8bnn5HknmjI+4AvOpiiZepU4+DhYFhTdQukirac146bosD+8eKR?=
 =?us-ascii?Q?uc5vBJ2bMVMBAZmRwJ12AAc6T8wrBtdCNuScnOYp19J8M5ofW6WBvqx8Vdbc?=
 =?us-ascii?Q?MZWfrWXLZDVyJpnEGFAvFpDdwvqmIyTRhehVfLvL8650fsunIN0YVPwujmSu?=
 =?us-ascii?Q?E71+ifmu3ifDrmSdXdKuO+5Cxxjw0XuFECSe9I86J/Sqc7FNF0kFDOGwfu5d?=
 =?us-ascii?Q?Lm1DZ3KHq8UPIzOfGVBUewnx+gTZLxJD1DS9AIjPbQiAsDmpWT+Lcw0EndWj?=
 =?us-ascii?Q?yzwykuGITqU96W1mcI111fkquKtsYx+4ztl4UBtai76niBHh5X4ttx4br12g?=
 =?us-ascii?Q?4VHDjgq2oe8QW+G3qDywex1aVvgDW4zm4gp/OV5U7og08b7OewrJuATiXAcx?=
 =?us-ascii?Q?tlVt/goh77leMbs7bpw0JEYS6BUwOshlCBJCEbBvpfNcSg7OHywZbVL5Lc2U?=
 =?us-ascii?Q?UUXWtpX7mHEQnwDU3N5ZvFa5Ow5A0kLcScqUp6YOwdc0R/AMpC+gJhkPcEFr?=
 =?us-ascii?Q?6/DN2YBJ8yzKsRo+IYhXI04dZ1pZiDjjOzEoQxBj4D2uOip/ekkbtXoi2huk?=
 =?us-ascii?Q?knMeg7Gu/oYGGsTaplM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5b737b-bfd8-4ab7-1a94-08de17ee3cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 19:55:12.1492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHUUJA+nf8+vlq7Vy1uSU8i8CU0RWcW7reYQOl/8tk8Ki4bYV0v7P9N8KGSuFFZak8nEYjU/MP7EzSBCqvufBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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
> Sent: Thursday, October 30, 2025 09:36
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.c=
om>
> Subject: Re: [PATCH v2] drm/xe: highlight reserved PAT entries in dump ou=
tput
>=20
> On Wed, Oct 29, 2025 at 11:39:59PM +0000, Xin Wang wrote:
> > Enhance the PAT table dump by marking reserved entries with an
> > asterisk (*) for improved readability and debugging.
> >
> > V2:
> >   Added a note in the "PAT table" header explaining the meaning of the
> > asterisk(*) to improve clarity for readers. (Matt Roper)
> >
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pat.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 7649b554942a..d9f9d5bb8e5d 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -368,7 +368,7 @@ static int xe2_dump(struct xe_gt *gt, struct
> drm_printer *p)
> >  	if (!fw_ref)
> >  		return -ETIMEDOUT;
> >
> > -	drm_printf(p, "PAT table:\n");
> > +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
> >
> >  	for (i =3D 0; i < xe->pat.n_entries; i++) {
> >  		if (xe_gt_is_media_type(gt))
> > @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> drm_printer *p)
> >  		else
> >  			pat =3D xe_gt_mcr_unicast_read_any(gt,
> XE_REG_MCR(_PAT_INDEX(i)));
> >
> > -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)\n", i,
> > +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)%s\n",
> > +i,
> >  			   !!(pat & XE2_NO_PROMOTE),
> >  			   !!(pat & XE2_COMP_EN),
> >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > -			   pat);
> > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
>=20
> I think you still need to add a 'valid' field to struct xe_pat_table (and=
 then set it
> as part of XE2_PAT()), right?  At the moment your patch is still checking=
 against
> coh_mode, which is going to mark a bunch of legitimate entries as reserve=
d.
>=20

The .coh_mode has been set to XE_COH_NONE(1) or XE_COH_AT_LEAST_1WAY(2) in
the XE2_PAT() macro, for the reserved entry the .coh_mode value will be zer=
o.
So, it should be ok to use this value as the valid determiner.

If we change the definition of XE_COH_NONE to 0 then we need a .valid field=
 in xe_pat_table.

	/**
	 * @coh_mode: The GPU coherency mode that @value maps to.
	 */
#define XE_COH_NONE          1
#define XE_COH_AT_LEAST_1WAY 2
	u16 coh_mode;
};

Xin
>=20
> Matt
>=20
> >  	}
> >
> >  	/*
> > @@ -426,18 +426,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct
> drm_printer *p)
> >  	if (!fw_ref)
> >  		return -ETIMEDOUT;
> >
> > -	drm_printf(p, "PAT table:\n");
> > +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
> >
> >  	for (i =3D 0; i < xe->pat.n_entries; i++) {
> >  		pat =3D xe_gt_mcr_unicast_read_any(gt,
> XE_REG_MCR(_PAT_INDEX(i)));
> >
> > -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> i,
> > +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]
> (%#8x)%s\n", i,
> >  			   !!(pat & XE2_NO_PROMOTE),
> >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > -			   pat);
> > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> >  	}
> >
> >  	/*
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
