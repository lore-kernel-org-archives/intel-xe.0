Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA491E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 23:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22910EB60;
	Tue,  7 Jan 2025 23:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFmy5pww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D010E356
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736291637; x=1767827637;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0161jC/MWs/tvPod1gyvSxooNPboQROuSlrQbqFcnfU=;
 b=aFmy5pwwBg7Hygw/sL2Xbd5m2tglSm3hHdILsh2lWBJTZ9Gsu3wPW90D
 ni4KuLt0KfmJ8X5aX/DbkmKN/qkqM5cLoVu9zQiNzXvXQhrgrWX6aYKN9
 KZXw/5zJPZVO3CXpeacev2YGnGIMwMzikQafeRznXRjaINI2IbIU+Z0WG
 vCzlpiXfA7o95dOKgA7+lFZYDszoOaoCivUhOxAwGhvaLkeS5QRww73F2
 NXODAZoog2PNG/FRiWsA8WfP6xJ5f3+Fjv/uSfx5BDA3SKggRNKRx+r4K
 l0jcZwP6mTeIYoxKVsCNeRusVZAwFoEPyz9JUsZcidr20YrWPgVmqg0hu g==;
X-CSE-ConnectionGUID: YSSLVLsrSD++7JQvst5F4A==
X-CSE-MsgGUID: CfBC3ycoR3SDdGTlD/crQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36661678"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36661678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 15:13:57 -0800
X-CSE-ConnectionGUID: JqT404qgQZeHexNl0bA/ww==
X-CSE-MsgGUID: CVnZfe4lRRq6xHtw8HWfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107539331"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 15:13:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 15:13:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 15:13:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 15:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4AKVdS/LrDOEA9x6fIi3SE3oVPAVhNrnFdhJX+ZBMgmDb4u3smvAxG3puKxUqHsnoNRzBz8ti/GHorhOG1vp3ltjRZLM8iLOS7boLrVn1SfFPckMrH6ZdYNiqqTqQ1ZiGWk0PTytjqILoWyc7jXQ7hSJfFyVFCxCLrqNsUrQbjIuVDuumjIHynhaookJYZztzzek36UCtgwlPY8YmfbBWt6JelqkQ8qz6Qx8n4hYqcoU+RnmMjtbjyw7htKpDFRVudCgvWzsxoFeix1UYJqTC9mVUgxvWIOqstmkmp1OeOzCFfmM5TuOAmTSsFTryIf9hhwPSE2cguGzjAHJHjibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff5ZwmJ5U6Y7PCA5F3T8gvmmLxmv91912z3TH0IYUas=;
 b=S/q5iE54aX34kYqqtJ4m2onRUmKE+4pI0DOLFGsTx2RtB2Cwip1VZtoYCQEndyqt+/cUMqlJOBQv5fEGznLTmmIcpQW0RPyDjPGd8SHm0MvE6GUKuKvyRfyLjauE4vhFMz0GSQX6aOs+Y+4sPP9L73M3Zqmi8WXQ2NSKhq0cz2yc2+n2x+HVwhl0obdWM/WhliN8qACGLvdsV/cgfP2++eb5MjPY3QjbKTfTCfRUTtqcwPg5zRJ6Bntk2UxIcx0LGD4z3hMis/7mto1LMRsXBSPed5+6glMuZsB1Lu6TKYGqECogijUypJ37X2B/w3ysGMbcezX+vpR0O/Ni8slPLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 23:13:08 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 23:13:08 +0000
Date: Tue, 7 Jan 2025 15:13:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/vf: Don't check has flat ccs in bios on VF
Message-ID: <20250107231305.GA3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
 <20241211064211.781820-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211064211.781820-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d17757-13d3-424d-94ec-08dd2f70d90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PhmxK7mtCM0P1rYo1zQa4FWN4wPMbuXYOPJ5Mxop6Pft0V/NXV9NhmNCw1?=
 =?iso-8859-1?Q?i6QT1RutVGJf3k/EXHNYb66ekRmEnvzEwaeKiLiYZ3JmkqomxdIGF2Su1I?=
 =?iso-8859-1?Q?6vxTFKKx/1pbV8s/HyIr4yQdfWAetZuh997d8lRS9+nQkp3vFIMSQmckmm?=
 =?iso-8859-1?Q?634c3oIzfd6UuYoO5Rjg3kDAIyACfac4l2Mi2EYPouO+ptoMBlEiK1qDX2?=
 =?iso-8859-1?Q?vrvIE++fJoQxs8YYuiLvaYOnWgffQ3Mm26DpfDb5CfDvMURHIlqH8RBYNL?=
 =?iso-8859-1?Q?ggsmOaW/4ibLivgAnK2Ok7BM7Bg2S7Gf1cXf1PGCivX1hnJmkyuq4P3YCh?=
 =?iso-8859-1?Q?6fxSBw/mCbUQBsYvDRL4O7LgU2t2RK2n9IZm/DKprOucBWVtqe0gBSFdLC?=
 =?iso-8859-1?Q?iIYC8JPFR2Gue2uRHTtleOiCZxNdiHEHpjb0RrOdJBpuG+ZP6ZQN8k0fAI?=
 =?iso-8859-1?Q?IYgE11PfuoEs0fXm9ooDk0lv73vJRWsaUzrUTaztHNsTfQHNqOYdiU+Wl+?=
 =?iso-8859-1?Q?GjbmDc3n7RihjorImTC7tGPlqyXhULetcJDQLkSb7w+hSjj/jyyJQg06HT?=
 =?iso-8859-1?Q?qk4Y3UN0P9V5wDG9xGY9wvl2MjW46QG2H4+9WfydRHGKBuA/6h9uJSYLM0?=
 =?iso-8859-1?Q?bWBQRz2FWpW9lJpLXUfxy/ShKYmqL6ltqsqzAx/p4hf7jc0+i3v/cUWdS4?=
 =?iso-8859-1?Q?W0IYcjjk10xYNI6BCxRn1RC4SWTOFrTSouQEUDuT4dirFRaWLooCkMPjTJ?=
 =?iso-8859-1?Q?VlmZz7Ft3z9P1ZSziDhynCljqnUHEovSr8B/fWOpohksLsrTdydAj+9yND?=
 =?iso-8859-1?Q?KKPF+sspFk/dQZ/yTsbtRcHh9ik25aZx5TR158qRe/UHzKjAJPr6anKbq2?=
 =?iso-8859-1?Q?DkXH+RwQjrRjaynolSa/3TYbyBRHsZ+ruwKxhZUfTJCIxB+hqphoHEu3CT?=
 =?iso-8859-1?Q?Ft3XFoxJaEq3DZroXLnAjO3etbVodWW99HM5LkPhiq71ze3y/lCAqRV3Pe?=
 =?iso-8859-1?Q?jM7XYH1l91WvCyOhu0zBMror6Qg9qghQgXEaaLZNtG4LKhf44TGnb5F0G0?=
 =?iso-8859-1?Q?kxdom+TJFu0T32joQxUSaW9v+G3oqMdbx44FskY7SzwuvX+mDwGL+iHImd?=
 =?iso-8859-1?Q?Um/LrG7I0S+qw7dKnXwUDCzUWSKrjhpZwN4fkxC+mVgPRv1vsEbOw1EAim?=
 =?iso-8859-1?Q?elf89djUlWZs5wsBw/qupicrKq5l1pr5vCUlgR6pSl6DPTtYdBZnwh/6kg?=
 =?iso-8859-1?Q?bdT7xmTYTG7C4WvDB+I8cnoCxzNwvPL29xxAzebv6ZTgrvt4f7vyjjvGQV?=
 =?iso-8859-1?Q?pkNTin/0rfGCg2gmXRAC81RWd32ZtfBK7XSrexgSF2vivenQ4x6nTo6RtU?=
 =?iso-8859-1?Q?/pFKasBi6galweYlYmQx9JSCOgh8gr2G7VmIWPeg0E71EtnX0sO5fAZcQp?=
 =?iso-8859-1?Q?s8UqwDFRqw45LCmF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xCIjayPwNhyFyvLFgWQRm3vEP3i0+7YVOG1cb1BWfbo3iPDkw48WBgfwZq?=
 =?iso-8859-1?Q?R6/aHXU5mzuceWE6PVmD+nlIjVd3Sm8QQlElxG+DIlrxdxh28MLUOUFxe2?=
 =?iso-8859-1?Q?ey3KIP9yrbDjbg9ue8k/RSJG7V4iWYSPFtKsGCJDoqhnlT1xjGTF5Z26K6?=
 =?iso-8859-1?Q?Zs6wHvMO+BPlcWFDECbg+MwhQe6S6ic5xe6ExfPDBOFzNw6cp9VENx71Zv?=
 =?iso-8859-1?Q?15ZOhIl76/GobW+Uq/3uJbqtvHFsTfbf1iLcw/j8uyBdzi8XNgFNRAYn7M?=
 =?iso-8859-1?Q?b/qdR/uheK3nge59jbFwcV/MLi8E2K/85d6RpjFu+nD6NIrURkA2u29KPH?=
 =?iso-8859-1?Q?k0TCkyGYVLnsPPsrM5HyQvXs4reWtpO9VZGhs9BlI63yfZeP8NPU0hq8GJ?=
 =?iso-8859-1?Q?/NoNMg1lQAteA6Q/Q1ie/QkMkp/eI0pJJ7qD3s7Aesdbvd4YFWJRkqjj/Q?=
 =?iso-8859-1?Q?VxIymqzrz1P1dE6YaESI1+jJiTuukttCx180hlGIcZRXrCoyU7imndQya4?=
 =?iso-8859-1?Q?oYmudDwhKxctU1FALKY4sU2aE87WC7uoujcL5C0h/FkIWty/Tx5QfiybXc?=
 =?iso-8859-1?Q?G+RdDRJjXsP+9W0tV/cP2ReEqZfVs0d5flg3thDfoByZKY2J/ofzgkF5fw?=
 =?iso-8859-1?Q?K97iUXayzVzBGWgwntLAQ46cm5geBG7X21fhFrvZDFqHVg8CECNAdQlbz/?=
 =?iso-8859-1?Q?JRx4rpR75vyEfJSl+zn7eCRxDM2oGIcy4f1Cd67l6nJjKmTWcu5xY2XAkM?=
 =?iso-8859-1?Q?LYwjl2SU15mtGnH36nBCFsN9Z5qQQhdCkLi5cBHKcpqAOv4DFSh/SsO8bn?=
 =?iso-8859-1?Q?ss0M6mEqDQu/Fv6ZoMNgu6M7FHlYKSrZr6AlHhmQ0bcx+h+gOxaEtXvU5I?=
 =?iso-8859-1?Q?+GfJHI6jJosofvNSMY3YjCJR29mD7Wt47ONeiZKWga6OD/OWlpL4R3qyJg?=
 =?iso-8859-1?Q?1QD/hEzjVIyr1XsQy42KEVNH8Pa1dkYnXUoksqa4SU8JVv3EbmSkigabUe?=
 =?iso-8859-1?Q?kQVAIGP8DkDrBy6s3od3ywy+2q3o7rIJVtDU6/7xj3VmVU2Px6oAkDq1LL?=
 =?iso-8859-1?Q?XhemX5OLPRkDTuJ21URzhtawFVFeGD+LCp4v5kH2hZcmP3f/FBMUUZ0fh8?=
 =?iso-8859-1?Q?N0ULR1NXjA6Ty1pw8dmqvq2y/zbfbj2SBhMdUuRaM+CjI3BmWwA/GH51im?=
 =?iso-8859-1?Q?q7fkjxfUJdns4gJWXadwKC3I13Jr/HBDGxpUTaO6rQ0nhToz9brmFjEnlP?=
 =?iso-8859-1?Q?qLpHuEEIcY7w7Mvw81CytV+hAhVIM4WQMM71rCacNQZUqAwCv5m4LlE1ak?=
 =?iso-8859-1?Q?Zmd9WMC69rWeh79g0m5S1mstHoKJKw+Z3X5JH48k05Y3GX2eOaLpEhPTqj?=
 =?iso-8859-1?Q?cIt7ToSduHi2knLXB4bTWTFL0GneFl4gYV7dT4E+Qvc+SPQVt3rIDSa6Iy?=
 =?iso-8859-1?Q?dyqBwzzO0QtKYn4OLUsBxthqLelSts71SXQD/9BEKxPkOjAJ9GHNOz8+s4?=
 =?iso-8859-1?Q?1V+TjPfJyamkGwHzlog5fBxz8kNwfG5ZWrN74QAYFbGl85yS3MOqa9q+o7?=
 =?iso-8859-1?Q?Spg/p6jSdCXZKLNktQrcdTuKW04dzu0KX245eZnXj+MC0CqdaiSiIHfelI?=
 =?iso-8859-1?Q?DSMQ0EEy1G6XXW7TbLv97sfLoRWp7s63ot1Q+v8YvlaZmf8kaekunD8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d17757-13d3-424d-94ec-08dd2f70d90c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 23:13:08.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zY8Ae+SH31C3sWPc5u8Na2TLYBxcnyYLUMCN5ZvjAKnzFcCoMQw9aj/8sYW8RRT9+oGls0R1NU99ou+29SppBLyel4uEqpUSfNzuHyn3vRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
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

On Wed, Dec 11, 2024 at 07:42:09AM +0100, Marcin Bernatowicz wrote:
> From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> 
> Don't check for flat ccs from VF-level as VF does not have direct
> access to the register.
> 
> If the BIOS disables FlatCCS support (a use-case that will nearly never
> be used) and the has_flat_ccs flag is set, there shouldn't be
> any functional impact. The hardware will drop writes to the CCS region,
> and reads from the CCS region will always return 0.
> For the native case, the flag is disabled if the BIOS disables
> it to avoid unnecessary overhead in buffer object (BO) creation
> and migration.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 56d4ffb650da..ec0ea9c914b4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -604,7 +604,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>  	u32 reg;
>  
>  	/* Always enabled/disabled, no runtime check to do */
> -	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> +	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	gt = xe_root_mmio_gt(xe);
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
