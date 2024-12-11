Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED736E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A774610E1E8;
	Wed, 11 Dec 2024 18:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKaXS8ZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2310E1E8
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733941057; x=1765477057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cUpJyQORbwNdoS1yRyTA8OhNOcvsUWrR1zTPJapHrV8=;
 b=lKaXS8ZRbIBWsUtX/quZ6aWuaE0hT39Nl1oUS35vJwleGVR32CgaRxN6
 iWUIpZuZrLKsqJSMFg2mPam1axPA8z7y9DV8K+l8y6tSLYdQY6uIzPd8Q
 aKJQWAzbAAd3OhglVphyTJrThvuS3kML/v3iH5S9QpMdI0wDdkTyLIFet
 W0j+JC4hNG2iQnF7bP+NuN9htB67wYtMgpMfOo+pKANHvQJjY/HscITsa
 jfsjZoqM4QcKjb5vplZAwU78jMvozlw7oIsJHqQMSUY+0klMOpCOWH3pR
 SeSOC44cV69xWxqW4HTbzd9m0I2iJHDGcLq8wGMtN88BaM6rok3mdjOpZ g==;
X-CSE-ConnectionGUID: mKjge3hETP6QoPiZOrDH7Q==
X-CSE-MsgGUID: ciWhx7lARMS6jeUMAlI9pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45718414"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45718414"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 10:17:36 -0800
X-CSE-ConnectionGUID: 24P34JNnTniAcP//tF2Y1A==
X-CSE-MsgGUID: VXLObVI5RX2VVO8H7YQS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="126730969"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 10:17:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 10:17:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 10:17:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 10:17:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6MJ7e/EFcL4OWiiU2CYclts9XLChIbLehGfsly2OPC5zIYmWUkD/oWU9F0XQKujomJl4xU6bNie8xKBbA8e1GuMqF1oG6srK+s7rFE+4Wo0CfuIioRQBxalN4PcMXEKLU2MXi5PRFrytZlifom/Yg1Vto0WgIwYMLiTNKpTc8EzPTJaNmf1oYR8YahW2n23Yo/FX3PL2qm79xNGPQWZCrJCq8LtyIiMQHbqfl3OcqTr6IxZBMW5kC7DbcoHJaRfSeK6DfyOpqD+SRnb0qtg8YjIC7drsWmBoDPPd1IgfHdKfBo15dn/Az7sVzDqL3yr30OF1tDvVZAZuS33e6VljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1imjDOyjJ/OcmdJ+TfeyhNPH0/AxQ2J5jDJtyfdjqQ=;
 b=pAYPvk3CWHGukaqWS1SGjr5+2ltBS0VPgiSFlZLWR2z5pVGBePQ41mCBKkSNJLlmiUy+EBwgnCjWDz8oaJ66Td/LWYUZwYsEyiOp7zjnqxJ/6pQUg5YUt4Vu81V0eZsEWOkz1HkgT/L9Aaa8ljzn+PfongRCodRocSWG3k6DcTVr9v+4ZxK/BfQu3dUb/i3kumSAtr7RCmGRDM795hTireihUa3GJMEqNzbFhB1dRC1Wu2Rry3sSqMSne7H3K1x5urmlWI7sOhb2aOkeikDopacIGHMcbXDG3WXuv+wXITlnI14oEPpbK40Npd8lJAE+x5QUfYjK62p5Jge6699J3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 18:17:31 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 18:17:31 +0000
Date: Wed, 11 Dec 2024 13:17:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ptl: Add missing device ID
Message-ID: <Z1nXNwEpER3vwazN@intel.com>
References: <20241211141306.2156467-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241211141306.2156467-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:303:6a::28) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS0PR11MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: ed413820-35e1-44bd-dda6-08dd1a1013de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sw8kWGCRBuyhofYjRbdsQeXc6FzM/n5+BYdP2HsF7glyM0Kshc3F95XfljzY?=
 =?us-ascii?Q?TCFto6hvaK114pKccZ335AfjS76EhHjkEh2S8oX4lCL+L4BFqLuBjB449iTU?=
 =?us-ascii?Q?nTuYTH8G/7+lANdd+Uw5QFkPCPfxbN2xuLRHT9i03jC0r5iM9vfniZ19MnFj?=
 =?us-ascii?Q?NiRgpGS23ZZKRDpBe4sX58DKnaz978qkghewwaLILm8/qm0x1L/I4AgSljpc?=
 =?us-ascii?Q?saRIW0To6f0KYKIWb4VrJ2QqHchkvFZ4SjgzpRCGX071w0ToNjrp2WnuFxSV?=
 =?us-ascii?Q?5P84er8ESntDXFhwaYksxwk6472oQ7o0HJtGwI6AJLsmfVRDB9jX6LXfqMwC?=
 =?us-ascii?Q?vf0N8xRHGnd7dNaNfezAc2beJSJ8IutcvrHfebo8qZZ80f/DQbL/178QaQyo?=
 =?us-ascii?Q?VGwPHx0W8ofUIKxO4KZ4kgLFTGJE7tQZjf9+d+QBQi/WafLEauEB0q8OKT4l?=
 =?us-ascii?Q?XdbA0gXWlPqpbyO0HQTkSGIeihr+xzWtdSx6+5t/To6DRjKIjS31TWX83Shg?=
 =?us-ascii?Q?RXEBI/r+nkDIg4C6Ql95cgFi5qgQQ07rq/qQubbefahKEAkSUTf0w2TaOS1p?=
 =?us-ascii?Q?6vLLUB5YIoTbms2iGdN7NBG/oXg94IyUf19/1eFIyPx90n5qoReGq32sxRQC?=
 =?us-ascii?Q?+smjUwFoO9Lqo7d9/YmWX1kQFTQAi/RGRGSGeaXS1S6wwaETOoymPD7VXfTY?=
 =?us-ascii?Q?f9hg8uaOaApbyQrVyeFvB24Ek41Azl6tYV/xgV6YcD0tc1ruszjdxEJKOhgX?=
 =?us-ascii?Q?xHgoFKSmFYLmP0i/xcS5Q2Xam2oF677UfZ+Hhx+eMRmLnVXSs6YYGnUO4n+I?=
 =?us-ascii?Q?DgicEgy+1EC71YQBVVUkqzlCCwaNTdFM2hSDPSkOCOENB1UeypqWjM/onKAY?=
 =?us-ascii?Q?wjbSNfQXfdxxIwVaYxzEpKm0Dj77VMESBHqH5t5/V8VKUD9LUl1VEvoy9N4E?=
 =?us-ascii?Q?pLbTg4sdEzBabjtSI9iHkxpJFR9hRpme23rGCTuoa/GwCfWKpOWZuAvXTWIv?=
 =?us-ascii?Q?iYj7QAzEg8EqhCU+S5zxDlOzy1PP2Cq5Yx8DQJvLHHiY4/HjXsIZ0wU6ZpD+?=
 =?us-ascii?Q?cdaRRgHQB4MCd8U6qy55/UoGTVtx+iSbsknSY5Li2ptIAtlMYcv3ASwiw1jO?=
 =?us-ascii?Q?l5s3VzLwdR1OE8RjwuBE9YivjaBoC/AxWV5oUjIIqwwHC1sp6OWnLtITvOWT?=
 =?us-ascii?Q?evxecdXPpONDXhG5K/oah5Pp/00N9DYM0A481uSXnzxzQSroS1PdgOzG8/3X?=
 =?us-ascii?Q?34o9QtQgpIVX900E2wmukeuyvGXWMmW25S/8lzJK1/DQs9fIaZ+3pj3MOYyk?=
 =?us-ascii?Q?g3MUbSBEcRuWR5SE1UMG4qHT3VuTJ3YyJeH7lsWVxPnlvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UeG3AdhKmasbpFZAJ+SXZY4BlNu2LOpV82VjmImD6Jm9XENj34GiHaRAG/gA?=
 =?us-ascii?Q?5XtqpWr0tzVmep/RSs7LQlh5QJPbAxcKilAu2+G/z2x0fbfjOzL7mwlukYtT?=
 =?us-ascii?Q?+qxM36X9ArO7/YSqkyohE5cqEcJLdTpupMvWTheByr7IXpS0AJDHLN32Eokk?=
 =?us-ascii?Q?nlYuZBLST0eoGXV76783cFHl9B6D44AU3/9SeOxVPbZHptgwZH8zQDY3GJaD?=
 =?us-ascii?Q?utAv2xPwZO5pZXrqaIx4WU/Sx5j8URjTm9EI7IOnVmKDlR2nFKZsed6t4gdV?=
 =?us-ascii?Q?wYPZ5mEKLby3ig75k1Z+FS7Crp2WlHYUQ/mPIEZWkuiKLjpO/zrXIFhnjGlE?=
 =?us-ascii?Q?dSSOoy2rEhTzo56Rys2Fm17juPVbs/32+wuOgt+/iGliLtqHsKIHFk2QVmwT?=
 =?us-ascii?Q?4dgA6TgbtYgyi25UsYgX/B3KbSycY5dWfoYUPH6dhYuXe4Po02hUDgnoPcKI?=
 =?us-ascii?Q?htGi+X5+4/evbVANvH5eL98fWgMCvEPnJjM4K3K8ahpUpXiI0jJTE49E9LKH?=
 =?us-ascii?Q?X4Uo4vqAVZfjKyg/GUMHj0T9OdpnmZq2WR4PieZ5UmmFIe/n9Y4Nc7l/d5kL?=
 =?us-ascii?Q?2HnHlqpZUkr575PE2tyR6k9ZTqw8p9TAfsO3UvTJD09DgSa6N+MW/kR3WxmI?=
 =?us-ascii?Q?Nn5iOi7pqSMh3/Pd7OqDbca+6yg/AZDdpexwl+pIImOpKhEByHeeqNJK4dmH?=
 =?us-ascii?Q?PZMSZdLr7mrcJq2Pykcuq7CbliH43wIIRP2rmMuNEScF7IXChNXbO/MjNmfM?=
 =?us-ascii?Q?a35eiX8PT1Dp3iRZUO5/bHQwfl5WbiflyFD5f8x5kUYaIyeSytWRdgM3SXr9?=
 =?us-ascii?Q?CrUybpEYbUp5y9LZlv2vm66y+w2om2nBNP78xUWERudOjnezfVJFvWzQ/RAa?=
 =?us-ascii?Q?jZORH50CwyvRMOii4HEG8L7cgGfiSobw2pOI/1FUJl5CiGooBd5wZcXNlP/O?=
 =?us-ascii?Q?p4BbYLyBLHn3WouTqXGYepnT2PGcoVsGVOaj1R4ZMFiI4nBBxRY1X5O5y5ot?=
 =?us-ascii?Q?yQjHoTiU3jYJSaRUUMxwi2PZwirrifEc79nje5yy6hhXSjamLRKRsXkH8fkn?=
 =?us-ascii?Q?VP8zqag5cmOsazmgK1BtjNc+M9MoQxdHizYyFFK2W3wpfmYXh3gO8BX+JBuz?=
 =?us-ascii?Q?54sOrXZWHN9qE6gPAY60JQ0KRgoTblNXttaP74G2MZUZai65S0i1JzCswgQU?=
 =?us-ascii?Q?ONd3TTpmsJU2Oq/FZ1Jrz9Bu2N59/MINahE62KhJwn8aaUGU4DJccrhPT19y?=
 =?us-ascii?Q?IdG88LRcHrqk3+gN4/git76126mQ/HG3gtOX+6/fSiOnGueqqOHlYaMZTyd/?=
 =?us-ascii?Q?aKrrWvIm6vbQT1SYc7gB1j1N9H8w6nBnh5n5BWl7TKiLKW1dSOKEnsUA1dfW?=
 =?us-ascii?Q?XW7GaE1O/HXqQNa2UPnUV6ZXbik/j/HXhF4hON5bLY/cixlGSClqcV0B91vt?=
 =?us-ascii?Q?Qrz2g0n7xvUXUJ0hRuE4Ln2pnYLPknWXWZo0zkUH0czTRyDovhdRzI7juTeG?=
 =?us-ascii?Q?k1gFaW8brbZ2TJBet3ve1s01a8vmGSZTm+hqLyu2G178kwtUBsSIlntLeOUN?=
 =?us-ascii?Q?RLU7ykOkt3vWt+Iurfnw0CUpFdfkXIYie6SwnTqEhVbs2bcumTnx18G2q1Dt?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed413820-35e1-44bd-dda6-08dd1a1013de
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 18:17:31.3045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv8O4cHno5pYizJuUeIjpyT+aCB2AhzjcuDreMtZP6dq2wXFXgDhWuuxoU9U6PEc7BtLRyDTNAb0lh5LvvqzVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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

On Wed, Dec 11, 2024 at 07:43:06PM +0530, Tejas Upadhyay wrote:
> Probably during movement from xe_pciids.h to pciids.h PTL device id is missed.

Please check if this is indeed true and if true add this with certainty
and with a Fixes tag. Otherwise keep the message simply as
'Add a missing PCI ID' or 'Add a new PTL PCI ID'. Always imperative mode.

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  include/drm/intel/pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 32480b5563db..7883384acd5e 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -829,6 +829,7 @@
>  	MACRO__(0xB092, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
>  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> -	MACRO__(0xB0A2, ## __VA_ARGS__)
> +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> +	MACRO__(0xB0B0, ## __VA_ARGS__)
>  
>  #endif /* __PCIIDS_H__ */
> -- 
> 2.34.1
> 
