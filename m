Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2EED5B861
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 18:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD8510E0FB;
	Mon, 15 Dec 2025 18:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P51N++Ty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEB710E0FB
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765822431; x=1797358431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hOy7CLcYKwuHTpXh0Vr8I8ouFekwacs4ZFiDASjAthw=;
 b=P51N++TywQPTyP03UaWtyzEgEXvJjhVZJ8LtS9MF0hhwp660bpBeAg6h
 eFvi2iweDd3VGGaP1YCSzWyruavzrTzJZNfRZD3tAZuZig11iGC/ZQ2h9
 9zksaoSFJoyj6roGERXICm17I5fK/lO2VQ98fEqdc5ICpE9VvYksorbJS
 k7jaIjdse8qUmD/C5LpZxOyx0NyidGUpTX0zwAgb5KRYNiQ6JbeZmx/lv
 CvcfuY3MwTrpWr6MWlyke/eg+vtkUpJpUsbxuthNbRMGoS+QdgjZR/YU/
 pk974cLoHatNnu1tFMTa1h+02DVl5k+M/QkpZsWrMmqopz+7zRUCfKAVp Q==;
X-CSE-ConnectionGUID: Wzyw0zZzRAK5qcsyknC0JQ==
X-CSE-MsgGUID: yt81BsdJR9WhYy9cHraNJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79188412"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79188412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:13:50 -0800
X-CSE-ConnectionGUID: JvN477cCTDqOSd+RunnXXQ==
X-CSE-MsgGUID: taFjJ673R4mEYtJJfd030g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198614905"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:13:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:13:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 10:13:48 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:13:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYibFwp3DoNaqo9HLnJ1w0N9V+LRSX0aiTdqI5wbFmI+US4yKrjt1YPUbYfwq1MzaHxTB4McgLzcxfThxu/pfSJTnnWpoDi0mPJwGLNpc/JX4/Y/i/xpc+Qh03ZPVfJdmjGGPKzRg9roLJY+O9Y2K0oY+xeX/t4YCh0iyVvQNboohxYeJBMellFClEHxO3nvvo2aAirhqqV37IaCQms4mOxhG3jn11d4Sb3BdSZF+1sNi//vt8SRc2bxoX8/HVNLlmdgubFexczoFFj/Pt15tCTabFB0Oh6NVILqe5P+lQ/VozQKplMSz9UYD0ZELKT0H9vAzYmo0NoQIs1XH/Lnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+rgqXs0jqY4uk3BhLY8VRCd8VgRrvwWoggpE0kfhc0=;
 b=WXP9HRHtavo+rUqy9emMap+sKMIAeIHHWTKHTTVOHXspz8w8GZFzDYC9iAETV4PhMftK/QfaSInESU+QeWaVJIaRVQn72lnERCKMTtoDQiWOMELnkrNtrDSME9aWKyjhBbhwRrlQijftF4vwGB0ZE6b7gtuBM6PmTxQ56Etge93nkV08RA6iRVKPtU7qYfbxomwCuvrRbyJrFufH9Da5I2MeMckJEy85PPrf+fZ5IvC9AgpW5Fr00a+qpQk3E+cFZ4mpIKO2E811lmnHSD2mKZIr5rhoCkCZvhU+D6Vr3jTBfk5YIgakpBhYcL4nWt/upv9Ay/q67LJa40tx/fnPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by CH3PR11MB7249.namprd11.prod.outlook.com (2603:10b6:610:146::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:13:46 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 18:13:46 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Fix version check for page-reclaim feature
Thread-Topic: [PATCH] drm/xe/guc: Fix version check for page-reclaim feature
Thread-Index: AQHcbeT2RAT+Lq0Dj0iUi1ySWi4A3bUi8ULQ
Date: Mon, 15 Dec 2025 18:13:45 +0000
Message-ID: <SA1PR11MB8839A4129A3CA25B64BB0372AAADA@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251215170433.196398-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251215170433.196398-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|CH3PR11MB7249:EE_
x-ms-office365-filtering-correlation-id: 2a9907ed-ccc1-4734-7e9b-08de3c05b015
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?SSSgCLwfZnuG93/NE04qpZLnxeZ0kR/GQ3kDX09eSzrOhz5U/eITjDthMY0I?=
 =?us-ascii?Q?4uA7jqlWWs6PGsJXyywSDwBfQUkkrbStwNNJsMwtn7X9UT8NHK/wi8ByTTwB?=
 =?us-ascii?Q?BWeC5nEWqGT9/hszQoE6Th2aZv9jGxWAQgcGCq3tWqxOi8m4GXRLCfHzy7GV?=
 =?us-ascii?Q?ESFZhABAwgB9wRioujI0u13Vgn7cBsQPS684S9kJg1MeXwFMkIFeRXmMTWCv?=
 =?us-ascii?Q?64XCazlzOaHZcAPXKl5mARsnKxBH8ZNI8yZTpf+uWftnOwvU1h85oov/XS0N?=
 =?us-ascii?Q?E8bts1VXJvPUmIO2YZXsjJMMRijVMUu+hZpCEz+wyd//mdtIUjO4tun5U2vN?=
 =?us-ascii?Q?eGxnUiNrDtGLkP/0UXxukuJPfA6e7sk9rQTEC+eDIxhUvN0+4d0nKCz+kw7/?=
 =?us-ascii?Q?n/m7DGtmdg9pI6wyKwWjvRDzcA1uMUovT+0r95yMjZEh8W671hqbI68aNJum?=
 =?us-ascii?Q?Qu0ArvkbVJQBaSZU3EVW0ZJi+cCeb0s2vZtUvc+fW2A/qmpP+4PrmGeGOp4Q?=
 =?us-ascii?Q?VIsCJl1GqeJd+aoccQ+EeVH7P96fNVEg8sUfgs+2xOfLbJssMfvo4OE4Nv8a?=
 =?us-ascii?Q?n4i1rv2tgLZxNxVPzCDXzlTaef0LPlbEwmyJp5Lm+ivhgOmeKpRW3rvi0cKS?=
 =?us-ascii?Q?3zQBkUWtGVRO6KMUpn1eaML/mhMO67jsNAPgjAKKkYcXHL2N8M1UJUnJOLCM?=
 =?us-ascii?Q?9/8lbr/GBPnPxp+CoZGlGOv8mw54+UEM4ic/kyOv6JCMzCGGmL3M36tAGipb?=
 =?us-ascii?Q?80016/7g83ahn5OIOyVwTQe18g1wkLOad8KwlOuRlFnzza9efJLg4HBrjkTa?=
 =?us-ascii?Q?jUfMS9xTZm2Vg2OhvbzNXjZ7Am6vr0Jo2F1yDPYGM90hVRzZ35DtkpExdQEQ?=
 =?us-ascii?Q?p9J5khpf6bsRfxPNbLPg4M5l2ONdwkXE3IowklnMtrfM6CA2BIVMt0O6wk60?=
 =?us-ascii?Q?yU2x1F4UDBwxijQmMlcaqdlaxWVEM+2mNAaBYs6Z48iPa0d8/Wj43J1dhY8F?=
 =?us-ascii?Q?lOdnmNk5Pqu/JyVsEoD6AsIpAf5i2JpN7jDETv/AboU0xpXRe7GmHjZpiSy4?=
 =?us-ascii?Q?GHtZY/sG/G+3qBvd/gDyWU3L90UMmFRXkyhU68JVXCDbYxgxJr/wUgfJts6t?=
 =?us-ascii?Q?/IL7f3y/XotOza/ZsHEivjHIW6agfqgq8pq4TEj6bQsYaZH8mgonP8YGs/5U?=
 =?us-ascii?Q?8AWESK8JwbIeegy9LZMyo9uiM54cksmu2/TosYQa5f+VSUbsaThg9VZtTa9v?=
 =?us-ascii?Q?k86dzLoEE1pxrqQ0aYgpCP2QDQ9AoEMudoWcKJBLaaXrWXflEweROSfqTH2q?=
 =?us-ascii?Q?Ik+DjvEvxIEuAMy+/8xDJ6vaH7FQAoh2zJcJut8u8jZ93ULsIUWK0CCvP6oY?=
 =?us-ascii?Q?VOZY2GeDvrw93VBeIox8x/N945Xiuyh8MXd8xGYKZxpGCmMPAqUd3tAIryHs?=
 =?us-ascii?Q?gi3XY/ELooXgr5Y0HER0vLnlKzytKuZ8aHE09atTs2d+o2RM42IMWr9dFowf?=
 =?us-ascii?Q?IwJTZ0nlObKiGHllUQHHF4Br4TujnimV/Wr0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2HA0dFnR+BxicgTX/euZ+dkIXQKzY0zXNkpBQ2VTl04sgxkH8+TSVKzp9mCk?=
 =?us-ascii?Q?1v1PXQEB3VHSO5jdRLVV8lsSgaZcwq04LDT2EpWpHmNTTemxaDHzC3cqOqtW?=
 =?us-ascii?Q?yVGIdbCKJtwHRHPAvGFEIKtDglIOTdqucA8vkbxCvS2WMBfhws5QBQqP5A8S?=
 =?us-ascii?Q?MxVUfa+jEdMfnSstEFm+Ih7kk99Ev3PiXzIS5InYwLl+Gn51goM0p+snOOkQ?=
 =?us-ascii?Q?yrkcxzbKevolJh35PNW0dOFNB+tTF8NEXLCYzyjvLFHFf2ogHNjeACmmZMB9?=
 =?us-ascii?Q?bKurKZyNYjpgbPIKFKCU4ATq+Za4451jKWRgj8nupEyEHt1W/8iMU4mPUkY2?=
 =?us-ascii?Q?GGYcqQnfrOfq3Hj4nr0cPZh4hbm318X9wEApwI6P2JQDpGLwUYedambjZ/bE?=
 =?us-ascii?Q?2lUKNMeVdmgaLno4nEzjrmaB8ta9ywx+V/uX9eB4yme3Vk+RziYv7h124eXn?=
 =?us-ascii?Q?wqVsBUOeUaow0qy1hW1LVcDz4jZqab+1hwtGB2v7xiPIK2RtSbAkL3tdgtyI?=
 =?us-ascii?Q?9+UXcFKOjiV8fua/gGBVU3CI3TwOvaD+uNpb31fyniA7KMo+iw+bfxip/IWN?=
 =?us-ascii?Q?DXeubFWUkCaY4FMNQ22eRf6MoJ1UYC1ynN0cMMgc6k2GOemaLryHn/XwJ7p3?=
 =?us-ascii?Q?9YPVBax38gLW1X4/qmjvHJ8bfoHD3811ZkJyiGD/jGtA5Ze/ZPpxFDNOJLvm?=
 =?us-ascii?Q?3+IyRlKT53T7xMD96ZrQXpF+fyT+03+bHiEXilg5VsOnof9lwZZSEyGHDFhs?=
 =?us-ascii?Q?3RLK2dU8qdgSxrzEnX3rUuvUsaUBAFFlYnbUJ/xSMmk1hw2gJ+QfAbYxbcAi?=
 =?us-ascii?Q?dKcCEJJ8REx2JwZzNLDhU5vMzDbZMfQWaaHkomxKpuAknMUyopI9TkQ7rWGg?=
 =?us-ascii?Q?gab0ePQSSaPBa4rYLp79KFF8rSeJYtsqEZkIqRX6eIac3dy4f3iQKW3DnSGg?=
 =?us-ascii?Q?W4JlqczeWt3VzmKzl5/3hokOgrBDtI0GjYpIgajw21e6UcfDpepTWgstAzsd?=
 =?us-ascii?Q?nJ/RmQ6zhqlXa26oyVWzySFXgBvIj0c6kS2bKPCcAyL/redL01tPAeBwTA+J?=
 =?us-ascii?Q?2jkVxoN7PhlgRDzEnzfjNTUrwoHyq6SxSWY+acaoupQP3McymPc/KTGPmNv0?=
 =?us-ascii?Q?h2JIErw3inYUtDeiZIc0W072PfGtYHHtTRSyKvoH7JI5l7Z6mKFWAMkdzeAT?=
 =?us-ascii?Q?D1I+W0JdPCQGXkotK/JHFrqkIdeAphTAOQB2c4mpJaNvPGTixvdlmMwfyBBW?=
 =?us-ascii?Q?0Z9CMZiblPmXVcXagKMgm6dneMS+nCCQMzFE6TT8cCyDIrhxR960NVDyCwiN?=
 =?us-ascii?Q?dGd571hBz0k2fJYsyB470LEPut7u6nU2UcE4SOIZv0HXNiqboJH/mloetFaW?=
 =?us-ascii?Q?JMxWY4pS/qCNByZvOfxsIE161crXnj281GCFeWiy2SqCbm1WJnqJ8YJAGhnK?=
 =?us-ascii?Q?NZ6+Tu2WPyalwrayQ/LRTag6ZNKnPOAS/umF0q6ACVu6Ks9xmdFZqnmlHEVP?=
 =?us-ascii?Q?nKt7n035K221xOX44v6WFcYBk235tVdIDZ1X4ycVQhEu+qsYYs5Kfmxx5vmq?=
 =?us-ascii?Q?2pl9EgoPOS6y1iTshL7LGVcmd4+KgJLurQpQqzjk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9907ed-ccc1-4734-7e9b-08de3c05b015
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 18:13:45.9337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZnHnsmUVFR/LzJ5vq/1+37RlhpvLH27AsDhg+kDB8pU473p7IZpJ+Z2SCcLAvlQaReGC9CVMhgfVCVtek5E1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7249
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

On Monday, December 15, 2025 9:05 AM, Michal Wajdeczko wrote:
> Page reclamation interfaces were introduced in GuC firmware version
> 70.31.0 (which corresponds to GuC ABI version 1.14.0), but since this fea=
ture is also available for the VFs and VFs don't know the
> firmware version, use GuC compatibility version check instead.
>=20
> Fixes: 77ebc7c10d16 ("drm/xe/guc: Add page reclamation interface to GuC")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Brian Nguyen <brian3.nguyen@intel.com>

Makes sense, looks good. Versions check out.
Thanks for the fix.

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex 7daae3294665..09ac092c3687 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -768,7 +768,7 @@ int xe_guc_init(struct xe_guc *guc)
>  		return 0;
>=20
>  	/* Disable page reclaim if GuC FW does not support */
> -	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 31, 0))
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
>  		xe->info.has_page_reclaim_hw_assist =3D false;
>=20
>  	if (IS_SRIOV_VF(xe)) {
> --
> 2.47.1

