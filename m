Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65746C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0810E199;
	Mon, 23 Jun 2025 06:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvwyFEtQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E32D10E199
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750661492; x=1782197492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TSr25Isgk7pKJs9MgOoVJosdOntCEuBGG2w4+92EaNQ=;
 b=AvwyFEtQgxWDMd1DiR6D5GbMJ8e3bYdCmWdfy1UM1i8HkloIVutlxq4b
 SDMGMaHqc2zcInUTBQ3JtOU3RmsHRGNh1iXpcbO50J1LMcPhCEa2u9se+
 4JVa018priUNgm8rciE0SelfTQkDdKWLublI0TJzMg9s5U819UfjecJQN
 1OE7CJ6XF2ck7cX2tnYrKpj6NDcpDwqaov8dwU/HBHCApiV/T65YpQOcc
 SGKyVm0i3YsXCqar7zVLzIkCOBJXLICIcpSyO8Mom4i254LOU1UxFqqBk
 2Q/bJwLVAawTl/UXcQs/xufcVEeICUZbdOSYHyp3E9obXZkVkcSO+mGVZ A==;
X-CSE-ConnectionGUID: jZOcH1TXTTCrBeg9onkOpw==
X-CSE-MsgGUID: F2LhRYgxSl+X412RJ1FTYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52722288"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52722288"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:51:21 -0700
X-CSE-ConnectionGUID: 0ADIPKkHTUetXbBepU247w==
X-CSE-MsgGUID: ijVu+nkESOui3+jEYM5Y0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151656924"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:51:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:51:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:51:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBVe4O6lZWvZJFzdaxRcfAlKHbZxf6uph6zoiRs1JxvA6X+F7e0sXCyVMMehFcnSNfX2eAPBiu+gZLjL+fTCEMEzufXRo22dUIDvinpPhMxxtW0GGOSynzdkKQEKw4HRmPBLEXiNvMtLgjLjUnkKBqfFkL6ll3MouEFIeIdR6X9WBL/dsgrJmWkN6jUYhJpxGCu/C9sRBUbjAON+7N2D5gDDCM0q81TgKvSnXoCE5RmZaljIpv3c85zvwZTZwX3A8JeJBT72wy/QOjqsYNd4ZeKywqYWbJMuGOGssjjPe+SiHg4+rPOlHzBoXaIiuSsMc0vX8liffaMHWN77IjoyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv/zHHOcQYnVazAyMMpD/3PTDWFRbn6UwVPqBLVlb2w=;
 b=c78LYDdE6DV8/zILmmy1rcZ5k3zdxmQJOmR9AWL7/5lcGwJi07CoaJy41Df9pryEfmdUrhSh8z3Vs8bBMVDIvNMuGAi+UUp5o8J6/UhDYlkMvw96+IZTX56DM81ldrj8pCenAUxust1HmoMsdOvlTHIH24pq0kGraIxeEpE3IHPU/zYoCksSPoHHSrlN9xoXdMRVkl/3NAfwzDC8sR+zHyTADRxn8/mqWNeT6HCCUWopmCtwfjKg+zttFoHYd7n8LBOOp9QgSrVibPnITuI6FUr8Xq1xx1hKdXj1Xlqu/KdOzLq52VpvwiotWe4KDUTwrbFPepynKuu6UH+qvN6pkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 06:51:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 06:51:16 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Topic: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Index: AQHb5AZdlJo1mKZaaUGoE3x4RkrGcLQQSOIw
Date: Mon, 23 Jun 2025 06:51:16 +0000
Message-ID: <SJ1PR11MB6204462F37586ED7A73C2A7A8179A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250623064036.785908-1-nitin.r.gote@intel.com>
In-Reply-To: <20250623064036.785908-1-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: 5d3b3f61-fb86-4371-06cf-08ddb2225a2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V1LqEq0ijFAoULtwuGrXeL1ePDNLyLI33amRUzYZKEnUGqMtNmJb9A5aE4PP?=
 =?us-ascii?Q?ImY28YSJV+/BunQTeIWwC/fr4dNfJz2IU8Kunp6ALAlQYBDpl7By7Oi3MsQ7?=
 =?us-ascii?Q?knGwtzJjqmKKBKG62jyFW4QyCXW+8sG6lTtn7qe/KBC6Ax4QO7JJ2b9IMfKB?=
 =?us-ascii?Q?Ehj6Sb2ckPMNY2+WtMheaR3OfZGDPCVfBRPw2QKEt4NIEtPHE/8ZAb69Hfxo?=
 =?us-ascii?Q?ERia6MJ9His9GC3DF1ilqqROOzHiI0YoF+gs0UVmgrishwZr3PeV21wE9UF1?=
 =?us-ascii?Q?u/0ct3tYMcXmipALKc2Cb3vA0Qz8/IS6CcHtGhJIjvhf3d7qy5qfdHP6+Tj+?=
 =?us-ascii?Q?e5pGvy3MlqKLeUbRS+L/5dqVq4Jtm1Qqo2Hs+sArwQrnEcx+6SDUgDpngmGv?=
 =?us-ascii?Q?AQ/oCYtirPscK60DnjwKor95cjr/9Dnb2zq/OujSdy0/gYXZl67b0jaXcyLh?=
 =?us-ascii?Q?ooZFhJfEIHf0cvSDyATOMb6flyj48ISr/M6vfRqCG1yHnzI2HPXQas3NiRpm?=
 =?us-ascii?Q?3lGLGqRdcyCla/oPOMmG7fFkNV49mWguKHyICDl6nf/n/M932T18sXgsHl0R?=
 =?us-ascii?Q?s0rTVibcLtB+qAiuDq4pCHSQ4ygjPy+7O1CFzVD3CjARpTC2gGvBSNOcGkAJ?=
 =?us-ascii?Q?MqvnHpsCyJ7i4O1/Un4Ie8IFCZRWmVhCRTjBMoovfmTyEifETq8ncA+f3M05?=
 =?us-ascii?Q?Ku9BGPXtqLK0YjAQc5LKGzPbeeng0qAWRQcIoO1ya0hLjqe7I1QqIp1e0SXD?=
 =?us-ascii?Q?/b63Q70hE2t2rWy8SNLZHuY6X7w/IsXHUAwYuArOigATsj3y0zpXI/bCjHi4?=
 =?us-ascii?Q?xgWIjCCK/ODIxX/YeU/DvMSsHZE1yCK/LiTrXnilYFa+MBr8CBt9NAM+vJhN?=
 =?us-ascii?Q?nL04HrySIWCTTMGSlWUsmDb/DcV3soWLvjSfWk5VxGZV28KoyN1x3BmysBtS?=
 =?us-ascii?Q?n+FhROZSDDzkxS4hHpTbP5K6T9av55bV/6R1tfDnCFYjrJOuYsUIAndwQC4P?=
 =?us-ascii?Q?F9XS35rJc1dl08VCX3jyCqAz2pz6RSb//Rc+SOs+g7eDTs5QnCzg4tnt1KyZ?=
 =?us-ascii?Q?4w3jFXGIf3Zr4AN/7O7qQ0ZHwyBkb8UtuxsEGcGrwqpIRUC5pPBZTyA6nNRP?=
 =?us-ascii?Q?UaKEzBOxGbvv48J+Io5s1Is9fhpHblH5dOx2qLtQ1Cto6ZETUTgHG4R16Q/d?=
 =?us-ascii?Q?eGiQOD0QdzKPmn0j+gZTz5a5Qge3Sf9fDPzStK9l95rhm2RZWoFns2KHaBvh?=
 =?us-ascii?Q?XvwyLzsmBQzGiNWKj3GxeDfQHOG9shWR0/6zbLzWPfkiWFnhzUq8uNkad2Zr?=
 =?us-ascii?Q?BvPevizKAz0B63hlGPY4New78tRvwBg47DJ8VkB7xwBAXeVI7T/mV4Io1gmg?=
 =?us-ascii?Q?Pg6HZsI279np6nt0YKdb+EUIUfM7c9DLQeYlQjoHJQ+rAFGK4hc5nJXgky4H?=
 =?us-ascii?Q?HoF+TQhT0Mtgvdi+sY0hS5QhJLDiYDmW8aFen+fT2ROGgNI/HPfkNAgFBoKT?=
 =?us-ascii?Q?ae/kg6iiuZjQLiY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u6A37vpOboFSwWrqzFnWSPA2sGGwovPyATr81L+UFF8wST/CHH3mZOLWXCIh?=
 =?us-ascii?Q?fmxQXz2HM1MKX7ynK8yn8IKtiaM021+CAndBMK8YNGoI9GTlj7lDTiXzJX7n?=
 =?us-ascii?Q?7sW3GdOfh3QaBcOEb/eKLHxtegP4l3KFPDKIef9yiywUEtMutooGBJuFSb8y?=
 =?us-ascii?Q?UWbKe0vRU94lmtD29HWx+DlV4qn8m/HTkTxufnibiMfSTfcRZzdkl3Bo4oqa?=
 =?us-ascii?Q?Z8HaQ0iqNY6aqqLpWh8Vq9BccngDoVGNpGbrhqAnTJkzWf0bgA3lkSIaVWvh?=
 =?us-ascii?Q?ZO/mDW1UYOBQ1mid1KRrXrtQY6y7VMcyioqLD18gOr5+D/uHjTZtT5xRNpYP?=
 =?us-ascii?Q?PVq2ccrpxXK4uQT0uLRP2OYsZNFJ1n2qIPJUD0WErk/wC74mFJxbaCQevl+7?=
 =?us-ascii?Q?XGG7jx6fUsTP+Ueg+z79VVr6nRpCtiURMKIAzWS7wwIo1wrlV7S4bVUNc1Ku?=
 =?us-ascii?Q?kCbMqnznuaM5C4fs5fJICj4/heiyK+35ThBwugkWXz3LlpdNf8Ohd8D2E6ro?=
 =?us-ascii?Q?pw225QAyZYoQqWgtTD9BIsicPsCy1nvThFs7WR3x1pA3iQ2kDcdC+oYP+RFX?=
 =?us-ascii?Q?15qbd87zbgsiUvqpJEK+32NaO071vDeoGhWfFHn57ukK5Abr1zvadMMfGUDz?=
 =?us-ascii?Q?2GfMd8ZzXTyzzkIFGF79bKzbI0g+j8yHgDnRSxVe7iPxCSBkXKrcXMQD4bzR?=
 =?us-ascii?Q?of2QMVlpPw8ijJeFIE/1jLsWUMTxPHdfBuBpUdW7+SI9Tt3Eokryu9MdVvld?=
 =?us-ascii?Q?a2zYHKw8Mlr/2iL5fMvueV0hAamADBU7l6g7d9bZQr6U9nx/QCFHyLYMXRky?=
 =?us-ascii?Q?XI0WOmoywgNytGNBXyjDMUd+NSEdfIikcCkNoCXyGc8z+8JGfWvKKp9KIoEP?=
 =?us-ascii?Q?klsm1B6oIMdVvJwMGM9NHyEJmhLpPOqpLwv6FHR1V258LE02Iw8gsSQmalwj?=
 =?us-ascii?Q?/bYijgoUphq2216ZS7JhY08zI5EkSYV7q3Juw5aybLU8hG4gy2AhfadaJScN?=
 =?us-ascii?Q?G0WUgPgYzeV6rm5QPGCzMKF1/d/FTVX/BbXqU2UWRCKyTTH9pwN+llEKgH2Y?=
 =?us-ascii?Q?5DxzQVmF5jtgZbkaENnmyvcemRsxg3r11jiZPDFy5Q8TAvaZq0q5/TY+xB+x?=
 =?us-ascii?Q?dyQqVDeheU7x9X0cdyPXvakny7c3kpuKReQHn8V3R7gCByHb5BM1diZv8HoG?=
 =?us-ascii?Q?jnMd/imoUgMUsL2CD6ka5NPqDbKYLUlfAQdqmxJ/6qD5TX3PO4RTUFmDTLfv?=
 =?us-ascii?Q?j7w5R/GSO1kRET58ew9OAsI0TF/s10p4WeQzudKKn0h4o2jHQJnhJSPK/j0B?=
 =?us-ascii?Q?Z2+0M78MUb79cue4A0OlVa++kSKUU8ocQlZyhVpofQthlkwixKGLVpl0MrOk?=
 =?us-ascii?Q?4GvDYXQ4+m8tW2TtDTlUxaPHqFx1+03QkLonzANntuEAOKNpoWuc5MFQ5XoA?=
 =?us-ascii?Q?uCttjgiCqRJmlz36Njm26NixY1c3CEY05yNjt3pV1zwc5x3lyJFpytMOLcVj?=
 =?us-ascii?Q?k/nlclCKEb4xARXTtQ4ogeVtmFfeXTRshpg60MMB9Ha4Oa9uU8WjIucdD8Th?=
 =?us-ascii?Q?1oIeTEy4x3y9vaQyINNLR0HljVgez/0q2oHlknFYxeqePiGxD/hKP72BD36J?=
 =?us-ascii?Q?5GYhpS9E+3bxXxqRr3F9AdknS+7BGJK09VoDlq5yI7cl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3b3f61-fb86-4371-06cf-08ddb2225a2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 06:51:16.7826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1F9XwGtc89PoIfh2LWxalfMn+bXJWuGhxaXsQ59He1VKXYHLgpJYFiJ5D1HQbLsZjPggmlzYzbSnqEdnrZ38hVJovCKAtxMCQsa71xljzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
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
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 23 June 2025 12:11
> To: intel-xe@lists.freedesktop.org
> Cc: joonas.lahtinen@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> Subject: [PATCH] drm/xe/uapi: Add
> DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
>=20
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device
> query flag which indicates whether a device supports DIS_NULL_QUERY
> (Disable null anyhit shader query mechanism). The intent is for UMDs to u=
se
> this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to disable
> null query mechanism for anyhit shader by setting DIS_NULL_QUERY bit of
> RT_CTRL register for Xe2 IP.
>=20
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
>  drivers/gpu/drm/xe/xe_query.c      | 3 ++-
>  include/uapi/drm/xe_drm.h          | 8 ++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fee22358cc09..519f36db7cd0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -26,6 +26,8 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  #include "xe_pxp.h"
> +#include "xe_gt_mcr.h"
> +#include "regs/xe_gt_regs.h"
>=20
>  enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_JOB_TIMEOUT =3D 0,
> @@ -693,6 +695,13 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  		}
>  	}
>=20
> +	if (((GRAPHICS_VER(xe) >=3D 20) && (GRAPHICS_VER(xe) < 30)) &&
> +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&

Some other bits can sneak in, I think you need to something like args->flag=
s & ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY=
). Also this should be checked first up as other flags are validated.

> +	    (eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_RENDER ||
> +	    eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_COMPUTE)) {

I think there is API to check render_or_compute()

> +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL,
> DIS_NULL_QUERY);

If this setting is effective post xe_exec call, that is post queue executio=
n then its fine. Otherwise need to find alternative placement. To me it loo=
ks like placement is ok.

Tejas
> +	}
> +
>  	q->xef =3D xe_file_get(xef);
>=20
>  	/* user id alloc must always be last in ioctl to prevent UAF */ diff --=
git
> a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c index
> e8e1743dcb1e..c5002b8c9ac0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct
> drm_xe_device_query *query)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
>=20
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +
> 	(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
> +
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> 8e8bbdec8c5c..a5bfba121360 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
>   *      has low latency hint support
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is
> set if the
>   *      device has CPU address mirroring support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set if
> the
> + *      device has null query support for anyhit shader.
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -415,6 +417,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> 	(1 << 2)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> 	(1 << 3)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1271,6 +1274,11 @@ struct drm_xe_exec_queue_create {
>  	__u32 vm_id;
>=20
>  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/*
> +	 * DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag is
> +	 * use to disable null query check for Anyhit shader
> +	 */
> +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
>  	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>=20
> --
> 2.25.1

