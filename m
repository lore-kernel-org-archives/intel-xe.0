Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2461C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 13:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B0310E24D;
	Wed, 31 Jan 2024 13:36:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDC810E24D
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706708208; x=1738244208;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Cw4+7ysvfVZInXH2QvtC/j/xeBfO+N4u5gPS5bXKP0I=;
 b=aCX1iErc6DtbCWiBspHQJFnQdnGWYUABj1TTUXpoBN0kx4TL5A3oI+ps
 vkiwfkdjlt+7PDBLiIjhmIo7DsYpf09usjIOTB/QWeVV6aSWId4riNVFr
 MhLgGBGu3ODweHVKIBy6rWRjQCk5S75pa48STZW1nkNgrCgzQbJsSDREU
 ZrssoyqyR6Vh/vyupYOw1Qd/nw1cmn4LVrgLjicOVgn2t8dUnOzFHCeAG
 gsKTexy45hAYbFvKwtP5AeULN/K1ZWReYrcP6aGmgbJc/6sTJeWaW8WLl
 CZxM9+SLTo0u8MEbwvFhnwIW8ymixeqiHnJaGHA1/VRDXOgP+xQVXpCCn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10702305"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10702305"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822571157"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="822571157"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 05:36:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 05:36:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 05:36:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 05:36:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 05:36:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXK55H9rrM6iLUxhVikKPoq9eNpVNACMUcEWg/QqRMwUk6tDRsgabY3W+aCn92cxIdVV0GK3q6bnx7j3CWFjBSLC45ORZa3uxY1Og4H8cCly/L0f40xLmna4zNXFF703DpO7b3DKknaPaWVchRBNh0WnGiNkgbZ8h8MirZJqPQjTDZ6y63UXdh6gwz5vhvZWP1YxBNp0kleudXMOB4Z6iJ0MNSfYnhNuIKzldn1QSkdZkKmFdBfgg23LeOuqdaczb3NlzefXpxhZoENv/9gpv+7mmVci/HVAX3yOjmnlx1vqOm7ZJ1wEMriySxq7FU4c0U9NpKZc62yE7kpeKvrIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwvgiLJVAlmQ3r++ZCKpTzZjTamP+/B+XptnmixhWVU=;
 b=TDToUR5pkATs7IYaBp/bjqJxWkRDpNouiPkJbfUUzn29YxCh94JGF//sMd3pSs8h9H5MVWuS6wei4/8iL6yy2sTVlui8QN/OMy1csLd01X+MiSzqfJ4tYrDhvMu49QTpPi/Mr4KHhkcdFJCX0QSUfDE89hLlrL080nrnw4hCqBSReoZI314hR/awJjX6GJBHcMyJqah+GM5T71xQnfBZbF1jG/MPGBpL8PKwdZNWnRAHrni7aApv0/HZmHW7PFiSbcG6u5gyyEjt0aUKcw7tP3XaAzG/+K7BROCfo1OQHE5CE6etm+QIgjwj9omcqInXvzoYzetYNOrbLsYRmxHgnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 13:36:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 13:36:41 +0000
Date: Wed, 31 Jan 2024 07:36:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Make all ABI shift values unsigned
Message-ID: <sz3fcidgqwcbkc6xhl5h37xgfbt4e6pj4jab7iv775jqxzh7dv@s6lrzee3cy22>
References: <20240131025424.2087936-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131025424.2087936-1-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: c82c5baa-6ad0-4086-ce57-08dc2261a8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b0FGnoMZFJMiBPAyT0dqmdxEnWp7mkhfHu82c6nAZiLCbfql3oKWhWMwoVYIo/pfap0BCHx5IWXu7lqyb0HWtB+AJ9VQQFNt3Yq1V041dwlZ3AbD8eSjhc+txDYUND2ao1Xp8EbOr38JiauLQ2SlrUcmfcybCDWDEv0r0jXdqrAjJjfI+2V1jXY2ov3IO9k5SKnyHhFPyOoB0LMFgud+y/H/HKiQg23Ie9W6Pnig7MORRg7kwB+O62j0W1Vg4IAZ1k0ad14jsOhyt3rDokMaBQofI9UwI3jl/RW0pMXls3FXD89+ohgpziwsFsM9t8wrZ2nLaoW254ZC1dzETpZsC1M2FpnPRXcReJzMGAc9CS/F3wRHJ43ifPmbp2hz3E4XNkCdm9IVnOoKFTPfR3LsZt1AyA+Ix9YJfaQ08xyh9fBfE3yBITKZEt2fFpSwh6UBxRt6hlKasO6/umlgf/VAYCiQaon7gvc5QtP/vI9blCMRcjkXcLlgegeZOJcgYHzSVDb5kYx983EvZk/K25zbzokEGjQEvMgZPLchxSJRljs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(4744005)(2906002)(26005)(86362001)(38100700002)(5660300002)(66476007)(66946007)(66556008)(6486002)(966005)(6506007)(8676002)(4326008)(6862004)(8936002)(316002)(9686003)(6512007)(6636002)(478600001)(82960400001)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8Qnp8Rq5fSgkaAZZB1wvf+M2WUkZ01GmGewTsLpeo2mlWEpU1YefwYFmk3?=
 =?iso-8859-1?Q?X+XpvkkU4WIuVUbv4aE2V87yBt79CFR1/rNQ9gtl+kBmwTdyuzAqSO7B3k?=
 =?iso-8859-1?Q?KUwrHrYXPSRb9nRvD6yjIXw4/OHcK2XbeorMRn9lbcuRd+/VGuOsNY7hMW?=
 =?iso-8859-1?Q?w9spugIVlymy7Nfp/sgqj4oOdKlByUOwygqTP2dwCG68eGmLIprfQRJOZ/?=
 =?iso-8859-1?Q?Dw12us16goMBja0/WOreWQoReOZgXW0MmKGTJRcvQp/SfXBNTpJSS6n6NM?=
 =?iso-8859-1?Q?+K9xybMCB3arAFt/cF/l60+Af1zlYMnQy5R1p90bQivyVoMmXUiexvXVgH?=
 =?iso-8859-1?Q?OK23X4O9NK1ehOWmhSaawCIwBPU4n0YXk6EYuZjVKrXwqYmjOjiJoZ8X+q?=
 =?iso-8859-1?Q?7Uh5HyUAD01IsyzkR8wat8vYK0lu846ZLJO+1prCSvC+OVvTF+IQQXI+f6?=
 =?iso-8859-1?Q?k/+Hi1b7LfnQPR8ufpk4/EuODeDsMTXXrsL4TOzl+DnJ+GbdViJudhy80T?=
 =?iso-8859-1?Q?tnoFXA/2ceLnnhj5SjDiHz46puXzUc2Z+uPF3rS3CR8Jv4jG0kO7ZohaHu?=
 =?iso-8859-1?Q?yYzs4AVm34hfvBJclynUJBBoXwuWU28CQa0vTu6pBrXuntODBVX72oYjRL?=
 =?iso-8859-1?Q?lm5gGCketpfRZ748bHCwYOWeEMUiF6TIFZOAC1gEcJa/QDjAwCqWS2pEUC?=
 =?iso-8859-1?Q?aqQ0UNmOrwbxuAzNkqTfciysFKb4s8KFWKI0MAHt2aHzo35++lH/0XXnba?=
 =?iso-8859-1?Q?KHCQmbgRB88dJnp7KkKiUIQJXR5X1y1+IsbmHdy3P3IhHW/3xF/eiP1GUu?=
 =?iso-8859-1?Q?G+LqLZO+KVidIQq/HwvjisCFYL3hS42/yqk9r2Q7ApJmBugoe6LlNHHFXb?=
 =?iso-8859-1?Q?Q9sewBz5d0mcKft9zlVlsYLIwPEm0Cm+UU1I7sbprXrM3CKbMPSjoxUBQN?=
 =?iso-8859-1?Q?QRrArAwJAJ23K+sX8EBuMlJGGmYX2Kd8DeygLfjAi7HKRNBYhjnycERWRD?=
 =?iso-8859-1?Q?+g3HWxYEPiUxGZe0y0oVA+i9r8Nq7H26Y79CnqDZxVWD7lWpknkqPpAhr9?=
 =?iso-8859-1?Q?MBQumQPaZsoYrfjcTezeOieL/x+pIzEVv1yzuEDDAJWn6dobXWEB4eUl5C?=
 =?iso-8859-1?Q?mh0YCqcn0YbO8WJBVA3fj8Gravsn+xsNopgMNScLfunOoJ1AK/LdTOSO7G?=
 =?iso-8859-1?Q?rftEqe/LyoIuMXjejj7v7ZEyqyQyxmf3mPuxFE9cTMMnqwo+wIpfaMm2xW?=
 =?iso-8859-1?Q?RWTF0XnYGZDB5pY+bJX7Aq9o5tp8zlo53qnneL9/pfkQYvLQHVO6C/oQ5s?=
 =?iso-8859-1?Q?fNwVLl35n21f9kWdubhhykGft5qfQnE5UyPTcl6H/52H+5n+rGXJ3GP77R?=
 =?iso-8859-1?Q?eX8do3n7kO+iUysEOQKcBo1VpEM4vp7AcvPqej5Z+y1K5e8/NSi1wiH4Fd?=
 =?iso-8859-1?Q?jsMtI5xLSt/cER4HZbXjwbFv1YAogJoiwnu8LryQgek7MWztn5p3J0fkLO?=
 =?iso-8859-1?Q?k7DJExdcLZf0MUM3VXZVOOZ0PKEPUaxEZsxt3tPWk9z0lH2h5HhU2QWwSN?=
 =?iso-8859-1?Q?3cLye9+mYtdzxxG8H3odCUGLA40WttwRRZuYrA37+wOqZmgcQGh17qsC3Z?=
 =?iso-8859-1?Q?QHlQ2VV/PaHCRgFzcC69bdif6fTLW4zPrS6xUQ0xqSMJ8VmKp7S6faFg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c82c5baa-6ad0-4086-ce57-08dc2261a8b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 13:36:41.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2f/koW7rYbsmYDb909gxN9mPU6c8QJ8wrv2c4cMjs+T6xMsEhJJj9D8f3aR2MXB9cEJisCaUZ+RGUWT7JKCYxobrcwSZ/1wnicp0IRyBr2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 06:54:24PM -0800, Matthew Brost wrote:
>All ABI definitions are unsigned and not defining as unsigned is causing

s/ABI/GuC ABI/

>build errors [1].
>
>[1] https://lore.kernel.org/all/20240123111235.3097079-1-geert@linux-m68k.org/

>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
