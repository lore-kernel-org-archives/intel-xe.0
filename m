Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1ACCE8D6C
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 18:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CF310E265;
	Fri, 14 Nov 2025 18:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWZwhpls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87210E265
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763143782; x=1794679782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yjbkPkQi8LCAIWOC9mRfkcSY87k+NFOAlTqIGI302Kg=;
 b=OWZwhplsiM6qvMtZ79JwmmuIJ16+8TCvQlP8zru2byyeWctK5aSKY5Jo
 0rW8xuoYPK/VA24zmrNKDmN3XRslG+m4LQ/tN6536x2sgDvkQOKeN5d9Q
 ExQjTAUXe6nUspmcxczgb4dfgPKGL29AS+cfrYg/ze0DOSJERek4jURTs
 LYYFR08GADZqLz5sWCdITKxJETaKjtxJKk7HoJdzW53qTNrf4Cc/hiwnY
 DhtDhk8z4kROHLkfB8RZbSSqu6JR1V7aznAO9SZz13pThTUStwEHK2qYp
 xt9KRlziJbMw4N2r+izPJu+PJWbekTsDPFPdKk0xQFD4Tbn0j3qo7dAtF g==;
X-CSE-ConnectionGUID: VNx4yFCcTgmBimTGfuoD7Q==
X-CSE-MsgGUID: uF+rQqdARI6WrCnh7Bo4wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65399995"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65399995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 10:09:42 -0800
X-CSE-ConnectionGUID: m0zRglYJSS6SUy+PR7gJAQ==
X-CSE-MsgGUID: IzRpWiaLTaeqCSP3//eAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="227177070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 10:09:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 10:09:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 10:09:41 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 10:09:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zh5Nw+dPQY8H6evR5iE5Y/Q31xvs8Ng8P1ZT2AA27akN+79SZ+3Xbdi82DKDZ9zdiH8Bfv7l6rELfcHu9JAW6jMKWsCNnPKd/lTW8YlxKhEbsVUKBZ6fsCJ6ShIT4Xp1c+sZK8iO30MpPjTGq7GH3Pjnv8oMNT1tAbe2QZPEq7vezENHqWIkHZNI6Vfz81ujZOPrGRxEBDE0C4SVYi195EvoiW+VM9mv2KHQ4haeoahaB688NLE0xti1/Nuygqw3ZKkDK6BHIP5KzvH+2qsnzsKIOUo+uFPXfe3mtWeglS+W22cq7dY2SZrF6KnkGxMvewQCvVK1i8BD2HZbUC4O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MILto0ciC0Krd7137InMlEM3lM6nGsry5ennKP8V8pI=;
 b=dImRQ4lix1Izuc7xVUnEkU2dcRpJ0d1VXBMqwb4yFcRKgivvsUjT+k/gD9AAZZPv7+7HqROvclNCPwa324o7wp+VCKxlxkhuH0SwXXu56ATa+5CrmReRcFkhCMjTTZu50qGJQbPN4/VO2rPI+MuxuGRXPD9JPy3/jT3r+aL6/DlaJtYoNDvuRn/gB+Vqcx5/KsS1yjR+ujSd+tv7PKQufAbEkoAgXl/jMduVMQHrhXa9MFstkfVBWs7bgfVKm0mOWzmDCRQnaBNpCZ0uYtInOKoKr3dchA2sh1jF3QLPAlX1KV36Azjjb/VmFCIzSAMfMoaJ+rph0HumrnFo1v9dXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 18:09:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 18:09:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: expose PAT software table via debugfs
Thread-Topic: [PATCH] drm/xe: expose PAT software table via debugfs
Thread-Index: AQHcVTOIEvnuG6DTVUiBTIRY6gCkerTxvicAgACxtyA=
Date: Fri, 14 Nov 2025 18:09:37 +0000
Message-ID: <CH0PR11MB544477F08A904473098991D5E5CAA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251114065409.132230-1-x.wang@intel.com>
 <SA3PR11MB804680A5B5BEF6E60AF58AE786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB804680A5B5BEF6E60AF58AE786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH2PR11MB8835:EE_
x-ms-office365-filtering-correlation-id: ebc117fc-e6ed-4271-beb9-08de23a8f97d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?B/Nbkdpp5AKJ1wM+1ucJ6YpzSxhj8HbfOiAjCCtF5srZHAV3vFje9WSv2imG?=
 =?us-ascii?Q?zxMoAM8TxghOKzaanGcr4pUOsH/T2yp6EIGWFnl8FarvNCjH1TYMhCSausWt?=
 =?us-ascii?Q?uQhFlqv6vf5R4jA3Eo2nqTqThq4wHCRpb9xSbyfMJ/XjBaJD+YVFRUqnyZQV?=
 =?us-ascii?Q?RHbCiPifV5Vho3h8XcuDwHcuW+kz5rt9MQTS09FZzzJtcRJJYDvvR540w36G?=
 =?us-ascii?Q?Al5QunVkzaFBLNYHLpqvhimrMTOr6nxqy7sPpij8oa85V58oQ4MXy76Zf0ga?=
 =?us-ascii?Q?yl8McwDSypFQhgQ9YKfnurV25jerxQ25bLnbB+T1LM/RzqQLHVQu96bO1o5L?=
 =?us-ascii?Q?YSVLH4Fdr3lgIWptXnS5uY5bXFI1smQuJsNE7sZOicZmR/IZSRFbnESMXP/U?=
 =?us-ascii?Q?d6HOIHDvxgdMvgwXk03uFpo112dXnubmno3oECComoZC3UL7UomsZRaCnIZq?=
 =?us-ascii?Q?sYkz0oJcopvEPm/4LDpf/23JCSX83NJs+Zm00//HE3o8rXdCVjAOMUngTJQv?=
 =?us-ascii?Q?ynnpgj2VR9xKaQZIiIbxee6ELrwOp0Zb7E3WVHNwzdGRc8Rqs9y6CQfCTTVs?=
 =?us-ascii?Q?miJb5wfCbLKX3KJKEtsOfm/jMqglD3OUHaNw9DGsEGY/naGooQ+1Gwmu6dCs?=
 =?us-ascii?Q?w4veknEPWgZJmEPj7ibwPbEiC44Xy+Q5AkwAcxZDqqT7rVIDFX8pPGrNYLjV?=
 =?us-ascii?Q?n+H6qYm7jFMyQJgVywQTfDmTEh77o4NO7s4DXGDdHJx3ffbhO64bfu+dUDey?=
 =?us-ascii?Q?iMaS8U8wkGWgB3W5OEvvdczGNTxX64KC7p8g5kNQtwrq4CJvTS48nFL9koMi?=
 =?us-ascii?Q?J3y4GfEP7CDpNhlCKe7BuAffSp2nnviJS2cnxCogBlbq5MlrKtCI9IUW54BY?=
 =?us-ascii?Q?NBZ63cJKjg4oZwmmXXTqT42KnSXcTLAZzBEzs+4A4zmARoQbQyAbju/Z/K8j?=
 =?us-ascii?Q?HyXyJcKBrf+Y8csZkmVjXq5geUfVlq5Vl9o5o/4ZnIlK7C3XFtyk19sl8kg0?=
 =?us-ascii?Q?5YFLO/No2/WXa+2f/9HNaoBSTDaGudsVORHFE9HSiJxjaR6CO0YSe6IJvnKZ?=
 =?us-ascii?Q?/CJZBVe8WHh2w3CnYzc4V1WfT3p5glzvyvhYnzjLHVsBSCx+Z2q+/7gx/xY8?=
 =?us-ascii?Q?BANT1j8LHL2SAbdEMzNCpj7I798Wv4euh3pa2qd56N98b+9yACniVYTCG5XH?=
 =?us-ascii?Q?RpjvOcMKGxwZ/7eZBz8N4xEquXzh+F4TBWglYiKWazbupMw4QWQN1Fv8EOGc?=
 =?us-ascii?Q?WYmxcWPcehljso+s3lXzZT4nuq7i43JtkqNwN8hg08AIkOwNftzRvQORxdBj?=
 =?us-ascii?Q?oid2jdLYjaXy5K65MRXYbO/vcG1YmJtDdWb7xunxaJwQxjftn7SsWa/luQm2?=
 =?us-ascii?Q?gMAPHbI3IfTy61yXNZzOZ8jfHQ4zkeMtQ4XPO2/ibj01md0L9+o49cPBPl4n?=
 =?us-ascii?Q?I943vvlBaQR80Wn9tyUHMmwgsS0NtEasE2dk6raTukb7VRaOfpcG6tzDQ4Om?=
 =?us-ascii?Q?S7Pj2nyYC9MqYqzYFo4MUePIUquvUNxwr6Oo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LCjbWeEcXLU36jY8Gn/l6l4Ok/9es4bvKd9Mm6jVCrbuFD+hWvimjqy3KKrh?=
 =?us-ascii?Q?PMEt1v1lLsxAJipSQiTydqccp7w6UNAadu0aCi6gMU+Es0xTwZytB6i2oDeR?=
 =?us-ascii?Q?9BBA4Rv9GE0T518Cayikqc4jqJwanncqp38r9k60SGC7mFzoiakc3HQ65hpX?=
 =?us-ascii?Q?zcc0J1fs3TE3FBMJF5+D2GyufJjwqspTjVf+a/c2DoxsVRtsV7Z6F6yyneu0?=
 =?us-ascii?Q?tguww+rBbABh5y7t5rdUOTu42EH0K416pMu43jN0xb6QSKZeaf40ZkVlsg6m?=
 =?us-ascii?Q?J0NpbmGdCJP7U5ZNZFnISvKlo+tm/oOX5eYqBLG0ic37/kieMvP1DFAwBKrg?=
 =?us-ascii?Q?v/A8cCxD/bDfQCNSaj6xDiNc+vju6BAy1o4sfSBphc/QZzkv3/5aNK4CE8Ma?=
 =?us-ascii?Q?2gB68Jkh7aBzxbPtooULeuZ0q5Y8sgjggZt5BpEdbusH0PXCyF1jn/iyJz+u?=
 =?us-ascii?Q?Ax8/bXagYt06YpG1uDkEqXZwsAv3PMzsaob5LSsM0kr25dhKJx8UAVdtyUjY?=
 =?us-ascii?Q?1LT8Ud6e3GfY/9oP2KGJQJjFcNfXt+Qybr9kL8jmW7VD6DOnUJ9vk2WCj+3m?=
 =?us-ascii?Q?2Hutpf+mmyvBN5zRQNF8KM8T3wSNU4L2DNo1WIInjhgLspLSISMuJBvqbek4?=
 =?us-ascii?Q?CnnrkAj1tKeH6Q/bYafbTV+yKB+4DXQsGM4S1BGNP8AppSofPtd0/lJIERuY?=
 =?us-ascii?Q?zebtJ46Kbq2uAuiWJRYXasvUmOdbXmLDTondZFuD9ay1E9XViZCLfrWA4CwI?=
 =?us-ascii?Q?RkxxFxkze6+o4YnsUhXqGbVnb11mFFSqCaSq6s4vpgH2iDvPSHGvY65GvP+q?=
 =?us-ascii?Q?9O5VlFJ6p5hKQ4r2AdsguIttdqAYHHAr88tgbmre/3ublRbbvwPXwfM+8Dmq?=
 =?us-ascii?Q?gLCmLoMqEsI2dhrhWHI2xTUqsoDW1p9kSxN8bad/TT/aE4DCD1dT3kSOPsGE?=
 =?us-ascii?Q?iV3zFoQ9/vk76HQZ+++/fQ/t3qNMjDScUhqjLMYh5STnxZ/vIWM4JKuD3Gth?=
 =?us-ascii?Q?HYldoqGLM9PSwmBmb8eFws8OFwnJ37W2p1jmTPHWUHnPeq4WQyhfGni2GH+x?=
 =?us-ascii?Q?2W85XvMYJrlRKu/pnuq9/+Q4NZwFKYulcG396mXh+USKNJ2SnKYmNZXLTm9R?=
 =?us-ascii?Q?dr+NUkyJN2eGEVotJVIjWA+WwURytv2qEzF/umNSlNA9nPQCQq9ACT+Os6pa?=
 =?us-ascii?Q?GJ44Wz24lZX0fqbvbAzbn8+ttzgToscHb/ULyzHd6kl7Dm0uhGBPTRqnv5Km?=
 =?us-ascii?Q?fan3P2Ea4WKPKCipxmvMJFKwWIkt8rFk+R9CemGq4tMHTOgaMYRXzco0JjvC?=
 =?us-ascii?Q?Nj8cRNR7UokBJrgJffpqVGU64v/UKm7opuwhzz2zpb05XsblLGlmZuYj3Hv8?=
 =?us-ascii?Q?cgdv1/8uhE/YN3MozoMiZeDrNfAFnHgiIG/PRKlzvKCln1Qx++P7z66bVuJV?=
 =?us-ascii?Q?qtcmmKBk+Bo8h1JxMqxu4gLYf5ynPsRaR8DwEbemCofpeRX+3VJyo1Ufa5Mo?=
 =?us-ascii?Q?8HNbAN3FeM2T18Rz3GSzqfzzFGNREnPGbAkwCCUxQZFDhf2BY6V4a7xDqSeE?=
 =?us-ascii?Q?s8pfPO5t1DsuCeZFZ3A1v1nMquT9ajxpJQyS2lGX25EsQ0qnS/pRkns+Yyo/?=
 =?us-ascii?Q?67wjFVsYWx4879HYeyGfI4ZWeHZ4tWWLeH/iAysI+lib?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc117fc-e6ed-4271-beb9-08de23a8f97d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 18:09:38.0018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiGgux+g5KuEEkJGt4VmMkAQ4Vr+5brKUOX+YkgXsqrAudQ1jLIYTPF+qvFZHv67K11dIaQCb2JhcuVK5poMQKPwKZefs6SO63g0IdROUFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Wang, =
X
Sent: Thursday, November 13, 2025 11:00 PM
To: intel-xe@lists.freedesktop.org
Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Zuo, Alex <alex.zuo@intel.com=
>; Roper, Matthew D <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: expose PAT software table via debugfs
>=20
> Here is the dump data from BMG
>=20
> /sys/kernel/debug/dri/0/gt0# cat pat_sw_config=20
> PAT table: (* =3D reserved entry)
> PAT[ 0] =3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> PAT[ 1] =3D [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
> PAT[ 2] =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> PAT[ 3] =3D [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
> PAT[ 4] =3D [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
> PAT[ 5] =3D [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
> PAT[ 6] =3D [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
> PAT[ 7] =3D [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
> PAT[ 8] =3D [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
> PAT[ 9] =3D [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
> PAT[10] =3D [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
> PAT[11] =3D [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
> PAT[12] =3D [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
> PAT[13] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
> PAT[14] =3D [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
> PAT[15] =3D [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
> PAT[16] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[17] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[18] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[19] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[20] =3D [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
> PAT[21] =3D [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
> PAT[22] =3D [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
> PAT[23] =3D [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
> PAT[24] =3D [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
> PAT[25] =3D [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
> PAT[26] =3D [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
> PAT[27] =3D [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
> PAT[28] =3D [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
> PAT[29] =3D [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
> PAT[30] =3D [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
> PAT[31] =3D [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
> Page Table Access:
> PTA_MODE=3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> PCIe ATS response:
> ATS_MODE=3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> Cache Level:
> IDX[XE_CACHE_NONE] =3D 3
> IDX[XE_CACHE_WT] =3D 15
> IDX[XE_CACHE_WB] =3D 2
> IDX[XE_CACHE_NONE_COMPRESSION] =3D 12
>=20
>=20
> > -----Original Message-----
> > From: Wang, X <x.wang@intel.com>
> > Sent: Thursday, November 13, 2025 22:54
> > To: intel-xe@lists.freedesktop.org
> > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Zuo, Alex
> > <alex.zuo@intel.com>; Wang, X <x.wang@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>
> > Subject: [PATCH] drm/xe: expose PAT software table via debugfs
> >=20
> > The existing "pat" debugfs node dumps the live PAT registers. Under SR-=
IOV
> > the VF cannot touch those registers, so the file vanishes and users los=
e all PAT
> > visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe debugfs =
list. It
> > prints the cached PAT table the driver programmed, rather than poking H=
W,
> > so PF and VF instances present the same view.
> >=20
> > This lets IGT and other tools query the PAT configuration without carry=
ing
> > platform-specific tables or mirroring kernel logic.
> >=20
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>

Non-blocking nits below.  But I otherwise have no reason to block
this, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
> >  drivers/gpu/drm/xe/xe_pat.c        | 90 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pat.h        |  1 +
> >  3 files changed, 92 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index e4fd632f43cf..ec279f005b10 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -220,6 +220,7 @@ static const struct drm_info_list vf_safe_debugfs_l=
ist[]
> > =3D {
> >  	{ "default_lrc_vcs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> > vcs_default_lrc },
> >  	{ "default_lrc_vecs", .show =3D xe_gt_debugfs_show_with_rpm, .data =
=3D
> > vecs_default_lrc },
> >  	{ "hwconfig", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> > hwconfig },
> > +	{ "pat_sw_config", .show =3D xe_gt_debugfs_simple_show, .data =3D
> > +xe_pat_dump_sw_config },
> >  };
> >=20
> >  /* everything else should be added here */ diff --git
> > a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> > 68171cceea18..599fd8e0feea 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -578,3 +578,93 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_print=
er
> > *p)
> >=20
> >  	return xe->pat.ops->dump(gt, p);
> >  }
> > +
> > +/**
> > + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table
> > into a drm printer.
> > + * @gt: the &xe_gt
> > + * @p: the &drm_printer
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p) {
> > +	struct xe_device *xe =3D gt_to_xe(gt);
> > +
> > +	if (!xe->pat.table || !xe->pat.n_entries)
> > +		return -EOPNOTSUPP;
> > +
> > +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");

NIT:
I don't know if it makes much sense to announce the possible presence of
reserved entries to users where reserved entries do not exist.  Maybe:

"""
drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >=3D 20 ?
	      " (* =3D reserved entry)" : "");
"""

This isn't a mandatory change, as leaving this information present in all
cases doesn't hurt.

> > +	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
> > +		u32 pat =3D xe->pat.table[i].value;
> > +
> > +		if (GRAPHICS_VER(xe) >=3D 20) {
> > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)%s\n", i,
> > +				   !!(pat & XE2_NO_PROMOTE),
> > +				   !!(pat & XE2_COMP_EN),
> > +				   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > +				   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > +				   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > +				   REG_FIELD_GET(XE2_COH_MODE, pat),
> > +				   pat, xe->pat.table[i].valid ? "" : " *");
> > +		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
> > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> > +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK,
> > pat),
> > +
> > REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> > +		} else if (xe->info.platform =3D=3D XE_PVC) {
> > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> > +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK,
> > pat),
> > +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK,
> > pat), pat);
> > +		} else if (xe->info.platform =3D=3D XE_DG2) {
> > +			u8 mem_type =3D
> > REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> > +
> > +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> > +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> > pat);
> > +		} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
> > +			u8 mem_type =3D
> > REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> > +
> > +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> > +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> > pat);
> > +		} else {
> > +			return -EOPNOTSUPP;

Aside:
It's annoying that we need to check the XE version every iteration, but I
can't think of a better way of handling this, and it's not like performance
is an issue here, so it's fine.

> > +		}
> > +	}
> > +
> > +	if (xe->pat.pat_pta) {
> > +		u32 pat =3D xe->pat.pat_pta->value;
> > +
> > +		drm_printf(p, "Page Table Access:\n");
> > +		drm_printf(p, "PTA_MODE=3D [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)\n",
> > +			   !!(pat & XE2_NO_PROMOTE),
> > +			   !!(pat & XE2_COMP_EN),
> > +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > +			   pat);
> > +	}
> > +
> > +	if (xe->pat.pat_ats) {
> > +		u32 pat =3D xe->pat.pat_ats->value;
> > +
> > +		drm_printf(p, "PCIe ATS response:\n");
> > +		drm_printf(p, "ATS_MODE=3D [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)\n",
> > +			   !!(pat & XE2_NO_PROMOTE),
> > +			   !!(pat & XE2_COMP_EN),
> > +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > +			   pat);
> > +	}


NIT:
Hmm... It looks like we're doing the same thing twice in a row, but with
slightly different params.  Maybe that could become a helper function?

Something like:
"""
static void
xe_pat_dump_pat_mode(struct drm_printer *p, char *preamble,
		     char *name, u32 pat)
{
	if (!pat)
		return;

	drm_printf(p, "%s:\n", preamble);
	drm_printf(p, "%s=3D [ %u, %u, %u, %u, %u, %u ] (%#8x)\n",
			   !!(pat & XE2_NO_PROMOTE),
			   !!(pat & XE2_COMP_EN),
			   REG_FIELD_GET(XE2_L3_CLOS, pat),
			   REG_FIELD_GET(XE2_L3_POLICY, pat),
			   REG_FIELD_GET(XE2_L4_POLICY, pat),
			   REG_FIELD_GET(XE2_COH_MODE, pat),
			   pat);
}
"""


Then, in xe_pat_dump_sw_config, we'd have:
"""
...
		} else {
			return -EOPNOTSUPP;
		}
	}

	xe_pat_dump_pat_mode(p, "Page Table Access",
			     "PTA_MODE", xe->pat.pat_pta);
	xe_pat_dump_pat_mode(p, "PCIe ATS response",
			     "ATS_MODE", xe->pat.pat_ats);

	drm_printf(p, "Cache Level:\n");
...
"""


I guess with some further modifications and some careful usage of the sprin=
tf
function, you could also use xe_pat_dump_pat_mode for the per-pat-entry
GRAPHICS_VER(xe) >=3D 20 case.  I guess it would have to be renamed to
something like "xe_pat_dump_[INSERT_XE_VERSION_NAME_HERE]_print"
if that route was taken.

I won't require this because having written it out, I can admit it doesn't
look any better or worse than what's already present.

-Jonathan Cavitt
=09
> > +
> > +	drm_printf(p, "Cache Level:\n");
> > +	drm_printf(p, "IDX[XE_CACHE_NONE] =3D %d\n", xe-
> > >pat.idx[XE_CACHE_NONE]);
> > +	drm_printf(p, "IDX[XE_CACHE_WT] =3D %d\n", xe-
> > >pat.idx[XE_CACHE_WT]);
> > +	drm_printf(p, "IDX[XE_CACHE_WB] =3D %d\n", xe-
> > >pat.idx[XE_CACHE_WB]);
> > +	if (GRAPHICS_VER(xe) =3D=3D 30 || GRAPHICS_VER(xe) =3D=3D 20) {
> > +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION]
> > =3D %d\n",
> > +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h =
index
> > 05dae03a5f54..4a3045f74bfe 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);  void
> > xe_pat_init(struct xe_gt *gt);
> >=20
> >  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
> >=20
> >  /**
> >   * xe_pat_index_get_coh_mode - Extract the coherency mode for the give=
n
> > --
> > 2.43.0
>=20
>=20
