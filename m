Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C053CC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 14:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0810E9C8;
	Fri, 18 Jul 2025 14:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GD2KkwRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5990F10E9C8
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752848884; x=1784384884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sMjLqdTrfmss6jbDjJKc22iIYZ45gY/gzOKSyL5PEjI=;
 b=GD2KkwRo3jTf2gJzF2wwpS2quaNWhmt9bJz45pPrh8kB8lMaqFomCqHV
 lSeIQbhlvQ0ZiO3Bdb0LrPXrfvKGRVNX47lBo25ThZa6E607CIRPlDgDP
 iV+tuFuiCqrstqp3krh0VgHt1DIYz03a560Q3C6OzpnwCVzl3aMYjLQ8w
 pY/99xKNtd0xal0EMz9ZpjHOmiozqS07icYWSTcGgXzzFLNBKY7lMeHOj
 xnkuObAMbaP1q3a3o7HchEh943OEUqPVg4LiVLhKaeqB8evEkMy2Vo/He
 tgCwCugkQIcy6jjRrcA+hqwB8Zp8CgJqGufaxp7K3jjbLVOdG3u6FNaVh Q==;
X-CSE-ConnectionGUID: 8bucR4VwSm+pIIvAa82LVw==
X-CSE-MsgGUID: R5ZqwR2FT/6mPCCv9ShqVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54856346"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54856346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:28:03 -0700
X-CSE-ConnectionGUID: xmCwpbHAQm20dRQEWcXzRw==
X-CSE-MsgGUID: L8Tz6KDnS9OT7h8FsxCUIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="189025675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:28:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 07:28:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 07:28:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 07:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smofSN/pEzx16UNTuGfso6PwFkIm1SY/8RmOoDn/nRDIYgn3a4hISCQ/hE3M6WNx7Neogy5QkoESYlni4V7AwALXI5pAue5HQmVY0O602csFnFJHBY5h3YJIyzlqVzjMa2XVOZXtsI4gRNdJyMD7BeXxAOc+iER8kl3zACd3yWTKQHPNaPVkA8yOgZVJP7KMuoXUtG/1eaMfx64bmmof41InuVUqFhZa5nxXKUEDtftEbUDB4sddGPsktbfkcgzHBkfIvWK+uuWQVOabO58DwdihxeIKyLqlEbpkzVVhPPCOnjwuAt/ou17+FsEeWNjA+JiTqE5dmmflF6G2w+dIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz6AvKWBR999ntEACVU+v1r6ztDI4tIGNOIXcbsLR9Y=;
 b=JWk2Ol1icptPYQvCB08l9OxhTBfrqtd4iTssskKkmi530GToqhahJz+64u2Qs4Rz11lvmKQX/RJIZi4g8MFTnxabf9Ko4H0I42Y4ey2aRX3tl8SouqFsThUTOEEgMbGE+hSe4tG1CXi0kChk+rKzRvS8Wx4P5WdHgZcvu8H3sH7XUrjqJQRCyU9b5GLJO1SoDRKMly/uWumYjFCTuNDl3yv5/4zbla6SG8BfDMp3PK9/ijip32/IbIKzRf0gUIn0gkfUYYUHN0ijD8tPQhBnRv3J/UOcqokZUWsCL9staSStJ9rwpBpapY4Ww+lzLi8rrKztv3WR0RFGbKCBH5FE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 14:27:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 14:27:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Thread-Topic: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Thread-Index: AQHb90t5TwDjmHk060ODwPb6lYwj1LQ2y75AgADSrICAAFBMUA==
Date: Fri, 18 Jul 2025 14:27:45 +0000
Message-ID: <CH0PR11MB544405DF502241716CBE896EE550A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
 <CH0PR11MB544431B55F24E0F1688393E4E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9f8bb67b-4381-40cb-ad02-6eaa4b5f94e1@intel.com>
In-Reply-To: <9f8bb67b-4381-40cb-ad02-6eaa4b5f94e1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7264:EE_
x-ms-office365-filtering-correlation-id: 0a97febf-a5db-45a0-a4e1-08ddc6074396
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IkW05TQAX1fqRmxqvc3SsciHcz4k1GP9ZiIBGJrOPD6ZMq3k4fOGD3nr369s?=
 =?us-ascii?Q?E1nMn+qZqqRkThcfv7cFZltcwEtiJzNViSAWA5Jpa6eovbys8Y9m98pEav/G?=
 =?us-ascii?Q?7vHBcFkux2jrQ2Ib7CPYZgs9TYqTJ/9hSQbOJK7xiUunN0UzL8Y8P5mAZNCw?=
 =?us-ascii?Q?RyXH3y5BAfvy1UrQG1iBD+tfnbE00uMaFLp+gQiJ/bQpYzdLinSXrL5tX1Xm?=
 =?us-ascii?Q?664bgNFtzcIA+VvsffY1mKO7GZza4ByukPNMpZngaKWhdaDZA1eUo9VQsC8c?=
 =?us-ascii?Q?YickOrkhNkLjOdzO4Z/64k5K5UogVwU5lP6PLf1H7xTnbBcJ6Rj0Mgb8CJkv?=
 =?us-ascii?Q?s2ZvFOuVwT2E5LHgFFaqSmAONT2jo7eJ/Yo3bOoZd5+AkBd+XC9k86SdKDLf?=
 =?us-ascii?Q?5rN417CLbGLPeULG3qjn4/G8doQYlKUB3Jt5cX3L9NL4nly1Y8KtTtQ57MsV?=
 =?us-ascii?Q?7XCF8BcZ9QvU4d/WMOiS5IYWWLcKlfTIz+SoUYsnVpgAmPilXY9pAJbLAxGe?=
 =?us-ascii?Q?gwMWPC0wHAKrYPjFQjx86p2o6ehKovwQl4txXkSiIkEoFKwHSGLC5oFtpZKb?=
 =?us-ascii?Q?GqPJIU+nHSUjYpHOBzzB41WTnWxbFgJX8qvBHgf1ijGj6PIsLEeal2FSZa+C?=
 =?us-ascii?Q?pYl89jGe3YM3f+pElhtWSPoVRIqmWBiFTnTnko2ElBVCx6F8O4WnrkZ18Ifw?=
 =?us-ascii?Q?Egl4dJ7efHx6r3VwFaBNyW1qYMPKg1K0QNTAoLiQovroWkd0Srs1WhsLu13D?=
 =?us-ascii?Q?mKejw27814aHEu3PaGTkPsn6/tQw1qogQa+3pGky4P/2sw/rGoM52xpJhLI3?=
 =?us-ascii?Q?BkYmTgztt4j+REYEa+OjpxJEixagp8TEOVixrZ/Vo/qi2ZkzbnKeL1QZFMhf?=
 =?us-ascii?Q?zB+M/8lOlbq59ItIuG5c/l7SXscxMQdEnXvaOlRmZ1XExB8NIWEsHxSy/SmY?=
 =?us-ascii?Q?ZVJR4V5mdNQooNUX4+pOSlBbqdahBDSI/bTd8YMfWgiDi1CxryOZUzBAr+Zu?=
 =?us-ascii?Q?6BiNFcE6Ouw5wWPXHVEyMhX53KXarQLMUgiwLWfnRLbkATB7Qu3k/88gZO15?=
 =?us-ascii?Q?t/M0LRPHIw4Xax2u8gzkmf69iM+WJQU30ouDHJ/fcxmlL+8QPBXzu2LTpdTg?=
 =?us-ascii?Q?LoXgTndz2LFAZoNzRK4PhklBxND/tczRwoYJfo0wZSgIdlQqoi5PsHD+HD8a?=
 =?us-ascii?Q?Pz68mj2QD8wHNYvnXUn3WiVe3A6US4JaOXpOV/twV5D8VpUFyOu800dDoJ/J?=
 =?us-ascii?Q?U+2Iimt+to4wUJm+HDGxa2e6LfA/d78EY93ALIKhyV2XKi1mnUVjKl8flp6j?=
 =?us-ascii?Q?F9Qo6a9CtgZ6oBsXpbUc12IXhJ2h+MLaCy7oERX7B3sZ99b7W+wxG3gsIIgn?=
 =?us-ascii?Q?AOIqYxX56Z7wi5z/8r2KmEkxzJCg8/EYBwYoUOWNZ6CCld+Zu0SLeWqPlna1?=
 =?us-ascii?Q?aH8at5aJHExQsw8lv2oFtjkejyIwjOSfTCZ7Oz3q/gjUoeD6wjvXGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e+2Sbhb8/zDf2AKmdcZatSNYkEvAs3L7+UBNtbkN4XbLxM2PTgIzVrX1UiTY?=
 =?us-ascii?Q?3rxe+vJMdYgkLSQ2PssaUKHrhRunMZVtdiWZbkibVY4bRszA7YmxaAD24rGq?=
 =?us-ascii?Q?V5I7z2fkC6vdR1Dbaqftqh00kscYapTH9oXwFmR/46dybU/2Aphj2OdkHuhB?=
 =?us-ascii?Q?V1/lyZRiKhr6cUiUICpYakI/IklJIHuwUSoHLzVjmZy49EckL8AsuuicJz3j?=
 =?us-ascii?Q?+mLhT7QB5Yv4BHaadF9Ss5/8c1C4HbDiXYWVJh32SMmOkqjEpWp4HhANDzLC?=
 =?us-ascii?Q?ZWjjmB53uueNrxcA4LktM4tAmuhY5bPChrO4mHkgbb6c30vGpAvVAlFNdCy1?=
 =?us-ascii?Q?37RQyc1z3iUVbCTuUZ9jEy9MT78WSiar7jFU0iuu29ll7hdAnpDAJ1Pp+0fK?=
 =?us-ascii?Q?5wQp65PH/y+XTpj+1oXyDRH3/EhXUEXDWqWz3s5E8gSb3Gw06QH629kfqS6m?=
 =?us-ascii?Q?XA+RsncbULWUx0DgulH5K+KxOgCchHxiPiO4YZn3SKO/z1deGhQktmeXdkEh?=
 =?us-ascii?Q?NsSWznJFggnzFswtbk6HmTY1bIXIsaIKZL51gHazT8YmiRkGrarwuAlXdsLN?=
 =?us-ascii?Q?Vey1w+UUxmjwiN22k5IcrCuM6HWU6rIRy9DApU7VlUQtiA2n2MoWhQ5Dkl/o?=
 =?us-ascii?Q?T2yGCVYhenmht1Tw0IwIT33AkrNpEkPApYIJaRAKNQJ94HzDuGpp2J6AO0+C?=
 =?us-ascii?Q?TGpEGCeQKBbE1zsUmvBfzMcAQMHzZdq5Lf324Kn4JactUqixpHmY6XjF1yw7?=
 =?us-ascii?Q?b7TohiXt3euXWjcAqUdGjHdPQmnu4nnnjCjvr1kNfHlaE/S7gXKl9y1de1pn?=
 =?us-ascii?Q?42DMJ1V3slRS6Ck9/ScwWDdbgFf348sWmNFJ51WTjNbVN6+fgp5qsIOOKWii?=
 =?us-ascii?Q?MnKmcrVR2aEjQp4x9Oj0LpoUEOmpUrcTgVgbhbODdOfmOSWnrkSYA/2nVL9g?=
 =?us-ascii?Q?jY1tw09CsbUwUt/0cRxkfdyCYW04bY4ZgjJavkheWGqo43/j2LP7M+SPvJv6?=
 =?us-ascii?Q?bfjk3Ik1JKHZQs5SqhVsvd2W0xhJpOKKwToCT+/6Jno6SZtP3u6ObcHaGdwh?=
 =?us-ascii?Q?FAqPIxe9WU1gqcViLGspfAElm1bMgf6s7UfO2UaZ34O9k++1K4kLWeof1q16?=
 =?us-ascii?Q?Jjw7hFdUW80cFkLBqJ+lR5Lh5JwtPBYy6bO2w9hLStUOiJgDd64S3a9oQBEb?=
 =?us-ascii?Q?fI+vZ6q1AOW4siLNm+71fjK9CBx+/EYZqvnDV6M9epxOFdullXia0glNxCaN?=
 =?us-ascii?Q?bqPnO4opDE/X5QbE+rIvgTlb+FIwbR55LtCTIgb96kURIEucw5RrlOTEyPdw?=
 =?us-ascii?Q?uMr7X2iQFEldZ9Z7cuzILBaRktJ5cLmTL/lr2bEgLqsoPX1HdSVN8wVuZWT0?=
 =?us-ascii?Q?dCuM3aX6SRaaiZ4oCr4FFcOJM3vLIRbogInDwqGlNAY18xTRwdQxx+xCgBFT?=
 =?us-ascii?Q?TYbAhw1c2Hr+LVe0uQbiYOG8bUQ6Fn706g7eDZBlpYOmYjT/TCy9Lo8Ka0zC?=
 =?us-ascii?Q?jjHiINCq60CY+ZkzWWwarqa7aRmSv0KalIvgNB1PT2wSsTMfq0jrvok7comn?=
 =?us-ascii?Q?GKze5+rFQOJHT2HDk8v1qI1gOZD38Sugcg2/3SmQlp8dGfzAlsinMvPeIQWR?=
 =?us-ascii?Q?42Ip+PKCAVIBW4husSTOBfTDBp33Sd9I1hcUIScyP34S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a97febf-a5db-45a0-a4e1-08ddc6074396
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 14:27:45.6892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yI8Df4sulhVBx0HUlS2myyRPugAbbo7gudKmdgAvZRdIuViOIj6ieWa3t5ZrSgGHURzBnF3MPa1rDNaksW2TKNL4MKa33+gmCzc8vYZvGUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Friday, July 18, 2025 2:30 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Int=
el VGA devices
>=20
> On 17.07.2025 23:19, Cavitt, Jonathan wrote:
> > -----Original Message-----
> >> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of M=
ichal Wajdeczko
> >> Sent: Thursday, July 17, 2025 11:48 AM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <=
lucas.demarchi@intel.com>
> >> Subject: [PATCH 4/5] drm/xe/configfs: Allow configurations only for In=
tel VGA devices
> >>
> >> The Xe driver supports only Intel GPUs devices that all are PCI
> >> VGA class devices. Reject creation of configuration directories
> >> for PCI device addresses that are not Intel or VGA.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_=
configfs.c
> >> index 00bb4e412c12..1df8cce78f13 100644
> >> --- a/drivers/gpu/drm/xe/xe_configfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> >> @@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_=
group(struct config_group *gro
> >>  	struct xe_config_device *dev;
> >>  	struct pci_dev *pdev;
> >>  	char canonical[16];
> >> +	bool match;
> >>  	int ret;
> >> =20
> >>  	ret =3D sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function)=
;
> >> @@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device=
_group(struct config_group *gro
> >>  	pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, fu=
nction));
> >>  	if (!pdev)
> >>  		return ERR_PTR(-ENODEV);
> >> +
> >> +	match =3D pci_is_vga(pdev) && pdev->vendor =3D=3D PCI_VENDOR_ID_INTE=
L;
> >=20
> > This match check is relatively short.  Debatably, we could just do the =
comparison
> > directly in the if-statement instead of assigning the result to a new v=
ariable.
>=20
> what do you mean by the "if-statement" ?
>=20
> we can't return early here as then we would leak (again) a device
> reference that we just fixed in patch 1/5

By 'if-statement', I meant this one lower down, after the pci_dev_put:

"""
	if (!match)
"""

I was suggesting that we could perform the check there instead.  Something =
like:

"""
	if (!pci_is_vga(pdev) || pdev->vendor !=3D PCI_VENDOR_ID_INTEL)
"""

Doing so would eliminate the need for the new variable 'match' defined in t=
his patch.

However, I understand why we're not doing it that way.
-Jonathan Cavitt

>=20
> >=20
> > I won't block on it, though, since clearly labeling these comparisons i=
s important.  Though,
> > perhaps we should call it "op_supported" instead of "match"?  I underst=
and why it's called
> > "match" here (it's more in line with how it's used in patch 5), but may=
be this check and the
> > check in patch 5 should be separated out?
>=20
> I'm not sure that adding more flags variables will make code any
> cleaner, what's important are conditions inside, and yes, this is
> aligned with next patch, which adds more conditions to be checked before
> we can claim that there is a "match" between device address and device
> class that we may support
>=20
> >=20
> > Just a suggestion.
> >=20
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> >=20
> >> +
> >>  	pci_dev_put(pdev);
> >> =20
> >> +	if (!match)
> >> +		return ERR_PTR(-ENODEV);
> >> +
> >>  	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> >>  	if (!dev)
> >>  		return ERR_PTR(-ENOMEM);
> >> --=20
> >> 2.47.1
> >>
> >>
>=20
>=20
