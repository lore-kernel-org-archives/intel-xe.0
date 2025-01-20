Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E85C02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 03:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F27110E162;
	Mon, 20 Jan 2025 03:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vd3lRh9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E870D10E013
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737343742; x=1768879742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JVyxfb8v2QqS/Vr+GV9ZbJkHcebuKfWkJRfqx84OMgM=;
 b=Vd3lRh9fN20kPp1INoCsnCB32IF/JDvmjzr0s0FgUN9AR0TIrA60iMp0
 qfOb+VtR40C+1tNTWg6hTaO3HwKz8Iaz6p3qqpSfrPIc08xMbUcisC/Gk
 6TvWq9HUx4xrByKuFDM7qWPJjeY/v4fJzbIH14rnPJzMl7aahimnQAJNf
 2EbWIE6HFHAtGeWNK2ZR+RDhgHrtp+uKZetCdQVYfHF1wZhPzwuDxwkLZ
 SDjrU5umxs82EbEQUcGtFC5gDdK7LuCcz1WK7zOJMDoVtirqJgp8IqGPH
 UH7TlHPeHJUVriMA57gCoPzrFMHqvlvizC9M3yJSU5LAuS9pCGjzYS0Jc A==;
X-CSE-ConnectionGUID: 3XuhkQIYTUiJaH7omq0dLQ==
X-CSE-MsgGUID: 4Azi9iO+QgS5VgbZFuAzTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="36918606"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="36918606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 19:29:00 -0800
X-CSE-ConnectionGUID: dyBoi9xuTLCtxfg+3WNAAg==
X-CSE-MsgGUID: 69ONluhlQauWEKJnzBxFtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="106199440"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2025 19:28:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 19 Jan 2025 19:28:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 19 Jan 2025 19:28:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 19 Jan 2025 19:28:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyb1t2EuElqpJMVC92l7JV0+Ue27J/e2i6Fd3VPdLi2o1jbEOY5x3TRc4qSbXA0um+12NLl5lVTlurEY544T/PH0so6pFmB8qOr8/B5RVfH7ccvvReyVQXnKDGJlze8Y1KhVortM7Dgowvv+UiiVnQ2o3/48C9TLUUyXjJHfq97FAFXUTi8S537o9DuSqzDPYHlLzyjRQKmThXPLBbr+1BkV5UXr7RtyJSOe2HjHsjx94W2MbynqgpsQ1qSm1lfkwYhrXXWYjZXs0Gj6Rjj47FHbHoN/kA1SGV0BWqmJs0TohaqYdbawK23dtPLgQOyHEV60y3vGOh6ao1RA4zFH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXgSBdH5Z3+n9lhm2s4HMwDS/oagwlsJx6ctNck/XUk=;
 b=YYR4RQqxwQ1+EvjBWL7iqpcVw/nKnHm/YzAcs4hScNHhcP6bCeL/woQfCpdYqtqUPZ+3yFmZCjtHwBNoy/A1Bm3+Y4XCCj9VEBl8+8sJuHbtG/os07aWIF0Wknz04KlyEfwQlSInZ3eQjDwBZwcy73rBEkenVGZLpAND5G2wzMwqZy20xijOzR7iH5vIKyoBpah7x7T2Z8jpzWolQRmpvH6HVwDzF7VLzpK/KZ+RnWQ7PNbm3TovJRSRQZHAVIMZ0fSzm9ckiEzK2YY51BPcOKVsPRXYw8XO7G7AyGPGoyPF6fJAi4Bd5KD0VsAIJiuLrAPLZ/7lhNUtmyM9dxKrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8495.namprd11.prod.outlook.com (2603:10b6:610:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 03:28:07 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 03:28:07 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: RE: [PATCH] drm/xe/uapi: Fix documentation indentation
Thread-Topic: [PATCH] drm/xe/uapi: Fix documentation indentation
Thread-Index: AQHbaRdlbVpxjT/5x0Wp0dCyHLU05LMfA5hg
Date: Mon, 20 Jan 2025 03:28:07 +0000
Message-ID: <SJ1PR11MB62046663BBD6AC02759BA18681E72@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250117193827.91779-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250117193827.91779-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8495:EE_
x-ms-office365-filtering-correlation-id: c0f65488-2a4c-487d-d8c6-08dd3902750b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Dep4u8XO9Czers6+hSM1ONC1xjTNVqXi/buzLtL5CLX1rEyiS3n292GKIvfZ?=
 =?us-ascii?Q?DVbZW3f1eXZPunCzWCAM9BecriWyir1FCyblLyTUxgqpINWQ4HP1AJFy4NQJ?=
 =?us-ascii?Q?tvq6PgdvGnXa8epFQ1Ic+OzpDaqx8n788V2KsyN0WbtxullYgdS1RxzKUOVg?=
 =?us-ascii?Q?wQKV152IZvkOEw2U2TB+wJarXDwSimQgxj+JGOf3OqpJf9vKOKUNjr8pu3Os?=
 =?us-ascii?Q?oU3xJfRNPYCiNtb/ehbUxlrAbPPkt0RD96qOihTQ9hiDLuE7xNK+yMQm7WlT?=
 =?us-ascii?Q?9KH8QiqisTApSauKHvb1Ih/o/+WN8/gjQQYN8SQgl7HFNGPsBjORYcVWHlIn?=
 =?us-ascii?Q?AuKQ4TUUgITN924tXglGaLEdN3Gh/seaNPLaHXCM0EKUL+ewaKRODbfEfG37?=
 =?us-ascii?Q?X26HoebqMHzkp0uzTGd8XzdoXNGRY0M992MKvqpLT/wXVMa118BSBUwUC+Dw?=
 =?us-ascii?Q?P535Z3T1/IOPygl5TRCXZzqtZa3C2COg9XN86vXjzDNG7YbnWyQckuIh/auc?=
 =?us-ascii?Q?CRY/RTC4P4SKBYD2oKPgAq5HWqOGRWIGAykfglCX1enhP1WDCZKaD8lJ1VxO?=
 =?us-ascii?Q?pPLU7b2rdn8ME3ZBDVQIe5ByyUs7eYa+tTadtOXPbVfbhzdpaBRWiOXrl0aw?=
 =?us-ascii?Q?M2ezhdMn5b6dJQuP8g6ohc7ms/nWUufvFXL/UoMwOHtNiWDTka40JOgENmrN?=
 =?us-ascii?Q?OrCedOORYP0KbqMXHoWqkjUtYruU6+r17BjkNLW/yc4lUuHWan448U47At+l?=
 =?us-ascii?Q?JsTcqHFRyeLikDq5AE9vZ3+5AdTcGTqFuHfrp3+4aT3Nx+Tl1uxKuytMogZJ?=
 =?us-ascii?Q?UpdzBgry6e+lbWZ1rjhBUgQqijOocSerQKNcngQzw9ZbazD1ymb92IeLW+gn?=
 =?us-ascii?Q?Xv9zz0jES1RPV9tgZIvSlOSGHzP6CWH6xeexDD6bvwqRjeyC6u+CG9QwPYvT?=
 =?us-ascii?Q?/4+GPkMhVyoFb8Dj3Z6tyNbhZcT05gBXUoSe8CPemoP+pcoz7vMwcGtQJ4OH?=
 =?us-ascii?Q?1MAVuP2cltzkNIHgpcMcqZB7ekNI3NPLdACb8Tq1ZR/SwUS1Qeq25kSD4dOh?=
 =?us-ascii?Q?vLKimKdjoFJo8N4+28vsLi3Rp7SltcoXDEI8RZmnB+dVyhR/6Eh7OZJmkXEO?=
 =?us-ascii?Q?ksQWprpHeyE7SXhkjqx//i+RtWQEft6DulSYej2tUAH8vkNXKU5ewlIFNCBJ?=
 =?us-ascii?Q?41DIVIkiJGbit2Cw4O7ySRAe4KdbNCHoRYcRSZmtHrNGJmk4JUNB5Jc4G5o0?=
 =?us-ascii?Q?dGnKnuuoWjXQir8tjiXPpAvqQiqjvCDa6w6Z70ggfLHidaySvUS2uTq23m4j?=
 =?us-ascii?Q?Rptzu3OgU6Quy5YbXF3zPa9tdJ9MTCJvsmeP6xGl6dIgVX3EFZRNXfZ71feF?=
 =?us-ascii?Q?zlHP80g0fkz7D8ib6yu8i+B+538cAO7RgLA50f6JpH/tdoqE+Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yQt569kIGa232s2eyli4o2xrdjAYtkcx5NLXKx5tgxQdH2zSx3/7dF6kZ/m6?=
 =?us-ascii?Q?H3Nur1HMnDZTe/0G4tYCDxOPA46K/Uz90rdh2/BOXL0HPB4AyOP4Z6rCus0F?=
 =?us-ascii?Q?iSgbnNJgT6J+gk6Vhiiyfr7hKfte8C3OARLXPtObMAGRr2zxkR5E4F0xvQ1h?=
 =?us-ascii?Q?Lvh+3WVmDYKTcTAkUD7Hwoff5MURjNKLlWB53CoHApYhF7Cc9ywrbpyvmI5Y?=
 =?us-ascii?Q?jrivZuwRseaSDpTAncaMWiO9j2gNMOwjX1wr0pnRmYDHLXrt7NS2qUhl0EUI?=
 =?us-ascii?Q?YninT83jCkXFbaZgdgKxP5s4mhjAWWRwcEoKn9BITNmBMQU7k0hgHTaXM9XM?=
 =?us-ascii?Q?AxiteLjggXglrfQQ8yJ/xAAT9FkHuuE1HUIZ3n/A90vr1TmeVc2jYC+jmVfl?=
 =?us-ascii?Q?0l+7tA2vEN8OJB3oaOQTd4K7AEOwfS0DqPilWvtdStmcV2EvvNS8lcQbjQoA?=
 =?us-ascii?Q?V9PuP4jKa4R+LHGY7hsMtKc0sFBywdR/ppI/h1Eb0mLTFJ+i+jkMZ7F+Sz4e?=
 =?us-ascii?Q?aUuHInLkIFjjmvUdJUubCJBcrhCPnKe6SH788bSGUrz7L3nM+GL22H5LvFw7?=
 =?us-ascii?Q?rW0w9UjFCAkt3ycVSzL/s9B6hInEluyp/kiJLkt4n2qZK6u1uH3DUs5MEZkU?=
 =?us-ascii?Q?ErT7de8+AVsHWZHedz8JFydzEnr/tyCaxHyRbwEUnvF8z4jUEvESmd3PdQGN?=
 =?us-ascii?Q?Dq5AKGHqjqKXgKDYjxJ89SV2rNVdUw5ysjxKN3CLNQq19dT8GR0iJh/aWwJR?=
 =?us-ascii?Q?DRcAkO/YDtqoMO5IADQoI1Cy1V8Q8Vi3ZnTyV0UaTOJuDPCKbfmT9URip03J?=
 =?us-ascii?Q?sKBPGFZZFu3fHzx6Z9ivWy15eQujDXlm+YMTMap9VnEDvTALhqTPuA3XinQF?=
 =?us-ascii?Q?kcTYmODdWrY/+kdcc0WVtUEuK2ndL+pMlk4YdiYtc5kwmlKtK8uE+0JajHjS?=
 =?us-ascii?Q?soPJ3y3AgQDRuM/H0Kw3flvo5EvUzo9RCRSZIQQyGbzs1A1WfhHIqi7tz8kd?=
 =?us-ascii?Q?YF0LLD6xtSODq/oOMe++0si7ovTR4esB8B6zIli7UK8Oxdr8qj4pd1g+KW4a?=
 =?us-ascii?Q?s+vrhkkwhlS8mJ9ZcIc+2uc2JvNXbYaj0ZtzTMfubxwslULWcLvfc1a+6b8h?=
 =?us-ascii?Q?wNN4hRT3FpcZsHg/IzdJzZRCaIZ0A7bEcRAms7HNbBBcj+zeDs8H0/xFlsbV?=
 =?us-ascii?Q?K29wdJuVDddnKezDiIqhX1Qk2eyg5BGPKBtiFPWNdF+9VshZ2lQX8ImTyeuD?=
 =?us-ascii?Q?7K3X2ddSg+Vxa9eVhbgg1qXzexwXNtq1w0FigdQcd+2pPAn/UFXgoZy43s8I?=
 =?us-ascii?Q?7l0kgBUnptWNWVMz+soC2SqfdHzlnl5JS/lUtITemUdJ1P4i7/lDnAyo21Go?=
 =?us-ascii?Q?bjBsaSm4QghXXvZGqfDjw357j4Rw8SRM/kTdXAFOoFuJXBGyCSz7JwEESECH?=
 =?us-ascii?Q?KoDijx98IUtRbTr6BcuDGdAmfiwbJIJknhXmaIhQ9SCiI2w4Nr/0dTuLpUcA?=
 =?us-ascii?Q?TnVSuSzUY5N4im0bfS3L2CZdnh2jzQU8VCAa2ZKRgSSPKcPuuNiJs7WED7CG?=
 =?us-ascii?Q?SLl9926qh7QkqsDqOXp9aIfoptQzsFfqqEf5/VEz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f65488-2a4c-487d-d8c6-08dd3902750b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 03:28:07.2593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+Ph9fbsa38i7w7awdge3EfaIC1JWRSowBKeKu8C/vQkQPjFblFDOesBpkMz23Z8QHn7eKPcg3qet71AE6ddFn6hUhUymsI4tlVHmpzGUO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8495
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Saturday, January 18, 2025 1:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Stephen Rothwell
> <sfr@canb.auug.org.au>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/uapi: Fix documentation indentation
>=20
> Fix these issues:
>=20
> Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:817:
> WARNING:
> +Bullet list ends without a blank line; unexpected unindent.
> Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:835:
> WARNING:
> +Definition list ends without a blank line; unexpected unindent.

Unfortunately none of these showed up in checkpatch or with strict option a=
s well. Nevertheless=20
Change Looks fine to me,

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
> Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory
> barrier")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/intel-
> xe/20250117164023.3fdc00b9@canb.auug.org.au/
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> cac607a30f6d..e2160330ad01 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -814,29 +814,29 @@ struct drm_xe_gem_create {
>   *
>   * The @flags can be:
>   *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query
> special offset
> - *  for use in mmap ioctl. Writing to the returned mmap address will gen=
erate
> a
> - *  PCI memory barrier with low overhead (avoiding IOCTL call as well as
> writing
> - *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> - *  instruction.
> + *    for use in mmap ioctl. Writing to the returned mmap address will
> generate a
> + *    PCI memory barrier with low overhead (avoiding IOCTL call as well =
as
> writing
> + *    to VRAM which would also add overhead), acting like an
> MI_MEM_FENCE
> + *    instruction.
>   *
> - *  Note: The mmap size can be at most 4K, due to HW limitations. As a r=
esult
> - *  this interface is only supported on CPU architectures that support 4=
K page
> - *  size. The mmap_offset ioctl will detect this and gracefully return a=
n
> - *  error, where userspace is expected to have a different fallback meth=
od for
> - *  triggering a barrier.
> + * Note: The mmap size can be at most 4K, due to HW limitations. As a
> + result
> + * this interface is only supported on CPU architectures that support
> + 4K page
> + * size. The mmap_offset ioctl will detect this and gracefully return
> + an
> + * error, where userspace is expected to have a different fallback
> + method for
> + * triggering a barrier.
>   *
> - *  Roughly the usage would be as follows:
> + * Roughly the usage would be as follows:
>   *
> - *  .. code-block:: C
> + * .. code-block:: C
>   *
> - *  struct drm_xe_gem_mmap_offset mmo =3D {
> - *	.handle =3D 0, // must be set to 0
> - *	.flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> - *  };
> + *     struct drm_xe_gem_mmap_offset mmo =3D {
> + *         .handle =3D 0, // must be set to 0
> + *         .flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *     };
>   *
> - *  err =3D ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> - *  map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> - *  map[i] =3D 0xdeadbeaf; // issue barrier
> + *     err =3D ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *     map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *     map[i] =3D 0xdeadbeaf; // issue barrier
>   */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */
> --
> 2.48.1

