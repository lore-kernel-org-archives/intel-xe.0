Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B8CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 21:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D74710EBCB;
	Fri, 22 Aug 2025 21:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUNDb575";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78D010EBCB
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 21:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755897988; x=1787433988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6mn68sUZ+SMKXRy9VV0JIyYAQpPMEmk7ArB+75wfe/I=;
 b=FUNDb575duPNVtYOMEiAfM19BXqljPjN362hD7PP93G4vI0Gk4DYHA/o
 bKzYdA8FA0STnWcnueqEloViG4f81Y4vjM7IxTF6xTeXUT2HeAR10Q7Cn
 Iv3bO5KY0eAu2Y7Xjy8bZMVzcg5lbGWL6XZhCbBB851xDXkn+AVS7g+/i
 EDcIJm2xRruJ9d4qpYjOM+sKvYTbSGVo+ZbB6EPWr/XCZ8Avb9qrvxYpI
 aA+q4JriL6hdeJFNH/cl+gi7klh9EUhVqFCXfezuBYmq6o4Atvx5kR57a
 x53fotRVi7BPeyOPsTiiq/lBmgI9WCEMTRTFIJg4wJHQ0mlaTUooK+9fs g==;
X-CSE-ConnectionGUID: Fk6IxK1wTVSEpEabp6aZSQ==
X-CSE-MsgGUID: r2k35Q9cTG2cHA1wBDinYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68483340"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68483340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 14:26:27 -0700
X-CSE-ConnectionGUID: M9TzU5OZT8CoSfTYMwmwUA==
X-CSE-MsgGUID: UEFvI47tSwibdwVHXZYPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="174071212"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 14:26:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 14:26:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 14:26:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 14:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD4zxsRRJBpliXNjhJ6+IA1dTpKMDwILoYoIejrj9E7g3k9q6MYl3jqnWOn0PTG8T/iOwo4cc98LNlbmUU8kdQj6AMRWMXhAYAgsKIi+AmH+bkOkg9fK/dldgiQE4OW3iayZxL+YvFOCMoVkHY1wACTkwSweZsP15W/stsL5ljY7W8Y/I6r69BUzOczyjBw/D9j8JjWYNBJn4jLdgA5OUiKZye12chl3yBSRVnS4h03nYZLvoy7a9R+C8S8FUPKbrJtJT8VA6FJqDM7vJMwVb071ZdOlJtYCSzvctO6VbLqrP+Ze6+34ROENJOHTm9icft8+kmTNw7Kkyd5opHC5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJCtntbNvnnDVcxQkEWh6Ux50kyvermAD7PBYuLbQNE=;
 b=BVqraMJu7uBhcDvFa5qvMu5c7wwlsNvGZanYCA3dw4b0e/wF22DgZTkm+4JSQbrk891ShyPpqMbmbzNppJtgBoELiZiwNQEm8KuRoJLPpJYiVRL1hhdxWDcnFMPAe3g5QVv2vJn9RtO4P62TV7WXMAL1QEUd6vpqttd3AjxLiWrhPDnDz+w24k1cV61n0/NKGvTFGIkTrWNdUQqwtN2y2TWLk8j5MumL2OaEFCBaZbleUd3DJQ67k7kYHlApYLEgjBUwb2tcjwdi6hB9sPsgXW1m+SrKfJfp68lr0197vS3gAxznzWq8IYWU8RUN9w/gk7isOsOfaaQjKibmaFr/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS4PPF900531A26.namprd11.prod.outlook.com (2603:10b6:f:fc02::3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 21:26:22 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 21:26:22 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Xiong, James" <james.xiong@intel.com>, "Summers,
 Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Thread-Topic: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Thread-Index: AQHcE56VkoIwyH7gh06ooYANAaKROrRvIPqQ
Date: Fri, 22 Aug 2025 21:26:22 +0000
Message-ID: <DM4PR11MB5456D92358364D1D30DD4710EA3DA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250822195340.1246075-1-x.wang@intel.com>
 <20250822195340.1246075-2-x.wang@intel.com>
In-Reply-To: <20250822195340.1246075-2-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS4PPF900531A26:EE_
x-ms-office365-filtering-correlation-id: c34b8b37-b989-424f-9f56-08dde1c28aeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/FJ1/xkJr5svUGrBSvEeVLG2xZ/i41FJQYg1OKJAgrLMCPdtahQ7c0awmeN2?=
 =?us-ascii?Q?dxgkakiwjnHqGHluf4byuA7QFLW/Gy1pJ0cx7XfH9bCJsS1mY9yvo8MG+aEZ?=
 =?us-ascii?Q?XMME36nWNSdqwbz0xz6VwNXwAAB5awMqeB6v6ifngvsQRB7JLGk9+JnJWogV?=
 =?us-ascii?Q?WtTzusSMcfeb5gRphvzJvAC/KAyo7ezCYNU4DDwkokk0VpESzz5o7ZGhxm5/?=
 =?us-ascii?Q?+aO0PBbudNTfOAs+m1mRv74HRdzYjnORWWUttsZBBqpZjLcRiHzZ9RPg/0/v?=
 =?us-ascii?Q?86JfgfWj+nSZajALDFjlrieqFfIHPG/BxtXQP1Kcu3ChfTr1/UMIWmyo3pFi?=
 =?us-ascii?Q?5hxmPtx74vvWE8+rLnnzXe55RqSJgpEUhzT9HTcMhkMnVu7QCQbA+B3vL52u?=
 =?us-ascii?Q?/vD2qtarZWpVW071OkMbVu5OHL8aNlV7MeOm49yCLudb5lV35uijldefOvCQ?=
 =?us-ascii?Q?QlWNb5+vfqlPje3KXGqD3HXQmmzB3dOQNtaIshb2zR2eZL9Q641M/U4h8grt?=
 =?us-ascii?Q?GFS7l1ApfbLlaq2zXXK9fPaC0cMX+NFW/qfS3M0vSl9xUO9ImbNY/buzDhZP?=
 =?us-ascii?Q?KNiWkRx3BTNuEGdGyIMS3HSgaUj25i+4Q7YFWdOVDncV1YJAnuw8gAInchQU?=
 =?us-ascii?Q?RcYbnvcnnK4Er4Q9pp2Tsk5HFVXRs3JC1L2emSQ4gnvBUjT+inkvM+zfBKuE?=
 =?us-ascii?Q?J4RhpGAIvvq30KXb9WnJXBISvgVkrZgqyXaTh4m7SwvhPOI8Hw80t3CZYFS3?=
 =?us-ascii?Q?q1vYX3oGgneK/MaiwlgRfeIsaS94aLWIKKczNeWUucpdSB92NvihYFddcVZM?=
 =?us-ascii?Q?Cu1yvclDH2yuI0tXLGJbhSL1j6xW71Y+BSvSvDLGWZbt3/Gjtc2ss4VHC1US?=
 =?us-ascii?Q?H2Jz/OVyzwR/cVFxV804jDM/Ujjn4P09kE+M35iVRiLxM8llNMBpQ55lFbkE?=
 =?us-ascii?Q?10Hep5N7dmsbFZBJbjMXDvCU86Bayx9q9JSxQ6dgOxWbuPg/kpi+rIpCQKjU?=
 =?us-ascii?Q?IzdfCzGd3ZEb09zB/ajqTgjfpO4S4DylpwyYwuI7P9pbVr44r3Ws1c7IFptO?=
 =?us-ascii?Q?EvdAWHWhqXwE/y7a0G9Hs6tcMTiPsNZVM98e/vRuE4fErKfQwMEmnI/x3HL4?=
 =?us-ascii?Q?0EtedGg7AG0ftM0gp+P0vjEK6GZpTZru4sZGQqdvKskbf+Z/H1hSJ4AwaIs4?=
 =?us-ascii?Q?t58+53H6rOFXifGS2wU9sZk5fhfjVWjwYDq4VT+9ZDKYXpTUieL324EmU9cK?=
 =?us-ascii?Q?CfPSV2Si5LdXTbICpZtk6Sh3ZgHOHPvUC4TXpEQ7nXxp6oWWMa/opZM4esN4?=
 =?us-ascii?Q?/g+BjliRc5mMi12xK9teJDUtnow7AsXk7OsZjIkbdLocve5z1W9Wmp7rehi2?=
 =?us-ascii?Q?hOIv4+kHfKuPBr1jute+AQ3G3CJQG8gHljZWMb2Xe98vYm8sAAbFFa395DGm?=
 =?us-ascii?Q?APliiq6eOMavyfomxvGPSDeFsSgWRi2MEBltAqgzYulJBiBgYOoWR2wtJ5lm?=
 =?us-ascii?Q?dhiaWlp0zlghqpk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eGzZBRQfhrBzo/9A8Kb8fitCVlp+auQ0a00P2GMR2XdCwAGgExFG1CaU4AEa?=
 =?us-ascii?Q?C90d90rEjDvLF/qyQqjTq25s9sSDgEEpR9vmkFbgfqaBex+kRas0XLzshYro?=
 =?us-ascii?Q?iV4CXuqRU3UBgz7ExaGVVStHyBXuhYWFPM+So6HouTdPKaE2SFFAFuRMdewG?=
 =?us-ascii?Q?wHkR+/1IC9VY49k/RKChI7ZFSC/73JXDd7Ncr72OI04Tfk1LLWiE4D3UCHRv?=
 =?us-ascii?Q?fgYgoPAPyyR4MemjtZXSfrv4EXktSJVQWwtmSw6xymDhNHAqHKCPkE0s1t9N?=
 =?us-ascii?Q?ZdIoZY9CFIIiCeR4DIHaHf5P31DiK7D9aPF4gYQvR26djArt61y0PetOhVuu?=
 =?us-ascii?Q?goBFbxqLluW/H6paLrdtJHkX3eLe8yb8CMQrGtLH3apr7Gy4ATC0DzGF8bvS?=
 =?us-ascii?Q?VAIJj9jRKAfHLIK0ZCUlQcK53NFEx9J7RMnt8I4Pg9PNTfKPvnYLNcmR7efZ?=
 =?us-ascii?Q?2F6f50niHgeQtDX0jYYteE8grtAMQAfk0FRQCkJwnhZ757iBiNMfZ+hL0Q04?=
 =?us-ascii?Q?u6IJbvBkLpYJQUj8cu6vtbS9z0nvWRNMqlmLCx5aC9BlVZ3/4libt+ggc+B6?=
 =?us-ascii?Q?201Gv0V4RHigi66AOh9ZyhT0k3V6GBWpp/b0WX4mb3BiTUXMIxwrxU0jjXjU?=
 =?us-ascii?Q?qV0nZQWlx3LNjYXmLfP7W/nf4v7Nk0t/GqkdoCn2sp9Ripua/mLLyG6noCeS?=
 =?us-ascii?Q?CaCZRa36m+xaCbc0TMhHmNtY22m/qh985n5t5eq3cV2JfLcrEKZzHGklaiRJ?=
 =?us-ascii?Q?QDTgSVs2QLB+CTY7xuPXUsah/ZUaEfGxDOvKkaouAjPnMDJ3slSxUpf9djh1?=
 =?us-ascii?Q?P4d+d5ru6Z4BjmTi3GRZd1c2zp/Qfse8XqSu+rxz9X8sYtn8SX1BCW7w3Pgg?=
 =?us-ascii?Q?qoIXSWVVsW6DICE+Rbuhho12VGKd2jDcirB0EugMf5hONDMpPFyPKLU1vdjG?=
 =?us-ascii?Q?/HfWUYoWdP26X13SL+Q18P9YzKn6sVYpn+0yYcyI38E42Bx6IxAYO9Tw9+iU?=
 =?us-ascii?Q?TRCCHoALmiyq2cY4SnQuCuAVI91ppEiqSSwI4Q04tln4TZRcN7Z7IwNe5sPG?=
 =?us-ascii?Q?RIkbQE5L9XXrLuRgp5FtX/oZnO4EuizrM+VJgqC5TBznVkRwIqwJbL3PEd9V?=
 =?us-ascii?Q?K6ljSwq2UBUHfEk/UegnAcIUT/3Cv8ClhQPGPjghGJyGAqvHkDl5mK0Oawzf?=
 =?us-ascii?Q?FdmSF9pf4x3wCr6v/Wfe3yVPrjMFWe6ZlIqoLt1d5me5piFRewiq/QaIRbLh?=
 =?us-ascii?Q?NV0A9EhV5dY6NTivyL6V0sNfTmA7Y77AYxoEkzjoRHuspzAWJekuRw1IDzlj?=
 =?us-ascii?Q?4ZoR/xa1xM/9MhVlJI3mHMSs+HsZsnF/VRHSamKWs+ALhAC1ksISYl1KJb4z?=
 =?us-ascii?Q?SMViMaV8tESEMIosP1fZS6VqNCM6ggwx0miRw1UdX1NWbORXuCh7HiG9k0xO?=
 =?us-ascii?Q?vFdq4/4lzOE88FYWPvR040Ar4xRm5UqA/b4/HgTZ/c/zyaLpCv20V83z7sRC?=
 =?us-ascii?Q?a9dgUgyu6dkVsEyjNUpkuCUHcuyAFHRBOcJZK3U2w/AMCvjE4O5BrzjREmxB?=
 =?us-ascii?Q?2eiTQgm2ObfoqhBRksWIiAVDewNHGcs83NocEXkQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34b8b37-b989-424f-9f56-08dde1c28aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 21:26:22.6777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ooS31jz9L1IDR1nmTNGGBD7i/6izoX+kzkVgoJ7CrRHK86oXPqG65XTeqUFe/37IzRaZPqDrD8bljHNw7t8nhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF900531A26
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

On Fri, August 22, 2025 12:54 PM X Wang wrote:
> This change streamlines the code and makes the API easier to use.
>=20
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 25 ++++++++++++++++---------
> drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-  drivers/gpu/drm/xe/xe_guc_pc.c  =
| 13 +-
> -----------
>  3 files changed, 18 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_i=
dle.c
> index ffb210216aa9..7a2e5b50b1ec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -322,15 +322,11 @@ static void gt_idle_fini(void *arg)  {
>  	struct kobject *kobj =3D arg;
>  	struct xe_gt *gt =3D kobj_to_gt(kobj->parent);
> -	unsigned int fw_ref;
>=20
>  	xe_gt_idle_disable_pg(gt);
>=20
> -	if (gt_to_xe(gt)->info.skip_guc_pc) {
> -		fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (gt_to_xe(gt)->info.skip_guc_pc)
>  		xe_gt_idle_disable_c6(gt);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	}
>=20
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
> @@ -390,14 +386,25 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE |
> RC_CTL_RC6_ENABLE);  }
>=20
> -void xe_gt_idle_disable_c6(struct xe_gt *gt)
> +int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  {
> -	xe_device_assert_mem_access(gt_to_xe(gt));
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +	unsigned int fw_ref;
>=20
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> -		return;
> +		return 0;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		return -ETIMEDOUT;

There is no function problem for this code. But for single domain, the code=
 could be simplified to:
		fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
		if (!fw_ref)
			return -ETIMEDOUT;
For XE_FORCEWAKE_ALL, it will go with your code.

Shuicheng=20

> +	}
>=20
>  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
>  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_i=
dle.h
> index 591a01e181bc..9c34a155e102 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -13,7 +13,7 @@ struct xe_gt;
>=20
>  int xe_gt_idle_init(struct xe_gt_idle *gtidle);  void xe_gt_idle_enable_=
c6(struct
> xe_gt *gt); -void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +int xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);  void xe_gt_idle_disable_pg=
(struct
> xe_gt *gt);  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer=
 *p); diff --
> git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c ind=
ex
> 0f8430acd16d..88557e86d637 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1076,7 +1076,6 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)  =
{
>  	struct xe_device *xe =3D pc_to_xe(pc);
>  	struct xe_gt *gt =3D pc_to_gt(pc);
> -	unsigned int fw_ref;
>  	int ret =3D 0;
>=20
>  	if (xe->info.skip_guc_pc)
> @@ -1086,17 +1085,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>=20
> -	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		return -ETIMEDOUT;
> -	}
> -
> -	xe_gt_idle_disable_c6(gt);
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return 0;
> +	return xe_gt_idle_disable_c6(gt);
>  }
>=20
>  /**
> --
> 2.43.0

