Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F21C3600C
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3910E140;
	Mon, 31 Mar 2025 15:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJJFDnH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30BE10E140
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743436550; x=1774972550;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QyTXAjJH5gb1IRU0kMYzbRgpF2tOAobRO7/kb8FCuiY=;
 b=SJJFDnH+IeE1kkxrISN8VPwyq/rpkZFYXwyqzkWGt5/KbX41KDCtwkCq
 517lcuXazUO+fiGvGTEi97Jg1rppP4bfmoaW+aYNFtWgBeHGD54j+N+Qa
 LlPGGu+Ov09Rw5rx637TcZQEsXlMDwpuuJkboVnlfmfnktEaRc3jeMTrh
 Kbr2qOoOmnjntnJzQ+hcF/hWObSXPS+q8WtxYmwP9gWvZDzA+IBsWdOSu
 KhdKdxvzqUWZGFjHBwtR8LVUjfYEcRiDH0CByAiOlQF59ze7Kziw/qIKF
 /iEhDnPKj0YKTXiBLzfBkoz+ydqJDazXxJbbTaTCjafssTRv9qbf0zBKA w==;
X-CSE-ConnectionGUID: Qu/GgVUmTkKrIAm8U/WAOg==
X-CSE-MsgGUID: 0aL/eEtbRKWwPHfAj5+nDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43980691"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="43980691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:55:49 -0700
X-CSE-ConnectionGUID: rrpEcGTQS8+diKSmlfiQiw==
X-CSE-MsgGUID: S/IlupdcTh+9sQNAwFvsBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131340236"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:55:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 08:55:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 08:55:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 08:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQLhcCnHwJx+h1ZHgbf7Wt9BIxRoTKZZFYCUL4NRNmKn/vipS/bpejZjTfJDiuVZsamp5Im3FaTjI3HQjcTeXcfvL73wukzr5Tbjn55u+/7xxndJQvdy/YN389FZabLTu8NAnr0BteeMuIVwD5qWXB8gvYhwBN4GvfUpMuI3l5VnT6oio40qx1jdsdgjtete2Vi3fqTmwWdnckpKwQh43SkWlYgeqULucN7/enL+pvjNYBvYsMeKsayCMDALsqkrotlCFgge5avs6I83UzmyPyvY2sDaF4gqy6ZIaY9yIP1MWgaeCsilFra7G+eo6qHXwbbg7TQdMDnhHAujZ1c5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1mjp7+3NGMiqkJQAIVpYTpJPvkDIeI0KfCBgbLBsfE=;
 b=Yz+EB+p3PAnxZYOxVD/mr8+uL5oGCqRFMhiD6wIafTrqfD2+nf/OqJRpCuvxe34Pb5atgOqOkHH095sAmmBhmlMazhbGKmicBpUckuxKbz+HjyGjkndATVK+B24HtPtpnrUIW7WM1dwL+w0cQQUbYAj9dEqly/FelTFT/uH+Fm6/2blGoUNn8fGSS4P9/Q4RUnBpPd1knXdXjnGMeyIEyV6PtAlS/qWJiNEHodoOkRA7gyNsL8d0iMUeCBRtnFYiIJ4TwJCVoKTLFqf7Cj3R57lTyxAwsoVMNt/maw+RQRIouLcTmDNbt40JXMqWucbxErExRWmnjfzE4BDslAsp7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 15:55:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 15:55:45 +0000
Date: Mon, 31 Mar 2025 10:55:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 5/5] drm/xe: Make the PT code handle placement per PTE
 rather than per vma / range
Message-ID: <x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <20250326080551.40201-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326080551.40201-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: d00c0e23-caa8-44fe-f616-08dd706c7f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?s6VZvnm0CPx7pELWcwcnZ8J70czgNWqAQGfYD9dwQz/fJwI0yTyGVSe+0M?=
 =?iso-8859-1?Q?eFiNm17A1MDd4lh7WBqioTn6wuH3YcvWkhrj1uC8KyoYm0xgH8OAULPVk7?=
 =?iso-8859-1?Q?dYfOutBQPqaJzTNOJ0KcAcMMH9HrHAOBMYew/ANzOFL2+flYUONn3fZBVU?=
 =?iso-8859-1?Q?1cJEKrQw8q+UZuuufGTwuZdEGiOWCyv9+WIr6BAj84m6gDEsgVYodRAIgX?=
 =?iso-8859-1?Q?jXj86W5MChNSA/PL4nsrqkBZkOuZbDY5mjZMueQLKpai5d6rsU8RzS4fiE?=
 =?iso-8859-1?Q?N6LYyUqgSZBKWHw+g1pIvHa5tgMQ8UI0c010a30LFALHDSc7iOQCefAHkS?=
 =?iso-8859-1?Q?BIx9I6VoEzhWqn9zLbYJPKJweyKxMko4+LDPizWHKligLyfpwYZTstbIho?=
 =?iso-8859-1?Q?XZYEbDXIKudtzW0mTZsp+Oh/PAj+kudc2JMw1wl9N5L9EL7kV1GujRZWNr?=
 =?iso-8859-1?Q?iNTe7rjb4xXAIqbae+lT3/4e79h0qsxVn49tDl/CMFD7P7n38yFOU8gxWT?=
 =?iso-8859-1?Q?cEp74zQxgphqrlDSrPZoynBicVcC8ZasXQI4wTSmo/09BQQwrBzO8K2FGk?=
 =?iso-8859-1?Q?9Gij8ddIFZkPEZq4ogfPyWTefxdPtXO4XsQ71bsMclpJXzOWIbGUgJfj55?=
 =?iso-8859-1?Q?oXbfOFamq8gPyAJQ+UwiLp89bMN9k48ijRJj2RyNTrp4PED10fR+vZVUZy?=
 =?iso-8859-1?Q?CH0LlZZ3XnX0RlZtFRTAca70xr7ybhWcuO+wQ/Tq9kxk9nDwcIxIilyMDr?=
 =?iso-8859-1?Q?rismjWaouCeaGx84G6FPmc2kXeLEYde6oiZREubwSwAfP11agIEf8rBKQW?=
 =?iso-8859-1?Q?2gObFomX1NDWdOQtYjfQOM2oFU0VyYF7vHK1k94pHvaXrSgAcxD23emqI3?=
 =?iso-8859-1?Q?xBtWexIQD+fseHxLD8gjQxKZSr+GI5yChYlCxVoS1jtKWi2or993F4Gy2g?=
 =?iso-8859-1?Q?A+GCIAbfd7+Ox0SbOaKoVDrOHfnnHf21WZPCoWredkk6xzdctT7i2QcZfl?=
 =?iso-8859-1?Q?ro1jJWdd8lqpTnj203gfkilhwvrRZJF6pXyGXPiFxZw3t/LnH8ns6i0TW/?=
 =?iso-8859-1?Q?ZOc4YO5OBDLcpibDFto16AiHZwxdqnK0MhTxkap1UaOecpPPgjNmqi7inQ?=
 =?iso-8859-1?Q?IRDgr8nbYmDShbH5tMQ3oLXPXQUAEdomUQJCcSiFWkZ344aTuuhIDM5oba?=
 =?iso-8859-1?Q?6256z4SdLwm8ZfMPNYL+UZ7+w63KbIOqveBMv4Fr+1o2ySe8/f9sFkSh37?=
 =?iso-8859-1?Q?ZajVYy2mbKMmoQSmK7rSocIZpAPv6IoR7tHkEihl7kDwFPxpBYWpYy/6Z0?=
 =?iso-8859-1?Q?/qlMMqrkqwNITnnqsvPgkRAo11KoPU6PoD5+74Xbml+s+6NIZc7AXQ1kpl?=
 =?iso-8859-1?Q?zPddgJeZgNJXCvRrtBOGd4BORNne2vdyNp/iJgYp1KLwk9suyeUe1nEju9?=
 =?iso-8859-1?Q?MH5yKCzrKoZJAM/V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ppK8G8dIDPZIxiIy3Syq7TW/OTUx1nS05vfRtBBB0DehiVEWSx6XIfNVgA?=
 =?iso-8859-1?Q?BqOa4pVfQ8lc2EfRJOwgg3J4bIQzsUg+mPZw/2D58mWWuGKxCj/h5isdCl?=
 =?iso-8859-1?Q?o4ZbZeIEe/flFLbs1u0AGTFFffg16z8CfNW9rECG0ncaKqR1oK0w8JqplZ?=
 =?iso-8859-1?Q?COrV4EGQZ9PwAMcHoVTGHLv4tWtC17NLGdho6zTvYqmnjiSz1OviqfFPcw?=
 =?iso-8859-1?Q?dhbcWOH9cg5rFhfCM70yjHmKtJ3V59ZdjMaVB29LT64xV0MdF0eS+0C5Te?=
 =?iso-8859-1?Q?BTimnilALvvUBPTH0AAJhFZz5JiJzv3dI5iPod7+YlaENQ88w/qTeX07e5?=
 =?iso-8859-1?Q?2c/CbgglxwOHml0OlG0npu/hLHVdLPH2uecV45Zg+H6QIXAfLZq9K67g+K?=
 =?iso-8859-1?Q?MQEWjbDrEh2YUbFYc07nJRa5eBHcyhm+JCTLcw5XivkA1ZReha8eHfUwqe?=
 =?iso-8859-1?Q?211rtNbRD0RzszrC3k3mfDTmZJkvEoycbt1V6WV0EfjUrSor77uf69br5p?=
 =?iso-8859-1?Q?M1xUlfPlIntuKT8oQitXg3iutfchp/cHUfEoJTQLZbdahc4ZY5QhWZz32o?=
 =?iso-8859-1?Q?ikHY/d/kB+Bil5u1zsKgZwgWEFmy1ctYIV6EECcRIzPnEYEA8HGsy+IgkK?=
 =?iso-8859-1?Q?sFCkGz2VRJxdCSJ35CriCr/g+i2xep+l6sqHsJuFbY7a2+rZ+Y0CARY+AV?=
 =?iso-8859-1?Q?3x7o3m+pjDmjMSojz8mfIHEwwVOtKw9zSuiMImUCCrxhkM2DAsg+nAk1I6?=
 =?iso-8859-1?Q?plKyiceSuSpFt2FmXEh6vyuLYi2DuwGhA7QQ5/s0X4GEHH/O2XxL0uilD5?=
 =?iso-8859-1?Q?h80qBjlwscCch6ihkZb738wiUPVd5Y/dA9xcsqleWkPkc6guEXKy7LP/V4?=
 =?iso-8859-1?Q?nSf/qzFhUeNmrDgeRknSPPA55uaGfLHe+1JvBNal3iDDpFqprEmpteNB50?=
 =?iso-8859-1?Q?EzmRQyL5ehnRlkB/LFbex/sHnzPsQ3yKDE3pEUCqOgLObtUoqe9SvI0f2u?=
 =?iso-8859-1?Q?eAx2QU2INNkHWkYel3sJhovOUfNbsipdqvgLc003NLWeuhLC+Z+GBKdPZw?=
 =?iso-8859-1?Q?czfgUOrP/sXQ6j0HyHnw22e9ghRA7ETkzef4s0cHfWG3yBVgUrtbu5oxkf?=
 =?iso-8859-1?Q?Q8obbGgg/EfHd2RCUio4dapgi07r30RJUmVRhBKOyIKOLxJMEFPclttyTC?=
 =?iso-8859-1?Q?DhQgrodbNEGM6SH2uNdIF0u1aE/oJVazluB2UssHdUJ9lWJeWhnrpXggSc?=
 =?iso-8859-1?Q?bpKwklGMB7y8fJ7IzLbfRVX7mzliQ5/cm00X9DeqBOyGQgZJHtzpkhroo8?=
 =?iso-8859-1?Q?j6dYIlS6UlVWSPKPFd9UE4bWDYQ6VhBYYulxMKne7IMBSAJygpD6DkqkxD?=
 =?iso-8859-1?Q?gj28FuxWZOHqV0a+Eo8FE7ote+hDu82dCVvMl88C7fuv78V0EhMg0rm/ay?=
 =?iso-8859-1?Q?IwSR4IpWtpHjhbanXzk1XTKop+QAKJW8pVj79EPB3DU7u/5BMefeOjvmRg?=
 =?iso-8859-1?Q?mbjJOxGO8hyN/Vb7i4eM4+fvWVM3Af9ryh00gECgbfmioyUhE5p+OMwXV1?=
 =?iso-8859-1?Q?6FN0A6qcdH91EiBbe9cMpABWBWsgV+fFbmz4EX7gjx8JL06R7dAqXHngZO?=
 =?iso-8859-1?Q?a1ehAeVDjniy3q6gsVMj6C3Hym7Ok0E6KnzNp0ABxZ+rk8bans2Krbqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d00c0e23-caa8-44fe-f616-08dd706c7f29
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:55:45.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUaBEhf691D08AV/mn0vjKi4AgKR4zwG08vPX0RME7bIUuJ7pw2PhlpT4mnlRHZ4bp2TfvqaYQzy211a8iWvYkcd1IN826KZTF03TzL/aYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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

On Wed, Mar 26, 2025 at 09:05:51AM +0100, Thomas Hellström wrote:
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 9e719535a3bb..82ae159feed1 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
> 	struct xe_vm *vm;
> 	/** @tile: The tile we're building for. */
> 	struct xe_tile *tile;
>-	/** @default_pte: PTE flag only template. No address is associated */
>-	u64 default_pte;
>+	/** @default_pte: PTE flag only template for VRAM. No address is associated */

		     ^
>+	u64 default_vram_pte;

		    ^

doc is wrong here. This would fix that for this patch:

// diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
// index 82ae159feed12..91ad347c8c7bf 100644
// --- a/drivers/gpu/drm/xe/xe_pt.c
// +++ b/drivers/gpu/drm/xe/xe_pt.c
// @@ -278,9 +278,9 @@ struct xe_pt_stage_bind_walk {
//         struct xe_vm *vm;
//         /** @tile: The tile we're building for. */
//         struct xe_tile *tile;
// -       /** @default_pte: PTE flag only template for VRAM. No address is associated */
// +       /** @default_vram_pte: PTE flag only template for VRAM. No address is associated */
//         u64 default_vram_pte;
// -       /** @default_pte: PTE flag only template for VRAM. No address is associated */
// +       /** @default_system_pte: PTE flag only template for system. No address is associated */
//         u64 default_system_pte;
//         /** @dma_offset: DMA offset to add to the PTE. */
//         u64 dma_offset;


However I was surprised that we didn't get any error in our CI.Hooks.


It looks like this entire struct is not in our docs at all:
https://docs.kernel.org/gpu/xe/xe_mm.html#pagetable-building

Should we add a

/**
  * struct xe_pt_stage_bind_walk - ...
  */

so it's visible? Or if it's internal detail from
drivers/gpu/drm/xe/xe_pt.c maybe we could drop the kernel-doc, leaving
them as "/*" comments instead?

Lucas De Marchi
