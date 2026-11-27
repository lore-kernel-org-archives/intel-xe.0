Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB1606A324
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+ZrMVpL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D546112B3B;
	Fri, 27 Nov 2026 14:52:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5288112B3B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795791123; x=1827327123;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nZwZi4tpfg2o76jI6Zal0ZKjgAGmII+T8EuMKNZ1yYE=;
 b=B+ZrMVpLcmPJNEeYYtN+Y4qWS1K91XcM9Cw7/zVZWubtBaDuKG6L1oOi
 8K7k14RHaUdAm0kWTOSnak3IvMfcfrXCIsDU/GO56HvJ4IiGoT7atTxbB
 i6JiiO8RXFuxIKVGwyaYBwAP7BoZqMF0oYwWYHuv4dkwuBVb2s/1qHx+B
 2Ej+tegOTVVC5GEd4fS9/fo49oi6DtVzfRDg4LLt721MP6sB3QX9GXZno
 3jduR9F6AE/vEIrOVrakW8O5oGybPXuK27zeUBsRvUW1vnB9guW8wfkvZ
 b9FPLklRtHzhLuVsH/OFUf4ogp1G+x9hydCrgWtH21ZR3Fr93wPznTT8Z Q==;
X-CSE-ConnectionGUID: 52tfPALFTq67hQjkjGxjqQ==
X-CSE-MsgGUID: OJpjCD2eSzunPSnU2QU/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4615108"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4615108"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:52:02 -0800
X-CSE-ConnectionGUID: bw4vUo5hRZSEyv9WfggW2g==
X-CSE-MsgGUID: k2BkHIv0QFKOunLqaHR/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12445518"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:52:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 06:52:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 06:52:01 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 06:52:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmUeLpPGp7hyDcHauGaXoQc0KtBD1yic5GULXTEITMQ3x5DGLX8SZ4VdW/+vQ/e8bZ+nonJ7h7S5A/ONB3YPN/5Mj0u2eTDaCv+hJwIQ7FP+BMO/KaVpCe9uDv0jYHMm27bd4rakpK3KBmhWev3SyG2BBbi3Ov8as6hwMRj3A3moT5wv/l6pl+4/ULJoqGFflmkwoNoMS7QLbGp65DwH5kjQLyQkXmA6n2R2CAaUJp5UI4kRPt5jDYXOz+AuiCxNlaZsynho+HVEl1WBaFXzVZWyftnyYPyJXKr1RobdLN+wKynjAHAcey4VrRV9lPYuKv4O/nGcm9PqFtetuybHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8l6lh8cxwZPeoK6ENttGz7L9jr5o5KJY2tvE9eFWI0=;
 b=hMNwp5s0HJBDCaz4YtyyEjU+Ni3uWAn01Afp66DsKYNL0nDtR0Zkil6y9UxCLhwpW7uNdBuRQI13KbXwosDg8zFV0SnLfRK4quPCn1wKFhbtDv99h9+9QxK8eAmk2MRza1/Gc0BCAwG5pludkoCiQlJeRaA91wNIY/SOcf1Cs14NY7vZ6vl3zVbygRQ0iKFz9BQ3S1zhaLp1ToeZ2GsioBKOXD5KOS40gXT9u/xWYnWQv9hOfRXaXDxqZNlYLClpgmmHcmmBpmWbWOSj9wOwtOxMHV94ItI84uNPqKuOoAjWv0xaKp8q8wRTA8I6VpED1tPe6g+hqWMj8YxgvRiHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by PH3PPFDC3198517.namprd11.prod.outlook.com (2603:10b6:518:1::d55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Fri, 27 Nov
 2026 14:51:51 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:51:51 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <nitin.r.gote@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [V3] drm/xe/nvl-p: Add Wa_14028564128
In-Reply-To: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
References: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
Date: Fri, 27 Nov 2026 11:51:46 -0300
Message-ID: <87tsl2iayl.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|PH3PPFDC3198517:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db9acf5-977e-4750-0d32-08df4c95f85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: EQENJZH4iqN4ADToARwGQ1uj1jeXc/tk/XH5Dl9Se98yBX8wOmCtACzQhz2+Xv1oCgUqiNq9mtdmx67BhQXIfxiSsA4LR97r+Im36In5UhJVJQM6Ku9JDaL9wHehe5OrWZ2IBC1szGkpLL4ay9es2LOcja6Vv25oJzpaNKIR/f8U2Zjc5LOM0eSOU6L6Vg4HKKkHgZC/rcPl8ImJNPC4cu7g1PWFczPs/lUTn8vEfWzcEXaQKT5U99n9NlM3ruRA1FBmlPYnW9yhEyC/DCA3/Jru6/wZafAI6uvUsnxzP6N/zSb/QTPerWwqM/eqhZNp/cb7+OFt1Usw6Uuuj+mqmcNoWEz63JNz8OoTcnCJ9l7O1ygDDwpdzyZZ4lxNP0KMn1U5hFUQ/mrf25S7LTPR/3m2iGoYa5DrU+iEiMn0WF+vqfMjOTO1O7WoZTpE9sJY3CRoGJCglYIpTIEFZiMxzwmzxirMUJNHZYnIQ439rtl4gfSL/MS4KCOp0Cx3EJTb/8YtK7e17KWjn0GtvSrOTLd9jUQiDk0yl6jmLBfEw/78u4eSUoAXPgb8E9gbGqZf8Sc3yr2qzfIM6MrR2MzmEBISd/KJhk8ng/72kvxB/+RZ+xIDpP0wJ1IVAYmQfjWNIXBy52wlymOXgMXNkhk+xLiURHX/TK6Haq+xHuJBZkQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xwTBXeatj5npAUo0omzvYc+474PHL7IwtZrjDeEe/aI943Kd0AHVdRKysJnT?=
 =?us-ascii?Q?fR08mY54bdRpxlkPezoTABNwTWtegY5OIN/9u8Ai056fedR9FALcGGAAq+sp?=
 =?us-ascii?Q?oj6i+NF3mLvKklCcL04fqwO8jiNsDwbnyazwGgzPgOdjawUf8srWvCWj0J57?=
 =?us-ascii?Q?hzoF3ZjbXCNQHfxBoGO3MxLwhsjQUxS028ukkR30rfKEoD/bH4sV04Gh6ai8?=
 =?us-ascii?Q?YrVuhjSe2WiJfhK2DzIu4Ocd1Jb6Bn8yYFdC/T7eteRIqt+d3MYVq84toAsk?=
 =?us-ascii?Q?0WCFoP41HU0wuu3D3PkMoC1+dOK9JwDU2oICJrQ+au6eWgUZkhuEfpFHL8I+?=
 =?us-ascii?Q?DbY8uraG7LZYvmNEjYjtvjPFODV7vBVVwXiUE6dBHqInyLYRzd6DghEwESxl?=
 =?us-ascii?Q?Bc9/OLXCsw+cFVnixN4+3IYsMYBllhkKhy6rR8QL1lzC230xyDZODo+wUSJi?=
 =?us-ascii?Q?exw1QdVTy1YyDWlTU7n6VehBfqaVggLdIRXjfwk+KS/nsIlo7rVLiO00hH6v?=
 =?us-ascii?Q?hbbZriYwzLz5Vupxeps7A5PYbU/g5xczqXvHGTiy68oZLwFF9Kpb6XblGjDf?=
 =?us-ascii?Q?s7C6wvvuylQ13Wjgip7gmy/58NHk83ZIm0fm7icHcsMlVtu4fVuCF7ZkbpoS?=
 =?us-ascii?Q?U+bIXcgFSLAVKLC3B1P6DyHm8di6aaR/Nc0Sgo3KaWIgwpwBEZA2FO/w5ow0?=
 =?us-ascii?Q?UiSKtJuLRyjnH0k9jDqDx87pvl5ilkphCvZP8WkufRlr+KQnmU98C9h53YAm?=
 =?us-ascii?Q?qy5LWhrEcXMYH07OAz9KWA7n4CeGNETcWBy5HsomPeChMQB1IK28eaxIQOiU?=
 =?us-ascii?Q?SCJFJpq8qonafAauKqzT35HO6cGZaTZ1+43Wz4ojPDTYBYmVV/+jpV4qQ75y?=
 =?us-ascii?Q?qTQkLpe0VtjtQRoHIbnY6qgTbPH8SSZm8Ls0iDUZStAjhmoVNC3mbMmxuEP4?=
 =?us-ascii?Q?mS0UdNCcfSSMmQnFTjYio1GARfWEif0gRjRPaJcqq9LK8nvvurO8TQj9JZ5o?=
 =?us-ascii?Q?Oep6tQ9whIhgLyXiEO+QpwWnTlgnb7ZKRezLrrU0xW35J8xLeAYKv1/M1k6R?=
 =?us-ascii?Q?e+g/bxhbi4WUn5jGjdIIMh7slxvoBTOK1c2YcrB7Ijr3+Kkcx5bwbiLbV9ZZ?=
 =?us-ascii?Q?fj4c8Ur0DcD2ceUGoao0QdfhQZ2piEsTrIerHJkT2m5iPqeZS9CFHXmjr4zi?=
 =?us-ascii?Q?u/NNonln0scGyu3NWterHood0sfaHtokYMuBES6YBcd8k0qclsD4O6oO5Bid?=
 =?us-ascii?Q?y0ZGQEWkSjD4RP2zfqTyOxaURiaGz/yajgiJh4oS4A6ndo45Y4ld/w9zqV9s?=
 =?us-ascii?Q?w2CxmQQPe0mwXwgl3arh7i1VJ5zo4c9CBvaCsSSKgxrc9rtOYnM7EVt1kckg?=
 =?us-ascii?Q?U7Jb0Ha0GybKxJC05go3dII21moQO3KgRPPD4jmDW021n19uKmNxA1+Bm/FW?=
 =?us-ascii?Q?xdg4EEFg/oAXQ1dWcbGmj6Yxo7ZTT/cMWGCY9pB+F6Gz2YrMWP4XQbkfpOLe?=
 =?us-ascii?Q?B1p71MzI3sZibbDZiuzdKHldLrtjIUBzZEg2uK+de0bPDb3nwimY7pymhS21?=
 =?us-ascii?Q?yM+TmFXSmVsVrKT+3IPDSipYdC6WvM1bmSeagR7182UDAKDGRPFPSJYYar95?=
 =?us-ascii?Q?AIcMM7NBf0xsZPtRQFW1kLKyO0Msxy0q8Lw6NgOwLABJjHZ8uEU000cSrEpC?=
 =?us-ascii?Q?s0Pce9VCXyJN39HtpjEmEBMoi1q5Vcj/GNduhLywP3YS1oTViPgIbLeEqYa/?=
 =?us-ascii?Q?6RUI/JDpzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: NM90+VNtvNTDS4WnU7lhSDp7OxtPn2DjpTH9Z0p3Tsvyq+z4xlUkTIaYBBpsXf5IMTLykIG+ti23Xopv/8dxrwWmP6Se4cBgUafegTUO4FegXJ8pxPF/xlR2yRv+cjKoV/2r0EoqXUPnf4Y25P0olqn7eT7fev+kLyeBp9Fy24yqTFilE84pZjn6tr7xabJDHEsCFyCps0yXwco+G+y9dtS5AFg1K6FFYNRGNZn4ebX/p4XeyOAPQjBM4qTWFaRgih6GjAA9omRA4Ud2YNu8GTY3UZ2JD/nlmF8B6swpxsYIRaxze05enO8fANChbVu3uRvYYeYAqiIT3GOLA90CRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db9acf5-977e-4750-0d32-08df4c95f85b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:51:51.5019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/nrAkul4+dYJeWUPJGUrHwfzvNGtIW0qdtxShtViGv5KHA3zKLOlrej99yz2HAzTmq+JibqAEz19cfmgSg3DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDC3198517
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

Tejas Upadhyay <tejas.upadhyay@intel.com> writes:

> Wa_14028564128 requires all 2-way coherent PAT entries to be programmed

I would add ", except for PTA modes, " here.

> as non-promotable 1-way coherent entries with L3:UC. It applies to all
> steppings of graphics version 35.10.
>
> On Xe3p LPG this affects PAT indices 2, 7, 23, 27 and 31.
>
> V3:
> - Apply Wa_14028564128 before Wa_14026539277 and document the ordering
> - Drop xe_pat_wa_14028564128_safe_userptr_index()
>
> V2:
> - Add missing pat indexes to no_promote as asked by WA
>
> Co-authored-by: Nitin Gote <nitin.r.gote@intel.com>

Based on Documentation/process/submitting-patches.rst, I believe the
standard trailer for co-authorship is "Co-developed-by" and it also
requires a "Signed-off-by" by the same co-author.

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

With the above fixed,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

I can apply those changes in the commit message when applying this patch
(after checking CI) if you and Nitin are okay with that.

--
Gustavo Sousa

> ---
>  drivers/gpu/drm/xe/xe_pat.c        | 29 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 5938fef22579..29062672bf2d 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -337,6 +337,11 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
>  		}
>  	}
>  
> +	/* Wa_14028564128 also sets NO_PROMOTE, so MOCS can't promote these */
> +	for_each_gt(gt, xe, id)
> +		if (XE_GT_WA(gt, 14028564128))
> +			return false;
> +
>  	/*
>  	 * Disallow 2-way coherency for any L3 cache policy because
>  	 * XE_L3_POLICY_UC could still be promoted to a cached policy
> @@ -358,6 +363,19 @@ static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
>  	return value;
>  }
>  
> +static u32 wa_14028564128_fixup_pat_value(struct xe_gt *gt, u32 value)
> +{
> +	if (XE_GT_WA(gt, 14028564128) &&
> +	    REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
> +		value &= ~(XE2_L3_POLICY | XE2_COH_MODE);
> +		value |= XE2_NO_PROMOTE |
> +			 REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
> +			 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
> +	}
> +
> +	return value;
> +}
> +
>  static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -418,7 +436,15 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>  
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
> -		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
> +		u32 pat = table[i].value;
> +
> +		/*
> +		 * Both WAs only act on 2-way coherent entries and turn them
> +		 * 1-way, so whichever runs first disables the other. Wa_14028564128
> +		 * is a superset of Wa_14026539277 and must be applied first.
> +		 */
> +		pat = wa_14028564128_fixup_pat_value(gt, pat);
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
>  
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>  	}
> @@ -809,6 +835,7 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	for (u32 i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe->pat.table[i].value;
>  
> +		pat = wa_14028564128_fixup_pat_value(gt, pat);
>  		pat = wa_14026539277_fixup_pat_value(gt, pat);
>  
>  		if (GRAPHICS_VER(xe) >= 20) {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 03b713f55dfb..908091dd72ab 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -74,6 +74,7 @@
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
>  14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
> +14028564128	GRAPHICS_VERSION(3510)
>  14027054324	GRAPHICS_VERSION(3511)
>  14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
>  		MEDIA_VERSION_RANGE(1301, 3503)
> -- 
> 2.52.0
