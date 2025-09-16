Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F59CAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 19:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91F10E3F7;
	Tue, 16 Sep 2025 19:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDDr0tmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68D10E3F7
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758052394; x=1789588394;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vT4bMfRtq0UwPu3fTPs/xkSDO0vrpeEjuRDGvy5nDps=;
 b=YDDr0tmHIprnJdgn0/dF1Kg3Ue00NgsmwTcuTeq1hEWHJuQO4dKp8c18
 qIdZjWYdQJdAE4dKuOcPg4CKFeCr9S+ggoGSEbzr8hpLgHW1sH3lCjFV9
 BGHDApFWdd+SZqIcu/2qT9IDRG0fDNRRpZN7l0xZoDhFUsngiK22ZLDeb
 zpRFNOHBTHwlGfCgi37aJo7MQ5Z0JSlX2pFGBKZIZFuJOgOPOmECizIAk
 Jq+Nm3GsMW3dZTavvH5AZN0j/zVeeFQn6PT8+EMCd3l4hfWZQx1V/kRYO
 k2MVWnTFsjgo3U2g1/cBdBxfpymWvHig+o0KWuxB/2jp2iTVCEtjW6Yxj w==;
X-CSE-ConnectionGUID: u2fNXE7nTjaPQcnFlk/pSQ==
X-CSE-MsgGUID: rrJBiUXsTf2u6lsVc1EqUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60294707"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60294707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:53:14 -0700
X-CSE-ConnectionGUID: XMXbhfukQnGafgo19Y1JuQ==
X-CSE-MsgGUID: GqGmAJtdSNCHV55IRr/eVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="175816901"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:53:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:53:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 12:53:13 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT0B0sguGmavJ0MvavO3JsDwIRAB8NtsGdqJDTTjsg8pFTpj1viJlgYwaAET7qqYMxlGbMFReNbQOIv8g5U3m/kg5LDawfOweQ9YvG/qSZpHnFuu7z6qRsDdqrRPk/GNgBdeWAfcBQSH94rx/fhHtoeGbvpNU8vHs4sn77UhqdicGm/VAeCwX3kHeKpjmeSA67ntvynxNkJa8Z8wKjJoQk5hzAQLjER4jXrkbkpLXsy5YVVS9IerrxdwJRfwffinX5hgD0Bix2o5qXJtH/iQmI0Krgbbq1DHKUkSlmnUusK4bOZFb5CjMcE5wzyEGu0Vx51rwfARJi4Uqqn0ZlQFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SS+g5A4s8A6zw3GFSnxI7zRIcN6BorXEOi0Y3q1t4I=;
 b=btnm77ywzyNI1W4bGu+UqCsLVaXGjOFxztqTZfljwF4VjyrUEYsF6sBvahLwobFmm6z0NxijvWTZwbuN87eGqKQKTvQxvebluzwgRAMSme6cQgHnIZYpNcHL+wpDXF7EnTv+p5H7LJ9FhXfp4RabUzYwm43ViIRy5IAzzGx20+apEkROvruMCaOGcf4DErMLra4SSv6mSM8Cj/XEsJDfxytKzq2nqKiTmP82x2Nd5fzppl2AqYfxmpKNcg66xgeLkJQO1T+/f05e2DuSf7cQ+keikqm8c/9OdLCHPSt5//bhjH0jevg9UBZmNKraDH3u1UHSUYgL/mPXZ/FwkUAxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 19:53:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 19:53:11 +0000
Date: Tue, 16 Sep 2025 15:53:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
Message-ID: <aMnAIlKMXsmRuXCW@intel.com>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
 <53d50dff-89eb-4de0-befc-4bb2552c5e21@intel.com>
 <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bbfbc0-1a90-4fd6-edef-08ddf55aaa2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?s/x743J6VeCue9lwFwvRzHXZW7aTVdjCqlhwIEk8YhmMFUkxbvcP2mJlWc?=
 =?iso-8859-1?Q?pPiZFTMIOgpRMrx98rJQF5f6bWv875H8TQrySXqTv+pp25VbufBc2jtTJK?=
 =?iso-8859-1?Q?mO+gD54aahBU+MCGPYXy4ELPFmGrpHlNusSMypHtgAwynchMx8Geneih5U?=
 =?iso-8859-1?Q?WswQQaOt7k4P2Ra2Jds9y2RuowItgRActxuqhPx5n9sH5Rm/fcstKptghA?=
 =?iso-8859-1?Q?rWh8BBx6gIGjdoLIEonhr59dZxADCgAzD3zPWppX+bbGwBzEXsR8cD20b1?=
 =?iso-8859-1?Q?Gfw/H16RRc1tkKM9lXNLSlSr8YU3se4au+URRfiR7lilTDe3Uu3Qho8uqD?=
 =?iso-8859-1?Q?pjdCJbynCqo27LcJSY2VHN8jOv2rPyesTRtB7NmmzR4vQ8gFTSacgJKWoz?=
 =?iso-8859-1?Q?pSWtdFpxZ82w0seY3X7ghScoEgcWs5BwVbx0WgifF/rDB1KnOldNax2tYe?=
 =?iso-8859-1?Q?nU07LRcqJ1elhc8pEa9+Stk14yaHUJoMdt1ZLHKYf6/k2gZuiQF1Dz5WEn?=
 =?iso-8859-1?Q?Bt18g+SpqlVeFTTgn6M6Jcn3+gDPNlVtNvL/EtSYNariCWjqPOuVFQ3a4h?=
 =?iso-8859-1?Q?aDG0iwMsM6GncNAPCFwRF2o8HyR+oI0X7lm0QdbIw7HrZGxVAtozG2QFXV?=
 =?iso-8859-1?Q?OnBsvs3Udjh2/2ldk8gR8adgdAtajwrT4Q8XvQ6SEHMWBzMdhBiz8z4lpS?=
 =?iso-8859-1?Q?53zUs0ob9OOfUgGj6ZT/GQPtlK6L9WCesqKInj9Trjlc12jJJSzRt0yDvi?=
 =?iso-8859-1?Q?aJA1bj8Ik5GUvLgaebq2AqbpvKdtx4sTaMhI9ngf2EMjZZ239oq+wE2vXB?=
 =?iso-8859-1?Q?UTThRKFN7iOatNanIzwq3AICMeijSIf4FqQ/1bbLZyPOuYtb8Q9Weh2m9K?=
 =?iso-8859-1?Q?Av9eZiv8YCX5VWkkUsTNZBJI1D/iaAqsNrBoWu6gDtSRg1ahp+KK0DsQuL?=
 =?iso-8859-1?Q?XLR8pstWHgLuAEa+9q4HBkMOd0jldy4DxHCwhCIcZXVfRaN5dMMOPCG3GQ?=
 =?iso-8859-1?Q?T4G1qCcGS/jC/g4K2JRJFL4MR/bA3gzF486PZie/IM35jAyjingMt3qkJ6?=
 =?iso-8859-1?Q?+CwF/3DD8ygDXKxFU14S0yjgNFrc0/OpWPflNUgVB/XWrI+ld3T1XPqyEk?=
 =?iso-8859-1?Q?iuw5gcAwhF+3xXZHGzUOzfPU6vbhMphnWjgQIqDRAxMnb0zKEofDdB4F68?=
 =?iso-8859-1?Q?k+XBYSXXghcXOphfFIlQYbDoVfSMp0mJjyKGydJgEyg3fv1Xx1SZWq8Zff?=
 =?iso-8859-1?Q?8z1U0eUWv5KVpLkWxLhRJzWJk9Hk13ZLt30cvV86oiX77WWea6pev5HzcC?=
 =?iso-8859-1?Q?G8njbjat/k6Yl9P23hcgt6iuq8wR93db0zNEhLDe6xO0uxTSxvQJD4vOPw?=
 =?iso-8859-1?Q?qhpUhNW/fMT51eKzAFnpf4HRx0WnmZRiR9uRxNzhlEJh1nU1RSWXpZtGwd?=
 =?iso-8859-1?Q?s1knGRmSCr3IiJDjx7DSG+e4tdD+fQ5HTiunRJDiZqjCxab1m/uYxEtr4r?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/7ggHmcWGoUUSMW4W6Z6FklHoT8B5zaaFrIKLauKrMbxfostCLjRVyLgyY?=
 =?iso-8859-1?Q?SNFjWsWsN7BY6M1h2+WGGEspxizDkV3IaxAzI+AC7Cv4XsYcChkZTkGBho?=
 =?iso-8859-1?Q?TvHrEr6gOUZFxncO/b9Xna3ej/r3xrzhdutY5gQi4o5vEPS1Mq5jCRVdhJ?=
 =?iso-8859-1?Q?N1KaAzxVl/lBAJ84pfNCQFj13TtBryUUqJVfG/O0+RZq4dLcjlS2bBX1xt?=
 =?iso-8859-1?Q?1+gFx/UyFUR92tGloMSjzmKeRrRY7yx8xiDHWI3Tzhbuqs3+ctRmT0BoHe?=
 =?iso-8859-1?Q?tSFoSEZoeTitRorpbooa8yI9FgyJVCqrRzqsRwQdRFysqgO9xtefGYCHK7?=
 =?iso-8859-1?Q?T/HXi4p4Ue3kPIu67NQuD90jYKffntoiKVciNlNNvXCGmnZeFzziuXg+NF?=
 =?iso-8859-1?Q?QDeUZPQ23z347W22Szi3GLDZK+3t2rDnZHwsDD2h6n7ocKDPmKqvTHs31u?=
 =?iso-8859-1?Q?J3+NsGtLqTv8kMUFxh5RVE++9R4tHC+ZRAD8gvYVzUTEiJMclY71cTKffc?=
 =?iso-8859-1?Q?I9DoGEtmFi/FeDeW8DcyjuqGcRj5sImD0W9xebyB3O2R78t//ZOt86ySdO?=
 =?iso-8859-1?Q?oLnBWUbpo/K5FadJK+N1Sg4RQmQxLmX4bvCDyGhkooaNCA3w2ZOWrqAKux?=
 =?iso-8859-1?Q?kPo8jfkzwVeqeUV8v71ePIMkNBPWPhmODSid2vckNxNU8++jMJjo/Wu3rp?=
 =?iso-8859-1?Q?hcyGzWax5UCXtTJeY4U8/8nDtcsTROP+zFLPtTsKjkA3Pk5eFyJW9upAP4?=
 =?iso-8859-1?Q?mU1gmEmV9j+Rc5uo1n28sQa3G0WNqRF/+RjTFjxgcqzfQQQyocsYqxxbFv?=
 =?iso-8859-1?Q?rfha0WAG1AB7tCkqXOL7JH4Q/opjJPPitPGpQeMCyQdDeMsKpoYVGL+HBw?=
 =?iso-8859-1?Q?MWbbAyODFqEaXWy9wL3lQ6ChDSLhIXQzTstCkV3BOZql8l+CXN5v5Q+QZt?=
 =?iso-8859-1?Q?m/dFWxvL7ZGe7Mai7Xca82B0ny+FrqLKlGpeWmxvTwYNAB4UE3eBfFWcW9?=
 =?iso-8859-1?Q?iKNaF3fJlliwmp7oWCla4/ST2sdmbcs8rysjLi7k2i54nKTDMJ/EiL9Lc3?=
 =?iso-8859-1?Q?PFY3UnJHxccXJG459sJwlhYTITD1TK70MK0IeU+URnYvjqTwjR1qY26m5M?=
 =?iso-8859-1?Q?HrdVrzjS12vbawfSkAAs2uIfwRvfP3Bq7l+t7fEdgisk2Tb8LpmtOzf5SS?=
 =?iso-8859-1?Q?wpGkcjwvk6eoluoD7txAkZePpubw17/bq3Dj2zGA0EBk8joGX5i3QKin0y?=
 =?iso-8859-1?Q?UhnUoX7Wd3BWy+3rY4gii9DCmv1bZzf/jZewkS/8egBSf5fIOCJAxrIq+9?=
 =?iso-8859-1?Q?PwSaA0V4QKQeJoPr5nv/0EBFCjSbcAVa5xndkFApZQd+aOVZIa5989SWLA?=
 =?iso-8859-1?Q?byHgglGThK84im7DEMilekC+ubygJOnvfEJKYR4HzgyrnlBz3HGoJ0iWBH?=
 =?iso-8859-1?Q?p9mekGXvrJqyTLe0sqc+M3NUjKVfzRS3B5bWb8ooTHoDCyrRVujmIheEWZ?=
 =?iso-8859-1?Q?Dmsw2+fkNKaXz6GL3Z9tsP+QXCXX5pI88rG2d1f13eEXz9iLxls3tEopAg?=
 =?iso-8859-1?Q?DPcFyFMpNGHDiCe489iceUkhoewtvaIDjD6mwr6ElypPJOh0HgeTYyN5Pe?=
 =?iso-8859-1?Q?YWewbluRa+PSHQ0KAOI6rNmSi2Y/G3/NPrPC39RA8NtFuu9yfdjtKgeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bbfbc0-1a90-4fd6-edef-08ddf55aaa2d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 19:53:11.0091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go+1PVRHCJUbuOuZRZOOQhBoj8rA2CHyRj79gEFkyeCiRttq96KrAQXr2FP6855qII9s8ADQuWMrmnSQxfq4ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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

On Tue, Sep 16, 2025 at 03:06:48PM +0200, Thomas Hellström wrote:
> On Tue, 2025-09-16 at 14:03 +0100, Matthew Auld wrote:
> > On 16/09/2025 12:53, Thomas Hellström wrote:
> > > RDMA NICs typically requires the VRAM dma-bufs to be pinned in
> > > VRAM for pcie-p2p communication, since they don't fully support
> > > the move_notify() scheme. We would like to support that.
> > > 
> > > However allowing unaccounted pinning of VRAM creates a DOS vector
> > > so up until now we haven't allowed it.
> > > 
> > > However with cgroups support in TTM, the amount of VRAM allocated
> > > to a cgroup can be limited, and since also the pinned memory is
> > > accounted as allocated VRAM we should be safe.
> > > 
> > > An analogy with system memory can be made if we observe the
> > > similarity with kernel system memory that is allocated as the
> > > result of user-space action and that is accounted using
> > > __GFP_ACCOUNT.
> > > 
> > > Ideally, to be more flexible, we would add a "pinned_memory",
> > > or possibly "kernel_memory" limit to the dmem cgroups controller,
> > > that would additionally limit the memory that is pinned in this
> > > way.
> > > If we let that limit default to the dmem::max limit we can
> > > introduce that without needing to care about regressions.
> > > 
> > > Considering that we already pin VRAM in this way for at least
> > > page-table memory and LRC memory, and the above path to greater
> > > flexibility, allow this also for dma-bufs.
> > > 
> > > Cc: Dave Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
> > >   drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++-----
> > > -----
> > >   2 files changed, 39 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > index a7e548a2bdfb..1f88ca71820c 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > @@ -31,6 +31,7 @@ static void check_residency(struct kunit *test,
> > > struct xe_bo *exported,
> > >   			    struct drm_exec *exec)
> > >   {
> > >   	struct dma_buf_test_params *params =
> > > to_dma_buf_test_params(test->priv);
> > > +	struct dma_buf_attachment *attach;
> > >   	u32 mem_type;
> > >   	int ret;
> > >   
> > > @@ -88,6 +89,18 @@ static void check_residency(struct kunit *test,
> > > struct xe_bo *exported,
> > >   
> > >   	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported,
> > > mem_type));
> > >   
> > > +	/* Check that we can pin without migrating. */
> > > +	attach = list_first_entry_or_null(&dmabuf->attachments,
> > > typeof(*attach), node);
> > > +	if (attach) {
> > > +		int err = dma_buf_pin(attach);
> > > +
> > > +		if (!err) {
> > > +			KUNIT_EXPECT_TRUE(test,
> > > xe_bo_is_mem_type(exported, mem_type));
> > > +			dma_buf_unpin(attach);
> > > +		}
> > > +		KUNIT_EXPECT_EQ(test, err, 0);
> > > +	}
> > > +
> > >   	if (params->force_different_devices)
> > >   		KUNIT_EXPECT_TRUE(test,
> > > xe_bo_is_mem_type(imported, XE_PL_TT));
> > >   	else
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index a7d67725c3ee..54e42960daad 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf
> > > *dmabuf,
> > >   
> > >   static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> > >   {
> > > -	struct drm_gem_object *obj = attach->dmabuf->priv;
> > > +	struct dma_buf *dmabuf = attach->dmabuf;
> > > +	struct drm_gem_object *obj = dmabuf->priv;
> > >   	struct xe_bo *bo = gem_to_xe_bo(obj);
> > >   	struct xe_device *xe = xe_bo_device(bo);
> > >   	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> > > +	bool allow_vram = true;
> > >   	int ret;
> > >   
> > > -	/*
> > > -	 * For now only support pinning in TT memory, for two
> > > reasons:
> > > -	 * 1) Avoid pinning in a placement not accessible to some
> > > importers.
> > > -	 * 2) Pinning in VRAM requires PIN accounting which is a
> > > to-do.
> > > -	 */
> > > -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > XE_PL_TT)) {
> > > +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {

I don't believe this check is the right one here.
Perhaps the config is enabled, but the driver importing
this dma-buf doesn't support it.

perhaps we want a new config here? so when we transition to cgroups
we "don't regress" ?!

> > > +		allow_vram = false;
> > > +	} else {
> > > +		list_for_each_entry(attach, &dmabuf->attachments,
> > > node) {
> > > +			if (!attach->peer2peer) {
> > > +				allow_vram = false;
> > > +				break;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > XE_PL_TT) &&
> > > +	    !(xe_bo_is_vram(bo) && allow_vram)) {
> > >   		drm_dbg(&xe->drm, "Can't migrate pinned bo for
> > > dma-buf pin.\n");
> > >   		return -EINVAL;
> > >   	}
> > >   
> > > -	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > -	if (ret) {
> > > -		if (ret != -EINTR && ret != -ERESTARTSYS)
> > > -			drm_dbg(&xe->drm,
> > > -				"Failed migrating dma-buf to TT
> > > memory: %pe\n",
> > > -				ERR_PTR(ret));
> > > -		return ret;
> > > +	if (!allow_vram) {
> > > +		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > +		if (ret) {
> > > +			if (ret != -EINTR && ret != -ERESTARTSYS)
> > > +				drm_dbg(&xe->drm,
> > > +					"Failed migrating dma-buf
> > > to TT memory: %pe\n",
> > > +					ERR_PTR(ret));
> > > +			return ret;
> > > +		}
> > >   	}
> > >   
> > > -	ret = xe_bo_pin_external(bo, true, exec);
> > > +	ret = xe_bo_pin_external(bo, !allow_vram, exec);
> > 
> > Are we also missing save/restore support for such objects? Or at
> > least I 
> > can't see where the save flow is happening for externally pinned
> > VRAM?
> 
> Good point. I forgot about that. IIRC we once made a deliberate
> decision to leave that out since we didn't support it.
> 
> I'll have a look at that as well depending if we decide to go
> ahead with this.
> 
> /Thomas
> 
> > 
> > >   	xe_assert(xe, !ret);
> > >   
> > >   	return 0;
> > 
> 
