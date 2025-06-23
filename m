Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689D8C77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 14:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497810E3BA;
	Mon, 23 Jun 2025 14:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erhqWTQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739AF10E3BA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750688937; x=1782224937;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FIXw7qXcTqw/x+W5hxOC70oEzblgQyIVT7MmJVsOD7g=;
 b=erhqWTQQlZTMcD09BNKX3CrNiJl6as6ldIGu/+Zy/l+GRKPStJkEPko+
 8Qdk1kHz83uiUnfoo16xDVGOGOVgIe772d5hY+INMsjb6IohQ6LtLoof3
 6o90qGXNsBpopa0nE7k5NljnZfpSFC7sQW9fhhbLMg3oBaGPU9V9weN0L
 HXzhIuun8NMbf81mqmErcM8GktYjHP3sWzMDPQK1XTr76Xzr3SldA4ZHp
 E0/7iclXRBpf7Wi+dB09sjI0v7Y8ZHDXF13jSMAeKc0HxgOJ56iZGJObZ
 dRMoI0it7AoXP1n4WIH/gTRzOH90p1bKqtb8UNaBu27WQbh6vKE6Ybazy Q==;
X-CSE-ConnectionGUID: hjyOoxDpTtaBa9/yd/GzoQ==
X-CSE-MsgGUID: BwQJHKxaSVCOpuKzjAD8Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64255964"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="64255964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:28:57 -0700
X-CSE-ConnectionGUID: Mwu0dnouQwuudMscT0IbQg==
X-CSE-MsgGUID: RO9fD4NSTCyjDNHnWy+ShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152130512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:28:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:28:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 07:28:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:28:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEGrcQ9jtR2xq7zamkvESLII+KaOwUK0WWr3HQ+P2jKCLX/CasAw3gMLyPfkgPDJDxGPUlgCnWL7uX4X8UOkFbC0wfUdyEpHPfG8ICDowXA82I893IPRzk6cQ+jl/f8abW7i9nDvQqgfA8CO7w+JTKMH/XZ+rOkbld63GJmd9yQlfpxBS04gttm3oJf6pCFETtwgLfNAIpQlHLAB8piabXoEcKsyB9S7OURyIVo3R+1nCIfUkbkk7WE47r7ze7cVuT79eAS+Xt55NfuvZxtUEisbTICFmyXoLHBdpMim4CIuzR9dNfrjlw/kPjQU2SDx5APnaBJNjBRWvPqARRqtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvGaeWqiQbywrnsPe/Ke2NhVzyrDewxeyvLZq3vMNdE=;
 b=Z/iXdXVGYswqP+nG4LIfpZZiL9gL+Nxe69rZXijOV28BSNpBlyPpswIGwJP20tQDqZcXkeR2pT3l7DzPiEsKlm+7VlMJFVzVm79Z1XlOI/Q+nKYVFWXlk3v2JRybXEDpSKbqC6f1ZVSbSKa/BxGHSheY3oLgwNhLeWvsaduqa2mgb8UYdCcxtDzXa+whxvVCKk+u2+aRy8x/CPHms6Re0l9rM993ev+MDQ1+McuznyWUQU/hRqVVBNwlS+tg1aSqcNh1ahPMXkCduEiHidAn/gqJUZwCgHcoZ3hPfO3gDB68Y4/yANmVIsanNA9sgnAu1Q5TsMVflwV7B8G1ZmTwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 14:28:37 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:28:37 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Topic: [PATCH v5] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Index: AQHb4Klw7LnAq+VUbESaDk/HQrSZULQQzcAQ
Date: Mon, 23 Jun 2025 14:28:37 +0000
Message-ID: <CH0PR11MB5444EF9D7CE464D3D3B5B908E579A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250618233256.3422319-1-zhanjun.dong@intel.com>
In-Reply-To: <20250618233256.3422319-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6575:EE_
x-ms-office365-filtering-correlation-id: 2053f62e-c21e-4f79-8c3e-08ddb2623e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xfgNnW0XKhpmPaYbn3Y9i/k+PfGm5OO8e0ggePwY2u61+Cri/mEXQX2uLhHR?=
 =?us-ascii?Q?Hxifdnl9P1JbyY4nbgTD7cDFlJtUHXbh8T/0EKvOMPhX66GxtCEntFL6tNk6?=
 =?us-ascii?Q?D/ZNlca1z5LI7AKjatblCKpy6pjmNzoG12PZxJv6P155fHVDYW511OUIrh6y?=
 =?us-ascii?Q?bAGGMl+EyPV1Ogy4ZkJT7w23jVRx9Q/iL434ZgGa+URGISxJxKKQZvtw2gic?=
 =?us-ascii?Q?EnFFsWnYux6MdPvpNay5Rs4bsPbP0YTWGjP4gDXy1tMJQKkjdh/8LK8asT23?=
 =?us-ascii?Q?jGFHn2PwwWmp+eGd6c/6XgeRdWmpvAPFVxFKB2zazkyadf90MRzKtogUCu0J?=
 =?us-ascii?Q?d1hTe7XSoXghPv/YCdo2pqlmdFOF641lPcTdm+7MVwtddGGwDoPFl/SdccaS?=
 =?us-ascii?Q?FHlvosu8V4k87pxL0EeVuWAKM1srIXb6wLjBuTUsMiuu050oHqxCKxwatj/v?=
 =?us-ascii?Q?KsWVEKcwp7D7mRe60Q0LEUPSmnTjeG3ZgwPLDkMmX7f/PEIfqnSKYzq0nV1j?=
 =?us-ascii?Q?vhSe1VHOYMJjVCAGXRFLCHwL1yOEyy6lC5nwPoeUh5wp4TA8BeDGBB9pZIqH?=
 =?us-ascii?Q?QBm9XlSs57wthK2tBQvrUYZ8wKEF9WdDubREgOgAi/IvPEcRRpO+zmuJ7anc?=
 =?us-ascii?Q?o5tx1ADMCnbrWBXef9eNjUyVLQvyeqljR+cOE3v/AInBubHeb18pQ/x5zMx0?=
 =?us-ascii?Q?axw9AlC/xLIO6+mfzW653oMo5D9yitQJx014CrX0SeZrMFuSzM+blZifU8N8?=
 =?us-ascii?Q?N8aG/h9sxXNwuDqsPcqMXDtQHtKGtDLg5uQmJgemhr2dvaLjKB0Ibs/VvgLs?=
 =?us-ascii?Q?/l2XN5VhrDDsnPybF3f8v2882i14nOO4GwQKL0N+u3PR8AEvtw8bgaN0E9lO?=
 =?us-ascii?Q?EKEElkh5AULD7PC5Pf5iFbxV/3SM1QAkDc3TyqsInSNwN7Sy0bOEZyBs2MKy?=
 =?us-ascii?Q?C4TXEExyAyl4PuYD800tbPKPXAM7Y9obJx/B8G7vSkiCsaD4kDf0aAQ+wSgI?=
 =?us-ascii?Q?OE31bmuEsoJ6mkvDTzaAICsWQdU7ICtgMnPBMy+MDiufXnf8A1z1t8g8YU9E?=
 =?us-ascii?Q?pM2RHL7cPCGAxEn3hTk4XDLkcrClSVJxY00ak9V7SqOySvv6XsghgYTv1lcj?=
 =?us-ascii?Q?FlIw7glC4HG7wWYgUWNCIXeAJPFv3fXwK3rcecn69lUHwTSjUvCK75cd4ag7?=
 =?us-ascii?Q?qtcYPclg1oHCkChSUqgnl9MknTBB41YR4cdl4k1nxyAsMtkFLQK4+YQujcGE?=
 =?us-ascii?Q?ZJ/JVJnotMsJ39OfdSjHto3eg5bA5hPxU7ri8zkW7TWANb7vAxsjq04bI7NX?=
 =?us-ascii?Q?u+B4BUIME+SzI/QaJ2KHXBe90MqayEyyfNtXHhG3pNbQlyyT7d7qvHLB/ZcC?=
 =?us-ascii?Q?lk/auh0ulP7dmsZrSe6KjjbkPQ6WoJfmTgQ9j1Y5HE2GQjfINWuiZVEOa5ql?=
 =?us-ascii?Q?6vaEDdhuC9g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nb74w6WPTUyl0N5z4sjpmqX/+EvmAYds7Xrp3h6kuMXp2U8mfDj+1Nx+ArNC?=
 =?us-ascii?Q?ZinpODhB+UvpaDGXhPnShtCditSlRCNnQojxpB0MM71/A6olT8Af3AZGiThX?=
 =?us-ascii?Q?+fjY0MlIZmBKn0CKFr07T3OssPrPSGJP90hEkjzwvTXPbKlj8S1xaP0c+XTO?=
 =?us-ascii?Q?NTRyU0pyIGcsCdkkXnW8jyTn9PltmevjnhbcdF1rUduvgxl63YdkOIvJ4tVl?=
 =?us-ascii?Q?uU4Oup/4RimLu7pnbfZl5mjg/lGPpUOZ/ym7VEk0l0TR21DSQQDhx5CSpJNp?=
 =?us-ascii?Q?q0G2fT5yL6+eGYuR+puh4K6VrfhVbF8KQpubsGp4zcKZnu0yaV5bo4pp/xmw?=
 =?us-ascii?Q?AHSiB1Gynb/92GrJOZfGnWTqBY1XiTDU/JI5NNK8v1819jgmRS+APJJDHxZm?=
 =?us-ascii?Q?W0xvlbi0uUa04NDzcF7fTkJ1W/fmxoqxjEIwYT6hzibyIa6MkZjnF1DTGw+i?=
 =?us-ascii?Q?H6ZYMg/mVl6MRVOdxug/HhNwT4dJvfDWxvbFbBUEkj69v9suuE+w790QUAXZ?=
 =?us-ascii?Q?GT7JnXVBKpa3sErkKeFg/xwVjEt/13ZnAfaUp4St6UsZ8Femv4+6p+hzCngJ?=
 =?us-ascii?Q?1LNKaOV3TzriLIzOPzKt6K6oznmLMxFw/0qU36hNJRlaIdguVcXiF2dGYbIu?=
 =?us-ascii?Q?b6uvfXPh3TM1pCz6IdyjsDpphv1sBEFp1AOVktR28Vwxtdm9Ccew7/lNv+E4?=
 =?us-ascii?Q?0hmKDotMSR5d6IUWmNpxTSjugNzo2tfDZDVig2sm4AReMG85/36ufTOffUxx?=
 =?us-ascii?Q?NGRom27P8ty1sY9dXiWksT6hE0Q/B8VyN4n2czsFzmU4CrGOf8GY2T59XDIW?=
 =?us-ascii?Q?s3zgS9Pq5eHVliuohqY2hKAcVgyiyEpO4KKXYSX0I0vX8wpQNsX1HLFMsWTU?=
 =?us-ascii?Q?GxYIVe/rfzZC669oW5ijrQmHVB/BB0dI0y2E56kiPJFPiZGd027a5WaDm01B?=
 =?us-ascii?Q?64/WNG2GLEfvznwdO350p+mXQUDc6wn7n4f2pKt33wrxuV6x4yCCGV2qIUW3?=
 =?us-ascii?Q?Kr7hwKTkAkTlYNf3sv4h2GkRBFTsFIfU6am/1eGbpHI13oNNJCJ2p0cQLnpH?=
 =?us-ascii?Q?epESrmguSOpqkmkkvkzB6RAD33/JpgujisVs6C/mowJ+dQSMaFDVrv6Y/yBL?=
 =?us-ascii?Q?9gzX19uOHVb2vKWM46b7/7mAK/7hzhO7AT/nSKWlLvaheE97+3OEWQe4594S?=
 =?us-ascii?Q?5n6PkehGWlwfOs9pxDfILg56Ox9si+Me9y3t6CR78c3uJZQTMXNdQtd5uNyc?=
 =?us-ascii?Q?+bZ2+UL9UMEaTF1HV7AkNIYAur8QTUeMMaFDl1pHdkg/wk/tITt0KFV+iimE?=
 =?us-ascii?Q?/+kniu2R1JcsfBgGNadKikMoXWYThgwpJR+hAydMgi2zd76JVR9aT8qhPg9/?=
 =?us-ascii?Q?myoVGUOauBWJsARTrRHXZuwS0vVGwqlzfRz7jEzY68WXb5O+EuWz1rFo+wtN?=
 =?us-ascii?Q?M/Xmjy/bEUGpU+kFHrsHOC6BokfWLFA8uA/bShCU3G0kjnV8FgzLzIk0zUJ1?=
 =?us-ascii?Q?7kbqZOApZZlz9FkpW9jccSMhk1NL0W+CeRQK4eG2D7lVeMdedyO8rig6kVcb?=
 =?us-ascii?Q?GlwWOUkEAo7Cm0s2otZV+ZSwCSItPdoZAjTKSVH7a6WbBc5xdDbDHxoGtBBD?=
 =?us-ascii?Q?4o/eHCj9TcMVenrw/suUsnv16eQMUQepR+qaJW5FT3Yp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2053f62e-c21e-4f79-8c3e-08ddb2623e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 14:28:37.3578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZE9yPSEPp5nxHOhrVrZpSKs/JE0okRPAUaNB0rNWI4WJiFJtG4ScMrVc+auN47RTNe5rMJeExItWYHD19/NrL/mdzyxeJTz3fkJBlPwWVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanju=
n Dong
Sent: Wednesday, June 18, 2025 4:33 PM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajde=
czko@intel.com>; Summers, Stuart <stuart.summers@intel.com>
Subject: [PATCH v5] drm/xe/uc: Disable GuC communication on hardware initia=
lization error.
>=20
> Disable GuC communication on Xe micro controller hardware initialization
> error.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>=20
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
>=20
> Change list:
> v5: Set wedge is excessive action, revert back to disable ct
> v4: Fix typo and add new line
> v3: v2 CI re-run
> v2: Remove unnecessary jump to err-out
>     Drop disable ct, switch to set wedge
> ---
>  drivers/gpu/drm/xe/xe_guc.c |  5 +++++
>  drivers/gpu/drm/xe/xe_guc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c  | 23 ++++++++++++++++-------
>  3 files changed, 22 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 209e5d53c290..9d7175b16cc7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1230,6 +1230,11 @@ int xe_guc_enable_communication(struct xe_guc *guc=
)
>  	return 0;
>  }
> =20
> +void xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	xe_guc_ct_disable(&guc->ct);
> +}
> +
>  int xe_guc_suspend(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt =3D guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 58338be44558..285c19929f8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
> +void xe_guc_disable_communication(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3a8751a8b92d..35cf67b2c2f8 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
> @@ -157,19 +158,23 @@ static int vf_uc_init_hw(struct xe_uc *uc)
> =20
>  	err =3D xe_guc_enable_communication(&uc->guc);
>  	if (err)
> -		return err;
> +		goto err_out;

I feel like if xe_guc_enable_communication fails, we shouldn't need to=20
disable it afterwards, as it should already not be enabled.  Specifically,
xe_guc_enable_communication fails only when xe_guc_ct_enable fails,
which would indicate that it wasn't enabled.

Well... okay, xe_guc_enable_communication can also return an error
value if xe_memirq_init_guc fails, but this is only the case for systems
where IS_SRIOV_VF and xe_device_has_memirq return true, which
isn't a significant subset of systems.  And besides that, if
xe_memirq_init_guc fails, then we don't even run xe_guc_ct_enable.

So, either way, the GuC CT shouldn't have been enabled if
xe_guc_enable_communication failed.  Ergo, we shouldn't need to
call xe_guc_ct_disable to disable a GuC CT that failed to be enabled.

Though maybe we need to very specifically xe_guc_ct_set_state here
to declare the CT as disabled to GuC so it doesn't try to access it?  I can
see that being the case.

If this needs to be fixed, then fix it first, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> =20
>  	err =3D xe_gt_sriov_vf_connect(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
> =20
>  	uc->guc.submission_state.enabled =3D true;
> =20
>  	err =3D xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(&uc->guc);
> +	return err;
>  }
> =20
>  /*
> @@ -197,19 +202,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
> =20
>  	ret =3D xe_guc_enable_communication(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
> =20
> @@ -221,6 +226,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(&uc->guc);
> +	return ret;
>  }
> =20
>  int xe_uc_fini_hw(struct xe_uc *uc)
> --=20
> 2.34.1
>=20
>=20
