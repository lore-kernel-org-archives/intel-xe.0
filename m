Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425AB10F92E0
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0613B10EADF;
	Tue, 31 Mar 2026 16:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkY6ZtQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FA510EADF
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774974671; x=1806510671;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p0If5+lZ1qDGHduMONHuhQ+Lb1FnmDXeVXjDGmk7pGw=;
 b=fkY6ZtQ9tp2Srq3zRONQOJP9F2BaWKdxWk0g58mM7jbCgNZiTxB506ex
 ychkYOKe3t7kp1k1/BKtVqxi9zvZoo49ayg96OnuU/5ua9JM5lbkygQf1
 aFKQh9d4u+vL22eAhzdVB0ysiqseHrU5sBFOVrw3Ya0MvvkUGOCQICmKe
 Fe2C7ZGODkj9bgop9UwpbvEvZ/6VELVan02HY2cE28ky08FIz/yio9HDY
 pHmBju59gIGyoEmxg/e4P7bcmC8ulmOEEJrJCWHhiFy2V6ijy8O6cIL1E
 USL26PEl1ZWkJI+jKr9/i0s4f7J9QKQyyAJHsVzQd6Bo+Wd3DTjlk/3MU A==;
X-CSE-ConnectionGUID: P9896l8aTVa3AV6b5HyVdw==
X-CSE-MsgGUID: ZNWOADNUQzmoe2FpxqCV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101448010"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="101448010"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:31:11 -0700
X-CSE-ConnectionGUID: uCVCFyyMSse6zn4swrYJrA==
X-CSE-MsgGUID: HPMtrWxDQzmDw4EbPdLcow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="225592596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:31:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:31:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 09:31:10 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0XBs5xdLmmMzPNThfDp3Ntm+qzGFVPXDNEsMJYSK6N46INRloIlmtj8KZoPCfoaDY+oaDLx1NYpUbVHo/Lp3wWxB+d3pnJiwBTTKLUMkoCace+Thdcc58rszPey+k33lOnLhPW8anZ1Ngz4sHcvVW79IqoEH3axHXAhf9qHCRM0BktpFJLDEkFxEot5oTdilOYgFSmulqjdXCewb5poOtzrE6X3Sq1MUUC0NsNrEghAYDrBTCwGUyrHkHSMgtOG7BBuSiks9oy8dff0F9M1g0YXJwRmYy9SCb9oAg81rLBZLZt58gOaHyb1bImy9cUaYw2LvZ84K4zLdw0VhOPNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0If5+lZ1qDGHduMONHuhQ+Lb1FnmDXeVXjDGmk7pGw=;
 b=MeMciZRbkPQBvlaXcmzPd6GsYhwxlUP5hXXb5Uv4LhYBrReyskP9Kk6+xz0G560R+PiKbVNyaNd0N6dN0prxUsTT4T6Wj3kSmttdzZDDnIVaXNCwe0OWMr97ULJj/2VMAn3ULfaMRNNefVBfxGJSAo+I4sNIOVM6W3/dSN4Rx5wgnM0ZZfq6vI8kLY7ELYHjKPTD63y031GLUuhKcWn53LVPzFvOUwZ9Rv48RfLc8Ff2UB2u+Z0Jdh8J8YmxIj7miA0+GjWOy36JY5afzswjxzAWKgRYxxViZuXV1DzY2lc+ooQceixOW8VPiWG/dLolkDylAD+uQgLLJUXpUCknmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 16:31:04 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 16:31:04 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Simon Richter
 <Simon.Richter@hogyros.de>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 5/5] drm/xe: Normalize double-underscore include guards to
 single-underscore
Thread-Topic: [PATCH 5/5] drm/xe: Normalize double-underscore include guards
 to single-underscore
Thread-Index: AQHctlmztmQdMqiFo0KsZ215HiKnlLXGvvaAgAATlwCAAB2sAIAB7Ndw
Date: Tue, 31 Mar 2026 16:31:04 +0000
Message-ID: <DM4PR11MB5456706136BA3A43A3F14F41EA53A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
 <20260317215732.2208976-12-shuicheng.lin@intel.com>
 <SA3PR11MB81183F59A452BF482C3338C9D052A@SA3PR11MB8118.namprd11.prod.outlook.com>
 <e8dc2c15-e11b-4e2c-a645-04650cda218b@hogyros.de>
 <38244de644bab2d58ffd80f2f5d4b3d16940ac98@intel.com>
In-Reply-To: <38244de644bab2d58ffd80f2f5d4b3d16940ac98@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB5802:EE_
x-ms-office365-filtering-correlation-id: ea79b8d7-1c02-488e-8fef-08de8f42e726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: OrHXWPPazhI9+Y2dTKcM6e1ggyk0wt0FyEsltDgnifkanTwiqD3fqzCNGFCOBsZCIdG/bNQNRQtvwKpk4oOBe7eM8qv44N3i/RHn3F0Wp1CMgvtUSkFRS0CGT7iM3kNw6asjmMBdr1zF3wlr/L8UAbdfUY1vnA2zo7FEbf/WzE0tZf5hPoGTtcU9MJOHgIYoHLTeOHJOCr+QtYvQc3lN9H9BupTtCHOud5Hc2deOel2qnuLZEXR+S+Z19XSUohE+1f9LaA/rlbsc8yEBITYo+cHKX3GSNBQ/ceSRkQPo1gHAUOWlmIxx/kHqUGpWcstJ22BejFrlVp1VVIkvbSFeW7VKzGQuRXzMN2TqdwAXXTL0dobfGxjQZ2t01R9d5XuJn+7tDPi0uYu06P4QI5KHCmY+ZXskI5J0OS+izQnsG43udVLDqcfkxDpLkiJ5H+w6nEcBeXHU/CQRUDOoGvB3teIyWVVdbxzqvybBjN3ha5/jmdYbLKwRZNfN6qanIJeP0AeMvt8T5SXWXNG6+yMsj1R1G902KMuuqoC0UHLSR8MXuq45iGt3uon6ZbQID6dGALW4plERJPgshBMklZ1m/jHhoDUfjILk55Wgi/Al7rUsSO5Nd20XYpaFCCcI46JV3RJnwwSYWX7K0HBgwWbA+WtKNCyCpmI4AQJEtX/2DjTqsgfccOaNFmU4SJNb7egrCcknOOoI7LwWgUz8z/FbOB7mPyudfGWwWkKZApVSLLWuq7ZVz6UXICLdtHGi2aXmfj//YAmdX9XFsYvD0EPlZ4FV5vFXDDhF/lGZWhWXGAA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x2k4CZkSSlz2c4f/aH/vE4h0AJpKN+IWTrK28WUsZTha0NpXfidvHNdjZMeE?=
 =?us-ascii?Q?SDGrGBueyrbBW2WDbRwTtPHVturYtojU4XWbtVRT2VzDa1TCEwLaxFutOC3g?=
 =?us-ascii?Q?EYbXSUlRsHqm1tkYpPepb/e/4yIpUQIjSBy/AZRjOozq3klo1/ErAadpP1P5?=
 =?us-ascii?Q?D9JZo2wHTj4rupwxc1VIumKmNEFrR5XjLDBWDklW4g5XVvraqgYS6vt7vITK?=
 =?us-ascii?Q?xb4Heid7Ww4zlT4wx0rtSpdpwLczVce9hzaw4/oYp6pOcEpF+Rq3nQ/dTNgF?=
 =?us-ascii?Q?7vyhtoRsJQ0hhFYeksVqjjAAbkRk2crZg2X1myVjEUq0wz7YCoD2e7/unkDQ?=
 =?us-ascii?Q?P6s45d5zbiDKc3SZEcqt+Hina2J13VZnoYMmWtg4Vc42PZ6qVk2dYsJkCgM5?=
 =?us-ascii?Q?pv4ABI5qpo1KH62E2xC2bhQKGUd79/zE9Eb3aIPGoC4KTpSrmM8fK+ij3JtL?=
 =?us-ascii?Q?vY6otL3Bi4FBAWOCEGu726CfmVevTd1c8rBIXZF2l9znup7YbNfh+Lj2WPRS?=
 =?us-ascii?Q?mG4dQLqf9Ice+8XY781hra2EeNrfWxkFVfznOl8GTCj52ounHRDHUBA5rj0T?=
 =?us-ascii?Q?mQzWO23Zsyg+b8pV92jaH/roKgU4nj4FXRVkJIUW/ct8sr/Vru6Hen4qaxWN?=
 =?us-ascii?Q?E3WQ0z+XoycFkJGaofotdwZGZNEm0CeGTe3Im0TdMlo2puaD6wlxN+JNj/aY?=
 =?us-ascii?Q?j6nHupIBP3jBSB5yrBM2lZ3F6zbrThFrnN/zoq4Nj0/r6jbXwEGObKm9XIuS?=
 =?us-ascii?Q?aKAIwFxk41O03ZC6e09/LiCcSk95GES9BzIn0LArCAuik1+PmfApprZ/6J5X?=
 =?us-ascii?Q?kzlkU66okLvhDbI11quf+MNdkUEsazkUHTrD15OvjQFnTqlrnVzDDKHIVFGs?=
 =?us-ascii?Q?yB38j9z7xPG6LS80zyoJSPxn+DPZmdJ4kqF/1IGrrmr2NxllhZ/vFKfK9aU/?=
 =?us-ascii?Q?IbGS885p+Vk+lmX7iNyGwzV8NlEP60Ip4MPfHJ1tu1tWA3d/vNIvX8HUWzBt?=
 =?us-ascii?Q?o905WHtCqatqHCLGJtwP50YPukr5MeiHv/04bJUeU8s1ERhVas/LXEdIW2om?=
 =?us-ascii?Q?OvFzCZ/T8k8t0MZ99fToKQxDRBDfUTvAJMpHurHWrHU4QFxAxyiJnN6tqF8Y?=
 =?us-ascii?Q?DC8wTLeDIS8Hq5ZAJ9KFa/NHCd4i40YqYZb3i99Mxb/Oqbe8dBnXlTpjP+D7?=
 =?us-ascii?Q?NTTAlq0cSZFJ6YvNDdjXAUKtU7esTKuCL7O3XDq4mRONFjzu+08w4d6NFTB4?=
 =?us-ascii?Q?77Y734/PCLgYsQp+4QxTFuZBoeoO5zLkPzubhba4MoCYIUrC044h7rvyPwFi?=
 =?us-ascii?Q?OPy3H5FemCSF68ceDkF74fC2/gFuQMDU+HcttU3Xjs21anYT62f0i3y3huHh?=
 =?us-ascii?Q?l6cPHv9BpstDJjGg270HPJN+Ck7C01lBIUrp7nq915XObN3P6UQj2zGDRGFX?=
 =?us-ascii?Q?BdMskQQQXNj+kdh/BfJo1aKoxSHK0OfPxXAZoCUeD9hyq5mmLUETYmsCcNOX?=
 =?us-ascii?Q?+fGST5K7o8bSW2Rgs+u5dY8fTxqoAhiUfg+vmdtNhjulxATl+zhf5ZMHT6gm?=
 =?us-ascii?Q?0PmFBegmDvesS0efjccXbFAnO7k5mIO/W7jbryG9C+gP3aiBl3JpRZ/AjIlA?=
 =?us-ascii?Q?qbVhhQV+1/0CPGdCWxUkrGjbyXX9wOig1da6n8j3W6aP5vPN6hgLhbUZVKHH?=
 =?us-ascii?Q?UPaCrCkK/MkBsxJmUFn2aZ21N1MeR43GJtxbUDLX5uvqXeuXYyfYCSwZO3kS?=
 =?us-ascii?Q?2Y/Pr2TkpQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QruqFzjCDNEgcgCaJ4dDwdTddHk3YfpZKXccNmx5i/qx7AWOc1lZWtJjE4yJT7NhAo0dC2GwTaeRQXqzh7rFMdpl5kCv/L8c0/3D6wA7ej1yrhS3LxDJ5Y7SjoEVAQrs+ZKlEKFLMtI0eRtgcdnufBnXmMWFE5rWaJ00pEg/OoBMNenyyS9KX63CQPbEflo9tWEisPyy6th5yQnvDHC5T2igRYzxtLydmDecrsxgTipvi1YhFf1gduqHCRg2FVUNtrOXwCJfdU2DRrEXC8NbYsVHyI6cpqmhYrrh6x1kISscdaC84LIWWGGYcuHal3BYbMgtFJenVjQFT1w1DwXscg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea79b8d7-1c02-488e-8fef-08de8f42e726
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 16:31:04.1476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/+NTnPmgsU0cJLLh34SK6BT34wjlxvUoUWLGl/FNgCW1PZ3/f5Rjb8E+Gb0PSJqt4GW32D8sy2H955vUa/YTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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

On Mon, Mar 30, 2026 3:18 AM Jani Nikula wrote:
> On Mon, 30 Mar 2026, Simon Richter <Simon.Richter@hogyros.de> wrote:
> > Hi,
> >
> >>> Six headers use __XE_<NAME>_H__ (double-underscore prefix and
> >>> suffix) as their include guards. Normalize them to the
> >>> single-underscore _XE_<NAME>_H_ convention used by the rest of the xe
> codebase.
> >
> > Single underscore followed by capital letter are reserved identifiers i=
n C.
>=20
> Well, ackshually...
>=20
> "All identifiers that begin with an underscore and either an uppercase le=
tter or
> another underscore are always reserved for any use."
>=20
> Even so:
>=20
> $ git grep "#define __" | wc -l
> 21278
>=20
> $ git grep "#define _[A-Z]" | wc -l
> 17886
>=20
> The only question here is whether to be consistent or not about the reser=
ved
> identifier usage. ;)
>=20

It seems the rule has been interpreted differently over time, and a quick c=
heck across drm headers shows many styles in use.
(_DRM_H_ / _DRM_MODE_H / DRM_FOURCC_H / __ETNAVIV_DRM_H__ )
This patch is mainly to keep consistency within the xe codebase. Happy to d=
rop it if there are concerns.

Shuicheng

>=20
> BR,
> Jani.
>=20
> --
> Jani Nikula, Intel
