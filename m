Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2F5CA6017
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 22:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B699510EA2E;
	Thu,  8 Oct 2026 22:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XydT3t39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27C710EA2E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 22:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791498328; x=1823034328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g9xo+MAUNZeQlHz1GcOgefMckM67xJYK5Uhyv0xVvDs=;
 b=XydT3t39ygQLeKEXg9Io8N2KCfmvDMFejZqf9cwhKVHbj75XNwyOi3sk
 pHOoX6PnDiA2LuTaCfN3XgB2J3GrG9qw3+kjwPpl6sX/uJoFD6ZSiYg/E
 uLdRMgtTH/MA+wZxC8P+7Oo4mqUMkTHrozsOdzuY0ZbzGhpyduiqn5XhB
 smkalYirJoP0B3eH6Xy/AJ3GOR2sM2v6iBDNmNrR0Qvb1ggcj0IrzDzYI
 LEbCGtjA4qCyeJ3pGALUryVu1l5OfJ7zksxXHIaQ7JA51XQ6EGk/74QVF
 OwIVWIaytrOkpYip+xEvXKrUwT4qFseRRcu16nVWGuYBOk/mZ8lq6YFiF Q==;
X-CSE-ConnectionGUID: hfdq2gnRSGq3ukvwdydn8Q==
X-CSE-MsgGUID: 4kz9a9k/RoqPu8TS/G9vMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="178187"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="178187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:25:27 -0700
X-CSE-ConnectionGUID: y4Qfek4cRle67mcwdR+/IQ==
X-CSE-MsgGUID: 62cE37Z5Th6kuMl3aFTX8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="476325"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:25:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:25:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 15:25:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTzAoJxUZGC/zvXdsCAOxCekwIIbbFTAyuj9duU8qmV0da4sRxLliBaM6QMkEPo4nBkqID9ewlsW0K7QMn4WG0d1Ro7N4lEk/H7AOSjnaBtohSaD7Am6DJA6c6A8YdUaOPV83zwhnFnmiRUbV5ed3ooHKc4szUMcLXpvySPOKZ4aL6Wt+IaXZPt0Vc86GcPZWeJ5KEqgMlsKmRal20i7INeYOhE6qyGEFh6XFav56MrwQy4QOgdl2yNpfyBVMlreeR2LzMHDnMBsIam6wFdW0BzH/FG/9MXJ9yWnzyW7mMhKY7woarPw+Itl//jd4M/XHucAfUOQsTQXYqgiqUntIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KD0lGDpvXF3D91UV0M9kD8+b0Gu+0FKLo32t/sZmHM=;
 b=sduQTcTYHUton48LvxOy9vekTMVQ98o6NqN9CfqN7PmosYN2Lx3muRZYa0vujf//3hrpcMjpg69szaPjcj4GLyBlwCO/Ac7gdTVFsjxzjmmWbvDY18jVlqx7r226TKftbnBMxKGtWefILojhAhWcS7UySSLnWedo41V056FNfB1PyDOuQz2z82/vLDTAZhg1W/oo1A/DytpK7+56GQlxNVUXV+4T63Vvmcvdu7oQpQDSr1smeGjAauC8XaJSBvfghrDs2r7NE/RyifyEyD5PiP4yJ+gj3ewEJ9nTcHcuN2mSV69G7Uk9ZENEuRiYOi4oHAFxAO7M0CXYos7jiJ3ZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by FT1PR11MB420853.namprd11.prod.outlook.com (2603:10b6:170:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:25:22 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 22:25:22 +0000
Date: Thu, 8 Oct 2026 18:25:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 14/15] drm/xe/hwmon: Add CRI PCIe temperature sensor
 offset
Message-ID: <asgYRNcK3vyu9xiw@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-15-karthik.poosa@intel.com>
 <asaO9L1vpnNXmAIV@intel.com>
 <4ae3b310-bb73-4cc5-b4d4-ed0aa38ed045@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4ae3b310-bb73-4cc5-b4d4-ed0aa38ed045@intel.com>
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|FT1PR11MB420853:EE_
X-MS-Office365-Filtering-Correlation-Id: db89ab73-7aa4-4084-6a9e-08df258b0a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: XP1BFs5A9Ro5y0B5UP/R4XJ19KIC8N1/ghN8Ek4y3t4fynvlLE7lQ6ldRWeQp2+6ufqhZcU3qjVUObk9vpvC88F6+k3si4VCS2PNK/NMeHH22e3P3QM0bursCL5p8KZMfEHw9jt1rwEs2/U6iUGwRUzKzMapniuRJAiFn6k93GoI8wJUwkJ2OBlieSswI31Ienl0cl+4C+i+rg9ErTzc8iYSts+Xfu4r0wRxvoKQ+VJAKnVIeJY1umHdzrd6sUv+HeCdEHYAkVq0Km7wU1j9UXqknPSmJUJNrGEUhSdzXCtcAsiaGRcBKG70PtbFzbTHrvAj31LTR+vkSFkXwQM3Zww9U54CdYWW1IVjXWOHxkZ/QcCXwFp5K6Wyp+M9lXWcPGmDoSyVateeQpRyx9fIiIjqu7jaWK6u7yMbjwC+ElALZyuigi2tlSOBIkrmISFrBM2wvQfEAit0Jo22aM9F5tA8j0YVnzQYT5urwkZVKXFQTj+bBnT88/azXwunwk5aNkePN83KaqtuGrTgBNjdAIiqfC2Dl6guyjDwbCTjK1DCi+66KHRUu36jHT2TP6KTmyorkyeh/camEEIdFT9kmi7rf4E18kLui3z4MpdhfHIiwjoqSGnj+Ib7tYn0OoVaJIcDCuRgC25fM5blsmQD9dh3dBSxU2+5EJ7ake6v9ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2z392sKvgkGi0DDdA6BrpHJU++ZnzyC8GQwf/mcE6Wv4klaV+eXcEOB9MSqt?=
 =?us-ascii?Q?w8x/QIQ5qcJ9YmJEZEOXMKHKZ54PxqJ0JqgLOipp9G26E2P8dGQdvYCdA6jG?=
 =?us-ascii?Q?q+3uaj/GMhpaeohJqD2BkH5HS/ax/kmzyxbf0GvYq8znP+RWddaUxrLAHh+r?=
 =?us-ascii?Q?9E2nIgJU0fWr1SmaWWnzmlGoV610hmQ5GlsOWA/2yz7+cVMwiURuScJfanSO?=
 =?us-ascii?Q?DPg2IRLkrJysm1OvQtZA7MBxbA2gEa5fow0fhcrE2hfgRXKieA6u6iuLaMq2?=
 =?us-ascii?Q?SBEM8ahmQPkTD0JA4aK4Mx2z0iARrVlpleoDtS2e0bV3rifmksNuPlbiSY1p?=
 =?us-ascii?Q?Qnfa/j0KLB78sKdkbZEB8a1gpU+N3UjE4kWxkQ+2eggaJ59IKZgySh3hffRq?=
 =?us-ascii?Q?wXMtIoPQ6dVtWzv6YaqsmyaQfqwyBoCe//kELNGycjAUEw4fuI4FAc7BAJpM?=
 =?us-ascii?Q?nTKirzxi2iNlOoveYoWjQSDEbStzJt3ttBNHv4HXxz6T2hJ6jNLbXgweSxpN?=
 =?us-ascii?Q?rFmtioza2k0Ig43lVGZ8SMJR80514BkSjm0YH01krV4+mGrGqZmUk8Smxin9?=
 =?us-ascii?Q?i89HB4XCd3wd+oSqxj22IYE3m9CwUhApbZ0wHM8yZvn9VY9cJ5gJMyz6CX2I?=
 =?us-ascii?Q?+2AQoNvl98rh1jEOBM3UXExHJ8mqXbTSccYqzf6M+D5orDyy4WCNvjf622mt?=
 =?us-ascii?Q?EA/kCZUiPAV/cE7XoCeM8KNrRbTZysik3azUSo+Y5HqwWFTwSk7hQijF1xSi?=
 =?us-ascii?Q?L9eFOJNxGCQWgF7+luS2klwciBZQTXfV6ls7gmsfWFRRPU2xfWsOgSSqmnDe?=
 =?us-ascii?Q?d8WrzYVFZNjwLkCu/umCrp5z0Mfg0P/WgX0Fqv9DsEo2UAUVP5U9W9XJQLNC?=
 =?us-ascii?Q?e2jYjuhiPm+fVCzNiDvDC53PqK53bElhTtMSxZP60pLtVDNmJTQfwT2OxDW9?=
 =?us-ascii?Q?yGcLoyYs8euxbye0cMnL7/WI/Rh4rmytApAChZIYkTjwkqK+CpBdNyaVvHgx?=
 =?us-ascii?Q?m1KQrHO5+e6CbDTRRDf1QGiBYKkQb0pNpe+47pP2DPrdc86J2TGeSSKhh5yg?=
 =?us-ascii?Q?lxpyrz74jSthchQd0CCA4uO+RLLtYkuaoM6DohyYTxNG2qYwH/HCvL54wXj9?=
 =?us-ascii?Q?SOxT2dJGP09s4Yze5s2D1tAuw6uTsn2MKBwU/0aP//zuL4HvWkMIl5VItnPX?=
 =?us-ascii?Q?mNZuWB2XBxtMwwi+bUVejVDUEHSLEoPZwJObZjfFGqH7eKMnsobVY3W7Acvp?=
 =?us-ascii?Q?ivKgoSHFJ+gYLLnTFlgcsKCygAs8U8Lt6E5YKw0SZLv+1HS+2MufGJSaErML?=
 =?us-ascii?Q?RbON15kSRGPaBGtjzPc8aiG4xy+ARvbMW0iO3dvDp5JdMNccYb33dqNwzOSH?=
 =?us-ascii?Q?a9Izw2DomlUgCaCEnfI/ChPvvw1/Sn95rfLNUNretyshJB7mNkFajcWDt55l?=
 =?us-ascii?Q?pPowNOLWr2RJWQDFTEqu0CVSe7M5gBJmf5cdlbBhpsTBaOotqMrd3m8IM9Tc?=
 =?us-ascii?Q?z0HSqLODQR5UhNxgMiUHidtStOJrlvp65d6hokC4ES0Vn6HyJ4/MGeq9v9RB?=
 =?us-ascii?Q?7Xio7Ehq996SAiaCCBrjqXYt+OZVPO12pjWhoa6qna9RJWSkZCVXHhBNGBEd?=
 =?us-ascii?Q?uwmSi1+oI05A2ZNyo4mHuqyI24LQR+dKRxObU2nhE/jUfBkckT5xnhGXIIUI?=
 =?us-ascii?Q?Ng+JZctrKQyNofWeTpuvxVVG7g0y8075fDenjLErQ70ttFN1Y8V4Mj0QeKxg?=
 =?us-ascii?Q?agrd/goXjw=3D=3D?=
X-Exchange-RoutingPolicyChecked: QOsLqyd1NhGmrtN8oAACsGYaVumAArVr95AYXu1eOWI3f2oWKxqZ/qVzymaH8AWULr+CtS4DY5m7s4nE73v1c14zsEdz+nNEikf6yyrnZb+yX2pIvKWz5Dd3qNdozQs29VRJYTj6ktLia4LMg7u3BtC6ouzcTTuipJzCFqkLXsypx88iHM/hdKggwB27rd/Jwb0omkfyqkv1OPRhfdat5xKgjTECx9LAuSbkK6JB5jCkRIIvSuAuZUq8z9OpMaVdz8Zz0EP8TULB01jE1pYgSnZQ16bNE/sOLvUJ9UT+DKASh35y/SWiq7oIUsjePW+r3mRtV4i/3Gp8ihQrdGEyuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: db89ab73-7aa4-4084-6a9e-08df258b0a7f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 22:25:22.3120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSnZAQ07NQoR7xwMCswiLg9H03rBQNWq6dGUvKH2Vc7rgE64OLjYF5wjVqYl9dnJ07O+2N79q9w7dgepEDg/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB420853
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

On Thu, Oct 08, 2026 at 12:11:01AM +0530, Poosa, Karthik wrote:
> 
> On 07-10-2026 23:57, Rodrigo Vivi wrote:
> > On Tue, Oct 06, 2026 at 09:05:33AM +0530, Karthik Poosa wrote:
> > > Describe the Crescent Island PCIe temperature sensor at byte offset 20 in
> > > READ_THERMAL_DATA.
> > > 
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pci.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 1cbd49933b2c..c7ab7b1abd25 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -482,6 +482,7 @@ static const struct xe_device_desc cri_desc = {
> > >   	.has_i2c = true,
> > >   	.has_mbx_power_limits = true,
> > >   	.has_mbx_thermal_info = true,
> > > +	.pcie_temp_sensor_offset = 20,
> > wrong place and bad name and it should be squashed to the previous patch.
> by wrong place you mean, order here in the list alphabetically ?
> > 
> > But also, please disregard the rv-b that I gave there... seeing this again
> > this is a bad naming... I'm also bad with naming, but pcie_ as a prefix
> > seems something related to the pci spec itself, what is not the case,
> > so we need something different....
> how about .mbx_pcie_sensor_offset ?

as I told I'm bad with naming, so I asked AI and I fully agree with AI now:

"""
Recommendation: drop the info field and follow the existing TEMP_INDEX_MCTRL convention:
#define TEMP_INDEX_PCIE          10
#define BMG_G21_TEMP_INDEX_PCIE   8
#define CRI_TEMP_INDEX_PCIE      20

A small xe_hwmon_pcie_temp_index() helper would choose between them.
Because the TEMP_INDEX_ prefix already reads as "index in the thermal mailbox",
nobody will mistake it for a PCIe-spec value. This also removes the G21 special
case from xe_pci.c.

If they want to keep the info field, a name like mbx_thermal_pcie_index makes
it clear it's a mailbox thing (it pairs with has_mbx_thermal_info).

I'd still push for the local defines.
"""

So, let's go for the local defines for this. no need for the info flag.
And a single patch.

Thanks,
Rodrigo.

> > 
> > >   	.has_mert = true,
> > >   	.has_pre_prod_wa = 1,
> > >   	.has_soc_remapper_sysctrl = true,
> > > -- 
> > > 2.25.1
> > > 
