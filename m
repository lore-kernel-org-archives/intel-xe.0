Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE7EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453D610E8D6;
	Tue, 10 Sep 2024 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGbuBHdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B760B10E8D6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991946; x=1757527946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X2nQVi8uKhkgRToiGGRpqJ9idLMKr8zX6u6S4CoUAEI=;
 b=CGbuBHdI6gklRSVaxdiyktNKbsZM+Ewlx0UF9UNE4RyxJmaUOYqPRUvH
 jS59ff4WJ+/cnDZv0CrbSCk1s3zEBlg2O5hUZpXaXgZmaVKnjLZlww+tD
 /3npkVP949AZJrJugN4M4CGsotyFzvN3A1mraQFhOcS8gZ08Lrf/ujbwN
 C15sWLIJIWADfTttwbtt7/aAujSHkvK7ORTNUAp3PFphUEn9aclTHEEFI
 vdUKNyFq19/02YjWziuxMan/gbhtFxyo/DqaRFTXi7h/0EG0+wEAwIIAj
 NbFxeFtvOwQRlcpsXhyypKo1XpommgvHYRf6T2UIr0qgBhXlpQuKjZncp w==;
X-CSE-ConnectionGUID: OdZ3hg+SQYmCqLy8JdjBAw==
X-CSE-MsgGUID: SPmLgMdlRHiWaxg8BvahDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28539589"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28539589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:12:26 -0700
X-CSE-ConnectionGUID: a5zI4+CMQc6vGgPM00RvLA==
X-CSE-MsgGUID: HLq4pNGLSgmd8fZkg3XRPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97943738"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:12:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:12:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:12:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:12:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/qrz4qyuPNj3+6/0W2oGR9RjyO3Pd/lki8aaZPxqpqTE+LO/0hCRDV5QtLh+iNxWrCdoWTF2aBu/YvZ5BJ0cOyUaAHcZ9tDysfRmkYC6u1/Av8lMP2seXSJTDvEu4pV7O8qIb0EhO7DR3wvEEdkke9M5mKhqpUtXZFMMvK9kLTY1IlSl4HxrMi7K1ZFU8euPchxXl1Gx3rcnSgK+gjakVey9QA5IeEtl+NnqbXKHdCqVCbHbX2VzM01KT/qhDKBEqAiwX/lDMXa6U+8oRTNwItbk2Fjg4cCb64bJsc18ho9sIFrUrgnXucIgIr32QoJpAo/EsQJHDph0FAb2R0rRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW/N+ZX7puR6jMVwAPje7HnLI6iuT52I246rSD2n0A4=;
 b=s6Uo7FQru4OHO+pcyk9D2v2AJXHNS39BIXXU+SGt1OBRrGVB/tsG9jnFsZGZrxpqqKo1PFSG+Tmf6N8KtGosgqnJ3n47oyZ1eO+lJX9/k3rs49ecN3IpTGj5cNgyOQr+towWr+/64G88MT7/pghM2mDgmE8+Q396EqMD5QocMQ4VvnLNoa9bLmDvgvnZfkfhlTaLM2pgSsIK4Bs7D8SbRYVHfLUvgUW0WYQ7L90gfSn8CG+8676K6OX9UWYh5+jXLiRPKIb1Oq+du1uYYksxMId8uQQCRHKSs+BvbZG+PHqUnks0oLsFzkJwFU7iPuqe120i1s1Sapb6Zs8VUxIkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:12:23 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:12:23 +0000
Date: Tue, 10 Sep 2024 14:12:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 29/43] drm/xe/pat: Convert register access to use
 xe_mmio
Message-ID: <ZuCMA7Ycq0PlDAho@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-74-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-74-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:303:16d::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b68cf9-138d-4264-1016-08dcd1c41e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ncaLi4aMQCT/bzr0BKPAp6+UblaQa45d1npcZDekyNUeg3g9QkLW9JcnGuPO?=
 =?us-ascii?Q?mJF2dGloSQr2L5RLX65eltkXXJbaxjjfTAe/ReYAjQvhjbR18b//c00lCtON?=
 =?us-ascii?Q?1hxcUU/u0ZBTIkcJA3gQT/uIxQxT6ZE7Onb4Q1ev5YBClNbTKwVXsHzxnR4J?=
 =?us-ascii?Q?YOXfwSmX6LJo7O5K8wKFwIw2hC1cG5p6YMD5UQ0IbA6cHZSbWxg5FFBN/MZU?=
 =?us-ascii?Q?uwye/jDiVq8BhwN7HlAfFSRGkRlG7bNsdy2KAWXbDNPhTJX7B1Smd+5YYisv?=
 =?us-ascii?Q?kcGF8fDyPsqogis1owCfzYYliEPUuur43i9/EGesS2lkaPnLiKdCeArPZA/y?=
 =?us-ascii?Q?TSdi8XDecv4lk9+oiekcMHcd989lRldWHu2zYD0XEA2S/J2uwwtzT2l9u/QE?=
 =?us-ascii?Q?p+pmxGnxF3h2Oo7P9bPzVvmAins8MxtXM2MyXCMNa3QvFAa5ZriCCn9V3x49?=
 =?us-ascii?Q?/EiHc/PauDgLBYN/PX5oIRCmY21KhM0HwVf+1EJLN4ILcB2ksevVWVKw2zxn?=
 =?us-ascii?Q?kfdo6ACoInbp9kVvs9daD29du+ApmIv/Z+YI5n4GiTe4hhIDzwIZR/wLpdU/?=
 =?us-ascii?Q?W2di9m8DOvzILKKdVC0+RPFFEMhvv/I7CUIpJauNradAo2bo6OoXrKsJpjFx?=
 =?us-ascii?Q?SLJa7DX9Qhdm98NG06t90D1U91JS1fA3DFUwDlwwpWUmHhFLE05QgnZWjls9?=
 =?us-ascii?Q?1cSIhOy/NNM+w/3TmC5NjtFiZCOmrGfIIdGFTqoFDSFE6b89QqoP1mRXSOxM?=
 =?us-ascii?Q?RYUfo+F2TQcaBryaKxXBFFevblKDgOSAFzNgDWq1a5Uzc11M5aC8LwQrl1eM?=
 =?us-ascii?Q?neSbWFyGekFtAMxOycgr1TKE89CGqjrNx3FUpqG9OrUpGVsvMIbd50RfaECt?=
 =?us-ascii?Q?7T9wRaSp0cqgmDRVD+IkeD9ZivjpFabOOqeb2cIsw+g7Eyf8NGbc0GiJlc8N?=
 =?us-ascii?Q?JOBdYcrn4rjflY7N9TmmdyHJuTeIiFlKeqRQDQzwIczE6YsfLiUb3+1aaSaW?=
 =?us-ascii?Q?A+FFD53S79UTAzJl2P0aeCGymThmWGzt+JcK6+Wz8nUQXh/CPMlUK4lBb/4q?=
 =?us-ascii?Q?amu9x766nYjkvjOaGOC1K6dQra9tO3+lZAS00GRwf4rmcZZ3P9pI14pndpWy?=
 =?us-ascii?Q?RJGwhIDzs0sNqygRw6pQ9Pv6/znZs3Hm2bte+UrTY8neph4lP1T2Z9lONmvE?=
 =?us-ascii?Q?55ZODT89cOVxLaFCUlNJSKVdMmW/Agb93dSkP2SdYHHmKYSEzZWWpTHhBD1H?=
 =?us-ascii?Q?lZdAIKsKtHPU9rXIIx/Yhavd5t/g/uEmHSo03Y4Hge9Ez0muMlbh9D4AgCFL?=
 =?us-ascii?Q?cNZFZcxx6ORkKSA4a26r1aKbstfqN8qx3Gx8oFESOYTafw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5F5GfHzPkgFsBBNDP54arEHn4f2UD8Mri4XNgULsEyO1HmRREcDfSkh1ynqX?=
 =?us-ascii?Q?Ms/k60w6z2lU77JER9bCyHVHpYUOBSHPaCasCaQdH3Zkw40Oo84mRtSTwS0/?=
 =?us-ascii?Q?Gf0ykBRt7CYcO/qLvHgj5G6U62Xl/4AoMVjJoI4/bEvONhbJWOR47DQfW2YO?=
 =?us-ascii?Q?610+hq0ngWp++NXHYbeaqsbSoGYRH3hh7D3kC6JK7cdJXjckj8B3T3dRUDT5?=
 =?us-ascii?Q?3gELZr9deHQahVsehiTNAAUd6w2bmaYL5T4fvF+MlfNtsgAux/0QdZFlTPJP?=
 =?us-ascii?Q?oSJEy6wnM6eCtUIVFzXmI380sR4RLq31rZ+emh45qk8fqTGuYd0M+3VNYY6n?=
 =?us-ascii?Q?Dss7j4E0jveJJL8iqgBnK9qDRJSWNbexG5uj8W0+5Hiwyp6FY7rOHaMaTpXH?=
 =?us-ascii?Q?qOKS11XsULgUAIY/xXaFPAgcao6JuEwjxdWPCzM/Q1VQBRvzYUGHXoCeE9ue?=
 =?us-ascii?Q?q/bf/quUzHuWik/94L913Dmf/g60D8+X/vWcg2t9GO3UPCnkYDrpGsMaXRaG?=
 =?us-ascii?Q?+fDSaKcUbM1brWIV/lGYTiJ2RNIwsG8DJiy++SB1xvpsgJg1EB3Ye7ogfSSw?=
 =?us-ascii?Q?x6bdg9a8j8JXPW1irTXYa97iaHNWoBt2rz2eo8kOHdig0RcBH5EHAHtdX7Y9?=
 =?us-ascii?Q?hgk5XJsBdrkhZqkhaXCW2cy2NMGpNNB5+DYSMJB3vTm/JWYUcqXLLqQEBVED?=
 =?us-ascii?Q?BeOJaawAxmdcS6JYE8rA9hi+zZXIGPj/xDmab/XmTY14eKds3cQqhXNDr/EJ?=
 =?us-ascii?Q?Y6R1ZF1U2u4SpeYniuob58/fW4428iC+NZVFNI0ERviQZm3c2IQy0PjS9Sxe?=
 =?us-ascii?Q?HiXau3IV9h6U7fgvBc+Y3GWgxZem2S2yQUzzqfPLIcQD4N0hd4AT3cYxbB1I?=
 =?us-ascii?Q?POwQb17mIAWFsOsa2IpeUcSmR+K1GpYxCWb6F3jG5Z5Z4CZso+zyuOSZQHEJ?=
 =?us-ascii?Q?4wzFRBh+5D87yMkbhQX2xyo+KQtspEzF0xkjb9hgU89TLRDPzkWAUQnlo5wI?=
 =?us-ascii?Q?qA+VeIcB7pXhGUpFylaUVQcjvHPdRV5SDrzqmpu/QchN8UCiLFEdXZzJg6fN?=
 =?us-ascii?Q?TiXc1kD2c++luD5WpQJ1HBEKHIl8niPglw/fOpk8+l2uZiv8322vVONZRF7l?=
 =?us-ascii?Q?XXUWxK6CdcVO+wbDuHk7RusFohF+NYw5iS81p9ddl1ZnQ9VzaCRb7gg2E8vD?=
 =?us-ascii?Q?fBmFOWT987mLchtUcSTbYIjw7SUlCrdiEnJwmsJbD62CRKQbe+RtkYvrq10a?=
 =?us-ascii?Q?dNvSBvriXvV7jZjK5brhz4xLhpEeO4HBDKAcgxuTPov14cT9a1tcTEqLQSkb?=
 =?us-ascii?Q?EEB6pb/neFlIAct+IPzkWhj3Xz3gowaYEbUG2yk8xnz/1JcsylN9zV1wcL9d?=
 =?us-ascii?Q?2dEDKlxbjyvU6YKCrjmGqyzE3Dp8wy8CdI0VTOUP4fQbba2XhAGPf1ulmcAV?=
 =?us-ascii?Q?Dbzt1P3OVMbT5jc3iXy4ZeMDEhX+iTrR+p1Xkij24Z5ujWXNK+0ISmzAmW1S?=
 =?us-ascii?Q?7JJ/czm5cYhsNse3CrL5sXAUXsQtM/FbC68Cw89R5vaEkbMuhzzFfUE74ZNZ?=
 =?us-ascii?Q?HlMVr2jkzERqkytMyMhoM233jX7Rs7vz6mJbwN1FxbMCtWJ4qoNsTwHTqfgy?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b68cf9-138d-4264-1016-08dcd1c41e06
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:12:22.9616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqmJugmO3QN4/8BckwD6/JVoGmCYNL5iZb8rEO1UkqE43VvYMn7YlVro28RMnl26t+fk9XFZUGhIqvSUcDg+VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:18PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 5bf48e99c939..6bd6adfdfc74 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -165,7 +165,7 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
>  
> -		xe_mmio_write32(gt, reg, table[i].value);
> +		xe_mmio_write32(&gt->mmio, reg, table[i].value);
>  	}
>  }
>  
> @@ -191,7 +191,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "PAT table:\n");
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
> -		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +		u32 pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>  		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
>  
>  		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> @@ -283,7 +283,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  		u32 pat;
>  
>  		if (xe_gt_is_media_type(gt))
> -			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> @@ -321,10 +321,10 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>  			       int n_entries)
>  {
>  	program_pat(gt, table, n_entries);
> -	xe_mmio_write32(gt, XE_REG(_PAT_ATS), xe2_pat_ats.value);
> +	xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe2_pat_ats.value);
>  
>  	if (IS_DGFX(gt_to_xe(gt)))
> -		xe_mmio_write32(gt, XE_REG(_PAT_PTA), xe2_pat_pta.value);
> +		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe2_pat_pta.value);
>  }
>  
>  static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -341,7 +341,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		if (xe_gt_is_media_type(gt))
> -			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> @@ -360,7 +360,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  	 * PPGTT entries.
>  	 */
>  	if (xe_gt_is_media_type(gt))
> -		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
> +		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_PTA));
>  	else
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>  
> -- 
> 2.45.2
> 
