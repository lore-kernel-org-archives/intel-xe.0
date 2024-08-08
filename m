Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83356C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 05:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F03110E63D;
	Thu,  8 Aug 2024 05:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDRbNEiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE6310E63D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 05:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723094623; x=1754630623;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MzNIzEkT/Dzcfz8w9yyPHEC0KPgbaErdjKEbM/z4Tzg=;
 b=cDRbNEiIuShKCkgIpJugs4j6lfkXl2/Cn6gLY4yysU5qyLLavx/bbEz6
 uvN0KzHVgTRME5mAleQ6Ye+LUY0q3uE3km1DMgpkfbb/IQXvIV1oUEnwZ
 MJ8jDADXeosKhfeEKI0+Ne1LMMuJePDqA6C6hLvbqhhgBbDutOl9NHfBS
 t7BhZDXQWkpNWUqZPUXTt4+fbOjTkBiYt2UAVEA6WBGIeZVa1QLmlJp3k
 4UBkvgYBtHwTTBffsm4betIKVBLmcMymjBy+RNWqc66B+GqM8+r+JgxLq
 y5ryCETaUfOGhrNw71t5CQsLh3RJJj6Jbk9cqN/iVDHzcK8qlnZmDsD6E A==;
X-CSE-ConnectionGUID: YoxlAF7qSJ2LajsvZXN32g==
X-CSE-MsgGUID: bY0Gsh0HTOS8x+uIJ3Rwgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24960364"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="24960364"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 22:23:42 -0700
X-CSE-ConnectionGUID: ChRLM0k0RwKxOKb8PouaMQ==
X-CSE-MsgGUID: p7yfhdjWTwG2ZPWPkXJG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="57047748"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 22:23:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 22:23:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 22:23:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 22:23:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 22:23:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMuCCzEWlH02z7dhCEQPjGC0pN7ZLUs0LV5PCaDLvNRzew+Vb44aGlvyhxXrvHMW8xVx/ty2oE1idcjbhxfn4vJHwgPrst4vO91aLlUGsdhJR6iHLOjCwcAXd8wXwgIBp+vZaydZAC2mYXVGtcz3su6WLbbDigWGEl9MqTysGfxq+mwfEP6WVepbwNtKu7RqwVBBIgDQ+mm+oOrdPH/OvEjxMFNxCwkjl0hyandWjH3/zHOkzEwyfI1PPlkYavNjj2WwKufY6t/O09DVNZQ25zQ2AcyaTRxovn8rQGFLIpePo9nKwwZR4O3uqKpctKPw5ND4X1qsJDHy/b8/kEAl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4LEY8pwjHzMVOpKZ5RH8NT8ftG1tccnn/BWt0zPVzo=;
 b=j9AaqfY863WDgDEoPakkO5apd0c6vQNE+rYOUBmQp3cDPuyOKzDAoC5SjvxQtUodbvH6OvAGa73bXd8tEUETBV8Y5eQKmQ8lddgJZvwd+IVZfjVbm30IkG63w22LaZ4Y5d5kUERqlSs+LPgdLE3FyttPYZeCMsbb+MoCEANqNz5YnpPFV0kJEO7xWUfHiEv0l+9oFBcSUDQ+FuQeOumNe4WDGj7LtuXmiynwmR2qNUEV5ZeeRzTfCfoZOmoePsJ18aWVtfBm3rC8DRry2q7fhc1YFZmxMjsnClrhClHaSwePsUeldjzjDM3hLWq6p9GXneWEwSzf3Q10CLseWf/c7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 05:23:34 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 05:23:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Write all slices if its mcr register
Thread-Topic: [PATCH] drm/xe: Write all slices if its mcr register
Thread-Index: AQHa4yw9tTRhHqabbUOffdt9BpmRbLIRSDEAgAiywuCAAjlMAIAAq2Bg
Date: Thu, 8 Aug 2024 05:23:33 +0000
Message-ID: <DS7PR11MB6197DF092627E489EB0A0A3581B92@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
 <20240731202148.GJ2906448@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB62049C56A03784747EB3D44681BF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <722yqhnlihrgqvnejzfgjakpgfqrkvxgdsvfysjs5s2kszzd73@urxkn74fo5hu>
In-Reply-To: <722yqhnlihrgqvnejzfgjakpgfqrkvxgdsvfysjs5s2kszzd73@urxkn74fo5hu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: 22afe98f-b367-478d-fd33-08dcb76a3f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QMbFl8x8SYyT6rWmWllInIOq14ooG9ZxPVc+sh172/m9+8yDJ9VSLgDUln/y?=
 =?us-ascii?Q?xwUA9bdIJnVT31ibWHnoal0wPeByPEFu0m9X18CYnyfYKHySWqXKfd65eZ91?=
 =?us-ascii?Q?3vxDlrQkMgAv93NtjqLzJigaloyVdtaCSoz9XkYfar/hghmCDltyt4V5IUi2?=
 =?us-ascii?Q?pjgxdd83booRLU1JtuYCPivfV1wyc0/q2MZZp4OZ+ASt6y7Un0W+IAhtZ+wI?=
 =?us-ascii?Q?fBYjNXbiMGrX63v/5/2pjAz9TzVmi5dISC8Lof2MYoZG1pHSsyYSaKgBxtjZ?=
 =?us-ascii?Q?lZwy+xads5G2RDxD1wFgQECxIsZdsVIlv9MP1emO+T9byHbXrszCqrzyVYjI?=
 =?us-ascii?Q?uLU2KsuC9+iKjacZ04OlhYsIMY3DtvvYft9v+xr8IvTHyUlTd/+/1kXaz39Y?=
 =?us-ascii?Q?mjZY39tjksk5hVjf4sh41hdUgqz00r3rnG+ymjgrH5a9/eoaUpr0W3XXeyw/?=
 =?us-ascii?Q?qYOoIYF7Z0aMSDeZ2PQbjDCnnPILbagoFu1A9y7/h87oC0fdfBg8xQnemRYy?=
 =?us-ascii?Q?XZ8+QHi/S5Z46FuyeEaV+MdS+iMzlncgKy/Zo7ICnOZdYStTcO5PO3UzjSdc?=
 =?us-ascii?Q?fpiT/duCjm5higDtIVAyWVKqvqv2XyQ/KLRccfpdW67Ismj83XO51x+WElTV?=
 =?us-ascii?Q?qXkxwQdnYDZJeI1+lt0GH4WwNARzt/P8DbiULgoLZ6FrcPr42XwHKTItslPP?=
 =?us-ascii?Q?/xDrUnst2I6Z24pOKB8LQFvepJWQ6ovrES1xmXSkOOlfjL7KE0QZ4uIfHhwK?=
 =?us-ascii?Q?SgkuzEDxilZnuFzNdD1OrY2r79w4tkNd+2PahXX3mbK8+Zog56qACxX5mUsK?=
 =?us-ascii?Q?n0PbzQAfs/hJvyf4ZbE//qGasxH7V3rwghJgSJEJblumXqI4cGjBAx41UTcE?=
 =?us-ascii?Q?JTRQk4vDsgzFXYqL+KfXr/XLBl09S3j+NspTQ6UROJEgFFQ0Rro50qZXQWp7?=
 =?us-ascii?Q?r07LU+rzsB6z1HdA2NWXmOeny/0OcIpioWbU+4JUOIsWvM74UfHWIDbzD0bI?=
 =?us-ascii?Q?SRufZgG/DraEEu7iurr46FBbehzNeRRJhyepFkja+dy7Rx9eoAGXEUQe2EL5?=
 =?us-ascii?Q?B0WseVNb/cXwIQGTFLiR1lLUAAZ93sqHbQWxGEkN6Exr9016+pFdyRHKO0JJ?=
 =?us-ascii?Q?KvieShwJoZzFSw4YJzcybGFy8BUKyzp2DjAXdVg3OIRBDp9YjOtCgm1Cmj5D?=
 =?us-ascii?Q?wnZHU2Hzp3woidxLXYLXQmsJfdYxXYKIqmK2RpcbRcJjNMqKnurrz8k+dYQD?=
 =?us-ascii?Q?ObA9QAkzDYB821sl1KJNbLs34tojQr+ULVHa+jRE2I3g8j6KUxXS3WupSVlV?=
 =?us-ascii?Q?Ldl+D7SzrX+azu6TwYxUpq7h+If6bcsu24ijDH66JbGzo+3/rBpaiivN10VR?=
 =?us-ascii?Q?06mtCdTmwKGQ7eM4aRjc0jSgkewUcjXkTZHjXOp+8LZ4F5l+Bg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P1v6M0yx7L3SnbVAuZC6GknnB4c/CJXv5IELZHxmqpH4xOyIzcDD+lFuKcL9?=
 =?us-ascii?Q?4kQIDV2mDCKKiUoDlOutTDyrMjoqzf8Hz0u0Z1tWiYhvAIxazsAzjBQbX/oG?=
 =?us-ascii?Q?zdshW1xqfy1VIcGUXGK0UPNJVb/zhfxhROUOTXLAPsQoadeG4LAGhBZpgdvr?=
 =?us-ascii?Q?2znR1b/fTvwX/3FOp9V3IEhqO4/8TKKMov3xTe24GUgl+AJXeKYyJPN3e9s2?=
 =?us-ascii?Q?9yYL3HFUGlsWSG/HGxzG3p5dGNskmt1OFszTYAQovLh9E1ti9RhYyVGNaLne?=
 =?us-ascii?Q?72vETNyUL2k/kg1QwzFzIaLRdTNxaRDx5yMpLsbypfnAvCgBCzmlDCiK0qft?=
 =?us-ascii?Q?d1TC+B4Jx9a44vFY1oqmA3fNjlKrtV/NlJqdStYU+G47gPEVvleZXVrOZbvK?=
 =?us-ascii?Q?Z/AjfanRxXWj9u7KipukygNjaICOCWNd6uM4nmfMbi0SMT1l4wf6p3P5JnbW?=
 =?us-ascii?Q?7Q38GSZIfNNpmXm+VaZXGZMVBt4PNppmdVTujVEj/IzNsVUSsZpJShZMOHUw?=
 =?us-ascii?Q?qOv/h/vXe1jJWrkXM5rASqGueu4MDJz42gmXoVT4wW5iRqbx+TesEmzMlRIN?=
 =?us-ascii?Q?LNzzZFPHhQEuyt+GYx22givkgayyCNWlO0Q2j+SMnhVklzf8dtMeU0BCOKxf?=
 =?us-ascii?Q?3ld63zxeOfZfRRqrXUvwQL18DlexMq4GaY7Cd7FhkTfD+bVL9l3AwNQ9iA3N?=
 =?us-ascii?Q?cKPhsTO6bkJSC6gMQgwQMvKPtwzGjcxuE595tZF5LzvTGhSHnBTUnY9x1ig7?=
 =?us-ascii?Q?B3/Syx44JOiHqGq5zrArbqP03yU4kyCtDuW+Eh2yFHhlq183JcYnf+BMTNvr?=
 =?us-ascii?Q?odg10BzI52T9i1UleWBgwrRfETw5uEMv7cPwURCiLx93o2L8wv4AFhF9mm76?=
 =?us-ascii?Q?OaRHIrHBIdYHNIFiK80CHgkTOzN+p5AxoEFp8fVX4IsS1FCeXeTtr7ZMNlCf?=
 =?us-ascii?Q?qzA2yZN6kLI5J5REFTHRZ5+PTNru1Ip34++Ffv7tVY8tBxwtOmGMg1aCP/6d?=
 =?us-ascii?Q?sexQrpfs462tyl0fMKp1nBCfVbi9o6654z2UlzL80B20THZVmKkf/VFGOxnt?=
 =?us-ascii?Q?5dGF8RmXfHTu5rhKHRM/OuuSPH+RsqQFPV7tqqqe//pCEEvTvCFMEkFbnVP2?=
 =?us-ascii?Q?5QlrJJeuxz2imsQDyYFqDyMOhi6ifsE+Vbe/0+P/EMg9CdzJUIAhSMflXyTs?=
 =?us-ascii?Q?7fzPKasg6XcGgaG1hJSkDH8Ji/tRMtryHtVpYFAQzuvK0IdnpIAFp0+k3WE7?=
 =?us-ascii?Q?RNkvdw/QqRE9oVbeBgSmRno/kA8pCegz8O0rdT4ba+1I32pM0/zZJMTMeE6A?=
 =?us-ascii?Q?c62UFz/s9S8/A5/ZoYZiYvn7b63M7HK/4HNZ9lqmwmcqGImHZuRi7087bJbV?=
 =?us-ascii?Q?xcNWzgeqSWaAnYorSQlGHMO1/6/T8k0Jxhw9N/lz8SI0NKQy+XW04u/CXGuh?=
 =?us-ascii?Q?WVAK0UPz2d0INe450RCrGxb2iiflMIBVhFs/0kYTIdkkuDM76uHYxd8faWTY?=
 =?us-ascii?Q?6Nj0T6nd62oorU2ZPD6y4ulZRdB2urBg+3Qr0DszcKFeBi9dTvwsR+b1zw+F?=
 =?us-ascii?Q?zzhox4uEBHGtaU6n3dsEwGEgsExm/e/hMvYy+WFG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22afe98f-b367-478d-fd33-08dcb76a3f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 05:23:33.6728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyzdJIPeMjn2ao42fyp3FmShpbG/FxvAAKVwPfLZL2m5QWZvMfCTTaXbpi7UQR9jj4RyEzcs4mWXNNI/kV2EHTS9hdVUSPaH3rDUG5ts5Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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
> Sent: Thursday, August 8, 2024 12:39 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Write all slices if its mcr register
>=20
> On Tue, Aug 06, 2024 at 09:14:15AM GMT, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Roper, Matthew D <matthew.d.roper@intel.com>
> >> Sent: Thursday, August 1, 2024 1:52 AM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org
> >> Subject: Re: [PATCH] drm/xe: Write all slices if its mcr register
> >>
> >> On Wed, Jul 31, 2024 at 03:01:52PM +0530, Tejas Upadhyay wrote:
> >> > Register GAMREQSTRM_CTRL should be considered mcr register which
> >> > should write to all slices as per documentation.
> >> >
> >> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >>
> >> Bspec: 71185
> >> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> >> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> >>
> >> > ---
> >> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
> >> >  drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
> >> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> > index 3b87f95f9ecf..b131e3171899 100644
> >> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> > @@ -80,7 +80,7 @@
> >> >  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
> >> >  #define   LE_CACHEABILITY(value)
> >> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
> >> >
> >> > -#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> >> > +#define XE2_GAMREQSTRM_CTRL
> >> 	XE_REG_MCR(0x4194)
> >> >  #define   CG_DIS_CNTLBUS			REG_BIT(6)
> >> >
> >> >  #define CCS_AUX_INV				XE_REG(0x4208)
> >> > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> >> > b/drivers/gpu/drm/xe/xe_gt.c index 58895ed22f6e..c6296dc8897f
> >> > 100644
> >> > --- a/drivers/gpu/drm/xe/xe_gt.c
> >> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> >> > @@ -110,9 +110,9 @@ static void xe_gt_enable_host_l2_vram(struct
> >> > xe_gt
> >> > *gt)
> >> >
> >> >  	if (!xe_gt_is_media_type(gt)) {
> >> >  		xe_mmio_write32(gt, SCRATCH1LPFC,
> >> EN_L3_RW_CCS_CACHE_FLUSH);
> >> > -		reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> >> > +		reg =3D xe_gt_mcr_unicast_read_any(gt,
> >> XE2_GAMREQSTRM_CTRL);
> >
> >This is showing regression, mcr init is little later after this call. Sh=
ould we
> read first slice default using  =3D xe_mmio_read32() or we should shuffle=
 order
> of mcr_init and xe_gt_enable_host_l2_vram(). Any suggestion?
>=20
> we were already calling xe_gt_mcr_multicast_write() in the end of this
> function.  Although it works since we just rely on the mcr_lock/mcr_unloc=
k
> since multicast is the default, I don't think we should call it before th=
e
> xe_gt_mcr_init(). It access the hw via the
> init() callbacks, but they are mostly sw-only initialization or reading a=
 fuse. It
> shouldn't have any impact on l2 vram being enabled/disabled afaict.
>=20
> so... shuffle the init and make sure we initialize mcr before
> xe_gt_enable_host_l2_vram().

Then we should club mcr_early_init and mcr_init in that case is what I was =
planning.

Thanks,
Tejas
>=20
> Lucas De Marchi
>=20
> >
> >Thanks,
> >Tejas
> >> >  		reg |=3D CG_DIS_CNTLBUS;
> >> > -		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> >> > +		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL,
> >> reg);
> >> >  	}
> >> >
> >> >  	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3); @@ -
> >> 134,9
> >> > +134,9 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> >> >  	if (WARN_ON(err))
> >> >  		return;
> >> >
> >> > -	reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> >> > +	reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
> >> >  	reg &=3D ~CG_DIS_CNTLBUS;
> >> > -	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> >> > +	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> >> >
> >> >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);  }
> >> > --
> >> > 2.25.1
> >> >
> >>
> >> --
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation
