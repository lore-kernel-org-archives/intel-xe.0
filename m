Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBE5D46C0F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5750210E0ED;
	Wed, 28 Jan 2026 23:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etnsWKlk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050C10E0ED
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769644792; x=1801180792;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZFvwL3V4cC5p0lEUgdoYukIB2Vpa+3Y+SmJmt7AIzLs=;
 b=etnsWKlkNceDV4DEH7mJD6s/yFCWZuCo8z+OgcQMz9hrqPqam3XsiI5q
 d/J/6XWrZD7DK9XlBzhP14U8aejTo/QF3YgTBgeZT0iefJPqPae7GrEAO
 ShZCGDoePU3d8HtmolWDh8ytW3zfparmNFuQl7BucCEVG6lrfe3diHrMt
 VIPnwtMZQhNpOytfpeLcflhSAJOhGvArPcHUFZjFG5nsjtEzX6FYM+OTy
 CMicj3ZRCe2Jhc1semaQVkOKSoXMVGOOjKYYmzyzphmJDNEz3oJiBlFbD
 fiEKsDlnPCh/Qbf0a+L1YR9wLcup78kvrfZi3GNOUSKoKk7pWODndKh9h Q==;
X-CSE-ConnectionGUID: NbEPKEAYSBCj4BBGao9i4Q==
X-CSE-MsgGUID: 4HZhQ7KRQD6411qGNXOIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96334931"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96334931"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:59:51 -0800
X-CSE-ConnectionGUID: u41AjF6FRdq0xkrWPbxScg==
X-CSE-MsgGUID: zrk2Ta2rTCmptUJjDdSAbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213273941"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:59:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:59:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 15:59:51 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJBdU8wS1FtdZ6ABNtXUnEuUu2n3dD7AZ/p5cWN+ptppDjIJaWK4kbKFd3/CS+0tW5i36+rQZrstJ+4cxh64BoWXrpnfaIpN4DNPzqjCwCLiXC2kfzN9QoWzXztIxxF1N0LdxCwQ8Dlj6i8wYlWwx1n/xzIeICUXi9MgC3pZf1Q0/CMs3PfxVo0Rl9nk/IOOnt25/Tu/NrJHP9lrHAlH8IdLW8U7mgwuht1G/D2kNLYJQzy77FjW2DWNAboJ0w27tXaIs1PUzCCzVu3oR2yXtKbSQKrNN7sUIJ2oeJA6fK14TmgMy3kilEkIH01wIIs2QNTJ0PzNWztkE4Jh9EVjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaFAbmR83DTF0x28Ourj1Ig1AWhrwbEDk7CljsFYq9E=;
 b=G/Zd58ADaDoHj92vQVTweEEitQU/Xzn7dFlyhMTbWUzqSFkkoH+IbQbq2mUfjIF7KWgMMjjfX4A6tiVU85nmkyAfj4zLJ2lv8wsGgFWQdSZ0EhKuY0W6KWG094xgPKb5/tLmvkI71vPQGrmwVT9+A5A3rFUrhH15BwfOuyDzCx6m3DCwA9/+u9yeucuI5VxEkHd3n9DCtfPaHiNBIdiyymMqLAyOZtFVp95riuIazG+GBzRI59iXvjfu091AcSIZxWHie+DWr5ZgF4lvmuzR0V4hPOcsL9YREmMfPqSkHXz6gcVsDJijsxbKy6pbcPiC0jGIG6fao2VTwulZjw/tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPF58BF5162C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 23:59:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 23:59:43 +0000
Date: Wed, 28 Jan 2026 15:59:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/12] drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
Message-ID: <20260128235940.GW458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-12-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-rtp-mcr-check-v1-12-d420b9c1a327@intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPF58BF5162C:EE_
X-MS-Office365-Filtering-Correlation-Id: 402578f7-57ab-4eef-71ba-08de5ec94e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nd9/dGPgmODWhGLRza8Gacl/7jxtlRSfoKSexqDEabkikoulx3C43k70j8?=
 =?iso-8859-1?Q?dPj8UGttZK9FdXeuY9vDjl75dVWt5lt6dTrNS6Yf8nvmJPBJTW1gEXZWN/?=
 =?iso-8859-1?Q?4EnRFlBrZp7gVSK+tzI2cjvVzFkJhqcWfb4KJ7cVs5ehdzFtjZeYfkD5pt?=
 =?iso-8859-1?Q?8Tw8rhIPDsPVfjq3ueJkbBbLbdnBHUgGkXPOEgJDU3aoLMjsGgZwoiowa1?=
 =?iso-8859-1?Q?pYHdjXihj5PXHadVpesjqvef557fMeKIBIK5aoBlqePiXF7ssGVRnbYHJG?=
 =?iso-8859-1?Q?zBNuyoK5J53IJcnDpwmJyY/jH8DylWMnxjeCy26p9e5rnVkEd4nGT1gsib?=
 =?iso-8859-1?Q?xyjLw5bHeoN4ROJdllrA+Ts5qPgOrUd1ZfPImPosrEcI+dXOmvqL5r4Pu7?=
 =?iso-8859-1?Q?xgWHnTQ+nXweEMJRlPoXeu9QlSr7/2CtiuqXSWtnIwjlhlFIBwkX0vu18F?=
 =?iso-8859-1?Q?ivU8oKVrVSEmRRj29v0di/sR5QyP1UY4njwW25oJ9To8kpIn0PjIB0aLdI?=
 =?iso-8859-1?Q?hWzMU83asE8m2ypiAdQi+RPRDjx5XOcbKIqk1RFQgnbnz6+0gUXmpoOK2y?=
 =?iso-8859-1?Q?c7bluO5s6CVqsjcXMJt+Q+Hv8+iLV8i7Vz13clIqqWUDkY2Fps8WvkzgkT?=
 =?iso-8859-1?Q?KI7yvf8LhOjKbIiPPK9AXC3rLUoClJQCIeujKu9oAu3DaKXtLRDu80p5Lh?=
 =?iso-8859-1?Q?kdzxe2Z44zsbkhRi+aGOQ7yj+a5wh1AYp4qBVw+oFNw+7OtnYLeybvUD/8?=
 =?iso-8859-1?Q?pdRcEPruIWr5vTnJLTfM5KCD+YWFlwfUkV+ghoTTGLR1XS0UzTeaCvaTcB?=
 =?iso-8859-1?Q?i5TRdRIn41Os3IBWfqovk24Y2ouz9+KUi8BnS2YgV39BNMrpmuH2i5Surd?=
 =?iso-8859-1?Q?fa71Kv65ATLr1cwpsNLJCQus6p5E1FP3FTXIEZSlu7dXAHYwgVsJJwQlBu?=
 =?iso-8859-1?Q?CJq3uT41fQzCO3fqYFUtP9vM8VKvpfgn/wiJJ8YXOEuUfdYKjD2YP7d19T?=
 =?iso-8859-1?Q?qcgUFBh40Rmh1M+gAjByjwHL1m8h706ABTh+Eaax9IKTb7S1hnZ2PxqtkE?=
 =?iso-8859-1?Q?AqQ0BgMNUgiRjU+mDoTA1A5VSN5KYUwXkp3dSbpWgI6+pTs4Ofyn0fszMG?=
 =?iso-8859-1?Q?PUC+68NiQ8dMN80VXaV3YKVO3mv0gGcjwxn+UDMHSUAt0di4FN4eyVkp41?=
 =?iso-8859-1?Q?iu0Md93Oc78ibweyWCitGTVhqak6v/i6Alm4xmF6WxvMhrPib9c2qj73sl?=
 =?iso-8859-1?Q?ef3WbapXfjIvUH2078OHFYeCqCCSQZKhpDAvwbIfUdpdg43xnCqZGS1DgD?=
 =?iso-8859-1?Q?D6UTZECPaCbel8q5UQADG4VJd/xUW4kLghtC81k9tto1d/0D3PT/rp0MZB?=
 =?iso-8859-1?Q?dzSkfhQXWMcbvJqbL4WjPhXYUEkCYE8GTFejrOeDr5K418If8lPlsDN8/P?=
 =?iso-8859-1?Q?Q8xmBN06GaHecRD7Ula+wm4FwGY5d8pJ5XvK6o8WvHUBwn5diVvBIgUDKg?=
 =?iso-8859-1?Q?qTy/wislMLusNEHMJvoLhPPqqLOVZMnxyk/drJjIjWG/INq1yUsvV0AP4X?=
 =?iso-8859-1?Q?/6Hkj9dD+6yIEcrxryf881SAzVc0gu27OUIecwZuYkEKTYC0U/G/YeKDmf?=
 =?iso-8859-1?Q?uLEwmdk9c77ho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qYUSRCy8Mgt8TSACdqoeFVLvqCQUCjve0qyETLYMXiqn8e3pBVCascUAQJ?=
 =?iso-8859-1?Q?T2d4VglA4EZv1rs1S2H3/cZzURrLMxqwlTEV+2B173ey6B/NqitYMmpPDg?=
 =?iso-8859-1?Q?QkFuxL/+qzBaFo8N7Plite8K1SvKKVVSU0rsACake/+SckUlf6mE7eXvkf?=
 =?iso-8859-1?Q?U/w5yvQK9ioZcjHh2UJ3oXDsvY5i5zSEGeyxuiBAcFees23gEt0211AhiE?=
 =?iso-8859-1?Q?ibTtXVf3Bv9kY2dhwJyC0JPM43znFhUmsONP8KJSPchhvzwf0kEOYMBdfA?=
 =?iso-8859-1?Q?YB8G8ogYB6jF8v4UZ7pX7Tg+qhUwdB14bR9CTrmQLOBUWSJA1AzhXuwILK?=
 =?iso-8859-1?Q?cjNdprdt7pkCuopfsVfhbdFfZvvXvgpsLjaiIHXoRYZMDmNn+hDL216nfV?=
 =?iso-8859-1?Q?vUAbX/G7TqXdfdRCG9vv4dZqHqZTysaRzmyGS3QoxKGn6blx7hb74PnR1W?=
 =?iso-8859-1?Q?HvDcPWdRL8HxTlskWF20y4bwVUOGXNfzHBshAW91TrUFBcrDbreOMnG3TZ?=
 =?iso-8859-1?Q?43b+cV3RjYFFpsNlSfEK/JNzoVVQhMoJISW2ep10od0/zI7kXeOfOBMwGx?=
 =?iso-8859-1?Q?9EzNfI1bwxeRZqTAc4G3JIgbqvnpHXKgHro5hf6yaUOmOHBXZzvg3Q3pip?=
 =?iso-8859-1?Q?EcflT4saaHD/C8aong60Awz+Hn8oy1HCZGXiQUASMOJQPW+yFdKQrOttPn?=
 =?iso-8859-1?Q?iarXqz2crRkIIUHEabcQ4unYcM6gvvg1x+elaDVQthDhn9wCYNzXgeyB4p?=
 =?iso-8859-1?Q?Zt5vXgTyqkgM1h0Gf+3zXLxrFlONIG87qjW1E4uISsb8x2CxfAD47juDWq?=
 =?iso-8859-1?Q?xcsvhZvmLAccVkKoescc1s0gjOOusf3OpIMARsDkJOmuAqhy2Bzd9ZNKn2?=
 =?iso-8859-1?Q?WEy0fzSBJp+UWOt9Jmv+Mw6wGaAzq63ywSPASvukOydVd/OGruTtrtCb/j?=
 =?iso-8859-1?Q?GzyENNmW8CMgbjyAEJn2x06qntaFRT8r0SCOtPEt8VyyWUnY5xkJ6N9wlD?=
 =?iso-8859-1?Q?B5JF0Pg3uUnyb1LxnFSsxocJQhk76RDJXP4RqL/BGxE669HPCuyZptMq+u?=
 =?iso-8859-1?Q?25UlBDi+HtwGsTYDLBtVF/JOeXZ+NLCd25rYOkShTVw0RxJUC1zlzZ6A96?=
 =?iso-8859-1?Q?XmxpdTvfHqwqGBUEFka/rA6vmcQIY457n1edvOlrymSzs/faY1RaKKdlXz?=
 =?iso-8859-1?Q?3jCazu1V8OGU9AkYpUR5blrU6BSr92YsVCvYv6GaeoHmOVJ6b642pDHq2i?=
 =?iso-8859-1?Q?TfgCL9HG5ds1rAkIN8L0lIhkQWuke9cBeiW6Fpn2mLJkl3CzhURBM8gtCx?=
 =?iso-8859-1?Q?p4rtY4Jt4dTPEiyrI/bSqCDLqZFdxo1PNcNHtZorTjBRoE7KxkCYdKHr9U?=
 =?iso-8859-1?Q?GvRFBq4JLPH/LrFG4SHNc/gATtG5iVqGVuvBD+95Jnns59kKBWB0l/Fs0L?=
 =?iso-8859-1?Q?Dkxh8OH1EtmnG7umBQgmqR5MbJQmwWJNMRI/HOs3CxYmEjYp20LAD0OVl8?=
 =?iso-8859-1?Q?+FVEfajNtela+MC0+Nmr5QVuH3uAxC2ujqHyHdLQLQL7txK2kPMno/C8sv?=
 =?iso-8859-1?Q?uZpO/beUv6r0vdse++RGCkDRvlExSqVDwybqYuQmsxBEq6FJePOn9rUtQD?=
 =?iso-8859-1?Q?/Sd5j6jpZaQNqlVzr3K2CP7F9hJf3YcOVwXZD+XNCIi22g+FiIupM+ZoK2?=
 =?iso-8859-1?Q?DBt5TjPkFKX2CuMbLNnUPqvlTXGmAWICw0zBnPVm6QqkH1ubS6z3jNYAuQ?=
 =?iso-8859-1?Q?zP9HBecq9gxRD+OtOu+EBXQA+PUsx2cPzpeMJ7ikRHLQh5vVDxgaWx+0Rw?=
 =?iso-8859-1?Q?EJH5JSJmnTJQc/9PhXdPQpRQUF/MaYY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 402578f7-57ab-4eef-71ba-08de5ec94e47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 23:59:42.9629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAmCQJRGJfDJRlawqVm6SWPYvXiO11AT2VjpsI8gBRQJzkGFekfQShlUrdBybM6WkFQpstYNtOPBj7H/V0yPe0QrQ1nr1G8+RumA0Bpttg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF58BF5162C
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

On Fri, Jan 16, 2026 at 07:12:20PM -0300, Gustavo Sousa wrote:
> The type struct xe_reg_mcr exists to ensure that the correct API is used
> when handling MCR registers.  However, for in the register save/restore
> functionality, the RTP processing always cast the register to a struct
> xe_reg and then apply_one_mmio() selects the MMIO API based on the "mcr"
> field of the register instance.
> 
> This allows the developer to commit mistakes like passing a MCR register
> for an RTP action for a platform where the respective register is not
> MCR; and vice-versa.
> 
> To capture such scenarios, do a sanity check in xe_reg_sr_add() and
> raise warnings if inconsistencies are detected.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 ++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/tests/xe_wa_test.c  | 11 +++++-
>  drivers/gpu/drm/xe/xe_gt_mcr.c         | 21 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
>  drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
>  5 files changed, 132 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index d2255a59e58f..80bd83f56d04 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -9,24 +9,30 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_kunit_helpers.h>
>  
> +#include <kunit/static_stub.h>
>  #include <kunit/test.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  
> -#define REGULAR_REG1	XE_REG(1)
> -#define REGULAR_REG2	XE_REG(2)
> -#define REGULAR_REG3	XE_REG(3)
> -#define MCR_REG1	XE_REG_MCR(1)
> -#define MCR_REG2	XE_REG_MCR(2)
> -#define MCR_REG3	XE_REG_MCR(3)
> -#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
> +#define REGULAR_REG1		XE_REG(1)
> +#define REGULAR_REG2		XE_REG(2)
> +#define REGULAR_REG3		XE_REG(3)
> +#define REGULAR_REG4		XE_REG(4)
> +#define BAD_REGULAR_REG5	XE_REG(5)
> +#define MCR_REG1		XE_REG_MCR(1)
> +#define MCR_REG2		XE_REG_MCR(2)
> +#define MCR_REG3		XE_REG_MCR(3)
> +#define BAD_MCR_REG4		XE_REG_MCR(4)
> +#define MCR_REG5		XE_REG_MCR(5)
> +#define MASKED_REG1		XE_REG(1, XE_REG_OPTION_MASKED)
>  
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
> @@ -48,6 +54,23 @@ struct rtp_test_case {
>  	const struct xe_rtp_entry *entries;
>  };
>  
> +static bool fake_xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	/*
> +	 * All supported platforms in this imaginary setup will always have REG4
> +	 * as a non-MCR register and REG5 as MCR, meaning that BAD_MCR_REG4 and
> +	 * BAD_REGULAR_REG5 represent programming errors to be captured by our
> +	 * tests.
> +	 */
> +	if (reg.raw == BAD_REGULAR_REG5.raw)
> +		return true;
> +
> +	if (reg.raw == BAD_MCR_REG4.raw)
> +		return false;
> +
> +	return reg.mcr;
> +}
> +
>  static bool match_yes(const struct xe_device *xe, const struct xe_gt *gt,
>  		      const struct xe_hw_engine *hwe)
>  {
> @@ -304,6 +327,38 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  			{}
>  		},
>  	},
> +	{
> +		.name = "bad-mcr-reg-forced-to-regular",
> +		.expected_reg = REGULAR_REG4,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_active = BIT(0),
> +		.expected_count_sr_entries = 1,
> +		.expected_sr_errors = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("bad-mcr-regular-reg"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(SET(BAD_MCR_REG4, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "bad-regular-reg-forced-to-mcr",
> +		.expected_reg = MCR_REG5,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_active = BIT(0),
> +		.expected_count_sr_entries = 1,
> +		.expected_sr_errors = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("bad-regular-reg"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(SET(BAD_REGULAR_REG5, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
>  };
>  
>  static void xe_rtp_process_to_sr_tests(struct kunit *test)
> @@ -522,6 +577,8 @@ static int xe_rtp_test_init(struct kunit *test)
>  	xe->drm.dev = dev;
>  	test->priv = xe;
>  
> +	kunit_activate_static_stub(test, xe_gt_mcr_check_reg, fake_xe_gt_mcr_check_reg);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 3311f05a6fc2..326278488cdb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -13,6 +13,7 @@
>  #include "tests/xe_mmio_intercept.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_hw_engine.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
> @@ -38,8 +39,10 @@ static int xe_wa_test_init(struct kunit *test)
>  {
>  	const struct xe_pci_fake_data *param = test->param_value;
>  	struct xe_pci_fake_data data = *param;
> -	struct xe_device *xe;
>  	struct device *dev;
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +	int id;
>  	int ret;
>  
>  	dev = drm_kunit_helper_alloc_device(test);
> @@ -52,6 +55,12 @@ static int xe_wa_test_init(struct kunit *test)
>  	ret = xe_pci_fake_device_init(xe);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	/* Needed for sanitize_mcr(). */
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_mcr_init_early(gt);
> +		xe_gt_mmio_init(gt);
> +	}
> +
>  	kunit_activate_static_stub(test,
>  				   xe_mmio_intercept_read32,
>  				   xe_wa_mmio_intercept_read32);
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index e7eb3c6da234..c6d9766b6cc6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> +#include <kunit/static_stub.h>
> +
>  #include "xe_gt_mcr.h"
>  
>  #include "regs/xe_gt_regs.h"
> @@ -623,6 +625,25 @@ static bool reg_in_steering_type_ranges(struct xe_gt *gt,
>  	return false;
>  }
>  
> +/*
> + * xe_gt_mcr_check_reg - check if a register is recognized by this GT as MCR
> + * @gt: GT structure
> + * @reg: The register to check
> + *
> + * Returns true if the register offset falls within one of the MMIO ranges
> + * classified as MCR for the GT.
> + */
> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(xe_gt_mcr_check_reg, gt, reg);
> +
> +	for (int type = 0; type <= IMPLICIT_STEERING; type++)
> +		if (reg_in_steering_type_ranges(gt, reg, type))
> +			return true;
> +
> +	return false;
> +}
> +
>  /*
>   * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
>   *    will steer a register to a non-terminated instance
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 283a1c9770e2..d6b50b52b1d5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -26,6 +26,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg);
>  bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  					  struct xe_reg_mcr reg_mcr,
>  					  u8 *group, u8 *instance);
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index d3e13ea33123..89d35301defa 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -68,14 +68,49 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  #endif
>  }
>  
> +static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
> +				  const struct xe_reg_sr_entry *e,
> +				  struct xe_gt *gt)
> +{
> +	struct xe_reg reg = e->reg;
> +	bool is_mcr;
> +
> +	/*
> +	 * We need the gt structure to check MCR ranges.
> +	 */
> +	if (!gt)
> +		return reg;
> +
> +	is_mcr = xe_gt_mcr_check_reg(gt, reg);
> +
> +	if (is_mcr && !reg.mcr) {
> +		reg.mcr = 1;
> +		xe_gt_warn(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> +			   reg.addr);
> +		reg_sr_inc_error(sr);
> +	}
> +
> +	if (!is_mcr && reg.mcr) {
> +		reg.mcr = 0;
> +		xe_gt_warn(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> +			   reg.addr);
> +		reg_sr_inc_error(sr);
> +	}

This sanity check (and fixup) is going to happen not only on the
non-live kunit test, but also on true device probes on hardware, right?
In this case, we might want to consider downgrading these messages to
notice level rather than warn.  The kunit results should let us know if
we have a problem here (even before we have real hardware CI setup), but
if a mistake somehow sneaks by, having warn (or error) level messages
printed in dmesg will cause CI to consider the entire device probe a
failure and will prevent any further testing from running on the
platform until it's fixed.  That seems unnecessarily harsh since a
mistake here shouldn't really impact most of the other CI results we
could be receiving.


Actually, related to the earlier patches in this series, I wonder if we
truly need to mock up register accesses for non-live kunits.  It seems
like we might still wind up with some FUNC() rules that incorrectly
disqualify RTP entries that we want to check.  I'm thinking of oddball
rules like xe_rtp_match_gt_has_discontiguous_dss_groups that either come
from previous parts of driver initialization, and/or have somewhat
non-obvious relationships to register values. It seems like for the
purposes of checking MCR vs non-MCR status, the _only_ thing that
matters is IP version:  IP version determines which MCR tables are used
on the platform and IP version is the only RTP rule that actually
matters to confirming that we're using proper register definitions.
E.g., for an RTP entry with rules:

   XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
                GRAPHICS_STEP(B0, D0),
                FUNC(check_foo()),
                FUNC(check_bar()))
   XE_RTP_ACTIONS(SET(CHKNREG, SOMEBIT)),

we don't care what check_foo() and check_bar() are, or even what the
stepping is.  Only the IP version rule is necessary to determine whether
we should check CHKNREG's status against a specific IP version's MCR
table and for the purposes of the kunit we can treat all other rules as
'true' without trying to process them.

So maybe a simpler approach would be to have an alternative version of
xe_rtp_process_to_sr() intended for use in non-live kunit tests that
just ignores everything except the IP version rules and treats
everything else as an automatic 'true.'


Matt

> +
> +	return reg;
> +}
> +
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		  const struct xe_reg_sr_entry *e,
>  		  struct xe_gt *gt)
>  {
>  	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> +	struct xe_reg reg;
>  	int ret;
>  
> +	reg = sanitize_mcr(sr, e, gt);
> +
>  	if (pentry) {
>  		if (!compatible_entries(pentry, e)) {
>  			ret = -EINVAL;
> @@ -96,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	}
>  
>  	*pentry = *e;
> +	pentry->reg = reg;
>  	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
>  	if (ret)
>  		goto fail;
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
