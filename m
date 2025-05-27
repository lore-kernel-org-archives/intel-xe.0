Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12461C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 19:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33E910E06D;
	Tue, 27 May 2025 19:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gytNele+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8C10E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748373749; x=1779909749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ORPqldolKbcAoy25sndTDpT/GSSnk33iMFbDJuc9xlc=;
 b=gytNele+yh1mbS6GPWBgIaHJhSW9F80L2VgJDBW9F0pYBCvweRmbVnSU
 vPpHjjfkCRthhKp/qvpFh2uEcDJZIvqIU3TXW6h0GCZTfTlTHttIxu9M2
 uYudQ4QSKzJVNzTaEiwxhdCRL7rBjHoYGzcvRkKZb7pAbVU93ptE6LPTp
 eLectOWfHhdATjXsgpLPU7JT9MsKbP7Do+qe62WbHMNgtLqQlWAqtQ5zJ
 5wko+VgLY1jfLzivQQ7ncLT1C5YE/0SINNo5sylbk6D45I3qwHamPmTHd
 Ht3KlJIiduMVDy2HYebiB1+JkFhXjwOmaPgk4lmroU4w7op/QadbvfLtm A==;
X-CSE-ConnectionGUID: 820qvL1dRuq0HQP+sRZ1ew==
X-CSE-MsgGUID: AF4sur5ITIG/dz0/qEkihg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49491435"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="49491435"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:22:29 -0700
X-CSE-ConnectionGUID: sAbFhG8lQQGfe6hv5bZ4SA==
X-CSE-MsgGUID: 2GwOptlsTIiXUh01ez7+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143922131"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:22:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:22:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:22:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCZyArju6O2ABQUzz1VVOBLLJMcKMiO/Yos4pQWfOWbW3lkdCrwdCc2lJ/idEH558rBdi34RVigV15lo1fxQF8a//u7r6byd/Bt84be0xWVKe89ICoReC3xiYzg7CqRF6Q8ao4No5bncS37mqqi50ahQk7r6l4V6l7qA3JurQgo8LNpTKDRl2c1HOLk7XopvCPKdItKjEeQ0LH/gG33b2FCrdC1+3aAXwrpK4+gZCHY0ALoAPOid54TyQg4RuzB25v/9hAI3vXEalTUlUAQ3SLlYaT/0kMYhNUaIrpOtcmF8GJbWDvpYkm9uE/j9rcmJzzKTL0/D3S3RQuZCEPaAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORPqldolKbcAoy25sndTDpT/GSSnk33iMFbDJuc9xlc=;
 b=PvET4Cf/0L8He68j5tkRa8KS7fmKEdCAMcTGV0Q3pPaEwD+ICUp49SRQ6/GR69a1AaEBJnldipdtrZKdn86q0Uviwa7e+u1BHRKpFoRIhQ/IiOe7xsEtcaSH/Ml5rq9wqlj1nZf6EumJLx33nGHcPpZvWi3h02gBdG418nu6ap1mHbGfbh07gahCQw7qmeRuiNA8QvlZAmp7aSfpUXrcu3YBIoWf7Bs6s/IsoUpOX7B6tN0hWK/fntwOqPf3dWlMM36tNThiufVZtPvJCwocDwhe5+5dIbE7ooMSysggpyph7p0OnYiQo9/vIiZYumVNhcZS8OSAMK1e4Z2X2IMQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 19:21:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 19:21:54 +0000
Date: Tue, 27 May 2025 14:21:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Make xe_gt_freq part of the Documentation
Message-ID: <qbytlzc3eysjmfk3rfwbjlhdwysnpu3npw5e2kfop3rufft4tu@q2lqttzraehv>
References: <20250521165146.39616-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250521165146.39616-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e34dd0-8702-424e-9a51-08dd9d53bd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?++i3dc9mEXxhtNAPVbA7pIiUXIa4+x3hEk+kostRWG+ZVPrBds9m9aGU4j0w?=
 =?us-ascii?Q?Jmoll3mFM2vZ2hRfE0dLkp4WJdT9Dje5ZBtemXzU/e37Urxe1kK2u9DNyVwn?=
 =?us-ascii?Q?nA+Gup1wCosLsECG25qlq+VzDmUUTyaQ7zwMRQBxpdGXH9skmobsV6ijaTkW?=
 =?us-ascii?Q?aKm7crS8xDZVc5dfhP42KW5c+xePGrSZ1w+rv7MPDsT4Ob7USDBu9UBahJUx?=
 =?us-ascii?Q?uTeOI/sL9sU6yOhnOPQyuz9+Z/9WkqFAUmZUKA6aZKRwXUjM/I1jmlmBuWo7?=
 =?us-ascii?Q?GJr8K/DhxVuwWuC4bz0swIrI6IphfZNZqiVdwvImzms3YxsI4iHNjCMd8dXY?=
 =?us-ascii?Q?l/VzuWyTClFi0uRg6zBV64P+yUT3e16gX6VVunwJrQPH1tyGBBlnP2WZG0ma?=
 =?us-ascii?Q?i8/1i9O6UDzKg6bt83yvnwlfw93QKk06r0VtH2fJ+oL0gGtCGpRiGoMSZJvQ?=
 =?us-ascii?Q?pI3bj9cTONdqWZXF0MWRhev9QhBxYDdK9wZL8emeq2Ruj5L/Hk8SM9zl/krg?=
 =?us-ascii?Q?M11fTWHUAldUNsSNQS5IR4eiFpJBIhtNR9wqATgmcUQMSy8bOQBDAe9ZaHBe?=
 =?us-ascii?Q?zH2apmbK+ZWhDXpMm5Tx8/TRr7DJxqjxOpAhIXHNVjGW9iU8417/lwtYuW3m?=
 =?us-ascii?Q?HZ65shBL7ZBLak35dlkjytF7yMguvAne0L+IEDn+JOQyM6DF5y89fhSTvxWv?=
 =?us-ascii?Q?W80eaAGNpupP1KgaeMVqXLeHwILhe3XIWb4iu4r5Oi2mtwP/qiu+PfP2L1BG?=
 =?us-ascii?Q?JCciQ40ircwTpTLF/vM3qZDO1gy1xannZi70OJrfrdDOmgNWDvHEqOOrLNJ0?=
 =?us-ascii?Q?RGG4Xxy8yETuLbd4io56tzCrarzXuAlRbRXI93e+NEt2vJmhwg3vYkNNqrZW?=
 =?us-ascii?Q?Np9gEe4LD695s+mX3pLBfkJjmlytUz5gTSNP54c4J0odkbBLLhysJEp35HHr?=
 =?us-ascii?Q?WrB5EaVOSOVZghc58b1uVnHjua4BCZ47d9WNGGc5cKjL/qsy72Qg/KE0qGYB?=
 =?us-ascii?Q?CB1P8uXpjy5h3Uon6yM4crMcV9RH7rcSk7zwZOx60nbvsx2wB9Dq3O886iyG?=
 =?us-ascii?Q?ikLD/+ZrZrG1YUdSUg+fyZpzRE4s7+Wu80ksKOGSEt8KjAiXOAYhNsxVHCZy?=
 =?us-ascii?Q?Tr/bya7gPcCmsmu9FYSH3N8foiKhFceuHyyx7lwZnB9SpVq8VxuAVBPhsyyh?=
 =?us-ascii?Q?BrSyR5gKwk8j8M4a7R8j6ebAmawzpQ5sJ51e1mhh//daBH2IDxabn3fjalJI?=
 =?us-ascii?Q?RL6hBuVmfyGMLYVfQAXhugpGgCsYfMrwsk44pjqRm/N+fXDS6mUsLwU8xGHI?=
 =?us-ascii?Q?vnGTcN1syHhSHdLz7yksgGGvQiTFHs3xEnOr+UqKn6UmS7kz63tExJbV1NjU?=
 =?us-ascii?Q?GpnTPUheKnsUjxLUiOYTq+Kr9tXdd0eLc4+ACDN/RNJqS7MQvAQUwtOzpP17?=
 =?us-ascii?Q?O1sM7b4xOd4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0c2AMp/n+tNm1h/uS8a6+gwHg/cStF6OAYaJanabuTmPipoyBtkUM+3s4FT?=
 =?us-ascii?Q?arYoXYVvM3SbdvtnB8zPQKNPVyoD90LkohqGNqLcZ0H4kNIy0asTex5mDQN0?=
 =?us-ascii?Q?+xc/H+ht4f+kysHKNpJZPi/clJnLkUt5ZnWk9EPzOOKPxYlCGxINAz7q3LY6?=
 =?us-ascii?Q?Wlvi5a/fgS/9iuDsbHaurmjC5GmbOz3/EZQtnkB2X9dp9bXZKzB1SViJSAmx?=
 =?us-ascii?Q?TF9e88E7nkw1XpsjKJUKYrxKE+ZK98pXuP87UGV01lmaKDkgIPnhEIi5LsS5?=
 =?us-ascii?Q?zz8jqXM9rlgoNq2fNerov6Fa/nTSEd8GsI1SG6M3NRCqox8yjloAIPWkVeMN?=
 =?us-ascii?Q?uZ51SreElGwv+mUL1TdjiCtOXOhRvjqpn3UtRfPrc8Or4hHIIr7T3cKKs0hs?=
 =?us-ascii?Q?9L06LER6mkUdGkiBJ5mvB3YeBhtt/ocGaE7e221GqXzLEKCoFJRJ0IrlRM0m?=
 =?us-ascii?Q?zVG5FiTSqO/4rfP6r6IGBT8nXs0+ICCAy2ycVdRfkTQ/2GrYAxHhyWOBNg93?=
 =?us-ascii?Q?xyNvPDB+M3nPd0i3K43z5OzGGeI81pYQcUhkkDifJzfjoHu8V1t86d95BXSe?=
 =?us-ascii?Q?8+1unaCr6EPe7rfEWRgagTxfVtHKjyNdVys7jl+kOy5Thq592106FVth9q1C?=
 =?us-ascii?Q?YOtIOYtNoUx7uw3pgM8uqNmQAQE9VQ/TMfrmW85H9+x1/gDSWRW/srd3x621?=
 =?us-ascii?Q?ETX1lPZynOYX/fjDCkwwz/kgiLye3ZeL2pVcRF5FdBFcXM8nk2wmwNnhICgd?=
 =?us-ascii?Q?GqTOdGbtqw9lZrvBzjEfH+C2TLDw6ghchXoPiZS6URVs014lX6jo/3ynHh4L?=
 =?us-ascii?Q?YMM6sI3KJkC6bCn2pON7oyA1vC+KV7x36nrBSa4MDq2nQSttnp4Jtmh61mys?=
 =?us-ascii?Q?2bweUnPsTmdKjREvmKOM0OxcH7hjwoawR2aO2eg4gbT/TKhBf1UBi7V7H/h9?=
 =?us-ascii?Q?FpAtOkAbgy70Goq/tUlIVmWL6/jeIBcg3VpgJcZUgS66RQH6/qhUfOAdvA4C?=
 =?us-ascii?Q?O/gfpzxUP1sSUV5+HoB3BUJ41KfIHgj/I9QL7F+4ZsefAd/n1+i9M06TdyZF?=
 =?us-ascii?Q?y10nrxhamho6S/ClZ2jCG2ZEk94Pbfu6eTS4t2IwV0VNIY7zGtZZHNHZDcaT?=
 =?us-ascii?Q?ebJVT92Um6D+BAWNGTkyH0y2lZNYTq8q1TSNEqqvNpVyVtmr0nZf44JFOiAE?=
 =?us-ascii?Q?zYwdAbNbTjizPotMDzsalcw4nIowe6cwMP2p8RANtHnLMZSmcRxjmO0dNzse?=
 =?us-ascii?Q?cB6QwqdzfmC/NPiXA6SDrTS6uvlkUZvD/lHycTgMI9QRl49uoCbtohebpeeQ?=
 =?us-ascii?Q?R1BNT9RCFYnXEtNt9nLzbgR/R73ZEpEjSjAfGuG+xB/NyXu5hyLf3n48zIT8?=
 =?us-ascii?Q?WZI3hujN3/FEJb8S3Cx8B2CIkozoNSgk2Umm6NGHcFWSgff7LpNGDIBuD08w?=
 =?us-ascii?Q?rqgypaWFfvH9LD9ZH2NVospzXgMKSmpNNUNKNH9MKDmfP2Ql2hx+0WZaGS8R?=
 =?us-ascii?Q?s5MxqYTuvb7Ydku/aEQowk8lSorcZo8uebdrhEg9y0eo5oDDw6Zj+sUNkIZe?=
 =?us-ascii?Q?TjqSb6uy2Ftemmp7sNufyQcoDPa1ytFypK6dYVssLMHs0oUg/p4VlHwnIquY?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e34dd0-8702-424e-9a51-08dd9d53bd7e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:21:54.4827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fD0BhITFz144LQOVl/TotnisISmD9fbAyUhCCTHiFlGIcVBPnYVOHPYp89irm0tYOxJRPLEVD3vDcirihroG9mdHTy+EDIWT0Jx3KBPhdZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On Wed, May 21, 2025 at 12:51:47PM -0400, Rodrigo Vivi wrote:
>The documentation was created with the creation of the component,
>however it has never been actually shown in the actual Documentation.
>
>While doing this, fixes the identation style, to avoid new warnings
>while building htmldocs.
>
>Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
