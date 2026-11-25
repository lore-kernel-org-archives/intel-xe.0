Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C3606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CMD8w+CX;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dlL2wgvv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CBA10FF76;
	Wed, 25 Nov 2026 19:31:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E784910FF60
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 19:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795635092; x=1827171092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j89kwsE8Q/IWXiXC2ehiSBcN7+A73ybEcwYnFN5PlwA=;
 b=CMD8w+CX/tKbueBlJz6lNHUKSElrp5tRyF6APSKo9MVhuCtlh79ZibGb
 1qX0UBn99GMtQK+1u1ESI2eyoMNz6ylYPlKXHyOW7VxUJP0HXuFicgw5r
 DrsLY6VyIxJ6XuYLU271ahXJGOpbbGPTaMClDIf1YjK7FnL2gP3YtStpF
 FG4df3Bwr4AYGUxqRyMbYUhEBHEO8SS8Okj5rvKQLYeGqJ62ESA8OV4/3
 NK0l4DS44Lh0eqwJPgDzR5dseIGVX/WDEEFo4BwLTnxLrnDA7b5ShF6UN
 GYviQXV9GcE+dYEwukMzsE96qvEE4bOfsEB5hkVIKbseuvaTzMkz3LzK1 w==;
X-CSE-ConnectionGUID: bKWZ9EzaR86knKpfdjvLkw==
X-CSE-MsgGUID: emy2a6TjRdqoFv/iYsY/TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4447450"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4447450"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:29:34 -0800
X-CSE-ConnectionGUID: flsb4z4LQVOuUkyQrFzqKQ==
X-CSE-MsgGUID: /d2YO8eYTYO0NmBHTvARpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="13606300"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:29:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:29:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 10:29:32 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYjID5FbR9TYdSqxXs2mR+zb7sozWhzrc7FwMKbpvdjC88LR39KAql3tdyFOwlAXhCTY7HU+wJacedyjzH3Pa/VxjoLFA35lXX2I+7ZDLB3il9KKIVJhJmbyKoPLUGUOFG1jjCQIxadx/grhclPf1UgoEjcFLQ4l+8lNdxkIZgQOROm/c1UQJHgK7cOyg7yxxx4HYXD+/rCzlHlC0BWWb4DbztZRZzosjywOkgpT3iFz2YQ+R5LClhzFm9zCpKO9v0x99V/+XgGvYNqM0dh+7oL4GIh4kaEFw/oSWwXwXjsZ7Ta8j6eKaWhHCJf6MYdGw/G4Tt0pxgMeXTNf3kpLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z123ocK4td0se4zDA3oNYTYPpkdhp3W5lq04iCCm1bk=;
 b=Hvuxv+nXMhJD2EuoakZfoSS0BoOuzI5hLvsctZLLHrLUUZ6nNJpHd9AQF2PYCUfgZP5qm6MCG0nmriCl9xVyCbCe/hqtohuNHft5UMo72EeK/8P02prkV8v9j2ZBo1u5hP95/TTteCx3NG8GvNFrpWiryOoNOQi53LIPKvn8AdDNU7WlCeuaWn80lSx7aft/NtRlMw19NDHLkxMR9PtbTBT/yjxmLnAy8Nz8p1oOrUtT9+Rs4fHNxByIOHMygJ6adZXo52KU60LGqOPsv1eOjuyAlefj08/5q5KByUlt8uXssYqYrapLkUJw44/Dnp9Ci77FH4QrAAG+ozW2x/75Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z123ocK4td0se4zDA3oNYTYPpkdhp3W5lq04iCCm1bk=;
 b=dlL2wgvvg//zgqXY52+LTC3VO/XWHqxMjZOFXJzHWFAYlLEadDUg1EGQpSrcJx+znfdkH8w8q8AtMoOm29h0pgQI0EUosA47rAQKniKCdeg4+mvO7v72CAO+w9KcVZGSdpnvFod7b6VJb0eHc0/P17qonF2N4XI52tLkT5vkH3g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS4PR11MB9532.namprd11.prod.outlook.com (2603:10b6:8:34b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.6; Wed, 25 Nov 2026 18:29:31 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 18:29:31 +0000
Date: Wed, 25 Nov 2026 13:29:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v4 03/10] drm/xe/pcode: Add ordered write batch helper
Message-ID: <awcpB6s_32zyhNBi@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124054811.798763-4-karthik.poosa@intel.com>
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS4PR11MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: a24651d6-4ac5-4375-d787-08df4b220bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|10067099003|11063799006|4143699003|261022105027099003|261028144727099003|261026140227099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6NJR0Y7Wc7Gr4CGGVsKxbN7T3gNM9GwF+Ra/QdLibNCovIl+4JgC52qrqbnKVSG18zUEd2ahF2kgMpIaT8zZDTUHXZqBjF6o4sEJKRCO1JhNVYFmDzn6SVW1kMuyKYVOnkfT9b3qp/6T4DkwHCp95tT+pu/5zh+JwoFbZmBzKRa9ulgzehXtiVpk+VwKWElxE+725EWFp4hxJkn8Wm6yqNtLzJRMCC3kDheZ+tkhBuiQ2Qk1riLwL93YYEmG9qxc5xLHiR7goEpPRE2gXOc1okSgcnHKGjJqWBpVL3P5vIv+cU7+BON8xROrJBHfWlIny1uNt4svfXJT/iYPazXjGt9lXHJ+KVDb3BB+8w29pxawLXmP8Ni0zBptc+QJfhm7I7Z5NcPT2W80W3eFI7m1l1RwgOin3iQe8dlszZeKH/9Gjrk46NIgGjw3vmPW79Nhp2AVoHCzAw7/dTr+765mUuRE2l+62BJUe18Ei5NIZkyYvtMlTcpSU6FLnyKXAWYExqKRDCI2xkh9cs6NOUbvVoBQaoI4yj3HG/dZ7vRqrenAZQmN5MK603+NUUQuWTwVvgKUYXfFKc3cnZTHnJyMeLVOaEx7edvBI8P1S79CBgz+mbjCIAAot3OUbI0eQGvxObWxL03rzejjZg8qVJge4NXy9TPDeajB6ZOEShUfW7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q1Kgkz0IpYQRvTV+DiupThx7n2rcAxCXNj+U4zlam/dLv88mvH372Ikn/grV?=
 =?us-ascii?Q?ehpfnD3R4j6B4dsMcO6t7VFNprwRXPuzBjyyFK9QB2V+Sad7yF41JlgMq4Hy?=
 =?us-ascii?Q?5qcq2I9WX+2qjvFCxBfCNSuA3VUip1NBI5fq3Hrh7JtyL6MzyKc4AXlyuFB7?=
 =?us-ascii?Q?1a/wUp/7hwPJ4fx5quNlvm5fpncWRG8cM5UaYHp39x2Ns2hzPke51S7VcfFC?=
 =?us-ascii?Q?nkVbIwv6SNDVBqS12G6cGGqmClsiiytvX1BTT676e4cSBg+7dspz4f60WBx+?=
 =?us-ascii?Q?Dd+lunSgzVHGstcPznGF+dhPWR64vn6vJanAmPX2uamsKoxZWa3Z3LAdyO5J?=
 =?us-ascii?Q?ivsZpo1RvK0qVm21kp1khCEABp1t1t5c39Ye4g8pI4/EzdmoVtg2sAw96zGL?=
 =?us-ascii?Q?WfHvpBkiTLgVbZAsmTVfVrXtaNHrkkQ5sKWUNNBrdZ/XeQOq+/LaZbXHa4GO?=
 =?us-ascii?Q?Z2/V4WeqSlWdNbh2jhX1WxzCyUVK+YPrFfzxsKrFSuxO/KDQ4CvJfAE9qKod?=
 =?us-ascii?Q?TsMrkhgrvZGyjYhX+8uVlBNkvtaX9Ti05i/2Cwv9t6EdF+lsKFH3DrccI6zI?=
 =?us-ascii?Q?vtggzMlFfVTKc1NLX7A2oDgtpiDE+zeg4tjNPy1PqJxqeJugN59jtTUe7bUG?=
 =?us-ascii?Q?+vY9iHd6w67w3TrYyJUyzn4GZ7dgeHRY2yUieAmXCFRytnjzvfkI+/6suQNR?=
 =?us-ascii?Q?zNTxEnDsaai+aiUzMF1CB1AKbyknBiOvvW6v3OpnhdrUB+/MPVPVLH4s13hs?=
 =?us-ascii?Q?AIAF4lhcpa2xK6xmBYXl/QFcae7cSmaZ3pt4P1LxPGDea8UBrCp4sdZ8E4UD?=
 =?us-ascii?Q?kej6pQCoJ4sN4yRUPJi9wG1XOvbw4W7Nzw3oF9x0UlwLHCh1Ia6sgAZNcwcN?=
 =?us-ascii?Q?xnT2p5wQEQMdrgXn+b/ob5gK8cXZZbzSkg8lzz2++rBcl+8NiTdZbvFOsYsZ?=
 =?us-ascii?Q?xH5BvH+9Po55Uv7Mb5qh7R6CsBNAMtZ0nZ3WMCFiWedQrr3Vv0sn0M7jFFHq?=
 =?us-ascii?Q?ycV1wu3O/GgbKQUgb/L1dKsRtzvFAoOs4bHz9Lce4R6eGmrimOK9794UR8Xz?=
 =?us-ascii?Q?bcEt5d2cN+kB0YYP/c0rNQkJ8wjZrnKw3N2XJyWDTe4ThFW3SUSdmhv8KVkc?=
 =?us-ascii?Q?ZXucVl3d/p9zaezlcSWFLhw7Kw4di11rlj35yj0qM52AHv0J9sfp2lTPRvOi?=
 =?us-ascii?Q?aDeSmEKS58WuLY0ncpc5WBZ+a2dulWMsdl/xiue5l3BU9CYWvoe8a7UqUjJ1?=
 =?us-ascii?Q?rCLJYVbuWkk3EQql86m+Hg0RtznIgrmuc2rjQuJlCV9a9myuQs9+t03Yr1PF?=
 =?us-ascii?Q?YCJ0raKeF2tYvbAGHT/VAXtxZ6Mn7c05NNvJ0KAKROx/eZAZDM4mEeJeWoVw?=
 =?us-ascii?Q?drfJLima0q4Y6XekeW6aLqTrIWPcQIfHe+IKmkyJrlM5XXVUkf5pJCPcEhyw?=
 =?us-ascii?Q?CPY1ehjnMQ00OrKaNswjycjQH0u70n+1nDVcQBpGE4DprVe8d0mLeZI/9s2Y?=
 =?us-ascii?Q?AaKM8myJQVkYC2jKvTnaWeLAF8PR6GFRoEszCOaW6kw2tnw4BGV/xFjt7qOO?=
 =?us-ascii?Q?Fu2XW5d1YqKSln5iGyK0U8SGDtvxAww9t9QcX9v0RveBIKX3liXdWufygB//?=
 =?us-ascii?Q?1kzYCoCGNKesIJHga6d811SMXgc9AseB+kXF9ChdLM9ROMjTAPXpRHK+hLRm?=
 =?us-ascii?Q?/ZTJkxCzjTKofHGvPKWvqEvTg+Zh7Om+NS4ob8ysfS/dBWM37EKsUXMRum3i?=
 =?us-ascii?Q?1i9GkePDWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Jpe+rHB0u0Y9IAJzDBSsfopwGVSmKi+fz3rL5bkaV9/O41MBmkuNxo45fAdnf1hpBu/bCPAwzk06LWBW0ZuEnA2FNwsuTeT1VjpKPmJixOLeQQyPfGMq+VrZj+28Eam3K1uDdmdwhWAIRScsKse4nLKuqVZh2dOF2sX1nZN/q9fp7/kvoZLPTEeW1BMEg6MHWDY6GK/fSAHDhO1+lmr6OoT/6RgbG0/mCuB+C9BgsvYYVeF4wONDfFgGLjIEw5h2+ysvulTjvMd5J3PBwiuNRL7RsO2WvtnrUxRtseukJbvsfjmDtLnchmqlUWSQqbCEcMbmv0YlIwXXfkcxOd6yFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a24651d6-4ac5-4375-d787-08df4b220bbf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:29:30.9865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B8ExTtwSZdYpQxX+Cpn1dTgApjb1Q8PsFX4jTGLJgTjM5sWXjnbJWbMZESepCCYNpAt9dNGAxGZvxv72A66wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 11:18:04AM +0530, Karthik Poosa wrote:
> Add a pcode helper that issues an ordered sequence of mailbox writes
> while holding the pcode lock, so no other mailbox command can be
> interleaved.
> 
> This will be used to write fan tables atomically with respect to other
> pcode users.

The question here is: why do you need this?
What are the odds of this starving and causing timeouts on other critical paths?

The code below itself is right and I'd give my rv-b, but I'm concern
about the overall impact and risks, so we need a very clear and sound 'why'.

Thanks,
Rodrigo.

> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> 
> v2:
>  - Document partial-failure semantics and lock hold time in kernel-doc.
>  - Reword commit message.
>  - Return -EINVAL for an empty batch. (Soham)
>  - Log the failing batch index, mailbox, data and error. (Soham)
>  - Add kernel-doc for struct xe_pcode_write.
> 
>  drivers/gpu/drm/xe/xe_pcode.c | 39 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.h | 12 +++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 266deecbb100..ab796218e737 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -124,6 +124,45 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
>  	return err;
>  }
>  
> +/**
> + * xe_pcode_write_batch - issue pcode writes in order under the mailbox lock
> + * @tile: tile
> + * @writes: mailbox/data pairs to write
> + * @count: number of entries in @writes
> + *
> + * Holds the pcode lock across all writes so no other mailbox command can be
> + * interleaved; the lock may be held for up to @count * PCODE_DEFAULT_TIMEOUT_MS.
> + * Stops at the first failure; earlier writes are not reverted.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
> +			 unsigned int count)
> +{
> +	unsigned int i;
> +	int err = 0;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	mutex_lock(&tile->pcode.lock);
> +	for (i = 0; i < count; i++) {
> +		u32 data = writes[i].data;
> +
> +		err = pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, PCODE_DEFAULT_TIMEOUT_MS,
> +				       false, false);
> +		if (err) {
> +			xe_err(tile_to_xe(tile),
> +			       "pcode batch write %u/%u failed: mbox 0x%08x data 0x%08x, ret %pe\n",
> +			       i + 1, count, writes[i].mbox, writes[i].data, ERR_PTR(err));
> +			break;
> +		}
> +	}
> +	mutex_unlock(&tile->pcode.lock);
> +
> +	return err;
> +}
> +
>  int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 7e43792b0037..c601a12baba6 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -18,6 +18,16 @@ struct xe_pcode_version {
>  	u32 engg;
>  };
>  
> +/**
> + * struct xe_pcode_write - single pcode mailbox write
> + * @mbox: mailbox command
> + * @data: value written to PCODE_DATA0
> + */
> +struct xe_pcode_write {
> +	u32 mbox;
> +	u32 data;
> +};
> +
>  #define PCODE_DEFAULT_TIMEOUT_MS	10
>  
>  int xe_pcode_init_early(struct xe_tile *tile);
> @@ -28,6 +38,8 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>  int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1);
>  int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>  			   int timeout_ms);
> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
> +			 unsigned int count);
>  int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>  			     u32 data1, int timeout);
>  int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
> -- 
> 2.34.1
> 
