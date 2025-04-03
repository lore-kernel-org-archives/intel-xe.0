Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD89C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 04:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6056E10E903;
	Thu,  3 Apr 2025 04:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjKGdFoV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D99310E903
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 04:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743655502; x=1775191502;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ijYVxyDcPUqIDVYANy4mTNHEwUsRgd6dBJvf4i+zNoM=;
 b=OjKGdFoVmRYtShS3PFdOQ8cuKLu1pqUc7P8Zd5rTt2dcjbpCNPOshljW
 qqqtUcVe0PhC0Yp7v0KuFUXgh0vjvs3f9UM7SUBo9AwQu+q7KVyKSyaw6
 mmgUGS9lMeef32GYUlpxRrkIspGUOWLEDbnRCO0UQ07nd6B+Uf1H9Xkdo
 8wWe/0Eu+RokkybomkBjFnt13bV7DibZi7ymY0P2sc+v3e6A+tDXzySVT
 GBrdkq/GHRXtA+iumVPEmnxNDJ5loOK1mYTffW0qGQlq9gKkCj1Wqx6eO
 qnpFbLLlHkgWqFgOBhEaY4P64ZU66bbziNqcWMay+y7YMEqDULpA8zEbq Q==;
X-CSE-ConnectionGUID: xp7f+qS3T8aF4uAt3pvaOg==
X-CSE-MsgGUID: XKWHWelbSheGTXdkjbVj+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55242140"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55242140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 21:45:01 -0700
X-CSE-ConnectionGUID: Jce6URj3TY2xta1U6VZRCA==
X-CSE-MsgGUID: /iizqV3BRHKLrEv0fyfWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126657309"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 21:45:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 21:45:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 2 Apr 2025 21:45:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 21:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0U4XPGjvaY4QuzkZJkm6snL++zQNye9yHvtSBtf05/IX7utp2MITDvPe8vxZOQPs9egNPdc12MLZPIKOoayEQyVK32fyFRjiiBWAJOIyC6eSFiNb70TnkQpvz93T9sZcyOXISRUwZn8JQecA+QyWBo+ol01knsslNrad8BT7DOP4rL9XWRs+VHdiFWne0PVKA+z2xcU3CuwFKZhXh+okkUI3dwKfNZEpJFEWDDI5Zsh5M7KyaELGyuaB+P9QYw7EOefYBgXelD0+4syIwfVknlXgoGEm9Gn1UmdI0pP9FAONxAuGZQcYtD9Za0+8PjXPezuOMf87DIAE/dTGJekZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIo7Vh6+K9pUPL1bvVwOSMqQ65Z9lzbBBxQYJjaCUxg=;
 b=S3hsGHqyI6goAA6uWeQRx7XelEUogDPBfXRWhkxxP5svzQsXeJ3d4ONv9aDYBhRHhGNuUOvIt4/puve/5/qjbnAlX2Hla/R0L5SD7PiNGKOE6QP2ri7dpKe6PFp6qlXje4aUIy3WcsJNNUpfGv5bGiqmgRPgsezxsDEUAhBYy/HOcNeLHrw4soGLWpLTJAwy0jlke2snhONWpacEwPD0WEk69BLoc1eJc6JT2AiKbMJpGbueMkb3oDcUCioz2VHlQdnaHI/2+yomPEGu3vFm35gQ3KF6xnwQl0JFJwDqz6BK4SmaSMG44OsX86UFahjSoR3f1ry06l74KTjiyW50wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ5PPF6E320AF71.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::833) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 04:44:16 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 04:44:16 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v4] drm/xe: remove unused LE_COS
Thread-Topic: [PATCH v4] drm/xe: remove unused LE_COS
Thread-Index: AQHbpEsPV/VhhWyDhEeRVE4adsbzALORXHUg
Date: Thu, 3 Apr 2025 04:44:16 +0000
Message-ID: <SJ1PR11MB6204019D902743D0D9BFB96581AE2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
 <20250403034608.332548-1-shuicheng.lin@intel.com>
In-Reply-To: <20250403034608.332548-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ5PPF6E320AF71:EE_
x-ms-office365-filtering-correlation-id: 71b57891-1f26-4585-5a48-08dd726a3089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K5ChpR/RSnlk0z1n0zNFgawRYgJOuerFZvVRZ8r3cMf58MWhUpd6NFtO26gc?=
 =?us-ascii?Q?yX8Iyyqx3o9Kw1/WFiUIQW02Fdgnow+Z4JUL+9qgPBCZIn0SQLhG/c3m8+kT?=
 =?us-ascii?Q?J7TRia95/oui/J47rjJBAcJYIKsQghoHvremNKyc3uq1BLym/6jWuWxOVmfN?=
 =?us-ascii?Q?kqxSaRF3R8Zq+ewAiNCRUDsj89flonmM9EnBQIAn+tDPaxdiCWgjTtjEUXPn?=
 =?us-ascii?Q?TiLC8qpWKs60tJelDAm6k+qrLHHj9fnGKUiaMImM57Xp6NmP9bXQsHSSgNc6?=
 =?us-ascii?Q?WgVvf8Ra2uswowY8IyI/yTsd4/P1rwUhWlbV7CktQ+dzHs0oOjI0Bkzh3FlX?=
 =?us-ascii?Q?b2bd0Dh4w9cSjvZjHNKUPhpsTb989n1YoRgzuEsqN75MEScM26eZCMml5zmr?=
 =?us-ascii?Q?kiHlJuRvENr8mHhzT/UJ7dbnKlFhxxMoEBM4DZ7X5Y83gsJTqjL9v+92hTb2?=
 =?us-ascii?Q?enLPjj5xk9yksQpNKundxqMi6kEY2W4sS+R7thsH7J8uTHfBR9h2fOfmaoGW?=
 =?us-ascii?Q?mDWifR/zZvUCSFqhaunDDyZHuaX09699LJZs6m4GK3fgP1oTWYo3nqp9I502?=
 =?us-ascii?Q?gvrKkKg/1GFTwpWhCcahBw/reCt06eX3M4BmbjZOZrJ+7jhw/BRNDOIhEP12?=
 =?us-ascii?Q?SP5o6zcBepV4nZhLRt4KsGLFFim61dzGZX0QChsWNUVToxlk/Xv11BKsadz+?=
 =?us-ascii?Q?xRBxNB/y/8qDd9zQSiu8AfLklzcANlglfaqHF4PyycFXdqFdskotYJioadXs?=
 =?us-ascii?Q?ti26TsRVb20gizNxLNZ5Wwi/F09OuupYvwe5SBwxJfz8WfR/U8t0pxuObkpb?=
 =?us-ascii?Q?ejIyv1u4poNNQl/OLO4ATPMcNuAF0oW68GU2/Wq6jZlXp2lPxGKbtDrKeCd5?=
 =?us-ascii?Q?EyM4irJKBNxnZFs3xK4mhhiuWRzbyAQz//Stbd6KeGKAcxivLhZNKMH14aVm?=
 =?us-ascii?Q?yfAQg//LI+vjKVEuvWDyTw+3bu2y77ZENChEUKSTQvbCgfAfY+wnmzuE/b41?=
 =?us-ascii?Q?VBrWVd2S4cMxIj6xdRoRdYVJB7rVrkZrDWZh55mTSJ1CfYeKZopLqwsXuH/K?=
 =?us-ascii?Q?eBq9WPsdEFfZXq2uY7XbfWihY1MpjIwemR/aKlpz9fYv6WtB5/8MMufsynDi?=
 =?us-ascii?Q?0U6rGtAkCFDV6HUX56yNba7B8Xy0AyvEKKLxaciajSdmjWO1x+SoFhgILduc?=
 =?us-ascii?Q?CkkAtKjuRwNDssZlBEQjaaDb6UeOvplfEMMe8VY4RQOzkT0LIMaOUihwQfYJ?=
 =?us-ascii?Q?ffFsoP3W8ITgkO7abyXmXbmQ1HJUFdQGgb1Gc+S5o2+BHzz1/Qznwp6kv6iV?=
 =?us-ascii?Q?Ere/h2HGf+wSQDR8RDLzt0+18jQWAmP29N+9G9HjygKBgeTqUNEJn8gm3bXI?=
 =?us-ascii?Q?HBmxPpwlUjgwb/PgJJg6tJ/8w0cL7lv7wzFvLybmerrbQXhxOFyTGHyu/wDX?=
 =?us-ascii?Q?TFCWt2jrqM9F7W6zkLEoN5/t3cfsvKxq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tWe/cTT+H7cdgtJ5pqN5vNs9JS9QBeTd7pHGpnukgDOqa4kI8XZN7/dyi8FW?=
 =?us-ascii?Q?kelI3PJWglnsnka/bX0YtFn5DuUdsYWtMvAkQWOXMyDvELMRQrKIGNOVhuW1?=
 =?us-ascii?Q?glTIY8nipWbUeu8wE6GrPfQoVAUo7+HXiBt4ppPScY1Kvs8oJ4iGvm9bEp89?=
 =?us-ascii?Q?1i3cTBXQ+qul6BxYMlKYKU5+p5l3TWIAg0BspRu5ugZe5OBsDRQOUa01Z6vV?=
 =?us-ascii?Q?rYHDMbng4/5z7o1Ko5vW+bKxRX2wAlZJZPdmcD4O0MgM83+5jZ0Y9LUxsBza?=
 =?us-ascii?Q?mXgVpV3FYgqB5Cipqh1XbUPwXznLTp1xogawIfiWBgRoQGzDDOyDJHlsjOYU?=
 =?us-ascii?Q?hEu7/SndpfC/ybOkhfGQWkz8AkMJLTxMxN8ODJ66wYs4saIz1noyW9dyGUh/?=
 =?us-ascii?Q?moKNBL7cZwtv3NQDlCjO+CmSQDKfWQDVc2o0cXPmQgQjNt+roihVSwEl+//W?=
 =?us-ascii?Q?sl/X5xzSCbNbN7RGSDhOwh4+n7gEM8YRJa1xp7YiJytRKDLFyOs9hKUdx9SS?=
 =?us-ascii?Q?ZgRmyneMJPh3QQLpcSpnQaWaWg4fcCiApch3PJqm5cm4I6tjM1YbdtfjaMmW?=
 =?us-ascii?Q?k3NZ6NED5GaAqxYWBuX9kzcTHcVCRgcWNtU7L30rg+BVzbnFzWd5zYie0xar?=
 =?us-ascii?Q?GkVowXuJfqm0SboP8+DbWGPaF4k1da+Xtd6V0f8bll+JLRoW2LalRV4vigPa?=
 =?us-ascii?Q?KxvOIi4oKEqSGczhtkXN7wFMMBPkdRvgfFiGNOu7t2HyNwbAMkT1uAEtjwgs?=
 =?us-ascii?Q?rB0EqSmZqwjed+jzVxgBG9zd3zJXEWxWon41QPPVdBpHI9f4RgytnZEBU4Y9?=
 =?us-ascii?Q?t9YnGbGpCyUs9HIjCKem7fxqDdNN/Pn3lX2ggcUDbtjmJK8Hh4AInim9Z/6t?=
 =?us-ascii?Q?isuX2MxCJ7+VymfKAd2yiEmoHNDy156cgI5BMZzPekCYwNW1ARSUnTIwMs7o?=
 =?us-ascii?Q?S3DW8ABFMwqcQTIdZ2/eBgRAdnZKkQceIDn+86c4Qtfsul7GHlPj2HnB3JWp?=
 =?us-ascii?Q?4s4v8H08N3H5IwETHmES06N/guAamsRk8uK0rfTsBMVUsrvFCz4RwcyQd30B?=
 =?us-ascii?Q?ebgVio9cenCHeXXkWSYQD4FhhQsLSX9ftNYUr+C1FDPDiXkcypXaS1iTRIFi?=
 =?us-ascii?Q?4VDKOgPrZ9QDyFfrAnCDCKyK1YZ7QfvAcYvmfUMaQWYciZzX+7QoynDPf324?=
 =?us-ascii?Q?vCm0R37+5eQyiHhC4WaFI7Gm2m0YgIHmjYJ8SMbgO1Cl7gnwun0DmrQnKwH8?=
 =?us-ascii?Q?LcpkrNkW8bkMZWKY4d9YWXkwPnEzbHN6fmKGvJ3Ct9oUBKtBogl/VPfMOvQv?=
 =?us-ascii?Q?8TrcY9K/QSC/fEPaWVT3KihLmUhVx6qfXj254gyAEkcfiaAC+f7+/1Bb8P/e?=
 =?us-ascii?Q?CpmpsO48GROoLKCheU4hLSBhGxdQ3eTjRtQkR+PXG6S6M34VLGWqKE8NrLmZ?=
 =?us-ascii?Q?Ga3QbtnACYcM+IW5wqk/kVlk32+CzhyLXJ29DEmea1F+vI5Jn/UgRLMb98UE?=
 =?us-ascii?Q?F5iKRm3exzVxRdG6yh0Rxz8E8vOoPy8Ol84l7k5ncSRB8FeUq5A//9chnkXE?=
 =?us-ascii?Q?wA4KQ1+AsfpHtWNo34/XBbeHJQaoKod09m55S6st8iQ/vqz6dRhg5WGtnIC4?=
 =?us-ascii?Q?+jCnIKxBpRyNfGTFPxuC6ujBUs12QqEhFXIEY5oVNxG0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b57891-1f26-4585-5a48-08dd726a3089
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 04:44:16.2820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8DVYtPg69EeB2g7KeA05O+c2xcxrjA/WXWSRJK82El/d4LHUdUb8y5CiVqWGH5jD5/hioxsTvgpo5OEkX7Ak0yCx3r4fer1kl0E+joIne8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E320AF71
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Shuicheng Lin
> Sent: 03 April 2025 09:16
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH v4] drm/xe: remove unused LE_COS
>=20
> value is missed for LE_COS.
> The value for this field is universally "0" for every MOCS entry on the o=
ld
> Xe_LP platforms, and the whole field has been removed from Xe_HP onward.
> Just delete the line so that we don't have an unused definition.

Your patch says V4 but no revision history mentioned.

>=20
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index da1f198ac107..c1590e322ef3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -62,7 +62,6 @@
>  #define   LE_SSE_MASK				REG_GENMASK(18,
> 17)
>  #define   LE_SSE(value)
> 	REG_FIELD_PREP(LE_SSE_MASK, value)
>  #define   LE_COS_MASK				REG_GENMASK(16,
> 15)

Do we need LE_COS_MASK then?

Tejas

> -#define   LE_COS(value)
> 	REG_FIELD_PREP(LE_COS_MASK)
>  #define   LE_SCF_MASK				REG_BIT(14)
>  #define   LE_SCF(value)
> 	REG_FIELD_PREP(LE_SCF_MASK, value)
>  #define   LE_PFM_MASK				REG_GENMASK(13,
> 11)
> --
> 2.25.1

