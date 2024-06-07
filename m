Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007E2C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B191D10E10E;
	Fri,  7 Jun 2024 20:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5WwuDxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B7D10E10E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717791534; x=1749327534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rB/Sgjzl7SKfcKD4l+KHc4xoMUUXJ3mKonyMmuzf2bA=;
 b=k5WwuDxzcPRAzIMG3MP39ETBaRlKHWfG6H9go6VAEQckkqAJn+03EbeQ
 oAkBtqP80+0G+NMDoh4C3A7G0IbNYBnEBTZ6WTAsrI8++SIUL/TnWmM+M
 qGNzhDqw9W9lflmO+gCjmrexeqVXFzZSqP1FybLkl2BXURx1p+ZdlELkM
 mL5co9opdtDzwyKyIqPg4PnViqecxAFW4mLZBznkX7PQEZzXMDcC6cOef
 SqodPkdY3AfopXaDvCn3rVGnPes0+uk7NoederKh/CE/TnvS2htGkG5DJ
 Svz/TOEEQQpPVzO3Hr7z71R4BVQwhoHIIVPoP38smOIp7anrLuhNPQnLO Q==;
X-CSE-ConnectionGUID: N3xawvFiS4Wl71Uu6fjIvQ==
X-CSE-MsgGUID: YY3I4aDOQ3uxD2wkXehUwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14270931"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14270931"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:18:54 -0700
X-CSE-ConnectionGUID: hr9Fe+e5RIGNB6/ctUCzpQ==
X-CSE-MsgGUID: 7VdKWpVfR6iRGCImilAbaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38532226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 13:18:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:18:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 13:18:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 13:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObKm8xar7X0nxpic8VWVWi+8Lm5jSboMOjMTfznIMeboqL5LdyEeqvxTbTpi2Sr8WRZOQ0AL+LpzCmikoMiMVQtu+rFBqQv4mESsIyzWTOuJ2hhAngbyi5MVDe9ppaAZkL+z4IQuAXToVlA9/QOTktuH2ewchefqtRmwPx/dd0A6hn9qFQuRvrUtT09po+bDZMWpeomU4Lrl8JM9SrzvXdyYUvjvlfl2ddyYEyzJ5AdRdqDNe89rBktFW5TogoR4p7FawHZGYpVDkYC6d23wOYw7Kw8pw6aNq6MaZC0z3dEQMnMzc1VdwFmyiXrZdiVWh3xS3yjjrqrVOKizvAx0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTNZ1FXUHzidqp4xqa+D8RF9oPoaZ+YChj1dLf16K0w=;
 b=QkdnuPdAkgsg/WKzx4Bh8827UM9w8cJD1CG/SfhUvSpyhHvft653WcjNIMwEMjF0cn9R5ptFIGGlMyMat1mZG5QxKTHf0rhjJI9psdJhZBobAA+yr6hAtgKtbTDfXXF/SEQ9d4SXk60ifhH82BzWBEagbxdWytSv0CvwRWFxqYY6tXvzAgRu9W//5glS900INsnJh4xG58Da2oKrOOWnUQyvUY1h/1HF4I7/7NCPGh9ZZJjXCloG3Fk/7tQtUW8+lRnkiQCRYZ0F/pLUCKPhYu2dMRzgn1uSKbJS9pG5+0JAnD5AnK+dOWQZtK4pLDLKRJvqS2Ma2QT27Eu23iS7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 20:18:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 20:18:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 0/2] Allow CTB G2H processing without G2H IRQ
Thread-Topic: [PATCH v2 0/2] Allow CTB G2H processing without G2H IRQ
Thread-Index: AQHauBJ0xrKKe76j2E6+8Zbm4bGFvbG8vynA
Date: Fri, 7 Jun 2024 20:18:49 +0000
Message-ID: <CH0PR11MB54444700E75FB71743F7B4A5E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240606130639.1504-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL3PR11MB6436:EE_
x-ms-office365-filtering-correlation-id: fd92af2c-0e54-49ce-82ad-08dc872f0b08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?SSx9dBc2UcvpZ747jJwTjI6Q5uq+pA0PnEDv+T4JqnegTZc0/W/8IlRlqoet?=
 =?us-ascii?Q?9+E3Dr9ncq+XI0WIa5Nxcp/Nqx9YlnHk3WykalYyKaU9LgLGnqPHvr2deILO?=
 =?us-ascii?Q?DHcohgAXSOqRifp0cmNAsiVOPGLXjU1nttd0rTsp/Pk1zlEwQLPMtNzC2UZ4?=
 =?us-ascii?Q?g/v/PFhqIVZYh3sZ/pZ2J+8sEVlkDjI0D9cFtt7bqYSfYK7CNGzP5acxb8CX?=
 =?us-ascii?Q?ozq9Mep4GhM39JPiryLp+0z7rN0ZcwkpqCgXVtPTI5dke5TFU4tp3akQNOPx?=
 =?us-ascii?Q?O5dv9BEr0do/3aQhQ5YDWeKupwakjI6qWTP73ez0jiCBRMyW7rZ77Dy3l9cz?=
 =?us-ascii?Q?V2GtnzjNhG+C2uklYkYqSxJitINGna5r9kj4pizHBhLneCY1BwL6UOZaNu+Q?=
 =?us-ascii?Q?awUHzMwz6Qg6fsO05rKN4+aG0gtbiwrsGBRx0Ii7yMxu4g3Yd2PON2pqOgp3?=
 =?us-ascii?Q?vkP2UKaGac/zO+5e6JxOIrqAHUNj2F8B6JguQtQGFzVAFmHyUau0W9geiI38?=
 =?us-ascii?Q?6ybsgXfv9hxJEH88HGXFwtFgQbWWdYT6y4j7QI29Qxa6FBblDYxKaBx1Kjtb?=
 =?us-ascii?Q?UNNZJH/CncjoIcIxFjanRdc+wxvNmHx3eomWdw+v6Xdtuta+zotZxqL16lnZ?=
 =?us-ascii?Q?QkPqUeUNkCYwfbThjT2cuwskcP6I87DGFKLwxvBruf+wMYzd/0jwVc4gSn04?=
 =?us-ascii?Q?Fku9B5ZmFoQ5DOGDzQS7kEn+3VYwTuaG9xzWFNVa2Zgxe0mqxiU/jSy97Mry?=
 =?us-ascii?Q?Uk+wH8GYvv92CPO5MHG1KR51f5Hm0b4VSnaVViVLUhuRVht++fqUscp/qXRS?=
 =?us-ascii?Q?C/BapEJlI5JRqBkLgJgQ3TE+Pw1HLtObWrTdho8ING1Edbu5Y27Vwsw/FiCn?=
 =?us-ascii?Q?8VnXCPl8uh0MpFNYogXlRhVgrfEefZ4lNjIss2S4aS2poX/ewmB2fdV/87LN?=
 =?us-ascii?Q?1A8kM03hWudtr68+FtrHOh9dZD9IdHAu/Sl1prTkpV5CBFFf3KfWuvJWUES1?=
 =?us-ascii?Q?2pLRw8wBZUMS8XB24Urrqj7nTefxgrhbqI7Oz5acBMx0bNS6yO1u9aLnuepf?=
 =?us-ascii?Q?skbOmw/rodE0IQRlit7gMt36zZa0pxwaNd1ThjnHm9wHeuG/TkV5D7EMrLQ0?=
 =?us-ascii?Q?6RVxZBig7SqA7ixY/9qhCi2SClGjlDExhzgB0J63kE8rByF7OONjLhOAy1He?=
 =?us-ascii?Q?5/fOW4D/v31YjhijxDl9QE/BxUe7z1fDmEj6xTQ0NYK0ZuN0aeyrJrTO6poO?=
 =?us-ascii?Q?T/5agBZQtmQvJ3wejfq3wA60GG2uqyUKFSNaPMNyOanHFsrIZ2ds2ac91+em?=
 =?us-ascii?Q?tdxHt3XyB/RMWvQfGl1PVj+i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rR3Q+TgY0fBX2DZkn3xJ21W8gMbWeLLTLvvlMDiVh7yFw+WJ26GM/G52IjY3?=
 =?us-ascii?Q?kkHXeE032vkLWOcsuijgLgJeBMaHwx+fo35W2YT5N6pRHCadziIizdgZGsXE?=
 =?us-ascii?Q?fhAviKjWSPzYVy+QJOMRfOoO7xIXqkmPBtD0bTzfagQN2PKaWqdRjSc1hg/L?=
 =?us-ascii?Q?OAfiw68NKAjqfNMl4LGJrZR04e9uv+ibMUZXa2c5aLJcRDaW6hU4mJkR/D8n?=
 =?us-ascii?Q?nJq2OmHjiyM9vFACyvgshFURt903YI6PL4HvUnziflBvNPW8m1beAMuhrrkD?=
 =?us-ascii?Q?/zvhedwHQyy84xOy42mnqhBbOhGMTTe5xIEiHXFowr2bEkBJWuND2dh1ER7O?=
 =?us-ascii?Q?cd5YkNPy20E7OjG31GJQtGJqP7LmXse6ARmOxrI2cxMtUFd06ltj261hwjzx?=
 =?us-ascii?Q?l75nWfHXtgQRJ0VJ8zUL8tsoUCJ5V1NwMLJ1/g6BEOBG+jOqvMQ772eRKios?=
 =?us-ascii?Q?+4yp9RJfu/QwNObWKhRE1POHl20sZU3UvYMJaMA7LRKU9N78XN7ZjX778Ejk?=
 =?us-ascii?Q?Y26YxmUFD9gu82A94DaPRpyo1b7LvEtra0qGudtNbyca/r9j1FgnWbGbz2hh?=
 =?us-ascii?Q?9me7t8WHb5Tdx/FDXMqjKl1RodSQdmW0QUQbqUig75GwzPtkLsix63AKgIfM?=
 =?us-ascii?Q?FEIcKEIOFvcHEzDRBUc1H0D4h6Jra0AG+WubGsqGB5px1e1D3kChBf66Ty3f?=
 =?us-ascii?Q?fSAL/bXpUKHmuJjPlhUg9xYURB0GdoQA4LoA+l+TG0xiQy0+eYG1RKf1XZsY?=
 =?us-ascii?Q?UXmFzPJwq1ETqP0gWr93wPbHARsFZh8D87Dr6zz0nSlRRF20xjENv1l9vrsO?=
 =?us-ascii?Q?Q13b+qWXtyQsUPh+dQxsEe69h0nebNE9wxzIR6+MR6OqNm/hRqkmRJ5ahoyd?=
 =?us-ascii?Q?CoeGsCFm5V+asMTVCnsJKOfpf36xaQV9bPhNrO/o0u9vwcj3X6H5OeKayBev?=
 =?us-ascii?Q?Phuhpo8NanqToN5BCyja5ATIN+1K9ThJlnJlmpMz4/f8DQVMaxaBoD1fLmX7?=
 =?us-ascii?Q?GKmO5SXJ3uQGiMfce3ZiQ0+uB7sPGUSeIsAGMvVnHD5n07YHd0U2zYuaTmdi?=
 =?us-ascii?Q?kymuyQWKKKN3k05P8wMcnya8wiYqy7el1SBRxgJAJE40Rzp/U5bsnyZnaaoy?=
 =?us-ascii?Q?B8yjhsu+1uhd//wkv6w2JNisvQrfNHKEJZdEf9JN058/mqNIujVH4PsRTGbY?=
 =?us-ascii?Q?haJTLO/Zgv2iZNUDntHs2ybQK/JigBWMr9aGK3mJS1OIOfC1JTMwNhcsCouI?=
 =?us-ascii?Q?PWdCQtNt/g2TkaFIWqVKQCfUXN+ZBvO7TcU40vqw3Uz1GQ4kDVjakWdl90VN?=
 =?us-ascii?Q?5fsZscF5cWRASftJPhgtZ6VYGC2aJxh+r1KnA0yanUzwstjFbDfrJYLl7Y2J?=
 =?us-ascii?Q?1EalENgr7PQW5vqhqYVFl8nmHwQxizyonXMX6/VBsOa5mpvVJMd4NbnfrZ5R?=
 =?us-ascii?Q?h7RBIwLoPIf139GtJjPCuuvCK6mBg7vl9EShYTIPHnFTiEHJ1pYwMx3t/wtt?=
 =?us-ascii?Q?XJEs6Rg1ZFcRpzsjKTv13IcllSaYtCwguscR105+bYEzewzrUKCRgQc9rxfb?=
 =?us-ascii?Q?m+3gfO/h0iddBwbroW5pYc/UohC+QfZ91K5PEBAQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd92af2c-0e54-49ce-82ad-08dc872f0b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 20:18:49.7781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7tMVfhMzLthWOzdA827LBie+0g441M07I4E3wNxkazRzc+1qaSUFrLp3qpVqGJiu+QqHxzcLmxYK5Hosfr5fVB5/jSK1QMi7N3fggH9HnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Thursday, June 6, 2024 6:07 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 0/2] Allow CTB G2H processing without G2H IRQ
>=20
> v1: https://patchwork.freedesktop.org/series/134523/#rev1
> v2: use code from g2h worker instead of g2h irq handler (Matt)

I read through both patches, and agree with both of them.  Following
Reviewed-by applies to both.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Michal Wajdeczko (2):
>   drm/xe/guc: Split g2h worker function
>   drm/xe/guc: Allow CTB G2H processing without G2H IRQ
>=20
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 53 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
>  2 files changed, 53 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.43.0
>=20
>=20
