Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB48EC282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 20:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876C110E113;
	Mon,  3 Mar 2025 20:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ys6g1QuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D144210E113
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741035117; x=1772571117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1AoKdnDigOT4UX+wglwnWVyqLeO4xqmu5PIVYdxpmIk=;
 b=Ys6g1QuQv6gw1dlvGUJwC0j0bVwM0Eky3OVPClIJscGjFkT23k8kegII
 HT+8ebY+/CgBfCOyENPNHAcmFA4pTrsf3eeDHA8W4vpph58d7xZWn4cLW
 Q2e+4jWJDw0r3jbssY45Az6wE+4nqpuIm6SyrhFH+Exb6Bw5RT/QWBb11
 PxhxBHK/nIwq6aj5jaNIISXH3KfiTZTf68L84hGwaSCpZvQU9Bi6/W6YS
 JLsnloKTAB7okUA7woemYYpp5uIvvzVI3baEsVHBDb0x17CXmhXHCu/Im
 jKkSTNAUfccyehOGt7azLtZVipwuV4QsWXNNX1sr/GuY7OGupGdqibPlT A==;
X-CSE-ConnectionGUID: JW7hZoPBRbWuT1Slm6mz+w==
X-CSE-MsgGUID: T8tToHRHQMe8y0JDEH4gpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42048373"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="42048373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 12:51:55 -0800
X-CSE-ConnectionGUID: cBWYQt6zT3Sqbzn8lYMc9A==
X-CSE-MsgGUID: VB1+gwPmR7WOY9krsAxJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="123165503"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 12:51:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 12:51:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 12:51:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 12:51:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONLoHUFbJkCJw0n5wpFqDAlixvADFRWKnj3drlLkMFqbTawYpV4qwZ7kYSUgevNM7zdJgGQeEoLz9rj2j3ylI+laJrj2TkvuwrLqYVQtAToMElKFK+nfL/FaP5i63SsZDfG9j4hnAiQafMcJXHjGG7jIAKpoF6+CMqgKb3K0PI1DiHe0W8xI6Msd+YspbJWoKCdDSKULoe2uOnTmobJ3fDR26nuBaJvOmMV/Mm28ljbUzZorX+kZDDsbsar7GEvGndVx7ldQhtjos8z36ej53glB+38lSLlPAfvrr4AM/psyUiQLDS5LZpU0r9vWL8AUd0hgplAQzJiMzTL82NkJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw2CanHqGCNvrcsnbmlzxVlqx7fwu/cnufrnntComAk=;
 b=bJLpHRVK2hSpDiJNf5dKCnROlqquc3O4JTIYK8/Zdj/vj8aOy8NMg2nxa53UVtEeXqB/JmqNaOLMkA/umDz7t/P+HgAxB29ZSemaw/YtSbby2pTe0B8q4Eu/1MaqpLSqWOjG3Ct99pJ2n1ffHs7GPYOTlDKngbH0+OS+VJF7J4AjNcdITNoDilu4LQEB/e+qlu525+mhONPkO1I66KlwfDQmSB7EAg4B4WVKjHzJhk4eDs4FgDEgeDhMlsBe4eLcy8QAE+whTeXDRVFcojaFZ7Jx7ToqwPf9iB57yS4hOoURqUfxuFggOmZ+AlQ6+OAO+lfEnYG5p4VzGfHww8J7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB7669.namprd11.prod.outlook.com (2603:10b6:a03:4c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 20:51:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8489.028; Mon, 3 Mar 2025
 20:51:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 0/7] Support different GuCs per GT
Thread-Topic: [PATCH v2 0/7] Support different GuCs per GT
Thread-Index: AQHbjHXRWY6/q4aXoEKNsqJwwZxscLNh2oeg
Date: Mon, 3 Mar 2025 20:51:48 +0000
Message-ID: <CH0PR11MB54440191B57E17994A49FFD7E5C92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB7669:EE_
x-ms-office365-filtering-correlation-id: e01fcf60-6fc0-490b-4064-08dd5a9537b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wRHmCAVKMVA6wQKibtNcMgc5m+zVc8UDp3iOFmRkA/W9PoPhXRf5I6RDGE7J?=
 =?us-ascii?Q?CcnqZUG3qUllJkfw1DVcGIheZRwS2qPI9nhO9Tk0MaqYxjIowVZKLeJpQVZc?=
 =?us-ascii?Q?D01+1Y0gGjuBuQwHM9rr/3gEAYgC3BMWLnPN+pucY7Lk5Jc/YeOkMPcuiEpz?=
 =?us-ascii?Q?NXAYa6nNbu5PiJMRO+kTjHA3wvYIkm4RyIbSK83rdOfvyBisg0LxbY2ZaftY?=
 =?us-ascii?Q?zXRx+eLWKnqK1Ig8o6ZpPtZGmafXZ8KH0OvQvwQmrOTfgYGcNttYPMuQ/XUK?=
 =?us-ascii?Q?FHH93/vkK7MrsVz/uTk5ujRDB2EtoT+2EDgdp3T9EJTwWsoBfnWnqsIJSzIh?=
 =?us-ascii?Q?2mlugeZV+sKSVjloCAVslHWHCaoBqPRXPiRXqJne0T5N1NaUvLXSNZXGhkyi?=
 =?us-ascii?Q?XJZHShEEvWmzXro6Iilv5Riv4z5kvfORLTYlRbZb2wz8I/IdDGqMkosB/0fA?=
 =?us-ascii?Q?yoFwdmvU1K8cpfD4glDIR2WFBzL4TE1mTwDAeRmvxJN+aPjbb5fvZAAl2G+f?=
 =?us-ascii?Q?qEGgUBD55QuzIWVhZKlr/e6Zim0N3jHliII1om3F/vm+qHZQF8HUF9O/1/83?=
 =?us-ascii?Q?lj49eg4Z3N/Bz7mXAZ4qBI4W8xiiSN9qNmerDIoTIWBXP0QhE7cOde2BaNC0?=
 =?us-ascii?Q?zelxZjg86tnHfJq9mIq8uyUJBgF9etXfmI2zHMwNFQ+effHfnNQAQbhMngTQ?=
 =?us-ascii?Q?06HS706nSd7lXD9xkLdiiLE2+IC2ocDy9MyPEe0O8uEC6PFMi5PMNR0huAtc?=
 =?us-ascii?Q?2PHkzMNbCofZmZp3879WXfqtip7LjH5J6U4HdOuZEvgMU7XSTeJrKwmGw2tn?=
 =?us-ascii?Q?eze1M/ZLZM17EdzF9rPPy56wVm2+1l6OnrRDkIYKW85xIQHixPvca2QX0DPM?=
 =?us-ascii?Q?M2roIk70nNKIdM/5oUYTbn1VJzwfKdAFjtDZMah9iKnomlkZ+CSjV4hpUjt3?=
 =?us-ascii?Q?LEdI7el6m9epaZF482vUUxKFKNx4JGc8V/59Ak25MHO4bTGn1jh4hW+/iS2E?=
 =?us-ascii?Q?aIvWj57Kb89LfxJOzkUhzxINJecKWyHFXkgJjDY5AU8XoRMzmu0p+n+FRNBf?=
 =?us-ascii?Q?omOrDL5MUeSgoF7GqTF4L+rJpYU9H3MgNZbrPzwKjNsZTtvXeAHLmKZ0hGsw?=
 =?us-ascii?Q?4sXQSHOP/Ibg5vQfTulH1tSq6yerwetdN7ZtWYGDee+G4QtRRDf0aDlO31cu?=
 =?us-ascii?Q?KYeXmu9rhgQS8Zta3vr89Aqa7CMK/Yrx6yp3OXPuqR+wz/sBx47SPMUNuq3J?=
 =?us-ascii?Q?SVZOVDu2e+fR/KUQKWFCmOhm9dvaKldIsmbzfb9nZTx2rVvEhPVI5SK2EvxQ?=
 =?us-ascii?Q?2c1J53QBgtHRN2FBA04ax+3KvCQqcCHwz8PgtIJNvQiF6mpFh9vPT6pc0u0t?=
 =?us-ascii?Q?qD2HL6mjZRB4OBrDFs+FW39hWrNjtFhpZU8WIFK2sISRf5ulZWLYTEZ5nyu2?=
 =?us-ascii?Q?g8ujCr33/GgQbcHwpIvkGWZ+euGCyfgs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qRXctm4177gR93cHK+0DS1bBx1r7/5d3xTLB0KFlMgHVcDnolMQV5HBPWfPd?=
 =?us-ascii?Q?j+MprdXcqtoytRyp9zf12U4v44i0HTTHfsZB3d2m0v8sDaAniRpKgcZ1KrDU?=
 =?us-ascii?Q?DzzOuoeW+IC2u7QB8YmvDPlSjmJtNyFOCUnJpT+Sqc5Xy68c/Oy2oYMFXROI?=
 =?us-ascii?Q?J9nduAXKE0DNJ4ypSMtc26PwkgJdQ147N143WEOCe6tF8KHM5Jly1ja+Tsbo?=
 =?us-ascii?Q?f+KRSbdAHy0jlpq8aanHnwU2G0JYSCKsLZhUhWF0VCCazmbEhneHKeR+n6ms?=
 =?us-ascii?Q?qaNq78VkZFVs7Fj5f8PAxaWajXO+UNey/j+CoMWpT4MIPSAKqOHf3OlHENlN?=
 =?us-ascii?Q?xzbL/oYmTKJjXMNhcV+V2/iywIRyGBoNkPXxGjpxL1m+FXOo4+FDIHCE4+5R?=
 =?us-ascii?Q?L1ZCVQk5OvWXx184WOqSYQ15eO4ux88sOC6rgQCZiaVmV3eiahlt/krQ5hZq?=
 =?us-ascii?Q?0KjRsuf1CsrVascrJnd0ewiN2wISPG+ovf2+2Ny6WE6r6pkH9+HfovEnldQi?=
 =?us-ascii?Q?eP6aYvCOxERIjQERQHczL+dIFNr8zk/HXSTz/q+6ljAG2HXLE/n+k/canL6G?=
 =?us-ascii?Q?Mp88jPK9YbOOW9hD1CIf9gxnWLCli/C352pmrS92NYVm2XlYAZ/eqWNAwPhe?=
 =?us-ascii?Q?lDeP3q0pNHtFejSCGe0QVQlZWcZWupfhY/GP9dnC7C4aI/h5O1wYlK+Zibne?=
 =?us-ascii?Q?Aex9gSDjjd3nd6OTbI/FhKDTDi9cuyscjNuIsa3as6ijG3MEP85fzkt2d7ge?=
 =?us-ascii?Q?rN7gQqr3V3lri9mZVXqb/PoAgYW9sTpopVD7KiR2KBi2kXrVXt4JgPLlrZ0Y?=
 =?us-ascii?Q?qXtP8P85plZWx//NlL9qpQ6Y6dBxqel+2CSVVbuRNWWFxVp/7bQRWlElUnUh?=
 =?us-ascii?Q?Nn5vxV1nxsROZpdCJTThGBnJDrPnSgcshJuFFpzfoEMDLl6bWesoG5v5T8LX?=
 =?us-ascii?Q?rcFAAz4BURPrR1lBUQO1ZNnrVavDGSB23LOXmVzkR+upCct55eJWkVWoB7KG?=
 =?us-ascii?Q?IKEXzHitbpOtmBT9ack/x7K6/fbVR6Ey1UidKM81FT0BivQnt6v5rfhI39B4?=
 =?us-ascii?Q?6XQxHf4eWx5Frcn518oZrmF83tVlJ2nyic/7tEq8or9qHlefWLF1ekBQ6TZZ?=
 =?us-ascii?Q?8bGjXww+7vZ0GCsC6ZLxAZD9G2gygXpvrhncwoh5Zh8CfICHpx7+jlwhpmA+?=
 =?us-ascii?Q?ZGag/TCttHnWZ9IdVwJKHWUMc3iMpH7Goh41hk/TZfRtzqhm+5v5decB2JqH?=
 =?us-ascii?Q?+Ok0QcRDVFPn4SEf1RP5Ioz8J2fEsI/1SdLsZkR0GO8SVwI8+lvSdzPzn8nE?=
 =?us-ascii?Q?V0wqPP1bl9zyeAcDw0uPQfRWpWiz/FR2dLC5Ymmt27QroH99PHCpx5PTWUT3?=
 =?us-ascii?Q?+xCW9wBLVRL4OVFij3otYsHPr4gv6qvi990345XjflTe69DYnSPVxcRNm8B5?=
 =?us-ascii?Q?oZUC+OhH45xLz7QMkyGKit5Wizn7ycb45sWNMesK/GNXJ7Y8jlLipBLY8w3H?=
 =?us-ascii?Q?nvFIW3ivV+ZpAyVMOJIp23RB/ABP2AOA5Qd8BtuZDTSxauVhpR/OcnuXJGy0?=
 =?us-ascii?Q?kvYi9/3ppIy2Js2Uz+ITX4KoNUmvvxD7nXo4K2Lo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01fcf60-6fc0-490b-4064-08dd5a9537b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 20:51:48.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/vR/ILL2fHjtkzMNTJl3yHu1SXBPe8ud7P0UZ5k1RaOv3xaHonJ/gfB+9fujxxIWROwceP4tvFCvQMlj6qGKGaKtDpG65jokxXAidqYUyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7669
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C=
.Harrison@Intel.com
Sent: Monday, March 3, 2025 11:52 AM
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH v2 0/7] Support different GuCs per GT
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> Add support for loading a different GuC firmware image on each GT.
>=20
> v2: Split and add reverts/re-applies to cope with some patches being
> in the for-ci topic branch.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

This full series is:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
>=20
> Clint Taylor (1):
>   drm/xe/ptl: Add GuC firmware definition
>=20
> Daniele Ceraolo Spurio (1):
>   drm/xe/ptl: Define HuC FW version for PTL
>=20
> John Harrison (4):
>   Revert "drm/xe/ptl: Define HuC FW version for PTL"
>   Revert "drm/xe/ptl: Add GuC firmware definition"
>   Revert "drm/xe/pvc: Add GuC firmware definition"
>   drm/xe/uc: Add support for different firmware files on each GT
>=20
> Julia Filipchuk (1):
>   drm/xe/pvc: Add GuC firmware definition
>=20
>  drivers/gpu/drm/xe/xe_uc_fw.c | 73 +++++++++++++++++++++--------------
>  1 file changed, 43 insertions(+), 30 deletions(-)
>=20
> --=20
> 2.47.0
>=20
>=20
