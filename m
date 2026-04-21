Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B19F327D4
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 17:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B210E854;
	Tue, 21 Apr 2026 17:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ywap5BCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74AF10E25E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776792496; x=1808328496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CD1X6IdLV1VQISLT/fV08Rg/eB8+AZDmW6PzhAlAlbw=;
 b=Ywap5BCDgK90kPfG2NmtSEqyXYXU+tCjuZ2ujrKm8uFDMdcylW7C33lD
 3ll9EBIefd43Vnj43yRri6Q1BGoolnETKSghvVzK4Wm+iNiecCJsnifb1
 YopMK90je+ld/RuoSnZKhADYfApYS6JyWC0g65NzDVe13ch56ca47dIOM
 rc25j3QzfO+Xl94zEiM1aYiBjRNIpn19O9uVBPZplr0966dNy72n0StY5
 bTTAJ+GYjofbCcEgyo2Iu60o1BkWbOVbNkHAKGUH7jvXON+aklHCTogNW
 bj1eXthy/rz5RgxFAjgHjq9GxOglJmhHP7x1z6rzOyvwi+DJKemF4ghPH Q==;
X-CSE-ConnectionGUID: +J6iaLKnR7Sq3va8LXkrmA==
X-CSE-MsgGUID: wpobKcEET7KBt3hA0l87iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77748943"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="77748943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 10:28:15 -0700
X-CSE-ConnectionGUID: o2plRDvoQ8a0S+RAqTHvCA==
X-CSE-MsgGUID: dmj8wXZQQqCjGfvd9RqALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="225595189"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 10:28:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:28:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 10:28:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoVPgHwwsAo0G2lp6EbP4ta8jgV9dOUGCn6aSVLp8tPN/wBtMuNQ1NqCfEvnxzLst0hN6hPiofXomX+7tyEwVY6ozCKNoWuGY2DFNhparAeuA277t2szkAHWx4xE7udf02L1hzpfBi6nK2ToC+Tep5/MVcQdG8LAAVSnii6qINTc3uv5R50g7ajYcTEKHweKt8QB/KMn7M9ycYKTDyaN4sDAhQqfCRjHIjbczBTryZ8BrO3Q40vO+5khWD+NJZ3eZq5moCA9RpotRDaibkdUEbszE8Llrp1fHs/woKT5NajqRbzUQgdra2ZzRJjUU4ILUBjy7rYjM6Xk13apxcGVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWnuUAt4uqHEP0n3dtssgrPvQLCqv5wTPiIWXBsubb0=;
 b=QBcu4Bqafq27g+xqYdCJ0a2GcM8O5N+oEvwrDZZzjTn2SZkdYZXFaQnt/oJG8tLgzITci0Uva7GDV8fm7rp9xNdPQHBmTmbUh8vzRUcugOnWK4jmx1ll2Lzp4KEKX5kWIIvE8wKuk1/Oe13gQ9Zlv1uwLFiInIGbpw709+wfNPGdjr2DQuIxSkFzqK1o0b5oTsj1jxdEdS+K43dlHF1muyHHedQ4Jo8CgPogD86cU6XaGrAJx3HIo65vTlMmrCPE/etvb/Rukm9Ag0+IuhA5q6e70GBT5+hgREb+70YimCtXUgh1wVd1BwAM5WXvGGq0oexRy46dIR1gaqubzIGYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 17:28:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 17:28:09 +0000
Date: Tue, 21 Apr 2026 10:28:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xelp: Fix Wa_18022495364 (rev2)
Message-ID: <20260421172807.GB2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260420131603.70357-1-tvrtko.ursulin@igalia.com>
 <177674297092.480083.8805593455064906702@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177674297092.480083.8805593455064906702@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: d162faaf-1e09-4a2d-3578-08de9fcb5b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: iaQgupLnhHIaokXn308QlXRpYukwXQobGl0XxL1L2A/Wrdcn3KJ2+ELinpyj1y3W3foQrtkVCQUTi2tcK199xFGA/nN60G14Ze1E+OFp1JhRtsM0uOJ5RZIynf+7pJUe49JPa3TAq+bUnLy5O1KaGw4NacAkeDgJ2U5tiPFRbCu4wkQauprIawXOJcoK0fur/2zYsFQpZZkQ5agvndOu5ahhyR5mxNePY46wOdkXleQaSpQdN4aa7e035yVvcnN5+dXBewnRg+Fa0Qy4t4ijL2UnuxGSY4CRgwDwsBzmkM2x1etO2/ZypplVhhxgDgSjWnk/nJDm5JqnBPIqYp9I8IONLnN2NwAVzKvq3jSLDz05jkVfILqKcp4S0o2t1r3ktHq8vT9V0ImhowWnIgiiCL7OZWkMLYxKRsiEbZdYqhtB/gztReP81nX971oSyhjX1HbaZL4nj/u7C+y6Ac51H8L+k+E/FjcgPK+q64Vy/vI7DaN+93TODmzJO4VKK93iGpp8AGNZhnzwI5LvQUMbGTlzsM5hASN9Z+vIWhf61MM9uvO2aJWYA6/WUiS3ucakWXCanrwI62wz0pmDM1kuXEtov6j4n5FopvJudW9BImMRI4E8SugskOczZA1pVN1NegXJ/AWPmAAoPSmhZXS+HotdIE9Ktepfp4tQSAYK2ViA+Ei/eYVx9vyL2CxQ+wVX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dJyv3Cqi3LJ/stT4x7VB8ywz6PWECgcGvBN3XA8HnNfpBG+4w1rTCoKArTLw?=
 =?us-ascii?Q?LdXb2mlRBDS8OxZ/X3FxCfGdnN1iADoTuvk8EUFvOzXHWI+qXwiaLmScx32v?=
 =?us-ascii?Q?G3+Zn4nRm4+iFEEt6q8WzOZJa6iijMV2EZt5ENxRIRgt8P6BEt2828eqELZN?=
 =?us-ascii?Q?lFpUpblntrmo14li2alH5QohWilDp3Q5jnKR2Vsq9NHK+9fJGbdVzS40GBjT?=
 =?us-ascii?Q?k6sNeeZfD3CxreJjijIVdATuI1HKBxvrsSkRbgDM64U1XyHkUNdJs+oQrrSm?=
 =?us-ascii?Q?dpRUItjqhO5qfJkpcXymVUjvlbrJX7jSGeU/LCWPxPmnfZSQ5oIoKFu/QX8W?=
 =?us-ascii?Q?ptm0oGgBlFWyxg5uaBZS8CedMioMv11xfzJvKNiZKxMcZ16X0AZAeYm1rpMo?=
 =?us-ascii?Q?DN0nrVs+DT4ncbtzoS6OTF56lexEhX1pZEI3C2NpCVAamoDl1/ITJyZ/K0IK?=
 =?us-ascii?Q?Fmof3A83Sh0Qb86ESQyJGXvGqeniwkgcNhUZmnkoD1RaNxBiKKebLM8xSl0/?=
 =?us-ascii?Q?eaO1WsN+CY2a8koWVbZmqbiS0cR+AWd8xixQ9T3qj2QWsKZtWTLgMeJvfD6o?=
 =?us-ascii?Q?uV2QBmqIbfJuCeeVx4JFbU6w9LJL16exn00nUrm8N6d5sSt96+vNRvK8+lfn?=
 =?us-ascii?Q?T82VoHnhAbqtA4TCINcYJBUZP0+xAi8rKPVKzkj80PwNYCmMxjGXVvvdWGJ9?=
 =?us-ascii?Q?ugGP3XBeWgJSoDAIChBj6keB2PWBC9kUqydT8+D6L+P90JzRvtqqDjDsyxPH?=
 =?us-ascii?Q?UYdDtm/hK48+/SimCmDMiiERAHtKKDL/QVzLhHE694PGT7JgOvj20/z13ZnL?=
 =?us-ascii?Q?+DLGQpS5pnHlAKLXAZasPBPtnXvxlJh9QT5grazJN8OjP1ArCDqwwrohI8Rf?=
 =?us-ascii?Q?0sEK9L+OlxgA2W1syyu4fQNIF1+IOgAaoOOLISAWhoq7f5jhv4QZL5i5GSu5?=
 =?us-ascii?Q?bMaSun2hANImkUL5aS6QfNJOW4TiAVKJc/OFPdiq9xCbr1+9TJ0P625NHbD1?=
 =?us-ascii?Q?MngXTpiZLb4CUd8/JzKJH8fbg2J+E53abfObqc2N29vpdjjkWrd8VzxL/IA0?=
 =?us-ascii?Q?A3R5Z86KVFw/R8XOns6VUmNnJD+3xBVGWI5pYAUEUD0FuVVKAV/SRrUDoxPN?=
 =?us-ascii?Q?1QxLOURLl/nSNtsWV8aenz0MmH6GhTgShk8Z4rV6l2/mdPsW03DEE4GXw2EZ?=
 =?us-ascii?Q?oF084gk3eMtsW22RxTgUgIZk/RxTDTXTDZzLciVV0wjDrRH9RnQg5VVb3sVl?=
 =?us-ascii?Q?RDv/IFQWWJv3t1NhDjGoTXeXTxcGkZe0/aC+h+JN5EEb3r+JOUEYab+Xq8lV?=
 =?us-ascii?Q?FUqbOiEg5gGPBlozfTn07FTLvHrMGaD68S9DH3Q2WMa//BlDxcJHAxH0QyUp?=
 =?us-ascii?Q?TFuPk7QUY99EvdpfsUx4+LLXCDOpHRPBxOsXpdv6ZAspGnrJ+VT6FeIc7wsF?=
 =?us-ascii?Q?RDv+bSYGrh1hkDFVozYIczNZ4w6cFuzkg9zpfV6QawL0zQ4rsLVpBWz1PaYj?=
 =?us-ascii?Q?QtiKEQOC42XUPl7oR5a7WD6102q9zs/V9/xnRLjfvJkucCA32TNFJUjMTfcE?=
 =?us-ascii?Q?Dm8sEMkAZkPblZjHB+4VwO8pb6Y36lIHog5AE3R3fnBVuwDNsWVqOGfneeQ8?=
 =?us-ascii?Q?rdPNj9f3Abhqzh0ZSVW9NpPoFsAjKDbJS735uFe9mt+DD2Jy8bnzPR1olx2V?=
 =?us-ascii?Q?4PUsWBmC98GZ3k3dslWdUMa8qA7zFIRc60u3SOjKBlB3ytNAmsn9VUkMjKJs?=
 =?us-ascii?Q?J1T+THNl6jYCXTe+hojNqrI6ECfir+o=3D?=
X-Exchange-RoutingPolicyChecked: Bp2p/NsW0mFmrLo0UCdhdxi0f0EJt0skzlsHiz+Dbb/KGktzknid5oRO3OJ+3knODmPnVv7d+2/Nm4ZQTcLHERb2COwBzC8Kc2MQBodzSxJ0HwYh7r++QRlWgCTxRe6OBSaJAjxqH+gQYf2f89Lpx4yY8PVQ74gcJSjpjBhf5xcSU6lAbdztL0xv6uodERbcp2KrS9dgWVxwE0NyAif6C6ap/ev8u87/JFjFIEgueQWWB1+KFzflX+Y4bz04oZgV9EAOfCVsAEVpukd9ZoEUoX91a8ddT2mvxuyrNhSjOTe3smG5mUtNIR+DKqbnX34zJyaIhKmi3QBzBvYLyiNvxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d162faaf-1e09-4a2d-3578-08de9fcb5b7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 17:28:09.6684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZWFeVKiXxcnXFrBCTe0XlPUZJainVbjRfiru75/XY/ItIzYFk5I/gTTTcY3smmZRCg1F7P5lHEMLv97Qh0ClsCEBVTp8WKK0bDAAJEBB4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

On Tue, Apr 21, 2026 at 03:42:50AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xelp: Fix Wa_18022495364 (rev2)
> URL   : https://patchwork.freedesktop.org/series/160185/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201_FULL -> xe-pw-160185v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-160185v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-160185v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-160185v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-9/igt@kms_flip_tiling@flip-change-tiling.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-rc-ccs-to-linear:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +39 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-rc-ccs-to-linear.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-rc-ccs-to-linear.html

These two are both GT timeouts on BMG; this old gen12 workaround doesn't
impact BMG behavior, so the failures are unrelated.

> 
>   * igt@kms_sequence@queue-idle@pipe-c-dp-2:
>     - shard-bmg:          [PASS][5] -> [FAIL][6] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@kms_sequence@queue-idle@pipe-c-dp-2.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-3/igt@kms_sequence@queue-idle@pipe-c-dp-2.html

This one is a display vblank sequence failure (off by one).  Not related
to the GT or to a platform this workaround would impact, so this is also
unrelated.


Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-160185v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +7 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#5354])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-1/igt@kms_vrr@flipline.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-lnl-4/igt@kms_vrr@flipline.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [DMESG-FAIL][12] ([Intel XE#5545]) -> [PASS][13] +1 other test pass
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][14] ([Intel XE#2142]) -> [PASS][15] +1 other test pass
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][16] ([Intel XE#6321]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [FAIL][18] ([Intel XE#5625]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:
>     - shard-bmg:          [SKIP][20] ([Intel XE#6703]) -> [PASS][21] +89 other tests pass
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-bmg:          [SKIP][22] ([Intel XE#6703]) -> [SKIP][23] ([Intel XE#1124])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [SKIP][24] ([Intel XE#6703]) -> [SKIP][25] ([Intel XE#367] / [Intel XE#7354])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][26] ([Intel XE#6703]) -> [SKIP][27] ([Intel XE#2652])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - shard-bmg:          [SKIP][28] ([Intel XE#6703]) -> [SKIP][29] ([Intel XE#2887]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>     - shard-bmg:          [SKIP][30] ([Intel XE#6703]) -> [SKIP][31] ([Intel XE#2252])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-bmg:          [SKIP][32] ([Intel XE#6703]) -> [SKIP][33] ([Intel XE#2320])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_cursor_crc@cursor-random-max-size.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-bmg:          [SKIP][34] ([Intel XE#6703]) -> [SKIP][35] ([Intel XE#6126] / [Intel XE#776])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          [SKIP][36] ([Intel XE#6703]) -> [SKIP][37] ([Intel XE#4141]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][38] ([Intel XE#2311]) -> [SKIP][39] ([Intel XE#2312])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][40] ([Intel XE#6703]) -> [SKIP][41] ([Intel XE#2311]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][42] ([Intel XE#6703]) -> [SKIP][43] ([Intel XE#2313]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][44] ([Intel XE#2312]) -> [SKIP][45] ([Intel XE#2313])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][46] ([Intel XE#3544]) -> [SKIP][47] ([Intel XE#3374] / [Intel XE#3544])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          [SKIP][48] ([Intel XE#6703]) -> [SKIP][49] ([Intel XE#4090] / [Intel XE#7443])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-bmg:          [SKIP][50] ([Intel XE#6703]) -> [SKIP][51] ([Intel XE#7283])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          [SKIP][52] ([Intel XE#6703]) -> [SKIP][53] ([Intel XE#2499])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-bmg:          [SKIP][54] ([Intel XE#6703]) -> [SKIP][55] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_psr@psr-basic.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          [SKIP][56] ([Intel XE#6703]) -> [SKIP][57] ([Intel XE#1435])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          [SKIP][58] ([Intel XE#6703]) -> [SKIP][59] ([Intel XE#6503])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][60] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][61] ([Intel XE#2426] / [Intel XE#5848])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][62] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][63] ([Intel XE#2509] / [Intel XE#7437])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_eudebug@basic-exec-queues-enable:
>     - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#7636]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_eudebug@basic-exec-queues-enable.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_eudebug@basic-exec-queues-enable.html
> 
>   * igt@xe_evict@evict-small-multi-queue:
>     - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#7140])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_evict@evict-small-multi-queue.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
>     - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
>     - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#7136])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:
>     - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#6874]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
>     - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#7138])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201 -> xe-pw-160185v2
> 
>   IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201: da91cb4e6137507f74e4da41c39d0260b4cd1201
>   xe-pw-160185v2: 160185v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160185v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
