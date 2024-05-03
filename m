Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCD1C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289F911320E;
	Fri,  3 May 2024 19:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDJJVZX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FD411320E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714765348; x=1746301348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ph23w7+ZoIVUApoLV1uwqxNl4Y33pStCftdsYpCEP5o=;
 b=WDJJVZX5GhOhFEaB6DZW7Tof0Uz0JDtkzr7uz4vuWs8nEHaMx5zKBsYE
 g+0hWgpDAi7GDKpPpQuOINRzppcnNZRIbdF4K14NNtpVCtjyKzubnxyNR
 JOOlJQbdpcbeLGrFbr5UzvuX2h3hIkvisucsXvf8RoqBzLIlUA8Amc4tC
 TfTLFrNwG5sVbm9FMLJJqVAcFVqEoldVpNTHbYiqN/yyOjkxKu0UB5Cx7
 5k/NJ1AfP+lVqiCqWOZOqQubsPg5nHRBX8yBDHDZ2ak5xlknkKBd5lnVV
 VrRVcmeloydJIsIyTTlznD4dCBAReNhafEkw7sNbq8Lv3omRo/jIMTwUH A==;
X-CSE-ConnectionGUID: PKWglXdrSceQJ4Piaa6V8Q==
X-CSE-MsgGUID: kWdcZkpvQ1WWAZyI56Xicg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10711087"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10711087"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:42:27 -0700
X-CSE-ConnectionGUID: qvEV/JZ9ROaA+ym+qyZnfw==
X-CSE-MsgGUID: VknhlQ9TTdCYEfxQroHnNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27600396"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:42:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:42:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:42:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJqhiESgroEyN4Yqa9rpVfOajF+9hdPw37o3/GJgYwL4lrFqM4ttRB/rQVjdJgHFaY2CRqXIsHmqlg7UMoMnARKNyEGPBMERfxZCWdh6lVXhHNdya1VoMTg7B38cvixPwLq+Y//4dkbbbU3lRDr8711Oc03YQY7jiuXvHPH4uVnAz/9VhOV8zuquITBv1bM+bVzjaQH/U4Meiw3NFUVEGRO8qD2W76LYNcxUkGq3h+xVRetmzr28WTEjFci5JKSgfnuGuzQyUHgjizxnOSXzPM+Zoyfac4QknLhxQ5/VFZEDmpcTUWEhoG+AExOf0ckqdVEplKJGzsEsl5e2UQbQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbZ5gkmPq87L/7M9LLFAhYVGVuxwVgVIfhKoTbscp7Y=;
 b=HhykDKFU1h7aUoUFfRhkBPeDts+LKDYlv5FRA3shGv0RcqEztgiEl61vAJ56J8UlV6ywIaSmzruc1QnUm32vVXPPwcITO3E4wQ76nbTEX+Ij5Sl3huAtv0C/D876IKpi9oKTRknmEz7lazi0kkphWJE76OFRzobSzGWbhLTQVdU2S0OuZFtHNRbDPY2w04gRKVX5JC7SD85Du7EeMH0fhwlOSOOon3hntQ7iIgt4znahbu3nCrCjIVU3b3NflEjJv7tm0si94J06X0nMGmDuOg8tSxUgVpoce/wHJZWTj4sSGgzFhXOjzTMFXbr2+bqWyev8VaMOV6IrGlxoHe9esw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 19:42:23 +0000
Received: from SA0PR11MB4750.namprd11.prod.outlook.com
 ([fe80::440e:c288:c46d:3166]) by SA0PR11MB4750.namprd11.prod.outlook.com
 ([fe80::440e:c288:c46d:3166%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 19:42:23 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gandi, 
 Ramadevi" <ramadevi.gandi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH v4 2/2] drm/xe/mocs: Add debugfs node to dump mocs
Thread-Topic: [PATCH v4 2/2] drm/xe/mocs: Add debugfs node to dump mocs
Thread-Index: AQHamyB4ka4J7htlP0+k5x5D3LEuPbGC4CmAgAMMjbA=
Date: Fri, 3 May 2024 19:42:23 +0000
Message-ID: <SA0PR11MB47507F573EB594BB0750A103AE1F2@SA0PR11MB4750.namprd11.prod.outlook.com>
References: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
 <20240430170427.1808136-3-janga.rahul.kumar@intel.com>
 <jaoehxup5clkhhe4vzlmvghsdwirt62bdy3s5iuutjuhigoc4q@rsbaoj4bhzoz>
In-Reply-To: <jaoehxup5clkhhe4vzlmvghsdwirt62bdy3s5iuutjuhigoc4q@rsbaoj4bhzoz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR11MB4750:EE_|PH7PR11MB5819:EE_
x-ms-office365-filtering-correlation-id: 19f823d4-9f41-4439-0aa6-08dc6ba92777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?qcqzo9ep1HQBldw1M0/VGUUfjz0/F+91pGvGwdEv1dJes8NW7THUCou0fehL?=
 =?us-ascii?Q?oCj72A3mXz8dT37l5U/le0q/AgAhcW6XEiPz8th3VNKjBIqIt5QINULjYEVv?=
 =?us-ascii?Q?Bciqy4dp4Orwp2GCwLr8CT8NNthTZNELStCXU1Tbu9u+HiLPk5dgG1jwN+F6?=
 =?us-ascii?Q?eB+jjgijjW89INjelRXT9Hk2KZUiZtAi6J/7Js+7f1HwJZxeYL9/GlUknL7U?=
 =?us-ascii?Q?GF5KPBJnaSDDATvMzPIDsWWYP6YZkFlTOKyI6iyDkFcPD0/fVHZRt6drF/5J?=
 =?us-ascii?Q?/ISIQgQVB+vvJIR7nE3nbK2LDZ4iAFGPIFSDwQj61BVTdTbAExXKF+l95ojk?=
 =?us-ascii?Q?RPqHtSkyAd07fzVuiwbuKbpr+4hK7G5ZlnCr2XgPcixBbApCgpnqQwWJmmTW?=
 =?us-ascii?Q?ACVYyNQSqw0QOfTrNo+gj7qLRNxRorSyGeQGWetOYnn573hpQQ18wUK1wkVB?=
 =?us-ascii?Q?LFnJTCpy8eBl7R3LJdkmiGslXOACUtQIncCiEXf8Gm7Ki4sitSRdyl9JnWpZ?=
 =?us-ascii?Q?jOFVeNNir5gj7GUuovMB/xjrhq6HR+Sv6jLG74qasiSzTQjGSY56Vro6dVtK?=
 =?us-ascii?Q?dpzj0ZSeNMMP7DJ+AGiX+Gi2wn5eBMfyhiupPQL6hIspsxLRa7BzTX9YE1JA?=
 =?us-ascii?Q?YkpXbj1zK5CMlKCrYzIyMDG/nFsS+/cL2uXt6K4fv3IinmGYe6Wt1IfUDocN?=
 =?us-ascii?Q?mutp4tspMj5JYgLI9Pk4OcamuuHdBrBy4SKyIaKNP9x9ZzQ08OGLM/Xb9erc?=
 =?us-ascii?Q?Pc1yKOH8x3A4mym3i5UOsKSLNnhbwgF1fVLWStObxyLG9B+9QmHDeY88/VjS?=
 =?us-ascii?Q?/omBYR1B4TexryJ3AzCYTGn/ckD1oZ3u+X9le2Ggr9yfKjo1EeTzmA+m/Jq5?=
 =?us-ascii?Q?1Z/O8hKntVR2NMqSXDHvGFLGhH3qGgWBXdaImhuBlnuSlzUd7NknGoPAA/g8?=
 =?us-ascii?Q?AUfe8NdmAvkKrztdT/xrMGIoMcOhfOn7okfahZGDvw3IW2YcSHOa/R0UfIk+?=
 =?us-ascii?Q?Wz5tQ4B6wCzKh2Zwxzm30Bd9K0e4jYHllcweQmnmM/E9pTFDFxefDEEObHgE?=
 =?us-ascii?Q?0ya/iBeUJ1QYUdVKTiRxI1SQjZESlEb/cA907k2GfU1dxiv32wlFKAyV7ktf?=
 =?us-ascii?Q?TBnBzPTg6VXtZhM3c+tNKKEqck7qQEM5yIQClLJ2bUzPdS2jyB63p+90zsCf?=
 =?us-ascii?Q?GYqnn40f0t/S1kKJwjM1K9CdX66kVDjXo3WC/Er8vncSxsjYEktetwoI8vKT?=
 =?us-ascii?Q?20H8L4FQiq/q74dubEjbo9z79nJhLNGG3mRIG4T1FrMdizeC3bdgzuoAWyiA?=
 =?us-ascii?Q?NGU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rmpQemmJHKGHyD2ueneGPZT4FsWv+srkIpVUKSAFDcjiwnT85wUPgQ8YpCc7?=
 =?us-ascii?Q?hgWfsfjgySDLupjtnmzY9kobf/gNyITs/6MHZuvfIc0kOY2F7R8y0NL3DkpL?=
 =?us-ascii?Q?iKaJUaihvPhnrZMGLe/7ommQsRzudRnqoj9piWuoxvQWtQfi03hy4RRFVtB7?=
 =?us-ascii?Q?1zaC9uBTd6XZpiT0y79miynzcTnvdLx1/jf9BIeojWhYqw0DXmGUm6kwy0cV?=
 =?us-ascii?Q?/5sRtyrsZNtmwOzHzNEtHJy0BJXk9FvzXvSzc4bxP8wT2gbsCehh76B6m6lI?=
 =?us-ascii?Q?gIloi/+qPw6rxg/QtfUouaLER8S2rC9h2pX1LY18QDM83Yt9XM4L3izaYLIr?=
 =?us-ascii?Q?uwtgnph1DwVYgB1Y4cIxbejWA3WLtWgajXq1VQ5JFegO/cp0FJXKCqHG1YuF?=
 =?us-ascii?Q?soGsL+y7zmJVXLbQ+w4UXuWKoqUlPzPHOD/5e5FrUKpr/LZuESCDZ7I+RkOf?=
 =?us-ascii?Q?Z+HXu7ri6u9Yot8L8kEVCljPR0PXDDfjdndZK6ALFXZzy00ogZi5NrwaM6EO?=
 =?us-ascii?Q?aN4oy9mFezUjjyISa0ekJzURsY6pTDC9eTU38t9xUir92ivUO7wmZYGgbTs0?=
 =?us-ascii?Q?1ibpUKq+5PnF2OwTfSiUPasTXPNcnY6o7cW1NWfnffx3kUbZPZ++dCzL+lo7?=
 =?us-ascii?Q?vmCTCv5nyq1zao+M94KEcGbBSxSrWOJaqcZeLzgu3pAfUweLww/eowo3N9Dg?=
 =?us-ascii?Q?G5+fTBfWqUIgv7n6hPB+W7gy+IxNcpXRy2xv9JD/RKnvKeyB4Sweq3TSNQf5?=
 =?us-ascii?Q?Jllx3/xPmWVlRG6ep6haqNsPEo/58pBVVS4W1ycxLRJLYcyIW/L3aA0xkZ7O?=
 =?us-ascii?Q?N/JXXnAluUy80o1mvLvDZ2EPjXh/Pj7db4WzDO/QA6pIXaQapsES6rqqUTra?=
 =?us-ascii?Q?8BVi0jjS2byAKIuZ4xPvhJ9XlkbH2UUHUDljhojG36VthA5UJ2+oGU+mJyN2?=
 =?us-ascii?Q?VpAfNBtxyRKsKD7GvEctBv17FSwv04LutBFoOqlLTmilQRenFlYGz39EsvPL?=
 =?us-ascii?Q?Om35bIz6SMWYYxBMK1Z1m5/Bk/uqKg4kugUxolNW4hSKVYCpJPvojP7Zy0R8?=
 =?us-ascii?Q?04Hi8jTZRUdcwKBGqGxN/Wzp6Y04dK0jdb/ThzkYlu/y26AOTpWG77hipWbA?=
 =?us-ascii?Q?QQouNKGiJRARjn/UfJ8CHDv0qvMBVo3JBlHjS87+VKpA9gAo5DMfEyx9wBqO?=
 =?us-ascii?Q?kBkdPfcPD15anHlWfS6mpz3HMHdMeegVVS2RXv6l3KGbLHQ11cJOvJb+iEr6?=
 =?us-ascii?Q?4cMTptGHfDSUzCBqiw54hz//mAXB48P18mpBJXql/PvNHv5N4tVqSgryW9qo?=
 =?us-ascii?Q?nrGhJJm3IfOCQvvF8hZnn5rvFk0YzDKBJB1V3urMQW6JgVsFBIG7pBGh8kzr?=
 =?us-ascii?Q?n2XYwUmk8V8rY3CwEjJAVCN4l1xAR0MKvwqOdfTye7eFuoxBbq1yQ5UcvaJm?=
 =?us-ascii?Q?3zISW9JLJaCsqS1NQUaMaeUrL6GzU1Oeo1SLHKf6K7aKdanv4GKVDBYTgJK/?=
 =?us-ascii?Q?Xa/BsuR/Z/J+MYFSjGG8pt6nutHHwnQPnxjBJ+i8lacKuvz4utjPkMg2IvtI?=
 =?us-ascii?Q?WpdE+l3JCCU0kDqYpLfdwYcE69bs6oI/cMbYIk5hWqyN7NAvNENmMAL1Uzcz?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f823d4-9f41-4439-0aa6-08dc6ba92777
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 19:42:23.5301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: glCjS6RsuGEie9mh6KjtMgforrsuIslPfUL9fJAuRtGVXR8H/HerU3sYM7J0FaRpJ7eZIB6G9XxYo8jlsAGorLqkTNC998iz+a6JKn4uLsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, May 2, 2024 2:35 AM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH v4 2/2] drm/xe/mocs: Add debugfs node to dump mocs
>=20
> On Tue, Apr 30, 2024 at 10:34:27PM GMT, Janga Rahul Kumar wrote:
> >This is useful to check mocs configuration. Tests/Tools can use this
> >debugfs entry to get mocs info.
> >
> >v2: Address review comments. Change debugfs output style similar to pat
> >debugfs. (Lucas De Marchi)
> >
> >v3: rebase.
> >
> >v4: Address review comments. Use function pointer inside ops struct.
> >Update Test-with links. Remove usage of flags wherever not required.
> >(Lucas De Marchi)
> >
> >Test-with:
> https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-2-
> janga.rahul.kumar@intel.com
> >
> >https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-3-
> >janga.rahul.kumar@intel.com/
>=20
> only in the cover ^
Removed.=20
>=20
> >
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt_debugfs.c |  11 ++
> > drivers/gpu/drm/xe/xe_mocs.c       | 258 +++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_mocs.h       |   8 +
> > 3 files changed, 277 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >index 599aed47f2ba..84068acbef4b 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >@@ -18,6 +18,7 @@
> > #include "xe_hw_engine.h"
> > #include "xe_lrc.h"
> > #include "xe_macros.h"
> >+#include "xe_mocs.h"
> > #include "xe_pat.h"
> > #include "xe_pm.h"
> > #include "xe_reg_sr.h"
> >@@ -200,6 +201,15 @@ static int pat(struct xe_gt *gt, struct drm_printer=
 *p)
> > 	return 0;
> > }
> >
> >+static int mocs(struct xe_gt *gt, struct drm_printer *p) {
> >+	xe_pm_runtime_get(gt_to_xe(gt));
> >+	xe_mocs_dump(gt, p);
> >+	xe_pm_runtime_put(gt_to_xe(gt));
> >+
> >+	return 0;
> >+}
> >+
> > static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)  {
> > 	xe_pm_runtime_get(gt_to_xe(gt));
> >@@ -255,6 +265,7 @@ static const struct drm_info_list debugfs_list[] =3D=
 {
> > 	{"register-save-restore", .show =3D xe_gt_debugfs_simple_show, .data =
=3D
> register_save_restore},
> > 	{"workarounds", .show =3D xe_gt_debugfs_simple_show, .data =3D
> workarounds},
> > 	{"pat", .show =3D xe_gt_debugfs_simple_show, .data =3D pat},
> >+	{"mocs", .show =3D xe_gt_debugfs_simple_show, .data =3D mocs},
> > 	{"default_lrc_rcs", .show =3D xe_gt_debugfs_simple_show, .data =3D
> rcs_default_lrc},
> > 	{"default_lrc_ccs", .show =3D xe_gt_debugfs_simple_show, .data =3D
> ccs_default_lrc},
> > 	{"default_lrc_bcs", .show =3D xe_gt_debugfs_simple_show, .data =3D
> >bcs_default_lrc}, diff --git a/drivers/gpu/drm/xe/xe_mocs.c
> >b/drivers/gpu/drm/xe/xe_mocs.c index aef09eb423e9..a7caa9df0470 100644
> >--- a/drivers/gpu/drm/xe/xe_mocs.c
> >+++ b/drivers/gpu/drm/xe/xe_mocs.c
> >@@ -13,6 +13,7 @@
> > #include "xe_gt_mcr.h"
> > #include "xe_mmio.h"
> > #include "xe_platform_types.h"
> >+#include "xe_pm.h"
> > #include "xe_sriov.h"
> > #include "xe_step_types.h"
> >
> >@@ -36,6 +37,13 @@ struct xe_mocs_entry {
> > 	u16 used;
> > };
> >
> >+struct xe_mocs_info;
> >+
> >+struct xe_mocs_ops {
> >+	void (*dump)(struct xe_mocs_info *mocs, unsigned int flags,
> >+		     struct xe_gt *gt, struct drm_printer *p); };
> >+
> > struct xe_mocs_info {
> > 	unsigned int size;
> > 	unsigned int n_entries;
> >@@ -43,6 +51,7 @@ struct xe_mocs_info {
> > 	u8 uc_index;
> > 	u8 wb_index;
> > 	u8 unused_entries_index;
> >+	const struct xe_mocs_ops *ops;
>=20
> this creates a hole in the middle of the struct. Better move it near the =
table
> member.
Done.
>=20
> > };
> >
> > /* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */ @@ -57,6
> >+66,17 @@ struct xe_mocs_info {
> > #define LE_COS(value)		((value) << 15)
> > #define LE_SSE(value)		((value) << 17)
> >
> >+#define   LE_SSE_MASK		REG_GENMASK(18, 17)
> >+#define   LE_COS_MASK		REG_GENMASK(16, 15)
> >+#define   LE_SCF_MASK		REG_BIT(14)
> >+#define   LE_PFM_MASK		REG_GENMASK(13, 11)
> >+#define   LE_SCC_MASK		REG_GENMASK(10, 8)
> >+#define   LE_RSC_MASK		REG_BIT(7)
> >+#define   LE_AOM_MASK		REG_BIT(6)
> >+#define   LE_LRUM_MASK		REG_GENMASK(5, 4)
> >+#define   LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
> >+#define   LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)
>=20
> sorry for not noticing before: below I see you're doing:
>=20
> reg_val =3D xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i)); or reg_v=
al
> =3D xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>=20
> so these defines should be together with those registers in
> drivers/gpu/drm/xe/regs/xe_gt_regs.h
Done.

>=20
> >+
> > /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per wo=
rd
> */
> > #define L3_ESC(value)		((value) << 0)
> > #define L3_SCC(value)		((value) << 1)
> >@@ -64,6 +84,17 @@ struct xe_mocs_info {
> > #define L3_GLBGO(value)		((value) << 6)
> > #define L3_LKUP(value)		((value) << 7)
> >
> >+#define   L3_UPPER_LKUP_MASK			REG_BIT(23)
> >+#define   L3_UPPER_GLBGO_MASK			REG_BIT(22)
> >+#define   L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
> >+#define   L3_UPPER_IDX_SCC_MASK			REG_GENMASK(19, 17)
> >+#define   L3_UPPER_IDX_ESC_MASK			REG_BIT(16)
> >+#define   L3_LKUP_MASK				REG_BIT(7)
> >+#define   L3_GLBGO_MASK				REG_BIT(6)
> >+#define   L3_CACHEABILITY_MASK			REG_GENMASK(5, 4)
> >+#define   L3_SCC_MASK				REG_GENMASK(3, 1)
> >+#define   L3_ESC_MASK				REG_BIT(0)
>=20
> ditto
>=20
> >+
> > /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> > #define IG_PAT				REG_BIT(8)
> > #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
> >@@ -107,6 +138,8 @@ struct xe_mocs_info {
> > #define XE2_L3_1_XD		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 1)
> > #define XE2_L3_3_UC		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 3)
> >
> >+#define XE2_L3_CLOS_MASK	REG_GENMASK(7, 6)
> >+
> > #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
> > 	[__idx] =3D { \
> > 		.control_value =3D __control_value, \
> >@@ -265,6 +298,74 @@ static bool regs_are_mcr(struct xe_gt *gt)
> > 		return GRAPHICS_VERx100(xe) >=3D 1250;  }
> >
> >+static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt
> >+*gt, struct drm_printer *p) {
> >+	unsigned int i, j;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "LNCFCMOCS[idx] =3D [ESC, SCC, L3CC] (value)\n\n");
> >+
> >+	for (i =3D 0, j =3D 0; i < (info->n_entries + 1) / 2; i++, j++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_LNCFCMOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j++,
> >+			   !!(reg_val & L3_ESC_MASK),
> >+			   REG_FIELD_GET(L3_SCC_MASK, reg_val),
> >+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j,
> >+			   !!(reg_val & L3_UPPER_IDX_ESC_MASK),
> >+			   REG_FIELD_GET(L3_UPPER_IDX_SCC_MASK, reg_val),
> >+
> REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+}
> >+
> >+static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flag=
s,
> >+			   struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i;
> >+	u32 reg_val;
> >+
> >+	if (flags & HAS_GLOBAL_MOCS) {
> >+		drm_printf(p, "Global mocs table configuration:\n");
> >+		drm_printf(p, "GLOB_MOCS[idx] =3D [LeCC, TC, LRUM, AOM, RSC,
> SCC, PFM,
> >+SCF, CoS, SSE] (value)\n\n");
> >+
> >+		for (i =3D 0; i < info->n_entries; i++) {
> >+			if (regs_are_mcr(gt))
> >+				reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_GLOBAL_MOCS(i));
> >+			else
> >+				reg_val =3D xe_mmio_read32(gt,
> XELP_GLOBAL_MOCS(i));
> >+
> >+		drm_printf(p, "GLOB_MOCS[%2d] =3D [%u, %u, %u, %u, %u, %u,
> %u, %u, %u,
> >+%u ] (%#8x)\n",
>=20
> indentation here is misleading
Corrected.

>=20
> >+			   i,
> >+			   REG_FIELD_GET(LE_CACHEABILITY_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_TGT_CACHE_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_LRUM_MASK, reg_val),
> >+			   !!(reg_val & LE_AOM_MASK),
> >+			   !!(reg_val & LE_RSC_MASK),
> >+			   REG_FIELD_GET(LE_SCC_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_PFM_MASK, reg_val),
> >+			   !!(reg_val & LE_SCF_MASK),
> >+			   REG_FIELD_GET(LE_COS_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_SSE_MASK, reg_val),
> >+			   reg_val);
> >+		}
> >+	}
> >+
> >+	xelp_lncf_dump(info, gt, p);
> >+}
> >+
> >+static const struct xe_mocs_ops xelp_mocs_ops =3D {
> >+	.dump =3D xelp_mocs_dump,
> >+};
> >+
> > static const struct xe_mocs_entry dg1_mocs_desc[] =3D {
> > 	/* UC */
> > 	MOCS_ENTRY(1, 0, L3_1_UC),
> >@@ -301,6 +402,40 @@ static const struct xe_mocs_entry dg2_mocs_desc[] =
=3D
> {
> > 	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),  };
> >
> >+static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flag=
s,
> >+			   struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i, j;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "LNCFCMOCS[idx] =3D [UCL3LOOKUP, GLBGO, L3CC]
> >+(value)\n\n");
> >+
> >+	for (i =3D 0, j =3D 0; i < (info->n_entries + 1) / 2; i++, j++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_LNCFCMOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j++,
> >+			   !!(reg_val & L3_LKUP_MASK),
> >+			   !!(reg_val & L3_GLBGO_MASK),
> >+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j,
> >+			   !!(reg_val & L3_UPPER_LKUP_MASK),
> >+			   !!(reg_val & L3_UPPER_GLBGO_MASK),
> >+
> REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+}
> >+
> >+static const struct xe_mocs_ops xehp_mocs_ops =3D {
> >+	.dump =3D xehp_lncf_dump,
> >+};
> >+
> > static const struct xe_mocs_entry pvc_mocs_desc[] =3D {
> > 	/* Error */
> > 	MOCS_ENTRY(0, 0, L3_3_WB),
> >@@ -312,6 +447,36 @@ static const struct xe_mocs_entry pvc_mocs_desc[] =
=3D
> {
> > 	MOCS_ENTRY(2, 0, L3_3_WB),
> > };
> >
> >+static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> struct xe_gt *gt,
> >+			  struct drm_printer *p)
> >+{
> >+	unsigned int i, j;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "LNCFCMOCS[idx] =3D [ L3CC ] (value)\n\n");
> >+
> >+	for (i =3D 0, j =3D 0; i < (info->n_entries + 1) / 2; i++, j++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_LNCFCMOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [ %u ] (%#8x)\n",
> >+			   j++,
> >+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [ %u ] (%#8x)\n",
> >+			   j,
> >+
> REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+}
> >+
> >+static const struct xe_mocs_ops pvc_mocs_ops =3D {
> >+	.dump =3D pvc_mocs_dump,
> >+};
> >+
> > static const struct xe_mocs_entry mtl_mocs_desc[] =3D {
> > 	/* Error - Reserved for Non-Use */
> > 	MOCS_ENTRY(0,
> >@@ -363,6 +528,36 @@ static const struct xe_mocs_entry mtl_mocs_desc[] =
=3D
> {
> > 		   L3_GLBGO(1) | L3_1_UC),
> > };
> >
> >+static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> >+			  struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "Global mocs table configuration:\n");
> >+	drm_printf(p, "GLOB_MOCS[idx] =3D [IG_PAT, L4_CACHE_POLICY]
> >+(value)\n\n");
> >+
> >+	for (i =3D 0; i < info->n_entries; i++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_GLOBAL_MOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt,
> XELP_GLOBAL_MOCS(i));
> >+
> >+		drm_printf(p, "GLOB_MOCS[%2d] =3D [%u, %u]  (%#8x)\n",
> >+			   i,
> >+			   !!(reg_val & IG_PAT),
> >+			   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+
> >+	/* MTL lncf mocs table pattern is similar to that of xehp */
> >+	xehp_lncf_dump(info, flags, gt, p);
> >+}
> >+
> >+static const struct xe_mocs_ops mtl_mocs_ops =3D {
> >+	.dump =3D mtl_mocs_dump,
> >+};
> >+
> > static const struct xe_mocs_entry xe2_mocs_table[] =3D {
> > 	/* Defer to PAT */
> > 	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0), @@ -376,6 +571,34 @@
> static
> >const struct xe_mocs_entry xe2_mocs_table[] =3D {
> > 	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),  };
> >
> >+static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> >+			  struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "Global mocs table configuration:\n");
> >+	drm_printf(p, "GLOB_MOCS[idx] =3D [IG_PAT, L3_CLOS,
> L3_CACHE_POLICY,
> >+L4_CACHE_POLICY] (value)\n\n");
> >+
> >+	for (i =3D 0; i < info->n_entries; i++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_GLOBAL_MOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt,
> XELP_GLOBAL_MOCS(i));
> >+
> >+		drm_printf(p, "GLOB_MOCS[%2d] =3D [%u, %u, %u]  (%#8x)\n",
> >+			   i,
> >+			   !!(reg_val & IG_PAT),
> >+			   REG_FIELD_GET(XE2_L3_CLOS_MASK, reg_val),
> >+			   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+}
> >+
> >+static const struct xe_mocs_ops xe2_mocs_ops =3D {
> >+	.dump =3D xe2_mocs_dump,
> >+};
> >+
> > static unsigned int get_mocs_settings(struct xe_device *xe,
> > 				      struct xe_mocs_info *info)
> > {
> >@@ -386,6 +609,7 @@ static unsigned int get_mocs_settings(struct
> >xe_device *xe,
>=20
> this get_mocs_settings being called over and over: we may need to redesig=
n it,
> but no need to worry for now.
True, if possible we can add mocs to device struct similar to pat.
>=20
> rest looks correct so next version we should hopefully be able to apply.
> Please confirm the platforms this was tested on.
Tested-on: ADL, DG1, DG2, MTL, PVC, LNL

>=20
> Below is a (untested) diff with part of the things I mentioned. Feel free=
 to use it
> to squash the changes.
Thanks for sharing below diff. made the changes accordingly and sent v5.

Thanks
Janga Rahul Kumar

>=20
> |diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> |b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> |index 83847f2da72a..8f44437c8e02 100644
> |--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> |+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> |@@ -59,6 +59,27 @@
> |
> | #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) *
> 4)
> | #define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000
> + (i) * 4)
> |+#define   LE_SSE_MASK				REG_GENMASK(18, 17)
> |+#define   LE_SSE(value)
> 	REG_FIELD_PREP(LE_SSE_MASK, value)
> |+#define   LE_COS_MASK				REG_GENMASK(16, 15)
> |+#define   LE_COS(value)
> 	REG_FIELD_PREP(LE_COS_MASK)
> |+#define   LE_SCF_MASK				REG_BIT(14)
> |+#define   LE_SCF(value)
> 	REG_FIELD_PREP(LE_SCF_MASK, value)
> |+#define   LE_PFM_MASK				REG_GENMASK(13, 11)
> |+#define   LE_PFM(value)
> 	REG_FIELD_PREP(LE_PFM_MASK, value)
> |+#define   LE_SCC_MASK				REG_GENMASK(10, 8)
> |+#define   LE_SCC(value)
> 	REG_FIELD_PREP(LE_SCC_MASK, value)
> |+#define   LE_RSC_MASK				REG_BIT(7)
> |+#define   LE_RSC(value)
> 	REG_FIELD_PREP(LE_RSC_MASK, value)
> |+#define   LE_AOM_MASK				REG_BIT(6)
> |+#define   LE_AOM(value)
> 	REG_FIELD_PREP(LE_AOM_MASK, value)
> |+#define   LE_LRUM_MASK				REG_GENMASK(5, 4)
> |+#define   LE_LRUM(value)
> 	REG_FIELD_PREP(LE_LRUM_MASK, value)
> |+#define   LE_TGT_CACHE_MASK			REG_GENMASK(3, 2)
> |+#define   LE_TGT_CACHE(value)
> 	REG_FIELD_PREP(LE_TGT_CACHE_MASK, value)
> |+#define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
> |+#define   LE_CACHEABILITY(value)
> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
> |+
> | #define CCS_AUX_INV				XE_REG(0x4208)
> |
> | #define VD0_AUX_INV				XE_REG(0x4218)
> |@@ -314,9 +335,24 @@
> | #define   XEHPC_OVRLSCCC			REG_BIT(0)
> |
> | /* L3 Cache Control */
> |+#define LNCFCMOCS_REG_COUNT			32
> | #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
> | #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
> |-#define LNCFCMOCS_REG_COUNT			32
> |+#define   L3_UPPER_LKUP_MASK			REG_BIT(23)
> |+#define   L3_UPPER_GLBGO_MASK			REG_BIT(22)
> |+#define   L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
> |+#define   L3_UPPER_IDX_SCC_MASK			REG_GENMASK(19, 17)
> |+#define   L3_UPPER_IDX_ESC_MASK			REG_BIT(16)
> |+#define   L3_LKUP_MASK				REG_BIT(7)
> |+#define   L3_LKUP(value)
> 	REG_FIELD_PREP(L3_LKUP_MASK, value)
> |+#define   L3_GLBGO_MASK				REG_BIT(6)
> |+#define   L3_GLBGO(value)
> 	REG_FIELD_PREP(L3_GLBGO_MASK, value)
> |+#define   L3_CACHEABILITY_MASK			REG_GENMASK(5, 4)
> |+#define   L3_CACHEABILITY(value)
> 	REG_FIELD_PREP(L3_CACHEABILITY_MASK, value)
> |+#define   L3_SCC_MASK				REG_GENMASK(3, 1)
> |+#define   L3_SCC(value)
> 	REG_FIELD_PREP(L3_SCC_MASK, value)
> |+#define   L3_ESC_MASK				REG_BIT(0)
> |+#define   L3_ESC(value)
> 	REG_FIELD_PREP(L3_ESC_MASK, value)
> |
> | #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> | #define   XEHP_LNESPARE				REG_BIT(19)
> |diff --git a/drivers/gpu/drm/xe/xe_mocs.c
> |b/drivers/gpu/drm/xe/xe_mocs.c index a7caa9df0470..7c75b827cb82 100644
> |--- a/drivers/gpu/drm/xe/xe_mocs.c
> |+++ b/drivers/gpu/drm/xe/xe_mocs.c
> |@@ -48,53 +48,12 @@ struct xe_mocs_info {
> | 	unsigned int size;
> | 	unsigned int n_entries;
> | 	const struct xe_mocs_entry *table;
> |+	const struct xe_mocs_ops *ops;
> | 	u8 uc_index;
> | 	u8 wb_index;
> | 	u8 unused_entries_index;
> |-	const struct xe_mocs_ops *ops;
> | };
> |
> |-/* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */
> |-#define _LE_CACHEABILITY(value)	((value) << 0)
> |-#define _LE_TGT_CACHE(value)	((value) << 2)
> |-#define LE_LRUM(value)		((value) << 4)
> |-#define LE_AOM(value)		((value) << 6)
> |-#define LE_RSC(value)		((value) << 7)
> |-#define LE_SCC(value)		((value) << 8)
> |-#define LE_PFM(value)		((value) << 11)
> |-#define LE_SCF(value)		((value) << 14)
> |-#define LE_COS(value)		((value) << 15)
> |-#define LE_SSE(value)		((value) << 17)
> |-
> |-#define   LE_SSE_MASK		REG_GENMASK(18, 17)
> |-#define   LE_COS_MASK		REG_GENMASK(16, 15)
> |-#define   LE_SCF_MASK		REG_BIT(14)
> |-#define   LE_PFM_MASK		REG_GENMASK(13, 11)
> |-#define   LE_SCC_MASK		REG_GENMASK(10, 8)
> |-#define   LE_RSC_MASK		REG_BIT(7)
> |-#define   LE_AOM_MASK		REG_BIT(6)
> |-#define   LE_LRUM_MASK		REG_GENMASK(5, 4)
> |-#define   LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
> |-#define   LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)
> |-
> |-/* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per wo=
rd
> */
> |-#define L3_ESC(value)		((value) << 0)
> |-#define L3_SCC(value)		((value) << 1)
> |-#define _L3_CACHEABILITY(value)	((value) << 4)
> |-#define L3_GLBGO(value)		((value) << 6)
> |-#define L3_LKUP(value)		((value) << 7)
> |-
> |-#define   L3_UPPER_LKUP_MASK			REG_BIT(23)
> |-#define   L3_UPPER_GLBGO_MASK			REG_BIT(22)
> |-#define   L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
> |-#define   L3_UPPER_IDX_SCC_MASK			REG_GENMASK(19, 17)
> |-#define   L3_UPPER_IDX_ESC_MASK			REG_BIT(16)
> |-#define   L3_LKUP_MASK				REG_BIT(7)
> |-#define   L3_GLBGO_MASK				REG_BIT(6)
> |-#define   L3_CACHEABILITY_MASK			REG_GENMASK(5, 4)
> |-#define   L3_SCC_MASK				REG_GENMASK(3, 1)
> |-#define   L3_ESC_MASK				REG_BIT(0)
> |-
> | /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> | #define IG_PAT				REG_BIT(8)
> | #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
> |@@ -111,22 +70,20 @@ struct xe_mocs_info {
> |  * Note: LE_0_PAGETABLE works only up to Gen11; for newer gens it
> |means
> |  * the same as LE_UC
> |  */
> |-#define LE_0_PAGETABLE		_LE_CACHEABILITY(0)
> |-#define LE_1_UC			_LE_CACHEABILITY(1)
> |-#define LE_2_WT			_LE_CACHEABILITY(2)
> |-#define LE_3_WB			_LE_CACHEABILITY(3)
> |+#define LE_1_UC			LE_CACHEABILITY(1)
> |+#define LE_2_WT			LE_CACHEABILITY(2)
> |+#define LE_3_WB			LE_CACHEABILITY(3)
> |
> | /* Target cache */
> |-#define LE_TC_0_PAGETABLE	_LE_TGT_CACHE(0)
> |-#define LE_TC_1_LLC		_LE_TGT_CACHE(1)
> |-#define LE_TC_2_LLC_ELLC	_LE_TGT_CACHE(2)
> |-#define LE_TC_3_LLC_ELLC_ALT	_LE_TGT_CACHE(3)
> |+#define LE_TC_1_LLC		LE_TGT_CACHE(1)
> |+#define LE_TC_2_LLC_ELLC	LE_TGT_CACHE(2)
> |+#define LE_TC_3_LLC_ELLC_ALT	LE_TGT_CACHE(3)
> |
> | /* L3 caching options */
> |-#define L3_0_DIRECT		_L3_CACHEABILITY(0)
> |-#define L3_1_UC			_L3_CACHEABILITY(1)
> |-#define L3_2_RESERVED		_L3_CACHEABILITY(2)
> |-#define L3_3_WB			_L3_CACHEABILITY(3)
> |+#define L3_0_DIRECT		L3_CACHEABILITY(0)
> |+#define L3_1_UC			L3_CACHEABILITY(1)
> |+#define L3_2_RESERVED		L3_CACHEABILITY(2)
> |+#define L3_3_WB			L3_CACHEABILITY(3)
> |
> | /* L4 caching options */
> | #define L4_0_WB                 REG_FIELD_PREP(L4_CACHE_POLICY_MASK, 0)
>=20
>=20
> thanks
> Lucas De Marchi
