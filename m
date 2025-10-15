Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB8DCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE210E108;
	Wed, 15 Oct 2025 23:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hH4odYSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265210E108
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760570818; x=1792106818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bA9qVRFZnxAqf9EHf/AFAJ3qwhLP87wJAirisK6QenU=;
 b=hH4odYSuecd1Fx1dTJogYailgstcHQZpp3z4N/9sjjXSgV9zbywAN5A2
 yNXNAmTf2lBILSfRRyzfEsjbTfQ+LUNivJGbQ5RGnVfRAacb7R4P4h6No
 urQ0qkqzXIWmOlxubz0C+BjY/HVcf8Jdyaq3gntDFx6sXL5osEFwftNs2
 QmPel6F6uQI7LlCSpvMNVCeanqzw9WA35PJajF3p8+gdYgb3nbjIzcxIg
 DAO7xtjjFiN1s0HYOEM3Plux/h+WCdRjkWRcJ0ZqVAQgoioBRRfJ+JVGf
 YO1IeCbQ2tKDrPYf7Ng9OzTJhcAJX3pHNcTMhEXiN7xmvJK7/aIjZxsEx w==;
X-CSE-ConnectionGUID: uQ27YTOFR1S6MZPZZHbaZg==
X-CSE-MsgGUID: uCV/dizHT6iEKqH39Mq0pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62851811"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62851811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:26:57 -0700
X-CSE-ConnectionGUID: /nsJQBEISdu5ADvPfzdLpw==
X-CSE-MsgGUID: WczofVP2QAeRs5wFGc3ryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182286095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:26:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:26:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:26:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:26:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs/Lhas87z/5f1tfqWn7zPKnFrhdFGAtnFbY+IC8xlA39bv7tPkjl3bnFQ8fF9+4iG1Eb9ZLWZXxhBHPYTrjDkWQL1Cp60uLLjCoq/tS0RGzV3RHnnT8ed7aZiQDfZZ1YVVpqyoKgCFc3gs9DZg9pvtvUqy1V97QLYhx4cNqPRL1HhzOHhMAKctGBei4jYM7NosP7fC+oIvjDmNiB0FT6sWql/7e17tBn2eX7LhRKmpvOmcH/gsaSU+YxSuS9njkKgirwlvFmUd+cP7yvnWZymD/wBT8W1zzWPzWWTCSxLaHUcoxS296zyCnnfkJ6QIRi4rzjD5LYVQG0oLzfaXZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duBwoRrf4UzvLfDCobab5xse5GX2wS9g20jRICGjNTI=;
 b=tq5y1d0sdeZ0QMvtcann7HBkCJ2hOFZuMrzvw5po89/bzgCM7eZfE+rVcKwj5T+ldbW1VOr9DDULMhIUDhESp4A2Bjwc6HJYnoELAX6lv7qr9d1JHOGPGxjNzo56VOjqGZEXT5jT0E8r6nV9JB7CoxQUef/ROaUtRsmmoCZmKI5N28H5KPqDqZRZU45N1IjCpOfhNXubHs9Bv0vs2mlRW+Yv2RKFXqUEZunWmLamQsoxiF+fllJ08f/QVUyCUV+zrrkOo77R8+QihifRXs2WZBk3h+eDcJTFFaDwhj7j+msH+PpuDOFXEa78BwiqJoJUu0vEx7F9fWQ+52zvBhms6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:26:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:26:55 +0000
Date: Wed, 15 Oct 2025 16:26:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 03/22] drm/xe: Drop CTC_MODE register read
Message-ID: <20251015232652.GF5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-3-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-3-b9189b3056a2@intel.com>
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 784f67d3-49bb-4ea1-1746-08de0c42540a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EmGIFuUnm8qIChnbAKHDi+5Ul3cawYSU2t0LG1SDoYasH8mJgDzBjm/EIr1Z?=
 =?us-ascii?Q?4wx4R7kZos9KFXszGtMJexSgq/CNcqdf/x6VcqTpmt5929WdO8nVEjc4IMv+?=
 =?us-ascii?Q?BI4qq7ITY20z+xLfP0SgVZEYuqCDgE9b7RyCv0eAEMVttulyMJV4AF2qz7OL?=
 =?us-ascii?Q?qpzZxyXU/GCMpw0XD6C0GohqcTHR4UXV1v4bAhpcSVfrZetgjfHispgjdhJ8?=
 =?us-ascii?Q?L41l20qCWBHJDp6LZAZDTk8+pHxLEalIGhqBkUN15gzVIGQ4w9SA9IRQfRDQ?=
 =?us-ascii?Q?JxWDO7PfgUiA70YXh0dkbmB3G355yZNE9KLEcpWcgpJbTFyyfkhwfzplbU4C?=
 =?us-ascii?Q?icp8fAdX4DFfIB9lB5b+OPsT9GWjFoXvQKgjJkR7Ic+o+HusrYAI4r1wvAil?=
 =?us-ascii?Q?86xN+lKJcgoCfQ1fgxbcbPPfEqDt2rjDNIglZ0N9retfTFWmFNBY9suikdHz?=
 =?us-ascii?Q?soWUpi5/Lt6meLdNPlCYm+Cvm/CQnNE2DFFgYBxAj03w1lTomfd3mf+vRJrw?=
 =?us-ascii?Q?g+qatK3oIYIP0Wfc/Qqi0CM3rHXXYUfTUfZNhl0rQ+Yy2joxagczeDoVWvcw?=
 =?us-ascii?Q?pX3SO3Zw6s+bx1NolJEZo2LYjU/E9Td0oiCfPB9VIb8pHswt2rGNUrNHEE8c?=
 =?us-ascii?Q?Ud3jHOCML1BtxYQvzFzeskwHm7hC047+czu0GxqGnWLLqXXqIfwaIlrVzwUJ?=
 =?us-ascii?Q?ceVca/dusUv3Okbn7Gw4oCiPd6+2yWwDXmH+oKUOzztqpfZyBvSxqNhlNHF0?=
 =?us-ascii?Q?eWvMX+7mNT6G1RxoM90ZBwc8+QdG0mxvFP7ER7U2Q4g86G6j5saRoz75yJVS?=
 =?us-ascii?Q?GblDDZTCoekRndOUPux1NNAQh/Rv5azYUxJdizXLohExpdugIXLAGfcdFnmA?=
 =?us-ascii?Q?uNaehpuc4giy8uG4PT2AsJrmoOuXLfm3wN6T0ktOS5J7UrBSWpgG4VIwSHmU?=
 =?us-ascii?Q?m4gUvRH/heK1KJr1LB/KE4Mo//QF3Rnc2g/cv1Hl1TdfByIfxXMdUcd6mDDh?=
 =?us-ascii?Q?rPULSGoLMoirB8zxGSsb6ljkywN9+GdnBlNitXPZ42ex9h/fto68uoQKUSz7?=
 =?us-ascii?Q?awn2kZitV2auPHq1A3uEBFaD3SOUIE9wJgpHx/jVS9TOrdyFEzXp1Vgeeo2g?=
 =?us-ascii?Q?vvIVawxEwu6a6azbXpMaa75vxpgR7D2A96t2hXksu8HcjOgdUP2bJDYFJzxw?=
 =?us-ascii?Q?PeNK/leFaC4qEdNJcTyAV0FEUiK49UgDpG2yvE2VmfZJEzeArXs7Dya1rb0i?=
 =?us-ascii?Q?oAnpI3qdkmcHqQb/Xks9X1BlyGFacgceTm0cBDlAnUhqUCPDFb4ko1K5C2f5?=
 =?us-ascii?Q?McqUqkLcoaaOXdDSdZkH72+5CQRixbDMNz0Mizwn1eNcsg7QKDXvuQUFfCAO?=
 =?us-ascii?Q?MaQ9r2J4M0YwjIBcYi855GwJnKFZ+RUDXC1L7sONV2muaYCCB7OqAOIMgUQW?=
 =?us-ascii?Q?m8C9eSYi4kxhMfBKxJON6Fu6FiFTm6kB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nyw9zkDwON6RvDC3pR4YJkjkGf8NXQtDumLGsuPKgaNP1/ApC5MR8Ephbul8?=
 =?us-ascii?Q?+BGwg43MwkzS10uAf8P3UJem5YLg1qh/mrG1zSI0jmxceMV6XmE+JILfY1bS?=
 =?us-ascii?Q?B3Ua50wMATTPJLIUuCbr5Gjo7W+0uWRD/9ksQp6NOlnLlcPQEDyjVyM/CMU4?=
 =?us-ascii?Q?ZoU3q042JLYGQHuZL0TqC3P/bRMeDt3J3qY/NfwzY+tsArymM8VB3xAWZQ4N?=
 =?us-ascii?Q?ru0euVI+vokw7g13GhWUNLPNsh7kYlGypYM8GG+W8S6h4nc7bYxIthU2/BVM?=
 =?us-ascii?Q?1pP5Q3ib+G3ru5MUvnr4blFhf2RapB+Iox3I/S1uKemj8ukVTkNvyc54R/RS?=
 =?us-ascii?Q?mbABrYTNh9X5Vz9Ge7RsiYUuCYhhrYZdMZ22i7cDMPBNYkqplgUjKad0ykRm?=
 =?us-ascii?Q?Jsu5lgqt3VtSWLIYBW0AExluFFvbkkNpS3D59iTSDFZwiMJ5jyGE/+jIRvRp?=
 =?us-ascii?Q?/P0at0Hm5OG8YZApixGVd3aUMO+6pEhWwLCcryb+o14dDS7ZzaF6+lptz5Ty?=
 =?us-ascii?Q?dhWfgv3gPjXmK0ruF61F4YpGJdeQf5x03c/7biweCk/dUJuWthgcrjLuMMmn?=
 =?us-ascii?Q?qxqr2OiO7H4piD6WSY8a/FntQ20kJuAl+2RiRRniPRzd9/o1LAcBpDOlZFJL?=
 =?us-ascii?Q?QNYuXd28H9tulO8bbDdltiMXO0F9FebkNI6URc24PHOQf8cChRDBqVgPhDKV?=
 =?us-ascii?Q?YLmtwM7MjpXHfHGDDk/UQQ7pzm8uYaU3OgumLqA/5mAzq7Ih4Y0groy3GBy9?=
 =?us-ascii?Q?r3zjG5FIautBx8MUDEV0dDd4/D11SrvEB2oVukCGUNB081MDVP/lpIgndUrK?=
 =?us-ascii?Q?jLceeVY4OKZW2fdoxSjAwj4vqmdvfqAI2lm/PO/lL62A0Tc2830nFDF6gudG?=
 =?us-ascii?Q?PPaiA5upiMWtQp4OEKkHsXFCfapECBZ+6IrU7sFCljQAbUP1DGAtk1nASLDS?=
 =?us-ascii?Q?o4E4bwb1cQstx1qeaKs/xYByNb/gCgwSx7w8gu7bNg2jCQewqSKuKeXPAFnx?=
 =?us-ascii?Q?dGzsdFj22yhO4+rYZAtwL70cvVe6W+S+xBtZB+w13ktigtzWbeVTga0febZo?=
 =?us-ascii?Q?vmGbszCFaU4C/60ATue71DmDfdf+FvgnuUZjenRgLojavuZWtl788hsczInJ?=
 =?us-ascii?Q?iE6eIDRCD5nBHELiNVVBBLEO8lOyW1NxEXr10DmLY4crB3N5Mh+cF8Zqbzal?=
 =?us-ascii?Q?kukpaEOUrEh2FEIIpJ/F2Vs7HIK3/Zub/UEK1e14Lg1P7QBAgABwHDsMqS0d?=
 =?us-ascii?Q?xTmypI7DEQjKlvN6gDfbtmgWrexRiEZ9ZSEN8rbbpKy9gjDeCUz1w2KkNVz1?=
 =?us-ascii?Q?RQXstIjUtPGr5xdqsnppkVcK4ep+MjI/fnLkYZxV/J2Gxcfv7ykAy9jZ+hhC?=
 =?us-ascii?Q?0E+DNgCJXz/Ti7CcGwExft7TaBfePaVRjA5ZLYHa0S3tr8xrwODyrbM9uLt+?=
 =?us-ascii?Q?Y1ENCdmQAvsFsIElT2rzNv10gGzXcTUG3/ZOW99JjXgP9+TS9fidV0raIkXW?=
 =?us-ascii?Q?HsYzg7Jlu/VDKb2Zh68yQ939OKvyytfXrIupxbQBsQ1XASy0DoLERVIMwIgX?=
 =?us-ascii?Q?hl2Pc0MGEcUeCbBirfE1cFmP0ZgidIXkUB4slDPgNBK2TrlDF/VOzqUzA1AN?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 784f67d3-49bb-4ea1-1746-08de0c42540a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:26:55.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DITliFV9ZiYfwzVA/PVBquB6hX7UIX1TEayYt3lrV+Esv1L/8yz4TKaxFG59mAxjZW1M17YciYM+mpnUfQPHtU1N2FjeTMAVmQL2PUYgrag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

On Wed, Oct 15, 2025 at 03:06:18PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> The warning was added for a condition that never triggered even for
> platforms prior to Xe2. It's not supported in Xe2 and in Xe3p the
> register is removed from the main GT. Just drop the entire function as
> it doesn't bring any benefit.
> 
> Bspec: 62395
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> [ Drop the entire check for CTC_MODE ]
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

As far as we know, the warning has never been tripped, so (as we
suspected) it doesn't appear that this bit has ever been set on
production hardware.  Removing should be safe.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ----
>  drivers/gpu/drm/xe/xe_gt_clock.c     | 19 -------------------
>  2 files changed, 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 51f2a03847f9d..21c15441c4537 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -346,10 +346,6 @@
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> -#define CTC_MODE				XE_REG(0xa26c)
> -#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
> -#define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
> -
>  #define FORCEWAKE_RENDER			XE_REG(0xa278)
>  
>  #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 4f011d1573c65..00f5972c14dc5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -55,30 +55,11 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
>  	}
>  }
>  
> -static void check_ctc_mode(struct xe_gt *gt)
> -{
> -	/*
> -	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> -	 * platforms.  In theory it could be a valid setting for pre-Xe2
> -	 * platforms, but there's no documentation on how to properly handle
> -	 * this case.  Reading TIMESTAMP_OVERRIDE, as the driver attempted in
> -	 * the past has been confirmed as incorrect by the hardware architects.
> -	 *
> -	 * For now just warn if we ever encounter hardware in the wild that
> -	 * has this setting and move on as if it hadn't been set.
> -	 */
> -	if (xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC)
> -		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
> -}
> -
>  int xe_gt_clock_init(struct xe_gt *gt)
>  {
>  	u32 freq;
>  	u32 c0;
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> -		check_ctc_mode(gt);
> -
>  	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  	read_crystal_clock(gt, c0, &freq, &gt->info.timestamp_base);
>  
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
